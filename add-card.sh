#!/bin/bash
# ─────────────────────────────────────────────
# add-card.sh
# Adds a new card to ali-reference-docs/index.html and pushes to GitHub
#
# Usage:
#   ./add-card.sh "Title" "Description" "🧠" "filename.html"
#
# Example:
#   ./add-card.sh "Bedside Dyslexia Screen" "Phonological screening tool by age group" "🧠" "dyslexia_bedside_screen.html"
# ─────────────────────────────────────────────

set -e

REPO_DIR="$HOME/Dev/apps/ali-reference-docs"
INDEX="$REPO_DIR/index.html"

# ── Args ──
TITLE="$1"
DESC="$2"
ICON="$3"
LINK="$4"

if [ -z "$TITLE" ] || [ -z "$DESC" ] || [ -z "$ICON" ] || [ -z "$LINK" ]; then
  echo "Usage: ./add-card.sh \"Title\" \"Description\" \"emoji\" \"filename.html\""
  exit 1
fi

# ── Check file exists in repo ──
if [ ! -f "$REPO_DIR/$LINK" ]; then
  echo "⚠️  Warning: $LINK not found in $REPO_DIR"
  echo "   Make sure you've copied the HTML file there first."
  read -p "   Continue anyway? (y/n): " confirm
  if [ "$confirm" != "y" ]; then
    exit 1
  fi
fi

# ── Build card HTML ──
CARD="        <a href=\"$LINK\" class=\"card\">\n          <div class=\"card-icon\">$ICON</div>\n          <div class=\"card-content\">\n            <h2>$TITLE</h2>\n            <p>$DESC</p>\n          </div>\n        </a>"

# ── Insert before closing </div> of card grid ──
# Looks for the last </div> before </main> or </body> and inserts before it
python3 - <<PYEOF
import re

with open("$INDEX", "r") as f:
    content = f.read()

card_html = '$CARD'
# Insert before the closing tag of the card grid
# Finds the last occurrence of </a> followed by whitespace and a closing div
insert_marker = re.search(r'(</a>\s*\n)(\s*</div>)', content)

if insert_marker:
    insert_pos = insert_marker.end(1)
    new_content = content[:insert_pos] + "\n" + card_html + "\n" + content[insert_pos:]
    with open("$INDEX", "w") as f:
        f.write(new_content)
    print("✅ Card inserted into index.html")
else:
    print("❌ Could not find insertion point in index.html")
    print("   Open index.html and add the card manually.")
    exit(1)
PYEOF

# ── Git add, commit, push ──
cd "$REPO_DIR"
git add index.html "$LINK" 2>/dev/null || git add index.html
git commit -m "Add card: $TITLE"
git pull --rebase && git push

echo ""
echo "🎉 Done! Card live at: https://ali999774.github.io/ali-reference-docs/"

# AGENT.md — Ali's Reference Docs

> Context file for AI agents working on ali999774.github.io/ali-reference-docs.
> Load this at the start of any session involving this project.

---

## What This Project Is

A static HTML gallery of reference artifacts and tools — agent team rosters, tech stack diagrams, clinical tools, and configuration references. Hosted on GitHub Pages, deployed from the `main` branch.

- URL: https://ali999774.github.io/ali-reference-docs/
- Repo: github.com/ali999774/ali-reference-docs
- Local: ~/dev/apps/ali-reference-docs
- Hosting: GitHub Pages (branch: `main`, root: `/`)

---

## Tech Stack

| Layer     | Technology          |
|-----------|---------------------|
| Pages     | Static HTML         |
| Styling   | Inline CSS          |
| Hosting   | GitHub Pages        |
| Deploy    | Push to `main`      |

No build step. No framework. No dependencies. Pure static files.

---

## Artifacts

| File | Description |
|---|---|
| `ali-agent-studio-map.html` | Agent Studio reference map |
| `milestone-practice-os.html` | Agent roster for Milestone Pediatrics |
| `milestone-studio-org.html` | Simulated 10-person studio team |
| `milestone-studio-org-2.html` | Updated studio organization chart |
| `Taskmatrix.html` | Task Matrix reference |
| `color-palette-explorer.html` | Color palette reference tool |
| `mm-tech-stack.html` | Morning Momentum tech stack |
| `morning_momentum_tech_stack_interactive.html` | Interactive tech stack diagram |
| `dyslexia_bedside_screen.html` | Phonological bedside screening tool |
| `exec-allowlist-reference.html` | Shell command safety tiers for AI exec wrappers |
| `index.html` | Gallery homepage |

## Adding New Artifacts

Use `add-card.sh`:

```bash
./add-card.sh "Title" "Description" "🧠" "filename.html"
```

It inserts a new card into `index.html` and pushes to GitHub.

---

## Agent Rules

- No build step — edit HTML directly and push
- Push to `main` deploys to GitHub Pages automatically
- Keep artifacts self-contained (inline CSS + JS)
- Run `add-card.sh` when adding new HTML artifacts
- No spaces in filenames (lesson learned from `milestone-studio-org%202.html` bug)

---

*Last updated: May 2026*

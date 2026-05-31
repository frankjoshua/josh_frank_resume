# Resume Refresh — Design Spec

**Date:** 2026-05-30

## Goal

Refresh joshfrank.com and produce a sendable résumé. The original site read as
AI-generated (fabricated "+X%" metrics, generic "mobile developer" framing, a gimmicky
terminal UI). Replace it with two clearly-separated artifacts:

1. **A personal site** that reflects who Josh actually is — *"I build robots and create games."*
2. **A professional résumé** that carries the job-search pitch (agentic AI + mobile),
   linked from the site.

**Trigger:** a warm job lead (Presage / SmartSpectra) whose rep was impressed by Josh's
*use of AI agents*. The résumé therefore leads on agentic-AI capability.

## Architecture (final)

- **`index.html` — personal site.** Light "editorial" aesthetic, mobile-first,
  robotics-forward. Robotics, Games & Apps, and an "Agents + Robots" crossover. A one-line
  "by trade I'm an AI & mobile engineer → résumé" routes recruiters to the professional version.
- **`resume.html` — professional résumé.** Print-optimized, one page, ATS-friendly.
  Agentic-AI lead, mobile foundation, serial-founder framing. Linked as the primary CTA.
- **`resume.pdf`** — exported from `resume.html` via headless Chrome; committed for direct download.
- **`styles.css`** — editorial theme (shared by the site).
- Removed: `terminal.js` and the interactive terminal (read as gimmicky / unprofessional).

## Aesthetic

Editorial, light, warm. Fraunces (serif) headings + Inter (sans) body; warm paper
background (`#fbfaf7`); deep-green accent (`#20684a`). Mobile-first, verified on a phone
viewport. The résumé matches (serif name, same green) for cohesion.

## Positioning & Voice

- **Site = personal.** Robotics is the star (hobby Josh loves) — his ⭐63
  `rosserial_arduino_lib`, "robotics as code" (ROS2 + Docker + Ansible), the St. Louis Science
  Center Mars Rover exhibit, robomo.club / St. Louis Robotics Association (president), hardware
  & firmware. Plus games & apps.
- **Résumé = professional.** Lead: agentic AI — *builds the tooling agents run on* (MCP
  servers incl. `docker-ros2-mcp-server` connecting agents to ROS2 robots; `agent-canvas`;
  ccbot contribution) and *uses agents to ship fast*. Foundation: 15+ years mobile.
- **Self-taught**, home-schooled, no formal degree — stated confidently as a strength.
- **Serial founder:** Tesseract Mobile (2008–present), preceded by TechCentric (~5 yrs) and
  Archway Technologies (~4 yrs), folded into one "Earlier ventures" line **without early
  dates** (keeps the age signal down; he's targeting employee roles and worries about
  looking old). Framed as a hands-on builder, not "career CEO."
- **No fabricated metrics.** Real, true facts only: 5M+ downloads, Solitaire sold in a
  **seven-figure acquisition** (exact price omitted by choice), MonAI 100K users, ⭐63
  library, 136 public repos.

## Decisions Log

- Title: **AI Engineer — Agentic Systems & Tooling**; tagline *Self-taught · 15+ years
  shipping mobile products at scale.* Kept "15+ years" (true floor, reads senior without
  broadcasting an age).
- Résumé format: a print-optimized `resume.html` + exported `resume.pdf` (no build step;
  fits the vanilla-HTML / Firebase stack).
- Style: Editorial light (chosen over a minimal-light and a refined-dark mockup).
- Robotics: lives on the personal site, not the résumé headline.
- Solitaire exit: "seven-figure acquisition" (exact $ figure judged TMI for an
  engineering résumé).

## Content Still Open (non-blocking)

- Talk venues for the MCP (2025) and LangChain (2025) talks — currently topic + year only.
- Robot photos — comment slot left in the Robotics section for later.

## Tech / Deployment

- Vanilla HTML/CSS, no build step, Firebase Hosting (project `resume-4f8c2`).
- Push to `main` auto-deploys to the live channel via GitHub Actions.
- `resume.pdf` regenerated from `resume.html` with headless Chrome whenever résumé content changes.

## Out of Scope

- DashFox — in progress, excluded by Josh's request.
- Per-employer résumé variants.

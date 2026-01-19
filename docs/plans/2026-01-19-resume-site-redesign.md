# Resume Site Redesign

## Overview

Replace Flutter game-style resume with a mobile-first, vanilla HTML/CSS/JS personal site featuring a hacker/AI aesthetic and interactive terminal element.

## Tech Stack

- Vanilla HTML/CSS/JS
- No build step
- Firebase Hosting (existing deployment)

## Design Direction

**Aesthetic:** Minimal and clean with hacker/AI vibes
- Dark theme (near-black background)
- Terminal-style monospace typography (JetBrains Mono)
- Subtle glow effects and scan-line overlay
- Green terminal text with cyan accents

**Color Palette:**
- Background: `#0a0a0a`
- Primary text: `#00ff41` (terminal green)
- Secondary text: `#888`
- Accent: `#00d4ff` (cyan for links)

## Page Structure

1. **Header** - Name, title, contact links (GitHub, email, site)
2. **Hero** - Interactive terminal
3. **Projects** (featured) - Tesseract Mobile & GitHub highlights
4. **Experience** - Work history timeline
5. **Skills** - Tech grid
6. **Associations & Interests** - Brief section

## Terminal Interaction

Commands available:
- `help` - shows available commands
- `about` - displays bio/summary
- `skills` - lists technical skills
- `projects` - shows project highlights
- `contact` - reveals contact info
- `resume` - scrolls to full resume

Auto-types welcome message on load.

### Mobile Adaptation

Mobile-first design with tappable command buttons instead of typing:
- Terminal display shows output
- Row of tap buttons below: [about] [skills] [projects] [contact]
- Same visual aesthetic, touch-friendly interaction
- Desktop users can still type commands

## Layout

- Mobile: Single column, stacked sections
- Desktop: Expands with more horizontal space
- Large tap targets on mobile
- Contact links prominent at top with icons

## Animations

- Terminal cursor blink
- Subtle text glow on headers
- Smooth scroll between sections
- Hover effects on project cards and links
- Optional faint scan-line CRT effect

## File Structure

```
/
├── index.html          # Single page
├── styles.css          # All styles
├── terminal.js         # Terminal interaction logic
├── firebase.json       # Updated for static hosting
├── .firebaserc         # Keep as-is
└── .github/workflows/  # Simplified for static deploy
```

## Content Source

Resume content extracted from existing Flutter app (`lib/constants.dart`):
- Joshua Frank, St. Louis, MO
- 15+ years mobile development experience
- Tesseract Mobile founder
- Projects: MonAI, Ultimate Grill Timer, Infinite Evolution, Solitaire Free Pack (5M+ downloads)
- St. Louis Robotics Association President
- Chess expert

## Deployment

Keep existing Firebase Hosting setup, simplify GitHub Actions workflow to deploy static files directly (no Flutter build step).

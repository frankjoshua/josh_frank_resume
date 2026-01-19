# Resume Site Implementation Plan

> **For Claude:** REQUIRED SUB-SKILL: Use superpowers:executing-plans to implement this plan task-by-task.

**Goal:** Build a mobile-first, hacker-aesthetic personal resume site with interactive terminal.

**Architecture:** Single-page vanilla HTML/CSS/JS site. Terminal component handles command input (typed on desktop, tapped on mobile). All content statically embedded. Firebase Hosting serves static files.

**Tech Stack:** HTML5, CSS3, vanilla JavaScript, Firebase Hosting, GitHub Actions

---

### Task 1: Remove Flutter Code

**Files:**
- Delete: `lib/` directory
- Delete: `android/` directory
- Delete: `ios/` directory
- Delete: `assets/` directory
- Delete: `web/` directory (if exists)
- Delete: `test/` directory (if exists)
- Delete: `pubspec.yaml`
- Delete: `pubspec.lock`
- Delete: `analysis_options.yaml`
- Delete: `.metadata`
- Keep: `.github/`, `firebase.json`, `.firebaserc`, `.gitignore`, `docs/`, `README.md`

**Step 1: Delete Flutter directories and files**

```bash
rm -rf lib android ios assets web test
rm -f pubspec.yaml pubspec.lock analysis_options.yaml .metadata
```

**Step 2: Verify only deployment files remain**

```bash
ls -la
```
Expected: `.github/`, `firebase.json`, `.firebaserc`, `.gitignore`, `docs/`, `README.md`

**Step 3: Commit**

```bash
git add -A
git commit -m "chore: remove Flutter code for site rebuild"
```

---

### Task 2: Create Base HTML Structure

**Files:**
- Create: `index.html`

**Step 1: Create index.html with semantic structure**

```html
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <meta name="description" content="Joshua Frank - Mobile App Developer with 15+ years experience. Founder of Tesseract Mobile.">
  <title>Joshua Frank | Developer</title>
  <link rel="preconnect" href="https://fonts.googleapis.com">
  <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
  <link href="https://fonts.googleapis.com/css2?family=JetBrains+Mono:wght@400;700&display=swap" rel="stylesheet">
  <link rel="stylesheet" href="styles.css">
</head>
<body>
  <header class="header">
    <div class="header-content">
      <h1 class="name">Joshua Frank</h1>
      <p class="title">Mobile App Developer</p>
      <nav class="contact-links">
        <a href="mailto:josh@joshfrank.com" aria-label="Email">
          <svg class="icon" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2">
            <path d="M4 4h16c1.1 0 2 .9 2 2v12c0 1.1-.9 2-2 2H4c-1.1 0-2-.9-2-2V6c0-1.1.9-2 2-2z"></path>
            <polyline points="22,6 12,13 2,6"></polyline>
          </svg>
          <span>josh@joshfrank.com</span>
        </a>
        <a href="https://github.com/frankjoshua" target="_blank" rel="noopener" aria-label="GitHub">
          <svg class="icon" viewBox="0 0 24 24" fill="currentColor">
            <path d="M12 0c-6.626 0-12 5.373-12 12 0 5.302 3.438 9.8 8.207 11.387.599.111.793-.261.793-.577v-2.234c-3.338.726-4.033-1.416-4.033-1.416-.546-1.387-1.333-1.756-1.333-1.756-1.089-.745.083-.729.083-.729 1.205.084 1.839 1.237 1.839 1.237 1.07 1.834 2.807 1.304 3.492.997.107-.775.418-1.305.762-1.604-2.665-.305-5.467-1.334-5.467-5.931 0-1.311.469-2.381 1.236-3.221-.124-.303-.535-1.524.117-3.176 0 0 1.008-.322 3.301 1.23.957-.266 1.983-.399 3.003-.404 1.02.005 2.047.138 3.006.404 2.291-1.552 3.297-1.23 3.297-1.23.653 1.653.242 2.874.118 3.176.77.84 1.235 1.911 1.235 3.221 0 4.609-2.807 5.624-5.479 5.921.43.372.823 1.102.823 2.222v3.293c0 .319.192.694.801.576 4.765-1.589 8.199-6.086 8.199-11.386 0-6.627-5.373-12-12-12z"/>
          </svg>
          <span>GitHub</span>
        </a>
        <a href="https://joshfrank.com" aria-label="Website">
          <svg class="icon" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2">
            <circle cx="12" cy="12" r="10"></circle>
            <line x1="2" y1="12" x2="22" y2="12"></line>
            <path d="M12 2a15.3 15.3 0 0 1 4 10 15.3 15.3 0 0 1-4 10 15.3 15.3 0 0 1-4-10 15.3 15.3 0 0 1 4-10z"></path>
          </svg>
          <span>joshfrank.com</span>
        </a>
      </nav>
    </div>
  </header>

  <main>
    <section class="terminal-section" id="terminal">
      <div class="terminal">
        <div class="terminal-header">
          <span class="terminal-dot red"></span>
          <span class="terminal-dot yellow"></span>
          <span class="terminal-dot green"></span>
          <span class="terminal-title">josh@resume:~</span>
        </div>
        <div class="terminal-body">
          <div class="terminal-output" id="terminal-output"></div>
          <div class="terminal-input-line">
            <span class="prompt">❯</span>
            <input type="text" id="terminal-input" class="terminal-input" autocomplete="off" autocapitalize="off" spellcheck="false" aria-label="Terminal input">
            <span class="cursor"></span>
          </div>
        </div>
        <div class="terminal-buttons" id="terminal-buttons">
          <button data-cmd="about">about</button>
          <button data-cmd="skills">skills</button>
          <button data-cmd="projects">projects</button>
          <button data-cmd="experience">experience</button>
        </div>
      </div>
    </section>

    <section class="section" id="projects">
      <h2 class="section-title">Featured Projects</h2>
      <div class="projects-grid">
        <article class="project-card featured">
          <h3>Tesseract Mobile</h3>
          <p class="project-meta">Founder & Lead Developer | 2008 - Present</p>
          <p>Spearheaded development of 15+ mobile applications with over 5 million combined downloads. Pioneered advanced image processing solutions using SAM and Stable Diffusion.</p>
          <div class="project-tags">
            <span>Kotlin</span>
            <span>Flutter</span>
            <span>AI/ML</span>
          </div>
        </article>
        <article class="project-card">
          <h3>Solitaire Free Pack</h3>
          <p class="project-meta">5M+ Downloads</p>
          <p>Custom engine powering 250 solitaire variations. Successfully sold to a media company.</p>
          <div class="project-tags">
            <span>Custom Engine</span>
            <span>Android</span>
          </div>
        </article>
        <article class="project-card">
          <h3>MonAI: Art Generator</h3>
          <p class="project-meta">50K+ Downloads | 4.5 Rating</p>
          <p>Real-time background removal with custom eraser tools and social media integration.</p>
          <div class="project-tags">
            <span>Flutter</span>
            <span>SAM</span>
            <span>Firebase</span>
          </div>
        </article>
        <article class="project-card">
          <h3>Infinite Evolution</h3>
          <p class="project-meta">Custom Game Engine</p>
          <p>Built custom game engine driving unique gameplay. Enhanced performance by 35%.</p>
          <div class="project-tags">
            <span>Kotlin</span>
            <span>Game Dev</span>
          </div>
        </article>
      </div>
    </section>

    <section class="section" id="experience">
      <h2 class="section-title">Experience</h2>
      <div class="timeline">
        <article class="timeline-item">
          <div class="timeline-marker"></div>
          <div class="timeline-content">
            <h3>Tesseract Mobile</h3>
            <p class="role">Founder and Lead Developer</p>
            <p class="period">St. Louis, MO | 2008 - Present</p>
            <ul>
              <li>Spearheaded development of 15+ mobile applications</li>
              <li>Pioneered image processing with SAM and Stable Diffusion, improving speed by 50%</li>
              <li>Architected cross-platform solutions with deep linking, enhancing retention by 25%</li>
              <li>Led multidisciplinary team with 95% on-time delivery rate</li>
            </ul>
          </div>
        </article>
        <article class="timeline-item">
          <div class="timeline-marker"></div>
          <div class="timeline-content">
            <h3>Archway Technologies</h3>
            <p class="role">System Administrator</p>
            <p class="period">St. Louis, MO | 2005 - 2008</p>
            <ul>
              <li>Optimized server performance and network reliability</li>
              <li>Automated administration tasks via Bash scripting, reducing workload by 40%</li>
            </ul>
          </div>
        </article>
      </div>
    </section>

    <section class="section" id="skills">
      <h2 class="section-title">Skills</h2>
      <div class="skills-grid">
        <div class="skill-category">
          <h3>Languages</h3>
          <ul>
            <li>Kotlin</li>
            <li>Dart</li>
            <li>Python</li>
            <li>Java</li>
          </ul>
        </div>
        <div class="skill-category">
          <h3>Frameworks</h3>
          <ul>
            <li>Android SDK</li>
            <li>Flutter</li>
            <li>Jetpack Compose</li>
            <li>Riverpod</li>
          </ul>
        </div>
        <div class="skill-category">
          <h3>AI & Image Processing</h3>
          <ul>
            <li>SAM Model</li>
            <li>Stable Diffusion</li>
            <li>NVIDIA CUDA</li>
            <li>Torch Pipelines</li>
          </ul>
        </div>
        <div class="skill-category">
          <h3>Tools & DevOps</h3>
          <ul>
            <li>Git</li>
            <li>Firebase</li>
            <li>Docker</li>
            <li>ROS 2</li>
          </ul>
        </div>
      </div>
    </section>

    <section class="section" id="associations">
      <h2 class="section-title">Community</h2>
      <div class="association">
        <h3>St. Louis Robotics Association</h3>
        <p class="role">President | 2018 - 2024</p>
        <ul>
          <li>Led initiatives fostering collaboration, increasing membership by 40%</li>
          <li>Organized 10+ annual events including workshops and hackathons</li>
          <li>Implemented mentorship programs supporting local tech community</li>
        </ul>
      </div>
      <div class="interests">
        <h3>Interests</h3>
        <p><strong>Chess Expert:</strong> 1st (tied) 12th Grade National Champion. Missouri Rapid Chess Champion. Applies strategic planning to software development challenges.</p>
      </div>
    </section>
  </main>

  <footer class="footer">
    <p>&copy; 2026 Joshua Frank</p>
  </footer>

  <script src="terminal.js"></script>
</body>
</html>
```

**Step 2: Verify file created**

```bash
cat index.html | head -20
```

**Step 3: Commit**

```bash
git add index.html
git commit -m "feat: add base HTML structure"
```

---

### Task 3: Create CSS Styles

**Files:**
- Create: `styles.css`

**Step 1: Create styles.css with mobile-first approach**

```css
/* ===== CSS Reset & Base ===== */
*, *::before, *::after {
  box-sizing: border-box;
  margin: 0;
  padding: 0;
}

:root {
  --bg: #0a0a0a;
  --bg-light: #111;
  --text: #e0e0e0;
  --text-muted: #888;
  --primary: #00ff41;
  --accent: #00d4ff;
  --border: #222;
  --card-bg: #0f0f0f;
  --font-mono: 'JetBrains Mono', monospace;
}

html {
  scroll-behavior: smooth;
}

body {
  font-family: var(--font-mono);
  background: var(--bg);
  color: var(--text);
  line-height: 1.6;
  min-height: 100vh;
}

/* ===== Typography ===== */
h1, h2, h3 {
  color: var(--primary);
  text-shadow: 0 0 10px rgba(0, 255, 65, 0.3);
}

a {
  color: var(--accent);
  text-decoration: none;
  transition: color 0.2s, text-shadow 0.2s;
}

a:hover {
  color: var(--primary);
  text-shadow: 0 0 8px rgba(0, 255, 65, 0.5);
}

/* ===== Header ===== */
.header {
  padding: 2rem 1rem;
  text-align: center;
  border-bottom: 1px solid var(--border);
}

.name {
  font-size: 2rem;
  margin-bottom: 0.25rem;
}

.title {
  color: var(--text-muted);
  font-size: 1rem;
  margin-bottom: 1.5rem;
}

.contact-links {
  display: flex;
  flex-wrap: wrap;
  justify-content: center;
  gap: 1rem;
}

.contact-links a {
  display: flex;
  align-items: center;
  gap: 0.5rem;
  padding: 0.5rem 1rem;
  border: 1px solid var(--border);
  border-radius: 4px;
  font-size: 0.85rem;
  transition: border-color 0.2s, background 0.2s;
}

.contact-links a:hover {
  border-color: var(--primary);
  background: rgba(0, 255, 65, 0.05);
}

.icon {
  width: 18px;
  height: 18px;
  flex-shrink: 0;
}

.contact-links span {
  display: none;
}

@media (min-width: 480px) {
  .contact-links span {
    display: inline;
  }
}

/* ===== Terminal ===== */
.terminal-section {
  padding: 2rem 1rem;
}

.terminal {
  max-width: 600px;
  margin: 0 auto;
  border: 1px solid var(--border);
  border-radius: 8px;
  overflow: hidden;
  background: var(--bg-light);
}

.terminal-header {
  display: flex;
  align-items: center;
  gap: 0.5rem;
  padding: 0.75rem 1rem;
  background: var(--card-bg);
  border-bottom: 1px solid var(--border);
}

.terminal-dot {
  width: 12px;
  height: 12px;
  border-radius: 50%;
}

.terminal-dot.red { background: #ff5f57; }
.terminal-dot.yellow { background: #ffbd2e; }
.terminal-dot.green { background: #28c840; }

.terminal-title {
  margin-left: auto;
  font-size: 0.75rem;
  color: var(--text-muted);
}

.terminal-body {
  padding: 1rem;
  min-height: 200px;
  max-height: 300px;
  overflow-y: auto;
}

.terminal-output {
  margin-bottom: 1rem;
}

.terminal-output .line {
  margin-bottom: 0.25rem;
}

.terminal-output .command {
  color: var(--accent);
}

.terminal-output .response {
  color: var(--text);
  white-space: pre-wrap;
}

.terminal-input-line {
  display: flex;
  align-items: center;
  gap: 0.5rem;
}

.prompt {
  color: var(--primary);
  font-weight: bold;
}

.terminal-input {
  flex: 1;
  background: transparent;
  border: none;
  color: var(--text);
  font-family: var(--font-mono);
  font-size: 1rem;
  outline: none;
  caret-color: var(--primary);
}

.cursor {
  display: inline-block;
  width: 8px;
  height: 1.2em;
  background: var(--primary);
  animation: blink 1s step-end infinite;
}

@keyframes blink {
  50% { opacity: 0; }
}

.terminal-input:focus + .cursor {
  display: none;
}

.terminal-buttons {
  display: flex;
  flex-wrap: wrap;
  gap: 0.5rem;
  padding: 1rem;
  border-top: 1px solid var(--border);
  background: var(--card-bg);
}

.terminal-buttons button {
  flex: 1;
  min-width: 80px;
  padding: 0.75rem 1rem;
  background: transparent;
  border: 1px solid var(--border);
  border-radius: 4px;
  color: var(--accent);
  font-family: var(--font-mono);
  font-size: 0.85rem;
  cursor: pointer;
  transition: border-color 0.2s, background 0.2s, color 0.2s;
}

.terminal-buttons button:hover,
.terminal-buttons button:focus {
  border-color: var(--primary);
  background: rgba(0, 255, 65, 0.1);
  color: var(--primary);
  outline: none;
}

/* Hide buttons on desktop, show input */
@media (min-width: 768px) {
  .terminal-buttons {
    display: none;
  }
}

/* ===== Sections ===== */
.section {
  padding: 3rem 1rem;
  border-bottom: 1px solid var(--border);
}

.section-title {
  font-size: 1.5rem;
  margin-bottom: 2rem;
  text-align: center;
}

/* ===== Projects ===== */
.projects-grid {
  display: grid;
  gap: 1.5rem;
  max-width: 900px;
  margin: 0 auto;
}

@media (min-width: 600px) {
  .projects-grid {
    grid-template-columns: repeat(2, 1fr);
  }
}

.project-card {
  padding: 1.5rem;
  background: var(--card-bg);
  border: 1px solid var(--border);
  border-radius: 8px;
  transition: border-color 0.2s, transform 0.2s;
}

.project-card:hover {
  border-color: var(--primary);
  transform: translateY(-2px);
}

.project-card.featured {
  border-color: var(--primary);
  box-shadow: 0 0 20px rgba(0, 255, 65, 0.1);
}

@media (min-width: 600px) {
  .project-card.featured {
    grid-column: span 2;
  }
}

.project-card h3 {
  font-size: 1.1rem;
  margin-bottom: 0.5rem;
}

.project-meta {
  font-size: 0.85rem;
  color: var(--text-muted);
  margin-bottom: 0.75rem;
}

.project-card p {
  font-size: 0.9rem;
  margin-bottom: 1rem;
}

.project-tags {
  display: flex;
  flex-wrap: wrap;
  gap: 0.5rem;
}

.project-tags span {
  padding: 0.25rem 0.5rem;
  background: rgba(0, 212, 255, 0.1);
  border: 1px solid var(--accent);
  border-radius: 4px;
  font-size: 0.75rem;
  color: var(--accent);
}

/* ===== Timeline ===== */
.timeline {
  max-width: 700px;
  margin: 0 auto;
  position: relative;
  padding-left: 2rem;
}

.timeline::before {
  content: '';
  position: absolute;
  left: 0;
  top: 0;
  bottom: 0;
  width: 2px;
  background: var(--border);
}

.timeline-item {
  position: relative;
  margin-bottom: 2rem;
}

.timeline-marker {
  position: absolute;
  left: -2rem;
  top: 0.5rem;
  width: 12px;
  height: 12px;
  background: var(--primary);
  border-radius: 50%;
  transform: translateX(-5px);
  box-shadow: 0 0 10px rgba(0, 255, 65, 0.5);
}

.timeline-content h3 {
  font-size: 1.1rem;
  margin-bottom: 0.25rem;
}

.timeline-content .role {
  color: var(--accent);
  font-size: 0.9rem;
  margin-bottom: 0.25rem;
}

.timeline-content .period {
  color: var(--text-muted);
  font-size: 0.85rem;
  margin-bottom: 1rem;
}

.timeline-content ul {
  list-style: none;
}

.timeline-content li {
  position: relative;
  padding-left: 1.5rem;
  margin-bottom: 0.5rem;
  font-size: 0.9rem;
}

.timeline-content li::before {
  content: '>';
  position: absolute;
  left: 0;
  color: var(--primary);
}

/* ===== Skills ===== */
.skills-grid {
  display: grid;
  gap: 1.5rem;
  max-width: 800px;
  margin: 0 auto;
}

@media (min-width: 480px) {
  .skills-grid {
    grid-template-columns: repeat(2, 1fr);
  }
}

@media (min-width: 768px) {
  .skills-grid {
    grid-template-columns: repeat(4, 1fr);
  }
}

.skill-category h3 {
  font-size: 0.9rem;
  margin-bottom: 0.75rem;
  color: var(--accent);
  text-shadow: none;
}

.skill-category ul {
  list-style: none;
}

.skill-category li {
  padding: 0.25rem 0;
  font-size: 0.85rem;
  color: var(--text-muted);
}

/* ===== Associations ===== */
.association,
.interests {
  max-width: 700px;
  margin: 0 auto 2rem;
}

.association h3,
.interests h3 {
  font-size: 1.1rem;
  margin-bottom: 0.5rem;
}

.association .role {
  color: var(--accent);
  font-size: 0.9rem;
  margin-bottom: 1rem;
}

.association ul {
  list-style: none;
}

.association li {
  position: relative;
  padding-left: 1.5rem;
  margin-bottom: 0.5rem;
  font-size: 0.9rem;
}

.association li::before {
  content: '>';
  position: absolute;
  left: 0;
  color: var(--primary);
}

.interests p {
  font-size: 0.9rem;
}

/* ===== Footer ===== */
.footer {
  padding: 2rem 1rem;
  text-align: center;
  color: var(--text-muted);
  font-size: 0.85rem;
}

/* ===== Scan Line Effect (subtle) ===== */
body::after {
  content: '';
  position: fixed;
  top: 0;
  left: 0;
  right: 0;
  bottom: 0;
  background: repeating-linear-gradient(
    0deg,
    rgba(0, 0, 0, 0.03),
    rgba(0, 0, 0, 0.03) 1px,
    transparent 1px,
    transparent 2px
  );
  pointer-events: none;
  z-index: 9999;
}
```

**Step 2: Verify file created**

```bash
wc -l styles.css
```
Expected: ~400 lines

**Step 3: Commit**

```bash
git add styles.css
git commit -m "feat: add mobile-first CSS with hacker aesthetic"
```

---

### Task 4: Create Terminal JavaScript

**Files:**
- Create: `terminal.js`

**Step 1: Create terminal.js with commands and mobile support**

```javascript
(function() {
  'use strict';

  const commands = {
    help: `Available commands:
  about      - Who I am
  skills     - Technical skills
  projects   - Featured projects
  experience - Work history
  contact    - Get in touch
  clear      - Clear terminal`,

    about: `Joshua Frank
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━

Innovative Founder and Lead Developer with
over 15 years of experience in mobile app
development.

Specializes in Kotlin, Flutter, and open-source
technologies. Proven track record in designing
scalable applications with over 5 million downloads.

Passionate about AI, image processing, and
open-source solutions.`,

    skills: `Technical Skills
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━

Languages:    Kotlin, Dart, Python, Java
Frameworks:   Android SDK, Flutter, Compose
AI/ML:        SAM, Stable Diffusion, CUDA
DevOps:       Git, Firebase, Docker, ROS 2`,

    projects: `Featured Projects
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━

▸ Solitaire Free Pack
  5M+ downloads | Sold to media company

▸ MonAI: Art Generator
  50K+ downloads | AI background removal

▸ Infinite Evolution
  Custom game engine | 35% perf boost

▸ Ultimate Grill Timer
  Open source | Flutter + Riverpod`,

    experience: `Experience
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━

▸ Tesseract Mobile (2008 - Present)
  Founder & Lead Developer
  15+ apps | 5M+ downloads

▸ Archway Technologies (2005 - 2008)
  System Administrator
  Server optimization & automation`,

    contact: `Contact
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━

Email:   josh@joshfrank.com
GitHub:  github.com/frankjoshua
Web:     joshfrank.com`,
  };

  const output = document.getElementById('terminal-output');
  const input = document.getElementById('terminal-input');
  const buttons = document.getElementById('terminal-buttons');

  function addLine(text, className = 'response') {
    const line = document.createElement('div');
    line.className = `line ${className}`;
    line.textContent = text;
    output.appendChild(line);
    scrollToBottom();
  }

  function addCommand(cmd) {
    const line = document.createElement('div');
    line.className = 'line';
    line.innerHTML = `<span class="command">❯ ${cmd}</span>`;
    output.appendChild(line);
  }

  function scrollToBottom() {
    const terminalBody = output.parentElement;
    terminalBody.scrollTop = terminalBody.scrollHeight;
  }

  function executeCommand(cmd) {
    const trimmed = cmd.trim().toLowerCase();

    if (!trimmed) return;

    addCommand(trimmed);

    if (trimmed === 'clear') {
      output.innerHTML = '';
      return;
    }

    if (commands[trimmed]) {
      addLine(commands[trimmed]);
    } else {
      addLine(`Command not found: ${trimmed}. Type 'help' for available commands.`);
    }
  }

  // Keyboard input (desktop)
  input.addEventListener('keydown', (e) => {
    if (e.key === 'Enter') {
      executeCommand(input.value);
      input.value = '';
    }
  });

  // Button clicks (mobile)
  buttons.addEventListener('click', (e) => {
    if (e.target.tagName === 'BUTTON') {
      const cmd = e.target.dataset.cmd;
      executeCommand(cmd);
    }
  });

  // Focus input on terminal click
  document.querySelector('.terminal-body').addEventListener('click', () => {
    input.focus();
  });

  // Welcome message with typing effect
  function typeWriter(text, callback) {
    let i = 0;
    const line = document.createElement('div');
    line.className = 'line response';
    output.appendChild(line);

    function type() {
      if (i < text.length) {
        line.textContent += text.charAt(i);
        i++;
        scrollToBottom();
        setTimeout(type, 30);
      } else if (callback) {
        callback();
      }
    }
    type();
  }

  // Initial greeting
  setTimeout(() => {
    typeWriter("Welcome. Type 'help' or tap a button below.", () => {
      input.focus();
    });
  }, 500);

})();
```

**Step 2: Verify file created**

```bash
wc -l terminal.js
```
Expected: ~120 lines

**Step 3: Commit**

```bash
git add terminal.js
git commit -m "feat: add interactive terminal with mobile buttons"
```

---

### Task 5: Update Firebase Configuration

**Files:**
- Modify: `firebase.json`

**Step 1: Update firebase.json for static hosting**

```json
{
  "hosting": {
    "public": ".",
    "ignore": [
      "firebase.json",
      "**/.*",
      "**/node_modules/**",
      "docs/**",
      "README.md"
    ],
    "headers": [
      {
        "source": "**/*.@(js|css)",
        "headers": [
          {
            "key": "Cache-Control",
            "value": "max-age=31536000"
          }
        ]
      },
      {
        "source": "**/*.html",
        "headers": [
          {
            "key": "Cache-Control",
            "value": "no-cache"
          }
        ]
      }
    ]
  }
}
```

**Step 2: Verify JSON is valid**

```bash
cat firebase.json | python3 -m json.tool > /dev/null && echo "Valid JSON"
```

**Step 3: Commit**

```bash
git add firebase.json
git commit -m "chore: update firebase config for static hosting"
```

---

### Task 6: Update GitHub Actions Workflow

**Files:**
- Modify: `.github/workflows/firebase-hosting-merge.yml`
- Modify: `.github/workflows/firebase-hosting-pull-request.yml`

**Step 1: Update merge workflow (remove Flutter)**

```yaml
name: Deploy to Firebase Hosting on merge
on:
  push:
    branches:
      - main

jobs:
  deploy:
    runs-on: ubuntu-latest
    steps:
      - uses: actions/checkout@v4

      - uses: FirebaseExtended/action-hosting-deploy@v0
        with:
          repoToken: ${{ secrets.GITHUB_TOKEN }}
          firebaseServiceAccount: ${{ secrets.FIREBASE_SERVICE_ACCOUNT_RESUME_4F8C2 }}
          channelId: live
          projectId: resume-4f8c2
```

**Step 2: Update PR workflow**

```yaml
name: Deploy to Firebase Hosting on PR
on: pull_request

jobs:
  deploy_preview:
    if: ${{ github.event.pull_request.head.repo.full_name == github.repository }}
    runs-on: ubuntu-latest
    steps:
      - uses: actions/checkout@v4

      - uses: FirebaseExtended/action-hosting-deploy@v0
        with:
          repoToken: ${{ secrets.GITHUB_TOKEN }}
          firebaseServiceAccount: ${{ secrets.FIREBASE_SERVICE_ACCOUNT_RESUME_4F8C2 }}
          projectId: resume-4f8c2
```

**Step 3: Commit**

```bash
git add .github/workflows/
git commit -m "chore: simplify workflows for static site deployment"
```

---

### Task 7: Update .gitignore

**Files:**
- Modify: `.gitignore`

**Step 1: Replace with simple static site gitignore**

```
# OS
.DS_Store
Thumbs.db

# Editor
.idea/
.vscode/
*.swp
*.swo

# Firebase
.firebase/
```

**Step 2: Commit**

```bash
git add .gitignore
git commit -m "chore: simplify gitignore for static site"
```

---

### Task 8: Local Testing

**Step 1: Start local server**

```bash
python3 -m http.server 8000
```

**Step 2: Test in browser**

Open http://localhost:8000 and verify:
- [ ] Page loads with dark theme
- [ ] Header shows name, title, contact links
- [ ] Terminal displays welcome message
- [ ] Terminal buttons work (mobile simulation)
- [ ] Terminal typing works
- [ ] All sections render correctly
- [ ] Mobile responsive (resize browser)

**Step 3: Stop server and commit any fixes**

---

### Task 9: Final Commit and Deploy

**Step 1: Verify git status is clean**

```bash
git status
```

**Step 2: Push to trigger deployment**

```bash
git push origin main
```

**Step 3: Verify deployment**

Check GitHub Actions and Firebase Hosting console for successful deployment.

---

## Summary

| Task | Description |
|------|-------------|
| 1 | Remove all Flutter code |
| 2 | Create HTML structure |
| 3 | Create CSS styles |
| 4 | Create terminal JavaScript |
| 5 | Update Firebase config |
| 6 | Update GitHub Actions |
| 7 | Update .gitignore |
| 8 | Local testing |
| 9 | Deploy |

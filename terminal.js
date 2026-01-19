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

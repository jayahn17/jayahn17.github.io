---
permalink: /
title: "About Me"
author_profile: false
description: "Robotics researcher at UC Berkeley ICON Lab — diffusion policies, humanoid simulation, and field-deployed autonomy."
redirect_from: 
  - /about/
  - /about.html
---

<style>
/* Centered single-column layout - wider for readability */
#main {
  background: transparent !important;
  box-shadow: none !important;
  margin: 0 auto !important;
  padding: 0 24px !important;
  max-width: 1280px;
}

#main .page {
  max-width: 100% !important;
  margin: 0 !important;
  padding: 0 !important;
}

#main .page__inner-wrap > header {
  display: none;
}

.professional-page {
  max-width: 1280px;
  margin: 0 auto;
  padding: 40px 24px;
  line-height: 1.8;
  font-family: -apple-system, BlinkMacSystemFont, "Segoe UI", Roboto, "Helvetica Neue", Arial, sans-serif;
  color: #e0e0e0;
  background: transparent;
}

.professional-header {
  display: flex;
  flex-direction: column;
  align-items: center;
  gap: 16px;
  margin-bottom: 48px;
  justify-content: center;
  text-align: center;
}

.professional-header .profile-image {
  flex-shrink: 0;
  width: 120px;
  height: 120px;
  border-radius: 50%;
  object-fit: cover;
  border: 3px solid #4a9eff;
}

.professional-header .header-content {
  flex: 0 1 auto;
  text-align: center;
  max-width: 100%;
}

.professional-header h1 {
  font-size: 2.2em;
  margin: 0 0 8px 0;
  color: #ffffff;
  font-weight: 600;
}

.professional-header .title {
  font-size: 1.1em;
  color: #b0b0b0;
  margin: 4px 0;
}

.professional-header .affiliation {
  font-size: 1.1em;
  color: #b0b0b0;
  margin: 4px 0;
}

.professional-header .contact {
  font-size: 1em;
  color: #b0b0b0;
  margin: 8px 0;
}

.professional-header .contact a {
  color: #4a9eff;
  text-decoration: none;
}

.professional-header .contact a:hover {
  text-decoration: underline;
}

.professional-header .social-links {
  display: flex;
  gap: 15px;
  margin-top: 12px;
  flex-wrap: wrap;
  justify-content: center;
}

.professional-header .social-links a {
  color: #b0b0b0;
  text-decoration: none;
  font-size: 0.95em;
  transition: color 0.2s;
}

.professional-header .social-links a:hover {
  color: #4a9eff;
}

@media (max-width: 768px) {
  #main {
    padding: 0 15px !important;
  }
  .professional-page {
    padding: 24px 15px;
  }
}

.section {
  margin: 40px 0;
}

.section h2,
h2 {
  font-size: 1.6em;
  color: #4a9eff;
  margin: 30px 0 15px 0;
  font-weight: 600;
  display: block;
}

.professional-page h3,
h3 {
  font-size: 1.3em;
  color: #4a9eff;
  margin: 24px 0 12px 0;
  font-weight: 600;
  display: block;
}

.section p,
p {
  color: #e0e0e0;
  margin: 12px 0 20px 0;
  line-height: 1.7;
  display: block;
}

.section ul {
  list-style: none;
  padding: 0;
  margin: 0;
}

.section ul li {
  margin: 12px 0;
  padding-left: 0;
  color: #e0e0e0;
  line-height: 1.7;
}

.section ul li strong {
  color: #4a9eff;
  font-weight: 600;
}

/* Numbered list for publications/projects */
.publication-list {
  list-style: none;
  padding: 0;
  margin: 0;
}

.publication-item {
  display: flex;
  gap: 24px;
  margin: 36px 0;
  align-items: flex-start;
}

.publication-number {
  flex-shrink: 0;
  font-weight: 600;
  color: #ffffff;
  margin-top: 2px;
}

.publication-thumbnail {
  flex-shrink: 0;
  width: 420px;
  height: 260px;
  overflow: hidden;
  position: relative;
  border-radius: 10px;
  background: #1a1a1a;
  border: 1px solid rgba(255, 255, 255, 0.14);
  transition: border-color 0.2s ease, transform 0.2s ease, box-shadow 0.2s ease;
  box-shadow: 0 8px 24px rgba(0, 0, 0, 0.35);
}

.publication-thumbnail video,
.publication-thumbnail img {
  width: 100%;
  height: 100%;
  object-fit: cover;
  display: block;
}

.publication-thumbnail video {
  background: #1a1a1a;
}

.publication-thumbnail:hover {
  border-color: rgba(74, 158, 255, 0.65);
  transform: translateY(-2px);
  box-shadow: 0 12px 32px rgba(0, 0, 0, 0.45);
}

.publication-tag {
  position: absolute;
  top: 6px;
  right: 6px;
  background: rgba(74, 158, 255, 0.9);
  color: white;
  padding: 3px 8px;
  border-radius: 4px;
  font-size: 0.7em;
  font-weight: 600;
  z-index: 1;
}

.publication-content {
  flex: 1;
}

.publication-title {
  font-size: 1.05em;
  font-weight: 600;
  margin: 0 0 4px 0;
  line-height: 1.4;
}

.publication-title a {
  color: #4a9eff;
  text-decoration: none;
}

.publication-title a:hover {
  text-decoration: underline;
  color: #6bb3ff;
}

.publication-authors {
  color: #e0e0e0;
  margin: 4px 0;
  font-size: 0.95em;
}

.publication-venue {
  color: #b0b0b0;
  font-style: normal;
  margin: 8px 0;
  font-size: 0.95em;
  line-height: 1.6;
}

.publication-links {
  margin-top: 12px;
  display: flex;
  gap: 10px;
  flex-wrap: wrap;
}

.publication-link {
  color: #ffffff;
  text-decoration: none;
  font-size: 0.9em;
  border: 1px solid #ffffff;
  padding: 6px 12px;
  border-radius: 4px;
  transition: all 0.2s;
  display: inline-block;
}

.publication-link:hover {
  background: rgba(255, 255, 255, 0.1);
  border-color: #4a9eff;
  color: #4a9eff;
}

.news-item {
  margin: 12px 0;
  color: #e0e0e0;
  line-height: 1.7;
}

.news-item strong {
  color: #4a9eff;
}

.subsection {
  margin: 20px 0;
}

.subsection h4 {
  font-size: 1.1em;
  color: #4a9eff;
  margin: 20px 0 10px 0;
  font-weight: 600;
}

.subsection ul {
  list-style: none;
  padding: 0;
}

.subsection ul li {
  margin: 8px 0;
  padding-left: 0;
  color: #e0e0e0;
}

.subsection ul li:before {
  content: "• ";
  color: #4a9eff;
  font-weight: bold;
  margin-right: 8px;
}

@media (max-width: 768px) {
  .professional-page {
    padding: 20px 15px;
  }
  
  .professional-header h1 {
    font-size: 1.8em;
  }
  
  .section h2 {
    font-size: 1.4em;
  }
  
  .publication-item {
    flex-direction: column;
  }
  
  .publication-thumbnail {
    width: 100%;
    height: 280px;
    max-height: 50vw;
  }
}
</style>

<div class="professional-page">

<div class="professional-header">
  <img src="{{ '/images/seongjaeahn.jpeg' | relative_url }}" alt="SeongJae Ahn" class="profile-image">
  <div class="header-content">
    <h1>SeongJae (Jay) Ahn</h1>
    <div class="title">M.S. in Mechanical Engineering</div>
    <div class="affiliation">University of California, Berkeley</div>
    <div class="contact">
      <a href="mailto:jayahn@berkeley.edu">jayahn@berkeley.edu</a> · (628) 529-6598
    </div>
    <div class="social-links">
      <a href="{{ '/portfolio/' | relative_url }}">Portfolio</a>
      <a href="{{ '/cv/' | relative_url }}">CV</a>
      <a href="https://github.com/jayahn17" target="_blank" rel="noopener">GitHub</a>
      <a href="https://www.linkedin.com/in/seongjae-ahn-126838244/" target="_blank" rel="noopener">LinkedIn</a>
    </div>
  </div>
</div>
  
<div markdown="1">

## About Me

I'm a robotics researcher in the **[ICON (Intelligent Control) Lab](https://iconlab.negarmehr.com)** at UC Berkeley, advised by Professor [Negar Mehr](https://mehr.berkeley.edu). My current work builds role-conditioned diffusion policies for multi-arm manipulation — reusing the same per-skill policies from a single arm up to a four-arm, LLM-coordinated system — alongside legged locomotion and simulation infrastructure for learning and control.

I hold an M.S. in Mechanical Engineering from Berkeley (May 2026). I currently work as a Control & Simulation Engineer Intern at **[Khameleon Robotics](https://www.khameleonrobotics.com)**, and previously as a Junior Engineer at **[Root Applied Sciences](https://rootappliedsciences.com)** and an undergraduate researcher in the **[TAF (Theoretical & Applied Fluid Dynamics) Lab](https://taflab.berkeley.edu)**. Across these roles I've explored robot learning, control systems, simulation engineering, and field-deployed sensing hardware.

I have always been fascinated by the interaction between computers and the physical world. Learning random things has been the greatest source of pleasure for me, and I hope this will never stop. Recently, I have been studying the science of cooking in my free time.

</div>
<div markdown="1">

## Highlights

### Research Experience

<ol class="publication-list">
  <li class="publication-item">
    <span class="publication-number">1.</span>
    <div class="publication-thumbnail">
      <video controls muted playsinline preload="metadata" style="width: 100%; height: 100%; object-fit: cover;" poster="{{ '/images/icon_fourarm_poster.png' | relative_url }}">
        <source src="{{ '/images/icon_fourarm.mp4' | relative_url }}" type="video/mp4">
      </video>
      <div class="publication-tag">Research</div>
    </div>
    <div class="publication-content">
      <div class="publication-title"><a href="{{ '/portfolio/portfolio-9/' | relative_url }}">ICON Lab: Role-Conditioned Robot Manipulation</a></div>
      <div class="publication-venue">Built skill-decomposed diffusion policies (pick / place / retreat) verified ≥95% on a single arm, then reused them unchanged on two arms and a four-arm system governed by an LLM coordinator. Also ported multi-agent quadruped RL from Go1 to Go2 in Isaac Gym.</div>
      <div class="publication-links">
        <a href="{{ '/portfolio/portfolio-9/' | relative_url }}" class="publication-link">Project Page</a>
      </div>
    </div>
  </li>

  <li class="publication-item">
    <span class="publication-number">2.</span>
    <div class="publication-thumbnail">
      <img loading="lazy" src="{{ '/images/TAFlab_lolus.jpeg' | relative_url }}" alt="TAF Lab">
      <div class="publication-tag">Research</div>
    </div>
    <div class="publication-content">
      <div class="publication-title"><a href="{{ '/portfolio/portfolio-1/' | relative_url }}">TAF Lab: Undergraduate Research Assistant</a></div>
      <div class="publication-authors">E. Kuo, S. Ahn, A. Khan</div>
      <div class="publication-venue">Led electronics integration and navigation-control for an autonomous ocean drone; achieved Top 20 in the U.S. DOE Power at Sea Prize.</div>
      <div class="publication-links">
        <a href="{{ '/portfolio/portfolio-1/' | relative_url }}" class="publication-link">Project Page</a>
      </div>
    </div>
  </li>

  <li class="publication-item">
    <span class="publication-number">3.</span>
    <div class="publication-thumbnail">
      <video controls muted playsinline preload="metadata" style="width: 100%; height: 100%; object-fit: cover;" poster="{{ '/images/MSC_WL2Isaac.png' | relative_url }}">
        <source src="{{ '/images/MSC_WL2Isaac.webm' | relative_url }}" type="video/webm">
      </video>
      <div class="publication-tag">Research</div>
    </div>
    <div class="publication-content">
      <div class="publication-title"><a href="{{ '/portfolio/portfolio-6/' | relative_url }}">MSC (Mechanical Systems) Control Lab</a></div>
      <div class="publication-venue">Created a unified render-to-sim-to-asset workflow with Worldlab.ai, NVIDIA 3DGRUT, and Isaac Lab for reusable, validated assets.</div>
      <div class="publication-links">
        <a href="{{ '/portfolio/portfolio-6/' | relative_url }}" class="publication-link">Project Page</a>
      </div>
    </div>
  </li>
</ol>

### Industry Experience

<ol class="publication-list">
  <li class="publication-item">
    <span class="publication-number">1.</span>
    <div class="publication-thumbnail">
      <video controls muted playsinline preload="metadata" style="width: 100%; height: 100%; object-fit: cover;" poster="{{ '/images/kha_grab_img.png' | relative_url }}">
        <source src="{{ '/images/kha_move.mp4' | relative_url }}" type="video/mp4">
        <source src="{{ '/images/kha_move.mov' | relative_url }}" type="video/quicktime">
      </video>
      <div class="publication-tag">Work</div>
    </div>
    <div class="publication-content">
      <div class="publication-title"><a href="{{ '/portfolio/portfolio-5/' | relative_url }}">Khameleon Robotics: Control & Simulation Engineer Intern</a></div>
      <div class="publication-venue">Built Isaac Sim and Isaac Lab control and simulation infrastructure for 13-DOF dual-arm teleoperation, improving stability and responsiveness in imitation/learning workflows.</div>
      <div class="publication-links">
        <a href="{{ '/portfolio/portfolio-5/' | relative_url }}" class="publication-link">Project Page</a>
      </div>
    </div>
  </li>

  <li class="publication-item">
    <span class="publication-number">2.</span>
    <div class="publication-thumbnail">
      <img loading="lazy" src="{{ '/images/root_deployment_1.png' | relative_url }}" alt="Root Applied Sciences">
      <div class="publication-tag">Work</div>
    </div>
    <div class="publication-content">
      <div class="publication-title"><a href="{{ '/portfolio/portfolio-2/' | relative_url }}">Root Applied Sciences: Junior Engineer</a></div>
      <div class="publication-venue">Designed field-ready microfluidic hardware, including SLA-manufacturable components and protective housings for reliable deployment and maintenance.</div>
      <div class="publication-links">
        <a href="{{ '/portfolio/portfolio-2/' | relative_url }}" class="publication-link">Project Page</a>
      </div>
    </div>
  </li>

</ol>

</div>
<div markdown="1">

### Class Projects

<ol class="publication-list">
  <li class="publication-item">
    <span class="publication-number">1.</span>
    <div class="publication-thumbnail">
      <video controls muted playsinline preload="metadata" style="width: 100%; height: 100%; object-fit: cover;" poster="{{ '/images/me231_result_1.png' | relative_url }}">
        <source src="{{ '/images/me231_result_1.mp4' | relative_url }}" type="video/mp4">
        <source src="{{ '/images/me231_result_1.mov' | relative_url }}" type="video/quicktime">
      </video>
      <div class="publication-tag">ME231</div>
    </div>
    <div class="publication-content">
      <div class="publication-title"><a href="{{ '/portfolio/portfolio-8/' | relative_url }}">MPC for Truck-Trailer System with Obstacle Avoidance</a></div>
      <div class="publication-authors">S. Ahn</div>
      <div class="publication-venue">Implemented constrained MPC for forward and reverse truck-trailer navigation with dynamic obstacle prediction and feasibility recovery.</div>
      <div class="publication-links">
        <a href="{{ '/portfolio/portfolio-8/' | relative_url }}" class="publication-link">Project Page</a>
      </div>
    </div>
  </li>

  <li class="publication-item">
    <span class="publication-number">2.</span>
    <div class="publication-thumbnail">
      <video controls muted playsinline preload="metadata" style="width: 100%; height: 100%; object-fit: cover;" poster="{{ '/images/me239_front_pg.png' | relative_url }}">
        <source src="{{ '/images/me239_backflip.mp4' | relative_url }}" type="video/mp4">
      </video>
      <div class="publication-tag">ME239</div>
    </div>
    <div class="publication-content">
      <div class="publication-title"><a href="{{ '/portfolio/portfolio-10/' | relative_url }}">Spider Robot - Robotic Locomotion</a></div>
      <div class="publication-authors">S. Ahn</div>
      <div class="publication-venue">Derived Jacobian-based motion relationships and implemented stable forward-jump control for a four-legged robotic platform.</div>
      <div class="publication-links">
        <a href="{{ '/portfolio/portfolio-10/' | relative_url }}" class="publication-link">Project Page</a>
      </div>
    </div>
  </li>

  <li class="publication-item">
    <span class="publication-number">3.</span>
    <div class="publication-thumbnail">
      <img loading="lazy" src="{{ '/images/caliber_pg1.png' | relative_url }}" alt="Caliber Platform">
      <div class="publication-tag">Class</div>
    </div>
    <div class="publication-content">
      <div class="publication-title"><a href="{{ '/portfolio/portfolio-3/' | relative_url }}">Caliber - Student Projects Open Source Platform</a></div>
      <div class="publication-authors">S. Ahn</div>
      <div class="publication-venue">Designed the discovery and metadata architecture for 500+ UC Berkeley open source projects, making them easier to browse, filter, and reuse.</div>
      <div class="publication-links">
        <a href="{{ '/portfolio/portfolio-3/' | relative_url }}" class="publication-link">Project Page</a>
      </div>
    </div>
  </li>
</ol>

</div>
<div markdown="1">

### Student Team Experience

<ol class="publication-list">
  <li class="publication-item">
    <span class="publication-number">1.</span>
    <div class="publication-thumbnail">
      <img loading="lazy" src="{{ '/images/CalSol_suspension.png' | relative_url }}" alt="CalSol">
      <div class="publication-tag">Club</div>
    </div>
    <div class="publication-content">
      <div class="publication-title"><a href="{{ '/portfolio/portfolio-4/' | relative_url }}">UC Berkeley Solar Vehicle Team, CalSol</a></div>
      <div class="publication-venue">Redesigned CalSol front suspension components for about 10% lower mass while preserving stiffness through FEA-backed iteration.</div>
      <div class="publication-links">
        <a href="{{ '/portfolio/portfolio-4/' | relative_url }}" class="publication-link">Project Page</a>
      </div>
    </div>
  </li>
</ol>

### Teaching Experience
* **Diablo Valley College, Physics Tutor**  
  Tutored students in introductory engineering mechanics, electromagnetics, and quantum mechanics.

## Education

* **Master of Science in Mechanical Engineering**  
  University of California, Berkeley  
  *May 2026*

* **Bachelor of Science in Mechanical Engineering**  
  University of California, Berkeley  
  *December 2024*

* **Mechanical Engineering**  
  Diablo Valley College  
  *May 2022*

* **Republic of Korea Army, Signal Corps**  
  Squad Leader  
  *August 2017 – April 2019*

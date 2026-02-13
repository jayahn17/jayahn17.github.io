---
permalink: /
title: "About Me"
author_profile: false
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
  gap: 20px;
  margin: 25px 0;
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
  width: 180px;
  height: 100px;
  overflow: hidden;
  position: relative;
  border-radius: 6px;
  background: #1a1a1a;
  border: 1px solid rgba(255, 255, 255, 0.1);
  transition: border-color 0.2s ease;
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
  border-color: rgba(74, 158, 255, 0.5);
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
    height: 180px;
  }
}
</style>

<div class="professional-page">

<div class="professional-header">
  <img src="/images/seongjaeahn.jpeg" alt="SeongJae Ahn" class="profile-image">
  <div class="header-content">
    <h1>SeongJae (Jay) Ahn</h1>
    <div class="title">B.S / M.S. Student in Mechanical Engineering</div>
    <div class="affiliation">University of California, Berkeley</div>
    <div class="contact">
      <a href="mailto:jayahn@berkeley.edu">jayahn@berkeley.edu</a>
    </div>
    <div class="social-links">
      <a href="https://github.com/jayahn17" target="_blank">GitHub</a>
      <a href="https://www.linkedin.com/in/seongjae-ahn-126838244/" target="_blank">LinkedIn</a>
    </div>
  </div>
</div>
  
<div markdown="1">

## About Me

I am an M.S. student in Mechanical Engineering at UC Berkeley, working in the [ICON (Intelligent Control) Lab](https://iconlab.negarmehr.com) under Prof. Negar Mehr. My research centers on robot learning (VLA/VLM for control, dual-arm manipulation) and the control/simulation stack that enables reliable policy evaluation. I aim to build systems that move cleanly from demonstration and simulation to robust deployment.

Previously, I was a Control & Simulation Intern at **[Khameleon Robotics](https://www.khameleonrobotics.com)** and a Junior Engineer at **[Root Applied Sciences](https://rootappliedsciences.com)**, working on QA automation and deployment. During my bachelor’s at UC Berkeley, I was part of the [TAF (Theoretical & Applied Fluid Dynamics) Lab](https://taflab.berkeley.edu) under Prof. Reza Alam.

## Research Interests

* **Robot Learning:** VLA/VLM, RL, and diffusion imitation for dual-arm manipulation
* **Control Systems:** Model-based control and stability analysis for legged and manipulation tasks
* **Simulation:** NVIDIA Isaac Sim/Lab and MuJoCo for policy testing and sim-to-real iteration
* **3D Reconstruction:** Worldlab and 3Dgrut for asset generation and scene reconstruction

</div>
<div markdown="1">

## Work/Research Experiences

## Work Experience

<ol class="publication-list">
  <li class="publication-item">
    <span class="publication-number">1.</span>
    <div class="publication-thumbnail">
      <video autoplay muted loop playsinline style="width: 100%; height: 100%; object-fit: cover;">
        <source src="/images/kha_move.mp4" type="video/mp4">
        <source src="/images/kha_move.mov" type="video/quicktime">
      </video>
      <div class="publication-tag">Work</div>
    </div>
    <div class="publication-content">
      <div class="publication-title"><a href="/portfolio/portfolio-5/">Khameleon Robotics: Control & Simulation Intern</a></div>
      <div class="publication-venue">Industry focus: HIL teleoperation for dual-arm humanoid in NVIDIA Isaac Sim/Lab; improved sim stability and operator feedback loop.</div>
      <div class="publication-links">
        <a href="/portfolio/portfolio-5/" class="publication-link">Project Page</a>
      </div>
    </div>
  </li>

  <li class="publication-item">
    <span class="publication-number">2.</span>
    <div class="publication-thumbnail">
      <img src="/images/root_deployment_1.png" alt="Root Applied Sciences">
      <div class="publication-tag">Work</div>
    </div>
    <div class="publication-content">
      <div class="publication-title"><a href="/portfolio/portfolio-2/">Root Applied Sciences: Junior Engineer</a></div>
      <div class="publication-venue">Industry focus: microfluidics hardware for pathogen monitoring; designed 3D-printed housings and supported 80+ field-deployed devices.</div>
      <div class="publication-links">
        <a href="/portfolio/portfolio-2/" class="publication-link">Project Page</a>
      </div>
    </div>
  </li>

</ol>

## Research Experience

<ol class="publication-list">
  <li class="publication-item">
    <span class="publication-number">1.</span>
    <div class="publication-thumbnail">
      <video autoplay muted loop playsinline style="width: 100%; height: 100%; object-fit: cover;">
        <source src="/images/icon_front_video.mp4" type="video/mp4">
        <source src="/images/icon_front_video.mov" type="video/quicktime">
      </video>
      <div class="publication-tag">Research</div>
    </div>
    <div class="publication-content">
      <div class="publication-title"><a href="/portfolio/portfolio-9/">ICON Lab: Robot Learning & Manipulation</a></div>
      <div class="publication-venue">Academic focus: PolicyPlayer demos in robosuite/MuJoCo, Diffusion Policy evaluation, and quadruped RL migration (Go1→Go2) in Isaac Gym.</div>
      <div class="publication-links">
        <a href="/portfolio/portfolio-9/" class="publication-link">Project Page</a>
      </div>
    </div>
  </li>

  <li class="publication-item">
    <span class="publication-number">2.</span>
    <div class="publication-thumbnail">
      <img src="/images/TAFlab_lolus.jpeg" alt="TAF Lab">
      <div class="publication-tag">Research</div>
    </div>
    <div class="publication-content">
      <div class="publication-title"><a href="/portfolio/portfolio-1/">TAF Lab: Undergraduate Research Assistant</a></div>
      <div class="publication-authors">E. Kuo, S. Ahn, A. Khan</div>
      <div class="publication-venue">Academic focus: autonomous ocean drone for marine transportation. Led electronics integration and autonomous control. Top 20 in U.S. DOE "Power at the Sea Prize."</div>
      <div class="publication-links">
        <a href="/portfolio/portfolio-1/" class="publication-link">Project Page</a>
      </div>
    </div>
  </li>

  <li class="publication-item">
    <span class="publication-number">3.</span>
    <div class="publication-thumbnail">
      <video autoplay muted loop playsinline style="width: 100%; height: 100%; object-fit: cover;">
        <source src="/images/MSC_WL2Isaac.webm" type="video/webm">
      </video>
      <div class="publication-tag">Research</div>
    </div>
    <div class="publication-content">
      <div class="publication-title"><a href="/portfolio/portfolio-6/">Mechanical Systems Control Lab</a></div>
      <div class="publication-venue">Academic focus: 3D reconstruction pipeline with Worldlab.ai, NVIDIA 3Dgrut, and Isaac Lab (render-to-sim-to-asset).</div>
      <div class="publication-links">
        <a href="/portfolio/portfolio-6/" class="publication-link">Project Page</a>
      </div>
    </div>
  </li>
</ol>

</div>
<div markdown="1">

## Projects

<ol class="publication-list">
  <li class="publication-item">
    <span class="publication-number">1.</span>
    <div class="publication-thumbnail">
      <img src="/images/caliber_pg1.png" alt="Caliber Platform">
      <div class="publication-tag">Class</div>
    </div>
    <div class="publication-content">
      <div class="publication-title"><a href="/portfolio/portfolio-3/">Caliber - Student Projects Open Source Platform</a></div>
      <div class="publication-authors">S. Ahn</div>
      <div class="publication-venue">Academic focus: open source platform with 500+ UC Berkeley student projects; scoped use cases and information architecture for file management.</div>
      <div class="publication-links">
        <a href="/portfolio/portfolio-3/" class="publication-link">Project Page</a>
      </div>
    </div>
  </li>

  <li class="publication-item">
    <span class="publication-number">2.</span>
    <div class="publication-thumbnail">
      <video autoplay muted loop playsinline style="width: 100%; height: 100%; object-fit: cover;">
        <source src="/images/me231_result_1.mp4" type="video/mp4">
        <source src="/images/me231_result_1.mov" type="video/quicktime">
      </video>
      <div class="publication-tag">ME231</div>
    </div>
    <div class="publication-content">
      <div class="publication-title"><a href="/portfolio/portfolio-8/">MPC for Truck-Trailer System with Obstacle Avoidance</a></div>
      <div class="publication-authors">S. Ahn</div>
      <div class="publication-venue">Academic focus: ME231 — MPC for autonomous truck-trailer navigation with dynamic obstacle avoidance (forward and reverse).</div>
      <div class="publication-links">
        <a href="/portfolio/portfolio-8/" class="publication-link">Project Page</a>
      </div>
    </div>
  </li>

  <li class="publication-item">
    <span class="publication-number">3.</span>
    <div class="publication-thumbnail">
      <video autoplay muted loop playsinline style="width: 100%; height: 100%; object-fit: cover;">
        <source src="/images/me239_backflip.mp4" type="video/mp4">
        <!-- <source src="/images/me239_spider_jump_1.mov" type="video/quicktime"> -->
      </video>
      <div class="publication-tag">ME239</div>
    </div>
    <div class="publication-content">
      <div class="publication-title"><a href="/portfolio/portfolio-10/">Spider Robot - Robotic Locomotion</a></div>
      <div class="publication-authors">S. Ahn</div>
      <div class="publication-venue">Academic focus: ME239 — Jacobian analysis and forward jump control for 4-legged spider robot (ZaidHJaber repo).</div>
      <div class="publication-links">
        <a href="/portfolio/portfolio-10/" class="publication-link">Project Page</a>
      </div>
    </div>
  </li>
</ol>

</div>
<div markdown="1">

## Student Club

<ol class="publication-list">
  <li class="publication-item">
    <span class="publication-number">1.</span>
    <div class="publication-thumbnail">
      <img src="/images/CalSol_suspension.png" alt="CalSol">
      <div class="publication-tag">Club</div>
    </div>
    <div class="publication-content">
      <div class="publication-title"><a href="/portfolio/portfolio-4/">UC Berkeley Solar Vehicle Team, CalSol</a></div>
      <div class="publication-venue">Suspension & Battery Team. Consolidated front suspension brackets with 10% weight reduction and FEA validation.</div>
      <div class="publication-links">
        <a href="/portfolio/portfolio-4/" class="publication-link">Project Page</a>
      </div>
    </div>
  </li>
</ol>

## Teaching Experience

* **Diablo Valley College, Physics Tutor**  
  Tutored students in Intro to Engineering Mechanics, Electromagnetics, and Quantum Mechanics.

## Education

* **Master of Science in Mechanical Engineering**  
  University of California, Berkeley  
  *August 2025 – May 2026 (Expected)*

* **Bachelor of Science in Mechanical Engineering**  
  University of California, Berkeley  
  *December 2024*

* **Mechanical Engineering**  
  Diablo Valley College  
  *May 2022*

* **Republic of Korea Army, Signal Corps**  
  Squad Leader  
  *August 2017 – April 2019*


<script>
// Make project videos play on hover
document.addEventListener('DOMContentLoaded', function() {
  const projectVideos = document.querySelectorAll('.publication-thumbnail video');
  
  projectVideos.forEach(video => {
    const thumbnail = video.closest('.publication-thumbnail');
    
    thumbnail.addEventListener('mouseenter', function() {
      video.play();
    });
    
    thumbnail.addEventListener('mouseleave', function() {
      video.pause();
      video.currentTime = 0;
    });
    
    // Set video to show first frame as thumbnail
    video.addEventListener('loadedmetadata', function() {
      video.currentTime = 0.1;
    });
    
    // Ensure video loads and shows first frame
    video.load();
    
    // Try to show first frame immediately
    video.addEventListener('canplay', function() {
      if (video.readyState >= 2) {
        video.currentTime = 0.1;
      }
    });
  });
});
</script>

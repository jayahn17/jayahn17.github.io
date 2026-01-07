---
permalink: /
title: "About Me"
author_profile: false
redirect_from: 
  - /about/
  - /about.html
---

<style>
.professional-page {
  max-width: 900px;
  margin: 0 auto;
  padding: 40px 20px;
  line-height: 1.8;
  font-family: -apple-system, BlinkMacSystemFont, "Segoe UI", Roboto, "Helvetica Neue", Arial, sans-serif;
  color: #e0e0e0;
  background: transparent;
}

#main {
  background: transparent !important;
  box-shadow: none !important;
  margin: 0 !important;
  padding: 0 !important;
}

.professional-header {
  display: flex;
  align-items: center;
  gap: 30px;
  margin-bottom: 40px;
  justify-content: center;
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
  flex: 1;
  text-align: left;
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
  .professional-header {
    flex-direction: column;
    text-align: center;
  }
  
  .professional-header .header-content {
    text-align: center;
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
  overflow: hidden;
  position: relative;
  background: #f5f5f5;
  box-shadow: 0 0 20px rgba(255, 215, 0, 0.4), 0 0 40px rgba(255, 215, 0, 0.2), 0 0 60px rgba(255, 215, 0, 0.1);
  border: 1px solid rgba(255, 215, 0, 0.3);
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

.publication-thumbnail::before {
  content: '';
  position: absolute;
  top: -2px;
  left: -2px;
  right: -2px;
  bottom: -2px;
  background: linear-gradient(135deg, rgba(255, 215, 0, 0.3), rgba(255, 223, 0, 0.1), rgba(255, 215, 0, 0.3));
  border-radius: 8px;
  z-index: -1;
  opacity: 0.6;
  filter: blur(8px);
}

.publication-thumbnail:hover {
  box-shadow: 0 0 30px rgba(255, 215, 0, 0.6), 0 0 50px rgba(255, 215, 0, 0.3), 0 0 70px rgba(255, 215, 0, 0.2);
  border-color: rgba(255, 215, 0, 0.5);
  transform: translateY(-2px);
  transition: all 0.3s ease;
}

.publication-tag {
  position: absolute;
  top: 6px;
  left: 6px;
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
  margin-top: 8px;
  display: flex;
  gap: 10px;
  flex-wrap: wrap;
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

Thank you for stopping by my portfolio! I am currently an M.S. student in Mechanical Engineering at UC Berkeley. I work in the [ICON (Intelligent Control) Lab](https://iconlab.negarmehr.com) under Prof. Negar Mehr, and during my B.S. I was mainly part of the [TAF (Theoretical & Applied Fluid Dynamics) Lab](https://taflab.berkeley.edu) under Prof. Reza Alam. My interests spannd mechanical, electrical, and software engineering, with my strongest focus in robot learning, especially VLA/VLM methods, conventional control systems/theory, and simulation for robotic applications.

During my studies, I worked at **Khameleon Robotics** as a Control & Simulation Engineer Intern, where I developed hardware-in-the-loop lead/follower teleoperation systems for humanoid robots using Nvidia Isaac Sim/Lab. I also worked at **Root Applied Sciences** as a Junior Engineer(Contractor), developing mechanical/hardware solutions for pathogen monitoring systems in Napa Valley. I received my B.S. in Mechanical Engineering from UC Berkeley and completed 2yr coursework at Diablo Valley College.

## Interests

* **Robot Learning:** VLA / VLM for control and dual arm manipulation
* **Control Systems:** Advanced control system and implementation for robotic systems
* **Simulation** NVIDIA Isaac Sim/Lab, Mujoco
* **Reconstruction:** Worldlab, 3Dgrut 3D assest generation

<!-- ## News

* **\[Dec, 2025\]** Working on hardware-in-the-loop teleoperation control system for dual-arm humanoid robot at Khameleon Robotics using NVIDIA Isaac Sim/Lab.

* **\[Nov, 2025\]** Ranked Top 20 / 3400 in U.S. DOE "Power at the Sea Prize" competition with TAF Lab team. Listed as inventor on patent application for "A Multimodal Mobile Sea-based Power Generation and Delivery."

* **\[Fall, 2024\]** Earned second place at design showcase for ME102B Mechatronics project - Robotic Fish with unique tail mechanism design. -->

  </div>
  <div markdown="1">

## Work/Research Experiences

#### Work Experience

<ol class="publication-list">
  <li class="publication-item">
    <span class="publication-number">1.</span>
    <div class="publication-thumbnail" style="position: relative;">
      <video autoplay muted loop playsinline style="width: 100%; height: 100%; object-fit: cover;">
        <source src="/images/kha_move.mov" type="video/quicktime">
      </video>
      <div class="publication-tag" style="position: absolute; bottom: 6px; right: 6px; top: auto; left: auto;">Work</div>
    </div>
    <div class="publication-content">
      <div class="publication-title"><a href="/portfolio/portfolio-5/">Khameleon Robotics (Humanoid Robot Cleaning Startup) : Control & Simulation Engineer Intern</a></div>
      <div class="publication-venue">Built hardware-in-the-loop teleoperation control system in NVIDIA Isaac Sim/Lab for a 13-DOF dual-arm humanoid, streaming real-time joint states from Dynamixel servo controllers. Designed modular control stack supporting collision-aware joint-space and task-space control modes.</div>
      <div class="publication-links">
        <a href="/portfolio/portfolio-5/" class="publication-link">Project Page</a>
      </div>
    </div>
  </li>

  <li class="publication-item">
    <span class="publication-number">2.</span>
    <div class="publication-thumbnail" style="position: relative;">
      <img src="/images/root_deployment.jpg" alt="Root Applied Sciences">
      <div class="publication-tag" style="position: absolute; top: 6px; right: 6px; bottom: auto; left: auto;">Work</div>
    </div>
    <div class="publication-content">
      <div class="publication-title"><a href="/portfolio/portfolio-2/">Root Applied Sciences(AgriTech Startup):  Junior Engineer Contractor, Mechanical / Hardware Engineering Intern</a></div>
      <div class="publication-venue">Managed preparation and maintenance of 80+ devices, ensuring firmware reliability and validatio of the PCB-Solar-Battery-Data follow bridge. Designed and 3D-printed insect-resistant housings, reducing damage by 100% and increasing QC efficiency by 50%. Designed micro-fluid door system using electromagnetic fields with SLA printing.</div>
      <div class="publication-links">
        <a href="/portfolio/portfolio-2/" class="publication-link">Project Page</a>
      </div>
    </div>
  </li>

</ol>

#### Research Experience

<ol class="publication-list">
  <li class="publication-item">
    <span class="publication-number">1.</span>
    <div class="publication-thumbnail" style="position: relative;">
      <video autoplay muted loop playsinline style="width: 100%; height: 100%; object-fit: cover;">
        <source src="/images/MSC_WL2Isaac.webm" type="video/webm">
      </video>
      <div class="publication-tag" style="position: absolute; bottom: 6px; right: 6px; top: auto; left: auto;">Research</div>
    </div>
    <div class="publication-content">
      <div class="publication-title"><a href="/portfolio/portfolio-6/">MSC - 3D Reconstruction</a></div>
      <div class="publication-venue">Implemented Worldlab.ai, Nvidia 3Dgrut, and Isaac Lab to create 3D assets from render-to-sim-to-asset pipeline. Developed comprehensive 3D reconstruction workflow for generating simulation-ready assets.</div>
      <div class="publication-links">
        <a href="/portfolio/portfolio-6/" class="publication-link">Project Page</a>
      </div>
    </div>
  </li>

  <li class="publication-item">
    <span class="publication-number">2.</span>
    <div class="publication-thumbnail" style="position: relative;">
      <img src="/images/TAFlab_lolus.jpeg" alt="TAF Lab">
      <div class="publication-tag" style="position: absolute; bottom: 6px; right: 6px; top: auto; left: auto;">Research</div>
    </div>
    <div class="publication-content">
      <div class="publication-title"><a href="https://taflab.berkeley.edu" target="_blank">TAF Lab</a> <a href="/portfolio/portfolio-1/">(Theoretical & Applied Fluid Dynamics Laboratory) - Prof. M. Reza Alam, UC Berkeley, Undergraduate Research Assistant</a></div>
      <div class="publication-authors">E. Kuo, S. Ahn, A. Khan</div>
      <div class="publication-venue">Ranked Top 20 / 3400 in U.S. DOE "Power at the Sea Prize" competition. 
      Led electronics implementation with 7+ sensors and established wireless communication using XBee protocol. 
      Developed autonomous up/downwind sail motion control and conducted 50+ ocean tests. Listed as inventor on patent application for "A Multimodal Mobile Sea-based Power Generation and Delivery."</div>
      <div class="publication-links">
        <a href="/portfolio/portfolio-1/" class="publication-link">Project Page</a>
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
    <div class="publication-thumbnail" style="position: relative;">
      <img src="/images/me110-0.png" alt="AutomaticSnow Goggles">
      <div class="publication-tag" style="position: absolute; bottom: 6px; right: 6px; top: auto; left: auto;">ME110</div>
    </div>
    <div class="publication-content">
      <div class="publication-title"><a href="/portfolio/portfolio-7/">AutomaticSnow Goggles - Bioinspired Design</a></div>
      <div class="publication-authors">S. Ahn</div>
      <div class="publication-venue">ME110 - Undergrad Project 4, UC Berkeley. Bioinspired snow goggles with automatic lens cleaning mechanism based on bird nictitating membrane.</div>
      <div class="publication-links">
        <a href="/portfolio/portfolio-7/" class="publication-link">Project Page</a>
      </div>
    </div>
  </li>

  <li class="publication-item">
    <span class="publication-number">2.</span>
    <div class="publication-thumbnail" style="position: relative;">
      <img src="/images/caliber_pg1.png" alt="Caliber Platform">
      <div class="publication-tag" style="position: absolute; bottom: 6px; right: 6px; top: auto; left: auto;">Class</div>
    </div>
    <div class="publication-content">
      <div class="publication-title"><a href="/portfolio/portfolio-3/">Caliber - Student Projects Open Source Platform</a></div>
      <div class="publication-authors">S. Ahn</div>
      <div class="publication-venue">Open Source Platform, UC Berkeley, 2025.</div>
    </div>
  </li>

  <!-- <li class="publication-item">
    <span class="publication-number">4.</span>
    <div class="publication-thumbnail" style="position: relative;">
      <img src="/images/CalSol_suspension.png" alt="CalSol">
      <div class="publication-tag" style="position: absolute; bottom: 6px; right: 6px; top: auto; left: auto;">Student Club</div>
    </div>
    <div class="publication-content">
      <div class="publication-title"><a href="/portfolio/portfolio-4/">UC Berkeley Solar Vehicle Team</a></div>
      <div class="publication-authors">S. Ahn</div>
      <div class="publication-venue">UCB Solar Vehicle Team.</div>
    </div>
  </li> -->
</ol>

  </div>
<div markdown="1">

## Student Club

<ol class="publication-list">
  <li class="publication-item">
    <span class="publication-number">1.</span>
    <div class="publication-thumbnail" style="position: relative;">
      <img src="/images/CalSol_suspension.png" alt="CalSol">
      <div class="publication-tag" style="position: absolute; bottom: 6px; right: 6px; top: auto; left: auto;">Research</div>
    </div>
    <div class="publication-content">
      <div class="publication-title"><a href="/portfolio/portfolio-4/">UC Berkeley Solar Vehicle Team, CalSol – Suspension & Battery Team Member</a></div>
      <div class="publication-venue">Consolidated two front suspension brackets, reducing weight by 10% while ensuring safety via SolidWorks FEA Analysis. Reconfigured circuit wiring to optimize battery efficiency, achieving 5% power savings.</div>
      <div class="publication-links">
        <a href="/portfolio/portfolio-4/" class="publication-link">Project Page</a>
      </div>
    </div>
  </li>
</ol>

#### Teaching Experience

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


  </div>

</div>

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

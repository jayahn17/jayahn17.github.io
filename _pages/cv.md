---
permalink: /cv/
title: "CV — SeongJae (Jay) Ahn"
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

I am an M.S. student in Mechanical Engineering at UC Berkeley, working in the [ICON (Intelligent Control) Lab](https://iconlab.negarmehr.com) under Prof. Negar Mehr. My research focuses on robot learning—VLA/VLM for control, dual-arm manipulation—as well as control systems and simulation.

Previously, I was a Control & Simulation Intern at **[Khameleon Robotics](https://www.khameleonrobotics.com)** and a Junior Engineer at **[Root Applied Sciences](https://rootappliedsciences.com)**, working on QA automation and deployment. During my bachelor’s at UC Berkeley, I was part of the [TAF (Theoretical & Applied Fluid Dynamics) Lab](https://taflab.berkeley.edu) under Prof. Reza Alam.

## Research Interests

* **Robot Learning:** ML (VLA, VLM, RL, DeepRL) for dual-arm manipulation
* **Control Systems:** Advanced control theory and implementation in robotic systems
* **Simulation:** NVIDIA Isaac Sim/Lab, MuJoCo
* **3D Reconstruction:** Worldlab, 3Dgrut for 3D asset generation

  </div>
  <div markdown="1">

## Work/Research Experiences

#### Work Experience

<ol class="publication-list">
  <li class="publication-item">
    <span class="publication-number">1.</span>
    <div class="publication-thumbnail">
      <video muted playsinline preload="metadata" poster="/images/kha_move_poster.jpg" style="width: 100%; height: 100%; object-fit: cover;">
        <source src="/images/kha_move.mov" type="video/quicktime">
      </video>
      <div class="publication-tag">Work</div>
    </div>
    <div class="publication-content">
      <div class="publication-title"><a href="/portfolio/portfolio-5/">Khameleon Robotics: Control & Simulation Intern</a></div>
      <div class="publication-venue">Hardware-in-the-loop teleoperation for dual-arm humanoid robot in NVIDIA Isaac Sim/Lab.</div>
      <div class="publication-links">
        <a href="/portfolio/portfolio-5/" class="publication-link">Project Page</a>
      </div>
    </div>
  </li>

  <li class="publication-item">
    <span class="publication-number">2.</span>
    <div class="publication-thumbnail">
      <img src="/images/root_deployment.jpg" alt="Root Applied Sciences">
      <div class="publication-tag">Work</div>
    </div>
    <div class="publication-content">
      <div class="publication-title"><a href="/portfolio/portfolio-2/">Root Applied Sciences: Junior Engineer</a></div>
      <div class="publication-venue">Microfluidics and hardware for pathogen monitoring. Designed 3D-printed housings and supported 80+ field-deployed devices.</div>
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
    <div class="publication-thumbnail">
      <video muted playsinline preload="metadata" poster="/images/icon_front_poster.jpg" style="width: 100%; height: 100%; object-fit: cover;">
        <source src="/images/icon_front_video.mov" type="video/quicktime">
      </video>
      <div class="publication-tag">Research</div>
    </div>
    <div class="publication-content">
      <div class="publication-title"><a href="/portfolio/portfolio-9/">ICON Lab: Robot Learning & Manipulation</a></div>
      <div class="publication-venue">PolicyPlayer demos in robosuite/MuJoCo, Diffusion Policy evaluation, and quadruped RL migration (Go1→Go2) in Isaac Gym.</div>
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
      <div class="publication-venue">Autonomous ocean drone for marine transportation. Led electronics integration and autonomous control. Top 20 in U.S. DOE "Power at the Sea Prize."</div>
      <div class="publication-links">
        <a href="/portfolio/portfolio-1/" class="publication-link">Project Page</a>
      </div>
    </div>
  </li>

  <li class="publication-item">
    <span class="publication-number">3.</span>
    <div class="publication-thumbnail">
      <video muted playsinline preload="metadata" poster="/images/MSC_WL2Isaac_poster.jpg" style="width: 100%; height: 100%; object-fit: cover;">
        <source src="/images/MSC_WL2Isaac.webm" type="video/webm">
      </video>
      <div class="publication-tag">Research</div>
    </div>
    <div class="publication-content">
      <div class="publication-title"><a href="/portfolio/portfolio-6/">Mechanical Systems Control Lab</a></div>
      <div class="publication-venue">3D reconstruction pipeline with Worldlab.ai, NVIDIA 3Dgrut, and Isaac Lab (render-to-sim-to-asset).</div>
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
      <img src="/images/me110-0.png" alt="AutomaticSnow Goggles">
      <div class="publication-tag">ME110</div>
    </div>
    <div class="publication-content">
      <div class="publication-title"><a href="/portfolio/portfolio-7/">AutomaticSnow Goggles - Bioinspired Design</a></div>
      <div class="publication-authors">S. Ahn</div>
      <div class="publication-venue">ME110 — Bioinspired snow goggles with automatic lens cleaning based on bird nictitating membrane.</div>
      <div class="publication-links">
        <a href="/portfolio/portfolio-7/" class="publication-link">Project Page</a>
      </div>
    </div>
  </li>

  <li class="publication-item">
    <span class="publication-number">2.</span>
    <div class="publication-thumbnail">
      <img src="/images/caliber_pg1.png" alt="Caliber Platform">
      <div class="publication-tag">Class</div>
    </div>
    <div class="publication-content">
      <div class="publication-title"><a href="/portfolio/portfolio-3/">Caliber - Student Projects Open Source Platform</a></div>
      <div class="publication-authors">S. Ahn</div>
      <div class="publication-venue">Open source platform with 500+ UC Berkeley student projects; use case research and file management in development.</div>
      <div class="publication-links">
        <a href="/portfolio/portfolio-3/" class="publication-link">Project Page</a>
      </div>
    </div>
  </li>

  <li class="publication-item">
    <span class="publication-number">3.</span>
    <div class="publication-thumbnail">
      <video muted playsinline preload="metadata" poster="/images/me231_result_poster.jpg" style="width: 100%; height: 100%; object-fit: cover;">
        <source src="/images/me231_result_1.mov" type="video/quicktime">
      </video>
      <div class="publication-tag">ME231</div>
    </div>
    <div class="publication-content">
      <div class="publication-title"><a href="/portfolio/portfolio-8/">MPC for Truck-Trailer System with Obstacle Avoidance</a></div>
      <div class="publication-authors">S. Ahn</div>
      <div class="publication-venue">ME231 — MPC for autonomous truck-trailer navigation with dynamic obstacle avoidance (forward and reverse).</div>
      <div class="publication-links">
        <a href="/portfolio/portfolio-8/" class="publication-link">Project Page</a>
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


<script>
// Make project videos show first frame and play on hover (non-autoplay)
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
    
    video.addEventListener('loadedmetadata', function() {
      try { video.currentTime = 0.1; } catch(e) {}
    });
    
    video.load();
  });
});
</script>
---
layout: archive
title: "CV"
permalink: /cv/
author_profile: true
redirect_from:
  - /resume
---

{% include base_path %}

# Seongjae Ahn

Berkeley, CA • [jayahn@berkeley.edu](mailto:jayahn@berkeley.edu) • (628) 529-6598 • [LinkedIn](https://www.linkedin.com/in/seongjae-ahn-126838244/)

## Education

* **Master of Science in Mechanical Engineering**  
  University of California, Berkeley  
  *(Expected, August 2025 – May 2026)*

* **Bachelor of Science in Mechanical Engineering**  
  University of California, Berkeley • December 2024

* **Mechanical Engineering**  
  Diablo Valley College • May 2022

## Work Experience

* **Control & Simulation Engineer Intern**  
  *Khameleon Robotics: Cleaning Humanoid Robot Startup, Mountain View, CA*  
  July 2025 – Present  
  - Built hardware-in-the-loop teleoperation ("puppet") control system in NVIDIA Isaac Sim/Lab for a 13-DOF(6+6+1) dual-arm humanoid, streaming real-time joint states from Dynamixel servo controllers into a PhysX-based USD model.
  - Designed a modular control stack supporting collision-aware joint-space and task-space control modes, enabling rapid iteration and validation of dual manipulation control tests in simulation before on-robot deployment.
  - Reconfigured and synchronized all simulation camera views (eye-in-hand, over-the-shoulder, top-down, and base cameras) based on Leissac(Isaacsim + Lerobot + GROOT) repository for teleoperation, data collection, preparing fine-tunning and VLA operation in the next step.
  - Automated URDF → USD conversion and customizing joint/link remapping for the dual-arm system, including inertia tuning and sensor attachment points, to keep kinematics consistent between CAD, simulation, and real hardware.

* **Graduate Research Assistant**  
  *Prof. Negar Mehr - Intelligent Control (ICON) Lab at UC Berkeley*  
  May 2025 – Present  
  - Designed and implemented a hierarchical PolicyPlayer architecture for both bimanual and single arm tasks (handover objects, peg-in-hole, lift) in robosuite/Mujoco environments and implemented Diffusion Policy.
  - Implemented RL policy in Multiagent-quadruped-environment on both Unitree Go1 and Go2 using Isaac Gym.
  - Validated a dual Kinova3 manipulation setup for two-arm handover task by generating raw waypoint dataset, preprocessing artificial data, and training on a Diffusion Transformer Policy.
  - Evaluated the DiT(Diffusion Policy) result on the learning rate, loss and GPU performance.

* **Junior Engineer (Contractor) / Mechanical / Hardware Engineering Intern**  
  *Root Applied Sciences: Biotechnology company pioneering in Pathogen monitoring system, Emeryville, CA*  
  November 2024 – May 2025 (5 months)  
  - Managed preparation, and maintenance of $80+$ devices, ensuring firmware reliability and real-time control.
  - Designed and 3D-printed insect-resistant housings for field PCBs, reducing insect-related damage by over $100 \%$ and increase productivity in Quality Control time efficiency over $50 \%$.
  - Designed micro-fluid new door system using Electromagnetic fields, using Stereolithography(SLA) which has high accuracy, and low viscosity, ideal for the bacteria/spore solution data collecting system.

* **Generative AI Analyst**  
  *Nvidia*  
  March 2025 – April 2025  
  - Assured QA test on ML training sets across 2000+ frames in accordance with evolving guidelines for guiding AV LLM.

* **Undergraduate Research Assistant**  
  *TAF Lab (Theoretical & Applied Fluid Dynamics Laboratory) - Prof. M. Reza Alam, UC Berkeley*  
  May 2024 – November 2025  
  - Ranked Top 20 / 3400 in the U.S. DOE "Power at the Sea Prize" competition and listed as an inventor on submitted patent application on "A Multimodal Mobile Sea-based Power Generation and Delivery" (patent pending review).
  - Led electronics implementation with 7+ sensors and established wireless communication using XBee protocol for autonomous ocean drone prototype.
  - Developed autonomous up/downwind sail motion control using wind vanes, GPS, magnetometer, motors and designed a real-time raw data acquisition pipeline of Bay Ocean data by bridging device firmware to database.
  - Conducted over 50+ ocean tests and built a real-time raw data acquisition pipeline linking device firmware to a Python database.
  - Pitched to Vice Chancellor in Research at UC Berkeley, presenting the innovative autonomous ocean drone solution.

* **UC Berkeley Solar Vehicle Team, CalSol – Battery & Suspension Team Member**  
  *UC Berkeley Solar Vehicle Team*  
  August 2022 – May 2024  
  - Consolidated two front suspension brackets, reducing weight by 10% while ensuring safety via FEA.
  - Reconfigured circuit wiring to optimize battery efficiency, achieving a 5% power savings.

* **Diablo Valley College Physics Tutor**  
  *Diablo Valley College*  
  August 2021 – May 2022  
  - Tutored students in Engineering Mechanics, Electromagnetics, and Quantum Mechanics.

* **Signal Corps, Squad Leader**  
  *Republic of Korea Army, South Korea*  
  August 2017 – April 2019  
  - Managed PRC-999K defense communication equipment following standard operating procedures.
  - Led and trained Signal Corps troops, earning recognition in the Best Warrior Competition.

## Projects

* **ME102B (Mechatronics): Robotic Fish**  
  Fall 2024  
  - Designed a unique tail mechanism for a robotic fish, earning second place at the design showcase.

* **ME134 (Feedback Control of Dynamic Systems): Magnetic Levitation & Inverted Pendulum**  
  Spring 2024  
  - Developed an analog controller using Simulink and MATLAB to determine parameters for a linearized plant.

* **ME136 (Control of Unmanned Aerial Vehicles): Hover Control**  
  Fall 2023  
  - Achieved autonomous control with optimized algorithms on the NuttX Virtual Machine.
  - Performed flight dynamics analysis, placing in the top 30% of the class.

## Skills

**Software:** Python, C++, Linux, MATLAB, Simulink, Nvidia Isaac Sim/Lab, Mujoco, Robosuite, Docker, PyTorch  
**Mechanical/Hardware:** CAD (OnShape, SolidWorks), Rapid prototyping, 3D printing

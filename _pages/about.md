---
permalink: /
title: "About Me"
author_profile: true
redirect_from: 
  - /about/
  - /about.html
---

<div class="hero-section">
  <div class="hero-content">
    <img src="/images/seongjaeahn.jpeg" alt="SeongJae Ahn" class="hero-avatar">
    <h1 class="hero-title">SeongJae (Jay) Ahn</h1>
    <p class="hero-subtitle">Controls & Robotics Engineer</p>
    <p class="hero-tagline">Building the Future of Autonomous Systems | M.S. ME @ UC Berkeley</p>
    
    <div class="hero-stats">
      <div class="hero-stat">
        <span class="hero-stat-number">7+</span>
        <span class="hero-stat-label">Projects</span>
      </div>
      <div class="hero-stat">
        <span class="hero-stat-number">3+</span>
        <span class="hero-stat-label">Years Experience</span>
      </div>
      <div class="hero-stat">
        <span class="hero-stat-number">UCB</span>
        <span class="hero-stat-label">M.S. Mechanical Engineering</span>
      </div>
    </div>
    
    <div class="skill-badges">
      <span class="skill-badge">Python</span>
      <span class="skill-badge">C++</span>
      <span class="skill-badge">ROS</span>
      <span class="skill-badge">Isaac Sim</span>
      <span class="skill-badge">Mujoco</span>
      <span class="skill-badge">Robotics</span>
      <span class="skill-badge">Control Systems</span>
      <span class="skill-badge">Machine Learning</span>
    </div>
    
    <div class="hero-cta">
      <a href="/portfolio/" class="hero-btn">View My Work</a>
      <a href="/cv/" class="hero-btn secondary">Download CV</a>
    </div>
  </div>
</div>

M.S. Mechanical Engineering student focusing on Controls and Robotics. I'm fascinated by how everyday technological developments shape people's lives, and I'd want to be part of the shaper. 

I recognize my desire not only to follow these innovations, but also to be part of the teams that create them and lead their continued development around the world. My goal is to keep learning—1% at a time, today and tomorrow.

## Timeline of Academics

<style>
.timeline {
  position: relative;
  max-width: 800px;
  margin: 40px auto;
  padding: 20px 0;
}

.timeline::before {
  content: '';
  position: absolute;
  left: 50%;
  top: 0;
  bottom: 0;
  width: 3px;
  background: var(--global-border-color, #ddd);
  transform: translateX(-50%);
}

.timeline-item {
  position: relative;
  margin: 30px 0;
  width: 50%;
  padding: 20px;
  background: var(--global-bg-color, #fff);
  border-radius: 8px;
  box-shadow: 0 2px 8px rgba(0,0,0,0.1);
}

.timeline-item:nth-child(odd) {
  left: 0;
  text-align: right;
  padding-right: 50px;
}

.timeline-item:nth-child(even) {
  left: 50%;
  text-align: left;
  padding-left: 50px;
}

.timeline-item::before {
  content: '';
  position: absolute;
  width: 16px;
  height: 16px;
  background: var(--global-theme-color, #0066cc);
  border: 3px solid var(--global-bg-color, #fff);
  border-radius: 50%;
  top: 50%;
  transform: translateY(-50%);
}

.timeline-item:nth-child(odd)::before {
  right: -8px;
}

.timeline-item:nth-child(even)::before {
  left: -8px;
}

.timeline-year {
  font-size: 1.2em;
  font-weight: bold;
  color: var(--global-theme-color, #0066cc);
  margin-bottom: 8px;
}

.timeline-content {
  font-size: 1em;
  line-height: 1.6;
}

.timeline-item.military {
  background: repeating-linear-gradient(
    45deg,
    #2d5016 0px,
    #2d5016 20px,
    #1a3009 20px,
    #1a3009 40px,
    #0d0d0d 40px,
    #0d0d0d 60px,
    #2d5016 60px,
    #2d5016 80px
  );
  background-size: 113px 113px;
  color: #fff;
  border: 2px solid #1a3009;
  position: relative;
}

.timeline-item.military::after {
  content: '';
  position: absolute;
  top: 0;
  left: 0;
  right: 0;
  bottom: 0;
  background: repeating-linear-gradient(
    -45deg,
    transparent 0px,
    transparent 20px,
    rgba(0,0,0,0.3) 20px,
    rgba(0,0,0,0.3) 40px
  );
  background-size: 113px 113px;
  pointer-events: none;
}

.timeline-item.military .timeline-year {
  color: #fff;
  text-shadow: 1px 1px 2px rgba(0,0,0,0.8);
}

.timeline-item.military .timeline-content {
  color: #fff;
  text-shadow: 1px 1px 2px rgba(0,0,0,0.8);
}

.timeline-item.military::before {
  background: #2d5016;
  border-color: #1a3009;
  box-shadow: 0 0 0 2px #0d0d0d;
}

.timeline-item.dvc {
  background: #2d7a32;
  color: #fff;
  border: 2px solid #1b5e20;
}

.timeline-item.dvc .timeline-year {
  color: #fff;
  text-shadow: 1px 1px 2px rgba(0,0,0,0.3);
}

.timeline-item.dvc .timeline-content {
  color: #fff;
  text-shadow: 1px 1px 2px rgba(0,0,0,0.3);
}

.timeline-item.dvc::before {
  background: #2d7a32;
  border-color: #1b5e20;
  box-shadow: 0 0 0 2px #0d4f1a;
}

.timeline-item.berkeley {
  background: linear-gradient(135deg, #FDB515 0%, #FDB515 50%, #003262 50%, #003262 100%);
  color: #fff;
  border: 2px solid #003262;
}

.timeline-item.berkeley .timeline-year {
  color: #fff;
  text-shadow: 1px 1px 2px rgba(0,0,0,0.5);
}

.timeline-item.berkeley .timeline-content {
  color: #fff;
  text-shadow: 1px 1px 2px rgba(0,0,0,0.5);
}

.timeline-item.berkeley::before {
  background: #FDB515;
  border-color: #003262;
  box-shadow: 0 0 0 2px #003262;
}

@media (max-width: 768px) {
  .timeline::before {
    left: 20px;
  }
  
  .timeline-item {
    width: 100%;
    left: 0 !important;
    text-align: left !important;
    padding-left: 50px !important;
    padding-right: 20px !important;
  }
  
  .timeline-item::before {
    left: 12px !important;
  }
}
</style>

<div class="timeline">
  <div class="timeline-item military">
    <div class="timeline-year">2017 - 2019</div>
    <div class="timeline-content">Republic of Korea Army<br>Signal Corps, Squad Leader</div>
  </div>
  
  <div class="timeline-item dvc">
    <div class="timeline-year">2020 - 2022</div>
    <div class="timeline-content">Mechanical Engineering<br>Diablo Valley College</div>
  </div>
  
  <div class="timeline-item berkeley">
    <div class="timeline-year">2022 - 2024</div>
    <div class="timeline-content">B.S. in Mechanical Engineering<br>University of California, Berkeley</div>
  </div>
  
  <div class="timeline-item berkeley">
    <div class="timeline-year">2025</div>
    <div class="timeline-content">M.S. in Mechanical Engineering<br>University of California, Berkeley</div>
  </div>
</div>

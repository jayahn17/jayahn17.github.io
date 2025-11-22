---
permalink: /
title: "About"
author_profile: true
redirect_from: 
  - /about/
  - /about.html
---

I'm an M.S. Mechanical Engineering student in controls and simulation, fascinated by how technology works and how it connects to people. I was once the only one who didn't know. Now my goal is simple: keep learning, 0.1% at a time, and pass it on.

## Timeline

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
  <div class="timeline-item">
    <div class="timeline-year">2017 - 2019</div>
    <div class="timeline-content">Republic of Korea Army<br>Signal Corps, Squad Leader</div>
  </div>
  
  <div class="timeline-item">
    <div class="timeline-year">2020 - 2022</div>
    <div class="timeline-content">Mechanical Engineering<br>Diablo Valley College</div>
  </div>
  
  <div class="timeline-item">
    <div class="timeline-year">2022 - 2024</div>
    <div class="timeline-content">B.S. in Mechanical Engineering<br>University of California, Berkeley</div>
  </div>
  
  <div class="timeline-item">
    <div class="timeline-year">2025</div>
    <div class="timeline-content">M.S. in Mechanical Engineering<br>University of California, Berkeley</div>
  </div>
</div>

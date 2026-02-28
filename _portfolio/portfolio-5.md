---
title: "Khameleon Robotics - Humanoid Control and Simulation Platform"
excerpt: "Controls and simulation development for a 13-DOF humanoid arm with lead/follower manipulation and Isaac Sim/Lab training workflows."
collection: portfolio
category: work
date: 2024-12-01
share: false
teaser: "kha_grab_img.png"
header:
  teaser: "kha_grab_img.png"
---

## Khameleon Robotics - Controls & Simulation Intern

### Context
At Khameleon Robotics, I worked on a simulation-first pipeline for bimanual humanoid manipulation with training-ready data capture. The objective was to create a stable development baseline for coordinated control and model training before hardware-heavy iterations.

### System Scope
- Robot model: 13-DOF humanoid arm in NVIDIA Isaac Sim/Lab.
- Command side: 12-DOF puppet controller using Dynamixel XC-330 servos.
- Use cases: teleoperation and manipulation tasks requiring lead/follower behavior.
- Training: collision-avoidance tasks in Isaac Lab.

### Technical Contributions
**Simulation Pipeline**
- Set up end-to-end Isaac Sim/Lab workflow from robot import to dynamic behavior verification.
- Configured articulation properties, collision primitives, and controller timing for stable real-time simulation.
- Aligned simulation settings with expected training data requirements.

**Control Architecture**
- Integrated 12-DOF puppet controller with a bimanual arm model.
- Designed lead/follower motion transfer logic for coordinated manipulation.
- Tuned control loops for smooth transitions and low-latency behavior.

**Multi-camera and Data Capture**
- Positioned five camera viewpoints (front, back, left, right, chest) for full manipulation visibility.
- Built camera calibration and rendering settings to support both teleop and learning dataset generation.
- Reduced occlusion by validating view combinations against the interaction envelope.

**Training Environment Design**
- Created task scenes for collision avoidance and bimanual object handling.
- Built simulation scenarios with tuned complexity so learning runs remained computationally efficient.

### Outcomes
- Delivered a full Isaac Sim/Lab stack for 13-DOF humanoid arm development.
- Implemented lead/follower bimanual control with 12 servo-driven DOFs.
- Produced five-view sensing coverage for operator control and dataset generation.
- Enabled repeatable collision-avoidance/manipulation training deployments.

### Visuals

<div style="display: flex; justify-content: center; margin: 20px 0;">
  <img src="/images/kha_top_cam.png" alt="Khameleon Top Camera" style="width: 100%; max-width: 800px; height: auto; border-radius: 8px; box-shadow: 0 4px 12px rgba(0,0,0,0.1); object-fit: contain;">
</div>

<div style="display: flex; justify-content: center; margin: 20px 0;">
  <video width="100%" controls style="max-width: 800px; border-radius: 8px; box-shadow: 0 4px 12px rgba(0,0,0,0.1);">
    <source src="/images/kha_grab_little.mp4" type="video/mp4">
    <source src="/images/kha_grab_little.mov" type="video/quicktime">
    Your browser does not support the video tag.
  </video>
</div>

### Project Videos

<div style="position: relative; padding-bottom: 56.25%; height: 0; overflow: hidden; max-width: 100%; margin: 20px 0; border-radius: 8px; box-shadow: 0 4px 12px rgba(0,0,0,0.15);">
  <iframe style="position: absolute; top: 0; left: 0; width: 100%; height: 100%; border-radius: 8px;" 
          src="https://www.youtube.com/embed/YaZquZc88fw" 
          frameborder="0" 
          allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture" 
          allowfullscreen>
  </iframe>
</div>


<div style="display: flex; justify-content: center; margin: 20px 0;">
  <video width="100%" controls style="max-width: 800px; border-radius: 8px; box-shadow: 0 4px 12px rgba(0,0,0,0.1);">
    <source src="/images/kha_khaleisaac_top.webm" type="video/webm">
    Your browser does not support the video tag.
  </video>
</div>

### Walkthrough Notes

<div style="display: grid; grid-template-columns: repeat(auto-fit, minmax(220px, 1fr)); gap: 16px; margin: 20px 0;">
  <div style="background: #fff; padding: 16px; border-radius: 8px; box-shadow: 0 4px 12px rgba(0,0,0,0.08);">
    <strong>Screen 1 - System Architecture</strong>
    <p style="margin-top:8px;">Mapping of sensors, compute, and communication paths for teleoperation and simulation.</p>
  </div>
  <div style="background: #fff; padding: 16px; border-radius: 8px; box-shadow: 0 4px 12px rgba(0,0,0,0.08);">
    <strong>Screen 2 - Control Stack</strong>
    <p style="margin-top:8px;">12-DOF puppet controller built around Dynamixel XC-330 hardware.</p>
  </div>
  <div style="background: #fff; padding: 16px; border-radius: 8px; box-shadow: 0 4px 12px rgba(0,0,0,0.08);">
    <strong>Screen 3 - Simulation Pipeline</strong>
    <p style="margin-top:8px;">Isaac Sim/Lab environment with collision and rendering configured for learning.</p>
  </div>
  <div style="background: #fff; padding: 16px; border-radius: 8px; box-shadow: 0 4px 12px rgba(0,0,0,0.08);">
    <strong>Screen 4 - Results and Metrics</strong>
    <p style="margin-top:8px;">Validation outputs from control quality and teleoperation coverage tests.</p>
  </div>
</div>

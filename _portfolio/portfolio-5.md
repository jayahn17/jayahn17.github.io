---
title: "Khameleon Robotics - Humanoid Control and Simulation Platform"
excerpt: "Controls and simulation development for a 13-DOF humanoid arm with leader/follower teleoperation, multi-camera capture, and Isaac Sim / Isaac Lab training workflows."
collection: portfolio
category: work
date: 2025-07-01
role: "Control & Simulation Engineer Intern"
duration: "July 2025 – Present"
tech_tags: ["Isaac Sim", "Isaac Lab", "Dynamixel", "Teleoperation"]
share: false
teaser: "kha_grab_img.png"
header:
  teaser: "kha_grab_img.png"
---

## Khameleon Robotics - Controls & Simulation Intern

### Context
At Khameleon Robotics, I worked on a simulation-first pipeline for bimanual humanoid manipulation with training-ready data capture. The objective was to create a stable development baseline for coordinated control and learning workflows before more hardware-heavy iterations.

### System Scope
- Robot model: 13-DOF humanoid arm in NVIDIA Isaac Sim and Isaac Lab.
- Command side: 12-DOF puppet controller using Dynamixel XC-330 servos.
- Use cases: teleoperation and manipulation tasks requiring leader/follower behavior.
- Training target: collision-avoidance and bimanual interaction tasks in Isaac Lab.

### Technical Contributions
**Simulation Pipeline**
- Set up an end-to-end Isaac Sim and Isaac Lab workflow, from robot import to dynamic behavior verification.
- Configured articulation properties, collision primitives, and controller timing for stable real-time simulation.
- Aligned simulation settings with expected training-data requirements.

**Control Architecture**
- Integrated a 12-DOF puppet controller with a bimanual arm model.
- Designed leader/follower motion-transfer logic for coordinated manipulation.
- Tuned control loops for smooth transitions and low-latency behavior.

**Multi-Camera and Data Capture**
- Positioned five camera viewpoints (front, back, left, right, chest) for full manipulation visibility.
- Built camera calibration and rendering settings to support both teleop and learning dataset generation.
- Reduced occlusion by validating viewpoint combinations against the interaction envelope.

**Training Environment Design**
- Created task scenes for collision avoidance and bimanual object handling.
- Built simulation scenarios with tuned complexity so learning runs stayed computationally efficient.

### Outcomes
- Delivered a full Isaac Sim and Isaac Lab stack for 13-DOF humanoid arm development.
- Implemented leader/follower bimanual control with 12 servo-driven DOFs.
- Produced five-view sensing coverage for operator control and dataset generation.
- Enabled repeatable collision-avoidance and manipulation training deployments.

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

### Walkthrough Highlights

<div style="display: grid; grid-template-columns: repeat(auto-fit, minmax(220px, 1fr)); gap: 16px; margin: 20px 0;">
  <div style="background: #fff; padding: 16px; border-radius: 8px; box-shadow: 0 4px 12px rgba(0,0,0,0.08);">
    <img src="/images/kha_top_cam.png" alt="Multi-camera sensing layout" style="width: 100%; border-radius: 6px; margin-bottom: 10px;">
    <strong>Multi-camera sensing</strong>
    <p style="margin-top:8px;">Five viewpoints (front, back, left, right, chest) for teleoperation and dataset capture.</p>
  </div>
  <div style="background: #fff; padding: 16px; border-radius: 8px; box-shadow: 0 4px 12px rgba(0,0,0,0.08);">
    <img src="/images/kha_grab_img.png" alt="Leader/follower teleoperation" style="width: 100%; border-radius: 6px; margin-bottom: 10px;">
    <strong>Leader/follower control</strong>
    <p style="margin-top:8px;">12-DOF puppet controller built around Dynamixel XC-330 hardware.</p>
  </div>
  <div style="background: #fff; padding: 16px; border-radius: 8px; box-shadow: 0 4px 12px rgba(0,0,0,0.08);">
    <strong>Isaac Sim / Isaac Lab pipeline</strong>
    <p style="margin-top:8px;">13-DOF humanoid arm with collision primitives, articulation tuning, and training-ready scenes.</p>
  </div>
  <div style="background: #fff; padding: 16px; border-radius: 8px; box-shadow: 0 4px 12px rgba(0,0,0,0.08);">
    <strong>LeIsaac data workflow</strong>
    <p style="margin-top:8px;">Camera sync, URDF-to-USD conversion, and validation for imitation-learning datasets.</p>
  </div>
</div>

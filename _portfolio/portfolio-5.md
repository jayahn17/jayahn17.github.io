---
title: "Khameleon Robotics"
excerpt: "Controls & Simulation Intern - Advanced robotics controls and simulation development"
collection: portfolio
category: work
date: 2024-12-01
share: false
header:
  teaser: "kha_grab_img.png"
---

## Khameleon Robotics - Controls & Simulation Intern

### Project Overview

As a Controls & Simulation Intern at Khameleon Robotics, I was responsible for setting up reliable simulation in NVIDIA Isaac Sim/Lab and creating a lead/follower environment for humanoid robot control and training.

### Contributions

**Simulation Pipeline Development:**
- Set up a complete NVIDIA Isaac Sim/Lab pipeline for a 13-DOF humanoid arm system based on research white papers
- Configured physics simulation environment with accurate robot dynamics and collision detection
- Implemented real-time simulation capabilities for testing and validation of control algorithms

**Control System Integration:**
- Synchronized a 12-DOF puppet controller with a bimanual arm system for coordinated manipulation
- Developed lead/follower control architecture where one arm follows the other's motion
- Integrated Dynamixel XC-330 servo motor controllers (12 motors) with simulation environment
- Implemented control algorithms for smooth and precise bimanual coordination

**Multi-Camera System:**
- Generated and configured multiple camera views (front, back, left, right, chest angles) for comprehensive visual feedback
- Set up camera calibration and rendering pipeline for training data collection, considering occlusion from top and bottom views
- Integrated camera feeds into simulation environment for vision-based control and learning

**Training Environment:**
- Created collision avoidance test environments in NVIDIA Isaac Lab for training reinforcement learning models
- Developed custom training scenarios for bimanual manipulation tasks and optimized simulation performance for efficient data collection and model training


### Key Achievements
- Set up an NVIDIA Isaac Sim/Lab pipeline for a 13-DOF humanoid arm based on a white paper
- Synchronized a 12-DOF puppet controller with a bimanual arm
- Generated camera views from front/back/left/right/chest angles
- Deployed training environments for collision avoidance and manipulation tasks

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
    <source src="/images/khameleon_video.mp4" type="video/mp4">
    <source src="/images/khameleon_video.mov" type="video/quicktime">
    Your browser does not support the video tag.
  </video>
</div>

<div style="display: flex; justify-content: center; margin: 20px 0;">
  <video width="100%" controls style="max-width: 800px; border-radius: 8px; box-shadow: 0 4px 12px rgba(0,0,0,0.1);">
    <source src="/images/kha_khaleisaac_top.webm" type="video/webm">
    Your browser does not support the video tag.
  </video>
</div>

### Walkthrough / Section Explanations

<div style="display: grid; grid-template-columns: repeat(auto-fit, minmax(220px, 1fr)); gap: 16px; margin: 20px 0;">
  <div style="background: #fff; padding: 16px; border-radius: 8px; box-shadow: 0 4px 12px rgba(0,0,0,0.08);">
    <strong>Screen 1 — System Architecture</strong>
    <p style="margin-top:8px;">Explains sensors, compute, and communication flow. (Editable)</p>
  </div>
  <div style="background: #fff; padding: 16px; border-radius: 8px; box-shadow: 0 4px 12px rgba(0,0,0,0.08);">
    <strong>Screen 2 — Control Stack</strong>
    <p style="margin-top:8px;">12-DOF puppet controller using 12 Dynamixel XC-330 servo motors</p>
  </div>
  <div style="background: #fff; padding: 16px; border-radius: 8px; box-shadow: 0 4px 12px rgba(0,0,0,0.08);">
    <strong>Screen 3 — Simulation & Data Pipeline</strong>
    <p style="margin-top:8px;">Built custom pipeline using NVIDIA Isaac Sim/Lab</p>
  </div>
  <div style="background: #fff; padding: 16px; border-radius: 8px; box-shadow: 0 4px 12px rgba(0,0,0,0.08);">
    <strong>Screen 4 — Results & Metrics</strong>
    <p style="margin-top:8px;">Created four camera-angle views and deployed units in the Isaac Lab environment for collision-avoidance testing and training</p>
  </div>
</div>


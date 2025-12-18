---
title: "Spider Robot - Robotic Locomotion"
excerpt: "ME239 - Robotic Locomotion coursework project. Analysis on Jacobian in 4-legged robot locomotion with forward jump controls. <br/><img src='/images/me239_front_pg.png' style='max-width: 50%;'>"
collection: portfolio
category: class
date: 2025-12-02
---

## ME239 - Robotic Locomotion

### Project Overview

This project was completed as part of ME239 (Robotic Locomotion) coursework at UC Berkeley. The project focused on developing control algorithms for a four-legged spider robot, analyzing kinematic and dynamic properties, and implementing forward jumping locomotion.

This Robotic Locomotion Control Algorithm has been developed based on an open source spider robot CAD hardware model from [ZaidHJaber's repository](https://github.com/ZaidHJaber/Four-legged-Spider-Robot-RL-locomotion). Huge thanks to ZaidHJaber for providing the foundation model for the spider robot!

### My Contributions

**Kinematic Analysis:**
- Performed detailed Jacobian analysis for 4-legged robot locomotion to understand velocity relationships between joint space and task space
- Analyzed forward and inverse kinematics for the quadruped robot structure
- Computed workspace and singularity analysis to determine feasible motion ranges

**Control Algorithm Development:**
- Validated feasibility of the open source CAD model and framework for control implementation
- Developed forward jump control algorithm that coordinates all four legs for jumping motion
- Implemented trajectory planning for smooth takeoff, flight, and landing phases
- Designed control sequences that synchronize leg movements for stable jumping locomotion

**Simulation & Validation:**
- Implemented control algorithms in MATLAB/Simulink environment for initial testing
- Validated control performance through simulation before hardware implementation
- Transitioned simulation to Nvidia Isaac Lab environment for more advanced physics simulation and training

**System Integration:**
- Integrated control algorithms with robot hardware model
- Tested and refined control parameters for optimal jumping performance
- Analyzed dynamic behavior during jumping motion to ensure stability

### Key Features

- Analysis on Jacobian in 4 legged robot locomotions
- Check feasibility of the unit from the open source CAD and framework, and developed 'forward jump' controls

### Project Videos

<div style="display: grid; grid-template-columns: repeat(auto-fit, minmax(400px, 1fr)); gap: 20px; margin: 20px 0;">
  <div>
    <video width="100%" controls style="border-radius: 8px; box-shadow: 0 4px 12px rgba(0,0,0,0.1);">
      <source src="/images/me239_1.mov" type="video/quicktime">
      Your browser does not support the video tag.
    </video>
    <p style="margin-top: 8px; font-size: 0.9em; color: #666;"><strong>Forward Jump Control:</strong> Demonstration of coordinated jumping motion</p>
  </div>
  
  <div>
    <video width="100%" controls style="border-radius: 8px; box-shadow: 0 4px 12px rgba(0,0,0,0.1);">
      <source src="/images/ME239_video_1.mov" type="video/quicktime">
      Your browser does not support the video tag.
    </video>
    <p style="margin-top: 8px; font-size: 0.9em; color: #666;"><strong>Locomotion Analysis:</strong> Robot movement and control validation</p>
  </div>
</div>

### Related: Transition to Nvidia Isaac Lab Environment

After completing the initial implementation in MATLAB/Simulink, I transitioned the project to Nvidia Isaac Lab environment for more advanced physics simulation and potential reinforcement learning applications.

<div style="display: flex; justify-content: center; margin: 20px 0;">
  <video width="100%" controls style="max-width: 800px; border-radius: 8px; box-shadow: 0 4px 12px rgba(0,0,0,0.1);">
    <source src="/images/khameleon_video.mov" type="video/quicktime">
    Your browser does not support the video tag.
  </video>
</div>


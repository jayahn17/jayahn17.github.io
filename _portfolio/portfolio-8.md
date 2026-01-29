---
title: "MPC for Truck-Trailer System with Obstacle Avoidance"
excerpt: "Model Predictive Control implementation for truck-trailer navigation with obstacle avoidance in forward and reverse motion"
collection: portfolio
category: class
date: 2024-12-01
share: false
---

## MPC (Model Predictive Control) for Truck-Trailer System

### Project Overview

This project implements Model Predictive Control (MPC) for autonomous navigation of a truck-trailer system with obstacle avoidance capabilities. My role focused on developing the obstacle avoidance system that enables the truck-trailer to navigate both forward and backward while dynamically avoiding moving obstacles in real-time.

<div style="display: flex; justify-content: center; margin: 20px 0;">
  <video width="100%" controls style="max-width: 800px; border-radius: 8px; box-shadow: 0 4px 12px rgba(0,0,0,0.1);">
    <source src="/images/me231_result_1.mov" type="video/quicktime">
    Your browser does not support the video tag.
  </video>
</div>

### Project Video

<div style="position: relative; padding-bottom: 56.25%; height: 0; overflow: hidden; max-width: 100%; margin: 20px 0; border-radius: 8px; box-shadow: 0 4px 12px rgba(0,0,0,0.15);">
  <iframe style="position: absolute; top: 0; left: 0; width: 100%; height: 100%; border-radius: 8px;" 
          src="https://www.youtube.com/embed/OLZXH1YNP-M" 
          frameborder="0" 
          allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture" 
          allowfullscreen>
  </iframe>
</div>

### Obstacle Avoidance Implementation

**Forward Navigation with Obstacle Avoidance:**
- Developed obstacle avoidance constraints integrated into the MPC optimization framework
- Implemented dynamic obstacle prediction that accounts for moving obstacles with varying velocities
- Designed safety margin system that combines obstacle radius, truck-trailer footprint, and additional safety buffer
- Optimized trajectory planning to navigate around obstacles while maintaining path efficiency
- Handled infeasibility cases when obstacles block the path by implementing adaptive constraint relaxation
- Successfully demonstrated navigation through complex obstacle scenarios with 3+ moving obstacles

**Reverse/Backward Navigation with Obstacle Avoidance:**
- Extended obstacle avoidance to reverse navigation mode, which is more challenging due to system dynamics
- Adapted obstacle prediction and safety constraints for backward motion
- Implemented reverse velocity constraints while maintaining obstacle avoidance capabilities
- Successfully demonstrated obstacle avoidance in reverse parking and maneuvering scenarios
- Validated system performance with multiple moving obstacles in reverse navigation

### Key Achievements

- Successfully navigated truck-trailer system through complex obstacle scenarios in both forward and reverse motion
- Demonstrated robust obstacle avoidance with multiple moving obstacles (3+ obstacles) simultaneously
- Achieved real-time performance with dynamic obstacle prediction and constraint handling
- Maintained system stability and constraint satisfaction throughout navigation


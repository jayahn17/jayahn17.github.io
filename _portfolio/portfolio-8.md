---
title: "MPC for Truck-Trailer System with Obstacle Avoidance"
excerpt: "Model Predictive Control implementation for truck-trailer navigation with obstacle avoidance in forward and reverse motion"
collection: portfolio
category: class
date: 2024-12-01
---

## MPC (Model Predictive Control) for Truck-Trailer System

### Project Overview

This project implements Model Predictive Control (MPC) for autonomous navigation of a truck-trailer system with obstacle avoidance capabilities. The system can navigate both forward and backward while dynamically avoiding moving obstacles in real-time. The MPC controller optimizes the trajectory by predicting future states and computing optimal control inputs while satisfying constraints including obstacle avoidance, jackknife prevention, and actuator limits.

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

### Key Contributions

**Obstacle Avoidance Implementation:**
- Developed obstacle avoidance constraints for MPC optimization using Pyomo
- Implemented dynamic obstacle prediction that accounts for moving obstacles with varying velocities
- Designed safety margin system that combines obstacle radius, truck-trailer footprint, and additional safety buffer
- Created collision detection and avoidance for both forward and reverse navigation modes

**Forward MPC with Obstacle Avoidance:**
- Implemented forward navigation MPC with multiple moving obstacles
- Optimized trajectory planning to navigate around obstacles while maintaining path efficiency
- Handled infeasibility cases when obstacles block the path by implementing adaptive constraint relaxation
- Achieved successful navigation through complex obstacle scenarios with 3+ moving obstacles

**Backward/Reverse MPC with Obstacle Avoidance:**
- Extended obstacle avoidance to reverse navigation mode, which is more challenging due to system dynamics
- Implemented reverse velocity constraints and adapted obstacle prediction for backward motion
- Successfully demonstrated obstacle avoidance in reverse parking and maneuvering scenarios
- Validated system performance with multiple moving obstacles in reverse navigation

### Technical Implementation

**MPC Formulation:**
- **States:** `[x, y, θ_truck, θ_trailer, v, φ]` - position, orientation angles, velocity, and steering angle
- **Controls:** `[a, φ_dot]` - acceleration and steering rate
- **Constraints:**
  - Obstacle avoidance: `||truck_pos - obstacle_pos|| ≥ safety_radius` for all obstacles at all time steps
  - Jackknife prevention: `|θ_truck - θ_trailer| ≤ max_jackknife_angle`
  - Velocity limits: `v_min ≤ v ≤ v_max`
  - Steering limits: `φ_min ≤ φ ≤ φ_max`
  - Actuator limits: acceleration and steering rate bounds

**Obstacle Avoidance Algorithm:**
- For each obstacle and each prediction horizon time step:
  - Predict obstacle position: `obs_pos(t) = obs_pos(0) + obs_velocity × t × dt`
  - Compute minimum safe distance: `min_distance = obs_radius + truck_radius + safety_margin`
  - Enforce quadratic distance constraint: `(x_truck - x_obs)² + (y_truck - y_obs)² ≥ min_distance²`
- Handle moving obstacles by updating positions at each MPC iteration
- Implement adaptive constraint relaxation when obstacles block target path

**Solver Configuration:**
- Used IPOPT solver with Pyomo for nonlinear optimization
- Configured solver parameters for real-time performance (max_iter: 500-2000, tolerance: 1e-5 to 1e-6)
- Implemented warm-start strategy using previous solution as initial guess
- Added infeasibility handling for cases where obstacles completely block the path

### Results

- Successfully navigated truck-trailer system through complex obstacle scenarios
- Demonstrated robust obstacle avoidance in both forward and reverse motion
- Achieved real-time performance with MPC horizon of 10-30 time steps
- Validated system with multiple moving obstacles (3+ obstacles) simultaneously
- Maintained system stability and constraint satisfaction throughout navigation

### Technical Stack

- **Optimization:** Pyomo, IPOPT solver
- **Dynamics Modeling:** Nonlinear truck-trailer dynamics with kinematic constraints
- **Visualization:** Matplotlib for trajectory plotting and animation
- **Language:** Python

### Project Documents

- Final Presentation: [ME231 Final Presentation](/images/me_231_Final%20Presentation.pptx)
- Final Report: [ME231 Final Project Report](/images/me231_Final%20project%20_%20Report%20by%20legends.docx)
- Implementation Notebook: [Truck and Trailer MPC Implementation](/images/truck_n_trailer%20v3.ipynb)


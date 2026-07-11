---
title: "MPC for Truck-Trailer System with Obstacle Avoidance"
excerpt: "Model Predictive Control for truck-trailer navigation with forward and reverse obstacle avoidance under dynamic constraints."
collection: portfolio
category: class
date: 2024-12-01
role: "ME231 — Advanced Controls"
duration: "Fall 2024"
tech_tags: ["MPC", "MATLAB", "Obstacle Avoidance"]
share: false
teaser: "me231_result_1.png"
header:
  teaser: "me231_result_1.png"
---

## MPC (Model Predictive Control) for Truck-Trailer System

### Context
As a class project, I implemented obstacle-aware trajectory planning for a truck-trailer system in both forward and reverse driving regimes. The core objective was to maintain stable real-time autonomy in dynamic environments.

### Control Problem
- Solve a constrained optimization problem every control step.
- Guarantee safe motion for a vehicle with large turning radii and trailer articulation dynamics.
- Handle moving obstacles even when feasible paths may not exist on the first pass.

### Approach
**MPC Formulation**
- Defined state and control constraints for truck position, orientation, heading, and trailer articulation.
- Added obstacle constraints with dynamic safety envelopes around moving entities.
- Included adaptive constraint relaxation to preserve feasibility in tight scenarios.

**Forward and Reverse Modes**
- Built mode-specific transition conditions around geometry- and dynamics-dependent limitations.
- Applied different planning bounds to accommodate reverse-motion instability.
- Implemented prediction-aware margin updates for relative velocity and uncertainty.

**Performance Design**
- Tuned horizon and penalty terms for stable responsiveness.
- Prioritized stability and feasibility ahead of aggressive path optimality in challenging obstacle layouts.

### Implementation Highlights
- Embedded dynamic obstacle prediction into the quadratic program at runtime.
- Added multi-obstacle support (validated with 3+ moving obstacles).
- Evaluated trajectory quality for obstacle clearance and convergence in both motion directions.

### Results
- Demonstrated obstacle-avoiding navigation in complex forward and reverse scenarios.
- Maintained real-time execution on dynamic scenes with moving obstacles.
- Preserved constraint satisfaction and system stability in stress cases through adaptive relaxation logic.

### Demonstrations

<div style="display: flex; justify-content: center; margin: 20px 0;">
  <video width="100%" controls style="max-width: 800px; border-radius: 8px; box-shadow: 0 4px 12px rgba(0,0,0,0.1);">
    <source src="/images/me231_result_1.mp4" type="video/mp4">
    <source src="/images/me231_result_1.mov" type="video/quicktime">
    Your browser does not support the video tag.
  </video>
</div>

<div style="position: relative; padding-bottom: 56.25%; height: 0; overflow: hidden; max-width: 100%; margin: 20px 0; border-radius: 8px; box-shadow: 0 4px 12px rgba(0,0,0,0.15);">
  <iframe style="position: absolute; top: 0; left: 0; width: 100%; height: 100%; border-radius: 8px;" 
          src="https://www.youtube.com/embed/OLZXH1YNP-M" 
          frameborder="0" 
          allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture" 
          allowfullscreen>
  </iframe>
</div>

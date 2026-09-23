---
layout: project
track: class
org: "ME231, UC Berkeley"
title: "Model Predictive Control for a Truck-Trailer with Moving Obstacles"
excerpt: "Model Predictive Control for truck-trailer navigation with forward and reverse obstacle avoidance under dynamic constraints."
deck: "A constrained MPC that plans forward and reverse motion for an articulated truck-trailer, predicts moving obstacles inside the optimization, and relaxes constraints adaptively when no feasible path exists on the first pass."
collection: portfolio
category: class
date: 2024-12-01
role: "ME231: Advanced Controls"
duration: "Fall 2024"
tech_tags: ["MPC", "MATLAB", "Obstacle Avoidance"]
tools: "MATLAB, model predictive control, quadratic programming"
share: false
teaser: "me231_result_1.png"
header:
  teaser: "me231_result_1.png"
card_video: true
hero:
  video: "me231_result_1.mp4"
  poster: "me231_result_1.png"
  autoplay: true
  caption: "**Reverse navigation.** The trailer is steered backwards around obstacles while the MPC keeps articulation and heading inside their constraint sets."
stats:
  - { value: "3+", label: "moving obstacles handled" }
  - { value: "2 modes", label: "forward and reverse planning" }
  - { value: "real time", label: "execution on dynamic scenes" }
---

<p class="pj-lede">A truck pulling a trailer has a large turning radius and an articulation angle that can jack-knife, and reversing makes the dynamics unstable. This project plans obstacle-aware trajectories for that system in both driving directions, with the moving obstacles predicted inside the controller rather than avoided after the fact.</p>

## The control problem

- Solve a constrained optimization problem every control step.
- Guarantee safe motion for a vehicle with large turning radii and trailer articulation dynamics.
- Handle moving obstacles even when feasible paths may not exist on the first pass.

## Formulation

**MPC.** State and control constraints cover truck position, orientation, heading, and trailer articulation. Obstacle constraints add dynamic safety envelopes around moving entities, and adaptive constraint relaxation preserves feasibility in tight scenarios.

**Forward and reverse modes.** Mode-specific transition conditions are built around geometry- and dynamics-dependent limits, with different planning bounds to accommodate reverse-motion instability, and prediction-aware margin updates for relative velocity and uncertainty.

**Tuning.** Horizon and penalty terms were tuned for stable responsiveness, prioritizing stability and feasibility ahead of aggressive path optimality in difficult obstacle layouts.

## Implementation

- Dynamic obstacle prediction is embedded into the quadratic program at runtime.
- Multi-obstacle support, validated with three or more moving obstacles.
- Trajectory quality evaluated for obstacle clearance and convergence in both motion directions.

{% include pj/youtube.html id="OLZXH1YNP-M" wide=true caption="**Full demonstration.** Forward and reverse scenarios with moving obstacles, including cases where adaptive relaxation is needed to recover feasibility." %}

## Results

- Obstacle-avoiding navigation in complex forward and reverse scenarios.
- Real-time execution on dynamic scenes with moving obstacles.
- Constraint satisfaction and system stability preserved in stress cases through the adaptive relaxation logic.

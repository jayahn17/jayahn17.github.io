---
layout: project
track: class
org: "ME239, UC Berkeley"
title: "Spider Robot Locomotion: From Jacobians to Isaac Sim"
excerpt: "Robotic locomotion project using Jacobian analysis and phase-based jump control for a four-legged spider robot in MATLAB and Isaac Sim."
deck: "Jacobian-based leg kinematics and a phase-based forward-jump controller for a four-legged spider robot, validated first in MATLAB/Simulink and then migrated into NVIDIA Isaac Sim and Isaac Lab."
collection: portfolio
category: class
date: 2025-12-02
role: "ME239: Robotic Locomotion"
duration: "Fall 2025"
tech_tags: ["Jacobian Analysis", "MATLAB", "Isaac Sim", "Phase Control"]
tools: "MATLAB/Simulink, URDF, NVIDIA Isaac Sim, Isaac Lab"
share: false
teaser: "me239_front_pg.png"
header:
  teaser: "me239_front_pg.png"
card_video: true
hero:
  video: "me239_jump.mp4"
  poster: "posters/me239_jump.jpg"
  autoplay: true
  caption: "**Forward jump.** All four legs are coordinated through takeoff, flight, and landing by a phase-based controller."
media:
  matlab:
    - { video: "me239_spider_jump_1.mp4", poster: "posters/me239_spider_jump_1.jpg", autoplay: true, caption: "**Jump cycle.** Synchronized forward-jump trajectory profiles across all four legs." }
    - { video: "me239_backflip.mp4", poster: "posters/me239_backflip.jpg", autoplay: true, caption: "**Backflip.** The same phase machinery driving a more aggressive maneuver." }
  isaac:
    - { video: "me239_isaac_video.mp4", poster: "posters/me239_isaac_video.jpg", preload: "none", caption: "**Isaac Sim.** The validated controller running on the URDF model under a higher-fidelity physics engine." }
    - { video: "me239_isaac_full.mp4", webm: "me239_isaac.webm", poster: "posters/me239_isaac_full.jpg", preload: "none", caption: "**Isaac Lab.** Full session, including the dynamic response and stability traces used to assess RL readiness." }
---

<p class="pj-lede">Jumping is the hardest thing to ask of a small legged robot: every leg has to leave the ground at the same instant and every leg has to land. This project derives the kinematics that make coordinated leg motion feasible, builds a jump controller on top of them, and checks that the same behavior holds when the model moves from MATLAB into a physics engine.</p>

## The technical problem

- Derive and validate Jacobian-based relationships for coordinated leg motion.
- Create a stable forward-jump trajectory from takeoff to landing.
- Verify that open-source hardware assumptions remained valid in MATLAB and in NVIDIA Isaac Sim.

## Kinematics first

Jacobian analysis connects joint rates to task-space motion for each leg. Forward and inverse kinematics checks confirmed joint limits and workspace bounds, and singularity and workspace studies confirmed that the gait targets were feasible before any controller was written. The result is a formal set of joint-space constraints and feasible kinematic envelopes.

## Phase-based jump control

The controller produces synchronized forward-jump trajectory profiles across all four legs, with phase-based coordination for takeoff, airborne control, and landing stability. Gains were tuned for smooth transitions and reduced oscillation.

{% include pj/grid.html items=page.media.matlab cols=2 %}

## Validation in Isaac Sim and Isaac Lab

Controllers were prototyped and tested in MATLAB/Simulink, then the validated logic was migrated into URDF workflows for higher-fidelity simulation in NVIDIA Isaac Sim and Isaac Lab, where dynamic response and control stability were assessed through simulation traces and video.

{% include pj/grid.html items=page.media.isaac cols=2 %}

## Results

- Formalized joint-space constraints and feasible kinematic envelopes.
- Stable forward-jump cycles in simulation with coordinated leg timing and repeatable landing behavior.
- A migration path from academic modeling tools to simulation-scale validation for RL-ready future work.

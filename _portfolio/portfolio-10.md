---
layout: project
track: class
org: "ME239, UC Berkeley"
title: "Spider Robot Locomotion: From Jacobians to Isaac Sim"
excerpt: "ME239 project: Jacobian leg kinematics and a three-phase jump controller for a four-legged spider robot, simulated in MATLAB/Simulink and NVIDIA Isaac Sim."
deck: "Jacobian leg kinematics and a three-phase jump controller for an open-source four-legged spider robot. In MATLAB/Simulink the robot jumps repeatedly, lands on all four legs each time, and completes a 360° backflip; its URDF model also runs in NVIDIA Isaac Sim 4.5.0."
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
  caption: "**Jump in simulation.** The four-legged robot crouching and jumping under the phase-based controller."
stats:
  - { value: "4", label: "legs synchronized, one Jacobian each" }
  - { value: "3", label: "jump phases: takeoff, flight, landing" }
  - { value: "360°", label: "simulated backflip, landed upright" }
media:
  matlab:
    - { video: "me239_spider_jump_1.mp4", poster: "posters/me239_spider_jump_1.jpg", autoplay: true, caption: "**Spider reference and robot.** High-speed frames of a real jumping spider at 76 ms and 92 ms (left) beside the simulated robot's jump (right)." }
    - { video: "me239_backflip.mp4", poster: "posters/me239_backflip.jpg", autoplay: true, caption: "**Backflip.** The simulated robot rotating through a backflip." }
  isaac:
    - { video: "me239_isaac_video.mp4", poster: "posters/me239_isaac_video.jpg", preload: "none", caption: "**Isaac Sim.** The robot's URDF model running in NVIDIA Isaac Sim, shown from several camera angles." }
    - { video: "me239_isaac_full.mp4", webm: "me239_isaac.webm", poster: "posters/me239_isaac_full.jpg", preload: "none", caption: "**Longer Isaac Sim session.** The robot over a longer run, with its leg motion shown from several viewpoints." }
---

<p class="pj-lede">Can an open-source four-legged spider robot jump? For ME239, I derived each leg's Jacobian to check kinematic feasibility, then built a three-phase jump controller in MATLAB/Simulink. In simulation the robot jumps repeatedly, landing on all four legs each time, and completes a 360° backflip; its URDF model also runs in NVIDIA Isaac Sim.</p>

## Kinematics first

I started from [ZaidHJaber's open-source CAD model](https://github.com/ZaidHJaber/Four-legged-Spider-Robot-RL-locomotion). For each leg \\(i = 1,\dots,4\\), the Jacobian maps joint rates to foot (task-space) velocity:

$$
\dot{\mathbf{x}}_i = J_i(\mathbf{q}_i)\,\dot{\mathbf{q}}_i
$$

Before writing a controller, I used forward and inverse kinematics to confirm that the gait targets stay within joint limits and workspace bounds and away from singularities, where \\(J_i\\) loses rank.

## Phase-based jump control

The controller synchronizes the four legs' forward-jump trajectories through takeoff, flight, and landing. I prototyped it in MATLAB/Simulink, tuning gains for smooth phase transitions and less oscillation.

{% include pj/grid.html items=page.media.matlab cols=2 %}

## Migration to Isaac Sim

I then exported the robot to URDF and drove it by keyboard in NVIDIA Isaac Sim and Isaac Lab to test its dynamics under higher-fidelity physics. In the Isaac Sim 4.5.0 clips below, it crouches, lifts each leg in turn, steps, and turns.

{% include pj/grid.html items=page.media.isaac cols=2 %}

## Results

| Stage | Method / tool | Result |
|---|---|---|
| Kinematics | Jacobians, forward/inverse kinematics | Joint-space constraints, feasible kinematic envelopes |
| Jump control | MATLAB/Simulink | Repeated jumps and a 360° backflip, all landing upright |
| Migration | Isaac Sim 4.5.0, Isaac Lab (URDF) | Crouches, lifts legs, steps, and turns under keyboard control |

## Next step

Train a reinforcement-learning locomotion policy for this URDF model.

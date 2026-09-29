---
layout: project
track: industry
org: "Khameleon Robotics"
title: "A Simulation-First Stack for a 13-DOF Humanoid Arm"
excerpt: "Controls and simulation development for a 13-DOF humanoid arm with leader/follower teleoperation, multi-camera capture, and Isaac Sim / Isaac Lab training workflows."
deck: "Isaac Sim and Isaac Lab infrastructure for bimanual humanoid manipulation: a 12-DOF Dynamixel puppet drives a 13-DOF simulated arm, five cameras record every episode, and the same scenes double as training environments."
collection: portfolio
category: work
date: 2025-07-01
role: "Control & Simulation Engineer Intern"
duration: "July 2025 – Present"
tech_tags: ["Isaac Sim", "Isaac Lab", "Dynamixel", "Teleoperation"]
tools: "NVIDIA Isaac Sim, Isaac Lab, LeIsaac, Dynamixel XC-330, URDF → USD"
featured: true
impact: "13-DOF dual-arm teleoperation stack in Isaac Sim/Lab with multi-camera LeIsaac data capture"
share: false
teaser: "kha_grab_img.png"
header:
  teaser: "kha_grab_img.png"
card_video: true
hero:
  video: "kha_move.mp4"
  poster: "kha_grab_img.png"
  autoplay: true
  caption: "**Leader/follower teleoperation.** A 12-DOF puppet controller built on Dynamixel XC-330 servos drives the 13-DOF dual-arm humanoid in Isaac Sim."
stats:
  - { value: "13 DOF", label: "simulated humanoid arm" }
  - { value: "12 DOF", label: "servo-driven leader controller" }
  - { value: "5", label: "camera viewpoints per episode" }
media:
  capture:
    - { video: "kha_grab_little.mp4", poster: "posters/kha_grab_little.jpg", autoplay: true, caption: "**Leader/follower motion in simulation.** The follower arms track the leader: the dome-tipped arm lifts away from the bowl, then the gripper arm swings in with its jaws open." }
    - { video: "kha_khaleisaac_top.mp4", webm: "kha_khaleisaac_top.webm", poster: "posters/kha_khaleisaac_top.jpg", preload: "none", caption: "**Isaac Sim session, editor view.** The dual-arm robot reaching across the kitchen counter, seen mostly from the editor's free camera, with brief cuts to the scene's top cameras, part of the five LeIsaac viewpoints set up for dataset generation." }
  training:
    - { video: "kha_leisaac_so101.mp4", webm: "kha_leisaac_so101.webm", poster: "posters/kha_leisaac_so101.jpg", preload: "none", caption: "**LeIsaac reference task.** LeIsaac's stock single-arm SO-101 pick-orange scene, teleoperated in Isaac Sim while the view cycles through the scene's cameras. The humanoid scenes are customized from this workflow." }
    - { youtube: "YaZquZc88fw", caption: "**Customized LeIsaac kitchen scene.** The dual-arm humanoid working at a kitchen counter with a plate and oranges, recorded from the Isaac Sim viewport." }
---

<p class="pj-lede">At Khameleon Robotics I work on a simulation-first pipeline for bimanual humanoid manipulation with training-ready data capture. The objective is a stable development baseline for coordinated control and learning workflows before the more hardware-heavy iterations begin.</p>

## System scope

- **Robot model.** A 13-DOF humanoid arm in NVIDIA Isaac Sim and Isaac Lab.
- **Command side.** A 12-DOF puppet controller using Dynamixel XC-330 servos.
- **Use cases.** Teleoperation and manipulation tasks that require leader/follower behavior.
- **Training target.** Collision-avoidance and bimanual interaction tasks in Isaac Lab.

## Simulation pipeline

The workflow runs end to end from robot import to dynamic behavior verification. Articulation properties, collision primitives, and controller timing were configured for stable real-time simulation, and simulation settings were aligned with the training-data requirements from the start so that captured episodes could feed learning runs without a second conversion step.

{% include pj/figure.html src="kha_top_cam.png" wide=true caption="**Camera rig in Isaac Sim.** The humanoid at the kitchen counter, with a camera selected at the top of its mast. Front, back, left, right, and chest cameras cover the manipulation envelope. Viewpoint combinations were validated against the interaction volume to reduce occlusion for both the operator and the dataset." %}

## Control architecture

The 12-DOF puppet controller is integrated with the bimanual arm model, with leader/follower motion-transfer logic for coordinated manipulation. Control loops were tuned for smooth transitions and low-latency behavior, which is what the clips below are testing.

{% include pj/grid.html items=page.media.capture cols=2 %}

## Training environments

Task scenes for collision avoidance and bimanual object handling reuse the same simulation setup. Scene complexity was tuned so that learning runs stayed computationally efficient, and camera calibration and rendering settings serve both teleoperation and dataset generation.

{% include pj/grid.html items=page.media.training cols=2 %}

## Outcomes

- A full Isaac Sim and Isaac Lab stack for 13-DOF humanoid arm development.
- Leader/follower bimanual control with 12 servo-driven DOFs.
- Five-view sensing coverage for operator control and dataset generation.
- Repeatable collision-avoidance and manipulation training deployments.

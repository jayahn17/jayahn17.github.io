---
layout: project
track: industry
org: "Khameleon Robotics"
title: "A Simulation-First Stack for a 13-DOF Dual-Arm Humanoid"
excerpt: "Controls and simulation for a 13-DOF dual-arm humanoid: leader/follower teleoperation, five-camera capture, and Isaac Sim / Isaac Lab training scenes."
deck: "A hardware-in-the-loop teleoperation stack in Isaac Sim and Isaac Lab: a 12-servo Dynamixel puppet drives a 13-DOF (6 + 6 + 1) simulated humanoid, five cameras record every episode, and the same scenes double as training environments."
collection: portfolio
category: work
date: 2025-07-01
role: "Control & Simulation Engineer Intern"
duration: "July 2025 – Present"
tech_tags: ["Isaac Sim", "Isaac Lab", "Dynamixel", "Teleoperation"]
tools: "NVIDIA Isaac Sim, Isaac Lab, PhysX, LeIsaac (LeRobot + GR00T), Dynamixel XC-330, URDF → USD"
featured: true
impact: "13-DOF dual-arm teleoperation stack in Isaac Sim/Lab with five-camera LeIsaac data capture"
share: false
teaser: "kha_grab_img.png"
header:
  teaser: "kha_grab_img.png"
card_video: true
hero:
  video: "kha_move.mp4"
  poster: "kha_grab_img.png"
  autoplay: true
  caption: "**The dual-arm humanoid in Isaac Sim.** The 13-DOF robot moving through the kitchen scene: the simulation side of the leader/follower teleoperation setup."
stats:
  - { value: "13 DOF", label: "simulated dual-arm humanoid" }
  - { value: "12 DOF", label: "servo-driven leader puppet" }
  - { value: "5", label: "camera viewpoints per episode" }
media:
  capture:
    - { video: "kha_grab_little.mp4", poster: "posters/kha_grab_little.jpg", autoplay: true, caption: "**Leader/follower motion in simulation.** The follower arms track the leader: the dome-tipped arm lifts away from the bowl, then the gripper arm swings in with its jaws open." }
    - { video: "kha_khaleisaac_top.mp4", webm: "kha_khaleisaac_top.webm", poster: "posters/kha_khaleisaac_top.jpg", preload: "none", caption: "**Full dual-arm episode.** The humanoid working through a kitchen manipulation task in Isaac Sim." }
  training:
    - { video: "kha_leisaac_so101.mp4", webm: "kha_leisaac_so101.webm", poster: "posters/kha_leisaac_so101.jpg", preload: "none", caption: "**LeIsaac with an SO-101 arm.** LeIsaac's pick-orange kitchen task, teleoperated in Isaac Sim while the video cycles through the scene's camera views." }
    - { youtube: "YaZquZc88fw", caption: "**Customized LeIsaac kitchen scene.** The dual-arm humanoid working at a kitchen counter with a plate and oranges, recorded from the Isaac Sim viewport." }
---

<p class="pj-lede">Khameleon Robotics, a cleaning-humanoid startup, needed to validate dual-arm control and collect training data before on-robot deployment. I built a hardware-in-the-loop teleoperation system in which a 12-servo Dynamixel puppet streams real-time joint states into a 13-DOF humanoid in Isaac Sim. Five cameras record each episode, and the same scenes serve as Isaac Lab training environments.</p>

## Robot model and cameras

I automated URDF-to-USD conversion (joint/link remapping, inertia tuning, sensor attachment points) so kinematics match across CAD, simulation, and hardware. Articulation, collision-primitive, and controller-timing settings target stable real-time simulation and meet training-data requirements, so recorded episodes feed learning runs without reformatting. Using LeIsaac, I reconfigured and synchronized the cameras so one calibration serves both teleoperation and dataset capture.

{% include pj/figure.html src="kha_top_cam.png" wide=true caption="**The kitchen scene.** The dual-arm humanoid at the counter in Isaac Sim. Five cameras (front, back, left, right, and chest) record each episode, placed to reduce occlusion for both the operator and the dataset." %}

## Leader/follower control

Motion-transfer logic maps the puppet's 12 joint states onto both 6-DOF arms, with control loops tuned for smooth transitions and low latency. A modular control stack with collision-aware joint-space and task-space modes lets dual-arm tests run in simulation before hardware.

{% include pj/grid.html items=page.media.capture cols=2 %}

## Training and next steps

Isaac Lab scenes for collision avoidance and dual-arm object handling reuse this setup, with complexity tuned for compute-efficient learning. The humanoid scene is a customized LeIsaac kitchen; the first clip below shows the stock scene with an SO-101 arm. Next: fine-tuning on recorded episodes, vision-language-action (VLA) operation, and on-robot deployment.

{% include pj/grid.html items=page.media.training cols=2 %}

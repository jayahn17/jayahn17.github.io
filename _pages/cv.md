---
layout: archive
title: "CV"
permalink: /cv/
author_profile: true
description: "Curriculum vitae — SeongJae Ahn, robotics engineer (M.S. ME, UC Berkeley)."
redirect_from:
  - /resume
---

{% include base_path %}

# Seongjae Ahn

Berkeley / Santa Clara, CA • [jayahn@berkeley.edu](mailto:jayahn@berkeley.edu) • (628) 529-6598 • [LinkedIn](https://www.linkedin.com/in/seongjae-ahn-126838244/)

## Education

* **Master of Science in Mechanical Engineering**  
  University of California, Berkeley  
  *May 2026*

* **Bachelor of Science in Mechanical Engineering**  
  University of California, Berkeley • December 2024

* **Mechanical Engineering**  
  Diablo Valley College • May 2022

## Work Experience

* **Control & Simulation Engineer Intern**  
  *Khameleon Robotics: Cleaning Humanoid Robot Startup, Mountain View, CA*  
  July 2025 – Present  
  - Built a hardware-in-the-loop teleoperation ("puppet") control system in NVIDIA Isaac Sim and Isaac Lab for a 13-DOF (6+6+1) dual-arm humanoid, streaming real-time joint states from Dynamixel servo controllers into a PhysX-based USD model.
  - Designed a modular control stack supporting collision-aware joint-space and task-space control modes, enabling rapid iteration and validation of dual-manipulation control tests in simulation before on-robot deployment.
  - Reconfigured and synchronized simulation camera views (eye-in-hand, over-the-shoulder, top-down, and base cameras) using the LeIsaac (Isaac Sim + LeRobot + GR00T) workflow for teleoperation, data collection, fine-tuning preparation, and future VLA operation.
  - Automated URDF-to-USD conversion and customized joint/link remapping for the dual-arm system, including inertia tuning and sensor attachment points, to keep kinematics consistent between CAD, simulation, and real hardware.

* **Graduate Research Assistant**  
  *Prof. Negar Mehr - Intelligent Control (ICON) Lab at UC Berkeley*  
  May 2025 – Present  
  - Built a role-conditioned manipulation stack in robosuite/MuJoCo that decomposes pick-and-place into three reusable per-skill Diffusion Transformer (DiT) policies (pick / place / retreat), each verified to ≥95% success on a single Kinova3 arm.
  - Raised pick reliability from ~83% to ~97–100% by reformulating the pick action in the object's reference frame, making the learning target translation-invariant across object positions.
  - Transferred the identical single-arm policies to a two-arm setup through a per-arm rigid-frame correction and a skill router, then scaled to a four-arm system where an LLM coordinator (Anthropic Claude, with a deterministic fallback) assigns objects to arms and sets execution order and per-arm retry budgets.
  - Ported a multi-agent quadruped RL environment from Unitree Go1 to Go2 in Isaac Gym, preserving task logic and evaluation conventions across platforms.

* **Junior Engineer (Contractor) / Mechanical / Hardware Engineering Intern**  
  *Root Applied Sciences: biotechnology company pioneering pathogen monitoring systems, Emeryville, CA*  
  November 2024 – May 2025 (5 months)  
  - Managed preparation and maintenance of 80+ devices, improving firmware reliability and real-time control readiness.
  - Designed and 3D-printed insect-resistant housings for field PCBs, reducing insect-related damage and improving quality-control maintenance efficiency.
  - Designed a new microfluidic door system using electromagnetic actuation and stereolithography (SLA) to support accurate bacteria/spore solution data collection.

* **Generative AI Analyst**  
  *NVIDIA*  
  March 2025 – April 2025  
  - Performed QA on ML training sets across 2,000+ frames under evolving guidelines for AV LLM evaluation.

* **Undergraduate Research Assistant**  
  *TAF Lab (Theoretical & Applied Fluid Dynamics Laboratory) - Prof. M. Reza Alam, UC Berkeley*  
  May 2024 – November 2025  
  - Ranked Top 20 / 3400 in the U.S. DOE "Power at Sea Prize" competition and listed as an inventor on the submitted patent application "A Multimodal Mobile Sea-based Power Generation and Delivery" (patent pending review).
  - Led electronics implementation with 7+ sensors and established wireless communication using the XBee protocol for an autonomous ocean-drone prototype.
  - Developed autonomous upwind/downwind sail-motion control using wind vanes, GPS, magnetometers, and motors, and designed a real-time data-acquisition pipeline from device firmware to database.
  - Conducted 50+ ocean tests and built a real-time raw-data acquisition pipeline linking device firmware to a Python database.
  - Pitched the autonomous ocean-drone solution to the UC Berkeley Vice Chancellor for Research.

* **UC Berkeley Solar Vehicle Team, CalSol – Battery & Suspension Team Member**  
  *UC Berkeley Solar Vehicle Team*  
  August 2022 – May 2024  
  - Consolidated two front suspension brackets, reducing weight by 10% while ensuring safety via FEA.
  - Reconfigured circuit wiring to optimize battery efficiency, achieving a 5% power savings.

* **Diablo Valley College Physics Tutor**  
  *Diablo Valley College*  
  August 2021 – May 2022  
  - Tutored students in Engineering Mechanics, Electromagnetics, and Quantum Mechanics.

* **Signal Corps, Squad Leader**  
  *Republic of Korea Army, South Korea*  
  August 2017 – April 2019  
  - Managed PRC-999K defense communication equipment following standard operating procedures.
  - Led and trained Signal Corps troops, earning recognition in the Best Warrior Competition.

## Projects

* **ME102B (Mechatronics): Robotic Fish**  
  Fall 2024  
  - Designed a unique tail mechanism for a robotic fish, earning second place at the design showcase.

* **ME134 (Feedback Control of Dynamic Systems): Magnetic Levitation & Inverted Pendulum**  
  Spring 2024  
  - Developed an analog controller using Simulink and MATLAB to determine parameters for a linearized plant.

* **ME136 (Control of Unmanned Aerial Vehicles): Hover Control**  
  Fall 2023  
  - Achieved autonomous control with optimized algorithms on the NuttX Virtual Machine.
  - Performed flight dynamics analysis, placing in the top 30% of the class.

## Skills

**Software:** Python, C++, ROS, Linux, MATLAB, Simulink, NVIDIA Isaac Sim, Isaac Lab, MuJoCo, robosuite, Docker, PyTorch

**Mechanical/Hardware:** CAD (Onshape, SolidWorks), rapid prototyping, 3D printing, embedded sensing, microcontroller hardware

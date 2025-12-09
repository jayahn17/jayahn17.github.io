---
layout: archive
title: "CV"
permalink: /cv/
author_profile: true
redirect_from:
  - /resume
---

{% include base_path %}

# Seongjae Ahn

Berkeley, CA • [jayahn@berkeley.edu](mailto:jayahn@berkeley.edu) • (628) 529-6598 • [LinkedIn](https://www.linkedin.com/in/seongjae-ahn-126838244/)

## Education

* **Master of Science in Mechanical Engineering**  
  University of California, Berkeley  
  *(Expected, August 2025 – May 2026)*

* **Bachelor of Science in Mechanical Engineering**  
  University of California, Berkeley • December 2024

* **Mechanical Engineering**  
  Diablo Valley College • May 2022

## Work Experience

* **Control & Simulation Engineer Intern**  
  *Khameleon Robotics: Cleaning Humanoid Robot Startup, Mountain View, CA*  
  July 2025 – Present  
  <img src="/images/khameleon_1.jpg" alt="Khameleon Robotics" style="max-width: 200px; float: right; margin-left: 20px; border-radius: 8px;">
  - Built hardware-in-the-loop teleoperation ("puppet") control system in NVIDIA Isaac Sim/Lab for a 13-DOF(6+6+1) dual-arm humanoid, streaming real-time joint states from Dynamixel servo controllers into a PhysX-based USD model.
  - Designed a modular control stack supporting collision-aware joint-space and task-space control modes, enabling rapid iteration and validation of dual manipulation control tests in simulation before on-robot deployment.
  - Reconfigured and synchronized all simulation camera views (eye-in-hand, over-the-shoulder, top-down, and base cameras) based on Leissac(Isaacsim + Lerobot + GROOT) repository for teleoperation, data collection, preparing fine-tunning and VLA operation in the next step.
  - Automated URDF → USD conversion and customizing joint/link remapping for the dual-arm system, including inertia tuning and sensor attachment points, to keep kinematics consistent between CAD, simulation, and real hardware.

* **Graduate Research Assistant**  
  *Prof. Negar Mehr - Intelligent Control (ICON) Lab at UC Berkeley*  
  May 2025 – Present  
  - Designed and implemented a hierarchical PolicyPlayer architecture for both bimanual and single arm tasks (handover objects, peg-in-hole, lift) in robosuite/Mujoco environments and implemented Diffusion Policy.
  - Implemented RL policy in Multiagent-quadruped-environment on both Unitree Go1 and Go2 using Isaac Gym.
  - Validated a dual Kinova3 manipulation setup for two-arm handover task by generating raw waypoint dataset, preprocessing artificial data, and training on a Diffusion Transformer Policy.
  - Evaluated the DiT(Diffusion Policy) result on the learning rate, loss and GPU performance.

* **Junior Engineer (Contractor) / Mechanical / Hardware Engineering Intern**  
  *Root Applied Sciences: Biotechnology company pioneering in Pathogen monitoring system, Emeryville, CA*  
  November 2024 – May 2025 (5 months)  
  - Managed preparation, and maintenance of $80+$ devices, ensuring firmware reliability and real-time control.
  - Designed and 3D-printed insect-resistant housings for field PCBs, reducing insect-related damage by over $100 \%$ and increase productivity in Quality Control time efficiency over $50 \%$.
  - Designed micro-fluid new door system using Electromagnetic fields, using Stereolithography(SLA) which has high accuracy, and low viscosity, ideal for the bacteria/spore solution data collecting system.

* **Generative AI Analyst**  
  *Nvidia*  
  March 2025 – April 2025  
  - Assured QA test on ML training sets across 2000+ frames in accordance with evolving guidelines for guiding AV LLM.

* **Undergraduate Research Assistant**  
  *Prof. M. Reza Alam - Theoretical & Applied Fluid Dynamics (TAF) Laboratory, UC Berkeley*  
  February 2024 – December 2024  
  - Ranked Top 20 / 3400 in the U.S. DOE "Power at the Sea Prize" competition and listed as an inventor on submitted patent application on "A Multimodal Mobile Sea-based Power Generation and Delivery" (patent pending review).
  - Developed autonomous up/downwind sail motion control using wind vanes, GPS, magnetometer, motors and designed a real-time raw data acquisition pipeline of Bay Ocean data by bridging device firmware to database.

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

**Software:** Python, C++, Linux, MATLAB, Simulink, Nvidia Isaac Sim/Lab, Mujoco, Robosuite, Docker, PyTorch  
**Mechanical/Hardware:** CAD (OnShape, SolidWorks), Rapid prototyping, 3D printing

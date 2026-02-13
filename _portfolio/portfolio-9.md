---
title: "ICON Lab - Robot Learning & Manipulation"
excerpt: "PolicyPlayer demos, Diffusion Policy, and quadruped RL in robosuite/MuJoCo and Isaac Gym."
collection: portfolio
category: work
date: 2024-12-02
role: "Research Assistant"
share: false
teaser: "icon_front_video.png"
header:
  teaser: "icon_front_video.png"
---

## ICON Lab – Robot Learning & Manipulation

Research at ICON Lab on scripted demonstration generation, diffusion-based imitation learning, and multi-agent quadruped reinforcement learning in simulation.

### Key Contributions

- **PolicyPlayer & manipulation demos:** Developed scripted PolicyPlayer architectures for bimanual and single-arm manipulation tasks (handover, peg-in-hole, lift) in robosuite/MuJoCo, using waypoint-based control to generate high-quality demonstrations.

- **Rollout datasets & DiT pipelines:** Generated and curated per-episode rollout datasets (centralized and decentralized) stored as pickle files, then converted raw demonstrations into Diffusion Transformer (DiT)-compatible datasets for training and evaluation.

- **Diffusion Policy evaluation:** Evaluated Diffusion Policy training performance, analyzing learning rate schedules, loss convergence, and GPU utilization to inform efficient training configurations.

- **Quadruped RL migration:** Migrated a multi-agent quadruped RL environment from Unitree Go1 to Go2 using Isaac Gym, maintaining task consistency across hardware generations.

### Results (Selected)

- Built multi-task demonstration datasets for manipulation benchmarks in robosuite/MuJoCo.
- Established training/evaluation baselines for Diffusion Policy and DiT pipelines.
- Ported a multi-agent quadruped environment to Go2 with consistent task definitions.

### Tools

MuJoCo, robosuite, Isaac Gym, PyTorch

### Videos

**1. Front view — PolicyPlayer / manipulation**

<div style="display: flex; justify-content: center; margin: 20px 0;">
  <video width="100%" controls playsinline style="max-width: 800px; border-radius: 8px; box-shadow: 0 4px 12px rgba(0,0,0,0.1);">
    <source src="/images/icon_front_video.mp4" type="video/mp4">
    <source src="/images/icon_front_video.mov" type="video/quicktime">
    Your browser does not support the video tag.
  </video>
</div>

**2. Handover — Bimanual handover task**

<div style="display: flex; justify-content: center; margin: 20px 0;">
  <video width="100%" controls playsinline style="max-width: 800px; border-radius: 8px; box-shadow: 0 4px 12px rgba(0,0,0,0.1);">
    <source src="/images/icon_handover.mp4" type="video/mp4">
    <source src="/images/icon_handover.mov" type="video/quicktime">
    Your browser does not support the video tag.
  </video>
</div>

**3. Can pick-and-place — Single-arm manipulation**

<div style="display: flex; justify-content: center; margin: 20px 0;">
  <video width="100%" controls playsinline style="max-width: 800px; border-radius: 8px; box-shadow: 0 4px 12px rgba(0,0,0,0.1);">
    <source src="/images/icon_can_pickandplace.mp4" type="video/mp4">
    <source src="/images/icon_can_pickandplace.mov" type="video/quicktime">
    Your browser does not support the video tag.
  </video>
</div>

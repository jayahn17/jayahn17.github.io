---
title: "ICON Lab - Robot Learning and Manipulation Research"
excerpt: "Research on demonstration generation, diffusion-policy pipelines, and quadruped RL migration across Isaac Gym hardware versions."
collection: portfolio
category: work
date: 2024-12-02
role: "Research Assistant"
share: false
teaser: "icon_front_video.png"
header:
  teaser: "icon_front_video.png"
---

## ICON Lab - Robot Learning & Manipulation

### Context
At ICON Lab, I contributed to building reusable data and training workflows for manipulation and locomotion research. The project focused on high-quality demonstration generation and consistent benchmarking across simulation platforms.

### Problems Addressed
- Generate reliable manipulation trajectories for training and evaluation.
- Convert raw rollouts into formats suitable for Diffusion Transformer pipelines.
- Transfer a multi-agent quadruped RL environment across robot generations.

### Technical Contributions
**PolicyPlayer and Demonstrations**
- Built scripted PolicyPlayer structures for single-arm and bimanual tasks (handover, peg-in-hole, lift).
- Used waypoint-level control to generate clean trajectory structure before learning-based methods.

**Rollout and Dataset Conversion**
- Collected centralized and decentralized rollout datasets in serialized formats.
- Normalized and transformed raw data into Diffusion Transformer (DiT) compatible structure.
- Implemented dataset hygiene checks to reduce training noise and formatting failures.

**Diffusion Policy Evaluation**
- Ran controlled training experiments, tracking loss convergence and throughput.
- Reviewed resource utilization (GPU and runtime behavior) to stabilize training windows.

**Quadruped RL Porting**
- Migrated a multi-agent Unitree Go1 environment stack to Go2.
- Kept task logic and evaluation conventions consistent across hardware versions.

### Validation
- Defined reproducible benchmarks for manipulation and locomotion tasks.
- Compared policy quality through trajectory smoothness and task-completion consistency.
- Used rollout analytics to tune training schedules with objective evidence.

### Outcomes
- Built reusable multi-task demonstration datasets for benchmark tasks.
- Established baseline training and evaluation pipelines for Diffusion Policy and DiT.
- Delivered a Go2-compatible quadruped environment with preserved task semantics.

### Tooling
MuJoCo, robosuite, Isaac Gym, PyTorch.

### Videos

<div style="display: flex; justify-content: center; margin: 20px 0;">
  <video width="100%" controls playsinline style="max-width: 800px; border-radius: 8px; box-shadow: 0 4px 12px rgba(0,0,0,0.1);">
    <source src="/images/icon_front_video.mp4" type="video/mp4">
    <source src="/images/icon_front_video.mov" type="video/quicktime">
    Your browser does not support the video tag.
  </video>
</div>

<div style="display: flex; justify-content: center; margin: 20px 0;">
  <video width="100%" controls playsinline style="max-width: 800px; border-radius: 8px; box-shadow: 0 4px 12px rgba(0,0,0,0.1);">
    <source src="/images/icon_bimanual_demo.mp4" type="video/mp4">
    <source src="/images/icon_bimanual_demo.mov" type="video/quicktime">
    Your browser does not support the video tag.
  </video>
</div>

<div style="display: flex; justify-content: center; margin: 20px 0;">
  <video width="100%" controls playsinline style="max-width: 800px; border-radius: 8px; box-shadow: 0 4px 12px rgba(0,0,0,0.1);">
    <source src="/images/icon_handover.mp4" type="video/mp4">
    <source src="/images/icon_handover.mov" type="video/quicktime">
    Your browser does not support the video tag.
  </video>
</div>

<div style="display: flex; justify-content: center; margin: 20px 0;">
  <video width="100%" controls playsinline style="max-width: 800px; border-radius: 8px; box-shadow: 0 4px 12px rgba(0,0,0,0.1);">
    <source src="/images/icon_can_pickandplace.mp4" type="video/mp4">
    <source src="/images/icon_can_pickandplace.mov" type="video/quicktime">
    Your browser does not support the video tag.
  </video>
</div>

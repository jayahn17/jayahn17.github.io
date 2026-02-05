---
title: "ICON Lab - Robot Learning & Manipulation"
excerpt: "PolicyPlayer demos, Diffusion Policy, and quadruped RL in robosuite/MuJoCo and Isaac Gym."
collection: portfolio
category: work
date: 2024-12-02
role: "Research Assistant"
share: false
---

## ICON Lab – Robot Learning & Manipulation

Research at ICON Lab on scripted demonstration generation, diffusion-based imitation learning, and multi-agent quadruped reinforcement learning in simulation.

### Key Contributions

- **PolicyPlayer & manipulation demos:** Developed scripted PolicyPlayer architectures for bimanual and single-arm manipulation tasks (handover, peg-in-hole, lift) in robosuite/MuJoCo, using waypoint-based control to generate high-quality demonstrations.

- **Rollout datasets & DiT pipelines:** Generated and curated per-episode rollout datasets (centralized and decentralized) stored as pickle files, then converted raw demonstrations into Diffusion Transformer (DiT)-compatible datasets.

- **Diffusion Policy evaluation:** Evaluated Diffusion Policy training performance, analyzing learning rate schedules, loss convergence, and GPU utilization to inform efficient training configurations.

- **Quadruped RL migration:** Migrated a multi-agent quadruped RL environment from Unitree Go1 to Go2 using Isaac Gym, maintaining task consistency across hardware generations.

### Video reels

Short clips from PolicyPlayer demos and manipulation tasks.

<div class="portfolio-reels" style="display: grid; grid-template-columns: repeat(auto-fit, minmax(260px, 1fr)); gap: 24px; margin: 24px 0;">
  <div style="text-align: center;">
    <video width="100%" controls playsinline style="max-width: 320px; border-radius: 12px; box-shadow: 0 4px 16px rgba(0,0,0,0.12); object-fit: cover; aspect-ratio: 9/16;" preload="metadata">
      <source src="/images/icon_front_video.mov" type="video/quicktime">
      Your browser does not support the video tag.
    </video>
    <p style="margin-top: 10px; font-size: 0.9em; color: #666;"><strong>Front view</strong> – PolicyPlayer / manipulation</p>
  </div>
  <div style="text-align: center;">
    <video width="100%" controls playsinline style="max-width: 320px; border-radius: 12px; box-shadow: 0 4px 16px rgba(0,0,0,0.12); object-fit: cover; aspect-ratio: 9/16;" preload="metadata">
      <source src="/images/icon_handover.mov" type="video/quicktime">
      Your browser does not support the video tag.
    </video>
    <p style="margin-top: 10px; font-size: 0.9em; color: #666;"><strong>Handover</strong> – Bimanual handover task</p>
  </div>
  <div style="text-align: center;">
    <video width="100%" controls playsinline style="max-width: 320px; border-radius: 12px; box-shadow: 0 4px 16px rgba(0,0,0,0.12); object-fit: cover; aspect-ratio: 9/16;" preload="metadata">
      <source src="/images/icon_can_pickandplace.mov" type="video/quicktime">
      Your browser does not support the video tag.
    </video>
    <p style="margin-top: 10px; font-size: 0.9em; color: #666;"><strong>Can pick-and-place</strong> – Single-arm manipulation</p>
  </div>
</div>

### Screenshots & visualizations

*Add your robosuite/MuJoCo and Isaac Gym screenshots here.* Use the same grid style as other portfolio items: upload images to `/images/` and reference them like `/images/icon_screenshot1.png`.

<div style="display: grid; grid-template-columns: repeat(auto-fit, minmax(280px, 1fr)); gap: 20px; margin: 20px 0;">
  <!-- Example: add your screenshot entries
  <div>
    <img src="/images/icon_robosuite_demo.png" alt="Robosuite task" style="width: 100%; max-width: 100%; height: auto; border-radius: 8px; box-shadow: 0 4px 12px rgba(0,0,0,0.1); object-fit: contain;">
    <p style="margin-top: 8px; font-size: 0.9em; color: #666;"><strong>Caption:</strong> Description</p>
  </div>
  -->
</div>

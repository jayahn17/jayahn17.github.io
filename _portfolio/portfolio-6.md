---
title: "MSC - Render-to-Sim-to-Asset 3D Reconstruction"
excerpt: "Built a conversion pipeline using WorldLab.ai, NVIDIA 3Dgrut, and Isaac Lab to produce simulation-ready 3D assets."
collection: portfolio
category: work
date: 2025-01-01
share: false
teaser: "MSC_WL2Isaac.png"
header:
  teaser: "MSC_WL2Isaac.png"
---

## MSC - 3D Reconstruction

### Context
This project created a production-oriented pipeline from scene capture to sim-ready asset delivery. The goal was to automate repetitive conversion steps while preserving geometric quality and physical plausibility for downstream robotics simulation.

### Problem
- Unify outputs from multiple 3D generation tools into a single, repeatable path.
- Reduce manual intervention in mesh cleanup and format conversion.
- Verify compatibility of generated assets inside physics-based simulation.

### Pipeline Architecture
**Render-to-Image Preparation**
- Standardized capture settings and preprocessing to keep image consistency for reconstruction.

**Reconstruction and Conversion**
- Integrated WorldLab.ai and NVIDIA 3Dgrut workflows into a unified graph.
- Applied GPU-accelerated geometry reconstruction and conversion filters.

**Simulation Ingestion**
- Validated mesh/material conversions for NVIDIA Isaac Lab compatibility.
- Performed quick physics sanity checks before dataset-scale use.

### My Contributions
- Defined integration points between WorldLab.ai, 3Dgrut, and Isaac Lab.
- Implemented scripts and process steps to convert renders into reusable mesh assets.
- Tuned reconstruction settings to balance visual fidelity with mesh complexity.
- Added verification checks to catch geometry or asset-format failures before simulation.

### Technical Notes
- Ensured coordinate conventions and scale remained consistent through each conversion stage.
- Emphasized deterministic outputs so repeated runs produced comparable asset quality.
- Organized the process as a reusable workflow for team handoff and future expansion.

### Results
- Delivered an end-to-end render-to-sim-to-asset pipeline.
- Produced validated, simulation-ready 3D assets for Isaac Lab environments.
- Reduced manual post-processing by standardizing conversion and verification steps.

### Pipeline Demo

<div style="display: flex; justify-content: center; margin: 20px 0;">
  <video width="100%" controls style="max-width: 800px; border-radius: 8px; box-shadow: 0 4px 12px rgba(0,0,0,0.1);">
    <source src="/images/MSC_WL2Isaac.webm" type="video/webm">
    Your browser does not support the video tag.
  </video>
</div>

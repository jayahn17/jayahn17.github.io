---
layout: project
track: research
org: "MSC Control Lab, UC Berkeley"
title: "Render-to-Sim: Turning Generated Scenes into Simulation-Ready Assets"
excerpt: "A render-to-sim asset pipeline built with WorldLab.ai, NVIDIA 3DGRUT, and Isaac Lab to produce validated, simulation-ready 3D assets."
deck: "One repeatable workflow from scene capture to Isaac Lab: WorldLab.ai and NVIDIA 3DGRUT reconstructions are converted, checked, and loaded into physics simulation with as little manual cleanup as possible."
collection: portfolio
category: work
date: 2025-01-01
role: "Research Project"
duration: "Fall 2024"
tech_tags: ["Isaac Lab", "3DGRUT", "WorldLab.ai", "Asset Pipeline"]
tools: "WorldLab.ai, NVIDIA 3DGRUT, NVIDIA Isaac Lab, GPU-accelerated reconstruction and conversion"
share: false
teaser: "MSC_WL2Isaac.png"
header:
  teaser: "MSC_WL2Isaac.png"
hero:
  video: "MSC_WL2Isaac.mp4"
  webm: "MSC_WL2Isaac.webm"
  poster: "MSC_WL2Isaac.png"
  autoplay: true
  caption: "**Pipeline demo.** A WorldLab.ai scene reconstructed with 3DGRUT, converted, and loaded into NVIDIA Isaac Lab."
steps:
  - { label: "1", title: "Render-to-image", text: "Standardized capture settings and preprocessing keep reconstruction inputs consistent." }
  - { label: "2", title: "Reconstruct + convert", text: "WorldLab.ai and NVIDIA 3DGRUT outputs pass through one processing graph with GPU-accelerated geometry reconstruction and conversion filters." }
  - { label: "3", title: "Simulation ingestion", text: "Mesh and material conversions are validated for Isaac Lab, with quick physics sanity checks before dataset-scale use." }
---

<p class="pj-lede">Robotics simulation needs assets faster than artists can make them. This project built a production-oriented pipeline from scene capture to simulation-ready asset delivery, automating the repetitive conversion steps while preserving geometric quality and physical plausibility.</p>

## The problem

- Unify outputs from multiple 3D generation tools into one repeatable pipeline.
- Reduce manual intervention in mesh cleanup and format conversion.
- Verify compatibility of generated assets inside physics-based simulation.

## The pipeline

{% include pj/steps.html items=page.steps %}

## My contributions

- Defined the integration points between WorldLab.ai, NVIDIA 3DGRUT, and Isaac Lab.
- Implemented scripts and process steps to convert renders into reusable mesh assets.
- Tuned reconstruction settings to balance visual fidelity against mesh complexity.
- Added verification checks to catch geometry and asset-format failures before simulation.

Coordinate conventions and scale stay consistent through each conversion stage, outputs are deterministic so repeated runs produce comparable asset quality, and the process is organized as a reusable workflow for team handoff.

## Results

- An end-to-end render-to-sim asset pipeline.
- Validated, simulation-ready 3D assets for Isaac Lab environments.
- Less manual post-processing, through standardized conversion and verification steps.

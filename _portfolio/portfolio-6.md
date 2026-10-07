---
layout: project
track: research
org: "MSC Control Lab, UC Berkeley"
title: "Render-to-Sim: Turning Generated Scenes into Simulation-Ready Assets"
excerpt: "A render-to-sim pipeline that reconstructs WorldLab.ai scenes with NVIDIA 3DGRUT and loads them into Isaac Sim, the simulator under Isaac Lab, with as little manual cleanup as possible."
deck: "WorldLab.ai scenes, reconstructed with NVIDIA 3DGRUT and converted to USDZ, load straight into Isaac Sim for Isaac Lab. I wrote the conversion scripts and the checks that catch geometry and asset-format failures before simulation."
collection: portfolio
category: work
date: 2025-01-01
role: "Research Project"
duration: "Fall 2024"
tech_tags: ["Isaac Lab", "Isaac Sim", "3DGRUT", "WorldLab.ai", "Asset Pipeline"]
tools: "WorldLab.ai, NVIDIA 3DGRUT, NVIDIA Isaac Sim, NVIDIA Isaac Lab, USDZ"
share: false
teaser: "MSC_WL2Isaac.png"
header:
  teaser: "MSC_WL2Isaac.png"
hero:
  video: "MSC_WL2Isaac.mp4"
  webm: "MSC_WL2Isaac.webm"
  poster: "MSC_WL2Isaac.png"
  autoplay: true
  caption: "**Pipeline demo.** A WorldLab.ai room reconstructed with 3DGRUT and loaded into NVIDIA Isaac Sim, with the camera moving through the scene."
steps:
  - { label: "1", title: "Render-to-image", text: "Standardized capture settings and preprocessing keep reconstruction inputs consistent." }
  - { label: "2", title: "Reconstruct + convert", text: "Rendered WorldLab.ai views go through NVIDIA 3DGRUT reconstruction and conversion in one graph of GPU-accelerated filters; coordinate conventions and scale stay consistent through each conversion stage." }
  - { label: "3", title: "Simulation ingestion", text: "Mesh and material conversions are checked for Isaac Lab compatibility; quick physics sanity checks precede dataset-scale use." }
---

<p class="pj-lede">Robotics simulation needs assets faster than artists can make them, and a generated scene is useful only if it loads into the simulator and renders interactively. I built a repeatable render-to-sim path that takes WorldLab.ai scenes into Isaac Sim, Isaac Lab's underlying simulator, with as little manual cleanup as possible.</p>

## Pipeline

{% include pj/steps.html items=page.steps %}

I defined the integration points between WorldLab.ai, NVIDIA 3DGRUT, and Isaac Lab, wrote the render-to-mesh conversion scripts, tuned reconstruction to trade fidelity against mesh complexity, and added checks that catch geometry and asset-format failures before simulation. Standardized conversion and these checks reduce manual post-processing. I aimed for deterministic outputs so repeated runs give comparable asset quality, and packaged the workflow for team handoff.

## Demo

The hero clip opens a converted room, `room.usdz`, in Isaac Sim 5.1.0: its stage holds a single Gaussian prim, `gauss`, and the camera moves through it. The clip shows rendering only, not the mesh, material, or physics checks that gate the next step: dataset-scale use in Isaac Lab.

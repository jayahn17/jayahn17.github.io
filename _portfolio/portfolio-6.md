---
layout: project
track: research
org: "Mechanical Systems Control (MSC) Lab, UC Berkeley"
title: "Generated Scenes in Isaac Sim: World Labs → 3DGRUT → USDZ"
excerpt: "A World Labs room reconstructed with NVIDIA 3DGRUT, exported as a USDZ Gaussian-splat asset, and opened in NVIDIA Isaac Sim 5.1."
deck: "Generated worlds could supply simulation scenes faster than artists can model them. I took a World Labs room through NVIDIA 3DGRUT reconstruction into a USDZ asset that renders in Isaac Sim; collision geometry and physics are the next step."
collection: portfolio
category: work
supporting: true
date: 2025-12-01
role: "Research Project"
duration: "Fall 2025"
tech_tags: ["Isaac Sim", "3DGRUT", "World Labs", "Gaussian Splatting", "USD"]
tools: "World Labs, NVIDIA 3DGRUT, NVIDIA Isaac Sim 5.1, USDZ"
share: false
teaser: "MSC_WL2Isaac.png"
header:
  teaser: "MSC_WL2Isaac.png"
hero:
  video: "MSC_WL2Isaac.mp4"
  webm: "MSC_WL2Isaac.webm"
  poster: "MSC_WL2Isaac.png"
  autoplay: true
  caption: "**Pipeline demo.** A World Labs room reconstructed with 3DGRUT and loaded into NVIDIA Isaac Sim, with the camera moving through the scene."
steps:
  - { label: "1", title: "Render views", text: "Images rendered from the World Labs scene are the reconstruction input." }
  - { label: "2", title: "Reconstruct + export", text: "NVIDIA 3DGRUT reconstructs the scene as 3D Gaussians, exported as a USDZ asset." }
  - { label: "3", title: "Load in Isaac Sim", text: "The USDZ opens in Isaac Sim 5.1 as a single Gaussian prim that renders in the viewport." }
---

<p class="pj-lede">Robot-learning simulators need many varied scenes, faster than artists can model them. I explored whether a generated world can supply one: a World Labs room, reconstructed with NVIDIA 3DGRUT and exported as USDZ, opens and renders in Isaac Sim 5.1.</p>

## Pipeline

{% include pj/steps.html items=page.steps %}

I set up each hand-off in the chain: rendering views of the World Labs scene, reconstructing them with 3DGRUT, and exporting the USDZ asset that Isaac Sim loads.

## Demo and limits

The hero clip opens the converted room, `room.usdz`, in Isaac Sim 5.1.0. Its stage holds a single Gaussian prim, `gauss`, and the camera moves through it. A Gaussian splat renders but has no collision geometry, so a robot or object cannot yet interact with the room.

## Next step

Add collision geometry aligned to the splat so the room supports physics, then use generated scenes at dataset scale in Isaac Lab.

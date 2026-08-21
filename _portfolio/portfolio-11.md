---
title: "CrateScanner - iPad LiDAR to Measurable 3D Asset Pipeline"
excerpt: "End-to-end 3D asset pipeline: a Swift/ARKit iPad LiDAR capture app feeding a Linux GPU backend that fuses metric meshes, trains Gaussian splats, and publishes orbit-and-measure web pages that state exactly which reconstruction may be trusted."
collection: portfolio
category: class
date: 2026-08-13
role: "ENGIN 170 — UC Berkeley"
duration: "Summer 2026"
tech_tags: ["Swift/ARKit", "LiDAR", "Open3D", "nvblox", "Gaussian Splatting", "three.js"]
share: false
teaser: "cratescan_sofa_splat.jpg"
header:
  teaser: "cratescan_sofa_splat.jpg"
---

## CrateScanner - Capture-to-Measure 3D Asset Pipeline

### Context
Built for ENGIN 170 at UC Berkeley: scan an object with an iPad, get back a metric 3D asset you can orbit and measure in the browser. The system spans two repos — the CrateScanner iOS capture app ([engin_170](https://github.com/jayahn17/engin_170)) and the assetpipe GPU backend ([3dasset](https://github.com/jayahn17/3dasset)) — split by a deliberate design rule: the iPad is a camera, not a reconstructor. The device records RGB, depth, and pose; a Linux GPU box does every heavy computation and states which reconstruction you may measure.

### Problem Statement
- Turn a handheld iPad scan into a metric, CAD- and simulation-ready 3D asset with no reference markers or manual scaling.
- Reconstruct one capture several ways — fused depth mesh, Gaussian splat, photogrammetry, generative mesh — and deliver them behind one switcher.
- Be explicit about which reconstruction may be measured, and refuse to quote a size the pipeline cannot defend.
- Publish each scan to the web without redeploying anything.

### System Architecture

**iPad Capture App (Swift / SwiftUI / ARKit)**
- Capture-only by design: records the colour stream plus 12 MP keyframes, native 256×192 uint16 depth in millimetres, and ARKit pose + intrinsics into a zipped session package.
- Guided capture with movement nudges keeps the human moving correctly — the hardest part of scanning.
- Delivery is decoupled: Google Drive sync (OAuth 2.0 PKCE with resumable uploads, no third-party SDK), direct upload to the GPU box over Tailscale, or AirDrop. A scan is finished and safe on disk the moment you tap Finish.
- On-device LiDAR preview mesh with STL/OBJ/USDZ export; XcodeGen project, TestFlight-ready (registered bundle id, privacy manifest).

**Linux GPU Reconstruction (RTX 4080 SUPER, CUDA, Python / Open3D)**
- An autopilot watcher polls the shared Drive folder and pulls new capture sessions automatically.
- The measurement fuse: frame scoring (sharpness × valid depth), anchor-based ICP registration so drift cannot chain, RANSAC ground-plane removal, and screened Poisson reconstruction produce `object_mesh.ply` and `dims.json` — the only file the pipeline allows to be measured.
- nvblox TSDF fusion integrates every depth frame at its ARKit pose (~15 s for 356 frames) into a full-scene viewing mesh.
- AliceVision/Meshroom photogrammetry recovers metric scale via a closed-form Umeyama fit of SfM camera centres onto the ARKit trajectory (fit RMS 30 mm over 28 cameras on the sofa benchmark).
- Gaussian splat training with LichtFeld Studio — adopted after measuring 20 min vs ~85 min for 3DGUT at equal quality; the 1M-gaussian training PLY is repacked from 241 MB to a 31 MB browser-ready `.splat`.
- TRELLIS generative mesh, uniformly scaled from the fused dimensions.

**Web Delivery (three.js + Vercel)**
- Per-asset orbit-and-tape-measure page; five reconstructions of one capture behind one switcher.
- The dashboard manifest is fetched from blob storage at request time, so publishing a new scan is an upload — never a redeploy.
- Per-tool downloads: millimetre STL for CAD, PLY/GLB for Blender, and URDF/MJCF/USDA for ROS, MuJoCo, and Isaac Sim.

### Measurement Honesty by Design
- Exactly one measurement source, enforced in the UI: the RGB-D fused mesh is measurable; the splat is rough-only (a cloud, not a surface); nvblox and photogrammetry meshes carry the whole room; the generative mesh's measure tool is disabled outright — its geometry is invented by a model.
- Published sizes carry an honest ±1–2 in claim; the 0.25 in display grid is declared as rounding, not tolerance.
- An independent cross-check re-measures the object from the raw trained splat — a referee that shares no inputs with the fuse it checks.
- Comparing dimensions component-wise in the pipeline's own axis order (instead of sorting them first) exposed that 11 of 14 published assets had silently transposed length and width.
- A disputed figure keeps its card but loses its ± chip, ships with its refutation, and the quoting logic refuses to tier it: the page badge reads "not safe to quote", so an unmeasurable item is priced by a human rather than by a wrong number.

### Results
- Koala demo capture: published 6.00 × 5.75 × 5.00 in against a ~6 in plush — the raw solve is accurate to about a quarter inch; the live tape reads 2.0 in across its arm.
- Sofa benchmark: 28/28 SfM views registered from 31 iPad keyframes; roughly 550 s capture-to-page on the GPU box.
- Coverage, not frame count, decides quality: ~9° angular steps between frames reconstruct reliably while ~19° fails — a 116-frame one-sided sweep lost 111 frames to the registration gate that a 26-frame orbit passed.
- The splat referee caught a gross fuse error on a classroom chair (fuse 28.9 × 32.8 × 35.7 in vs recovered 21.8 × 22.0 × 32.4 in against an ~18 × 21 × 32 in chair).
- Height anchored to the LiDAR floor plane measured ~18× more stable than the RGB-only axes (repeatability ΔH 1.0 mm vs ΔW 17.8 mm).

### Open Problems, Stated Honestly
- Object isolation is the open problem: a depth slab cuts a region, not an object, so the demo book's box bounds the table it lies on — and the generative mesh's beauty is not evidence the measurement is right.
- The published box is gravity-aligned but unconstrained in yaw: a sofa sitting 31° off-axis had its true 64.2 × 40.9 in footprint split across both axes. The cross-check caught it, and the page shipped "not safe to quote" instead of a confident wrong number.
- A self-audit against an aspirational ±0.25 in spec concluded the defensible accuracy is ±1–2 in — which is exactly what the product claims.

### Media

<div style="display: flex; justify-content: center; margin: 20px 0;">
  <img src="/images/cratescan_sofa_measure.jpg" alt="Dashboard measured mesh of a sofa with tape measures and a not-safe-to-quote badge" style="width: 100%; max-width: 800px; height: auto; border-radius: 8px; box-shadow: 0 4px 12px rgba(0,0,0,0.1); object-fit: contain;">
</div>
<p style="margin-top: 8px; font-size: 0.9em; color: #666; text-align: center;"><strong>The delivered page:</strong> the measured mesh with a live tape measure — and a printed size the pipeline itself disputes, badged "not safe to quote".</p>

<div style="display: flex; justify-content: center; margin: 20px 0;">
  <img src="/images/cratescan_switcher.jpg" alt="Reconstruction switcher showing object, full scene, depth cloud, nvblox, and Meshroom tabs" style="width: 100%; max-width: 800px; height: auto; border-radius: 8px; box-shadow: 0 4px 12px rgba(0,0,0,0.1); object-fit: contain;">
</div>
<p style="margin-top: 8px; font-size: 0.9em; color: #666; text-align: center;"><strong>One capture, five reconstructions:</strong> Object · Full scene · Depth cloud · nvblox · Meshroom, behind a single switcher.</p>

<div style="display: flex; justify-content: center; gap: 12px; flex-wrap: wrap; margin: 20px 0;">
  <img src="/images/cratescan_koala_mesh.png" alt="Koala measured mesh with tape measure" style="width: 100%; max-width: 360px; height: auto; border-radius: 8px; box-shadow: 0 4px 12px rgba(0,0,0,0.1); object-fit: contain;">
  <img src="/images/cratescan_koala_splat.png" alt="Koala Gaussian splat, rough only" style="width: 100%; max-width: 360px; height: auto; border-radius: 8px; box-shadow: 0 4px 12px rgba(0,0,0,0.1); object-fit: contain;">
  <img src="/images/cratescan_koala_gen.png" alt="Koala TRELLIS generative mesh, not a measurement" style="width: 100%; max-width: 360px; height: auto; border-radius: 8px; box-shadow: 0 4px 12px rgba(0,0,0,0.1); object-fit: contain;">
</div>
<p style="margin-top: 8px; font-size: 0.9em; color: #666; text-align: center;"><strong>Three answers, one truth label each:</strong> measured mesh (measurable) · Gaussian splat (rough only) · generative mesh (not a measurement).</p>

<div style="display: flex; justify-content: center; margin: 20px 0;">
  <img src="/images/cratescan_sofa_splat.jpg" alt="Full-scene Gaussian splat of the sofa with rough measurements" style="width: 100%; max-width: 800px; height: auto; border-radius: 8px; box-shadow: 0 4px 12px rgba(0,0,0,0.1); object-fit: contain;">
</div>
<p style="margin-top: 8px; font-size: 0.9em; color: #666; text-align: center;"><strong>The photoreal splat:</strong> for looking, not for sizing — its rough tape is on-screen evidence in the dimension dispute.</p>

**Code:** <a href="https://github.com/jayahn17/engin_170" target="_blank" rel="noopener">jayahn17/engin_170</a> (iOS app + pipeline demo) · <a href="https://github.com/jayahn17/3dasset" target="_blank" rel="noopener">jayahn17/3dasset</a> (assetpipe GPU backend)

---
title: "CrateScanner → assetpipe: iPad LiDAR Scan to a Measurable 3D Asset"
excerpt: "An iPad captures RGB-D and pose. A GPU backend returns three reconstruction families, identifies which output is safe to measure, and refuses to quote an unsupported size."
collection: portfolio
category: class
date: 2026-08-01
role: "ENGIN 170: Client Project (iOS capture app and reconstruction backend)"
duration: "July 2026 – August 2026"
tech_tags: ["LiDAR / RGB-D", "Point Clouds", "Mesh Reconstruction", "Segmentation", "Object Detection", "Pose Tracking", "3D Gaussian Splatting", "Photogrammetry", "Open3D", "Python"]
featured: true
impact: "Component-wise dimension cross-check caught silently transposed length/width in 11 of 14 RGB-D assets; splat training cut ~85 min → ~20 min at equal quality"
share: false
teaser: "cratescanner_dash_sofa_measure.jpg"
header:
  teaser: "cratescanner_dash_sofa_measure.jpg"
---

## CrateScanner → assetpipe

*ENGIN 170 client project, UC Berkeley. Two repos: [jayahn17/engin_170](https://github.com/jayahn17/engin_170/blob/dashboard-main/README.md) (iPad capture app + demo viewer) and [jayahn17/3dasset](https://github.com/jayahn17/3dasset) (reconstruction backend).*

### One-line story

**Scan an object with an iPad and receive a metric 3D asset that you can orbit and measure.** The iPad serves as a camera rather than a reconstructor. It records RGB, depth, and ARKit pose. A Linux GPU box turns that data into three reconstruction families and then identifies **which output may be measured**. That distinction is the foundation of the design.

The customer needs to answer one practical question: *How large should the shipping crate be?* A plausible but incorrect answer is more costly than no answer. Therefore, the system's most important output is not the dimension itself. It is the **verdict on whether that dimension is reliable enough to quote**.

<div style="margin: 28px 0; padding: 24px; background: #f5f7fa; border: 1px solid #e2e8f0; border-radius: 10px;">
  <div style="display: grid; grid-template-columns: repeat(auto-fit, minmax(200px, 1fr)); gap: 16px; align-items: stretch;">
    <div style="background: #fff; border: 1px solid #e2e8f0; border-left: 4px solid #4a9eff; border-radius: 8px; padding: 16px;">
      <div style="font-size: 0.8em; font-weight: 700; color: #4a9eff; letter-spacing: 0.5px;">STAGE 1</div>
      <div style="font-weight: 700; margin: 4px 0;">Capture</div>
      <div style="font-size: 0.9em; color: #555;">SwiftUI/ARKit iPad app. RGB + 16-bit millimetre depth + gravity-aligned pose, with an AR arrow that tells you to keep orbiting. Uploads to a shared Drive folder.</div>
    </div>
    <div style="background: #fff; border: 1px solid #e2e8f0; border-left: 4px solid #4a9eff; border-radius: 8px; padding: 16px;">
      <div style="font-size: 0.8em; font-weight: 700; color: #4a9eff; letter-spacing: 0.5px;">STAGE 2</div>
      <div style="font-weight: 700; margin: 4px 0;">Reconstruct</div>
      <div style="font-size: 0.9em; color: #555;">Three reconstruction families produce five viewable outputs on a single 16 GB GPU. The measured, photoreal, and generative families include an RGB-D fuse, 3DGS splat, photogrammetry model, nvblox TSDF, and generative mesh. Stages are serial, skippable, and resumable.</div>
    </div>
    <div style="background: #fff; border: 1px solid #e2e8f0; border-left: 4px solid #4a9eff; border-radius: 8px; padding: 16px;">
      <div style="font-size: 0.8em; font-weight: 700; color: #4a9eff; letter-spacing: 0.5px;">STAGE 3</div>
      <div style="font-weight: 700; margin: 4px 0;">Publish + adjudicate</div>
      <div style="font-size: 0.9em; color: #555;">One web page per capture: every reconstruction behind a switcher, a live tape measure enabled only on the measurable file, and a badge that can read <code>not safe to quote</code>.</div>
    </div>
  </div>
</div>

---

### The deliverable is a page, not a file

Handing over a mesh hands over an unlabelled claim. The delivered artifact is a page where every reconstruction of one capture sits behind one switcher, the tape measure is live on the file that is allowed to be measured, and the printed size carries a verdict.

<div style="display: grid; grid-template-columns: repeat(auto-fit, minmax(320px, 1fr)); gap: 18px; margin: 24px 0;">
  <div>
    <img src="/images/cratescanner_dash_sofa_measure.jpg" alt="Sofa dashboard with a printed size disputed by the on-page tape measure" style="width: 100%; border-radius: 8px; border: 1px solid #e2e8f0;">
    <p style="font-size: 0.88em; color: #666; margin-top: 8px;"><strong>Sofa frame bug.</strong> The published dimensions are <code>53.75 × 52.25 × 30.00 in</code>. The tape measure on the same page reads 68 in along the seat and 72 in along the base.</p>
  </div>
  <div>
    <img src="/images/cratescanner_dash_table_measure.jpg" alt="Coffee table dashboard showing a photogrammetry mesh with the room attached" style="width: 100%; border-radius: 8px; border: 1px solid #e2e8f0;">
    <p style="font-size: 0.88em; color: #666; margin-top: 8px;"><strong>Coffee table isolation bug.</strong> The published dimensions are <code>46.25 × 44.25 × 13.75 in</code>. The tape reads 34 in across the top, 13 in to the floor, and 5 in for the slab thickness.</p>
  </div>
</div>

Both pages display **`not safe to quote`**. This badge is more important than the mesh because the two scans fail for entirely different reasons, and **neither failure is visible from the model alone**:

- **The sofa is a frame bug.** The published box is axis-aligned to the *anchor's* gravity frame, and this sofa sits 31° off it. A footprint whose tightest rectangle is 64.2 × 40.9 in gets published as `53.75 × 52.25`. The length is split across two axes, so neither published number represents a side of the sofa. Both values still appear plausible, which is why the error initially went unnoticed.
- **The coffee table is an isolation bug.** The depth slab keeps the floor the table stands on, so the fuse spans 44 × 46 in around a top that measures 34 in.

**What the page does about it.** It compares the published dimensions against the geometry shown on screen, **component by component in the pipeline's own axis order**. The initial implementation sorted both dimension sets before comparing them. This concealed precisely the error the check was intended to catch: **11 of 14 RGB-D assets had shipped with length and width silently transposed.** A discrepancy greater than 2 in and 5% is reported as spread. A **factor-of-two** difference is not labeled as uncertainty because no reconstruction method should double a dimension. A disputed value then loses its `± 1–2 in` label, and `quoteFor` refuses to assign a pricing tier. A human reviews the item instead of relying on an incorrect measurement.

<div style="margin: 24px 0;">
  <img src="/images/cratescanner_dash_table_splat.jpg" alt="Reconstruction switcher for Object, Full scene, Depth cloud, nvblox, and Meshroom" style="width: 100%; border-radius: 8px; border: 1px solid #e2e8f0;">
  <p style="font-size: 0.88em; color: #666; margin-top: 8px;">The viewer presents five reconstructions from one capture: Object · Full scene · Depth cloud · nvblox · Meshroom. Each tab identifies the displayed file and the model that produced it. This avoids making unsupported assumptions from filenames.</p>
</div>

---

### Every reconstruction carries one honest label

The five outputs disagree with one another. Rather than averaging or hiding those differences, the system designates exactly one measurement source and labels the rest in the interface. This rule is **enforced rather than merely recommended** because the tape measure is disabled for the final row.

| File | Measurable? | Why |
|---|---|---|
| `object_mesh.ply`: RGB-D fuse | ✅ **yes** | `dims.json` is computed from this file |
| `scene_gaussians.splat`: 3DGS | ⚠️ rough | a splat is a density cloud, not a surface |
| `nvblox_visual.glb`, `meshroom_visual.glb` | ⚠️ rough | real surfaces, but they carry the whole room |
| `asset_trellis.glb`: generative | ❌ **no** | geometry invented by a model |

Across the three demo assets, the generative mesh matches only the *single longest* published axis and differs by as much as **20%** on the others. Despite these errors, it is visually the most polished output in the repository.

<div style="display: grid; grid-template-columns: repeat(auto-fit, minmax(240px, 1fr)); gap: 18px; margin: 24px 0;">
  <div>
    <img src="/images/cratescanner_koala_mesh.png" alt="Koala measured with an RGB-D fuse mesh" style="width: 100%; border-radius: 8px; border: 1px solid #e2e8f0;">
    <p style="font-size: 0.88em; color: #666; margin-top: 8px;"><strong>Koala measured mesh.</strong> This cleanly isolated result has a live tape measurement of 2.0 in across the arm and a published box of <code>6.00 × 5.75 × 5.00 in</code>. The capture contains 25 frames, of which 7 were merged.</p>
  </div>
  <div>
    <img src="/images/cratescanner_book_gen.png" alt="Visually polished but unmeasurable generative mesh of a book" style="width: 100%; border-radius: 8px; border: 1px solid #e2e8f0;">
    <p style="font-size: 0.88em; color: #666; margin-top: 8px;"><strong>Book cautionary example.</strong> The generative mesh is the most visually polished output in the project, but the <code>32.75 × 34.00 in</code> bounds describe the <em>table beneath the book</em>, not the approximately 11 in book. Visual quality alone is not measurement evidence.</p>
  </div>
  <div>
    <img src="/images/cratescanner_koala_splat.png" alt="Photorealistic Koala 3D Gaussian splat labeled for rough measurement only" style="width: 100%; border-radius: 8px; border: 1px solid #e2e8f0;">
    <p style="font-size: 0.88em; color: #666; margin-top: 8px;"><strong>Koala Gaussian splat.</strong> This photorealistic output is explicitly labeled <code>rough only</code>. Ray hit-testing accumulates transmittance and stops at half-opacity.</p>
  </div>
</div>

---

### Key engineering decisions

**1. Metric by construction.** ARKit delivers depth in millimetres and a gravity-aligned pose, so the fused geometry begins at real scale without a reference card, known-size object, or user input. Everything is transformed into the anchor's gravity frame, so *height* follows gravity rather than the iPad's tilt. Photograph-only methods do not provide this property.

**2. The tape measure is the deliverable, and it reports a defensible tolerance.** Handles are rescaled to a constant pixel size every frame so they remain usable at both 0.15 m and 8 m. Sizes are quantised to 0.25 in to match crate construction increments. However, surface RMS is approximately 19 mm and repeat runs vary by 3.6–7.4 in, so the **stated tolerance is ±1–2 in**. A rounding increment must not be presented as measurement tolerance.

**3. Cost-aware orchestration.** GPU stages run strictly serially on one 16 GB card, and each stage skips processing when its output already exists. A failed run can therefore resume without restarting an 85-minute training process. Replacing 3DGUT with **LichtFeld Studio** reduced splat training to **approximately 20 minutes at equal quality**. With fewer than eight usable images, the pipeline declines to start SfM rather than spending GPU time on a solve that is unlikely to converge.

**4. Failure gates over best-effort output.** Frames merge only if ICP fitness is at least 0.2 and inlier RMSE clears a ceiling that *scales with working distance*. LiDAR noise increases with range, so a fixed ceiling rejected valid alignments. Missing optional tools such as Meshroom, nvblox, or TRELLIS cause their stage to be skipped instead of failing the entire run.

---

### Perception stack: detection, segmentation, tracking

The pipeline is organised as a **`CAPTURE → IDENTIFY → RECONSTRUCT → DIGITALIZE → ORGANIZE`** chain, where every arrow is a typed interface with something that runs today behind it and an adapter seam for a stronger model. Concretely, across sensors (LiDAR depth, RGB, IMU-fused pose), 3D representations (point clouds, meshes, TSDF volumes, Gaussian fields), and the classic CV trio:

**Object detection uses an open vocabulary because a fixed 80-class list cannot describe a warehouse.** The `Detector` interface takes class names as *text* (`["cardboard box", "sneaker", "coffee mug"]`) rather than indices into a frozen label set. Two backends ship: a zero-dependency heuristic detector that lets the core package run without an ML stack, and a **YOLO-World** adapter (`yolov8x-worldv2`, text-prompted, confidence-gated) for the live streaming path where interactive speed matters more than maximum accuracy. Backends use lazy imports so the dependency-free core remains lightweight.

**Segmentation has three layers, with explicit distinctions between implemented and planned capabilities.**

| Layer | Status | Method |
|---|---|---|
| Point-cloud background removal | **runs today** | voxel-grid outlier rejection → RANSAC dominant plane → 26-connected voxel clustering |
| Depth-slab object isolation | **runs today** | σ-adaptive median-depth window + RANSAC plane strip, per frame |
| Learned instance masks | adapter seam | Grounding DINO box → SAM 2 mask, wired as an interface, weights not installed |

The shipping background remover is the piece I am happiest with: thresholds are all derived from the cloud's **2–98 percentile bounding-box diagonal**, so the same code handles a phone video of a shoebox and a full room sweep with no per-scene tuning. Plane inliers are stripped along with everything hanging *below* the recovered ground, and only clusters ≥25% of the largest survive. It refuses to run below 50 points, and it declines to remove a plane that *is* the scene.

This stage also contains the project's primary limitation: the RGB-D measurement path selects a **region by depth, not an object by identity**. That is why a book's bounding box captures the table beneath it. Learned masks applied during fusion through the Grounded SAM 2 interface are the appropriate fix. A post-processing crop cannot solve the underlying isolation problem.

**Three forms of tracking support the pipeline.**

- **Camera pose tracking.** ARKit VIO supplies a 6-DoF gravity-aligned pose per frame. Every downstream stage consumes it, and the fact that it is metric is what removes the scale ambiguity from the whole pipeline.
- **Frame-to-frame registration.** ICP aligns each frame to the single sharpest *anchor* frame rather than to its predecessor, preventing registration error from accumulating through the sequence. Fitness and distance-scaled RMSE gates reject frames instead of merging invalid ones. On a 116-frame sofa sweep, 111 frames were rejected. This conservative rejection is intentional.
- **Cross-modal track alignment.** Umeyama fits the SfM camera track onto the metric ARKit track, which is what carries scale from the depth sensor into a photogrammetry reconstruction that has none.
- Instance tracking across video frames (SAM 2 `track_id`, so one physical object stays one asset as the user walks around it) is designed into the `Detection` type and left as an adapter seam.

**Meshes and point clouds are tested rather than assumed to be correct.** The pipeline includes back-projection to metric clouds, voxel downsampling, connected-component clustering, screened Poisson surface reconstruction, TSDF fusion through nvblox, photogrammetry meshing through Meshroom, AABB/OBB fitting, and mesh → URDF export for simulators. The verification layer is particularly important. `dims_crosscheck.py` recomputes the size implied by *every* exported file for one object and reports disagreements. This check revealed that `object_mesh.glb` and `object_mesh.ply` differed by 7–12% for the same asset. A self-consistent but incorrect number can appear valid, so independent representations must be compared.

---

### Selected math

**Depth back-projection.** Each depth pixel becomes a metric camera-frame point through the pinhole model, with depth arriving as 16-bit millimetres so that \\(z = 0.001\,D(u,v)\\) is metric with no scale factor anywhere:

$$
\mathbf{x}_c = \left[\frac{(u-c_x)\,z}{f_x},\ \frac{(v-c_y)\,z}{f_y},\ z\right]^{\top}
$$

**Registration gate.** The sharpest frame (Laplacian sharpness × valid-depth fraction) becomes the *anchor*, and every other frame aligns to it **directly**, so drift cannot chain. Point-to-point ICP finds the rigid \\(T \in SE(3)\\) minimising \\(E(T) = \sum_{(\mathbf p,\mathbf q)\in\mathcal K}\|T\mathbf p - \mathbf q\|^2\\), and a frame merges only if it clears a distance-scaled residual ceiling:

$$
\tau(d) = \mathrm{clip}\big(0.02\max(1,d),\ 0.02,\ 0.035\big)\ \text{m}
$$

This gate determines which data reaches every downstream stage. Seven of 25 frames survived for the koala capture. A screened Poisson solve \\(\Delta\chi = \nabla\cdot\vec V\\) at octree depth 8 then closes the surface.

**Mesh to crate size.** The gravity-frame **AABB** is published rather than the tighter oriented box, because a crate stands upright and height must be along gravity:

$$
\mathbf e = \max_i \mathbf x_i - \min_i \mathbf x_i,
\qquad
q(x) = 0.25\left\lfloor \frac{x}{0.25} + \frac12 \right\rfloor
$$

Gravity fixes only two of the three axes. Yaw follows the iPad orientation at the moment the anchor frame is established. That single unconstrained degree of freedom causes the sofa error.

**Metric scale for photogrammetry.** SfM recovers geometry only up to a similarity, so Umeyama fits its camera centres onto the metric ARKit centres in closed form from the SVD of the cross-covariance:

$$
\min_{s,R,\mathbf t}\ \sum_i \left\|sR\mathbf p_i + \mathbf t - \mathbf q_i\right\|^2
$$

The residual is retained deliberately: *a scale that did not converge is different from a scale you do not have*, and only the first one is dangerous.

---

### Known failure modes

Stated plainly, because the project's thesis is that an undefended number is worse than none.

- **Isolation is unsolved.** The depth slab cuts a *region*, not an object, so a table or floor patch lands inside the published box. This is the book's 33 in and the coffee table's 44 × 46 in around a 34 in top. Fixing it needs masks at fuse time, not a post-hoc crop.
- **The box is aligned to the anchor, not the object.** An object rotated within the gravity frame has its length distributed across two axes. For the sofa at 31°, the published length is 12 in too short and the width is 11 in too long, yet both values appear plausible. The correction must occur before quantisation because the viewer can only report the disagreement.
- **Coverage, not frame count, decides quality.** Angular step between shots predicts the result: ~9° works, ~19° fails. A 116-frame sofa swept from one end at 0.6 m lost 111 frames to the ICP gate; the 26-frame *orbited* coffee table kept 10.
- **One object can export at two sizes.** `object_mesh.glb` and `object_mesh.ply` have disagreed by 7–12% on the same asset. `dims_crosscheck.py` catches this; no UI check can, because a self-consistent wrong number looks correct.

---

### What I built

| Component | Repo |
|---|---|
| iPad capture app (ARKit session, guided-capture dome, RGB-D + pose export, Drive sync); **[full write-up]({{ '/portfolio/portfolio-12/' | relative_url }})** | [`engin_170/CrateScanner/`](https://github.com/jayahn17/engin_170/tree/dashboard-main/CrateScanner) |
| Orchestrator + measurement (`recon3.py`, `rgbd_object_asset.py`, Umeyama scaling, dimension cross-check) | [`3dasset/assetpipe/`](https://github.com/jayahn17/3dasset/tree/main/assetpipe) |
| Orbit + measure web viewer and publisher (three.js, splat transmittance hit-testing) | [`engin_170/pipeline/demo/`](https://github.com/jayahn17/engin_170/tree/dashboard-main/pipeline) |

### Tooling

ARKit / LiDAR, Swift + SwiftUI, XcodeGen, Python 3.10, Open3D, NumPy, AliceVision/Meshroom, LichtFeld Studio (3DGS), NVIDIA nvblox, TRELLIS, YOLO-World / Ultralytics, Grounding DINO + SAM 2 (interface), COLMAP/pycolmap, PyTorch, CUDA 12.1, three.js, SQLite. Backend on Ubuntu 22.04 + RTX 4080.

*Course project for ENGIN 170, UC Berkeley. Capture app builds on [E170_Client_Project](https://github.com/NathanJim17/E170_Client_Project).*

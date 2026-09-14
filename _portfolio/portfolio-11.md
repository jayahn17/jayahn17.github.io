---
title: "CrateScanner → assetpipe: iPad LiDAR Scan to a Measurable 3D Asset"
excerpt: "A Swift/ARKit iPad app records metric RGB-D and pose. A GPU backend returns three reconstruction families, identifies which output is safe to measure, and refuses to quote an unsupported size."
collection: portfolio
category: class
date: 2026-08-02
role: "ENGIN 170: Client Project (iOS capture app and reconstruction backend)"
duration: "July 2026 – August 2026"
tech_tags: ["Swift", "SwiftUI", "ARKit", "LiDAR / RGB-D", "Point Clouds", "Mesh Reconstruction", "Segmentation", "Object Detection", "Pose Tracking", "3D Gaussian Splatting", "Photogrammetry", "Open3D", "Python"]
featured: true
impact: "Sharpness and steadiness gates plus stall-detection guidance; component-wise dimension cross-check caught silently transposed length/width in 11 of 14 RGB-D assets; splat training cut ~85 min → ~20 min at equal quality"
share: false
teaser: "cratescanner_dash_sofa_measure.jpg"
header:
  teaser: "cratescanner_dash_sofa_measure.jpg"
redirect_from:
  - /portfolio/portfolio-12/
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

### iPad capture: the Swift/ARKit client {#ios-capture}

<div style="display: flex; align-items: center; gap: 20px; margin: 8px 0 28px 0; flex-wrap: wrap;">
  <img src="/images/cratescanner_app_icon.png" alt="CrateScanner app icon" style="width: 108px; height: 108px; border-radius: 24px; box-shadow: 0 4px 14px rgba(0,0,0,0.18);">
  <div style="flex: 1; min-width: 260px;">
    <strong>CrateScanner</strong>: iPadOS / iOS 16+, LiDAR required.<br>
    Swift · SwiftUI · ARKit · RealityKit · XcodeGen · TestFlight<br>
    <a href="https://github.com/jayahn17/engin_170/tree/dashboard-main/CrateScanner">Source</a>
  </div>
</div>

The iPad is a camera, not a reconstructor. It should record reliable data, reject unreliable data, and then transfer reconstruction work to a Linux GPU system. That sounds like a small job. It is not, because ARKit will happily hand you thousands of unusable frames and report success.

#### Four problems that shaped the app

<div style="margin: 28px 0; padding: 24px; background: #f5f7fa; border: 1px solid #e2e8f0; border-radius: 10px;">
  <div style="display: grid; grid-template-columns: repeat(auto-fit, minmax(230px, 1fr)); gap: 16px; align-items: stretch;">
    <div style="background: #fff; border: 1px solid #e2e8f0; border-left: 4px solid #7c5cff; border-radius: 8px; padding: 16px;">
      <div style="font-size: 0.8em; font-weight: 700; color: #7c5cff; letter-spacing: 0.5px;">PROBLEM 1</div>
      <div style="font-weight: 700; margin: 4px 0;">ARKit frames are blurry</div>
      <div style="font-size: 0.9em; color: #555;">The camera is optimized for tracking rather than photography. Deep Fusion and Smart HDR are unavailable, while long indoor exposures introduce motion blur. Continuous capture therefore saves many unusable frames.</div>
    </div>
    <div style="background: #fff; border: 1px solid #e2e8f0; border-left: 4px solid #7c5cff; border-radius: 8px; padding: 16px;">
      <div style="font-size: 0.8em; font-weight: 700; color: #7c5cff; letter-spacing: 0.5px;">PROBLEM 2</div>
      <div style="font-weight: 700; margin: 4px 0;">Users stand still</div>
      <div style="font-size: 0.9em; color: #555;">The most common poor scan is not shaky but <em>stationary</em>. Without parallax, the system receives no new geometry and never observes the far side of the object.</div>
    </div>
    <div style="background: #fff; border: 1px solid #e2e8f0; border-left: 4px solid #7c5cff; border-radius: 8px; padding: 16px;">
      <div style="font-size: 0.8em; font-weight: 700; color: #7c5cff; letter-spacing: 0.5px;">PROBLEM 3</div>
      <div style="font-size: 0.9em; color: #555;">ARFrame is a trap</div>
      <div style="font-size: 0.9em; color: #555;">Frames own pixel buffers from a small fixed pool. Hold one past the delegate callback and you starve ARKit until it stops delivering frames entirely.</div>
    </div>
    <div style="background: #fff; border: 1px solid #e2e8f0; border-left: 4px solid #7c5cff; border-radius: 8px; padding: 16px;">
      <div style="font-size: 0.8em; font-weight: 700; color: #7c5cff; letter-spacing: 0.5px;">PROBLEM 4</div>
      <div style="font-weight: 700; margin: 4px 0;">Resolution is a trap too</div>
      <div style="font-size: 0.9em; color: #555;">Fusion resizes colour to the 256×192 depth resolution used by LiDAR iPads. Storing 1920×1440 images creates approximately 28 times more pixels than the fuser reads.</div>
    </div>
  </div>
</div>

#### 1. A capture gate instead of a frame firehose

Rather than saving every frame, a `CaptureGate` scores the live feed and accepts keyframes only when the image is **sharp** and the device is **steady**. A `focusing → moving → ready` state machine controls the reticle colour and shutter availability, preventing the user from saving a blurred frame.

Sharpness is gradient energy on the luma plane, read directly out of plane 0 of ARKit's YUV buffer and subsampled every 4th pixel so it runs on every frame:

$$
S = \frac{1}{N}\sum_{(u,v)}\Big[\big(Y_{u,v}-Y_{u+s,v}\big)^2 + \big(Y_{u,v}-Y_{u,v+s}\big)^2\Big]
$$

The threshold is **adaptive rather than absolute**. A running peak decays at 0.99 per frame, and a frame passes at ≥ 45% of that peak, subject to an absolute floor that rejects near-dark images. A fixed threshold fails when the user moves from a bright area into a shadow. The running peak adapts to the scene instead.

Steadiness gates on angular velocity of the view direction (≤ 0.6 rad/s, approximately where blur begins) and linear speed (≤ 0.25 m/s). In **Detail** mode, the gate also captures a 12 MP keyframe at each brief pause in a step-and-shoot orbit. A minimum interval of 1.0 s and a minimum pose change of 0.12 m or approximately 8° distribute keyframes across the orbit instead of concentrating them where the user pauses.

#### 2. Guidance: a viewpoint dome and a stall detector

**`GuidedCapture`** replaces an unstructured orbit with a coverage checklist. It builds a dome of target viewpoints around the object using three elevation rings at 18°, 45°, and 68°, plus one top-down view. The azimuth count per ring is reduced by \\(\cos(\text{elev})\\):

$$
n(\text{elev}) = \max\!\big(6,\ \operatorname{round}(12\cos \text{elev})\big)
$$

That keeps targets roughly evenly spaced *on the sphere* rather than bunching toward the poles, yielding ~25–35 well-spread viewpoints. The app renders them in AR, points the user at the nearest unshot one, and auto-captures when they arrive within 0.30 m and 22° of the target pose.

**`MoveNudge`** handles the stationary-scan failure. It keeps a 2-second ring buffer of camera poses; if translation stays under 0.18 m *and* rotation under ~15° across the whole window while recording, the user is stuck. It then computes the **tangent to the orbit circle** about the object rather than a direction into or away from it:

$$
\hat{t} = \pm\,\frac{\hat{u}\times \mathbf{r}}{\lVert \hat{u}\times \mathbf{r}\rVert},
\qquad \mathbf{r} = \big(\mathbf{p}_{\text{cam}} - \mathbf{p}_{\text{pivot}}\big)\big|_{y=0}
$$

Two tangents exist. The system selects the tangent that matches the user's current direction, producing **one continuous lap** instead of a back-and-forth path. The hint remains fixed until the user has moved 0.30 m from the point where it appeared. This prevents the AR arrow from switching direction when the user merely shifts position.

#### 3. Threading around ARKit's constraints

The session delegate runs on a dedicated `userInitiated` queue, never main: recording a frame means a JPEG encode plus a depth copy, and on the main queue that is a visible stutter that also caps the achievable frame rate.

Inside the callback, all access to `ARFrame` pixel buffers occurs **synchronously**. The expensive encoding and writing work is transferred to a `utility` I/O queue only after the data has been copied. This resolves Problem 3 because retaining an `ARFrame` inside an escaping `Task` starves the buffer pool and causes ARKit to stop delivering frames. Shared frame and keyframe arrays are appended from the delegate queue and read by `finalize()` on the main actor, so access is protected by `NSLock`. The view model is `@MainActor` and publishes only value types to SwiftUI.

#### 4. Storing the right amount of data

Colour defaults to **640 px wide** because fusion resizes it to the *depth* resolution. Higher colour resolution does **not** sharpen fused geometry and matters only for later texturing. The app therefore records native colour intrinsics and full sensor dimensions **in the manifest** even when the pixels are downscaled. A later texture pass retains the required calibration data, while the default upload uses roughly one tenth of the storage.

Quality is user-selectable anyway (Fast 640 / Balanced 1280 / High 1920 / 4K), with the trade-off stated in plain language on the settings chip rather than buried.

#### Architecture: the geometry is deliberately ARKit-free

The decisions worth reasoning about are isolated from the framework that makes them hard to test:

| Layer | Files | Depends on |
|---|---|---|
| Pure geometry & policy | `GuidedCapture`, `MoveNudge`, `AABB`, `CapturedMesh` | `simd` / Foundation only |
| Value types & contracts | `MeasurementResult`, `ScanFeedback`, `CaptureSettings` | Foundation |
| Sensor & I/O | `CaptureGate`, `SessionExporter`, `PackageExporter`, `MeshExporter`, `GoogleDriveSync` | ARKit, CoreImage |
| AR orchestration | `ScanViewModel` (`ARSessionDelegate`) | ARKit + RealityKit |
| UI | `ScanView`, `ResultReviewView`, `IntroView`, `GhostBoxEntity` | SwiftUI |

`ScanViewModel` **is** the `ARSessionDelegate` rather than owning a separate coordinator, so all AR state lives in one place; SwiftUI only reads `@Published` properties and calls intent methods (`placeBox`, `fit`, `capture`). The "should we nudge the user, and which way?" question is answered by a struct with no ARKit import at all.

**Measurement on device.** The user places a ghost box in AR. `CapturedMesh.cropped(to:)` keeps only triangles whose *centroid* falls inside the box and compactly re-indexes them, which isolates the object from the floor. `AABB.fitting()` then returns the tight world-axis-aligned box over the surviving vertices. `MeasurementResult` converts the dimensions to inches and applies the crating buffer **to each side**. For example, a 40 in object with a 2 in buffer requires a 44 in crate, matching the client's construction method. The structure has been `Codable` from the beginning, so adding a backend POST requires integration rather than a redesign.

#### Shipping details that mattered

- **Device gating up front.** `LiDARAvailability` checks `supportsSceneReconstruction(.mesh)` before anything else and routes unsupported devices to an explanation screen, instead of letting ARKit fail opaquely mid-scan.
- **XcodeGen.** The `.xcodeproj` is generated from `project.yml` and excluded from Git, so files from a teammate's pull request join the target automatically. This avoids `.pbxproj` merge conflicts, which can consume significant time on a multi-person project.
- **Drive sync scoped by owner, not folder name.** Resolving the shared folder by its *owner* means a teammate joins the shared folder rather than silently creating a private one that pools nothing. This was a live bug before it was a design rule.
- **Two export paths.** `PackageExporter` builds one AirDrop/scp-ready folder containing `measurement.json`, `mesh.obj` in inches, and the full RGB-D `session/` in the exact schema expected by the Linux pipeline. The folder is compressed through `NSFileCoordinator(.forUploading)`. Direct Drive upload and a worker POST endpoint provide automated alternatives.
- **Privacy manifest** (`PrivacyInfo.xcprivacy`) and TestFlight distribution configured for client testing.

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
| iPad capture app (ARKit session, guided-capture dome, RGB-D + pose export, Drive sync); see [iOS capture](#ios-capture) | [`engin_170/CrateScanner/`](https://github.com/jayahn17/engin_170/tree/dashboard-main/CrateScanner) |
| Orchestrator + measurement (`recon3.py`, `rgbd_object_asset.py`, Umeyama scaling, dimension cross-check) | [`3dasset/assetpipe/`](https://github.com/jayahn17/3dasset/tree/main/assetpipe) |
| Orbit + measure web viewer and publisher (three.js, splat transmittance hit-testing) | [`engin_170/pipeline/demo/`](https://github.com/jayahn17/engin_170/tree/dashboard-main/pipeline) |

### Tooling

ARKit / LiDAR, Swift + SwiftUI, XcodeGen, Python 3.10, Open3D, NumPy, AliceVision/Meshroom, LichtFeld Studio (3DGS), NVIDIA nvblox, TRELLIS, YOLO-World / Ultralytics, Grounding DINO + SAM 2 (interface), COLMAP/pycolmap, PyTorch, CUDA 12.1, three.js, SQLite. Backend on Ubuntu 22.04 + RTX 4080.

*Course project for ENGIN 170, UC Berkeley. Capture app builds on [E170_Client_Project](https://github.com/NathanJim17/E170_Client_Project).*

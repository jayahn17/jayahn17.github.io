---
layout: project
track: class
org: "ENGIN 170, UC Berkeley"
title: "CrateScanner → assetpipe: iPad LiDAR Scan to a Measurable 3D Asset"
excerpt: "A Swift/ARKit iPad app records metric RGB-D and pose. A GPU backend returns three reconstruction families, identifies which output is safe to measure, and refuses to quote an unsupported size."
deck: "Scan an object with an iPad and get back a metric 3D asset you can orbit and measure. The iPad is a camera, not a reconstructor; a GPU box builds five reconstructions and, more importantly, decides which one may be measured."
collection: portfolio
category: class
date: 2026-08-02
role: "Client project: iOS capture app and reconstruction backend"
duration: "July 2026 – August 2026"
team: "Course project for ENGIN 170, UC Berkeley. Capture app builds on E170_Client_Project."
tech_tags: ["Swift", "SwiftUI", "ARKit", "LiDAR / RGB-D", "Point Clouds", "Mesh Reconstruction", "Segmentation", "Object Detection", "Pose Tracking", "3D Gaussian Splatting", "Photogrammetry", "Open3D", "Python"]
tools: "ARKit / LiDAR, Swift + SwiftUI, XcodeGen, Python 3.10, Open3D, NumPy, AliceVision/Meshroom, LichtFeld Studio (3DGS), NVIDIA nvblox, TRELLIS, YOLO-World / Ultralytics, Grounding DINO + SAM 2 (interface), COLMAP/pycolmap, PyTorch, CUDA 12.1, three.js, SQLite. Backend on Ubuntu 22.04 + RTX 4080."
featured: true
impact: "Sharpness and steadiness gates plus stall-detection guidance; component-wise dimension cross-check caught silently transposed length/width in 11 of 14 RGB-D assets; splat training cut ~85 min → ~20 min at equal quality"
share: false
teaser: "cratescanner_dash_sofa_measure.jpg"
header:
  teaser: "cratescanner_dash_sofa_measure.jpg"
redirect_from:
  - /portfolio/portfolio-12/
links:
  - { label: "Capture app + viewer (GitHub)", url: "https://github.com/jayahn17/engin_170/blob/dashboard-main/README.md" }
  - { label: "Reconstruction backend (GitHub)", url: "https://github.com/jayahn17/3dasset" }
hero:
  image: "cratescanner_dash_sofa_measure.jpg"
  alt: "Sofa dashboard with a printed size disputed by the on-page tape measure"
  caption: "**The deliverable is a verdict, not a mesh.** The page publishes `53.75 × 52.25 × 30.00 in` for this sofa, but the live tape measure on the same model reads 68 in along the seat and 72 in along the base, so the badge says `not safe to quote`."
stats:
  - { value: "11 / 14", label: "RGB-D assets with silently transposed L/W, caught by cross-check" }
  - { value: "85 → 20 min", label: "splat training at equal quality" }
  - { value: "5", label: "reconstructions per capture, 1 measurable" }
  - { value: "±1–2 in", label: "stated measurement tolerance" }
steps:
  - { label: "Stage 1", title: "Capture", text: "SwiftUI/ARKit iPad app. RGB + 16-bit millimetre depth + gravity-aligned pose, with an AR arrow that tells you to keep orbiting. Uploads to a shared Drive folder." }
  - { label: "Stage 2", title: "Reconstruct", text: "Three reconstruction families produce five viewable outputs on a single 16 GB GPU: an RGB-D fuse, a 3DGS splat, a photogrammetry model, an nvblox TSDF, and a generative mesh. Stages are serial, skippable, and resumable." }
  - { label: "Stage 3", title: "Publish + adjudicate", text: "One web page per capture: every reconstruction behind a switcher, a live tape measure enabled only on the measurable file, and a badge that can read `not safe to quote`." }
problems:
  - { label: "Problem 1", title: "ARKit frames are blurry", text: "The camera is optimized for tracking, not photography. Deep Fusion and Smart HDR are unavailable, and long indoor exposures introduce motion blur, so continuous capture saves many unusable frames." }
  - { label: "Problem 2", title: "Users stand still", text: "The most common poor scan is not shaky but *stationary*. Without parallax the system gets no new geometry and never sees the far side of the object." }
  - { label: "Problem 3", title: "ARFrame is a trap", text: "Frames own pixel buffers from a small fixed pool. Hold one past the delegate callback and you starve ARKit until it stops delivering frames." }
  - { label: "Problem 4", title: "Resolution is a trap too", text: "Fusion resizes colour to the 256×192 depth resolution of LiDAR iPads. Storing 1920×1440 images creates about 28× more pixels than the fuser reads." }
media:
  dashboards:
    - { image: "cratescanner_dash_sofa_measure.jpg", caption: "**Sofa: a frame bug.** Published `53.75 × 52.25 × 30.00 in`; the tape reads 68 in along the seat and 72 in along the base." }
    - { image: "cratescanner_dash_table_measure.jpg", caption: "**Coffee table: an isolation bug.** Published `46.25 × 44.25 × 13.75 in`; the tape reads 34 in across the top, 13 in to the floor, 5 in of slab." }
  labels:
    - { image: "cratescanner_koala_mesh.png", caption: "**Koala, measured mesh.** Cleanly isolated: a live tape reading of 2.0 in across the arm and a published box of `6.00 × 5.75 × 5.00 in`. 25 frames captured, 7 merged." }
    - { image: "cratescanner_book_gen.png", caption: "**Book, cautionary example.** The generative mesh is the most polished output in the project, but its `32.75 × 34.00 in` bounds describe the *table beneath the book*, not the ~11 in book." }
    - { image: "cratescanner_koala_splat.png", caption: "**Koala, Gaussian splat.** Photorealistic and explicitly labeled `rough only`. Ray hit-testing accumulates transmittance and stops at half-opacity." }
---

<p class="pj-lede">The customer needs to answer one practical question: <em>how large should the shipping crate be?</em> A plausible but wrong answer costs more than no answer. So the system's most important output is not the dimension itself. It is the <strong>verdict on whether that dimension is reliable enough to quote</strong>. Everything below is organized around that distinction.</p>

{% include pj/steps.html items=page.steps %}

## The iPad is a camera, not a reconstructor {#ios-capture}

The Swift/ARKit client (CrateScanner: iPadOS / iOS 16+, LiDAR required; Swift, SwiftUI, ARKit, RealityKit, XcodeGen, TestFlight) should record reliable data, reject unreliable data, and hand reconstruction to a Linux GPU box. That sounds like a small job. It is not, because ARKit will happily hand you thousands of unusable frames and report success. Four problems shaped the app.

{% include pj/steps.html items=page.problems %}

### 1. A capture gate instead of a frame firehose

Rather than saving every frame, a `CaptureGate` scores the live feed and accepts keyframes only when the image is **sharp** and the device is **steady**. A `focusing → moving → ready` state machine controls the reticle colour and shutter availability, so the user cannot save a blurred frame.

Sharpness is gradient energy on the luma plane, read directly out of plane 0 of ARKit's YUV buffer and subsampled every 4th pixel so it runs on every frame:

$$
S = \frac{1}{N}\sum_{(u,v)}\Big[\big(Y_{u,v}-Y_{u+s,v}\big)^2 + \big(Y_{u,v}-Y_{u,v+s}\big)^2\Big]
$$

The threshold is **adaptive rather than absolute**. A running peak decays at 0.99 per frame, and a frame passes at ≥ 45% of that peak, subject to an absolute floor that rejects near-dark images. A fixed threshold fails when the user moves from a bright area into a shadow; the running peak adapts to the scene instead.

Steadiness gates on angular velocity of the view direction (≤ 0.6 rad/s, roughly where blur begins) and linear speed (≤ 0.25 m/s). In **Detail** mode, the gate also captures a 12 MP keyframe at each brief pause in a step-and-shoot orbit. A minimum interval of 1.0 s and a minimum pose change of 0.12 m or about 8° distribute keyframes across the orbit instead of concentrating them where the user pauses.

### 2. Guidance: a viewpoint dome and a stall detector

**`GuidedCapture`** replaces an unstructured orbit with a coverage checklist. It builds a dome of target viewpoints around the object from three elevation rings at 18°, 45°, and 68°, plus one top-down view. The azimuth count per ring is reduced by \\(\cos(\text{elev})\\):

$$
n(\text{elev}) = \max\!\big(6,\ \operatorname{round}(12\cos \text{elev})\big)
$$

That keeps targets roughly evenly spaced *on the sphere* rather than bunching toward the poles, yielding about 25–35 well-spread viewpoints. The app renders them in AR, points the user at the nearest unshot one, and auto-captures when they arrive within 0.30 m and 22° of the target pose.

**`MoveNudge`** handles the stationary-scan failure. It keeps a 2-second ring buffer of camera poses; if translation stays under 0.18 m *and* rotation under about 15° across the whole window while recording, the user is stuck. It then computes the **tangent to the orbit circle** about the object rather than a direction into or away from it:

$$
\hat{t} = \pm\,\frac{\hat{u}\times \mathbf{r}}{\lVert \hat{u}\times \mathbf{r}\rVert},
\qquad \mathbf{r} = \big(\mathbf{p}_{\text{cam}} - \mathbf{p}_{\text{pivot}}\big)\big|_{y=0}
$$

Two tangents exist. The system selects the one that matches the user's current direction, producing **one continuous lap** instead of a back-and-forth path. The hint stays fixed until the user has moved 0.30 m from where it appeared, so the AR arrow does not flip when the user merely shifts position.

### 3. Threading around ARKit's constraints

The session delegate runs on a dedicated `userInitiated` queue, never main: recording a frame means a JPEG encode plus a depth copy, and on the main queue that is a visible stutter that also caps the achievable frame rate.

Inside the callback, all access to `ARFrame` pixel buffers is **synchronous**. The expensive encoding and writing moves to a `utility` I/O queue only after the data has been copied. This resolves Problem 3: retaining an `ARFrame` inside an escaping `Task` starves the buffer pool and ARKit stops delivering frames. Shared frame and keyframe arrays are appended from the delegate queue and read by `finalize()` on the main actor, so access is protected by `NSLock`. The view model is `@MainActor` and publishes only value types to SwiftUI.

### 4. Storing the right amount of data

Colour defaults to **640 px wide** because fusion resizes it to the *depth* resolution. Higher colour resolution does **not** sharpen fused geometry and matters only for later texturing. The app therefore records native colour intrinsics and full sensor dimensions **in the manifest** even when the pixels are downscaled: a later texture pass keeps the calibration it needs, while the default upload uses roughly a tenth of the storage. Quality is user-selectable anyway (Fast 640 / Balanced 1280 / High 1920 / 4K), with the trade-off stated in plain language on the settings chip.

### Architecture: the geometry is deliberately ARKit-free

The decisions worth reasoning about are isolated from the framework that makes them hard to test.

| Layer | Files | Depends on |
|---|---|---|
| Pure geometry & policy | `GuidedCapture`, `MoveNudge`, `AABB`, `CapturedMesh` | `simd` / Foundation only |
| Value types & contracts | `MeasurementResult`, `ScanFeedback`, `CaptureSettings` | Foundation |
| Sensor & I/O | `CaptureGate`, `SessionExporter`, `PackageExporter`, `MeshExporter`, `GoogleDriveSync` | ARKit, CoreImage |
| AR orchestration | `ScanViewModel` (`ARSessionDelegate`) | ARKit + RealityKit |
| UI | `ScanView`, `ResultReviewView`, `IntroView`, `GhostBoxEntity` | SwiftUI |

`ScanViewModel` **is** the `ARSessionDelegate` rather than owning a separate coordinator, so all AR state lives in one place; SwiftUI only reads `@Published` properties and calls intent methods (`placeBox`, `fit`, `capture`). The "should we nudge the user, and which way?" question is answered by a struct with no ARKit import at all.

**Measurement on device.** The user places a ghost box in AR. `CapturedMesh.cropped(to:)` keeps only triangles whose *centroid* falls inside the box and compactly re-indexes them, which isolates the object from the floor. `AABB.fitting()` then returns the tight world-axis-aligned box over the surviving vertices. `MeasurementResult` converts to inches and applies the crating buffer **to each side**: a 40 in object with a 2 in buffer needs a 44 in crate, matching the client's construction method. The structure has been `Codable` from the beginning, so adding a backend POST is integration rather than redesign.

**Shipping details that mattered.**

- **Device gating up front.** `LiDARAvailability` checks `supportsSceneReconstruction(.mesh)` before anything else and routes unsupported devices to an explanation screen, instead of letting ARKit fail opaquely mid-scan.
- **XcodeGen.** The `.xcodeproj` is generated from `project.yml` and excluded from Git, so files from a teammate's pull request join the target automatically and `.pbxproj` merge conflicts never happen.
- **Drive sync scoped by owner, not folder name.** Resolving the shared folder by its *owner* means a teammate joins the shared folder rather than silently creating a private one that pools nothing. This was a live bug before it was a design rule.
- **Two export paths.** `PackageExporter` builds one AirDrop/scp-ready folder with `measurement.json`, `mesh.obj` in inches, and the full RGB-D `session/` in the exact schema the Linux pipeline expects, compressed through `NSFileCoordinator(.forUploading)`. Direct Drive upload and a worker POST endpoint are the automated alternatives.
- **Privacy manifest** (`PrivacyInfo.xcprivacy`) and TestFlight distribution configured for client testing.

## The deliverable is a page, not a file

Handing over a mesh hands over an unlabelled claim. The delivered artifact is a page where every reconstruction of one capture sits behind one switcher, the tape measure is live on the file that is allowed to be measured, and the printed size carries a verdict.

{% include pj/grid.html items=page.media.dashboards cols=2 %}

Both pages display **`not safe to quote`**. The badge matters more than the mesh because the two scans fail for entirely different reasons, and **neither failure is visible from the model alone**.

- **The sofa is a frame bug.** The published box is axis-aligned to the *anchor's* gravity frame, and this sofa sits 31° off it. A footprint whose tightest rectangle is 64.2 × 40.9 in gets published as `53.75 × 52.25`. The length is split across two axes, so neither published number is a side of the sofa, yet both values look plausible, which is why the error initially went unnoticed.
- **The coffee table is an isolation bug.** The depth slab keeps the floor the table stands on, so the fuse spans 44 × 46 in around a top that measures 34 in.

**What the page does about it.** It compares the published dimensions against the geometry shown on screen, **component by component in the pipeline's own axis order**. The first implementation sorted both dimension sets before comparing them, which concealed precisely the error the check was meant to catch: **11 of 14 RGB-D assets had shipped with length and width silently transposed.** A discrepancy greater than 2 in and 5% is reported as spread. A **factor-of-two** difference is not labeled as uncertainty, because no reconstruction method should double a dimension. A disputed value then loses its `± 1–2 in` label, and `quoteFor` refuses to assign a pricing tier. A human reviews the item instead of trusting a wrong number.

{% include pj/figure.html src="cratescanner_dash_table_splat.jpg" wide=true caption="**Five reconstructions from one capture.** Object · Full scene · Depth cloud · nvblox · Meshroom. Each tab identifies the displayed file and the model that produced it, so nothing is inferred from filenames." %}

## Every reconstruction carries one honest label

The five outputs disagree with one another. Rather than averaging or hiding those differences, the system designates exactly one measurement source and labels the rest in the interface. The rule is **enforced rather than recommended**: the tape measure is disabled for the final row.

| File | Measurable? | Why |
|---|---|---|
| `object_mesh.ply`: RGB-D fuse | ✅ **yes** | `dims.json` is computed from this file |
| `scene_gaussians.splat`: 3DGS | ⚠️ rough | a splat is a density cloud, not a surface |
| `nvblox_visual.glb`, `meshroom_visual.glb` | ⚠️ rough | real surfaces, but they carry the whole room |
| `asset_trellis.glb`: generative | ❌ **no** | geometry invented by a model |

Across the three demo assets, the generative mesh matches only the *single longest* published axis and differs by as much as **20%** on the others. It is still, visually, the most polished output in the repository.

{% include pj/grid.html items=page.media.labels cols=3 %}

## Key engineering decisions

**1. Metric by construction.** ARKit delivers depth in millimetres and a gravity-aligned pose, so the fused geometry starts at real scale with no reference card, known-size object, or user input. Everything is transformed into the anchor's gravity frame, so *height* follows gravity rather than the iPad's tilt. Photograph-only methods do not have this property.

**2. The tape measure is the deliverable, and it reports a defensible tolerance.** Handles are rescaled to a constant pixel size every frame so they stay usable at both 0.15 m and 8 m. Sizes are quantised to 0.25 in to match crate construction increments. But surface RMS is about 19 mm and repeat runs vary by 3.6–7.4 in, so the **stated tolerance is ±1–2 in**. A rounding increment must never be presented as measurement tolerance.

**3. Cost-aware orchestration.** GPU stages run strictly serially on one 16 GB card, and each stage skips when its output already exists, so a failed run resumes without restarting an 85-minute training. Replacing 3DGUT with **LichtFeld Studio** cut splat training to **about 20 minutes at equal quality**. With fewer than eight usable images, the pipeline declines to start SfM rather than spend GPU time on a solve unlikely to converge.

**4. Failure gates over best-effort output.** Frames merge only if ICP fitness is at least 0.2 and inlier RMSE clears a ceiling that *scales with working distance*: LiDAR noise grows with range, so a fixed ceiling rejected valid alignments. Missing optional tools (Meshroom, nvblox, TRELLIS) skip their stage instead of failing the run.

## Perception stack: detection, segmentation, tracking

The pipeline is a **`CAPTURE → IDENTIFY → RECONSTRUCT → DIGITALIZE → ORGANIZE`** chain where every arrow is a typed interface with something that runs today behind it and an adapter seam for a stronger model, across sensors (LiDAR depth, RGB, IMU-fused pose), 3D representations (point clouds, meshes, TSDF volumes, Gaussian fields), and the classic CV trio.

**Detection is open-vocabulary, because a fixed 80-class list cannot describe a warehouse.** The `Detector` interface takes class names as *text* (`["cardboard box", "sneaker", "coffee mug"]`) rather than indices into a frozen label set. Two backends ship: a zero-dependency heuristic detector that lets the core package run without an ML stack, and a **YOLO-World** adapter (`yolov8x-worldv2`, text-prompted, confidence-gated) for the live streaming path where interactive speed matters more than maximum accuracy. Backends use lazy imports so the dependency-free core stays lightweight.

**Segmentation has three layers, with implemented and planned capabilities kept distinct.**

| Layer | Status | Method |
|---|---|---|
| Point-cloud background removal | **runs today** | voxel-grid outlier rejection → RANSAC dominant plane → 26-connected voxel clustering |
| Depth-slab object isolation | **runs today** | σ-adaptive median-depth window + RANSAC plane strip, per frame |
| Learned instance masks | adapter seam | Grounding DINO box → SAM 2 mask, wired as an interface, weights not installed |

The shipping background remover is the piece I am happiest with: every threshold derives from the cloud's **2–98 percentile bounding-box diagonal**, so the same code handles a phone video of a shoebox and a full room sweep with no per-scene tuning. Plane inliers are stripped along with everything hanging *below* the recovered ground, and only clusters ≥ 25% of the largest survive. It refuses to run below 50 points, and it declines to remove a plane that *is* the scene.

This stage also holds the project's primary limitation: the RGB-D measurement path selects a **region by depth, not an object by identity**. That is why a book's bounding box captures the table beneath it. Learned masks applied during fusion through the Grounded SAM 2 interface are the appropriate fix; a post-processing crop cannot solve the underlying isolation problem.

**Three forms of tracking support the pipeline.**

- **Camera pose tracking.** ARKit VIO supplies a 6-DoF gravity-aligned pose per frame. Every downstream stage consumes it, and the fact that it is metric is what removes scale ambiguity from the whole pipeline.
- **Frame-to-frame registration.** ICP aligns each frame to the single sharpest *anchor* frame rather than to its predecessor, so registration error cannot accumulate through the sequence. Fitness and distance-scaled RMSE gates reject frames instead of merging invalid ones; on a 116-frame sofa sweep, 111 frames were rejected, deliberately.
- **Cross-modal track alignment.** Umeyama fits the SfM camera track onto the metric ARKit track, which carries scale from the depth sensor into a photogrammetry reconstruction that has none.
- Instance tracking across video frames (SAM 2 `track_id`, so one physical object stays one asset as the user walks around it) is designed into the `Detection` type and left as an adapter seam.

**Meshes and point clouds are tested, not assumed correct.** The pipeline includes back-projection to metric clouds, voxel downsampling, connected-component clustering, screened Poisson surface reconstruction, TSDF fusion through nvblox, photogrammetry meshing through Meshroom, AABB/OBB fitting, and mesh → URDF export for simulators. The verification layer matters most: `dims_crosscheck.py` recomputes the size implied by *every* exported file for one object and reports disagreements. It revealed that `object_mesh.glb` and `object_mesh.ply` differed by 7–12% for the same asset. A self-consistent but incorrect number can look valid, so independent representations must be compared.

## Selected math

**Depth back-projection.** Each depth pixel becomes a metric camera-frame point through the pinhole model, with depth arriving as 16-bit millimetres so that \\(z = 0.001\,D(u,v)\\) is metric with no scale factor anywhere:

$$
\mathbf{x}_c = \left[\frac{(u-c_x)\,z}{f_x},\ \frac{(v-c_y)\,z}{f_y},\ z\right]^{\top}
$$

**Registration gate.** The sharpest frame (Laplacian sharpness × valid-depth fraction) becomes the *anchor*, and every other frame aligns to it **directly**, so drift cannot chain. Point-to-point ICP finds the rigid \\(T \in SE(3)\\) minimising \\(E(T) = \sum_{(\mathbf p,\mathbf q)\in\mathcal K}\|T\mathbf p - \mathbf q\|^2\\), and a frame merges only if it clears a distance-scaled residual ceiling:

$$
\tau(d) = \mathrm{clip}\big(0.02\max(1,d),\ 0.02,\ 0.035\big)\ \text{m}
$$

This gate decides which data reaches every downstream stage. Seven of 25 frames survived for the koala capture. A screened Poisson solve \\(\Delta\chi = \nabla\cdot\vec V\\) at octree depth 8 then closes the surface.

**Mesh to crate size.** The gravity-frame **AABB** is published rather than the tighter oriented box, because a crate stands upright and height must be along gravity:

$$
\mathbf e = \max_i \mathbf x_i - \min_i \mathbf x_i,
\qquad
q(x) = 0.25\left\lfloor \frac{x}{0.25} + \frac12 \right\rfloor
$$

Gravity fixes only two of the three axes. Yaw follows the iPad orientation at the moment the anchor frame is established, and that single unconstrained degree of freedom is the sofa error.

**Metric scale for photogrammetry.** SfM recovers geometry only up to a similarity, so Umeyama fits its camera centres onto the metric ARKit centres in closed form from the SVD of the cross-covariance:

$$
\min_{s,R,\mathbf t}\ \sum_i \left\|sR\mathbf p_i + \mathbf t - \mathbf q_i\right\|^2
$$

The residual is kept deliberately: *a scale that did not converge is different from a scale you do not have*, and only the first one is dangerous.

## Known failure modes

Stated plainly, because the project's thesis is that an undefended number is worse than none.

- **Isolation is unsolved.** The depth slab cuts a *region*, not an object, so a table or floor patch lands inside the published box. This is the book's 33 in and the coffee table's 44 × 46 in around a 34 in top. Fixing it needs masks at fuse time, not a post-hoc crop.
- **The box is aligned to the anchor, not the object.** An object rotated within the gravity frame has its length distributed across two axes. For the sofa at 31°, the published length is 12 in too short and the width 11 in too long, yet both values look plausible. The correction must happen before quantisation, because the viewer can only report the disagreement.
- **Coverage, not frame count, decides quality.** Angular step between shots predicts the result: ~9° works, ~19° fails. A 116-frame sofa swept from one end at 0.6 m lost 111 frames to the ICP gate; the 26-frame *orbited* coffee table kept 10.
- **One object can export at two sizes.** `object_mesh.glb` and `object_mesh.ply` have disagreed by 7–12% on the same asset. `dims_crosscheck.py` catches this; no UI check can, because a self-consistent wrong number looks correct.

## What I built

| Component | Repo |
|---|---|
| iPad capture app (ARKit session, guided-capture dome, RGB-D + pose export, Drive sync); see [iOS capture](#ios-capture) | [`engin_170/CrateScanner/`](https://github.com/jayahn17/engin_170/tree/dashboard-main/CrateScanner) |
| Orchestrator + measurement (`recon3.py`, `rgbd_object_asset.py`, Umeyama scaling, dimension cross-check) | [`3dasset/assetpipe/`](https://github.com/jayahn17/3dasset/tree/main/assetpipe) |
| Orbit + measure web viewer and publisher (three.js, splat transmittance hit-testing) | [`engin_170/pipeline/demo/`](https://github.com/jayahn17/engin_170/tree/dashboard-main/pipeline) |

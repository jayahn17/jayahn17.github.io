---
layout: project
track: class
org: "ENGIN 170, UC Berkeley"
title: "CrateScanner → assetpipe: iPad LiDAR Scan to a Measurable 3D Asset"
excerpt: "A Swift/ARKit iPad app records metric RGB-D and pose; a GPU backend returns five reconstructions, publishes size only from the one that is safe to measure, and refuses to quote an unsupported size."
deck: "An iPad LiDAR capture app and a GPU backend turn one scan into five 3D reconstructions, publish size only from the metric RGB-D fuse, and refuse to quote a size the geometry does not support. A component-wise cross-check caught length and width silently transposed in 11 of 14 RGB-D assets."
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
  caption: "**The deliverable is a verdict, not a mesh.** The page publishes `53.75 × 52.25 × 30.00 in` for this sofa, and the badge says `not safe to quote`. The live tape measure on the same model shows the problem: it reads 68 in along the seat and 72 in along the base."
stats:
  - { value: "11 / 14", label: "RGB-D assets with silently transposed L/W, caught by cross-check" }
  - { value: "85 → 20 min", label: "splat training at equal quality" }
  - { value: "5", label: "reconstructions per capture, 1 measurable" }
steps:
  - { label: "Stage 1", title: "Capture", text: "SwiftUI/ARKit iPad app records RGB, 16-bit millimeter depth, and gravity-aligned pose; an AR arrow keeps the user orbiting. Uploads to a shared Drive folder." }
  - { label: "Stage 2", title: "Reconstruct", text: "Five reconstructions on one 16 GB GPU: RGB-D object fuse, full-scene 3DGS splat, depth cloud, nvblox TSDF, and Meshroom photogrammetry, plus an optional TRELLIS generative mesh. Stages run serially and are skippable and resumable." }
  - { label: "Stage 3", title: "Publish + adjudicate", text: "One web page per capture: every reconstruction behind a switcher, a live tape measure (disabled on the generative mesh), and a badge that can read `not safe to quote`." }
problems:
  - { label: "Problem 1", title: "ARKit frames are blurry", text: "The camera is tuned for tracking, not photography: Deep Fusion and Smart HDR are unavailable, and long indoor exposures blur, so continuous capture saves many unusable frames." }
  - { label: "Problem 2", title: "Users stand still", text: "The most common bad scan is not shaky but *stationary*. Without parallax there is no new geometry, and the far side of the object is never seen." }
  - { label: "Problem 3", title: "ARFrame is a trap", text: "Frames own pixel buffers from a small fixed pool. Hold one past the delegate callback and you starve ARKit until it stops delivering frames." }
  - { label: "Problem 4", title: "Resolution is a trap too", text: "Fusion resizes color to the 256 × 192 LiDAR depth map, so a 1920 × 1440 image stores 56× the pixels the fuser reads." }
media:
  dashboards:
    - { image: "cratescanner_dash_sofa_measure.jpg", caption: "**Sofa: a frame bug.** Published `53.75 × 52.25 × 30.00 in`; the tape reads 68 in along the seat and 72 in along the base." }
    - { image: "cratescanner_dash_table_measure.jpg", caption: "**Coffee table: an isolation bug.** Published `46.25 × 44.25 × 13.75 in`; the tape on the photo mesh reads 34 in across the top and 13 in to the floor." }
  labels:
    - { image: "cratescanner_koala_mesh.png", caption: "**Koala, measured mesh.** Cleanly isolated: a live tape reading of 2.0 in across the arm and a published box of `6.00 × 5.75 × 5.00 in`. Of 25 frames captured, 7 merged." }
    - { image: "cratescanner_book_gen.png", caption: "**Book, cautionary example.** The generative mesh is the most visually polished output in the project, but its `32.75 × 34.00 in` box comes from the RGB-D fuse and describes the *table beneath the book*, not the ≈ 11 in book." }
    - { image: "cratescanner_koala_splat.png", caption: "**Koala, Gaussian splat.** Explicitly labeled `rough only`: a splat is a density cloud, not a surface. Ray hit-testing accumulates transmittance and stops at half-opacity." }
---

<p class="pj-lede">Before building a shipping crate, the client needs one answer: <em>how large should the crate be?</em> A plausible wrong size costs more than none, so my iPad LiDAR app and GPU backend publish size only from the metric RGB-D fuse, with a <strong>verdict on whether it is safe to quote</strong>.</p>

{% include pj/steps.html items=page.steps %}

## Capture: the iPad records, the GPU reconstructs {#ios-capture}

I wrote CrateScanner (Swift, SwiftUI, ARKit, RealityKit; iPadOS/iOS 16+, LiDAR required) on top of E170_Client_Project. It records RGB-D and pose, rejects unusable frames, and hands reconstruction to the GPU box. That is harder than it sounds: ARKit will deliver thousands of them and report success.

{% include pj/steps.html items=page.problems %}

### Capture gate and coverage guidance

A `CaptureGate` saves a keyframe only when the image is sharp and the device is steady; a `focusing → moving → ready` state machine colors the reticle and locks the shutter until then. Sharpness is luma gradient energy from ARKit's YUV buffer, sampled every 4th pixel so it runs on every frame:

$$
S = \frac{1}{N}\sum_{(u,v)}\Big[\big(Y_{u,v}-Y_{u+s,v}\big)^2 + \big(Y_{u,v}-Y_{u,v+s}\big)^2\Big]
$$

The sum runs over \\(N\\) sampled pixels, and \\(s\\) is the pixel offset. A frame passes if \\(S \ge \max(0.45\,P,\ S_{\min})\\), where \\(P\\) is a running peak multiplied by 0.99 each frame (half-life ≈ 69 frames). The threshold follows the user from light into shadow, where a fixed one fails; the floor \\(S_{\min}\\) rejects near-dark frames.

**`GuidedCapture`** turns the orbit into a checklist: viewpoints on rings at 18°, 45°, and 68° elevation plus one top-down view, with the azimuth count scaled by \\(\cos(\text{elev})\\) so targets do not bunch toward the pole:

$$
n(\text{elev}) = \max\!\big(6,\ \operatorname{round}(12\cos \text{elev})\big)
$$

With these constants the dome has 11 + 8 + 6 + 1 = 26 targets; neighbors on the two lower rings are ≈ 31° apart on the sphere. The app draws them in AR, points to the nearest unshot one, and captures on arrival.

**`MoveNudge`** catches the stationary user: when a 2 s pose buffer shows almost no motion, it points along the tangent to the orbit circle, not toward or away from the object:

$$
\hat{t} = \pm\,\frac{\hat{u}\times \mathbf{r}}{\lVert \hat{u}\times \mathbf{r}\rVert},
\qquad \mathbf{r} = \big(\mathbf{p}_{\text{cam}} - \mathbf{p}_{\text{pivot}}\big)\big|_{y=0}
$$

Here \\(\hat u\\) is the gravity-up axis. It picks the tangent that matches the user's current direction, so the scan becomes one continuous lap, not a back-and-forth path.

**Detail** mode adds a 12 MP keyframe at each pause of a step-and-shoot orbit. Gate, dome, and stall thresholds:

| Check | Threshold |
|---|---|
| View-direction rate | ≤ 0.6 rad/s (≈ onset of motion blur) |
| Linear speed | ≤ 0.25 m/s |
| Keyframe spacing (Detail) | ≥ 1.0 s and ≥ 0.12 m or ≈ 8°, so keyframes spread around the orbit instead of piling up at pauses |
| Dome auto-capture | within 0.30 m and 22° of the target |
| Stall (`MoveNudge`) | < 0.18 m and ≲ 15° over 2 s |
| Arrow hold | until the user moves 0.30 m, so the arrow does not flip on small shifts |

### Threading and storage

The session delegate runs on a dedicated `userInitiated` queue, because a per-frame JPEG encode and depth copy would stutter the main thread and cap the frame rate. The callback copies `ARFrame` pixel buffers synchronously and hands only the copies to a `utility` I/O queue, since a retained `ARFrame` starves the buffer pool (Problem 3). `NSLock` guards the arrays shared with `finalize()` on the main actor.

Color defaults to 640 px wide: fusion reads color at depth resolution, so extra pixels help only later texturing. The manifest keeps native color intrinsics and full sensor dimensions for that pass, and the default upload needs roughly a tenth of the storage of a full-resolution one. Users can pick Fast 640 / Balanced 1280 / High 1920 / 4K, with the trade-off stated on the settings chip.

### Architecture and on-device measurement

The decisions worth testing never import ARKit: geometry and policy (`GuidedCapture`, `MoveNudge`, `AABB`, `CapturedMesh`) use only `simd` and Foundation. ARKit is confined to the sensor/I/O layer (`CaptureGate`, exporters, `GoogleDriveSync`) and `ScanViewModel`. That view model is itself the `ARSessionDelegate`, so AR state lives in one place; SwiftUI only reads its `@Published` value types and calls intent methods (`placeBox`, `fit`, `capture`).

**On-device measurement.** The user places a ghost box in AR; `CapturedMesh.cropped(to:)` keeps triangles whose centroid lies inside it, dropping the floor, and `AABB.fitting()` returns the world-axis-aligned box. `MeasurementResult` converts to inches and adds the crating buffer \\(b\\) to each side, \\(c = e + 2b\\) (40 in + 2 × 2 in = 44 in), matching the client's construction method. It has been `Codable` from the start, so a backend POST is integration, not redesign.

**Shipping details.** `LiDARAvailability` sends unsupported devices to an explanation screen before ARKit can fail mid-scan. XcodeGen generates the `.xcodeproj` from `project.yml` and keeps it out of Git, so a teammate's new files join the target with no `.pbxproj` merge conflicts. Drive sync resolves the shared folder by owner, not name, so a teammate cannot silently create a private folder that pools nothing (a live bug before it became a rule). `PackageExporter` writes one AirDrop/scp-ready folder (`measurement.json`, `mesh.obj` in inches, RGB-D `session/` in the backend's schema); Drive upload and a worker POST endpoint automate the transfer. TestFlight and a privacy manifest cover client testing.

## Reconstruction: metric scale from the sensor, gates at every merge

I wrote the orchestrator (`recon3.py`) and the measurement path (`rgbd_object_asset.py`), which run on one RTX 4080 (16 GB) under Ubuntu 22.04.

**Metric by construction.** ARKit depth arrives in 16-bit millimeters with a gravity-aligned pose, so geometry has real scale without a reference object or user input; photo-only methods lack this. With \\(z = 0.001\,D(u,v)\\) m, each pixel back-projects through the pinhole model:

$$
\mathbf{x}_c = \left[\frac{(u-c_x)\,z}{f_x},\ \frac{(v-c_y)\,z}{f_y},\ z\right]^{\top}
$$

Everything is expressed in the anchor's gravity frame, so height follows gravity, not the iPad's tilt.

**Registration gate.** The anchor is the frame with the highest Laplacian sharpness × valid-depth fraction, and every other frame registers directly to it, so error cannot chain. Point-to-point ICP finds the rigid \\(T \in SE(3)\\) minimizing \\(E(T) = \sum_{(\mathbf p,\mathbf q)\in\mathcal K}\\|T\mathbf p - \mathbf q\\|^2\\); a frame merges only if fitness ≥ 0.2 and inlier RMSE ≤ \\(\tau(d)\\), with \\(d\\) the working distance in meters:

$$
\tau(d) = \mathrm{clip}\big(0.02\max(1,d),\ 0.02,\ 0.035\big)\ \text{m}
$$

That is 20 mm out to \\(d = 1\\) m, rising to a 35 mm cap at 1.75 m, because LiDAR noise grows with range and a fixed ceiling rejected valid alignments. Screened Poisson (\\(\Delta\chi = \nabla\cdot\vec V\\), octree depth 8) closes the surface.

**Crate size.** The published box is the AABB in the anchor's gravity frame: a crate stands upright, so height must follow gravity, but the box takes its yaw from the iPad's heading when the anchor is set, not from the object:

$$
\mathbf e = \max_i \mathbf x_i - \min_i \mathbf x_i,
\qquad
q(x) = 0.25\left\lfloor \frac{x}{0.25} + \frac12 \right\rfloor
$$

\\(q\\) rounds each side, in inches, to the nearest 0.25 in (error ≤ 0.125 in). That free yaw is the sofa's frame bug below.

**Metric scale for photogrammetry.** SfM recovers geometry only up to a similarity transform, so Umeyama fits the SfM camera centers to the metric ARKit centers in closed form (SVD of the cross-covariance):

$$
\min_{s,R,\mathbf t}\ \sum_i \left\|sR\mathbf p_i + \mathbf t - \mathbf q_i\right\|^2
$$

The residual is kept: a scale that failed to converge is dangerous in a way that a missing scale is not.

**Orchestration.** GPU stages run in series and skip when their output exists, so a failed run resumes without repeating an 85 min splat-training run; replacing 3DGUT with LichtFeld Studio cut it to ≈ 20 min (≈ 4×) at equal quality. SfM does not start with fewer than 8 usable images, below which a solve is unlikely to converge, and a missing optional tool (Meshroom, nvblox, TRELLIS) skips its stage instead of failing the run. Meshes also export to URDF for simulators.

### Perception: detection, segmentation, tracking

The backend is a `CAPTURE → IDENTIFY → RECONSTRUCT → DIGITALIZE → ORGANIZE` chain; each arrow is a typed interface with a working implementation and an adapter seam for a stronger model.

**Detection is open-vocabulary**, because 80 fixed classes cannot describe a warehouse: `Detector` takes class names as text (`["cardboard box", "sneaker", "coffee mug"]`). A zero-dependency heuristic detector lets the core run without an ML stack; a lazily imported **YOLO-World** adapter (`yolov8x-worldv2`, text-prompted, confidence-gated) serves the live streaming path, where speed matters more than peak accuracy.

**Segmentation** has three layers; two run today.

| Layer | Status | Method |
|---|---|---|
| Point-cloud background removal | **runs today** | voxel-grid outlier rejection → RANSAC dominant plane → 26-connected voxel clustering |
| Depth-slab object isolation | **runs today** | σ-adaptive median-depth window + RANSAC plane strip, per frame |
| Learned instance masks | adapter seam | Grounding DINO box → SAM 2 mask, wired as an interface, weights not installed |

The background remover is the piece I am happiest with: every threshold scales with the cloud's 2nd–98th-percentile bounding-box diagonal, so one code path handles a phone video of a shoebox and a full-room sweep without tuning. It strips the plane and everything below it, keeps clusters ≥ 25% of the largest, refuses clouds under 50 points, and never removes a plane that *is* the scene.

**Tracking.** Instance tracking (SAM 2 `track_id`, so one object stays one asset as the user walks around it) is designed into the `Detection` type as a seam.

## Publishing: five reconstructions per capture

A bare mesh is an unlabeled claim, so each capture ships as one page (Stage 3).

{% include pj/figure.html src="cratescanner_dash_table_splat.jpg" wide=true caption="**Five reconstructions from one capture.** Object · Full scene · Depth cloud · nvblox · Meshroom. Each tab labels the file shown and the model that produced it, so provenance is never guessed from a filename." %}

## Labels: one measurable file, the rest flagged

The outputs disagree, so the page designates one measurement source, labels the rest, and enforces the rule: the tape measure is disabled on the generative mesh.

| File | Measurable? | Why |
|---|---|---|
| `object_mesh.ply`: RGB-D fuse | ✅ **yes** | `dims.json` is computed from this file |
| `scene_gaussians.splat`: 3DGS | ⚠️ rough | a splat is a density cloud, not a surface |
| `nvblox_visual.glb`, `meshroom_visual.glb` | ⚠️ rough | real surfaces, but they carry the whole room |
| `asset_trellis.glb`: generative (optional) | ❌ **no** | geometry invented by a model |

The TRELLIS mesh is scaled so its longest side matches the fuse; the other two axes are invented. Across the three demo assets it is off by up to 20% on those axes.

{% include pj/grid.html items=page.media.labels cols=3 %}

**Tolerance, not rounding.** Tape handles keep a constant pixel size, so they stay usable from 0.15 m to 8 m. Sizes round to 0.25 in for crate construction, but surface RMS is ≈ 19 mm (0.75 in) and repeat runs varied by 3.6–7.4 in, so the rounding step is never shown as tolerance; an undisputed size is labeled ±1–2 in instead.

## Validation: what the cross-checks caught

{% include pj/grid.html items=page.media.dashboards cols=2 %}

Both dashboards read `not safe to quote` for different reasons, and neither failure is visible in the model alone.

- **Sofa: a frame bug.** The box is axis-aligned to the anchor's gravity frame, not the sofa, which sits 31° off it in yaw. Neither published side (53.75, 52.25 in) is a side of the footprint's tightest rectangle (64.2 × 40.9 in); each is 10–13 in off, yet both looked plausible. Yaw alone would give a larger box: a filled 64.2 × 40.9 in footprint turned 31° spans ≈ 76 × 68 in, so the 5 frames that merged (of 116) also miss part of the sofa.
- **Coffee table: an isolation bug.** The depth slab keeps the floor under the table, so the published box spans 46.25 × 44.25 in around a top the tape measures at 34 in.

**Dimension cross-check.** The page compares published dimensions with the on-screen geometry component by component, in the pipeline's own axis order. My first version sorted both triples before comparing, which hid exactly the error the check exists to catch; in axis order, it found length and width silently transposed in **11 of 14** RGB-D assets (79%). A gap of more than 2 in and 5% is reported as spread; a factor of two is never called uncertainty, because no reconstruction should double a dimension. A disputed size is flagged `Printed size disputed` and `quoteFor` refuses a pricing tier, so a person reviews it.

**File cross-check.** `dims_crosscheck.py` recomputes the size implied by every exported file of one object. It found `object_mesh.glb` and `object_mesh.ply` 7–12% apart on the same asset, which no UI check can catch because each file is self-consistent.

**Coverage, not frame count, decides quality.** An angular step of ≈ 9° between shots works; ≈ 19° fails. Frames that passed the ICP gate:

| Capture | Motion | Captured | Merged |
|---|---|---|---|
| Koala | — | 25 | 7 (28%) |
| Coffee table | orbited | 26 | 10 (38%) |
| Sofa | swept from one end at 0.6 m | 116 | 5 (4%); 111 rejected by design |

## Limitations and next steps

- **Isolation.** The RGB-D path selects a depth region, not an object (book, coffee table above). Next: learned masks at fuse time through the Grounded SAM 2 interface; a post-hoc crop cannot recover object identity.
- **Yaw.** The box takes its heading from the anchor, not the object (sofa above). The fix belongs in the pipeline, before quantization; the viewer can only flag the disagreement.

## What I built

| Component | Repo |
|---|---|
| iPad capture app (ARKit session, guided-capture dome, RGB-D + pose export, Drive sync); see [iOS capture](#ios-capture) | [`engin_170/CrateScanner/`](https://github.com/jayahn17/engin_170/tree/dashboard-main/CrateScanner) |
| Orchestrator + measurement (`recon3.py`, `rgbd_object_asset.py`, Umeyama scaling, dimension cross-check) | [`3dasset/assetpipe/`](https://github.com/jayahn17/3dasset/tree/main/assetpipe) |
| Orbit + measure web viewer and publisher (three.js, splat transmittance hit-testing) | [`engin_170/pipeline/demo/`](https://github.com/jayahn17/engin_170/tree/dashboard-main/pipeline) |

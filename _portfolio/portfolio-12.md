---
title: "CrateScanner iOS App: ARKit LiDAR Capture in Swift"
excerpt: "A SwiftUI/ARKit iPad app that records metric RGB-D + pose, refuses to save blurry frames, and walks you around the object until coverage is actually sufficient."
collection: portfolio
category: class
date: 2026-08-02
role: "ENGIN 170: iOS Developer (solo on the app)"
duration: "July 2026 – August 2026"
tech_tags: ["Swift", "SwiftUI", "ARKit", "RealityKit", "LiDAR", "simd", "Concurrency", "TestFlight"]
featured: false
impact: "Sharpness + steadiness gating and stall-detection guidance turned an 'orbit and hope' capture into a checklist; default 640 px colour cut upload size ~10× with no loss to fused geometry"
share: false
teaser: "cratescanner_app_icon.png"
header:
  teaser: "cratescanner_app_icon.png"
---

<div style="display: flex; align-items: center; gap: 20px; margin: 8px 0 28px 0; flex-wrap: wrap;">
  <img src="/images/cratescanner_app_icon.png" alt="CrateScanner app icon" style="width: 108px; height: 108px; border-radius: 24px; box-shadow: 0 4px 14px rgba(0,0,0,0.18);">
  <div style="flex: 1; min-width: 260px;">
    <strong>CrateScanner</strong>: iPadOS / iOS 16+, LiDAR required.<br>
    Swift · SwiftUI · ARKit · RealityKit · XcodeGen · TestFlight<br>
    <a href="https://github.com/jayahn17/engin_170/tree/dashboard-main/CrateScanner">Source</a> ·
    <a href="{{ '/portfolio/portfolio-11/' | relative_url }}">The reconstruction backend it feeds →</a>
  </div>
</div>

## The app half of the pipeline

This is the **capture client** for the [CrateScanner → assetpipe pipeline]({{ '/portfolio/portfolio-11/' | relative_url }}). The design premise is that **the iPad is a camera, not a reconstructor**. It should record reliable data, reject unreliable data, and then transfer reconstruction work to a Linux GPU system.

That sounds like a small job. It is not, because ARKit will happily hand you thousands of unusable frames and report success.

---

### Four problems that shaped the app

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
      <div style="font-weight: 700; margin: 4px 0;">ARFrame is a trap</div>
      <div style="font-size: 0.9em; color: #555;">Frames own pixel buffers from a small fixed pool. Hold one past the delegate callback and you starve ARKit until it stops delivering frames entirely.</div>
    </div>
    <div style="background: #fff; border: 1px solid #e2e8f0; border-left: 4px solid #7c5cff; border-radius: 8px; padding: 16px;">
      <div style="font-size: 0.8em; font-weight: 700; color: #7c5cff; letter-spacing: 0.5px;">PROBLEM 4</div>
      <div style="font-weight: 700; margin: 4px 0;">Resolution is a trap too</div>
      <div style="font-size: 0.9em; color: #555;">Fusion resizes colour to the 256×192 depth resolution used by LiDAR iPads. Storing 1920×1440 images creates approximately 28 times more pixels than the fuser reads.</div>
    </div>
  </div>
</div>

---

### 1. A capture gate instead of a frame firehose

Rather than saving every frame, a `CaptureGate` scores the live feed and accepts keyframes only when the image is **sharp** and the device is **steady**. A `focusing → moving → ready` state machine controls the reticle colour and shutter availability, preventing the user from saving a blurred frame.

Sharpness is gradient energy on the luma plane, read directly out of plane 0 of ARKit's YUV buffer and subsampled every 4th pixel so it runs on every frame:

$$
S = \frac{1}{N}\sum_{(u,v)}\Big[\big(Y_{u,v}-Y_{u+s,v}\big)^2 + \big(Y_{u,v}-Y_{u,v+s}\big)^2\Big]
$$

The threshold is **adaptive rather than absolute**. A running peak decays at 0.99 per frame, and a frame passes at ≥ 45% of that peak, subject to an absolute floor that rejects near-dark images. A fixed threshold fails when the user moves from a bright area into a shadow. The running peak adapts to the scene instead.

Steadiness gates on angular velocity of the view direction (≤ 0.6 rad/s, approximately where blur begins) and linear speed (≤ 0.25 m/s). In **Detail** mode, the gate also captures a 12 MP keyframe at each brief pause in a step-and-shoot orbit. A minimum interval of 1.0 s and a minimum pose change of 0.12 m or approximately 8° distribute keyframes across the orbit instead of concentrating them where the user pauses.

### 2. Guidance: a viewpoint dome and a stall detector

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

### 3. Threading around ARKit's constraints

The session delegate runs on a dedicated `userInitiated` queue, never main: recording a frame means a JPEG encode plus a depth copy, and on the main queue that is a visible stutter that also caps the achievable frame rate.

Inside the callback, all access to `ARFrame` pixel buffers occurs **synchronously**. The expensive encoding and writing work is transferred to a `utility` I/O queue only after the data has been copied. This resolves Problem 3 because retaining an `ARFrame` inside an escaping `Task` starves the buffer pool and causes ARKit to stop delivering frames. Shared frame and keyframe arrays are appended from the delegate queue and read by `finalize()` on the main actor, so access is protected by `NSLock`. The view model is `@MainActor` and publishes only value types to SwiftUI.

### 4. Storing the right amount of data

Colour defaults to **640 px wide** because fusion resizes it to the *depth* resolution. Higher colour resolution does **not** sharpen fused geometry and matters only for later texturing. The app therefore records native colour intrinsics and full sensor dimensions **in the manifest** even when the pixels are downscaled. A later texture pass retains the required calibration data, while the default upload uses roughly one tenth of the storage.

Quality is user-selectable anyway (Fast 640 / Balanced 1280 / High 1920 / 4K), with the trade-off stated in plain language on the settings chip rather than buried.

---

### Architecture: the geometry is deliberately ARKit-free

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

### Shipping details that mattered

- **Device gating up front.** `LiDARAvailability` checks `supportsSceneReconstruction(.mesh)` before anything else and routes unsupported devices to an explanation screen, instead of letting ARKit fail opaquely mid-scan.
- **XcodeGen.** The `.xcodeproj` is generated from `project.yml` and excluded from Git, so files from a teammate's pull request join the target automatically. This avoids `.pbxproj` merge conflicts, which can consume significant time on a multi-person project.
- **Drive sync scoped by owner, not folder name.** Resolving the shared folder by its *owner* means a teammate joins the shared folder rather than silently creating a private one that pools nothing. This was a live bug before it was a design rule.
- **Two export paths.** `PackageExporter` builds one AirDrop/scp-ready folder containing `measurement.json`, `mesh.obj` in inches, and the full RGB-D `session/` in the exact schema expected by the Linux pipeline. The folder is compressed through `NSFileCoordinator(.forUploading)`. Direct Drive upload and a worker POST endpoint provide automated alternatives.
- **Privacy manifest** (`PrivacyInfo.xcprivacy`) and TestFlight distribution configured for client testing.

### Tooling

Swift 5.9, SwiftUI, ARKit (`ARWorldTrackingConfiguration`, `sceneDepth`, `ARMeshAnchor` scene reconstruction), RealityKit, simd, Combine, CoreImage, AVFoundation, `UserDefaults`/`@AppStorage`, XcodeGen, TestFlight. Target: iPadOS/iOS 16+ on LiDAR devices.

*Course project for ENGIN 170, UC Berkeley. Capture app builds on [E170_Client_Project](https://github.com/NathanJim17/E170_Client_Project); backend is [jayahn17/3dasset](https://github.com/jayahn17/3dasset).*

---
title: "ICON Lab - Role-Conditioned Manipulation: From One Arm to a Four-Arm LLM Coordinator"
excerpt: "Skill-decomposed diffusion policies that scale from a single arm to a four-arm, LLM-coordinated pick-and-place — reusing the same per-skill policies across every arm."
collection: portfolio
category: work
date: 2026-06-01
role: "Graduate Research Assistant"
duration: "May 2025 – Present"
tech_tags: ["Diffusion Policy", "robosuite", "MuJoCo", "PyTorch", "LLM", "Isaac Gym"]
featured: true
impact: "Per-skill policies ≥95%; four-arm end-to-end success ~0.70 → ~0.86 with LLM retry coordination"
share: false
teaser: "icon_front_video.png"
header:
  teaser: "icon_front_video.png"
---

## ICON Lab — Role-Conditioned Robot Manipulation

*Graduate research in Prof. Negar Mehr's Intelligent Control (ICON) Lab, UC Berkeley.*

### One-line story
Train a small set of **reusable per-skill policies on a single arm**, verify each one to **≥95%**, then reuse those exact policies — unchanged — first on **two arms**, then on **four arms** governed by an **LLM coordinator** that decides who does what, in what order, and how hard to retry.

The central idea is *role-conditioned control*: instead of training a monolithic multi-arm policy, I decompose a pick-and-place task into three coarse skills — **pick / place / retreat** — train one diffusion policy per skill, and let a higher-level layer compose them across an arbitrary number of arms.

<div style="margin: 28px 0; padding: 24px; background: #f5f7fa; border: 1px solid #e2e8f0; border-radius: 10px;">
  <div style="display: grid; grid-template-columns: repeat(auto-fit, minmax(200px, 1fr)); gap: 16px; align-items: stretch;">
    <div style="background: #fff; border: 1px solid #e2e8f0; border-left: 4px solid #4a9eff; border-radius: 8px; padding: 16px;">
      <div style="font-size: 0.8em; font-weight: 700; color: #4a9eff; letter-spacing: 0.5px;">STAGE 1</div>
      <div style="font-weight: 700; margin: 4px 0;">Unimanual</div>
      <div style="font-size: 0.9em; color: #555;">One Kinova3 arm. Skill-decomposed DiT policies (pick / place / retreat), each verified ≥95%.</div>
    </div>
    <div style="background: #fff; border: 1px solid #e2e8f0; border-left: 4px solid #4a9eff; border-radius: 8px; padding: 16px;">
      <div style="font-size: 0.8em; font-weight: 700; color: #4a9eff; letter-spacing: 0.5px;">STAGE 2</div>
      <div style="font-weight: 700; margin: 4px 0;">Bimanual</div>
      <div style="font-size: 0.9em; color: #555;">Two arms across a shared bin. Same policies, transferred through a per-arm rigid-frame correction + a skill router.</div>
    </div>
    <div style="background: #fff; border: 1px solid #e2e8f0; border-left: 4px solid #4a9eff; border-radius: 8px; padding: 16px;">
      <div style="font-size: 0.8em; font-weight: 700; color: #4a9eff; letter-spacing: 0.5px;">STAGE 3</div>
      <div style="font-weight: 700; margin: 4px 0;">Four-arm + LLM coordinator</div>
      <div style="font-size: 0.9em; color: #555;">Four arms, shared object types, one LLM planner deciding assignment, order, and retry budgets.</div>
    </div>
  </div>
</div>

---

### Stage 1 — Unimanual skill policies

**Goal:** learn reliable low-level manipulation that can later be reused, not re-trained, on more arms.

- **Skill decomposition.** A scripted expert produces a 14-waypoint trajectory, which I group into six sub-skills and merge into the **three coarse policies actually trained** — `pick`, `place`, `retreat`. Keeping the far-reach *inside* `pick` means every higher layer only ever sees one of three skills.
- **Diffusion policy (DiT).** Each skill is a ~48M-parameter Diffusion Transformer trained on a 28-D state / 10-D action schema with a 13-step action chunk, in **robosuite / MuJoCo**.
- **The object-relative fix.** A vanilla `pick` policy regresses to the mean and under-reaches at far object positions (~83% success). Predicting the end-effector target in the **object's frame** makes the target translation-invariant, lifting `pick` to **~97–100%**.
- **Order invariance.** Every skill is trained on both task orderings (bread→milk and milk→bread) so a policy behaves correctly whether it is handling the first or second object.

**Verified results** (100 in-distribution seeds per ordering): `pick` 95–98%, `place` 100%, `retreat` 100% — each skill cleared the **≥95%** bar before any multi-arm work began.

---

### Stage 2 — Bimanual transfer (the frame problem)

**Goal:** reuse the *identical* single-arm policies on two arms facing each other across a shared central bin.

- **The handedness catch.** Measured in each arm's own base frame, one arm reproduces the training distribution natively; the other is a **y-reflection** of it. A naive re-use sends that arm to the wrong side.
- **Per-arm rigid-frame correction.** I wrap the mirrored arm with `M = diag(1, −1, 1)` applied to both observations and actions (`p → Mp`, `R → MRM`). The conjugation keeps rotations proper (det +1), so a top-down grasp stays valid — no policy retraining.
- **Skill router.** A per-arm state machine sequences `pick → place → retreat`, switching on measured events (e.g., object lifted), and applies the object-relative de-transform per arm.
- **Shared-space safety.** Pipelined source/target **zone locks** stagger the two arms so they never contend for the shared center at the same instant.

---

### Stage 3 — Four-arm LLM coordinator

**Goal:** scale to four arms and two of each object type, and let a language-model planner own the high-level decisions.

- **Policy sharing by type.** All four arms share exactly **two skill sets** (one per object type). A per-episode 4×4 minimum-distance assignment binds each object instance to an arm.
- **One reference frame for all arms.** Each arm's observations are transformed into a common **virtual reference frame**, so every arm sees a bit-identical policy input (verified to ~5e-16 m) and the same trained policies apply unchanged.
- **The coordinator.** A pluggable planner decides **who picks what, in what order, and with what retry budget**, from reachability checks and per-skill success priors. It runs as **Anthropic Claude** (structured-JSON plans) when an API key is present, and falls back to a **deterministic planner** with the same interface for fully offline runs.
- **Cadence.** Plan once at episode start; **re-plan only on skill failure or a phase boundary** — decoupling slow, high-level reasoning from fast per-step control.
- **Why retry is the lever.** Whole-task success compounds multiplicatively across stages and arms, so recovering failed picks raises end-to-end success far more than polishing any single policy — roughly **0.70 → ~0.86** at current per-skill rates.

---

### Related work — multi-agent quadruped RL

Alongside the manipulation stack, I ported a **multi-agent quadruped RL** environment from **Unitree Go1 to Go2** in **Isaac Gym**, preserving task logic and evaluation conventions across the hardware change so results stayed comparable.

### Tooling
robosuite, MuJoCo, PyTorch, Diffusion Transformer (DiT) diffusion policy, Anthropic Claude API, Isaac Gym.

### Demonstrations

<div style="display: flex; justify-content: center; margin: 20px 0;">
  <video width="100%" controls playsinline style="max-width: 800px; border-radius: 8px; box-shadow: 0 4px 12px rgba(0,0,0,0.1);">
    <source src="/images/icon_front_video.mp4" type="video/mp4">
    <source src="/images/icon_front_video.mov" type="video/quicktime">
    Your browser does not support the video tag.
  </video>
</div>
<p style="margin-top: 8px; font-size: 0.9em; color: #666; text-align: center;">Skill-decomposed manipulation in robosuite / MuJoCo.</p>

<div style="display: flex; justify-content: center; margin: 20px 0;">
  <video width="100%" controls playsinline style="max-width: 800px; border-radius: 8px; box-shadow: 0 4px 12px rgba(0,0,0,0.1);">
    <source src="/images/icon_bimanual_demo.mp4" type="video/mp4">
    <source src="/images/icon_bimanual_demo.mov" type="video/quicktime">
    Your browser does not support the video tag.
  </video>
</div>
<p style="margin-top: 8px; font-size: 0.9em; color: #666; text-align: center;">Stage 2: two arms running the same per-skill policies via the skill router.</p>

<div style="display: flex; justify-content: center; margin: 20px 0;">
  <video width="100%" controls playsinline style="max-width: 800px; border-radius: 8px; box-shadow: 0 4px 12px rgba(0,0,0,0.1);">
    <source src="/images/icon_fourarm.mp4" type="video/mp4">
    Your browser does not support the video tag.
  </video>
</div>
<p style="margin-top: 8px; font-size: 0.9em; color: #666; text-align: center;">Stage 3: four-arm pick-and-place with LLM coordinator assigning objects, order, and retry budgets.</p>

<div style="display: flex; justify-content: center; margin: 20px 0;">
  <video width="100%" controls playsinline style="max-width: 800px; border-radius: 8px; box-shadow: 0 4px 12px rgba(0,0,0,0.1);">
    <source src="/images/icon_handover.mp4" type="video/mp4">
    <source src="/images/icon_handover.mov" type="video/quicktime">
    Your browser does not support the video tag.
  </video>
</div>
<p style="margin-top: 8px; font-size: 0.9em; color: #666; text-align: center;">Bimanual handover using the same per-skill policies.</p>

<div style="display: flex; justify-content: center; margin: 20px 0;">
  <video width="100%" controls playsinline style="max-width: 800px; border-radius: 8px; box-shadow: 0 4px 12px rgba(0,0,0,0.1);">
    <source src="/images/icon_can_pickandplace.mp4" type="video/mp4">
    <source src="/images/icon_can_pickandplace.mov" type="video/quicktime">
    Your browser does not support the video tag.
  </video>
</div>
<p style="margin-top: 8px; font-size: 0.9em; color: #666; text-align: center;">Pick-and-place with shared object-type policy sets.</p>

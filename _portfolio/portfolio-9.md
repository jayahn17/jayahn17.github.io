---
layout: project
track: research
org: "ICON Lab, UC Berkeley"
title: "Role-Conditioned Manipulation: One Arm, Two Arms, Four Arms and an LLM Coordinator"
excerpt: "Skill-decomposed diffusion policies that scale from a single arm to a four-arm pick-and-place system coordinated by an LLM, while reusing the same per-skill policies across every arm."
deck: "Train three per-skill diffusion policies once on a single arm, verify each above 95%, then reuse them unchanged on two arms and on four arms whose assignment, ordering, and retries are decided by a language-model planner."
collection: portfolio
category: work
date: 2026-06-01
role: "Graduate Research Assistant"
duration: "May 2025 – Present"
team: "Prof. Negar Mehr's Intelligent Control (ICON) Lab"
tech_tags: ["Diffusion Policy", "robosuite", "MuJoCo", "PyTorch", "LLM", "Isaac Gym"]
tools: "robosuite, MuJoCo, PyTorch, Diffusion Transformer (DiT) diffusion policy, Anthropic Claude API, Isaac Gym"
featured: true
impact: "Per-skill policies ≥95%; four-arm end-to-end success ~0.70 → ~0.86 with LLM retry coordination"
share: false
teaser: "icon_fourarm_poster.png"
header:
  teaser: "icon_fourarm_poster.png"
card_video: true
hero:
  video: "icon_fourarm.mp4"
  poster: "posters/icon_fourarm.jpg"
  autoplay: true
  narrow: true
  caption: "**Stage 3.** Four Kinova3 arms run the same per-skill policies while an LLM coordinator assigns objects, fixes execution order, and sets retry budgets."
stats:
  - { value: "≥ 95%", label: "per-skill success, single arm" }
  - { value: "3", label: "policies reused on every arm" }
  - { value: "0.70 → 0.86", label: "est. four-arm success with retries" }
  - { value: "~5e-16 m", label: "cross-arm input mismatch" }
steps:
  - { label: "Stage 1", title: "Unimanual", text: "One Kinova3 arm. Skill-decomposed DiT policies (pick / place / retreat), each verified ≥ 95%." }
  - { label: "Stage 2", title: "Bimanual", text: "Two arms across a shared bin. Same policies, transferred through a per-arm rigid-frame correction and a skill router." }
  - { label: "Stage 3", title: "Four arms + LLM coordinator", text: "Four arms, shared object types, one LLM planner deciding assignment, order, and retry budgets." }
media:
  stage1:
    - { video: "icon_front_video.mp4", poster: "icon_front_video.png", autoplay: true, caption: "**Stage 1.** Skill-decomposed unimanual pick, place, and retreat in robosuite / MuJoCo." }
    - { video: "icon_can_pickandplace.mp4", poster: "posters/icon_can_pickandplace.jpg", autoplay: true, caption: "**Shared policy sets.** Pick-and-place with one skill set per object type." }
  stage2:
    - { video: "icon_bimanual_demo.mp4", poster: "posters/icon_bimanual_demo.jpg", autoplay: true, caption: "**Stage 2.** Two arms running the identical per-skill policies through the skill router and zone locks." }
    - { video: "icon_handover.mp4", poster: "posters/icon_handover.jpg", autoplay: true, caption: "**Bimanual handover** using the same three policies, with no retraining." }
---

<p class="pj-lede">Multi-arm manipulation is usually approached by training one monolithic policy for the whole system. This project takes the opposite route. A pick-and-place task is decomposed into three coarse skills, <strong>pick</strong>, <strong>place</strong>, and <strong>retreat</strong>, one diffusion policy is trained per skill on a single arm, and a higher-level layer composes those policies across any number of arms. The central idea is <em>role-conditioned control</em>: the arm's role in the task, not a bespoke policy, is what changes as the system grows.</p>

{% include pj/steps.html items=page.steps %}

## Stage 1: Learn skills once, on one arm

The goal of the first stage is reliable low-level manipulation that can later be reused rather than retrained.

- **Skill decomposition.** A scripted expert produces a 14-waypoint trajectory. I group it into six sub-skills and merge them into the three coarse policies that are actually trained: `pick`, `place`, and `retreat`. Keeping the far reach inside `pick` means every higher layer only ever sees one of three skills.
- **Diffusion policy (DiT).** Each skill is a roughly 48M-parameter Diffusion Transformer trained on a 28-D state / 10-D action schema with a 13-step action chunk, in robosuite / MuJoCo.
- **The object-relative fix.** A vanilla `pick` policy regresses to the mean and under-reaches at far object positions, at about 83% success. Predicting the end-effector target in the object's frame makes the target translation-invariant and lifts `pick` to roughly 97–100%.
- **Order invariance.** Every skill is trained on both task orderings (bread→milk and milk→bread) so a policy behaves correctly whether it is handling the first or second object.

Verified over 100 in-distribution seeds per ordering: `pick` 95–98%, `place` 100%, `retreat` 100%. Each skill cleared the 95% bar before any multi-arm work began.

{% include pj/grid.html items=page.media.stage1 cols=2 %}

## Stage 2: Two arms, and the frame problem

The second stage reuses the identical single-arm policies on two arms facing each other across a shared central bin. The catch is handedness. Measured in each arm's own base frame, one arm reproduces the training distribution natively; the other sees a y-reflection of it, and a naive reuse sends that arm to the wrong side.

- **Per-arm rigid-frame correction.** The mirrored arm is wrapped with `M = diag(1, −1, 1)` applied to both observations and actions (`p → Mp`, `R → MRM`). The conjugation keeps rotations proper (det +1), which preserves a valid top-down grasp without retraining.
- **Skill router.** A per-arm state machine sequences `pick → place → retreat`, switching on measured events such as "object lifted", and applies the object-relative de-transform per arm.
- **Shared-space safety.** Pipelined source and target zone locks stagger the two arms so they never contend for the shared center at the same instant.

{% include pj/grid.html items=page.media.stage2 cols=2 %}

## Stage 3: Four arms and a language-model planner

The final stage scales to four arms with two instances of each object type, and hands the high-level decisions to a planner.

- **Policy sharing by type.** All four arms share exactly two skill sets, one per object type. A per-episode 4×4 minimum-distance assignment binds each object instance to an arm.
- **One reference frame for all arms.** Each arm's observations are transformed into a common virtual reference frame, so every arm sees a bit-identical policy input (verified to about 5e-16 m) and the same trained policies apply unchanged.
- **The coordinator.** A pluggable planner decides who picks what, in what order, and with what retry budget, from reachability checks and per-skill success priors. It runs as Anthropic Claude with structured-JSON plans when an API key is present, and falls back to a deterministic planner with the same interface for fully offline runs.
- **Cadence.** The system plans once at episode start and re-plans only after a skill failure or phase boundary, which separates slow high-level reasoning from fast per-step control.

{% include pj/video.html src="icon_fourarm.mp4" poster="posters/icon_fourarm.jpg" autoplay=true narrow=true caption="**Why retry is the lever.** Whole-task success compounds multiplicatively across stages and arms, so recovering failed picks raises end-to-end success far more than polishing any single policy. At current per-skill rates, retries lift estimated success from roughly 0.70 to about 0.86." %}

## What the numbers say

| Stage | What is shared | Verified result |
|---|---|---|
| 1 · one arm | three skill policies | `pick` 95–98%, `place` 100%, `retreat` 100% (100 seeds per ordering) |
| 2 · two arms | the same policies + frame correction | valid top-down grasps on the mirrored arm with no retraining |
| 3 · four arms | two skill sets across four arms + LLM planner | estimated end-to-end success ~0.70 → ~0.86 with retry budgets |

## Alongside: multi-agent quadruped RL

In parallel with the manipulation stack, I ported a multi-agent quadruped RL environment from Unitree Go1 to Go2 in Isaac Gym, preserving task logic and evaluation conventions across the hardware change so results stayed comparable.

---
layout: project
track: research
org: "ICON Lab, UC Berkeley"
title: "Role-Conditioned Manipulation: One Arm, Two Arms, Four Arms, and an LLM Coordinator"
excerpt: "Skill-decomposed diffusion policies, each ≥ 95% successful on one arm, reused unchanged on two arms and on a four-arm pick-and-place system coordinated by an LLM."
deck: "Three diffusion-policy skills (pick, place, retreat), each verified at ≥ 95% success on one arm, run unchanged on two arms and on four arms, where an LLM coordinator sets assignment, order, and retry budgets. Retries raise estimated four-arm success from 0.70 to 0.86."
collection: portfolio
category: work
date: 2026-06-01
role: "Graduate Research Assistant"
duration: "May 2025 – Present"
team: "Prof. Negar Mehr's Intelligent Control (ICON) Lab"
tech_tags: ["Diffusion Policy", "robosuite", "MuJoCo", "PyTorch", "LLM", "Isaac Gym"]
tools: "robosuite, MuJoCo, PyTorch, Diffusion Transformer (DiT) diffusion policy, Anthropic Claude API, Isaac Gym"
featured: true
impact: "Per-skill policies ≥ 95%; estimated four-arm end-to-end success 0.70 → 0.86 with LLM-set retry budgets"
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
  - { value: "≥ 95%", label: "per-skill success, one arm" }
  - { value: "~83% → ~97–100%", label: "pick success, before → after object-frame targets" }
  - { value: "0.70 → 0.86", label: "est. four-arm success with retries" }
steps:
  - { label: "Stage 1", title: "Unimanual", text: "One Kinova3 arm. Skill-decomposed DiT policies (pick / place / retreat), each verified ≥ 95%." }
  - { label: "Stage 2", title: "Bimanual", text: "Two arms across a shared bin. Same policies, transferred through a per-arm mirror transform and a skill router." }
  - { label: "Stage 3", title: "Four arms + LLM coordinator", text: "Four arms, two skill sets (one per object type), one LLM coordinator deciding assignment, order, and retry budgets." }
media:
  stage1:
    - { video: "icon_front_video.mp4", poster: "icon_front_video.png", autoplay: true, caption: "**Stage 1.** Skill-decomposed unimanual pick, place, and retreat in robosuite / MuJoCo." }
    - { video: "icon_can_pickandplace.mp4", poster: "posters/icon_can_pickandplace.jpg", autoplay: true, caption: "**Can pick-and-place.** A single arm moves the red can into its bin using one of the per-object-type skill sets." }
  stage2:
    - { video: "icon_bimanual_demo.mp4", poster: "posters/icon_bimanual_demo.jpg", autoplay: true, caption: "**Stage 2.** Two arms run the same per-skill policies through the skill router and zone locks." }
    - { video: "icon_handover.mp4", poster: "posters/icon_handover.jpg", autoplay: true, caption: "**Bimanual handover.** The left arm passes a hammer to the right arm; one policy, trained from a single demonstration trajectory, runs the handover." }
---

<p class="pj-lede">Multi-arm manipulation is usually approached with one monolithic policy for the whole system, which must be retrained as the system grows. Instead, I split pick-and-place into three skills (<strong>pick</strong>, <strong>place</strong>, <strong>retreat</strong>), trained one Diffusion Transformer (DiT) policy per skill on one Kinova3 arm to ≥ 95% success, and reused the policies unchanged on two and four arms; only each arm's frame and role change (<em>role-conditioned control</em>). On four arms, LLM-set retry budgets raise <em>estimated</em> end-to-end success from 0.70 to 0.86.</p>

{% include pj/steps.html items=page.steps %}

## Stage 1: One arm, three skills

A scripted expert's 14 waypoints are grouped into six sub-skills and merged into three policies; keeping the far reach inside `pick` leaves higher layers only three skills to sequence. Each object type gets its own three-policy skill set, trained on both orderings (bread → milk, milk → bread) so it works whether its object comes first or second.

| Per-skill DiT | Value |
|---|---|
| Parameters | ≈ 48 million |
| State / action | 28-D / 10-D |
| Action chunk | 13 steps |

**Object-frame targets.** A vanilla `pick` policy regressed to the mean and under-reached at far object positions (~83% success). I instead predicted the end-effector target in the object's frame, \\({}^{o}\mathbf{p}^{\ast}=\mathbf{T}^{-1}\mathbf{p}^{\ast}\\) with \\(\mathbf{T}\\) the object pose; the target became translation-invariant, and `pick` rose to ~97–100% (95–98% in the 100-seed-per-ordering evaluation below). Every skill cleared 95% before any multi-arm work.

{% include pj/grid.html items=page.media.stage1 cols=2 %}

## Stage 2: Two arms and a mirror

The arms face each other across a shared bin. In each arm's base frame, one arm sees the training distribution and the other its y-reflection, so naive reuse sends the second arm to the wrong side. I reflect that arm's observations and actions:

$$
M = \mathrm{diag}(1,-1,1),\qquad \mathbf{p}\mapsto M\mathbf{p},\qquad R\mapsto MRM.
$$

Conjugating by \\(M\\) keeps rotations proper, \\(\det(MRM)=\det(M)^2\det R=+1\\), so the top-down grasp stays valid without retraining. A per-arm skill router sequences `pick → place → retreat`, switching on measured events (e.g., object lifted), and undoes the object-frame transform; pipelined source/target zone locks keep both arms from entering the shared center at once.

{% include pj/grid.html items=page.media.stage2 cols=2 %}

## Stage 3: Four arms and an LLM coordinator

- **Sharing by type.** The arms share two skill sets, one per object type (two objects of each type); a per-episode 4 × 4 minimum-distance assignment binds each object to an arm.
- **Common frame.** Observations map into one virtual reference frame, so every arm's policy input is identical up to floating-point round-off (≈ 5 × 10⁻¹⁶ m) and the policies apply unchanged.
- **Coordinator.** A pluggable planner sets assignment, order, and retry budgets from reachability checks and per-skill success priors. It runs on Anthropic Claude (structured-JSON plans) when an API key is present and falls back offline to a deterministic planner with the same interface.
- **Cadence.** It plans once at episode start and re-plans only after a skill failure or phase boundary, separating slow reasoning from fast per-step control.

Task success probability is the product of per-skill success probabilities \\(p_k\\) over every skill of every arm; with independent attempts, a retry budget \\(r_k\\) raises each factor:

$$
P_{\text{task}}=\prod_{k} p_k \quad\longrightarrow\quad \prod_{k}\left[1-(1-p_k)^{r_k+1}\right].
$$

Applied to current per-skill rates, retries lift the estimated four-arm success from 0.70 to 0.86; this is an estimate, not a measured rate.

{% include pj/video.html src="icon_fourarm.mp4" poster="posters/icon_fourarm.jpg" autoplay=true narrow=true caption="**Why retry is the lever.** In this run all four objects are picked and placed on the first attempt. Because task success compounds across skills and arms, recovering failed picks raises end-to-end success more than polishing any single policy." %}

## Results

| Stage | Result | Basis |
|---|---|---|
| 1 | `pick` 95–98%, `place` 100%, `retreat` 100% (100 in-distribution seeds per ordering) | measured |
| 2 | mirrored arm keeps a valid top-down grasp, no retraining | verified (no rate reported) |
| 3 | cross-arm input mismatch ≈ 5 × 10⁻¹⁶ m | measured |
| 3 | end-to-end success 0.70 → 0.86 with retries | estimate |

## Alongside: multi-agent quadruped RL

I ported a multi-agent quadruped RL environment from Unitree Go1 to Go2 in Isaac Gym, preserving task logic and evaluation conventions so results stayed comparable.

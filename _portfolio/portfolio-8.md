---
layout: project
track: class
org: "ME231, UC Berkeley"
title: "Model Predictive Control for a Truck-Trailer with Moving Obstacles"
excerpt: "Nonlinear MPC in Python (Pyomo + IPOPT) that drives a kinematic truck-trailer forward and in reverse past up to three moving obstacles, bringing the hitch within 0.5 m of the goal in 4 of 5 logged runs."
deck: "Our six-person ME231 team built a nonlinear MPC in Python (Pyomo + IPOPT) that predicts each obstacle's motion at constant velocity and holds the hitch angle within ±90°. In simulation it reached the 0.5 m goal tolerance in 4 of 5 logged runs: all 3 forward and 1 of 2 reverse, the latter past three moving obstacles."
collection: portfolio
category: class
date: 2024-12-01
role: "ME231: Advanced Controls"
duration: "Fall 2024"
team: "Eric Chuang, Evan Grealish, Lennart Peus, Seongjae Ahn, Toh Wayne, Yuwei Chang (instructor: Francesco Borrelli)"
tech_tags: ["MPC", "Python", "Pyomo", "IPOPT", "Obstacle Avoidance"]
tools: "Python, Pyomo, IPOPT (nonlinear programming), NumPy, Matplotlib, Google Colab"
share: false
teaser: "me231_result_1.png"
header:
  teaser: "me231_result_1.png"
card_video: true
hero:
  video: "me231_result_1.mp4"
  poster: "me231_result_1.png"
  autoplay: true
  caption: "**Runs 2 and 3 (forward).** Side by side, the MPC steers the truck-trailer past one crossing obstacle (left) and three (right). The clip ends with the team's comparison of two other MPC runs."
stats:
  - { value: "4 / 5", label: "logged runs within 0.5 m of the goal" }
  - { value: "3", label: "moving obstacles, forward and reverse" }
  - { value: "±90°", label: "hitch-angle limit against jackknife" }
---

<p class="pj-lede">In reverse, a truck-trailer's hitch angle diverges toward jackknife. Our nonlinear MPC, with jackknife and moving-obstacle constraints, brought the hitch within 0.5 m of the goal in 4 of 5 logged runs (3 of 3 forward, 1 of 2 reverse).</p>

## Model and controller

Our third model, after geometric and velocity-input ones, is a bicycle model driven by acceleration \\(a\\) and steering rate \\(\dot\phi\\), so speed and steering change smoothly. Its state \\(q = [x, y, \theta_t, \theta_l, v, \phi]^\top\\) is hitch position, truck and trailer headings, speed, and steering angle:

$$
\dot x = v\cos\theta_t,\qquad
\dot y = v\sin\theta_t,\qquad
\dot\theta_t = \frac{v}{L}\tan\phi,\qquad
\dot\theta_l = \frac{v}{d}\sin(\theta_t-\theta_l),\qquad
\dot v = a.
$$

IPOPT minimizes the terminal error in \\((x, y, \theta_t, \theta_l)\\) to the target \\(\bar q\\) plus input effort. At every horizon step \\(k\\), only the hitch is kept clear of each obstacle \\(o\\) (position \\(p_o = (x_o, y_o)\\), constant velocity \\(v_o\\), radius \\(r_o\\)); \\(r_{\text{truck}}\\) approximates the truck-trailer footprint and \\(m\\) is a margin:

$$
J = \sum_{i=1}^{4}\big(q_i(N) - \bar q_i\big)^2 + w\sum_{k=0}^{N-1}\big(a_k^2 + \dot\phi_k^2\big),
$$

$$
(x_k-x_{o,k})^2 + (y_k-y_{o,k})^2 \ge r_{\text{safe}}^2,
$$

$$
p_{o,k} = p_{o,0} + k\,\Delta t\,v_o,\qquad
r_{\text{safe}} = r_o + r_{\text{truck}} + m.
$$

| Parameter | Forward | Reverse |
|---|---|---|
| Wheelbase \\(L\\), hitch to trailer axle \\(d\\) | 2.0 m, 5.0 m | 2.0 m, 5.0 m |
| Euler step \\(\Delta t\\), horizon \\(N\\) | 0.1 s, 10–30 | 0.1 s, 40–80 |
| Speed \\(v\\) | 0 to 3 m/s | −6 to 0 m/s (run 5: −4 to 0 m/s) |
| Steering \\(\phi\\), steering rate \\(\dot\phi\\) | ±1.5 rad, ±1.0 rad/s | ±1.5 rad, ±0.5 rad/s |
| Acceleration \\(a\\) | ±2 m/s² | ±2 m/s² (run 5: ±1 m/s²) |
| Hitch angle \\(\theta_t-\theta_l\\) | ±90° | ±90° |
| Effort weight \\(w\\) | 0.01 | 0.01 |
| Reverse-distance penalty weight | — | 0.1 (run 5 only) |

IPOPT is warm-started with the previous solution shifted one step. To keep denser scenes feasible, we lengthened the horizon and shrank the margin \\(m\\).

{% include pj/youtube.html id="OLZXH1YNP-M" wide=true caption="**Final presentation.** The team's recorded ME231 talk covers the truck-trailer models, constraints, and MPC formulation, then shows forward and reverse runs with moving obstacles." %}

## Results

| Run | Target (m) | Obstacles | \\(N\\) | \\(r_o + r_{\text{truck}} + m = r_{\text{safe}}\\) (m) | Final error, sim time |
|---|---|---|---|---|---|
| 1. Forward, free space | random in [0, 15] × [−15, 15] | none | 10 | — | 0.422 m, 4.3 s |
| 2. Forward (hero clip) | (15, 5) | 1 cyclist crossing at 2.5 m/s | 20 | 0.2 + 1.5 + 2.0 = 3.7 | 0.445 m, 7.3 s |
| 3. Forward (hero clip) | (18, 6) | 3 crossing at 1.5–2.0 m/s | 30 | 0.2 + 1.5 + 1.2 = 2.9 | 0.475 m, 9.4 s |
| 4. Reverse | (−15, 5) | 3 crossing at 1.5–2.0 m/s | 40 | 0.3 + 1.5 + 1.5 = 3.3 | 0.474 m, 12.2 s |
| 5. Reverse from (15, 0) | (−18, 0) | 4 blocking: 2 static, 2 at 0.4–0.5 m/s | 80 | 0.5 + 1.0 + 1.0 = 2.5 | 6.237 m at the 30 s cap; 177/300 steps infeasible |

IPOPT converged at every step of runs 1–4, so every enforced constraint held. Only the hitch is constrained, though: a post-hoc check of run 4 found 37 samples where unconstrained body points, such as the trailer rear, came inside \\(r_{\text{safe}}\\). Obstacles moved exactly as predicted, so robustness to prediction error is untested.

## Next steps

Enable the already-coded truck-front and trailer-rear clearance constraints, model tire slip, and generate C code for deterministic runtimes on embedded hardware.

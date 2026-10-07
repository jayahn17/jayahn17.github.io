---
layout: project
track: class
org: "MEC ENG 126/226L, UC Berkeley"
title: "An \"Iced\" Espresso Machine: Two-Stage Liquid Cooling for Fresh-Brewed Coffee"
excerpt: "A benchtop liquid-cooling loop (a fan-cooled copper coil, then a Peltier cold block) that cooled fresh espresso from 73.3 °C to 12.9 °C in one filmed take, without ice or dilution."
deck: "A two-stage loop adapted from PC water-cooling hardware took a fresh espresso shot from 73.3 °C to 12.9 °C in one filmed take. The drink itself is the working fluid, so it never touches ice or water."
collection: portfolio
category: class
supporting: true
date: 2026-04-28
role: "Team of 4"
duration: "Spring 2026"
team: "Seongjae Ahn, Manuel Martinez Garcia, Sami Kashi, Skye Heiles (Group 7). We called the rig the Grizzly Chiller."
tech_tags: ["Heat Transfer", "Forced Convection", "Thermoelectric Cooling", "Fluid Systems", "Thermal Design", "Rapid Prototyping"]
tools: "12 V high-temperature pump, buck converter, ¼″ copper coil, Arctic P12 fans, TEC1-12706 Peltier module, aluminum water block, tower CPU cooler, probe and IR thermometers"
impact: "Filmed one-take run: espresso pumped from a 73.3 °C reservoir reached 12.9 °C in the tumbler (11.3 °C in a separate cup clip), inside the 10–20 °C iced-serving range with no meltwater dilution"
share: false
teaser: "me226_espresso_teaser.jpg"
header:
  teaser: "me226_espresso_teaser.jpg"
hero:
  image: "me226_espresso_teaser.jpg"
  alt: "Top-down view of the whole two-stage cooling rig on its board"
  caption: "**The whole loop on one board.** The marble brew reservoir (lower left) feeds the 12 V pump (bottom); the buck converter beside the pump is the only control, and the power supply sits at the lower right. The copper coil in its fan shroud (upper left) runs into the Peltier stack on the tower cooler (upper right), under the team's Grizzly Chiller plate, and the insulated line leaving the block carries the chilled espresso on to the cup."
stats:
  - { value: "73.3 → 12.9 °C", label: "reservoir to tumbler, one filmed take" }
  - { value: "11.3 °C", label: "in a paper cup, separate clip" }
  - { value: "≈ 520 W", label: "design load: 100 mL, 90 → 15 °C in 60 s" }
  - { value: "$270", label: "total build cost" }
steps:
  - { label: "Inlet · 73.3 °C measured", title: "Pump", text: "A 12 V high-temperature pump draws the fresh shot from the brew reservoir. A buck converter on the pump line is the only control: flow rate sets residence time in both cooling stages." }
  - { label: "Stage 1 · bulk heat", title: "Copper coil + fans", text: "10 ft of ¼″ copper coil in a ducted shroud with two Arctic P12 fans. Forced convection removes the bulk of the heat while the drink-to-air ΔT is largest." }
  - { label: "Stage 2 · final approach", title: "Peltier cold block", text: "An aluminum water block clamped to a TEC1-12706 module, with a tower CPU cooler on the hot side. The cold side can pull the drink below room temperature, which air cooling cannot." }
  - { label: "Outlet · 10–20 °C target", title: "The cup", text: "Insulated silicone tubing carries the chilled espresso to the outlet. On camera: **12.9 °C** in the tumbler at the end of the one-take run and **11.3 °C** in a paper cup in a separate clip, with no meltwater." }
media:
  hardware:
    - { image: "me226_espresso_coil.jpg", position: "50% 12%", caption: "**Stage 1 coil.** The copper spiral inside the ribbed printed shroud dumps the bulk load, then hands a much cooler stream to Stage 2." }
    - { image: "me226_espresso_peltier.jpg", position: "50% 100%", caption: "**Stage 2, the Grizzly Chiller.** The team's nameplate on the Peltier stack, below the foam that insulates the cold side. The stack is an aluminum water block on a TEC1-12706 module, and a full tower cooler (out of frame) rejects both the heat removed from the drink and the module's electrical power." }
  run:
    - { image: "me226_espresso_hot.jpg", position: "50% 50%", caption: "**1 · Inlet: 73.3 °C.** Fresh espresso in the brew reservoir at the start of the filmed run." }
    - { image: "me226_espresso_mid.jpg", position: "50% 55%", caption: "**2 · Probe in: 26.4 °C.** The thermometer's first reading, moments after it enters the tumbler and while it is still settling toward the drink's temperature." }
    - { image: "me226_espresso_approach.jpg", position: "50% 72%", caption: "**3 · Four seconds later: 13.8 °C.** The same probe in the same tumbler, now inside the 10–20 °C iced-serving range and still falling (12.9 °C by the end of the take)." }
    - { image: "me226_espresso_cold.jpg", position: "50% 15%", caption: "**4 · The cup: 11.3 °C.** The same reading appears in the clip below, where the probe sits in a paper cup under the outlet while it is still dripping. That is inside the 10–20 °C iced-serving target, with no ice to dilute the shot." }
  videos:
    - { video: "me226_espresso_demo.mp4", poster: "posters/me226_espresso_demo.jpg", preload: "none", caption: "**Full run, one take.** From the brew reservoir through the copper coil and the Peltier block to the cup. The probe is on camera at both ends: 73.3 °C in the reservoir, 12.9 °C in the tumbler by the end of the take." }
    - { video: "me226_espresso_temp.mp4", poster: "posters/me226_espresso_temp.jpg", caption: "**The number that matters.** Probe in the cup while the machine is still pouring: **11.3 °C**." }
---

<p class="pj-lede">Iced espresso is a compromise: ice dilutes the drink as it melts, waiting oxidizes the shot and degrades the crema, and cold brew is a different beverage that takes about 12 h. We treated chilling as a heat-rejection problem and built a two-stage liquid-cooling loop with the espresso itself as the working fluid. In one filmed take it cooled the shot from 73.3 °C to 12.9 °C, inside the 10–20 °C iced-serving range.</p>

{% include pj/steps.html items=page.steps %}

## Design: why two stages

Cooling one 100 mL serving (taken as water) from a ~90 °C brew to 15 °C in 60 s requires

$$
Q = m\,c_p\,\Delta T \approx 0.1\ \text{kg} \times 4186\ \tfrac{\text{J}}{\text{kg·K}} \times 75\ \text{K} \approx 31.4\ \text{kJ},
\qquad
\bar{P} = Q/t \approx 520\ \text{W}.
$$

That is about 10× what one TEC1-12706 can pump, and Peltier efficiency drops as the ΔT across the module grows, so a thermoelectric-only design would be impractically slow or large.

**Stage 1: forced air while ΔT is large.** Convective flux, \\(q^{\prime\prime} = h\,(T - T_\infty)\\), peaks where the espresso is hottest. Along the coil the drink relaxes exponentially toward ambient,

$$
T_{\text{out}} = T_\infty + \left(T_{\text{in}} - T_\infty\right)\exp\!\left(-\frac{hA}{\dot m\,c_p}\right),
$$

so more coil area \\(A\\), more airflow (higher \\(h\\)), or lower flow \\(\dot m\\) lowers \\(T_{\text{out}}\\), but never below \\(T_\infty\\).

**Stage 2: Peltier for the final approach.** With most of the heat gone, the module runs at small ΔT and low heat flux, where it is most efficient. Its hot side rejects the drink's heat plus the electrical input, \\(\dot Q_{\text{hot}} = \dot Q_{\text{cold}} + P_{\text{el}}\\), hence a tower CPU cooler rather than a small finned plate.

## Build

{% include pj/grid.html items=page.media.hardware cols=2 class="pj-grid--landscape" %}

- **Thermal stack.** The TEC1-12706 is compressed between the water block and the tower cooler, with thermal paste on both faces; contact pressure here matters more than any other assembly detail. Foam insulates the cold side and the outlet line.
- **Electrical.** One 12 V, 20 A supply powers the Peltier, pump, and fans through a terminal block.

## A filmed run: 73.3 → 12.9 °C

All readings are from a probe thermometer: one continuous take from reservoir to tumbler, plus a separate paper-cup clip.

| Moment | Probe location | Reading |
|---|---|---|
| Start of take | Brew reservoir | 73.3 °C |
| Probe inserted | Outlet tumbler | 26.4 °C (still settling) |
| 4 s later | Same tumbler | 13.8 °C |
| End of take | Same tumbler | 12.9 °C |
| Separate clip | Paper cup under the outlet | 11.3 °C |

The start-of-take reservoir and end-of-take tumbler readings differ by \\(73.3 - 12.9 = 60.4\ \text{K}\\) (75 K in the 90 → 15 °C design case). The reservoir was read only at the start, so this is not a simultaneous inlet-to-outlet drop; with no probe between stages, the Stage 1/Stage 2 split was not measured.

{% include pj/grid.html items=page.media.run cols=2 class="pj-grid--landscape" %}

{% include pj/grid.html items=page.media.videos cols=2 class="pj-grid--narrow" %}

## Next steps

Tune flow rate to a target exit temperature; add Stage 1 coil area with a tighter pitch or more length; strengthen hot-side rejection for more Peltier headroom; insulate the cold-side reservoir; and build a 3D-printed enclosure to make it a countertop appliance.

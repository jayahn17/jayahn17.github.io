---
layout: project
track: class
org: "MEC ENG 126/226L, UC Berkeley"
title: "An \"Iced\" Espresso Machine: Two-Stage Liquid Cooling for Fresh-Brewed Coffee"
excerpt: "A benchtop liquid-cooling loop that uses copper-coil forced convection and a Peltier cold block to cool fresh espresso to 11 °C without ice or dilution."
deck: "Hot espresso goes in, chilled espresso comes out, and it never touches ice or water. A two-stage loop adapted from PC water-cooling hardware uses the drink itself as the working fluid."
collection: portfolio
category: class
supporting: true
date: 2026-04-28
role: "Team of 4"
duration: "Spring 2026"
team: "Seongjae Ahn, Manuel Martinez Garcia, Sami Kashi, Skye Heiles (Group 7). We called the rig the Grizzly Chiller."
tech_tags: ["Heat Transfer", "Forced Convection", "Thermoelectric Cooling", "Fluid Systems", "Thermal Design", "Rapid Prototyping"]
tools: "12 V high-temperature pump, buck converter, ¼″ copper coil, Arctic P12 fans, TEC1-12706 Peltier module, aluminum water block, tower CPU cooler, probe and IR thermometers"
impact: "Filmed end-to-end run: espresso pumped from a 73 °C reservoir reached 11.3 °C in the cup, meeting the 10–20 °C iced-serving target without meltwater dilution"
share: false
teaser: "me226_espresso_teaser.jpg"
header:
  teaser: "me226_espresso_teaser.jpg"
hero:
  video: "me226_espresso_demo.mp4"
  poster: "me226_espresso_teaser.jpg"
  preload: "none"
  caption: "**Full run, one take.** From the brew reservoir through the copper coil and the Peltier block to the cup. The claim is a temperature, so the demo is the measurement."
stats:
  - { value: "73 → 11.3 °C", label: "reservoir to cup, on camera" }
  - { value: "~520 W", label: "average heat rejection needed" }
  - { value: "$270", label: "total build cost" }
steps:
  - { label: "Inlet · ~90 °C brew", title: "Pump", text: "A 12 V high-temperature pump draws the fresh shot from the brew reservoir. A buck converter on the pump line is the one control knob: flow rate sets residence time in both cooling stages." }
  - { label: "Stage 1 · bulk heat", title: "Copper coil + fans", text: "10 ft of ¼-inch copper coil in a ducted channel with two Arctic P12 fans. Forced convection dumps the bulk of the heat where the drink-to-air ΔT is largest." }
  - { label: "Stage 2 · final approach", title: "Peltier cold block", text: "An aluminum water block clamped to a TEC1-12706 module. The hot side rejects into a tower CPU cooler; the cold side pulls the drink below what room air ever could." }
  - { label: "Outlet · 10–20 °C target", title: "The cup", text: "Insulated silicone tubing carries the chilled espresso to the cup. Measured on camera: **11.3 °C**, full strength, no meltwater." }
media:
  hardware:
    - { image: "me226_espresso_teaser.jpg", caption: "**Intake and Stage 1.** A high-temperature pump in 3D-printed brackets feeds 10 ft of ¼″ copper tubing inside a printed shroud. Two fans force air across the coil while the drink is far above ambient, where Newton cooling is most effective." }
    - { image: "me226_espresso_coil.jpg", caption: "**Coil exit.** The spiral dumps the bulk load, then hands a much cooler stream to Stage 2. Worm-gear clamps and a short silicone coupler keep the joint from leaking under pump pressure." }
    - { image: "me226_espresso_peltier.jpg", caption: "**Stage 2, the Grizzly Chiller.** Espresso enters the aluminum water block on a TEC1-12706 module. Foam insulation on the cold-side lines limits heat gain; a full tower cooler rejects both the heat removed from the drink and the module's electrical power." }
  run:
    - { image: "me226_espresso_hot.jpg", caption: "**1 · Inlet: 73.3 °C.** Fresh espresso in the brew reservoir at the start of the filmed run." }
    - { image: "me226_espresso_mid.jpg", caption: "**2 · First milliliters: 26.4 °C.** Residual heat in the lines keeps the initial pour cool rather than chilled. This is the purge, not the serving temperature." }
    - { image: "me226_espresso_approach.jpg", caption: "**3 · Steady: 13.8 °C.** Once the coil and cold block are fully wetted, the output enters the iced-serving range." }
    - { image: "me226_espresso_cold.jpg", caption: "**4 · The cup: 11.3 °C.** Still dispensing undiluted espresso at the target serving temperature." }
---

<p class="pj-lede">Conventional iced espresso is a compromise. Waiting degrades the crema and oxidizes the shot, ice dilutes the drink as it melts, and cold brew is a different beverage that takes about twelve hours. This machine treats iced espresso as a heat-rejection problem: a two-stage liquid-cooling loop, adapted from PC water-cooling hardware, uses the espresso itself as the working fluid.</p>

{% include pj/steps.html items=page.steps %}

## The hardware, left to right

The whole loop lives on one plywood board so a demo can be walked rather than explained. Power, pump, coil, and cold block sit in the same order the espresso travels.

{% include pj/figure.html src="me226_espresso_rig.jpg" narrow=true caption="**The loop.** The marble brew reservoir and 12 V pump on the left; the ducted copper coil between two Arctic fans at the upper right; the Thermal Grizzly Peltier stack on the tower cooler at the lower right. The buck converter beneath the pump is the only control: reducing flow increases residence time in both heat exchangers." %}

{% include pj/grid.html items=page.media.hardware cols=3 class="pj-grid--tall" %}

## A filmed run: 73 °C in, 11 °C out

One probe in the brew reservoir, one in the cup, camera rolling the whole way. The temperature staircase is the workflow: **73 → 26 → 14 → 11 °C** as the loop comes onto condition. Stage 1 does the long drop toward ambient; Stage 2 crosses room temperature and lands in the 10–20 °C iced-drink window.

{% include pj/grid.html items=page.media.run cols=4 class="pj-grid--tall" %}

{% include pj/video.html src="me226_espresso_temp.mp4" narrow=true caption="**The number that matters.** Probe in the cup while the machine is still pouring: **11.3 °C**." %}

## Why two stages are necessary

Chilling one 100 mL serving from 90 °C to 15 °C means removing

$$
Q = m\,c_p\,\Delta T \approx 0.1\ \text{kg} \times 4186\ \tfrac{\text{J}}{\text{kg·K}} \times 75\ \text{K} \approx 31\ \text{kJ},
$$

which over a one-minute pass requires an average of roughly **520 W of heat rejection**. That load is about ten times what a single TEC1-12706 Peltier module can pump, and its efficiency falls further as the cold-side ΔT grows. A thermoelectric-only design would be impractically slow or large. The two-stage split assigns each mechanism the regime where it is actually good.

**Stage 1 exploits the big ΔT.** Newton cooling is proportional to \\(T - T_\infty\\), so forced air across the copper coil is fastest exactly when the espresso is hottest. Along the coil the liquid temperature relaxes exponentially toward ambient,

$$
T_{\text{out}} = T_\infty + \left(T_{\text{in}} - T_\infty\right)\exp\!\left(-\frac{hA}{\dot m\,c_p}\right),
$$

and the exponent contains the design variables: more coil area \\(A\\), stronger airflow \\(h\\), or lower flow rate \\(\dot m\\) all reduce the exit temperature. The same equation defines the stage's limit, because air cooling can approach room temperature but never cross it.

**Stage 2 does only what Stage 1 cannot.** The Peltier block takes over where convection approaches its ambient limit. Because Stage 1 has already rejected most of the heat, the module operates at a small ΔT and low heat flux, where it is most efficient. The hot side is the remaining bottleneck, since the heatsink must reject both the heat removed from the drink and the module's electrical power, which is why it uses a tower-class CPU cooler rather than a small finned plate.

The flow rate ties the two stages together: the buck converter trades throughput against residence time in both heat exchangers at once, and tuning it is how the machine lands in the serving band.

## Build notes

- **Wetted path.** Brew reservoir → high-temp pump → ¼″ copper coil → aluminum water block → insulated silicone tubing → cup. Copper and aluminum do the heat transfer; foam on the outlet run keeps the cold in.
- **Thermal stack.** A TEC1-12706 module compressed between the water block and tower cooler, with thermal paste at both interfaces. Contact pressure at these joints affects performance more than any other assembly detail.
- **Electrical.** One 12 V 20 A supply feeds the Peltier, pump, and fans through a terminal block; the buck converter gives manual flow-rate control. Total build cost about **$270**.
- **Verification.** An infrared thermometer and a probe thermometer record reservoir and cup temperatures on camera, because the machine's primary claim is its outlet temperature.

## What I'd do next

Flow-rate optimization against a target exit temperature (residence time versus throughput), a tighter coil pitch or added length for more Stage-1 area, stronger hot-side rejection to raise Peltier headroom, insulation on the cold-side reservoir, and a 3D-printed enclosure to take it from benchtop rig to countertop appliance.

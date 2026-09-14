---
title: "An \"Iced\" Espresso Machine: Two-Stage Liquid Cooling for Fresh-Brewed Coffee"
excerpt: "A benchtop liquid-cooling loop that uses copper-coil forced convection and a Peltier cold block to cool fresh espresso to 11 °C without ice or dilution."
collection: portfolio
category: class
supporting: true
date: 2026-04-28
role: "MEC ENG 126/226L: The Science and Engineering of Cooking (team of 4)"
duration: "Spring 2026"
tech_tags: ["Heat Transfer", "Forced Convection", "Thermoelectric Cooling", "Fluid Systems", "Thermal Design", "Rapid Prototyping"]
impact: "Filmed end-to-end run: espresso pumped from a 73 °C reservoir reached 11.3 °C in the cup, meeting the 10–20 °C iced-serving target without meltwater dilution"
share: false
teaser: "me226_espresso_teaser.jpg"
header:
  teaser: "me226_espresso_teaser.jpg"
---

## An "Iced" Espresso Machine

*Final project for MEC ENG 126/226L, The Science and Engineering of Cooking, at UC Berkeley. Group 7: Seongjae Ahn, Manuel Martinez Garcia, Sami Kashi, and Skye Heiles. We called the rig the **Grizzly Chiller**.*

### One-line story

**Hot espresso enters the system, and chilled espresso leaves without contacting ice or water.** Conventional approaches require a compromise. Waiting degrades the crema and oxidizes the shot, ice dilutes the drink as it melts, and cold brew is a different beverage that requires approximately twelve hours. This machine treats iced espresso as a heat-rejection problem. A two-stage liquid-cooling loop adapted from PC water-cooling hardware uses the espresso itself as the working fluid.

<div style="margin: 28px 0; padding: 24px; background: #f5f7fa; border: 1px solid #e2e8f0; border-radius: 10px;">
  <div style="display: grid; grid-template-columns: repeat(auto-fit, minmax(200px, 1fr)); gap: 16px; align-items: stretch;">
    <div style="background: #fff; border: 1px solid #e2e8f0; border-left: 4px solid #e05a33; border-radius: 8px; padding: 16px;">
      <div style="font-size: 0.8em; font-weight: 700; color: #e05a33; letter-spacing: 0.5px;">INLET · ~90 °C BREW</div>
      <div style="font-weight: 700; margin: 4px 0;">Pump</div>
      <div style="font-size: 0.9em; color: #555;">A 12 V high-temperature pump draws the fresh shot from the brew reservoir. A buck converter on the pump line is the machine's one control knob: flow rate sets residence time in both cooling stages.</div>
    </div>
    <div style="background: #fff; border: 1px solid #e2e8f0; border-left: 4px solid #4a9eff; border-radius: 8px; padding: 16px;">
      <div style="font-size: 0.8em; font-weight: 700; color: #4a9eff; letter-spacing: 0.5px;">STAGE 1 · BULK HEAT</div>
      <div style="font-weight: 700; margin: 4px 0;">Copper coil + fans</div>
      <div style="font-size: 0.9em; color: #555;">The espresso runs through 10 ft of ¼-inch copper coil inside a ducted channel with two Arctic P12 fans pushing air across it. Forced convection dumps the bulk of the heat where the drink-to-air ΔT is largest and air cooling is still fast.</div>
    </div>
    <div style="background: #fff; border: 1px solid #e2e8f0; border-left: 4px solid #4a9eff; border-radius: 8px; padding: 16px;">
      <div style="font-size: 0.8em; font-weight: 700; color: #4a9eff; letter-spacing: 0.5px;">STAGE 2 · FINAL APPROACH</div>
      <div style="font-weight: 700; margin: 4px 0;">Peltier cold block</div>
      <div style="font-size: 0.9em; color: #555;">The pre-cooled espresso passes through an aluminum water block clamped to a TEC1-12706 Peltier module. The hot side rejects into a tower CPU cooler; the cold side pulls the drink below what room air ever could.</div>
    </div>
    <div style="background: #fff; border: 1px solid #e2e8f0; border-left: 4px solid #2fa36b; border-radius: 8px; padding: 16px;">
      <div style="font-size: 0.8em; font-weight: 700; color: #2fa36b; letter-spacing: 0.5px;">OUTLET · 10–20 °C TARGET</div>
      <div style="font-weight: 700; margin: 4px 0;">The cup</div>
      <div style="font-size: 0.9em; color: #555;">Insulated silicone tubing carries the chilled espresso to the cup. Measured on camera: <strong>11.3 °C</strong>, full strength, no meltwater.</div>
    </div>
  </div>
</div>

---

### The hardware, left to right

The whole loop lives on one plywood board so a demo can be walked, not explained. Power, pump, coil, and cold block sit in the same order the espresso travels.

<div style="margin: 24px 0;">
  <img src="/images/me226_espresso_rig.jpg" alt="Full Grizzly Chiller rig with reservoir, pump, copper coil between fans, and Peltier block on a tower cooler" style="width: 100%; border-radius: 8px; border: 1px solid #e2e8f0;">
  <p style="font-size: 0.88em; color: #666; margin-top: 8px;"><strong>The loop.</strong> The marble brew reservoir and 12 V pump sit on the left. The ducted copper coil between two Arctic fans is at the upper right, and the Thermal Grizzly Peltier stack sits on the tower cooler at the lower right. The buck converter beneath the pump is the only control. Reducing flow increases residence time in both heat exchangers.</p>
</div>

<div style="display: grid; grid-template-columns: repeat(auto-fit, minmax(240px, 1fr)); gap: 18px; margin: 24px 0;">
  <div>
    <img src="/images/me226_espresso_teaser.jpg" alt="Pump, buck converter, and ducted copper coil" style="width: 100%; border-radius: 8px; border: 1px solid #e2e8f0;">
    <p style="font-size: 0.88em; color: #666; margin-top: 8px;"><strong>Intake and Stage 1.</strong> A high-temperature pump mounted in 3D-printed brackets feeds 10 ft of ¼″ copper tubing inside a printed shroud. Two fans force air across the coil while the drink remains far above ambient temperature, where Newton cooling is most effective.</p>
  </div>
  <div>
    <img src="/images/me226_espresso_coil.jpg" alt="Copper coil leaving the shroud into clamped tubing" style="width: 100%; border-radius: 8px; border: 1px solid #e2e8f0;">
    <p style="font-size: 0.88em; color: #666; margin-top: 8px;"><strong>Coil exit.</strong> The spiral dumps the bulk load, then hands a much cooler stream to Stage 2. Worm-gear clamps and a short silicone coupler keep the joint from leaking when the pump is on.</p>
  </div>
  <div>
    <img src="/images/me226_espresso_peltier.jpg" alt="Grizzly Chiller Peltier block with insulated lines and hose clamps" style="width: 100%; border-radius: 8px; border: 1px solid #e2e8f0;">
    <p style="font-size: 0.88em; color: #666; margin-top: 8px;"><strong>Stage 2: The Grizzly Chiller.</strong> Espresso enters the aluminum water block attached to a TEC1-12706 module. Foam insulation on the cold-side lines limits heat gain from the room. A full tower cooler rejects both the heat removed from the drink and the electrical power consumed by the module.</p>
  </div>
</div>

---

### A filmed run: 73 °C in, 11 °C out

The claim is a temperature, so the demo *is* the measurement. One probe in the brew reservoir, one in the cup, camera rolling the whole way.

<div style="display: grid; grid-template-columns: repeat(auto-fit, minmax(200px, 1fr)); gap: 16px; margin: 24px 0;">
  <div>
    <img src="/images/me226_espresso_hot.jpg" alt="Thermometer reading 73.3 °C in the hot espresso reservoir" style="width: 100%; border-radius: 8px; border: 1px solid #e2e8f0;">
    <p style="font-size: 0.88em; color: #666; margin-top: 8px;"><strong>1 · Inlet: 73.3 °C.</strong> Fresh espresso sits in the brew reservoir at the start of the filmed run. The pickup tube is immersed, and the pump is ready to start.</p>
  </div>
  <div>
    <img src="/images/me226_espresso_mid.jpg" alt="First milliliters collecting in the output tumbler, 26.4 °C" style="width: 100%; border-radius: 8px; border: 1px solid #e2e8f0;">
    <p style="font-size: 0.88em; color: #666; margin-top: 8px;"><strong>2 · First milliliters: 26.4 °C.</strong> Residual heat in the lines keeps the initial pour cool rather than chilled. This volume is the purge and does not represent the serving temperature.</p>
  </div>
  <div>
    <img src="/images/me226_espresso_approach.jpg" alt="Thermometer reading 13.8 °C in the collection tumbler" style="width: 100%; border-radius: 8px; border: 1px solid #e2e8f0;">
    <p style="font-size: 0.88em; color: #666; margin-top: 8px;"><strong>3 · Steady: 13.8 °C.</strong> Once the coil and cold block are fully wetted and the flow reaches steady operation, the output enters the iced-serving temperature range.</p>
  </div>
  <div>
    <img src="/images/me226_espresso_cold.jpg" alt="Thermometer reading 11.3 °C in the output cup while espresso is still dispensing" style="width: 100%; border-radius: 8px; border: 1px solid #e2e8f0;">
    <p style="font-size: 0.88em; color: #666; margin-top: 8px;"><strong>4 · The cup: 11.3 °C.</strong> The machine continues dispensing undiluted espresso at the target serving temperature.</p>
  </div>
</div>

The temperature staircase is the workflow: **73 → 26 → 14 → 11 °C** as the loop comes onto condition. Stage 1 does the long drop toward ambient; Stage 2 is what crosses room temperature and lands in the 10–20 °C iced-drink window.

<div style="display: grid; grid-template-columns: repeat(auto-fit, minmax(280px, 1fr)); gap: 18px; margin: 24px 0;">
  <div>
    <video width="100%" controls style="border-radius: 8px; box-shadow: 0 4px 12px rgba(0,0,0,0.1);">
      <source src="/images/me226_espresso_demo.mp4" type="video/mp4">
      Your browser does not support the video tag.
    </video>
    <p style="font-size: 0.88em; color: #666; margin-top: 8px;"><strong>Full run.</strong> This single take follows the complete path from the reservoir through the coil and Grizzly Chiller to the cup.</p>
  </div>
  <div>
    <video width="100%" controls style="border-radius: 8px; box-shadow: 0 4px 12px rgba(0,0,0,0.1);">
      <source src="/images/me226_espresso_temp.mp4" type="video/mp4">
      Your browser does not support the video tag.
    </video>
    <p style="font-size: 0.88em; color: #666; margin-top: 8px;"><strong>The number that matters.</strong> Probe in the cup while the machine is still pouring: <strong>11.3 °C</strong>.</p>
  </div>
</div>

---

### Why two stages are necessary

Chilling one 100 mL serving from 90 °C to 15 °C means removing

$$
Q = m\,c_p\,\Delta T \approx 0.1\ \text{kg} \times 4186\ \tfrac{\text{J}}{\text{kg·K}} \times 75\ \text{K} \approx 31\ \text{kJ},
$$

Over a one-minute pass, this requires an average of **approximately 520 W of heat rejection**. That load is roughly ten times greater than the heat a single TEC1-12706 Peltier module can pump, and its efficiency falls further as the cold-side ΔT increases. A thermoelectric-only design would therefore be impractically slow or large.

The two-stage split assigns each mechanism the regime where it is actually good:

- **Stage 1 exploits the big ΔT.** Newton cooling is proportional to \\(T - T_\infty\\), so forced air across the copper coil is at its fastest exactly when the espresso is hottest. Along the coil the liquid temperature relaxes exponentially toward ambient,

$$
T_{\text{out}} = T_\infty + \left(T_{\text{in}} - T_\infty\right)\exp\!\left(-\frac{hA}{\dot m\,c_p}\right),
$$

  The exponent contains the key design variables. More coil area \\(A\\), stronger airflow \\(h\\), or lower flow rate \\(\dot m\\) all reduce the exit temperature. The same equation also defines the stage's limit because air cooling can approach room temperature but cannot cool the drink below it.

- **Stage 2 does only what Stage 1 cannot.** The Peltier block takes over where convection approaches its ambient-temperature limit. Because Stage 1 has already rejected most of the heat, the module operates at a small ΔT and low heat flux, where it is more efficient. The hot side is the remaining bottleneck because the heatsink must reject both the heat removed from the drink and the module's electrical power. For this reason, the hot side uses a tower-class CPU cooler rather than a small finned plate.

The flow rate ties the two stages together: the buck converter trades throughput against residence time in both heat exchangers at once, and tuning it is how the machine lands in the serving band.

---

### Build notes

- **Wetted path:** brew reservoir → high-temp pump → ¼″ copper coil → aluminum water block → insulated silicone tubing → cup. Copper and aluminum do the heat transfer; foam on the outlet run keeps the cold in.
- **Thermal stack:** A TEC1-12706 module is compressed between the water block and tower cooler, with thermal paste applied at both interfaces. Contact pressure at these joints affects performance more than any other assembly detail.
- **Electrical:** one 12 V 20 A supply feeds the Peltier, pump, and fans through a terminal block; the buck converter gives manual flow-rate control. Total build cost ≈ **$270**.
- **Verification:** An infrared thermometer and a probe thermometer record the reservoir and cup temperatures on camera. Because the machine's primary claim is its outlet temperature, the filmed measurement provides the central evidence.

### What I'd do next

Flow-rate optimization against a target exit temperature (residence time vs. throughput), tighter coil pitch or added length for more Stage-1 area, stronger hot-side rejection to raise Peltier headroom, insulation on the cold-side reservoir, and a 3D-printed enclosure to take it from benchtop rig to countertop appliance.

*Course project for MEC ENG 126/226L, UC Berkeley, Spring 2026.*

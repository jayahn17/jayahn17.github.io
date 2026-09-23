---
layout: project
track: team
org: "CalSol, UC Berkeley Solar Vehicle Team"
title: "CalSol: Lighter Front Suspension Without Losing Stiffness"
excerpt: "Mechanical design work for a competitive solar vehicle, focused on reducing suspension mass while preserving stiffness and manufacturability."
deck: "A consolidated front suspension bracket for a solar-electric race car, about 10% lighter, validated in FEA before fabrication and coordinated with the battery team's packaging constraints."
collection: portfolio
category: class
date: 2025-12-02
role: "Battery and Suspension Team"
duration: "August 2022 – May 2024"
tech_tags: ["FEA", "CAD", "Structural Design"]
tools: "CAD, finite element analysis"
supporting: true
share: false
teaser: "CalSol_suspension.png"
header:
  teaser: "CalSol_suspension.png"
hero:
  image: "CalSol_suspension.png"
  alt: "CalSol front suspension bracket design"
  caption: "**Front suspension.** The consolidated bracket structure, with load paths rerouted to keep stiffness while removing mass."
stats:
  - { value: "~10%", label: "mass reduction, front bracket assembly" }
  - { value: "FEA", label: "validated before fabrication" }
---

<p class="pj-lede">For a solar-electric vehicle, every gram of unsprung mass costs efficiency. On CalSol's mechanical and battery teams, I worked to reduce the mass of key suspension components without compromising stiffness, safety margins, or the way the parts integrate with the rest of the car.</p>

## The problem

- Lower front-end and unsprung mass to improve vehicle efficiency.
- Maintain structural stiffness and safety margins required by vehicle integration constraints.
- Keep design decisions compatible with battery packaging and assembly workflows.

## Suspension redesign

The front suspension bracket structure was consolidated to reduce part count and mass, with stiffness targets preserved by rerouting load paths and redistributing section geometry.

## Finite element validation

Structural simulations compared the baseline and revised bracket concepts, checking displacement and stress-concentration effects under representative loads. The results confirmed that the redesign met stiffness requirements before anything was fabricated.

{% include pj/figure.html src="Calsol_battery.jpeg" caption="**Battery packaging.** Interface assumptions were synced with the battery and mechanical leads, and attachment-interface changes were mapped to avoid downstream integration issues." %}

## Results

- Approximately 10% mass reduction in the front suspension bracket assembly.
- Redesigned brackets validated through FEA before fabrication.

---
layout: project
track: team
org: "CalSol, UC Berkeley Solar Vehicle Team"
title: "CalSol: Lighter Front Suspension Without Losing Stiffness"
excerpt: "Two front suspension brackets on CalSol's solar car consolidated into one: 10% lighter, with stiffness and stress checked in FEA before fabrication."
deck: "I consolidated two front suspension brackets on CalSol's solar car into one part, cutting their mass by 10%, and checked stiffness and stress with finite element analysis (FEA) before fabrication."
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
  alt: "CalSol front suspension as installed: the pocketed aluminum bracket bolted to the carbon-fiber chassis, with the control arms, coilover shock, and upright"
  caption: "**Front suspension.** The assembly with its control arms, brackets, and coilover shock."
stats:
  - { value: "10%", label: "lower front bracket mass" }
  - { value: "2 → 1", label: "front suspension brackets" }
  - { value: "5%", label: "power saved by reconfiguring circuit wiring" }
---

<p class="pj-lede">Mass costs a solar car efficiency, but CalSol's front suspension could not lose stiffness or safety margin. I consolidated two front brackets into one part weighing 10% less than the pair, and checked it in FEA before fabrication.</p>

## Design and FEA

To preserve the stiffness targets with one part instead of two, I rerouted load paths and redistributed section geometry. FEA of the baseline and consolidated designs under representative loads compared displacement and stress concentrations; the redesign met the stiffness and safety-margin requirements.

## Battery packaging and wiring

I coordinated bracket-interface changes with the battery and mechanical leads to fit battery packaging and assembly. I also reconfigured circuit wiring to improve battery efficiency, saving 5% in power.

{% include pj/figure.html src="Calsol_battery.jpeg" caption="**Battery box.** The battery enclosure and its wiring." %}

## Results

| Result | Value |
|---|---|
| Front brackets | 2 → 1 |
| Bracket mass | −10% |
| Power savings from rewiring | 5% |

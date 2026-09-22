---
layout: project
track: class
org: "ME110, UC Berkeley"
title: "Automatic Snow Goggles Inspired by the Nictitating Membrane"
excerpt: "ME110 project developing a bioinspired automatic lens-cleaning mechanism that keeps snow goggles clear without manual wiping."
deck: "A compact sweeping mechanism, modeled on the avian nictitating membrane, that clears snow and ice from a goggle lens without the wearer touching it."
collection: portfolio
category: class
date: 2024-12-01
role: "ME110: Product Design"
duration: "Fall 2024"
tech_tags: ["CAD", "SLA Prototyping", "Mechatronics"]
tools: "CAD, SLA 3D printing, actuator and gearing design"
supporting: true
share: false
teaser: "me110-0.png"
header:
  teaser: "me110-0.png"
hero:
  image: "me110-0.png"
  alt: "Automatic snow goggles prototype"
  caption: "**The prototype.** A self-actuated lens sweep integrated into a goggle frame."
media:
  design:
    - { image: "me110-2.png", caption: "**Bioinspiration.** The nictitating membrane sweeps across a bird's eye with controlled angular motion; the goggle mechanism borrows that kinematics." }
    - { image: "me110-1.png", caption: "**CAD.** Mechanism and frame integration, planned around SLA-friendly geometry." }
---

<p class="pj-lede">In harsh winter conditions visibility degrades quickly as snow and ice build up on a lens. This ME110 project asked whether a biological mechanism could be translated into a practical wearable system that clears the lens on its own.</p>

## The problem

- Protect vision from snow and ice accumulation.
- Remove lens contaminants without manual wiping.
- Keep the mechanism compact and unobtrusive for user comfort.

## Mechanical approach

The avian nictitating membrane served as the kinematic reference. The design is a compact sweeping mechanism with controlled angular motion across the lens, driven by an actuator and gearing strategy that balances speed, force, and reliability.

{% include pj/grid.html items=page.media.design cols=2 class="pj-grid--contain" %}

## Design execution

**System level.** The mechanism is structured around minimal moving mass to avoid fatigue and bulk, combines mechanical and electrical elements so that actuation stays consistent across repeated cycles, and is planned around SLA-friendly geometry for manufacturability.

**Modeling and prototyping.** CAD models were built and early-generation parts printed for fit, clearance, and motion testing. The mechanism geometry was iterated to reduce binding and improve repeatability, and the sweep arc and timing were tuned for practical cleaning performance.

## Results

- A functional prototype with automatic lens-cleaning action.
- A biological concept validated as a wearable mechanism.
- Reliability improved through enclosure and linkage refinement: a self-actuated sweep, a smooth motion profile, and an architecture compact enough for goggle frames.

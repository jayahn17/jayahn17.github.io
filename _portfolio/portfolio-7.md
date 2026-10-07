---
layout: project
track: class
org: "ME110, UC Berkeley"
title: "Automatic Snow Goggles Inspired by the Nictitating Membrane"
excerpt: "ME110 project developing a bioinspired automatic lens-cleaning mechanism that keeps snow goggles clear without manual wiping."
deck: "A hands-free snow-goggle mechanism modeled on the avian nictitating membrane: motor-driven roller posts sweep a transparent sheet sideways across the lens to clear snow and ice."
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
    - { image: "me110-2.png", caption: "**Bioinspiration.** The nictitating membrane, a bird's translucent third eyelid, sweeps sideways across the eye; the goggle mechanism borrows that sweeping motion." }
    - { image: "me110-1.png", caption: "**CAD.** Mechanism and frame integration, planned around SLA-friendly geometry." }
---

<p class="pj-lede">Snow and ice build up on a goggle lens and degrade vision until wiped by hand. For ME110, our team borrowed the sideways sweep of a bird's nictitating membrane and built a working prototype that clears the lens hands-free.</p>

## Concept

We agreed on the membrane as our most feasible, effective, and novel idea.

| Requirement | Design response |
|---|---|
| Clear snow and ice | Transparent sheet swept across the lens |
| Hands-free, repeatable | Gearmotor-driven roller posts carry the sheet |
| Compact, comfortable to wear | Minimal moving mass; frame-mounted drive |

{% include pj/grid.html items=page.media.design cols=2 class="pj-grid--contain" %}

## Build

In CAD, a gearmotor at each post's base turns its roller. Early prints checked fit, clearance, and motion; we iterated the geometry to reduce binding and improve repeatability, refined the enclosure and linkage to improve reliability, and tuned sweep travel and timing. The final prototype drives the rollers through bevel-gear pairs at the post tops. In both versions, the gearing balances sweep speed, force, and reliability.

## Results

The prototype sweeps the lens on its own with a smooth motion profile and is compact enough to mount on a goggle frame, turning the membrane's sweep into a wearable mechanism.

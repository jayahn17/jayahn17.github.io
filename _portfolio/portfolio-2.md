---
layout: project
track: industry
org: "Root Applied Sciences"
title: "Field-Deployable Pathogen Monitoring Hardware"
excerpt: "Field-deployed pathogen monitoring hardware with SLA-manufacturable microfluidics, serviceable enclosures, and deployment-ready mechanical design."
deck: "Microfluidic sample handling that prints reliably in SLA resin, inside an enclosure that survives outdoor deployment and can be serviced in the field."
collection: portfolio
category: work
date: 2024-11-01
role: "Junior Engineer (Contractor)"
duration: "November 2024 – May 2025"
tech_tags: ["CAD", "SLA 3D Printing", "Microfluidics", "Field Hardware"]
tools: "CAD, SLA 3D printing, microfluidic channel and valve design, motorized door mechanisms, enclosure design"
share: false
teaser: "root_deployment.jpg"
header:
  teaser: "root_deployment.jpg"
card_image: "root_deployment_1.png"
hero:
  image: "root_deployment_1.png"
  alt: "Pathogen monitoring device installed at a field site"
  caption: "**Deployed.** The monitoring device installed at a field location, where the enclosure, mounting, and service access all get tested by weather rather than by a lab bench."
media:
  design:
    - { image: "root_microfluid_CAD.png", caption: "**Microfluidics CAD.** Channel and valve geometry designed around SLA manufacturing constraints." }
    - { image: "root_microfluid_door_SLA.jpg", caption: "**SLA-printed door.** The motorized microfluidic door component, printed and tested for repeatable closure." }
    - { image: "root_protector.png", caption: "**Protector housing.** Splash resistance and impact tolerance for outdoor monitoring." }
    - { image: "root_maintenance_1.jpeg", caption: "**Maintenance.** Access points and fixture interfaces planned so an operator can service the unit on site." }
---

<p class="pj-lede">Root Applied Sciences builds a pathogen monitoring platform for environmental deployment. The hardware has to be manufacturable, easy to service, and robust outside the lab, while still preserving microfluidic precision. I worked on the mechanical side of that trade-off.</p>

## The problem

- Build a reliable sample-handling mechanism for repeated field operation.
- Make fluid-control features printable in SLA materials with predictable quality.
- Design an enclosure and mounting strategy that support long-term deployment and easy servicing.

## Microfluidic design

I designed motorized microfluidic door mechanisms to improve sample-handling repeatability, and built the CAD geometry for channel and valve systems with SLA manufacturing constraints in mind from the first revision. Flow behavior was validated through prototyping and iterative geometry refinement.

{% include pj/grid.html items=page.media.design cols=2 class="pj-grid--contain" %}

## Housing and field readiness

The protective enclosures were designed for splash resistance and impact tolerance, with maintenance-friendly access points and fixture interfaces to simplify service. Microfluidic modules were integrated with sensor interfaces for automated detection workflows. I also wrote deployment and maintenance procedures that reduced setup ambiguity for operators, and verified that key mechanical tolerances held across repeated installation cycles.

## Results

- SLA-ready microfluidic components that supported stable flow and repeatable closure behavior.
- Protective housings optimized for transport, deployment, and field servicing.
- Improved deployment reliability through component-level simplification and a clearer maintenance workflow.

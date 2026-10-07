---
layout: project
track: industry
org: "Root Applied Sciences"
title: "Field-Deployable Pathogen Monitoring Hardware"
excerpt: "An SLA-printed microfluidic door, insect-resistant PCB housings, and serviceable enclosures for field pathogen monitors, plus the preparation and maintenance of 80+ devices."
deck: "An SLA-printed microfluidic door and insect-resistant PCB housings that reduced insect-related damage on field pathogen monitors, plus preparation and maintenance of 80+ devices."
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
  caption: "**Deployed.** The monitoring device installed at a field site, where weather, not a lab bench, tests the enclosure, mounting, and service access."
stats:
  - { value: "80+", label: "devices prepared and maintained" }
media:
  design:
    - { image: "root_microfluid_CAD.png", caption: "**Microfluidic door (CAD).** The door component, designed around SLA printing constraints before it was printed." }
    - { image: "root_microfluid_door_SLA.jpg", caption: "**SLA-printed door.** The door part for the motorized microfluidic mechanism, printed in clear resin." }
  field:
    - { image: "root_protector.png", caption: "**Protector (CAD).** The two-part protector ring from the enclosure design." }
    - { image: "root_maintenance_1.jpeg", caption: "**Field maintenance.** A wasp nest built inside a deployed unit: the kind of insect intrusion the insect-resistant PCB housings were designed to keep out." }
---

<p class="pj-lede">Root Applied Sciences' outdoor pathogen monitors need fluid-control parts that are SLA-printable yet precise, and serviceable electronics protected from weather and insects. I designed a microfluidic door and insect-resistant PCB housings, and managed preparation and maintenance of 80+ devices.</p>

## Microfluidic door

I designed a motorized door for accurate data collection from bacteria and spore solutions, modeling the door, channels, and valves around SLA constraints and validating flow through iterative prototypes. The microfluidic modules interface with sensors for automated detection.

{% include pj/grid.html items=page.media.design cols=2 class="pj-grid--contain" %}

## Field readiness

Insect intrusion was a field failure mode, so I designed and 3D-printed insect-resistant PCB housings. The protective enclosures were designed for splash resistance and impact tolerance, with service access points and fixture interfaces. I wrote deployment and maintenance procedures that reduced operator setup ambiguity, and verified that key mechanical tolerances held over repeated installations.

{% include pj/grid.html items=page.media.field cols=2 class="pj-grid--contain" %}

## Results

| Deliverable | Outcome |
|---|---|
| Microfluidic door | Stable flow and repeatable closure in prototypes |
| PCB housings | Reduced insect-related damage; more efficient quality-control maintenance |
| Deployment | 80+ devices prepared and maintained; deployment reliability improved through simpler components and a clearer maintenance workflow |

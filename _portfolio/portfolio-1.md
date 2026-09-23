---
layout: project
track: research
org: "TAF Lab, UC Berkeley"
title: "CAPTAIN: An Autonomous Ocean Drone for Sustainable Marine Transport"
excerpt: "Autonomous ocean-drone prototype for low-carbon marine transport. Built a real-time telemetry and data pipeline and validated it across 50+ sea trials; recognized in the U.S. DOE Power at Sea Prize."
deck: "An ocean-drone prototype that steers through wind and waves. I led the electronics, the upwind/downwind autonomy, and the data pipeline that turned more than 50 sea trials into weekly design iterations."
collection: portfolio
category: work
date: 2025-11-01
role: "Undergraduate Research Assistant"
duration: "May 2024 – November 2025"
team: "Evan Kuo, Seongjae Ahn, Arsh Khan, Prof. Reza Alam"
team_size: 4
tech_tags: ["Python", "Sensors", "XBee", "Embedded"]
tools: "GPS, IMU, magnetometer, wind vane, XBee telemetry, servo and stepper control, Python data pipeline"
featured: true
impact: "Top 20 in the U.S. DOE 'Power at Sea' Prize; real-time data pipeline supporting 50+ ocean tests"
share: false
teaser: "TAF_Lab_1.jpeg"
header:
  teaser: "TAF_Lab_1.jpeg"
hero:
  image: "TAF_Lab_1.jpeg"
  alt: "CAPTAIN ocean drone prototype with the TAF Lab team"
  caption: "**The prototype.** CAPTAIN at the Theoretical & Applied Fluid Dynamics (TAF) Lab, UC Berkeley. Marine-grade power and sensor layout inside a custom autonomous drone shell."
stats:
  - { value: "50+", label: "ocean tests analyzed" }
  - { value: "7+", label: "sensors integrated" }
  - { value: "Top 20", label: "U.S. DOE Power at Sea Prize" }
---

<p class="pj-lede">CAPTAIN is an ocean-drone prototype for low-carbon marine transport. The engineering challenge was to make the system reliable enough for real ocean testing while keeping the architecture simple enough to iterate on every week.</p>

## The problem

- Demonstrate reliable station-keeping and heading control in wind- and wave-driven conditions.
- Maintain dependable wireless telemetry for remote monitoring and logging during field tests.
- Turn each sea trial into usable data for weekly design iteration.
- Deliver a polished prototype suitable for internal reviews and external judging.

## System architecture

| Layer | What it is |
|---|---|
| Platform | Custom autonomous ocean-drone shell with marine-grade power and sensor layout |
| Perception | GPS, IMU, magnetometer, and wind-vane sensors for pose and flow-aware heading |
| Communication | XBee protocol for low-latency telemetry between drone and base station |
| Control | Upwind/downwind steering logic combining sensor fusion with waypoint objectives |
| Logging | Firmware-side data capture plus Python-based ingestion for post-run analysis |

## What I built

**Electronics and sensing.** I designed the instrumentation architecture and integrated more than seven sensors with robust connectors, power management, and signal conditioning, then implemented sensor-fusion logic to stabilize heading estimates under intermittent disturbances.

**Autonomy and motion control.** I developed the upwind/downwind autonomous navigation logic, including thresholding for wind-angle transitions and recovery behavior, and tuned the servo and stepper control loops for turning and course correction with reduced overshoot in wave conditions.

**Data and reliability engineering.** I built an end-to-end data pipeline from firmware logs to a Python processing database, and standardized filename conventions, metadata tags, and field-run checkpoints so that runs could be compared across tests.

{% include pj/figure.html src="TAFlab_lolus.jpeg" caption="**Field testing.** Every sea trial was logged and post-processed the same way, which made run-level postmortems possible." %}

## Field execution

More than 50 ocean tests were conducted and analyzed, each one used to evaluate telemetry reliability, control stability, and sensor behavior under changing wind conditions. Recurring control and estimation failure modes were identified and resolved through run-level postmortems.

## Outcomes

- Top 20 placement in the U.S. Department of Energy "Power at Sea Prize."
- An operational prototype with a repeatable control-and-data feedback loop suitable for next-stage scaling.
- Intellectual property submitted under the title **PowerCab: A Multimodal Mobile Sea-based Power Generation and Delivery**.
- CAPTAIN was presented to the UC Berkeley Vice Chancellor for Research during prototype evaluation.

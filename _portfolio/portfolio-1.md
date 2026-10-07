---
layout: project
track: research
org: "TAF Lab, UC Berkeley"
title: "CAPTAIN: An Autonomous Ocean Drone for Sustainable Marine Transport"
excerpt: "Sail-equipped autonomous ocean drone for low-carbon marine transport: 7+ sensors, upwind/downwind sail control, and a firmware-to-Python data pipeline used in 50+ ocean tests. Top 20 of 3,400 in the U.S. DOE Power at Sea Prize."
deck: "A sail-equipped ocean drone that steers itself upwind and downwind. I led the electronics (7+ sensors, XBee telemetry) and built the sail control and the data pipeline behind 50+ ocean tests; the project placed Top 20 of 3,400 in the U.S. DOE Power at Sea Prize."
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
impact: "Top 20 of 3,400 in the U.S. DOE Power at Sea Prize; real-time data pipeline supporting 50+ ocean tests"
share: false
teaser: "TAF_Lab_1.jpeg"
header:
  teaser: "TAF_Lab_1.jpeg"
hero:
  image: "TAF_Lab_1.jpeg"
  alt: "CAPTAIN ocean drone prototype floating on open water"
  narrow: true
  caption: "**CAPTAIN on the water.** The prototype built at the Theoretical & Applied Fluid Dynamics (TAF) Lab, UC Berkeley: marine-grade power and sensor layout inside a custom autonomous drone shell."
stats:
  - { value: "50+", label: "ocean tests run and analyzed" }
  - { value: "7+", label: "sensors integrated" }
  - { value: "Top 20 / 3,400", label: "U.S. DOE Power at Sea Prize" }
---

<p class="pj-lede">CAPTAIN is a sail-equipped autonomous ocean drone for low-carbon marine transport. It had to keep station and hold heading in wind and waves, and each ocean test had to feed the next weekly design iteration.</p>

## Design

| Layer | Implementation |
|---|---|
| Sensing | 7+ sensors, including GPS, IMU, magnetometer, and wind vane, for pose and flow-aware heading |
| Telemetry | Real-time XBee link to a base station |
| Control | Upwind/downwind sail logic steering to waypoints via servo and stepper motors |
| Logging | Real-time firmware → Python database pipeline |

## Build

**Electronics.** I designed the instrumentation, integrated the sensors (connectors, power management, signal conditioning), and wrote sensor-fusion code to stabilize the heading estimate under disturbances.

**Sail control.** I wrote the upwind/downwind logic with wind-angle transition thresholds and recovery behavior, and tuned the servo and stepper turning loops to limit overshoot in waves.

**Data.** I built the logging pipeline and standardized filenames, metadata tags, and field-run checkpoints for run-to-run comparison.

## Testing

I ran 50+ ocean tests with the team, evaluating telemetry, control stability, and sensor behavior in changing wind. Run-level postmortems turned recurring control and estimation failures into fixes.

## Results

- **U.S. DOE Power at Sea Prize:** Top 20 of 3,400 (top 0.6%).
- **Patent application** (pending review): *PowerCab: A Multimodal Mobile Sea-based Power Generation and Delivery*, listing me as an inventor.
- **Team pitch** to the UC Berkeley Vice Chancellor for Research.
- **Operational prototype** with a repeatable control-and-data feedback loop, suitable for scaling toward the multi-drone mesh network on the poster.

{% include pj/figure.html src="TAFlab_lolus.jpeg" caption="**The team with the prototype.** CAPTAIN on its stand next to the project poster." %}

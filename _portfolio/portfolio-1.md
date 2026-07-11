---
title: "CAPTAIN: Autonomous Ocean Drone for Sustainable Marine Transport"
excerpt: "Autonomous ocean-drone prototype for low-carbon marine transport. Built a real-time telemetry and data pipeline and validated it across 50+ sea trials; recognized in the U.S. DOE Power at Sea Prize."
collection: portfolio
category: work
date: 2025-11-01
role: "Undergraduate Research Assistant"
duration: "May 2024 – November 2025"
team_size: 4
tech_tags: ["Python", "Sensors", "XBee", "Embedded"]
impact: "Top 20 in the U.S. DOE 'Power at Sea' Prize; real-time data pipeline supporting 50+ ocean tests"
featured: true
teaser: "TAF_Lab_1.jpeg"
header:
  teaser: "TAF_Lab_1.jpeg"
share: false
---

## CAPTAIN: Smart Steering Through Waves for Sustainable Marine Transportation

**Team:** Evan Kuo, Seongjae Ahn, Arsh Khan, Prof. Reza Alam

### Context
At UC Berkeley's Theoretical & Applied Fluid Dynamics (TAF) Lab, I led electronics integration and autonomy development for CAPTAIN, an ocean-drone prototype for low-carbon marine transport. The challenge was to make the system reliable enough for real ocean testing while keeping the architecture simple enough to iterate on quickly.

### Problem Statement
- Demonstrate reliable station-keeping and heading control in wind- and wave-driven conditions.
- Maintain dependable wireless telemetry for remote monitoring and logging during field tests.
- Turn each sea trial into usable data for weekly design iteration.
- Deliver a polished prototype suitable for internal reviews and external judging.

### System Architecture
- Platform: custom autonomous ocean drone shell with marine-grade power and sensor layout.
- Perception stack: GPS, IMU, magnetometer, and wind-vane sensors for pose and flow-aware heading.
- Communication: XBee protocol for low-latency telemetry between drone and base station.
- Control strategy: upwind/downwind steering logic combining sensor fusion with waypoint objectives.
- Logging: firmware-side data capture plus Python-based ingestion for post-run analysis.

### My Contributions
**Electronics and Sensing**
- Designed the instrumentation architecture and integrated 7+ sensors with robust connectors, power management, and signal conditioning.
- Implemented sensor-fusion logic to stabilize heading estimates under intermittent disturbances.

**Autonomy and Motion Control**
- Developed the upwind/downwind autonomous navigation logic, including thresholding for wind-angle transitions and recovery behavior.
- Tuned servo and stepper control loops for turning and course correction with reduced overshoot in wave conditions.

**Data and Reliability Engineering**
- Built an end-to-end data pipeline from firmware logs to a Python processing database.
- Standardized filename conventions, metadata tags, and field-run checkpoints to speed post-processing and comparison across tests.

### Field Execution and Results
- Conducted and analyzed 50+ ocean tests, using each run to evaluate telemetry reliability, control stability, and sensor behavior under changing wind conditions.
- Identified and resolved recurring control and estimation failure modes through run-level postmortems.
- Submitted intellectual property under the title **PowerCab: A Multimodal Mobile Sea-based Power Generation and Delivery**.
- Presented CAPTAIN to the UC Berkeley Vice Chancellor for Research during prototype evaluation.

### Outcomes
- Top 20 placement in the U.S. Department of Energy "Power at Sea Prize."
- Operational prototype with a repeatable control-and-data feedback loop suitable for next-stage scaling.

### Prototype and Pitch

<div style="display: grid; grid-template-columns: repeat(auto-fit, minmax(300px, 1fr)); gap: 20px; margin: 20px 0;">
  <img src="/images/TAF_Lab_1.jpeg" alt="TAF Lab Team Photo 1" style="width: 100%; max-width: 100%; height: auto; border-radius: 8px; box-shadow: 0 4px 12px rgba(0,0,0,0.1); object-fit: contain;">
  <img src="/images/TAFlab_lolus.jpeg" alt="TAF Lab Lolus" style="width: 100%; max-width: 100%; height: auto; border-radius: 8px; box-shadow: 0 4px 12px rgba(0,0,0,0.1); object-fit: contain;">
</div>

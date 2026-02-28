---
title: "CAPTAIN: Autonomous Ocean Drone for Sustainable Marine Transport"
excerpt: "Autonomous ocean drone prototype for sustainable marine transportation. Built a real-time data pipeline and validated more than 50 sea trials; shortlisted in the U.S. DOE Power at the Sea Prize."
collection: portfolio
category: work
date: 2025-11-01
role: "Undergraduate Research Assistant"
duration: "Jan 2024 – Dec 2024"
team_size: 4
tech_tags: ["Python", "Sensors", "XBee", "Embedded"]
impact: "Top 20 in U.S. DOE 'Power at the Sea' Prize; built a real-time data pipeline supporting 50+ ocean tests"
featured: true
teaser: "TAF_Lab_1.jpeg"
header:
  teaser: "TAF_Lab_1.jpeg"
share: false
---

## CAPTAIN: Smart Steering Through Waves for Sustainable Marine Transportation

**Team:** Evan Kuo, Seongjae Ahn, Arsh Khan, Prof. Reza Alam

### Context
At the Theoretical & Applied Fluid Dynamics Lab (TAF Lab) at UC Berkeley, I led electronics integration and autonomy development for CAPTAIN, an ocean-drone prototype intended for low-carbon marine operations. The team needed an approach that was field-reliable in rough real-world conditions while remaining simple enough for rapid iteration.

### Problem Statement
- Validate autonomous station-keeping and heading control in wind-driven water conditions.
- Enable dependable wireless telemetry for remote monitoring and logging.
- Provide objective data for weekly design iteration across 50+ in-water runs.
- Deliver a presentation-ready prototype for internal and external judging.

### System Architecture
- Platform: custom autonomous ocean drone shell with marine-grade power and sensor layout.
- Perception stack: GPS, IMU, magnetometer, and wind vane sensors for pose and flow-aware heading.
- Communication: XBee protocol for low-latency telemetry between drone and base station.
- Control strategy: upwind/downwind steering logic using sensor fusion and waypoint objectives.
- Logging: firmware-side data capture + Python data ingestion for post-run analysis.

### My Contributions
**Electronics and Sensing**
- Designed the instrumentation architecture and integrated 7+ sensors with robust connectors, power management, and signal conditioning.
- Implemented sensor fusion logic to stabilize heading estimation under intermittent disturbances.

**Autonomy and Motion Control**
- Developed the up/downwind autonomous navigation logic, including thresholding for wind angle transitions and recovery behavior.
- Tuned servo and stepper control loops for turning and course correction with reduced overshoot in wave conditions.

**Data and Reliability Engineering**
- Built an end-to-end raw data pipeline from firmware logs to a Python processing database.
- Standardized filename conventions, metadata tags, and field-run checkpoints to speed post-processing.

### Field Execution and Results
- Conducted and analyzed 50+ ocean tests; each run validated telemetry reliability, control stability, and sensor behavior under changing wind.
- Identified and fixed recurring control/estimation failure modes using run-level postmortems.
- Submitted intellectual property under the title **PowerCab: A Multimodal Mobile Sea-based Power Generation and Delivery**.
- Presented CAPTAIN to the UC Berkeley Vice Chancellor for Research (VCR) during prototype evaluation.

### Outcomes
- Top 20 placement in the U.S. Department of Energy "Power at the Sea Prize."
- Operational prototype with a repeatable control and data-feedback loop suitable for next-stage scaling.

### Prototype and Pitch

<div style="display: grid; grid-template-columns: repeat(auto-fit, minmax(300px, 1fr)); gap: 20px; margin: 20px 0;">
  <img src="/images/TAF_Lab_1.jpeg" alt="TAF Lab Team Photo 1" style="width: 100%; max-width: 100%; height: auto; border-radius: 8px; box-shadow: 0 4px 12px rgba(0,0,0,0.1); object-fit: contain;">
  <img src="/images/TAFlab_lolus.jpeg" alt="TAF Lab Lolus" style="width: 100%; max-width: 100%; height: auto; border-radius: 8px; box-shadow: 0 4px 12px rgba(0,0,0,0.1); object-fit: contain;">
</div>

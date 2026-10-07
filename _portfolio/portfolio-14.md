---
layout: project
track: class
org: "ME102B, UC Berkeley"
title: "Robotic Fish: A Damped-Sine Tail on One DC Motor"
excerpt: "An ME102B mechatronics robotic fish: an ESP32 control panel drives two servo pectoral fins and a DC-motor tail whose spine is bent to a damped sine wave. Second place at the course design showcase."
deck: "An ME102B robotic fish with three actuators: two servos angle the pectoral fins for steering, and one DC motor drives the whole tail by turning a rod bent to a damped sine wave. I designed the tail mechanism; the fish took second place at the course design showcase."
collection: portfolio
category: class
supporting: true
date: 2024-12-01
role: "Tail mechanism design"
duration: "Fall 2024"
team: "ME102B (Mechatronics Design) course team, UC Berkeley"
tech_tags: ["Mechatronics", "ESP32", "Servo Control", "DC Motor Drive", "Finite State Machine", "CAD", "3D Printing"]
tools: "ESP32, motor driver, voltage regulator, two servo motors, DC motor, LiPo battery, potentiometers and push buttons, CAD, 3D printing"
impact: "Second place at the ME102B design showcase for a tail built on a damped-sine spine"
share: false
teaser: "me102b/assembly.jpg"
header:
  teaser: "me102b/assembly.jpg"
hero:
  image: "me102b/assembly.jpg"
  alt: "The assembled robotic fish held up in two hands, with the rod-mount tail at the rear"
  caption: "**The full assembly.** Printed body with dorsal and pectoral fins at the front, and the tail's chain of rod mounts at the rear (report Figure 1)."
stats:
  - { value: "2nd place", label: "ME102B design showcase" }
  - { value: "3", label: "actuators: 2 servos, 1 DC motor" }
  - { value: "3", label: "control states" }
steps:
  - { label: "Input", title: "Control panel", text: "An ESP32 reads three knobs (left fin, right fin, tail) and two mode buttons, and shows the mode on a red and a blue LED." }
  - { label: "Power", title: "Driver + regulator", text: "A motor driver runs the DC motor, and a voltage regulator steps the battery voltage down for the servos." }
  - { label: "Steering", title: "Pectoral fins", text: "Two servo motors angle the left and right pectoral fins, either independently or linked." }
  - { label: "Thrust", title: "Tail", text: "The DC motor turns a rod bent to a damped sine curve, threaded through a chain of rod mounts." }
media:
  design:
    - { image: "me102b/fig18_top_view.jpg", caption: "**Side view.** The printed body with the dorsal fin on top, a pectoral fin, and the rod mounts that grow taller toward the tail tip." }
    - { image: "me102b/fig18_section_view.jpg", caption: "**Section view.** Servo, electronics, and motor mount packed inside the body, with the curved rod running out through the mounts." }
  electronics:
    - { image: "me102b/fig03_control_board.jpg", caption: "**Control board (Figure 3).** ESP32, the State 0/1 and State 1/2 buttons, left and right pectoral fin knobs, the tail knob, and the red and blue mode LEDs." }
    - { image: "me102b/fig04_circuit.jpg", caption: "**Circuit (Figure 4).** The ESP32, potentiometers, buttons, and LEDs sit on the breadboards, and the ESP32 drives the two servos and, through the motor driver, the DC motor. A voltage regulator steps the battery voltage down for the servos." }
---

<p class="pj-lede">A common robotic-fish tail is a chain of servos, one per segment, each with its own control signal. I designed a tail that runs on one DC motor: its spine is a rod bent to a damped sine wave, so the wave is built into the part and the motor only turns it. Two servo-driven pectoral fins bring the total to three actuators, and the fish took second place at the ME102B design showcase.</p>

{% include pj/steps.html items=page.steps %}

## Design overview

The body is a printed shell with a dorsal fin, two pectoral fins, and a rear motor mount. Behind it, the curved tail rod runs through a row of rod mounts.

{% include pj/figure.html src="me102b/fig18_render.jpg" narrow=true caption="**Complete design (Figure 18).** CAD render of the body, fins, and tail assembly." %}

{% include pj/grid.html items=page.media.design cols=2 class="pj-grid--natural" %}

## The tail: a damped sine built into the rod

I based the tail on a sine wave whose amplitude decays with \\(x\\):

$$
y = \sin(\pi x)\, e^{-x}
$$

The rod uses only the section from \\(x \approx 2.4\\) to \\(5\\) (Figure 6, left), where the oscillation is gentle enough for a solid rod.

{% include pj/figure.html src="me102b/fig06_tail_equation.jpg" wide=true caption="**Tail equation (Figure 6).** The damped sine \\(y = \sin(\pi x)\,e^{-x}\\): a zoomed section on the left, the full curve on the right." %}

| Rod section (Figure 6 units) | Value |
|---|---|
| Span | \\(x = 2.4\\) to \\(5\\): 1.3 periods of \\(\sin \pi x\\), from a crest to a zero crossing |
| Peaks | \\(y \approx +0.086, -0.032, +0.012\\) at \\(x \approx 2.4, 3.4, 4.4\\), each \\(e^{-1} \approx 0.37\\) times the previous |

## Rod and mounts

A coupler at the rod's base connects it to the DC motor inside the body.

{% include pj/figure.html src="me102b/fig07_tail_cad.jpg" wide=true caption="**Tail rod (Figure 7).** The rod modeled from the tail equation, with the motor coupler at the left." %}

As the motor turns the rod, its curve sweeps through a chain of rod mounts, which carry the motion to the tail tip.

{% include pj/figure.html src="me102b/fig08_rod_mounts.jpg" wide=true caption="**Rod mounts (Figure 8).** Front view of the tail and mounts (left) and an isometric view of the mounts (right)." %}

## Inside the body

{% include pj/figure.html src="me102b/fig02_interior.jpg" side=true caption="**Fish interior (Figure 2).** Motor driver, voltage regulator, two servo motors, and LiPo battery in the main cavity, with the DC motor in the rear section (right-hand photo)." %}

## Electronics and control

The control board sits outside the fish.

{% include pj/grid.html items=page.media.electronics cols=2 class="pj-grid--natural" %}

## Firmware: a three-state machine

Two buttons switch states, and in both moving states the ESP32 reads the knobs and drives the two servos and the DC motor.

{% include pj/figure.html src="me102b/fig05_state_machine.jpg" caption="**State transition diagram (Figure 5).** Idling, moving with independent pectoral fins, and moving with linked pectoral fins." %}

| State | Entered by | LED | Motion |
|---|---|---|---|
| Idling | Power-up; left button from either moving state | Off | None; DC motor off |
| Independent fins | Left button from Idling; right button from Linked | Red | Each fin follows its own knob; tail follows the tail knob |
| Linked fins | Right button from Independent | Blue | Fins move together; tail follows the tail knob |

## Result

The fish took **second place at the ME102B design showcase**.

## Documents

All figures are from the team's ME102B final report (Figures 1–8 and 18).

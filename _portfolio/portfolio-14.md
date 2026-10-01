---
layout: project
track: class
org: "ME102B, UC Berkeley"
title: "Robotic Fish: A Damped-Sine Tail on One DC Motor"
excerpt: "An ME102B mechatronics robotic fish: an ESP32 control panel drives two servo pectoral fins and a DC-motor tail whose spine is bent to a damped sine wave. Second place at the course design showcase."
deck: "A mechatronics robotic fish built for ME102B. An ESP32 control panel steers two servo-driven pectoral fins and a tail whose spine is a rod bent to a damped sine wave, turned by a single DC motor. The design took second place at the course design showcase."
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

<p class="pj-lede">A common way to build a robotic fish tail is a chain of servos, one per segment, each needing its own control signal. This design moves the whole tail with one DC motor instead. The tail's spine is a rod bent to a damped sine wave, so the shape of the wave is built into the part, and the motor only has to turn it. Two servo-driven pectoral fins handle steering, and an ESP32 control panel switches between three operating modes.</p>

{% include pj/steps.html items=page.steps %}

## The design

The body is a printed shell with a dorsal fin, two pectoral fins, and a motor mount at the rear. Behind it, the tail is a row of rod mounts that grow taller toward the tip, with the curved rod running through all of them.

{% include pj/figure.html src="me102b/fig18_render.jpg" narrow=true caption="**Complete design (Figure 18).** CAD render of the body, fins, and tail assembly." %}

{% include pj/grid.html items=page.media.design cols=2 class="pj-grid--natural" %}

## The tail: a damped sine built into the part

The tail profile comes from one equation, a sine wave that decays along its length:

$$
y = \sin(\pi x)\, e^{-x}
$$

The right-hand plot in Figure 6 shows the full curve. The left-hand plot zooms into the section between \\(x \approx 2.4\\) and \\(5\\), where the oscillation is gentle enough to follow with a solid rod.

{% include pj/figure.html src="me102b/fig06_tail_equation.jpg" wide=true caption="**Tail equation (Figure 6).** The damped sine \\(y = \sin(\pi x)\,e^{-x}\\): a zoomed section on the left, the full curve on the right." %}

That curve became the tail rod in CAD. A coupler at the base connects it to the DC motor inside the body.

{% include pj/figure.html src="me102b/fig07_tail_cad.jpg" wide=true caption="**Tail rod (Figure 7).** The rod modeled from the tail equation, with the motor coupler at the left." %}

The rod passes through a chain of rod mounts. As the motor turns the bent rod, its curve sweeps through the mounts, and the mounts carry that motion out to the tail tip.

{% include pj/figure.html src="me102b/fig08_rod_mounts.jpg" wide=true caption="**Rod mounts (Figure 8).** Front view of the tail and mounts (left) and an isometric view of the mounts (right)." %}

## Inside the body

The body carries the power and actuation hardware: the motor driver, the voltage regulator, two servo motors, the LiPo battery, and the DC motor at the tail end.

{% include pj/figure.html src="me102b/fig02_interior.jpg" side=true caption="**Fish interior (Figure 2).** Motor driver, voltage regulator, two servo motors, and LiPo battery in the main cavity, with the DC motor in the rear section (right-hand photo)." %}

## Electronics and control

The control board sits outside the fish. Three knobs set the left fin, right fin, and tail, two buttons change the operating mode, and a red and a blue LED show which mode is active.

{% include pj/grid.html items=page.media.electronics cols=2 class="pj-grid--natural" %}

The firmware is a three-state machine. Buttons move between states, and in either moving state the ESP32 keeps reading the knobs and driving the servos and the DC motor.

{% include pj/figure.html src="me102b/fig05_state_machine.jpg" caption="**State transition diagram (Figure 5).** Idling, moving with independent pectoral fins, and moving with linked pectoral fins." %}

| State | How you get there | LEDs | What moves |
|---|---|---|---|
| Idling | Power-up, or the left button from either moving state | Off | Nothing; the DC motor is off |
| Independent pectoral fins | Left button from Idling, or right button from Linked | Red on | Each fin follows its own knob; the tail follows the tail knob |
| Linked pectoral fins | Right button from Independent | Blue on | Both fins move together; the tail follows the tail knob |

## Result

The robotic fish took **second place at the ME102B design showcase**. The tail was the distinctive part: one motor and one shaped rod drive the whole tail, instead of a chain of individually controlled actuators.

## Documents

The figures on this page are taken from the team's ME102B final report:

- Figure 1: full assembly
- Figure 2: fish interior
- Figure 3: control board
- Figure 4: circuit diagram
- Figure 5: state transition diagram
- Figure 6: tail equation
- Figure 7: tail rod CAD
- Figure 8: rod mounts
- Figure 18: overview of the complete design

---
layout: project
track: class
org: "ENGIN 283, UC Berkeley"
title: "Caliber: Finding 500+ Student Projects in One Place"
excerpt: "An MVP that extracts skills and topics from 500+ UC Berkeley student projects and links them in a searchable knowledge graph."
deck: "A knowledge graph of 500+ UC Berkeley student projects: Caliber extracts each project's skills and topics, links projects by semantic similarity, and answers free-text questions in a chat panel."
collection: portfolio
category: class
date: 2025-12-01
role: "ENGIN 283: AI Startup"
duration: "Fall 2025"
team: "Meenakshi Mittal, Seongjae Ahn"
tech_tags: ["Product Design", "Information Architecture", "React"]
tools: "React, information architecture, metadata schema design"
supporting: true
share: false
teaser: "caliber_pg1.png"
header:
  teaser: "caliber_pg1.png"
stats:
  - { value: "500+", label: "projects uploaded" }
  - { value: "30+", label: "students and alumni interested" }
links:
  - { label: "Pitch deck (PPTX)", url: "/images/Caliber%20Final%20Pitch.pptx" }
hero:
  image: "caliber_pg1.png"
  alt: "Caliber Explore view: a chat panel on the left, a knowledge graph of student projects in the center, and the Little Drummer Bot report open on the right"
  caption: "**Caliber Explore.** Projects laid out as a similarity graph, with a chat panel that answers questions about them and a side panel that opens the selected project's report."
media:
  demo:
    - { video: "caliber_demo_part1.mp4", poster: "caliber_pg1.png", preload: "none", caption: "**Demo, part 1.** Browsing the similarity graph and opening project reports." }
    - { video: "caliber_demo_part2.mp4", poster: "caliber_pg2.png", preload: "none", caption: "**Demo, part 2.** Adjusting the similarity threshold and asking the chat for \"robotic animals\", which lists three projects and opens one." }
---

<p class="pj-lede">Berkeley student projects are scattered across GitHub, PDFs, personal sites, CAD files, and archives. Meenakshi Mittal and I built Caliber, an MVP that puts 500+ open-source projects in one searchable knowledge graph so students and alumni can find and reuse them.</p>

## Discovery design

I designed the discovery and metadata architecture. The interface pairs the graph with a discipline filter (All, Mechanical, CS), chat search, and a report panel.

{% include pj/figure.html src="caliber_front.png" wide=true caption="**Search by chat.** Queries such as robot, fish, and wire return matching projects in the chat, and selecting one opens its report in the side panel." %}

## Similarity linking

Caliber normalizes project data and links projects \\(i\\) and \\(j\\) when their semantic similarity \\(s_{ij} \ge \tau\\). Raising the similarity threshold \\(\tau\\) from 0.20 to 0.64 (demo, part 2) prunes the weaker links.

{% include pj/figure.html src="caliber_pg2.png" wide=true caption="**Similarity map.** Clusters of related projects, with the chat summarizing the top matches for a query." %}

## Results

{% include pj/grid.html items=page.media.demo cols=2 %}

By our December 4, 2025 pitch, 30+ students and alumni, 2 professors, and 1 student club had expressed interest, and we were in talks with 1 department. We revised copy, taxonomy, and information flow based on user feedback.

## Next steps

Metadata logic is separate from presentation, so file management can be added later. Caliber is free to start and will charge campus subscriptions once it has enough users.

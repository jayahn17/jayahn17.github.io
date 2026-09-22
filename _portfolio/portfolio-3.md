---
layout: project
track: class
org: "ENGIN 283, UC Berkeley"
title: "Caliber: Finding 500+ Student Projects in One Place"
excerpt: "A campus-scale platform prototype for surfacing and organizing 500+ UC Berkeley student projects through searchable metadata and a cleaner browsing experience."
deck: "A discovery platform for UC Berkeley open-source student work: one metadata schema, category and technology filters, and consistent project pages so that reusable work stops getting lost."
collection: portfolio
category: class
date: 2025-12-01
role: "ENGIN 283: AI Startup"
duration: "Fall 2025"
tech_tags: ["Product Design", "Information Architecture", "React"]
tools: "React, information architecture, metadata schema design"
supporting: true
share: false
teaser: "caliber_pg1.png"
header:
  teaser: "caliber_pg1.png"
links:
  - { label: "Pitch deck (PPTX)", url: "/images/Caliber%20Final%20Pitch.pptx" }
hero:
  image: "caliber_pg1.png"
  alt: "Caliber landing page"
  caption: "**Landing page.** Projects are surfaced as cards with consistent metadata, so browsing and comparing work takes seconds instead of a search across scattered repositories."
media:
  demo:
    - { video: "caliber_demo_part1.mp4", poster: "caliber_pg1.png", preload: "none", caption: "**Demo, part 1.** Browsing and filtering." }
    - { video: "caliber_demo_part2.mp4", poster: "caliber_pg2.png", preload: "none", caption: "**Demo, part 2.** Project detail pages and contributor flow." }
---

<p class="pj-lede">Undergraduate project work at Berkeley was scattered, difficult to browse, and easy to miss. Caliber, built in ENGIN 283 (AI Startup), reduces discovery time for students, alumni, and collaborators looking for reusable work.</p>

## The challenge

- Consolidate 500+ projects into a consistent browsing system.
- Design fast discovery workflows through filtering, categorization, and clear presentation.
- Prepare a scalable product foundation that could later support file-management features.

## Information architecture

I defined the metadata schema used for project cards, search indexing, and detail pages, and designed a responsive UI with a clear visual hierarchy across devices. Discovery is driven by category- and technology-based filters rather than free-text search alone.

{% include pj/figure.html src="caliber_front.png" wide=true caption="**Project cards.** Every card is generated from the same schema, so technical metadata stays readable and comparable across hundreds of projects." %}

## Data management

Project ingestion and normalization were structured so contributor submissions used consistent fields, with display controls to keep technical metadata legible. Metadata logic is separated from presentation components to prepare for future file-management features.

{% include pj/figure.html src="caliber_pg2.png" wide=true caption="**Detail page.** One layout for every project, populated from the ingested metadata." %}

## Demo

{% include pj/grid.html items=page.media.demo cols=2 %}

## Results

- A searchable interface for 500+ UC Berkeley open-source projects.
- Less manual discovery effort through structured cards and consistent project detail pages.
- An extensible foundation for future workflow features, including file management.
- A final pitch deck built and shared with stakeholders, with copy, taxonomy, and information flow iterated on user feedback.

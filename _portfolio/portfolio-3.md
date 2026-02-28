---
title: "Caliber - UC Berkeley Open Source Project Discovery Platform"
excerpt: "A campus-scale platform prototype for surfacing and organizing 500+ UC Berkeley student projects with searchable metadata."
collection: portfolio
category: class
date: 2025-12-01
share: false
teaser: "caliber_pg1.png"
header:
  teaser: "caliber_pg1.png"
---

## Caliber - Open Source Projects at UC Berkeley

### Project Context
Caliber was built in ENGIN 283 (AI Startup) to solve a practical product problem: how to make undergraduate project outcomes discoverable across a large community. The goal was to reduce time-to-discovery for peers, alumni, and collaborators searching for reusable work.

### Challenge
- Consolidate 500+ projects into a consistent browsing system.
- Design fast discovery workflows (filtering, categorization, readability).
- Prepare a scalable frontend foundation that could later support file management.

### Product and Technical Approach
**Frontend and Information Architecture**
- Defined key metadata schema used for project cards, search indexing, and detail pages.
- Designed a responsive UI for multi-device access and consistent visual hierarchy.
- Prioritized low-friction discovery with category and technology-driven filters.

**Data Management**
- Structured project ingestion and normalization for consistent fields across contributors.
- Added display controls to keep technical metadata readable and comparable.
- Prepared the platform for future file-management features by separating metadata logic from presentation components.

**Validation and Communication**
- Built and shared a final pitch deck for stakeholders.
- Ran rapid iterations on copy, taxonomy, and information flow based on feedback.

### Results
- Delivered a searchable interface for 500+ UC Berkeley open source projects.
- Reduced manual discovery effort through structured cards and project detail consistency.
- Created an extensible foundation for future workflow features (including file management planning).

### Final Pitch Deck

<div style="text-align: center; margin: 20px 0; padding: 20px; background: #f5f7fa; border-radius: 8px; border: 1px solid #e2e8f0;">
  <p style="margin: 0 0 12px 0; font-size: 1rem;"><strong>Caliber Final Pitch</strong> (PowerPoint)</p>
  <a href="/images/Caliber%20Final%20Pitch.pptx" download class="btn btn--primary" style="display: inline-block; padding: 10px 20px; background: #4a9eff; color: white; text-decoration: none; border-radius: 6px; font-weight: 600;">Download pitch deck</a>
</div>

<div style="text-align: center; margin: 16px 0;">
  <img src="/images/caliber_front.png" alt="Caliber Front" style="width: 100%; max-width: 800px; height: auto; border-radius: 8px; box-shadow: 0 4px 12px rgba(0,0,0,0.1); object-fit: contain;">
</div>

### Demo Video

<p><em>Note: Due to 50MB file size limit, the demo video is split into two parts.</em></p>

<div style="display: flex; justify-content: center; gap: 20px; margin: 20px 0; flex-wrap: wrap;">
  <video width="100%" controls muted playsinline style="max-width: 500px; border-radius: 8px; box-shadow: 0 4px 12px rgba(0,0,0,0.1);" onloadedmetadata="this.currentTime=0">
    <source src="/images/caliber_demo_part1.mp4" type="video/mp4">
    Your browser does not support the video tag.
  </video>
  <video width="100%" controls muted playsinline style="max-width: 500px; border-radius: 8px; box-shadow: 0 4px 12px rgba(0,0,0,0.1);" onloadedmetadata="this.currentTime=18">
    <source src="/images/caliber_demo_part2.mp4" type="video/mp4">
    Your browser does not support the video tag.
  </video>
</div>

<script>
  // Auto-play videos when they come into view
  document.addEventListener('DOMContentLoaded', function() {
    const videos = document.querySelectorAll('video[controls]');
    
    const observer = new IntersectionObserver((entries) => {
      entries.forEach(entry => {
        if (entry.isIntersecting) {
          entry.target.play().catch(e => {
            // Autoplay was prevented, user interaction required
            console.log('Autoplay prevented:', e);
          });
        } else {
          entry.target.pause();
        }
      });
    }, {
      threshold: 0.5 // Play when 50% of video is visible
    });
    
    videos.forEach(video => {
      observer.observe(video);
    });
  });
</script>

### Platform Screenshot

<div style="display: flex; justify-content: center; margin: 20px 0;">
  <img src="/images/caliber_pg2.png" alt="Caliber Platform Screenshot" style="width: 100%; max-width: 1000px; height: auto; border-radius: 8px; box-shadow: 0 4px 12px rgba(0,0,0,0.1); object-fit: contain;">
</div>

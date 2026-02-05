---
title: "Caliber - Open Source Platform for Student Projects"
excerpt: "Open source projects in UC Berkeley <br/><img src='/images/caliber_pg1.png' style='max-width: 50%;'>"
collection: portfolio
category: class
date: 2025-12-01
share: false
---

## Caliber - Open Source Projects at UC Berkeley

### Project Overview

<div style="text-align: center; margin: 16px 0;">
  <img src="/images/caliber_front.png" alt="Caliber Front" style="width: 100%; max-width: 800px; height: auto; border-radius: 8px; box-shadow: 0 4px 12px rgba(0,0,0,0.1); object-fit: contain;">
</div>

Caliber is a platform featuring 500+ open source projects from UC Berkeley, showcasing the innovative work and contributions from the UC Berkeley community. Currently in the development phase, we are conducting use-case research and expanding to include file management features. This project originated from ENGIN 283 - AI Startup Course.


### Demo Video

<p><em>Note: Due to 50MB file size limit, the demo video has been divided into two sections.</em></p>

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

**Frontend Development:**
- Developed responsive web interface for browsing and searching through 500+ open source projects
- Implemented user-friendly navigation and filtering systems to help users discover relevant projects
- Created visually appealing project cards and detail pages with consistent design language

**Platform Features:**
- Built search and categorization functionality to organize projects by technology stack, domain, and category
- Integrated project metadata display including descriptions, technologies used, and links to repositories
- Designed and implemented the main landing page and project showcase interface

**Data Management:**
- Worked on data pipeline to aggregate and organize project information from various sources
- Ensured consistent data formatting and presentation across all project entries



### Key Features

- Comprehensive collection of currently 500+ open source projects
- Community-driven platform for the UC Berkeley community
- Showcasing innovative work from UC Berkeley students and researchers

<!-- ### Presentation

<div style="position: relative; padding-bottom: 56.25%; height: 0; overflow: hidden; max-width: 60%; margin: 20px 0;">
  <iframe style="position: absolute; top: 0; left: 0; width: 100%; height: 100%;" 
          src="https://docs.google.com/presentation/d/1O-A3STddmSCpnOkwsQuVuAJRZFTy298NqqmlJJ5ldtg/preview" 
          frameborder="0" 
          allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture" 
          allowfullscreen>
  </iframe>
</div> -->

### Project Photos

<div style="display: flex; justify-content: center; margin: 20px 0;">
  <img src="/images/caliber_pg2.png" alt="Caliber Platform Screenshot" style="width: 100%; max-width: 1000px; height: auto; border-radius: 8px; box-shadow: 0 4px 12px rgba(0,0,0,0.1); object-fit: contain;">
</div>


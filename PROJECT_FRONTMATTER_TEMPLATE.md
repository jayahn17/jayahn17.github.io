# Project page template (research-post style)

Every file in `_portfolio/` uses `layout: project`. The layout renders, in order:
title block → hero media → key numbers → the narrative body → team/tools/links → "More projects".
The body is written like a short research post: a lede that states the problem and the punchline,
then sections that each pair two to four paragraphs with one captioned figure, clip, or grid.

```yaml
---
layout: project
track: research            # research | industry | class | team  (decides the /projects/ section)
org: "ICON Lab, UC Berkeley"
title: "Project Title"
excerpt: "One-sentence summary for cards."
deck: "One or two sentences under the title. Say what was built and the strongest result."
collection: portfolio
category: work             # legacy key, still read by /portfolio/
date: 2025-11-01
role: "Your role"
duration: "May 2025 – Present"
team: "Names, or the lab / course group"
tools: "Comma-separated tool list shown in the footer"
tech_tags: ["Python", "ROS"]   # legacy key, still read by /portfolio/
featured: true             # featured projects are preferred in "More projects"
teaser: "poster.png"       # legacy card image for /portfolio/
header: { teaser: "poster.png" }
card_video: true           # /projects/ rows loop hero.video when it is small (< ~1 MB)
card_image: "alt.png"      # optional override for the card image
links:
  - { label: "Code", url: "https://github.com/..." }
hero:                      # one of video / image / youtube
  video: "clip.mp4"
  webm: "clip.webm"        # optional
  poster: "poster.png"
  autoplay: true           # muted, looping, no controls. Leave off for clips over ~5 MB.
  preload: "none"          # for large clips with controls
  caption: "**Bold lead.** What the reader should look at."
stats:
  - { value: "≥ 95%", label: "per-skill success" }
steps:                     # optional pipeline strip, rendered with pj/steps.html
  - { label: "Stage 1", title: "Capture", text: "..." }
media:                     # named grids, rendered with pj/grid.html
  results:
    - { video: "a.mp4", poster: "a.png", autoplay: true, caption: "**Stage 1.** ..." }
    - { image: "b.png", caption: "..." }
    - { youtube: "VIDEOID", caption: "..." }
---
```

Body building blocks (all in `_includes/pj/`):

```liquid
<p class="pj-lede">Problem, approach, and punchline in three sentences.</p>
{% include pj/steps.html items=page.steps %}
{% include pj/figure.html src="diagram.png" wide=true caption="**Figure lead.** Explanation." %}
{% include pj/video.html src="clip.mp4" poster="poster.png" autoplay=true caption="..." %}
{% include pj/grid.html items=page.media.results cols=2 %}
{% include pj/youtube.html id="VIDEOID" caption="..." %}
```

Rules that keep the pages consistent:
- One caption style everywhere: a bold lead phrase, then one or two plain sentences.
- Media sits next to the paragraph that explains it, never in a gallery at the end.
- Short clips autoplay muted and loop; anything large gets a poster, controls, and `preload: "none"`.
- Numbers go in `stats` or in a table, not in prose.
- Paths are filenames under `images/` (subfolders such as `posters/x.jpg` are fine).

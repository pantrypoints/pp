---
title : "Tech Docs"
description: "Tech Resources"
lead: ""
date: 2020-10-06T08:48:23+00:00
lastmod: 2020-10-06T08:48:23+00:00
image: "/photos/code.jpg"
draft: true
---



Deinterlacing:

Function: Interlaced video captures frames in two fields, typically top field first (TFF) or bottom field first (BFF). Deinterlacing combines these fields to create a full progressive frame suitable for display on modern screens.
Settings: Shotcut offers various deinterlacing methods in the Export tab under Video > Deinterlacer. Common options include:
None: Skips deinterlacing, potentially resulting in combing artifacts (flickering interlacing lines) if the video source is interlaced.
Yadif: A popular method offering good quality and balancing between bob (duplicating fields) and weave (averaging fields) techniques. It comes with additional options for finer control.
Others: Shotcut provides other methods like "Blend," "Marli," etc., each with its own strengths and weaknesses for specific interlacing types.
Interpolation:

Function: Interpolation creates new frames in between existing ones. This can be helpful in two scenarios:
Deinterlacing: When deinterlacing creates a full progressive frame from two interlaced fields, some information might be lost. Interpolation can attempt to reconstruct missing details, potentially improving smoothness.
Frame rate conversion: If you're changing the video's frame rate (e.g., from 24fps to 30fps), interpolation creates additional frames to achieve the new rate.
Settings: Shotcut offers various interpolation methods in the Export tab under Video > Interpolation. Common options include:
None: No interpolation, potentially resulting in choppy playback when changing frame rates.
Linear: A basic method that creates new frames by averaging the existing ones.
Lanczos: A more sophisticated method offering smoother interpolation but potentially introducing ringing artifacts (ghosting around sharp edges).
Others: Shotcut provides other methods like "Nearest Neighbor" and "Cubic" with varying levels of complexity and potential artifacts.
Choosing the right settings:

Deinterlacing: If your source video is interlaced, choose a suitable deinterlacing method based on the type of interlacing (TFF or BFF) and the desired quality/performance balance. "Yadif" is a good starting point.
Interpolation:
For deinterlacing: Experiment with interpolation methods (e.g., "Linear" or "Lanczos") to see if it improves smoothness without introducing artifacts.
For frame rate conversion: Use interpolation (e.g., "Lanczos") to create smoother playback at the new frame rate, but be mindful of potential artifact


. GOP (Group of Pictures):

Function: A GOP is a group of frames in a video treated as a unit for encoding. It defines how often a full I-frame (containing all information for a single image) appears in the video sequence.
Settings: Shotcut doesn't have a direct GOP size setting, but it can be influenced by video format and other export settings. Generally, longer GOPs lead to smaller file sizes but potentially lower quality due to relying more on predicted changes between frames (B-frames) for intermediate frames.
Impact: A shorter GOP (more frequent I-frames) offers better quality, especially for fast-paced scenes with frequent changes, but increases file size. Conversely, a longer GOP reduces file size but might introduce compression artifacts and blurry motion in fast-moving scenes.
3. B-frames:

Function: B-frames are intermediary frames used for compression. They store only the difference between the previous (reference) frame and the next frame, resulting in smaller file sizes.
Settings: Shotcut doesn't offer direct control over B-frames, but their usage is typically tied to the chosen video format and other export settings.
Impact: More B-frames can significantly reduce file size, but they also contribute to compression artifacts if overused. Finding a balance depends on your priorities: smaller file size with potential quality reduction, or larger file size with better quality.
4. Rate Control:

Function: This setting determines how efficiently the video encoder allocates bits (data) throughout the video for compression. It affects both file size and quality.
Settings: Shotcut offers various rate control options like "Constant Bitrate (CBR)" or "Variable Bitrate (VBR)."
CBR: Maintains a consistent bitrate throughout the video, resulting in a predictable file size but potentially sacrificing quality in high-motion scenes (needs more data for accurate representation).
VBR: Adjusts the bitrate dynamically based on the video content. It allocates more bits for complex scenes and fewer for simpler ones, offering better quality but potentially leading to a slightly larger file size compared to CBR.



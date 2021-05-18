---
title: "Safari overflow"
date: 2021-05-18T13:06:22+08:00
description: "A fix for when a page rendered in safari overflows horizontally."
tags: [Safari, HTML, Meta Tags]
# featured_image: "/images/notebook.jpg"
categories: Tips
comment : false
---

## Motivation
I encountered this situation where Safari's display would overflow when the keyboard shows up. This ruins the whole page even when the elements have a width of 100% and body has and overflow-x hidden set.

## Solution
In head, add a meta tag for viewport like

> meta name="viewport" content="width=device-width,initial-scale=1,maximum-scale=1,user-scalable=0">

**width** would set the viewport's width to that of the device's width.
**initial-scale** makes sure the zoom level is initially set to 1 (100%).
**maximum-scale** prevent's zooming beyond 100%.
**user-scalable** disallows the device to zoom in or out.
**minimum-scale** though not included in the fix. I just added it here for completeness. This sets the minimum amount of zooming the can be done for the device.

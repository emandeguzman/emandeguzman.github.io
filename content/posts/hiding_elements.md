---
title: "Different ways of hiding elements"
date: 2021-05-18T15:50:28+08:00
description: "Different ways to hide an element and its effect on DOM"
tags: [CSS]
# featured_image: "/images/notebook.jpg"
categories: Knowledgebase
comment : false
reference: https://css-tricks.com/comparing-various-ways-to-hide-things-in-css/
---



| Method             | read by<br> screen reader  | affects<br>document layout  | rendered  | responds<br> to events
|---                 |:---:                       |:---:                        |:---:      |:---: 
| display: none      | no                         | no                          | no        | no 
| visibility=hidden  | no                         | yes                         | yes       | no
| opacity=0          | yes                        | yes                         | yes       | yes
| position=absolute  | yes                        | no                          | yes       | yes

---
title: Website
description: Setting up this website
tags:
  - website
categories:
  - general
draft: false  # change to false when time to publish
---

The point of this website is to keep track of our captured flags and the things we've learned at [defcon28](https://defcon.org).<!--more--> We are all doing this remotely, so it makes sense for us to have somewhere to put it all. Also, if we do end up doing pretty well in a CTF we need to have proof of the capture, including how we did it. This should accomplish that.

This website is generated using [Hugo](https://gohugo.io) and deployed using [GitHub actions](https://github.com/features/actions) to [GitHub Pages](https://pages.github.com/). This entire process is configured to be completely automated. Here is the process flow of making a new post

1. Create new post using hugo command. `hugo new post/example-new-post.md`
2. Write post and commit it to a branch in the [website repository](https://github.com/weslack/website)
3. Create a pull request and have someone else on the team review it
4. Merge pull request
5. GitHub action automatically builds the website using Hugo and deploys it to the [weslack.github.io repository](https://github.com/weslack/weslack.github.io)
6. GitHub deploys all new changes to the [weslack.github.io repository](https://github.com/weslack/weslack.github.io) master branch to [weslack.github.io](https://weslack.github.io) which also points to [weslack.team](https://weslack.team).

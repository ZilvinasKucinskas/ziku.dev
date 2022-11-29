---
title: "Building Personal Website with Bridgetown"
description: "My personal website - ziku.dev has launched. Let's take a look what is under the hood."
tags:
  - ruby
  - bridgetown
categories: tech
date: "2022-09-18 20:49:53 +0300"
last_modified_at: "2022-09-18 20:49:53 +0300"
---

## Technical Stack

1. [Bridgetown](https://www.bridgetownrb.com)
2. [TailwindCSS](https://tailwindcss.com/)
3. [ViewComponent](https://viewcomponent.org/)
4. [Turbo](https://turbo.hotwired.dev/)
5. [Stimulus](https://stimulus.hotwired.dev/)

[Bridgetown](https://www.bridgetownrb.com) does most of the heavy lifting on this site - it’s a Ruby based static site generator.

I am using [Tailwind CSS](https://tailwindcss.com/) and [ViewComponent](https://viewcomponent.org/) to build and design the UI. All posts are written in [Kramdown flavored markdown](https://kramdown.gettalong.org) with ViewComponent's sprinkled in. [Turbo](https://turbo.hotwired.dev/) helps making the website feel like a Single Page Application (SPA) by preventing full page reloads.

Under the hood, [esbuild](https://esbuild.github.io/) is handling asset bundling. I use almost no JavaScript on this site, but I have sprinkled [Stimulus](https://stimulus.hotwired.dev/) here and there for small interactions.

## Deployment

The site is hosted on [Vercel](https://vercel.com/) and all pushes to the main branch trigger a deploy. I also use [AWS Route53](https://aws.amazon.com/route53/) for DNS and domain management.

## Tracking

I am using [Vercel Analytics](https://vercel.com/analytics). It is privacy-friendly, real-time traffic insights solution. This helps be compliant with GDPR, therefore there is no need to display a cookie banner.

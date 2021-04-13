---
layout: post
title: "Rango - A Web Directory for anything."
description: Project made while learning Django.
toc: true
comments: false
image: images/rango-logo.png
hide: false
search_exclude: false
categories: [django, weekend-project]
---

{% include info.html text="https://pseudocodenerd.pythonanywhere.com/" %}

## How it all started ?

I always wanted to learn backend web development to compliment the *front-end only* websites I built to make them *more dynamic, interactive and complex* (?). I initially experimented with [ExpressJS](https://expressjs.com/) but came to the conclusion that I lacked enough JS knowledge to make complex stuff in/with it. Later, a friend of mine suggested me to try Ruby on Rails (through [The ODIN Project](https://www.theodinproject.com/courses/ruby-on-rails) of course) but I never quite understod the Model-View-Controller design pattern / approach it advocated. Also, I remained hesitant to get the Ruby syntax into my framework.

## Enter Django.
*initially Flask for me though.*

I was pretty good with python and the thought of using it in my websites to implement logic was *sweet*. At this time, I was only beginning to read through the official docs when another good friend of mine told me about this book ([Tango with Django](https://www.tangowithdjango.com/)) to learn Django and how **awesome** and practical it was in teaching Django from the groundup.

I had never ***read* a book** for the sake of learning some new tech and was really curious as to how things would be. I had plenty of time to devote to learning Django as my Junior Year had just ended and we had a month long break until Senior Year started. So I started reading the book...

And Oh Boy! it was really EPIC. It provided **just the right amount of theory** in each meticulously divided chapter to cover all of Django and also had exercises to implement what we had learnt in each chapter and even a **testing script** to check our implementation. It *made the learning curve way easier than what the official docs offered*. Enough about the book, let's dive into what I did over my ~3 week journey.

## Stuff Learnt.
I kept track of my daily chapterwise progress through git and the commits were done after **passing all tests**. The commit history allows me to see how I increasingly made my django application from complex starting from the groundup. Here is a brief overview of the awesome new concepts I learnt:

- Basics of Django: setup, architecture, views, urls, etc. // [Code then](https://github.com/PseudoCodeNerd/django-with-rango/tree/5f734361f1dcaee8e7ac6368033317355f15353c)
- Template Engine, static / media files, DRY Approach // [Code then](https://github.com/PseudoCodeNerd/django-with-rango/tree/ab3e3daf808de699273d53f3fb8420f3db924afb)
- Database using ORM, data management w/ SQL and Models // [Code then](https://github.com/PseudoCodeNerd/django-with-rango/tree/80ac30ee19557b5dcce326e5663809ce38baa948)
- Complex views and connections with models & templates, forms and workflow // [Code then](https://github.com/PseudoCodeNerd/django-with-rango/tree/f223f00bf9537e9fb347fc5012407140e417b716)
- Custom user authentication views & handling, User model, class-based views // [Code then](https://github.com/PseudoCodeNerd/django-with-rango/tree/7ec9076f5ec0b2d84d4625f8bbc5c7883a1ee0a7) 
- Cookies, fundamentals of JQuery, AJAX for CRUD, search functionality // [Code then](https://github.com/PseudoCodeNerd/django-with-rango/tree/037322bed4a9717ff0ed12f76a857b1f94d1db6a)
- Bulma (themed entire site from skeleton --> bulma) // [Code then](https://github.com/PseudoCodeNerd/django-with-rango/tree/160ed76ed8130f9de6763c94e47f135349da4513)
- deployment using PythonAnywhere and Progressive Web Apps.

## Putting it all together.
Not gonna lie, the most satisfying part was the deployment and asking my friends to test it out. I'm thankful to those who tested out my app by creating accounts on this **Social Media Web App Barebones** (That's what I call it to make it sound cool). I have a few other ideas for things I want to make with Django but they are still a *WIP*.

#### Preview the website [here](http://rango.madhavsharma.me/)


<blockquote class="twitter-tweet"><p lang="en" dir="ltr">Looks great! Well done @sharmadhavs - we are super glad you grasped everything! Keep learning! ☺️ <a href="https://t.co/oDy7Wrxm5u">pic.twitter.com/oDy7Wrxm5u</a></p>&mdash; Tango With Django (@tangowithdjango) <a href="https://twitter.com/tangowithdjango/status/1237475883989991426?ref_src=twsrc%5Etfw">March 10, 2020</a></blockquote> <script async src="https://platform.twitter.com/widgets.js" charset="utf-8"></script>

---

![]({{ site.baseurl }}/images/w2.png "lazy eh ?")
![]({{ site.baseurl }}/images/w1.png "hmmmm")

***Fin.***
---
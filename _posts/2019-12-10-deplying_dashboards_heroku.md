---
layout: post
title: "Deploying Web Apps in Julia"
description: "Using Heroku for Google Code-In 2019"
toc: false
comments: false
image: images/deploy.png
hide: false
search_exclude: false
categories: [gci19]
--- 

{% include info.html text="Preview at https://deploy-tutorial-plot.herokuapp.com/" %}

In this blog, I'll show how you can deploy a Dashboard written in `Julia` using [Heroku](https://heroku.com/), a free cloud storage platform. This is done under Google Code-In for Julia.

### Task Statement

Deploy an instance of a dashboard created with Dashboards.jl and publish it to a free service like Heroku. Contribute instructions on how others can do this to Dashboards.jl. See this blog post for info on how to publish a web app in Julia.

*This task is best done by someone who has already completed Create a sample dashboard with Dashboards.jl.*

### Background

The task states that the task is best done by someone who has already completed *Create a sample dashboard with Dashboards.jl*. 
I'd like to state that I did attempt to implement a dashboard written in `python` and put my life into it. However, the callback didn't work and I couldn't submit it. 

But be assured, in the process of creating that Dashboard, I learnt all the fundamentals and am capable of guiding you in deploying  your own dashboard (or webapp).

---

## Step 1

In this tutorial, I'll be deploying [this](https://github.com/waralex/DashboardsExamples/blob/master/dash_tutorial/3_basic_dash_callbacks_2.jl) dash file.
Let's get started...

Pre-requisites :

1. A [Heroku](https://heroku.com/) Account
2. Your Files. (here, Dashboard files)
3. [Julia](https://julialang.org/downloads/) Installation
4. [Heroku CLI](https://devcenter.heroku.com/articles/heroku-cli) (Command Line Interface)

I have uploaded the files at my GitHub Repository. Check them out [here](https://github.com/PseudoCodeNerd/deploy_a_dashboard).

Windows users may have problems with installing Heroku CLI on their systems. I too faced a problem with the %PATH% variables. I'd like to suggest you too install heroku-cli through [scoop](https://scoop.sh) (a package manager). Here's how to do it.

- [Install Scoop](https://www.onmsft.com/how-to/how-to-install-the-scoop-package-manager-in-windows-10)
- `$ scoop install heroku-cli`

After the CLI is succesfully installed, run:

`$ heroku login`

A browser window will open, prompting you to login to your heroku account using a single button. eazze right ?

---

## Step 2

Create a new **app** through your Heroku Dashboard. 
Note that only names with letters and dashes are allowed. Once you've named it, return to your jolly old command prompt. We got stuff to do...

*I'll assume that we named our project `deploy-tutorial-plot`.* 

Don't name this, it's already the name of my app xD.

---

## Step 3

I'm assuming that whatever app you're trying to deploy, it's already in it's own Julia `env` folder with a `Project.toml` and `Manifest.toml`. Read [this](https://julialang.github.io/Pkg.jl/stable/environments/) to know how to create an enivironment in Julia.

The Project and Manifestt `.toml`(s) contain information about your code: dependancies, versions, and author name. 

Let's take `web_dash` as the folder containing my files.
Hop into your `cmd` now to intialize a git rep in your folder.

```python
$ cd web_dash
$ git init
```
Now, connect your Heroku app with you local folder. This can be done by running 

```console
$ git heroku git:remote -a deploy-tutorial-plot
```

*Put your app's name after `-a`.*

---

## Step 4

Now, to the working directory (here, your folder) add a `Procfile`.

A `Procfile` is a mechanism for declaring what commands are run by your application’s dynos on the Heroku platform.

```python
web: julia --project web_dash.jl $PORT
```

Here,<br>
`web_dash.jl` is your app file name.<br> `$PORT `represents the PORT number heroku will be using for your application.

At this point, your working directory must look like this:

```python
Folder PATH listing for volume RAVENCLAW
Volume serial number is B4F9-8664
C:.
    Manifest.toml
    Procfile
    Project.toml
    web_dash.jl
```

We still need to parse this PORT number on our script before starting the server. If we are using `HTTP.jl` we can replace the alreay existing hosting code in our file by the following :

 Replace `HTTP.Sockets.localhost` with `"0.0.0.0"`

 Replace `/YOURPORTNUMBER/` with `parse(Int,ARGS[1])`

Ultimately, the ending of must look like this:

```julia
handler = make_handler(app, debug = false)
println("started at localhost:$(parse(Int, ARGS[1]))")
HTTP.serve(handler,"0.0.0.0",parse(Int,ARGS[1]))
```

Also, before putting up our files on the cloud, we need to tell Heroku what language we're putting forwards. This is accomplished using a `BuildPack`.

Heroku Buildpacks determine the build process for an app, and which assets and runtimes should be made available to your code at runtime. Buildpacks enable you to extend Heroku's build system to support your language or customizations, or to make particular binary packages available to the runtime.

Even though, Julia isn't there on the Heroku Languages page; we have a `julia-buildPack` available at our disposal from [here](https://github.com/Optomatica/heroku-buildpack-julia).

`https://github.com/Optomatica/heroku-buildpack-julia.git`

Paste this in buildpack row by moving to your app settings page on your heroku site.

---

## Final Step

Now, we're ready to commit and deploy our plot by pushing to Heroku.

If you aren't familiar with basic git commands to do this, please try to know them beforehand.

(Trust me, they're really helpful! You won't regret learning more about it...)

```python
$ git status
$ git add .
$ git commit -m "commit message"
$git push heroku master
```

This should prompt heroku to start building your web-app.Putting the results here too because I found i oddlySatisfying.

```python
Enumerating objects: 6, done.
Counting objects: 100% (6/6), done.
Delta compression using up to 4 threads
Compressing objects: 100% (5/5), done.
Writing objects: 100% (6/6), 6.47 KiB | 947.00 KiB/s, done.
Total 6 (delta 0), reused 0 (delta 0)
remote: Compressing source files... done.
remote: Building source:
remote:
remote: -----> Julia app detected
remote: -----> Installing julia ....        - julia-1.3.0-linux-x86_64.tar.gz

.
.
.

remote: -----> Compressing...
remote:        Done: 364.6M
remote: -----> Launching...
remote:  !     Warning: Your slug size (364 MB) exceeds our soft limit (300 MB) which may affect boot time.
remote:        Released v3
remote:        https://deploy-tutorial-plot.herokuapp.com/ deployed to Heroku
remote:
remote: Verifying deploy... done.
To https://git.heroku.com/deploy-tutorial-plot.git
 * [new branch]      master -> master
```

Phew, so if everything went *awesome* on your part too, you can see your app hosted at `[app-name.herokuapp.com](https://deploy-tutorial-plot.herokuapp.com/)`.

I hope that you found this tutorial helpful. 

### Cheerio!

---

[Hosted App](https://deploy-tutorial-plot.herokuapp.com/) 

[Files on GitHub](https://github.com/PseudoCodeNerd/deploy_a_dashboard)


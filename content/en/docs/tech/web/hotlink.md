---
title: "How to Hotlink Images from Google Drive and Dropbox"
date: 2020-07-05
c: "darkslategray"
description : "How to Hotlink Images from Google Drive and Dropbox"
author: Juan
aliases:
  /articles/hotlink/
---


In order to keep the [Pantrypoints app](/) resilient, it does not use image hosting which would increase the system's cost and reduce maintainability. Instead, we use hotlinking which shows images hosted by other websites and apps.

There are generally two kinds of hosting services for image:


### 1. File hosting

These host files for storage purposes. Examples are:

- [Google Drive](https://drive.google.com)
- [Dropbox](https://dropbox.com)
<!-- - Fotki
- Imgbb -->



### 2. Image hosting

These host images and video for serving over the internet, usually through a CDN (content delivery network). Examples are:

- [Imgbb](https://imgbb.com)
- [Cloudinary](https://cloudinary.com)
- [Sirv](https://sirv.com)


The easiest to use is Imgbb:

1. Go to [imgbb.com](https://imgbb.com) and upload your photo

![Step 1](/screens/img/img1.jpg)

2. Choose `don't autodelete`

![Step 2](/screens/img/img2.jpg)

3. Choose `HTML thumbnail linked` then copy the url referenced by the `img` tag. In this case, it's `https://i.ibb.co/jvpjXnp/sp.png`

![Step 3](/screens/img/img3.jpg)

4. Paste the link in image field in your Pantrypoints account or Item

![Step 4](/screens/img/img4.png)

But what if you already have files on Google Drive or Dropbox?


## How to Hotlink from Google Drive

1. In Google Drive, share the photo to anyone with the link. This will produce a url, for example:

```elixir
https://drive.google.com/file/d/1jV8pJUdecO6g3Gemr_GPrHEFKVTMwC0d/view?usp=sharing`
```

2. Get the ID which in this case is:

```elixir
1jV8pJUdecO6g3Gemr_GPrHEFKVTMwC0d
```

3. Put that ID to a new URL `https://drive.google.com/uc?id=` so that the whole URL will be:

```elixir
https://drive.google.com/uc?id=1jV8pJUdecO6g3Gemr_GPrHEFKVTMwC0d
```

4. Copy the link and post into your Pantrypoints Item or Account


## How to Hotlink from Dropbox

1. Get the link from your image in Dropbox. An example is:

```elixir
https://www.dropbox.com/s/a6i8y0khkc4us8h/taonet512.png?dl=1
```

2. Change the last characters from `dl=1` into `raw=1`

```elixir
https://www.dropbox.com/s/a6i8y0khkc4us8h/taonet512.png?raw=1
```

3. Copy the link and post into your Pantrypoints Item or Account

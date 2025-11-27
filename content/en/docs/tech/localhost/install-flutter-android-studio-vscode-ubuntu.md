---
title: How to install Flutter, Android Studio, and Visual Studio Code in Ubuntu
description: How to install Flutter, Android Studio, and Visual Studio Code in Ubuntu
image: "/img/tech.jpg"
tags: ['Flutter', 'Android', 'VS Code']
date: 2019-01-01
---


<!-- Here are the steps to upgrade to install or upgrade Flutter, Android Studio, and Visual Studio Code in Ubuntu. -->


## Step 1: Install Flutter


### 1.1 Download, Extract, and Move to a Folder

- Download the [Flutter zip](https://flutter.dev/docs/get-started/install/linux) from the official site
- Unzip the files at the current Downloads directors. This will create:

```
/home/your-ubuntu-username/Downloads/flutter_linux_3.0.5-stable
```

- From the `flutter_linux_3.0.5-stable` directory, move the `flutter` folder to the Downloads folder so that you have:

```
/home/your-ubuntu-username/Downloads/flutter
```


### 1.2 Set up bashrc

- In your terminal, enter: 

```
sudo nano ~/.bashrc
```

- At the bottom, insert: 

```
export PATH="$PATH:$HOME/Downloads/flutter/bin"
```

- Exit nano with `Ctrl + x` then save
- In the terminal, type `flutter -h` to test if the directory was referenced




## Step 2: Install Android Studio

Android Studio is needed for the Android SDK.
- The SDK is needed for the emulator
- The emulator is needed to test the app on devices



### 2.1 Download, Extract, and Move to a Folder

- Download the [Android Studio SDK zip](https://developer.android.com/studio) from the official site
- Unzip the files
- Afterwards, the extracted files would be in 

```
/home/your-ubuntu-username/Downloads/android-studio
```

### 2.2 Set up bashrc

- In your terminal, enter: 

```
sudo nano ~/.bashrc
```

- At the bottom, insert: 

```
export PATH="$PATH:$HOME/Downloads/android-studio/jre/bin/java"
```

- Exit nano with `Ctrl + x` then save


- In your terminal, cd into 
```
/home/your-ubuntu-username/Downloads/android-studio/bin
```
- Run `sh studio.sh`


### 2.3 Set up Android Studio

- In Android Studio, click `Tools --> Create desktop entry..`
- Go to ``File --> Settings --> Plugins``
- Select ``Marketplace``
- Choose and install ``Flutter``

<br>


## Step 3: Install Visual Studio Code

- Download the .deb file from the official site
- Double-click the .deb file

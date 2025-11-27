---
title: How to Enable Shared Folders in Linux Mint Cinnamon
description: How to Enable Shared Folders in Linux Mint Cinnamon
image: "/img/tech.jpg"
tags: ['Samba']
date: 2023-12-15
weight: 200
---


## 1. Install Samba

```
sudo apt install samba
```

## 2. Force your user in the Config 

```
sudo nano /etc/samba/smb.conf
```

Add under `[global]`:

```
force user = your-username-in-your-mint-account
```


## 3. Restart

```
sudo systemctl restart smbd
sudo systemctl status smbd
```

## 4. Share a folder

RIght click a folder. Go to the Share tab. Check Allow Others and Guest Access, then Create Share.

Check the Folder in another computer



Go to another computer. Go Network and check the folder 


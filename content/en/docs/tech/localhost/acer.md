---
title: How to Fix No Bootable Device on Acer ES1 132
description: No Bootable Device on Acer ES1 132
image: "/img/tech.jpg"
tags: ['Acer']
date: 2023-09-23
---

This assumes you want to install Ubuntu, Mint, Fedora, Android OS, OpenSUSE, or Red Hat instead of Windows. 

## Step 1

Create a live USB installer for your OS

## Step 2 

Plug it in the laptop and set up the BIOS to boot from the USB

## Step 3 

Install the OS on your hard disk. We assume you have Mint which is Ubuntu anyway. 


## Step 4

Open "Disks"

Choose your hard disk partition that has "EFI System". Click on its link which in our case is `/boot/efi`


{{< img src="/screens/disks.png" >}}


## Step 5

It will open the File Manager, saying you don't have permissions to view it. 

Go back one folder to `/boot` then right click on `efi` and select `Open as Root`

You will see an `EFI` folder. Enter it to see a folder named after your OS. In our case, it was `ubuntu`. The problem was that our folder only had `grubx64.efi` as `\EFI\ubuntu\grubx64.efi`  when Acer was looking for `grub.efi` or any of these files in hardcoded locations:

File | OS | Boot type
--- | --- | --- 
\EFI\Linux\BOOTX64.efi | Linux | 
\EFI\Microsoft\Boot\bootmgfw.efi | Windows Boot Manager |
\EFI\ubuntu\shim.efi | ubuntu | Secure Boot
\EFI\ubuntu\shim$cpu$.efi | ubuntu | Secure Boot
\EFI\ubuntu\grub.efi | ubuntu | 
\EFI\fedora\shim.efi | Fedora |
\EFI\android\bootx64.efi | Android |
\EFI\opensuse\grubx64.efi | openSUSE |
\EFI\redhat\grub.efi | Red Hat Linux | 
\EFI\SuSE\elilo.efi | SuSE Linux |
\EFI\ubuntu\grub$cpu$.efi | ubuntu |


## Step 6

So, depending on your OS, copy the `grub` and/or `shim` file and put it and rename it to match the requirements of Acer. 

In our case, we copied `grubx64.efi` and renamed it into `grub.efi` 

This allowed Acer to pickup the boot loader and load Mint. We didn't need to buy a new laptop. 

## Step 7

Reboot. Hopefully this will boot the OS. If not, copy `grub.efi` and rename it to `\EFI\Linux\BOOTX64.efi`

<!-- and shimx64.efi -->






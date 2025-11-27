---
title: "Linux Filesystem"
image: "/photos/code.jpg"
date: 2016-11-12
# description: "The ASEAN's Next Great Idea contest looks for the Top 20 ideas in Southeast Asia. We're very thankful to have made it to the list!"
---



These directories are required in /.


Directory | Purpose
--- | ---
/bin | Essential command binaries
/boot  |    Static files of the boot loader
/dev    |   Device files
/etc     |  Host-specific system configuration
/lib      | Essential shared libraries and kernel modules
/media |    Mount point for removeable media
/mnt |      Mount point for mounting a filesystem temporarily
/opt |      Add-on application software packages
/sbin |     Essential system binaries
/srv |      Data for services provided by this system
/tmp |      Temporary files
/usr |      Secondary hierarchy
/var |      Variable data
      

Additional directories are in / if the corresponding subsystem is installed:

Directory | Purpose
--- | ---
/ | the root directory
/home | User home directories (optional)
/lib<qual>  | Alternate format essential shared libraries (optional)
/root | Home directory for the root user (optional)
 


Linux file systems start with /, the root directory. 

All other directories are 'children' of this directory. The root is mounted first during boot. The system will not boot if it doesn't find it.




## /lib

This has kernel modules and those shared library images (the C programming code library) needed to boot the system and run the commands in the root filesystem, ie. by binaries in /bin and /sbin. 

Libraries are readily identifiable through their filename extension of *.so. 

Windows equivalent to a shared library would be a DLL (dynamically linked library) file. They are essential for basic system functionality. Kernel modules (drivers) are in the subdirectory /lib/modules/'kernel-version'. To ensure proper module compilation you should ensure that /lib/modules/'kernel-version'/kernel/build points to /usr/src/'kernel-version' or ensure that the Makefile knows where the kernel source itself are located.

Subdirectory | Purpose
--- | ---
/lib/'machine-architecture' | Contains platform/architecture dependent libraries.
/lib/iptables | iptables shared library files.
/lib/kbd | Contains various keymaps.
/lib/modules/'kernel-version' | The home of all the kernel modules. The organisation of files here is reasonably clear so no requires no elaboration.
/lib/modules/'kernel-version'/isapnpmap.dep | has details on ISA based cards, the modules that they require and various other attributes.
/lib/modules/'kernel-version'/modules.dep | lists all modules dependencies. This file can be updated using the depmod command.
/lib/modules/'kernel-version'/pcimap | is the PCI equivalent of the /lib/modules/'kernel-version'/isapnpmap.dep file.
/lib/modules/'kernel-version'/usbmap | is the USB equivalent of the /lib/modules/'kernel-version'/isapnpmap.dep file.
/lib/oss | All OSS (Open Sound System) files are installed here by default.
/lib/security | PAM library files.

<!-- The FSSTND states that the /lib directory contains those shared library
images needed to boot the system and run the commands in the root filesystem,
ie. by binaries in /bin and /sbin. -->

Shared libraries that are only necessary for binaries in /usr (such as any  X Window binaries) must not be in /lib. Only the shared libraries required to run binaries in /bin and /sbin may be here. 

In particular, the library libm.so.* may also be placed in /usr/lib if it is not required by anything in /bin or /sbin.

At least one of each of the following filename patterns are required (they  may be files, or symbolic links):

libc.so.* The dynamically-linked C library (optional)
ld*       The execution time linker/loader (optional)

<!-- If a C preprocessor is installed, /lib/cpp must be a reference to it, for
historical reasons. The usual placement of this binary is /usr/bin/cpp. -->
<!-- 
The following directories must be in  /lib, if the corresponding subsystem is installed:

modules   Loadable kernel modules (optional)

/lib<qual> : Alternate format essential shared libraries (optional)

There may be one or more variants of the /lib directory on systems which
support more than one binary format requiring separate libraries.

This is commonly used for 64-bit or 32-bit support on systems which support
multiple binary formats, but require libraries of the same name. In this 
case, /lib32 and /lib64 might be the library directories, and /lib a symlink
to one of them.

If one or more of these directories exist, the requirements for their contents
are the same as the normal /lib directory, except that /lib<qual>/cpp is 
not required.

/lib<qual>/cpp is still permitted: this allows the case where /lib and 
/lib<qual> are the same (one is a symbolic link to the other).
 -->



## /lost+found

This stores recovered files that may have been lost during sudden shutdowns. 

When Linux shuts down unexpectedly, it does a lengthy filesystem check* using fsck. It will try to recover any corrupt files that it finds and places it in this directory.

> *Ext3, a journalled filesystem, will finish  the check faster than ext2 


<!-- . Fsck will go through the system and try to . The result of this recovery operation will be placed in this directory. The files recovered are not likely to be complete or make much sense but there always is a chance that something worthwhile is recovered. 
 -->

Each partition has its own lost+found directory. If you find files in there, try to move them back to their original location. 

<!-- If you find something like a broken symbolic link to 'file', you have to reinstall the file/s from the corresponding RPM, since your file system got damaged so badly that the files were mutilated beyond recognition. 
 -->
<!-- Below is an example of a /lost+found directory. As you can see, the vast majority of files contained here are in actual fact sockets. As for the rest of the other files they were found to be damaged system files and personal files. These files were not able to be recovered. -->


<!-- Linux should always go through a proper shutdown. After a system crash, a lengthy filesystem check is done using fsck at the next boot. The speed of this check dependens on your filesystem type. ext3 is faster than ext2 because it is a journalled filesystem. -->

<!-- Fsck will try to recover any corrupt files that it finds. The result of this recovery operation will be placed in this directory. The files recovered are not likely to be complete or make much sense but there always is a chance that something worthwhile is recovered. Each partition has its own lost+found directory. If you find files in there, try to move them back to their original location.  -->

If you find something like a broken symbolic link to 'file', you have to reinstall the file/s from the corresponding RPM, since your file system got damaged so badly that the files were mutilated beyond recognition. 

<!-- Below is an example of a /lost+found directory. As you can see, the vast majority of files contained here are in actual fact sockets. As for the rest of the other files they were found to be damaged system files and personal files. These files were not able to be recovered. 

 total 368
      -rw-r--r-- 1 root root 110891 Oct 5 14:14 #388200
      -rw-r--r-- 1 root root 215 Oct 5 14:14 #388201
      -rw-r--r-- 1 root root 110303 Oct 6 23:09 #388813
      -rw-r--r-- 1 root root 141 Oct 6 23:09 #388814
      -rw-r--r-- 1 root root 110604 Oct 6 23:09 #388815a
      -rw-r--r-- 1 root root 194 Oct 6 23:09 #388816
      srwxr-xr-x 1 root root 0 Oct 6 13:00 #51430
      srwxr-xr-x 1 root root 0 Oct 6 00:23 #51433
      -rw------- 1 root root 63 Oct 6 00:23 #51434
      srwxr-xr-x 1 root root 0 Oct 6 13:00 #51436
      srwxrwxrwx 1 root root 0 Oct 6 00:23 #51437
      srwx------ 1 root root 0 Oct 6 00:23 #51438
      -rw------- 1 root root 63 Oct 6 13:00 #51439
      srwxrwxrwx 1 root root 0 Oct 6 13:00 #51440
      srwx------ 1 root root 0 Oct 6 13:00 #51442
      -rw------- 1 root root 63 Oct 6 23:09 #51443
      srwx------ 1 root root 0 Oct 6 10:40 #51445
      srwxrwxrwx 1 root root 0 Oct 6 23:09 #51446
      srwx------ 1 root root 0 Oct 6 23:09 #51448
      

      -->






## /home

Each user has its own home directory under '/home/$USER' (~/).

Personl config files here have the convention: .name and are hidden. These can be ssen by unhiding in the file manager or `ls -a` in the terminal.

If there is a conflict between personal and system wide configuration files, the settings in the personal file will prevail.

<!-- 
/home
Linux is a multi-user environment so each user is also assigned a specific directory that is accessible only to them and the system administrator. These are the user home directories, which can be found under '/home/$USER' (~/). It is your playground: everything is at your command, you can write files, delete them, install programs, etc.... Your home directory contains your personal configuration files, the so-called dot files (their name is preceded by a dot). Personal configuration files are usually 'hidden', if you want to see them, you either have to turn on the appropriate option in your file manager or run ls with the -a switch. If there is a conflict between personal and system wide configuration files, the settings in the personal file will prevail.

Dotfiles most likely to be altered by the end user are probably your .xsession and .bashrc files. The configuration files for X and Bash respectively. They allow you to be able to change the window manager to be startup upon login and also aliases, user-specified commands and environment variables respectively. Almost always when a user is created their dotfiles will be taken from the /etc/skel directory where system administrators place a sample file that user's can modify to their hearts content.

/home can get quite large and can be used for storing downloads, compiling, installing and running programs, your mail, your collection of image or sound files etc.

The FSSTND states that:

  /home is a fairly standard concept, but it is clearly a site-specific
  filesystem. 
  
  Different people prefer to place user accounts in a variety of places. 
  This section describes only a suggested placement for user home
  directories; nevertheless we recommend that all FHS-compliant 
  distributions use this as the default location for home directories.
  On small systems, each user's directory is typically one of the many 
  subdirectories of /home such as /home/smith, /home/torvalds, 
  /home/operator, etc. On large systems (especially when the /home 
  directories are shared amongst many hosts using NFS) it is useful 
  to subdivide user home directories. Subdivision may be accomplished by
  using subdirectories such as /home/staff, /home/guests, /home/students,
  etc.
  
  The setup will differ from host to host. Therefore, no program
  should rely on this location.

  If you want to find out a user's home directory, you should use the 
  getpwent(3) library function rather than relying on /etc/passwd because 
  user information may be stored remotely using systems such as NIS.

  User specific configuration files for applications are stored in the
  user's home directory in a file that starts with the '.' character 
  (a "dot file"). If an application needs to create more than one dot
  file then they should be placed in a subdirectory with a name starting
  with a '.' character, (a "dot directory"). In this case the
  configuration files should not start with the '.' character.

  It is recommended that apart from autosave and lock files programs
  should refrain from creating non dot files or directories in a home
  directory without user intervention.
  
 -->




## /tmp

Has temporary files. Many programs use this to create lock files and for temporary data.

Do not remove files from this directory unless you know exactly what you are doing! 

Many of these files are important for currently running programs. Deleting them may result in a system crash.

This directory is usually cleared out at boot or at shutdown.

<!-- The basis for this was historical precedent and common practice. However, it was not made a requirement because system administration is not within the scope of the FSSTND. For this reason people and programs must not assume that any files or directories in /tmp are preserved between invocations of the program. The reasoning behind this is for compliance with IEEE standard P1003.2 (POSIX, part 2). -->


## /root

This is the home directory of the System Administrator 'root'. 

<!-- This may be somewhat confusing ('root on root') but in former days, -->

In the past, '/' was root's home directory hence the name of the Administrator account. 

To keep things tidier, 'root' got his own home directory. 

'/home' was often located on a different partition or another system and be inaccessible to 'root' when only '/' is mounted.


## /srv

Has site-specific data which is served by this system.

  This main purpose of specifying this is so that users may find
  the location of the 

This has the data files for a particular service so that services which require a single tree for readonly data, writable data
and scripts (such as cgi scripts) can be reasonably placed.

Data that is only of interest to a specific user should go in that users' home directory.

<!-- The methodology used to name subdirectories of /srv is unspecified as there
  is currently no consensus on how this should be done. One method for
  structuring data under /srv is by protocol, eg. ftp, rsync, www, and cvs.
  On large systems it can be useful to structure /srv by administrative
  context, such as /srv/physics/www, /srv/compsci/cvs, etc. This setup will
  differ from host to host. Therefore, no program should rely on a specific
  subdirectory structure of /srv existing or data necessarily being stored in
  /srv. However /srv should always exist on FHS compliant systems and should
  be used as the default location for such data.

  Distributions must take care not to remove locally placed files in these
  directories without administrator permission.

  This is particularly important as these areas will often contain both
  files initially installed by the distributor, and those added by the
  administrator. -->
  
<!-- The FSSTND merely states that this is the recommended location for the home directory of 'root'. It is left up to the end user to determine the home directory of 'root'. However, the FSSTND also says that:

	  
  If the home directory of the root account is not stored on the root
  partition it will be necessary to make certain it will default to 
  / if it can not be located.
  
  We recommend against using the root account for tasks that can be
  performed as an unprivileged user, and that it be used solely for 
  system administration. For this reason, we recommend that subdirectories
  for mail and other applications not appear in the root account's home
  directory, and that mail for administration roles such as root, postmaster,
  and webmaster be forwarded to an appropriate user. -->
  

## /media

This has the mount points for removable media. 

<!-- The motivation for the creation of this directory has been that historically
there have been a number of other different places used to mount removeable
media such as /cdrom, /mnt or /mnt/cdrom. Placing the mount points for all 
removeable media directly in the root directory would potentially result in 
a large number of extra directories in /. Although the use of subdirectories
in /mnt as a mount point has recently been common, it conflicts with a much 
older tradition of using /mnt directly as a temporary mount point.

The following directories, or symbolic links to directories, must be in /media,
if the corresponding subsystem is installed:

floppy     Floppy drive (optional)
cdrom      CD-ROM drive (optional)
cdrecorder CD writer (optional)
zip        Zip drive (optional) -->

On systems where more than one device exists for mounting a certain type of media, mount directories can be created by appending a digit to the name of those available above starting with '0', but the unqualified name must also exist.

A compliant implementation with two CDROM drives might have /media/cdrom0 and /media/cdrom1 with /media/cdrom a symlink to either of these.



## /opt

This is reserved for all the software and add-on packages that are not part of the default installation.

For example, Netscape Communicator and WordPerfect packages are normally found here. All third party applications should be installed in this directory.

Any package to be installed here must locate its static files (ie. extra fonts, clipart, database files) must locate its static files in a separate /opt/'package' or /opt/'provider' directory tree. This is similar to how Windows installs new software to  C:\Windows\Progam Files\"Program Name")

<!-- , where 'package' is a name that describes the software package and 'provider' is the provider's LANANA registered name.

Although most distributions neglect to create the directories /opt/bin, /opt/doc, /opt/include, /opt/info, /opt/lib, and /opt/man they are reserved for local system administrator use. Packages may provide "front-end" files intended to be placed in (by linking or copying) these reserved directories by the system administrator, but must function normally in the absence of these reserved directories. Programs to be invoked by users are located in the directory /opt/'package'/bin. If the package includes UNIX manual pages, they are located in /opt/'package'/man and the same substructure as /usr/share/man must be used. Package files that are variable must be installed in /var/opt. Host-specific configuration files are installed in /etc/opt. -->

Under no circumstances are other package files to exist outside the /opt, /var/opt, and /etc/opt hierarchies except for those package files that must reside in specific locations within the filesystem tree in order to function properly.

For example, device lock files in /var/lock and devices in /dev. 

Distributions may install software in /opt, but must not modify or delete software installed by the local system administrator without the assent of the local system administrator.

<!-- The use of /opt for add-on software is a well-established practice in the UNIX community. The System V Application Binary Interface [AT&T 1990], based on the System V Interface Definition (Third Edition) and the Intel Binary Compatibility Standard v. 2 (iBCS2) provides for an /opt structure very similar to the one defined here. -->

Generally, all data required to support a package on a system must be present within /opt/'package'.

<!-- , including files intended to be copied into /etc/opt/'package' and /var/opt/'package' as well as reserved directories in /opt. The minor restrictions on distributions using /opt are necessary because conflicts are possible between distribution installed and locally installed software, especially in the case of fixed pathnames found in some binary software.

The structure of the directories below /opt/'provider' is left up to the packager of the software, though it is recommended that packages are installed in /opt/'provider'/'package' and follow a similar structure to the guidelines for /opt/package. A valid reason for diverging from this structure is for support packages which may have files installed in /opt/ 'provider'/lib or /opt/'provider'/bin. -->


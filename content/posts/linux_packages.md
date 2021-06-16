---
title: "Linux Packages"
date: 2021-06-16T08:45:39+08:00
description: "Commands for maintaining linux packages"
tags: [Linux]
# featured_image: "/images/notebook.jpg"
categories: Knowledgebase
comment : false
---

## Update package database 
sudo apt update



## Upgrade installed packages
sudo apt upgrade



## Install a package
sudo apt install \<package name>



## Uninstall a package
sudo apt remove \<package name>
<br/>
or
<br/>
sudo apt purge



### Note : 
remove leaves configuration files, purge removes all files related to the package



## Search for package
apt search \<search string>



## List installed packages
apt list --installed
<br/>
or
<br/>
dpkg -l



## Show package information
apt info \<package name>



## List package content
apt show \<package name>




---
title: "Git Submodules"
date: 2021-05-22T11:13:45+08:00
description: "Some basic comnands when using git submodules"
tags: [Git]
# featured_image: "/images/notebook.jpg"
categories: Snippet
comment : false
---

## Delete a Submodule

1. Open `.gitmodules` and remove the entry of the submodule to delete
    
    Sample entry to remove from .gitmodules
    ```
    [submodule "path/to/submodule/folder"]
    	path = path/to/submodule/folder
    	url = https://github.com/submodule/to_delete.git
    ```  
    &nbsp;
    <br>



2. Stage the changes in .gitmodules
    ```
    git add .gitmodules
    ```
    &nbsp;
    <br>



3. Open `.git/config` and remove the entry of the submodule to delete
    
    Sample entry to remove from .git/config
    ```
    [submodule "path/to/submodule/folder"]
        url = https://github.com/submodule/to_delete.git
        active = true
    ```
    &nbsp;
    <br>



4. Delete submodule folder using git rm
    ```
    git rm --cached path/to/submodule/folder
    ```
    &nbsp;
    <br>



5. Delete submodule directory under `.git/modules`
    ```
    rm -rf .git/modules/name_of_submodule_to_delete
    ```
    &nbsp;
    <br>



6. Commit changes done so far
    ```
    git commit -m "Removed submodule <submodule name>"
    ```
    &nbsp;
    <br>



7. Make sure there are no more files of the deleted submodule
    ```
        rm -rf path/to/submodule/folder
    ```

---
title: "Git Submodules"
date: 2021-05-22T11:13:45+08:00
description: "Some basic comnands when using git submodules"
tags: [Git]
# featured_image: "/images/notebook.jpg"
categories: Snippet
comment : false
---
## Adding a submodule
Inside your repository, execute the following command.
> git submodule add https://github.com/submodule/to_add.git /folder/to/put/submodule

&nbsp;
<br>
<br>

## Cloning a repository with submodules

- Method 1 
    1. Clone the repository
    > git clone https://github.com/repository/to_clone.git

    &nbsp;
    <br>

    2. Go to each submodules folder then initialize and update 
    > cd submodule/folder
    > git submodule init
    > git submodule update

- Method 2
    > git clone --recurse-submodules https://github.com/repository/to_clone.git
    
    The **--recurse-submodules** option will automaticallu initialize and update all submodules

Method 1 has the advantage of selecting only those submodules you wish to downloading (initialize and update).

&nbsp;
<br>
<br>

## Delete a submodule

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
    > git add .gitmodules

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
    > git rm --cached path/to/submodule/folder

    &nbsp;
    <br>



5. Delete submodule directory under `.git/modules`
    > rm -rf .git/modules/name_of_submodule_to_delete

    &nbsp;
    <br>



6. Commit changes done so far
    > git commit -m "Removed submodule <submodule name>"

    &nbsp;
    <br>



7. Make sure there are no more files of the deleted submodule
    > rm -rf path/to/submodule/folder

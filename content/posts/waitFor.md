---
title: "waitFor"
date: 2021-05-16T07:31:27+08:00
description: "A function that halts program execution until presence of the parameter is defined."
tags: [Javascript]
# featured_image: "/images/notebook.jpg"
categories: Snippet
comment : false
---

## Motivation
With the use of defer/async to load javascipts, it has become apparent that we must make sure that the javascript function, object, variables are loaded before referring to the those items.
waitFor checks for the presence of these items then runs the provided callback function (if any) once the checked item is loaded and ready for use.
waitFor returns a Promise so it can also be used in a promise chain. This is especially usefull when checking for existence of a function since you cannot reference a non-defined function in the callback.



## Syntax 
    waitFor(<item to check>, <item type>, [callback function])



## Parameters 

| Parameter    | Type     | Description                   | Default 
|---           |---       |---                            |---
|item to check | string   | The name of the item to check | &lt;required&gt;
|item type     | string   | The type of the item being checked. This is the value of the **typeof** operation on the **item** | &lt;required&gt;
|callback      | function | The callback function to be called after the **item** is determined to be defined | [optional]



## Return Value

- waitFor returns a resolved promise object once the typeof operation on the **item** is equal to that of the passed **item type**.
- If the specified **item type** is not correct, waitFor will return a rejected promise.


## Warning

waitFor will not run the callback function nore return a promise **item to check** is undefined.



## Example

```html
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
</head>
<body>
    <div id="callback"></div>
    <div id="output"></div>

    <script>
        // code for waitFor
        function waitFor(item, type, callback = ()=>{}){
            const [_type, _callback] = (()=>{
                if (typeof type == "function") {return [undefined, type]}
                if (typeof type == "string") {return [type, callback]}
                throw new Error ("Invalid parameters for waitFor function");
            })();

            return new Promise(resolve=>{
                (function check(){
                    try {
                        const itemType = (new Function(`return typeof ${item}`))();
                        if (itemType == "undefined" || itemType == "null") {
                            throw new Error(`"${item}" is still ${itemType}`)
                        }

                        if (_type !== undefined) {
                            if (itemType !== _type) {throw new Error(`Expecting "${item}" to be of type "${_type}" but got "${itemType}" instead`)}
                        }

                        _callback();
                        resolve();
                    } 
                    catch (error) {
                        console.info(error);
                        setTimeout(check, 500);
                    }
                })();
            })
        }        
    </script>

    <script>
        // calling waitFor
        waitFor("myfunction", "function", function(){
            document.querySelector("#callback").textContent = "this is callback's action";
        })
        .then(()=>{
            // call myfunction after waitFor is deemed defined
            myfunction();
        })
        .catch((err)=>{
            document.querySelector("#output").textContent = err.message;
        })
    </script>

    <script>
        // myfunction definition
        function myfunction(){
            document.querySelector("#output").textContent = "myfunction ran only after it is defined";
        }
    </script>
</body>
</html>
```



## Code

```javascript
function waitFor(item, type, callback = ()=>{}){
    const [_type, _callback] = (()=>{
        if (typeof type == "function") {return [undefined, type]}
        if (typeof type == "string") {return [type, callback]}
        throw new Error ("Invalid parameters for waitFor function");
    })();

    return new Promise(resolve=>{
        (function check(){
            try {
                const itemType = (new Function(`return typeof ${item}`))();
                if (itemType == "undefined" || itemType == "null") {
                    throw new Error(`"${item}" is still ${itemType}`)
                }

                if (_type !== undefined) {
                    if (itemType !== _type) {throw new Error(`Expecting "${item}" to be of type "${_type}" but got "${itemType}" instead`)}
                }

                _callback();
                resolve();
            } 
            catch (error) {
                console.info(error);
                setTimeout(check, 500);
            }
        })();
    })
}
```

#!/bin/sh

rm -rf ../categories
rm -rf ../images
rm -rf ../index.html
rm -rf ../index.xml
rm -rf ../js
rm -rf ../page
rm -rf ../posts
rm -rf ../scss
rm -rf ../sitemap.xml
rm -rf ../tags
rm -rf ../vendor

hugo
# hugo -b "http://localhost/github/emandeguzman/"
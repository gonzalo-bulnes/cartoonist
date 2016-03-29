#!/bin/bash

# Installing System Dependencies
if [ "$(uname)" = "Darwin" ]; then
  cat ./dependencies/brew.txt | xargs brew install
else
  echo 'Unsupported OS.'
  exit 1
fi

# Installing Fred's ImageMagick Scripts from http://www.fmwconcepts.com/imagemagick/
mkdir ./lib
cat ./dependencies/lib.txt | xargs -I {} \
  wget -O ./lib/{} 'http://www.fmwconcepts.com/imagemagick/downloadcounter.php?scriptname={}&dirname={}'
chmod +x ./lib/*

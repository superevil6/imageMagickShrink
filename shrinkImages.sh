#!/bin/sh 
# You need four arguments to run this script
# First is file or folder, depending on if you want to resize a single file or a directory
# Second is the filepath to the image or directory, it's set to find .png, .jpg, and .jpeg files, feel free to add more as needed
# Third and Fourth are the X and Y dimensions you want to resize to.
# So long as the images dimensions aren't already larger than input X and Y, it will shrink down the images.

# Resizing maintains aspect ratio

function checkForIm() {
echo "checking for ImageMagick..."
if yum list installed "ImageMagick" >/dev/null 2>&1; then
  echo "ImageMagick is installed"
else
  echo "ImageMagick is not installed."
  echo "Installing ImageMagick"
  sudo yum install ImageMagick
  echo "ImageMagick is installed."
fi
}
function main(){
  string=$1
  x=$3
  y=$4
  checkForIm
  if [[ $string = "file" ]]; then
    image=$2
    fileProcessing $string $image $x $y
  elif [[ $string = "folder" ]]; then
    directory=$2
    folderProcessing $string $directory $x $y
  else
    echo "invalid arguement"
    fi
}
#For files
function fileProcessing(){
  if [[ $string = "file" ]]; then
    echo $image $x $y
    if [[ `identify -format '%w' $image` -gt $x ]] && [[ `identify -format '%h' $file` -gt $y ]];then
    sudo convert $image -resize $x\x$y\> $image
    fi
  fi
}
#for folders
function folderProcessing(){
  if [[ $string = "folder" ]]; then
    for file in `find $directory -name '*.png' -o -name '*.jpg' -o -name '*.jpeg'`; do
      echo $file
      if [[ `identify -format '%w' $file` -gt $x ]] && [[ `identify -format '%h' $file` -gt $y ]];then
        sudo convert $file -resize $x\x$y\> $file
        echo resized $file to `identify -format '%w'x'%h' $file` 
      else
        echo $file does not need to be resized
      fi
    done
  fi
}
main $1 $2 $3 $4

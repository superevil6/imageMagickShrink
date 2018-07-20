This is a simple shell script that checks for ImageMagick, installs it if necessary, then shrinks down all images above the specified dimensions to meet the specified dimensions.

Here is an example of this script in use:

sh shrinkImages file /var/www/vhosts/mysite/images/image.png 1920 1080

This will shrink down the single file if it is above 1920x1080

sh shrinkImages folder /var/www/vhosts/mysite/images/ 1920 1080

This will shrink down ALL images in the directory that are above 1920x1080.

THIS SCRIPT MAINTAINS ASPECT RATIO.



You need four arguments to run this script

First is file or folder, depending on if you want to resize a single file or a directory

Second is the filepath to the image or directory, it's set to find .png, .jpg, and .jpeg files, feel free to add more as needed

Third and Fourth are the X and Y dimensions you want to resize to.

So long as the images dimensions aren't already larger than input X and Y, it will shrink down the images.

Resizing maintains aspect ratio

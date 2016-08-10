echo "Making all photos landscape"
for f in *.jpg; 
do 
    h=`identify -format "%h" $f` 
    w=`identify -format "%w" $f` 
    echo "$f height: $h width: $w"
    if [ $h -gt $w ]
    then
        `convert -rotate 90 $f $f`
    fi
done
for f in *.jpg; 
do 
    echo "cropping $f"
    `convert $f -gravity center -crop "$h"x"$h"+0+0 +repage $f-cropped.jpg`
done

echo "Creating montage"
result=`montage *-cropped.jpg -geometry "$h"x"$h"+20+20 montage.pdf`

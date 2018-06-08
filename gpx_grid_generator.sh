#!/bin/sh
LANG=en_US
out=gridlines.gpx
echo '<?xml version="1.0" encoding="UTF-8" standalone="no" ?>
<gpx xmlns="http://www.topografix.com/GPX/1/1" creator="" version="1.1"
    xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
     xsi:schemaLocation="http://www.topografix.com/GPX/1/1 ">http://www.topografix.com/GPX/1/1/gpx.xsd">
<trk><name>Grid lines</name>' > $out
a1=-18
a2=-28

b1=-53
b2=-63

steps=0.05

for i in $(seq $a2 $steps $a1); do
   echo "<trkseg><trkpt lat=\"$i\" lon=\"$b1\"></trkpt><trkpt lat=\"$i\" lon=\"$b2\"></trkpt></trkseg>" >> $out
done

for i in $(seq $b2 $steps $b1); do
    echo "<trkseg><trkpt lat=\"$a2\" lon=\"$i\"></trkpt><trkpt lat=\"$a1\" lon=\"$i\"></trkpt></trkseg>" >> $out
done

echo "</trk></gpx>" >> $out

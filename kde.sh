#!/bin/bash
trap "exit" INT
arr1=($(ls /home/mitchyman/Pictures))
piclen=${#arr1[@]}
numby=$(($RANDOM % piclen))
pic=CalabiYau5.jpg
qdbus org.kde.plasmashell /PlasmaShell org.kde.PlasmaShell.evaluateScript '
    var allDesktops = desktops();
    print (allDesktops);
    for (i=0;i<allDesktops.length;i++) {{
        d = allDesktops[i];
        d.wallpaperPlugin = "org.kde.image";
        d.currentConfigGroup = Array("Wallpaper",
                                     "org.kde.image",
                                     "General");
        d.writeConfig("Image","/home/mitchyman/Pictures/'${arr1[$numby]}'")
    }}
'
echo "${arr1[$numby]}"
echo "/home/mitchyman/Pictures/$pic"

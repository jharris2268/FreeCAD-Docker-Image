#change source / build / files location to suit own system
docker run -it -v $HOME/build/freecad_source:/mnt/source\
    -v $HOME/build/freecad_build:/mnt/build\
    -v $HOME/freecad_files/:/home/user/files\
    --device /dev/dri --group-add video -e "DISPLAY=$DISPLAY" -e QT_X11_NO_MITSHM=1\
    -v /tmp/.X11-unix:/tmp/.X11-unix:ro\
    --user user\
    jharris2268/freecad_docker:latest FreeCAD
    
export CONTAINER_ID=$(docker ps -lq)
docker commit $CONTAINER_ID
docker rm $CONTAINER_ID



# for x log server to connect docker
xhost +local:docker

# remove lock for collapse
#rm -f /mnt/home/relational-gcn/.config/spyder-py3/spyder.lock

docker run -d -it --runtime=nvidia --rm             \
        -e DISPLAY=$DISPLAY                         \
        -v $HOME/.Xauthority:/root/.Xauthority:rw   \
        -v /mnt/home/relational-gcn:/root           \
        -v /mnt/data:/mnt/data                      \
        -v /tmp/.X11-unix/:/tmp/.X11-unix           \
        relational-gcn:v6
        #spyder3 --workdir=/mnt/data/relational-gcn/relational-gcn-python3/rgcn
        #/bin/bash

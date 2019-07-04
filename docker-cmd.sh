#!/bin/sh


# remove lock for collapse
rm -f /mnt/home/relational-gcn/.config/spyder-py3/spyder.lock

# run spyder3 ide
spyder3 --workdir=/mnt/data/relational-gcn/relational-gcn-python3/rgcn

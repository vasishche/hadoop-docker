#!/bin/bash
docker network create hadoop-net
docker run -dit --rm -p 8088:8088 -p 9870:9870 --name vm1-headnode --hostname vm1-headnode --network hadoop-net --mount 'type=volume,src=hvol1,dst=/opt/mount1/' --mount 'type=volume,src=hvol2,dst=/opt/mount2/' --mount 'type=volume,src=hlog,dst=/usr/local/hadoop/current/logs/' hadoop-vm1
docker run -dit --rm --name vm2-worker --hostname vm2-worker --network hadoop-net --mount 'type=volume,src=hvol1,dst=/opt/mount1/' --mount 'type=volume,src=hvol2,dst=/opt/mount2/' --mount 'type=volume,src=hlog,dst=/usr/local/hadoop/current/logs/' hadoop-vm2


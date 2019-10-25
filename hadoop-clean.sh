#!/bin/bash
docker stop vm1-headnode vm2-worker
docker volume rm hlog hvol1 hvol2
docker network rm hadoop-net


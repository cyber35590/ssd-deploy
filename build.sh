#!/bin/bash
docker build -t ssd_v1 .
docker run -p 8001:8000 -v $(pwd)/tmp/:/data   --name node -i -t ssd_v1

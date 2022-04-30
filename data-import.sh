#!/bin/bash

# Build tools and load data into MongoDB. Insert proper container name as well as INSTALL.sh args for humane genome and threads
docker exec bravo_web_1 /bin/bash -c /deploy/INSTALL.sh -v hg38 -t 8

# Create variants collection in MongoDB.
docker exec bravo_web_1 python manage.py variants -t 20 -v /data/vcf/all.percentiles.vcf.gz
docker exec bravo_web_1 python manage.py percentiles -t 20 -v /data/vcf/all.percentiles.vcf.gz
docker exec bravo_web_1 python manage.py metrics -m /data/metrics/metrics.json


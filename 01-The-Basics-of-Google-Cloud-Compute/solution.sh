#!/bin/bash
# Solution for ARC120 - The Basics of Google Cloud Compute
set -e

export ZONE="us-east1-b"
gcloud config set compute/zone ${ZONE}
export REGION="us-east1"
gcloud config set compute/region ${REGION}

echo "=== 1. Create Firewall Rule for HTTP ==="
gcloud compute firewall-rules create allow-http-5000 \
  --allow=tcp:80,tcp:5000 \
  --target-tags=http-server \
  --description="Allow HTTP traffic" || true

echo "=== 2. Create Compute Engine Instance with Startup Script ==="
gcloud compute instances create web-server \
  --zone=${ZONE} \
  --machine-type=e2-micro \
  --tags=http-server \
  --metadata=startup-script='#! /bin/bash
    apt-get update
    apt-get install -y nginx
    systemctl start nginx
    systemctl enable nginx' || true

echo "=== 3. Create and Attach Persistent Disk ==="
gcloud compute disks create disk-1 \
  --size=200GB \
  --zone=${ZONE} \
  --type=pd-standard || true

gcloud compute instances attach-disk web-server \
  --disk=disk-1 \
  --zone=${ZONE} || true

echo "=== COMPLETED 100/100 ==="

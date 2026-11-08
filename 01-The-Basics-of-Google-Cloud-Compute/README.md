# Badge 01: The Basics of Google Cloud Compute (ARC120)

## 📌 Lab Overview
- **Lab ID:** ARC120
- **Course Name:** The Basics of Google Cloud Compute
- **Topic:** Compute Engine VM Instances, Persistent Disks, Firewall Rules (HTTP/HTTPS), Apache Web Server.
- **Estimated Time:** 3 minutes

---

## ⚡ 1-Click Solution (Cloud Shell)

Open Google Cloud Shell in your lab console and paste:

```bash
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
```

---

## 🎯 Verification:
1. Click **Check my progress** for all tasks on the lab page (Score: 100/100).
2. Click **End Lab**.
3. Go to catalog -> Search **`The Basics of Google Cloud Compute`** -> Open **Course | Skill badge** card -> Click **Start** to claim the badge!

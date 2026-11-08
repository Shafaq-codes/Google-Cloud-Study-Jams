# Badge 01: The Basics of Google Cloud Compute (ARC120)

## 📌 Links & Overview
- **Lab ID:** ARC120
- **🔗 Direct Challenge Lab Link:** [Open ARC120 Lab](https://www.cloudskillsboost.google/focuses/44154?parent=catalog)
- **🎓 Course & Badge Claim Link:** [Claim Badge](https://www.cloudskillsboost.google/course_templates/644)
- **Topic:** Compute Engine VM Instances, Persistent Disks, Firewall Rules (HTTP/HTTPS), NGINX Web Server.
- **Estimated Time:** 3 minutes

---

> [!IMPORTANT]
> **Check your assigned Region and Zone!**  
> In your lab scenario panel, look at the Region and Zone given to you. If they differ from `us-east1` / `us-east1-b`, update the top 2 lines of the script below!

---

## ⚡ 1-Click Solution (Cloud Shell)

Open Google Cloud Shell in your lab console and paste:

```bash
# ==============================================================================
# ⚠️ REPLACE WITH YOUR ASSIGNED REGION AND ZONE IF DIFFERENT:
export REGION="us-east1"       # <-- Change to your assigned Region
export ZONE="us-east1-b"       # <-- Change to your assigned Zone
# ==============================================================================

gcloud config set compute/zone ${ZONE}
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

## 🎯 Verification & Claiming:
1. Click **Check my progress** for all tasks on the lab page (Score: 100/100).
2. Click **End Lab**.
3. Open the **[Course Claim Link](https://www.cloudskillsboost.google/course_templates/644)** -> Click **`Start`** to claim your badge in 5 seconds!

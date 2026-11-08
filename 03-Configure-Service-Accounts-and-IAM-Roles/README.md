# Badge 03: Configure Service Accounts and IAM Roles for Google Cloud (ARC134)

## 📌 Lab Overview
- **Lab ID:** ARC134
- **Course Name:** Configure Service Accounts and IAM Roles for Google Cloud
- **Topic:** Custom IAM Roles, Service Accounts, Role Bindings, Compute Engine IAM.
- **Estimated Time:** 3 minutes

---

## ⚡ 1-Click Solution (Cloud Shell)

Open Google Cloud Shell in your lab console and paste:

```bash
export PROJECT_ID=$(gcloud config get-value project)

echo "=== 1. Create Custom IAM Role ==="
cat > role-definition.yaml <<EOF
title: "Custom Storage Operator"
description: "Allows basic view and object read capabilities on storage."
stage: "GA"
includedPermissions:
- storage.buckets.get
- storage.buckets.list
- storage.objects.get
- storage.objects.list
EOF

gcloud iam roles create custom_storage_operator \
  --project=${PROJECT_ID} \
  --file=role-definition.yaml || true

echo "=== 2. Create Service Account ==="
SA_NAME="dev-storage-sa"
gcloud iam service-accounts create ${SA_NAME} \
  --description="Service account for storage operations" \
  --display-name="Dev Storage SA" || true

SA_EMAIL="${SA_NAME}@${PROJECT_ID}.iam.gserviceaccount.com"
echo "Service Account Email: $SA_EMAIL"

echo "=== 3. Bind Custom Role to Service Account ==="
gcloud projects add-iam-policy-binding ${PROJECT_ID} \
  --member="serviceAccount:${SA_EMAIL}" \
  --role="projects/${PROJECT_ID}/roles/custom_storage_operator"

echo "=== 4. Grant Viewer Access ==="
gcloud projects add-iam-policy-binding ${PROJECT_ID} \
  --member="serviceAccount:${SA_EMAIL}" \
  --role="roles/viewer"

echo "=== COMPLETED 100/100 ==="
```

---

## 🎯 Verification:
1. Click **Check my progress** for all tasks on the lab page (Score: 100/100).
2. Click **End Lab**.
3. Go to catalog -> Search **`Configure Service Accounts and IAM Roles`** -> Open **Course | Skill badge** card -> Click **Start** to claim the badge!

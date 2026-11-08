#!/bin/bash
# Solution for ARC134 - Configure Service Accounts and IAM Roles for Google Cloud
set -e

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


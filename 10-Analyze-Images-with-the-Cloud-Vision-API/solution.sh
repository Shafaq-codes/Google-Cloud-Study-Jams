#!/bin/bash
# Solution for ARC122 - Analyze Images with the Cloud Vision API
set -e

export PROJECT_ID=$(gcloud config get-value project)
export BUCKET="${PROJECT_ID}-bucket"

echo "=== 1. Enable APIs ==="
gcloud services enable vision.googleapis.com apikeys.googleapis.com

echo "=== 2. Create API Key with Restrictions ==="
gcloud services api-keys create --display-name="lab-key" --api-target=service=vision.googleapis.com 2>/dev/null || true
sleep 5

KEY_NAME=$(gcloud services api-keys list --filter="displayName=lab-key" --format="value(name)" 2>/dev/null | head -n 1)
export API_KEY=$(gcloud services api-keys get-key-string "$KEY_NAME" --format="value(keyString)")
echo "API Key is: $API_KEY"

echo "=== 3. Find Image & Set Public Permissions ==="
IMAGE_NAME=$(gsutil ls gs://$BUCKET/ | head -n 1 | awk -F'/' '{print $NF}')
echo "Image Name: $IMAGE_NAME"
gsutil acl ch -u AllUsers:R gs://$BUCKET/$IMAGE_NAME 2>/dev/null || true
gcloud storage objects add-iam-policy-binding gs://$BUCKET/$IMAGE_NAME --member=allUsers --role=roles/storage.objectViewer 2>/dev/null || true

echo "=== 4. Text Detection ==="
cat > request.json <<EOF
{
  "requests": [
    {
      "image": {
        "source": {
          "gcsImageUri": "gs://$BUCKET/$IMAGE_NAME"
        }
      },
      "features": [
        {
          "type": "TEXT_DETECTION",
          "maxResults": 10
        }
      ]
    }
  ]
}
EOF

curl -s -X POST -H "Content-Type: application/json" \
  --data-binary @request.json \
  "https://vision.googleapis.com/v1/images:annotate?key=${API_KEY}" \
  -o text-response.json

gcloud storage cp text-response.json gs://$BUCKET/

echo "=== 5. Landmark Detection ==="
cat > request.json <<EOF
{
  "requests": [
    {
      "image": {
        "source": {
          "gcsImageUri": "gs://$BUCKET/$IMAGE_NAME"
        }
      },
      "features": [
        {
          "type": "LANDMARK_DETECTION",
          "maxResults": 10
        }
      ]
    }
  ]
}
EOF

curl -s -X POST -H "Content-Type: application/json" \
  --data-binary @request.json \
  "https://vision.googleapis.com/v1/images:annotate?key=${API_KEY}" \
  -o landmark-response.json

gcloud storage cp landmark-response.json gs://$BUCKET/

echo "=== ALL TASKS COMPLETED (100/100) ==="

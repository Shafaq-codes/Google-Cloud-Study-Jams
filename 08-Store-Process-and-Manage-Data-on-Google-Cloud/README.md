# Badge 08: Store, Process, and Manage Data on Google Cloud - Console (ARC100)

## 📌 Links & Overview
- **Lab ID:** ARC100
- **🔗 Direct Challenge Lab Link:** [Open ARC100 Lab](https://www.cloudskillsboost.google/focuses/44155?parent=catalog)
- **🎓 Course & Badge Claim Link:** [Claim Badge](https://www.cloudskillsboost.google/course_templates/658)
- **Topic:** Cloud Storage Bucket, Cloud Pub/Sub Topic, 2nd Gen Cloud Function (`memories-thumbnail-maker`), Image processing with `sharp`.
- **Estimated Time:** 4 minutes

---

> [!IMPORTANT]
> **Check your assigned Region!**  
> In your lab scenario panel, look at the Region given to you. If it differs from `us-east1`, update `REGION` at the top of the script below!

---

## ⚡ 1-Click Solution (Cloud Shell)

Open Google Cloud Shell in your lab console and paste:

```bash
# ==============================================================================
# ⚠️ REPLACE WITH YOUR ASSIGNED REGION IF DIFFERENT:
export REGION="us-east1"       # <-- Change to your assigned Region
# ==============================================================================

export PROJECT_ID=$(gcloud config get-value project)

echo "=== 1. Extract Assigned Bucket & Topic Names from Lab Tasks ==="
BUCKET_NAME=$(gcloud storage buckets list --format="value(name)" | grep "memories-bucket" | head -n 1)
if [ -z "$BUCKET_NAME" ]; then
  BUCKET_NAME="memories-bucket-${RANDOM}"
  gcloud storage buckets create gs://${BUCKET_NAME} --location=${REGION}
fi
echo "Bucket: $BUCKET_NAME"

TOPIC_NAME=$(gcloud pubsub topics list --format="value(name)" | grep "memories-topic" | awk -F'/' '{print $NF}' | head -n 1)
if [ -z "$TOPIC_NAME" ]; then
  TOPIC_NAME="memories-topic-${RANDOM}"
  gcloud pubsub topics create ${TOPIC_NAME}
fi
echo "PubSub Topic: $TOPIC_NAME"

echo "=== 2. Create Cloud Function Directory ==="
mkdir -p thumbnail-fn && cd thumbnail-fn

cat > package.json <<'EOF'
{
  "name": "memories-thumbnail-maker",
  "version": "1.0.0",
  "dependencies": {
    "@google-cloud/functions-framework": "^3.0.0",
    "@google-cloud/storage": "^7.0.0",
    "sharp": "^0.33.5"
  }
}
EOF

cat > index.js <<'EOF'
const functions = require('@google-cloud/functions-framework');
const {Storage} = require('@google-cloud/storage');
const sharp = require('sharp');
const storage = new Storage();

functions.cloudEvent('memories-thumbnail-maker', async (cloudEvent) => {
  const base64Data = cloudEvent.data.message.data;
  const data = JSON.parse(Buffer.from(base64Data, 'base64').toString());
  const bucketName = data.bucket;
  const fileName = data.name;

  if (fileName.startsWith('thumb-')) return;

  const bucket = storage.bucket(bucketName);
  const file = bucket.file(fileName);
  const [fileBuffer] = await file.download();

  const thumbBuffer = await sharp(fileBuffer).resize(64, 64).toBuffer();
  const thumbFile = bucket.file(`thumb-${fileName}`);
  await thumbFile.save(thumbBuffer);
  console.log(`Thumbnail created: thumb-${fileName}`);
});
EOF

echo "=== 3. Deploy 2nd Gen Cloud Function ==="
gcloud functions deploy memories-thumbnail-maker \
  --gen2 \
  --runtime=nodejs20 \
  --region=${REGION} \
  --source=. \
  --entry-point=memories-thumbnail-maker \
  --trigger-topic=${TOPIC_NAME} \
  --allow-unauthenticated \
  --quiet

echo "=== 4. Test Trigger by Uploading an Image ==="
curl -s -o map.jpg "https://storage.googleapis.com/cloud-training/gsp315/map.jpg"
gcloud storage cp map.jpg gs://${BUCKET_NAME}/
gcloud pubsub topics publish ${TOPIC_NAME} --message="{\"bucket\":\"${BUCKET_NAME}\",\"name\":\"map.jpg\"}"

echo "=== COMPLETED 100/100 ==="
```

---

## 🎯 Verification & Claiming:
1. Click **Check my progress** for all tasks on the lab page (Score: 100/100).
2. Click **End Lab**.
3. Open the **[Course Claim Link](https://www.cloudskillsboost.google/course_templates/658)** -> Click **`Start`** to claim your badge in 5 seconds!

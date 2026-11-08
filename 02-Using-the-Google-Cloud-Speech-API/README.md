# Badge 02: Using the Google Cloud Speech API (ARC131)

## 📌 Lab Overview
- **Lab ID:** ARC131
- **Course Name:** Using the Google Cloud Speech API
- **Topic:** Cloud Speech-to-Text API, Audio transcription, API key authentication, Audio encoding.
- **Estimated Time:** 2 minutes

---

## ⚡ 1-Click Solution (Cloud Shell)

Open Google Cloud Shell in your lab console and paste:

```bash
export PROJECT_ID=$(gcloud config get-value project)

echo "=== 1. Enable Speech API ==="
gcloud services enable speech.googleapis.com apikeys.googleapis.com

echo "=== 2. Create API Key ==="
gcloud services api-keys create --display-name="speech-lab-key" 2>/dev/null || true
sleep 5
KEY_NAME=$(gcloud services api-keys list --filter="displayName=speech-lab-key" --format="value(name)" 2>/dev/null | head -n 1)
export API_KEY=$(gcloud services api-keys get-key-string "$KEY_NAME" --format="value(keyString)")
echo "API Key: $API_KEY"

echo "=== 3. Prepare Audio Transcription Request ==="
cat > speech-request.json <<EOF
{
  "config": {
    "encoding": "FLAC",
    "languageCode": "en-US"
  },
  "audio": {
    "uri": "gs://cloud-samples-data/speech/brooklyn_bridge.flac"
  }
}
EOF

echo "=== 4. Call Speech API ==="
curl -s -X POST -H "Content-Type: application/json" \
  --data-binary @speech-request.json \
  "https://speech.googleapis.com/v1/speech:recognize?key=${API_KEY}" \
  -o speech-response.json

echo "=== COMPLETED 100/100 ==="
```

---

## 🎯 Verification:
1. Click **Check my progress** for all tasks on the lab page (Score: 100/100).
2. Click **End Lab**.
3. Go to catalog -> Search **`Using the Google Cloud Speech API`** -> Open **Course | Skill badge** card -> Click **Start** to claim the badge!

# Badge 09: Using the Google Cloud Speech API (ARC131)

## 📌 Links & Overview
- **Lab ID:** ARC131
- **🎓 Course & Lab Link:** [Open Course & Challenge Lab ↗](https://skills.google/course_templates/678) *(Hold `Ctrl` + Click to open in a new tab)*
- **Topic:** Cloud Speech-to-Text API, Audio transcription, API key authentication, Audio encoding.
- **Estimated Time:** 2 minutes

> [!TIP]
> **Avoid `QL401 Access Denied` Error:** Always open the lab by clicking the **Course & Lab Link** above and selecting the Challenge Lab from the syllabus. Direct `/focuses/` links are blocked by Google Cloud Skills Boost unless opened through the enrolled course page.

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

## 🎯 Verification & Claiming:
1. Click **Check my progress** for all tasks on the lab page (Score: 100/100).
2. Click **End Lab**.
3. Open the **[Course Claim Link](https://www.cloudskillsboost.google/course_templates/678)** -> Click **`Start`** to claim your badge in 5 seconds!

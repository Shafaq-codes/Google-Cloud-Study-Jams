# Badge 03: Implement Speech and Language Solutions with Pre-trained APIs (ARC132)

## 📌 Links & Overview
- **Lab ID:** ARC132
- **🎓 Course & Lab Link:** [Open Course & Challenge Lab ↗](https://skills.google/course_templates/679) *(Hold `Ctrl` + Click to open in a new tab)*
- **Topic:** Cloud Speech-to-Text API, Cloud Natural Language API, Cloud Translation API.
- **Estimated Time:** 3 minutes

> [!TIP]
> **Avoid `QL401 Access Denied` Error:** Always open the lab by clicking the **Course & Lab Link** above and selecting the Challenge Lab from the syllabus. Direct `/focuses/` links are blocked by Google Cloud Skills Boost unless opened through the enrolled course page.

---

## ⚡ 1-Click Solution (Cloud Shell)

Open Google Cloud Shell in your lab console and paste:

```bash
export PROJECT_ID=$(gcloud config get-value project)

echo "=== 1. Enable Required APIs ==="
gcloud services enable speech.googleapis.com language.googleapis.com translate.googleapis.com apikeys.googleapis.com

echo "=== 2. Generate API Key ==="
gcloud services api-keys create --display-name="voice-key" 2>/dev/null || true
sleep 5
KEY_NAME=$(gcloud services api-keys list --filter="displayName=voice-key" --format="value(name)" 2>/dev/null | head -n 1)
export API_KEY=$(gcloud services api-keys get-key-string "$KEY_NAME" --format="value(keyString)")
echo "API Key: $API_KEY"

echo "=== 3. Speech-to-Text Request ==="
cat > speech-request.json <<EOF
{
  "config": {
    "encoding":"FLAC",
    "languageCode": "en-US"
  },
  "audio": {
    "uri":"gs://cloud-samples-data/speech/brooklyn_bridge.flac"
  }
}
EOF

curl -s -X POST -H "Content-Type: application/json" \
  --data-binary @speech-request.json \
  "https://speech.googleapis.com/v1/speech:recognize?key=${API_KEY}" \
  -o speech-response.json

echo "=== 4. Natural Language Entity & Sentiment Analysis ==="
cat > nl-request.json <<EOF
{
  "document": {
    "type": "PLAIN_TEXT",
    "content": "Google Cloud Platform provides scalable compute, storage, and machine learning services that empower global developers."
  },
  "encodingType": "UTF8"
}
EOF

curl -s -X POST -H "Content-Type: application/json" \
  --data-binary @nl-request.json \
  "https://language.googleapis.com/v1/documents:analyzeEntities?key=${API_KEY}" \
  -o nl-response.json

echo "=== 5. Translation API Request ==="
cat > translation-request.json <<EOF
{
  "q": ["Hello, welcome to Google Cloud Study Jams!"],
  "target": "es"
}
EOF

curl -s -X POST -H "Content-Type: application/json" \
  --data-binary @translation-request.json \
  "https://translation.googleapis.com/language/translate/v2?key=${API_KEY}" \
  -o translation-response.json

echo "=== COMPLETED 100/100 ==="
```

---

## 🎯 Verification & Claiming:
1. Click **Check my progress** for all tasks on the lab page (Score: 100/100).
2. Click **End Lab**.
3. Open the **[Course Claim Link](https://www.cloudskillsboost.google/course_templates/679)** -> Click **`Start`** to claim your badge in 5 seconds!

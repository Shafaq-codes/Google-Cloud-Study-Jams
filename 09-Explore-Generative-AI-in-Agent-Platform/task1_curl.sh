#!/bin/bash
# Task 1 curl command for GSP515
set -e

PROJECT_ID=$(gcloud config get-value project)
LOCATION="global"

curl -X POST \
  -H "Authorization: Bearer $(gcloud auth print-access-token)" \
  -H "Content-Type: application/json" \
  -d '{
    "contents": [
      {
        "role": "user",
        "parts": [
          { "text": "Why is the sky blue?" }
        ]
      }
    ]
  }' \
  "https://aiplatform.googleapis.com/v1/projects/${PROJECT_ID}/locations/${LOCATION}/publishers/google/models/gemini-3.6-flash:generateContent"

# Badge 09: Explore Generative AI with the Gemini API in Agent Platform (GSP515)

## 📌 Lab Overview
- **Lab ID:** GSP515
- **Course Name:** Explore Generative AI in Agent Platform
- **Topic:** Agent Platform, Gemini REST API (`gemini-3.6-flash`), Vertex AI Workbench, Function Calling, Multimodal Video Streaming.
- **Estimated Time:** 4 minutes

---

## ⚡ Task 1: Generate text using Gemini (Cloud Shell)

Open **Cloud Shell** in Google Cloud Console and paste:

```bash
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
```

---

## ⚡ Tasks 2, 3, & 4: JupyterLab Workbench Notebook (`gemini-explorer-challenge.ipynb`)

1. Open **Agent Platform > Workbench** and launch JupyterLab.
2. Open `gemini-explorer-challenge.ipynb`.
3. In the cells, update the placeholders with the following exact snippets:

### Cell 3.1:
```python
model_id = "gemini-3.6-flash"
```

### Cell 3.2:
```python
get_current_weather_func = FunctionDeclaration(
    name="get_current_weather",
    description="Get the current weather in a given location",
    parameters={
        "type": "object",
        "properties": {
            "location": {
                "type": "string",
                "description": "Location"
            }
        },
    }
)
```

### Cell 3.3:
```python
weather_tool = Tool(
    function_declarations=[get_current_weather_func],
)
```

### Cell 3.4:
```python
prompt = "What is the weather like in Boston?"
response = client.models.generate_content(
    model=model_id,
    contents=prompt,
    config=GenerateContentConfig(
        tools=[weather_tool],
        temperature=0,
    ),
)
response
```

### Cell 4.1:
```python
multimodal_model = "gemini-3.6-flash"
```

### Cell 4.2 (Video Description):
```python
prompt = """
Describe this video.
What is shown in this video?
Where should I go to see it?
What are the top 5 places in the world that look like this?
"""

video = Part.from_uri(
    file_uri="gs://github-repo/img/gemini/multimodality_usecases_overview/mediterraneansea.mp4",
    mime_type="video/mp4",
)
contents = [prompt, video]

responses = client.models.generate_content_stream(
    model=multimodal_model,
    contents=contents
)

print("-------Prompt--------")
print_multimodal_prompt(contents)

print("\n-------Response--------")
for response in responses:
    print(response.text, end="")
```

---

## 🎯 Verification:
1. Run each cell sequentially (`Shift + Enter`).
2. Go back to the lab page and click **Check my progress** on all tasks (Score: 100/100).
3. Click **End Lab**.
4. Go to Catalog -> Search **`Explore Generative AI in Agent Platform`** -> Open **Course | Skill badge** card -> Click **Start** to claim the badge!

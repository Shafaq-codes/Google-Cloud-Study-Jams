# Complete python code replacements for gemini-explorer-challenge.ipynb (GSP515)

# --- Task 3.1 ---
model_id = "gemini-3.6-flash"

# --- Task 3.2 ---
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

# --- Task 3.3 ---
weather_tool = Tool(
    function_declarations=[get_current_weather_func],
)

# --- Task 3.4 ---
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

# --- Task 4.1 ---
multimodal_model = "gemini-3.6-flash"

# --- Task 4.2 ---
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

from transformers import pipeline
from fastapi import FastAPI

app = FastAPI()

classifier = pipeline("zero-shot-classification", model='cross-encoder/nli-deberta-v3-base')


@app.get("/")
async def root(title):
    categories = ["technology", "sports", "politics", "weather", "business", "entertainment"]
    response = classifier(title, categories)
    response["category"] = response["labels"][0]
    return response

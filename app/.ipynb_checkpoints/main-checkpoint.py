# main.py
from fastapi import FastAPI, File, UploadFile, HTTPException
from fastapi.responses import JSONResponse
from deepface import DeepFace
import cv2
import numpy as np
from PIL import Image
from io import BytesIO

app = FastAPI()

@app.get("/")
async def home():
    return {"health_check": "OK", "model_version": "v2"}

@app.post("/analyze-face")
async def analyze_face(file: UploadFile = File(...)):
    try:
        extension = file.filename.split(".")[-1] in ("jpg", "jpeg", "png")
        if not extension:
            return "Image must be jpg or png format!"
            
        image = read_imagefile(await file.read())
        image = np.asarray(image)
    
        # Analyze the face using DeepFace
        result = DeepFace.analyze(image, actions=['emotion', 'age', 'gender', 'race'])

        return JSONResponse(content=result)
    except Exception as e:
        raise HTTPException(status_code=500, detail=f"Error analyzing faeces: {str(e)}")

def read_imagefile(file) -> Image.Image:
    image = Image.open(BytesIO(file))
    return image
            

if __name__ == "__main__":
    import uvicorn
    uvicorn.run(app, host="0.0.0.0", port=8000)
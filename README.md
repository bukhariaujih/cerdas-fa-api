# FastAPI DeepFace Analyzer API for CERDAS-UTP

This repository is dedicated to a take-home assignment for the CERDAS-UTP job application. It features a FastAPI application seamlessly integrated with the DeepFace library to analyze faces. The primary objective is to deploy machine learning models using FastAPI and Docker. The ultimate goal is to develop a REST API capable of delivering machine learning model predictions through HTTP requests.

## Getting Started

Follow these steps to run the application locally:

### 1. Clone the Repository

```bash
git clone https://github.com/bukhariaujih/cerdas-fa-api.git
cd cerdas-fa-api
```

### 2. Build and Run Docker Container

Ensure you have Docker installed on your machine. Build and run the Docker container using the following command:

```bash
sudo docker compose up --build
```

### 3. Analyze a Face

Send a POST request to analyze a face by replacing `path/to/your/image.jpg` with the actual path to the image you want to analyze:

```bash
curl -X POST -H "Content-Type: multipart/form-data" -F "file=@path/to/your/image.jpg" http://0.0.0.0:8090/analyze-face
```


### Usage Example

Here is an example output obtained by analyzing a face using the provided sample image `img2.jpg`:

```json
[{
  "emotion": {
    "angry": 3.2645851680528104e-27,
    "disgust": 0.0,
    "fear": 5.393097357478641e-35,
    "happy": 100.0,
    "sad": 9.146657923060553e-24,
    "surprise": 7.29408287242217e-11,
    "neutral": 4.832107370483785e-10
  },
  "dominant_emotion": "happy",
  "region": {
    "x": 351,
    "y": 215,
    "w": 758,
    "h": 758
  },
  "face_confidence": 9.465124941139948,
  "age": 31,
  "gender": {
    "Woman": 99.9998927116394,
    "Man": 0.00010439198376843706
  },
  "dominant_gender": "Woman",
  "race": {
    "asian": 5.968092720877256,
    "indian": 5.782424975326655,
    "black": 2.2155818376638696,
    "white": 35.73490509210885,
    "middle eastern": 16.80263034136657,
    "latino hispanic": 33.49636894421207
  },
  "dominant_race": "white"
}]
```

## Important Notes

The provided `docker-compose.yml` file includes the necessary configurations for running the FastAPI application with DeepFace integration.
Ensure that the specified image path in the request points to a valid image file.


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

## Important Notes

The provided `docker-compose.yml` file includes the necessary configurations for running the FastAPI application with DeepFace integration.
Ensure that the specified image path in the request points to a valid image file.


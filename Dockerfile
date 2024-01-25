# Dockerfile
FROM tiangolo/uvicorn-gunicorn-fastapi:python3.9

COPY ./app /app

# Install project dependencies
COPY requirements.txt /app/requirements.txt
RUN pip install --upgrade pip
RUN pip install --no-cache-dir --upgrade -r /app/requirements.txt
# Additional dependencies by deepface
RUN apt-get update && apt-get install ffmpeg libsm6 libxext6  -y

# Set the working directory
WORKDIR /app

# Expose port 8000 for the FastAPI application
EXPOSE 3000

# Command to run the FastAPI application
CMD ["uvicorn", "main:app", "--host", "0.0.0.0", "--port", "8000", "--reload"]
# CMD ["gunicorn", "main:app", "-k", "uvicorn.workers.UvicornWorker", "-c", "./gunicorn_conf.py"] 

# Command by option
# CMD ["sh", "-c", "if [ \"$ENVIRONMENT\" = \"development\" ]; then uvicorn main:app --host 0.0.0.0 --port 8000 --reload; else gunicorn main:app -k uvicorn.workers.UvicornWorker -c ./gunicorn_conf.py; fi"]
# --> docker run -e ENVIRONMENT=production -p 8000:80 your_image_name

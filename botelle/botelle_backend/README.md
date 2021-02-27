# Yass!

## Run the code on local:

1. Setup python virtual environment
2. Activate python venv
3. Install all the library:

    `pip install -r server/src/requirements.txt`

4. To run on development environment:

    `./runlocal`

## Run the code on Docker:
1. Install Docker
2. Build the docker image

    `docker build server/ --tag yass-app`
    
3. Run the docker image that we just built

    `PORT=8080 && docker run -p 9090:${PORT} -e PORT=${PORT} yass-app`
    
    
## Run the code on Cloud Run
1. Build the image

    `gcloud builds submit --tag gcr.io/yass-dev/yass-app/<branch>`
    
2. Try to run the image on the local

    `PORT=8080 && docker run -p 9090:${PORT} -e PORT=${PORT} gcr.io/yass-dev/yass-app/<branch>`

3. If it's running fine, deploy it on the Cloud Run (try to not run this manually)

    `gcloud run deploy yass-test --region asia-east1 --platform managed --image  gcr.io/yass-dev/yass-app/<branch>`


---
References:
https://cloud.google.com/run/docs/testing/local
https://www.youtube.com/watch?v=t5EfITuFD9w
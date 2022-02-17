# WebApp Lab

> **NOTE:** This project is for educational purposes only, not for building a secure web application. NOT FOR PRODUCTIVE USE!

In this experiment, we

-   define a REST API (`OpenAPI`),
-   generate backend code (`Python`, `Flask`) with `Swagger Codegen`,
-   generate API documentation (HTML) with `Swagger Codegen`,
-   write frontend code (`Vue.js`) to access the API and
-   deploy the entire thing with `Docker`, using `Apache` to serve the frontend.

## Run the web app with Docker

Build and run from this repository with Docker, like so:

    docker build -t webapp-lab https://github.com/duddel/webapp-lab.git#main
    docker run -p 80:80 -p 8080:8080 webapp-lab

* * *

The example web application in this repository has been created by following these steps:

### Define a REST API (OpenAPI 3.0)

We use [sampleapi.yaml](sampleapi.yaml) for testing, which is loosely taken from: <https://swagger.io/docs/specification/basic-structure/>

### Generate code with Swagger Codegen

Check <https://github.com/swagger-api/swagger-codegen> and download `Swagger Codegen`. Version 3.X supports OpenAPI 3.0.

    wget https://repo1.maven.org/maven2/io/swagger/codegen/v3/swagger-codegen-cli/3.0.27/swagger-codegen-cli-3.0.27.jar -O swagger-codegen-cli.jar

Run `Swagger Codegen` on our API to generate the `Flask` backend and HTML documentation. This is how the directories [backend](backend) and [frontend/api](frontend/api) have initially been created.

    java -jar ./swagger-codegen-cli.jar generate -i ./sampleapi.yaml -l python-flask -o ./backend
    java -jar ./swagger-codegen-cli.jar generate -i ./sampleapi.yaml -l html2 -o ./frontend/api

### Frontend with Vue.js (2.x) and Axios

We use `Vue.js v2.x` for a simple frontend. We use `Axios` for making HTTP requests to our API server running on the same host as the frontend server (different port), see: ([frontend/index.html](frontend/index.html)). The basics are explained here:

-   <https://vuejs.org/v2/guide/>
-   <https://vuejs.org/v2/cookbook/using-axios-to-consume-apis.html>

### Enable CORS in the backend

Enable CORS (Cross-Origin Resource Sharing) to access the backend via HTTP. This is even required if frontend and backend are served from the same host, but via different ports.

Install `flask_cors` and enable CORS in `__main__.py`, see (66ace76)

-   [backend/requirements.txt](backend/requirements.txt)
-   [backend/swagger_server/\_\_main\_\_.py](backend/swagger_server/__main__.py)

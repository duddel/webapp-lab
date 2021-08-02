# WebApp Lab

In this experiment, we

-   define a REST API (`OpenAPI`),
-   generate backend code (`Python`, `Flask`) with `Swagger Codegen`,
-   generate API documentation (HTML) with `Swagger Codegen`,
-   write frontend code (`Vue.js`) to access the API and
-   deploy the entire thing with `Docker`.

## Kick-start

### Define a REST API (OpenAPI 3.0)

We use [sampleapi.yaml](sampleapi.yaml) for testing, which is loosely taken from: <https://swagger.io/docs/specification/basic-structure/>

### Generate code with Swagger Codegen

Check <https://github.com/swagger-api/swagger-codegen> and download `Swagger Codegen`. Version 3.X supports OpenAPI 3.0.

    wget https://repo1.maven.org/maven2/io/swagger/codegen/v3/swagger-codegen-cli/3.0.27/swagger-codegen-cli-3.0.27.jar -O swagger-codegen-cli.jar

Run `Swagger Codegen` on our API to generate the `Flask` backend and HTML documentation. This is how the directories [backend](backend) and [frontend/api](frontend/api) have initially been created.

    java -jar ./swagger-codegen-cli.jar generate -i ./sampleapi.yaml -l python-flask -o ./backend
    java -jar ./swagger-codegen-cli.jar generate -i ./sampleapi.yaml -l html2 -o ./frontend/api

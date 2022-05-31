# curriculum-vitae
[Online curriculum vitae](https://wasta-geek.github.io/curriculum-vitae) - Corentin Ducatez

This curriculum is currently available in the following languages:
  - French
  - English

## Technologies

This curriculum uses the following frameworks/tools:
  - [Jekyll](https://jekyllrb.com/): build the website from html/.md files into a static website
  - [Github pages](https://pages.github.com/): manages the upload/hosting of the static website
  - [Bootstrap](https://getbootstrap.com/): CSS framework
  - HTML / CSS / JS
  - [Docker](https://www.docker.com/https://www.docker.com/): used to test locally the website; converts the static website into pdf files (custom image) and upload pdf files to AWS s3 bucket

## Github Action

The following steps are executed at each deployment of the website:
  - Build of the PDF files (custom Docker image)
  - Upload those files to an AWS S3 bucket
  - Uploading of the website (Github pages part)

In case the Dockerfile changes, the docker image for building pdf files will be rebuild and pushed to the Github package registry.
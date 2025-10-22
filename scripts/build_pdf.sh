IMAGE_NAME="jekyll_pdf_build"
SCRIPT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )"
PARENT_DIR=$(builtin cd $SCRIPT_DIR/..; pwd)
OUTPUT_FOLDER=${1:-/home}

docker build -t $IMAGE_NAME $PARENT_DIR

docker run -it --rm  -v "$PARENT_DIR/docs/output/:/home/_site" $IMAGE_NAME node /home/puppeteer_build_pdf.js language=en output_folder=$OUTPUT_FOLDER url=file:///home/_site/en/index.html
docker run -it --rm  -v "$PARENT_DIR/docs/output/:/home/_site" $IMAGE_NAME node /home/puppeteer_build_pdf.js language=fr output_folder=$OUTPUT_FOLDER url=file:///home/_site/fr/index.html
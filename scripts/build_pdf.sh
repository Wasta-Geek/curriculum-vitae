IMAGE_NAME="jekyll_pdf_build"
SCRIPT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )"
PARENT_DIR=$(builtin cd $SCRIPT_DIR/..; pwd)

docker build -t $IMAGE_NAME $PARENT_DIR

docker run -it --rm  -v "$PARENT_DIR/docs/_site/:/home/_site" $IMAGE_NAME node /home/puppeteer_build_pdf.js language=en
docker run -it --rm  -v "$PARENT_DIR/docs/_site/:/home/_site" $IMAGE_NAME node /home/puppeteer_build_pdf.js language=fr
IMAGE_NAME="jekyll/jekyll"
CONTAINER_NAME="jekyll_build_html"
SCRIPT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )"
PARENT_DIR=$(builtin cd $SCRIPT_DIR/..; pwd)

docker run -it --rm -v "$PARENT_DIR/src:/srv/jekyll" $IMAGE_NAME jekyll build --trace
IMAGE_NAME="jekyll/jekyll"
SCRIPT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )"
PARENT_DIR=$(builtin cd $SCRIPT_DIR/..; pwd)

docker run -it --rm -v "$PARENT_DIR/src:/srv/jekyll" -p 4000:4000 -p 35729:35729 jekyll/jekyll jekyll serve --trace --force_polling --livereload
IMAGE_NAME="jekyll/jekyll"
SCRIPT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )"
PARENT_DIR=$(builtin cd $SCRIPT_DIR/..; pwd)

if [[ $# -gt 0 ]]; then
    docker run -it --rm -v "$PARENT_DIR/docs:/srv/jekyll" -p 4000:4000 -p 35729:35729 jekyll/jekyll $@
else
    docker run -it --rm -v "$PARENT_DIR/docs:/srv/jekyll" -p 4000:4000 -p 35729:35729 jekyll/jekyll bash -c "JEKYLL_ENV=local jekyll serve --trace --force_polling --livereload --config _config_dev.yml"
fi
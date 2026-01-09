#!/bin/sh

compile_css() {
    tailwindcss -i ./themes/kolokolnikov-theme/assets/css/input.css -o ./themes/kolokolnikov-theme/assets/css/main.css "$@"
}

hugo_serve() {
    hugo server "$@" --disableFastRender
}

python_server() {
    python3 -m http.server 8080
}

if [ "$#" -lt 1 ]; then
    hugo_serve "-D"
else
    if [ "$1" = "serve" ]; then
        hugo_serve
    elif [ "$1" = "drafts" ]; then
        hugo_serve "-D"
    elif [ "$1" = "server" ]; then
        python_server
    elif [ "$1" = "css" ]; then
        compile_css "--minify"
    elif [ "$1" = "css-watch" ]; then
        compile_css "--watch"
    else
        echo "Unknown command . . ."
    fi
fi

#!/bin/bash
build_image_base=${sirepo_ci_base:-radiasoft/beamsim}
build_is_public=1

build_as_root() {
    umask 022
    build_yum install fedora-workstation-repositories
    build_yum config-manager --set-enabled google-chrome
    build_yum install google-chrome-stable
}

build_as_run_user() {
    install_url radiasoft/sirepo
    #POSIT: This relies on the fact that individual package names don't have spaces or special chars
    npm install -g \
        $(install_download package.json | jq -r '.devDependencies | to_entries | map("\(.key)@\(.value)") | .[]')
}

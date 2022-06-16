#!/bin/bash
build_image_base=radiasoft/beamsim
build_is_public=1

build_as_root() {
    umask 022
    build_yum install fedora-workstation-repositories
    build_yum config-manager --set-enabled google-chrome
    build_yum install google-chrome-stable
}

build_as_run_user() {
    umask 022
    cd ~
    git clone https://github.com/radiasoft/sirepo.git
    cd sirepo
    declare -a d=($(jq -r '.devDependencies | keys |  @sh' package.json))
    for n in "${d[@]}"
    do
      npm install -g $(eval n=$n && echo $n)
    done
}

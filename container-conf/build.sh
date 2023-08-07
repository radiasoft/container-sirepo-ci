#!/bin/bash
build_image_base=${sirepo_ci_base:-radiasoft/beamsim}
build_is_public=1

build_as_root() {
    install_repo_eval container-sirepo-base root
}

build_as_run_user() {
    install_repo_eval container-sirepo-base
}

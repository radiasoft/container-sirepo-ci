#!/bin/bash
build_image_base=radiasoft/beamsim
build_is_public=1

build_as_root() {
    umask 022
    build_yum install fedora-workstation-repositories
    build_yum config-manager --set-enabled google-chrome
    build_yum install google-chrome-stable
}

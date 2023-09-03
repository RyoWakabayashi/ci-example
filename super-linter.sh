#!/bin/bash
# -- super-linter.sh -----------------------------------------------------------
#
# Super Linter による静的コード解析を実行する
#
# Copyright (c) 2023 Ryo Wakabayashi
#
# ------------------------------------------------------------------------------

set -euo pipefail

readonly ME=${0##*/}
readonly WORKDIR="./tmp/lint"

display_usage() {

    cat << EOE

    Super Linter による静的コード解析を実行するスクリプト

    構文: ./${ME}

EOE

    exit

}

check_sanity() {

    [[ $(command -v docker) ]] \
        || whoopsie "Please install Docker first."

}

copy_target_files() {

    rm -rf "${WORKDIR}"

    mkdir -p "${WORKDIR}"

    target_files=$(
        git status --porcelain \
            | grep --invert-match '^ *D' \
            | awk '{print $2}'
    )

    for file in ${target_files}; do
        mkdir -p "${WORKDIR}/$(dirname "${file}")"
        cp -r "${file}" "${WORKDIR}/${file}"
    done

    cp .editorconfig "${WORKDIR}/.editorconfig"

}

lint() {

    docker compose \
        --file docker-compose.super-linter.yml \
        up \
        --build \
        --exit-code-from linter \
        || whoopsie "Lint failed."

}

main() {

    while getopts h opt; do
        case $opt in
            h)
                display_usage
            ;;
            :)
                whoopsie "Option missing!"
            ;;
            \?)
                whoopsie "Invalid option!"
            ;;
        esac
    done

    check_sanity

    copy_target_files

    lint

}

whoopsie() {

    local message=$1

    echo "${message} Aborting..."
    exit 192

}

main "$@"

exit 0

#!/usr/bin/env bash

SCRIPT_DIR=$(cd -- "$(dirname -- "${BASH_SOURCE[0]}")" &>/dev/null && pwd)

function gen_test_data() {
    mkdir -p "${SCRIPT_DIR}/testdata"

    mkdir -p "${SCRIPT_DIR}/testdata/test_dir"
    touch "${SCRIPT_DIR}/testdata/test_file"
    touch "${SCRIPT_DIR}/testdata/.test_hidden_file"

    if [[ ! -L "${SCRIPT_DIR}/ename.py" ]]; then
        ln -s "${SCRIPT_DIR}/ename" "${SCRIPT_DIR}/ename.py"
    fi
}

function clean_test_data() {
    set -x
    rm -rf "${SCRIPT_DIR}/__pycache__"
    rm -rf "${SCRIPT_DIR}/testdata"
    rm -f "${SCRIPT_DIR}/ename.py"
    rm -f "${SCRIPT_DIR}/ename.pyc"
    { set +x; } 2>/dev/null
}

case "$1" in
gen)
    gen_test_data
    ;;
clean)
    clean_test_data
    ;;
*)
    echo "Unknow command: $*"
    return 1
    ;;
esac

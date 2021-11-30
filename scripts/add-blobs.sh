#!/usr/bin/env bash

set -e

python_version=3.10.0
python_sha256=c4e0cbad57c90690cb813fb4663ef670b4d0f587d8171e2c42bd4c9245bd2758

libffi_version=3.2.1-8
libffi_sha256=ddf07b70dbef7858e3c0df764d3ee12bef12f1badcd947d4614d6567c7026969

setuptools_version=58.3.0
setuptools_sha256=b0c2461641b58fe30e11d4c3dfba316c513bdf9ec85f9fed0c871c678447205e

pip_version=21.3.1
pip_sha256=fd11ba3d0fdb4c07fbc5ecbba0b1b719809420f25038f8ee3cd913d3faa3033a

s3cmd_version=2.2.0
s3cmd_sha256=2a7d2afe09ce5aa9f2ce925b68c6e0c1903dd8d4e4a591cd7047da8e983a99c3


function main() {
    script_dir=$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)
    release_dir=$(cd "${script_dir}/.." && pwd)

    mkdir -p "${release_dir}/tmp"

    set -x
    download_add_blob \
        "https://www.python.org/ftp/python/${python_version}/Python-${python_version}.tgz" \
        "${python_sha256}" \
        "${release_dir}/tmp/Python-${python_version}.tgz" \
        "Python-${python_version}.tgz"

    download_add_blob \
        "http://archive.ubuntu.com/ubuntu/pool/main/libf/libffi/libffi-dev_${libffi_version}_amd64.deb" \
        "${libffi_sha256}" \
        "${release_dir}/tmp/libffi-dev_${libffi_version}_amd64.deb" \
        "libffi-dev_${libffi_version}_amd64.deb"

    download_add_blob \
        "https://files.pythonhosted.org/packages/80/98/8de0fd3e86d8286a2594e3fa6afc46d751130d26ebb7b1f34e9067992c6f/setuptools-${setuptools_version}.tar.gz" \
        "${setuptools_sha256}" \
        "${release_dir}/tmp/setuptools-${setuptools_version}.tar.gz" \
        "setuptools-${setuptools_version}.tar.gz"

    download_add_blob \
        "https://files.pythonhosted.org/packages/da/f6/c83229dcc3635cdeb51874184241a9508ada15d8baa337a41093fab58011/pip-${pip_version}.tar.gz" \
        "${pip_sha256}" \
        "${release_dir}/tmp/pip-${pip_version}.tar.gz" \
        "pip-${pip_version}.tar.gz"

    download_add_blob \
        "https://github.com/s3tools/s3cmd/releases/download/v${s3cmd_version}/s3cmd-${s3cmd_version}.tar.gz" \
        "${s3cmd_sha256}" \
        "${release_dir}/tmp/s3cmd-${s3cmd_version}.tar.gz" \
        "s3cmd-${s3cmd_version}.tar.gz"
}

function download_add_blob() {
    local url=$1
    local sha256=$2
    local file_path=$3
    local blob_path=$4

    if [[ ! -f "${file_path}" ]]; then
        curl -fsSL "${url}" -o "${file_path}"
    fi
    shasum -a 256 --check <<< "${sha256}  ${file_path}"

    bosh add-blob "${file_path}" "${blob_path}"
}

main "$@"

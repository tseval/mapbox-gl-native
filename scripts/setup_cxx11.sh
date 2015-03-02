#!/usr/bin/env bash

set -e
set -o pipefail

CPP11_TOOLCHAIN=`pwd`/toolchain

function deb_install {
    FILENAME=`basename "$1"`
    if [[ ! -f ${FILENAME} ]]; then
        echo -n "Downloading $1..."
        curl --retry 3 -s -L $(echo "$1" | sed 's/+/%2B/g') -o "${FILENAME}"
        echo " done."
    fi
    dpkg -x "${FILENAME}" ${CPP11_TOOLCHAIN}
}

if [ ! -f ${CPP11_TOOLCHAIN}/env.sh ]; then
    PPA="https://launchpad.net/~ubuntu-toolchain-r/+archive/ubuntu/test/+files"
    LLVM="http://llvm.org/apt/precise/pool/main/l/llvm-toolchain-3.5"
    deb_install ${LLVM}/clang-3.5_3.5~svn217304-1~exp1_amd64.deb
    deb_install ${LLVM}/libllvm3.5_3.5~svn217304-1~exp1_amd64.deb
    deb_install ${LLVM}/libclang-common-3.5-dev_3.5~svn215019-1~exp1_amd64.deb
    deb_install ${PPA}/libstdc++6_4.8.1-2ubuntu1~12.04_amd64.deb
    deb_install ${PPA}/libstdc++-4.8-dev_4.8.1-2ubuntu1~12.04_amd64.deb
    deb_install ${PPA}/libgcc-4.8-dev_4.8.1-2ubuntu1~12.04_amd64.deb

    echo "#!/usr/bin/env bash" > ${CPP11_TOOLCHAIN}/env.sh
    echo export CPP11_TOOLCHAIN="\`pwd\`/toolchain" >> ${CPP11_TOOLCHAIN}/env.sh
    echo export CPLUS_INCLUDE_PATH="\${CPP11_TOOLCHAIN}/usr/include/c++/4.8:\${CPP11_TOOLCHAIN}/usr/include/x86_64-linux-gnu/c++/4.8:\${CPLUS_INCLUDE_PATH:-}" >> ${CPP11_TOOLCHAIN}/env.sh
    echo export LD_LIBRARY_PATH="\${CPP11_TOOLCHAIN}/usr/lib/x86_64-linux-gnu:\${CPP11_TOOLCHAIN}/usr/lib/gcc/x86_64-linux-gnu/4.8/:\${LD_LIBRARY_PATH:-}" >> ${CPP11_TOOLCHAIN}/env.sh
    echo export LIBRARY_PATH="\${CPP11_TOOLCHAIN}/usr/lib/x86_64-linux-gnu:\${CPP11_TOOLCHAIN}/usr/lib/gcc/x86_64-linux-gnu/4.8/:\${LIBRARY_PATH:-}" >> ${CPP11_TOOLCHAIN}/env.sh
    echo export PATH="\${CPP11_TOOLCHAIN}/usr/bin:\${PATH}" >> ${CPP11_TOOLCHAIN}/env.sh
fi

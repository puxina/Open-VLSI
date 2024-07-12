#!/bin/bash
#

LAST_PWD=${pwd}

# Magic
git clone https://github.com/RTimothyEdwards/magic.git ${TOOLS_DOWNLOADS}/magic_git && \
	cd ${TOOLS_DOWNLOADS}/magic_git && ./configure
make -j${nproc} && make -j${nproc} install
cd ${LAST_PWD}

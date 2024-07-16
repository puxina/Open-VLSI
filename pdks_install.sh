#!/bin/bash

# Open PDKs (last install)
git clone https://github.com/RTimothyEdwards/open_pdks.git ${TOOLS_DOWNLOADS}/open_pdks_git && \
	cd ${TOOLS_DOWNLOADS}/open_pdks_git
# Many enable options on ./configure
./configure --enable-sky130-pdk \
			--enable-sram-sky130 \
			--enable-sram-space-sky130
make -j${nproc} && make -j${nproc} install
cd ${LAST_PWD}

# Set environment variable for PDK location
export PDK_ROOT=/usr/local/share/pdk/

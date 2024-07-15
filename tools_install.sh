#!/bin/bash

# VLSI EDA Tools
# Repositories and downloads directory
LAST_PWD=${pwd}

# xschem
git clone https://github.com/StefanSchippers/xschem.git ${TOOLS_DOWNLOADS}/xschem_git && \
	cd ${TOOLS_DOWNLOADS}/xschem_git && ./configure
make -j${nproc} && make -j${nproc} install
cd ${LAST_PWD}

# netgen
git clone https://github.com/RTimothyEdwards/netgen.git ${TOOLS_DOWNLOADS}/netgen_git && \
	cd ${TOOLS_DOWNLOADS}/netgen_git && ./configure
make -j${nproc} && make -j${nproc} install
cd ${LAST_PWD}

# jtr0view - Wave Viewer
wget http://www.mixedmode.com/products/jtr0view.tar.gz \
	--directory-prefix=${TOOLS_DOWNLOADS}
tar -xvzf ${TOOLS_DOWNLOADS}/jtr0view.tar.gz --directory=${TOOLS_DOWNLOADS}
echo -e "#\!/bin/bash\njava -jar ${TOOLS_DOWNLOADS}/jtr0view/jtr0view.jar" > ${TOOLS_DOWNLOADS}/jtr0view/jtr0view
ln -s ${TOOLS_DOWNLOADS}/jtr0view/jtr0view /usr/local/bin/
rm ${TOOLS_DOWNLOADS}/jtr0view.tar.gz

# gwave3 - Wave Viewer
wget https://sourceforge.net/projects/gwave/files/gwave3/gwave-20190116.tar.gz \
	--directory-prefix=${TOOLS_DOWNLOADS} --output-document=${TOOLS_DOWNLOADS}/gwave.tar.gz
tar -xvzf ${TOOLS_DOWNLOADS}/gwave.tar.gz --directory=${TOOLS_DOWNLOADS}
cd $TOOLS_DOWNLOADS && mv $(ls | grep -i "201") gwave
cd gwave && autoreconf && autoupdate && ./configure
make -j${nproc} CFLAGS=-D_LARGEFILE64_SOURCE && make -j${nproc} install
rm ${TOOLS_DOWNLOADS}/gwave.tar.gz
cd ${LAST_PWD}

# GAW3 - Wave Viewer (TODO)
wget https://download.tuxfamily.org/gaw/download/gaw2-20170605.tar.gz \
	--directory-prefix=${TOOLS_DOWNLOADS} --output-document=${TOOLS_DOWNLOADS}/gaw2.tar.gz
tar -xvzf ${TOOLS_DOWNLOADS}/gaw2.tar.gz --directory=${TOOLS_DOWNLOADS}
cd $TOOLS_DOWNLOADS && mv $(ls | grep -i "201") gaw2
cd gaw2 && autoreconf && autoupdate && ./configure
make -j${nproc} && make -j${nproc} install
rm ${TOOLS_DOWNLOADS}/gaw2.tar.gz
cd ${LAST_PWD}

# Magic
git clone https://github.com/RTimothyEdwards/magic.git ${TOOLS_DOWNLOADS}/magic_git && \
	cd ${TOOLS_DOWNLOADS}/magic_git && ./configure
make -j${nproc} && make -j${nproc} install
cd ${LAST_PWD}

# Open PDKs (last install)
git clone https://github.com/RTimothyEdwards/open_pdks.git ${TOOLS_DOWNLOADS}/open_pdks_git && \
	cd ${TOOLS_DOWNLOADS}/open_pdks_git
# Many enable options on ./configure
./configure --enable-sky130-pdk \
			--enable-sram-sky130 \
			--enable-sram-space-sky130
make -j${nproc} && make -j${nproc} install
cd ${LAST_PWD}

# Set Open PDKs path environment variables
sh ./env_setup.sh

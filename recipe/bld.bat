autoreconf -fiv

mkdir "build"
cd "build"

../configure \
	--prefix=${PREFIX}

nmake
nmake install

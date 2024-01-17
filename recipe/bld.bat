ls -l

autoreconf -fiv

mkdir "build"
cd "build"

../configure \
	--prefix=${PREFIX}

mingw32-make
mingw32-make install

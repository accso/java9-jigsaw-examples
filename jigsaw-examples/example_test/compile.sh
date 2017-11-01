mkdir -p mods
mkdir -p patches
mkdir -p mlib
mkdir -p patchlib 

. ./compile-blackboxtest.sh

# without options file
# . ./compile-whiteboxtest.sh

# with options file
. ./compile-whiteboxtest_with-optionsfile.sh

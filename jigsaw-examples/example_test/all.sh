cat readme.md

echo "# -------------------------------------------------------------------------------------------------------------------------------"
. ./clean.sh

. ./compile-blackboxtest.sh

echo "# -------------------------------------------------------------------------------------------------------------------------------"
. ./compile-whiteboxtest.sh

echo "# -------------------------------------------------------------------------------------------------------------------------------"
. ./depvis-vis.sh
. ./depvis-print.sh

echo "# -------------------------------------------------------------------------------------------------------------------------------"
. ./run.sh

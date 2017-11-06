cat readme.md

echo "# -------------------------------------------------------------------------------------------------------------------------------"
. ./clean.sh

. ./compile.sh

echo "# -------------------------------------------------------------------------------------------------------------------------------"
. ./run-test.sh

# Commented out as otherwise the server starts and stays open, waiting to get closed (which is not ideal is used inside the 
# example suite)
# . ./run.sh

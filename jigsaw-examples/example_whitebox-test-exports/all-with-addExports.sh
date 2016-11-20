cat readme.md 

sh ./clean.sh
sh ./compile-with-add-exports.sh

echo ------------------------------------------------------------------
sh ./run-with-add-exports.sh

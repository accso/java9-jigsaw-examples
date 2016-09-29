copytoappdir() {
    MODDIR=${dir%*/}
    pushd ${MODDIR} > /dev/null 2>&1
       echo "###################################################################################################################################"
       echo "Copy ${MODDIR}/mlib/*.jar to ${APPSERVER_TARGET}/${MODDIR} ..."
   
       mkdir -p ${APPSERVER_TARGET}/${MODDIR}
       pushd ${APPSERVER_TARGET}/${MODDIR} > /dev/null 2>&1
          rm -rf *
          cat > app.json <<EOFAPPJSON
{
  "rootModule": "modmain",
  "bootClass":  "pkgmain.Main",
  "bootMethod": "main"
}
EOFAPPJSON
          mkdir -p ${APPSERVER_TARGET}/${MODDIR}/mlib
       popd >/dev/null 2>&1 
   
       pushd mlib > /dev/null 2>&1
          cp -R *.jar ${APPSERVER_TARGET}/${MODDIR}/mlib
       popd >/dev/null 2>&1 
   
    popd >/dev/null 2>&1 
    echo " "
}

APPSERVER_TARGET=$(pwd)/apps

pushd .. >/dev/null 2>&1 
for dir in example_*/; 
do
    if [ ! "${dir%*/}/" == "example_jerrymouse/" ] 
    then
        copytoappdir
    fi
done
popd  >/dev/null 2>&1 
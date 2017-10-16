#
# Copy all apps from our app whitelist (various example will not work, e.g. when we provide additional options in the run script)
#

# source the list of apps which we want to run in the Jerry Mouse app server
export APP_WHITELIST=`cat ./apps_whitelist.txt`

APPSERVER_TARGET=$(pwd)/apps

for dir in ${APP_WHITELIST};
do
    MODDIR=${dir%*/}

    # if the example really is "worth" to be copied, i.e. not empty...
    if [ -e ../${MODDIR}/mlib/modmain.jar ]
    then 
       pushd ../${MODDIR} > /dev/null 2>&1
    
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
       
       echo " "
       popd >/dev/null 2>&1 
    fi
done
 
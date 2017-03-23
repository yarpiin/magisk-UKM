#!/system/bin/sh
# Please don't hardcode /magisk/modname/... ; instead, please use $MODDIR/...
# This will make your scripts compatible even if Magisk change its mount point in the future
MODDIR=${0%/*}
LOGFILE=/cache/magisk.log
MODNAME=${MODDIR#/magisk/}
RESETPROP="/data/magisk/resetprop"
buildname="custom_build.prop"

log_print() {
  echo "$MODNAME: $1"
  echo "$MODNAME: $1" >> $LOGFILE
  log -p i -t "$MODNAME" "$1"
}

# This script will be executed in late_start service mode
# More info in the main Magisk thread

if [ -f "$MODDIR/$buildname" ]; then
  log_print "Setting props through $MODDIR/$buildname"
  "$RESETPROP" --file "$MODDIR/$buildname"
elif [ -f "/magisk/tweakprop/$buildname" ]; then
  log_print "Setting props through /magisk/tweakprop/$buildname"
  "$RESETPROP" --file "/magisk/tweakprop/$buildname"
elif [ -e "/system/framework/SemcGenericUxpRes/SemcGenericUxpRes.apk" ]; then
  # Set any prop (with trigger)
  log_print "Setting props through servie.sh"
  "$RESETPROP" * *
  
fi

log_print "Resetprop done. $(date +"%m-%d-%Y %H:%M:%S")"

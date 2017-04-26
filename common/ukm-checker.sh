#!/system/bin/sh

# Cleaning up after uninstalling UKM-Unified
# MODDIR=${0%/*}
MODID=ukm
LOGFILE="/cache/magisk.log"
UKM="/data/UKM"
APKNAME="Synapse_v0.45.apk"
PACKAGENAME="com.af.synapse"

log_print() {
  echo "$MODID: $1"
  echo "$MODID: $1" >> $LOGFILE
  log -p i -t "$MODID" "$1"
}

if [ ! -d "/magisk/$MODID" ]; then
  log_print "! module is removed, cleaning up"
  rm -rf $UKM
  rm -rf /data/app/${PACKAGENAME}-*
  rm -rf /data/data/$PACKAGENAME
  rm ${0}
fi

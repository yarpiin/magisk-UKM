#!/system/bin/sh
# Please don't hardcode /magisk/modname/... ; instead, please use $MODDIR/...
# This will make your scripts compatible even if Magisk change its mount point in the future
MODDIR=${0%/*}
LOGFILE=/cache/magisk.log
MODNAME=${MODDIR#/magisk/}

log_print() {
  echo "$MODNAME: $1"
  echo "$MODNAME: $1" >> $LOGFILE
  log -p i -t "$MODNAME" "$1"
}

# This script will be executed in late_start service mode
# More info in the main Magisk thread

# **************************************************************
# Add Synapse support, script here is adapted from init script
# from apb_axel's UKM. Original initd script here, /data/UKM/UKM
# **************************************************************

UKM=/data/UKM;
# BB=$UKM/busybox;
UCI_CONFIG=$UKM/config.json;
DEBUG=$UKM/debug;
UCI_FILE=$UKM/uci;
UCI_XBIN=/system/xbin/uci;

# Busybox from magisk may be put prior. Never mind, this doesn't matter.
BB=""
for ITEM in "/data/magisk/" "$UKM/" "/sbin/" "/vendor/bin/" "/system/sbin/" "/system/bin/" "/system/xbin/"
do
  if [ -f "${ITEM}busybox" ]; then
    BB=${ITEM}busybox
    break
  fi
done

if [ "${BB}" = "" ]; then
  log_print "! BusyBox not found"
  exit 1
fi

# Delete known files that re-create uci config
if [ -e "/data/ak/ak-post-boot.sh" ]; then
  $BB rm -f /data/ak/ak-post-boot.sh #ak
  $BB rm -f /sbin/post-init.sh #neobuddy89
fi

# Delete default uci config in case kernel has one already to avoid duplicates.
if [ -e "/sbin/uci" ]; then
  $BB rm -f /sbin/uci
fi

# Delete all debug files so it can be re-created on boot.
$BB rm -f $DEBUG/*

# Reset profiles to default
$BB echo "Custom" > $UKM/files/gamma_prof
$BB echo "Custom" > $UKM/files/lmk_prof
$BB echo "Custom" > $UKM/files/sound_prof
$BB echo "Custom" > $UKM/files/speaker_prof
$BB echo "0" > $UKM/files/volt_prof;
$BB echo "0" > $UKM/files/dropcaches_prof;

# Symlink uci file to xbin in case it's not found.
# This part is omitted in the Magisk version

# If uci files does not have 755 permissions, set permissions.
# This part is omitted as well, since we don't wanna touch /system.
# And I'm sure uci has 755 permission already after installation.

# Reset uci config so it can be re-created on boot.
log_print "Restart uci"
$UCI_XBIN reset;
$BB sleep 1;
$UCI_XBIN;

# SELinux permissive for this module
log_print "Set SELinux permissive"
setenforce 0

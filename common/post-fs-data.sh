#!/system/bin/sh
# Please don't hardcode /magisk/modname/... ; instead, please use $MODDIR/...
# This will make your scripts compatible even if Magisk change its mount point in the future
MODDIR=${0%/*}
LOGFILE=/cache/magisk.log
MODNAME=${MODDIR#/magisk/}

MODE="post-fs-data"
APKNAME=Synapse.apk
PACKAGENAME=com.af.synapse
REBOOT=false

# Use the included busybox for maximum compatibility and reliable results
# e.g. we rely on the option "-c" for cp (reserve contexts), and -exec for find
if [ -d "/dev/busybox" ]; then
  TOOLPATH=/dev/busybox
else
  TOOLPATH=/data/busybox
fi
# BINPATH=/data/magisk

UKM=/data/UKM;
# BB=$UKM/busybox;
BB=/data/magisk/busybox;
UCI_CONFIG=$UKM/config.json;
DEBUG=$UKM/debug;
UCI_FILE=$UKM/uci;
UCI_XBIN=/system/xbin/uci;


log_print() {
  echo "$MODNAME: $1"
  echo "$MODNAME: $1" >> $LOGFILE
  log -p i -t "$MODNAME" "$1"
}

bind_mount() {
  if [ -e "$1" -a -e "$2" ]; then
    mount -o bind $1 $2
    if [ "$?" -eq "0" ]; then 
      log_print "Mount: $1"
    else 
      log_print "Mount Fail: $1"
    fi 
  fi
}

# Install Android package $APKNAME
if [ -f "/cache/$APKNAME" ]; then
  cp /cache/$APKNAME /data/$APKNAME
  rm /cache/$APKNAME
fi

if [ -f "/data/$APKNAME" ]; then
  log_print "installing $APKNAME in /data"
  APKPATH="$PACKAGENAME"-1
  for i in `ls /data/app | grep "$PACKAGENAME"-`; do
    if [ `cat /data/system/packages.xml | grep $i >/dev/null 2>&1; echo $?` -eq 0 ]; then
      APKPATH=$i
      break;
    fi
  done
  rm -rf /data/app/"$PACKAGENAME"-*
  log_print "target path: /data/app/$APKPATH"
  mkdir /data/app/$APKPATH
  chown 1000.1000 /data/app/$APKPATH
  chmod 0755 /data/app/$APKPATH
  chcon u:object_r:apk_data_file:s0 /data/app/$APKPATH
  cp /data/$APKNAME /data/app/$APKPATH/base.apk
  chown 1000.1000 /data/app/$APKPATH/base.apk
  chmod 0644 /data/app/$APKPATH/base.apk
  chcon u:object_r:apk_data_file:s0 /data/app/$APKPATH/base.apk
  rm /data/$APKNAME
  sync
  # just in case
  REBOOT=true
fi

# sometimes we need to reboot, make it so
if ($REBOOT); then
  log_print "rebooting"
  if [ "$MODE" = "post-fs-data" ]; then
    # avoid device freeze (reason unknown)
    sh -c "sleep 5; reboot" &
  else
    reboot
  fi
  exit
fi

# **************************************************************
# Add Synapse support
# **************************************************************

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

# Reset uci config so it can be re-created on boot.
log_print "Restart uci"
$UCI_XBIN reset;
$BB sleep 1;
$UCI_XBIN;
log_print "Set SELinux permissive"
setenforce 0

#!/system/bin/sh

UKM=/data/UKM;
BB=$UKM/busybox;

case "$1" in
	CPUFrequencyList)
		for CPUFREQ in `$BB cat /sys/devices/system/cpu/cpu0/cpufreq/scaling_available_frequencies`; do
		LABEL=$((CPUFREQ / 1000));
			$BB echo "$CPUFREQ:\"${LABEL} MHz\", ";
		done;
	;;
    CPU1FrequencyList)
		for CPUFREQ in `$BB cat /sys/devices/system/cpu/cpu0/cpufreq/scaling_available_frequencies`; do
		LABEL=$((CPUFREQ / 1000));
			$BB echo "$CPUFREQ:\"${LABEL} MHz\", ";
		done;
	;;
	CPU2FrequencyList)
		for CPUFREQ in `$BB cat /sys/devices/system/cpu/cpu4/cpufreq/scaling_available_frequencies`; do
		LABEL=$((CPUFREQ / 1000));
			$BB echo "$CPUFREQ:\"${LABEL} MHz\", ";
		done;
	;;
    KRYO1FrequencyList)
		for CPUFREQ in `$BB cat /sys/devices/system/cpu/cpu0/cpufreq/scaling_available_frequencies`; do
		LABEL=$((CPUFREQ / 1000));
			$BB echo "$CPUFREQ:\"${LABEL} MHz\", ";
		done;
	;;
    KRYO2FrequencyList)
		for CPUFREQ in `$BB cat /sys/devices/system/cpu/cpu2/cpufreq/scaling_available_frequencies`; do
		LABEL=$((CPUFREQ / 1000));
			$BB echo "$CPUFREQ:\"${LABEL} MHz\", ";
		done;
	;;
	CPUGovernorList)
		for CPUGOV in `$BB cat /sys/devices/system/cpu/cpu0/cpufreq/scaling_available_governors`; do
			$BB echo "\"$CPUGOV\",";
		done;
	;;
    CPU1GovernorList)
		for CPUGOV in `$BB cat /sys/devices/system/cpu/cpu4/cpufreq/scaling_available_governors`; do
			$BB echo "\"$CPUGOV\",";
		done;
	;;
    KRYO1GovernorList)
		for CPUGOV in `$BB cat /sys/devices/system/cpu/cpu0/cpufreq/scaling_available_governors`; do
			$BB echo "\"$CPUGOV\",";
		done;
	;;
    KRYO2GovernorList)
		for CPUGOV in `$BB cat /sys/devices/system/cpu/cpu2/cpufreq/scaling_available_governors`; do
			$BB echo "\"$CPUGOV\",";
		done;
	;;
	DebugPVS)
		$BB echo "PVS bin";
	;;
	DebugSPEED)
		$BB echo "Speed bin";
	;;
	DefaultCPUGovernor)
		$BB echo `$BB cat /sys/devices/system/cpu/cpu0/cpufreq/scaling_governor`
	;;
    DefaultCPU1Governor)
		$BB echo `$BB cat /sys/devices/system/cpu/cpu4/cpufreq/scaling_governor`
	;;
    DefaultKRYO1Governor)
		$BB echo `$BB cat /sys/devices/system/cpu/cpu0/cpufreq/scaling_governor`
	;;
    DefaultKRYO2Governor)
		$BB echo `$BB cat /sys/devices/system/cpu/cpu2/cpufreq/scaling_governor`
	;;
	DefaultCPUMaxFrequency)
		while read FREQ TIME; do
			if [ $FREQ -le "2260000" ]; then
				MAXCPU=$FREQ;
			fi;
		done < /sys/devices/system/cpu/cpu0/cpufreq/stats/time_in_state;

		$BB echo $MAXCPU;
	;;
	DefaultCPU1MaxFrequency)
		while read FREQ TIME; do
			if [ $FREQ -le "2260000" ]; then
				MAXCPU=$FREQ;
			fi;
		done < /sys/devices/system/cpu/cpu0/cpufreq/stats/time_in_state;

		$BB echo $MAXCPU;
	;;
	DefaultCPU2MaxFrequency)
		while read FREQ TIME; do
			if [ $FREQ -le "2260000" ]; then
				MAXCPU=$FREQ;
			fi;
		done < /sys/devices/system/cpu/cpu4/cpufreq/stats/time_in_state;

		$BB echo $MAXCPU;
	;;
    DefaultKRYO1MaxFrequency)
		while read FREQ TIME; do
			if [ $FREQ -le "2260000" ]; then
				MAXCPU=$FREQ;
			fi;
		done < /sys/devices/system/cpu/cpu0/cpufreq/stats/time_in_state;

		$BB echo $MAXCPU;
	;;
    DefaultKRYO2MaxFrequency)
		while read FREQ TIME; do
			if [ $FREQ -le "2260000" ]; then
				MAXCPU=$FREQ;
			fi;
		done < /sys/devices/system/cpu/cpu2/cpufreq/stats/time_in_state;

		$BB echo $MAXCPU;
	;;
	DefaultCPUMinFrequency)
		S=0;
		while read FREQ TIME; do
			if [ $FREQ -ge "300000" ] && [ $S -eq "0" ]; then
				S=1;
				MINCPU=$FREQ;
			fi;
		done < /sys/devices/system/cpu/cpu0/cpufreq/stats/time_in_state;

		$BB echo $MINCPU;
	;;
    DefaultCPU1MinFrequency)
		S=0;
		while read FREQ TIME; do
			if [ $FREQ -ge "300000" ] && [ $S -eq "0" ]; then
				S=1;
				MINCPU=$FREQ;
			fi;
		done < /sys/devices/system/cpu/cpu0/cpufreq/stats/time_in_state;

		$BB echo $MINCPU;
	;;
	DefaultCPU2MinFrequency)
		S=0;
		while read FREQ TIME; do
			if [ $FREQ -ge "300000" ] && [ $S -eq "0" ]; then
				S=1;
				MINCPU=$FREQ;
			fi;
		done < /sys/devices/system/cpu/cpu4/cpufreq/stats/time_in_state;

		$BB echo $MINCPU;
	;;
    DefaultKRYO1MinFrequency)
		S=0;
		while read FREQ TIME; do
			if [ $FREQ -ge "300000" ] && [ $S -eq "0" ]; then
				S=1;
				MINCPU=$FREQ;
			fi;
		done < /sys/devices/system/cpu/cpu0/cpufreq/stats/time_in_state;

		$BB echo $MINCPU;
	;;
    DefaultKRYO2MinFrequency)
		S=0;
		while read FREQ TIME; do
			if [ $FREQ -ge "300000" ] && [ $S -eq "0" ]; then
				S=1;
				MINCPU=$FREQ;
			fi;
		done < /sys/devices/system/cpu/cpu2/cpufreq/stats/time_in_state;

		$BB echo $MINCPU;
	;;
	DefaultGPUGovernor)
		GPUGOV=/sys/devices/soc.0/fdb00000.qcom,kgsl-3d0/devfreq/fdb00000.qcom,kgsl-3d0/governor;
		GPUGOV1=/sys/devices/fdb00000.qcom,kgsl-3d0/devfreq/fdb00000.qcom,kgsl-3d0/governor;
		GPUGOV2=/sys/devices/platform/kgsl-3d0.0/kgsl/kgsl-3d0/governor;
		GPUGOV3=/sys/class/kgsl/kgsl-3d0/devfreq/governor;
		
		if [ -f "$GPUGOV" ]; then
			$BB echo "`$BB cat /sys/devices/soc.0/fdb00000.qcom,kgsl-3d0/devfreq/fdb00000.qcom,kgsl-3d0/governor`"
		fi;
		if [ -f "$GPUGOV1" ]; then
			$BB echo "`$BB cat /sys/devices/fdb00000.qcom,kgsl-3d0/devfreq/fdb00000.qcom,kgsl-3d0/governor`"
		fi;
		if [ -f "$GPUGOV2" ]; then
			$BB echo "`$BB cat /sys/devices/platform/kgsl-3d0.0/kgsl/kgsl-3d0/governor`"
		fi
		if [ -f "$GPUGOV3" ]; then
			$BB echo "`$BB cat /sys/class/kgsl/kgsl-3d0/devfreq/governor`"
		fi;
	;;
	DirKernelIMG)
		$BB echo "/dev/block/platform/msm_sdcc.1/by-name/aboot";
	;;
	DirCPUGovernor)
		$BB echo "/sys/devices/system/cpu/cpu0/cpufreq/scaling_governor";
	;;
    DirCPU1Governor)
		$BB echo "/sys/devices/system/cpu/cpu4/cpufreq/scaling_governor";
	;;
    DirKRYO1Governor)
		$BB echo "/sys/devices/system/cpu/cpu0/cpufreq/scaling_governor";
	;;
    DirKRYO2Governor)
		$BB echo "/sys/devices/system/cpu/cpu2/cpufreq/scaling_governor";
	;;
	DirCPUGovernorTree)
		$BB echo "/sys/devices/system/cpu/cpufreq";
	;;
    DirCPU1GovernorTree)
		$BB echo "/sys/devices/system/cpu/cpu0/cpufreq";
	;;
    DirCPU2GovernorTree)
		$BB echo "/sys/devices/system/cpu/cpu4/cpufreq";
	;;
    DirCPUGovernorTreeKyro1)
		$BB echo "/sys/devices/system/cpu/cpu0/cpufreq";
	;;
	DirCPUGovernorTreeKyro2)
		$BB echo "/sys/devices/system/cpu/cpu2/cpufreq";
	;;
	DirCPUMaxFrequency)
		$BB echo "/sys/devices/system/cpu/cpu0/cpufreq/scaling_max_freq";
	;;
    DirCPU1MaxFrequency)
		$BB echo "/sys/devices/system/cpu/cpu0/cpufreq/scaling_max_freq";
	;;
    DirCPU2MaxFrequency)
		$BB echo "/sys/devices/system/cpu/cpu4/cpufreq/scaling_max_freq";
	;;
    DirKRYO1MaxFrequency)
		$BB echo "/sys/devices/system/cpu/cpu0/cpufreq/scaling_max_freq";
	;;
    DirKRYO2MaxFrequency)
		$BB echo "/sys/devices/system/cpu/cpu2/cpufreq/scaling_max_freq";
	;;
	DirCPUMinFrequency)
		$BB echo "/sys/devices/system/cpu/cpu0/cpufreq/scaling_min_freq";
	;;
	DirCPU1MinFrequency)
		$BB echo "/sys/devices/system/cpu/cpu0/cpufreq/scaling_min_freq";
	;;
	DirCPU2MinFrequency)
		$BB echo "/sys/devices/system/cpu/cpu4/cpufreq/scaling_min_freq";
	;;
	DirKRYO1MinFrequency)
		$BB echo "/sys/devices/system/cpu/cpu0/cpufreq/scaling_min_freq";
	;;
	DirKRYO2MinFrequency)
		$BB echo "/sys/devices/system/cpu/cpu2/cpufreq/scaling_min_freq";
	;;
    DirGPUGovernor)
		GPUGOV=/sys/devices/soc.0/fdb00000.qcom,kgsl-3d0/devfreq/fdb00000.qcom,kgsl-3d0/governor;
		GPUGOV1=/sys/devices/fdb00000.qcom,kgsl-3d0/devfreq/fdb00000.qcom,kgsl-3d0/governor;
		GPUGOV2=/sys/devices/platform/kgsl-3d0.0/kgsl/kgsl-3d0/pwrscale/trustzone/governor;
		GPUGOV3=/sys/class/kgsl/kgsl-3d0/devfreq/governor;
		
		if [ -f "$GPUGOV" ]; then
			$BB echo "$GPUGOV";
		fi;
		if [ -f "$GPUGOV1" ]; then
			$BB echo "$GPUGOV1";
		fi;
		if [ -f "$GPUGOV2" ]; then
			$BB echo "$GPUGOV2";
		fi;
		if [ -f "$GPUGOV3" ]; then
			$BB echo "$GPUGOV3";
		fi;
	;;
	DirGPUMaxFrequency)
		GPUMAXFREQ=/sys/devices/soc.0/fdb00000.qcom,kgsl-3d0/devfreq/fdb00000.qcom,kgsl-3d0/max_freq;
		GPUMAXFREQ1=/sys/devices/fdb00000.qcom,kgsl-3d0/devfreq/fdb00000.qcom,kgsl-3d0/max_freq;
		GPUMAXFREQ2=/sys/devices/platform/kgsl-3d0.0/kgsl/kgsl-3d0/max_gpuclk;
		GPUMAXFREQ3=/sys/class/kgsl/kgsl-3d0/devfreq/max_freq;
		
		if [ -f "$GPUMAXFREQ" ]; then
			$BB echo "$GPUMAXFREQ";
		fi;
		if [ -f "$GPUMAXFREQ1" ]; then
			$BB echo "$GPUMAXFREQ1";
		fi;
		if [ -f "$GPUMAXFREQ2" ]; then
			$BB echo "$GPUMAXFREQ2";
		fi;
		if [ -f "$GPUMAXFREQ3" ]; then
			$BB echo "$GPUMAXFREQ3";
		fi;
	;;
	DirGPUMinPwrLevel)
		GPUMPW=/sys/devices/soc.0/fdb00000.qcom,kgsl-3d0/devfreq/fdb00000.qcom,kgsl-3d0/min_freq;
		GPUMPW1=/sys/devices/fdb00000.qcom,kgsl-3d0/devfreq/fdb00000.qcom,kgsl-3d0/min_freq;
		GPUMPW2=/sys/devices/platform/kgsl-3d0.0/kgsl/kgsl-3d0/min_pwrlevel;
		GPUMPW3=/sys/class/kgsl/kgsl-3d0/devfreq/min_freq;
		
		if [ -f "$GPUMPW" ]; then
			$BB echo "$GPUMPW";
		fi;
		if [ -f "$GPUMPW1" ]; then
			$BB echo "$GPUMPW1";
		fi;
		if [ -f "$GPUMPW2" ]; then
			$BB echo "$GPUMPW2";
		fi;
		if [ -f "$GPUMPW3" ]; then
			$BB echo "$GPUMPW3";
		fi;
	;;
	#DirGPUNumPwrLevels)
	#	$BB echo "/sys/class/kgsl/kgsl-3d0/num_pwrlevels";
	#;;
    #DirKRYOGPUNumPwrLevels)
	#	$BB echo "/sys/devices/soc/b00000.qcom,kgsl-3d0/devfreq/b00000.qcom,kgsl-3d0/device/kgsl/kgsl-3d0/num_pwrlevels";
	#;;
	#DirGPUPolicy)
	#	$BB echo "/sys/class/kgsl/kgsl-3d0/pwrscale/policy"; 
	#;;
    #DirKRYOGPUPolicy)
	#	$BB echo "/sys/devices/soc/b00000.qcom,kgsl-3d0/devfreq/b00000.qcom,kgsl-3d0/device/kgsl/kgsl-3d0/pwrscale/policy"; 
	#;;
	DirIOScheduler)
		$BB echo "/sys/block/mmcblk0/queue/scheduler";
	;;
    DirKRYOIOScheduler)
		$BB echo "/sys/block/sda/queue/scheduler";
	;;
	DirIOSchedulerTree)
		$BB echo "/sys/block/mmcblk0/queue/iosched";
	;;
    DirKRYOIOSchedulerTree)
		$BB echo "/sys/block/sda/queue/iosched";
	;;
	DirTCPCongestion)
		$BB echo "/proc/sys/net/ipv4/tcp_congestion_control";
	;;
	GPUFrequencyList)
		GPUFREQ=/sys/devices/soc.0/fdb00000.qcom,kgsl-3d0/devfreq/fdb00000.qcom,kgsl-3d0/max_freq;
		GPUFREQ1=/sys/devices/fdb00000.qcom,kgsl-3d0/devfreq/fdb00000.qcom,kgsl-3d0/max_freq;
		GPUFREQ2=/sys/devices/platform/kgsl-3d0.0/kgsl/kgsl-3d0/max_gpuclk;
		GPUFREQ3=/sys/class/kgsl/kgsl-3d0/devfreq/available_frequencies;
		
		if [ -f "$GPUFREQ" ]; then
			for GPUFREQ in `$BB cat /sys/devices/soc.0/fdb00000.qcom,kgsl-3d0/devfreq/fdb00000.qcom,kgsl-3d0/available_frequencies | $BB tr ' ' '\n' | $BB sort -u` ; do
			LABEL=$((GPUFREQ / 1000000));
				$BB echo "$GPUFREQ:\"${LABEL} MHz\", ";
			done;
		fi;
		if [ -f "$GPUFREQ1" ]; then
			for GPUFREQ in `$BB cat /sys/devices/fdb00000.qcom,kgsl-3d0/devfreq/fdb00000.qcom,kgsl-3d0/available_frequencies | $BB tr ' ' '\n' | $BB sort -u` ; do
			LABEL=$((GPUFREQ / 1000000));
				$BB echo "$GPUFREQ:\"${LABEL} MHz\", ";
			done;
		fi;
		if [ -f "$GPUFREQ2" ]; then
			for GPUFREQ in `$BB cat /sys/devices/platform/kgsl-3d0.0/kgsl/kgsl-3d0/gpu_available_frequencies | $BB tr ' ' '\n' | $BB sort -u` ; do
			LABEL=$((GPUFREQ / 1000000));
				$BB echo "$GPUFREQ:\"${LABEL} MHz\", ";
			done;
		fi;
		if [ -f "$GPUFREQ3" ]; then
			for GPUFREQ in `$BB cat /sys/class/kgsl/kgsl-3d0/devfreq/available_frequencies | $BB tr ' ' '\n' | $BB sort -u` ; do
			LABEL=$((GPUFREQ / 1000000));
				$BB echo "$GPUFREQ:\"${LABEL} MHz\", ";
			done;
		fi;
	;;

	GPUGovernorList)
		$BB echo "msm-adreno-tz","performance", "powersave", "userspace", "cpufreq";
	;;
	GPUPowerLevel)
		GPUPW=/sys/devices/soc.0/fdb00000.qcom,kgsl-3d0/devfreq/fdb00000.qcom,kgsl-3d0/min_freq;
		GPUPW1=/sys/devices/fdb00000.qcom,kgsl-3d0/devfreq/fdb00000.qcom,kgsl-3d0/min_freq;
		GPUPW2=/sys/devices/platform/kgsl-3d0.0/kgsl/kgsl-3d0/min_pwrlevel;
		GPUPW3=/sys/class/kgsl/kgsl-3d0/devfreq/available_frequencies;
		
		if [ -f "$GPUPW" ]; then
			for GPUFREQ in `$BB cat /sys/devices/soc.0/fdb00000.qcom,kgsl-3d0/devfreq/fdb00000.qcom,kgsl-3d0/available_frequencies | $BB tr ' ' '\n' | $BB sort -u` ; do
			LABEL=$((GPUFREQ / 1000000));
				$BB echo "$GPUFREQ:\"${LABEL} MHz\", ";
			done;
		fi;
		if [ -f "$GPUPW1" ]; then
			for GPUFREQ in `$BB cat /sys/devices/fdb00000.qcom,kgsl-3d0/devfreq/fdb00000.qcom,kgsl-3d0/available_frequencies | $BB tr ' ' '\n' | $BB sort -u` ; do
			LABEL=$((GPUFREQ / 1000000));
				$BB echo "$GPUFREQ:\"${LABEL} MHz\", ";
			done;
		fi;
		if [ -f "$GPUPW2" ]; then
			NUM_PWRLVL=`$BB cat /sys/devices/platform/kgsl-3d0.0/kgsl/kgsl-3d0/num_pwrlevels`;
			PWR_LEVEL=-1;
			for GPUFREQ in `$BB cat /sys/devices/platform/kgsl-3d0.0/kgsl/kgsl-3d0/gpu_available_frequencies`; do
			PWR_LEVEL=$((PWR_LEVEL + 1));
			MIN_PWRLVL=$((NUM_PWRLVL - PWR_LEVEL));
			LABEL=$((GPUFREQ / 1000000));
				$BB echo "$MIN_PWRLVL:\"${LABEL} MHz\", ";
			done;
		fi;
		if [ -f "$GPUPW3" ]; then
			for GPUFREQ in `$BB cat /sys/devices/soc/b00000.qcom,kgsl-3d0/devfreq/b00000.qcom,kgsl-3d0/available_frequencies | $BB tr ' ' '\n' | $BB sort -u` ; do
			LABEL=$((GPUFREQ / 1000000));
				$BB echo "$GPUFREQ:\"${LABEL} MHz\", ";
			done;
		fi;
	;;
    GPUKRYOPowerLevel)
		for GPUFREQ in `$BB cat /sys/devices/soc/b00000.qcom,kgsl-3d0/devfreq/b00000.qcom,kgsl-3d0/available_frequencies | $BB tr ' ' '\n' | $BB sort -u` ; do
		LABEL=$((GPUFREQ / 1000000));
			$BB echo "$GPUFREQ:\"${LABEL} MHz\", ";
		done;
	;;
	HasBootloader)
		$BB echo "1";
	;;
	HasHeadphonePowerAmp)
		$BB echo "1";
	;;
	HasTamperFlag)
		$BB echo "1";
	;;
	HeadphonePAValue)
		$BB echo "22";
	;;
	IOSchedulerList)
		for IOSCHED in `$BB cat /sys/block/mmcblk0/queue/scheduler | $BB sed -e 's/\]//;s/\[//'`; do
			$BB echo "\"$IOSCHED\",";
		done;
	;;
	KRYOIOSchedulerList)
		for IOSCHED in `$BB cat /sys/block/sda/queue/scheduler | $BB sed -e 's/\]//;s/\[//'`; do
			$BB echo "\"$IOSCHED\",";
		done;
	;;
	LiveBatteryTemperature)
		BAT_C=`$BB awk '{ print $1 / 10 }' /sys/class/power_supply/battery/temp`;
		BAT_H=`$BB cat /sys/class/power_supply/battery/health`;

		$BB echo "$BAT_C°C@nHealth: $BAT_H";
	;;
	LiveBootloader)
		version=`getprop ro.bootloader`;
		
		block=/dev/block/platform/msm_sdcc.1/by-name/aboot;
		offset=1048080;
		locked=00;
		unlocked=01;
		tamper=1048084;
		false=00;
		true=01;
		
		lockstate=`$BB dd ibs=1 count=1 skip=$offset if=$block 2> /dev/null | $BB od -h | $BB head -n 1 | $BB cut -c 11-`;
		tamperstate=`$BB dd ibs=1 count=1 skip=$tamper if=$block 2> /dev/null | $BB od -h | $BB head -n 1 | $BB cut -c 11-`;
		
		if [ $lockstate == $locked ]; then
			state="Locked";
		elif [ $lockstate == $unlocked ]; then
			state="Unlocked";
		else
			state="Unknown";
		fi;
		
		if [ $tamperstate == $false ]; then
			tamper="False";
		elif [ $tamperstate == $true ]; then
			tamper="True";
		else
			tamper="Unknown";
		fi;
		
		$BB echo "Version: $version@nState: $state@nTamper: $tamper";
	;;
	LiveCPUFrequency)
		CPU0=`$BB cat /sys/devices/system/cpu/cpu0/cpufreq/scaling_cur_freq 2> /dev/null`;
		CPU1=`$BB cat /sys/devices/system/cpu/cpu1/cpufreq/scaling_cur_freq 2> /dev/null`;
		CPU2=`$BB cat /sys/devices/system/cpu/cpu2/cpufreq/scaling_cur_freq 2> /dev/null`;
		CPU3=`$BB cat /sys/devices/system/cpu/cpu3/cpufreq/scaling_cur_freq 2> /dev/null`;
		
		if [ -z "$CPU0" ]; then CPU0="Offline"; else CPU0="$((CPU0 / 1000)) MHz"; fi;
		if [ -z "$CPU1" ]; then CPU1="Offline"; else CPU1="$((CPU1 / 1000)) MHz"; fi;
		if [ -z "$CPU2" ]; then CPU2="Offline"; else CPU2="$((CPU2 / 1000)) MHz"; fi;
		if [ -z "$CPU3" ]; then CPU3="Offline"; else CPU3="$((CPU3 / 1000)) MHz"; fi;
		
		$BB echo "Core 0: $CPU0@nCore 1: $CPU1@nCore 2: $CPU2@nCore 3: $CPU3";
	;;
    LiveCPU1Frequency)
		CPU0=`$BB cat /sys/devices/system/cpu/cpu0/cpufreq/scaling_cur_freq 2> /dev/null`;
		CPU1=`$BB cat /sys/devices/system/cpu/cpu1/cpufreq/scaling_cur_freq 2> /dev/null`;
		CPU2=`$BB cat /sys/devices/system/cpu/cpu2/cpufreq/scaling_cur_freq 2> /dev/null`;
		CPU3=`$BB cat /sys/devices/system/cpu/cpu3/cpufreq/scaling_cur_freq 2> /dev/null`;
		
		if [ -z "$CPU0" ]; then CPU0="Offline"; else CPU0="$((CPU0 / 1000)) MHz"; fi;
		if [ -z "$CPU1" ]; then CPU1="Offline"; else CPU1="$((CPU1 / 1000)) MHz"; fi;
		if [ -z "$CPU2" ]; then CPU2="Offline"; else CPU2="$((CPU2 / 1000)) MHz"; fi;
		if [ -z "$CPU3" ]; then CPU3="Offline"; else CPU3="$((CPU3 / 1000)) MHz"; fi;
		
		$BB echo "Core 0: $CPU0@nCore 1: $CPU1@nCore 2: $CPU2@nCore 3: $CPU3";
	;;
 	LiveCPU2Frequency)
		LCPU=/sys/devices/system/cpu/cpu6/cpufreq/scaling_cur_freq;
		
		CPU4=`$BB cat /sys/devices/system/cpu/cpu4/cpufreq/scaling_cur_freq 2> /dev/null`;
		CPU5=`$BB cat /sys/devices/system/cpu/cpu5/cpufreq/scaling_cur_freq 2> /dev/null`;
		CPU6=`$BB cat /sys/devices/system/cpu/cpu6/cpufreq/scaling_cur_freq 2> /dev/null`;
		CPU7=`$BB cat /sys/devices/system/cpu/cpu7/cpufreq/scaling_cur_freq 2> /dev/null`;
		
		if [ -z "$CPU4" ]; then CPU4="Offline"; else CPU4="$((CPU4 / 1000)) MHz"; fi;
		if [ -z "$CPU5" ]; then CPU5="Offline"; else CPU5="$((CPU5 / 1000)) MHz"; fi;
		if [ -z "$CPU6" ]; then CPU6="Offline"; else CPU6="$((CPU6 / 1000)) MHz"; fi;
		if [ -z "$CPU7" ]; then CPU7="Offline"; else CPU7="$((CPU7 / 1000)) MHz"; fi;
		
		if [ -f "$LCPU" ]; then 
		$BB echo "Core 4: $CPU4@nCore 5: $CPU5@nCore 6: $CPU6@nCore 7: $CPU7";
		else
		$BB echo "Core 4: $CPU4@nCore 5: $CPU5";
		fi;
	;;
    LiveKRYO1Frequency)
		CPU0=`$BB cat /sys/devices/system/cpu/cpu0/cpufreq/scaling_cur_freq 2> /dev/null`;
		CPU1=`$BB cat /sys/devices/system/cpu/cpu1/cpufreq/scaling_cur_freq 2> /dev/null`;
		
		if [ -z "$CPU0" ]; then CPU0="Offline"; else CPU0="$((CPU0 / 1000)) MHz"; fi;
		if [ -z "$CPU1" ]; then CPU1="Offline"; else CPU1="$((CPU1 / 1000)) MHz"; fi;

		$BB echo "Core 0: $CPU0@nCore 1: $CPU1";
	;;
	LiveKRYO2Frequency)
		CPU2=`$BB cat /sys/devices/system/cpu/cpu2/cpufreq/scaling_cur_freq 2> /dev/null`;
		CPU3=`$BB cat /sys/devices/system/cpu/cpu3/cpufreq/scaling_cur_freq 2> /dev/null`;
		
		if [ -z "$CPU2" ]; then CPU2="Offline"; else CPU2="$((CPU2 / 1000)) MHz"; fi;
		if [ -z "$CPU3" ]; then CPU3="Offline"; else CPU3="$((CPU3 / 1000)) MHz"; fi;

		$BB echo "Core 2: $CPU2@nCore 3: $CPU3";
	;;
	LiveCPU1OnlineOffline)
		CPU0=`$BB cat /sys/devices/system/cpu/cpu0/online 2> /dev/null`;
		CPU1=`$BB cat /sys/devices/system/cpu/cpu1/online 2> /dev/null`;
		CPU2=`$BB cat /sys/devices/system/cpu/cpu2/online 2> /dev/null`;
		CPU3=`$BB cat /sys/devices/system/cpu/cpu3/online 2> /dev/null`;

		if [ $CPU0 == 0 ]; then CPU0="Off"; else CPU0="On"; fi;
		if [ $CPU1 == 0 ]; then CPU1="Off"; else CPU1="On"; fi;
		if [ $CPU2 == 0 ]; then CPU2="Off"; else CPU2="On"; fi;
		if [ $CPU3 == 0 ]; then CPU3="Off"; else CPU3="On"; fi;

		$BB echo "CPU Cpu Status@n";
		$BB echo "0:$CPU0 ~ 1:$CPU1 ~ 2:$CPU2 ~ 3:$CPU3@n";
	;;
	LiveCPU2OnlineOffline)
		CPU4=`$BB cat /sys/devices/system/cpu/cpu4/online 2> /dev/null`;
		CPU5=`$BB cat /sys/devices/system/cpu/cpu5/online 2> /dev/null`;
		CPU6=`$BB cat /sys/devices/system/cpu/cpu6/online 2> /dev/null`;
		CPU7=`$BB cat /sys/devices/system/cpu/cpu7/online 2> /dev/null`;

		if [ $CPU4 == 0 ]; then CPU4="Off"; else CPU4="On"; fi;
		if [ $CPU5 == 0 ]; then CPU5="Off"; else CPU5="On"; fi;
		if [ $CPU6 == 0 ]; then CPU6="Off"; else CPU6="On"; fi;
		if [ $CPU7 == 0 ]; then CPU7="Off"; else CPU7="On"; fi;

		$BB echo "CPU Cpu Status@n";
		$BB echo "4:$CPU4 ~ 5:$CPU5 ~ 6:$CPU6 ~ 7:$CPU7@n";
	;;
	LiveKRYOOnlineOffline)
		CPU0=`$BB cat /sys/devices/system/cpu/cpu0/online 2> /dev/null`;
		CPU1=`$BB cat /sys/devices/system/cpu/cpu1/online 2> /dev/null`;
		CPU2=`$BB cat /sys/devices/system/cpu/cpu2/online 2> /dev/null`;
		CPU3=`$BB cat /sys/devices/system/cpu/cpu3/online 2> /dev/null`;

		if [ $CPU0 == 0 ]; then CPU0="Off"; else CPU0="On"; fi;
		if [ $CPU1 == 0 ]; then CPU1="Off"; else CPU1="On"; fi;
		if [ $CPU2 == 0 ]; then CPU2="Off"; else CPU2="On"; fi;
		if [ $CPU3 == 0 ]; then CPU3="Off"; else CPU3="On"; fi;

		$BB echo "Kyro 1.6 Cpu Status@n";
		$BB echo "0:$CPU0 ~ 1:$CPU1@n";
		$BB echo "@nKyro 2.2 Cpu	Status@n";
		$BB echo "4:$CPU2 ~ 3:$CPU3";
	;;
	LiveCPUTemperature)
		CPU_C=/sys/class/thermal/thermal_zone7/temp;
		CPUK=/sys/module/clock_cpu_8996;

		if [ -d "$CPUK" ]; then
			CPUT="$((`$BB cat $CPU_C` / 10)) °C";
			
			$BB echo "$CPUT";  
		else
			$BB echo "$CPU_C°C";
		fi;
	;;
	LiveGPUFrequency)
		GPUCURFREQ=/sys/devices/soc.0/fdb00000.qcom,kgsl-3d0/kgsl/kgsl-3d0/gpuclk;
		GPUCURFREQ1=/sys/devices/fdb00000.qcom,kgsl-3d0/kgsl/kgsl-3d0/gpuclk;
		GPUCURFREQ2=/sys/devices/platform/kgsl-3d0.0/kgsl/kgsl-3d0/gpuclk;
		GPUCURFREQ3=/sys/class/kgsl/kgsl-3d0/devfreq/cur_freq;
		
		if [ -f "$GPUCURFREQ" ]; then
			GPUFREQ="$((`$BB cat $GPUCURFREQ` / 1000000)) MHz";
			$BB echo "$GPUFREQ";
		fi;
		if [ -f "$GPUCURFREQ1" ]; then
			GPUFREQ="$((`$BB cat $GPUCURFREQ1` / 1000000)) MHz";
			$BB echo "$GPUFREQ";
		fi;
		if [ -f "$GPUCURFREQ2" ]; then
			GPUFREQ="$((`$BB cat $GPUCURFREQ2` / 1000000)) MHz";
			$BB echo "$GPUFREQ";
		fi;
		if [ -f "$GPUCURFREQ3" ]; then
			GPUFREQ="$((`$BB cat $GPUCURFREQ3` / 1000000)) MHz";
			$BB echo "$GPUFREQ";
		fi;
	;;
	LiveMemory)
		while read TYPE MEM KB; do
			if [ "$TYPE" = "MemTotal:" ]; then
				TOTAL="$((MEM / 1024)) MB";
			elif [ "$TYPE" = "MemFree:" ]; then
				CACHED=$((MEM / 1024));
			elif [ "$TYPE" = "Cached:" ]; then
				FREE=$((MEM / 1024));
			fi;
		done < /proc/meminfo;
		
		FREE="$((FREE + CACHED)) MB";
		$BB echo "Total: $TOTAL@nFree: $FREE";
	;;
	LiveTime)
		STATE="";
		CNT=0;
		SUM=`$BB awk '{s+=$2} END {print s}' /sys/devices/system/cpu/cpu0/cpufreq/stats/time_in_state`;
		
		while read FREQ TIME; do
			if [ "$CNT" -ge $2 ] && [ "$CNT" -le $3 ]; then
				FREQ="$((FREQ / 1000)) MHz:";
				if [ $TIME -ge "100" ]; then
					PERC=`$BB awk "BEGIN { print ( ($TIME / $SUM) * 100) }"`;
					PERC="`$BB printf "%0.1f\n" $PERC`%";
					TIME=$((TIME / 100));
					STATE="$STATE $FREQ `$BB echo - | $BB awk -v "S=$TIME" '{printf "%dh:%dm:%ds",S/(60*60),S%(60*60)/60,S%60}'` ($PERC)@n";
				fi;
			fi;
			CNT=$((CNT+1));
		done < /sys/devices/system/cpu/cpu0/cpufreq/stats/time_in_state;
		
		STATE=${STATE%??};
		$BB echo "$STATE";
	;;
    LiveTimeCPU1)
		STATE="";
		CNT=0;
		SUM=`$BB awk '{s+=$2} END {print s}' /sys/devices/system/cpu/cpu0/cpufreq/stats/time_in_state`;
		
		while read FREQ TIME; do
			if [ "$CNT" -ge $2 ] && [ "$CNT" -le $3 ]; then
				FREQ="$((FREQ / 1000)) MHz:";
				if [ $TIME -ge "100" ]; then
					PERC=`$BB awk "BEGIN { print ( ($TIME / $SUM) * 100) }"`;
					PERC="`$BB printf "%0.1f\n" $PERC`%";
					TIME=$((TIME / 100));
					STATE="$STATE $FREQ `$BB echo - | $BB awk -v "S=$TIME" '{printf "%dh:%dm:%ds",S/(60*60),S%(60*60)/60,S%60}'` ($PERC)@n";
				fi;
			fi;
			CNT=$((CNT+1));
		done < /sys/devices/system/cpu/cpu0/cpufreq/stats/time_in_state;
		
		STATE=${STATE%??};
		$BB echo "$STATE";
	;;
    LiveTimeCPU2)
		STATE="";
		CNT=0;
		SUM=`$BB awk '{s+=$2} END {print s}' /sys/devices/system/cpu/cpu4/cpufreq/stats/time_in_state`;
		
		while read FREQ TIME; do
			if [ "$CNT" -ge $2 ] && [ "$CNT" -le $3 ]; then
				FREQ="$((FREQ / 1000)) MHz:";
				if [ $TIME -ge "100" ]; then
					PERC=`$BB awk "BEGIN { print ( ($TIME / $SUM) * 100) }"`;
					PERC="`$BB printf "%0.1f\n" $PERC`%";
					TIME=$((TIME / 100));
					STATE="$STATE $FREQ `$BB echo - | $BB awk -v "S=$TIME" '{printf "%dh:%dm:%ds",S/(60*60),S%(60*60)/60,S%60}'` ($PERC)@n";
				fi;
			fi;
			CNT=$((CNT+1));
		done < /sys/devices/system/cpu/cpu0/cpufreq/stats/time_in_state;
		
		STATE=${STATE%??};
		$BB echo "$STATE";
	;;
	LiveTimeKRYO1)
		STATE="";
		CNT=0;
		SUM=`$BB awk '{s+=$2} END {print s}' /sys/devices/system/cpu/cpu0/cpufreq/stats/time_in_state`;

		while read FREQ TIME; do
			if [ "$CNT" -ge $2 ] && [ "$CNT" -le $3 ]; then
				FREQ="$((FREQ / 1000)) MHz:";
				if [ $TIME -ge "100" ]; then
					PERC=`$BB awk "BEGIN { print ( ($TIME / $SUM) * 100) }"`;
					PERC="`$BB printf "%0.1f\n" $PERC`%";
					TIME=$((TIME / 100));
					STATE="$STATE $FREQ `$BB echo - | $BB awk -v "S=$TIME" '{printf "%dh:%dm:%ds",S/(60*60),S%(60*60)/60,S%60}'` ($PERC)@n";
				fi;
			fi;
			CNT=$((CNT+1));
		done < /sys/devices/system/cpu/cpu0/cpufreq/stats/time_in_state;

		STATE=${STATE%??};
		$BB echo "$STATE";
	;;
	LiveTimeKRYO2)
		STATE="";
		CNT=0;
		SUM=`$BB awk '{s+=$2} END {print s}' /sys/devices/system/cpu/cpu2/cpufreq/stats/time_in_state`;

		while read FREQ TIME; do
			if [ "$CNT" -ge $2 ] && [ "$CNT" -le $3 ]; then
				FREQ="$((FREQ / 1000)) MHz:";
				if [ $TIME -ge "100" ]; then
					PERC=`$BB awk "BEGIN { print ( ($TIME / $SUM) * 100) }"`;
					PERC="`$BB printf "%0.1f\n" $PERC`%";
					TIME=$((TIME / 100));
					STATE="$STATE $FREQ `$BB echo - | $BB awk -v "S=$TIME" '{printf "%dh:%dm:%ds",S/(60*60),S%(60*60)/60,S%60}'` ($PERC)@n";
				fi;
			fi;
			CNT=$((CNT+1));
		done < /sys/devices/system/cpu/cpu2/cpufreq/stats/time_in_state;

		STATE=${STATE%??};
		$BB echo "$STATE";
	;;
    LiveTimeGpu)
		STATE="";
		CNT=0;
		SUM=`$BB awk '{s+=$2} END {print s}' /sys/devices/fdb00000.qcom,kgsl-3d0/kgsl/kgsl-3d0/time_in_state`;

		while read FREQ TIME; do
			if [ "$CNT" -ge $2 ] && [ "$CNT" -le $3 ]; then
				FREQ="$((FREQ / 1000000)) MHz:";
				if [ $TIME -ge "100" ]; then
					PERC=`$BB awk "BEGIN { print ( ($TIME / $SUM) * 100) }"`;
					PERC="`$BB printf "%0.1f\n" $PERC`%";
					TIME=$((TIME / 1000));
					STATE="$STATE $FREQ `$BB echo - | $BB awk -v "S=$TIME" '{printf "%dh:%dm:%ds",S/(60*60),S%(60*60)/60,S%60}'` ($PERC)@n";
				fi;
			fi;
			CNT=$((CNT+1));
		done < /sys/devices/soc.0/fdb00000.qcom,kgsl-3d0/devfreq/fdb00000.qcom,kgsl-3d0/time_in_state;

		STATE=${STATE%??};
		$BB echo "$STATE";
	;;
    LiveTimeKRYOGpu)
		STATE="";
		CNT=0;
		SUM=`$BB awk '{s+=$2} END {print s}' /sys/devices/soc/b00000.qcom,kgsl-3d0/devfreq/b00000.qcom,kgsl-3d0/time_in_state`;

		while read FREQ TIME; do
			if [ "$CNT" -ge $2 ] && [ "$CNT" -le $3 ]; then
				FREQ="$((FREQ / 1000000)) MHz:";
				if [ $TIME -ge "100" ]; then
					PERC=`$BB awk "BEGIN { print ( ($TIME / $SUM) * 100) }"`;
					PERC="`$BB printf "%0.1f\n" $PERC`%";
					TIME=$((TIME / 1000));
					STATE="$STATE $FREQ `$BB echo - | $BB awk -v "S=$TIME" '{printf "%dh:%dm:%ds",S/(60*60),S%(60*60)/60,S%60}'` ($PERC)@n";
				fi;
			fi;
			CNT=$((CNT+1));
		done < /sys/devices/soc.0/fdb00000.qcom,kgsl-3d0/devfreq/fdb00000.qcom,kgsl-3d0/time_in_state;

		STATE=${STATE%??};
		$BB echo "$STATE";
	;;
	LiveUpTime)
		TOTAL=`$BB awk '{ print $1 }' /proc/uptime`;
		AWAKE=$((`$BB awk '{s+=$2} END {print s}' /sys/devices/system/cpu/cpu0/cpufreq/stats/time_in_state` / 100));
		SLEEP=`$BB awk "BEGIN { print ($TOTAL - $AWAKE) }"`;
		
		PERC_A=`$BB awk "BEGIN { print ( ($AWAKE / $TOTAL) * 100) }"`;
		PERC_A="`$BB printf "%0.1f\n" $PERC_A`%";
		PERC_S=`$BB awk "BEGIN { print ( ($SLEEP / $TOTAL) * 100) }"`;
		PERC_S="`$BB printf "%0.1f\n" $PERC_S`%";
		
		TOTAL=`$BB echo - | $BB awk -v "S=$TOTAL" '{printf "%dh:%dm:%ds",S/(60*60),S%(60*60)/60,S%60}'`;
		AWAKE=`$BB echo - | $BB awk -v "S=$AWAKE" '{printf "%dh:%dm:%ds",S/(60*60),S%(60*60)/60,S%60}'`;
		SLEEP=`$BB echo - | $BB awk -v "S=$SLEEP" '{printf "%dh:%dm:%ds",S/(60*60),S%(60*60)/60,S%60}'`;
		$BB echo "Total: $TOTAL (100.0%)@nSleep: $SLEEP ($PERC_S)@nAwake: $AWAKE ($PERC_A)";
	;;
    LiveUpTimeCPU1)
		TOTAL=`$BB awk '{ print $1 }' /proc/uptime`;
		AWAKE=$((`$BB awk '{s+=$2} END {print s}' /sys/devices/system/cpu/cpu0/cpufreq/stats/time_in_state` / 100));
		SLEEP=`$BB awk "BEGIN { print ($TOTAL - $AWAKE) }"`;
		
		PERC_A=`$BB awk "BEGIN { print ( ($AWAKE / $TOTAL) * 100) }"`;
		PERC_A="`$BB printf "%0.1f\n" $PERC_A`%";
		PERC_S=`$BB awk "BEGIN { print ( ($SLEEP / $TOTAL) * 100) }"`;
		PERC_S="`$BB printf "%0.1f\n" $PERC_S`%";
		
		TOTAL=`$BB echo - | $BB awk -v "S=$TOTAL" '{printf "%dh:%dm:%ds",S/(60*60),S%(60*60)/60,S%60}'`;
		AWAKE=`$BB echo - | $BB awk -v "S=$AWAKE" '{printf "%dh:%dm:%ds",S/(60*60),S%(60*60)/60,S%60}'`;
		SLEEP=`$BB echo - | $BB awk -v "S=$SLEEP" '{printf "%dh:%dm:%ds",S/(60*60),S%(60*60)/60,S%60}'`;
		$BB echo "Total: $TOTAL (100.0%)@nSleep: $SLEEP ($PERC_S)@nAwake: $AWAKE ($PERC_A)";
	;;
    LiveUpTimeCPU2)
		TOTAL=`$BB awk '{ print $1 }' /proc/uptime`;
		AWAKE=$((`$BB awk '{s+=$2} END {print s}' /sys/devices/system/cpu/cpu4/cpufreq/stats/time_in_state` / 100));
		SLEEP=`$BB awk "BEGIN { print ($TOTAL - $AWAKE) }"`;
		
		PERC_A=`$BB awk "BEGIN { print ( ($AWAKE / $TOTAL) * 100) }"`;
		PERC_A="`$BB printf "%0.1f\n" $PERC_A`%";
		PERC_S=`$BB awk "BEGIN { print ( ($SLEEP / $TOTAL) * 100) }"`;
		PERC_S="`$BB printf "%0.1f\n" $PERC_S`%";
		
		TOTAL=`$BB echo - | $BB awk -v "S=$TOTAL" '{printf "%dh:%dm:%ds",S/(60*60),S%(60*60)/60,S%60}'`;
		AWAKE=`$BB echo - | $BB awk -v "S=$AWAKE" '{printf "%dh:%dm:%ds",S/(60*60),S%(60*60)/60,S%60}'`;
		SLEEP=`$BB echo - | $BB awk -v "S=$SLEEP" '{printf "%dh:%dm:%ds",S/(60*60),S%(60*60)/60,S%60}'`;
		$BB echo "Total: $TOTAL (100.0%)@nSleep: $SLEEP ($PERC_S)@nAwake: $AWAKE ($PERC_A)";
	;;
    LiveUpTimeKRYO1)
		TOTAL=`$BB awk '{ print $1 }' /proc/uptime`;
		AWAKE=$((`$BB awk '{s+=$2} END {print s}' /sys/devices/system/cpu/cpu0/cpufreq/stats/time_in_state` / 100));
		SLEEP=`$BB awk "BEGIN { print ($TOTAL - $AWAKE) }"`;
		
		PERC_A=`$BB awk "BEGIN { print ( ($AWAKE / $TOTAL) * 100) }"`;
		PERC_A="`$BB printf "%0.1f\n" $PERC_A`%";
		PERC_S=`$BB awk "BEGIN { print ( ($SLEEP / $TOTAL) * 100) }"`;
		PERC_S="`$BB printf "%0.1f\n" $PERC_S`%";
		
		TOTAL=`$BB echo - | $BB awk -v "S=$TOTAL" '{printf "%dh:%dm:%ds",S/(60*60),S%(60*60)/60,S%60}'`;
		AWAKE=`$BB echo - | $BB awk -v "S=$AWAKE" '{printf "%dh:%dm:%ds",S/(60*60),S%(60*60)/60,S%60}'`;
		SLEEP=`$BB echo - | $BB awk -v "S=$SLEEP" '{printf "%dh:%dm:%ds",S/(60*60),S%(60*60)/60,S%60}'`;
		$BB echo "Total: $TOTAL (100.0%)@nSleep: $SLEEP ($PERC_S)@nAwake: $AWAKE ($PERC_A)";
	;;
    LiveUpTimeKRYO2)
		TOTAL=`$BB awk '{ print $1 }' /proc/uptime`;
		AWAKE=$((`$BB awk '{s+=$2} END {print s}' /sys/devices/system/cpu/cpu2/cpufreq/stats/time_in_state` / 100));
		SLEEP=`$BB awk "BEGIN { print ($TOTAL - $AWAKE) }"`;
		
		PERC_A=`$BB awk "BEGIN { print ( ($AWAKE / $TOTAL) * 100) }"`;
		PERC_A="`$BB printf "%0.1f\n" $PERC_A`%";
		PERC_S=`$BB awk "BEGIN { print ( ($SLEEP / $TOTAL) * 100) }"`;
		PERC_S="`$BB printf "%0.1f\n" $PERC_S`%";
		
		TOTAL=`$BB echo - | $BB awk -v "S=$TOTAL" '{printf "%dh:%dm:%ds",S/(60*60),S%(60*60)/60,S%60}'`;
		AWAKE=`$BB echo - | $BB awk -v "S=$AWAKE" '{printf "%dh:%dm:%ds",S/(60*60),S%(60*60)/60,S%60}'`;
		SLEEP=`$BB echo - | $BB awk -v "S=$SLEEP" '{printf "%dh:%dm:%ds",S/(60*60),S%(60*60)/60,S%60}'`;
		$BB echo "Total: $TOTAL (100.0%)@nSleep: $SLEEP ($PERC_S)@nAwake: $AWAKE ($PERC_A)";
	;;
	LiveUnUsed)
		UNUSED="";
		while read FREQ TIME; do
			FREQ="$((FREQ / 1000)) MHz";
			if [ $TIME -lt "100" ]; then
				UNUSED="$UNUSED$FREQ, ";
			fi;
		done < /sys/devices/system/cpu/cpu0/cpufreq/stats/time_in_state;
		
		UNUSED=${UNUSED%??};
		$BB echo "$UNUSED";
	;;
	LiveUnUsedCPU1)
		UNUSED="";
		while read FREQ TIME; do
			FREQ="$((FREQ / 1000)) MHz";
			if [ $TIME -lt "100" ]; then
				UNUSED="$UNUSED$FREQ, ";
			fi;
		done < /sys/devices/system/cpu/cpu0/cpufreq/stats/time_in_state;
		
		UNUSED=${UNUSED%??};
		$BB echo "$UNUSED";
	;;
	LiveUnUsedCPU2)
		UNUSED="";
		while read FREQ TIME; do
			FREQ="$((FREQ / 1000)) MHz";
			if [ $TIME -lt "100" ]; then
				UNUSED="$UNUSED$FREQ, ";
			fi;
		done < /sys/devices/system/cpu/cpu2/cpufreq/stats/time_in_state;
		
		UNUSED=${UNUSED%??};
		$BB echo "$UNUSED";
	;;
	LiveUnUsedKRYO1)
		UNUSED="";
		while read FREQ TIME; do
			FREQ="$((FREQ / 1000)) MHz";
			if [ $TIME -lt "100" ]; then
				UNUSED="$UNUSED$FREQ, ";
			fi;
		done < /sys/devices/system/cpu/cpu0/cpufreq/stats/time_in_state;
		
		UNUSED=${UNUSED%??};
		$BB echo "$UNUSED";
	;;
    LiveUnUsedKRYO2)
		UNUSED="";
		while read FREQ TIME; do
			FREQ="$((FREQ / 1000)) MHz";
			if [ $TIME -lt "100" ]; then
				UNUSED="$UNUSED$FREQ, ";
			fi;
		done < /sys/devices/system/cpu/cpu2/cpufreq/stats/time_in_state;
		
		UNUSED=${UNUSED%??};
		$BB echo "$UNUSED";
	;;
	LiveUnUsedGpu)
		UNUSED="";
		while read FREQ TIME; do
			FREQ="$((FREQ / 1000000)) MHz";
			if [ $TIME -lt "1000" ]; then
				UNUSED="$UNUSED$FREQ, ";
			fi;
		done < /sys/devices/soc.0/fdb00000.qcom,kgsl-3d0/devfreq/fdb00000.qcom,kgsl-3d0/time_in_state;

		UNUSED=${UNUSED%??};
		$BB echo "$UNUSED";
	;;
	LiveUnUsedKRYOGpu)
		UNUSED="";
		while read FREQ TIME; do
			FREQ="$((FREQ / 1000000)) MHz";
			if [ $TIME -lt "1000" ]; then
				UNUSED="$UNUSED$FREQ, ";
			fi;
		done < /sys/devices/soc/b00000.qcom,kgsl-3d0/devfreq/b00000.qcom,kgsl-3d0/time_in_state;

		UNUSED=${UNUSED%??};
		$BB echo "$UNUSED";
	;;
	LiveWakelocksKernel)
		WL="";
		CNT=0;
		PATH=/sdcard/wakelocks.txt;
		$BB sort -nrk 7 /proc/wakelocks > $PATH;
		
		while read NAME COUNT EXPIRE_COUNT WAKE_COUNT ACTIVE_SINCE TOTAL_TIME SLEEP_TIME MAX_TIME LAST_CHANGE; do
			if [ $CNT -lt 10 ]; then
				NAME=`$BB echo $NAME | $BB sed 's/PowerManagerService./PMS./;s/"//g'`
				TIME=`$BB awk "BEGIN { print ( $SLEEP_TIME / 1000000000 ) }"`;
				TIME=`$BB echo - | $BB awk -v "S=$TIME" '{printf "%dh:%dm:%ds",S/(60*60),S%(60*60)/60,S%60}'`;
				WL="$WL$NAME: $TIME@n";
			fi;
			CNT=$((CNT+1));
		done < $PATH;
		$BB rm -f $PATH;
		
		WL=${WL%??};
		$BB echo $WL;
	;;
	MaxCPU)
		MAXCPU=/sys/devices/system/cpu/cpu7/cpufreq/scaling_cur_freq;
		MAXCPU1=/sys/module/clock_cpu_8996;
		MAXCPU2=/sys/module/clock_cpu_8956;
		
		
		if [ -f "$MAXCPU" ]; then
			$BB echo "8"
		else
			$BB echo "4"
		fi;
		
		if [ -d "$MAXCPU1" ]; then
			$BB echo "4"
		fi;
		
		if [ -d "$MAXCPU2" ]; then
			$BB echo "6"
		fi;
	;;
	MinFreqIndex)
		ID=0;
		MAXID=8;
		while read FREQ TIME; do
			LABEL=$((FREQ / 1000));
			if [ $FREQ -gt "384000" ] && [ $ID -le $MAXID ]; then
				MFIT="$MFIT $ID:\"${LABEL} MHz\", ";
			fi;
			ID=$((ID + 1));
		done < /sys/devices/system/cpu/cpu0/cpufreq/stats/time_in_state;

		$BB echo $MFIT;
	;;
	SetCPUGovernor)
		for CPU in /sys/devices/system/cpu/cpu[0-3]; do
			$BB echo 1 > $CPU/online 2> /dev/null;
			$BB echo $2 > $CPU/cpufreq/scaling_governor 2> /dev/null;
		done;
	;;
	SetCPU1Governor)
		for CPU in /sys/devices/system/cpu/cpu[0-3]; do
			$BB echo 1 > $CPU/online 2> /dev/null;
			$BB echo $2 > $CPU/cpufreq/scaling_governor 2> /dev/null;
		done;
	;;
    SetCPU2Governor)
		for CPU in /sys/devices/system/cpu/cpu[4-7]; do
			$BB echo 1 > $CPU/online 2> /dev/null;
			$BB echo $2 > $CPU/cpufreq/scaling_governor 2> /dev/null;
		done;
	;;
    SetKRYO1Governor)
		for CPU in /sys/devices/system/cpu/cpu[0-1]; do
			$BB echo 1 > $CPU/online 2> /dev/null;
			$BB echo $2 > $CPU/cpufreq/scaling_governor 2> /dev/null;
		done;
	;;
	SetKRYO2Governor)
		for CPU in /sys/devices/system/cpu/cpu[2-3]; do
			$BB echo 1 > $CPU/online 2> /dev/null;
			$BB echo $2 > $CPU/cpufreq/scaling_governor 2> /dev/null;
		done;
	;;
	SetCPUMaxFrequency)
		for CPU in /sys/devices/system/cpu/cpu[1-3]; do
			$BB echo 1 > $CPU/online 2> /dev/null;
			$BB echo $2 > $CPU/cpufreq/scaling_max_freq 2> /dev/null;
		done;
	;;
	SetCPU1MaxFrequency)
		for CPU in /sys/devices/system/cpu/cpu[0-3]; do
			$BB echo 1 > $CPU/online 2> /dev/null;
			$BB echo $2 > $CPU/cpufreq/scaling_max_freq 2> /dev/null;
		done;
	;;
	SetCPU2MaxFrequency)
		for CPU in /sys/devices/system/cpu/cpu[4-7]; do
			$BB echo 1 > $CPU/online 2> /dev/null;
			$BB echo $2 > $CPU/cpufreq/scaling_max_freq 2> /dev/null;
		done;
	;;
	SetKRYO1MaxFrequency)
		for CPU in /sys/devices/system/cpu/cpu[0-1]; do
			$BB echo 1 > $CPU/online 2> /dev/null;
			$BB echo $2 > $CPU/cpufreq/scaling_max_freq 2> /dev/null;
		done;
	;;
	SetKRYO2MaxFrequency)
		for CPU in /sys/devices/system/cpu/cpu[2-3]; do
			$BB echo 1 > $CPU/online 2> /dev/null;
			$BB echo $2 > $CPU/cpufreq/scaling_max_freq 2> /dev/null;
		done;
	;;
	SetCPUMinFrequency)
		for CPU in /sys/devices/system/cpu/cpu[1-3]; do
			$BB echo 1 > $CPU/online 2> /dev/null;
			$BB echo $2 > $CPU/cpufreq/scaling_min_freq 2> /dev/null;
		done;
	;;
    SetCPU1MinFrequency)
		for CPU in /sys/devices/system/cpu/cpu[1-3]; do
			$BB echo 1 > $CPU/online 2> /dev/null;
			$BB echo $2 > $CPU/cpufreq/scaling_min_freq 2> /dev/null;
		done;
	;;
    SetCPU2MinFrequency)
		for CPU in /sys/devices/system/cpu/cpu[4-7]; do
			$BB echo 1 > $CPU/online 2> /dev/null;
			$BB echo $2 > $CPU/cpufreq/scaling_min_freq 2> /dev/null;
		done;
	;;
    SetKRYO1MinFrequency)
		for CPU in /sys/devices/system/cpu/cpu[0-1]; do
			$BB echo 1 > $CPU/online 2> /dev/null;
			$BB echo $2 > $CPU/cpufreq/scaling_min_freq 2> /dev/null;
		done;
	;;
    SetKRYO2MinFrequency)
		for CPU in /sys/devices/system/cpu/cpu[2-3]; do
			$BB echo 1 > $CPU/online 2> /dev/null;
			$BB echo $2 > $CPU/cpufreq/scaling_min_freq 2> /dev/null;
		done;
	;;
	SetGPUMinPwrLevel)
		if [[ ! -z $3 ]]; then
			$BB echo $3 > $2;
		fi;
		
		$BB echo `$BB cat $2`;
	;;
	SetGPUGovernor)
		if [[ ! -z $3 ]]; then
			$BB echo $3 > $2 2> /dev/null;
		fi;
		
		$BB echo `$BB cat $2`;
	;;
	TCPCongestionList)
		for TCPCC in `$BB cat /proc/sys/net/ipv4/tcp_available_congestion_control` ; do
			$BB echo "\"$TCPCC\",";
		done;
	;;
	ToggleBootloader)
		block=/dev/block/platform/msm_sdcc.1/by-name/aboot;
		offset=1048080;
		locked=00;
		unlocked=01;
		lockstate=`$BB dd ibs=1 count=1 skip=$offset if=$block 2> /dev/null | $BB od -h | $BB head -n 1 | $BB cut -c 11-`;

		if [ $lockstate == $locked ]; then
			$BB echo "Setting state to Unlocked...";
			setstate=$unlocked;
		elif [ $lockstate == $unlocked ]; then
			$BB echo "Setting state to Locked...";
			setstate=$locked;
		else
			$BB echo "State is Unknown. No changes were made.";
		fi;
		
		if [ -n "$setstate" ]; then
			$BB echo -ne "\x$setstate" | $BB dd obs=1 count=1 seek=$offset of=$block 2> /dev/null;
		fi;
	;;
	ToggleTamper)
		block=/dev/block/platform/msm_sdcc.1/by-name/aboot;
		offset=1048084;
		false=00;
		true=01;
		tamperstate=`$BB dd ibs=1 count=1 skip=$offset obs=1 if=$block 2> /dev/null | $BB od -h | $BB head -n 1 | $BB cut -c 11-`;

		if [ $tamperstate == $true ]; then
			$BB echo "Setting tamper flag to False...";
			setstate=$false;
		elif [ $tamperstate == $false ]; then
			$BB echo "Setting tamper flag to True...";
			setstate=$true;
		else
			"Tamper is Unknown. No changes were made.";
		fi;
		
		if [ -n "$setstate" ]; then
			$BB echo -ne "\x$setstate" | $BB dd obs=1 count=1 seek=$offset of=$block 2> /dev/null;
		fi;
	;;
		LiveChargeCurrent)
			$BB echo "mA: `$BB cat /sys/kernel/charge_levels/charge_info`"
	;;
		LiveKernelCurrent)
			$BB echo "`$BB uname -r`"
	;;
		LiveInfoCurrent)
			$BB echo "Version: 4.0.1.4 Special Edition"
	;;
		LiveBrickedHotplug)
			$BB echo "Bricked Hotplug Driver"
	;;
		LiveIntellidHotplug)
			$BB echo "Intelli Hotplug Driver"
	;;
		LivedMsmHotplug)
			$BB echo "Msm Hotplug Driver"
	;;
		LiveSimpleThermal)
			$BB echo "Simple Thermal Driver"
	;;
	LiveCpuBoost)
			$BB echo "CPU Boost Driver"
	;;
	LiveCPU1)
			$BB echo "CPU"
	;;
	LiveCPU2)
			$BB echo "CPU 2"
	;;
	LiveKRYO1)
			$BB echo "Kryo 1.6 Cluster"
	;;
	LiveKRYO2)
			$BB echo "Kryo 2.2 Cluster"
	;;
	LiveCpuBoost)
			$BB echo "CPU Boost"
	;;
	LiveCoreControl)
			$BB echo "Core Control"
	;;
	LiveStateNotifier)
			$BB echo "State Notifier Driver"
	;;
	LiveMsmPerformance)
			$BB echo "MSM Performance Driver"
	;;
	LiveCpuCluster)
	
	CPUCLST=/sys/module/clock_cpu_8996;
	
		if [ -d "$CPUCLST" ]; then
			$BB echo "KYRO 1.6 Cluster"
		else
			$BB echo "A53 Cluster"
		fi;
	;;
	LiveCpuCluster1)
	
	CPUCLST=/sys/module/clock_cpu_8996;
	
		if [ -d "$CPUCLST" ]; then
			$BB echo "KYRO 2.2 Cluster"
		else
			$BB echo "A57 Cluster"
		fi;
	;;
esac;

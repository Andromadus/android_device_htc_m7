#!/system/bin/sh
# Copyright (c) 2009-2012, Code Aurora Forum. All rights reserved.
#
# Redistribution and use in source and binary forms, with or without
# modification, are permitted provided that the following conditions are met:
#     * Redistributions of source code must retain the above copyright
#       notice, this list of conditions and the following disclaimer.
#     * Redistributions in binary form must reproduce the above copyright
#       notice, this list of conditions and the following disclaimer in the
#       documentation and/or other materials provided with the distribution.
#     * Neither the name of Code Aurora nor
#       the names of its contributors may be used to endorse or promote
#       products derived from this software without specific prior written
#       permission.
#
# THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS IS"
# AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE
# IMPLIED WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND
# NON-INFRINGEMENT ARE DISCLAIMED.  IN NO EVENT SHALL THE COPYRIGHT OWNER OR
# CONTRIBUTORS BE LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL,
# EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT LIMITED TO,
# PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES; LOSS OF USE, DATA, OR PROFITS;
# OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON ANY THEORY OF LIABILITY,
# WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT (INCLUDING NEGLIGENCE OR
# OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF THIS SOFTWARE, EVEN IF
# ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
#

target=`getprop ro.board.platform`
case "$target" in
    "msm8960")
        echo "ondemand" > /sys/devices/system/cpu/cpu0/cpufreq/scaling_governor
        echo 90 > /sys/devices/system/cpu/cpufreq/ondemand/up_threshold
        ;;
esac

case "$target" in
    "msm8960")
     echo "ondemand" > /sys/devices/system/cpu/cpu0/cpufreq/scaling_governor
     echo "ondemand" > /sys/devices/system/cpu/cpu1/cpufreq/scaling_governor
     echo 90 > /sys/devices/system/cpu/cpufreq/ondemand/up_threshold
     echo 50000 > /sys/devices/system/cpu/cpufreq/ondemand/sampling_rate
     echo 1 > /sys/devices/system/cpu/cpufreq/ondemand/io_is_busy
     echo 4 > /sys/devices/system/cpu/cpufreq/ondemand/sampling_down_factor
     echo 10 > /sys/devices/system/cpu/cpufreq/ondemand/down_differential
     echo 384000 > /sys/devices/system/cpu/cpu0/cpufreq/scaling_min_freq
     echo 384000 > /sys/devices/system/cpu/cpu1/cpufreq/scaling_min_freq
     chown system /sys/devices/system/cpu/cpufreq/ondemand/io_is_busy
     chown system /sys/devices/system/cpu/cpu0/cpufreq/scaling_max_freq
     chown system /sys/devices/system/cpu/cpu0/cpufreq/scaling_min_freq
     chown system /sys/devices/system/cpu/cpu1/cpufreq/scaling_max_freq
     chown system /sys/devices/system/cpu/cpu1/cpufreq/scaling_min_freq
     chown root.system /sys/devices/system/cpu/mfreq
     chmod 220 /sys/devices/system/cpu/mfreq
     chown root.system /sys/devices/system/cpu/cpu1/online
     chmod 664 /sys/devices/system/cpu/cpu1/online
     chown system /sys/power/perflock
     chown system /sys/power/cpufreq_ceiling
     chown system /sys/power/cpunum_floor
     chown system /sys/power/cpunum_ceiling
     chown system /sys/power/powersave
     chown system /sys/power/launch_event
     chown system /sys/power/pnpmgr/apps/activity_trigger
     chmod 664 /sys/power/pnpmgr/apps/media_mode
     chown media.system /sys/power/pnpmgr/apps/media_mode
     chown system /sys/module/restart/parameters/notify_efs_sync
     echo "0,2,4,7,9,12" > /sys/module/lowmemorykiller/parameters/adj
        ;;
esac

emmc_boot=`getprop ro.emmc`
case "$emmc_boot"
    in "1")
        chown system /sys/devices/platform/rs300000a7.65536/force_sync
        chown system /sys/devices/platform/rs300000a7.65536/sync_sts
        chown system /sys/devices/platform/rs300100a7.65536/force_sync
        chown system /sys/devices/platform/rs300100a7.65536/sync_sts
    ;;
esac


# Post-setup services
case "$target" in
    "msm8660" | "msm8960")
        #start mpdecision
        start adaptive
    ;;
esac

# SQlite database optimization
if [ -e /data/adrenaline/engine/etc/sq_c ]; then
	echo "SQlite Counter File Exists"
	CNT=/data/adrenaline/engine/etc/sq_c
	SC=`cat $CNT`
	if [ $SC -eq 0 ]; then
		echo "1" > $CNT
		echo "First Boot"
		exit
	elif [ $SC -eq 1 ]; then
		echo "2" > $CNT
		echo "Second Boot"
		exit
	elif [ $SC -eq 2 ]; then
		echo "3" > $CNT
		echo "Third Boot"
		exit
	elif [ $SC -eq 3 ]; then
		echo "4" > $CNT
		echo "Forth Boot"
		exit
	elif [ $SC -eq 4 ]; then
		echo "Fifth Boot"
		echo "Now Optimizing"
		rm -f /data/adrenaline/engine/etc/sq_c
		touch /data/adrenaline/engine/etc/sq_c
		echo "0" > /data/adrenaline/engine/etc/sq_c
		for i in \
		`busybox find /data -iname "*.db"`; 
		do \
			/system/xbin/sqlite3 $i 'VACUUM;'; 
			/system/xbin/sqlite3 $i 'REINDEX;'; 
		done;

		if [ -d "/dbdata" ]; then
			for i in \
			`busybox find /dbdata -iname "*.db"`; 
			do \
				/system/xbin/sqlite3 $i 'VACUUM;'; 
				/system/xbin/sqlite3 $i 'REINDEX;'; 
			done;
		fi;


		if [ -d "/datadata" ]; then
			for i in \
			`busybox find /datadata -iname "*.db"`; 
			do \
				/system/xbin/sqlite3 $i 'VACUUM;'; 
				/system/xbin/sqlite3 $i 'REINDEX;'; 
			done;
		fi;


		for i in \
		`busybox find /sdcard -iname "*.db"`; 
		do \
			/system/xbin/sqlite3 $i 'VACUUM;'; 
			/system/xbin/sqlite3 $i 'REINDEX;'; 
		done;
	fi;
else
	touch /data/adrenaline/engine/etc/sq_c
	echo "0" > /data/adrenaline/engine/etc/sq_c
	echo "First Installation"
	echo "Now Optimizing"
		for i in \
		`busybox find /data -iname "*.db"`; 
		do \
			/system/xbin/sqlite3 $i 'VACUUM;'; 
			/system/xbin/sqlite3 $i 'REINDEX;'; 
		done;

		if [ -d "/dbdata" ]; then
			for i in \
			`busybox find /dbdata -iname "*.db"`; 
			do \
				/system/xbin/sqlite3 $i 'VACUUM;'; 
				/system/xbin/sqlite3 $i 'REINDEX;'; 
			done;
		fi;


		if [ -d "/datadata" ]; then
			for i in \
			`busybox find /datadata -iname "*.db"`; 
			do \
				/system/xbin/sqlite3 $i 'VACUUM;'; 
				/system/xbin/sqlite3 $i 'REINDEX;'; 
			done;
		fi;


		for i in \
		`busybox find /sdcard -iname "*.db"`; 
		do \
			/system/xbin/sqlite3 $i 'VACUUM;'; 
			/system/xbin/sqlite3 $i 'REINDEX;'; 
		done;
fi;

# Mount optimizations
mount -o remount,nodev,nodiratime,noatime,delalloc,noauto_da_alloc,barrier=1 /system /system
mount -o remount,nodev,nodiratime,noatime,delalloc,noauto_da_alloc,barrier=0 /cache /cache
mount -o remount,nodev,nodiratime,noatime,delalloc,noauto_da_alloc,barrier=0 /data /data 

#Run init.d 

/system/etc/init.d/*
#!/bin/bash
#adb install ../other/android/ru.meefik.busybox_40.apk
#adb push ../other/android/aapt-arm-pie /data/local/tmp/
#adb shell "(su;busybox chown -R shell:shell /data;busybox chmod +x /data/local/tmp/aapt-arm-pie)&"
for pkg in `adb shell pm list packages  -f | awk -F= '{sub("package:","");print $1}'`
do
	adb shell /data/local/tmp/aapt-arm-pie d badging $pkg| awk -F: '
		$1 == "package" { split($2,space," ")
		name=space[1];version=space[3]}
		$1 == "application-label-zh-CN" {print "#",name,  version , $2}'     
	echo "rm "$pkg >> rmdpk.sh
		#	$1 == "application-label" {print $2}'
done
echo "manual delete apk so that rmdpk.sh"
echo "adb push rm.sh /data/local/tmp"
echo "adb shell"
echo "adb su"
echo "awk -F {print \"rm -r\" $1} rmdpk.sh \| sh"

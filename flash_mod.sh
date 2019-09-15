#!/bin/bash

echo -e "\e[96m[+]\e[0m Flashing Rom \e[94m\e[0m:\n"

if [ -f ./fastboot ]
then
	FB_EXE=./fastboot
elif [ -f /usr/bin/fastboot ]
then
	FB_EXE=/usr/bin/fastboot
else
	echo "You need to install Android Tools you can get at this address https://dl.google.com/android/repository/platform-tools-latest-linux.zip"
	exit 1
fi

#ver=$(./fastboot $* getvar anti 2>&1 | grep -oP "anti:" \K[0-9]+")

CMDLIST=( \
#"getvar product 2>&1 | grep \"^product: *cepheus\"" \
"erase boot" \
"flash crclist ./images/crclist.txt" \
"flash sparsecrclist ./images/sparsecrclist.txt" \
"flash xbl ./images/xbl.elf" \
"flash xblbak ./images/xbl.elf" \
"flash xbl_config ./images/xbl_config.elf" \
"flash xbl_configbak ./images/xbl_config.elf" \
"flash abl ./images/abl.elf" \
"flash ablbak ./images/abl.elf" \
"flash tz ./images/tz.mbn" \
"flash tzbak ./images/tz.mbn" \
"flash hyp ./images/hyp.mbn" \
"flash hypbak ./images/hyp.mbn" \
"flash devcfg ./images/devcfg.mbn" \
"flash devcfgbak ./images/devcfg.mbn" \
"flash storsec ./images/storsec.mbn" \
"flash bluetooth ./images/BTFM.bin" \
"flash cmnlib ./images/cmnlib.mbn" \
"flash cmnlibbak ./images/cmnlib.mbn" \
"flash cmnlib64 ./images/cmnlib64.mbn" \
"flash cmnlib64bak ./images/cmnlib64.mbn" \
"flash modem ./images/NON-HLOS.bin" \
"flash dsp ./images/dspso.bin" \
"flash metadata ./images/metadata.img" \
"flash keymaster ./images/km4.mbn" \
"flash keymasterbak ./images/km4.mbn" \
"flash logo ./images/logo.img" \
"flash misc ./images/misc.img" \
"flash aop ./images/aop.mbn" \
"flash aopbak ./images/aop.mbn" \
"flash qupfw ./images/qupv3fw.elf" \
"flash qupfwbak ./images/qupv3fw.elf" \
"flash imagefv ./images/imagefv.elf" \
"flash uefisecapp ./images/uefi_sec.mbn" \
"flash uefisecappbak ./images/uefi_sec.mbn" \
"flash multiimgoem ./images/multi_image.mbn" \
"flash vendor ./images/vendor.img" \
"flash vbmeta ./images/vbmeta.img" \
"flash dtbo ./images/dtbo.img" \
"flash system ./images/system.img" \
"flash cache ./images/cache.img" \
"flash userdata ./images/userdata.img" \
"flash recovery ./images/recovery.img" \
"erase secdata" \
"flash cust ./images/cust.img" \
"flash boot ./images/boot.img" \
"reboot" \
)

for i in `seq -s' ' 0 $((${#CMDLIST[@]} - 1))`
do
	echo -en "\r[$((${i} + 1))/${#CMDLIST[@]}] fastboot ${CMDLIST[$i]}"
	$FB_EXE ${CMDLIST[$i]} 2>/dev/null 1>/dev/null
	if [ $? -ne 0 ] ; then echo -e "\n\nError on command $((${i} + 1))"; exit 1; fi
	echo -en "\r                                                                                                                 "
done

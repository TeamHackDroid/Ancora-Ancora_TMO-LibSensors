Test LibSensors Repo for Ancora/Ancora_TMO

To build 
1. Place libsensors in device tree 
2. Replace corresponding kernel files from "/kernel mine" 
3. Then remove
"vendor/samsung/ancora_tmo/proprietary/lib/hw/sensors.SGH-T679.so:system/lib/hw/sensors.ancora_tmo.so"
or 
"vendor/samsung/ancora/proprietary/lib/hw/sensors.GT-I8150.so:system/lib/hw/sensors.ancora.so"
from device-vendor-blobs.mk in vendor tree and the lib itself in the /proprietary/lib/hw/ folder
4. Add to device tree ancora_tmo.mk
Device-specific packages
PRODUCT_PACKAGES += \
    sensors.ancora_tmo \
or
Device-specific packages
PRODUCT_PACKAGES += \
    sensors.ancora \
5. If needed in the libsensors/android.mk
rename the module from "sensors.ancora_tmo" to "sensors.ancora"
If you made the same change in step 4 or different depending on your device
6. Proceed like normal

Note: In the case of the "arch/arm/mach-msm/board-ancora_tmo.c" refer to the changes.txt to make changes manually to ensure using latest code. And ensure it wont break boot.

 This is possible by the merger of akm sensor source and the working libsensor code from adc. Code mashup made to work with the Samsung implementation of all the parts. The akm sensor parts are taken from the open source AK8975_FS repo (https://github.com/akm-multisensor/AK8975_FS). And support for the other sensors comes from the adc team and their work for the Samsung Galaxy S Plus GT-I9001.

libsensor=sensors.ancora_tmo or sensor.ancora

adc=AriesVE-DevCon-TEAM(https://github.com/AriesVE-DevCon-TEAM/)

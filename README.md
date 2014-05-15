Test LibSensors Repo for Ancora/Ancora_TMO

To build place akm in device tree then replace corresponding kernel files from "/kernel mine" then proceed like normal.

Note: In the case of the "arch/arm/mach-msm/board-ancora_tmo.c" refer to the changes.txt to make changes manually to ensure using latest code.

Still testing needs fixing in make files to reflect merger of akm sensor source and the working libsensor code from adc. Code mashup made to work with the Samsung implementation of all the parts. The akm sensor parts are taken from the open source AK8975_FS repo (https://github.com/akm-multisensor/AK8975_FS). And support for the other sensors comes from the adc team and their work for the Samsung Galaxy S Plus GT-I9001 (https://github.com/AriesVE-DevCon-TEAM/android_device_samsung_ariesve).

libsensor=sensors.ancora_tmo or sensor.ancora
adc=AriesVE-DevCon-TEAM

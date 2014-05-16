ifneq ($(TARGET_PROVIDES_LIBSENSORS),true)

LOCAL_PATH := $(call my-dir)
include $(CLEAR_VARS)


LOCAL_CFLAGS := -DLOG_TAG=\"Sensors\" \
                -Wall -Wextra

LOCAL_SRC_FILES := \
        InputEventReader.cpp \
        AkmSensor.cpp \
        akmdfs/AKFS_APIs_8975/AKFS_AK8975.c \
        akmdfs/AKFS_APIs_8975/AKFS_AOC.c \
        akmdfs/AKFS_APIs_8975/AKFS_Device.c \
        akmdfs/AKFS_APIs_8975/AKFS_Direction.c \
        akmdfs/AKFS_APIs_8975/AKFS_VNorm.c \
        akmdfs/AKFS_FileIO.c \
        sensors.cpp         \
        SensorBase.cpp      \
        LightSensor.cpp     \
        ProximitySensor.cpp \
        Bma222Sensor.cpp    \
        OrientationSensor.cpp   \
        InputEventReader.cpp
            
LOCAL_C_INCLUDES := \
        $(LOCAL_PATH)/akmdfs \
        $(LOCAL_PATH)/akmdfs/AKFS_APIs_8975 \
        $(LOCAL_PATH)

LOCAL_SHARED_LIBRARIES := liblog libcutils libdl
LOCAL_PRELINK_MODULE := false


#
# Specify device type
#

LOCAL_CFLAGS  += -DHAL_FOR_AK8975

LOCAL_MODULE := sensors.$(TARGET_BOOTLOADER_BOARD_NAME)
LOCAL_MODULE_PATH := $(TARGET_OUT_SHARED_LIBRARIES)/hw
LOCAL_MODULE_TAGS := optional

include $(BUILD_SHARED_LIBRARY)

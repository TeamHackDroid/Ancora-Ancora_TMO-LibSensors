ifneq ($(TARGET_PROVIDES_LIBSENSORS),true)

LOCAL_PATH := $(call my-dir)

ifneq ($(TARGET_SIMULATOR),true)

# HAL module implemenation, not prelinked, and stored in
# hw/<SENSORS_HARDWARE_MODULE_ID>.<ro.product.board>.so
include $(CLEAR_VARS)


LOCAL_CFLAGS := -DLOG_TAG=\"Sensors\" \

LOCAL_SRC_FILES := \
        InputEventReader.cpp \
        AkmSensor.cpp \
        akmdfs/libAKM_OSS/AKFS_AOC.c \
        akmdfs/libAKM_OSS/AKFS_Configure.c \
        akmdfs/libAKM_OSS/AKFS_Decomp.c \		
        akmdfs/libAKM_OSS/AKFS_Device.c \
        akmdfs/libAKM_OSS/AKFS_Direction.c \
        akmdfs/libAKM_OSS/AKFS_VNorm.c \
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

LOCAL_MODULE := sensors.ancora_tmo
LOCAL_MODULE_PATH := $(TARGET_OUT_SHARED_LIBRARIES)/hw
LOCAL_MODULE_TAGS := optional

include $(BUILD_SHARED_LIBRARY)

endif

endif
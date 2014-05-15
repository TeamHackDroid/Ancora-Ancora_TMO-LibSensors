# Copyright (C) 2008 The Android Open Source Project
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#      http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.

ifneq ($(TARGET_PROVIDES_LIBSENSORS),true)

LOCAL_PATH := $(call my-dir)

ifneq ($(TARGET_SIMULATOR),true)

# HAL module implemenation, not prelinked, and stored in
# hw/<SENSORS_HARDWARE_MODULE_ID>.<ro.product.board>.so
include $(CLEAR_VARS)

LOCAL_MODULE := sensors.ancora_tmo

LOCAL_MODULE_PATH := $(TARGET_OUT_SHARED_LIBRARIES)/hw

LOCAL_MODULE_TAGS := eng
LOCAL_MODULE_TAGS := optional

LOCAL_CFLAGS := -DLOG_TAG=\"Sensors\" \
				-Wall -Wextra

LOCAL_SRC_FILES := \
			InputEventReader.cpp \
			AkmSensor.cpp \
			sensors.cpp 		\
			SensorBase.cpp		\
			LightSensor.cpp		\
			ProximitySensor.cpp	\
			Bma222Sensor.cpp	\
			OrientationSensor.cpp	\
			InputEventReader.cpp

LOCAL_SHARED_LIBRARIES := liblog libcutils libdl
LOCAL_PRELINK_MODULE := false


#
# Specify device type
#

LOCAL_CFLAGS  += -DHAL_FOR_AK8975

#
# Acceleration sensors 
#
#LOCAL_CFLAGS += -DHAL_ACC_AOT

#ifeq ($(AKMD_SENSOR_ACC), adxl346)
#LOCAL_CFLAGS += -DHAL_ACC_ADXL346
#LOCAL_SRC_FILES += Acc_adxl346.cpp

#else ifeq ($(AKMD_SENSOR_ACC),kxtf9)
#LOCAL_CFLAGS += -DHAL_ACC_KXTF9
#LOCAL_SRC_FILES += Acc_kxtf9.cpp

#else ifeq ($(AKMD_SENSOR_ACC),dummy)
#LOCAL_CFLAGS += -DHAL_ACC_DUMMY
#LOCAL_SRC_FILES += Acc_dummy.cpp

#else
#$(error AKMD_SENSOR_ACC is not defined)
#endif

include $(BUILD_SHARED_LIBRARY)

endif # !TARGET_SIMULATOR


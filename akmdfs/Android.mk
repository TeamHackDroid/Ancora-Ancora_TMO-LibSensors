ifneq ($(TARGET_SIMULATOR),true)

LOCAL_PATH:= $(call my-dir)

AKM_FS_LIB=libAKM_OSS

##### AKM daemon ###############################################################
include $(CLEAR_VARS)

LOCAL_C_INCLUDES := \
	$(KERNEL_HEADERS) \
	$(LOCAL_PATH)/$(AKM_FS_LIB)

LOCAL_SRC_FILES:= \
	$(AKM_FS_LIB)/AKFS_AOC.c \
	$(AKM_FS_LIB)/AKFS_Decomp.c \
	$(AKM_FS_LIB)/AKFS_Device.c \
	$(AKM_FS_LIB)/AKFS_Direction.c \
	$(AKM_FS_LIB)/AKFS_VNorm.c \
	AKFS_Driver.c \
	AKFS_APIs.c \
	AKFS_Disp.c \
	AKFS_FileIO.c \
	AKFS_Measure.c \
	main.c

LOCAL_CFLAGS += -Wall
LOCAL_CFLAGS += -DAKFS_OUTPUT_AVEC
LOCAL_CFLAGS += -DAKM_VALUE_CHECK
LOCAL_CFLAGS += -DENABLE_AKMDEBUG=1
LOCAL_CFLAGS += -DAKM_DEVICE_AK8975

LOCAL_MODULE := akmdfs
LOCAL_MODULE_TAGS := optional
LOCAL_FORCE_STATIC_EXECUTABLE := false
LOCAL_SHARED_LIBRARIES := libc libm libcutils
include $(BUILD_EXECUTABLE)

endif  # TARGET_SIMULATOR != true

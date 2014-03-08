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


LOCAL_PATH:= $(call my-dir)
# HAL module implemenation, not prelinked and stored in
# hw/<COPYPIX_HARDWARE_MODULE_ID>.<ro.board.platform>.so

include $(CLEAR_VARS)
ifeq ($(ARCH_ARM_HAVE_NEON),true)
LOCAL_CFLAGS += -D__ARM_HAVE_NEON
endif
ifeq "$(findstring msm7627a,$(TARGET_PRODUCT))" "msm7627a"
LOCAL_CFLAGS += -DTARGET_7x27A
endif
ifeq ($(TARGET_GRALLOC_USES_ASHMEM),true)
LOCAL_CFLAGS += -DUSE_ASHMEM
ifeq "$(findstring msm7627,$(TARGET_PRODUCT))" "msm7627"
   LOCAL_CFLAGS += -DTARGET_7x27
endif
endif

LOCAL_PRELINK_MODULE := false
LOCAL_MODULE_PATH := $(TARGET_OUT_SHARED_LIBRARIES)/hw
LOCAL_SHARED_LIBRARIES := liblog
LOCAL_SRC_FILES := copybit.cpp software_converter.cpp
LOCAL_MODULE := copybit.msm7x27
LOCAL_MODULE_TAGS := optional
LOCAL_C_INCLUDES += hardware/msm7k/libgralloc-qsd8k
LOCAL_CFLAGS += -DCOPYBIT_MSM7K=1
include $(BUILD_SHARED_LIBRARY)


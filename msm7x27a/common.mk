#Common headers
common_includes := hardware/qcom/display/msm7x27a/libgralloc
common_includes += hardware/qcom/display/msm7x27a/libgenlock
common_includes += hardware/qcom/display/msm7x27a/liboverlay
common_includes += hardware/qcom/display/msm7x27a/libcopybit
common_includes += hardware/qcom/display/msm7x27a/libqdutils
common_includes += hardware/qcom/display/msm7x27a/libhwcomposer
common_includes += hardware/qcom/display/msm7x27a/libexternal
common_includes += hardware/qcom/display/msm7x27a/libqservice
common_includes += hardware/qcom/display/msm7x27a/libvirtual
common_header_export_path := qcom/display

#Common libraries external to display/msm7x27a HAL
common_libs := liblog libutils libcutils libhardware

#Common C flags
common_flags := -DDEBUG_CALC_FPS -Wno-missing-field-initializers
#common_flags += -Werror

ifeq ($(ARCH_ARM_HAVE_NEON),true)
    common_flags += -D__ARM_HAVE_NEON
endif

ifeq ($(call is-board-platform-in-list, msm8974 msm8226 msm8610), true)
    common_flags += -DVENUS_COLOR_FORMAT
endif

common_deps  :=
kernel_includes :=

# Executed only on QCOM BSPs
ifeq ($(TARGET_USES_QCOM_BSP),true)
# This flag is used to compile out any features that depend on framework changes
    common_flags += -DQCOM_BSP
endif

common_deps += $(TARGET_OUT_INTERMEDIATES)/KERNEL_OBJ/usr
kernel_includes += $(TARGET_OUT_INTERMEDIATES)/KERNEL_OBJ/usr/include

ifneq ($(TARGET_DISPLAY_INSECURE_MM_HEAP),true)
    common_flags += -DSECURE_MM_HEAP
endif

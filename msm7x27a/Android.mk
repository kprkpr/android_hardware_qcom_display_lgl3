display-hals := libgralloc libgenlock libcopybit liblight
display-hals += libhwcomposer liboverlay libqdutils libexternal libqservice libvirtual
ifeq ($(call is-vendor-board-platform,QCOM),true)
    include $(call all-named-subdir-makefiles,$(display-hals))
else
ifneq ($(filter msm7627a msm7x27a msm8226 msm8x26 msm8960 msm8974 msm8x74,$(TARGET_BOARD_PLATFORM)),)
    #This is for mako since it doesn't have the QCOM make functions
    include $(call all-named-subdir-makefiles,$(display-hals))
endif
endif

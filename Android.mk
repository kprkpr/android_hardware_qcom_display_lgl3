ifneq ($(filter msm8974 msm8x74,$(TARGET_BOARD_PLATFORM)),)
    #This is for 8974 based platforms
    include $(call all-named-subdir-makefiles,msm8974)
else
ifneq ($(filter msm8226,$(TARGET_BOARD_PLATFORM)),)
    #This is for 8226 based platforms
    include $(call all-named-subdir-makefiles,msm8x26)
else
ifneq ($(filter msm7627a msm7x27a,$(TARGET_BOARD_PLATFORM)),)
    #This is for 7x27a based platforms
    include $(call all-named-subdir-makefiles,msm7x27a)
else
    #This is for 8960 based platforms
    include $(call all-named-subdir-makefiles,msm8960)
endif
endif
endif

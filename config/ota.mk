# Updater
ifeq ($(IS_OFFICIAL),true)
    PRODUCT_PACKAGES += \
        Updates

    PRODUCT_COPY_FILES += \
        vendor/fortune/prebuilt/common/etc/init/init.fortune-updater.rc:$(TARGET_COPY_OUT_SYSTEM_EXT)/etc/init/init.fortune-updater.rc
endif

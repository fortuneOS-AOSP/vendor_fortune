#
# Copyright (C) 2024 FortuneOS
#
# SPDX-License-Identifier: Apache-2.0
#

# BtHelper
PRODUCT_PACKAGES += \
    BtHelper

# Blur Support
ifeq ($(TARGET_SUPPORTS_BLUR),true)
PRODUCT_SYSTEM_EXT_PROPERTIES += \
    ro.sf.blurs_are_expensive=1 \
    ro.surface_flinger.supports_background_blur=1
endif

TARGET_USES_BLUR_RECENT ?= true
ifeq ($(TARGET_USES_BLUR_RECENT), true)
PRODUCT_PACKAGES += \
    PixelLauncherOverlayBlur
endif

# Cache clenaer
PRODUCT_PACKAGES += \
    init.cache_cleaner.rc \
    init.cache_cleaner.sh

# Extra packages
PRODUCT_PACKAGES += \
    BatteryStatsViewer \
    GameSpace \
    OmniJaws

# Face Unlock
TARGET_FACE_UNLOCK_SUPPORTED ?= $(TARGET_SUPPORTS_64_BIT_APPS)

ifeq ($(TARGET_FACE_UNLOCK_SUPPORTED),true)
PRODUCT_PACKAGES += \
    ParanoidSense

PRODUCT_SYSTEM_EXT_PROPERTIES += \
    ro.face.sense_service=true

PRODUCT_COPY_FILES += \
    frameworks/native/data/etc/android.hardware.biometrics.face.xml:$(TARGET_COPY_OUT_SYSTEM)/etc/permissions/android.hardware.biometrics.face.xml
endif

# GMS
$(call inherit-product, vendor/gms/products/gms.mk)

# Launcher
TARGET_DEFAULT_PIXEL_LAUNCHER ?= true
ifeq ($(TARGET_DEFAULT_PIXEL_LAUNCHER), true)
# Pixel Launcher
PRODUCT_SYSTEM_PROPERTIES += \
    persist.sys.default_launcher=1 \
    persist.sys.quickswitch_pixel_shipped=1
else
# Launcher3
PRODUCT_SYSTEM_PROPERTIES += \
    persist.sys.default_launcher=0 \
    persist.sys.quickswitch_pixel_shipped=0
endif

PRODUCT_PACKAGES += \
    AndroidOverlay \
    Launcher3QuickStep

# Mainline spoofing
PRODUCT_PRODUCT_PROPERTIES += \
    persist.sys.pihooks_mainline_BRAND?=google \
    persist.sys.pihooks_mainline_DEVICE?=caiman \
    persist.sys.pihooks_mainline_MANUFACTURER?=Google \
    persist.sys.pihooks_mainline_PRODUCT?=caiman \
    ro.product.model_for_attestation?=Pixel 9 Pro \
    ro.product.brand_for_attestation?=google \
    ro.product.name_for_attestation?=caiman \
    ro.product.device_for_attestation?=caiman \
    ro.product.manufacturer_for_attestation?=Google

PRODUCT_BUILD_PROP_OVERRIDES += \
    PIHOOKS_BUILD_FINGERPRINT="google/caiman/caiman:14/AD1A.240530.047.U1/12150698:user/release-keys" \
    PIHOOKS_MODEL_SPOOF="Pixel 9 Pro"

# Speed profile services and wifi-service to reduce RAM and storage
PRODUCT_SYSTEM_SERVER_COMPILER_FILTER := speed-profile
PRODUCT_USE_PROFILE_FOR_BOOT_IMAGE := true
PRODUCT_DEX_PREOPT_BOOT_IMAGE_PROFILE_LOCATION := frameworks/base/config/boot-image-profile.txt

# Updater
ifeq ($(filter-out COMMUNITY,$(FORTUNE_BUILD_TYPE)),)
    PRODUCT_PACKAGES += \
        Updater

PRODUCT_COPY_FILES += \
    vendor/fortune/prebuilt/common/etc/init/init.fortune-updater.rc:$(TARGET_COPY_OUT_SYSTEM_EXT)/etc/init/init.fortune-updater.rc
endif

# Workaround AOSP AM crash
PRODUCT_PROPERTY_OVERRIDES += \
    sys.fflag.override.settings_enable_monitor_phantom_procs=false

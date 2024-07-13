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

# Extra packages
PRODUCT_PACKAGES += \
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

# Updater
ifeq ($(filter-out COMMUNITY,$(FORTUNE_BUILD_TYPE)),)
    PRODUCT_PACKAGES += \
        Updater

PRODUCT_COPY_FILES += \
    vendor/fortune/prebuilt/common/etc/init/init.fortune-updater.rc:$(TARGET_COPY_OUT_SYSTEM_EXT)/etc/init/init.fortune-updater.rc
endif

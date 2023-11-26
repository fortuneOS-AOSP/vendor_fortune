#
# Copyright (C) 2024 FortuneOS
#
# SPDX-License-Identifier: Apache-2.0
#

# Addons
include vendor/addons/config.mk

# Extra packages
PRODUCT_PACKAGES += \
    OmniJaws

# Keepers
include vendor/fortune/config/keepers.mk

# Updater
ifeq ($(filter-out OFFICIAL,$(FORTUNE_BUILD_TYPE)),)
    PRODUCT_PACKAGES += \
        Updater

PRODUCT_COPY_FILES += \
    vendor/fortune/prebuilt/common/etc/init/init.fortune-updater.rc:$(TARGET_COPY_OUT_SYSTEM_EXT)/etc/init/init.fortune-updater.rc
endif

#
# Copyright (C) 2024 FortuneOS
#
# SPDX-License-Identifier: Apache-2.0
#

# Aperture
ifneq ($(PRODUCT_NO_CAMERA),true)
PRODUCT_PACKAGES += \
    Aperture
endif

# Config
PRODUCT_PACKAGES += \
    SimpleSettingsConfig

# SystemUI plugins
PRODUCT_PACKAGES += \
    QuickAccessWallet

# Updater
ifneq ($(TARGET_INCLUDE_UPDATER),false)
PRODUCT_PACKAGES += \
    Updater
endif

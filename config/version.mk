#
# Copyright (C) 2024 FortuneOS
#
# SPDX-License-Identifier: Apache-2.0
#

FORTUNE_ANDROID := 14.0
FORTUNE_REVISION := 2.0
FORTUNE_CODENAME := Usagi
FORTUNE_BUILD_DATE := $(shell date +"%d%m%Y-%H%M")

FORTUNE_VERSION := \
   ID.FRTN.v$(FORTUNE_REVISION)-$(FORTUNE_BUILD)-$(FORTUNE_BUILD_TYPE)-$(FORTUNE_BUILD_DATE)

FORTUNE_DISPLAY_VERSION := \
   $(FORTUNE_REVISION)-$(FORTUNE_CODENAME)-$(FORTUNE_BUILD_TYPE)

PRODUCT_SYSTEM_DEFAULT_PROPERTIES += \
    org.fortune.android=$(FORTUNE_ANDROID) \
    org.fortune.build.date=$(FORTUNE_BUILD_DATE) \
    org.fortune.build.type=$(FORTUNE_BUILD_TYPE) \
    org.fortune.display.version=$(FORTUNE_DISPLAY_VERSION) \
    org.fortune.codename=$(FORTUNE_CODENAME) \
    org.fortune.revision=$(FORTUNE_REVISION) \
    org.fortune.version=$(FORTUNE_VERSION)

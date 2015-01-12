#
# Copyright (C) 2024 FortuneOS
#
# SPDX-License-Identifier: Apache-2.0
#

# -----------------------------------------------------------------
# Fortune OTA update package

FORTUNE_TARGET_PACKAGE := $(PRODUCT_OUT)/$(FORTUNE_VERSION).zip

SHA256 := prebuilts/build-tools/path/$(HOST_PREBUILT_TAG)/sha256sum

.PHONY: fortune
fortune: $(DEFAULT_GOAL) $(INTERNAL_OTA_PACKAGE_TARGET)
	$(hide) ln -f $(INTERNAL_OTA_PACKAGE_TARGET) $(FORTUNE_TARGET_PACKAGE)
	$(hide) $(SHA256) $(FORTUNE_TARGET_PACKAGE) | sed "s|$(PRODUCT_OUT)/||" > $(FORTUNE_TARGET_PACKAGE).sha256sum
	$(hide) ./vendor/fortune/tools/generate_json_build_info.sh $(FORTUNE_TARGET_PACKAGE)
	$(hide) ./vendor/fortune/tools/changelog
	@echo ""
	@echo "Package Completed:"
	@echo ""
	@echo "█▀▀ █▀█ █▀█ ▀█▀ █░█ █▄░█ █▀▀"
	@echo "█▀░ █▄█ █▀▄ ░█░ █▄█ █░▀█ ██▄"
	@echo "═══════════════════════════════════════════════════════════════════"
	@echo "Datetime : `cat $(PRODUCT_OUT)/system/build.prop | grep ro.build.date.utc | cut -d'=' -f2 | awk '{print $$1}' `"
	@echo "Filename: $(FORTUNE_TARGET_PACKAGE)"
	@echo "Size: `du -sh $(FORTUNE_TARGET_PACKAGE) | awk '{print $$1}' `"
	@echo "SHA256: `cat $(FORTUNE_TARGET_PACKAGE).sha256sum | awk '{print $$1}' `"
	@echo "MD5: `md5sum $(FORTUNE_TARGET_PACKAGE) | cut -f 1 -d " "`"
	@echo "═══════════════════════════════════════════════════════════════════"
	@echo "" >&2

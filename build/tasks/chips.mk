# Copyright (C) 2022 PixysOS Project
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#      http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.

# -----------------------------------------------------------------

FORTUNE_TARGET_UPDATEPACKAGE := $(PRODUCT_OUT)/$(FORTUNE_VERSION)-updateimages.zip

SHA256 := prebuilts/build-tools/path/$(HOST_PREBUILT_TAG)/sha256sum

.PHONY: chips
chips: $(INTERNAL_UPDATE_PACKAGE_TARGET)
	$(hide) ln -f $(INTERNAL_UPDATE_PACKAGE_TARGET) $(FORTUNE_TARGET_UPDATEPACKAGE)
	$(hide) $(SHA256) $(FORTUNE_TARGET_UPDATEPACKAGE) | sed "s|$(PRODUCT_OUT)/||" > $(FORTUNE_TARGET_UPDATEPACKAGE).sha256sum
	@echo "Package Complete: $(FORTUNE_TARGET_UPDATEPACKAGE)" >&2

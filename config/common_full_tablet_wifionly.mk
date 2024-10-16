# Inherit mobile full common FortuneOS stuff
$(call inherit-product, vendor/fortune/config/common_mobile_full.mk)

# Inherit tablet common FortuneOS stuff
$(call inherit-product, vendor/fortune/config/tablet.mk)

$(call inherit-product, vendor/fortune/config/wifionly.mk)

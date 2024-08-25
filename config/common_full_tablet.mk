# Inherit mobile full common stuff
$(call inherit-product, vendor/fortune/config/common_mobile_full.mk)

# Inherit tablet common stuff
$(call inherit-product, vendor/fortune/config/tablet.mk)

$(call inherit-product, vendor/fortune/config/telephony.mk)

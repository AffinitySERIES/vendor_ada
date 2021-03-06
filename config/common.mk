PRODUCT_BRAND = AffinitySeries

ifneq ($(TARGET_BOOTANIMATION_NAME),)
    PRODUCT_COPY_FILES += \
        vendor/ada/prebuilt/common/bootanimation/$(TARGET_BOOTANIMATION_NAME).zip:system/media/bootanimation.zip
endif


PRODUCT_BUILD_PROP_OVERRIDES += BUILD_UTC_DATE=0

PRODUCT_PROPERTY_OVERRIDES += \
    keyguard.no_require_sim=true \
    ro.url.legal=http://www.google.com/intl/%s/mobile/android/basic/phone-legal.html \
    ro.url.legal.android_privacy=http://www.google.com/intl/%s/mobile/android/basic/privacy.html \
    ro.com.google.clientidbase=android-google \
    ro.com.android.wifi-watchlist=GoogleGuest \
    ro.setupwizard.enterprise_mode=1 \
    ro.com.android.dateformat=MM-dd-yyyy \
    ro.com.android.dataroaming=true

# Copy over the changelog to the device
PRODUCT_COPY_FILES += \

# init.d support
PRODUCT_COPY_FILES += \
    vendor/ada/prebuilt/common/etc/init.d/00banner:system/etc/init.d/00banner \
    vendor/ada/prebuilt/common/bin/sysinit:system/bin/sysinit

# userinit support
PRODUCT_COPY_FILES += \
    vendor/ada/prebuilt/common/etc/init.d/90userinit:system/etc/init.d/90userinit

# Compcache/Zram support
PRODUCT_COPY_FILES += \
    vendor/ada/prebuilt/common/etc/init.local.rc:system/etc/init.local.rc \
    vendor/ada/prebuilt/common/bin/compcache:system/bin/compcache \
    vendor/ada/prebuilt/common/bin/handle_compcache:system/bin/handle_compcache

PRODUCT_COPY_FILES +=  \
    vendor/ada/prebuilt/common/xbin/su:system/xbin/su \
    vendor/ada/prebuilt/common/apps/SuperSU.apk:system/app/SuperSU.apk

# Enable SIP+VoIP on all targets
PRODUCT_COPY_FILES += \
    frameworks/native/data/etc/android.software.sip.voip.xml:system/etc/permissions/android.software.sip.voip.xml

# Required ABA packages
PRODUCT_PACKAGES += \
    Camera \
    LatinIME \
    SuperSU.apk \
    Launcher2 \
    LiveWallpapersPicker \
    ADAPapers \
    Torch


# Optional ABA packages
PRODUCT_PACKAGES += \
    VideoEditor \
    SoundRecorder

# tools
PRODUCT_PACKAGES += \
    e2fsck \
    mke2fs \
    tune2fs

PRODUCT_PACKAGE_OVERLAYS += vendor/ada/overlay/dictionaries
PRODUCT_PACKAGE_OVERLAYS += vendor/ada/overlay/common

PRODUCT_VERSION_MAJOR = 1
PRODUCT_VERSION_MINOR = 0
PRODUCT_VERSION_MAINTENANCE = Beta1

ADA_VERSION := $(PRODUCT_VERSION_MAJOR).$(PRODUCT_VERSION_MINOR).$(PRODUCT_VERSION_MAINTENANCE)$(PRODUCT_VERSION_DEVICE_SPECIFIC)

PRODUCT_PROPERTY_OVERRIDES += \
  ro.modversion=$(ADA_VERSION)

# T-Mobile theme engine
$(call inherit-product, vendor/ada/config/themechooser.mk)

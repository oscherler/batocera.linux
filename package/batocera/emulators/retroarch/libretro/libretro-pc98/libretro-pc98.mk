################################################################################
#
# LIBRETRO PC98
#
################################################################################
# Version.: Commits on May 03, 2020
LIBRETRO_PC98_VERSION = 12c23166cc912b01c6db5905b51566ce60b80b01
LIBRETRO_PC98_SITE = $(call github,AZO234,NP2kai,$(LIBRETRO_PC98_VERSION))
LIBRETRO_PC98_LICENSE = GPLv3

LIBRETRO_PC98_PLATFORM = $(LIBRETRO_PLATFORM)

ifeq ($(BR2_PACKAGE_BATOCERA_TARGET_ODROIDN2),y)
	LIBRETRO_PC98_PLATFORM = odroidn2
endif

define LIBRETRO_PC98_BUILD_CMDS
	$(TARGET_CONFIGURE_OPTS) $(MAKE) CXX="$(TARGET_CXX)" CC="$(TARGET_CC)" -C $(@D)/sdl2/ -f Makefile.libretro platform="$(LIBRETRO_PC98_PLATFORM)"
endef

define LIBRETRO_PC98_INSTALL_TARGET_CMDS
	mkdir -p $(TARGET_DIR)/usr/share/batocera/datainit/bios/np2kai
	$(INSTALL) -D $(@D)/sdl2/np2kai_libretro.so \
		$(TARGET_DIR)/usr/lib/libretro/np2kai_libretro.so
endef

$(eval $(generic-package))

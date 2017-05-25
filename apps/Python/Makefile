# Nard Linux SDK
# http://www.arbetsmyra.dyndns.org/nard
# Copyright (C) 2014 Ronny Nilsson
#
# Python3 app by Manuel Faux
#moddified for 2.7 by Axel Hynsjö

include ../../Rules.mk                                                                                                                  # Common used stuff


#CC?=/home/axel/Downloads/nard/util/crosstool-ng/crosstool-ng-1.18.0/arm-unknown-linux-gnueabi/bin/arm-unknown-linux-gnueabi-gcc

#-----------------------------                                                                                                  # Standard targets
.PHONY: all $(PKG_VER)
all: $(PATH_FS)/.nard-$(PKG_NAME)
$(PKG_VER): $(PATH_FS)/.nard-$(PKG_NAME)


.PHONY: install
install: $(PATH_FS)/.nard-$(PKG_NAME)
$(PATH_FS)/.nard-$(PKG_NAME): $(PKG_VER)/.nard-build
        install -m 0755 -d "$(dir $@)"
        $(MAKE) -C "$(PKG_VER)" DESTDIR="$(PATH_FS)" commoninstall bininstall
        touch "$@"


$(PKG_VER)/.nard-prebuild: $(std-deps)
        $(MAKE) -C "$(PKG_VER)" distclean || true
        cd $(dir $@) && ./configure
        touch "$@"

$(PKG_VER)/.nard-build: $(std-deps)
        $(MAKE) -C "$(PKG_VER)" -j $(CPUS) PREFIX=/usr CC="$(PATH_CROSS_CC)gcc" \
                BUILD_NOLIBM=y BUILD_WE_ESSENTIAL=y iwmulticall
        cp "$(dir $@)python" "$(dir $@)python_host"
        cp "$(dir $@)Parser/pgen.c" "$(dir $@)Parser/pgen_host.c"
        touch "$@"



$(PKG_VER)/.nard-build: $(PKG_VER)/.nard-prebuild $(std-deps)
#       tar xzf "$(PKG_VER).tar.gz" -C "$(PKG_VER)" --strip-components=1 -- $(PKG_VER)/configure $(PKG_VER)/Makefile.pre.in
        cd $(dir $@) && patch -N -p1 < ../$(PKG_VER).patch || true
        $(MAKE) -C "$(PKG_VER)" distclean
        cd $(dir $@) && ./configure \
                CFLAGS="$(CROSS_CFLAGS)" \
                CPPFLAGS="$(CROSS_CFLAGS)" \
                --host=$(CROSS_TUPLE) \
                --build=x86_64-pc-linux-gnu \
                --disable-ipv6 \
                ac_cv_file__dev_ptmx=no ac_cv_file__dev_ptc=no ac_cv_have_long_long_format=yes
        $(MAKE) -C "$(PKG_VER)" -j $(CPUS)
        touch "$@"
#               --prefix=/home/axel/Downloads/nard/intermediate/fs/ \
#               --exec_prefix=$(PATH_FS)/ \
#               --host=arm-linux-gnueabihf \
#               --build=bcm2709_defconfig \
#               --CROSS_COMPILE=arm-unknown-linux-gnueabihf- \
#               --ARCH=arm \
#               --install-scripts=$(PATH_FS)/intermediate/fs/bin/ \

$(PKG_VER)/.nard-extract: $(wildcard $(PKG_VER).tar.*)
        $(std-extract)



#----------------------------                                                                                                   # Cleaning      
.PHONY: clean           
clean:
        $(std-clean)

.PHONY: distclean
distclean:
        $(std-distclean)






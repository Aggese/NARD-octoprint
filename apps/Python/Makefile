# Nard Linux SDK
# http://www.arbetsmyra.dyndns.org/nard
# Copyright (C) 2014 Ronny Nilsson
#
# based of the Python3 nard app by Manuel Faux


include ../../Rules.mk                                                                                                                  # Common used stuff


#-----------------------------                                                                                                  # Standard targets
.PHONY: all $(PKG_VER)
all: $(PATH_FS)/.nard-$(PKG_NAME)
$(PKG_VER): $(PATH_FS)/.nard-$(PKG_NAME)


.PHONY: install
install: $(PATH_FS)/.nard-$(PKG_NAME)
$(PATH_FS)/.nard-$(PKG_NAME): $(PKG_VER)/.nard-build
        $(MAKE) -C "$(PKG_VER)" DESTDIR="$(PATH_FS)" commoninstall bininstall
        touch "$@"


$(PKG_VER)/.nard-prebuild: $(std-deps)
        $(MAKE) -C "$(PKG_VER)" distclean || true
        cd $(dir $@) && ./configure
#       $(MAKE) -C "$(PKG_VER)" python Parser/pgen Programs/_freeze_importlib
        cp "$(dir $@)/python" "$(dir $@)/python_host"
        cp "$(dir $@)/Parser/pgen" "$(dir $@)/Parser/pgen_host"
#       cp "$(dir $@)/Programs/_freeze_importlib" "$(dir $@)/Programs/_freeze_importlib_host"
        touch "$@"


$(PKG_VER)/.nard-build: $(PKG_VER)/.nard-prebuild $(std-deps)
        #tar xzf "$(PKG_VER).tar.gz" -C "$(PKG_VER)" --strip-components=1 -- $(PKG_VER)/configure $(PKG_VER)/Makefile.pre.in
        cd $(dir $@) && patch -N -p1 < ../$(PKG_VER).patch || true
        $(MAKE) -C "$(PKG_VER)" distclean
        cd $(dir $@) && ./configure \
                CFLAGS="$(CROSS_CFLAGS)" \
                CPPFLAGS="$(CROSS_CFLAGS)" \
                --host=$(CROSS_TUPLE) \
                --prefix=/ \
                --build=x86_64-linux-gnu \
                --disable-ipv6 \
                ac_cv_file__dev_ptmx=no ac_cv_file__dev_ptc=no ac_cv_have_long_long_format=yes
        $(MAKE) -C "$(PKG_VER)" -j $(CPUS)
        touch "$@"


$(PKG_VER)/.nard-extract: $(PKG_VER).tar.*
        $(std-extract)



#----------------------------                                                                                                   # Cleaning      
.PHONY: clean           
clean:
        $(std-clean)

.PHONY: distclean
distclean:
        $(std-distclean)




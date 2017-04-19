#-------------------------------------------
# Product "skeleton" recipe
#-------------------------------------------


# The HW we will run on
export BOARD ?= raspi_b_revx


# List of applications this product needs. Packages
# will be built in the listed order (unless you
# explicitly define the dependencies).
PKGS_APPS += linux-kernel/linux-rpi-4.4.y
#PKGS_APPS += bftpd/bftpd-4.2                   ##No need for ftp
PKGS_APPS += wireless_tools/wireless_tools-29
PKGS_APPS += wpa_supplicant/wpa_supplicant-2.1
PKGS_APPS += hello/hello
PKGS_APPS += fatrace/fatrace-0.10


# Explicit package dependencies (optional, but
# nice to have for librarys)
#bftpd/bftpd-4.2: z-lib/z-lib-1.2.8 
openLightingArchitecture/https//github.com/OpenLightingProject/ola.git^0.10.2: protobuf/protobuf-2.6.1
openLightingArchitecture/https//github.com/OpenLightingProject/ola.git^0.10.2: uuid-lib/uuid-lib-1.0.3
openLightingArchitecture/https//github.com/OpenLightingProject/ola.git^0.10.2: usb-lib/usb-lib-1.0.20
openLightingArchitecture/https//github.com/OpenLightingProject/ola.git^0.10.2: microhttpd-lib/microhttpd-lib-0.9.49
openLightingArchitecture/https//github.com/OpenLightingProject/ola.git^0.10.2: lo-lib/lo-lib-0.28
protobuf/protobuf-2.6.1: z-lib/z-lib-1.2.8


#-----------------------------
# Get defines which tell what hw and
# sw we use and thus need (if any).
PRODUCT_DEPS +=
-include $(PATH_TOP)/platform/<parent-product>/Rules.mk

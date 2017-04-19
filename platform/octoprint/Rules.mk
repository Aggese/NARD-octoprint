# List of applications this product needs. Packages
# will be built in the listed order (unless you
# explicitly define the dependencies).



PKGS_APPS += Python/Python-2.7.13




#PKGS_APPS += Werkzeug/Werkzeug-0.12.1


#PKGS_APPS += Jinja/Jinja2-2.4
#PKGS_APPS += itsdangerus/itsdangerous-0.21
#PKGS_APPS += Flask/Flask-0.10





#-----------------------------
# Get defines which tell what hw and
# sw we use and thus need (if any).
#export BOARD ?= raspi_b_revx
PRODUCT_DEPS += skeleton
include $(PATH_TOP)/platform/skeleton/Rules.mk

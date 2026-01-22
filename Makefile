EQUIVALENTS := standard.equivalents
DIR := /usr/share/bdf2psf
FONTDIR := /usr/share/bdf2psf/fontsets
FONTSETS := \
	$(FONTDIR)/Uni1.512+ \
	$(FONTDIR)/Uni2.512+ \
	$(FONTDIR)/Uni3.512+ \
	$(DIR)/ascii.set+ \
	$(DIR)/linux.set+ \
	$(DIR)/useful.set+ \
	$(DIR)/freebsd.set

OPTIONS = $(EQUIVALENTS) $(FONTSETS)

all: gf11u.pcf gf11u.psf gf11.psf

gf11u.pcf: gf11u.bdf
	bdftopcf -t -o gf11u.pcf gf11u.bdf

gf11u.psfu: gf11u.bdf
	bdf2psf --fb gf11u.bdf $(OPTIONS) 512 gf11u.psfu

gf11.psf: gf11.bdf
	bdf2psf --fb gf11.bdf $(EQUIVALENTS) $(FONTDIR)/Lat15.256 256 gf11.psf

install: gf11u.pcf
	mkdir -p /usr/share/fonts/gf11
	ln -sf $(abspath $<) /usr/share/fonts/gf11/gf11u.pcf
	fc-cache

install_local: gf11u.pcf
	mkdir -p ~/.fonts
	ln -sf $(abspath $<) ~/.fonts/gf11u.pcf
	fc-cache -f ~/.fonts

clean:
	rm -f *.pcf *.psf *.psfu

.PHONY: all gf11u.pcf gf11u.psfu gf11.psf install install_local clean

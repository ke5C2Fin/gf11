EQUIVALENTS := standard.equivalents
DIR := /usr/share/bdf2psf
FONTDIR := /usr/share/bdf2psf/fontsets
FONTSETS := $(FONTDIR)/Uni1.512+:$(FONTDIR)/Uni2.512+:$(FONTDIR)/Uni3.512+:$(DIR)/ascii.set+:$(DIR)/linux.set+:$(DIR)/useful.set+:$(DIR)/freebsd.set

OPTIONS = $(EQUIVALENTS) $(FONTSETS)

all: pcf psf psfnouni

pcf: gf11u.bdf
	bdftopcf -t -o gf11u.pcf gf11u.bdf

psf: gf11u.bdf
	bdf2psf --fb gf11u.bdf $(OPTIONS) 512 gf11u.psfu

psfnouni: gf11u.bdf
	bdf2psf --fb gf11u.bdf $(EQUIVALENTS) $(FONTDIR)/Lat15.256 256 gf11.psf

#install:

clean:
	rm -f *.pcf *.psf *.psfu


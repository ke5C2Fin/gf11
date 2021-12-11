EQUIVALENTS := standard.equivalents
DIR := /usr/share/bdf2psf
FONTDIR := /usr/share/bdf2psf/fontsets
FONTSETS := $(FONTDIR)/Uni1.512+:$(FONTDIR)/Uni2.512+:$(FONTDIR)/Uni3.512+:$(DIR)/ascii.set+:$(DIR)/linux.set+:$(DIR)/useful.set

OPTIONS = $(EQUIVALENTS) $(FONTSETS)

all:	pcf psf psfnouni

pcf: g11-uni.bdf
	bdftopcf -t -o g11-uni.pcf g11-uni.bdf

psf: g11-uni.bdf
	bdf2psf --fb g11-uni.bdf $(OPTIONS) g11.psfu

psfnouni: g11-uni.bdf
	bdf2psf --fb g11-uni.bdf $(EQUIVALENTS) $(FONTDIR)/Lat15.256 256 g11.psf

clean:
	rm -f *.pcf *.psf *.psfu

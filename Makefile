a2x = a2x
asciidoc = asciidoc

all: \
	doc/arch-configure.1 \
	doc/arch-install.1 \
	doc/arch-configure.1.html \
	doc/arch-install.1.html

clean:
	rm  \
		doc/arch-configure.1 \
		doc/arch-install.1 \
		doc/arch-configure.1.html \
		doc/arch-install.1.html

.PHONY: all clean

doc/arch-configure.1: doc/arch-configure.1.txt
	$(a2x) -f manpage --no-xmllint $<

doc/arch-install.1: doc/arch-install.1.txt
	$(a2x) -f manpage --no-xmllint $<

doc/arch-configure.1.html: doc/arch-configure.1.txt
	$(asciidoc) $<

doc/arch-install.1.html: doc/arch-install.1.txt
	$(asciidoc) $<

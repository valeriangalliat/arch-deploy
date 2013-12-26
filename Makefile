prefix = /usr/local
exec_prefix = $(prefix)
bindir = $(exec_prefix)/bin
datarootdir = $(prefix)/share
mandir = $(datarootdir)/man
man1dir = $(mandir)/man1

a2x = a2x
asciidoc = asciidoc

version = 1.0

all: \
	bin \
	bin/arch-configure \
	bin/arch-install \
	doc/arch-configure.1 \
	doc/arch-install.1 \
	doc/arch-configure.1.html \
	doc/arch-install.1.html

clean:
	rm -fr \
		bin \
		doc/arch-configure.1 \
		doc/arch-install.1 \
		arch-deploy-$(version).tar.gz

dist: doc src LICENSE Makefile README.md
	tar czf arch-deploy-$(version).tar.gz $?

.PHONY: all clean dist

bin:
	mkdir $@

bin/arch-configure: src/arch-configure.sh
	echo "#!$$(which sh)" > $@
	echo >> $@
	cat $< >> $@
	chmod +x $@

bin/arch-install: src/arch-install.sh
	echo "#!$$(which sh)" > $@
	echo >> $@
	cat $< >> $@
	chmod +x $@

doc/arch-configure.1: doc/arch-configure.1.txt
	$(a2x) -f manpage --no-xmllint $<

doc/arch-install.1: doc/arch-install.1.txt
	$(a2x) -f manpage --no-xmllint $<

doc/arch-configure.1.html: doc/arch-configure.1.txt
	$(asciidoc) $<

doc/arch-install.1.html: doc/arch-install.1.txt
	$(asciidoc) $<

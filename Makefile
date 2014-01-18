a2x = a2x
asciidoc = asciidoc

txts=$(wildcard doc/*.txt)
htmls=$(txts:.txt=.html)
manpages=$(txts:.txt=)

all: $(htmls) $(manpages)

clean:
	rm $(htmls) $(manpages)

.PHONY: all clean

$(htmls): $(txts)
	$(foreach f,$^,$(asciidoc) $(f);)

$(manpages): $(txts)
	$(foreach f,$^,$(a2x) -f manpage --no-xmllint $(f);)

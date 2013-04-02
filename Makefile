DOCBOOK_ROOT := /opt/local/share/xsl/docbook-xsl

all: shared-expenses.html shared-expenses.pl shared-expenses.pdf

# code generating style
%.pl: %.docbook code.xsl
	xsltproc --output $@ code.xsl $<

# document output: HTML and then FO
%.html: %.docbook dkl.css.xml docbook/xhtml5/docbook.xsl
	xsltproc --xinclude --output $@ docbook/xhtml5/docbook.xsl $<

%.fo: %.docbook docbook/fo/docbook.xsl
	xsltproc --xinclude --output $@ docbook/fo/docbook.xsl $<

%.pdf: %.fo
	fop $< $@

.PHONY: clean
clean:
	rm -f shared-expenses.html shared-expenses.pdf shared-expenses.pl


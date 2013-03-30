DOCBOOK_ROOT := /opt/local/share/xsl/docbook-xsl

all: shared-expenses.html shared-expenses.pl shared-expenses.pdf

%.html: %.docbook
	xsltproc --output $@ \
		--stringparam make.clean.html true \
		--stringparam custom.css.source dkl.css.xml \
		$(DOCBOOK_ROOT)/html/docbook.xsl $<

%.pl: %.docbook code.xsl
	xsltproc --output $@ code.xsl $<

%.fo: %.docbook
	xsltproc --output $@ \
		$(DOCBOOK_ROOT)/fo/docbook.xsl $<

%.pdf: %.fo
	fop $< $@

.PHONY: clean
clean:
	rm -f *.html *.pl

DOCBOOK_ROOT := /opt/local/share/xsl/docbook-xsl

all: shared-expenses.html shared-expenses.pl

%.html: %.docbook
	xsltproc --output $@ \
		--stringparam make.clean.html true \
		--stringparam custom.css.source dkl.css.xml \
		$(DOCBOOK_ROOT)/html/docbook.xsl $<

%.pl: %.docbook code.xsl
	xsltproc --output $@ code.xsl $<

.PHONY: clean
clean:
	rm -f *.html *.pl

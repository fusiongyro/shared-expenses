<?xml version='1.0'?>
<xsl:stylesheet  
    xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0"
    xmlns:d="http://docbook.org/ns/docbook"
    exclude-result-prefixes="d">
  <xsl:import href="http://docbook.sourceforge.net/release/xsl/current/xhtml5/docbook.xsl"/>

  <xsl:param name="make.clean.html" select="true"/>
  <xsl:param name="custom.css.source" select="'dkl.css.xml'"/>
</xsl:stylesheet>
<?xml version='1.0'?>
<xsl:stylesheet  
    xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0"
    xmlns:d="http://docbook.org/ns/docbook"
    xmlns="http://www.w3.org/1999/xhtml"
    exclude-result-prefixes="d">
  <xsl:import href="http://docbook.sourceforge.net/release/xsl/current/xhtml5/docbook.xsl"/>

  <xsl:param name="make.clean.html" select="true"/>
  <xsl:param name="custom.css.source" select="'dkl.css.xml'"/>

  <xsl:template match="programlisting">
    <pre class="programlisting sh_prolog">
      <xsl:apply-templates/>
    </pre>
  </xsl:template>

  <xsl:template name="body.attributes">
    <xsl:attribute name="onload">sh_highlightDocument();</xsl:attribute>
  </xsl:template>
  
  <!-- We override this customization in order to inject the syntax highlighting library -->
  <xsl:template name="user.head.content">
    <script type="text/javascript" src="shjs-0.6/sh_main.min.js">&#160;</script>
    <script type="text/javascript" src="shjs-0.6/lang/sh_prolog.js">&#160;</script>
    <link type="text/css" rel="stylesheet" href="shjs-0.6/css/sh_nedit.css">&#160;</link>
  </xsl:template>
</xsl:stylesheet>
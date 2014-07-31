<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet 
    xmlns:simg="java:net.sf.docbook.saxon.ImageIntrinsics"
    xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:ximg="xaln://com.nwalsh.xalan.ImageIntrinsics" xmlns="http://www.w3.org/1999/xhtml"
    xmlns:exslt="http://exslt.org/common" xmlns:_acl="java:com.arbortext.epic.Acl"
    xmlns:msxsl="urn:schemas-microsoft-com:xslt" xmlns:_="http://www.pwc.ca/namespace/doctypes/emipc"
    xmlns:_dtd="http://www.arbortext.com/namespace/Styler/UserElements"
    xmlns:atidlm="http://www.arbortext.com/namespace/atidlm"
    xmlns:_2="http://www.pwc.ca/namespace/doctypes/jmtosmigrate"
    xmlns:ch="http://www.arbortext.com/namespace/chunker" xmlns:saxon="http://saxon.sf.net/"
    xmlns:_5="http://www.pwc.ca/namespace/doctypes/ipc"
    xmlns:_gte="http://www.arbortext.com/namespace/Styler/GeneratedTextElements"
    xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
    xmlns:_sfe="http://www.arbortext.com/namespace/Styler/StylerFormattingElements"
    xmlns:_js="java:com.arbortext.epic.internal.js.JavaScript"
    xmlns:_3="http://www.pwc.ca/namespace/doctypes/migrate"
    xmlns:_ufe="http://www.arbortext.com/namespace/Styler/UserFormattingElements" version="1.0">
  
  <xsl:variable name="filename" select="tokenize(tokenize(base-uri(), '/')[last()], '\.')[1]"/>
  <xsl:variable name="xsl-ext">.xsl</xsl:variable>
  
  <xsl:template match="/">
    <xsl:variable name="modes" select="distinct-values(//xsl:template/@mode)"/>
    <xsl:variable name="document-tree" select="."/>
    <xsl:for-each select="$modes">
      <xsl:variable name="mode" select="."/>
      <xsl:result-document method="xml" indent="no" encoding="UTF-8" href="./{$filename}_{$mode}{$xsl-ext}">
          <xsl:apply-templates select="$document-tree//xsl:stylesheet">
            <xsl:with-param name="mode" select="$mode"/>
          </xsl:apply-templates>
      </xsl:result-document>
    </xsl:for-each>
    <xsl:result-document method="xml" indent="no" encoding="UTF-8" href="./{$filename}_no-mode.xsl">
      <xsl:apply-templates select="$document-tree//xsl:stylesheet">
        <xsl:with-param name="mode" select="''"/>
        <xsl:with-param name="modes" select="$modes"/>
      </xsl:apply-templates>
    </xsl:result-document>
  </xsl:template>
  
  <xsl:template match="xsl:stylesheet">
    <xsl:param name="mode"/>
    <xsl:param name="modes"/>
    <xsl:copy>
      <xsl:apply-templates select="@*"/>
      <xsl:text>&#x0A;</xsl:text>
      <xsl:text>&#x0A;</xsl:text>
      
      <xsl:for-each select="$modes">
        <xsl:if test="string-length(.) > 0">
          <xsl:element name="xsl:include">
            <xsl:attribute name="href"><xsl:value-of select="concat($filename, '_', ., $xsl-ext)"/></xsl:attribute>
          </xsl:element>
          <xsl:text>&#x0A;</xsl:text>
        </xsl:if>
      </xsl:for-each>
      <xsl:text>&#x0A;</xsl:text>
      
      <xsl:choose>
        <xsl:when test="string-length($mode) > 0">
          <xsl:apply-templates select="*[@mode = $mode]"/>    
        </xsl:when>
        <xsl:otherwise>
          <xsl:apply-templates select="*[not(@mode)]"/>
        </xsl:otherwise>
      </xsl:choose>
    </xsl:copy>
  </xsl:template>
  
  <xsl:template match="@*|node()">
    <xsl:copy><xsl:apply-templates select="@*|node()"/></xsl:copy>
  </xsl:template>
  
  <xsl:template match="xsl:template|xsl:include|xsl:param|xsl:variable|xsl:output|xsl:attribute-set">
    <xsl:copy-of select="."/>
    <xsl:text>&#x0A;</xsl:text>
    <xsl:text>&#x0A;</xsl:text>
  </xsl:template>
  
 <!-- <xsl:template match="xsl:param|xsl:variable">
    <xsl:copy>
      <xsl:apply-templates select="@*|node()"/>
    </xsl:copy>
  </xsl:template>-->
  
</xsl:stylesheet>
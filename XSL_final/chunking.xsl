<?xml version="1.0" encoding="UTF-8"?>

<xsl:stylesheet
  xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
  xmlns:ch="http://www.arbortext.com/namespace/chunker"
  exclude-result-prefixes="ch" version="1.0">
  
  <xsl:template match="/*" mode="output">
    <xsl:apply-templates select="descendant::*[@ch:chunk = 'yes' and string-length(@ch:filename) > 0]" mode="output"/>
  </xsl:template>
  
  <xsl:template match="*[local-name(.)='div' and @ch:chunk = 'yes' and @ch:filename]" mode="output">
    <xsl:variable name="id" select="generate-id(.)"/>
    <xsl:variable name="isFolder" select="count(.//*[@ch:chunk = 'yes']) > 0"/>
    <xsl:variable name="hasFiles" select="count(.//*[@ch:title and generate-id(ancestor::*[@ch:chunk = 'yes'][1]) = $id]) > 1"/>
    <xsl:variable name="hasFolders" select="count(.//*[@ch:chunk = 'yes' and .//*[@ch:chunk = 'yes'] and generate-id(ancestor::*[@ch:chunk = 'yes'][1]) = $id]) > 0"/>
    
    <xsl:if test="($hasFiles and not($hasFolders)) or not($isFolder)">
      <xsl:result-document href="{concat($output-dir, '/', @ch:filename, '.html')}" 
        method="xhtml" encoding="utf-8" indent="no"
        omit-xml-declaration="yes" doctype-public="-//W3C//DTD XHTML 1.0 Strict//EN" doctype-system="http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd"
        exclude-result-prefixes="ch" >
        <html>
          <xsl:call-template name="build-header">
            <xsl:with-param name="title">
              <xsl:value-of select="descendant::*[@ch:title][1]"/>
            </xsl:with-param>
          </xsl:call-template>
          <body>
            <xsl:apply-templates select="." mode="output-content"/>
          </body>
        </html>
      </xsl:result-document>
    </xsl:if>
  </xsl:template>
  
  <xsl:template name="build-header">
    <xsl:param name="title"/>
    <head>
      <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
      <link href="{$css-path}/content.css" rel="stylesheet" type="text/css"/>
      <script src="{$js-path}/pwcdisplay.js" type="text/javascript"><![CDATA[ // JS ]]></script>
      <script src="{$js-path}/pwcdisplay_common.js" type="text/javascript"><![CDATA[ // JS ]]></script>
      <title><xsl:value-of select="$title"/></title>
    </head>
  </xsl:template>
  
  <xsl:template match="*" mode="output-content">
    <xsl:element name="{local-name(.)}">
      <xsl:apply-templates select="@*|node()[not(@ch:chunk = 'yes')]" mode="output-content"/>
    </xsl:element>
  </xsl:template>
  
  <xsl:template match="@ch:*" mode="output-content"/>
  
  <xsl:template match="@xml:id" mode="output-content"/>
  
  <xsl:template match="@*" mode="output-content">
    <xsl:copy/>
  </xsl:template>
  
  <xsl:template match="*[local-name()='a']/@href" mode="output-content">
    <xsl:variable name="refid" select="substring-after(., '#')"/>
    <xsl:variable name="current-chunk" select="ancestor::*[@ch:chunk = 'yes' and @ch:filename][1]"/>
    
    <xsl:attribute name="href">
      <xsl:choose>
        <xsl:when test=".='#none' or .='#'">
          <xsl:value-of select="."/>
        </xsl:when>
        <xsl:when test="$current-chunk//*[@id = $refid]">
          <xsl:value-of select="."/>
        </xsl:when>
        <xsl:otherwise>
          <xsl:variable name="dest-chunk-filename" select="//*[@id = $refid]/ancestor-or-self::*[@ch:chunk = 'yes' and @ch:filename][1]/@ch:filename"/>
          <xsl:value-of select="concat($dest-chunk-filename, '.html', .)"/>
        </xsl:otherwise>
      </xsl:choose>
    </xsl:attribute>
  </xsl:template>
  
</xsl:stylesheet>
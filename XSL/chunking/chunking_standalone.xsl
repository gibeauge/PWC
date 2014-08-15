<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet
  xmlns:xs="http://www.w3.org/2001/XMLSchema" 
  xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
  xmlns:ch="http://www.arbortext.com/namespace/chunker"
  exclude-result-prefixes="xs ch" version="1.0">
  
  <xsl:strip-space elements="*"/>
  
  <xsl:param name="outputDir" select="'C:/temp/work'"/>
  
  <xsl:template match="/">
    <xsl:apply-templates select="descendant::*[@ch:chunk = 'yes' and string-length(@ch:filename) > 0]" mode="output"/>
  </xsl:template>
  
  <xsl:template match="div[@ch:chunk = 'yes' and @ch:filename]" mode="output">
    <xsl:variable name="id" select="generate-id(.)"/>
    <xsl:variable name="isFolder" select=".//*[@ch:chunk = 'yes']"/>
    <xsl:variable name="hasFiles" select="count(.//*[@ch:title and generate-id(ancestor::*[@ch:chunk = 'yes'][1]) = $id]) > 1"/>
    <xsl:variable name="hasFolders" select="count(.//*[@ch:chunk = 'yes' and .//*[@ch:chunk = 'yes'] and generate-id(ancestor::*[@ch:chunk = 'yes'][1]) = $id]) > 0"/>
    
    <xsl:if test="($hasFiles and not($hasFolders)) or not($isFolder)">
      <xsl:variable name="outputFile" select="concat('file:///', $outputDir, '/', @ch:filename, '.html')"/>
      <xsl:result-document href="{$outputFile}" 
        method="xhtml" 
        omit-xml-declaration="yes" doctype-public="-//W3C//DTD XHTML 1.0 Strict//EN" doctype-system="http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd"
        encoding="utf-8" indent="yes" exclude-result-prefixes="ch" >
        <xsl:element name="html">
          <xsl:call-template name="build-header">
            <xsl:with-param name="title">
              <xsl:value-of select="descendant::*[@ch:title][1]"/>
            </xsl:with-param>
          </xsl:call-template>
          <xsl:element name="body">
            <xsl:apply-templates select="." mode="output-content"/>
          </xsl:element>
        </xsl:element>
      </xsl:result-document>
    </xsl:if>
  </xsl:template>
  
  <xsl:template name="build-header">
    <xsl:param name="title"/>
    <xsl:element name="head">
      <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
      <link href="css/styler.css" rel="stylesheet" type="text/css"/>
      <script language="JavaScript" src="_templates/frame/javascript/pwcdisplay.js" type="text/javascript"> 						
        // leave some space, so that the serializer won't collapse element 					
        // which could cause browser to mis-behave 			
      </script>
      <xsl:element name="title">
        <xsl:value-of select="$title"/>
      </xsl:element>
    </xsl:element>
  </xsl:template>
  
  <xsl:template match="*" mode="output-content">
    <xsl:element name="{local-name(.)}">
      <xsl:apply-templates select="@*[not(contains(name(), 'ch:'))]|node()[not(@ch:chunk = 'yes')]" mode="output-content"/>
    </xsl:element>
  </xsl:template>
  
  <xsl:template match="@*" mode="output-content">
    <xsl:copy/>
  </xsl:template>
  
  <xsl:template match="a/@href" mode="output-content">
    <xsl:variable name="refid" select="substring-after(., '#')"/>
    <xsl:variable name="current-chunk-filename" select="ancestor::div[@ch:chunk = 'yes' and @ch:filename][1]/@ch:filename"/>
    <xsl:variable name="dest-chunk-filename" select="//*[@id = $refid]/ancestor::div[@ch:chunk = 'yes' and @ch:filename][1]/@ch:filename"/>
    <xsl:attribute name="href">
      <xsl:choose>
        <xsl:when test="$current-chunk-filename != $dest-chunk-filename">
            <xsl:value-of select="concat($dest-chunk-filename, '.html', .)"/>
        </xsl:when>
        <xsl:otherwise>
          <xsl:value-of select="."/>
        </xsl:otherwise>
      </xsl:choose>
    </xsl:attribute>
  </xsl:template>
  
</xsl:stylesheet>
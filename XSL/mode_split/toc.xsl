<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet 
  xmlns:xsl="http://www.w3.org/1999/XSL/Transform" 
  xmlns:ch="http://www.arbortext.com/namespace/chunker" 
  xmlns:random="http://exslt.org/random"
  extension-element-prefixes="random"
  exclude-result-prefixes="ch random" version="1.0">
  
  <xsl:variable name="html-ext" select="'.html'"/>
  <xsl:variable name="sharp" select="'#'"/>

  <xsl:template match="/*" mode="toc">
    <xsl:result-document href="{concat($output-dir, '/toc/en.xml')}" method="xml" encoding="utf-8" indent="no">
      <xsl:element name="Structure">
        <xsl:apply-templates mode="toc"/>
      </xsl:element>
    </xsl:result-document>
  </xsl:template>

  <xsl:template match="*" mode="toc">
    <xsl:if test="descendant::*[@ch:chunk = 'yes'] or ancestor::*[@ch:title = 'toc']">
      <xsl:apply-templates mode="toc"/>
    </xsl:if>
  </xsl:template>

  <xsl:template match="*[@ch:chunk = 'yes']" mode="toc">
    <xsl:variable name="id" select="generate-id(.)"/>
    <xsl:variable name="toc" select="descendant::*[@ch:title][1]"/>
    <xsl:variable name="isFolder" select="descendant::*[@ch:chunk = 'yes' and descendant::*[@ch:title = 'toc']]"/>
    <xsl:variable name="hasTitle" select="count(descendant::*[@ch:title = 'toc' and generate-id(ancestor::*[@ch:chunk = 'yes'][1]) = $id][1]) > 0"/>
    <xsl:variable name="hasFiles" select="count(descendant::*[@ch:title = 'toc' and generate-id(ancestor::*[@ch:chunk = 'yes'][1]) = $id]) > 1"/>

    <xsl:choose>
      <xsl:when test="contains(@class, 'frontmatter')">
        <xsl:element name="Page">
          
          <xsl:attribute name="ID">
            <xsl:call-template name="generate-toc-id"/>
          </xsl:attribute>

          <xsl:attribute name="Title">
            <xsl:text>FRONTMATTER</xsl:text>
          </xsl:attribute>

          <xsl:apply-templates select="descendant::*[@ch:chunk = 'yes' and generate-id(ancestor::*[@ch:chunk = 'yes'][1]) = $id]" mode="toc"/>
        </xsl:element>
      </xsl:when>
      <xsl:when test="not($hasTitle) or parent::*[local-name(.)='body']">
        <xsl:apply-templates select="descendant::*[@ch:chunk = 'yes' and generate-id(ancestor::*[@ch:chunk = 'yes'][1]) = $id]" mode="toc"/>
      </xsl:when>
      <xsl:otherwise>
        <xsl:element name="Page">

          <xsl:attribute name="ID">
            <xsl:call-template name="generate-toc-id"/>
          </xsl:attribute>

          <xsl:attribute name="Title">
            <xsl:apply-templates select="$toc" mode="toc-title"/>
          </xsl:attribute>

          <xsl:if test="not($isFolder) or $hasFiles">
            <xsl:attribute name="URL">
              <xsl:value-of select="concat(@ch:filename, $html-ext, $sharp, $toc/@id)"/>
            </xsl:attribute>
          </xsl:if>

          <xsl:attribute name="FileType">
            <xsl:choose>
              <xsl:when test="$isFolder">
                <xsl:text>FOLDER</xsl:text>
              </xsl:when>
              <xsl:otherwise>
                <xsl:text>FILE</xsl:text>
              </xsl:otherwise>
            </xsl:choose>
          </xsl:attribute>

          <xsl:if test="not($isFolder)">
            <xsl:attribute name="MIMEType">
              <xsl:text>text/html</xsl:text>
            </xsl:attribute>
          </xsl:if>

          <xsl:if test="$toc/@ch:title = 'notoc'">
            <xsl:attribute name="Display">
              <xsl:text>false</xsl:text>
            </xsl:attribute>
          </xsl:if>

          <xsl:apply-templates select="descendant::*[@ch:chunk = 'yes' and generate-id(ancestor::*[@ch:chunk = 'yes'][1]) = $id]|descendant::*[@ch:title and generate-id(ancestor::*[@ch:chunk = 'yes'][1]) = $id][position() > 1]" mode="toc"/>
        </xsl:element>
      </xsl:otherwise>
    </xsl:choose>
  </xsl:template>

  <xsl:template match="*[@ch:title = 'toc']" mode="toc">
    <xsl:variable name="chunk" select="ancestor::*[@ch:chunk = 'yes'][1]"/>

    <xsl:element name="Page">

      <xsl:attribute name="ID">
        <xsl:call-template name="generate-toc-id"/>
      </xsl:attribute>

      <xsl:attribute name="Title">
        <xsl:call-template name="normalize-space">
          <xsl:with-param name="str">
            <xsl:value-of select="."/>
          </xsl:with-param>
        </xsl:call-template>
      </xsl:attribute>

      <xsl:attribute name="URL">
        <xsl:value-of select="concat($chunk/@ch:filename, $html-ext, $sharp, @id)"/>
      </xsl:attribute>

      <xsl:attribute name="FileType">
        <xsl:text>FILE</xsl:text>
      </xsl:attribute>

      <xsl:attribute name="MIMEType">
        <xsl:text>text/html</xsl:text>
      </xsl:attribute>

    </xsl:element>
  </xsl:template>
  
  <xsl:template match="*[@ch:title]" mode="toc-title">
    <xsl:call-template name="normalize-space">
      <xsl:with-param name="str">
        <xsl:value-of select="."/>
      </xsl:with-param>
    </xsl:call-template>
  </xsl:template>

  <xsl:template name="generate-toc-id">
    <xsl:variable name="ps" select="count(preceding::*)"/>
    <xsl:value-of select="concat('ID', substring(translate(random:random-sequence(1, count(preceding::*)) * 100000000, '.', ''), 1, 10 - string-length($ps)), $ps)"/>
  </xsl:template>

  <xsl:template name="normalize-space">
    <xsl:param name="str" select="''"/>
    <xsl:value-of select="normalize-space(translate($str, '&#xa0;&#xA0;&#x2003;&#x2002;', '    '))"/>
  </xsl:template>

</xsl:stylesheet>

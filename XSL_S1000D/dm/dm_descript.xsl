<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:fn="http://www.pwc.ca"
    xmlns:xs="http://www.w3.org/2001/XMLSchema"
    xmlns:saxon="http://saxon.sf.net/"
    xmlns="http://www.w3.org/1999/xhtml"
    exclude-result-prefixes="xs fn saxon #default"
    version="2.0">
    
<xsl:template match="description">
  <div class="s-descript">
    <xsl:apply-templates/>
  </div>
</xsl:template>
    
<xsl:template match="levelledPara">
  <div class="s-lPara">
    <xsl:call-template name="setID"/>
    <div class="s-lPara-nb" id="{generate-id(.)}">
      <xsl:if test="title and ancestor::dmInclusion/@is-fm='false'">
        <xsl:apply-templates select="." mode="numbering"/>
      </xsl:if>
      <xsl:text> </xsl:text>
    </div>
    <div class="s-lPara-c">
      <xsl:apply-templates/>
    </div>    
  </div>
</xsl:template>
    
<xsl:template match="levelledPara/title">
  <div class="s-lPara-title">
    <xsl:apply-templates/>
  </div>
</xsl:template>
    
<xsl:template match="levelledPara/*[1][self::para]">
  <div class="s-para s-para-lPara-first">
    <xsl:apply-templates/>
  </div>
</xsl:template>
        
</xsl:stylesheet>
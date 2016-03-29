<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:fn="http://www.pwc.ca"
    xmlns:xs="http://www.w3.org/2001/XMLSchema"
    xmlns="http://www.w3.org/1999/xhtml"
    exclude-result-prefixes="xs fn #default"
    version="2.0">
    
<xsl:template match="warningsAndCautions">
  <div>
    <xsl:call-template name="setID"/>
    <xsl:call-template name="change"/>
    <xsl:apply-templates/>
  </div>
</xsl:template>

<xsl:template match="warning|caution" priority="20">
  <div>
    <xsl:call-template name="setID"/>
    <xsl:call-template name="change">
      <xsl:with-param name="class" select="concat($css-pfx, name(), '-wrapper', $css-sfx)"/>
    </xsl:call-template>
    <div   class="{concat($css-pfx, name(), $css-sfx)}">
      <div class="{concat($css-pfx, name(), '-label', $css-sfx)}"><xsl:value-of select="fn:getGenText(name())"/></div>
      <div class="{concat($css-pfx, name(), '-c', $css-sfx)}">
        <xsl:if test="symbol">
          <div class="s-wcn-symbol">
            <xsl:apply-templates select="symbol"/>
          </div>
        </xsl:if>
        <xsl:next-match/>
      </div>
    </div>
  </div>
</xsl:template>

<xsl:template match="warning|caution">
  <xsl:apply-templates select="child::*[not(self::symbol)]"/>
</xsl:template>
    
<xsl:template match="warning|caution" mode="chg-del">
  <xsl:call-template name="delete"/>
</xsl:template>
    
<xsl:template match="warningAndCautionPara">
  <div>
    <xsl:call-template name="change">
      <xsl:with-param name="class" select="'s-para s-wc-para'"/>
    </xsl:call-template>
    <xsl:apply-templates/>
  </div>
</xsl:template>

<xsl:template match="warningAndCautionPara" mode="chg-del">
  <xsl:call-template name="delete-as-div">
    <xsl:with-param name="class" select="'s-para s-wc-para'"/>
  </xsl:call-template>
</xsl:template>
    
<xsl:template match="note" priority="20">
  <div class="{concat($css-pfx, name(), '-wrapper', $css-sfx)}">
    <div>
      <xsl:call-template name="setID"/>
      <xsl:call-template name="change">
        <xsl:with-param name="class" select="concat($css-pfx, name(), $css-sfx)"/>
      </xsl:call-template>
      <div   class="{concat($css-pfx, name(), $css-sfx)}">
        <div class="{concat($css-pfx, name(), '-label', $css-sfx)}">
          <xsl:value-of select="fn:getGenText('title-note')"/>
          <xsl:apply-templates select="." mode="numbering"/>
          <xsl:value-of select="fn:getGenText('sep1')"/>
        </div>
        <div class="{concat($css-pfx, name(), '-c', $css-sfx)}">
          <xsl:if test="symbol">
            <div class="s-wcn-symbol">
              <xsl:apply-templates select="symbol"/>
            </div>
          </xsl:if>
          <xsl:next-match/>
        </div>
      </div>
    </div>
  </div>
</xsl:template>

<xsl:template match="note">
  <xsl:apply-templates select="child::*[not(self::symbol)]"/>
</xsl:template>

<xsl:template match="note" mode="chg-del">
  <xsl:call-template name="delete"/>
</xsl:template>

<xsl:template match="notePara">
  <div>
    <xsl:call-template name="setID"/>
      <xsl:call-template name="change">
      <xsl:with-param name="class" select="'s-note-para'"/>
    </xsl:call-template>
    <xsl:apply-templates/>
  </div>
</xsl:template>

<xsl:template match="notePara" mode="chg-del">
  <xsl:call-template name="delete-as-div">
    <xsl:with-param name="class" select="'s-note-para'"/>
  </xsl:call-template>
</xsl:template>

</xsl:stylesheet>
<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:fn="http://www.pwc.ca"
    xmlns:xs="http://www.w3.org/2001/XMLSchema"
    xmlns:saxon="http://saxon.sf.net/"
    xmlns="http://www.w3.org/1999/xhtml"
    exclude-result-prefixes="xs fn saxon #default"
    version="2.0">
    
<xsl:template match="procedure">
  <div class="s-proced">
    <xsl:apply-templates/>
  </div>
</xsl:template>
    
<xsl:template match="mainProcedure" priority="10">
  <div>
    <xsl:call-template name="change">
      <xsl:with-param name="class" select="'s-mainproc'"/>
    </xsl:call-template>
    <h2><xsl:value-of select="fn:getGenText('procedure')"/></h2>
    <xsl:next-match/>
  </div>
</xsl:template>
    
<xsl:template match="mainProcedure">
  <div>
    <xsl:call-template name="setID"/>
    <xsl:apply-templates/>
  </div>
</xsl:template>
    
<xsl:template match="mainProcedure" mode="chg-del">
  <xsl:call-template name="delete-as-div"/>
</xsl:template>
    
<xsl:template match="proceduralStep" priority="20">
  <div>
    <xsl:call-template name="setID"/>
    <xsl:call-template name="change">
      <xsl:with-param name="class" select="'s-pStep'"/>
    </xsl:call-template>
    <xsl:apply-templates select="warning"/>
    <xsl:apply-templates select="caution"/>
    <xsl:apply-templates select="note"/>
    <div class="s-pStep-nb">
      <xsl:if test="ancestor::dmInclusion/@is-fm='false'">
        <xsl:apply-templates select="." mode="numbering"/>
      </xsl:if>
    </div>
    <div class="s-pStep-c">
      <xsl:next-match/>
    </div>    
  </div>
</xsl:template>
    
<xsl:template match="proceduralStep">
  <xsl:apply-templates select="./*[not(self::note or self::warning or self::caution)]"/>
</xsl:template>
    
<xsl:template match="proceduralStep" mode="chg-del">
  <xsl:call-template name="delete-as-div"/>
</xsl:template>

<xsl:template match="proceduralStep/title">
  <div class="s-pStep-title">
    <xsl:call-template name="brex-disabled-tooltip"/>
    <xsl:apply-templates/>
  </div>
</xsl:template>
    
<xsl:template match="proceduralStep/*[1][self::para]" priority="3">
  <div>
    <xsl:call-template name="setID"/>
    <xsl:call-template name="change">
      <xsl:with-param name="class" select="'s-para s-para-pStep-first'"/>
    </xsl:call-template>
    <xsl:apply-templates/>
  </div>
</xsl:template>

<xsl:template match="proceduralStep/*[1][self::para]" mode="chg-del" priority="3">
  <xsl:call-template name="delete-as-div">
    <xsl:with-param name="class" select="'s-para s-para-pStep-first'"/>
  </xsl:call-template>
</xsl:template>

</xsl:stylesheet>

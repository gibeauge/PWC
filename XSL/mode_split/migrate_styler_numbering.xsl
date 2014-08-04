<?xml version="1.0" encoding="UTF-8"?>

<xsl:stylesheet 
  xmlns:xsl="http://www.w3.org/1999/XSL/Transform" 
  xmlns="http://www.w3.org/1999/xhtml" 
  xmlns:_gte="http://www.arbortext.com/namespace/Styler/GeneratedTextElements" 
  xmlns:_sfe="http://www.arbortext.com/namespace/Styler/StylerFormattingElements" 
  xmlns:_ufe="http://www.arbortext.com/namespace/Styler/UserFormattingElements" 
  version="1.0" 
  exclude-result-prefixes="#default _ufe _sfe _gte">

<xsl:template match="frontmatter//module/pageblock-title" mode="styler_numbering" priority="2">
  <xsl:for-each select="..">
    <xsl:number count="module[pageblock-title]" level="single" format="1"/>
  </xsl:for-each>
</xsl:template>

<xsl:template match="pgblk/pageblock-title" mode="styler_numbering" priority="1">
  <xsl:number count="pgblk[pageblock-title]" level="any" format="1"/>
</xsl:template>

<xsl:template match="pageblock-title" mode="styler_numbering" priority="0">
  <!--This context has no numbering-->
  <xsl:param name="do-qmark" select="'yes'"/>
  <xsl:if test="$do-qmark='yes'">
     <xsl:value-of select="'?'"/>
  </xsl:if>
</xsl:template>

<xsl:template match="numlist/step" mode="styler_numbering" priority="3">
  <xsl:number count="step" level="single" format="(1)"/>
</xsl:template>

<xsl:template match="numlist/step2" mode="styler_numbering" priority="2">
  <xsl:number count="step2" level="single" format="(a)"/>
</xsl:template>

<xsl:template match="numlist/step3" mode="styler_numbering" priority="2">
  <xsl:number count="step3" level="single" format="1"/>
</xsl:template>

<xsl:template match="numlist/step4" mode="styler_numbering" priority="2">
  <xsl:number count="step4" level="single" format="a"/>
</xsl:template>
   
<xsl:template match="procedure//step" mode="styler_numbering" priority="2">
  <xsl:number count="step" level="single" format="(1)"/>
  <xsl:text> </xsl:text>
</xsl:template>

<xsl:template name="t-numbering-step">
  <xsl:number count="*[@_gte:count-as-id='cnt__^step.cnt']" from="step" level="any" format="(a)"/>
</xsl:template>

<xsl:template name="t-numbering-step2">
  <xsl:number count="*[@_gte:count-as-id='cnt__^step2.cnt']" from="step2" level="any" format="1"/>
</xsl:template>

<xsl:template name="t-numbering-step3-ext">
  <xsl:param name="fmt"/>
  <xsl:choose>
    <xsl:when test="ancestor::step3">
      <xsl:number count="*[@_gte:count-as-id='cnt__^step3.cnt']" from="step3[not(ancestor::step3)]" level="any" format="{$fmt}"/>
    </xsl:when>
    <xsl:otherwise>
      <xsl:number count="*[@_gte:count-as-id='cnt__^step3.cnt' and not(ancestor::step3)]" level="any" format="{$fmt}"/>
    </xsl:otherwise>
  </xsl:choose>
</xsl:template>

<xsl:template match="step2" mode="styler_numbering" priority="0">
  <xsl:call-template name="t-numbering-step"/>
</xsl:template>
 
<xsl:template match="step3" mode="styler_numbering" priority="0">
  <xsl:call-template name="t-numbering-step2"/>
</xsl:template>

<xsl:template match="step4" mode="styler_numbering" priority="0">
  <xsl:call-template name="t-numbering-step3-ext">
    <xsl:with-param name="fmt" select="'a'"/>
  </xsl:call-template>
</xsl:template>

<xsl:template match="step[table/@tabstyle='frac']" mode="styler_numbering" priority="1">
  <xsl:call-template name="t-numbering-step3-ext">
    <xsl:with-param name="fmt" select="'(1)'"/>
  </xsl:call-template>
</xsl:template>

<xsl:template match="step2[table/@tabstyle='frac']" mode="styler_numbering" priority="1">
  <xsl:call-template name="t-numbering-step3-ext">
    <xsl:with-param name="fmt" select="'(a)'"/>
  </xsl:call-template>
</xsl:template>

<xsl:template match="step3[table/@tabstyle='frac']" mode="styler_numbering" priority="1">
  <xsl:call-template name="t-numbering-step3-ext">
    <xsl:with-param name="fmt" select="'1'"/>
  </xsl:call-template>
</xsl:template>

<xsl:template match="step4[table/@tabstyle='frac']" mode="styler_numbering" priority="1">
  <xsl:call-template name="t-numbering-step3-ext">
    <xsl:with-param name="fmt" select="'a'"/>
  </xsl:call-template>
</xsl:template>

<xsl:template match="*" mode="styler_numbering">
  <xsl:param name="do-qmark" select="'yes'"/>
  <xsl:if test="$do-qmark='yes'">
     <xsl:value-of select="'?'"/>
  </xsl:if>
</xsl:template>

</xsl:stylesheet>
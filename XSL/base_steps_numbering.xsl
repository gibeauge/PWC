<?xml version="1.0" encoding="UTF-8"?>

<xsl:stylesheet 
  xmlns:xsl="http://www.w3.org/1999/XSL/Transform" 
  xmlns="http://www.w3.org/1999/xhtml" 
  xmlns:_gte="http://www.arbortext.com/namespace/Styler/GeneratedTextElements" 
  xmlns:_sfe="http://www.arbortext.com/namespace/Styler/StylerFormattingElements" 
  xmlns:_ufe="http://www.arbortext.com/namespace/Styler/UserFormattingElements" 
  version="1.0" 
  exclude-result-prefixes="#default _ufe _sfe _gte">

<!-- COUNT AS MODE : set labels for numbering -->

<xsl:template match="step[table/@tabstyle='frac']" mode="set-countas" priority="1">
  <xsl:copy>
     <xsl:attribute name="_gte:count-as-id">cnt__^step3.cnt</xsl:attribute>
     <xsl:apply-templates mode="set-countas" select="@*|node()"/>
  </xsl:copy>
</xsl:template>

<xsl:template match="step2[table/@tabstyle='frac']" mode="set-countas" priority="1">
  <xsl:copy>
     <xsl:attribute name="_gte:count-as-id">cnt__^step3.cnt</xsl:attribute>
     <xsl:apply-templates mode="set-countas" select="@*|node()"/>
  </xsl:copy>
</xsl:template>

<xsl:template match="step3[table/@tabstyle='frac']" mode="set-countas" priority="1">
  <xsl:copy>
     <xsl:attribute name="_gte:count-as-id">cnt__^step3.cnt</xsl:attribute>
     <xsl:apply-templates mode="set-countas" select="@*|node()"/>
  </xsl:copy>
</xsl:template>

<xsl:template match="step4[table/@tabstyle='frac']" mode="set-countas" priority="1">
  <xsl:copy>
     <xsl:attribute name="_gte:count-as-id">cnt__^step3.cnt</xsl:attribute>
     <xsl:apply-templates mode="set-countas" select="@*|node()"/>
  </xsl:copy>
</xsl:template>

<!-- NUMBERING MODE : calculate numbering -->

<xsl:template match="numlist/step" mode="s_numbering" priority="3">
  <xsl:number count="step" level="single" format="(1)"/>
</xsl:template>

<xsl:template match="numlist/step2" mode="s_numbering" priority="2">
  <xsl:number count="step2" level="single" format="(a)"/>
</xsl:template>

<xsl:template match="numlist/step3" mode="s_numbering" priority="2">
  <xsl:number count="step3" level="single" format="1"/>
</xsl:template>

<xsl:template match="numlist/step4" mode="s_numbering" priority="2">
  <xsl:number count="step4" level="single" format="a"/>
</xsl:template>

<xsl:template match="procedure//step" mode="s_numbering" priority="2">
  <xsl:number count="step" level="single" format="(1)"/>
  <xsl:text> </xsl:text>
</xsl:template>

<xsl:template match="step[table/@tabstyle='frac']" mode="s_numbering" priority="1">
  <xsl:call-template name="t-numbering-step3-ext">
    <xsl:with-param name="fmt" select="'(1)'"/>
  </xsl:call-template>
</xsl:template>

<xsl:template match="step2[table/@tabstyle='frac']" mode="s_numbering" priority="1">
  <xsl:call-template name="t-numbering-step3-ext">
    <xsl:with-param name="fmt" select="'(a)'"/>
  </xsl:call-template>
</xsl:template>

<xsl:template match="step3[table/@tabstyle='frac']" mode="s_numbering" priority="1">
  <xsl:call-template name="t-numbering-step3-ext">
    <xsl:with-param name="fmt" select="'1'"/>
  </xsl:call-template>
</xsl:template>

<xsl:template match="step4[table/@tabstyle='frac']" mode="s_numbering" priority="1">
  <xsl:call-template name="t-numbering-step3-ext">
    <xsl:with-param name="fmt" select="'a'"/>
  </xsl:call-template>
</xsl:template>

</xsl:stylesheet>
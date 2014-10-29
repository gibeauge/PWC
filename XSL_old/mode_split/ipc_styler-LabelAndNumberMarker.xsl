<?xml version="1.0" encoding="UTF-8"?>

<xsl:stylesheet 
  xmlns:xsl="http://www.w3.org/1999/XSL/Transform" 
  xmlns="http://www.w3.org/1999/xhtml" 
  xmlns:_gte="http://www.arbortext.com/namespace/Styler/GeneratedTextElements" 
  xmlns:_sfe="http://www.arbortext.com/namespace/Styler/StylerFormattingElements" 
  xmlns:_ufe="http://www.arbortext.com/namespace/Styler/UserFormattingElements" 
  version="1.0" 
  exclude-result-prefixes="#default _ufe _sfe _gte">

<xsl:template name="t-styler-numbering-note">
  <xsl:if test="(following-sibling::note) or (preceding-sibling::note)">
    <xsl:call-template name="t-styler-numbering"/>
  </xsl:if>
</xsl:template>

<xsl:template match="n-para/note" mode="styler-LabelAndNumberMarker" priority="8">
  <xsl:call-template name="t-styler-numbering-note"/>
</xsl:template>

<xsl:template match="procedure/note" mode="styler-LabelAndNumberMarker" priority="7">
  <xsl:call-template name="t-styler-numbering-note"/>
</xsl:template>

<xsl:template match="note[parent::subpara]" mode="styler-LabelAndNumberMarker" priority="1">
  <xsl:call-template name="t-styler-numbering-note"/>
</xsl:template>

<xsl:template match="note" mode="styler-LabelAndNumberMarker" priority="0">
  <xsl:call-template name="t-styler-numbering-note"/>
</xsl:template>

<xsl:template match="numlist/step" mode="styler-LabelAndNumberMarker" priority="3">
  <xsl:call-template name="t-styler-numbering"/>
</xsl:template>

<xsl:template match="procedure//step" mode="styler-LabelAndNumberMarker" priority="2">
  <xsl:call-template name="t-styler-numbering"/>
</xsl:template>

<xsl:template match="step[table/@tabstyle='frac']" mode="styler-LabelAndNumberMarker" priority="1">
  <xsl:call-template name="t-styler-numbering"/>
</xsl:template>

<xsl:template match="step2" mode="styler-LabelAndNumberMarker" priority="0">
  <xsl:call-template name="t-styler-numbering"/>
</xsl:template>

<xsl:template match="step3" mode="styler-LabelAndNumberMarker" priority="0">
  <xsl:call-template name="t-styler-numbering"/>
</xsl:template>

<xsl:template match="step4" mode="styler-LabelAndNumberMarker" priority="0">
  <xsl:call-template name="t-styler-numbering"/>
</xsl:template>

<xsl:template match="*" mode="styler-LabelAndNumberMarker"/>

</xsl:stylesheet>
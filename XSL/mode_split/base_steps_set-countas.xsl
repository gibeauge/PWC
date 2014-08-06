<?xml version="1.0" encoding="UTF-8"?>

<xsl:stylesheet 
  xmlns:xsl="http://www.w3.org/1999/XSL/Transform" 
  xmlns="http://www.w3.org/1999/xhtml" 
  xmlns:_gte="http://www.arbortext.com/namespace/Styler/GeneratedTextElements" 
  xmlns:_sfe="http://www.arbortext.com/namespace/Styler/StylerFormattingElements" 
  xmlns:_ufe="http://www.arbortext.com/namespace/Styler/UserFormattingElements" 
  version="1.0" 
  exclude-result-prefixes="#default _ufe _sfe _gte">

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

</xsl:stylesheet>
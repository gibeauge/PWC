<?xml version="1.0" encoding="UTF-8"?>

<xsl:stylesheet 
  xmlns:xsl="http://www.w3.org/1999/XSL/Transform" 
  xmlns="http://www.w3.org/1999/xhtml" 
  xmlns:_gte="http://www.arbortext.com/namespace/Styler/GeneratedTextElements" 
  xmlns:_sfe="http://www.arbortext.com/namespace/Styler/StylerFormattingElements" 
  xmlns:_ufe="http://www.arbortext.com/namespace/Styler/UserFormattingElements" 
  version="1.0" 
  exclude-result-prefixes="#default _ufe _sfe _gte">

<xsl:template name="t-countas-note">
  <xsl:copy>
     <xsl:if test="(following-sibling::note) or (preceding-sibling::note)">
        <xsl:attribute name="_gte:count-as-id">cnt__note.xcnt</xsl:attribute>
     </xsl:if>
     <xsl:apply-templates select="@*|node()" mode="set-countas"/>
  </xsl:copy>
</xsl:template>

<xsl:template match="n-para/note" mode="set-countas" priority="8">
  <xsl:call-template name="t-countas-note"/>
</xsl:template>

<xsl:template match="procedure/note" mode="set-countas" priority="7">
  <xsl:call-template name="t-countas-note"/>
</xsl:template>

<xsl:template match="fandc/note|spec-assem/note|spring-pressure/note|
                     torque-and-stretch/note|fits-and-clears/note" mode="set-countas" priority="6">
  <xsl:copy>
     <xsl:apply-templates select="@*|node()" mode="set-countas"/>
  </xsl:copy>
</xsl:template>

<xsl:template match="subpara/note" mode="set-countas" priority="1">
  <xsl:call-template name="t-countas-note"/>
</xsl:template>

<xsl:template match="note" mode="set-countas" priority="0">
  <xsl:call-template name="t-countas-note"/>
</xsl:template>

</xsl:stylesheet>
<?xml version="1.0" encoding="UTF-8"?>

<xsl:stylesheet 
  xmlns:xsl="http://www.w3.org/1999/XSL/Transform" 
  xmlns="http://www.w3.org/1999/xhtml" 
  xmlns:_gte="http://www.arbortext.com/namespace/Styler/GeneratedTextElements" 
  xmlns:_sfe="http://www.arbortext.com/namespace/Styler/StylerFormattingElements" 
  xmlns:_ufe="http://www.arbortext.com/namespace/Styler/UserFormattingElements" 
  version="1.0" 
  exclude-result-prefixes="#default _ufe _sfe _gte">

<xsl:template name="t-numbering-note">
  <xsl:if test="(following-sibling::note) or (preceding-sibling::note)">
    <xsl:number count="*[@_gte:count-as-id='cnt__note.xcnt']" level="single" format="1."/>
  </xsl:if>
</xsl:template>

<xsl:template match="n-para/note" mode="styler_numbering" priority="8">
  <xsl:call-template name="t-numbering-note"/>
</xsl:template>

<xsl:template match="procedure/note" mode="styler_numbering" priority="7">
  <xsl:call-template name="t-numbering-note"/>
</xsl:template>

<xsl:template match="note[parent::subpara]" mode="styler_numbering" priority="1">
  <xsl:call-template name="t-numbering-note"/>
</xsl:template>

<xsl:template match="note" mode="styler_numbering" priority="0">
  <xsl:call-template name="t-numbering-note"/>
</xsl:template>

</xsl:stylesheet>
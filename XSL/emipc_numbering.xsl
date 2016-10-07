<?xml version="1.0" encoding="UTF-8"?>

<xsl:stylesheet 
  xmlns:xsl="http://www.w3.org/1999/XSL/Transform" 
  xmlns="http://www.w3.org/1999/xhtml" 
  xmlns:_gte="http://www.arbortext.com/namespace/Styler/GeneratedTextElements" 
  xmlns:_sfe="http://www.arbortext.com/namespace/Styler/StylerFormattingElements" 
  xmlns:_ufe="http://www.arbortext.com/namespace/Styler/UserFormattingElements" 
  version="1.0" 
  exclude-result-prefixes="#default _ufe _sfe _gte">

<xsl:template match="pwc-title|pwcepc-apu-title" mode="s_numbering" priority="0">
  <xsl:param name="do-qmark" select="'yes'"/>
  <xsl:if test="$do-qmark='yes'">
     <xsl:value-of select="'?'"/>
  </xsl:if>
</xsl:template>

</xsl:stylesheet>
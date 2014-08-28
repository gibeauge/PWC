<?xml version='1.0'?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
                version='1.0'>

<xsl:import href="common.xsl"/>

<xsl:param name="bgcolor-attrname" select="'bgcolor'"/>

<xsl:param name="default-thead-valign" select="'bottom'"/>
<xsl:param name="thead.tfoot.style">font-weight: bold; </xsl:param>

<xsl:param name="obey-col_and_row-sep" select="'1'"/>

<xsl:param name="html.table.border.thickness" select="'1px'"/>
<xsl:param name="table.border.thickness" select="'1.0pt'"/>

<xsl:param name="table.border.hidden.style" select="'hidden'"/>

<xsl:param name="emit-black-border-color" select="'yes'"/>

<xsl:param name="proportional-colwidth-supported" select="'no'"/>

<xsl:param name="special-docbook-table-footnote-handling" select="'no'"/>

<xsl:param name="inhibit-default-colwidth-emission" select="'0'"/>

<xsl:variable name="table.border.thickness.in.pixels">
  <xsl:variable name="temp">
    <xsl:call-template name="length-to-pixels">
      <xsl:with-param name="dimen" select="$table.border.thickness"/>
    </xsl:call-template>
  </xsl:variable>
  <xsl:choose>
    <xsl:when test="$temp='100%'">
      <!-- Shouldn't happen, but means the value was invalid -->
      <xsl:value-of select="'1'"/>
    </xsl:when>
    <xsl:otherwise>
      <xsl:value-of select="$temp"/>
    </xsl:otherwise>
  </xsl:choose>
</xsl:variable>

<xsl:variable name="table.border.thickness.is.significant"
         select="not($table.border.thickness.in.pixels &lt; 2)"/>

<xsl:variable name="fg2bg_colorizer">
  <xsl:text> bgreen=#c0ffc0; gray3=#d0d0d0; green=#c0ffc0;</xsl:text>
  <xsl:text> lime=#e0ffe0; bviolet=#ffc0ff; gray4=#c0c0c0;</xsl:text>
  <xsl:text> maroon=#c08080; navy=#a0a0c0; bred=#ffc0cb;</xsl:text>
  <xsl:text> borange=#ffc097; gray5=#b0b0b0; olive=#cccc00;</xsl:text>
  <xsl:text> red=#ffc0cb; byellow=#ffffc0; bwhite=#ffffff;</xsl:text>
  <xsl:text> bbrown=#deb887; bblack=#808080; black=#808080;</xsl:text>
  <xsl:text> brown=#deb887; teal=#00e0e0; violet=#ffc0ff;</xsl:text>
  <xsl:text> white=#ffffff; bblue=#c0c0ff; blue=#c0c0ff;</xsl:text>
  <xsl:text> orange=#ffc097; aqua=#d0ffff; gray1=#f0f0f0;</xsl:text>
  <xsl:text> bgray=#d0d0d0; gray2=#e0e0e0; gray=#d0d0d0; yellow=#ffffc0;</xsl:text>
</xsl:variable>
<xsl:variable name="fg_colorizer">
  <xsl:text> lime=#00ff00; green=#008000; gray3=#c0c0c0;</xsl:text>
  <xsl:text> navy=#000080; maroon=#800000; gray4=#b0b0b0;</xsl:text>
  <xsl:text> red=#ff0000; olive=#808000; gray5=#808080;</xsl:text>
  <xsl:text> white=#ffffff; violet=#ff00ff; teal=#008080;</xsl:text>
  <xsl:text> brown=#804000; black=#000000; orange=#ff8000;</xsl:text>
  <xsl:text> blue=#0000ff; gray1=#e0e0e0; aqua=#00ffff;</xsl:text>
  <xsl:text> yellow=#ffff00; gray=#c0c0c0; gray2=#d0d0d0;</xsl:text>
</xsl:variable>

</xsl:stylesheet>

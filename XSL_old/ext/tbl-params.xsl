<?xml version='1.0'?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
                version='1.0'>

<xsl:import href="common.xsl"/>


<xsl:param name="thead.tfoot.style">font-weight: bold; </xsl:param>

<xsl:param name="obey-col_and_row-sep" select="'1'"/>

<xsl:param name="table.border.thickness" select="'0.5pt'"/>

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

</xsl:stylesheet>

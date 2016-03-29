<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:fn="http://www.pwc.ca"
    xmlns:xs="http://www.w3.org/2001/XMLSchema"
    xmlns="http://www.w3.org/1999/xhtml"
    exclude-result-prefixes="xs fn #default"
    version="2.0">

<xsl:template match="levelledPara" mode="numbering">
  <xsl:number from="dmodule" count="levelledPara[title]"  level="multiple" format="1.1.1.1.1"/>
</xsl:template>

<xsl:template match="figure" mode="numbering">
  <xsl:number from="dmodule" count="figure" level="any" format="1"/>
</xsl:template>

<xsl:template match="graphic" mode="numbering">
  <xsl:number from="figure" count="graphic" level="single" format="1"/>
</xsl:template>

<!-- not used -->
<xsl:template match="preliminaryRqmts/*|closeRqmts/*" mode="numbering">
  <xsl:call-template name="table-numbering"/>
</xsl:template>

<xsl:template match="table[title]" mode="numbering">
  <!--xsl:call-template name="table-numbering"/-->
  <xsl:number from="dmodule" count="table[title]" level="any" format="1"/>
</xsl:template>

<!-- not used -->
<xsl:template name="table-numbering">
  <xsl:variable name="dmodule-id" select="generate-id(ancestor::dmodule)"/>
  <xsl:variable name="start" select="if (ancestor::dmInclusion/@is-fm='false') then 1 else 0"/>
  <xsl:variable name="count"><xsl:number from="dmodule" count="preliminaryRqmts/*[not(name()='reqSafety')]|closeRqmts/*|table[title]" level="any"/></xsl:variable>
  <xsl:variable name="del-reqpersons" select="if (preceding::reqPersons[generate-id(ancestor::dmodule)=$dmodule-id]) then count(preceding::reqPersons[preceding-sibling::reqPersons][generate-id(ancestor::dmodule)=$dmodule-id]) else 0"/>
  <xsl:number value="$start + $count - $del-reqpersons"/>
</xsl:template>

<xsl:template match="proceduralStep" mode="numbering">
  <xsl:number from="dmodule" count="proceduralStep" level="multiple" format="1.1.1.1.1"/>
</xsl:template>

<xsl:template match="note" mode="numbering">
  <xsl:choose>
    <xsl:when test="not(preceding-sibling::*[1][self::note]) and following-sibling::*[1][self::note]">
      <xsl:text>&#160;1</xsl:text>
    </xsl:when>
    <xsl:when test="preceding-sibling::*[1][self::note]">
      <xsl:text>&#160;</xsl:text>
      <xsl:value-of select="count(preceding-sibling::note) - count(preceding-sibling::*[not(self::note)][1]/preceding-sibling::note) + 1"/>
    </xsl:when>
  </xsl:choose>
</xsl:template>

<xsl:template match="hotspot" mode="numbering">
  <xsl:number count="hotspot" level="single" format="1"/>
</xsl:template>

<xsl:template match="footnote" mode="numbering">
  <xsl:number from="table" count="footnote" level="any" format="1"/>
</xsl:template>

</xsl:stylesheet>
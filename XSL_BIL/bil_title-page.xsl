<?xml version="1.0" encoding="UTF-8"?>

<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
                version="2.0">

<xsl:output method="xml"/>

<xsl:variable name="lang-orig"   select="if (/*/@lang) then upper-case(/*/@lang) else 'EN'"/>
<xsl:variable name="texts"       select="document('bil_texts.xml')//texts[@language=$lang-orig]"/>

<xsl:template match="/">
  <xsl:apply-templates/>
</xsl:template>

<xsl:template match="@*|node()">
  <xsl:copy>
    <xsl:apply-templates select="@*|node()"/>
  </xsl:copy>
</xsl:template>

<xsl:template match="div[contains(@class,'pwc-cgp-stmnt')]">
  <div class="{@class}">
    <xsl:value-of select="$texts//text[@name='bil_statement']"/>
  </div>
  <xsl:copy>
    <xsl:apply-templates select="@*|node()"/>
  </xsl:copy>
</xsl:template>

</xsl:stylesheet>

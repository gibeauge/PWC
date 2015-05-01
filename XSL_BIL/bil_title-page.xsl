<?xml version="1.0" encoding="UTF-8"?>

<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
                version="2.0">

<xsl:output method="xml"/>

<xsl:variable name="lang-orig"   select="if (/*/@lang) then upper-case(/*/@lang) else 'EN'"/>
<xsl:variable name="texts"       select="document('bil_texts.xml')//texts[@language=$lang-orig]"/>

<!--
<xsl:template match="/">
  <xsl:apply-templates/>
</xsl:template>
-->

<xsl:template match="@*|node()">
  <xsl:copy>
    <xsl:apply-templates select="@*|node()"/>
  </xsl:copy>
</xsl:template>

<xsl:template match="/">
  <html lang="{$lang-orig}">
    <xsl:copy-of select="/*/head"/>
    <body>
      <div>
      <xsl:copy-of select="/*/body/@*"/>
      <xsl:apply-templates select="/*/body/node()"/>
      </div>
      <xsl:copy-of select="/*/body//script"/>
    </body>
  </html>
</xsl:template>

<xsl:template match="div[contains(@class,'pwc-cgp-stmnt')]">
  <div class="{@class}">
    <xsl:value-of select="$texts//text[@name='bil_statement_1']"/>
    <xsl:value-of select="concat(upper-case(//div[@id='ModelNo']), '. ')"/>
    <xsl:value-of select="$texts//text[@name='bil_statement_2']"/>
  </div>
  <xsl:copy>
    <xsl:apply-templates select="@*|node()"/>
  </xsl:copy>
</xsl:template>

</xsl:stylesheet>

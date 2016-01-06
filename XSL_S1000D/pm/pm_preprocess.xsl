<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:fn="http://www.pwc.ca"
    xmlns:xs="http://www.w3.org/2001/XMLSchema"
    xmlns:saxon="http://saxon.sf.net/"
    exclude-result-prefixes="xs fn saxon"
    xmlns:random="http://exslt.org/random"
    extension-element-prefixes="random"
    version="2.0">

<xsl:output encoding="UTF-8" method="xml" indent="no"/>
    
<!-- ************************************************************** -->
<!-- INCLUDES -->

<xsl:include href="../common/utils.xsl"/>

<!-- ************************************************************** -->
<!-- PARAMETERS -->

<xsl:variable name="base-uri">
  <xsl:for-each select="/pm">
    <xsl:choose>
      <xsl:when test="document-uri(/)!=''">
        <xsl:value-of select="concat(document-uri(/), '/../')"/>
      </xsl:when>
      <xsl:otherwise>
        <xsl:value-of select="concat(saxon:system-id(), '/../')"/>
      </xsl:otherwise>
    </xsl:choose>
  </xsl:for-each>
</xsl:variable>

<!-- ************************************************************** -->
<!-- VARIABLES -->

<xsl:variable name="g_langSrc"    select="lower-case(/pm/identAndStatusSection/pmAddress/pmIdent/language/@languageIsoCode)" />
<xsl:variable name="g_lang"       select="if ($g_langSrc='sx') then 'en' else $g_langSrc"/>
<xsl:variable name="g_year"       select="/pm/identAndStatusSection/pmAddress/pmAddressItems/issueDate/@year"/>
<xsl:variable name="g_month"      select="/pm/identAndStatusSection/pmAddress/pmAddressItems/issueDate/@month"/>
<xsl:variable name="g_day"        select="/pm/identAndStatusSection/pmAddress/pmAddressItems/issueDate/@day"/>
<xsl:variable name="g_pmc"        select="fn:getPMC(/pm/identAndStatusSection/pmAddress/pmIdent/pmCode)"/>
     
<!-- ************************************************************** -->
<!-- *** PM PROCESSING *** -->

<xsl:template match="/">
  <xsl:apply-templates/>
</xsl:template>

<!--
<xsl:template match="pm">
  <pm><xsl:apply-templates/></pm>
</xsl:template>
-->

<xsl:template match="pmEntry/dmRef" priority="15">
  <xsl:if test="dmRefIdent/dmCode">
    <xsl:next-match/>
  </xsl:if>
</xsl:template>
    
<xsl:template match="pmEntry/dmRef" priority="10">
  <xsl:variable name="dmc"        select="fn:getDMC(dmRefIdent/dmCode)"/>
  <xsl:variable name="source"     select="concat($base-uri, $dmc, '.xml')"/>
  <xsl:if test="unparsed-text-available($source)">
    <xsl:variable name="doc"      select="document($source)"/>
    <xsl:variable name="infocode" select="$doc/dmodule/identAndStatusSection/dmAddress/dmIdent/dmCode/@infoCode"/>
    <xsl:variable name="is-tp"    select="contains('001', $infocode)"/>
    <xsl:variable name="is-fm"    select="contains('001,002,003,004,005,006,007,008,009,012,022,00A,00B,00C,00D,00E,00F,00G,00H,00J,00K,00L,00M,00N,00P,00Q,00R,00S,00T,00U,00W,00X,00Y,00Z,0A1', $infocode)"/>
    
    <dmInclusion ref="{$dmc}" file="{if ($is-tp) then 'title-page' else $dmc}" inc="{$infocode}" is-tp="{$is-tp}" is-fm="{$is-fm}">
      <!--dmIds><xsl:for-each select="$doc//@id"><id><xsl:value-of select="."/></id></xsl:for-each></dmIds-->
      <xsl:apply-templates select="$doc/*"/>
    </dmInclusion>
  </xsl:if>
</xsl:template>

<!-- ************************************************************** -->
<!-- *** DM PROCESSING *** -->
        
<xsl:template match="@*|node()">
  <xsl:copy>
    <xsl:apply-templates select="@*|node()"/>
  </xsl:copy>
</xsl:template>

<xsl:template match="issueDate[parent::dmAddressItems/parent::dmAddress/dmIdent/issueInfo/@issueNumber='000']">
  <issueDate day="{$g_day}" month="{$g_month}" year="{$g_year}" />
</xsl:template>

<xsl:template match="@infoEntityIdent">
  <xsl:copy-of select="."/>
  <xsl:attribute name="entityPath"><xsl:value-of select="tokenize(unparsed-entity-uri(.), '/')[last()]"/></xsl:attribute>
</xsl:template>

</xsl:stylesheet>

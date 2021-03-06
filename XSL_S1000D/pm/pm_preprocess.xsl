<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:fn="http://www.pwc.ca"
    xmlns:xs="http://www.w3.org/2001/XMLSchema"
    xmlns:saxon="http://saxon.sf.net/"
    xmlns:exslt="http://exslt.org/common"
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

<xsl:param name="applic" select="'GAC-OEM=no'"/>

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

<xsl:variable name="g_statusDM"   select="document(concat($base-uri, 'StatusReport.xml'))"/>

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
  <!--xsl:variable name="dmc-short"  select="substring-after($dmc,'DMC-')"/-->
  
  <xsl:variable name="source"     select="concat($base-uri, $dmc, '.xml')"/>
  <xsl:if test="unparsed-text-available($source)">
    <xsl:variable name="doc"      select="document($source)"/>
    <xsl:variable name="infocode" select="$doc/dmodule/identAndStatusSection/dmAddress/dmIdent/dmCode/@infoCode"/>
    <xsl:variable name="is-tp"    select="contains('001', $infocode)"/>
    <xsl:variable name="is-fm"    select="contains('001,002,003,004,005,006,007,008,009,012,022,00A,00B,00C,00D,00E,00F,00G,00H,00J,00K,00L,00M,00N,00P,00Q,00R,00S,00T,00U,00W,00X,00Y,00Z,0A1', $infocode)"/>
    <xsl:variable name="isstype"  select="if ($g_statusDM//dm[@dmc=$dmc]) then $g_statusDM//dm[@dmc=$dmc]/@issueType else 'NA'"/>
    
    <dmInclusion ref="{$dmc}" file="{if ($is-tp) then 'title-page' else $dmc}" inc="{$infocode}" is-tp="{$is-tp}" is-fm="{$is-fm}" isstype="{$isstype}">
      <xsl:if test="dmRefAddressItems/dmTitle">
        <tocTitle><xsl:copy-of select="dmRefAddressItems/dmTitle"/></tocTitle>
      </xsl:if>
      <xsl:choose>
        <xsl:when test="$doc//identAndStatusSection/dmStatus/referencedApplicGroup">
          <xsl:variable name="dm-tree">
            <tmpTree>
              <xsl:apply-templates select="$doc/*" mode="set-applic-valid"/>
              <xsl:apply-templates select="$doc/*"/>
            </tmpTree>
          </xsl:variable>
          <xsl:apply-templates select="exslt:node-set($dm-tree)/*" mode="filtering"/>
        </xsl:when>
        <xsl:otherwise>
      <xsl:apply-templates select="$doc/*"/>
        </xsl:otherwise>
      </xsl:choose>
    </dmInclusion>
  </xsl:if>
</xsl:template>

<!-- ************************************************************** -->
<!-- *** DM PROCESSING (filtering) *** -->

<xsl:variable name="g_applic-ident" select="tokenize($applic,'=')[1]"/>
<xsl:variable name="g_applic-value" select="tokenize($applic,'=')[2]"/>
<xsl:variable name="g_applic-sep" select="'||'"/>

<xsl:template match="dmodule" mode="set-applic-valid">
  <xsl:variable name="applic-group" select=".//identAndStatusSection/dmStatus/referencedApplicGroup"/>
  <applicValidIds>
    <xsl:for-each select="$applic-group/applic[assert[@applicPropertyIdent=$g_applic-ident and @applicPropertyValues=$g_applic-value]]">
      <xsl:value-of select="@id"/>
        <xsl:value-of select="$g_applic-sep"/>
    </xsl:for-each>
  </applicValidIds>
  <applicOtherValidIds>
    <xsl:for-each select="$applic-group/applic[assert[@applicPropertyIdent!=$g_applic-ident]]">
      <xsl:value-of select="@id"/>
      <xsl:value-of select="$g_applic-sep"/>
    </xsl:for-each>
  </applicOtherValidIds>
</xsl:template>

<xsl:template match="tmpTree" mode="filtering">
  <xsl:apply-templates mode="filtering"/>
</xsl:template>

<xsl:template match="applicValidIds|applicOtherValidIds" mode="filtering"/>

<xsl:template match="identAndStatusSection/dmStatus/referencedApplicGroup" mode="filtering">
  <xsl:if test="count(applic) != count(applic[assert[@applicPropertyIdent=$g_applic-ident]])">
    <xsl:copy>
      <xsl:apply-templates select="node()[not(self::applic[assert[@applicPropertyIdent=$g_applic-ident]])]|@*" mode="filtering"/>
    </xsl:copy>
  </xsl:if>
</xsl:template>

<xsl:template match="content//*[@applicRefId]" mode="filtering" priority="10">
  <xsl:choose>
    <xsl:when test="contains(ancestor::tmpTree/applicValidIds, concat(@applicRefId, $g_applic-sep))">
      <xsl:copy>
        <xsl:apply-templates select="node()|@*[not(name()='applicRefId')]" mode="filtering"/>
      </xsl:copy>
    </xsl:when>
    <xsl:when test="contains(ancestor::tmpTree/applicOtherValidIds, concat(@applicRefId, $g_applic-sep))">
    <xsl:copy>
        <xsl:apply-templates select="node()|@*" mode="filtering"/>
    </xsl:copy>
    </xsl:when>
  </xsl:choose>
</xsl:template>

<xsl:template match="@*|node()" mode="filtering">
  <xsl:copy>
    <xsl:apply-templates select="@*|node()" mode="filtering"/>
  </xsl:copy>
</xsl:template>

<!-- ************************************************************** -->
<!-- *** DM PROCESSING *** -->

<xsl:template match="text()" priority="2"><xsl:value-of select="replace(.,'&#xa;',' ')"/></xsl:template>

<xsl:template match="@*|node()">
  <xsl:copy>
    <xsl:apply-templates select="@*|node()"/>
  </xsl:copy>
</xsl:template>

<!--
<xsl:template match="issueDate[parent::dmAddressItems/parent::dmAddress/dmIdent/issueInfo/@issueNumber='000']">
  <issueDate day="{$g_day}" month="{$g_month}" year="{$g_year}" />
</xsl:template>
-->

<xsl:template match="@infoEntityIdent">
  <xsl:copy-of select="."/>
  <xsl:variable name="entity-name">
    <xsl:choose>
      <xsl:when test="ends-with(.,'.cgm')">
        <xsl:value-of select="substring-before(.,'.cgm')"/>
      </xsl:when>
      <xsl:when test="ends-with(.,'CGM')">
        <xsl:value-of select="substring-before(.,'.CGM')"/>
      </xsl:when>
      <xsl:otherwise>
        <xsl:value-of select="."/>
      </xsl:otherwise>
    </xsl:choose>
  </xsl:variable>
  <xsl:variable name="entity-path-res" select="tokenize(unparsed-entity-uri($entity-name), '/')[last()]"/>
  <xsl:variable name="entity-path">
    <xsl:choose>
      <xsl:when test="ends-with($entity-path-res,'.cgm')">
        <xsl:value-of select="concat(substring-before($entity-path-res,'.cgm'), '.png')"/>
      </xsl:when>
      <xsl:when test="ends-with($entity-path-res,'CGM')">
        <xsl:value-of select="concat(substring-before($entity-path-res,'.CGM'), '.PNG')"/>
      </xsl:when>
      <xsl:otherwise>
        <xsl:value-of select="$entity-path-res"/>
      </xsl:otherwise>
    </xsl:choose>
  </xsl:variable>
  <xsl:attribute name="entityPath"><xsl:value-of select="$entity-path"/></xsl:attribute>
</xsl:template>

</xsl:stylesheet>

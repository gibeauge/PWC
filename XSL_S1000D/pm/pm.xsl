<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:fn="http://www.pwc.ca"
    xmlns:xs="http://www.w3.org/2001/XMLSchema"
    xmlns:saxon="http://saxon.sf.net/"
    exclude-result-prefixes="xs fn saxon"
    xmlns:random="http://exslt.org/random"
    extension-element-prefixes="random"
    version="2.0">

<!-- ************************************************************** -->
<!-- INCLUDES -->

<xsl:include href="../dm/dm.xsl"/>

<!-- ************************************************************** -->
<!-- PARAMETERS -->

<xsl:param name="graphics-path" select="'graphics'"/>
<xsl:param name="images-path"   select="'images'"/>
<xsl:param name="css-path"      select="'css'"/>
<xsl:param name="js-path"       select="'javascript'"/>

<xsl:param name="output-dir"    select="'file:///C:/Work/Projets/PWC/chunks/'"/>

<xsl:param name="ddn-name"      select="'DDN-PW800-00198-00198-2015-00001.xml'"/>

<xsl:variable name="output-dir-pm" select="concat($output-dir, fn:getPMC(/pm/identAndStatusSection/pmAddress/pmIdent/pmCode))"/>
<!--xsl:variable name="output-dir-pm" select="$output-dir"/-->

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

<xsl:variable name="g_langSrc"   select="lower-case(/pm/identAndStatusSection/pmAddress/pmIdent/language/@languageIsoCode)" />
<xsl:variable name="g_lang"       select="if ($g_langSrc='sx') then 'en' else $g_langSrc"/>
<xsl:variable name="g_country"    select="lower-case(/pm/identAndStatusSection/pmAddress/pmIdent/language/@countryIsoCode)" />
<xsl:variable name="g_mi"         select="/pm/identAndStatusSection/pmAddress/pmIdent/pmCode/@modelIdentCode"/>
<xsl:variable name="g_issuer"     select="/pm/identAndStatusSection/pmAddress/pmIdent/pmCode/@pmIssuer"/>
<xsl:variable name="g_pm_num"     select="/pm/identAndStatusSection/pmAddress/pmIdent/pmCode/@pmNumber"/>
<xsl:variable name="g_pm_vol"     select="/pm/identAndStatusSection/pmAddress/pmIdent/pmCode/@pmVolume"/>
<xsl:variable name="g_issue"      select="/pm/identAndStatusSection/pmAddress/pmIdent/issueInfo/@issueNumber"/>
<xsl:variable name="g_inwork"     select="/pm/identAndStatusSection/pmAddress/pmIdent/issueInfo/@inWork"/>
<xsl:variable name="g_issue_type" select="/pm/identAndStatusSection/pmStatus/@issueType"/>
<xsl:variable name="g_year"       select="/pm/identAndStatusSection/pmAddress/pmAddressItems/issueDate/@year"/>
<xsl:variable name="g_month"      select="/pm/identAndStatusSection/pmAddress/pmAddressItems/issueDate/@month"/>
<xsl:variable name="g_day"        select="/pm/identAndStatusSection/pmAddress/pmAddressItems/issueDate/@day"/>
<xsl:variable name="g_issue_date" select="concat($g_year,$g_month,$g_day)"/>
<xsl:variable name="g_cageCode"   select="/pm/identAndStatusSection/pmStatus/responsiblePartnerCompany/@enterpriseCode"/>
<xsl:variable name="g_security"   select="/pm/identAndStatusSection/pmStatus/security/@securityClassification"/>
<xsl:variable name="g_pmc"        select="fn:getPMC(/pm/identAndStatusSection/pmAddress/pmIdent/pmCode)"/>

<xsl:variable name="quot">'</xsl:variable>

<!-- eReader CSS naming dependencies? -->
<xsl:variable name="css-pfx"      select="'x-'"/>
<xsl:variable name="css-sfx"      select="'-sd'"/>

<!-- ************************************************************** -->
<!-- KEYS -->

<xsl:key name="ids" match="dmInclusion//*[@id]" use="concat(ancestor::dmInclusion/@ref,'-',@id)"/>
<xsl:key name="dms" match="dmInclusion" use="@ref"/>

<!-- ************************************************************** -->
<!-- *** PM PROCESSING *** -->

<xsl:template match="/">
  <!-- create TOC -->
  <xsl:variable name="toc">
    <xsl:apply-templates mode="toc"/>
  </xsl:variable>
  <xsl:result-document href="{concat($output-dir-pm, '/XML/Structure.xml')}" method="xml" encoding="utf-8" 
                       indent="yes" omit-xml-declaration="no">
    <xsl:copy-of select="$toc"/>
  </xsl:result-document>
  
  <!-- create bookmarks -->
  <xsl:result-document href="{concat($output-dir-pm, '/XML/Bookmark.xml')}" method="xml" encoding="utf-8" 
                       indent="yes" omit-xml-declaration="no">
    <Bookmarks><Pages/></Bookmarks>
  </xsl:result-document>
  
  <!-- create metadatas -->
  <xsl:result-document href="{concat($output-dir-pm, '/XML/Metadata.xml')}" method="xml" encoding="utf-8" 
                       indent="yes" omit-xml-declaration="no">
    <Metadatas>
      <S1000D>1</S1000D>
      <PartNo><xsl:value-of select="tokenize(/pm/@id, '-')[2]"/></PartNo>
      <Title><xsl:apply-templates select="/pm/identAndStatusSection/pmAddress/pmAddressItems/pmTitle" mode="metas"/></Title>
      <OriginalIssueDate><xsl:value-of select="tokenize(/pm/@id, '-')[3]"/></OriginalIssueDate>
      <Engine><xsl:value-of select="$g_mi"/></Engine>
      <EngineModels><xsl:value-of select="/pm/identAndStatusSection/pmStatus/applic/displayText"/></EngineModels>
      <RevisionDate><xsl:value-of select="concat($g_year,$g_month,$g_day)"/></RevisionDate>
      <RevisionNo><xsl:value-of select="number($g_issue)"/></RevisionNo>
      <RevisionType><xsl:value-of select="$g_issue_type"/></RevisionType>
      <DocType><xsl:value-of select="tokenize(/pm/@id, '-')[1]"/></DocType>
    </Metadatas>
  </xsl:result-document>
  
  <!-- parse content -->
  <xsl:apply-templates/>
  <content/>
</xsl:template>

<!-- ************************************************************** -->

<xsl:template match="pm" mode="toc">
  <Structure>
    <xsl:apply-templates select="content" mode="toc"/>
  </Structure>
</xsl:template>

<xsl:template match="pm/content" mode="toc">
  <Pages>
    <xsl:apply-templates select="pmEntry" mode="toc"/>
  </Pages>
</xsl:template>

<xsl:template match="pmEntry" mode="toc" priority="5">
  <xsl:variable name="title">
    <xsl:apply-templates select="pmEntryTitle" mode="toc"/>
  </xsl:variable>
  <Page>
    <xsl:attribute name="ID"><xsl:call-template name="genTocID"/></xsl:attribute>
    <xsl:attribute name="Title">
      <xsl:choose>
        <xsl:when test="upper-case(translate($title, ' ', '')) = 'FRONTMATTER'">FRONTMATTER</xsl:when>
        <xsl:otherwise>
          <xsl:value-of select="$title"/>
        </xsl:otherwise>
      </xsl:choose>
    </xsl:attribute>
    <xsl:if test="not(dmRef)">
      <xsl:attribute name="FileType">FOLDER</xsl:attribute>
    </xsl:if>
    <xsl:apply-templates select="pmEntry|dmInclusion" mode="toc"/>
  </Page>
</xsl:template>

<xsl:template match="pmEntryTitle" mode="toc">
  <xsl:value-of select=".//text()"/>
</xsl:template>

<xsl:template match="pmEntry/dmInclusion" priority="10" mode="toc">
  <xsl:variable name="dmc"         select="@file"/>
  <xsl:variable name="out-file"    select="concat($dmc, '.html')"/>
  <xsl:variable name="out-file-id" select="dmodule/generate-id()"/>

  <Page FileType="FILE" MIMEType="text/html" URL="{$out-file}#{$out-file-id}" DMC="{@ref}">
    <xsl:attribute name="ID"><xsl:call-template name="genTocID"/></xsl:attribute>
    <xsl:attribute name="Title">
      <xsl:choose>
        <xsl:when test="tocTitle">
          <xsl:apply-templates select="tocTitle/dmTitle" mode="toc"/>
        </xsl:when>
        <xsl:otherwise>
          <xsl:apply-templates select=".//identAndStatusSection/dmAddress//dmTitle" mode="toc"/>
        </xsl:otherwise>
      </xsl:choose>
    </xsl:attribute>
    <xsl:if test="@is-tp='false'">
      <!--xsl:apply-templates select="dmodule/content" mode="toc"/-->
    </xsl:if>
  </Page>
</xsl:template>

<xsl:template match="dmTitle" mode="toc">
  <xsl:value-of select="techName"/>
  <xsl:text> - </xsl:text>
  <xsl:value-of select="infoName"/>
</xsl:template>

<xsl:template match="dmInclusion/dmodule/content" mode="toc">
  <xsl:apply-templates mode="toc"/>
  <xsl:if test=".//figure[title]">
    <xsl:variable name="dmc"         select="ancestor::dmInclusion/@file"/>
    <xsl:variable name="out-file"    select="concat($dmc, '.lof.html')"/>  
    <xsl:variable name="out-file-id" select="concat(../generate-id(),'_f')"/>
    <xsl:variable name="title"       select="fn:getGenText('lof-title')"/>
    
    <Page URL="{$out-file}#{$out-file-id}" FileType="FILE" MIMEType="text/html" Title="{$title}">
      <xsl:attribute name="ID"><xsl:call-template name="genTocID"/>_lof</xsl:attribute>
      <xsl:apply-templates select=".//figure[title]" mode="toc"/>
    </Page>
  </xsl:if>
  
  <xsl:if test=".//table[title]">
    <xsl:variable name="dmc"        select="ancestor::dmInclusion/@file"/>
    <xsl:variable name="out-file"   select="concat($dmc, '.lot.html')"/>  
    <xsl:variable name="out-file-id" select="concat(../generate-id(),'_t')"/>
    <xsl:variable name="title"      select="fn:getGenText('lot-title')"/>
    
    <Page URL="{$out-file}#{$out-file-id}" FileType="FILE" MIMEType="text/html" Title="{$title}">
      <xsl:attribute name="ID"><xsl:call-template name="genTocID"/>_lot</xsl:attribute>
    </Page>
  </xsl:if>
</xsl:template>

<xsl:template match="figure" mode="toc">
  <xsl:variable name="dmc"        select="ancestor::dmInclusion/@file"/>
  <xsl:variable name="out-file"   select="concat($dmc, '.lof.html')"/>  
  <xsl:variable name="toc-id"><xsl:call-template name="genTocDivID"/></xsl:variable>
  
  <Page URL="{concat($out-file, '#', $toc-id)}" FileType="FILE" MIMEType="text/html">
    <xsl:attribute name="ID"><xsl:call-template name="genTocID"/></xsl:attribute>
    <xsl:attribute name="Title">
      <xsl:apply-templates select="title" mode="toc"/>
    </xsl:attribute>
  </Page>
</xsl:template>

<xsl:template match="content/*" mode="toc" priority="1"/>

<xsl:template match="content/description" mode="toc" priority="3">
  <xsl:apply-templates select=".//levelledPara[title]" mode="toc"/>
</xsl:template>

<xsl:template match="content/procedure" mode="toc" priority="3">
  <xsl:apply-templates select=".//proceduralStep[title]" mode="toc"/>
</xsl:template>

<xsl:template match="levelledPara|proceduralStep" mode="toc">
  <xsl:variable name="dmc"        select="ancestor::dmInclusion/@file"/>
  <xsl:variable name="out-file"   select="concat($dmc, '.html')"/>  
  <xsl:variable name="toc-id"><xsl:call-template name="genTocDivID"/></xsl:variable>
  
  <Page URL="{concat($out-file, '#', $toc-id)}" FileType="FILE" MIMEType="text/html">
    <xsl:attribute name="ID"><xsl:call-template name="genTocID"/></xsl:attribute>
    <xsl:attribute name="Title">
      <xsl:apply-templates select="title" mode="toc"/>
    </xsl:attribute>
  </Page>
</xsl:template>

<xsl:template match="figure/title" mode="toc">
  <xsl:value-of select=".//text()"/>
</xsl:template>

<xsl:template match="levelledPara/title" mode="toc">
  <xsl:value-of select=".//text()"/>
</xsl:template>

<xsl:template match="proceduralStep/title" mode="toc">
  <xsl:value-of select=".//text()"/>
</xsl:template>

<xsl:template name="genTocID">
  <xsl:variable name="ps" select="count(preceding::*)"/>
  <xsl:value-of select="concat('ID', substring(translate(string(random:random-sequence(1, count(preceding::*)) * 100000000), '.', ''), 1, 10 - string-length(string($ps))), $ps)"/>
</xsl:template>

<xsl:template name="genTocDivID">
  <xsl:value-of select="generate-id(.)"/>
</xsl:template>

<!-- ************************************************************** -->

<xsl:template match="pmTitle" mode="metas">
  <xsl:value-of select=".//text()"/>
</xsl:template>

<!-- ************************************************************** -->

<xsl:template match="pm">
  <xsl:apply-templates select="content"/>
</xsl:template>
 
<xsl:template match="pm/content">
  <xsl:apply-templates select="pmEntry"/>
</xsl:template>

<xsl:template match="pmEntry">
  <xsl:apply-templates select="pmEntry|dmInclusion/dmodule"/>
</xsl:template>

</xsl:stylesheet>

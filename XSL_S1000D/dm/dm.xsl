<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:fn="http://www.pwc.ca"
    xmlns:xs="http://www.w3.org/2001/XMLSchema"
    xmlns:saxon="http://saxon.sf.net/"
    xmlns="http://www.w3.org/1999/xhtml"
    exclude-result-prefixes="xs fn saxon #default"
    version="2.0">
    
<!-- ************************************************************** -->
<!-- INCLUDES -->

<xsl:include href="./dm_descript.xsl"/>
<xsl:include href="./dm_proced.xsl"/>
<xsl:include href="./dm_ipd.xsl"/>
<xsl:include href="../common/alerts.xsl"/>
<xsl:include href="../common/brex-disabled.xsl"/>
<xsl:include href="../common/change.xsl"/>
<xsl:include href="../common/content.xsl"/>
<xsl:include href="../common/lists.xsl"/>
<xsl:include href="../common/metadata.xsl"/>
<xsl:include href="../common/numbering.xsl"/>
<xsl:include href="../common/prelreqs.xsl"/>
<xsl:include href="../common/references.xsl"/>
<xsl:include href="../common/table.xsl"/>
<xsl:include href="../common/title-page.xsl"/>
<xsl:include href="../common/utils.xsl"/>


<!-- ************************************************************** -->
<!-- *** DM PROCESSING *** -->

<xsl:template match="dmodule">
  <xsl:if test="not(../@file = ../preceding::dmInclusion/@file)">
  <xsl:result-document href="{concat($output-dir-pm, '/Pages/', ancestor::dmInclusion/@file, '.html')}" 
                       method="xhtml" encoding="utf-8" indent="no"
                       omit-xml-declaration="yes" exclude-result-prefixes="#default"
                       doctype-public="-//W3C//DTD XHTML 1.0 Strict//EN" 
                       doctype-system="http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
    <html lang="{$g_lang}">
      <xsl:call-template name="build-header"/>
      <body class="{concat($css-pfx, 'body')}">
        <div class="s-dmodule" id="{generate-id(.)}">
          <xsl:call-template name="pwcmetainfo"/>
          <xsl:choose>
            <xsl:when test="ancestor::dmInclusion/@is-tp='false'">
              <xsl:call-template name="metadata"/>
              <xsl:apply-templates/>
            </xsl:when>
            <xsl:otherwise>
              <xsl:call-template name="build-dm-tp"/>
            </xsl:otherwise>
          </xsl:choose>
          <div id="s1000d_print_marker"/>
        </div>
      </body>
    </html>
  </xsl:result-document>
  
  <!-- create lot and lof files -->
  <xsl:if test=".//figure[title] and ancestor::dmInclusion/@is-tp='false'">
    <xsl:call-template name="build-dm-lof"/>
  </xsl:if>
  
  <xsl:if test=".//table[title] and ancestor::dmInclusion/@is-tp='false'">
    <xsl:call-template name="build-dm-lot"/>
    </xsl:if>
  </xsl:if>
</xsl:template>

<xsl:template name="pwcmetainfo">
  <xsl:variable name="seq" select="tokenize(ancestor::dmInclusion/@ref, '-')"/>
  <div id="pwcmetainfo" style="display:none">
    <div id="chapter"><xsl:value-of select="$seq[4]"/></div>
    <div id="section"><xsl:value-of select="$seq[5]"/></div>
    <div id="subject"><xsl:value-of select="$seq[6]"/></div>
    <div id="pbn"></div>
    <div id="pb-title"><xsl:apply-templates select=".//identAndStatusSection/dmAddress//dmTitle" mode="toc"/></div>
    <div id="pointRev"><xsl:value-of select="number($g_inwork)"/></div>
    <div id="ModelNo"><xsl:value-of select="$g_mi"/></div>
    <div id="ManualServiceBulletinNo"></div>
    <div id="RevNo"><xsl:value-of select="number($g_issue)"/></div>
    <div id="IssueRevisionDate"><xsl:value-of select="concat($g_year,$g_month,$g_day)"/></div>
    <div id="manualType"><xsl:value-of select="tokenize(/pm/@id, '-')[1]"/></div>
    <div id="engineFamily"><xsl:value-of select="/pm/identAndStatusSection/pmStatus/applic/displayText"/></div>
  </div>
  <div id="pwcbannerinfo" style="display:none">
    <div id="manualTitle"><xsl:value-of select="/pm/identAndStatusSection/pmAddress/pmAddressItems/pmTitle//text()"/></div>
    <div id="engine"><xsl:value-of select="$g_mi"/></div>
    <div id="manualPn"><xsl:value-of select="tokenize(/pm/@id, '-')[2]"/></div>
    <div id="pointRev_"><xsl:value-of select="number($g_inwork)"/></div>
    <div id="revision"><xsl:value-of select="number($g_issue)"/></div>
    <div id="revDate"><xsl:value-of select="concat($g_year,$g_month,$g_day)"/></div>
    <div id="csu"><xsl:value-of select="concat($seq[4], '-', $seq[5], '-', $seq[6])"/></div>
    <div id="pb-name"><xsl:apply-templates select=".//identAndStatusSection/dmAddress//dmTitle" mode="toc"/></div>
  </div>
</xsl:template>

<xsl:template match="identAndStatusSection"/>
    
<xsl:template match="content">
  <xsl:if test="ancestor::dmInclusion/@is-fm='false'">
    <xsl:apply-templates select="refs"/>
  </xsl:if>
  <xsl:apply-templates select="*[not(self::refs)]"/>
</xsl:template>

<xsl:template name="build-header">
  <xsl:param name="title" select="''"/>

  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <link href="{$css-path}/content.css" rel="stylesheet" type="text/css"/>
    <script src="{$js-path}/pwcdisplay.js" type="text/javascript"><![CDATA[ // JS ]]></script>
    <script src="{$js-path}/pwcdisplay_common.js" type="text/javascript"><![CDATA[ // JS ]]></script>
    <script src="{$js-path}/jquery-1.11.2.min.js" type="text/javascript"><![CDATA[ // JS ]]></script>
    <title>
      <xsl:choose>
        <xsl:when test="$title!=''"><xsl:value-of select="$title"/></xsl:when>
        <xsl:otherwise><xsl:apply-templates select=".//identAndStatusSection/dmAddress//dmTitle" mode="toc"/></xsl:otherwise>
      </xsl:choose>
    </title>
  </head>
</xsl:template>

<!-- ************************************************************** -->
<!-- LOF and LOT processing -->

<xsl:template name="build-dm-lof">
  <xsl:result-document href="{concat($output-dir-pm, '/Pages/', ancestor::dmInclusion/@file, '.lof.html')}" 
                       method="xhtml" encoding="utf-8" indent="yes"
                       omit-xml-declaration="yes"  exclude-result-prefixes="#default"
                       doctype-public="-//W3C//DTD XHTML 1.0 Strict//EN" 
                       doctype-system="http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
    <html lang="{$g_lang}">
      <xsl:call-template name="build-header">
        <xsl:with-param name="title" select="fn:getGenText('lof-title')"/>
      </xsl:call-template>
      <body class="{concat($css-pfx, '-body')}">
        <div class="s-dmodule" id="{generate-id(.)}_f">
          <xsl:call-template name="pwcmetainfo"/>
          <xsl:if test="ancestor::dmInclusion/@is-tp='false'">
            <xsl:call-template name="metadata">
              <xsl:with-param name="additional-title" select="fn:getGenText('lof-title')"/>
            </xsl:call-template>
          </xsl:if>
          <div class="{concat($css-pfx, 'lof', $css-sfx)}">
            <xsl:apply-templates select=".//figure[title]" mode="lof"/>
          </div>
          <div id="s1000d_print_marker"/>
        </div>
      </body>
    </html>
  </xsl:result-document>
</xsl:template>

<xsl:template match="table" mode="lot">
  <div class="{concat($css-pfx, 'lot-item', $css-sfx)}">
    <div class="s-table-title-lot">
      <a href="{concat(ancestor::dmInclusion/@file,'.html#', generate-id(.))}" onclick="showTable('{generate-id(.)}')">
        <xsl:value-of select="fn:getGenText('title-table')"/>
        <xsl:text>&#xa0;</xsl:text>
        <xsl:apply-templates select="." mode="numbering"/>
        <xsl:text> </xsl:text>
        <xsl:apply-templates select="title" mode="toc"/>
      </a>
    </div>
  </div>
</xsl:template>

<xsl:template name="build-dm-lot">
  <xsl:result-document href="{concat($output-dir-pm, '/Pages/', ancestor::dmInclusion/@file, '.lot.html')}" 
                       method="xhtml" encoding="utf-8" indent="yes" 
                       omit-xml-declaration="yes" exclude-result-prefixes="#default"
                       doctype-public="-//W3C//DTD XHTML 1.0 Strict//EN" 
                       doctype-system="http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
    <html lang="{$g_lang}">
      <xsl:call-template name="build-header">
        <xsl:with-param name="title" select="fn:getGenText('lot-title')"/>
      </xsl:call-template>
      <body class="{concat($css-pfx, '-body')}">
        <div class="s-dmodule" id="{generate-id(.)}_t">
          <xsl:call-template name="pwcmetainfo"/>
          <xsl:if test="ancestor::dmInclusion/@is-tp='false'">
            <xsl:call-template name="metadata">
              <xsl:with-param name="additional-title" select="fn:getGenText('lot-title')"/>
            </xsl:call-template>
          </xsl:if>
          <div class="{concat($css-pfx, 'lot', $css-sfx)}">
            <xsl:apply-templates select=".//table[title]" mode="lot"/>
          </div>
          <div id="s1000d_print_marker"/>
        </div>
      </body>
    </html>
  </xsl:result-document>
</xsl:template>

<xsl:template match="figure" mode="lof">
  <div class="{concat($css-pfx, 'lof-item', $css-sfx)}">
    <div class="s-figure-title-lof">
      <a href="#none" onclick="displayGraphicsNav('{concat(ancestor::dmInclusion/@file,'.html')}','{generate-id(.)}');">
        <xsl:value-of select="fn:getGenText('title-figure')"/>
        <xsl:text>&#xa0;</xsl:text>
        <xsl:apply-templates select="." mode="numbering"/>
        <xsl:text> </xsl:text>
        <xsl:apply-templates select="title" mode="toc"/>
      </a>
    </div>
  </div>
</xsl:template>

<!-- ************************************************************** -->

<xsl:template match="*">
  <div style="color: red; font-weight: bold;">
    <xsl:text>No template defined for &#60;</xsl:text>
    <xsl:value-of select="name()"/>
    <xsl:text>&#62;.</xsl:text>
  </div>
</xsl:template>

</xsl:stylesheet>

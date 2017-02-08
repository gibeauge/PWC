<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:fn="http://www.pwc.ca"
    xmlns:exslt="http://exslt.org/common"
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

<xsl:variable name="g_langSrc"   select="lower-case(/pm/identAndStatusSection/pmAddress/pmIdent/language/@languageIsoCode)" />
<xsl:variable name="g_lang"       select="if ($g_langSrc='sx') then 'en' else $g_langSrc"/>
<xsl:variable name="g_issue"      select="/pm/identAndStatusSection/pmAddress/pmIdent/issueInfo/@issueNumber"/>
<xsl:variable name="g_inwork"     select="/pm/identAndStatusSection/pmAddress/pmIdent/issueInfo/@inWork"/>
<xsl:variable name="g_year"       select="/pm/identAndStatusSection/pmAddress/pmAddressItems/issueDate/@year"/>
<xsl:variable name="g_month"      select="/pm/identAndStatusSection/pmAddress/pmAddressItems/issueDate/@month"/>
<xsl:variable name="g_day"        select="/pm/identAndStatusSection/pmAddress/pmAddressItems/issueDate/@day"/>
<xsl:variable name="g_pmc"        select="fn:getPMC(/pm/identAndStatusSection/pmAddress/pmIdent/pmCode)"/>
     
<!-- ************************************************************** -->
<!-- *** PM PROCESSING *** -->

<xsl:template match="/">
  <xsl:apply-templates/>
</xsl:template>

<xsl:template match="@*|node()">
  <xsl:copy>
    <xsl:apply-templates select="@*|node()"/>
  </xsl:copy>
</xsl:template>

<xsl:template match="dmInclusion">
  <xsl:choose>
    <!-- existing LOEDM ; replace by our own -->
    <xsl:when test="@inc='00S'">
      <!-- build LOEDM -->
      <xsl:variable name="dm-loedm">
        <xsl:call-template name="build-loedm">
          <xsl:with-param name="dm-tp" select="if (//dmInclusion[@is-tp='true']) then //dmInclusion[@is-tp='true'][1]/dmodule else dmodule"/>
        </xsl:call-template>
      </xsl:variable>
      <xsl:variable name="dmc-loedm" select="fn:getDMC(exslt:node-set($dm-loedm)//identAndStatusSection/dmAddress/dmIdent/dmCode)"/>
      <dmInclusion ref="{$dmc-loedm}" file="{$dmc-loedm}" inc="00S" is-tp="false" is-fm="true">
        <xsl:copy-of select="exslt:node-set($dm-loedm)"/>
      </dmInclusion>
    </xsl:when>
    <!-- no existing LOEDM ; add our own after title page or change record -->
    <xsl:when test="not(//dmInclusion/@inc='00S') and ((@is-tp='true' and not(//dmInclusion/@inc='00T')) or (@inc='00T' and not(preceding::dmInclusion/@inc='00T')))">
      <xsl:copy-of select="."/>
    <!-- build LOEDM -->
      <xsl:variable name="dm-loedm">
        <xsl:call-template name="build-loedm">
          <xsl:with-param name="dm-tp" select="if (//dmInclusion[@is-tp='true']) then //dmInclusion[@is-tp='true'][1]/dmodule else dmodule"/>
        </xsl:call-template>
      </xsl:variable>
      <xsl:variable name="dmc-loedm" select="fn:getDMC(exslt:node-set($dm-loedm)//identAndStatusSection/dmAddress/dmIdent/dmCode)"/>
      <dmInclusion ref="{$dmc-loedm}" file="{$dmc-loedm}" inc="00S" is-tp="false" is-fm="true">
        <xsl:copy-of select="exslt:node-set($dm-loedm)"/>
      </dmInclusion>
    </xsl:when>
    <!-- do not keep existing highlights ; replace by our own if applicable -->
    <xsl:when test="@inc='00U'">
      <xsl:if test="number($g_issue) > 1">
        <xsl:variable name="dm-highlights">
          <xsl:call-template name="build-highlights">
            <xsl:with-param name="dm-tp" select="if (//dmInclusion[@is-tp='true']) then //dmInclusion[@is-tp='true'][1]/dmodule else dmodule"/>
          </xsl:call-template>
        </xsl:variable>
        <xsl:variable name="dmc-highlights" select="fn:getDMC(exslt:node-set($dm-highlights)//identAndStatusSection/dmAddress/dmIdent/dmCode)"/>    
        <dmInclusion ref="{$dmc-highlights}" file="{$dmc-highlights}" inc="00U" is-tp="false" is-fm="true">
          <xsl:copy-of select="exslt:node-set($dm-highlights)"/>
        </dmInclusion>
      </xsl:if>
    </xsl:when>
    <xsl:otherwise>
      <xsl:copy-of select="."/>
    </xsl:otherwise>
  </xsl:choose>
  
  <!-- do not keep existing LOEDM and Highlights (empty) -->
  <!--
  <xsl:if test="not(@inc='00S' or @inc='00U')">
    <xsl:copy-of select="."/>
  </xsl:if>
  -->
  
  <!-- Add LOEDM and Highlights after title page or change record -->
  <!--
  <xsl:if test="(@is-tp='true' and not(//dmInclusion/@inc='00T')) or (@inc='00T')">
    <xsl:variable name="dm-loedm">
      <xsl:call-template name="build-loedm">
        <xsl:with-param name="dm-tp" select="if (//dmInclusion[@is-tp='true']) then //dmInclusion[@is-tp='true'][1]/dmodule else dmodule"/>
      </xsl:call-template>
    </xsl:variable>
    <xsl:variable name="dmc-loedm" select="fn:getDMC(exslt:node-set($dm-loedm)//identAndStatusSection/dmAddress/dmIdent/dmCode)"/>    
    <dmInclusion ref="{$dmc-loedm}" file="{$dmc-loedm}" inc="00S" is-tp="false" is-fm="true">
      <xsl:copy-of select="exslt:node-set($dm-loedm)"/>
    </dmInclusion>
    
    <xsl:if test="number($g_issue) > 1">
      <xsl:variable name="dm-highlights">
        <xsl:call-template name="build-highlights">
          <xsl:with-param name="dm-tp" select="if (//dmInclusion[@is-tp='true']) then //dmInclusion[@is-tp='true'][1]/dmodule else dmodule"/>
        </xsl:call-template>
      </xsl:variable>
      <xsl:variable name="dmc-highlights" select="fn:getDMC(exslt:node-set($dm-highlights)//identAndStatusSection/dmAddress/dmIdent/dmCode)"/>    
      <dmInclusion ref="{$dmc-highlights}" file="{$dmc-highlights}" inc="00U" is-tp="false" is-fm="true">
        <xsl:copy-of select="exslt:node-set($dm-highlights)"/>
      </dmInclusion>
    </xsl:if>
  </xsl:if>
  -->
</xsl:template>

<!-- ************************************************************** -->
<!-- *** GENERATE LOEDM *** -->

<xsl:template name="build-loedm">
  <xsl:param name="dm-tp"/>
   
  <dmodule>
    <xsl:copy-of select="$dm-tp/@*"/>
    <xsl:apply-templates select="$dm-tp/identAndStatusSection" mode="loedm-metas"/>
    <content>
      <description>
        <para>
          <xsl:value-of select="fn:getGenText('loedm-intro-1')"/>
          <xsl:value-of select="$g_issue"/>
          <xsl:value-of select="fn:getGenText('loedm-intro-2')"/>
          <xsl:value-of select="concat($g_year, '-', $g_month, '-', $g_day)"/>
          <xsl:value-of select="fn:getGenText('loedm-intro-3')"/>
        </para>
        <para><xsl:value-of select="fn:getGenText('loedm-intro-4')"/></para>
        <para><xsl:value-of select="fn:getGenText('loedm-intro-5')"/></para>

        <table id="loedm-table" frame="topbot">
          <tgroup cols="5">
            <colspec colname="col1" colwidth="40%"/>
            <colspec colname="col2" colwidth="32%"/>
            <colspec colname="col3" colwidth="3%"/>
            <colspec colname="col4" colwidth="12%"/>
            <colspec colname="col5" colwidth="13%"/>
            <thead>
              <row>
                <entry colsep="0" rowsep="1">
                  <para><xsl:value-of select="fn:getGenText('loedm-document-title')"/></para>
                </entry>
                <entry colsep="0" rowsep="1">
                  <para><xsl:value-of select="fn:getGenText('loedm-dmc')"/></para>
                </entry>
                <entry colsep="0" rowsep="1"></entry>
                <entry colsep="0" rowsep="1">
                  <para><xsl:value-of select="fn:getGenText('loedm-issue-date')"/></para>
                </entry>
                <entry colsep="0" rowsep="1">
                  <para><xsl:value-of select="fn:getGenText('loedm-applic')"/></para>
                </entry>
              </row>
            </thead>
            <tbody>
              <xsl:apply-templates select="//dmodule[not(../@file = ../preceding::dmInclusion/@file)]" mode="loedm"/>
            </tbody>
          </tgroup>
        </table>
      </description>
    </content>
  </dmodule>
</xsl:template>

<xsl:template match="@*|node()" mode="loedm-metas">
  <xsl:copy>
    <xsl:apply-templates select="@*|node()" mode="loedm-metas"/>
  </xsl:copy>
</xsl:template>

<xsl:template match="techName" mode="loedm-metas">
  <techName>
    <xsl:choose>
      <xsl:when test="//dmInclusion/@inc='00S'">
        <xsl:value-of select="//dmInclusion[@inc='00S']/dmodule/identAndStatusSection//dmAddressItems//dmTitle/techName"/>
      </xsl:when>
      <xsl:otherwise>
        <xsl:value-of select="/pm/identAndStatusSection/pmAddress/pmAddressItems/pmTitle"/>
      </xsl:otherwise>
    </xsl:choose>
  </techName>
</xsl:template>

<xsl:template match="infoName" mode="loedm-metas">
  <infoName><xsl:value-of select="fn:getGenText('loedm')"/></infoName>
</xsl:template>

<xsl:template match="@infoCode" mode="loedm-metas">
  <xsl:attribute name="infoCode">00S</xsl:attribute>
</xsl:template>

<xsl:template match="issueInfo" mode="loedm-metas">
  <issueInfo inWork="{$g_inwork}" issueNumber="{$g_issue}"/>
</xsl:template>

<xsl:template match="issueDate" mode="loedm-metas">
  <issueDate day="{$g_day}" month="{$g_month}" year="{$g_year}"/>
</xsl:template>

<xsl:template match="dmStatus" mode="loedm-metas">
  <dmStatus issueType="{if (number($g_issue)=1) then 'new' else 'changed'}">
    <xsl:copy-of select="security|responsiblePartnerCompany|originator|applic|brexDmRef|qualityAssurance"/>
  </dmStatus>
</xsl:template>

<xsl:template match="dmodule" mode="loedm">
  <row>
    <entry colsep="0" rowsep="0">
      <para><xsl:apply-templates select="identAndStatusSection/dmAddress//dmTitle" mode="loedm"/></para>
    </entry>
    <entry colsep="0" rowsep="0">
      <!--para><xsl:value-of select="fn:getDMCBasic(../@ref)"/></para-->
      <para>
        <dmRef>
          <dmRefIdent>
            <xsl:copy-of select="identAndStatusSection/dmAddress/dmIdent/*"/>
          </dmRefIdent>
          <dmRefAddressItems>
            <dmTitle>
              <xsl:copy-of select="identAndStatusSection/dmAddress//dmTitle/techName"/>
              <xsl:copy-of select="identAndStatusSection/dmAddress//dmTitle/infoName"/>
            </dmTitle>
          </dmRefAddressItems>
        </dmRef>
      </para>
    </entry>
    <entry colsep="0" rowsep="0">
      <!--para><xsl:apply-templates select="identAndStatusSection/dmStatus/@issueType" mode="loedm"/></para-->
      <xsl:variable name="issue" select="ancestor::dmInclusion/@isstype"/>
      <para>
        <!--xsl:value-of select="if ($issue!='NA') then $issue else 'N'"/-->
        <xsl:choose>
          <xsl:when test="number($g_issue)=0 and (../@is-tp='true' or ../@inc=('00S','00U'))">N</xsl:when>
          <xsl:when test="../@is-tp='true' or ../@inc=('00S','00U')">C</xsl:when>
          <xsl:otherwise><xsl:value-of select="if ($issue!='NA') then $issue else 'N'"/></xsl:otherwise>
        </xsl:choose>
      </para>
    </entry>
    <entry colsep="0" rowsep="0">
      <para>
        <xsl:choose>
          <xsl:when test="number($g_issue)=0 or ../@is-tp='true' or ../@inc=('00S','00U')">
            <xsl:apply-templates select="/pm/identAndStatusSection/pmAddress/pmAddressItems/issueDate" mode="loedm"/>
          </xsl:when>
          <xsl:otherwise>
            <xsl:apply-templates select="identAndStatusSection//dmAddressItems/issueDate" mode="loedm"/>
          </xsl:otherwise>
        </xsl:choose>
      </para>
    </entry>
    <entry colsep="0" rowsep="0">
      <para><xsl:value-of select="identAndStatusSection/dmStatus/applic/displayText/simplePara[1]"/></para>
    </entry>
  </row>
</xsl:template>

<xsl:template match="techName" mode="loedm">
  <xsl:apply-templates/>
</xsl:template>

<xsl:template match="infoName" mode="loedm">
  <xsl:text>&#xa0;- </xsl:text><xsl:apply-templates/>
</xsl:template>

<xsl:template match="@issueType" mode="loedm">
  <xsl:choose>
    <xsl:when test=". eq 'new'">N</xsl:when>
    <xsl:otherwise>C</xsl:otherwise>
  </xsl:choose>
</xsl:template>

<xsl:template match="issueDate" mode="loedm">
  <xsl:value-of select="concat(@year, '&#x2011;', @month, '&#x2011;', @day)"/>
</xsl:template>

<!-- ************************************************************** -->
<!-- *** GENERATE HIGHLIGHTS *** -->

<xsl:template name="build-highlights">
  <xsl:param name="dm-tp"/>
   
  <dmodule>
    <xsl:copy-of select="$dm-tp/@*"/>
    <xsl:apply-templates select="$dm-tp/identAndStatusSection" mode="highlights-metas"/>
    <content>
      <description>
        <para>
          <xsl:value-of select="fn:getGenText('highlights-intro-1')"/>
          <xsl:value-of select="$g_issue"/>
          <xsl:value-of select="fn:getGenText('highlights-intro-2')"/>
          <xsl:value-of select="concat($g_year, '-', $g_month, '-', $g_day)"/>
          <xsl:value-of select="fn:getGenText('highlights-intro-3')"/>
        </para>

        <table id="highlights-table" frame="topbot">
          <tgroup cols="2">
            <colspec colname="col1" colwidth="20%"/>
            <colspec colname="col2" colwidth="40%"/>
            <colspec colname="col3" colwidth="40%"/>
            <thead>
              <row>
                <entry colsep="0" rowsep="1">
                  <para><xsl:value-of select="fn:getGenText('highlights-data-module')"/></para>
                </entry>
                <entry colsep="0" rowsep="1">
                  <para><xsl:value-of select="fn:getGenText('highlights-dm-title')"/></para>
                </entry>
                <entry colsep="0" rowsep="1">
                  <para><xsl:value-of select="fn:getGenText('highlights-rfu')"/></para>
                </entry>
              </row>
            </thead>
            <tbody>
              <xsl:apply-templates select="/pm" mode="highlights"/>
              <xsl:apply-templates select="//dmodule[not(../@file = ../preceding::dmInclusion/@file)]" mode="highlights"/>
            </tbody>
          </tgroup>
        </table>
      </description>
    </content>
  </dmodule>
</xsl:template>

<xsl:template match="@*|node()" mode="highlights-metas">
  <xsl:copy>
    <xsl:apply-templates select="@*|node()" mode="highlights-metas"/>
  </xsl:copy>
</xsl:template>

<xsl:template match="techName" mode="highlights-metas">
  <techName>
    <xsl:choose>
      <xsl:when test="//dmInclusion/@inc='00S'">
        <xsl:value-of select="//dmInclusion[@inc='00U']/dmodule/identAndStatusSection//dmAddressItems//dmTitle/techName"/>
      </xsl:when>
      <xsl:otherwise>
        <xsl:value-of select="/pm/identAndStatusSection/pmAddress/pmAddressItems/pmTitle"/>
      </xsl:otherwise>
    </xsl:choose>
  </techName>
</xsl:template>

<xsl:template match="infoName" mode="highlights-metas">
  <infoName><xsl:value-of select="fn:getGenText('highlights')"/></infoName>
</xsl:template>

<xsl:template match="@infoCode" mode="highlights-metas">
  <xsl:attribute name="infoCode">00U</xsl:attribute>
</xsl:template>

<xsl:template match="issueInfo" mode="highlights-metas">
  <issueInfo inWork="{$g_inwork}" issueNumber="{$g_issue}"/>
</xsl:template>

<xsl:template match="issueDate" mode="highlights-metas">
  <issueDate day="{$g_day}" month="{$g_month}" year="{$g_year}"/>
</xsl:template>

<xsl:template match="dmStatus" mode="highlights-metas">
  <dmStatus issueType="{if (number($g_issue)=2) then 'new' else 'changed'}">
    <xsl:copy-of select="security|responsiblePartnerCompany|originator|applic|brexDmRef|qualityAssurance"/>
  </dmStatus>
</xsl:template>

<xsl:template match="pm" mode="highlights">
  <!--xsl:if test="identAndStatusSection/pmStatus/reasonForUpdate[@updateHighlight='1' or not(@updateHighlight)]"-->
  <xsl:if test="identAndStatusSection/pmStatus/reasonForUpdate">
    <row>
      <entry colsep="0" rowsep="0">
        <para><xsl:value-of select="fn:getPMCBasic($g_pmc)"/></para>
      </entry>
      <entry colsep="0" rowsep="0">
        <para><xsl:apply-templates select="identAndStatusSection/pmAddress//pmTitle" mode="highlights"/></para>
      </entry>
      <entry colsep="0" rowsep="0">
        <!--xsl:apply-templates select="identAndStatusSection/pmStatus/reasonForUpdate[@updateHighlight='1' or not(@updateHighlight)]" mode="highlights"/-->
        <xsl:apply-templates select="identAndStatusSection/pmStatus/reasonForUpdate" mode="highlights"/>
      </entry>
    </row>
  </xsl:if>  
</xsl:template>

<xsl:template match="dmodule" mode="highlights">
  <!--xsl:if test="identAndStatusSection/dmStatus/reasonForUpdate[@updateHighlight='1' or not(@updateHighlight)]"-->
  <xsl:variable name="issue" select="ancestor::dmInclusion/@isstype"/>
  <xsl:if test="$issue='C' and identAndStatusSection/dmStatus/reasonForUpdate">
    <row>
      <entry colsep="0" rowsep="0">
        <!--para><xsl:value-of select="fn:getDMCBasic(ancestor::dmInclusion/@ref)"/></para-->
        <para>
          <dmRef>
            <dmRefIdent>
              <xsl:copy-of select="identAndStatusSection/dmAddress/dmIdent/*"/>
            </dmRefIdent>
            <dmRefAddressItems>
              <dmTitle>
                <xsl:copy-of select="identAndStatusSection/dmAddress//dmTitle/techName"/>
                <xsl:copy-of select="identAndStatusSection/dmAddress//dmTitle/infoName"/>
              </dmTitle>
            </dmRefAddressItems>
          </dmRef>
        </para>
      </entry>
      <entry colsep="0" rowsep="0">
        <para><xsl:apply-templates select="identAndStatusSection/dmAddress//dmTitle" mode="highlights"/></para>
      </entry>
      <entry colsep="0" rowsep="0">
        <!--xsl:apply-templates select="identAndStatusSection/dmStatus/reasonForUpdate[@updateHighlight='1' or not(@updateHighlight)]" mode="highlights"/-->
        <xsl:apply-templates select="identAndStatusSection/dmStatus/reasonForUpdate" mode="highlights"/>
      </entry>
    </row>
  </xsl:if>
</xsl:template>

<xsl:template match="reasonForUpdate" mode="highlights">
  <para>
    <xsl:apply-templates/>
  </para>
</xsl:template>

<xsl:template match="pmTitle" mode="highlights">
  <xsl:apply-templates/>
</xsl:template>

<xsl:template match="dmTitle" mode="highlights">
  <xsl:apply-templates  mode="highlights"/>
</xsl:template>

<xsl:template match="techName" mode="highlights">
  <xsl:apply-templates/>
</xsl:template>

<xsl:template match="infoName" mode="highlights">
  <xsl:text>&#xa0;- </xsl:text><xsl:apply-templates/>
</xsl:template>

</xsl:stylesheet>

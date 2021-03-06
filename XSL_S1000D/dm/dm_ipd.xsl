<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:fn="http://www.pwc.ca"
    xmlns:xs="http://www.w3.org/2001/XMLSchema"
    xmlns:saxon="http://saxon.sf.net/"
    xmlns="http://www.w3.org/1999/xhtml"
    exclude-result-prefixes="xs fn saxon #default"
    version="2.0">
    
<xsl:template match="illustratedPartsCatalog">
  <div class="s-ipd">
    <xsl:apply-templates select="node()[not(self::catalogSeqNumber)]"/>
    <div class="s-ipd-table">
      <table width="100%">
        <colgroup>
          <col width="8%"/>
          <col width="5%"/>
          <col width="5%"/>
          <col width="18%"/>
          <col width="54%"/>
          <col width="8%"/>
        </colgroup>
        <thead>
          <tr>
            <th>
              <xsl:value-of select="fn:getGenText('ipd-header-1a')"/><br/>
              <xsl:value-of select="fn:getGenText('ipd-header-1b')"/>
            </th>
            <th><xsl:value-of select="fn:getGenText('ipd-header-2')"/></th>
            <th><xsl:value-of select="fn:getGenText('ipd-header-3')"/></th>
            <th><xsl:value-of select="fn:getGenText('ipd-header-4')"/></th>
            <th><xsl:value-of select="fn:getGenText('ipd-header-5')"/></th>
            <th>
              <xsl:value-of select="fn:getGenText('ipd-header-6a')"/><br/>
              <xsl:value-of select="fn:getGenText('ipd-header-6b')"/>
            </th>
          </tr>
        </thead>
        <tbody>
          <xsl:apply-templates select="catalogSeqNumber"/>
        </tbody>
      </table>
    </div>
  </div>
</xsl:template>

<xsl:template name="ipc-figure-content">
  <br/>
  <xsl:apply-templates select="title" />
  <xsl:call-template name="figure-content"/>
  <span class="pr-figure-min">
    <div style="display:inline-block;margin-bottom:20px; padding:10px;border: 3px solid #1A86D2;-webkit-box-shadow: 3px 3px 1px 0px #888;-moz-box-shadow:3px 3px 1px 0px #888;box-shadow: 3px 3px 1px 0px #888;">
      <a href="#{@id}" onclick="displayGraphics('{@id}');">
        <xsl:if test="title">
          <xsl:attribute name="title" select="title"/>
        </xsl:if>
        <xsl:text>Display illustration</xsl:text>
      </a>
    </div>      
  </span>
</xsl:template>

<xsl:template match="catalogSeqNumber">
  <xsl:if test="not(preceding-sibling::catalogSeqNumber)">
    <xsl:variable name="fig-num">
      <xsl:apply-templates select="preceding-sibling::figure" mode="numbering">
        <xsl:with-param name="as-number" select="'0'"/>
      </xsl:apply-templates>
    </xsl:variable>
    <tr>
      <td><xsl:value-of select="$fig-num"/></td>
      <td/>
      <td/>
      <td/>
      <td/>
      <td/>
    </tr>
  </xsl:if>
  <xsl:apply-templates/>
</xsl:template>

<xsl:template match="itemSequenceNumber">
  <tr>
    <xsl:call-template name="change"/>
    <xsl:call-template name="change">
      <xsl:with-param name="node" select=".."/>
    </xsl:call-template>
    <td>
      <xsl:if test="not(preceding-sibling::itemSequenceNumber)">
        <xsl:apply-templates select="parent::catalogSeqNumber" mode="item-nb"/>
      </xsl:if>
    </td>
    <td><xsl:apply-templates select="." mode="isn"/></td>
    <td><xsl:apply-templates select="quantityPerNextHigherAssy"/></td>
    <td><xsl:apply-templates select="partNumber"/></td>
    <td><xsl:call-template name="nomenclature"/></td>
    <td><xsl:call-template name="uca-mv"/></td>
  </tr>
</xsl:template>

<xsl:template match="itemSequenceNumber" mode="chg-del">
  <xsl:call-template name="delete-as-row">
    <xsl:with-param name="span" select="'6'"/>
  </xsl:call-template>
</xsl:template>

<xsl:template match="catalogSeqNumber" mode="item-nb">
  <xsl:if test="itemSequenceNumber/partLocationSegment/notIllustrated">
    <xsl:text>-</xsl:text>
  </xsl:if>
  <span id="{concat('ipd-',@catalogItemNumber)}">
    <xsl:value-of select="@catalogItemNumber"/>
  </span>
</xsl:template>

<xsl:template match="itemSequenceNumber" mode="isn">
  <span id="{concat('ipd-',parent::catalogSeqNumber/@catalogItemNumber,'-',@itemSeqNumberValue)}">
    <xsl:value-of select="@itemSeqNumberValue"/>
  </span>
</xsl:template>

<xsl:template match="quantityPerNextHigherAssy">
  <span>
    <xsl:call-template name="change"/>
    <xsl:apply-templates/>
  </span>
</xsl:template>

<xsl:template match="quantityPerNextHigherAssy" mode="chg-del">
  <xsl:call-template name="delete-as-span"/>
</xsl:template>

<xsl:template match="itemSequenceNumber/partNumber" priority="7">
  <span>
    <xsl:call-template name="change"/>
    <xsl:apply-templates/>
  </span>
</xsl:template>

<xsl:template match="itemSequenceNumber/partNumber" mode="chg-del">
  <xsl:call-template name="delete-as-span"/>
</xsl:template>

<xsl:template name="nomenclature">
  <xsl:apply-templates select="partIdentSegment/descrForPart"/>
  <xsl:apply-templates select="partLocationSegment/referTo"/>
  <xsl:apply-templates select="partLocationSegment/selectOrManufactureFromIdent"/>
  <xsl:apply-templates select="applicabilitySegment/interchangeability"/>
  <xsl:apply-templates select="changeAuthorityNumber"/>
  <xsl:apply-templates select="genericPartDataGroup/genericPartData"/>
</xsl:template>

<xsl:template name="indenture">
  <xsl:variable name="indent-nb" select="ancestor::catalogSeqNumber/@indenture" as="xs:integer"/>
  <xsl:if test="$indent-nb &gt; 1">
    <xsl:variable name="indent-lbl" select="'. '"/>
    <xsl:value-of select="for $a in (1 to $indent-nb - 1) return $indent-lbl"/>
  </xsl:if>
</xsl:template>

<xsl:template match="descrForPart">
  <div>
    <xsl:call-template name="change"/>
    <xsl:call-template name="indenture"/>
    <xsl:apply-templates/>
  </div>
</xsl:template>

<xsl:template match="descrForPart" mode="chg-del">
  <div>
    <xsl:call-template name="indenture"/>
    <xsl:call-template name="delete-as-span"/>
  </div>
</xsl:template>

<xsl:template match="referTo[@refType='attaching']" priority="5">
  <div>
    <xsl:call-template name="change"/>
    <xsl:value-of select="fn:getGenText(concat('refer-to-', @refType))"/><br/>
    <xsl:apply-templates select="catalogSeqNumberRef"/>
  </div>
</xsl:template>

<xsl:template match="referTo[@refType='nha' or @refType='det']" priority="5">
  <div>
    <xsl:call-template name="change"/>
    <xsl:value-of select="fn:getGenText(concat('refer-to-', @refType))"/><br/>
    <xsl:apply-templates select="catalogSeqNumberRef/refs/*" mode="refer-to"/>
  </div>
</xsl:template>

<xsl:template match="referTo">
  <div>
    <xsl:call-template name="change"/>
    <xsl:apply-templates/>
  </div>
</xsl:template>

<xsl:template match="refs/*" mode="refer-to">
  <div><xsl:apply-templates select="."/></div>
</xsl:template>

<xsl:template match="referTo/catalogSeqNumberRef" priority="5">
  <xsl:variable name="csnv" select="@catalogSeqNumberValue"/>
  <xsl:variable name="csn" select="if (string-length($csnv) &gt; 9) then substring($csnv, 10) else $csnv"/>
  <xsl:variable name="isn" select="if (@itemSeqNumberValue) then @itemSeqNumberValue else ''"/>
  <xsl:variable name="ref" select="if ($isn='') then concat('ipd-', $csn) else concat('ipd-', $csn, '-', $isn)"/>
  <span>
    <xsl:call-template name="change"/>
    <a href="#{$ref}">
      <xsl:value-of select="if ($isn='') then $csn else concat($csn, '/', $isn)"/>
    </a>
  </span>
</xsl:template>

<xsl:template match="referTo/catalogSeqNumberRef" mode="chg-del">
  <xsl:call-template name="delete-as-span"/>
</xsl:template>

<xsl:template match="selectOrManufactureFromIdent">
  <div>
    <xsl:call-template name="change"/>
    <xsl:apply-templates/>
  </div>
</xsl:template>

<xsl:template match="selectOrManufactureFromIdent" mode="chg-del">
  <xsl:call-template name="delete-as-div-no-id"/>
</xsl:template>

<xsl:template match="selectOrManufacture">
  <span>
    <xsl:call-template name="change"/>
    <xsl:apply-templates/>
  </span>
</xsl:template>

<xsl:template match="selectOrManufacture" mode="chg-del">
  <xsl:call-template name="delete-as-span"/>
</xsl:template>

<xsl:template match="changeAuthorityNumber">
  <div>
    <xsl:call-template name="change"/>
    <xsl:apply-templates/>
  </div>
</xsl:template>

<xsl:template match="changeAuthorityNumber" mode="chg-del">
  <xsl:call-template name="delete-as-div-no-id"/>
</xsl:template>

<xsl:template match="applicabilitySegment/interchangeability">
  <div>
    <xsl:call-template name="change"/>
    <xsl:apply-templates/>
  </div>
</xsl:template>

<xsl:template match="applicabilitySegment/interchangeability" mode="chg-del">
  <xsl:call-template name="delete-as-div-no-id"/>
</xsl:template>

<xsl:template match="genericPartData">
  <div>
    <xsl:if test="@genericPartDataName!='pwcsin'">
      <xsl:variable name="lbl" select="fn:getGenText(concat('gen-part-data-', @genericPartDataName))"/>
      <xsl:if test="$lbl!=''">
        <xsl:value-of select="$lbl"/><br/>
      </xsl:if>
      <xsl:apply-templates/>
    </xsl:if>
  </div>
</xsl:template>

<xsl:template match="genericPartDataValue">
  <xsl:apply-templates/>
</xsl:template>

<xsl:template name="uca-mv">
  <xsl:apply-templates select="applicabilitySegment/usableOnCodeAssy"/>
  <xsl:apply-templates select="locationRcmdSegment/locationRcmd/modelVersion"/>
</xsl:template>

<xsl:template match="usableOnCodeAssy">
  <div>
    <xsl:call-template name="change"/>
    <span style="font-weight:bold">*</span><xsl:apply-templates/>
  </div>
</xsl:template>

<xsl:template match="usableOnCodeAssy" mode="chg-del">
  <div>
    <span style="font-weight:bold">*</span><xsl:call-template name="delete-as-span"/>
  </div>
</xsl:template>

<xsl:template match="modelVersion">
  <div>
    <xsl:call-template name="change"/>
    <span style="font-weight:bold">&#x2022;</span><xsl:value-of select="@modelVersionValue"/>
  </div>
</xsl:template>

<xsl:template match="modelVersion" mode="chg-del">
  <div>
    <span style="font-weight:bold">&#x2022;</span><xsl:call-template name="delete-as-span"/>
  </div>
</xsl:template>

</xsl:stylesheet>

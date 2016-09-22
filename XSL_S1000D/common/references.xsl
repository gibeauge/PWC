<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:fn="http://www.pwc.ca"
    xmlns:xs="http://www.w3.org/2001/XMLSchema"
    xmlns:xlink="http://www.w3.org/1999/xlink"
    xmlns="http://www.w3.org/1999/xhtml"
    exclude-result-prefixes="xs fn xlink #default"
    version="2.0">
    
<!-- ************************************************************** -->

<xsl:template match="dmodule/content/refs" priority="5">
  <div class="s-refs">
    <table width="100%">
      <caption class="s-reqgroup-title">
        <xsl:value-of select="fn:getGenText('title-references')"/>
      </caption>
      <colgroup>
        <col width="40%"/>
        <col width="60%"/>
      </colgroup>
      <thead>
        <tr>
          <th><xsl:value-of select="fn:getGenText('refs-header-1')"/></th>
          <th><xsl:value-of select="fn:getGenText('refs-header-2')"/></th>
        </tr>
      </thead>
      <tbody>
        <xsl:choose>
          <xsl:when test="*">
            <xsl:apply-templates mode="refs"/>
          </xsl:when>
          <xsl:otherwise>
            <tr><td colspan="2"><xsl:value-of select="fn:getGenText('none')"/></td></tr>
          </xsl:otherwise>
        </xsl:choose>
      </tbody>
    </table>
  </div>
</xsl:template>

<xsl:template match="dmRef[dmRefIdent/dmCode]" mode="refs">
  <xsl:variable name="dmc" select="fn:getDMC(dmRefIdent/dmCode)"/>
  <xsl:variable name="file" select="key('dms', $dmc)/@file"/>
  <tr>
    <td>
      <a class="s-refs-link" href="{$file}.html">
        <xsl:value-of select="fn:getDMCBasic($dmc)"/>
      </a>
    </td>
    <td>
      <a class="s-refs-link" href="{$file}.html">
        <xsl:call-template name="get-dmref-title">
          <xsl:with-param name="dmc" select="$dmc"/>
        </xsl:call-template>
      </a>
    </td>
  </tr>
</xsl:template>

<xsl:template match="pmRef" mode="refs">
  <xsl:variable name="pmc" select="fn:getPMC(pmRefIdent/pmCode)"/>
  <tr>
    <td><xsl:value-of select="$pmc"/></td>
    <td>
      <xsl:choose>
        <xsl:when test="pmRefAddressItems/pmTitle">
          <xsl:apply-templates select="pmRefAddressItems/pmTitle" mode="refs"/>
        </xsl:when>
        <xsl:otherwise>
        </xsl:otherwise>
      </xsl:choose>
    </td>
  </tr>
</xsl:template>

<xsl:template match="pmTitle" mode="refs">
  <xsl:apply-templates/>
</xsl:template>

<xsl:template match="externalPubRef" mode="refs">
  <xsl:choose>
    <xsl:when test="@xlink:href">
      <xsl:call-template name="externalPubRef-link-refs"/>
    </xsl:when>
    <xsl:otherwise>
      <xsl:call-template name="externalPubRef-other-refs"/>
    </xsl:otherwise>
  </xsl:choose>  
</xsl:template>

<xsl:template name="externalPubRef-link-refs">
  <xsl:param name="target" select="@xlink:href"/>

  <tr>
    <td></td>
    <td>
      <a href="{$target}">
        <xsl:apply-templates select="externalPubRefIdent/externalPubTitle" mode="refs"/>
      </a>
    </td>
  </tr> 
</xsl:template>

<xsl:template name="externalPubRef-other-refs">
  <xsl:param name="externalPubCode" select="externalPubRefIdent/externalPubCode"/>

  <tr>
    <td>
      <xsl:value-of select="$externalPubCode"/>
    </td>
    <td>
      <xsl:apply-templates select="externalPubRefIdent/externalPubTitle" mode="refs"/>
    </td>
  </tr>  
</xsl:template>

<xsl:template match="externalPubTitle" mode="refs">
  <xsl:apply-templates/>
</xsl:template>

<!-- ************************************************************** -->

<xsl:template match="dmRef[@referredFragment and dmRefIdent/dmCode]" priority="5">
  <xsl:variable name="dmc" select="fn:getDMC(dmRefIdent/dmCode)"/>
  <xsl:variable name="file" select="key('dms', $dmc)/@file"/>
  <xsl:variable name="refid" select="@referredFragment"/>
  <xsl:variable name="target-node" select="key('ids', concat($dmc, '-', $refid))"/>
  
  <xsl:choose>
    <xsl:when test="not($target-node)">
      <xsl:next-match/>
    </xsl:when>
    <xsl:otherwise>
      <a class="s-link" href="{$file}.html#{$refid}">
        <xsl:call-template name="change"/>
        <xsl:call-template name="get-dmref-value">
          <xsl:with-param name="dmc" select="$dmc"/>
        </xsl:call-template>
        <xsl:value-of select="fn:getGenText('sep3')"/>
        <xsl:apply-templates select="$target-node" mode="internalRef"/>
      </a>
    </xsl:otherwise>
  </xsl:choose>
</xsl:template>

<xsl:template match="dmRef[dmRefIdent/dmCode]">
  <xsl:variable name="dmc" select="fn:getDMC(dmRefIdent/dmCode)"/>
  <xsl:variable name="file" select="key('dms', $dmc)/@file"/>
  <a class="s-link" href="{$file}.html">
    <xsl:call-template name="change"/>
    <xsl:call-template name="get-dmref-value">
      <xsl:with-param name="dmc" select="$dmc"/>
    </xsl:call-template>
  </a>
</xsl:template>

<xsl:template name="get-dmref-value">
  <xsl:param name="dmc"/>
  
  <!--
  <xsl:choose>
    <!-/- show DM title in Highlights -/->
    <xsl:when test="ancestor::dmInclusion[@inc='00U']">
      <xsl:call-template name="get-dmref-title">
        <xsl:with-param name="dmc" select="$dmc"/>
      </xsl:call-template>
    </xsl:when>
    <xsl:otherwise>
      <xsl:value-of select="fn:getDMCBasic($dmc)"/>
    </xsl:otherwise>
  </xsl:choose>
  -->
  <xsl:value-of select="fn:getDMCBasic($dmc)"/>
</xsl:template>

<xsl:template name="get-dmref-title">
  <xsl:param name="dmc" select="fn:getDMC(dmRefIdent/dmCode)"/>

  <xsl:choose>
    <xsl:when test="dmRefAddressItems/dmTitle">
      <xsl:apply-templates select="dmRefAddressItems/dmTitle" mode="dmref"/>
    </xsl:when>
    <xsl:otherwise>
      <xsl:apply-templates select="key('dms', $dmc)/dmodule/identAndStatusSection/dmAddress//dmTitle" mode="dmref"/>
    </xsl:otherwise>
  </xsl:choose>
</xsl:template>

<xsl:template match="dmTitle" mode="dmref">
  <!--xsl:choose>
    <xsl:when test="ancestor::dmInclusion[@inc='00S' or @inc='00U']"-->
      <xsl:apply-templates mode="dmref"/>
    <!--/xsl:when>
    <xsl:otherwise>
      <xsl:apply-templates select="techName" mode="dmref"/>
    </xsl:otherwise>
  </xsl:choose-->
</xsl:template>

<xsl:template match="techName" mode="dmref">
  <xsl:apply-templates/>
</xsl:template>

<xsl:template match="infoName" mode="dmref">
  <xsl:text>&#xa0;-&#x20;</xsl:text>
  <xsl:apply-templates/>
</xsl:template>

<!-- ************************************************************** -->

<xsl:template match="pmRef">
  <xsl:variable name="pmc" select="fn:getPMC(.//pmCode)"/>
  <xsl:variable name="dmc" select="if (@xlink:href) then concat('/', @xlink:href) else ''"/>
  <span>
    <xsl:call-template name="change"/>
    <xsl:choose>
      <xsl:when test="pmRefAddressItems">
        <xsl:apply-templates select="pmRefAddressItems"/>
      </xsl:when>
      <xsl:otherwise>
        <xsl:value-of select="concat($pmc, $dmc)"/>
      </xsl:otherwise>
    </xsl:choose>
  </span>
</xsl:template>

<xsl:template match="pmRefAddressItems">
  <xsl:apply-templates select="pmTitle"/>
  <xsl:apply-templates select="issueDate"/>
</xsl:template>

<xsl:template match="pmRefAddressItems/issueDate">
  <xsl:text>&#x20;(</xsl:text>
  <xsl:value-of select="@year"/>
  <xsl:text>-</xsl:text>
  <xsl:value-of select="@month"/>
  <xsl:text>-</xsl:text>
  <xsl:value-of select="@day"/>
  <xsl:text>)</xsl:text>
</xsl:template>
    
<xsl:template match="pmRefAddressItems/pmTitle">
  <xsl:apply-templates/>
</xsl:template>

<!--
<xsl:template match="pmRefAddressItems/shortPmTitle|pmRefAddressItems/pubMedia"/>
-->

<!-- ************************************************************** -->

<xsl:template match="externalPubRef" priority="5"> 
  <xsl:next-match/>
</xsl:template>

<xsl:template match="externalPubRef[@xlink:href]" priority="3">
  <a>
    <xsl:call-template name="change"/>
    <xsl:attribute name="href" select="@xlink:href"/>
    <xsl:next-match/>
  </a>
</xsl:template>

<xsl:template match="externalPubRef">
  <xsl:apply-templates/>
</xsl:template>

<xsl:template match="externalPubRefIdent">
  <xsl:apply-templates/>
</xsl:template>

<xsl:template match="externalPubCode">
  <xsl:if test="not(following-sibling::externalPubTitle)">
    <xsl:apply-templates/>
  </xsl:if>
</xsl:template>

<xsl:template match="externalPubTitle">
  <xsl:apply-templates/>
</xsl:template>

<xsl:template match="externalPubIssueInfo">
  <xsl:apply-templates/>
</xsl:template>

<xsl:template match="externalPubIssue">
  <xsl:text> (</xsl:text>
  <xsl:apply-templates/>
  <xsl:text>)</xsl:text>
</xsl:template>

<xsl:template match="externalPubRefAddressItems"/>

<!--
<xsl:template match="externalPubRefAddressItems/shortExternalPubTitle|externalPubRefAddressItems/pubMedia"/>
-->

<!-- ************************************************************** -->

<xsl:template match="internalRef">
    <xsl:variable name="refid"   select="@internalRefId"/>
    <xsl:variable name="reftype" select="if (@internalRefTargetType) then @internalRefTargetType else 'other'"/>
    <xsl:variable name="dmref"   select="ancestor::dmInclusion/@ref"/>
    <xsl:variable name="target-node" select="key('ids', concat($dmref, '-', $refid))"/>
    <xsl:choose>
      <xsl:when test="not($target-node)">
      </xsl:when>
      <xsl:otherwise>
        <xsl:choose>
          <xsl:when test="$reftype='other'">
            <a class="s-anchor" href="{concat('#', $refid)}">
              <xsl:call-template name="link-tooltip"/>
              <xsl:choose>
                <xsl:when test="string-length(normalize-space(.))=0">
                  <xsl:value-of select="$target-node/name()"/>
                </xsl:when>
                <xsl:otherwise>
                  <xsl:apply-templates/>
                </xsl:otherwise>
              </xsl:choose>
            </a>
          </xsl:when>
          <xsl:when test="$reftype='figure'">
            <xsl:variable name="id" select="$target-node/@id"/>
            <a class="x--sfe-InternalLink-1-0" href="#none" onclick="{concat('displayGraphics(', $quot, $id, $quot, ')')}">
              <xsl:call-template name="link-tooltip"/>
              <xsl:apply-templates select="$target-node" mode="internalRef"/>
            </a>
          </xsl:when>
          <xsl:when test="$reftype='graphic'">
            <xsl:variable name="id" select="$target-node/../@id"/>
            <a class="x--sfe-InternalLink-1-0" href="#none" onclick="{concat('displayGraphics(', $quot, $id, $quot, ')')}">
              <xsl:call-template name="link-tooltip"/>
              <xsl:apply-templates select="$target-node" mode="internalRef"/>
            </a>
          </xsl:when>
          <xsl:when test="$reftype='table'">
            <xsl:variable name="id" select="$target-node/generate-id(.)"/>
            <a class="s-anchor" href="#{$id}" onclick="toggle('{$id}', '{$id}')">
              <xsl:call-template name="link-tooltip"/>
              <xsl:apply-templates select="$target-node" mode="internalRef"/>
            </a>
          </xsl:when>
          <xsl:when test="$reftype='hotspot'">
            <xsl:variable name="id" select="$target-node/ancestor::figure/@id"/>
            <!--a class="s-anchor" href="#none" onclick="{concat('displayGraphics(', $quot, $id, $quot, '); go(', $quot, $refid, $quot, ')')}"-->
            <a class="s-anchor" href="#none" onclick="{concat('displayGraphics(', $quot, $id, $quot, ')')}">
              <xsl:call-template name="link-tooltip"/>
              <xsl:apply-templates select="$target-node" mode="internalRef"/>
              <!--xsl:text> </xsl:text-->
              <xsl:apply-templates/>
            </a>
          </xsl:when>
          <xsl:otherwise>
            <a class="s-anchor" href="{concat('#', $refid)}">
              <xsl:call-template name="link-tooltip"/>
              <xsl:apply-templates select="$target-node" mode="internalRef">
                <xsl:with-param name="target-title" select="@targetTitle"/>
              </xsl:apply-templates>
            </a>
          </xsl:otherwise>
      </xsl:choose>
    </xsl:otherwise>
  </xsl:choose>
</xsl:template>

<xsl:template name="link-tooltip">
  <xsl:if test="@targetTitle">
    <xsl:attribute name="title"><xsl:value-of select="@targetTitle"/></xsl:attribute>
  </xsl:if>
</xsl:template>

<xsl:template match="levelledPara" mode="internalRef">
  <xsl:value-of select="fn:getGenText('internalRef-para')"/>
  <xsl:text>&#xa0;</xsl:text>
  <xsl:apply-templates select="." mode="numbering"/>
  <!--
  <xsl:if test="title">
    <xsl:text>&#xa0;</xsl:text>
    <xsl:apply-templates select="title" mode="internalRef"/>
  </xsl:if>
  -->
</xsl:template>

<xsl:template match="levelledPara/title" mode="internalRef">
  <xsl:apply-templates/>
</xsl:template>
    
<xsl:template match="para" mode="internalRef">
  <xsl:param name="target-title" select="''"/>
  
  <xsl:value-of select="if ($target-title!='') then $target-title else fn:getGenText('internalRef-para')"/>
</xsl:template>

<xsl:template match="figure" mode="internalRef">
    <xsl:value-of select="fn:getGenText('internalRef-figure')"/>
    <xsl:text>&#xa0;</xsl:text>
    <xsl:apply-templates select="." mode="numbering"/>
    <!--
    <xsl:text>&#xa0;</xsl:text>
    <xsl:apply-templates select="title" mode="internalRef"/>
    -->
</xsl:template>

<xsl:template match="figure/title" mode="internalRef">
  <xsl:apply-templates/>
</xsl:template>

<xsl:template match="graphic" mode="internalRef">
  <xsl:apply-templates select="ancestor::figure" mode="internalRef"/>
  <!--xsl:if test="count(ancestor::figure/graphic) > 1">
    <xsl:text>, </xsl:text>
    <xsl:value-of select="fn:getGenText('internalRef-sheet')"/>
    <xsl:text> </xsl:text>
    <xsl:apply-templates select="." mode="numbering"/>
  </xsl:if-->
</xsl:template>

<xsl:template match="hotspot" mode="internalRef">
  <!--xsl:attribute name="href" select="concat('#', @id, '_', @applicationStructureName)"/>
  
  <xsl:apply-templates select="ancestor::figure" mode="internalRef"/-->
  <!--
  <xsl:text> [</xsl:text>
  <xsl:apply-templates select="." mode="numbering"/>
  <xsl:text>]</xsl:text>
  -->
</xsl:template>

<xsl:template match="table" mode="internalRef">
  <xsl:value-of select="fn:getGenText('internalRef-table')"/>
  <xsl:text>&#xa0;</xsl:text>
  <xsl:apply-templates select="." mode="numbering"/>
</xsl:template>

<xsl:template match="proceduralStep" mode="internalRef">
  <xsl:value-of select="fn:getGenText('internalRef-step')"/>
  <xsl:text>&#xa0;</xsl:text>
  <xsl:apply-templates select="." mode="numbering"/>
</xsl:template>
    
<xsl:template match="spareDescr|supplyDescr|supportEquipDescr" mode="internalRef">
  <xsl:param name="target-title" select="''"/>

  <xsl:choose>
    <xsl:when test="identNumber">
      <xsl:text> (</xsl:text>
      <xsl:apply-templates select="identNumber" mode="internalRef"/>
      <xsl:text>)</xsl:text>
    </xsl:when>
    <xsl:otherwise>
      <xsl:value-of select="if ($target-title!='') then $target-title else fn:getGenText(concat('internalRef-',name()))"/>
    </xsl:otherwise>
  </xsl:choose>
</xsl:template>

<xsl:template match="identNumber" mode="internalRef">
  <xsl:apply-templates select="manufacturerCode" mode="internalRef"/>
  <xsl:apply-templates select="partAndSerialNumber/partNumber" mode="internalRef"/>
</xsl:template>

<xsl:template match="manufacturerCode" mode="internalRef">
  <xsl:apply-templates/>
</xsl:template>

<xsl:template match="partNumber" mode="internalRef">
  <xsl:text>/</xsl:text>
  <xsl:apply-templates/>
</xsl:template>

<xsl:template match="footnote" mode="internalRef">
  <sup>
    <a class="s-anchor" href="{concat('#', @id)}">
      <xsl:text>(</xsl:text>
      <xsl:apply-templates select="." mode="numbering"/>
      <xsl:text>)</xsl:text>  
    </a>
  </sup>
</xsl:template>

<xsl:template match="reasonForUpdate|changeInline|accessRef|zoneRef" mode="internalRef">
  <xsl:apply-templates/>
</xsl:template>

<xsl:template match="multimedia" mode="internalRef">
  <xsl:choose>
    <xsl:when test="title">
      <xsl:apply-templates select="title" mode="internalRef"/>
    </xsl:when>
    <xsl:otherwise>
      <xsl:value-of select="fn:getGenText('internalRef-multimedia')"/>
    </xsl:otherwise>
  </xsl:choose>
</xsl:template>

<xsl:template match="multimediaObject" mode="internalRef">
  <xsl:param name="target-title" select="''"/>
  
  <xsl:apply-templates select="ancestor::multimedia" mode="internalRef"/>
  <xsl:value-of select="if ($target-title!='') then concat(fn:getGenText('sep3'), $target-title) else ''"/>
</xsl:template>

<xsl:template match="parameter" mode="internalRef">
  <xsl:param name="target-title" select="''"/>
  
  <xsl:apply-templates select="ancestor::multimedia" mode="internalRef"/>
  <xsl:value-of select="if ($target-title!='') then concat(fn:getGenText('sep3'), $target-title) else ''"/>
</xsl:template>

<xsl:template match="*" mode="internalRef">
  <xsl:apply-templates/>
</xsl:template>

<xsl:template match="footnoteRef">
  <xsl:apply-templates select="ancestor::table//footnote[@id = current()/@internalRefId]" mode="internalRef"/>
</xsl:template>

</xsl:stylesheet>

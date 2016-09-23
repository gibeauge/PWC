<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:fn="http://www.pwc.ca"
    xmlns:xs="http://www.w3.org/2001/XMLSchema"
    xmlns:xlink="http://www.w3.org/1999/xlink"
    xmlns="http://www.w3.org/1999/xhtml"
    exclude-result-prefixes="xs fn xlink #default"
    version="2.0">

<xsl:template match="accessPointRef|acronymDefinition|captionText|changeInline|circuitBreakerRef|
                     controlIndicatorRef|emphasis|functionalItemRef|identNumber|manufacturerCode|
                     name|partNumber|verbatimText|zoneRef|dmRef|pmRef|externalPubRef" mode="chg-del">
  <xsl:call-template name="delete-as-span"/>
</xsl:template>

<xsl:template match="accessPointRef">
  <span>
    <xsl:call-template name="setID"/>
    <xsl:call-template name="change"/>
    <xsl:value-of select="fn:getGenText('accessPointRef')"/>
    <xsl:value-of select="@accessPointNumber"/>
    <xsl:apply-templates/>
  </span>
</xsl:template>

<xsl:template match="acronym" mode="chg-del">
  <xsl:call-template name="delete-as-span"/>
</xsl:template>

<xsl:template match="acronym">
  <span>
    <xsl:call-template name="setID"/>
    <xsl:call-template name="change"/>
    <xsl:call-template name="brex-disabled-tooltip"/>
    <xsl:apply-templates select="acronymDefinition"/>
    <xsl:apply-templates select="acronymTerm"/>
  </span>
</xsl:template>

<xsl:template match="acronymDefinition">
  <span>
    <xsl:call-template name="setID"/>
    <xsl:call-template name="change"/>
    <xsl:apply-templates/>
    <xsl:text>&#032;</xsl:text>
  </span>
</xsl:template>

<xsl:template match="acronymTerm[ancestor::acronym]">
    <xsl:text>(</xsl:text>
    <xsl:apply-templates/>
    <xsl:text>)</xsl:text>
</xsl:template>

<xsl:template match="acronymTerm[not(ancestor::acronym)]">
    <xsl:apply-templates/>
</xsl:template>

<!-- link behavior - do nothing -->
<xsl:template match="behavior"></xsl:template>

<xsl:template match="caption" priority="20">
  <xsl:variable name="style">
    <xsl:if test="@captionWidth">
      <xsl:text>min-width: </xsl:text><xsl:value-of select="@captionWidth"/>;
      <xsl:text>width: </xsl:text><xsl:value-of select="@captionWidth"/>;
    </xsl:if>
    <xsl:if test="@captionHeight">
      <xsl:text>min-height: </xsl:text><xsl:value-of select="@captionHeight"/>;
    </xsl:if>
    <xsl:choose>
      <xsl:when test="@alignCaption">
        <xsl:text>text-align: </xsl:text><xsl:value-of select="@alignCaption"/><xsl:text>;</xsl:text>
      </xsl:when>
      <xsl:otherwise>
        <xsl:text>text-align: center;</xsl:text>
      </xsl:otherwise>
    </xsl:choose>
    <xsl:if test="ancestor::listItem and not(preceding-sibling::text() or preceding-sibling::*)"><xsl:text>margin-top: -1em;</xsl:text></xsl:if>
  </xsl:variable>
  <xsl:if test="ancestor::listItem and not(preceding-sibling::text() or preceding-sibling::*)"><xsl:text>&#160;</xsl:text></xsl:if>
  <div>
    <xsl:attribute name="style" select="$style"/>
    <xsl:variable name="class">
      <xsl:choose>
        <xsl:when test="@color = 'co01'">
          <xsl:text>s-caption s-caption-green</xsl:text>
        </xsl:when>
        <xsl:when test="@color = 'co02'">
          <xsl:text>s-caption s-caption-amber</xsl:text>
        </xsl:when>
        <xsl:when test="@color = 'co03'">
          <xsl:text>s-caption s-caption-yellow</xsl:text>
        </xsl:when>
        <xsl:when test="@color = 'co04'">
          <xsl:text>s-caption s-caption-red</xsl:text>
        </xsl:when>
        <xsl:when test="@color = 'co07'">
          <xsl:text>s-caption s-caption-white</xsl:text>
        </xsl:when>
        <xsl:when test="@color = 'co08'">
          <xsl:text>s-caption s-caption-grey</xsl:text>
        </xsl:when>
        <xsl:otherwise>
          <xsl:text>s-caption</xsl:text>
        </xsl:otherwise>
      </xsl:choose>
    </xsl:variable>
    <xsl:call-template name="change">
      <xsl:with-param name="class" select="$class"/>
    </xsl:call-template>
    <xsl:call-template name="setID"/>
    <xsl:call-template name="brex-disabled-tooltip"/>
    <xsl:next-match/>
  </div>
</xsl:template>

<xsl:template match="caption">
  <xsl:apply-templates/>
</xsl:template>

<xsl:template match="caption" mode="chg-del">
  <xsl:call-template name="delete"/>
</xsl:template>

<xsl:template match="captionLine">
  <div>
    <xsl:if test="ancestor::caption[@captionHeight]">
      <xsl:attribute name="style">
        <xsl:text>line-height: </xsl:text>
        <xsl:value-of select="ancestor::caption/@captionHeight"/>
        <xsl:text>px;</xsl:text>
      </xsl:attribute>
    </xsl:if>
    <xsl:apply-templates/>
  </div>
</xsl:template>

<xsl:template match="captionText">
  <span>
    <xsl:call-template name="change"/>
    <xsl:apply-templates/>
  </span>
</xsl:template>

<xsl:template match="captionGroup">
  <div>
    <xsl:call-template name="setGenID"/>
    <xsl:call-template name="change">
      <xsl:with-param name="class" select="'s-captionGroup'"/>
    </xsl:call-template>
    <xsl:call-template name="brex-disabled-tooltip"/>
    <xsl:choose>
      <xsl:when test="@changeType='delete'">
        <xsl:call-template name="delete"/>
      </xsl:when>
      <xsl:otherwise>
        <table>
          <colgroup>
            <xsl:apply-templates select="colspec"/>
          </colgroup>
          <xsl:apply-templates select="captionBody"/>
        </table>
      </xsl:otherwise>
    </xsl:choose>
  </div>
</xsl:template>

<!-- link to a CSN - simple processing for now -->
<xsl:template match="catalogSeqNumberRef">
  <xsl:value-of select="fn:getGenText('refer-to')"/>
  <xsl:text> </xsl:text>
  <xsl:value-of select="@catalogSeqNumberValue"/>
</xsl:template>

<xsl:template match="changeInline">
  <span>
    <xsl:call-template name="setID"/>
    <xsl:call-template name="change"/>
    <xsl:apply-templates/>
  </span>
</xsl:template>

<xsl:template match="circuitBreakerRef">
  <span>
    <xsl:call-template name="setID"/>
    <xsl:call-template name="change"/>
    <xsl:if test="@circuitBreakerAction">
      <xsl:value-of select="fn:getGenText(concat('cb-', @circuitBreakerAction))"/>
    </xsl:if>
    <xsl:value-of select="fn:getGenText('circuitBreakerRef')"/>
    <xsl:value-of select="@circuitBreakerNumber"/>
    <xsl:apply-templates/>
  </span>
</xsl:template>
   
<xsl:template match="controlIndicatorRef">
  <span>
    <xsl:call-template name="setID"/>
    <xsl:call-template name="change"/>
        <xsl:value-of select="fn:getGenText('controlIndicatorRef')"/>
    <xsl:value-of select="@controlIndicatorNumber"/>
    <xsl:apply-templates/>
  </span>
</xsl:template>

<xsl:template match="emphasis">
  <span>
    <xsl:call-template name="change"/>
    <xsl:choose>
      <xsl:when test="not(@emphasisType) or @emphasisType='em01'">
        <b><xsl:apply-templates/></b>
      </xsl:when>
      <xsl:when test="@emphasisType='em02'">
        <i><xsl:apply-templates/></i>
      </xsl:when>
      <xsl:when test="@emphasisType='em03'">
        <span style="text-decoration: underline;"><xsl:apply-templates/></span>
      </xsl:when>
      <xsl:when test="@emphasisType='em04'">
        <span style="text-decoration: overline;"><xsl:apply-templates/></span>
      </xsl:when>
      <xsl:when test="@emphasisType='em05'">
        <s><xsl:apply-templates/></s>
      </xsl:when>
      <xsl:otherwise>
        <xsl:apply-templates/>
      </xsl:otherwise>
    </xsl:choose>
  </span>
</xsl:template>

<!-- display graphic only for title page -->
<xsl:template match="figure[ancestor::dmInclusion/@is-tp='true']" priority="25">
  <div>
    <xsl:call-template name="setID"/>
    <xsl:call-template name="change"/>  
    <div id="{generate-id(.)}">
      <xsl:apply-templates select="graphic"/>
    </div>
  </div>
</xsl:template>

<xsl:template match="graphic[ancestor::dmInclusion/@is-tp='true']" priority="25">
  <div class="s-tp-graphic">
    <xsl:call-template name="setID"/>
    <img alt="Graphic" src="{concat($graphics-path, '/', @entityPath)}" style="max-width: 100%;">
      <xsl:if test="@xlink:title">
        <xsl:attribute name="alt" select="@xlink:title"/>
      </xsl:if>
      <xsl:if test="@reproductionWidth">
        <xsl:attribute name="width" select="@reproductionWidth"/>
      </xsl:if>
      <xsl:if test="@reproductionHeight">
        <xsl:attribute name="height" select="@reproductionHeight"/>
      </xsl:if>
    </img>
  </div>
  <xsl:apply-templates select="hotspot"/>
</xsl:template>

<xsl:template match="figure" priority="20">
  <div class="pr-brk"></div>
  <xsl:if test="parent::illustratedPartsCatalog">
  <br />
    <xsl:apply-templates select="title" />
  </xsl:if>
  <div style="display:none;">
    <xsl:call-template name="setID"/>
    <xsl:call-template name="change">
      <xsl:with-param name="class" select="concat($css-pfx, 'figure', $css-sfx)"/>
    </xsl:call-template>
    <div class="pr-figure" id="{generate-id(.)}">
      <xsl:next-match/>
    </div>
  </div>
  <xsl:if test="parent::illustratedPartsCatalog">
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
  </xsl:if>
</xsl:template>

<xsl:template match="figure">
  <xsl:apply-templates/>
</xsl:template>

<xsl:template match="figure/title">
  <div class="s-figure-title">
    <xsl:value-of select="fn:getGenText('title-figure')"/>
    <xsl:text>&#xa0;</xsl:text>
    <xsl:apply-templates select=".." mode="numbering"/>
    <xsl:text> </xsl:text>
    <xsl:apply-templates/>
  </div>
</xsl:template>

<xsl:template match="figure" mode="chg-del">
  <div class="s-figure-title">
    <xsl:value-of select="fn:getGenText('title-figure')"/>
    <xsl:text>&#xa0;</xsl:text>
    <xsl:apply-templates select="." mode="numbering"/>
    <xsl:text> </xsl:text>
    <xsl:call-template name="delete"/>
  </div>
</xsl:template>

<xsl:template match="foldout">
  <xsl:apply-templates/>
</xsl:template>

<xsl:template match="footnote" priority="20">
  <div>
    <xsl:call-template name="setID"/>
    <xsl:call-template name="change">
      <xsl:with-param name="class" select="'s-footnote'"/>
    </xsl:call-template>
    <div class="s-footnote-nb">
      <sup>
        <xsl:apply-templates select="." mode="numbering"/>  
      </sup>
    </div>
    <div>
      <xsl:call-template name="change">
        <xsl:with-param name="class" select="'s-footnote-c'"/>
      </xsl:call-template>
      <xsl:next-match/>
    </div>  
  </div>
</xsl:template>

<xsl:template match="footnote">
  <xsl:apply-templates/>
</xsl:template>

<xsl:template match="footnote" mode="chg-del">
  <xsl:call-template name="delete"/>
</xsl:template>

<xsl:template match="functionalItemRef">
  <span>
    <xsl:call-template name="setID"/>
    <xsl:call-template name="change"/>
    <!--xsl:text>(</xsl:text-->
    <xsl:value-of select="fn:getGenText('functionalItemRef')"/>
    <xsl:if test="@manufacturerCodeValue">
      <xsl:value-of select="@manufacturerCodeValue"/>
      <xsl:text>/</xsl:text>
    </xsl:if>
    <xsl:value-of select="@functionalItemNumber"/>
    <xsl:apply-templates/>
    <!--xsl:text>)</xsl:text-->
  </span>
</xsl:template>

<xsl:template match="graphic">
  <div>
    <xsl:call-template name="change">
      <xsl:with-param name="class" select="concat($css-pfx, 'graphic', $css-sfx)"/>
    </xsl:call-template>
    <xsl:call-template name="setID"/>
    <img alt="Graphic" src="{concat($graphics-path, '/', @entityPath)}" style="max-width: 100%;">
      <xsl:if test="@xlink:title">
        <xsl:attribute name="alt" select="@xlink:title"/>
      </xsl:if>
      <xsl:if test="@reproductionWidth">
        <xsl:attribute name="width" select="@reproductionWidth"/>
      </xsl:if>
      <xsl:if test="@reproductionHeight">
        <xsl:attribute name="height" select="@reproductionHeight"/>
      </xsl:if>
    </img>
  </div>
  <xsl:apply-templates select="hotspot"/>
  <div class="pr-brk-after"></div>
</xsl:template>

<xsl:template match="graphic" mode="chg-del">
  <xsl:call-template name="delete-as-div"/>
  <div class="pr-brk-after"></div>
</xsl:template>

<xsl:template match="hotspot">
  <div class="s-hotspot">
    <xsl:call-template name="setID"/>
    <xsl:value-of select="concat(@applicationStructureName, ' ', @hotspotTitle)"/>
  </div>
</xsl:template>

<xsl:template match="identNumber">
  <span>
    <xsl:call-template name="change"/>
    <xsl:value-of select="fn:getGenText('identNumber')"/>
    <xsl:apply-templates/>
  </span>
</xsl:template>

<xsl:template match="indexFlag">
</xsl:template>

<xsl:template match="inlineSignificantData">
  <strong>
    <xsl:call-template name="brex-disabled-tooltip"/>
    <xsl:apply-templates/>
  </strong>
</xsl:template>

<xsl:template match="legend">
  <div>
    <xsl:call-template name="setID"/>
    <xsl:call-template name="change"/>
    <xsl:if test="parent::figure">
      <xsl:call-template name="brex-disabled-tooltip"/>
    </xsl:if>
    <xsl:apply-templates/>
  </div>
</xsl:template>

<xsl:template match="legend" mode="chg-del">
  <xsl:call-template name="delete-as-div"/>
</xsl:template>

<xsl:template match="manufacturerCode">
  <span>
    <xsl:call-template name="setID"/>
    <xsl:call-template name="change"/>
    <xsl:apply-templates/>
  </span>
</xsl:template>

<xsl:template match="multimedia">
  <div>
    <xsl:call-template name="setID"/>
    <xsl:call-template name="change">
      <xsl:with-param name="class" select="'s-multimedia'"/>
    </xsl:call-template>
    <xsl:apply-templates/>
  </div>
</xsl:template>

<xsl:template match="multimedia" mode="chg-del">
  <div class="">
    <xsl:call-template name="setID"/>
    <xsl:call-template name="change">
      <xsl:with-param name="class" select="'s-multimedia'"/>
    </xsl:call-template>
    <xsl:value-of select="fn:getGenText('title-multimedia')"/>
    <xsl:value-of select="fn:getGenText('sep1')"/>
    <xsl:call-template name="delete"/>
  </div>
</xsl:template>

<xsl:template match="multimedia/title">
  <span class="s-multimedia-title">
    <xsl:value-of select="fn:getGenText('title-multimedia')"/>
    <xsl:value-of select="fn:getGenText('sep1')"/>
    <xsl:apply-templates/>
  </span>
</xsl:template>

<!-- just create a link to the file -->
<xsl:template match="multimediaObject">
  <span>
    <xsl:call-template name="setID"/>
    <xsl:call-template name="change">
      <xsl:with-param name="class" select="'s-multimedia-obj'"/>
    </xsl:call-template>
    <a href="{concat($graphics-path, '/', @entityPath)}">
      <xsl:value-of select="if (@xlink:title) then @xlink:title else fn:getGenText(concat('title-multimedia-', @multimediaType))"/>
    </a>
    <xsl:if test="following-sibling::multimediaObject">
      <xsl:value-of select="fn:getGenText('sep3')"/>
    </xsl:if>
  </span>
</xsl:template>

<xsl:template match="multimediaObject" mode="chg-del">
  <xsl:call-template name="delete-as-span">
    <xsl:with-param name="class" select="'s-multimedia-obj'"/>
  </xsl:call-template>
</xsl:template>

<xsl:template match="multimediaObject/parameter"></xsl:template>

<xsl:template match="name">
  <span>
    <xsl:call-template name="change"/>
    <xsl:text>, </xsl:text>
    <xsl:apply-templates/>
  </span>
</xsl:template>
    
<xsl:template match="para">
  <div>
    <xsl:call-template name="setID"/>
      <xsl:call-template name="change">
      <xsl:with-param name="class" select="'s-para'"/>
    </xsl:call-template>
    <xsl:apply-templates/>
  </div>
</xsl:template>

<xsl:template match="para" mode="chg-del">
  <xsl:call-template name="delete-as-div">
    <xsl:with-param name="class" select="'s-para'"/>
  </xsl:call-template>
</xsl:template>
    
<xsl:template match="partAndSerialNumber">
  <xsl:apply-templates/>
</xsl:template>

<xsl:template match="partNumber" priority="5">
  <span>
    <xsl:call-template name="change"/>
    <xsl:text>/</xsl:text>
    <!--xsl:text>&#032;</xsl:text>-->
    <xsl:next-match/>
    <!--<xsl:text>&#032;</xsl:text>-->
  </span>
</xsl:template>

<xsl:template match="partNumber">
  <xsl:apply-templates/>
</xsl:template>

<xsl:template match="quantity">
  <span>
    <xsl:call-template name="brex-disabled-tooltip"/>
    <xsl:choose>
      <xsl:when test=".=''"></xsl:when>
      <xsl:when test="contains(., '-') or contains(., ' to ')">
        <xsl:variable name="min">
          <xsl:choose>
            <xsl:when test="contains(., '-')"><xsl:value-of select="number(substring-before(normalize-space(.), '-'))"/></xsl:when>
            <xsl:otherwise><xsl:value-of select="number(substring-before(normalize-space(.), ' to'))"/></xsl:otherwise>
          </xsl:choose>
        </xsl:variable>
        <xsl:variable name="max">
          <xsl:choose>
            <xsl:when test="contains(., '-')"><xsl:value-of select="number(substring-after(normalize-space(.), '-'))"/></xsl:when>
            <xsl:otherwise><xsl:value-of select="number(substring-after(normalize-space(.), 'to '))"/></xsl:otherwise>
          </xsl:choose>                    
        </xsl:variable>
        <xsl:value-of select="concat($min, fn:getGenText('qty_max'), $max)"/>
        <xsl:choose>
          <xsl:when test="@quantityType='qty01'">
            <xsl:variable name="convertMin" select="$min * 1.3558"/>
            <xsl:variable name="convertMax" select="$max * 1.3558"/>
            <xsl:value-of select="concat(' ', fn:getGenText('qty_footPound'), ' ')"/>
            <xsl:text>(</xsl:text>
            <xsl:value-of select="format-number($convertMin, '####.0')"/>
            <xsl:value-of select="fn:getGenText('qty_max')"/>
            <xsl:value-of select="format-number($convertMax, '####.0')"/>
            <xsl:text> Nm)</xsl:text>
          </xsl:when>
          <xsl:when test="@quantityType='qty02'">
            <xsl:variable name="convertMin" select="$min * 0.113"/>
            <xsl:variable name="convertMax" select="$max * 0.113"/>
            <xsl:value-of select="concat(' ', fn:getGenText('qty_inchPound'), ' ')"/>
            <xsl:text>(</xsl:text>
            <xsl:value-of select="format-number($convertMin, '####.0')"/>
            <xsl:value-of select="fn:getGenText('qty_max')"/>
            <xsl:value-of select="format-number($convertMax, '####.0')"/>
            <xsl:text> Nm)</xsl:text>
          </xsl:when>
          <xsl:when test="@quantityType='qty03'">
            <xsl:variable name="convertMin" select="$min * 25.4"/>
            <xsl:variable name="convertMax" select="$max * 25.4"/>
            <xsl:value-of select="concat(' ', fn:getGenText('qty_inch'), ' ')"/>
            <xsl:text>(</xsl:text>
            <xsl:value-of select="format-number($convertMin, '####.0')"/>
            <xsl:value-of select="fn:getGenText('qty_max')"/>
            <xsl:value-of select="format-number($convertMax, '####.0')"/>
            <xsl:text> mm)</xsl:text>
          </xsl:when>
          <xsl:when test="@quantityType='qty04'">
            <xsl:variable name="convertMin" select="$min * 453.6"/>
            <xsl:variable name="convertMax" select="$max * 453.6"/>
            <xsl:value-of select="concat(' ', fn:getGenText('qty_pounds'), ' ')"/>
            <xsl:text>(</xsl:text>
            <xsl:value-of select="format-number($convertMin, '####.0')"/>
            <xsl:value-of select="fn:getGenText('qty_max')"/>
            <xsl:value-of select="format-number($convertMax, '####.0')"/>
            <xsl:value-of select="concat(' ', fn:getGenText('qty_grams'))"/>
            <xsl:text>)</xsl:text>
          </xsl:when>
        </xsl:choose>
      </xsl:when>
      <xsl:otherwise>
        <xsl:apply-templates/>
        <xsl:choose>
          <xsl:when test="@quantityType='qty01'">
            <xsl:variable name="convertValue" select="number(normalize-space(.)) * 1.3558"/>
            <xsl:value-of select="concat(' ', fn:getGenText('qty_footPound'), ' ')"/>
            <xsl:text>(</xsl:text>
            <xsl:value-of select="format-number($convertValue, '####.0')"/>
            <xsl:text> Nm)</xsl:text>
          </xsl:when>
          <xsl:when test="@quantityType='qty02'">
            <xsl:variable name="convertValue" select="number(normalize-space(.)) * 0.113"/>
            <xsl:value-of select="concat(' ', fn:getGenText('qty_inchPound'), ' ')"/>
            <xsl:text>(</xsl:text>
            <xsl:value-of select="format-number($convertValue, '####.0')"/>
            <xsl:text> Nm)</xsl:text>
          </xsl:when>
          <xsl:when test="@quantityType='qty03'">
            <xsl:variable name="convertValue" select="number(normalize-space(.)) * 25.4"/>
            <xsl:value-of select="concat(' ', fn:getGenText('qty_inch'), ' ')"/>
            <xsl:text>(</xsl:text>
            <xsl:value-of select="format-number($convertValue, '####.0')"/>
            <xsl:text> mm)</xsl:text>
          </xsl:when>
          <xsl:when test="@quantityType='qty04'">
            <xsl:variable name="convertValue" select="number(normalize-space(.)) * 453.6"/>
            <xsl:value-of select="concat(' ', fn:getGenText('qty_pounds'), ' ')"/>
            <xsl:text>(</xsl:text>
            <xsl:value-of select="format-number($convertValue, '####.0')"/>
            <xsl:value-of select="concat(' ', fn:getGenText('qty_grams'))"/>
            <xsl:text>)</xsl:text>
          </xsl:when>
        </xsl:choose>
      </xsl:otherwise>
    </xsl:choose>
  </span>
</xsl:template>

<xsl:template match="quantityGroup">
  <xsl:choose>
    <xsl:when test="@quantityGroupType = 'minimum'">
      <xsl:value-of select="fn:getGenText('qty_min')"/>
    </xsl:when>
    <xsl:when test="@quantityGroupType = 'maximum'">
      <xsl:value-of select="fn:getGenText('qty_max')"/>
    </xsl:when>
  </xsl:choose>
  <xsl:apply-templates/>
</xsl:template>

<xsl:template match="quantityTolerance">
  <xsl:if test="preceding-sibling::node()[1][self::quantityTolerance]">
    <xsl:text> </xsl:text>
  </xsl:if>
  <xsl:choose>
    <xsl:when test="@quantityToleranceType = 'minus'">&#8722;</xsl:when>
    <xsl:when test="@quantityToleranceType = 'plus'">+</xsl:when>
    <xsl:otherwise>&#177;</xsl:otherwise>
  </xsl:choose>
  <xsl:apply-templates/>
  <xsl:choose>
    <xsl:when test="@quantityUnitOfMeasure">
      <xsl:text>&#xa0;</xsl:text>
      <xsl:value-of select="@quantityUnitOfMeasure"/>
    </xsl:when>
    <xsl:when  test="../@quantityUnitOfMeasure">
      <xsl:text>&#xa0;</xsl:text>
      <xsl:value-of select="../@quantityUnitOfMeasure"/>
    </xsl:when>
  </xsl:choose>
</xsl:template>

<xsl:template match="quantityValue">
  <xsl:if test="preceding-sibling::node()[1][self::quantityValue]">
    <xsl:text> </xsl:text>
  </xsl:if>
  <xsl:apply-templates/>
  <xsl:choose>
    <xsl:when test="@quantityUnitOfMeasure">
      <xsl:text>&#xa0;</xsl:text>
      <xsl:value-of select="@quantityUnitOfMeasure"/>
    </xsl:when>
    <xsl:when  test="../@quantityUnitOfMeasure">
      <xsl:text>&#xa0;</xsl:text>
      <xsl:value-of select="../@quantityUnitOfMeasure"/>
    </xsl:when>
  </xsl:choose>
</xsl:template>

<!-- reason for amendment in graphics - delete it for now -->
<xsl:template match="reasonForAmendment"></xsl:template>

<xsl:template match="dmodule//refs">
  <xsl:text>&#032;</xsl:text>
  <xsl:apply-templates/>
</xsl:template>

<xsl:template match="serialNumber">
  <xsl:text>&#032;</xsl:text>
  <xsl:value-of select="fn:getGenText('serialNumber')"/>
  <xsl:value-of select="@serialNumberValue"/>
  <xsl:text>&#032;</xsl:text>
</xsl:template>

<xsl:template match="simplePara">
  <div>
    <xsl:call-template name="setID"/>
      <xsl:call-template name="change">
      <xsl:with-param name="class" select="'s-simple-para'"/>
    </xsl:call-template>
    <xsl:apply-templates/>
  </div>
</xsl:template>

<xsl:template match="simplePara" mode="chg-del">
  <xsl:call-template name="delete-as-div">
    <xsl:with-param name="class" select="'s-simple-para'"/>
  </xsl:call-template>
</xsl:template>

<xsl:template match="subScript">
  <sub><xsl:apply-templates/></sub>
</xsl:template>

<xsl:template match="superScript">
  <sup><xsl:apply-templates/></sup>
</xsl:template>

<xsl:template match="symbol">
  <img src="{concat($graphics-path, '/', @entityPath)}" style="max-width: 100%;">
    <xsl:attribute name="alt">
      <xsl:if test="@xlink:title">
        <xsl:value-of select="@xlink:title"/>
      </xsl:if>
    </xsl:attribute>
    <xsl:if test="@reproductionWidth">
      <xsl:attribute name="width" select="@reproductionWidth"/>
    </xsl:if>
    <xsl:if test="@reproductionHeight">
      <xsl:attribute name="height" select="@reproductionHeight"/>
    </xsl:if>
    <xsl:attribute name="class" select="'s-symbol'"/>
  </img>
</xsl:template>

<xsl:template match="title" priority="0">
  <div class="s-title">
    <xsl:apply-templates/>
  </div>
</xsl:template>

<xsl:template match="verbatimText">
  <span>
    <pre><xsl:call-template name="change"/><xsl:apply-templates/></pre>
  </span>
</xsl:template>

<xsl:template match="zoneRef">
  <span>
    <xsl:call-template name="setID"/>
    <xsl:call-template name="change"/>
    <xsl:value-of select="fn:getGenText('zoneRef')"/>
    <xsl:value-of select="@zoneNumber"/>
    <xsl:apply-templates/>
  </span>
</xsl:template>

</xsl:stylesheet>

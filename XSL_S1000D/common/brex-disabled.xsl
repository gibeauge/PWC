<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:fn="http://www.pwc.ca"
    xmlns:xs="http://www.w3.org/2001/XMLSchema"
    xmlns="http://www.w3.org/1999/xhtml"
    exclude-result-prefixes="xs fn #default"
    version="2.0">

<!-- NOT USED -->
<!--
* @caveat
* @commercialClassification
* @skillLevelCode
* @independentCheck

* dataRestrictions/@applicRefId
* qualityAssurance/@applicRefId
* reasonForUpdate/@applicRefId

* dmIdent/identExtension
- restrictionInstructions/dataHandling, /dataDestruction, /dataDisclosure, /supersedure
- responsiblePartnerCompany/enterpriseName
- originator/enterpriseName
- dmStatus/systemBreakdownCode
- dmStatus/functionalItemRef
- dmStatus/functionalItemCode
- dmStatus/productSafety
- dmStatus/remarks

- acronym
- caption
- captionGroup
- reasonForAmendment
- figure/legend
- foldout
- inlineSignificantData
- quantity
- quantityGroup
- indexFlag

* dmRefIdent/issueInfo, pmRefIdent/issueInfo
* dmRefIdent/language, pmRefIdent/language

* warning/@vitalWarningFlag /@warningType
* caution/@cautionType
* note/@noteType

* proceduralStep/@itemCharacteristic
- proceduralStep/title
- productionMaintData
- reqCondCircuitBreaker
- reqPersons
-->

<!-- ************************************************************** -->

<xsl:template name="brex-disabled-tooltip">
  <xsl:attribute name="title">
    <xsl:text>BREX requires not using &#60;</xsl:text>
    <xsl:value-of select="name()"/>
    <xsl:text>&#62;.</xsl:text>
  </xsl:attribute>
</xsl:template>

<xsl:template name="brex-disabled-div">
  <div style="color: orange; ">
    <xsl:text>BREX requires not using &#60;</xsl:text>
    <xsl:value-of select="name()"/>
    <xsl:text>&#62;.</xsl:text>
  </div>
</xsl:template>

<xsl:template name="brex-disabled-span">
  <span style="color: orange; ">
    <xsl:text>BREX requires not using &#60;</xsl:text>
    <xsl:value-of select="name()"/>
    <xsl:text>&#62;.</xsl:text>
  </span>
</xsl:template>

<xsl:template name="brex-disabled-div-in">
  <div style="color: orange; ">
    <xsl:text>BREX requires not using &#60;</xsl:text>
    <xsl:value-of select="name()"/>
    <xsl:text>&#62; in &#60;</xsl:text>
    <xsl:value-of select="../name()"/>
    <xsl:text>&#62;.</xsl:text>
  </div>
</xsl:template>

<xsl:template name="brex-disabled-tr">
  <xsl:param name="span"/>
  
  <tr>
    <td style="color: orange; " colspan="{$span}">
      <xsl:text>BREX requires not using &#60;</xsl:text>
      <xsl:value-of select="name()"/>
      <xsl:text>&#62;.</xsl:text>
    </td>
  </tr>
</xsl:template>

<!-- ************************************************************** -->
<!-- FROM content.xsl -->

<!--
<xsl:template match="acronym" priority="20">
  <xsl:call-template name="brex-disabled-span"/>
</xsl:template>
-->

<!--
<xsl:template match="caption" priority="20">
  <xsl:call-template name="brex-disabled-div"/>
</xsl:template>
-->

<!--
<xsl:template match="captionGroup" priority="20">
  <xsl:call-template name="brex-disabled-div"/>
</xsl:template>
-->

<!--
<xsl:template match="inlineSignificantData" priority="20">
  <xsl:call-template name="brex-disabled-span"/>
</xsl:template>
-->

<!--
<xsl:template match="foldout" priority="20">
  <xsl:call-template name="brex-disabled-div"/>
</xsl:template>
-->

<!--
<xsl:template match="figure/legend" priority="20">
  <xsl:call-template name="brex-disabled-div"/>
</xsl:template>
-->

<!--
<xsl:template match="quantity" priority="20">
  <xsl:call-template name="brex-disabled-span"/>
</xsl:template>

<xsl:template match="quantityGroup" priority="20">
  <xsl:call-template name="brex-disabled-span"/>
</xsl:template>
-->


<!-- ************************************************************** -->
<!-- FROM metadata.xsl -->

<!--
<xsl:template match="dataHandling|dataDestruction|dataDisclosure|supersedure" mode="metadata" priority="20">
  <xsl:call-template name="brex-disabled-tr">
    <xsl:with-param name="span" select="number(2)"/>
  </xsl:call-template>
</xsl:template>
-->

<!--
<xsl:template match="enterpriseName" mode="metadata" priority="20">
  <xsl:call-template name="brex-disabled-span"/>
</xsl:template>
-->

<!--
<xsl:template match="functionalItemCode|functionalItemRef|systemBreakdownCode|productSafety|remarks" mode="metadata" priority="20">
  <xsl:call-template name="brex-disabled-tr">
    <xsl:with-param name="span" select="number(2)"/>
  </xsl:call-template>
</xsl:template>
-->

<!-- ************************************************************** -->
<!-- FROM dm_proced.xsl -->

<!--
<xsl:template match="proceduralStep/title">
  <xsl:call-template name="brex-disabled-div-in"/>
</xsl:template>
-->


<!-- ************************************************************** -->
<!-- FROM prelreqs.xsl -->

<!--
<xsl:template match="productionMaintData" priority="20">
  <xsl:call-template name="brex-disabled-div"/>
</xsl:template>
-->

<!--
<xsl:template match="reqCondCircuitBreaker" priority="20">
  <xsl:call-template name="brex-disabled-tr">
    <xsl:with-param name="span" select="number(2)"/>
  </xsl:call-template>
</xsl:template>
-->

<!--
<xsl:template match="reqPersons" priority="20">
  <xsl:call-template name="brex-disabled-div"/>
</xsl:template>
-->

</xsl:stylesheet>

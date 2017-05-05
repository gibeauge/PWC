<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:fn="http://www.pwc.ca"
    xmlns:xs="http://www.w3.org/2001/XMLSchema"
    xmlns="http://www.w3.org/1999/xhtml"
    exclude-result-prefixes="xs fn #default"
    version="2.0">

<!-- ************************************************************** -->
<!-- Preliminary requirements -->

<xsl:template match="preliminaryRqmts">
  <div class="s-prelreqs">
    <h2><xsl:value-of select="fn:getGenText('prelreqs')"/></h2>
    <xsl:apply-templates/>
  </div>
</xsl:template>
   
<xsl:template match="commonInfo">
  <div class="s-commonInfo">
    <h2><xsl:value-of select="fn:getGenText('commonInfo')"/></h2>
    <xsl:apply-templates/>
  </div>
</xsl:template>

<xsl:template match="commonInfo/title">
  <div style="width: 100%" class="s-reqgroup-title"><xsl:apply-templates/></div>
</xsl:template>

<xsl:template match="commonInfoDescrPara">
  <div class="s-commonInfoSection">
    <xsl:apply-templates/>
  </div>
</xsl:template>

<!-- ************************************************************** -->

<xsl:template match="productionMaintData[1]">
  <div class="s-prodMaintData">
    <xsl:call-template name="brex-disabled-tooltip"/>
    <table>
      <caption class="s-reqgroup-title">
        <xsl:value-of select="fn:getGenText('prodMaintData')"/>
      </caption>
      <!--thead>
        <tr>
          <th><xsl:value-of select="fn:getGenText('prodMaintData-table-header-col1')"/></th>
          <th><xsl:value-of select="fn:getGenText('prodMaintData-table-header-col2')"/></th>
        </tr>
      </thead-->
      <tbody>
        <tr>
          <td colspan="2"><xsl:apply-templates mode="maintenance"/></td>
        </tr>
      </tbody>
    </table>
  </div>
</xsl:template>

<xsl:template match="thresholdInterval" mode="maintenance">
  <div>
    <xsl:value-of select="fn:getGenText('thresholdInterval')"/>
    <xsl:text> </xsl:text>
    <xsl:apply-templates/>
    <xsl:text> </xsl:text>
    <xsl:value-of select="fn:getGenText(concat('threshold-', @thresholdUnitOfMeasure))"/>
    <xsl:value-of select="fn:getGenText('sep-1')"/>
  </div>
</xsl:template>

<xsl:template match="zoneRef" mode="maintenance">
  <div>
    <xsl:call-template name="setID"/>
    <xsl:call-template name="change"/>
    <xsl:value-of select="fn:getGenText('zoneRef')"/>
    <xsl:value-of select="@zoneNumber"/>
    <xsl:text> </xsl:text>
    <xsl:apply-templates/>
  </div>
</xsl:template>

<xsl:template match="accessPointRef" mode="maintenance">
  <div>
    <xsl:call-template name="setID"/>
    <xsl:call-template name="change"/>
    <xsl:value-of select="fn:getGenText('accessPointRef')"/>
    <xsl:value-of select="@accessPointNumber"/>
    <xsl:text> </xsl:text>
    <xsl:apply-templates/>
  </div>
</xsl:template>

<xsl:template match="workArea" mode="maintenance">
  <div>
    <xsl:apply-templates/>
  </div>
</xsl:template>

<xsl:template match="taskDuration" mode="maintenance">
  <div>
    <xsl:value-of select="fn:getGenText('duration')"/>
    <xsl:value-of select="concat(@startupDuration, @unitOfMeasure, fn:getGenText('sep3'))"/>
    <xsl:value-of select="concat(@procedureDuration, @unitOfMeasure, fn:getGenText('sep3'))"/>
    <xsl:value-of select="concat(@closeupDuration, @unitOfMeasure, fn:getGenText('sep3'))"/>
    <xsl:text> </xsl:text>
    <xsl:apply-templates/>
  </div>
</xsl:template>


<!-- ************************************************************** -->
<!-- Required conditions -->

<xsl:template match="reqCondGroup">
  <div class="s-reqgroup">
    <table width="100%">
      <caption class="s-reqgroup-title">
        <xsl:value-of select="fn:getGenText('reqconds')"/>
      </caption>
      <colgroup>
        <col width="50%"/>
        <col width="50%"/>
      </colgroup>
      <thead>
        <tr>
          <th><xsl:value-of select="fn:getGenText('reqconds-header-1')"/></th>
          <th><xsl:value-of select="fn:getGenText('reqconds-header-2')"/></th>
        </tr>
      </thead>
      <tbody>
        <xsl:apply-templates/>
      </tbody>
    </table>
  </div>
</xsl:template>

<xsl:template match="reqCondNoRef">
  <tr>
    <xsl:call-template name="setID"/>
    <xsl:call-template name="change"/>
    <xsl:apply-templates/>
    <td/>
  </tr>
</xsl:template>
    
<xsl:template match="reqCond">
  <td><xsl:apply-templates/></td>
</xsl:template>
    
<xsl:template match="reqCondDm">
  <tr>
    <xsl:call-template name="setID"/>
    <xsl:call-template name="change"/>
    <xsl:apply-templates/>
  </tr>
</xsl:template>

<xsl:template match="reqCondDm/dmRef" priority="5">
  <td><xsl:next-match/></td>
</xsl:template>

<xsl:template match="reqCondPm">
  <tr>
    <xsl:call-template name="setID"/>
    <xsl:call-template name="change"/>
    <xsl:apply-templates/>
  </tr>
</xsl:template>

<xsl:template match="reqCondPm/pmRef" priority="5">
  <td><xsl:next-match/></td>
</xsl:template>

<xsl:template match="reqCondExternalPub">
  <tr>
    <xsl:call-template name="setID"/>
    <xsl:call-template name="change"/>
    <xsl:apply-templates/>
  </tr>
</xsl:template>

<xsl:template match="reqCondExternalPub/externalPubRef" priority="5">
  <td><xsl:next-match/></td>
</xsl:template>

<xsl:template match="noConds">
  <tr><td colspan="2"><xsl:value-of select="fn:getGenText('none')"/></td></tr>
</xsl:template>

<xsl:template match="reqCondNoRef|reqCondDm|reqCondPm|reqCondExternalPub" mode="chg-del">
  <xsl:call-template name="delete-as-row">
    <xsl:with-param name="span" select="number(2)"/>
  </xsl:call-template>
</xsl:template>

<xsl:template match="reqCondCircuitBreaker" mode="chg-del">
  <xsl:call-template name="delete-as-row">
    <xsl:with-param name="span" select="number(2)"/>
  </xsl:call-template>
</xsl:template>

<xsl:template match="reqCondCircuitBreaker">
  <tr>
    <xsl:call-template name="brex-disabled-tooltip"/>
    <xsl:call-template name="setID"/>
    <xsl:call-template name="change"/>
    <xsl:apply-templates select="reqCond"/>
  </tr>
  <tr>
    <xsl:call-template name="brex-disabled-tooltip"/>
    <xsl:call-template name="change"/>
    <xsl:apply-templates select="circuitBreakerDescrGroup"/>
  </tr>
</xsl:template>

<xsl:template match="reqCondCircuitBreaker/reqCond">
  <td colspan="2"><xsl:apply-templates/></td>
</xsl:template>

<xsl:template match="circuitBreakerDescrGroup" mode="chg-del">
  <xsl:call-template name="delete-as-cell">
    <xsl:with-param name="span" select="number(2)"/>
  </xsl:call-template>
</xsl:template>

<xsl:template match="circuitBreakerDescrGroup">
  <td colspan="2">
    <xsl:call-template name="setID"/>
    <xsl:call-template name="change"/>
    <table width="100%">
      <colgroup>
        <col width="25%" style="padding-left:10px"/>
        <col width="25%"/>
        <col width="25%"/>
        <col width="25%"/>
      </colgroup>
      <thead>
        <tr>
          <th><xsl:value-of select="fn:getGenText('reqconds-cb-header-1')"/></th>
          <th><xsl:value-of select="fn:getGenText('reqconds-cb-header-2')"/></th>
          <th><xsl:value-of select="fn:getGenText('reqconds-cb-header-3')"/></th>
          <th><xsl:value-of select="fn:getGenText('reqconds-cb-header-4')"/></th>
        </tr>
      </thead>
      <tbody>
        <xsl:apply-templates/>
      </tbody>
    </table>
  </td>
</xsl:template>

<xsl:template match="circuitBreakerDescrSubGroup">
  <xsl:if test="functionalItemRef">
    <tr>
      <xsl:call-template name="setID"/>
      <xsl:call-template name="change"/>
      <td colspan="4"><xsl:apply-templates select="functionalItemRef"/></td>
    </tr>
  </xsl:if>
  <xsl:apply-templates select="circuitBreakerDescr"/>
</xsl:template>

<xsl:template match="circuitBreakerDescr">
  <tr>
    <xsl:call-template name="setID"/>
    <xsl:call-template name="change">
        <xsl:with-param name="node" select=".."/>
    </xsl:call-template>
    <xsl:call-template name="change"/>
    <td>
      <xsl:choose>
        <xsl:when test="accessPointRef/@accessPointNumber">
          <xsl:apply-templates select="accessPointRef"/>
        </xsl:when>
        <xsl:otherwise>
          <xsl:apply-templates select="internalRef"/>
        </xsl:otherwise>
      </xsl:choose>
    </td>
    <td><xsl:apply-templates select="name"/></td>
    <td><xsl:apply-templates select="circuitBreakerRef"/></td>
    <td><xsl:apply-templates select="circuitBreakerLocation"/></td>
  </tr>
</xsl:template>

<xsl:template match="circuitBreakerDescrSubGroup|circuitBreakerDescr" mode="chg-del">
  <xsl:call-template name="delete-as-row">
    <xsl:with-param name="span" select="number(4)"/>
  </xsl:call-template>
</xsl:template>

<xsl:template match="circuitBreakerDescr/accessPointRef">
  <span>
    <xsl:call-template name="setID"/>
    <xsl:call-template name="change"/>
    <xsl:value-of select="@accessPointNumber"/>
  </span>
</xsl:template>

<xsl:template match="circuitBreakerDescr/name|supplyDescr/name|supplyDescr/name|spareDescr/name">
  <xsl:call-template name="change"/>
  <xsl:apply-templates/>
</xsl:template>

<xsl:template match="circuitBreakerLocation">
  <span>
    <xsl:call-template name="setID"/>
    <xsl:call-template name="change"/>
    <xsl:apply-templates/>
  </span>
</xsl:template>

<xsl:template match="circuitBreakerDescr/circuitBreakerRef">
  <span>
    <xsl:call-template name="setID"/>
    <xsl:call-template name="change"/>
    <xsl:value-of select="@circuitBreakerNumber"/>
  </span>
</xsl:template>

<xsl:template match="circuitBreakerDescr/accessPointRef|circuitBreakerDescr/name|circuitBreakerLocation|circuitBreakerDescr/circuitBreakerRef" mode="chg-del">
  <xsl:call-template name="delete-as-span"/>
</xsl:template>

<!-- ************************************************************** -->
<!-- Required tech. info. group -->

<xsl:template match="reqTechInfoGroup">
  <div class="s-reqgroup">
    <table width="100%">
      <caption class="s-reqgroup-title">
        <xsl:value-of select="fn:getGenText('reqtech')"/>
      </caption>
      <colgroup>
        <col width="50%"/>
        <col width="50%"/>
      </colgroup>
      <thead>
        <tr>
          <th><xsl:value-of select="fn:getGenText('reqtech-header-1')"/></th>
          <th><xsl:value-of select="fn:getGenText('reqtech-header-2')"/></th>
        </tr>
      </thead>
      <tbody>
        <xsl:apply-templates/>
      </tbody>
    </table>
  </div>
</xsl:template>

<xsl:template match="reqTechInfo">
  <tr>
    <td>
      <xsl:choose>
        <xsl:when test="@reqTechInfoCategory">
          <xsl:value-of select="fn:getGenText(concat('reqtech-', @reqTechInfoCategory))"/>
        </xsl:when>
        <xsl:when test="dmRef">
          <xsl:value-of select="fn:getGenText('reqtech-ti02')"/>
        </xsl:when>
        <xsl:when test="pmRef">
          <xsl:value-of select="fn:getGenText('reqtech-ti01')"/>
        </xsl:when>
      </xsl:choose>
    </td>
    <xsl:apply-templates/>
  </tr>
</xsl:template>

<xsl:template match="reqTechInfo/dmRef" priority="5">
  <td><xsl:next-match/></td>
</xsl:template>

<xsl:template match="reqTechInfo/pmRef" priority="5">
  <td><xsl:next-match/></td>
</xsl:template>

<xsl:template match="reqTechInfo/externalPubRef" priority="5">
  <td><xsl:next-match/></td>
</xsl:template>

<!-- ************************************************************** -->
<!-- Required persons -->

<xsl:template match="reqPersons[not(preceding-sibling::reqPersons)]" priority="20">
  <div class="s-reqgroup">
    <xsl:call-template name="brex-disabled-tooltip"/>
    <xsl:call-template name="setID"/>
    <table width="100%">
      <caption class="s-reqgroup-title">
        <xsl:value-of select="fn:getGenText('reqpersons')"/>
      </caption>
      <colgroup>
        <col width="15%"/>
        <col width="15%"/>
        <col width="15%"/>
        <col width="28%"/>
        <col width="27%"/>
      </colgroup>
      <thead>
        <tr>
          <th><xsl:value-of select="fn:getGenText('reqpersons-header-1')"/></th>
          <th><xsl:value-of select="fn:getGenText('reqpersons-header-2')"/></th>
          <th><xsl:value-of select="fn:getGenText('reqpersons-header-3')"/></th>
          <th><xsl:value-of select="fn:getGenText('reqpersons-header-4')"/></th>
          <th><xsl:value-of select="fn:getGenText('reqpersons-header-5')"/></th>
        </tr>
      </thead>
      <tbody>
        <xsl:next-match/>
      </tbody>
    </table>
  </div>
</xsl:template>

<xsl:template match="reqPersons" mode="chg-del">
  <xsl:call-template name="delete-as-row">
    <xsl:with-param name="span" select="number(5)"/>
  </xsl:call-template>
  <xsl:apply-templates select="following-sibling::reqPersons[1]">
    <xsl:with-param name="process" select="'1'"/>
  </xsl:apply-templates>
</xsl:template>

<xsl:template match="reqPersons[not(preceding-sibling::reqPersons)]" priority="3">
  <xsl:call-template name="req-persons-process">
    <xsl:with-param name="process" select="'1'"/>
  </xsl:call-template>
</xsl:template>

<xsl:template match="reqPersons" name="req-persons-process">
  <xsl:param name="process" select="'0'"/>
  <xsl:if test="$process='1'">
    <tr>
      <xsl:call-template name="setID"/>
      <xsl:apply-templates select="child::*[1]"/>
    </tr>
    <xsl:apply-templates select="child::*[position() > 1]"/>
    <xsl:apply-templates select="following-sibling::reqPersons[1]">
      <xsl:with-param name="process" select="'1'"/>
    </xsl:apply-templates>
  </xsl:if>
</xsl:template>

<xsl:template match="reqPersons/person[not(preceding-sibling::*)]" priority="3">
  <xsl:call-template name="person-row"/>
</xsl:template>

<xsl:template match="reqPersons/person">
  <tr><xsl:call-template name="person-row"/></tr>
</xsl:template>

<xsl:template match="reqPersons/person[not(preceding-sibling::*)]" mode="chg-del" priority="3">
  <xsl:call-template name="delete-as-cell">
    <xsl:with-param name="span" select="number(5)"/>
  </xsl:call-template>
</xsl:template>

<xsl:template match="reqPersons/person" mode="chg-del">
  <xsl:call-template name="delete-as-row">
    <xsl:with-param name="span" select="number(5)"/>
  </xsl:call-template>
</xsl:template>

<xsl:template name="person-row">
  <xsl:call-template name="change">
    <xsl:with-param name="node" select=".."/>
  </xsl:call-template>
  <xsl:call-template name="change"/>
  <td><xsl:call-template name="setID"/><xsl:call-template name="person-required-man"/></td>
  <td><xsl:apply-templates select="personCategory"/></td>
  <td><xsl:apply-templates select="personSkill"/></td>
  <td><xsl:apply-templates select="trade"/></td>
  <td><xsl:apply-templates select="estimatedTime"/></td>
</xsl:template>
    
<xsl:template match="reqPersons/personnel[not(preceding-sibling::*)]" priority="3">
  <xsl:call-template name="personnel-row"/>
</xsl:template>

<xsl:template match="reqPersons/personnel">
  <tr><xsl:call-template name="personnel-row"/></tr>
</xsl:template>

<xsl:template match="reqPersons/personnel[not(preceding-sibling::*)]" mode="chg-del" priority="3">
  <xsl:call-template name="delete-as-cell">
    <xsl:with-param name="span" select="number(5)"/>
  </xsl:call-template>
</xsl:template>

<xsl:template match="reqPersons/personnel" mode="chg-del">
  <xsl:call-template name="delete-as-row">
    <xsl:with-param name="span" select="number(5)"/>
  </xsl:call-template>
</xsl:template>

<xsl:template name="personnel-row">
  <xsl:call-template name="change">
    <xsl:with-param name="node" select=".."/>
  </xsl:call-template>
  <xsl:call-template name="change"/>
  <td><xsl:call-template name="person-required-num"/></td>
  <td><xsl:apply-templates select="personCategory"/></td>
  <td><xsl:apply-templates select="personSkill"/></td>
  <td><xsl:apply-templates select="trade"/></td>
  <td><xsl:apply-templates select="estimatedTime"/></td>
</xsl:template>

<xsl:template name="person-required-man">
  <xsl:value-of select="concat(fn:getGenText('person-man'),' ',@man)"/>
</xsl:template>

<xsl:template name="person-required-num">
  <xsl:value-of select="if (@numRequired) then @numRequired else fn:getGenText('person-asreq')"/>
</xsl:template>

<xsl:template match="personCategory|personSkill|trade|estimatedTime" mode="chg-del">
  <xsl:call-template name="delete-as-span"/>
</xsl:template>

<xsl:template match="personCategory">
  <xsl:call-template name="setID"/>
  <xsl:call-template name="change"/>
  <xsl:value-of select="@personCategoryCode"/>
</xsl:template>
    
<xsl:template match="personSkill">
  <xsl:call-template name="setID"/>
  <xsl:call-template name="change"/>
  <xsl:value-of select="fn:getGenText(concat('person-skill-',@skillLevelCode))"/>
</xsl:template>

<xsl:template match="trade">
  <xsl:call-template name="setID"/>
  <xsl:call-template name="change"/>
  <xsl:apply-templates/>
</xsl:template>

<xsl:template match="estimatedTime">
  <xsl:call-template name="setID"/>
  <xsl:call-template name="change"/>
  <xsl:apply-templates/>
  <xsl:value-of select="@unitOfMeasure"/>
</xsl:template>

<!-- ************************************************************** -->
<!-- Support equipment -->

<xsl:template match="reqSupportEquips">
  <xsl:call-template name="equip-table">
    <xsl:with-param name="label-id" select="'reqsupequip'"/>
  </xsl:call-template>
</xsl:template>

<!-- Supplies -->
<xsl:template match="reqSupplies">
  <xsl:call-template name="equip-table">
    <xsl:with-param name="label-id" select="'reqsupplies'"/>
  </xsl:call-template>
</xsl:template>

<!-- Spares -->
<xsl:template match="reqSpares">
  <xsl:call-template name="equip-table">
    <xsl:with-param name="label-id" select="'reqspares'"/>
  </xsl:call-template>
</xsl:template>

<xsl:template name="equip-table">
  <xsl:param name="label-id"/>

  <div class="s-reqgroup">
    <table width="100%">
      <caption class="s-reqgroup-title">
        <xsl:value-of select="fn:getGenText($label-id)"/>
      </caption>
      <colgroup>
        <col width="25%"/>
        <col width="40%"/>
        <col width="10%"/>
        <col width="25%"/>
      </colgroup>
      <thead>
        <tr>
          <th><xsl:value-of select="fn:getGenText('reqequip-header-1')"/></th>
          <th><xsl:value-of select="fn:getGenText('reqequip-header-2')"/></th>
          <th><xsl:value-of select="fn:getGenText('reqequip-header-3')"/></th>
          <th><xsl:value-of select="fn:getGenText('reqequip-header-4')"/></th>
        </tr>
      </thead>
      <tbody>
        <xsl:apply-templates/>
      </tbody>
    </table>
  </div>
</xsl:template>

<xsl:template match="noSupportEquips|noSupplies|noSpares" name="no-equip">
  <tr><td colspan="4"><xsl:value-of select="fn:getGenText('none')"/></td></tr>
</xsl:template>

<xsl:template match="supportEquipDescrGroup|supplyDescrGroup|spareDescrGroup">
  <xsl:apply-templates/>
  <xsl:if test="not(*)">
    <xsl:call-template name="no-equip"/>
  </xsl:if>
</xsl:template>

<xsl:template match="supportEquipDescr|supplyDescr|spareDescr">
  <tr>
    <xsl:call-template name="setID"/>
    <xsl:call-template name="change"/>
    <td><xsl:call-template name="equip-name"/></td>
    <td><xsl:apply-templates select="identNumber"/></td>
    <td><xsl:apply-templates select="reqQuantity"/></td>
    <td><xsl:apply-templates select="remarks"/></td>
  </tr>
</xsl:template>

<xsl:template match="supportEquipDescr|supplyDescr|spareDescr" mode="chg-del">
  <xsl:call-template name="delete-as-row">
    <xsl:with-param name="span" select="number(4)"/>
  </xsl:call-template>
</xsl:template>

<xsl:template name="equip-name">
  <xsl:apply-templates select="if (shortName) then shortName else name"/>
</xsl:template>
    
<xsl:template match="preliminaryRqmts//name|preliminaryRqmts//shortName" priority="5">
  <xsl:call-template name="change"/>
  <xsl:apply-templates/>
</xsl:template>

<xsl:template match="preliminaryRqmts//identNumber" priority="5">
  <xsl:call-template name="change"/>
  <!--xsl:next-match/-->
  <xsl:apply-templates/>
</xsl:template>

<xsl:template match="preliminaryRqmts//partNumber" priority="3">
  <xsl:next-match/>
</xsl:template>

<xsl:template match="reqQuantity">
    <xsl:call-template name="change"/>
    <xsl:apply-templates/>
    <xsl:value-of select="if (@unitOfMeasure and @unitOfMeasure!='EA') then @unitOfMeasure else ''"/>
</xsl:template>

<xsl:template match="preliminaryRqmts//name|preliminaryRqmts//shortName|preliminaryRqmts//identNumber|reqQuantity" priority="5" mode="chg-del">
    <xsl:call-template name="delete-as-span"/>
</xsl:template>

<xsl:template match="remarks">
    <xsl:apply-templates/>
</xsl:template>

<!--  Safety -->
<xsl:template match="reqSafety">
  <div class="s-reqgroup">
    <div style="width: 100%" class="s-reqgroup-title"><xsl:value-of select="fn:getGenText('reqsafety')"/></div>
    <xsl:apply-templates/>
    <xsl:if test="not(*)">
      <xsl:call-template name="no-safety"/>
    </xsl:if>
  </div>
</xsl:template>

<xsl:template match="safetyRqmts">
  <div>
    <xsl:call-template name="setID"/>
    <xsl:apply-templates/>
  </div>
</xsl:template>

<xsl:template match="noSafety" name="no-safety">
  <div><xsl:value-of select="fn:getGenText('none')"/></div>
</xsl:template>

<!-- ************************************************************** -->
<!-- Closing requirements -->

<xsl:template match="closeRqmts" priority="20">
  <div class="s-closereqs">
    <xsl:call-template name="change"/>
    <h2><xsl:value-of select="fn:getGenText('closereqs')"/></h2>
    <xsl:next-match/>
  </div>
</xsl:template>

<xsl:template match="closeRqmts">
  <div>
    <xsl:call-template name="setID"/>
    <xsl:apply-templates/>
  </div>
</xsl:template>

<xsl:template match="closeRqmts" mode="chg-del">
  <xsl:call-template name="delete-as-div"/>
</xsl:template>

</xsl:stylesheet>

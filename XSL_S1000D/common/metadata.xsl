<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:fn="http://www.pwc.ca"
    xmlns:xs="http://www.w3.org/2001/XMLSchema"
    xmlns="http://www.w3.org/1999/xhtml"
    exclude-result-prefixes="xs fn #default"
    version="2.0">
    
<xsl:template name="metadata">
  <xsl:param name="additional-title" select="''"/>

  <xsl:if test="ancestor::dmInclusion/@is-tp='false'">
    <xsl:apply-templates select="identAndStatusSection" mode="metadata"/>
    <div class="s-dmodule-title">
      <xsl:apply-templates select="identAndStatusSection/dmAddress/dmAddressItems/dmTitle" mode="dm-title"/>
      <h3 class="s-metadata">
        <!--xsl:apply-templates select="identAndStatusSection" mode="metadata-s"/-->
      </h3>
      <xsl:if test="$additional-title!=''">
        <h3><xsl:value-of select="$additional-title"/></h3>
      </xsl:if>
    </div>
  </xsl:if>
</xsl:template>

<xsl:template match="dmTitle" mode="dm-title">
  <!--xsl:choose>
    <xsl:when test="ancestor::dmInclusion/@is-fm='true'">
      <xsl:apply-templates select="techName" mode="dm-title-fm"/>
    </xsl:when>
    <xsl:otherwise-->
      <xsl:apply-templates select="techName" mode="dm-title"/>
      <xsl:apply-templates select="infoName" mode="dm-title"/>
    <!--/xsl:otherwise>
  </xsl:choose-->
</xsl:template>
    
<xsl:template match="techName" mode="dm-title">
  <h1><xsl:apply-templates/></h1>
</xsl:template>

<xsl:template match="infoName" mode="dm-title">
  <h2><xsl:apply-templates/></h2>
</xsl:template>
        
<xsl:template match="techName" mode="dm-title-fm">
  <h1>
    <xsl:apply-templates/>
    <xsl:text> -&#xa0;</xsl:text>
    <xsl:apply-templates select="../infoName" mode="dm-title-fm"/>
  </h1>
</xsl:template>
    
<xsl:template match="infoName" mode="dm-title-fm">
  <xsl:apply-templates/>
</xsl:template>

<xsl:template match="identAndStatusSection" mode="metadata-s">
    <xsl:text>(</xsl:text>
    <xsl:value-of select="ancestor::dmInclusion/@ref"/>
    <xsl:text>, </xsl:text>
    <xsl:value-of select="fn:getGenText('meta-issue')"/>
    <xsl:text> </xsl:text>
    <xsl:apply-templates select="dmAddress/dmIdent/issueInfo" mode="metadata-s"/>
    <xsl:if test="$g_issue = '000'">
      <xsl:text> - </xsl:text>
      <span class="s-certification"><xsl:value-of select="fn:getGenText('certification')"/></span>
    </xsl:if>
    <xsl:text> - </xsl:text>
    <xsl:apply-templates select="dmAddress/dmAddressItems/issueDate" mode="metadata-s"/>
    <xsl:text>, </xsl:text>
    <xsl:apply-templates select="dmStatus/security" mode="metadata-s"/>
    <xsl:text>)</xsl:text>
</xsl:template>

<xsl:template match="issueInfo" mode="metadata-s">
  <xsl:value-of select="@issueNumber"/>
</xsl:template>

<xsl:template match="issueDate" mode="metadata-s">
  <xsl:value-of select="concat(@year, '-', @month, '-', @day)"/>
</xsl:template>

<xsl:template match="security" mode="metadata-s">
  <xsl:value-of select="fn:getGenText(concat('security-',@securityClassification))" />
</xsl:template>

<xsl:template match="identAndStatusSection" mode="metadata">
  <xsl:variable name="id" select="'dmstatus-table'"/>
  <div class="s-dmstatus">
    <div><!--a href="#" onclick="toggle('{$id}', '{$id}')"-->DM status<!--/a--></div>
    <table id="{$id}"><!-- style="display:none;"-->
      <colgroup>
        <col width="15%"/>
        <col width="85%"/>
      </colgroup>
      <tbody>
        <xsl:apply-templates select="dmAddress/dmIdent/dmCode"            mode="metadata"/>
        <!--
        <xsl:apply-templates select="dmAddress/dmIdent/language"          mode="metadata"/>
        <xsl:apply-templates select="dmAddress/dmAddressItems/dmTitle"    mode="metadata"/>
        -->
        <xsl:apply-templates select="dmAddress/dmIdent/issueInfo"         mode="metadata"/>
        <xsl:apply-templates select="dmAddress/dmAddressItems/issueDate"  mode="metadata"/>
        <!--
        <xsl:apply-templates select="dmStatus/security"                   mode="metadata"/>
        <xsl:apply-templates select="dmStatus/dataRestrictions"           mode="metadata"/>
        <xsl:apply-templates select="dmStatus/responsiblePartnerCompany"  mode="metadata"/>
        <xsl:apply-templates select="dmStatus/originator"                 mode="metadata"/>
        <xsl:apply-templates select="dmStatus/applicCrossRefTableRef"     mode="metadata"/>
        -->
        <xsl:apply-templates select="dmStatus/applic"                     mode="metadata"/>
        <!--
        <xsl:apply-templates select="dmStatus/referencedApplicGroup"      mode="metadata"/>
        <xsl:apply-templates select="dmStatus/techStandard"               mode="metadata"/>
        <xsl:apply-templates select="dmStatus/brexDmRef"                  mode="metadata"/>
        <xsl:apply-templates select="dmStatus/qualityAssurance"           mode="metadata"/>
        <xsl:apply-templates select="dmStatus/systemBreakdownCode"        mode="metadata"/>
        <xsl:apply-templates select="dmStatus/functionalItemCode"         mode="metadata"/>
        <xsl:apply-templates select="dmStatus/functionalItemRef"          mode="metadata"/>
        <xsl:apply-templates select="dmStatus/skillLevel"                 mode="metadata"/>
        <xsl:apply-templates select="dmStatus/reasonForUpdate"            mode="metadata"/>
        <xsl:apply-templates select="dmStatus/productSafety"              mode="metadata"/>
        <xsl:apply-templates select="dmStatus/remarks"                    mode="metadata"/>
        -->
      </tbody>
    </table>
  </div>
</xsl:template>
  
<xsl:template match="dmIdent/dmCode" mode="metadata">
  <tr class="s-metadata-row">
    <td class="s-metadata-def">
      <xsl:value-of select="fn:getGenText('meta-dmc')"/>
      <xsl:value-of select="fn:getGenText('sep1')"/>
    </td>
    <td class="s-metadata-term">
      <xsl:value-of select="fn:getDMCBasic(fn:getDMC(.))"/>
    </td>
  </tr>
</xsl:template>
    
<xsl:template match="language" mode="metadata">
  <tr class="s-metadata-row">
    <td class="s-metadata-def">
      <xsl:value-of select="fn:getGenText('meta-language')"/>
      <xsl:value-of select="fn:getGenText('sep1')"/>
    </td>
    <td class="s-metadata-term">
      <xsl:value-of select="concat(@languageIsoCode, '/', @countryIsoCode)"/>
    </td>
  </tr>
</xsl:template>
    
<xsl:template match="dmTitle" mode="metadata">
  <tr class="s-metadata-row">
    <td class="s-metadata-def">
      <xsl:value-of select="fn:getGenText('meta-title')"/>
      <xsl:value-of select="fn:getGenText('sep1')"/>
    </td>
    <td class="s-metadata-term">
      <xsl:value-of select="concat(techName, ' - ', infoName)"/>
    </td>
  </tr>
</xsl:template>

<xsl:template match="issueInfo" mode="metadata">
  <tr class="s-metadata-row">
    <td class="s-metadata-def">
      <xsl:value-of select="fn:getGenText('meta-issue')"/>
      <xsl:value-of select="fn:getGenText('sep1')"/>
    </td>
    <td class="s-metadata-term">
      <xsl:value-of select="@issueNumber"/>
    </td>
  </tr>
</xsl:template>
    
<xsl:template match="issueDate" mode="metadata">
  <tr class="s-metadata-row">
    <td class="s-metadata-def">
      <xsl:value-of select="fn:getGenText('meta-issue-date')"/>
      <xsl:value-of select="fn:getGenText('sep1')"/>
    </td>
    <td class="s-metadata-term">
      <xsl:value-of select="concat(@year, '-', @month, '-', @day)"/>
    </td>
  </tr>
</xsl:template>

<xsl:template match="security" mode="metadata">
  <tr class="s-metadata-row">
    <td class="s-metadata-def">
      <xsl:value-of select="fn:getGenText('meta-security')"/>
      <xsl:value-of select="fn:getGenText('sep1')"/>
    </td>
    <td class="s-metadata-term">
      <xsl:value-of select="fn:getGenText(concat('security-',@securityClassification))"/>
    </td>
  </tr>
</xsl:template>

<xsl:template match="dataRestrictions" mode="metadata">
  <tr class="s-metadata-row">
    <td class="s-metadata-def">
      <xsl:value-of select="fn:getGenText('meta-dataRestrictions')"/>
      <xsl:value-of select="fn:getGenText('sep1')"/>
    </td>
    <td class="s-metadata-term">
      <table>
        <tbody>
            <xsl:apply-templates select="restrictionInstructions/dataDistribution" mode="metadata"/>
            <xsl:apply-templates select="restrictionInstructions/exportControl"    mode="metadata"/>
            <xsl:apply-templates select="restrictionInstructions/dataHandling"     mode="metadata"/>
            <xsl:apply-templates select="restrictionInstructions/dataDestruction"  mode="metadata"/>
            <xsl:apply-templates select="restrictionInstructions/dataDisclosure"   mode="metadata"/>
            <xsl:apply-templates select="restrictionInstructions/supersedure"      mode="metadata"/>
            
            <xsl:apply-templates select="restrictionInfo/copyright"                mode="metadata"/>
            <xsl:apply-templates select="restrictionInfo/policyStatement"          mode="metadata"/>
            <xsl:apply-templates select="restrictionInfo/dataConds"                mode="metadata"/>
        </tbody>
      </table>
    </td>
  </tr>
</xsl:template>

<xsl:template match="dataHandling|dataDestruction|dataDisclosure|supersedure" mode="metadata">
  <tr>
    <xsl:call-template name="brex-disabled-tooltip"/>
    <td>
      <xsl:value-of select="fn:getGenText(concat('meta-', name()))"/>
      <xsl:value-of select="fn:getGenText('sep1')"/>
    </td>
    <td>
      <xsl:apply-templates/>
    </td>
  </tr>
</xsl:template>

<xsl:template match="dataDistribution" mode="metadata">
  <tr>
    <td>
      <xsl:value-of select="fn:getGenText(concat('meta-', name()))"/>
      <xsl:value-of select="fn:getGenText('sep1')"/>
    </td>
    <td>
      <xsl:apply-templates/>
    </td>
  </tr>
</xsl:template>

<xsl:template match="exportControl" mode="metadata">
  <tr>
    <td>
      <xsl:value-of select="fn:getGenText('meta-exportControl')"/>
      <xsl:value-of select="fn:getGenText('sep1')"/>
    </td>
    <td>
      <xsl:apply-templates select="exportRegistrationCode" mode="metadata"/>
      <xsl:apply-templates select="exportRegistrationStmt" mode="metadata"/>
    </td>
  </tr>
</xsl:template>
    
<xsl:template match="exportRegistrationStmt" mode="metadata">
  <xsl:apply-templates mode="metadata"/>
</xsl:template>

<xsl:template match="exportRegistrationCode" mode="metadata">
  <xsl:value-of select="concat('[', @exportRegulationCodeType, '] ')"/>
</xsl:template>

<xsl:template match="copyright" mode="metadata">
  <tr>
    <td>
      <xsl:value-of select="fn:getGenText('meta-copyright')"/>
      <xsl:value-of select="fn:getGenText('sep1')"/>
    </td>
    <td>
      <xsl:apply-templates mode="metadata"/>
    </td>
  </tr>
</xsl:template>
    
<xsl:template match="copyrightPara" mode="metadata">
  <div>
    <xsl:apply-templates/>
  </div>
</xsl:template>

<xsl:template match="policyStatement|dataConds">
  <tr>
    <td>
      <xsl:value-of select="fn:getGenText(concat('meta-', name()))"/>
      <xsl:value-of select="fn:getGenText('sep1')"/>
    </td>
    <td>
      <xsl:apply-templates mode="metadata"/>
    </td>
  </tr>
</xsl:template>

<xsl:template match="responsiblePartnerCompany|originator" mode="metadata">
  <tr class="s-metadata-row">
    <td class="s-metadata-def">
      <xsl:value-of select="fn:getGenText(concat('meta-', name()))"/>
      <xsl:value-of select="fn:getGenText('sep1')"/>
    </td>
    <td class="s-metadata-term">
      <xsl:apply-templates select="enterpriseName" mode="metadata"/>
      <xsl:value-of select="concat(' [', @enterpriseCode, ']')"/>
    </td>
  </tr>
</xsl:template>

<xsl:template match="enterpriseName" mode="metadata">
  <span>
    <xsl:call-template name="brex-disabled-tooltip"/>
    <xsl:apply-templates/>
  </span>
</xsl:template>


<xsl:template match="applicCrossRefTableRef" mode="metadata">
  <tr class="s-metadata-row">
    <td class="s-metadata-def">
      <xsl:value-of select="fn:getGenText('meta-applicCrossRefTableRef')"/>
      <xsl:value-of select="fn:getGenText('sep1')"/>
    </td>
    <td class="s-metadata-term">
      <xsl:value-of select="ancestor::dmInclusion/@ref"/>
    </td>
  </tr>
</xsl:template>

<xsl:template match="applic" mode="metadata">
  <tr class="s-metadata-row">
    <td class="s-metadata-def">
      <xsl:value-of select="fn:getGenText('meta-applicability')"/>
      <xsl:value-of select="fn:getGenText('sep1')"/>
    </td>
    <td class="s-metadata-term">
      <xsl:apply-templates select="displayText" mode="metadata"/>
    </td>
  </tr>
</xsl:template>

<xsl:template match="referencedApplicGroup" mode="metadata">
  <tr class="s-metadata-row">
    <td class="s-metadata-def">
      <xsl:value-of select="fn:getGenText('meta-referencedApplicGroup')"/>
      <xsl:value-of select="fn:getGenText('sep1')"/>
    </td>
    <td class="s-metadata-term">
      <xsl:apply-templates select="applic/child::*" mode="metadata"/>
    </td>
  </tr>
</xsl:template>
    
<xsl:template match="displayText" mode="metadata">
  <xsl:apply-templates mode="metadata"/>
</xsl:template>

<xsl:template match="simplePara" mode="metadata">
  <div>
    <xsl:apply-templates/>
  </div>
</xsl:template>

<xsl:template match="techStandard" mode="metadata">
  <tr class="s-metadata-row">
    <td class="s-metadata-def">
      <xsl:value-of select="fn:getGenText('meta-techStandard')"/>
      <xsl:value-of select="fn:getGenText('sep1')"/>
    </td>
    <td class="s-metadata-term">
      <table>
        <tbody>
          <xsl:apply-templates select="authorityInfo"       mode="metadata"/>
          <xsl:apply-templates select="techPubBase"         mode="metadata"/>
          <xsl:apply-templates select="authorityExceptions" mode="metadata"/>
          <xsl:apply-templates select="authorityNotes"      mode="metadata"/>
        </tbody>
      </table>
    </td>
  </tr>
</xsl:template>

<xsl:template match="authorityInfo" mode="metadata">
  <tr>
    <td>
      <xsl:value-of select="fn:getGenText('meta-authorityInfo')"/>
      <xsl:value-of select="fn:getGenText('sep1')"/>
    </td>
    <td>
      <xsl:apply-templates mode="metadata"/>
    </td>
  </tr>
</xsl:template>

<xsl:template match="authorityExceptions" mode="metadata">
  <tr>
    <td>
      <xsl:value-of select="fn:getGenText('meta-authorityExceptions')"/>
      <xsl:value-of select="fn:getGenText('sep1')"/>
    </td>
    <td></td>
  </tr>
  <tr>
    <td></td>
    <td>
      <xsl:apply-templates select="productConfiguration" mode="metadata"/>
      <xsl:apply-templates select="retrofit" mode="metadata"/>
    </td>
  </tr>
</xsl:template>

<xsl:template match="productConfiguration" mode="metadata">
  <div class="s-metadata-ts">
    <xsl:value-of select="fn:getGenText('meta-productConfiguration')"/>
    <xsl:value-of select="fn:getGenText('sep1')"/>
  </div>
  <table>
    <tbody>
      <xsl:apply-templates mode="metadata"/>
    </tbody>
  </table>
</xsl:template>
    
<xsl:template match="excludedModification" mode="metadata">
  <tr>
    <td>
      <xsl:value-of select="fn:getGenText('meta-excludedModification')"/>
      <xsl:value-of select="fn:getGenText('sep1')"/>
    </td>
    <td>
      <xsl:apply-templates/>
    </td>
  </tr>
</xsl:template>

<xsl:template match="additionalModification" mode="metadata">
  <tr>
    <td>
      <xsl:value-of select="fn:getGenText('meta-additionalModification')"/>
      <xsl:value-of select="fn:getGenText('sep1')"/>
    </td>
    <td>
      <xsl:apply-templates/>
    </td>
  </tr>
</xsl:template>
    
<xsl:template match="retrofit" mode="metadata">
  <div class="ietm_metadata-ts">
    <xsl:value-of select="fn:getGenText('meta-retrofit')"/>
  </div>
  <table>
    <tbody>
      <tr>
        <td>
          <xsl:value-of select="fn:getGenText('meta-modification')"/>
          <xsl:value-of select="fn:getGenText('sep1')"/>
        </td>
        <td>
          <xsl:apply-templates mode="metadata"/>
        </td>
      </tr>
    </tbody>
  </table>
</xsl:template>

<xsl:template match="modification" mode="metadata">
  <xsl:value-of select="fn:getGenText('meta-authorization')"/>
  <xsl:value-of select="@authorizationIdent"/>
  <xsl:apply-templates mode="metadata"/>
</xsl:template>

<xsl:template match="modificationTitle" mode="metadata">
  <div>
    <xsl:value-of select="fn:getGenText('meta-modificationTitle')"/>
    <xsl:apply-templates/>
  </div>
</xsl:template>

<xsl:template match="authorityNotes" mode="metadata">
  <tr>
    <td>
      <xsl:value-of select="fn:getGenText('meta-authorityNotes')"/>
    </td>
    <td>
      <xsl:apply-templates mode="metadata"/>
    </td>
  </tr>
</xsl:template>

<xsl:template match="brexDmRef" mode="metadata">
  <tr class="s-metadata-row">
    <td class="s-metadata-def">
      <xsl:value-of select="fn:getGenText('meta-brex')"/>
      <xsl:value-of select="fn:getGenText('sep1')"/>
    </td>
    <td class="s-metadata-term">
      <xsl:value-of select="fn:getDMC(dmRef/dmRefIdent/dmCode)"/>
    </td>
  </tr>
</xsl:template>
    
<xsl:template match="qualityAssurance" mode="metadata">
  <tr class="s-metadata-row">
    <td class="s-metadata-def">
      <xsl:value-of select="fn:getGenText('meta-quality')"/>
      <xsl:value-of select="fn:getGenText('sep1')"/>
    </td>
    <td class="s-metadata-term">
      <xsl:apply-templates mode="metadata"/>
    </td>
  </tr>
</xsl:template>

<xsl:template match="unverified" mode="metadata">
  <div>
    <xsl:value-of select="fn:getGenText('meta-unverified')"/>
  </div>
</xsl:template>

<xsl:template match="firstVerification" mode="metadata">
  <div>
    <xsl:value-of select="fn:getGenText('meta-firstVerification')"/>
    <xsl:value-of select="fn:getGenText(concat('meta-verification-', @verificationType))"/>
  </div>
</xsl:template>

<xsl:template match="secondVerification" mode="metadata">
  <div>
    <xsl:value-of select="fn:getGenText('meta-secondVerification')"/>
    <xsl:value-of select="fn:getGenText(concat('meta-verification-', @verificationType))"/>
  </div>
</xsl:template>

<xsl:template match="skillLevel" mode="metadata">
  <tr class="s-metadata-row">
    <td class="s-metadata-def">
      <xsl:value-of select="fn:getGenText('meta-skillLevel')"/>
      <xsl:value-of select="fn:getGenText('sep1')"/>
    </td>
    <td class="s-metadata-term">
      <xsl:choose>
        <xsl:when test="contains('sk01,sk02,sk03', @skillLevelCode)">
          <xsl:value-of select="fn:getGenText(concat('meta-skill-', @skillLevelCode))"/>
        </xsl:when>
        <xsl:otherwise>
          <xsl:value-of select="@skillLevelCode"/>
        </xsl:otherwise>
      </xsl:choose>
    </td>
  </tr>
</xsl:template>

<xsl:template match="reasonForUpdate" mode="metadata">
  <tr class="s-metadata-row">
    <td class="s-metadata-def">
      <xsl:value-of select="fn:getGenText('meta-reasonForUpdate')"/>
      <xsl:value-of select="fn:getGenText('sep1')"/>
    </td>
    <td class="s-metadata-term">
      <xsl:apply-templates mode="metadata"/>
    </td>
  </tr>
</xsl:template>

<xsl:template match="functionalItemCode" mode="metadata">
  <tr class="s-metadata-row">
    <td class="s-metadata-def">
      <xsl:value-of select="fn:getGenText('meta-functionalItemCode')"/>
      <xsl:value-of select="fn:getGenText('sep1')"/>
    </td>
    <td class="s-metadata-term">
      <xsl:apply-templates/>
    </td>
  </tr>
</xsl:template>

<xsl:template match="functionalItemRef" mode="metadata">
  <tr class="s-metadata-row">
    <td class="s-metadata-def">
      <xsl:value-of select="fn:getGenText('meta-functionalItemRef')"/>
      <xsl:value-of select="fn:getGenText('sep1')"/>
    </td>
    <td class="s-metadata-term">
      <xsl:apply-templates/>
    </td>
  </tr>
</xsl:template>

<xsl:template match="systemBreakdownCode" mode="metadata">
  <tr class="s-metadata-row">
    <td class="s-metadata-def">
      <xsl:value-of select="fn:getGenText('meta-systemBreakdownCode')"/>
      <xsl:value-of select="fn:getGenText('sep1')"/>
    </td>
    <td class="s-metadata-term">
      <xsl:apply-templates/>
    </td>
  </tr>
</xsl:template>

<xsl:template match="productSafety" mode="metadata">
  <tr class="s-metadata-row">
    <td class="s-metadata-def">
      <xsl:value-of select="fn:getGenText('meta-productSafety')"/>
      <xsl:value-of select="fn:getGenText('sep1')"/>
    </td>
    <td class="s-metadata-term">
      <xsl:apply-templates mode="metadata"/>
    </td>
  </tr>
</xsl:template>

<xsl:template match="remarks" mode="metadata">
  <tr class="s-metadata-row">
    <td class="s-metadata-def">
      <xsl:value-of select="fn:getGenText('meta-remarks')"/>
      <xsl:value-of select="fn:getGenText('sep1')"/>
    </td>
    <td class="s-metadata-term">
      <xsl:apply-templates mode="metadata"/>
    </td>
  </tr>
</xsl:template>

</xsl:stylesheet>


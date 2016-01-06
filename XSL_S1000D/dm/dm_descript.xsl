<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:fn="http://www.pwc.ca"
    xmlns:xs="http://www.w3.org/2001/XMLSchema"
    xmlns:saxon="http://saxon.sf.net/"
    xmlns="http://www.w3.org/1999/xhtml"
    exclude-result-prefixes="xs fn saxon #default"
    version="2.0">
    
<xsl:template match="description">
  <div class="s-descript">
    <xsl:apply-templates/>
  </div>
</xsl:template>
    
<xsl:template match="levelledPara">
  <div class="s-lPara">
    <xsl:call-template name="setID"/>
    <div class="s-lPara-nb" id="{generate-id(.)}">
      <xsl:if test="ancestor::dmInclusion/@is-fm='false'">
        <xsl:apply-templates select="." mode="numbering"/>
      </xsl:if>
    </div>
    <div class="s-lPara-c">
      <xsl:apply-templates/>
    </div>    
  </div>
</xsl:template>
    
<xsl:template match="levelledPara/title">
  <div class="s-lPara-title">
    <xsl:apply-templates/>
  </div>
</xsl:template>
    
<xsl:template match="levelledPara/*[1][self::para]">
  <div class="s-para s-para-lPara-first">
    <xsl:apply-templates/>
  </div>
</xsl:template>
    
    <xsl:template match="levelledPara[@id='frontMatter']">
        <xsl:variable name="volume" select="number(substring($g_pmc, string-length($g_pmc) - 2))"/>
        <div id="ietm_titlepage">
            <!-- <h1><xsl:value-of select="para[@id='productIntroName']"/></h1> -->
                <h1><img class="ietm_symbol" alt="{figure[@id='productLogo']/title}" 
                    src="{concat('javascript:void(', figure[@id='productLogo']/graphic/@infoEntityIdent, ')')}"/></h1>
            <h2>
                <xsl:value-of select="/dmodule/identAndStatusSection/dmAddress/dmAddressItems/dmTitle/techName"/>
                <xsl:if test="$volume > 0">
                    <xsl:text>&#160;-&#032;</xsl:text>
                    <xsl:value-of select="fn:getGenText('volume')"/>
                    <xsl:text>&#160;</xsl:text>
                    <xsl:value-of select="$volume"/>    
                </xsl:if>
            </h2>
            <!--<div class="ietm_metadata">
                <xsl:text>(</xsl:text>
                <xsl:value-of select="fn:getDMC(/dmodule/identAndStatusSection/dmAddress/dmIdent/dmCode)"/>
                <xsl:text>,&#032;</xsl:text>
                <xsl:value-of select="fn:getGenText('meta-issue')"/>
                <xsl:text>&#032;</xsl:text>
                <xsl:value-of select="$g_pm_issue"/>
                <xsl:text>&#032;-&#032;</xsl:text>
                <xsl:apply-templates select="/dmodule/identAndStatusSection/dmAddress/dmAddressItems/issueDate" mode="metadata"/>
                <xsl:text>,&#032;</xsl:text>
                <xsl:apply-templates select="/dmodule/identAndStatusSection/dmStatus/security" mode="metadata"/>
                <xsl:text>)</xsl:text>
            </div> -->
            <h3>
                <xsl:value-of select="$g_pmc"/>
            </h3>
            <h4>
                <xsl:value-of select="fn:getGenText('issueNo')"/>
                <xsl:text>&#160;</xsl:text>
                <xsl:value-of select="$g_issue"/>
                <xsl:text>,&#032;</xsl:text>
                <xsl:value-of select="$g_issue_date"/>
        <xsl:if test="$g_issue = '000'">
          <xsl:text>&#032;-&#032;</xsl:text>
          <span class="ietm_certification"><xsl:value-of select="fn:getGenText('certification')"/></span>
        </xsl:if>
            </h4>
            <h4>
                <xsl:value-of select="fn:getGenText('titlepage_classification')"/>
                <xsl:text>:&#160;</xsl:text>
                <xsl:apply-templates select="/dmodule/identAndStatusSection/dmStatus/security" mode="metadata" />
            </h4>
            <div class="ietm_titlepage-logo">
                <img class="ietm_symbol" alt="{figure[@id='productIllustration']/title}" 
                    src="{concat('javascript:void(', figure[@id='productIllustration']/graphic/@infoEntityIdent, ')')}"/>
            </div>
            <!-- <xsl:apply-templates select="/dmodule/identAndStatusSection/dmStatus/dataRestrictions/restrictionInstructions/dataDistribution" mode="title-page"/> -->
            <xsl:apply-templates select="/dmodule/identAndStatusSection/dmStatus/dataRestrictions/restrictionInstructions/exportControl" mode="title-page"/>  
            <xsl:apply-templates select="/dmodule/identAndStatusSection/dmStatus/dataRestrictions/restrictionInstructions/dataHandling" mode="title-page"/> 
            <xsl:apply-templates select="/dmodule/identAndStatusSection/dmStatus/dataRestrictions/restrictionInstructions/dataDisclosure" mode="title-page"/> 
            <xsl:apply-templates select="/dmodule/identAndStatusSection/dmStatus/dataRestrictions/restrictionInfo/copyright" mode="title-page"/>    
        </div>
    </xsl:template>
    
    <xsl:template match="copyright|dataDisclosure|dataDistribution|dataHandling|exportControl" mode="title-page">
        <div class="ietm_titlepage-block">
            <h4>
                <xsl:value-of select="fn:getGenText(concat('titlepage_', local-name(.)))"/>
            </h4>
            <div class="ietm_titlepage-block-content">
                <xsl:apply-templates mode="title-page"/>     
            </div>
        </div>
    </xsl:template>
    
    <xsl:template match="exportRegistrationStmt|copyrightPara" mode="title-page">
        <xsl:apply-templates mode="title-page"/>
    </xsl:template>
    
    <xsl:template match="exportRegistrationCode" mode="title-page"/>
    
</xsl:stylesheet>
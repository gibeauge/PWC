<?xml version="1.0" encoding="UTF-8"?>

<!DOCTYPE xsl:stylesheet [
    <!ENTITY % entities_commun SYSTEM "xsl_entities_commun.ent">
    %entities_commun;
]>

<xsl:stylesheet
  xmlns="http://www.w3.org/1999/xhtml" 
  xmlns:exslt="http://exslt.org/common"
  xmlns:xsl="http://www.w3.org/1999/XSL/Transform" 
  xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
  xmlns:atidlm="http://www.arbortext.com/namespace/atidlm"   
  xmlns:_gte="http://www.arbortext.com/namespace/Styler/GeneratedTextElements"
  xmlns:_ufe="http://www.arbortext.com/namespace/Styler/UserFormattingElements" 
  xmlns:_sfe="http://www.arbortext.com/namespace/Styler/StylerFormattingElements" 
  version="1.0" 
  exclude-result-prefixes="xml xsi exslt _ufe _sfe _gte atidlm">
  
  <!-- GENERAL -->
  
  <xsl:template name="expand-gentext-default">
    <xsl:copy>
      <xsl:apply-templates select="@*|node()" mode="gentext"/>
    </xsl:copy>  
  </xsl:template>
    
  <xsl:template name="expand-gentext-expanded">
    <xsl:copy>
      <xsl:attribute name="_gte:Gentext-Expanded">y</xsl:attribute>
      <xsl:apply-templates select="@*|node()" mode="gentext"/>
    </xsl:copy>
  </xsl:template>
  
  <xsl:template name="expand-gentext">
    <xsl:param name="content" as="item()*"/>
    <xsl:copy>
      <xsl:attribute name="_gte:Gentext-Expanded">y</xsl:attribute>
      <xsl:apply-templates select="@*" mode="gentext"/>
      <xsl:if test="not(@_gte:Gentext-Expanded)">
        <_sfe:BeforeOrAfterText>
          <xsl:copy-of select="exslt:node-set($content)"/>
        </_sfe:BeforeOrAfterText>
      </xsl:if>
      <xsl:apply-templates select="* | text() | processing-instruction()" mode="gentext"/>
    </xsl:copy>
  </xsl:template>
  
  <xsl:template name="expand-gentext2">
    <xsl:param name="content" as="item()*"/>
    <xsl:copy>
      <xsl:attribute name="_gte:Gentext-Expanded">y</xsl:attribute>
      <xsl:apply-templates select="@* | * | text() | processing-instruction()" mode="gentext"/>
      <xsl:if test="not(@_gte:Gentext-Expanded)">
        <_sfe:BeforeOrAfterText>
          <xsl:copy-of select="exslt:node-set($content)"/>
        </_sfe:BeforeOrAfterText>
      </xsl:if>
    </xsl:copy>
  </xsl:template>
  
  <xsl:template name="expand-gentext3">
    <xsl:param name="content-before" as="item()*"/>
    <xsl:param name="content-after" as="item()*"/>
    <xsl:copy>
      <xsl:attribute name="_gte:Gentext-Expanded">y</xsl:attribute>
      <xsl:apply-templates select="@*" mode="gentext"/>
      <xsl:if test="not(@_gte:Gentext-Expanded)">
        <_sfe:BeforeOrAfterText>
          <xsl:copy-of select="exslt:node-set($content-before)"/>
        </_sfe:BeforeOrAfterText>
      </xsl:if>
      <xsl:apply-templates select="* | text() | processing-instruction()" mode="gentext"/>
      <xsl:if test="not(@_gte:Gentext-Expanded)">
        <_sfe:BeforeOrAfterText>
          <xsl:copy-of select="exslt:node-set($content-after)"/>
        </_sfe:BeforeOrAfterText>
      </xsl:if>
    </xsl:copy>
  </xsl:template>
  
  <xsl:template name="expand-gentext-numbering">
    <xsl:call-template name="expand-gentext">
      <xsl:with-param name="content">
        <xsl:call-template name="t-styler-numbering"/>
      </xsl:with-param>
    </xsl:call-template>
  </xsl:template>
  
  <xsl:template name="expand-gentext-numbering2">
    <xsl:call-template name="expand-gentext">
      <xsl:with-param name="content">
        <span style="text-decoration: underline; "><xsl:call-template name="t-styler-numbering"/></span>
        <xsl:text>&#xa0;</xsl:text>
        <xsl:text>&#xa0;</xsl:text>
      </xsl:with-param>
    </xsl:call-template>
  </xsl:template>
  
  <xsl:template name="expand-gentext-numbering3">
    <xsl:call-template name="expand-gentext">
      <xsl:with-param name="content">
        <xsl:call-template name="t-styler-numbering"/>
        <xsl:text>&#xa0;</xsl:text>
      </xsl:with-param>
    </xsl:call-template>
  </xsl:template>
  
  <xsl:template name="expand-gentext-numbering4">
    <xsl:copy>
      <xsl:attribute name="_gte:Gentext-Expanded">y</xsl:attribute>
      <xsl:apply-templates mode="gentext" select="@*"/>
      <xsl:if test="not(@_gte:Gentext-Expanded)">
        <_sfe:BeforeOrAfterText>
          <xsl:call-template name="t-styler-numbering"/>
          <xsl:text>&#xa0;</xsl:text>
          <xsl:text>&#xa0;</xsl:text>
        </_sfe:BeforeOrAfterText>
      </xsl:if>
      <xsl:choose>
        <xsl:when test="not(@_gte:Gentext-Expanded)">
          <span style="text-decoration: underline;">
            <xsl:apply-templates mode="gentext" select="* | text() | processing-instruction()"/> 
          </span>
        </xsl:when>
        <xsl:otherwise>
          <xsl:apply-templates mode="gentext" select="* | text() | processing-instruction()"/>
        </xsl:otherwise>
      </xsl:choose>
    </xsl:copy>
  </xsl:template>
  
  <xsl:template name="expand-gentext-numbering5">
    <xsl:call-template name="expand-gentext">
      <xsl:with-param name="content">
        <xsl:call-template name="t-styler-numbering"/>          
        <xsl:text>&#xa0;</xsl:text>
        <xsl:text>&#xa0;</xsl:text>
      </xsl:with-param>
    </xsl:call-template>
  </xsl:template>
  
  <xsl:template name="expand-gentext-bullet">
    <xsl:param name="bullet" select="'•'"/>
    <xsl:call-template name="expand-gentext">
      <xsl:with-param name="content">
        <xsl:value-of select="$bullet"/>
        <xsl:text>&#xa0;</xsl:text>
      </xsl:with-param>
    </xsl:call-template>
  </xsl:template>

  <xsl:template name="expand-gentext-caution">
    <xsl:call-template name="expand-gentext">
      <xsl:with-param name="content">
        <span class=" x-caution-label-1-0">
          <xsl:value-of select="concat($gen-texts//text[@name='caution'], $gen-texts//text[@name='sep0'])"/>
        </span>
        <xsl:text> </xsl:text>
      </xsl:with-param>
    </xsl:call-template>
  </xsl:template>

  <xsl:template name="expand-gentext-warning">
    <xsl:call-template name="expand-gentext">
      <xsl:with-param name="content">
        <span class=" x-warning-label-1-0">
          <xsl:value-of select="concat($gen-texts//text[@name='warning'], $gen-texts//text[@name='sep0'])"/>
        </span>
        <xsl:text> </xsl:text>
      </xsl:with-param>
    </xsl:call-template>
  </xsl:template>
      
  <!--  UFE  -->
  
  <xsl:template name="t-styler-numbering-ufe">
    <xsl:variable name="gte_id">
      <xsl:choose>
        <xsl:when test="@_gte:id">
          <xsl:value-of select="@_gte:id"/>
        </xsl:when>
        <xsl:otherwise>
          <xsl:value-of select="'_g_'"/>
          <xsl:value-of select="generate-id(.)"/>
        </xsl:otherwise>
      </xsl:choose>
    </xsl:variable>
    <_gte:styler_numbering gte_id="{$gte_id}"/>
  </xsl:template>
  
  <xsl:template name="expand-gentext-ufe">
    <xsl:param name="content" as="item()*"/>
    <xsl:copy>
      <xsl:attribute name="_gte:Gentext-Expanded">y</xsl:attribute>
      <xsl:apply-templates select="@*" mode="gentext"/>
      <xsl:if test="not(@_gte:id)">
        <xsl:attribute name="_gte:id">
          <xsl:value-of select="'_g_'"/>
          <xsl:value-of select="generate-id(.)"/>
        </xsl:attribute>
      </xsl:if>
      <xsl:if test="not(@_gte:Gentext-Expanded)">
        <_sfe:BeforeOrAfterText>
          <xsl:copy-of select="exslt:node-set($content)"/>
        </_sfe:BeforeOrAfterText>
      </xsl:if>
      <xsl:apply-templates select="* | text() | processing-instruction()" mode="gentext"/>
    </xsl:copy>
  </xsl:template>
      
  <xsl:template name="expand-gentext-ufe-numbering">
    <xsl:call-template name="expand-gentext-ufe">
      <xsl:with-param name="content">
        <xsl:call-template name="t-styler-numbering-ufe"/>
        <xsl:text>&#xa0;</xsl:text>
        <xsl:text> </xsl:text>
      </xsl:with-param>
    </xsl:call-template>
  </xsl:template>
  
  <xsl:template name="expand-gentext-ufe-numbering2">
    <xsl:call-template name="expand-gentext-ufe">
      <xsl:with-param name="content">
        <xsl:call-template name="t-styler-numbering-ufe"/>
        <xsl:text>&#xa0;</xsl:text>
      </xsl:with-param>
    </xsl:call-template>
  </xsl:template>
    
  <xsl:template name="expand-gentext-pgblk-ufe-title">
    <xsl:call-template name="expand-gentext-ufe">
      <xsl:with-param name="content">
        <xsl:call-template name="t-styler-numbering-ufe"/>
        <xsl:text>&#xa0;</xsl:text>
      </xsl:with-param>
    </xsl:call-template>
  </xsl:template>

  <xsl:template name="expand-gentext-pgblk-ufe-title2">
    <xsl:param name="content" select="''"/>
    <xsl:call-template name="expand-gentext-ufe">
      <xsl:with-param name="content">
        <xsl:call-template name="t-styler-numbering-ufe"/>
        <xsl:text>&#xa0;</xsl:text>
        <xsl:text>&#xa0;</xsl:text>
        <span style="text-decoration: underline; "><xsl:value-of select="$content"/></span>
      </xsl:with-param>
    </xsl:call-template>
</xsl:template>

  <!-- TEMPLATE -->

  <xsl:template match="numlist/address" mode="gentext" priority="7">
    <xsl:call-template name="expand-gentext-numbering"/>
  </xsl:template>
  
  <xsl:template match="sbdata/address|alpha-list/address" mode="gentext" priority="6">
    <xsl:call-template name="expand-gentext-bullet">
      <xsl:with-param name="bullet">•</xsl:with-param>
    </xsl:call-template>
  </xsl:template>
  
  <xsl:template match="num-list/address|pwcchapsect-list/address" mode="gentext" priority="5">
    <xsl:call-template name="expand-gentext-bullet">
      <xsl:with-param name="bullet">•</xsl:with-param>
    </xsl:call-template>
  </xsl:template>
    
  <xsl:template match="address/att" mode="gentext" priority="1">
    <xsl:call-template name="expand-gentext">
      <xsl:with-param name="content"><xsl:value-of select="$gen-texts//text[@name='address-att']"/><xsl:value-of select="$gen-texts//text[@name='sep1']"/></xsl:with-param>
    </xsl:call-template>
  </xsl:template>
    
  <xsl:template match="book" mode="gentext" priority="0">
    <xsl:call-template name="expand-gentext">
      <xsl:with-param name="content">
        <_gte:MetaElement>
          <_gte:MetaName>
            <xsl:text>dmp:projectname</xsl:text>
          </_gte:MetaName>
          <_gte:MetaValue>
            <xsl:value-of select="@doctype"/>
            <xsl:text>_</xsl:text>
            <xsl:value-of select="@model"/>
            <xsl:text>_</xsl:text>
            <xsl:value-of select="@manualpnr"/>
          </_gte:MetaValue>
        </_gte:MetaElement>
        <_gte:MetaElement>
          <_gte:MetaName>
            <xsl:text>dmp:version</xsl:text>
          </_gte:MetaName>
          <_gte:MetaValue>
            <xsl:value-of select="@revnbr"/>
            <xsl:text>.</xsl:text>
            <xsl:value-of select="@point-revnbr"/>
          </_gte:MetaValue>
        </_gte:MetaElement>
      </xsl:with-param>
    </xsl:call-template>
  </xsl:template>
  
  <xsl:template match="brk" mode="gentext" priority="0">
    <xsl:call-template name="expand-gentext-default"/>
  </xsl:template>
  
  <xsl:template match="figure/key/callout" mode="gentext" priority="1">
    <xsl:call-template name="expand-gentext2">
      <xsl:with-param name="content"><xsl:text>&#xa0;</xsl:text></xsl:with-param>
    </xsl:call-template>
  </xsl:template>
  
  <xsl:template match="caution[parent::fandc or parent::spec-assem or parent::spring-pressure or parent::torque-and-stretch or parent::fits-and-clears]" mode="gentext" priority="6">
   <xsl:call-template name="expand-gentext-default"/>
  </xsl:template>
  
  <xsl:template match="caution" mode="gentext" priority="0">
    <xsl:call-template name="expand-gentext-caution"/>
  </xsl:template>
  
  <xsl:template match="chapsect-list" mode="gentext" priority="0">
    <xsl:call-template name="expand-gentext">
      <xsl:with-param name="content"><_ufe:chapsect-title/></xsl:with-param>
    </xsl:call-template>
  </xsl:template>
  
  <xsl:template match="pgblk/_ufe:chapsect-title" mode="gentext" priority="2">
    <xsl:call-template name="expand-gentext-pgblk-ufe-title"/>
  </xsl:template>
  
  <xsl:template match="pbfmatr/_ufe:chapsect-title" mode="gentext" priority="1">
    <xsl:call-template name="expand-gentext-pgblk-ufe-title"/>
  </xsl:template>
  
  <xsl:template match="_ufe:chapsect-title" mode="gentext" priority="0">
    <xsl:call-template name="expand-gentext-ufe">
      <xsl:with-param name="content"><xsl:value-of select="$gen-texts//text[@name='chapsect-title']"/></xsl:with-param>
    </xsl:call-template>    
  </xsl:template>
    
  <xsl:template match="pgblk/_ufe:cir-title" mode="gentext" priority="2">
    <xsl:call-template name="expand-gentext-pgblk-ufe-title"/>
  </xsl:template>
  
  <xsl:template match="pbfmatr/_ufe:cir-title" mode="gentext" priority="1">
    <xsl:call-template name="expand-gentext-pgblk-ufe-title"/>
  </xsl:template>
  
  <xsl:template match="_ufe:cir-title" mode="gentext" priority="0">
    <xsl:call-template name="expand-gentext-ufe">
      <xsl:with-param name="content"><xsl:value-of select="$gen-texts//text[@name='cir-title']"/></xsl:with-param>
    </xsl:call-template>    
  </xsl:template>
  
  <xsl:template match="city" mode="gentext" priority="0">
    <xsl:call-template name="expand-gentext2">
      <xsl:with-param name="content">
        <xsl:choose>
          <xsl:when test="not(./*[not(self::_sfe:BeforeOrAfterText)]|./text()[normalize-space(.)!=''])"/>
          <xsl:otherwise>
            <xsl:text>, </xsl:text>
          </xsl:otherwise>
        </xsl:choose>
      </xsl:with-param>
    </xsl:call-template>
  </xsl:template>
  
  <xsl:template match="consumable" mode="gentext" priority="0">
    <xsl:call-template name="expand-gentext">
      <xsl:with-param name="content"><xsl:value-of select="@id"/></xsl:with-param>
    </xsl:call-template>
  </xsl:template>
  
  <xsl:template match="pgblk/_ufe:consumables-title" mode="gentext" priority="5">
    <xsl:call-template name="expand-gentext-pgblk-ufe-title"/>
  </xsl:template>
  
  <xsl:template match="pbfmatr/_ufe:consumables-title" mode="gentext" priority="4">
    <xsl:call-template name="expand-gentext-pgblk-ufe-title"/>
  </xsl:template>
  
  <xsl:template match="pwcspblist/_ufe:consumables-title" mode="gentext" priority="3">
    <xsl:call-template name="expand-gentext-pgblk-ufe-title"/>
  </xsl:template>
  
  <xsl:template match="ata-page-block//consumables//_ufe:consumables-title" mode="gentext" priority="2">
    <xsl:call-template name="expand-gentext-pgblk-ufe-title2">
      <xsl:with-param name="content"><xsl:value-of select="$gen-texts//text[@name='consumables-title']"/></xsl:with-param>
    </xsl:call-template>
  </xsl:template>
  
  <xsl:template match="page-block//consumables//_ufe:consumables-title" mode="gentext" priority="1">
    <xsl:call-template name="expand-gentext-pgblk-ufe-title2">
      <xsl:with-param name="content"><xsl:value-of select="$gen-texts//text[@name='consumables-title']"/></xsl:with-param>
    </xsl:call-template>
  </xsl:template>
  
  <xsl:template match="_ufe:consumables-title" mode="gentext" priority="0">
    <xsl:call-template name="expand-gentext-default"/>
  </xsl:template>
    
  <xsl:template match="dash" mode="gentext" priority="0">
    <xsl:call-template name="expand-gentext">
      <xsl:with-param name="content">
        <xsl:text>—</xsl:text>
      </xsl:with-param>
    </xsl:call-template>
  </xsl:template>
    
  <xsl:template match="deflist/def|key/def" mode="gentext" priority="2">
    <xsl:call-template name="expand-gentext2">
      <xsl:with-param name="content"><xsl:processing-instruction name="Pub">_newline</xsl:processing-instruction></xsl:with-param>
    </xsl:call-template>
  </xsl:template>
    
  <xsl:template match="deleted" mode="gentext" priority="0">
    <xsl:call-template name="expand-gentext">
      <xsl:with-param name="content"><xsl:value-of select="$gen-texts//text[@name='deleted']"/></xsl:with-param>
    </xsl:call-template>
  </xsl:template>
  
  <xsl:template match="pgblk/_ufe:eipc-title" mode="gentext" priority="2">
    <xsl:call-template name="expand-gentext-pgblk-ufe-title"/>
  </xsl:template>
  
  <xsl:template match="pbfmatr/_ufe:eipc-title" mode="gentext" priority="1">
    <xsl:call-template name="expand-gentext-pgblk-ufe-title"/>
  </xsl:template>
  
  <xsl:template match="_ufe:eipc-title" mode="gentext" priority="0">
    <xsl:call-template name="expand-gentext-ufe">
      <xsl:with-param name="content"><xsl:value-of select="$gen-texts//text[@name='eipc-title']"/></xsl:with-param>
    </xsl:call-template>
  </xsl:template>
  
  <xsl:template match="pgblk/_ufe:em-title" mode="gentext" priority="2">
    <xsl:call-template name="expand-gentext-pgblk-ufe-title"/>
  </xsl:template>
  
  <xsl:template match="pbfmatr/_ufe:em-title" mode="gentext" priority="1">
    <xsl:call-template name="expand-gentext-pgblk-ufe-title"/>
  </xsl:template>
  
  <xsl:template match="_ufe:em-title" mode="gentext" priority="0">
    <xsl:call-template name="expand-gentext-ufe">
      <xsl:with-param name="content"><xsl:value-of select="$gen-texts//text[@name='em-title']"/></xsl:with-param>
    </xsl:call-template>    
  </xsl:template>
  
  <xsl:template match="email" mode="gentext" priority="0">
    <xsl:call-template name="expand-gentext">
      <xsl:with-param name="content">
        <xsl:value-of select="$gen-texts//text[@name='address-email']"/><xsl:value-of select="$gen-texts//text[@name='sep1']"/>
        <_ufe:email-link>
          <xsl:if test="string(.)">
            <xsl:attribute name="email">
              <xsl:value-of select="string(.)"/>
            </xsl:attribute>
          </xsl:if>
        </_ufe:email-link>
      </xsl:with-param>
    </xsl:call-template>
  </xsl:template>
  
  <xsl:template match="_ufe:email-link" mode="gentext" priority="0">
    <xsl:call-template name="expand-gentext-ufe">
      <xsl:with-param name="content">
        <_sfe:ExternalLink>
          <xsl:if test="concat('mailto:', string(./@email))">
            <xsl:attribute name="href">
              <xsl:value-of select="concat('mailto:', string(./@email))"/>
            </xsl:attribute>
          </xsl:if>
          <xsl:value-of select="@email"/>
        </_sfe:ExternalLink>
      </xsl:with-param>
    </xsl:call-template>
  </xsl:template>
  
  <xsl:template match="engine[position()&gt;1]" mode="gentext" priority="1">
    <xsl:call-template name="expand-gentext">
      <xsl:with-param name="content"><xsl:text>/</xsl:text></xsl:with-param>
    </xsl:call-template>
  </xsl:template>
    
  <xsl:template match="_ufe:engine-type" mode="gentext" priority="0">
    <xsl:call-template name="expand-gentext-ufe">
      <xsl:with-param name="content">
        <xsl:choose>
          <xsl:when test="@enginetype='APU'"><xsl:value-of select="$gen-texts//text[@name='engine-type-apu']"/></xsl:when>
          <xsl:when test="@enginetype='APS'"><xsl:value-of select="$gen-texts//text[@name='engine-type-aps']"/></xsl:when>
          <xsl:when test="@enginetype='SHAFT'"><xsl:value-of select="$gen-texts//text[@name='engine-type-shaft']"/></xsl:when>
          <xsl:when test="@enginetype='PROP'"><xsl:value-of select="$gen-texts//text[@name='engine-type-prop']"/></xsl:when>
          <xsl:when test="@enginetype='FAN'"><xsl:value-of select="$gen-texts//text[@name='engine-type-fan']"/></xsl:when>
        </xsl:choose>
      </xsl:with-param>
    </xsl:call-template>
  </xsl:template>
  
  <xsl:template match="address/fax" mode="gentext" priority="1">
    <xsl:call-template name="expand-gentext">
      <xsl:with-param name="content"><xsl:value-of select="$gen-texts//text[@name='address-fax']"/><xsl:value-of select="$gen-texts//text[@name='sep1']"/></xsl:with-param>
    </xsl:call-template>
  </xsl:template>
  
  <xsl:template match="pgblk/_ufe:fixequ-title" mode="gentext" priority="5">
   <xsl:call-template name="expand-gentext-pgblk-ufe-title"/>
  </xsl:template>
  
  <xsl:template match="pbfmatr/_ufe:fixequ-title" mode="gentext" priority="4">
   <xsl:call-template name="expand-gentext-pgblk-ufe-title"/>
  </xsl:template>
  
  <xsl:template match="pwcspblist/_ufe:fixequ-title" mode="gentext" priority="3">
    <xsl:call-template name="expand-gentext-pgblk-ufe-title"/>
  </xsl:template>
  
  <xsl:template match="page-block//fixtures-and-equipment//_ufe:fixequ-title" mode="gentext" priority="2">
    <xsl:call-template name="expand-gentext-pgblk-ufe-title2">
      <xsl:with-param name="content"><xsl:value-of select="$gen-texts//text[@name='fixequ-title']"/></xsl:with-param>
    </xsl:call-template>
  </xsl:template>
  
  <xsl:template match="ata-page-block//fixtures-and-equipment//_ufe:fixequ-title" mode="gentext" priority="1">
    <xsl:call-template name="expand-gentext-pgblk-ufe-title2">
      <xsl:with-param name="content"><xsl:value-of select="$gen-texts//text[@name='fixequ-title']"/></xsl:with-param>
    </xsl:call-template>
  </xsl:template>
  
  <xsl:template match="_ufe:fixequ-title" mode="gentext" priority="0">
    <xsl:call-template name="expand-gentext-default"/>
  </xsl:template>
  
  <xsl:template match="eqn/frac" mode="gentext" priority="20">
    <xsl:call-template name="expand-gentext">
      <xsl:with-param name="content">
        <table frame="none" id="frac01" tabstyle="frac">
          <tgroup cols="2" cellpadding="0">
            <!--
            <xsl:processing-instruction name="PubTbl">tgroup clmarg="0.00pt" crmarg="0.00pt" rth="0.00pt"</xsl:processing-instruction>
            -->
            <colspec colname="col1" colwidth="10px"/>
            <colspec colname="col2" colwidth="10px"/>
            <tbody>
              <row>
                <entry nameend="col2" namest="col1" colsep="0" rowsep="1">
                  <xsl:if test="(ancestor-or-self::frac[1]//num)[1]/*|(ancestor-or-self::frac[1]//num)[1]/text()|(ancestor-or-self::frac[1]//num)[1]/processing-instruction()">
                    <_gte:Gentexted-Content-Wrapper>
                      <xsl:apply-templates mode="gentext" select="(ancestor-or-self::frac[1]//num)[1]/*|(ancestor-or-self::frac[1]//num)[1]/text()|(ancestor-or-self::frac[1]//num)[1]/processing-instruction()">
                        <xsl:with-param name="skip-expanded-gentext" select="'yes'"/>
                      </xsl:apply-templates>
                    </_gte:Gentexted-Content-Wrapper>
                  </xsl:if>
                </entry>
              </row>
              <row>
                <entry nameend="col2" namest="col1" colsep="0" rowsep="0">
                  <xsl:if test="(ancestor-or-self::frac[1]//denom)[1]/*|(ancestor-or-self::frac[1]//denom)[1]/text()|(ancestor-or-self::frac[1]//denom)[1]/processing-instruction()">
                    <_gte:Gentexted-Content-Wrapper>
                      <xsl:apply-templates mode="gentext" select="(ancestor-or-self::frac[1]//denom)[1]/*|(ancestor-or-self::frac[1]//denom)[1]/text()|(ancestor-or-self::frac[1]//denom)[1]/processing-instruction()">
                        <xsl:with-param name="skip-expanded-gentext" select="'yes'"/>
                      </xsl:apply-templates>
                    </_gte:Gentexted-Content-Wrapper>
                  </xsl:if>
                </entry>
              </row>
            </tbody>
          </tgroup>
        </table>
      </xsl:with-param>
    </xsl:call-template>    
  </xsl:template>
    
  <xsl:template match="pgblk/_ufe:general-title" mode="gentext" priority="5">
    <xsl:call-template name="expand-gentext-pgblk-ufe-title"/>
  </xsl:template>
  
  <xsl:template match="pbfmatr/_ufe:general-title" mode="gentext" priority="4">
    <xsl:call-template name="expand-gentext-pgblk-ufe-title"/>
  </xsl:template>
  
  <xsl:template match="pwcspblist/_ufe:general-title" mode="gentext" priority="3">
    <xsl:call-template name="expand-gentext-pgblk-ufe-title"/>
  </xsl:template>
  
  <xsl:template match="page-block//general//_ufe:general-title" mode="gentext" priority="2">
    <xsl:call-template name="expand-gentext-pgblk-ufe-title2">
      <xsl:with-param name="content"><xsl:value-of select="$gen-texts//text[@name='general-title']"/></xsl:with-param>   
    </xsl:call-template>    
  </xsl:template>
  
  <xsl:template match="ata-page-block//general//_ufe:general-title" mode="gentext" priority="1">
    <xsl:call-template name="expand-gentext-pgblk-ufe-title2">
      <xsl:with-param name="content"><xsl:value-of select="$gen-texts//text[@name='general-title']"/></xsl:with-param>   
    </xsl:call-template>    
  </xsl:template>
  
  <xsl:template match="_ufe:general-title" mode="gentext" priority="0">
    <xsl:call-template name="expand-gentext-default"/>
  </xsl:template>
  
  <xsl:template match="pgblk/_ufe:glossary-title" mode="gentext" priority="3">
    <xsl:call-template name="expand-gentext-pgblk-ufe-title"/>
  </xsl:template>
  
  <xsl:template match="pbfmatr/_ufe:glossary-title" mode="gentext" priority="2">
    <xsl:call-template name="expand-gentext-pgblk-ufe-title"/>
  </xsl:template>
  
  <xsl:template match="pwcspblist/_ufe:glossary-title" mode="gentext" priority="1">
    <xsl:call-template name="expand-gentext-pgblk-ufe-title"/>
  </xsl:template>
  
  <xsl:template match="_ufe:glossary-title" mode="gentext" priority="0">
    <xsl:call-template name="expand-gentext-ufe">
      <xsl:with-param name="content"><xsl:value-of select="$gen-texts//text[@name='glossary-title']"/></xsl:with-param>
    </xsl:call-template>
  </xsl:template>
  
  <xsl:template match="_ufe:highlights-link" mode="gentext" priority="0">
    <xsl:call-template name="expand-gentext-ufe">
      <xsl:with-param name="content">
        <_sfe:InternalLink>
          <xsl:if test="string(./@ref)">
            <xsl:attribute name="targetId">
              <xsl:value-of select="string(./@ref)"/>
            </xsl:attribute>
          </xsl:if>
          <xsl:value-of select="@content"/>
        </_sfe:InternalLink>
      </xsl:with-param>
    </xsl:call-template>
  </xsl:template>
    
  <xsl:template match="pgblk/_ufe:howtouse-title" mode="gentext" priority="2">
    <xsl:call-template name="expand-gentext-pgblk-ufe-title"/>
  </xsl:template>
  
  <xsl:template match="pbfmatr/_ufe:howtouse-title" mode="gentext" priority="1">
    <xsl:call-template name="expand-gentext-pgblk-ufe-title"/>
  </xsl:template>
  
  <xsl:template match="_ufe:howtouse-title" mode="gentext" priority="0">
    <xsl:call-template name="expand-gentext-ufe">
      <xsl:with-param name="content"><xsl:value-of select="$gen-texts//text[@name='howtouse-title']"/></xsl:with-param>
    </xsl:call-template>
  </xsl:template>
  
  <xsl:template match="int-mail" mode="gentext" priority="0">
    <xsl:call-template name="expand-gentext3">
      <xsl:with-param name="content-before">
        <xsl:text>(</xsl:text>
      </xsl:with-param>
      <xsl:with-param name="content-after">
        <xsl:text>)</xsl:text>
      </xsl:with-param>
    </xsl:call-template>
  </xsl:template>
  
  <xsl:template match="pgblk/_ufe:intro-title" mode="gentext" priority="2">
    <xsl:call-template name="expand-gentext-pgblk-ufe-title"/>
  </xsl:template>
  
  <xsl:template match="pbfmatr/_ufe:intro-title" mode="gentext" priority="1">
    <xsl:call-template name="expand-gentext-pgblk-ufe-title"/>
  </xsl:template>
  
  <xsl:template match="_ufe:intro-title" mode="gentext" priority="0">
    <xsl:call-template name="expand-gentext-ufe">
      <xsl:with-param name="content"><xsl:value-of select="$gen-texts//text[@name='intro-title']"/></xsl:with-param>
    </xsl:call-template>
  </xsl:template>
  
  <xsl:template match="step/step/enumlist/item" mode="gentext" priority="30">
    <xsl:call-template name="expand-gentext">
      <xsl:with-param name="content">
        <span style="text-decoration: underline; ">
          <xsl:call-template name="t-styler-numbering"/>
        </span>
        <xsl:text>&#xa0;</xsl:text>
        <xsl:text>&#xa0;</xsl:text>
      </xsl:with-param>
    </xsl:call-template>
  </xsl:template>
  
  <xsl:template match="prclist4//prclist4//prclist4//prclist4/item" mode="gentext" priority="29">
    <xsl:call-template name="expand-gentext-numbering"/>
  </xsl:template>
  
  <xsl:template match="list4//list4//list4//list4/item" mode="gentext" priority="28">
    <xsl:call-template name="expand-gentext-numbering"/>
  </xsl:template>
  
  <xsl:template match="enumlist//enumlist//enumlist//enumlist/item" mode="gentext" priority="27">
    <xsl:call-template name="expand-gentext-numbering"/>
  </xsl:template>
  
  <xsl:template match="prclist4//prclist4//prclist4/item" mode="gentext" priority="26">
    <xsl:call-template name="expand-gentext-numbering"/>
  </xsl:template>
  
  <xsl:template match="list4//list4//list4/item" mode="gentext" priority="25">
    <xsl:call-template name="expand-gentext-numbering"/>
  </xsl:template>
  
  <xsl:template match="list//list//list/item" mode="gentext" priority="24">
    <xsl:call-template name="expand-gentext-bullet">
      <xsl:with-param name="bullet">♦</xsl:with-param>
    </xsl:call-template>
  </xsl:template>
  
  <xsl:template match="enumlist//enumlist//enumlist/item" mode="gentext" priority="23">
    <xsl:call-template name="expand-gentext-numbering"/>
  </xsl:template>
  
  <xsl:template match="bullist//bullist//bullist/item" mode="gentext" priority="22">
    <xsl:call-template name="expand-gentext-bullet">
      <xsl:with-param name="bullet">♦</xsl:with-param>
    </xsl:call-template>
  </xsl:template>
  
  <xsl:template match="prclist4//prclist4/item" mode="gentext" priority="21">
    <xsl:call-template name="expand-gentext-numbering"/>
  </xsl:template>
  
  <xsl:template match="list4//list4/item" mode="gentext" priority="20">
    <xsl:call-template name="expand-gentext-numbering"/>
  </xsl:template>
  
  <xsl:template match="list//list/item" mode="gentext" priority="19">
    <xsl:call-template name="expand-gentext-bullet">
      <xsl:with-param name="bullet">–</xsl:with-param>
    </xsl:call-template>
  </xsl:template>
  
  <xsl:template match="enumlist//enumlist/item" mode="gentext" priority="18">
    <xsl:call-template name="expand-gentext-numbering"/>
  </xsl:template>
  
  <xsl:template match="bullist//bullist/item" mode="gentext" priority="17">
    <xsl:call-template name="expand-gentext-bullet">
      <xsl:with-param name="bullet">–</xsl:with-param>
    </xsl:call-template>
  </xsl:template>
  
  <xsl:template match="list/item[table/@tabstyle='frac']" mode="gentext" priority="16">
    <xsl:call-template name="expand-gentext-bullet">
      <xsl:with-param name="bullet">•</xsl:with-param>
    </xsl:call-template>
  </xsl:template>
  
  <xsl:template match="bullist/item[table/@tabstyle='frac']" mode="gentext" priority="15">
    <xsl:call-template name="expand-gentext-bullet">
      <xsl:with-param name="bullet">•</xsl:with-param>
    </xsl:call-template>
  </xsl:template>
  
  <xsl:template match="pwcchapsect-list/item" mode="gentext" priority="14">
    <xsl:call-template name="expand-gentext-default"/>
  </xsl:template>
  
  <xsl:template match="numlist/item" mode="gentext" priority="13">
    <xsl:call-template name="expand-gentext-numbering"/>
  </xsl:template>
  
  <xsl:template match="unlist/item" mode="gentext" priority="12">
    <xsl:call-template name="expand-gentext-bullet">
      <xsl:with-param name="bullet">•</xsl:with-param>
    </xsl:call-template>
  </xsl:template>
  
  <xsl:template match="prclist4/item" mode="gentext" priority="11">
    <xsl:call-template name="expand-gentext-numbering"/>
  </xsl:template>
  
  <xsl:template match="prclist3/item" mode="gentext" priority="10">
    <xsl:call-template name="expand-gentext-numbering"/>
  </xsl:template>
  
  <xsl:template match="prclist2/item" mode="gentext" priority="9">
    <xsl:call-template name="expand-gentext-numbering"/>
  </xsl:template>
  
  <xsl:template match="prclist1/item" mode="gentext" priority="8">
    <xsl:call-template name="expand-gentext-numbering"/>
  </xsl:template>
  
  <xsl:template match="list4/item" mode="gentext" priority="7">
    <xsl:call-template name="expand-gentext-numbering"/>
  </xsl:template>
  
  <xsl:template match="list3/item" mode="gentext" priority="6">
    <xsl:call-template name="expand-gentext-numbering"/>
  </xsl:template>
  
  <xsl:template match="list2/item" mode="gentext" priority="5">
    <xsl:call-template name="expand-gentext-numbering"/>
  </xsl:template>
  
  <xsl:template match="list1/item" mode="gentext" priority="4">
    <xsl:call-template name="expand-gentext-numbering"/>
  </xsl:template>
  
  <xsl:template match="list/item" mode="gentext" priority="3">
    <xsl:call-template name="expand-gentext-default"/>
  </xsl:template>
  
  <xsl:template match="enumlist/item" mode="gentext" priority="2">
    <xsl:call-template name="expand-gentext">
      <xsl:with-param name="content">
        <xsl:call-template name="t-styler-numbering"/>
        <xsl:text>&#xa0;</xsl:text>
        <xsl:text>&#xa0;</xsl:text>
      </xsl:with-param>
    </xsl:call-template>
  </xsl:template>
  
  <xsl:template match="bullist/item" mode="gentext" priority="1">
    <xsl:call-template name="expand-gentext-bullet">
      <xsl:with-param name="bullet">•</xsl:with-param>
    </xsl:call-template>
  </xsl:template>
    
  <xsl:template match="figure/key" mode="gentext" priority="20">
    <xsl:call-template name="expand-gentext2">
      <xsl:with-param name="content"><hr/></xsl:with-param>
    </xsl:call-template>
  </xsl:template>
  
  <xsl:template match="manual-pn" mode="gentext" priority="0">
    <xsl:call-template name="expand-gentext">
      <xsl:with-param name="content"><xsl:value-of select="$gen-texts//text[@name='manual-pn']"/></xsl:with-param>
    </xsl:call-template>
  </xsl:template>
  
  <xsl:template match="pbfmatr/manual-title" mode="gentext" priority="3">
    <xsl:call-template name="expand-gentext-numbering2"/>
  </xsl:template>
  
  <xsl:template match="pwcspblist/manual-title" mode="gentext" priority="2">
    <xsl:call-template name="expand-gentext-numbering2"/>
  </xsl:template>
  
  <xsl:template match="pgblk/manual-title" mode="gentext" priority="1">
    <xsl:call-template name="expand-gentext-numbering2"/>
  </xsl:template>
  
  <xsl:template match="manual-title" mode="gentext" priority="0">    
    <xsl:call-template name="expand-gentext-expanded"/>
  </xsl:template>
  
  <xsl:template match="model" mode="gentext" priority="0">
    <xsl:call-template name="expand-gentext">
      <xsl:with-param name="content"><_ufe:title-block><xsl:value-of select="$gen-texts//text[@name='model']"/></_ufe:title-block></xsl:with-param>
    </xsl:call-template>
  </xsl:template>
  
  <xsl:template match="module" mode="gentext" priority="0">
    <xsl:call-template name="expand-gentext">
      <xsl:with-param name="content">
        <xsl:choose>
          <xsl:when test="&anc-pdlist-no-title;">
            <_ufe:pdlist-title/>
          </xsl:when>
          <xsl:when test="&anc-spblist-no-title;">
            <_ufe:spblist-title/>
          </xsl:when>
          <xsl:when test="&anc-sblist-no-title;">
            <_ufe:sblist-title/>
          </xsl:when>
          <xsl:when test="&anc-trlist-no-title;">
            <_ufe:temp-rev-title/>
          </xsl:when>
        </xsl:choose>
      </xsl:with-param>
    </xsl:call-template>
  </xsl:template>
  
  <xsl:template match="_ufe:not-applicable" mode="gentext" priority="0">
    <xsl:call-template name="expand-gentext-ufe">
      <xsl:with-param name="content"><xsl:value-of select="$gen-texts//text[@name='not-applicable']"/></xsl:with-param>
    </xsl:call-template>
  </xsl:template>
  
  <xsl:template match="ata-page-block//_sfe:BeforeOrAfterText//_ufe:npara-numbering" mode="gentext" priority="2">
    <xsl:call-template name="expand-gentext-ufe-numbering"/>
  </xsl:template>
  
  <xsl:template match="page-block//_sfe:BeforeOrAfterText//_ufe:npara-numbering" mode="gentext" priority="1">
    <xsl:call-template name="expand-gentext-ufe-numbering"/>
  </xsl:template>
  
  <xsl:template match="num-index" mode="gentext" priority="0">
    <xsl:call-template name="expand-gentext">
      <xsl:with-param name="content"><_ufe:num-index-title/></xsl:with-param>
    </xsl:call-template>
  </xsl:template>
  
  <xsl:template match="pgblk/_ufe:num-index-title" mode="gentext" priority="3">
    <xsl:call-template name="expand-gentext-ufe-numbering2"/>
  </xsl:template>
  
  <xsl:template match="pbfmatr/_ufe:num-index-title" mode="gentext" priority="2">
    <xsl:call-template name="expand-gentext-ufe-numbering2"/>
  </xsl:template>
  
  <xsl:template match="pwcspblist/_ufe:num-index-title" mode="gentext" priority="1">
    <xsl:call-template name="expand-gentext-ufe-numbering2"/>
  </xsl:template>
  
  <xsl:template match="_ufe:num-index-title" mode="gentext" priority="0">
    <xsl:call-template name="expand-gentext-ufe">
      <xsl:with-param name="content"><xsl:value-of select="$gen-texts//text[@name='num-index-title']"/></xsl:with-param>
    </xsl:call-template>
  </xsl:template>
  
  <xsl:template match="pgblk/_ufe:nut-option-title" mode="gentext" priority="3">
    <xsl:call-template name="expand-gentext-ufe-numbering2"/>
  </xsl:template>
  
  <xsl:template match="pbfmatr/_ufe:nut-option-title" mode="gentext" priority="2">
    <xsl:call-template name="expand-gentext-ufe-numbering2"/>
  </xsl:template>
  
  <xsl:template match="pwcspblist/_ufe:nut-option-title" mode="gentext" priority="1">
    <xsl:call-template name="expand-gentext-ufe-numbering2"/>
  </xsl:template>
  
  <xsl:template match="_ufe:nut-option-title" mode="gentext" priority="0">
    <xsl:call-template name="expand-gentext-ufe">
      <xsl:with-param name="content"><xsl:value-of select="$gen-texts//text[@name='nut-option-title']"/></xsl:with-param>
    </xsl:call-template>
  </xsl:template>
  
  <xsl:template match="orig-date" mode="gentext" priority="0">
    <xsl:call-template name="expand-gentext">
      <xsl:with-param name="content"><xsl:value-of select="$gen-texts//text[@name='orig-date']"/></xsl:with-param>
    </xsl:call-template>
  </xsl:template>
  
  <xsl:template match="book[contains(@doctype, 'epc')]//page-block[@pb-name='title-page']" mode="gentext" priority="6">
    <xsl:call-template name="expand-gentext">
      <xsl:with-param name="content"><_ufe:eipc-title/></xsl:with-param>
    </xsl:call-template>
  </xsl:template>
  
  <xsl:template match="book[contains(@doctype, 'tmm')]//page-block[@pb-name='title-page']" mode="gentext" priority="9">
    <xsl:call-template name="expand-gentext">
      <xsl:with-param name="content"><_ufe:tmm-title/></xsl:with-param>
    </xsl:call-template>
  </xsl:template>
  
  <xsl:template match="book[contains(@doctype, 'lmm')]//page-block[@pb-name='title-page']" mode="gentext" priority="9">
    <xsl:call-template name="expand-gentext">
      <xsl:with-param name="content"><_ufe:tmm-title/></xsl:with-param>
    </xsl:call-template>
  </xsl:template>
  
  <xsl:template match="book[contains(@doctype, 'em')]//page-block[@pb-name='title-page']" mode="gentext" priority="8">
    <xsl:call-template name="expand-gentext">
      <xsl:with-param name="content"><_ufe:em-title/></xsl:with-param>
    </xsl:call-template>
  </xsl:template>
  
  <xsl:template match="book[contains(@doctype, 'cir')]//page-block[@pb-name='title-page']" mode="gentext" priority="7">
    <xsl:call-template name="expand-gentext">
      <xsl:with-param name="content"><_ufe:cir-title/></xsl:with-param>
    </xsl:call-template>
  </xsl:template>
  
  <xsl:template match="book[contains(@doctype, 'cir') or contains(@doctype, 'em')]//page-block[@pb-name='howtouse']" mode="gentext" priority="5">
    <xsl:call-template name="expand-gentext">
      <xsl:with-param name="content"><_ufe:howtouse-title/></xsl:with-param>
    </xsl:call-template>
  </xsl:template>
  
  <xsl:template match="page-block[@pb-name='supp_list']" mode="gentext" priority="4">
    <xsl:call-template name="expand-gentext">
      <xsl:with-param name="content">
        <_ufe:supplier-list-title/>
      </xsl:with-param>
    </xsl:call-template>
  </xsl:template>
  
  <xsl:template match="page-block[@pb-name='glossary']" mode="gentext" priority="3">
    <xsl:call-template name="expand-gentext">
      <xsl:with-param name="content"><_ufe:glossary-title/></xsl:with-param>
    </xsl:call-template>
  </xsl:template>
  
  <xsl:template match="page-block[@pb-name='intro']" mode="gentext" priority="2">
    <xsl:call-template name="expand-gentext">
      <xsl:with-param name="content">
        <xsl:choose>
          <xsl:when test="(./pageblock-title)"/>
          <xsl:otherwise>
            <_ufe:intro-title/>            
          </xsl:otherwise>
        </xsl:choose>
      </xsl:with-param>
    </xsl:call-template>
  </xsl:template>
  
  <xsl:template match="page-block[@pb-name='nut_option']" mode="gentext" priority="1">
    <xsl:call-template name="expand-gentext">
      <xsl:with-param name="content"><_ufe:nut-option-title/></xsl:with-param>
    </xsl:call-template>
  </xsl:template>
   
  <xsl:template match="subpara/subpara/subpara/subpara/subpara/subpara[not(title)]/para" mode="gentext" priority="52">
    <xsl:call-template name="expand-gentext-default"/>
  </xsl:template>
  
  <xsl:template match="subpara/subpara/subpara/subpara/subpara[not(title)]/para" mode="gentext" priority="51">
    <xsl:call-template name="expand-gentext-numbering2"/>
  </xsl:template>
  
  <xsl:template match="subpara/subpara/subpara/subpara[not(title)]/para" mode="gentext" priority="50">
    <xsl:call-template name="expand-gentext-numbering2"/>
  </xsl:template>
  
  <xsl:template match="n-para/subpara/subpara[child::title]/para" mode="gentext" priority="49">
    <xsl:call-template name="expand-gentext-default"/>
  </xsl:template>
  
  <xsl:template match="subpara/subpara/subpara[not(title)]/para" mode="gentext" priority="48">
    <xsl:call-template name="expand-gentext-numbering5"/>
  </xsl:template>
  
  <xsl:template match="subpara/subpara[not(title)]/para" mode="gentext" priority="47">
    <xsl:call-template name="expand-gentext-numbering5"/>
  </xsl:template>
  
  <xsl:template match="n-para/subpara[child::title]/para" mode="gentext" priority="46">
    <xsl:call-template name="expand-gentext-default"/>
  </xsl:template>
  
  <xsl:template match="prcitem3/prcitem/para" mode="gentext" priority="45">
    <xsl:call-template name="expand-gentext-default"/>
  </xsl:template>
  
  <xsl:template match="subpara/subpara/para" mode="gentext" priority="44">
    <xsl:call-template name="expand-gentext-default"/>
  </xsl:template>
  
  <xsl:template match="n-para/subpara/para" mode="gentext" priority="43">
    <xsl:call-template name="expand-gentext-numbering3"/>
  </xsl:template>
  
  <xsl:template match="book[contains(@doctype, 'cir')]//note/para" mode="gentext" priority="42">
    <xsl:call-template name="expand-gentext-default"/>
  </xsl:template>
  
  <xsl:template match="pageblock-front/general//para" mode="gentext" priority="40">
    <xsl:call-template name="expand-gentext-numbering5"/>
  </xsl:template>
  
  <xsl:template match="warning/para[1]" mode="gentext" priority="40">
    <xsl:call-template name="expand-gentext-default"/>
  </xsl:template>
  
  <xsl:template match="caution/para[1]" mode="gentext" priority="39">
    <xsl:call-template name="expand-gentext-default"/>
  </xsl:template>
  
  <xsl:template match="_ufe:step-proc-num/para[1]" mode="gentext" priority="38">
    <xsl:call-template name="expand-gentext-default"/>
  </xsl:template>
  
  <xsl:template match="step5/para[1]" mode="gentext" priority="37">
    <xsl:call-template name="expand-gentext-default"/>
  </xsl:template>
  
  <xsl:template match="step4/para[1]" mode="gentext" priority="36">
    <xsl:call-template name="expand-gentext-default"/>
  </xsl:template>
  
  <xsl:template match="step3/para[1]" mode="gentext" priority="35">
    <xsl:call-template name="expand-gentext-default"/>
  </xsl:template>
  
  <xsl:template match="step2/para[1]" mode="gentext" priority="34">
    <xsl:call-template name="expand-gentext-default"/>
  </xsl:template>
  
  <xsl:template match="numlitem/para[1]" mode="gentext" priority="33">
    <xsl:call-template name="expand-gentext-default"/>
  </xsl:template>
  
  <xsl:template match="note/para[1]" mode="gentext" priority="32">
    <xsl:call-template name="expand-gentext-default"/>
  </xsl:template>
  
  <xsl:template match="unlitem/para[1]" mode="gentext" priority="31">
    <xsl:call-template name="expand-gentext-default"/>
  </xsl:template>
  
  <xsl:template match="prcitem4/para[1]" mode="gentext" priority="30">
    <xsl:call-template name="expand-gentext-default"/>
  </xsl:template>
  
  <xsl:template match="l4item/para[1]" mode="gentext" priority="29">
    <xsl:call-template name="expand-gentext-default"/>
  </xsl:template>
  
  <xsl:template match="l3item/para[1]" mode="gentext" priority="28">
    <xsl:call-template name="expand-gentext-default"/>
  </xsl:template>
  
  <xsl:template match="l2item/para[1]" mode="gentext" priority="27">
    <xsl:call-template name="expand-gentext-default"/>
  </xsl:template>
  
  <xsl:template match="l1item/para[1]" mode="gentext" priority="26">
    <xsl:call-template name="expand-gentext-default"/>
  </xsl:template>
  
  <xsl:template match="step/para[1]" mode="gentext" priority="25">
    <xsl:call-template name="expand-gentext-default"/>
  </xsl:template>
  
  <xsl:template match="item/para[1]" mode="gentext" priority="24">
    <xsl:call-template name="expand-gentext-default"/>
  </xsl:template>
  
  <xsl:template match="n-para[ancestor::book[contains(@doctype, 'epc')]]/para" mode="gentext" priority="18">
    <xsl:call-template name="expand-gentext-numbering5"/>
  </xsl:template>
  
  <xsl:template match="_ufe:step-proc-num/para[position()&gt;1]" mode="gentext" priority="22">
    <xsl:call-template name="expand-gentext-default"/>
  </xsl:template>
  
  <xsl:template match="step5/para[position()&gt;1]" mode="gentext" priority="21">
    <xsl:call-template name="expand-gentext-default"/>
  </xsl:template>
  
  <xsl:template match="step4/para[position()&gt;1]" mode="gentext" priority="20">
    <xsl:call-template name="expand-gentext-default"/>
  </xsl:template>
  
  <xsl:template match="step3/para[position()&gt;1]" mode="gentext" priority="19">
    <xsl:call-template name="expand-gentext-default"/>
  </xsl:template>
  
  <xsl:template match="step2/para[position()&gt;1]" mode="gentext" priority="18">
    <xsl:call-template name="expand-gentext-default"/>
  </xsl:template>
  
  <xsl:template match="numlitem/para[position()&gt;1]" mode="gentext" priority="17">
    <xsl:call-template name="expand-gentext-default"/>
  </xsl:template>
  
  <xsl:template match="unlitem/para[position()&gt;1]" mode="gentext" priority="16">
    <xsl:call-template name="expand-gentext-default"/>
  </xsl:template>
  
  <xsl:template match="prcitem4/para[position()&gt;1]" mode="gentext" priority="15">
    <xsl:call-template name="expand-gentext-default"/>
  </xsl:template>
  
  <xsl:template match="l4item/para[position()&gt;1]" mode="gentext" priority="14">
    <xsl:call-template name="expand-gentext-default"/>
  </xsl:template>
  
  <xsl:template match="l3item/para[position()&gt;1]" mode="gentext" priority="13">
    <xsl:call-template name="expand-gentext-default"/>
  </xsl:template>
  
  <xsl:template match="l2item/para[position()&gt;1]" mode="gentext" priority="12">
    <xsl:call-template name="expand-gentext-default"/>
  </xsl:template>
  
  <xsl:template match="l1item/para[position()&gt;1]" mode="gentext" priority="11">
    <xsl:call-template name="expand-gentext-default"/>
  </xsl:template>
  
  <xsl:template match="step/para[position()&gt;1]" mode="gentext" priority="10">
    <xsl:call-template name="expand-gentext-default"/>
  </xsl:template>
  
  <xsl:template match="item/para[position()&gt;1]" mode="gentext" priority="9">
    <xsl:call-template name="expand-gentext-default"/>
  </xsl:template>
  
  <xsl:template match="taskproc/para" mode="gentext" priority="7">
    <xsl:call-template name="expand-gentext-numbering5"/>
  </xsl:template>
  
  <xsl:template match="title-page/para" mode="gentext" priority="7">
    <xsl:call-template name="expand-gentext-default"/>
  </xsl:template>
  
  <xsl:template match="numlitem/para" mode="gentext" priority="6">
    <xsl:call-template name="expand-gentext-default"/>
  </xsl:template>
  
  <xsl:template match="tprereq/para" mode="gentext" priority="4">
    <xsl:call-template name="expand-gentext-numbering5"/>
  </xsl:template>
  
  <xsl:template match="sbnbr/para" mode="gentext" priority="4">
    <xsl:call-template name="expand-gentext-default"/>
  </xsl:template>
  
  <xsl:template match="n-para/para" mode="gentext" priority="3">
    <xsl:call-template name="expand-gentext-default"/>
  </xsl:template>
  
  <xsl:template match="subpara/para" mode="gentext" priority="2">
    <xsl:call-template name="expand-gentext-default"/>
  </xsl:template>
  
  <xsl:template match="nomen-col//para" mode="gentext" priority="1">
    <xsl:call-template name="expand-gentext-default"/>
  </xsl:template>
    
  <xsl:template match="numlist/part-group" mode="gentext" priority="2">
    <xsl:call-template name="expand-gentext-numbering"/>
  </xsl:template>
  
  <xsl:template match="pgblk/_ufe:pdlist-title" mode="gentext" priority="1">
    <xsl:call-template name="expand-gentext-pgblk-ufe-title"/>
  </xsl:template>
  
  <xsl:template match="_ufe:pdlist-title" mode="gentext" priority="0">
    <xsl:call-template name="expand-gentext-ufe">
      <xsl:with-param name="content"><xsl:value-of select="$gen-texts//text[@name='pdlist-title']"/></xsl:with-param>
    </xsl:call-template>
  </xsl:template>
    
  <xsl:template match="postal" mode="gentext" priority="0">
    <xsl:call-template name="expand-gentext2">
      <xsl:with-param name="content"><xsl:text>&#xa0;</xsl:text></xsl:with-param>
    </xsl:call-template>
  </xsl:template>
  
  <xsl:template match="postsb" mode="gentext" priority="0">
    <xsl:call-template name="expand-gentext">
      <xsl:with-param name="content"><xsl:value-of select="$gen-texts//text[@name='post-sb']"/></xsl:with-param>
    </xsl:call-template>
  </xsl:template>
    
  <xsl:template match="presb" mode="gentext" priority="0">
    <xsl:call-template name="expand-gentext">
      <xsl:with-param name="content"><xsl:value-of select="$gen-texts//text[@name='pre-sb']"/></xsl:with-param>
    </xsl:call-template>
  </xsl:template>
    
  <xsl:template match="_ufe:proprietary-notice" mode="gentext" priority="0">
    <xsl:call-template name="expand-gentext-ufe">
      <xsl:with-param name="content">
        <_ufe:proprietary-warning/>
        <_ufe:block-prespace>
          <xsl:value-of select="$gen-texts//text[@name='proprietary-notice-1']"/>
        </_ufe:block-prespace>
        <_ufe:block-prespace>
          <xsl:value-of select="$gen-texts//text[@name='proprietary-notice-2']"/>
        </_ufe:block-prespace>
      </xsl:with-param>
    </xsl:call-template>
  </xsl:template>
  
  <xsl:template match="_ufe:proprietary-warning" mode="gentext" priority="0">
    <xsl:call-template name="expand-gentext-ufe">
      <xsl:with-param name="content">
        <xsl:value-of select="$gen-texts//text[@name='proprietary-warning']"/>
      </xsl:with-param>
    </xsl:call-template>
  </xsl:template>
    
  <xsl:template match="qty[ancestor::book[contains(@doctype,'ipc')]]" mode="gentext" priority="1">
    <xsl:call-template name="expand-gentext">
      <xsl:with-param name="content">
        <xsl:choose>
          <xsl:when test="(@per-assy='TEXT') or (@per-assy='EMPTY')"/>
          <xsl:otherwise>
            <xsl:value-of select="@per-assy"/>
          </xsl:otherwise>
        </xsl:choose>
      </xsl:with-param>
    </xsl:call-template>
  </xsl:template>
    
  <xsl:template match="address/ref" mode="gentext" priority="1">
    <xsl:call-template name="expand-gentext">
      <xsl:with-param name="content"><xsl:value-of select="$gen-texts//text[@name='address-ref']"/><xsl:value-of select="$gen-texts//text[@name='sep1']"/></xsl:with-param>
    </xsl:call-template>
  </xsl:template>
  
  <xsl:template match="refint" mode="gentext" priority="4">
    <!--
	<xsl:variable name="target" select="//*[@id = @refid][1]"/>
    -->
    
    <xsl:variable name="l-ref">
      <xsl:choose>
        <xsl:when test="@refid"><xsl:value-of select="@refid"/></xsl:when>
        <xsl:when test="@ref"><xsl:value-of select="@ref"/></xsl:when>
        <xsl:when test="@refloc"><xsl:value-of select="@refloc"/></xsl:when>
      </xsl:choose>
    </xsl:variable>
    <xsl:variable name="target" select="id($l-ref)"/>
    
    <xsl:choose>
      <xsl:when test="not($target)">
        <span class="x-ref-broken">
          <xsl:apply-templates/>
        </span>
      </xsl:when>
      <xsl:when test="$target[ancestor::table]">
        <xsl:call-template name="expand-gentext2">
          <xsl:with-param name="content">
            <_sfe:CrossReference>
              <_gte:Link linkRef="{$l-ref}" onclick="showTable('{$target/ancestor::table/@id}')">
                <xsl:value-of select="."/>
              </_gte:Link>
            </_sfe:CrossReference>
          </xsl:with-param>
        </xsl:call-template>
      </xsl:when>
      <xsl:when test="@refid and $target[self::table]">
        <xsl:call-template name="expand-gentext2">
          <xsl:with-param name="content">
            <_sfe:CrossReference>
              <_gte:Link linkRef="{@refid}" onclick="showTable('{@refid}')">
                <xsl:attribute name="type"><xsl:text>table</xsl:text>
                  <xsl:if test="$target[ancestor::figure or ancestor::graphic]">
                    <xsl:text>-figure</xsl:text>
                  </xsl:if>
                </xsl:attribute>
                <xsl:choose>
                  <xsl:when test="$target/title">
                    <xsl:apply-templates select="$target/title" mode="styler_xref-Number"/>
                  </xsl:when>
                  <xsl:otherwise>
                    <xsl:apply-templates select="$target/_sfe:BeforeOrAfterText//*[contains(name(), 'title')]" mode="styler_xref-Number"/>
                  </xsl:otherwise>
                </xsl:choose>
              </_gte:Link>
            </_sfe:CrossReference>
            <xsl:value-of select="@post-auto-text"/>
          </xsl:with-param>
        </xsl:call-template>
      </xsl:when>
      <xsl:when test="ancestor::book[contains(@doctype, 'epc')]">
        <xsl:call-template name="expand-gentext">
          <xsl:with-param name="content">
            <_ufe:refint-link>
              <xsl:if test="@refloc">
                <xsl:attribute name="ref">
                  <xsl:value-of select="@refloc"/>
                </xsl:attribute>
              </xsl:if>
              <xsl:if test=".">
                <xsl:attribute name="content">
                  <xsl:value-of select="."/>
                </xsl:attribute>
              </xsl:if>
            </_ufe:refint-link>
          </xsl:with-param>
        </xsl:call-template>
      </xsl:when>
      <xsl:when test="ancestor::book[contains(@doctype, 'cir') or contains(@doctype, 'em')]">
        <xsl:call-template name="expand-gentext">
          <xsl:with-param name="content">
            <_ufe:refint-link>
              <xsl:if test="@refid">
                <xsl:attribute name="ref">
                  <xsl:value-of select="@refid"/>
                </xsl:attribute>
              </xsl:if>
              <xsl:if test="concat(., @post-auto-text)">
                <xsl:attribute name="content">
                  <xsl:value-of select="concat(., @post-auto-text)"/>
                </xsl:attribute>
              </xsl:if>
            </_ufe:refint-link>
          </xsl:with-param>
        </xsl:call-template>
      </xsl:when>
      <xsl:otherwise>
        <xsl:call-template name="expand-gentext">
          <xsl:with-param name="content">
            <xsl:choose>
              <xsl:when test="@refid">
                <_ufe:refint-link>
                  <xsl:if test="@refid">
                    <xsl:attribute name="ref">
                      <xsl:value-of select="@refid"/>
                    </xsl:attribute>
                  </xsl:if>
                  <xsl:if test=".">
                    <xsl:attribute name="content">
                      <xsl:value-of select="."/>
                    </xsl:attribute>
                  </xsl:if>
                </_ufe:refint-link>
              </xsl:when>
              <xsl:otherwise>
                <_ufe:refint-link>
                  <xsl:if test="@ref">
                    <xsl:attribute name="ref">
                      <xsl:value-of select="@ref"/>
                    </xsl:attribute>
                  </xsl:if>
                  <xsl:if test=".">
                    <xsl:attribute name="content">
                      <xsl:value-of select="."/>
                    </xsl:attribute>
                  </xsl:if>
                </_ufe:refint-link>            
              </xsl:otherwise>
            </xsl:choose>
          </xsl:with-param>
        </xsl:call-template>
      </xsl:otherwise>
    </xsl:choose>
  </xsl:template>
    
  <xsl:template match="_ufe:refint-link" mode="gentext" priority="0">
    <xsl:call-template name="expand-gentext-ufe">
      <xsl:with-param name="content">
        <_sfe:InternalLink>
          <xsl:if test="@ref">
            <xsl:attribute name="targetId">
              <xsl:value-of select="@ref"/>
            </xsl:attribute>
          </xsl:if>
          <xsl:value-of select="@content"/>
        </_sfe:InternalLink>
      </xsl:with-param>
    </xsl:call-template>
  </xsl:template>
  
  <xsl:template match="sb" mode="gentext" priority="0">
    <xsl:call-template name="expand-gentext">
      <xsl:with-param name="content"><xsl:value-of select="$gen-texts//text[@name='sb']"/></xsl:with-param>
    </xsl:call-template>
  </xsl:template>
    
  <xsl:template match="pgblk/_ufe:sblist-title" mode="gentext" priority="2">
    <xsl:call-template name="expand-gentext-pgblk-ufe-title"/>
  </xsl:template>
  
  <xsl:template match="pbfmatr/_ufe:sblist-title" mode="gentext" priority="1">
    <xsl:call-template name="expand-gentext-pgblk-ufe-title"/>
  </xsl:template>
  
  <xsl:template match="_ufe:sblist-title" mode="gentext" priority="0">
    <xsl:call-template name="expand-gentext-ufe">
      <xsl:with-param name="content"><xsl:value-of select="$gen-texts//text[@name='sblist-title']"/></xsl:with-param>
    </xsl:call-template>
  </xsl:template>
  
  <xsl:template match="pgblk/_ufe:spblist-title" mode="gentext" priority="2">
    <xsl:call-template name="expand-gentext-pgblk-ufe-title"/>
  </xsl:template>
  
  <xsl:template match="pbfmatr/_ufe:spblist-title" mode="gentext" priority="1">
    <xsl:call-template name="expand-gentext-pgblk-ufe-title"/>
  </xsl:template>
  
  <xsl:template match="_ufe:spblist-title" mode="gentext" priority="0">
    <xsl:call-template name="expand-gentext-ufe">
      <xsl:with-param name="content"><xsl:value-of select="$gen-texts//text[@name='spblist-title']"/></xsl:with-param>
    </xsl:call-template>
  </xsl:template>
  
  <xsl:template match="pgblk/_ufe:spectools-title" mode="gentext" priority="5">
    <xsl:call-template name="expand-gentext-pgblk-ufe-title"/>
  </xsl:template>
  
  <xsl:template match="pbfmatr/_ufe:spectools-title" mode="gentext" priority="4">
    <xsl:call-template name="expand-gentext-pgblk-ufe-title"/>
  </xsl:template>
  
  <xsl:template match="pwcspblist/_ufe:spectools-title" mode="gentext" priority="3">
    <xsl:call-template name="expand-gentext-pgblk-ufe-title"/>
  </xsl:template>
  
  <xsl:template match="page-block//special-tools//_ufe:spectools-title" mode="gentext" priority="2">
    <xsl:call-template name="expand-gentext-ufe">
      <xsl:with-param name="content">
        <xsl:call-template name="t-styler-numbering-ufe"/>
        <xsl:text>&#xa0;</xsl:text>
        <xsl:text>&#xa0;</xsl:text>
        <span style="text-decoration: underline; ">
          <xsl:value-of select="$gen-texts//text[@name='spectools-title']"/>
        </span>
      </xsl:with-param>
    </xsl:call-template>    
  </xsl:template>
  
  <xsl:template match="ata-page-block//special-tools//_ufe:spectools-title" mode="gentext" priority="1">
    <xsl:call-template name="expand-gentext-ufe">
      <xsl:with-param name="content">
        <xsl:call-template name="t-styler-numbering-ufe"/>
        <xsl:text>&#xa0;</xsl:text>
        <xsl:text>&#xa0;</xsl:text>
        <span style="text-decoration: underline; ">
          <xsl:value-of select="$gen-texts//text[@name='spectools-title']"/>
        </span>
      </xsl:with-param>
    </xsl:call-template>
  </xsl:template>
  
  <xsl:template match="_ufe:spectools-title" mode="gentext" priority="0">
    <xsl:call-template name="expand-gentext-default"/>
  </xsl:template>
  
  <xsl:template match="sqrt" mode="gentext" priority="0">
    <xsl:call-template name="expand-gentext">
      <xsl:with-param name="content"><xsl:text>&#x221a;</xsl:text></xsl:with-param>
    </xsl:call-template>
  </xsl:template>
  
  <xsl:template match="state" mode="gentext" priority="0">
    <xsl:call-template name="expand-gentext2">
      <xsl:with-param name="content">
        <xsl:choose>
          <xsl:when test="not(./*[not(self::_sfe:BeforeOrAfterText)]|./text()[normalize-space(.)!=''])"/>
          <xsl:otherwise>
            <xsl:text>&#xa0;</xsl:text>
          </xsl:otherwise>
        </xsl:choose>
      </xsl:with-param>
    </xsl:call-template>
  </xsl:template>
  
  <xsl:template match="pgblk/_ufe:supplier-list-title" mode="gentext" priority="3">
    <xsl:call-template name="expand-gentext-pgblk-ufe-title"/>
  </xsl:template>
  
  <xsl:template match="pbfmatr/_ufe:supplier-list-title" mode="gentext" priority="2">
    <xsl:call-template name="expand-gentext-pgblk-ufe-title"/>
  </xsl:template>
  
  <xsl:template match="pwcspblist/_ufe:supplier-list-title" mode="gentext" priority="1">
    <xsl:call-template name="expand-gentext-pgblk-ufe-title"/>
  </xsl:template>
  
  <xsl:template match="_ufe:supplier-list-title" mode="gentext" priority="0">
    <xsl:call-template name="expand-gentext-ufe">
      <xsl:with-param name="content"><xsl:value-of select="$gen-texts//text[@name='supplier-list-title']"/></xsl:with-param>
    </xsl:call-template>
  </xsl:template>
  
  <xsl:template match="table[@display='expand']" mode="gentext" priority="13">
    <xsl:call-template name="expand-gentext-default"/>
  </xsl:template>
  
  <xsl:template match="table[not(title) and not(@tabstyle='frac')]" mode="gentext" priority="12">
    <xsl:call-template name="expand-gentext-default"/>
  </xsl:template>
  
  <xsl:template match="sheet/gdesc/table" mode="gentext" priority="7">
    <xsl:call-template name="expand-gentext-default"/>
  </xsl:template>
  
  <xsl:template match="highlights/table" mode="gentext" priority="10">
    <xsl:call-template name="expand-gentext-default"/>
  </xsl:template>
  
  <xsl:template match="figure/table" mode="gentext" priority="6">
    <xsl:call-template name="expand-gentext-default"/>
  </xsl:template>
  
  <xsl:template match="mfmatr//table" mode="gentext" priority="7">
    <xsl:call-template name="expand-gentext-default"/>
  </xsl:template>
  
  <xsl:template match="table[@tabstyle='eqn' and @display='inline']" mode="gentext" priority="5">
    <xsl:call-template name="expand-gentext-default"/>
  </xsl:template>
  
  <xsl:template match="table[@tabstyle='IPCDET']" mode="gentext" priority="5">
    <xsl:call-template name="expand-gentext-default"/>
  </xsl:template>
  
  <xsl:template match="table[@tabstyle='frac' and parent::item]" mode="gentext" priority="4">
    <xsl:call-template name="expand-gentext-default"/>
  </xsl:template>
  
  <xsl:template match="table[@tabstyle='frac' and (parent::step1 or parent::step2 or parent::step3 or parent::step4 or parent::step5)]" mode="gentext" priority="1">
    <xsl:call-template name="expand-gentext-default"/>
  </xsl:template>
  
  <xsl:template match="table[@tabstyle='frac']" mode="gentext" priority="3">
    <xsl:call-template name="expand-gentext-default"/>
  </xsl:template>
  
  <xsl:template match="table[@tabstyle='eqn']" mode="gentext" priority="1">
    <xsl:call-template name="expand-gentext-default"/>
  </xsl:template>
  
  <xsl:template match="table" mode="gentext" priority="0">
    <xsl:call-template name="expand-gentext">
      <xsl:with-param name="content">
        <xsl:if test="(@tabstyle='general') or (@tabstyle='consumables') or (@tabstyle='special-tools') or (@tabstyle='fixtures-and-equipment')">
          <_ufe:npara-numbering/>
        </xsl:if>
      </xsl:with-param>
    </xsl:call-template>
  </xsl:template>
  
  <xsl:template match="pgblk/_ufe:task-title" mode="gentext" priority="3">
    <xsl:call-template name="expand-gentext-pgblk-ufe-title"/>
  </xsl:template>
  
  <xsl:template match="pbfmatr/_ufe:task-title" mode="gentext" priority="2">
    <xsl:call-template name="expand-gentext-pgblk-ufe-title"/>
  </xsl:template>
  
  <xsl:template match="pbfmatr//_ufe:task-title" mode="gentext" priority="1">
    <xsl:call-template name="expand-gentext-ufe">
      <xsl:with-param name="content">
        <xsl:call-template name="t-styler-numbering-ufe"/>
        <xsl:text>&#xa0;</xsl:text>
        <xsl:text>&#xa0;</xsl:text>
      </xsl:with-param>
    </xsl:call-template>
  </xsl:template>
  
  <xsl:template match="_ufe:task-title" mode="gentext" priority="0">
    <xsl:call-template name="expand-gentext-default"/>
  </xsl:template>
  
  <xsl:template match="address/tel[1]" mode="gentext" priority="2">
    <xsl:call-template name="expand-gentext">
      <xsl:with-param name="content"><xsl:value-of select="$gen-texts//text[@name='address-tel']"/><xsl:value-of select="$gen-texts//text[@name='sep1']"/></xsl:with-param>
    </xsl:call-template>
  </xsl:template>
  
  <xsl:template match="pgblk/_ufe:temp-rev-title" mode="gentext" priority="2">
    <xsl:call-template name="expand-gentext-pgblk-ufe-title"/>
  </xsl:template>
  
  <xsl:template match="pbfmatr/_ufe:temp-rev-title" mode="gentext" priority="1">
    <xsl:call-template name="expand-gentext-pgblk-ufe-title"/>
  </xsl:template>
  
  <xsl:template match="_ufe:temp-rev-title" mode="gentext" priority="0">
    <xsl:call-template name="expand-gentext-ufe">
      <xsl:with-param name="content"><xsl:value-of select="$gen-texts//text[@name='temp-rev-title']"/></xsl:with-param>
    </xsl:call-template>
  </xsl:template>
  
  <xsl:template match="deflist/term" mode="gentext" priority="1">
    <xsl:call-template name="expand-gentext2">
      <xsl:with-param name="content"><xsl:text>     </xsl:text></xsl:with-param>
    </xsl:call-template>
  </xsl:template>
    
  <xsl:template match="subpara/subpara/subpara/subpara/subpara/title" mode="gentext" priority="72">
    <xsl:call-template name="expand-gentext-numbering2"/>
  </xsl:template>
  
  <xsl:template match="subpara/subpara/subpara/subpara/title" mode="gentext" priority="71">
    <xsl:call-template name="expand-gentext-numbering2"/>
  </xsl:template>
  
  <xsl:template match="subpara/subpara/subpara/title" mode="gentext" priority="70">
    <xsl:call-template name="expand-gentext-numbering5"/>
  </xsl:template>
  
  <xsl:template match="book[contains(@doctype, 'epc')]/frontmatter//graphic/title" mode="gentext" priority="69">
    <xsl:call-template name="expand-gentext">
      <xsl:with-param name="content"><xsl:value-of select="$gen-texts//text[@name='figure']"/><xsl:text> </xsl:text><xsl:call-template name="t-styler-numbering"/><xsl:text>&#xa0;</xsl:text></xsl:with-param>
    </xsl:call-template>
  </xsl:template>
  
  <xsl:template match="book[contains(@doctype, 'ipc')]/frontmatter//figure/title" mode="gentext" priority="68">
    <xsl:call-template name="expand-gentext">
      <xsl:with-param name="content"><xsl:value-of select="$gen-texts//text[@name='figure']"/><xsl:text> </xsl:text><xsl:call-template name="t-styler-numbering"/><xsl:text>&#xa0;</xsl:text></xsl:with-param>
    </xsl:call-template>
  </xsl:template>
  
  <xsl:template match="book[contains(@doctype, 'ipc')]/frontmatter//ipc-fig-reloc/title" mode="gentext" priority="68">
    <xsl:call-template name="expand-gentext">
      <xsl:with-param name="content"><xsl:value-of select="$gen-texts//text[@name='figure']"/><xsl:text> </xsl:text><xsl:call-template name="t-styler-numbering"/><xsl:text>&#xa0;</xsl:text></xsl:with-param>
    </xsl:call-template>
  </xsl:template>
  
  <xsl:template match="ata-page-block//task/graphic/title" mode="gentext" priority="67">
    <xsl:call-template name="expand-gentext3">
      <xsl:with-param name="content-before">
        <xsl:value-of select="$gen-texts//text[@name='figure']"/><xsl:text> </xsl:text>
        <xsl:call-template name="t-styler-numbering"/>
        <xsl:text>&#xa0;</xsl:text>        
      </xsl:with-param>
      <xsl:with-param name="content-after">
        <xsl:variable name="task" select="ancestor-or-self::task[1]"/>
        <xsl:variable name="pre" select="concat(' (',$gen-texts//text[@name='task'],' ', $task/@chapnbr, '-', $task/@sectnbr, '-', $task/@subjnbr, '-', $task/@func, '-', $task/@seq)"/>
        <xsl:choose>
          <xsl:when test="&anc-task-c;">
            <xsl:value-of select="concat($pre, '-', $task/@confltr, ')')"/>
          </xsl:when>
          <xsl:when test="&anc-task-v;">
            <xsl:value-of select="concat($pre, '-', $task/@varnbr, ')')"/>
          </xsl:when>
          <xsl:otherwise>
            <xsl:value-of select="concat($pre, ')')"/>
          </xsl:otherwise>
        </xsl:choose>       
      </xsl:with-param>
    </xsl:call-template>
  </xsl:template>
  
  <xsl:template match="page-block//task/graphic/title" mode="gentext" priority="66">
    <xsl:call-template name="expand-gentext3">
      <xsl:with-param name="content-before">
        <xsl:value-of select="$gen-texts//text[@name='figure']"/><xsl:text> </xsl:text>
        <xsl:call-template name="t-styler-numbering"/>
        <xsl:text>&#xa0;</xsl:text>        
      </xsl:with-param>
      <xsl:with-param name="content-after">
        <xsl:variable name="task" select="ancestor-or-self::task[1]"/>
        <xsl:variable name="pre" select="concat(' (',$gen-texts//text[@name='task'],' ', $task/@chapnbr, '-', $task/@sectnbr, '-', $task/@subjnbr, '-', $task/@func, '-', $task/@seq)"/>
        <xsl:choose>
          <xsl:when test="&anc-task-c;">
            <xsl:value-of select="concat($pre, '-', $task/@confltr, ')')"/>
          </xsl:when>
          <xsl:when test="&anc-task-v;">
            <xsl:value-of select="concat($pre, '-', $task/@varnbr, ')')"/>
          </xsl:when>
          <xsl:otherwise>
            <xsl:value-of select="concat($pre, ')')"/>
          </xsl:otherwise>
        </xsl:choose>
      </xsl:with-param>
    </xsl:call-template>
  </xsl:template>
  
  <xsl:template match="page-block[@pb-name='glossary']/module/title" mode="gentext" priority="61">
    <xsl:call-template name="expand-gentext-numbering4"/>
  </xsl:template>
  
  <xsl:template match="page-block[@pb-name='supp_list']/module/title" mode="gentext" priority="60">
    <xsl:call-template name="expand-gentext-numbering4"/>   
  </xsl:template>
  
  <xsl:template match="mm-fits/subpara/title" mode="gentext" priority="62">
    <xsl:call-template name="expand-gentext-numbering5"/>
  </xsl:template>
  
  <xsl:template match="prcitem4/prcitem/title" mode="gentext" priority="60">
    <xsl:call-template name="expand-gentext-numbering4"/>
  </xsl:template>
  
  <xsl:template match="prcitem3/prcitem/title" mode="gentext" priority="60">
    <xsl:call-template name="expand-gentext-numbering5"/>
  </xsl:template>
  
  <xsl:template match="prcitem2/prcitem/title" mode="gentext" priority="59">
    <xsl:call-template name="expand-gentext-numbering5"/>
  </xsl:template>
  
  <xsl:template match="prcitem1/prcitem/title" mode="gentext" priority="55">
    <xsl:call-template name="expand-gentext-numbering4"/>
  </xsl:template>
  
  <xsl:template match="subpara/subpara/title" mode="gentext" priority="57">
    <xsl:call-template name="expand-gentext-numbering5"/>
  </xsl:template>
  
  <xsl:template match="book[contains(@doctype, 'epc')]//figure/title" mode="gentext" priority="54">
    <xsl:call-template name="expand-gentext">
      <xsl:with-param name="content"><xsl:value-of select="$gen-texts//text[@name='figure']"/><xsl:text> </xsl:text><xsl:value-of select="ancestor-or-self::figure[1]/@fignbr"/><xsl:text> </xsl:text></xsl:with-param>
    </xsl:call-template>
  </xsl:template>
  
  <xsl:template match="book[contains(@doctype, 'epc')]//graphic/title" mode="gentext" priority="53">
    <xsl:call-template name="expand-gentext">
      <xsl:with-param name="content"><xsl:value-of select="$gen-texts//text[@name='figure']"/><xsl:text> </xsl:text><xsl:value-of select="ancestor-or-self::figure[1]/@fignbr"/><xsl:text> </xsl:text></xsl:with-param>
    </xsl:call-template>
  </xsl:template>
  
  <xsl:template match="book[contains(@doctype, 'ipc')]//figure/title" mode="gentext" priority="52">
    <xsl:call-template name="expand-gentext">
      <xsl:with-param name="content">
        <xsl:value-of select="$gen-texts//text[@name='figure']"/><xsl:text> </xsl:text>
        <xsl:if test="(ancestor-or-self::figure[1]//figno)[1]/*|(ancestor-or-self::figure[1]//figno)[1]/text()|(ancestor-or-self::figure[1]//figno)[1]/processing-instruction()">
          <_gte:Gentexted-Content-Wrapper>
            <xsl:apply-templates mode="gentext" select="(ancestor-or-self::figure[1]//figno)[1]/*|(ancestor-or-self::figure[1]//figno)[1]/text()|(ancestor-or-self::figure[1]//figno)[1]/processing-instruction()">
              <xsl:with-param name="skip-expanded-gentext" select="'yes'"/>
            </xsl:apply-templates>
          </_gte:Gentexted-Content-Wrapper>
        </xsl:if>
        <xsl:text> </xsl:text>
      </xsl:with-param>
    </xsl:call-template>
  </xsl:template>
  
  <xsl:template match="book[contains(@doctype, 'ipc')]//ipc-fig-reloc/title" mode="gentext" priority="52">
    <xsl:call-template name="expand-gentext">
      <xsl:with-param name="content">
        <xsl:value-of select="$gen-texts//text[@name='figure']"/><xsl:text> </xsl:text>
        <xsl:if test="(ancestor-or-self::ipc-fig-reloc[1]//figno)[1]/*|(ancestor-or-self::ipc-fig-reloc[1]//figno)[1]/text()|(ancestor-or-self::ipc-fig-reloc[1]//figno)[1]/processing-instruction()">
          <_gte:Gentexted-Content-Wrapper>
            <xsl:apply-templates mode="gentext" select="(ancestor-or-self::ipc-fig-reloc[1]//figno)[1]/*|(ancestor-or-self::ipc-fig-reloc[1]//figno)[1]/text()|(ancestor-or-self::ipc-fig-reloc[1]//figno)[1]/processing-instruction()">
              <xsl:with-param name="skip-expanded-gentext" select="'yes'"/>
            </xsl:apply-templates>
          </_gte:Gentexted-Content-Wrapper>
        </xsl:if>
        <xsl:text> </xsl:text>
      </xsl:with-param>
    </xsl:call-template>
  </xsl:template>
  
  <xsl:template match="task//table/title" mode="gentext" priority="51">
    <xsl:call-template name="expand-gentext3">
      <xsl:with-param name="content-before">
        <xsl:choose>
          <xsl:when test="../@display='expand'">
            <xsl:value-of select="$gen-texts//text[@name='table']"/><xsl:text> </xsl:text>
            <xsl:call-template name="t-styler-numbering"/>
            <xsl:text>&#xa0;</xsl:text>
          </xsl:when>
          <xsl:otherwise>
            <_ufe:hidden>
              <xsl:value-of select="$gen-texts//text[@name='table']"/><xsl:text> </xsl:text>
              <xsl:call-template name="t-styler-numbering"/>
            </_ufe:hidden>
            <xsl:text>&#xa0;</xsl:text>
          </xsl:otherwise>
        </xsl:choose>
      </xsl:with-param>
      <xsl:with-param name="content-after">
        <xsl:variable name="task" select="ancestor-or-self::task[1]"/>
        <xsl:variable name="pre" select="concat(' (',$gen-texts//text[@name='task'],' ', $task/@chapnbr, '-', $task/@sectnbr, '-', $task/@subjnbr, '-', $task/@func, '-', $task/@seq)"/>
        <xsl:variable name="title">
          <xsl:choose>
            <xsl:when test="&anc-task-c;">
              <xsl:value-of select="concat($pre, '-', $task/@confltr, ')')"/>
            </xsl:when>
            <xsl:when test="&anc-task-v;">
              <xsl:value-of select="concat($pre, '-', $task/@varnbr, ')')"/>
            </xsl:when>
            <xsl:otherwise>
              <xsl:value-of select="concat($pre, ')')"/>
            </xsl:otherwise>
          </xsl:choose>
        </xsl:variable>
        <xsl:choose>
          <xsl:when test="../@display='expand'">
            <_ufe:block-nospace>
              <xsl:value-of select="$title"/>
            </_ufe:block-nospace>
          </xsl:when>
          <xsl:otherwise>
            <_ufe:hidden>
              <_ufe:block-nospace>
                <xsl:value-of select="$title"/>
              </_ufe:block-nospace>
            </_ufe:hidden>
          </xsl:otherwise>
        </xsl:choose>
        </xsl:with-param>
    </xsl:call-template>
  </xsl:template>
  
  <xsl:template match="page-block//graphic/title" mode="gentext" priority="50">
    <xsl:call-template name="expand-gentext">
      <xsl:with-param name="content">
        <xsl:value-of select="$gen-texts//text[@name='figure']"/><xsl:text> </xsl:text>
        <xsl:call-template name="t-styler-numbering"/>
        <xsl:text>&#xa0;</xsl:text>
      </xsl:with-param>
    </xsl:call-template>
  </xsl:template>
  
  <xsl:template match="ata-page-block//graphic/title" mode="gentext" priority="49">
    <xsl:call-template name="expand-gentext">
      <xsl:with-param name="content">
        <xsl:value-of select="$gen-texts//text[@name='figure']"/><xsl:text> </xsl:text>
        <xsl:call-template name="t-styler-numbering"/>
        <xsl:text>&#xa0;</xsl:text>
      </xsl:with-param>
    </xsl:call-template>
  </xsl:template>
  
  <xsl:template match="page-block//mm-fits/title" mode="gentext" priority="47">
    <xsl:call-template name="expand-gentext-numbering4"/>
  </xsl:template>
  
  <xsl:template match="ata-page-block//mm-fits/title" mode="gentext" priority="46">
    <xsl:call-template name="expand-gentext-numbering4"/>
  </xsl:template>
  
  <xsl:template match="ata-page-block//fits-and-clears/title" mode="gentext" priority="46">
    <xsl:call-template name="expand-gentext-numbering5"/>
  </xsl:template>
  
  <xsl:template match="page-block//fits-and-clears/title" mode="gentext" priority="45">
    <xsl:call-template name="expand-gentext-numbering5"/>
  </xsl:template>
  
  <xsl:template match="ata-page-block//n-para/title" mode="gentext" priority="43">
    <xsl:call-template name="expand-gentext-numbering4"/>
  </xsl:template>
  
  <xsl:template match="page-block//n-para/title" mode="gentext" priority="42">
    <xsl:call-template name="expand-gentext-numbering4"/>
  </xsl:template>
  
  <xsl:template match="mfmatr/title" mode="gentext" priority="42">
    <xsl:call-template name="expand-gentext-default"/>
  </xsl:template>
      
  <xsl:template match="figure/title" mode="gentext" priority="41">
    <xsl:call-template name="expand-gentext">
      <xsl:with-param name="content">
        <xsl:choose>
          <xsl:when test="&pb-01;"/>
          <xsl:when test="&pb-02; or &pb-03; or &pb-04; or &pb-05; or &pb-06; or &pb-07; or &pb-08; or &pb-09; or 
                          &pb-10; or &pb-11; or &pb-12; or &pb-13; or &pb-14; or &pb-15; or &pb-16; or &pb-17; or &pb-18;">
            <xsl:value-of select="$gen-texts//text[@name='figure']"/><xsl:text> </xsl:text>
            <xsl:call-template name="t-styler-numbering"/>
            <xsl:text>&#xa0;</xsl:text>
          </xsl:when>
        </xsl:choose>
      </xsl:with-param>
    </xsl:call-template>
  </xsl:template>
  
  <xsl:template match="subpara/title" mode="gentext" priority="38">
    <xsl:call-template name="expand-gentext-numbering5"/>
  </xsl:template>
  
  <xsl:template match="procedure/title" mode="gentext" priority="37">
    <xsl:call-template name="expand-gentext">
      <xsl:with-param name="content">
        <xsl:choose>
          <xsl:when test="(ancestor-or-self::table[1]/@role='torque-and-stretch') or (ancestor-or-self::table[1]/@role='spec-assem')"/>
          <xsl:otherwise>
            <xsl:call-template name="t-styler-numbering"/>
            <xsl:text>&#xa0;</xsl:text>
            <xsl:text>&#xa0;</xsl:text>
          </xsl:otherwise>
        </xsl:choose>
      </xsl:with-param>
    </xsl:call-template>
  </xsl:template>
  
  <xsl:template match="taskproc/title" mode="gentext" priority="34">
    <xsl:call-template name="expand-gentext-numbering5"/>
  </xsl:template>
  
  <xsl:template match="nutopt/title" mode="gentext" priority="32">
    <xsl:call-template name="expand-gentext-numbering4"/>
  </xsl:template>
  
  <xsl:template match="pgblk/title" mode="gentext" priority="29">
    <xsl:call-template name="expand-gentext"/>
  </xsl:template>
  
  <xsl:template match="pwcchapsect-item/title" mode="gentext" priority="28">
    <xsl:call-template name="expand-gentext-expanded"/>
  </xsl:template>
  
  <xsl:template match="tprereq/title" mode="gentext" priority="27">
    <xsl:call-template name="expand-gentext-numbering5"/>
  </xsl:template>
  
  <xsl:template match="subtask/title" mode="gentext" priority="26">
    <xsl:call-template name="expand-gentext-numbering5"/>
  </xsl:template>
  
  <xsl:template match="fits/title" mode="gentext" priority="25">
    <xsl:call-template name="expand-gentext-expanded"/>
  </xsl:template>
  
  <xsl:template match="task/title" mode="gentext" priority="24">
    <xsl:call-template name="expand-gentext-numbering4"/>
  </xsl:template>
  
  <xsl:template match="howtouse/title" mode="gentext" priority="23">
    <xsl:call-template name="expand-gentext-default"/>
  </xsl:template>
  
  <xsl:template match="highlights/title" mode="gentext" priority="22">
    <xsl:call-template name="expand-gentext-expanded"/>
  </xsl:template>
  
  <xsl:template match="lot-item/title" mode="gentext" priority="20">
    <xsl:call-template name="expand-gentext-default"/>
  </xsl:template>
  
  <xsl:template match="lot/title" mode="gentext" priority="19">
    <xsl:call-template name="expand-gentext-expanded"/>
  </xsl:template>
  
  <xsl:template match="table//procedure//title" mode="gentext" priority="17">
    <xsl:call-template name="expand-gentext-default"/>
  </xsl:template>
  
  <xsl:template match="torque-and-stretch/title" mode="gentext" priority="16">
    <xsl:call-template name="expand-gentext-default"/>
  </xsl:template>
  
  <xsl:template match="spec-tool-table/title" mode="gentext" priority="15">
    <xsl:call-template name="expand-gentext-numbering3"/>
  </xsl:template>
  
  <xsl:template match="subject/title" mode="gentext" priority="13">
    <xsl:call-template name="expand-gentext-expanded"/>
  </xsl:template>
  
  <xsl:template match="section/title" mode="gentext" priority="12">
    <xsl:call-template name="expand-gentext-expanded"/>
  </xsl:template>
  
  <xsl:template match="page-block/title" mode="gentext" priority="11">
    <xsl:call-template name="expand-gentext-numbering3"/>
  </xsl:template>
  
  <xsl:template match="frontmatter/title" mode="gentext" priority="8">
    <xsl:call-template name="expand-gentext-numbering3"/>
  </xsl:template>
  
  <xsl:template match="table[@display='expand']/title" mode="gentext" priority="6">
    <xsl:call-template name="expand-gentext">
      <xsl:with-param name="content">
        <xsl:choose>
          <xsl:when test="&anc-doc-cir; or &anc-doc-em; or &anc-doc-tmm;">
            <xsl:value-of select="$gen-texts//text[@name='table']"/><xsl:text> </xsl:text>
            <xsl:call-template name="t-styler-numbering-ufe"/>
            <xsl:text>&#xa0;</xsl:text>
          </xsl:when>
          <xsl:when test="&pb-01;"/>
          <xsl:when test="&pb-02; or &pb-03; or &pb-04; or &pb-05; or &pb-06; or &pb-07; or &pb-08; or &pb-09; or 
            &pb-10; or &pb-11; or &pb-12; or &pb-13; or &pb-14; or &pb-15; or &pb-16; or &pb-17; or &pb-18;">
            <xsl:value-of select="$gen-texts//text[@name='table']"/><xsl:text> </xsl:text>
            <xsl:call-template name="t-styler-numbering-ufe"/>
            <xsl:text>&#xa0;</xsl:text>
            <xsl:text>&#xa0;</xsl:text>
          </xsl:when>
        </xsl:choose>
      </xsl:with-param>
    </xsl:call-template>
  </xsl:template>
 
  <xsl:template match="table/title" mode="gentext" priority="5">
    <xsl:call-template name="expand-gentext">
      <xsl:with-param name="content">
        <xsl:choose>
          <xsl:when test="&anc-doc-cir; or &anc-doc-em; or &anc-doc-tmm;">
            <_ufe:hidden>
              <xsl:value-of select="$gen-texts//text[@name='table']"/><xsl:text> </xsl:text>
              <xsl:call-template name="t-styler-numbering"/>
            </_ufe:hidden>
            <xsl:text>&#xa0;</xsl:text>
          </xsl:when>
          <xsl:when test="&pb-01;"/>
          <xsl:when test="&pb-02; or &pb-03; or &pb-04; or &pb-05; or &pb-06; or &pb-07; or &pb-08; or &pb-09; or 
                          &pb-10; or &pb-11; or &pb-12; or &pb-13; or &pb-14; or &pb-15; or &pb-16; or &pb-17; or &pb-18;">
            <_ufe:hidden>
              <xsl:value-of select="$gen-texts//text[@name='table']"/><xsl:text> </xsl:text>
              <xsl:call-template name="t-styler-numbering"/>
              <xsl:text> </xsl:text>
            </_ufe:hidden>
          </xsl:when>    
        </xsl:choose>
      </xsl:with-param>
    </xsl:call-template>  
  </xsl:template>
  
  <xsl:template match="chapter/title" mode="gentext" priority="4">
    <xsl:call-template name="expand-gentext-expanded"/>
  </xsl:template>
  
  <xsl:template match="book/title" mode="gentext" priority="3">
    <xsl:call-template name="expand-gentext-default"/>
  </xsl:template>
  
  <xsl:template match="ata-page-block/title" mode="gentext" priority="2">
    <xsl:call-template name="expand-gentext-numbering3"/>
  </xsl:template>
  
  <xsl:template match="title-page/title" mode="gentext" priority="1">
    <xsl:call-template name="expand-gentext-numbering3"/>
  </xsl:template>
  
  <xsl:template match="title" mode="gentext" priority="0">
    <xsl:call-template name="expand-gentext-default"/>
  </xsl:template>
  
  <xsl:template match="title-page" mode="gentext" priority="0">
    <xsl:call-template name="expand-gentext2">
      <xsl:with-param name="content"><_ufe:proprietary-notice/></xsl:with-param>
    </xsl:call-template>
  </xsl:template>
  
  <xsl:template match="pgblk/_ufe:tmm-title" mode="gentext" priority="2">
    <xsl:call-template name="expand-gentext-pgblk-ufe-title"/>
  </xsl:template>
  
  <xsl:template match="pbfmatr/_ufe:tmm-title" mode="gentext" priority="1">
    <xsl:call-template name="expand-gentext-pgblk-ufe-title"/>
  </xsl:template>
  
  <xsl:template match="_ufe:tmm-title" mode="gentext" priority="0">
    <xsl:call-template name="expand-gentext-ufe">
      <xsl:with-param name="content">
        <xsl:choose>
          <xsl:when test="contains(//book/@doctype, 'lmm')">
            <xsl:value-of select="$gen-texts//text[@name='tmm-title-lmm']"/>
          </xsl:when>
          <xsl:otherwise>
            <xsl:value-of select="$gen-texts//text[@name='tmm-title']"/>
          </xsl:otherwise>
        </xsl:choose>
      </xsl:with-param>
    </xsl:call-template>
  </xsl:template>
    
  <xsl:template match="enumlist//enumlist//enumlist//enumlist/unlitem" mode="gentext" priority="12">
    <xsl:call-template name="expand-gentext-numbering"/>    
  </xsl:template>
  
  <xsl:template match="enumlist//enumlist//enumlist/unlitem" mode="gentext" priority="11">
    <xsl:call-template name="expand-gentext-numbering"/>
  </xsl:template>
  
  <xsl:template match="list//list//list/unlitem" mode="gentext" priority="10">
    <xsl:call-template name="expand-gentext-bullet">
      <xsl:with-param name="bullet">♦</xsl:with-param>
    </xsl:call-template>
  </xsl:template>
  
  <xsl:template match="bullist//bullist//bullist/unlitem" mode="gentext" priority="9">
    <xsl:call-template name="expand-gentext-bullet">
      <xsl:with-param name="bullet">♦</xsl:with-param>
    </xsl:call-template>
  </xsl:template>
  
  <xsl:template match="enumlist//enumlist/unlitem" mode="gentext" priority="8">
    <xsl:call-template name="expand-gentext-numbering"/>
  </xsl:template>
  
  <xsl:template match="list//list/unlitem" mode="gentext" priority="7">
    <xsl:call-template name="expand-gentext-bullet">
      <xsl:with-param name="bullet">–</xsl:with-param>
    </xsl:call-template>
  </xsl:template>
  
  <xsl:template match="bullist//bullist/unlitem" mode="gentext" priority="6">
    <xsl:call-template name="expand-gentext-bullet">
      <xsl:with-param name="bullet">–</xsl:with-param>
    </xsl:call-template>
  </xsl:template>
  
  <xsl:template match="enumlist/unlitem" mode="gentext" priority="5">
    <xsl:call-template name="expand-gentext-numbering"/>
  </xsl:template>
  
  <xsl:template match="unlist/unlitem" mode="gentext" priority="3">
    <xsl:call-template name="expand-gentext">
      <xsl:with-param name="content">
        <xsl:choose>
          <xsl:when test="ancestor-or-self::unlist[1]/@bulltype[.='BULLET']">
            <xsl:text>•</xsl:text>
            <xsl:text>&#xa0;</xsl:text>
          </xsl:when>
          <xsl:when test="ancestor-or-self::unlist[1]/@bulltype[.='NDASH']">
            <span style="font-family: 'Agency FB'; ">
              <xsl:text>–</xsl:text>
            </span>
            <xsl:text>&#xa0;</xsl:text>
          </xsl:when>
        </xsl:choose>
      </xsl:with-param>
    </xsl:call-template>
  </xsl:template>
  
  <xsl:template match="list/unlitem" mode="gentext" priority="2">
    <xsl:call-template name="expand-gentext-bullet">
      <xsl:with-param name="bullet">•</xsl:with-param>
    </xsl:call-template>
  </xsl:template>
  
  <xsl:template match="bullist/unlitem" mode="gentext" priority="1">
    <xsl:call-template name="expand-gentext-bullet">
      <xsl:with-param name="bullet">•</xsl:with-param>
    </xsl:call-template>
  </xsl:template>
   
  <xsl:template match="url" mode="gentext" priority="0">
    <xsl:call-template name="expand-gentext">
      <xsl:with-param name="content">
        <xsl:value-of select="$gen-texts//text[@name='url']"/><xsl:value-of select="$gen-texts//text[@name='sep0']"/>
        <xsl:text> </xsl:text>
        <_ufe:url-link>
          <xsl:if test="string(.)">
            <xsl:attribute name="url">
              <xsl:value-of select="string(.)"/>
            </xsl:attribute>
          </xsl:if>
        </_ufe:url-link></xsl:with-param>
    </xsl:call-template>
  </xsl:template>
  
  <xsl:template match="_ufe:url-link" mode="gentext" priority="0">
    <xsl:call-template name="expand-gentext-ufe">
      <xsl:with-param name="content">
        <_sfe:ExternalLink>
          <!--xsl:if test="concat('http://', string(./@url))"-->
          <xsl:if test="string(@url)">
            <xsl:attribute name="href">
              <xsl:choose>
                <xsl:when test="starts-with(@url,'http://') or starts-with(@url,'https://') or starts-with(@url,'ftp://')">
                  <xsl:value-of select="string(@url)"/>
                </xsl:when>
                <xsl:otherwise>
                  <xsl:value-of select="concat('http://', string(@url))"/>
                </xsl:otherwise>
              </xsl:choose>
            </xsl:attribute>
          </xsl:if>
          <xsl:value-of select="@url"/>
        </_sfe:ExternalLink>
      </xsl:with-param>
    </xsl:call-template>
  </xsl:template>
    
  <xsl:template match="fandc/warning" mode="gentext" priority="6">
    <xsl:call-template name="expand-gentext-default"/>
  </xsl:template>
  
  <xsl:template match="spec-assem/warning" mode="gentext" priority="5">
    <xsl:call-template name="expand-gentext-default"/>
  </xsl:template>
  
  <xsl:template match="spring-pressure/warning" mode="gentext" priority="4">
    <xsl:call-template name="expand-gentext-default"/>
  </xsl:template>
  
  <xsl:template match="torque-and-stretch/warning" mode="gentext" priority="3">
    <xsl:call-template name="expand-gentext-default"/>
  </xsl:template>
  
  <xsl:template match="fits-and-clears/warning" mode="gentext" priority="2">
    <xsl:call-template name="expand-gentext-default"/>
  </xsl:template>
  
  <xsl:template match="subpara/warning" mode="gentext" priority="1">
    <xsl:call-template name="expand-gentext-warning"/>
  </xsl:template>
  
  <xsl:template match="warning" mode="gentext" priority="0">
    <xsl:call-template name="expand-gentext-warning"/>
  </xsl:template>

  <xsl:template match="xref" mode="gentext">
     <xsl:call-template name="expand-gentext-expanded"/>
  </xsl:template>
    
  <xsl:template match="zip" mode="gentext" priority="0">
    <xsl:call-template name="expand-gentext2">
      <xsl:with-param name="content">
        <xsl:choose>
          <xsl:when test="not(./*[not(self::_sfe:BeforeOrAfterText)]|./text()[normalize-space(.)!=''])"/>
          <xsl:otherwise>
            <xsl:text>&#xa0;</xsl:text>
          </xsl:otherwise>
        </xsl:choose>
      </xsl:with-param>
    </xsl:call-template>
  </xsl:template>
    
  <xsl:template match="_gte:styler_numbering" mode="gentext">
    <xsl:copy>
       <xsl:copy-of select="@*"/>
    </xsl:copy>
  </xsl:template>
  
  <xsl:template match="_gte:Gentexted-Content-Wrapper" mode="gentext">
    <xsl:call-template name="expand-gentext"/>
  </xsl:template>
    
  <xsl:template match="_sfe:BeforeOrAfterText" mode="gentext" priority="100">
    <xsl:param name="skip-expanded-gentext" select="'no'"/>
    <xsl:choose>
       <xsl:when test="$skip-expanded-gentext='yes'"/>
       <xsl:otherwise>
          <xsl:copy>
             <xsl:apply-templates select="@* | node()" mode="gentext"/>
          </xsl:copy>
       </xsl:otherwise>
    </xsl:choose>
  </xsl:template>
  
  <xsl:template match="_sfe:CollectionItem[1]" mode="gentext" priority="3">
    <xsl:call-template name="expand-gentext"/>
  </xsl:template>
  
  <xsl:template match="_sfe:CollectionItem[position()&gt;1 and not(position()=last())]" mode="gentext" priority="2">
    <xsl:call-template name="expand-gentext-ufe">
      <xsl:with-param name="content">
        <xsl:value-of select="$gen-texts//text[@name='sep2']"/>
      </xsl:with-param>
    </xsl:call-template>
  </xsl:template>
  
  <xsl:template match="_sfe:CollectionItem[last()]" mode="gentext" priority="1">
    <xsl:call-template name="expand-gentext-ufe">
      <xsl:with-param name="content">
        <xsl:value-of select="$gen-texts//text[@name='sep2']"/><xsl:value-of select="$gen-texts//text[@name='cond-and-1']"/><xsl:text> </xsl:text>
      </xsl:with-param>
    </xsl:call-template>
  </xsl:template>
  
  <xsl:template match="_sfe:IndexEndPage" mode="gentext" priority="0">
    <xsl:call-template name="expand-gentext-ufe">
      <xsl:with-param name="content">
        <xsl:text>–</xsl:text>
      </xsl:with-param>
    </xsl:call-template>
  </xsl:template>
   
  <xsl:template match="_sfe:IndexLocators" mode="gentext" priority="0">
    <xsl:call-template name="expand-gentext-ufe">
      <xsl:with-param name="content">
        <xsl:text> </xsl:text>
      </xsl:with-param>
    </xsl:call-template>
  </xsl:template>
  
  <xsl:template match="_sfe:IndexPage[position()&gt;1]" mode="gentext" priority="1">
    <xsl:call-template name="expand-gentext-ufe">
      <xsl:with-param name="content">
        <xsl:value-of select="$gen-texts//text[@name='sep2']"/>
      </xsl:with-param>
    </xsl:call-template>
  </xsl:template>
  
  <xsl:template match="_sfe:IndexSee" mode="gentext" priority="0">
    <xsl:call-template name="expand-gentext-ufe">
      <xsl:with-param name="content">
        <xsl:value-of select="$gen-texts//text[@name='sep2']"/>
        <span style="font-style: italic; ">
          <xsl:value-of select="$gen-texts//text[@name='see']"/><xsl:text> </xsl:text>
        </span>
      </xsl:with-param>
    </xsl:call-template>
  </xsl:template>
  
  <xsl:template match="_sfe:IndexSeeAlso" mode="gentext" priority="0">
    <xsl:call-template name="expand-gentext-ufe">
      <xsl:with-param name="content">
        <xsl:value-of select="$gen-texts//text[@name='sep2']"/>
        <span style="font-style: italic; ">
          <xsl:value-of select="$gen-texts//text[@name='see-also']"/><xsl:text> </xsl:text>
        </span>
      </xsl:with-param>
    </xsl:call-template>
  </xsl:template>
  
</xsl:stylesheet>
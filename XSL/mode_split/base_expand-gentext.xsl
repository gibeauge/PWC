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
      <xsl:apply-templates select="@*|node()" mode="expand-gentext"/>
    </xsl:copy>  
  </xsl:template>
    
  <xsl:template name="expand-gentext-expanded">
    <xsl:copy>
      <xsl:attribute name="_gte:Gentext-Expanded">y</xsl:attribute>
      <xsl:apply-templates select="@*|node()" mode="expand-gentext"/>
    </xsl:copy>
  </xsl:template>
  
  <xsl:template name="expand-gentext">
    <xsl:param name="content" as="item()*"/>
    <xsl:copy>
      <xsl:attribute name="_gte:Gentext-Expanded">y</xsl:attribute>
      <xsl:apply-templates select="@*" mode="expand-gentext"/>
      <xsl:if test="not(@_gte:Gentext-Expanded)">
        <_sfe:BeforeOrAfterText>
          <xsl:copy-of select="exslt:node-set($content)"/>
        </_sfe:BeforeOrAfterText>
      </xsl:if>
      <xsl:apply-templates select="* | text() | processing-instruction()" mode="expand-gentext"/>
    </xsl:copy>
  </xsl:template>
  
  <xsl:template name="expand-gentext2">
    <xsl:param name="content" as="item()*"/>
    <xsl:copy>
      <xsl:attribute name="_gte:Gentext-Expanded">y</xsl:attribute>
      <xsl:apply-templates select="@*|node()" mode="expand-gentext"/>
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
      <xsl:apply-templates select="@*" mode="expand-gentext"/>
      <xsl:if test="not(@_gte:Gentext-Expanded)">
        <_sfe:BeforeOrAfterText>
          <xsl:copy-of select="exslt:node-set($content-before)"/>
        </_sfe:BeforeOrAfterText>
      </xsl:if>
      <xsl:apply-templates select="* | text() | processing-instruction()" mode="expand-gentext"/>
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
      <xsl:apply-templates mode="expand-gentext" select="@*"/>
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
            <xsl:apply-templates mode="expand-gentext" select="* | text() | processing-instruction()"/> 
          </span>
        </xsl:when>
        <xsl:otherwise>
          <xsl:apply-templates mode="expand-gentext" select="* | text() | processing-instruction()"/>
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
        <span style="font-weight: bold; background-color: #FFFF00; text-decoration: underline; ">
          <xsl:text>CAUTION</xsl:text>
        </span>
        <xsl:text>: </xsl:text>
      </xsl:with-param>
    </xsl:call-template>
  </xsl:template>

  <xsl:template name="expand-gentext-warning">
    <xsl:call-template name="expand-gentext">
      <xsl:with-param name="content">
        <span style="font-weight: bold; color: #FFFF00; background-color: #FF0000; text-decoration: underline; ">
          <xsl:text>WARNING</xsl:text>
        </span>
        <xsl:text>: </xsl:text>  
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
      <xsl:apply-templates select="@*" mode="expand-gentext"/>
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
      <xsl:apply-templates select="* | text() | processing-instruction()" mode="expand-gentext"/>
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

  <xsl:template match="numlist/address" mode="expand-gentext" priority="7">
    <xsl:call-template name="expand-gentext-numbering"/>
  </xsl:template>
  
  <xsl:template match="sbdata/address|alpha-list/address" mode="expand-gentext" priority="6">
    <xsl:call-template name="expand-gentext-bullet">
      <xsl:with-param name="bullet">•</xsl:with-param>
    </xsl:call-template>
  </xsl:template>
  
  <xsl:template match="num-list/address|pwcchapsect-list/address" mode="expand-gentext" priority="5">
    <xsl:call-template name="expand-gentext-bullet">
      <xsl:with-param name="bullet">•</xsl:with-param>
    </xsl:call-template>
  </xsl:template>
    
  <xsl:template match="address/att" mode="expand-gentext" priority="1">
    <xsl:call-template name="expand-gentext">
      <xsl:with-param name="content"><xsl:text>Attention: </xsl:text></xsl:with-param>
    </xsl:call-template>
  </xsl:template>
    
  <xsl:template match="book" mode="expand-gentext" priority="0">
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
  
  <xsl:template match="brk" mode="expand-gentext" priority="0">
    <xsl:call-template name="expand-gentext2">
      <xsl:with-param name="content"><xsl:processing-instruction name="Pub">_newline</xsl:processing-instruction></xsl:with-param>
    </xsl:call-template>
  </xsl:template>
  
  <xsl:template match="figure/key/callout" mode="expand-gentext" priority="1">
    <xsl:call-template name="expand-gentext2">
      <xsl:with-param name="content"><xsl:text>&#xa0;</xsl:text></xsl:with-param>
    </xsl:call-template>
  </xsl:template>
  
  <xsl:template match="caution[parent::fandc or parent::spec-assem or parent::spring-pressure or parent::torque-and-stretch or parent::fits-and-clears]" mode="expand-gentext" priority="6">
   <xsl:call-template name="expand-gentext-default"/>
  </xsl:template>
  
  <xsl:template match="caution" mode="expand-gentext" priority="0">
    <xsl:call-template name="expand-gentext-caution"/>
  </xsl:template>
  
  <xsl:template match="chapsect-list" mode="expand-gentext" priority="0">
    <xsl:call-template name="expand-gentext">
      <xsl:with-param name="content"><_ufe:chapsect-title/></xsl:with-param>
    </xsl:call-template>
  </xsl:template>
  
  <xsl:template match="pgblk/_ufe:chapsect-title" mode="expand-gentext" priority="2">
    <xsl:call-template name="expand-gentext-pgblk-ufe-title"/>
  </xsl:template>
  
  <xsl:template match="pbfmatr/_ufe:chapsect-title" mode="expand-gentext" priority="1">
    <xsl:call-template name="expand-gentext-pgblk-ufe-title"/>
  </xsl:template>
  
  <xsl:template match="_ufe:chapsect-title" mode="expand-gentext" priority="0">
    <xsl:call-template name="expand-gentext-ufe">
      <xsl:with-param name="content">LIST OF CHAPTER/SECTION/SUBJECTS</xsl:with-param>
    </xsl:call-template>    
  </xsl:template>
    
  <xsl:template match="pgblk/_ufe:cir-title" mode="expand-gentext" priority="2">
    <xsl:call-template name="expand-gentext-pgblk-ufe-title"/>
  </xsl:template>
  
  <xsl:template match="pbfmatr/_ufe:cir-title" mode="expand-gentext" priority="1">
    <xsl:call-template name="expand-gentext-pgblk-ufe-title"/>
  </xsl:template>
  
  <xsl:template match="_ufe:cir-title" mode="expand-gentext" priority="0">
    <xsl:call-template name="expand-gentext-ufe">
      <xsl:with-param name="content">CLEANING INSPECTION REPAIR (CIR) MANUAL</xsl:with-param>
    </xsl:call-template>    
  </xsl:template>
  
  <xsl:template match="city" mode="expand-gentext" priority="0">
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
  
  <xsl:template match="consumable" mode="expand-gentext" priority="0">
    <xsl:call-template name="expand-gentext">
      <xsl:with-param name="content"><xsl:value-of select="@id"/></xsl:with-param>
    </xsl:call-template>
  </xsl:template>
  
  <xsl:template match="pgblk/_ufe:consumables-title" mode="expand-gentext" priority="5">
    <xsl:call-template name="expand-gentext-pgblk-ufe-title"/>
  </xsl:template>
  
  <xsl:template match="pbfmatr/_ufe:consumables-title" mode="expand-gentext" priority="4">
    <xsl:call-template name="expand-gentext-pgblk-ufe-title"/>
  </xsl:template>
  
  <xsl:template match="pwcspblist/_ufe:consumables-title" mode="expand-gentext" priority="3">
    <xsl:call-template name="expand-gentext-pgblk-ufe-title"/>
  </xsl:template>
  
  <xsl:template match="ata-page-block//consumables//_ufe:consumables-title" mode="expand-gentext" priority="2">
    <xsl:call-template name="expand-gentext-pgblk-ufe-title2">
      <xsl:with-param name="content">Consumable Materials</xsl:with-param>
    </xsl:call-template>
  </xsl:template>
  
  <xsl:template match="page-block//consumables//_ufe:consumables-title" mode="expand-gentext" priority="1">
    <xsl:call-template name="expand-gentext-pgblk-ufe-title2">
      <xsl:with-param name="content">Consumable Materials</xsl:with-param>
    </xsl:call-template>
  </xsl:template>
  
  <xsl:template match="_ufe:consumables-title" mode="expand-gentext" priority="0">
    <xsl:call-template name="expand-gentext-default"/>
  </xsl:template>
    
  <xsl:template match="dash" mode="expand-gentext" priority="0">
    <xsl:call-template name="expand-gentext">
      <xsl:with-param name="content">
        <xsl:text>—</xsl:text>
      </xsl:with-param>
    </xsl:call-template>
  </xsl:template>
    
  <xsl:template match="deflist/def|key/def" mode="expand-gentext" priority="2">
    <xsl:call-template name="expand-gentext2">
      <xsl:with-param name="content"><xsl:processing-instruction name="Pub">_newline</xsl:processing-instruction></xsl:with-param>
    </xsl:call-template>
  </xsl:template>
    
  <xsl:template match="deleted" mode="expand-gentext" priority="0">
    <xsl:call-template name="expand-gentext">
      <xsl:with-param name="content"><xsl:text>This topic has been deleted.</xsl:text></xsl:with-param>
    </xsl:call-template>
  </xsl:template>
  
  <xsl:template match="pgblk/_ufe:eipc-title" mode="expand-gentext" priority="2">
    <xsl:call-template name="expand-gentext-pgblk-ufe-title"/>
  </xsl:template>
  
  <xsl:template match="pbfmatr/_ufe:eipc-title" mode="expand-gentext" priority="1">
    <xsl:call-template name="expand-gentext-pgblk-ufe-title"/>
  </xsl:template>
  
  <xsl:template match="_ufe:eipc-title" mode="expand-gentext" priority="0">
    <xsl:call-template name="expand-gentext-ufe">
      <xsl:with-param name="content">ILLUSTRATED PARTS CATALOG</xsl:with-param>
    </xsl:call-template>
  </xsl:template>
  
  <xsl:template match="pgblk/_ufe:em-title" mode="expand-gentext" priority="2">
    <xsl:call-template name="expand-gentext-pgblk-ufe-title"/>
  </xsl:template>
  
  <xsl:template match="pbfmatr/_ufe:em-title" mode="expand-gentext" priority="1">
    <xsl:call-template name="expand-gentext-pgblk-ufe-title"/>
  </xsl:template>
  
  <xsl:template match="_ufe:em-title" mode="expand-gentext" priority="0">
    <xsl:call-template name="expand-gentext-ufe">
      <xsl:with-param name="content">OVERHAUL MANUAL</xsl:with-param>
    </xsl:call-template>    
  </xsl:template>
  
  <xsl:template match="email" mode="expand-gentext" priority="0">
    <xsl:call-template name="expand-gentext">
      <xsl:with-param name="content">
        <xsl:text>Email: </xsl:text>
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
  
  <xsl:template match="_ufe:email-link" mode="expand-gentext" priority="0">
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
  
  <xsl:template match="engine[position()&gt;1]" mode="expand-gentext" priority="1">
    <xsl:call-template name="expand-gentext">
      <xsl:with-param name="content"><xsl:text>/</xsl:text></xsl:with-param>
    </xsl:call-template>
  </xsl:template>
    
  <xsl:template match="_ufe:engine-type" mode="expand-gentext" priority="0">
    <xsl:call-template name="expand-gentext-ufe">
      <xsl:with-param name="content">
        <xsl:choose>
          <xsl:when test="@enginetype='APU'">
            <xsl:text>AUXILIARY POWER UNIT</xsl:text>
          </xsl:when>
          <xsl:when test="@enginetype='SHAFT'">
            <xsl:text>TURBOSHAFT ENGINE</xsl:text>
          </xsl:when>
          <xsl:when test="@enginetype='PROP'">
            <xsl:text>TURBOPROP ENGINE</xsl:text>
          </xsl:when>
          <xsl:when test="@enginetype='FAN'">
            <xsl:text>TURBOFAN ENGINE</xsl:text>
          </xsl:when>
        </xsl:choose>
      </xsl:with-param>
    </xsl:call-template>
  </xsl:template>
  
  <xsl:template match="address/fax" mode="expand-gentext" priority="1">
    <xsl:call-template name="expand-gentext">
      <xsl:with-param name="content"><xsl:text>FAX: </xsl:text></xsl:with-param>
    </xsl:call-template>
  </xsl:template>
  
  <xsl:template match="pgblk/_ufe:fixequ-title" mode="expand-gentext" priority="5">
   <xsl:call-template name="expand-gentext-pgblk-ufe-title"/>
  </xsl:template>
  
  <xsl:template match="pbfmatr/_ufe:fixequ-title" mode="expand-gentext" priority="4">
   <xsl:call-template name="expand-gentext-pgblk-ufe-title"/>
  </xsl:template>
  
  <xsl:template match="pwcspblist/_ufe:fixequ-title" mode="expand-gentext" priority="3">
    <xsl:call-template name="expand-gentext-pgblk-ufe-title"/>
  </xsl:template>
  
  <xsl:template match="page-block//fixtures-and-equipment//_ufe:fixequ-title" mode="expand-gentext" priority="2">
    <xsl:call-template name="expand-gentext-pgblk-ufe-title2">
      <xsl:with-param name="content">Fixtures, Equipment and Supplier Tools</xsl:with-param>
    </xsl:call-template>
  </xsl:template>
  
  <xsl:template match="ata-page-block//fixtures-and-equipment//_ufe:fixequ-title" mode="expand-gentext" priority="1">
    <xsl:call-template name="expand-gentext-pgblk-ufe-title2">
      <xsl:with-param name="content">Fixtures, Equipment and Supplier Tools</xsl:with-param>
    </xsl:call-template>
  </xsl:template>
  
  <xsl:template match="_ufe:fixequ-title" mode="expand-gentext" priority="0">
    <xsl:call-template name="expand-gentext-default"/>
  </xsl:template>
  
  <xsl:template match="eqn/frac" mode="expand-gentext" priority="20">
    <xsl:call-template name="expand-gentext">
      <xsl:with-param name="content">
        <table frame="none" id="frac01" tabstyle="frac">
          <tgroup cols="2">
            <xsl:processing-instruction name="PubTbl">tgroup clmarg="0.00pt" crmarg="0.00pt" rth="0.00pt"</xsl:processing-instruction>
            <colspec colname="col1" colwidth="10px"/>
            <colspec colname="col2" colwidth="10px"/>
            <tbody>
              <row>
                <entry nameend="col2" namest="col1" colsep="0" rowsep="1">
                  <xsl:if test="(ancestor-or-self::frac[1]//num)[1]/*|(ancestor-or-self::frac[1]//num)[1]/text()|(ancestor-or-self::frac[1]//num)[1]/processing-instruction()">
                    <_gte:Gentexted-Content-Wrapper>
                      <xsl:apply-templates mode="expand-gentext" select="(ancestor-or-self::frac[1]//num)[1]/*|(ancestor-or-self::frac[1]//num)[1]/text()|(ancestor-or-self::frac[1]//num)[1]/processing-instruction()">
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
                      <xsl:apply-templates mode="expand-gentext" select="(ancestor-or-self::frac[1]//denom)[1]/*|(ancestor-or-self::frac[1]//denom)[1]/text()|(ancestor-or-self::frac[1]//denom)[1]/processing-instruction()">
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
    
  <xsl:template match="pgblk/_ufe:general-title" mode="expand-gentext" priority="5">
    <xsl:call-template name="expand-gentext-pgblk-ufe-title"/>
  </xsl:template>
  
  <xsl:template match="pbfmatr/_ufe:general-title" mode="expand-gentext" priority="4">
    <xsl:call-template name="expand-gentext-pgblk-ufe-title"/>
  </xsl:template>
  
  <xsl:template match="pwcspblist/_ufe:general-title" mode="expand-gentext" priority="3">
    <xsl:call-template name="expand-gentext-pgblk-ufe-title"/>
  </xsl:template>
  
  <xsl:template match="page-block//general//_ufe:general-title" mode="expand-gentext" priority="2">
    <xsl:call-template name="expand-gentext-pgblk-ufe-title2">
      <xsl:with-param name="content">General</xsl:with-param>   
    </xsl:call-template>    
  </xsl:template>
  
  <xsl:template match="ata-page-block//general//_ufe:general-title" mode="expand-gentext" priority="1">
    <xsl:call-template name="expand-gentext-pgblk-ufe-title2">
      <xsl:with-param name="content">General</xsl:with-param>   
    </xsl:call-template>    
  </xsl:template>
  
  <xsl:template match="_ufe:general-title" mode="expand-gentext" priority="0">
    <xsl:call-template name="expand-gentext-default"/>
  </xsl:template>
  
  <xsl:template match="pgblk/_ufe:glossary-title" mode="expand-gentext" priority="3">
    <xsl:call-template name="expand-gentext-pgblk-ufe-title"/>
  </xsl:template>
  
  <xsl:template match="pbfmatr/_ufe:glossary-title" mode="expand-gentext" priority="2">
    <xsl:call-template name="expand-gentext-pgblk-ufe-title"/>
  </xsl:template>
  
  <xsl:template match="pwcspblist/_ufe:glossary-title" mode="expand-gentext" priority="1">
    <xsl:call-template name="expand-gentext-pgblk-ufe-title"/>
  </xsl:template>
  
  <xsl:template match="_ufe:glossary-title" mode="expand-gentext" priority="0">
    <xsl:call-template name="expand-gentext-ufe">
      <xsl:with-param name="content">GLOSSARY</xsl:with-param>
    </xsl:call-template>
  </xsl:template>
  
  <xsl:template match="_ufe:highlights-link" mode="expand-gentext" priority="0">
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
    
  <xsl:template match="pgblk/_ufe:howtouse-title" mode="expand-gentext" priority="2">
    <xsl:call-template name="expand-gentext-pgblk-ufe-title"/>
  </xsl:template>
  
  <xsl:template match="pbfmatr/_ufe:howtouse-title" mode="expand-gentext" priority="1">
    <xsl:call-template name="expand-gentext-pgblk-ufe-title"/>
  </xsl:template>
  
  <xsl:template match="_ufe:howtouse-title" mode="expand-gentext" priority="0">
    <xsl:call-template name="expand-gentext-ufe">
      <xsl:with-param name="content">HOW TO USE MANUAL</xsl:with-param>
    </xsl:call-template>
  </xsl:template>
  
  <xsl:template match="int-mail" mode="expand-gentext" priority="0">
    <xsl:call-template name="expand-gentext3">
      <xsl:with-param name="content-before">
        <xsl:text>(</xsl:text>
      </xsl:with-param>
      <xsl:with-param name="content-after">
        <xsl:text>)</xsl:text>
      </xsl:with-param>
    </xsl:call-template>
  </xsl:template>
  
  <xsl:template match="pgblk/_ufe:intro-title" mode="expand-gentext" priority="2">
    <xsl:call-template name="expand-gentext-pgblk-ufe-title"/>
  </xsl:template>
  
  <xsl:template match="pbfmatr/_ufe:intro-title" mode="expand-gentext" priority="1">
    <xsl:call-template name="expand-gentext-pgblk-ufe-title"/>
  </xsl:template>
  
  <xsl:template match="_ufe:intro-title" mode="expand-gentext" priority="0">
    <xsl:call-template name="expand-gentext-ufe">
      <xsl:with-param name="content">INTRODUCTION</xsl:with-param>
    </xsl:call-template>
  </xsl:template>
  
  <xsl:template match="step/step/enumlist/item" mode="expand-gentext" priority="30">
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
  
  <xsl:template match="prclist4//prclist4//prclist4//prclist4/item" mode="expand-gentext" priority="29">
    <xsl:call-template name="expand-gentext-numbering"/>
  </xsl:template>
  
  <xsl:template match="list4//list4//list4//list4/item" mode="expand-gentext" priority="28">
    <xsl:call-template name="expand-gentext-numbering"/>
  </xsl:template>
  
  <xsl:template match="enumlist//enumlist//enumlist//enumlist/item" mode="expand-gentext" priority="27">
    <xsl:call-template name="expand-gentext-numbering"/>
  </xsl:template>
  
  <xsl:template match="prclist4//prclist4//prclist4/item" mode="expand-gentext" priority="26">
    <xsl:call-template name="expand-gentext-numbering"/>
  </xsl:template>
  
  <xsl:template match="list4//list4//list4/item" mode="expand-gentext" priority="25">
    <xsl:call-template name="expand-gentext-numbering"/>
  </xsl:template>
  
  <xsl:template match="list//list//list/item" mode="expand-gentext" priority="24">
    <xsl:call-template name="expand-gentext-bullet">
      <xsl:with-param name="bullet">♦</xsl:with-param>
    </xsl:call-template>
  </xsl:template>
  
  <xsl:template match="enumlist//enumlist//enumlist/item" mode="expand-gentext" priority="23">
    <xsl:call-template name="expand-gentext-numbering"/>
  </xsl:template>
  
  <xsl:template match="bullist//bullist//bullist/item" mode="expand-gentext" priority="22">
    <xsl:call-template name="expand-gentext-bullet">
      <xsl:with-param name="bullet">♦</xsl:with-param>
    </xsl:call-template>
  </xsl:template>
  
  <xsl:template match="prclist4//prclist4/item" mode="expand-gentext" priority="21">
    <xsl:call-template name="expand-gentext-numbering"/>
  </xsl:template>
  
  <xsl:template match="list4//list4/item" mode="expand-gentext" priority="20">
    <xsl:call-template name="expand-gentext-numbering"/>
  </xsl:template>
  
  <xsl:template match="list//list/item" mode="expand-gentext" priority="19">
    <xsl:call-template name="expand-gentext-bullet">
      <xsl:with-param name="bullet">–</xsl:with-param>
    </xsl:call-template>
  </xsl:template>
  
  <xsl:template match="enumlist//enumlist/item" mode="expand-gentext" priority="18">
    <xsl:call-template name="expand-gentext-numbering"/>
  </xsl:template>
  
  <xsl:template match="bullist//bullist/item" mode="expand-gentext" priority="17">
    <xsl:call-template name="expand-gentext-bullet">
      <xsl:with-param name="bullet">–</xsl:with-param>
    </xsl:call-template>
  </xsl:template>
  
  <xsl:template match="list/item[table/@tabstyle='frac']" mode="expand-gentext" priority="16">
    <xsl:call-template name="expand-gentext-bullet">
      <xsl:with-param name="bullet">•</xsl:with-param>
    </xsl:call-template>
  </xsl:template>
  
  <xsl:template match="bullist/item[table/@tabstyle='frac']" mode="expand-gentext" priority="15">
    <xsl:call-template name="expand-gentext-bullet">
      <xsl:with-param name="bullet">•</xsl:with-param>
    </xsl:call-template>
  </xsl:template>
  
  <xsl:template match="pwcchapsect-list/item" mode="expand-gentext" priority="14">
    <xsl:call-template name="expand-gentext-default"/>
  </xsl:template>
  
  <xsl:template match="numlist/item" mode="expand-gentext" priority="13">
    <xsl:call-template name="expand-gentext-numbering"/>
  </xsl:template>
  
  <xsl:template match="unlist/item" mode="expand-gentext" priority="12">
    <xsl:call-template name="expand-gentext-bullet">
      <xsl:with-param name="bullet">•</xsl:with-param>
    </xsl:call-template>
  </xsl:template>
  
  <xsl:template match="prclist4/item" mode="expand-gentext" priority="11">
    <xsl:call-template name="expand-gentext-numbering"/>
  </xsl:template>
  
  <xsl:template match="prclist3/item" mode="expand-gentext" priority="10">
    <xsl:call-template name="expand-gentext-numbering"/>
  </xsl:template>
  
  <xsl:template match="prclist2/item" mode="expand-gentext" priority="9">
    <xsl:call-template name="expand-gentext-numbering"/>
  </xsl:template>
  
  <xsl:template match="prclist1/item" mode="expand-gentext" priority="8">
    <xsl:call-template name="expand-gentext-numbering"/>
  </xsl:template>
  
  <xsl:template match="list4/item" mode="expand-gentext" priority="7">
    <xsl:call-template name="expand-gentext-numbering"/>
  </xsl:template>
  
  <xsl:template match="list3/item" mode="expand-gentext" priority="6">
    <xsl:call-template name="expand-gentext-numbering"/>
  </xsl:template>
  
  <xsl:template match="list2/item" mode="expand-gentext" priority="5">
    <xsl:call-template name="expand-gentext-numbering"/>
  </xsl:template>
  
  <xsl:template match="list1/item" mode="expand-gentext" priority="4">
    <xsl:call-template name="expand-gentext-numbering"/>
  </xsl:template>
  
  <xsl:template match="list/item" mode="expand-gentext" priority="3">
    <xsl:call-template name="expand-gentext-default"/>
  </xsl:template>
  
  <xsl:template match="enumlist/item" mode="expand-gentext" priority="2">
    <xsl:call-template name="expand-gentext">
      <xsl:with-param name="content">
        <xsl:call-template name="t-styler-numbering"/>
        <xsl:text>&#xa0;</xsl:text>
        <xsl:text>&#xa0;</xsl:text>
      </xsl:with-param>
    </xsl:call-template>
  </xsl:template>
  
  <xsl:template match="bullist/item" mode="expand-gentext" priority="1">
    <xsl:call-template name="expand-gentext-bullet">
      <xsl:with-param name="bullet">•</xsl:with-param>
    </xsl:call-template>
  </xsl:template>
    
  <xsl:template match="figure/key" mode="expand-gentext" priority="20">
    <xsl:call-template name="expand-gentext2">
      <xsl:with-param name="content"><hr/></xsl:with-param>
    </xsl:call-template>
  </xsl:template>
  
  <xsl:template match="manual-pn" mode="expand-gentext" priority="0">
    <xsl:call-template name="expand-gentext">
      <xsl:with-param name="content"><xsl:text>Manual Part No. </xsl:text></xsl:with-param>
    </xsl:call-template>
  </xsl:template>
  
  <xsl:template match="pbfmatr/manual-title" mode="expand-gentext" priority="3">
    <xsl:call-template name="expand-gentext-numbering2"/>
  </xsl:template>
  
  <xsl:template match="pwcspblist/manual-title" mode="expand-gentext" priority="2">
    <xsl:call-template name="expand-gentext-numbering2"/>
  </xsl:template>
  
  <xsl:template match="pgblk/manual-title" mode="expand-gentext" priority="1">
    <xsl:call-template name="expand-gentext-numbering2"/>
  </xsl:template>
  
  <xsl:template match="manual-title" mode="expand-gentext" priority="0">    
    <xsl:call-template name="expand-gentext-expanded"/>
  </xsl:template>
  
  <xsl:template match="model" mode="expand-gentext" priority="0">
    <xsl:call-template name="expand-gentext">
      <xsl:with-param name="content"><_ufe:title-block><xsl:text>Model(s) </xsl:text></_ufe:title-block></xsl:with-param>
    </xsl:call-template>
  </xsl:template>
  
  <xsl:template match="module" mode="expand-gentext" priority="0">
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
  
  <xsl:template match="_ufe:not-applicable" mode="expand-gentext" priority="0">
    <xsl:call-template name="expand-gentext-ufe">
      <xsl:with-param name="content"><xsl:text>Not Applicable</xsl:text></xsl:with-param>
    </xsl:call-template>
  </xsl:template>
  
  <xsl:template match="ata-page-block//_sfe:BeforeOrAfterText//_ufe:npara-numbering" mode="expand-gentext" priority="2">
    <xsl:call-template name="expand-gentext-ufe-numbering"/>
  </xsl:template>
  
  <xsl:template match="page-block//_sfe:BeforeOrAfterText//_ufe:npara-numbering" mode="expand-gentext" priority="1">
    <xsl:call-template name="expand-gentext-ufe-numbering"/>
  </xsl:template>
  
  <xsl:template match="num-index" mode="expand-gentext" priority="0">
    <xsl:call-template name="expand-gentext">
      <xsl:with-param name="content"><_ufe:num-index-title/></xsl:with-param>
    </xsl:call-template>
  </xsl:template>
  
  <xsl:template match="pgblk/_ufe:num-index-title" mode="expand-gentext" priority="3">
    <xsl:call-template name="expand-gentext-ufe-numbering2"/>
  </xsl:template>
  
  <xsl:template match="pbfmatr/_ufe:num-index-title" mode="expand-gentext" priority="2">
    <xsl:call-template name="expand-gentext-ufe-numbering2"/>
  </xsl:template>
  
  <xsl:template match="pwcspblist/_ufe:num-index-title" mode="expand-gentext" priority="1">
    <xsl:call-template name="expand-gentext-ufe-numbering2"/>
  </xsl:template>
  
  <xsl:template match="_ufe:num-index-title" mode="expand-gentext" priority="0">
    <xsl:call-template name="expand-gentext-ufe">
      <xsl:with-param name="content">NUMERICAL INDEX</xsl:with-param>
    </xsl:call-template>
  </xsl:template>
  
  <xsl:template match="pgblk/_ufe:nut-option-title" mode="expand-gentext" priority="3">
    <xsl:call-template name="expand-gentext-ufe-numbering2"/>
  </xsl:template>
  
  <xsl:template match="pbfmatr/_ufe:nut-option-title" mode="expand-gentext" priority="2">
    <xsl:call-template name="expand-gentext-ufe-numbering2"/>
  </xsl:template>
  
  <xsl:template match="pwcspblist/_ufe:nut-option-title" mode="expand-gentext" priority="1">
    <xsl:call-template name="expand-gentext-ufe-numbering2"/>
  </xsl:template>
  
  <xsl:template match="_ufe:nut-option-title" mode="expand-gentext" priority="0">
    <xsl:call-template name="expand-gentext-ufe">
      <xsl:with-param name="content">NUT OPTIONS</xsl:with-param>
    </xsl:call-template>
  </xsl:template>
  
  <xsl:template match="orig-date" mode="expand-gentext" priority="0">
    <xsl:call-template name="expand-gentext">
      <xsl:with-param name="content"><xsl:text>Original Issue date </xsl:text></xsl:with-param>
    </xsl:call-template>
  </xsl:template>
  
  <xsl:template match="book[contains(@doctype, 'epc')]//page-block[@pb-name='title-page']" mode="expand-gentext" priority="6">
    <xsl:call-template name="expand-gentext">
      <xsl:with-param name="content"><_ufe:eipc-title/></xsl:with-param>
    </xsl:call-template>
  </xsl:template>
  
  <xsl:template match="book[contains(@doctype, 'tmm')]//page-block[@pb-name='title-page']" mode="expand-gentext" priority="9">
    <xsl:call-template name="expand-gentext">
      <xsl:with-param name="content"><_ufe:tmm-title/></xsl:with-param>
    </xsl:call-template>
  </xsl:template>
  
  <xsl:template match="book[contains(@doctype, 'lmm')]//page-block[@pb-name='title-page']" mode="expand-gentext" priority="9">
    <xsl:call-template name="expand-gentext">
      <xsl:with-param name="content"><_ufe:tmm-title/></xsl:with-param>
    </xsl:call-template>
  </xsl:template>
  
  <xsl:template match="book[contains(@doctype, 'em')]//page-block[@pb-name='title-page']" mode="expand-gentext" priority="8">
    <xsl:call-template name="expand-gentext">
      <xsl:with-param name="content"><_ufe:em-title/></xsl:with-param>
    </xsl:call-template>
  </xsl:template>
  
  <xsl:template match="book[contains(@doctype, 'cir')]//page-block[@pb-name='title-page']" mode="expand-gentext" priority="7">
    <xsl:call-template name="expand-gentext">
      <xsl:with-param name="content"><_ufe:cir-title/></xsl:with-param>
    </xsl:call-template>
  </xsl:template>
  
  <xsl:template match="book[contains(@doctype, 'cir') or contains(@doctype, 'em')]//page-block[@pb-name='howtouse']" mode="expand-gentext" priority="5">
    <xsl:call-template name="expand-gentext">
      <xsl:with-param name="content"><_ufe:howtouse-title/></xsl:with-param>
    </xsl:call-template>
  </xsl:template>
  
  <xsl:template match="page-block[@pb-name='supp_list']" mode="expand-gentext" priority="4">
    <xsl:call-template name="expand-gentext">
      <xsl:with-param name="content">
        <_ufe:supplier-list-title/>
      </xsl:with-param>
    </xsl:call-template>
  </xsl:template>
  
  <xsl:template match="page-block[@pb-name='glossary']" mode="expand-gentext" priority="3">
    <xsl:call-template name="expand-gentext">
      <xsl:with-param name="content"><_ufe:glossary-title/></xsl:with-param>
    </xsl:call-template>
  </xsl:template>
  
  <xsl:template match="page-block[@pb-name='intro']" mode="expand-gentext" priority="2">
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
  
  <xsl:template match="page-block[@pb-name='nut_option']" mode="expand-gentext" priority="1">
    <xsl:call-template name="expand-gentext">
      <xsl:with-param name="content"><_ufe:nut-option-title/></xsl:with-param>
    </xsl:call-template>
  </xsl:template>
   
  <xsl:template match="subpara/subpara/subpara/subpara/subpara/subpara[not(title)]/para" mode="expand-gentext" priority="52">
    <xsl:call-template name="expand-gentext-default"/>
  </xsl:template>
  
  <xsl:template match="subpara/subpara/subpara/subpara/subpara[not(title)]/para" mode="expand-gentext" priority="51">
    <xsl:call-template name="expand-gentext-numbering2"/>
  </xsl:template>
  
  <xsl:template match="subpara/subpara/subpara/subpara[not(title)]/para" mode="expand-gentext" priority="50">
    <xsl:call-template name="expand-gentext-numbering2"/>
  </xsl:template>
  
  <xsl:template match="n-para/subpara/subpara[child::title]/para" mode="expand-gentext" priority="49">
    <xsl:call-template name="expand-gentext-default"/>
  </xsl:template>
  
  <xsl:template match="subpara/subpara/subpara[not(title)]/para" mode="expand-gentext" priority="48">
    <xsl:call-template name="expand-gentext-numbering5"/>
  </xsl:template>
  
  <xsl:template match="subpara/subpara[not(title)]/para" mode="expand-gentext" priority="47">
    <xsl:call-template name="expand-gentext-numbering5"/>
  </xsl:template>
  
  <xsl:template match="n-para/subpara[child::title]/para" mode="expand-gentext" priority="46">
    <xsl:call-template name="expand-gentext-default"/>
  </xsl:template>
  
  <xsl:template match="prcitem3/prcitem/para" mode="expand-gentext" priority="45">
    <xsl:call-template name="expand-gentext-default"/>
  </xsl:template>
  
  <xsl:template match="subpara/subpara/para" mode="expand-gentext" priority="44">
    <xsl:call-template name="expand-gentext-default"/>
  </xsl:template>
  
  <xsl:template match="n-para/subpara/para" mode="expand-gentext" priority="43">
    <xsl:call-template name="expand-gentext-numbering3"/>
  </xsl:template>
  
  <xsl:template match="book[contains(@doctype, 'cir')]//note/para" mode="expand-gentext" priority="42">
    <xsl:call-template name="expand-gentext-default"/>
  </xsl:template>
  
  <xsl:template match="pageblock-front/general//para" mode="expand-gentext" priority="40">
    <xsl:call-template name="expand-gentext-numbering5"/>
  </xsl:template>
  
  <xsl:template match="warning/para[1]" mode="expand-gentext" priority="40">
    <xsl:call-template name="expand-gentext-default"/>
  </xsl:template>
  
  <xsl:template match="caution/para[1]" mode="expand-gentext" priority="39">
    <xsl:call-template name="expand-gentext-default"/>
  </xsl:template>
  
  <xsl:template match="_ufe:step-proc-num/para[1]" mode="expand-gentext" priority="38">
    <xsl:call-template name="expand-gentext-default"/>
  </xsl:template>
  
  <xsl:template match="step5/para[1]" mode="expand-gentext" priority="37">
    <xsl:call-template name="expand-gentext-default"/>
  </xsl:template>
  
  <xsl:template match="step4/para[1]" mode="expand-gentext" priority="36">
    <xsl:call-template name="expand-gentext-default"/>
  </xsl:template>
  
  <xsl:template match="step3/para[1]" mode="expand-gentext" priority="35">
    <xsl:call-template name="expand-gentext-default"/>
  </xsl:template>
  
  <xsl:template match="step2/para[1]" mode="expand-gentext" priority="34">
    <xsl:call-template name="expand-gentext-default"/>
  </xsl:template>
  
  <xsl:template match="numlitem/para[1]" mode="expand-gentext" priority="33">
    <xsl:call-template name="expand-gentext-default"/>
  </xsl:template>
  
  <xsl:template match="note/para[1]" mode="expand-gentext" priority="32">
    <xsl:call-template name="expand-gentext-default"/>
  </xsl:template>
  
  <xsl:template match="unlitem/para[1]" mode="expand-gentext" priority="31">
    <xsl:call-template name="expand-gentext-default"/>
  </xsl:template>
  
  <xsl:template match="prcitem4/para[1]" mode="expand-gentext" priority="30">
    <xsl:call-template name="expand-gentext-default"/>
  </xsl:template>
  
  <xsl:template match="l4item/para[1]" mode="expand-gentext" priority="29">
    <xsl:call-template name="expand-gentext-default"/>
  </xsl:template>
  
  <xsl:template match="l3item/para[1]" mode="expand-gentext" priority="28">
    <xsl:call-template name="expand-gentext-default"/>
  </xsl:template>
  
  <xsl:template match="l2item/para[1]" mode="expand-gentext" priority="27">
    <xsl:call-template name="expand-gentext-default"/>
  </xsl:template>
  
  <xsl:template match="l1item/para[1]" mode="expand-gentext" priority="26">
    <xsl:call-template name="expand-gentext-default"/>
  </xsl:template>
  
  <xsl:template match="step/para[1]" mode="expand-gentext" priority="25">
    <xsl:call-template name="expand-gentext-default"/>
  </xsl:template>
  
  <xsl:template match="item/para[1]" mode="expand-gentext" priority="24">
    <xsl:call-template name="expand-gentext-default"/>
  </xsl:template>
  
  <xsl:template match="n-para[ancestor::book[contains(@doctype, 'epc')]]/para" mode="expand-gentext" priority="18">
    <xsl:call-template name="expand-gentext-numbering5"/>
  </xsl:template>
  
  <xsl:template match="_ufe:step-proc-num/para[position()&gt;1]" mode="expand-gentext" priority="22">
    <xsl:call-template name="expand-gentext-default"/>
  </xsl:template>
  
  <xsl:template match="step5/para[position()&gt;1]" mode="expand-gentext" priority="21">
    <xsl:call-template name="expand-gentext-default"/>
  </xsl:template>
  
  <xsl:template match="step4/para[position()&gt;1]" mode="expand-gentext" priority="20">
    <xsl:call-template name="expand-gentext-default"/>
  </xsl:template>
  
  <xsl:template match="step3/para[position()&gt;1]" mode="expand-gentext" priority="19">
    <xsl:call-template name="expand-gentext-default"/>
  </xsl:template>
  
  <xsl:template match="step2/para[position()&gt;1]" mode="expand-gentext" priority="18">
    <xsl:call-template name="expand-gentext-default"/>
  </xsl:template>
  
  <xsl:template match="numlitem/para[position()&gt;1]" mode="expand-gentext" priority="17">
    <xsl:call-template name="expand-gentext-default"/>
  </xsl:template>
  
  <xsl:template match="unlitem/para[position()&gt;1]" mode="expand-gentext" priority="16">
    <xsl:call-template name="expand-gentext-default"/>
  </xsl:template>
  
  <xsl:template match="prcitem4/para[position()&gt;1]" mode="expand-gentext" priority="15">
    <xsl:call-template name="expand-gentext-default"/>
  </xsl:template>
  
  <xsl:template match="l4item/para[position()&gt;1]" mode="expand-gentext" priority="14">
    <xsl:call-template name="expand-gentext-default"/>
  </xsl:template>
  
  <xsl:template match="l3item/para[position()&gt;1]" mode="expand-gentext" priority="13">
    <xsl:call-template name="expand-gentext-default"/>
  </xsl:template>
  
  <xsl:template match="l2item/para[position()&gt;1]" mode="expand-gentext" priority="12">
    <xsl:call-template name="expand-gentext-default"/>
  </xsl:template>
  
  <xsl:template match="l1item/para[position()&gt;1]" mode="expand-gentext" priority="11">
    <xsl:call-template name="expand-gentext-default"/>
  </xsl:template>
  
  <xsl:template match="step/para[position()&gt;1]" mode="expand-gentext" priority="10">
    <xsl:call-template name="expand-gentext-default"/>
  </xsl:template>
  
  <xsl:template match="item/para[position()&gt;1]" mode="expand-gentext" priority="9">
    <xsl:call-template name="expand-gentext-default"/>
  </xsl:template>
  
  <xsl:template match="taskproc/para" mode="expand-gentext" priority="7">
    <xsl:call-template name="expand-gentext-numbering5"/>
  </xsl:template>
  
  <xsl:template match="title-page/para" mode="expand-gentext" priority="7">
    <xsl:call-template name="expand-gentext-default"/>
  </xsl:template>
  
  <xsl:template match="numlitem/para" mode="expand-gentext" priority="6">
    <xsl:call-template name="expand-gentext-default"/>
  </xsl:template>
  
  <xsl:template match="tprereq/para" mode="expand-gentext" priority="4">
    <xsl:call-template name="expand-gentext-numbering5"/>
  </xsl:template>
  
  <xsl:template match="sbnbr/para" mode="expand-gentext" priority="4">
    <xsl:call-template name="expand-gentext-default"/>
  </xsl:template>
  
  <xsl:template match="n-para/para" mode="expand-gentext" priority="3">
    <xsl:call-template name="expand-gentext-default"/>
  </xsl:template>
  
  <xsl:template match="subpara/para" mode="expand-gentext" priority="2">
    <xsl:call-template name="expand-gentext-default"/>
  </xsl:template>
  
  <xsl:template match="nomen-col//para" mode="expand-gentext" priority="1">
    <xsl:call-template name="expand-gentext-default"/>
  </xsl:template>
    
  <xsl:template match="numlist/part-group" mode="expand-gentext" priority="2">
    <xsl:call-template name="expand-gentext-numbering"/>
  </xsl:template>
  
  <xsl:template match="pgblk/_ufe:pdlist-title" mode="expand-gentext" priority="1">
    <xsl:call-template name="expand-gentext-pgblk-ufe-title"/>
  </xsl:template>
  
  <xsl:template match="_ufe:pdlist-title" mode="expand-gentext" priority="0">
    <xsl:call-template name="expand-gentext-ufe">
      <xsl:with-param name="content">PARTS DIGEST LIST</xsl:with-param>
    </xsl:call-template>
  </xsl:template>
    
  <xsl:template match="postal" mode="expand-gentext" priority="0">
    <xsl:call-template name="expand-gentext2">
      <xsl:with-param name="content"><xsl:text>&#xa0;</xsl:text></xsl:with-param>
    </xsl:call-template>
  </xsl:template>
  
  <xsl:template match="postsb" mode="expand-gentext" priority="0">
    <xsl:call-template name="expand-gentext">
      <xsl:with-param name="content"><xsl:text>Post-SB</xsl:text></xsl:with-param>
    </xsl:call-template>
  </xsl:template>
    
  <xsl:template match="presb" mode="expand-gentext" priority="0">
    <xsl:call-template name="expand-gentext">
      <xsl:with-param name="content"><xsl:text>Pre-SB</xsl:text></xsl:with-param>
    </xsl:call-template>
  </xsl:template>
    
  <xsl:template match="_ufe:proprietary-notice" mode="expand-gentext" priority="0">
    <xsl:call-template name="expand-gentext-ufe">
      <xsl:with-param name="content">
        <_ufe:proprietary-warning/>
        <_ufe:block-prespace>
          <xsl:text>This manual contains proprietary information of Pratt &amp; Whitney Canada Corp. ("P&amp;WC"), which P&amp;WC provides in confidence and solely for the purposes of supporting engine certification and providing applicable information regarding the proper use, maintenance, inspection, repair, servicing, and parts application of P&amp;WC products and services, as directed therein. Neither this manual nor any information in it may be disclosed to others, or used for any other purpose, including, without, limitation, to design, create, develop, reproduce, manufacture or derive any design, part, product, material, process, modification, configuration change or repair, or obtain FAA or other government approval to do so. Possession and use of this manual is also subject to the restrictions set out in P&amp;WC's Technical Data Agreement (a copy of which may be obtained by contacting P&amp;WC Technical Publications). The contents of this manual may be subject to export control laws. Unauthorized export or re-export of the manual, or parts thereof, is prohibited. By accepting and possessing this manual, you agree to be bound by the foregoing terms.</xsl:text>
        </_ufe:block-prespace>
        <_ufe:block-prespace>
          <xsl:text>If a Government agency or department intends to disclose any information, written notice should be given to: VP - Legal Services, Pratt &amp; Whitney Canada Corp., 1000 Marie-Victorin (01BE5), Longueuil, Quebec J4G 1A1.</xsl:text>
        </_ufe:block-prespace>
      </xsl:with-param>
    </xsl:call-template>
  </xsl:template>
  
  <xsl:template match="_ufe:proprietary-warning" mode="expand-gentext" priority="0">
    <xsl:call-template name="expand-gentext-ufe">
      <xsl:with-param name="content">
        <xsl:text>WARNING - PROPRIETARY RIGHTS &amp; EXPORT CONTROLS NOTICE</xsl:text>
      </xsl:with-param>
    </xsl:call-template>
  </xsl:template>
    
  <xsl:template match="qty[ancestor::book[contains(@doctype,'ipc')]]" mode="expand-gentext" priority="1">
    <xsl:call-template name="expand-gentext">
      <xsl:with-param name="content">
        <xsl:choose>
          <xsl:when test="(@per-assy and string(@per-assy)='TEXT') or (@per-assy and string(@per-assy)='EMPTY')"/>
          <xsl:otherwise>
            <xsl:value-of select="@per-assy"/>
          </xsl:otherwise>
        </xsl:choose>
      </xsl:with-param>
    </xsl:call-template>
  </xsl:template>
    
  <xsl:template match="address/ref" mode="expand-gentext" priority="1">
    <xsl:call-template name="expand-gentext">
      <xsl:with-param name="content"><xsl:text>REF: </xsl:text></xsl:with-param>
    </xsl:call-template>
  </xsl:template>
  
  <xsl:template match="refint[ancestor::book[contains(@doctype, 'epc')]]" mode="expand-gentext" priority="2">
    <xsl:call-template name="expand-gentext">
      <xsl:with-param name="content">
        <_ufe:refint-link>
          <xsl:if test="string(./@refloc)">
            <xsl:attribute name="ref">
              <xsl:value-of select="string(./@refloc)"/>
            </xsl:attribute>
          </xsl:if>
          <xsl:if test="string(.)">
            <xsl:attribute name="content">
              <xsl:value-of select="string(.)"/>
            </xsl:attribute>
          </xsl:if>
        </_ufe:refint-link>
      </xsl:with-param>
    </xsl:call-template>
  </xsl:template>
  
  <xsl:template match="refint[ancestor::book[contains(@doctype, 'cir') or contains(@doctype, 'em')]]" mode="expand-gentext" priority="1">
    <xsl:call-template name="expand-gentext">
      <xsl:with-param name="content">
        <_ufe:refint-link>
          <xsl:if test="string(./@refid)">
            <xsl:attribute name="ref">
              <xsl:value-of select="string(./@refid)"/>
            </xsl:attribute>
          </xsl:if>
          <xsl:if test="concat(string(.), string(./@post-auto-text))">
            <xsl:attribute name="content">
              <xsl:value-of select="concat(string(.), string(./@post-auto-text))"/>
            </xsl:attribute>
          </xsl:if>
        </_ufe:refint-link>
      </xsl:with-param>
    </xsl:call-template>
  </xsl:template>
  
  <xsl:template match="refint" mode="expand-gentext" priority="0">
    <xsl:call-template name="expand-gentext">
      <xsl:with-param name="content">
        <xsl:choose>
          <xsl:when test="@refid">
            <_ufe:refint-link>
              <xsl:if test="string(./@refid)">
                <xsl:attribute name="ref">
                  <xsl:value-of select="string(./@refid)"/>
                </xsl:attribute>
              </xsl:if>
              <xsl:if test="string(.)">
                <xsl:attribute name="content">
                  <xsl:value-of select="string(.)"/>
                </xsl:attribute>
              </xsl:if>
            </_ufe:refint-link>
          </xsl:when>
          <xsl:otherwise>
            <_ufe:refint-link>
              <xsl:if test="string(./@ref)">
                <xsl:attribute name="ref">
                  <xsl:value-of select="string(./@ref)"/>
                </xsl:attribute>
              </xsl:if>
              <xsl:if test="string(.)">
                <xsl:attribute name="content">
                  <xsl:value-of select="string(.)"/>
                </xsl:attribute>
              </xsl:if>
            </_ufe:refint-link>            
          </xsl:otherwise>
        </xsl:choose>
      </xsl:with-param>
    </xsl:call-template>
  </xsl:template>
  
  <xsl:template match="_ufe:refint-link" mode="expand-gentext" priority="0">
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
  
  <xsl:template match="sb" mode="expand-gentext" priority="0">
    <xsl:call-template name="expand-gentext">
      <xsl:with-param name="content"><xsl:text>SB</xsl:text></xsl:with-param>
    </xsl:call-template>
  </xsl:template>
    
  <xsl:template match="pgblk/_ufe:sblist-title" mode="expand-gentext" priority="2">
    <xsl:call-template name="expand-gentext-pgblk-ufe-title"/>
  </xsl:template>
  
  <xsl:template match="pbfmatr/_ufe:sblist-title" mode="expand-gentext" priority="1">
    <xsl:call-template name="expand-gentext-pgblk-ufe-title"/>
  </xsl:template>
  
  <xsl:template match="_ufe:sblist-title" mode="expand-gentext" priority="0">
    <xsl:call-template name="expand-gentext-ufe">
      <xsl:with-param name="content">SERVICE BULLETIN LIST</xsl:with-param>
    </xsl:call-template>
  </xsl:template>
  
  <xsl:template match="pgblk/_ufe:spblist-title" mode="expand-gentext" priority="2">
    <xsl:call-template name="expand-gentext-pgblk-ufe-title"/>
  </xsl:template>
  
  <xsl:template match="pbfmatr/_ufe:spblist-title" mode="expand-gentext" priority="1">
    <xsl:call-template name="expand-gentext-pgblk-ufe-title"/>
  </xsl:template>
  
  <xsl:template match="_ufe:spblist-title" mode="expand-gentext" priority="0">
    <xsl:call-template name="expand-gentext-ufe">
      <xsl:with-param name="content">SPARE PARTS BULLETIN LIST</xsl:with-param>
    </xsl:call-template>
  </xsl:template>
  
  <xsl:template match="pgblk/_ufe:spectools-title" mode="expand-gentext" priority="5">
    <xsl:call-template name="expand-gentext-pgblk-ufe-title"/>
  </xsl:template>
  
  <xsl:template match="pbfmatr/_ufe:spectools-title" mode="expand-gentext" priority="4">
    <xsl:call-template name="expand-gentext-pgblk-ufe-title"/>
  </xsl:template>
  
  <xsl:template match="pwcspblist/_ufe:spectools-title" mode="expand-gentext" priority="3">
    <xsl:call-template name="expand-gentext-pgblk-ufe-title"/>
  </xsl:template>
  
  <xsl:template match="page-block//special-tools//_ufe:spectools-title" mode="expand-gentext" priority="2">
    <xsl:call-template name="expand-gentext-ufe">
      <xsl:with-param name="content">
        <xsl:call-template name="t-styler-numbering-ufe"/>
        <xsl:text>&#xa0;</xsl:text>
        <xsl:text>&#xa0;</xsl:text>
        <span style="text-decoration: underline; ">
          <xsl:text>Special Tools</xsl:text>
        </span>
      </xsl:with-param>
    </xsl:call-template>    
  </xsl:template>
  
  <xsl:template match="ata-page-block//special-tools//_ufe:spectools-title" mode="expand-gentext" priority="1">
    <xsl:call-template name="expand-gentext-ufe">
      <xsl:with-param name="content">
        <xsl:call-template name="t-styler-numbering-ufe"/>
        <xsl:text>&#xa0;</xsl:text>
        <xsl:text>&#xa0;</xsl:text>
        <span style="text-decoration: underline; ">
          <xsl:text>Special Tools</xsl:text>
        </span>
      </xsl:with-param>
    </xsl:call-template>
  </xsl:template>
  
  <xsl:template match="_ufe:spectools-title" mode="expand-gentext" priority="0">
    <xsl:call-template name="expand-gentext-default"/>
  </xsl:template>
  
  <xsl:template match="sqrt" mode="expand-gentext" priority="0">
    <xsl:call-template name="expand-gentext">
      <xsl:with-param name="content"><xsl:text>√</xsl:text></xsl:with-param>
    </xsl:call-template>
  </xsl:template>
  
  <xsl:template match="state" mode="expand-gentext" priority="0">
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
  
  <xsl:template match="pgblk/_ufe:supplier-list-title" mode="expand-gentext" priority="3">
    <xsl:call-template name="expand-gentext-pgblk-ufe-title"/>
  </xsl:template>
  
  <xsl:template match="pbfmatr/_ufe:supplier-list-title" mode="expand-gentext" priority="2">
    <xsl:call-template name="expand-gentext-pgblk-ufe-title"/>
  </xsl:template>
  
  <xsl:template match="pwcspblist/_ufe:supplier-list-title" mode="expand-gentext" priority="1">
    <xsl:call-template name="expand-gentext-pgblk-ufe-title"/>
  </xsl:template>
  
  <xsl:template match="_ufe:supplier-list-title" mode="expand-gentext" priority="0">
    <xsl:call-template name="expand-gentext-ufe">
      <xsl:with-param name="content">SUPPLIER LIST</xsl:with-param>
    </xsl:call-template>
  </xsl:template>
  
  <xsl:template match="table[@display='expand']" mode="expand-gentext" priority="13">
    <xsl:call-template name="expand-gentext-default"/>
  </xsl:template>
  
  <xsl:template match="table[not(title) and not(@tabstyle='frac')]" mode="expand-gentext" priority="12">
    <xsl:call-template name="expand-gentext-default"/>
  </xsl:template>
  
  <xsl:template match="sheet/gdesc/table" mode="expand-gentext" priority="7">
    <xsl:call-template name="expand-gentext-default"/>
  </xsl:template>
  
  <xsl:template match="highlights/table" mode="expand-gentext" priority="10">
    <xsl:call-template name="expand-gentext-default"/>
  </xsl:template>
  
  <xsl:template match="figure/table" mode="expand-gentext" priority="6">
    <xsl:call-template name="expand-gentext-default"/>
  </xsl:template>
  
  <xsl:template match="mfmatr//table" mode="expand-gentext" priority="7">
    <xsl:call-template name="expand-gentext-default"/>
  </xsl:template>
  
  <xsl:template match="table[@tabstyle='eqn' and @display='inline']" mode="expand-gentext" priority="5">
    <xsl:call-template name="expand-gentext-default"/>
  </xsl:template>
  
  <xsl:template match="table[@tabstyle='IPCDET']" mode="expand-gentext" priority="5">
    <xsl:call-template name="expand-gentext-default"/>
  </xsl:template>
  
  <xsl:template match="table[@tabstyle='frac' and parent::item]" mode="expand-gentext" priority="3">
    <xsl:call-template name="expand-gentext-default"/>
  </xsl:template>
  
  <xsl:template match="table[@tabstyle='frac' and (parent::step1 or parent::step2 or parent::step3 or parent::step4 or parent::step5)]" mode="expand-gentext" priority="1">
    <xsl:call-template name="expand-gentext-default"/>
  </xsl:template>
  
  <xsl:template match="table[@tabstyle='frac']" mode="expand-gentext" priority="3">
    <xsl:call-template name="expand-gentext-default"/>
  </xsl:template>
  
  <xsl:template match="table[@tabstyle='eqn']" mode="expand-gentext" priority="1">
    <xsl:call-template name="expand-gentext-default"/>
  </xsl:template>
  
  <xsl:template match="table" mode="expand-gentext" priority="0">
    <xsl:call-template name="expand-gentext">
      <xsl:with-param name="content">
        <xsl:if test="(@tabstyle and string(@tabstyle)='general') or
          (@tabstyle and string(@tabstyle)='consumables') or 
          (@tabstyle and string(@tabstyle)='special-tools') or 
          (@tabstyle and string(@tabstyle)='fixtures-and-equipment')">
          <_ufe:npara-numbering/>
        </xsl:if>
      </xsl:with-param>
    </xsl:call-template>
  </xsl:template>
  
  <xsl:template match="pgblk/_ufe:task-title" mode="expand-gentext" priority="3">
    <xsl:call-template name="expand-gentext-pgblk-ufe-title"/>
  </xsl:template>
  
  <xsl:template match="pbfmatr/_ufe:task-title" mode="expand-gentext" priority="2">
    <xsl:call-template name="expand-gentext-pgblk-ufe-title"/>
  </xsl:template>
  
  <xsl:template match="pbfmatr//_ufe:task-title" mode="expand-gentext" priority="1">
    <xsl:call-template name="expand-gentext-ufe">
      <xsl:with-param name="content">
        <xsl:call-template name="t-styler-numbering-ufe"/>
        <xsl:text>&#xa0;</xsl:text>
        <xsl:text>&#xa0;</xsl:text>
      </xsl:with-param>
    </xsl:call-template>
  </xsl:template>
  
  <xsl:template match="_ufe:task-title" mode="expand-gentext" priority="0">
    <xsl:call-template name="expand-gentext-default"/>
  </xsl:template>
  
  <xsl:template match="address/tel[1]" mode="expand-gentext" priority="2">
    <xsl:call-template name="expand-gentext">
      <xsl:with-param name="content"><xsl:text>TEL: </xsl:text></xsl:with-param>
    </xsl:call-template>
  </xsl:template>
  
  <xsl:template match="pgblk/_ufe:temp-rev-title" mode="expand-gentext" priority="2">
    <xsl:call-template name="expand-gentext-pgblk-ufe-title"/>
  </xsl:template>
  
  <xsl:template match="pbfmatr/_ufe:temp-rev-title" mode="expand-gentext" priority="1">
    <xsl:call-template name="expand-gentext-pgblk-ufe-title"/>
  </xsl:template>
  
  <xsl:template match="_ufe:temp-rev-title" mode="expand-gentext" priority="0">
    <xsl:call-template name="expand-gentext-ufe">
      <xsl:with-param name="content">TEMPORARY REVISION INDEX</xsl:with-param>
    </xsl:call-template>
  </xsl:template>
  
  <xsl:template match="deflist/term" mode="expand-gentext" priority="1">
    <xsl:call-template name="expand-gentext2">
      <xsl:with-param name="content"><xsl:text>     </xsl:text></xsl:with-param>
    </xsl:call-template>
  </xsl:template>
    
  <xsl:template match="subpara/subpara/subpara/subpara/subpara/title" mode="expand-gentext" priority="72">
    <xsl:call-template name="expand-gentext-numbering2"/>
  </xsl:template>
  
  <xsl:template match="subpara/subpara/subpara/subpara/title" mode="expand-gentext" priority="71">
    <xsl:call-template name="expand-gentext-numbering2"/>
  </xsl:template>
  
  <xsl:template match="subpara/subpara/subpara/title" mode="expand-gentext" priority="70">
    <xsl:call-template name="expand-gentext-numbering5"/>
  </xsl:template>
  
  <xsl:template match="book[contains(@doctype, 'epc')]/frontmatter//graphic/title" mode="expand-gentext" priority="69">
    <xsl:call-template name="expand-gentext">
      <xsl:with-param name="content"><xsl:text>Figure </xsl:text><xsl:call-template name="t-styler-numbering"/><xsl:text>&#xa0;</xsl:text></xsl:with-param>
    </xsl:call-template>
  </xsl:template>
  
  <xsl:template match="book[contains(@doctype, 'ipc')]/frontmatter//figure/title" mode="expand-gentext" priority="68">
    <xsl:call-template name="expand-gentext">
      <xsl:with-param name="content"><xsl:text>Figure </xsl:text><xsl:call-template name="t-styler-numbering"/><xsl:text>&#xa0;</xsl:text></xsl:with-param>
    </xsl:call-template>
  </xsl:template>
  
  <xsl:template match="ata-page-block//task/graphic/title" mode="expand-gentext" priority="67">
    <xsl:call-template name="expand-gentext3">
      <xsl:with-param name="content-before">
        <xsl:text>Figure </xsl:text>
        <xsl:call-template name="t-styler-numbering"/>
        <xsl:text>&#xa0;</xsl:text>        
      </xsl:with-param>
      <xsl:with-param name="content-after">
        <xsl:variable name="task" select="ancestor-or-self::task[1]"/>
        <xsl:variable name="pre" select="concat(' (Task ', $task/@chapnbr, '-', $task/@sectnbr, '-', $task/@subjnbr, '-', $task/@func, '-', $task/@seq)"/>
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
  
  <xsl:template match="page-block//task/graphic/title" mode="expand-gentext" priority="66">
    <xsl:call-template name="expand-gentext3">
      <xsl:with-param name="content-before">
        <xsl:text>Figure </xsl:text>
        <xsl:call-template name="t-styler-numbering"/>
        <xsl:text>&#xa0;</xsl:text>        
      </xsl:with-param>
      <xsl:with-param name="content-after">
        <xsl:variable name="task" select="ancestor-or-self::task[1]"/>
        <xsl:variable name="pre" select="concat(' (Task ', $task/@chapnbr, '-', $task/@sectnbr, '-', $task/@subjnbr, '-', $task/@func, '-', $task/@seq)"/>
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
  
  <xsl:template match="page-block[@pb-name='glossary']/module/title" mode="expand-gentext" priority="61">
    <xsl:call-template name="expand-gentext-numbering4"/>
  </xsl:template>
  
  <xsl:template match="page-block[@pb-name='supp_list']/module/title" mode="expand-gentext" priority="60">
    <xsl:call-template name="expand-gentext-numbering4"/>   
  </xsl:template>
  
  <xsl:template match="mm-fits/subpara/title" mode="expand-gentext" priority="62">
    <xsl:call-template name="expand-gentext-numbering5"/>
  </xsl:template>
  
  <xsl:template match="prcitem4/prcitem/title" mode="expand-gentext" priority="60">
    <xsl:call-template name="expand-gentext-numbering4"/>
  </xsl:template>
  
  <xsl:template match="prcitem3/prcitem/title" mode="expand-gentext" priority="60">
    <xsl:call-template name="expand-gentext-numbering5"/>
  </xsl:template>
  
  <xsl:template match="prcitem2/prcitem/title" mode="expand-gentext" priority="59">
    <xsl:call-template name="expand-gentext-numbering5"/>
  </xsl:template>
  
  <xsl:template match="prcitem1/prcitem/title" mode="expand-gentext" priority="55">
    <xsl:call-template name="expand-gentext-numbering4"/>
  </xsl:template>
  
  <xsl:template match="subpara/subpara/title" mode="expand-gentext" priority="57">
    <xsl:call-template name="expand-gentext-numbering5"/>
  </xsl:template>
  
  <xsl:template match="book[contains(@doctype, 'epc')]//figure/title" mode="expand-gentext" priority="54">
    <xsl:call-template name="expand-gentext">
      <xsl:with-param name="content"><xsl:text>Figure </xsl:text><xsl:value-of select="ancestor-or-self::figure[1]/@fignbr"/><xsl:text> </xsl:text></xsl:with-param>
    </xsl:call-template>
  </xsl:template>
  
  <xsl:template match="book[contains(@doctype, 'epc')]//graphic/title" mode="expand-gentext" priority="53">
    <xsl:call-template name="expand-gentext">
      <xsl:with-param name="content"><xsl:text>Figure </xsl:text><xsl:value-of select="ancestor-or-self::figure[1]/@fignbr"/><xsl:text> </xsl:text></xsl:with-param>
    </xsl:call-template>
  </xsl:template>
  
  <xsl:template match="book[contains(@doctype, 'ipc')]//figure/title" mode="expand-gentext" priority="52">
    <xsl:call-template name="expand-gentext">
      <xsl:with-param name="content">
        <xsl:text>Figure </xsl:text>
        <xsl:if test="(ancestor-or-self::figure[1]//figno)[1]/*|(ancestor-or-self::figure[1]//figno)[1]/text()|(ancestor-or-self::figure[1]//figno)[1]/processing-instruction()">
          <_gte:Gentexted-Content-Wrapper>
            <xsl:apply-templates mode="expand-gentext" select="(ancestor-or-self::figure[1]//figno)[1]/*|(ancestor-or-self::figure[1]//figno)[1]/text()|(ancestor-or-self::figure[1]//figno)[1]/processing-instruction()">
              <xsl:with-param name="skip-expanded-gentext" select="'yes'"/>
            </xsl:apply-templates>
          </_gte:Gentexted-Content-Wrapper>
        </xsl:if>
        <xsl:text> </xsl:text>
      </xsl:with-param>
    </xsl:call-template>    
  </xsl:template>
  
  <xsl:template match="task//table/title" mode="expand-gentext" priority="51">
    <xsl:call-template name="expand-gentext3">
      <xsl:with-param name="content-before">
        <xsl:choose>
          <xsl:when test="../@display='expand'">
            <xsl:text>Table </xsl:text>
            <xsl:call-template name="t-styler-numbering"/>
            <xsl:text>&#xa0;</xsl:text>
          </xsl:when>
          <xsl:otherwise>
            <_ufe:hidden>
              <xsl:text>Table </xsl:text>
              <xsl:call-template name="t-styler-numbering"/>
            </_ufe:hidden>
            <xsl:text>&#xa0;</xsl:text>
          </xsl:otherwise>
        </xsl:choose>
      </xsl:with-param>
      <xsl:with-param name="content-after">
        <xsl:variable name="task" select="ancestor-or-self::task[1]"/>
        <xsl:variable name="pre" select="concat(' (Task ', $task/@chapnbr, '-', $task/@sectnbr, '-', $task/@subjnbr, '-', $task/@func, '-', $task/@seq)"/>
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
  
  <xsl:template match="page-block//graphic/title" mode="expand-gentext" priority="50">
    <xsl:call-template name="expand-gentext">
      <xsl:with-param name="content">
        <xsl:text>Figure </xsl:text>
        <xsl:call-template name="t-styler-numbering"/>
        <xsl:text>&#xa0;</xsl:text>
      </xsl:with-param>
    </xsl:call-template>
  </xsl:template>
  
  <xsl:template match="ata-page-block//graphic/title" mode="expand-gentext" priority="49">
    <xsl:call-template name="expand-gentext">
      <xsl:with-param name="content">
        <xsl:text>Figure </xsl:text>
        <xsl:call-template name="t-styler-numbering"/>
        <xsl:text>&#xa0;</xsl:text>
      </xsl:with-param>
    </xsl:call-template>
  </xsl:template>
  
  <xsl:template match="page-block//mm-fits/title" mode="expand-gentext" priority="47">
    <xsl:call-template name="expand-gentext-numbering4"/>
  </xsl:template>
  
  <xsl:template match="ata-page-block//mm-fits/title" mode="expand-gentext" priority="46">
    <xsl:call-template name="expand-gentext-numbering4"/>
  </xsl:template>
  
  <xsl:template match="ata-page-block//fits-and-clears/title" mode="expand-gentext" priority="46">
    <xsl:call-template name="expand-gentext-numbering5"/>
  </xsl:template>
  
  <xsl:template match="page-block//fits-and-clears/title" mode="expand-gentext" priority="45">
    <xsl:call-template name="expand-gentext-numbering5"/>
  </xsl:template>
  
  <xsl:template match="ata-page-block//n-para/title" mode="expand-gentext" priority="43">
    <xsl:call-template name="expand-gentext-numbering4"/>
  </xsl:template>
  
  <xsl:template match="page-block//n-para/title" mode="expand-gentext" priority="42">
    <xsl:call-template name="expand-gentext-numbering4"/>
  </xsl:template>
  
  <xsl:template match="mfmatr/title" mode="expand-gentext" priority="42">
    <xsl:call-template name="expand-gentext-default"/>
  </xsl:template>
      
  <xsl:template match="figure/title" mode="expand-gentext" priority="41">
    <xsl:call-template name="expand-gentext">
      <xsl:with-param name="content">
        <xsl:choose>
          <xsl:when test="&pb-01;"/>
          <xsl:when test="&pb-02; or &pb-03; or &pb-04; or &pb-05; or &pb-06; or &pb-07; or &pb-08; or &pb-09; or 
                          &pb-10; or &pb-11; or &pb-12; or &pb-13; or &pb-14; or &pb-15; or &pb-16; or &pb-17; or &pb-18;">
            <xsl:text>Figure </xsl:text>
            <xsl:call-template name="t-styler-numbering"/>
            <xsl:text>&#xa0;</xsl:text>
          </xsl:when>
        </xsl:choose>
      </xsl:with-param>
    </xsl:call-template>
  </xsl:template>
  
  <xsl:template match="subpara/title" mode="expand-gentext" priority="38">
    <xsl:call-template name="expand-gentext-numbering5"/>
  </xsl:template>
  
  <xsl:template match="procedure/title" mode="expand-gentext" priority="37">
    <xsl:call-template name="expand-gentext">
      <xsl:with-param name="content">
        <xsl:choose>
          <xsl:when test="(ancestor-or-self::table[1]/@role and string(ancestor-or-self::table[1]/@role)='torque-and-stretch') or (ancestor-or-self::table[1]/@role and string(ancestor-or-self::table[1]/@role)='spec-assem')"/>
          <xsl:otherwise>
            <xsl:call-template name="t-styler-numbering"/>
            <xsl:text>&#xa0;</xsl:text>
            <xsl:text>&#xa0;</xsl:text>
          </xsl:otherwise>
        </xsl:choose>
      </xsl:with-param>
    </xsl:call-template>
  </xsl:template>
  
  <xsl:template match="taskproc/title" mode="expand-gentext" priority="34">
    <xsl:call-template name="expand-gentext-numbering5"/>
  </xsl:template>
  
  <xsl:template match="nutopt/title" mode="expand-gentext" priority="32">
    <xsl:call-template name="expand-gentext-numbering4"/>
  </xsl:template>
  
  <xsl:template match="pgblk/title" mode="expand-gentext" priority="29">
    <xsl:call-template name="expand-gentext"/>
  </xsl:template>
  
  <xsl:template match="pwcchapsect-item/title" mode="expand-gentext" priority="28">
    <xsl:call-template name="expand-gentext-expanded"/>
  </xsl:template>
  
  <xsl:template match="tprereq/title" mode="expand-gentext" priority="27">
    <xsl:call-template name="expand-gentext-numbering5"/>
  </xsl:template>
  
  <xsl:template match="subtask/title" mode="expand-gentext" priority="26">
    <xsl:call-template name="expand-gentext-numbering5"/>
  </xsl:template>
  
  <xsl:template match="fits/title" mode="expand-gentext" priority="25">
    <xsl:call-template name="expand-gentext-expanded"/>
  </xsl:template>
  
  <xsl:template match="task/title" mode="expand-gentext" priority="24">
    <xsl:call-template name="expand-gentext-numbering4"/>
  </xsl:template>
  
  <xsl:template match="howtouse/title" mode="expand-gentext" priority="23">
    <xsl:call-template name="expand-gentext-default"/>
  </xsl:template>
  
  <xsl:template match="highlights/title" mode="expand-gentext" priority="22">
    <xsl:call-template name="expand-gentext-expanded"/>
  </xsl:template>
  
  <xsl:template match="lot-item/title" mode="expand-gentext" priority="20">
    <xsl:call-template name="expand-gentext-default"/>
  </xsl:template>
  
  <xsl:template match="lot/title" mode="expand-gentext" priority="19">
    <xsl:call-template name="expand-gentext-expanded"/>
  </xsl:template>
  
  <xsl:template match="table//procedure//title" mode="expand-gentext" priority="17">
    <xsl:call-template name="expand-gentext-default"/>
  </xsl:template>
  
  <xsl:template match="torque-and-stretch/title" mode="expand-gentext" priority="16">
    <xsl:call-template name="expand-gentext-default"/>
  </xsl:template>
  
  <xsl:template match="spec-tool-table/title" mode="expand-gentext" priority="15">
    <xsl:call-template name="expand-gentext-numbering3"/>
  </xsl:template>
  
  <xsl:template match="subject/title" mode="expand-gentext" priority="13">
    <xsl:call-template name="expand-gentext-expanded"/>
  </xsl:template>
  
  <xsl:template match="section/title" mode="expand-gentext" priority="12">
    <xsl:call-template name="expand-gentext-expanded"/>
  </xsl:template>
  
  <xsl:template match="page-block/title" mode="expand-gentext" priority="11">
    <xsl:call-template name="expand-gentext-numbering3"/>
  </xsl:template>
  
  <xsl:template match="frontmatter/title" mode="expand-gentext" priority="8">
    <xsl:call-template name="expand-gentext-numbering3"/>
  </xsl:template>
  
  <xsl:template match="table[@display='expand']/title" mode="expand-gentext" priority="6">
    <xsl:call-template name="expand-gentext">
      <xsl:with-param name="content">
        <xsl:choose>
          <xsl:when test="&anc-doc-cir; or &anc-doc-em; or &anc-doc-tmm;">
            <xsl:text>Table </xsl:text>
            <xsl:call-template name="t-styler-numbering-ufe"/>
            <xsl:text>&#xa0;</xsl:text>
          </xsl:when>
          <xsl:when test="&pb-01;"/>
          <xsl:when test="&pb-02; or &pb-03; or &pb-04; or &pb-05; or &pb-06; or &pb-07; or &pb-08; or &pb-09; or 
            &pb-10; or &pb-11; or &pb-12; or &pb-13; or &pb-14; or &pb-15; or &pb-16; or &pb-17; or &pb-18;">
            <xsl:text>Table </xsl:text>
            <xsl:call-template name="t-styler-numbering-ufe"/>
            <xsl:text>&#xa0;</xsl:text>
            <xsl:text>&#xa0;</xsl:text>
          </xsl:when>
        </xsl:choose>
      </xsl:with-param>
    </xsl:call-template>
  </xsl:template>
 
  <xsl:template match="table/title" mode="expand-gentext" priority="5">
    <xsl:call-template name="expand-gentext">
      <xsl:with-param name="content">
        <xsl:choose>
          <xsl:when test="&anc-doc-cir; or &anc-doc-em; or &anc-doc-tmm;">
            <_ufe:hidden>
              <xsl:text>Table </xsl:text>
              <xsl:call-template name="t-styler-numbering"/>
            </_ufe:hidden>
            <xsl:text>&#xa0;</xsl:text>
          </xsl:when>
          <xsl:when test="&pb-01;"/>
          <xsl:when test="&pb-02; or &pb-03; or &pb-04; or &pb-05; or &pb-06; or &pb-07; or &pb-08; or &pb-09; or 
                          &pb-10; or &pb-11; or &pb-12; or &pb-13; or &pb-14; or &pb-15; or &pb-16; or &pb-17; or &pb-18;">
            <_ufe:hidden>
              <xsl:text>Table </xsl:text>
              <xsl:call-template name="t-styler-numbering"/>
              <xsl:text> </xsl:text>
            </_ufe:hidden>
          </xsl:when>    
        </xsl:choose>
      </xsl:with-param>
    </xsl:call-template>  
  </xsl:template>
  
  <xsl:template match="chapter/title" mode="expand-gentext" priority="4">
    <xsl:call-template name="expand-gentext-expanded"/>
  </xsl:template>
  
  <xsl:template match="book/title" mode="expand-gentext" priority="3">
    <xsl:call-template name="expand-gentext-default"/>
  </xsl:template>
  
  <xsl:template match="ata-page-block/title" mode="expand-gentext" priority="2">
    <xsl:call-template name="expand-gentext-numbering3"/>
  </xsl:template>
  
  <xsl:template match="title-page/title" mode="expand-gentext" priority="1">
    <xsl:call-template name="expand-gentext-numbering3"/>
  </xsl:template>
  
  <xsl:template match="title" mode="expand-gentext" priority="0">
    <xsl:call-template name="expand-gentext-default"/>
  </xsl:template>
  
  <xsl:template match="title-page" mode="expand-gentext" priority="0">
    <xsl:call-template name="expand-gentext2">
      <xsl:with-param name="content"><_ufe:proprietary-notice/></xsl:with-param>
    </xsl:call-template>
  </xsl:template>
  
  <xsl:template match="pgblk/_ufe:tmm-title" mode="expand-gentext" priority="2">
    <xsl:call-template name="expand-gentext-pgblk-ufe-title"/>
  </xsl:template>
  
  <xsl:template match="pbfmatr/_ufe:tmm-title" mode="expand-gentext" priority="1">
    <xsl:call-template name="expand-gentext-pgblk-ufe-title"/>
  </xsl:template>
  
  <xsl:template match="_ufe:tmm-title" mode="expand-gentext" priority="0">
    <xsl:call-template name="expand-gentext-ufe">
      <xsl:with-param name="content">
        <xsl:choose>
          <xsl:when test="contains(//book/@doctype, 'lmm')">
            <xsl:text>LINE MAINTENANCE MANUAL</xsl:text>
          </xsl:when>
          <xsl:otherwise>
            <xsl:text>MAINTENANCE MANUAL</xsl:text>
          </xsl:otherwise>
        </xsl:choose>
      </xsl:with-param>
    </xsl:call-template>
  </xsl:template>
    
  <xsl:template match="enumlist//enumlist//enumlist//enumlist/unlitem" mode="expand-gentext" priority="12">
    <xsl:call-template name="expand-gentext-numbering"/>    
  </xsl:template>
  
  <xsl:template match="enumlist//enumlist//enumlist/unlitem" mode="expand-gentext" priority="11">
    <xsl:call-template name="expand-gentext-numbering"/>
  </xsl:template>
  
  <xsl:template match="list//list//list/unlitem" mode="expand-gentext" priority="10">
    <xsl:call-template name="expand-gentext-bullet">
      <xsl:with-param name="bullet">♦</xsl:with-param>
    </xsl:call-template>
  </xsl:template>
  
  <xsl:template match="bullist//bullist//bullist/unlitem" mode="expand-gentext" priority="9">
    <xsl:call-template name="expand-gentext-bullet">
      <xsl:with-param name="bullet">♦</xsl:with-param>
    </xsl:call-template>
  </xsl:template>
  
  <xsl:template match="enumlist//enumlist/unlitem" mode="expand-gentext" priority="8">
    <xsl:call-template name="expand-gentext-numbering"/>
  </xsl:template>
  
  <xsl:template match="list//list/unlitem" mode="expand-gentext" priority="7">
    <xsl:call-template name="expand-gentext-bullet">
      <xsl:with-param name="bullet">–</xsl:with-param>
    </xsl:call-template>
  </xsl:template>
  
  <xsl:template match="bullist//bullist/unlitem" mode="expand-gentext" priority="6">
    <xsl:call-template name="expand-gentext-bullet">
      <xsl:with-param name="bullet">–</xsl:with-param>
    </xsl:call-template>
  </xsl:template>
  
  <xsl:template match="enumlist/unlitem" mode="expand-gentext" priority="5">
    <xsl:call-template name="expand-gentext-numbering"/>
  </xsl:template>
  
  <xsl:template match="unlist/unlitem" mode="expand-gentext" priority="3">
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
  
  <xsl:template match="list/unlitem" mode="expand-gentext" priority="2">
    <xsl:call-template name="expand-gentext-bullet">
      <xsl:with-param name="bullet">•</xsl:with-param>
    </xsl:call-template>
  </xsl:template>
  
  <xsl:template match="bullist/unlitem" mode="expand-gentext" priority="1">
    <xsl:call-template name="expand-gentext-bullet">
      <xsl:with-param name="bullet">•</xsl:with-param>
    </xsl:call-template>
  </xsl:template>
   
  <xsl:template match="url" mode="expand-gentext" priority="0">
    <xsl:call-template name="expand-gentext">
      <xsl:with-param name="content">
        <xsl:text>Website: </xsl:text>
        <_ufe:url-link>
          <xsl:if test="string(.)">
            <xsl:attribute name="url">
              <xsl:value-of select="string(.)"/>
            </xsl:attribute>
          </xsl:if>
        </_ufe:url-link></xsl:with-param>
    </xsl:call-template>
  </xsl:template>
  
  <xsl:template match="_ufe:url-link" mode="expand-gentext" priority="0">
    <xsl:call-template name="expand-gentext-ufe">
      <xsl:with-param name="content">
        <_sfe:ExternalLink>
          <xsl:if test="concat('http://', string(./@url))">
            <xsl:attribute name="href">
              <xsl:value-of select="concat('http://', string(./@url))"/>
            </xsl:attribute>
          </xsl:if>
          <xsl:value-of select="@url"/>
        </_sfe:ExternalLink>
      </xsl:with-param>
    </xsl:call-template>
  </xsl:template>
    
  <xsl:template match="fandc/warning" mode="expand-gentext" priority="6">
    <xsl:call-template name="expand-gentext-default"/>
  </xsl:template>
  
  <xsl:template match="spec-assem/warning" mode="expand-gentext" priority="5">
    <xsl:call-template name="expand-gentext-default"/>
  </xsl:template>
  
  <xsl:template match="spring-pressure/warning" mode="expand-gentext" priority="4">
    <xsl:call-template name="expand-gentext-default"/>
  </xsl:template>
  
  <xsl:template match="torque-and-stretch/warning" mode="expand-gentext" priority="3">
    <xsl:call-template name="expand-gentext-default"/>
  </xsl:template>
  
  <xsl:template match="fits-and-clears/warning" mode="expand-gentext" priority="2">
    <xsl:call-template name="expand-gentext-default"/>
  </xsl:template>
  
  <xsl:template match="subpara/warning" mode="expand-gentext" priority="1">
    <xsl:call-template name="expand-gentext-default"/>
  </xsl:template>
  
  <xsl:template match="warning" mode="expand-gentext" priority="0">
    <xsl:call-template name="expand-gentext-warning"/>
  </xsl:template>
    
  <xsl:template match="highlights//xref" mode="expand-gentext" priority="4">
    <xsl:call-template name="expand-gentext">
      <xsl:with-param name="content">
        <_ufe:highlights-link>
          <xsl:if test="string(./@ref)">
            <xsl:attribute name="ref">
              <xsl:value-of select="string(./@ref)"/>
            </xsl:attribute>
          </xsl:if>
          <xsl:if test="string(.)">
            <xsl:attribute name="content">
              <xsl:value-of select="string(.)"/>
            </xsl:attribute>
          </xsl:if>
        </_ufe:highlights-link>
      </xsl:with-param>
    </xsl:call-template>
  </xsl:template>
  
  <xsl:template match="xref[id(@ref)/self::figure]" mode="expand-gentext" priority="1">
    <xsl:call-template name="expand-gentext-expanded"/>
  </xsl:template>
  
  <xsl:template match="zip" mode="expand-gentext" priority="0">
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
    
  <xsl:template match="_gte:styler_numbering" mode="expand-gentext">
    <xsl:copy>
       <xsl:copy-of select="@*"/>
    </xsl:copy>
  </xsl:template>
  
  <xsl:template match="_gte:Gentexted-Content-Wrapper" mode="expand-gentext">
    <xsl:call-template name="expand-gentext"/>
  </xsl:template>
  
  <xsl:template match="_gte:deferredCrossReference" mode="expand-gentext">
    <_gte:deferredCrossReference2>
       <xsl:copy-of select="@*"/>
    </_gte:deferredCrossReference2>
  </xsl:template>
  
  <xsl:template match="_gte:deferredCrossReference2" mode="expand-gentext"/>
  
  <!--<xsl:template match="_gte:deferredCrossReference2" mode="expand-gentext">
    <xsl:variable name="refed-id" select="@refed-id"/>
    <xsl:variable name="child-title-node" select="(//*[@_gte:id=$refed-id]/*[@_gte:unhidden-title]|//*[@_gte:id=$refed-id]/_sfe:BeforeOrAfterText/*[@_gte:unhidden-title])[1]"/>
    <xsl:choose>
       <xsl:when test="@xrefStyle='Label_Number'">
          <xsl:apply-templates select="$child-title-node" mode="styler_xref-Label_Number"/>
       </xsl:when>
       <xsl:when test="@xrefStyle='Label_Number_Text'">
          <xsl:apply-templates select="$child-title-node" mode="styler_xref-Label_Number_Text"/>
       </xsl:when>
       <xsl:when test="@xrefStyle='Label_Number_Text_Page'">
          <xsl:apply-templates select="$child-title-node" mode="styler_xref-Label_Number_Text_Page"/>
       </xsl:when>
       <xsl:when test="@xrefStyle='Number'">
          <xsl:apply-templates select="$child-title-node" mode="styler_xref-Number"/>
       </xsl:when>
       <xsl:when test="@xrefStyle='Number_Text'">
          <xsl:apply-templates select="$child-title-node" mode="styler_xref-Number_Text"/>
       </xsl:when>
       <xsl:when test="@xrefStyle='Page'">
          <xsl:apply-templates select="$child-title-node" mode="styler_xref-Page"/>
       </xsl:when>
       <xsl:when test="@xrefStyle='Text'">
          <xsl:apply-templates select="$child-title-node" mode="styler_xref-Text"/>
       </xsl:when>
       <xsl:when test="false()"/>
    </xsl:choose>
  </xsl:template>-->
  
  <xsl:template match="_sfe:BeforeOrAfterText" mode="expand-gentext" priority="100">
    <xsl:param name="skip-expanded-gentext" select="'no'"/>
    <xsl:choose>
       <xsl:when test="$skip-expanded-gentext='yes'"/>
       <xsl:otherwise>
          <xsl:copy>
             <xsl:apply-templates select="@* | node()" mode="expand-gentext"/>
          </xsl:copy>
       </xsl:otherwise>
    </xsl:choose>
  </xsl:template>
  
  <xsl:template match="_sfe:CollectionItem[1]" mode="expand-gentext" priority="3">
    <xsl:call-template name="expand-gentext"/>
  </xsl:template>
  
  <xsl:template match="_sfe:CollectionItem[position()&gt;1 and not(position()=last())]" mode="expand-gentext" priority="2">
    <xsl:call-template name="expand-gentext-ufe">
      <xsl:with-param name="content">
        <xsl:text>, </xsl:text>
      </xsl:with-param>
    </xsl:call-template>
  </xsl:template>
  
  <xsl:template match="_sfe:CollectionItem[last()]" mode="expand-gentext" priority="1">
    <xsl:call-template name="expand-gentext-ufe">
      <xsl:with-param name="content">
        <xsl:text>, and </xsl:text>
      </xsl:with-param>
    </xsl:call-template>
  </xsl:template>
  
  <xsl:template match="_sfe:IndexEndPage" mode="expand-gentext" priority="0">
    <xsl:call-template name="expand-gentext-ufe">
      <xsl:with-param name="content">
        <xsl:text>–</xsl:text>
      </xsl:with-param>
    </xsl:call-template>
  </xsl:template>
   
  <xsl:template match="_sfe:IndexLocators" mode="expand-gentext" priority="0">
    <xsl:call-template name="expand-gentext-ufe">
      <xsl:with-param name="content">
        <xsl:text> </xsl:text>
      </xsl:with-param>
    </xsl:call-template>
  </xsl:template>
  
  <xsl:template match="_sfe:IndexPage[position()&gt;1]" mode="expand-gentext" priority="1">
    <xsl:call-template name="expand-gentext-ufe">
      <xsl:with-param name="content">
        <xsl:text>, </xsl:text>
      </xsl:with-param>
    </xsl:call-template>
  </xsl:template>
  
  <xsl:template match="_sfe:IndexSee" mode="expand-gentext" priority="0">
    <xsl:call-template name="expand-gentext-ufe">
      <xsl:with-param name="content">
        <xsl:text>, </xsl:text>
        <span style="font-style: italic; ">
          <xsl:text>See </xsl:text>
        </span>
      </xsl:with-param>
    </xsl:call-template>
  </xsl:template>
  
  <xsl:template match="_sfe:IndexSeeAlso" mode="expand-gentext" priority="0">
    <xsl:call-template name="expand-gentext-ufe">
      <xsl:with-param name="content">
        <xsl:text>, </xsl:text>
        <span style="font-style: italic; ">
          <xsl:text>See also </xsl:text>
        </span>
      </xsl:with-param>
    </xsl:call-template>
  </xsl:template>
  
</xsl:stylesheet>
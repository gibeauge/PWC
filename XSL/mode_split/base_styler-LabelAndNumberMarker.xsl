<?xml version="1.0" encoding="UTF-8"?>

<!DOCTYPE xsl:stylesheet [
    <!ENTITY % entities_commun SYSTEM "xsl_entities_commun.ent">
    %entities_commun;
]>
<xsl:stylesheet 
  xmlns:xsl="http://www.w3.org/1999/XSL/Transform" 
  xmlns="http://www.w3.org/1999/xhtml" 
  xmlns:_gte="http://www.arbortext.com/namespace/Styler/GeneratedTextElements" 
  xmlns:_sfe="http://www.arbortext.com/namespace/Styler/StylerFormattingElements" 
  xmlns:_ufe="http://www.arbortext.com/namespace/Styler/UserFormattingElements" 
  version="1.0" 
  exclude-result-prefixes="#default _ufe _sfe _gte">

<xsl:template name="t-styler-numbering-empty">
  <!--
  <xsl:if test="not(@_gte:Gentext-Expanded)">
     <_sfe:BeforeOrAfterText/>
  </xsl:if>
  -->
</xsl:template>

<xsl:template name="t-styler-numbering-sp-sp">
  <!--
  <xsl:if test="not(@_gte:Gentext-Expanded)">
     <_sfe:BeforeOrAfterText><xsl:call-template name="t-styler-numbering"/><xsl:text> </xsl:text><xsl:text> </xsl:text></_sfe:BeforeOrAfterText>
  </xsl:if>
  -->
  <xsl:call-template name="t-styler-numbering"/><xsl:text> </xsl:text><xsl:text> </xsl:text>
</xsl:template>

<xsl:template name="t-styler-numbering-fig-sp">
  <!--
  <xsl:if test="not(@_gte:Gentext-Expanded)">
    <_sfe:BeforeOrAfterText>Figure <xsl:call-template name="t-styler-numbering"/><xsl:text> </xsl:text></_sfe:BeforeOrAfterText>
  </xsl:if>
  -->
  <xsl:text>Figure </xsl:text><xsl:call-template name="t-styler-numbering"/><xsl:text> </xsl:text>
</xsl:template>

<xsl:template name="t-styler-numbering-table">
  <xsl:text>Table </xsl:text><xsl:call-template name="t-styler-numbering"/>
</xsl:template>

<xsl:template name="t-styler-numbering-table-sp">
  <!--
  <xsl:if test="not(@_gte:Gentext-Expanded)">
    <_sfe:BeforeOrAfterText>Table <xsl:call-template name="t-styler-numbering"/><xsl:text> </xsl:text></_sfe:BeforeOrAfterText>
  </xsl:if>
  -->
  <xsl:text>Table </xsl:text><xsl:call-template name="t-styler-numbering"/><xsl:text> </xsl:text>
</xsl:template>

<xsl:template name="t-styler-numbering-table-sp-h">
  <!--
  <xsl:if test="not(@_gte:Gentext-Expanded)">
    <_sfe:BeforeOrAfterText><_ufe:hidden>Table <xsl:call-template name="t-styler-numbering"/><xsl:text> </xsl:text></_ufe:hidden></_sfe:BeforeOrAfterText>
  </xsl:if>
  -->
  <xsl:text>Table </xsl:text><xsl:call-template name="t-styler-numbering"/><xsl:text> </xsl:text>
</xsl:template>

<xsl:template name="t-styler-numbering-table-sp-sp">
  <xsl:call-template name="t-styler-numbering-table-sp"/><xsl:text> </xsl:text>
</xsl:template>

<xsl:template match="numlist/address" mode="styler-LabelAndNumberMarker" priority="7">
  <xsl:call-template name="t-styler-numbering"/>
</xsl:template>

<xsl:template match="pgblk/_ufe:chapsect-title" mode="styler-LabelAndNumberMarker" priority="2">
  <xsl:call-template name="t-styler-numbering"/>
</xsl:template>

<xsl:template match="pbfmatr/_ufe:chapsect-title" mode="styler-LabelAndNumberMarker" priority="1">
  <xsl:call-template name="t-styler-numbering"/>
</xsl:template>

<xsl:template match="pgblk/_ufe:cir-title" mode="styler-LabelAndNumberMarker" priority="2">
  <xsl:call-template name="t-styler-numbering"/>
</xsl:template>

<xsl:template match="pbfmatr/_ufe:cir-title" mode="styler-LabelAndNumberMarker" priority="1">
  <xsl:call-template name="t-styler-numbering"/>
</xsl:template>

<xsl:template match="pgblk/_ufe:consumables-title" mode="styler-LabelAndNumberMarker" priority="5">
  <xsl:call-template name="t-styler-numbering"/>
</xsl:template>

<xsl:template match="pbfmatr/_ufe:consumables-title" mode="styler-LabelAndNumberMarker" priority="4">
  <xsl:call-template name="t-styler-numbering"/>
</xsl:template>

<xsl:template match="pwcspblist/_ufe:consumables-title" mode="styler-LabelAndNumberMarker" priority="3">
  <xsl:call-template name="t-styler-numbering"/>
</xsl:template>

<xsl:template match="ata-page-block//consumables//_ufe:consumables-title" mode="styler-LabelAndNumberMarker" priority="2">
  <xsl:call-template name="t-styler-numbering"/>
</xsl:template>

<xsl:template match="page-block//consumables//_ufe:consumables-title" mode="styler-LabelAndNumberMarker" priority="1">
  <xsl:call-template name="t-styler-numbering"/>
</xsl:template>

<xsl:template match="pgblk/_ufe:eipc-title" mode="styler-LabelAndNumberMarker" priority="2">
  <xsl:call-template name="t-styler-numbering"/>
</xsl:template>

<xsl:template match="pbfmatr/_ufe:eipc-title" mode="styler-LabelAndNumberMarker" priority="1">
  <xsl:call-template name="t-styler-numbering"/>
</xsl:template>

<xsl:template match="pgblk/_ufe:em-title" mode="styler-LabelAndNumberMarker" priority="2">
  <xsl:call-template name="t-styler-numbering"/>
</xsl:template>

<xsl:template match="pbfmatr/_ufe:em-title" mode="styler-LabelAndNumberMarker" priority="1">
  <xsl:call-template name="t-styler-numbering"/>
</xsl:template>

<xsl:template match="pgblk/_ufe:fixequ-title" mode="styler-LabelAndNumberMarker" priority="5">
  <xsl:call-template name="t-styler-numbering"/>
</xsl:template>

<xsl:template match="pbfmatr/_ufe:fixequ-title" mode="styler-LabelAndNumberMarker" priority="4">
  <xsl:call-template name="t-styler-numbering"/>
</xsl:template>

<xsl:template match="pwcspblist/_ufe:fixequ-title" mode="styler-LabelAndNumberMarker" priority="3">
  <xsl:call-template name="t-styler-numbering"/>
</xsl:template>

<xsl:template match="page-block//fixtures-and-equipment//_ufe:fixequ-title" mode="styler-LabelAndNumberMarker" priority="2">
  <xsl:call-template name="t-styler-numbering"/>
</xsl:template>

<xsl:template match="ata-page-block//fixtures-and-equipment//_ufe:fixequ-title" mode="styler-LabelAndNumberMarker" priority="1">
  <xsl:call-template name="t-styler-numbering"/>
</xsl:template>

<xsl:template match="pgblk/_ufe:general-title" mode="styler-LabelAndNumberMarker" priority="5">
  <xsl:call-template name="t-styler-numbering"/>
</xsl:template>

<xsl:template match="pbfmatr/_ufe:general-title" mode="styler-LabelAndNumberMarker" priority="4">
  <xsl:call-template name="t-styler-numbering"/>
</xsl:template>

<xsl:template match="pwcspblist/_ufe:general-title" mode="styler-LabelAndNumberMarker" priority="3">
  <xsl:call-template name="t-styler-numbering"/>
</xsl:template>

<xsl:template match="page-block//general//_ufe:general-title" mode="styler-LabelAndNumberMarker" priority="2">
  <xsl:call-template name="t-styler-numbering"/>
</xsl:template>

<xsl:template match="ata-page-block//general//_ufe:general-title" mode="styler-LabelAndNumberMarker" priority="1">
  <xsl:call-template name="t-styler-numbering"/>
</xsl:template>

<xsl:template match="pgblk/_ufe:glossary-title" mode="styler-LabelAndNumberMarker" priority="3">
  <xsl:call-template name="t-styler-numbering"/>
</xsl:template>

<xsl:template match="pbfmatr/_ufe:glossary-title" mode="styler-LabelAndNumberMarker" priority="2">
  <xsl:call-template name="t-styler-numbering"/>
</xsl:template>

<xsl:template match="pwcspblist/_ufe:glossary-title" mode="styler-LabelAndNumberMarker" priority="1">
  <xsl:call-template name="t-styler-numbering"/>
</xsl:template>

<xsl:template match="pgblk/_ufe:howtouse-title" mode="styler-LabelAndNumberMarker" priority="2">
  <xsl:call-template name="t-styler-numbering"/>
</xsl:template>

<xsl:template match="pbfmatr/_ufe:howtouse-title" mode="styler-LabelAndNumberMarker" priority="1">
  <xsl:call-template name="t-styler-numbering"/>
</xsl:template>

<xsl:template match="pgblk/_ufe:intro-title" mode="styler-LabelAndNumberMarker" priority="2">
  <xsl:call-template name="t-styler-numbering"/>
</xsl:template>

<xsl:template match="pbfmatr/_ufe:intro-title" mode="styler-LabelAndNumberMarker" priority="1">
  <xsl:call-template name="t-styler-numbering"/>
</xsl:template>

<xsl:template match="step/step/enumlist/item" mode="styler-LabelAndNumberMarker" priority="30">
  <xsl:call-template name="t-styler-numbering"/>
</xsl:template>

<xsl:template match="list4/item" mode="styler-LabelAndNumberMarker" priority="7">
  <xsl:call-template name="t-styler-numbering"/>
</xsl:template>

<xsl:template match="list3/item" mode="styler-LabelAndNumberMarker" priority="6">
  <xsl:call-template name="t-styler-numbering"/>
</xsl:template>

<xsl:template match="list2/item" mode="styler-LabelAndNumberMarker" priority="5">
  <xsl:call-template name="t-styler-numbering"/>
</xsl:template>

<xsl:template match="list1/item" mode="styler-LabelAndNumberMarker" priority="4">
  <xsl:call-template name="t-styler-numbering"/>
</xsl:template>

<xsl:template match="enumlist/item" mode="styler-LabelAndNumberMarker" priority="2">
  <xsl:call-template name="t-styler-numbering"/>
</xsl:template>

<xsl:template match="prclist4/item" mode="styler-LabelAndNumberMarker" priority="11">
  <xsl:call-template name="t-styler-numbering"/>
</xsl:template>

<xsl:template match="prclist3/item" mode="styler-LabelAndNumberMarker" priority="10">
  <xsl:call-template name="t-styler-numbering"/>
</xsl:template>

<xsl:template match="prclist2/item" mode="styler-LabelAndNumberMarker" priority="9">
  <xsl:call-template name="t-styler-numbering"/>
</xsl:template>

<xsl:template match="prclist1/item" mode="styler-LabelAndNumberMarker" priority="8">
  <xsl:call-template name="t-styler-numbering"/>
</xsl:template>

<xsl:template match="numlist/item" mode="styler-LabelAndNumberMarker" priority="13">
  <xsl:call-template name="t-styler-numbering"/>
</xsl:template>

<xsl:template match="pbfmatr/manual-title" mode="styler-LabelAndNumberMarker" priority="3">
  <xsl:call-template name="t-styler-numbering"/>
</xsl:template>

<xsl:template match="pwcspblist/manual-title" mode="styler-LabelAndNumberMarker" priority="2">
  <xsl:call-template name="t-styler-numbering"/>
</xsl:template>

<xsl:template match="pgblk/manual-title" mode="styler-LabelAndNumberMarker" priority="1">
  <xsl:call-template name="t-styler-numbering"/>
</xsl:template>

<xsl:template match="ata-page-block//_sfe:BeforeOrAfterText//_ufe:npara-numbering" mode="styler-LabelAndNumberMarker" priority="2">
  <xsl:call-template name="t-styler-numbering"/>
</xsl:template>

<xsl:template match="page-block//_sfe:BeforeOrAfterText//_ufe:npara-numbering" mode="styler-LabelAndNumberMarker" priority="1">
  <xsl:call-template name="t-styler-numbering"/>
</xsl:template>

<xsl:template match="pgblk/_ufe:num-index-title" mode="styler-LabelAndNumberMarker" priority="3">
  <xsl:call-template name="t-styler-numbering"/>
</xsl:template>

<xsl:template match="pbfmatr/_ufe:num-index-title" mode="styler-LabelAndNumberMarker" priority="2">
  <xsl:call-template name="t-styler-numbering"/>
</xsl:template>

<xsl:template match="pwcspblist/_ufe:num-index-title" mode="styler-LabelAndNumberMarker" priority="1">
  <xsl:call-template name="t-styler-numbering"/>
</xsl:template>

<xsl:template match="pgblk/_ufe:nut-option-title" mode="styler-LabelAndNumberMarker" priority="3">
  <xsl:call-template name="t-styler-numbering"/>
</xsl:template>

<xsl:template match="pbfmatr/_ufe:nut-option-title" mode="styler-LabelAndNumberMarker" priority="2">
  <xsl:call-template name="t-styler-numbering"/>
</xsl:template>

<xsl:template match="pwcspblist/_ufe:nut-option-title" mode="styler-LabelAndNumberMarker" priority="1">
  <xsl:call-template name="t-styler-numbering"/>
</xsl:template>

<xsl:template match="subpara/subpara/subpara/subpara/subpara[not(title)]/para" mode="styler-LabelAndNumberMarker" priority="51">
  <xsl:call-template name="t-styler-numbering"/>
</xsl:template>

<xsl:template match="subpara/subpara/subpara/subpara[not(title)]/para" mode="styler-LabelAndNumberMarker" priority="50">
  <xsl:call-template name="t-styler-numbering"/>
</xsl:template>

<xsl:template match="subpara/subpara/subpara[not(title)]/para" mode="styler-LabelAndNumberMarker" priority="48">
  <xsl:call-template name="t-styler-numbering"/>
</xsl:template>

<xsl:template match="subpara/subpara[not(title)]/para" mode="styler-LabelAndNumberMarker" priority="47">
  <xsl:call-template name="t-styler-numbering"/>
</xsl:template>

<xsl:template match="n-para/subpara/para" mode="styler-LabelAndNumberMarker" priority="43">
  <xsl:call-template name="t-styler-numbering"/>
</xsl:template>

<xsl:template match="pageblock-front/general//para" mode="styler-LabelAndNumberMarker" priority="40">
  <xsl:call-template name="t-styler-numbering"/>
</xsl:template>

<xsl:template match="n-para[ancestor::book[contains(@doctype, 'epc')]]/para" mode="styler-LabelAndNumberMarker" priority="18">
  <xsl:call-template name="t-styler-numbering"/>
</xsl:template>

<xsl:template match="taskproc/para" mode="styler-LabelAndNumberMarker" priority="7">
  <xsl:call-template name="t-styler-numbering"/>
</xsl:template>

<xsl:template match="tprereq/para" mode="styler-LabelAndNumberMarker" priority="4">
  <xsl:call-template name="t-styler-numbering"/>
</xsl:template>

<xsl:template match="numlist/part-group" mode="styler-LabelAndNumberMarker" priority="2">
  <xsl:call-template name="t-styler-numbering"/>
</xsl:template>

<xsl:template match="pgblk/_ufe:pdlist-title" mode="styler-LabelAndNumberMarker" priority="1">
  <xsl:call-template name="t-styler-numbering"/>
</xsl:template>

<xsl:template match="pgblk/_ufe:sblist-title" mode="styler-LabelAndNumberMarker" priority="2">
  <xsl:call-template name="t-styler-numbering"/>
</xsl:template>

<xsl:template match="pbfmatr/_ufe:sblist-title" mode="styler-LabelAndNumberMarker" priority="1">
  <xsl:call-template name="t-styler-numbering"/>
</xsl:template>

<xsl:template match="pgblk/_ufe:spblist-title" mode="styler-LabelAndNumberMarker" priority="2">
  <xsl:call-template name="t-styler-numbering"/>
</xsl:template>

<xsl:template match="pbfmatr/_ufe:spblist-title" mode="styler-LabelAndNumberMarker" priority="1">
  <xsl:call-template name="t-styler-numbering"/>
</xsl:template>

<xsl:template match="pgblk/_ufe:spectools-title" mode="styler-LabelAndNumberMarker" priority="5">
  <xsl:call-template name="t-styler-numbering"/>
</xsl:template>

<xsl:template match="pbfmatr/_ufe:spectools-title" mode="styler-LabelAndNumberMarker" priority="4">
  <xsl:call-template name="t-styler-numbering"/>
</xsl:template>

<xsl:template match="pwcspblist/_ufe:spectools-title" mode="styler-LabelAndNumberMarker" priority="3">
  <xsl:call-template name="t-styler-numbering"/>
</xsl:template>

<xsl:template match="page-block//special-tools//_ufe:spectools-title" mode="styler-LabelAndNumberMarker" priority="2">
  <xsl:call-template name="t-styler-numbering"/>
</xsl:template>

<xsl:template match="ata-page-block//special-tools//_ufe:spectools-title" mode="styler-LabelAndNumberMarker" priority="1">
  <xsl:call-template name="t-styler-numbering"/>
</xsl:template>

<xsl:template match="pgblk/_ufe:supplier-list-title" mode="styler-LabelAndNumberMarker" priority="3">
  <xsl:call-template name="t-styler-numbering"/>
</xsl:template>

<xsl:template match="pbfmatr/_ufe:supplier-list-title" mode="styler-LabelAndNumberMarker" priority="2">
  <xsl:call-template name="t-styler-numbering"/>
</xsl:template>

<xsl:template match="pwcspblist/_ufe:supplier-list-title" mode="styler-LabelAndNumberMarker" priority="1">
  <xsl:call-template name="t-styler-numbering"/>
</xsl:template>

<xsl:template match="pgblk/_ufe:task-title" mode="styler-LabelAndNumberMarker" priority="3">
  <xsl:call-template name="t-styler-numbering"/>
</xsl:template>

<xsl:template match="pbfmatr/_ufe:task-title" mode="styler-LabelAndNumberMarker" priority="2">
  <xsl:call-template name="t-styler-numbering"/>
</xsl:template>

<xsl:template match="pbfmatr//_ufe:task-title" mode="styler-LabelAndNumberMarker" priority="1">
  <xsl:call-template name="t-styler-numbering"/>
</xsl:template>

<xsl:template match="pgblk/_ufe:temp-rev-title" mode="styler-LabelAndNumberMarker" priority="2">
  <xsl:call-template name="t-styler-numbering"/>
</xsl:template>

<xsl:template match="pbfmatr/_ufe:temp-rev-title" mode="styler-LabelAndNumberMarker" priority="1">
  <xsl:call-template name="t-styler-numbering"/>
</xsl:template>

<xsl:template match="subpara/title" mode="styler-LabelAndNumberMarker" priority="38">
  <xsl:call-template name="t-styler-numbering"/>
</xsl:template>

<xsl:template match="book[contains(@doctype, 'epc')]/frontmatter//graphic/title" mode="styler-LabelAndNumberMarker" priority="69">
  <xsl:text>Figure </xsl:text><xsl:call-template name="t-styler-numbering"/>
</xsl:template>

<xsl:template match="book[contains(@doctype, 'ipc')]/frontmatter//figure/title" mode="styler-LabelAndNumberMarker" priority="68">
  <xsl:text>Figure </xsl:text><xsl:call-template name="t-styler-numbering"/>
</xsl:template>

<xsl:template name="t-styler-numbering-fig">
  <xsl:text>Figure </xsl:text><xsl:call-template name="t-styler-numbering"/>
</xsl:template>

<xsl:template match="ata-page-block//task/graphic/title" mode="styler-LabelAndNumberMarker" priority="67">
  <xsl:call-template name="t-styler-numbering-fig-sp"/>
</xsl:template>

<xsl:template match="page-block//task/graphic/title" mode="styler-LabelAndNumberMarker" priority="66">
  <xsl:call-template name="t-styler-numbering-fig-sp"/>
</xsl:template>

<xsl:template match="page-block[@pb-name='glossary']/module/title" mode="styler-LabelAndNumberMarker" priority="61">
  <xsl:call-template name="t-styler-numbering"/>
</xsl:template>

<xsl:template match="page-block[@pb-name='supp_list']/module/title" mode="styler-LabelAndNumberMarker" priority="60">
  <xsl:call-template name="t-styler-numbering"/>
</xsl:template>

<xsl:template match="mm-fits/subpara/title" mode="styler-LabelAndNumberMarker" priority="62">
  <xsl:call-template name="t-styler-numbering"/>
</xsl:template>

<xsl:template match="prcitem4/prcitem/title" mode="styler-LabelAndNumberMarker" priority="60">
  <xsl:call-template name="t-styler-numbering"/>
</xsl:template>

<xsl:template match="prcitem3/prcitem/title" mode="styler-LabelAndNumberMarker" priority="60">
  <xsl:call-template name="t-styler-numbering"/>
</xsl:template>

<xsl:template match="prcitem2/prcitem/title" mode="styler-LabelAndNumberMarker" priority="59">
  <xsl:call-template name="t-styler-numbering"/>
</xsl:template>

<xsl:template match="prcitem1/prcitem/title" mode="styler-LabelAndNumberMarker" priority="55">
  <xsl:call-template name="t-styler-numbering"/>
</xsl:template>

<xsl:template match="task//table/title" mode="styler-LabelAndNumberMarker" priority="51">
  <xsl:choose>
     <xsl:when test="../@display='expand'">
        <xsl:call-template name="t-styler-numbering-table-sp"/>
     </xsl:when>
     <xsl:otherwise>
        <xsl:call-template name="t-styler-numbering-table-sp-h"/>
     </xsl:otherwise>
  </xsl:choose>
</xsl:template>

<xsl:template match="page-block//graphic/title" mode="styler-LabelAndNumberMarker" priority="50">
  <xsl:choose>
     <xsl:when test="not(&anc-pgblk-0-13;)">
        <xsl:call-template name="t-styler-numbering-fig"/>
     </xsl:when>
     <xsl:when test="&anc-pgblk-0-13;">
        <xsl:call-template name="t-styler-numbering-fig-sp"/>
     </xsl:when>
  </xsl:choose>
</xsl:template>

<xsl:template match="ata-page-block//graphic/title" mode="styler-LabelAndNumberMarker" priority="49">
  <xsl:choose>
     <xsl:when test="not(&anc-pgblk-0-13;)">
        <xsl:call-template name="t-styler-numbering-fig"/>
     </xsl:when>
     <xsl:when test="&anc-pgblk-0-13;">
        <xsl:call-template name="t-styler-numbering-fig-sp"/>
     </xsl:when>
  </xsl:choose>
</xsl:template>

<xsl:template match="page-block//mm-fits/title" mode="styler-LabelAndNumberMarker" priority="47">
  <xsl:call-template name="t-styler-numbering"/>
</xsl:template>

<xsl:template match="ata-page-block//mm-fits/title" mode="styler-LabelAndNumberMarker" priority="46">
  <xsl:call-template name="t-styler-numbering"/>
</xsl:template>

<xsl:template match="ata-page-block//fits-and-clears/title" mode="styler-LabelAndNumberMarker" priority="46">
  <xsl:call-template name="t-styler-numbering"/>
</xsl:template>

<xsl:template match="page-block//fits-and-clears/title" mode="styler-LabelAndNumberMarker" priority="45">
  <xsl:call-template name="t-styler-numbering"/>
</xsl:template>

<xsl:template match="ata-page-block//n-para/title" mode="styler-LabelAndNumberMarker" priority="43">
  <xsl:call-template name="t-styler-numbering"/>
</xsl:template>

<xsl:template match="page-block//n-para/title" mode="styler-LabelAndNumberMarker" priority="42">
  <xsl:call-template name="t-styler-numbering"/>
</xsl:template>

<xsl:template match="figure/title" mode="styler-LabelAndNumberMarker" priority="41">
  <xsl:choose>
     <xsl:when test="&pb-01;">
        <xsl:call-template name="t-styler-numbering-empty"/>
     </xsl:when>
     <xsl:when test="&pb-02; or &pb-03; or &pb-04; or &pb-05; or &pb-06; or &pb-07; or &pb-08; or &pb-09; or 
                     &pb-10; or &pb-11; or &pb-12; or &pb-13; or &pb-14; or &pb-15; or &pb-16; or &pb-17; or &pb-18;">
        <xsl:call-template name="t-styler-numbering-fig-sp"/>
     </xsl:when>
     <xsl:otherwise></xsl:otherwise>
   </xsl:choose>
</xsl:template>

<xsl:template match="procedure/title" mode="styler-LabelAndNumberMarker" priority="37">
  <xsl:choose>
     <xsl:when test="ancestor-or-self::table[1]/@role[.='torque-and-stretch' or .='spec-assem']"/>
     <xsl:otherwise>
        <xsl:call-template name="t-styler-numbering"/>
     </xsl:otherwise>
  </xsl:choose>
</xsl:template>

<xsl:template match="taskproc/title" mode="styler-LabelAndNumberMarker" priority="34">
  <xsl:call-template name="t-styler-numbering"/>
</xsl:template>

<xsl:template match="nutopt/title" mode="styler-LabelAndNumberMarker" priority="32">
  <xsl:call-template name="t-styler-numbering"/>
</xsl:template>

<xsl:template match="tprereq/title" mode="styler-LabelAndNumberMarker" priority="27">
  <xsl:call-template name="t-styler-numbering"/>
</xsl:template>

<xsl:template match="subtask/title" mode="styler-LabelAndNumberMarker" priority="26">
  <xsl:call-template name="t-styler-numbering"/>
</xsl:template>

<xsl:template match="task/title" mode="styler-LabelAndNumberMarker" priority="24">
  <xsl:call-template name="t-styler-numbering"/>
</xsl:template>

<xsl:template match="spec-tool-table/title" mode="styler-LabelAndNumberMarker" priority="15">
  <xsl:call-template name="t-styler-numbering"/>
</xsl:template>

<xsl:template match="page-block/title" mode="styler-LabelAndNumberMarker" priority="11">
  <xsl:call-template name="t-styler-numbering"/>
</xsl:template>

<xsl:template match="frontmatter/title" mode="styler-LabelAndNumberMarker" priority="8">
  <xsl:call-template name="t-styler-numbering"/>
</xsl:template>

<xsl:template match="table[@display='expand']/title" mode="styler-LabelAndNumberMarker" priority="6">
  <xsl:choose>
     <xsl:when test="&anc-doc-cir-em-tmm;">
       <xsl:call-template name="t-styler-numbering-table-sp"/>
     </xsl:when>
     <xsl:when test="&pb-01;">
        <xsl:call-template name="t-styler-numbering-empty"/>
     </xsl:when>
     <xsl:when test="&pb-02; or &pb-03; or &pb-04; or &pb-05; or &pb-06; or &pb-07; or &pb-08; or &pb-09; or 
                     &pb-10; or &pb-11; or &pb-12; or &pb-13; or &pb-14; or &pb-15; or &pb-16; or &pb-17; or &pb-18;">
        <xsl:call-template name="t-styler-numbering-table-sp-sp"/>
     </xsl:when>
     <xsl:otherwise></xsl:otherwise>
   </xsl:choose>
</xsl:template>

<xsl:template match="table/title" mode="styler-LabelAndNumberMarker" priority="5">
  <xsl:choose>
     <xsl:when test="&anc-doc-cir-em-tmm;">
       <xsl:call-template name="t-styler-numbering-table-sp-h"/>
     </xsl:when>
     <xsl:when test="&pb-01;">
        <xsl:call-template name="t-styler-numbering-empty"/>
     </xsl:when>
     <xsl:when test="&pb-02; or &pb-03; or &pb-04; or &pb-05; or &pb-06; or &pb-07; or &pb-08; or &pb-09; or 
                     &pb-10; or &pb-11; or &pb-12; or &pb-13; or &pb-14; or &pb-15; or &pb-16; or &pb-17; or &pb-18;">
        <xsl:call-template name="t-styler-numbering-table-sp-h"/>
     </xsl:when>
     <xsl:otherwise></xsl:otherwise>
   </xsl:choose>
</xsl:template>

<xsl:template match="ata-page-block/title" mode="styler-LabelAndNumberMarker" priority="2">
  <xsl:call-template name="t-styler-numbering"/>
</xsl:template>

<xsl:template match="title-page/title" mode="styler-LabelAndNumberMarker" priority="1">
  <xsl:call-template name="t-styler-numbering"/>
</xsl:template>

<xsl:template match="pgblk/_ufe:tmm-title" mode="styler-LabelAndNumberMarker" priority="2">
  <xsl:call-template name="t-styler-numbering"/>
</xsl:template>

<xsl:template match="pbfmatr/_ufe:tmm-title" mode="styler-LabelAndNumberMarker" priority="1">
  <xsl:call-template name="t-styler-numbering"/>
</xsl:template>

<xsl:template match="enumlist//enumlist//enumlist//enumlist/unlitem" mode="styler-LabelAndNumberMarker" priority="12">
  <xsl:call-template name="t-styler-numbering"/>
</xsl:template>

<xsl:template match="enumlist//enumlist//enumlist/unlitem" mode="styler-LabelAndNumberMarker" priority="11">
  <xsl:call-template name="t-styler-numbering"/>
</xsl:template>

<xsl:template match="enumlist//enumlist/unlitem" mode="styler-LabelAndNumberMarker" priority="8">
  <xsl:call-template name="t-styler-numbering"/>
</xsl:template>

<xsl:template match="enumlist/unlitem" mode="styler-LabelAndNumberMarker" priority="5">
  <xsl:call-template name="t-styler-numbering"/>
</xsl:template>

</xsl:stylesheet>

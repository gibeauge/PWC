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

<xsl:template name="t-styler-numbering">
  <_gte:styler_numbering gte_id="{@_gte:id}"/>
</xsl:template>

<xsl:template name="t-styler-numbering-no-qmark">
  <_gte:styler_numbering gte_id="{@_gte:id}" do-qmark="no"/>
</xsl:template>

<xsl:template name="t-crossref-title">
  <_sfe:CrossReferenceTitle>
     <xsl:if test="node()[not(self::_sfe:BeforeOrAfterText)]">
        <_gte:Gentexted-Content-Wrapper>
           <xsl:apply-templates mode="gentext">
              <xsl:with-param name="skip-expanded-gentext" select="'yes'"/>
           </xsl:apply-templates>
        </_gte:Gentexted-Content-Wrapper>
     </xsl:if>
  </_sfe:CrossReferenceTitle>
</xsl:template>

<xsl:template match="*" mode="styler_xref-Label_Number">
  <xsl:apply-templates select="." mode="styler-LabelAndNumberMarker"/>
</xsl:template>

<xsl:template match="*" mode="styler_xref-Label_Number_Text">
  <xsl:apply-templates select="." mode="styler-LabelAndNumberMarker"/>
  <xsl:text> </xsl:text>
  <xsl:call-template name="t-crossref-title"/>
</xsl:template>

<xsl:template match="*" mode="styler_xref-Number">
  <xsl:call-template name="t-styler-numbering-no-qmark"/>
</xsl:template>

<xsl:template match="*" mode="styler_xref-Number_Text">
  <xsl:call-template name="t-styler-numbering-no-qmark"/>
  <xsl:text> </xsl:text>
  <xsl:call-template name="t-crossref-title"/>
</xsl:template>

<xsl:template match="*" mode="styler_xref-Page">
</xsl:template>

<xsl:template match="*" mode="styler_xref-Text">
  <xsl:call-template name="t-crossref-title"/>
</xsl:template>
   
<xsl:template match="_gte:styler_numbering" mode="expand-numbering">
  <xsl:param name="do-qmark">
     <xsl:choose>
        <xsl:when test="@do-qmark">
           <xsl:value-of select="@do-qmark"/>
        </xsl:when>
        <xsl:otherwise>yes</xsl:otherwise>
     </xsl:choose>
  </xsl:param>
  <xsl:variable name="gte_id" select="@gte_id"/>
  <xsl:apply-templates mode="s_numbering" select="//*[@_gte:id=$gte_id]">
     <xsl:with-param name="do-qmark" select="$do-qmark"/>
  </xsl:apply-templates>
</xsl:template>

<!-- COUNT AS MODE : set labels for numbering -->

<xsl:template match="pbfmatr/_ufe:chapsect-title" mode="set-countas" priority="1">
  <xsl:copy>
     <xsl:attribute name="_gte:count-as-id">cnt__pbfmatr^-None-.cnt</xsl:attribute>
     <xsl:apply-templates select="@*|node()" mode="set-countas"/>
  </xsl:copy>
</xsl:template>

<xsl:template match="pbfmatr/_ufe:cir-title" mode="set-countas" priority="1">
  <xsl:copy>
     <xsl:attribute name="_gte:count-as-id">cnt__pbfmatr^-None-.cnt</xsl:attribute>
     <xsl:apply-templates select="@*|node()" mode="set-countas"/>
  </xsl:copy>
</xsl:template>

<xsl:template match="pbfmatr/_ufe:consumables-title" mode="set-countas" priority="4">
  <xsl:copy>
     <xsl:attribute name="_gte:count-as-id">cnt__pbfmatr^-None-.cnt</xsl:attribute>
     <xsl:apply-templates select="@*|node()" mode="set-countas"/>
  </xsl:copy>
</xsl:template>

<xsl:template match="pbfmatr/_ufe:eipc-title" mode="set-countas" priority="1">
  <xsl:copy>
     <xsl:attribute name="_gte:count-as-id">cnt__pbfmatr^-None-.cnt</xsl:attribute>
     <xsl:apply-templates select="@*|node()" mode="set-countas"/>
  </xsl:copy>
</xsl:template>

<xsl:template match="pbfmatr/_ufe:em-title" mode="set-countas" priority="1">
  <xsl:copy>
     <xsl:attribute name="_gte:count-as-id">cnt__pbfmatr^-None-.cnt</xsl:attribute>
     <xsl:apply-templates select="@*|node()" mode="set-countas"/>
  </xsl:copy>
</xsl:template>

<xsl:template match="pbfmatr/_ufe:fixequ-title" mode="set-countas" priority="4">
  <xsl:copy>
     <xsl:attribute name="_gte:count-as-id">cnt__pbfmatr^-None-.cnt</xsl:attribute>
     <xsl:apply-templates select="@*|node()" mode="set-countas"/>
  </xsl:copy>
</xsl:template>

<xsl:template match="pbfmatr/_ufe:general-title" mode="set-countas" priority="4">
  <xsl:copy>
     <xsl:attribute name="_gte:count-as-id">cnt__pbfmatr^-None-.cnt</xsl:attribute>
     <xsl:apply-templates select="@*|node()" mode="set-countas"/>
  </xsl:copy>
</xsl:template>

<xsl:template match="pbfmatr/_ufe:glossary-title" mode="set-countas" priority="2">
  <xsl:copy>
     <xsl:attribute name="_gte:count-as-id">cnt__pbfmatr^-None-.cnt</xsl:attribute>
     <xsl:apply-templates select="@*|node()" mode="set-countas"/>
  </xsl:copy>
</xsl:template>

<xsl:template match="pbfmatr/_ufe:howtouse-title" mode="set-countas" priority="1">
  <xsl:copy>
     <xsl:attribute name="_gte:count-as-id">cnt__pbfmatr^-None-.cnt</xsl:attribute>
     <xsl:apply-templates select="@*|node()" mode="set-countas"/>
  </xsl:copy>
</xsl:template>

<xsl:template match="pbfmatr/_ufe:intro-title" mode="set-countas" priority="1">
  <xsl:copy>
     <xsl:attribute name="_gte:count-as-id">cnt__pbfmatr^-None-.cnt</xsl:attribute>
     <xsl:apply-templates select="@*|node()" mode="set-countas"/>
  </xsl:copy>
</xsl:template>

<xsl:template match="pbfmatr/manual-title" mode="set-countas" priority="3">
  <xsl:copy>
     <xsl:attribute name="_gte:count-as-id">cnt__pbfmatr^-None-.cnt</xsl:attribute>
     <xsl:apply-templates select="@*|node()" mode="set-countas"/>
  </xsl:copy>
</xsl:template>

<xsl:template match="pbfmatr/_ufe:num-index-title" mode="set-countas" priority="2">
  <xsl:copy>
     <xsl:attribute name="_gte:count-as-id">cnt__pbfmatr^-None-.cnt</xsl:attribute>
     <xsl:apply-templates select="@*|node()" mode="set-countas"/>
  </xsl:copy>
</xsl:template>

<xsl:template match="pbfmatr/_ufe:nut-option-title" mode="set-countas" priority="2">
  <xsl:copy>
     <xsl:attribute name="_gte:count-as-id">cnt__pbfmatr^-None-.cnt</xsl:attribute>
     <xsl:apply-templates select="@*|node()" mode="set-countas"/>
  </xsl:copy>
</xsl:template>

<xsl:template match="pbfmatr/_ufe:sblist-title" mode="set-countas" priority="1">
  <xsl:copy>
     <xsl:attribute name="_gte:count-as-id">cnt__pbfmatr^-None-.cnt</xsl:attribute>
     <xsl:apply-templates select="@*|node()" mode="set-countas"/>
  </xsl:copy>
</xsl:template>

<xsl:template match="pbfmatr/_ufe:spblist-title" mode="set-countas" priority="1">
  <xsl:copy>
     <xsl:attribute name="_gte:count-as-id">cnt__pbfmatr^-None-.cnt</xsl:attribute>
     <xsl:apply-templates select="@*|node()" mode="set-countas"/>
  </xsl:copy>
</xsl:template>

<xsl:template match="pbfmatr/_ufe:spectools-title" mode="set-countas" priority="4">
  <xsl:copy>
     <xsl:attribute name="_gte:count-as-id">cnt__pbfmatr^-None-.cnt</xsl:attribute>
     <xsl:apply-templates select="@*|node()" mode="set-countas"/>
  </xsl:copy>
</xsl:template>

<xsl:template match="pbfmatr/_ufe:supplier-list-title" mode="set-countas" priority="2">
  <xsl:copy>
     <xsl:attribute name="_gte:count-as-id">cnt__pbfmatr^-None-.cnt</xsl:attribute>
     <xsl:apply-templates select="@*|node()" mode="set-countas"/>
  </xsl:copy>
</xsl:template>

<xsl:template match="pbfmatr/_ufe:task-title" mode="set-countas" priority="2">
  <xsl:copy>
     <xsl:attribute name="_gte:count-as-id">cnt__pbfmatr^-None-.cnt</xsl:attribute>
     <xsl:apply-templates select="@*|node()" mode="set-countas"/>
  </xsl:copy>
</xsl:template>

<xsl:template match="pbfmatr/_ufe:temp-rev-title" mode="set-countas" priority="1">
  <xsl:copy>
     <xsl:attribute name="_gte:count-as-id">cnt__pbfmatr^-None-.cnt</xsl:attribute>
     <xsl:apply-templates select="@*|node()" mode="set-countas"/>
  </xsl:copy>
</xsl:template>

<xsl:template match="pbfmatr/_ufe:tmm-title" mode="set-countas" priority="1">
  <xsl:copy>
     <xsl:attribute name="_gte:count-as-id">cnt__pbfmatr^-None-.cnt</xsl:attribute>
     <xsl:apply-templates select="@*|node()" mode="set-countas"/>
  </xsl:copy>
</xsl:template>

<xsl:template match="ata-page-block//consumables//_ufe:consumables-title" mode="set-countas" priority="2">
  <xsl:copy>
     <xsl:attribute name="_gte:count-as-id">npara-ata</xsl:attribute>
     <xsl:apply-templates select="@*|node()" mode="set-countas"/>
  </xsl:copy>
</xsl:template>

<xsl:template match="page-block//consumables//_ufe:consumables-title" mode="set-countas" priority="1">
  <xsl:copy>
     <xsl:attribute name="_gte:count-as-id">npara</xsl:attribute>
     <xsl:apply-templates select="@*|node()" mode="set-countas"/>
  </xsl:copy>
</xsl:template>

<xsl:template match="page-block//fixtures-and-equipment//_ufe:fixequ-title" mode="set-countas" priority="2">
  <xsl:copy>
     <xsl:attribute name="_gte:count-as-id">npara</xsl:attribute>
     <xsl:apply-templates select="@*|node()" mode="set-countas"/>
  </xsl:copy>
</xsl:template>

<xsl:template match="ata-page-block//fixtures-and-equipment//_ufe:fixequ-title" mode="set-countas" priority="1">
  <xsl:copy>
     <xsl:attribute name="_gte:count-as-id">npara-ata</xsl:attribute>
     <xsl:apply-templates select="@*|node()" mode="set-countas"/>
  </xsl:copy>
</xsl:template>

<xsl:template match="page-block//general//_ufe:general-title" mode="set-countas" priority="2">
  <xsl:copy>
     <xsl:attribute name="_gte:count-as-id">npara</xsl:attribute>
     <xsl:apply-templates select="@*|node()" mode="set-countas"/>
  </xsl:copy>
</xsl:template>

<xsl:template match="ata-page-block//general//_ufe:general-title" mode="set-countas" priority="1">
  <xsl:copy>
     <xsl:attribute name="_gte:count-as-id">npara-ata</xsl:attribute>
     <xsl:apply-templates select="@*|node()" mode="set-countas"/>
  </xsl:copy>
</xsl:template>

<xsl:template match="subpara/subpara/subpara/subpara/subpara[not(title)]/para" mode="set-countas" priority="51">
  <xsl:copy>
     <xsl:attribute name="_gte:count-as-id">cnt__para.xpath</xsl:attribute>
     <xsl:apply-templates select="@*|node()" mode="set-countas"/>
  </xsl:copy>
</xsl:template>

<xsl:template match="subpara/subpara/subpara/subpara[not(title)]/para" mode="set-countas" priority="50">
  <xsl:copy>
     <xsl:attribute name="_gte:count-as-id">cnt__para.xpath</xsl:attribute>
     <xsl:apply-templates select="@*|node()" mode="set-countas"/>
  </xsl:copy>
</xsl:template>

<xsl:template match="subpara/subpara/subpara[not(title)]/para" mode="set-countas" priority="48">
  <xsl:copy>
     <xsl:attribute name="_gte:count-as-id">cnt__para.xpath</xsl:attribute>
     <xsl:apply-templates select="@*|node()" mode="set-countas"/>
  </xsl:copy>
</xsl:template>

<xsl:template match="subpara/subpara[not(title)]/para" mode="set-countas" priority="47">
  <xsl:copy>
     <xsl:attribute name="_gte:count-as-id">cnt__para.xpath</xsl:attribute>
     <xsl:apply-templates select="@*|node()" mode="set-countas"/>
  </xsl:copy>
</xsl:template>

<xsl:template match="n-para/subpara/para" mode="set-countas" priority="43">
  <xsl:copy>
     <xsl:attribute name="_gte:count-as-id">cnt__para^n-para.cnt</xsl:attribute>
     <xsl:apply-templates select="@*|node()" mode="set-countas"/>
  </xsl:copy>
</xsl:template>

<xsl:template match="pageblock-front/general//para" mode="set-countas" priority="40">
  <xsl:copy>
     <xsl:attribute name="_gte:count-as-id">cnt__para^general.cnt</xsl:attribute>
     <xsl:apply-templates mode="set-countas" select="@*|node()"/>
  </xsl:copy>
</xsl:template>

<xsl:template match="page-block//special-tools//_ufe:spectools-title" mode="set-countas" priority="2">
  <xsl:copy>
     <xsl:attribute name="_gte:count-as-id">npara</xsl:attribute>
     <xsl:apply-templates select="@*|node()" mode="set-countas"/>
  </xsl:copy>
</xsl:template>

<xsl:template match="ata-page-block//special-tools//_ufe:spectools-title" mode="set-countas" priority="1">
  <xsl:copy>
     <xsl:attribute name="_gte:count-as-id">npara-ata</xsl:attribute>
     <xsl:apply-templates select="@*|node()" mode="set-countas"/>
  </xsl:copy>
</xsl:template>

<xsl:template match="pbfmatr//_ufe:task-title" mode="set-countas" priority="1">
  <xsl:copy>
     <xsl:attribute name="_gte:count-as-id">task</xsl:attribute>
     <xsl:apply-templates select="@*|node()" mode="set-countas"/>
  </xsl:copy>
</xsl:template>

<xsl:template match="ata-page-block//task/graphic/title" mode="set-countas" priority="67">
  <xsl:copy>
    <xsl:attribute name="_gte:count-as-id">cnt__graphic^ata-page-block.cnt</xsl:attribute>
    <xsl:apply-templates select="@*|node()" mode="set-countas"/>
  </xsl:copy>
</xsl:template>

<xsl:template match="page-block//task/graphic/title" mode="set-countas" priority="66">
  <xsl:copy>
    <xsl:attribute name="_gte:count-as-id">cnt__graphic^page-block.cnt</xsl:attribute>
    <xsl:apply-templates select="@*|node()" mode="set-countas"/>
  </xsl:copy>
</xsl:template>

<xsl:template match="page-block[@pb-name='glossary']/module/title" mode="set-countas" priority="61">
  <xsl:copy>
     <xsl:attribute name="_gte:count-as-id">npara</xsl:attribute>
     <xsl:apply-templates mode="set-countas" select="@*|node()"/>
  </xsl:copy>
</xsl:template>

<xsl:template match="page-block[@pb-name='supp_list']/module/title" mode="set-countas" priority="60">
  <xsl:copy>
     <xsl:attribute name="_gte:count-as-id">npara</xsl:attribute>
     <xsl:apply-templates mode="set-countas" select="@*|node()"/>
  </xsl:copy>
</xsl:template>

<xsl:template match="task//table/title" mode="set-countas" priority="51">
  <xsl:copy>
    <xsl:attribute name="_gte:count-as-id">cnt__table^pgblk.cnt</xsl:attribute>
    <xsl:apply-templates select="@*|node()" mode="set-countas"/>
  </xsl:copy>
</xsl:template>

<xsl:template match="page-block//graphic/title" mode="set-countas" priority="50">
  <xsl:copy>
  <xsl:attribute name="_gte:count-as-id">cnt__graphic^page-block.cnt</xsl:attribute>
    <xsl:apply-templates select="@*|node()" mode="set-countas"/>
  </xsl:copy>
</xsl:template>

<xsl:template match="ata-page-block//graphic/title" mode="set-countas" priority="49">
  <xsl:copy>
    <xsl:attribute name="_gte:count-as-id">cnt__graphic^ata-page-block.cnt</xsl:attribute>
    <xsl:apply-templates select="@*|node()" mode="set-countas"/>
  </xsl:copy>
</xsl:template>

<xsl:template match="page-block//mm-fits/title" mode="set-countas" priority="47">
  <xsl:copy>
     <xsl:attribute name="_gte:count-as-id">npara</xsl:attribute>
     <xsl:apply-templates mode="set-countas" select="@*|node()"/>
  </xsl:copy>
</xsl:template>

<xsl:template match="ata-page-block//mm-fits/title" mode="set-countas" priority="46">
  <xsl:copy>
     <xsl:attribute name="_gte:count-as-id">npara-ata</xsl:attribute>
     <xsl:apply-templates mode="set-countas" select="@*|node()"/>
  </xsl:copy>
</xsl:template>

<xsl:template match="ata-page-block//fits-and-clears/title" mode="set-countas" priority="46">
  <xsl:copy>
     <xsl:attribute name="_gte:count-as-id">npara-ata</xsl:attribute>
     <xsl:apply-templates select="@*|node()" mode="set-countas"/>
  </xsl:copy>
</xsl:template>

<xsl:template match="page-block//fits-and-clears/title" mode="set-countas" priority="45">
  <xsl:copy>
     <xsl:attribute name="_gte:count-as-id">npara</xsl:attribute>
     <xsl:apply-templates select="@*|node()" mode="set-countas"/>
  </xsl:copy>
</xsl:template>

<xsl:template match="ata-page-block//n-para/title" mode="set-countas" priority="43">
  <xsl:copy>
     <xsl:attribute name="_gte:count-as-id">npara-ata</xsl:attribute>
     <xsl:apply-templates mode="set-countas" select="@*|node()"/>
  </xsl:copy>
</xsl:template>

<xsl:template match="page-block//n-para/title" mode="set-countas" priority="42">
  <xsl:copy>
     <xsl:attribute name="_gte:count-as-id">npara</xsl:attribute>
     <xsl:apply-templates mode="set-countas" select="@*|node()"/>
  </xsl:copy>
</xsl:template>

<xsl:template match="figure/title|ipc-fig-reloc/title" mode="set-countas" priority="41">
  <xsl:copy>
     <xsl:choose>
       <xsl:when test="&pb-01;">
       </xsl:when>
       <xsl:when test="&pb-02; or &pb-03; or &pb-04; or &pb-05; or &pb-06; or &pb-07; or &pb-08; or &pb-09; or 
                       &pb-10; or &pb-11; or &pb-12; or &pb-13; or &pb-14; or &pb-15; or &pb-16; or &pb-17; or &pb-18;">
          <xsl:choose>
            <xsl:when test="ancestor::page-block">
              <xsl:attribute name="_gte:count-as-id">cnt__figure^page-block.cnt</xsl:attribute>
            </xsl:when>
            <xsl:otherwise>
              <xsl:attribute name="_gte:count-as-id">cnt__figure^ata-page-block.cnt</xsl:attribute>
            </xsl:otherwise>
          </xsl:choose>
       </xsl:when>
       <xsl:otherwise></xsl:otherwise>
     </xsl:choose>
     <xsl:apply-templates select="@*|node()" mode="set-countas"/>
  </xsl:copy>
</xsl:template>

<xsl:template match="subpara/subpara/title" mode="set-countas" priority="40">
  <xsl:copy>
    <xsl:apply-templates select="@*|node()" mode="set-countas"/>
  </xsl:copy>
</xsl:template>

<xsl:template match="subpara/title" mode="set-countas" priority="38">
  <xsl:copy>
     <xsl:attribute name="_gte:count-as-id">subpara</xsl:attribute>
     <xsl:apply-templates select="@*|node()" mode="set-countas"/>
  </xsl:copy>
</xsl:template>

<xsl:template match="procedure/title" mode="set-countas" priority="37">
  <xsl:copy>
     <xsl:choose>
        <xsl:when test="ancestor-or-self::table[1]/@role[.='torque-and-stretch' or .='spec-assem']"/>
        <xsl:otherwise>
           <xsl:attribute name="_gte:count-as-id">subpara</xsl:attribute>
        </xsl:otherwise>
     </xsl:choose>
     <xsl:apply-templates select="@*|node()" mode="set-countas"/>
  </xsl:copy>
</xsl:template>

<xsl:template match="taskproc/title" mode="set-countas" priority="34">
  <xsl:copy>
     <xsl:attribute name="_gte:count-as-id">subtask</xsl:attribute>
     <xsl:apply-templates select="@*|node()" mode="set-countas"/>
  </xsl:copy>
</xsl:template>

<xsl:template match="tprereq/title" mode="set-countas" priority="27">
  <xsl:copy>
     <xsl:attribute name="_gte:count-as-id">subtask</xsl:attribute>
     <xsl:apply-templates select="@*|node()" mode="set-countas"/>
  </xsl:copy>
</xsl:template>

<xsl:template match="subtask/title" mode="set-countas" priority="26">
  <xsl:copy>
     <xsl:attribute name="_gte:count-as-id">subtask</xsl:attribute>
     <xsl:apply-templates select="@*|node()" mode="set-countas"/>
  </xsl:copy>
</xsl:template>

<xsl:template match="task/title" mode="set-countas" priority="24">
  <xsl:copy>
     <xsl:attribute name="_gte:count-as-id">task</xsl:attribute>
     <xsl:apply-templates mode="set-countas" select="@*|node()"> </xsl:apply-templates>
  </xsl:copy>
</xsl:template>

<xsl:template match="table/title" mode="set-countas" priority="6">
  <xsl:copy>
     <xsl:choose>
        <xsl:when test="&anc-doc-cir-em-tmm;">
          <xsl:attribute name="_gte:count-as-id">cnt__table^pgblk.cnt</xsl:attribute>
        </xsl:when>
        <xsl:when test="&pb-01;">
        </xsl:when>
        <xsl:when test="&pb-02; or &pb-03; or &pb-04; or &pb-05; or &pb-06; or &pb-07; or &pb-08; or &pb-09; or 
                       &pb-10; or &pb-11; or &pb-12; or &pb-13; or &pb-14; or &pb-15; or &pb-16; or &pb-17; or &pb-18;">
          <xsl:choose>
            <xsl:when test="ancestor::page-block">
              <xsl:attribute name="_gte:count-as-id">cnt__table^page-block.cnt</xsl:attribute>
            </xsl:when>
            <xsl:otherwise>
              <xsl:attribute name="_gte:count-as-id">cnt__table^ata-page-block.cnt</xsl:attribute>
            </xsl:otherwise>
          </xsl:choose>
        </xsl:when>
        <xsl:otherwise></xsl:otherwise>
     </xsl:choose>
     <xsl:apply-templates select="@*|node()" mode="set-countas"/>
  </xsl:copy>
</xsl:template>

<!-- FROM SPECIFIC FILES -->

<xsl:template match="numlist/step" mode="set-countas" priority="3">
  <xsl:copy>
     <xsl:apply-templates select="@*|node()" mode="set-countas"/>
  </xsl:copy>
</xsl:template>

<xsl:template match="numlist/step2" mode="set-countas" priority="2">
  <xsl:copy>
     <xsl:apply-templates select="@*|node()" mode="set-countas"/>
  </xsl:copy>
</xsl:template>

<xsl:template match="numlist/step3" mode="set-countas" priority="2">
  <xsl:copy>
     <xsl:apply-templates select="@*|node()" mode="set-countas"/>
  </xsl:copy>
</xsl:template>

<xsl:template match="numlist/step4" mode="set-countas" priority="2">
  <xsl:copy>
     <xsl:apply-templates select="@*|node()" mode="set-countas"/>
  </xsl:copy>
</xsl:template>

<xsl:template match="procedure//step" mode="set-countas" priority="2">
  <xsl:copy>
     <xsl:attribute name="_gte:count-as-id">cnt__^procedure.cnt</xsl:attribute>
     <xsl:apply-templates mode="set-countas" select="@*|node()"> </xsl:apply-templates>
  </xsl:copy>
</xsl:template>

<xsl:template match="step2" mode="set-countas" priority="0">
  <xsl:copy>
     <xsl:attribute name="_gte:count-as-id">cnt__^step.cnt</xsl:attribute>
     <xsl:apply-templates mode="set-countas" select="@*|node()"> </xsl:apply-templates>
  </xsl:copy>
</xsl:template>

<xsl:template match="step3" mode="set-countas" priority="0">
  <xsl:copy>
     <xsl:attribute name="_gte:count-as-id">cnt__^step2.cnt</xsl:attribute>
     <xsl:apply-templates mode="set-countas" select="@*|node()"> </xsl:apply-templates>
  </xsl:copy>
</xsl:template>

<xsl:template match="step4" mode="set-countas" priority="0">
  <xsl:copy>
     <xsl:attribute name="_gte:count-as-id">cnt__^step3.cnt</xsl:attribute>
     <xsl:apply-templates mode="set-countas" select="@*|node()"> </xsl:apply-templates>
  </xsl:copy>
</xsl:template>

<!-- NUMBERING MODE : calculate numbering -->

<xsl:template match="numlist/address" mode="s_numbering" priority="7">
  <xsl:number count="numlist/address" format="1."/>
</xsl:template>

<xsl:template match="pgblk/_ufe:chapsect-title" mode="s_numbering" priority="2">
  <xsl:number count="pgblk[_ufe:chapsect-title]" level="any" format="1"/>
</xsl:template>

<xsl:template name="t-numbering-pbfmatr-child">
  <xsl:number count="pbfmatr/*[@_gte:count-as-id='cnt__pbfmatr^-None-.cnt']" level="any" format="1"/>
</xsl:template>

<xsl:template match="pbfmatr/_ufe:chapsect-title" mode="s_numbering" priority="1">
  <xsl:call-template name="t-numbering-pbfmatr-child"/>
</xsl:template>

<xsl:template match="_ufe:chapsect-title" mode="s_numbering" priority="0">
  <xsl:param name="do-qmark" select="'yes'"/>
  <xsl:if test="$do-qmark='yes'">
     <xsl:value-of select="'?'"/>
  </xsl:if>
</xsl:template>

<xsl:template match="pgblk/_ufe:cir-title" mode="s_numbering" priority="2">
  <xsl:number count="pgblk[_ufe:cir-title]" level="any" format="1"/>
</xsl:template>

<xsl:template match="pbfmatr/_ufe:cir-title" mode="s_numbering" priority="1">
  <xsl:call-template name="t-numbering-pbfmatr-child"/>
</xsl:template>

<xsl:template match="_ufe:cir-title" mode="s_numbering" priority="0">
  <xsl:param name="do-qmark" select="'yes'"/>
  <xsl:if test="$do-qmark='yes'">
     <xsl:value-of select="'?'"/>
  </xsl:if>
</xsl:template>

<xsl:template match="pgblk/_ufe:consumables-title" mode="s_numbering" priority="5">
  <xsl:number count="pgblk[_ufe:consumables-title]" level="any" format="1"/>
</xsl:template>

<xsl:template match="pbfmatr/_ufe:consumables-title" mode="s_numbering" priority="4">
  <xsl:call-template name="t-numbering-pbfmatr-child"/>
</xsl:template>

<xsl:template match="pwcspblist/_ufe:consumables-title" mode="s_numbering" priority="3">
  <xsl:number count="pwcspblist[_ufe:consumables-title]" level="any" format="1"/>
</xsl:template>

<xsl:template name="t-numbering-npara-ata-page-block">
  <xsl:number count="*[@_gte:count-as-id='npara-ata']" from="ata-page-block" level="any" format="1."/>
</xsl:template>

<xsl:template match="ata-page-block//consumables//_ufe:consumables-title" mode="s_numbering" priority="2">
  <xsl:call-template name="t-numbering-npara-ata-page-block"/>
</xsl:template>

<xsl:template name="t-numbering-npara-page-block">
  <xsl:number count="*[@_gte:count-as-id='npara']" from="page-block" level="any" format="1."/>
</xsl:template>

<xsl:template match="page-block//consumables//_ufe:consumables-title" mode="s_numbering" priority="1">
  <xsl:call-template name="t-numbering-npara-page-block"/>
</xsl:template>

<xsl:template match="_ufe:consumables-title" mode="s_numbering" priority="0">
  <xsl:param name="do-qmark" select="'yes'"/>
  <xsl:if test="$do-qmark='yes'">
     <xsl:value-of select="'?'"/>
  </xsl:if>
</xsl:template>

<xsl:template match="pgblk/_ufe:eipc-title" mode="s_numbering" priority="2">
  <xsl:number count="pgblk[_ufe:eipc-title]" level="any" format="1"/>
</xsl:template>

<xsl:template match="pbfmatr/_ufe:eipc-title" mode="s_numbering" priority="1">
  <xsl:call-template name="t-numbering-pbfmatr-child"/>
</xsl:template>

<xsl:template match="_ufe:eipc-title" mode="s_numbering" priority="0">
  <xsl:param name="do-qmark" select="'yes'"/>
  <xsl:if test="$do-qmark='yes'">
     <xsl:value-of select="'?'"/>
  </xsl:if>
</xsl:template>

<xsl:template match="pgblk/_ufe:em-title" mode="s_numbering" priority="2">
  <xsl:number count="pgblk[_ufe:em-title]" level="any" format="1"/>
</xsl:template>

<xsl:template match="pbfmatr/_ufe:em-title" mode="s_numbering" priority="1">
  <xsl:call-template name="t-numbering-pbfmatr-child"/>
</xsl:template>

<xsl:template match="_ufe:em-title" mode="s_numbering" priority="0">
  <xsl:param name="do-qmark" select="'yes'"/>
  <xsl:if test="$do-qmark='yes'">
     <xsl:value-of select="'?'"/>
  </xsl:if>
</xsl:template>

<xsl:template match="pgblk/_ufe:fixequ-title" mode="s_numbering" priority="5">
  <xsl:number count="pgblk[_ufe:fixequ-title]" level="any" format="1"/>
</xsl:template>

<xsl:template match="pbfmatr/_ufe:fixequ-title" mode="s_numbering" priority="4">
  <xsl:call-template name="t-numbering-pbfmatr-child"/>
</xsl:template>

<xsl:template match="pwcspblist/_ufe:fixequ-title" mode="s_numbering" priority="3">
  <xsl:number count="pwcspblist[_ufe:fixequ-title]" level="any" format="1"/>
</xsl:template>

<xsl:template match="page-block//fixtures-and-equipment//_ufe:fixequ-title" mode="s_numbering" priority="2">
  <xsl:call-template name="t-numbering-npara-page-block"/>
</xsl:template>

<xsl:template match="ata-page-block//fixtures-and-equipment//_ufe:fixequ-title" mode="s_numbering" priority="1">
  <xsl:call-template name="t-numbering-npara-ata-page-block"/>
</xsl:template>

<xsl:template match="_ufe:fixequ-title" mode="s_numbering" priority="0">
  <xsl:param name="do-qmark" select="'yes'"/>
  <xsl:if test="$do-qmark='yes'">
     <xsl:value-of select="'?'"/>
  </xsl:if>
</xsl:template>

<xsl:template match="pgblk/_ufe:general-title" mode="s_numbering" priority="5">
  <xsl:number count="pgblk[_ufe:general-title]" level="any" format="1"/>
</xsl:template>

<xsl:template match="pbfmatr/_ufe:general-title" mode="s_numbering" priority="4">
  <xsl:call-template name="t-numbering-pbfmatr-child"/>
</xsl:template>

<xsl:template match="pwcspblist/_ufe:general-title" mode="s_numbering" priority="3">
  <xsl:number count="pwcspblist[_ufe:general-title]" level="any" format="1"/>
</xsl:template>

<xsl:template match="page-block//general//_ufe:general-title" mode="s_numbering" priority="2">
  <xsl:call-template name="t-numbering-npara-page-block"/>
</xsl:template>

<xsl:template match="ata-page-block//general//_ufe:general-title" mode="s_numbering" priority="1">
  <xsl:call-template name="t-numbering-npara-ata-page-block"/>
</xsl:template>

<xsl:template match="_ufe:general-title" mode="s_numbering" priority="0">
  <xsl:param name="do-qmark" select="'yes'"/>
  <xsl:if test="$do-qmark='yes'">
     <xsl:value-of select="'?'"/>
  </xsl:if>
</xsl:template>

<xsl:template match="pgblk/_ufe:glossary-title" mode="s_numbering" priority="3">
  <xsl:number count="pgblk[_ufe:glossary-title]" level="any" format="1"/>
</xsl:template>

<xsl:template match="pbfmatr/_ufe:glossary-title" mode="s_numbering" priority="2">
  <xsl:call-template name="t-numbering-pbfmatr-child"/>
</xsl:template>

<xsl:template match="pwcspblist/_ufe:glossary-title" mode="s_numbering" priority="1">
  <xsl:number count="pwcspblist[_ufe:glossary-title]" level="any" format="1"/>
</xsl:template>

<xsl:template match="_ufe:glossary-title" mode="s_numbering" priority="0">
  <xsl:param name="do-qmark" select="'yes'"/>
  <xsl:if test="$do-qmark='yes'">
     <xsl:value-of select="'?'"/>
  </xsl:if>
</xsl:template>

<xsl:template match="pgblk/_ufe:howtouse-title" mode="s_numbering" priority="2">
  <xsl:number count="pgblk[_ufe:howtouse-title]" level="any" format="1"/>
</xsl:template>

<xsl:template match="pbfmatr/_ufe:howtouse-title" mode="s_numbering" priority="1">
  <xsl:call-template name="t-numbering-pbfmatr-child"/>
</xsl:template>

<xsl:template match="_ufe:howtouse-title" mode="s_numbering" priority="0">
  <xsl:param name="do-qmark" select="'yes'"/>
  <xsl:if test="$do-qmark='yes'">
     <xsl:value-of select="'?'"/>
  </xsl:if>
</xsl:template>

<xsl:template match="pgblk/_ufe:intro-title" mode="s_numbering" priority="2">
  <xsl:number count="pgblk[_ufe:intro-title]" level="any" format="1"/>
</xsl:template>

<xsl:template match="pbfmatr/_ufe:intro-title" mode="s_numbering" priority="1">
  <xsl:call-template name="t-numbering-pbfmatr-child"/>
</xsl:template>

<xsl:template match="_ufe:intro-title" mode="s_numbering" priority="0">
  <xsl:param name="do-qmark" select="'yes'"/>
  <xsl:if test="$do-qmark='yes'">
     <xsl:value-of select="'?'"/>
  </xsl:if>
</xsl:template>

<xsl:template match="step/step/enumlist/item" mode="s_numbering" priority="30">
  <xsl:number count="item" format="1" level="single"/>
</xsl:template>

<xsl:template match="prclist4//prclist4//prclist4//prclist4/item" mode="s_numbering" priority="29">
  <xsl:number count="item" format="1)" level="single"/>
</xsl:template>

<xsl:template match="prclist4//prclist4//prclist4/item" mode="s_numbering" priority="26">
  <xsl:number count="item" format="i." level="single"/>
</xsl:template>

<xsl:template match="prclist4//prclist4/item" mode="s_numbering" priority="21">
  <xsl:number count="item" format="a." level="single"/>
</xsl:template>

<xsl:template match="prclist4/item" mode="s_numbering" priority="11">
  <xsl:number count="item" format="1." level="single"/>
</xsl:template>

<xsl:template match="prclist3/item" mode="s_numbering" priority="10">
  <xsl:number count="item" format="1." level="single"/>
</xsl:template>

<xsl:template match="prclist2/item" mode="s_numbering" priority="9">
  <xsl:number count="item" format="1." level="single"/>
</xsl:template>

<xsl:template match="prclist1/item" mode="s_numbering" priority="8">
  <xsl:number count="item" format="1." level="single"/>
</xsl:template>

<xsl:template match="list4//list4//list4//list4/item" mode="s_numbering" priority="28">
  <xsl:number count="item" format="1)" level="single"/>
</xsl:template>

<xsl:template match="list4//list4//list4/item" mode="s_numbering" priority="25">
  <xsl:number count="item" format="i." level="single"/>
</xsl:template>

<xsl:template match="list4//list4/item" mode="s_numbering" priority="20">
  <xsl:number count="item" format="a." level="single"/>
</xsl:template>

<xsl:template match="list4/item" mode="s_numbering" priority="7">
  <xsl:number count="item" format="1." level="single"/>
</xsl:template>

<xsl:template match="list3/item" mode="s_numbering" priority="6">
  <xsl:number count="item" format="1." level="single"/>
</xsl:template>

<xsl:template match="list2/item" mode="s_numbering" priority="5">
  <xsl:number count="item" format="1." level="single"/>
</xsl:template>

<xsl:template match="list1/item" mode="s_numbering" priority="4">
  <xsl:number count="item" format="1." level="single"/>
</xsl:template>
   
<xsl:template match="enumlist//enumlist//enumlist//enumlist/item" mode="s_numbering" priority="27">
  <xsl:number count="item" format="1)" level="single"/>
</xsl:template>

<xsl:template match="enumlist//enumlist//enumlist/item" mode="s_numbering" priority="23">
  <xsl:number count="item" format="i." level="single"/>
</xsl:template>

<xsl:template match="enumlist//enumlist/item" mode="s_numbering" priority="18">
  <xsl:number count="item" format="a." level="single"/>
</xsl:template>

<xsl:template match="enumlist/item" mode="s_numbering" priority="2">
  <xsl:number count="item" format="1." level="single"/>
</xsl:template>
   
<xsl:template match="numlist/item" mode="s_numbering" priority="13">
  <xsl:number count="item" format="1." level="single"/>
</xsl:template>

<xsl:template match="pbfmatr/manual-title" mode="s_numbering" priority="3">
  <xsl:call-template name="t-numbering-pbfmatr-child"/>
</xsl:template>

<xsl:template match="pwcspblist/manual-title" mode="s_numbering" priority="2">
  <xsl:number count="pwcspblist[manual-title]" level="any" format="1"/>
</xsl:template>

<xsl:template match="pgblk/manual-title" mode="s_numbering" priority="1">
  <xsl:number count="pgblk[manual-title]" level="any" format="1"/>
</xsl:template>

<xsl:template match="manual-title" mode="s_numbering" priority="0">
  <xsl:param name="do-qmark" select="'yes'"/>
  <xsl:if test="$do-qmark='yes'">
     <xsl:value-of select="'?'"/>
  </xsl:if>
</xsl:template>

<xsl:template match="ata-page-block//_sfe:BeforeOrAfterText//_ufe:npara-numbering" mode="s_numbering" priority="2">
  <xsl:number count="_ufe:npara-numbering" from="ata-page-block" level="any" format="1."/>
</xsl:template>

<xsl:template match="page-block//_sfe:BeforeOrAfterText//_ufe:npara-numbering" mode="s_numbering" priority="1">
  <xsl:number count="_ufe:npara-numbering" from="page-block" level="any" format="1."/>
</xsl:template>

<xsl:template match="pgblk/_ufe:num-index-title" mode="s_numbering" priority="3">
  <xsl:number count="pgblk[_ufe:num-index-title]" level="any" format="1"/>
</xsl:template>

<xsl:template match="pbfmatr/_ufe:num-index-title" mode="s_numbering" priority="2">
  <xsl:call-template name="t-numbering-pbfmatr-child"/>
</xsl:template>

<xsl:template match="pwcspblist/_ufe:num-index-title" mode="s_numbering" priority="1">
  <xsl:number count="pwcspblist[_ufe:num-index-title]" level="any" format="1"/>
</xsl:template>

<xsl:template match="_ufe:num-index-title" mode="s_numbering" priority="0">
  <xsl:param name="do-qmark" select="'yes'"/>
  <xsl:if test="$do-qmark='yes'">
     <xsl:value-of select="'?'"/>
  </xsl:if>
</xsl:template>

<xsl:template match="pgblk/_ufe:nut-option-title" mode="s_numbering" priority="3">
  <xsl:number count="pgblk[_ufe:nut-option-title]" level="any" format="1"/>
</xsl:template>

<xsl:template match="pbfmatr/_ufe:nut-option-title" mode="s_numbering" priority="2">
  <xsl:call-template name="t-numbering-pbfmatr-child"/>
</xsl:template>

<xsl:template match="pwcspblist/_ufe:nut-option-title" mode="s_numbering" priority="1">
  <xsl:number count="pwcspblist[_ufe:nut-option-title]" level="any" format="1"/>
</xsl:template>

<xsl:template match="_ufe:nut-option-title" mode="s_numbering" priority="0">
  <xsl:param name="do-qmark" select="'yes'"/>
  <xsl:if test="$do-qmark='yes'">
     <xsl:value-of select="'?'"/>
  </xsl:if>
</xsl:template>

<xsl:template match="subpara/subpara/subpara/subpara/subpara[not(title)]/para" mode="s_numbering" priority="51">
  <xsl:number value="count(../preceding-sibling::subpara/para) + count(preceding-sibling::para) + 1" format="a"/>
</xsl:template>

<xsl:template match="subpara/subpara/subpara/subpara[not(title)]/para" mode="s_numbering" priority="50">
  <xsl:number value="count(../preceding-sibling::subpara/para) + count(preceding-sibling::para) + 1" format="1"/>
</xsl:template>

<xsl:template match="subpara/subpara/subpara[not(title)]/para" mode="s_numbering" priority="48">
  <xsl:number value="count(../preceding-sibling::subpara/para) + count(preceding-sibling::para) + 1" format="(a)"/>
</xsl:template>

<xsl:template match="subpara/subpara[not(title)]/para" mode="s_numbering" priority="47">
  <xsl:number value="count(../preceding-sibling::subpara/para) + count(preceding-sibling::para) + 1" format="(1)"/>
</xsl:template>

<xsl:template match="n-para/subpara/para" mode="s_numbering" priority="43">
  <xsl:number count="para[@_gte:count-as-id='cnt__para^n-para.cnt']" from="n-para" level="any" format="A."/>
</xsl:template>

<xsl:template match="pageblock-front/general//para" mode="s_numbering" priority="40">
  <xsl:number count="para[@_gte:count-as-id='cnt__para^general.cnt']" from="general" level="any" format="A."/>
</xsl:template>

<xsl:template match="n-para[ancestor::book[contains(@doctype, 'epc')]]/para" mode="s_numbering" priority="18">
  <xsl:number count="para" level="single" format="A."/>
</xsl:template>

<xsl:template match="taskproc/para" mode="s_numbering" priority="7">
  <xsl:number count="para" level="single" format="(1)"/>
</xsl:template>

<xsl:template match="tprereq/para" mode="s_numbering" priority="4">
  <xsl:number count="para" level="single" format="(1)"/>
</xsl:template>

<xsl:template match="numlist/part-group" mode="s_numbering" priority="2">
  <xsl:number count="part-group" format="1." level="single"/>
</xsl:template>

<xsl:template match="pgblk/_ufe:pdlist-title" mode="s_numbering" priority="1">
  <xsl:number count="pgblk[_ufe:pdlist-title]" level="any" format="1"/>
</xsl:template>

<xsl:template match="_ufe:pdlist-title" mode="s_numbering" priority="0">
  <xsl:param name="do-qmark" select="'yes'"/>
  <xsl:if test="$do-qmark='yes'">
     <xsl:value-of select="'?'"/>
  </xsl:if>
</xsl:template>

<xsl:template match="pgblk/_ufe:sblist-title" mode="s_numbering" priority="2">
  <xsl:number count="pgblk[_ufe:sblist-title]" level="any" format="1"/>
</xsl:template>

<xsl:template match="pbfmatr/_ufe:sblist-title" mode="s_numbering" priority="1">
  <xsl:call-template name="t-numbering-pbfmatr-child"/>
</xsl:template>

<xsl:template match="_ufe:sblist-title" mode="s_numbering" priority="0">
  <xsl:param name="do-qmark" select="'yes'"/>
  <xsl:if test="$do-qmark='yes'">
     <xsl:value-of select="'?'"/>
  </xsl:if>
</xsl:template>

<xsl:template match="pgblk/_ufe:spblist-title" mode="s_numbering" priority="2">
  <xsl:number count="pgblk[_ufe:spblist-title]" level="any" format="1"/>
</xsl:template>

<xsl:template match="pbfmatr/_ufe:spblist-title" mode="s_numbering" priority="1">
  <xsl:call-template name="t-numbering-pbfmatr-child"/>
</xsl:template>

<xsl:template match="_ufe:spblist-title" mode="s_numbering" priority="0">
  <xsl:param name="do-qmark" select="'yes'"/>
  <xsl:if test="$do-qmark='yes'">
     <xsl:value-of select="'?'"/>
  </xsl:if>
</xsl:template>

<xsl:template match="pgblk/_ufe:spectools-title" mode="s_numbering" priority="5">
  <xsl:number count="pgblk[_ufe:spectools-title]" level="any" format="1"/>
</xsl:template>

<xsl:template match="pbfmatr/_ufe:spectools-title" mode="s_numbering" priority="4">
  <xsl:call-template name="t-numbering-pbfmatr-child"/>
</xsl:template>

<xsl:template match="pwcspblist/_ufe:spectools-title" mode="s_numbering" priority="3">
  <xsl:number count="pwcspblist[_ufe:spectools-title]" level="any" format="1"/>
</xsl:template>

<xsl:template match="page-block//special-tools//_ufe:spectools-title" mode="s_numbering" priority="2">
  <xsl:call-template name="t-numbering-npara-page-block"/>
</xsl:template>

<xsl:template match="ata-page-block//special-tools//_ufe:spectools-title" mode="s_numbering" priority="1">
  <xsl:call-template name="t-numbering-npara-ata-page-block"/>
</xsl:template>

<xsl:template match="_ufe:spectools-title" mode="s_numbering" priority="0">
  <xsl:param name="do-qmark" select="'yes'"/>
  <xsl:if test="$do-qmark='yes'">
     <xsl:value-of select="'?'"/>
  </xsl:if>
</xsl:template>

<xsl:template match="pgblk/_ufe:supplier-list-title" mode="s_numbering" priority="3">
  <xsl:number count="pgblk[_ufe:supplier-list-title]" level="any" format="1"/>
</xsl:template>

<xsl:template match="pbfmatr/_ufe:supplier-list-title" mode="s_numbering" priority="2">
  <xsl:call-template name="t-numbering-pbfmatr-child"/>
</xsl:template>

<xsl:template match="pwcspblist/_ufe:supplier-list-title" mode="s_numbering" priority="1">
  <xsl:number count="pwcspblist[_ufe:supplier-list-title]" level="any" format="1"/>
</xsl:template>

<xsl:template match="_ufe:supplier-list-title" mode="s_numbering" priority="0">
  <xsl:param name="do-qmark" select="'yes'"/>
  <xsl:if test="$do-qmark='yes'">
     <xsl:value-of select="'?'"/>
  </xsl:if>
</xsl:template>

<xsl:template match="pgblk/_ufe:task-title" mode="s_numbering" priority="3">
  <xsl:number count="pgblk[_ufe:task-title]" level="any" format="1"/>
</xsl:template>

<xsl:template match="pbfmatr/_ufe:task-title" mode="s_numbering" priority="2">
  <xsl:call-template name="t-numbering-pbfmatr-child"/>
</xsl:template>

<xsl:template match="pbfmatr//_ufe:task-title" mode="s_numbering" priority="1">
  <xsl:choose>
    <xsl:when test="ancestor::pgblk">
      <xsl:number count="*[@_gte:count-as-id='task']" from="pgblk" level="any" format="1."/>
    </xsl:when>
    <xsl:otherwise>
      <xsl:number count="*[@_gte:count-as-id='task' and not(ancestor::pgblk)]" level="any" format="1."/>
    </xsl:otherwise>
  </xsl:choose>
</xsl:template>

<xsl:template match="_ufe:task-title" mode="s_numbering" priority="0">
  <xsl:param name="do-qmark" select="'yes'"/>
  <xsl:if test="$do-qmark='yes'">
     <xsl:value-of select="'?'"/>
  </xsl:if>
</xsl:template>

<xsl:template match="pgblk/_ufe:temp-rev-title" mode="s_numbering" priority="2">
  <xsl:number count="pgblk[_ufe:temp-rev-title]" level="any" format="1"/>
</xsl:template>

<xsl:template match="pbfmatr/_ufe:temp-rev-title" mode="s_numbering" priority="1">
  <xsl:call-template name="t-numbering-pbfmatr-child"/>
</xsl:template>

<xsl:template match="_ufe:temp-rev-title" mode="s_numbering" priority="0">
  <xsl:param name="do-qmark" select="'yes'"/>
  <xsl:if test="$do-qmark='yes'">
     <xsl:value-of select="'?'"/>
  </xsl:if>
</xsl:template>

<xsl:template match="subpara/subpara/subpara/subpara/subpara/title" mode="s_numbering" priority="72">
  <xsl:number count="subpara[title]" level="single" format="a"/>
</xsl:template>

<xsl:template match="subpara/subpara/subpara/subpara/title" mode="s_numbering" priority="71">
  <xsl:number count="subpara[title]" level="single" format="1"/>
</xsl:template>

<xsl:template match="subpara/subpara/subpara/title" mode="s_numbering" priority="70">
  <xsl:number count="subpara[title]" level="single" format="(a)"/>
</xsl:template>

<xsl:template match="subpara/subpara/title" mode="s_numbering" priority="57">
  <xsl:number count="subpara[title]" level="single" format="(1)"/>
</xsl:template>

<xsl:template match="subpara/title" mode="s_numbering" priority="38">
  <xsl:choose>
    <xsl:when test="ancestor::n-para">
      <xsl:number count="subpara/title[@_gte:count-as-id='subpara']|procedure/title[@_gte:count-as-id='subpara']" 
                  from="n-para" level="any" format="A."/>
    </xsl:when>
    <xsl:otherwise>
      <xsl:number count="subpara/title[@_gte:count-as-id='subpara' and not(ancestor::n-para)]|procedure/title[@_gte:count-as-id='subpara' and not(ancestor::n-para)]" 
                  level="any" format="A."/>
    </xsl:otherwise>
  </xsl:choose>
</xsl:template>
   
<xsl:template match="book[contains(@doctype, 'epc')]/frontmatter//graphic/title" mode="s_numbering" priority="69">
  <xsl:for-each select="..">
    <xsl:number count="graphic[title]" from="frontmatter" level="any" format="1"/>
  </xsl:for-each>
</xsl:template>

<xsl:template match="book[contains(@doctype, 'ipc')]/frontmatter//figure/title" mode="s_numbering" priority="68">
  <xsl:for-each select="..">
    <xsl:number count="figure[title]|ipc-fig-reloc[title]" level="single" format="1"/>
  </xsl:for-each>
</xsl:template>

<xsl:template match="book[contains(@doctype, 'ipc')]/frontmatter//ipc-fig-reloc/title" mode="s_numbering" priority="68">
  <xsl:for-each select="..">
    <xsl:number count="figure[title]|ipc-fig-reloc[title]" level="single" format="1"/>
  </xsl:for-each>
</xsl:template>

<xsl:template name="t-numbering-ata-page-block-task-graphic">
  <xsl:number count="*[@_gte:count-as-id='cnt__graphic^ata-page-block.cnt']" 
              from="ata-page-block" level="any" format="1"/>
</xsl:template>

<xsl:template name="t-numbering-ata-page-block-task-graphic-offset">
  <xsl:param name="offset"/>
  <xsl:variable name="id" select="ancestor::ata-page-block/@_gte:id"/>
  <xsl:variable name="num" select="count(preceding::*[@_gte:count-as-id='cnt__graphic^ata-page-block.cnt' and ancestor::ata-page-block/@_gte:id=$id])+1"/>
  <xsl:number value="$num + $offset - 1" format="1"/>
</xsl:template>

<xsl:template match="ata-page-block//task/graphic/title" mode="s_numbering" priority="67">
  <xsl:choose>
     <xsl:when test="&anc-pgblk-0-13;">
        <xsl:call-template name="t-numbering-ata-page-block-task-graphic-offset">
          <xsl:with-param name="offset" select="number(concat(number(ancestor::pgblk/@pgblknbr),'01'))"/>
        </xsl:call-template>
     </xsl:when>
     <xsl:otherwise>
        <xsl:call-template name="t-numbering-ata-page-block-task-graphic"/>
     </xsl:otherwise>
  </xsl:choose>
</xsl:template>
   
<xsl:template name="t-numbering-page-block-task-graphic">
  <xsl:number count="*[@_gte:count-as-id='cnt__graphic^page-block.cnt']" from="page-block" level="any" format="1"/>
</xsl:template>

<xsl:template name="t-numbering-page-block-task-graphic-offset">
  <xsl:param name="offset"/>
  <xsl:variable name="id" select="ancestor::page-block/@_gte:id"/>
  <xsl:variable name="num" select="count(preceding::*[@_gte:count-as-id='cnt__graphic^page-block.cnt' and ancestor::page-block/@_gte:id=$id])+1"/>
  <xsl:number value="$num + $offset - 1" format="1"/>
</xsl:template>

<xsl:template match="page-block//task/graphic/title" mode="s_numbering" priority="66">
  <xsl:choose>
     <xsl:when test="&anc-pgblk-0-13;">
        <xsl:call-template name="t-numbering-page-block-task-graphic-offset">
          <xsl:with-param name="offset" select="number(concat(number(ancestor::pgblk/@pgblknbr),'01'))"/>
        </xsl:call-template>
     </xsl:when>
     <xsl:otherwise>
        <xsl:call-template name="t-numbering-page-block-task-graphic"/>
     </xsl:otherwise>
  </xsl:choose>
</xsl:template>

<xsl:template match="module[@module-name='Airworthiness_Limits']/pgblk/title" mode="s_numbering" priority="65">
  <xsl:param name="do-qmark" select="'yes'"/>
  <xsl:if test="$do-qmark='yes'">
     <xsl:value-of select="'?'"/>
  </xsl:if>
</xsl:template>

<xsl:template match="page-block[@pb-name='glossary']/module/title" mode="s_numbering" priority="61">
  <xsl:call-template name="t-numbering-npara-page-block"/>
</xsl:template>

<xsl:template match="page-block[@pb-name='supp_list']/module/title" mode="s_numbering" priority="60">
  <xsl:call-template name="t-numbering-npara-page-block"/>
</xsl:template>

<xsl:template match="mm-fits/subpara/title" mode="s_numbering" priority="62">
  <xsl:number value="count(../preceding-sibling::subpara[title])+1" format="A."/>
</xsl:template>

<xsl:template match="prcitem4/prcitem/title" mode="s_numbering" priority="60">
  <xsl:number count="prcitem4/prcitem[title]" from="prclist4" level="any" format="1."/>
</xsl:template>

<xsl:template match="prcitem3/prcitem/title" mode="s_numbering" priority="60">
  <xsl:number count="prcitem3/prcitem[title]" from="prclist3" level="any" format="(1)"/>
</xsl:template>

<xsl:template match="prcitem2/prcitem/title" mode="s_numbering" priority="59">
  <xsl:number count="prcitem2/prcitem[title]" from="prclist2" level="any" format="A."/>
</xsl:template>

<xsl:template match="prcitem1/prcitem/title" mode="s_numbering" priority="55">
  <xsl:number count="prcitem1/prcitem[title]" from="prclist1" level="any" format="1."/>
</xsl:template>

<xsl:template match="page-block[@pb-name='ni']//mfmatr/title" mode="s_numbering" priority="56">
  <xsl:param name="do-qmark" select="'yes'"/>
  <xsl:if test="$do-qmark='yes'">
     <xsl:value-of select="'?'"/>
  </xsl:if>
</xsl:template>

<xsl:template match="page-block[@pb-name='record-of-revisions']//n-para/title" mode="s_numbering" priority="55">
  <xsl:param name="do-qmark" select="'yes'"/>
  <xsl:if test="$do-qmark='yes'">
     <xsl:value-of select="'?'"/>
  </xsl:if>
</xsl:template>

<xsl:template match="book[contains(@doctype, 'epc')]//figure/title" mode="s_numbering" priority="54">
  <xsl:param name="do-qmark" select="'yes'"/>
  <xsl:if test="$do-qmark='yes'">
     <xsl:value-of select="'?'"/>
  </xsl:if>
</xsl:template>

<xsl:template match="book[contains(@doctype, 'epc')]//graphic/title" mode="s_numbering" priority="53">
  <xsl:param name="do-qmark" select="'yes'"/>
  <xsl:if test="$do-qmark='yes'">
     <xsl:value-of select="'?'"/>
  </xsl:if>
</xsl:template>

<xsl:template match="book[contains(@doctype, 'ipc')]//figure/title" mode="s_numbering" priority="52">
  <xsl:param name="do-qmark" select="'yes'"/>
  <xsl:if test="$do-qmark='yes'">
     <xsl:value-of select="'?'"/>
  </xsl:if>
</xsl:template>

<xsl:template match="book[contains(@doctype, 'ipc')]//ipc-fig-reloc/title" mode="s_numbering" priority="52">
  <xsl:param name="do-qmark" select="'yes'"/>
  <xsl:if test="$do-qmark='yes'">
     <xsl:value-of select="'?'"/>
  </xsl:if>
</xsl:template>

<xsl:template name="t-numbering-task-table">
  <xsl:choose>
    <xsl:when test="ancestor::pgblk">
      <xsl:number count="*[@_gte:count-as-id='cnt__table^pgblk.cnt']" from="pgblk" level="any" format="1"/>
    </xsl:when>
    <xsl:otherwise>
      <xsl:number count="*[@_gte:count-as-id='cnt__table^pgblk.cnt' and not(ancestor::pgblk)]" level="any" format="1"/>
    </xsl:otherwise>
  </xsl:choose>
</xsl:template>

<xsl:template name="t-numbering-task-table-offset">
  <xsl:param name="offset"/>
  <xsl:variable name="num">
    <xsl:choose>
      <xsl:when test="ancestor::pgblk">
        <xsl:variable name="id" select="ancestor::pgblk/@_gte:id"/>
        <xsl:value-of select="count(preceding::*[@_gte:count-as-id='cnt__table^pgblk.cnt' and ancestor::pgblk/@_gte:id=$id])+1"/>
      </xsl:when>
      <xsl:otherwise>
        <xsl:value-of select="count(preceding::*[@_gte:count-as-id='cnt__table^pgblk.cnt' and not(ancestor::pgblk)])+1"/>
      </xsl:otherwise>
    </xsl:choose>
  </xsl:variable>
  <xsl:number value="$num + $offset - 1" format="1"/>
</xsl:template>

<xsl:template match="task//table/title" mode="s_numbering" priority="51">
  <xsl:choose>
     <xsl:when test="&anc-pgblk-0-13;">
        <xsl:call-template name="t-numbering-task-table-offset">
          <xsl:with-param name="offset" select="number(concat(number(ancestor::pgblk/@pgblknbr),'01'))"/>
        </xsl:call-template>
     </xsl:when>
     <xsl:otherwise>
        <xsl:call-template name="t-numbering-task-table"/>
     </xsl:otherwise>
  </xsl:choose>
</xsl:template>

<xsl:template match="page-block//graphic/title" mode="s_numbering" priority="50">
  <xsl:choose>
     <xsl:when test="not(&anc-pgblk-0-13;)">
        <xsl:call-template name="t-numbering-page-block-task-graphic"/>
     </xsl:when>
     <xsl:when test="&anc-pgblk-0-13;">
        <xsl:call-template name="t-numbering-page-block-task-graphic-offset">
          <xsl:with-param name="offset" select="number(concat(number(ancestor::pgblk/@pgblknbr),'01'))"/>
        </xsl:call-template>
     </xsl:when>
  </xsl:choose>
</xsl:template>
   
<xsl:template match="ata-page-block//graphic/title" mode="s_numbering" priority="49">
  <xsl:choose>
     <xsl:when test="not(&anc-pgblk-0-13;)">
        <xsl:call-template name="t-numbering-ata-page-block-task-graphic"/>
     </xsl:when>
     <xsl:when test="&anc-pgblk-0-13;">
        <xsl:call-template name="t-numbering-ata-page-block-task-graphic-offset">
          <xsl:with-param name="offset" select="number(concat(number(ancestor::pgblk/@pgblknbr),'01'))"/>
        </xsl:call-template>
     </xsl:when>
  </xsl:choose>
</xsl:template>

<xsl:template match="page-block//mm-fits/title" mode="s_numbering" priority="47">
  <xsl:call-template name="t-numbering-npara-page-block"/>
</xsl:template>

<xsl:template match="ata-page-block//mm-fits/title" mode="s_numbering" priority="46">
  <xsl:call-template name="t-numbering-npara-ata-page-block"/>
</xsl:template>

<xsl:template match="ata-page-block//fits-and-clears/title" mode="s_numbering" priority="46">
  <xsl:call-template name="t-numbering-npara-ata-page-block"/>
</xsl:template>

<xsl:template match="page-block//fits-and-clears/title" mode="s_numbering" priority="45">
  <xsl:call-template name="t-numbering-npara-page-block"/>
</xsl:template>

<xsl:template match="ata-page-block//n-para/title" mode="s_numbering" priority="43">
  <xsl:call-template name="t-numbering-npara-ata-page-block"/>
</xsl:template>

<xsl:template match="page-block//n-para/title" mode="s_numbering" priority="42">
  <xsl:call-template name="t-numbering-npara-page-block"/>
</xsl:template>

<xsl:template name="t-numbering-figure-wrapper">
  <xsl:choose>
    <xsl:when test="ancestor::page-block"><xsl:call-template name="t-numbering-figure"/></xsl:when>
    <xsl:otherwise><xsl:call-template name="t-numbering-figure-ata"/></xsl:otherwise>
  </xsl:choose>
</xsl:template>

<xsl:template name="t-numbering-figure">
  <xsl:choose>
    <xsl:when test="ancestor::page-block">
      <xsl:number count="*[@_gte:count-as-id='cnt__figure^page-block.cnt']" from="page-block" level="any" format="1"/>
    </xsl:when>
    <xsl:otherwise>
      <xsl:number count="*[@_gte:count-as-id='cnt__figure^page-block.cnt' and not(ancestor::page-block)]" level="any" format="1"/>
    </xsl:otherwise>
  </xsl:choose>
</xsl:template>

<xsl:template name="t-numbering-figure-ata">
  <xsl:choose>
    <xsl:when test="ancestor::ata-page-block">
      <xsl:number count="*[@_gte:count-as-id='cnt__figure^ata-page-block.cnt']" from="ata-page-block" level="any" format="1"/>
    </xsl:when>
    <xsl:otherwise>
      <xsl:number count="*[@_gte:count-as-id='cnt__figure^ata-page-block.cnt' and not(ancestor::ata-page-block)]" level="any" format="1"/>
    </xsl:otherwise>
  </xsl:choose>
</xsl:template>

<xsl:template name="t-numbering-figure-offset-wrapper">
  <xsl:param name="offset"/>
  <xsl:choose>
    <xsl:when test="ancestor::page-block">
      <xsl:call-template name="t-numbering-figure-offset">
        <xsl:with-param name="offset" select="$offset"/>
      </xsl:call-template>
    </xsl:when>
    <xsl:otherwise>
      <xsl:call-template name="t-numbering-figure-offset-ata">
        <xsl:with-param name="offset" select="$offset"/>
      </xsl:call-template>
    </xsl:otherwise>
  </xsl:choose>
</xsl:template>

<xsl:template name="t-numbering-figure-offset">
  <xsl:param name="offset"/>
  <xsl:variable name="num">
    <xsl:choose>
      <xsl:when test="ancestor::page-block">
        <xsl:variable name="id" select="ancestor::page-block/@_gte:id"/>
        <xsl:value-of select="count(preceding::*[@_gte:count-as-id='cnt__figure^page-block.cnt' and ancestor::page-block/@_gte:id=$id])+1"/>
      </xsl:when>
      <xsl:otherwise>
        <xsl:value-of select="count(preceding::*[@_gte:count-as-id='cnt__figure^page-block.cnt' and not(ancestor::page-block)])+1"/>
      </xsl:otherwise>
    </xsl:choose>
  </xsl:variable>
  <xsl:number value="$num + $offset - 1" format="1"/>
</xsl:template>

<xsl:template name="t-numbering-figure-offset-ata">
  <xsl:param name="offset"/>
  <xsl:variable name="num">
    <xsl:choose>
      <xsl:when test="ancestor::ata-page-block">
        <xsl:variable name="id" select="ancestor::ata-page-block/@_gte:id"/>
        <xsl:value-of select="count(preceding::*[@_gte:count-as-id='cnt__figure^ata-page-block.cnt' and ancestor::ata-page-block/@_gte:id=$id])+1"/>
      </xsl:when>
      <xsl:otherwise>
        <xsl:value-of select="count(preceding::*[@_gte:count-as-id='cnt__figure^ata-page-block.cnt' and not(ancestor::ata-page-block)])+1"/>
      </xsl:otherwise>
    </xsl:choose>
  </xsl:variable>
  <xsl:number value="$num + $offset - 1" format="1"/>
</xsl:template>

<xsl:template match="figure/title" mode="s_numbering" priority="41">
  <xsl:choose>
    <xsl:when test="&pb-01;">
    </xsl:when>
    <xsl:when test="&pb-02;">
      <xsl:call-template name="t-numbering-figure-wrapper"/>
    </xsl:when>
    <xsl:when test="&pb-03;">
      <xsl:call-template name="t-numbering-figure-wrapper"/>
    </xsl:when>
    <xsl:when test="&pb-04;">
      <xsl:call-template name="t-numbering-figure-offset-wrapper">
        <xsl:with-param name="offset" select="number('100')"/>
      </xsl:call-template>
    </xsl:when>
    <xsl:when test="&pb-05;">
      <xsl:call-template name="t-numbering-figure-offset-wrapper">
        <xsl:with-param name="offset" select="number('101')"/>
      </xsl:call-template>
    </xsl:when>
    <xsl:when test="&pb-06;">
      <xsl:call-template name="t-numbering-figure-offset-wrapper">
        <xsl:with-param name="offset" select="number('201')"/>
      </xsl:call-template>
    </xsl:when>
    <xsl:when test="&pb-07;">
      <xsl:call-template name="t-numbering-figure-offset-wrapper">
        <xsl:with-param name="offset" select="number('201')"/>
      </xsl:call-template>
    </xsl:when>
    <xsl:when test="&pb-08;">
      <xsl:call-template name="t-numbering-figure-offset-wrapper">
        <xsl:with-param name="offset" select="number('301')"/>
      </xsl:call-template>
    </xsl:when>
    <xsl:when test="&pb-09;">
      <xsl:call-template name="t-numbering-figure-offset-wrapper">
        <xsl:with-param name="offset" select="number('301')"/>
      </xsl:call-template>
    </xsl:when>
    <xsl:when test="&pb-10;">
      <xsl:call-template name="t-numbering-figure-offset-wrapper">
        <xsl:with-param name="offset" select="number('401')"/>
      </xsl:call-template>
    </xsl:when>
    <xsl:when test="&pb-11;">
      <xsl:call-template name="t-numbering-figure-offset-wrapper">
        <xsl:with-param name="offset" select="number('701')"/>
      </xsl:call-template>
    </xsl:when>
    <xsl:when test="&pb-12;">
      <xsl:call-template name="t-numbering-figure-offset-wrapper">
        <xsl:with-param name="offset" select="number('401')"/>
      </xsl:call-template>
    </xsl:when>
    <xsl:when test="&pb-13;">
      <xsl:call-template name="t-numbering-figure-offset-wrapper">
        <xsl:with-param name="offset" select="number('501')"/>
      </xsl:call-template>
    </xsl:when>
    <xsl:when test="&pb-14;">
      <xsl:call-template name="t-numbering-figure-offset-wrapper">
        <xsl:with-param name="offset" select="number('601')"/>
      </xsl:call-template>
    </xsl:when>
    <xsl:when test="&pb-15;">
      <xsl:call-template name="t-numbering-figure-offset-wrapper">
        <xsl:with-param name="offset" select="number('701')"/>
      </xsl:call-template>
    </xsl:when>
    <xsl:when test="&pb-16;">
      <xsl:call-template name="t-numbering-figure-offset-wrapper">
        <xsl:with-param name="offset" select="number('801')"/>
      </xsl:call-template>
    </xsl:when>
    <xsl:when test="&pb-17;">
      <xsl:call-template name="t-numbering-figure-offset-wrapper">
        <xsl:with-param name="offset" select="number('901')"/>
      </xsl:call-template>
    </xsl:when>
    <xsl:when test="&pb-18;">
      <xsl:call-template name="t-numbering-figure-offset-wrapper">
        <xsl:with-param name="offset" select="number('1301')"/>
      </xsl:call-template>
    </xsl:when>
  </xsl:choose>
</xsl:template>

<xsl:template match="pwcpbfront/title" mode="s_numbering" priority="39">
  <xsl:param name="do-qmark" select="'yes'"/>
  <xsl:if test="$do-qmark='yes'">
     <xsl:value-of select="'?'"/>
  </xsl:if>
</xsl:template>

<xsl:template match="procedure/title" mode="s_numbering" priority="37">
  <xsl:choose>
    <xsl:when test="ancestor::n-para">
      <xsl:number count="subpara/title[@_gte:count-as-id='subpara']|procedure/title[@_gte:count-as-id='subpara']" 
                  from="n-para" level="any" format="A."/>
    </xsl:when>
    <xsl:otherwise>
      <xsl:number count="subpara/title[@_gte:count-as-id='subpara' and not(ancestor::n-para)]|procedure/title[@_gte:count-as-id='subpara' and not(ancestor::n-para)]" 
                  level="any" format="A."/>
    </xsl:otherwise>
  </xsl:choose>
</xsl:template>

<xsl:template match="pwcspblist/title" mode="s_numbering" priority="35">
  <xsl:param name="do-qmark" select="'yes'"/>
  <xsl:if test="$do-qmark='yes'">
     <xsl:value-of select="'?'"/>
  </xsl:if>
</xsl:template>

<xsl:template name="t-numbering-subtask">
  <xsl:choose>
    <xsl:when test="ancestor::task">
      <xsl:number count="*[@_gte:count-as-id='subtask']" from="task" level="any" format="A."/>
    </xsl:when>
    <xsl:otherwise>
      <xsl:number count="*[@_gte:count-as-id='subtask' and not(ancestor::task)]" level="any" format="A."/>
    </xsl:otherwise>
  </xsl:choose>
</xsl:template>

<xsl:template match="taskproc/title" mode="s_numbering" priority="34">
  <xsl:call-template name="t-numbering-subtask"/>
</xsl:template>

<xsl:template match="nutopt/title" mode="s_numbering" priority="32">
  <xsl:number count="nutopt[title]" format="1."/>
</xsl:template>

<xsl:template match="sblist/title" mode="s_numbering" priority="32">
  <xsl:param name="do-qmark" select="'yes'"/>
  <xsl:if test="$do-qmark='yes'">
     <xsl:value-of select="'?'"/>
  </xsl:if>
</xsl:template>

<xsl:template match="pwcni/title" mode="s_numbering" priority="31">
  <xsl:param name="do-qmark" select="'yes'"/>
  <xsl:if test="$do-qmark='yes'">
     <xsl:value-of select="'?'"/>
  </xsl:if>
</xsl:template>

<xsl:template match="vendlist/title" mode="s_numbering" priority="30">
  <xsl:param name="do-qmark" select="'yes'"/>
  <xsl:if test="$do-qmark='yes'">
     <xsl:value-of select="'?'"/>
  </xsl:if>
</xsl:template>

<xsl:template match="pgblk/title" mode="s_numbering" priority="29">
  <xsl:param name="do-qmark" select="'yes'"/>
  <xsl:if test="$do-qmark='yes'">
     <xsl:value-of select="'?'"/>
  </xsl:if>
</xsl:template>

<xsl:template match="pwcchapsect-item/title" mode="s_numbering" priority="28">
  <xsl:param name="do-qmark" select="'yes'"/>
  <xsl:if test="$do-qmark='yes'">
     <xsl:value-of select="'?'"/>
  </xsl:if>
</xsl:template>

<xsl:template match="tprereq/title" mode="s_numbering" priority="27">
  <xsl:call-template name="t-numbering-subtask"/>
</xsl:template>

<xsl:template match="subtask/title" mode="s_numbering" priority="26">
  <xsl:call-template name="t-numbering-subtask"/>
</xsl:template>

<xsl:template match="fits/title" mode="s_numbering" priority="25">
  <xsl:param name="do-qmark" select="'yes'"/>
  <xsl:if test="$do-qmark='yes'">
     <xsl:value-of select="'?'"/>
  </xsl:if>
</xsl:template>

<xsl:template match="task/title" mode="s_numbering" priority="24">
  <xsl:choose>
    <xsl:when test="ancestor::pgblk">
      <xsl:number count="*[@_gte:count-as-id='task']" from="pgblk" level="any" format="1."/>
    </xsl:when>
    <xsl:otherwise>
      <xsl:number count="*[@_gte:count-as-id='task' and not(ancestor::pgblk)]" level="any" format="1."/>
    </xsl:otherwise>
  </xsl:choose>
</xsl:template>

<xsl:template match="highlights/title" mode="s_numbering" priority="22">
  <xsl:param name="do-qmark" select="'yes'"/>
  <xsl:if test="$do-qmark='yes'">
     <xsl:value-of select="'?'"/>
  </xsl:if>
</xsl:template>

<xsl:template match="lof-item/title" mode="s_numbering" priority="21">
  <xsl:param name="do-qmark" select="'yes'"/>
  <xsl:if test="$do-qmark='yes'">
     <xsl:value-of select="'?'"/>
  </xsl:if>
</xsl:template>

<xsl:template match="lot-item/title" mode="s_numbering" priority="20">
  <xsl:param name="do-qmark" select="'yes'"/>
  <xsl:if test="$do-qmark='yes'">
     <xsl:value-of select="'?'"/>
  </xsl:if>
</xsl:template>

<xsl:template match="lot/title" mode="s_numbering" priority="19">
  <xsl:param name="do-qmark" select="'yes'"/>
  <xsl:if test="$do-qmark='yes'">
     <xsl:value-of select="'?'"/>
  </xsl:if>
</xsl:template>

<xsl:template match="lof/title" mode="s_numbering" priority="18">
  <xsl:param name="do-qmark" select="'yes'"/>
  <xsl:if test="$do-qmark='yes'">
     <xsl:value-of select="'?'"/>
  </xsl:if>
</xsl:template>

<xsl:template match="table//procedure//title" mode="s_numbering" priority="17">
  <xsl:param name="do-qmark" select="'yes'"/>
  <xsl:if test="$do-qmark='yes'">
     <xsl:value-of select="'?'"/>
  </xsl:if>
</xsl:template>

<xsl:template match="torque-and-stretch/title" mode="s_numbering" priority="16">
  <xsl:param name="do-qmark" select="'yes'"/>
  <xsl:if test="$do-qmark='yes'">
     <xsl:value-of select="'?'"/>
  </xsl:if>
</xsl:template>

<xsl:template match="spec-tool-table/title" mode="s_numbering" priority="15">
  <xsl:number count="spec-tool-table[title]" format="1"/>
</xsl:template>

<xsl:template match="spb-list/title" mode="s_numbering" priority="14">
  <xsl:param name="do-qmark" select="'yes'"/>
  <xsl:if test="$do-qmark='yes'">
     <xsl:value-of select="'?'"/>
  </xsl:if>
</xsl:template>

<xsl:template match="subject/title" mode="s_numbering" priority="13">
  <xsl:param name="do-qmark" select="'yes'"/>
  <xsl:if test="$do-qmark='yes'">
     <xsl:value-of select="'?'"/>
  </xsl:if>
</xsl:template>

<xsl:template match="section/title" mode="s_numbering" priority="12">
  <xsl:param name="do-qmark" select="'yes'"/>
  <xsl:if test="$do-qmark='yes'">
     <xsl:value-of select="'?'"/>
  </xsl:if>
</xsl:template>

<xsl:template match="page-block/title" mode="s_numbering" priority="11">
  <xsl:variable name="previous-node" select="ancestor::frontmatter"/>
  <xsl:choose>
     <xsl:when test="boolean($previous-node)">
        <xsl:apply-templates mode="s_numbering" select="$previous-node"/>
     </xsl:when>
     <xsl:otherwise>?</xsl:otherwise>
  </xsl:choose>
  <xsl:text>.</xsl:text>
  <xsl:number count="page-block[title]" format="1"/>
</xsl:template>

<xsl:template match="service-bull-list/title" mode="s_numbering" priority="10">
  <xsl:param name="do-qmark" select="'yes'"/>
  <xsl:if test="$do-qmark='yes'">
     <xsl:value-of select="'?'"/>
  </xsl:if>
</xsl:template>

<xsl:template match="module/title" mode="s_numbering" priority="9">
  <xsl:param name="do-qmark" select="'yes'"/>
  <xsl:if test="$do-qmark='yes'">
     <xsl:value-of select="'?'"/>
  </xsl:if>
</xsl:template>

<xsl:template match="frontmatter/title" mode="s_numbering" priority="8">
  <xsl:number count="frontmatter[title]" format="1"/>
</xsl:template>

<xsl:template match="num-index/title" mode="s_numbering" priority="7">
  <xsl:param name="do-qmark" select="'yes'"/>
  <xsl:if test="$do-qmark='yes'">
     <xsl:value-of select="'?'"/>
  </xsl:if>
</xsl:template>

<xsl:template name="t-numbering-table-wrapper">
  <xsl:choose>
    <xsl:when test="ancestor::page-block">
      <xsl:call-template name="t-numbering-table"/>
    </xsl:when>
    <xsl:otherwise>
      <xsl:call-template name="t-numbering-table-ata"/>
    </xsl:otherwise>
  </xsl:choose>
</xsl:template>

<xsl:template name="t-numbering-table">
  <xsl:choose>
    <xsl:when test="ancestor::page-block">
      <xsl:number count="*[@_gte:count-as-id='cnt__table^page-block.cnt']" from="page-block" level="any" format="1"/>
    </xsl:when>
    <xsl:otherwise>
      <xsl:number count="*[@_gte:count-as-id='cnt__table^page-block.cnt' and not(ancestor::page-block)]" level="any" format="1"/>
    </xsl:otherwise>
  </xsl:choose>
</xsl:template>

<xsl:template name="t-numbering-table-ata">
  <xsl:choose>
    <xsl:when test="ancestor::ata-page-block">
      <xsl:number count="*[@_gte:count-as-id='cnt__table^ata-page-block.cnt']" from="ata-page-block" level="any" format="1"/>
    </xsl:when>
    <xsl:otherwise>
      <xsl:number count="*[@_gte:count-as-id='cnt__table^ata-page-block.cnt' and not(ancestor::ata-page-block)]" level="any" format="1"/>
    </xsl:otherwise>
  </xsl:choose>
</xsl:template>

<xsl:template name="t-numbering-table-offset-wrapper">
  <xsl:param name="offset"/>
  <xsl:choose>
    <xsl:when test="ancestor::page-block">
      <xsl:call-template name="t-numbering-table-offset">
        <xsl:with-param name="offset" select="$offset"/>
      </xsl:call-template>
    </xsl:when>
    <xsl:otherwise>
      <xsl:call-template name="t-numbering-table-offset-ata">
        <xsl:with-param name="offset" select="$offset"/>
      </xsl:call-template>
    </xsl:otherwise>
  </xsl:choose>
</xsl:template>

<xsl:template name="t-numbering-table-offset">
  <xsl:param name="offset"/>
  <xsl:variable name="num">
    <xsl:choose>
      <xsl:when test="ancestor::page-block">
        <xsl:variable name="id" select="ancestor::page-block/@_gte:id"/>
        <xsl:value-of select="count(preceding::*[@_gte:count-as-id='cnt__table^page-block.cnt' and ancestor::page-block/@_gte:id=$id])+1"/>
      </xsl:when>
      <xsl:otherwise>
        <xsl:value-of select="count(preceding::*[@_gte:count-as-id='cnt__table^page-block.cnt' and not(ancestor::page-block)])+1"/>
      </xsl:otherwise>
    </xsl:choose>
  </xsl:variable>
  <xsl:number value="$num + $offset - 1" format="1"/>
</xsl:template>

<xsl:template name="t-numbering-table-offset-ata">
  <xsl:param name="offset"/>
  <xsl:variable name="num">
    <xsl:choose>
      <xsl:when test="ancestor::ata-page-block">
        <xsl:variable name="id" select="ancestor::ata-page-block/@_gte:id"/>
        <xsl:value-of select="count(preceding::*[@_gte:count-as-id='cnt__table^ata-page-block.cnt' and ancestor::ata-page-block/@_gte:id=$id])+1"/>
      </xsl:when>
      <xsl:otherwise>
        <xsl:value-of select="count(preceding::*[@_gte:count-as-id='cnt__table^ata-page-block.cnt' and not(ancestor::ata-page-block)])+1"/>
      </xsl:otherwise>
    </xsl:choose>
  </xsl:variable>
  <xsl:number value="$num + $offset - 1" format="1"/>
</xsl:template>

<xsl:template match="table/title" mode="s_numbering" priority="6">
  <xsl:choose>
    <xsl:when test="(&anc-doc-cir-em-tmm;) and (&anc-pgblk-0-13;)">
      <xsl:call-template name="t-numbering-task-table-offset">
        <xsl:with-param name="offset" select="number(concat(number(ancestor::pgblk/@pgblknbr),'01'))"/>
      </xsl:call-template>
    </xsl:when>
    <xsl:when test="(&anc-doc-cir-em-tmm;)">
      <xsl:call-template name="t-numbering-task-table"/>
    </xsl:when>
    <xsl:when test="&pb-01;">
    </xsl:when>
    <xsl:when test="&pb-02;">
      <xsl:call-template name="t-numbering-table-wrapper"/>
    </xsl:when>
    <xsl:when test="&pb-03;">
      <xsl:call-template name="t-numbering-table-wrapper"/>
    </xsl:when>
    <xsl:when test="&pb-04;">
        <xsl:call-template name="t-numbering-table-offset-wrapper">
          <xsl:with-param name="offset" select="number('100')"/>
        </xsl:call-template>
    </xsl:when>
    <xsl:when test="&pb-05;">
        <xsl:call-template name="t-numbering-table-offset-wrapper">
          <xsl:with-param name="offset" select="number('101')"/>
        </xsl:call-template>
    </xsl:when>
    <xsl:when test="&pb-06;">
        <xsl:call-template name="t-numbering-table-offset-wrapper">
          <xsl:with-param name="offset" select="number('201')"/>
        </xsl:call-template>
    </xsl:when>
    <xsl:when test="&pb-07;">
        <xsl:call-template name="t-numbering-table-offset-wrapper">
          <xsl:with-param name="offset" select="number('201')"/>
        </xsl:call-template>
    </xsl:when>
    <xsl:when test="&pb-08;">
        <xsl:call-template name="t-numbering-table-offset-wrapper">
          <xsl:with-param name="offset" select="number('301')"/>
        </xsl:call-template>
    </xsl:when>
    <xsl:when test="&pb-09;">
        <xsl:call-template name="t-numbering-table-offset-wrapper">
          <xsl:with-param name="offset" select="number('301')"/>
        </xsl:call-template>
    </xsl:when>
    <xsl:when test="&pb-10;">
        <xsl:call-template name="t-numbering-table-offset-wrapper">
          <xsl:with-param name="offset" select="number('401')"/>
        </xsl:call-template>
    </xsl:when>
    <xsl:when test="&pb-11;">
        <xsl:call-template name="t-numbering-table-offset-wrapper">
          <xsl:with-param name="offset" select="number('701')"/>
        </xsl:call-template>
    </xsl:when>
    <xsl:when test="&pb-12;">
        <xsl:call-template name="t-numbering-table-offset-wrapper">
          <xsl:with-param name="offset" select="number('401')"/>
        </xsl:call-template>
    </xsl:when>
    <xsl:when test="&pb-13;">
        <xsl:call-template name="t-numbering-table-offset-wrapper">
          <xsl:with-param name="offset" select="number('501')"/>
        </xsl:call-template>
    </xsl:when>
    <xsl:when test="&pb-14;">
        <xsl:call-template name="t-numbering-table-offset-wrapper">
          <xsl:with-param name="offset" select="number('601')"/>
        </xsl:call-template>
    </xsl:when>
    <xsl:when test="&pb-15;">
        <xsl:call-template name="t-numbering-table-offset-wrapper">
          <xsl:with-param name="offset" select="number('701')"/>
        </xsl:call-template>
    </xsl:when>
    <xsl:when test="&pb-16;">
        <xsl:call-template name="t-numbering-table-offset-wrapper">
          <xsl:with-param name="offset" select="number('801')"/>
        </xsl:call-template>
    </xsl:when>
    <xsl:when test="&pb-17;">
        <xsl:call-template name="t-numbering-table-offset-wrapper">
          <xsl:with-param name="offset" select="number('901')"/>
        </xsl:call-template>
    </xsl:when>
    <xsl:when test="&pb-18;">
        <xsl:call-template name="t-numbering-table-offset-wrapper">
          <xsl:with-param name="offset" select="number('1301')"/>
        </xsl:call-template>
    </xsl:when>
    <xsl:otherwise></xsl:otherwise>
  </xsl:choose>
</xsl:template>

<xsl:template match="chapter/title" mode="s_numbering" priority="4">
  <xsl:param name="do-qmark" select="'yes'"/>
  <xsl:if test="$do-qmark='yes'">
     <xsl:value-of select="'?'"/>
  </xsl:if>
</xsl:template>

<xsl:template match="book/title" mode="s_numbering" priority="3">
  <xsl:param name="do-qmark" select="'yes'"/>
  <xsl:if test="$do-qmark='yes'">
     <xsl:value-of select="'?'"/>
  </xsl:if>
</xsl:template>

<xsl:template match="ata-page-block/title" mode="s_numbering" priority="2">
  <xsl:variable name="previous-node" select="(ancestor::*[not((namespace-uri(.)='http://www.w3.org/1999/XSL/Format') or (namespace-uri(.)='http://www.arbortext.com/namespace/XslFoExtensions') or (starts-with(namespace-uri(.),'http://www.arbortext.com/namespace/Styler/')))][1]/ancestor::*[not((namespace-uri(.)='http://www.w3.org/1999/XSL/Format') or (namespace-uri(.)='http://www.arbortext.com/namespace/XslFoExtensions') or (starts-with(namespace-uri(.),'http://www.arbortext.com/namespace/Styler/')))][1]|ancestor::*[not((namespace-uri(.)='http://www.w3.org/1999/XSL/Format') or (namespace-uri(.)='http://www.arbortext.com/namespace/XslFoExtensions') or (starts-with(namespace-uri(.),'http://www.arbortext.com/namespace/Styler/')))][1]/ancestor::*[not((namespace-uri(.)='http://www.w3.org/1999/XSL/Format') or (namespace-uri(.)='http://www.arbortext.com/namespace/XslFoExtensions') or (starts-with(namespace-uri(.),'http://www.arbortext.com/namespace/Styler/')))][1][local-name()='ata-page-block' or local-name()='chapter' or local-name()='figure' or local-name()='frontmatter' or local-name()='highlights' or local-name()='lof' or local-name()='lot' or local-name()='module' or local-name()='page-block' or local-name()='section' or local-name()='subject']/*[local-name()='chapsect-title' or local-name()='cir-title' or local-name()='consumables-title' or local-name()='eipc-title' or local-name()='em-title' or local-name()='fixequ-title' or local-name()='general-title' or local-name()='glossary-title' or local-name()='howtouse-title' or local-name()='intro-title' or local-name()='manual-title' or local-name()='num-index-title' or local-name()='nut-option-title' or local-name()='pdlist-title' or local-name()='pwc-title' or local-name()='sblist-title' or local-name()='spblist-title' or local-name()='spectools-title' or local-name()='supplier-list-title' or local-name()='task-title' or local-name()='temp-rev-title' or local-name()='title' or local-name()='tmm-title'][1])[last()]"/>
  <xsl:choose>
     <xsl:when test="boolean($previous-node)">
        <xsl:apply-templates mode="s_numbering" select="$previous-node"/>
     </xsl:when>
     <xsl:otherwise>?</xsl:otherwise>
  </xsl:choose>
  <xsl:text>-</xsl:text>
  <xsl:number count="ata-page-block[title]" format="01"/>
</xsl:template>

<xsl:template match="title-page/title" mode="s_numbering" priority="1">
  <xsl:number count="title-page[title]" format="1"/>
</xsl:template>

<xsl:template match="title" mode="s_numbering" priority="0">
  <xsl:param name="do-qmark" select="'yes'"/>
  <xsl:if test="$do-qmark='yes'">
     <xsl:value-of select="'?'"/>
  </xsl:if>
</xsl:template>

<xsl:template match="pgblk/_ufe:tmm-title" mode="s_numbering" priority="2">
  <xsl:number count="pgblk[_ufe:tmm-title]" level="any" format="1"/>
</xsl:template>

<xsl:template match="pbfmatr/_ufe:tmm-title" mode="s_numbering" priority="1">
  <xsl:call-template name="t-numbering-pbfmatr-child"/>
</xsl:template>

<xsl:template match="_ufe:tmm-title" mode="s_numbering" priority="0">
  <xsl:param name="do-qmark" select="'yes'"/>
  <xsl:if test="$do-qmark='yes'">
     <xsl:value-of select="'?'"/>
  </xsl:if>
</xsl:template>

<xsl:template match="enumlist//enumlist//enumlist//enumlist/unlitem" mode="s_numbering" priority="12">
  <xsl:number count="unlitem" format="1)" level="single"/>
</xsl:template>

<xsl:template match="enumlist//enumlist//enumlist/unlitem" mode="s_numbering" priority="11">
  <xsl:number count="unlitem" format="i." level="single"/>
</xsl:template>

<xsl:template match="enumlist//enumlist/unlitem" mode="s_numbering" priority="8">
  <xsl:number count="unlitem" format="a." level="single"/>
</xsl:template>

<xsl:template match="enumlist/unlitem" mode="s_numbering" priority="5">
  <xsl:number count="unlitem" format="1." level="single"/>
</xsl:template>

<!-- FROM SPECIFIC FILES -->

<xsl:template name="t-numbering-step">
  <xsl:number count="*[@_gte:count-as-id='cnt__^step.cnt']" from="step" level="any" format="(a)"/>
</xsl:template>

<xsl:template name="t-numbering-step2">
  <xsl:number count="*[@_gte:count-as-id='cnt__^step2.cnt']" from="step2" level="any" format="1"/>
</xsl:template>

<xsl:template name="t-numbering-step3-ext">
  <xsl:param name="fmt"/>
  <xsl:choose>
    <xsl:when test="ancestor::step3">
      <xsl:number count="*[@_gte:count-as-id='cnt__^step3.cnt']" from="step3" level="any" format="{$fmt}"/>
    </xsl:when>
    <xsl:otherwise>
      <xsl:number count="*[@_gte:count-as-id='cnt__^step3.cnt' and not(ancestor::step3)]" level="any" format="{$fmt}"/>
    </xsl:otherwise>
  </xsl:choose>
</xsl:template>

<xsl:template match="step2" mode="s_numbering" priority="0">
  <xsl:call-template name="t-numbering-step"/>
</xsl:template>
 
<xsl:template match="step3" mode="s_numbering" priority="0">
  <xsl:call-template name="t-numbering-step2"/>
</xsl:template>

<xsl:template match="step4" mode="s_numbering" priority="0">
  <xsl:call-template name="t-numbering-step3-ext">
    <xsl:with-param name="fmt" select="'a'"/>
  </xsl:call-template>
</xsl:template>

<xsl:template match="*" mode="s_numbering">
  <xsl:param name="do-qmark" select="'yes'"/>
  <xsl:if test="$do-qmark='yes'">
     <xsl:value-of select="'?'"/>
  </xsl:if>
</xsl:template>

</xsl:stylesheet>

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

<xsl:template match="figure/title" mode="set-countas" priority="41">
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

</xsl:stylesheet>
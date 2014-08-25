<?xml version="1.0" encoding="UTF-8"?>

<!DOCTYPE xsl:stylesheet [
    <!ENTITY % entities_commun SYSTEM "xsl_entities_commun.ent">
    %entities_commun;
]>
<xsl:stylesheet xmlns:simg="java:net.sf.docbook.saxon.ImageIntrinsics" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:ximg="xaln://com.nwalsh.xalan.ImageIntrinsics" xmlns="http://www.w3.org/1999/xhtml" xmlns:exslt="http://exslt.org/common" xmlns:_acl="java:com.arbortext.epic.Acl" xmlns:msxsl="urn:schemas-microsoft-com:xslt" xmlns:_="http://www.pwc.ca/namespace/doctypes/emipc" xmlns:_dtd="http://www.arbortext.com/namespace/Styler/UserElements" xmlns:atidlm="http://www.arbortext.com/namespace/atidlm" xmlns:_2="http://www.pwc.ca/namespace/doctypes/jmtosmigrate" xmlns:ch="http://www.arbortext.com/namespace/chunker" xmlns:saxon="http://saxon.sf.net/" xmlns:_5="http://www.pwc.ca/namespace/doctypes/ipc" xmlns:_gte="http://www.arbortext.com/namespace/Styler/GeneratedTextElements" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:_sfe="http://www.arbortext.com/namespace/Styler/StylerFormattingElements" xmlns:_js="java:com.arbortext.epic.internal.js.JavaScript" xmlns:_3="http://www.pwc.ca/namespace/doctypes/migrate" xmlns:_ufe="http://www.arbortext.com/namespace/Styler/UserFormattingElements" version="1.0" exclude-result-prefixes="_ atidlm xml _2 ch saxon _5 xsi _js _3 #default exslt msxsl _dtd _ufe _sfe _gte simg ximg _acl">

<xsl:include href="emipc_expand-gentext.xsl"/>
<xsl:include href="emipc_styler_numbering.xsl"/>
<xsl:include href="emipc_styler-LabelAndNumberMarker.xsl"/>

<xsl:output encoding="UTF-8" method="xml" omit-xml-declaration="yes"/>

<xsl:variable name="doctype" select="'emipc'"/>

<xsl:include href="base.xsl"/>
<xsl:include href="base_steps_set-countas.xsl"/>
<xsl:include href="base_steps_styler_numbering.xsl"/>
<xsl:include href="process.xsl"/>

<xsl:template match="adt" priority="0">
  <span>
     <xsl:attribute name="class">
        <xsl:text>x-adt-1-0</xsl:text>
        <xsl:if test="not(./text()[normalize-space(.)!=''])"> x-adt-1-1</xsl:if>
     </xsl:attribute>
    <xsl:call-template name="t-base-div-basic"/>
  </span>
</xsl:template>

<xsl:template match="apn" priority="0">
  <div class="x-apn-1-0">
    <xsl:call-template name="t-base-div-basic"/>
  </div>
</xsl:template>

<xsl:template match="buildspec" priority="0">
  <div class="x-buildspec-1-0">
    <xsl:call-template name="t-base-div-basic"/>
  </div>
</xsl:template>

<xsl:template match="_ufe:cir-title" priority="0">
  <div ch:title="notoc" class="x--ufe-cir-title-3-0">
    <xsl:call-template name="t-base-div-title"/>
  </div>
</xsl:template>

<xsl:template match="dd" priority="0">
  <xsl:param name="hidden" select="'yes'"/>

  <xsl:variable name="foClass">
     <xsl:choose>
        <xsl:when test="not(ancestor::*[not(self::_sfe:BeforeOrAfterText)][1]/adt|ancestor::*[not(self::_sfe:BeforeOrAfterText)][1]/*[not(self::_sfe:BeforeOrAfterText)]//adt)">inline</xsl:when>
        <xsl:otherwise>block</xsl:otherwise>
     </xsl:choose>
  </xsl:variable>
  <xsl:variable name="blockness">
     <xsl:choose>
        <xsl:when test="not(ancestor::*[not(self::_sfe:BeforeOrAfterText)][1]/adt|ancestor::*[not(self::_sfe:BeforeOrAfterText)][1]/*[not(self::_sfe:BeforeOrAfterText)]//adt)">inline</xsl:when>
        <xsl:otherwise>block</xsl:otherwise>
     </xsl:choose>
  </xsl:variable>
  <xsl:variable name="fo-class">
     <xsl:choose>
        <xsl:when test="($foClass='block') and ($blockness='inline')">inline</xsl:when>
        <xsl:when test="($foClass='inline') and ($blockness='block')">block</xsl:when>
        <xsl:otherwise><xsl:value-of select="$foClass"/></xsl:otherwise>
     </xsl:choose>
  </xsl:variable>
  <xsl:choose>
     <xsl:when test="$fo-class='block'">
        <div>
           <xsl:attribute name="class">
              <xsl:text>x-dd-1-0</xsl:text>
              <xsl:if test="not(ancestor::*[not(self::_sfe:BeforeOrAfterText)][1]/adt|ancestor::*[not(self::_sfe:BeforeOrAfterText)][1]/*[not(self::_sfe:BeforeOrAfterText)]//adt)"> x-dd-1-1</xsl:if>
           </xsl:attribute>
           <xsl:call-template name="t-base-div-basic"/>
        </div>
     </xsl:when>
     <xsl:when test="$fo-class='inline'">
        <span>
           <xsl:attribute name="class">
              <xsl:text>x-dd-1-0</xsl:text>
              <xsl:if test="not(ancestor::*[not(self::_sfe:BeforeOrAfterText)][1]/adt|ancestor::*[not(self::_sfe:BeforeOrAfterText)][1]/*[not(self::_sfe:BeforeOrAfterText)]//adt)"> x-dd-1-1</xsl:if>
           </xsl:attribute>
           <xsl:call-template name="t-base-div-basic"/>
        </span>
     </xsl:when>
  </xsl:choose>
</xsl:template>

<xsl:template match="glossary//glosdata/def" priority="100">
  <xsl:variable name="l-par" select="name(..)"/>
  <dd>
     <xsl:attribute name="class">
        <xsl:if test="$l-par='chapsect-item' or $l-par='chapsect-title' or $l-par='glosdata'">
           <xsl:value-of select="concat('x-',$l-par,'-1-0 ')"/>
        </xsl:if>
        <xsl:text>x-def-3-0</xsl:text>
     </xsl:attribute>
     <xsl:call-template name="t-base-div-basic"/>
  </dd>
</xsl:template>

<xsl:template match="_ufe:eipc-title" priority="0">
  <div ch:title="toc" class="x--ufe-eipc-title-3-0">
    <xsl:call-template name="t-base-div-title"/>
  </div>
</xsl:template>

<xsl:template match="_ufe:em-title" priority="0">
  <div ch:title="notoc" class="x--ufe-em-title-3-0">
    <xsl:call-template name="t-base-div-title"/>
  </div>
</xsl:template>

<xsl:template match="figure" priority="0">
  <div class="x-figure-1-0">
    <xsl:call-template name="t-base-div-basic2"/>
  </div>
</xsl:template>

<xsl:template match="glosdata" priority="0">
  <xsl:apply-templates/>
</xsl:template>

<xsl:template match="glossary" priority="0">
  <div>
     <xsl:copy-of select="@ch:*"/>
     <xsl:apply-templates select="_sfe:BeforeOrAfterText[not(preceding-sibling::*)]"/>
     <xsl:apply-templates select="_ufe:chapsect-title|_ufe:cir-title|_ufe:consumables-title|_ufe:eipc-title|_ufe:em-title|_ufe:fixequ-title|_ufe:general-title|_ufe:glossary-title|_ufe:howtouse-title|_ufe:intro-title|manual-title|_ufe:num-index-title|_ufe:nut-option-title|_ufe:pdlist-title|pwc-title|_ufe:sblist-title|_ufe:spblist-title|_ufe:spectools-title|_ufe:supplier-list-title|_ufe:task-title|_ufe:temp-rev-title|title|_ufe:tmm-title"/>
     <dl class="x-glossary-1-0">
        <xsl:call-template name="maybe-set-id"/>
        <xsl:apply-templates select="glosdata|term"/>
     </dl>
     <xsl:apply-templates select="*[not(self::_sfe:BeforeOrAfterText|self::_ufe:chapsect-title|self::_ufe:cir-title|self::_ufe:consumables-title|self::_ufe:eipc-title|self::_ufe:em-title|self::_ufe:fixequ-title|self::_ufe:general-title|self::_ufe:glossary-title|self::_ufe:howtouse-title|self::_ufe:intro-title|self::manual-title|self::_ufe:num-index-title|self::_ufe:nut-option-title|self::_ufe:pdlist-title|self::pwc-title|self::_ufe:sblist-title|self::_ufe:spblist-title|self::_ufe:spectools-title|self::_ufe:supplier-list-title|self::_ufe:task-title|self::_ufe:temp-rev-title|self::title|self::_ufe:tmm-title|self::glosdata|self::term|self::def)]"/>
     <xsl:apply-templates select="_sfe:BeforeOrAfterText[not(following-sibling::*)][preceding-sibling::*]"/>
  </div>
</xsl:template>

<xsl:template match="_ufe:glossary-title" priority="0">
  <div ch:title="toc" class="x--ufe-glossary-title-4-0">
    <xsl:call-template name="t-base-div-title"/>
  </div>
</xsl:template>

<xsl:template match="intro//graphic" priority="1">
  <xsl:variable name="l-id">
    <xsl:call-template name="maybe-get-id">
      <xsl:with-param name="only-if-id-attr" select="'no'"/>
    </xsl:call-template>
  </xsl:variable>
  <div style="display:none" class="x-graphic-1-0">
     <xsl:copy-of select="@ch:*"/>
     <xsl:attribute name="id">
        <xsl:value-of select="$l-id"/>
     </xsl:attribute>
     <xsl:apply-templates/>
  </div>
  <a href="#{$l-id}" onclick="displayGraphics('{$l-id}');" class="x-a-no-border">
     <img alt="Graphic" src="{descendant::sheet[@size='thm']/@gnbr}">
     </img>
  </a>
</xsl:template>

<xsl:template match="graphic" priority="0">
  <xsl:variable name="l-id">
    <xsl:call-template name="maybe-get-id">
      <xsl:with-param name="only-if-id-attr" select="'no'"/>
    </xsl:call-template>
  </xsl:variable>
  <div style="display:none" class="x-graphic-2-0">
     <xsl:copy-of select="@ch:*"/>
     <xsl:attribute name="id">
        <xsl:value-of select="$l-id"/>
     </xsl:attribute>
     <xsl:apply-templates/>
  </div>
  <a href="#{$l-id}" onclick="displayGraphics('{$l-id}');" class="x-a-no-border">
     <img alt="Graphic" src="{descendant::sheet[@size='thm']/@gnbr}">
     </img>
  </a>
</xsl:template>

<xsl:template match="_ufe:howtouse-title" priority="0">
  <div ch:title="notoc" class="x--ufe-howtouse-title-3-0">
    <xsl:call-template name="t-base-div-title"/>
  </div>
</xsl:template>

<xsl:template match="ics" priority="0">
  <table border="0" cellpadding="0" cellspacing="0" class="x-ics-1-0 x--zero-left-margins">
    <xsl:call-template name="t-base-step-table">
      <xsl:with-param name="col1-width" select="'0pt'"/>
      <xsl:with-param name="col2-width" select="'0pt'"/>
      <xsl:with-param name="col3-width" select="''"/>
      <xsl:with-param name="label-col"  select="'3'"/>
      <xsl:with-param name="col2-align" select="'center'"/>
      <xsl:with-param name="apply"      select="'&lib-gentxt;'"/>
    </xsl:call-template>
  </table>
</xsl:template>

<xsl:template match="_ufe:intro-title" priority="0">
  <div ch:title="toc" class="x--ufe-intro-title-3-0">
    <xsl:call-template name="t-base-div-title"/>
  </div>
</xsl:template>

<xsl:template match="itemspec" priority="0">
  <div>
     <xsl:attribute name="class">
        <xsl:text>x-itemspec-1-0</xsl:text>
        <xsl:choose>
          <xsl:when test="@indent='1'"> x-itemspec-1-1</xsl:when>
          <xsl:when test="@indent='2'"> x-itemspec-1-2</xsl:when>
          <xsl:when test="@indent='3'"> x-itemspec-1-3</xsl:when>
          <xsl:when test="@indent='4'"> x-itemspec-1-4</xsl:when>
        </xsl:choose>
     </xsl:attribute>
     <!--  Remove ID as in APE -->
     <!--
     <xsl:call-template name="t-base-div-basic"/>
     -->
     <xsl:copy-of select="@ch:*"/>
     <xsl:apply-templates/>
  </div>
</xsl:template>

<xsl:template match="kwd" priority="0">
  <span class="x-kwd-1-0">
    <xsl:call-template name="t-base-div-basic"/>
  </span>
</xsl:template>

<xsl:template match="mad" priority="0">
  <div class="x-mad-1-0">
    <xsl:call-template name="t-base-div-basic"/>
  </div>
</xsl:template>

<xsl:template match="mfr" priority="0">
  <div class="x-mfr-1-0">
    <xsl:call-template name="t-base-div-basic"/>
  </div>
</xsl:template>

<xsl:template match="modelspec" priority="0">
  <div class="x-modelspec-1-0">
    <xsl:call-template name="t-base-div-basic"/>
  </div>
</xsl:template>

<xsl:template match="msc" priority="0">
  <div class="x-msc-1-0">
    <xsl:call-template name="t-base-div-basic"/>
  </div>
</xsl:template>

<xsl:template match="name" priority="0">
  <div class="x-name-1-0">
    <xsl:call-template name="t-base-div-basic"/>
  </div>
</xsl:template>

<xsl:template match="nom" priority="0">
  <span class="x-nom-1-0">
    <xsl:call-template name="t-base-div-basic"/>
  </span>
</xsl:template>

<xsl:template match="module/note" priority="11">
  <div class="x-note-1-0">
    <xsl:call-template name="t-base-div-basic"/>
  </div>
</xsl:template>

<xsl:template match="subtask/note" priority="10">
  <div class="x-note-2-0">
    <xsl:call-template name="t-base-div-basic"/>
  </div>
</xsl:template>

<xsl:template match="task/note" priority="9">
  <div class="x-note-3-0">
    <xsl:call-template name="t-base-div-basic"/>
  </div>
</xsl:template>

<xsl:template match="n-para/note" priority="8">
  <div>
     <xsl:attribute name="class">
        <xsl:text>x-note-4-0</xsl:text>
        <xsl:if test="@nbr"> x-note-4-1</xsl:if>
     </xsl:attribute>
    <xsl:call-template name="t-base-div-basic"/>
  </div>
</xsl:template>

<xsl:template match="procedure/note" priority="7">
  <div>
     <xsl:attribute name="class">
        <xsl:text>x-note-5-0</xsl:text>
        <xsl:if test="@nbr"> x-note-5-1</xsl:if>
     </xsl:attribute>
    <xsl:call-template name="t-base-div-basic"/>
  </div>
</xsl:template>

<xsl:template match="fandc/note" priority="6">
  <div class="x-note-6-0">
    <xsl:call-template name="t-base-div-basic"/>
  </div>
</xsl:template>

<xsl:template match="spec-assem/note" priority="5">
  <div class="x-note-7-0">
    <xsl:call-template name="t-base-div-basic"/>
  </div>
</xsl:template>

<xsl:template match="spring-pressure/note" priority="4">
  <div class="x-note-8-0">
    <xsl:call-template name="t-base-div-basic"/>
  </div>
</xsl:template>

<xsl:template match="torque-and-stretch/note" priority="3">
  <div class="x-note-9-0">
    <xsl:call-template name="t-base-div-basic"/>
  </div>
</xsl:template>

<xsl:template match="fits-and-clears/note" priority="2">
  <div class="x-note-10-0">
    <xsl:call-template name="t-base-div-basic"/>
  </div>
</xsl:template>

<xsl:template match="note[ancestor::subpara]" priority="1">
  <div>
     <xsl:attribute name="class">
        <xsl:text>x-note-11-0</xsl:text>
        <xsl:if test="@nbr"> x-note-11-1</xsl:if>
     </xsl:attribute>
    <xsl:call-template name="t-base-div-basic"/>
  </div>
</xsl:template>

<xsl:template match="note" priority="0">
  <div>
     <xsl:attribute name="class">
        <xsl:text>x-note-12-0</xsl:text>
        <xsl:if test="@nbr"> x-note-12-1</xsl:if>
     </xsl:attribute>
    <xsl:call-template name="t-base-div-basic"/>
  </div>
</xsl:template>

<xsl:template match="np" priority="0">
  <xsl:param name="hidden" select="'yes'"/>

  <xsl:if test="$hidden='no'">
    <span class="x-np-1-0">
      <xsl:call-template name="t-base-div-basic"/>
    </span>
  </xsl:if>
</xsl:template>

<xsl:template match="_ufe:num-index-title" priority="0">
  <div ch:title="toc" class="x--ufe-num-index-title-4-0">
    <xsl:call-template name="t-base-div-title"/>
  </div>
</xsl:template>

<xsl:template match="_ufe:nut-option-title" priority="0">
  <div ch:title="toc" class="x--ufe-nut-option-title-4-0">
    <xsl:call-template name="t-base-div-title"/>
  </div>
</xsl:template>

<xsl:template match="nutopt" priority="0">
  <div class="x-nutopt-1-0">
    <xsl:call-template name="t-base-div-basic2"/>
  </div>
</xsl:template>

<xsl:template match="part" priority="0">
  <xsl:apply-templates/>
</xsl:template>

<xsl:template match="_ufe:pdlist-title" priority="0">
  <div ch:title="notoc" class="x--ufe-pdlist-title-2-0">
    <xsl:call-template name="t-base-div-title"/>
  </div>
</xsl:template>

<xsl:template match="prtlist" priority="0">
  <xsl:apply-templates/>
</xsl:template>

<xsl:template match="pwc-model" priority="0">
  <div class="x-pwc-model-1-0">
    <xsl:call-template name="t-base-div-basic"/>
  </div>
</xsl:template>

<xsl:template match="pwc-title" priority="0">
  <div ch:title="notoc" class="x-pwc-title-1-0">
    <xsl:call-template name="t-base-div-title"/>
  </div>
</xsl:template>

<xsl:template match="pwcatanbr" priority="0">
  <div class="x-pwcatnbr-1-0">
    <xsl:call-template name="t-base-div-basic"/>
  </div>
</xsl:template>

<xsl:template match="pwcbrk" priority="0">
  <span class="x-pwcbrk-1-0">
    <xsl:call-template name="t-base-div-basic"/>
  </span>
</xsl:template>

<xsl:template match="pwcchapsect" priority="0">
  <div class="x-pwcchapsect-1-0">
    <xsl:call-template name="t-base-div-basic"/>
  </div>
</xsl:template>

<xsl:template match="pwcchapsect-item" priority="0">
  <table border="0" cellpadding="0" cellspacing="0" class="x-pwcchapsect-item-1-0 x--zero-left-margins">
    <xsl:call-template name="t-base-step-table">
      <xsl:with-param name="col1-width" select="'0pt'"/>
      <xsl:with-param name="col2-width" select="'0pt'"/>
      <xsl:with-param name="col3-width" select="''"/>
      <xsl:with-param name="label-col"  select="'3'"/>
      <xsl:with-param name="col2-align" select="'center'"/>
      <xsl:with-param name="apply"      select="'&lib-gentxt;'"/>
    </xsl:call-template>
  </table>
</xsl:template>

<xsl:template match="pwcchapsect-list" priority="0">
  <div class="x-pwcchapsect-list-1-0">
    <xsl:call-template name="t-base-div-basic"/>
  </div>
</xsl:template>

<xsl:template match="pwcsin" priority="0">
  <xsl:param name="hidden" select="'yes'"/>

  <xsl:if test="$hidden='no'">
    <span class="x-pwcsin-1-0">
      <xsl:call-template name="t-base-div-basic"/>
    </span>
  </xsl:if>
</xsl:template>

<xsl:template match="pwcspbnbr" priority="0">
  <div class="x-pwcspbnbr-1-0">
     <xsl:copy-of select="@ch:*"/>
     <xsl:call-template name="maybe-set-id"/>
     <a href="#" onclick="spbLink('{.}');">
        <xsl:apply-templates/>
     </a>
  </div>
</xsl:template>

<xsl:template match="rp" priority="0">
  <div class="x-rp-1-0">
    <xsl:call-template name="t-base-div-basic"/>
  </div>
</xsl:template>

<xsl:template match="rwk" priority="0">
  <xsl:apply-templates/>
</xsl:template>

<xsl:template match="sbdata" priority="0">
  <div class="x-sbdata-1-0">
    <xsl:call-template name="t-base-div-basic"/>
  </div>
</xsl:template>

<xsl:template match="_ufe:sblist-title" priority="0">
  <div ch:title="notoc" class="x--ufe-sblist-title-3-0">
    <xsl:call-template name="t-base-div-title"/>
  </div>
</xsl:template>

<xsl:template match="table//sbnbr" priority="1">
  <div class="x-sbnbr-1-0">
     <xsl:copy-of select="@ch:*"/>
     <xsl:call-template name="maybe-set-id"/>
     <a href="#" onclick="sbLink('{.}');">
        <xsl:apply-templates/>
     </a>
  </div>
</xsl:template>

<xsl:template match="sbnbr" priority="0">
  <span class="x-sbnbr-1-0">
     <xsl:copy-of select="@ch:*"/>
     <xsl:call-template name="maybe-set-id"/>
     <a href="#" onclick="sbLink('{.}');">
        <xsl:apply-templates/>
     </a>
  </span>
</xsl:template>

<xsl:template match="sd" priority="0">
  <div class="x-sd-1-0">
    <xsl:call-template name="t-base-div-basic"/>
  </div>
</xsl:template>

<xsl:template match="sfn" priority="0">
  <xsl:apply-templates/>
</xsl:template>

<xsl:template match="sftq" priority="0">
  <xsl:apply-templates/>
</xsl:template>

<xsl:template match="sheet" priority="0">
  <xsl:param name="hidden" select="'yes'"/>

  <xsl:variable name="foClass">
     <xsl:choose>
        <xsl:when test="not(@size) or (@size and string(@size)!='big')">hidden</xsl:when>
        <xsl:when test="count(following-sibling::sheet[@size='big']) &gt; 0">graphic-block</xsl:when>
        <xsl:otherwise>graphic-block</xsl:otherwise>
     </xsl:choose>
  </xsl:variable>
  <xsl:variable name="blockness">block</xsl:variable>
  <xsl:variable name="hiddenness">
     <xsl:choose>
        <xsl:when test="not(@size) or (@size and string(@size)!='big')">yes</xsl:when>
        <xsl:when test="count(following-sibling::sheet[@size='big']) &gt; 0">no</xsl:when>
        <xsl:otherwise>no</xsl:otherwise>
     </xsl:choose>
  </xsl:variable>
  <xsl:variable name="fo-class">
     <xsl:choose>
        <xsl:when test="$hiddenness='yes'">
           <xsl:text>hidden-</xsl:text>
           <xsl:value-of select="$blockness"/>
        </xsl:when>
        <xsl:when test="$hiddenness='no' and starts-with($foClass,'hidden-')">
           <xsl:value-of select="substring($foClass,8)"/>
        </xsl:when>
        <xsl:otherwise>
           <xsl:value-of select="$foClass"/>
        </xsl:otherwise>
     </xsl:choose>
  </xsl:variable>
  <xsl:choose>
     <xsl:when test="$fo-class='hidden-block'">
        <div>
           <xsl:attribute name="class">
              <xsl:text>x-sheet-1-0</xsl:text>
              <xsl:if test="count(following-sibling::sheet[@size='big']) &gt; 0"> x-sheet-1-1</xsl:if>
              <xsl:if test="not(@size) or (@size and string(@size)!='big')"> x-sheet-1-2</xsl:if>
           </xsl:attribute>
           <xsl:call-template name="t-base-div-basic-h">
              <xsl:with-param name="hidden" select="$hidden"/>
           </xsl:call-template>
        </div>
     </xsl:when>
     <xsl:when test="$fo-class='block'">
        <div>
           <xsl:attribute name="class">
              <xsl:text>x-sheet-1-0</xsl:text>
              <xsl:if test="count(following-sibling::sheet[@size='big']) &gt; 0"> x-sheet-1-1</xsl:if>
              <xsl:if test="not(@size) or (@size and string(@size)!='big')"> x-sheet-1-2</xsl:if>
           </xsl:attribute>
           <xsl:if test="count(following-sibling::sheet[@size='med']) &gt; 0">
              <xsl:attribute name="style">margin-bottom: 8pt; border-bottom: 2px solid #000000;</xsl:attribute>
           </xsl:if>
           <xsl:call-template name="t-base-div-basic"/>
        </div>
     </xsl:when>
     <xsl:when test="$fo-class='graphic-block'">
        <div>
           <xsl:attribute name="class">
              <xsl:text>x-sheet-1-0</xsl:text>
              <xsl:if test="count(following-sibling::sheet[@size='big']) &gt; 0"> x-sheet-1-1</xsl:if>
              <xsl:if test="not(@size) or (@size and string(@size)!='big')"> x-sheet-1-2</xsl:if>
           </xsl:attribute>
           <xsl:if test="count(following-sibling::sheet[@size='big']) &gt; 0">
              <xsl:attribute name="style">margin-bottom: 8pt; border-bottom: 2px solid #000000;</xsl:attribute>
           </xsl:if>
           <xsl:call-template name="t-base-img-graphic">
              <xsl:with-param name="filename" select="@gnbr"/>
           </xsl:call-template>
           <xsl:if test="@negnum">
              <div style="margin-bottom: 8pt;"><xsl:value-of select="@negnum"/></div>
           </xsl:if>
        </div>
     </xsl:when>
  </xsl:choose>
</xsl:template>

<xsl:template match="_ufe:spblist-title" priority="0">
  <div ch:title="notoc" class="x--ufe-spblist-title-3-0">
    <xsl:call-template name="t-base-div-title"/>
  </div>
</xsl:template>

<xsl:template match="numlist/step" priority="3">
  <table border="0" cellpadding="0" cellspacing="0" class="x-step-1-0 x--zero-left-margins x-tab-fixed">
    <xsl:call-template name="t-base-step-table">
      <xsl:with-param name="col1-width" select="'1.5em'"/>
      <xsl:with-param name="col2-width" select="'12pt'"/>
      <xsl:with-param name="col3-width" select="''"/>
      <xsl:with-param name="label-col"  select="'1'"/>
      <xsl:with-param name="col2-align" select="'right'"/>
      <xsl:with-param name="apply"      select="'&lib-gentxt;'"/>
    </xsl:call-template>
  </table>
</xsl:template>

<xsl:template match="procedure//step" priority="2">
  <xsl:apply-templates select="node()[self::warning or (self::revst and following-sibling::*[1][self::warning]) or self::caution or (self::revst and following-sibling::*[1][self::caution]) or name() = 'revend']"/>
  <table border="0" cellpadding="0" cellspacing="0" class="x-step-2-0 x--zero-left-margins">
    <xsl:call-template name="t-base-step-table">
      <xsl:with-param name="col1-width" select="'18pt'"/>
      <xsl:with-param name="col2-width" select="'20pt'"/>
      <xsl:with-param name="col3-width" select="''"/>
      <xsl:with-param name="label-col"  select="'2'"/>
      <xsl:with-param name="col2-align" select="'left'"/>
      <xsl:with-param name="apply"      select="'&lib-gentxt-warn-caut;'"/>
    </xsl:call-template>
  </table>
</xsl:template>

<xsl:template match="step[table/@tabstyle='frac']" priority="1">
  <xsl:apply-templates select="node()[self::warning or (self::revst and following-sibling::*[1][self::warning]) or self::caution or (self::revst and following-sibling::*[1][self::caution]) or name() = 'revend']"/>
  <table border="0" cellpadding="0" cellspacing="0" class="x-step-3-0 x--zero-left-margins">
    <xsl:call-template name="t-base-step-table">
      <xsl:with-param name="col1-width" select="'0pt'"/>
      <xsl:with-param name="col2-width" select="''"/>
      <xsl:with-param name="col3-width" select="'100%'"/>
      <xsl:with-param name="label-col"  select="'2'"/>
      <xsl:with-param name="col2-align" select="'left'"/>
      <xsl:with-param name="apply"      select="'&lib-gentxt-warn-caut;'"/>
    </xsl:call-template>
  </table>
</xsl:template>

<xsl:template match="step" priority="0">
  <table border="0" cellpadding="0" cellspacing="0" class="x-step-4-0 x--zero-left-margins">
    <xsl:call-template name="t-base-step-table">
      <xsl:with-param name="col1-width" select="'0pt'"/>
      <xsl:with-param name="col2-width" select="'0pt'"/>
      <xsl:with-param name="col3-width" select="''"/>
      <xsl:with-param name="label-col"  select="'3'"/>
      <xsl:with-param name="col2-align" select="'center'"/>
      <xsl:with-param name="apply"      select="'&lib-gentxt;'"/>
    </xsl:call-template>
  </table>
</xsl:template>

<xsl:template match="numlist/step2" priority="2">
  <table border="0" cellpadding="0" cellspacing="0" class="x-step2-1-0 x--zero-left-margins x-tab-fixed">
    <xsl:call-template name="t-base-step-table">
      <xsl:with-param name="col1-width" select="'1.5em'"/>
      <xsl:with-param name="col2-width" select="'12pt'"/>
      <xsl:with-param name="col3-width" select="''"/>
      <xsl:with-param name="label-col"  select="'1'"/>
      <xsl:with-param name="col2-align" select="'right'"/>
      <xsl:with-param name="apply"      select="'&lib-gentxt;'"/>
    </xsl:call-template>
  </table>
</xsl:template>

<xsl:template match="step2[table/@tabstyle='frac']" priority="1">
  <xsl:apply-templates select="node()[self::warning or (self::revst and following-sibling::*[1][self::warning]) or self::caution or (self::revst and following-sibling::*[1][self::caution]) or name() = 'revend']"/>
  <table border="0" cellpadding="0" cellspacing="0" class="x-step2-2-0 x--zero-left-margins">
    <xsl:call-template name="t-base-step-table">
      <xsl:with-param name="col1-width" select="'0pt'"/>
      <xsl:with-param name="col2-width" select="''"/>
      <xsl:with-param name="col3-width" select="'100%'"/>
      <xsl:with-param name="label-col"  select="'2'"/>
      <xsl:with-param name="col2-align" select="'left'"/>
      <xsl:with-param name="apply"      select="'&lib-gentxt-warn-caut;'"/>
    </xsl:call-template>
  </table>
</xsl:template>

<xsl:template match="step2" priority="0">
  <xsl:apply-templates select="node()[self::warning or (self::revst and following-sibling::*[1][self::warning]) or self::caution or (self::revst and following-sibling::*[1][self::caution]) or name() = 'revend']"/>
  <table border="0" cellpadding="0" cellspacing="0" class="x-step2-3-0 x--zero-left-margins">
    <xsl:call-template name="t-base-step-table">
      <xsl:with-param name="col1-width" select="'0pt'"/>
      <xsl:with-param name="col2-width" select="''"/>
      <xsl:with-param name="col3-width" select="'100%'"/>
      <xsl:with-param name="label-col"  select="'2'"/>
      <xsl:with-param name="col2-align" select="'left'"/>
      <xsl:with-param name="apply"      select="'&lib-gentxt-warn-caut;'"/>
    </xsl:call-template>
  </table>
</xsl:template>

<xsl:template match="numlist/step3" priority="2">
  <table border="0" cellpadding="0" cellspacing="0" class="x-step3-1-0 x--zero-left-margins x-tab-fixed">
    <xsl:call-template name="t-base-step-table">
      <xsl:with-param name="col1-width" select="'1.5em'"/>
      <xsl:with-param name="col2-width" select="'12pt'"/>
      <xsl:with-param name="col3-width" select="''"/>
      <xsl:with-param name="label-col"  select="'1'"/>
      <xsl:with-param name="col2-align" select="'right'"/>
      <xsl:with-param name="apply"      select="'&lib-gentxt;'"/>
    </xsl:call-template>
  </table>
</xsl:template>

<xsl:template match="step3[table/@tabstyle='frac']" priority="1">
  <xsl:apply-templates select="node()[self::warning or (self::revst and following-sibling::*[1][self::warning]) or self::caution or (self::revst and following-sibling::*[1][self::caution]) or name() = 'revend']"/>
  <table border="0" cellpadding="0" cellspacing="0" class="x-step3-2-0 x--zero-left-margins">
    <xsl:call-template name="t-base-step-table">
      <xsl:with-param name="col1-width" select="'0pt'"/>
      <xsl:with-param name="col2-width" select="''"/>
      <xsl:with-param name="col3-width" select="'100%'"/>
      <xsl:with-param name="label-col"  select="'2'"/>
      <xsl:with-param name="col2-align" select="'left'"/>
      <xsl:with-param name="apply"      select="'&lib-gentxt-warn-caut;'"/>
    </xsl:call-template>
  </table>
</xsl:template>

<xsl:template match="step3" priority="0">
  <xsl:apply-templates select="node()[self::warning or (self::revst and following-sibling::*[1][self::warning]) or self::caution or (self::revst and following-sibling::*[1][self::caution]) or name() = 'revend']"/>
  <table border="0" cellpadding="0" cellspacing="0" class="x-step3-3-0 x--zero-left-margins">
    <xsl:call-template name="t-base-step-table">
      <xsl:with-param name="col1-width" select="'0pt'"/>
      <xsl:with-param name="col2-width" select="''"/>
      <xsl:with-param name="col3-width" select="'100%'"/>
      <xsl:with-param name="label-col"  select="'2'"/>
      <xsl:with-param name="col2-align" select="'left'"/>
      <xsl:with-param name="apply"      select="'&lib-gentxt-warn-caut;'"/>
    </xsl:call-template>
  </table>
</xsl:template>

<xsl:template match="numlist/step4" priority="2">
  <table border="0" cellpadding="0" cellspacing="0" class="x-step4-1-0 x--zero-left-margins x-tab-fixed">
    <xsl:call-template name="t-base-step-table">
      <xsl:with-param name="col1-width" select="'1.5em'"/>
      <xsl:with-param name="col2-width" select="'12pt'"/>
      <xsl:with-param name="col3-width" select="''"/>
      <xsl:with-param name="label-col"  select="'1'"/>
      <xsl:with-param name="col2-align" select="'right'"/>
      <xsl:with-param name="apply"      select="'&lib-gentxt;'"/>
    </xsl:call-template>
  </table>
</xsl:template>

<xsl:template match="step4[table/@tabstyle='frac']" priority="1">
  <xsl:apply-templates select="node()[self::warning or (self::revst and following-sibling::*[1][self::warning]) or self::caution or (self::revst and following-sibling::*[1][self::caution]) or name() = 'revend']"/>
  <table border="0" cellpadding="0" cellspacing="0" class="x-step4-2-0 x--zero-left-margins">
    <xsl:call-template name="t-base-step-table">
      <xsl:with-param name="col1-width" select="'0pt'"/>
      <xsl:with-param name="col2-width" select="''"/>
      <xsl:with-param name="col3-width" select="'100%'"/>
      <xsl:with-param name="label-col"  select="'2'"/>
      <xsl:with-param name="col2-align" select="'left'"/>
      <xsl:with-param name="apply"      select="'&lib-gentxt-warn-caut;'"/>
    </xsl:call-template>
  </table>
</xsl:template>

<xsl:template match="step4" priority="0">
  <xsl:apply-templates select="node()[self::warning or (self::revst and following-sibling::*[1][self::warning]) or self::caution or (self::revst and following-sibling::*[1][self::caution]) or name() = 'revend']"/>
  <table border="0" cellpadding="0" cellspacing="0" class="x-step4-3-0 x--zero-left-margins">
    <xsl:call-template name="t-base-step-table">
      <xsl:with-param name="col1-width" select="'0pt'"/>
      <xsl:with-param name="col2-width" select="''"/>
      <xsl:with-param name="col3-width" select="'100%'"/>
      <xsl:with-param name="label-col"  select="'2'"/>
      <xsl:with-param name="col2-align" select="'left'"/>
      <xsl:with-param name="apply"      select="'&lib-gentxt-warn-caut;'"/>
    </xsl:call-template>
  </table>
</xsl:template>

<xsl:template match="numlist/step5" priority="2">
  <table border="0" cellpadding="0" cellspacing="0" class="x-step5-1-0 x--zero-left-margins">
    <xsl:call-template name="t-base-step-table">
      <xsl:with-param name="col1-width" select="'0pt'"/>
      <xsl:with-param name="col2-width" select="'0pt'"/>
      <xsl:with-param name="col3-width" select="''"/>
      <xsl:with-param name="label-col"  select="'3'"/>
      <xsl:with-param name="col2-align" select="'center'"/>
      <xsl:with-param name="apply"      select="'&lib-gentxt;'"/>
    </xsl:call-template>
  </table>
</xsl:template>

<xsl:template match="step5[table/@tabstyle='frac']" priority="1">
  <xsl:apply-templates select="node()[self::warning or (self::revst and following-sibling::*[1][self::warning]) or self::caution or (self::revst and following-sibling::*[1][self::caution]) or name() = 'revend']"/>
  <table border="0" cellpadding="0" cellspacing="0" class="x-step5-2-0 x--zero-left-margins">
    <xsl:call-template name="t-base-step-table">
      <xsl:with-param name="col1-width" select="'0pt'"/>
      <xsl:with-param name="col2-width" select="'0pt'"/>
      <xsl:with-param name="col3-width" select="''"/>
      <xsl:with-param name="label-col"  select="'3'"/>
      <xsl:with-param name="col2-align" select="'center'"/>
      <xsl:with-param name="apply"      select="'&lib-gentxt-warn-caut;'"/>
    </xsl:call-template>
  </table>
</xsl:template>

<xsl:template match="step5" priority="0">
  <xsl:apply-templates select="node()[self::warning or (self::revst and following-sibling::*[1][self::warning]) or self::caution or (self::revst and following-sibling::*[1][self::caution]) or name() = 'revend']"/>
  <table border="0" cellpadding="0" cellspacing="0" class="x-step5-3-0 x--zero-left-margins">
    <xsl:call-template name="t-base-step-table">
      <xsl:with-param name="col1-width" select="'0pt'"/>
      <xsl:with-param name="col2-width" select="'0pt'"/>
      <xsl:with-param name="col3-width" select="''"/>
      <xsl:with-param name="label-col"  select="'3'"/>
      <xsl:with-param name="col2-align" select="'center'"/>
      <xsl:with-param name="apply"      select="'&lib-gentxt-warn-caut;'"/>
    </xsl:call-template>
  </table>
</xsl:template>

<xsl:template match="_ufe:supplier-list-title" priority="0">
  <div ch:title="toc" class="x--ufe-supplier-list-title-4-0">
    <xsl:call-template name="t-base-div-title"/>
  </div>
</xsl:template>

<xsl:template match="symbol" priority="0">
  <xsl:apply-templates/>
</xsl:template>

<xsl:template match="pbfmatr//_ufe:task-title" priority="1">
  <div ch:title="notoc" class="x--ufe-task-title-3-0">
    <xsl:call-template name="t-base-div-title"/>
  </div>
</xsl:template>

<xsl:template match="_ufe:temp-rev-title" priority="0">
  <div ch:title="notoc" class="x--ufe-temp-rev-title-3-0">
    <xsl:call-template name="t-base-div-title"/>
  </div>
</xsl:template>

<xsl:template match="glossary//glosdata/term" priority="101">
  <xsl:variable name="l-par" select="name(..)"/>
  <dt>
     <xsl:attribute name="class">
        <xsl:if test="$l-par='chapsect-item' or $l-par='chapsect-title' or $l-par='glosdata'">
          <xsl:value-of select="concat('x-',$l-par,'-1-0 ')"/>
        </xsl:if>
        <xsl:text> x-term-2-0</xsl:text>
     </xsl:attribute>
     <xsl:call-template name="t-base-div-basic"/>
  </dt>
</xsl:template>

<xsl:template match="book[contains(@doctype, 'ipc')]/frontmatter//figure/title" priority="68">
  <div ch:title="notoc" class="x-title-5-0">
    <xsl:call-template name="t-base-div-title"/>
  </div>
</xsl:template>

<xsl:template match="module[@module-name='Airworthiness_Limits']/pgblk/title" priority="65">
  <div ch:title="notoc" class="x-title-8-0">
    <xsl:call-template name="t-base-div-title"/>
  </div>
</xsl:template>

<xsl:template match="page-block[@pb-name='ni']//mfmatr/title" priority="56">
  <div ch:title="notoc" class="x-title-17-0">
    <xsl:call-template name="t-base-div-title"/>
  </div>
</xsl:template>

<xsl:template match="page-block[@pb-name='record-of-revisions']//n-para/title" priority="55">
  <div ch:title="toc" class="x-title-18-0">
    <xsl:call-template name="t-base-div-title"/>
  </div>
</xsl:template>

<xsl:template match="book[contains(@doctype, 'epc')]//figure/title" priority="54">
  <div ch:title="toc" class="x-title-19-0">
    <xsl:call-template name="t-base-div-title"/>
  </div>
</xsl:template>

<xsl:template match="book[contains(@doctype, 'epc')]//graphic/title" priority="53">
  <div ch:title="toc" class="x-title-20-0">
    <xsl:call-template name="t-base-div-title"/>
  </div>
</xsl:template>

<xsl:template match="book[contains(@doctype, 'ipc')]//figure/title" priority="52">
  <div ch:title="notoc" class="x-title-21-0">
    <xsl:call-template name="t-base-div-title"/>
  </div>
</xsl:template>

<xsl:template match="pbfmatr/title" priority="40">
  <xsl:param name="hidden" select="'yes'"/>

  <xsl:variable name="foClass">
     <xsl:choose>
        <xsl:when test="((ancestor-or-self::pwcpbfront[1]/title)) and ((ancestor-or-self::pwcpbfront[1]/pbfmatr))">hidden</xsl:when>
        <xsl:otherwise>hidden-block</xsl:otherwise>
     </xsl:choose>
  </xsl:variable>
  <xsl:variable name="blockness">block</xsl:variable>
  <xsl:variable name="hiddenness">yes</xsl:variable>
  <xsl:variable name="fo-class">
     <xsl:choose>
        <xsl:when test="$hiddenness='yes'">
           <xsl:text>hidden-</xsl:text>
           <xsl:value-of select="$blockness"/>
        </xsl:when>
        <xsl:when test="$hiddenness='no' and starts-with($foClass,'hidden-')">
           <xsl:value-of select="substring($foClass,8)"/>
        </xsl:when>
        <xsl:otherwise>
           <xsl:value-of select="$foClass"/>
        </xsl:otherwise>
     </xsl:choose>
  </xsl:variable>
  <xsl:choose>
     <xsl:when test="$fo-class='hidden-block'">
        <div>
           <xsl:attribute name="class">
              <xsl:text>x-title-33-0</xsl:text>
              <xsl:if test="((ancestor-or-self::pwcpbfront[1]/title)) and ((ancestor-or-self::pwcpbfront[1]/pbfmatr))"> x-title-33-1</xsl:if>
           </xsl:attribute>
           <xsl:call-template name="t-base-div-basic-h">
              <xsl:with-param name="hidden" select="$hidden"/>
           </xsl:call-template>
        </div>
     </xsl:when>
     <xsl:when test="$fo-class='block'">
        <div>
           <xsl:attribute name="class">
              <xsl:text>x-title-33-0</xsl:text>
              <xsl:if test="((ancestor-or-self::pwcpbfront[1]/title)) and ((ancestor-or-self::pwcpbfront[1]/pbfmatr))"> x-title-33-1</xsl:if>
           </xsl:attribute>
           <xsl:call-template name="t-base-div-basic"/>
        </div>
     </xsl:when>
  </xsl:choose>
</xsl:template>

<xsl:template match="pwcpbfront/title" priority="39">
  <div ch:title="notoc" class="x-title-34-0">
    <xsl:call-template name="t-base-div-title"/>
  </div>
</xsl:template>

<xsl:template match="intro/title" priority="36">
  <xsl:param name="hidden" select="'yes'"/>

  <xsl:if test="$hidden='no'">
     <div class="x-title-37-0">
        <xsl:call-template name="t-base-div-basic2"/>
     </div>
  </xsl:if>
</xsl:template>

<xsl:template match="pwcspblist/title" priority="35">
  <div ch:title="notoc" class="x-title-38-0">
    <xsl:call-template name="t-base-div-title"/>
  </div>
</xsl:template>

<xsl:template match="sblist/title" priority="32">
  <div ch:title="toc" class="x-title-41-0">
    <xsl:call-template name="t-base-div-title"/>
  </div>
</xsl:template>

<xsl:template match="pwcni/title" priority="31">
  <div ch:title="notoc" class="x-title-42-0">
    <xsl:call-template name="t-base-div-title"/>
  </div>
</xsl:template>

<xsl:template match="vendlist/title" priority="30">
  <div ch:title="toc" class="x-title-43-0">
    <xsl:call-template name="t-base-div-title"/>
  </div>
</xsl:template>

<xsl:template match="pgblk/title" priority="29">
  <div ch:title="notoc" class="x-title-44-0">
    <xsl:call-template name="t-base-div-title"/>
  </div>
</xsl:template>

<xsl:template match="lof-item/title" priority="21">
  <div ch:title="toc" class="x-title-52-0">
    <xsl:call-template name="t-base-div-title"/>
  </div>
</xsl:template>

<xsl:template match="lof/title" priority="18">
  <div ch:title="toc" class="x-title-55-0">
    <xsl:call-template name="t-base-div-title"/>
  </div>
</xsl:template>

<xsl:template match="spb-list/title" priority="14">
  <div ch:title="notoc" class="x-title-59-0">
    <xsl:call-template name="t-base-div-title"/>
  </div>
</xsl:template>

<xsl:template match="service-bull-list/title" priority="10">
  <div ch:title="notoc" class="x-title-63-0">
    <xsl:call-template name="t-base-div-title"/>
  </div>
</xsl:template>

<xsl:template match="module/title" priority="9">
  <div ch:title="toc" class="x-title-64-0">
    <xsl:call-template name="t-base-div-title"/>
  </div>
</xsl:template>

<xsl:template match="num-index/title" priority="7">
  <div ch:title="notoc" class="x-title-66-0">
    <xsl:call-template name="t-base-div-title"/>
  </div>
</xsl:template>

<xsl:template match="_ufe:tmm-title" priority="0">
  <div ch:title="notoc">
     <xsl:attribute name="class">
        <xsl:text>x--ufe-tmm-title-3-0</xsl:text>
        <xsl:if test="contains(//book/@doctype, 'lmm')"> x--ufe-tmm-title-3-1</xsl:if>
     </xsl:attribute>
    <xsl:call-template name="t-base-div-title"/>
  </div>
</xsl:template>

<xsl:template match="upa" priority="0">
  <div>
     <xsl:attribute name="class">
        <xsl:text>x-upa-1-0</xsl:text>
        <xsl:if test="not(./*[not(self::_sfe:BeforeOrAfterText)]|./text()[normalize-space(.)!=''])"> x-upa-1-1</xsl:if>
     </xsl:attribute>
     <xsl:call-template name="t-base-div-basic"/>
  </div>
</xsl:template>

<xsl:template match="uwp" priority="0">
  <span class="x-uwp-1-0">
    <xsl:call-template name="t-base-div-basic"/>
  </span>
</xsl:template>

<xsl:template match="vendata" priority="0">
  <div class="x-vendata-1-0">
    <xsl:call-template name="t-base-div-basic"/>
  </div>
</xsl:template>

<xsl:template match="vendlist" priority="0">
  <div class="x-vendlist-1-0">
    <xsl:call-template name="t-base-div-basic2"/>
  </div>
</xsl:template>

</xsl:stylesheet>
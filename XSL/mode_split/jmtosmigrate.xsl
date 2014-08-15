<?xml version="1.0" encoding="UTF-8"?>

<!DOCTYPE xsl:stylesheet [
    <!ENTITY % entities_commun SYSTEM "xsl_entities_commun.ent">
    %entities_commun;
]>
<xsl:stylesheet xmlns:simg="java:net.sf.docbook.saxon.ImageIntrinsics" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:ximg="xaln://com.nwalsh.xalan.ImageIntrinsics" xmlns="http://www.w3.org/1999/xhtml" xmlns:exslt="http://exslt.org/common" xmlns:_acl="java:com.arbortext.epic.Acl" xmlns:msxsl="urn:schemas-microsoft-com:xslt" xmlns:_="http://www.pwc.ca/namespace/doctypes/emipc" xmlns:_dtd="http://www.arbortext.com/namespace/Styler/UserElements" xmlns:atidlm="http://www.arbortext.com/namespace/atidlm" xmlns:_2="http://www.pwc.ca/namespace/doctypes/jmtosmigrate" xmlns:ch="http://www.arbortext.com/namespace/chunker" xmlns:saxon="http://saxon.sf.net/" xmlns:_5="http://www.pwc.ca/namespace/doctypes/ipc" xmlns:_gte="http://www.arbortext.com/namespace/Styler/GeneratedTextElements" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:_sfe="http://www.arbortext.com/namespace/Styler/StylerFormattingElements" xmlns:_js="java:com.arbortext.epic.internal.js.JavaScript" xmlns:_3="http://www.pwc.ca/namespace/doctypes/migrate" xmlns:_ufe="http://www.arbortext.com/namespace/Styler/UserFormattingElements" version="1.0" exclude-result-prefixes="_ atidlm xml _2 ch saxon _5 xsi _js _3 #default exslt msxsl _dtd _ufe _sfe _gte simg ximg _acl">

<xsl:include href="jmtosmigrate_expand-gentext.xsl"/>
<xsl:include href="jmtosmigrate_styler_numbering.xsl"/>
<xsl:include href="jmtosmigrate_styler-LabelAndNumberMarker.xsl"/>

<xsl:output encoding="UTF-8" method="html" omit-xml-declaration="yes" indent="yes"/>

<xsl:variable name="doctype" select="'jmtosmigrate'"/>

<xsl:include href="base.xsl"/>
<xsl:include href="process.xsl"/>

<xsl:template match="ais-item" priority="0">
  <xsl:apply-templates/>
</xsl:template>

<xsl:template match="ais-list" priority="0">
  <xsl:param name="hidden" select="'yes'"/>

  <xsl:if test="$hidden='no'">
    <span class=" x-ais-list-1-0">
      <xsl:call-template name="t-base-div-basic-h">
        <xsl:with-param name="hidden" select="$hidden"/>
      </xsl:call-template>
    </span>
  </xsl:if>
</xsl:template>

<xsl:template match="aisnbr" priority="0">
  <xsl:apply-templates/>
</xsl:template>

<xsl:template match="aistitle" priority="0">
  <xsl:apply-templates/>
</xsl:template>

<xsl:template match="_ufe:cir-title" priority="0">
  <div ch:title="toc" class=" x--ufe-cir-title-3-0">
    <xsl:call-template name="t-base-div-title"/>
  </div>
</xsl:template>

<xsl:template match="con" priority="0">
  <xsl:param name="hidden" select="'yes'"/>
  
  <span>
     <xsl:attribute name="class">
        <xsl:text> x-con-1-0</xsl:text>
        <xsl:if test="((./refint|./*[not(self::_sfe:BeforeOrAfterText)]//refint)) and (not(./connbr|./*[not(self::_sfe:BeforeOrAfterText)]//connbr))"> x-con-1-1</xsl:if>
     </xsl:attribute>
     <xsl:call-template name="t-base-div-basic-h">
        <xsl:with-param name="hidden" select="$hidden"/>
     </xsl:call-template>
  </span>
</xsl:template>

<xsl:template match="conindex" priority="0">
  <xsl:apply-templates/>
</xsl:template>

<xsl:template match="conname" priority="0">
  <span class=" x-conname-1-0">
    <xsl:call-template name="t-base-div-basic"/>
  </span>
</xsl:template>

<xsl:template match="connbr" priority="0">
  <span class=" x-connbr-1-0">
    <xsl:call-template name="t-base-div-basic"/>
  </span>
</xsl:template>

<xsl:template match="csn" priority="0">
  <span class=" x-csn-1-0">
    <xsl:call-template name="t-base-div-basic"/>
  </span>
</xsl:template>

<xsl:template match="dtlname" priority="0">
  <span class=" x-dtlname-1-0">
    <xsl:call-template name="t-base-div-basic"/>
  </span>
</xsl:template>

<xsl:template match="dtlnbr" priority="0">
  <span class=" x-dtlnbr-1-0">
    <xsl:call-template name="t-base-div-basic"/>
  </span>
</xsl:template>

<xsl:template match="pgblk/effect" priority="1">
  <div class=" x-effect-1-0">
    <xsl:call-template name="t-base-div-basic"/>
  </div>
</xsl:template>

<xsl:template match="effect" priority="0">
  <span class=" x-effect-2-0">
    <xsl:call-template name="t-base-div-basic"/>
  </span>
</xsl:template>

<xsl:template match="_ufe:eipc-title" priority="0">
  <div ch:title="notoc" class=" x--ufe-eipc-title-3-0">
    <xsl:call-template name="t-base-div-title"/>
  </div>
</xsl:template>

<xsl:template match="_ufe:em-title" priority="0">
  <div ch:title="toc" class=" x--ufe-em-title-3-0">
    <xsl:call-template name="t-base-div-title"/>
  </div>
</xsl:template>

<xsl:template match="equ[child::table]" priority="1">
  <div class=" x-equ-1-0">
    <xsl:call-template name="t-base-div-basic"/>
  </div>
</xsl:template>

<xsl:template match="equ" priority="0">
  <div class=" x-equ-2-0">
    <xsl:call-template name="t-base-div-basic"/>
  </div>
</xsl:template>

<xsl:template name="__style-for_figure.2firere271">
      <xsl:text> .x-figure-1-0
{margin-left: 0pt; margin-right: 0pt; text-indent: 0pt; margin-top:
8pt; }</xsl:text>
   </xsl:template>

<xsl:template match="figure[descendant::graphic]" priority="1">
  <xsl:variable name="l-id"><xsl:value-of select="$pf-id"/><xsl:apply-templates mode="set-id" select="."/></xsl:variable>
  <div style="display:none;" class=" x-figure-1-0">
    <xsl:copy-of select="@ch:*"/>
    <xsl:call-template name="maybe-set-id">
      <xsl:with-param name="only-if-id-attr" select="'no'"/>
      <xsl:with-param name="generated-id-prefix" select="$pf-id"/>
    </xsl:call-template>
    <xsl:attribute name="id">
      <xsl:value-of select="$l-id"/>
    </xsl:attribute>
    <xsl:apply-templates/>
  </div>
  <a href="#{$l-id}" onClick="displayGraphics('{$l-id}');">
  </a>
</xsl:template>

<xsl:template match="figure" priority="0">
  <div class=" x-figure-2-0">
    <xsl:call-template name="t-base-div-basic2"/>
  </div>
</xsl:template>

<xsl:template match="ftnote" priority="0">
  <xsl:apply-templates/>
</xsl:template>

<xsl:template match="gdesc" priority="0">
  <div class=" x-gdesc-1-0">
    <xsl:call-template name="t-base-div-basic"/>
  </div>
</xsl:template>

<xsl:template match="_ufe:glossary-title" priority="0">
  <div ch:title="notoc" class=" x--ufe-glossary-title-4-0">
    <xsl:call-template name="t-base-div-title"/>
  </div>
</xsl:template>

<xsl:template match="graphic[descendant::sheet]" priority="1">
  <xsl:variable name="l-id"><xsl:value-of select="$pf-id"/><xsl:apply-templates mode="set-id" select="."/></xsl:variable>
  <div style="display:none" class=" x-graphic-1-0">
    <xsl:copy-of select="@ch:*"/>
    <xsl:call-template name="maybe-set-id">
      <xsl:with-param name="only-if-id-attr" select="'no'"/>
      <xsl:with-param name="generated-id-prefix" select="$pf-id"/>
    </xsl:call-template>
    <xsl:attribute name="id">
      <xsl:value-of select="$l-id"/>
    </xsl:attribute>
    <xsl:apply-templates/>
  </div>
  <a href="#{$l-id}" onClick="displayGraphics('{$l-id}');">
  </a>
</xsl:template>

<xsl:template match="graphic" priority="0">
  <div class=" x-graphic-2-0">
    <xsl:call-template name="t-base-div-basic2"/>
  </div>
</xsl:template>

<xsl:template match="grphcref" priority="0">
  <xsl:variable name="l-node" select="//*[@id=current()/@refid]"/>
  <xsl:variable name="l-id"><xsl:value-of select="$pf-id"/><xsl:apply-templates mode="set-id" select="$l-node"/></xsl:variable>
  <span class=" x-grphcref-1-0">
     <xsl:call-template name="t-base-div-basic"/>
     <a href="#none" onClick="displayGraphics('{$l-id}');">
        <xsl:text> </xsl:text>
        <xsl:apply-templates mode="styler_numbering" select="$l-node/title"/>
     </a>
     <xsl:if test="@sheetnbr and string(@sheetnbr)!=''">
        <xsl:value-of select="concat(' Sheet ',@sheetnbr)"/>
     </xsl:if>
     <xsl:value-of select="@post-auto-text"/>
  </span>
</xsl:template>

<xsl:template match="hotlink" priority="0">
  <xsl:apply-templates/>
</xsl:template>

<xsl:template match="howtouse" priority="0">
  <div class=" x-howtouse-1-0">
    <xsl:call-template name="t-base-div-basic2"/>
  </div>
</xsl:template>

<xsl:template match="_ufe:howtouse-title" priority="0">
  <div ch:title="toc" class=" x--ufe-howtouse-title-3-0">
    <xsl:call-template name="t-base-div-title"/>
  </div>
</xsl:template>

<xsl:template match="ics" priority="0">
  <xsl:apply-templates/>
</xsl:template>

<xsl:template match="increv" priority="0">
  <xsl:apply-templates/>
</xsl:template>

<xsl:template match="_ufe:intro-title" priority="0">
  <div ch:title="toc" class=" x--ufe-intro-title-3-0">
    <xsl:call-template name="t-base-div-title"/>
  </div>
</xsl:template>

<xsl:template match="issdate" priority="0">
  <xsl:apply-templates/>
</xsl:template>

<xsl:template match="pbfmatr//list1/l1item[child::*[1] != 'note']" priority="4">
  <table border="0" cellpadding="0" cellspacing="0" class=" x-l1item-1-0 x--zero-left-margins">
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

<xsl:template match="pbfmatr//list1/l1item" priority="3">
  <table border="0" cellpadding="0" cellspacing="0" class=" x-l1item-2-0 x--zero-left-margins">
    <xsl:call-template name="t-base-step-table">
      <xsl:with-param name="col1-width" select="'0pt'"/>
      <xsl:with-param name="col2-width" select="''"/>
      <xsl:with-param name="col3-width" select="'100%'"/>
      <xsl:with-param name="label-col"  select="'2'"/>
      <xsl:with-param name="col2-align" select="'left'"/>
      <xsl:with-param name="apply"      select="'&lib-gentxt-warn-caut-note;'"/>
    </xsl:call-template>
  </table>
</xsl:template>

<xsl:template match="list1/l1item[child::*[1] != 'note']" priority="2">
  <xsl:apply-templates select="node()[name() = 'warning' or name() = 'caution' ]"/>
  <table border="0" cellpadding="0" cellspacing="0" class=" x-l1item-1-0 x--zero-left-margins">
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

<xsl:template match="list1/l1item" priority="1">
  <xsl:apply-templates select="node()[name() = 'warning' or name() = 'caution' or name() = 'note' ]"/>
  <table border="0" cellpadding="0" cellspacing="0" class=" x-l1item-1-0 x--zero-left-margins">
    <xsl:call-template name="t-base-step-table">
      <xsl:with-param name="col1-width" select="'0pt'"/>
      <xsl:with-param name="col2-width" select="''"/>
      <xsl:with-param name="col3-width" select="'100%'"/>
      <xsl:with-param name="label-col"  select="'2'"/>
      <xsl:with-param name="col2-align" select="'left'"/>
      <xsl:with-param name="apply"      select="'&lib-gentxt-warn-caut-note;'"/>
    </xsl:call-template>
  </table>
</xsl:template>

<xsl:template match="l1item" priority="0">
  <table border="0" cellpadding="0" cellspacing="0" class=" x-l1item-5-0 x--zero-left-margins">
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

<xsl:template match="pbfmatr//list2/l2item[child::*[1] != 'note']" priority="4">
  <table border="0" cellpadding="0" cellspacing="0" class=" x-l2item-1-0 x--zero-left-margins">
    <xsl:call-template name="t-base-step-table">
      <xsl:with-param name="col1-width" select="'1.5em'"/>
      <xsl:with-param name="col2-width" select="''"/>
      <xsl:with-param name="col3-width" select="'100%'"/>
      <xsl:with-param name="label-col"  select="'1'"/>
      <xsl:with-param name="col2-align" select="'right'"/>
      <xsl:with-param name="apply"      select="'&lib-gentxt-warn-caut;'"/>
    </xsl:call-template>
  </table>
</xsl:template>

<xsl:template match="pbfmatr//list2/l2item" priority="3">
  <table border="0" cellpadding="0" cellspacing="0" class=" x-l2item-2-0 x--zero-left-margins">
    <xsl:call-template name="t-base-step-table">
      <xsl:with-param name="col1-width" select="'1.5em'"/>
      <xsl:with-param name="col2-width" select="''"/>
      <xsl:with-param name="col3-width" select="'100%'"/>
      <xsl:with-param name="label-col"  select="'1'"/>
      <xsl:with-param name="col2-align" select="'right'"/>
      <xsl:with-param name="apply"      select="'&lib-gentxt-warn-caut-note;'"/>
    </xsl:call-template>
  </table>
</xsl:template>

<xsl:template match="list2/l2item[child::*[1] != 'note']" priority="2">
  <xsl:apply-templates select="node()[name() = 'warning' or name() = 'caution' ]"/>
  <table border="0" cellpadding="0" cellspacing="0" class=" x-l2item-1-0 x--zero-left-margins">
    <xsl:call-template name="t-base-step-table">
      <xsl:with-param name="col1-width" select="'1.5em'"/>
      <xsl:with-param name="col2-width" select="''"/>
      <xsl:with-param name="col3-width" select="'100%'"/>
      <xsl:with-param name="label-col"  select="'1'"/>
      <xsl:with-param name="col2-align" select="'right'"/>
      <xsl:with-param name="apply"      select="'&lib-gentxt-warn-caut;'"/>
    </xsl:call-template>
  </table>
</xsl:template>

<xsl:template match="list2/l2item" priority="1">
  <xsl:apply-templates select="node()[name() = 'warning' or name() = 'caution' or name() = 'note' ]"/>
  <table border="0" cellpadding="0" cellspacing="0" class=" x-l2item-1-0 x--zero-left-margins">
    <xsl:call-template name="t-base-step-table">
      <xsl:with-param name="col1-width" select="'1.5em'"/>
      <xsl:with-param name="col2-width" select="''"/>
      <xsl:with-param name="col3-width" select="'100%'"/>
      <xsl:with-param name="label-col"  select="'1'"/>
      <xsl:with-param name="col2-align" select="'right'"/>
      <xsl:with-param name="apply"      select="'&lib-gentxt-warn-caut-note;'"/>
    </xsl:call-template>
  </table>
</xsl:template>

<xsl:template match="l2item" priority="0">
  <table border="0" cellpadding="0" cellspacing="0" class=" x-l2item-5-0 x--zero-left-margins">
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

<xsl:template match="pbfmatr//list3/l3item[child::*[1] != 'note']" priority="4">
  <table border="0" cellpadding="0" cellspacing="0" class=" x-l3item-1-0 x--zero-left-margins">
    <xsl:call-template name="t-base-step-table">
      <xsl:with-param name="col1-width" select="'1.5em'"/>
      <xsl:with-param name="col2-width" select="''"/>
      <xsl:with-param name="col3-width" select="'100%'"/>
      <xsl:with-param name="label-col"  select="'1'"/>
      <xsl:with-param name="col2-align" select="'right'"/>
      <xsl:with-param name="apply"      select="'&lib-gentxt-warn-caut;'"/>
    </xsl:call-template>
  </table>
</xsl:template>

<xsl:template match="pbfmatr//list3/l3item" priority="3">
  <table border="0" cellpadding="0" cellspacing="0" class=" x-l3item-2-0 x--zero-left-margins">
    <xsl:call-template name="t-base-step-table">
      <xsl:with-param name="col1-width" select="'1.5em'"/>
      <xsl:with-param name="col2-width" select="''"/>
      <xsl:with-param name="col3-width" select="'100%'"/>
      <xsl:with-param name="label-col"  select="'1'"/>
      <xsl:with-param name="col2-align" select="'right'"/>
      <xsl:with-param name="apply"      select="'&lib-gentxt-warn-caut-note;'"/>
    </xsl:call-template>
  </table>
</xsl:template>

<xsl:template match="list3/l3item[child::*[1] != 'note']" priority="2">
  <table border="0" cellpadding="0" cellspacing="0" class=" x-l3item-1-0 x--zero-left-margins">
    <xsl:call-template name="t-base-step-table">
      <xsl:with-param name="col1-width" select="'1.5em'"/>
      <xsl:with-param name="col2-width" select="''"/>
      <xsl:with-param name="col3-width" select="'100%'"/>
      <xsl:with-param name="label-col"  select="'1'"/>
      <xsl:with-param name="col2-align" select="'right'"/>
      <xsl:with-param name="apply"      select="'&lib-gentxt-warn-caut;'"/>
    </xsl:call-template>
  </table>
</xsl:template>

<xsl:template match="list3/l3item" priority="1">
  <table border="0" cellpadding="0" cellspacing="0" class=" x-l3item-2-0 x--zero-left-margins">
    <xsl:call-template name="t-base-step-table">
      <xsl:with-param name="col1-width" select="'1.5em'"/>
      <xsl:with-param name="col2-width" select="''"/>
      <xsl:with-param name="col3-width" select="'100%'"/>
      <xsl:with-param name="label-col"  select="'1'"/>
      <xsl:with-param name="col2-align" select="'right'"/>
      <xsl:with-param name="apply"      select="'&lib-gentxt-warn-caut-note;'"/>
    </xsl:call-template>
  </table>
</xsl:template>

<xsl:template match="l3item" priority="0">
  <table border="0" cellpadding="0" cellspacing="0" class=" x-l3item-5-0 x--zero-left-margins">
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

<xsl:template match="pbfmatr//list4/l4item[child::*[1] != 'note']" priority="4">
  <table border="0" cellpadding="0" cellspacing="0" class=" x-l4item-1-0 x--zero-left-margins">
    <xsl:call-template name="t-base-step-table">
      <xsl:with-param name="col1-width" select="'1.5em'"/>
      <xsl:with-param name="col2-width" select="''"/>
      <xsl:with-param name="col3-width" select="'100%'"/>
      <xsl:with-param name="label-col"  select="'1'"/>
      <xsl:with-param name="col2-align" select="'right'"/>
      <xsl:with-param name="apply"      select="'&lib-gentxt-warn-caut;'"/>
    </xsl:call-template>
  </table>
</xsl:template>

<xsl:template match="pbfmatr//list4/l4item" priority="3">
  <table border="0" cellpadding="0" cellspacing="0" class=" x-l4item-2-0 x--zero-left-margins">
    <xsl:call-template name="t-base-step-table">
      <xsl:with-param name="col1-width" select="'1.5em'"/>
      <xsl:with-param name="col2-width" select="''"/>
      <xsl:with-param name="col3-width" select="'100%'"/>
      <xsl:with-param name="label-col"  select="'1'"/>
      <xsl:with-param name="col2-align" select="'right'"/>
      <xsl:with-param name="apply"      select="'&lib-gentxt-warn-caut-note;'"/>
    </xsl:call-template>
  </table>
</xsl:template>

<xsl:template match="list4/l4item[child::*[1] != 'note']" priority="2">
  <table border="0" cellpadding="0" cellspacing="0" class=" x-l4item-1-0 x--zero-left-margins">
    <xsl:call-template name="t-base-step-table">
      <xsl:with-param name="col1-width" select="'1.5em'"/>
      <xsl:with-param name="col2-width" select="''"/>
      <xsl:with-param name="col3-width" select="'100%'"/>
      <xsl:with-param name="label-col"  select="'1'"/>
      <xsl:with-param name="col2-align" select="'right'"/>
      <xsl:with-param name="apply"      select="'&lib-gentxt-warn-caut;'"/>
    </xsl:call-template>
  </table>
</xsl:template>

<xsl:template match="list4/l4item" priority="1">
  <table border="0" cellpadding="0" cellspacing="0" class=" x-l4item-2-0 x--zero-left-margins">
    <xsl:call-template name="t-base-step-table">
      <xsl:with-param name="col1-width" select="'1.5em'"/>
      <xsl:with-param name="col2-width" select="''"/>
      <xsl:with-param name="col3-width" select="'100%'"/>
      <xsl:with-param name="label-col"  select="'1'"/>
      <xsl:with-param name="col2-align" select="'right'"/>
      <xsl:with-param name="apply"      select="'&lib-gentxt-warn-caut-note;'"/>
    </xsl:call-template>
  </table>
</xsl:template>

<xsl:template match="l4item" priority="0">
  <table border="0" cellpadding="0" cellspacing="0" class=" x-l4item-5-0 x--zero-left-margins">
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

<xsl:template match="l5item" priority="0">
  <xsl:apply-templates/>
</xsl:template>

<xsl:template match="l6item" priority="0">
  <xsl:apply-templates/>
</xsl:template>

<xsl:template match="l7item" priority="0">
  <xsl:apply-templates/>
</xsl:template>

<xsl:template match="list1" priority="0">
  <div class=" x-list1-1-0">
    <xsl:call-template name="t-base-div-basic"/>
  </div>
</xsl:template>

<xsl:template match="list2" priority="0">
  <div class=" x-list2-1-0">
    <xsl:call-template name="t-base-div-basic"/>
  </div>
</xsl:template>

<xsl:template match="list3" priority="0">
  <div class=" x-list3-1-0">
    <xsl:call-template name="t-base-div-basic"/>
  </div>
</xsl:template>

<xsl:template match="list4" priority="0">
  <div class=" x-list4-1-0">
    <xsl:call-template name="t-base-div-basic"/>
  </div>
</xsl:template>

<xsl:template match="list5" priority="0">
  <xsl:apply-templates/>
</xsl:template>

<xsl:template match="list6" priority="0">
  <xsl:apply-templates/>
</xsl:template>

<xsl:template match="list7" priority="0">
  <xsl:apply-templates/>
</xsl:template>

<xsl:template match="lmm-statement" priority="0">
  <div class=" x-lmm-statement-1-0">
    <xsl:call-template name="t-base-div-basic"/>
  </div>
</xsl:template>

<xsl:template match="mfmatr" priority="0">
  <div class=" x-mfmatr-1-0">
    <xsl:call-template name="t-base-div-basic"/>
  </div>
</xsl:template>

<xsl:template match="name" priority="0">
  <div class=" x-name-1-0">
    <xsl:call-template name="t-base-div-basic"/>
  </div>
</xsl:template>

<xsl:template match="ncon" priority="0">
  <span class=" x-name-1-0">
    <xsl:call-template name="t-base-div-basic"/>
  </span>
</xsl:template>

<xsl:template match="module/note" priority="11">
  <div class=" x-note-1-0">
    <xsl:call-template name="t-base-div-basic"/>
  </div>
</xsl:template>

<xsl:template match="subtask/note" priority="10">
  <div class=" x-note-2-0">
    <xsl:call-template name="t-base-div-basic"/>
  </div>
</xsl:template>

<xsl:template match="task/note" priority="9">
  <div class=" x-note-3-0">
    <xsl:call-template name="t-base-div-basic"/>
  </div>
</xsl:template>

<xsl:template match="n-para/note" priority="8">
  <div>
     <xsl:attribute name="class">
        <xsl:text> x-note-4-0</xsl:text>
        <xsl:if test="@nbr"> x-note-4-1</xsl:if>
     </xsl:attribute>
     <xsl:call-template name="t-base-div-basic"/>
  </div>
</xsl:template>

<xsl:template match="procedure/note" priority="7">
  <div>
     <xsl:attribute name="class">
        <xsl:text> x-note-5-0</xsl:text>
        <xsl:if test="@nbr"> x-note-5-1</xsl:if>
     </xsl:attribute>
     <xsl:call-template name="t-base-div-basic"/>
  </div>
</xsl:template>

<xsl:template match="fandc/note" priority="6">
  <div class=" x-note-6-0">
    <xsl:call-template name="t-base-div-basic"/>
  </div>
</xsl:template>

<xsl:template match="spec-assem/note" priority="5">
  <div class=" x-note-7-0">
    <xsl:call-template name="t-base-div-basic"/>
  </div>
</xsl:template>

<xsl:template match="spring-pressure/note" priority="4">
  <div class=" x-note-8-0">
    <xsl:call-template name="t-base-div-basic"/>
  </div>
</xsl:template>

<xsl:template match="torque-and-stretch/note" priority="3">
  <div class=" x-note-9-0">
    <xsl:call-template name="t-base-div-basic"/>
  </div>
</xsl:template>

<xsl:template match="fits-and-clears/note" priority="2">
  <div class=" x-note-10-0">
    <xsl:call-template name="t-base-div-basic"/>
  </div>
</xsl:template>

<xsl:template match="note[ancestor::subpara]" priority="1">
  <div>
     <xsl:attribute name="class">
        <xsl:text> x-note-11-0</xsl:text>
        <xsl:if test="@nbr"> x-note-11-1</xsl:if>
     </xsl:attribute>
     <xsl:call-template name="t-base-div-basic"/>
  </div>
</xsl:template>

<xsl:template match="note" priority="0">
  <div>
     <xsl:attribute name="class">
        <xsl:text> x-note-12-0</xsl:text>
        <xsl:if test="@nbr"> x-note-12-1</xsl:if>
     </xsl:attribute>
     <xsl:call-template name="t-base-div-basic"/>
  </div>
</xsl:template>

<xsl:template match="_ufe:num-index-title" priority="0">
  <div ch:title="notoc" class=" x--ufe-num-index-title-4-0">
    <xsl:call-template name="t-base-div-title"/>
  </div>
</xsl:template>

<xsl:template match="numlist" priority="0">
  <div class=" x-numlist-1-0">
    <xsl:call-template name="t-base-div-basic"/>
  </div>
</xsl:template>

<xsl:template match="numlist/numlitem" priority="1">
  <table border="0" cellpadding="0" cellspacing="0" class=" x-numlitem-1-0 x--zero-left-margins">
    <xsl:call-template name="t-base-step-table">
      <xsl:with-param name="col1-width" select="'1.5em'"/>
      <xsl:with-param name="col2-width" select="''"/>
      <xsl:with-param name="col3-width" select="'100%'"/>
      <xsl:with-param name="label-col"  select="'1'"/>
      <xsl:with-param name="col2-align" select="'right'"/>
      <xsl:with-param name="apply"      select="'&lib-gentxt;'"/>
    </xsl:call-template>
  </table>
</xsl:template>

<xsl:template match="numlitem" priority="0">
  <table border="0" cellpadding="0" cellspacing="0" class=" x-numlitem-2-0 x--zero-left-margins">
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

<xsl:template match="_ufe:nut-option-title" priority="0">
  <div ch:title="notoc" class=" x--ufe-nut-option-title-4-0">
    <xsl:call-template name="t-base-div-title"/>
  </div>
</xsl:template>

<xsl:template match="frontmatter//module/pageblock-title" priority="1">
  <div ch:title="toc" class=" x-pageblock-title-1-0">
    <xsl:call-template name="t-base-div-title"/>
  </div>
</xsl:template>

<xsl:template match="pageblock-title" priority="0">
  <div ch:title="toc" class=" x-pageblock-title-2-0">
    <xsl:call-template name="t-base-div-title"/>
  </div>
</xsl:template>

<xsl:template match="part" priority="0">
  <span class=" x-part-1-0">
    <xsl:call-template name="t-base-div-basic"/>
  </span>
</xsl:template>

<xsl:template match="pbfmatr" priority="0">
  <div class=" x-pbfmatr-1-0">
    <xsl:call-template name="t-base-div-basic2"/>
  </div>
</xsl:template>

<xsl:template match="_ufe:pdlist-title" priority="0">
  <div ch:title="notoc" class=" x--ufe-pdlist-title-2-0">
    <xsl:call-template name="t-base-div-title"/>
  </div>
</xsl:template>

<xsl:template match="pgblk" priority="0">
  <div class=" x-pgblk-1-0">
    <xsl:call-template name="t-base-div-basic2"/>
  </div>
</xsl:template>

<xsl:template match="prcitem" priority="0">
  <div class=" x-prcitem-1-0">
    <xsl:call-template name="t-base-div-basic2"/>
  </div>
</xsl:template>

<xsl:template match="prclist1/prcitem1" priority="1">
  <table border="0" cellpadding="0" cellspacing="0" class=" x-prcitem1-1-0 x--zero-left-margins">
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

<xsl:template match="prcitem1" priority="0">
  <table border="0" cellpadding="0" cellspacing="0" class=" x-prcitem1-2-0 x--zero-left-margins">
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

<xsl:template match="prclist2/prcitem2" priority="1">
  <table border="0" cellpadding="0" cellspacing="0" class=" x-prcitem2-1-0 x--zero-left-margins">
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

<xsl:template match="prcitem2" priority="0">
  <table border="0" cellpadding="0" cellspacing="0" class=" x-prcitem2-2-0 x--zero-left-margins">
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

<xsl:template match="prclist3/prcitem3" priority="1">
  <table border="0" cellpadding="0" cellspacing="0" class=" x-prcitem3-1-0 x--zero-left-margins">
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

<xsl:template match="prcitem3" priority="0">
  <table border="0" cellpadding="0" cellspacing="0" class=" x-prcitem3-2-0 x--zero-left-margins">
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

<xsl:template match="prclist4/prcitem4" priority="2">
  <table border="0" cellpadding="0" cellspacing="0" class=" x-prcitem4-1-0 x--zero-left-margins">
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

<xsl:template match="numlist/prcitem4" priority="1">
  <table border="0" cellpadding="0" cellspacing="0" class=" x-prcitem4-2-0 x--zero-left-margins">
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

<xsl:template match="prcitem4" priority="0">
  <table border="0" cellpadding="0" cellspacing="0" class=" x-prcitem4-3-0 x--zero-left-margins">
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

<xsl:template match="prcitem5" priority="0">
  <xsl:apply-templates/>
</xsl:template>

<xsl:template match="prcitem6" priority="0">
  <xsl:apply-templates/>
</xsl:template>

<xsl:template match="prcitem7" priority="0">
  <xsl:apply-templates/>
</xsl:template>

<xsl:template match="prclist1" priority="0">
  <div class=" x-prclist1-1-0">
    <xsl:call-template name="t-base-div-basic"/>
  </div>
</xsl:template>

<xsl:template match="prclist2" priority="0">
  <div class=" x-prclist2-1-0">
    <xsl:call-template name="t-base-div-basic"/>
  </div>
</xsl:template>

<xsl:template match="prclist3" priority="0">
  <div class=" x-prclist3-1-0">
    <xsl:call-template name="t-base-div-basic"/>
  </div>
</xsl:template>

<xsl:template match="prclist4" priority="0">
  <div class=" x-prclist4-1-0">
    <xsl:call-template name="t-base-div-basic"/>
  </div>
</xsl:template>

<xsl:template match="prclist5" priority="0">
  <xsl:apply-templates/>
</xsl:template>

<xsl:template match="prclist6" priority="0">
  <xsl:apply-templates/>
</xsl:template>

<xsl:template match="prclist7" priority="0">
  <xsl:apply-templates/>
</xsl:template>

<xsl:template match="print-module" priority="0">
  <xsl:apply-templates/>
</xsl:template>

<xsl:template match="print-unit" priority="0">
  <xsl:apply-templates/>
</xsl:template>

<xsl:template match="pwc-awl" priority="0">
  <xsl:apply-templates/>
</xsl:template>

<xsl:template match="pwc-cgp-stmnt" priority="0">
  <div class=" x-pwc-cgp-stmnt-1-0">
    <xsl:call-template name="t-base-div-basic"/>
  </div>
</xsl:template>

<xsl:template match="pwccallout" priority="0">
  <span class=" x-pwccallout-1-0">
    <xsl:call-template name="t-base-div-basic"/>
  </span>
</xsl:template>

<xsl:template match="pwcchapsect" priority="0">
  <div class=" x-pwcchapsect-1-0">
    <xsl:call-template name="t-base-div-basic"/>
  </div>
</xsl:template>

<xsl:template match="pwcchapsect-list//pwcchapsect-item/pwcchapsect" priority="101">
  <xsl:variable name="l-par" select="name(..)"/>
  <dt>
     <xsl:attribute name="class">
        <xsl:if test="$l-par='chapsect-item' or $l-par='chapsect-title' or $l-par='ics' or $l-par='pwcchapsect-item' or $l-par='pwcspbdata' or $l-par='sbdata' or $l-par='spbnbr'">
           <xsl:value-of select="concat(' x-',$l-par,'-1-0')"/>
        </xsl:if>
        <xsl:text> x-pwcchapsect-1-0</xsl:text>
     </xsl:attribute>
     <xsl:call-template name="t-base-div-basic"/>
  </dt>
</xsl:template>

<xsl:template match="pwcchapsect-item" priority="0">
  <xsl:apply-templates/>
</xsl:template>

<xsl:template match="pwcchapsect-list" priority="0">
  <div>
     <xsl:copy-of select="@ch:*"/>
     <xsl:apply-templates select="_sfe:BeforeOrAfterText[not(preceding-sibling::*)]"/>
     <xsl:apply-templates select="_ufe:chapsect-title|_ufe:cir-title|_ufe:consumables-title|_ufe:eipc-title|_ufe:em-title|_ufe:fixequ-title|_ufe:general-title|_ufe:glossary-title|_ufe:howtouse-title|_ufe:intro-title|manual-title|_ufe:num-index-title|_ufe:nut-option-title|pageblock-title|_ufe:pdlist-title|_ufe:sblist-title|_ufe:spblist-title|_ufe:spectools-title|_ufe:supplier-list-title|_ufe:task-title|_ufe:temp-rev-title|title|_ufe:tmm-title"/>
     <dl class=" x-pwcchapsect-list-1-0">
        <xsl:call-template name="maybe-set-id"/>
        <xsl:apply-templates select="pwcchapsect-item|pwcchapsect"/>
     </dl>
     <xsl:apply-templates select="*[not(self::_sfe:BeforeOrAfterText|self::_ufe:chapsect-title|self::_ufe:cir-title|self::_ufe:consumables-title|self::_ufe:eipc-title|self::_ufe:em-title|self::_ufe:fixequ-title|self::_ufe:general-title|self::_ufe:glossary-title|self::_ufe:howtouse-title|self::_ufe:intro-title|self::manual-title|self::_ufe:num-index-title|self::_ufe:nut-option-title|self::pageblock-title|self::_ufe:pdlist-title|self::_ufe:sblist-title|self::_ufe:spblist-title|self::_ufe:spectools-title|self::_ufe:supplier-list-title|self::_ufe:task-title|self::_ufe:temp-rev-title|self::title|self::_ufe:tmm-title|self::pwcchapsect-item|self::pwcchapsect|self::title)]"/>
     <xsl:apply-templates select="_sfe:BeforeOrAfterText[not(following-sibling::*)][preceding-sibling::*]"/>
  </div>
</xsl:template>

<xsl:template match="pwccss" priority="0">
  <div class=" x-pwccss-1-0">
    <xsl:call-template name="t-base-div-basic"/>
  </div>
</xsl:template>

<xsl:template match="pwcem-apu-title" priority="0">
  <xsl:apply-templates/>
</xsl:template>

<xsl:template match="pwcem-title" priority="0">
  <div class=" x-pwcem-title-1-0">
    <xsl:call-template name="t-base-div-basic"/>
  </div>
</xsl:template>

<xsl:template match="pwcemtask" priority="0">
  <xsl:apply-templates/>
</xsl:template>

<xsl:template match="pwclmm-title" priority="0">
  <div class=" x-pwclmm-title-1-0">
    <xsl:call-template name="t-base-div-basic"/>
  </div>
</xsl:template>

<xsl:template match="pwcni" priority="0">
  <div class=" x-pwcni-1-0">
    <xsl:call-template name="t-base-div-basic"/>
  </div>
</xsl:template>

<xsl:template match="pwcnitem" priority="0">
  <div class=" x-pwcnitem-1-0">
    <xsl:call-template name="t-base-div-basic"/>
  </div>
</xsl:template>

<xsl:template match="pwcpbfront" priority="0">
  <xsl:apply-templates/>
</xsl:template>

<xsl:template match="pwcsbnbr" priority="0">
  <span class=" x-pwcsbnbr-1-0">
    <xsl:copy-of select="@ch:*"/>
	<xsl:call-template name="maybe-set-id"/>
	<a onClick="sbLink('{.}');">
      <xsl:apply-templates/>
    </a>
  </span>
</xsl:template>

<xsl:template match="pwcsoa" priority="0">
  <xsl:param name="hidden" select="'yes'"/>
  
  <xsl:variable name="foClass">
     <xsl:choose>
        <xsl:when test="not(@size) or (@size and string(@size)!='med')">hidden</xsl:when>
        <xsl:otherwise>graphic-block</xsl:otherwise>
     </xsl:choose>
  </xsl:variable>
  <xsl:variable name="blockness">block</xsl:variable>
  <xsl:variable name="hiddenness">
     <xsl:choose>
        <xsl:when test="not(@size) or (@size and string(@size)!='med')">yes</xsl:when>
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
        <xsl:if test="$hidden='no'">
           <div>
              <xsl:attribute name="class">
                 <xsl:text> x-pwcsoa-1-0</xsl:text>
                 <xsl:if test="not(@size) or (@size and string(@size)!='med')"> x-pwcsoa-1-1</xsl:if>
              </xsl:attribute>
              <xsl:call-template name="t-base-div-basic"/>
           </div>
        </xsl:if>
     </xsl:when>
     <xsl:when test="$fo-class='block'">
        <div>
           <xsl:attribute name="class">
              <xsl:text> x-pwcsoa-1-0</xsl:text>
              <xsl:if test="not(@size) or (@size and string(@size)!='med')"> x-pwcsoa-1-1</xsl:if>
           </xsl:attribute>
           <xsl:call-template name="t-base-div-basic"/>
        </div>
     </xsl:when>
     <xsl:when test="$fo-class='graphic-block'">
        <div>
           <xsl:attribute name="class">
              <xsl:text> x-pwcsoa-1-0</xsl:text>
              <xsl:if test="not(@size) or (@size and string(@size)!='med')"> x-pwcsoa-1-1</xsl:if>
           </xsl:attribute>
           <xsl:call-template name="t-base-img-graphic"/>
        </div>
     </xsl:when>
  </xsl:choose>
</xsl:template>

<xsl:template match="pwcspbdata" priority="0">
  <xsl:apply-templates/>
</xsl:template>

<xsl:template match="pwcspblist" priority="0">
  <div class=" x-pwcspblist-1-0">
    <xsl:call-template name="t-base-div-basic2"/>
  </div>
</xsl:template>

<xsl:template match="pwcspbnbr" priority="0">
  <span class=" x-pwcspbnbr-1-0">
    <xsl:copy-of select="@ch:*"/>
    <xsl:call-template name="maybe-set-id"/>
    <a onClick="spbLink('{.}');">
      <xsl:apply-templates/>
    </a>
  </span>
</xsl:template>

<xsl:template match="sbdata" priority="0">
  <xsl:apply-templates/>
</xsl:template>

<xsl:template match="sbeff" priority="0">
  <span>
     <xsl:attribute name="class">
        <xsl:text> x-sbeff-1-0</xsl:text>
        <xsl:if test="@sbcond='NA' or @sbcond='na' or not(@sbcond) or @sbcond='RWK' or @sbcond='rwk'"> x-sbeff-1-1</xsl:if>
     </xsl:attribute>
     <xsl:copy-of select="@ch:*"/>
     <xsl:call-template name="maybe-set-id"/>
     <a href="#" onClick="sbLink('{.}');">
        <xsl:apply-templates/>
     </a>
  </span>
</xsl:template>

<xsl:template match="_ufe:sblist-title" priority="0">
  <div ch:title="toc" class=" x--ufe-sblist-title-3-0">
    <xsl:call-template name="t-base-div-title"/>
  </div>
</xsl:template>

<xsl:template match="sbnbr" priority="0">
  <div class=" x-sbnbr-1-0">
     <xsl:copy-of select="@ch:*"/>
     <xsl:call-template name="maybe-set-id"/>
     <a href="#" onClick="sbLink('{.}');">
        <xsl:apply-templates/>
     </a>
  </div>
</xsl:template>

<xsl:template match="sblist//sbdata/sbnbr" priority="101">
  <xsl:variable name="l-par" select="name(..)"/>
  <dt>
     <xsl:attribute name="class">
        <xsl:if test="$l-par='ics' or $l-par='pwcchapsect-item' or $l-par='sbdata' or $l-par='spbnbr'">
           <xsl:value-of select="concat(' x-',$l-par,'-1-0')"/>
        </xsl:if>
        <xsl:text> x-sbnbr-1-0</xsl:text>
     </xsl:attribute>
     <xsl:call-template name="t-base-div-basic"/>
  </dt>
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
              <xsl:text> x-sheet-1-0</xsl:text>
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
              <xsl:text> x-sheet-1-0</xsl:text>
              <xsl:if test="count(following-sibling::sheet[@size='big']) &gt; 0"> x-sheet-1-1</xsl:if>
              <xsl:if test="not(@size) or (@size and string(@size)!='big')"> x-sheet-1-2</xsl:if>
           </xsl:attribute>
           <xsl:if test="count(following-sibling::sheet[@size='big']) &gt; 0">
              <xsl:attribute name="style">margin-bottom: 8pt; border-bottom: 2px solid #000000;</xsl:attribute>
           </xsl:if>
           <xsl:call-template name="t-base-div-basic"/>
        </div>
     </xsl:when>
     <xsl:when test="$fo-class='graphic-block'">
        <div>
           <xsl:attribute name="class">
              <xsl:text> x-sheet-1-0</xsl:text>
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

<xsl:template match="slavename" priority="0">
  <span class=" x-slavename-1-0">
    <xsl:call-template name="t-base-div-basic"/>
  </span>
</xsl:template>

<xsl:template match="slavenbr" priority="0">
  <span class=" x-slavenbr-1-0">
    <xsl:call-template name="t-base-div-basic"/>
  </span>
</xsl:template>

<xsl:template match="slavepart" priority="0">
  <span class=" x-slavepart-1-0">
    <xsl:call-template name="t-base-div-basic"/>
  </span>
</xsl:template>

<xsl:template match="_ufe:spblist-title" priority="0">
  <div ch:title="toc" class=" x--ufe-spblist-title-3-0">
    <xsl:call-template name="t-base-div-title"/>
  </div>
</xsl:template>

<xsl:template match="spbnbr" priority="0">
  <a onClick="spbLink('{.}');">
    <xsl:apply-templates/>
  </a>
</xsl:template>

<xsl:template match="pwcspblist//pwcspbdata/spbnbr" priority="101">
  <xsl:variable name="l-par" select="name(..)"/>
  <dt>
     <xsl:attribute name="class">
        <xsl:if test="$l-par='chapsect-item' or $l-par='ics' or $l-par='pwcchapsect-item' or $l-par='pwcspbdata' or $l-par='sbdata' or $l-par='spbnbr'">
           <xsl:value-of select="concat(' x-',$l-par,'-1-0')"/>
        </xsl:if>
        <xsl:text> x-spbnbr-1-0</xsl:text>
     </xsl:attribute>
     <xsl:call-template name="t-base-div-basic"/>
  </dt>
</xsl:template>

<xsl:template match="statement" priority="0">
  <xsl:param name="hidden" select="'yes'"/>
  
  <xsl:if test="$hidden='no'">
    <div class=" x-statement-1-0">
      <xsl:call-template name="t-base-div-basic"/>
    </div>
  </xsl:if>
</xsl:template>

<xsl:template match="std" priority="0">
  <xsl:param name="hidden" select="'yes'"/>
  
  <span>
     <xsl:attribute name="class">
        <xsl:text> x-std-1-0</xsl:text>
        <xsl:if test="(self::std/stdnbr[contains(., 'NA')]) and (string-length(self::std/stdnbr) = 2)"> x-std-1-1</xsl:if>
     </xsl:attribute>
     <xsl:call-template name="t-base-div-basic-h">
        <xsl:with-param name="hidden" select="$hidden"/>
     </xsl:call-template>
  </span>
</xsl:template>

<xsl:template match="stdname" priority="0">
  <span class=" x-stdname-1-0">
    <xsl:call-template name="t-base-div-basic"/>
  </span>
</xsl:template>

<xsl:template match="stdnbr" priority="0">
  <span class=" x-stdnbr-1-0">
    <xsl:call-template name="t-base-div-basic"/>
  </span>
</xsl:template>

<xsl:template match="numlist/step" priority="3">
  <table border="0" cellpadding="0" cellspacing="0" style="table-layout: fixed; " class=" x-step-1-0 x--zero-left-margins">
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

<xsl:template match="procedure//step[child::*[1] != 'note']" priority="2">
  <xsl:apply-templates select="node()[name() = 'warning' or name() = 'caution' ]"/>
  <table border="0" cellpadding="0" cellspacing="0" class=" x-step-2-0 x--zero-left-margins">
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

<xsl:template match="procedure//step" priority="10">
  <xsl:apply-templates select="node()[name() = 'warning' or name() = 'caution' or name() = 'note' ]"/>
  <table border="0" cellpadding="0" cellspacing="0" width="100%" class=" x-step-1-0 x--zero-left-margins">
    <xsl:call-template name="t-base-step-table">
      <xsl:with-param name="col1-width" select="'0pt'"/>
      <xsl:with-param name="col2-width" select="''"/>
      <xsl:with-param name="col3-width" select="'100%'"/>
      <xsl:with-param name="label-col"  select="'2'"/>
      <xsl:with-param name="col2-align" select="'left'"/>
      <xsl:with-param name="apply"      select="'&lib-gentxt-warn-caut-note;'"/>
    </xsl:call-template>
  </table>
</xsl:template>

<xsl:template match="step" priority="0">
  <table border="0" cellpadding="0" cellspacing="0" class=" x-step-4-0 x--zero-left-margins">
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
  <table border="0" cellpadding="0" cellspacing="0" style="table-layout: fixed; " class=" x-step2-1-0 x--zero-left-margins">
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

<xsl:template match="step2[child::*[1] != 'note']" priority="1">
  <xsl:apply-templates select="node()[name() = 'warning' or name() = 'caution' ]"/>
  <table border="0" cellpadding="0" cellspacing="0" class=" x-step2-2-0 x--zero-left-margins">
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
  <xsl:apply-templates select="node()[name() = 'warning' or name() = 'caution' or name() = 'note' ]"/>
  <table border="0" cellpadding="0" cellspacing="0" width="100%" class=" x-step2-1-0 x--zero-left-margins">
    <xsl:call-template name="t-base-step-table">
      <xsl:with-param name="col1-width" select="'0pt'"/>
      <xsl:with-param name="col2-width" select="''"/>
      <xsl:with-param name="col3-width" select="'100%'"/>
      <xsl:with-param name="label-col"  select="'2'"/>
      <xsl:with-param name="col2-align" select="'left'"/>
      <xsl:with-param name="apply"      select="'&lib-gentxt-warn-caut-note;'"/>
    </xsl:call-template>
  </table>
</xsl:template>

<xsl:template match="numlist/step3" priority="2">
  <table border="0" cellpadding="0" cellspacing="0" style="table-layout: fixed; " class=" x-step3-1-0 x--zero-left-margins">
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

<xsl:template match="step3[child::*[1] != 'note']" priority="1">
  <xsl:apply-templates select="node()[name() = 'warning' or name() = 'caution' ]"/>
  <table border="0" cellpadding="0" cellspacing="0" class=" x-step3-2-0 x--zero-left-margins">
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
  <xsl:apply-templates select="node()[name() = 'warning' or name() = 'caution' or name() = 'note' ]"/>
  <table border="0" cellpadding="0" cellspacing="0" class=" x-step3-1-0 x--zero-left-margins">
    <xsl:call-template name="t-base-step-table">
      <xsl:with-param name="col1-width" select="'0pt'"/>
      <xsl:with-param name="col2-width" select="''"/>
      <xsl:with-param name="col3-width" select="'100%'"/>
      <xsl:with-param name="label-col"  select="'2'"/>
      <xsl:with-param name="col2-align" select="'left'"/>
      <xsl:with-param name="apply"      select="'&lib-gentxt-warn-caut-note;'"/>
    </xsl:call-template>
  </table>
</xsl:template>

<xsl:template match="numlist/step4" priority="2">
  <table border="0" cellpadding="0" cellspacing="0" style="table-layout: fixed; " class=" x-step4-1-0 x--zero-left-margins">
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

<xsl:template match="step4[child::*[1] != 'note']" priority="1">
  <xsl:apply-templates select="node()[name() = 'warning' or name() = 'caution' ]"/>
  <table border="0" cellpadding="0" cellspacing="0" class=" x-step4-2-0 x--zero-left-margins">
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
  <xsl:apply-templates select="node()[name() = 'warning' or name() = 'caution' or name() = 'note' ]"/>
  <table border="0" cellpadding="0" cellspacing="0" class=" x-step4-1-0 x--zero-left-margins">
    <xsl:call-template name="t-base-step-table">
      <xsl:with-param name="col1-width" select="'0pt'"/>
      <xsl:with-param name="col2-width" select="''"/>
      <xsl:with-param name="col3-width" select="'100%'"/>
      <xsl:with-param name="label-col"  select="'2'"/>
      <xsl:with-param name="col2-align" select="'left'"/>
      <xsl:with-param name="apply"      select="'&lib-gentxt-warn-caut-note;'"/>
    </xsl:call-template>
  </table>
</xsl:template>

<xsl:template match="numlist/step5" priority="2">
  <table border="0" cellpadding="0" cellspacing="0" style="table-layout: fixed; " class=" x-step5-1-0 x--zero-left-margins">
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

<xsl:template match="step5[child::*[1] != 'note']" priority="1">
  <xsl:apply-templates select="node()[name() = 'warning' or name() = 'caution' ]"/>
  <table border="0" cellpadding="0" cellspacing="0" class=" x-step5-2-0 x--zero-left-margins">
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
  <xsl:apply-templates select="node()[name() = 'warning' or name() = 'caution' or name() = 'note' ]"/>
  <table border="0" cellpadding="0" cellspacing="0" class=" x-step5-2-0 x--zero-left-margins">
    <xsl:call-template name="t-base-step-table">
      <xsl:with-param name="col1-width" select="'0pt'"/>
      <xsl:with-param name="col2-width" select="'0pt'"/>
      <xsl:with-param name="col3-width" select="''"/>
      <xsl:with-param name="label-col"  select="'3'"/>
      <xsl:with-param name="col2-align" select="'center'"/>
      <xsl:with-param name="apply"      select="'&lib-gentxt-warn-caut-note;'"/>
    </xsl:call-template>
  </table>
</xsl:template>

<xsl:template match="subtask" priority="0">
  <div>
     <xsl:attribute name="class">
        <xsl:text> x-subtask-1-0</xsl:text>
        <xsl:choose>
          <xsl:when test="(@confltr and string(@confltr)!='') and (@varnbr and string(@varnbr)!='') and (@varnbr and string(@varnbr)!='0')"> x-subtask-1-1</xsl:when>
          <xsl:when test="(@confltr and string(@confltr)!='')"> x-subtask-1-2</xsl:when>
          <xsl:when test="(@varnbr and string(@varnbr)!='') and (@varnbr and string(@varnbr)!='0')"> x-subtask-1-3</xsl:when>
        </xsl:choose>
     </xsl:attribute>
     <xsl:call-template name="t-base-div-basic2"/>
  </div>
</xsl:template>

<xsl:template match="_ufe:supplier-list-title" priority="0">
  <div ch:title="notoc" class=" x--ufe-supplier-list-title-4-0">
    <xsl:call-template name="t-base-div-title"/>
  </div>
</xsl:template>

<xsl:template match="task" priority="0">
  <div>
     <xsl:attribute name="class">
        <xsl:text> x-task-1-0</xsl:text>
        <xsl:if test="(@confltr and string(@confltr)!='')"> x-task-1-1</xsl:if>
        <xsl:if test="(@varnbr and string(@varnbr)!='') and (@varnbr and string(@varnbr)!='0')"> x-task-1-2</xsl:if>
     </xsl:attribute>
     <xsl:call-template name="t-base-div-basic2"/>
  </div>
</xsl:template>

<xsl:template match="pbfmatr//_ufe:task-title" priority="1">
  <div ch:title="toc" class=" x--ufe-task-title-3-0">
    <xsl:call-template name="t-base-div-title"/>
  </div>
</xsl:template>

<xsl:template match="taskproc" priority="0">
  <div class=" x-taskproc-1-0">
    <xsl:call-template name="t-base-div-basic2"/>
  </div>
</xsl:template>

<xsl:template match="ted" priority="0">
  <xsl:param name="hidden" select="'yes'"/>

  <span class=" x-ted-1-0">
    <xsl:call-template name="t-base-div-basic-h">
      <xsl:with-param name="hidden" select="$hidden"/>
    </xsl:call-template>
  </span>
</xsl:template>

<xsl:template match="teddtl" priority="0">
  <xsl:param name="hidden" select="'yes'"/>

  <span class=" x-teddtl-1-0">
    <xsl:call-template name="t-base-div-basic-h">
      <xsl:with-param name="hidden" select="$hidden"/>
    </xsl:call-template>
  </span>
</xsl:template>

<xsl:template match="_ufe:temp-rev-title" priority="0">
  <div ch:title="toc" class=" x--ufe-temp-rev-title-3-0">
    <xsl:call-template name="t-base-div-title"/>
  </div>
</xsl:template>

<xsl:template match="tfmatr" priority="0">
  <div class=" x-tfmatr-1-0">
    <xsl:call-template name="t-base-div-basic"/>
  </div>
</xsl:template>

<xsl:template match="book[contains(@doctype, 'ipc')]/frontmatter//figure/title" priority="68">
  <div ch:title="notoc" class=" x-title-5-0">
    <xsl:call-template name="t-base-div-title"/>
  </div>
</xsl:template>

<xsl:template match="module[@module-name='Airworthiness_Limits']/pgblk/title" priority="65">
  <div ch:title="toc" class=" x-title-8-0">
    <xsl:call-template name="t-base-div-title"/>
  </div>
</xsl:template>

<xsl:template match="page-block[@pb-name='ni']//mfmatr/title" priority="56">
  <div ch:title="toc" class=" x-title-17-0">
    <xsl:call-template name="t-base-div-title"/>
  </div>
</xsl:template>

<xsl:template match="page-block[@pb-name='record-of-revisions']//n-para/title" priority="55">
  <div ch:title="notoc" class=" x-title-18-0">
    <xsl:call-template name="t-base-div-title"/>
  </div>
</xsl:template>

<xsl:template match="book[contains(@doctype, 'epc')]//figure/title" priority="54">
  <div ch:title="notoc" class=" x-title-19-0">
    <xsl:call-template name="t-base-div-title"/>
  </div>
</xsl:template>

<xsl:template match="book[contains(@doctype, 'epc')]//graphic/title" priority="53">
  <div ch:title="notoc" class=" x-title-20-0">
    <xsl:call-template name="t-base-div-title"/>
  </div>
</xsl:template>

<xsl:template match="book[contains(@doctype, 'ipc')]//figure/title" priority="52">
  <div ch:title="notoc" class=" x-title-21-0">
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
              <xsl:text> x-title-33-0</xsl:text>
              <xsl:if test="((ancestor-or-self::pwcpbfront[1]/title)) and ((ancestor-or-self::pwcpbfront[1]/pbfmatr))"> x-title-33-1</xsl:if>
           </xsl:attribute>
           <xsl:call-template name="t-base-div-basic2-h">
              <xsl:with-param name="hidden" select="$hidden"/>
           </xsl:call-template>
        </div>
     </xsl:when>
     <xsl:when test="$fo-class='block'">
        <div>
           <xsl:attribute name="class">
              <xsl:text> x-title-33-0</xsl:text>
              <xsl:if test="((ancestor-or-self::pwcpbfront[1]/title)) and ((ancestor-or-self::pwcpbfront[1]/pbfmatr))"> x-title-33-1</xsl:if>
           </xsl:attribute>
           <xsl:call-template name="t-base-div-basic2"/>
        </div>
     </xsl:when>
  </xsl:choose>
</xsl:template>

<xsl:template match="pwcpbfront/title" priority="39">
  <div ch:title="toc" class=" x-title-34-0">
    <xsl:call-template name="t-base-div-title"/>
  </div>
</xsl:template>

<xsl:template match="intro/title" priority="36">
  <xsl:param name="hidden" select="'yes'"/>
  
  <xsl:if test="$hidden='no'">
    <div class=" x-title-37-0">
      <xsl:call-template name="t-base-div-basic"/>
    </div>
  </xsl:if>
</xsl:template>

<xsl:template match="pwcspblist/title" priority="35">
  <div ch:title="toc" class=" x-title-38-0">
    <xsl:call-template name="t-base-div-title"/>
  </div>
</xsl:template>

<xsl:template match="sblist/title" priority="32">
  <div ch:title="toc" class=" x-title-41-0">
    <xsl:call-template name="t-base-div-title"/>
  </div>
</xsl:template>

<xsl:template match="pwcni/title" priority="31">
  <div ch:title="toc" class=" x-title-42-0">
    <xsl:call-template name="t-base-div-title"/>
  </div>
</xsl:template>

<xsl:template match="vendlist/title" priority="30">
  <div ch:title="notoc" class=" x-title-43-0">
    <xsl:call-template name="t-base-div-title"/>
  </div>
</xsl:template>

<xsl:template match="pgblk/title" priority="29">
  <div ch:title="toc" class=" x-title-44-0">
    <xsl:call-template name="t-base-div-title"/>
  </div>
</xsl:template>

<xsl:template match="lof-item/title" priority="21">
  <div ch:title="toc" class=" x-title-52-0">
    <xsl:call-template name="t-base-div-title"/>
  </div>
</xsl:template>

<xsl:template match="lof/title" priority="18">
  <div ch:title="toc" class=" x-title-55-0">
    <xsl:call-template name="t-base-div-title"/>
  </div>
</xsl:template>

<xsl:template match="spb-list/title" priority="14">
  <div ch:title="notoc" class=" x-title-59-0">
    <xsl:call-template name="t-base-div-title"/>
  </div>
</xsl:template>

<xsl:template match="service-bull-list/title" priority="10">
  <div ch:title="notoc" class=" x-title-63-0">
    <xsl:call-template name="t-base-div-title"/>
  </div>
</xsl:template>

<xsl:template match="module/title" priority="9">
  <div ch:title="notoc" class=" x-title-64-0">
    <xsl:call-template name="t-base-div-title"/>
  </div>
</xsl:template>

<xsl:template match="num-index/title" priority="7">
  <div ch:title="notoc" class=" x-title-66-0">
    <xsl:call-template name="t-base-div-title"/>
  </div>
</xsl:template>

<xsl:template match="pwcchapsect-list//pwcchapsect-item/title" priority="100">
  <xsl:variable name="l-par" select="name(..)"/>
  <dd>
     <xsl:attribute name="class">
        <xsl:if test="$l-par='chapsect-item' or $l-par='chapsect-title' or $l-par='ics' or $l-par='pwcchapsect-item' or $l-par='pwcspbdata' or $l-par='sbdata' or $l-par='spbnbr'">
           <xsl:value-of select="concat(' x-',$l-par,'-1-0')"/>
        </xsl:if>
        <xsl:text> x-title-45-0</xsl:text>
     </xsl:attribute>
     <xsl:call-template name="t-base-div-basic2"/>
  </dd>
</xsl:template>

<xsl:template match="_ufe:tmm-title" priority="0">
  <div ch:title="toc">
     <xsl:attribute name="class">
        <xsl:text> x--ufe-tmm-title-3-0</xsl:text>
        <xsl:if test="contains(//book/@doctype, 'lmm')"> x--ufe-tmm-title-3-1</xsl:if>
     </xsl:attribute>
    <xsl:call-template name="t-base-div-title"/>
  </div>
</xsl:template>

<xsl:template match="tprereq" priority="0">
  <div class=" x-tprereq-1-0">
    <xsl:call-template name="t-base-div-basic2"/>
  </div>
</xsl:template>

<xsl:template match="transltr" priority="0">
  <xsl:apply-templates/>
</xsl:template>

<xsl:template match="trdata" priority="0">
  <div class=" x-trdata-1-0">
    <xsl:call-template name="t-base-div-basic"/>
  </div>
</xsl:template>

<xsl:template match="trlist" priority="0">
  <div class=" x-trlist-1-0">
    <xsl:call-template name="t-base-div-basic"/>
  </div>
</xsl:template>

<xsl:template match="trloc" priority="0">
  <span class=" x-trloc-1-0">
    <xsl:call-template name="t-base-div-basic"/>
  </span>
</xsl:template>

<xsl:template match="trnbr" priority="0">
  <span class=" x-trnbr-1-0">
    <xsl:call-template name="t-base-div-basic"/>
  </span>
</xsl:template>

<xsl:template match="trstatus" priority="0">
  <span class=" x-trstatus-1-0">
    <xsl:call-template name="t-base-div-basic"/>
  </span>
</xsl:template>

<xsl:template match="txtgrphc" priority="0">
  <xsl:apply-templates/>
</xsl:template>

<xsl:template match="txtline" priority="0">
  <xsl:apply-templates/>
</xsl:template>

</xsl:stylesheet>
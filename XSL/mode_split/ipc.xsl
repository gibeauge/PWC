<?xml version="1.0" encoding="UTF-8"?>

<!DOCTYPE xsl:stylesheet [
    <!ENTITY % entities_commun SYSTEM "xsl_entities_commun.ent">
    %entities_commun;
]>
<xsl:stylesheet 
  xmlns:xsl="http://www.w3.org/1999/XSL/Transform" 
  xmlns="http://www.w3.org/1999/xhtml" 
  xmlns:exslt="http://exslt.org/common" 
  xmlns:ch="http://www.arbortext.com/namespace/chunker" 
  xmlns:saxon="http://saxon.sf.net/" 
  xmlns:_gte="http://www.arbortext.com/namespace/Styler/GeneratedTextElements" 
  xmlns:_sfe="http://www.arbortext.com/namespace/Styler/StylerFormattingElements" 
  xmlns:_ufe="http://www.arbortext.com/namespace/Styler/UserFormattingElements" 
  version="1.0" 
  exclude-result-prefixes="ch saxon #default exslt _ufe _sfe _gte">

<xsl:include href="ipc_expand-gentext.xsl"/>
<xsl:include href="ipc_set-countas.xsl"/>
<xsl:include href="ipc_styler_numbering.xsl"/>
<xsl:include href="ipc_styler-LabelAndNumberMarker.xsl"/>

<xsl:output encoding="UTF-8" method="xml" omit-xml-declaration="yes"/>

<xsl:variable name="doctype" select="'ipc'"/>

<xsl:include href="base.xsl"/>
<xsl:include href="base_steps_set-countas.xsl"/>
<xsl:include href="base_steps_styler_numbering.xsl"/>
<xsl:include href="process.xsl"/>

<xsl:template match="attach-parts" priority="0">
  <div class=" x-attach-parts-1-0">
    <xsl:call-template name="t-base-div-basic"/>
  </div>
</xsl:template>

<xsl:template match="bs-group" priority="0">
  <xsl:apply-templates/>
</xsl:template>

<xsl:template match="build-spec" priority="0">
  <div class=" x-build-spec-1-0">
    <xsl:call-template name="t-base-div-basic"/>
  </div>
</xsl:template>

<xsl:template match="chap" priority="0">
  <xsl:apply-templates/>
</xsl:template>

<xsl:template match="_ufe:cir-title" priority="0">
  <div ch:title="notoc" class=" x--ufe-cir-title-3-0">
    <xsl:call-template name="t-base-div-title"/>
  </div>
</xsl:template>

<xsl:template match="dimen" priority="0">
  <span class=" x-dimen-1-0">
    <xsl:call-template name="t-base-div-basic"/>
  </span>
</xsl:template>

<xsl:template match="eff-bs" priority="0">
  <span class=" x-eff-bs-1-0">
    <xsl:call-template name="t-base-div-basic"/>
  </span>
</xsl:template>

<xsl:template match="eff-code" priority="0">
  <div class=" x-eff-code-1-0">
    <xsl:call-template name="t-base-div-basic"/>
  </div>
</xsl:template>

<xsl:template match="eff-letter" priority="0">
  <span class=" x-eff-letter-1-0">
    <xsl:call-template name="t-base-div-basic"/>
  </span>
</xsl:template>

<xsl:template match="eff-model" priority="0">
  <span class=" x-eff-model-1-0">
    <xsl:call-template name="t-base-div-basic"/>
  </span>
</xsl:template>

<xsl:template match="_ufe:eipc-title" priority="0">
  <div ch:title="notoc" class=" x--ufe-eipc-title-3-0">
    <xsl:call-template name="t-base-div-title"/>
  </div>
</xsl:template>

<xsl:template match="_ufe:em-title" priority="0">
  <div ch:title="notoc" class=" x--ufe-em-title-3-0">
    <xsl:call-template name="t-base-div-title"/>
  </div>
</xsl:template>

<xsl:template match="fignote" priority="0">
  <div class=" x-fignote-1-0">
    <xsl:call-template name="t-base-div-basic"/>
  </div>
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
        <xsl:text>styler-id</xsl:text>
        <xsl:apply-templates mode="set-id" select="."/>
     </xsl:attribute>
     <xsl:apply-templates/>
  </div>
  <a href="#{$l-id}" onclick="displayGraphics('{$l-id}');">
     <img alt="Graphic" src="{descendant::graphic[@size='thm']/@negnumber}">
     </img>
  </a>
</xsl:template>

<xsl:template match="figure" priority="0">
  <div class=" x-figure-2-0">
    <xsl:call-template name="t-base-div-basic2"/>
  </div>
</xsl:template>

<xsl:template match="_ufe:glossary-title" priority="0">
  <div ch:title="notoc" class=" x--ufe-glossary-title-4-0">
    <xsl:call-template name="t-base-div-title"/>
  </div>
</xsl:template>

<xsl:template match="graphic" priority="0">
  <xsl:param name="hidden" select="'yes'"/>

  <xsl:variable name="foClass">
     <xsl:choose>
        <xsl:when test="not(@size) or (@size and string(@size)!='big')">hidden</xsl:when>
        <xsl:when test="count(following-sibling::graphic[@size='big']) &gt; 0">graphic-block</xsl:when>
        <xsl:otherwise>graphic-block</xsl:otherwise>
     </xsl:choose>
  </xsl:variable>
  <xsl:variable name="blockness">block</xsl:variable>
  <xsl:variable name="hiddenness">
     <xsl:choose>
        <xsl:when test="not(@size) or (@size and string(@size)!='big')">yes</xsl:when>
        <xsl:when test="count(following-sibling::graphic[@size='big']) &gt; 0">no</xsl:when>
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
        <xsl:if test="$hidden=no">
           <div>
              <xsl:attribute name="class">
                 <xsl:text> x-graphic-1-0</xsl:text>
                 <xsl:if test="count(following-sibling::graphic[@size='big']) &gt; 0"> x-graphic-1-1</xsl:if>
                 <xsl:if test="not(@size) or (@size and string(@size)!='big')"> x-graphic-1-2</xsl:if>
              </xsl:attribute>
              <xsl:call-template name="t-base-div-basic"/>
           </div>
        </xsl:if>
     </xsl:when>
     <xsl:when test="$fo-class='block'">
        <div>
           <xsl:attribute name="class">
              <xsl:text> x-graphic-1-0</xsl:text>
              <xsl:if test="count(following-sibling::graphic[@size='big']) &gt; 0"> x-graphic-1-1</xsl:if>
              <xsl:if test="not(@size) or (@size and string(@size)!='big')"> x-graphic-1-2</xsl:if>
           </xsl:attribute>
           <xsl:if test="count(following-sibling::graphic[@size='big']) &gt; 0">
              <xsl:attribute name="style">margin-bottom: 8pt; border-bottom: 2px solid #000000;</xsl:attribute>
           </xsl:if>
           <xsl:call-template name="t-base-div-basic"/>
        </div>
     </xsl:when>
     <xsl:when test="$fo-class='graphic-block'">
        <div>
           <xsl:attribute name="class">
              <xsl:text> x-graphic-1-0</xsl:text>
              <xsl:if test="count(following-sibling::graphic[@size='big']) &gt; 0"> x-graphic-1-1</xsl:if>
              <xsl:if test="not(@size) or (@size and string(@size)!='big')"> x-graphic-1-2</xsl:if>
           </xsl:attribute>
           <xsl:if test="count(following-sibling::graphic[@size='big']) &gt; 0">
              <xsl:attribute name="style">margin-bottom: 8pt; border-bottom: 2px solid #000000;</xsl:attribute>
           </xsl:if>
           <xsl:call-template name="t-base-img-graphic"/>
           <xsl:if test="@annot">
              <div style="margin-bottom: 8pt;"><xsl:value-of select="@annot"/></div>
           </xsl:if>
           <xsl:if test="@negnum">
              <div style="margin-bottom: 8pt;"><xsl:value-of select="@negnum"/></div>
           </xsl:if>
        </div>
     </xsl:when>
  </xsl:choose>
</xsl:template>

<xsl:template match="_ufe:howtouse-title" priority="0">
  <div ch:title="notoc" class=" x--ufe-howtouse-title-3-0">
    <xsl:call-template name="t-base-div-title"/>
  </div>
</xsl:template>

<xsl:template match="imp" priority="0">
  <span class=" x-imp-1-0">
    <xsl:call-template name="t-base-div-basic"/>
  </span>
</xsl:template>

<xsl:template match="inter" priority="0">
  <div>
     <xsl:attribute name="class">
        <xsl:text> x-inter-1-0</xsl:text>
        <xsl:choose>
          <xsl:when test="@prc=number('1')"> x-inter-1-1</xsl:when>
          <xsl:when test="@prc=number('2')"> x-inter-1-2</xsl:when>
          <xsl:when test="@prc=number('3')"> x-inter-1-3</xsl:when>
          <xsl:when test="@prc=number('6')"> x-inter-1-4</xsl:when>
          <xsl:when test="@prc=number('7')"> x-inter-1-5</xsl:when>
          <xsl:when test="@prc='N'"> x-inter-1-6</xsl:when>
          <xsl:when test="@prc='S'"> x-inter-1-7</xsl:when>
        </xsl:choose>
     </xsl:attribute>
     <xsl:call-template name="t-base-div-basic"/>
  </div>
</xsl:template>

<xsl:template match="_ufe:intro-title" priority="0">
  <div ch:title="toc" class=" x--ufe-intro-title-3-0">
    <xsl:call-template name="t-base-div-title"/>
  </div>
</xsl:template>

<xsl:template match="ipc-fig" priority="0">
  <div class=" x-ipc-fig-1-0">
    <xsl:call-template name="t-base-div-basic"/>
  </div>
</xsl:template>

<xsl:template match="ipc-fig-delete" priority="0">
  <xsl:apply-templates/>
</xsl:template>

<xsl:template match="ipc-fig-reloc" priority="0">
  <xsl:apply-templates/>
</xsl:template>

<xsl:template match="kits" priority="0">
  <div class=" x-kits-1-0">
    <xsl:call-template name="t-base-div-basic"/>
  </div>
</xsl:template>

<xsl:template match="lpln" priority="0">
  <div class=" x-lpln-1-0">
    <xsl:call-template name="t-base-div-basic"/>
  </div>
</xsl:template>

<xsl:template match="met" priority="0">
  <span class=" x-met-1-0">
    <xsl:call-template name="t-base-div-basic"/>
  </span>
</xsl:template>

<xsl:template match="misc" priority="0">
  <div class=" x-misc-1-0">
    <xsl:call-template name="t-base-div-basic"/>
  </div>
</xsl:template>

<xsl:template match="name" priority="0">
  <span>
     <xsl:attribute name="class">
        <xsl:text> x-name-1-0</xsl:text>
        <xsl:choose>
          <xsl:when test="ancestor::entry[preceding-sibling::entry[part-nbr[@indent = '1']]]">
            <xsl:text> x-name-1-1</xsl:text>
            <xsl:if test="not(ancestor::*[not(self::_sfe:BeforeOrAfterText)][1]/text()[normalize-space(.)!='']|ancestor::*[not(self::_sfe:BeforeOrAfterText)][1]/*[not(self::_sfe:BeforeOrAfterText)]//text()[normalize-space(.)!=''][not(parent::_sfe:BeforeOrAfterText)])"> x-name-1-3</xsl:if>
            <xsl:if test="ancestor::entry[preceding-sibling::entry[part-nbr[@ic-opt = 'NUT-TABLE']]]"> x-name-1-9</xsl:if>
          </xsl:when>
          <xsl:when test="ancestor::entry[preceding-sibling::entry[part-nbr[@indent = '2']]]">
            <xsl:text> x-name-1-3</xsl:text>
            <xsl:if test="not(ancestor::*[not(self::_sfe:BeforeOrAfterText)][1]/text()[normalize-space(.)!='']|ancestor::*[not(self::_sfe:BeforeOrAfterText)][1]/*[not(self::_sfe:BeforeOrAfterText)]//text()[normalize-space(.)!=''][not(parent::_sfe:BeforeOrAfterText)])"> x-name-1-4</xsl:if>
            <xsl:if test="ancestor::entry[preceding-sibling::entry[part-nbr[@ic-opt = 'NUT-TABLE']]]"> x-name-1-10</xsl:if>
          </xsl:when>
          <xsl:when test="ancestor::entry[preceding-sibling::entry[part-nbr[@indent = '3']]]">
            <xsl:text> x-name-1-5</xsl:text>
            <xsl:if test="not(ancestor::*[not(self::_sfe:BeforeOrAfterText)][1]/text()[normalize-space(.)!='']|ancestor::*[not(self::_sfe:BeforeOrAfterText)][1]/*[not(self::_sfe:BeforeOrAfterText)]//text()[normalize-space(.)!=''][not(parent::_sfe:BeforeOrAfterText)])"> x-name-1-6</xsl:if>
            <xsl:if test="ancestor::entry[preceding-sibling::entry[part-nbr[@ic-opt = 'NUT-TABLE']]]"> x-name-1-11</xsl:if>
          </xsl:when>
          <xsl:when test="ancestor::entry[preceding-sibling::entry[part-nbr[@indent = '4']]]">
            <xsl:text> x-name-1-7</xsl:text>
            <xsl:if test="not(ancestor::*[not(self::_sfe:BeforeOrAfterText)][1]/text()[normalize-space(.)!='']|ancestor::*[not(self::_sfe:BeforeOrAfterText)][1]/*[not(self::_sfe:BeforeOrAfterText)]//text()[normalize-space(.)!=''][not(parent::_sfe:BeforeOrAfterText)])"> x-name-1-8</xsl:if>
            <xsl:if test="ancestor::entry[preceding-sibling::entry[part-nbr[@ic-opt = 'NUT-TABLE']]]"> x-name-1-12</xsl:if>
          </xsl:when>
          <xsl:otherwise></xsl:otherwise>
        </xsl:choose>
     </xsl:attribute>
     <xsl:call-template name="t-base-div-basic"/>
  </span>
</xsl:template>

<xsl:template match="nomen-col" priority="0">
  <div>
     <xsl:attribute name="class">
        <xsl:text> x-nomen-col-1-0</xsl:text>
        <xsl:choose>
          <xsl:when test="parent::entry[preceding-sibling::entry[part-nbr[@indent = '1']]]"> x-nomen-col-1-1</xsl:when>
          <xsl:when test="parent::entry[preceding-sibling::entry[part-nbr[@indent = '2']]]"> x-nomen-col-1-2</xsl:when>
          <xsl:when test="parent::entry[preceding-sibling::entry[part-nbr[@indent = '3']]]"> x-nomen-col-1-3</xsl:when>
          <xsl:when test="parent::entry[preceding-sibling::entry[part-nbr[@indent = '4']]]"> x-nomen-col-1-4</xsl:when>
          <xsl:otherwise></xsl:otherwise>
        </xsl:choose>
        <xsl:choose>
          <xsl:when test="@select-at='ASSEMBLY' and parent::entry[preceding-sibling::entry[part-nbr[@ic-opt = 'LIST']]]"> x-nomen-col-1-5</xsl:when>
          <xsl:when test="@select-at='BALANCING' and parent::entry[preceding-sibling::entry[part-nbr[@ic-opt = 'LIST']]]"> x-nomen-col-1-6</xsl:when>
          <xsl:when test="@select-at='DETAIL-BAL' and parent::entry[preceding-sibling::entry[part-nbr[@ic-opt = 'LIST']]]"> x-nomen-col-1-7</xsl:when>
          <xsl:when test="@select-at='TRIM-BAL' and parent::entry[preceding-sibling::entry[part-nbr[@ic-opt = 'LIST']]]"> x-nomen-col-1-8</xsl:when>
          <xsl:when test="parent::entry[preceding-sibling::entry[part-nbr[@ic-opt = 'LIST']]]"> x-nomen-col-1-9</xsl:when>
          <xsl:when test="@select-at='ASSEMBLY'"> x-nomen-col-1-10</xsl:when>
          <xsl:when test="@select-at='BALANCING'"> x-nomen-col-1-11</xsl:when>
          <xsl:when test="@select-at='DETAIL-BAL'"> x-nomen-col-1-12</xsl:when>
          <xsl:when test="@select-at='TRIM-BAL'"> x-nomen-col-1-13</xsl:when>
        </xsl:choose>
     </xsl:attribute>
     <xsl:call-template name="t-base-div-basic"/>
  </div>
</xsl:template>

<xsl:template match="n-para/note" priority="8">
  <div class=" x-note-1-0">
    <xsl:call-template name="t-base-div-basic"/>
  </div>
</xsl:template>

<xsl:template match="procedure/note" priority="7">
  <div class=" x-note-2-0">
    <xsl:call-template name="t-base-div-basic"/>
  </div>
</xsl:template>

<xsl:template match="fandc/note" priority="6">
  <div class=" x-note-3-0">
    <xsl:call-template name="t-base-div-basic"/>
  </div>
</xsl:template>

<xsl:template match="spec-assem/note" priority="5">
  <div class=" x-note-4-0">
    <xsl:call-template name="t-base-div-basic"/>
  </div>
</xsl:template>

<xsl:template match="spring-pressure/note" priority="4">
  <div class=" x-note-5-0">
    <xsl:call-template name="t-base-div-basic"/>
  </div>
</xsl:template>

<xsl:template match="torque-and-stretch/note" priority="3">
  <div class=" x-note-6-0">
    <xsl:call-template name="t-base-div-basic"/>
  </div>
</xsl:template>

<xsl:template match="fits-and-clears/note" priority="2">
  <div class=" x-note-7-0">
    <xsl:call-template name="t-base-div-basic"/>
  </div>
</xsl:template>

<xsl:template match="note[parent::subpara]" priority="1">
  <div class=" x-note-8-0">
    <xsl:call-template name="t-base-div-basic"/>
  </div>
</xsl:template>

<xsl:template match="note" priority="0">
  <div>
     <xsl:attribute name="class">
        <xsl:text> x-note-9-0</xsl:text>
        <xsl:if test="(following-sibling::note) or (preceding-sibling::note)"> x-note-9-1</xsl:if>
     </xsl:attribute>
     <xsl:call-template name="t-base-div-basic"/>
  </div>
</xsl:template>

<xsl:template match="_ufe:num-index-title" priority="0">
  <div ch:title="toc" class=" x--ufe-num-index-title-4-0">
    <xsl:call-template name="t-base-div-title"/>
  </div>
</xsl:template>

<xsl:template match="_ufe:nut-option-title" priority="0">
  <div ch:title="notoc" class=" x--ufe-nut-option-title-4-0">
    <xsl:call-template name="t-base-div-title"/>
  </div>
</xsl:template>

<xsl:template match="optitem" priority="0">
  <span class=" x-optitem-1-0">
    <xsl:call-template name="t-base-div-basic"/>
  </span>
</xsl:template>

<xsl:template match="optpn" priority="0">
  <span class=" x-optpn-1-0">
    <xsl:call-template name="t-base-div-basic"/>
  </span>
</xsl:template>

<xsl:template match="part-nbr" priority="0">
  <xsl:param name="hidden" select="'yes'"/>
  
  <xsl:variable name="foClass">
     <xsl:choose>
        <xsl:when test="@ref and string(@ref)!=''">hidden</xsl:when>
        <xsl:otherwise>block</xsl:otherwise>
     </xsl:choose>
  </xsl:variable>
  <xsl:variable name="blockness">block</xsl:variable>
  <xsl:variable name="hiddenness">
     <xsl:choose>
        <xsl:when test="@ref and string(@ref)!=''">yes</xsl:when>
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
              <xsl:text> x-part-nbr-1-0</xsl:text>
              <xsl:if test="@ref and string(@ref)!=''"> x-part-nbr-1-1</xsl:if>
           </xsl:attribute>
           <xsl:call-template name="t-base-div-basic-h">
              <xsl:with-param name="hidden" select="$hidden"/>
           </xsl:call-template>
        </div>
     </xsl:when>
     <xsl:when test="$fo-class='block'">
        <div>
           <xsl:attribute name="class">
              <xsl:text> x-part-nbr-1-0</xsl:text>
              <xsl:if test="@ref and string(@ref)!=''">x-part-nbr-1-1</xsl:if>
           </xsl:attribute>
           <xsl:call-template name="t-base-div-basic"/>
        </div>
     </xsl:when>
  </xsl:choose>
</xsl:template>

<xsl:template match="_ufe:partial-breakdown" priority="0">
  <div>
     <xsl:attribute name="class">
        <xsl:text> x--ufe-partial-breakdown-1-0</xsl:text>
        <xsl:choose>
          <xsl:when test="@indent=number('1')"> x--ufe-partial-breakdown-1-1</xsl:when>
          <xsl:when test="@indent=number('2')"> x--ufe-partial-breakdown-1-2</xsl:when>
          <xsl:when test="@indent=number('3')"> x--ufe-partial-breakdown-1-3</xsl:when>
          <xsl:when test="@indent=number('4')"> x--ufe-partial-breakdown-1-4</xsl:when>
        </xsl:choose>
     </xsl:attribute>
     <xsl:call-template name="t-base-div-basic"/>
  </div>
</xsl:template>

<xsl:template match="parts-list" priority="0">
  <div class=" x-parts-list-8-0">
    <xsl:call-template name="t-base-div-basic"/>
  </div>
</xsl:template>

<xsl:template match="pd-list" priority="0">
  <xsl:apply-templates/>
</xsl:template>

<xsl:template match="_ufe:pdlist-title" priority="0">
  <div ch:title="toc" class=" x--ufe-pdlist-title-2-0">
    <xsl:call-template name="t-base-div-title"/>
  </div>
</xsl:template>

<xsl:template match="pntype[position()&gt;1]" priority="1">
  <xsl:param name="hidden" select="'yes'"/>

  <xsl:variable name="l-cat" select="@cat"/>
  <xsl:variable name="l-cat-s" select="preceding-sibling::pntype[1]/@cat"/>
       
  <xsl:variable name="foClass">
     <xsl:choose>
        <xsl:when test="($l-cat='use-with' or $l-cat='field' or $l-cat='rew' or $l-cat='NewMay' or $l-cat='comp-of') and $l-cat=$l-cat-s">inline</xsl:when>
        <xsl:otherwise>block</xsl:otherwise>
     </xsl:choose>
  </xsl:variable>
  <xsl:variable name="blockness">
     <xsl:choose>
        <xsl:when test="($l-cat='use-with' or $l-cat='field' or $l-cat='rew' or $l-cat='NewMay' or $l-cat='comp-of') and $l-cat=$l-cat-s">inline</xsl:when>
        <xsl:otherwise>block</xsl:otherwise>
     </xsl:choose>
  </xsl:variable>
  <xsl:variable name="fo-class">
     <xsl:choose>
        <xsl:when test="($foClass='block') and ($blockness='inline')">inline</xsl:when>
        <xsl:when test="($foClass='inline') and ($blockness='block')">block</xsl:when>
        <xsl:otherwise>
           <xsl:value-of select="$foClass"/>
        </xsl:otherwise>
     </xsl:choose>
  </xsl:variable>
  <xsl:choose>
     <xsl:when test="$fo-class='block'">
        <div>
           <xsl:attribute name="class">
              <xsl:text> x-pntype-1-0</xsl:text>
              <xsl:choose>
                <xsl:when test="$l-cat='comp-of' and $l-cat=$l-cat-s"> x-pntype-1-1</xsl:when>
                <xsl:when test="$l-cat='NewMay' and $l-cat=$l-cat-s"> x-pntype-1-2</xsl:when>
                <xsl:when test="$l-cat='rew' and $l-cat=$l-cat-s"> x-pntype-1-3</xsl:when>
                <xsl:when test="$l-cat='field' and $l-cat=$l-cat-s"> x-pntype-1-4</xsl:when>
                <xsl:when test="$l-cat='use-with' and $l-cat=$l-cat-s"> x-pntype-1-5</xsl:when>
                <xsl:when test="$l-cat='comp-of'"> x-pntype-1-6</xsl:when>
                <xsl:when test="$l-cat='NewMay'"> x-pntype-1-7</xsl:when>
                <xsl:when test="$l-cat='rew'"> x-pntype-1-8</xsl:when>
                <xsl:when test="$l-cat='field'"> x-pntype-1-9</xsl:when>
                <xsl:when test="$l-cat='use-with'"> x-pntype-1-10</xsl:when>
              </xsl:choose>
           </xsl:attribute>
           <xsl:call-template name="t-base-div-basic"/>
        </div>
     </xsl:when>
     <xsl:when test="$fo-class='inline'">
        <span>
           <xsl:attribute name="class">
              <xsl:text> x-pntype-1-0</xsl:text>
              <xsl:choose>
                <xsl:when test="$l-cat='comp-of' and $l-cat=$l-cat-s"> x-pntype-1-1</xsl:when>
                <xsl:when test="$l-cat='NewMay' and $l-cat=$l-cat-s"> x-pntype-1-2</xsl:when>
                <xsl:when test="$l-cat='rew' and $l-cat=$l-cat-s"> x-pntype-1-3</xsl:when>
                <xsl:when test="$l-cat='field' and $l-cat=$l-cat-s"> x-pntype-1-4</xsl:when>
                <xsl:when test="$l-cat='use-with' and $l-cat=$l-cat-s"> x-pntype-1-5</xsl:when>
                <xsl:when test="$l-cat='comp-of'"> x-pntype-1-6</xsl:when>
                <xsl:when test="$l-cat='NewMay'"> x-pntype-1-7</xsl:when>
                <xsl:when test="$l-cat='rew'"> x-pntype-1-8</xsl:when>
                <xsl:when test="$l-cat='field'"> x-pntype-1-9</xsl:when>
                <xsl:when test="$l-cat='use-with'"> x-pntype-1-10</xsl:when>
              </xsl:choose>
           </xsl:attribute>
           <xsl:call-template name="t-base-div-basic"/>
        </span>
     </xsl:when>
  </xsl:choose>
</xsl:template>

<xsl:template match="pntype" priority="0">
  <div>
     <xsl:attribute name="class">
        <xsl:text> x-pntype-2-0</xsl:text>
        <xsl:choose>
          <xsl:when test="@cat='comp-of'"> x-pntype-2-1</xsl:when>
          <xsl:when test="@cat='NewMay'"> x-pntype-2-2</xsl:when>
          <xsl:when test="@cat='rew'"> x-pntype-2-3</xsl:when>
          <xsl:when test="@cat='field'"> x-pntype-2-4</xsl:when>
          <xsl:when test="@cat='use-with'"> x-pntype-2-5</xsl:when>
        </xsl:choose>
     </xsl:attribute>
     <xsl:call-template name="t-base-div-basic"/>
  </div>
</xsl:template>

<xsl:template match="pwc-pn" priority="0">
  <div class=" x-pwc-pn-1-0">
    <xsl:call-template name="t-base-div-basic"/>
  </div>
</xsl:template>

<xsl:template match="range" priority="0">
  <xsl:param name="hidden" select="'yes'"/>

  <div>
     <xsl:attribute name="class">
        <xsl:text> x-range-1-0</xsl:text>
        <xsl:if test="substring-before(.,',') != '0'"> x-range-1-1</xsl:if>
     </xsl:attribute>
     <xsl:call-template name="t-base-div-basic-h">
        <xsl:with-param name="hidden" select="$hidden"/>
     </xsl:call-template>
  </div>
</xsl:template>

<xsl:template match="nomen-col/sb-stat[@type='SPB']" priority="3">
  <xsl:param name="hidden" select="'yes'"/>
  
  <xsl:variable name="l-ind" select="ancestor::entry/preceding-sibling::entry[2]/*[name()='part-nbr']/@indent"/>
  <div>
     <xsl:attribute name="class">
        <xsl:text> x-sb-stat-1-0</xsl:text>
        <xsl:choose>
          <xsl:when test="$l-ind='0'"> x-sb-stat-1-1</xsl:when>
          <xsl:when test="$l-ind='1'"> x-sb-stat-1-2</xsl:when>
          <xsl:when test="$l-ind='2'"> x-sb-stat-1-3</xsl:when>
          <xsl:when test="$l-ind='3'"> x-sb-stat-1-4</xsl:when>
          <xsl:when test="$l-ind='4'"> x-sb-stat-1-5</xsl:when>
        </xsl:choose>
     </xsl:attribute>
     <xsl:copy-of select="@ch:*"/>
     <xsl:call-template name="maybe-set-id"/>
     <xsl:choose>
        <xsl:when test="$hidden='no'">
           <xsl:apply-templates/>
        </xsl:when>
        <xsl:otherwise>
           <a href="#" onclick="spbLink('{.}');">
              <xsl:apply-templates select="_sfe:BeforeOrAfterText"/>
           </a>
        </xsl:otherwise>
     </xsl:choose>
  </div>
</xsl:template>

<xsl:template match="nomen-col/sb-stat" priority="2">
  <xsl:variable name="l-ind" select="ancestor::entry/preceding-sibling::entry[2]/*[name()='part-nbr']/@indent"/>
  <div>
     <xsl:attribute name="class">
        <xsl:text> x-sb-stat-2-0</xsl:text>
        <xsl:choose>
          <xsl:when test="$l-ind='0'"> x-sb-stat-2-1</xsl:when>
          <xsl:when test="$l-ind='1'"> x-sb-stat-2-2</xsl:when>
          <xsl:when test="$l-ind='2'"> x-sb-stat-2-3</xsl:when>
          <xsl:when test="$l-ind='3'"> x-sb-stat-2-4</xsl:when>
          <xsl:when test="$l-ind='4'"> x-sb-stat-2-5</xsl:when>
        </xsl:choose>
     </xsl:attribute>
     <xsl:copy-of select="@ch:*"/>
     <xsl:call-template name="maybe-set-id"/>
     <a href="#" onclick="sbLink('{.}');">
        <xsl:apply-templates/>
     </a>
  </div>
</xsl:template>

<xsl:template match="sb-stat[@type='SPB']" priority="1">
  <xsl:param name="hidden" select="'yes'"/>
  
  <span class=" x-sb-stat-1-0">
     <xsl:copy-of select="@ch:*"/>
     <xsl:call-template name="maybe-set-id"/>
     <xsl:choose>
        <xsl:when test="$hidden='no'">
           <xsl:apply-templates/>
        </xsl:when>
        <xsl:otherwise>
           <a href="#" onclick="spbLink('{.}');">
              <xsl:apply-templates select="_sfe:BeforeOrAfterText"/>
           </a>
        </xsl:otherwise>
     </xsl:choose>
  </span>
</xsl:template>

<xsl:template match="sb-stat" priority="0">
  <span class=" x-sb-stat-2-0">
     <xsl:copy-of select="@ch:*"/>
     <xsl:call-template name="maybe-set-id"/>
     <a href="#" onclick="sbLink('{.}');">
        <xsl:apply-templates/>
     </a>
  </span>
   </xsl:template>

<xsl:template match="_ufe:sblist-title" priority="0">
  <div ch:title="toc" class=" x--ufe-sblist-title-3-0">
    <xsl:call-template name="t-base-div-title"/>
  </div>
</xsl:template>

<xsl:template match="see" priority="0">
  <xsl:param name="hidden" select="'yes'"/>

  <xsl:variable name="l-type" select="@ntype"/>
  <xsl:variable name="foClass">
     <xsl:choose>
        <xsl:when test="$l-type='FIGBDN' or $l-type='CHAPFIGNHA' or $l-type='CHAPFIGBDN' or $l-type='CHAPFIG' or $l-type='FIGNHA' or $l-type='FIGNOTE'">hidden</xsl:when>
        <xsl:otherwise>block</xsl:otherwise>
     </xsl:choose>
  </xsl:variable>
  <xsl:variable name="blockness">block</xsl:variable>
  <xsl:variable name="hiddenness">
     <xsl:choose>
        <xsl:when test="$l-type='FIGBDN' or $l-type='CHAPFIGNHA' or $l-type='CHAPFIGBDN' or $l-type='CHAPFIG' or $l-type='FIGNHA' or $l-type='FIGNOTE'">yes</xsl:when>
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
              <xsl:text> x-see-1-0</xsl:text>
              <xsl:choose>
                <xsl:when test="$l-type='FIGNOTE' and not(@fignote-nbr)"> x-see-1-1</xsl:when>
                <xsl:when test="$l-type='FIGNOTE' and @fignote-nbr"> x-see-1-2</xsl:when>
                <xsl:when test="$l-type='FIGNHA'"> x-see-1-3</xsl:when>
                <xsl:when test="$l-type='CHAPFIG'"> x-see-1-4</xsl:when>
                <xsl:when test="$l-type='CHAPFIGBDN'"> x-see-1-5</xsl:when>
                <xsl:when test="$l-type='CHAPFIGNHA'"> x-see-1-6</xsl:when>
                <xsl:when test="$l-type='FIGBDN'"> x-see-1-7</xsl:when>
              </xsl:choose>
           </xsl:attribute>
           <xsl:call-template name="t-base-div-basic-h">
              <xsl:with-param name="hidden" select="$hidden"/>
           </xsl:call-template>
        </div>
     </xsl:when>
     <xsl:when test="$fo-class='block'">
        <div>
           <xsl:attribute name="class">
              <xsl:text> x-see-1-0</xsl:text>
              <xsl:choose>
                <xsl:when test="$l-type='FIGNOTE' and not(@fignote-nbr)"> x-see-1-1</xsl:when>
                <xsl:when test="$l-type='FIGNOTE' and @fignote-nbr"> x-see-1-2</xsl:when>
                <xsl:when test="$l-type='FIGNHA'"> x-see-1-3</xsl:when>
                <xsl:when test="$l-type='CHAPFIG'"> x-see-1-4</xsl:when>
                <xsl:when test="$l-type='CHAPFIGBDN'"> x-see-1-5</xsl:when>
                <xsl:when test="$l-type='CHAPFIGNHA'"> x-see-1-6</xsl:when>
                <xsl:when test="$l-type='FIGBDN'"> x-see-1-7</xsl:when>
              </xsl:choose>
           </xsl:attribute>
           <xsl:call-template name="t-base-div-basic"/>
        </div>
     </xsl:when>
  </xsl:choose>
</xsl:template>

<xsl:template match="service-bull-list" priority="0">
  <div class=" x-service-bull-list-1-0">
    <xsl:call-template name="t-base-div-basic2"/>
  </div>
</xsl:template>

<xsl:template match="spb-item" priority="0">
  <xsl:apply-templates/>
</xsl:template>

<xsl:template match="spb-list" priority="0">
  <div class=" x-spb-list-1-0">
    <xsl:call-template name="t-base-div-basic2"/>
  </div>
</xsl:template>

<xsl:template match="_ufe:spblist-title" priority="0">
  <div ch:title="toc" class=" x--ufe-spblist-title-3-0">
    <xsl:call-template name="t-base-div-title"/>
  </div>
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

<xsl:template match="procedure//step" priority="2">
  <xsl:apply-templates select="node()[self::warning or (self::revst and following-sibling::*[1][self::warning]) or self::caution or (self::revst and following-sibling::*[1][self::caution]) or name() = 'revend']"/>
  <table border="0" cellpadding="0" cellspacing="0" style="table-layout: fixed; " class=" x-step-2-0 x--zero-left-margins">
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
  <table border="0" cellpadding="0" cellspacing="0" class=" x-step-3-0 x--zero-left-margins">
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

<xsl:template match="step2[table/@tabstyle='frac']" priority="1">
  <xsl:apply-templates select="node()[self::warning or (self::revst and following-sibling::*[1][self::warning]) or self::caution or (self::revst and following-sibling::*[1][self::caution]) or name() = 'revend']"/>
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
  <xsl:apply-templates select="node()[self::warning or (self::revst and following-sibling::*[1][self::warning]) or self::caution or (self::revst and following-sibling::*[1][self::caution]) or name() = 'revend']"/>
  <table border="0" cellpadding="0" cellspacing="0" class=" x-step2-3-0 x--zero-left-margins">
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

<xsl:template match="step3[table/@tabstyle='frac']" priority="1">
  <xsl:apply-templates select="node()[self::warning or (self::revst and following-sibling::*[1][self::warning]) or self::caution or (self::revst and following-sibling::*[1][self::caution]) or name() = 'revend']"/>
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
  <xsl:apply-templates select="node()[self::warning or (self::revst and following-sibling::*[1][self::warning]) or self::caution or (self::revst and following-sibling::*[1][self::caution]) or name() = 'revend']"/>
  <table border="0" cellpadding="0" cellspacing="0" class=" x-step3-3-0 x--zero-left-margins">
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

<xsl:template match="step4[table/@tabstyle='frac']" priority="1">
  <xsl:apply-templates select="node()[self::warning or (self::revst and following-sibling::*[1][self::warning]) or self::caution or (self::revst and following-sibling::*[1][self::caution]) or name() = 'revend']"/>
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
  <xsl:apply-templates select="node()[self::warning or (self::revst and following-sibling::*[1][self::warning]) or self::caution or (self::revst and following-sibling::*[1][self::caution]) or name() = 'revend']"/>
  <table border="0" cellpadding="0" cellspacing="0" class=" x-step4-3-0 x--zero-left-margins">
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
  <table border="0" cellpadding="0" cellspacing="0" class=" x-step5-1-0 x--zero-left-margins">
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
  <xsl:apply-templates select="node()[self::warning or (self::revst and following-sibling::*[1][self::warning]) or self::caution or (self::revst and following-sibling::*[1][self::caution]) or name() = 'revend']"/>
  <table border="0" cellpadding="0" cellspacing="0" class=" x-step5-3-0 x--zero-left-margins">
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

<xsl:template match="subattach" priority="0">
  <div class=" x-subattach-1-0">
    <xsl:call-template name="t-base-div-basic"/>
  </div>
</xsl:template>

<xsl:template match="supp-code" priority="0">
  <div class=" x-supp-code-1-0">
    <xsl:call-template name="t-base-div-basic"/>
  </div>
</xsl:template>

<xsl:template match="supp-pn" priority="0">
  <div class=" x-supp-pn-1-0">
    <xsl:call-template name="t-base-div-basic"/>
  </div>
</xsl:template>

<xsl:template match="_ufe:supplier-list-title" priority="0">
  <div ch:title="notoc" class=" x--ufe-supplier-list-title-4-0">
    <xsl:call-template name="t-base-div-title"/>
  </div>
</xsl:template>

<xsl:template match="pbfmatr//_ufe:task-title" priority="1">
  <div ch:title="notoc" class=" x--ufe-task-title-3-0">
    <xsl:call-template name="t-base-div-title"/>
  </div>
</xsl:template>

<xsl:template match="_ufe:temp-rev-title" priority="0">
  <div ch:title="toc" class=" x--ufe-temp-rev-title-3-0">
    <xsl:call-template name="t-base-div-title"/>
  </div>
</xsl:template>

<xsl:template match="book[contains(@doctype, 'ipc')]/frontmatter//figure/title" priority="68">
  <div ch:title="toc" class=" x-title-5-0">
    <xsl:call-template name="t-base-div-title"/>
  </div>
</xsl:template>

<xsl:template match="module[@module-name='Airworthiness_Limits']/pgblk/title" priority="65">
  <div ch:title="notoc" class=" x-title-8-0">
    <xsl:call-template name="t-base-div-title"/>
  </div>
</xsl:template>

<xsl:template match="page-block[@pb-name='ni']//mfmatr/title" priority="56">
  <div ch:title="notoc" class=" x-title-17-0">
    <xsl:call-template name="t-base-div-title"/>
  </div>
</xsl:template>

<xsl:template match="page-block[@pb-name='record-of-revisions']//n-para/title" priority="55">
  <div ch:title="toc" class=" x-title-18-0">
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
  <div ch:title="toc" class=" x-title-21-0">
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
           <xsl:call-template name="t-base-div-basic-h">
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
           <xsl:call-template name="t-base-div-basic"/>
        </div>
     </xsl:when>
  </xsl:choose>
</xsl:template>

<xsl:template match="pwcpbfront/title" priority="39">
  <div ch:title="notoc" class=" x-title-34-0">
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
  <div ch:title="notoc" class=" x-title-38-0">
    <xsl:call-template name="t-base-div-title"/>
  </div>
</xsl:template>

<xsl:template match="sblist/title" priority="32">
  <div ch:title="notoc" class=" x-title-41-0">
    <xsl:call-template name="t-base-div-title"/>
  </div>
</xsl:template>

<xsl:template match="pwcni/title" priority="31">
  <div ch:title="notoc" class=" x-title-42-0">
    <xsl:call-template name="t-base-div-title"/>
  </div>
</xsl:template>

<xsl:template match="vendlist/title" priority="30">
  <div ch:title="notoc" class=" x-title-43-0">
    <xsl:call-template name="t-base-div-title"/>
  </div>
</xsl:template>

<xsl:template match="pgblk/title" priority="29">
  <div ch:title="notoc" class=" x-title-44-0">
    <xsl:call-template name="t-base-div-title"/>
  </div>
</xsl:template>

<xsl:template match="lof-item/title" priority="21">
  <div ch:title="notoc" class=" x-title-52-0">
    <xsl:call-template name="t-base-div-title"/>
  </div>
</xsl:template>

<xsl:template match="lof/title" priority="18">
  <div ch:title="notoc" class=" x-title-55-0">
    <xsl:call-template name="t-base-div-title"/>
  </div>
</xsl:template>

<xsl:template match="spb-list/title" priority="14">
  <div ch:title="toc" class=" x-title-59-0">
    <xsl:call-template name="t-base-div-title"/>
  </div>
</xsl:template>

<xsl:template match="service-bull-list/title" priority="10">
  <div ch:title="toc" class=" x-title-63-0">
    <xsl:call-template name="t-base-div-title"/>
  </div>
</xsl:template>

<xsl:template match="module/title" priority="9">
  <div ch:title="toc" class=" x-title-64-0">
    <xsl:call-template name="t-base-div-title"/>
  </div>
</xsl:template>

<xsl:template match="num-index/title" priority="7">
  <div ch:title="toc" class=" x-title-66-0">
    <xsl:call-template name="t-base-div-title"/>
  </div>
</xsl:template>

<xsl:template match="_ufe:tmm-title" priority="0">
  <div ch:title="notoc">
     <xsl:attribute name="class">
        <xsl:text> x--ufe-tmm-title-3-0</xsl:text>
        <xsl:if test="contains(//book/@doctype, 'lmm')"> x--ufe-tmm-title-3-1</xsl:if>
     </xsl:attribute>
     <xsl:call-template name="t-base-div-title"/>
  </div>
</xsl:template>

<xsl:template match="unit-title" priority="0">
  <xsl:apply-templates/>
</xsl:template>

</xsl:stylesheet>
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
  xmlns:_gte="http://www.arbortext.com/namespace/Styler/GeneratedTextElements" 
  xmlns:_sfe="http://www.arbortext.com/namespace/Styler/StylerFormattingElements" 
  xmlns:_ufe="http://www.arbortext.com/namespace/Styler/UserFormattingElements" 
  version="2.0" 
  exclude-result-prefixes="ch #default exslt _ufe _sfe _gte">

<xsl:include href="base.xsl"/>
<xsl:include href="base_steps_numbering.xsl"/>
<xsl:include href="process.xsl"/>

<xsl:include href="migrate_gentext.xsl"/>
<xsl:include href="migrate_numbering.xsl"/>

<xsl:output encoding="UTF-8" method="xml" omit-xml-declaration="yes"/>

<xsl:variable name="doctype" select="'migrate'"/>

<xsl:template match="limits/annot" priority="1">
  <div class="x-annot-1-0">
    <xsl:call-template name="t-base-div-basic"/>
  </div>
</xsl:template>

<xsl:template match="annot" priority="0">
  <div class="x-annot-2-0">
    <xsl:call-template name="t-base-div-basic"/>
  </div>
</xsl:template>

<xsl:template match="at-length" priority="0">
  <xsl:apply-templates/>
</xsl:template>

<xsl:template match="build-spec" priority="0">
  <div class="x-build-spec-1-0">
    <xsl:call-template name="t-base-div-basic"/>
  </div>
</xsl:template>

<xsl:template match="_ufe:cir-title" priority="0">
  <div ch:title="notoc" class="x--ufe-cir-title-3-0">
    <xsl:call-template name="t-base-div-title"/>
  </div>
</xsl:template>

<xsl:template match="consumables" priority="0">
  <div>
     <xsl:attribute name="class">
        <xsl:text>x-consumables-1-0</xsl:text>
        <xsl:if test="@empty and string(@empty)='YES'"> x-consumables-1-1</xsl:if>
     </xsl:attribute>
     <xsl:call-template name="t-base-div-basic2"/>
  </div>
</xsl:template>

<xsl:template match="_ufe:eipc-title" priority="0">
  <div ch:title="notoc" class="x--ufe-eipc-title-3-0">
    <xsl:call-template name="t-base-div-title"/>
  </div>
</xsl:template>

<xsl:template match="_ufe:em-title" priority="0">
  <div ch:title="notoc" class="x--ufe-em-title-3-0">
    <xsl:call-template name="t-base-div-title"/>
  </div>
</xsl:template>

<xsl:template match="fandc-proc" priority="0">
  <xsl:apply-templates/>
</xsl:template>

<xsl:template match="figure[descendant::graphic]" priority="1">
  <xsl:variable name="l-id"><xsl:value-of select="$pf-id"/><xsl:apply-templates mode="set-id" select="."/></xsl:variable>
  <div class="pr-brk"></div>
  <div style="display:none;" class="x-figure-1-0">
    <xsl:copy-of select="@ch:*"/>
    <xsl:if test="@xml:id"><xsl:copy-of select="@xml:id"/></xsl:if>
    <xsl:attribute name="id"><xsl:value-of select="$l-id"/></xsl:attribute>    
    <div class="pr-figure">
      <xsl:apply-templates select="*[not(local-name() = 'key')]"/>
    </div>
    <xsl:apply-templates select="key"/>
  </div>
</xsl:template>

<xsl:template match="figure" priority="0">
  <div class="x-figure-2-0">
    <xsl:call-template name="t-base-div-basic2"/>
  </div>
</xsl:template>

<xsl:template match="fits" priority="0">
  <div class="x-fits-1-0">
    <xsl:call-template name="t-base-div-basic"/>
  </div>
</xsl:template>

<xsl:template match="fits-and-clears" priority="0">
  <div class="x-fits-and-clears-1-0">
    <xsl:call-template name="t-base-div-basic2"/>
  </div>
</xsl:template>

<xsl:template match="fix-equip-list" priority="0">
  <xsl:apply-templates/>
</xsl:template>

<xsl:template match="fixtures-and-equipment" priority="0">
  <div>
     <xsl:attribute name="class">
        <xsl:text>x-fixtures-and-equipment-1-0</xsl:text>
        <xsl:if test="@empty and string(@empty)='YES'"> x-fixtures-and-equipment-1-1</xsl:if>
     </xsl:attribute>
     <xsl:call-template name="t-base-div-basic2"/>
  </div>
</xsl:template>

<xsl:template match="general" priority="0">
  <div class="x-general-1-0">
    <xsl:call-template name="t-base-div-basic2"/>
  </div>
</xsl:template>

<xsl:template match="_ufe:glossary-title" priority="0">
  <div ch:title="notoc" class="x--ufe-glossary-title-4-0">
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
        <xsl:if test="$hidden='no'">
           <div>
              <xsl:attribute name="class">
                 <xsl:text>x-graphic-1-0</xsl:text>
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
              <xsl:text>x-graphic-1-0</xsl:text>
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
              <xsl:text>x-graphic-1-0</xsl:text>
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
  <div class="pr-brk-after"></div>
</xsl:template>

<xsl:template match="_ufe:howtouse-title" priority="0">
  <div ch:title="notoc" class="x--ufe-howtouse-title-3-0">
    <xsl:call-template name="t-base-div-title"/>
  </div>
</xsl:template>

<xsl:template match="ifr" priority="0">
  <xsl:apply-templates/>
</xsl:template>

<xsl:template match="imp" priority="0">
  <xsl:apply-templates/>
</xsl:template>

<xsl:template match="_ufe:intro-title" priority="0">
  <div ch:title="notoc" class="x--ufe-intro-title-3-0">
    <xsl:call-template name="t-base-div-title"/>
  </div>
</xsl:template>

<xsl:template match="limits" priority="0">
  <xsl:apply-templates/>
</xsl:template>

<xsl:template match="mating-part" priority="0">
  <xsl:apply-templates/>
</xsl:template>

<xsl:template match="max" priority="0">
  <xsl:apply-templates/>
</xsl:template>

<xsl:template match="met" priority="0">
  <xsl:apply-templates/>
</xsl:template>

<xsl:template match="min" priority="0">
  <xsl:apply-templates/>
</xsl:template>

<xsl:template match="mm-fits" priority="0">
  <div class="x-mm-fits-1-0">
    <xsl:call-template name="t-base-div-basic2"/>
  </div>
</xsl:template>

<xsl:template match="name" priority="0">
  <div class="x-name-1-0">
    <xsl:call-template name="t-base-div-basic"/>
  </div>
</xsl:template>

<xsl:template match="nomen" priority="0">
  <xsl:apply-templates/>
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

<xsl:template match="_ufe:num-index-title" priority="0">
  <div ch:title="notoc" class="x--ufe-num-index-title-4-0">
    <xsl:call-template name="t-base-div-title"/>
  </div>
</xsl:template>

<xsl:template match="_ufe:nut-option-title" priority="0">
  <div ch:title="notoc" class="x--ufe-nut-option-title-4-0">
    <xsl:call-template name="t-base-div-title"/>
  </div>
</xsl:template>

<xsl:template match="pageblock-front" priority="0">
  <div class="x-pageblock-front-1-0">
    <xsl:call-template name="t-base-div-basic"/>
  </div>
</xsl:template>

<xsl:template match="frontmatter//module/pageblock-title" priority="2">
  <div ch:title="toc" class="x-pageblock-title-1-0">
    <xsl:call-template name="t-base-div-title"/>
  </div>
</xsl:template>

<xsl:template match="pgblk/pageblock-title" priority="1">
  <div ch:title="notoc" class="x-pageblock-title-2-0">
    <xsl:call-template name="t-base-div-title"/>
  </div>
</xsl:template>

<xsl:template match="pageblock-title" priority="0">
  <div ch:title="toc" class="x-pageblock-title-3-0">
    <xsl:call-template name="t-base-div-title"/>
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

<xsl:template match="q-and-st" priority="0">
  <xsl:apply-templates/>
</xsl:template>

<xsl:template match="ref-nbr" priority="0">
  <xsl:apply-templates/>
</xsl:template>

<xsl:template match="remarks" priority="0">
  <xsl:apply-templates/>
</xsl:template>

<xsl:template match="repl" priority="0">
  <xsl:apply-templates/>
</xsl:template>

<xsl:template match="_ufe:sblist-title" priority="0">
  <div ch:title="notoc" class="x--ufe-sblist-title-3-0">
    <xsl:call-template name="t-base-div-title"/>
  </div>
</xsl:template>

<xsl:template match="_ufe:spblist-title" priority="0">
  <div ch:title="notoc" class="x--ufe-spblist-title-3-0">
    <xsl:call-template name="t-base-div-title"/>
  </div>
</xsl:template>

<xsl:template match="spec-assem" priority="0">
  <xsl:apply-templates/>
</xsl:template>

<xsl:template match="spec-tool" priority="0">
  <xsl:apply-templates/>
</xsl:template>

<xsl:template match="special-tools" priority="0">
  <div>
     <xsl:attribute name="class">
        <xsl:text>x-special-tools-1-0</xsl:text>
        <xsl:if test="@empty and string(@empty)='YES'"> x-special-tools-1-1</xsl:if>
     </xsl:attribute>
     <xsl:call-template name="t-base-div-basic2"/>
  </div>
</xsl:template>

<xsl:template match="spring" priority="0">
  <xsl:apply-templates/>
</xsl:template>

<xsl:template match="spring-pressure" priority="0">
  <xsl:apply-templates/>
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
  <table border="0" cellpadding="0" cellspacing="0" class="x-step-2-0 x--zero-left-margins x-tab-fixed">
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
  <xsl:apply-templates select="node()[self::warning or (self::revst and following-sibling::*[1][self::warning]) or self::caution or (self::revst and following-sibling::*[1][self::caution]) or name() = 'revend']"> </xsl:apply-templates>
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
  <xsl:apply-templates select="node()[self::warning or (self::revst and following-sibling::*[1][self::warning]) or self::caution or (self::revst and following-sibling::*[1][self::caution]) or name() = 'revend']"> </xsl:apply-templates>
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
  <xsl:apply-templates select="node()[self::warning or (self::revst and following-sibling::*[1][self::warning]) or self::caution or (self::revst and following-sibling::*[1][self::caution]) or name() = 'revend']"> </xsl:apply-templates>
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
  <xsl:apply-templates select="node()[self::warning or (self::revst and following-sibling::*[1][self::warning]) or self::caution or (self::revst and following-sibling::*[1][self::caution]) or name() = 'revend']"> </xsl:apply-templates>
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
  <xsl:apply-templates select="node()[self::warning or (self::revst and following-sibling::*[1][self::warning]) or self::caution or (self::revst and following-sibling::*[1][self::caution]) or name() = 'revend']"> </xsl:apply-templates>
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
  <xsl:apply-templates select="node()[self::warning or (self::revst and following-sibling::*[1][self::warning]) or self::caution or (self::revst and following-sibling::*[1][self::caution]) or name() = 'revend']"> </xsl:apply-templates>
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
  <xsl:apply-templates select="node()[self::warning or (self::revst and following-sibling::*[1][self::warning]) or self::caution or (self::revst and following-sibling::*[1][self::caution]) or name() = 'revend']"> </xsl:apply-templates>
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
  <xsl:apply-templates select="node()[self::warning or (self::revst and following-sibling::*[1][self::warning]) or self::caution or (self::revst and following-sibling::*[1][self::caution]) or name() = 'revend']"> </xsl:apply-templates>
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
  <xsl:apply-templates select="node()[self::warning or (self::revst and following-sibling::*[1][self::warning]) or self::caution or (self::revst and following-sibling::*[1][self::caution]) or name() = 'revend']"> </xsl:apply-templates>
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
  <div ch:title="notoc" class="x--ufe-supplier-list-title-4-0">
    <xsl:call-template name="t-base-div-title"/>
  </div>
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
  <div ch:title="notoc" class="x-title-19-0">
    <xsl:call-template name="t-base-div-title"/>
  </div>
</xsl:template>

<xsl:template match="book[contains(@doctype, 'epc')]//graphic/title" priority="53">
  <div ch:title="notoc" class="x-title-20-0">
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
        <xsl:call-template name="t-base-div-basic"/>
     </div>
  </xsl:if>
</xsl:template>

<xsl:template match="pwcspblist/title" priority="35">
  <div ch:title="notoc" class="x-title-38-0">
    <xsl:call-template name="t-base-div-title"/>
  </div>
</xsl:template>

<xsl:template match="sblist/title" priority="32">
  <div ch:title="notoc" class="x-title-41-0">
    <xsl:call-template name="t-base-div-title"/>
  </div>
</xsl:template>

<xsl:template match="pwcni/title" priority="31">
  <div ch:title="notoc" class="x-title-42-0">
    <xsl:call-template name="t-base-div-title"/>
  </div>
</xsl:template>

<xsl:template match="vendlist/title" priority="30">
  <div ch:title="notoc" class="x-title-43-0">
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
  <div ch:title="notoc" class="x-title-64-0">
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

<xsl:template match="tool-list" priority="0">
  <xsl:apply-templates/>
</xsl:template>

<xsl:template match="torque-and-stretch" priority="0">
  <div class="x-torque-and-stretch-1-0">
    <xsl:call-template name="t-base-div-basic2"/>
  </div>
</xsl:template>

<xsl:template match="trdata" priority="0">
  <xsl:apply-templates/>
</xsl:template>

<xsl:template match="trlist" priority="0">
  <xsl:apply-templates/>
</xsl:template>

<xsl:template match="trloc" priority="0">
  <xsl:apply-templates/>
</xsl:template>

<xsl:template match="trnbr" priority="0">
  <xsl:apply-templates/>
</xsl:template>

<xsl:template match="trstatus" priority="0">
  <xsl:apply-templates/>
</xsl:template>

</xsl:stylesheet>
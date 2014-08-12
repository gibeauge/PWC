<?xml version="1.0" encoding="UTF-8"?>

<!DOCTYPE xsl:stylesheet [
    <!ENTITY % entities_commun SYSTEM "xsl_entities_commun.ent">
    %entities_commun;
]>
<xsl:stylesheet 
  xmlns:simg="java:net.sf.docbook.saxon.ImageIntrinsics" 
  xmlns:xsl="http://www.w3.org/1999/XSL/Transform" 
  xmlns:ximg="xaln://com.nwalsh.xalan.ImageIntrinsics" 
  xmlns="http://www.w3.org/1999/xhtml" 
  xmlns:exslt="http://exslt.org/common" 
  xmlns:_acl="java:com.arbortext.epic.Acl" 
  xmlns:msxsl="urn:schemas-microsoft-com:xslt" 
  xmlns:_="http://www.pwc.ca/namespace/doctypes/emipc" 
  xmlns:_dtd="http://www.arbortext.com/namespace/Styler/UserElements" 
  xmlns:atidlm="http://www.arbortext.com/namespace/atidlm" 
  xmlns:_2="http://www.pwc.ca/namespace/doctypes/jmtosmigrate" 
  xmlns:ch="http://www.arbortext.com/namespace/chunker" 
  xmlns:saxon="http://saxon.sf.net/" 
  xmlns:_5="http://www.pwc.ca/namespace/doctypes/ipc" 
  xmlns:_gte="http://www.arbortext.com/namespace/Styler/GeneratedTextElements" 
  xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" 
  xmlns:_sfe="http://www.arbortext.com/namespace/Styler/StylerFormattingElements" 
  xmlns:_js="java:com.arbortext.epic.internal.js.JavaScript" 
  xmlns:_3="http://www.pwc.ca/namespace/doctypes/migrate" 
  xmlns:_ufe="http://www.arbortext.com/namespace/Styler/UserFormattingElements" 
  version="1.0" 
  exclude-result-prefixes="_ atidlm xml _2 ch saxon _5 xsi _js _3 #default exslt msxsl _dtd _ufe _sfe _gte simg ximg _acl">

<xsl:include href="base_initial-pass-mode.xsl"/>
<xsl:include href="base_expand-gentext.xsl"/>
<xsl:include href="base_styler_numbering.xsl"/>
<xsl:include href="base_set-countas.xsl"/>
<xsl:include href="base_styler-LabelAndNumberMarker.xsl"/>
<xsl:include href="base_set-id.xsl"/>
<xsl:include href="base_ElementContent_All.xsl"/>
<xsl:include href="base_expand-numbering.xsl"/>

<xsl:variable name="pf-id" select="'styler-id'"/>

<xsl:template name="t-base-div-basic">
  <xsl:copy-of select="@ch:*"/>
  <xsl:call-template name="maybe-set-id"/>
  <xsl:apply-templates/>
</xsl:template>

<xsl:template name="t-base-div-basic2">
  <xsl:copy-of select="@ch:*"/>
  <xsl:call-template name="maybe-set-id">
    <xsl:with-param name="only-if-id-attr" select="'no'"/>
    <xsl:with-param name="generated-id-prefix" select="$pf-id"/>
  </xsl:call-template>
  <xsl:apply-templates/>
</xsl:template>

<xsl:template name="t-base-div-basic-h">
  <xsl:param name="hidden"/>

  <xsl:copy-of select="@ch:*"/>
  <xsl:call-template name="maybe-set-id"/>
  <xsl:choose>
    <xsl:when test="$hidden='no'">
       <xsl:apply-templates/>
    </xsl:when>
    <xsl:otherwise>
       <xsl:apply-templates select="_sfe:BeforeOrAfterText"/>
    </xsl:otherwise>
  </xsl:choose>
</xsl:template>

<xsl:template name="t-base-div-basic2-h">
  <xsl:param name="hidden"/>

  <xsl:copy-of select="@ch:*"/>
  <xsl:call-template name="maybe-set-id">
    <xsl:with-param name="only-if-id-attr" select="'no'"/>
  </xsl:call-template>
  <xsl:choose>
    <xsl:when test="$hidden='no'">
       <xsl:apply-templates/>
    </xsl:when>
    <xsl:otherwise>
       <xsl:apply-templates select="_sfe:BeforeOrAfterText"/>
    </xsl:otherwise>
  </xsl:choose>
</xsl:template>

<xsl:template name="t-base-div-title">
  <xsl:copy-of select="@ch:*"/>
  <xsl:attribute name="id"><xsl:call-template name="object.id"/></xsl:attribute>
  <xsl:call-template name="maybe-set-id">
    <xsl:with-param name="only-if-id-attr" select="'no'"/>
  </xsl:call-template>
  <xsl:apply-templates/>
</xsl:template>

<xsl:template name="t-base-div-chunk">
   <xsl:copy-of select="@ch:*"/>
   <xsl:if test="@object-key!=''">
     <xsl:attribute name="ch:filename"><xsl:value-of select="@object-key"/></xsl:attribute>
     <xsl:attribute name="ch:namepriority">0</xsl:attribute>
   </xsl:if>
   <xsl:call-template name="maybe-set-id">
     <xsl:with-param name="only-if-id-attr" select="'no'"/>
   </xsl:call-template>
</xsl:template>

<xsl:template name="t-base-img-graphic">
  <xsl:param name="filename" select="@negnumber"/>
  
  <xsl:copy-of select="@ch:*"/>
  <img alt="Graphic">
    <xsl:copy-of select="@ch:*"/>
    <xsl:variable name="graphic-prop-filename">
       <xsl:if test="$graphics-path!=''">
          <xsl:call-template name="substring-before-last">
             <xsl:with-param name="str" select="$graphics-path"/>
             <xsl:with-param name="delim" select="'/'"/>
          </xsl:call-template>
          <xsl:text>/</xsl:text>
       </xsl:if>
       <xsl:value-of select="$filename"/>
    </xsl:variable>
    <xsl:attribute name="src">
       <xsl:value-of select="string($filename)"/>
    </xsl:attribute>
    <xsl:attribute name="style">max-width: 100%; </xsl:attribute>
    <xsl:call-template name="maybe-set-id"/>
    <xsl:apply-templates/>
  </img>
</xsl:template>

<xsl:template name="t-base-step-table">
  <xsl:param name="col1-width"/>
  <xsl:param name="col2-width"/>
  <xsl:param name="col3-width"/>
  <xsl:param name="label-col"/>
  <xsl:param name="col2-align"/>
  <xsl:param name="apply"/>

  <xsl:copy-of select="@ch:*"/>
  <xsl:call-template name="maybe-set-id"/>
  <col>
    <xsl:if test="$col1-width!=''">
      <xsl:attribute name="style"><xsl:text>width: </xsl:text><xsl:value-of select="$col1-width"/></xsl:attribute>
    </xsl:if>
  </col>
  <col>
    <xsl:if test="$col2-width!=''">
      <xsl:attribute name="style"><xsl:text>width: </xsl:text><xsl:value-of select="$col2-width"/></xsl:attribute>
    </xsl:if>
  </col>
  <col>
    <xsl:if test="$col3-width!=''">
      <xsl:attribute name="style"><xsl:text>width: </xsl:text><xsl:value-of select="$col3-width"/></xsl:attribute>
      </xsl:if>
   </col>
   <tbody>
      <tr valign="baseline">
         <td align="right">
            <xsl:if test="$label-col='1'">
               <xsl:attribute name="style">word-break: keep-all; </xsl:attribute>
               <xsl:apply-templates select="_sfe:BeforeOrAfterText[1]"/>
            </xsl:if>
         </td>
         <td align="{$col2-align}">
            <xsl:if test="$label-col='2'">
               <xsl:attribute name="style">word-break: keep-all; </xsl:attribute>
               <xsl:apply-templates select="_sfe:BeforeOrAfterText[1]"/>
            </xsl:if>
         </td>
         <td>
            <xsl:if test="$label-col='3'">
               <xsl:attribute name="style">word-break: keep-all; </xsl:attribute>
               <xsl:apply-templates select="_sfe:BeforeOrAfterText[1]"/>
            </xsl:if>
            <xsl:apply-templates select="node()[not(contains($apply,concat(' ',name(),' ')))]"/>
            <!--
            <xsl:choose>
              <xsl:when test="$apply='no-warn'">
                <xsl:apply-templates select="node()[name(.)!='_sfe:BeforeOrAfterText' and name()!='warning' and name()!='caution']"/>
              </xsl:when>
              <xsl:when test="$apply='no-warn-note'">
                <xsl:apply-templates select="node()[name(.)!='_sfe:BeforeOrAfterText' and name()!='warning' and name()!='caution' and name()!='note']"/>
              </xsl:when>
              <xsl:otherwise>
                <xsl:apply-templates select="node()[name(.)!='_sfe:BeforeOrAfterText']"/>
              </xsl:otherwise>
            </xsl:choose>
            -->
         </td>
      </tr>
   </tbody>
</xsl:template>

<xsl:template name="t-base-pwcmetainfo">
  <div id="pwcmetainfo" style="display:none">
    <div id="chapter">
       <xsl:choose>
          <xsl:when test="ancestor::frontmatter">frontmatter</xsl:when>
          <xsl:otherwise><xsl:value-of select="@chapter"/></xsl:otherwise>
       </xsl:choose>
    </div>
    <div id="section">
       <xsl:choose>
          <xsl:when test="ancestor::frontmatter">frontmatter</xsl:when>
          <xsl:otherwise><xsl:value-of select="@section"/></xsl:otherwise>
       </xsl:choose>
    </div>
    <div id="subject">
       <xsl:choose>
          <xsl:when test="ancestor::frontmatter">frontmatter</xsl:when>
          <xsl:otherwise><xsl:value-of select="@subject"/></xsl:otherwise>
       </xsl:choose>
    </div>
    <div id="pbn"                    ><xsl:value-of select="@pb-name"/></div>
    <div id="pb-title"               ><xsl:value-of select="@pb-title"/></div>
    <div id="pointRev"               ><xsl:value-of select="ancestor::book/@point-revnbr"/></div>
    <div id="ModelNo"                ><xsl:value-of select="ancestor::book/@model"/></div>
    <div id="ManualServiceBulletinNo"><xsl:value-of select="ancestor::book/@manualpnr"/></div>
    <div id="RevNo"                  ><xsl:value-of select="ancestor::book/@revnbr"/></div>
    <div id="IssueRevisionDate"      ><xsl:value-of select="ancestor::book/@revdate"/></div>
    <div id="manualType"             ><xsl:value-of select="ancestor::book/@doctype"/></div>
    <div id="engineFamily"           ><xsl:value-of select="ancestor::book/@family"/></div>
  </div>
</xsl:template>

<xsl:template name="t-base-pwcbannerinfo">
  <div id="pwcbannerinfo" style="display:none">
    <div id="manualTitle">
       <xsl:choose>
          <xsl:when test="ancestor::book[contains(@doctype,'epc')]//page-block[@pb-name='title-page']">ILLUSTRATED PARTS CATALOG</xsl:when>
          <xsl:when test="ancestor::book[contains(@doctype,'tmm')]//page-block[@pb-name='title-page']">MAINTENANCE MANUAL</xsl:when>
          <xsl:when test="ancestor::book[contains(@doctype,'lmm')]//page-block[@pb-name='title-page']">LINE MAINTENANCE MANUAL</xsl:when>
          <xsl:when test="ancestor::book[contains(@doctype,'em')]//page-block[@pb-name='title-page']">OVERHAUL MANUAL</xsl:when>
          <xsl:when test="ancestor::book[contains(@doctype,'cir')]//page-block[@pb-name='title-page']">CLEANING INSPECTION REPAIR (CIR) MANUAL</xsl:when>
          <xsl:otherwise>
             <xsl:value-of select="//page-block[@pb-name='title-page'][1]/module/title-page/manual-title"/>
          </xsl:otherwise>
       </xsl:choose>
    </div>
    <div id="engine">
       <xsl:choose>
          <xsl:when test="ancestor::book[contains(@doctype,'epc')]//page-block[@pb-name='title-page']">
             <xsl:text>Model(s) </xsl:text><xsl:value-of select="//page-block[@pb-name='title-page'][1]/module/pwc-title/pwc-model/modelspec"/>
          </xsl:when>
          <xsl:when test="ancestor::book[contains(@doctype,'tmm') or contains(@doctype,'em') or contains(@doctype,'cir')]//page-block[@pb-name='title-page']">
             <xsl:text>Model(s) </xsl:text><xsl:value-of select="//page-block[@pb-name='title-page'][1]/module/mfmatr/pwcem-title/@model"/>
          </xsl:when>
          <xsl:when test="ancestor::book[contains(@doctype,'lmm')]//page-block[@pb-name='title-page']">
             <xsl:text>Model(s) </xsl:text><xsl:value-of select="//page-block[@pb-name='title-page'][1]/module/mfmatr/pwclmm-title/@model"/>
          </xsl:when>
          <xsl:otherwise>
             <xsl:value-of select="//page-block[@pb-name='title-page'][1]/module/title-page/model"/>
          </xsl:otherwise>
       </xsl:choose>
    </div>
    <div id="manualPn">
       <xsl:choose>
          <xsl:when test="ancestor::book[contains(@doctype,'epc') or contains(@doctype,'tmm') or contains(@doctype,'lmm') or contains(@doctype,'em') or contains(@doctype,'cir')]">
             <xsl:text>Manual Part No. </xsl:text>
             <xsl:value-of select="ancestor::book/@manualpnr"/>
          </xsl:when>
          <xsl:otherwise>
             <xsl:value-of select="//page-block[@pb-name='title-page'][1]/module/title-page/manual-pn"/>
          </xsl:otherwise>
       </xsl:choose>
    </div>
    <div id="pointRev"><xsl:value-of select="ancestor::book/@point-revnbr"/></div>
    <div id="revision"><xsl:value-of select="ancestor::book/@revnbr"/></div>
    <div id="revDate" ><xsl:value-of select="ancestor::book/@revdate"/></div>
  </div>
</xsl:template>

<xsl:template match="numlist/address" priority="7">
  <table border="0" cellpadding="0" cellspacing="0" style="table-layout: fixed; " class=" x-address-1-0 x--zero-left-margins">
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

<xsl:template match="sbdata/address" priority="6">
  <table border="0" cellpadding="0" cellspacing="0" style="table-layout: fixed; " class=" x-address-2-0 x--zero-left-margins">
    <xsl:call-template name="t-base-step-table">
      <xsl:with-param name="col1-width" select="'0em'"/>
      <xsl:with-param name="col2-width" select="'15pt'"/>
      <xsl:with-param name="col3-width" select="''"/>
      <xsl:with-param name="label-col"  select="'2'"/>
      <xsl:with-param name="col2-align" select="'left'"/>
      <xsl:with-param name="apply"      select="'&lib-gentxt;'"/>
    </xsl:call-template>
  </table>
</xsl:template>

<xsl:template match="alpha-list/address" priority="5">
  <table border="0" cellpadding="0" cellspacing="0" style="table-layout: fixed; " class=" x-address-3-0 x--zero-left-margins">
    <xsl:call-template name="t-base-step-table">
      <xsl:with-param name="col1-width" select="'0em'"/>
      <xsl:with-param name="col2-width" select="'15pt'"/>
      <xsl:with-param name="col3-width" select="''"/>
      <xsl:with-param name="label-col"  select="'2'"/>
      <xsl:with-param name="col2-align" select="'left'"/>
      <xsl:with-param name="apply"      select="'&lib-gentxt;'"/>
    </xsl:call-template>
  </table>
</xsl:template>

<xsl:template match="num-list/address" priority="4">
  <table border="0" cellpadding="0" cellspacing="0" style="table-layout: fixed; " class=" x-address-4-0 x--zero-left-margins">
    <xsl:call-template name="t-base-step-table">
      <xsl:with-param name="col1-width" select="'0em'"/>
      <xsl:with-param name="col2-width" select="'15pt'"/>
      <xsl:with-param name="col3-width" select="''"/>
      <xsl:with-param name="label-col"  select="'2'"/>
      <xsl:with-param name="col2-align" select="'left'"/>
      <xsl:with-param name="apply"      select="'&lib-gentxt;'"/>
    </xsl:call-template>
  </table>
</xsl:template>

<xsl:template match="glossary/address" priority="3">
  <table border="0" cellpadding="0" cellspacing="0" class=" x-address-5-0 x--zero-left-margins">
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

<xsl:template match="pwcchapsect-list/address" priority="2">
  <table border="0" cellpadding="0" cellspacing="0" style="table-layout: fixed; " class=" x-address-6-0 x--zero-left-margins">
    <xsl:call-template name="t-base-step-table">
      <xsl:with-param name="col1-width" select="'0em'"/>
      <xsl:with-param name="col2-width" select="'15pt'"/>
      <xsl:with-param name="col3-width" select="''"/>
      <xsl:with-param name="label-col"  select="'2'"/>
      <xsl:with-param name="col2-align" select="'left'"/>
      <xsl:with-param name="apply"      select="'&lib-gentxt;'"/>
    </xsl:call-template>
  </table>
</xsl:template>

<xsl:template match="enumlist/address" priority="1">
  <table border="0" cellpadding="0" cellspacing="0" class=" x-address-7-0 x--zero-left-margins">
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

<xsl:template match="address" priority="0">
  <table border="0" cellpadding="0" cellspacing="0" class=" x-address-8-0 x--zero-left-margins">
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

<xsl:template match="aispart" priority="0">
  <span class=" x-aispart-1-0">
    <xsl:call-template name="t-base-div-basic"/>
  </span>
</xsl:template>

<xsl:template match="alpha-list" priority="0">
  <div class=" x-alpha-list-1-0">
    <xsl:call-template name="t-base-div-basic"/>
  </div>
</xsl:template>

<xsl:template match="applic-group" priority="0">
    <xsl:apply-templates/>
 </xsl:template>

<xsl:template match="applic-item" priority="0">
  <xsl:apply-templates/>
</xsl:template>

<xsl:template match="ata-page-block" priority="0">
  <div class=" x-ata-page-block-1-0">
    <xsl:call-template name="t-base-div-chunk"/>
    <xsl:call-template name="t-base-pwcmetainfo"/>
    <xsl:call-template name="t-base-pwcbannerinfo"/>
    <xsl:apply-templates/>
    <script type="text/javascript">addTableChangebars();</script>
    <script language="JavaScript" type="text/javascript">addChangebars();</script>
  </div>
</xsl:template>

<xsl:template match="address/att" priority="1">
  <div class=" x-att-1-0">
    <xsl:call-template name="t-base-div-basic"/>
  </div>
</xsl:template>

<xsl:template match="att" priority="0">
  <div class=" x-att-2-0">
    <xsl:call-template name="t-base-div-basic"/>
  </div>
</xsl:template>

<xsl:template match="aw-notice" priority="0">
  <div class=" x-aw-notice-1-0">
    <xsl:call-template name="t-base-div-basic"/>
  </div>
</xsl:template>

<xsl:template match="awlror" priority="0">
  <div class=" x-awlror-1-0">
    <xsl:call-template name="t-base-div-basic"/>
  </div>
</xsl:template>

<xsl:template match="awlrorsection" priority="0">
  <xsl:apply-templates/>
</xsl:template>

<xsl:template match="barend" priority="0">
  <xsl:apply-templates/>
</xsl:template>

<xsl:template match="barstart" priority="0">
  <xsl:apply-templates/>
</xsl:template>

<xsl:template match="_ufe:block-nospace" priority="0">
  <div class=" x--ufe-block-nospace-1-0">
    <xsl:call-template name="t-base-div-basic"/>
  </div>
</xsl:template>

<xsl:template match="_ufe:block-prespace" priority="0">
  <div class=" x--ufe-block-prespace-1-0">
    <xsl:call-template name="t-base-div-basic"/>
  </div>
</xsl:template>

<xsl:template match="book" priority="0">
  <body ch:chunk="yes">
    <div class=" x-book-1-0">
      <xsl:call-template name="t-base-div-basic"/>
    </div>
  </body>
</xsl:template>

<xsl:template name="__style-for_brk.1">
      <xsl:text> .x-brk-1-0 {margin-left: 0pt; margin-right: 0pt; }</xsl:text>
   </xsl:template>

<xsl:template match="brk" priority="0">
      <span>
         <!--Emit class values to reflect conditions-->
         <xsl:attribute name="class">
            <xsl:text> x-brk-1-0</xsl:text>
         </xsl:attribute>
         <xsl:if test="@xml:lang">
            <xsl:attribute name="lang">
               <xsl:call-template name="return-lang-applying-language-map">
                  <xsl:with-param name="doclang" select="@xml:lang"/>
               </xsl:call-template>
            </xsl:attribute>
         </xsl:if>
         <xsl:copy-of select="@ch:*"/>
         <xsl:copy-of xmlns:dmp="http://www.arbortext.com/namespace/dmp/dmpmap" select="@dmp:*"/>
         <xsl:if test="@xml:lang">
            <xsl:attribute name="lang">
               <xsl:call-template name="return-lang-applying-language-map">
                  <xsl:with-param name="doclang" select="@xml:lang"/>
               </xsl:call-template>
            </xsl:attribute>
         </xsl:if>
         <xsl:call-template name="maybe-set-id"/>
         <!--Process this element's content-->
         <xsl:apply-templates/>
      </span>
   </xsl:template>

<xsl:template name="__style-for_bullist.1">
      <xsl:text> .x-bullist-1-0 {margin-left: 0pt; margin-right: 0pt; text-indent: 0pt; margin-top: 8pt; }</xsl:text>
   </xsl:template>

<xsl:template match="bullist" priority="0">
      <div>
         <!--Emit class values to reflect conditions-->
         <xsl:attribute name="class">
            <xsl:text> x-bullist-1-0</xsl:text>
         </xsl:attribute>
         <xsl:if test="@xml:lang">
            <xsl:attribute name="lang">
               <xsl:call-template name="return-lang-applying-language-map">
                  <xsl:with-param name="doclang" select="@xml:lang"/>
               </xsl:call-template>
            </xsl:attribute>
         </xsl:if>
         <xsl:copy-of select="@ch:*"/>
         <xsl:copy-of xmlns:dmp="http://www.arbortext.com/namespace/dmp/dmpmap" select="@dmp:*"/>
         <xsl:if test="@xml:lang">
            <xsl:attribute name="lang">
               <xsl:call-template name="return-lang-applying-language-map">
                  <xsl:with-param name="doclang" select="@xml:lang"/>
               </xsl:call-template>
            </xsl:attribute>
         </xsl:if>
         <xsl:call-template name="maybe-set-id"/>
         <!--Process this element's content-->
         <xsl:apply-templates/>
      </div>
   </xsl:template>

<xsl:template name="__style-for_callout.2fireut181">
      <xsl:text> .x-callout-1-0 {margin-left: 0pt; margin-right: 0pt; }</xsl:text>
   </xsl:template>

<xsl:template match="figure/key/callout" priority="1">
      <span>
         <!--Emit class values to reflect conditions-->
         <xsl:attribute name="class">
            <xsl:text> x-callout-1-0</xsl:text>
         </xsl:attribute>
         <xsl:if test="@xml:lang">
            <xsl:attribute name="lang">
               <xsl:call-template name="return-lang-applying-language-map">
                  <xsl:with-param name="doclang" select="@xml:lang"/>
               </xsl:call-template>
            </xsl:attribute>
         </xsl:if>
         <xsl:copy-of select="@ch:*"/>
         <xsl:copy-of xmlns:dmp="http://www.arbortext.com/namespace/dmp/dmpmap" select="@dmp:*"/>
         <xsl:if test="@xml:lang">
            <xsl:attribute name="lang">
               <xsl:call-template name="return-lang-applying-language-map">
                  <xsl:with-param name="doclang" select="@xml:lang"/>
               </xsl:call-template>
            </xsl:attribute>
         </xsl:if>
         <xsl:call-template name="maybe-set-id"/>
         <!--Process this element's content-->
         <xsl:apply-templates/>
      </span>
   </xsl:template>

<xsl:template name="__style-for_callout.2caouut72">
      <xsl:text> .x-callout-2-0 {margin-left: 0pt; margin-right: 0pt; }</xsl:text>
   </xsl:template>

<xsl:template match="callout" priority="0">
      <span>
         <!--Emit class values to reflect conditions-->
         <xsl:attribute name="class">
            <xsl:text> x-callout-2-0</xsl:text>
         </xsl:attribute>
         <xsl:if test="@xml:lang">
            <xsl:attribute name="lang">
               <xsl:call-template name="return-lang-applying-language-map">
                  <xsl:with-param name="doclang" select="@xml:lang"/>
               </xsl:call-template>
            </xsl:attribute>
         </xsl:if>
         <xsl:copy-of select="@ch:*"/>
         <xsl:copy-of xmlns:dmp="http://www.arbortext.com/namespace/dmp/dmpmap" select="@dmp:*"/>
         <xsl:if test="@xml:lang">
            <xsl:attribute name="lang">
               <xsl:call-template name="return-lang-applying-language-map">
                  <xsl:with-param name="doclang" select="@xml:lang"/>
               </xsl:call-template>
            </xsl:attribute>
         </xsl:if>
         <xsl:call-template name="maybe-set-id"/>
         <!--Process this element's content-->
         <xsl:apply-templates/>
      </span>
   </xsl:template>

<xsl:template name="__style-for_caution.12suason151">
      <xsl:text> .x-caution-1-0 {margin-left: 0pt; margin-right: 0pt; text-indent: 0pt; margin-top: 8pt; font-weight: bold; margin-left: 81pt; text-indent: -63pt; }</xsl:text>
   </xsl:template>

<xsl:template match="subtask/caution" priority="11">
      <div>
         <!--Emit class values to reflect conditions-->
         <xsl:attribute name="class">
            <xsl:text> x-caution-1-0</xsl:text>
         </xsl:attribute>
         <xsl:if test="@xml:lang">
            <xsl:attribute name="lang">
               <xsl:call-template name="return-lang-applying-language-map">
                  <xsl:with-param name="doclang" select="@xml:lang"/>
               </xsl:call-template>
            </xsl:attribute>
         </xsl:if>
         <xsl:copy-of select="@ch:*"/>
         <xsl:copy-of xmlns:dmp="http://www.arbortext.com/namespace/dmp/dmpmap" select="@dmp:*"/>
         <xsl:if test="@xml:lang">
            <xsl:attribute name="lang">
               <xsl:call-template name="return-lang-applying-language-map">
                  <xsl:with-param name="doclang" select="@xml:lang"/>
               </xsl:call-template>
            </xsl:attribute>
         </xsl:if>
         <xsl:call-template name="maybe-set-id"/>
         <!--Process this element's content-->
         <xsl:apply-templates/>
      </div>
   </xsl:template>

<xsl:template name="__style-for_caution.12tacaon122">
      <xsl:text> .x-caution-2-0 {margin-left: 0pt; margin-right: 0pt; text-indent: 0pt; margin-top: 8pt; font-weight: bold; margin-left: 81pt; text-indent: -63pt; }</xsl:text>
   </xsl:template>

<xsl:template match="task/caution" priority="10">
      <div>
         <!--Emit class values to reflect conditions-->
         <xsl:attribute name="class">
            <xsl:text> x-caution-2-0</xsl:text>
         </xsl:attribute>
         <xsl:if test="@xml:lang">
            <xsl:attribute name="lang">
               <xsl:call-template name="return-lang-applying-language-map">
                  <xsl:with-param name="doclang" select="@xml:lang"/>
               </xsl:call-template>
            </xsl:attribute>
         </xsl:if>
         <xsl:copy-of select="@ch:*"/>
         <xsl:copy-of xmlns:dmp="http://www.arbortext.com/namespace/dmp/dmpmap" select="@dmp:*"/>
         <xsl:if test="@xml:lang">
            <xsl:attribute name="lang">
               <xsl:call-template name="return-lang-applying-language-map">
                  <xsl:with-param name="doclang" select="@xml:lang"/>
               </xsl:call-template>
            </xsl:attribute>
         </xsl:if>
         <xsl:call-template name="maybe-set-id"/>
         <!--Process this element's content-->
         <xsl:apply-templates/>
      </div>
   </xsl:template>

<xsl:template name="__style-for_caution.12n-raon143">
      <xsl:text> .x-caution-3-0 {margin-left: 0pt; margin-right: 0pt; text-indent: 0pt; margin-top: 8pt; font-weight: bold; margin-left: 87pt; text-indent: -63pt; }</xsl:text>
   </xsl:template>

<xsl:template match="n-para/caution" priority="9">
      <div>
         <!--Emit class values to reflect conditions-->
         <xsl:attribute name="class">
            <xsl:text> x-caution-3-0</xsl:text>
         </xsl:attribute>
         <xsl:if test="@xml:lang">
            <xsl:attribute name="lang">
               <xsl:call-template name="return-lang-applying-language-map">
                  <xsl:with-param name="doclang" select="@xml:lang"/>
               </xsl:call-template>
            </xsl:attribute>
         </xsl:if>
         <xsl:copy-of select="@ch:*"/>
         <xsl:copy-of xmlns:dmp="http://www.arbortext.com/namespace/dmp/dmpmap" select="@dmp:*"/>
         <xsl:if test="@xml:lang">
            <xsl:attribute name="lang">
               <xsl:call-template name="return-lang-applying-language-map">
                  <xsl:with-param name="doclang" select="@xml:lang"/>
               </xsl:call-template>
            </xsl:attribute>
         </xsl:if>
         <xsl:call-template name="maybe-set-id"/>
         <!--Process this element's content-->
         <xsl:apply-templates/>
      </div>
   </xsl:template>

<xsl:template name="__style-for_caution.12stcaon124">
      <xsl:text> .x-caution-4-0 {margin-left: 0pt; margin-right: 0pt; text-indent: 0pt; margin-top: 8pt; font-weight: bold; margin-left: 98pt; text-indent: -63pt; }</xsl:text>
   </xsl:template>

<xsl:template match="step/caution" priority="8">
      <div>
         <!--Emit class values to reflect conditions-->
         <xsl:attribute name="class">
            <xsl:text> x-caution-4-0</xsl:text>
         </xsl:attribute>
         <xsl:if test="@xml:lang">
            <xsl:attribute name="lang">
               <xsl:call-template name="return-lang-applying-language-map">
                  <xsl:with-param name="doclang" select="@xml:lang"/>
               </xsl:call-template>
            </xsl:attribute>
         </xsl:if>
         <xsl:copy-of select="@ch:*"/>
         <xsl:copy-of xmlns:dmp="http://www.arbortext.com/namespace/dmp/dmpmap" select="@dmp:*"/>
         <xsl:if test="@xml:lang">
            <xsl:attribute name="lang">
               <xsl:call-template name="return-lang-applying-language-map">
                  <xsl:with-param name="doclang" select="@xml:lang"/>
               </xsl:call-template>
            </xsl:attribute>
         </xsl:if>
         <xsl:call-template name="maybe-set-id"/>
         <!--Process this element's content-->
         <xsl:apply-templates/>
      </div>
   </xsl:template>

<xsl:template name="__style-for_caution.12predon175">
      <xsl:text> .x-caution-5-0 {margin-left: 0pt; margin-right: 0pt; text-indent: 0pt; margin-top: 8pt; font-weight: bold; margin-left: 98pt; text-indent: -63pt; }</xsl:text>
   </xsl:template>

<xsl:template match="procedure/caution" priority="7">
      <div>
         <!--Emit class values to reflect conditions-->
         <xsl:attribute name="class">
            <xsl:text> x-caution-5-0</xsl:text>
         </xsl:attribute>
         <xsl:if test="@xml:lang">
            <xsl:attribute name="lang">
               <xsl:call-template name="return-lang-applying-language-map">
                  <xsl:with-param name="doclang" select="@xml:lang"/>
               </xsl:call-template>
            </xsl:attribute>
         </xsl:if>
         <xsl:copy-of select="@ch:*"/>
         <xsl:copy-of xmlns:dmp="http://www.arbortext.com/namespace/dmp/dmpmap" select="@dmp:*"/>
         <xsl:if test="@xml:lang">
            <xsl:attribute name="lang">
               <xsl:call-template name="return-lang-applying-language-map">
                  <xsl:with-param name="doclang" select="@xml:lang"/>
               </xsl:call-template>
            </xsl:attribute>
         </xsl:if>
         <xsl:call-template name="maybe-set-id"/>
         <!--Process this element's content-->
         <xsl:apply-templates/>
      </div>
   </xsl:template>

<xsl:template name="__style-for_caution.12faccon136">
      <xsl:text> .x-caution-6-0 {margin-left: 0pt; margin-right: 0pt; text-indent: 0pt; }</xsl:text>
   </xsl:template>

<xsl:template match="fandc/caution" priority="6">
      <div>
         <!--Emit class values to reflect conditions-->
         <xsl:attribute name="class">
            <xsl:text> x-caution-6-0</xsl:text>
         </xsl:attribute>
         <xsl:if test="@xml:lang">
            <xsl:attribute name="lang">
               <xsl:call-template name="return-lang-applying-language-map">
                  <xsl:with-param name="doclang" select="@xml:lang"/>
               </xsl:call-template>
            </xsl:attribute>
         </xsl:if>
         <xsl:copy-of select="@ch:*"/>
         <xsl:copy-of xmlns:dmp="http://www.arbortext.com/namespace/dmp/dmpmap" select="@dmp:*"/>
         <xsl:if test="@xml:lang">
            <xsl:attribute name="lang">
               <xsl:call-template name="return-lang-applying-language-map">
                  <xsl:with-param name="doclang" select="@xml:lang"/>
               </xsl:call-template>
            </xsl:attribute>
         </xsl:if>
         <xsl:call-template name="maybe-set-id"/>
         <!--Process this element's content-->
         <xsl:apply-templates/>
      </div>
   </xsl:template>

<xsl:template name="__style-for_caution.12sp-aon187">
      <xsl:text> .x-caution-7-0 {margin-left: 0pt; margin-right: 0pt; text-indent: 0pt; }</xsl:text>
   </xsl:template>

<xsl:template match="spec-assem/caution" priority="5">
      <div>
         <!--Emit class values to reflect conditions-->
         <xsl:attribute name="class">
            <xsl:text> x-caution-7-0</xsl:text>
         </xsl:attribute>
         <xsl:if test="@xml:lang">
            <xsl:attribute name="lang">
               <xsl:call-template name="return-lang-applying-language-map">
                  <xsl:with-param name="doclang" select="@xml:lang"/>
               </xsl:call-template>
            </xsl:attribute>
         </xsl:if>
         <xsl:copy-of select="@ch:*"/>
         <xsl:copy-of xmlns:dmp="http://www.arbortext.com/namespace/dmp/dmpmap" select="@dmp:*"/>
         <xsl:if test="@xml:lang">
            <xsl:attribute name="lang">
               <xsl:call-template name="return-lang-applying-language-map">
                  <xsl:with-param name="doclang" select="@xml:lang"/>
               </xsl:call-template>
            </xsl:attribute>
         </xsl:if>
         <xsl:call-template name="maybe-set-id"/>
         <!--Process this element's content-->
         <xsl:apply-templates/>
      </div>
   </xsl:template>

<xsl:template name="__style-for_caution.12spngon238">
      <xsl:text> .x-caution-8-0 {margin-left: 0pt; margin-right: 0pt; text-indent: 0pt; }</xsl:text>
   </xsl:template>

<xsl:template match="spring-pressure/caution" priority="4">
      <div>
         <!--Emit class values to reflect conditions-->
         <xsl:attribute name="class">
            <xsl:text> x-caution-8-0</xsl:text>
         </xsl:attribute>
         <xsl:if test="@xml:lang">
            <xsl:attribute name="lang">
               <xsl:call-template name="return-lang-applying-language-map">
                  <xsl:with-param name="doclang" select="@xml:lang"/>
               </xsl:call-template>
            </xsl:attribute>
         </xsl:if>
         <xsl:copy-of select="@ch:*"/>
         <xsl:copy-of xmlns:dmp="http://www.arbortext.com/namespace/dmp/dmpmap" select="@dmp:*"/>
         <xsl:if test="@xml:lang">
            <xsl:attribute name="lang">
               <xsl:call-template name="return-lang-applying-language-map">
                  <xsl:with-param name="doclang" select="@xml:lang"/>
               </xsl:call-template>
            </xsl:attribute>
         </xsl:if>
         <xsl:call-template name="maybe-set-id"/>
         <!--Process this element's content-->
         <xsl:apply-templates/>
      </div>
   </xsl:template>

<xsl:template name="__style-for_caution.12toueon269">
      <xsl:text> .x-caution-9-0 {margin-left: 0pt; margin-right: 0pt; text-indent: 0pt; }</xsl:text>
   </xsl:template>

<xsl:template match="torque-and-stretch/caution" priority="3">
      <div>
         <!--Emit class values to reflect conditions-->
         <xsl:attribute name="class">
            <xsl:text> x-caution-9-0</xsl:text>
         </xsl:attribute>
         <xsl:if test="@xml:lang">
            <xsl:attribute name="lang">
               <xsl:call-template name="return-lang-applying-language-map">
                  <xsl:with-param name="doclang" select="@xml:lang"/>
               </xsl:call-template>
            </xsl:attribute>
         </xsl:if>
         <xsl:copy-of select="@ch:*"/>
         <xsl:copy-of xmlns:dmp="http://www.arbortext.com/namespace/dmp/dmpmap" select="@dmp:*"/>
         <xsl:if test="@xml:lang">
            <xsl:attribute name="lang">
               <xsl:call-template name="return-lang-applying-language-map">
                  <xsl:with-param name="doclang" select="@xml:lang"/>
               </xsl:call-template>
            </xsl:attribute>
         </xsl:if>
         <xsl:call-template name="maybe-set-id"/>
         <!--Process this element's content-->
         <xsl:apply-templates/>
      </div>
   </xsl:template>

<xsl:template name="__style-for_caution.12fi-aon2310">
      <xsl:text> .x-caution-10-0 {margin-left: 0pt; margin-right: 0pt; text-indent: 0pt; }</xsl:text>
   </xsl:template>

<xsl:template match="fits-and-clears/caution" priority="2">
      <div>
         <!--Emit class values to reflect conditions-->
         <xsl:attribute name="class">
            <xsl:text> x-caution-10-0</xsl:text>
         </xsl:attribute>
         <xsl:if test="@xml:lang">
            <xsl:attribute name="lang">
               <xsl:call-template name="return-lang-applying-language-map">
                  <xsl:with-param name="doclang" select="@xml:lang"/>
               </xsl:call-template>
            </xsl:attribute>
         </xsl:if>
         <xsl:copy-of select="@ch:*"/>
         <xsl:copy-of xmlns:dmp="http://www.arbortext.com/namespace/dmp/dmpmap" select="@dmp:*"/>
         <xsl:if test="@xml:lang">
            <xsl:attribute name="lang">
               <xsl:call-template name="return-lang-applying-language-map">
                  <xsl:with-param name="doclang" select="@xml:lang"/>
               </xsl:call-template>
            </xsl:attribute>
         </xsl:if>
         <xsl:call-template name="maybe-set-id"/>
         <!--Process this element's content-->
         <xsl:apply-templates/>
      </div>
   </xsl:template>

<xsl:template name="__style-for_caution.12caioon2411">
      <xsl:text> .x-caution-11-0 {margin-left: 0pt; margin-right: 0pt; text-indent: 0pt; margin-top: 8pt; font-weight: bold; margin-left: 80pt; text-indent: -62pt; }</xsl:text>
   </xsl:template>

<xsl:template match="caution[parent::subpara]" priority="1">
      <div>
         <!--Emit class values to reflect conditions-->
         <xsl:attribute name="class">
            <xsl:text> x-caution-11-0</xsl:text>
         </xsl:attribute>
         <xsl:if test="@xml:lang">
            <xsl:attribute name="lang">
               <xsl:call-template name="return-lang-applying-language-map">
                  <xsl:with-param name="doclang" select="@xml:lang"/>
               </xsl:call-template>
            </xsl:attribute>
         </xsl:if>
         <xsl:copy-of select="@ch:*"/>
         <xsl:copy-of xmlns:dmp="http://www.arbortext.com/namespace/dmp/dmpmap" select="@dmp:*"/>
         <xsl:if test="@xml:lang">
            <xsl:attribute name="lang">
               <xsl:call-template name="return-lang-applying-language-map">
                  <xsl:with-param name="doclang" select="@xml:lang"/>
               </xsl:call-template>
            </xsl:attribute>
         </xsl:if>
         <xsl:call-template name="maybe-set-id"/>
         <!--Process this element's content-->
         <xsl:apply-templates/>
      </div>
   </xsl:template>

<xsl:template name="__style-for_caution.12caioon712">
      <xsl:text> .x-caution-12-0 {margin-left: 0pt; margin-right: 0pt; text-indent: 0pt; margin-top: 8pt; font-weight: bold; margin-left: 64pt; text-indent: -63pt; margin-top: 10pt; }</xsl:text>
   </xsl:template>

<xsl:template match="caution" priority="0">
      <div>
         <!--Emit class values to reflect conditions-->
         <xsl:attribute name="class">
            <xsl:text> x-caution-12-0</xsl:text>
         </xsl:attribute>
         <xsl:if test="@xml:lang">
            <xsl:attribute name="lang">
               <xsl:call-template name="return-lang-applying-language-map">
                  <xsl:with-param name="doclang" select="@xml:lang"/>
               </xsl:call-template>
            </xsl:attribute>
         </xsl:if>
         <xsl:copy-of select="@ch:*"/>
         <xsl:copy-of xmlns:dmp="http://www.arbortext.com/namespace/dmp/dmpmap" select="@dmp:*"/>
         <xsl:if test="@xml:lang">
            <xsl:attribute name="lang">
               <xsl:call-template name="return-lang-applying-language-map">
                  <xsl:with-param name="doclang" select="@xml:lang"/>
               </xsl:call-template>
            </xsl:attribute>
         </xsl:if>
         <xsl:call-template name="maybe-set-id"/>
         <!--Process this element's content-->
         <xsl:apply-templates/>
      </div>
   </xsl:template>

<xsl:template name="__style-for__ufe-center.1">
      <xsl:text> .x--ufe-center-1-0 {margin-left: 0pt; margin-right: 0pt; text-indent: 0pt; text-align: center; }</xsl:text>
   </xsl:template>

<xsl:template match="_ufe:center" priority="0">
      <div>
         <!--Emit class values to reflect conditions-->
         <xsl:attribute name="class">
            <xsl:text> x--ufe-center-1-0</xsl:text>
         </xsl:attribute>
         <xsl:if test="@xml:lang">
            <xsl:attribute name="lang">
               <xsl:call-template name="return-lang-applying-language-map">
                  <xsl:with-param name="doclang" select="@xml:lang"/>
               </xsl:call-template>
            </xsl:attribute>
         </xsl:if>
         <xsl:copy-of select="@ch:*"/>
         <xsl:copy-of xmlns:dmp="http://www.arbortext.com/namespace/dmp/dmpmap" select="@dmp:*"/>
         <xsl:if test="@xml:lang">
            <xsl:attribute name="lang">
               <xsl:call-template name="return-lang-applying-language-map">
                  <xsl:with-param name="doclang" select="@xml:lang"/>
               </xsl:call-template>
            </xsl:attribute>
         </xsl:if>
         <xsl:call-template name="maybe-set-id"/>
         <!--Process this element's content-->
         <xsl:apply-templates/>
      </div>
   </xsl:template>

<xsl:template name="__style-for_ch-se-su.1">
      <xsl:text> .x-ch-se-su-1-0 {margin-left: 0pt; margin-right: 0pt; }</xsl:text>
   </xsl:template>

<xsl:template match="ch-se-su" priority="0">
      <!--Emit a nostyle template-->
      <xsl:apply-templates/>
   </xsl:template>

<xsl:template name="__style-for_change.1">
      <xsl:text> .x-change-1-0 {margin-left: 0pt; margin-right: 0pt; }</xsl:text>
   </xsl:template>

<xsl:template match="change" priority="0">
      <!--Emit a nostyle template-->
      <xsl:apply-templates/>
   </xsl:template>

<xsl:template name="__style-for_changebar.1">
      <xsl:text> .x-changebar-1-0
{margin-left: 0pt; margin-right: 0pt; text-indent: 0pt; border-left:
2pt solid black; padding-left: 8pt; }</xsl:text>
   </xsl:template>

<xsl:template match="changebar" priority="0">
      <div xmlns:dmp="http://www.arbortext.com/namespace/dmp/dmpmap">
         <!--Emit class values to reflect conditions-->
         <xsl:attribute name="class">
            <xsl:text> x-changebar-1-0</xsl:text>
         </xsl:attribute>
         <xsl:copy-of select="@ch:*"/>
         <xsl:copy-of select="@dmp:*"/>
         <xsl:call-template name="maybe-set-id"/>
         <!--Process this element's content-->
         <xsl:apply-templates> </xsl:apply-templates>
      </div>
   </xsl:template>

<xsl:template name="__style-for_chapsect.1">
      <xsl:text> .x-chapsect-1-0 {margin-left: 0pt; margin-right: 0pt; }</xsl:text>
   </xsl:template>

<xsl:template match="chapsect" priority="0">
      <!--Emit a nostyle template-->
      <xsl:apply-templates/>
   </xsl:template>

<xsl:template match="chapsect-list//chapsect-item/chapsect" priority="101">
      <dt>
         <!--Emit class values to reflect conditions-->
         <xsl:attribute name="class">
            <xsl:if test="name(..)='chapsect-item' or name(..)='chapsect-title' or name(..)='glosdata'">
               <xsl:text/>
               <xsl:text>x-</xsl:text>
               <xsl:value-of select="string(translate(name(..),':._','---'))"/>
               <xsl:text>-1-0</xsl:text>
            </xsl:if>
            <xsl:text> x-chapsect-1-0</xsl:text>
         </xsl:attribute>
         <xsl:if test="@xml:lang">
            <xsl:attribute name="lang">
               <xsl:call-template name="return-lang-applying-language-map">
                  <xsl:with-param name="doclang" select="@xml:lang"/>
               </xsl:call-template>
            </xsl:attribute>
         </xsl:if>
         <xsl:copy-of select="@ch:*"/>
         <xsl:copy-of xmlns:dmp="http://www.arbortext.com/namespace/dmp/dmpmap" select="@dmp:*"/>
         <xsl:if test="@xml:lang">
            <xsl:attribute name="lang">
               <xsl:call-template name="return-lang-applying-language-map">
                  <xsl:with-param name="doclang" select="@xml:lang"/>
               </xsl:call-template>
            </xsl:attribute>
         </xsl:if>
         <xsl:call-template name="maybe-set-id"/>
         <!--Process this element's content-->
         <xsl:apply-templates/>
      </dt>
   </xsl:template>

<xsl:template name="__style-for_chapsect-item.1">
      <xsl:text> .x-chapsect-item-1-0 {margin-left: 0pt; margin-right: 0pt; text-indent: 0pt; margin-top: 6pt; margin-bottom: 6pt; }</xsl:text>
   </xsl:template>

<xsl:template match="chapsect-item" priority="0">
      <xsl:variable name="foClass">definitionListItem</xsl:variable>
      <xsl:variable name="blockness">block</xsl:variable>
      <xsl:variable name="startnew"/>
      <xsl:variable name="newpageset">#noChange</xsl:variable>
      <xsl:apply-templates/>
   </xsl:template>

<xsl:template name="__style-for_chapsect-list.1">
      <xsl:text> .x-chapsect-list-1-0 {margin-left: 0pt; margin-right: 0pt; text-indent: 0pt; margin-top: 8pt; }</xsl:text>
   </xsl:template>

<xsl:template match="chapsect-list" priority="0">
      <div>
         <xsl:if test="@xml:lang">
            <xsl:attribute name="lang">
               <xsl:call-template name="return-lang-applying-language-map">
                  <xsl:with-param name="doclang" select="@xml:lang"/>
               </xsl:call-template>
            </xsl:attribute>
         </xsl:if>
         <xsl:copy-of select="@ch:*"/>
         <xsl:copy-of xmlns:dmp="http://www.arbortext.com/namespace/dmp/dmpmap" select="@dmp:*"/>
         <xsl:if test="@xml:lang">
            <xsl:attribute name="lang">
               <xsl:call-template name="return-lang-applying-language-map">
                  <xsl:with-param name="doclang" select="@xml:lang"/>
               </xsl:call-template>
            </xsl:attribute>
         </xsl:if>
         <xsl:apply-templates select="_sfe:BeforeOrAfterText[not(preceding-sibling::*)]"/>
         <xsl:apply-templates select="_ufe:chapsect-title|_ufe:cir-title|_ufe:consumables-title|_ufe:eipc-title|_ufe:em-title|_ufe:fixequ-title|_ufe:general-title|_ufe:glossary-title|_ufe:howtouse-title|_ufe:intro-title|manual-title|_ufe:num-index-title|_ufe:nut-option-title|_ufe:pdlist-title|pwc-title|_ufe:sblist-title|_ufe:spblist-title|_ufe:spectools-title|_ufe:supplier-list-title|_ufe:task-title|_ufe:temp-rev-title|title|_ufe:tmm-title"/>
         <dl>
            <!--Emit class values to reflect conditions-->
            <xsl:attribute name="class">
               <xsl:text> x-chapsect-list-1-0</xsl:text>
            </xsl:attribute>
            <xsl:call-template name="maybe-set-id"/>
            <!--Process this element's content-->
            <xsl:apply-templates select="chapsect-item|chapsect"/>
         </dl>
         <xsl:apply-templates select="*[not(self::_sfe:BeforeOrAfterText|self::_ufe:chapsect-title|self::_ufe:cir-title|self::_ufe:consumables-title|self::_ufe:eipc-title|self::_ufe:em-title|self::_ufe:fixequ-title|self::_ufe:general-title|self::_ufe:glossary-title|self::_ufe:howtouse-title|self::_ufe:intro-title|self::manual-title|self::_ufe:num-index-title|self::_ufe:nut-option-title|self::_ufe:pdlist-title|self::pwc-title|self::_ufe:sblist-title|self::_ufe:spblist-title|self::_ufe:spectools-title|self::_ufe:supplier-list-title|self::_ufe:task-title|self::_ufe:temp-rev-title|self::title|self::_ufe:tmm-title|self::chapsect-item|self::chapsect|self::chapsect-title)]"/>
         <xsl:apply-templates select="_sfe:BeforeOrAfterText[not(following-sibling::*)][preceding-sibling::*]"/>
      </div>
   </xsl:template>

<xsl:template name="__style-for_chapsect-title.1">
      <xsl:text> .x-chapsect-title-1-0 {margin-left: 0pt; margin-right: 0pt; text-indent: 0pt; margin-top: 6pt; margin-bottom: 6pt; }</xsl:text>
   </xsl:template>

<xsl:template match="chapsect-title" priority="0">
      <xsl:variable name="foClass">definitionListItem</xsl:variable>
      <xsl:variable name="blockness">block</xsl:variable>
      <xsl:variable name="startnew"/>
      <xsl:variable name="newpageset">#noChange</xsl:variable>
      <xsl:apply-templates/>
   </xsl:template>

<xsl:template match="chapsect-list//chapsect-item/chapsect-title" priority="100">
      <dd>
         <!--Emit class values to reflect conditions-->
         <xsl:attribute name="class">
            <xsl:if test="name(..)='chapsect-item' or name(..)='chapsect-title' or name(..)='glosdata'">
               <xsl:text/>
               <xsl:text>x-</xsl:text>
               <xsl:value-of select="string(translate(name(..),':._','---'))"/>
               <xsl:text>-1-0</xsl:text>
            </xsl:if>
            <xsl:text> x-chapsect-title-1-0</xsl:text>
         </xsl:attribute>
         <xsl:if test="@xml:lang">
            <xsl:attribute name="lang">
               <xsl:call-template name="return-lang-applying-language-map">
                  <xsl:with-param name="doclang" select="@xml:lang"/>
               </xsl:call-template>
            </xsl:attribute>
         </xsl:if>
         <xsl:copy-of select="@ch:*"/>
         <xsl:copy-of xmlns:dmp="http://www.arbortext.com/namespace/dmp/dmpmap" select="@dmp:*"/>
         <xsl:if test="@xml:lang">
            <xsl:attribute name="lang">
               <xsl:call-template name="return-lang-applying-language-map">
                  <xsl:with-param name="doclang" select="@xml:lang"/>
               </xsl:call-template>
            </xsl:attribute>
         </xsl:if>
         <xsl:call-template name="maybe-set-id"/>
         <!--Process this element's content-->
         <xsl:apply-templates/>
      </dd>
   </xsl:template>

<xsl:template match="pgblk/_ufe:chapsect-title" priority="2">
  <div ch:title="notoc" class=" x--ufe-chapsect-title-1-0">
    <xsl:call-template name="t-base-div-title"/>
  </div>
</xsl:template>

<xsl:template match="pbfmatr/_ufe:chapsect-title" priority="1">
  <div ch:title="notoc" class=" x--ufe-chapsect-title-2-0">
    <xsl:call-template name="t-base-div-title"/>
  </div>
</xsl:template>

<xsl:template match="_ufe:chapsect-title" priority="0">
  <div ch:title="toc" class=" x--ufe-chapsect-title-3-0">
    <xsl:call-template name="t-base-div-title"/>
  </div>
</xsl:template>

<xsl:template match="chapter" priority="0">
  <div class=" x-chapter-1-0">
    <xsl:call-template name="t-base-div-chunk"/>
    <xsl:apply-templates/>
  </div>
</xsl:template>

<xsl:template match="chapter-front" priority="0">
  <xsl:apply-templates/>
</xsl:template>

<xsl:template match="chgdesc" priority="0">
      <xsl:param name="hidden" select="'yes'"/>
      <xsl:if test="$hidden='no'">
         <span>
            <!--Emit class values to reflect conditions-->
            <xsl:attribute name="class">
               <xsl:text> x-chgdesc-1-0</xsl:text>
            </xsl:attribute>
            <xsl:if test="@xml:lang">
               <xsl:attribute name="lang">
                  <xsl:call-template name="return-lang-applying-language-map">
                     <xsl:with-param name="doclang" select="@xml:lang"/>
                  </xsl:call-template>
               </xsl:attribute>
            </xsl:if>
            <xsl:copy-of select="@ch:*"/>
            <xsl:copy-of xmlns:dmp="http://www.arbortext.com/namespace/dmp/dmpmap" select="@dmp:*"/>
            <xsl:if test="@xml:lang">
               <xsl:attribute name="lang">
                  <xsl:call-template name="return-lang-applying-language-map">
                     <xsl:with-param name="doclang" select="@xml:lang"/>
                  </xsl:call-template>
               </xsl:attribute>
            </xsl:if>
            <xsl:call-template name="maybe-set-id"/>
            <!--Suppress element contents (but not gentext) unless unhidden-->
            <xsl:choose>
               <xsl:when test="$hidden='no'">
                  <xsl:apply-templates/>
               </xsl:when>
               <xsl:otherwise>
                  <xsl:apply-templates select="_sfe:BeforeOrAfterText"/>
               </xsl:otherwise>
            </xsl:choose>
         </span>
      </xsl:if>
   </xsl:template>

<xsl:template match="pgblk/_ufe:cir-title" priority="2">
  <div ch:title="notoc" class=" x--ufe-cir-title-1-0">
    <xsl:call-template name="t-base-div-title"/>
  </div>
</xsl:template>

<xsl:template match="pbfmatr/_ufe:cir-title" priority="1">
  <div ch:title="notoc" class=" x--ufe-cir-title-2-0">
    <xsl:call-template name="t-base-div-title"/>
  </div>
</xsl:template>

<xsl:template name="__style-for_city.1">
      <xsl:text> .x-city-1-0 {margin-left: 0pt; margin-right: 0pt; } .x-city-1-1 {}</xsl:text>
   </xsl:template>

<xsl:template match="city" priority="0">
      <xsl:variable name="foClass">inline</xsl:variable>
      <xsl:variable name="blockness">inline</xsl:variable>
      <span>
         <!--Emit class values to reflect conditions-->
         <xsl:attribute name="class">
            <xsl:text> x-city-1-0</xsl:text>
            <xsl:if test="not(./*[not(self::_sfe:BeforeOrAfterText)]|./text()[normalize-space(.)!=''])"> x-city-1-1</xsl:if>
         </xsl:attribute>
         <xsl:if test="@xml:lang">
            <xsl:attribute name="lang">
               <xsl:call-template name="return-lang-applying-language-map">
                  <xsl:with-param name="doclang" select="@xml:lang"/>
               </xsl:call-template>
            </xsl:attribute>
         </xsl:if>
         <xsl:copy-of select="@ch:*"/>
         <xsl:copy-of xmlns:dmp="http://www.arbortext.com/namespace/dmp/dmpmap" select="@dmp:*"/>
         <xsl:variable name="Breaks-chunkFilenameXPath"/>
         <xsl:variable name="Breaks-persistentFilename"/>
         <xsl:if test="($Breaks-persistentFilename='yes') and ($Breaks-chunkFilenameXPath!='')">
            <xsl:variable name="chunkFilename"/>
            <xsl:if test="$chunkFilename!=''">
               <xsl:attribute name="ch:filename">
                  <xsl:value-of select="$chunkFilename"/>
               </xsl:attribute>
               <xsl:attribute name="ch:namepriority">0</xsl:attribute>
            </xsl:if>
         </xsl:if>
         <xsl:if test="@xml:lang">
            <xsl:attribute name="lang">
               <xsl:call-template name="return-lang-applying-language-map">
                  <xsl:with-param name="doclang" select="@xml:lang"/>
               </xsl:call-template>
            </xsl:attribute>
         </xsl:if>
         <xsl:call-template name="maybe-set-id"/>
         <!--Process this element's content-->
         <xsl:apply-templates/>
      </span>
   </xsl:template>

<xsl:template name="__style-for_co-name.1">
      <xsl:text> .x-co-name-1-0 {margin-left: 0pt; margin-right: 0pt; text-indent: 0pt; }</xsl:text>
   </xsl:template>

<xsl:template match="co-name" priority="0">
      <div>
         <!--Emit class values to reflect conditions-->
         <xsl:attribute name="class">
            <xsl:text> x-co-name-1-0</xsl:text>
         </xsl:attribute>
         <xsl:if test="@xml:lang">
            <xsl:attribute name="lang">
               <xsl:call-template name="return-lang-applying-language-map">
                  <xsl:with-param name="doclang" select="@xml:lang"/>
               </xsl:call-template>
            </xsl:attribute>
         </xsl:if>
         <xsl:copy-of select="@ch:*"/>
         <xsl:copy-of xmlns:dmp="http://www.arbortext.com/namespace/dmp/dmpmap" select="@dmp:*"/>
         <xsl:if test="@xml:lang">
            <xsl:attribute name="lang">
               <xsl:call-template name="return-lang-applying-language-map">
                  <xsl:with-param name="doclang" select="@xml:lang"/>
               </xsl:call-template>
            </xsl:attribute>
         </xsl:if>
         <xsl:call-template name="maybe-set-id"/>
         <!--Process this element's content-->
         <xsl:apply-templates/>
      </div>
   </xsl:template>

<xsl:template name="__style-for_comment.1">
      <xsl:text> .x-comment-1-0 {margin-left: 0pt; margin-right: 0pt; }</xsl:text>
   </xsl:template>

<xsl:template match="comment" priority="0">
      <!--Emit a nostyle template-->
      <xsl:apply-templates/>
   </xsl:template>

<xsl:template name="__style-for_consumable.1">
      <xsl:text> .x-consumable-1-0 {margin-left: 0pt; margin-right: 0pt; color: #000080; text-decoration: underline ; }</xsl:text>
   </xsl:template>

<xsl:template match="consumable" priority="0">
      <a>
         <!--Emit class values to reflect conditions-->
         <xsl:attribute name="class">
            <xsl:text> x-consumable-1-0</xsl:text>
         </xsl:attribute>
         <xsl:choose>
            <xsl:when xmlns:ati3d="http://www.arbortext.com/namespace/graphics" test="@ati3d:viewer and @id">
               <!--this is a link to a 3D graphic-->
               <xsl:variable name="annotation" select="@ati3d:view"/>
               <xsl:variable name="idrefvalue" select="@id"/>
               <xsl:variable name="viewer" select="@ati3d:viewer"/>
               <xsl:attribute name="href">
                  <xsl:text>#</xsl:text>
                  <xsl:value-of select="$idrefvalue"/>
               </xsl:attribute>
               <xsl:attribute name="onclick">
                  <xsl:value-of select="$viewer"/>
                  <xsl:text>_Link('</xsl:text>
                  <xsl:value-of select="$idrefvalue"/>
                  <xsl:text>','</xsl:text>
                  <xsl:value-of select="@ati3d:linkdata"/>
                  <xsl:text>')</xsl:text>
               </xsl:attribute>
            </xsl:when>
            <xsl:otherwise>
               <!--this is a "regular" link-->
               <xsl:if test="@id">
                  <xsl:attribute name="href">
                     <xsl:value-of select="concat('#',@id)"/>
                  </xsl:attribute>
               </xsl:if>
            </xsl:otherwise>
         </xsl:choose>
         <xsl:if test="@xml:lang">
            <xsl:attribute name="lang">
               <xsl:call-template name="return-lang-applying-language-map">
                  <xsl:with-param name="doclang" select="@xml:lang"/>
               </xsl:call-template>
            </xsl:attribute>
         </xsl:if>
         <xsl:copy-of select="@ch:*"/>
         <xsl:copy-of xmlns:dmp="http://www.arbortext.com/namespace/dmp/dmpmap" select="@dmp:*"/>
         <xsl:if test="@xml:lang">
            <xsl:attribute name="lang">
               <xsl:call-template name="return-lang-applying-language-map">
                  <xsl:with-param name="doclang" select="@xml:lang"/>
               </xsl:call-template>
            </xsl:attribute>
         </xsl:if>
         <xsl:call-template name="maybe-set-id"/>
         <!--Process this element's content-->
         <xsl:apply-templates/>
      </a>
   </xsl:template>

<xsl:template match="pgblk/_ufe:consumables-title" priority="5">
  <div ch:title="notoc" class=" x--ufe-consumables-title-1-0">
    <xsl:call-template name="t-base-div-title"/>
  </div>
</xsl:template>

<xsl:template match="pbfmatr/_ufe:consumables-title" priority="4">
  <div ch:title="notoc" class=" x--ufe-consumables-title-2-0">
    <xsl:call-template name="t-base-div-title"/>
  </div>
</xsl:template>

<xsl:template match="pwcspblist/_ufe:consumables-title" priority="3">
  <div ch:title="notoc" class=" x--ufe-consumables-title-3-0">
    <xsl:call-template name="t-base-div-title"/>
  </div>
</xsl:template>

<xsl:template match="ata-page-block//consumables//_ufe:consumables-title" priority="2">
  <div ch:title="toc" class=" x--ufe-consumables-title-4-0">
    <xsl:call-template name="t-base-div-title"/>
  </div>
</xsl:template>

<xsl:template match="page-block//consumables//_ufe:consumables-title" priority="1">
  <div ch:title="toc" class=" x--ufe-consumables-title-5-0">
    <xsl:call-template name="t-base-div-title"/>
  </div>
</xsl:template>

<xsl:template match="_ufe:consumables-title" priority="0">
  <div ch:title="notoc" class=" x--ufe-consumables-title-6-0">
    <xsl:call-template name="t-base-div-title"/>
  </div>
</xsl:template>

<xsl:template name="__style-for_consume-list.1">
      <xsl:text> .x-consume-list-1-0 {margin-left: 0pt; margin-right: 0pt; text-indent: 0pt; }</xsl:text>
   </xsl:template>

<xsl:template match="consume-list" priority="0">
      <div>
         <!--Emit class values to reflect conditions-->
         <xsl:attribute name="class">
            <xsl:text> x-consume-list-1-0</xsl:text>
         </xsl:attribute>
         <xsl:if test="@xml:lang">
            <xsl:attribute name="lang">
               <xsl:call-template name="return-lang-applying-language-map">
                  <xsl:with-param name="doclang" select="@xml:lang"/>
               </xsl:call-template>
            </xsl:attribute>
         </xsl:if>
         <xsl:copy-of select="@ch:*"/>
         <xsl:copy-of xmlns:dmp="http://www.arbortext.com/namespace/dmp/dmpmap" select="@dmp:*"/>
         <xsl:if test="@xml:lang">
            <xsl:attribute name="lang">
               <xsl:call-template name="return-lang-applying-language-map">
                  <xsl:with-param name="doclang" select="@xml:lang"/>
               </xsl:call-template>
            </xsl:attribute>
         </xsl:if>
         <xsl:call-template name="maybe-set-id"/>
         <!--Process this element's content-->
         <xsl:apply-templates/>
      </div>
   </xsl:template>

<xsl:template name="__style-for_country.1">
      <xsl:text> .x-country-1-0 {margin-left: 0pt; margin-right: 0pt; text-indent: 0pt; }</xsl:text>
   </xsl:template>

<xsl:template match="country" priority="0">
      <div>
         <!--Emit class values to reflect conditions-->
         <xsl:attribute name="class">
            <xsl:text> x-country-1-0</xsl:text>
         </xsl:attribute>
         <xsl:if test="@xml:lang">
            <xsl:attribute name="lang">
               <xsl:call-template name="return-lang-applying-language-map">
                  <xsl:with-param name="doclang" select="@xml:lang"/>
               </xsl:call-template>
            </xsl:attribute>
         </xsl:if>
         <xsl:copy-of select="@ch:*"/>
         <xsl:copy-of xmlns:dmp="http://www.arbortext.com/namespace/dmp/dmpmap" select="@dmp:*"/>
         <xsl:if test="@xml:lang">
            <xsl:attribute name="lang">
               <xsl:call-template name="return-lang-applying-language-map">
                  <xsl:with-param name="doclang" select="@xml:lang"/>
               </xsl:call-template>
            </xsl:attribute>
         </xsl:if>
         <xsl:call-template name="maybe-set-id"/>
         <!--Process this element's content-->
         <xsl:apply-templates/>
      </div>
   </xsl:template>

<xsl:template name="__style-for_csu.1">
      <xsl:text> .x-csu-1-0 {margin-left: 0pt; margin-right: 0pt; text-indent: 0pt; }</xsl:text>
   </xsl:template>

<xsl:template match="csu" priority="0">
      <div>
         <!--Emit class values to reflect conditions-->
         <xsl:attribute name="class">
            <xsl:text> x-csu-1-0</xsl:text>
         </xsl:attribute>
         <xsl:if test="@xml:lang">
            <xsl:attribute name="lang">
               <xsl:call-template name="return-lang-applying-language-map">
                  <xsl:with-param name="doclang" select="@xml:lang"/>
               </xsl:call-template>
            </xsl:attribute>
         </xsl:if>
         <xsl:copy-of select="@ch:*"/>
         <xsl:copy-of xmlns:dmp="http://www.arbortext.com/namespace/dmp/dmpmap" select="@dmp:*"/>
         <xsl:if test="@xml:lang">
            <xsl:attribute name="lang">
               <xsl:call-template name="return-lang-applying-language-map">
                  <xsl:with-param name="doclang" select="@xml:lang"/>
               </xsl:call-template>
            </xsl:attribute>
         </xsl:if>
         <xsl:call-template name="maybe-set-id"/>
         <!--Process this element's content-->
         <xsl:apply-templates/>
      </div>
   </xsl:template>

<xsl:template name="__style-for_csu-instance.1">
      <xsl:text> .x-csu-instance-1-0 {margin-left: 0pt; margin-right: 0pt; }</xsl:text>
   </xsl:template>

<xsl:template match="csu-instance" priority="0">
      <!--Emit a nostyle template-->
      <xsl:apply-templates/>
   </xsl:template>

<xsl:template name="__style-for_dash.1">
      <xsl:text> .x-dash-1-0 {margin-left: 0pt; margin-right: 0pt; }</xsl:text>
   </xsl:template>

<xsl:template match="dash" priority="0">
      <span>
         <!--Emit class values to reflect conditions-->
         <xsl:attribute name="class">
            <xsl:text> x-dash-1-0</xsl:text>
         </xsl:attribute>
         <xsl:if test="@xml:lang">
            <xsl:attribute name="lang">
               <xsl:call-template name="return-lang-applying-language-map">
                  <xsl:with-param name="doclang" select="@xml:lang"/>
               </xsl:call-template>
            </xsl:attribute>
         </xsl:if>
         <xsl:copy-of select="@ch:*"/>
         <xsl:copy-of xmlns:dmp="http://www.arbortext.com/namespace/dmp/dmpmap" select="@dmp:*"/>
         <xsl:if test="@xml:lang">
            <xsl:attribute name="lang">
               <xsl:call-template name="return-lang-applying-language-map">
                  <xsl:with-param name="doclang" select="@xml:lang"/>
               </xsl:call-template>
            </xsl:attribute>
         </xsl:if>
         <xsl:call-template name="maybe-set-id"/>
         <!--Process this element's content-->
         <xsl:apply-templates/>
      </span>
   </xsl:template>

<xsl:template name="__style-for_def.3keefef71">
      <xsl:text> .x-def-1-0 {margin-left: 0pt; margin-right: 0pt; }</xsl:text>
   </xsl:template>

<xsl:template match="key/def" priority="2">
      <span>
         <!--Emit class values to reflect conditions-->
         <xsl:attribute name="class">
            <xsl:text> x-def-1-0</xsl:text>
         </xsl:attribute>
         <xsl:if test="@xml:lang">
            <xsl:attribute name="lang">
               <xsl:call-template name="return-lang-applying-language-map">
                  <xsl:with-param name="doclang" select="@xml:lang"/>
               </xsl:call-template>
            </xsl:attribute>
         </xsl:if>
         <xsl:copy-of select="@ch:*"/>
         <xsl:copy-of xmlns:dmp="http://www.arbortext.com/namespace/dmp/dmpmap" select="@dmp:*"/>
         <xsl:if test="@xml:lang">
            <xsl:attribute name="lang">
               <xsl:call-template name="return-lang-applying-language-map">
                  <xsl:with-param name="doclang" select="@xml:lang"/>
               </xsl:call-template>
            </xsl:attribute>
         </xsl:if>
         <xsl:call-template name="maybe-set-id"/>
         <!--Process this element's content-->
         <xsl:apply-templates/>
      </span>
   </xsl:template>

<xsl:template name="__style-for_def.3deisef112">
      <xsl:text> .x-def-2-0 {margin-left: 0pt; margin-right: 0pt; }</xsl:text>
   </xsl:template>

<xsl:template match="deflist/def" priority="1">
      <span>
         <!--Emit class values to reflect conditions-->
         <xsl:attribute name="class">
            <xsl:text> x-def-2-0</xsl:text>
         </xsl:attribute>
         <xsl:if test="@xml:lang">
            <xsl:attribute name="lang">
               <xsl:call-template name="return-lang-applying-language-map">
                  <xsl:with-param name="doclang" select="@xml:lang"/>
               </xsl:call-template>
            </xsl:attribute>
         </xsl:if>
         <xsl:copy-of select="@ch:*"/>
         <xsl:copy-of xmlns:dmp="http://www.arbortext.com/namespace/dmp/dmpmap" select="@dmp:*"/>
         <xsl:if test="@xml:lang">
            <xsl:attribute name="lang">
               <xsl:call-template name="return-lang-applying-language-map">
                  <xsl:with-param name="doclang" select="@xml:lang"/>
               </xsl:call-template>
            </xsl:attribute>
         </xsl:if>
         <xsl:call-template name="maybe-set-id"/>
         <!--Process this element's content-->
         <xsl:apply-templates/>
      </span>
   </xsl:template>

<xsl:template name="__style-for_def.3deef33">
      <xsl:text> .x-def-3-0 {margin-left: 0pt; margin-right: 0pt; }</xsl:text>
   </xsl:template>

<xsl:template match="def" priority="0">
      <span>
         <!--Emit class values to reflect conditions-->
         <xsl:attribute name="class">
            <xsl:text> x-def-3-0</xsl:text>
         </xsl:attribute>
         <xsl:if test="@xml:lang">
            <xsl:attribute name="lang">
               <xsl:call-template name="return-lang-applying-language-map">
                  <xsl:with-param name="doclang" select="@xml:lang"/>
               </xsl:call-template>
            </xsl:attribute>
         </xsl:if>
         <xsl:copy-of select="@ch:*"/>
         <xsl:copy-of xmlns:dmp="http://www.arbortext.com/namespace/dmp/dmpmap" select="@dmp:*"/>
         <xsl:if test="@xml:lang">
            <xsl:attribute name="lang">
               <xsl:call-template name="return-lang-applying-language-map">
                  <xsl:with-param name="doclang" select="@xml:lang"/>
               </xsl:call-template>
            </xsl:attribute>
         </xsl:if>
         <xsl:call-template name="maybe-set-id"/>
         <!--Process this element's content-->
         <xsl:apply-templates/>
      </span>
   </xsl:template>

<xsl:template name="__style-for_deflist.2stdest121">
      <xsl:text> .x-deflist-1-0 {margin-left: 0pt; margin-right: 0pt; text-indent: 0pt; margin-left: 29pt; text-indent: 0pt; }</xsl:text>
   </xsl:template>

<xsl:template match="step/deflist" priority="1">
      <div>
         <!--Emit class values to reflect conditions-->
         <xsl:attribute name="class">
            <xsl:text> x-deflist-1-0</xsl:text>
         </xsl:attribute>
         <xsl:if test="@xml:lang">
            <xsl:attribute name="lang">
               <xsl:call-template name="return-lang-applying-language-map">
                  <xsl:with-param name="doclang" select="@xml:lang"/>
               </xsl:call-template>
            </xsl:attribute>
         </xsl:if>
         <xsl:copy-of select="@ch:*"/>
         <xsl:copy-of xmlns:dmp="http://www.arbortext.com/namespace/dmp/dmpmap" select="@dmp:*"/>
         <xsl:if test="@xml:lang">
            <xsl:attribute name="lang">
               <xsl:call-template name="return-lang-applying-language-map">
                  <xsl:with-param name="doclang" select="@xml:lang"/>
               </xsl:call-template>
            </xsl:attribute>
         </xsl:if>
         <xsl:call-template name="maybe-set-id"/>
         <!--Process this element's content-->
         <xsl:apply-templates/>
      </div>
   </xsl:template>

<xsl:template name="__style-for_deflist.2deisst72">
      <xsl:text> .x-deflist-2-0 {margin-left: 0pt; margin-right: 0pt; text-indent: 0pt; margin-top: 8pt; font-size: 9pt; }</xsl:text>
   </xsl:template>

<xsl:template match="deflist" priority="0">
      <div>
         <!--Emit class values to reflect conditions-->
         <xsl:attribute name="class">
            <xsl:text> x-deflist-2-0</xsl:text>
         </xsl:attribute>
         <xsl:if test="@xml:lang">
            <xsl:attribute name="lang">
               <xsl:call-template name="return-lang-applying-language-map">
                  <xsl:with-param name="doclang" select="@xml:lang"/>
               </xsl:call-template>
            </xsl:attribute>
         </xsl:if>
         <xsl:copy-of select="@ch:*"/>
         <xsl:copy-of xmlns:dmp="http://www.arbortext.com/namespace/dmp/dmpmap" select="@dmp:*"/>
         <xsl:if test="@xml:lang">
            <xsl:attribute name="lang">
               <xsl:call-template name="return-lang-applying-language-map">
                  <xsl:with-param name="doclang" select="@xml:lang"/>
               </xsl:call-template>
            </xsl:attribute>
         </xsl:if>
         <xsl:call-template name="maybe-set-id"/>
         <!--Process this element's content-->
         <xsl:apply-templates/>
      </div>
   </xsl:template>

<xsl:template name="__style-for_delete.1">
      <xsl:text> .x-delete-1-0 {margin-left: 0pt; margin-right: 0pt; }</xsl:text>
   </xsl:template>

<xsl:template match="delete" priority="0">
      <!--Emit a nostyle template-->
      <xsl:apply-templates/>
   </xsl:template>

<xsl:template name="__style-for_deleted.1">
      <xsl:text> .x-deleted-1-0 {margin-left: 0pt; margin-right: 0pt; text-indent: 0pt; }</xsl:text>
   </xsl:template>

<xsl:template match="deleted" priority="0">
      <div>
         <!--Emit class values to reflect conditions-->
         <xsl:attribute name="class">
            <xsl:text> x-deleted-1-0</xsl:text>
         </xsl:attribute>
         <xsl:if test="@xml:lang">
            <xsl:attribute name="lang">
               <xsl:call-template name="return-lang-applying-language-map">
                  <xsl:with-param name="doclang" select="@xml:lang"/>
               </xsl:call-template>
            </xsl:attribute>
         </xsl:if>
         <xsl:copy-of select="@ch:*"/>
         <xsl:copy-of xmlns:dmp="http://www.arbortext.com/namespace/dmp/dmpmap" select="@dmp:*"/>
         <xsl:if test="@xml:lang">
            <xsl:attribute name="lang">
               <xsl:call-template name="return-lang-applying-language-map">
                  <xsl:with-param name="doclang" select="@xml:lang"/>
               </xsl:call-template>
            </xsl:attribute>
         </xsl:if>
         <xsl:call-template name="maybe-set-id"/>
         <!--Process this element's content-->
         <xsl:apply-templates/>
      </div>
   </xsl:template>

<xsl:template name="__style-for_denom.1">
      <xsl:text> .x-denom-1-0 {margin-left: 0pt; margin-right: 0pt; text-indent: 0pt; text-align: center; }</xsl:text>
   </xsl:template>

<xsl:template match="denom" priority="0">
      <div>
         <!--Emit class values to reflect conditions-->
         <xsl:attribute name="class">
            <xsl:text> x-denom-1-0</xsl:text>
         </xsl:attribute>
         <xsl:if test="@xml:lang">
            <xsl:attribute name="lang">
               <xsl:call-template name="return-lang-applying-language-map">
                  <xsl:with-param name="doclang" select="@xml:lang"/>
               </xsl:call-template>
            </xsl:attribute>
         </xsl:if>
         <xsl:copy-of select="@ch:*"/>
         <xsl:copy-of xmlns:dmp="http://www.arbortext.com/namespace/dmp/dmpmap" select="@dmp:*"/>
         <xsl:if test="@xml:lang">
            <xsl:attribute name="lang">
               <xsl:call-template name="return-lang-applying-language-map">
                  <xsl:with-param name="doclang" select="@xml:lang"/>
               </xsl:call-template>
            </xsl:attribute>
         </xsl:if>
         <xsl:call-template name="maybe-set-id"/>
         <!--Process this element's content-->
         <xsl:apply-templates/>
      </div>
   </xsl:template>

<xsl:template name="__style-for_describe.1">
      <xsl:text> .x-describe-1-0 {margin-left: 0pt; margin-right: 0pt; }</xsl:text>
   </xsl:template>

<xsl:template match="describe" priority="0">
      <!--Emit a nostyle template-->
      <xsl:apply-templates/>
   </xsl:template>

<xsl:template name="__style-for_description.1">
      <xsl:text> .x-description-1-0 {margin-left: 0pt; margin-right: 0pt; text-indent: 0pt; }</xsl:text>
   </xsl:template>

<xsl:template match="description" priority="0">
      <div>
         <!--Emit class values to reflect conditions-->
         <xsl:attribute name="class">
            <xsl:text> x-description-1-0</xsl:text>
         </xsl:attribute>
         <xsl:if test="@xml:lang">
            <xsl:attribute name="lang">
               <xsl:call-template name="return-lang-applying-language-map">
                  <xsl:with-param name="doclang" select="@xml:lang"/>
               </xsl:call-template>
            </xsl:attribute>
         </xsl:if>
         <xsl:copy-of select="@ch:*"/>
         <xsl:copy-of xmlns:dmp="http://www.arbortext.com/namespace/dmp/dmpmap" select="@dmp:*"/>
         <xsl:if test="@xml:lang">
            <xsl:attribute name="lang">
               <xsl:call-template name="return-lang-applying-language-map">
                  <xsl:with-param name="doclang" select="@xml:lang"/>
               </xsl:call-template>
            </xsl:attribute>
         </xsl:if>
         <xsl:call-template name="maybe-set-id"/>
         <!--Process this element's content-->
         <xsl:apply-templates/>
      </div>
   </xsl:template>

<xsl:template name="__style-for_effec.1">
      <xsl:text> .x-effec-1-0 {margin-left: 0pt; margin-right: 0pt; font-weight: bold; }</xsl:text>
   </xsl:template>

<xsl:template match="effec" priority="0">
      <span>
         <!--Emit class values to reflect conditions-->
         <xsl:attribute name="class">
            <xsl:text> x-effec-1-0</xsl:text>
         </xsl:attribute>
         <xsl:if test="@xml:lang">
            <xsl:attribute name="lang">
               <xsl:call-template name="return-lang-applying-language-map">
                  <xsl:with-param name="doclang" select="@xml:lang"/>
               </xsl:call-template>
            </xsl:attribute>
         </xsl:if>
         <xsl:copy-of select="@ch:*"/>
         <xsl:copy-of xmlns:dmp="http://www.arbortext.com/namespace/dmp/dmpmap" select="@dmp:*"/>
         <xsl:if test="@xml:lang">
            <xsl:attribute name="lang">
               <xsl:call-template name="return-lang-applying-language-map">
                  <xsl:with-param name="doclang" select="@xml:lang"/>
               </xsl:call-template>
            </xsl:attribute>
         </xsl:if>
         <xsl:call-template name="maybe-set-id"/>
         <!--Process this element's content-->
         <xsl:apply-templates/>
      </span>
   </xsl:template>

<xsl:template name="__style-for__ufe-eipc-title.3pgk_le211">
      <xsl:text> .x--ufe-eipc-title-1-0 {margin-left: 0pt; margin-right: 0pt; text-indent: 0pt; font-family: sans-serif; color: #0000FF; text-align: left; line-height: 1.1; margin-top: 1.5em; margin-bottom: 1em; margin-left: 0pt; text-indent: 0pt; }</xsl:text>
   </xsl:template>

<xsl:template match="pgblk/_ufe:eipc-title" priority="2">
  <div ch:title="notoc" class=" x--ufe-eipc-title-1-0">
    <xsl:call-template name="t-base-div-title"/>
  </div>
</xsl:template>

<xsl:template match="pbfmatr/_ufe:eipc-title" priority="1">
  <div ch:title="notoc" class=" x--ufe-eipc-title-2-0">
    <xsl:call-template name="t-base-div-title"/>
  </div>
</xsl:template>

<xsl:template match="pgblk/_ufe:em-title" priority="2">
  <div ch:title="notoc" class=" x--ufe-em-title-1-0">
    <xsl:call-template name="t-base-div-title"/>
  </div>
</xsl:template>

<xsl:template match="pbfmatr/_ufe:em-title" priority="1">
  <div ch:title="notoc" class=" x--ufe-em-title-2-0">
    <xsl:call-template name="t-base-div-title"/>
  </div>
</xsl:template>

<xsl:template name="__style-for_email.1">
      <xsl:text> .x-email-1-0 {margin-left: 0pt; margin-right: 0pt; text-indent: 0pt; }</xsl:text>
   </xsl:template>

<xsl:template match="email" priority="0">
      <xsl:param name="hidden" select="'yes'"/>
      <div>
         <!--Emit class values to reflect conditions-->
         <xsl:attribute name="class">
            <xsl:text> x-email-1-0</xsl:text>
         </xsl:attribute>
         <xsl:if test="@xml:lang">
            <xsl:attribute name="lang">
               <xsl:call-template name="return-lang-applying-language-map">
                  <xsl:with-param name="doclang" select="@xml:lang"/>
               </xsl:call-template>
            </xsl:attribute>
         </xsl:if>
         <xsl:copy-of select="@ch:*"/>
         <xsl:copy-of xmlns:dmp="http://www.arbortext.com/namespace/dmp/dmpmap" select="@dmp:*"/>
         <xsl:if test="@xml:lang">
            <xsl:attribute name="lang">
               <xsl:call-template name="return-lang-applying-language-map">
                  <xsl:with-param name="doclang" select="@xml:lang"/>
               </xsl:call-template>
            </xsl:attribute>
         </xsl:if>
         <xsl:call-template name="maybe-set-id"/>
         <!--Suppress element contents (but not gentext) unless unhidden-->
         <xsl:choose>
            <xsl:when test="$hidden='no'">
               <xsl:apply-templates/>
            </xsl:when>
            <xsl:otherwise>
               <xsl:apply-templates select="_sfe:BeforeOrAfterText"/>
            </xsl:otherwise>
         </xsl:choose>
      </div>
   </xsl:template>

<xsl:template name="__style-for__ufe-email-link.1">
      <xsl:text> .x--ufe-email-link-1-0 {margin-left: 0pt; margin-right: 0pt; }</xsl:text>
   </xsl:template>

<xsl:template match="_ufe:email-link" priority="0">
      <span>
         <!--Emit class values to reflect conditions-->
         <xsl:attribute name="class">
            <xsl:text> x--ufe-email-link-1-0</xsl:text>
         </xsl:attribute>
         <xsl:if test="@xml:lang">
            <xsl:attribute name="lang">
               <xsl:call-template name="return-lang-applying-language-map">
                  <xsl:with-param name="doclang" select="@xml:lang"/>
               </xsl:call-template>
            </xsl:attribute>
         </xsl:if>
         <xsl:copy-of select="@ch:*"/>
         <xsl:copy-of xmlns:dmp="http://www.arbortext.com/namespace/dmp/dmpmap" select="@dmp:*"/>
         <xsl:if test="@xml:lang">
            <xsl:attribute name="lang">
               <xsl:call-template name="return-lang-applying-language-map">
                  <xsl:with-param name="doclang" select="@xml:lang"/>
               </xsl:call-template>
            </xsl:attribute>
         </xsl:if>
         <xsl:call-template name="maybe-set-id"/>
         <!--Process this element's content-->
         <xsl:apply-templates/>
      </span>
   </xsl:template>

<xsl:template name="__style-for_emphasis.2taeeis391">
      <xsl:text> .x-emphasis-1-0 {margin-left: 0pt; margin-right: 0pt; text-indent: 0pt; } .x-emphasis-1-1 {font-weight: bold; text-align: center; } .x-emphasis-1-2 {margin-left: 8pt; text-indent: 0pt; } .x-emphasis-1-3 {margin-left: 12pt; text-indent: 0pt; } .x-emphasis-1-4 {margin-left: 16pt; text-indent: 0pt; } .x-emphasis-1-5 {margin-left: 20pt; text-indent: 0pt; }</xsl:text>
   </xsl:template>

<xsl:template match="table[@tabstyle='parts-list']//emphasis" priority="1">
      <xsl:variable name="foClass">block</xsl:variable>
      <xsl:variable name="blockness">block</xsl:variable>
      <xsl:variable name="startnew"/>
      <xsl:variable name="newpageset">#noChange</xsl:variable>
      <div>
         <!--Emit class values to reflect conditions-->
         <xsl:attribute name="class">
            <xsl:text> x-emphasis-1-0</xsl:text>
            <xsl:if test="@role and string(@role)='bold'"> x-emphasis-1-1</xsl:if>
            <xsl:if test="parent::entry[preceding-sibling::entry[part-nbr[@indent = '1']]]"> x-emphasis-1-2</xsl:if>
            <xsl:if test="not(parent::entry[preceding-sibling::entry[part-nbr[@indent = '1']]]) and (parent::entry[preceding-sibling::entry[part-nbr[@indent = '2']]])"> x-emphasis-1-3</xsl:if>
            <xsl:if test="not(parent::entry[preceding-sibling::entry[part-nbr[@indent = '1']]]) and not(parent::entry[preceding-sibling::entry[part-nbr[@indent = '2']]]) and (parent::entry[preceding-sibling::entry[part-nbr[@indent = '3']]])"> x-emphasis-1-4</xsl:if>
            <xsl:if test="not(parent::entry[preceding-sibling::entry[part-nbr[@indent = '1']]]) and not(parent::entry[preceding-sibling::entry[part-nbr[@indent = '2']]]) and not(parent::entry[preceding-sibling::entry[part-nbr[@indent = '3']]]) and (parent::entry[preceding-sibling::entry[part-nbr[@indent = '4']]])"> x-emphasis-1-5</xsl:if>
         </xsl:attribute>
         <xsl:if test="@xml:lang">
            <xsl:attribute name="lang">
               <xsl:call-template name="return-lang-applying-language-map">
                  <xsl:with-param name="doclang" select="@xml:lang"/>
               </xsl:call-template>
            </xsl:attribute>
         </xsl:if>
         <xsl:copy-of select="@ch:*"/>
         <xsl:copy-of xmlns:dmp="http://www.arbortext.com/namespace/dmp/dmpmap" select="@dmp:*"/>
         <xsl:variable name="Breaks-chunkFilenameXPath"/>
         <xsl:variable name="Breaks-persistentFilename"/>
         <xsl:if test="($Breaks-persistentFilename='yes') and ($Breaks-chunkFilenameXPath!='')">
            <xsl:variable name="chunkFilename"/>
            <xsl:if test="$chunkFilename!=''">
               <xsl:attribute name="ch:filename">
                  <xsl:value-of select="$chunkFilename"/>
               </xsl:attribute>
               <xsl:attribute name="ch:namepriority">0</xsl:attribute>
            </xsl:if>
         </xsl:if>
         <xsl:if test="@xml:lang">
            <xsl:attribute name="lang">
               <xsl:call-template name="return-lang-applying-language-map">
                  <xsl:with-param name="doclang" select="@xml:lang"/>
               </xsl:call-template>
            </xsl:attribute>
         </xsl:if>
         <xsl:call-template name="maybe-set-id"/>
         <!--Process this element's content-->
         <xsl:apply-templates/>
      </div>
   </xsl:template>

<xsl:template name="__style-for_emphasis.2emasis82">
      <xsl:text> .x-emphasis-2-0 {margin-left: 0pt; margin-right: 0pt; font-weight: bold; } .x-emphasis-2-1 {font-weight: bold; }</xsl:text>
   </xsl:template>

<xsl:template match="emphasis" priority="0">
      <xsl:variable name="foClass">inline</xsl:variable>
      <xsl:variable name="blockness">inline</xsl:variable>
      <span>
         <!--Emit class values to reflect conditions-->
         <xsl:attribute name="class">
            <xsl:text> x-emphasis-2-0</xsl:text>
            <xsl:if test="@role and string(@role)='bold'"> x-emphasis-2-1</xsl:if>
         </xsl:attribute>
         <xsl:if test="@xml:lang">
            <xsl:attribute name="lang">
               <xsl:call-template name="return-lang-applying-language-map">
                  <xsl:with-param name="doclang" select="@xml:lang"/>
               </xsl:call-template>
            </xsl:attribute>
         </xsl:if>
         <xsl:copy-of select="@ch:*"/>
         <xsl:copy-of xmlns:dmp="http://www.arbortext.com/namespace/dmp/dmpmap" select="@dmp:*"/>
         <xsl:variable name="Breaks-chunkFilenameXPath"/>
         <xsl:variable name="Breaks-persistentFilename"/>
         <xsl:if test="($Breaks-persistentFilename='yes') and ($Breaks-chunkFilenameXPath!='')">
            <xsl:variable name="chunkFilename"/>
            <xsl:if test="$chunkFilename!=''">
               <xsl:attribute name="ch:filename">
                  <xsl:value-of select="$chunkFilename"/>
               </xsl:attribute>
               <xsl:attribute name="ch:namepriority">0</xsl:attribute>
            </xsl:if>
         </xsl:if>
         <xsl:if test="@xml:lang">
            <xsl:attribute name="lang">
               <xsl:call-template name="return-lang-applying-language-map">
                  <xsl:with-param name="doclang" select="@xml:lang"/>
               </xsl:call-template>
            </xsl:attribute>
         </xsl:if>
         <xsl:call-template name="maybe-set-id"/>
         <!--Process this element's content-->
         <xsl:apply-templates/>
      </span>
   </xsl:template>

<xsl:template name="__style-for_endmulti.1">
      <xsl:text> .x-endmulti-1-0 {margin-left: 0pt; margin-right: 0pt; }</xsl:text>
   </xsl:template>

<xsl:template match="endmulti" priority="0">
      <!--Emit a nostyle template-->
      <xsl:apply-templates/>
   </xsl:template>

<xsl:template name="__style-for_engine.2ennene201">
      <xsl:text> .x-engine-1-0 {margin-left: 0pt; margin-right: 0pt; }</xsl:text>
   </xsl:template>

<xsl:template match="engine[position()&gt;1]" priority="1">
      <span>
         <!--Emit class values to reflect conditions-->
         <xsl:attribute name="class">
            <xsl:text> x-engine-1-0</xsl:text>
         </xsl:attribute>
         <xsl:if test="@xml:lang">
            <xsl:attribute name="lang">
               <xsl:call-template name="return-lang-applying-language-map">
                  <xsl:with-param name="doclang" select="@xml:lang"/>
               </xsl:call-template>
            </xsl:attribute>
         </xsl:if>
         <xsl:copy-of select="@ch:*"/>
         <xsl:copy-of xmlns:dmp="http://www.arbortext.com/namespace/dmp/dmpmap" select="@dmp:*"/>
         <xsl:if test="@xml:lang">
            <xsl:attribute name="lang">
               <xsl:call-template name="return-lang-applying-language-map">
                  <xsl:with-param name="doclang" select="@xml:lang"/>
               </xsl:call-template>
            </xsl:attribute>
         </xsl:if>
         <xsl:call-template name="maybe-set-id"/>
         <!--Process this element's content-->
         <xsl:apply-templates/>
      </span>
   </xsl:template>

<xsl:template name="__style-for_engine.2ennene62">
      <xsl:text> .x-engine-2-0 {margin-left: 0pt; margin-right: 0pt; }</xsl:text>
   </xsl:template>

<xsl:template match="engine" priority="0">
      <span>
         <!--Emit class values to reflect conditions-->
         <xsl:attribute name="class">
            <xsl:text> x-engine-2-0</xsl:text>
         </xsl:attribute>
         <xsl:if test="@xml:lang">
            <xsl:attribute name="lang">
               <xsl:call-template name="return-lang-applying-language-map">
                  <xsl:with-param name="doclang" select="@xml:lang"/>
               </xsl:call-template>
            </xsl:attribute>
         </xsl:if>
         <xsl:copy-of select="@ch:*"/>
         <xsl:copy-of xmlns:dmp="http://www.arbortext.com/namespace/dmp/dmpmap" select="@dmp:*"/>
         <xsl:if test="@xml:lang">
            <xsl:attribute name="lang">
               <xsl:call-template name="return-lang-applying-language-map">
                  <xsl:with-param name="doclang" select="@xml:lang"/>
               </xsl:call-template>
            </xsl:attribute>
         </xsl:if>
         <xsl:call-template name="maybe-set-id"/>
         <!--Process this element's content-->
         <xsl:apply-templates/>
      </span>
   </xsl:template>

<xsl:template name="__style-for__ufe-engine-type.1">
      <xsl:text> .x--ufe-engine-type-1-0 {margin-left: 0pt; margin-right: 0pt; text-indent: 0pt; margin-bottom: 12pt; } .x--ufe-engine-type-1-1 {} .x--ufe-engine-type-1-2 {} .x--ufe-engine-type-1-3 {} .x--ufe-engine-type-1-4 {}</xsl:text>
   </xsl:template>

<xsl:template match="_ufe:engine-type" priority="0">
      <xsl:variable name="foClass">block</xsl:variable>
      <xsl:variable name="blockness">block</xsl:variable>
      <xsl:variable name="startnew"/>
      <xsl:variable name="newpageset">#noChange</xsl:variable>
      <div>
         <!--Emit class values to reflect conditions-->
         <xsl:attribute name="class">
            <xsl:text> x--ufe-engine-type-1-0</xsl:text>
            <xsl:if test="@enginetype and string(@enginetype)='FAN'"> x--ufe-engine-type-1-1</xsl:if>
            <xsl:if test="not(@enginetype and string(@enginetype)='FAN') and (@enginetype and string(@enginetype)='PROP')"> x--ufe-engine-type-1-2</xsl:if>
            <xsl:if test="not(@enginetype and string(@enginetype)='FAN') and not(@enginetype and string(@enginetype)='PROP') and (@enginetype and string(@enginetype)='SHAFT')"> x--ufe-engine-type-1-3</xsl:if>
            <xsl:if test="not(@enginetype and string(@enginetype)='FAN') and not(@enginetype and string(@enginetype)='PROP') and not(@enginetype and string(@enginetype)='SHAFT') and (@enginetype and string(@enginetype)='APU')"> x--ufe-engine-type-1-4</xsl:if>
         </xsl:attribute>
         <xsl:if test="@xml:lang">
            <xsl:attribute name="lang">
               <xsl:call-template name="return-lang-applying-language-map">
                  <xsl:with-param name="doclang" select="@xml:lang"/>
               </xsl:call-template>
            </xsl:attribute>
         </xsl:if>
         <xsl:copy-of select="@ch:*"/>
         <xsl:copy-of xmlns:dmp="http://www.arbortext.com/namespace/dmp/dmpmap" select="@dmp:*"/>
         <xsl:variable name="Breaks-chunkFilenameXPath"/>
         <xsl:variable name="Breaks-persistentFilename"/>
         <xsl:if test="($Breaks-persistentFilename='yes') and ($Breaks-chunkFilenameXPath!='')">
            <xsl:variable name="chunkFilename"/>
            <xsl:if test="$chunkFilename!=''">
               <xsl:attribute name="ch:filename">
                  <xsl:value-of select="$chunkFilename"/>
               </xsl:attribute>
               <xsl:attribute name="ch:namepriority">0</xsl:attribute>
            </xsl:if>
         </xsl:if>
         <xsl:if test="@xml:lang">
            <xsl:attribute name="lang">
               <xsl:call-template name="return-lang-applying-language-map">
                  <xsl:with-param name="doclang" select="@xml:lang"/>
               </xsl:call-template>
            </xsl:attribute>
         </xsl:if>
         <xsl:call-template name="maybe-set-id"/>
         <!--Process this element's content-->
         <xsl:apply-templates/>
      </div>
   </xsl:template>

<xsl:template name="__style-for_enumlist.1">
      <xsl:text> .x-enumlist-1-0 {margin-left: 0pt; margin-right: 0pt; text-indent: 0pt; margin-top: 8pt; font-size: 9pt; }</xsl:text>
   </xsl:template>

<xsl:template match="enumlist" priority="0">
      <div>
         <!--Emit class values to reflect conditions-->
         <xsl:attribute name="class">
            <xsl:text> x-enumlist-1-0</xsl:text>
         </xsl:attribute>
         <xsl:if test="@xml:lang">
            <xsl:attribute name="lang">
               <xsl:call-template name="return-lang-applying-language-map">
                  <xsl:with-param name="doclang" select="@xml:lang"/>
               </xsl:call-template>
            </xsl:attribute>
         </xsl:if>
         <xsl:copy-of select="@ch:*"/>
         <xsl:copy-of xmlns:dmp="http://www.arbortext.com/namespace/dmp/dmpmap" select="@dmp:*"/>
         <xsl:if test="@xml:lang">
            <xsl:attribute name="lang">
               <xsl:call-template name="return-lang-applying-language-map">
                  <xsl:with-param name="doclang" select="@xml:lang"/>
               </xsl:call-template>
            </xsl:attribute>
         </xsl:if>
         <xsl:call-template name="maybe-set-id"/>
         <!--Process this element's content-->
         <xsl:apply-templates/>
      </div>
   </xsl:template>

<xsl:template name="__style-for_eqn.4eqqn461">
      <xsl:text> .x-eqn-1-0 {margin-left: 0pt; margin-right: 0pt; text-indent: 0pt; font-family: Arial; font-size: 9pt; text-align: center; margin-bottom: 11pt; }</xsl:text>
   </xsl:template>

<xsl:template match="eqn[preceding-sibling::*[1][name() = 'table']]" priority="3">
      <div>
         <!--Emit class values to reflect conditions-->
         <xsl:attribute name="class">
            <xsl:text> x-eqn-1-0</xsl:text>
         </xsl:attribute>
         <xsl:if test="@xml:lang">
            <xsl:attribute name="lang">
               <xsl:call-template name="return-lang-applying-language-map">
                  <xsl:with-param name="doclang" select="@xml:lang"/>
               </xsl:call-template>
            </xsl:attribute>
         </xsl:if>
         <xsl:copy-of select="@ch:*"/>
         <xsl:copy-of xmlns:dmp="http://www.arbortext.com/namespace/dmp/dmpmap" select="@dmp:*"/>
         <xsl:if test="@xml:lang">
            <xsl:attribute name="lang">
               <xsl:call-template name="return-lang-applying-language-map">
                  <xsl:with-param name="doclang" select="@xml:lang"/>
               </xsl:call-template>
            </xsl:attribute>
         </xsl:if>
         <xsl:call-template name="maybe-set-id"/>
         <!--Process this element's content-->
         <xsl:apply-templates/>
      </div>
   </xsl:template>

<xsl:template name="__style-for_eqn.4eqqn442">
      <xsl:text> .x-eqn-2-0 {margin-left: 0pt; margin-right: 0pt; font-family: Arial; font-size: 9pt; }</xsl:text>
   </xsl:template>

<xsl:template match="eqn[@display='inline' and not(child::table)]" priority="2">
      <span>
         <!--Emit class values to reflect conditions-->
         <xsl:attribute name="class">
            <xsl:text> x-eqn-2-0</xsl:text>
         </xsl:attribute>
         <xsl:if test="@xml:lang">
            <xsl:attribute name="lang">
               <xsl:call-template name="return-lang-applying-language-map">
                  <xsl:with-param name="doclang" select="@xml:lang"/>
               </xsl:call-template>
            </xsl:attribute>
         </xsl:if>
         <xsl:copy-of select="@ch:*"/>
         <xsl:copy-of xmlns:dmp="http://www.arbortext.com/namespace/dmp/dmpmap" select="@dmp:*"/>
         <xsl:if test="@xml:lang">
            <xsl:attribute name="lang">
               <xsl:call-template name="return-lang-applying-language-map">
                  <xsl:with-param name="doclang" select="@xml:lang"/>
               </xsl:call-template>
            </xsl:attribute>
         </xsl:if>
         <xsl:call-template name="maybe-set-id"/>
         <!--Process this element's content-->
         <xsl:apply-templates/>
      </span>
   </xsl:template>

<xsl:template name="__style-for_eqn.4eqqn223">
      <xsl:text> .x-eqn-3-0 {margin-left: 0pt; margin-right: 0pt; text-indent: 0pt; font-family: Arial; font-size: 9pt; margin-bottom: 11pt; }</xsl:text>
   </xsl:template>

<xsl:template match="eqn[@display='inline']" priority="1">
      <div>
         <!--Emit class values to reflect conditions-->
         <xsl:attribute name="class">
            <xsl:text> x-eqn-3-0</xsl:text>
         </xsl:attribute>
         <xsl:if test="@xml:lang">
            <xsl:attribute name="lang">
               <xsl:call-template name="return-lang-applying-language-map">
                  <xsl:with-param name="doclang" select="@xml:lang"/>
               </xsl:call-template>
            </xsl:attribute>
         </xsl:if>
         <xsl:copy-of select="@ch:*"/>
         <xsl:copy-of xmlns:dmp="http://www.arbortext.com/namespace/dmp/dmpmap" select="@dmp:*"/>
         <xsl:if test="@xml:lang">
            <xsl:attribute name="lang">
               <xsl:call-template name="return-lang-applying-language-map">
                  <xsl:with-param name="doclang" select="@xml:lang"/>
               </xsl:call-template>
            </xsl:attribute>
         </xsl:if>
         <xsl:call-template name="maybe-set-id"/>
         <!--Process this element's content-->
         <xsl:apply-templates/>
      </div>
   </xsl:template>

<xsl:template name="__style-for_eqn.4eqqn34">
      <xsl:text> .x-eqn-4-0 {margin-left: 0pt; margin-right: 0pt; text-indent: 0pt; font-family: Arial; font-size: 9pt; margin-bottom: 11pt; }</xsl:text>
   </xsl:template>

<xsl:template match="eqn" priority="0">
      <div>
         <!--Emit class values to reflect conditions-->
         <xsl:attribute name="class">
            <xsl:text> x-eqn-4-0</xsl:text>
         </xsl:attribute>
         <xsl:if test="@xml:lang">
            <xsl:attribute name="lang">
               <xsl:call-template name="return-lang-applying-language-map">
                  <xsl:with-param name="doclang" select="@xml:lang"/>
               </xsl:call-template>
            </xsl:attribute>
         </xsl:if>
         <xsl:copy-of select="@ch:*"/>
         <xsl:copy-of xmlns:dmp="http://www.arbortext.com/namespace/dmp/dmpmap" select="@dmp:*"/>
         <xsl:if test="@xml:lang">
            <xsl:attribute name="lang">
               <xsl:call-template name="return-lang-applying-language-map">
                  <xsl:with-param name="doclang" select="@xml:lang"/>
               </xsl:call-template>
            </xsl:attribute>
         </xsl:if>
         <xsl:call-template name="maybe-set-id"/>
         <!--Process this element's content-->
         <xsl:apply-templates/>
      </div>
   </xsl:template>

<xsl:template name="__style-for_facility.1">
      <xsl:text> .x-facility-1-0 {margin-left: 0pt; margin-right: 0pt; text-indent: 0pt; }</xsl:text>
   </xsl:template>

<xsl:template match="facility" priority="0">
      <div>
         <!--Emit class values to reflect conditions-->
         <xsl:attribute name="class">
            <xsl:text> x-facility-1-0</xsl:text>
         </xsl:attribute>
         <xsl:if test="@xml:lang">
            <xsl:attribute name="lang">
               <xsl:call-template name="return-lang-applying-language-map">
                  <xsl:with-param name="doclang" select="@xml:lang"/>
               </xsl:call-template>
            </xsl:attribute>
         </xsl:if>
         <xsl:copy-of select="@ch:*"/>
         <xsl:copy-of xmlns:dmp="http://www.arbortext.com/namespace/dmp/dmpmap" select="@dmp:*"/>
         <xsl:if test="@xml:lang">
            <xsl:attribute name="lang">
               <xsl:call-template name="return-lang-applying-language-map">
                  <xsl:with-param name="doclang" select="@xml:lang"/>
               </xsl:call-template>
            </xsl:attribute>
         </xsl:if>
         <xsl:call-template name="maybe-set-id"/>
         <!--Process this element's content-->
         <xsl:apply-templates/>
      </div>
   </xsl:template>

<xsl:template name="__style-for_fandc.1">
      <xsl:text> .x-fandc-1-0 {margin-left: 0pt; margin-right: 0pt; }</xsl:text>
   </xsl:template>

<xsl:template match="fandc" priority="0">
      <!--Emit a nostyle template-->
      <xsl:apply-templates/>
   </xsl:template>

<xsl:template name="__style-for_fandc-note.1">
      <xsl:text> .x-fandc-note-1-0 {margin-left: 0pt; margin-right: 0pt; }</xsl:text>
   </xsl:template>

<xsl:template match="fandc-note" priority="0">
      <!--Emit a nostyle template-->
      <xsl:apply-templates/>
   </xsl:template>

<xsl:template name="__style-for_fax.2adesax111">
      <xsl:text> .x-fax-1-0 {margin-left: 0pt; margin-right: 0pt; text-indent: 0pt; }</xsl:text>
   </xsl:template>

<xsl:template match="address/fax" priority="1">
      <div>
         <!--Emit class values to reflect conditions-->
         <xsl:attribute name="class">
            <xsl:text> x-fax-1-0</xsl:text>
         </xsl:attribute>
         <xsl:if test="@xml:lang">
            <xsl:attribute name="lang">
               <xsl:call-template name="return-lang-applying-language-map">
                  <xsl:with-param name="doclang" select="@xml:lang"/>
               </xsl:call-template>
            </xsl:attribute>
         </xsl:if>
         <xsl:copy-of select="@ch:*"/>
         <xsl:copy-of xmlns:dmp="http://www.arbortext.com/namespace/dmp/dmpmap" select="@dmp:*"/>
         <xsl:if test="@xml:lang">
            <xsl:attribute name="lang">
               <xsl:call-template name="return-lang-applying-language-map">
                  <xsl:with-param name="doclang" select="@xml:lang"/>
               </xsl:call-template>
            </xsl:attribute>
         </xsl:if>
         <xsl:call-template name="maybe-set-id"/>
         <!--Process this element's content-->
         <xsl:apply-templates/>
      </div>
   </xsl:template>

<xsl:template name="__style-for_fax.2faax32">
      <xsl:text> .x-fax-2-0 {margin-left: 0pt; margin-right: 0pt; text-indent: 0pt; }</xsl:text>
   </xsl:template>

<xsl:template match="fax" priority="0">
      <div>
         <!--Emit class values to reflect conditions-->
         <xsl:attribute name="class">
            <xsl:text> x-fax-2-0</xsl:text>
         </xsl:attribute>
         <xsl:if test="@xml:lang">
            <xsl:attribute name="lang">
               <xsl:call-template name="return-lang-applying-language-map">
                  <xsl:with-param name="doclang" select="@xml:lang"/>
               </xsl:call-template>
            </xsl:attribute>
         </xsl:if>
         <xsl:copy-of select="@ch:*"/>
         <xsl:copy-of xmlns:dmp="http://www.arbortext.com/namespace/dmp/dmpmap" select="@dmp:*"/>
         <xsl:if test="@xml:lang">
            <xsl:attribute name="lang">
               <xsl:call-template name="return-lang-applying-language-map">
                  <xsl:with-param name="doclang" select="@xml:lang"/>
               </xsl:call-template>
            </xsl:attribute>
         </xsl:if>
         <xsl:call-template name="maybe-set-id"/>
         <!--Process this element's content-->
         <xsl:apply-templates/>
      </div>
   </xsl:template>

<xsl:template name="__style-for__ufe-fig-title.1">
      <xsl:text> .x--ufe-fig-title-1-0 {margin-left: 0pt; margin-right: 0pt; text-indent: 0pt; font-weight: bold; font-size: 14pt; }</xsl:text>
   </xsl:template>

<xsl:template match="_ufe:fig-title" priority="0">
  <div class=" x--ufe-fig-title-1-0">
    <xsl:call-template name="t-base-div-basic"/>
  </div>
</xsl:template>

<xsl:template match="figure/figno" priority="1">
  <xsl:param name="hidden" select="'yes'"/>

  <xsl:if test="$hidden='no'">
    <div class=" x-figno-1-0">
      <xsl:call-template name="t-base-div-basic"/>
    </div>
  </xsl:if>
</xsl:template>

<xsl:template match="figno" priority="0">
  <div class=" x-figno-2-0">
    <xsl:call-template name="t-base-div-basic"/>
  </div>
</xsl:template>

<xsl:template match="fix-equip" priority="0">
  <span class=" x-fix-equip-1-0">
    <xsl:call-template name="t-base-div-basic"/>
  </span>
</xsl:template>

<xsl:template match="pgblk/_ufe:fixequ-title" priority="5">
  <div ch:title="notoc" class=" x--ufe-fixequ-title-1-0">
    <xsl:call-template name="t-base-div-title"/>
  </div>
</xsl:template>

<xsl:template match="pbfmatr/_ufe:fixequ-title" priority="4">
  <div ch:title="notoc" class=" x--ufe-fixequ-title-2-0">
    <xsl:call-template name="t-base-div-title"/>
  </div>
</xsl:template>

<xsl:template match="pwcspblist/_ufe:fixequ-title" priority="3">
  <div ch:title="notoc" class=" x--ufe-fixequ-title-3-0">
    <xsl:call-template name="t-base-div-title"/>
  </div>
</xsl:template>

<xsl:template match="page-block//fixtures-and-equipment//_ufe:fixequ-title" priority="2">
  <div ch:title="toc" class=" x--ufe-fixequ-title-4-0">
    <xsl:call-template name="t-base-div-title"/>
  </div>
</xsl:template>

<xsl:template match="ata-page-block//fixtures-and-equipment//_ufe:fixequ-title" priority="1">
  <div ch:title="toc" class=" x--ufe-fixequ-title-5-0">
    <xsl:call-template name="t-base-div-title"/>
  </div>
</xsl:template>

<xsl:template match="_ufe:fixequ-title" priority="0">
  <div ch:title="notoc" class=" x--ufe-fixequ-title-6-0">
    <xsl:call-template name="t-base-div-title"/>
  </div>
</xsl:template>

<xsl:template match="eqn/frac" priority="20">
  <span class=" x-frac-1-0">
    <xsl:call-template name="t-base-div-basic"/>
  </span>
</xsl:template>

<xsl:template match="frac" priority="0">
  <span class=" x-frac-2-0">
    <xsl:call-template name="t-base-div-basic"/>
  </span>
</xsl:template>

<xsl:template match="frontmatter" priority="0">
  <div class=" x-frontmatter-1-0">
    <xsl:call-template name="t-base-div-chunk"/>
    <xsl:apply-templates/>
  </div>
</xsl:template>

<xsl:template match="pgblk/_ufe:general-title" priority="5">
  <div ch:title="notoc" class=" x--ufe-general-title-1-0">
    <xsl:call-template name="t-base-div-title"/>
  </div>
</xsl:template>

<xsl:template match="pbfmatr/_ufe:general-title" priority="4">
  <div ch:title="notoc" class=" x--ufe-general-title-2-0">
    <xsl:call-template name="t-base-div-title"/>
  </div>
</xsl:template>

<xsl:template match="pwcspblist/_ufe:general-title" priority="3">
  <div ch:title="notoc" class=" x--ufe-general-title-3-0">
    <xsl:call-template name="t-base-div-title"/>
  </div>
</xsl:template>

<xsl:template match="page-block//general//_ufe:general-title" priority="2">
  <div ch:title="toc" class=" x--ufe-general-title-4-0">
    <xsl:call-template name="t-base-div-title"/>
  </div>
</xsl:template>

<xsl:template match="ata-page-block//general//_ufe:general-title" priority="1">
  <div ch:title="toc" class=" x--ufe-general-title-5-0">
    <xsl:call-template name="t-base-div-title"/>
  </div>
</xsl:template>

<xsl:template match="_ufe:general-title" priority="0">
  <div ch:title="notoc" class=" x--ufe-general-title-6-0">
    <xsl:call-template name="t-base-div-title"/>
  </div>
</xsl:template>

<xsl:template match="pgblk/_ufe:glossary-title" priority="3">
  <div ch:title="notoc" class=" x--ufe-glossary-title-1-0">
    <xsl:call-template name="t-base-div-title"/>
  </div>
</xsl:template>

<xsl:template match="pbfmatr/_ufe:glossary-title" priority="2">
  <div ch:title="notoc" class=" x--ufe-glossary-title-2-0">
    <xsl:call-template name="t-base-div-title"/>
  </div>
</xsl:template>

<xsl:template match="pwcspblist/_ufe:glossary-title" priority="1">
  <div ch:title="notoc" class=" x--ufe-glossary-title-3-0">
    <xsl:call-template name="t-base-div-title"/>
  </div>
</xsl:template>

<xsl:template match="_ufe:hidden" priority="0">
  <xsl:param name="hidden" select="'yes'"/>

  <xsl:if test="$hidden='no'">
    <span class=" x--ufe-hidden-1-0">
      <xsl:call-template name="t-base-div-basic"/>
    </span>
  </xsl:if>
</xsl:template>

<xsl:template match="highlights" priority="0">
  <div class=" x-highlights-1-0">
     <xsl:copy-of select="@ch:*"/>
     <xsl:attribute name="ch:filename"><xsl:value-of select="name()"/></xsl:attribute>
     <xsl:attribute name="ch:namepriority">0</xsl:attribute>
     <xsl:call-template name="maybe-set-id">
        <xsl:with-param name="only-if-id-attr" select="'no'"/>
     </xsl:call-template>
     <xsl:call-template name="t-base-pwcmetainfo"/>
     <xsl:call-template name="t-base-pwcbannerinfo"/>
     <xsl:apply-templates/>
  </div>
</xsl:template>

<xsl:template match="_ufe:highlights-link" priority="0">
  <span class=" x--ufe-highlights-link-1-0">
    <xsl:call-template name="t-base-div-basic"/>
  </span>
</xsl:template>

<xsl:template match="history" priority="0">
  <xsl:apply-templates/>
</xsl:template>

<xsl:template match="hl-fragment" priority="0">
  <xsl:apply-templates/>
</xsl:template>

<xsl:template match="pgblk/_ufe:howtouse-title" priority="2">
  <div ch:title="notoc" class=" x--ufe-howtouse-title-1-0">
    <xsl:call-template name="t-base-div-title"/>
  </div>
</xsl:template>

<xsl:template match="pbfmatr/_ufe:howtouse-title" priority="1">
  <div ch:title="notoc" class=" x--ufe-howtouse-title-2-0">
    <xsl:call-template name="t-base-div-title"/>
  </div>
</xsl:template>

<xsl:template match="insert" priority="0">
  <xsl:apply-templates/>
</xsl:template>

<xsl:template match="int-mail" priority="0">
  <span class=" x-int-mail-1-0">
    <xsl:call-template name="t-base-div-basic"/>
  </span>
</xsl:template>

<xsl:template match="intro" priority="0">
  <div class=" x-intro-1-0">
    <xsl:call-template name="t-base-div-basic2"/>
  </div>
</xsl:template>

<xsl:template match="pgblk/_ufe:intro-title" priority="2">
  <div ch:title="notoc" class=" x--ufe-intro-title-1-0">
    <xsl:call-template name="t-base-div-title"/>
  </div>
</xsl:template>

<xsl:template match="pbfmatr/_ufe:intro-title" priority="1">
  <div ch:title="notoc" class=" x--ufe-intro-title-2-0">
    <xsl:call-template name="t-base-div-title"/>
  </div>
</xsl:template>

<xsl:template match="isempty" priority="0">
  <xsl:apply-templates/>
</xsl:template>

<xsl:template match="step/step/enumlist/item" priority="30">
  <table border="0" cellpadding="0" cellspacing="0" class=" x-item-1-0 x--zero-left-margins">
    <xsl:call-template name="t-base-step-table">
      <xsl:with-param name="col1-width" select="'0pt'"/>
      <xsl:with-param name="col2-width" select="''"/>
      <xsl:with-param name="col3-width" select="'100%'"/>
      <xsl:with-param name="label-col"  select="'2'"/>
      <xsl:with-param name="col2-align" select="'left'"/>
      <xsl:with-param name="apply"      select="'&lib-gentxt;'"/>
    </xsl:call-template>
  </table>
</xsl:template>

<xsl:template match="prclist4//prclist4//prclist4//prclist4/item" priority="29">
  <table border="0" cellpadding="0" cellspacing="0" style="table-layout: fixed; " class=" x-item-2-0 x--zero-left-margins">
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

<xsl:template match="list4//list4//list4//list4/item" priority="28">
  <table border="0" cellpadding="0" cellspacing="0" style="table-layout: fixed; " class=" x-item-3-0 x--zero-left-margins">
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

<xsl:template match="enumlist//enumlist//enumlist//enumlist/item" priority="27">
  <table border="0" cellpadding="0" cellspacing="0" style="table-layout: fixed; " class=" x-item-4-0 x--zero-left-margins">
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

<xsl:template match="prclist4//prclist4//prclist4/item" priority="26">
  <table border="0" cellpadding="0" cellspacing="0" style="table-layout: fixed; " class=" x-item-5-0 x--zero-left-margins">
    <xsl:call-template name="t-base-step-table">
      <xsl:with-param name="col1-width" select="'2em'"/>
      <xsl:with-param name="col2-width" select="'12pt'"/>
      <xsl:with-param name="col3-width" select="''"/>
      <xsl:with-param name="label-col"  select="'1'"/>
      <xsl:with-param name="col2-align" select="'right'"/>
      <xsl:with-param name="apply"      select="'&lib-gentxt;'"/>
    </xsl:call-template>
  </table>
</xsl:template>

<xsl:template match="list4//list4//list4/item" priority="25">
  <table border="0" cellpadding="0" cellspacing="0" style="table-layout: fixed; " class=" x-item-6-0 x--zero-left-margins">
    <xsl:call-template name="t-base-step-table">
      <xsl:with-param name="col1-width" select="'2em'"/>
      <xsl:with-param name="col2-width" select="'12pt'"/>
      <xsl:with-param name="col3-width" select="''"/>
      <xsl:with-param name="label-col"  select="'1'"/>
      <xsl:with-param name="col2-align" select="'right'"/>
      <xsl:with-param name="apply"      select="'&lib-gentxt;'"/>
    </xsl:call-template>
  </table>
</xsl:template>

<xsl:template match="list//list//list/item" priority="24">
  <table border="0" cellpadding="0" cellspacing="0" style="table-layout: fixed; " class=" x-item-7-0 x--zero-left-margins">
    <xsl:call-template name="t-base-step-table">
      <xsl:with-param name="col1-width" select="'0em'"/>
      <xsl:with-param name="col2-width" select="'15pt'"/>
      <xsl:with-param name="col3-width" select="''"/>
      <xsl:with-param name="label-col"  select="'2'"/>
      <xsl:with-param name="col2-align" select="'left'"/>
      <xsl:with-param name="apply"      select="'&lib-gentxt;'"/>
    </xsl:call-template>
  </table>
</xsl:template>

<xsl:template match="enumlist//enumlist//enumlist/item" priority="23">
  <table border="0" cellpadding="0" cellspacing="0" style="table-layout: fixed; " class=" x-item-8-0 x--zero-left-margins">
    <xsl:call-template name="t-base-step-table">
      <xsl:with-param name="col1-width" select="'2em'"/>
      <xsl:with-param name="col2-width" select="'12pt'"/>
      <xsl:with-param name="col3-width" select="''"/>
      <xsl:with-param name="label-col"  select="'1'"/>
      <xsl:with-param name="col2-align" select="'right'"/>
      <xsl:with-param name="apply"      select="'&lib-gentxt;'"/>
    </xsl:call-template>
  </table>
</xsl:template>

<xsl:template match="bullist//bullist//bullist/item" priority="22">
  <table border="0" cellpadding="0" cellspacing="0" style="table-layout: fixed; " class=" x-item-9-0 x--zero-left-margins">
    <xsl:call-template name="t-base-step-table">
      <xsl:with-param name="col1-width" select="'0em'"/>
      <xsl:with-param name="col2-width" select="'15pt'"/>
      <xsl:with-param name="col3-width" select="''"/>
      <xsl:with-param name="label-col"  select="'2'"/>
      <xsl:with-param name="col2-align" select="'left'"/>
      <xsl:with-param name="apply"      select="'&lib-gentxt;'"/>
    </xsl:call-template>
  </table>
</xsl:template>

<xsl:template match="prclist4//prclist4/item" priority="21">
  <table border="0" cellpadding="0" cellspacing="0" style="table-layout: fixed; " class=" x-item-10-0 x--zero-left-margins">
    <xsl:call-template name="t-base-step-table">
      <xsl:with-param name="col1-width" select="'1em'"/>
      <xsl:with-param name="col2-width" select="'12pt'"/>
      <xsl:with-param name="col3-width" select="''"/>
      <xsl:with-param name="label-col"  select="'1'"/>
      <xsl:with-param name="col2-align" select="'right'"/>
      <xsl:with-param name="apply"      select="'&lib-gentxt;'"/>
    </xsl:call-template>
  </table>
</xsl:template>

<xsl:template match="list4//list4/item" priority="20">
  <table border="0" cellpadding="0" cellspacing="0" style="table-layout: fixed; " class=" x-item-11-0 x--zero-left-margins">
    <xsl:call-template name="t-base-step-table">
      <xsl:with-param name="col1-width" select="'1em'"/>
      <xsl:with-param name="col2-width" select="'12pt'"/>
      <xsl:with-param name="col3-width" select="''"/>
      <xsl:with-param name="label-col"  select="'1'"/>
      <xsl:with-param name="col2-align" select="'right'"/>
      <xsl:with-param name="apply"      select="'&lib-gentxt;'"/>
    </xsl:call-template>
  </table>
</xsl:template>

<xsl:template match="list//list/item" priority="19">
  <table border="0" cellpadding="0" cellspacing="0" style="table-layout: fixed; " class=" x-item-12-0 x--zero-left-margins">
    <xsl:call-template name="t-base-step-table">
      <xsl:with-param name="col1-width" select="'0em'"/>
      <xsl:with-param name="col2-width" select="'15pt'"/>
      <xsl:with-param name="col3-width" select="''"/>
      <xsl:with-param name="label-col"  select="'2'"/>
      <xsl:with-param name="col2-align" select="'left'"/>
      <xsl:with-param name="apply"      select="'&lib-gentxt;'"/>
    </xsl:call-template>
  </table>
</xsl:template>

<xsl:template match="enumlist//enumlist/item" priority="18">
  <table border="0" cellpadding="0" cellspacing="0" style="table-layout: fixed; " class=" x-item-13-0 x--zero-left-margins">
    <xsl:call-template name="t-base-step-table">
      <xsl:with-param name="col1-width" select="'1em'"/>
      <xsl:with-param name="col2-width" select="'12pt'"/>
      <xsl:with-param name="col3-width" select="''"/>
      <xsl:with-param name="label-col"  select="'1'"/>
      <xsl:with-param name="col2-align" select="'right'"/>
      <xsl:with-param name="apply"      select="'&lib-gentxt;'"/>
    </xsl:call-template>
  </table>
</xsl:template>

<xsl:template match="bullist//bullist/item" priority="17">
  <table border="0" cellpadding="0" cellspacing="0" style="table-layout: fixed; " class=" x-item-14-0 x--zero-left-margins">
    <xsl:call-template name="t-base-step-table">
      <xsl:with-param name="col1-width" select="'0em'"/>
      <xsl:with-param name="col2-width" select="'15pt'"/>
      <xsl:with-param name="col3-width" select="''"/>
      <xsl:with-param name="label-col"  select="'2'"/>
      <xsl:with-param name="col2-align" select="'left'"/>
      <xsl:with-param name="apply"      select="'&lib-gentxt;'"/>
    </xsl:call-template>
  </table>
</xsl:template>

<xsl:template match="list/item[table/@tabstyle='frac']" priority="16">
  <span style="display:inline-block">
  <table border="0" cellpadding="0" cellspacing="0" style="table-layout: fixed; " class=" x-item-15-0 x--zero-left-margins">
    <xsl:call-template name="t-base-step-table">
      <xsl:with-param name="col1-width" select="'0em'"/>
      <xsl:with-param name="col2-width" select="'15pt'"/>
      <xsl:with-param name="col3-width" select="''"/>
      <xsl:with-param name="label-col"  select="'2'"/>
      <xsl:with-param name="col2-align" select="'left'"/>
      <xsl:with-param name="apply"      select="'&lib-gentxt;'"/>
    </xsl:call-template>
  </table>
  </span>
</xsl:template>

<xsl:template match="bullist/item[table/@tabstyle='frac']" priority="15">
  <span style="display:inline-block">
  <table border="0" cellpadding="0" cellspacing="0" style="table-layout: fixed; " class=" x-item-16-0 x--zero-left-margins">
    <xsl:call-template name="t-base-step-table">
      <xsl:with-param name="col1-width" select="'0em'"/>
      <xsl:with-param name="col2-width" select="'15pt'"/>
      <xsl:with-param name="col3-width" select="''"/>
      <xsl:with-param name="label-col"  select="'2'"/>
      <xsl:with-param name="col2-align" select="'left'"/>
      <xsl:with-param name="apply"      select="'&lib-gentxt;'"/>
    </xsl:call-template>
  </table>
  </span>
</xsl:template>

<xsl:template match="pwcchapsect-list/item" priority="14">
  <table border="0" cellpadding="0" cellspacing="0" class=" x-item-17-0 x--zero-left-margins">
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

<xsl:template match="numlist/item" priority="13">
  <table border="0" cellpadding="0" cellspacing="0" style="table-layout: fixed; " class=" x-item-18-0 x--zero-left-margins">
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

<xsl:template match="unlist/item" priority="12">
  <table border="0" cellpadding="0" cellspacing="0" style="table-layout: fixed; " class=" x-item-19-0 x--zero-left-margins">
    <xsl:call-template name="t-base-step-table">
      <xsl:with-param name="col1-width" select="'0em'"/>
      <xsl:with-param name="col2-width" select="'15pt'"/>
      <xsl:with-param name="col3-width" select="''"/>
      <xsl:with-param name="label-col"  select="'2'"/>
      <xsl:with-param name="col2-align" select="'left'"/>
      <xsl:with-param name="apply"      select="'&lib-gentxt;'"/>
    </xsl:call-template>
  </table>
</xsl:template>

<xsl:template match="prclist4/item" priority="11">
  <table border="0" cellpadding="0" cellspacing="0" style="table-layout: fixed; " class=" x-item-20-0 x--zero-left-margins">
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

<xsl:template match="prclist3/item" priority="10">
  <table border="0" cellpadding="0" cellspacing="0" style="table-layout: fixed; " class=" x-item-21-0 x--zero-left-margins">
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

<xsl:template match="prclist2/item" priority="9">
  <table border="0" cellpadding="0" cellspacing="0" style="table-layout: fixed; " class=" x-item-22-0 x--zero-left-margins">
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

<xsl:template match="prclist1/item" priority="8">
  <table border="0" cellpadding="0" cellspacing="0" style="table-layout: fixed; " class=" x-item-23-0 x--zero-left-margins">
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

<xsl:template match="list4/item" priority="7">
  <table border="0" cellpadding="0" cellspacing="0" style="table-layout: fixed; " class=" x-item-24-0 x--zero-left-margins">
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

<xsl:template match="list3/item" priority="6">
  <table border="0" cellpadding="0" cellspacing="0" style="table-layout: fixed; " class=" x-item-25-0 x--zero-left-margins">
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

<xsl:template match="list2/item" priority="5">
  <table border="0" cellpadding="0" cellspacing="0" style="table-layout: fixed; " class=" x-item-26-0 x--zero-left-margins">
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

<xsl:template match="list1/item" priority="4">
  <table border="0" cellpadding="0" cellspacing="0" style="table-layout: fixed; " class=" x-item-27-0 x--zero-left-margins">
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

<xsl:template match="list/item" priority="3">
  <table border="0" cellpadding="0" cellspacing="0" class=" x-item-28-0 x--zero-left-margins">
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

<xsl:template match="enumlist/item" priority="2">
  <table border="0" cellpadding="0" cellspacing="0" class=" x-item-29-0 x--zero-left-margins">
    <xsl:call-template name="t-base-step-table">
      <xsl:with-param name="col1-width" select="'0pt'"/>
      <xsl:with-param name="col2-width" select="''"/>
      <xsl:with-param name="col3-width" select="'100%'"/>
      <xsl:with-param name="label-col"  select="'2'"/>
      <xsl:with-param name="col2-align" select="'left'"/>
      <xsl:with-param name="apply"      select="'&lib-gentxt;'"/>
    </xsl:call-template>
  </table>
</xsl:template>

<xsl:template match="bullist/item" priority="1">
  <table border="0" cellpadding="0" cellspacing="0" style="table-layout: fixed; " class=" x-item-30-0 x--zero-left-margins">
    <xsl:call-template name="t-base-step-table">
      <xsl:with-param name="col1-width" select="'0em'"/>
      <xsl:with-param name="col2-width" select="'15pt'"/>
      <xsl:with-param name="col3-width" select="''"/>
      <xsl:with-param name="label-col"  select="'2'"/>
      <xsl:with-param name="col2-align" select="'left'"/>
      <xsl:with-param name="apply"      select="'&lib-gentxt;'"/>
    </xsl:call-template>
  </table>
</xsl:template>

<xsl:template match="item" priority="0">
  <table border="0" cellpadding="0" cellspacing="0" class=" x-item-31-0 x--zero-left-margins">
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

<xsl:template match="item-nbr" priority="0">
  <div class=" x-item-nbr-1-0">
    <xsl:call-template name="t-base-div-basic"/>
  </div>
</xsl:template>

<xsl:template match="figure/key" priority="20">
      <div xmlns:dmp="http://www.arbortext.com/namespace/dmp/dmpmap">
         <span>
            <xsl:attribute name="onClick">
               <xsl:text>toggle('</xsl:text>
               <xsl:text>styler-id</xsl:text>
               <xsl:apply-templates mode="set-id" select="."/>
               <xsl:text>',</xsl:text>
               <xsl:text>'</xsl:text>
               <xsl:text>styler-id</xsl:text>
               <xsl:apply-templates mode="set-id" select="."/>
               <xsl:text>');</xsl:text>
            </xsl:attribute>
            <img alt="key" src="_templates/frame/images/keytofigure.jpg" style="border-style:none;"/>
         </span>
      </div>
      <div xmlns:dmp="http://www.arbortext.com/namespace/dmp/dmpmap" style="display:none">
         <!--Emit class values to reflect conditions-->
         <xsl:attribute name="class">
            <xsl:text> x-key-1-0</xsl:text>
         </xsl:attribute>
         <xsl:copy-of select="@ch:*"/>
         <xsl:copy-of select="@dmp:*"/>
         <xsl:attribute name="id">
            <xsl:text>styler-id</xsl:text>
            <xsl:apply-templates mode="set-id" select="."/>
         </xsl:attribute>
         <!--Process this element's content-->
         <xsl:apply-templates/>
      </div>
      <script language="javascript" type="text/javascript"> function
toggle (heading, tableId) { var headingObj = document.getElementById(heading);
var tableObj = document.getElementById(tableId);       if (tableObj)
{         if (tableObj.style.display == 'block') {              tableObj.style.display='none';
                  headingObj.style.cursor='s-resize';            
} else {                tableObj.style.display='block';          
        headingObj.style.cursor='n-resize';             }     } } </script>
   </xsl:template>

<xsl:template match="key" priority="0">
  <div class=" x-key-2-0">
    <xsl:call-template name="t-base-div-basic"/>
  </div>
</xsl:template>

<xsl:template match="para/list" priority="1">
  <div class=" x-list-1-0">
    <xsl:call-template name="t-base-div-basic"/>
  </div>
</xsl:template>

<xsl:template match="list" priority="0">
  <div class=" x-list-2-0">
    <xsl:call-template name="t-base-div-basic"/>
  </div>
</xsl:template>

<xsl:template match="lof" priority="0">
  <div class=" x-lof-1-0">
    <xsl:copy-of select="@ch:*"/>
    <xsl:if test="concat(parent::*[@object-key][1]/@object-key, '.lof')!=''">
      <xsl:attribute name="ch:filename">
        <xsl:value-of select="concat(parent::*[@object-key][1]/@object-key, '.lof')"/>
      </xsl:attribute>
      <xsl:attribute name="ch:namepriority">0</xsl:attribute>
    </xsl:if>
    <xsl:call-template name="maybe-set-id">
      <xsl:with-param name="only-if-id-attr" select="'no'"/>
    </xsl:call-template>
    <xsl:apply-templates/>
  </div>
</xsl:template>

<xsl:template match="lof-item" priority="0">
  <div class=" x-lof-item-1-0">
    <xsl:call-template name="t-base-div-basic2"/>
  </div>
</xsl:template>

<xsl:template match="lot" priority="0">
  <div class=" x-lot-1-0">
    <xsl:copy-of select="@ch:*"/>
    <xsl:if test="concat(parent::*[@object-key][1]/@object-key, '.lot')!=''">
      <xsl:attribute name="ch:filename">
        <xsl:value-of select="concat(parent::*[@object-key][1]/@object-key, '.lot')"/>
      </xsl:attribute>
      <xsl:attribute name="ch:namepriority">0</xsl:attribute>
    </xsl:if>
    <xsl:call-template name="maybe-set-id">
      <xsl:with-param name="only-if-id-attr" select="'no'"/>
    </xsl:call-template>
    <xsl:call-template name="t-base-pwcmetainfo"/>
    <xsl:call-template name="t-base-pwcbannerinfo"/>
    <xsl:apply-templates/>
  </div>
</xsl:template>

<xsl:template match="lot-item" priority="0">
  <div class=" x-lot-item-1-0">
    <xsl:call-template name="t-base-div-basic2"/>
  </div>
</xsl:template>

<xsl:template match="maint-level" priority="0">
  <xsl:apply-templates/>
</xsl:template>

<xsl:template match="manual-pn" priority="0">
  <div class=" x-manual-pn-1-0">
    <xsl:call-template name="t-base-div-basic"/>
  </div>
</xsl:template>

<xsl:template match="pbfmatr/manual-title" priority="3">
  <div ch:title="notoc" class=" x-manual-title-1-0">
    <xsl:call-template name="t-base-div-title"/>
  </div>
</xsl:template>

<xsl:template match="pwcspblist/manual-title" priority="2">
  <div ch:title="notoc" class=" x-manual-title-2-0">
    <xsl:call-template name="t-base-div-title"/>
  </div>
</xsl:template>

<xsl:template match="pgblk/manual-title" priority="1">
  <div ch:title="notoc" class=" x-manual-title-3-0">
    <xsl:call-template name="t-base-div-title"/>
  </div>
</xsl:template>

<xsl:template match="manual-title" priority="0">
  <div ch:title="toc" class=" x-manual-title-4-0">
    <xsl:call-template name="t-base-div-title"/>
  </div>
</xsl:template>

<xsl:template match="marker" priority="0">
      <span>
         <!--Emit class values to reflect conditions-->
         <xsl:attribute name="class">
            <xsl:text> x-marker-1-0</xsl:text>
         </xsl:attribute>
         <xsl:if test="@xml:lang">
            <xsl:attribute name="lang">
               <xsl:call-template name="return-lang-applying-language-map">
                  <xsl:with-param name="doclang" select="@xml:lang"/>
               </xsl:call-template>
            </xsl:attribute>
         </xsl:if>
         <xsl:copy-of select="@ch:*"/>
         <xsl:copy-of xmlns:dmp="http://www.arbortext.com/namespace/dmp/dmpmap" select="@dmp:*"/>
         <xsl:if test="@xml:lang">
            <xsl:attribute name="lang">
               <xsl:call-template name="return-lang-applying-language-map">
                  <xsl:with-param name="doclang" select="@xml:lang"/>
               </xsl:call-template>
            </xsl:attribute>
         </xsl:if>
         <xsl:call-template name="maybe-set-id"/>
         <!--Process this element's content-->
         <xsl:apply-templates/>
      </span>
   </xsl:template>

<xsl:template name="__style-for_model.1">
      <xsl:text> .x-model-1-0 {margin-left: 0pt; margin-right: 0pt; text-indent: 0pt; font-weight: bold; font-size: 18pt; text-align: center; }</xsl:text>
   </xsl:template>

<xsl:template match="model" priority="0">
      <div>
         <!--Emit class values to reflect conditions-->
         <xsl:attribute name="class">
            <xsl:text> x-model-1-0</xsl:text>
         </xsl:attribute>
         <xsl:if test="@xml:lang">
            <xsl:attribute name="lang">
               <xsl:call-template name="return-lang-applying-language-map">
                  <xsl:with-param name="doclang" select="@xml:lang"/>
               </xsl:call-template>
            </xsl:attribute>
         </xsl:if>
         <xsl:copy-of select="@ch:*"/>
         <xsl:copy-of xmlns:dmp="http://www.arbortext.com/namespace/dmp/dmpmap" select="@dmp:*"/>
         <xsl:if test="@xml:lang">
            <xsl:attribute name="lang">
               <xsl:call-template name="return-lang-applying-language-map">
                  <xsl:with-param name="doclang" select="@xml:lang"/>
               </xsl:call-template>
            </xsl:attribute>
         </xsl:if>
         <xsl:call-template name="maybe-set-id"/>
         <!--Process this element's content-->
         <xsl:apply-templates/>
      </div>
   </xsl:template>

<xsl:template name="__style-for_module.1">
      <xsl:text> .x-module-1-0 {margin-left: 0pt; margin-right: 0pt; text-indent: 0pt; } .x-module-1-1 {} .x-module-1-2 {} .x-module-1-3 {} .x-module-1-4 {}</xsl:text>
   </xsl:template>

<xsl:template match="module" priority="0">
      <xsl:variable name="foClass">division</xsl:variable>
      <xsl:variable name="blockness">block</xsl:variable>
      <xsl:variable name="startnew"/>
      <xsl:variable name="newpageset">#noChange</xsl:variable>
      <div>
         <!--Emit class values to reflect conditions-->
         <xsl:attribute name="class">
            <xsl:text> x-module-1-0</xsl:text>
            <xsl:if test="(ancestor-or-self::page-block[1]/@pb-name and string(ancestor-or-self::page-block[1]/@pb-name)='trlist') and (not(ancestor-or-self::page-block[1]/pageblock-title)) and (not(./title))"> x-module-1-1</xsl:if>
            <xsl:if test="not((ancestor-or-self::page-block[1]/@pb-name and string(ancestor-or-self::page-block[1]/@pb-name)='trlist') and (not(ancestor-or-self::page-block[1]/pageblock-title)) and (not(./title))) and ((ancestor-or-self::page-block[1]/@pb-name and string(ancestor-or-self::page-block[1]/@pb-name)='sblist') and (not(ancestor-or-self::page-block[1]/pageblock-title)) and (not(./title)))"> x-module-1-2</xsl:if>
            <xsl:if test="not((ancestor-or-self::page-block[1]/@pb-name and string(ancestor-or-self::page-block[1]/@pb-name)='trlist') and (not(ancestor-or-self::page-block[1]/pageblock-title)) and (not(./title))) and not((ancestor-or-self::page-block[1]/@pb-name and string(ancestor-or-self::page-block[1]/@pb-name)='sblist') and (not(ancestor-or-self::page-block[1]/pageblock-title)) and (not(./title))) and ((ancestor-or-self::page-block[1]/@pb-name and string(ancestor-or-self::page-block[1]/@pb-name)='spblist') and (not(ancestor-or-self::page-block[1]/pageblock-title)) and (not(./title)))"> x-module-1-3</xsl:if>
            <xsl:if test="not((ancestor-or-self::page-block[1]/@pb-name and string(ancestor-or-self::page-block[1]/@pb-name)='trlist') and (not(ancestor-or-self::page-block[1]/pageblock-title)) and (not(./title))) and not((ancestor-or-self::page-block[1]/@pb-name and string(ancestor-or-self::page-block[1]/@pb-name)='sblist') and (not(ancestor-or-self::page-block[1]/pageblock-title)) and (not(./title))) and not((ancestor-or-self::page-block[1]/@pb-name and string(ancestor-or-self::page-block[1]/@pb-name)='spblist') and (not(ancestor-or-self::page-block[1]/pageblock-title)) and (not(./title))) and ((ancestor-or-self::page-block[1]/@pb-name and string(ancestor-or-self::page-block[1]/@pb-name)='pdlist') and (not(ancestor-or-self::page-block[1]/pageblock-title)) and (not(./title)))"> x-module-1-4</xsl:if>
         </xsl:attribute>
         <xsl:if test="@xml:lang">
            <xsl:attribute name="lang">
               <xsl:call-template name="return-lang-applying-language-map">
                  <xsl:with-param name="doclang" select="@xml:lang"/>
               </xsl:call-template>
            </xsl:attribute>
         </xsl:if>
         <xsl:copy-of select="@ch:*"/>
         <xsl:copy-of xmlns:dmp="http://www.arbortext.com/namespace/dmp/dmpmap" select="@dmp:*"/>
         <xsl:variable name="Breaks-chunkFilenameXPath"/>
         <xsl:variable name="Breaks-persistentFilename"/>
         <xsl:if test="($Breaks-persistentFilename='yes') and ($Breaks-chunkFilenameXPath!='')">
            <xsl:variable name="chunkFilename"/>
            <xsl:if test="$chunkFilename!=''">
               <xsl:attribute name="ch:filename">
                  <xsl:value-of select="$chunkFilename"/>
               </xsl:attribute>
               <xsl:attribute name="ch:namepriority">0</xsl:attribute>
            </xsl:if>
         </xsl:if>
         <xsl:if test="@xml:lang">
            <xsl:attribute name="lang">
               <xsl:call-template name="return-lang-applying-language-map">
                  <xsl:with-param name="doclang" select="@xml:lang"/>
               </xsl:call-template>
            </xsl:attribute>
         </xsl:if>
         <xsl:call-template name="maybe-set-id">
            <xsl:with-param name="only-if-id-attr" select="'no'"/>
            <xsl:with-param name="generated-id-prefix" select="'styler-id'"/>
         </xsl:call-template>
         <!--Process this element's content-->
         <xsl:apply-templates/>
      </div>
   </xsl:template>

<xsl:template name="__style-for_module-item.1">
      <xsl:text> .x-module-item-1-0 {margin-left: 0pt; margin-right: 0pt; }</xsl:text>
   </xsl:template>

<xsl:template match="module-item" priority="0">
      <!--Emit a nostyle template-->
      <xsl:apply-templates/>
   </xsl:template>

<xsl:template name="__style-for_multi.1">
      <xsl:text> .x-multi-1-0 {margin-left: 0pt; margin-right: 0pt; }</xsl:text>
   </xsl:template>

<xsl:template match="multi" priority="0">
      <!--Emit a nostyle template-->
      <xsl:apply-templates/>
   </xsl:template>

<xsl:template name="__style-for_n-para.1">
      <xsl:text> .x-n-para-1-0 {margin-left: 0pt; margin-right: 0pt; text-indent: 0pt; margin-top: 8pt; }</xsl:text>
   </xsl:template>

<xsl:template match="n-para" priority="0">
      <div>
         <!--Emit class values to reflect conditions-->
         <xsl:attribute name="class">
            <xsl:text> x-n-para-1-0</xsl:text>
         </xsl:attribute>
         <xsl:if test="@xml:lang">
            <xsl:attribute name="lang">
               <xsl:call-template name="return-lang-applying-language-map">
                  <xsl:with-param name="doclang" select="@xml:lang"/>
               </xsl:call-template>
            </xsl:attribute>
         </xsl:if>
         <xsl:copy-of select="@ch:*"/>
         <xsl:copy-of xmlns:dmp="http://www.arbortext.com/namespace/dmp/dmpmap" select="@dmp:*"/>
         <xsl:if test="@xml:lang">
            <xsl:attribute name="lang">
               <xsl:call-template name="return-lang-applying-language-map">
                  <xsl:with-param name="doclang" select="@xml:lang"/>
               </xsl:call-template>
            </xsl:attribute>
         </xsl:if>
         <xsl:call-template name="maybe-set-id">
            <xsl:with-param name="only-if-id-attr" select="'no'"/>
            <xsl:with-param name="generated-id-prefix" select="'styler-id'"/>
         </xsl:call-template>
         <!--Process this element's content-->
         <xsl:apply-templates/>
      </div>
   </xsl:template>

<xsl:template name="__style-for_no-street.1">
      <xsl:text> .x-no-street-1-0 {margin-left: 0pt; margin-right: 0pt; text-indent: 0pt; }</xsl:text>
   </xsl:template>

<xsl:template match="no-street" priority="0">
      <div>
         <!--Emit class values to reflect conditions-->
         <xsl:attribute name="class">
            <xsl:text> x-no-street-1-0</xsl:text>
         </xsl:attribute>
         <xsl:if test="@xml:lang">
            <xsl:attribute name="lang">
               <xsl:call-template name="return-lang-applying-language-map">
                  <xsl:with-param name="doclang" select="@xml:lang"/>
               </xsl:call-template>
            </xsl:attribute>
         </xsl:if>
         <xsl:copy-of select="@ch:*"/>
         <xsl:copy-of xmlns:dmp="http://www.arbortext.com/namespace/dmp/dmpmap" select="@dmp:*"/>
         <xsl:if test="@xml:lang">
            <xsl:attribute name="lang">
               <xsl:call-template name="return-lang-applying-language-map">
                  <xsl:with-param name="doclang" select="@xml:lang"/>
               </xsl:call-template>
            </xsl:attribute>
         </xsl:if>
         <xsl:call-template name="maybe-set-id"/>
         <!--Process this element's content-->
         <xsl:apply-templates/>
      </div>
   </xsl:template>

<xsl:template name="__style-for_nobrk.1">
      <xsl:text> .x-nobrk-1-0 {margin-left: 0pt; margin-right: 0pt; }</xsl:text>
   </xsl:template>

<xsl:template match="nobrk" priority="0">
      <span>
         <!--Emit class values to reflect conditions-->
         <xsl:attribute name="class">
            <xsl:text> x-nobrk-1-0</xsl:text>
         </xsl:attribute>
         <xsl:if test="@xml:lang">
            <xsl:attribute name="lang">
               <xsl:call-template name="return-lang-applying-language-map">
                  <xsl:with-param name="doclang" select="@xml:lang"/>
               </xsl:call-template>
            </xsl:attribute>
         </xsl:if>
         <xsl:copy-of select="@ch:*"/>
         <xsl:copy-of xmlns:dmp="http://www.arbortext.com/namespace/dmp/dmpmap" select="@dmp:*"/>
         <xsl:if test="@xml:lang">
            <xsl:attribute name="lang">
               <xsl:call-template name="return-lang-applying-language-map">
                  <xsl:with-param name="doclang" select="@xml:lang"/>
               </xsl:call-template>
            </xsl:attribute>
         </xsl:if>
         <xsl:call-template name="maybe-set-id"/>
         <!--Process this element's content-->
         <xsl:apply-templates/>
      </span>
   </xsl:template>

<xsl:template name="__style-for__ufe-not-applicable.1">
      <xsl:text> .x--ufe-not-applicable-1-0 {margin-left: 0pt; margin-right: 0pt; text-indent: 0pt; margin-top: 8pt; margin-left: 18pt; text-indent: 0pt; }</xsl:text>
   </xsl:template>

<xsl:template match="_ufe:not-applicable" priority="0">
      <div>
         <!--Emit class values to reflect conditions-->
         <xsl:attribute name="class">
            <xsl:text> x--ufe-not-applicable-1-0</xsl:text>
         </xsl:attribute>
         <xsl:if test="@xml:lang">
            <xsl:attribute name="lang">
               <xsl:call-template name="return-lang-applying-language-map">
                  <xsl:with-param name="doclang" select="@xml:lang"/>
               </xsl:call-template>
            </xsl:attribute>
         </xsl:if>
         <xsl:copy-of select="@ch:*"/>
         <xsl:copy-of xmlns:dmp="http://www.arbortext.com/namespace/dmp/dmpmap" select="@dmp:*"/>
         <xsl:if test="@xml:lang">
            <xsl:attribute name="lang">
               <xsl:call-template name="return-lang-applying-language-map">
                  <xsl:with-param name="doclang" select="@xml:lang"/>
               </xsl:call-template>
            </xsl:attribute>
         </xsl:if>
         <xsl:call-template name="maybe-set-id"/>
         <!--Process this element's content-->
         <xsl:apply-templates/>
      </div>
   </xsl:template>

<xsl:template name="__style-for_nowrap.1">
      <xsl:text> .x-nowrap-1-0 {margin-left:
0pt; margin-right: 0pt; }</xsl:text>
   </xsl:template>

<xsl:template match="nowrap" priority="0">
      <span style="white-space:nowrap">
         <!--Emit class values to reflect conditions-->
         <xsl:attribute name="class">
            <xsl:text> x-nowrap-1-0</xsl:text>
         </xsl:attribute>
         <xsl:if test="@xml:lang">
            <xsl:attribute name="lang">
               <xsl:call-template name="return-lang-applying-language-map">
                  <xsl:with-param name="doclang" select="@xml:lang"/>
               </xsl:call-template>
            </xsl:attribute>
         </xsl:if>
         <xsl:copy-of select="@ch:*"/>
         <xsl:copy-of xmlns:dmp="http://www.arbortext.com/namespace/dmp/dmpmap" select="@dmp:*"/>
         <xsl:if test="@xml:lang">
            <xsl:attribute name="lang">
               <xsl:call-template name="return-lang-applying-language-map">
                  <xsl:with-param name="doclang" select="@xml:lang"/>
               </xsl:call-template>
            </xsl:attribute>
         </xsl:if>
         <xsl:call-template name="maybe-set-id"/>
         <!--Process this element's content-->
         <xsl:apply-templates> </xsl:apply-templates>
      </span>
   </xsl:template>

<xsl:template name="__style-for__ufe-npara-numbering.3atpang601">
      <xsl:text> .x--ufe-npara-numbering-1-0 {margin-left: 0pt; margin-right: 0pt; text-decoration: no-underline ; text-indent: -0pt; }</xsl:text>
   </xsl:template>

<xsl:template match="ata-page-block//_sfe:BeforeOrAfterText//_ufe:npara-numbering" priority="2">
      <span>
         <!--Emit class values to reflect conditions-->
         <xsl:attribute name="class">
            <xsl:text> x--ufe-npara-numbering-1-0</xsl:text>
         </xsl:attribute>
         <xsl:if test="@xml:lang">
            <xsl:attribute name="lang">
               <xsl:call-template name="return-lang-applying-language-map">
                  <xsl:with-param name="doclang" select="@xml:lang"/>
               </xsl:call-template>
            </xsl:attribute>
         </xsl:if>
         <xsl:copy-of select="@ch:*"/>
         <xsl:copy-of xmlns:dmp="http://www.arbortext.com/namespace/dmp/dmpmap" select="@dmp:*"/>
         <xsl:if test="@xml:lang">
            <xsl:attribute name="lang">
               <xsl:call-template name="return-lang-applying-language-map">
                  <xsl:with-param name="doclang" select="@xml:lang"/>
               </xsl:call-template>
            </xsl:attribute>
         </xsl:if>
         <xsl:call-template name="maybe-set-id"/>
         <!--Process this element's content-->
         <xsl:apply-templates/>
      </span>
   </xsl:template>

<xsl:template name="__style-for__ufe-npara-numbering.3pa-bng562">
      <xsl:text> .x--ufe-npara-numbering-2-0 {margin-left: 0pt; margin-right: 0pt; text-decoration: no-underline ; text-indent: -0pt; }</xsl:text>
   </xsl:template>

<xsl:template match="page-block//_sfe:BeforeOrAfterText//_ufe:npara-numbering" priority="1">
      <span>
         <!--Emit class values to reflect conditions-->
         <xsl:attribute name="class">
            <xsl:text> x--ufe-npara-numbering-2-0</xsl:text>
         </xsl:attribute>
         <xsl:if test="@xml:lang">
            <xsl:attribute name="lang">
               <xsl:call-template name="return-lang-applying-language-map">
                  <xsl:with-param name="doclang" select="@xml:lang"/>
               </xsl:call-template>
            </xsl:attribute>
         </xsl:if>
         <xsl:copy-of select="@ch:*"/>
         <xsl:copy-of xmlns:dmp="http://www.arbortext.com/namespace/dmp/dmpmap" select="@dmp:*"/>
         <xsl:if test="@xml:lang">
            <xsl:attribute name="lang">
               <xsl:call-template name="return-lang-applying-language-map">
                  <xsl:with-param name="doclang" select="@xml:lang"/>
               </xsl:call-template>
            </xsl:attribute>
         </xsl:if>
         <xsl:call-template name="maybe-set-id"/>
         <!--Process this element's content-->
         <xsl:apply-templates/>
      </span>
   </xsl:template>

<xsl:template name="__style-for__ufe-npara-numbering.3_unpng203">
      <xsl:text> .x--ufe-npara-numbering-3-0 {margin-left: 0pt; margin-right: 0pt; }</xsl:text>
   </xsl:template>

<xsl:template match="_ufe:npara-numbering" priority="0">
      <span>
         <!--Emit class values to reflect conditions-->
         <xsl:attribute name="class">
            <xsl:text> x--ufe-npara-numbering-3-0</xsl:text>
         </xsl:attribute>
         <xsl:if test="@xml:lang">
            <xsl:attribute name="lang">
               <xsl:call-template name="return-lang-applying-language-map">
                  <xsl:with-param name="doclang" select="@xml:lang"/>
               </xsl:call-template>
            </xsl:attribute>
         </xsl:if>
         <xsl:copy-of select="@ch:*"/>
         <xsl:copy-of xmlns:dmp="http://www.arbortext.com/namespace/dmp/dmpmap" select="@dmp:*"/>
         <xsl:if test="@xml:lang">
            <xsl:attribute name="lang">
               <xsl:call-template name="return-lang-applying-language-map">
                  <xsl:with-param name="doclang" select="@xml:lang"/>
               </xsl:call-template>
            </xsl:attribute>
         </xsl:if>
         <xsl:call-template name="maybe-set-id"/>
         <!--Process this element's content-->
         <xsl:apply-templates/>
      </span>
   </xsl:template>

<xsl:template name="__style-for_num.1">
      <xsl:text> .x-num-1-0 {margin-left: 0pt; margin-right: 0pt; text-indent: 0pt; text-align: center; }</xsl:text>
   </xsl:template>

<xsl:template match="num" priority="0">
      <div>
         <!--Emit class values to reflect conditions-->
         <xsl:attribute name="class">
            <xsl:text> x-num-1-0</xsl:text>
         </xsl:attribute>
         <xsl:if test="@xml:lang">
            <xsl:attribute name="lang">
               <xsl:call-template name="return-lang-applying-language-map">
                  <xsl:with-param name="doclang" select="@xml:lang"/>
               </xsl:call-template>
            </xsl:attribute>
         </xsl:if>
         <xsl:copy-of select="@ch:*"/>
         <xsl:copy-of xmlns:dmp="http://www.arbortext.com/namespace/dmp/dmpmap" select="@dmp:*"/>
         <xsl:if test="@xml:lang">
            <xsl:attribute name="lang">
               <xsl:call-template name="return-lang-applying-language-map">
                  <xsl:with-param name="doclang" select="@xml:lang"/>
               </xsl:call-template>
            </xsl:attribute>
         </xsl:if>
         <xsl:call-template name="maybe-set-id"/>
         <!--Process this element's content-->
         <xsl:apply-templates/>
      </div>
   </xsl:template>

<xsl:template name="__style-for_num-index.1">
      <xsl:text> .x-num-index-1-0
{margin-left: 0pt; margin-right: 0pt; text-indent: 0pt; margin-top:
8pt; }</xsl:text>
   </xsl:template>

<xsl:template match="num-index" priority="0">
      <div>
         <!--Emit class values to reflect conditions-->
         <xsl:attribute name="class">
            <xsl:text> x-num-index-1-0</xsl:text>
         </xsl:attribute>
         <xsl:if test="@xml:lang">
            <xsl:attribute name="lang">
               <xsl:call-template name="return-lang-applying-language-map">
                  <xsl:with-param name="doclang" select="@xml:lang"/>
               </xsl:call-template>
            </xsl:attribute>
         </xsl:if>
         <xsl:copy-of select="@ch:*"/>
         <xsl:copy-of xmlns:dmp="http://www.arbortext.com/namespace/dmp/dmpmap" select="@dmp:*"/>
         <xsl:if test="@xml:lang">
            <xsl:attribute name="lang">
               <xsl:call-template name="return-lang-applying-language-map">
                  <xsl:with-param name="doclang" select="@xml:lang"/>
               </xsl:call-template>
            </xsl:attribute>
         </xsl:if>
         <xsl:call-template name="maybe-set-id">
            <xsl:with-param name="only-if-id-attr" select="'no'"/>
            <xsl:with-param name="generated-id-prefix" select="'styler-id'"/>
         </xsl:call-template>
         <div id="pwcmetainfo" style="display:none">
            <?Pub Dtl?>
            <div id="chapter">
               <xsl:choose>
                  <xsl:when test="ancestor::frontmatter">frontmatter</xsl:when>
                  <xsl:otherwise>
                     <xsl:value-of select="@chapter"/>
                  </xsl:otherwise>
               </xsl:choose>
            </div>
            <div id="section">
               <xsl:choose>
                  <xsl:when test="ancestor::frontmatter">frontmatter</xsl:when>
                  <xsl:otherwise>
                     <xsl:value-of select="@section"/>
                  </xsl:otherwise>
               </xsl:choose>
            </div>
            <div id="subject">
               <xsl:choose>
                  <xsl:when test="ancestor::frontmatter">frontmatter</xsl:when>
                  <xsl:otherwise>
                     <xsl:value-of select="@subject"/>
                  </xsl:otherwise>
               </xsl:choose>
            </div>
            <div id="pbn">
               <xsl:value-of select="@pb-name"/>
            </div>
            <div id="pb-title">
               <xsl:value-of select="@pb-title"/>
            </div>
            <div id="pointRev">
               <xsl:value-of select="ancestor::book/@point-revnbr"/>
            </div>
            <div id="ModelNo">
               <xsl:value-of select="ancestor::book/@model"/>
            </div>
            <div id="ManualServiceBulletinNo">
               <xsl:value-of select="ancestor::book/@manualpnr"/>
            </div>
            <div id="RevNo">
               <xsl:value-of select="ancestor::book/@revnbr"/>
            </div>
            <div id="IssueRevisionDate">
               <xsl:value-of select="ancestor::book/@revdate"/>
            </div>
            <div id="manualType">
               <xsl:value-of select="ancestor::book/@doctype"/>
            </div>
            <div id="engineFamily">
               <xsl:value-of select="ancestor::book/@family"/>
            </div>
         </div>
         <div id="pwcbannerinfo" style="display:none">
            <?Pub Dtl?>
            <div id="manualTitle">
               <xsl:choose>
                  <xsl:when test="ancestor::book[contains(@doctype,'epc')]//page-block[@pb-name='title-page']">ILLUSTRATED PARTS CATALOG</xsl:when>
                  <xsl:when test="ancestor::book[contains(@doctype,'tmm')]//page-block[@pb-name='title-page']">MAINTENANCE MANUAL</xsl:when>
                  <xsl:when test="ancestor::book[contains(@doctype,'lmm')]//page-block[@pb-name='title-page']">LINE MAINTENANCE MANUAL</xsl:when>
                  <xsl:when test="ancestor::book[contains(@doctype,'em')]//page-block[@pb-name='title-page']">OVERHAUL MANUAL</xsl:when>
                  <xsl:when test="ancestor::book[contains(@doctype,'cir')]//page-block[@pb-name='title-page']">CLEANING INSPECTION REPAIR (CIR) MANUAL</xsl:when>
                  <xsl:otherwise>
                     <xsl:value-of select="//page-block[@pb-name='title-page'][1]/module/title-page/manual-title"/>
                  </xsl:otherwise>
               </xsl:choose>
            </div>
            <div id="engine">
               <xsl:choose>
                  <xsl:when test="ancestor::book[contains(@doctype,'epc')]//page-block[@pb-name='title-page']">
                     <xsl:text>Model(s) </xsl:text><xsl:value-of select="//page-block[@pb-name='title-page'][1]/module/pwc-title/pwc-model/modelspec"/>
                  </xsl:when>
                  <xsl:when test="ancestor::book[contains(@doctype,'tmm')]//page-block[@pb-name='title-page']">
                     <xsl:text>Model(s) </xsl:text><xsl:value-of select="//page-block[@pb-name='title-page'][1]/module/mfmatr/pwcem-title/@model"/>
                  </xsl:when>
                  <xsl:when test="ancestor::book[contains(@doctype,'lmm')]//page-block[@pb-name='title-page']">
                     <xsl:text>Model(s) </xsl:text><xsl:value-of select="//page-block[@pb-name='title-page'][1]/module/mfmatr/pwclmm-title/@model"/>
                  </xsl:when>
                  <xsl:when test="ancestor::book[contains(@doctype,'em')]//page-block[@pb-name='title-page']">
                     <xsl:text>Model(s) </xsl:text><xsl:value-of select="//page-block[@pb-name='title-page'][1]/module/mfmatr/pwcem-title/@model"/>
                  </xsl:when>
                  <xsl:when test="ancestor::book[contains(@doctype,'cir')]//page-block[@pb-name='title-page']">
                     <xsl:text>Model(s) </xsl:text><xsl:value-of select="//page-block[@pb-name='title-page'][1]/module/mfmatr/pwcem-title/@model"/>
                  </xsl:when>
                  <xsl:otherwise>
                     <xsl:value-of select="//page-block[@pb-name='title-page'][1]/module/title-page/model"/>
                  </xsl:otherwise>
               </xsl:choose>
            </div>
            <div id="manualPn">
               <xsl:choose>
                  <xsl:when test="ancestor::book[contains(@doctype,'epc')]">
                     <xsl:text>Manual Part No. </xsl:text>
                     <xsl:value-of select="ancestor::book/@manualpnr"/>
                  </xsl:when>
                  <xsl:when test="ancestor::book[contains(@doctype,'tmm')]">
                     <xsl:text>Manual Part No. </xsl:text>
                     <xsl:value-of select="ancestor::book/@manualpnr"/>
                  </xsl:when>
                  <xsl:when test="ancestor::book[contains(@doctype,'lmm')]">
                     <xsl:text>Manual Part No. </xsl:text>
                     <xsl:value-of select="ancestor::book/@manualpnr"/>
                  </xsl:when>
                  <xsl:when test="ancestor::book[contains(@doctype,'em')]">
                     <xsl:text>Manual Part No. </xsl:text>
                     <xsl:value-of select="ancestor::book/@manualpnr"/>
                  </xsl:when>
                  <xsl:when test="ancestor::book[contains(@doctype,'cir')]">
                     <xsl:text>Manual Part No. </xsl:text>
                     <xsl:value-of select="ancestor::book/@manualpnr"/>
                  </xsl:when>
                  <xsl:otherwise>
                     <xsl:value-of select="//page-block[@pb-name='title-page'][1]/module/title-page/manual-pn"/>
                  </xsl:otherwise>
               </xsl:choose>
            </div>
            <div id="pointRev">
               <xsl:value-of select="ancestor::book/@point-revnbr"/>
            </div>
            <div id="revision">
               <xsl:value-of select="ancestor::book/@revnbr"/>
            </div>
            <div id="revDate">
               <xsl:value-of select="ancestor::book/@revdate"/>
            </div>
         </div>
         <!--Process this element's content-->
         <xsl:apply-templates> </xsl:apply-templates>
      </div>
   </xsl:template>

<xsl:template name="__style-for__ufe-num-index-title.4pgk_le261">
      <xsl:text> .x--ufe-num-index-title-1-0 {margin-left: 0pt; margin-right: 0pt; text-indent: 0pt; font-family: sans-serif; color: #0000FF; text-align: left; line-height: 1.1; margin-top: 1.5em; margin-bottom: 1em; margin-left: 0pt; text-indent: 0pt; }</xsl:text>
   </xsl:template>

<xsl:template match="pgblk/_ufe:num-index-title" priority="3">
  <div ch:title="notoc" class=" x--ufe-num-index-title-1-0">
    <xsl:call-template name="t-base-div-title"/>
  </div>
</xsl:template>

<xsl:template match="pbfmatr/_ufe:num-index-title" priority="2">
  <div ch:title="notoc" class=" x--ufe-num-index-title-2-0">
    <xsl:call-template name="t-base-div-title"/>
  </div>
</xsl:template>

<xsl:template match="pwcspblist/_ufe:num-index-title" priority="1">
  <div ch:title="notoc" class=" x--ufe-num-index-title-3-0">
    <xsl:call-template name="t-base-div-title"/>
  </div>
</xsl:template>

<xsl:template name="__style-for_num-list.1">
      <xsl:text> .x-num-list-1-0 {margin-left: 0pt; margin-right: 0pt; text-indent: 0pt; margin-top: 8pt; }</xsl:text>
   </xsl:template>

<xsl:template match="num-list" priority="0">
      <div>
         <!--Emit class values to reflect conditions-->
         <xsl:attribute name="class">
            <xsl:text> x-num-list-1-0</xsl:text>
         </xsl:attribute>
         <xsl:if test="@xml:lang">
            <xsl:attribute name="lang">
               <xsl:call-template name="return-lang-applying-language-map">
                  <xsl:with-param name="doclang" select="@xml:lang"/>
               </xsl:call-template>
            </xsl:attribute>
         </xsl:if>
         <xsl:copy-of select="@ch:*"/>
         <xsl:copy-of xmlns:dmp="http://www.arbortext.com/namespace/dmp/dmpmap" select="@dmp:*"/>
         <xsl:if test="@xml:lang">
            <xsl:attribute name="lang">
               <xsl:call-template name="return-lang-applying-language-map">
                  <xsl:with-param name="doclang" select="@xml:lang"/>
               </xsl:call-template>
            </xsl:attribute>
         </xsl:if>
         <xsl:call-template name="maybe-set-id"/>
         <!--Process this element's content-->
         <xsl:apply-templates/>
      </div>
   </xsl:template>

<xsl:template name="__style-for__ufe-nut-option-title.4pgk_le271">
      <xsl:text> .x--ufe-nut-option-title-1-0 {margin-left: 0pt; margin-right: 0pt; text-indent: 0pt; font-family: sans-serif; color: #0000FF; text-align: left; line-height: 1.1; margin-top: 1.5em; margin-bottom: 1em; margin-left: 0pt; text-indent: 0pt; }</xsl:text>
   </xsl:template>

<xsl:template match="pgblk/_ufe:nut-option-title" priority="3">
  <div ch:title="notoc" class=" x--ufe-nut-option-title-1-0">
    <xsl:call-template name="t-base-div-title"/>
  </div>
</xsl:template>

<xsl:template match="pbfmatr/_ufe:nut-option-title" priority="2">
  <div ch:title="notoc" class=" x--ufe-nut-option-title-2-0">
    <xsl:call-template name="t-base-div-title"/>
  </div>
</xsl:template>

<xsl:template match="pwcspblist/_ufe:nut-option-title" priority="1">
  <div ch:title="notoc" class=" x--ufe-nut-option-title-3-0">
    <xsl:call-template name="t-base-div-title"/>
  </div>
</xsl:template>

<xsl:template name="__style-for_orig-date.1">
      <xsl:text> .x-orig-date-1-0 {margin-left: 0pt; margin-right: 0pt; text-indent: 0pt; font-size: 14pt; color: #666666; text-align: center; margin-bottom: 12pt; }</xsl:text>
   </xsl:template>

<xsl:template match="orig-date" priority="0">
      <div>
         <!--Emit class values to reflect conditions-->
         <xsl:attribute name="class">
            <xsl:text> x-orig-date-1-0</xsl:text>
         </xsl:attribute>
         <xsl:if test="@xml:lang">
            <xsl:attribute name="lang">
               <xsl:call-template name="return-lang-applying-language-map">
                  <xsl:with-param name="doclang" select="@xml:lang"/>
               </xsl:call-template>
            </xsl:attribute>
         </xsl:if>
         <xsl:copy-of select="@ch:*"/>
         <xsl:copy-of xmlns:dmp="http://www.arbortext.com/namespace/dmp/dmpmap" select="@dmp:*"/>
         <xsl:if test="@xml:lang">
            <xsl:attribute name="lang">
               <xsl:call-template name="return-lang-applying-language-map">
                  <xsl:with-param name="doclang" select="@xml:lang"/>
               </xsl:call-template>
            </xsl:attribute>
         </xsl:if>
         <xsl:call-template name="maybe-set-id"/>
         <!--Process this element's content-->
         <xsl:apply-templates/>
      </div>
   </xsl:template>

<xsl:template name="__style-for_page-block.7bopack661">
      <xsl:text> .x-page-block-1-0
{margin-left: 0pt; margin-right: 0pt; text-indent: 0pt; }</xsl:text>
   </xsl:template>

<xsl:template match="book[contains(@doctype, 'epc')]//page-block[@pb-name='title-page']" priority="6">
      <div>
         <!--Emit class values to reflect conditions-->
         <xsl:attribute name="class">
            <xsl:text> x-page-block-1-0</xsl:text>
         </xsl:attribute>
         <xsl:if test="@xml:lang">
            <xsl:attribute name="lang">
               <xsl:call-template name="return-lang-applying-language-map">
                  <xsl:with-param name="doclang" select="@xml:lang"/>
               </xsl:call-template>
            </xsl:attribute>
         </xsl:if>
         <xsl:copy-of select="@ch:*"/>
         <xsl:copy-of xmlns:dmp="http://www.arbortext.com/namespace/dmp/dmpmap" select="@dmp:*"/>
         <xsl:if test="@pb-name!=''">
            <xsl:attribute name="ch:filename">
               <xsl:value-of select="@pb-name"/>
            </xsl:attribute>
            <xsl:attribute name="ch:namepriority">0</xsl:attribute>
         </xsl:if>
         <xsl:if test="@xml:lang">
            <xsl:attribute name="lang">
               <xsl:call-template name="return-lang-applying-language-map">
                  <xsl:with-param name="doclang" select="@xml:lang"/>
               </xsl:call-template>
            </xsl:attribute>
         </xsl:if>
         <xsl:call-template name="maybe-set-id">
            <xsl:with-param name="only-if-id-attr" select="'no'"/>
            <xsl:with-param name="generated-id-prefix" select="'styler-id'"/>
         </xsl:call-template>
         <div id="pwcmetainfo" style="display:none">
            <div id="chapter">
               <xsl:choose>
                  <xsl:when test="ancestor::frontmatter">frontmatter</xsl:when>
                  <xsl:otherwise>
                     <xsl:value-of select="@chapter"/>
                  </xsl:otherwise>
               </xsl:choose>
            </div>
            <div id="section">
               <xsl:choose>
                  <xsl:when test="ancestor::frontmatter">frontmatter</xsl:when>
                  <xsl:otherwise>
                     <xsl:value-of select="@section"/>
                  </xsl:otherwise>
               </xsl:choose>
            </div>
            <div id="subject">
               <xsl:choose>
                  <xsl:when test="ancestor::frontmatter">frontmatter</xsl:when>
                  <xsl:otherwise>
                     <xsl:value-of select="@subject"/>
                  </xsl:otherwise>
               </xsl:choose>
            </div>
            <div id="pbn">
               <xsl:value-of select="@pb-name"/>
            </div>
            <div id="pb-title">
               <xsl:value-of select="@pb-title"/>
            </div>
            <div id="pointRev">
               <xsl:value-of select="ancestor::book/@point-revnbr"/>
            </div>
            <div id="ModelNo">
               <xsl:value-of select="ancestor::book/@model"/>
            </div>
            <div id="ManualServiceBulletinNo">
               <xsl:value-of select="ancestor::book/@manualpnr"/>
            </div>
            <div id="RevNo">
               <xsl:value-of select="ancestor::book/@revnbr"/>
            </div>
            <div id="IssueRevisionDate">
               <xsl:value-of select="ancestor::book/@revdate"/>
            </div>
            <div id="manualType">
               <xsl:value-of select="ancestor::book/@doctype"/>
            </div>
            <div id="engineFamily">
               <xsl:value-of select="ancestor::book/@family"/>
            </div>
         </div>
         <div id="pwcbannerinfo" style="display:none">
            <div id="manualTitle">
               <xsl:text>ILLUSTRATED PARTS CATALOG</xsl:text>
            </div>
            <div id="engine">
               <xsl:text>Model(s) </xsl:text><xsl:value-of select="./module/pwc-title/pwc-model/modelspec"/>
            </div>
            <div id="manualPn">
               <xsl:text>Manual Part No. </xsl:text><xsl:value-of select="ancestor::book/@manualpnr"/>
            </div>
            <div id="pointRev">
               <xsl:value-of select="ancestor::book/@point-revnbr"/>
            </div>
            <div id="revision">
               <xsl:value-of select="ancestor::book/@revnbr"/>
            </div>
            <div id="revDate">
               <xsl:value-of select="ancestor::book/@revdate"/>
            </div>
         </div>
         <!--Process this element's content-->
         <xsl:apply-templates> </xsl:apply-templates>
         <script type="text/javascript">addTableChangebars();</script>
         <script language="JavaScript" type="text/javascript">addChangebars();</script>
      </div>
   </xsl:template>

<xsl:template name="__style-for_page-block.11bopack662">
      <xsl:text> .x-page-block-2-0
{margin-left: 0pt; margin-right: 0pt; text-indent: 0pt; }</xsl:text>
   </xsl:template>

<xsl:template match="book[contains(@doctype, 'tmm')]//page-block[@pb-name='title-page']" priority="9">
      <div>
         <!--Emit class values to reflect conditions-->
         <xsl:attribute name="class">
            <xsl:text> x-page-block-2-0</xsl:text>
         </xsl:attribute>
         <xsl:if test="@xml:lang">
            <xsl:attribute name="lang">
               <xsl:call-template name="return-lang-applying-language-map">
                  <xsl:with-param name="doclang" select="@xml:lang"/>
               </xsl:call-template>
            </xsl:attribute>
         </xsl:if>
         <xsl:copy-of select="@ch:*"/>
         <xsl:copy-of xmlns:dmp="http://www.arbortext.com/namespace/dmp/dmpmap" select="@dmp:*"/>
         <xsl:if test="@pb-name!=''">
            <xsl:attribute name="ch:filename">
               <xsl:value-of select="@pb-name"/>
            </xsl:attribute>
            <xsl:attribute name="ch:namepriority">0</xsl:attribute>
         </xsl:if>
         <xsl:if test="@xml:lang">
            <xsl:attribute name="lang">
               <xsl:call-template name="return-lang-applying-language-map">
                  <xsl:with-param name="doclang" select="@xml:lang"/>
               </xsl:call-template>
            </xsl:attribute>
         </xsl:if>
         <xsl:call-template name="maybe-set-id">
            <xsl:with-param name="only-if-id-attr" select="'no'"/>
            <xsl:with-param name="generated-id-prefix" select="'styler-id'"/>
         </xsl:call-template>
         <div id="pwcmetainfo" style="display:none">
            <div id="chapter">
               <xsl:choose>
                  <xsl:when test="ancestor::frontmatter">frontmatter</xsl:when>
                  <xsl:otherwise>
                     <xsl:value-of select="@chapter"/>
                  </xsl:otherwise>
               </xsl:choose>
            </div>
            <div id="section">
               <xsl:choose>
                  <xsl:when test="ancestor::frontmatter">frontmatter</xsl:when>
                  <xsl:otherwise>
                     <xsl:value-of select="@section"/>
                  </xsl:otherwise>
               </xsl:choose>
            </div>
            <div id="subject">
               <xsl:choose>
                  <xsl:when test="ancestor::frontmatter">frontmatter</xsl:when>
                  <xsl:otherwise>
                     <xsl:value-of select="@subject"/>
                  </xsl:otherwise>
               </xsl:choose>
            </div>
            <div id="pbn">
               <xsl:value-of select="@pb-name"/>
            </div>
            <div id="pb-title">
               <xsl:value-of select="@pb-title"/>
            </div>
            <div id="pointRev">
               <xsl:value-of select="ancestor::book/@point-revnbr"/>
            </div>
            <div id="ModelNo">
               <xsl:value-of select="ancestor::book/@model"/>
            </div>
            <div id="ManualServiceBulletinNo">
               <xsl:value-of select="ancestor::book/@manualpnr"/>
            </div>
            <div id="RevNo">
               <xsl:value-of select="ancestor::book/@revnbr"/>
            </div>
            <div id="IssueRevisionDate">
               <xsl:value-of select="ancestor::book/@revdate"/>
            </div>
            <div id="manualType">
               <xsl:value-of select="ancestor::book/@doctype"/>
            </div>
            <div id="engineFamily">
               <xsl:value-of select="ancestor::book/@family"/>
            </div>
         </div>
         <div id="pwcbannerinfo" style="display:none">
            <div id="manualTitle">
               <xsl:text>MAINTENANCE MANUAL</xsl:text>
            </div>
            <div id="engine">
               <xsl:text>Model(s) </xsl:text><xsl:value-of select="child::module/mfmatr/pwcem-title/@model"/>
            </div>
            <div id="manualPn">
               <xsl:text>Manual Part No. </xsl:text><xsl:value-of select="ancestor::book/@manualpnr"/>
            </div>
            <div id="pointRev">
               <xsl:value-of select="ancestor::book/@point-revnbr"/>
            </div>
            <div id="revision">
               <xsl:value-of select="ancestor::book/@revnbr"/>
            </div>
            <div id="revDate">
               <xsl:value-of select="ancestor::book/@revdate"/>
            </div>
         </div>
         <!--Process this element's content-->
         <xsl:apply-templates> </xsl:apply-templates>
         <script type="text/javascript">addTableChangebars();</script>
         <script language="JavaScript" type="text/javascript">addChangebars();</script>
      </div>
   </xsl:template>

<xsl:template name="__style-for_page-block.11bopack6623">
      <xsl:text> .x-page-block-2-0
{margin-left: 0pt; margin-right: 0pt; text-indent: 0pt; }</xsl:text>
   </xsl:template>

<xsl:template match="book[contains(@doctype, 'lmm')]//page-block[@pb-name='title-page']" priority="9">
      <div>
         <!--Emit class values to reflect conditions-->
         <xsl:attribute name="class">
            <xsl:text> x-page-block-2-0</xsl:text>
         </xsl:attribute>
         <xsl:if test="@xml:lang">
            <xsl:attribute name="lang">
               <xsl:call-template name="return-lang-applying-language-map">
                  <xsl:with-param name="doclang" select="@xml:lang"/>
               </xsl:call-template>
            </xsl:attribute>
         </xsl:if>
         <xsl:copy-of select="@ch:*"/>
         <xsl:copy-of xmlns:dmp="http://www.arbortext.com/namespace/dmp/dmpmap" select="@dmp:*"/>
         <xsl:if test="@pb-name!=''">
            <xsl:attribute name="ch:filename">
               <xsl:value-of select="@pb-name"/>
            </xsl:attribute>
            <xsl:attribute name="ch:namepriority">0</xsl:attribute>
         </xsl:if>
         <xsl:if test="@xml:lang">
            <xsl:attribute name="lang">
               <xsl:call-template name="return-lang-applying-language-map">
                  <xsl:with-param name="doclang" select="@xml:lang"/>
               </xsl:call-template>
            </xsl:attribute>
         </xsl:if>
         <xsl:call-template name="maybe-set-id">
            <xsl:with-param name="only-if-id-attr" select="'no'"/>
            <xsl:with-param name="generated-id-prefix" select="'styler-id'"/>
         </xsl:call-template>
         <div id="pwcmetainfo" style="display:none">
            <div id="chapter">
               <xsl:choose>
                  <xsl:when test="ancestor::frontmatter">frontmatter</xsl:when>
                  <xsl:otherwise>
                     <xsl:value-of select="@chapter"/>
                  </xsl:otherwise>
               </xsl:choose>
            </div>
            <div id="section">
               <xsl:choose>
                  <xsl:when test="ancestor::frontmatter">frontmatter</xsl:when>
                  <xsl:otherwise>
                     <xsl:value-of select="@section"/>
                  </xsl:otherwise>
               </xsl:choose>
            </div>
            <div id="subject">
               <xsl:choose>
                  <xsl:when test="ancestor::frontmatter">frontmatter</xsl:when>
                  <xsl:otherwise>
                     <xsl:value-of select="@subject"/>
                  </xsl:otherwise>
               </xsl:choose>
            </div>
            <div id="pbn">
               <xsl:value-of select="@pb-name"/>
            </div>
            <div id="pb-title">
               <xsl:value-of select="@pb-title"/>
            </div>
            <div id="pointRev">
               <xsl:value-of select="ancestor::book/@point-revnbr"/>
            </div>
            <div id="ModelNo">
               <xsl:value-of select="ancestor::book/@model"/>
            </div>
            <div id="ManualServiceBulletinNo">
               <xsl:value-of select="ancestor::book/@manualpnr"/>
            </div>
            <div id="RevNo">
               <xsl:value-of select="ancestor::book/@revnbr"/>
            </div>
            <div id="IssueRevisionDate">
               <xsl:value-of select="ancestor::book/@revdate"/>
            </div>
            <div id="manualType">
               <xsl:value-of select="ancestor::book/@doctype"/>
            </div>
            <div id="engineFamily">
               <xsl:value-of select="ancestor::book/@family"/>
            </div>
         </div>
         <div id="pwcbannerinfo" style="display:none">
            <div id="manualTitle">
               <xsl:text>LINE MAINTENANCE MANUAL</xsl:text>
            </div>
            <div id="engine">
               <xsl:text>Model(s) </xsl:text><xsl:value-of select="child::module/mfmatr/pwclmm-title/@model"/>
            </div>
            <div id="manualPn">
               <xsl:text>Manual Part No. </xsl:text><xsl:value-of select="ancestor::book/@manualpnr"/>
            </div>
            <div id="pointRev">
               <xsl:value-of select="ancestor::book/@point-revnbr"/>
            </div>
            <div id="revision">
               <xsl:value-of select="ancestor::book/@revnbr"/>
            </div>
            <div id="revDate">
               <xsl:value-of select="ancestor::book/@revdate"/>
            </div>
         </div>
         <!--Process this element's content-->
         <xsl:apply-templates> </xsl:apply-templates>
         <script type="text/javascript">addTableChangebars();</script>
         <script language="JavaScript" type="text/javascript">addChangebars();</script>
      </div>
   </xsl:template>

<xsl:template name="__style-for_page-block.10bopack652">
      <xsl:text> .x-page-block-2-0
{margin-left: 0pt; margin-right: 0pt; text-indent: 0pt; }</xsl:text>
   </xsl:template>

<xsl:template match="book[contains(@doctype, 'em')]//page-block[@pb-name='title-page']" priority="8">
      <div>
         <!--Emit class values to reflect conditions-->
         <xsl:attribute name="class">
            <xsl:text> x-page-block-2-0</xsl:text>
         </xsl:attribute>
         <xsl:if test="@xml:lang">
            <xsl:attribute name="lang">
               <xsl:call-template name="return-lang-applying-language-map">
                  <xsl:with-param name="doclang" select="@xml:lang"/>
               </xsl:call-template>
            </xsl:attribute>
         </xsl:if>
         <xsl:copy-of select="@ch:*"/>
         <xsl:copy-of xmlns:dmp="http://www.arbortext.com/namespace/dmp/dmpmap" select="@dmp:*"/>
         <xsl:if test="@pb-name!=''">
            <xsl:attribute name="ch:filename">
               <xsl:value-of select="@pb-name"/>
            </xsl:attribute>
            <xsl:attribute name="ch:namepriority">0</xsl:attribute>
         </xsl:if>
         <xsl:if test="@xml:lang">
            <xsl:attribute name="lang">
               <xsl:call-template name="return-lang-applying-language-map">
                  <xsl:with-param name="doclang" select="@xml:lang"/>
               </xsl:call-template>
            </xsl:attribute>
         </xsl:if>
         <xsl:call-template name="maybe-set-id">
            <xsl:with-param name="only-if-id-attr" select="'no'"/>
            <xsl:with-param name="generated-id-prefix" select="'styler-id'"/>
         </xsl:call-template>
         <div id="pwcmetainfo" style="display:none">
            <div id="chapter">
               <xsl:choose>
                  <xsl:when test="ancestor::frontmatter">frontmatter</xsl:when>
                  <xsl:otherwise>
                     <xsl:value-of select="@chapter"/>
                  </xsl:otherwise>
               </xsl:choose>
            </div>
            <div id="section">
               <xsl:choose>
                  <xsl:when test="ancestor::frontmatter">frontmatter</xsl:when>
                  <xsl:otherwise>
                     <xsl:value-of select="@section"/>
                  </xsl:otherwise>
               </xsl:choose>
            </div>
            <div id="subject">
               <xsl:choose>
                  <xsl:when test="ancestor::frontmatter">frontmatter</xsl:when>
                  <xsl:otherwise>
                     <xsl:value-of select="@subject"/>
                  </xsl:otherwise>
               </xsl:choose>
            </div>
            <div id="pbn">
               <xsl:value-of select="@pb-name"/>
            </div>
            <div id="pb-title">
               <xsl:value-of select="@pb-title"/>
            </div>
            <div id="pointRev">
               <xsl:value-of select="ancestor::book/@point-revnbr"/>
            </div>
            <div id="ModelNo">
               <xsl:value-of select="ancestor::book/@model"/>
            </div>
            <div id="ManualServiceBulletinNo">
               <xsl:value-of select="ancestor::book/@manualpnr"/>
            </div>
            <div id="RevNo">
               <xsl:value-of select="ancestor::book/@revnbr"/>
            </div>
            <div id="IssueRevisionDate">
               <xsl:value-of select="ancestor::book/@revdate"/>
            </div>
            <div id="manualType">
               <xsl:value-of select="ancestor::book/@doctype"/>
            </div>
            <div id="engineFamily">
               <xsl:value-of select="ancestor::book/@family"/>
            </div>
         </div>
         <div id="pwcbannerinfo" style="display:none">
            <div id="manualTitle">
               <xsl:text>OVERHAUL MANUAL</xsl:text>
            </div>
            <div id="engine">
               <xsl:text>Model(s) </xsl:text><xsl:value-of select="child::module/mfmatr/pwcem-title/@model"/>
            </div>
            <div id="manualPn">
               <xsl:text>Manual Part No. </xsl:text><xsl:value-of select="ancestor::book/@manualpnr"/>
            </div>
            <div id="pointRev">
               <xsl:value-of select="ancestor::book/@point-revnbr"/>
            </div>
            <div id="revision">
               <xsl:value-of select="ancestor::book/@revnbr"/>
            </div>
            <div id="revDate">
               <xsl:value-of select="ancestor::book/@revdate"/>
            </div>
         </div>
         <!--Process this element's content-->
         <xsl:apply-templates> </xsl:apply-templates>
         <script type="text/javascript">addTableChangebars();</script>
         <script language="JavaScript" type="text/javascript">addChangebars();</script>
      </div>
   </xsl:template>

<xsl:template name="__style-for_page-block.9bopack662">
      <xsl:text> .x-page-block-2-0
{margin-left: 0pt; margin-right: 0pt; text-indent: 0pt; }</xsl:text>
   </xsl:template>

<xsl:template match="book[contains(@doctype, 'cir')]//page-block[@pb-name='title-page']" priority="7">
      <div>
         <!--Emit class values to reflect conditions-->
         <xsl:attribute name="class">
            <xsl:text> x-page-block-2-0</xsl:text>
         </xsl:attribute>
         <xsl:if test="@xml:lang">
            <xsl:attribute name="lang">
               <xsl:call-template name="return-lang-applying-language-map">
                  <xsl:with-param name="doclang" select="@xml:lang"/>
               </xsl:call-template>
            </xsl:attribute>
         </xsl:if>
         <xsl:copy-of select="@ch:*"/>
         <xsl:copy-of xmlns:dmp="http://www.arbortext.com/namespace/dmp/dmpmap" select="@dmp:*"/>
         <xsl:if test="@pb-name!=''">
            <xsl:attribute name="ch:filename">
               <xsl:value-of select="@pb-name"/>
            </xsl:attribute>
            <xsl:attribute name="ch:namepriority">0</xsl:attribute>
         </xsl:if>
         <xsl:if test="@xml:lang">
            <xsl:attribute name="lang">
               <xsl:call-template name="return-lang-applying-language-map">
                  <xsl:with-param name="doclang" select="@xml:lang"/>
               </xsl:call-template>
            </xsl:attribute>
         </xsl:if>
         <xsl:call-template name="maybe-set-id">
            <xsl:with-param name="only-if-id-attr" select="'no'"/>
            <xsl:with-param name="generated-id-prefix" select="'styler-id'"/>
         </xsl:call-template>
         <div id="pwcmetainfo" style="display:none">
            <div id="chapter">
               <xsl:choose>
                  <xsl:when test="ancestor::frontmatter">frontmatter</xsl:when>
                  <xsl:otherwise>
                     <xsl:value-of select="@chapter"/>
                  </xsl:otherwise>
               </xsl:choose>
            </div>
            <div id="section">
               <xsl:choose>
                  <xsl:when test="ancestor::frontmatter">frontmatter</xsl:when>
                  <xsl:otherwise>
                     <xsl:value-of select="@section"/>
                  </xsl:otherwise>
               </xsl:choose>
            </div>
            <div id="subject">
               <xsl:choose>
                  <xsl:when test="ancestor::frontmatter">frontmatter</xsl:when>
                  <xsl:otherwise>
                     <xsl:value-of select="@subject"/>
                  </xsl:otherwise>
               </xsl:choose>
            </div>
            <div id="pbn">
               <xsl:value-of select="@pb-name"/>
            </div>
            <div id="pb-title">
               <xsl:value-of select="@pb-title"/>
            </div>
            <div id="pointRev">
               <xsl:value-of select="ancestor::book/@point-revnbr"/>
            </div>
            <div id="ModelNo">
               <xsl:value-of select="ancestor::book/@model"/>
            </div>
            <div id="ManualServiceBulletinNo">
               <xsl:value-of select="ancestor::book/@manualpnr"/>
            </div>
            <div id="RevNo">
               <xsl:value-of select="ancestor::book/@revnbr"/>
            </div>
            <div id="IssueRevisionDate">
               <xsl:value-of select="ancestor::book/@revdate"/>
            </div>
            <div id="manualType">
               <xsl:value-of select="ancestor::book/@doctype"/>
            </div>
            <div id="engineFamily">
               <xsl:value-of select="ancestor::book/@family"/>
            </div>
         </div>
         <div id="pwcbannerinfo" style="display:none">
            <div id="manualTitle">
               <xsl:text>CLEANING INSPECTION REPAIR (CIR) MANUAL</xsl:text>
            </div>
            <div id="engine">
               <xsl:text>Model(s) </xsl:text><xsl:value-of select="child::module/mfmatr/pwcem-title/@model"/>
            </div>
            <div id="manualPn">
               <xsl:text>Manual Part No. </xsl:text><xsl:value-of select="ancestor::book/@manualpnr"/>
            </div>
            <div id="pointRev">
               <xsl:value-of select="ancestor::book/@point-revnbr"/>
            </div>
            <div id="revision">
               <xsl:value-of select="ancestor::book/@revnbr"/>
            </div>
            <div id="revDate">
               <xsl:value-of select="ancestor::book/@revdate"/>
            </div>
         </div>
         <!--Process this element's content-->
         <xsl:apply-templates> </xsl:apply-templates>
         <script type="text/javascript">addTableChangebars();</script>
         <script language="JavaScript" type="text/javascript">addChangebars();</script>
      </div>
   </xsl:template>

<xsl:template name="__style-for_page-block.7frtmck452">
      <xsl:text> .x-page-block-2-0
{margin-left: 0pt; margin-right: 0pt; text-indent: 0pt; }</xsl:text>
   </xsl:template>

<xsl:template match="frontmatter/page-block[@pb-name='title-page']" priority="5">
      <div>
         <!--Emit class values to reflect conditions-->
         <xsl:attribute name="class">
            <xsl:text> x-page-block-2-0</xsl:text>
         </xsl:attribute>
         <xsl:if test="@xml:lang">
            <xsl:attribute name="lang">
               <xsl:call-template name="return-lang-applying-language-map">
                  <xsl:with-param name="doclang" select="@xml:lang"/>
               </xsl:call-template>
            </xsl:attribute>
         </xsl:if>
         <xsl:copy-of select="@ch:*"/>
         <xsl:copy-of xmlns:dmp="http://www.arbortext.com/namespace/dmp/dmpmap" select="@dmp:*"/>
         <xsl:if test="@pb-name!=''">
            <xsl:attribute name="ch:filename">
               <xsl:value-of select="@pb-name"/>
            </xsl:attribute>
            <xsl:attribute name="ch:namepriority">0</xsl:attribute>
         </xsl:if>
         <xsl:if test="@xml:lang">
            <xsl:attribute name="lang">
               <xsl:call-template name="return-lang-applying-language-map">
                  <xsl:with-param name="doclang" select="@xml:lang"/>
               </xsl:call-template>
            </xsl:attribute>
         </xsl:if>
         <xsl:call-template name="maybe-set-id">
            <xsl:with-param name="only-if-id-attr" select="'no'"/>
            <xsl:with-param name="generated-id-prefix" select="'styler-id'"/>
         </xsl:call-template>
         <div id="pwcmetainfo" style="display:none">
            <div id="chapter">
               <xsl:choose>
                  <xsl:when test="ancestor::frontmatter">frontmatter</xsl:when>
                  <xsl:otherwise>
                     <xsl:value-of select="@chapter"/>
                  </xsl:otherwise>
               </xsl:choose>
            </div>
            <div id="section">
               <xsl:choose>
                  <xsl:when test="ancestor::frontmatter">frontmatter</xsl:when>
                  <xsl:otherwise>
                     <xsl:value-of select="@section"/>
                  </xsl:otherwise>
               </xsl:choose>
            </div>
            <div id="subject">
               <xsl:choose>
                  <xsl:when test="ancestor::frontmatter">frontmatter</xsl:when>
                  <xsl:otherwise>
                     <xsl:value-of select="@subject"/>
                  </xsl:otherwise>
               </xsl:choose>
            </div>
            <div id="pbn">
               <xsl:value-of select="@pb-name"/>
            </div>
            <div id="pb-title">
               <xsl:value-of select="@pb-title"/>
            </div>
            <div id="pointRev">
               <xsl:value-of select="ancestor::book/@point-revnbr"/>
            </div>
            <div id="ModelNo">
               <xsl:value-of select="ancestor::book/@model"/>
            </div>
            <div id="ManualServiceBulletinNo">
               <xsl:value-of select="ancestor::book/@manualpnr"/>
            </div>
            <div id="RevNo">
               <xsl:value-of select="ancestor::book/@revnbr"/>
            </div>
            <div id="IssueRevisionDate">
               <xsl:value-of select="ancestor::book/@revdate"/>
            </div>
            <div id="manualType">
               <xsl:value-of select="ancestor::book/@doctype"/>
            </div>
            <div id="engineFamily">
               <xsl:value-of select="ancestor::book/@family"/>
            </div>
         </div>
         <div id="pwcbannerinfo" style="display:none">
            <div id="manualTitle">
               <xsl:value-of select="ancestor::module/title-page/manual-title"/>
            </div>
            <div id="engine">
               <xsl:value-of select="ancestor::module/title-page/model"/>
            </div>
            <div id="manualPn">
               <xsl:value-of select="ancestor::module/title-page/manual-pn"/>
            </div>
            <div id="pointRev">
               <xsl:value-of select="ancestor::book/@point-revnbr"/>
            </div>
            <div id="revision">
               <xsl:value-of select="ancestor::book/@revnbr"/>
            </div>
            <div id="revDate">
               <xsl:value-of select="ancestor::book/@revdate"/>
            </div>
         </div>
         <!--Process this element's content-->
         <xsl:apply-templates> </xsl:apply-templates>
         <script type="text/javascript">addTableChangebars();</script>
         <script language="JavaScript" type="text/javascript">addChangebars();</script>
      </div>
   </xsl:template>

<xsl:template match="book[contains(@doctype, 'cir') or contains(@doctype, 'em')]//page-block[@pb-name='howtouse']" priority="5">
  <div class=" x-page-block-5-0">
    <xsl:call-template name="t-base-div-chunk"/>
    <xsl:call-template name="t-base-pwcmetainfo"/>
    <xsl:call-template name="t-base-pwcbannerinfo"/>
    <xsl:apply-templates/>
    <script type="text/javascript">addTableChangebars();</script>
    <script language="JavaScript" type="text/javascript">addChangebars();</script>
  </div>
</xsl:template>

<xsl:template match="page-block[@pb-name='supp_list']" priority="4">
  <div class=" x-page-block-2-0">
    <xsl:call-template name="t-base-div-chunk"/>
    <xsl:call-template name="t-base-pwcmetainfo"/>
    <xsl:call-template name="t-base-pwcbannerinfo"/>
    <xsl:apply-templates/>
    <script type="text/javascript">addTableChangebars();</script>
    <script language="JavaScript" type="text/javascript">addChangebars();</script>
  </div>
</xsl:template>

<xsl:template match="page-block[@pb-name='glossary']" priority="3">
  <div class=" x-page-block-3-0">
    <xsl:call-template name="t-base-div-chunk"/>
    <xsl:call-template name="t-base-pwcmetainfo"/>
    <xsl:call-template name="t-base-pwcbannerinfo"/>
    <xsl:apply-templates/>
    <script type="text/javascript">addTableChangebars();</script>
    <script language="JavaScript" type="text/javascript">addChangebars();</script>
  </div>
</xsl:template>

<xsl:template match="page-block[@pb-name='intro']" priority="2">
  <div>
     <xsl:attribute name="class">
        <xsl:text> x-page-block-7-0</xsl:text>
        <xsl:if test="(./pageblock-title)"> x-page-block-7-1</xsl:if>
     </xsl:attribute>
    <xsl:call-template name="t-base-div-chunk"/>
    <xsl:call-template name="t-base-pwcmetainfo"/>
    <xsl:call-template name="t-base-pwcbannerinfo"/>
    <xsl:apply-templates/>
    <script type="text/javascript">addTableChangebars();</script>
    <script language="JavaScript" type="text/javascript">addChangebars();</script>
  </div>
</xsl:template>

<xsl:template match="page-block[@pb-name='nut_option']" priority="1">
  <div class=" x-page-block-3-0">
    <xsl:call-template name="t-base-div-chunk"/>
    <xsl:call-template name="t-base-pwcmetainfo"/>
    <xsl:call-template name="t-base-pwcbannerinfo"/>
    <xsl:apply-templates/>
    <script type="text/javascript">addTableChangebars();</script>
    <script language="JavaScript" type="text/javascript">addChangebars();</script>
  </div>
</xsl:template>

<xsl:template match="page-block" priority="0">
  <div class=" x-page-block-2-0">
    <xsl:call-template name="t-base-div-chunk"/>
    <xsl:call-template name="t-base-pwcmetainfo"/>
    <xsl:call-template name="t-base-pwcbannerinfo"/>
    <xsl:apply-templates/>
    <script type="text/javascript">addTableChangebars();</script>
    <script language="JavaScript" type="text/javascript">addChangebars();</script>
  </div>
</xsl:template>

<xsl:template match="subpara/subpara/subpara/subpara/subpara/subpara[not(title)]/para" priority="52">
      <div>
         <!--Emit class values to reflect conditions-->
         <xsl:attribute name="class">
            <xsl:text> x-para-1-0</xsl:text>
         </xsl:attribute>
         <xsl:if test="@xml:lang">
            <xsl:attribute name="lang">
               <xsl:call-template name="return-lang-applying-language-map">
                  <xsl:with-param name="doclang" select="@xml:lang"/>
               </xsl:call-template>
            </xsl:attribute>
         </xsl:if>
         <xsl:copy-of select="@ch:*"/>
         <xsl:copy-of xmlns:dmp="http://www.arbortext.com/namespace/dmp/dmpmap" select="@dmp:*"/>
         <xsl:if test="@xml:lang">
            <xsl:attribute name="lang">
               <xsl:call-template name="return-lang-applying-language-map">
                  <xsl:with-param name="doclang" select="@xml:lang"/>
               </xsl:call-template>
            </xsl:attribute>
         </xsl:if>
         <xsl:call-template name="maybe-set-id"/>
         <!--Process this element's content-->
         <xsl:apply-templates/>
      </div>
   </xsl:template>

<xsl:template name="__style-for_para.53suarra562">
      <xsl:text> .x-para-2-0 {margin-left: 0pt; margin-right: 0pt; text-indent: 0pt; margin-top: 8pt; margin-left: 18pt; text-indent: -18pt; }</xsl:text>
   </xsl:template>

<xsl:template match="subpara/subpara/subpara/subpara/subpara[not(title)]/para" priority="51">
      <div>
         <!--Emit class values to reflect conditions-->
         <xsl:attribute name="class">
            <xsl:text> x-para-2-0</xsl:text>
         </xsl:attribute>
         <xsl:if test="@xml:lang">
            <xsl:attribute name="lang">
               <xsl:call-template name="return-lang-applying-language-map">
                  <xsl:with-param name="doclang" select="@xml:lang"/>
               </xsl:call-template>
            </xsl:attribute>
         </xsl:if>
         <xsl:copy-of select="@ch:*"/>
         <xsl:copy-of xmlns:dmp="http://www.arbortext.com/namespace/dmp/dmpmap" select="@dmp:*"/>
         <xsl:if test="@xml:lang">
            <xsl:attribute name="lang">
               <xsl:call-template name="return-lang-applying-language-map">
                  <xsl:with-param name="doclang" select="@xml:lang"/>
               </xsl:call-template>
            </xsl:attribute>
         </xsl:if>
         <xsl:call-template name="maybe-set-id"/>
         <!--Process this element's content-->
         <xsl:apply-templates/>
      </div>
   </xsl:template>

<xsl:template name="__style-for_para.53suarra483">
      <xsl:text> .x-para-3-0 {margin-left: 0pt; margin-right: 0pt; text-indent: 0pt; margin-top: 8pt; margin-left: 18pt; text-indent: -18pt; }</xsl:text>
   </xsl:template>

<xsl:template match="subpara/subpara/subpara/subpara[not(title)]/para" priority="50">
      <div>
         <!--Emit class values to reflect conditions-->
         <xsl:attribute name="class">
            <xsl:text> x-para-3-0</xsl:text>
         </xsl:attribute>
         <xsl:if test="@xml:lang">
            <xsl:attribute name="lang">
               <xsl:call-template name="return-lang-applying-language-map">
                  <xsl:with-param name="doclang" select="@xml:lang"/>
               </xsl:call-template>
            </xsl:attribute>
         </xsl:if>
         <xsl:copy-of select="@ch:*"/>
         <xsl:copy-of xmlns:dmp="http://www.arbortext.com/namespace/dmp/dmpmap" select="@dmp:*"/>
         <xsl:if test="@xml:lang">
            <xsl:attribute name="lang">
               <xsl:call-template name="return-lang-applying-language-map">
                  <xsl:with-param name="doclang" select="@xml:lang"/>
               </xsl:call-template>
            </xsl:attribute>
         </xsl:if>
         <xsl:call-template name="maybe-set-id"/>
         <!--Process this element's content-->
         <xsl:apply-templates/>
      </div>
   </xsl:template>

<xsl:template name="__style-for_para.53n-rara414">
      <xsl:text> .x-para-4-0 {margin-left: 0pt; margin-right: 0pt; text-indent: 0pt; margin-top: 8pt; margin-left: 23pt; text-indent: 0pt; }</xsl:text>
   </xsl:template>

<xsl:template match="n-para/subpara/subpara[child::title]/para" priority="49">
      <div>
         <!--Emit class values to reflect conditions-->
         <xsl:attribute name="class">
            <xsl:text> x-para-4-0</xsl:text>
         </xsl:attribute>
         <xsl:if test="@xml:lang">
            <xsl:attribute name="lang">
               <xsl:call-template name="return-lang-applying-language-map">
                  <xsl:with-param name="doclang" select="@xml:lang"/>
               </xsl:call-template>
            </xsl:attribute>
         </xsl:if>
         <xsl:copy-of select="@ch:*"/>
         <xsl:copy-of xmlns:dmp="http://www.arbortext.com/namespace/dmp/dmpmap" select="@dmp:*"/>
         <xsl:if test="@xml:lang">
            <xsl:attribute name="lang">
               <xsl:call-template name="return-lang-applying-language-map">
                  <xsl:with-param name="doclang" select="@xml:lang"/>
               </xsl:call-template>
            </xsl:attribute>
         </xsl:if>
         <xsl:call-template name="maybe-set-id"/>
         <!--Process this element's content-->
         <xsl:apply-templates/>
      </div>
   </xsl:template>

<xsl:template name="__style-for_para.53suarra405">
      <xsl:text> .x-para-5-0 {margin-left: 0pt; margin-right: 0pt; text-indent: 0pt; margin-top: 8pt; margin-left: 23pt; text-indent: -23pt; }</xsl:text>
   </xsl:template>

<xsl:template match="subpara/subpara/subpara[not(title)]/para" priority="48">
      <div>
         <!--Emit class values to reflect conditions-->
         <xsl:attribute name="class">
            <xsl:text> x-para-5-0</xsl:text>
         </xsl:attribute>
         <xsl:if test="@xml:lang">
            <xsl:attribute name="lang">
               <xsl:call-template name="return-lang-applying-language-map">
                  <xsl:with-param name="doclang" select="@xml:lang"/>
               </xsl:call-template>
            </xsl:attribute>
         </xsl:if>
         <xsl:copy-of select="@ch:*"/>
         <xsl:copy-of xmlns:dmp="http://www.arbortext.com/namespace/dmp/dmpmap" select="@dmp:*"/>
         <xsl:if test="@xml:lang">
            <xsl:attribute name="lang">
               <xsl:call-template name="return-lang-applying-language-map">
                  <xsl:with-param name="doclang" select="@xml:lang"/>
               </xsl:call-template>
            </xsl:attribute>
         </xsl:if>
         <xsl:call-template name="maybe-set-id"/>
         <!--Process this element's content-->
         <xsl:apply-templates/>
      </div>
   </xsl:template>

<xsl:template name="__style-for_para.53suarra326">
      <xsl:text> .x-para-6-0 {margin-left: 0pt; margin-right: 0pt; text-indent: 0pt; margin-top: 8pt; margin-left: 23pt; text-indent: -23pt; }</xsl:text>
   </xsl:template>

<xsl:template match="subpara/subpara[not(title)]/para" priority="47">
      <div>
         <!--Emit class values to reflect conditions-->
         <xsl:attribute name="class">
            <xsl:text> x-para-6-0</xsl:text>
         </xsl:attribute>
         <xsl:if test="@xml:lang">
            <xsl:attribute name="lang">
               <xsl:call-template name="return-lang-applying-language-map">
                  <xsl:with-param name="doclang" select="@xml:lang"/>
               </xsl:call-template>
            </xsl:attribute>
         </xsl:if>
         <xsl:copy-of select="@ch:*"/>
         <xsl:copy-of xmlns:dmp="http://www.arbortext.com/namespace/dmp/dmpmap" select="@dmp:*"/>
         <xsl:if test="@xml:lang">
            <xsl:attribute name="lang">
               <xsl:call-template name="return-lang-applying-language-map">
                  <xsl:with-param name="doclang" select="@xml:lang"/>
               </xsl:call-template>
            </xsl:attribute>
         </xsl:if>
         <xsl:call-template name="maybe-set-id"/>
         <!--Process this element's content-->
         <xsl:apply-templates/>
      </div>
   </xsl:template>

<xsl:template name="__style-for_para.53n-rara337">
      <xsl:text> .x-para-7-0 {margin-left: 0pt; margin-right: 0pt; text-indent: 0pt; margin-top: 8pt; margin-left: 18pt; text-indent: 0pt; }</xsl:text>
   </xsl:template>

<xsl:template match="n-para/subpara[child::title]/para" priority="46">
      <div>
         <!--Emit class values to reflect conditions-->
         <xsl:attribute name="class">
            <xsl:text> x-para-7-0</xsl:text>
         </xsl:attribute>
         <xsl:if test="@xml:lang">
            <xsl:attribute name="lang">
               <xsl:call-template name="return-lang-applying-language-map">
                  <xsl:with-param name="doclang" select="@xml:lang"/>
               </xsl:call-template>
            </xsl:attribute>
         </xsl:if>
         <xsl:copy-of select="@ch:*"/>
         <xsl:copy-of xmlns:dmp="http://www.arbortext.com/namespace/dmp/dmpmap" select="@dmp:*"/>
         <xsl:if test="@xml:lang">
            <xsl:attribute name="lang">
               <xsl:call-template name="return-lang-applying-language-map">
                  <xsl:with-param name="doclang" select="@xml:lang"/>
               </xsl:call-template>
            </xsl:attribute>
         </xsl:if>
         <xsl:call-template name="maybe-set-id"/>
         <!--Process this element's content-->
         <xsl:apply-templates/>
      </div>
   </xsl:template>

<xsl:template name="__style-for_para.53prtera218">
      <xsl:text> .x-para-8-0 {margin-left: 0pt; margin-right: 0pt; text-indent: 0pt; margin-top: 8pt; margin-left: 22pt; text-indent: 0pt; }</xsl:text>
   </xsl:template>

<xsl:template match="prcitem3/prcitem/para" priority="45">
      <div>
         <!--Emit class values to reflect conditions-->
         <xsl:attribute name="class">
            <xsl:text> x-para-8-0</xsl:text>
         </xsl:attribute>
         <xsl:if test="@xml:lang">
            <xsl:attribute name="lang">
               <xsl:call-template name="return-lang-applying-language-map">
                  <xsl:with-param name="doclang" select="@xml:lang"/>
               </xsl:call-template>
            </xsl:attribute>
         </xsl:if>
         <xsl:copy-of select="@ch:*"/>
         <xsl:copy-of xmlns:dmp="http://www.arbortext.com/namespace/dmp/dmpmap" select="@dmp:*"/>
         <xsl:if test="@xml:lang">
            <xsl:attribute name="lang">
               <xsl:call-template name="return-lang-applying-language-map">
                  <xsl:with-param name="doclang" select="@xml:lang"/>
               </xsl:call-template>
            </xsl:attribute>
         </xsl:if>
         <xsl:call-template name="maybe-set-id"/>
         <!--Process this element's content-->
         <xsl:apply-templates/>
      </div>
   </xsl:template>

<xsl:template name="__style-for_para.53suarra209">
      <xsl:text> .x-para-9-0 {margin-left: 0pt; margin-right: 0pt; text-indent: 0pt; margin-top: 8pt; margin-left: 18pt; text-indent: 0pt; margin-bottom: 6pt; }</xsl:text>
   </xsl:template>

<xsl:template match="subpara/subpara/para" priority="44">
      <div>
         <!--Emit class values to reflect conditions-->
         <xsl:attribute name="class">
            <xsl:text> x-para-9-0</xsl:text>
         </xsl:attribute>
         <xsl:if test="@xml:lang">
            <xsl:attribute name="lang">
               <xsl:call-template name="return-lang-applying-language-map">
                  <xsl:with-param name="doclang" select="@xml:lang"/>
               </xsl:call-template>
            </xsl:attribute>
         </xsl:if>
         <xsl:copy-of select="@ch:*"/>
         <xsl:copy-of xmlns:dmp="http://www.arbortext.com/namespace/dmp/dmpmap" select="@dmp:*"/>
         <xsl:if test="@xml:lang">
            <xsl:attribute name="lang">
               <xsl:call-template name="return-lang-applying-language-map">
                  <xsl:with-param name="doclang" select="@xml:lang"/>
               </xsl:call-template>
            </xsl:attribute>
         </xsl:if>
         <xsl:call-template name="maybe-set-id"/>
         <!--Process this element's content-->
         <xsl:apply-templates/>
      </div>
   </xsl:template>

<xsl:template name="__style-for_para.53n-rara1910">
      <xsl:text> .x-para-10-0 {margin-left: 0pt; margin-right: 0pt; text-indent: 0pt; margin-top: 8pt; margin-left: 18pt; text-indent: -18pt; }</xsl:text>
   </xsl:template>

<xsl:template match="n-para/subpara/para" priority="43">
      <div>
         <!--Emit class values to reflect conditions-->
         <xsl:attribute name="class">
            <xsl:text> x-para-10-0</xsl:text>
         </xsl:attribute>
         <xsl:if test="@xml:lang">
            <xsl:attribute name="lang">
               <xsl:call-template name="return-lang-applying-language-map">
                  <xsl:with-param name="doclang" select="@xml:lang"/>
               </xsl:call-template>
            </xsl:attribute>
         </xsl:if>
         <xsl:copy-of select="@ch:*"/>
         <xsl:copy-of xmlns:dmp="http://www.arbortext.com/namespace/dmp/dmpmap" select="@dmp:*"/>
         <xsl:if test="@xml:lang">
            <xsl:attribute name="lang">
               <xsl:call-template name="return-lang-applying-language-map">
                  <xsl:with-param name="doclang" select="@xml:lang"/>
               </xsl:call-template>
            </xsl:attribute>
         </xsl:if>
         <xsl:call-template name="maybe-set-id"/>
         <!--Process this element's content-->
         <xsl:apply-templates/>
      </div>
   </xsl:template>

<xsl:template name="__style-for_para.53bonora4211">
      <xsl:text> .x-para-11-0 {margin-left: 0pt; margin-right: 0pt; }</xsl:text>
   </xsl:template>

<xsl:template match="book[contains(@doctype, 'cir')]//note/para" priority="42">
      <span>
         <!--Emit class values to reflect conditions-->
         <xsl:attribute name="class">
            <xsl:text> x-para-11-0</xsl:text>
         </xsl:attribute>
         <xsl:if test="@xml:lang">
            <xsl:attribute name="lang">
               <xsl:call-template name="return-lang-applying-language-map">
                  <xsl:with-param name="doclang" select="@xml:lang"/>
               </xsl:call-template>
            </xsl:attribute>
         </xsl:if>
         <xsl:copy-of select="@ch:*"/>
         <xsl:copy-of xmlns:dmp="http://www.arbortext.com/namespace/dmp/dmpmap" select="@dmp:*"/>
         <xsl:if test="@xml:lang">
            <xsl:attribute name="lang">
               <xsl:call-template name="return-lang-applying-language-map">
                  <xsl:with-param name="doclang" select="@xml:lang"/>
               </xsl:call-template>
            </xsl:attribute>
         </xsl:if>
         <xsl:call-template name="maybe-set-id"/>
         <!--Process this element's content-->
         <xsl:apply-templates/>
      </span>
   </xsl:template>

<xsl:template name="__style-for_para.46pablra296">
      <xsl:text> .x-para-12-0
{margin-left: 0pt; margin-right: 0pt; text-indent: 0pt; margin-top:
8pt; margin-left: 36pt; text-indent: -18pt; }</xsl:text>
   </xsl:template>

<xsl:template match="pageblock-front/general//para" priority="41">
      <div>
         <!--Emit class values to reflect conditions-->
         <xsl:attribute name="class">
            <xsl:text> x-para-12-0</xsl:text>
         </xsl:attribute>
         <xsl:if test="@xml:lang">
            <xsl:attribute name="lang">
               <xsl:call-template name="return-lang-applying-language-map">
                  <xsl:with-param name="doclang" select="@xml:lang"/>
               </xsl:call-template>
            </xsl:attribute>
         </xsl:if>
         <xsl:copy-of select="@ch:*"/>
         <xsl:copy-of xmlns:dmp="http://www.arbortext.com/namespace/dmp/dmpmap" select="@dmp:*"/>
         <xsl:if test="@xml:lang">
            <xsl:attribute name="lang">
               <xsl:call-template name="return-lang-applying-language-map">
                  <xsl:with-param name="doclang" select="@xml:lang"/>
               </xsl:call-template>
            </xsl:attribute>
         </xsl:if>
         <xsl:call-template name="maybe-set-id"/>
         <!--Process this element's content-->
         <xsl:apply-templates> </xsl:apply-templates>
      </div>
   </xsl:template>

<xsl:template name="__style-for_para.53wainra1513">
      <xsl:text> .x-para-13-0 {margin-left: 0pt; margin-right: 0pt; margin-top: 8pt; }</xsl:text>
   </xsl:template>

<xsl:template match="warning/para[1]" priority="40">
      <span>
         <!--Emit class values to reflect conditions-->
         <xsl:attribute name="class">
            <xsl:text> x-para-13-0</xsl:text>
         </xsl:attribute>
         <xsl:if test="@xml:lang">
            <xsl:attribute name="lang">
               <xsl:call-template name="return-lang-applying-language-map">
                  <xsl:with-param name="doclang" select="@xml:lang"/>
               </xsl:call-template>
            </xsl:attribute>
         </xsl:if>
         <xsl:copy-of select="@ch:*"/>
         <xsl:copy-of xmlns:dmp="http://www.arbortext.com/namespace/dmp/dmpmap" select="@dmp:*"/>
         <xsl:if test="@xml:lang">
            <xsl:attribute name="lang">
               <xsl:call-template name="return-lang-applying-language-map">
                  <xsl:with-param name="doclang" select="@xml:lang"/>
               </xsl:call-template>
            </xsl:attribute>
         </xsl:if>
         <xsl:call-template name="maybe-set-id"/>
         <!--Process this element's content-->
         <xsl:apply-templates/>
      </span>
   </xsl:template>

<xsl:template name="__style-for_para.53caiora1514">
      <xsl:text> .x-para-14-0 {margin-left: 0pt; margin-right: 0pt; margin-top: 8pt; }</xsl:text>
   </xsl:template>

<xsl:template match="caution/para[1]" priority="39">
      <span>
         <!--Emit class values to reflect conditions-->
         <xsl:attribute name="class">
            <xsl:text> x-para-14-0</xsl:text>
         </xsl:attribute>
         <xsl:if test="@xml:lang">
            <xsl:attribute name="lang">
               <xsl:call-template name="return-lang-applying-language-map">
                  <xsl:with-param name="doclang" select="@xml:lang"/>
               </xsl:call-template>
            </xsl:attribute>
         </xsl:if>
         <xsl:copy-of select="@ch:*"/>
         <xsl:copy-of xmlns:dmp="http://www.arbortext.com/namespace/dmp/dmpmap" select="@dmp:*"/>
         <xsl:if test="@xml:lang">
            <xsl:attribute name="lang">
               <xsl:call-template name="return-lang-applying-language-map">
                  <xsl:with-param name="doclang" select="@xml:lang"/>
               </xsl:call-template>
            </xsl:attribute>
         </xsl:if>
         <xsl:call-template name="maybe-set-id"/>
         <!--Process this element's content-->
         <xsl:apply-templates/>
      </span>
   </xsl:template>

<xsl:template name="__style-for_para.53_ustra2615">
      <xsl:text> .x-para-15-0 {margin-left: 0pt; margin-right: 0pt; }</xsl:text>
   </xsl:template>

<xsl:template match="_ufe:step-proc-num/para[1]" priority="38">
      <span>
         <!--Emit class values to reflect conditions-->
         <xsl:attribute name="class">
            <xsl:text> x-para-15-0</xsl:text>
         </xsl:attribute>
         <xsl:if test="@xml:lang">
            <xsl:attribute name="lang">
               <xsl:call-template name="return-lang-applying-language-map">
                  <xsl:with-param name="doclang" select="@xml:lang"/>
               </xsl:call-template>
            </xsl:attribute>
         </xsl:if>
         <xsl:copy-of select="@ch:*"/>
         <xsl:copy-of xmlns:dmp="http://www.arbortext.com/namespace/dmp/dmpmap" select="@dmp:*"/>
         <xsl:if test="@xml:lang">
            <xsl:attribute name="lang">
               <xsl:call-template name="return-lang-applying-language-map">
                  <xsl:with-param name="doclang" select="@xml:lang"/>
               </xsl:call-template>
            </xsl:attribute>
         </xsl:if>
         <xsl:call-template name="maybe-set-id"/>
         <!--Process this element's content-->
         <xsl:apply-templates/>
      </span>
   </xsl:template>

<xsl:template name="__style-for_para.53st5pra1316">
      <xsl:text> .x-para-16-0 {margin-left: 0pt; margin-right: 0pt; }</xsl:text>
   </xsl:template>

<xsl:template match="step5/para[1]" priority="37">
      <span>
         <!--Emit class values to reflect conditions-->
         <xsl:attribute name="class">
            <xsl:text> x-para-16-0</xsl:text>
         </xsl:attribute>
         <xsl:if test="@xml:lang">
            <xsl:attribute name="lang">
               <xsl:call-template name="return-lang-applying-language-map">
                  <xsl:with-param name="doclang" select="@xml:lang"/>
               </xsl:call-template>
            </xsl:attribute>
         </xsl:if>
         <xsl:copy-of select="@ch:*"/>
         <xsl:copy-of xmlns:dmp="http://www.arbortext.com/namespace/dmp/dmpmap" select="@dmp:*"/>
         <xsl:if test="@xml:lang">
            <xsl:attribute name="lang">
               <xsl:call-template name="return-lang-applying-language-map">
                  <xsl:with-param name="doclang" select="@xml:lang"/>
               </xsl:call-template>
            </xsl:attribute>
         </xsl:if>
         <xsl:call-template name="maybe-set-id"/>
         <!--Process this element's content-->
         <xsl:apply-templates/>
      </span>
   </xsl:template>

<xsl:template name="__style-for_para.53st4pra1317">
      <xsl:text> .x-para-17-0 {margin-left: 0pt; margin-right: 0pt; }</xsl:text>
   </xsl:template>

<xsl:template match="step4/para[1]" priority="36">
      <span>
         <!--Emit class values to reflect conditions-->
         <xsl:attribute name="class">
            <xsl:text> x-para-17-0</xsl:text>
         </xsl:attribute>
         <xsl:if test="@xml:lang">
            <xsl:attribute name="lang">
               <xsl:call-template name="return-lang-applying-language-map">
                  <xsl:with-param name="doclang" select="@xml:lang"/>
               </xsl:call-template>
            </xsl:attribute>
         </xsl:if>
         <xsl:copy-of select="@ch:*"/>
         <xsl:copy-of xmlns:dmp="http://www.arbortext.com/namespace/dmp/dmpmap" select="@dmp:*"/>
         <xsl:if test="@xml:lang">
            <xsl:attribute name="lang">
               <xsl:call-template name="return-lang-applying-language-map">
                  <xsl:with-param name="doclang" select="@xml:lang"/>
               </xsl:call-template>
            </xsl:attribute>
         </xsl:if>
         <xsl:call-template name="maybe-set-id"/>
         <!--Process this element's content-->
         <xsl:apply-templates/>
      </span>
   </xsl:template>

<xsl:template name="__style-for_para.53st3pra1318">
      <xsl:text> .x-para-18-0 {margin-left: 0pt; margin-right: 0pt; }</xsl:text>
   </xsl:template>

<xsl:template match="step3/para[1]" priority="35">
      <span>
         <!--Emit class values to reflect conditions-->
         <xsl:attribute name="class">
            <xsl:text> x-para-18-0</xsl:text>
         </xsl:attribute>
         <xsl:if test="@xml:lang">
            <xsl:attribute name="lang">
               <xsl:call-template name="return-lang-applying-language-map">
                  <xsl:with-param name="doclang" select="@xml:lang"/>
               </xsl:call-template>
            </xsl:attribute>
         </xsl:if>
         <xsl:copy-of select="@ch:*"/>
         <xsl:copy-of xmlns:dmp="http://www.arbortext.com/namespace/dmp/dmpmap" select="@dmp:*"/>
         <xsl:if test="@xml:lang">
            <xsl:attribute name="lang">
               <xsl:call-template name="return-lang-applying-language-map">
                  <xsl:with-param name="doclang" select="@xml:lang"/>
               </xsl:call-template>
            </xsl:attribute>
         </xsl:if>
         <xsl:call-template name="maybe-set-id"/>
         <!--Process this element's content-->
         <xsl:apply-templates/>
      </span>
   </xsl:template>

<xsl:template name="__style-for_para.53st2pra1319">
      <xsl:text> .x-para-19-0 {margin-left: 0pt; margin-right: 0pt; }</xsl:text>
   </xsl:template>

<xsl:template match="step2/para[1]" priority="34">
      <span>
         <!--Emit class values to reflect conditions-->
         <xsl:attribute name="class">
            <xsl:text> x-para-19-0</xsl:text>
         </xsl:attribute>
         <xsl:if test="@xml:lang">
            <xsl:attribute name="lang">
               <xsl:call-template name="return-lang-applying-language-map">
                  <xsl:with-param name="doclang" select="@xml:lang"/>
               </xsl:call-template>
            </xsl:attribute>
         </xsl:if>
         <xsl:copy-of select="@ch:*"/>
         <xsl:copy-of xmlns:dmp="http://www.arbortext.com/namespace/dmp/dmpmap" select="@dmp:*"/>
         <xsl:if test="@xml:lang">
            <xsl:attribute name="lang">
               <xsl:call-template name="return-lang-applying-language-map">
                  <xsl:with-param name="doclang" select="@xml:lang"/>
               </xsl:call-template>
            </xsl:attribute>
         </xsl:if>
         <xsl:call-template name="maybe-set-id"/>
         <!--Process this element's content-->
         <xsl:apply-templates/>
      </span>
   </xsl:template>

<xsl:template name="__style-for_para.53nuitra1620">
      <xsl:text> .x-para-20-0 {margin-left: 0pt; margin-right: 0pt; }</xsl:text>
   </xsl:template>

<xsl:template match="numlitem/para[1]" priority="33">
      <span>
         <!--Emit class values to reflect conditions-->
         <xsl:attribute name="class">
            <xsl:text> x-para-20-0</xsl:text>
         </xsl:attribute>
         <xsl:if test="@xml:lang">
            <xsl:attribute name="lang">
               <xsl:call-template name="return-lang-applying-language-map">
                  <xsl:with-param name="doclang" select="@xml:lang"/>
               </xsl:call-template>
            </xsl:attribute>
         </xsl:if>
         <xsl:copy-of select="@ch:*"/>
         <xsl:copy-of xmlns:dmp="http://www.arbortext.com/namespace/dmp/dmpmap" select="@dmp:*"/>
         <xsl:if test="@xml:lang">
            <xsl:attribute name="lang">
               <xsl:call-template name="return-lang-applying-language-map">
                  <xsl:with-param name="doclang" select="@xml:lang"/>
               </xsl:call-template>
            </xsl:attribute>
         </xsl:if>
         <xsl:call-template name="maybe-set-id"/>
         <!--Process this element's content-->
         <xsl:apply-templates/>
      </span>
   </xsl:template>

<xsl:template name="__style-for_para.53nopara1221">
      <xsl:text> .x-para-21-0 {margin-left: 0pt; margin-right: 0pt; margin-top: 8pt; }</xsl:text>
   </xsl:template>

<xsl:template match="note/para[1]" priority="32">
      <span>
         <!--Emit class values to reflect conditions-->
         <xsl:attribute name="class">
            <xsl:text> x-para-21-0</xsl:text>
         </xsl:attribute>
         <xsl:if test="@xml:lang">
            <xsl:attribute name="lang">
               <xsl:call-template name="return-lang-applying-language-map">
                  <xsl:with-param name="doclang" select="@xml:lang"/>
               </xsl:call-template>
            </xsl:attribute>
         </xsl:if>
         <xsl:copy-of select="@ch:*"/>
         <xsl:copy-of xmlns:dmp="http://www.arbortext.com/namespace/dmp/dmpmap" select="@dmp:*"/>
         <xsl:if test="@xml:lang">
            <xsl:attribute name="lang">
               <xsl:call-template name="return-lang-applying-language-map">
                  <xsl:with-param name="doclang" select="@xml:lang"/>
               </xsl:call-template>
            </xsl:attribute>
         </xsl:if>
         <xsl:call-template name="maybe-set-id"/>
         <!--Process this element's content-->
         <xsl:apply-templates/>
      </span>
   </xsl:template>

<xsl:template name="__style-for_para.53untera1522">
      <xsl:text> .x-para-22-0 {margin-left: 0pt; margin-right: 0pt; }</xsl:text>
   </xsl:template>

<xsl:template match="unlitem/para[1]" priority="31">
      <span>
         <!--Emit class values to reflect conditions-->
         <xsl:attribute name="class">
            <xsl:text> x-para-22-0</xsl:text>
         </xsl:attribute>
         <xsl:if test="@xml:lang">
            <xsl:attribute name="lang">
               <xsl:call-template name="return-lang-applying-language-map">
                  <xsl:with-param name="doclang" select="@xml:lang"/>
               </xsl:call-template>
            </xsl:attribute>
         </xsl:if>
         <xsl:copy-of select="@ch:*"/>
         <xsl:copy-of xmlns:dmp="http://www.arbortext.com/namespace/dmp/dmpmap" select="@dmp:*"/>
         <xsl:if test="@xml:lang">
            <xsl:attribute name="lang">
               <xsl:call-template name="return-lang-applying-language-map">
                  <xsl:with-param name="doclang" select="@xml:lang"/>
               </xsl:call-template>
            </xsl:attribute>
         </xsl:if>
         <xsl:call-template name="maybe-set-id"/>
         <!--Process this element's content-->
         <xsl:apply-templates/>
      </span>
   </xsl:template>

<xsl:template name="__style-for_para.53prtera1623">
      <xsl:text> .x-para-23-0 {margin-left: 0pt; margin-right: 0pt; }</xsl:text>
   </xsl:template>

<xsl:template match="prcitem4/para[1]" priority="30">
      <span>
         <!--Emit class values to reflect conditions-->
         <xsl:attribute name="class">
            <xsl:text> x-para-23-0</xsl:text>
         </xsl:attribute>
         <xsl:if test="@xml:lang">
            <xsl:attribute name="lang">
               <xsl:call-template name="return-lang-applying-language-map">
                  <xsl:with-param name="doclang" select="@xml:lang"/>
               </xsl:call-template>
            </xsl:attribute>
         </xsl:if>
         <xsl:copy-of select="@ch:*"/>
         <xsl:copy-of xmlns:dmp="http://www.arbortext.com/namespace/dmp/dmpmap" select="@dmp:*"/>
         <xsl:if test="@xml:lang">
            <xsl:attribute name="lang">
               <xsl:call-template name="return-lang-applying-language-map">
                  <xsl:with-param name="doclang" select="@xml:lang"/>
               </xsl:call-template>
            </xsl:attribute>
         </xsl:if>
         <xsl:call-template name="maybe-set-id"/>
         <!--Process this element's content-->
         <xsl:apply-templates/>
      </span>
   </xsl:template>

<xsl:template name="__style-for_para.53l4emra1424">
      <xsl:text> .x-para-24-0 {margin-left: 0pt; margin-right: 0pt; }</xsl:text>
   </xsl:template>

<xsl:template match="l4item/para[1]" priority="29">
      <span>
         <!--Emit class values to reflect conditions-->
         <xsl:attribute name="class">
            <xsl:text> x-para-24-0</xsl:text>
         </xsl:attribute>
         <xsl:if test="@xml:lang">
            <xsl:attribute name="lang">
               <xsl:call-template name="return-lang-applying-language-map">
                  <xsl:with-param name="doclang" select="@xml:lang"/>
               </xsl:call-template>
            </xsl:attribute>
         </xsl:if>
         <xsl:copy-of select="@ch:*"/>
         <xsl:copy-of xmlns:dmp="http://www.arbortext.com/namespace/dmp/dmpmap" select="@dmp:*"/>
         <xsl:if test="@xml:lang">
            <xsl:attribute name="lang">
               <xsl:call-template name="return-lang-applying-language-map">
                  <xsl:with-param name="doclang" select="@xml:lang"/>
               </xsl:call-template>
            </xsl:attribute>
         </xsl:if>
         <xsl:call-template name="maybe-set-id"/>
         <!--Process this element's content-->
         <xsl:apply-templates/>
      </span>
   </xsl:template>

<xsl:template name="__style-for_para.53l3emra1425">
      <xsl:text> .x-para-25-0 {margin-left: 0pt; margin-right: 0pt; }</xsl:text>
   </xsl:template>

<xsl:template match="l3item/para[1]" priority="28">
      <span>
         <!--Emit class values to reflect conditions-->
         <xsl:attribute name="class">
            <xsl:text> x-para-25-0</xsl:text>
         </xsl:attribute>
         <xsl:if test="@xml:lang">
            <xsl:attribute name="lang">
               <xsl:call-template name="return-lang-applying-language-map">
                  <xsl:with-param name="doclang" select="@xml:lang"/>
               </xsl:call-template>
            </xsl:attribute>
         </xsl:if>
         <xsl:copy-of select="@ch:*"/>
         <xsl:copy-of xmlns:dmp="http://www.arbortext.com/namespace/dmp/dmpmap" select="@dmp:*"/>
         <xsl:if test="@xml:lang">
            <xsl:attribute name="lang">
               <xsl:call-template name="return-lang-applying-language-map">
                  <xsl:with-param name="doclang" select="@xml:lang"/>
               </xsl:call-template>
            </xsl:attribute>
         </xsl:if>
         <xsl:call-template name="maybe-set-id"/>
         <!--Process this element's content-->
         <xsl:apply-templates/>
      </span>
   </xsl:template>

<xsl:template name="__style-for_para.53l2emra1426">
      <xsl:text> .x-para-26-0 {margin-left: 0pt; margin-right: 0pt; }</xsl:text>
   </xsl:template>

<xsl:template match="l2item/para[1]" priority="27">
      <span>
         <!--Emit class values to reflect conditions-->
         <xsl:attribute name="class">
            <xsl:text> x-para-26-0</xsl:text>
         </xsl:attribute>
         <xsl:if test="@xml:lang">
            <xsl:attribute name="lang">
               <xsl:call-template name="return-lang-applying-language-map">
                  <xsl:with-param name="doclang" select="@xml:lang"/>
               </xsl:call-template>
            </xsl:attribute>
         </xsl:if>
         <xsl:copy-of select="@ch:*"/>
         <xsl:copy-of xmlns:dmp="http://www.arbortext.com/namespace/dmp/dmpmap" select="@dmp:*"/>
         <xsl:if test="@xml:lang">
            <xsl:attribute name="lang">
               <xsl:call-template name="return-lang-applying-language-map">
                  <xsl:with-param name="doclang" select="@xml:lang"/>
               </xsl:call-template>
            </xsl:attribute>
         </xsl:if>
         <xsl:call-template name="maybe-set-id"/>
         <!--Process this element's content-->
         <xsl:apply-templates/>
      </span>
   </xsl:template>

<xsl:template name="__style-for_para.53l1emra1427">
      <xsl:text> .x-para-27-0 {margin-left: 0pt; margin-right: 0pt; }</xsl:text>
   </xsl:template>

<xsl:template match="l1item/para[1]" priority="26">
      <span>
         <!--Emit class values to reflect conditions-->
         <xsl:attribute name="class">
            <xsl:text> x-para-27-0</xsl:text>
         </xsl:attribute>
         <xsl:if test="@xml:lang">
            <xsl:attribute name="lang">
               <xsl:call-template name="return-lang-applying-language-map">
                  <xsl:with-param name="doclang" select="@xml:lang"/>
               </xsl:call-template>
            </xsl:attribute>
         </xsl:if>
         <xsl:copy-of select="@ch:*"/>
         <xsl:copy-of xmlns:dmp="http://www.arbortext.com/namespace/dmp/dmpmap" select="@dmp:*"/>
         <xsl:if test="@xml:lang">
            <xsl:attribute name="lang">
               <xsl:call-template name="return-lang-applying-language-map">
                  <xsl:with-param name="doclang" select="@xml:lang"/>
               </xsl:call-template>
            </xsl:attribute>
         </xsl:if>
         <xsl:call-template name="maybe-set-id"/>
         <!--Process this element's content-->
         <xsl:apply-templates/>
      </span>
   </xsl:template>

<xsl:template name="__style-for_para.53stpara1228">
      <xsl:text> .x-para-28-0 {margin-left: 0pt; margin-right: 0pt; }</xsl:text>
   </xsl:template>

<xsl:template match="step/para[1]" priority="25">
      <span>
         <!--Emit class values to reflect conditions-->
         <xsl:attribute name="class">
            <xsl:text> x-para-28-0</xsl:text>
         </xsl:attribute>
         <xsl:if test="@xml:lang">
            <xsl:attribute name="lang">
               <xsl:call-template name="return-lang-applying-language-map">
                  <xsl:with-param name="doclang" select="@xml:lang"/>
               </xsl:call-template>
            </xsl:attribute>
         </xsl:if>
         <xsl:copy-of select="@ch:*"/>
         <xsl:copy-of xmlns:dmp="http://www.arbortext.com/namespace/dmp/dmpmap" select="@dmp:*"/>
         <xsl:if test="@xml:lang">
            <xsl:attribute name="lang">
               <xsl:call-template name="return-lang-applying-language-map">
                  <xsl:with-param name="doclang" select="@xml:lang"/>
               </xsl:call-template>
            </xsl:attribute>
         </xsl:if>
         <xsl:call-template name="maybe-set-id"/>
         <!--Process this element's content-->
         <xsl:apply-templates/>
      </span>
   </xsl:template>

<xsl:template name="__style-for_para.53itpara1229">
      <xsl:text> .x-para-29-0 {margin-left: 0pt; margin-right: 0pt; }</xsl:text>
   </xsl:template>

<xsl:template match="item/para[1]" priority="24">
      <span>
         <!--Emit class values to reflect conditions-->
         <xsl:attribute name="class">
            <xsl:text> x-para-29-0</xsl:text>
         </xsl:attribute>
         <xsl:if test="@xml:lang">
            <xsl:attribute name="lang">
               <xsl:call-template name="return-lang-applying-language-map">
                  <xsl:with-param name="doclang" select="@xml:lang"/>
               </xsl:call-template>
            </xsl:attribute>
         </xsl:if>
         <xsl:copy-of select="@ch:*"/>
         <xsl:copy-of xmlns:dmp="http://www.arbortext.com/namespace/dmp/dmpmap" select="@dmp:*"/>
         <xsl:if test="@xml:lang">
            <xsl:attribute name="lang">
               <xsl:call-template name="return-lang-applying-language-map">
                  <xsl:with-param name="doclang" select="@xml:lang"/>
               </xsl:call-template>
            </xsl:attribute>
         </xsl:if>
         <xsl:call-template name="maybe-set-id"/>
         <!--Process this element's content-->
         <xsl:apply-templates/>
      </span>
   </xsl:template>

<xsl:template name="__style-for_para.38n-rara5420">
      <xsl:text> .x-para-30-0
{margin-left: 0pt; margin-right: 0pt; text-indent: 0pt; margin-top:
8pt; margin-left: 36pt; text-indent: -18pt; }</xsl:text>
   </xsl:template>

<xsl:template match="n-para[ancestor::book[contains(@doctype, 'epc')]]/para" priority="23">
      <div>
         <!--Emit class values to reflect conditions-->
         <xsl:attribute name="class">
            <xsl:text> x-para-30-0</xsl:text>
         </xsl:attribute>
         <xsl:if test="@xml:lang">
            <xsl:attribute name="lang">
               <xsl:call-template name="return-lang-applying-language-map">
                  <xsl:with-param name="doclang" select="@xml:lang"/>
               </xsl:call-template>
            </xsl:attribute>
         </xsl:if>
         <xsl:copy-of select="@ch:*"/>
         <xsl:copy-of xmlns:dmp="http://www.arbortext.com/namespace/dmp/dmpmap" select="@dmp:*"/>
         <xsl:if test="@xml:lang">
            <xsl:attribute name="lang">
               <xsl:call-template name="return-lang-applying-language-map">
                  <xsl:with-param name="doclang" select="@xml:lang"/>
               </xsl:call-template>
            </xsl:attribute>
         </xsl:if>
         <xsl:call-template name="maybe-set-id"/>
         <!--Process this element's content-->
         <xsl:apply-templates> </xsl:apply-templates>
      </div>
   </xsl:template>

<xsl:template name="__style-for_para.53_ustra3731">
      <xsl:text> .x-para-31-0 {margin-left: 0pt; margin-right: 0pt; text-indent: 0pt; margin-top: 6pt; margin-bottom: 6pt; }</xsl:text>
   </xsl:template>

<xsl:template match="_ufe:step-proc-num/para[position()&gt;1]" priority="22">
      <div>
         <!--Emit class values to reflect conditions-->
         <xsl:attribute name="class">
            <xsl:text> x-para-31-0</xsl:text>
         </xsl:attribute>
         <xsl:if test="@xml:lang">
            <xsl:attribute name="lang">
               <xsl:call-template name="return-lang-applying-language-map">
                  <xsl:with-param name="doclang" select="@xml:lang"/>
               </xsl:call-template>
            </xsl:attribute>
         </xsl:if>
         <xsl:copy-of select="@ch:*"/>
         <xsl:copy-of xmlns:dmp="http://www.arbortext.com/namespace/dmp/dmpmap" select="@dmp:*"/>
         <xsl:if test="@xml:lang">
            <xsl:attribute name="lang">
               <xsl:call-template name="return-lang-applying-language-map">
                  <xsl:with-param name="doclang" select="@xml:lang"/>
               </xsl:call-template>
            </xsl:attribute>
         </xsl:if>
         <xsl:call-template name="maybe-set-id"/>
         <!--Process this element's content-->
         <xsl:apply-templates/>
      </div>
   </xsl:template>

<xsl:template name="__style-for_para.53st5pra2432">
      <xsl:text> .x-para-32-0 {margin-left: 0pt; margin-right: 0pt; text-indent: 0pt; margin-top: 6pt; margin-bottom: 6pt; }</xsl:text>
   </xsl:template>

<xsl:template match="step5/para[position()&gt;1]" priority="21">
      <div>
         <!--Emit class values to reflect conditions-->
         <xsl:attribute name="class">
            <xsl:text> x-para-32-0</xsl:text>
         </xsl:attribute>
         <xsl:if test="@xml:lang">
            <xsl:attribute name="lang">
               <xsl:call-template name="return-lang-applying-language-map">
                  <xsl:with-param name="doclang" select="@xml:lang"/>
               </xsl:call-template>
            </xsl:attribute>
         </xsl:if>
         <xsl:copy-of select="@ch:*"/>
         <xsl:copy-of xmlns:dmp="http://www.arbortext.com/namespace/dmp/dmpmap" select="@dmp:*"/>
         <xsl:if test="@xml:lang">
            <xsl:attribute name="lang">
               <xsl:call-template name="return-lang-applying-language-map">
                  <xsl:with-param name="doclang" select="@xml:lang"/>
               </xsl:call-template>
            </xsl:attribute>
         </xsl:if>
         <xsl:call-template name="maybe-set-id"/>
         <!--Process this element's content-->
         <xsl:apply-templates/>
      </div>
   </xsl:template>

<xsl:template name="__style-for_para.53st4pra2433">
      <xsl:text> .x-para-33-0 {margin-left: 0pt; margin-right: 0pt; text-indent: 0pt; margin-top: 6pt; margin-bottom: 6pt; }</xsl:text>
   </xsl:template>

<xsl:template match="step4/para[position()&gt;1]" priority="20">
      <div>
         <!--Emit class values to reflect conditions-->
         <xsl:attribute name="class">
            <xsl:text> x-para-33-0</xsl:text>
         </xsl:attribute>
         <xsl:if test="@xml:lang">
            <xsl:attribute name="lang">
               <xsl:call-template name="return-lang-applying-language-map">
                  <xsl:with-param name="doclang" select="@xml:lang"/>
               </xsl:call-template>
            </xsl:attribute>
         </xsl:if>
         <xsl:copy-of select="@ch:*"/>
         <xsl:copy-of xmlns:dmp="http://www.arbortext.com/namespace/dmp/dmpmap" select="@dmp:*"/>
         <xsl:if test="@xml:lang">
            <xsl:attribute name="lang">
               <xsl:call-template name="return-lang-applying-language-map">
                  <xsl:with-param name="doclang" select="@xml:lang"/>
               </xsl:call-template>
            </xsl:attribute>
         </xsl:if>
         <xsl:call-template name="maybe-set-id"/>
         <!--Process this element's content-->
         <xsl:apply-templates/>
      </div>
   </xsl:template>

<xsl:template name="__style-for_para.53st3pra2434">
      <xsl:text> .x-para-34-0 {margin-left: 0pt; margin-right: 0pt; text-indent: 0pt; margin-top: 6pt; margin-bottom: 6pt; }</xsl:text>
   </xsl:template>

<xsl:template match="step3/para[position()&gt;1]" priority="19">
      <div>
         <!--Emit class values to reflect conditions-->
         <xsl:attribute name="class">
            <xsl:text> x-para-34-0</xsl:text>
         </xsl:attribute>
         <xsl:if test="@xml:lang">
            <xsl:attribute name="lang">
               <xsl:call-template name="return-lang-applying-language-map">
                  <xsl:with-param name="doclang" select="@xml:lang"/>
               </xsl:call-template>
            </xsl:attribute>
         </xsl:if>
         <xsl:copy-of select="@ch:*"/>
         <xsl:copy-of xmlns:dmp="http://www.arbortext.com/namespace/dmp/dmpmap" select="@dmp:*"/>
         <xsl:if test="@xml:lang">
            <xsl:attribute name="lang">
               <xsl:call-template name="return-lang-applying-language-map">
                  <xsl:with-param name="doclang" select="@xml:lang"/>
               </xsl:call-template>
            </xsl:attribute>
         </xsl:if>
         <xsl:call-template name="maybe-set-id"/>
         <!--Process this element's content-->
         <xsl:apply-templates/>
      </div>
   </xsl:template>

<xsl:template name="__style-for_para.53st2pra2435">
      <xsl:text> .x-para-35-0 {margin-left: 0pt; margin-right: 0pt; text-indent: 0pt; margin-top: 6pt; margin-bottom: 6pt; }</xsl:text>
   </xsl:template>

<xsl:template match="step2/para[position()&gt;1]" priority="18">
      <div>
         <!--Emit class values to reflect conditions-->
         <xsl:attribute name="class">
            <xsl:text> x-para-35-0</xsl:text>
         </xsl:attribute>
         <xsl:if test="@xml:lang">
            <xsl:attribute name="lang">
               <xsl:call-template name="return-lang-applying-language-map">
                  <xsl:with-param name="doclang" select="@xml:lang"/>
               </xsl:call-template>
            </xsl:attribute>
         </xsl:if>
         <xsl:copy-of select="@ch:*"/>
         <xsl:copy-of xmlns:dmp="http://www.arbortext.com/namespace/dmp/dmpmap" select="@dmp:*"/>
         <xsl:if test="@xml:lang">
            <xsl:attribute name="lang">
               <xsl:call-template name="return-lang-applying-language-map">
                  <xsl:with-param name="doclang" select="@xml:lang"/>
               </xsl:call-template>
            </xsl:attribute>
         </xsl:if>
         <xsl:call-template name="maybe-set-id"/>
         <!--Process this element's content-->
         <xsl:apply-templates/>
      </div>
   </xsl:template>

<xsl:template name="__style-for_para.53nuitra2736">
      <xsl:text> .x-para-36-0 {margin-left: 0pt; margin-right: 0pt; text-indent: 0pt; margin-top: 6pt; margin-bottom: 6pt; }</xsl:text>
   </xsl:template>

<xsl:template match="numlitem/para[position()&gt;1]" priority="17">
      <div>
         <!--Emit class values to reflect conditions-->
         <xsl:attribute name="class">
            <xsl:text> x-para-36-0</xsl:text>
         </xsl:attribute>
         <xsl:if test="@xml:lang">
            <xsl:attribute name="lang">
               <xsl:call-template name="return-lang-applying-language-map">
                  <xsl:with-param name="doclang" select="@xml:lang"/>
               </xsl:call-template>
            </xsl:attribute>
         </xsl:if>
         <xsl:copy-of select="@ch:*"/>
         <xsl:copy-of xmlns:dmp="http://www.arbortext.com/namespace/dmp/dmpmap" select="@dmp:*"/>
         <xsl:if test="@xml:lang">
            <xsl:attribute name="lang">
               <xsl:call-template name="return-lang-applying-language-map">
                  <xsl:with-param name="doclang" select="@xml:lang"/>
               </xsl:call-template>
            </xsl:attribute>
         </xsl:if>
         <xsl:call-template name="maybe-set-id"/>
         <!--Process this element's content-->
         <xsl:apply-templates/>
      </div>
   </xsl:template>

<xsl:template name="__style-for_para.53untera2637">
      <xsl:text> .x-para-37-0 {margin-left: 0pt; margin-right: 0pt; text-indent: 0pt; margin-top: 6pt; margin-bottom: 6pt; }</xsl:text>
   </xsl:template>

<xsl:template match="unlitem/para[position()&gt;1]" priority="16">
      <div>
         <!--Emit class values to reflect conditions-->
         <xsl:attribute name="class">
            <xsl:text> x-para-37-0</xsl:text>
         </xsl:attribute>
         <xsl:if test="@xml:lang">
            <xsl:attribute name="lang">
               <xsl:call-template name="return-lang-applying-language-map">
                  <xsl:with-param name="doclang" select="@xml:lang"/>
               </xsl:call-template>
            </xsl:attribute>
         </xsl:if>
         <xsl:copy-of select="@ch:*"/>
         <xsl:copy-of xmlns:dmp="http://www.arbortext.com/namespace/dmp/dmpmap" select="@dmp:*"/>
         <xsl:if test="@xml:lang">
            <xsl:attribute name="lang">
               <xsl:call-template name="return-lang-applying-language-map">
                  <xsl:with-param name="doclang" select="@xml:lang"/>
               </xsl:call-template>
            </xsl:attribute>
         </xsl:if>
         <xsl:call-template name="maybe-set-id"/>
         <!--Process this element's content-->
         <xsl:apply-templates/>
      </div>
   </xsl:template>

<xsl:template name="__style-for_para.53prtera2738">
      <xsl:text> .x-para-38-0 {margin-left: 0pt; margin-right: 0pt; text-indent: 0pt; margin-top: 6pt; margin-bottom: 6pt; }</xsl:text>
   </xsl:template>

<xsl:template match="prcitem4/para[position()&gt;1]" priority="15">
      <div>
         <!--Emit class values to reflect conditions-->
         <xsl:attribute name="class">
            <xsl:text> x-para-38-0</xsl:text>
         </xsl:attribute>
         <xsl:if test="@xml:lang">
            <xsl:attribute name="lang">
               <xsl:call-template name="return-lang-applying-language-map">
                  <xsl:with-param name="doclang" select="@xml:lang"/>
               </xsl:call-template>
            </xsl:attribute>
         </xsl:if>
         <xsl:copy-of select="@ch:*"/>
         <xsl:copy-of xmlns:dmp="http://www.arbortext.com/namespace/dmp/dmpmap" select="@dmp:*"/>
         <xsl:if test="@xml:lang">
            <xsl:attribute name="lang">
               <xsl:call-template name="return-lang-applying-language-map">
                  <xsl:with-param name="doclang" select="@xml:lang"/>
               </xsl:call-template>
            </xsl:attribute>
         </xsl:if>
         <xsl:call-template name="maybe-set-id"/>
         <!--Process this element's content-->
         <xsl:apply-templates/>
      </div>
   </xsl:template>

<xsl:template name="__style-for_para.53l4emra2539">
      <xsl:text> .x-para-39-0 {margin-left: 0pt; margin-right: 0pt; text-indent: 0pt; margin-top: 6pt; margin-bottom: 6pt; }</xsl:text>
   </xsl:template>

<xsl:template match="l4item/para[position()&gt;1]" priority="14">
      <div>
         <!--Emit class values to reflect conditions-->
         <xsl:attribute name="class">
            <xsl:text> x-para-39-0</xsl:text>
         </xsl:attribute>
         <xsl:if test="@xml:lang">
            <xsl:attribute name="lang">
               <xsl:call-template name="return-lang-applying-language-map">
                  <xsl:with-param name="doclang" select="@xml:lang"/>
               </xsl:call-template>
            </xsl:attribute>
         </xsl:if>
         <xsl:copy-of select="@ch:*"/>
         <xsl:copy-of xmlns:dmp="http://www.arbortext.com/namespace/dmp/dmpmap" select="@dmp:*"/>
         <xsl:if test="@xml:lang">
            <xsl:attribute name="lang">
               <xsl:call-template name="return-lang-applying-language-map">
                  <xsl:with-param name="doclang" select="@xml:lang"/>
               </xsl:call-template>
            </xsl:attribute>
         </xsl:if>
         <xsl:call-template name="maybe-set-id"/>
         <!--Process this element's content-->
         <xsl:apply-templates/>
      </div>
   </xsl:template>

<xsl:template name="__style-for_para.53l3emra2540">
      <xsl:text> .x-para-40-0 {margin-left: 0pt; margin-right: 0pt; text-indent: 0pt; margin-top: 6pt; margin-bottom: 6pt; }</xsl:text>
   </xsl:template>

<xsl:template match="l3item/para[position()&gt;1]" priority="13">
      <div>
         <!--Emit class values to reflect conditions-->
         <xsl:attribute name="class">
            <xsl:text> x-para-40-0</xsl:text>
         </xsl:attribute>
         <xsl:if test="@xml:lang">
            <xsl:attribute name="lang">
               <xsl:call-template name="return-lang-applying-language-map">
                  <xsl:with-param name="doclang" select="@xml:lang"/>
               </xsl:call-template>
            </xsl:attribute>
         </xsl:if>
         <xsl:copy-of select="@ch:*"/>
         <xsl:copy-of xmlns:dmp="http://www.arbortext.com/namespace/dmp/dmpmap" select="@dmp:*"/>
         <xsl:if test="@xml:lang">
            <xsl:attribute name="lang">
               <xsl:call-template name="return-lang-applying-language-map">
                  <xsl:with-param name="doclang" select="@xml:lang"/>
               </xsl:call-template>
            </xsl:attribute>
         </xsl:if>
         <xsl:call-template name="maybe-set-id"/>
         <!--Process this element's content-->
         <xsl:apply-templates/>
      </div>
   </xsl:template>

<xsl:template name="__style-for_para.53l2emra2541">
      <xsl:text> .x-para-41-0 {margin-left: 0pt; margin-right: 0pt; text-indent: 0pt; margin-top: 6pt; margin-bottom: 6pt; }</xsl:text>
   </xsl:template>

<xsl:template match="l2item/para[position()&gt;1]" priority="12">
      <div>
         <!--Emit class values to reflect conditions-->
         <xsl:attribute name="class">
            <xsl:text> x-para-41-0</xsl:text>
         </xsl:attribute>
         <xsl:if test="@xml:lang">
            <xsl:attribute name="lang">
               <xsl:call-template name="return-lang-applying-language-map">
                  <xsl:with-param name="doclang" select="@xml:lang"/>
               </xsl:call-template>
            </xsl:attribute>
         </xsl:if>
         <xsl:copy-of select="@ch:*"/>
         <xsl:copy-of xmlns:dmp="http://www.arbortext.com/namespace/dmp/dmpmap" select="@dmp:*"/>
         <xsl:if test="@xml:lang">
            <xsl:attribute name="lang">
               <xsl:call-template name="return-lang-applying-language-map">
                  <xsl:with-param name="doclang" select="@xml:lang"/>
               </xsl:call-template>
            </xsl:attribute>
         </xsl:if>
         <xsl:call-template name="maybe-set-id"/>
         <!--Process this element's content-->
         <xsl:apply-templates/>
      </div>
   </xsl:template>

<xsl:template name="__style-for_para.53l1emra2542">
      <xsl:text> .x-para-42-0 {margin-left: 0pt; margin-right: 0pt; text-indent: 0pt; margin-top: 6pt; margin-bottom: 6pt; }</xsl:text>
   </xsl:template>

<xsl:template match="l1item/para[position()&gt;1]" priority="11">
      <div>
         <!--Emit class values to reflect conditions-->
         <xsl:attribute name="class">
            <xsl:text> x-para-42-0</xsl:text>
         </xsl:attribute>
         <xsl:if test="@xml:lang">
            <xsl:attribute name="lang">
               <xsl:call-template name="return-lang-applying-language-map">
                  <xsl:with-param name="doclang" select="@xml:lang"/>
               </xsl:call-template>
            </xsl:attribute>
         </xsl:if>
         <xsl:copy-of select="@ch:*"/>
         <xsl:copy-of xmlns:dmp="http://www.arbortext.com/namespace/dmp/dmpmap" select="@dmp:*"/>
         <xsl:if test="@xml:lang">
            <xsl:attribute name="lang">
               <xsl:call-template name="return-lang-applying-language-map">
                  <xsl:with-param name="doclang" select="@xml:lang"/>
               </xsl:call-template>
            </xsl:attribute>
         </xsl:if>
         <xsl:call-template name="maybe-set-id"/>
         <!--Process this element's content-->
         <xsl:apply-templates/>
      </div>
   </xsl:template>

<xsl:template name="__style-for_para.53stpara2343">
      <xsl:text> .x-para-43-0 {margin-left: 0pt; margin-right: 0pt; text-indent: 0pt; margin-top: 6pt; margin-bottom: 6pt; }</xsl:text>
   </xsl:template>

<xsl:template match="step/para[position()&gt;1]" priority="10">
      <div>
         <!--Emit class values to reflect conditions-->
         <xsl:attribute name="class">
            <xsl:text> x-para-43-0</xsl:text>
         </xsl:attribute>
         <xsl:if test="@xml:lang">
            <xsl:attribute name="lang">
               <xsl:call-template name="return-lang-applying-language-map">
                  <xsl:with-param name="doclang" select="@xml:lang"/>
               </xsl:call-template>
            </xsl:attribute>
         </xsl:if>
         <xsl:copy-of select="@ch:*"/>
         <xsl:copy-of xmlns:dmp="http://www.arbortext.com/namespace/dmp/dmpmap" select="@dmp:*"/>
         <xsl:if test="@xml:lang">
            <xsl:attribute name="lang">
               <xsl:call-template name="return-lang-applying-language-map">
                  <xsl:with-param name="doclang" select="@xml:lang"/>
               </xsl:call-template>
            </xsl:attribute>
         </xsl:if>
         <xsl:call-template name="maybe-set-id"/>
         <!--Process this element's content-->
         <xsl:apply-templates/>
      </div>
   </xsl:template>

<xsl:template name="__style-for_para.53itpara2344">
      <xsl:text> .x-para-44-0 {margin-left: 0pt; margin-right: 0pt; text-indent: 0pt; margin-top: 6pt; margin-bottom: 6pt; }</xsl:text>
   </xsl:template>

<xsl:template match="item/para[position()&gt;1]" priority="9">
      <div>
         <!--Emit class values to reflect conditions-->
         <xsl:attribute name="class">
            <xsl:text> x-para-44-0</xsl:text>
         </xsl:attribute>
         <xsl:if test="@xml:lang">
            <xsl:attribute name="lang">
               <xsl:call-template name="return-lang-applying-language-map">
                  <xsl:with-param name="doclang" select="@xml:lang"/>
               </xsl:call-template>
            </xsl:attribute>
         </xsl:if>
         <xsl:copy-of select="@ch:*"/>
         <xsl:copy-of xmlns:dmp="http://www.arbortext.com/namespace/dmp/dmpmap" select="@dmp:*"/>
         <xsl:if test="@xml:lang">
            <xsl:attribute name="lang">
               <xsl:call-template name="return-lang-applying-language-map">
                  <xsl:with-param name="doclang" select="@xml:lang"/>
               </xsl:call-template>
            </xsl:attribute>
         </xsl:if>
         <xsl:call-template name="maybe-set-id"/>
         <!--Process this element's content-->
         <xsl:apply-templates/>
      </div>
   </xsl:template>

<xsl:template name="__style-for_para.47taprra1340">
      <xsl:text> .x-para-45-0
{margin-left: 0pt; margin-right: 0pt; text-indent: 0pt; margin-top:
8pt; margin-left: 38pt; text-indent: -20pt; }</xsl:text>
   </xsl:template>

<xsl:template match="taskproc/para" priority="8">
      <div>
         <!--Emit class values to reflect conditions-->
         <xsl:attribute name="class">
            <xsl:text> x-para-45-0</xsl:text>
         </xsl:attribute>
         <xsl:if test="@xml:lang">
            <xsl:attribute name="lang">
               <xsl:call-template name="return-lang-applying-language-map">
                  <xsl:with-param name="doclang" select="@xml:lang"/>
               </xsl:call-template>
            </xsl:attribute>
         </xsl:if>
         <xsl:copy-of select="@ch:*"/>
         <xsl:copy-of xmlns:dmp="http://www.arbortext.com/namespace/dmp/dmpmap" select="@dmp:*"/>
         <xsl:if test="@xml:lang">
            <xsl:attribute name="lang">
               <xsl:call-template name="return-lang-applying-language-map">
                  <xsl:with-param name="doclang" select="@xml:lang"/>
               </xsl:call-template>
            </xsl:attribute>
         </xsl:if>
         <xsl:call-template name="maybe-set-id"/>
         <!--Process this element's content-->
         <xsl:apply-templates> </xsl:apply-templates>
      </div>
   </xsl:template>

<xsl:template name="__style-for_para.53tie-ra1546">
      <xsl:text> .x-para-46-0 {margin-left: 0pt; margin-right: 0pt; text-indent: 0pt; margin-top: 8pt; text-align: center; }</xsl:text>
   </xsl:template>

<xsl:template match="title-page/para" priority="7">
      <div>
         <!--Emit class values to reflect conditions-->
         <xsl:attribute name="class">
            <xsl:text> x-para-46-0</xsl:text>
         </xsl:attribute>
         <xsl:if test="@xml:lang">
            <xsl:attribute name="lang">
               <xsl:call-template name="return-lang-applying-language-map">
                  <xsl:with-param name="doclang" select="@xml:lang"/>
               </xsl:call-template>
            </xsl:attribute>
         </xsl:if>
         <xsl:copy-of select="@ch:*"/>
         <xsl:copy-of xmlns:dmp="http://www.arbortext.com/namespace/dmp/dmpmap" select="@dmp:*"/>
         <xsl:if test="@xml:lang">
            <xsl:attribute name="lang">
               <xsl:call-template name="return-lang-applying-language-map">
                  <xsl:with-param name="doclang" select="@xml:lang"/>
               </xsl:call-template>
            </xsl:attribute>
         </xsl:if>
         <xsl:call-template name="maybe-set-id"/>
         <!--Process this element's content-->
         <xsl:apply-templates/>
      </div>
   </xsl:template>

<xsl:template name="__style-for_para.53nuitra1347">
      <xsl:text> .x-para-47-0 {margin-left: 0pt; margin-right: 0pt; margin-top: 8pt; }</xsl:text>
   </xsl:template>

<xsl:template match="numlitem/para" priority="6">
      <span>
         <!--Emit class values to reflect conditions-->
         <xsl:attribute name="class">
            <xsl:text> x-para-47-0</xsl:text>
         </xsl:attribute>
         <xsl:if test="@xml:lang">
            <xsl:attribute name="lang">
               <xsl:call-template name="return-lang-applying-language-map">
                  <xsl:with-param name="doclang" select="@xml:lang"/>
               </xsl:call-template>
            </xsl:attribute>
         </xsl:if>
         <xsl:copy-of select="@ch:*"/>
         <xsl:copy-of xmlns:dmp="http://www.arbortext.com/namespace/dmp/dmpmap" select="@dmp:*"/>
         <xsl:if test="@xml:lang">
            <xsl:attribute name="lang">
               <xsl:call-template name="return-lang-applying-language-map">
                  <xsl:with-param name="doclang" select="@xml:lang"/>
               </xsl:call-template>
            </xsl:attribute>
         </xsl:if>
         <xsl:call-template name="maybe-set-id"/>
         <!--Process this element's content-->
         <xsl:apply-templates/>
      </span>
   </xsl:template>

<xsl:template name="__style-for_para.39tprera1235">
      <xsl:text> .x-para-48-0
{margin-left: 0pt; margin-right: 0pt; text-indent: 0pt; margin-top:
8pt; margin-left: 36pt; text-indent: -18pt; }</xsl:text>
   </xsl:template>

<xsl:template match="tprereq/para" priority="5">
      <div>
         <!--Emit class values to reflect conditions-->
         <xsl:attribute name="class">
            <xsl:text> x-para-48-0</xsl:text>
         </xsl:attribute>
         <xsl:if test="@xml:lang">
            <xsl:attribute name="lang">
               <xsl:call-template name="return-lang-applying-language-map">
                  <xsl:with-param name="doclang" select="@xml:lang"/>
               </xsl:call-template>
            </xsl:attribute>
         </xsl:if>
         <xsl:copy-of select="@ch:*"/>
         <xsl:copy-of xmlns:dmp="http://www.arbortext.com/namespace/dmp/dmpmap" select="@dmp:*"/>
         <xsl:if test="@xml:lang">
            <xsl:attribute name="lang">
               <xsl:call-template name="return-lang-applying-language-map">
                  <xsl:with-param name="doclang" select="@xml:lang"/>
               </xsl:call-template>
            </xsl:attribute>
         </xsl:if>
         <xsl:call-template name="maybe-set-id"/>
         <!--Process this element's content-->
         <xsl:apply-templates> </xsl:apply-templates>
      </div>
   </xsl:template>

<xsl:template name="__style-for_para.53sbrpra1049">
      <xsl:text> .x-para-49-0 {margin-left: 0pt; margin-right: 0pt; }</xsl:text>
   </xsl:template>

<xsl:template match="sbnbr/para" priority="4">
      <span>
         <!--Emit class values to reflect conditions-->
         <xsl:attribute name="class">
            <xsl:text> x-para-49-0</xsl:text>
         </xsl:attribute>
         <xsl:if test="@xml:lang">
            <xsl:attribute name="lang">
               <xsl:call-template name="return-lang-applying-language-map">
                  <xsl:with-param name="doclang" select="@xml:lang"/>
               </xsl:call-template>
            </xsl:attribute>
         </xsl:if>
         <xsl:copy-of select="@ch:*"/>
         <xsl:copy-of xmlns:dmp="http://www.arbortext.com/namespace/dmp/dmpmap" select="@dmp:*"/>
         <xsl:if test="@xml:lang">
            <xsl:attribute name="lang">
               <xsl:call-template name="return-lang-applying-language-map">
                  <xsl:with-param name="doclang" select="@xml:lang"/>
               </xsl:call-template>
            </xsl:attribute>
         </xsl:if>
         <xsl:call-template name="maybe-set-id"/>
         <!--Process this element's content-->
         <xsl:apply-templates/>
      </span>
   </xsl:template>

<xsl:template name="__style-for_para.53n-rara1150">
      <xsl:text> .x-para-50-0 {margin-left: 0pt; margin-right: 0pt; text-indent: 0pt; margin-top: 8pt; margin-left: 18pt; text-indent: 0pt; }</xsl:text>
   </xsl:template>

<xsl:template match="n-para/para" priority="3">
      <div>
         <!--Emit class values to reflect conditions-->
         <xsl:attribute name="class">
            <xsl:text> x-para-50-0</xsl:text>
         </xsl:attribute>
         <xsl:if test="@xml:lang">
            <xsl:attribute name="lang">
               <xsl:call-template name="return-lang-applying-language-map">
                  <xsl:with-param name="doclang" select="@xml:lang"/>
               </xsl:call-template>
            </xsl:attribute>
         </xsl:if>
         <xsl:copy-of select="@ch:*"/>
         <xsl:copy-of xmlns:dmp="http://www.arbortext.com/namespace/dmp/dmpmap" select="@dmp:*"/>
         <xsl:if test="@xml:lang">
            <xsl:attribute name="lang">
               <xsl:call-template name="return-lang-applying-language-map">
                  <xsl:with-param name="doclang" select="@xml:lang"/>
               </xsl:call-template>
            </xsl:attribute>
         </xsl:if>
         <xsl:call-template name="maybe-set-id"/>
         <!--Process this element's content-->
         <xsl:apply-templates/>
      </div>
   </xsl:template>

<xsl:template name="__style-for_para.53suarra1251">
      <xsl:text> .x-para-51-0 {margin-left: 0pt; margin-right: 0pt; text-indent: 0pt; margin-top: 8pt; margin-left: 1.5em; text-indent: 0pt; margin-bottom: 6pt; }</xsl:text>
   </xsl:template>

<xsl:template match="subpara/para" priority="2">
      <div>
         <!--Emit class values to reflect conditions-->
         <xsl:attribute name="class">
            <xsl:text> x-para-51-0</xsl:text>
         </xsl:attribute>
         <xsl:if test="@xml:lang">
            <xsl:attribute name="lang">
               <xsl:call-template name="return-lang-applying-language-map">
                  <xsl:with-param name="doclang" select="@xml:lang"/>
               </xsl:call-template>
            </xsl:attribute>
         </xsl:if>
         <xsl:copy-of select="@ch:*"/>
         <xsl:copy-of xmlns:dmp="http://www.arbortext.com/namespace/dmp/dmpmap" select="@dmp:*"/>
         <xsl:if test="@xml:lang">
            <xsl:attribute name="lang">
               <xsl:call-template name="return-lang-applying-language-map">
                  <xsl:with-param name="doclang" select="@xml:lang"/>
               </xsl:call-template>
            </xsl:attribute>
         </xsl:if>
         <xsl:call-template name="maybe-set-id"/>
         <!--Process this element's content-->
         <xsl:apply-templates/>
      </div>
   </xsl:template>

<xsl:template name="__style-for_para.53non-ra1552">
      <xsl:text> .x-para-52-0 {margin-left: 0pt; margin-right: 0pt; text-indent: 0pt; margin-top: 8pt; margin-left: 18pt; text-indent: 0pt; }</xsl:text>
   </xsl:template>

<xsl:template match="nomen-col//para" priority="1">
      <div>
         <!--Emit class values to reflect conditions-->
         <xsl:attribute name="class">
            <xsl:text> x-para-52-0</xsl:text>
         </xsl:attribute>
         <xsl:if test="@xml:lang">
            <xsl:attribute name="lang">
               <xsl:call-template name="return-lang-applying-language-map">
                  <xsl:with-param name="doclang" select="@xml:lang"/>
               </xsl:call-template>
            </xsl:attribute>
         </xsl:if>
         <xsl:copy-of select="@ch:*"/>
         <xsl:copy-of xmlns:dmp="http://www.arbortext.com/namespace/dmp/dmpmap" select="@dmp:*"/>
         <xsl:if test="@xml:lang">
            <xsl:attribute name="lang">
               <xsl:call-template name="return-lang-applying-language-map">
                  <xsl:with-param name="doclang" select="@xml:lang"/>
               </xsl:call-template>
            </xsl:attribute>
         </xsl:if>
         <xsl:call-template name="maybe-set-id"/>
         <!--Process this element's content-->
         <xsl:apply-templates/>
      </div>
   </xsl:template>

<xsl:template name="__style-for_para.53para453">
      <xsl:text> .x-para-53-0 {margin-left: 0pt; margin-right: 0pt; text-indent: 0pt; margin-top: 8pt; margin-left: 18pt; text-indent: 0pt; }</xsl:text>
   </xsl:template>

<xsl:template match="para" priority="0">
      <div>
         <!--Emit class values to reflect conditions-->
         <xsl:attribute name="class">
            <xsl:text> x-para-53-0</xsl:text>
         </xsl:attribute>
         <xsl:if test="@xml:lang">
            <xsl:attribute name="lang">
               <xsl:call-template name="return-lang-applying-language-map">
                  <xsl:with-param name="doclang" select="@xml:lang"/>
               </xsl:call-template>
            </xsl:attribute>
         </xsl:if>
         <xsl:copy-of select="@ch:*"/>
         <xsl:copy-of xmlns:dmp="http://www.arbortext.com/namespace/dmp/dmpmap" select="@dmp:*"/>
         <xsl:if test="@xml:lang">
            <xsl:attribute name="lang">
               <xsl:call-template name="return-lang-applying-language-map">
                  <xsl:with-param name="doclang" select="@xml:lang"/>
               </xsl:call-template>
            </xsl:attribute>
         </xsl:if>
         <xsl:call-template name="maybe-set-id"/>
         <!--Process this element's content-->
         <xsl:apply-templates/>
      </div>
   </xsl:template>

<xsl:template name="__style-for_part-group.4chseup241">
      <xsl:text> .x-part-group-1-0 {margin-left: 0pt; margin-right: 0pt; text-indent: 0pt; margin-top: 6pt; margin-bottom: 6pt; margin-left: 0pt; text-indent: 0pt; }</xsl:text>
   </xsl:template>

<xsl:template match="chapsect-list/part-group" priority="3">
      <table border="0" cellpadding="0" cellspacing="0">
         <xsl:attribute name="style">
            <xsl:variable name="followWith"/>
            <xsl:if test="$followWith='tab'">table-layout: fixed; </xsl:if>
         </xsl:attribute>
         <!--Emit class values to reflect conditions-->
         <xsl:attribute name="class">
            <xsl:text> x-part-group-1-0</xsl:text> x--zero-left-margins</xsl:attribute>
         <xsl:if test="@xml:lang">
            <xsl:attribute name="lang">
               <xsl:call-template name="return-lang-applying-language-map">
                  <xsl:with-param name="doclang" select="@xml:lang"/>
               </xsl:call-template>
            </xsl:attribute>
         </xsl:if>
         <xsl:copy-of select="@ch:*"/>
         <xsl:copy-of xmlns:dmp="http://www.arbortext.com/namespace/dmp/dmpmap" select="@dmp:*"/>
         <xsl:if test="@xml:lang">
            <xsl:attribute name="lang">
               <xsl:call-template name="return-lang-applying-language-map">
                  <xsl:with-param name="doclang" select="@xml:lang"/>
               </xsl:call-template>
            </xsl:attribute>
         </xsl:if>
         <xsl:call-template name="maybe-set-id"/>
         <xsl:variable name="col1-width">0pt</xsl:variable>
         <xsl:variable name="col2-width">0pt</xsl:variable>
         <xsl:variable name="col3-width"/>
         <xsl:variable name="itemlabel-colnum">3</xsl:variable>
         <xsl:variable name="col2-align">center</xsl:variable>
         <col>
            <xsl:if test="$col1-width!=''">
               <xsl:attribute name="style">
                  <xsl:text>width: </xsl:text>
                  <xsl:value-of select="$col1-width"/>
               </xsl:attribute>
            </xsl:if>
         </col>
         <col>
            <xsl:if test="$col2-width!=''">
               <xsl:attribute name="style">
                  <xsl:text>width: </xsl:text>
                  <xsl:value-of select="$col2-width"/>
               </xsl:attribute>
            </xsl:if>
         </col>
         <col>
            <xsl:if test="$col3-width!=''">
               <xsl:attribute name="style">
                  <xsl:text>width: </xsl:text>
                  <xsl:value-of select="$col3-width"/>
               </xsl:attribute>
            </xsl:if>
         </col>
         <tbody>
            <tr valign="baseline">
               <td align="right">
                  <xsl:if test="$itemlabel-colnum=1">
                     <xsl:attribute name="style">word-break: keep-all; </xsl:attribute>
                  </xsl:if>
               </td>
               <td align="{$col2-align}">
                  <xsl:if test="$itemlabel-colnum=2">
                     <xsl:attribute name="style">word-break: keep-all; </xsl:attribute>
                  </xsl:if>
               </td>
               <td>
                  <xsl:if test="$itemlabel-colnum=3">
                     <xsl:attribute name="style">word-break: keep-all; </xsl:attribute>
                  </xsl:if>
                  <!--Process this element's content-->
                  <xsl:apply-templates select="node()[name(.)!='_sfe:BeforeOrAfterText']"/>
               </td>
            </tr>
         </tbody>
      </table>
   </xsl:template>

<xsl:template name="__style-for_part-group.4nuisup182">
      <xsl:text> .x-part-group-2-0 {margin-left: 0pt; margin-right: 0pt; text-indent: 0pt; margin-top: 6pt; margin-bottom: 6pt; margin-left: 0pt; text-indent: 0pt; }</xsl:text>
   </xsl:template>

<xsl:template match="numlist/part-group" priority="2">
      <table border="0" cellpadding="0" cellspacing="0">
         <xsl:attribute name="style">
            <xsl:variable name="followWith">tab</xsl:variable>
            <xsl:if test="$followWith='tab'">table-layout: fixed; </xsl:if>
         </xsl:attribute>
         <!--Emit class values to reflect conditions-->
         <xsl:attribute name="class">
            <xsl:text> x-part-group-2-0</xsl:text> x--zero-left-margins</xsl:attribute>
         <xsl:if test="@xml:lang">
            <xsl:attribute name="lang">
               <xsl:call-template name="return-lang-applying-language-map">
                  <xsl:with-param name="doclang" select="@xml:lang"/>
               </xsl:call-template>
            </xsl:attribute>
         </xsl:if>
         <xsl:copy-of select="@ch:*"/>
         <xsl:copy-of xmlns:dmp="http://www.arbortext.com/namespace/dmp/dmpmap" select="@dmp:*"/>
         <xsl:if test="@xml:lang">
            <xsl:attribute name="lang">
               <xsl:call-template name="return-lang-applying-language-map">
                  <xsl:with-param name="doclang" select="@xml:lang"/>
               </xsl:call-template>
            </xsl:attribute>
         </xsl:if>
         <xsl:call-template name="maybe-set-id"/>
         <xsl:variable name="col1-width">1.5em</xsl:variable>
         <xsl:variable name="col2-width">12pt</xsl:variable>
         <xsl:variable name="col3-width"/>
         <xsl:variable name="itemlabel-colnum">1</xsl:variable>
         <xsl:variable name="col2-align">right</xsl:variable>
         <col>
            <xsl:if test="$col1-width!=''">
               <xsl:attribute name="style">
                  <xsl:text>width: </xsl:text>
                  <xsl:value-of select="$col1-width"/>
               </xsl:attribute>
            </xsl:if>
         </col>
         <col>
            <xsl:if test="$col2-width!=''">
               <xsl:attribute name="style">
                  <xsl:text>width: </xsl:text>
                  <xsl:value-of select="$col2-width"/>
               </xsl:attribute>
            </xsl:if>
         </col>
         <col>
            <xsl:if test="$col3-width!=''">
               <xsl:attribute name="style">
                  <xsl:text>width: </xsl:text>
                  <xsl:value-of select="$col3-width"/>
               </xsl:attribute>
            </xsl:if>
         </col>
         <tbody>
            <tr valign="baseline">
               <td align="right">
                  <xsl:if test="$itemlabel-colnum=1">
                     <xsl:attribute name="style">word-break: keep-all; </xsl:attribute>
                     <xsl:apply-templates select="_sfe:BeforeOrAfterText[1]"/>
                  </xsl:if>
               </td>
               <td align="{$col2-align}">
                  <xsl:if test="$itemlabel-colnum=2">
                     <xsl:attribute name="style">word-break: keep-all; </xsl:attribute>
                     <xsl:apply-templates select="_sfe:BeforeOrAfterText[1]"/>
                  </xsl:if>
               </td>
               <td>
                  <xsl:if test="$itemlabel-colnum=3">
                     <xsl:attribute name="style">word-break: keep-all; </xsl:attribute>
                     <xsl:apply-templates select="_sfe:BeforeOrAfterText[1]"/>
                  </xsl:if>
                  <!--Process this element's content-->
                  <xsl:apply-templates select="node()[name(.)!='_sfe:BeforeOrAfterText']"/>
               </td>
            </tr>
         </tbody>
      </table>
   </xsl:template>

<xsl:template name="__style-for_part-group.4pwhaup273">
      <xsl:text> .x-part-group-3-0 {margin-left: 0pt; margin-right: 0pt; text-indent: 0pt; margin-top: 6pt; margin-bottom: 6pt; margin-left: 0pt; text-indent: 0pt; }</xsl:text>
   </xsl:template>

<xsl:template match="pwcchapsect-list/part-group" priority="1">
      <table border="0" cellpadding="0" cellspacing="0">
         <xsl:attribute name="style">
            <xsl:variable name="followWith"/>
            <xsl:if test="$followWith='tab'">table-layout: fixed; </xsl:if>
         </xsl:attribute>
         <!--Emit class values to reflect conditions-->
         <xsl:attribute name="class">
            <xsl:text> x-part-group-3-0</xsl:text> x--zero-left-margins</xsl:attribute>
         <xsl:if test="@xml:lang">
            <xsl:attribute name="lang">
               <xsl:call-template name="return-lang-applying-language-map">
                  <xsl:with-param name="doclang" select="@xml:lang"/>
               </xsl:call-template>
            </xsl:attribute>
         </xsl:if>
         <xsl:copy-of select="@ch:*"/>
         <xsl:copy-of xmlns:dmp="http://www.arbortext.com/namespace/dmp/dmpmap" select="@dmp:*"/>
         <xsl:if test="@xml:lang">
            <xsl:attribute name="lang">
               <xsl:call-template name="return-lang-applying-language-map">
                  <xsl:with-param name="doclang" select="@xml:lang"/>
               </xsl:call-template>
            </xsl:attribute>
         </xsl:if>
         <xsl:call-template name="maybe-set-id"/>
         <xsl:variable name="col1-width">0pt</xsl:variable>
         <xsl:variable name="col2-width">0pt</xsl:variable>
         <xsl:variable name="col3-width"/>
         <xsl:variable name="itemlabel-colnum">3</xsl:variable>
         <xsl:variable name="col2-align">center</xsl:variable>
         <col>
            <xsl:if test="$col1-width!=''">
               <xsl:attribute name="style">
                  <xsl:text>width: </xsl:text>
                  <xsl:value-of select="$col1-width"/>
               </xsl:attribute>
            </xsl:if>
         </col>
         <col>
            <xsl:if test="$col2-width!=''">
               <xsl:attribute name="style">
                  <xsl:text>width: </xsl:text>
                  <xsl:value-of select="$col2-width"/>
               </xsl:attribute>
            </xsl:if>
         </col>
         <col>
            <xsl:if test="$col3-width!=''">
               <xsl:attribute name="style">
                  <xsl:text>width: </xsl:text>
                  <xsl:value-of select="$col3-width"/>
               </xsl:attribute>
            </xsl:if>
         </col>
         <tbody>
            <tr valign="baseline">
               <td align="right">
                  <xsl:if test="$itemlabel-colnum=1">
                     <xsl:attribute name="style">word-break: keep-all; </xsl:attribute>
                  </xsl:if>
               </td>
               <td align="{$col2-align}">
                  <xsl:if test="$itemlabel-colnum=2">
                     <xsl:attribute name="style">word-break: keep-all; </xsl:attribute>
                  </xsl:if>
               </td>
               <td>
                  <xsl:if test="$itemlabel-colnum=3">
                     <xsl:attribute name="style">word-break: keep-all; </xsl:attribute>
                  </xsl:if>
                  <!--Process this element's content-->
                  <xsl:apply-templates select="node()[name(.)!='_sfe:BeforeOrAfterText']"/>
               </td>
            </tr>
         </tbody>
      </table>
   </xsl:template>

<xsl:template name="__style-for_part-group.4pa-gup104">
      <xsl:text> .x-part-group-4-0 {margin-left: 0pt; margin-right: 0pt; text-indent: 0pt; margin-top: 6pt; margin-bottom: 6pt; margin-left: 0pt; text-indent: 0pt; }</xsl:text>
   </xsl:template>

<xsl:template match="part-group" priority="0">
      <table border="0" cellpadding="0" cellspacing="0">
         <xsl:attribute name="style">
            <xsl:variable name="followWith"/>
            <xsl:if test="$followWith='tab'">table-layout: fixed; </xsl:if>
         </xsl:attribute>
         <!--Emit class values to reflect conditions-->
         <xsl:attribute name="class">
            <xsl:text> x-part-group-4-0</xsl:text> x--zero-left-margins</xsl:attribute>
         <xsl:if test="@xml:lang">
            <xsl:attribute name="lang">
               <xsl:call-template name="return-lang-applying-language-map">
                  <xsl:with-param name="doclang" select="@xml:lang"/>
               </xsl:call-template>
            </xsl:attribute>
         </xsl:if>
         <xsl:copy-of select="@ch:*"/>
         <xsl:copy-of xmlns:dmp="http://www.arbortext.com/namespace/dmp/dmpmap" select="@dmp:*"/>
         <xsl:if test="@xml:lang">
            <xsl:attribute name="lang">
               <xsl:call-template name="return-lang-applying-language-map">
                  <xsl:with-param name="doclang" select="@xml:lang"/>
               </xsl:call-template>
            </xsl:attribute>
         </xsl:if>
         <xsl:call-template name="maybe-set-id"/>
         <xsl:variable name="col1-width">0pt</xsl:variable>
         <xsl:variable name="col2-width">0pt</xsl:variable>
         <xsl:variable name="col3-width"/>
         <xsl:variable name="itemlabel-colnum">3</xsl:variable>
         <xsl:variable name="col2-align">center</xsl:variable>
         <col>
            <xsl:if test="$col1-width!=''">
               <xsl:attribute name="style">
                  <xsl:text>width: </xsl:text>
                  <xsl:value-of select="$col1-width"/>
               </xsl:attribute>
            </xsl:if>
         </col>
         <col>
            <xsl:if test="$col2-width!=''">
               <xsl:attribute name="style">
                  <xsl:text>width: </xsl:text>
                  <xsl:value-of select="$col2-width"/>
               </xsl:attribute>
            </xsl:if>
         </col>
         <col>
            <xsl:if test="$col3-width!=''">
               <xsl:attribute name="style">
                  <xsl:text>width: </xsl:text>
                  <xsl:value-of select="$col3-width"/>
               </xsl:attribute>
            </xsl:if>
         </col>
         <tbody>
            <tr valign="baseline">
               <td align="right">
                  <xsl:if test="$itemlabel-colnum=1">
                     <xsl:attribute name="style">word-break: keep-all; </xsl:attribute>
                  </xsl:if>
               </td>
               <td align="{$col2-align}">
                  <xsl:if test="$itemlabel-colnum=2">
                     <xsl:attribute name="style">word-break: keep-all; </xsl:attribute>
                  </xsl:if>
               </td>
               <td>
                  <xsl:if test="$itemlabel-colnum=3">
                     <xsl:attribute name="style">word-break: keep-all; </xsl:attribute>
                  </xsl:if>
                  <!--Process this element's content-->
                  <xsl:apply-templates select="node()[name(.)!='_sfe:BeforeOrAfterText']"/>
               </td>
            </tr>
         </tbody>
      </table>
   </xsl:template>

<xsl:template name="__style-for_part-loc.1">
      <xsl:text> .x-part-loc-1-0 {margin-left: 0pt; margin-right: 0pt; text-indent: 0pt; }</xsl:text>
   </xsl:template>

<xsl:template match="part-loc" priority="0">
      <div>
         <!--Emit class values to reflect conditions-->
         <xsl:attribute name="class">
            <xsl:text> x-part-loc-1-0</xsl:text>
         </xsl:attribute>
         <xsl:if test="@xml:lang">
            <xsl:attribute name="lang">
               <xsl:call-template name="return-lang-applying-language-map">
                  <xsl:with-param name="doclang" select="@xml:lang"/>
               </xsl:call-template>
            </xsl:attribute>
         </xsl:if>
         <xsl:copy-of select="@ch:*"/>
         <xsl:copy-of xmlns:dmp="http://www.arbortext.com/namespace/dmp/dmpmap" select="@dmp:*"/>
         <xsl:if test="@xml:lang">
            <xsl:attribute name="lang">
               <xsl:call-template name="return-lang-applying-language-map">
                  <xsl:with-param name="doclang" select="@xml:lang"/>
               </xsl:call-template>
            </xsl:attribute>
         </xsl:if>
         <xsl:call-template name="maybe-set-id"/>
         <!--Process this element's content-->
         <xsl:apply-templates/>
      </div>
   </xsl:template>

<xsl:template name="__style-for_partname.1">
      <xsl:text> .x-partname-1-0 {margin-left: 0pt; margin-right: 0pt; }</xsl:text>
   </xsl:template>

<xsl:template match="partname" priority="0">
      <!--Emit a nostyle template-->
      <xsl:apply-templates/>
   </xsl:template>

<xsl:template name="__style-for_pcextract.1">
      <xsl:text> .x-pcextract-1-0 {margin-left: 0pt; margin-right: 0pt; }</xsl:text>
   </xsl:template>

<xsl:template match="pcextract" priority="0">
      <!--Emit a nostyle template-->
      <xsl:apply-templates/>
   </xsl:template>

<xsl:template match="pgblk/_ufe:pdlist-title" priority="1">
  <div ch:title="notoc" class=" x--ufe-pdlist-title-1-0">
    <xsl:call-template name="t-base-div-title"/>
  </div>
</xsl:template>

<xsl:template match="pgblk-name" priority="0">
  <xsl:apply-templates/>
</xsl:template>

<xsl:template name="__style-for_pnr.1">
      <xsl:text> .x-pnr-1-0 {margin-left: 0pt; margin-right: 0pt; }</xsl:text>
   </xsl:template>

<xsl:template match="pnr" priority="0">
      <span>
         <!--Emit class values to reflect conditions-->
         <xsl:attribute name="class">
            <xsl:text> x-pnr-1-0</xsl:text>
         </xsl:attribute>
         <xsl:if test="@xml:lang">
            <xsl:attribute name="lang">
               <xsl:call-template name="return-lang-applying-language-map">
                  <xsl:with-param name="doclang" select="@xml:lang"/>
               </xsl:call-template>
            </xsl:attribute>
         </xsl:if>
         <xsl:copy-of select="@ch:*"/>
         <xsl:copy-of xmlns:dmp="http://www.arbortext.com/namespace/dmp/dmpmap" select="@dmp:*"/>
         <xsl:if test="@xml:lang">
            <xsl:attribute name="lang">
               <xsl:call-template name="return-lang-applying-language-map">
                  <xsl:with-param name="doclang" select="@xml:lang"/>
               </xsl:call-template>
            </xsl:attribute>
         </xsl:if>
         <xsl:call-template name="maybe-set-id"/>
         <!--Process this element's content-->
         <xsl:apply-templates/>
      </span>
   </xsl:template>

<xsl:template name="__style-for_post-tr.1">
      <xsl:text> .x-post-tr-1-0 {margin-left: 0pt; margin-right: 0pt; }</xsl:text>
   </xsl:template>

<xsl:template match="post-tr" priority="0">
      <!--Emit a nostyle template-->
      <xsl:apply-templates/>
   </xsl:template>

<xsl:template name="__style-for_postal.1">
      <xsl:text> .x-postal-1-0 {margin-left: 0pt; margin-right: 0pt; }</xsl:text>
   </xsl:template>

<xsl:template match="postal" priority="0">
      <span>
         <!--Emit class values to reflect conditions-->
         <xsl:attribute name="class">
            <xsl:text> x-postal-1-0</xsl:text>
         </xsl:attribute>
         <xsl:if test="@xml:lang">
            <xsl:attribute name="lang">
               <xsl:call-template name="return-lang-applying-language-map">
                  <xsl:with-param name="doclang" select="@xml:lang"/>
               </xsl:call-template>
            </xsl:attribute>
         </xsl:if>
         <xsl:copy-of select="@ch:*"/>
         <xsl:copy-of xmlns:dmp="http://www.arbortext.com/namespace/dmp/dmpmap" select="@dmp:*"/>
         <xsl:if test="@xml:lang">
            <xsl:attribute name="lang">
               <xsl:call-template name="return-lang-applying-language-map">
                  <xsl:with-param name="doclang" select="@xml:lang"/>
               </xsl:call-template>
            </xsl:attribute>
         </xsl:if>
         <xsl:call-template name="maybe-set-id"/>
         <!--Process this element's content-->
         <xsl:apply-templates/>
      </span>
   </xsl:template>

<xsl:template name="__style-for_postsb.1">
      <xsl:text> .x-postsb-1-0 {margin-left:
0pt; margin-right: 0pt; color: #0000FF; text-decoration: underline
; text-decoration: underline ; }</xsl:text>
   </xsl:template>

<xsl:template match="postsb" priority="0">
      <span xmlns:dmp="http://www.arbortext.com/namespace/dmp/dmpmap">
         <!--Emit class values to reflect conditions-->
         <xsl:attribute name="class">
            <xsl:text> x-postsb-1-0</xsl:text>
         </xsl:attribute>
         <xsl:copy-of select="@ch:*"/>
         <xsl:copy-of select="@dmp:*"/>
         <xsl:call-template name="maybe-set-id"/>
         <!--Process this element's content-->
         <a href="#">
            <xsl:attribute name="onClick">
               <xsl:text>sbLink('</xsl:text>
               <xsl:value-of select="."/>
               <xsl:text>');</xsl:text>
            </xsl:attribute>
            <xsl:apply-templates/>
         </a>
      </span>
   </xsl:template>

<xsl:template name="__style-for_pre-tr.1">
      <xsl:text> .x-pre-tr-1-0 {margin-left: 0pt; margin-right: 0pt; }</xsl:text>
   </xsl:template>

<xsl:template match="pre-tr" priority="0">
      <!--Emit a nostyle template-->
      <xsl:apply-templates/>
   </xsl:template>

<xsl:template name="__style-for_presb.1">
      <xsl:text> .x-presb-1-0 {margin-left:
0pt; margin-right: 0pt; color: #0000FF; text-decoration: underline
; text-decoration: underline ; }</xsl:text>
   </xsl:template>

<xsl:template match="presb" priority="0">
      <span xmlns:dmp="http://www.arbortext.com/namespace/dmp/dmpmap">
         <!--Emit class values to reflect conditions-->
         <xsl:attribute name="class">
            <xsl:text> x-presb-1-0</xsl:text>
         </xsl:attribute>
         <xsl:copy-of select="@ch:*"/>
         <xsl:copy-of select="@dmp:*"/>
         <xsl:call-template name="maybe-set-id"/>
         <!--Process this element's content-->
         <a href="#">
            <xsl:attribute name="onClick">
               <xsl:text>sbLink('</xsl:text>
               <xsl:value-of select="."/>
               <xsl:text>');</xsl:text>
            </xsl:attribute>
            <xsl:apply-templates/>
         </a>
      </span>
   </xsl:template>

<xsl:template name="__style-for_procedure.1">
      <xsl:text> .x-procedure-1-0 {margin-left: 0pt; margin-right: 0pt; text-indent: 0pt; margin-top: 8pt; margin-left: 18pt; text-indent: 0pt; }</xsl:text>
   </xsl:template>

<xsl:template match="procedure" priority="0">
      <div>
         <!--Emit class values to reflect conditions-->
         <xsl:attribute name="class">
            <xsl:text> x-procedure-1-0</xsl:text>
         </xsl:attribute>
         <xsl:if test="@xml:lang">
            <xsl:attribute name="lang">
               <xsl:call-template name="return-lang-applying-language-map">
                  <xsl:with-param name="doclang" select="@xml:lang"/>
               </xsl:call-template>
            </xsl:attribute>
         </xsl:if>
         <xsl:copy-of select="@ch:*"/>
         <xsl:copy-of xmlns:dmp="http://www.arbortext.com/namespace/dmp/dmpmap" select="@dmp:*"/>
         <xsl:if test="@xml:lang">
            <xsl:attribute name="lang">
               <xsl:call-template name="return-lang-applying-language-map">
                  <xsl:with-param name="doclang" select="@xml:lang"/>
               </xsl:call-template>
            </xsl:attribute>
         </xsl:if>
         <xsl:call-template name="maybe-set-id">
            <xsl:with-param name="only-if-id-attr" select="'no'"/>
            <xsl:with-param name="generated-id-prefix" select="'styler-id'"/>
         </xsl:call-template>
         <!--Process this element's content-->
         <xsl:apply-templates/>
      </div>
   </xsl:template>

<xsl:template name="__style-for_process.1">
      <xsl:text> .x-process-1-0 {margin-left: 0pt; margin-right: 0pt; }</xsl:text>
   </xsl:template>

<xsl:template match="process" priority="0">
      <span>
         <!--Emit class values to reflect conditions-->
         <xsl:attribute name="class">
            <xsl:text> x-process-1-0</xsl:text>
         </xsl:attribute>
         <xsl:if test="@xml:lang">
            <xsl:attribute name="lang">
               <xsl:call-template name="return-lang-applying-language-map">
                  <xsl:with-param name="doclang" select="@xml:lang"/>
               </xsl:call-template>
            </xsl:attribute>
         </xsl:if>
         <xsl:copy-of select="@ch:*"/>
         <xsl:copy-of xmlns:dmp="http://www.arbortext.com/namespace/dmp/dmpmap" select="@dmp:*"/>
         <xsl:if test="@xml:lang">
            <xsl:attribute name="lang">
               <xsl:call-template name="return-lang-applying-language-map">
                  <xsl:with-param name="doclang" select="@xml:lang"/>
               </xsl:call-template>
            </xsl:attribute>
         </xsl:if>
         <xsl:call-template name="maybe-set-id"/>
         <!--Process this element's content-->
         <xsl:apply-templates/>
      </span>
   </xsl:template>

<xsl:template name="__style-for__ufe-proprietary-notice.2pwmmce371">
      <xsl:text> .x--ufe-proprietary-notice-1-0 {margin-left: 0pt; margin-right: 0pt; text-indent: 0pt; font-weight: normal; font-size: 10pt; text-align: justify; margin-top: 24pt; }</xsl:text>
   </xsl:template>

<xsl:template match="pwclmm-title//_ufe:proprietary-notice" priority="1">
      <div>
         <!--Emit class values to reflect conditions-->
         <xsl:attribute name="class">
            <xsl:text> x--ufe-proprietary-notice-1-0</xsl:text>
         </xsl:attribute>
         <xsl:if test="@xml:lang">
            <xsl:attribute name="lang">
               <xsl:call-template name="return-lang-applying-language-map">
                  <xsl:with-param name="doclang" select="@xml:lang"/>
               </xsl:call-template>
            </xsl:attribute>
         </xsl:if>
         <xsl:copy-of select="@ch:*"/>
         <xsl:copy-of xmlns:dmp="http://www.arbortext.com/namespace/dmp/dmpmap" select="@dmp:*"/>
         <xsl:if test="@xml:lang">
            <xsl:attribute name="lang">
               <xsl:call-template name="return-lang-applying-language-map">
                  <xsl:with-param name="doclang" select="@xml:lang"/>
               </xsl:call-template>
            </xsl:attribute>
         </xsl:if>
         <xsl:call-template name="maybe-set-id"/>
         <!--Process this element's content-->
         <xsl:apply-templates/>
      </div>
   </xsl:template>

<xsl:template name="__style-for__ufe-proprietary-notice.2_uprce232">
      <xsl:text> .x--ufe-proprietary-notice-2-0 {margin-left: 0pt; margin-right: 0pt; text-indent: 0pt; font-weight: normal; font-size: 10pt; text-align: center; margin-top: 24pt; }</xsl:text>
   </xsl:template>

<xsl:template match="_ufe:proprietary-notice" priority="0">
      <div>
         <!--Emit class values to reflect conditions-->
         <xsl:attribute name="class">
            <xsl:text> x--ufe-proprietary-notice-2-0</xsl:text>
         </xsl:attribute>
         <xsl:if test="@xml:lang">
            <xsl:attribute name="lang">
               <xsl:call-template name="return-lang-applying-language-map">
                  <xsl:with-param name="doclang" select="@xml:lang"/>
               </xsl:call-template>
            </xsl:attribute>
         </xsl:if>
         <xsl:copy-of select="@ch:*"/>
         <xsl:copy-of xmlns:dmp="http://www.arbortext.com/namespace/dmp/dmpmap" select="@dmp:*"/>
         <xsl:if test="@xml:lang">
            <xsl:attribute name="lang">
               <xsl:call-template name="return-lang-applying-language-map">
                  <xsl:with-param name="doclang" select="@xml:lang"/>
               </xsl:call-template>
            </xsl:attribute>
         </xsl:if>
         <xsl:call-template name="maybe-set-id"/>
         <!--Process this element's content-->
         <xsl:apply-templates/>
      </div>
   </xsl:template>

<xsl:template name="__style-for__ufe-proprietary-warning.1">
      <xsl:text> .x--ufe-proprietary-warning-1-0 {margin-left: 0pt; margin-right: 0pt; text-indent: 0pt; margin-top: 8pt; font-weight: normal; font-size: 10pt; text-decoration: underline ; text-align: center; }</xsl:text>
   </xsl:template>

<xsl:template match="_ufe:proprietary-warning" priority="0">
      <div>
         <!--Emit class values to reflect conditions-->
         <xsl:attribute name="class">
            <xsl:text> x--ufe-proprietary-warning-1-0</xsl:text>
         </xsl:attribute>
         <xsl:if test="@xml:lang">
            <xsl:attribute name="lang">
               <xsl:call-template name="return-lang-applying-language-map">
                  <xsl:with-param name="doclang" select="@xml:lang"/>
               </xsl:call-template>
            </xsl:attribute>
         </xsl:if>
         <xsl:copy-of select="@ch:*"/>
         <xsl:copy-of xmlns:dmp="http://www.arbortext.com/namespace/dmp/dmpmap" select="@dmp:*"/>
         <xsl:if test="@xml:lang">
            <xsl:attribute name="lang">
               <xsl:call-template name="return-lang-applying-language-map">
                  <xsl:with-param name="doclang" select="@xml:lang"/>
               </xsl:call-template>
            </xsl:attribute>
         </xsl:if>
         <xsl:call-template name="maybe-set-id"/>
         <!--Process this element's content-->
         <xsl:apply-templates/>
      </div>
   </xsl:template>

<xsl:template name="__style-for_province.1">
      <xsl:text> .x-province-1-0 {margin-left: 0pt; margin-right: 0pt; }</xsl:text>
   </xsl:template>

<xsl:template match="province" priority="0">
      <span>
         <!--Emit class values to reflect conditions-->
         <xsl:attribute name="class">
            <xsl:text> x-province-1-0</xsl:text>
         </xsl:attribute>
         <xsl:if test="@xml:lang">
            <xsl:attribute name="lang">
               <xsl:call-template name="return-lang-applying-language-map">
                  <xsl:with-param name="doclang" select="@xml:lang"/>
               </xsl:call-template>
            </xsl:attribute>
         </xsl:if>
         <xsl:copy-of select="@ch:*"/>
         <xsl:copy-of xmlns:dmp="http://www.arbortext.com/namespace/dmp/dmpmap" select="@dmp:*"/>
         <xsl:if test="@xml:lang">
            <xsl:attribute name="lang">
               <xsl:call-template name="return-lang-applying-language-map">
                  <xsl:with-param name="doclang" select="@xml:lang"/>
               </xsl:call-template>
            </xsl:attribute>
         </xsl:if>
         <xsl:call-template name="maybe-set-id"/>
         <!--Process this element's content-->
         <xsl:apply-templates/>
      </span>
   </xsl:template>

<xsl:template name="__style-for_qty.2qtty451">
      <xsl:text> .x-qty-1-0 {margin-left: 0pt; margin-right: 0pt; } .x-qty-1-1 {}</xsl:text>
   </xsl:template>

<xsl:template match="qty[ancestor::book[contains(@doctype,'ipc')]]" priority="1">
      <xsl:variable name="foClass">inline</xsl:variable>
      <xsl:variable name="blockness">inline</xsl:variable>
      <span>
         <!--Emit class values to reflect conditions-->
         <xsl:attribute name="class">
            <xsl:text> x-qty-1-0</xsl:text>
            <xsl:if test="(@per-assy and string(@per-assy)='TEXT') or (@per-assy and string(@per-assy)='EMPTY')"> x-qty-1-1</xsl:if>
         </xsl:attribute>
         <xsl:if test="@xml:lang">
            <xsl:attribute name="lang">
               <xsl:call-template name="return-lang-applying-language-map">
                  <xsl:with-param name="doclang" select="@xml:lang"/>
               </xsl:call-template>
            </xsl:attribute>
         </xsl:if>
         <xsl:copy-of select="@ch:*"/>
         <xsl:copy-of xmlns:dmp="http://www.arbortext.com/namespace/dmp/dmpmap" select="@dmp:*"/>
         <xsl:variable name="Breaks-chunkFilenameXPath"/>
         <xsl:variable name="Breaks-persistentFilename"/>
         <xsl:if test="($Breaks-persistentFilename='yes') and ($Breaks-chunkFilenameXPath!='')">
            <xsl:variable name="chunkFilename"/>
            <xsl:if test="$chunkFilename!=''">
               <xsl:attribute name="ch:filename">
                  <xsl:value-of select="$chunkFilename"/>
               </xsl:attribute>
               <xsl:attribute name="ch:namepriority">0</xsl:attribute>
            </xsl:if>
         </xsl:if>
         <xsl:if test="@xml:lang">
            <xsl:attribute name="lang">
               <xsl:call-template name="return-lang-applying-language-map">
                  <xsl:with-param name="doclang" select="@xml:lang"/>
               </xsl:call-template>
            </xsl:attribute>
         </xsl:if>
         <xsl:call-template name="maybe-set-id"/>
         <!--Process this element's content-->
         <xsl:apply-templates/>
      </span>
   </xsl:template>

<xsl:template name="__style-for_qty.2qtty32">
      <xsl:text> .x-qty-2-0 {margin-left: 0pt; margin-right: 0pt; }</xsl:text>
   </xsl:template>

<xsl:template match="qty" priority="0">
      <xsl:param name="hidden" select="'yes'"/>
      <xsl:if test="$hidden='no'">
         <span>
            <!--Emit class values to reflect conditions-->
            <xsl:attribute name="class">
               <xsl:text> x-qty-2-0</xsl:text>
            </xsl:attribute>
            <xsl:if test="@xml:lang">
               <xsl:attribute name="lang">
                  <xsl:call-template name="return-lang-applying-language-map">
                     <xsl:with-param name="doclang" select="@xml:lang"/>
                  </xsl:call-template>
               </xsl:attribute>
            </xsl:if>
            <xsl:copy-of select="@ch:*"/>
            <xsl:copy-of xmlns:dmp="http://www.arbortext.com/namespace/dmp/dmpmap" select="@dmp:*"/>
            <xsl:if test="@xml:lang">
               <xsl:attribute name="lang">
                  <xsl:call-template name="return-lang-applying-language-map">
                     <xsl:with-param name="doclang" select="@xml:lang"/>
                  </xsl:call-template>
               </xsl:attribute>
            </xsl:if>
            <xsl:call-template name="maybe-set-id"/>
            <!--Suppress element contents (but not gentext) unless unhidden-->
            <xsl:choose>
               <xsl:when test="$hidden='no'">
                  <xsl:apply-templates/>
               </xsl:when>
               <xsl:otherwise>
                  <xsl:apply-templates select="_sfe:BeforeOrAfterText"/>
               </xsl:otherwise>
            </xsl:choose>
         </span>
      </xsl:if>
   </xsl:template>

<xsl:template name="__style-for_quantity.1">
      <xsl:text> .x-quantity-1-0 {margin-left: 0pt; margin-right: 0pt; text-indent: 0pt; }</xsl:text>
   </xsl:template>

<xsl:template match="quantity" priority="0">
      <div>
         <!--Emit class values to reflect conditions-->
         <xsl:attribute name="class">
            <xsl:text> x-quantity-1-0</xsl:text>
         </xsl:attribute>
         <xsl:if test="@xml:lang">
            <xsl:attribute name="lang">
               <xsl:call-template name="return-lang-applying-language-map">
                  <xsl:with-param name="doclang" select="@xml:lang"/>
               </xsl:call-template>
            </xsl:attribute>
         </xsl:if>
         <xsl:copy-of select="@ch:*"/>
         <xsl:copy-of xmlns:dmp="http://www.arbortext.com/namespace/dmp/dmpmap" select="@dmp:*"/>
         <xsl:if test="@xml:lang">
            <xsl:attribute name="lang">
               <xsl:call-template name="return-lang-applying-language-map">
                  <xsl:with-param name="doclang" select="@xml:lang"/>
               </xsl:call-template>
            </xsl:attribute>
         </xsl:if>
         <xsl:call-template name="maybe-set-id"/>
         <!--Process this element's content-->
         <xsl:apply-templates/>
      </div>
   </xsl:template>

<xsl:template name="__style-for_record-of-revisions.1">
      <xsl:text> .x-record-of-revisions-1-0 {margin-left: 0pt; margin-right: 0pt; }</xsl:text>
   </xsl:template>

<xsl:template match="record-of-revisions" priority="0">
      <!--Emit a nostyle template-->
      <xsl:apply-templates/>
   </xsl:template>

<xsl:template name="__style-for_ref.2adesef111">
      <xsl:text> .x-ref-1-0 {margin-left: 0pt; margin-right: 0pt; text-indent: 0pt; }</xsl:text>
   </xsl:template>

<xsl:template match="address/ref" priority="1">
      <div>
         <!--Emit class values to reflect conditions-->
         <xsl:attribute name="class">
            <xsl:text> x-ref-1-0</xsl:text>
         </xsl:attribute>
         <xsl:if test="@xml:lang">
            <xsl:attribute name="lang">
               <xsl:call-template name="return-lang-applying-language-map">
                  <xsl:with-param name="doclang" select="@xml:lang"/>
               </xsl:call-template>
            </xsl:attribute>
         </xsl:if>
         <xsl:copy-of select="@ch:*"/>
         <xsl:copy-of xmlns:dmp="http://www.arbortext.com/namespace/dmp/dmpmap" select="@dmp:*"/>
         <xsl:if test="@xml:lang">
            <xsl:attribute name="lang">
               <xsl:call-template name="return-lang-applying-language-map">
                  <xsl:with-param name="doclang" select="@xml:lang"/>
               </xsl:call-template>
            </xsl:attribute>
         </xsl:if>
         <xsl:call-template name="maybe-set-id"/>
         <!--Process this element's content-->
         <xsl:apply-templates/>
      </div>
   </xsl:template>

<xsl:template name="__style-for_ref.2reef32">
      <xsl:text> .x-ref-2-0 {margin-left: 0pt; margin-right: 0pt; text-indent: 0pt; }</xsl:text>
   </xsl:template>

<xsl:template match="ref" priority="0">
      <div>
         <!--Emit class values to reflect conditions-->
         <xsl:attribute name="class">
            <xsl:text> x-ref-2-0</xsl:text>
         </xsl:attribute>
         <xsl:if test="@xml:lang">
            <xsl:attribute name="lang">
               <xsl:call-template name="return-lang-applying-language-map">
                  <xsl:with-param name="doclang" select="@xml:lang"/>
               </xsl:call-template>
            </xsl:attribute>
         </xsl:if>
         <xsl:copy-of select="@ch:*"/>
         <xsl:copy-of xmlns:dmp="http://www.arbortext.com/namespace/dmp/dmpmap" select="@dmp:*"/>
         <xsl:if test="@xml:lang">
            <xsl:attribute name="lang">
               <xsl:call-template name="return-lang-applying-language-map">
                  <xsl:with-param name="doclang" select="@xml:lang"/>
               </xsl:call-template>
            </xsl:attribute>
         </xsl:if>
         <xsl:call-template name="maybe-set-id"/>
         <!--Process this element's content-->
         <xsl:apply-templates/>
      </div>
   </xsl:template>

<xsl:template name="__style-for_refext.2taerxt131">
      <xsl:text> .x-refext-1-0 {margin-left: 0pt; margin-right: 0pt; text-indent: 0pt; }</xsl:text>
   </xsl:template>

<xsl:template match="table//refext" priority="1">
      <div>
         <!--Emit class values to reflect conditions-->
         <xsl:attribute name="class">
            <xsl:text> x-refext-1-0</xsl:text>
         </xsl:attribute>
         <xsl:if test="@xml:lang">
            <xsl:attribute name="lang">
               <xsl:call-template name="return-lang-applying-language-map">
                  <xsl:with-param name="doclang" select="@xml:lang"/>
               </xsl:call-template>
            </xsl:attribute>
         </xsl:if>
         <xsl:copy-of select="@ch:*"/>
         <xsl:copy-of xmlns:dmp="http://www.arbortext.com/namespace/dmp/dmpmap" select="@dmp:*"/>
         <xsl:if test="@xml:lang">
            <xsl:attribute name="lang">
               <xsl:call-template name="return-lang-applying-language-map">
                  <xsl:with-param name="doclang" select="@xml:lang"/>
               </xsl:call-template>
            </xsl:attribute>
         </xsl:if>
         <xsl:call-template name="maybe-set-id"/>
         <!--Process this element's content-->
         <xsl:apply-templates/>
      </div>
   </xsl:template>

<xsl:template name="__style-for_refext.2rextxt62">
      <xsl:text> .x-refext-2-0 {margin-left: 0pt; margin-right: 0pt; }</xsl:text>
   </xsl:template>

<xsl:template match="refext" priority="0">
      <span>
         <!--Emit class values to reflect conditions-->
         <xsl:attribute name="class">
            <xsl:text> x-refext-2-0</xsl:text>
         </xsl:attribute>
         <xsl:if test="@xml:lang">
            <xsl:attribute name="lang">
               <xsl:call-template name="return-lang-applying-language-map">
                  <xsl:with-param name="doclang" select="@xml:lang"/>
               </xsl:call-template>
            </xsl:attribute>
         </xsl:if>
         <xsl:copy-of select="@ch:*"/>
         <xsl:copy-of xmlns:dmp="http://www.arbortext.com/namespace/dmp/dmpmap" select="@dmp:*"/>
         <xsl:if test="@xml:lang">
            <xsl:attribute name="lang">
               <xsl:call-template name="return-lang-applying-language-map">
                  <xsl:with-param name="doclang" select="@xml:lang"/>
               </xsl:call-template>
            </xsl:attribute>
         </xsl:if>
         <xsl:call-template name="maybe-set-id"/>
         <!--Process this element's content-->
         <xsl:apply-templates/>
      </span>
   </xsl:template>

<xsl:template name="__style-for_refint.6taernt801">
      <xsl:text> .x-refint-1-0 {margin-left: 0pt; margin-right: 0pt; text-indent: 0pt; }</xsl:text>
   </xsl:template>

<xsl:template match="table[@tabstyle='parts-list']//refint[ancestor::book[contains(@doctype, 'epc')]]" priority="5">
      <xsl:param name="hidden" select="'yes'"/>
      <div>
         <!--Emit class values to reflect conditions-->
         <xsl:attribute name="class">
            <xsl:text> x-refint-1-0</xsl:text>
         </xsl:attribute>
         <xsl:if test="@xml:lang">
            <xsl:attribute name="lang">
               <xsl:call-template name="return-lang-applying-language-map">
                  <xsl:with-param name="doclang" select="@xml:lang"/>
               </xsl:call-template>
            </xsl:attribute>
         </xsl:if>
         <xsl:copy-of select="@ch:*"/>
         <xsl:copy-of xmlns:dmp="http://www.arbortext.com/namespace/dmp/dmpmap" select="@dmp:*"/>
         <xsl:if test="@xml:lang">
            <xsl:attribute name="lang">
               <xsl:call-template name="return-lang-applying-language-map">
                  <xsl:with-param name="doclang" select="@xml:lang"/>
               </xsl:call-template>
            </xsl:attribute>
         </xsl:if>
         <xsl:call-template name="maybe-set-id"/>
         <!--Suppress element contents (but not gentext) unless unhidden-->
         <xsl:choose>
            <xsl:when test="$hidden='no'">
               <xsl:apply-templates/>
            </xsl:when>
            <xsl:otherwise>
               <xsl:apply-templates select="_sfe:BeforeOrAfterText"/>
            </xsl:otherwise>
         </xsl:choose>
      </div>
   </xsl:template>

<xsl:template name="__style-for_refint.6rentnt982">
      <xsl:text> .x-refint-2-0 {margin-left: 0pt; margin-right: 0pt; color: #000000; text-decoration: no-underline ; }</xsl:text>
   </xsl:template>

<xsl:template match="refint[name(id(@refid))='table' and (id(@refid)/ancestor::figure or id(@refid)/ancestor::graphic)]" priority="4">
      <span>
         <!--Emit class values to reflect conditions-->
         <xsl:attribute name="class">
            <xsl:text> x-refint-2-0</xsl:text>
         </xsl:attribute>
         <xsl:if test="@xml:lang">
            <xsl:attribute name="lang">
               <xsl:call-template name="return-lang-applying-language-map">
                  <xsl:with-param name="doclang" select="@xml:lang"/>
               </xsl:call-template>
            </xsl:attribute>
         </xsl:if>
         <xsl:copy-of select="@ch:*"/>
         <xsl:copy-of xmlns:dmp="http://www.arbortext.com/namespace/dmp/dmpmap" select="@dmp:*"/>
         <xsl:if test="@xml:lang">
            <xsl:attribute name="lang">
               <xsl:call-template name="return-lang-applying-language-map">
                  <xsl:with-param name="doclang" select="@xml:lang"/>
               </xsl:call-template>
            </xsl:attribute>
         </xsl:if>
         <xsl:call-template name="maybe-set-id"/>
         <!--Process this element's content-->
         <xsl:apply-templates/>
      </span>
   </xsl:template>

<xsl:template name="__style-for_refint.6rentnt303">
      <xsl:text> .x-refint-3-0 {margin-left: 0pt; margin-right: 0pt; }</xsl:text>
   </xsl:template>

<xsl:template match="refint[id(@refid)/self::table]" priority="3">
      <span>
         <!--Emit class values to reflect conditions-->
         <xsl:attribute name="class">
            <xsl:text> x-refint-3-0</xsl:text>
         </xsl:attribute>
         <xsl:if test="@xml:lang">
            <xsl:attribute name="lang">
               <xsl:call-template name="return-lang-applying-language-map">
                  <xsl:with-param name="doclang" select="@xml:lang"/>
               </xsl:call-template>
            </xsl:attribute>
         </xsl:if>
         <xsl:copy-of select="@ch:*"/>
         <xsl:copy-of xmlns:dmp="http://www.arbortext.com/namespace/dmp/dmpmap" select="@dmp:*"/>
         <xsl:if test="@xml:lang">
            <xsl:attribute name="lang">
               <xsl:call-template name="return-lang-applying-language-map">
                  <xsl:with-param name="doclang" select="@xml:lang"/>
               </xsl:call-template>
            </xsl:attribute>
         </xsl:if>
         <xsl:call-template name="maybe-set-id"/>
         <!--Process this element's content-->
         <xsl:apply-templates/>
      </span>
   </xsl:template>

<xsl:template name="__style-for_refint.6rentnt494">
      <xsl:text> .x-refint-4-0 {margin-left: 0pt; margin-right: 0pt; }</xsl:text>
   </xsl:template>

<xsl:template match="refint[ancestor::book[contains(@doctype, 'epc')]]" priority="2">
      <xsl:param name="hidden" select="'yes'"/>
      <span>
         <!--Emit class values to reflect conditions-->
         <xsl:attribute name="class">
            <xsl:text> x-refint-4-0</xsl:text>
         </xsl:attribute>
         <xsl:if test="@xml:lang">
            <xsl:attribute name="lang">
               <xsl:call-template name="return-lang-applying-language-map">
                  <xsl:with-param name="doclang" select="@xml:lang"/>
               </xsl:call-template>
            </xsl:attribute>
         </xsl:if>
         <xsl:copy-of select="@ch:*"/>
         <xsl:copy-of xmlns:dmp="http://www.arbortext.com/namespace/dmp/dmpmap" select="@dmp:*"/>
         <xsl:if test="@xml:lang">
            <xsl:attribute name="lang">
               <xsl:call-template name="return-lang-applying-language-map">
                  <xsl:with-param name="doclang" select="@xml:lang"/>
               </xsl:call-template>
            </xsl:attribute>
         </xsl:if>
         <xsl:call-template name="maybe-set-id"/>
         <!--Suppress element contents (but not gentext) unless unhidden-->
         <xsl:choose>
            <xsl:when test="$hidden='no'">
               <xsl:apply-templates/>
            </xsl:when>
            <xsl:otherwise>
               <xsl:apply-templates select="_sfe:BeforeOrAfterText"/>
            </xsl:otherwise>
         </xsl:choose>
      </span>
   </xsl:template>

<xsl:template name="__style-for_refint.6rentnt775">
      <xsl:text> .x-refint-5-0 {margin-left: 0pt; margin-right: 0pt; }</xsl:text>
   </xsl:template>

<xsl:template match="refint[ancestor::book[contains(@doctype, 'cir') or contains(@doctype, 'em')]]" priority="1">
      <xsl:param name="hidden" select="'yes'"/>
      <span>
         <!--Emit class values to reflect conditions-->
         <xsl:attribute name="class">
            <xsl:text> x-refint-5-0</xsl:text>
         </xsl:attribute>
         <xsl:if test="@xml:lang">
            <xsl:attribute name="lang">
               <xsl:call-template name="return-lang-applying-language-map">
                  <xsl:with-param name="doclang" select="@xml:lang"/>
               </xsl:call-template>
            </xsl:attribute>
         </xsl:if>
         <xsl:copy-of select="@ch:*"/>
         <xsl:copy-of xmlns:dmp="http://www.arbortext.com/namespace/dmp/dmpmap" select="@dmp:*"/>
         <xsl:if test="@xml:lang">
            <xsl:attribute name="lang">
               <xsl:call-template name="return-lang-applying-language-map">
                  <xsl:with-param name="doclang" select="@xml:lang"/>
               </xsl:call-template>
            </xsl:attribute>
         </xsl:if>
         <xsl:call-template name="maybe-set-id"/>
         <!--Suppress element contents (but not gentext) unless unhidden-->
         <xsl:choose>
            <xsl:when test="$hidden='no'">
               <xsl:apply-templates/>
            </xsl:when>
            <xsl:otherwise>
               <xsl:apply-templates select="_sfe:BeforeOrAfterText"/>
            </xsl:otherwise>
         </xsl:choose>
      </span>
   </xsl:template>

<xsl:template name="__style-for_refint.6rentnt66">
      <xsl:text> .x-refint-6-0 {margin-left: 0pt; margin-right: 0pt; } .x-refint-6-1 {}</xsl:text>
   </xsl:template>

<xsl:template match="refint" priority="0">
      <xsl:param name="hidden" select="'yes'"/>
      <xsl:variable name="foClass">hidden-inline</xsl:variable>
      <xsl:variable name="blockness">inline</xsl:variable>
      <xsl:variable name="hiddenness">yes</xsl:variable>
      <span>
         <!--Emit class values to reflect conditions-->
         <xsl:attribute name="class">
            <xsl:text> x-refint-6-0</xsl:text>
            <xsl:if test="@refid"> x-refint-6-1</xsl:if>
         </xsl:attribute>
         <xsl:if test="@xml:lang">
            <xsl:attribute name="lang">
               <xsl:call-template name="return-lang-applying-language-map">
                  <xsl:with-param name="doclang" select="@xml:lang"/>
               </xsl:call-template>
            </xsl:attribute>
         </xsl:if>
         <xsl:copy-of select="@ch:*"/>
         <xsl:copy-of xmlns:dmp="http://www.arbortext.com/namespace/dmp/dmpmap" select="@dmp:*"/>
         <xsl:variable name="Breaks-chunkFilenameXPath"/>
         <xsl:variable name="Breaks-persistentFilename"/>
         <xsl:if test="($Breaks-persistentFilename='yes') and ($Breaks-chunkFilenameXPath!='')">
            <xsl:variable name="chunkFilename"/>
            <xsl:if test="$chunkFilename!=''">
               <xsl:attribute name="ch:filename">
                  <xsl:value-of select="$chunkFilename"/>
               </xsl:attribute>
               <xsl:attribute name="ch:namepriority">0</xsl:attribute>
            </xsl:if>
         </xsl:if>
         <xsl:if test="@xml:lang">
            <xsl:attribute name="lang">
               <xsl:call-template name="return-lang-applying-language-map">
                  <xsl:with-param name="doclang" select="@xml:lang"/>
               </xsl:call-template>
            </xsl:attribute>
         </xsl:if>
         <xsl:call-template name="maybe-set-id"/>
         <!--Suppress element contents (but not gentext) unless unhidden-->
         <xsl:choose>
            <xsl:when test="$hidden='no'">
               <xsl:apply-templates/>
            </xsl:when>
            <xsl:otherwise>
               <xsl:apply-templates select="_sfe:BeforeOrAfterText"/>
            </xsl:otherwise>
         </xsl:choose>
      </span>
   </xsl:template>

<xsl:template name="__style-for__ufe-refint-link.1">
      <xsl:text> .x--ufe-refint-link-1-0 {margin-left: 0pt; margin-right: 0pt; }</xsl:text>
   </xsl:template>

<xsl:template match="_ufe:refint-link" priority="0">
      <span>
         <!--Emit class values to reflect conditions-->
         <xsl:attribute name="class">
            <xsl:text> x--ufe-refint-link-1-0</xsl:text>
         </xsl:attribute>
         <xsl:if test="@xml:lang">
            <xsl:attribute name="lang">
               <xsl:call-template name="return-lang-applying-language-map">
                  <xsl:with-param name="doclang" select="@xml:lang"/>
               </xsl:call-template>
            </xsl:attribute>
         </xsl:if>
         <xsl:copy-of select="@ch:*"/>
         <xsl:copy-of xmlns:dmp="http://www.arbortext.com/namespace/dmp/dmpmap" select="@dmp:*"/>
         <xsl:if test="@xml:lang">
            <xsl:attribute name="lang">
               <xsl:call-template name="return-lang-applying-language-map">
                  <xsl:with-param name="doclang" select="@xml:lang"/>
               </xsl:call-template>
            </xsl:attribute>
         </xsl:if>
         <xsl:call-template name="maybe-set-id"/>
         <!--Process this element's content-->
         <xsl:apply-templates/>
      </span>
   </xsl:template>

<xsl:template name="__style-for_rev-date.2tie-te201">
      <xsl:text> .x-rev-date-1-0 {margin-left: 0pt; margin-right: 0pt; text-indent: 0pt; font-size: 18pt; text-align: center; }</xsl:text>
   </xsl:template>

<xsl:template match="title-page//rev-date" priority="1">
      <xsl:param name="hidden" select="'yes'"/>
      <xsl:if test="$hidden='no'">
         <div>
            <!--Emit class values to reflect conditions-->
            <xsl:attribute name="class">
               <xsl:text> x-rev-date-1-0</xsl:text>
            </xsl:attribute>
            <xsl:if test="@xml:lang">
               <xsl:attribute name="lang">
                  <xsl:call-template name="return-lang-applying-language-map">
                     <xsl:with-param name="doclang" select="@xml:lang"/>
                  </xsl:call-template>
               </xsl:attribute>
            </xsl:if>
            <xsl:copy-of select="@ch:*"/>
            <xsl:copy-of xmlns:dmp="http://www.arbortext.com/namespace/dmp/dmpmap" select="@dmp:*"/>
            <xsl:if test="@xml:lang">
               <xsl:attribute name="lang">
                  <xsl:call-template name="return-lang-applying-language-map">
                     <xsl:with-param name="doclang" select="@xml:lang"/>
                  </xsl:call-template>
               </xsl:attribute>
            </xsl:if>
            <xsl:call-template name="maybe-set-id"/>
            <!--Suppress element contents (but not gentext) unless unhidden-->
            <xsl:choose>
               <xsl:when test="$hidden='no'">
                  <xsl:apply-templates/>
               </xsl:when>
               <xsl:otherwise>
                  <xsl:apply-templates select="_sfe:BeforeOrAfterText"/>
               </xsl:otherwise>
            </xsl:choose>
         </div>
      </xsl:if>
   </xsl:template>

<xsl:template name="__style-for_rev-date.2redate82">
      <xsl:text> .x-rev-date-2-0 {margin-left: 0pt; margin-right: 0pt; text-indent: 0pt; }</xsl:text>
   </xsl:template>

<xsl:template match="rev-date" priority="0">
      <div>
         <!--Emit class values to reflect conditions-->
         <xsl:attribute name="class">
            <xsl:text> x-rev-date-2-0</xsl:text>
         </xsl:attribute>
         <xsl:if test="@xml:lang">
            <xsl:attribute name="lang">
               <xsl:call-template name="return-lang-applying-language-map">
                  <xsl:with-param name="doclang" select="@xml:lang"/>
               </xsl:call-template>
            </xsl:attribute>
         </xsl:if>
         <xsl:copy-of select="@ch:*"/>
         <xsl:copy-of xmlns:dmp="http://www.arbortext.com/namespace/dmp/dmpmap" select="@dmp:*"/>
         <xsl:if test="@xml:lang">
            <xsl:attribute name="lang">
               <xsl:call-template name="return-lang-applying-language-map">
                  <xsl:with-param name="doclang" select="@xml:lang"/>
               </xsl:call-template>
            </xsl:attribute>
         </xsl:if>
         <xsl:call-template name="maybe-set-id"/>
         <!--Process this element's content-->
         <xsl:apply-templates/>
      </div>
   </xsl:template>

<xsl:template name="__style-for__ufe-revdate-block.1">
      <xsl:text> .x--ufe-revdate-block-1-0 {margin-left: 0pt; margin-right: 0pt; text-indent: 0pt; margin-bottom: 24pt; }</xsl:text>
   </xsl:template>

<xsl:template match="_ufe:revdate-block" priority="0">
      <div>
         <!--Emit class values to reflect conditions-->
         <xsl:attribute name="class">
            <xsl:text> x--ufe-revdate-block-1-0</xsl:text>
         </xsl:attribute>
         <xsl:if test="@xml:lang">
            <xsl:attribute name="lang">
               <xsl:call-template name="return-lang-applying-language-map">
                  <xsl:with-param name="doclang" select="@xml:lang"/>
               </xsl:call-template>
            </xsl:attribute>
         </xsl:if>
         <xsl:copy-of select="@ch:*"/>
         <xsl:copy-of xmlns:dmp="http://www.arbortext.com/namespace/dmp/dmpmap" select="@dmp:*"/>
         <xsl:if test="@xml:lang">
            <xsl:attribute name="lang">
               <xsl:call-template name="return-lang-applying-language-map">
                  <xsl:with-param name="doclang" select="@xml:lang"/>
               </xsl:call-template>
            </xsl:attribute>
         </xsl:if>
         <xsl:call-template name="maybe-set-id"/>
         <!--Process this element's content-->
         <xsl:apply-templates/>
      </div>
   </xsl:template>

<xsl:template name="__style-for_revend.1">
      <xsl:text> .x-revend-1-0 {margin-left:
0pt; margin-right: 0pt; text-indent: 0pt; }</xsl:text>
   </xsl:template>

<xsl:template match="revend" priority="0">
      <div>
         <!--Emit class values to reflect conditions-->
         <xsl:attribute name="class">
            <xsl:text> x-revend-1-0</xsl:text>
         </xsl:attribute>
         <xsl:attribute name="name">
            <xsl:value-of select="@ref"/>
         </xsl:attribute>
         <xsl:if test="@xml:lang">
            <xsl:attribute name="lang">
               <xsl:call-template name="return-lang-applying-language-map">
                  <xsl:with-param name="doclang" select="@xml:lang"/>
               </xsl:call-template>
            </xsl:attribute>
         </xsl:if>
         <xsl:copy-of select="@ch:*"/>
         <xsl:copy-of xmlns:dmp="http://www.arbortext.com/namespace/dmp/dmpmap" select="@dmp:*"/>
         <xsl:if test="@xml:lang">
            <xsl:attribute name="lang">
               <xsl:call-template name="return-lang-applying-language-map">
                  <xsl:with-param name="doclang" select="@xml:lang"/>
               </xsl:call-template>
            </xsl:attribute>
         </xsl:if>
         <xsl:call-template name="maybe-set-id"/>
         <!--Process this element's content-->
         <xsl:apply-templates> </xsl:apply-templates>
      </div>
   </xsl:template>

<xsl:template name="__style-for_revst.1">
      <xsl:text> .x-revst-1-0 {margin-left:
0pt; margin-right: 0pt; text-indent: 0pt; }</xsl:text>
   </xsl:template>

<xsl:template match="revst" priority="0">
      <div>
         <!--Emit class values to reflect conditions-->
         <xsl:attribute name="class">
            <xsl:text> x-revst-1-0</xsl:text>
         </xsl:attribute>
         <xsl:attribute name="name">
            <xsl:value-of select="@ref"/>
         </xsl:attribute>
         <xsl:if test="@xml:lang">
            <xsl:attribute name="lang">
               <xsl:call-template name="return-lang-applying-language-map">
                  <xsl:with-param name="doclang" select="@xml:lang"/>
               </xsl:call-template>
            </xsl:attribute>
         </xsl:if>
         <xsl:copy-of select="@ch:*"/>
         <xsl:copy-of xmlns:dmp="http://www.arbortext.com/namespace/dmp/dmpmap" select="@dmp:*"/>
         <xsl:if test="@xml:lang">
            <xsl:attribute name="lang">
               <xsl:call-template name="return-lang-applying-language-map">
                  <xsl:with-param name="doclang" select="@xml:lang"/>
               </xsl:call-template>
            </xsl:attribute>
         </xsl:if>
         <xsl:call-template name="maybe-set-id"/>
         <!--Process this element's content-->
         <xsl:apply-templates> </xsl:apply-templates>
      </div>
   </xsl:template>

<xsl:template name="__style-for_sb.1">
      <xsl:text> .x-sb-1-0 {margin-left:
0pt; margin-right: 0pt; color: #0000FF; text-decoration: underline
; text-decoration: underline ; }</xsl:text>
   </xsl:template>

<xsl:template match="sb" priority="0">
      <span xmlns:dmp="http://www.arbortext.com/namespace/dmp/dmpmap">
         <!--Emit class values to reflect conditions-->
         <xsl:attribute name="class">
            <xsl:text> x-sb-1-0</xsl:text>
         </xsl:attribute>
         <xsl:copy-of select="@ch:*"/>
         <xsl:copy-of select="@dmp:*"/>
         <xsl:call-template name="maybe-set-id"> </xsl:call-template>
         <!--Process this element's content-->
         <a href="#">
            <xsl:attribute name="onClick">
               <xsl:text>sbLink('</xsl:text>
               <xsl:value-of select="."/>
               <xsl:text>');</xsl:text>
            </xsl:attribute>
            <xsl:apply-templates/>
         </a>
      </span>
   </xsl:template>

<xsl:template name="__style-for_sb-item.1">
      <xsl:text> .x-sb-item-1-0 {margin-left: 0pt; margin-right: 0pt; }</xsl:text>
   </xsl:template>

<xsl:template match="sb-item" priority="0">
      <!--Emit a nostyle template-->
      <xsl:apply-templates/>
   </xsl:template>

<xsl:template name="__style-for_sblist.1">
      <xsl:text> .x-sblist-1-0 {margin-left: 0pt; margin-right: 0pt; text-indent: 0pt; margin-top: 8pt; }</xsl:text>
   </xsl:template>

<xsl:template match="sblist" priority="0">
      <div>
         <!--Emit class values to reflect conditions-->
         <xsl:attribute name="class">
            <xsl:text> x-sblist-1-0</xsl:text>
         </xsl:attribute>
         <xsl:if test="@xml:lang">
            <xsl:attribute name="lang">
               <xsl:call-template name="return-lang-applying-language-map">
                  <xsl:with-param name="doclang" select="@xml:lang"/>
               </xsl:call-template>
            </xsl:attribute>
         </xsl:if>
         <xsl:copy-of select="@ch:*"/>
         <xsl:copy-of xmlns:dmp="http://www.arbortext.com/namespace/dmp/dmpmap" select="@dmp:*"/>
         <xsl:if test="@xml:lang">
            <xsl:attribute name="lang">
               <xsl:call-template name="return-lang-applying-language-map">
                  <xsl:with-param name="doclang" select="@xml:lang"/>
               </xsl:call-template>
            </xsl:attribute>
         </xsl:if>
         <xsl:call-template name="maybe-set-id">
            <xsl:with-param name="only-if-id-attr" select="'no'"/>
            <xsl:with-param name="generated-id-prefix" select="'styler-id'"/>
         </xsl:call-template>
         <!--Process this element's content-->
         <xsl:apply-templates/>
      </div>
   </xsl:template>

<xsl:template match="pgblk/_ufe:sblist-title" priority="2">
  <div ch:title="notoc" class=" x--ufe-sblist-title-1-0">
    <xsl:call-template name="t-base-div-title"/>
  </div>
</xsl:template>

<xsl:template match="pbfmatr/_ufe:sblist-title" priority="1">
  <div ch:title="notoc" class=" x--ufe-sblist-title-2-0">
    <xsl:call-template name="t-base-div-title"/>
  </div>
</xsl:template>

<xsl:template match="section" priority="0">
  <div class=" x-section-1-0">
    <xsl:call-template name="t-base-div-chunk"/>
    <xsl:apply-templates/>
  </div>
</xsl:template>

<xsl:template match="sin" priority="0">
      <xsl:param name="hidden" select="'yes'"/>
      <xsl:if test="$hidden='no'">
         <span>
            <!--Emit class values to reflect conditions-->
            <xsl:attribute name="class">
               <xsl:text> x-sin-1-0</xsl:text>
            </xsl:attribute>
            <xsl:if test="@xml:lang">
               <xsl:attribute name="lang">
                  <xsl:call-template name="return-lang-applying-language-map">
                     <xsl:with-param name="doclang" select="@xml:lang"/>
                  </xsl:call-template>
               </xsl:attribute>
            </xsl:if>
            <xsl:copy-of select="@ch:*"/>
            <xsl:copy-of xmlns:dmp="http://www.arbortext.com/namespace/dmp/dmpmap" select="@dmp:*"/>
            <xsl:if test="@xml:lang">
               <xsl:attribute name="lang">
                  <xsl:call-template name="return-lang-applying-language-map">
                     <xsl:with-param name="doclang" select="@xml:lang"/>
                  </xsl:call-template>
               </xsl:attribute>
            </xsl:if>
            <xsl:call-template name="maybe-set-id"/>
            <!--Suppress element contents (but not gentext) unless unhidden-->
            <xsl:choose>
               <xsl:when test="$hidden='no'">
                  <xsl:apply-templates/>
               </xsl:when>
               <xsl:otherwise>
                  <xsl:apply-templates select="_sfe:BeforeOrAfterText"/>
               </xsl:otherwise>
            </xsl:choose>
         </span>
      </xsl:if>
   </xsl:template>

<xsl:template name="__style-for_source-item.1">
      <xsl:text> .x-source-item-1-0 {margin-left: 0pt; margin-right: 0pt; }</xsl:text>
   </xsl:template>

<xsl:template match="source-item" priority="0">
      <!--Emit a nostyle template-->
      <xsl:apply-templates/>
   </xsl:template>

<xsl:template match="pgblk/_ufe:spblist-title" priority="2">
  <div ch:title="notoc" class=" x--ufe-spblist-title-1-0">
    <xsl:call-template name="t-base-div-title"/>
  </div>
</xsl:template>

<xsl:template match="pbfmatr/_ufe:spblist-title" priority="1">
  <div ch:title="notoc" class=" x--ufe-spblist-title-2-0">
    <xsl:call-template name="t-base-div-title"/>
  </div>
</xsl:template>

<xsl:template match="spec-tool-head" priority="0">
  <xsl:apply-templates/>
</xsl:template>

<xsl:template match="spec-tool-row" priority="0">
  <xsl:apply-templates/>
</xsl:template>

<xsl:template name="__style-for_spec-tool-table.1">
      <xsl:text> .x-spec-tool-table-1-0 {margin-left: 0pt; margin-right: 0pt; text-indent: 0pt; margin-top: 8pt; }</xsl:text>
   </xsl:template>

<xsl:template match="spec-tool-table" priority="0">
      <div>
         <!--Emit class values to reflect conditions-->
         <xsl:attribute name="class">
            <xsl:text> x-spec-tool-table-1-0</xsl:text>
         </xsl:attribute>
         <xsl:if test="@xml:lang">
            <xsl:attribute name="lang">
               <xsl:call-template name="return-lang-applying-language-map">
                  <xsl:with-param name="doclang" select="@xml:lang"/>
               </xsl:call-template>
            </xsl:attribute>
         </xsl:if>
         <xsl:copy-of select="@ch:*"/>
         <xsl:copy-of xmlns:dmp="http://www.arbortext.com/namespace/dmp/dmpmap" select="@dmp:*"/>
         <xsl:if test="@xml:lang">
            <xsl:attribute name="lang">
               <xsl:call-template name="return-lang-applying-language-map">
                  <xsl:with-param name="doclang" select="@xml:lang"/>
               </xsl:call-template>
            </xsl:attribute>
         </xsl:if>
         <xsl:call-template name="maybe-set-id">
            <xsl:with-param name="only-if-id-attr" select="'no'"/>
            <xsl:with-param name="generated-id-prefix" select="'styler-id'"/>
         </xsl:call-template>
         <!--Process this element's content-->
         <xsl:apply-templates/>
      </div>
   </xsl:template>

<xsl:template match="pgblk/_ufe:spectools-title" priority="5">
  <div ch:title="notoc" class=" x--ufe-spectools-title-1-0">
    <xsl:call-template name="t-base-div-title"/>
  </div>
</xsl:template>

<xsl:template match="pbfmatr/_ufe:spectools-title" priority="4">
  <div ch:title="notoc" class=" x--ufe-spectools-title-2-0">
    <xsl:call-template name="t-base-div-title"/>
  </div>
</xsl:template>

<xsl:template match="pwcspblist/_ufe:spectools-title" priority="3">
  <div ch:title="notoc" class=" x--ufe-spectools-title-3-0">
    <xsl:call-template name="t-base-div-title"/>
  </div>
</xsl:template>

<xsl:template match="page-block//special-tools//_ufe:spectools-title" priority="2">
  <div ch:title="toc" class=" x--ufe-spectools-title-4-0">
    <xsl:call-template name="t-base-div-title"/>
  </div>
</xsl:template>

<xsl:template match="ata-page-block//special-tools//_ufe:spectools-title" priority="1">
  <div ch:title="toc" class=" x--ufe-spectools-title-5-0">
    <xsl:call-template name="t-base-div-title"/>
  </div>
</xsl:template>

<xsl:template match="_ufe:spectools-title" priority="0">
  <div ch:title="notoc" class=" x--ufe-spectools-title-6-0">
    <xsl:call-template name="t-base-div-title"/>
  </div>
</xsl:template>

<xsl:template name="__style-for_sqrt.1">
      <xsl:text> .x-sqrt-1-0 {margin-left: 0pt; margin-right: 0pt; }</xsl:text>
   </xsl:template>

<xsl:template match="sqrt" priority="0">
      <span>
         <!--Emit class values to reflect conditions-->
         <xsl:attribute name="class">
            <xsl:text> x-sqrt-1-0</xsl:text>
         </xsl:attribute>
         <xsl:if test="@xml:lang">
            <xsl:attribute name="lang">
               <xsl:call-template name="return-lang-applying-language-map">
                  <xsl:with-param name="doclang" select="@xml:lang"/>
               </xsl:call-template>
            </xsl:attribute>
         </xsl:if>
         <xsl:copy-of select="@ch:*"/>
         <xsl:copy-of xmlns:dmp="http://www.arbortext.com/namespace/dmp/dmpmap" select="@dmp:*"/>
         <xsl:if test="@xml:lang">
            <xsl:attribute name="lang">
               <xsl:call-template name="return-lang-applying-language-map">
                  <xsl:with-param name="doclang" select="@xml:lang"/>
               </xsl:call-template>
            </xsl:attribute>
         </xsl:if>
         <xsl:call-template name="maybe-set-id"/>
         <!--Process this element's content-->
         <xsl:apply-templates/>
      </span>
   </xsl:template>

<xsl:template name="__style-for_state.1">
      <xsl:text> .x-state-1-0 {margin-left: 0pt; margin-right: 0pt; } .x-state-1-1 {}</xsl:text>
   </xsl:template>

<xsl:template match="state" priority="0">
      <xsl:variable name="foClass">inline</xsl:variable>
      <xsl:variable name="blockness">inline</xsl:variable>
      <span>
         <!--Emit class values to reflect conditions-->
         <xsl:attribute name="class">
            <xsl:text> x-state-1-0</xsl:text>
            <xsl:if test="not(./*[not(self::_sfe:BeforeOrAfterText)]|./text()[normalize-space(.)!=''])"> x-state-1-1</xsl:if>
         </xsl:attribute>
         <xsl:if test="@xml:lang">
            <xsl:attribute name="lang">
               <xsl:call-template name="return-lang-applying-language-map">
                  <xsl:with-param name="doclang" select="@xml:lang"/>
               </xsl:call-template>
            </xsl:attribute>
         </xsl:if>
         <xsl:copy-of select="@ch:*"/>
         <xsl:copy-of xmlns:dmp="http://www.arbortext.com/namespace/dmp/dmpmap" select="@dmp:*"/>
         <xsl:variable name="Breaks-chunkFilenameXPath"/>
         <xsl:variable name="Breaks-persistentFilename"/>
         <xsl:if test="($Breaks-persistentFilename='yes') and ($Breaks-chunkFilenameXPath!='')">
            <xsl:variable name="chunkFilename"/>
            <xsl:if test="$chunkFilename!=''">
               <xsl:attribute name="ch:filename">
                  <xsl:value-of select="$chunkFilename"/>
               </xsl:attribute>
               <xsl:attribute name="ch:namepriority">0</xsl:attribute>
            </xsl:if>
         </xsl:if>
         <xsl:if test="@xml:lang">
            <xsl:attribute name="lang">
               <xsl:call-template name="return-lang-applying-language-map">
                  <xsl:with-param name="doclang" select="@xml:lang"/>
               </xsl:call-template>
            </xsl:attribute>
         </xsl:if>
         <xsl:call-template name="maybe-set-id"/>
         <!--Process this element's content-->
         <xsl:apply-templates/>
      </span>
   </xsl:template>

<xsl:template name="__style-for_sub.1">
      <xsl:text> .x-sub-1-0 {margin-left: 0pt; margin-right: 0pt; font-size: .69em; bottom: -.15em; position: relative; }</xsl:text>
   </xsl:template>

<xsl:template match="sub" priority="0">
      <span>
         <!--Emit class values to reflect conditions-->
         <xsl:attribute name="class">
            <xsl:text> x-sub-1-0</xsl:text>
         </xsl:attribute>
         <xsl:if test="@xml:lang">
            <xsl:attribute name="lang">
               <xsl:call-template name="return-lang-applying-language-map">
                  <xsl:with-param name="doclang" select="@xml:lang"/>
               </xsl:call-template>
            </xsl:attribute>
         </xsl:if>
         <xsl:copy-of select="@ch:*"/>
         <xsl:copy-of xmlns:dmp="http://www.arbortext.com/namespace/dmp/dmpmap" select="@dmp:*"/>
         <xsl:if test="@xml:lang">
            <xsl:attribute name="lang">
               <xsl:call-template name="return-lang-applying-language-map">
                  <xsl:with-param name="doclang" select="@xml:lang"/>
               </xsl:call-template>
            </xsl:attribute>
         </xsl:if>
         <xsl:call-template name="maybe-set-id"/>
         <!--Process this element's content-->
         <xsl:apply-templates/>
      </span>
   </xsl:template>

<xsl:template match="subject" priority="0">
  <div class=" x-subject-1-0">
    <xsl:call-template name="t-base-div-chunk"/>
    <xsl:apply-templates/>
  </div>
</xsl:template>

<xsl:template match="subpara/subpara/subpara/subpara/subpara[title and ancestor::subpara[not(title)]]" priority="15">
      <div>
         <!--Emit class values to reflect conditions-->
         <xsl:attribute name="class">
            <xsl:text> x-subpara-1-0</xsl:text>
         </xsl:attribute>
         <xsl:if test="@xml:lang">
            <xsl:attribute name="lang">
               <xsl:call-template name="return-lang-applying-language-map">
                  <xsl:with-param name="doclang" select="@xml:lang"/>
               </xsl:call-template>
            </xsl:attribute>
         </xsl:if>
         <xsl:copy-of select="@ch:*"/>
         <xsl:copy-of xmlns:dmp="http://www.arbortext.com/namespace/dmp/dmpmap" select="@dmp:*"/>
         <xsl:if test="@xml:lang">
            <xsl:attribute name="lang">
               <xsl:call-template name="return-lang-applying-language-map">
                  <xsl:with-param name="doclang" select="@xml:lang"/>
               </xsl:call-template>
            </xsl:attribute>
         </xsl:if>
         <xsl:call-template name="maybe-set-id">
            <xsl:with-param name="only-if-id-attr" select="'no'"/>
            <xsl:with-param name="generated-id-prefix" select="'styler-id'"/>
         </xsl:call-template>
         <!--Process this element's content-->
         <xsl:apply-templates/>
      </div>
   </xsl:template>

<xsl:template name="__style-for_subpara.16suarra802">
      <xsl:text> .x-subpara-2-0 {margin-left: 0pt; margin-right: 0pt; text-indent: 0pt; margin-top: 8pt; margin-left: 35pt; text-indent: 0pt; }</xsl:text>
   </xsl:template>

<xsl:template match="subpara/subpara/subpara/subpara/subpara[not(title) and ancestor::subpara[title]]" priority="14">
      <div>
         <!--Emit class values to reflect conditions-->
         <xsl:attribute name="class">
            <xsl:text> x-subpara-2-0</xsl:text>
         </xsl:attribute>
         <xsl:if test="@xml:lang">
            <xsl:attribute name="lang">
               <xsl:call-template name="return-lang-applying-language-map">
                  <xsl:with-param name="doclang" select="@xml:lang"/>
               </xsl:call-template>
            </xsl:attribute>
         </xsl:if>
         <xsl:copy-of select="@ch:*"/>
         <xsl:copy-of xmlns:dmp="http://www.arbortext.com/namespace/dmp/dmpmap" select="@dmp:*"/>
         <xsl:if test="@xml:lang">
            <xsl:attribute name="lang">
               <xsl:call-template name="return-lang-applying-language-map">
                  <xsl:with-param name="doclang" select="@xml:lang"/>
               </xsl:call-template>
            </xsl:attribute>
         </xsl:if>
         <xsl:call-template name="maybe-set-id">
            <xsl:with-param name="only-if-id-attr" select="'no'"/>
            <xsl:with-param name="generated-id-prefix" select="'styler-id'"/>
         </xsl:call-template>
         <!--Process this element's content-->
         <xsl:apply-templates/>
      </div>
   </xsl:template>

<xsl:template name="__style-for_subpara.16suarra513">
      <xsl:text> .x-subpara-3-0 {margin-left: 0pt; margin-right: 0pt; text-indent: 0pt; margin-top: 8pt; margin-left: 48pt; text-indent: 0pt; }</xsl:text>
   </xsl:template>

<xsl:template match="subpara/subpara/subpara/subpara/subpara[not(title)]" priority="13">
      <div>
         <!--Emit class values to reflect conditions-->
         <xsl:attribute name="class">
            <xsl:text> x-subpara-3-0</xsl:text>
         </xsl:attribute>
         <xsl:if test="@xml:lang">
            <xsl:attribute name="lang">
               <xsl:call-template name="return-lang-applying-language-map">
                  <xsl:with-param name="doclang" select="@xml:lang"/>
               </xsl:call-template>
            </xsl:attribute>
         </xsl:if>
         <xsl:copy-of select="@ch:*"/>
         <xsl:copy-of xmlns:dmp="http://www.arbortext.com/namespace/dmp/dmpmap" select="@dmp:*"/>
         <xsl:if test="@xml:lang">
            <xsl:attribute name="lang">
               <xsl:call-template name="return-lang-applying-language-map">
                  <xsl:with-param name="doclang" select="@xml:lang"/>
               </xsl:call-template>
            </xsl:attribute>
         </xsl:if>
         <xsl:call-template name="maybe-set-id">
            <xsl:with-param name="only-if-id-attr" select="'no'"/>
            <xsl:with-param name="generated-id-prefix" select="'styler-id'"/>
         </xsl:call-template>
         <!--Process this element's content-->
         <xsl:apply-templates/>
      </div>
   </xsl:template>

<xsl:template name="__style-for_subpara.16suarra724">
      <xsl:text> .x-subpara-4-0 {margin-left: 0pt; margin-right: 0pt; text-indent: 0pt; margin-top: 8pt; margin-left: 18pt; text-indent: 0pt; }</xsl:text>
   </xsl:template>

<xsl:template match="subpara/subpara/subpara/subpara[title and ancestor::subpara[not(title)]]" priority="12">
      <div>
         <!--Emit class values to reflect conditions-->
         <xsl:attribute name="class">
            <xsl:text> x-subpara-4-0</xsl:text>
         </xsl:attribute>
         <xsl:if test="@xml:lang">
            <xsl:attribute name="lang">
               <xsl:call-template name="return-lang-applying-language-map">
                  <xsl:with-param name="doclang" select="@xml:lang"/>
               </xsl:call-template>
            </xsl:attribute>
         </xsl:if>
         <xsl:copy-of select="@ch:*"/>
         <xsl:copy-of xmlns:dmp="http://www.arbortext.com/namespace/dmp/dmpmap" select="@dmp:*"/>
         <xsl:if test="@xml:lang">
            <xsl:attribute name="lang">
               <xsl:call-template name="return-lang-applying-language-map">
                  <xsl:with-param name="doclang" select="@xml:lang"/>
               </xsl:call-template>
            </xsl:attribute>
         </xsl:if>
         <xsl:call-template name="maybe-set-id">
            <xsl:with-param name="only-if-id-attr" select="'no'"/>
            <xsl:with-param name="generated-id-prefix" select="'styler-id'"/>
         </xsl:call-template>
         <!--Process this element's content-->
         <xsl:apply-templates/>
      </div>
   </xsl:template>

<xsl:template name="__style-for_subpara.16suarra725">
      <xsl:text> .x-subpara-5-0 {margin-left: 0pt; margin-right: 0pt; text-indent: 0pt; margin-top: 8pt; margin-left: 18pt; text-indent: 0pt; }</xsl:text>
   </xsl:template>

<xsl:template match="subpara/subpara/subpara/subpara[not(title) and ancestor::subpara[title]]" priority="11">
      <div>
         <!--Emit class values to reflect conditions-->
         <xsl:attribute name="class">
            <xsl:text> x-subpara-5-0</xsl:text>
         </xsl:attribute>
         <xsl:if test="@xml:lang">
            <xsl:attribute name="lang">
               <xsl:call-template name="return-lang-applying-language-map">
                  <xsl:with-param name="doclang" select="@xml:lang"/>
               </xsl:call-template>
            </xsl:attribute>
         </xsl:if>
         <xsl:copy-of select="@ch:*"/>
         <xsl:copy-of xmlns:dmp="http://www.arbortext.com/namespace/dmp/dmpmap" select="@dmp:*"/>
         <xsl:if test="@xml:lang">
            <xsl:attribute name="lang">
               <xsl:call-template name="return-lang-applying-language-map">
                  <xsl:with-param name="doclang" select="@xml:lang"/>
               </xsl:call-template>
            </xsl:attribute>
         </xsl:if>
         <xsl:call-template name="maybe-set-id">
            <xsl:with-param name="only-if-id-attr" select="'no'"/>
            <xsl:with-param name="generated-id-prefix" select="'styler-id'"/>
         </xsl:call-template>
         <!--Process this element's content-->
         <xsl:apply-templates/>
      </div>
   </xsl:template>

<xsl:template name="__style-for_subpara.16suarra436">
      <xsl:text> .x-subpara-6-0 {margin-left: 0pt; margin-right: 0pt; text-indent: 0pt; margin-top: 8pt; margin-left: 36pt; text-indent: 0pt; }</xsl:text>
   </xsl:template>

<xsl:template match="subpara/subpara/subpara/subpara[not(title)]" priority="10">
      <div>
         <!--Emit class values to reflect conditions-->
         <xsl:attribute name="class">
            <xsl:text> x-subpara-6-0</xsl:text>
         </xsl:attribute>
         <xsl:if test="@xml:lang">
            <xsl:attribute name="lang">
               <xsl:call-template name="return-lang-applying-language-map">
                  <xsl:with-param name="doclang" select="@xml:lang"/>
               </xsl:call-template>
            </xsl:attribute>
         </xsl:if>
         <xsl:copy-of select="@ch:*"/>
         <xsl:copy-of xmlns:dmp="http://www.arbortext.com/namespace/dmp/dmpmap" select="@dmp:*"/>
         <xsl:if test="@xml:lang">
            <xsl:attribute name="lang">
               <xsl:call-template name="return-lang-applying-language-map">
                  <xsl:with-param name="doclang" select="@xml:lang"/>
               </xsl:call-template>
            </xsl:attribute>
         </xsl:if>
         <xsl:call-template name="maybe-set-id">
            <xsl:with-param name="only-if-id-attr" select="'no'"/>
            <xsl:with-param name="generated-id-prefix" select="'styler-id'"/>
         </xsl:call-template>
         <!--Process this element's content-->
         <xsl:apply-templates/>
      </div>
   </xsl:template>

<xsl:template name="__style-for_subpara.16suarra647">
      <xsl:text> .x-subpara-7-0 {margin-left: 0pt; margin-right: 0pt; text-indent: 0pt; margin-top: 8pt; margin-left: 36pt; text-indent: 0pt; }</xsl:text>
   </xsl:template>

<xsl:template match="subpara/subpara/subpara[title and ancestor::subpara[not(title)]]" priority="9">
      <div>
         <!--Emit class values to reflect conditions-->
         <xsl:attribute name="class">
            <xsl:text> x-subpara-7-0</xsl:text>
         </xsl:attribute>
         <xsl:if test="@xml:lang">
            <xsl:attribute name="lang">
               <xsl:call-template name="return-lang-applying-language-map">
                  <xsl:with-param name="doclang" select="@xml:lang"/>
               </xsl:call-template>
            </xsl:attribute>
         </xsl:if>
         <xsl:copy-of select="@ch:*"/>
         <xsl:copy-of xmlns:dmp="http://www.arbortext.com/namespace/dmp/dmpmap" select="@dmp:*"/>
         <xsl:if test="@xml:lang">
            <xsl:attribute name="lang">
               <xsl:call-template name="return-lang-applying-language-map">
                  <xsl:with-param name="doclang" select="@xml:lang"/>
               </xsl:call-template>
            </xsl:attribute>
         </xsl:if>
         <xsl:call-template name="maybe-set-id">
            <xsl:with-param name="only-if-id-attr" select="'no'"/>
            <xsl:with-param name="generated-id-prefix" select="'styler-id'"/>
         </xsl:call-template>
         <!--Process this element's content-->
         <xsl:apply-templates/>
      </div>
   </xsl:template>

<xsl:template name="__style-for_subpara.16suarra648">
      <xsl:text> .x-subpara-8-0 {margin-left: 0pt; margin-right: 0pt; text-indent: 0pt; margin-top: 8pt; margin-left: 36pt; text-indent: 0pt; }</xsl:text>
   </xsl:template>

<xsl:template match="subpara/subpara/subpara[not(title) and ancestor::subpara[title]]" priority="8">
      <div>
         <!--Emit class values to reflect conditions-->
         <xsl:attribute name="class">
            <xsl:text> x-subpara-8-0</xsl:text>
         </xsl:attribute>
         <xsl:if test="@xml:lang">
            <xsl:attribute name="lang">
               <xsl:call-template name="return-lang-applying-language-map">
                  <xsl:with-param name="doclang" select="@xml:lang"/>
               </xsl:call-template>
            </xsl:attribute>
         </xsl:if>
         <xsl:copy-of select="@ch:*"/>
         <xsl:copy-of xmlns:dmp="http://www.arbortext.com/namespace/dmp/dmpmap" select="@dmp:*"/>
         <xsl:if test="@xml:lang">
            <xsl:attribute name="lang">
               <xsl:call-template name="return-lang-applying-language-map">
                  <xsl:with-param name="doclang" select="@xml:lang"/>
               </xsl:call-template>
            </xsl:attribute>
         </xsl:if>
         <xsl:call-template name="maybe-set-id">
            <xsl:with-param name="only-if-id-attr" select="'no'"/>
            <xsl:with-param name="generated-id-prefix" select="'styler-id'"/>
         </xsl:call-template>
         <!--Process this element's content-->
         <xsl:apply-templates/>
      </div>
   </xsl:template>

<xsl:template name="__style-for_subpara.16suarra359">
      <xsl:text> .x-subpara-9-0 {margin-left: 0pt; margin-right: 0pt; text-indent: 0pt; margin-top: 8pt; margin-left: 18pt; text-indent: 0pt; }</xsl:text>
   </xsl:template>

<xsl:template match="subpara/subpara/subpara[not(title)]" priority="7">
      <div>
         <!--Emit class values to reflect conditions-->
         <xsl:attribute name="class">
            <xsl:text> x-subpara-9-0</xsl:text>
         </xsl:attribute>
         <xsl:if test="@xml:lang">
            <xsl:attribute name="lang">
               <xsl:call-template name="return-lang-applying-language-map">
                  <xsl:with-param name="doclang" select="@xml:lang"/>
               </xsl:call-template>
            </xsl:attribute>
         </xsl:if>
         <xsl:copy-of select="@ch:*"/>
         <xsl:copy-of xmlns:dmp="http://www.arbortext.com/namespace/dmp/dmpmap" select="@dmp:*"/>
         <xsl:if test="@xml:lang">
            <xsl:attribute name="lang">
               <xsl:call-template name="return-lang-applying-language-map">
                  <xsl:with-param name="doclang" select="@xml:lang"/>
               </xsl:call-template>
            </xsl:attribute>
         </xsl:if>
         <xsl:call-template name="maybe-set-id">
            <xsl:with-param name="only-if-id-attr" select="'no'"/>
            <xsl:with-param name="generated-id-prefix" select="'styler-id'"/>
         </xsl:call-template>
         <!--Process this element's content-->
         <xsl:apply-templates/>
      </div>
   </xsl:template>

<xsl:template name="__style-for_subpara.16pa-bra5810">
      <xsl:text> .x-subpara-10-0 {margin-left: 0pt; margin-right: 0pt; text-indent: 0pt; margin-top: 8pt; margin-left: 18pt; text-indent: 0pt; }</xsl:text>
   </xsl:template>

<xsl:template match="page-block[@pb-name='intro']//n-para/subpara[child::title]" priority="6">
      <div>
         <!--Emit class values to reflect conditions-->
         <xsl:attribute name="class">
            <xsl:text> x-subpara-10-0</xsl:text>
         </xsl:attribute>
         <xsl:if test="@xml:lang">
            <xsl:attribute name="lang">
               <xsl:call-template name="return-lang-applying-language-map">
                  <xsl:with-param name="doclang" select="@xml:lang"/>
               </xsl:call-template>
            </xsl:attribute>
         </xsl:if>
         <xsl:copy-of select="@ch:*"/>
         <xsl:copy-of xmlns:dmp="http://www.arbortext.com/namespace/dmp/dmpmap" select="@dmp:*"/>
         <xsl:if test="@xml:lang">
            <xsl:attribute name="lang">
               <xsl:call-template name="return-lang-applying-language-map">
                  <xsl:with-param name="doclang" select="@xml:lang"/>
               </xsl:call-template>
            </xsl:attribute>
         </xsl:if>
         <xsl:call-template name="maybe-set-id">
            <xsl:with-param name="only-if-id-attr" select="'no'"/>
            <xsl:with-param name="generated-id-prefix" select="'styler-id'"/>
         </xsl:call-template>
         <!--Process this element's content-->
         <xsl:apply-templates/>
      </div>
   </xsl:template>

<xsl:template name="__style-for_subpara.16pa-bra4411">
      <xsl:text> .x-subpara-11-0 {margin-left: 0pt; margin-right: 0pt; text-indent: 0pt; margin-top: 8pt; margin-left: 18pt; text-indent: 0pt; }</xsl:text>
   </xsl:template>

<xsl:template match="page-block[@pb-name='intro']//n-para/subpara" priority="5">
      <div>
         <!--Emit class values to reflect conditions-->
         <xsl:attribute name="class">
            <xsl:text> x-subpara-11-0</xsl:text>
         </xsl:attribute>
         <xsl:if test="@xml:lang">
            <xsl:attribute name="lang">
               <xsl:call-template name="return-lang-applying-language-map">
                  <xsl:with-param name="doclang" select="@xml:lang"/>
               </xsl:call-template>
            </xsl:attribute>
         </xsl:if>
         <xsl:copy-of select="@ch:*"/>
         <xsl:copy-of xmlns:dmp="http://www.arbortext.com/namespace/dmp/dmpmap" select="@dmp:*"/>
         <xsl:if test="@xml:lang">
            <xsl:attribute name="lang">
               <xsl:call-template name="return-lang-applying-language-map">
                  <xsl:with-param name="doclang" select="@xml:lang"/>
               </xsl:call-template>
            </xsl:attribute>
         </xsl:if>
         <xsl:call-template name="maybe-set-id">
            <xsl:with-param name="only-if-id-attr" select="'no'"/>
            <xsl:with-param name="generated-id-prefix" select="'styler-id'"/>
         </xsl:call-template>
         <!--Process this element's content-->
         <xsl:apply-templates/>
      </div>
   </xsl:template>

<xsl:template name="__style-for_subpara.16suarra5612">
      <xsl:text> .x-subpara-12-0 {margin-left: 0pt; margin-right: 0pt; text-indent: 0pt; margin-top: 8pt; margin-left: 18pt; text-indent: 0pt; }</xsl:text>
   </xsl:template>

<xsl:template match="subpara/subpara[title and ancestor::subpara[not(title)]]" priority="4">
      <div>
         <!--Emit class values to reflect conditions-->
         <xsl:attribute name="class">
            <xsl:text> x-subpara-12-0</xsl:text>
         </xsl:attribute>
         <xsl:if test="@xml:lang">
            <xsl:attribute name="lang">
               <xsl:call-template name="return-lang-applying-language-map">
                  <xsl:with-param name="doclang" select="@xml:lang"/>
               </xsl:call-template>
            </xsl:attribute>
         </xsl:if>
         <xsl:copy-of select="@ch:*"/>
         <xsl:copy-of xmlns:dmp="http://www.arbortext.com/namespace/dmp/dmpmap" select="@dmp:*"/>
         <xsl:if test="@xml:lang">
            <xsl:attribute name="lang">
               <xsl:call-template name="return-lang-applying-language-map">
                  <xsl:with-param name="doclang" select="@xml:lang"/>
               </xsl:call-template>
            </xsl:attribute>
         </xsl:if>
         <xsl:call-template name="maybe-set-id">
            <xsl:with-param name="only-if-id-attr" select="'no'"/>
            <xsl:with-param name="generated-id-prefix" select="'styler-id'"/>
         </xsl:call-template>
         <!--Process this element's content-->
         <xsl:apply-templates/>
      </div>
   </xsl:template>

<xsl:template name="__style-for_subpara.16suarra5613">
      <xsl:text> .x-subpara-13-0 {margin-left: 0pt; margin-right: 0pt; text-indent: 0pt; margin-top: 8pt; margin-left: 18pt; text-indent: 0pt; }</xsl:text>
   </xsl:template>

<xsl:template match="subpara/subpara[not(title) and ancestor::subpara[title]]" priority="3">
      <div>
         <!--Emit class values to reflect conditions-->
         <xsl:attribute name="class">
            <xsl:text> x-subpara-13-0</xsl:text>
         </xsl:attribute>
         <xsl:if test="@xml:lang">
            <xsl:attribute name="lang">
               <xsl:call-template name="return-lang-applying-language-map">
                  <xsl:with-param name="doclang" select="@xml:lang"/>
               </xsl:call-template>
            </xsl:attribute>
         </xsl:if>
         <xsl:copy-of select="@ch:*"/>
         <xsl:copy-of xmlns:dmp="http://www.arbortext.com/namespace/dmp/dmpmap" select="@dmp:*"/>
         <xsl:if test="@xml:lang">
            <xsl:attribute name="lang">
               <xsl:call-template name="return-lang-applying-language-map">
                  <xsl:with-param name="doclang" select="@xml:lang"/>
               </xsl:call-template>
            </xsl:attribute>
         </xsl:if>
         <xsl:call-template name="maybe-set-id">
            <xsl:with-param name="only-if-id-attr" select="'no'"/>
            <xsl:with-param name="generated-id-prefix" select="'styler-id'"/>
         </xsl:call-template>
         <!--Process this element's content-->
         <xsl:apply-templates/>
      </div>
   </xsl:template>

<xsl:template name="__style-for_subpara.16suarra2714">
      <xsl:text> .x-subpara-14-0 {margin-left: 0pt; margin-right: 0pt; text-indent: 0pt; margin-top: 8pt; margin-left: 0pt; text-indent: 0pt; }</xsl:text>
   </xsl:template>

<xsl:template match="subpara/subpara[not(title)]" priority="2">
      <div>
         <!--Emit class values to reflect conditions-->
         <xsl:attribute name="class">
            <xsl:text> x-subpara-14-0</xsl:text>
         </xsl:attribute>
         <xsl:if test="@xml:lang">
            <xsl:attribute name="lang">
               <xsl:call-template name="return-lang-applying-language-map">
                  <xsl:with-param name="doclang" select="@xml:lang"/>
               </xsl:call-template>
            </xsl:attribute>
         </xsl:if>
         <xsl:copy-of select="@ch:*"/>
         <xsl:copy-of xmlns:dmp="http://www.arbortext.com/namespace/dmp/dmpmap" select="@dmp:*"/>
         <xsl:if test="@xml:lang">
            <xsl:attribute name="lang">
               <xsl:call-template name="return-lang-applying-language-map">
                  <xsl:with-param name="doclang" select="@xml:lang"/>
               </xsl:call-template>
            </xsl:attribute>
         </xsl:if>
         <xsl:call-template name="maybe-set-id">
            <xsl:with-param name="only-if-id-attr" select="'no'"/>
            <xsl:with-param name="generated-id-prefix" select="'styler-id'"/>
         </xsl:call-template>
         <!--Process this element's content-->
         <xsl:apply-templates/>
      </div>
   </xsl:template>

<xsl:template name="__style-for_subpara.16suarra1915">
      <xsl:text> .x-subpara-15-0 {margin-left: 0pt; margin-right: 0pt; text-indent: 0pt; margin-top: 8pt; margin-left: 18pt; text-indent: 0pt; }</xsl:text>
   </xsl:template>

<xsl:template match="subpara[not(title)]" priority="1">
      <div>
         <!--Emit class values to reflect conditions-->
         <xsl:attribute name="class">
            <xsl:text> x-subpara-15-0</xsl:text>
         </xsl:attribute>
         <xsl:if test="@xml:lang">
            <xsl:attribute name="lang">
               <xsl:call-template name="return-lang-applying-language-map">
                  <xsl:with-param name="doclang" select="@xml:lang"/>
               </xsl:call-template>
            </xsl:attribute>
         </xsl:if>
         <xsl:copy-of select="@ch:*"/>
         <xsl:copy-of xmlns:dmp="http://www.arbortext.com/namespace/dmp/dmpmap" select="@dmp:*"/>
         <xsl:if test="@xml:lang">
            <xsl:attribute name="lang">
               <xsl:call-template name="return-lang-applying-language-map">
                  <xsl:with-param name="doclang" select="@xml:lang"/>
               </xsl:call-template>
            </xsl:attribute>
         </xsl:if>
         <xsl:call-template name="maybe-set-id">
            <xsl:with-param name="only-if-id-attr" select="'no'"/>
            <xsl:with-param name="generated-id-prefix" select="'styler-id'"/>
         </xsl:call-template>
         <!--Process this element's content-->
         <xsl:apply-templates/>
      </div>
   </xsl:template>

<xsl:template name="__style-for_subpara.16suarra716">
      <xsl:text> .x-subpara-16-0 {margin-left: 0pt; margin-right: 0pt; text-indent: 0pt; margin-top: 8pt; margin-left: 18pt; text-indent: 0pt; }</xsl:text>
   </xsl:template>

<xsl:template match="subpara" priority="0">
      <div>
         <!--Emit class values to reflect conditions-->
         <xsl:attribute name="class">
            <xsl:text> x-subpara-16-0</xsl:text>
         </xsl:attribute>
         <xsl:if test="@xml:lang">
            <xsl:attribute name="lang">
               <xsl:call-template name="return-lang-applying-language-map">
                  <xsl:with-param name="doclang" select="@xml:lang"/>
               </xsl:call-template>
            </xsl:attribute>
         </xsl:if>
         <xsl:copy-of select="@ch:*"/>
         <xsl:copy-of xmlns:dmp="http://www.arbortext.com/namespace/dmp/dmpmap" select="@dmp:*"/>
         <xsl:if test="@xml:lang">
            <xsl:attribute name="lang">
               <xsl:call-template name="return-lang-applying-language-map">
                  <xsl:with-param name="doclang" select="@xml:lang"/>
               </xsl:call-template>
            </xsl:attribute>
         </xsl:if>
         <xsl:call-template name="maybe-set-id">
            <xsl:with-param name="only-if-id-attr" select="'no'"/>
            <xsl:with-param name="generated-id-prefix" select="'styler-id'"/>
         </xsl:call-template>
         <!--Process this element's content-->
         <xsl:apply-templates/>
      </div>
   </xsl:template>

<xsl:template name="__style-for_sup.1">
      <xsl:text> .x-sup-1-0 {margin-left: 0pt; margin-right: 0pt; font-size: .69em; top: -.33em; position: relative; }</xsl:text>
   </xsl:template>

<xsl:template match="sup" priority="0">
      <span>
         <!--Emit class values to reflect conditions-->
         <xsl:attribute name="class">
            <xsl:text> x-sup-1-0</xsl:text>
         </xsl:attribute>
         <xsl:if test="@xml:lang">
            <xsl:attribute name="lang">
               <xsl:call-template name="return-lang-applying-language-map">
                  <xsl:with-param name="doclang" select="@xml:lang"/>
               </xsl:call-template>
            </xsl:attribute>
         </xsl:if>
         <xsl:copy-of select="@ch:*"/>
         <xsl:copy-of xmlns:dmp="http://www.arbortext.com/namespace/dmp/dmpmap" select="@dmp:*"/>
         <xsl:if test="@xml:lang">
            <xsl:attribute name="lang">
               <xsl:call-template name="return-lang-applying-language-map">
                  <xsl:with-param name="doclang" select="@xml:lang"/>
               </xsl:call-template>
            </xsl:attribute>
         </xsl:if>
         <xsl:call-template name="maybe-set-id"/>
         <!--Process this element's content-->
         <xsl:apply-templates/>
      </span>
   </xsl:template>

<xsl:template match="pgblk/_ufe:supplier-list-title" priority="3">
  <div ch:title="notoc" class=" x--ufe-supplier-list-title-1-0">
    <xsl:call-template name="t-base-div-title"/>
  </div>
</xsl:template>

<xsl:template match="pbfmatr/_ufe:supplier-list-title" priority="2">
  <div ch:title="notoc" class=" x--ufe-supplier-list-title-2-0">
    <xsl:call-template name="t-base-div-title"/>
  </div>
</xsl:template>

<xsl:template match="pwcspblist/_ufe:supplier-list-title" priority="1">
  <div ch:title="notoc" class=" x--ufe-supplier-list-title-3-0">
    <xsl:call-template name="t-base-div-title"/>
  </div>
</xsl:template>

<xsl:template match="table[@display='expand']" priority="13">
      <div>
         <!--Emit class values to reflect conditions-->
         <xsl:attribute name="class">
            <xsl:text> x-table-1-0</xsl:text>
         </xsl:attribute>
         <xsl:if test="@xml:lang">
            <xsl:attribute name="lang">
               <xsl:call-template name="return-lang-applying-language-map">
                  <xsl:with-param name="doclang" select="@xml:lang"/>
               </xsl:call-template>
            </xsl:attribute>
         </xsl:if>
         <xsl:copy-of select="@ch:*"/>
         <xsl:copy-of xmlns:dmp="http://www.arbortext.com/namespace/dmp/dmpmap" select="@dmp:*"/>
         <xsl:if test="@xml:lang">
            <xsl:attribute name="lang">
               <xsl:call-template name="return-lang-applying-language-map">
                  <xsl:with-param name="doclang" select="@xml:lang"/>
               </xsl:call-template>
            </xsl:attribute>
         </xsl:if>
         <xsl:call-template name="maybe-set-id">
            <xsl:with-param name="only-if-id-attr" select="'no'"/>
            <xsl:with-param name="generated-id-prefix" select="'styler-id'"/>
         </xsl:call-template>
         <!--Process this element's content-->
         <xsl:apply-templates/>
      </div>
   </xsl:template>

<xsl:template name="__style-for_table.14taele432">
      <xsl:text> .x-table-2-0 {margin-left: 0pt; margin-right: 0pt; text-indent: 0pt; margin-top: 8pt; font-family: Arial; margin-left: 18pt; text-indent: 0pt; } .x-table-2-1 {font-size: 10pt; }</xsl:text>
   </xsl:template>

<xsl:template match="table[not(title) and not(@tabstyle='frac')]" priority="12">
      <xsl:variable name="foClass">formalBlock</xsl:variable>
      <xsl:variable name="blockness">block</xsl:variable>
      <xsl:variable name="startnew"/>
      <xsl:variable name="newpageset">#noChange</xsl:variable>
      <div>
         <!--Emit class values to reflect conditions-->
         <xsl:attribute name="class">
            <xsl:text> x-table-2-0</xsl:text>
            <xsl:if test="ancestor-or-self::page-block[1]/@pb-name and string(ancestor-or-self::page-block[1]/@pb-name)='title-page'"> x-table-2-1</xsl:if>
         </xsl:attribute>
         <xsl:if test="@xml:lang">
            <xsl:attribute name="lang">
               <xsl:call-template name="return-lang-applying-language-map">
                  <xsl:with-param name="doclang" select="@xml:lang"/>
               </xsl:call-template>
            </xsl:attribute>
         </xsl:if>
         <xsl:copy-of select="@ch:*"/>
         <xsl:copy-of xmlns:dmp="http://www.arbortext.com/namespace/dmp/dmpmap" select="@dmp:*"/>
         <xsl:variable name="Breaks-chunkFilenameXPath"/>
         <xsl:variable name="Breaks-persistentFilename"/>
         <xsl:if test="($Breaks-persistentFilename='yes') and ($Breaks-chunkFilenameXPath!='')">
            <xsl:variable name="chunkFilename"/>
            <xsl:if test="$chunkFilename!=''">
               <xsl:attribute name="ch:filename">
                  <xsl:value-of select="$chunkFilename"/>
               </xsl:attribute>
               <xsl:attribute name="ch:namepriority">0</xsl:attribute>
            </xsl:if>
         </xsl:if>
         <xsl:if test="@xml:lang">
            <xsl:attribute name="lang">
               <xsl:call-template name="return-lang-applying-language-map">
                  <xsl:with-param name="doclang" select="@xml:lang"/>
               </xsl:call-template>
            </xsl:attribute>
         </xsl:if>
         <xsl:call-template name="maybe-set-id">
            <xsl:with-param name="only-if-id-attr" select="'no'"/>
            <xsl:with-param name="generated-id-prefix" select="'styler-id'"/>
         </xsl:call-template>
         <!--Process this element's content-->
         <xsl:apply-templates/>
      </div>
   </xsl:template>

<xsl:template name="__style-for_table.8shtgle171">
      <xsl:text> .x-table-1-0
{margin-left: 0pt; margin-right: 0pt; text-indent: 0pt; margin-top:
8pt; }</xsl:text>
   </xsl:template>

<xsl:template match="sheet/gdesc/table" priority="9">
      <div xmlns:dmp="http://www.arbortext.com/namespace/dmp/dmpmap">
         <a>
            <xsl:attribute name="href">
               <xsl:text>#none</xsl:text>
            </xsl:attribute>
            <xsl:attribute name="onClick">
               <xsl:text>toggle('</xsl:text>
               <xsl:value-of select="@id"/>
               <xsl:text>',</xsl:text>
               <xsl:text>'</xsl:text>
               <xsl:value-of select="@id"/>
               <xsl:text>');</xsl:text>
            </xsl:attribute>
            <img alt="table" src="_templates/frame/images/table.gif" style="border-style:none;"/>
            <xsl:text>                   </xsl:text>
            <xsl:apply-templates mode="numbering" select="title"/>
         </a>
      </div>
      <div style="display:none">
         <!--Emit class values to reflect conditions-->
         <xsl:attribute name="class">
            <xsl:text> x-table-3-0</xsl:text>
         </xsl:attribute>
         <xsl:if test="@xml:lang">
            <xsl:attribute name="lang">
               <xsl:call-template name="return-lang-applying-language-map">
                  <xsl:with-param name="doclang" select="@xml:lang"/>
               </xsl:call-template>
            </xsl:attribute>
         </xsl:if>
         <xsl:copy-of select="@ch:*"/>
         <xsl:copy-of xmlns:dmp="http://www.arbortext.com/namespace/dmp/dmpmap" select="@dmp:*"/>
         <xsl:attribute name="id">
            <xsl:text>styler-id</xsl:text>
            <xsl:apply-templates mode="set-id" select="."/>
         </xsl:attribute>
         <xsl:if test="@xml:lang">
            <xsl:attribute name="lang">
               <xsl:call-template name="return-lang-applying-language-map">
                  <xsl:with-param name="doclang" select="@xml:lang"/>
               </xsl:call-template>
            </xsl:attribute>
         </xsl:if>
         <xsl:call-template name="maybe-set-id">
            <xsl:with-param name="only-if-id-attr" select="'no'"/>
            <xsl:with-param name="generated-id-prefix" select="'styler-id'"/>
         </xsl:call-template>
         <!--Process this element's content-->
         <xsl:apply-templates> </xsl:apply-templates>
      </div>
      <script language="javascript" type="text/javascript"> function toggle (heading, tableId) { var headingObj
= document.getElementById(heading); var tableObj = document.getElementById(tableId);
      if (tableObj) {         if (tableObj.style.display == 'block')
{              tableObj.style.display='none';                   headingObj.style.cursor='s-resize';
            } else {                tableObj.style.display='block';
                  headingObj.style.cursor='n-resize';            
}     } } </script>
   </xsl:template>

<xsl:template name="__style-for_table.14hilile164">
      <xsl:text> .x-table-4-0 {margin-left: 0pt; margin-right: 0pt; text-indent: 0pt; margin-top: 8pt; font-family: Arial; }</xsl:text>
   </xsl:template>

<xsl:template match="highlights/table" priority="10">
      <div>
         <!--Emit class values to reflect conditions-->
         <xsl:attribute name="class">
            <xsl:text> x-table-4-0</xsl:text>
         </xsl:attribute>
         <xsl:if test="@xml:lang">
            <xsl:attribute name="lang">
               <xsl:call-template name="return-lang-applying-language-map">
                  <xsl:with-param name="doclang" select="@xml:lang"/>
               </xsl:call-template>
            </xsl:attribute>
         </xsl:if>
         <xsl:copy-of select="@ch:*"/>
         <xsl:copy-of xmlns:dmp="http://www.arbortext.com/namespace/dmp/dmpmap" select="@dmp:*"/>
         <xsl:if test="@xml:lang">
            <xsl:attribute name="lang">
               <xsl:call-template name="return-lang-applying-language-map">
                  <xsl:with-param name="doclang" select="@xml:lang"/>
               </xsl:call-template>
            </xsl:attribute>
         </xsl:if>
         <xsl:call-template name="maybe-set-id">
            <xsl:with-param name="only-if-id-attr" select="'no'"/>
            <xsl:with-param name="generated-id-prefix" select="'styler-id'"/>
         </xsl:call-template>
         <!--Process this element's content-->
         <xsl:apply-templates/>
      </div>
   </xsl:template>

<xsl:template name="__style-for_table.10firele124">
      <xsl:text> .x-table-5-0
{margin-left: 0pt; margin-right: 0pt; text-indent: 0pt; margin-top:
8pt; }</xsl:text>
   </xsl:template>

<xsl:template match="figure/table" priority="7">
      <div xmlns:dmp="http://www.arbortext.com/namespace/dmp/dmpmap">
         <a>
            <xsl:attribute name="href">
               <xsl:text>#none</xsl:text>
            </xsl:attribute>
            <xsl:attribute name="onClick">
               <xsl:text>toggle('</xsl:text>
               <xsl:value-of select="@id"/>
               <xsl:text>',</xsl:text>
               <xsl:text>'</xsl:text>
               <xsl:value-of select="@id"/>
               <xsl:text>');</xsl:text>
            </xsl:attribute>
            <img alt="table" src="_templates/frame/images/table.gif" style="border-style:none;"/>
            <xsl:text>                   </xsl:text>
            <xsl:apply-templates mode="numbering" select="title"/>
         </a>
      </div>
      <div style="display:none">
         <!--Emit class values to reflect conditions-->
         <xsl:attribute name="class">
            <xsl:text> x-table-5-0</xsl:text>
         </xsl:attribute>
         <xsl:if test="@xml:lang">
            <xsl:attribute name="lang">
               <xsl:call-template name="return-lang-applying-language-map">
                  <xsl:with-param name="doclang" select="@xml:lang"/>
               </xsl:call-template>
            </xsl:attribute>
         </xsl:if>
         <xsl:copy-of select="@ch:*"/>
         <xsl:copy-of xmlns:dmp="http://www.arbortext.com/namespace/dmp/dmpmap" select="@dmp:*"/>
         <xsl:attribute name="id">
            <xsl:text>styler-id</xsl:text>
            <xsl:apply-templates mode="set-id" select="."/>
         </xsl:attribute>
         <xsl:if test="@xml:lang">
            <xsl:attribute name="lang">
               <xsl:call-template name="return-lang-applying-language-map">
                  <xsl:with-param name="doclang" select="@xml:lang"/>
               </xsl:call-template>
            </xsl:attribute>
         </xsl:if>
         <xsl:call-template name="maybe-set-id">
            <xsl:with-param name="only-if-id-attr" select="'no'"/>
            <xsl:with-param name="generated-id-prefix" select="'styler-id'"/>
         </xsl:call-template>
         <!--Process this element's content-->
         <xsl:apply-templates> </xsl:apply-templates>
      </div>
      <script language="javascript" type="text/javascript"> function toggle (heading, tableId) { var headingObj
= document.getElementById(heading); var tableObj = document.getElementById(tableId);
      if (tableObj) {         if (tableObj.style.display == 'block')
{              tableObj.style.display='none';                   headingObj.style.cursor='s-resize';
            } else {                tableObj.style.display='block';
                  headingObj.style.cursor='n-resize';            
}     } } </script>
   </xsl:template>

<xsl:template name="__style-for_table.14mftrle206">
      <xsl:text> .x-table-6-0
{margin-left: 0pt; margin-right: 0pt; text-indent: 0pt; margin-top:
8pt; font-family: Arial; font-size: 10pt; margin-left: 18pt; text-indent:
0pt; } /* gdb 12-10-12: added source edits for expand/collapse table
capability JIRA-821 */</xsl:text>
   </xsl:template>

<xsl:template match="mfmatr//table[title]" priority="8">
      <!--gdb 12-10-12: added toggling to expand/collapse for tables with titles-->
      <div xmlns:dmp="http://www.arbortext.com/namespace/dmp/dmpmap">
         <a>
            <xsl:attribute name="href">
               <xsl:text>#none</xsl:text>
            </xsl:attribute>
            <xsl:attribute name="onClick">
               <xsl:text>toggle('</xsl:text>
               <xsl:value-of select="@id"/>
               <xsl:text>',</xsl:text>
               <xsl:text>'</xsl:text>
               <xsl:value-of select="@id"/>
               <xsl:text>');</xsl:text>
            </xsl:attribute>
            <img alt="table" src="_templates/frame/images/table.gif" style="border-style:none;"/>
            <xsl:text>                   </xsl:text>
            <xsl:apply-templates mode="numbering" select="title"/>
         </a>
      </div>
      <!--gdb 12-10-12: added display:none-->
      <div style="display:none">
         <!--Emit class values to reflect conditions-->
         <xsl:attribute name="class">
            <xsl:text> x-table-6-0</xsl:text>
         </xsl:attribute>
         <xsl:if test="@xml:lang">
            <xsl:attribute name="lang">
               <xsl:call-template name="return-lang-applying-language-map">
                  <xsl:with-param name="doclang" select="@xml:lang"/>
               </xsl:call-template>
            </xsl:attribute>
         </xsl:if>
         <xsl:copy-of select="@ch:*"/>
         <xsl:copy-of xmlns:dmp="http://www.arbortext.com/namespace/dmp/dmpmap" select="@dmp:*"/>
         <xsl:if test="@xml:lang">
            <xsl:attribute name="lang">
               <xsl:call-template name="return-lang-applying-language-map">
                  <xsl:with-param name="doclang" select="@xml:lang"/>
               </xsl:call-template>
            </xsl:attribute>
         </xsl:if>
         <xsl:call-template name="maybe-set-id">
            <xsl:with-param name="only-if-id-attr" select="'no'"/>
            <xsl:with-param name="generated-id-prefix" select="'styler-id'"/>
         </xsl:call-template>
         <!--Process this element's content-->
         <xsl:apply-templates> </xsl:apply-templates>
      </div>
      <!--gdb 12-10-12: added call to java script-->
      <script language="javascript" type="text/javascript"> function toggle (heading,
tableId) { var headingObj = document.getElementById(heading); var
tableObj = document.getElementById(tableId);       if (tableObj) {
        if (tableObj.style.display == 'block') {              tableObj.style.display='none';
                  headingObj.style.cursor='s-resize';            
} else {                tableObj.style.display='block';          
        headingObj.style.cursor='n-resize';             }     } } </script>
   </xsl:template>

<xsl:template name="__style-for_table.14mftrle137">
      <xsl:text> .x-table-7-0 {margin-left: 0pt; margin-right: 0pt; text-indent: 0pt; margin-top: 8pt; font-family: Arial; font-size: 10pt; margin-left: 18pt; text-indent: 0pt; }</xsl:text>
   </xsl:template>

<xsl:template match="mfmatr//table" priority="7">
      <div>
         <!--Emit class values to reflect conditions-->
         <xsl:attribute name="class">
            <xsl:text> x-table-7-0</xsl:text>
         </xsl:attribute>
         <xsl:if test="@xml:lang">
            <xsl:attribute name="lang">
               <xsl:call-template name="return-lang-applying-language-map">
                  <xsl:with-param name="doclang" select="@xml:lang"/>
               </xsl:call-template>
            </xsl:attribute>
         </xsl:if>
         <xsl:copy-of select="@ch:*"/>
         <xsl:copy-of xmlns:dmp="http://www.arbortext.com/namespace/dmp/dmpmap" select="@dmp:*"/>
         <xsl:if test="@xml:lang">
            <xsl:attribute name="lang">
               <xsl:call-template name="return-lang-applying-language-map">
                  <xsl:with-param name="doclang" select="@xml:lang"/>
               </xsl:call-template>
            </xsl:attribute>
         </xsl:if>
         <xsl:call-template name="maybe-set-id">
            <xsl:with-param name="only-if-id-attr" select="'no'"/>
            <xsl:with-param name="generated-id-prefix" select="'styler-id'"/>
         </xsl:call-template>
         <!--Process this element's content-->
         <xsl:apply-templates/>
      </div>
   </xsl:template>

<xsl:template name="__style-for_table.7taele442">
      <xsl:text> .x-table-8-0
{margin-left: 0pt; margin-right: 0pt; text-indent: 0pt; font-family:
Arial; font-size: 9pt; }</xsl:text>
   </xsl:template>

<xsl:template match="table[@tabstyle='eqn' and @display='inline']" priority="6">
      <span xmlns:dmp="http://www.arbortext.com/namespace/dmp/dmpmap" style="display:inline-block">
         <!--Emit class values to reflect conditions-->
         <xsl:attribute name="class">
            <xsl:text> x-table-8-0</xsl:text>
         </xsl:attribute>
         <xsl:if test="@xml:lang">
            <xsl:attribute name="lang">
               <xsl:call-template name="return-lang-applying-language-map">
                  <xsl:with-param name="doclang" select="@xml:lang"/>
               </xsl:call-template>
            </xsl:attribute>
         </xsl:if>
         <xsl:copy-of select="@ch:*"/>
         <xsl:copy-of select="@dmp:*"/>
         <xsl:if test="@xml:lang">
            <xsl:attribute name="lang">
               <xsl:call-template name="return-lang-applying-language-map">
                  <xsl:with-param name="doclang" select="@xml:lang"/>
               </xsl:call-template>
            </xsl:attribute>
         </xsl:if>
         <xsl:call-template name="maybe-set-id">
            <xsl:with-param name="only-if-id-attr" select="'no'"/>
            <xsl:with-param name="generated-id-prefix" select="'styler-id'"/>
         </xsl:call-template>
         <!--Process this element's content-->
         <xsl:apply-templates> </xsl:apply-templates>
      </span>
   </xsl:template>

<xsl:template name="__style-for_table.14taele259">
      <xsl:text> .x-table-9-0 {margin-left: 0pt; margin-right: 0pt; text-indent: 0pt; margin-top: 8pt; font-family: Arial; font-weight: bold; margin-left: 18pt; text-indent: 0pt; }</xsl:text>
   </xsl:template>

<xsl:template match="table[@tabstyle='IPCDET']" priority="5">
      <div>
         <!--Emit class values to reflect conditions-->
         <xsl:attribute name="class">
            <xsl:text> x-table-9-0</xsl:text>
         </xsl:attribute>
         <xsl:if test="@xml:lang">
            <xsl:attribute name="lang">
               <xsl:call-template name="return-lang-applying-language-map">
                  <xsl:with-param name="doclang" select="@xml:lang"/>
               </xsl:call-template>
            </xsl:attribute>
         </xsl:if>
         <xsl:copy-of select="@ch:*"/>
         <xsl:copy-of xmlns:dmp="http://www.arbortext.com/namespace/dmp/dmpmap" select="@dmp:*"/>
         <xsl:if test="@xml:lang">
            <xsl:attribute name="lang">
               <xsl:call-template name="return-lang-applying-language-map">
                  <xsl:with-param name="doclang" select="@xml:lang"/>
               </xsl:call-template>
            </xsl:attribute>
         </xsl:if>
         <xsl:call-template name="maybe-set-id">
            <xsl:with-param name="only-if-id-attr" select="'no'"/>
            <xsl:with-param name="generated-id-prefix" select="'styler-id'"/>
         </xsl:call-template>
         <!--Process this element's content-->
         <xsl:apply-templates/>
      </div>
   </xsl:template>

<xsl:template name="__style-for_table.12taele409">
      <xsl:text> .x-table-10-0
{margin-left: 0pt; margin-right: 0pt; text-indent: 0pt; font-family:
Arial; font-weight: normal; line-height: 5pt; margin-bottom: -5pt;
} /* gdb 11-20-12: source edit to put table in an equation inline
and centered with &lt;list&gt; text  */</xsl:text>
   </xsl:template>

<xsl:template match="table[@tabstyle='frac' and parent::item]" priority="4">
      <span xmlns:dmp="http://www.arbortext.com/namespace/dmp/dmpmap" style="display:inline-block">
         <!--Emit class values to reflect conditions-->
         <xsl:attribute name="class">
            <xsl:text> x-table-10-0</xsl:text>
         </xsl:attribute>
         <xsl:if test="@xml:lang">
            <xsl:attribute name="lang">
               <xsl:call-template name="return-lang-applying-language-map">
                  <xsl:with-param name="doclang" select="@xml:lang"/>
               </xsl:call-template>
            </xsl:attribute>
         </xsl:if>
         <xsl:copy-of select="@ch:*"/>
         <xsl:copy-of select="@dmp:*"/>
         <xsl:if test="@xml:lang">
            <xsl:attribute name="lang">
               <xsl:call-template name="return-lang-applying-language-map">
                  <xsl:with-param name="doclang" select="@xml:lang"/>
               </xsl:call-template>
            </xsl:attribute>
         </xsl:if>
         <xsl:call-template name="maybe-set-id">
            <xsl:with-param name="only-if-id-attr" select="'no'"/>
            <xsl:with-param name="generated-id-prefix" select="'styler-id'"/>
         </xsl:call-template>
         <!--Process this element's content-->
         <xsl:apply-templates> </xsl:apply-templates>
      </span>
   </xsl:template>

<xsl:template name="__style-for_table.13taele19312">
      <xsl:text> .x-table-11-0
{margin-left: 0pt; margin-right: 0pt; text-indent: 0pt; font-family:
Arial; font-weight: normal; line-height: 5pt; margin-bottom: -5pt;
} /* gdb 11-21-12: source edit to put table in an equation inline
and centered with &lt;step&gt; text  */</xsl:text>
   </xsl:template>

<xsl:template match="table[@tabstyle='frac' and parent::step1 or @tabstyle='frac' and parent::step2 or @tabstyle='frac' and parent::step3 or @tabstyle='frac' and parent::step4 or @tabstyle='frac' and parent::step5]" priority="3">
      <span xmlns:dmp="http://www.arbortext.com/namespace/dmp/dmpmap" style="display:inline-block">
         <!--Emit class values to reflect conditions-->
         <xsl:attribute name="class">
            <xsl:text> x-table-11-0</xsl:text>
         </xsl:attribute>
         <xsl:if test="@xml:lang">
            <xsl:attribute name="lang">
               <xsl:call-template name="return-lang-applying-language-map">
                  <xsl:with-param name="doclang" select="@xml:lang"/>
               </xsl:call-template>
            </xsl:attribute>
         </xsl:if>
         <xsl:copy-of select="@ch:*"/>
         <xsl:copy-of select="@dmp:*"/>
         <xsl:if test="@xml:lang">
            <xsl:attribute name="lang">
               <xsl:call-template name="return-lang-applying-language-map">
                  <xsl:with-param name="doclang" select="@xml:lang"/>
               </xsl:call-template>
            </xsl:attribute>
         </xsl:if>
         <xsl:call-template name="maybe-set-id">
            <xsl:with-param name="only-if-id-attr" select="'no'"/>
            <xsl:with-param name="generated-id-prefix" select="'styler-id'"/>
         </xsl:call-template>
         <!--Process this element's content-->
         <xsl:apply-templates> </xsl:apply-templates>
      </span>
   </xsl:template>

<xsl:template name="__style-for_table.11taele238">
      <xsl:text> .x-table-12-0
{margin-left: 0pt; margin-right: 0pt; text-indent: 0pt; font-family:
Arial; font-weight: normal; margin-bottom: -15pt; } /* gdb 10-05-12:
source edit to put table in an equation inline and centered with &lt;eqn&gt;
text  */</xsl:text>
   </xsl:template>

<xsl:template match="table[@tabstyle='frac']" priority="2">
      <span xmlns:dmp="http://www.arbortext.com/namespace/dmp/dmpmap" style="display:inline-block">
         <!--Emit class values to reflect conditions-->
         <xsl:attribute name="class">
            <xsl:text> x-table-12-0</xsl:text>
         </xsl:attribute>
         <xsl:if test="@xml:lang">
            <xsl:attribute name="lang">
               <xsl:call-template name="return-lang-applying-language-map">
                  <xsl:with-param name="doclang" select="@xml:lang"/>
               </xsl:call-template>
            </xsl:attribute>
         </xsl:if>
         <xsl:copy-of select="@ch:*"/>
         <xsl:copy-of select="@dmp:*"/>
         <xsl:if test="@xml:lang">
            <xsl:attribute name="lang">
               <xsl:call-template name="return-lang-applying-language-map">
                  <xsl:with-param name="doclang" select="@xml:lang"/>
               </xsl:call-template>
            </xsl:attribute>
         </xsl:if>
         <xsl:call-template name="maybe-set-id">
            <xsl:with-param name="only-if-id-attr" select="'no'"/>
            <xsl:with-param name="generated-id-prefix" select="'styler-id'"/>
         </xsl:call-template>
         <!--Process this element's content-->
         <xsl:apply-templates> </xsl:apply-templates>
      </span>
   </xsl:template>

<xsl:template name="__style-for_table.14taele2213">
      <xsl:text> .x-table-13-0 {margin-left: 0pt; margin-right: 0pt; text-indent: 0pt; margin-top: 8pt; font-family: Arial; font-size: 9pt; }</xsl:text>
   </xsl:template>

<xsl:template match="table[@tabstyle='eqn']" priority="1">
      <div>
         <!--Emit class values to reflect conditions-->
         <xsl:attribute name="class">
            <xsl:text> x-table-13-0</xsl:text>
         </xsl:attribute>
         <xsl:if test="@xml:lang">
            <xsl:attribute name="lang">
               <xsl:call-template name="return-lang-applying-language-map">
                  <xsl:with-param name="doclang" select="@xml:lang"/>
               </xsl:call-template>
            </xsl:attribute>
         </xsl:if>
         <xsl:copy-of select="@ch:*"/>
         <xsl:copy-of xmlns:dmp="http://www.arbortext.com/namespace/dmp/dmpmap" select="@dmp:*"/>
         <xsl:if test="@xml:lang">
            <xsl:attribute name="lang">
               <xsl:call-template name="return-lang-applying-language-map">
                  <xsl:with-param name="doclang" select="@xml:lang"/>
               </xsl:call-template>
            </xsl:attribute>
         </xsl:if>
         <xsl:call-template name="maybe-set-id">
            <xsl:with-param name="only-if-id-attr" select="'no'"/>
            <xsl:with-param name="generated-id-prefix" select="'styler-id'"/>
         </xsl:call-template>
         <!--Process this element's content-->
         <xsl:apply-templates/>
      </div>
   </xsl:template>

<xsl:template name="__style-for_table.6taele56">
      <xsl:text> .x-table-14-0
{margin-left: 0pt; margin-right: 0pt; text-indent: 0pt; margin-top:
8pt; font-family: Arial; margin-left: 18pt; text-indent: 0pt; } .x-table-6-1
{}</xsl:text>
   </xsl:template>

<xsl:template match="table" priority="0">
      <xsl:variable name="foClass">formalBlock</xsl:variable>
      <xsl:variable name="blockness">block</xsl:variable>
      <xsl:variable name="startnew"/>
      <xsl:variable name="newpageset">#noChange</xsl:variable>
      <div xmlns:dmp="http://www.arbortext.com/namespace/dmp/dmpmap">
         <a>
            <xsl:attribute name="href">
               <xsl:text>#none</xsl:text>
            </xsl:attribute>
            <xsl:attribute name="onClick">
               <xsl:text>toggle('</xsl:text>
               <xsl:value-of select="@id"/>
               <xsl:text>',</xsl:text>
               <xsl:text>'</xsl:text>
               <xsl:value-of select="@id"/>
               <xsl:text>');</xsl:text>
            </xsl:attribute>
            <img alt="table" src="_templates/frame/images/table.gif" style="border-style:none;"/>
            <xsl:text>                   </xsl:text>
            <xsl:apply-templates mode="numbering" select="title"/>
         </a>
      </div>
      <div xmlns:dmp="http://www.arbortext.com/namespace/dmp/dmpmap" style="display:none">
         <!--Emit class values to reflect conditions-->
         <xsl:attribute name="class">
            <xsl:text> x-table-14-0</xsl:text>
            <xsl:if test="(@tabstyle and string(@tabstyle)='general') or (@tabstyle and string(@tabstyle)='consumables') or (@tabstyle and string(@tabstyle)='special-tools') or (@tabstyle and string(@tabstyle)='fixtures-and-equipment')"> x-table-13-1</xsl:if>
         </xsl:attribute>
         <xsl:if test="@xml:lang">
            <xsl:attribute name="lang">
               <xsl:call-template name="return-lang-applying-language-map">
                  <xsl:with-param name="doclang" select="@xml:lang"/>
               </xsl:call-template>
            </xsl:attribute>
         </xsl:if>
         <xsl:copy-of select="@ch:*"/>
         <xsl:copy-of select="@dmp:*"/>
         <xsl:variable name="Breaks-chunkFilenameXPath"/>
         <xsl:variable name="Breaks-persistentFilename"/>
         <xsl:if test="($Breaks-persistentFilename='yes') and ($Breaks-chunkFilenameXPath!='')">
            <xsl:variable name="chunkFilename"/>
            <xsl:if test="$chunkFilename!=''">
               <xsl:attribute name="ch:filename">
                  <xsl:value-of select="$chunkFilename"/>
               </xsl:attribute>
               <xsl:attribute name="ch:namepriority">0</xsl:attribute>
            </xsl:if>
         </xsl:if>
         <xsl:if test="@xml:lang">
            <xsl:attribute name="lang">
               <xsl:call-template name="return-lang-applying-language-map">
                  <xsl:with-param name="doclang" select="@xml:lang"/>
               </xsl:call-template>
            </xsl:attribute>
         </xsl:if>
         <xsl:call-template name="maybe-set-id">
            <xsl:with-param name="only-if-id-attr" select="'no'"/>
            <xsl:with-param name="generated-id-prefix" select="'styler-id'"/>
         </xsl:call-template>
         <!--Process this element's content-->
         <xsl:apply-templates> </xsl:apply-templates>
      </div>
   </xsl:template>

<xsl:template name="__style-for__ufe-task-postspace.1">
      <xsl:text> .x--ufe-task-postspace-1-0 {margin-left: 0pt; margin-right: 0pt; text-indent: 0pt; margin-bottom: 4pt; }</xsl:text>
   </xsl:template>

<xsl:template match="_ufe:task-postspace" priority="0">
      <div>
         <!--Emit class values to reflect conditions-->
         <xsl:attribute name="class">
            <xsl:text> x--ufe-task-postspace-1-0</xsl:text>
         </xsl:attribute>
         <xsl:if test="@xml:lang">
            <xsl:attribute name="lang">
               <xsl:call-template name="return-lang-applying-language-map">
                  <xsl:with-param name="doclang" select="@xml:lang"/>
               </xsl:call-template>
            </xsl:attribute>
         </xsl:if>
         <xsl:copy-of select="@ch:*"/>
         <xsl:copy-of xmlns:dmp="http://www.arbortext.com/namespace/dmp/dmpmap" select="@dmp:*"/>
         <xsl:if test="@xml:lang">
            <xsl:attribute name="lang">
               <xsl:call-template name="return-lang-applying-language-map">
                  <xsl:with-param name="doclang" select="@xml:lang"/>
               </xsl:call-template>
            </xsl:attribute>
         </xsl:if>
         <xsl:call-template name="maybe-set-id"/>
         <!--Process this element's content-->
         <xsl:apply-templates/>
      </div>
   </xsl:template>

<xsl:template match="pgblk/_ufe:task-title" priority="3">
  <div ch:title="notoc" class=" x--ufe-task-title-1-0">
    <xsl:call-template name="t-base-div-title"/>
  </div>
</xsl:template>

<xsl:template match="pbfmatr/_ufe:task-title" priority="2">
  <div ch:title="notoc" class=" x--ufe-task-title-2-0">
    <xsl:call-template name="t-base-div-title"/>
  </div>
</xsl:template>

<xsl:template match="_ufe:task-title" priority="0">
  <div ch:title="notoc" class=" x--ufe-task-title-4-0">
    <xsl:call-template name="t-base-div-title"/>
  </div>
</xsl:template>

<xsl:template match="address/tel[1]" priority="2">
      <div>
         <!--Emit class values to reflect conditions-->
         <xsl:attribute name="class">
            <xsl:text> x-tel-1-0</xsl:text>
         </xsl:attribute>
         <xsl:if test="@xml:lang">
            <xsl:attribute name="lang">
               <xsl:call-template name="return-lang-applying-language-map">
                  <xsl:with-param name="doclang" select="@xml:lang"/>
               </xsl:call-template>
            </xsl:attribute>
         </xsl:if>
         <xsl:copy-of select="@ch:*"/>
         <xsl:copy-of xmlns:dmp="http://www.arbortext.com/namespace/dmp/dmpmap" select="@dmp:*"/>
         <xsl:if test="@xml:lang">
            <xsl:attribute name="lang">
               <xsl:call-template name="return-lang-applying-language-map">
                  <xsl:with-param name="doclang" select="@xml:lang"/>
               </xsl:call-template>
            </xsl:attribute>
         </xsl:if>
         <xsl:call-template name="maybe-set-id"/>
         <!--Process this element's content-->
         <xsl:apply-templates/>
      </div>
   </xsl:template>

<xsl:template name="__style-for_tel.3adesel252">
      <xsl:text> .x-tel-2-0 {margin-left: 0pt; margin-right: 0pt; text-indent: 0pt; margin-left: 27pt; text-indent: 0pt; }</xsl:text>
   </xsl:template>

<xsl:template match="address/tel[position()&gt;1]" priority="1">
      <div>
         <!--Emit class values to reflect conditions-->
         <xsl:attribute name="class">
            <xsl:text> x-tel-2-0</xsl:text>
         </xsl:attribute>
         <xsl:if test="@xml:lang">
            <xsl:attribute name="lang">
               <xsl:call-template name="return-lang-applying-language-map">
                  <xsl:with-param name="doclang" select="@xml:lang"/>
               </xsl:call-template>
            </xsl:attribute>
         </xsl:if>
         <xsl:copy-of select="@ch:*"/>
         <xsl:copy-of xmlns:dmp="http://www.arbortext.com/namespace/dmp/dmpmap" select="@dmp:*"/>
         <xsl:if test="@xml:lang">
            <xsl:attribute name="lang">
               <xsl:call-template name="return-lang-applying-language-map">
                  <xsl:with-param name="doclang" select="@xml:lang"/>
               </xsl:call-template>
            </xsl:attribute>
         </xsl:if>
         <xsl:call-template name="maybe-set-id"/>
         <!--Process this element's content-->
         <xsl:apply-templates/>
      </div>
   </xsl:template>

<xsl:template name="__style-for_tel.3teel33">
      <xsl:text> .x-tel-3-0 {margin-left: 0pt; margin-right: 0pt; text-indent: 0pt; }</xsl:text>
   </xsl:template>

<xsl:template match="tel" priority="0">
      <div>
         <!--Emit class values to reflect conditions-->
         <xsl:attribute name="class">
            <xsl:text> x-tel-3-0</xsl:text>
         </xsl:attribute>
         <xsl:if test="@xml:lang">
            <xsl:attribute name="lang">
               <xsl:call-template name="return-lang-applying-language-map">
                  <xsl:with-param name="doclang" select="@xml:lang"/>
               </xsl:call-template>
            </xsl:attribute>
         </xsl:if>
         <xsl:copy-of select="@ch:*"/>
         <xsl:copy-of xmlns:dmp="http://www.arbortext.com/namespace/dmp/dmpmap" select="@dmp:*"/>
         <xsl:if test="@xml:lang">
            <xsl:attribute name="lang">
               <xsl:call-template name="return-lang-applying-language-map">
                  <xsl:with-param name="doclang" select="@xml:lang"/>
               </xsl:call-template>
            </xsl:attribute>
         </xsl:if>
         <xsl:call-template name="maybe-set-id"/>
         <!--Process this element's content-->
         <xsl:apply-templates/>
      </div>
   </xsl:template>

<xsl:template match="pgblk/_ufe:temp-rev-title" priority="2">
  <div ch:title="notoc" class=" x--ufe-temp-rev-title-1-0">
    <xsl:call-template name="t-base-div-title"/>
  </div>
</xsl:template>

<xsl:template match="pbfmatr/_ufe:temp-rev-title" priority="1">
  <div ch:title="notoc" class=" x--ufe-temp-rev-title-2-0">
    <xsl:call-template name="t-base-div-title"/>
  </div>
</xsl:template>

<xsl:template match="deflist/term" priority="1">
      <span>
         <!--Emit class values to reflect conditions-->
         <xsl:attribute name="class">
            <xsl:text> x-term-1-0</xsl:text>
         </xsl:attribute>
         <xsl:if test="@xml:lang">
            <xsl:attribute name="lang">
               <xsl:call-template name="return-lang-applying-language-map">
                  <xsl:with-param name="doclang" select="@xml:lang"/>
               </xsl:call-template>
            </xsl:attribute>
         </xsl:if>
         <xsl:copy-of select="@ch:*"/>
         <xsl:copy-of xmlns:dmp="http://www.arbortext.com/namespace/dmp/dmpmap" select="@dmp:*"/>
         <xsl:if test="@xml:lang">
            <xsl:attribute name="lang">
               <xsl:call-template name="return-lang-applying-language-map">
                  <xsl:with-param name="doclang" select="@xml:lang"/>
               </xsl:call-template>
            </xsl:attribute>
         </xsl:if>
         <xsl:call-template name="maybe-set-id"/>
         <!--Process this element's content-->
         <xsl:apply-templates/>
      </span>
   </xsl:template>

<xsl:template name="__style-for_term.2term42">
      <xsl:text> .x-term-2-0 {margin-left: 0pt; margin-right: 0pt; }</xsl:text>
   </xsl:template>

<xsl:template match="term" priority="0">
      <span>
         <!--Emit class values to reflect conditions-->
         <xsl:attribute name="class">
            <xsl:text> x-term-2-0</xsl:text>
         </xsl:attribute>
         <xsl:if test="@xml:lang">
            <xsl:attribute name="lang">
               <xsl:call-template name="return-lang-applying-language-map">
                  <xsl:with-param name="doclang" select="@xml:lang"/>
               </xsl:call-template>
            </xsl:attribute>
         </xsl:if>
         <xsl:copy-of select="@ch:*"/>
         <xsl:copy-of xmlns:dmp="http://www.arbortext.com/namespace/dmp/dmpmap" select="@dmp:*"/>
         <xsl:if test="@xml:lang">
            <xsl:attribute name="lang">
               <xsl:call-template name="return-lang-applying-language-map">
                  <xsl:with-param name="doclang" select="@xml:lang"/>
               </xsl:call-template>
            </xsl:attribute>
         </xsl:if>
         <xsl:call-template name="maybe-set-id"/>
         <!--Process this element's content-->
         <xsl:apply-templates/>
      </span>
   </xsl:template>

<xsl:template match="subpara/subpara/subpara/subpara/subpara/title" priority="72">
  <div ch:title="notoc" class=" x-title-1-0">
    <xsl:call-template name="t-base-div-title"/>
  </div>
</xsl:template>

<xsl:template match="subpara/subpara/subpara/subpara/title" priority="71">
  <div ch:title="notoc" class=" x-title-2-0">
    <xsl:call-template name="t-base-div-title"/>
  </div>
</xsl:template>

<xsl:template match="subpara/subpara/subpara/title" priority="70">
  <div ch:title="notoc" class=" x-title-3-0">
    <xsl:call-template name="t-base-div-title"/>
  </div>
</xsl:template>

<xsl:template match="book[contains(@doctype, 'epc')]/frontmatter//graphic/title" priority="69">
  <div ch:title="notoc" class=" x-title-4-0">
    <xsl:call-template name="t-base-div-title"/>
  </div>
</xsl:template>

<xsl:template match="ata-page-block//task/graphic/title" priority="67">
  <div ch:title="notoc">
	 <xsl:attribute name="class">
		<xsl:text> x-title-6-0</xsl:text>
        <xsl:choose>
          <xsl:when test="&anc-pgblk-0-13; and &anc-task-c;"> x-title-6-1</xsl:when>
          <xsl:when test="&anc-pgblk-0-13; and &anc-task-v;"> x-title-6-2</xsl:when>
          <xsl:when test="&anc-pgblk-0-13;"> x-title-6-3</xsl:when>
          <xsl:when test="&anc-task-c;"> x-title-6-4</xsl:when>
          <xsl:when test="&anc-task-v;"> x-title-6-5</xsl:when>
          <xsl:otherwise> x-title-6-6</xsl:otherwise>
        </xsl:choose>
	 </xsl:attribute>
    <xsl:call-template name="t-base-div-title"/>
  </div>
</xsl:template>

<xsl:template match="page-block//task/graphic/title" priority="66">
  <div ch:title="notoc">
	 <xsl:attribute name="class">
		<xsl:text> x-title-7-0</xsl:text>
        <xsl:choose>
          <xsl:when test="&anc-pgblk-0-13; and &anc-task-c;"> x-title-7-1</xsl:when>
          <xsl:when test="&anc-pgblk-0-13; and &anc-task-v;"> x-title-7-2</xsl:when>
          <xsl:when test="&anc-pgblk-0-13;"> x-title-7-3</xsl:when>
          <xsl:when test="&anc-task-c;"> x-title-7-4</xsl:when>
          <xsl:when test="&anc-task-v;"> x-title-7-5</xsl:when>
          <xsl:otherwise> x-title-7-6</xsl:otherwise>
        </xsl:choose>
	 </xsl:attribute>
    <xsl:call-template name="t-base-div-title"/>
  </div>
</xsl:template>

<xsl:template match="page-block[@pb-name='glossary']/module/title" priority="61">
  <div ch:title="notoc" class=" x-title-7-0">
    <xsl:call-template name="t-base-div-title"/>
  </div>
</xsl:template>

<xsl:template match="page-block[@pb-name='supp_list']/module/title" priority="60">
  <div ch:title="notoc" class=" x-title-8-0">
    <xsl:call-template name="t-base-div-title"/>
  </div>
</xsl:template>

<xsl:template match="mm-fits/subpara/title" priority="62">
  <div ch:title="notoc" class=" x-title-11-0">
    <xsl:call-template name="t-base-div-title"/>
  </div>
</xsl:template>

<xsl:template match="prcitem4/prcitem/title" priority="60">
  <div ch:title="notoc" class=" x-title-10-0">
    <xsl:call-template name="t-base-div-title"/>
  </div>
</xsl:template>

<xsl:template match="prcitem3/prcitem/title" priority="60">
  <div ch:title="notoc" class=" x-title-13-0">
    <xsl:call-template name="t-base-div-title"/>
  </div>
</xsl:template>

<xsl:template match="prcitem2/prcitem/title" priority="59">
  <div ch:title="notoc" class=" x-title-14-0">
    <xsl:call-template name="t-base-div-title"/>
  </div>
</xsl:template>

<xsl:template match="prcitem1/prcitem/title" priority="55">
  <div ch:title="toc" class=" x-title-13-0">
    <xsl:call-template name="t-base-div-title"/>
  </div>
</xsl:template>

<xsl:template match="subpara/subpara/title" priority="57">
  <div ch:title="notoc" class=" x-title-16-0">
    <xsl:call-template name="t-base-div-title"/>
  </div>
</xsl:template>

<xsl:template match="task//table/title" priority="51">
      <xsl:param name="hidden" select="'yes'"/>
      <xsl:variable name="foClass">hidden-block</xsl:variable>
      <xsl:variable name="blockness">block</xsl:variable>
      <xsl:variable name="hiddenness">yes</xsl:variable>
      <xsl:variable name="startnew"/>
      <xsl:variable name="newpageset">#noChange</xsl:variable>
      <div>
         <!--Emit class values to reflect conditions-->
         <xsl:attribute name="class">
            <xsl:text> x-title-22-0</xsl:text>
            <xsl:if test="number(ancestor::pgblk/@pgblknbr)&gt;0 and number(ancestor::pgblk/@pgblknbr)&lt;=13 and ancestor::task/@confltr!='' and ../@display='expand'"> x-title-22-1</xsl:if>
            <xsl:if test="not(number(ancestor::pgblk/@pgblknbr)&gt;0 and number(ancestor::pgblk/@pgblknbr)&lt;=13 and ancestor::task/@confltr!='' and ../@display='expand') and (number(ancestor::pgblk/@pgblknbr)&gt;0 and number(ancestor::pgblk/@pgblknbr)&lt;=13 and ancestor::task/@varnbr!='' and ../@display='expand')"> x-title-22-2</xsl:if>
            <xsl:if test="not(number(ancestor::pgblk/@pgblknbr)&gt;0 and number(ancestor::pgblk/@pgblknbr)&lt;=13 and ancestor::task/@confltr!='' and ../@display='expand') and not(number(ancestor::pgblk/@pgblknbr)&gt;0 and number(ancestor::pgblk/@pgblknbr)&lt;=13 and ancestor::task/@varnbr!='' and ../@display='expand') and (number(ancestor::pgblk/@pgblknbr)&gt;0 and number(ancestor::pgblk/@pgblknbr)&lt;=13 and ../@display='expand')"> x-title-22-3</xsl:if>
            <xsl:if test="not(number(ancestor::pgblk/@pgblknbr)&gt;0 and number(ancestor::pgblk/@pgblknbr)&lt;=13 and ancestor::task/@confltr!='' and ../@display='expand') and not(number(ancestor::pgblk/@pgblknbr)&gt;0 and number(ancestor::pgblk/@pgblknbr)&lt;=13 and ancestor::task/@varnbr!='' and ../@display='expand') and not(number(ancestor::pgblk/@pgblknbr)&gt;0 and number(ancestor::pgblk/@pgblknbr)&lt;=13 and ../@display='expand') and (number(ancestor::pgblk/@pgblknbr)&gt;0 and number(ancestor::pgblk/@pgblknbr)&lt;=13)"> x-title-22-4</xsl:if>
            <xsl:if test="not(number(ancestor::pgblk/@pgblknbr)&gt;0 and number(ancestor::pgblk/@pgblknbr)&lt;=13 and ancestor::task/@confltr!='' and ../@display='expand') and not(number(ancestor::pgblk/@pgblknbr)&gt;0 and number(ancestor::pgblk/@pgblknbr)&lt;=13 and ancestor::task/@varnbr!='' and ../@display='expand') and not(number(ancestor::pgblk/@pgblknbr)&gt;0 and number(ancestor::pgblk/@pgblknbr)&lt;=13 and ../@display='expand') and not(number(ancestor::pgblk/@pgblknbr)&gt;0 and number(ancestor::pgblk/@pgblknbr)&lt;=13) and (ancestor::task/@confltr!='' and ../@display='expand')"> x-title-22-5</xsl:if>
            <xsl:if test="not(number(ancestor::pgblk/@pgblknbr)&gt;0 and number(ancestor::pgblk/@pgblknbr)&lt;=13 and ancestor::task/@confltr!='' and ../@display='expand') and not(number(ancestor::pgblk/@pgblknbr)&gt;0 and number(ancestor::pgblk/@pgblknbr)&lt;=13 and ancestor::task/@varnbr!='' and ../@display='expand') and not(number(ancestor::pgblk/@pgblknbr)&gt;0 and number(ancestor::pgblk/@pgblknbr)&lt;=13 and ../@display='expand') and not(number(ancestor::pgblk/@pgblknbr)&gt;0 and number(ancestor::pgblk/@pgblknbr)&lt;=13) and not(ancestor::task/@confltr!='' and ../@display='expand') and (ancestor::task/@varnbr!='' and ../@display='expand')"> x-title-22-6</xsl:if>
            <xsl:if test="not(number(ancestor::pgblk/@pgblknbr)&gt;0 and number(ancestor::pgblk/@pgblknbr)&lt;=13 and ancestor::task/@confltr!='' and ../@display='expand') and not(number(ancestor::pgblk/@pgblknbr)&gt;0 and number(ancestor::pgblk/@pgblknbr)&lt;=13 and ancestor::task/@varnbr!='' and ../@display='expand') and not(number(ancestor::pgblk/@pgblknbr)&gt;0 and number(ancestor::pgblk/@pgblknbr)&lt;=13 and ../@display='expand') and not(number(ancestor::pgblk/@pgblknbr)&gt;0 and number(ancestor::pgblk/@pgblknbr)&lt;=13) and not(ancestor::task/@confltr!='' and ../@display='expand') and not(ancestor::task/@varnbr!='' and ../@display='expand') and (../@display='expand')"> x-title-22-7</xsl:if>
            <xsl:if test="not(number(ancestor::pgblk/@pgblknbr)&gt;0 and number(ancestor::pgblk/@pgblknbr)&lt;=13 and ancestor::task/@confltr!='' and ../@display='expand') and not(number(ancestor::pgblk/@pgblknbr)&gt;0 and number(ancestor::pgblk/@pgblknbr)&lt;=13 and ancestor::task/@varnbr!='' and ../@display='expand') and not(number(ancestor::pgblk/@pgblknbr)&gt;0 and number(ancestor::pgblk/@pgblknbr)&lt;=13 and ../@display='expand') and not(number(ancestor::pgblk/@pgblknbr)&gt;0 and number(ancestor::pgblk/@pgblknbr)&lt;=13) and not(ancestor::task/@confltr!='' and ../@display='expand') and not(ancestor::task/@varnbr!='' and ../@display='expand') and not(../@display='expand')"> x-title-22-8</xsl:if>
         </xsl:attribute>
         <xsl:if test="@xml:lang">
            <xsl:attribute name="lang">
               <xsl:call-template name="return-lang-applying-language-map">
                  <xsl:with-param name="doclang" select="@xml:lang"/>
               </xsl:call-template>
            </xsl:attribute>
         </xsl:if>
         <xsl:copy-of select="@ch:*"/>
         <xsl:copy-of xmlns:dmp="http://www.arbortext.com/namespace/dmp/dmpmap" select="@dmp:*"/>
         <xsl:variable name="Breaks-chunkFilenameXPath"/>
         <xsl:variable name="Breaks-persistentFilename"/>
         <xsl:if test="($Breaks-persistentFilename='yes') and ($Breaks-chunkFilenameXPath!='')">
            <xsl:variable name="chunkFilename"/>
            <xsl:if test="$chunkFilename!=''">
               <xsl:attribute name="ch:filename">
                  <xsl:value-of select="$chunkFilename"/>
               </xsl:attribute>
               <xsl:attribute name="ch:namepriority">0</xsl:attribute>
            </xsl:if>
         </xsl:if>
         <xsl:if test="@xml:lang">
            <xsl:attribute name="lang">
               <xsl:call-template name="return-lang-applying-language-map">
                  <xsl:with-param name="doclang" select="@xml:lang"/>
               </xsl:call-template>
            </xsl:attribute>
         </xsl:if>
         <xsl:call-template name="maybe-set-id"/>
         <!--Suppress element contents (but not gentext) unless unhidden-->
         <xsl:choose>
            <xsl:when test="$hidden='no'">
               <xsl:apply-templates/>
            </xsl:when>
            <xsl:otherwise>
               <xsl:apply-templates select="_sfe:BeforeOrAfterText"/>
            </xsl:otherwise>
         </xsl:choose>
      </div>
   </xsl:template>

<xsl:template match="page-block//graphic/title" priority="50">
  <div ch:title="notoc">
	 <xsl:attribute name="class">
		<xsl:text> x-title-23-0</xsl:text>
        <xsl:choose>
          <xsl:when test="&anc-pgblk-0-13;"> x-title-23-1</xsl:when>
          <xsl:otherwise> x-title-23-2</xsl:otherwise>
        </xsl:choose>
	 </xsl:attribute>
    <xsl:call-template name="t-base-div-title"/>
  </div>
</xsl:template>

<xsl:template match="ata-page-block//graphic/title" priority="49">
  <div ch:title="notoc">
	 <xsl:attribute name="class">
		<xsl:text> x-title-24-0</xsl:text>
        <xsl:choose>
          <xsl:when test="&anc-pgblk-0-13;"> x-title-24-1</xsl:when>
          <xsl:otherwise> x-title-24-2</xsl:otherwise>
        </xsl:choose>
	 </xsl:attribute>
    <xsl:call-template name="t-base-div-title"/>
  </div>
</xsl:template>

<xsl:template match="page-block//mm-fits/title" priority="47">
  <div ch:title="toc" class=" x-title-23-0">
    <xsl:call-template name="t-base-div-title"/>
  </div>
</xsl:template>

<xsl:template match="ata-page-block//mm-fits/title" priority="46">
  <div ch:title="toc" class=" x-title-24-0">
    <xsl:call-template name="t-base-div-title"/>
  </div>
</xsl:template>

<xsl:template match="ata-page-block//fits-and-clears/title" priority="46">
  <div ch:title="notoc" class=" x-title-27-0">
    <xsl:call-template name="t-base-div-title"/>
  </div>
</xsl:template>

<xsl:template match="page-block//fits-and-clears/title" priority="45">
  <div ch:title="notoc" class=" x-title-28-0">
    <xsl:call-template name="t-base-div-title"/>
  </div>
</xsl:template>

<xsl:template match="ata-page-block//n-para/title" priority="43">
  <div ch:title="toc" class=" x-title-27-0">
    <xsl:call-template name="t-base-div-title"/>
  </div>
</xsl:template>

<xsl:template match="page-block//n-para/title" priority="42">
  <div ch:title="toc" class=" x-title-28-0">
    <xsl:call-template name="t-base-div-title"/>
  </div>
</xsl:template>

<xsl:template match="mfmatr/title" priority="42">
      <xsl:param name="hidden" select="'yes'"/>
      <xsl:if test="$hidden='no'">
         <div>
            <!--Emit class values to reflect conditions-->
            <xsl:attribute name="class">
               <xsl:text> x-title-31-0</xsl:text>
            </xsl:attribute>
            <xsl:if test="@xml:lang">
               <xsl:attribute name="lang">
                  <xsl:call-template name="return-lang-applying-language-map">
                     <xsl:with-param name="doclang" select="@xml:lang"/>
                  </xsl:call-template>
               </xsl:attribute>
            </xsl:if>
            <xsl:copy-of select="@ch:*"/>
            <xsl:copy-of xmlns:dmp="http://www.arbortext.com/namespace/dmp/dmpmap" select="@dmp:*"/>
            <xsl:if test="@xml:lang">
               <xsl:attribute name="lang">
                  <xsl:call-template name="return-lang-applying-language-map">
                     <xsl:with-param name="doclang" select="@xml:lang"/>
                  </xsl:call-template>
               </xsl:attribute>
            </xsl:if>
            <xsl:call-template name="maybe-set-id"/>
            <!--Suppress element contents (but not gentext) unless unhidden-->
            <xsl:choose>
               <xsl:when test="$hidden='no'">
                  <xsl:apply-templates/>
               </xsl:when>
               <xsl:otherwise>
                  <xsl:apply-templates select="_sfe:BeforeOrAfterText"/>
               </xsl:otherwise>
            </xsl:choose>
         </div>
      </xsl:if>
   </xsl:template>

<xsl:template name="__style-for_title.73firele1232">
      <xsl:text> .x-title-32-0 {margin-left: 0pt; margin-right: 0pt; text-indent: 0pt; font-weight: bold; font-size: 14pt; margin-left: 0pt; text-indent: -0pt; } .x-title-32-1 {margin-left: 3em; text-indent: -3em; } .x-title-32-2 {margin-left: 3em; text-indent: -3em; } .x-title-32-3 {margin-left: 3em; text-indent: -3em; } .x-title-32-4 {margin-left: 3em; text-indent: -3em; } .x-title-32-5 {margin-left: 3em; text-indent: -3em; } .x-title-32-6 {margin-left: 3em; text-indent: -3em; } .x-title-32-7 {margin-left: 3em; text-indent: -3em; } .x-title-32-8 {margin-left: 3em; text-indent: -3em; } .x-title-32-9 {margin-left: 3em; text-indent: -3em; } .x-title-32-10 {margin-left: 3em; text-indent: -3em; } .x-title-32-11 {margin-left: 3em; text-indent: -3em; } .x-title-32-12 {margin-left: 3em; text-indent: -3em; } .x-title-32-13 {margin-left: 3em; text-indent: -3em; } .x-title-32-14 {margin-left: 3em; text-indent: -3em; } .x-title-32-15 {margin-left: 3em; text-indent: -3em; } .x-title-32-16 {margin-left: 3em; text-indent: -3em; } .x-title-32-17 {margin-left: 3em; text-indent: -3em; } .x-title-32-18 {margin-left: 3em; text-indent: -3em; } .x-title-32-19 {margin-left: 3em; text-indent: -3em; } .x-title-32-20 {margin-left: 3em; text-indent: -3em; } .x-title-32-21 {margin-left: 3em; text-indent: -3em; } .x-title-32-22 {margin-left: 3em; text-indent: -3em; } .x-title-32-23 {margin-left: 3em; text-indent: -3em; } .x-title-32-24 {margin-left: 3em; text-indent: -3em; } .x-title-32-25 {margin-left: 3em; text-indent: -3em; } .x-title-32-26 {margin-left: 3em; text-indent: -3em; } .x-title-32-27 {margin-left: 3em; text-indent: -3em; } .x-title-32-28 {margin-left: 3em; text-indent: -3em; } .x-title-32-29 {margin-left: 3em; text-indent: -3em; } .x-title-32-30 {margin-left: 3em; text-indent: -3em; } .x-title-32-31 {margin-left: 3em; text-indent: -3em; } .x-title-32-32 {margin-left: 3em; text-indent: -3em; } .x-title-32-33 {margin-left: 3em; text-indent: -3em; } .x-title-32-34 {margin-left: 3em; text-indent: -3em; } .x-title-32-35 {margin-left: 3em; text-indent: -3em; } .x-title-32-36 {margin-left: 3em; text-indent: -3em; }</xsl:text>
   </xsl:template>

<xsl:template match="figure/title" priority="41">
  <div ch:title="notoc">
	 <xsl:attribute name="class">
		<xsl:text> x-title-32-0</xsl:text>
        <xsl:choose>
          <xsl:when test="&pb-01-ata;"> x-title-32-1</xsl:when>
          <xsl:when test="&pb-01-p;"> x-title-32-2</xsl:when>
          <xsl:when test="&pb-02-ata;"> x-title-32-3</xsl:when>
          <xsl:when test="&pb-02-p;"> x-title-32-4</xsl:when>
          <xsl:when test="&pb-03-ata;"> x-title-32-5</xsl:when>
          <xsl:when test="&pb-03-p;"> x-title-32-6</xsl:when>
          <xsl:when test="&pb-04-ata;"> x-title-32-7</xsl:when>
          <xsl:when test="&pb-04-p;"> x-title-32-8</xsl:when>
          <xsl:when test="&pb-05-ata;"> x-title-32-9</xsl:when>
          <xsl:when test="&pb-05-p;"> x-title-32-10</xsl:when>
          <xsl:when test="&pb-06-ata;"> x-title-32-11</xsl:when>
          <xsl:when test="&pb-06-p;"> x-title-32-12</xsl:when>
          <xsl:when test="&pb-07-ata;"> x-title-32-13</xsl:when>
          <xsl:when test="&pb-07-p;"> x-title-32-14</xsl:when>
          <xsl:when test="&pb-08-ata;"> x-title-32-15</xsl:when>
          <xsl:when test="&pb-08-p;"> x-title-32-16</xsl:when>
          <xsl:when test="&pb-09-ata;"> x-title-32-17</xsl:when>
          <xsl:when test="&pb-09-p;"> x-title-32-18</xsl:when>
          <xsl:when test="&pb-10-ata;"> x-title-32-19</xsl:when>
          <xsl:when test="&pb-10-p;"> x-title-32-20</xsl:when>
          <xsl:when test="&pb-11-ata;"> x-title-32-21</xsl:when>
          <xsl:when test="&pb-11-p;"> x-title-32-22</xsl:when>
          <xsl:when test="&pb-12-ata;"> x-title-32-23</xsl:when>
          <xsl:when test="&pb-12-p;"> x-title-32-24</xsl:when>
          <xsl:when test="&pb-13-ata;"> x-title-32-25</xsl:when>
          <xsl:when test="&pb-13-p;"> x-title-32-26</xsl:when>
          <xsl:when test="&pb-14-ata;"> x-title-32-27</xsl:when>
          <xsl:when test="&pb-14-p;"> x-title-32-28</xsl:when>
          <xsl:when test="&pb-15-ata;"> x-title-32-29</xsl:when>
          <xsl:when test="&pb-15-p;"> x-title-32-30</xsl:when>
          <xsl:when test="&pb-16-ata;"> x-title-32-31</xsl:when>
          <xsl:when test="&pb-16-p;"> x-title-32-32</xsl:when>
          <xsl:when test="&pb-17-ata;"> x-title-32-33</xsl:when>
          <xsl:when test="&pb-17-p;"> x-title-32-34</xsl:when>
          <xsl:when test="&pb-18-ata;"> x-title-32-35</xsl:when>
          <xsl:when test="&pb-18-p;"> x-title-32-36</xsl:when>
        </xsl:choose>
	 </xsl:attribute>
    <xsl:call-template name="t-base-div-title"/>
  </div>
</xsl:template>

<xsl:template match="subpara/title" priority="38">
  <div ch:title="notoc" class=" x-title-35-0">
    <xsl:call-template name="t-base-div-title"/>
  </div>
</xsl:template>

<xsl:template match="procedure/title" priority="37">
  <div ch:title="notoc">
	 <xsl:attribute name="class">
		<xsl:text> x-title-36-0</xsl:text>
		<xsl:if test="(ancestor-or-self::table[1]/@role and string(ancestor-or-self::table[1]/@role)='torque-and-stretch') or (ancestor-or-self::table[1]/@role and string(ancestor-or-self::table[1]/@role)='spec-assem')"> x-title-36-1</xsl:if>
	 </xsl:attribute>
    <xsl:call-template name="t-base-div-title"/>
  </div>
</xsl:template>

<xsl:template match="taskproc/title" priority="34">
  <div ch:title="notoc" class=" x-title-39-0">
    <xsl:call-template name="t-base-div-title"/>
  </div>
</xsl:template>

<xsl:template match="nutopt/title" priority="32">
  <div ch:title="notoc" class=" x-title-39-0">
    <xsl:call-template name="t-base-div-title"/>
  </div>
</xsl:template>

<xsl:template match="pwcchapsect-item/title" priority="28">
  <div ch:title="notoc" class=" x-title-45-0">
    <xsl:call-template name="t-base-div-title"/>
  </div>
</xsl:template>

<xsl:template match="tprereq/title" priority="27">
  <div ch:title="notoc" class=" x-title-46-0">
    <xsl:call-template name="t-base-div-title"/>
  </div>
</xsl:template>

<xsl:template match="subtask/title" priority="26">
  <div ch:title="notoc" class=" x-title-47-0">
    <xsl:call-template name="t-base-div-title"/>
  </div>
</xsl:template>

<xsl:template match="fits/title" priority="25">
  <div ch:title="toc" class=" x-title-48-0">
    <xsl:call-template name="t-base-div-title"/>
  </div>
</xsl:template>

<xsl:template match="task/title" priority="24">
  <div ch:title="toc" class=" x-title-47-0">
    <xsl:call-template name="t-base-div-title"/>
  </div>
</xsl:template>

<xsl:template match="howtouse/title" priority="23">
      <xsl:param name="hidden" select="'yes'"/>
      <xsl:if test="$hidden='no'">
         <div>
            <!--Emit class values to reflect conditions-->
            <xsl:attribute name="class">
               <xsl:text> x-title-50-0</xsl:text>
            </xsl:attribute>
            <xsl:if test="@xml:lang">
               <xsl:attribute name="lang">
                  <xsl:call-template name="return-lang-applying-language-map">
                     <xsl:with-param name="doclang" select="@xml:lang"/>
                  </xsl:call-template>
               </xsl:attribute>
            </xsl:if>
            <xsl:copy-of select="@ch:*"/>
            <xsl:copy-of xmlns:dmp="http://www.arbortext.com/namespace/dmp/dmpmap" select="@dmp:*"/>
            <xsl:if test="@xml:lang">
               <xsl:attribute name="lang">
                  <xsl:call-template name="return-lang-applying-language-map">
                     <xsl:with-param name="doclang" select="@xml:lang"/>
                  </xsl:call-template>
               </xsl:attribute>
            </xsl:if>
            <xsl:call-template name="maybe-set-id"/>
            <!--Suppress element contents (but not gentext) unless unhidden-->
            <xsl:choose>
               <xsl:when test="$hidden='no'">
                  <xsl:apply-templates/>
               </xsl:when>
               <xsl:otherwise>
                  <xsl:apply-templates select="_sfe:BeforeOrAfterText"/>
               </xsl:otherwise>
            </xsl:choose>
         </div>
      </xsl:if>
   </xsl:template>

<xsl:template name="__style-for_title.73hilile1651">
      <xsl:text> .x-title-51-0 {margin-left: 0pt; margin-right: 0pt; text-indent: 0pt; font-weight: bold; font-size: 14pt; margin-left: 0pt; text-indent: 0pt; }</xsl:text>
   </xsl:template>

<xsl:template match="highlights/title" priority="22">
  <div ch:title="toc" class=" x-title-51-0">
    <xsl:call-template name="t-base-div-title"/>
  </div>
</xsl:template>

<xsl:template match="lot-item/title" priority="20">
  <div ch:title="notoc" class=" x-title-53-0">
    <xsl:call-template name="t-base-div-title"/>
  </div>
</xsl:template>

<xsl:template match="lot/title" priority="19">
  <div ch:title="toc" class=" x-title-54-0">
    <xsl:call-template name="t-base-div-title"/>
  </div>
</xsl:template>

<xsl:template match="table//procedure//title" priority="17">
  <div ch:title="notoc" class=" x-title-56-0">
    <xsl:call-template name="t-base-div-title"/>
  </div>
</xsl:template>

<xsl:template match="torque-and-stretch/title" priority="16">
  <div ch:title="notoc" class=" x-title-57-0">
    <xsl:call-template name="t-base-div-title"/>
  </div>
</xsl:template>

<xsl:template match="spec-tool-table/title" priority="15">
  <div ch:title="notoc" class=" x-title-58-0">
    <xsl:call-template name="t-base-div-title"/>
  </div>
</xsl:template>

<xsl:template match="subject/title" priority="13">
  <div ch:title="toc" class=" x-title-60-0">
    <xsl:call-template name="t-base-div-title"/>
  </div>
</xsl:template>

<xsl:template match="section/title" priority="12">
  <div ch:title="toc" class=" x-title-61-0">
    <xsl:call-template name="t-base-div-title"/>
  </div>
</xsl:template>

<xsl:template match="page-block/title" priority="11">
  <div ch:title="notoc" class=" x-title-62-0">
    <xsl:call-template name="t-base-div-title"/>
  </div>
</xsl:template>

<xsl:template match="frontmatter/title" priority="8">
  <div ch:title="toc" class=" x-title-65-0">
    <xsl:call-template name="t-base-div-title"/>
  </div>
</xsl:template>

<xsl:template match="table[@display='expand']/title" priority="6">
  <div ch:title="notoc">
	 <xsl:attribute name="class">
		<xsl:text> x-title-67-0</xsl:text>
        <xsl:if test="(&anc-doc-cir-em-tmm;)"> x-title-67-1</xsl:if>
        <xsl:choose>
          <xsl:when test="(&anc-doc-cir-em-tmm;) and (&anc-pgblk-0-13;)"> x-title-67-2</xsl:when>
          <xsl:when test="(&anc-doc-cir-em-tmm;)"> x-title-67-3</xsl:when>
          <xsl:when test="&pb-01-ata;"> x-title-67-4</xsl:when>
          <xsl:when test="&pb-01-p;"> x-title-67-5</xsl:when>
          <xsl:when test="&pb-02-ata;"> x-title-67-6</xsl:when>
          <xsl:when test="&pb-02-p;"> x-title-67-7</xsl:when>
          <xsl:when test="&pb-03-ata;"> x-title-67-8</xsl:when>
          <xsl:when test="&pb-03-p;"> x-title-67-9</xsl:when>
          <xsl:when test="&pb-04-ata;"> x-title-67-10</xsl:when>
          <xsl:when test="&pb-04-p;"> x-title-67-11</xsl:when>
          <xsl:when test="&pb-05-ata;"> x-title-67-12</xsl:when>
          <xsl:when test="&pb-05-p;"> x-title-67-13</xsl:when>
          <xsl:when test="&pb-06-ata;"> x-title-67-14</xsl:when>
          <xsl:when test="&pb-06-p;"> x-title-67-15</xsl:when>
          <xsl:when test="&pb-07-ata;"> x-title-67-16</xsl:when>
          <xsl:when test="&pb-07-p;"> x-title-67-17</xsl:when>
          <xsl:when test="&pb-08-ata;"> x-title-67-18</xsl:when>
          <xsl:when test="&pb-08-p;"> x-title-67-19</xsl:when>
          <xsl:when test="&pb-09-ata;"> x-title-67-20</xsl:when>
          <xsl:when test="&pb-09-p;"> x-title-67-21</xsl:when>
          <xsl:when test="&pb-10-ata;"> x-title-67-22</xsl:when>
          <xsl:when test="&pb-10-p;"> x-title-67-23</xsl:when>
          <!--
          <xsl:when test="&pb-11-ata;"> x-title-67-</xsl:when>
          <xsl:when test="&pb-11-p;"> x-title-67-</xsl:when>
          -->
          <xsl:when test="&pb-12-ata;"> x-title-67-24</xsl:when>
          <xsl:when test="&pb-12-p;"> x-title-67-25</xsl:when>
          <xsl:when test="&pb-13-ata;"> x-title-67-26</xsl:when>
          <xsl:when test="&pb-13-p;"> x-title-67-27</xsl:when>
          <xsl:when test="&pb-14-ata;"> x-title-67-28</xsl:when>
          <xsl:when test="&pb-14-p;"> x-title-67-29</xsl:when>
          <xsl:when test="&pb-15-ata;"> x-title-67-30</xsl:when>
          <xsl:when test="&pb-15-p;"> x-title-67-31</xsl:when>
          <xsl:when test="&pb-16-ata;"> x-title-67-32</xsl:when>
          <xsl:when test="&pb-16-p;"> x-title-67-33</xsl:when>
          <xsl:when test="&pb-17-ata;"> x-title-67-34</xsl:when>
          <xsl:when test="&pb-17-p;"> x-title-67-35</xsl:when>
          <xsl:when test="&pb-18-ata;"> x-title-67-36</xsl:when>
          <xsl:when test="&pb-18-p;"> x-title-67-37</xsl:when>
        </xsl:choose>
	 </xsl:attribute>
    <xsl:call-template name="t-base-div-title"/>
  </div>
</xsl:template>

<xsl:template match="table/title" priority="5">
      <xsl:param name="hidden" select="'yes'"/>
      <xsl:variable name="foClass">hidden-block</xsl:variable>
      <xsl:variable name="blockness">block</xsl:variable>
      <xsl:variable name="hiddenness">yes</xsl:variable>
      <xsl:variable name="startnew"/>
      <xsl:variable name="newpageset">#noChange</xsl:variable>
      <div>
         <xsl:attribute name="class">
            <xsl:text> x-title-68-0</xsl:text>
        <xsl:if test="(&anc-doc-cir-em-tmm;)"> x-title-68-1</xsl:if>
        <xsl:choose>
          <xsl:when test="(&anc-doc-cir-em-tmm;) and (&anc-pgblk-0-13;)"> x-title-68-2</xsl:when>
          <xsl:when test="(&anc-doc-cir-em-tmm;)"> x-title-68-3</xsl:when>
          <xsl:when test="&pb-01-ata;"> x-title-68-4</xsl:when>
          <xsl:when test="&pb-01-p;"> x-title-68-5</xsl:when>
          <xsl:when test="&pb-02-ata;"> x-title-68-6</xsl:when>
          <xsl:when test="&pb-02-p;"> x-title-68-7</xsl:when>
          <xsl:when test="&pb-03-ata;"> x-title-68-8</xsl:when>
          <xsl:when test="&pb-03-p;"> x-title-68-9</xsl:when>
          <xsl:when test="&pb-04-ata;"> x-title-68-10</xsl:when>
          <xsl:when test="&pb-04-p;"> x-title-68-11</xsl:when>
          <xsl:when test="&pb-05-ata;"> x-title-68-12</xsl:when>
          <xsl:when test="&pb-05-p;"> x-title-68-13</xsl:when>
          <xsl:when test="&pb-06-ata;"> x-title-68-14</xsl:when>
          <xsl:when test="&pb-06-p;"> x-title-68-15</xsl:when>
          <xsl:when test="&pb-07-ata;"> x-title-68-16</xsl:when>
          <xsl:when test="&pb-07-p;"> x-title-68-17</xsl:when>
          <xsl:when test="&pb-08-ata;"> x-title-68-18</xsl:when>
          <xsl:when test="&pb-08-p;"> x-title-68-19</xsl:when>
          <xsl:when test="&pb-09-ata;"> x-title-68-20</xsl:when>
          <xsl:when test="&pb-09-p;"> x-title-68-21</xsl:when>
          <xsl:when test="&pb-10-ata;"> x-title-68-22</xsl:when>
          <xsl:when test="&pb-10-p;"> x-title-68-23</xsl:when>
          <xsl:when test="&pb-11-ata;"> x-title-68-24</xsl:when>
          <xsl:when test="&pb-11-p;"> x-title-68-25</xsl:when>
          <xsl:when test="&pb-12-ata;"> x-title-68-26</xsl:when>
          <xsl:when test="&pb-12-p;"> x-title-68-27</xsl:when>
          <xsl:when test="&pb-13-ata;"> x-title-68-28</xsl:when>
          <xsl:when test="&pb-13-p;"> x-title-68-29</xsl:when>
          <xsl:when test="&pb-14-ata;"> x-title-68-30</xsl:when>
          <xsl:when test="&pb-14-p;"> x-title-68-31</xsl:when>
          <xsl:when test="&pb-15-ata;"> x-title-68-32</xsl:when>
          <xsl:when test="&pb-15-p;"> x-title-68-33</xsl:when>
          <xsl:when test="&pb-16-ata;"> x-title-68-34</xsl:when>
          <xsl:when test="&pb-16-p;"> x-title-68-35</xsl:when>
          <xsl:when test="&pb-17-ata;"> x-title-68-36</xsl:when>
          <xsl:when test="&pb-17-p;"> x-title-68-37</xsl:when>
          <xsl:when test="&pb-18-ata;"> x-title-68-38</xsl:when>
          <xsl:when test="&pb-18-p;"> x-title-68-39</xsl:when>
        </xsl:choose>
         </xsl:attribute>
         <xsl:if test="@xml:lang">
            <xsl:attribute name="lang">
               <xsl:call-template name="return-lang-applying-language-map">
                  <xsl:with-param name="doclang" select="@xml:lang"/>
               </xsl:call-template>
            </xsl:attribute>
         </xsl:if>
         <xsl:copy-of select="@ch:*"/>
         <xsl:copy-of xmlns:dmp="http://www.arbortext.com/namespace/dmp/dmpmap" select="@dmp:*"/>
         <xsl:variable name="Breaks-chunkFilenameXPath"/>
         <xsl:variable name="Breaks-persistentFilename"/>
         <xsl:if test="($Breaks-persistentFilename='yes') and ($Breaks-chunkFilenameXPath!='')">
            <xsl:variable name="chunkFilename"/>
            <xsl:if test="$chunkFilename!=''">
               <xsl:attribute name="ch:filename">
                  <xsl:value-of select="$chunkFilename"/>
               </xsl:attribute>
               <xsl:attribute name="ch:namepriority">0</xsl:attribute>
            </xsl:if>
         </xsl:if>
         <xsl:if test="@xml:lang">
            <xsl:attribute name="lang">
               <xsl:call-template name="return-lang-applying-language-map">
                  <xsl:with-param name="doclang" select="@xml:lang"/>
               </xsl:call-template>
            </xsl:attribute>
         </xsl:if>
         <xsl:call-template name="maybe-set-id"/>
         <!--Suppress element contents (but not gentext) unless unhidden-->
         <xsl:choose>
            <xsl:when test="$hidden='no'">
               <xsl:apply-templates/>
            </xsl:when>
            <xsl:otherwise>
               <xsl:apply-templates select="_sfe:BeforeOrAfterText"/>
            </xsl:otherwise>
         </xsl:choose>
      </div>
   </xsl:template>

<xsl:template match="chapter/title" priority="4">
  <div ch:title="toc" class=" x-title-69-0">
    <xsl:call-template name="t-base-div-title"/>
  </div>
</xsl:template>

<xsl:template match="book/title" priority="3">
  <div ch:title="notoc" class=" x-title-70-0">
    <xsl:call-template name="t-base-div-title"/>
  </div>
</xsl:template>

<xsl:template match="ata-page-block/title" priority="2">
  <div ch:title="notoc" class=" x-title-71-0">
    <xsl:call-template name="t-base-div-title"/>
  </div>
</xsl:template>

<xsl:template match="title-page/title" priority="1">
  <div ch:title="notoc" class=" x-title-72-0">
    <xsl:call-template name="t-base-div-title"/>
  </div>
</xsl:template>

<xsl:template match="title" priority="0">
  <div ch:title="notoc">
	 <xsl:attribute name="class">
		<xsl:text> x-title-73-0</xsl:text>
		<xsl:if test="parent::list"> x-title-73-1</xsl:if>
	 </xsl:attribute>
    <xsl:call-template name="t-base-div-title"/>
  </div>
</xsl:template>

<xsl:template name="__style-for__ufe-title-block.1">
      <xsl:text> .x--ufe-title-block-1-0 {margin-left: 0pt; margin-right: 0pt; text-indent: 0pt; font-weight: normal; font-size: 16pt; margin-top: 12pt; margin-bottom: 12pt; }</xsl:text>
   </xsl:template>

<xsl:template match="_ufe:title-block" priority="0">
      <div>
         <!--Emit class values to reflect conditions-->
         <xsl:attribute name="class">
            <xsl:text> x--ufe-title-block-1-0</xsl:text>
         </xsl:attribute>
         <xsl:if test="@xml:lang">
            <xsl:attribute name="lang">
               <xsl:call-template name="return-lang-applying-language-map">
                  <xsl:with-param name="doclang" select="@xml:lang"/>
               </xsl:call-template>
            </xsl:attribute>
         </xsl:if>
         <xsl:copy-of select="@ch:*"/>
         <xsl:copy-of xmlns:dmp="http://www.arbortext.com/namespace/dmp/dmpmap" select="@dmp:*"/>
         <xsl:if test="@xml:lang">
            <xsl:attribute name="lang">
               <xsl:call-template name="return-lang-applying-language-map">
                  <xsl:with-param name="doclang" select="@xml:lang"/>
               </xsl:call-template>
            </xsl:attribute>
         </xsl:if>
         <xsl:call-template name="maybe-set-id"/>
         <!--Process this element's content-->
         <xsl:apply-templates/>
      </div>
   </xsl:template>

<xsl:template name="__style-for_title-page.1">
      <xsl:text> .x-title-page-1-0
{margin-left: 0pt; margin-right: 0pt; text-indent: 0pt; margin-top:
8pt; }</xsl:text>
   </xsl:template>

<xsl:template match="title-page" priority="0">
  <div class=" x-title-page-1-0">
     <xsl:copy-of select="@ch:*"/>
     <xsl:attribute name="ch:filename"><xsl:value-of select="name()"/></xsl:attribute>
     <xsl:attribute name="ch:namepriority">0</xsl:attribute>
     <xsl:call-template name="maybe-set-id">
        <xsl:with-param name="only-if-id-attr" select="'no'"/>
     </xsl:call-template>
     <div id="pwcbannerinfo" style="display:none">
        <div id="manualTitle"><xsl:value-of select="ancestor::module/title-page/manual-title"/></div>
        <div id="engine">
           <xsl:for-each select="ancestor::module/title-page/model/*[not(self::para)]">
              <xsl:value-of select="self::node()"/>
           </xsl:for-each>
        </div>
        <div id="manualPn"><xsl:value-of select="ancestor::module/title-page/manual-pn"/></div>
        <div id="pointRev"><xsl:value-of select="ancestor::book/@point-revnbr"/></div>
        <div id="revision"><xsl:value-of select="ancestor::book/@revnbr"/></div>
        <div id="revDate" ><xsl:value-of select="ancestor::book/@revdate"/></div>
     </div>
     <xsl:apply-templates/>
  </div>
</xsl:template>

<xsl:template match="pgblk/_ufe:tmm-title" priority="2">
  <div ch:title="notoc" class=" x--ufe-tmm-title-1-0">
    <xsl:call-template name="t-base-div-title"/>
  </div>
</xsl:template>

<xsl:template match="pbfmatr/_ufe:tmm-title" priority="1">
  <div ch:title="notoc" class=" x--ufe-tmm-title-2-0">
    <xsl:call-template name="t-base-div-title"/>
  </div>
</xsl:template>

<xsl:template match="toc" priority="0">
  <xsl:apply-templates/>
</xsl:template>

<xsl:template match="tool" priority="0">
      <span>
         <!--Emit class values to reflect conditions-->
         <xsl:attribute name="class">
            <xsl:text> x-tool-1-0</xsl:text>
         </xsl:attribute>
         <xsl:if test="@xml:lang">
            <xsl:attribute name="lang">
               <xsl:call-template name="return-lang-applying-language-map">
                  <xsl:with-param name="doclang" select="@xml:lang"/>
               </xsl:call-template>
            </xsl:attribute>
         </xsl:if>
         <xsl:copy-of select="@ch:*"/>
         <xsl:copy-of xmlns:dmp="http://www.arbortext.com/namespace/dmp/dmpmap" select="@dmp:*"/>
         <xsl:if test="@xml:lang">
            <xsl:attribute name="lang">
               <xsl:call-template name="return-lang-applying-language-map">
                  <xsl:with-param name="doclang" select="@xml:lang"/>
               </xsl:call-template>
            </xsl:attribute>
         </xsl:if>
         <xsl:call-template name="maybe-set-id"/>
         <!--Process this element's content-->
         <xsl:apply-templates/>
      </span>
   </xsl:template>

<xsl:template name="__style-for_toolname.1">
      <xsl:text> .x-toolname-1-0 {margin-left: 0pt; margin-right: 0pt; }</xsl:text>
   </xsl:template>

<xsl:template match="toolname" priority="0">
      <span>
         <!--Emit class values to reflect conditions-->
         <xsl:attribute name="class">
            <xsl:text> x-toolname-1-0</xsl:text>
         </xsl:attribute>
         <xsl:if test="@xml:lang">
            <xsl:attribute name="lang">
               <xsl:call-template name="return-lang-applying-language-map">
                  <xsl:with-param name="doclang" select="@xml:lang"/>
               </xsl:call-template>
            </xsl:attribute>
         </xsl:if>
         <xsl:copy-of select="@ch:*"/>
         <xsl:copy-of xmlns:dmp="http://www.arbortext.com/namespace/dmp/dmpmap" select="@dmp:*"/>
         <xsl:if test="@xml:lang">
            <xsl:attribute name="lang">
               <xsl:call-template name="return-lang-applying-language-map">
                  <xsl:with-param name="doclang" select="@xml:lang"/>
               </xsl:call-template>
            </xsl:attribute>
         </xsl:if>
         <xsl:call-template name="maybe-set-id"/>
         <!--Process this element's content-->
         <xsl:apply-templates/>
      </span>
   </xsl:template>

<xsl:template name="__style-for_toolnbr.1">
      <xsl:text> .x-toolnbr-1-0 {margin-left: 0pt; margin-right: 0pt; }</xsl:text>
   </xsl:template>

<xsl:template match="toolnbr" priority="0">
      <span>
         <!--Emit class values to reflect conditions-->
         <xsl:attribute name="class">
            <xsl:text> x-toolnbr-1-0</xsl:text>
         </xsl:attribute>
         <xsl:if test="@xml:lang">
            <xsl:attribute name="lang">
               <xsl:call-template name="return-lang-applying-language-map">
                  <xsl:with-param name="doclang" select="@xml:lang"/>
               </xsl:call-template>
            </xsl:attribute>
         </xsl:if>
         <xsl:copy-of select="@ch:*"/>
         <xsl:copy-of xmlns:dmp="http://www.arbortext.com/namespace/dmp/dmpmap" select="@dmp:*"/>
         <xsl:if test="@xml:lang">
            <xsl:attribute name="lang">
               <xsl:call-template name="return-lang-applying-language-map">
                  <xsl:with-param name="doclang" select="@xml:lang"/>
               </xsl:call-template>
            </xsl:attribute>
         </xsl:if>
         <xsl:call-template name="maybe-set-id"/>
         <!--Process this element's content-->
         <xsl:apply-templates/>
      </span>
   </xsl:template>

<xsl:template name="__style-for_trbody.1">
      <xsl:text> .x-trbody-1-0 {margin-left: 0pt; margin-right: 0pt; }</xsl:text>
   </xsl:template>

<xsl:template match="trbody" priority="0">
      <!--Emit a nostyle template-->
      <xsl:apply-templates/>
   </xsl:template>

<xsl:template name="__style-for_trfignum.1">
      <xsl:text> .x-trfignum-1-0 {margin-left: 0pt; margin-right: 0pt; }</xsl:text>
   </xsl:template>

<xsl:template match="trfignum" priority="0">
      <!--Emit a nostyle template-->
      <xsl:apply-templates/>
   </xsl:template>

<xsl:template name="__style-for_trfmatr.1">
      <xsl:text> .x-trfmatr-1-0 {margin-left: 0pt; margin-right: 0pt; }</xsl:text>
   </xsl:template>

<xsl:template match="trfmatr" priority="0">
      <!--Emit a nostyle template-->
      <xsl:apply-templates/>
   </xsl:template>

<xsl:template name="__style-for_trreason.1">
      <xsl:text> .x-trreason-1-0 {margin-left: 0pt; margin-right: 0pt; }</xsl:text>
   </xsl:template>

<xsl:template match="trreason" priority="0">
      <!--Emit a nostyle template-->
      <xsl:apply-templates/>
   </xsl:template>

<xsl:template name="__style-for_trsupdata.1">
      <xsl:text> .x-trsupdata-1-0 {margin-left: 0pt; margin-right: 0pt; }</xsl:text>
   </xsl:template>

<xsl:template match="trsupdata" priority="0">
      <!--Emit a nostyle template-->
      <xsl:apply-templates/>
   </xsl:template>

<xsl:template name="__style-for_trtblnum.1">
      <xsl:text> .x-trtblnum-1-0 {margin-left: 0pt; margin-right: 0pt; }</xsl:text>
   </xsl:template>

<xsl:template match="trtblnum" priority="0">
      <!--Emit a nostyle template-->
      <xsl:apply-templates/>
   </xsl:template>

<xsl:template name="__style-for_trxref.1">
      <xsl:text> .x-trxref-1-0 {margin-left: 0pt; margin-right: 0pt; }</xsl:text>
   </xsl:template>

<xsl:template match="trxref" priority="0">
      <!--Emit a nostyle template-->
      <xsl:apply-templates/>
   </xsl:template>

<xsl:template name="__style-for_type.2tie-pe151">
      <xsl:text> .x-type-1-0 {margin-left: 0pt; margin-right: 0pt; text-indent: 0pt; font-size: 18pt; text-align: center; margin-bottom: 12pt; }</xsl:text>
   </xsl:template>

<xsl:template match="title-page/type" priority="1">
      <div>
         <!--Emit class values to reflect conditions-->
         <xsl:attribute name="class">
            <xsl:text> x-type-1-0</xsl:text>
         </xsl:attribute>
         <xsl:if test="@xml:lang">
            <xsl:attribute name="lang">
               <xsl:call-template name="return-lang-applying-language-map">
                  <xsl:with-param name="doclang" select="@xml:lang"/>
               </xsl:call-template>
            </xsl:attribute>
         </xsl:if>
         <xsl:copy-of select="@ch:*"/>
         <xsl:copy-of xmlns:dmp="http://www.arbortext.com/namespace/dmp/dmpmap" select="@dmp:*"/>
         <xsl:if test="@xml:lang">
            <xsl:attribute name="lang">
               <xsl:call-template name="return-lang-applying-language-map">
                  <xsl:with-param name="doclang" select="@xml:lang"/>
               </xsl:call-template>
            </xsl:attribute>
         </xsl:if>
         <xsl:call-template name="maybe-set-id"/>
         <!--Process this element's content-->
         <xsl:apply-templates/>
      </div>
   </xsl:template>

<xsl:template name="__style-for_type.2type42">
      <xsl:text> .x-type-2-0 {margin-left: 0pt; margin-right: 0pt; text-indent: 0pt; }</xsl:text>
   </xsl:template>

<xsl:template match="type" priority="0">
      <div>
         <!--Emit class values to reflect conditions-->
         <xsl:attribute name="class">
            <xsl:text> x-type-2-0</xsl:text>
         </xsl:attribute>
         <xsl:if test="@xml:lang">
            <xsl:attribute name="lang">
               <xsl:call-template name="return-lang-applying-language-map">
                  <xsl:with-param name="doclang" select="@xml:lang"/>
               </xsl:call-template>
            </xsl:attribute>
         </xsl:if>
         <xsl:copy-of select="@ch:*"/>
         <xsl:copy-of xmlns:dmp="http://www.arbortext.com/namespace/dmp/dmpmap" select="@dmp:*"/>
         <xsl:if test="@xml:lang">
            <xsl:attribute name="lang">
               <xsl:call-template name="return-lang-applying-language-map">
                  <xsl:with-param name="doclang" select="@xml:lang"/>
               </xsl:call-template>
            </xsl:attribute>
         </xsl:if>
         <xsl:call-template name="maybe-set-id"/>
         <!--Process this element's content-->
         <xsl:apply-templates/>
      </div>
   </xsl:template>

<xsl:template name="__style-for_unlist.8prtest231">
      <xsl:text> .x-unlist-1-0 {margin-left: 0pt; margin-right: 0pt; text-indent: 0pt; margin-top: 8pt; margin-left: 22pt; text-indent: 0pt; }</xsl:text>
   </xsl:template>

<xsl:template match="prcitem3/prcitem/unlist" priority="7">
      <div>
         <!--Emit class values to reflect conditions-->
         <xsl:attribute name="class">
            <xsl:text> x-unlist-1-0</xsl:text>
         </xsl:attribute>
         <xsl:if test="@xml:lang">
            <xsl:attribute name="lang">
               <xsl:call-template name="return-lang-applying-language-map">
                  <xsl:with-param name="doclang" select="@xml:lang"/>
               </xsl:call-template>
            </xsl:attribute>
         </xsl:if>
         <xsl:copy-of select="@ch:*"/>
         <xsl:copy-of xmlns:dmp="http://www.arbortext.com/namespace/dmp/dmpmap" select="@dmp:*"/>
         <xsl:if test="@xml:lang">
            <xsl:attribute name="lang">
               <xsl:call-template name="return-lang-applying-language-map">
                  <xsl:with-param name="doclang" select="@xml:lang"/>
               </xsl:call-template>
            </xsl:attribute>
         </xsl:if>
         <xsl:call-template name="maybe-set-id"/>
         <!--Process this element's content-->
         <xsl:apply-templates/>
      </div>
   </xsl:template>

<xsl:template name="__style-for_unlist.8tprest142">
      <xsl:text> .x-unlist-2-0 {margin-left: 0pt; margin-right: 0pt; text-indent: 0pt; margin-top: 8pt; font-size: 9pt; margin-left: 38pt; text-indent: 0pt; }</xsl:text>
   </xsl:template>

<xsl:template match="tprereq/unlist" priority="6">
      <div>
         <!--Emit class values to reflect conditions-->
         <xsl:attribute name="class">
            <xsl:text> x-unlist-2-0</xsl:text>
         </xsl:attribute>
         <xsl:if test="@xml:lang">
            <xsl:attribute name="lang">
               <xsl:call-template name="return-lang-applying-language-map">
                  <xsl:with-param name="doclang" select="@xml:lang"/>
               </xsl:call-template>
            </xsl:attribute>
         </xsl:if>
         <xsl:copy-of select="@ch:*"/>
         <xsl:copy-of xmlns:dmp="http://www.arbortext.com/namespace/dmp/dmpmap" select="@dmp:*"/>
         <xsl:if test="@xml:lang">
            <xsl:attribute name="lang">
               <xsl:call-template name="return-lang-applying-language-map">
                  <xsl:with-param name="doclang" select="@xml:lang"/>
               </xsl:call-template>
            </xsl:attribute>
         </xsl:if>
         <xsl:call-template name="maybe-set-id"/>
         <!--Process this element's content-->
         <xsl:apply-templates/>
      </div>
   </xsl:template>

<xsl:template name="__style-for_unlist.8l1emst133">
      <xsl:text> .x-unlist-3-0 {margin-left: 0pt; margin-right: 0pt; text-indent: 0pt; margin-top: 8pt; font-size: 9pt; }</xsl:text>
   </xsl:template>

<xsl:template match="l1item/unlist" priority="5">
      <div>
         <!--Emit class values to reflect conditions-->
         <xsl:attribute name="class">
            <xsl:text> x-unlist-3-0</xsl:text>
         </xsl:attribute>
         <xsl:if test="@xml:lang">
            <xsl:attribute name="lang">
               <xsl:call-template name="return-lang-applying-language-map">
                  <xsl:with-param name="doclang" select="@xml:lang"/>
               </xsl:call-template>
            </xsl:attribute>
         </xsl:if>
         <xsl:copy-of select="@ch:*"/>
         <xsl:copy-of xmlns:dmp="http://www.arbortext.com/namespace/dmp/dmpmap" select="@dmp:*"/>
         <xsl:if test="@xml:lang">
            <xsl:attribute name="lang">
               <xsl:call-template name="return-lang-applying-language-map">
                  <xsl:with-param name="doclang" select="@xml:lang"/>
               </xsl:call-template>
            </xsl:attribute>
         </xsl:if>
         <xsl:call-template name="maybe-set-id"/>
         <!--Process this element's content-->
         <xsl:apply-templates/>
      </div>
   </xsl:template>

<xsl:template name="__style-for_unlist.8l2emst134">
      <xsl:text> .x-unlist-4-0 {margin-left: 0pt; margin-right: 0pt; text-indent: 0pt; margin-top: 8pt; font-size: 9pt; }</xsl:text>
   </xsl:template>

<xsl:template match="l2item/unlist" priority="4">
      <div>
         <!--Emit class values to reflect conditions-->
         <xsl:attribute name="class">
            <xsl:text> x-unlist-4-0</xsl:text>
         </xsl:attribute>
         <xsl:if test="@xml:lang">
            <xsl:attribute name="lang">
               <xsl:call-template name="return-lang-applying-language-map">
                  <xsl:with-param name="doclang" select="@xml:lang"/>
               </xsl:call-template>
            </xsl:attribute>
         </xsl:if>
         <xsl:copy-of select="@ch:*"/>
         <xsl:copy-of xmlns:dmp="http://www.arbortext.com/namespace/dmp/dmpmap" select="@dmp:*"/>
         <xsl:if test="@xml:lang">
            <xsl:attribute name="lang">
               <xsl:call-template name="return-lang-applying-language-map">
                  <xsl:with-param name="doclang" select="@xml:lang"/>
               </xsl:call-template>
            </xsl:attribute>
         </xsl:if>
         <xsl:call-template name="maybe-set-id"/>
         <!--Process this element's content-->
         <xsl:apply-templates/>
      </div>
   </xsl:template>

<xsl:template name="__style-for_unlist.8l3emst135">
      <xsl:text> .x-unlist-5-0 {margin-left: 0pt; margin-right: 0pt; text-indent: 0pt; margin-top: 8pt; font-size: 9pt; }</xsl:text>
   </xsl:template>

<xsl:template match="l3item/unlist" priority="3">
      <div>
         <!--Emit class values to reflect conditions-->
         <xsl:attribute name="class">
            <xsl:text> x-unlist-5-0</xsl:text>
         </xsl:attribute>
         <xsl:if test="@xml:lang">
            <xsl:attribute name="lang">
               <xsl:call-template name="return-lang-applying-language-map">
                  <xsl:with-param name="doclang" select="@xml:lang"/>
               </xsl:call-template>
            </xsl:attribute>
         </xsl:if>
         <xsl:copy-of select="@ch:*"/>
         <xsl:copy-of xmlns:dmp="http://www.arbortext.com/namespace/dmp/dmpmap" select="@dmp:*"/>
         <xsl:if test="@xml:lang">
            <xsl:attribute name="lang">
               <xsl:call-template name="return-lang-applying-language-map">
                  <xsl:with-param name="doclang" select="@xml:lang"/>
               </xsl:call-template>
            </xsl:attribute>
         </xsl:if>
         <xsl:call-template name="maybe-set-id"/>
         <!--Process this element's content-->
         <xsl:apply-templates/>
      </div>
   </xsl:template>

<xsl:template name="__style-for_unlist.8l4emst136">
      <xsl:text> .x-unlist-6-0 {margin-left: 0pt; margin-right: 0pt; text-indent: 0pt; margin-top: 8pt; font-size: 9pt; }</xsl:text>
   </xsl:template>

<xsl:template match="l4item/unlist" priority="2">
      <div>
         <!--Emit class values to reflect conditions-->
         <xsl:attribute name="class">
            <xsl:text> x-unlist-6-0</xsl:text>
         </xsl:attribute>
         <xsl:if test="@xml:lang">
            <xsl:attribute name="lang">
               <xsl:call-template name="return-lang-applying-language-map">
                  <xsl:with-param name="doclang" select="@xml:lang"/>
               </xsl:call-template>
            </xsl:attribute>
         </xsl:if>
         <xsl:copy-of select="@ch:*"/>
         <xsl:copy-of xmlns:dmp="http://www.arbortext.com/namespace/dmp/dmpmap" select="@dmp:*"/>
         <xsl:if test="@xml:lang">
            <xsl:attribute name="lang">
               <xsl:call-template name="return-lang-applying-language-map">
                  <xsl:with-param name="doclang" select="@xml:lang"/>
               </xsl:call-template>
            </xsl:attribute>
         </xsl:if>
         <xsl:call-template name="maybe-set-id"/>
         <!--Process this element's content-->
         <xsl:apply-templates/>
      </div>
   </xsl:template>

<xsl:template name="__style-for_unlist.8unstst487">
      <xsl:text> .x-unlist-7-0 {margin-left: 0pt; margin-right: 0pt; text-indent: 0pt; margin-top: 8pt; font-size: 9pt; margin-left: 36pt; text-indent: 0pt; }</xsl:text>
   </xsl:template>

<xsl:template match="unlist[ancestor::book[contains(@doctype,'epc')]]" priority="1">
      <div>
         <!--Emit class values to reflect conditions-->
         <xsl:attribute name="class">
            <xsl:text> x-unlist-7-0</xsl:text>
         </xsl:attribute>
         <xsl:if test="@xml:lang">
            <xsl:attribute name="lang">
               <xsl:call-template name="return-lang-applying-language-map">
                  <xsl:with-param name="doclang" select="@xml:lang"/>
               </xsl:call-template>
            </xsl:attribute>
         </xsl:if>
         <xsl:copy-of select="@ch:*"/>
         <xsl:copy-of xmlns:dmp="http://www.arbortext.com/namespace/dmp/dmpmap" select="@dmp:*"/>
         <xsl:if test="@xml:lang">
            <xsl:attribute name="lang">
               <xsl:call-template name="return-lang-applying-language-map">
                  <xsl:with-param name="doclang" select="@xml:lang"/>
               </xsl:call-template>
            </xsl:attribute>
         </xsl:if>
         <xsl:call-template name="maybe-set-id"/>
         <!--Process this element's content-->
         <xsl:apply-templates/>
      </div>
   </xsl:template>

<xsl:template name="__style-for_unlist.8unstst68">
      <xsl:text> .x-unlist-8-0 {margin-left: 0pt; margin-right: 0pt; text-indent: 0pt; margin-top: 8pt; font-size: 9pt; margin-left: 18pt; text-indent: 0pt; }</xsl:text>
   </xsl:template>

<xsl:template match="unlist" priority="0">
      <div>
         <!--Emit class values to reflect conditions-->
         <xsl:attribute name="class">
            <xsl:text> x-unlist-8-0</xsl:text>
         </xsl:attribute>
         <xsl:if test="@xml:lang">
            <xsl:attribute name="lang">
               <xsl:call-template name="return-lang-applying-language-map">
                  <xsl:with-param name="doclang" select="@xml:lang"/>
               </xsl:call-template>
            </xsl:attribute>
         </xsl:if>
         <xsl:copy-of select="@ch:*"/>
         <xsl:copy-of xmlns:dmp="http://www.arbortext.com/namespace/dmp/dmpmap" select="@dmp:*"/>
         <xsl:if test="@xml:lang">
            <xsl:attribute name="lang">
               <xsl:call-template name="return-lang-applying-language-map">
                  <xsl:with-param name="doclang" select="@xml:lang"/>
               </xsl:call-template>
            </xsl:attribute>
         </xsl:if>
         <xsl:call-template name="maybe-set-id"/>
         <!--Process this element's content-->
         <xsl:apply-templates/>
      </div>
   </xsl:template>

<xsl:template name="__style-for_unlitem.13enliem461">
      <xsl:text> .x-unlitem-1-0 {margin-left: 0pt; margin-right: 0pt; text-indent: 0pt; margin-top: 6pt; margin-bottom: 6pt; margin-left: 0pt; text-indent: 0pt; }</xsl:text>
   </xsl:template>

<xsl:template match="enumlist//enumlist//enumlist//enumlist/unlitem" priority="12">
      <table border="0" cellpadding="0" cellspacing="0">
         <xsl:attribute name="style">
            <xsl:variable name="followWith">tab</xsl:variable>
            <xsl:if test="$followWith='tab'">table-layout: fixed; </xsl:if>
         </xsl:attribute>
         <!--Emit class values to reflect conditions-->
         <xsl:attribute name="class">
            <xsl:text> x-unlitem-1-0</xsl:text> x--zero-left-margins</xsl:attribute>
         <xsl:if test="@xml:lang">
            <xsl:attribute name="lang">
               <xsl:call-template name="return-lang-applying-language-map">
                  <xsl:with-param name="doclang" select="@xml:lang"/>
               </xsl:call-template>
            </xsl:attribute>
         </xsl:if>
         <xsl:copy-of select="@ch:*"/>
         <xsl:copy-of xmlns:dmp="http://www.arbortext.com/namespace/dmp/dmpmap" select="@dmp:*"/>
         <xsl:if test="@xml:lang">
            <xsl:attribute name="lang">
               <xsl:call-template name="return-lang-applying-language-map">
                  <xsl:with-param name="doclang" select="@xml:lang"/>
               </xsl:call-template>
            </xsl:attribute>
         </xsl:if>
         <xsl:call-template name="maybe-set-id"/>
         <xsl:variable name="col1-width">1.5em</xsl:variable>
         <xsl:variable name="col2-width">12pt</xsl:variable>
         <xsl:variable name="col3-width"/>
         <xsl:variable name="itemlabel-colnum">1</xsl:variable>
         <xsl:variable name="col2-align">right</xsl:variable>
         <col>
            <xsl:if test="$col1-width!=''">
               <xsl:attribute name="style">
                  <xsl:text>width: </xsl:text>
                  <xsl:value-of select="$col1-width"/>
               </xsl:attribute>
            </xsl:if>
         </col>
         <col>
            <xsl:if test="$col2-width!=''">
               <xsl:attribute name="style">
                  <xsl:text>width: </xsl:text>
                  <xsl:value-of select="$col2-width"/>
               </xsl:attribute>
            </xsl:if>
         </col>
         <col>
            <xsl:if test="$col3-width!=''">
               <xsl:attribute name="style">
                  <xsl:text>width: </xsl:text>
                  <xsl:value-of select="$col3-width"/>
               </xsl:attribute>
            </xsl:if>
         </col>
         <tbody>
            <tr valign="baseline">
               <td align="right">
                  <xsl:if test="$itemlabel-colnum=1">
                     <xsl:attribute name="style">word-break: keep-all; </xsl:attribute>
                     <xsl:apply-templates select="_sfe:BeforeOrAfterText[1]"/>
                  </xsl:if>
               </td>
               <td align="{$col2-align}">
                  <xsl:if test="$itemlabel-colnum=2">
                     <xsl:attribute name="style">word-break: keep-all; </xsl:attribute>
                     <xsl:apply-templates select="_sfe:BeforeOrAfterText[1]"/>
                  </xsl:if>
               </td>
               <td>
                  <xsl:if test="$itemlabel-colnum=3">
                     <xsl:attribute name="style">word-break: keep-all; </xsl:attribute>
                     <xsl:apply-templates select="_sfe:BeforeOrAfterText[1]"/>
                  </xsl:if>
                  <!--Process this element's content-->
                  <xsl:apply-templates select="node()[name(.)!='_sfe:BeforeOrAfterText']"/>
               </td>
            </tr>
         </tbody>
      </table>
   </xsl:template>

<xsl:template name="__style-for_unlitem.13enliem362">
      <xsl:text> .x-unlitem-2-0 {margin-left: 0pt; margin-right: 0pt; text-indent: 0pt; margin-top: 6pt; margin-bottom: 6pt; margin-left: 0pt; text-indent: 0pt; }</xsl:text>
   </xsl:template>

<xsl:template match="enumlist//enumlist//enumlist/unlitem" priority="11">
      <table border="0" cellpadding="0" cellspacing="0">
         <xsl:attribute name="style">
            <xsl:variable name="followWith">tab</xsl:variable>
            <xsl:if test="$followWith='tab'">table-layout: fixed; </xsl:if>
         </xsl:attribute>
         <!--Emit class values to reflect conditions-->
         <xsl:attribute name="class">
            <xsl:text> x-unlitem-2-0</xsl:text> x--zero-left-margins</xsl:attribute>
         <xsl:if test="@xml:lang">
            <xsl:attribute name="lang">
               <xsl:call-template name="return-lang-applying-language-map">
                  <xsl:with-param name="doclang" select="@xml:lang"/>
               </xsl:call-template>
            </xsl:attribute>
         </xsl:if>
         <xsl:copy-of select="@ch:*"/>
         <xsl:copy-of xmlns:dmp="http://www.arbortext.com/namespace/dmp/dmpmap" select="@dmp:*"/>
         <xsl:if test="@xml:lang">
            <xsl:attribute name="lang">
               <xsl:call-template name="return-lang-applying-language-map">
                  <xsl:with-param name="doclang" select="@xml:lang"/>
               </xsl:call-template>
            </xsl:attribute>
         </xsl:if>
         <xsl:call-template name="maybe-set-id"/>
         <xsl:variable name="col1-width">2em</xsl:variable>
         <xsl:variable name="col2-width">12pt</xsl:variable>
         <xsl:variable name="col3-width"/>
         <xsl:variable name="itemlabel-colnum">1</xsl:variable>
         <xsl:variable name="col2-align">right</xsl:variable>
         <col>
            <xsl:if test="$col1-width!=''">
               <xsl:attribute name="style">
                  <xsl:text>width: </xsl:text>
                  <xsl:value-of select="$col1-width"/>
               </xsl:attribute>
            </xsl:if>
         </col>
         <col>
            <xsl:if test="$col2-width!=''">
               <xsl:attribute name="style">
                  <xsl:text>width: </xsl:text>
                  <xsl:value-of select="$col2-width"/>
               </xsl:attribute>
            </xsl:if>
         </col>
         <col>
            <xsl:if test="$col3-width!=''">
               <xsl:attribute name="style">
                  <xsl:text>width: </xsl:text>
                  <xsl:value-of select="$col3-width"/>
               </xsl:attribute>
            </xsl:if>
         </col>
         <tbody>
            <tr valign="baseline">
               <td align="right">
                  <xsl:if test="$itemlabel-colnum=1">
                     <xsl:attribute name="style">word-break: keep-all; </xsl:attribute>
                     <xsl:apply-templates select="_sfe:BeforeOrAfterText[1]"/>
                  </xsl:if>
               </td>
               <td align="{$col2-align}">
                  <xsl:if test="$itemlabel-colnum=2">
                     <xsl:attribute name="style">word-break: keep-all; </xsl:attribute>
                     <xsl:apply-templates select="_sfe:BeforeOrAfterText[1]"/>
                  </xsl:if>
               </td>
               <td>
                  <xsl:if test="$itemlabel-colnum=3">
                     <xsl:attribute name="style">word-break: keep-all; </xsl:attribute>
                     <xsl:apply-templates select="_sfe:BeforeOrAfterText[1]"/>
                  </xsl:if>
                  <!--Process this element's content-->
                  <xsl:apply-templates select="node()[name(.)!='_sfe:BeforeOrAfterText']"/>
               </td>
            </tr>
         </tbody>
      </table>
   </xsl:template>

<xsl:template name="__style-for_unlitem.13liliem243">
      <xsl:text> .x-unlitem-3-0 {margin-left: 0pt; margin-right: 0pt; text-indent: 0pt; margin-top: 6pt; margin-bottom: 6pt; margin-left: 0pt; text-indent: 0pt; }</xsl:text>
   </xsl:template>

<xsl:template match="list//list//list/unlitem" priority="10">
      <table border="0" cellpadding="0" cellspacing="0">
         <xsl:attribute name="style">
            <xsl:variable name="followWith">tab</xsl:variable>
            <xsl:if test="$followWith='tab'">table-layout: fixed; </xsl:if>
         </xsl:attribute>
         <!--Emit class values to reflect conditions-->
         <xsl:attribute name="class">
            <xsl:text> x-unlitem-3-0</xsl:text> x--zero-left-margins</xsl:attribute>
         <xsl:if test="@xml:lang">
            <xsl:attribute name="lang">
               <xsl:call-template name="return-lang-applying-language-map">
                  <xsl:with-param name="doclang" select="@xml:lang"/>
               </xsl:call-template>
            </xsl:attribute>
         </xsl:if>
         <xsl:copy-of select="@ch:*"/>
         <xsl:copy-of xmlns:dmp="http://www.arbortext.com/namespace/dmp/dmpmap" select="@dmp:*"/>
         <xsl:if test="@xml:lang">
            <xsl:attribute name="lang">
               <xsl:call-template name="return-lang-applying-language-map">
                  <xsl:with-param name="doclang" select="@xml:lang"/>
               </xsl:call-template>
            </xsl:attribute>
         </xsl:if>
         <xsl:call-template name="maybe-set-id"/>
         <xsl:variable name="col1-width">0em</xsl:variable>
         <xsl:variable name="col2-width">15pt</xsl:variable>
         <xsl:variable name="col3-width"/>
         <xsl:variable name="itemlabel-colnum">2</xsl:variable>
         <xsl:variable name="col2-align">left</xsl:variable>
         <col>
            <xsl:if test="$col1-width!=''">
               <xsl:attribute name="style">
                  <xsl:text>width: </xsl:text>
                  <xsl:value-of select="$col1-width"/>
               </xsl:attribute>
            </xsl:if>
         </col>
         <col>
            <xsl:if test="$col2-width!=''">
               <xsl:attribute name="style">
                  <xsl:text>width: </xsl:text>
                  <xsl:value-of select="$col2-width"/>
               </xsl:attribute>
            </xsl:if>
         </col>
         <col>
            <xsl:if test="$col3-width!=''">
               <xsl:attribute name="style">
                  <xsl:text>width: </xsl:text>
                  <xsl:value-of select="$col3-width"/>
               </xsl:attribute>
            </xsl:if>
         </col>
         <tbody>
            <tr valign="baseline">
               <td align="right">
                  <xsl:if test="$itemlabel-colnum=1">
                     <xsl:attribute name="style">word-break: keep-all; </xsl:attribute>
                     <xsl:apply-templates select="_sfe:BeforeOrAfterText[1]"/>
                  </xsl:if>
               </td>
               <td align="{$col2-align}">
                  <xsl:if test="$itemlabel-colnum=2">
                     <xsl:attribute name="style">word-break: keep-all; </xsl:attribute>
                     <xsl:apply-templates select="_sfe:BeforeOrAfterText[1]"/>
                  </xsl:if>
               </td>
               <td>
                  <xsl:if test="$itemlabel-colnum=3">
                     <xsl:attribute name="style">word-break: keep-all; </xsl:attribute>
                     <xsl:apply-templates select="_sfe:BeforeOrAfterText[1]"/>
                  </xsl:if>
                  <!--Process this element's content-->
                  <xsl:apply-templates select="node()[name(.)!='_sfe:BeforeOrAfterText']"/>
               </td>
            </tr>
         </tbody>
      </table>
   </xsl:template>

<xsl:template name="__style-for_unlitem.13buisem334">
      <xsl:text> .x-unlitem-4-0 {margin-left: 0pt; margin-right: 0pt; text-indent: 0pt; margin-top: 6pt; margin-bottom: 6pt; margin-left: 0pt; text-indent: 0pt; }</xsl:text>
   </xsl:template>

<xsl:template match="bullist//bullist//bullist/unlitem" priority="9">
      <table border="0" cellpadding="0" cellspacing="0">
         <xsl:attribute name="style">
            <xsl:variable name="followWith">tab</xsl:variable>
            <xsl:if test="$followWith='tab'">table-layout: fixed; </xsl:if>
         </xsl:attribute>
         <!--Emit class values to reflect conditions-->
         <xsl:attribute name="class">
            <xsl:text> x-unlitem-4-0</xsl:text> x--zero-left-margins</xsl:attribute>
         <xsl:if test="@xml:lang">
            <xsl:attribute name="lang">
               <xsl:call-template name="return-lang-applying-language-map">
                  <xsl:with-param name="doclang" select="@xml:lang"/>
               </xsl:call-template>
            </xsl:attribute>
         </xsl:if>
         <xsl:copy-of select="@ch:*"/>
         <xsl:copy-of xmlns:dmp="http://www.arbortext.com/namespace/dmp/dmpmap" select="@dmp:*"/>
         <xsl:if test="@xml:lang">
            <xsl:attribute name="lang">
               <xsl:call-template name="return-lang-applying-language-map">
                  <xsl:with-param name="doclang" select="@xml:lang"/>
               </xsl:call-template>
            </xsl:attribute>
         </xsl:if>
         <xsl:call-template name="maybe-set-id"/>
         <xsl:variable name="col1-width">0em</xsl:variable>
         <xsl:variable name="col2-width">15pt</xsl:variable>
         <xsl:variable name="col3-width"/>
         <xsl:variable name="itemlabel-colnum">2</xsl:variable>
         <xsl:variable name="col2-align">left</xsl:variable>
         <col>
            <xsl:if test="$col1-width!=''">
               <xsl:attribute name="style">
                  <xsl:text>width: </xsl:text>
                  <xsl:value-of select="$col1-width"/>
               </xsl:attribute>
            </xsl:if>
         </col>
         <col>
            <xsl:if test="$col2-width!=''">
               <xsl:attribute name="style">
                  <xsl:text>width: </xsl:text>
                  <xsl:value-of select="$col2-width"/>
               </xsl:attribute>
            </xsl:if>
         </col>
         <col>
            <xsl:if test="$col3-width!=''">
               <xsl:attribute name="style">
                  <xsl:text>width: </xsl:text>
                  <xsl:value-of select="$col3-width"/>
               </xsl:attribute>
            </xsl:if>
         </col>
         <tbody>
            <tr valign="baseline">
               <td align="right">
                  <xsl:if test="$itemlabel-colnum=1">
                     <xsl:attribute name="style">word-break: keep-all; </xsl:attribute>
                     <xsl:apply-templates select="_sfe:BeforeOrAfterText[1]"/>
                  </xsl:if>
               </td>
               <td align="{$col2-align}">
                  <xsl:if test="$itemlabel-colnum=2">
                     <xsl:attribute name="style">word-break: keep-all; </xsl:attribute>
                     <xsl:apply-templates select="_sfe:BeforeOrAfterText[1]"/>
                  </xsl:if>
               </td>
               <td>
                  <xsl:if test="$itemlabel-colnum=3">
                     <xsl:attribute name="style">word-break: keep-all; </xsl:attribute>
                     <xsl:apply-templates select="_sfe:BeforeOrAfterText[1]"/>
                  </xsl:if>
                  <!--Process this element's content-->
                  <xsl:apply-templates select="node()[name(.)!='_sfe:BeforeOrAfterText']"/>
               </td>
            </tr>
         </tbody>
      </table>
   </xsl:template>

<xsl:template name="__style-for_unlitem.13enliem265">
      <xsl:text> .x-unlitem-5-0 {margin-left: 0pt; margin-right: 0pt; text-indent: 0pt; margin-top: 6pt; margin-bottom: 6pt; margin-left: 0pt; text-indent: 0pt; }</xsl:text>
   </xsl:template>

<xsl:template match="enumlist//enumlist/unlitem" priority="8">
      <table border="0" cellpadding="0" cellspacing="0">
         <xsl:attribute name="style">
            <xsl:variable name="followWith">tab</xsl:variable>
            <xsl:if test="$followWith='tab'">table-layout: fixed; </xsl:if>
         </xsl:attribute>
         <!--Emit class values to reflect conditions-->
         <xsl:attribute name="class">
            <xsl:text> x-unlitem-5-0</xsl:text> x--zero-left-margins</xsl:attribute>
         <xsl:if test="@xml:lang">
            <xsl:attribute name="lang">
               <xsl:call-template name="return-lang-applying-language-map">
                  <xsl:with-param name="doclang" select="@xml:lang"/>
               </xsl:call-template>
            </xsl:attribute>
         </xsl:if>
         <xsl:copy-of select="@ch:*"/>
         <xsl:copy-of xmlns:dmp="http://www.arbortext.com/namespace/dmp/dmpmap" select="@dmp:*"/>
         <xsl:if test="@xml:lang">
            <xsl:attribute name="lang">
               <xsl:call-template name="return-lang-applying-language-map">
                  <xsl:with-param name="doclang" select="@xml:lang"/>
               </xsl:call-template>
            </xsl:attribute>
         </xsl:if>
         <xsl:call-template name="maybe-set-id"/>
         <xsl:variable name="col1-width">1em</xsl:variable>
         <xsl:variable name="col2-width">12pt</xsl:variable>
         <xsl:variable name="col3-width"/>
         <xsl:variable name="itemlabel-colnum">1</xsl:variable>
         <xsl:variable name="col2-align">right</xsl:variable>
         <col>
            <xsl:if test="$col1-width!=''">
               <xsl:attribute name="style">
                  <xsl:text>width: </xsl:text>
                  <xsl:value-of select="$col1-width"/>
               </xsl:attribute>
            </xsl:if>
         </col>
         <col>
            <xsl:if test="$col2-width!=''">
               <xsl:attribute name="style">
                  <xsl:text>width: </xsl:text>
                  <xsl:value-of select="$col2-width"/>
               </xsl:attribute>
            </xsl:if>
         </col>
         <col>
            <xsl:if test="$col3-width!=''">
               <xsl:attribute name="style">
                  <xsl:text>width: </xsl:text>
                  <xsl:value-of select="$col3-width"/>
               </xsl:attribute>
            </xsl:if>
         </col>
         <tbody>
            <tr valign="baseline">
               <td align="right">
                  <xsl:if test="$itemlabel-colnum=1">
                     <xsl:attribute name="style">word-break: keep-all; </xsl:attribute>
                     <xsl:apply-templates select="_sfe:BeforeOrAfterText[1]"/>
                  </xsl:if>
               </td>
               <td align="{$col2-align}">
                  <xsl:if test="$itemlabel-colnum=2">
                     <xsl:attribute name="style">word-break: keep-all; </xsl:attribute>
                     <xsl:apply-templates select="_sfe:BeforeOrAfterText[1]"/>
                  </xsl:if>
               </td>
               <td>
                  <xsl:if test="$itemlabel-colnum=3">
                     <xsl:attribute name="style">word-break: keep-all; </xsl:attribute>
                     <xsl:apply-templates select="_sfe:BeforeOrAfterText[1]"/>
                  </xsl:if>
                  <!--Process this element's content-->
                  <xsl:apply-templates select="node()[name(.)!='_sfe:BeforeOrAfterText']"/>
               </td>
            </tr>
         </tbody>
      </table>
   </xsl:template>

<xsl:template name="__style-for_unlitem.13liliem186">
      <xsl:text> .x-unlitem-6-0 {margin-left: 0pt; margin-right: 0pt; text-indent: 0pt; margin-top: 6pt; margin-bottom: 6pt; margin-left: 0pt; text-indent: 0pt; }</xsl:text>
   </xsl:template>

<xsl:template match="list//list/unlitem" priority="7">
      <table border="0" cellpadding="0" cellspacing="0">
         <xsl:attribute name="style">
            <xsl:variable name="followWith">tab</xsl:variable>
            <xsl:if test="$followWith='tab'">table-layout: fixed; </xsl:if>
         </xsl:attribute>
         <!--Emit class values to reflect conditions-->
         <xsl:attribute name="class">
            <xsl:text> x-unlitem-6-0</xsl:text> x--zero-left-margins</xsl:attribute>
         <xsl:if test="@xml:lang">
            <xsl:attribute name="lang">
               <xsl:call-template name="return-lang-applying-language-map">
                  <xsl:with-param name="doclang" select="@xml:lang"/>
               </xsl:call-template>
            </xsl:attribute>
         </xsl:if>
         <xsl:copy-of select="@ch:*"/>
         <xsl:copy-of xmlns:dmp="http://www.arbortext.com/namespace/dmp/dmpmap" select="@dmp:*"/>
         <xsl:if test="@xml:lang">
            <xsl:attribute name="lang">
               <xsl:call-template name="return-lang-applying-language-map">
                  <xsl:with-param name="doclang" select="@xml:lang"/>
               </xsl:call-template>
            </xsl:attribute>
         </xsl:if>
         <xsl:call-template name="maybe-set-id"/>
         <xsl:variable name="col1-width">0em</xsl:variable>
         <xsl:variable name="col2-width">15pt</xsl:variable>
         <xsl:variable name="col3-width"/>
         <xsl:variable name="itemlabel-colnum">2</xsl:variable>
         <xsl:variable name="col2-align">left</xsl:variable>
         <col>
            <xsl:if test="$col1-width!=''">
               <xsl:attribute name="style">
                  <xsl:text>width: </xsl:text>
                  <xsl:value-of select="$col1-width"/>
               </xsl:attribute>
            </xsl:if>
         </col>
         <col>
            <xsl:if test="$col2-width!=''">
               <xsl:attribute name="style">
                  <xsl:text>width: </xsl:text>
                  <xsl:value-of select="$col2-width"/>
               </xsl:attribute>
            </xsl:if>
         </col>
         <col>
            <xsl:if test="$col3-width!=''">
               <xsl:attribute name="style">
                  <xsl:text>width: </xsl:text>
                  <xsl:value-of select="$col3-width"/>
               </xsl:attribute>
            </xsl:if>
         </col>
         <tbody>
            <tr valign="baseline">
               <td align="right">
                  <xsl:if test="$itemlabel-colnum=1">
                     <xsl:attribute name="style">word-break: keep-all; </xsl:attribute>
                     <xsl:apply-templates select="_sfe:BeforeOrAfterText[1]"/>
                  </xsl:if>
               </td>
               <td align="{$col2-align}">
                  <xsl:if test="$itemlabel-colnum=2">
                     <xsl:attribute name="style">word-break: keep-all; </xsl:attribute>
                     <xsl:apply-templates select="_sfe:BeforeOrAfterText[1]"/>
                  </xsl:if>
               </td>
               <td>
                  <xsl:if test="$itemlabel-colnum=3">
                     <xsl:attribute name="style">word-break: keep-all; </xsl:attribute>
                     <xsl:apply-templates select="_sfe:BeforeOrAfterText[1]"/>
                  </xsl:if>
                  <!--Process this element's content-->
                  <xsl:apply-templates select="node()[name(.)!='_sfe:BeforeOrAfterText']"/>
               </td>
            </tr>
         </tbody>
      </table>
   </xsl:template>

<xsl:template name="__style-for_unlitem.13buisem247">
      <xsl:text> .x-unlitem-7-0 {margin-left: 0pt; margin-right: 0pt; text-indent: 0pt; margin-top: 6pt; margin-bottom: 6pt; margin-left: 0pt; text-indent: 0pt; }</xsl:text>
   </xsl:template>

<xsl:template match="bullist//bullist/unlitem" priority="6">
      <table border="0" cellpadding="0" cellspacing="0">
         <xsl:attribute name="style">
            <xsl:variable name="followWith">tab</xsl:variable>
            <xsl:if test="$followWith='tab'">table-layout: fixed; </xsl:if>
         </xsl:attribute>
         <!--Emit class values to reflect conditions-->
         <xsl:attribute name="class">
            <xsl:text> x-unlitem-7-0</xsl:text> x--zero-left-margins</xsl:attribute>
         <xsl:if test="@xml:lang">
            <xsl:attribute name="lang">
               <xsl:call-template name="return-lang-applying-language-map">
                  <xsl:with-param name="doclang" select="@xml:lang"/>
               </xsl:call-template>
            </xsl:attribute>
         </xsl:if>
         <xsl:copy-of select="@ch:*"/>
         <xsl:copy-of xmlns:dmp="http://www.arbortext.com/namespace/dmp/dmpmap" select="@dmp:*"/>
         <xsl:if test="@xml:lang">
            <xsl:attribute name="lang">
               <xsl:call-template name="return-lang-applying-language-map">
                  <xsl:with-param name="doclang" select="@xml:lang"/>
               </xsl:call-template>
            </xsl:attribute>
         </xsl:if>
         <xsl:call-template name="maybe-set-id"/>
         <xsl:variable name="col1-width">0em</xsl:variable>
         <xsl:variable name="col2-width">15pt</xsl:variable>
         <xsl:variable name="col3-width"/>
         <xsl:variable name="itemlabel-colnum">2</xsl:variable>
         <xsl:variable name="col2-align">left</xsl:variable>
         <col>
            <xsl:if test="$col1-width!=''">
               <xsl:attribute name="style">
                  <xsl:text>width: </xsl:text>
                  <xsl:value-of select="$col1-width"/>
               </xsl:attribute>
            </xsl:if>
         </col>
         <col>
            <xsl:if test="$col2-width!=''">
               <xsl:attribute name="style">
                  <xsl:text>width: </xsl:text>
                  <xsl:value-of select="$col2-width"/>
               </xsl:attribute>
            </xsl:if>
         </col>
         <col>
            <xsl:if test="$col3-width!=''">
               <xsl:attribute name="style">
                  <xsl:text>width: </xsl:text>
                  <xsl:value-of select="$col3-width"/>
               </xsl:attribute>
            </xsl:if>
         </col>
         <tbody>
            <tr valign="baseline">
               <td align="right">
                  <xsl:if test="$itemlabel-colnum=1">
                     <xsl:attribute name="style">word-break: keep-all; </xsl:attribute>
                     <xsl:apply-templates select="_sfe:BeforeOrAfterText[1]"/>
                  </xsl:if>
               </td>
               <td align="{$col2-align}">
                  <xsl:if test="$itemlabel-colnum=2">
                     <xsl:attribute name="style">word-break: keep-all; </xsl:attribute>
                     <xsl:apply-templates select="_sfe:BeforeOrAfterText[1]"/>
                  </xsl:if>
               </td>
               <td>
                  <xsl:if test="$itemlabel-colnum=3">
                     <xsl:attribute name="style">word-break: keep-all; </xsl:attribute>
                     <xsl:apply-templates select="_sfe:BeforeOrAfterText[1]"/>
                  </xsl:if>
                  <!--Process this element's content-->
                  <xsl:apply-templates select="node()[name(.)!='_sfe:BeforeOrAfterText']"/>
               </td>
            </tr>
         </tbody>
      </table>
   </xsl:template>

<xsl:template name="__style-for_unlitem.13enliem168">
      <xsl:text> .x-unlitem-8-0 {margin-left: 0pt; margin-right: 0pt; text-indent: 0pt; margin-top: 6pt; margin-bottom: 6pt; margin-left: 0pt; text-indent: 0pt; }</xsl:text>
   </xsl:template>

<xsl:template match="enumlist/unlitem" priority="5">
      <table border="0" cellpadding="0" cellspacing="0">
         <xsl:attribute name="style">
            <xsl:variable name="followWith">tab</xsl:variable>
            <xsl:if test="$followWith='tab'">table-layout: fixed; </xsl:if>
         </xsl:attribute>
         <!--Emit class values to reflect conditions-->
         <xsl:attribute name="class">
            <xsl:text> x-unlitem-8-0</xsl:text> x--zero-left-margins</xsl:attribute>
         <xsl:if test="@xml:lang">
            <xsl:attribute name="lang">
               <xsl:call-template name="return-lang-applying-language-map">
                  <xsl:with-param name="doclang" select="@xml:lang"/>
               </xsl:call-template>
            </xsl:attribute>
         </xsl:if>
         <xsl:copy-of select="@ch:*"/>
         <xsl:copy-of xmlns:dmp="http://www.arbortext.com/namespace/dmp/dmpmap" select="@dmp:*"/>
         <xsl:if test="@xml:lang">
            <xsl:attribute name="lang">
               <xsl:call-template name="return-lang-applying-language-map">
                  <xsl:with-param name="doclang" select="@xml:lang"/>
               </xsl:call-template>
            </xsl:attribute>
         </xsl:if>
         <xsl:call-template name="maybe-set-id"/>
         <xsl:variable name="col1-width">1.5em</xsl:variable>
         <xsl:variable name="col2-width">12pt</xsl:variable>
         <xsl:variable name="col3-width"/>
         <xsl:variable name="itemlabel-colnum">1</xsl:variable>
         <xsl:variable name="col2-align">right</xsl:variable>
         <col>
            <xsl:if test="$col1-width!=''">
               <xsl:attribute name="style">
                  <xsl:text>width: </xsl:text>
                  <xsl:value-of select="$col1-width"/>
               </xsl:attribute>
            </xsl:if>
         </col>
         <col>
            <xsl:if test="$col2-width!=''">
               <xsl:attribute name="style">
                  <xsl:text>width: </xsl:text>
                  <xsl:value-of select="$col2-width"/>
               </xsl:attribute>
            </xsl:if>
         </col>
         <col>
            <xsl:if test="$col3-width!=''">
               <xsl:attribute name="style">
                  <xsl:text>width: </xsl:text>
                  <xsl:value-of select="$col3-width"/>
               </xsl:attribute>
            </xsl:if>
         </col>
         <tbody>
            <tr valign="baseline">
               <td align="right">
                  <xsl:if test="$itemlabel-colnum=1">
                     <xsl:attribute name="style">word-break: keep-all; </xsl:attribute>
                     <xsl:apply-templates select="_sfe:BeforeOrAfterText[1]"/>
                  </xsl:if>
               </td>
               <td align="{$col2-align}">
                  <xsl:if test="$itemlabel-colnum=2">
                     <xsl:attribute name="style">word-break: keep-all; </xsl:attribute>
                     <xsl:apply-templates select="_sfe:BeforeOrAfterText[1]"/>
                  </xsl:if>
               </td>
               <td>
                  <xsl:if test="$itemlabel-colnum=3">
                     <xsl:attribute name="style">word-break: keep-all; </xsl:attribute>
                     <xsl:apply-templates select="_sfe:BeforeOrAfterText[1]"/>
                  </xsl:if>
                  <!--Process this element's content-->
                  <xsl:apply-templates select="node()[name(.)!='_sfe:BeforeOrAfterText']"/>
               </td>
            </tr>
         </tbody>
      </table>
   </xsl:template>

<xsl:template name="__style-for_unlitem.13chseem219">
      <xsl:text> .x-unlitem-9-0 {margin-left: 0pt; margin-right: 0pt; text-indent: 0pt; margin-top: 6pt; margin-bottom: 6pt; margin-left: 0pt; text-indent: 0pt; }</xsl:text>
   </xsl:template>

<xsl:template match="chapsect-list/unlitem" priority="4">
      <table border="0" cellpadding="0" cellspacing="0">
         <xsl:attribute name="style">
            <xsl:variable name="followWith"/>
            <xsl:if test="$followWith='tab'">table-layout: fixed; </xsl:if>
         </xsl:attribute>
         <!--Emit class values to reflect conditions-->
         <xsl:attribute name="class">
            <xsl:text> x-unlitem-9-0</xsl:text> x--zero-left-margins</xsl:attribute>
         <xsl:if test="@xml:lang">
            <xsl:attribute name="lang">
               <xsl:call-template name="return-lang-applying-language-map">
                  <xsl:with-param name="doclang" select="@xml:lang"/>
               </xsl:call-template>
            </xsl:attribute>
         </xsl:if>
         <xsl:copy-of select="@ch:*"/>
         <xsl:copy-of xmlns:dmp="http://www.arbortext.com/namespace/dmp/dmpmap" select="@dmp:*"/>
         <xsl:if test="@xml:lang">
            <xsl:attribute name="lang">
               <xsl:call-template name="return-lang-applying-language-map">
                  <xsl:with-param name="doclang" select="@xml:lang"/>
               </xsl:call-template>
            </xsl:attribute>
         </xsl:if>
         <xsl:call-template name="maybe-set-id"/>
         <xsl:variable name="col1-width">0pt</xsl:variable>
         <xsl:variable name="col2-width">0pt</xsl:variable>
         <xsl:variable name="col3-width"/>
         <xsl:variable name="itemlabel-colnum">3</xsl:variable>
         <xsl:variable name="col2-align">center</xsl:variable>
         <col>
            <xsl:if test="$col1-width!=''">
               <xsl:attribute name="style">
                  <xsl:text>width: </xsl:text>
                  <xsl:value-of select="$col1-width"/>
               </xsl:attribute>
            </xsl:if>
         </col>
         <col>
            <xsl:if test="$col2-width!=''">
               <xsl:attribute name="style">
                  <xsl:text>width: </xsl:text>
                  <xsl:value-of select="$col2-width"/>
               </xsl:attribute>
            </xsl:if>
         </col>
         <col>
            <xsl:if test="$col3-width!=''">
               <xsl:attribute name="style">
                  <xsl:text>width: </xsl:text>
                  <xsl:value-of select="$col3-width"/>
               </xsl:attribute>
            </xsl:if>
         </col>
         <tbody>
            <tr valign="baseline">
               <td align="right">
                  <xsl:if test="$itemlabel-colnum=1">
                     <xsl:attribute name="style">word-break: keep-all; </xsl:attribute>
                  </xsl:if>
               </td>
               <td align="{$col2-align}">
                  <xsl:if test="$itemlabel-colnum=2">
                     <xsl:attribute name="style">word-break: keep-all; </xsl:attribute>
                  </xsl:if>
               </td>
               <td>
                  <xsl:if test="$itemlabel-colnum=3">
                     <xsl:attribute name="style">word-break: keep-all; </xsl:attribute>
                  </xsl:if>
                  <!--Process this element's content-->
                  <xsl:apply-templates select="node()[name(.)!='_sfe:BeforeOrAfterText']"/>
               </td>
            </tr>
         </tbody>
      </table>
   </xsl:template>

<xsl:template match="unlist/unlitem" priority="3">
  <table border="0" cellpadding="0" cellspacing="0">
     <xsl:if test="ancestor-or-self::unlist[1]/@bulltype[.='NDASH']"><xsl:attribute name="style">table-layout: fixed; </xsl:attribute></xsl:if>
     <xsl:attribute name="class">
        <xsl:text> x-unlitem-10-0</xsl:text>
        <xsl:choose>
          <xsl:when test="ancestor-or-self::unlist[1]/@bulltype[.='NDASH']"> x-unlitem-10-1</xsl:when>
          <xsl:when test="ancestor-or-self::unlist[1]/@bulltype[.='BULLET']"> x-unlitem-10-2</xsl:when>
        </xsl:choose>
        <xsl:text> x--zero-left-margins</xsl:text>
     </xsl:attribute>
      <xsl:call-template name="t-base-step-table">
        <xsl:with-param name="col1-width" select="'0pt'"/>
        <xsl:with-param name="col2-width">
          <xsl:choose>
             <xsl:when test="ancestor-or-self::unlist[1]/@bulltype[.='NDASH']">12pt</xsl:when>
             <xsl:otherwise></xsl:otherwise>
          </xsl:choose>
        </xsl:with-param>
        <xsl:with-param name="col3-width">
          <xsl:choose>
             <xsl:when test="ancestor-or-self::unlist[1]/@bulltype[.='NDASH']"></xsl:when>
             <xsl:otherwise>100%</xsl:otherwise>
          </xsl:choose>
        </xsl:with-param>
        <xsl:with-param name="label-col">
          <xsl:choose>
             <xsl:when test="ancestor-or-self::unlist[1]/@bulltype[.='NDASH'] or ancestor-or-self::unlist[1]/@bulltype[.='BULLET']">2</xsl:when>
             <xsl:otherwise>0</xsl:otherwise>
          </xsl:choose>
        </xsl:with-param>
        <xsl:with-param name="col2-align" select="'left'"/>
        <xsl:with-param name="apply"      select="'&lib-gentxt;'"/>
      </xsl:call-template>
  </table>
</xsl:template>

<xsl:template match="list/unlitem" priority="2">
  <table border="0" cellpadding="0" cellspacing="0" style="table-layout: fixed; " class=" x-unlitem-11-0 x--zero-left-margins">
    <xsl:call-template name="t-base-step-table">
      <xsl:with-param name="col1-width" select="'0em'"/>
      <xsl:with-param name="col2-width" select="'15pt'"/>
      <xsl:with-param name="col3-width" select="''"/>
      <xsl:with-param name="label-col"  select="'2'"/>
      <xsl:with-param name="col2-align" select="'left'"/>
      <xsl:with-param name="apply"      select="'&lib-gentxt;'"/>
    </xsl:call-template>
  </table>
</xsl:template>

<xsl:template match="bullist/unlitem" priority="1">
  <table border="0" cellpadding="0" cellspacing="0" style="table-layout: fixed; " class=" x-unlitem-12-0 x--zero-left-margins">
    <xsl:call-template name="t-base-step-table">
      <xsl:with-param name="col1-width" select="'0em'"/>
      <xsl:with-param name="col2-width" select="'15pt'"/>
      <xsl:with-param name="col3-width" select="''"/>
      <xsl:with-param name="label-col"  select="'2'"/>
      <xsl:with-param name="col2-align" select="'left'"/>
      <xsl:with-param name="apply"      select="'&lib-gentxt;'"/>
    </xsl:call-template>
  </table>
</xsl:template>

<xsl:template match="unlitem" priority="0">
  <table border="0" cellpadding="0" cellspacing="0" class=" x-unlitem-13-0 x--zero-left-margins">
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

<xsl:template match="url" priority="0">
      <xsl:param name="hidden" select="'yes'"/>
      <span>
         <!--Emit class values to reflect conditions-->
         <xsl:attribute name="class">
            <xsl:text> x-url-1-0</xsl:text>
         </xsl:attribute>
         <xsl:if test="@xml:lang">
            <xsl:attribute name="lang">
               <xsl:call-template name="return-lang-applying-language-map">
                  <xsl:with-param name="doclang" select="@xml:lang"/>
               </xsl:call-template>
            </xsl:attribute>
         </xsl:if>
         <xsl:copy-of select="@ch:*"/>
         <xsl:copy-of xmlns:dmp="http://www.arbortext.com/namespace/dmp/dmpmap" select="@dmp:*"/>
         <xsl:if test="@xml:lang">
            <xsl:attribute name="lang">
               <xsl:call-template name="return-lang-applying-language-map">
                  <xsl:with-param name="doclang" select="@xml:lang"/>
               </xsl:call-template>
            </xsl:attribute>
         </xsl:if>
         <xsl:call-template name="maybe-set-id"/>
         <!--Suppress element contents (but not gentext) unless unhidden-->
         <xsl:choose>
            <xsl:when test="$hidden='no'">
               <xsl:apply-templates/>
            </xsl:when>
            <xsl:otherwise>
               <xsl:apply-templates select="_sfe:BeforeOrAfterText"/>
            </xsl:otherwise>
         </xsl:choose>
      </span>
   </xsl:template>

<xsl:template name="__style-for__ufe-url-link.1">
      <xsl:text> .x--ufe-url-link-1-0 {margin-left: 0pt; margin-right: 0pt; }</xsl:text>
   </xsl:template>

<xsl:template match="_ufe:url-link" priority="0">
      <span>
         <!--Emit class values to reflect conditions-->
         <xsl:attribute name="class">
            <xsl:text> x--ufe-url-link-1-0</xsl:text>
         </xsl:attribute>
         <xsl:if test="@xml:lang">
            <xsl:attribute name="lang">
               <xsl:call-template name="return-lang-applying-language-map">
                  <xsl:with-param name="doclang" select="@xml:lang"/>
               </xsl:call-template>
            </xsl:attribute>
         </xsl:if>
         <xsl:copy-of select="@ch:*"/>
         <xsl:copy-of xmlns:dmp="http://www.arbortext.com/namespace/dmp/dmpmap" select="@dmp:*"/>
         <xsl:if test="@xml:lang">
            <xsl:attribute name="lang">
               <xsl:call-template name="return-lang-applying-language-map">
                  <xsl:with-param name="doclang" select="@xml:lang"/>
               </xsl:call-template>
            </xsl:attribute>
         </xsl:if>
         <xsl:call-template name="maybe-set-id"/>
         <!--Process this element's content-->
         <xsl:apply-templates/>
      </span>
   </xsl:template>

<xsl:template name="__style-for_validation.1">
      <xsl:text> .x-validation-1-0 {margin-left: 0pt; margin-right: 0pt; }</xsl:text>
   </xsl:template>

<xsl:template match="validation" priority="0">
      <!--Emit a nostyle template-->
      <xsl:apply-templates/>
   </xsl:template>

<xsl:template name="__style-for_warning.12ststng181">
      <xsl:text> .x-warning-1-0 {margin-left: 0pt; margin-right: 0pt; text-indent: 0pt; margin-top: 8pt; font-weight: bold; margin-left: 6.5em; text-indent: -6.5em; }</xsl:text>
   </xsl:template>

<xsl:template match="step//step/warning" priority="11">
      <div>
         <!--Emit class values to reflect conditions-->
         <xsl:attribute name="class">
            <xsl:text> x-warning-1-0</xsl:text>
         </xsl:attribute>
         <xsl:if test="@xml:lang">
            <xsl:attribute name="lang">
               <xsl:call-template name="return-lang-applying-language-map">
                  <xsl:with-param name="doclang" select="@xml:lang"/>
               </xsl:call-template>
            </xsl:attribute>
         </xsl:if>
         <xsl:copy-of select="@ch:*"/>
         <xsl:copy-of xmlns:dmp="http://www.arbortext.com/namespace/dmp/dmpmap" select="@dmp:*"/>
         <xsl:if test="@xml:lang">
            <xsl:attribute name="lang">
               <xsl:call-template name="return-lang-applying-language-map">
                  <xsl:with-param name="doclang" select="@xml:lang"/>
               </xsl:call-template>
            </xsl:attribute>
         </xsl:if>
         <xsl:call-template name="maybe-set-id"/>
         <!--Process this element's content-->
         <xsl:apply-templates/>
      </div>
   </xsl:template>

<xsl:template name="__style-for_warning.12suasng152">
      <xsl:text> .x-warning-2-0 {margin-left: 0pt; margin-right: 0pt; text-indent: 0pt; margin-top: 8pt; margin-left: 83pt; text-indent: -66pt; }</xsl:text>
   </xsl:template>

<xsl:template match="subtask/warning" priority="10">
      <div>
         <!--Emit class values to reflect conditions-->
         <xsl:attribute name="class">
            <xsl:text> x-warning-2-0</xsl:text>
         </xsl:attribute>
         <xsl:if test="@xml:lang">
            <xsl:attribute name="lang">
               <xsl:call-template name="return-lang-applying-language-map">
                  <xsl:with-param name="doclang" select="@xml:lang"/>
               </xsl:call-template>
            </xsl:attribute>
         </xsl:if>
         <xsl:copy-of select="@ch:*"/>
         <xsl:copy-of xmlns:dmp="http://www.arbortext.com/namespace/dmp/dmpmap" select="@dmp:*"/>
         <xsl:if test="@xml:lang">
            <xsl:attribute name="lang">
               <xsl:call-template name="return-lang-applying-language-map">
                  <xsl:with-param name="doclang" select="@xml:lang"/>
               </xsl:call-template>
            </xsl:attribute>
         </xsl:if>
         <xsl:call-template name="maybe-set-id"/>
         <!--Process this element's content-->
         <xsl:apply-templates/>
      </div>
   </xsl:template>

<xsl:template name="__style-for_warning.12n-rang143">
      <xsl:text> .x-warning-3-0 {margin-left: 0pt; margin-right: 0pt; text-indent: 0pt; margin-top: 8pt; font-weight: bold; margin-left: 89pt; text-indent: -65pt; }</xsl:text>
   </xsl:template>

<xsl:template match="n-para/warning" priority="9">
      <div>
         <!--Emit class values to reflect conditions-->
         <xsl:attribute name="class">
            <xsl:text> x-warning-3-0</xsl:text>
         </xsl:attribute>
         <xsl:if test="@xml:lang">
            <xsl:attribute name="lang">
               <xsl:call-template name="return-lang-applying-language-map">
                  <xsl:with-param name="doclang" select="@xml:lang"/>
               </xsl:call-template>
            </xsl:attribute>
         </xsl:if>
         <xsl:copy-of select="@ch:*"/>
         <xsl:copy-of xmlns:dmp="http://www.arbortext.com/namespace/dmp/dmpmap" select="@dmp:*"/>
         <xsl:if test="@xml:lang">
            <xsl:attribute name="lang">
               <xsl:call-template name="return-lang-applying-language-map">
                  <xsl:with-param name="doclang" select="@xml:lang"/>
               </xsl:call-template>
            </xsl:attribute>
         </xsl:if>
         <xsl:call-template name="maybe-set-id"/>
         <!--Process this element's content-->
         <xsl:apply-templates/>
      </div>
   </xsl:template>

<xsl:template name="__style-for_warning.12stwang124">
      <xsl:text> .x-warning-4-0 {margin-left: 0pt; margin-right: 0pt; text-indent: 0pt; margin-top: 8pt; font-weight: bold; margin-left: 86pt; text-indent: -67pt; }</xsl:text>
   </xsl:template>

<xsl:template match="step/warning" priority="8">
      <div>
         <!--Emit class values to reflect conditions-->
         <xsl:attribute name="class">
            <xsl:text> x-warning-4-0</xsl:text>
         </xsl:attribute>
         <xsl:if test="@xml:lang">
            <xsl:attribute name="lang">
               <xsl:call-template name="return-lang-applying-language-map">
                  <xsl:with-param name="doclang" select="@xml:lang"/>
               </xsl:call-template>
            </xsl:attribute>
         </xsl:if>
         <xsl:copy-of select="@ch:*"/>
         <xsl:copy-of xmlns:dmp="http://www.arbortext.com/namespace/dmp/dmpmap" select="@dmp:*"/>
         <xsl:if test="@xml:lang">
            <xsl:attribute name="lang">
               <xsl:call-template name="return-lang-applying-language-map">
                  <xsl:with-param name="doclang" select="@xml:lang"/>
               </xsl:call-template>
            </xsl:attribute>
         </xsl:if>
         <xsl:call-template name="maybe-set-id"/>
         <!--Process this element's content-->
         <xsl:apply-templates/>
      </div>
   </xsl:template>

<xsl:template name="__style-for_warning.12tawang125">
      <xsl:text> .x-warning-5-0 {margin-left: 0pt; margin-right: 0pt; text-indent: 0pt; margin-top: 8pt; margin-left: 83pt; text-indent: -66pt; }</xsl:text>
   </xsl:template>

<xsl:template match="task/warning" priority="7">
      <div>
         <!--Emit class values to reflect conditions-->
         <xsl:attribute name="class">
            <xsl:text> x-warning-5-0</xsl:text>
         </xsl:attribute>
         <xsl:if test="@xml:lang">
            <xsl:attribute name="lang">
               <xsl:call-template name="return-lang-applying-language-map">
                  <xsl:with-param name="doclang" select="@xml:lang"/>
               </xsl:call-template>
            </xsl:attribute>
         </xsl:if>
         <xsl:copy-of select="@ch:*"/>
         <xsl:copy-of xmlns:dmp="http://www.arbortext.com/namespace/dmp/dmpmap" select="@dmp:*"/>
         <xsl:if test="@xml:lang">
            <xsl:attribute name="lang">
               <xsl:call-template name="return-lang-applying-language-map">
                  <xsl:with-param name="doclang" select="@xml:lang"/>
               </xsl:call-template>
            </xsl:attribute>
         </xsl:if>
         <xsl:call-template name="maybe-set-id"/>
         <!--Process this element's content-->
         <xsl:apply-templates/>
      </div>
   </xsl:template>

<xsl:template name="__style-for_warning.12facwng136">
      <xsl:text> .x-warning-6-0 {margin-left: 0pt; margin-right: 0pt; text-indent: 0pt; }</xsl:text>
   </xsl:template>

<xsl:template match="fandc/warning" priority="6">
      <div>
         <!--Emit class values to reflect conditions-->
         <xsl:attribute name="class">
            <xsl:text> x-warning-6-0</xsl:text>
         </xsl:attribute>
         <xsl:if test="@xml:lang">
            <xsl:attribute name="lang">
               <xsl:call-template name="return-lang-applying-language-map">
                  <xsl:with-param name="doclang" select="@xml:lang"/>
               </xsl:call-template>
            </xsl:attribute>
         </xsl:if>
         <xsl:copy-of select="@ch:*"/>
         <xsl:copy-of xmlns:dmp="http://www.arbortext.com/namespace/dmp/dmpmap" select="@dmp:*"/>
         <xsl:if test="@xml:lang">
            <xsl:attribute name="lang">
               <xsl:call-template name="return-lang-applying-language-map">
                  <xsl:with-param name="doclang" select="@xml:lang"/>
               </xsl:call-template>
            </xsl:attribute>
         </xsl:if>
         <xsl:call-template name="maybe-set-id"/>
         <!--Process this element's content-->
         <xsl:apply-templates/>
      </div>
   </xsl:template>

<xsl:template name="__style-for_warning.12sp-ang187">
      <xsl:text> .x-warning-7-0 {margin-left: 0pt; margin-right: 0pt; text-indent: 0pt; }</xsl:text>
   </xsl:template>

<xsl:template match="spec-assem/warning" priority="5">
      <div>
         <!--Emit class values to reflect conditions-->
         <xsl:attribute name="class">
            <xsl:text> x-warning-7-0</xsl:text>
         </xsl:attribute>
         <xsl:if test="@xml:lang">
            <xsl:attribute name="lang">
               <xsl:call-template name="return-lang-applying-language-map">
                  <xsl:with-param name="doclang" select="@xml:lang"/>
               </xsl:call-template>
            </xsl:attribute>
         </xsl:if>
         <xsl:copy-of select="@ch:*"/>
         <xsl:copy-of xmlns:dmp="http://www.arbortext.com/namespace/dmp/dmpmap" select="@dmp:*"/>
         <xsl:if test="@xml:lang">
            <xsl:attribute name="lang">
               <xsl:call-template name="return-lang-applying-language-map">
                  <xsl:with-param name="doclang" select="@xml:lang"/>
               </xsl:call-template>
            </xsl:attribute>
         </xsl:if>
         <xsl:call-template name="maybe-set-id"/>
         <!--Process this element's content-->
         <xsl:apply-templates/>
      </div>
   </xsl:template>

<xsl:template name="__style-for_warning.12spngng238">
      <xsl:text> .x-warning-8-0 {margin-left: 0pt; margin-right: 0pt; text-indent: 0pt; }</xsl:text>
   </xsl:template>

<xsl:template match="spring-pressure/warning" priority="4">
      <div>
         <!--Emit class values to reflect conditions-->
         <xsl:attribute name="class">
            <xsl:text> x-warning-8-0</xsl:text>
         </xsl:attribute>
         <xsl:if test="@xml:lang">
            <xsl:attribute name="lang">
               <xsl:call-template name="return-lang-applying-language-map">
                  <xsl:with-param name="doclang" select="@xml:lang"/>
               </xsl:call-template>
            </xsl:attribute>
         </xsl:if>
         <xsl:copy-of select="@ch:*"/>
         <xsl:copy-of xmlns:dmp="http://www.arbortext.com/namespace/dmp/dmpmap" select="@dmp:*"/>
         <xsl:if test="@xml:lang">
            <xsl:attribute name="lang">
               <xsl:call-template name="return-lang-applying-language-map">
                  <xsl:with-param name="doclang" select="@xml:lang"/>
               </xsl:call-template>
            </xsl:attribute>
         </xsl:if>
         <xsl:call-template name="maybe-set-id"/>
         <!--Process this element's content-->
         <xsl:apply-templates/>
      </div>
   </xsl:template>

<xsl:template name="__style-for_warning.12toueng269">
      <xsl:text> .x-warning-9-0 {margin-left: 0pt; margin-right: 0pt; text-indent: 0pt; }</xsl:text>
   </xsl:template>

<xsl:template match="torque-and-stretch/warning" priority="3">
      <div>
         <!--Emit class values to reflect conditions-->
         <xsl:attribute name="class">
            <xsl:text> x-warning-9-0</xsl:text>
         </xsl:attribute>
         <xsl:if test="@xml:lang">
            <xsl:attribute name="lang">
               <xsl:call-template name="return-lang-applying-language-map">
                  <xsl:with-param name="doclang" select="@xml:lang"/>
               </xsl:call-template>
            </xsl:attribute>
         </xsl:if>
         <xsl:copy-of select="@ch:*"/>
         <xsl:copy-of xmlns:dmp="http://www.arbortext.com/namespace/dmp/dmpmap" select="@dmp:*"/>
         <xsl:if test="@xml:lang">
            <xsl:attribute name="lang">
               <xsl:call-template name="return-lang-applying-language-map">
                  <xsl:with-param name="doclang" select="@xml:lang"/>
               </xsl:call-template>
            </xsl:attribute>
         </xsl:if>
         <xsl:call-template name="maybe-set-id"/>
         <!--Process this element's content-->
         <xsl:apply-templates/>
      </div>
   </xsl:template>

<xsl:template name="__style-for_warning.12fi-ang2310">
      <xsl:text> .x-warning-10-0 {margin-left: 0pt; margin-right: 0pt; text-indent: 0pt; }</xsl:text>
   </xsl:template>

<xsl:template match="fits-and-clears/warning" priority="2">
      <div>
         <!--Emit class values to reflect conditions-->
         <xsl:attribute name="class">
            <xsl:text> x-warning-10-0</xsl:text>
         </xsl:attribute>
         <xsl:if test="@xml:lang">
            <xsl:attribute name="lang">
               <xsl:call-template name="return-lang-applying-language-map">
                  <xsl:with-param name="doclang" select="@xml:lang"/>
               </xsl:call-template>
            </xsl:attribute>
         </xsl:if>
         <xsl:copy-of select="@ch:*"/>
         <xsl:copy-of xmlns:dmp="http://www.arbortext.com/namespace/dmp/dmpmap" select="@dmp:*"/>
         <xsl:if test="@xml:lang">
            <xsl:attribute name="lang">
               <xsl:call-template name="return-lang-applying-language-map">
                  <xsl:with-param name="doclang" select="@xml:lang"/>
               </xsl:call-template>
            </xsl:attribute>
         </xsl:if>
         <xsl:call-template name="maybe-set-id"/>
         <!--Process this element's content-->
         <xsl:apply-templates/>
      </div>
   </xsl:template>

<xsl:template name="__style-for_warning.12wainng2411">
      <xsl:text> .x-warning-11-0 {margin-left: 0pt; margin-right: 0pt; text-indent: 0pt; margin-top: 8pt; font-weight: bold; margin-left: 8.5em; text-indent: -6.5em; }</xsl:text>
   </xsl:template>

<xsl:template match="warning[parent::subpara]" priority="1">
      <div>
         <!--Emit class values to reflect conditions-->
         <xsl:attribute name="class">
            <xsl:text> x-warning-11-0</xsl:text>
         </xsl:attribute>
         <xsl:if test="@xml:lang">
            <xsl:attribute name="lang">
               <xsl:call-template name="return-lang-applying-language-map">
                  <xsl:with-param name="doclang" select="@xml:lang"/>
               </xsl:call-template>
            </xsl:attribute>
         </xsl:if>
         <xsl:copy-of select="@ch:*"/>
         <xsl:copy-of xmlns:dmp="http://www.arbortext.com/namespace/dmp/dmpmap" select="@dmp:*"/>
         <xsl:if test="@xml:lang">
            <xsl:attribute name="lang">
               <xsl:call-template name="return-lang-applying-language-map">
                  <xsl:with-param name="doclang" select="@xml:lang"/>
               </xsl:call-template>
            </xsl:attribute>
         </xsl:if>
         <xsl:call-template name="maybe-set-id"/>
         <!--Process this element's content-->
         <xsl:apply-templates/>
      </div>
   </xsl:template>

<xsl:template name="__style-for_warning.12wainng712">
      <xsl:text> .x-warning-12-0 {margin-left: 0pt; margin-right: 0pt; text-indent: 0pt; margin-top: 8pt; font-weight: bold; margin-left: 6.5em; text-indent: -6.5em; }</xsl:text>
   </xsl:template>

<xsl:template match="warning" priority="0">
      <div>
         <!--Emit class values to reflect conditions-->
         <xsl:attribute name="class">
            <xsl:text> x-warning-12-0</xsl:text>
         </xsl:attribute>
         <xsl:if test="@xml:lang">
            <xsl:attribute name="lang">
               <xsl:call-template name="return-lang-applying-language-map">
                  <xsl:with-param name="doclang" select="@xml:lang"/>
               </xsl:call-template>
            </xsl:attribute>
         </xsl:if>
         <xsl:copy-of select="@ch:*"/>
         <xsl:copy-of xmlns:dmp="http://www.arbortext.com/namespace/dmp/dmpmap" select="@dmp:*"/>
         <xsl:if test="@xml:lang">
            <xsl:attribute name="lang">
               <xsl:call-template name="return-lang-applying-language-map">
                  <xsl:with-param name="doclang" select="@xml:lang"/>
               </xsl:call-template>
            </xsl:attribute>
         </xsl:if>
         <xsl:call-template name="maybe-set-id"/>
         <!--Process this element's content-->
         <xsl:apply-templates/>
      </div>
   </xsl:template>

<xsl:template name="__style-for_xref.8taetef391">
      <xsl:text> .x-xref-1-0 {margin-left: 0pt; margin-right: 0pt; }</xsl:text>
   </xsl:template>

<xsl:template match="table/title/xref[id(@ref)/self::figure]" priority="7">
      <span>
         <!--Emit class values to reflect conditions-->
         <xsl:attribute name="class">
            <xsl:text> x-xref-1-0</xsl:text>
         </xsl:attribute>
         <xsl:if test="@xml:lang">
            <xsl:attribute name="lang">
               <xsl:call-template name="return-lang-applying-language-map">
                  <xsl:with-param name="doclang" select="@xml:lang"/>
               </xsl:call-template>
            </xsl:attribute>
         </xsl:if>
         <xsl:copy-of select="@ch:*"/>
         <xsl:copy-of xmlns:dmp="http://www.arbortext.com/namespace/dmp/dmpmap" select="@dmp:*"/>
         <xsl:if test="@xml:lang">
            <xsl:attribute name="lang">
               <xsl:call-template name="return-lang-applying-language-map">
                  <xsl:with-param name="doclang" select="@xml:lang"/>
               </xsl:call-template>
            </xsl:attribute>
         </xsl:if>
         <xsl:call-template name="maybe-set-id"/>
         <!--Process this element's content-->
         <xsl:apply-templates/>
      </span>
   </xsl:template>

<xsl:template name="__style-for_xref.7loitef382">
      <xsl:text> .x-xref-2-0 {margin-left:
0pt; margin-right: 0pt; }</xsl:text>
   </xsl:template>

<xsl:template match="lof-item//xref[id(@ref)[name() = 'graphic']]" priority="5">
      <span>
         <!--Emit class values to reflect conditions-->
         <xsl:attribute name="class">
            <xsl:text> x-xref-2-0</xsl:text>
         </xsl:attribute>
         <xsl:if test="@xml:lang">
            <xsl:attribute name="lang">
               <xsl:call-template name="return-lang-applying-language-map">
                  <xsl:with-param name="doclang" select="@xml:lang"/>
               </xsl:call-template>
            </xsl:attribute>
         </xsl:if>
         <xsl:copy-of select="@ch:*"/>
         <xsl:copy-of xmlns:dmp="http://www.arbortext.com/namespace/dmp/dmpmap" select="@dmp:*"/>
         <xsl:if test="@xml:lang">
            <xsl:attribute name="lang">
               <xsl:call-template name="return-lang-applying-language-map">
                  <xsl:with-param name="doclang" select="@xml:lang"/>
               </xsl:call-template>
            </xsl:attribute>
         </xsl:if>
         <xsl:call-template name="maybe-set-id"/>
         <!--Process this element's content-->
         <a>
            <xsl:attribute name="href">
               <xsl:text>#styler-id</xsl:text>
               <xsl:apply-templates mode="set-id" select="."/>
            </xsl:attribute>
            <xsl:attribute name="onClick">
               <xsl:text>displayGraphicsNav('</xsl:text>
               <xsl:choose>
                  <xsl:when test="ancestor::ata-page-block">
                     <xsl:value-of select="concat(ancestor::ata-page-block/@object-key, '.html')"/>
                  </xsl:when>
                  <xsl:otherwise>
                     <xsl:value-of select="concat(ancestor::page-block/@object-key, '.html')"/>
                  </xsl:otherwise>
               </xsl:choose>
               <xsl:text>','styler-id</xsl:text>
               <xsl:apply-templates mode="set-id" select="id(@ref)"/>
               <xsl:text>');</xsl:text>
            </xsl:attribute>
            <xsl:text>GRAPHICNAVLINK^</xsl:text>
            <xsl:choose>
               <xsl:when test="ancestor::ata-page-block">
                  <xsl:value-of select="concat(ancestor::ata-page-block/@object-key, '.html')"/>
               </xsl:when>
               <xsl:otherwise>
                  <xsl:value-of select="concat(ancestor::page-block/@object-key, '.html')"/>
               </xsl:otherwise>
            </xsl:choose>
            <xsl:text>^</xsl:text>
            <xsl:text>styler-id</xsl:text>
            <xsl:apply-templates mode="set-id" select="id(@ref)"/>
            <xsl:text>^</xsl:text>
            <xsl:apply-templates mode="numbering" select="id(@ref)"> </xsl:apply-templates>
         </a>
      </span>
   </xsl:template>

<xsl:template name="__style-for_xref.4loitef371">
      <xsl:text> .x-xref-1-0 {margin-left:
0pt; margin-right: 0pt; }</xsl:text>
   </xsl:template>

<xsl:template match="lof-item//xref[id(@ref)[name() = 'figure']]" priority="16">
      <span xmlns:dmp="http://www.arbortext.com/namespace/dmp/dmpmap" style="display:none">
         <!--Emit class values to reflect conditions -->
         <xsl:attribute name="class">
            <xsl:text> x-xref-1-0</xsl:text>
         </xsl:attribute>
         <xsl:copy-of select="@ch:*"/>
         <xsl:copy-of select="@dmp:*"/>
         <xsl:call-template name="maybe-set-id"/>
         <!--Process this element's content -->
         <a>
            <xsl:attribute name="href">
               <xsl:text>#styler-id</xsl:text>
               <xsl:apply-templates mode="set-id" select="."/>
            </xsl:attribute>
            <xsl:attribute name="onClick">
               <xsl:text>displayGraphicsNav('</xsl:text>
               <xsl:choose>
                  <xsl:when test="ancestor::ata-page-block">
                     <xsl:value-of select="concat(ancestor::ata-page-block/@object-key, '.html')"/>
                  </xsl:when>
                  <xsl:otherwise>
                     <xsl:value-of select="concat(ancestor::page-block/@object-key, '.html')"/>
                  </xsl:otherwise>
               </xsl:choose>
               <xsl:text>','styler-id</xsl:text>
               <xsl:apply-templates mode="set-id" select="id(@ref)"/>
               <xsl:text>');</xsl:text>
            </xsl:attribute>
            <xsl:text>GRAPHICNAVLINK^</xsl:text>
            <xsl:choose>
               <xsl:when test="ancestor::ata-page-block">
                  <xsl:value-of select="concat(ancestor::ata-page-block/@object-key, '.html')"/>
               </xsl:when>
               <xsl:otherwise>
                  <xsl:value-of select="concat(ancestor::page-block/@object-key, '.html')"/>
               </xsl:otherwise>
            </xsl:choose>
            <xsl:text>^</xsl:text>
            <xsl:text>styler-id</xsl:text>
            <xsl:apply-templates mode="set-id" select="id(@ref)"/>
            <xsl:text>^</xsl:text>
            <xsl:apply-templates mode="numbering" select="id(@ref)"> </xsl:apply-templates>
         </a>
      </span>
   </xsl:template>

<xsl:template name="__style-for_xref.8hilief164">
      <xsl:text> .x-xref-4-0 {margin-left: 0pt; margin-right: 0pt; }</xsl:text>
   </xsl:template>

<xsl:template match="highlights//xref" priority="4">
      <xsl:param name="hidden" select="'yes'"/>
      <span>
         <!--Emit class values to reflect conditions-->
         <xsl:attribute name="class">
            <xsl:text> x-xref-4-0</xsl:text>
         </xsl:attribute>
         <xsl:if test="@xml:lang">
            <xsl:attribute name="lang">
               <xsl:call-template name="return-lang-applying-language-map">
                  <xsl:with-param name="doclang" select="@xml:lang"/>
               </xsl:call-template>
            </xsl:attribute>
         </xsl:if>
         <xsl:copy-of select="@ch:*"/>
         <xsl:copy-of xmlns:dmp="http://www.arbortext.com/namespace/dmp/dmpmap" select="@dmp:*"/>
         <xsl:if test="@xml:lang">
            <xsl:attribute name="lang">
               <xsl:call-template name="return-lang-applying-language-map">
                  <xsl:with-param name="doclang" select="@xml:lang"/>
               </xsl:call-template>
            </xsl:attribute>
         </xsl:if>
         <xsl:call-template name="maybe-set-id"/>
         <!--Suppress element contents (but not gentext) unless unhidden-->
         <xsl:choose>
            <xsl:when test="$hidden='no'">
               <xsl:apply-templates/>
            </xsl:when>
            <xsl:otherwise>
               <xsl:apply-templates select="_sfe:BeforeOrAfterText"/>
            </xsl:otherwise>
         </xsl:choose>
      </span>
   </xsl:template>

<xsl:template name="__style-for_xref.8xref905">
      <xsl:text> .x-xref-5-0 {margin-left: 0pt; margin-right: 0pt; }</xsl:text>
   </xsl:template>

<xsl:template match="xref[name(id(@ref))='table' and (id(@ref)/ancestor::figure or id(@ref)/ancestor::graphic)]" priority="3">
      <span>
         <!--Emit class values to reflect conditions-->
         <xsl:attribute name="class">
            <xsl:text> x-xref-5-0</xsl:text>
         </xsl:attribute>
         <xsl:if test="@xml:lang">
            <xsl:attribute name="lang">
               <xsl:call-template name="return-lang-applying-language-map">
                  <xsl:with-param name="doclang" select="@xml:lang"/>
               </xsl:call-template>
            </xsl:attribute>
         </xsl:if>
         <xsl:copy-of select="@ch:*"/>
         <xsl:copy-of xmlns:dmp="http://www.arbortext.com/namespace/dmp/dmpmap" select="@dmp:*"/>
         <xsl:if test="@xml:lang">
            <xsl:attribute name="lang">
               <xsl:call-template name="return-lang-applying-language-map">
                  <xsl:with-param name="doclang" select="@xml:lang"/>
               </xsl:call-template>
            </xsl:attribute>
         </xsl:if>
         <xsl:call-template name="maybe-set-id"/>
         <!--Process this element's content-->
         <xsl:apply-templates/>
      </span>
   </xsl:template>

<xsl:template name="__style-for_xref.8xref266">
      <xsl:text> .x-xref-6-0 {margin-left: 0pt; margin-right: 0pt; }</xsl:text>
   </xsl:template>

<xsl:template match="xref[id(@ref)/self::table]" priority="2">
      <span>
         <!--Emit class values to reflect conditions-->
         <xsl:attribute name="class">
            <xsl:text> x-xref-6-0</xsl:text>
         </xsl:attribute>
         <xsl:if test="@xml:lang">
            <xsl:attribute name="lang">
               <xsl:call-template name="return-lang-applying-language-map">
                  <xsl:with-param name="doclang" select="@xml:lang"/>
               </xsl:call-template>
            </xsl:attribute>
         </xsl:if>
         <xsl:copy-of select="@ch:*"/>
         <xsl:copy-of xmlns:dmp="http://www.arbortext.com/namespace/dmp/dmpmap" select="@dmp:*"/>
         <xsl:if test="@xml:lang">
            <xsl:attribute name="lang">
               <xsl:call-template name="return-lang-applying-language-map">
                  <xsl:with-param name="doclang" select="@xml:lang"/>
               </xsl:call-template>
            </xsl:attribute>
         </xsl:if>
         <xsl:call-template name="maybe-set-id"/>
         <!--Process this element's content-->
         <xsl:apply-templates/>
      </span>
   </xsl:template>

<xsl:template name="__style-for_xref.7xref276">
      <xsl:text> .x-xref-6-0 {margin-left:
0pt; margin-right: 0pt; }</xsl:text>
   </xsl:template>

<xsl:template match="xref[id(@ref)/self::figure]" priority="1">
      <span>
         <!--Emit class values to reflect conditions-->
         <xsl:attribute name="class">
            <xsl:text> x-xref-6-0</xsl:text>
         </xsl:attribute>
         <xsl:if test="@xml:lang">
            <xsl:attribute name="lang">
               <xsl:call-template name="return-lang-applying-language-map">
                  <xsl:with-param name="doclang" select="@xml:lang"/>
               </xsl:call-template>
            </xsl:attribute>
         </xsl:if>
         <xsl:copy-of select="@ch:*"/>
         <xsl:copy-of xmlns:dmp="http://www.arbortext.com/namespace/dmp/dmpmap" select="@dmp:*"/>
         <xsl:if test="@xml:lang">
            <xsl:attribute name="lang">
               <xsl:call-template name="return-lang-applying-language-map">
                  <xsl:with-param name="doclang" select="@xml:lang"/>
               </xsl:call-template>
            </xsl:attribute>
         </xsl:if>
         <xsl:call-template name="maybe-set-id"/>
         <!--Process this element's content-->
         <a>
            <!--<xsl:attribute name="href">              
          <xsl:text>#styler-id</xsl:text> 
                       <xsl:apply-templates
mode="set-id" select="."></xsl:apply-templates
>                   </xsl:attribute>-->
            <xsl:attribute name="href">
               <xsl:text>#none</xsl:text>
            </xsl:attribute>
            <xsl:attribute name="onClick">
               <xsl:text>displayGraphics('</xsl:text>
               <xsl:text>styler-id</xsl:text>
               <xsl:apply-templates mode="set-id" select="id(@ref)"> </xsl:apply-templates>
               <xsl:text>');</xsl:text>
            </xsl:attribute>
            <xsl:text> </xsl:text>
            <xsl:apply-templates mode="styler_numbering" select="id(@ref)//title"/>
         </a>
      </span>
   </xsl:template>

<xsl:template name="__style-for_xref.8xref48">
      <xsl:text> .x-xref-8-0 {margin-left: 0pt; margin-right: 0pt; }</xsl:text>
   </xsl:template>

<xsl:template match="xref" priority="0">
      <span>
         <!--Emit class values to reflect conditions-->
         <xsl:attribute name="class">
            <xsl:text> x-xref-8-0</xsl:text>
         </xsl:attribute>
         <xsl:if test="@xml:lang">
            <xsl:attribute name="lang">
               <xsl:call-template name="return-lang-applying-language-map">
                  <xsl:with-param name="doclang" select="@xml:lang"/>
               </xsl:call-template>
            </xsl:attribute>
         </xsl:if>
         <xsl:copy-of select="@ch:*"/>
         <xsl:copy-of xmlns:dmp="http://www.arbortext.com/namespace/dmp/dmpmap" select="@dmp:*"/>
         <xsl:if test="@xml:lang">
            <xsl:attribute name="lang">
               <xsl:call-template name="return-lang-applying-language-map">
                  <xsl:with-param name="doclang" select="@xml:lang"/>
               </xsl:call-template>
            </xsl:attribute>
         </xsl:if>
         <xsl:call-template name="maybe-set-id"/>
         <!--Process this element's content-->
         <xsl:apply-templates/>
      </span>
   </xsl:template>

<xsl:template name="__style-for_zip.1">
      <xsl:text> .x-zip-1-0 {margin-left: 0pt; margin-right: 0pt; } .x-zip-1-1 {}</xsl:text>
   </xsl:template>

<xsl:template match="zip" priority="0">
      <xsl:variable name="foClass">inline</xsl:variable>
      <xsl:variable name="blockness">inline</xsl:variable>
      <span>
         <!--Emit class values to reflect conditions-->
         <xsl:attribute name="class">
            <xsl:text> x-zip-1-0</xsl:text>
            <xsl:if test="not(./*[not(self::_sfe:BeforeOrAfterText)]|./text()[normalize-space(.)!=''])"> x-zip-1-1</xsl:if>
         </xsl:attribute>
         <xsl:if test="@xml:lang">
            <xsl:attribute name="lang">
               <xsl:call-template name="return-lang-applying-language-map">
                  <xsl:with-param name="doclang" select="@xml:lang"/>
               </xsl:call-template>
            </xsl:attribute>
         </xsl:if>
         <xsl:copy-of select="@ch:*"/>
         <xsl:copy-of xmlns:dmp="http://www.arbortext.com/namespace/dmp/dmpmap" select="@dmp:*"/>
         <xsl:variable name="Breaks-chunkFilenameXPath"/>
         <xsl:variable name="Breaks-persistentFilename"/>
         <xsl:if test="($Breaks-persistentFilename='yes') and ($Breaks-chunkFilenameXPath!='')">
            <xsl:variable name="chunkFilename"/>
            <xsl:if test="$chunkFilename!=''">
               <xsl:attribute name="ch:filename">
                  <xsl:value-of select="$chunkFilename"/>
               </xsl:attribute>
               <xsl:attribute name="ch:namepriority">0</xsl:attribute>
            </xsl:if>
         </xsl:if>
         <xsl:if test="@xml:lang">
            <xsl:attribute name="lang">
               <xsl:call-template name="return-lang-applying-language-map">
                  <xsl:with-param name="doclang" select="@xml:lang"/>
               </xsl:call-template>
            </xsl:attribute>
         </xsl:if>
         <xsl:call-template name="maybe-set-id"/>
         <!--Process this element's content-->
         <xsl:apply-templates/>
      </span>
   </xsl:template>

<xsl:include href="ext/tbls.xsl"/>

<xsl:include href="ext/html-tbls.xsl"/>

<xsl:template name="substring-before-last-occurrence">
      <xsl:param name="full-string"/>
      <xsl:param name="search-string"/>
      <xsl:variable name="front" select="substring-before($full-string,$search-string)"/>
      <xsl:variable name="back" select="substring-after($full-string,$search-string)"/>
      <xsl:choose>
         <xsl:when test="not(contains($back,$search-string))">
            <xsl:value-of select="$front"/>
         </xsl:when>
         <xsl:otherwise>
            <xsl:value-of select="$front"/>
            <xsl:value-of select="$search-string"/>
            <xsl:call-template name="substring-before-last-occurrence">
               <xsl:with-param name="full-string" select="$back"/>
               <xsl:with-param name="search-string" select="$search-string"/>
            </xsl:call-template>
         </xsl:otherwise>
      </xsl:choose>
   </xsl:template>

<xsl:template name="return-matching-lang-within-targets">
      <xsl:param name="doclang"/>
      <xsl:param name="target-langs"/>
      <xsl:variable name="lc-doclang" select="translate($doclang,'ABCDEFGHIJKLMNOPQRSTUVWXYZ','abcdefghijklmnopqrstuvwxyz')"/>
      <xsl:variable name="lc-target-langs" select="translate($target-langs,'ABCDEFGHIJKLMNOPQRSTUVWXYZ','abcdefghijklmnopqrstuvwxyz')"/>
      <xsl:choose>
         <xsl:when test="contains($lc-target-langs,concat(' ',$lc-doclang,' '))">
            <xsl:value-of select="$lc-doclang"/>
         </xsl:when>
         <xsl:when test="contains($doclang,'-')">
            <xsl:call-template name="return-matching-lang-within-targets">
               <xsl:with-param name="doclang">
                  <xsl:call-template name="substring-before-last-occurrence">
                     <xsl:with-param name="full-string" select="$doclang"/>
                     <xsl:with-param name="search-string" select="'-'"/>
                  </xsl:call-template>
               </xsl:with-param>
               <xsl:with-param name="target-langs" select="$target-langs"/>
            </xsl:call-template>
         </xsl:when>
      </xsl:choose>
   </xsl:template>

<xsl:template name="return-lang-applying-language-map">
      <xsl:param name="doclang"/>
      <xsl:variable name="lc-doclang" select="translate($doclang,'ABCDEFGHIJKLMNOPQRSTUVWXYZ','abcdefghijklmnopqrstuvwxyz')"/>
      <xsl:choose>
         <xsl:when test="$lc-doclang='en'">
            <xsl:value-of select="'en-US'"/>
         </xsl:when>
         <xsl:when test="$lc-doclang='de'">
            <xsl:value-of select="'de-1996'"/>
         </xsl:when>
         <xsl:otherwise>
            <xsl:value-of select="$doclang"/>
         </xsl:otherwise>
      </xsl:choose>
   </xsl:template>

<xsl:template name="maybe-set-gte-id_save">
      <xsl:if test="not(@_gte:id)">
         <xsl:variable name="context-node" select="."/>
         <xsl:variable name="this-elements-real-id">
            <xsl:choose>
               <xsl:when test="@xml:id">
                  <xsl:value-of select="@xml:id"/>
               </xsl:when>
               <xsl:otherwise>
                  <xsl:for-each select="@*">
                     <xsl:variable name="can-call-generate-id">
                        <xsl:choose>
                           <xsl:when test="$using-msxsl">
                              <xsl:call-template name="can-call-generate-id"/>
                           </xsl:when>
                           <xsl:otherwise>true</xsl:otherwise>
                        </xsl:choose>
                     </xsl:variable>
                     <xsl:if test="$can-call-generate-id='true'">
                        <xsl:if test="generate-id(id(.)) = generate-id($context-node)">
                           <xsl:value-of select="."/>
                        </xsl:if>
                     </xsl:if>
                  </xsl:for-each>
               </xsl:otherwise>
            </xsl:choose>
         </xsl:variable>
         <xsl:attribute name="_gte:id">
            <xsl:choose>
               <xsl:when test="$this-elements-real-id!=''">
                  <xsl:value-of select="$this-elements-real-id"/>
               </xsl:when>
               <xsl:otherwise>
                  <xsl:value-of select="'_g_'"/>
                  <xsl:value-of select="generate-id($context-node)"/>
               </xsl:otherwise>
            </xsl:choose>
         </xsl:attribute>
         <xsl:if test="$this-elements-real-id!=''">
            <xsl:attribute name="xml:id">
               <xsl:value-of select="$this-elements-real-id"/>
            </xsl:attribute>
         </xsl:if>
      </xsl:if>
   </xsl:template>

<xsl:template name="maybe-set-gte-id">
  <xsl:attribute name="_gte:id">
    <xsl:choose>
      <xsl:when test="@id"><xsl:value-of select="@id"/></xsl:when>
      <xsl:otherwise><xsl:value-of select="concat('_g_',generate-id(.))"/></xsl:otherwise>
    </xsl:choose>
  </xsl:attribute>
</xsl:template>

<xsl:variable name="name-start-chars" select="'ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz_:'"/>

<xsl:variable name="using-msxsl" select="function-available('msxsl:node-set')"/>

<xsl:template name="can-call-generate-id">
      <xsl:param name="str" select="."/>
      <xsl:choose>
         <xsl:when test="not($using-msxsl)">
            <!--Not using MSXSL, so generate-id() on this value shouldn't give an error-->
            <xsl:text>true</xsl:text>
         </xsl:when>
         <xsl:when test="not(contains($name-start-chars,substring($str,1,1)))">
            <xsl:text>false</xsl:text>
         </xsl:when>
         <xsl:when test="contains($str,'/')">
            <xsl:text>false</xsl:text>
         </xsl:when>
         <xsl:when test="contains($str,'@')">
            <xsl:text>false</xsl:text>
         </xsl:when>
         <xsl:when test="contains($str,'#')">
            <xsl:text>false</xsl:text>
         </xsl:when>
         <xsl:otherwise>true</xsl:otherwise>
      </xsl:choose>
   </xsl:template>

<xsl:template name="maybe-set-id_save">
      <xsl:param name="attrname" select="'id'"/>
      <xsl:param name="only-if-id-attr" select="'yes'"/>
      <xsl:param name="check-for-real-id-attr" select="'no'"/>
      <xsl:param name="generated-id-prefix" select="$pf-id"/>
      <xsl:param name="context-node" select="."/>
      <xsl:if test="not(ancestor::_sfe:HeaderOrFooter)">
         <xsl:variable name="real-id-attr-value">
            <xsl:if test="$check-for-real-id-attr='yes'">
               <xsl:for-each select="$context-node/@*">
                  <xsl:if test="generate-id(id(.)) = generate-id($context-node)">
                     <xsl:value-of select="."/>
                  </xsl:if>
               </xsl:for-each>
            </xsl:if>
         </xsl:variable>
         <xsl:choose>
            <xsl:when test="$context-node/@_gte:id!='' and not(starts-with($context-node/@_gte:id,'_g_'))">
               <xsl:attribute name="{$attrname}">
                  <xsl:value-of select="$context-node/@_gte:id"/>
               </xsl:attribute>
            </xsl:when>
            <xsl:when test="$real-id-attr-value!=''">
               <xsl:attribute name="{$attrname}">
                  <xsl:value-of select="$real-id-attr-value"/>
               </xsl:attribute>
            </xsl:when>
            <xsl:when test="$only-if-id-attr!='yes'">
               <xsl:attribute name="{$attrname}">
                  <xsl:value-of select="$generated-id-prefix"/>
                  <xsl:if test="namespace-uri($context-node)='http://www.arbortext.com/namespace/Styler/UserFormattingElements'">u</xsl:if>
                  <xsl:apply-templates select="$context-node" mode="set-id"/>
               </xsl:attribute>
            </xsl:when>
         </xsl:choose>
      </xsl:if>
   </xsl:template>

<xsl:template name="maybe-set-id">
  <xsl:param name="only-if-id-attr" select="'yes'"/>
  <xsl:param name="generated-id-prefix" select="$pf-id"/>  
  
  <xsl:choose>
    <xsl:when test="@id"><xsl:copy-of select="@id"/></xsl:when>
    <xsl:when test="$only-if-id-attr!='yes'">
      <xsl:attribute name="id">
        <xsl:value-of select="$generated-id-prefix"/>
        <xsl:apply-templates select="." mode="set-id"/>
      </xsl:attribute>
    </xsl:when>
  </xsl:choose>
</xsl:template>

<xsl:param name="show-gtes" select="'yes'"/>

<xsl:template match="_gte:*">
      <!--It is probably an error for this template to be called-->
      <xsl:choose>
         <xsl:when test="$show-gtes='yes'">
            <!--For debugging, show the tagging in the output-->
            <span xsl:use-attribute-sets="unstyled..basestyle">
               <xsl:text xmlns:fo="http://www.w3.org/1999/XSL/Format">&lt;</xsl:text>
               <xsl:value-of select="name(.)"/>
               <xsl:for-each xmlns:fo="http://www.w3.org/1999/XSL/Format" select="@*">
                  <xsl:text/>
                  <xsl:value-of select="name(.)"/>
                  <xsl:text>="</xsl:text>
                  <xsl:value-of select="."/>
                  <xsl:text>"</xsl:text>
               </xsl:for-each>
               <xsl:text xmlns:fo="http://www.w3.org/1999/XSL/Format">&gt;</xsl:text>
               <xsl:apply-templates xmlns:fo="http://www.w3.org/1999/XSL/Format"/>
               <xsl:text xmlns:fo="http://www.w3.org/1999/XSL/Format">&lt;/</xsl:text>
               <xsl:value-of select="name(.)"/>
               <xsl:text xmlns:fo="http://www.w3.org/1999/XSL/Format">&gt;</xsl:text>
            </span>
         </xsl:when>
         <xsl:otherwise>
            <xsl:apply-templates/>
         </xsl:otherwise>
      </xsl:choose>
   </xsl:template>

<xsl:template match="_gte:FootnoteBody" priority="-0.2"/>

<xsl:template match="_gte:FootnoteBody//processing-instruction('Pub')[starts-with(., '_font') or starts-with(., '/_font')]" priority="2"/>

<xsl:template match="_gte:FootnoteBody//processing-instruction('Pub')[starts-with(., '_newline') or starts-with(., '_newcolumn') or starts-with(., '_newpage')]" priority="2"/>

<xsl:template match="_gte:FootnoteBody//processing-instruction('Pub')[starts-with(., '_nolinebreak') or starts-with(., '/_nolinebreak')]" priority="2"/>

<xsl:template match="_gte:Gentexted-Content-Wrapper//processing-instruction('Pub')[starts-with(., '_font') or starts-with(., '/_font')]" priority="2">
      <!--handle-pub-processing-instruction is defined in lib/xsl/{fo,html}/pi.xsl-->
      <xsl:call-template name="handle-pub-processing-instruction">
         <xsl:with-param name="within-gentext" select="true()"/>
      </xsl:call-template>
   </xsl:template>

<xsl:template match="_gte:Gentexted-Content-Wrapper//processing-instruction('Pub')[starts-with(., '_newline') or starts-with(., '_newcolumn') or starts-with(., '_newpage')]" priority="2"/>

<xsl:template match="_gte:Gentexted-Content-Wrapper//processing-instruction('Pub')[starts-with(., '_nolinebreak') or starts-with(., '/_nolinebreak')]" priority="2"/>

<xsl:template match="_gte:Gentexted-Content-Wrapper">
      <xsl:apply-templates/>
   </xsl:template>

<xsl:template match="_gte:deferredCrossReference"/>

<xsl:template name="handle-gte-font-attrs">
      <xsl:call-template name="gte-font-attribute">
         <xsl:with-param name="attrval" select="string(@TypeSize)"/>
         <xsl:with-param name="fontattr">font-size</xsl:with-param>
      </xsl:call-template>
      <xsl:call-template name="gte-font-offset">
         <xsl:with-param name="attrval" select="string(@Offset)"/>
         <xsl:with-param name="fontattr">baseline-shift</xsl:with-param>
      </xsl:call-template>
      <xsl:call-template name="gte-font-attribute">
         <xsl:with-param name="attrval">
            <xsl:variable name="family" select="string(@FamName)"/>
            <xsl:variable name="apos">'</xsl:variable>
            <xsl:choose>
               <xsl:when test="$family = 'Serif'">serif</xsl:when>
               <xsl:when test="$family = 'Sanserif'">sans-serif</xsl:when>
               <xsl:when test="$family = 'Monospace'">monospace</xsl:when>
               <xsl:when test="contains($family,' ') and not(contains($family,$apos))">
                  <xsl:value-of select="concat($apos,$family,$apos)"/>
               </xsl:when>
               <xsl:otherwise>
                  <xsl:value-of select="$family"/>
               </xsl:otherwise>
            </xsl:choose>
         </xsl:with-param>
         <xsl:with-param name="fontattr">font-family</xsl:with-param>
      </xsl:call-template>
      <xsl:call-template name="gte-font-posture">
         <xsl:with-param name="attrval" select="string(@Posture)"/>
         <xsl:with-param name="fontattr">font-style</xsl:with-param>
      </xsl:call-template>
      <xsl:call-template name="gte-font-weight">
         <xsl:with-param name="attrval" select="string(@Weight)"/>
         <xsl:with-param name="fontattr">font-weight</xsl:with-param>
      </xsl:call-template>
      <xsl:call-template name="gte-font-style">
         <xsl:with-param name="attrval" select="string(@FontStyle)"/>
         <xsl:with-param name="fontattr">font-family</xsl:with-param>
      </xsl:call-template>
      <xsl:call-template name="gte-font-color">
         <xsl:with-param name="attrval" select="string(@FontColor)"/>
         <xsl:with-param name="fontattr">color</xsl:with-param>
      </xsl:call-template>
      <xsl:call-template name="gte-font-backcolor">
         <xsl:with-param name="attrval" select="string(@BackColor)"/>
         <xsl:with-param name="fontattr">background-color</xsl:with-param>
      </xsl:call-template>
      <xsl:call-template name="gte-font-keepline">
         <xsl:with-param name="attrval" select="string(@KeepLine)"/>
         <xsl:with-param name="fontattr">keep-together.within-line</xsl:with-param>
      </xsl:call-template>
      <xsl:call-template name="gte-font-scorespaces">
         <xsl:with-param name="attrval" select="string(@ScoreSpace)"/>
         <xsl:with-param name="fontattr">score-spaces</xsl:with-param>
      </xsl:call-template>
      <xsl:call-template name="gte-font-allcaps">
         <xsl:with-param name="attrval" select="string(@AllCap)"/>
         <xsl:with-param name="fontattr">text-transform</xsl:with-param>
      </xsl:call-template>
      <xsl:call-template name="gte-font-smallcaps">
         <xsl:with-param name="attrval" select="string(@SmallCap)"/>
         <xsl:with-param name="fontattr">font-variant</xsl:with-param>
      </xsl:call-template>
      <xsl:call-template name="gte-font-text-decoration">
         <xsl:with-param name="underline">
            <xsl:call-template name="gte-font-underline">
               <xsl:with-param name="attrval" select="string(@Underline)"/>
            </xsl:call-template>
         </xsl:with-param>
         <xsl:with-param name="strikethru">
            <xsl:call-template name="gte-font-strikethru">
               <xsl:with-param name="attrval" select="string(@ScoreCharOn)"/>
            </xsl:call-template>
         </xsl:with-param>
         <xsl:with-param name="fontattr">text-decoration</xsl:with-param>
      </xsl:call-template>
   </xsl:template>

<xsl:template name="gte-font-attribute">
      <xsl:param name="attrval"/>
      <xsl:param name="fontattr"/>
      <xsl:if test="$attrval!=''">
         <xsl:call-template name="set-property">
            <xsl:with-param name="prop-name" select="$fontattr"/>
            <xsl:with-param name="prop-value" select="$attrval"/>
         </xsl:call-template>
      </xsl:if>
   </xsl:template>

<xsl:param name="bg_colorizer" select="'&#34;bgreen=#C0FFC0; gray3=#D0D0D0; green=#C0FFC0; lime=#E0FFE0; bviolet=#FFC0FF; gray4=#C0C0C0; maroon=#C08080; navy=#A0A0C0; bred=#FFC0CB; borange=#FFC097; gray5=#B0B0B0; olive=#D0D000; red=#FFC0CB; byellow=#FFFFC0; bwhite=#FFFFFF; bbrown=#DEB887; bblack=#808080; black=#808080; brown=#DEB887; teal=#00E0E0; violet=#FFC0FF; white=#FFFFFF; bblue=#C0C0FF; blue=#C0C0FF; orange=#FFC097; transparent=transparent; aqua=#D0FFFF; gray1=#F0F0F0; bgray=#D0D0D0; gray2=#E0E0E0; gray=#D0D0D0; yellow=#FFFFC0;&#34;'"/>

<xsl:template name="gte-font-posture">
      <xsl:param name="attrval"/>
      <xsl:param name="fontattr"/>
      <xsl:variable name="replval">
         <xsl:choose>
            <xsl:when test="$attrval='upright'">normal</xsl:when>
            <xsl:when test="$attrval=''"/>
            <xsl:otherwise>
               <xsl:value-of select="$attrval"/>
            </xsl:otherwise>
         </xsl:choose>
      </xsl:variable>
      <xsl:if test="$replval!=''">
         <xsl:call-template name="set-property">
            <xsl:with-param name="prop-name" select="$fontattr"/>
            <xsl:with-param name="prop-value" select="$replval"/>
         </xsl:call-template>
      </xsl:if>
   </xsl:template>

<xsl:template name="gte-font-weight">
      <xsl:param name="attrval"/>
      <xsl:param name="fontattr"/>
      <xsl:variable name="replval">
         <xsl:choose>
            <xsl:when test="$attrval='medium'">normal</xsl:when>
            <xsl:when test="$attrval=''"/>
            <xsl:otherwise>
               <xsl:value-of select="$attrval"/>
            </xsl:otherwise>
         </xsl:choose>
      </xsl:variable>
      <xsl:if test="$replval!=''">
         <xsl:call-template name="set-property">
            <xsl:with-param name="prop-name" select="$fontattr"/>
            <xsl:with-param name="prop-value" select="$replval"/>
         </xsl:call-template>
      </xsl:if>
   </xsl:template>

<xsl:template name="gte-font-style">
      <xsl:param name="attrval"/>
      <xsl:param name="fontattr"/>
      <xsl:variable name="replval">
         <xsl:choose>
            <xsl:when test="$attrval='serifed'">serif</xsl:when>
            <xsl:when test="$attrval='sans-serif'">sans-serif</xsl:when>
            <xsl:when test="$attrval='monospaced-serifed'">monospace</xsl:when>
            <xsl:when test="$attrval='monospaced-sans-serif'">monospace</xsl:when>
            <xsl:otherwise/>
         </xsl:choose>
      </xsl:variable>
      <xsl:if test="$replval!=''">
         <xsl:call-template name="set-property">
            <xsl:with-param name="prop-name" select="$fontattr"/>
            <xsl:with-param name="prop-value" select="$replval"/>
         </xsl:call-template>
      </xsl:if>
   </xsl:template>

<xsl:template name="gte-font-color">
      <xsl:param name="attrval"/>
      <xsl:param name="fontattr"/>
      <xsl:variable name="replval">
         <xsl:choose>
            <xsl:when test="$attrval=''"/>
            <xsl:when test="starts-with($attrval,'#')">
               <xsl:value-of select="$attrval"/>
            </xsl:when>
            <xsl:when test="contains($fg_colorizer,$attrval)">
               <xsl:value-of select="substring-before(substring-after($fg_colorizer,concat($attrval,'=')),';')"/>
            </xsl:when>
            <xsl:otherwise/>
         </xsl:choose>
      </xsl:variable>
      <xsl:if test="$replval!=''">
         <xsl:choose>
            <xsl:when test="$attrval='transparent'">
               <xsl:call-template name="set-property">
                  <xsl:with-param name="prop-name" select="'visibility'"/>
                  <xsl:with-param name="prop-value" select="'hidden'"/>
               </xsl:call-template>
            </xsl:when>
            <xsl:otherwise>
               <xsl:call-template name="set-property">
                  <xsl:with-param name="prop-name" select="$fontattr"/>
                  <xsl:with-param name="prop-value" select="$replval"/>
               </xsl:call-template>
            </xsl:otherwise>
         </xsl:choose>
      </xsl:if>
   </xsl:template>

<xsl:template name="gte-font-backcolor">
      <xsl:param name="attrval"/>
      <xsl:param name="fontattr"/>
      <xsl:variable name="replval">
         <xsl:choose>
            <xsl:when test="$attrval=''"/>
            <xsl:when test="starts-with($attrval,'#')">
               <xsl:value-of select="$attrval"/>
            </xsl:when>
            <xsl:when test="$attrval='transparent'">transparent</xsl:when>
            <xsl:when test="contains($bg_colorizer,$attrval)">
               <xsl:value-of select="substring-before(substring-after($bg_colorizer,concat($attrval,'=')),';')"/>
            </xsl:when>
            <xsl:otherwise/>
         </xsl:choose>
      </xsl:variable>
      <xsl:if test="$replval!=''">
         <xsl:call-template name="set-property">
            <xsl:with-param name="prop-name" select="$fontattr"/>
            <xsl:with-param name="prop-value" select="$replval"/>
         </xsl:call-template>
      </xsl:if>
   </xsl:template>

<xsl:template name="gte-font-scorespaces">
      <xsl:param name="attrval"/>
      <xsl:param name="fontattr"/>
      <xsl:variable name="replval">
         <xsl:choose>
            <xsl:when test="$attrval='yes'">true</xsl:when>
            <xsl:when test="$attrval='no'">false</xsl:when>
            <xsl:otherwise/>
         </xsl:choose>
      </xsl:variable>
      <xsl:if test="$replval!=''">
         <xsl:call-template name="set-property">
            <xsl:with-param name="prop-name" select="$fontattr"/>
            <xsl:with-param name="prop-value" select="$replval"/>
         </xsl:call-template>
      </xsl:if>
   </xsl:template>

<xsl:template name="gte-font-allcaps">
      <xsl:param name="attrval"/>
      <xsl:param name="fontattr"/>
      <xsl:variable name="replval">
         <xsl:choose>
            <xsl:when test="$attrval='yes'">uppercase</xsl:when>
            <xsl:otherwise/>
         </xsl:choose>
      </xsl:variable>
      <xsl:if test="$replval!=''">
         <xsl:call-template name="set-property">
            <xsl:with-param name="prop-name" select="$fontattr"/>
            <xsl:with-param name="prop-value" select="$replval"/>
         </xsl:call-template>
      </xsl:if>
   </xsl:template>

<xsl:template name="gte-font-smallcaps">
      <xsl:param name="attrval"/>
      <xsl:param name="fontattr"/>
      <xsl:variable name="replval">
         <xsl:choose>
            <xsl:when test="$attrval='yes'">small-caps</xsl:when>
            <xsl:otherwise/>
         </xsl:choose>
      </xsl:variable>
      <xsl:if test="$replval!=''">
         <xsl:call-template name="set-property">
            <xsl:with-param name="prop-name" select="$fontattr"/>
            <xsl:with-param name="prop-value" select="$replval"/>
         </xsl:call-template>
      </xsl:if>
   </xsl:template>

<xsl:template name="gte-font-text-decoration">
      <xsl:param name="underline"/>
      <xsl:param name="strikethru"/>
      <xsl:param name="fontattr">text-decoration</xsl:param>
      <xsl:if test="concat($underline,$strikethru) != ''">
         <xsl:variable name="replval">
            <xsl:choose>
               <xsl:when test="$underline = ''">
                  <xsl:text>line-through</xsl:text>
               </xsl:when>
               <xsl:when test="$strikethru = ''">
                  <xsl:text>underline</xsl:text>
               </xsl:when>
               <xsl:otherwise>
                  <xsl:text>underline line-through</xsl:text>
               </xsl:otherwise>
            </xsl:choose>
         </xsl:variable>
         <xsl:call-template name="set-property">
            <xsl:with-param name="prop-name" select="$fontattr"/>
            <xsl:with-param name="prop-value" select="$replval"/>
         </xsl:call-template>
      </xsl:if>
   </xsl:template>

<xsl:template name="gte-font-underline">
      <xsl:param name="attrval"/>
      <xsl:choose>
         <xsl:when test="$attrval='yes'">underline</xsl:when>
         <xsl:otherwise/>
      </xsl:choose>
   </xsl:template>

<xsl:template name="gte-font-strikethru">
      <xsl:param name="attrval"/>
      <xsl:choose>
         <xsl:when test="$attrval='yes'">line-through</xsl:when>
         <xsl:otherwise/>
      </xsl:choose>
   </xsl:template>

<xsl:template match="_gte:MetaElement">
      <ch:meta>
         <xsl:attribute name="name">
            <xsl:value-of select="_gte:MetaName"/>
         </xsl:attribute>
         <xsl:attribute name="content">
            <xsl:value-of select="_gte:MetaValue"/>
         </xsl:attribute>
      </ch:meta>
   </xsl:template>

<xsl:template match="_gte:Link">
      <a>
         <xsl:attribute name="href">
            <xsl:text>#</xsl:text>
            <xsl:value-of select="@linkRef"/>
         </xsl:attribute>
         <xsl:apply-templates/>
      </a>
   </xsl:template>

<xsl:template match="_gte:Leaders">
      <xsl:text>&#xa0;</xsl:text>
   </xsl:template>

<xsl:template match="_gte:GeneratedTextGraphic">
      <img>
         <xsl:if test="@alt">
            <xsl:attribute name="alt">
               <xsl:value-of select="@alt"/>
            </xsl:attribute>
         </xsl:if>
         <xsl:if test="@longdesc">
            <xsl:attribute name="longdesc">
               <xsl:value-of select="@longdesc"/>
            </xsl:attribute>
         </xsl:if>
         <xsl:variable name="filename">
            <xsl:value-of select="@pathname"/>
         </xsl:variable>
         <xsl:variable name="graphic-prop-filename">
            <xsl:variable name="aclcmd">
               <xsl:text>filename_to_url(find_file_in_path('</xsl:text>
               <xsl:value-of select="$filename"/>
               <xsl:text>','e',option('graphicspath')))</xsl:text>
            </xsl:variable>
            <xsl:value-of select="_acl:eval($aclcmd)"/>
         </xsl:variable>
         <xsl:attribute name="src">
            <xsl:value-of select="string($filename)"/>
         </xsl:attribute>
         <xsl:variable name="intrinsic-width">
            <xsl:choose>
               <xsl:when test="$available-graphic-getwidth-extension='simg:getWidth'">
                  <xsl:value-of select="number(simg:getWidth(simg:new($graphic-prop-filename),0))"/>
               </xsl:when>
               <xsl:when test="$available-graphic-getwidth-extension='ximg:getWidth'">
                  <xsl:value-of select="number(ximg:getWidth(ximg:new($graphic-prop-filename),0))"/>
               </xsl:when>
               <xsl:otherwise>
                  <!--Get the info via ACL's graphic_information() function-->
                  <xsl:variable name="aclcmd">
                     <xsl:text>_ssutils::getImageWidth("</xsl:text>
                     <xsl:value-of select="$graphic-prop-filename"/>
                     <xsl:text>")</xsl:text>
                  </xsl:variable>
                  <xsl:variable name="w" select="_acl:eval($aclcmd)"/>
                  <xsl:choose>
                     <xsl:when test="string(number($w))='NaN'">
                        <xsl:value-of select="number('0')"/>
                     </xsl:when>
                     <xsl:otherwise>
                        <xsl:value-of select="number($w)"/>
                     </xsl:otherwise>
                  </xsl:choose>
               </xsl:otherwise>
            </xsl:choose>
         </xsl:variable>
         <xsl:variable name="hscaled-width">
            <xsl:choose>
               <xsl:when test="normalize-space(@hscale)!='' and $intrinsic-width &gt; 0">
                  <!--We ignore hscale if there is no intrinsic width-->
                  <xsl:variable name="hscale-attr-value">
                     <xsl:choose>
                        <xsl:when test="contains(@hscale,'%')">
                           <xsl:value-of select="translate(@hscale,'%','')"/>
                        </xsl:when>
                        <xsl:otherwise>
                           <xsl:value-of select="@hscale"/>
                        </xsl:otherwise>
                     </xsl:choose>
                  </xsl:variable>
                  <xsl:value-of select="round($hscale-attr-value * $intrinsic-width div 100)"/>
               </xsl:when>
               <xsl:otherwise>0</xsl:otherwise>
            </xsl:choose>
         </xsl:variable>
         <xsl:variable name="intrinsic-height">
            <xsl:choose>
               <xsl:when test="$available-graphic-getdepth-extension='simg:getDepth'">
                  <xsl:value-of select="number(simg:getDepth(simg:new($graphic-prop-filename),0))"/>
               </xsl:when>
               <xsl:when test="$available-graphic-getdepth-extension='ximg:getDepth'">
                  <xsl:value-of select="number(ximg:getDepth(ximg:new($graphic-prop-filename),0))"/>
               </xsl:when>
               <xsl:otherwise>
                  <!--Get the info via ACL's graphic_information() function-->
                  <xsl:variable name="aclcmd">
                     <xsl:text>_ssutils::getImageDepth("</xsl:text>
                     <xsl:value-of select="$graphic-prop-filename"/>
                     <xsl:text>")</xsl:text>
                  </xsl:variable>
                  <xsl:variable name="d" select="_acl:eval($aclcmd)"/>
                  <xsl:choose>
                     <xsl:when test="string(number($d))='NaN'">
                        <xsl:value-of select="number('0')"/>
                     </xsl:when>
                     <xsl:otherwise>
                        <xsl:value-of select="number($d)"/>
                     </xsl:otherwise>
                  </xsl:choose>
               </xsl:otherwise>
            </xsl:choose>
         </xsl:variable>
         <xsl:variable name="vscaled-height">
            <xsl:choose>
               <xsl:when test="normalize-space(@vscale)!='' and $intrinsic-height &gt; 0">
                  <!--We ignore vscale if there is no intrinsic height-->
                  <xsl:variable name="vscale-attr-value">
                     <xsl:choose>
                        <xsl:when test="contains(@vscale,'%')">
                           <xsl:value-of select="translate(@vscale,'%','')"/>
                        </xsl:when>
                        <xsl:otherwise>
                           <xsl:value-of select="@vscale"/>
                        </xsl:otherwise>
                     </xsl:choose>
                  </xsl:variable>
                  <xsl:value-of select="round($vscale-attr-value * $intrinsic-height div 100)"/>
               </xsl:when>
               <xsl:otherwise>0</xsl:otherwise>
            </xsl:choose>
         </xsl:variable>
         <xsl:choose>
            <xsl:when test="(@imagewidth or @imagedepth)">
               <!-- Set image size from given image dimen(s) -->
               <xsl:if test="@imagewidth">
                  <xsl:attribute name="width">
                     <xsl:call-template name="length-to-pixels">
                        <xsl:with-param name="dimen" select="@imagewidth"/>
                     </xsl:call-template>
                  </xsl:attribute>
               </xsl:if>
            </xsl:when>
            <xsl:otherwise>
               <xsl:choose>
                  <xsl:when test="@hscale">
                     <xsl:if test="$hscaled-width &gt; 0">
                        <xsl:attribute name="width">
                           <xsl:value-of select="$hscaled-width"/>
                        </xsl:attribute>
                     </xsl:if>
                  </xsl:when>
                  <xsl:when test="contains(concat('|','1|yes','|'),concat('|',@scalefit,'|'))">
                     <xsl:choose>
                        <xsl:when test="(@reprowidth or @reprodepth)">
                           <xsl:if test="@reprowidth">
                              <xsl:attribute name="width">
                                 <xsl:call-template name="length-to-pixels">
                                    <xsl:with-param name="dimen">
                                       <xsl:value-of select="@reprowidth"/>
                                    </xsl:with-param>
                                 </xsl:call-template>
                              </xsl:attribute>
                           </xsl:if>
                        </xsl:when>
                        <xsl:otherwise>
                           <xsl:attribute name="width">100%</xsl:attribute>
                        </xsl:otherwise>
                     </xsl:choose>
                  </xsl:when>
               </xsl:choose>
            </xsl:otherwise>
         </xsl:choose>
         <xsl:choose>
            <xsl:when test="(@imagewidth or @imagedepth)">
               <!-- Set image size from given image dimen(s) -->
               <xsl:if test="@imagedepth">
                  <xsl:attribute name="height">
                     <xsl:call-template name="length-to-pixels">
                        <xsl:with-param name="dimen" select="@imagedepth"/>
                     </xsl:call-template>
                  </xsl:attribute>
               </xsl:if>
            </xsl:when>
            <xsl:otherwise>
               <xsl:choose>
                  <xsl:when test="@vscale">
                     <xsl:if test="$vscaled-height &gt; 0">
                        <xsl:attribute name="height">
                           <xsl:value-of select="$vscaled-height"/>
                        </xsl:attribute>
                     </xsl:if>
                  </xsl:when>
                  <xsl:when test="contains(concat('|','1|yes','|'),concat('|',@scalefit,'|'))">
                     <xsl:choose>
                        <xsl:when test="(@reprowidth or @reprodepth)">
                           <xsl:if test="@reprodepth">
                              <xsl:attribute name="height">
                                 <xsl:call-template name="length-to-pixels">
                                    <xsl:with-param name="dimen">
                                       <xsl:value-of select="@reprodepth"/>
                                    </xsl:with-param>
                                 </xsl:call-template>
                              </xsl:attribute>
                           </xsl:if>
                        </xsl:when>
                     </xsl:choose>
                  </xsl:when>
               </xsl:choose>
            </xsl:otherwise>
         </xsl:choose>
         <xsl:attribute name="style">max-width: 100%; </xsl:attribute>
      </img>
   </xsl:template>

<xsl:template match="_gte:Font">
      <xsl:if test="not(@Suppress='yes')">
         <xsl:variable name="style-attr-value">
            <xsl:call-template name="handle-gte-font-attrs"/>
         </xsl:variable>
         <xsl:choose>
            <xsl:when test="$style-attr-value!=''">
               <span>
                  <xsl:attribute name="style">
                     <xsl:value-of select="$style-attr-value"/>
                  </xsl:attribute>
                  <xsl:apply-templates/>
               </span>
            </xsl:when>
            <xsl:otherwise>
               <xsl:apply-templates/>
            </xsl:otherwise>
         </xsl:choose>
      </xsl:if>
   </xsl:template>

<xsl:template name="gte-font-offset">
      <xsl:param name="attrval"/>
      <xsl:param name="fontattr"/>
      <xsl:if test="$attrval!=''">
         <xsl:variable name="temp">
            <xsl:call-template name="size-to-points">
               <xsl:with-param name="size" select="$attrval"/>
            </xsl:call-template>
         </xsl:variable>
         <xsl:if test="$temp != 0">
            <xsl:call-template name="set-property">
               <xsl:with-param name="prop-name" select="'position'"/>
               <xsl:with-param name="prop-value" select="'relative'"/>
            </xsl:call-template>
            <xsl:choose>
               <xsl:when test="$temp &gt; 0">
                  <xsl:call-template name="set-property">
                     <xsl:with-param name="prop-name" select="'top'"/>
                     <xsl:with-param name="prop-value" select="concat('-',$attrval)"/>
                  </xsl:call-template>
               </xsl:when>
               <xsl:otherwise>
                  <xsl:call-template name="set-property">
                     <xsl:with-param name="prop-name" select="'bottom'"/>
                     <xsl:with-param name="prop-value" select="$attrval"/>
                  </xsl:call-template>
               </xsl:otherwise>
            </xsl:choose>
         </xsl:if>
      </xsl:if>
   </xsl:template>

<xsl:template name="gte-font-keepline"/>

<xsl:template name="size-to-points">
      <xsl:param name="size"/>
      <xsl:variable name="units" select="substring($size,string-length($size)-1)"/>
      <xsl:variable name="val" select="number(substring($size,1,string-length($size)-2))"/>
      <xsl:choose>
         <xsl:when test="$val='' or $val=0">
            <xsl:value-of select="number(0)"/>
         </xsl:when>
         <xsl:when test="$units='pc'">
            <xsl:value-of select="$val * 12"/>
         </xsl:when>
         <xsl:when test="$units='in'">
            <xsl:value-of select="$val * 72"/>
         </xsl:when>
         <xsl:when test="$units='mm'">
            <xsl:value-of select="$val * 72 div 25.4"/>
         </xsl:when>
         <xsl:when test="$units='cm'">
            <xsl:value-of select="$val * 72 div 2.54"/>
         </xsl:when>
         <xsl:when test="$units='em'">
            <xsl:value-of select="$val * 12"/>
         </xsl:when>
         <xsl:otherwise>
            <xsl:value-of select="$val"/>
         </xsl:otherwise>
      </xsl:choose>
   </xsl:template>

<xsl:template name="set-property">
      <xsl:param name="prop-name"/>
      <xsl:param name="prop-value"/>
      <xsl:if test="$prop-value!=''">
         <xsl:value-of select="$prop-name"/>
         <xsl:text>: </xsl:text>
         <xsl:value-of select="$prop-value"/>
         <xsl:text>; </xsl:text>
      </xsl:if>
   </xsl:template>

<xsl:template xmlns:h="http://www.w3.org/1999/xhtml" match="h:*">
      <xsl:element name="{name(.)}">
         <xsl:copy-of select="@*"/>
         <xsl:apply-templates/>
      </xsl:element>
   </xsl:template>

<xsl:template match="/*" priority="-0.1">
      <body ch:chunk="yes">
         <xsl:apply-templates/>
      </body>
   </xsl:template>

<xsl:variable name="title">
      <xsl:choose>
         <xsl:when test="$doctype='emipc'">
            <xsl:value-of select="//_ufe:chapsect-title[1]|//_ufe:cir-title[1]|//_ufe:consumables-title[1]|//_ufe:eipc-title[1]|//_ufe:em-title[1]|//_ufe:fixequ-title[1]|//_ufe:general-title[1]|//_ufe:glossary-title[1]|//_ufe:howtouse-title[1]|//_ufe:intro-title[1]|//manual-title[1]|//_ufe:num-index-title[1]|//_ufe:nut-option-title[1]|//_ufe:pdlist-title[1]|//pwc-title[1]|//_ufe:sblist-title[1]|//_ufe:spblist-title[1]|//_ufe:spectools-title[1]|//_ufe:supplier-list-title[1]|//_ufe:task-title[1]|//_ufe:temp-rev-title[1]|//title[1]|//_ufe:tmm-title[1]"/>
         </xsl:when>
         <xsl:when test="$doctype='ipc'">
            <xsl:value-of select="//_ufe:chapsect-title[1]|//_ufe:cir-title[1]|//_ufe:consumables-title[1]|//_ufe:eipc-title[1]|//_ufe:em-title[1]|//_ufe:fixequ-title[1]|//_ufe:general-title[1]|//_ufe:glossary-title[1]|//_ufe:howtouse-title[1]|//_ufe:intro-title[1]|//manual-title[1]|//_ufe:num-index-title[1]|//_ufe:nut-option-title[1]|//_ufe:pdlist-title[1]|//_ufe:sblist-title[1]|//_ufe:spblist-title[1]|//_ufe:spectools-title[1]|//_ufe:supplier-list-title[1]|//_ufe:task-title[1]|//_ufe:temp-rev-title[1]|//title[1]|//_ufe:tmm-title[1]"/>
         </xsl:when>
         <xsl:when test="$doctype='jmtosmigrate'">
            <xsl:value-of select="//_ufe:chapsect-title[1]|//_ufe:cir-title[1]|//_ufe:consumables-title[1]|//_ufe:eipc-title[1]|//_ufe:em-title[1]|//_ufe:fixequ-title[1]|//_ufe:general-title[1]|//_ufe:glossary-title[1]|//_ufe:howtouse-title[1]|//_ufe:intro-title[1]|//manual-title[1]|//_ufe:num-index-title[1]|//_ufe:nut-option-title[1]|//pageblock-title[1]|//_ufe:pdlist-title[1]|//_ufe:sblist-title[1]|//_ufe:spblist-title[1]|//_ufe:spectools-title[1]|//_ufe:supplier-list-title[1]|//_ufe:task-title[1]|//_ufe:temp-rev-title[1]|//title[1]|//_ufe:tmm-title[1]"/>
         </xsl:when>
         <xsl:when test="$doctype='migrate'">
            <xsl:value-of select="//_ufe:chapsect-title[1]|//_ufe:cir-title[1]|//_ufe:consumables-title[1]|//_ufe:eipc-title[1]|//_ufe:em-title[1]|//_ufe:fixequ-title[1]|//_ufe:general-title[1]|//_ufe:glossary-title[1]|//_ufe:howtouse-title[1]|//_ufe:intro-title[1]|//manual-title[1]|//_ufe:num-index-title[1]|//_ufe:nut-option-title[1]|//pageblock-title[1]|//_ufe:pdlist-title[1]|//_ufe:sblist-title[1]|//_ufe:spblist-title[1]|//_ufe:spectools-title[1]|//_ufe:supplier-list-title[1]|//_ufe:task-title[1]|//_ufe:temp-rev-title[1]|//title[1]|//_ufe:tmm-title[1]"/>
         </xsl:when>
      </xsl:choose>
   </xsl:variable>

<xsl:template name="include-required-head-contents">
      <meta name="Generator" content="{$generator-product-name} {$generator-version-number}"/>
      <xsl:value-of select="'&#xA;'"/>
      <xsl:if test="//*/namespace::*[string(.)='http://www.arbortext.com/namespace/graphics']">
         <xsl:variable name="result-doc-graphics-dir">
            <xsl:variable name="fileref-value">
               <xsl:choose>
                  <xsl:when test="$doctype='emipc'">
                     <xsl:value-of select="(//sheet/@gnbr)[1]"/>
                  </xsl:when>
                  <xsl:when test="$doctype='ipc'">
                     <xsl:value-of select="(//graphic/@negnumber)[1]"/>
                  </xsl:when>
                  <xsl:when test="$doctype='jmtosmigrate'">
                     <xsl:value-of select="(//pwcsoa/@negnumber|//sheet/@gnbr)[1]"/>
                  </xsl:when>
                  <xsl:when test="$doctype='migrate'">
                     <xsl:value-of select="(//graphic/@negnumber|//soa/@negnumber)[1]"/>
                  </xsl:when>
               </xsl:choose>
            </xsl:variable>
            <xsl:call-template name="substring-before-last">
               <xsl:with-param name="str" select="translate($fileref-value,'\','/')"/>
               <xsl:with-param name="delim" select="'/'"/>
            </xsl:call-template>
         </xsl:variable>
         <xsl:for-each xmlns:ati3d="http://www.arbortext.com/namespace/graphics" select="//*[@ati3d:viewer]">
            <xsl:variable name="viewer" select="@ati3d:viewer"/>
            <xsl:if test="generate-id(.) = generate-id(//*[@ati3d:viewer=$viewer][1])">
               <script type="text/javascript">
                  <xsl:attribute name="src">
                     <xsl:value-of select="$result-doc-graphics-dir"/>
                     <xsl:value-of select="'/html'"/>
                     <xsl:value-of select="$viewer"/>
                     <xsl:value-of select="'.js'"/>
                  </xsl:attribute>
               </script>
            </xsl:if>
         </xsl:for-each>
         <style type="text/css">
            .viewpath{
                display:none;
            }
            .viewlinks{
                display:none;
            }</style>
      </xsl:if>
      <ch:config>
         <ch:param name="ixsee-addbefore" value=", See "/>
         <ch:param name="ixseealso-addbefore" value="See also "/>
      </ch:config>
      <link href="{concat($relative-external-css-base-filename,'.css')}" rel="stylesheet" type="text/css"/>
   </xsl:template>

<xsl:template name="length-to-pixels">
      <xsl:param name="dimen"/>
      <xsl:variable name="dimenx" select="concat('00',$dimen)"/>
      <xsl:variable name="units" select="substring($dimenx,string-length($dimenx)-1)"/>
      <xsl:variable name="numeric-value" select="number(substring($dimenx,1,string-length($dimenx)-2))"/>
      <xsl:choose>
         <xsl:when test="string(number($units))!='NaN' and string(number($numeric-value))!='NaN'">
            <xsl:value-of select="number(round(concat($numeric-value,$units)))"/>
         </xsl:when>
         <xsl:when test="string(number($numeric-value))='NaN'">
            <xsl:value-of select="'100%'"/>
         </xsl:when>
         <xsl:when test="$units='cm'">
            <xsl:value-of select="number(round($numeric-value * 96 div 2.54))"/>
         </xsl:when>
         <xsl:when test="$units='mm'">
            <xsl:value-of select="number(round($numeric-value * 96 div 25.4))"/>
         </xsl:when>
         <xsl:when test="$units='in'">
            <xsl:value-of select="number(round($numeric-value * 96))"/>
         </xsl:when>
         <xsl:when test="$units='pt'">
            <xsl:value-of select="number(round($numeric-value * 96 div 72))"/>
         </xsl:when>
         <xsl:when test="$units='pc'">
            <xsl:value-of select="number(round($numeric-value * 96 div 6))"/>
         </xsl:when>
         <xsl:when test="$units='px'">
            <xsl:value-of select="number(round($numeric-value))"/>
         </xsl:when>
         <xsl:when test="$units='em'">
            <xsl:value-of select="number(round($numeric-value * 96 div 6))"/>
         </xsl:when>
         <xsl:otherwise>
            <xsl:value-of select="'100%'"/>
         </xsl:otherwise>
      </xsl:choose>
   </xsl:template>

<xsl:template name="substring-before-last">
      <xsl:param name="str" select="''"/>
      <xsl:param name="delim" select="'/'"/>
      <xsl:value-of select="substring-before($str,$delim)"/>
      <xsl:if test="contains(substring-after($str,$delim),$delim)">
         <xsl:value-of select="$delim"/>
         <xsl:call-template name="substring-before-last">
            <xsl:with-param name="str" select="substring-after($str,$delim)"/>
            <xsl:with-param name="delim" select="$delim"/>
         </xsl:call-template>
      </xsl:if>
   </xsl:template>

<xsl:template name="substring-after-last">
      <xsl:param name="str" select="''"/>
      <xsl:param name="delim" select="'/'"/>
      <xsl:choose>
         <xsl:when test="contains($str,$delim)">
            <xsl:call-template name="substring-after-last">
               <xsl:with-param name="str" select="substring-after($str,$delim)"/>
               <xsl:with-param name="delim" select="$delim"/>
            </xsl:call-template>
         </xsl:when>
         <xsl:otherwise>
            <xsl:value-of select="$str"/>
         </xsl:otherwise>
      </xsl:choose>
   </xsl:template>

<xsl:variable name="viewerdownloaduris"/>

<xsl:template name="get-downloaduri">
      <xsl:param name="viewer" select="'pview'"/>
      <xsl:variable name="rest1" select="substring-after(concat(' ',$viewerdownloaduris),concat(' ',$viewer,'='))"/>
      <xsl:variable name="quote" select="substring($rest1,1,1)"/>
      <xsl:variable name="rest2" select="substring($rest1,2)"/>
      <xsl:value-of select="substring-before($rest2,$quote)"/>
   </xsl:template>

<xsl:variable name="list-of-combined-font-names">'</xsl:variable>

<xsl:template match="processing-instruction('EpicOpts')">
      <xsl:processing-instruction name="EpicOpts">
         <xsl:value-of select="."/>
      </xsl:processing-instruction>
   </xsl:template>

<xsl:template match="processing-instruction('ProfileValues')">
      <xsl:processing-instruction name="ProfileValues">
         <xsl:value-of select="."/>
      </xsl:processing-instruction>
   </xsl:template>

<xsl:template match="processing-instruction('Profile')">
      <xsl:processing-instruction name="Profile">
         <xsl:value-of select="."/>
      </xsl:processing-instruction>
      <xsl:processing-instruction name="ProfileAxes">
         <xsl:call-template name="check-Profile-atts">
            <xsl:with-param name="target-atts" select="following-sibling::*[1]/@*"/>
            <xsl:with-param name="PI-data" select="string(current())"/>
         </xsl:call-template>
      </xsl:processing-instruction>
   </xsl:template>

<xsl:template name="check-Profile-atts">
      <xsl:param name="target-atts"/>
      <xsl:param name="PI-data"/>
      <xsl:call-template name="check-Profile-att">
         <xsl:with-param name="target-atts" select="$target-atts"/>
         <xsl:with-param name="PI-att" select="substring-before($PI-data, '=')"/>
      </xsl:call-template>
      <xsl:if test="contains($PI-data, '&#34; ')">
         <xsl:call-template name="check-Profile-atts">
            <xsl:with-param name="target-atts" select="$target-atts"/>
            <xsl:with-param name="PI-data" select="substring-after($PI-data, '&#34; ')"/>
         </xsl:call-template>
      </xsl:if>
   </xsl:template>

<xsl:template name="check-Profile-att">
      <xsl:param name="target-atts"/>
      <xsl:param name="PI-att"/>
      <xsl:for-each select="$target-atts">
         <xsl:if test="name()=$PI-att">
            <xsl:value-of select="name()"/>
            <xsl:text>="</xsl:text>
            <xsl:value-of select="string(current())"/>
            <xsl:text>" </xsl:text>
         </xsl:if>
      </xsl:for-each>
   </xsl:template>

<xsl:template name="object.id">
      <xsl:param name="object" select="."/>
      <xsl:choose>
         <xsl:when test="$object/@id">
            <xsl:value-of select="$object/@id"/>
         </xsl:when>
         <xsl:otherwise>
            <xsl:value-of select="generate-id($object)"/>
         </xsl:otherwise>
      </xsl:choose>
   </xsl:template>

<xsl:template match="processing-instruction('dbhtml')">
      <xsl:processing-instruction name="dbhtml">
         <xsl:value-of select="."/>
      </xsl:processing-instruction>
   </xsl:template>

<xsl:template match="ch:*">
      <!-- Pass through ch:* elements -->
      <xsl:element name="{name(.)}">
         <xsl:copy-of select="@*"/>
         <xsl:apply-templates/>
      </xsl:element>
   </xsl:template>

<xsl:param name="valid-lre-override-table">
      <xsl:text> hidden-block:div hidden-block:a hidden-inline:span hidden-block:a block:p block:div block:blockquote block:address formalBlock:p formalBlock:div formalBlock:blockquote formalBlock:address division:p division:div division:blockquote division:address paragraph-block:p paragraph-block:div paragraph-block:blockquote paragraph-block:address paragraph-inline:span paragraph-inline:q paragraph-inline:code paragraph-inline:cite paragraph:p paragraph:div paragraph:blockquote paragraph:address index:div tableOfContents:div document:body document:div page-sequence:body page-sequence:div definitionList:# definitionListItem:# definitionListDefinition:# definitionListTerm:# graphic-block:div graphic-inline:span link-block:div link-inline:a linkTarget-block:div bulletedList:ul bulletedList:div numberedList:ol numberedList:div listItem:# preformatted:# preformatted-block:# table:# title:h1 title:h2 title:h3 title:h4 title:h5 title:h6 title:div indexTermElementModel:# indexTermAttributeModel:# indexTermNestingElementModel:# footnoteOutOfLine:# footnote:# footnoteReference:# </xsl:text>
   </xsl:param>

<xsl:param name="fo-class-fallback-lre-table">
      <xsl:text> hidden-block:div hidden-inline:span block:div formalBlock:div division:div paragraph-block:div paragraph-inline:span paragraph:div index:div tableOfContents:div document:body page-sequence:body definitionList:dl definitionListItem:# definitionListDefinition:dd definitionListTerm:dt graphic-block:div graphic-inline:span link-block:div link-inline:a linkTarget:span linkTarget-inline:span linkTarget-block:div inline:span bulletedList:ul bulletedList:div numberedList:ol numberedList:div listItem:li preformatted:pre preformatted-block:pre preformatted-inline:span table:# title:h3 indexTermElementModel:span indexTermAttributeModel:span indexTermNestingElementModel:span footnoteOutOfLine:# footnote:# footnoteReference:# </xsl:text>
   </xsl:param>

<xsl:param name="inline-fo-classes-for-lre-override">
      <xsl:text> inline linkTarget-inline linkTarget preformatted-inline </xsl:text>
   </xsl:param>

<xsl:param name="valid-inline-lre-override-table">
      <xsl:text> span tt i b u s strike big small em strong dfn code samp kbd var cite abbr acronym font q sub sup bdo </xsl:text>
   </xsl:param>

<xsl:template name="determine-lre-override-name">
      <xsl:param name="given-lre-override-name"/>
      <xsl:param name="fo-class"/>
      <xsl:variable name="fallback-lre">
         <xsl:variable name="tmp" select="substring-after($fo-class-fallback-lre-table,concat(' ',$fo-class,':'))"/>
         <xsl:value-of select="substring-before($tmp,' ')"/>
      </xsl:variable>
      <xsl:choose>
         <xsl:when test="$given-lre-override-name=''">
            <xsl:value-of select="$fallback-lre"/>
         </xsl:when>
         <xsl:when test="contains($inline-fo-classes-for-lre-override,concat(' ',$fo-class,' '))">
            <xsl:choose>
               <xsl:when test="contains($valid-inline-lre-override-table,concat(' ',$given-lre-override-name,' '))">
                  <xsl:value-of select="$given-lre-override-name"/>
               </xsl:when>
               <xsl:otherwise>
                  <xsl:value-of select="$fallback-lre"/>
               </xsl:otherwise>
            </xsl:choose>
         </xsl:when>
         <xsl:otherwise>
            <xsl:choose>
               <xsl:when test="contains($valid-lre-override-table,concat(' ',$fo-class,':','#'))">
                  <xsl:value-of select="$fallback-lre"/>
               </xsl:when>
               <xsl:when test="contains($valid-lre-override-table,concat(' ',$fo-class,':','-',$given-lre-override-name,' '))">
                  <xsl:value-of select="$fallback-lre"/>
               </xsl:when>
               <xsl:when test="contains($valid-lre-override-table,concat(' ',$fo-class,':','*'))">
                  <xsl:value-of select="$given-lre-override-name"/>
               </xsl:when>
               <xsl:when test="contains($valid-lre-override-table,concat(' ',$fo-class,':',$given-lre-override-name,' '))">
                  <xsl:value-of select="$given-lre-override-name"/>
               </xsl:when>
               <xsl:when test="not(contains($valid-lre-override-table,concat(' ',$fo-class,':')))">
                  <xsl:value-of select="$given-lre-override-name"/>
               </xsl:when>
               <xsl:otherwise>
                  <xsl:value-of select="$fallback-lre"/>
               </xsl:otherwise>
            </xsl:choose>
         </xsl:otherwise>
      </xsl:choose>
   </xsl:template>

<xsl:attribute-set name="unstyled..basestyle">
      <xsl:attribute name="style">color: #0000FF; background-color: #FFC0CB</xsl:attribute>
   </xsl:attribute-set>

<xsl:variable name="ps-box">background-color:
      #F0F0F0; border: thin solid; padding: 2pt; </xsl:variable>

<xsl:variable name="ps-double-underline">border-bottom: 0.2em double; </xsl:variable>

<xsl:template name="ps-Footnote_font">font-family: serif; font-weight: normal; font-size: 12pt;
      font-style: normal; color: #000000; background-color: #FFFFFF; text-decoration: no-underline
      no-line-through; font-variant: normal; </xsl:template>

<xsl:template name="ps-Index_grouphead_space">margin-bottom: .5pc; </xsl:template>

<xsl:template name="ps-Index_group_space">margin-top: 1.5pc; </xsl:template>

<xsl:template name="ps-Link">color: #0000FF; text-decoration: underline ; </xsl:template>

<xsl:template name="ps-List_item_space">margin-top: 6pt; margin-bottom: 6pt; </xsl:template>

<xsl:variable name="ps-overline">text-decoration: overline; </xsl:variable>

<xsl:template name="ps-overstrike-with-slash">text-decoration: line-through; </xsl:template>

<xsl:template name="ps-Standard_space">margin-top: 8pt; </xsl:template>

<xsl:template name="ps-Table_space">margin-top: 1.2em; </xsl:template>

<xsl:template name="ps-Title_1">font-weight: bold; font-size: 20pt; </xsl:template>

<xsl:template name="ps-Title_2">font-weight: bold; font-size: 18pt; </xsl:template>

<xsl:template name="ps-Title_3">font-weight: bold; font-size: 16pt; </xsl:template>

<xsl:template name="ps-Title_4">font-weight: bold; font-size: 14pt; </xsl:template>

<xsl:template name="ps-Title_5">font-weight: bold; font-size: 12pt; </xsl:template>

<xsl:template name="ps-Title_6">font-size: 12pt; </xsl:template>

<xsl:template name="ps-Title_7">font-weight: bold; font-size: 12pt; </xsl:template>

<xsl:template name="ps-Title_8">font-weight: bold; font-size: 12pt; </xsl:template>

<xsl:template name="ps-Title_9">font-weight: bold; font-size: 12pt; </xsl:template>

<xsl:template name="ps-Title_alignment">text-align: left; </xsl:template>

<xsl:template name="ps-Title_color">color: #0000FF; </xsl:template>

<xsl:template name="ps-Title_color_for_print">color: #0000FF; </xsl:template>

<xsl:template name="ps-Title_font">font-family: sans-serif; </xsl:template>

<xsl:template name="ps-Title_keeps"/>

<xsl:template name="ps-Title_space">line-height: 1.1; margin-top: 1.5em; margin-bottom: 1em; </xsl:template>

<xsl:template name="__style-for__sfe-BeforeOrAfterText.1">
      <xsl:text> .x--sfe-BeforeOrAfterText-1-0 {margin-left: 0pt; margin-right: 0pt; }</xsl:text>
   </xsl:template>

<xsl:template match="_sfe:BeforeOrAfterText" priority="0">
      <!--Emit a nostyle template-->
      <xsl:apply-templates/>
   </xsl:template>

<xsl:template name="__style-for__sfe-CollectionItem.4_sCoem221">
      <xsl:text> .x--sfe-CollectionItem-1-0 {margin-left: 0pt; margin-right: 0pt; }</xsl:text>
   </xsl:template>

<xsl:template match="_sfe:CollectionItem[1]" priority="3">
      <span>
         <!--Emit class values to reflect conditions-->
         <xsl:attribute name="class">
            <xsl:text> x--sfe-CollectionItem-1-0</xsl:text>
         </xsl:attribute>
         <xsl:if test="@xml:lang">
            <xsl:attribute name="lang">
               <xsl:call-template name="return-lang-applying-language-map">
                  <xsl:with-param name="doclang" select="@xml:lang"/>
               </xsl:call-template>
            </xsl:attribute>
         </xsl:if>
         <xsl:copy-of select="@ch:*"/>
         <xsl:copy-of xmlns:dmp="http://www.arbortext.com/namespace/dmp/dmpmap" select="@dmp:*"/>
         <xsl:if test="@xml:lang">
            <xsl:attribute name="lang">
               <xsl:call-template name="return-lang-applying-language-map">
                  <xsl:with-param name="doclang" select="@xml:lang"/>
               </xsl:call-template>
            </xsl:attribute>
         </xsl:if>
         <xsl:call-template name="maybe-set-id"/>
         <!--Process this element's content-->
         <xsl:apply-templates/>
      </span>
   </xsl:template>

<xsl:template name="__style-for__sfe-CollectionItem.4_sCoem602">
      <xsl:text> .x--sfe-CollectionItem-2-0 {margin-left: 0pt; margin-right: 0pt; }</xsl:text>
   </xsl:template>

<xsl:template match="_sfe:CollectionItem[position()&gt;1 and not(position()=last())]" priority="2">
      <span>
         <!--Emit class values to reflect conditions-->
         <xsl:attribute name="class">
            <xsl:text> x--sfe-CollectionItem-2-0</xsl:text>
         </xsl:attribute>
         <xsl:if test="@xml:lang">
            <xsl:attribute name="lang">
               <xsl:call-template name="return-lang-applying-language-map">
                  <xsl:with-param name="doclang" select="@xml:lang"/>
               </xsl:call-template>
            </xsl:attribute>
         </xsl:if>
         <xsl:copy-of select="@ch:*"/>
         <xsl:copy-of xmlns:dmp="http://www.arbortext.com/namespace/dmp/dmpmap" select="@dmp:*"/>
         <xsl:if test="@xml:lang">
            <xsl:attribute name="lang">
               <xsl:call-template name="return-lang-applying-language-map">
                  <xsl:with-param name="doclang" select="@xml:lang"/>
               </xsl:call-template>
            </xsl:attribute>
         </xsl:if>
         <xsl:call-template name="maybe-set-id"/>
         <!--Process this element's content-->
         <xsl:apply-templates/>
      </span>
   </xsl:template>

<xsl:template name="__style-for__sfe-CollectionItem.4_sCoem273">
      <xsl:text> .x--sfe-CollectionItem-3-0 {margin-left: 0pt; margin-right: 0pt; }</xsl:text>
   </xsl:template>

<xsl:template match="_sfe:CollectionItem[last()]" priority="1">
      <span>
         <!--Emit class values to reflect conditions-->
         <xsl:attribute name="class">
            <xsl:text> x--sfe-CollectionItem-3-0</xsl:text>
         </xsl:attribute>
         <xsl:if test="@xml:lang">
            <xsl:attribute name="lang">
               <xsl:call-template name="return-lang-applying-language-map">
                  <xsl:with-param name="doclang" select="@xml:lang"/>
               </xsl:call-template>
            </xsl:attribute>
         </xsl:if>
         <xsl:copy-of select="@ch:*"/>
         <xsl:copy-of xmlns:dmp="http://www.arbortext.com/namespace/dmp/dmpmap" select="@dmp:*"/>
         <xsl:if test="@xml:lang">
            <xsl:attribute name="lang">
               <xsl:call-template name="return-lang-applying-language-map">
                  <xsl:with-param name="doclang" select="@xml:lang"/>
               </xsl:call-template>
            </xsl:attribute>
         </xsl:if>
         <xsl:call-template name="maybe-set-id"/>
         <!--Process this element's content-->
         <xsl:apply-templates/>
      </span>
   </xsl:template>

<xsl:template name="__style-for__sfe-CollectionItem.4_sCoem194">
      <xsl:text> .x--sfe-CollectionItem-4-0 {margin-left: 0pt; margin-right: 0pt; }</xsl:text>
   </xsl:template>

<xsl:template match="_sfe:CollectionItem" priority="0">
      <span>
         <!--Emit class values to reflect conditions-->
         <xsl:attribute name="class">
            <xsl:text> x--sfe-CollectionItem-4-0</xsl:text>
         </xsl:attribute>
         <xsl:if test="@xml:lang">
            <xsl:attribute name="lang">
               <xsl:call-template name="return-lang-applying-language-map">
                  <xsl:with-param name="doclang" select="@xml:lang"/>
               </xsl:call-template>
            </xsl:attribute>
         </xsl:if>
         <xsl:copy-of select="@ch:*"/>
         <xsl:copy-of xmlns:dmp="http://www.arbortext.com/namespace/dmp/dmpmap" select="@dmp:*"/>
         <xsl:if test="@xml:lang">
            <xsl:attribute name="lang">
               <xsl:call-template name="return-lang-applying-language-map">
                  <xsl:with-param name="doclang" select="@xml:lang"/>
               </xsl:call-template>
            </xsl:attribute>
         </xsl:if>
         <xsl:call-template name="maybe-set-id"/>
         <!--Process this element's content-->
         <xsl:apply-templates/>
      </span>
   </xsl:template>

<xsl:template name="__style-for__sfe-CrossReference.1">
      <xsl:text> .x--sfe-CrossReference-1-0 {margin-left: 0pt; margin-right: 0pt; }</xsl:text>
   </xsl:template>

<xsl:template match="_sfe:CrossReference" priority="0">
      <span>
         <!--Emit class values to reflect conditions-->
         <xsl:attribute name="class">
            <xsl:text> x--sfe-CrossReference-1-0</xsl:text>
         </xsl:attribute>
         <xsl:if test="@xml:lang">
            <xsl:attribute name="lang">
               <xsl:call-template name="return-lang-applying-language-map">
                  <xsl:with-param name="doclang" select="@xml:lang"/>
               </xsl:call-template>
            </xsl:attribute>
         </xsl:if>
         <xsl:copy-of select="@ch:*"/>
         <xsl:copy-of xmlns:dmp="http://www.arbortext.com/namespace/dmp/dmpmap" select="@dmp:*"/>
         <xsl:if test="@xml:lang">
            <xsl:attribute name="lang">
               <xsl:call-template name="return-lang-applying-language-map">
                  <xsl:with-param name="doclang" select="@xml:lang"/>
               </xsl:call-template>
            </xsl:attribute>
         </xsl:if>
         <xsl:call-template name="maybe-set-id"/>
         <!--Process this element's content-->
         <xsl:apply-templates/>
      </span>
   </xsl:template>

<xsl:template name="__style-for__sfe-CrossReferenceTitle.2_sHele451">
      <xsl:text> .x--sfe-CrossReferenceTitle-1-0 {margin-left: 0pt; margin-right: 0pt; }</xsl:text>
   </xsl:template>

<xsl:template match="_sfe:HeaderOrFooter//_sfe:CrossReferenceTitle" priority="1">
      <span>
         <!--Emit class values to reflect conditions-->
         <xsl:attribute name="class">
            <xsl:text> x--sfe-CrossReferenceTitle-1-0</xsl:text>
         </xsl:attribute>
         <xsl:if test="@xml:lang">
            <xsl:attribute name="lang">
               <xsl:call-template name="return-lang-applying-language-map">
                  <xsl:with-param name="doclang" select="@xml:lang"/>
               </xsl:call-template>
            </xsl:attribute>
         </xsl:if>
         <xsl:copy-of select="@ch:*"/>
         <xsl:copy-of xmlns:dmp="http://www.arbortext.com/namespace/dmp/dmpmap" select="@dmp:*"/>
         <xsl:if test="@xml:lang">
            <xsl:attribute name="lang">
               <xsl:call-template name="return-lang-applying-language-map">
                  <xsl:with-param name="doclang" select="@xml:lang"/>
               </xsl:call-template>
            </xsl:attribute>
         </xsl:if>
         <xsl:call-template name="maybe-set-id"/>
         <!--Process this element's content-->
         <xsl:apply-templates/>
      </span>
   </xsl:template>

<xsl:template name="__style-for__sfe-CrossReferenceTitle.2_sCrle242">
      <xsl:text> .x--sfe-CrossReferenceTitle-2-0 {margin-left: 0pt; margin-right: 0pt; font-style: italic; }</xsl:text>
   </xsl:template>

<xsl:template match="_sfe:CrossReferenceTitle" priority="0">
      <span>
         <!--Emit class values to reflect conditions-->
         <xsl:attribute name="class">
            <xsl:text> x--sfe-CrossReferenceTitle-2-0</xsl:text>
         </xsl:attribute>
         <xsl:if test="@xml:lang">
            <xsl:attribute name="lang">
               <xsl:call-template name="return-lang-applying-language-map">
                  <xsl:with-param name="doclang" select="@xml:lang"/>
               </xsl:call-template>
            </xsl:attribute>
         </xsl:if>
         <xsl:copy-of select="@ch:*"/>
         <xsl:copy-of xmlns:dmp="http://www.arbortext.com/namespace/dmp/dmpmap" select="@dmp:*"/>
         <xsl:if test="@xml:lang">
            <xsl:attribute name="lang">
               <xsl:call-template name="return-lang-applying-language-map">
                  <xsl:with-param name="doclang" select="@xml:lang"/>
               </xsl:call-template>
            </xsl:attribute>
         </xsl:if>
         <xsl:call-template name="maybe-set-id"/>
         <!--Process this element's content-->
         <xsl:apply-templates/>
      </span>
   </xsl:template>

<xsl:template name="__style-for__sfe-ExternalLink.1">
      <xsl:text> .x--sfe-ExternalLink-1-0 {margin-left: 0pt; margin-right: 0pt; color: #0000FF; text-decoration: underline ; }</xsl:text>
   </xsl:template>

<xsl:template match="_sfe:ExternalLink" priority="0">
      <a>
         <!--Emit class values to reflect conditions-->
         <xsl:attribute name="class">
            <xsl:text> x--sfe-ExternalLink-1-0</xsl:text>
         </xsl:attribute>
         <xsl:if test="@href">
            <xsl:attribute name="href">
               <xsl:value-of select="@href"/>
            </xsl:attribute>
         </xsl:if>
         <xsl:if test="@xml:lang">
            <xsl:attribute name="lang">
               <xsl:call-template name="return-lang-applying-language-map">
                  <xsl:with-param name="doclang" select="@xml:lang"/>
               </xsl:call-template>
            </xsl:attribute>
         </xsl:if>
         <xsl:copy-of select="@ch:*"/>
         <xsl:copy-of xmlns:dmp="http://www.arbortext.com/namespace/dmp/dmpmap" select="@dmp:*"/>
         <xsl:if test="@xml:lang">
            <xsl:attribute name="lang">
               <xsl:call-template name="return-lang-applying-language-map">
                  <xsl:with-param name="doclang" select="@xml:lang"/>
               </xsl:call-template>
            </xsl:attribute>
         </xsl:if>
         <xsl:call-template name="maybe-set-id"/>
         <!--Process this element's content-->
         <xsl:apply-templates/>
      </a>
   </xsl:template>

<xsl:template name="__style-for__sfe-Gentext.1">
      <xsl:text> .x--sfe-Gentext-1-0 {margin-left: 0pt; margin-right: 0pt; }</xsl:text>
   </xsl:template>

<xsl:template match="_sfe:Gentext" priority="0">
      <!--Emit a nostyle template-->
      <xsl:apply-templates/>
   </xsl:template>

<xsl:template name="__style-for__sfe-HeaderOrFooter.1">
      <xsl:text> .x--sfe-HeaderOrFooter-1-0 {margin-left: 0pt; margin-right: 0pt; text-indent: 0pt; margin-top: 0pt; }</xsl:text>
   </xsl:template>

<xsl:template match="_sfe:HeaderOrFooter" priority="0">
      <div>
         <!--Emit class values to reflect conditions-->
         <xsl:attribute name="class">
            <xsl:text> x--sfe-HeaderOrFooter-1-0</xsl:text>
         </xsl:attribute>
         <xsl:if test="@xml:lang">
            <xsl:attribute name="lang">
               <xsl:call-template name="return-lang-applying-language-map">
                  <xsl:with-param name="doclang" select="@xml:lang"/>
               </xsl:call-template>
            </xsl:attribute>
         </xsl:if>
         <xsl:copy-of select="@ch:*"/>
         <xsl:copy-of xmlns:dmp="http://www.arbortext.com/namespace/dmp/dmpmap" select="@dmp:*"/>
         <xsl:if test="@xml:lang">
            <xsl:attribute name="lang">
               <xsl:call-template name="return-lang-applying-language-map">
                  <xsl:with-param name="doclang" select="@xml:lang"/>
               </xsl:call-template>
            </xsl:attribute>
         </xsl:if>
         <xsl:call-template name="maybe-set-id"/>
         <!--Process this element's content-->
         <xsl:apply-templates/>
      </div>
   </xsl:template>

<xsl:template name="__style-for__sfe-Index.1">
      <xsl:text> .x--sfe-Index-1-0 {margin-left: 0pt; margin-right: 0pt; text-indent: 0pt; }</xsl:text>
   </xsl:template>

<xsl:template match="_sfe:Index" priority="0">
      <div>
         <!--Emit class values to reflect conditions-->
         <xsl:attribute name="class">
            <xsl:text> x--sfe-Index-1-0</xsl:text>
         </xsl:attribute>
         <xsl:if test="@xml:lang">
            <xsl:attribute name="lang">
               <xsl:call-template name="return-lang-applying-language-map">
                  <xsl:with-param name="doclang" select="@xml:lang"/>
               </xsl:call-template>
            </xsl:attribute>
         </xsl:if>
         <xsl:copy-of select="@ch:*"/>
         <xsl:copy-of xmlns:dmp="http://www.arbortext.com/namespace/dmp/dmpmap" select="@dmp:*"/>
         <xsl:if test="@xml:lang">
            <xsl:attribute name="lang">
               <xsl:call-template name="return-lang-applying-language-map">
                  <xsl:with-param name="doclang" select="@xml:lang"/>
               </xsl:call-template>
            </xsl:attribute>
         </xsl:if>
         <xsl:call-template name="maybe-set-id"/>
         <!--Process this element's content-->
         <xsl:apply-templates/>
      </div>
   </xsl:template>

<xsl:template name="__style-for__sfe-IndexAlphaGroup.1">
      <xsl:text> .x--sfe-IndexAlphaGroup-1-0 {margin-left: 0pt; margin-right: 0pt; text-indent: 0pt; margin-top: 1.5pc; }</xsl:text>
   </xsl:template>

<xsl:template match="_sfe:IndexAlphaGroup" priority="0">
      <div>
         <!--Emit class values to reflect conditions-->
         <xsl:attribute name="class">
            <xsl:text> x--sfe-IndexAlphaGroup-1-0</xsl:text>
         </xsl:attribute>
         <xsl:if test="@xml:lang">
            <xsl:attribute name="lang">
               <xsl:call-template name="return-lang-applying-language-map">
                  <xsl:with-param name="doclang" select="@xml:lang"/>
               </xsl:call-template>
            </xsl:attribute>
         </xsl:if>
         <xsl:copy-of select="@ch:*"/>
         <xsl:copy-of xmlns:dmp="http://www.arbortext.com/namespace/dmp/dmpmap" select="@dmp:*"/>
         <xsl:if test="@xml:lang">
            <xsl:attribute name="lang">
               <xsl:call-template name="return-lang-applying-language-map">
                  <xsl:with-param name="doclang" select="@xml:lang"/>
               </xsl:call-template>
            </xsl:attribute>
         </xsl:if>
         <xsl:call-template name="maybe-set-id"/>
         <!--Process this element's content-->
         <xsl:apply-templates/>
      </div>
   </xsl:template>

<xsl:template name="__style-for__sfe-IndexEndPage.1">
      <xsl:text> .x--sfe-IndexEndPage-1-0 {margin-left: 0pt; margin-right: 0pt; }</xsl:text>
   </xsl:template>

<xsl:template match="_sfe:IndexEndPage" priority="0">
      <span>
         <!--Emit class values to reflect conditions-->
         <xsl:attribute name="class">
            <xsl:text> x--sfe-IndexEndPage-1-0</xsl:text>
         </xsl:attribute>
         <xsl:if test="@xml:lang">
            <xsl:attribute name="lang">
               <xsl:call-template name="return-lang-applying-language-map">
                  <xsl:with-param name="doclang" select="@xml:lang"/>
               </xsl:call-template>
            </xsl:attribute>
         </xsl:if>
         <xsl:copy-of select="@ch:*"/>
         <xsl:copy-of xmlns:dmp="http://www.arbortext.com/namespace/dmp/dmpmap" select="@dmp:*"/>
         <xsl:if test="@xml:lang">
            <xsl:attribute name="lang">
               <xsl:call-template name="return-lang-applying-language-map">
                  <xsl:with-param name="doclang" select="@xml:lang"/>
               </xsl:call-template>
            </xsl:attribute>
         </xsl:if>
         <xsl:call-template name="maybe-set-id"/>
         <!--Process this element's content-->
         <xsl:apply-templates/>
      </span>
   </xsl:template>

<xsl:template name="__style-for__sfe-IndexEntry.4_sInry631">
      <xsl:text> .x--sfe-IndexEntry-1-0 {margin-left: 0pt; margin-right: 0pt; text-indent: 0pt; margin-left: 1em; text-indent: -.5em; text-align: left; }</xsl:text>
   </xsl:template>

<xsl:template match="_sfe:IndexEntry/_sfe:IndexEntry/_sfe:IndexEntry/_sfe:IndexEntry" priority="3">
      <div>
         <!--Emit class values to reflect conditions-->
         <xsl:attribute name="class">
            <xsl:text> x--sfe-IndexEntry-1-0</xsl:text>
         </xsl:attribute>
         <xsl:if test="@xml:lang">
            <xsl:attribute name="lang">
               <xsl:call-template name="return-lang-applying-language-map">
                  <xsl:with-param name="doclang" select="@xml:lang"/>
               </xsl:call-template>
            </xsl:attribute>
         </xsl:if>
         <xsl:copy-of select="@ch:*"/>
         <xsl:copy-of xmlns:dmp="http://www.arbortext.com/namespace/dmp/dmpmap" select="@dmp:*"/>
         <xsl:if test="@xml:lang">
            <xsl:attribute name="lang">
               <xsl:call-template name="return-lang-applying-language-map">
                  <xsl:with-param name="doclang" select="@xml:lang"/>
               </xsl:call-template>
            </xsl:attribute>
         </xsl:if>
         <xsl:call-template name="maybe-set-id"/>
         <!--Process this element's content-->
         <xsl:apply-templates/>
      </div>
   </xsl:template>

<xsl:template name="__style-for__sfe-IndexEntry.4_sInry472">
      <xsl:text> .x--sfe-IndexEntry-2-0 {margin-left: 0pt; margin-right: 0pt; text-indent: 0pt; margin-left: 1em; text-indent: -.5em; text-align: left; }</xsl:text>
   </xsl:template>

<xsl:template match="_sfe:IndexEntry/_sfe:IndexEntry/_sfe:IndexEntry" priority="2">
      <div>
         <!--Emit class values to reflect conditions-->
         <xsl:attribute name="class">
            <xsl:text> x--sfe-IndexEntry-2-0</xsl:text>
         </xsl:attribute>
         <xsl:if test="@xml:lang">
            <xsl:attribute name="lang">
               <xsl:call-template name="return-lang-applying-language-map">
                  <xsl:with-param name="doclang" select="@xml:lang"/>
               </xsl:call-template>
            </xsl:attribute>
         </xsl:if>
         <xsl:copy-of select="@ch:*"/>
         <xsl:copy-of xmlns:dmp="http://www.arbortext.com/namespace/dmp/dmpmap" select="@dmp:*"/>
         <xsl:if test="@xml:lang">
            <xsl:attribute name="lang">
               <xsl:call-template name="return-lang-applying-language-map">
                  <xsl:with-param name="doclang" select="@xml:lang"/>
               </xsl:call-template>
            </xsl:attribute>
         </xsl:if>
         <xsl:call-template name="maybe-set-id"/>
         <!--Process this element's content-->
         <xsl:apply-templates/>
      </div>
   </xsl:template>

<xsl:template name="__style-for__sfe-IndexEntry.4_sInry313">
      <xsl:text> .x--sfe-IndexEntry-3-0 {margin-left: 0pt; margin-right: 0pt; text-indent: 0pt; margin-left: 1em; text-indent: -.5em; text-align: left; }</xsl:text>
   </xsl:template>

<xsl:template match="_sfe:IndexEntry/_sfe:IndexEntry" priority="1">
      <div>
         <!--Emit class values to reflect conditions-->
         <xsl:attribute name="class">
            <xsl:text> x--sfe-IndexEntry-3-0</xsl:text>
         </xsl:attribute>
         <xsl:if test="@xml:lang">
            <xsl:attribute name="lang">
               <xsl:call-template name="return-lang-applying-language-map">
                  <xsl:with-param name="doclang" select="@xml:lang"/>
               </xsl:call-template>
            </xsl:attribute>
         </xsl:if>
         <xsl:copy-of select="@ch:*"/>
         <xsl:copy-of xmlns:dmp="http://www.arbortext.com/namespace/dmp/dmpmap" select="@dmp:*"/>
         <xsl:if test="@xml:lang">
            <xsl:attribute name="lang">
               <xsl:call-template name="return-lang-applying-language-map">
                  <xsl:with-param name="doclang" select="@xml:lang"/>
               </xsl:call-template>
            </xsl:attribute>
         </xsl:if>
         <xsl:call-template name="maybe-set-id"/>
         <!--Process this element's content-->
         <xsl:apply-templates/>
      </div>
   </xsl:template>

<xsl:template name="__style-for__sfe-IndexEntry.4_sInry154">
      <xsl:text> .x--sfe-IndexEntry-4-0 {margin-left: 0pt; margin-right: 0pt; text-indent: 0pt; margin-left: .5em; margin-right: 2pc; text-indent: -.5em; text-align: left; }</xsl:text>
   </xsl:template>

<xsl:template match="_sfe:IndexEntry" priority="0">
      <div>
         <!--Emit class values to reflect conditions-->
         <xsl:attribute name="class">
            <xsl:text> x--sfe-IndexEntry-4-0</xsl:text>
         </xsl:attribute>
         <xsl:if test="@xml:lang">
            <xsl:attribute name="lang">
               <xsl:call-template name="return-lang-applying-language-map">
                  <xsl:with-param name="doclang" select="@xml:lang"/>
               </xsl:call-template>
            </xsl:attribute>
         </xsl:if>
         <xsl:copy-of select="@ch:*"/>
         <xsl:copy-of xmlns:dmp="http://www.arbortext.com/namespace/dmp/dmpmap" select="@dmp:*"/>
         <xsl:if test="@xml:lang">
            <xsl:attribute name="lang">
               <xsl:call-template name="return-lang-applying-language-map">
                  <xsl:with-param name="doclang" select="@xml:lang"/>
               </xsl:call-template>
            </xsl:attribute>
         </xsl:if>
         <xsl:call-template name="maybe-set-id"/>
         <!--Process this element's content-->
         <xsl:apply-templates/>
      </div>
   </xsl:template>

<xsl:template name="__style-for__sfe-IndexGroupHead.1">
      <xsl:text> .x--sfe-IndexGroupHead-1-0 {margin-left: 0pt; margin-right: 0pt; text-indent: 0pt; font-family: sans-serif; font-weight: bold; font-size: 14pt; text-transform: uppercase; text-align: left; margin-bottom: .5pc; }</xsl:text>
   </xsl:template>

<xsl:template match="_sfe:IndexGroupHead" priority="0">
      <div>
         <!--Emit class values to reflect conditions-->
         <xsl:attribute name="class">
            <xsl:text> x--sfe-IndexGroupHead-1-0</xsl:text>
         </xsl:attribute>
         <xsl:if test="@xml:lang">
            <xsl:attribute name="lang">
               <xsl:call-template name="return-lang-applying-language-map">
                  <xsl:with-param name="doclang" select="@xml:lang"/>
               </xsl:call-template>
            </xsl:attribute>
         </xsl:if>
         <xsl:copy-of select="@ch:*"/>
         <xsl:copy-of xmlns:dmp="http://www.arbortext.com/namespace/dmp/dmpmap" select="@dmp:*"/>
         <xsl:if test="@xml:lang">
            <xsl:attribute name="lang">
               <xsl:call-template name="return-lang-applying-language-map">
                  <xsl:with-param name="doclang" select="@xml:lang"/>
               </xsl:call-template>
            </xsl:attribute>
         </xsl:if>
         <xsl:call-template name="maybe-set-id"/>
         <!--Process this element's content-->
         <xsl:apply-templates/>
      </div>
   </xsl:template>

<xsl:template name="__style-for__sfe-IndexHeading.1">
      <xsl:text> .x--sfe-IndexHeading-1-0 {margin-left: 0pt; margin-right: 0pt; }</xsl:text>
   </xsl:template>

<xsl:template match="_sfe:IndexHeading" priority="0">
      <span>
         <!--Emit class values to reflect conditions-->
         <xsl:attribute name="class">
            <xsl:text> x--sfe-IndexHeading-1-0</xsl:text>
         </xsl:attribute>
         <xsl:if test="@xml:lang">
            <xsl:attribute name="lang">
               <xsl:call-template name="return-lang-applying-language-map">
                  <xsl:with-param name="doclang" select="@xml:lang"/>
               </xsl:call-template>
            </xsl:attribute>
         </xsl:if>
         <xsl:copy-of select="@ch:*"/>
         <xsl:copy-of xmlns:dmp="http://www.arbortext.com/namespace/dmp/dmpmap" select="@dmp:*"/>
         <xsl:if test="@xml:lang">
            <xsl:attribute name="lang">
               <xsl:call-template name="return-lang-applying-language-map">
                  <xsl:with-param name="doclang" select="@xml:lang"/>
               </xsl:call-template>
            </xsl:attribute>
         </xsl:if>
         <xsl:call-template name="maybe-set-id"/>
         <!--Process this element's content-->
         <xsl:apply-templates/>
      </span>
   </xsl:template>

<xsl:template name="__style-for__sfe-IndexLocators.1">
      <xsl:text> .x--sfe-IndexLocators-1-0 {margin-left: 0pt; margin-right: 0pt; }</xsl:text>
   </xsl:template>

<xsl:template match="_sfe:IndexLocators" priority="0">
      <span>
         <!--Emit class values to reflect conditions-->
         <xsl:attribute name="class">
            <xsl:text> x--sfe-IndexLocators-1-0</xsl:text>
         </xsl:attribute>
         <xsl:if test="@xml:lang">
            <xsl:attribute name="lang">
               <xsl:call-template name="return-lang-applying-language-map">
                  <xsl:with-param name="doclang" select="@xml:lang"/>
               </xsl:call-template>
            </xsl:attribute>
         </xsl:if>
         <xsl:copy-of select="@ch:*"/>
         <xsl:copy-of xmlns:dmp="http://www.arbortext.com/namespace/dmp/dmpmap" select="@dmp:*"/>
         <xsl:if test="@xml:lang">
            <xsl:attribute name="lang">
               <xsl:call-template name="return-lang-applying-language-map">
                  <xsl:with-param name="doclang" select="@xml:lang"/>
               </xsl:call-template>
            </xsl:attribute>
         </xsl:if>
         <xsl:call-template name="maybe-set-id"/>
         <!--Process this element's content-->
         <xsl:apply-templates/>
      </span>
   </xsl:template>

<xsl:template name="__style-for__sfe-IndexPage.2_sInge281">
      <xsl:text> .x--sfe-IndexPage-1-0 {margin-left: 0pt; margin-right: 0pt; }</xsl:text>
   </xsl:template>

<xsl:template match="_sfe:IndexPage[position()&gt;1]" priority="1">
      <span>
         <!--Emit class values to reflect conditions-->
         <xsl:attribute name="class">
            <xsl:text> x--sfe-IndexPage-1-0</xsl:text>
         </xsl:attribute>
         <xsl:if test="@xml:lang">
            <xsl:attribute name="lang">
               <xsl:call-template name="return-lang-applying-language-map">
                  <xsl:with-param name="doclang" select="@xml:lang"/>
               </xsl:call-template>
            </xsl:attribute>
         </xsl:if>
         <xsl:copy-of select="@ch:*"/>
         <xsl:copy-of xmlns:dmp="http://www.arbortext.com/namespace/dmp/dmpmap" select="@dmp:*"/>
         <xsl:if test="@xml:lang">
            <xsl:attribute name="lang">
               <xsl:call-template name="return-lang-applying-language-map">
                  <xsl:with-param name="doclang" select="@xml:lang"/>
               </xsl:call-template>
            </xsl:attribute>
         </xsl:if>
         <xsl:call-template name="maybe-set-id"/>
         <!--Process this element's content-->
         <xsl:apply-templates/>
      </span>
   </xsl:template>

<xsl:template name="__style-for__sfe-IndexPage.2_sInge142">
      <xsl:text> .x--sfe-IndexPage-2-0 {margin-left: 0pt; margin-right: 0pt; }</xsl:text>
   </xsl:template>

<xsl:template match="_sfe:IndexPage" priority="0">
      <span>
         <!--Emit class values to reflect conditions-->
         <xsl:attribute name="class">
            <xsl:text> x--sfe-IndexPage-2-0</xsl:text>
         </xsl:attribute>
         <xsl:if test="@xml:lang">
            <xsl:attribute name="lang">
               <xsl:call-template name="return-lang-applying-language-map">
                  <xsl:with-param name="doclang" select="@xml:lang"/>
               </xsl:call-template>
            </xsl:attribute>
         </xsl:if>
         <xsl:copy-of select="@ch:*"/>
         <xsl:copy-of xmlns:dmp="http://www.arbortext.com/namespace/dmp/dmpmap" select="@dmp:*"/>
         <xsl:if test="@xml:lang">
            <xsl:attribute name="lang">
               <xsl:call-template name="return-lang-applying-language-map">
                  <xsl:with-param name="doclang" select="@xml:lang"/>
               </xsl:call-template>
            </xsl:attribute>
         </xsl:if>
         <xsl:call-template name="maybe-set-id"/>
         <!--Process this element's content-->
         <xsl:apply-templates/>
      </span>
   </xsl:template>

<xsl:template match="_sfe:InternalLink" priority="0">
      <a>
         <!--Emit class values to reflect conditions-->
         <xsl:attribute name="class">
            <xsl:text> x--sfe-InternalLink-1-0</xsl:text>
         </xsl:attribute>
         <xsl:choose>
            <xsl:when xmlns:ati3d="http://www.arbortext.com/namespace/graphics" test="@ati3d:viewer and @targetId">
               <!--this is a link to a 3D graphic-->
               <xsl:variable name="annotation" select="@ati3d:view"/>
               <xsl:variable name="idrefvalue" select="@targetId"/>
               <xsl:variable name="viewer" select="@ati3d:viewer"/>
               <xsl:attribute name="href">
                  <xsl:text>#</xsl:text>
                  <xsl:value-of select="$idrefvalue"/>
               </xsl:attribute>
               <xsl:attribute name="onclick">
                  <xsl:value-of select="$viewer"/>
                  <xsl:text>_Link('</xsl:text>
                  <xsl:value-of select="$idrefvalue"/>
                  <xsl:text>','</xsl:text>
                  <xsl:value-of select="@ati3d:linkdata"/>
                  <xsl:text>')</xsl:text>
               </xsl:attribute>
            </xsl:when>
            <xsl:otherwise>
               <!--this is a "regular" link-->
               <xsl:if test="@targetId">
                  <xsl:attribute name="href">
                     <xsl:value-of select="concat('#',@targetId)"/>
                  </xsl:attribute>
               </xsl:if>
            </xsl:otherwise>
         </xsl:choose>
         <xsl:if test="@xml:lang">
            <xsl:attribute name="lang">
               <xsl:call-template name="return-lang-applying-language-map">
                  <xsl:with-param name="doclang" select="@xml:lang"/>
               </xsl:call-template>
            </xsl:attribute>
         </xsl:if>
         <xsl:copy-of select="@ch:*"/>
         <xsl:copy-of xmlns:dmp="http://www.arbortext.com/namespace/dmp/dmpmap" select="@dmp:*"/>
         <xsl:if test="@xml:lang">
            <xsl:attribute name="lang">
               <xsl:call-template name="return-lang-applying-language-map">
                  <xsl:with-param name="doclang" select="@xml:lang"/>
               </xsl:call-template>
            </xsl:attribute>
         </xsl:if>
         <xsl:call-template name="maybe-set-id"/>
         <!--Process this element's content-->
         <xsl:apply-templates/>
      </a>
   </xsl:template>

<!--  FROM SPECIFIC FILES -->

<xsl:template match="*[starts-with(local-name(.),'_')]" priority="-0.9">
  <xsl:element name="{name(.)}">
     <xsl:copy-of select="@*"/>
     <xsl:apply-templates/>
  </xsl:element>
</xsl:template>

<xsl:template xmlns:atievent="http://www.arbortext.com/namespace/AtiSaxEvents" match="atievent:*">
  <xsl:element name="{name(.)}">
     <xsl:copy-of select="@*"/>
     <xsl:apply-templates/>
  </xsl:element>
</xsl:template>

<xsl:template match="*" priority="-1">
  <xsl:apply-templates/>
</xsl:template>

<xsl:param name="table.border.thickness" select="'1pt'"/>

<xsl:param name="table.cell.padding.amount" select="'5pt'"/>

<xsl:param name="thead.tfoot.style">font-weight: bold; </xsl:param>

<xsl:template name="tgroup.first">
  <xsl:attribute name="class">
     <xsl:text> x-tgroup-1-0</xsl:text>
  </xsl:attribute>
</xsl:template>

<xsl:template name="tgroup.notfirst">
  <xsl:attribute name="class">
     <xsl:text> x-tgroup-1-0</xsl:text>
  </xsl:attribute>
</xsl:template>

<xsl:template name="row">
  <xsl:attribute name="class">
     <xsl:text> x-row-1-0</xsl:text>
     <xsl:if test="(@role and string(@role)='changebar') or (entry[1]/marker)"> x-row-1-1</xsl:if>
  </xsl:attribute>
</xsl:template>

<xsl:template name="entry">
  <xsl:param name="context" select="'tbody'"/>
  <xsl:attribute name="class">entry-in-tbody</xsl:attribute>
</xsl:template>

<xsl:template name="thead">
  <xsl:attribute name="class">
     <xsl:text> x-thead-1-0</xsl:text>
  </xsl:attribute>
</xsl:template>

<xsl:template name="tfoot">
  <xsl:attribute name="class">
     <xsl:text> x-tfoot-1-0</xsl:text>
  </xsl:attribute>
</xsl:template>

<xsl:template name="tbody">
  <xsl:attribute name="class">
     <xsl:text> x-tbody-1-0</xsl:text>
  </xsl:attribute>
</xsl:template>

<xsl:template name="htmltbl-tr">
  <xsl:attribute name="class">
     <xsl:text> x-tr-1-0</xsl:text>
  </xsl:attribute>
</xsl:template>

<xsl:template name="htmltbl-td"/>

<xsl:template name="htmltbl-th"/>

<xsl:template name="htmltbl-caption"/>

<xsl:template name="FormatDate">
  <xsl:param name="DateTime"/>
  <xsl:param name="DateFormat"/>
  <xsl:variable name="year">
     <xsl:value-of select="substring($DateTime,1,4)"/>
  </xsl:variable>
  <xsl:variable name="month">
     <xsl:value-of select="substring($DateTime,5,2)"/>
  </xsl:variable>
  <xsl:variable name="day">
     <xsl:value-of select="substring($DateTime,7,2)"/>
  </xsl:variable>
  <xsl:choose>
     <xsl:when test="$DateFormat = 'dmy'">
        <xsl:value-of select="$day"/>
        <xsl:value-of select="' '"/>
        <xsl:choose>
           <xsl:when test="$month = 01">January</xsl:when>
           <xsl:when test="$month = 02">February</xsl:when>
           <xsl:when test="$month = 03">March</xsl:when>
           <xsl:when test="$month = 04">April</xsl:when>
           <xsl:when test="$month = 05">May</xsl:when>
           <xsl:when test="$month = 06">June</xsl:when>
           <xsl:when test="$month = 07">July</xsl:when>
           <xsl:when test="$month = 08">August</xsl:when>
           <xsl:when test="$month = 09">September</xsl:when>
           <xsl:when test="$month = 10">October</xsl:when>
           <xsl:when test="$month = 11">November</xsl:when>
           <xsl:when test="$month = 12">December</xsl:when>
        </xsl:choose>
        <xsl:value-of select="' '"/>
        <xsl:value-of select="$year"/>
     </xsl:when>
     <xsl:when test="$DateFormat = 'mdy'">
        <xsl:choose>
           <xsl:when test="$month = 01">January</xsl:when>
           <xsl:when test="$month = 02">February</xsl:when>
           <xsl:when test="$month = 03">March</xsl:when>
           <xsl:when test="$month = 04">April</xsl:when>
           <xsl:when test="$month = 05">May</xsl:when>
           <xsl:when test="$month = 06">June</xsl:when>
           <xsl:when test="$month = 07">July</xsl:when>
           <xsl:when test="$month = 08">August</xsl:when>
           <xsl:when test="$month = 09">September</xsl:when>
           <xsl:when test="$month = 10">October</xsl:when>
           <xsl:when test="$month = 11">November</xsl:when>
           <xsl:when test="$month = 12">December</xsl:when>
        </xsl:choose>
        <xsl:value-of select="' '"/>
        <xsl:value-of select="$day"/>
        <xsl:value-of select="'/'"/>
        <xsl:value-of select="$year"/>
     </xsl:when>
  </xsl:choose>
</xsl:template>

</xsl:stylesheet>
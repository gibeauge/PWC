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
  version="1.0" 
  exclude-result-prefixes="xml ch #default exslt _ufe _sfe _gte">

  <xsl:strip-space elements="aispart"/>

<xsl:include href="base_gentext.xsl"/>
<xsl:include href="base_numbering.xsl"/>

<xsl:include href="ext/pi.xsl"/>
<xsl:include href="ext/tbls.xsl"/>
<xsl:include href="ext/html-tbls.xsl"/>

<xsl:param name="bg_colorizer" select="'&#34;bgreen=#C0FFC0; gray3=#D0D0D0; green=#C0FFC0; lime=#E0FFE0; bviolet=#FFC0FF; gray4=#C0C0C0; maroon=#C08080; navy=#A0A0C0; bred=#FFC0CB; borange=#FFC097; gray5=#B0B0B0; olive=#D0D000; red=#FFC0CB; byellow=#FFFFC0; bwhite=#FFFFFF; bbrown=#DEB887; bblack=#808080; black=#808080; brown=#DEB887; teal=#00E0E0; violet=#FFC0FF; white=#FFFFFF; bblue=#C0C0FF; blue=#C0C0FF; orange=#FFC097; transparent=transparent; aqua=#D0FFFF; gray1=#F0F0F0; bgray=#D0D0D0; gray2=#E0E0E0; gray=#D0D0D0; yellow=#FFFFC0;&#34;'"/>

<xsl:variable name="pf-id" select="'sid'"/>

<!-- ENTRY POINT -->

<xsl:template match="/*" priority="1">
  <html>
    <head>
      <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
      <link href="{$css-path}/content.css" rel="stylesheet" type="text/css"/>
      <script language="JavaScript" src="{$js-path}/pwcdisplay.js" type="text/javascript">
        <![CDATA[ // JS ]]>
      </script>
      <title>PWC publication</title>
    </head>
    <body ch:chunk="yes" class="x-body-{$doctype}">
       <xsl:apply-templates/>
    </body>
  </html>
</xsl:template>

<!-- PTC GTEs -->

<xsl:template match="_gte:*">
  <xsl:apply-templates/>
</xsl:template>

<xsl:template match="_gte:Gentexted-Content-Wrapper//processing-instruction('Pub')[starts-with(., '_newline') or starts-with(., '_newcolumn') or starts-with(., '_newpage')]" priority="2"/>

<xsl:template match="_gte:Gentexted-Content-Wrapper//processing-instruction('Pub')[starts-with(., '_nolinebreak') or starts-with(., '/_nolinebreak')]" priority="2"/>

<xsl:template match="_gte:Gentexted-Content-Wrapper">
  <xsl:apply-templates/>
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
  <a href="#{@linkRef}">
    <xsl:if test="@onclick">
      <xsl:copy-of select="@onclick"/>
    </xsl:if>  
    <xsl:apply-templates/>
  </a>
</xsl:template>

<!-- PTC SFEs -->

<xsl:template match="_sfe:BeforeOrAfterText" priority="0">
  <xsl:apply-templates/>
</xsl:template>

<xsl:template match="*" mode="ElementContent_All">
  <_sfe:CollectionItem>
     <xsl:apply-templates mode="gentext">
        <xsl:with-param name="skip-expanded-gentext" select="'yes'"/>
     </xsl:apply-templates>
  </_sfe:CollectionItem>
</xsl:template>
   
<xsl:template match="_sfe:CollectionItem[1]" priority="3">
  <span class="x--sfe-CollectionItem-1-0">
    <xsl:call-template name="t-base-div-basic"/>
  </span>
</xsl:template>

<xsl:template match="_sfe:CollectionItem[position()&gt;1 and not(position()=last())]" priority="2">
  <span class="x--sfe-CollectionItem-2-0">
    <xsl:call-template name="t-base-div-basic"/>
  </span>
</xsl:template>

<xsl:template match="_sfe:CollectionItem[last()]" priority="1">
  <span class="x--sfe-CollectionItem-3-0">
    <xsl:call-template name="t-base-div-basic"/>
  </span>
</xsl:template>

<xsl:template match="_sfe:CollectionItem" priority="0">
  <span class="x--sfe-CollectionItem-4-0">
    <xsl:call-template name="t-base-div-basic"/>
  </span>
</xsl:template>

<xsl:template match="_sfe:CrossReference" priority="0">
  <span class="x--sfe-CrossReference-1-0">
    <xsl:call-template name="t-base-div-basic"/>
  </span>
</xsl:template>

<xsl:template match="_sfe:CrossReferenceTitle" priority="0">
  <span class="x--sfe-CrossReferenceTitle-2-0">
    <xsl:call-template name="t-base-div-basic"/>
  </span>
</xsl:template>

<xsl:template match="_sfe:ExternalLink" priority="0">
  <a class="x--sfe-ExternalLink-1-0">
     <xsl:if test="@href">
        <xsl:attribute name="href"><xsl:value-of select="@href"/></xsl:attribute>
     </xsl:if>
     <xsl:call-template name="t-base-div-basic"/>
  </a>
</xsl:template>

<xsl:template match="_sfe:Gentext" priority="0">
  <xsl:apply-templates/>
</xsl:template>

<xsl:template match="_sfe:InternalLink" priority="0">
  <a class="x--sfe-InternalLink-1-0">
     <xsl:if test="@targetId">
        <xsl:attribute name="href"><xsl:value-of select="concat('#',@targetId)"/></xsl:attribute>
     </xsl:if>
     <xsl:call-template name="t-base-div-basic"/>
  </a>
</xsl:template>

<!-- CONTENT (PWC elements and PTC UFEs) -->

<xsl:template match="numlist/address" priority="7">
  <table border="0" cellpadding="0" cellspacing="0" class="x-address-1-0 x--zero-left-margins x-tab-fixed">
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
  <table border="0" cellpadding="0" cellspacing="0" class="x-address-2-0 x--zero-left-margins x-tab-fixed">
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
  <table border="0" cellpadding="0" cellspacing="0" class="x-address-3-0 x--zero-left-margins x-tab-fixed">
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
  <table border="0" cellpadding="0" cellspacing="0" class="x-address-4-0 x--zero-left-margins x-tab-fixed">
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
  <table border="0" cellpadding="0" cellspacing="0" class="x-address-5-0 x--zero-left-margins">
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
  <table border="0" cellpadding="0" cellspacing="0" class="x-address-6-0 x--zero-left-margins x-tab-fixed">
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
  <table border="0" cellpadding="0" cellspacing="0" class="x-address-7-0 x--zero-left-margins">
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
  <table border="0" cellpadding="0" cellspacing="0" class="x-address-8-0 x--zero-left-margins">
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
  <span class="x-aispart-1-0">
    <xsl:call-template name="t-base-div-basic"/>
  </span>
</xsl:template>

<xsl:template match="alpha-list" priority="0">
  <div class="x-alpha-list-1-0">
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
  <div class="x-ata-page-block-1-0">
    <xsl:call-template name="t-base-page-block-gen"/>
  </div>
</xsl:template>

<xsl:template match="address/att" priority="1">
  <div class="x-att-1-0">
    <xsl:call-template name="t-base-div-basic"/>
  </div>
</xsl:template>

<xsl:template match="att" priority="0">
  <div class="x-att-2-0">
    <xsl:call-template name="t-base-div-basic"/>
  </div>
</xsl:template>

<xsl:template match="aw-notice" priority="0">
  <div class="x-aw-notice-1-0">
    <xsl:call-template name="t-base-div-basic"/>
  </div>
</xsl:template>

<xsl:template match="awlror" priority="0">
  <div class="x-awlror-1-0">
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
  <div class="x--ufe-block-nospace-1-0">
    <xsl:call-template name="t-base-div-basic"/>
  </div>
</xsl:template>

<xsl:template match="_ufe:block-prespace" priority="0">
  <div class="x--ufe-block-prespace-1-0">
    <xsl:call-template name="t-base-div-basic"/>
  </div>
</xsl:template>

<xsl:template match="book" priority="0">
  <body ch:chunk="yes">
    <div class="x-book-1-0">
      <xsl:call-template name="t-base-div-basic"/>
    </div>
  </body>
</xsl:template>

<xsl:template match="brk" priority="0">
  <span class="x-brk-1-0">
    <xsl:call-template name="t-base-div-basic"/>
  </span>
</xsl:template>

<xsl:template match="bullist" priority="0">
  <div class="x-bullist-1-0">
    <xsl:call-template name="t-base-div-basic"/>
  </div>
</xsl:template>

<xsl:template match="figure/key/callout" priority="1">
  <span class="x-callout-1-0">
    <xsl:call-template name="t-base-div-basic"/>
  </span>
</xsl:template>

<xsl:template match="callout" priority="0">
  <span class="x-callout-2-0">
    <xsl:call-template name="t-base-div-basic"/>
  </span>
</xsl:template>

<xsl:template match="subtask/caution" priority="11">
  <div class="x-caution-wrapper-1-0">
    <div class="x-caution-1-0">
      <xsl:call-template name="t-base-div-basic"/>
    </div>
  </div>
</xsl:template>

<xsl:template match="task/caution" priority="10">
  <div class="x-caution-wrapper-2-0">
    <div class="x-caution-2-0">
      <xsl:call-template name="t-base-div-basic"/>
    </div>
  </div>
</xsl:template>

<xsl:template match="n-para/caution" priority="9">
  <div class="x-caution-wrapper-3-0">
    <div class="x-caution-3-0">
      <xsl:call-template name="t-base-div-basic"/>
    </div>
  </div>
</xsl:template>

<xsl:template match="step/caution" priority="8">
  <div class="x-caution-wrapper-4-0">
    <div class="x-caution-4-0">
      <xsl:call-template name="t-base-div-basic"/>
    </div>
  </div>
</xsl:template>

<xsl:template match="procedure/caution" priority="7">
  <div class="x-caution-wrapper-5-0">
    <div class="x-caution-5-0">
      <xsl:call-template name="t-base-div-basic"/>
    </div>
  </div> 
</xsl:template>

<xsl:template match="fandc/caution" priority="6">
  <div class="x-caution-wrapper-6-0">
    <div class="x-caution-6-0">
      <xsl:call-template name="t-base-div-basic"/>
    </div>
  </div>
</xsl:template>

<xsl:template match="spec-assem/caution" priority="5">
  <div class="x-caution-wrapper-7-0">
    <div class="x-caution-7-0">
      <xsl:call-template name="t-base-div-basic"/>
    </div>
  </div>
</xsl:template>

<xsl:template match="spring-pressure/caution" priority="4">
  <div class="x-caution-wrapper-8-0">
    <div class="x-caution-8-0">
      <xsl:call-template name="t-base-div-basic"/>
    </div>
  </div>
</xsl:template>

<xsl:template match="torque-and-stretch/caution" priority="3">
  <div class="x-caution-wrapper-9-0">
    <div class="x-caution-9-0">
      <xsl:call-template name="t-base-div-basic"/>
    </div>
  </div>
</xsl:template>

<xsl:template match="fits-and-clears/caution" priority="2">
  <div class="x-caution-wrapper-10-0">
    <div class="x-caution-10-0">
      <xsl:call-template name="t-base-div-basic"/>
    </div>
  </div>
</xsl:template>

<xsl:template match="caution[parent::subpara]" priority="1">
  <div class="x-caution-wrapper-11-0">
    <div class="x-caution-11-0">
      <xsl:call-template name="t-base-div-basic"/>
    </div>
  </div>
</xsl:template>

<xsl:template match="caution" priority="0">
  <div class="x-caution-wrapper-12-0">
    <div class="x-caution-12-0">
      <xsl:call-template name="t-base-div-basic"/>
    </div>
  </div>
</xsl:template>

<xsl:template match="_ufe:center" priority="0">
  <div class="x--ufe-center-1-0">
    <xsl:call-template name="t-base-div-basic"/>
  </div>
</xsl:template>

<xsl:template match="ch-se-su" priority="0">
  <xsl:apply-templates/>
</xsl:template>

<xsl:template match="change" priority="0">
  <xsl:apply-templates/>
</xsl:template>

<xsl:template match="changebar" priority="0">
  <div class="x-changebar-1-0">
    <xsl:call-template name="t-base-div-basic"/>
  </div>
</xsl:template>

<xsl:template match="chapsect" priority="0">
  <xsl:apply-templates/>
</xsl:template>

<xsl:template match="chapsect-list//chapsect-item/chapsect" priority="101">
  <xsl:variable name="l-par" select="name(..)"/>
  <dt>
     <xsl:attribute name="class">
        <xsl:if test="$l-par='chapsect-item' or $l-par='chapsect-title' or $l-par='glosdata'">
           <xsl:value-of select="concat('x-',$l-par,'-1-0 ')"/>
        </xsl:if>
        <xsl:text>x-chapsect-1-0</xsl:text>
     </xsl:attribute>
     <xsl:call-template name="t-base-div-basic"/>
  </dt>
</xsl:template>

<xsl:template match="chapsect-item" priority="0">
  <xsl:apply-templates/>
</xsl:template>

<xsl:template match="chapsect-list" priority="0">
  <div>
     <xsl:copy-of select="@ch:*"/>
     <xsl:apply-templates select="_sfe:BeforeOrAfterText[not(preceding-sibling::*)]"/>
     <xsl:apply-templates select="_ufe:chapsect-title|_ufe:cir-title|_ufe:consumables-title|_ufe:eipc-title|_ufe:em-title|_ufe:fixequ-title|_ufe:general-title|_ufe:glossary-title|_ufe:howtouse-title|_ufe:intro-title|manual-title|_ufe:num-index-title|_ufe:nut-option-title|_ufe:pdlist-title|pwc-title|_ufe:sblist-title|_ufe:spblist-title|_ufe:spectools-title|_ufe:supplier-list-title|_ufe:task-title|_ufe:temp-rev-title|title|_ufe:tmm-title"/>
     <dl class="x-chapsect-list-1-0">
        <xsl:call-template name="maybe-set-id"/>
        <xsl:apply-templates select="chapsect-item|chapsect"/>
     </dl>
     <xsl:apply-templates select="*[not(self::_sfe:BeforeOrAfterText|self::_ufe:chapsect-title|self::_ufe:cir-title|self::_ufe:consumables-title|self::_ufe:eipc-title|self::_ufe:em-title|self::_ufe:fixequ-title|self::_ufe:general-title|self::_ufe:glossary-title|self::_ufe:howtouse-title|self::_ufe:intro-title|self::manual-title|self::_ufe:num-index-title|self::_ufe:nut-option-title|self::_ufe:pdlist-title|self::pwc-title|self::_ufe:sblist-title|self::_ufe:spblist-title|self::_ufe:spectools-title|self::_ufe:supplier-list-title|self::_ufe:task-title|self::_ufe:temp-rev-title|self::title|self::_ufe:tmm-title|self::chapsect-item|self::chapsect|self::chapsect-title)]"/>
     <xsl:apply-templates select="_sfe:BeforeOrAfterText[not(following-sibling::*)][preceding-sibling::*]"/>
  </div>
</xsl:template>

<xsl:template match="chapsect-title" priority="0">
  <xsl:apply-templates/>
</xsl:template>

<xsl:template match="chapsect-list//chapsect-item/chapsect-title" priority="100">
  <xsl:variable name="l-par" select="name(..)"/>
  <dd>
     <xsl:attribute name="class">
        <xsl:if test="$l-par='chapsect-item' or $l-par='chapsect-title' or $l-par='glosdata'">
           <xsl:value-of select="concat('x-',$l-par,'-1-0 ')"/>
        </xsl:if>
        <xsl:text>x-chapsect-title-1-0</xsl:text>
     </xsl:attribute>
     <xsl:call-template name="t-base-div-basic"/>
  </dd>
</xsl:template>

<xsl:template match="pgblk/_ufe:chapsect-title" priority="2">
  <div ch:title="notoc" class="x--ufe-chapsect-title-1-0">
    <xsl:call-template name="t-base-div-title"/>
  </div>
</xsl:template>

<xsl:template match="pbfmatr/_ufe:chapsect-title" priority="1">
  <div ch:title="notoc" class="x--ufe-chapsect-title-2-0">
    <xsl:call-template name="t-base-div-title"/>
  </div>
</xsl:template>

<xsl:template match="_ufe:chapsect-title" priority="0">
  <div ch:title="toc" class="x--ufe-chapsect-title-3-0">
    <xsl:call-template name="t-base-div-title"/>
  </div>
</xsl:template>

<xsl:template match="chapter" priority="0">
  <div class="x-chapter-1-0">
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
    <span class="x-chgdesc-1-0">
      <xsl:call-template name="t-base-div-basic"/>
    </span>
  </xsl:if>
</xsl:template>

<xsl:template match="pgblk/_ufe:cir-title" priority="2">
  <div ch:title="notoc" class="x--ufe-cir-title-1-0">
    <xsl:call-template name="t-base-div-title"/>
  </div>
</xsl:template>

<xsl:template match="pbfmatr/_ufe:cir-title" priority="1">
  <div ch:title="notoc" class="x--ufe-cir-title-2-0">
    <xsl:call-template name="t-base-div-title"/>
  </div>
</xsl:template>

<xsl:template match="city" priority="0">
  <span>
     <xsl:attribute name="class">
        <xsl:text>x-city-1-0</xsl:text>
        <xsl:if test="not(./*[not(self::_sfe:BeforeOrAfterText)]|./text()[normalize-space(.)!=''])"> x-city-1-1</xsl:if>
     </xsl:attribute>
     <xsl:call-template name="t-base-div-basic"/>
  </span>
</xsl:template>

<xsl:template match="co-name" priority="0">
  <div class="x-co-name-1-0">
    <xsl:call-template name="t-base-div-basic"/>
  </div>
</xsl:template>

<xsl:template match="comment" priority="0">
  <xsl:apply-templates/>
</xsl:template>

<xsl:template match="consumable" priority="0">
  <a class="x-consumable-1-0">
     <xsl:if test="@id">
        <xsl:attribute name="href">
           <xsl:value-of select="concat('#',@id)"/>
        </xsl:attribute>
     </xsl:if>
     <xsl:call-template name="t-base-div-basic"/>
  </a>
</xsl:template>

<xsl:template match="pgblk/_ufe:consumables-title" priority="5">
  <div ch:title="notoc" class="x--ufe-consumables-title-1-0">
    <xsl:call-template name="t-base-div-title"/>
  </div>
</xsl:template>

<xsl:template match="pbfmatr/_ufe:consumables-title" priority="4">
  <div ch:title="notoc" class="x--ufe-consumables-title-2-0">
    <xsl:call-template name="t-base-div-title"/>
  </div>
</xsl:template>

<xsl:template match="pwcspblist/_ufe:consumables-title" priority="3">
  <div ch:title="notoc" class="x--ufe-consumables-title-3-0">
    <xsl:call-template name="t-base-div-title"/>
  </div>
</xsl:template>

<xsl:template match="ata-page-block//consumables//_ufe:consumables-title" priority="2">
  <div ch:title="toc" class="x--ufe-consumables-title-4-0">
    <xsl:call-template name="t-base-div-title"/>
  </div>
</xsl:template>

<xsl:template match="page-block//consumables//_ufe:consumables-title" priority="1">
  <div ch:title="toc" class="x--ufe-consumables-title-5-0">
    <xsl:call-template name="t-base-div-title"/>
  </div>
</xsl:template>

<xsl:template match="_ufe:consumables-title" priority="0">
  <div ch:title="notoc" class="x--ufe-consumables-title-6-0">
    <xsl:call-template name="t-base-div-title"/>
  </div>
</xsl:template>

<xsl:template match="consume-list" priority="0">
  <div class="x-consume-list-1-0">
    <xsl:call-template name="t-base-div-basic"/>
  </div>
</xsl:template>

<xsl:template match="country" priority="0">
  <div class="x-country-1-0">
    <xsl:call-template name="t-base-div-basic"/>
  </div>
</xsl:template>

<xsl:template match="csu" priority="0">
  <div class="x-csu-1-0">
    <xsl:call-template name="t-base-div-basic"/>
  </div>
</xsl:template>

<xsl:template match="csu-instance" priority="0">
  <xsl:apply-templates/>
</xsl:template>

<xsl:template match="dash" priority="0">
  <span class="x-dash-1-0">
    <xsl:call-template name="t-base-div-basic"/>
  </span>
</xsl:template>

<xsl:template match="key/def" priority="2">
  <span class="x-def-1-0">
    <xsl:call-template name="t-base-div-basic"/>
  </span>
</xsl:template>

<xsl:template match="deflist/def" priority="1">
  <span class="x-def-2-0">
    <xsl:call-template name="t-base-div-basic"/>
  </span>
</xsl:template>

<xsl:template match="def" priority="0">
  <span class="x-def-3-0">
    <xsl:call-template name="t-base-div-basic"/>
  </span>
</xsl:template>

<xsl:template match="step/deflist" priority="1">
  <div class="x-deflist-1-0">
    <xsl:call-template name="t-base-div-basic"/>
  </div>
</xsl:template>

<xsl:template match="deflist" priority="0">
  <div class="x-deflist-2-0">
    <xsl:call-template name="t-base-div-basic"/>
  </div>
</xsl:template>

<xsl:template match="delete" priority="0">
  <xsl:apply-templates/>
</xsl:template>

<xsl:template match="deleted" priority="0">
  <div class="x-deleted-1-0">
    <xsl:call-template name="t-base-div-basic"/>
  </div>
</xsl:template>

<xsl:template match="denom" priority="0">
  <div class="x-denom-1-0">
    <xsl:call-template name="t-base-div-basic"/>
  </div>
</xsl:template>

<xsl:template match="describe" priority="0">
  <xsl:apply-templates/>
</xsl:template>

<xsl:template match="description" priority="0">
  <div class="x-description-1-0">
    <xsl:call-template name="t-base-div-basic"/>
  </div>
</xsl:template>

<xsl:template match="effec" priority="0">
  <span class="x-effec-1-0">
    <xsl:call-template name="t-base-div-basic"/>
  </span>
</xsl:template>

<xsl:template match="pgblk/_ufe:eipc-title" priority="2">
  <div ch:title="notoc" class="x--ufe-eipc-title-1-0">
    <xsl:call-template name="t-base-div-title"/>
  </div>
</xsl:template>

<xsl:template match="pbfmatr/_ufe:eipc-title" priority="1">
  <div ch:title="notoc" class="x--ufe-eipc-title-2-0">
    <xsl:call-template name="t-base-div-title"/>
  </div>
</xsl:template>

<xsl:template match="pgblk/_ufe:em-title" priority="2">
  <div ch:title="notoc" class="x--ufe-em-title-1-0">
    <xsl:call-template name="t-base-div-title"/>
  </div>
</xsl:template>

<xsl:template match="pbfmatr/_ufe:em-title" priority="1">
  <div ch:title="notoc" class="x--ufe-em-title-2-0">
    <xsl:call-template name="t-base-div-title"/>
  </div>
</xsl:template>

<xsl:template match="email" priority="0">
  <xsl:param name="hidden" select="'yes'"/>
  
  <div class="x-email-1-0">
    <xsl:call-template name="t-base-div-basic-h">
      <xsl:with-param name="hidden" select="$hidden"/>
    </xsl:call-template>
  </div>
</xsl:template>

<xsl:template match="_ufe:email-link" priority="0">
  <span class="x--ufe-email-link-1-0">
    <xsl:call-template name="t-base-div-basic"/>
  </span>
</xsl:template>

<xsl:template match="table[@tabstyle='parts-list']//emphasis" priority="1">
  <div>
     <xsl:attribute name="class">
        <xsl:text>x-emphasis-1-0</xsl:text>
        <xsl:if test="@role='bold'"> x-emphasis-1-1</xsl:if>
        <xsl:choose>
          <xsl:when test="parent::entry[preceding-sibling::entry[part-nbr[@indent = '1']]]"> x-emphasis-1-2</xsl:when>
          <xsl:when test="parent::entry[preceding-sibling::entry[part-nbr[@indent = '2']]]"> x-emphasis-1-3</xsl:when>
          <xsl:when test="parent::entry[preceding-sibling::entry[part-nbr[@indent = '3']]]"> x-emphasis-1-4</xsl:when>
          <xsl:when test="parent::entry[preceding-sibling::entry[part-nbr[@indent = '4']]]"> x-emphasis-1-5</xsl:when>
        </xsl:choose>
     </xsl:attribute>
     <xsl:call-template name="t-base-div-basic"/>
  </div>
</xsl:template>

<xsl:template match="emphasis" priority="0">
  <span>
     <xsl:attribute name="class">
        <xsl:text>x-emphasis-2-0</xsl:text>
        <xsl:if test="@role='bold'"> x-emphasis-2-1</xsl:if>
     </xsl:attribute>
     <xsl:call-template name="t-base-div-basic"/>
  </span>
</xsl:template>

<xsl:template match="endmulti" priority="0">
  <xsl:apply-templates/>
</xsl:template>

<xsl:template match="engine[position()&gt;1]" priority="1">
  <span class="x-engine-1-0">
    <xsl:call-template name="t-base-div-basic"/>
  </span>
</xsl:template>

<xsl:template match="engine" priority="0">
  <span class="x-engine-2-0">
    <xsl:call-template name="t-base-div-basic"/>
  </span>
</xsl:template>

<xsl:template match="_ufe:engine-type" priority="0">
  <div>
     <xsl:attribute name="class">
        <xsl:text>x--ufe-engine-type-1-0</xsl:text>
        <xsl:choose>
          <xsl:when test="@enginetype='FAN'"> x--ufe-engine-type-1-1</xsl:when>
          <xsl:when test="@enginetype='PROP'"> x--ufe-engine-type-1-2</xsl:when>
          <xsl:when test="@enginetype='SHAFT'"> x--ufe-engine-type-1-3</xsl:when>
          <xsl:when test="@enginetype='APU'"> x--ufe-engine-type-1-4</xsl:when>
        </xsl:choose>
     </xsl:attribute>
     <xsl:call-template name="t-base-div-basic"/>
  </div>
</xsl:template>

<xsl:template match="enumlist" priority="0">
  <div class="x-enumlist-1-0">
    <xsl:call-template name="t-base-div-basic"/>
  </div>
</xsl:template>

<xsl:template match="eqn[preceding-sibling::*[1][name() = 'table']]" priority="3">
  <div class="x-eqn-1-0">
    <xsl:call-template name="t-base-div-basic"/>
  </div>
</xsl:template>

<xsl:template match="eqn[@display='inline' and not(child::table)]" priority="2">
  <span class="x-eqn-2-0">
    <xsl:call-template name="t-base-div-basic"/>
  </span>
</xsl:template>

<xsl:template match="eqn[@display='inline']" priority="1">
  <div class="x-eqn-3-0">
    <xsl:call-template name="t-base-div-basic"/>
  </div>
</xsl:template>

<xsl:template match="eqn" priority="0">
  <div class="x-eqn-4-0">
    <xsl:call-template name="t-base-div-basic"/>
  </div>
</xsl:template>

<xsl:template match="facility" priority="0">
  <div class="x-facility-1-0">
    <xsl:call-template name="t-base-div-basic"/>
  </div>
</xsl:template>

<xsl:template match="fandc" priority="0">
  <xsl:apply-templates/>
</xsl:template>

<xsl:template match="fandc-note" priority="0">
  <xsl:apply-templates/>
</xsl:template>

<xsl:template match="address/fax" priority="1">
  <div class="x-fax-1-0">
    <xsl:call-template name="t-base-div-basic"/>
  </div>
</xsl:template>

<xsl:template match="fax" priority="0">
  <div class="x-fax-2-0">
    <xsl:call-template name="t-base-div-basic"/>
  </div>
</xsl:template>

<xsl:template match="_ufe:fig-title" priority="0">
  <div class="x--ufe-fig-title-1-0">
    <xsl:call-template name="t-base-div-basic"/>
  </div>
</xsl:template>

<xsl:template match="figure/figno" priority="1">
  <xsl:param name="hidden" select="'yes'"/>

  <xsl:if test="$hidden='no'">
    <div class="x-figno-1-0">
      <xsl:call-template name="t-base-div-basic"/>
    </div>
  </xsl:if>
</xsl:template>

<xsl:template match="figno" priority="0">
  <div class="x-figno-2-0">
    <xsl:call-template name="t-base-div-basic"/>
  </div>
</xsl:template>

<xsl:template match="fix-equip" priority="0">
  <span class="x-fix-equip-1-0">
    <xsl:call-template name="t-base-div-basic"/>
  </span>
</xsl:template>

<xsl:template match="pgblk/_ufe:fixequ-title" priority="5">
  <div ch:title="notoc" class="x--ufe-fixequ-title-1-0">
    <xsl:call-template name="t-base-div-title"/>
  </div>
</xsl:template>

<xsl:template match="pbfmatr/_ufe:fixequ-title" priority="4">
  <div ch:title="notoc" class="x--ufe-fixequ-title-2-0">
    <xsl:call-template name="t-base-div-title"/>
  </div>
</xsl:template>

<xsl:template match="pwcspblist/_ufe:fixequ-title" priority="3">
  <div ch:title="notoc" class="x--ufe-fixequ-title-3-0">
    <xsl:call-template name="t-base-div-title"/>
  </div>
</xsl:template>

<xsl:template match="page-block//fixtures-and-equipment//_ufe:fixequ-title" priority="2">
  <div ch:title="toc" class="x--ufe-fixequ-title-4-0">
    <xsl:call-template name="t-base-div-title"/>
  </div>
</xsl:template>

<xsl:template match="ata-page-block//fixtures-and-equipment//_ufe:fixequ-title" priority="1">
  <div ch:title="toc" class="x--ufe-fixequ-title-5-0">
    <xsl:call-template name="t-base-div-title"/>
  </div>
</xsl:template>

<xsl:template match="_ufe:fixequ-title" priority="0">
  <div ch:title="notoc" class="x--ufe-fixequ-title-6-0">
    <xsl:call-template name="t-base-div-title"/>
  </div>
</xsl:template>

<xsl:template match="eqn/frac" priority="20">
  <span class="x-frac-1-0">
    <xsl:call-template name="t-base-div-basic"/>
  </span>
</xsl:template>

<xsl:template match="frac" priority="0">
  <span class="x-frac-2-0">
    <xsl:call-template name="t-base-div-basic"/>
  </span>
</xsl:template>

<xsl:template match="frontmatter" priority="0">
  <div class="x-frontmatter-1-0">
    <xsl:call-template name="t-base-div-chunk"/>
    <xsl:apply-templates/>
  </div>
</xsl:template>

<xsl:template match="pgblk/_ufe:general-title" priority="5">
  <div ch:title="notoc" class="x--ufe-general-title-1-0">
    <xsl:call-template name="t-base-div-title"/>
  </div>
</xsl:template>

<xsl:template match="pbfmatr/_ufe:general-title" priority="4">
  <div ch:title="notoc" class="x--ufe-general-title-2-0">
    <xsl:call-template name="t-base-div-title"/>
  </div>
</xsl:template>

<xsl:template match="pwcspblist/_ufe:general-title" priority="3">
  <div ch:title="notoc" class="x--ufe-general-title-3-0">
    <xsl:call-template name="t-base-div-title"/>
  </div>
</xsl:template>

<xsl:template match="page-block//general//_ufe:general-title" priority="2">
  <div ch:title="toc" class="x--ufe-general-title-4-0">
    <xsl:call-template name="t-base-div-title"/>
  </div>
</xsl:template>

<xsl:template match="ata-page-block//general//_ufe:general-title" priority="1">
  <div ch:title="toc" class="x--ufe-general-title-5-0">
    <xsl:call-template name="t-base-div-title"/>
  </div>
</xsl:template>

<xsl:template match="_ufe:general-title" priority="0">
  <div ch:title="notoc" class="x--ufe-general-title-6-0">
    <xsl:call-template name="t-base-div-title"/>
  </div>
</xsl:template>

<xsl:template match="pgblk/_ufe:glossary-title" priority="3">
  <div ch:title="notoc" class="x--ufe-glossary-title-1-0">
    <xsl:call-template name="t-base-div-title"/>
  </div>
</xsl:template>

<xsl:template match="pbfmatr/_ufe:glossary-title" priority="2">
  <div ch:title="notoc" class="x--ufe-glossary-title-2-0">
    <xsl:call-template name="t-base-div-title"/>
  </div>
</xsl:template>

<xsl:template match="pwcspblist/_ufe:glossary-title" priority="1">
  <div ch:title="notoc" class="x--ufe-glossary-title-3-0">
    <xsl:call-template name="t-base-div-title"/>
  </div>
</xsl:template>

<xsl:template match="_ufe:hidden" priority="0">
  <xsl:param name="hidden" select="'yes'"/>

  <xsl:if test="$hidden='no'">
    <span class="x--ufe-hidden-1-0">
      <xsl:call-template name="t-base-div-basic"/>
    </span>
  </xsl:if>
</xsl:template>

<xsl:template match="highlights" priority="0">
  <div class="x-highlights-1-0">
    <xsl:call-template name="t-base-div-chunk">
      <xsl:with-param name="ch-name" select="name()"/>
    </xsl:call-template>
    <xsl:call-template name="t-base-pwcmetainfo"/>
    <xsl:call-template name="t-base-pwcbannerinfo"/>
    <xsl:apply-templates/>
  </div>
</xsl:template>

<xsl:template match="_ufe:highlights-link" priority="0">
  <span class="x--ufe-highlights-link-1-0">
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
  <div ch:title="notoc" class="x--ufe-howtouse-title-1-0">
    <xsl:call-template name="t-base-div-title"/>
  </div>
</xsl:template>

<xsl:template match="pbfmatr/_ufe:howtouse-title" priority="1">
  <div ch:title="notoc" class="x--ufe-howtouse-title-2-0">
    <xsl:call-template name="t-base-div-title"/>
  </div>
</xsl:template>

<xsl:template match="insert" priority="0">
  <xsl:apply-templates/>
</xsl:template>

<xsl:template match="int-mail" priority="0">
  <span class="x-int-mail-1-0">
    <xsl:call-template name="t-base-div-basic"/>
  </span>
</xsl:template>

<xsl:template match="intro" priority="0">
  <div class="x-intro-1-0">
    <xsl:call-template name="t-base-div-basic2"/>
  </div>
</xsl:template>

<xsl:template match="pgblk/_ufe:intro-title" priority="2">
  <div ch:title="notoc" class="x--ufe-intro-title-1-0">
    <xsl:call-template name="t-base-div-title"/>
  </div>
</xsl:template>

<xsl:template match="pbfmatr/_ufe:intro-title" priority="1">
  <div ch:title="notoc" class="x--ufe-intro-title-2-0">
    <xsl:call-template name="t-base-div-title"/>
  </div>
</xsl:template>

<xsl:template match="isempty" priority="0">
  <xsl:apply-templates/>
</xsl:template>

<xsl:template match="step/step/enumlist/item" priority="30">
  <table border="0" cellpadding="0" cellspacing="0" class="x-item-1-0 x--zero-left-margins">
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
  <table border="0" cellpadding="0" cellspacing="0" class="x-item-2-0 x--zero-left-margins x-tab-fixed">
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
  <table border="0" cellpadding="0" cellspacing="0" class="x-item-3-0 x--zero-left-margins x-tab-fixed">
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
  <table border="0" cellpadding="0" cellspacing="0" class="x-item-4-0 x--zero-left-margins x-tab-fixed">
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
  <table border="0" cellpadding="0" cellspacing="0" class="x-item-5-0 x--zero-left-margins x-tab-fixed">
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
  <table border="0" cellpadding="0" cellspacing="0" class="x-item-6-0 x--zero-left-margins x-tab-fixed">
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
  <table border="0" cellpadding="0" cellspacing="0" class="x-item-7-0 x--zero-left-margins x-tab-fixed">
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
  <table border="0" cellpadding="0" cellspacing="0" class="x-item-8-0 x--zero-left-margins x-tab-fixed">
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
  <table border="0" cellpadding="0" cellspacing="0" class="x-item-9-0 x--zero-left-margins x-tab-fixed">
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
  <table border="0" cellpadding="0" cellspacing="0" class="x-item-10-0 x--zero-left-margins x-tab-fixed">
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
  <table border="0" cellpadding="0" cellspacing="0" class="x-item-11-0 x--zero-left-margins x-tab-fixed">
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
  <table border="0" cellpadding="0" cellspacing="0" class="x-item-12-0 x--zero-left-margins x-tab-fixed">
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
  <table border="0" cellpadding="0" cellspacing="0" class="x-item-13-0 x--zero-left-margins x-tab-fixed">
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
  <table border="0" cellpadding="0" cellspacing="0" class="x-item-14-0 x--zero-left-margins x-tab-fixed">
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
  <table border="0" cellpadding="0" cellspacing="0" class="x-item-15-0 x--zero-left-margins x-tab-fixed">
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
  <table border="0" cellpadding="0" cellspacing="0" class="x-item-16-0 x--zero-left-margins x-tab-fixed">
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
  <table border="0" cellpadding="0" cellspacing="0" class="x-item-17-0 x--zero-left-margins">
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
  <table border="0" cellpadding="0" cellspacing="0" class="x-item-18-0 x--zero-left-margins x-tab-fixed">
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
  <table border="0" cellpadding="0" cellspacing="0" class="x-item-19-0 x--zero-left-margins x-tab-fixed">
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
  <table border="0" cellpadding="0" cellspacing="0" class="x-item-20-0 x--zero-left-margins x-tab-fixed">
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
  <table border="0" cellpadding="0" cellspacing="0" class="x-item-21-0 x--zero-left-margins x-tab-fixed">
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
  <table border="0" cellpadding="0" cellspacing="0" class="x-item-22-0 x--zero-left-margins x-tab-fixed">
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
  <table border="0" cellpadding="0" cellspacing="0" class="x-item-23-0 x--zero-left-margins x-tab-fixed">
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
  <table border="0" cellpadding="0" cellspacing="0" class="x-item-24-0 x--zero-left-margins x-tab-fixed">
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
  <table border="0" cellpadding="0" cellspacing="0" class="x-item-25-0 x--zero-left-margins x-tab-fixed">
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
  <table border="0" cellpadding="0" cellspacing="0" class="x-item-26-0 x--zero-left-margins x-tab-fixed">
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
  <table border="0" cellpadding="0" cellspacing="0" class="x-item-27-0 x--zero-left-margins x-tab-fixed">
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
  <table border="0" cellpadding="0" cellspacing="0" class="x-item-28-0 x--zero-left-margins">
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
  <table border="0" cellpadding="0" cellspacing="0" class="x-item-29-0 x--zero-left-margins">
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
  <table border="0" cellpadding="0" cellspacing="0" class="x-item-30-0 x--zero-left-margins x-tab-fixed">
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
  <table border="0" cellpadding="0" cellspacing="0" class="x-item-31-0 x--zero-left-margins">
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
  <div class="x-item-nbr-1-0">
    <xsl:call-template name="t-base-div-basic"/>
  </div>
</xsl:template>

<xsl:template match="figure/key" priority="20">
  <xsl:variable name="l-id"><xsl:value-of select="$pf-id"/><xsl:apply-templates mode="set-id" select="."/></xsl:variable>
  <div>
    <span onclick="toggle('{$l-id}','{$l-id}');" onmouseover="this.style.cursor='pointer'">
      <img alt="key" src="{$images-path}/keytofigure.jpg" style="border-style:none;"/>
    </span>
  </div>
  <div style="display:none" class="x-key-1-0">
     <xsl:copy-of select="@ch:*"/>
     <xsl:if test="@xml:id"><xsl:copy-of select="@xml:id"/></xsl:if>
     <xsl:attribute name="id"><xsl:value-of select="$l-id"/></xsl:attribute>
     <xsl:apply-templates/>
  </div>
  <xsl:call-template name="t-base-js-toggle"/>
</xsl:template>

<xsl:template match="key" priority="0">
  <div class="x-key-2-0">
    <xsl:call-template name="t-base-div-basic"/>
  </div>
</xsl:template>

<xsl:template match="para/list" priority="1">
  <div class="x-list-1-0">
    <xsl:call-template name="t-base-div-basic"/>
  </div>
</xsl:template>

<xsl:template match="list" priority="0">
  <div class="x-list-2-0">
    <xsl:call-template name="t-base-div-basic"/>
  </div>
</xsl:template>

<xsl:template match="lof" priority="0">
  <div class="x-lof-1-0">
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
  <div class="x-lof-item-1-0">
    <xsl:call-template name="t-base-div-basic2"/>
  </div>
</xsl:template>

<xsl:template match="lot" priority="0">
  <div class="x-lot-1-0">
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
  <div class="x-lot-item-1-0">
    <xsl:call-template name="t-base-div-basic2"/>
  </div>
</xsl:template>

<xsl:template match="maint-level" priority="0">
  <xsl:apply-templates/>
</xsl:template>

<xsl:template match="manual-pn" priority="0">
  <div class="x-manual-pn-1-0">
    <xsl:call-template name="t-base-div-basic"/>
  </div>
</xsl:template>

<xsl:template match="pbfmatr/manual-title" priority="3">
  <div ch:title="notoc" class="x-manual-title-1-0">
    <xsl:call-template name="t-base-div-title"/>
  </div>
</xsl:template>

<xsl:template match="pwcspblist/manual-title" priority="2">
  <div ch:title="notoc" class="x-manual-title-2-0">
    <xsl:call-template name="t-base-div-title"/>
  </div>
</xsl:template>

<xsl:template match="pgblk/manual-title" priority="1">
  <div ch:title="notoc" class="x-manual-title-3-0">
    <xsl:call-template name="t-base-div-title"/>
  </div>
</xsl:template>

<xsl:template match="manual-title" priority="0">
  <div ch:title="toc" class="x-manual-title-4-0">
    <xsl:call-template name="t-base-div-title"/>
  </div>
</xsl:template>

<xsl:template match="marker" priority="0">
  <span class="x-marker-1-0">
    <xsl:copy-of select="@ch:*|@id|@xml:id"/>
    <xsl:apply-templates/>
  </span>
</xsl:template>

<xsl:template match="model" priority="0">
  <div class="x-model-1-0">
    <xsl:call-template name="t-base-div-basic"/>
  </div>
</xsl:template>

<xsl:template match="module" priority="0">
  <div>
     <xsl:attribute name="class">
        <xsl:text>x-module-1-0</xsl:text>
        <xsl:choose>
          <xsl:when test="ancestor-or-self::page-block[1]/@pb-name='trlist' and not(ancestor-or-self::page-block[1]/pageblock-title) and not(./title)"> x-module-1-1</xsl:when>
          <xsl:when test="ancestor-or-self::page-block[1]/@pb-name='sblist' and not(ancestor-or-self::page-block[1]/pageblock-title) and not(./title)"> x-module-1-2</xsl:when>
          <xsl:when test="ancestor-or-self::page-block[1]/@pb-name='spblist' and not(ancestor-or-self::page-block[1]/pageblock-title) and not(./title)"> x-module-1-3</xsl:when>
          <xsl:when test="ancestor-or-self::page-block[1]/@pb-name='pdlist' and not(ancestor-or-self::page-block[1]/pageblock-title) and not(./title)"> x-module-1-4</xsl:when>
        </xsl:choose>
     </xsl:attribute>
     <xsl:call-template name="t-base-div-basic2"/>
  </div>
</xsl:template>

<xsl:template match="module-item" priority="0">
  <xsl:apply-templates/>
</xsl:template>

<xsl:template match="multi" priority="0">
  <xsl:apply-templates/>
</xsl:template>

<xsl:template match="n-para" priority="0">
  <div class="x-n-para-1-0">
    <xsl:call-template name="t-base-div-basic2"/>
  </div>
</xsl:template>

<xsl:template match="no-street" priority="0">
  <div class="x-no-street-1-0">
    <xsl:call-template name="t-base-div-basic"/>
  </div>
</xsl:template>

<xsl:template match="nobrk" priority="0">
  <span class="x-nobrk-1-0">
    <xsl:call-template name="t-base-div-basic"/>
  </span>
</xsl:template>

<xsl:template match="_ufe:not-applicable" priority="0">
  <div class="x--ufe-not-applicable-1-0">
    <xsl:call-template name="t-base-div-basic"/>
  </div>
</xsl:template>

<xsl:template match="nowrap" priority="0">
  <span class="x-nowrap-1-0">
    <xsl:call-template name="t-base-div-basic"/>
  </span>
</xsl:template>

<xsl:template match="ata-page-block//_sfe:BeforeOrAfterText//_ufe:npara-numbering" priority="2">
  <span class="x--ufe-npara-numbering-1-0">
    <xsl:call-template name="t-base-div-basic"/>
  </span>
</xsl:template>

<xsl:template match="page-block//_sfe:BeforeOrAfterText//_ufe:npara-numbering" priority="1">
  <span class="x--ufe-npara-numbering-2-0">
    <xsl:call-template name="t-base-div-basic"/>
  </span>
</xsl:template>

<xsl:template match="_ufe:npara-numbering" priority="0">
  <span class="x--ufe-npara-numbering-3-0">
    <xsl:call-template name="t-base-div-basic"/>
  </span>
</xsl:template>

<xsl:template match="num" priority="0">
  <div class="x-num-1-0">
    <xsl:call-template name="t-base-div-basic"/>
  </div>
</xsl:template>

<xsl:template match="num-index" priority="0">
  <div class="x-num-index-1-0">
     <!--
     <xsl:copy-of select="@ch:*"/>
     <xsl:call-template name="maybe-set-id">
        <xsl:with-param name="only-if-id-attr" select="'no'"/>
     </xsl:call-template>
     -->
     <xsl:call-template name="t-base-div-chunk">
       <xsl:with-param name="ch-name" select="'numerical-index'"/>
     </xsl:call-template>
     <xsl:call-template name="t-base-pwcmetainfo"/>
     <xsl:call-template name="t-base-pwcbannerinfo"/>
     <xsl:apply-templates/>
  </div>
</xsl:template>

<xsl:template match="pgblk/_ufe:num-index-title" priority="3">
  <div ch:title="notoc" class="x--ufe-num-index-title-1-0">
    <xsl:call-template name="t-base-div-title"/>
  </div>
</xsl:template>

<xsl:template match="pbfmatr/_ufe:num-index-title" priority="2">
  <div ch:title="notoc" class="x--ufe-num-index-title-2-0">
    <xsl:call-template name="t-base-div-title"/>
  </div>
</xsl:template>

<xsl:template match="pwcspblist/_ufe:num-index-title" priority="1">
  <div ch:title="notoc" class="x--ufe-num-index-title-3-0">
    <xsl:call-template name="t-base-div-title"/>
  </div>
</xsl:template>

<xsl:template match="num-list" priority="0">
  <div class="x-num-list-1-0">
    <xsl:call-template name="t-base-div-basic"/>
  </div>
</xsl:template>

<xsl:template match="pgblk/_ufe:nut-option-title" priority="3">
  <div ch:title="notoc" class="x--ufe-nut-option-title-1-0">
    <xsl:call-template name="t-base-div-title"/>
  </div>
</xsl:template>

<xsl:template match="pbfmatr/_ufe:nut-option-title" priority="2">
  <div ch:title="notoc" class="x--ufe-nut-option-title-2-0">
    <xsl:call-template name="t-base-div-title"/>
  </div>
</xsl:template>

<xsl:template match="pwcspblist/_ufe:nut-option-title" priority="1">
  <div ch:title="notoc" class="x--ufe-nut-option-title-3-0">
    <xsl:call-template name="t-base-div-title"/>
  </div>
</xsl:template>

<xsl:template match="orig-date" priority="0">
  <div class="x-orig-date-1-0">
    <xsl:call-template name="t-base-div-basic"/>
  </div>
</xsl:template>

<xsl:template match="book[contains(@doctype, 'epc')]//page-block[@pb-name='title-page']" priority="6">
  <div class="x-page-block-1-0">
    <xsl:call-template name="t-base-page-block-spec">
      <xsl:with-param name="manual-title" select="'ILLUSTRATED PARTS CATALOG'"/>
      <xsl:with-param name="engine"       select="./module/pwc-title/pwc-model/modelspec"/>
      <xsl:with-param name="manual-pn"    select="ancestor::book/@manualpnr"/>
    </xsl:call-template>
  </div>
</xsl:template>

<xsl:template match="book[contains(@doctype, 'tmm')]//page-block[@pb-name='title-page']" priority="9">
  <div class="x-page-block-2-0">
    <xsl:call-template name="t-base-page-block-spec">
      <xsl:with-param name="manual-title" select="'MAINTENANCE MANUAL'"/>
      <xsl:with-param name="engine"       select="module/mfmatr/pwcem-title/@model"/>
      <xsl:with-param name="manual-pn"    select="ancestor::book/@manualpnr"/>
    </xsl:call-template>
  </div>
</xsl:template>

<xsl:template match="book[contains(@doctype, 'lmm')]//page-block[@pb-name='title-page']" priority="9">
  <div class="x-page-block-2-0">
    <xsl:call-template name="t-base-page-block-spec">
      <xsl:with-param name="manual-title" select="'LINE MAINTENANCE MANUAL'"/>
      <xsl:with-param name="engine"       select="module/mfmatr/pwclmm-title/@model"/>
      <xsl:with-param name="manual-pn"    select="ancestor::book/@manualpnr"/>
    </xsl:call-template>
  </div>
</xsl:template>

<xsl:template match="book[contains(@doctype, 'em')]//page-block[@pb-name='title-page']" priority="8">
  <div class="x-page-block-2-0">
    <xsl:call-template name="t-base-page-block-spec">
      <xsl:with-param name="manual-title" select="'OVERHAUL MANUAL'"/>
      <xsl:with-param name="engine"       select="module/mfmatr/pwcem-title/@model"/>
      <xsl:with-param name="manual-pn"    select="ancestor::book/@manualpnr"/>
    </xsl:call-template>
  </div>
</xsl:template>

<xsl:template match="book[contains(@doctype, 'cir')]//page-block[@pb-name='title-page']" priority="7">
  <div class="x-page-block-2-0">
    <xsl:call-template name="t-base-page-block-spec">
      <xsl:with-param name="manual-title" select="'CLEANING INSPECTION REPAIR (CIR) MANUAL'"/>
      <xsl:with-param name="engine"       select="module/mfmatr/pwcem-title/@model"/>
      <xsl:with-param name="manual-pn"    select="ancestor::book/@manualpnr"/>
    </xsl:call-template>
  </div>
</xsl:template>

<xsl:template match="frontmatter/page-block[@pb-name='title-page']" priority="5">
  <div class="x-page-block-2-0">
    <xsl:call-template name="t-base-page-block-spec">
      <xsl:with-param name="manual-title" select="module/title-page/manual-title"/>
      <xsl:with-param name="engine"       select="module/title-page/model"/>
      <xsl:with-param name="manual-pn"    select="module/title-page/manual-pn"/>
    </xsl:call-template>
  </div>
</xsl:template>

<xsl:template match="book[contains(@doctype, 'cir') or contains(@doctype, 'em')]//page-block[@pb-name='howtouse']" priority="5">
  <div class="x-page-block-5-0">
    <xsl:call-template name="t-base-page-block-gen"/>
  </div>
</xsl:template>

<xsl:template match="page-block[@pb-name='supp_list']" priority="4">
  <div class="x-page-block-2-0">
    <xsl:call-template name="t-base-page-block-gen"/>
  </div>
</xsl:template>

<xsl:template match="page-block[@pb-name='glossary']" priority="3">
  <div class="x-page-block-3-0">
    <xsl:call-template name="t-base-page-block-gen"/>
  </div>
</xsl:template>

<xsl:template match="page-block[@pb-name='intro']" priority="2">
  <div>
    <xsl:attribute name="class">
      <xsl:text>x-page-block-7-0</xsl:text>
      <xsl:if test="(./pageblock-title)"> x-page-block-7-1</xsl:if>
    </xsl:attribute>
    <xsl:call-template name="t-base-page-block-gen"/>
  </div>
</xsl:template>

<xsl:template match="page-block[@pb-name='nut_option']" priority="1">
  <div class="x-page-block-3-0">
    <xsl:call-template name="t-base-page-block-gen"/>
  </div>
</xsl:template>

<xsl:template match="page-block" priority="0">
  <div class="x-page-block-2-0">
    <xsl:call-template name="t-base-page-block-gen"/>
  </div>
</xsl:template>

<xsl:template match="subpara/subpara/subpara/subpara/subpara/subpara[not(title)]/para" priority="52">
  <div class="x-para-1-0">
    <xsl:call-template name="t-base-div-basic"/>
  </div>
</xsl:template>

<xsl:template match="subpara/subpara/subpara/subpara/subpara[not(title)]/para" priority="51">
  <div class="x-para-2-0">
    <xsl:call-template name="t-base-div-basic"/>
  </div>
</xsl:template>

<xsl:template match="subpara/subpara/subpara/subpara[not(title)]/para" priority="50">
  <div class="x-para-3-0">
    <xsl:call-template name="t-base-div-basic"/>
  </div>
</xsl:template>

<xsl:template match="n-para/subpara/subpara[child::title]/para" priority="49">
  <div class="x-para-4-0">
    <xsl:call-template name="t-base-div-basic"/>
  </div>
</xsl:template>

<xsl:template match="subpara/subpara/subpara[not(title)]/para" priority="48">
  <div class="x-para-5-0">
    <xsl:call-template name="t-base-div-basic"/>
  </div>
</xsl:template>

<xsl:template match="subpara/subpara[not(title)]/para" priority="47">
  <div class="x-para-6-0">
    <xsl:call-template name="t-base-div-basic"/>
  </div>
</xsl:template>

<xsl:template match="n-para/subpara[child::title]/para" priority="46">
  <div class="x-para-7-0">
    <xsl:call-template name="t-base-div-basic"/>
  </div>
</xsl:template>

<xsl:template match="prcitem3/prcitem/para" priority="45">
  <div class="x-para-8-0">
    <xsl:call-template name="t-base-div-basic"/>
  </div>
</xsl:template>

<xsl:template match="subpara/subpara/para" priority="44">
  <div class="x-para-9-0">
    <xsl:call-template name="t-base-div-basic"/>
  </div>
</xsl:template>

<xsl:template match="n-para/subpara/para" priority="43">
  <div class="x-para-10-0">
    <xsl:call-template name="t-base-div-basic"/>
  </div>
</xsl:template>

<xsl:template match="book[contains(@doctype, 'cir')]//note/para" priority="42">
  <span class="x-para-11-0">
    <xsl:call-template name="t-base-div-basic"/>
  </span>
</xsl:template>

<xsl:template match="pageblock-front/general//para" priority="41">
  <div class="x-para-12-0">
    <xsl:call-template name="t-base-div-basic"/>
  </div>
</xsl:template>

<xsl:template match="warning/para[1]" priority="40">
  <span class="x-para-13-0">
    <xsl:call-template name="t-base-div-basic"/>
  </span>
</xsl:template>

<xsl:template match="caution/para[1]" priority="39">
  <span class="x-para-14-0">
    <xsl:call-template name="t-base-div-basic"/>
  </span>
</xsl:template>

<xsl:template match="_ufe:step-proc-num/para[1]" priority="38">
  <span class="x-para-15-0">
    <xsl:call-template name="t-base-div-basic"/>
  </span>
</xsl:template>

<xsl:template match="step5/para[1]" priority="37">
  <span class="x-para-16-0">
    <xsl:call-template name="t-base-div-basic"/>
  </span>
</xsl:template>

<xsl:template match="step4/para[1]" priority="36">
  <span class="x-para-17-0">
    <xsl:call-template name="t-base-div-basic"/>
  </span>
</xsl:template>

<xsl:template match="step3/para[1]" priority="35">
  <span class="x-para-18-0">
    <xsl:call-template name="t-base-div-basic"/>
  </span>
</xsl:template>

<xsl:template match="step2/para[1]" priority="34">
  <span class="x-para-19-0">
    <xsl:call-template name="t-base-div-basic"/>
  </span>
</xsl:template>

<xsl:template match="numlitem/para[1]" priority="33">
  <span class="x-para-20-0">
    <xsl:call-template name="t-base-div-basic"/>
  </span>
</xsl:template>

<xsl:template match="note/para[1]" priority="32">
  <span class="x-para-21-0">
    <xsl:call-template name="t-base-div-basic"/>
  </span>
</xsl:template>

<xsl:template match="unlitem/para[1]" priority="31">
  <span class="x-para-22-0">
    <xsl:call-template name="t-base-div-basic"/>
  </span>
</xsl:template>

<xsl:template match="prcitem4/para[1]" priority="30">
  <span class="x-para-23-0">
    <xsl:call-template name="t-base-div-basic"/>
  </span>
</xsl:template>

<xsl:template match="l4item/para[1]" priority="29">
  <span class="x-para-24-0">
    <xsl:call-template name="t-base-div-basic"/>
  </span>
</xsl:template>

<xsl:template match="l3item/para[1]" priority="28">
  <span class="x-para-25-0">
    <xsl:call-template name="t-base-div-basic"/>
  </span>
</xsl:template>

<xsl:template match="l2item/para[1]" priority="27">
  <span class="x-para-26-0">
    <xsl:call-template name="t-base-div-basic"/>
  </span>
</xsl:template>

<xsl:template match="l1item/para[1]" priority="26">
  <span class="x-para-27-0">
    <xsl:call-template name="t-base-div-basic"/>
  </span>
</xsl:template>

<xsl:template match="step/para[1]" priority="25">
  <span class="x-para-28-0">
    <xsl:call-template name="t-base-div-basic"/>
  </span>
</xsl:template>

<xsl:template match="item/para[1]" priority="24">
  <span class="x-para-29-0">
    <xsl:call-template name="t-base-div-basic"/>
  </span>
</xsl:template>

<xsl:template match="n-para[ancestor::book[contains(@doctype, 'epc')]]/para" priority="23">
  <div class="x-para-30-0">
    <xsl:call-template name="t-base-div-basic"/>
  </div>
</xsl:template>

<xsl:template match="_ufe:step-proc-num/para[position()&gt;1]" priority="22">
  <div class="x-para-31-0">
    <xsl:call-template name="t-base-div-basic"/>
  </div>
</xsl:template>

<xsl:template match="step5/para[position()&gt;1]" priority="21">
  <div class="x-para-32-0">
    <xsl:call-template name="t-base-div-basic"/>
  </div>
</xsl:template>

<xsl:template match="step4/para[position()&gt;1]" priority="20">
  <div class="x-para-33-0">
    <xsl:call-template name="t-base-div-basic"/>
  </div>
</xsl:template>

<xsl:template match="step3/para[position()&gt;1]" priority="19">
  <div class="x-para-34-0">
    <xsl:call-template name="t-base-div-basic"/>
  </div>
</xsl:template>

<xsl:template match="step2/para[position()&gt;1]" priority="18">
  <div class="x-para-35-0">
    <xsl:call-template name="t-base-div-basic"/>
  </div>
</xsl:template>

<xsl:template match="numlitem/para[position()&gt;1]" priority="17">
  <div class="x-para-36-0">
    <xsl:call-template name="t-base-div-basic"/>
  </div>
</xsl:template>

<xsl:template match="unlitem/para[position()&gt;1]" priority="16">
  <div class="x-para-37-0">
    <xsl:call-template name="t-base-div-basic"/>
  </div>
</xsl:template>

<xsl:template match="prcitem4/para[position()&gt;1]" priority="15">
  <div class="x-para-38-0">
    <xsl:call-template name="t-base-div-basic"/>
  </div>
</xsl:template>

<xsl:template match="l4item/para[position()&gt;1]" priority="14">
  <div class="x-para-39-0">
    <xsl:call-template name="t-base-div-basic"/>
  </div>
</xsl:template>

<xsl:template match="l3item/para[position()&gt;1]" priority="13">
  <div class="x-para-40-0">
    <xsl:call-template name="t-base-div-basic"/>
  </div>
</xsl:template>

<xsl:template match="l2item/para[position()&gt;1]" priority="12">
  <div class="x-para-41-0">
    <xsl:call-template name="t-base-div-basic"/>
  </div>
</xsl:template>

<xsl:template match="l1item/para[position()&gt;1]" priority="11">
  <div class="x-para-42-0">
    <xsl:call-template name="t-base-div-basic"/>
  </div>
</xsl:template>

<xsl:template match="step/para[position()&gt;1]" priority="10">
  <div class="x-para-43-0">
    <xsl:call-template name="t-base-div-basic"/>
  </div>
</xsl:template>

<xsl:template match="item/para[position()&gt;1]" priority="9">
  <div class="x-para-44-0">
    <xsl:call-template name="t-base-div-basic"/>
  </div>
</xsl:template>

<xsl:template match="taskproc/para" priority="8">
  <div class="x-para-45-0">
    <xsl:call-template name="t-base-div-basic"/>
  </div>
</xsl:template>

<xsl:template match="title-page/para" priority="7">
  <div class="x-para-46-0">
    <xsl:call-template name="t-base-div-basic"/>
  </div>
</xsl:template>

<xsl:template match="numlitem/para" priority="6">
  <span class="x-para-47-0">
    <xsl:call-template name="t-base-div-basic"/>
  </span>
</xsl:template>

<xsl:template match="tprereq/para" priority="5">
  <div class="x-para-48-0">
    <xsl:call-template name="t-base-div-basic"/>
  </div>
</xsl:template>

<xsl:template match="sbnbr/para" priority="4">
  <span class="x-para-49-0">
    <xsl:call-template name="t-base-div-basic"/>
  </span>
</xsl:template>

<xsl:template match="n-para/para" priority="3">
  <div class="x-para-50-0">
    <xsl:call-template name="t-base-div-basic"/>
  </div>
</xsl:template>

<xsl:template match="subpara/para" priority="2">
  <div class="x-para-51-0">
    <xsl:call-template name="t-base-div-basic"/>
  </div>
</xsl:template>

<xsl:template match="nomen-col//para" priority="1">
  <div class="x-para-52-0">
    <xsl:call-template name="t-base-div-basic"/>
  </div>
</xsl:template>

<xsl:template match="para" priority="0">
  <div class="x-para">
    <xsl:call-template name="t-base-div-basic"/>
  </div>
</xsl:template>

<xsl:template match="chapsect-list/part-group" priority="3">
  <table border="0" cellpadding="0" cellspacing="0" class="x-part-group-1-0 x--zero-left-margins">
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

<xsl:template match="numlist/part-group" priority="2">
  <table border="0" cellpadding="0" cellspacing="0" class="x-part-group-2-0 x--zero-left-margins x-tab-fixed">
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

<xsl:template match="pwcchapsect-list/part-group" priority="1">
  <table border="0" cellpadding="0" cellspacing="0" class="x-part-group-3-0 x--zero-left-margins">
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

<xsl:template match="part-group" priority="0">
  <table border="0" cellpadding="0" cellspacing="0" class="x-part-group-4-0 x--zero-left-margins">
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

<xsl:template match="part-loc" priority="0">
  <div class="x-part-loc-1-0">
    <xsl:call-template name="t-base-div-basic"/>
  </div>
</xsl:template>

<xsl:template match="partname" priority="0">
  <xsl:apply-templates/>
</xsl:template>

<xsl:template match="pcextract" priority="0">
  <xsl:apply-templates/>
</xsl:template>

<xsl:template match="pgblk/_ufe:pdlist-title" priority="1">
  <div ch:title="notoc" class="x--ufe-pdlist-title-1-0">
    <xsl:call-template name="t-base-div-title"/>
  </div>
</xsl:template>

<xsl:template match="pgblk-name" priority="0">
  <xsl:apply-templates/>
</xsl:template>

<xsl:template match="pnr" priority="0">
  <span class="x-pnr-1-0">
    <xsl:call-template name="t-base-div-basic"/>
  </span>
</xsl:template>

<xsl:template match="post-tr" priority="0">
  <xsl:apply-templates/>
</xsl:template>

<xsl:template match="postal" priority="0">
  <span class="x-postal-1-0">
    <xsl:call-template name="t-base-div-basic"/>
  </span>
</xsl:template>

<xsl:template match="postsb" priority="0">
  <span class="x-postsb-1-0">
     <xsl:copy-of select="@ch:*"/>
     <xsl:call-template name="maybe-set-id"/>
     <a href="#" onclick="sbLink('{.}');">
        <xsl:apply-templates/>
     </a>
  </span>
</xsl:template>

<xsl:template match="pre-tr" priority="0">
  <xsl:apply-templates/>
</xsl:template>

<xsl:template match="presb" priority="0">
  <span class="x-presb-1-0">
     <xsl:copy-of select="@ch:*"/>
     <xsl:call-template name="maybe-set-id"/>
     <a href="#" onclick="sbLink('{.}');">
        <xsl:apply-templates/>
     </a>
  </span>
</xsl:template>

<xsl:template match="procedure" priority="0">
  <div class="x-procedure-1-0">
    <xsl:call-template name="t-base-div-basic"/>
  </div>
</xsl:template>

<xsl:template match="process" priority="0">
  <span class="x-process-1-0">
    <xsl:call-template name="t-base-div-basic"/>
  </span>
</xsl:template>

<xsl:template match="pwclmm-title//_ufe:proprietary-notice" priority="1">
  <div class="x--ufe-proprietary-notice-1-0">
    <xsl:call-template name="t-base-div-basic"/>
  </div>
</xsl:template>

<xsl:template match="_ufe:proprietary-notice" priority="0">
  <div class="x--ufe-proprietary-notice-2-0">
    <xsl:call-template name="t-base-div-basic"/>
  </div>
</xsl:template>

<xsl:template match="_ufe:proprietary-warning" priority="0">
  <div class="x--ufe-proprietary-warning-1-0">
    <xsl:call-template name="t-base-div-basic"/>
  </div>
</xsl:template>

<xsl:template match="province" priority="0">
  <span class="x-province-1-0">
    <xsl:call-template name="t-base-div-basic"/>
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
                 <xsl:text>x-pwcsoa-1-0</xsl:text>
                 <xsl:if test="not(@size) or (@size and string(@size)!='med')"> x-pwcsoa-1-1</xsl:if>
              </xsl:attribute>
              <xsl:call-template name="t-base-div-basic"/>
           </div>
        </xsl:if>
     </xsl:when>
     <xsl:when test="$fo-class='block'">
        <div>
           <xsl:attribute name="class">
              <xsl:text>x-pwcsoa-1-0</xsl:text>
              <xsl:if test="not(@size) or (@size and string(@size)!='med')"> x-pwcsoa-1-1</xsl:if>
           </xsl:attribute>
           <xsl:call-template name="t-base-div-basic"/>
        </div>
     </xsl:when>
     <xsl:when test="$fo-class='graphic-block'">
        <div>
           <xsl:attribute name="class">
              <xsl:text>x-pwcsoa-1-0</xsl:text>
              <xsl:if test="not(@size) or (@size and string(@size)!='med')"> x-pwcsoa-1-1</xsl:if>
           </xsl:attribute>
           <xsl:call-template name="t-base-img-graphic"/>
        </div>
     </xsl:when>
  </xsl:choose>
</xsl:template>

<xsl:template match="qty[ancestor::book[contains(@doctype,'ipc')]]" priority="1">
  <span>
     <xsl:attribute name="class">
        <xsl:text>x-qty-1-0</xsl:text>
        <xsl:if test="@per-assy='TEXT' or @per-assy='EMPTY'"> x-qty-1-1</xsl:if>
     </xsl:attribute>
     <xsl:call-template name="t-base-div-basic"/>
  </span>
</xsl:template>

<xsl:template match="qty" priority="0">
  <xsl:param name="hidden" select="'yes'"/>
  <xsl:if test="$hidden='no'">
  <span class="x-qty-2-0">
    <xsl:call-template name="t-base-div-basic"/>
  </span>
  </xsl:if>
</xsl:template>

<xsl:template match="quantity" priority="0">
  <div class="x-quantity-1-0">
    <xsl:call-template name="t-base-div-basic"/>
  </div>
</xsl:template>

<xsl:template match="record-of-revisions" priority="0">
  <xsl:apply-templates/>
</xsl:template>

<xsl:template match="address/ref" priority="1">
  <div class="x-ref-1-0">
    <xsl:call-template name="t-base-div-basic"/>
  </div>
</xsl:template>

<xsl:template match="ref" priority="0">
  <div class="x-ref-2-0">
    <xsl:call-template name="t-base-div-basic"/>
  </div>
</xsl:template>

<xsl:template match="table//refext" priority="1">
  <div class="x-refext-1-0">
    <xsl:call-template name="t-base-div-basic"/>
  </div>
</xsl:template>

<xsl:template match="refext" priority="0">
  <span class="x-refext-2-0">
    <xsl:call-template name="t-base-div-basic"/>
  </span>
</xsl:template>

<xsl:template match="refint">
  <xsl:param name="hidden" select="'yes'"/>
  
  <xsl:choose>
    <xsl:when test="ancestor::book[contains(@doctype, 'epc')] and ancestor::table[@tabstyle='parts-list']">
      <div class="x-refint-1-0">
        <xsl:call-template name="t-base-div-basic-h">
          <xsl:with-param name="hidden" select="$hidden"/>
        </xsl:call-template>
      </div>
    </xsl:when>
    <!--
    <xsl:when test="@refid and //*[@id=current()/@refid][self::table and (ancestor::figure or ancestor::graphic)]">
    -->
    <xsl:when test="@refid and .//_gte:Link[@type='table-figure']">
      <span class="x-refint-2-0">
        <xsl:call-template name="t-base-div-basic"/>
      </span>
    </xsl:when>
    <!--
    <xsl:when test="@refid and //*[@id=current()/@refid][self::table]">
    -->
    <xsl:when test="@refid and .//_gte:Link[@type='table']">
      <span class="x-refint-3-0">
        <xsl:call-template name="t-base-div-basic"/>
      </span>
    </xsl:when>
    <xsl:when test="ancestor::book[contains(@doctype, 'epc')]">
      <span class="x-refint-4-0">
        <xsl:call-template name="t-base-div-basic-h">
          <xsl:with-param name="hidden" select="$hidden"/>
        </xsl:call-template>
      </span>
    </xsl:when>
    <xsl:when test="ancestor::book[contains(@doctype, 'cir') or contains(@doctype, 'em')]">
      <span class="x-refint-5-0">
        <xsl:call-template name="t-base-div-basic-h">
          <xsl:with-param name="hidden" select="$hidden"/>
        </xsl:call-template>
      </span>
    </xsl:when>
    <xsl:otherwise>
      <span>
        <xsl:attribute name="class">
          <xsl:text>x-refint-6-0</xsl:text>
          <xsl:if test="@refid"> x-refint-6-1</xsl:if>
        </xsl:attribute>
        <xsl:call-template name="t-base-div-basic-h">
          <xsl:with-param name="hidden" select="$hidden"/>
        </xsl:call-template>
      </span>
    </xsl:otherwise>
  </xsl:choose>
</xsl:template>

<xsl:template match="_ufe:refint-link" priority="0">
  <span class="x--ufe-refint-link-1-0">
    <xsl:call-template name="t-base-div-basic"/>
  </span>
</xsl:template>

<xsl:template match="title-page//rev-date" priority="1">
  <xsl:param name="hidden" select="'yes'"/>

  <xsl:if test="$hidden='no'">
    <div class="x-rev-date-1-0">
      <xsl:call-template name="t-base-div-basic"/>
    </div>
  </xsl:if>
</xsl:template>

<xsl:template match="rev-date" priority="0">
  <div class="x-rev-date-2-0">
    <xsl:call-template name="t-base-div-basic"/>
  </div>
</xsl:template>

<xsl:template match="_ufe:revdate-block" priority="0">
  <div class="x--ufe-revdate-block-1-0">
    <xsl:call-template name="t-base-div-basic"/>
  </div>
</xsl:template>

<xsl:template match="revend" priority="0">
  <div class="x-revend-1-0">
    <xsl:call-template name="t-base-div-basic"/>
  </div>
</xsl:template>

<xsl:template match="revst" priority="0">
  <div class="x-revst-1-0" id="{@ref}">
    <xsl:copy-of select="@ch:*"/>
    <xsl:if test="@xml:id"><xsl:copy-of select="@xml:id"/></xsl:if>
    <xsl:apply-templates/>
  </div>
</xsl:template>

<xsl:template match="sb" priority="0">
  <span class="x-sb-1-0">
     <xsl:copy-of select="@ch:*"/>
     <xsl:call-template name="maybe-set-id"> </xsl:call-template>
     <a href="#" onclick="sbLink('{.}');">
        <xsl:apply-templates/>
     </a>
  </span>
</xsl:template>

<xsl:template match="sb-item" priority="0">
  <xsl:apply-templates/>
</xsl:template>

<xsl:template match="sblist" priority="0">
  <div class="x-sblist-1-0">
    <xsl:call-template name="t-base-div-basic2"/>
  </div>
</xsl:template>

<xsl:template match="pgblk/_ufe:sblist-title" priority="2">
  <div ch:title="notoc" class="x--ufe-sblist-title-1-0">
    <xsl:call-template name="t-base-div-title"/>
  </div>
</xsl:template>

<xsl:template match="pbfmatr/_ufe:sblist-title" priority="1">
  <div ch:title="notoc" class="x--ufe-sblist-title-2-0">
    <xsl:call-template name="t-base-div-title"/>
  </div>
</xsl:template>

<xsl:template match="section" priority="0">
  <div class="x-section-1-0">
    <xsl:call-template name="t-base-div-chunk"/>
    <xsl:apply-templates/>
  </div>
</xsl:template>

<xsl:template match="sin_old" priority="0">
  <xsl:param name="hidden" select="'yes'"/>

  <xsl:if test="$hidden='no'">
    <span class="x-sin-1-0">
      <xsl:call-template name="t-base-div-basic"/>
    </span>
  </xsl:if>
</xsl:template>

<xsl:template match="sin" priority="0">
  <span class="x-sin-2-0">
    <xsl:text> </xsl:text>
    <a href="#" onclick="openIPC('{.}')">
      <xsl:apply-templates/>
    </a>
  </span>
</xsl:template>

<xsl:template match="title-page/soa[@size='med']" priority="2">
  <div class="x-soa-1-0">
     <xsl:call-template name="t-base-img-graphic"/>
  </div>
</xsl:template>

<xsl:template match="soa[@size='med']" priority="1">
  <div class="x-soa-2-0">
     <xsl:call-template name="t-base-img-graphic"/>
  </div>
</xsl:template>

<xsl:template match="soa" priority="0">
  <xsl:param name="hidden" select="'yes'"/>

  <xsl:if test="$hidden='no'">
    <div class="x-soa-3-0">
      <xsl:call-template name="t-base-div-basic"/>
    </div>
  </xsl:if>
</xsl:template>

<xsl:template match="source-item" priority="0">
  <xsl:apply-templates/>
</xsl:template>

<xsl:template match="pgblk/_ufe:spblist-title" priority="2">
  <div ch:title="notoc" class="x--ufe-spblist-title-1-0">
    <xsl:call-template name="t-base-div-title"/>
  </div>
</xsl:template>

<xsl:template match="pbfmatr/_ufe:spblist-title" priority="1">
  <div ch:title="notoc" class="x--ufe-spblist-title-2-0">
    <xsl:call-template name="t-base-div-title"/>
  </div>
</xsl:template>

<xsl:template match="spec-tool-head" priority="0">
  <xsl:apply-templates/>
</xsl:template>

<xsl:template match="spec-tool-row" priority="0">
  <xsl:apply-templates/>
</xsl:template>

<xsl:template match="spec-tool-table" priority="0">
  <div class="x-spec-tool-table-1-0">
    <xsl:call-template name="t-base-div-basic2"/>
  </div>
</xsl:template>

<xsl:template match="pgblk/_ufe:spectools-title" priority="5">
  <div ch:title="notoc" class="x--ufe-spectools-title-1-0">
    <xsl:call-template name="t-base-div-title"/>
  </div>
</xsl:template>

<xsl:template match="pbfmatr/_ufe:spectools-title" priority="4">
  <div ch:title="notoc" class="x--ufe-spectools-title-2-0">
    <xsl:call-template name="t-base-div-title"/>
  </div>
</xsl:template>

<xsl:template match="pwcspblist/_ufe:spectools-title" priority="3">
  <div ch:title="notoc" class="x--ufe-spectools-title-3-0">
    <xsl:call-template name="t-base-div-title"/>
  </div>
</xsl:template>

<xsl:template match="page-block//special-tools//_ufe:spectools-title" priority="2">
  <div ch:title="toc" class="x--ufe-spectools-title-4-0">
    <xsl:call-template name="t-base-div-title"/>
  </div>
</xsl:template>

<xsl:template match="ata-page-block//special-tools//_ufe:spectools-title" priority="1">
  <div ch:title="toc" class="x--ufe-spectools-title-5-0">
    <xsl:call-template name="t-base-div-title"/>
  </div>
</xsl:template>

<xsl:template match="_ufe:spectools-title" priority="0">
  <div ch:title="notoc" class="x--ufe-spectools-title-6-0">
    <xsl:call-template name="t-base-div-title"/>
  </div>
</xsl:template>

<xsl:template match="sqrt" priority="0">
  <span class="x-sqrt-1-0">
    <xsl:call-template name="t-base-div-basic"/>
  </span>
</xsl:template>

<xsl:template match="state" priority="0">
  <span>
     <xsl:attribute name="class">
        <xsl:text>x-state-1-0</xsl:text>
        <xsl:if test="not(./*[not(self::_sfe:BeforeOrAfterText)]|./text()[normalize-space(.)!=''])"> x-state-1-1</xsl:if>
     </xsl:attribute>
     <xsl:call-template name="t-base-div-basic"/>
  </span>
</xsl:template>

<xsl:template match="sub" priority="0">
  <span class="x-sub-1-0">
    <xsl:call-template name="t-base-div-basic"/>
  </span>
</xsl:template>

<xsl:template match="subject" priority="0">
  <div class="x-subject-1-0">
    <xsl:call-template name="t-base-div-chunk"/>
    <xsl:apply-templates/>
  </div>
</xsl:template>

<xsl:template match="subpara/subpara/subpara/subpara/subpara[title and ancestor::subpara[not(title)]]" priority="15">
  <div class="x-subpara-1-0">
    <xsl:call-template name="t-base-div-basic2"/>
  </div>
</xsl:template>

<xsl:template match="subpara/subpara/subpara/subpara/subpara[not(title) and ancestor::subpara[title]]" priority="14">
  <div class="x-subpara-2-0">
    <xsl:call-template name="t-base-div-basic2"/>
  </div>
</xsl:template>

<xsl:template match="subpara/subpara/subpara/subpara/subpara[not(title)]" priority="13">
  <div class="x-subpara-3-0">
    <xsl:call-template name="t-base-div-basic2"/>
  </div>
</xsl:template>

<xsl:template match="subpara/subpara/subpara/subpara[title and ancestor::subpara[not(title)]]" priority="12">
  <div class="x-subpara-4-0">
    <xsl:call-template name="t-base-div-basic2"/>
  </div>
</xsl:template>

<xsl:template match="subpara/subpara/subpara/subpara[not(title) and ancestor::subpara[title]]" priority="11">
  <div class="x-subpara-5-0">
    <xsl:call-template name="t-base-div-basic2"/>
  </div>
</xsl:template>

<xsl:template match="subpara/subpara/subpara/subpara[not(title)]" priority="10">
  <div class="x-subpara-6-0">
    <xsl:call-template name="t-base-div-basic2"/>
  </div>
</xsl:template>

<xsl:template match="subpara/subpara/subpara[title and ancestor::subpara[not(title)]]" priority="9">
  <div class="x-subpara-7-0">
    <xsl:call-template name="t-base-div-basic2"/>
  </div>
</xsl:template>

<xsl:template match="subpara/subpara/subpara[not(title) and ancestor::subpara[title]]" priority="8">
  <div class="x-subpara-8-0">
    <xsl:call-template name="t-base-div-basic2"/>
  </div>
</xsl:template>

<xsl:template match="subpara/subpara/subpara[not(title)]" priority="7">
  <div class="x-subpara-9-0">
    <xsl:call-template name="t-base-div-basic2"/>
  </div>
</xsl:template>

<xsl:template match="page-block[@pb-name='intro']//n-para/subpara[child::title]" priority="6">
  <div class="x-subpara-10-0">
    <xsl:call-template name="t-base-div-basic2"/>
  </div>
</xsl:template>

<xsl:template match="page-block[@pb-name='intro']//n-para/subpara" priority="5">
  <div class="x-subpara-11-0">
    <xsl:call-template name="t-base-div-basic2"/>
  </div>
</xsl:template>

<xsl:template match="subpara/subpara[title and ancestor::subpara[not(title)]]" priority="4">
  <div class="x-subpara-12-0">
    <xsl:call-template name="t-base-div-basic2"/>
  </div>
</xsl:template>

<xsl:template match="subpara/subpara[not(title) and ancestor::subpara[title]]" priority="3">
  <div class="x-subpara-13-0">
    <xsl:call-template name="t-base-div-basic2"/>
  </div>
</xsl:template>

<xsl:template match="subpara/subpara[not(title)]" priority="2">
  <div class="x-subpara-14-0">
    <xsl:call-template name="t-base-div-basic2"/>
  </div>
</xsl:template>

<xsl:template match="subpara[not(title)]" priority="1">
  <div class="x-subpara-15-0">
    <xsl:call-template name="t-base-div-basic2"/>
  </div>
</xsl:template>

<xsl:template match="subpara" priority="0">
  <div class="x-subpara-16-0">
    <xsl:call-template name="t-base-div-basic2"/>
  </div>
</xsl:template>

<xsl:template match="sup" priority="0">
  <span class="x-sup-1-0">
    <xsl:call-template name="t-base-div-basic"/>
  </span>
</xsl:template>

<xsl:template match="pgblk/_ufe:supplier-list-title" priority="3">
  <div ch:title="notoc" class="x--ufe-supplier-list-title-1-0">
    <xsl:call-template name="t-base-div-title"/>
  </div>
</xsl:template>

<xsl:template match="pbfmatr/_ufe:supplier-list-title" priority="2">
  <div ch:title="notoc" class="x--ufe-supplier-list-title-2-0">
    <xsl:call-template name="t-base-div-title"/>
  </div>
</xsl:template>

<xsl:template match="pwcspblist/_ufe:supplier-list-title" priority="1">
  <div ch:title="notoc" class="x--ufe-supplier-list-title-3-0">
    <xsl:call-template name="t-base-div-title"/>
  </div>
</xsl:template>

<xsl:template match="table[@display='expand']" priority="13">
  <div>
  <xsl:attribute name="class">
  	<xsl:text>x-table-1-0</xsl:text>
  	<xsl:if test="title"><xsl:text> pr-tbl</xsl:text></xsl:if>
  </xsl:attribute>
  <xsl:if test="title">
  	<xsl:attribute name="id">
  		<xsl:value-of select="concat('pr_', generate-id(.))"/>
  	</xsl:attribute>
  </xsl:if>
    <xsl:call-template name="t-base-div-basic2"/>
  </div>
</xsl:template>

<xsl:template match="table[not(title) and not(@tabstyle='frac')]" priority="12">
  <div>
    <xsl:attribute name="class">
      <xsl:text>x-table-2-0</xsl:text>
      <xsl:if test="ancestor-or-self::page-block[1]/@pb-name='title-page'"> x-table-2-1</xsl:if>
	  <xsl:if test="title"><xsl:text> pr-tbl</xsl:text></xsl:if>      
   </xsl:attribute>
   <xsl:if test="title">
	  	<xsl:attribute name="id">
	  		<xsl:value-of select="concat('pr_', generate-id(.))"/>
	  	</xsl:attribute>
  	</xsl:if>
    <xsl:call-template name="t-base-div-basic2"/>
  </div>
</xsl:template>

<xsl:template match="sheet/gdesc/table" priority="9">
  <div>
  	<xsl:if test="title">
   	  <xsl:attribute name="id">
        <xsl:value-of select="concat('pr_', generate-id(.))"/>
  	  </xsl:attribute>
  	  <xsl:attribute name="class">
        <xsl:text>pr-tbl</xsl:text>
  	  </xsl:attribute>
  	</xsl:if>
	<div>
	  <a href="#none" onclick="toggle('{@id}','{@id}');">
	    <img alt="table" src="{$images-path}/table.gif" style="border-style:none;"/>
	    <xsl:text>                   </xsl:text>
	    <xsl:apply-templates mode="numbering" select="title"/>
	  </a>
	</div>
	<div style="display:none" class="x-table-3-0">
	   <xsl:copy-of select="@ch:*"/>
	   <xsl:if test="@xml:id"><xsl:copy-of select="@xml:id"/></xsl:if>
	   <xsl:attribute name="id">
	      <xsl:value-of select="$pf-id"/>
	      <xsl:apply-templates mode="set-id" select="."/>
	   </xsl:attribute>
	   <xsl:apply-templates/>
	</div>
	<xsl:call-template name="t-base-js-toggle"/>
  </div>
</xsl:template>

<xsl:template match="highlights/table" priority="10">
  <div>
    <xsl:attribute name="class">
  	  <xsl:text>x-table-4-0</xsl:text>
  	  <xsl:if test="title"><xsl:text> pr-tbl</xsl:text></xsl:if>
    </xsl:attribute>
    <xsl:if test="title">
      <xsl:attribute name="id">
        <xsl:value-of select="concat('pr_', generate-id(.))"/>
  	  </xsl:attribute>
    </xsl:if>
    <xsl:call-template name="t-base-div-basic2"/>
  </div>
</xsl:template>

<xsl:template match="figure/table" priority="7">
  <div>
  	<xsl:if test="title">
   	  <xsl:attribute name="id">
        <xsl:value-of select="concat('pr_', generate-id(.))"/>
  	  </xsl:attribute>
  	  <xsl:attribute name="class">
        <xsl:text>pr-tbl</xsl:text>
  	  </xsl:attribute>
  	</xsl:if>
    <div>
      <a href="#none" onclick="toggle('{@id}','{@id}');">
        <img alt="table" src="{$images-path}/table.gif" style="border-style:none;"/>
        <xsl:text>                   </xsl:text>
        <xsl:apply-templates mode="numbering" select="title"/>
      </a>
    </div>
    <div style="display:none" class="x-table-5-0">
       <xsl:copy-of select="@ch:*"/>
       <xsl:if test="@xml:id"><xsl:copy-of select="@xml:id"/></xsl:if>
       <xsl:attribute name="id">
          <xsl:value-of select="$pf-id"/>
          <xsl:apply-templates mode="set-id" select="."/>
       </xsl:attribute>
       <xsl:apply-templates/>
    </div>
    <xsl:call-template name="t-base-js-toggle"/>
  </div>
</xsl:template>

<xsl:template match="mfmatr//table[title]" priority="8">
  <div>
  	<xsl:if test="title">
   	  <xsl:attribute name="id">
        <xsl:value-of select="concat('pr_', generate-id(.))"/>
  	  </xsl:attribute>
  	  <xsl:attribute name="class">
        <xsl:text>pr-tbl</xsl:text>
  	  </xsl:attribute>
  	</xsl:if>
    <div>
      <a href="#none" onclick="toggle('{@id}','{@id}');">
        <img alt="table" src="{$images-path}/table.gif" style="border-style:none;"/>
        <xsl:text>                   </xsl:text>
        <xsl:apply-templates mode="numbering" select="title"/>
      </a>
    </div>
    <div style="display:none" class="x-table-6-0">
       <xsl:call-template name="t-base-div-basic2"/>
    </div>
  </div>
</xsl:template>

<xsl:template match="mfmatr//table" priority="7">
  <div>
    <xsl:attribute name="class">
  	  <xsl:text>x-table-7-0</xsl:text>
  	  <xsl:if test="title"><xsl:text> pr-tbl</xsl:text></xsl:if>
    </xsl:attribute>
    <xsl:if test="title">
      <xsl:attribute name="id">
        <xsl:value-of select="concat('pr_', generate-id(.))"/>
  	  </xsl:attribute>
    </xsl:if>
    <xsl:call-template name="t-base-div-basic2"/>
  </div>
</xsl:template>

<xsl:template match="table[@tabstyle='eqn' and @display='inline']" priority="6">
  <span style="display:inline-block">
    <xsl:attribute name="class">
  	  <xsl:text>x-table-8-0</xsl:text>
  	  <xsl:if test="title"><xsl:text> pr-tbl</xsl:text></xsl:if>
    </xsl:attribute>
    <xsl:if test="title">
      <xsl:attribute name="id">
        <xsl:value-of select="concat('pr_', generate-id(.))"/>
  	  </xsl:attribute>
    </xsl:if>
    <xsl:call-template name="t-base-div-basic2"/>
  </span>
</xsl:template>

<xsl:template match="table[@tabstyle='IPCDET']" priority="5">
  <div>
    <xsl:attribute name="class">
  	  <xsl:text>x-table-9-0</xsl:text>
  	  <xsl:if test="title"><xsl:text> pr-tbl</xsl:text></xsl:if>
    </xsl:attribute>
    <xsl:if test="title">
      <xsl:attribute name="id">
        <xsl:value-of select="concat('pr_', generate-id(.))"/>
  	  </xsl:attribute>
    </xsl:if>
    <xsl:call-template name="t-base-div-basic2"/>
  </div>
</xsl:template>

<xsl:template match="table[@tabstyle='frac' and parent::item]" priority="4">
  <span style="display:inline-block">
    <xsl:attribute name="class">
  	  <xsl:text>x-table-10-0</xsl:text>
  	  <xsl:if test="title"><xsl:text> pr-tbl</xsl:text></xsl:if>
    </xsl:attribute>
    <xsl:if test="title">
      <xsl:attribute name="id">
        <xsl:value-of select="concat('pr_', generate-id(.))"/>
  	  </xsl:attribute>
    </xsl:if>
    <xsl:call-template name="t-base-div-basic2"/>
  </span>
</xsl:template>

<xsl:template match="table[@tabstyle='frac' and (parent::step1 or parent::step2 or parent::step3 or parent::step4 or parent::step5)]" priority="3">
  <span style="display:inline-block">
  		<xsl:attribute name="class">
  	  <xsl:text>x-table-11-0</xsl:text>
  	  <xsl:if test="title"><xsl:text> pr-tbl</xsl:text></xsl:if>
    </xsl:attribute>
    <xsl:if test="title">
      <xsl:attribute name="id">
        <xsl:value-of select="concat('pr_', generate-id(.))"/>
  	  </xsl:attribute>
    </xsl:if>
    <xsl:call-template name="t-base-div-basic2"/>
  </span>
</xsl:template>

<xsl:template match="table[@tabstyle='frac']" priority="2">
  <span style="display:inline-block">
    <xsl:attribute name="class">
  	  <xsl:text>x-table-12-0</xsl:text>
  	  <xsl:if test="title"><xsl:text> pr-tbl</xsl:text></xsl:if>
    </xsl:attribute>
    <xsl:if test="title">
      <xsl:attribute name="id">
        <xsl:value-of select="concat('pr_', generate-id(.))"/>
  	  </xsl:attribute>
    </xsl:if>
    <xsl:call-template name="t-base-div-basic2"/>
  </span>
</xsl:template>

<xsl:template match="table[@tabstyle='eqn']" priority="1">
  <div>
    <xsl:attribute name="class">
  	  <xsl:text>x-table-13-0</xsl:text>
  	  <xsl:if test="title"><xsl:text> pr-tbl</xsl:text></xsl:if>
    </xsl:attribute>
    <xsl:if test="title">
      <xsl:attribute name="id">
        <xsl:value-of select="concat('pr_', generate-id(.))"/>
  	  </xsl:attribute>
    </xsl:if>
    <xsl:call-template name="t-base-div-basic2"/>
  </div>
</xsl:template>

<xsl:template match="table" priority="0">
  <div>
  	<xsl:if test="title">
   	  <xsl:attribute name="id">
        <xsl:value-of select="concat('pr_', generate-id(.))"/>
  	  </xsl:attribute>
  	  <xsl:attribute name="class">
        <xsl:text>pr-tbl</xsl:text>
  	  </xsl:attribute>
  	</xsl:if>
    <div>
      <a href="#none" onclick="toggle('{@id}','{@id}');">
        <img alt="table" src="{$images-path}/table.gif" style="border-style:none;"/>
        <xsl:text>                   </xsl:text>
        <xsl:apply-templates mode="numbering" select="title"/>
      </a>
    </div>
    <div style="display:none">
      <xsl:attribute name="class">
        <xsl:text>x-table-14-0</xsl:text>
        <xsl:if test="@tabstyle='general' or @tabstyle='consumables' or @tabstyle='special-tools' or @tabstyle='fixtures-and-equipment'"> x-table-13-1</xsl:if>
      </xsl:attribute>
      <xsl:call-template name="t-base-div-basic2"/>
    </div>
  </div>
</xsl:template>

<xsl:template match="_ufe:task-postspace" priority="0">
  <div class="x--ufe-task-postspace-1-0">
    <xsl:call-template name="t-base-div-basic"/>
  </div>
</xsl:template>

<xsl:template match="pgblk/_ufe:task-title" priority="3">
  <div ch:title="notoc" class="x--ufe-task-title-1-0">
    <xsl:call-template name="t-base-div-title"/>
  </div>
</xsl:template>

<xsl:template match="pbfmatr/_ufe:task-title" priority="2">
  <div ch:title="notoc" class="x--ufe-task-title-2-0">
    <xsl:call-template name="t-base-div-title"/>
  </div>
</xsl:template>

<xsl:template match="_ufe:task-title" priority="0">
  <div ch:title="notoc" class="x--ufe-task-title-4-0">
    <xsl:call-template name="t-base-div-title"/>
  </div>
</xsl:template>

<xsl:template match="address/tel[1]" priority="2">
  <div class="x-tel-1-0">
    <xsl:call-template name="t-base-div-basic"/>
  </div>
</xsl:template>

<xsl:template match="address/tel[position()&gt;1]" priority="1">
  <div class="x-tel-2-0">
    <xsl:call-template name="t-base-div-basic"/>
  </div>
</xsl:template>

<xsl:template match="tel" priority="0">
  <div class="x-tel-3-0">
    <xsl:call-template name="t-base-div-basic"/>
  </div>
</xsl:template>

<xsl:template match="pgblk/_ufe:temp-rev-title" priority="2">
  <div ch:title="notoc" class="x--ufe-temp-rev-title-1-0">
    <xsl:call-template name="t-base-div-title"/>
  </div>
</xsl:template>

<xsl:template match="pbfmatr/_ufe:temp-rev-title" priority="1">
  <div ch:title="notoc" class="x--ufe-temp-rev-title-2-0">
    <xsl:call-template name="t-base-div-title"/>
  </div>
</xsl:template>

<xsl:template match="deflist/term" priority="1">
  <span class="x-term-1-0">
    <xsl:call-template name="t-base-div-basic"/>
  </span>
</xsl:template>

<xsl:template match="term" priority="0">
  <span class="x-term-2-0">
    <xsl:call-template name="t-base-div-basic"/>
  </span>
</xsl:template>

<xsl:template match="subpara/subpara/subpara/subpara/subpara/title" priority="72">
  <div ch:title="notoc" class="x-title-1-0">
    <xsl:call-template name="t-base-div-title"/>
  </div>
</xsl:template>

<xsl:template match="subpara/subpara/subpara/subpara/title" priority="71">
  <div ch:title="notoc" class="x-title-2-0">
    <xsl:call-template name="t-base-div-title"/>
  </div>
</xsl:template>

<xsl:template match="subpara/subpara/subpara/title" priority="70">
  <div ch:title="notoc" class="x-title-3-0">
    <xsl:call-template name="t-base-div-title"/>
  </div>
</xsl:template>

<xsl:template match="book[contains(@doctype, 'epc')]/frontmatter//graphic/title" priority="69">
  <div ch:title="notoc" class="x-title-4-0">
    <xsl:call-template name="t-base-div-title"/>
  </div>
</xsl:template>

<xsl:template match="ata-page-block//task/graphic/title" priority="67">
  <div ch:title="notoc">
   <xsl:attribute name="class">
    <xsl:text>x-title-6-0</xsl:text>
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
    <xsl:text>x-title-7-0</xsl:text>
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
  <div ch:title="notoc" class="x-title-7-0">
    <xsl:call-template name="t-base-div-title"/>
  </div>
</xsl:template>

<xsl:template match="page-block[@pb-name='supp_list']/module/title" priority="60">
  <div ch:title="notoc" class="x-title-8-0">
    <xsl:call-template name="t-base-div-title"/>
  </div>
</xsl:template>

<xsl:template match="mm-fits/subpara/title" priority="62">
  <div ch:title="notoc" class="x-title-11-0">
    <xsl:call-template name="t-base-div-title"/>
  </div>
</xsl:template>

<xsl:template match="prcitem4/prcitem/title" priority="60">
  <div ch:title="notoc" class="x-title-10-0">
    <xsl:call-template name="t-base-div-title"/>
  </div>
</xsl:template>

<xsl:template match="prcitem3/prcitem/title" priority="60">
  <div ch:title="notoc" class="x-title-13-0">
    <xsl:call-template name="t-base-div-title"/>
  </div>
</xsl:template>

<xsl:template match="prcitem2/prcitem/title" priority="59">
  <div ch:title="notoc" class="x-title-14-0">
    <xsl:call-template name="t-base-div-title"/>
  </div>
</xsl:template>

<xsl:template match="prcitem1/prcitem/title" priority="55">
  <div ch:title="toc" class="x-title-13-0">
    <xsl:call-template name="t-base-div-title"/>
  </div>
</xsl:template>

<xsl:template match="subpara/subpara/title" priority="57">
  <div ch:title="notoc" class="x-title-16-0">
    <xsl:call-template name="t-base-div-title"/>
  </div>
</xsl:template>

<xsl:template match="task//table/title" priority="51">
  <xsl:param name="hidden" select="'yes'"/>

  <xsl:variable name="l-content">
    <div>
       <xsl:attribute name="class">
          <xsl:text>x-title-22-0</xsl:text>
          <xsl:choose>
            <xsl:when test="&anc-pgblk-0-13; and &anc-task-c; and ../@display='expand'"> x-title-22-1</xsl:when>
            <xsl:when test="&anc-pgblk-0-13; and &anc-task-v; and ../@display='expand'"> x-title-22-2</xsl:when>
            <xsl:when test="&anc-pgblk-0-13; and ../@display='expand'"> x-title-22-3</xsl:when>
            <xsl:when test="&anc-pgblk-0-13;"> x-title-22-4</xsl:when>
            <xsl:when test="&anc-task-c; and ../@display='expand'"> x-title-22-5</xsl:when>
            <xsl:when test="&anc-task-v; and ../@display='expand'"> x-title-22-6</xsl:when>
            <xsl:when test="../@display='expand'"> x-title-22-7</xsl:when>
            <xsl:otherwise> x-title-22-8</xsl:otherwise>
          </xsl:choose>
       </xsl:attribute>
       <xsl:call-template name="t-base-div-basic-h">
          <xsl:with-param name="hidden" select="$hidden"/>
       </xsl:call-template>
    </div>
  </xsl:variable>
  <xsl:if test="normalize-space(replace($l-content//text(),'&#xa0;',''))!=''">
    <xsl:copy-of select="$l-content"/>
  </xsl:if>
</xsl:template>

<xsl:template match="page-block//graphic/title" priority="50">
  <div ch:title="notoc">
   <xsl:attribute name="class">
    <xsl:text>x-title-23-0</xsl:text>
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
    <xsl:text>x-title-24-0</xsl:text>
        <xsl:choose>
          <xsl:when test="&anc-pgblk-0-13;"> x-title-24-1</xsl:when>
          <xsl:otherwise> x-title-24-2</xsl:otherwise>
        </xsl:choose>
   </xsl:attribute>
    <xsl:call-template name="t-base-div-title"/>
  </div>
</xsl:template>

<xsl:template match="page-block//mm-fits/title" priority="47">
  <div ch:title="toc" class="x-title-23-0">
    <xsl:call-template name="t-base-div-title"/>
  </div>
</xsl:template>

<xsl:template match="ata-page-block//mm-fits/title" priority="46">
  <div ch:title="toc" class="x-title-24-0">
    <xsl:call-template name="t-base-div-title"/>
  </div>
</xsl:template>

<xsl:template match="ata-page-block//fits-and-clears/title" priority="46">
  <div ch:title="notoc" class="x-title-27-0">
    <xsl:call-template name="t-base-div-title"/>
  </div>
</xsl:template>

<xsl:template match="page-block//fits-and-clears/title" priority="45">
  <div ch:title="notoc" class="x-title-28-0">
    <xsl:call-template name="t-base-div-title"/>
  </div>
</xsl:template>

<xsl:template match="ata-page-block//n-para/title" priority="43">
  <div ch:title="toc" class="x-title-27-0">
    <xsl:call-template name="t-base-div-title"/>
  </div>
</xsl:template>

<xsl:template match="page-block//n-para/title" priority="42">
  <div ch:title="toc" class="x-title-28-0">
    <xsl:call-template name="t-base-div-title"/>
  </div>
</xsl:template>

<xsl:template match="mfmatr/title" priority="42">
  <xsl:param name="hidden" select="'yes'"/>
  
  <xsl:if test="$hidden='no'">
     <div class="x-title-31-0">
        <xsl:call-template name="t-base-div-basic"/>
     </div>
  </xsl:if>
</xsl:template>

<xsl:template match="figure/title" priority="41">
  <div ch:title="notoc">
   <xsl:attribute name="class">
    <xsl:text>x-title-32-0</xsl:text>
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
  <div ch:title="notoc" class="x-title-35-0">
    <xsl:call-template name="t-base-div-title"/>
  </div>
</xsl:template>

<xsl:template match="procedure/title" priority="37">
  <div ch:title="notoc">
   <xsl:attribute name="class">
    <xsl:text>x-title-36-0</xsl:text>
    <xsl:if test="ancestor-or-self::table[1]/@role='torque-and-stretch' or ancestor-or-self::table[1]/@role='spec-assem'"> x-title-36-1</xsl:if>
   </xsl:attribute>
    <xsl:call-template name="t-base-div-title"/>
  </div>
</xsl:template>

<xsl:template match="taskproc/title" priority="34">
  <div ch:title="notoc" class="x-title-39-0">
    <xsl:call-template name="t-base-div-title"/>
  </div>
</xsl:template>

<xsl:template match="nutopt/title" priority="32">
  <div ch:title="notoc" class="x-title-38-0">
    <xsl:call-template name="t-base-div-title"/>
  </div>
</xsl:template>

<xsl:template match="pwcchapsect-item/title" priority="28">
  <div ch:title="notoc" class="x-title-45-0">
    <xsl:call-template name="t-base-div-title"/>
  </div>
</xsl:template>

<xsl:template match="tprereq/title" priority="27">
  <div ch:title="notoc" class="x-title-46-0">
    <xsl:call-template name="t-base-div-title"/>
  </div>
</xsl:template>

<xsl:template match="subtask/title" priority="26">
  <div ch:title="notoc" class="x-title-47-0">
    <xsl:call-template name="t-base-div-title"/>
  </div>
</xsl:template>

<xsl:template match="fits/title" priority="25">
  <div ch:title="toc" class="x-title-48-0">
    <xsl:call-template name="t-base-div-title"/>
  </div>
</xsl:template>

<xsl:template match="task/title" priority="24">
  <div ch:title="toc" class="x-title-47-0">
    <xsl:call-template name="t-base-div-title"/>
  </div>
</xsl:template>

<xsl:template match="howtouse/title" priority="23">
  <xsl:param name="hidden" select="'yes'"/>

  <xsl:if test="$hidden='no'">
     <div class="x-title-50-0">
        <xsl:call-template name="t-base-div-basic"/>
     </div>
  </xsl:if>
</xsl:template>

<xsl:template match="highlights/title" priority="22">
  <div ch:title="toc" class="x-title-51-0">
    <xsl:call-template name="t-base-div-title"/>
  </div>
</xsl:template>

<xsl:template match="lot-item/title" priority="20">
  <div ch:title="notoc" class="x-title-53-0">
    <xsl:call-template name="t-base-div-title"/>
  </div>
</xsl:template>

<xsl:template match="lot/title" priority="19">
  <div ch:title="toc" class="x-title-54-0">
    <xsl:call-template name="t-base-div-title"/>
  </div>
</xsl:template>

<xsl:template match="table//procedure//title" priority="17">
  <div ch:title="notoc" class="x-title-56-0">
    <xsl:call-template name="t-base-div-title"/>
  </div>
</xsl:template>

<xsl:template match="torque-and-stretch/title" priority="16">
  <div ch:title="notoc" class="x-title-57-0">
    <xsl:call-template name="t-base-div-title"/>
  </div>
</xsl:template>

<xsl:template match="spec-tool-table/title" priority="15">
  <div ch:title="notoc" class="x-title-58-0">
    <xsl:call-template name="t-base-div-title"/>
  </div>
</xsl:template>

<xsl:template match="subject/title" priority="13">
  <div ch:title="toc" class="x-title-60-0">
    <xsl:call-template name="t-base-div-title"/>
  </div>
</xsl:template>

<xsl:template match="section/title" priority="12">
  <div ch:title="toc" class="x-title-61-0">
    <xsl:call-template name="t-base-div-title"/>
  </div>
</xsl:template>

<xsl:template match="page-block/title" priority="11">
  <div ch:title="notoc" class="x-title-62-0">
    <xsl:call-template name="t-base-div-title"/>
  </div>
</xsl:template>

<xsl:template match="frontmatter/title" priority="8">
  <div ch:title="toc" class="x-title-65-0">
    <xsl:call-template name="t-base-div-title"/>
  </div>
</xsl:template>

<xsl:template match="table[@display='expand']/title" priority="6">
  <div ch:title="notoc">
   <xsl:attribute name="class">
    <xsl:text>x-title-67-0</xsl:text>
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

  <div>
    <xsl:attribute name="class">
      <xsl:text>x-title-68-0</xsl:text>
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
    <xsl:call-template name="t-base-div-basic-h">
      <xsl:with-param name="hidden" select="$hidden"/>
    </xsl:call-template>
  </div>
</xsl:template>

<xsl:template match="chapter/title" priority="4">
  <div ch:title="toc" class="x-title-69-0">
    <xsl:call-template name="t-base-div-title"/>
  </div>
</xsl:template>

<xsl:template match="book/title" priority="3">
  <div ch:title="notoc" class="x-title-70-0">
    <xsl:call-template name="t-base-div-title"/>
  </div>
</xsl:template>

<xsl:template match="ata-page-block/title" priority="2">
  <div ch:title="notoc" class="x-title-71-0">
    <xsl:call-template name="t-base-div-title"/>
  </div>
</xsl:template>

<xsl:template match="title-page/title" priority="1">
  <div ch:title="notoc" class="x-title-72-0">
    <xsl:call-template name="t-base-div-title"/>
  </div>
</xsl:template>

<xsl:template match="title" priority="0">
  <div ch:title="notoc">
   <xsl:attribute name="class">
    <xsl:text>x-title-73-0</xsl:text>
    <xsl:if test="parent::list"> x-title-73-1</xsl:if>
   </xsl:attribute>
    <xsl:call-template name="t-base-div-title"/>
  </div>
</xsl:template>

<xsl:template match="_ufe:title-block" priority="0">
  <div class="x--ufe-title-block-1-0">
    <xsl:call-template name="t-base-div-basic"/>
  </div>
</xsl:template>

<xsl:template match="title-page" priority="0">
  <div class="x-title-page-1-0">
    <xsl:call-template name="t-base-div-chunk">
      <xsl:with-param name="ch-name" select="name()"/>
    </xsl:call-template>
    <div id="pwcbannerinfo" style="display:none">
      <div id="manualTitle"><xsl:value-of select="manual-title"/></div>
      <div id="engine">
        <xsl:for-each select="model/*[not(self::para)]">
          <xsl:value-of select="self::node()"/>
        </xsl:for-each>
      </div>
      <div id="manualPn"><xsl:value-of select="manual-pn"/></div>
      <div id="pointRev"><xsl:value-of select="ancestor::book/@point-revnbr"/></div>
      <div id="revision"><xsl:value-of select="ancestor::book/@revnbr"/></div>
      <div id="revDate" ><xsl:value-of select="ancestor::book/@revdate"/></div>
   </div>
   <xsl:apply-templates/>
  </div>
</xsl:template>

<xsl:template match="pgblk/_ufe:tmm-title" priority="2">
  <div ch:title="notoc" class="x--ufe-tmm-title-1-0">
    <xsl:call-template name="t-base-div-title"/>
  </div>
</xsl:template>

<xsl:template match="pbfmatr/_ufe:tmm-title" priority="1">
  <div ch:title="notoc" class="x--ufe-tmm-title-2-0">
    <xsl:call-template name="t-base-div-title"/>
  </div>
</xsl:template>

<xsl:template match="toc" priority="0">
  <xsl:apply-templates/>
</xsl:template>

<xsl:template match="tool" priority="0">
  <span class="x-tool-1-0">
    <xsl:call-template name="t-base-div-basic"/>
  </span>
</xsl:template>

<xsl:template match="toolname" priority="0">
  <span class="x-toolname-1-0">
    <xsl:call-template name="t-base-div-basic"/>
  </span>
</xsl:template>

<xsl:template match="toolnbr" priority="0">
  <span class="x-toolnbr-1-0">
    <xsl:call-template name="t-base-div-basic"/>
  </span>
</xsl:template>

<xsl:template match="trbody" priority="0">
  <xsl:apply-templates/>
</xsl:template>

<xsl:template match="trfignum" priority="0">
  <xsl:apply-templates/>
</xsl:template>

<xsl:template match="trfmatr" priority="0">
  <xsl:apply-templates/>
</xsl:template>

<xsl:template match="trreason" priority="0">
  <xsl:apply-templates/>
</xsl:template>

<xsl:template match="trsupdata" priority="0">
  <xsl:apply-templates/>
</xsl:template>

<xsl:template match="trtblnum" priority="0">
  <xsl:apply-templates/>
</xsl:template>

<xsl:template match="trxref" priority="0">
  <xsl:apply-templates/>
</xsl:template>

<xsl:template match="title-page/type" priority="1">
  <div class="x-type-1-0">
    <xsl:call-template name="t-base-div-basic"/>
  </div>
</xsl:template>

<xsl:template match="type" priority="0">
  <div class="x-type-2-0">
    <xsl:call-template name="t-base-div-basic"/>
  </div>
</xsl:template>

<xsl:template match="prcitem3/prcitem/unlist" priority="7">
  <div class="x-unlist-1-0">
    <xsl:call-template name="t-base-div-basic"/>
  </div>
</xsl:template>

<xsl:template match="tprereq/unlist" priority="6">
  <div class="x-unlist-2-0">
    <xsl:call-template name="t-base-div-basic"/>
  </div>
</xsl:template>

<xsl:template match="l1item/unlist" priority="5">
  <div class="x-unlist-3-0">
    <xsl:call-template name="t-base-div-basic"/>
  </div>
</xsl:template>

<xsl:template match="l2item/unlist" priority="4">
  <div class="x-unlist-4-0">
    <xsl:call-template name="t-base-div-basic"/>
  </div>
</xsl:template>

<xsl:template match="l3item/unlist" priority="3">
  <div class="x-unlist-5-0">
    <xsl:call-template name="t-base-div-basic"/>
  </div>
</xsl:template>

<xsl:template match="l4item/unlist" priority="2">
  <div class="x-unlist-6-0">
    <xsl:call-template name="t-base-div-basic"/>
  </div>
</xsl:template>

<xsl:template match="unlist[ancestor::book[contains(@doctype,'epc')]]" priority="1">
  <div class="x-unlist-7-0">
    <xsl:call-template name="t-base-div-basic"/>
  </div>
</xsl:template>

<xsl:template match="unlist" priority="0">
  <div class="x-unlist-8-0">
    <xsl:call-template name="t-base-div-basic"/>
  </div>
</xsl:template>

<xsl:template match="enumlist//enumlist//enumlist//enumlist/unlitem" priority="12">
  <table border="0" cellpadding="0" cellspacing="0" class="x-unlitem-1-0 x--zero-left-margins x-tab-fixed">
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

<xsl:template match="enumlist//enumlist//enumlist/unlitem" priority="11">
  <table border="0" cellpadding="0" cellspacing="0" class="x-unlitem-2-0 x--zero-left-margins x-tab-fixed">
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

<xsl:template match="list//list//list/unlitem" priority="10">
  <table border="0" cellpadding="0" cellspacing="0" class="x-unlitem-3-0 x--zero-left-margins x-tab-fixed">
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

<xsl:template match="bullist//bullist//bullist/unlitem" priority="9">
  <table border="0" cellpadding="0" cellspacing="0" class="x-unlitem-4-0 x--zero-left-margins x-tab-fixed">
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

<xsl:template match="enumlist//enumlist/unlitem" priority="8">
  <table border="0" cellpadding="0" cellspacing="0" class="x-unlitem-5-0 x--zero-left-margins x-tab-fixed">
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

<xsl:template match="list//list/unlitem" priority="7">
  <table border="0" cellpadding="0" cellspacing="0" class="x-unlitem-6-0 x--zero-left-margins x-tab-fixed">
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

<xsl:template match="bullist//bullist/unlitem" priority="6">
  <table border="0" cellpadding="0" cellspacing="0" class="x-unlitem-7-0 x--zero-left-margins x-tab-fixed">
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

<xsl:template match="enumlist/unlitem" priority="5">
  <table border="0" cellpadding="0" cellspacing="0" class="x-unlitem-8-0 x--zero-left-margins x-tab-fixed">
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

<xsl:template match="chapsect-list/unlitem" priority="4">
  <table border="0" cellpadding="0" cellspacing="0" class="x-unlitem-9-0 x--zero-left-margins">
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

<xsl:template match="unlist/unlitem" priority="3">
  <table border="0" cellpadding="0" cellspacing="0">
    <xsl:attribute name="class">
      <xsl:if test="ancestor-or-self::unlist[1]/@bulltype[.='NDASH']"><xsl:text>x-tab-fixed </xsl:text></xsl:if>
      <xsl:text>x-unlitem-10-0</xsl:text>
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
  <table border="0" cellpadding="0" cellspacing="0" class="x-unlitem-11-0 x--zero-left-margins x-tab-fixed">
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
  <table border="0" cellpadding="0" cellspacing="0" class="x-unlitem-12-0 x--zero-left-margins x-tab-fixed">
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
  <table border="0" cellpadding="0" cellspacing="0" class="x-unlitem-13-0 x--zero-left-margins">
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

  <span class="x-url-1-0">
     <xsl:call-template name="t-base-div-basic-h">
        <xsl:with-param name="hidden" select="$hidden"/>
     </xsl:call-template>
  </span>
</xsl:template>

<xsl:template match="_ufe:url-link" priority="0">
  <span class="x--ufe-url-link-1-0">
    <xsl:call-template name="t-base-div-basic"/>
  </span>
</xsl:template>

<xsl:template match="validation" priority="0">
  <xsl:apply-templates/>
</xsl:template>

<xsl:template match="step//step/warning" priority="11">
  <div class="x-warning-wrapper-1-0">
    <div class="x-warning-1-0">
      <xsl:call-template name="t-base-div-basic"/>
    </div>
  </div>
</xsl:template>

<xsl:template match="subtask/warning" priority="10">
  <div class="x-warning-wrapper-2-0">
    <div class="x-warning-2-0">
      <xsl:call-template name="t-base-div-basic"/>
    </div>
  </div>
</xsl:template>

<xsl:template match="n-para/warning" priority="9">
  <div class="x-warning-wrapper-3-0">
    <div class="x-warning-3-0">
      <xsl:call-template name="t-base-div-basic"/>
    </div>
  </div>
</xsl:template>

<xsl:template match="step/warning" priority="8">
  <div class="x-warning-wrapper-4-0">
    <div class="x-warning-4-0">
      <xsl:call-template name="t-base-div-basic"/>
    </div>
  </div>
</xsl:template>

<xsl:template match="task/warning" priority="7">
  <div class="x-warning-wrapper-5-0">
    <div class="x-warning-5-0">
      <xsl:call-template name="t-base-div-basic"/>
    </div>
  </div>
</xsl:template>

<xsl:template match="fandc/warning" priority="6">
  <div class="x-warning-wrapper-6-0">
    <div class="x-warning-6-0">
      <xsl:call-template name="t-base-div-basic"/>
    </div>
  </div>
</xsl:template>

<xsl:template match="spec-assem/warning" priority="5">
  <div class="x-warning-wrapper-7-0">
    <div class="x-warning-7-0">
      <xsl:call-template name="t-base-div-basic"/>
    </div>
  </div>
</xsl:template>

<xsl:template match="spring-pressure/warning" priority="4">
  <div class="x-warning-wrapper-8-0">
    <div class="x-warning-8-0">
      <xsl:call-template name="t-base-div-basic"/>
    </div>
  </div>
</xsl:template>

<xsl:template match="torque-and-stretch/warning" priority="3">
  <div class="x-warning-wrapper-9-0">
    <div class="x-warning-9-0">
      <xsl:call-template name="t-base-div-basic"/>
    </div>
  </div>
</xsl:template>

<xsl:template match="fits-and-clears/warning" priority="2">
  <div class="x-warning-wrapper-1-0">
    <div class="x-warning-10-0">
      <xsl:call-template name="t-base-div-basic"/>
    </div>
  </div>
</xsl:template>

<xsl:template match="warning[parent::subpara]" priority="1">
  <div class="x-warning-wrapper-1-0">
    <div class="x-warning-11-0">
      <xsl:call-template name="t-base-div-basic"/>
    </div>
  </div>
</xsl:template>

<xsl:template match="warning" priority="0">
  <div class="x-warning-wrapper-1-0">
    <div class="x-warning-12-0">
      <xsl:call-template name="t-base-div-basic"/>
    </div>
  </div>
</xsl:template>

<xsl:template match="xref">
  <xsl:param name="hidden" select="'yes'"/>
  
  <xsl:variable name="l-ref" select="@ref"/>
  <!--
  <xsl:variable name="l-dest-node" select="//*[@id=$l-ref]"/>
  -->
  <xsl:variable name="l-dest-node" select="id($l-ref)"/>
  
  <xsl:choose>
    <xsl:when test="not($l-dest-node)">
      <span class="x-ref-broken">
        <xsl:apply-templates/>
      </span>
    </xsl:when>
    <xsl:otherwise>
      <xsl:variable name="l-dest-name" select="$l-dest-node/name()"/>
      <xsl:variable name="l-dest-id"><xsl:value-of select="$pf-id"/><xsl:apply-templates mode="set-id" select="$l-dest-node"/></xsl:variable>
      
      <xsl:choose>
        <xsl:when test="ancestor::lof-item and ($l-dest-name='figure' or $l-dest-name='graphic')">
          <xsl:variable name="l-id"><xsl:value-of select="$pf-id"/><xsl:apply-templates mode="set-id" select="."/></xsl:variable>
          <xsl:variable name="l-file">
            <xsl:choose>
              <xsl:when test="ancestor::ata-page-block">
                 <xsl:value-of select="concat(ancestor::ata-page-block/@object-key, '.html')"/>
              </xsl:when>
              <xsl:otherwise>
                 <xsl:value-of select="concat(ancestor::page-block/@object-key, '.html')"/>
              </xsl:otherwise>
            </xsl:choose>
          </xsl:variable>
          <xsl:choose>
            <xsl:when test="$l-dest-name='figure'">
              <span style="display:none" class="x-xref-1-0">
                <xsl:copy-of select="@ch:*"/>
                <xsl:call-template name="maybe-set-id"/>
                <a href="#{$l-id}" onclick="displayGraphicsNav('{$l-file}','{$l-dest-id}');">
                  <xsl:apply-templates mode="numbering" select="$l-dest-node"/>
                </a>
              </span>
            </xsl:when>
            <xsl:otherwise>
              <span class="x-xref-2-0">
                <xsl:copy-of select="@ch:*"/>
                <xsl:call-template name="maybe-set-id"/>
                <a href="#{$l-id}" onclick="displayGraphicsNav('{$l-file}','{$l-dest-id}');">
                  <xsl:apply-templates mode="numbering" select="$l-dest-node"/>
                </a>
              </span>
            </xsl:otherwise>
          </xsl:choose>      
        </xsl:when>
        <xsl:when test="parent::title/parent::table and $l-dest-name='figure'">
          <span class="x-xref-1-0">
            <span class="x--sfe-CrossReference-1-0">
              <a href="#{$l-ref}">
                <xsl:choose>
                  <xsl:when test="$l-dest-node/title">
                    <xsl:apply-templates select="$l-dest-node/title" mode="s_numbering"/>
                  </xsl:when>
                  <xsl:otherwise>
                    <xsl:apply-templates select="$l-dest-node/_sfe:BeforeOrAfterText//*[contains(name(), 'title')]" mode="s_numbering"/>
                  </xsl:otherwise>
                </xsl:choose>
              </a>
            </span>
          </span>
        </xsl:when>
        <xsl:when test="ancestor::highlights">
          <span class="x-xref-4-0">
            <span class="x--ufe-highlights-link-1-0">
              <a class="x--sfe-InternalLink-1-0">
                <xsl:if test="$l-ref">
                  <xsl:attribute name="href"><xsl:value-of select="concat('#',$l-ref)"/></xsl:attribute>
                </xsl:if>
                <xsl:if test="$l-dest-name='table'">
                  <xsl:attribute name="onclick">showTable('<xsl:value-of select="$l-ref"/>')</xsl:attribute>
                </xsl:if>
                <xsl:apply-templates/>
              </a>
            </span>
          </span>
        </xsl:when>
        <xsl:when test="$l-dest-name='table' and $l-dest-node[ancestor::figure or ancestor::graphic]">
          <span class="x-xref-5-0">
            <span class="x--sfe-CrossReference-1-0">
              <a href="#{$l-ref}" onclick="showTable('{$l-ref}')">
                <xsl:choose>
                  <xsl:when test="$l-dest-node/title">
                    <xsl:apply-templates select="$l-dest-node/title" mode="s_numbering"/>
                  </xsl:when>
                  <xsl:otherwise>
                    <xsl:apply-templates select="$l-dest-node/_sfe:BeforeOrAfterText//*[contains(name(), 'title')]" mode="s_numbering"/>
                  </xsl:otherwise>
                </xsl:choose>
              </a>
            </span>
            <xsl:text> </xsl:text>
            <xsl:apply-templates/>
          </span>
        </xsl:when>
        <xsl:when test="$l-dest-name='table'">
          <span class="x-xref-6-0">
            <span class="x--sfe-CrossReference-1-0">
              <a href="#{$l-ref}" onclick="showTable('{$l-ref}')">
                <xsl:choose>
                  <xsl:when test="$l-dest-node/title">
                    <xsl:apply-templates select="$l-dest-node/title" mode="s_numbering"/>
                  </xsl:when>
                  <xsl:otherwise>
                    <xsl:apply-templates select="$l-dest-node/_sfe:BeforeOrAfterText//*[contains(name(), 'title')]" mode="s_numbering"/>
                  </xsl:otherwise>
                </xsl:choose>
              </a>
            </span>
            <xsl:if test="ancestor::lot-item">
              <xsl:text> </xsl:text>
            </xsl:if>
            <xsl:apply-templates/>
          </span>
        </xsl:when>
        <xsl:when test="$l-dest-name='figure'">
          <span class="x-xref-6-0">
            <xsl:copy-of select="@ch:*"/>
            <xsl:call-template name="maybe-set-id"/>
            <a href="#none" onclick="displayGraphics('{$l-dest-id}');">
              <xsl:text> </xsl:text>
              <xsl:apply-templates mode="s_numbering" select="$l-dest-node//title"/>
            </a>
          </span>
        </xsl:when>
        <xsl:otherwise>
          <span class="x-xref-8-0">
            <span class="x--sfe-CrossReference-1-0">
              <a href="#{$l-ref}">
                <xsl:variable name="division-name-token-list">
                  <xsl:choose>
                    <xsl:when test="ancestor::book[starts-with(@doctype, 'epc')]"> alpha-list ata-page-block book bullist chapsect-list chapter enumlist figure frontmatter glossary graphic highlights intro list lof lof-item lot lot-item module n-para num-index num-list nutopt page-block procedure pwcchapsect-list sbdata sblist section spec-tool-table subject subpara table title-page unlist vendlist </xsl:when>
                    <xsl:when test="ancestor::book[starts-with(@doctype, 'ipc')]"> alpha-list ata-page-block book bullist chapsect-list chapter enumlist figure frontmatter highlights intro list lof lof-item lot lot-item module n-para num-index num-list page-block procedure sblist section service-bull-list spb-list spec-tool-table subject subpara table title-page unlist </xsl:when>
                    <xsl:when test="ancestor::book[starts-with(@doctype, 'cir') or starts-with(@doctype, 'lmm') or starts-with(@doctype, 'tmm')]"> alpha-list ata-page-block book bullist chapsect-list chapter enumlist figure frontmatter graphic highlights howtouse intro list list1 list2 list3 list4 lof lof-item lot lot-item module n-para num-index num-list numlist page-block pbfmatr pgblk prcitem prclist1 prclist2 prclist3 prclist4 procedure pwcchapsect-list pwcni pwcspblist sblist section spec-tool-table subject subpara subtask table task taskproc title-page tprereq unlist </xsl:when>
                    <xsl:when test="ancestor::book[starts-with(@doctype, 'mm') or starts-with(@doctype, 'oh')]"> alpha-list ata-page-block book bullist chapsect-list chapter consumables enumlist figure fits-and-clears fixtures-and-equipment frontmatter general highlights intro list lof lof-item lot lot-item mm-fits module n-para num-index num-list page-block procedure sblist section spec-tool-table special-tools subject subpara table title-page torque-and-stretch unlist </xsl:when>
                  </xsl:choose>
                </xsl:variable>
                <xsl:variable name="idrefed-element-name" select="concat(' ', $l-dest-name, ' ')"/>
                <xsl:choose>
                  <xsl:when test="contains($division-name-token-list,$idrefed-element-name)">
                    <xsl:choose>
                      <xsl:when test="$l-dest-node/title">
                        <xsl:apply-templates select="$l-dest-node/title" mode="s_numbering"/>
                      </xsl:when>
                      <xsl:otherwise>
                        <xsl:apply-templates select="$l-dest-node/_sfe:BeforeOrAfterText//*[contains(name(), 'title')]" mode="s_numbering"/>
                      </xsl:otherwise>
                    </xsl:choose>
                  </xsl:when>
                  <xsl:otherwise>
                    <xsl:apply-templates select="$l-dest-node" mode="s_numbering"/>
                  </xsl:otherwise>
                </xsl:choose>
              </a>
            </span>
          </span>
        </xsl:otherwise>
      </xsl:choose>
    </xsl:otherwise>
  </xsl:choose>
</xsl:template>

<xsl:template match="zip" priority="0">
  <span>
     <xsl:attribute name="class">
        <xsl:text>x-zip-1-0</xsl:text>
        <xsl:if test="not(./*[not(self::_sfe:BeforeOrAfterText)]|./text()[normalize-space(.)!=''])"> x-zip-1-1</xsl:if>
     </xsl:attribute>
     <xsl:call-template name="t-base-div-basic"/>
  </span>
</xsl:template>

<!-- DEFAULT TEMPLATES -->

<xsl:template match="*[starts-with(local-name(.),'_')]" priority="-0.9">
  <xsl:element name="{name(.)}">
     <xsl:copy-of select="@*"/>
     <xsl:apply-templates/>
  </xsl:element>
</xsl:template>

<xsl:template match="ch:*">
  <xsl:element name="{name(.)}">
     <xsl:copy-of select="@*"/>
     <xsl:apply-templates/>
  </xsl:element>
</xsl:template>

<xsl:template match="*" priority="-1">
  <xsl:apply-templates/>
</xsl:template>

<xsl:template match="*[local-name(.)='span']" priority="1">
  <xsl:element name="{name(.)}">
     <xsl:copy-of select="@*"/>
     <xsl:apply-templates/>
  </xsl:element>
</xsl:template>

<!--
<xsl:template match="@xml:id"/>
-->

<xsl:template match="_ufe:hardspace" priority="2">
  <xsl:text>&#xa0;</xsl:text>
</xsl:template>

<!-- TABLES CONFIGURATION -->

<xsl:template name="tgroup.first">
  <xsl:attribute name="class"><xsl:text>x-tgroup-1-0</xsl:text></xsl:attribute>
</xsl:template>

<xsl:template name="tgroup.notfirst">
  <xsl:attribute name="class"><xsl:text>x-tgroup-1-0</xsl:text></xsl:attribute>
</xsl:template>

<xsl:template name="row">
  <xsl:attribute name="class">
     <xsl:text>x-row-1-0</xsl:text>
     <xsl:if test="(@role and string(@role)='changebar') or (entry[1]/marker)"> x-row-1-1</xsl:if>
  </xsl:attribute>
</xsl:template>

<xsl:template name="entry">
  <xsl:attribute name="class">x-ent</xsl:attribute>
</xsl:template>

<xsl:template name="thead">
  <xsl:attribute name="class"><xsl:text>x-thead-1-0</xsl:text></xsl:attribute>
</xsl:template>

<xsl:template name="tfoot">
  <xsl:attribute name="class"><xsl:text>x-tfoot-1-0</xsl:text></xsl:attribute>
</xsl:template>

<xsl:template name="tbody">
  <xsl:attribute name="class"><xsl:text>x-tbody-1-0</xsl:text></xsl:attribute>
</xsl:template>

<xsl:template name="htmltbl-tr">
  <xsl:attribute name="class"><xsl:text>x-tr-1-0</xsl:text></xsl:attribute>
</xsl:template>

<xsl:template name="htmltbl-td"/>

<xsl:template name="htmltbl-th"/>

<xsl:template name="htmltbl-caption"/>

<!-- UTILITIES FUNCTIONS -->

<xsl:template name="set-gte-id">
  <xsl:attribute name="_gte:id">
    <xsl:value-of select="concat('_g_',generate-id(.))"/>
  </xsl:attribute>
</xsl:template>

<xsl:template name="maybe-set-gte-id">
  <xsl:attribute name="_gte:id">
    <xsl:choose>
      <xsl:when test="@id"><xsl:value-of select="@id"/></xsl:when>
      <xsl:otherwise><xsl:value-of select="concat('_g_',generate-id(.))"/></xsl:otherwise>
    </xsl:choose>
  </xsl:attribute>
  <xsl:if test="@id">
    <xsl:attribute name="xml:id">
      <xsl:value-of select="@id"/>
    </xsl:attribute>
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
        <xsl:if test="namespace-uri(.)='http://www.arbortext.com/namespace/Styler/UserFormattingElements'">u</xsl:if>
        <xsl:apply-templates select="." mode="set-id"/>
      </xsl:attribute>
    </xsl:when>
  </xsl:choose>
  <xsl:if test="@xml:id"><xsl:copy-of select="@xml:id"/></xsl:if>
</xsl:template>

<xsl:template name="maybe-get-id">
  <xsl:param name="only-if-id-attr" select="'yes'"/>
  <xsl:param name="generated-id-prefix" select="$pf-id"/>
  
  <xsl:choose>
    <xsl:when test="@id"><xsl:value-of select="@id"/></xsl:when>
    <xsl:when test="$only-if-id-attr!='yes'">
      <xsl:value-of select="$generated-id-prefix"/>
      <xsl:if test="namespace-uri(.)='http://www.arbortext.com/namespace/Styler/UserFormattingElements'">u</xsl:if>
      <xsl:apply-templates select="." mode="set-id"/>
    </xsl:when>
  </xsl:choose>
</xsl:template>

<xsl:template match="*" mode="set-id">
  <xsl:number level="multiple" count="*[not( (namespace-uri(.)='http://www.w3.org/1999/XSL/Format') or (namespace-uri(.)='http://www.arbortext.com/namespace/XslFoExtensions') or (starts-with(namespace-uri(.),'http://www.arbortext.com/namespace/Styler/')) )]"/>
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

<!-- COMMON TEMPLATES TO GENERATE HTML -->

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
  <xsl:call-template name="maybe-set-id">
    <xsl:with-param name="only-if-id-attr" select="'no'"/>
  </xsl:call-template>
  <xsl:apply-templates/>
</xsl:template>

<xsl:template name="t-base-div-chunk">
  <xsl:param name="ch-name" select="@object-key"/>
  
  <xsl:copy-of select="@ch:*"/>
  <xsl:if test="$ch-name!=''">
    <xsl:attribute name="ch:filename"><xsl:value-of select="$ch-name"/></xsl:attribute>
    <xsl:attribute name="ch:namepriority">0</xsl:attribute>
  </xsl:if>
  <xsl:call-template name="maybe-set-id">
    <xsl:with-param name="only-if-id-attr" select="'no'"/>
  </xsl:call-template>
</xsl:template>

<xsl:template name="t-base-page-block-spec">
  <xsl:param name="manual-title"/>
  <xsl:param name="engine"/>
  <xsl:param name="manual-pn"/>

  <xsl:call-template name="t-base-div-chunk">
    <xsl:with-param name="ch-name" select="@pb-name"/>
  </xsl:call-template>
  <xsl:call-template name="t-base-pwcmetainfo"/>
  <div id="pwcbannerinfo" style="display:none">
    <div id="manualTitle"><xsl:value-of select="$manual-title"/></div>
    <div id="engine"     >Model(s) <xsl:value-of select="substring-after($engine, 'Model(s)')"/></div>
    <div id="manualPn"   >Manual Part No. <xsl:value-of select="substring-after($manual-pn, 'Manual Part No.')"/></div>
    <div id="pointRev"   ><xsl:value-of select="ancestor::book/@point-revnbr"/></div>
    <div id="revision"   ><xsl:value-of select="ancestor::book/@revnbr"/></div>
    <div id="revDate"    ><xsl:value-of select="ancestor::book/@revdate"/></div>
  </div>
  <xsl:apply-templates/>
  <script language="JavaScript" type="text/javascript">addTableChangebars();</script>
  <script language="JavaScript" type="text/javascript">addChangebars();</script>
</xsl:template>

<xsl:template name="t-base-page-block-gen">
  <xsl:call-template name="t-base-div-chunk"/>
  <xsl:call-template name="t-base-pwcmetainfo"/>
  <xsl:call-template name="t-base-pwcbannerinfo"/>
  <xsl:apply-templates/>
  <script language="JavaScript" type="text/javascript">addTableChangebars();</script>
  <script language="JavaScript" type="text/javascript">addChangebars();</script>
</xsl:template>

<xsl:template name="t-base-img-graphic">
  <xsl:param name="filename" select="@negnumber"/>
  
  <xsl:copy-of select="@ch:*"/>
  <img alt="Graphic">
    <xsl:copy-of select="@ch:*"/>
    <xsl:variable name="graphic-prop-filename">
       <!--
       <xsl:if test="$graphics-path!=''">
          <xsl:call-template name="substring-before-last">
             <xsl:with-param name="str" select="$graphics-path"/>
             <xsl:with-param name="delim" select="'/'"/>
          </xsl:call-template>
          <xsl:text>/</xsl:text>
       </xsl:if>
       -->
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
       <xsl:call-template name="t-base-pwcbannerinfo-title"/>
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

<xsl:template name="t-base-pwcbannerinfo-title">
  <xsl:choose>
    <xsl:when test="ancestor-or-self::book[contains(@doctype,'epc')]//page-block[@pb-name='title-page']">ILLUSTRATED PARTS CATALOG</xsl:when>
    <xsl:when test="ancestor-or-self::book[contains(@doctype,'tmm')]//page-block[@pb-name='title-page']">MAINTENANCE MANUAL</xsl:when>
    <xsl:when test="ancestor-or-self::book[contains(@doctype,'lmm')]//page-block[@pb-name='title-page']">LINE MAINTENANCE MANUAL</xsl:when>
    <xsl:when test="ancestor-or-self::book[contains(@doctype,'em')]//page-block[@pb-name='title-page']">OVERHAUL MANUAL</xsl:when>
    <xsl:when test="ancestor-or-self::book[contains(@doctype,'cir')]//page-block[@pb-name='title-page']">CLEANING INSPECTION REPAIR (CIR) MANUAL</xsl:when>
    <xsl:otherwise>
       <xsl:value-of select="//page-block[@pb-name='title-page'][1]/module/title-page/manual-title"/>
    </xsl:otherwise>
  </xsl:choose>
</xsl:template>

<xsl:template name="t-base-js-toggle">
  <!--
  <script language="javascript" type="text/javascript">
    function toggle (heading, tableId) { 
      var headingObj = document.getElementById(heading);
      var tableObj = document.getElementById(tableId);
      if (tableObj) {
        if (tableObj.style.display == 'block') {
          tableObj.style.display='none';
          headingObj.style.cursor='s-resize';            
        } else {
          tableObj.style.display='block';          
          headingObj.style.cursor='n-resize';
        }
      }
    }
  </script>
  -->
</xsl:template>

</xsl:stylesheet>
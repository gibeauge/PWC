<?xml version="1.0" encoding="UTF-8"?><xsl:stylesheet xmlns:simg="java:net.sf.docbook.saxon.ImageIntrinsics" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:ximg="xaln://com.nwalsh.xalan.ImageIntrinsics" xmlns="http://www.w3.org/1999/xhtml" xmlns:exslt="http://exslt.org/common" xmlns:_acl="java:com.arbortext.epic.Acl" xmlns:msxsl="urn:schemas-microsoft-com:xslt" xmlns:_="http://www.pwc.ca/namespace/doctypes/emipc" xmlns:_dtd="http://www.arbortext.com/namespace/Styler/UserElements" xmlns:atidlm="http://www.arbortext.com/namespace/atidlm" xmlns:_2="http://www.pwc.ca/namespace/doctypes/jmtosmigrate" xmlns:ch="http://www.arbortext.com/namespace/chunker" xmlns:saxon="http://saxon.sf.net/" xmlns:_5="http://www.pwc.ca/namespace/doctypes/ipc" xmlns:_gte="http://www.arbortext.com/namespace/Styler/GeneratedTextElements" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:_sfe="http://www.arbortext.com/namespace/Styler/StylerFormattingElements" xmlns:_js="java:com.arbortext.epic.internal.js.JavaScript" xmlns:_3="http://www.pwc.ca/namespace/doctypes/migrate" xmlns:_ufe="http://www.arbortext.com/namespace/Styler/UserFormattingElements" version="1.0" exclude-result-prefixes="_ atidlm xml _2 ch saxon _5 xsi _js _3 #default exslt msxsl _dtd _ufe _sfe _gte simg ximg _acl">


<xsl:template match="numlist/address" mode="set-countas" priority="7">
      <xsl:copy>
         <xsl:apply-templates select="@*|node()" mode="set-countas"/>
      </xsl:copy>
   </xsl:template>

<xsl:template match="sbdata/address" mode="set-countas" priority="6">
      <xsl:copy>
         <xsl:apply-templates select="@*|node()" mode="set-countas"/>
      </xsl:copy>
   </xsl:template>

<xsl:template match="alpha-list/address" mode="set-countas" priority="5">
      <xsl:copy>
         <xsl:apply-templates select="@*|node()" mode="set-countas"/>
      </xsl:copy>
   </xsl:template>

<xsl:template match="num-list/address" mode="set-countas" priority="4">
      <xsl:copy>
         <xsl:apply-templates select="@*|node()" mode="set-countas"/>
      </xsl:copy>
   </xsl:template>

<xsl:template match="glossary/address" mode="set-countas" priority="3">
      <xsl:copy>
         <xsl:apply-templates select="@*|node()" mode="set-countas"/>
      </xsl:copy>
   </xsl:template>

<xsl:template match="pwcchapsect-list/address" mode="set-countas" priority="2">
      <xsl:copy>
         <xsl:apply-templates select="@*|node()" mode="set-countas"/>
      </xsl:copy>
   </xsl:template>

<xsl:template match="enumlist/address" mode="set-countas" priority="1">
      <xsl:copy>
         <xsl:apply-templates select="@*|node()" mode="set-countas"/>
      </xsl:copy>
   </xsl:template>

<xsl:template match="address" mode="set-countas" priority="0">
      <xsl:copy>
         <xsl:apply-templates select="@*|node()" mode="set-countas"/>
      </xsl:copy>
   </xsl:template>

<xsl:template match="aispart" mode="set-countas" priority="0">
      <xsl:copy>
         <xsl:apply-templates select="@*|node()" mode="set-countas"/>
      </xsl:copy>
   </xsl:template>

<xsl:template match="alpha-list" mode="set-countas" priority="0">
      <xsl:copy>
         <xsl:apply-templates select="@*|node()" mode="set-countas"/>
      </xsl:copy>
   </xsl:template>

<xsl:template match="applic-group" mode="set-countas" priority="0">
      <xsl:copy>
         <xsl:apply-templates select="@*|node()" mode="set-countas"/>
      </xsl:copy>
   </xsl:template>

<xsl:template match="applic-item" mode="set-countas" priority="0">
      <xsl:copy>
         <xsl:apply-templates select="@*|node()" mode="set-countas"/>
      </xsl:copy>
   </xsl:template>

<xsl:template match="ata-page-block" mode="set-countas" priority="0">
      <xsl:copy>
         <xsl:apply-templates mode="set-countas" select="@*|node()"> </xsl:apply-templates>
      </xsl:copy>
   </xsl:template>

<xsl:template match="address/att" mode="set-countas" priority="1">
      <xsl:copy>
         <xsl:apply-templates select="@*|node()" mode="set-countas"/>
      </xsl:copy>
   </xsl:template>

<xsl:template match="att" mode="set-countas" priority="0">
      <xsl:copy>
         <xsl:apply-templates select="@*|node()" mode="set-countas"/>
      </xsl:copy>
   </xsl:template>

<xsl:template match="aw-notice" mode="set-countas" priority="0">
      <xsl:copy>
         <xsl:apply-templates select="@*|node()" mode="set-countas"/>
      </xsl:copy>
   </xsl:template>

<xsl:template match="awlror" mode="set-countas" priority="0">
      <xsl:copy>
         <xsl:apply-templates select="@*|node()" mode="set-countas"/>
      </xsl:copy>
   </xsl:template>

<xsl:template match="awlrorsection" mode="set-countas" priority="0">
      <xsl:copy>
         <xsl:apply-templates select="@*|node()" mode="set-countas"/>
      </xsl:copy>
   </xsl:template>

<xsl:template match="barend" mode="set-countas" priority="0">
      <xsl:copy>
         <xsl:apply-templates select="@*|node()" mode="set-countas"/>
      </xsl:copy>
   </xsl:template>

<xsl:template match="barstart" mode="set-countas" priority="0">
      <xsl:copy>
         <xsl:apply-templates select="@*|node()" mode="set-countas"/>
      </xsl:copy>
   </xsl:template>

<xsl:template match="_ufe:block-nospace" mode="set-countas" priority="0">
      <xsl:copy>
         <xsl:apply-templates select="@*|node()" mode="set-countas"/>
      </xsl:copy>
   </xsl:template>

<xsl:template match="_ufe:block-prespace" mode="set-countas" priority="0">
      <xsl:copy>
         <xsl:apply-templates select="@*|node()" mode="set-countas"/>
      </xsl:copy>
   </xsl:template>

<xsl:template match="book" mode="set-countas" priority="0">
      <xsl:copy>
         <xsl:apply-templates select="@*|node()" mode="set-countas"/>
      </xsl:copy>
   </xsl:template>

<xsl:template match="brk" mode="set-countas" priority="0">
      <xsl:copy>
         <xsl:apply-templates select="@*|node()" mode="set-countas"/>
      </xsl:copy>
   </xsl:template>

<xsl:template match="bullist" mode="set-countas" priority="0">
      <xsl:copy>
         <xsl:apply-templates select="@*|node()" mode="set-countas"/>
      </xsl:copy>
   </xsl:template>

<xsl:template match="figure/key/callout" mode="set-countas" priority="1">
      <xsl:copy>
         <xsl:apply-templates select="@*|node()" mode="set-countas"/>
      </xsl:copy>
   </xsl:template>

<xsl:template match="callout" mode="set-countas" priority="0">
      <xsl:copy>
         <xsl:apply-templates select="@*|node()" mode="set-countas"/>
      </xsl:copy>
   </xsl:template>

<xsl:template match="subtask/caution" mode="set-countas" priority="11">
      <xsl:copy>
         <xsl:apply-templates select="@*|node()" mode="set-countas"/>
      </xsl:copy>
   </xsl:template>

<xsl:template match="task/caution" mode="set-countas" priority="10">
      <xsl:copy>
         <xsl:apply-templates select="@*|node()" mode="set-countas"/>
      </xsl:copy>
   </xsl:template>

<xsl:template match="n-para/caution" mode="set-countas" priority="9">
      <xsl:copy>
         <xsl:apply-templates select="@*|node()" mode="set-countas"/>
      </xsl:copy>
   </xsl:template>

<xsl:template match="step/caution" mode="set-countas" priority="8">
      <xsl:copy>
         <xsl:apply-templates select="@*|node()" mode="set-countas"/>
      </xsl:copy>
   </xsl:template>

<xsl:template match="procedure/caution" mode="set-countas" priority="7">
      <xsl:copy>
         <xsl:apply-templates select="@*|node()" mode="set-countas"/>
      </xsl:copy>
   </xsl:template>

<xsl:template match="fandc/caution" mode="set-countas" priority="6">
      <xsl:copy>
         <xsl:apply-templates select="@*|node()" mode="set-countas"/>
      </xsl:copy>
   </xsl:template>

<xsl:template match="spec-assem/caution" mode="set-countas" priority="5">
      <xsl:copy>
         <xsl:apply-templates select="@*|node()" mode="set-countas"/>
      </xsl:copy>
   </xsl:template>

<xsl:template match="spring-pressure/caution" mode="set-countas" priority="4">
      <xsl:copy>
         <xsl:apply-templates select="@*|node()" mode="set-countas"/>
      </xsl:copy>
   </xsl:template>

<xsl:template match="torque-and-stretch/caution" mode="set-countas" priority="3">
      <xsl:copy>
         <xsl:apply-templates select="@*|node()" mode="set-countas"/>
      </xsl:copy>
   </xsl:template>

<xsl:template match="fits-and-clears/caution" mode="set-countas" priority="2">
      <xsl:copy>
         <xsl:apply-templates select="@*|node()" mode="set-countas"/>
      </xsl:copy>
   </xsl:template>

<xsl:template match="caution[parent::subpara]" mode="set-countas" priority="1">
      <xsl:copy>
         <xsl:apply-templates select="@*|node()" mode="set-countas"/>
      </xsl:copy>
   </xsl:template>

<xsl:template match="caution" mode="set-countas" priority="0">
      <xsl:copy>
         <xsl:apply-templates select="@*|node()" mode="set-countas"/>
      </xsl:copy>
   </xsl:template>

<xsl:template match="_ufe:center" mode="set-countas" priority="0">
      <xsl:copy>
         <xsl:apply-templates select="@*|node()" mode="set-countas"/>
      </xsl:copy>
   </xsl:template>

<xsl:template match="ch-se-su" mode="set-countas" priority="0">
      <xsl:copy>
         <xsl:apply-templates select="@*|node()" mode="set-countas"/>
      </xsl:copy>
   </xsl:template>

<xsl:template match="change" mode="set-countas" priority="0">
      <xsl:copy>
         <xsl:apply-templates select="@*|node()" mode="set-countas"/>
      </xsl:copy>
   </xsl:template>

<xsl:template match="changebar" mode="set-countas" priority="0">
      <xsl:copy>
         <xsl:apply-templates mode="set-countas" select="@*|node()"> </xsl:apply-templates>
      </xsl:copy>
   </xsl:template>

<xsl:template match="chapsect" mode="set-countas" priority="0">
      <xsl:copy>
         <xsl:apply-templates select="@*|node()" mode="set-countas"/>
      </xsl:copy>
   </xsl:template>

<xsl:template match="chapsect-item" mode="set-countas" priority="0">
      <xsl:copy>
         <xsl:apply-templates select="@*|node()" mode="set-countas"/>
      </xsl:copy>
   </xsl:template>

<xsl:template match="chapsect-list" mode="set-countas" priority="0">
      <xsl:copy>
         <xsl:apply-templates select="@*|node()" mode="set-countas"/>
      </xsl:copy>
   </xsl:template>

<xsl:template match="chapsect-title" mode="set-countas" priority="0">
      <xsl:copy>
         <xsl:apply-templates select="@*|node()" mode="set-countas"/>
      </xsl:copy>
   </xsl:template>

<xsl:template match="pgblk/_ufe:chapsect-title" mode="set-countas" priority="2">
      <xsl:copy>
         <xsl:apply-templates select="@*|node()" mode="set-countas"/>
      </xsl:copy>
   </xsl:template>

<xsl:template match="pbfmatr/_ufe:chapsect-title" mode="set-countas" priority="1">
      <xsl:copy>
         <xsl:attribute name="_gte:count-as-id">cnt__pbfmatr^-None-.cnt</xsl:attribute>
         <xsl:apply-templates select="@*|node()" mode="set-countas"/>
      </xsl:copy>
   </xsl:template>

<xsl:template match="_ufe:chapsect-title" mode="set-countas" priority="0">
      <xsl:copy>
         <xsl:apply-templates select="@*|node()" mode="set-countas"/>
      </xsl:copy>
   </xsl:template>

<xsl:template match="chapter" mode="set-countas" priority="0">
      <xsl:copy>
         <xsl:apply-templates select="@*|node()" mode="set-countas"/>
      </xsl:copy>
   </xsl:template>

<xsl:template match="chapter-front" mode="set-countas" priority="0">
      <xsl:copy>
         <xsl:apply-templates select="@*|node()" mode="set-countas"/>
      </xsl:copy>
   </xsl:template>

<xsl:template match="chgdesc" mode="set-countas" priority="0">
      <xsl:copy>
         <xsl:apply-templates select="@*|node()" mode="set-countas"/>
      </xsl:copy>
   </xsl:template>

<xsl:template match="pgblk/_ufe:cir-title" mode="set-countas" priority="2">
      <xsl:copy>
         <xsl:apply-templates select="@*|node()" mode="set-countas"/>
      </xsl:copy>
   </xsl:template>

<xsl:template match="pbfmatr/_ufe:cir-title" mode="set-countas" priority="1">
      <xsl:copy>
         <xsl:attribute name="_gte:count-as-id">cnt__pbfmatr^-None-.cnt</xsl:attribute>
         <xsl:apply-templates select="@*|node()" mode="set-countas"/>
      </xsl:copy>
   </xsl:template>

<xsl:template match="_ufe:cir-title" mode="set-countas" priority="0">
      <xsl:copy>
         <xsl:apply-templates select="@*|node()" mode="set-countas"/>
      </xsl:copy>
   </xsl:template>

<xsl:template match="city" mode="set-countas" priority="0">
      <xsl:copy>
         <xsl:apply-templates select="@*|node()" mode="set-countas"/>
      </xsl:copy>
   </xsl:template>

<xsl:template match="co-name" mode="set-countas" priority="0">
      <xsl:copy>
         <xsl:apply-templates select="@*|node()" mode="set-countas"/>
      </xsl:copy>
   </xsl:template>

<xsl:template match="comment" mode="set-countas" priority="0">
      <xsl:copy>
         <xsl:apply-templates select="@*|node()" mode="set-countas"/>
      </xsl:copy>
   </xsl:template>

<xsl:template match="consumable" mode="set-countas" priority="0">
      <xsl:copy>
         <xsl:apply-templates select="@*|node()" mode="set-countas"/>
      </xsl:copy>
   </xsl:template>

<xsl:template match="pgblk/_ufe:consumables-title" mode="set-countas" priority="5">
      <xsl:copy>
         <xsl:apply-templates select="@*|node()" mode="set-countas"/>
      </xsl:copy>
   </xsl:template>

<xsl:template match="pbfmatr/_ufe:consumables-title" mode="set-countas" priority="4">
      <xsl:copy>
         <xsl:attribute name="_gte:count-as-id">cnt__pbfmatr^-None-.cnt</xsl:attribute>
         <xsl:apply-templates select="@*|node()" mode="set-countas"/>
      </xsl:copy>
   </xsl:template>

<xsl:template match="pwcspblist/_ufe:consumables-title" mode="set-countas" priority="3">
      <xsl:copy>
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

<xsl:template match="_ufe:consumables-title" mode="set-countas" priority="0">
      <xsl:copy>
         <xsl:apply-templates select="@*|node()" mode="set-countas"/>
      </xsl:copy>
   </xsl:template>

<xsl:template match="consume-list" mode="set-countas" priority="0">
      <xsl:copy>
         <xsl:apply-templates select="@*|node()" mode="set-countas"/>
      </xsl:copy>
   </xsl:template>

<xsl:template match="country" mode="set-countas" priority="0">
      <xsl:copy>
         <xsl:apply-templates select="@*|node()" mode="set-countas"/>
      </xsl:copy>
   </xsl:template>

<xsl:template match="csu" mode="set-countas" priority="0">
      <xsl:copy>
         <xsl:apply-templates select="@*|node()" mode="set-countas"/>
      </xsl:copy>
   </xsl:template>

<xsl:template match="csu-instance" mode="set-countas" priority="0">
      <xsl:copy>
         <xsl:apply-templates select="@*|node()" mode="set-countas"/>
      </xsl:copy>
   </xsl:template>

<xsl:template match="dash" mode="set-countas" priority="0">
      <xsl:copy>
         <xsl:apply-templates select="@*|node()" mode="set-countas"/>
      </xsl:copy>
   </xsl:template>

<xsl:template match="key/def" mode="set-countas" priority="2">
      <xsl:copy>
         <xsl:apply-templates select="@*|node()" mode="set-countas"/>
      </xsl:copy>
   </xsl:template>

<xsl:template match="deflist/def" mode="set-countas" priority="1">
      <xsl:copy>
         <xsl:apply-templates select="@*|node()" mode="set-countas"/>
      </xsl:copy>
   </xsl:template>

<xsl:template match="def" mode="set-countas" priority="0">
      <xsl:copy>
         <xsl:apply-templates select="@*|node()" mode="set-countas"/>
      </xsl:copy>
   </xsl:template>

<xsl:template match="step/deflist" mode="set-countas" priority="1">
      <xsl:copy>
         <xsl:apply-templates select="@*|node()" mode="set-countas"/>
      </xsl:copy>
   </xsl:template>

<xsl:template match="deflist" mode="set-countas" priority="0">
      <xsl:copy>
         <xsl:apply-templates select="@*|node()" mode="set-countas"/>
      </xsl:copy>
   </xsl:template>

<xsl:template match="delete" mode="set-countas" priority="0">
      <xsl:copy>
         <xsl:apply-templates select="@*|node()" mode="set-countas"/>
      </xsl:copy>
   </xsl:template>

<xsl:template match="deleted" mode="set-countas" priority="0">
      <xsl:copy>
         <xsl:apply-templates select="@*|node()" mode="set-countas"/>
      </xsl:copy>
   </xsl:template>

<xsl:template match="denom" mode="set-countas" priority="0">
      <xsl:copy>
         <xsl:apply-templates select="@*|node()" mode="set-countas"/>
      </xsl:copy>
   </xsl:template>

<xsl:template match="describe" mode="set-countas" priority="0">
      <xsl:copy>
         <xsl:apply-templates select="@*|node()" mode="set-countas"/>
      </xsl:copy>
   </xsl:template>

<xsl:template match="description" mode="set-countas" priority="0">
      <xsl:copy>
         <xsl:apply-templates select="@*|node()" mode="set-countas"/>
      </xsl:copy>
   </xsl:template>

<xsl:template match="effec" mode="set-countas" priority="0">
      <xsl:copy>
         <xsl:apply-templates select="@*|node()" mode="set-countas"/>
      </xsl:copy>
   </xsl:template>

<xsl:template match="pgblk/_ufe:eipc-title" mode="set-countas" priority="2">
      <xsl:copy>
         <xsl:apply-templates select="@*|node()" mode="set-countas"/>
      </xsl:copy>
   </xsl:template>

<xsl:template match="pbfmatr/_ufe:eipc-title" mode="set-countas" priority="1">
      <xsl:copy>
         <xsl:attribute name="_gte:count-as-id">cnt__pbfmatr^-None-.cnt</xsl:attribute>
         <xsl:apply-templates select="@*|node()" mode="set-countas"/>
      </xsl:copy>
   </xsl:template>

<xsl:template match="_ufe:eipc-title" mode="set-countas" priority="0">
      <xsl:copy>
         <xsl:apply-templates select="@*|node()" mode="set-countas"/>
      </xsl:copy>
   </xsl:template>

<xsl:template match="pgblk/_ufe:em-title" mode="set-countas" priority="2">
      <xsl:copy>
         <xsl:apply-templates select="@*|node()" mode="set-countas"/>
      </xsl:copy>
   </xsl:template>

<xsl:template match="pbfmatr/_ufe:em-title" mode="set-countas" priority="1">
      <xsl:copy>
         <xsl:attribute name="_gte:count-as-id">cnt__pbfmatr^-None-.cnt</xsl:attribute>
         <xsl:apply-templates select="@*|node()" mode="set-countas"/>
      </xsl:copy>
   </xsl:template>

<xsl:template match="_ufe:em-title" mode="set-countas" priority="0">
      <xsl:copy>
         <xsl:apply-templates select="@*|node()" mode="set-countas"/>
      </xsl:copy>
   </xsl:template>

<xsl:template match="email" mode="set-countas" priority="0">
      <xsl:copy>
         <xsl:apply-templates select="@*|node()" mode="set-countas"/>
      </xsl:copy>
   </xsl:template>

<xsl:template match="_ufe:email-link" mode="set-countas" priority="0">
      <xsl:copy>
         <xsl:apply-templates select="@*|node()" mode="set-countas"/>
      </xsl:copy>
   </xsl:template>

<xsl:template match="table[@tabstyle='parts-list']//emphasis" mode="set-countas" priority="1">
      <xsl:copy>
         <xsl:apply-templates select="@*|node()" mode="set-countas"/>
      </xsl:copy>
   </xsl:template>

<xsl:template match="emphasis" mode="set-countas" priority="0">
      <xsl:copy>
         <xsl:apply-templates select="@*|node()" mode="set-countas"/>
      </xsl:copy>
   </xsl:template>

<xsl:template match="endmulti" mode="set-countas" priority="0">
      <xsl:copy>
         <xsl:apply-templates select="@*|node()" mode="set-countas"/>
      </xsl:copy>
   </xsl:template>

<xsl:template match="engine[position()&gt;1]" mode="set-countas" priority="1">
      <xsl:copy>
         <xsl:apply-templates select="@*|node()" mode="set-countas"/>
      </xsl:copy>
   </xsl:template>

<xsl:template match="engine" mode="set-countas" priority="0">
      <xsl:copy>
         <xsl:apply-templates select="@*|node()" mode="set-countas"/>
      </xsl:copy>
   </xsl:template>

<xsl:template match="_ufe:engine-type" mode="set-countas" priority="0">
      <xsl:copy>
         <xsl:apply-templates select="@*|node()" mode="set-countas"/>
      </xsl:copy>
   </xsl:template>

<xsl:template match="enumlist" mode="set-countas" priority="0">
      <xsl:copy>
         <xsl:apply-templates select="@*|node()" mode="set-countas"/>
      </xsl:copy>
   </xsl:template>

<xsl:template match="eqn[preceding-sibling::*[1][name() = 'table']]" mode="set-countas" priority="3">
      <xsl:copy>
         <xsl:apply-templates select="@*|node()" mode="set-countas"/>
      </xsl:copy>
   </xsl:template>

<xsl:template match="eqn[@display='inline' and not(child::table)]" mode="set-countas" priority="2">
      <xsl:copy>
         <xsl:apply-templates select="@*|node()" mode="set-countas"/>
      </xsl:copy>
   </xsl:template>

<xsl:template match="eqn[@display='inline']" mode="set-countas" priority="1">
      <xsl:copy>
         <xsl:apply-templates select="@*|node()" mode="set-countas"/>
      </xsl:copy>
   </xsl:template>

<xsl:template match="eqn" mode="set-countas" priority="0">
      <xsl:copy>
         <xsl:apply-templates select="@*|node()" mode="set-countas"/>
      </xsl:copy>
   </xsl:template>

<xsl:template match="facility" mode="set-countas" priority="0">
      <xsl:copy>
         <xsl:apply-templates select="@*|node()" mode="set-countas"/>
      </xsl:copy>
   </xsl:template>

<xsl:template match="fandc" mode="set-countas" priority="0">
      <xsl:copy>
         <xsl:apply-templates select="@*|node()" mode="set-countas"/>
      </xsl:copy>
   </xsl:template>

<xsl:template match="fandc-note" mode="set-countas" priority="0">
      <xsl:copy>
         <xsl:apply-templates select="@*|node()" mode="set-countas"/>
      </xsl:copy>
   </xsl:template>

<xsl:template match="address/fax" mode="set-countas" priority="1">
      <xsl:copy>
         <xsl:apply-templates select="@*|node()" mode="set-countas"/>
      </xsl:copy>
   </xsl:template>

<xsl:template match="fax" mode="set-countas" priority="0">
      <xsl:copy>
         <xsl:apply-templates select="@*|node()" mode="set-countas"/>
      </xsl:copy>
   </xsl:template>

<xsl:template match="_ufe:fig-title" mode="set-countas" priority="0">
      <xsl:copy>
         <xsl:apply-templates select="@*|node()" mode="set-countas"/>
      </xsl:copy>
   </xsl:template>

<xsl:template match="figure/figno" mode="set-countas" priority="1">
      <xsl:copy>
         <xsl:apply-templates select="@*|node()" mode="set-countas"/>
      </xsl:copy>
   </xsl:template>

<xsl:template match="figno" mode="set-countas" priority="0">
      <xsl:copy>
         <xsl:apply-templates select="@*|node()" mode="set-countas"/>
      </xsl:copy>
   </xsl:template>

<xsl:template match="fix-equip" mode="set-countas" priority="0">
      <xsl:copy>
         <xsl:apply-templates select="@*|node()" mode="set-countas"/>
      </xsl:copy>
   </xsl:template>

<xsl:template match="pgblk/_ufe:fixequ-title" mode="set-countas" priority="5">
      <xsl:copy>
         <xsl:apply-templates select="@*|node()" mode="set-countas"/>
      </xsl:copy>
   </xsl:template>

<xsl:template match="pbfmatr/_ufe:fixequ-title" mode="set-countas" priority="4">
      <xsl:copy>
         <xsl:attribute name="_gte:count-as-id">cnt__pbfmatr^-None-.cnt</xsl:attribute>
         <xsl:apply-templates select="@*|node()" mode="set-countas"/>
      </xsl:copy>
   </xsl:template>

<xsl:template match="pwcspblist/_ufe:fixequ-title" mode="set-countas" priority="3">
      <xsl:copy>
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

<xsl:template match="_ufe:fixequ-title" mode="set-countas" priority="0">
      <xsl:copy>
         <xsl:apply-templates select="@*|node()" mode="set-countas"/>
      </xsl:copy>
   </xsl:template>

<xsl:template match="eqn/frac" mode="set-countas" priority="20">
      <xsl:copy>
         <xsl:apply-templates mode="set-countas" select="@*|node()"/>
      </xsl:copy>
   </xsl:template>

<xsl:template match="frac" mode="set-countas" priority="0">
      <xsl:copy>
         <xsl:apply-templates select="@*|node()" mode="set-countas"/>
      </xsl:copy>
   </xsl:template>

<xsl:template match="frontmatter" mode="set-countas" priority="0">
      <xsl:copy>
         <xsl:apply-templates select="@*|node()" mode="set-countas"/>
      </xsl:copy>
   </xsl:template>

<xsl:template match="pgblk/_ufe:general-title" mode="set-countas" priority="5">
      <xsl:copy>
         <xsl:apply-templates select="@*|node()" mode="set-countas"/>
      </xsl:copy>
   </xsl:template>

<xsl:template match="pbfmatr/_ufe:general-title" mode="set-countas" priority="4">
      <xsl:copy>
         <xsl:attribute name="_gte:count-as-id">cnt__pbfmatr^-None-.cnt</xsl:attribute>
         <xsl:apply-templates select="@*|node()" mode="set-countas"/>
      </xsl:copy>
   </xsl:template>

<xsl:template match="pwcspblist/_ufe:general-title" mode="set-countas" priority="3">
      <xsl:copy>
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

<xsl:template match="_ufe:general-title" mode="set-countas" priority="0">
      <xsl:copy>
         <xsl:apply-templates select="@*|node()" mode="set-countas"/>
      </xsl:copy>
   </xsl:template>

<xsl:template match="pgblk/_ufe:glossary-title" mode="set-countas" priority="3">
      <xsl:copy>
         <xsl:apply-templates select="@*|node()" mode="set-countas"/>
      </xsl:copy>
   </xsl:template>

<xsl:template match="pbfmatr/_ufe:glossary-title" mode="set-countas" priority="2">
      <xsl:copy>
         <xsl:attribute name="_gte:count-as-id">cnt__pbfmatr^-None-.cnt</xsl:attribute>
         <xsl:apply-templates select="@*|node()" mode="set-countas"/>
      </xsl:copy>
   </xsl:template>

<xsl:template match="pwcspblist/_ufe:glossary-title" mode="set-countas" priority="1">
      <xsl:copy>
         <xsl:apply-templates select="@*|node()" mode="set-countas"/>
      </xsl:copy>
   </xsl:template>

<xsl:template match="_ufe:glossary-title" mode="set-countas" priority="0">
      <xsl:copy>
         <xsl:apply-templates select="@*|node()" mode="set-countas"/>
      </xsl:copy>
   </xsl:template>

<xsl:template match="_ufe:hidden" mode="set-countas" priority="0">
      <xsl:copy>
         <xsl:apply-templates select="@*|node()" mode="set-countas"/>
      </xsl:copy>
   </xsl:template>

<xsl:template match="highlights" mode="set-countas" priority="0">
      <xsl:copy>
         <xsl:apply-templates mode="set-countas" select="@*|node()"> </xsl:apply-templates>
      </xsl:copy>
   </xsl:template>

<xsl:template match="_ufe:highlights-link" mode="set-countas" priority="0">
      <xsl:copy>
         <xsl:apply-templates select="@*|node()" mode="set-countas"/>
      </xsl:copy>
   </xsl:template>

<xsl:template match="history" mode="set-countas" priority="0">
      <xsl:copy>
         <xsl:apply-templates select="@*|node()" mode="set-countas"/>
      </xsl:copy>
   </xsl:template>

<xsl:template match="hl-fragment" mode="set-countas" priority="0">
      <xsl:copy>
         <xsl:apply-templates select="@*|node()" mode="set-countas"/>
      </xsl:copy>
   </xsl:template>

<xsl:template match="pgblk/_ufe:howtouse-title" mode="set-countas" priority="2">
      <xsl:copy>
         <xsl:apply-templates select="@*|node()" mode="set-countas"/>
      </xsl:copy>
   </xsl:template>

<xsl:template match="pbfmatr/_ufe:howtouse-title" mode="set-countas" priority="1">
      <xsl:copy>
         <xsl:attribute name="_gte:count-as-id">cnt__pbfmatr^-None-.cnt</xsl:attribute>
         <xsl:apply-templates select="@*|node()" mode="set-countas"/>
      </xsl:copy>
   </xsl:template>

<xsl:template match="_ufe:howtouse-title" mode="set-countas" priority="0">
      <xsl:copy>
         <xsl:apply-templates select="@*|node()" mode="set-countas"/>
      </xsl:copy>
   </xsl:template>

<xsl:template match="insert" mode="set-countas" priority="0">
      <xsl:copy>
         <xsl:apply-templates select="@*|node()" mode="set-countas"/>
      </xsl:copy>
   </xsl:template>

<xsl:template match="int-mail" mode="set-countas" priority="0">
      <xsl:copy>
         <xsl:apply-templates select="@*|node()" mode="set-countas"/>
      </xsl:copy>
   </xsl:template>

<xsl:template match="intro" mode="set-countas" priority="0">
      <xsl:copy>
         <xsl:apply-templates select="@*|node()" mode="set-countas"/>
      </xsl:copy>
   </xsl:template>

<xsl:template match="pgblk/_ufe:intro-title" mode="set-countas" priority="2">
      <xsl:copy>
         <xsl:apply-templates select="@*|node()" mode="set-countas"/>
      </xsl:copy>
   </xsl:template>

<xsl:template match="pbfmatr/_ufe:intro-title" mode="set-countas" priority="1">
      <xsl:copy>
         <xsl:attribute name="_gte:count-as-id">cnt__pbfmatr^-None-.cnt</xsl:attribute>
         <xsl:apply-templates select="@*|node()" mode="set-countas"/>
      </xsl:copy>
   </xsl:template>

<xsl:template match="_ufe:intro-title" mode="set-countas" priority="0">
      <xsl:copy>
         <xsl:apply-templates select="@*|node()" mode="set-countas"/>
      </xsl:copy>
   </xsl:template>

<xsl:template match="isempty" mode="set-countas" priority="0">
      <xsl:copy>
         <xsl:apply-templates select="@*|node()" mode="set-countas"/>
      </xsl:copy>
   </xsl:template>

<xsl:template match="step/step/enumlist/item" mode="set-countas" priority="30">
      <xsl:copy>
         <xsl:apply-templates select="@*|node()" mode="set-countas"/>
      </xsl:copy>
   </xsl:template>

<xsl:template match="prclist4//prclist4//prclist4//prclist4/item" mode="set-countas" priority="29">
      <xsl:copy>
         <xsl:apply-templates select="@*|node()" mode="set-countas"/>
      </xsl:copy>
   </xsl:template>

<xsl:template match="list4//list4//list4//list4/item" mode="set-countas" priority="28">
      <xsl:copy>
         <xsl:apply-templates select="@*|node()" mode="set-countas"/>
      </xsl:copy>
   </xsl:template>

<xsl:template match="enumlist//enumlist//enumlist//enumlist/item" mode="set-countas" priority="27">
      <xsl:copy>
         <xsl:apply-templates select="@*|node()" mode="set-countas"/>
      </xsl:copy>
   </xsl:template>

<xsl:template match="prclist4//prclist4//prclist4/item" mode="set-countas" priority="26">
      <xsl:copy>
         <xsl:apply-templates select="@*|node()" mode="set-countas"/>
      </xsl:copy>
   </xsl:template>

<xsl:template match="list4//list4//list4/item" mode="set-countas" priority="25">
      <xsl:copy>
         <xsl:apply-templates select="@*|node()" mode="set-countas"/>
      </xsl:copy>
   </xsl:template>

<xsl:template match="list//list//list/item" mode="set-countas" priority="24">
      <xsl:copy>
         <xsl:apply-templates select="@*|node()" mode="set-countas"/>
      </xsl:copy>
   </xsl:template>

<xsl:template match="enumlist//enumlist//enumlist/item" mode="set-countas" priority="23">
      <xsl:copy>
         <xsl:apply-templates select="@*|node()" mode="set-countas"/>
      </xsl:copy>
   </xsl:template>

<xsl:template match="bullist//bullist//bullist/item" mode="set-countas" priority="22">
      <xsl:copy>
         <xsl:apply-templates select="@*|node()" mode="set-countas"/>
      </xsl:copy>
   </xsl:template>

<xsl:template match="prclist4//prclist4/item" mode="set-countas" priority="21">
      <xsl:copy>
         <xsl:apply-templates select="@*|node()" mode="set-countas"/>
      </xsl:copy>
   </xsl:template>

<xsl:template match="list4//list4/item" mode="set-countas" priority="20">
      <xsl:copy>
         <xsl:apply-templates select="@*|node()" mode="set-countas"/>
      </xsl:copy>
   </xsl:template>

<xsl:template match="list//list/item" mode="set-countas" priority="19">
      <xsl:copy>
         <xsl:apply-templates select="@*|node()" mode="set-countas"/>
      </xsl:copy>
   </xsl:template>

<xsl:template match="enumlist//enumlist/item" mode="set-countas" priority="18">
      <xsl:copy>
         <xsl:apply-templates select="@*|node()" mode="set-countas"/>
      </xsl:copy>
   </xsl:template>

<xsl:template match="bullist//bullist/item" mode="set-countas" priority="17">
      <xsl:copy>
         <xsl:apply-templates select="@*|node()" mode="set-countas"/>
      </xsl:copy>
   </xsl:template>

<xsl:template match="list/item[table/@tabstyle='frac']" mode="set-countas" priority="16">
      <xsl:copy>
         <xsl:apply-templates mode="set-countas" select="@*|node()"/>
      </xsl:copy>
   </xsl:template>

<xsl:template match="bullist/item[table/@tabstyle='frac']" mode="set-countas" priority="15">
      <xsl:copy>
         <xsl:apply-templates mode="set-countas" select="@*|node()"/>
      </xsl:copy>
   </xsl:template>

<xsl:template match="pwcchapsect-list/item" mode="set-countas" priority="14">
      <xsl:copy>
         <xsl:apply-templates select="@*|node()" mode="set-countas"/>
      </xsl:copy>
   </xsl:template>

<xsl:template match="numlist/item" mode="set-countas" priority="13">
      <xsl:copy>
         <xsl:apply-templates select="@*|node()" mode="set-countas"/>
      </xsl:copy>
   </xsl:template>

<xsl:template match="unlist/item" mode="set-countas" priority="12">
      <xsl:copy>
         <xsl:apply-templates select="@*|node()" mode="set-countas"/>
      </xsl:copy>
   </xsl:template>

<xsl:template match="prclist4/item" mode="set-countas" priority="11">
      <xsl:copy>
         <xsl:apply-templates select="@*|node()" mode="set-countas"/>
      </xsl:copy>
   </xsl:template>

<xsl:template match="prclist3/item" mode="set-countas" priority="10">
      <xsl:copy>
         <xsl:apply-templates select="@*|node()" mode="set-countas"/>
      </xsl:copy>
   </xsl:template>

<xsl:template match="prclist2/item" mode="set-countas" priority="9">
      <xsl:copy>
         <xsl:apply-templates select="@*|node()" mode="set-countas"/>
      </xsl:copy>
   </xsl:template>

<xsl:template match="prclist1/item" mode="set-countas" priority="8">
      <xsl:copy>
         <xsl:apply-templates select="@*|node()" mode="set-countas"/>
      </xsl:copy>
   </xsl:template>

<xsl:template match="list4/item" mode="set-countas" priority="7">
      <xsl:copy>
         <xsl:apply-templates select="@*|node()" mode="set-countas"/>
      </xsl:copy>
   </xsl:template>

<xsl:template match="list3/item" mode="set-countas" priority="6">
      <xsl:copy>
         <xsl:apply-templates select="@*|node()" mode="set-countas"/>
      </xsl:copy>
   </xsl:template>

<xsl:template match="list2/item" mode="set-countas" priority="5">
      <xsl:copy>
         <xsl:apply-templates select="@*|node()" mode="set-countas"/>
      </xsl:copy>
   </xsl:template>

<xsl:template match="list1/item" mode="set-countas" priority="4">
      <xsl:copy>
         <xsl:apply-templates select="@*|node()" mode="set-countas"/>
      </xsl:copy>
   </xsl:template>

<xsl:template match="list/item" mode="set-countas" priority="3">
      <xsl:copy>
         <xsl:apply-templates select="@*|node()" mode="set-countas"/>
      </xsl:copy>
   </xsl:template>

<xsl:template match="enumlist/item" mode="set-countas" priority="2">
      <xsl:copy>
         <xsl:apply-templates select="@*|node()" mode="set-countas"/>
      </xsl:copy>
   </xsl:template>

<xsl:template match="bullist/item" mode="set-countas" priority="1">
      <xsl:copy>
         <xsl:apply-templates select="@*|node()" mode="set-countas"/>
      </xsl:copy>
   </xsl:template>

<xsl:template match="item" mode="set-countas" priority="0">
      <xsl:copy>
         <xsl:apply-templates select="@*|node()" mode="set-countas"/>
      </xsl:copy>
   </xsl:template>

<xsl:template match="item-nbr" mode="set-countas" priority="0">
      <xsl:copy>
         <xsl:apply-templates select="@*|node()" mode="set-countas"/>
      </xsl:copy>
   </xsl:template>

<xsl:template match="figure/key" mode="set-countas" priority="20">
      <xsl:copy>
         <xsl:apply-templates mode="set-countas" select="@*|node()"> </xsl:apply-templates>
      </xsl:copy>
   </xsl:template>

<xsl:template match="key" mode="set-countas" priority="0">
      <xsl:copy>
         <xsl:apply-templates select="@*|node()" mode="set-countas"/>
      </xsl:copy>
   </xsl:template>

<xsl:template match="para/list" mode="set-countas" priority="1">
      <xsl:copy>
         <xsl:apply-templates select="@*|node()" mode="set-countas"/>
      </xsl:copy>
   </xsl:template>

<xsl:template match="list" mode="set-countas" priority="0">
      <xsl:copy>
         <xsl:apply-templates select="@*|node()" mode="set-countas"/>
      </xsl:copy>
   </xsl:template>

<xsl:template match="lof" mode="set-countas" priority="0">
      <xsl:copy>
         <xsl:apply-templates select="@*|node()" mode="set-countas"/>
      </xsl:copy>
   </xsl:template>

<xsl:template match="lof-item" mode="set-countas" priority="0">
      <xsl:copy>
         <xsl:apply-templates select="@*|node()" mode="set-countas"/>
      </xsl:copy>
   </xsl:template>

<xsl:template match="lot" mode="set-countas" priority="0">
      <xsl:copy>
         <xsl:apply-templates mode="set-countas" select="@*|node()"> </xsl:apply-templates>
      </xsl:copy>
   </xsl:template>

<xsl:template match="lot-item" mode="set-countas" priority="0">
      <xsl:copy>
         <xsl:apply-templates select="@*|node()" mode="set-countas"/>
      </xsl:copy>
   </xsl:template>

<xsl:template match="maint-level" mode="set-countas" priority="0">
      <xsl:copy>
         <xsl:apply-templates select="@*|node()" mode="set-countas"/>
      </xsl:copy>
   </xsl:template>

<xsl:template match="manual-pn" mode="set-countas" priority="0">
      <xsl:copy>
         <xsl:apply-templates select="@*|node()" mode="set-countas"/>
      </xsl:copy>
   </xsl:template>

<xsl:template match="pbfmatr/manual-title" mode="set-countas" priority="3">
      <xsl:copy>
         <xsl:attribute name="_gte:count-as-id">cnt__pbfmatr^-None-.cnt</xsl:attribute>
         <xsl:apply-templates select="@*|node()" mode="set-countas"/>
      </xsl:copy>
   </xsl:template>

<xsl:template match="pwcspblist/manual-title" mode="set-countas" priority="2">
      <xsl:copy>
         <xsl:apply-templates select="@*|node()" mode="set-countas"/>
      </xsl:copy>
   </xsl:template>

<xsl:template match="pgblk/manual-title" mode="set-countas" priority="1">
      <xsl:copy>
         <xsl:apply-templates select="@*|node()" mode="set-countas"/>
      </xsl:copy>
   </xsl:template>

<xsl:template match="manual-title" mode="set-countas" priority="0">
      <xsl:copy>
         <xsl:apply-templates select="@*|node()" mode="set-countas"/>
      </xsl:copy>
   </xsl:template>

<xsl:template match="marker" mode="set-countas" priority="0">
      <xsl:copy>
         <xsl:apply-templates select="@*|node()" mode="set-countas"/>
      </xsl:copy>
   </xsl:template>

<xsl:template match="model" mode="set-countas" priority="0">
      <xsl:copy>
         <xsl:apply-templates select="@*|node()" mode="set-countas"/>
      </xsl:copy>
   </xsl:template>

<xsl:template match="module" mode="set-countas" priority="0">
      <xsl:copy>
         <xsl:apply-templates select="@*|node()" mode="set-countas"/>
      </xsl:copy>
   </xsl:template>

<xsl:template match="module-item" mode="set-countas" priority="0">
      <xsl:copy>
         <xsl:apply-templates select="@*|node()" mode="set-countas"/>
      </xsl:copy>
   </xsl:template>

<xsl:template match="multi" mode="set-countas" priority="0">
      <xsl:copy>
         <xsl:apply-templates select="@*|node()" mode="set-countas"/>
      </xsl:copy>
   </xsl:template>

<xsl:template match="n-para" mode="set-countas" priority="0">
      <xsl:copy>
         <xsl:apply-templates select="@*|node()" mode="set-countas"/>
      </xsl:copy>
   </xsl:template>

<xsl:template match="no-street" mode="set-countas" priority="0">
      <xsl:copy>
         <xsl:apply-templates select="@*|node()" mode="set-countas"/>
      </xsl:copy>
   </xsl:template>

<xsl:template match="nobrk" mode="set-countas" priority="0">
      <xsl:copy>
         <xsl:apply-templates select="@*|node()" mode="set-countas"/>
      </xsl:copy>
   </xsl:template>

<xsl:template match="_ufe:not-applicable" mode="set-countas" priority="0">
      <xsl:copy>
         <xsl:apply-templates select="@*|node()" mode="set-countas"/>
      </xsl:copy>
   </xsl:template>

<xsl:template match="nowrap" mode="set-countas" priority="0">
      <xsl:copy>
         <xsl:apply-templates mode="set-countas" select="@*|node()"> </xsl:apply-templates>
      </xsl:copy>
   </xsl:template>

<xsl:template match="ata-page-block//_sfe:BeforeOrAfterText//_ufe:npara-numbering" mode="set-countas" priority="2">
      <xsl:copy>
         <xsl:attribute name="_gte:count-as-id">cnt___ufe:npara-numbering^ata-page-block.cnt</xsl:attribute>
         <xsl:apply-templates select="@*|node()" mode="set-countas"/>
      </xsl:copy>
   </xsl:template>

<xsl:template match="page-block//_sfe:BeforeOrAfterText//_ufe:npara-numbering" mode="set-countas" priority="1">
      <xsl:copy>
         <xsl:attribute name="_gte:count-as-id">cnt___ufe:npara-numbering^page-block.cnt</xsl:attribute>
         <xsl:apply-templates select="@*|node()" mode="set-countas"/>
      </xsl:copy>
   </xsl:template>

<xsl:template match="_ufe:npara-numbering" mode="set-countas" priority="0">
      <xsl:copy>
         <xsl:apply-templates select="@*|node()" mode="set-countas"/>
      </xsl:copy>
   </xsl:template>

<xsl:template match="num" mode="set-countas" priority="0">
      <xsl:copy>
         <xsl:apply-templates select="@*|node()" mode="set-countas"/>
      </xsl:copy>
   </xsl:template>

<xsl:template match="num-index" mode="set-countas" priority="0">
      <xsl:copy>
         <xsl:apply-templates mode="set-countas" select="@*|node()"> </xsl:apply-templates>
      </xsl:copy>
   </xsl:template>

<xsl:template match="pgblk/_ufe:num-index-title" mode="set-countas" priority="3">
      <xsl:copy>
         <xsl:apply-templates select="@*|node()" mode="set-countas"/>
      </xsl:copy>
   </xsl:template>

<xsl:template match="pbfmatr/_ufe:num-index-title" mode="set-countas" priority="2">
      <xsl:copy>
         <xsl:attribute name="_gte:count-as-id">cnt__pbfmatr^-None-.cnt</xsl:attribute>
         <xsl:apply-templates select="@*|node()" mode="set-countas"/>
      </xsl:copy>
   </xsl:template>

<xsl:template match="pwcspblist/_ufe:num-index-title" mode="set-countas" priority="1">
      <xsl:copy>
         <xsl:apply-templates select="@*|node()" mode="set-countas"/>
      </xsl:copy>
   </xsl:template>

<xsl:template match="_ufe:num-index-title" mode="set-countas" priority="0">
      <xsl:copy>
         <xsl:apply-templates select="@*|node()" mode="set-countas"/>
      </xsl:copy>
   </xsl:template>

<xsl:template match="num-list" mode="set-countas" priority="0">
      <xsl:copy>
         <xsl:apply-templates select="@*|node()" mode="set-countas"/>
      </xsl:copy>
   </xsl:template>

<xsl:template match="pgblk/_ufe:nut-option-title" mode="set-countas" priority="3">
      <xsl:copy>
         <xsl:apply-templates select="@*|node()" mode="set-countas"/>
      </xsl:copy>
   </xsl:template>

<xsl:template match="pbfmatr/_ufe:nut-option-title" mode="set-countas" priority="2">
      <xsl:copy>
         <xsl:attribute name="_gte:count-as-id">cnt__pbfmatr^-None-.cnt</xsl:attribute>
         <xsl:apply-templates select="@*|node()" mode="set-countas"/>
      </xsl:copy>
   </xsl:template>

<xsl:template match="pwcspblist/_ufe:nut-option-title" mode="set-countas" priority="1">
      <xsl:copy>
         <xsl:apply-templates select="@*|node()" mode="set-countas"/>
      </xsl:copy>
   </xsl:template>

<xsl:template match="_ufe:nut-option-title" mode="set-countas" priority="0">
      <xsl:copy>
         <xsl:apply-templates select="@*|node()" mode="set-countas"/>
      </xsl:copy>
   </xsl:template>

<xsl:template match="orig-date" mode="set-countas" priority="0">
      <xsl:copy>
         <xsl:apply-templates select="@*|node()" mode="set-countas"/>
      </xsl:copy>
   </xsl:template>

<xsl:template match="book[contains(@doctype, 'epc')]//page-block[@pb-name='title-page']" mode="set-countas" priority="6">
      <xsl:copy>
         <xsl:apply-templates mode="set-countas" select="@*|node()"/>
      </xsl:copy>
   </xsl:template>

<xsl:template match="book[contains(@doctype, 'tmm')]//page-block[@pb-name='title-page']" mode="set-countas" priority="9">
      <xsl:copy>
         <xsl:apply-templates mode="set-countas" select="@*|node()"/>
      </xsl:copy>
   </xsl:template>

<xsl:template match="book[contains(@doctype, 'lmm')]//page-block[@pb-name='title-page']" mode="set-countas" priority="9">
      <xsl:copy>
         <xsl:apply-templates mode="set-countas" select="@*|node()"/>
      </xsl:copy>
   </xsl:template>

<xsl:template match="book[contains(@doctype, 'em')]//page-block[@pb-name='title-page']" mode="set-countas" priority="8">
      <xsl:copy>
         <xsl:apply-templates mode="set-countas" select="@*|node()"/>
      </xsl:copy>
   </xsl:template>

<xsl:template match="book[contains(@doctype, 'cir')]//page-block[@pb-name='title-page']" mode="set-countas" priority="7">
      <xsl:copy>
         <xsl:apply-templates mode="set-countas" select="@*|node()"/>
      </xsl:copy>
   </xsl:template>

<xsl:template match="frontmatter/page-block[@pb-name='title-page']" mode="set-countas" priority="5">
      <xsl:copy>
         <xsl:apply-templates mode="set-countas" select="@*|node()"/>
      </xsl:copy>
   </xsl:template>

<xsl:template match="book[contains(@doctype, 'cir') or contains(@doctype, 'em')]//page-block[@pb-name='howtouse']" mode="set-countas" priority="5">
      <xsl:copy>
         <xsl:apply-templates mode="set-countas" select="@*|node()"/>
      </xsl:copy>
   </xsl:template>

<xsl:template match="page-block[@pb-name='supp_list']" mode="set-countas" priority="4">
      <xsl:copy>
         <xsl:apply-templates mode="set-countas" select="@*|node()"/>
      </xsl:copy>
   </xsl:template>

<xsl:template match="page-block[@pb-name='glossary']" mode="set-countas" priority="3">
      <xsl:copy>
         <xsl:apply-templates mode="set-countas" select="@*|node()"/>
      </xsl:copy>
   </xsl:template>

<xsl:template match="page-block[@pb-name='intro']" mode="set-countas" priority="2">
      <xsl:copy>
         <xsl:apply-templates mode="set-countas" select="@*|node()"/>
      </xsl:copy>
   </xsl:template>

<xsl:template match="page-block[@pb-name='nut_option']" mode="set-countas" priority="1">
      <xsl:copy>
         <xsl:apply-templates mode="set-countas" select="@*|node()"/>
      </xsl:copy>
   </xsl:template>

<xsl:template match="page-block" mode="set-countas" priority="0">
      <xsl:copy>
         <xsl:apply-templates mode="set-countas" select="@*|node()"> </xsl:apply-templates>
      </xsl:copy>
   </xsl:template>

<xsl:template match="subpara/subpara/subpara/subpara/subpara/subpara[not(title)]/para" mode="set-countas" priority="52">
      <xsl:copy>
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

<xsl:template match="n-para/subpara/subpara[child::title]/para" mode="set-countas" priority="49">
      <xsl:copy>
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

<xsl:template match="n-para/subpara[child::title]/para" mode="set-countas" priority="46">
      <xsl:copy>
         <xsl:apply-templates select="@*|node()" mode="set-countas"/>
      </xsl:copy>
   </xsl:template>

<xsl:template match="prcitem3/prcitem/para" mode="set-countas" priority="45">
      <xsl:copy>
         <xsl:apply-templates select="@*|node()" mode="set-countas"/>
      </xsl:copy>
   </xsl:template>

<xsl:template match="subpara/subpara/para" mode="set-countas" priority="44">
      <xsl:copy>
         <xsl:apply-templates select="@*|node()" mode="set-countas"/>
      </xsl:copy>
   </xsl:template>

<xsl:template match="n-para/subpara/para" mode="set-countas" priority="43">
      <xsl:copy>
         <xsl:attribute name="_gte:count-as-id">cnt__para^n-para.cnt</xsl:attribute>
         <xsl:apply-templates select="@*|node()" mode="set-countas"/>
      </xsl:copy>
   </xsl:template>

<xsl:template match="book[contains(@doctype, 'cir')]//note/para" mode="set-countas" priority="42">
      <xsl:copy>
         <xsl:apply-templates select="@*|node()" mode="set-countas"/>
      </xsl:copy>
   </xsl:template>

<xsl:template match="pageblock-front/general//para" mode="set-countas" priority="40">
      <xsl:copy>
         <xsl:attribute name="_gte:count-as-id">cnt__para^general.cnt</xsl:attribute>
         <xsl:apply-templates mode="set-countas" select="@*|node()"/>
      </xsl:copy>
   </xsl:template>

<xsl:template match="warning/para[1]" mode="set-countas" priority="40">
      <xsl:copy>
         <xsl:apply-templates select="@*|node()" mode="set-countas"/>
      </xsl:copy>
   </xsl:template>

<xsl:template match="caution/para[1]" mode="set-countas" priority="39">
      <xsl:copy>
         <xsl:apply-templates select="@*|node()" mode="set-countas"/>
      </xsl:copy>
   </xsl:template>

<xsl:template match="_ufe:step-proc-num/para[1]" mode="set-countas" priority="38">
      <xsl:copy>
         <xsl:apply-templates select="@*|node()" mode="set-countas"/>
      </xsl:copy>
   </xsl:template>

<xsl:template match="step5/para[1]" mode="set-countas" priority="37">
      <xsl:copy>
         <xsl:apply-templates select="@*|node()" mode="set-countas"/>
      </xsl:copy>
   </xsl:template>

<xsl:template match="step4/para[1]" mode="set-countas" priority="36">
      <xsl:copy>
         <xsl:apply-templates select="@*|node()" mode="set-countas"/>
      </xsl:copy>
   </xsl:template>

<xsl:template match="step3/para[1]" mode="set-countas" priority="35">
      <xsl:copy>
         <xsl:apply-templates select="@*|node()" mode="set-countas"/>
      </xsl:copy>
   </xsl:template>

<xsl:template match="step2/para[1]" mode="set-countas" priority="34">
      <xsl:copy>
         <xsl:apply-templates select="@*|node()" mode="set-countas"/>
      </xsl:copy>
   </xsl:template>

<xsl:template match="numlitem/para[1]" mode="set-countas" priority="33">
      <xsl:copy>
         <xsl:apply-templates select="@*|node()" mode="set-countas"/>
      </xsl:copy>
   </xsl:template>

<xsl:template match="note/para[1]" mode="set-countas" priority="32">
      <xsl:copy>
         <xsl:apply-templates select="@*|node()" mode="set-countas"/>
      </xsl:copy>
   </xsl:template>

<xsl:template match="unlitem/para[1]" mode="set-countas" priority="31">
      <xsl:copy>
         <xsl:apply-templates select="@*|node()" mode="set-countas"/>
      </xsl:copy>
   </xsl:template>

<xsl:template match="prcitem4/para[1]" mode="set-countas" priority="30">
      <xsl:copy>
         <xsl:apply-templates select="@*|node()" mode="set-countas"/>
      </xsl:copy>
   </xsl:template>

<xsl:template match="l4item/para[1]" mode="set-countas" priority="29">
      <xsl:copy>
         <xsl:apply-templates select="@*|node()" mode="set-countas"/>
      </xsl:copy>
   </xsl:template>

<xsl:template match="l3item/para[1]" mode="set-countas" priority="28">
      <xsl:copy>
         <xsl:apply-templates select="@*|node()" mode="set-countas"/>
      </xsl:copy>
   </xsl:template>

<xsl:template match="l2item/para[1]" mode="set-countas" priority="27">
      <xsl:copy>
         <xsl:apply-templates select="@*|node()" mode="set-countas"/>
      </xsl:copy>
   </xsl:template>

<xsl:template match="l1item/para[1]" mode="set-countas" priority="26">
      <xsl:copy>
         <xsl:apply-templates select="@*|node()" mode="set-countas"/>
      </xsl:copy>
   </xsl:template>

<xsl:template match="step/para[1]" mode="set-countas" priority="25">
      <xsl:copy>
         <xsl:apply-templates select="@*|node()" mode="set-countas"/>
      </xsl:copy>
   </xsl:template>

<xsl:template match="item/para[1]" mode="set-countas" priority="24">
      <xsl:copy>
         <xsl:apply-templates select="@*|node()" mode="set-countas"/>
      </xsl:copy>
   </xsl:template>

<xsl:template match="n-para[ancestor::book[contains(@doctype, 'epc')]]/para" mode="set-countas" priority="18">
      <xsl:copy>
         <xsl:attribute name="_gte:count-as-id">cnt__para.xcnt</xsl:attribute>
         <xsl:apply-templates mode="set-countas" select="@*|node()"/>
      </xsl:copy>
   </xsl:template>

<xsl:template match="_ufe:step-proc-num/para[position()&gt;1]" mode="set-countas" priority="22">
      <xsl:copy>
         <xsl:apply-templates select="@*|node()" mode="set-countas"/>
      </xsl:copy>
   </xsl:template>

<xsl:template match="step5/para[position()&gt;1]" mode="set-countas" priority="21">
      <xsl:copy>
         <xsl:apply-templates select="@*|node()" mode="set-countas"/>
      </xsl:copy>
   </xsl:template>

<xsl:template match="step4/para[position()&gt;1]" mode="set-countas" priority="20">
      <xsl:copy>
         <xsl:apply-templates select="@*|node()" mode="set-countas"/>
      </xsl:copy>
   </xsl:template>

<xsl:template match="step3/para[position()&gt;1]" mode="set-countas" priority="19">
      <xsl:copy>
         <xsl:apply-templates select="@*|node()" mode="set-countas"/>
      </xsl:copy>
   </xsl:template>

<xsl:template match="step2/para[position()&gt;1]" mode="set-countas" priority="18">
      <xsl:copy>
         <xsl:apply-templates select="@*|node()" mode="set-countas"/>
      </xsl:copy>
   </xsl:template>

<xsl:template match="numlitem/para[position()&gt;1]" mode="set-countas" priority="17">
      <xsl:copy>
         <xsl:apply-templates select="@*|node()" mode="set-countas"/>
      </xsl:copy>
   </xsl:template>

<xsl:template match="unlitem/para[position()&gt;1]" mode="set-countas" priority="16">
      <xsl:copy>
         <xsl:apply-templates select="@*|node()" mode="set-countas"/>
      </xsl:copy>
   </xsl:template>

<xsl:template match="prcitem4/para[position()&gt;1]" mode="set-countas" priority="15">
      <xsl:copy>
         <xsl:apply-templates select="@*|node()" mode="set-countas"/>
      </xsl:copy>
   </xsl:template>

<xsl:template match="l4item/para[position()&gt;1]" mode="set-countas" priority="14">
      <xsl:copy>
         <xsl:apply-templates select="@*|node()" mode="set-countas"/>
      </xsl:copy>
   </xsl:template>

<xsl:template match="l3item/para[position()&gt;1]" mode="set-countas" priority="13">
      <xsl:copy>
         <xsl:apply-templates select="@*|node()" mode="set-countas"/>
      </xsl:copy>
   </xsl:template>

<xsl:template match="l2item/para[position()&gt;1]" mode="set-countas" priority="12">
      <xsl:copy>
         <xsl:apply-templates select="@*|node()" mode="set-countas"/>
      </xsl:copy>
   </xsl:template>

<xsl:template match="l1item/para[position()&gt;1]" mode="set-countas" priority="11">
      <xsl:copy>
         <xsl:apply-templates select="@*|node()" mode="set-countas"/>
      </xsl:copy>
   </xsl:template>

<xsl:template match="step/para[position()&gt;1]" mode="set-countas" priority="10">
      <xsl:copy>
         <xsl:apply-templates select="@*|node()" mode="set-countas"/>
      </xsl:copy>
   </xsl:template>

<xsl:template match="item/para[position()&gt;1]" mode="set-countas" priority="9">
      <xsl:copy>
         <xsl:apply-templates select="@*|node()" mode="set-countas"/>
      </xsl:copy>
   </xsl:template>

<xsl:template match="taskproc/para" mode="set-countas" priority="7">
      <xsl:copy>
         <xsl:attribute name="_gte:count-as-id">cnt__para.xcnt</xsl:attribute>
         <xsl:apply-templates mode="set-countas" select="@*|node()"> </xsl:apply-templates>
      </xsl:copy>
   </xsl:template>

<xsl:template match="title-page/para" mode="set-countas" priority="7">
      <xsl:copy>
         <xsl:apply-templates select="@*|node()" mode="set-countas"/>
      </xsl:copy>
   </xsl:template>

<xsl:template match="numlitem/para" mode="set-countas" priority="6">
      <xsl:copy>
         <xsl:apply-templates select="@*|node()" mode="set-countas"/>
      </xsl:copy>
   </xsl:template>

<xsl:template match="tprereq/para" mode="set-countas" priority="4">
      <xsl:copy>
         <xsl:attribute name="_gte:count-as-id">cnt__para.xcnt</xsl:attribute>
         <xsl:apply-templates mode="set-countas" select="@*|node()"> </xsl:apply-templates>
      </xsl:copy>
   </xsl:template>

<xsl:template match="sbnbr/para" mode="set-countas" priority="4">
      <xsl:copy>
         <xsl:apply-templates select="@*|node()" mode="set-countas"/>
      </xsl:copy>
   </xsl:template>

<xsl:template match="n-para/para" mode="set-countas" priority="3">
      <xsl:copy>
         <xsl:apply-templates select="@*|node()" mode="set-countas"/>
      </xsl:copy>
   </xsl:template>

<xsl:template match="subpara/para" mode="set-countas" priority="2">
      <xsl:copy>
         <xsl:apply-templates select="@*|node()" mode="set-countas"/>
      </xsl:copy>
   </xsl:template>

<xsl:template match="nomen-col//para" mode="set-countas" priority="1">
      <xsl:copy>
         <xsl:apply-templates select="@*|node()" mode="set-countas"/>
      </xsl:copy>
   </xsl:template>

<xsl:template match="para" mode="set-countas" priority="0">
      <xsl:copy>
         <xsl:apply-templates select="@*|node()" mode="set-countas"/>
      </xsl:copy>
   </xsl:template>

<xsl:template match="chapsect-list/part-group" mode="set-countas" priority="3">
      <xsl:copy>
         <xsl:apply-templates select="@*|node()" mode="set-countas"/>
      </xsl:copy>
   </xsl:template>

<xsl:template match="numlist/part-group" mode="set-countas" priority="2">
      <xsl:copy>
         <xsl:apply-templates select="@*|node()" mode="set-countas"/>
      </xsl:copy>
   </xsl:template>

<xsl:template match="pwcchapsect-list/part-group" mode="set-countas" priority="1">
      <xsl:copy>
         <xsl:apply-templates select="@*|node()" mode="set-countas"/>
      </xsl:copy>
   </xsl:template>

<xsl:template match="part-group" mode="set-countas" priority="0">
      <xsl:copy>
         <xsl:apply-templates select="@*|node()" mode="set-countas"/>
      </xsl:copy>
   </xsl:template>

<xsl:template match="part-loc" mode="set-countas" priority="0">
      <xsl:copy>
         <xsl:apply-templates select="@*|node()" mode="set-countas"/>
      </xsl:copy>
   </xsl:template>

<xsl:template match="partname" mode="set-countas" priority="0">
      <xsl:copy>
         <xsl:apply-templates select="@*|node()" mode="set-countas"/>
      </xsl:copy>
   </xsl:template>

<xsl:template match="pcextract" mode="set-countas" priority="0">
      <xsl:copy>
         <xsl:apply-templates select="@*|node()" mode="set-countas"/>
      </xsl:copy>
   </xsl:template>

<xsl:template match="pgblk/_ufe:pdlist-title" mode="set-countas" priority="1">
      <xsl:copy>
         <xsl:apply-templates select="@*|node()" mode="set-countas"/>
      </xsl:copy>
   </xsl:template>

<xsl:template match="_ufe:pdlist-title" mode="set-countas" priority="0">
      <xsl:copy>
         <xsl:apply-templates select="@*|node()" mode="set-countas"/>
      </xsl:copy>
   </xsl:template>

<xsl:template match="pgblk-name" mode="set-countas" priority="0">
      <xsl:copy>
         <xsl:apply-templates select="@*|node()" mode="set-countas"/>
      </xsl:copy>
   </xsl:template>

<xsl:template match="pnr" mode="set-countas" priority="0">
      <xsl:copy>
         <xsl:apply-templates select="@*|node()" mode="set-countas"/>
      </xsl:copy>
   </xsl:template>

<xsl:template match="post-tr" mode="set-countas" priority="0">
      <xsl:copy>
         <xsl:apply-templates select="@*|node()" mode="set-countas"/>
      </xsl:copy>
   </xsl:template>

<xsl:template match="postal" mode="set-countas" priority="0">
      <xsl:copy>
         <xsl:apply-templates select="@*|node()" mode="set-countas"/>
      </xsl:copy>
   </xsl:template>

<xsl:template match="postsb" mode="set-countas" priority="0">
      <xsl:copy>
         <xsl:apply-templates mode="set-countas" select="@*|node()"> </xsl:apply-templates>
      </xsl:copy>
   </xsl:template>

<xsl:template match="pre-tr" mode="set-countas" priority="0">
      <xsl:copy>
         <xsl:apply-templates select="@*|node()" mode="set-countas"/>
      </xsl:copy>
   </xsl:template>

<xsl:template match="presb" mode="set-countas" priority="0">
      <xsl:copy>
         <xsl:apply-templates mode="set-countas" select="@*|node()"> </xsl:apply-templates>
      </xsl:copy>
   </xsl:template>

<xsl:template match="procedure" mode="set-countas" priority="0">
      <xsl:copy>
         <xsl:apply-templates select="@*|node()" mode="set-countas"/>
      </xsl:copy>
   </xsl:template>

<xsl:template match="process" mode="set-countas" priority="0">
      <xsl:copy>
         <xsl:apply-templates select="@*|node()" mode="set-countas"/>
      </xsl:copy>
   </xsl:template>

<xsl:template match="pwclmm-title//_ufe:proprietary-notice" mode="set-countas" priority="1">
      <xsl:copy>
         <xsl:apply-templates select="@*|node()" mode="set-countas"/>
      </xsl:copy>
   </xsl:template>

<xsl:template match="_ufe:proprietary-notice" mode="set-countas" priority="0">
      <xsl:copy>
         <xsl:apply-templates select="@*|node()" mode="set-countas"/>
      </xsl:copy>
   </xsl:template>

<xsl:template match="_ufe:proprietary-warning" mode="set-countas" priority="0">
      <xsl:copy>
         <xsl:apply-templates select="@*|node()" mode="set-countas"/>
      </xsl:copy>
   </xsl:template>

<xsl:template match="province" mode="set-countas" priority="0">
      <xsl:copy>
         <xsl:apply-templates select="@*|node()" mode="set-countas"/>
      </xsl:copy>
   </xsl:template>

<xsl:template match="qty[ancestor::book[contains(@doctype,'ipc')]]" mode="set-countas" priority="1">
      <xsl:copy>
         <xsl:apply-templates select="@*|node()" mode="set-countas"/>
      </xsl:copy>
   </xsl:template>

<xsl:template match="qty" mode="set-countas" priority="0">
      <xsl:copy>
         <xsl:apply-templates select="@*|node()" mode="set-countas"/>
      </xsl:copy>
   </xsl:template>

<xsl:template match="quantity" mode="set-countas" priority="0">
      <xsl:copy>
         <xsl:apply-templates select="@*|node()" mode="set-countas"/>
      </xsl:copy>
   </xsl:template>

<xsl:template match="record-of-revisions" mode="set-countas" priority="0">
      <xsl:copy>
         <xsl:apply-templates select="@*|node()" mode="set-countas"/>
      </xsl:copy>
   </xsl:template>

<xsl:template match="address/ref" mode="set-countas" priority="1">
      <xsl:copy>
         <xsl:apply-templates select="@*|node()" mode="set-countas"/>
      </xsl:copy>
   </xsl:template>

<xsl:template match="ref" mode="set-countas" priority="0">
      <xsl:copy>
         <xsl:apply-templates select="@*|node()" mode="set-countas"/>
      </xsl:copy>
   </xsl:template>

<xsl:template match="table//refext" mode="set-countas" priority="1">
      <xsl:copy>
         <xsl:apply-templates select="@*|node()" mode="set-countas"/>
      </xsl:copy>
   </xsl:template>

<xsl:template match="refext" mode="set-countas" priority="0">
      <xsl:copy>
         <xsl:apply-templates select="@*|node()" mode="set-countas"/>
      </xsl:copy>
   </xsl:template>

<xsl:template match="table[@tabstyle='parts-list']//refint[ancestor::book[contains(@doctype, 'epc')]]" mode="set-countas" priority="5">
      <xsl:copy>
         <xsl:apply-templates select="@*|node()" mode="set-countas"/>
      </xsl:copy>
   </xsl:template>

<xsl:template match="refint[name(id(@refid))='table' and (id(@refid)/ancestor::figure or id(@refid)/ancestor::graphic)]" mode="set-countas" priority="4">
      <xsl:copy>
         <xsl:apply-templates select="@*|node()" mode="set-countas"/>
      </xsl:copy>
   </xsl:template>

<xsl:template match="refint[id(@refid)/self::table]" mode="set-countas" priority="3">
      <xsl:copy>
         <xsl:apply-templates select="@*|node()" mode="set-countas"/>
      </xsl:copy>
   </xsl:template>

<xsl:template match="refint[ancestor::book[contains(@doctype, 'epc')]]" mode="set-countas" priority="2">
      <xsl:copy>
         <xsl:apply-templates select="@*|node()" mode="set-countas"/>
      </xsl:copy>
   </xsl:template>

<xsl:template match="refint[ancestor::book[contains(@doctype, 'cir') or contains(@doctype, 'em')]]" mode="set-countas" priority="1">
      <xsl:copy>
         <xsl:apply-templates select="@*|node()" mode="set-countas"/>
      </xsl:copy>
   </xsl:template>

<xsl:template match="refint" mode="set-countas" priority="0">
      <xsl:copy>
         <xsl:apply-templates select="@*|node()" mode="set-countas"/>
      </xsl:copy>
   </xsl:template>

<xsl:template match="_ufe:refint-link" mode="set-countas" priority="0">
      <xsl:copy>
         <xsl:apply-templates select="@*|node()" mode="set-countas"/>
      </xsl:copy>
   </xsl:template>

<xsl:template match="title-page//rev-date" mode="set-countas" priority="1">
      <xsl:copy>
         <xsl:apply-templates select="@*|node()" mode="set-countas"/>
      </xsl:copy>
   </xsl:template>

<xsl:template match="rev-date" mode="set-countas" priority="0">
      <xsl:copy>
         <xsl:apply-templates select="@*|node()" mode="set-countas"/>
      </xsl:copy>
   </xsl:template>

<xsl:template match="_ufe:revdate-block" mode="set-countas" priority="0">
      <xsl:copy>
         <xsl:apply-templates select="@*|node()" mode="set-countas"/>
      </xsl:copy>
   </xsl:template>

<xsl:template match="revend" mode="set-countas" priority="0">
      <xsl:copy>
         <xsl:apply-templates mode="set-countas" select="@*|node()"> </xsl:apply-templates>
      </xsl:copy>
   </xsl:template>

<xsl:template match="revst" mode="set-countas" priority="0">
      <xsl:copy>
         <xsl:apply-templates mode="set-countas" select="@*|node()"> </xsl:apply-templates>
      </xsl:copy>
   </xsl:template>

<xsl:template match="sb" mode="set-countas" priority="0">
      <xsl:copy>
         <xsl:apply-templates mode="set-countas" select="@*|node()"> </xsl:apply-templates>
      </xsl:copy>
   </xsl:template>

<xsl:template match="sb-item" mode="set-countas" priority="0">
      <xsl:copy>
         <xsl:apply-templates select="@*|node()" mode="set-countas"/>
      </xsl:copy>
   </xsl:template>

<xsl:template match="sblist" mode="set-countas" priority="0">
      <xsl:copy>
         <xsl:apply-templates select="@*|node()" mode="set-countas"/>
      </xsl:copy>
   </xsl:template>

<xsl:template match="pgblk/_ufe:sblist-title" mode="set-countas" priority="2">
      <xsl:copy>
         <xsl:apply-templates select="@*|node()" mode="set-countas"/>
      </xsl:copy>
   </xsl:template>

<xsl:template match="pbfmatr/_ufe:sblist-title" mode="set-countas" priority="1">
      <xsl:copy>
         <xsl:attribute name="_gte:count-as-id">cnt__pbfmatr^-None-.cnt</xsl:attribute>
         <xsl:apply-templates select="@*|node()" mode="set-countas"/>
      </xsl:copy>
   </xsl:template>

<xsl:template match="_ufe:sblist-title" mode="set-countas" priority="0">
      <xsl:copy>
         <xsl:apply-templates select="@*|node()" mode="set-countas"/>
      </xsl:copy>
   </xsl:template>

<xsl:template match="section" mode="set-countas" priority="0">
      <xsl:copy>
         <xsl:apply-templates select="@*|node()" mode="set-countas"/>
      </xsl:copy>
   </xsl:template>

<xsl:template match="sin" mode="set-countas" priority="0">
      <xsl:copy>
         <xsl:apply-templates select="@*|node()" mode="set-countas"/>
      </xsl:copy>
   </xsl:template>

<xsl:template match="source-item" mode="set-countas" priority="0">
      <xsl:copy>
         <xsl:apply-templates select="@*|node()" mode="set-countas"/>
      </xsl:copy>
   </xsl:template>

<xsl:template match="pgblk/_ufe:spblist-title" mode="set-countas" priority="2">
      <xsl:copy>
         <xsl:apply-templates select="@*|node()" mode="set-countas"/>
      </xsl:copy>
   </xsl:template>

<xsl:template match="pbfmatr/_ufe:spblist-title" mode="set-countas" priority="1">
      <xsl:copy>
         <xsl:attribute name="_gte:count-as-id">cnt__pbfmatr^-None-.cnt</xsl:attribute>
         <xsl:apply-templates select="@*|node()" mode="set-countas"/>
      </xsl:copy>
   </xsl:template>

<xsl:template match="_ufe:spblist-title" mode="set-countas" priority="0">
      <xsl:copy>
         <xsl:apply-templates select="@*|node()" mode="set-countas"/>
      </xsl:copy>
   </xsl:template>

<xsl:template match="spec-tool-head" mode="set-countas" priority="0">
      <xsl:copy>
         <xsl:apply-templates select="@*|node()" mode="set-countas"/>
      </xsl:copy>
   </xsl:template>

<xsl:template match="spec-tool-row" mode="set-countas" priority="0">
      <xsl:copy>
         <xsl:apply-templates select="@*|node()" mode="set-countas"/>
      </xsl:copy>
   </xsl:template>

<xsl:template match="spec-tool-table" mode="set-countas" priority="0">
      <xsl:copy>
         <xsl:apply-templates select="@*|node()" mode="set-countas"/>
      </xsl:copy>
   </xsl:template>

<xsl:template match="pgblk/_ufe:spectools-title" mode="set-countas" priority="5">
      <xsl:copy>
         <xsl:apply-templates select="@*|node()" mode="set-countas"/>
      </xsl:copy>
   </xsl:template>

<xsl:template match="pbfmatr/_ufe:spectools-title" mode="set-countas" priority="4">
      <xsl:copy>
         <xsl:attribute name="_gte:count-as-id">cnt__pbfmatr^-None-.cnt</xsl:attribute>
         <xsl:apply-templates select="@*|node()" mode="set-countas"/>
      </xsl:copy>
   </xsl:template>

<xsl:template match="pwcspblist/_ufe:spectools-title" mode="set-countas" priority="3">
      <xsl:copy>
         <xsl:apply-templates select="@*|node()" mode="set-countas"/>
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

<xsl:template match="_ufe:spectools-title" mode="set-countas" priority="0">
      <xsl:copy>
         <xsl:apply-templates select="@*|node()" mode="set-countas"/>
      </xsl:copy>
   </xsl:template>

<xsl:template match="sqrt" mode="set-countas" priority="0">
      <xsl:copy>
         <xsl:apply-templates select="@*|node()" mode="set-countas"/>
      </xsl:copy>
   </xsl:template>

<xsl:template match="state" mode="set-countas" priority="0">
      <xsl:copy>
         <xsl:apply-templates select="@*|node()" mode="set-countas"/>
      </xsl:copy>
   </xsl:template>

<xsl:template match="sub" mode="set-countas" priority="0">
      <xsl:copy>
         <xsl:apply-templates select="@*|node()" mode="set-countas"/>
      </xsl:copy>
   </xsl:template>

<xsl:template match="subject" mode="set-countas" priority="0">
      <xsl:copy>
         <xsl:apply-templates select="@*|node()" mode="set-countas"/>
      </xsl:copy>
   </xsl:template>

<xsl:template match="subpara/subpara/subpara/subpara/subpara[title and ancestor::subpara[not(title)]]" mode="set-countas" priority="15">
      <xsl:copy>
         <xsl:apply-templates select="@*|node()" mode="set-countas"/>
      </xsl:copy>
   </xsl:template>

<xsl:template match="subpara/subpara/subpara/subpara/subpara[not(title) and ancestor::subpara[title]]" mode="set-countas" priority="14">
      <xsl:copy>
         <xsl:apply-templates select="@*|node()" mode="set-countas"/>
      </xsl:copy>
   </xsl:template>

<xsl:template match="subpara/subpara/subpara/subpara/subpara[not(title)]" mode="set-countas" priority="13">
      <xsl:copy>
         <xsl:apply-templates select="@*|node()" mode="set-countas"/>
      </xsl:copy>
   </xsl:template>

<xsl:template match="subpara/subpara/subpara/subpara[title and ancestor::subpara[not(title)]]" mode="set-countas" priority="12">
      <xsl:copy>
         <xsl:apply-templates select="@*|node()" mode="set-countas"/>
      </xsl:copy>
   </xsl:template>

<xsl:template match="subpara/subpara/subpara/subpara[not(title) and ancestor::subpara[title]]" mode="set-countas" priority="11">
      <xsl:copy>
         <xsl:apply-templates select="@*|node()" mode="set-countas"/>
      </xsl:copy>
   </xsl:template>

<xsl:template match="subpara/subpara/subpara/subpara[not(title)]" mode="set-countas" priority="10">
      <xsl:copy>
         <xsl:apply-templates select="@*|node()" mode="set-countas"/>
      </xsl:copy>
   </xsl:template>

<xsl:template match="subpara/subpara/subpara[title and ancestor::subpara[not(title)]]" mode="set-countas" priority="9">
      <xsl:copy>
         <xsl:apply-templates select="@*|node()" mode="set-countas"/>
      </xsl:copy>
   </xsl:template>

<xsl:template match="subpara/subpara/subpara[not(title) and ancestor::subpara[title]]" mode="set-countas" priority="8">
      <xsl:copy>
         <xsl:apply-templates select="@*|node()" mode="set-countas"/>
      </xsl:copy>
   </xsl:template>

<xsl:template match="subpara/subpara/subpara[not(title)]" mode="set-countas" priority="7">
      <xsl:copy>
         <xsl:apply-templates select="@*|node()" mode="set-countas"/>
      </xsl:copy>
   </xsl:template>

<xsl:template match="page-block[@pb-name='intro']//n-para/subpara[child::title]" mode="set-countas" priority="6">
      <xsl:copy>
         <xsl:apply-templates select="@*|node()" mode="set-countas"/>
      </xsl:copy>
   </xsl:template>

<xsl:template match="page-block[@pb-name='intro']//n-para/subpara" mode="set-countas" priority="5">
      <xsl:copy>
         <xsl:apply-templates select="@*|node()" mode="set-countas"/>
      </xsl:copy>
   </xsl:template>

<xsl:template match="subpara/subpara[title and ancestor::subpara[not(title)]]" mode="set-countas" priority="4">
      <xsl:copy>
         <xsl:apply-templates select="@*|node()" mode="set-countas"/>
      </xsl:copy>
   </xsl:template>

<xsl:template match="subpara/subpara[not(title) and ancestor::subpara[title]]" mode="set-countas" priority="3">
      <xsl:copy>
         <xsl:apply-templates select="@*|node()" mode="set-countas"/>
      </xsl:copy>
   </xsl:template>

<xsl:template match="subpara/subpara[not(title)]" mode="set-countas" priority="2">
      <xsl:copy>
         <xsl:apply-templates select="@*|node()" mode="set-countas"/>
      </xsl:copy>
   </xsl:template>

<xsl:template match="subpara[not(title)]" mode="set-countas" priority="1">
      <xsl:copy>
         <xsl:apply-templates select="@*|node()" mode="set-countas"/>
      </xsl:copy>
   </xsl:template>

<xsl:template match="subpara" mode="set-countas" priority="0">
      <xsl:copy>
         <xsl:apply-templates select="@*|node()" mode="set-countas"/>
      </xsl:copy>
   </xsl:template>

<xsl:template match="sup" mode="set-countas" priority="0">
      <xsl:copy>
         <xsl:apply-templates select="@*|node()" mode="set-countas"/>
      </xsl:copy>
   </xsl:template>

<xsl:template match="pgblk/_ufe:supplier-list-title" mode="set-countas" priority="3">
      <xsl:copy>
         <xsl:apply-templates select="@*|node()" mode="set-countas"/>
      </xsl:copy>
   </xsl:template>

<xsl:template match="pbfmatr/_ufe:supplier-list-title" mode="set-countas" priority="2">
      <xsl:copy>
         <xsl:attribute name="_gte:count-as-id">cnt__pbfmatr^-None-.cnt</xsl:attribute>
         <xsl:apply-templates select="@*|node()" mode="set-countas"/>
      </xsl:copy>
   </xsl:template>

<xsl:template match="pwcspblist/_ufe:supplier-list-title" mode="set-countas" priority="1">
      <xsl:copy>
         <xsl:apply-templates select="@*|node()" mode="set-countas"/>
      </xsl:copy>
   </xsl:template>

<xsl:template match="_ufe:supplier-list-title" mode="set-countas" priority="0">
      <xsl:copy>
         <xsl:apply-templates select="@*|node()" mode="set-countas"/>
      </xsl:copy>
   </xsl:template>

<xsl:template match="table[@display='expand']" mode="set-countas" priority="13">
      <xsl:copy>
         <xsl:apply-templates select="@*|node()" mode="set-countas"/>
      </xsl:copy>
   </xsl:template>

<xsl:template match="table[not(title) and not(@tabstyle='frac')]" mode="set-countas" priority="12">
      <xsl:copy>
         <xsl:apply-templates select="@*|node()" mode="set-countas"/>
      </xsl:copy>
   </xsl:template>

<xsl:template match="sheet/gdesc/table" mode="set-countas" priority="7">
      <xsl:copy>
         <xsl:apply-templates mode="set-countas" select="@*|node()"> </xsl:apply-templates>
      </xsl:copy>
   </xsl:template>

<xsl:template match="highlights/table" mode="set-countas" priority="10">
      <xsl:copy>
         <xsl:apply-templates select="@*|node()" mode="set-countas"/>
      </xsl:copy>
   </xsl:template>

<xsl:template match="figure/table" mode="set-countas" priority="6">
      <xsl:copy>
         <xsl:apply-templates mode="set-countas" select="@*|node()"> </xsl:apply-templates>
      </xsl:copy>
   </xsl:template>

<xsl:template match="mfmatr//table[title]" mode="set-countas" priority="8">
      <xsl:copy>
         <xsl:apply-templates mode="set-countas" select="@*|node()"/>
      </xsl:copy>
   </xsl:template>

<xsl:template match="mfmatr//table" mode="set-countas" priority="7">
      <xsl:copy>
         <xsl:apply-templates select="@*|node()" mode="set-countas"/>
      </xsl:copy>
   </xsl:template>

<xsl:template match="table[@tabstyle='eqn' and @display='inline']" mode="set-countas" priority="5">
      <xsl:copy>
         <xsl:apply-templates mode="set-countas" select="@*|node()"/>
      </xsl:copy>
   </xsl:template>

<xsl:template match="table[@tabstyle='IPCDET']" mode="set-countas" priority="5">
      <xsl:copy>
         <xsl:apply-templates select="@*|node()" mode="set-countas"/>
      </xsl:copy>
   </xsl:template>

<xsl:template match="table[@tabstyle='frac' and parent::item]" mode="set-countas" priority="3">
      <xsl:copy>
         <xsl:apply-templates mode="set-countas" select="@*|node()"/>
      </xsl:copy>
   </xsl:template>

<xsl:template match="table[@tabstyle='frac' and parent::step1 or @tabstyle='frac' and parent::step2 or @tabstyle='frac' and parent::step3 or @tabstyle='frac' and parent::step4 or @tabstyle='frac' and parent::step5]" mode="set-countas" priority="1">
      <xsl:copy>
         <xsl:apply-templates mode="set-countas" select="@*|node()"/>
      </xsl:copy>
   </xsl:template>

<xsl:template match="table[@tabstyle='frac']" mode="set-countas" priority="3">
      <xsl:copy>
         <xsl:apply-templates mode="set-countas" select="@*|node()"/>
      </xsl:copy>
   </xsl:template>

<xsl:template match="table[@tabstyle='eqn']" mode="set-countas" priority="1">
      <xsl:copy>
         <xsl:apply-templates select="@*|node()" mode="set-countas"/>
      </xsl:copy>
   </xsl:template>

<xsl:template match="table" mode="set-countas" priority="0">
      <xsl:copy>
         <xsl:apply-templates mode="set-countas" select="@*|node()"> </xsl:apply-templates>
      </xsl:copy>
   </xsl:template>

<xsl:template match="_ufe:task-postspace" mode="set-countas" priority="0">
      <xsl:copy>
         <xsl:apply-templates select="@*|node()" mode="set-countas"/>
      </xsl:copy>
   </xsl:template>

<xsl:template match="pgblk/_ufe:task-title" mode="set-countas" priority="3">
      <xsl:copy>
         <xsl:apply-templates select="@*|node()" mode="set-countas"/>
      </xsl:copy>
   </xsl:template>

<xsl:template match="pbfmatr/_ufe:task-title" mode="set-countas" priority="2">
      <xsl:copy>
         <xsl:attribute name="_gte:count-as-id">cnt__pbfmatr^-None-.cnt</xsl:attribute>
         <xsl:apply-templates select="@*|node()" mode="set-countas"/>
      </xsl:copy>
   </xsl:template>

<xsl:template match="pbfmatr//_ufe:task-title" mode="set-countas" priority="1">
      <xsl:copy>
         <xsl:attribute name="_gte:count-as-id">task</xsl:attribute>
         <xsl:apply-templates select="@*|node()" mode="set-countas"/>
      </xsl:copy>
   </xsl:template>

<xsl:template match="_ufe:task-title" mode="set-countas" priority="0">
      <xsl:copy>
         <xsl:apply-templates select="@*|node()" mode="set-countas"/>
      </xsl:copy>
   </xsl:template>

<xsl:template match="address/tel[1]" mode="set-countas" priority="2">
      <xsl:copy>
         <xsl:apply-templates select="@*|node()" mode="set-countas"/>
      </xsl:copy>
   </xsl:template>

<xsl:template match="address/tel[position()&gt;1]" mode="set-countas" priority="1">
      <xsl:copy>
         <xsl:apply-templates select="@*|node()" mode="set-countas"/>
      </xsl:copy>
   </xsl:template>

<xsl:template match="tel" mode="set-countas" priority="0">
      <xsl:copy>
         <xsl:apply-templates select="@*|node()" mode="set-countas"/>
      </xsl:copy>
   </xsl:template>

<xsl:template match="pgblk/_ufe:temp-rev-title" mode="set-countas" priority="2">
      <xsl:copy>
         <xsl:apply-templates select="@*|node()" mode="set-countas"/>
      </xsl:copy>
   </xsl:template>

<xsl:template match="pbfmatr/_ufe:temp-rev-title" mode="set-countas" priority="1">
      <xsl:copy>
         <xsl:attribute name="_gte:count-as-id">cnt__pbfmatr^-None-.cnt</xsl:attribute>
         <xsl:apply-templates select="@*|node()" mode="set-countas"/>
      </xsl:copy>
   </xsl:template>

<xsl:template match="_ufe:temp-rev-title" mode="set-countas" priority="0">
      <xsl:copy>
         <xsl:apply-templates select="@*|node()" mode="set-countas"/>
      </xsl:copy>
   </xsl:template>

<xsl:template match="deflist/term" mode="set-countas" priority="1">
      <xsl:copy>
         <xsl:apply-templates select="@*|node()" mode="set-countas"/>
      </xsl:copy>
   </xsl:template>

<xsl:template match="term" mode="set-countas" priority="0">
      <xsl:copy>
         <xsl:apply-templates select="@*|node()" mode="set-countas"/>
      </xsl:copy>
   </xsl:template>

<xsl:template match="subpara/subpara/subpara/subpara/subpara/title" mode="set-countas" priority="72">
      <xsl:copy>
         <xsl:apply-templates select="@*|node()" mode="set-countas"/>
      </xsl:copy>
   </xsl:template>

<xsl:template match="subpara/subpara/subpara/subpara/title" mode="set-countas" priority="71">
      <xsl:copy>
         <xsl:apply-templates select="@*|node()" mode="set-countas"/>
      </xsl:copy>
   </xsl:template>

<xsl:template match="subpara/subpara/subpara/title" mode="set-countas" priority="70">
      <xsl:copy>
         <xsl:apply-templates select="@*|node()" mode="set-countas"/>
      </xsl:copy>
   </xsl:template>

<xsl:template match="book[contains(@doctype, 'epc')]/frontmatter//graphic/title" mode="set-countas" priority="69">
      <xsl:copy>
         <xsl:attribute name="_gte:count-as-id">cnt__graphic^frontmatter.cnt</xsl:attribute>
         <xsl:apply-templates select="@*|node()" mode="set-countas"/>
      </xsl:copy>
   </xsl:template>

<xsl:template match="book[contains(@doctype, 'ipc')]/frontmatter//figure/title" mode="set-countas" priority="68">
      <xsl:copy>
         <xsl:attribute name="_gte:count-as-id">cnt__figure.xcnt</xsl:attribute>
         <xsl:apply-templates select="@*|node()" mode="set-countas"/>
      </xsl:copy>
   </xsl:template>

<xsl:template match="ata-page-block//task/graphic/title" mode="set-countas" priority="67">
      <xsl:copy>
         <xsl:choose>
            <xsl:when test="not(number(ancestor::pgblk/@pgblknbr)&gt;0 and number(ancestor::pgblk/@pgblknbr)&lt;=13 and ancestor::task/@confltr!='') and not(number(ancestor::pgblk/@pgblknbr)&gt;0 and number(ancestor::pgblk/@pgblknbr)&lt;=13 and ancestor::task/@varnbr!='') and not(number(ancestor::pgblk/@pgblknbr)&gt;0 and number(ancestor::pgblk/@pgblknbr)&lt;=13) and not(ancestor::task/@confltr!='') and not(ancestor::task/@varnbr!='')">
               <xsl:attribute name="_gte:count-as-id">cnt__graphic^ata-page-block.cnt</xsl:attribute>
            </xsl:when>
            <xsl:when test="not(number(ancestor::pgblk/@pgblknbr)&gt;0 and number(ancestor::pgblk/@pgblknbr)&lt;=13 and ancestor::task/@confltr!='') and not(number(ancestor::pgblk/@pgblknbr)&gt;0 and number(ancestor::pgblk/@pgblknbr)&lt;=13 and ancestor::task/@varnbr!='') and not(number(ancestor::pgblk/@pgblknbr)&gt;0 and number(ancestor::pgblk/@pgblknbr)&lt;=13) and not(ancestor::task/@confltr!='') and (ancestor::task/@varnbr!='')">
               <xsl:attribute name="_gte:count-as-id">cnt__graphic^ata-page-block.cnt</xsl:attribute>
            </xsl:when>
            <xsl:when test="not(number(ancestor::pgblk/@pgblknbr)&gt;0 and number(ancestor::pgblk/@pgblknbr)&lt;=13 and ancestor::task/@confltr!='') and not(number(ancestor::pgblk/@pgblknbr)&gt;0 and number(ancestor::pgblk/@pgblknbr)&lt;=13 and ancestor::task/@varnbr!='') and not(number(ancestor::pgblk/@pgblknbr)&gt;0 and number(ancestor::pgblk/@pgblknbr)&lt;=13) and (ancestor::task/@confltr!='')">
               <xsl:attribute name="_gte:count-as-id">cnt__graphic^ata-page-block.cnt</xsl:attribute>
            </xsl:when>
            <xsl:when test="not(number(ancestor::pgblk/@pgblknbr)&gt;0 and number(ancestor::pgblk/@pgblknbr)&lt;=13 and ancestor::task/@confltr!='') and not(number(ancestor::pgblk/@pgblknbr)&gt;0 and number(ancestor::pgblk/@pgblknbr)&lt;=13 and ancestor::task/@varnbr!='') and (number(ancestor::pgblk/@pgblknbr)&gt;0 and number(ancestor::pgblk/@pgblknbr)&lt;=13)">
               <xsl:attribute name="_gte:count-as-id">cnt__graphic^ata-page-block.cnt</xsl:attribute>
            </xsl:when>
            <xsl:when test="not(number(ancestor::pgblk/@pgblknbr)&gt;0 and number(ancestor::pgblk/@pgblknbr)&lt;=13 and ancestor::task/@confltr!='') and (number(ancestor::pgblk/@pgblknbr)&gt;0 and number(ancestor::pgblk/@pgblknbr)&lt;=13 and ancestor::task/@varnbr!='')">
               <xsl:attribute name="_gte:count-as-id">cnt__graphic^ata-page-block.cnt</xsl:attribute>
            </xsl:when>
            <xsl:when test="number(ancestor::pgblk/@pgblknbr)&gt;0 and number(ancestor::pgblk/@pgblknbr)&lt;=13 and ancestor::task/@confltr!=''">
               <xsl:attribute name="_gte:count-as-id">cnt__graphic^ata-page-block.cnt</xsl:attribute>
            </xsl:when>
            <xsl:when test="true()"><!--This is the "otherwise" clause, but there may be no when's--><!--We emit this even though we do nothing here to avoid a possible empty xsl:choose--></xsl:when>
         </xsl:choose>
         <xsl:apply-templates select="@*|node()" mode="set-countas"/>
      </xsl:copy>
   </xsl:template>

<xsl:template match="page-block//task/graphic/title" mode="set-countas" priority="66">
      <xsl:copy>
         <xsl:choose>
            <xsl:when test="not(number(ancestor::pgblk/@pgblknbr)&gt;0 and number(ancestor::pgblk/@pgblknbr)&lt;=13 and ancestor::task/@confltr!='') and not(number(ancestor::pgblk/@pgblknbr)&gt;0 and number(ancestor::pgblk/@pgblknbr)&lt;=13 and ancestor::task/@varnbr!='') and not(number(ancestor::pgblk/@pgblknbr)&gt;0 and number(ancestor::pgblk/@pgblknbr)&lt;=13) and not(ancestor::task/@confltr!='') and not(ancestor::task/@varnbr!='')">
               <xsl:attribute name="_gte:count-as-id">cnt__graphic^page-block.cnt</xsl:attribute>
            </xsl:when>
            <xsl:when test="not(number(ancestor::pgblk/@pgblknbr)&gt;0 and number(ancestor::pgblk/@pgblknbr)&lt;=13 and ancestor::task/@confltr!='') and not(number(ancestor::pgblk/@pgblknbr)&gt;0 and number(ancestor::pgblk/@pgblknbr)&lt;=13 and ancestor::task/@varnbr!='') and not(number(ancestor::pgblk/@pgblknbr)&gt;0 and number(ancestor::pgblk/@pgblknbr)&lt;=13) and not(ancestor::task/@confltr!='') and (ancestor::task/@varnbr!='')">
               <xsl:attribute name="_gte:count-as-id">cnt__graphic^page-block.cnt</xsl:attribute>
            </xsl:when>
            <xsl:when test="not(number(ancestor::pgblk/@pgblknbr)&gt;0 and number(ancestor::pgblk/@pgblknbr)&lt;=13 and ancestor::task/@confltr!='') and not(number(ancestor::pgblk/@pgblknbr)&gt;0 and number(ancestor::pgblk/@pgblknbr)&lt;=13 and ancestor::task/@varnbr!='') and not(number(ancestor::pgblk/@pgblknbr)&gt;0 and number(ancestor::pgblk/@pgblknbr)&lt;=13) and (ancestor::task/@confltr!='')">
               <xsl:attribute name="_gte:count-as-id">cnt__graphic^page-block.cnt</xsl:attribute>
            </xsl:when>
            <xsl:when test="not(number(ancestor::pgblk/@pgblknbr)&gt;0 and number(ancestor::pgblk/@pgblknbr)&lt;=13 and ancestor::task/@confltr!='') and not(number(ancestor::pgblk/@pgblknbr)&gt;0 and number(ancestor::pgblk/@pgblknbr)&lt;=13 and ancestor::task/@varnbr!='') and (number(ancestor::pgblk/@pgblknbr)&gt;0 and number(ancestor::pgblk/@pgblknbr)&lt;=13)">
               <xsl:attribute name="_gte:count-as-id">cnt__graphic^page-block.cnt</xsl:attribute>
            </xsl:when>
            <xsl:when test="not(number(ancestor::pgblk/@pgblknbr)&gt;0 and number(ancestor::pgblk/@pgblknbr)&lt;=13 and ancestor::task/@confltr!='') and (number(ancestor::pgblk/@pgblknbr)&gt;0 and number(ancestor::pgblk/@pgblknbr)&lt;=13 and ancestor::task/@varnbr!='')">
               <xsl:attribute name="_gte:count-as-id">cnt__graphic^page-block.cnt</xsl:attribute>
            </xsl:when>
            <xsl:when test="number(ancestor::pgblk/@pgblknbr)&gt;0 and number(ancestor::pgblk/@pgblknbr)&lt;=13 and ancestor::task/@confltr!=''">
               <xsl:attribute name="_gte:count-as-id">cnt__graphic^page-block.cnt</xsl:attribute>
            </xsl:when>
            <xsl:when test="true()"><!--This is the "otherwise" clause, but there may be no when's--><!--We emit this even though we do nothing here to avoid a possible empty xsl:choose--></xsl:when>
         </xsl:choose>
         <xsl:apply-templates select="@*|node()" mode="set-countas"/>
      </xsl:copy>
   </xsl:template>

<xsl:template match="module[@module-name='Airworthiness_Limits']/pgblk/title" mode="set-countas" priority="65">
      <xsl:copy>
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

<xsl:template match="mm-fits/subpara/title" mode="set-countas" priority="62">
      <xsl:copy>
         <xsl:attribute name="_gte:count-as-id">cnt__subpara^mm-fits.cnt</xsl:attribute>
         <xsl:apply-templates select="@*|node()" mode="set-countas"/>
      </xsl:copy>
   </xsl:template>

<xsl:template match="prcitem4/prcitem/title" mode="set-countas" priority="60">
      <xsl:copy>
         <xsl:attribute name="_gte:count-as-id">cnt__prcitem^prclist4.cnt</xsl:attribute>
         <xsl:apply-templates mode="set-countas" select="@*|node()"> </xsl:apply-templates>
      </xsl:copy>
   </xsl:template>

<xsl:template match="prcitem3/prcitem/title" mode="set-countas" priority="60">
      <xsl:copy>
         <xsl:attribute name="_gte:count-as-id">cnt__prcitem^prclist3.cnt</xsl:attribute>
         <xsl:apply-templates select="@*|node()" mode="set-countas"/>
      </xsl:copy>
   </xsl:template>

<xsl:template match="prcitem2/prcitem/title" mode="set-countas" priority="59">
      <xsl:copy>
         <xsl:attribute name="_gte:count-as-id">cnt__prcitem^prclist2.cnt</xsl:attribute>
         <xsl:apply-templates select="@*|node()" mode="set-countas"/>
      </xsl:copy>
   </xsl:template>

<xsl:template match="prcitem1/prcitem/title" mode="set-countas" priority="55">
      <xsl:copy>
         <xsl:attribute name="_gte:count-as-id">cnt__prcitem^prclist1.cnt</xsl:attribute>
         <xsl:apply-templates mode="set-countas" select="@*|node()"> </xsl:apply-templates>
      </xsl:copy>
   </xsl:template>

<xsl:template match="subpara/subpara/title" mode="set-countas" priority="57">
      <xsl:copy>
         <xsl:apply-templates select="@*|node()" mode="set-countas"/>
      </xsl:copy>
   </xsl:template>

<xsl:template match="page-block[@pb-name='ni']//mfmatr/title" mode="set-countas" priority="56">
      <xsl:copy>
         <xsl:apply-templates select="@*|node()" mode="set-countas"/>
      </xsl:copy>
   </xsl:template>

<xsl:template match="page-block[@pb-name='record-of-revisions']//n-para/title" mode="set-countas" priority="55">
      <xsl:copy>
         <xsl:apply-templates select="@*|node()" mode="set-countas"/>
      </xsl:copy>
   </xsl:template>

<xsl:template match="book[contains(@doctype, 'epc')]//figure/title" mode="set-countas" priority="54">
      <xsl:copy>
         <xsl:apply-templates select="@*|node()" mode="set-countas"/>
      </xsl:copy>
   </xsl:template>

<xsl:template match="book[contains(@doctype, 'epc')]//graphic/title" mode="set-countas" priority="53">
      <xsl:copy>
         <xsl:apply-templates select="@*|node()" mode="set-countas"/>
      </xsl:copy>
   </xsl:template>

<xsl:template match="book[contains(@doctype, 'ipc')]//figure/title" mode="set-countas" priority="52">
      <xsl:copy>
         <xsl:apply-templates select="@*|node()" mode="set-countas"/>
      </xsl:copy>
   </xsl:template>

<xsl:template match="task//table/title" mode="set-countas" priority="51">
      <xsl:copy>
         <xsl:choose>
            <xsl:when test="not(number(ancestor::pgblk/@pgblknbr)&gt;0 and number(ancestor::pgblk/@pgblknbr)&lt;=13 and ancestor::task/@confltr!='' and ../@display='expand') and not(number(ancestor::pgblk/@pgblknbr)&gt;0 and number(ancestor::pgblk/@pgblknbr)&lt;=13 and ancestor::task/@varnbr!='' and ../@display='expand') and not(number(ancestor::pgblk/@pgblknbr)&gt;0 and number(ancestor::pgblk/@pgblknbr)&lt;=13 and ../@display='expand') and not(number(ancestor::pgblk/@pgblknbr)&gt;0 and number(ancestor::pgblk/@pgblknbr)&lt;=13) and not(ancestor::task/@confltr!='' and ../@display='expand') and not(ancestor::task/@varnbr!='' and ../@display='expand') and not(../@display='expand')">
               <xsl:attribute name="_gte:count-as-id">cnt__table^pgblk.cnt</xsl:attribute>
            </xsl:when>
            <xsl:when test="not(number(ancestor::pgblk/@pgblknbr)&gt;0 and number(ancestor::pgblk/@pgblknbr)&lt;=13 and ancestor::task/@confltr!='' and ../@display='expand') and not(number(ancestor::pgblk/@pgblknbr)&gt;0 and number(ancestor::pgblk/@pgblknbr)&lt;=13 and ancestor::task/@varnbr!='' and ../@display='expand') and not(number(ancestor::pgblk/@pgblknbr)&gt;0 and number(ancestor::pgblk/@pgblknbr)&lt;=13 and ../@display='expand') and not(number(ancestor::pgblk/@pgblknbr)&gt;0 and number(ancestor::pgblk/@pgblknbr)&lt;=13) and not(ancestor::task/@confltr!='' and ../@display='expand') and not(ancestor::task/@varnbr!='' and ../@display='expand') and (../@display='expand')">
               <xsl:attribute name="_gte:count-as-id">cnt__table^pgblk.cnt</xsl:attribute>
            </xsl:when>
            <xsl:when test="not(number(ancestor::pgblk/@pgblknbr)&gt;0 and number(ancestor::pgblk/@pgblknbr)&lt;=13 and ancestor::task/@confltr!='' and ../@display='expand') and not(number(ancestor::pgblk/@pgblknbr)&gt;0 and number(ancestor::pgblk/@pgblknbr)&lt;=13 and ancestor::task/@varnbr!='' and ../@display='expand') and not(number(ancestor::pgblk/@pgblknbr)&gt;0 and number(ancestor::pgblk/@pgblknbr)&lt;=13 and ../@display='expand') and not(number(ancestor::pgblk/@pgblknbr)&gt;0 and number(ancestor::pgblk/@pgblknbr)&lt;=13) and not(ancestor::task/@confltr!='' and ../@display='expand') and (ancestor::task/@varnbr!='' and ../@display='expand')">
               <xsl:attribute name="_gte:count-as-id">cnt__table^pgblk.cnt</xsl:attribute>
            </xsl:when>
            <xsl:when test="not(number(ancestor::pgblk/@pgblknbr)&gt;0 and number(ancestor::pgblk/@pgblknbr)&lt;=13 and ancestor::task/@confltr!='' and ../@display='expand') and not(number(ancestor::pgblk/@pgblknbr)&gt;0 and number(ancestor::pgblk/@pgblknbr)&lt;=13 and ancestor::task/@varnbr!='' and ../@display='expand') and not(number(ancestor::pgblk/@pgblknbr)&gt;0 and number(ancestor::pgblk/@pgblknbr)&lt;=13 and ../@display='expand') and not(number(ancestor::pgblk/@pgblknbr)&gt;0 and number(ancestor::pgblk/@pgblknbr)&lt;=13) and (ancestor::task/@confltr!='' and ../@display='expand')">
               <xsl:attribute name="_gte:count-as-id">cnt__table^pgblk.cnt</xsl:attribute>
            </xsl:when>
            <xsl:when test="not(number(ancestor::pgblk/@pgblknbr)&gt;0 and number(ancestor::pgblk/@pgblknbr)&lt;=13 and ancestor::task/@confltr!='' and ../@display='expand') and not(number(ancestor::pgblk/@pgblknbr)&gt;0 and number(ancestor::pgblk/@pgblknbr)&lt;=13 and ancestor::task/@varnbr!='' and ../@display='expand') and not(number(ancestor::pgblk/@pgblknbr)&gt;0 and number(ancestor::pgblk/@pgblknbr)&lt;=13 and ../@display='expand') and (number(ancestor::pgblk/@pgblknbr)&gt;0 and number(ancestor::pgblk/@pgblknbr)&lt;=13)">
               <xsl:attribute name="_gte:count-as-id">cnt__table^pgblk.cnt</xsl:attribute>
            </xsl:when>
            <xsl:when test="not(number(ancestor::pgblk/@pgblknbr)&gt;0 and number(ancestor::pgblk/@pgblknbr)&lt;=13 and ancestor::task/@confltr!='' and ../@display='expand') and not(number(ancestor::pgblk/@pgblknbr)&gt;0 and number(ancestor::pgblk/@pgblknbr)&lt;=13 and ancestor::task/@varnbr!='' and ../@display='expand') and (number(ancestor::pgblk/@pgblknbr)&gt;0 and number(ancestor::pgblk/@pgblknbr)&lt;=13 and ../@display='expand')">
               <xsl:attribute name="_gte:count-as-id">cnt__table^pgblk.cnt</xsl:attribute>
            </xsl:when>
            <xsl:when test="not(number(ancestor::pgblk/@pgblknbr)&gt;0 and number(ancestor::pgblk/@pgblknbr)&lt;=13 and ancestor::task/@confltr!='' and ../@display='expand') and (number(ancestor::pgblk/@pgblknbr)&gt;0 and number(ancestor::pgblk/@pgblknbr)&lt;=13 and ancestor::task/@varnbr!='' and ../@display='expand')">
               <xsl:attribute name="_gte:count-as-id">cnt__table^pgblk.cnt</xsl:attribute>
            </xsl:when>
            <xsl:when test="number(ancestor::pgblk/@pgblknbr)&gt;0 and number(ancestor::pgblk/@pgblknbr)&lt;=13 and ancestor::task/@confltr!='' and ../@display='expand'">
               <xsl:attribute name="_gte:count-as-id">cnt__table^pgblk.cnt</xsl:attribute>
            </xsl:when>
            <xsl:when test="true()"><!--This is the "otherwise" clause, but there may be no when's--><!--We emit this even though we do nothing here to avoid a possible empty xsl:choose--></xsl:when>
         </xsl:choose>
         <xsl:apply-templates select="@*|node()" mode="set-countas"/>
      </xsl:copy>
   </xsl:template>

<xsl:template match="page-block//graphic/title" mode="set-countas" priority="50">
      <xsl:copy>
         <xsl:choose>
            <xsl:when test="not(number(ancestor::pgblk/@pgblknbr)&gt;0 and number(ancestor::pgblk/@pgblknbr)&lt;=13)">
               <xsl:attribute name="_gte:count-as-id">cnt__graphic^page-block.cnt</xsl:attribute>
            </xsl:when>
            <xsl:when test="number(ancestor::pgblk/@pgblknbr)&gt;0 and number(ancestor::pgblk/@pgblknbr)&lt;=13">
               <xsl:attribute name="_gte:count-as-id">cnt__graphic^page-block.cnt</xsl:attribute>
            </xsl:when>
            <xsl:when test="true()"><!--This is the "otherwise" clause, but there may be no when's--><!--We emit this even though we do nothing here to avoid a possible empty xsl:choose--></xsl:when>
         </xsl:choose>
         <xsl:apply-templates select="@*|node()" mode="set-countas"/>
      </xsl:copy>
   </xsl:template>

<xsl:template match="ata-page-block//graphic/title" mode="set-countas" priority="49">
      <xsl:copy>
         <xsl:choose>
            <xsl:when test="not(number(ancestor::pgblk/@pgblknbr)&gt;0 and number(ancestor::pgblk/@pgblknbr)&lt;=13)">
               <xsl:attribute name="_gte:count-as-id">cnt__graphic^ata-page-block.cnt</xsl:attribute>
            </xsl:when>
            <xsl:when test="number(ancestor::pgblk/@pgblknbr)&gt;0 and number(ancestor::pgblk/@pgblknbr)&lt;=13">
               <xsl:attribute name="_gte:count-as-id">cnt__graphic^ata-page-block.cnt</xsl:attribute>
            </xsl:when>
            <xsl:when test="true()"><!--This is the "otherwise" clause, but there may be no when's--><!--We emit this even though we do nothing here to avoid a possible empty xsl:choose--></xsl:when>
         </xsl:choose>
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

<xsl:template match="mfmatr/title" mode="set-countas" priority="42">
      <xsl:copy>
         <xsl:apply-templates select="@*|node()" mode="set-countas"/>
      </xsl:copy>
   </xsl:template>

<xsl:template match="figure/title" mode="set-countas" priority="41">
      <xsl:copy>
         <xsl:choose>
            <xsl:when test="not(ancestor::book[contains(@doctype,'oh')] and ancestor::ata-page-block/@pb-name[.='service']) and not(ancestor::book[contains(@doctype,'oh')] and ancestor::page-block/@pb-name[.='service']) and not(ancestor::ata-page-block/@pb-name[.='00awl' or .='00intro' or .='airlim' or .='awl' or .='awlror' or .='chapsect' or .='consume' or .='d-and-o' or .='frontmatte' or .='howtouse' or .='00howtouse' or .='intro' or .='nut_option' or .='oplimits' or .='sblist' or .='schedchk' or .='spectool' or .='timelim' or .='title-page']) and not(ancestor::page-block/@pb-name[.='00awl' or .='00intro' or .='airlim' or .='awl' or .='awlror' or .='chapsect' or .='consume' or .='d-and-o' or .='frontmatte' or .='howtouse' or .='00howtouse' or .='intro' or .='nut_option' or .='oplimits' or .='sblist' or .='schedchk' or .='spectool' or .='timelim' or .='title-page']) and not(ancestor::ata-page-block/@pb-name[(starts-with(., 'do') and 'do' = translate(., '0123456789', '') and string-length(.) &gt; 2) or (starts-with(., 'in') and 'in' = translate(., '0123456789', '') and string-length(.) &gt; 2) or (starts-with(., 'tl') and 'tl' = translate(., '0123456789', '') and string-length(.) &gt; 2) or .='toolsht' or .='trlist' or .='unschedc' or .='unschedchk']) and not(ancestor::page-block/@pb-name[(starts-with(., 'do') and 'do' = translate(., '0123456789', '') and string-length(.) &gt; 2) or (starts-with(., 'in') and 'in' = translate(., '0123456789', '') and string-length(.) &gt; 2) or (starts-with(., 'tl') and 'tl' = translate(., '0123456789', '') and string-length(.) &gt; 2) or .='toolsht' or .='trlist' or .='unschedc' or .='unschedchk']) and not(ancestor-or-self::ata-page-block[1]/@pb-name and string(ancestor-or-self::ata-page-block[1]/@pb-name)='intro00') and not(ancestor-or-self::page-block[1]/@pb-name and string(ancestor-or-self::page-block[1]/@pb-name)='intro00') and not(ancestor::ata-page-block/@pb-name[starts-with(., 'disassy') or starts-with(., 'fault')]) and not(ancestor::page-block/@pb-name[starts-with(., 'disassy') or starts-with(., 'fault')]) and not(ancestor::book[contains(@doctype,'oh')] and ancestor::ata-page-block/@pb-name[starts-with(., 'clean')]) and not(ancestor::book[contains(@doctype,'oh')] and ancestor::page-block/@pb-name[starts-with(., 'clean')]) and not(ancestor::ata-page-block/@pb-name[starts-with(., 'mainprac')]) and not(ancestor::page-block/@pb-name[starts-with(., 'mainprac')]) and not(ancestor::book[contains(@doctype,'oh')] and ancestor::ata-page-block/@pb-name[starts-with(., 'inspect')]) and not(ancestor::book[contains(@doctype,'oh')] and ancestor::page-block/@pb-name[starts-with(., 'inspect')]) and not(ancestor::ata-page-block/@pb-name[(starts-with(., 'di') and 'di' = translate(., '0123456789', '') and string-length(.) &gt; 2) or starts-with(.,'service')]) and not(ancestor::page-block/@pb-name[(starts-with(., 'di') and 'di' = translate(., '0123456789', '') and string-length(.) &gt; 2) or starts-with(.,'service')]) and not(ancestor::book[contains(@doctype,'oh')] and ancestor::ata-page-block/@pb-name[starts-with(., 'repair')]) and not(ancestor::book[contains(@doctype,'oh')] and ancestor::page-block/@pb-name[starts-with(., 'repair')]) and not(ancestor::book[contains(@doctype,'oh')] and ancestor::ata-page-block/@pb-name[starts-with(., 'test')]) and not(ancestor::book[contains(@doctype,'oh')] and ancestor::page-block/@pb-name[starts-with(., 'test')]) and not(ancestor::ata-page-block/@pb-name[(starts-with(., 'cl') and 'cl' = translate(., '0123456789', '') and string-length(.) &gt; 2) or .='install' or starts-with(.,'rem-inst') or (starts-with(., 'reminst') and 'reminst' = translate(., '0123456789', '') and string-length(.) &gt; 7) or .='remove' or (starts-with(., 'repair') and 'repair' = translate(., '0123456789', '') and string-length(.) &gt; 6)]) and not(ancestor::page-block/@pb-name[(starts-with(., 'cl') and 'cl' = translate(., '0123456789', '') and string-length(.) &gt; 2) or .='install' or starts-with(.,'rem-inst') or (starts-with(., 'reminst') and 'reminst' = translate(., '0123456789', '') and string-length(.) &gt; 7) or .='remove' or (starts-with(., 'repair') and 'repair' = translate(., '0123456789', '') and string-length(.) &gt; 6)]) and not(ancestor::ata-page-block/@pb-name[starts-with(., 'assy') or (starts-with(., 'ic') and 'ic' = translate(., '0123456789', '') and string-length(.) &gt; 2) or (starts-with(., 'te') and 'te' = translate(., '0123456789', '') and string-length(.) &gt; 2) or .='test']) and not(ancestor::page-block/@pb-name[starts-with(., 'assy') or (starts-with(., 'ic') and 'ic' = translate(., '0123456789', '') and string-length(.) &gt; 2) or (starts-with(., 'te') and 'te' = translate(., '0123456789', '') and string-length(.) &gt; 2) or .='test']) and not(ancestor::ata-page-block/@pb-name[.='f-and-c' or starts-with(., 'inspect') or (starts-with(., 're') and 're' = translate(., '0123456789', '') and string-length(.) &gt; 2)]) and not(ancestor::page-block/@pb-name[.='f-and-c' or starts-with(., 'inspect') or (starts-with(., 're') and 're' = translate(., '0123456789', '') and string-length(.) &gt; 2)]) and not(ancestor::ata-page-block/@pb-name[(starts-with(., 'as') and 'as' = translate(., '0123456789', '') and string-length(.) &gt; 2) or starts-with(.,'clean') or (starts-with(., 'test') and 'test' = translate(., '0123456789', '') and string-length(.) &gt; 4)]) and not(ancestor::page-block/@pb-name[(starts-with(., 'as') and 'as' = translate(., '0123456789', '') and string-length(.) &gt; 2) or starts-with(.,'clean') or (starts-with(., 'test') and 'test' = translate(., '0123456789', '') and string-length(.) &gt; 4)]) and not(ancestor::ata-page-block/@pb-name[(starts-with(., 'fc') and 'fc' = translate(., '0123456789', '') and string-length(.) &gt; 2) or starts-with(.,'repair') or .='trouble']) and not(ancestor::page-block/@pb-name[(starts-with(., 'fc') and 'fc' = translate(., '0123456789', '') and string-length(.) &gt; 2) or starts-with(.,'repair') or .='trouble']) and not(ancestor::ata-page-block/@pb-name[starts-with(.,'storage') or (starts-with(., 'to') and 'to' = translate(., '0123456789', '') and string-length(.) &gt; 2)]) and not(ancestor::page-block/@pb-name[starts-with(.,'storage') or (starts-with(., 'to') and 'to' = translate(., '0123456789', '') and string-length(.) &gt; 2)]) and not(ancestor::ata-page-block/@pb-name[.='it-oh' or .='lt-oh']) and (ancestor::page-block/@pb-name[.='it-oh' or .='lt-oh'])">
               <xsl:attribute name="_gte:count-as-id">cnt__figure^page-block.cnt</xsl:attribute>
            </xsl:when>
            <xsl:when test="not(ancestor::book[contains(@doctype,'oh')] and ancestor::ata-page-block/@pb-name[.='service']) and not(ancestor::book[contains(@doctype,'oh')] and ancestor::page-block/@pb-name[.='service']) and not(ancestor::ata-page-block/@pb-name[.='00awl' or .='00intro' or .='airlim' or .='awl' or .='awlror' or .='chapsect' or .='consume' or .='d-and-o' or .='frontmatte' or .='howtouse' or .='00howtouse' or .='intro' or .='nut_option' or .='oplimits' or .='sblist' or .='schedchk' or .='spectool' or .='timelim' or .='title-page']) and not(ancestor::page-block/@pb-name[.='00awl' or .='00intro' or .='airlim' or .='awl' or .='awlror' or .='chapsect' or .='consume' or .='d-and-o' or .='frontmatte' or .='howtouse' or .='00howtouse' or .='intro' or .='nut_option' or .='oplimits' or .='sblist' or .='schedchk' or .='spectool' or .='timelim' or .='title-page']) and not(ancestor::ata-page-block/@pb-name[(starts-with(., 'do') and 'do' = translate(., '0123456789', '') and string-length(.) &gt; 2) or (starts-with(., 'in') and 'in' = translate(., '0123456789', '') and string-length(.) &gt; 2) or (starts-with(., 'tl') and 'tl' = translate(., '0123456789', '') and string-length(.) &gt; 2) or .='toolsht' or .='trlist' or .='unschedc' or .='unschedchk']) and not(ancestor::page-block/@pb-name[(starts-with(., 'do') and 'do' = translate(., '0123456789', '') and string-length(.) &gt; 2) or (starts-with(., 'in') and 'in' = translate(., '0123456789', '') and string-length(.) &gt; 2) or (starts-with(., 'tl') and 'tl' = translate(., '0123456789', '') and string-length(.) &gt; 2) or .='toolsht' or .='trlist' or .='unschedc' or .='unschedchk']) and not(ancestor-or-self::ata-page-block[1]/@pb-name and string(ancestor-or-self::ata-page-block[1]/@pb-name)='intro00') and not(ancestor-or-self::page-block[1]/@pb-name and string(ancestor-or-self::page-block[1]/@pb-name)='intro00') and not(ancestor::ata-page-block/@pb-name[starts-with(., 'disassy') or starts-with(., 'fault')]) and not(ancestor::page-block/@pb-name[starts-with(., 'disassy') or starts-with(., 'fault')]) and not(ancestor::book[contains(@doctype,'oh')] and ancestor::ata-page-block/@pb-name[starts-with(., 'clean')]) and not(ancestor::book[contains(@doctype,'oh')] and ancestor::page-block/@pb-name[starts-with(., 'clean')]) and not(ancestor::ata-page-block/@pb-name[starts-with(., 'mainprac')]) and not(ancestor::page-block/@pb-name[starts-with(., 'mainprac')]) and not(ancestor::book[contains(@doctype,'oh')] and ancestor::ata-page-block/@pb-name[starts-with(., 'inspect')]) and not(ancestor::book[contains(@doctype,'oh')] and ancestor::page-block/@pb-name[starts-with(., 'inspect')]) and not(ancestor::ata-page-block/@pb-name[(starts-with(., 'di') and 'di' = translate(., '0123456789', '') and string-length(.) &gt; 2) or starts-with(.,'service')]) and not(ancestor::page-block/@pb-name[(starts-with(., 'di') and 'di' = translate(., '0123456789', '') and string-length(.) &gt; 2) or starts-with(.,'service')]) and not(ancestor::book[contains(@doctype,'oh')] and ancestor::ata-page-block/@pb-name[starts-with(., 'repair')]) and not(ancestor::book[contains(@doctype,'oh')] and ancestor::page-block/@pb-name[starts-with(., 'repair')]) and not(ancestor::book[contains(@doctype,'oh')] and ancestor::ata-page-block/@pb-name[starts-with(., 'test')]) and not(ancestor::book[contains(@doctype,'oh')] and ancestor::page-block/@pb-name[starts-with(., 'test')]) and not(ancestor::ata-page-block/@pb-name[(starts-with(., 'cl') and 'cl' = translate(., '0123456789', '') and string-length(.) &gt; 2) or .='install' or starts-with(.,'rem-inst') or (starts-with(., 'reminst') and 'reminst' = translate(., '0123456789', '') and string-length(.) &gt; 7) or .='remove' or (starts-with(., 'repair') and 'repair' = translate(., '0123456789', '') and string-length(.) &gt; 6)]) and not(ancestor::page-block/@pb-name[(starts-with(., 'cl') and 'cl' = translate(., '0123456789', '') and string-length(.) &gt; 2) or .='install' or starts-with(.,'rem-inst') or (starts-with(., 'reminst') and 'reminst' = translate(., '0123456789', '') and string-length(.) &gt; 7) or .='remove' or (starts-with(., 'repair') and 'repair' = translate(., '0123456789', '') and string-length(.) &gt; 6)]) and not(ancestor::ata-page-block/@pb-name[starts-with(., 'assy') or (starts-with(., 'ic') and 'ic' = translate(., '0123456789', '') and string-length(.) &gt; 2) or (starts-with(., 'te') and 'te' = translate(., '0123456789', '') and string-length(.) &gt; 2) or .='test']) and not(ancestor::page-block/@pb-name[starts-with(., 'assy') or (starts-with(., 'ic') and 'ic' = translate(., '0123456789', '') and string-length(.) &gt; 2) or (starts-with(., 'te') and 'te' = translate(., '0123456789', '') and string-length(.) &gt; 2) or .='test']) and not(ancestor::ata-page-block/@pb-name[.='f-and-c' or starts-with(., 'inspect') or (starts-with(., 're') and 're' = translate(., '0123456789', '') and string-length(.) &gt; 2)]) and not(ancestor::page-block/@pb-name[.='f-and-c' or starts-with(., 'inspect') or (starts-with(., 're') and 're' = translate(., '0123456789', '') and string-length(.) &gt; 2)]) and not(ancestor::ata-page-block/@pb-name[(starts-with(., 'as') and 'as' = translate(., '0123456789', '') and string-length(.) &gt; 2) or starts-with(.,'clean') or (starts-with(., 'test') and 'test' = translate(., '0123456789', '') and string-length(.) &gt; 4)]) and not(ancestor::page-block/@pb-name[(starts-with(., 'as') and 'as' = translate(., '0123456789', '') and string-length(.) &gt; 2) or starts-with(.,'clean') or (starts-with(., 'test') and 'test' = translate(., '0123456789', '') and string-length(.) &gt; 4)]) and not(ancestor::ata-page-block/@pb-name[(starts-with(., 'fc') and 'fc' = translate(., '0123456789', '') and string-length(.) &gt; 2) or starts-with(.,'repair') or .='trouble']) and not(ancestor::page-block/@pb-name[(starts-with(., 'fc') and 'fc' = translate(., '0123456789', '') and string-length(.) &gt; 2) or starts-with(.,'repair') or .='trouble']) and not(ancestor::ata-page-block/@pb-name[starts-with(.,'storage') or (starts-with(., 'to') and 'to' = translate(., '0123456789', '') and string-length(.) &gt; 2)]) and not(ancestor::page-block/@pb-name[starts-with(.,'storage') or (starts-with(., 'to') and 'to' = translate(., '0123456789', '') and string-length(.) &gt; 2)]) and (ancestor::ata-page-block/@pb-name[.='it-oh' or .='lt-oh'])">
               <xsl:attribute name="_gte:count-as-id">cnt__figure^ata-page-block.cnt</xsl:attribute>
            </xsl:when>
            <xsl:when test="not(ancestor::book[contains(@doctype,'oh')] and ancestor::ata-page-block/@pb-name[.='service']) and not(ancestor::book[contains(@doctype,'oh')] and ancestor::page-block/@pb-name[.='service']) and not(ancestor::ata-page-block/@pb-name[.='00awl' or .='00intro' or .='airlim' or .='awl' or .='awlror' or .='chapsect' or .='consume' or .='d-and-o' or .='frontmatte' or .='howtouse' or .='00howtouse' or .='intro' or .='nut_option' or .='oplimits' or .='sblist' or .='schedchk' or .='spectool' or .='timelim' or .='title-page']) and not(ancestor::page-block/@pb-name[.='00awl' or .='00intro' or .='airlim' or .='awl' or .='awlror' or .='chapsect' or .='consume' or .='d-and-o' or .='frontmatte' or .='howtouse' or .='00howtouse' or .='intro' or .='nut_option' or .='oplimits' or .='sblist' or .='schedchk' or .='spectool' or .='timelim' or .='title-page']) and not(ancestor::ata-page-block/@pb-name[(starts-with(., 'do') and 'do' = translate(., '0123456789', '') and string-length(.) &gt; 2) or (starts-with(., 'in') and 'in' = translate(., '0123456789', '') and string-length(.) &gt; 2) or (starts-with(., 'tl') and 'tl' = translate(., '0123456789', '') and string-length(.) &gt; 2) or .='toolsht' or .='trlist' or .='unschedc' or .='unschedchk']) and not(ancestor::page-block/@pb-name[(starts-with(., 'do') and 'do' = translate(., '0123456789', '') and string-length(.) &gt; 2) or (starts-with(., 'in') and 'in' = translate(., '0123456789', '') and string-length(.) &gt; 2) or (starts-with(., 'tl') and 'tl' = translate(., '0123456789', '') and string-length(.) &gt; 2) or .='toolsht' or .='trlist' or .='unschedc' or .='unschedchk']) and not(ancestor-or-self::ata-page-block[1]/@pb-name and string(ancestor-or-self::ata-page-block[1]/@pb-name)='intro00') and not(ancestor-or-self::page-block[1]/@pb-name and string(ancestor-or-self::page-block[1]/@pb-name)='intro00') and not(ancestor::ata-page-block/@pb-name[starts-with(., 'disassy') or starts-with(., 'fault')]) and not(ancestor::page-block/@pb-name[starts-with(., 'disassy') or starts-with(., 'fault')]) and not(ancestor::book[contains(@doctype,'oh')] and ancestor::ata-page-block/@pb-name[starts-with(., 'clean')]) and not(ancestor::book[contains(@doctype,'oh')] and ancestor::page-block/@pb-name[starts-with(., 'clean')]) and not(ancestor::ata-page-block/@pb-name[starts-with(., 'mainprac')]) and not(ancestor::page-block/@pb-name[starts-with(., 'mainprac')]) and not(ancestor::book[contains(@doctype,'oh')] and ancestor::ata-page-block/@pb-name[starts-with(., 'inspect')]) and not(ancestor::book[contains(@doctype,'oh')] and ancestor::page-block/@pb-name[starts-with(., 'inspect')]) and not(ancestor::ata-page-block/@pb-name[(starts-with(., 'di') and 'di' = translate(., '0123456789', '') and string-length(.) &gt; 2) or starts-with(.,'service')]) and not(ancestor::page-block/@pb-name[(starts-with(., 'di') and 'di' = translate(., '0123456789', '') and string-length(.) &gt; 2) or starts-with(.,'service')]) and not(ancestor::book[contains(@doctype,'oh')] and ancestor::ata-page-block/@pb-name[starts-with(., 'repair')]) and not(ancestor::book[contains(@doctype,'oh')] and ancestor::page-block/@pb-name[starts-with(., 'repair')]) and not(ancestor::book[contains(@doctype,'oh')] and ancestor::ata-page-block/@pb-name[starts-with(., 'test')]) and not(ancestor::book[contains(@doctype,'oh')] and ancestor::page-block/@pb-name[starts-with(., 'test')]) and not(ancestor::ata-page-block/@pb-name[(starts-with(., 'cl') and 'cl' = translate(., '0123456789', '') and string-length(.) &gt; 2) or .='install' or starts-with(.,'rem-inst') or (starts-with(., 'reminst') and 'reminst' = translate(., '0123456789', '') and string-length(.) &gt; 7) or .='remove' or (starts-with(., 'repair') and 'repair' = translate(., '0123456789', '') and string-length(.) &gt; 6)]) and not(ancestor::page-block/@pb-name[(starts-with(., 'cl') and 'cl' = translate(., '0123456789', '') and string-length(.) &gt; 2) or .='install' or starts-with(.,'rem-inst') or (starts-with(., 'reminst') and 'reminst' = translate(., '0123456789', '') and string-length(.) &gt; 7) or .='remove' or (starts-with(., 'repair') and 'repair' = translate(., '0123456789', '') and string-length(.) &gt; 6)]) and not(ancestor::ata-page-block/@pb-name[starts-with(., 'assy') or (starts-with(., 'ic') and 'ic' = translate(., '0123456789', '') and string-length(.) &gt; 2) or (starts-with(., 'te') and 'te' = translate(., '0123456789', '') and string-length(.) &gt; 2) or .='test']) and not(ancestor::page-block/@pb-name[starts-with(., 'assy') or (starts-with(., 'ic') and 'ic' = translate(., '0123456789', '') and string-length(.) &gt; 2) or (starts-with(., 'te') and 'te' = translate(., '0123456789', '') and string-length(.) &gt; 2) or .='test']) and not(ancestor::ata-page-block/@pb-name[.='f-and-c' or starts-with(., 'inspect') or (starts-with(., 're') and 're' = translate(., '0123456789', '') and string-length(.) &gt; 2)]) and not(ancestor::page-block/@pb-name[.='f-and-c' or starts-with(., 'inspect') or (starts-with(., 're') and 're' = translate(., '0123456789', '') and string-length(.) &gt; 2)]) and not(ancestor::ata-page-block/@pb-name[(starts-with(., 'as') and 'as' = translate(., '0123456789', '') and string-length(.) &gt; 2) or starts-with(.,'clean') or (starts-with(., 'test') and 'test' = translate(., '0123456789', '') and string-length(.) &gt; 4)]) and not(ancestor::page-block/@pb-name[(starts-with(., 'as') and 'as' = translate(., '0123456789', '') and string-length(.) &gt; 2) or starts-with(.,'clean') or (starts-with(., 'test') and 'test' = translate(., '0123456789', '') and string-length(.) &gt; 4)]) and not(ancestor::ata-page-block/@pb-name[(starts-with(., 'fc') and 'fc' = translate(., '0123456789', '') and string-length(.) &gt; 2) or starts-with(.,'repair') or .='trouble']) and not(ancestor::page-block/@pb-name[(starts-with(., 'fc') and 'fc' = translate(., '0123456789', '') and string-length(.) &gt; 2) or starts-with(.,'repair') or .='trouble']) and not(ancestor::ata-page-block/@pb-name[starts-with(.,'storage') or (starts-with(., 'to') and 'to' = translate(., '0123456789', '') and string-length(.) &gt; 2)]) and (ancestor::page-block/@pb-name[starts-with(.,'storage') or (starts-with(., 'to') and 'to' = translate(., '0123456789', '') and string-length(.) &gt; 2)])">
               <xsl:attribute name="_gte:count-as-id">cnt__figure^page-block.cnt</xsl:attribute>
            </xsl:when>
            <xsl:when test="not(ancestor::book[contains(@doctype,'oh')] and ancestor::ata-page-block/@pb-name[.='service']) and not(ancestor::book[contains(@doctype,'oh')] and ancestor::page-block/@pb-name[.='service']) and not(ancestor::ata-page-block/@pb-name[.='00awl' or .='00intro' or .='airlim' or .='awl' or .='awlror' or .='chapsect' or .='consume' or .='d-and-o' or .='frontmatte' or .='howtouse' or .='00howtouse' or .='intro' or .='nut_option' or .='oplimits' or .='sblist' or .='schedchk' or .='spectool' or .='timelim' or .='title-page']) and not(ancestor::page-block/@pb-name[.='00awl' or .='00intro' or .='airlim' or .='awl' or .='awlror' or .='chapsect' or .='consume' or .='d-and-o' or .='frontmatte' or .='howtouse' or .='00howtouse' or .='intro' or .='nut_option' or .='oplimits' or .='sblist' or .='schedchk' or .='spectool' or .='timelim' or .='title-page']) and not(ancestor::ata-page-block/@pb-name[(starts-with(., 'do') and 'do' = translate(., '0123456789', '') and string-length(.) &gt; 2) or (starts-with(., 'in') and 'in' = translate(., '0123456789', '') and string-length(.) &gt; 2) or (starts-with(., 'tl') and 'tl' = translate(., '0123456789', '') and string-length(.) &gt; 2) or .='toolsht' or .='trlist' or .='unschedc' or .='unschedchk']) and not(ancestor::page-block/@pb-name[(starts-with(., 'do') and 'do' = translate(., '0123456789', '') and string-length(.) &gt; 2) or (starts-with(., 'in') and 'in' = translate(., '0123456789', '') and string-length(.) &gt; 2) or (starts-with(., 'tl') and 'tl' = translate(., '0123456789', '') and string-length(.) &gt; 2) or .='toolsht' or .='trlist' or .='unschedc' or .='unschedchk']) and not(ancestor-or-self::ata-page-block[1]/@pb-name and string(ancestor-or-self::ata-page-block[1]/@pb-name)='intro00') and not(ancestor-or-self::page-block[1]/@pb-name and string(ancestor-or-self::page-block[1]/@pb-name)='intro00') and not(ancestor::ata-page-block/@pb-name[starts-with(., 'disassy') or starts-with(., 'fault')]) and not(ancestor::page-block/@pb-name[starts-with(., 'disassy') or starts-with(., 'fault')]) and not(ancestor::book[contains(@doctype,'oh')] and ancestor::ata-page-block/@pb-name[starts-with(., 'clean')]) and not(ancestor::book[contains(@doctype,'oh')] and ancestor::page-block/@pb-name[starts-with(., 'clean')]) and not(ancestor::ata-page-block/@pb-name[starts-with(., 'mainprac')]) and not(ancestor::page-block/@pb-name[starts-with(., 'mainprac')]) and not(ancestor::book[contains(@doctype,'oh')] and ancestor::ata-page-block/@pb-name[starts-with(., 'inspect')]) and not(ancestor::book[contains(@doctype,'oh')] and ancestor::page-block/@pb-name[starts-with(., 'inspect')]) and not(ancestor::ata-page-block/@pb-name[(starts-with(., 'di') and 'di' = translate(., '0123456789', '') and string-length(.) &gt; 2) or starts-with(.,'service')]) and not(ancestor::page-block/@pb-name[(starts-with(., 'di') and 'di' = translate(., '0123456789', '') and string-length(.) &gt; 2) or starts-with(.,'service')]) and not(ancestor::book[contains(@doctype,'oh')] and ancestor::ata-page-block/@pb-name[starts-with(., 'repair')]) and not(ancestor::book[contains(@doctype,'oh')] and ancestor::page-block/@pb-name[starts-with(., 'repair')]) and not(ancestor::book[contains(@doctype,'oh')] and ancestor::ata-page-block/@pb-name[starts-with(., 'test')]) and not(ancestor::book[contains(@doctype,'oh')] and ancestor::page-block/@pb-name[starts-with(., 'test')]) and not(ancestor::ata-page-block/@pb-name[(starts-with(., 'cl') and 'cl' = translate(., '0123456789', '') and string-length(.) &gt; 2) or .='install' or starts-with(.,'rem-inst') or (starts-with(., 'reminst') and 'reminst' = translate(., '0123456789', '') and string-length(.) &gt; 7) or .='remove' or (starts-with(., 'repair') and 'repair' = translate(., '0123456789', '') and string-length(.) &gt; 6)]) and not(ancestor::page-block/@pb-name[(starts-with(., 'cl') and 'cl' = translate(., '0123456789', '') and string-length(.) &gt; 2) or .='install' or starts-with(.,'rem-inst') or (starts-with(., 'reminst') and 'reminst' = translate(., '0123456789', '') and string-length(.) &gt; 7) or .='remove' or (starts-with(., 'repair') and 'repair' = translate(., '0123456789', '') and string-length(.) &gt; 6)]) and not(ancestor::ata-page-block/@pb-name[starts-with(., 'assy') or (starts-with(., 'ic') and 'ic' = translate(., '0123456789', '') and string-length(.) &gt; 2) or (starts-with(., 'te') and 'te' = translate(., '0123456789', '') and string-length(.) &gt; 2) or .='test']) and not(ancestor::page-block/@pb-name[starts-with(., 'assy') or (starts-with(., 'ic') and 'ic' = translate(., '0123456789', '') and string-length(.) &gt; 2) or (starts-with(., 'te') and 'te' = translate(., '0123456789', '') and string-length(.) &gt; 2) or .='test']) and not(ancestor::ata-page-block/@pb-name[.='f-and-c' or starts-with(., 'inspect') or (starts-with(., 're') and 're' = translate(., '0123456789', '') and string-length(.) &gt; 2)]) and not(ancestor::page-block/@pb-name[.='f-and-c' or starts-with(., 'inspect') or (starts-with(., 're') and 're' = translate(., '0123456789', '') and string-length(.) &gt; 2)]) and not(ancestor::ata-page-block/@pb-name[(starts-with(., 'as') and 'as' = translate(., '0123456789', '') and string-length(.) &gt; 2) or starts-with(.,'clean') or (starts-with(., 'test') and 'test' = translate(., '0123456789', '') and string-length(.) &gt; 4)]) and not(ancestor::page-block/@pb-name[(starts-with(., 'as') and 'as' = translate(., '0123456789', '') and string-length(.) &gt; 2) or starts-with(.,'clean') or (starts-with(., 'test') and 'test' = translate(., '0123456789', '') and string-length(.) &gt; 4)]) and not(ancestor::ata-page-block/@pb-name[(starts-with(., 'fc') and 'fc' = translate(., '0123456789', '') and string-length(.) &gt; 2) or starts-with(.,'repair') or .='trouble']) and not(ancestor::page-block/@pb-name[(starts-with(., 'fc') and 'fc' = translate(., '0123456789', '') and string-length(.) &gt; 2) or starts-with(.,'repair') or .='trouble']) and (ancestor::ata-page-block/@pb-name[starts-with(.,'storage') or (starts-with(., 'to') and 'to' = translate(., '0123456789', '') and string-length(.) &gt; 2)])">
               <xsl:attribute name="_gte:count-as-id">cnt__figure^ata-page-block.cnt</xsl:attribute>
            </xsl:when>
            <xsl:when test="not(ancestor::book[contains(@doctype,'oh')] and ancestor::ata-page-block/@pb-name[.='service']) and not(ancestor::book[contains(@doctype,'oh')] and ancestor::page-block/@pb-name[.='service']) and not(ancestor::ata-page-block/@pb-name[.='00awl' or .='00intro' or .='airlim' or .='awl' or .='awlror' or .='chapsect' or .='consume' or .='d-and-o' or .='frontmatte' or .='howtouse' or .='00howtouse' or .='intro' or .='nut_option' or .='oplimits' or .='sblist' or .='schedchk' or .='spectool' or .='timelim' or .='title-page']) and not(ancestor::page-block/@pb-name[.='00awl' or .='00intro' or .='airlim' or .='awl' or .='awlror' or .='chapsect' or .='consume' or .='d-and-o' or .='frontmatte' or .='howtouse' or .='00howtouse' or .='intro' or .='nut_option' or .='oplimits' or .='sblist' or .='schedchk' or .='spectool' or .='timelim' or .='title-page']) and not(ancestor::ata-page-block/@pb-name[(starts-with(., 'do') and 'do' = translate(., '0123456789', '') and string-length(.) &gt; 2) or (starts-with(., 'in') and 'in' = translate(., '0123456789', '') and string-length(.) &gt; 2) or (starts-with(., 'tl') and 'tl' = translate(., '0123456789', '') and string-length(.) &gt; 2) or .='toolsht' or .='trlist' or .='unschedc' or .='unschedchk']) and not(ancestor::page-block/@pb-name[(starts-with(., 'do') and 'do' = translate(., '0123456789', '') and string-length(.) &gt; 2) or (starts-with(., 'in') and 'in' = translate(., '0123456789', '') and string-length(.) &gt; 2) or (starts-with(., 'tl') and 'tl' = translate(., '0123456789', '') and string-length(.) &gt; 2) or .='toolsht' or .='trlist' or .='unschedc' or .='unschedchk']) and not(ancestor-or-self::ata-page-block[1]/@pb-name and string(ancestor-or-self::ata-page-block[1]/@pb-name)='intro00') and not(ancestor-or-self::page-block[1]/@pb-name and string(ancestor-or-self::page-block[1]/@pb-name)='intro00') and not(ancestor::ata-page-block/@pb-name[starts-with(., 'disassy') or starts-with(., 'fault')]) and not(ancestor::page-block/@pb-name[starts-with(., 'disassy') or starts-with(., 'fault')]) and not(ancestor::book[contains(@doctype,'oh')] and ancestor::ata-page-block/@pb-name[starts-with(., 'clean')]) and not(ancestor::book[contains(@doctype,'oh')] and ancestor::page-block/@pb-name[starts-with(., 'clean')]) and not(ancestor::ata-page-block/@pb-name[starts-with(., 'mainprac')]) and not(ancestor::page-block/@pb-name[starts-with(., 'mainprac')]) and not(ancestor::book[contains(@doctype,'oh')] and ancestor::ata-page-block/@pb-name[starts-with(., 'inspect')]) and not(ancestor::book[contains(@doctype,'oh')] and ancestor::page-block/@pb-name[starts-with(., 'inspect')]) and not(ancestor::ata-page-block/@pb-name[(starts-with(., 'di') and 'di' = translate(., '0123456789', '') and string-length(.) &gt; 2) or starts-with(.,'service')]) and not(ancestor::page-block/@pb-name[(starts-with(., 'di') and 'di' = translate(., '0123456789', '') and string-length(.) &gt; 2) or starts-with(.,'service')]) and not(ancestor::book[contains(@doctype,'oh')] and ancestor::ata-page-block/@pb-name[starts-with(., 'repair')]) and not(ancestor::book[contains(@doctype,'oh')] and ancestor::page-block/@pb-name[starts-with(., 'repair')]) and not(ancestor::book[contains(@doctype,'oh')] and ancestor::ata-page-block/@pb-name[starts-with(., 'test')]) and not(ancestor::book[contains(@doctype,'oh')] and ancestor::page-block/@pb-name[starts-with(., 'test')]) and not(ancestor::ata-page-block/@pb-name[(starts-with(., 'cl') and 'cl' = translate(., '0123456789', '') and string-length(.) &gt; 2) or .='install' or starts-with(.,'rem-inst') or (starts-with(., 'reminst') and 'reminst' = translate(., '0123456789', '') and string-length(.) &gt; 7) or .='remove' or (starts-with(., 'repair') and 'repair' = translate(., '0123456789', '') and string-length(.) &gt; 6)]) and not(ancestor::page-block/@pb-name[(starts-with(., 'cl') and 'cl' = translate(., '0123456789', '') and string-length(.) &gt; 2) or .='install' or starts-with(.,'rem-inst') or (starts-with(., 'reminst') and 'reminst' = translate(., '0123456789', '') and string-length(.) &gt; 7) or .='remove' or (starts-with(., 'repair') and 'repair' = translate(., '0123456789', '') and string-length(.) &gt; 6)]) and not(ancestor::ata-page-block/@pb-name[starts-with(., 'assy') or (starts-with(., 'ic') and 'ic' = translate(., '0123456789', '') and string-length(.) &gt; 2) or (starts-with(., 'te') and 'te' = translate(., '0123456789', '') and string-length(.) &gt; 2) or .='test']) and not(ancestor::page-block/@pb-name[starts-with(., 'assy') or (starts-with(., 'ic') and 'ic' = translate(., '0123456789', '') and string-length(.) &gt; 2) or (starts-with(., 'te') and 'te' = translate(., '0123456789', '') and string-length(.) &gt; 2) or .='test']) and not(ancestor::ata-page-block/@pb-name[.='f-and-c' or starts-with(., 'inspect') or (starts-with(., 're') and 're' = translate(., '0123456789', '') and string-length(.) &gt; 2)]) and not(ancestor::page-block/@pb-name[.='f-and-c' or starts-with(., 'inspect') or (starts-with(., 're') and 're' = translate(., '0123456789', '') and string-length(.) &gt; 2)]) and not(ancestor::ata-page-block/@pb-name[(starts-with(., 'as') and 'as' = translate(., '0123456789', '') and string-length(.) &gt; 2) or starts-with(.,'clean') or (starts-with(., 'test') and 'test' = translate(., '0123456789', '') and string-length(.) &gt; 4)]) and not(ancestor::page-block/@pb-name[(starts-with(., 'as') and 'as' = translate(., '0123456789', '') and string-length(.) &gt; 2) or starts-with(.,'clean') or (starts-with(., 'test') and 'test' = translate(., '0123456789', '') and string-length(.) &gt; 4)]) and not(ancestor::ata-page-block/@pb-name[(starts-with(., 'fc') and 'fc' = translate(., '0123456789', '') and string-length(.) &gt; 2) or starts-with(.,'repair') or .='trouble']) and (ancestor::page-block/@pb-name[(starts-with(., 'fc') and 'fc' = translate(., '0123456789', '') and string-length(.) &gt; 2) or starts-with(.,'repair') or .='trouble'])">
               <xsl:attribute name="_gte:count-as-id">cnt__figure^page-block.cnt</xsl:attribute>
            </xsl:when>
            <xsl:when test="not(ancestor::book[contains(@doctype,'oh')] and ancestor::ata-page-block/@pb-name[.='service']) and not(ancestor::book[contains(@doctype,'oh')] and ancestor::page-block/@pb-name[.='service']) and not(ancestor::ata-page-block/@pb-name[.='00awl' or .='00intro' or .='airlim' or .='awl' or .='awlror' or .='chapsect' or .='consume' or .='d-and-o' or .='frontmatte' or .='howtouse' or .='00howtouse' or .='intro' or .='nut_option' or .='oplimits' or .='sblist' or .='schedchk' or .='spectool' or .='timelim' or .='title-page']) and not(ancestor::page-block/@pb-name[.='00awl' or .='00intro' or .='airlim' or .='awl' or .='awlror' or .='chapsect' or .='consume' or .='d-and-o' or .='frontmatte' or .='howtouse' or .='00howtouse' or .='intro' or .='nut_option' or .='oplimits' or .='sblist' or .='schedchk' or .='spectool' or .='timelim' or .='title-page']) and not(ancestor::ata-page-block/@pb-name[(starts-with(., 'do') and 'do' = translate(., '0123456789', '') and string-length(.) &gt; 2) or (starts-with(., 'in') and 'in' = translate(., '0123456789', '') and string-length(.) &gt; 2) or (starts-with(., 'tl') and 'tl' = translate(., '0123456789', '') and string-length(.) &gt; 2) or .='toolsht' or .='trlist' or .='unschedc' or .='unschedchk']) and not(ancestor::page-block/@pb-name[(starts-with(., 'do') and 'do' = translate(., '0123456789', '') and string-length(.) &gt; 2) or (starts-with(., 'in') and 'in' = translate(., '0123456789', '') and string-length(.) &gt; 2) or (starts-with(., 'tl') and 'tl' = translate(., '0123456789', '') and string-length(.) &gt; 2) or .='toolsht' or .='trlist' or .='unschedc' or .='unschedchk']) and not(ancestor-or-self::ata-page-block[1]/@pb-name and string(ancestor-or-self::ata-page-block[1]/@pb-name)='intro00') and not(ancestor-or-self::page-block[1]/@pb-name and string(ancestor-or-self::page-block[1]/@pb-name)='intro00') and not(ancestor::ata-page-block/@pb-name[starts-with(., 'disassy') or starts-with(., 'fault')]) and not(ancestor::page-block/@pb-name[starts-with(., 'disassy') or starts-with(., 'fault')]) and not(ancestor::book[contains(@doctype,'oh')] and ancestor::ata-page-block/@pb-name[starts-with(., 'clean')]) and not(ancestor::book[contains(@doctype,'oh')] and ancestor::page-block/@pb-name[starts-with(., 'clean')]) and not(ancestor::ata-page-block/@pb-name[starts-with(., 'mainprac')]) and not(ancestor::page-block/@pb-name[starts-with(., 'mainprac')]) and not(ancestor::book[contains(@doctype,'oh')] and ancestor::ata-page-block/@pb-name[starts-with(., 'inspect')]) and not(ancestor::book[contains(@doctype,'oh')] and ancestor::page-block/@pb-name[starts-with(., 'inspect')]) and not(ancestor::ata-page-block/@pb-name[(starts-with(., 'di') and 'di' = translate(., '0123456789', '') and string-length(.) &gt; 2) or starts-with(.,'service')]) and not(ancestor::page-block/@pb-name[(starts-with(., 'di') and 'di' = translate(., '0123456789', '') and string-length(.) &gt; 2) or starts-with(.,'service')]) and not(ancestor::book[contains(@doctype,'oh')] and ancestor::ata-page-block/@pb-name[starts-with(., 'repair')]) and not(ancestor::book[contains(@doctype,'oh')] and ancestor::page-block/@pb-name[starts-with(., 'repair')]) and not(ancestor::book[contains(@doctype,'oh')] and ancestor::ata-page-block/@pb-name[starts-with(., 'test')]) and not(ancestor::book[contains(@doctype,'oh')] and ancestor::page-block/@pb-name[starts-with(., 'test')]) and not(ancestor::ata-page-block/@pb-name[(starts-with(., 'cl') and 'cl' = translate(., '0123456789', '') and string-length(.) &gt; 2) or .='install' or starts-with(.,'rem-inst') or (starts-with(., 'reminst') and 'reminst' = translate(., '0123456789', '') and string-length(.) &gt; 7) or .='remove' or (starts-with(., 'repair') and 'repair' = translate(., '0123456789', '') and string-length(.) &gt; 6)]) and not(ancestor::page-block/@pb-name[(starts-with(., 'cl') and 'cl' = translate(., '0123456789', '') and string-length(.) &gt; 2) or .='install' or starts-with(.,'rem-inst') or (starts-with(., 'reminst') and 'reminst' = translate(., '0123456789', '') and string-length(.) &gt; 7) or .='remove' or (starts-with(., 'repair') and 'repair' = translate(., '0123456789', '') and string-length(.) &gt; 6)]) and not(ancestor::ata-page-block/@pb-name[starts-with(., 'assy') or (starts-with(., 'ic') and 'ic' = translate(., '0123456789', '') and string-length(.) &gt; 2) or (starts-with(., 'te') and 'te' = translate(., '0123456789', '') and string-length(.) &gt; 2) or .='test']) and not(ancestor::page-block/@pb-name[starts-with(., 'assy') or (starts-with(., 'ic') and 'ic' = translate(., '0123456789', '') and string-length(.) &gt; 2) or (starts-with(., 'te') and 'te' = translate(., '0123456789', '') and string-length(.) &gt; 2) or .='test']) and not(ancestor::ata-page-block/@pb-name[.='f-and-c' or starts-with(., 'inspect') or (starts-with(., 're') and 're' = translate(., '0123456789', '') and string-length(.) &gt; 2)]) and not(ancestor::page-block/@pb-name[.='f-and-c' or starts-with(., 'inspect') or (starts-with(., 're') and 're' = translate(., '0123456789', '') and string-length(.) &gt; 2)]) and not(ancestor::ata-page-block/@pb-name[(starts-with(., 'as') and 'as' = translate(., '0123456789', '') and string-length(.) &gt; 2) or starts-with(.,'clean') or (starts-with(., 'test') and 'test' = translate(., '0123456789', '') and string-length(.) &gt; 4)]) and not(ancestor::page-block/@pb-name[(starts-with(., 'as') and 'as' = translate(., '0123456789', '') and string-length(.) &gt; 2) or starts-with(.,'clean') or (starts-with(., 'test') and 'test' = translate(., '0123456789', '') and string-length(.) &gt; 4)]) and (ancestor::ata-page-block/@pb-name[(starts-with(., 'fc') and 'fc' = translate(., '0123456789', '') and string-length(.) &gt; 2) or starts-with(.,'repair') or .='trouble'])">
               <xsl:attribute name="_gte:count-as-id">cnt__figure^ata-page-block.cnt</xsl:attribute>
            </xsl:when>
            <xsl:when test="not(ancestor::book[contains(@doctype,'oh')] and ancestor::ata-page-block/@pb-name[.='service']) and not(ancestor::book[contains(@doctype,'oh')] and ancestor::page-block/@pb-name[.='service']) and not(ancestor::ata-page-block/@pb-name[.='00awl' or .='00intro' or .='airlim' or .='awl' or .='awlror' or .='chapsect' or .='consume' or .='d-and-o' or .='frontmatte' or .='howtouse' or .='00howtouse' or .='intro' or .='nut_option' or .='oplimits' or .='sblist' or .='schedchk' or .='spectool' or .='timelim' or .='title-page']) and not(ancestor::page-block/@pb-name[.='00awl' or .='00intro' or .='airlim' or .='awl' or .='awlror' or .='chapsect' or .='consume' or .='d-and-o' or .='frontmatte' or .='howtouse' or .='00howtouse' or .='intro' or .='nut_option' or .='oplimits' or .='sblist' or .='schedchk' or .='spectool' or .='timelim' or .='title-page']) and not(ancestor::ata-page-block/@pb-name[(starts-with(., 'do') and 'do' = translate(., '0123456789', '') and string-length(.) &gt; 2) or (starts-with(., 'in') and 'in' = translate(., '0123456789', '') and string-length(.) &gt; 2) or (starts-with(., 'tl') and 'tl' = translate(., '0123456789', '') and string-length(.) &gt; 2) or .='toolsht' or .='trlist' or .='unschedc' or .='unschedchk']) and not(ancestor::page-block/@pb-name[(starts-with(., 'do') and 'do' = translate(., '0123456789', '') and string-length(.) &gt; 2) or (starts-with(., 'in') and 'in' = translate(., '0123456789', '') and string-length(.) &gt; 2) or (starts-with(., 'tl') and 'tl' = translate(., '0123456789', '') and string-length(.) &gt; 2) or .='toolsht' or .='trlist' or .='unschedc' or .='unschedchk']) and not(ancestor-or-self::ata-page-block[1]/@pb-name and string(ancestor-or-self::ata-page-block[1]/@pb-name)='intro00') and not(ancestor-or-self::page-block[1]/@pb-name and string(ancestor-or-self::page-block[1]/@pb-name)='intro00') and not(ancestor::ata-page-block/@pb-name[starts-with(., 'disassy') or starts-with(., 'fault')]) and not(ancestor::page-block/@pb-name[starts-with(., 'disassy') or starts-with(., 'fault')]) and not(ancestor::book[contains(@doctype,'oh')] and ancestor::ata-page-block/@pb-name[starts-with(., 'clean')]) and not(ancestor::book[contains(@doctype,'oh')] and ancestor::page-block/@pb-name[starts-with(., 'clean')]) and not(ancestor::ata-page-block/@pb-name[starts-with(., 'mainprac')]) and not(ancestor::page-block/@pb-name[starts-with(., 'mainprac')]) and not(ancestor::book[contains(@doctype,'oh')] and ancestor::ata-page-block/@pb-name[starts-with(., 'inspect')]) and not(ancestor::book[contains(@doctype,'oh')] and ancestor::page-block/@pb-name[starts-with(., 'inspect')]) and not(ancestor::ata-page-block/@pb-name[(starts-with(., 'di') and 'di' = translate(., '0123456789', '') and string-length(.) &gt; 2) or starts-with(.,'service')]) and not(ancestor::page-block/@pb-name[(starts-with(., 'di') and 'di' = translate(., '0123456789', '') and string-length(.) &gt; 2) or starts-with(.,'service')]) and not(ancestor::book[contains(@doctype,'oh')] and ancestor::ata-page-block/@pb-name[starts-with(., 'repair')]) and not(ancestor::book[contains(@doctype,'oh')] and ancestor::page-block/@pb-name[starts-with(., 'repair')]) and not(ancestor::book[contains(@doctype,'oh')] and ancestor::ata-page-block/@pb-name[starts-with(., 'test')]) and not(ancestor::book[contains(@doctype,'oh')] and ancestor::page-block/@pb-name[starts-with(., 'test')]) and not(ancestor::ata-page-block/@pb-name[(starts-with(., 'cl') and 'cl' = translate(., '0123456789', '') and string-length(.) &gt; 2) or .='install' or starts-with(.,'rem-inst') or (starts-with(., 'reminst') and 'reminst' = translate(., '0123456789', '') and string-length(.) &gt; 7) or .='remove' or (starts-with(., 'repair') and 'repair' = translate(., '0123456789', '') and string-length(.) &gt; 6)]) and not(ancestor::page-block/@pb-name[(starts-with(., 'cl') and 'cl' = translate(., '0123456789', '') and string-length(.) &gt; 2) or .='install' or starts-with(.,'rem-inst') or (starts-with(., 'reminst') and 'reminst' = translate(., '0123456789', '') and string-length(.) &gt; 7) or .='remove' or (starts-with(., 'repair') and 'repair' = translate(., '0123456789', '') and string-length(.) &gt; 6)]) and not(ancestor::ata-page-block/@pb-name[starts-with(., 'assy') or (starts-with(., 'ic') and 'ic' = translate(., '0123456789', '') and string-length(.) &gt; 2) or (starts-with(., 'te') and 'te' = translate(., '0123456789', '') and string-length(.) &gt; 2) or .='test']) and not(ancestor::page-block/@pb-name[starts-with(., 'assy') or (starts-with(., 'ic') and 'ic' = translate(., '0123456789', '') and string-length(.) &gt; 2) or (starts-with(., 'te') and 'te' = translate(., '0123456789', '') and string-length(.) &gt; 2) or .='test']) and not(ancestor::ata-page-block/@pb-name[.='f-and-c' or starts-with(., 'inspect') or (starts-with(., 're') and 're' = translate(., '0123456789', '') and string-length(.) &gt; 2)]) and not(ancestor::page-block/@pb-name[.='f-and-c' or starts-with(., 'inspect') or (starts-with(., 're') and 're' = translate(., '0123456789', '') and string-length(.) &gt; 2)]) and not(ancestor::ata-page-block/@pb-name[(starts-with(., 'as') and 'as' = translate(., '0123456789', '') and string-length(.) &gt; 2) or starts-with(.,'clean') or (starts-with(., 'test') and 'test' = translate(., '0123456789', '') and string-length(.) &gt; 4)]) and (ancestor::page-block/@pb-name[(starts-with(., 'as') and 'as' = translate(., '0123456789', '') and string-length(.) &gt; 2) or starts-with(.,'clean') or (starts-with(., 'test') and 'test' = translate(., '0123456789', '') and string-length(.) &gt; 4)])">
               <xsl:attribute name="_gte:count-as-id">cnt__figure^page-block.cnt</xsl:attribute>
            </xsl:when>
            <xsl:when test="not(ancestor::book[contains(@doctype,'oh')] and ancestor::ata-page-block/@pb-name[.='service']) and not(ancestor::book[contains(@doctype,'oh')] and ancestor::page-block/@pb-name[.='service']) and not(ancestor::ata-page-block/@pb-name[.='00awl' or .='00intro' or .='airlim' or .='awl' or .='awlror' or .='chapsect' or .='consume' or .='d-and-o' or .='frontmatte' or .='howtouse' or .='00howtouse' or .='intro' or .='nut_option' or .='oplimits' or .='sblist' or .='schedchk' or .='spectool' or .='timelim' or .='title-page']) and not(ancestor::page-block/@pb-name[.='00awl' or .='00intro' or .='airlim' or .='awl' or .='awlror' or .='chapsect' or .='consume' or .='d-and-o' or .='frontmatte' or .='howtouse' or .='00howtouse' or .='intro' or .='nut_option' or .='oplimits' or .='sblist' or .='schedchk' or .='spectool' or .='timelim' or .='title-page']) and not(ancestor::ata-page-block/@pb-name[(starts-with(., 'do') and 'do' = translate(., '0123456789', '') and string-length(.) &gt; 2) or (starts-with(., 'in') and 'in' = translate(., '0123456789', '') and string-length(.) &gt; 2) or (starts-with(., 'tl') and 'tl' = translate(., '0123456789', '') and string-length(.) &gt; 2) or .='toolsht' or .='trlist' or .='unschedc' or .='unschedchk']) and not(ancestor::page-block/@pb-name[(starts-with(., 'do') and 'do' = translate(., '0123456789', '') and string-length(.) &gt; 2) or (starts-with(., 'in') and 'in' = translate(., '0123456789', '') and string-length(.) &gt; 2) or (starts-with(., 'tl') and 'tl' = translate(., '0123456789', '') and string-length(.) &gt; 2) or .='toolsht' or .='trlist' or .='unschedc' or .='unschedchk']) and not(ancestor-or-self::ata-page-block[1]/@pb-name and string(ancestor-or-self::ata-page-block[1]/@pb-name)='intro00') and not(ancestor-or-self::page-block[1]/@pb-name and string(ancestor-or-self::page-block[1]/@pb-name)='intro00') and not(ancestor::ata-page-block/@pb-name[starts-with(., 'disassy') or starts-with(., 'fault')]) and not(ancestor::page-block/@pb-name[starts-with(., 'disassy') or starts-with(., 'fault')]) and not(ancestor::book[contains(@doctype,'oh')] and ancestor::ata-page-block/@pb-name[starts-with(., 'clean')]) and not(ancestor::book[contains(@doctype,'oh')] and ancestor::page-block/@pb-name[starts-with(., 'clean')]) and not(ancestor::ata-page-block/@pb-name[starts-with(., 'mainprac')]) and not(ancestor::page-block/@pb-name[starts-with(., 'mainprac')]) and not(ancestor::book[contains(@doctype,'oh')] and ancestor::ata-page-block/@pb-name[starts-with(., 'inspect')]) and not(ancestor::book[contains(@doctype,'oh')] and ancestor::page-block/@pb-name[starts-with(., 'inspect')]) and not(ancestor::ata-page-block/@pb-name[(starts-with(., 'di') and 'di' = translate(., '0123456789', '') and string-length(.) &gt; 2) or starts-with(.,'service')]) and not(ancestor::page-block/@pb-name[(starts-with(., 'di') and 'di' = translate(., '0123456789', '') and string-length(.) &gt; 2) or starts-with(.,'service')]) and not(ancestor::book[contains(@doctype,'oh')] and ancestor::ata-page-block/@pb-name[starts-with(., 'repair')]) and not(ancestor::book[contains(@doctype,'oh')] and ancestor::page-block/@pb-name[starts-with(., 'repair')]) and not(ancestor::book[contains(@doctype,'oh')] and ancestor::ata-page-block/@pb-name[starts-with(., 'test')]) and not(ancestor::book[contains(@doctype,'oh')] and ancestor::page-block/@pb-name[starts-with(., 'test')]) and not(ancestor::ata-page-block/@pb-name[(starts-with(., 'cl') and 'cl' = translate(., '0123456789', '') and string-length(.) &gt; 2) or .='install' or starts-with(.,'rem-inst') or (starts-with(., 'reminst') and 'reminst' = translate(., '0123456789', '') and string-length(.) &gt; 7) or .='remove' or (starts-with(., 'repair') and 'repair' = translate(., '0123456789', '') and string-length(.) &gt; 6)]) and not(ancestor::page-block/@pb-name[(starts-with(., 'cl') and 'cl' = translate(., '0123456789', '') and string-length(.) &gt; 2) or .='install' or starts-with(.,'rem-inst') or (starts-with(., 'reminst') and 'reminst' = translate(., '0123456789', '') and string-length(.) &gt; 7) or .='remove' or (starts-with(., 'repair') and 'repair' = translate(., '0123456789', '') and string-length(.) &gt; 6)]) and not(ancestor::ata-page-block/@pb-name[starts-with(., 'assy') or (starts-with(., 'ic') and 'ic' = translate(., '0123456789', '') and string-length(.) &gt; 2) or (starts-with(., 'te') and 'te' = translate(., '0123456789', '') and string-length(.) &gt; 2) or .='test']) and not(ancestor::page-block/@pb-name[starts-with(., 'assy') or (starts-with(., 'ic') and 'ic' = translate(., '0123456789', '') and string-length(.) &gt; 2) or (starts-with(., 'te') and 'te' = translate(., '0123456789', '') and string-length(.) &gt; 2) or .='test']) and not(ancestor::ata-page-block/@pb-name[.='f-and-c' or starts-with(., 'inspect') or (starts-with(., 're') and 're' = translate(., '0123456789', '') and string-length(.) &gt; 2)]) and not(ancestor::page-block/@pb-name[.='f-and-c' or starts-with(., 'inspect') or (starts-with(., 're') and 're' = translate(., '0123456789', '') and string-length(.) &gt; 2)]) and (ancestor::ata-page-block/@pb-name[(starts-with(., 'as') and 'as' = translate(., '0123456789', '') and string-length(.) &gt; 2) or starts-with(.,'clean') or (starts-with(., 'test') and 'test' = translate(., '0123456789', '') and string-length(.) &gt; 4)])">
               <xsl:attribute name="_gte:count-as-id">cnt__figure^ata-page-block.cnt</xsl:attribute>
            </xsl:when>
            <xsl:when test="not(ancestor::book[contains(@doctype,'oh')] and ancestor::ata-page-block/@pb-name[.='service']) and not(ancestor::book[contains(@doctype,'oh')] and ancestor::page-block/@pb-name[.='service']) and not(ancestor::ata-page-block/@pb-name[.='00awl' or .='00intro' or .='airlim' or .='awl' or .='awlror' or .='chapsect' or .='consume' or .='d-and-o' or .='frontmatte' or .='howtouse' or .='00howtouse' or .='intro' or .='nut_option' or .='oplimits' or .='sblist' or .='schedchk' or .='spectool' or .='timelim' or .='title-page']) and not(ancestor::page-block/@pb-name[.='00awl' or .='00intro' or .='airlim' or .='awl' or .='awlror' or .='chapsect' or .='consume' or .='d-and-o' or .='frontmatte' or .='howtouse' or .='00howtouse' or .='intro' or .='nut_option' or .='oplimits' or .='sblist' or .='schedchk' or .='spectool' or .='timelim' or .='title-page']) and not(ancestor::ata-page-block/@pb-name[(starts-with(., 'do') and 'do' = translate(., '0123456789', '') and string-length(.) &gt; 2) or (starts-with(., 'in') and 'in' = translate(., '0123456789', '') and string-length(.) &gt; 2) or (starts-with(., 'tl') and 'tl' = translate(., '0123456789', '') and string-length(.) &gt; 2) or .='toolsht' or .='trlist' or .='unschedc' or .='unschedchk']) and not(ancestor::page-block/@pb-name[(starts-with(., 'do') and 'do' = translate(., '0123456789', '') and string-length(.) &gt; 2) or (starts-with(., 'in') and 'in' = translate(., '0123456789', '') and string-length(.) &gt; 2) or (starts-with(., 'tl') and 'tl' = translate(., '0123456789', '') and string-length(.) &gt; 2) or .='toolsht' or .='trlist' or .='unschedc' or .='unschedchk']) and not(ancestor-or-self::ata-page-block[1]/@pb-name and string(ancestor-or-self::ata-page-block[1]/@pb-name)='intro00') and not(ancestor-or-self::page-block[1]/@pb-name and string(ancestor-or-self::page-block[1]/@pb-name)='intro00') and not(ancestor::ata-page-block/@pb-name[starts-with(., 'disassy') or starts-with(., 'fault')]) and not(ancestor::page-block/@pb-name[starts-with(., 'disassy') or starts-with(., 'fault')]) and not(ancestor::book[contains(@doctype,'oh')] and ancestor::ata-page-block/@pb-name[starts-with(., 'clean')]) and not(ancestor::book[contains(@doctype,'oh')] and ancestor::page-block/@pb-name[starts-with(., 'clean')]) and not(ancestor::ata-page-block/@pb-name[starts-with(., 'mainprac')]) and not(ancestor::page-block/@pb-name[starts-with(., 'mainprac')]) and not(ancestor::book[contains(@doctype,'oh')] and ancestor::ata-page-block/@pb-name[starts-with(., 'inspect')]) and not(ancestor::book[contains(@doctype,'oh')] and ancestor::page-block/@pb-name[starts-with(., 'inspect')]) and not(ancestor::ata-page-block/@pb-name[(starts-with(., 'di') and 'di' = translate(., '0123456789', '') and string-length(.) &gt; 2) or starts-with(.,'service')]) and not(ancestor::page-block/@pb-name[(starts-with(., 'di') and 'di' = translate(., '0123456789', '') and string-length(.) &gt; 2) or starts-with(.,'service')]) and not(ancestor::book[contains(@doctype,'oh')] and ancestor::ata-page-block/@pb-name[starts-with(., 'repair')]) and not(ancestor::book[contains(@doctype,'oh')] and ancestor::page-block/@pb-name[starts-with(., 'repair')]) and not(ancestor::book[contains(@doctype,'oh')] and ancestor::ata-page-block/@pb-name[starts-with(., 'test')]) and not(ancestor::book[contains(@doctype,'oh')] and ancestor::page-block/@pb-name[starts-with(., 'test')]) and not(ancestor::ata-page-block/@pb-name[(starts-with(., 'cl') and 'cl' = translate(., '0123456789', '') and string-length(.) &gt; 2) or .='install' or starts-with(.,'rem-inst') or (starts-with(., 'reminst') and 'reminst' = translate(., '0123456789', '') and string-length(.) &gt; 7) or .='remove' or (starts-with(., 'repair') and 'repair' = translate(., '0123456789', '') and string-length(.) &gt; 6)]) and not(ancestor::page-block/@pb-name[(starts-with(., 'cl') and 'cl' = translate(., '0123456789', '') and string-length(.) &gt; 2) or .='install' or starts-with(.,'rem-inst') or (starts-with(., 'reminst') and 'reminst' = translate(., '0123456789', '') and string-length(.) &gt; 7) or .='remove' or (starts-with(., 'repair') and 'repair' = translate(., '0123456789', '') and string-length(.) &gt; 6)]) and not(ancestor::ata-page-block/@pb-name[starts-with(., 'assy') or (starts-with(., 'ic') and 'ic' = translate(., '0123456789', '') and string-length(.) &gt; 2) or (starts-with(., 'te') and 'te' = translate(., '0123456789', '') and string-length(.) &gt; 2) or .='test']) and not(ancestor::page-block/@pb-name[starts-with(., 'assy') or (starts-with(., 'ic') and 'ic' = translate(., '0123456789', '') and string-length(.) &gt; 2) or (starts-with(., 'te') and 'te' = translate(., '0123456789', '') and string-length(.) &gt; 2) or .='test']) and not(ancestor::ata-page-block/@pb-name[.='f-and-c' or starts-with(., 'inspect') or (starts-with(., 're') and 're' = translate(., '0123456789', '') and string-length(.) &gt; 2)]) and (ancestor::page-block/@pb-name[.='f-and-c' or starts-with(., 'inspect') or (starts-with(., 're') and 're' = translate(., '0123456789', '') and string-length(.) &gt; 2)])">
               <xsl:attribute name="_gte:count-as-id">cnt__figure^page-block.cnt</xsl:attribute>
            </xsl:when>
            <xsl:when test="not(ancestor::book[contains(@doctype,'oh')] and ancestor::ata-page-block/@pb-name[.='service']) and not(ancestor::book[contains(@doctype,'oh')] and ancestor::page-block/@pb-name[.='service']) and not(ancestor::ata-page-block/@pb-name[.='00awl' or .='00intro' or .='airlim' or .='awl' or .='awlror' or .='chapsect' or .='consume' or .='d-and-o' or .='frontmatte' or .='howtouse' or .='00howtouse' or .='intro' or .='nut_option' or .='oplimits' or .='sblist' or .='schedchk' or .='spectool' or .='timelim' or .='title-page']) and not(ancestor::page-block/@pb-name[.='00awl' or .='00intro' or .='airlim' or .='awl' or .='awlror' or .='chapsect' or .='consume' or .='d-and-o' or .='frontmatte' or .='howtouse' or .='00howtouse' or .='intro' or .='nut_option' or .='oplimits' or .='sblist' or .='schedchk' or .='spectool' or .='timelim' or .='title-page']) and not(ancestor::ata-page-block/@pb-name[(starts-with(., 'do') and 'do' = translate(., '0123456789', '') and string-length(.) &gt; 2) or (starts-with(., 'in') and 'in' = translate(., '0123456789', '') and string-length(.) &gt; 2) or (starts-with(., 'tl') and 'tl' = translate(., '0123456789', '') and string-length(.) &gt; 2) or .='toolsht' or .='trlist' or .='unschedc' or .='unschedchk']) and not(ancestor::page-block/@pb-name[(starts-with(., 'do') and 'do' = translate(., '0123456789', '') and string-length(.) &gt; 2) or (starts-with(., 'in') and 'in' = translate(., '0123456789', '') and string-length(.) &gt; 2) or (starts-with(., 'tl') and 'tl' = translate(., '0123456789', '') and string-length(.) &gt; 2) or .='toolsht' or .='trlist' or .='unschedc' or .='unschedchk']) and not(ancestor-or-self::ata-page-block[1]/@pb-name and string(ancestor-or-self::ata-page-block[1]/@pb-name)='intro00') and not(ancestor-or-self::page-block[1]/@pb-name and string(ancestor-or-self::page-block[1]/@pb-name)='intro00') and not(ancestor::ata-page-block/@pb-name[starts-with(., 'disassy') or starts-with(., 'fault')]) and not(ancestor::page-block/@pb-name[starts-with(., 'disassy') or starts-with(., 'fault')]) and not(ancestor::book[contains(@doctype,'oh')] and ancestor::ata-page-block/@pb-name[starts-with(., 'clean')]) and not(ancestor::book[contains(@doctype,'oh')] and ancestor::page-block/@pb-name[starts-with(., 'clean')]) and not(ancestor::ata-page-block/@pb-name[starts-with(., 'mainprac')]) and not(ancestor::page-block/@pb-name[starts-with(., 'mainprac')]) and not(ancestor::book[contains(@doctype,'oh')] and ancestor::ata-page-block/@pb-name[starts-with(., 'inspect')]) and not(ancestor::book[contains(@doctype,'oh')] and ancestor::page-block/@pb-name[starts-with(., 'inspect')]) and not(ancestor::ata-page-block/@pb-name[(starts-with(., 'di') and 'di' = translate(., '0123456789', '') and string-length(.) &gt; 2) or starts-with(.,'service')]) and not(ancestor::page-block/@pb-name[(starts-with(., 'di') and 'di' = translate(., '0123456789', '') and string-length(.) &gt; 2) or starts-with(.,'service')]) and not(ancestor::book[contains(@doctype,'oh')] and ancestor::ata-page-block/@pb-name[starts-with(., 'repair')]) and not(ancestor::book[contains(@doctype,'oh')] and ancestor::page-block/@pb-name[starts-with(., 'repair')]) and not(ancestor::book[contains(@doctype,'oh')] and ancestor::ata-page-block/@pb-name[starts-with(., 'test')]) and not(ancestor::book[contains(@doctype,'oh')] and ancestor::page-block/@pb-name[starts-with(., 'test')]) and not(ancestor::ata-page-block/@pb-name[(starts-with(., 'cl') and 'cl' = translate(., '0123456789', '') and string-length(.) &gt; 2) or .='install' or starts-with(.,'rem-inst') or (starts-with(., 'reminst') and 'reminst' = translate(., '0123456789', '') and string-length(.) &gt; 7) or .='remove' or (starts-with(., 'repair') and 'repair' = translate(., '0123456789', '') and string-length(.) &gt; 6)]) and not(ancestor::page-block/@pb-name[(starts-with(., 'cl') and 'cl' = translate(., '0123456789', '') and string-length(.) &gt; 2) or .='install' or starts-with(.,'rem-inst') or (starts-with(., 'reminst') and 'reminst' = translate(., '0123456789', '') and string-length(.) &gt; 7) or .='remove' or (starts-with(., 'repair') and 'repair' = translate(., '0123456789', '') and string-length(.) &gt; 6)]) and not(ancestor::ata-page-block/@pb-name[starts-with(., 'assy') or (starts-with(., 'ic') and 'ic' = translate(., '0123456789', '') and string-length(.) &gt; 2) or (starts-with(., 'te') and 'te' = translate(., '0123456789', '') and string-length(.) &gt; 2) or .='test']) and not(ancestor::page-block/@pb-name[starts-with(., 'assy') or (starts-with(., 'ic') and 'ic' = translate(., '0123456789', '') and string-length(.) &gt; 2) or (starts-with(., 'te') and 'te' = translate(., '0123456789', '') and string-length(.) &gt; 2) or .='test']) and (ancestor::ata-page-block/@pb-name[.='f-and-c' or starts-with(., 'inspect') or (starts-with(., 're') and 're' = translate(., '0123456789', '') and string-length(.) &gt; 2)])">
               <xsl:attribute name="_gte:count-as-id">cnt__figure^ata-page-block.cnt</xsl:attribute>
            </xsl:when>
            <xsl:when test="not(ancestor::book[contains(@doctype,'oh')] and ancestor::ata-page-block/@pb-name[.='service']) and not(ancestor::book[contains(@doctype,'oh')] and ancestor::page-block/@pb-name[.='service']) and not(ancestor::ata-page-block/@pb-name[.='00awl' or .='00intro' or .='airlim' or .='awl' or .='awlror' or .='chapsect' or .='consume' or .='d-and-o' or .='frontmatte' or .='howtouse' or .='00howtouse' or .='intro' or .='nut_option' or .='oplimits' or .='sblist' or .='schedchk' or .='spectool' or .='timelim' or .='title-page']) and not(ancestor::page-block/@pb-name[.='00awl' or .='00intro' or .='airlim' or .='awl' or .='awlror' or .='chapsect' or .='consume' or .='d-and-o' or .='frontmatte' or .='howtouse' or .='00howtouse' or .='intro' or .='nut_option' or .='oplimits' or .='sblist' or .='schedchk' or .='spectool' or .='timelim' or .='title-page']) and not(ancestor::ata-page-block/@pb-name[(starts-with(., 'do') and 'do' = translate(., '0123456789', '') and string-length(.) &gt; 2) or (starts-with(., 'in') and 'in' = translate(., '0123456789', '') and string-length(.) &gt; 2) or (starts-with(., 'tl') and 'tl' = translate(., '0123456789', '') and string-length(.) &gt; 2) or .='toolsht' or .='trlist' or .='unschedc' or .='unschedchk']) and not(ancestor::page-block/@pb-name[(starts-with(., 'do') and 'do' = translate(., '0123456789', '') and string-length(.) &gt; 2) or (starts-with(., 'in') and 'in' = translate(., '0123456789', '') and string-length(.) &gt; 2) or (starts-with(., 'tl') and 'tl' = translate(., '0123456789', '') and string-length(.) &gt; 2) or .='toolsht' or .='trlist' or .='unschedc' or .='unschedchk']) and not(ancestor-or-self::ata-page-block[1]/@pb-name and string(ancestor-or-self::ata-page-block[1]/@pb-name)='intro00') and not(ancestor-or-self::page-block[1]/@pb-name and string(ancestor-or-self::page-block[1]/@pb-name)='intro00') and not(ancestor::ata-page-block/@pb-name[starts-with(., 'disassy') or starts-with(., 'fault')]) and not(ancestor::page-block/@pb-name[starts-with(., 'disassy') or starts-with(., 'fault')]) and not(ancestor::book[contains(@doctype,'oh')] and ancestor::ata-page-block/@pb-name[starts-with(., 'clean')]) and not(ancestor::book[contains(@doctype,'oh')] and ancestor::page-block/@pb-name[starts-with(., 'clean')]) and not(ancestor::ata-page-block/@pb-name[starts-with(., 'mainprac')]) and not(ancestor::page-block/@pb-name[starts-with(., 'mainprac')]) and not(ancestor::book[contains(@doctype,'oh')] and ancestor::ata-page-block/@pb-name[starts-with(., 'inspect')]) and not(ancestor::book[contains(@doctype,'oh')] and ancestor::page-block/@pb-name[starts-with(., 'inspect')]) and not(ancestor::ata-page-block/@pb-name[(starts-with(., 'di') and 'di' = translate(., '0123456789', '') and string-length(.) &gt; 2) or starts-with(.,'service')]) and not(ancestor::page-block/@pb-name[(starts-with(., 'di') and 'di' = translate(., '0123456789', '') and string-length(.) &gt; 2) or starts-with(.,'service')]) and not(ancestor::book[contains(@doctype,'oh')] and ancestor::ata-page-block/@pb-name[starts-with(., 'repair')]) and not(ancestor::book[contains(@doctype,'oh')] and ancestor::page-block/@pb-name[starts-with(., 'repair')]) and not(ancestor::book[contains(@doctype,'oh')] and ancestor::ata-page-block/@pb-name[starts-with(., 'test')]) and not(ancestor::book[contains(@doctype,'oh')] and ancestor::page-block/@pb-name[starts-with(., 'test')]) and not(ancestor::ata-page-block/@pb-name[(starts-with(., 'cl') and 'cl' = translate(., '0123456789', '') and string-length(.) &gt; 2) or .='install' or starts-with(.,'rem-inst') or (starts-with(., 'reminst') and 'reminst' = translate(., '0123456789', '') and string-length(.) &gt; 7) or .='remove' or (starts-with(., 'repair') and 'repair' = translate(., '0123456789', '') and string-length(.) &gt; 6)]) and not(ancestor::page-block/@pb-name[(starts-with(., 'cl') and 'cl' = translate(., '0123456789', '') and string-length(.) &gt; 2) or .='install' or starts-with(.,'rem-inst') or (starts-with(., 'reminst') and 'reminst' = translate(., '0123456789', '') and string-length(.) &gt; 7) or .='remove' or (starts-with(., 'repair') and 'repair' = translate(., '0123456789', '') and string-length(.) &gt; 6)]) and not(ancestor::ata-page-block/@pb-name[starts-with(., 'assy') or (starts-with(., 'ic') and 'ic' = translate(., '0123456789', '') and string-length(.) &gt; 2) or (starts-with(., 'te') and 'te' = translate(., '0123456789', '') and string-length(.) &gt; 2) or .='test']) and (ancestor::page-block/@pb-name[starts-with(., 'assy') or (starts-with(., 'ic') and 'ic' = translate(., '0123456789', '') and string-length(.) &gt; 2) or (starts-with(., 'te') and 'te' = translate(., '0123456789', '') and string-length(.) &gt; 2) or .='test'])">
               <xsl:attribute name="_gte:count-as-id">cnt__figure^page-block.cnt</xsl:attribute>
            </xsl:when>
            <xsl:when test="not(ancestor::book[contains(@doctype,'oh')] and ancestor::ata-page-block/@pb-name[.='service']) and not(ancestor::book[contains(@doctype,'oh')] and ancestor::page-block/@pb-name[.='service']) and not(ancestor::ata-page-block/@pb-name[.='00awl' or .='00intro' or .='airlim' or .='awl' or .='awlror' or .='chapsect' or .='consume' or .='d-and-o' or .='frontmatte' or .='howtouse' or .='00howtouse' or .='intro' or .='nut_option' or .='oplimits' or .='sblist' or .='schedchk' or .='spectool' or .='timelim' or .='title-page']) and not(ancestor::page-block/@pb-name[.='00awl' or .='00intro' or .='airlim' or .='awl' or .='awlror' or .='chapsect' or .='consume' or .='d-and-o' or .='frontmatte' or .='howtouse' or .='00howtouse' or .='intro' or .='nut_option' or .='oplimits' or .='sblist' or .='schedchk' or .='spectool' or .='timelim' or .='title-page']) and not(ancestor::ata-page-block/@pb-name[(starts-with(., 'do') and 'do' = translate(., '0123456789', '') and string-length(.) &gt; 2) or (starts-with(., 'in') and 'in' = translate(., '0123456789', '') and string-length(.) &gt; 2) or (starts-with(., 'tl') and 'tl' = translate(., '0123456789', '') and string-length(.) &gt; 2) or .='toolsht' or .='trlist' or .='unschedc' or .='unschedchk']) and not(ancestor::page-block/@pb-name[(starts-with(., 'do') and 'do' = translate(., '0123456789', '') and string-length(.) &gt; 2) or (starts-with(., 'in') and 'in' = translate(., '0123456789', '') and string-length(.) &gt; 2) or (starts-with(., 'tl') and 'tl' = translate(., '0123456789', '') and string-length(.) &gt; 2) or .='toolsht' or .='trlist' or .='unschedc' or .='unschedchk']) and not(ancestor-or-self::ata-page-block[1]/@pb-name and string(ancestor-or-self::ata-page-block[1]/@pb-name)='intro00') and not(ancestor-or-self::page-block[1]/@pb-name and string(ancestor-or-self::page-block[1]/@pb-name)='intro00') and not(ancestor::ata-page-block/@pb-name[starts-with(., 'disassy') or starts-with(., 'fault')]) and not(ancestor::page-block/@pb-name[starts-with(., 'disassy') or starts-with(., 'fault')]) and not(ancestor::book[contains(@doctype,'oh')] and ancestor::ata-page-block/@pb-name[starts-with(., 'clean')]) and not(ancestor::book[contains(@doctype,'oh')] and ancestor::page-block/@pb-name[starts-with(., 'clean')]) and not(ancestor::ata-page-block/@pb-name[starts-with(., 'mainprac')]) and not(ancestor::page-block/@pb-name[starts-with(., 'mainprac')]) and not(ancestor::book[contains(@doctype,'oh')] and ancestor::ata-page-block/@pb-name[starts-with(., 'inspect')]) and not(ancestor::book[contains(@doctype,'oh')] and ancestor::page-block/@pb-name[starts-with(., 'inspect')]) and not(ancestor::ata-page-block/@pb-name[(starts-with(., 'di') and 'di' = translate(., '0123456789', '') and string-length(.) &gt; 2) or starts-with(.,'service')]) and not(ancestor::page-block/@pb-name[(starts-with(., 'di') and 'di' = translate(., '0123456789', '') and string-length(.) &gt; 2) or starts-with(.,'service')]) and not(ancestor::book[contains(@doctype,'oh')] and ancestor::ata-page-block/@pb-name[starts-with(., 'repair')]) and not(ancestor::book[contains(@doctype,'oh')] and ancestor::page-block/@pb-name[starts-with(., 'repair')]) and not(ancestor::book[contains(@doctype,'oh')] and ancestor::ata-page-block/@pb-name[starts-with(., 'test')]) and not(ancestor::book[contains(@doctype,'oh')] and ancestor::page-block/@pb-name[starts-with(., 'test')]) and not(ancestor::ata-page-block/@pb-name[(starts-with(., 'cl') and 'cl' = translate(., '0123456789', '') and string-length(.) &gt; 2) or .='install' or starts-with(.,'rem-inst') or (starts-with(., 'reminst') and 'reminst' = translate(., '0123456789', '') and string-length(.) &gt; 7) or .='remove' or (starts-with(., 'repair') and 'repair' = translate(., '0123456789', '') and string-length(.) &gt; 6)]) and not(ancestor::page-block/@pb-name[(starts-with(., 'cl') and 'cl' = translate(., '0123456789', '') and string-length(.) &gt; 2) or .='install' or starts-with(.,'rem-inst') or (starts-with(., 'reminst') and 'reminst' = translate(., '0123456789', '') and string-length(.) &gt; 7) or .='remove' or (starts-with(., 'repair') and 'repair' = translate(., '0123456789', '') and string-length(.) &gt; 6)]) and (ancestor::ata-page-block/@pb-name[starts-with(., 'assy') or (starts-with(., 'ic') and 'ic' = translate(., '0123456789', '') and string-length(.) &gt; 2) or (starts-with(., 'te') and 'te' = translate(., '0123456789', '') and string-length(.) &gt; 2) or .='test'])">
               <xsl:attribute name="_gte:count-as-id">cnt__figure^ata-page-block.cnt</xsl:attribute>
            </xsl:when>
            <xsl:when test="not(ancestor::book[contains(@doctype,'oh')] and ancestor::ata-page-block/@pb-name[.='service']) and not(ancestor::book[contains(@doctype,'oh')] and ancestor::page-block/@pb-name[.='service']) and not(ancestor::ata-page-block/@pb-name[.='00awl' or .='00intro' or .='airlim' or .='awl' or .='awlror' or .='chapsect' or .='consume' or .='d-and-o' or .='frontmatte' or .='howtouse' or .='00howtouse' or .='intro' or .='nut_option' or .='oplimits' or .='sblist' or .='schedchk' or .='spectool' or .='timelim' or .='title-page']) and not(ancestor::page-block/@pb-name[.='00awl' or .='00intro' or .='airlim' or .='awl' or .='awlror' or .='chapsect' or .='consume' or .='d-and-o' or .='frontmatte' or .='howtouse' or .='00howtouse' or .='intro' or .='nut_option' or .='oplimits' or .='sblist' or .='schedchk' or .='spectool' or .='timelim' or .='title-page']) and not(ancestor::ata-page-block/@pb-name[(starts-with(., 'do') and 'do' = translate(., '0123456789', '') and string-length(.) &gt; 2) or (starts-with(., 'in') and 'in' = translate(., '0123456789', '') and string-length(.) &gt; 2) or (starts-with(., 'tl') and 'tl' = translate(., '0123456789', '') and string-length(.) &gt; 2) or .='toolsht' or .='trlist' or .='unschedc' or .='unschedchk']) and not(ancestor::page-block/@pb-name[(starts-with(., 'do') and 'do' = translate(., '0123456789', '') and string-length(.) &gt; 2) or (starts-with(., 'in') and 'in' = translate(., '0123456789', '') and string-length(.) &gt; 2) or (starts-with(., 'tl') and 'tl' = translate(., '0123456789', '') and string-length(.) &gt; 2) or .='toolsht' or .='trlist' or .='unschedc' or .='unschedchk']) and not(ancestor-or-self::ata-page-block[1]/@pb-name and string(ancestor-or-self::ata-page-block[1]/@pb-name)='intro00') and not(ancestor-or-self::page-block[1]/@pb-name and string(ancestor-or-self::page-block[1]/@pb-name)='intro00') and not(ancestor::ata-page-block/@pb-name[starts-with(., 'disassy') or starts-with(., 'fault')]) and not(ancestor::page-block/@pb-name[starts-with(., 'disassy') or starts-with(., 'fault')]) and not(ancestor::book[contains(@doctype,'oh')] and ancestor::ata-page-block/@pb-name[starts-with(., 'clean')]) and not(ancestor::book[contains(@doctype,'oh')] and ancestor::page-block/@pb-name[starts-with(., 'clean')]) and not(ancestor::ata-page-block/@pb-name[starts-with(., 'mainprac')]) and not(ancestor::page-block/@pb-name[starts-with(., 'mainprac')]) and not(ancestor::book[contains(@doctype,'oh')] and ancestor::ata-page-block/@pb-name[starts-with(., 'inspect')]) and not(ancestor::book[contains(@doctype,'oh')] and ancestor::page-block/@pb-name[starts-with(., 'inspect')]) and not(ancestor::ata-page-block/@pb-name[(starts-with(., 'di') and 'di' = translate(., '0123456789', '') and string-length(.) &gt; 2) or starts-with(.,'service')]) and not(ancestor::page-block/@pb-name[(starts-with(., 'di') and 'di' = translate(., '0123456789', '') and string-length(.) &gt; 2) or starts-with(.,'service')]) and not(ancestor::book[contains(@doctype,'oh')] and ancestor::ata-page-block/@pb-name[starts-with(., 'repair')]) and not(ancestor::book[contains(@doctype,'oh')] and ancestor::page-block/@pb-name[starts-with(., 'repair')]) and not(ancestor::book[contains(@doctype,'oh')] and ancestor::ata-page-block/@pb-name[starts-with(., 'test')]) and not(ancestor::book[contains(@doctype,'oh')] and ancestor::page-block/@pb-name[starts-with(., 'test')]) and not(ancestor::ata-page-block/@pb-name[(starts-with(., 'cl') and 'cl' = translate(., '0123456789', '') and string-length(.) &gt; 2) or .='install' or starts-with(.,'rem-inst') or (starts-with(., 'reminst') and 'reminst' = translate(., '0123456789', '') and string-length(.) &gt; 7) or .='remove' or (starts-with(., 'repair') and 'repair' = translate(., '0123456789', '') and string-length(.) &gt; 6)]) and (ancestor::page-block/@pb-name[(starts-with(., 'cl') and 'cl' = translate(., '0123456789', '') and string-length(.) &gt; 2) or .='install' or starts-with(.,'rem-inst') or (starts-with(., 'reminst') and 'reminst' = translate(., '0123456789', '') and string-length(.) &gt; 7) or .='remove' or (starts-with(., 'repair') and 'repair' = translate(., '0123456789', '') and string-length(.) &gt; 6)])">
               <xsl:attribute name="_gte:count-as-id">cnt__figure^page-block.cnt</xsl:attribute>
            </xsl:when>
            <xsl:when test="not(ancestor::book[contains(@doctype,'oh')] and ancestor::ata-page-block/@pb-name[.='service']) and not(ancestor::book[contains(@doctype,'oh')] and ancestor::page-block/@pb-name[.='service']) and not(ancestor::ata-page-block/@pb-name[.='00awl' or .='00intro' or .='airlim' or .='awl' or .='awlror' or .='chapsect' or .='consume' or .='d-and-o' or .='frontmatte' or .='howtouse' or .='00howtouse' or .='intro' or .='nut_option' or .='oplimits' or .='sblist' or .='schedchk' or .='spectool' or .='timelim' or .='title-page']) and not(ancestor::page-block/@pb-name[.='00awl' or .='00intro' or .='airlim' or .='awl' or .='awlror' or .='chapsect' or .='consume' or .='d-and-o' or .='frontmatte' or .='howtouse' or .='00howtouse' or .='intro' or .='nut_option' or .='oplimits' or .='sblist' or .='schedchk' or .='spectool' or .='timelim' or .='title-page']) and not(ancestor::ata-page-block/@pb-name[(starts-with(., 'do') and 'do' = translate(., '0123456789', '') and string-length(.) &gt; 2) or (starts-with(., 'in') and 'in' = translate(., '0123456789', '') and string-length(.) &gt; 2) or (starts-with(., 'tl') and 'tl' = translate(., '0123456789', '') and string-length(.) &gt; 2) or .='toolsht' or .='trlist' or .='unschedc' or .='unschedchk']) and not(ancestor::page-block/@pb-name[(starts-with(., 'do') and 'do' = translate(., '0123456789', '') and string-length(.) &gt; 2) or (starts-with(., 'in') and 'in' = translate(., '0123456789', '') and string-length(.) &gt; 2) or (starts-with(., 'tl') and 'tl' = translate(., '0123456789', '') and string-length(.) &gt; 2) or .='toolsht' or .='trlist' or .='unschedc' or .='unschedchk']) and not(ancestor-or-self::ata-page-block[1]/@pb-name and string(ancestor-or-self::ata-page-block[1]/@pb-name)='intro00') and not(ancestor-or-self::page-block[1]/@pb-name and string(ancestor-or-self::page-block[1]/@pb-name)='intro00') and not(ancestor::ata-page-block/@pb-name[starts-with(., 'disassy') or starts-with(., 'fault')]) and not(ancestor::page-block/@pb-name[starts-with(., 'disassy') or starts-with(., 'fault')]) and not(ancestor::book[contains(@doctype,'oh')] and ancestor::ata-page-block/@pb-name[starts-with(., 'clean')]) and not(ancestor::book[contains(@doctype,'oh')] and ancestor::page-block/@pb-name[starts-with(., 'clean')]) and not(ancestor::ata-page-block/@pb-name[starts-with(., 'mainprac')]) and not(ancestor::page-block/@pb-name[starts-with(., 'mainprac')]) and not(ancestor::book[contains(@doctype,'oh')] and ancestor::ata-page-block/@pb-name[starts-with(., 'inspect')]) and not(ancestor::book[contains(@doctype,'oh')] and ancestor::page-block/@pb-name[starts-with(., 'inspect')]) and not(ancestor::ata-page-block/@pb-name[(starts-with(., 'di') and 'di' = translate(., '0123456789', '') and string-length(.) &gt; 2) or starts-with(.,'service')]) and not(ancestor::page-block/@pb-name[(starts-with(., 'di') and 'di' = translate(., '0123456789', '') and string-length(.) &gt; 2) or starts-with(.,'service')]) and not(ancestor::book[contains(@doctype,'oh')] and ancestor::ata-page-block/@pb-name[starts-with(., 'repair')]) and not(ancestor::book[contains(@doctype,'oh')] and ancestor::page-block/@pb-name[starts-with(., 'repair')]) and not(ancestor::book[contains(@doctype,'oh')] and ancestor::ata-page-block/@pb-name[starts-with(., 'test')]) and not(ancestor::book[contains(@doctype,'oh')] and ancestor::page-block/@pb-name[starts-with(., 'test')]) and (ancestor::ata-page-block/@pb-name[(starts-with(., 'cl') and 'cl' = translate(., '0123456789', '') and string-length(.) &gt; 2) or .='install' or starts-with(.,'rem-inst') or (starts-with(., 'reminst') and 'reminst' = translate(., '0123456789', '') and string-length(.) &gt; 7) or .='remove' or (starts-with(., 'repair') and 'repair' = translate(., '0123456789', '') and string-length(.) &gt; 6)])">
               <xsl:attribute name="_gte:count-as-id">cnt__figure^ata-page-block.cnt</xsl:attribute>
            </xsl:when>
            <xsl:when test="not(ancestor::book[contains(@doctype,'oh')] and ancestor::ata-page-block/@pb-name[.='service']) and not(ancestor::book[contains(@doctype,'oh')] and ancestor::page-block/@pb-name[.='service']) and not(ancestor::ata-page-block/@pb-name[.='00awl' or .='00intro' or .='airlim' or .='awl' or .='awlror' or .='chapsect' or .='consume' or .='d-and-o' or .='frontmatte' or .='howtouse' or .='00howtouse' or .='intro' or .='nut_option' or .='oplimits' or .='sblist' or .='schedchk' or .='spectool' or .='timelim' or .='title-page']) and not(ancestor::page-block/@pb-name[.='00awl' or .='00intro' or .='airlim' or .='awl' or .='awlror' or .='chapsect' or .='consume' or .='d-and-o' or .='frontmatte' or .='howtouse' or .='00howtouse' or .='intro' or .='nut_option' or .='oplimits' or .='sblist' or .='schedchk' or .='spectool' or .='timelim' or .='title-page']) and not(ancestor::ata-page-block/@pb-name[(starts-with(., 'do') and 'do' = translate(., '0123456789', '') and string-length(.) &gt; 2) or (starts-with(., 'in') and 'in' = translate(., '0123456789', '') and string-length(.) &gt; 2) or (starts-with(., 'tl') and 'tl' = translate(., '0123456789', '') and string-length(.) &gt; 2) or .='toolsht' or .='trlist' or .='unschedc' or .='unschedchk']) and not(ancestor::page-block/@pb-name[(starts-with(., 'do') and 'do' = translate(., '0123456789', '') and string-length(.) &gt; 2) or (starts-with(., 'in') and 'in' = translate(., '0123456789', '') and string-length(.) &gt; 2) or (starts-with(., 'tl') and 'tl' = translate(., '0123456789', '') and string-length(.) &gt; 2) or .='toolsht' or .='trlist' or .='unschedc' or .='unschedchk']) and not(ancestor-or-self::ata-page-block[1]/@pb-name and string(ancestor-or-self::ata-page-block[1]/@pb-name)='intro00') and not(ancestor-or-self::page-block[1]/@pb-name and string(ancestor-or-self::page-block[1]/@pb-name)='intro00') and not(ancestor::ata-page-block/@pb-name[starts-with(., 'disassy') or starts-with(., 'fault')]) and not(ancestor::page-block/@pb-name[starts-with(., 'disassy') or starts-with(., 'fault')]) and not(ancestor::book[contains(@doctype,'oh')] and ancestor::ata-page-block/@pb-name[starts-with(., 'clean')]) and not(ancestor::book[contains(@doctype,'oh')] and ancestor::page-block/@pb-name[starts-with(., 'clean')]) and not(ancestor::ata-page-block/@pb-name[starts-with(., 'mainprac')]) and not(ancestor::page-block/@pb-name[starts-with(., 'mainprac')]) and not(ancestor::book[contains(@doctype,'oh')] and ancestor::ata-page-block/@pb-name[starts-with(., 'inspect')]) and not(ancestor::book[contains(@doctype,'oh')] and ancestor::page-block/@pb-name[starts-with(., 'inspect')]) and not(ancestor::ata-page-block/@pb-name[(starts-with(., 'di') and 'di' = translate(., '0123456789', '') and string-length(.) &gt; 2) or starts-with(.,'service')]) and not(ancestor::page-block/@pb-name[(starts-with(., 'di') and 'di' = translate(., '0123456789', '') and string-length(.) &gt; 2) or starts-with(.,'service')]) and not(ancestor::book[contains(@doctype,'oh')] and ancestor::ata-page-block/@pb-name[starts-with(., 'repair')]) and not(ancestor::book[contains(@doctype,'oh')] and ancestor::page-block/@pb-name[starts-with(., 'repair')]) and not(ancestor::book[contains(@doctype,'oh')] and ancestor::ata-page-block/@pb-name[starts-with(., 'test')]) and (ancestor::book[contains(@doctype,'oh')] and ancestor::page-block/@pb-name[starts-with(., 'test')])">
               <xsl:attribute name="_gte:count-as-id">cnt__figure^page-block.cnt</xsl:attribute>
            </xsl:when>
            <xsl:when test="not(ancestor::book[contains(@doctype,'oh')] and ancestor::ata-page-block/@pb-name[.='service']) and not(ancestor::book[contains(@doctype,'oh')] and ancestor::page-block/@pb-name[.='service']) and not(ancestor::ata-page-block/@pb-name[.='00awl' or .='00intro' or .='airlim' or .='awl' or .='awlror' or .='chapsect' or .='consume' or .='d-and-o' or .='frontmatte' or .='howtouse' or .='00howtouse' or .='intro' or .='nut_option' or .='oplimits' or .='sblist' or .='schedchk' or .='spectool' or .='timelim' or .='title-page']) and not(ancestor::page-block/@pb-name[.='00awl' or .='00intro' or .='airlim' or .='awl' or .='awlror' or .='chapsect' or .='consume' or .='d-and-o' or .='frontmatte' or .='howtouse' or .='00howtouse' or .='intro' or .='nut_option' or .='oplimits' or .='sblist' or .='schedchk' or .='spectool' or .='timelim' or .='title-page']) and not(ancestor::ata-page-block/@pb-name[(starts-with(., 'do') and 'do' = translate(., '0123456789', '') and string-length(.) &gt; 2) or (starts-with(., 'in') and 'in' = translate(., '0123456789', '') and string-length(.) &gt; 2) or (starts-with(., 'tl') and 'tl' = translate(., '0123456789', '') and string-length(.) &gt; 2) or .='toolsht' or .='trlist' or .='unschedc' or .='unschedchk']) and not(ancestor::page-block/@pb-name[(starts-with(., 'do') and 'do' = translate(., '0123456789', '') and string-length(.) &gt; 2) or (starts-with(., 'in') and 'in' = translate(., '0123456789', '') and string-length(.) &gt; 2) or (starts-with(., 'tl') and 'tl' = translate(., '0123456789', '') and string-length(.) &gt; 2) or .='toolsht' or .='trlist' or .='unschedc' or .='unschedchk']) and not(ancestor-or-self::ata-page-block[1]/@pb-name and string(ancestor-or-self::ata-page-block[1]/@pb-name)='intro00') and not(ancestor-or-self::page-block[1]/@pb-name and string(ancestor-or-self::page-block[1]/@pb-name)='intro00') and not(ancestor::ata-page-block/@pb-name[starts-with(., 'disassy') or starts-with(., 'fault')]) and not(ancestor::page-block/@pb-name[starts-with(., 'disassy') or starts-with(., 'fault')]) and not(ancestor::book[contains(@doctype,'oh')] and ancestor::ata-page-block/@pb-name[starts-with(., 'clean')]) and not(ancestor::book[contains(@doctype,'oh')] and ancestor::page-block/@pb-name[starts-with(., 'clean')]) and not(ancestor::ata-page-block/@pb-name[starts-with(., 'mainprac')]) and not(ancestor::page-block/@pb-name[starts-with(., 'mainprac')]) and not(ancestor::book[contains(@doctype,'oh')] and ancestor::ata-page-block/@pb-name[starts-with(., 'inspect')]) and not(ancestor::book[contains(@doctype,'oh')] and ancestor::page-block/@pb-name[starts-with(., 'inspect')]) and not(ancestor::ata-page-block/@pb-name[(starts-with(., 'di') and 'di' = translate(., '0123456789', '') and string-length(.) &gt; 2) or starts-with(.,'service')]) and not(ancestor::page-block/@pb-name[(starts-with(., 'di') and 'di' = translate(., '0123456789', '') and string-length(.) &gt; 2) or starts-with(.,'service')]) and not(ancestor::book[contains(@doctype,'oh')] and ancestor::ata-page-block/@pb-name[starts-with(., 'repair')]) and not(ancestor::book[contains(@doctype,'oh')] and ancestor::page-block/@pb-name[starts-with(., 'repair')]) and (ancestor::book[contains(@doctype,'oh')] and ancestor::ata-page-block/@pb-name[starts-with(., 'test')])">
               <xsl:attribute name="_gte:count-as-id">cnt__figure^ata-page-block.cnt</xsl:attribute>
            </xsl:when>
            <xsl:when test="not(ancestor::book[contains(@doctype,'oh')] and ancestor::ata-page-block/@pb-name[.='service']) and not(ancestor::book[contains(@doctype,'oh')] and ancestor::page-block/@pb-name[.='service']) and not(ancestor::ata-page-block/@pb-name[.='00awl' or .='00intro' or .='airlim' or .='awl' or .='awlror' or .='chapsect' or .='consume' or .='d-and-o' or .='frontmatte' or .='howtouse' or .='00howtouse' or .='intro' or .='nut_option' or .='oplimits' or .='sblist' or .='schedchk' or .='spectool' or .='timelim' or .='title-page']) and not(ancestor::page-block/@pb-name[.='00awl' or .='00intro' or .='airlim' or .='awl' or .='awlror' or .='chapsect' or .='consume' or .='d-and-o' or .='frontmatte' or .='howtouse' or .='00howtouse' or .='intro' or .='nut_option' or .='oplimits' or .='sblist' or .='schedchk' or .='spectool' or .='timelim' or .='title-page']) and not(ancestor::ata-page-block/@pb-name[(starts-with(., 'do') and 'do' = translate(., '0123456789', '') and string-length(.) &gt; 2) or (starts-with(., 'in') and 'in' = translate(., '0123456789', '') and string-length(.) &gt; 2) or (starts-with(., 'tl') and 'tl' = translate(., '0123456789', '') and string-length(.) &gt; 2) or .='toolsht' or .='trlist' or .='unschedc' or .='unschedchk']) and not(ancestor::page-block/@pb-name[(starts-with(., 'do') and 'do' = translate(., '0123456789', '') and string-length(.) &gt; 2) or (starts-with(., 'in') and 'in' = translate(., '0123456789', '') and string-length(.) &gt; 2) or (starts-with(., 'tl') and 'tl' = translate(., '0123456789', '') and string-length(.) &gt; 2) or .='toolsht' or .='trlist' or .='unschedc' or .='unschedchk']) and not(ancestor-or-self::ata-page-block[1]/@pb-name and string(ancestor-or-self::ata-page-block[1]/@pb-name)='intro00') and not(ancestor-or-self::page-block[1]/@pb-name and string(ancestor-or-self::page-block[1]/@pb-name)='intro00') and not(ancestor::ata-page-block/@pb-name[starts-with(., 'disassy') or starts-with(., 'fault')]) and not(ancestor::page-block/@pb-name[starts-with(., 'disassy') or starts-with(., 'fault')]) and not(ancestor::book[contains(@doctype,'oh')] and ancestor::ata-page-block/@pb-name[starts-with(., 'clean')]) and not(ancestor::book[contains(@doctype,'oh')] and ancestor::page-block/@pb-name[starts-with(., 'clean')]) and not(ancestor::ata-page-block/@pb-name[starts-with(., 'mainprac')]) and not(ancestor::page-block/@pb-name[starts-with(., 'mainprac')]) and not(ancestor::book[contains(@doctype,'oh')] and ancestor::ata-page-block/@pb-name[starts-with(., 'inspect')]) and not(ancestor::book[contains(@doctype,'oh')] and ancestor::page-block/@pb-name[starts-with(., 'inspect')]) and not(ancestor::ata-page-block/@pb-name[(starts-with(., 'di') and 'di' = translate(., '0123456789', '') and string-length(.) &gt; 2) or starts-with(.,'service')]) and not(ancestor::page-block/@pb-name[(starts-with(., 'di') and 'di' = translate(., '0123456789', '') and string-length(.) &gt; 2) or starts-with(.,'service')]) and not(ancestor::book[contains(@doctype,'oh')] and ancestor::ata-page-block/@pb-name[starts-with(., 'repair')]) and (ancestor::book[contains(@doctype,'oh')] and ancestor::page-block/@pb-name[starts-with(., 'repair')])">
               <xsl:attribute name="_gte:count-as-id">cnt__figure^page-block.cnt</xsl:attribute>
            </xsl:when>
            <xsl:when test="not(ancestor::book[contains(@doctype,'oh')] and ancestor::ata-page-block/@pb-name[.='service']) and not(ancestor::book[contains(@doctype,'oh')] and ancestor::page-block/@pb-name[.='service']) and not(ancestor::ata-page-block/@pb-name[.='00awl' or .='00intro' or .='airlim' or .='awl' or .='awlror' or .='chapsect' or .='consume' or .='d-and-o' or .='frontmatte' or .='howtouse' or .='00howtouse' or .='intro' or .='nut_option' or .='oplimits' or .='sblist' or .='schedchk' or .='spectool' or .='timelim' or .='title-page']) and not(ancestor::page-block/@pb-name[.='00awl' or .='00intro' or .='airlim' or .='awl' or .='awlror' or .='chapsect' or .='consume' or .='d-and-o' or .='frontmatte' or .='howtouse' or .='00howtouse' or .='intro' or .='nut_option' or .='oplimits' or .='sblist' or .='schedchk' or .='spectool' or .='timelim' or .='title-page']) and not(ancestor::ata-page-block/@pb-name[(starts-with(., 'do') and 'do' = translate(., '0123456789', '') and string-length(.) &gt; 2) or (starts-with(., 'in') and 'in' = translate(., '0123456789', '') and string-length(.) &gt; 2) or (starts-with(., 'tl') and 'tl' = translate(., '0123456789', '') and string-length(.) &gt; 2) or .='toolsht' or .='trlist' or .='unschedc' or .='unschedchk']) and not(ancestor::page-block/@pb-name[(starts-with(., 'do') and 'do' = translate(., '0123456789', '') and string-length(.) &gt; 2) or (starts-with(., 'in') and 'in' = translate(., '0123456789', '') and string-length(.) &gt; 2) or (starts-with(., 'tl') and 'tl' = translate(., '0123456789', '') and string-length(.) &gt; 2) or .='toolsht' or .='trlist' or .='unschedc' or .='unschedchk']) and not(ancestor-or-self::ata-page-block[1]/@pb-name and string(ancestor-or-self::ata-page-block[1]/@pb-name)='intro00') and not(ancestor-or-self::page-block[1]/@pb-name and string(ancestor-or-self::page-block[1]/@pb-name)='intro00') and not(ancestor::ata-page-block/@pb-name[starts-with(., 'disassy') or starts-with(., 'fault')]) and not(ancestor::page-block/@pb-name[starts-with(., 'disassy') or starts-with(., 'fault')]) and not(ancestor::book[contains(@doctype,'oh')] and ancestor::ata-page-block/@pb-name[starts-with(., 'clean')]) and not(ancestor::book[contains(@doctype,'oh')] and ancestor::page-block/@pb-name[starts-with(., 'clean')]) and not(ancestor::ata-page-block/@pb-name[starts-with(., 'mainprac')]) and not(ancestor::page-block/@pb-name[starts-with(., 'mainprac')]) and not(ancestor::book[contains(@doctype,'oh')] and ancestor::ata-page-block/@pb-name[starts-with(., 'inspect')]) and not(ancestor::book[contains(@doctype,'oh')] and ancestor::page-block/@pb-name[starts-with(., 'inspect')]) and not(ancestor::ata-page-block/@pb-name[(starts-with(., 'di') and 'di' = translate(., '0123456789', '') and string-length(.) &gt; 2) or starts-with(.,'service')]) and not(ancestor::page-block/@pb-name[(starts-with(., 'di') and 'di' = translate(., '0123456789', '') and string-length(.) &gt; 2) or starts-with(.,'service')]) and (ancestor::book[contains(@doctype,'oh')] and ancestor::ata-page-block/@pb-name[starts-with(., 'repair')])">
               <xsl:attribute name="_gte:count-as-id">cnt__figure^ata-page-block.cnt</xsl:attribute>
            </xsl:when>
            <xsl:when test="not(ancestor::book[contains(@doctype,'oh')] and ancestor::ata-page-block/@pb-name[.='service']) and not(ancestor::book[contains(@doctype,'oh')] and ancestor::page-block/@pb-name[.='service']) and not(ancestor::ata-page-block/@pb-name[.='00awl' or .='00intro' or .='airlim' or .='awl' or .='awlror' or .='chapsect' or .='consume' or .='d-and-o' or .='frontmatte' or .='howtouse' or .='00howtouse' or .='intro' or .='nut_option' or .='oplimits' or .='sblist' or .='schedchk' or .='spectool' or .='timelim' or .='title-page']) and not(ancestor::page-block/@pb-name[.='00awl' or .='00intro' or .='airlim' or .='awl' or .='awlror' or .='chapsect' or .='consume' or .='d-and-o' or .='frontmatte' or .='howtouse' or .='00howtouse' or .='intro' or .='nut_option' or .='oplimits' or .='sblist' or .='schedchk' or .='spectool' or .='timelim' or .='title-page']) and not(ancestor::ata-page-block/@pb-name[(starts-with(., 'do') and 'do' = translate(., '0123456789', '') and string-length(.) &gt; 2) or (starts-with(., 'in') and 'in' = translate(., '0123456789', '') and string-length(.) &gt; 2) or (starts-with(., 'tl') and 'tl' = translate(., '0123456789', '') and string-length(.) &gt; 2) or .='toolsht' or .='trlist' or .='unschedc' or .='unschedchk']) and not(ancestor::page-block/@pb-name[(starts-with(., 'do') and 'do' = translate(., '0123456789', '') and string-length(.) &gt; 2) or (starts-with(., 'in') and 'in' = translate(., '0123456789', '') and string-length(.) &gt; 2) or (starts-with(., 'tl') and 'tl' = translate(., '0123456789', '') and string-length(.) &gt; 2) or .='toolsht' or .='trlist' or .='unschedc' or .='unschedchk']) and not(ancestor-or-self::ata-page-block[1]/@pb-name and string(ancestor-or-self::ata-page-block[1]/@pb-name)='intro00') and not(ancestor-or-self::page-block[1]/@pb-name and string(ancestor-or-self::page-block[1]/@pb-name)='intro00') and not(ancestor::ata-page-block/@pb-name[starts-with(., 'disassy') or starts-with(., 'fault')]) and not(ancestor::page-block/@pb-name[starts-with(., 'disassy') or starts-with(., 'fault')]) and not(ancestor::book[contains(@doctype,'oh')] and ancestor::ata-page-block/@pb-name[starts-with(., 'clean')]) and not(ancestor::book[contains(@doctype,'oh')] and ancestor::page-block/@pb-name[starts-with(., 'clean')]) and not(ancestor::ata-page-block/@pb-name[starts-with(., 'mainprac')]) and not(ancestor::page-block/@pb-name[starts-with(., 'mainprac')]) and not(ancestor::book[contains(@doctype,'oh')] and ancestor::ata-page-block/@pb-name[starts-with(., 'inspect')]) and not(ancestor::book[contains(@doctype,'oh')] and ancestor::page-block/@pb-name[starts-with(., 'inspect')]) and not(ancestor::ata-page-block/@pb-name[(starts-with(., 'di') and 'di' = translate(., '0123456789', '') and string-length(.) &gt; 2) or starts-with(.,'service')]) and (ancestor::page-block/@pb-name[(starts-with(., 'di') and 'di' = translate(., '0123456789', '') and string-length(.) &gt; 2) or starts-with(.,'service')])">
               <xsl:attribute name="_gte:count-as-id">cnt__figure^page-block.cnt</xsl:attribute>
            </xsl:when>
            <xsl:when test="not(ancestor::book[contains(@doctype,'oh')] and ancestor::ata-page-block/@pb-name[.='service']) and not(ancestor::book[contains(@doctype,'oh')] and ancestor::page-block/@pb-name[.='service']) and not(ancestor::ata-page-block/@pb-name[.='00awl' or .='00intro' or .='airlim' or .='awl' or .='awlror' or .='chapsect' or .='consume' or .='d-and-o' or .='frontmatte' or .='howtouse' or .='00howtouse' or .='intro' or .='nut_option' or .='oplimits' or .='sblist' or .='schedchk' or .='spectool' or .='timelim' or .='title-page']) and not(ancestor::page-block/@pb-name[.='00awl' or .='00intro' or .='airlim' or .='awl' or .='awlror' or .='chapsect' or .='consume' or .='d-and-o' or .='frontmatte' or .='howtouse' or .='00howtouse' or .='intro' or .='nut_option' or .='oplimits' or .='sblist' or .='schedchk' or .='spectool' or .='timelim' or .='title-page']) and not(ancestor::ata-page-block/@pb-name[(starts-with(., 'do') and 'do' = translate(., '0123456789', '') and string-length(.) &gt; 2) or (starts-with(., 'in') and 'in' = translate(., '0123456789', '') and string-length(.) &gt; 2) or (starts-with(., 'tl') and 'tl' = translate(., '0123456789', '') and string-length(.) &gt; 2) or .='toolsht' or .='trlist' or .='unschedc' or .='unschedchk']) and not(ancestor::page-block/@pb-name[(starts-with(., 'do') and 'do' = translate(., '0123456789', '') and string-length(.) &gt; 2) or (starts-with(., 'in') and 'in' = translate(., '0123456789', '') and string-length(.) &gt; 2) or (starts-with(., 'tl') and 'tl' = translate(., '0123456789', '') and string-length(.) &gt; 2) or .='toolsht' or .='trlist' or .='unschedc' or .='unschedchk']) and not(ancestor-or-self::ata-page-block[1]/@pb-name and string(ancestor-or-self::ata-page-block[1]/@pb-name)='intro00') and not(ancestor-or-self::page-block[1]/@pb-name and string(ancestor-or-self::page-block[1]/@pb-name)='intro00') and not(ancestor::ata-page-block/@pb-name[starts-with(., 'disassy') or starts-with(., 'fault')]) and not(ancestor::page-block/@pb-name[starts-with(., 'disassy') or starts-with(., 'fault')]) and not(ancestor::book[contains(@doctype,'oh')] and ancestor::ata-page-block/@pb-name[starts-with(., 'clean')]) and not(ancestor::book[contains(@doctype,'oh')] and ancestor::page-block/@pb-name[starts-with(., 'clean')]) and not(ancestor::ata-page-block/@pb-name[starts-with(., 'mainprac')]) and not(ancestor::page-block/@pb-name[starts-with(., 'mainprac')]) and not(ancestor::book[contains(@doctype,'oh')] and ancestor::ata-page-block/@pb-name[starts-with(., 'inspect')]) and not(ancestor::book[contains(@doctype,'oh')] and ancestor::page-block/@pb-name[starts-with(., 'inspect')]) and (ancestor::ata-page-block/@pb-name[(starts-with(., 'di') and 'di' = translate(., '0123456789', '') and string-length(.) &gt; 2) or starts-with(.,'service')])">
               <xsl:attribute name="_gte:count-as-id">cnt__figure^ata-page-block.cnt</xsl:attribute>
            </xsl:when>
            <xsl:when test="not(ancestor::book[contains(@doctype,'oh')] and ancestor::ata-page-block/@pb-name[.='service']) and not(ancestor::book[contains(@doctype,'oh')] and ancestor::page-block/@pb-name[.='service']) and not(ancestor::ata-page-block/@pb-name[.='00awl' or .='00intro' or .='airlim' or .='awl' or .='awlror' or .='chapsect' or .='consume' or .='d-and-o' or .='frontmatte' or .='howtouse' or .='00howtouse' or .='intro' or .='nut_option' or .='oplimits' or .='sblist' or .='schedchk' or .='spectool' or .='timelim' or .='title-page']) and not(ancestor::page-block/@pb-name[.='00awl' or .='00intro' or .='airlim' or .='awl' or .='awlror' or .='chapsect' or .='consume' or .='d-and-o' or .='frontmatte' or .='howtouse' or .='00howtouse' or .='intro' or .='nut_option' or .='oplimits' or .='sblist' or .='schedchk' or .='spectool' or .='timelim' or .='title-page']) and not(ancestor::ata-page-block/@pb-name[(starts-with(., 'do') and 'do' = translate(., '0123456789', '') and string-length(.) &gt; 2) or (starts-with(., 'in') and 'in' = translate(., '0123456789', '') and string-length(.) &gt; 2) or (starts-with(., 'tl') and 'tl' = translate(., '0123456789', '') and string-length(.) &gt; 2) or .='toolsht' or .='trlist' or .='unschedc' or .='unschedchk']) and not(ancestor::page-block/@pb-name[(starts-with(., 'do') and 'do' = translate(., '0123456789', '') and string-length(.) &gt; 2) or (starts-with(., 'in') and 'in' = translate(., '0123456789', '') and string-length(.) &gt; 2) or (starts-with(., 'tl') and 'tl' = translate(., '0123456789', '') and string-length(.) &gt; 2) or .='toolsht' or .='trlist' or .='unschedc' or .='unschedchk']) and not(ancestor-or-self::ata-page-block[1]/@pb-name and string(ancestor-or-self::ata-page-block[1]/@pb-name)='intro00') and not(ancestor-or-self::page-block[1]/@pb-name and string(ancestor-or-self::page-block[1]/@pb-name)='intro00') and not(ancestor::ata-page-block/@pb-name[starts-with(., 'disassy') or starts-with(., 'fault')]) and not(ancestor::page-block/@pb-name[starts-with(., 'disassy') or starts-with(., 'fault')]) and not(ancestor::book[contains(@doctype,'oh')] and ancestor::ata-page-block/@pb-name[starts-with(., 'clean')]) and not(ancestor::book[contains(@doctype,'oh')] and ancestor::page-block/@pb-name[starts-with(., 'clean')]) and not(ancestor::ata-page-block/@pb-name[starts-with(., 'mainprac')]) and not(ancestor::page-block/@pb-name[starts-with(., 'mainprac')]) and not(ancestor::book[contains(@doctype,'oh')] and ancestor::ata-page-block/@pb-name[starts-with(., 'inspect')]) and (ancestor::book[contains(@doctype,'oh')] and ancestor::page-block/@pb-name[starts-with(., 'inspect')])">
               <xsl:attribute name="_gte:count-as-id">cnt__figure^page-block.cnt</xsl:attribute>
            </xsl:when>
            <xsl:when test="not(ancestor::book[contains(@doctype,'oh')] and ancestor::ata-page-block/@pb-name[.='service']) and not(ancestor::book[contains(@doctype,'oh')] and ancestor::page-block/@pb-name[.='service']) and not(ancestor::ata-page-block/@pb-name[.='00awl' or .='00intro' or .='airlim' or .='awl' or .='awlror' or .='chapsect' or .='consume' or .='d-and-o' or .='frontmatte' or .='howtouse' or .='00howtouse' or .='intro' or .='nut_option' or .='oplimits' or .='sblist' or .='schedchk' or .='spectool' or .='timelim' or .='title-page']) and not(ancestor::page-block/@pb-name[.='00awl' or .='00intro' or .='airlim' or .='awl' or .='awlror' or .='chapsect' or .='consume' or .='d-and-o' or .='frontmatte' or .='howtouse' or .='00howtouse' or .='intro' or .='nut_option' or .='oplimits' or .='sblist' or .='schedchk' or .='spectool' or .='timelim' or .='title-page']) and not(ancestor::ata-page-block/@pb-name[(starts-with(., 'do') and 'do' = translate(., '0123456789', '') and string-length(.) &gt; 2) or (starts-with(., 'in') and 'in' = translate(., '0123456789', '') and string-length(.) &gt; 2) or (starts-with(., 'tl') and 'tl' = translate(., '0123456789', '') and string-length(.) &gt; 2) or .='toolsht' or .='trlist' or .='unschedc' or .='unschedchk']) and not(ancestor::page-block/@pb-name[(starts-with(., 'do') and 'do' = translate(., '0123456789', '') and string-length(.) &gt; 2) or (starts-with(., 'in') and 'in' = translate(., '0123456789', '') and string-length(.) &gt; 2) or (starts-with(., 'tl') and 'tl' = translate(., '0123456789', '') and string-length(.) &gt; 2) or .='toolsht' or .='trlist' or .='unschedc' or .='unschedchk']) and not(ancestor-or-self::ata-page-block[1]/@pb-name and string(ancestor-or-self::ata-page-block[1]/@pb-name)='intro00') and not(ancestor-or-self::page-block[1]/@pb-name and string(ancestor-or-self::page-block[1]/@pb-name)='intro00') and not(ancestor::ata-page-block/@pb-name[starts-with(., 'disassy') or starts-with(., 'fault')]) and not(ancestor::page-block/@pb-name[starts-with(., 'disassy') or starts-with(., 'fault')]) and not(ancestor::book[contains(@doctype,'oh')] and ancestor::ata-page-block/@pb-name[starts-with(., 'clean')]) and not(ancestor::book[contains(@doctype,'oh')] and ancestor::page-block/@pb-name[starts-with(., 'clean')]) and not(ancestor::ata-page-block/@pb-name[starts-with(., 'mainprac')]) and not(ancestor::page-block/@pb-name[starts-with(., 'mainprac')]) and (ancestor::book[contains(@doctype,'oh')] and ancestor::ata-page-block/@pb-name[starts-with(., 'inspect')])">
               <xsl:attribute name="_gte:count-as-id">cnt__figure^ata-page-block.cnt</xsl:attribute>
            </xsl:when>
            <xsl:when test="not(ancestor::book[contains(@doctype,'oh')] and ancestor::ata-page-block/@pb-name[.='service']) and not(ancestor::book[contains(@doctype,'oh')] and ancestor::page-block/@pb-name[.='service']) and not(ancestor::ata-page-block/@pb-name[.='00awl' or .='00intro' or .='airlim' or .='awl' or .='awlror' or .='chapsect' or .='consume' or .='d-and-o' or .='frontmatte' or .='howtouse' or .='00howtouse' or .='intro' or .='nut_option' or .='oplimits' or .='sblist' or .='schedchk' or .='spectool' or .='timelim' or .='title-page']) and not(ancestor::page-block/@pb-name[.='00awl' or .='00intro' or .='airlim' or .='awl' or .='awlror' or .='chapsect' or .='consume' or .='d-and-o' or .='frontmatte' or .='howtouse' or .='00howtouse' or .='intro' or .='nut_option' or .='oplimits' or .='sblist' or .='schedchk' or .='spectool' or .='timelim' or .='title-page']) and not(ancestor::ata-page-block/@pb-name[(starts-with(., 'do') and 'do' = translate(., '0123456789', '') and string-length(.) &gt; 2) or (starts-with(., 'in') and 'in' = translate(., '0123456789', '') and string-length(.) &gt; 2) or (starts-with(., 'tl') and 'tl' = translate(., '0123456789', '') and string-length(.) &gt; 2) or .='toolsht' or .='trlist' or .='unschedc' or .='unschedchk']) and not(ancestor::page-block/@pb-name[(starts-with(., 'do') and 'do' = translate(., '0123456789', '') and string-length(.) &gt; 2) or (starts-with(., 'in') and 'in' = translate(., '0123456789', '') and string-length(.) &gt; 2) or (starts-with(., 'tl') and 'tl' = translate(., '0123456789', '') and string-length(.) &gt; 2) or .='toolsht' or .='trlist' or .='unschedc' or .='unschedchk']) and not(ancestor-or-self::ata-page-block[1]/@pb-name and string(ancestor-or-self::ata-page-block[1]/@pb-name)='intro00') and not(ancestor-or-self::page-block[1]/@pb-name and string(ancestor-or-self::page-block[1]/@pb-name)='intro00') and not(ancestor::ata-page-block/@pb-name[starts-with(., 'disassy') or starts-with(., 'fault')]) and not(ancestor::page-block/@pb-name[starts-with(., 'disassy') or starts-with(., 'fault')]) and not(ancestor::book[contains(@doctype,'oh')] and ancestor::ata-page-block/@pb-name[starts-with(., 'clean')]) and not(ancestor::book[contains(@doctype,'oh')] and ancestor::page-block/@pb-name[starts-with(., 'clean')]) and not(ancestor::ata-page-block/@pb-name[starts-with(., 'mainprac')]) and (ancestor::page-block/@pb-name[starts-with(., 'mainprac')])">
               <xsl:attribute name="_gte:count-as-id">cnt__figure^page-block.cnt</xsl:attribute>
            </xsl:when>
            <xsl:when test="not(ancestor::book[contains(@doctype,'oh')] and ancestor::ata-page-block/@pb-name[.='service']) and not(ancestor::book[contains(@doctype,'oh')] and ancestor::page-block/@pb-name[.='service']) and not(ancestor::ata-page-block/@pb-name[.='00awl' or .='00intro' or .='airlim' or .='awl' or .='awlror' or .='chapsect' or .='consume' or .='d-and-o' or .='frontmatte' or .='howtouse' or .='00howtouse' or .='intro' or .='nut_option' or .='oplimits' or .='sblist' or .='schedchk' or .='spectool' or .='timelim' or .='title-page']) and not(ancestor::page-block/@pb-name[.='00awl' or .='00intro' or .='airlim' or .='awl' or .='awlror' or .='chapsect' or .='consume' or .='d-and-o' or .='frontmatte' or .='howtouse' or .='00howtouse' or .='intro' or .='nut_option' or .='oplimits' or .='sblist' or .='schedchk' or .='spectool' or .='timelim' or .='title-page']) and not(ancestor::ata-page-block/@pb-name[(starts-with(., 'do') and 'do' = translate(., '0123456789', '') and string-length(.) &gt; 2) or (starts-with(., 'in') and 'in' = translate(., '0123456789', '') and string-length(.) &gt; 2) or (starts-with(., 'tl') and 'tl' = translate(., '0123456789', '') and string-length(.) &gt; 2) or .='toolsht' or .='trlist' or .='unschedc' or .='unschedchk']) and not(ancestor::page-block/@pb-name[(starts-with(., 'do') and 'do' = translate(., '0123456789', '') and string-length(.) &gt; 2) or (starts-with(., 'in') and 'in' = translate(., '0123456789', '') and string-length(.) &gt; 2) or (starts-with(., 'tl') and 'tl' = translate(., '0123456789', '') and string-length(.) &gt; 2) or .='toolsht' or .='trlist' or .='unschedc' or .='unschedchk']) and not(ancestor-or-self::ata-page-block[1]/@pb-name and string(ancestor-or-self::ata-page-block[1]/@pb-name)='intro00') and not(ancestor-or-self::page-block[1]/@pb-name and string(ancestor-or-self::page-block[1]/@pb-name)='intro00') and not(ancestor::ata-page-block/@pb-name[starts-with(., 'disassy') or starts-with(., 'fault')]) and not(ancestor::page-block/@pb-name[starts-with(., 'disassy') or starts-with(., 'fault')]) and not(ancestor::book[contains(@doctype,'oh')] and ancestor::ata-page-block/@pb-name[starts-with(., 'clean')]) and not(ancestor::book[contains(@doctype,'oh')] and ancestor::page-block/@pb-name[starts-with(., 'clean')]) and (ancestor::ata-page-block/@pb-name[starts-with(., 'mainprac')])">
               <xsl:attribute name="_gte:count-as-id">cnt__figure^ata-page-block.cnt</xsl:attribute>
            </xsl:when>
            <xsl:when test="not(ancestor::book[contains(@doctype,'oh')] and ancestor::ata-page-block/@pb-name[.='service']) and not(ancestor::book[contains(@doctype,'oh')] and ancestor::page-block/@pb-name[.='service']) and not(ancestor::ata-page-block/@pb-name[.='00awl' or .='00intro' or .='airlim' or .='awl' or .='awlror' or .='chapsect' or .='consume' or .='d-and-o' or .='frontmatte' or .='howtouse' or .='00howtouse' or .='intro' or .='nut_option' or .='oplimits' or .='sblist' or .='schedchk' or .='spectool' or .='timelim' or .='title-page']) and not(ancestor::page-block/@pb-name[.='00awl' or .='00intro' or .='airlim' or .='awl' or .='awlror' or .='chapsect' or .='consume' or .='d-and-o' or .='frontmatte' or .='howtouse' or .='00howtouse' or .='intro' or .='nut_option' or .='oplimits' or .='sblist' or .='schedchk' or .='spectool' or .='timelim' or .='title-page']) and not(ancestor::ata-page-block/@pb-name[(starts-with(., 'do') and 'do' = translate(., '0123456789', '') and string-length(.) &gt; 2) or (starts-with(., 'in') and 'in' = translate(., '0123456789', '') and string-length(.) &gt; 2) or (starts-with(., 'tl') and 'tl' = translate(., '0123456789', '') and string-length(.) &gt; 2) or .='toolsht' or .='trlist' or .='unschedc' or .='unschedchk']) and not(ancestor::page-block/@pb-name[(starts-with(., 'do') and 'do' = translate(., '0123456789', '') and string-length(.) &gt; 2) or (starts-with(., 'in') and 'in' = translate(., '0123456789', '') and string-length(.) &gt; 2) or (starts-with(., 'tl') and 'tl' = translate(., '0123456789', '') and string-length(.) &gt; 2) or .='toolsht' or .='trlist' or .='unschedc' or .='unschedchk']) and not(ancestor-or-self::ata-page-block[1]/@pb-name and string(ancestor-or-self::ata-page-block[1]/@pb-name)='intro00') and not(ancestor-or-self::page-block[1]/@pb-name and string(ancestor-or-self::page-block[1]/@pb-name)='intro00') and not(ancestor::ata-page-block/@pb-name[starts-with(., 'disassy') or starts-with(., 'fault')]) and not(ancestor::page-block/@pb-name[starts-with(., 'disassy') or starts-with(., 'fault')]) and not(ancestor::book[contains(@doctype,'oh')] and ancestor::ata-page-block/@pb-name[starts-with(., 'clean')]) and (ancestor::book[contains(@doctype,'oh')] and ancestor::page-block/@pb-name[starts-with(., 'clean')])">
               <xsl:attribute name="_gte:count-as-id">cnt__figure^page-block.cnt</xsl:attribute>
            </xsl:when>
            <xsl:when test="not(ancestor::book[contains(@doctype,'oh')] and ancestor::ata-page-block/@pb-name[.='service']) and not(ancestor::book[contains(@doctype,'oh')] and ancestor::page-block/@pb-name[.='service']) and not(ancestor::ata-page-block/@pb-name[.='00awl' or .='00intro' or .='airlim' or .='awl' or .='awlror' or .='chapsect' or .='consume' or .='d-and-o' or .='frontmatte' or .='howtouse' or .='00howtouse' or .='intro' or .='nut_option' or .='oplimits' or .='sblist' or .='schedchk' or .='spectool' or .='timelim' or .='title-page']) and not(ancestor::page-block/@pb-name[.='00awl' or .='00intro' or .='airlim' or .='awl' or .='awlror' or .='chapsect' or .='consume' or .='d-and-o' or .='frontmatte' or .='howtouse' or .='00howtouse' or .='intro' or .='nut_option' or .='oplimits' or .='sblist' or .='schedchk' or .='spectool' or .='timelim' or .='title-page']) and not(ancestor::ata-page-block/@pb-name[(starts-with(., 'do') and 'do' = translate(., '0123456789', '') and string-length(.) &gt; 2) or (starts-with(., 'in') and 'in' = translate(., '0123456789', '') and string-length(.) &gt; 2) or (starts-with(., 'tl') and 'tl' = translate(., '0123456789', '') and string-length(.) &gt; 2) or .='toolsht' or .='trlist' or .='unschedc' or .='unschedchk']) and not(ancestor::page-block/@pb-name[(starts-with(., 'do') and 'do' = translate(., '0123456789', '') and string-length(.) &gt; 2) or (starts-with(., 'in') and 'in' = translate(., '0123456789', '') and string-length(.) &gt; 2) or (starts-with(., 'tl') and 'tl' = translate(., '0123456789', '') and string-length(.) &gt; 2) or .='toolsht' or .='trlist' or .='unschedc' or .='unschedchk']) and not(ancestor-or-self::ata-page-block[1]/@pb-name and string(ancestor-or-self::ata-page-block[1]/@pb-name)='intro00') and not(ancestor-or-self::page-block[1]/@pb-name and string(ancestor-or-self::page-block[1]/@pb-name)='intro00') and not(ancestor::ata-page-block/@pb-name[starts-with(., 'disassy') or starts-with(., 'fault')]) and not(ancestor::page-block/@pb-name[starts-with(., 'disassy') or starts-with(., 'fault')]) and (ancestor::book[contains(@doctype,'oh')] and ancestor::ata-page-block/@pb-name[starts-with(., 'clean')])">
               <xsl:attribute name="_gte:count-as-id">cnt__figure^ata-page-block.cnt</xsl:attribute>
            </xsl:when>
            <xsl:when test="not(ancestor::book[contains(@doctype,'oh')] and ancestor::ata-page-block/@pb-name[.='service']) and not(ancestor::book[contains(@doctype,'oh')] and ancestor::page-block/@pb-name[.='service']) and not(ancestor::ata-page-block/@pb-name[.='00awl' or .='00intro' or .='airlim' or .='awl' or .='awlror' or .='chapsect' or .='consume' or .='d-and-o' or .='frontmatte' or .='howtouse' or .='00howtouse' or .='intro' or .='nut_option' or .='oplimits' or .='sblist' or .='schedchk' or .='spectool' or .='timelim' or .='title-page']) and not(ancestor::page-block/@pb-name[.='00awl' or .='00intro' or .='airlim' or .='awl' or .='awlror' or .='chapsect' or .='consume' or .='d-and-o' or .='frontmatte' or .='howtouse' or .='00howtouse' or .='intro' or .='nut_option' or .='oplimits' or .='sblist' or .='schedchk' or .='spectool' or .='timelim' or .='title-page']) and not(ancestor::ata-page-block/@pb-name[(starts-with(., 'do') and 'do' = translate(., '0123456789', '') and string-length(.) &gt; 2) or (starts-with(., 'in') and 'in' = translate(., '0123456789', '') and string-length(.) &gt; 2) or (starts-with(., 'tl') and 'tl' = translate(., '0123456789', '') and string-length(.) &gt; 2) or .='toolsht' or .='trlist' or .='unschedc' or .='unschedchk']) and not(ancestor::page-block/@pb-name[(starts-with(., 'do') and 'do' = translate(., '0123456789', '') and string-length(.) &gt; 2) or (starts-with(., 'in') and 'in' = translate(., '0123456789', '') and string-length(.) &gt; 2) or (starts-with(., 'tl') and 'tl' = translate(., '0123456789', '') and string-length(.) &gt; 2) or .='toolsht' or .='trlist' or .='unschedc' or .='unschedchk']) and not(ancestor-or-self::ata-page-block[1]/@pb-name and string(ancestor-or-self::ata-page-block[1]/@pb-name)='intro00') and not(ancestor-or-self::page-block[1]/@pb-name and string(ancestor-or-self::page-block[1]/@pb-name)='intro00') and not(ancestor::ata-page-block/@pb-name[starts-with(., 'disassy') or starts-with(., 'fault')]) and (ancestor::page-block/@pb-name[starts-with(., 'disassy') or starts-with(., 'fault')])">
               <xsl:attribute name="_gte:count-as-id">cnt__figure^page-block.cnt</xsl:attribute>
            </xsl:when>
            <xsl:when test="not(ancestor::book[contains(@doctype,'oh')] and ancestor::ata-page-block/@pb-name[.='service']) and not(ancestor::book[contains(@doctype,'oh')] and ancestor::page-block/@pb-name[.='service']) and not(ancestor::ata-page-block/@pb-name[.='00awl' or .='00intro' or .='airlim' or .='awl' or .='awlror' or .='chapsect' or .='consume' or .='d-and-o' or .='frontmatte' or .='howtouse' or .='00howtouse' or .='intro' or .='nut_option' or .='oplimits' or .='sblist' or .='schedchk' or .='spectool' or .='timelim' or .='title-page']) and not(ancestor::page-block/@pb-name[.='00awl' or .='00intro' or .='airlim' or .='awl' or .='awlror' or .='chapsect' or .='consume' or .='d-and-o' or .='frontmatte' or .='howtouse' or .='00howtouse' or .='intro' or .='nut_option' or .='oplimits' or .='sblist' or .='schedchk' or .='spectool' or .='timelim' or .='title-page']) and not(ancestor::ata-page-block/@pb-name[(starts-with(., 'do') and 'do' = translate(., '0123456789', '') and string-length(.) &gt; 2) or (starts-with(., 'in') and 'in' = translate(., '0123456789', '') and string-length(.) &gt; 2) or (starts-with(., 'tl') and 'tl' = translate(., '0123456789', '') and string-length(.) &gt; 2) or .='toolsht' or .='trlist' or .='unschedc' or .='unschedchk']) and not(ancestor::page-block/@pb-name[(starts-with(., 'do') and 'do' = translate(., '0123456789', '') and string-length(.) &gt; 2) or (starts-with(., 'in') and 'in' = translate(., '0123456789', '') and string-length(.) &gt; 2) or (starts-with(., 'tl') and 'tl' = translate(., '0123456789', '') and string-length(.) &gt; 2) or .='toolsht' or .='trlist' or .='unschedc' or .='unschedchk']) and not(ancestor-or-self::ata-page-block[1]/@pb-name and string(ancestor-or-self::ata-page-block[1]/@pb-name)='intro00') and not(ancestor-or-self::page-block[1]/@pb-name and string(ancestor-or-self::page-block[1]/@pb-name)='intro00') and (ancestor::ata-page-block/@pb-name[starts-with(., 'disassy') or starts-with(., 'fault')])">
               <xsl:attribute name="_gte:count-as-id">cnt__figure^ata-page-block.cnt</xsl:attribute>
            </xsl:when>
            <xsl:when test="not(ancestor::book[contains(@doctype,'oh')] and ancestor::ata-page-block/@pb-name[.='service']) and not(ancestor::book[contains(@doctype,'oh')] and ancestor::page-block/@pb-name[.='service']) and not(ancestor::ata-page-block/@pb-name[.='00awl' or .='00intro' or .='airlim' or .='awl' or .='awlror' or .='chapsect' or .='consume' or .='d-and-o' or .='frontmatte' or .='howtouse' or .='00howtouse' or .='intro' or .='nut_option' or .='oplimits' or .='sblist' or .='schedchk' or .='spectool' or .='timelim' or .='title-page']) and not(ancestor::page-block/@pb-name[.='00awl' or .='00intro' or .='airlim' or .='awl' or .='awlror' or .='chapsect' or .='consume' or .='d-and-o' or .='frontmatte' or .='howtouse' or .='00howtouse' or .='intro' or .='nut_option' or .='oplimits' or .='sblist' or .='schedchk' or .='spectool' or .='timelim' or .='title-page']) and not(ancestor::ata-page-block/@pb-name[(starts-with(., 'do') and 'do' = translate(., '0123456789', '') and string-length(.) &gt; 2) or (starts-with(., 'in') and 'in' = translate(., '0123456789', '') and string-length(.) &gt; 2) or (starts-with(., 'tl') and 'tl' = translate(., '0123456789', '') and string-length(.) &gt; 2) or .='toolsht' or .='trlist' or .='unschedc' or .='unschedchk']) and not(ancestor::page-block/@pb-name[(starts-with(., 'do') and 'do' = translate(., '0123456789', '') and string-length(.) &gt; 2) or (starts-with(., 'in') and 'in' = translate(., '0123456789', '') and string-length(.) &gt; 2) or (starts-with(., 'tl') and 'tl' = translate(., '0123456789', '') and string-length(.) &gt; 2) or .='toolsht' or .='trlist' or .='unschedc' or .='unschedchk']) and not(ancestor-or-self::ata-page-block[1]/@pb-name and string(ancestor-or-self::ata-page-block[1]/@pb-name)='intro00') and (ancestor-or-self::page-block[1]/@pb-name and string(ancestor-or-self::page-block[1]/@pb-name)='intro00')">
               <xsl:attribute name="_gte:count-as-id">cnt__figure^page-block.cnt</xsl:attribute>
            </xsl:when>
            <xsl:when test="not(ancestor::book[contains(@doctype,'oh')] and ancestor::ata-page-block/@pb-name[.='service']) and not(ancestor::book[contains(@doctype,'oh')] and ancestor::page-block/@pb-name[.='service']) and not(ancestor::ata-page-block/@pb-name[.='00awl' or .='00intro' or .='airlim' or .='awl' or .='awlror' or .='chapsect' or .='consume' or .='d-and-o' or .='frontmatte' or .='howtouse' or .='00howtouse' or .='intro' or .='nut_option' or .='oplimits' or .='sblist' or .='schedchk' or .='spectool' or .='timelim' or .='title-page']) and not(ancestor::page-block/@pb-name[.='00awl' or .='00intro' or .='airlim' or .='awl' or .='awlror' or .='chapsect' or .='consume' or .='d-and-o' or .='frontmatte' or .='howtouse' or .='00howtouse' or .='intro' or .='nut_option' or .='oplimits' or .='sblist' or .='schedchk' or .='spectool' or .='timelim' or .='title-page']) and not(ancestor::ata-page-block/@pb-name[(starts-with(., 'do') and 'do' = translate(., '0123456789', '') and string-length(.) &gt; 2) or (starts-with(., 'in') and 'in' = translate(., '0123456789', '') and string-length(.) &gt; 2) or (starts-with(., 'tl') and 'tl' = translate(., '0123456789', '') and string-length(.) &gt; 2) or .='toolsht' or .='trlist' or .='unschedc' or .='unschedchk']) and not(ancestor::page-block/@pb-name[(starts-with(., 'do') and 'do' = translate(., '0123456789', '') and string-length(.) &gt; 2) or (starts-with(., 'in') and 'in' = translate(., '0123456789', '') and string-length(.) &gt; 2) or (starts-with(., 'tl') and 'tl' = translate(., '0123456789', '') and string-length(.) &gt; 2) or .='toolsht' or .='trlist' or .='unschedc' or .='unschedchk']) and (ancestor-or-self::ata-page-block[1]/@pb-name and string(ancestor-or-self::ata-page-block[1]/@pb-name)='intro00')">
               <xsl:attribute name="_gte:count-as-id">cnt__figure^ata-page-block.cnt</xsl:attribute>
            </xsl:when>
            <xsl:when test="not(ancestor::book[contains(@doctype,'oh')] and ancestor::ata-page-block/@pb-name[.='service']) and not(ancestor::book[contains(@doctype,'oh')] and ancestor::page-block/@pb-name[.='service']) and not(ancestor::ata-page-block/@pb-name[.='00awl' or .='00intro' or .='airlim' or .='awl' or .='awlror' or .='chapsect' or .='consume' or .='d-and-o' or .='frontmatte' or .='howtouse' or .='00howtouse' or .='intro' or .='nut_option' or .='oplimits' or .='sblist' or .='schedchk' or .='spectool' or .='timelim' or .='title-page']) and not(ancestor::page-block/@pb-name[.='00awl' or .='00intro' or .='airlim' or .='awl' or .='awlror' or .='chapsect' or .='consume' or .='d-and-o' or .='frontmatte' or .='howtouse' or .='00howtouse' or .='intro' or .='nut_option' or .='oplimits' or .='sblist' or .='schedchk' or .='spectool' or .='timelim' or .='title-page']) and not(ancestor::ata-page-block/@pb-name[(starts-with(., 'do') and 'do' = translate(., '0123456789', '') and string-length(.) &gt; 2) or (starts-with(., 'in') and 'in' = translate(., '0123456789', '') and string-length(.) &gt; 2) or (starts-with(., 'tl') and 'tl' = translate(., '0123456789', '') and string-length(.) &gt; 2) or .='toolsht' or .='trlist' or .='unschedc' or .='unschedchk']) and (ancestor::page-block/@pb-name[(starts-with(., 'do') and 'do' = translate(., '0123456789', '') and string-length(.) &gt; 2) or (starts-with(., 'in') and 'in' = translate(., '0123456789', '') and string-length(.) &gt; 2) or (starts-with(., 'tl') and 'tl' = translate(., '0123456789', '') and string-length(.) &gt; 2) or .='toolsht' or .='trlist' or .='unschedc' or .='unschedchk'])">
               <xsl:attribute name="_gte:count-as-id">cnt__figure^page-block.cnt</xsl:attribute>
            </xsl:when>
            <xsl:when test="not(ancestor::book[contains(@doctype,'oh')] and ancestor::ata-page-block/@pb-name[.='service']) and not(ancestor::book[contains(@doctype,'oh')] and ancestor::page-block/@pb-name[.='service']) and not(ancestor::ata-page-block/@pb-name[.='00awl' or .='00intro' or .='airlim' or .='awl' or .='awlror' or .='chapsect' or .='consume' or .='d-and-o' or .='frontmatte' or .='howtouse' or .='00howtouse' or .='intro' or .='nut_option' or .='oplimits' or .='sblist' or .='schedchk' or .='spectool' or .='timelim' or .='title-page']) and not(ancestor::page-block/@pb-name[.='00awl' or .='00intro' or .='airlim' or .='awl' or .='awlror' or .='chapsect' or .='consume' or .='d-and-o' or .='frontmatte' or .='howtouse' or .='00howtouse' or .='intro' or .='nut_option' or .='oplimits' or .='sblist' or .='schedchk' or .='spectool' or .='timelim' or .='title-page']) and (ancestor::ata-page-block/@pb-name[(starts-with(., 'do') and 'do' = translate(., '0123456789', '') and string-length(.) &gt; 2) or (starts-with(., 'in') and 'in' = translate(., '0123456789', '') and string-length(.) &gt; 2) or (starts-with(., 'tl') and 'tl' = translate(., '0123456789', '') and string-length(.) &gt; 2) or .='toolsht' or .='trlist' or .='unschedc' or .='unschedchk'])">
               <xsl:attribute name="_gte:count-as-id">cnt__figure^ata-page-block.cnt</xsl:attribute>
            </xsl:when>
            <xsl:when test="not(ancestor::book[contains(@doctype,'oh')] and ancestor::ata-page-block/@pb-name[.='service']) and not(ancestor::book[contains(@doctype,'oh')] and ancestor::page-block/@pb-name[.='service']) and not(ancestor::ata-page-block/@pb-name[.='00awl' or .='00intro' or .='airlim' or .='awl' or .='awlror' or .='chapsect' or .='consume' or .='d-and-o' or .='frontmatte' or .='howtouse' or .='00howtouse' or .='intro' or .='nut_option' or .='oplimits' or .='sblist' or .='schedchk' or .='spectool' or .='timelim' or .='title-page']) and (ancestor::page-block/@pb-name[.='00awl' or .='00intro' or .='airlim' or .='awl' or .='awlror' or .='chapsect' or .='consume' or .='d-and-o' or .='frontmatte' or .='howtouse' or .='00howtouse' or .='intro' or .='nut_option' or .='oplimits' or .='sblist' or .='schedchk' or .='spectool' or .='timelim' or .='title-page'])">
               <xsl:attribute name="_gte:count-as-id">cnt__figure^page-block.cnt</xsl:attribute>
            </xsl:when>
            <xsl:when test="not(ancestor::book[contains(@doctype,'oh')] and ancestor::ata-page-block/@pb-name[.='service']) and not(ancestor::book[contains(@doctype,'oh')] and ancestor::page-block/@pb-name[.='service']) and (ancestor::ata-page-block/@pb-name[.='00awl' or .='00intro' or .='airlim' or .='awl' or .='awlror' or .='chapsect' or .='consume' or .='d-and-o' or .='frontmatte' or .='howtouse' or .='00howtouse' or .='intro' or .='nut_option' or .='oplimits' or .='sblist' or .='schedchk' or .='spectool' or .='timelim' or .='title-page'])">
               <xsl:attribute name="_gte:count-as-id">cnt__figure^ata-page-block.cnt</xsl:attribute>
            </xsl:when>
            <xsl:when test="not(ancestor::book[contains(@doctype,'oh')] and ancestor::ata-page-block/@pb-name[.='service']) and (ancestor::book[contains(@doctype,'oh')] and ancestor::page-block/@pb-name[.='service'])"/>
            <xsl:when test="ancestor::book[contains(@doctype,'oh')] and ancestor::ata-page-block/@pb-name[.='service']"/>
            <xsl:when test="true()"><!--This is the "otherwise" clause, but there may be no when's--><!--We emit this even though we do nothing here to avoid a possible empty xsl:choose--></xsl:when>
         </xsl:choose>
         <xsl:apply-templates select="@*|node()" mode="set-countas"/>
      </xsl:copy>
   </xsl:template>

<xsl:template match="pbfmatr/title" mode="set-countas" priority="40">
      <xsl:copy>
         <xsl:apply-templates select="@*|node()" mode="set-countas"/>
      </xsl:copy>
   </xsl:template>

<xsl:template match="pwcpbfront/title" mode="set-countas" priority="39">
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
            <xsl:when test="(ancestor-or-self::table[1]/@role and string(ancestor-or-self::table[1]/@role)='torque-and-stretch') or (ancestor-or-self::table[1]/@role and string(ancestor-or-self::table[1]/@role)='spec-assem')"/>
            <xsl:when test="true()">
               <!--This is the "otherwise" clause, but there may be no when's-->
               <xsl:attribute name="_gte:count-as-id">subpara</xsl:attribute>
            </xsl:when>
         </xsl:choose>
         <xsl:apply-templates select="@*|node()" mode="set-countas"/>
      </xsl:copy>
   </xsl:template>

<xsl:template match="intro/title" mode="set-countas" priority="36">
      <xsl:copy>
         <xsl:apply-templates select="@*|node()" mode="set-countas"/>
      </xsl:copy>
   </xsl:template>

<xsl:template match="pwcspblist/title" mode="set-countas" priority="35">
      <xsl:copy>
         <xsl:apply-templates select="@*|node()" mode="set-countas"/>
      </xsl:copy>
   </xsl:template>

<xsl:template match="taskproc/title" mode="set-countas" priority="34">
      <xsl:copy>
         <xsl:attribute name="_gte:count-as-id">subtask</xsl:attribute>
         <xsl:apply-templates select="@*|node()" mode="set-countas"/>
      </xsl:copy>
   </xsl:template>

<xsl:template match="nutopt/title" mode="set-countas" priority="32">
      <xsl:copy>
         <xsl:apply-templates mode="set-countas" select="@*|node()"> </xsl:apply-templates>
      </xsl:copy>
   </xsl:template>

<xsl:template match="sblist/title" mode="set-countas" priority="32">
      <xsl:copy>
         <xsl:apply-templates select="@*|node()" mode="set-countas"/>
      </xsl:copy>
   </xsl:template>

<xsl:template match="pwcni/title" mode="set-countas" priority="31">
      <xsl:copy>
         <xsl:apply-templates select="@*|node()" mode="set-countas"/>
      </xsl:copy>
   </xsl:template>

<xsl:template match="vendlist/title" mode="set-countas" priority="30">
      <xsl:copy>
         <xsl:apply-templates select="@*|node()" mode="set-countas"/>
      </xsl:copy>
   </xsl:template>

<xsl:template match="pgblk/title" mode="set-countas" priority="29">
      <xsl:copy>
         <xsl:apply-templates select="@*|node()" mode="set-countas"/>
      </xsl:copy>
   </xsl:template>

<xsl:template match="pwcchapsect-item/title" mode="set-countas" priority="28">
      <xsl:copy>
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

<xsl:template match="fits/title" mode="set-countas" priority="25">
      <xsl:copy>
         <xsl:apply-templates select="@*|node()" mode="set-countas"/>
      </xsl:copy>
   </xsl:template>

<xsl:template match="task/title" mode="set-countas" priority="24">
      <xsl:copy>
         <xsl:attribute name="_gte:count-as-id">task</xsl:attribute>
         <xsl:apply-templates mode="set-countas" select="@*|node()"> </xsl:apply-templates>
      </xsl:copy>
   </xsl:template>

<xsl:template match="howtouse/title" mode="set-countas" priority="23">
      <xsl:copy>
         <xsl:apply-templates select="@*|node()" mode="set-countas"/>
      </xsl:copy>
   </xsl:template>

<xsl:template match="highlights/title" mode="set-countas" priority="22">
      <xsl:copy>
         <xsl:apply-templates select="@*|node()" mode="set-countas"/>
      </xsl:copy>
   </xsl:template>

<xsl:template match="lof-item/title" mode="set-countas" priority="21">
      <xsl:copy>
         <xsl:apply-templates select="@*|node()" mode="set-countas"/>
      </xsl:copy>
   </xsl:template>

<xsl:template match="lot-item/title" mode="set-countas" priority="20">
      <xsl:copy>
         <xsl:apply-templates select="@*|node()" mode="set-countas"/>
      </xsl:copy>
   </xsl:template>

<xsl:template match="lot/title" mode="set-countas" priority="19">
      <xsl:copy>
         <xsl:apply-templates select="@*|node()" mode="set-countas"/>
      </xsl:copy>
   </xsl:template>

<xsl:template match="lof/title" mode="set-countas" priority="18">
      <xsl:copy>
         <xsl:apply-templates select="@*|node()" mode="set-countas"/>
      </xsl:copy>
   </xsl:template>

<xsl:template match="table//procedure//title" mode="set-countas" priority="17">
      <xsl:copy>
         <xsl:apply-templates select="@*|node()" mode="set-countas"/>
      </xsl:copy>
   </xsl:template>

<xsl:template match="torque-and-stretch/title" mode="set-countas" priority="16">
      <xsl:copy>
         <xsl:apply-templates select="@*|node()" mode="set-countas"/>
      </xsl:copy>
   </xsl:template>

<xsl:template match="spec-tool-table/title" mode="set-countas" priority="15">
      <xsl:copy>
         <xsl:apply-templates select="@*|node()" mode="set-countas"/>
      </xsl:copy>
   </xsl:template>

<xsl:template match="spb-list/title" mode="set-countas" priority="14">
      <xsl:copy>
         <xsl:apply-templates select="@*|node()" mode="set-countas"/>
      </xsl:copy>
   </xsl:template>

<xsl:template match="subject/title" mode="set-countas" priority="13">
      <xsl:copy>
         <xsl:apply-templates select="@*|node()" mode="set-countas"/>
      </xsl:copy>
   </xsl:template>

<xsl:template match="section/title" mode="set-countas" priority="12">
      <xsl:copy>
         <xsl:apply-templates select="@*|node()" mode="set-countas"/>
      </xsl:copy>
   </xsl:template>

<xsl:template match="page-block/title" mode="set-countas" priority="11">
      <xsl:copy>
         <xsl:apply-templates select="@*|node()" mode="set-countas"/>
      </xsl:copy>
   </xsl:template>

<xsl:template match="service-bull-list/title" mode="set-countas" priority="10">
      <xsl:copy>
         <xsl:apply-templates select="@*|node()" mode="set-countas"/>
      </xsl:copy>
   </xsl:template>

<xsl:template match="module/title" mode="set-countas" priority="9">
      <xsl:copy>
         <xsl:apply-templates select="@*|node()" mode="set-countas"/>
      </xsl:copy>
   </xsl:template>

<xsl:template match="frontmatter/title" mode="set-countas" priority="8">
      <xsl:copy>
         <xsl:apply-templates select="@*|node()" mode="set-countas"/>
      </xsl:copy>
   </xsl:template>

<xsl:template match="num-index/title" mode="set-countas" priority="7">
      <xsl:copy>
         <xsl:apply-templates select="@*|node()" mode="set-countas"/>
      </xsl:copy>
   </xsl:template>

<xsl:template match="table[@display='expand']/title" mode="set-countas" priority="6">
      <xsl:copy>
         <xsl:choose>
            <xsl:when test="(ancestor-or-self::table[1]/@tabstyle and string(ancestor-or-self::table[1]/@tabstyle)='fits-and-clears') and (/ata-page-block//table/title)">
               <xsl:attribute name="_gte:count-as-id">npara-ata</xsl:attribute>
            </xsl:when>
            <xsl:when test="(ancestor-or-self::table[1]/@tabstyle and string(ancestor-or-self::table[1]/@tabstyle)='fits-and-clears') and (/page-block//table/title)">
               <xsl:attribute name="_gte:count-as-id">npara</xsl:attribute>
            </xsl:when>
            <xsl:when test="not(ancestor::book[contains(@doctype,'cir') or contains(@doctype,'em') or contains(@doctype,'tmm')]) and not(ancestor::book[contains(@doctype,'oh')] and ancestor::ata-page-block/@pb-name[.='service']) and not(ancestor::book[contains(@doctype,'oh')] and ancestor::page-block/@pb-name[.='service']) and not(ancestor::ata-page-block/@pb-name[.='00awl' or .='00intro' or .='airlim' or .='awl' or .='awlror' or .='chapsect' or .='consume' or .='d-and-o' or .='frontmatte' or .='howtouse' or .='00howtouse' or .='intro' or .='nut_option' or .='oplimits' or .='sblist' or .='schedchk' or .='spectool' or .='timelim' or .='title-page']) and not(ancestor::page-block/@pb-name[.='00awl' or .='00intro' or .='airlim' or .='awl' or .='awlror' or .='chapsect' or .='consume' or .='d-and-o' or .='frontmatte' or .='howtouse' or .='00howtouse' or .='intro' or .='nut_option' or .='oplimits' or .='sblist' or .='schedchk' or .='spectool' or .='timelim' or .='title-page']) and not(ancestor::ata-page-block/@pb-name[(starts-with(., 'do') and 'do' = translate(., '0123456789', '') and string-length(.) &gt; 2) or (starts-with(., 'in') and 'in' = translate(., '0123456789', '') and string-length(.) &gt; 2) or (starts-with(., 'tl') and 'tl' = translate(., '0123456789', '') and string-length(.) &gt; 2) or .='toolsht' or .='trlist' or .='unschedc' or .='unschedchk']) and not(ancestor::page-block/@pb-name[(starts-with(., 'do') and 'do' = translate(., '0123456789', '') and string-length(.) &gt; 2) or (starts-with(., 'in') and 'in' = translate(., '0123456789', '') and string-length(.) &gt; 2) or (starts-with(., 'tl') and 'tl' = translate(., '0123456789', '') and string-length(.) &gt; 2) or .='toolsht' or .='trlist' or .='unschedc' or .='unschedchk']) and not(ancestor-or-self::ata-page-block[1]/@pb-name and string(ancestor-or-self::ata-page-block[1]/@pb-name)='intro00') and not(ancestor-or-self::page-block[1]/@pb-name and string(ancestor-or-self::page-block[1]/@pb-name)='intro00') and not(ancestor::ata-page-block/@pb-name[starts-with(., 'disassy') or starts-with(., 'fault')]) and not(ancestor::page-block/@pb-name[starts-with(., 'disassy') or starts-with(., 'fault')]) and not(ancestor::book[contains(@doctype,'oh')] and ancestor::ata-page-block/@pb-name[starts-with(., 'clean')]) and not(ancestor::book[contains(@doctype,'oh')] and ancestor::page-block/@pb-name[starts-with(., 'clean')]) and not(ancestor::ata-page-block/@pb-name[starts-with(., 'mainprac')]) and not(ancestor::page-block/@pb-name[starts-with(., 'mainprac')]) and not(ancestor::book[contains(@doctype,'oh')] and ancestor::ata-page-block/@pb-name[starts-with(., 'inspect')]) and not(ancestor::book[contains(@doctype,'oh')] and ancestor::page-block/@pb-name[starts-with(., 'inspect')]) and not(ancestor::ata-page-block/@pb-name[(starts-with(., 'di') and 'di' = translate(., '0123456789', '') and string-length(.) &gt; 2) or starts-with(.,'service')]) and not(ancestor::page-block/@pb-name[(starts-with(., 'di') and 'di' = translate(., '0123456789', '') and string-length(.) &gt; 2) or starts-with(.,'service')]) and not(ancestor::book[contains(@doctype,'oh')] and ancestor::ata-page-block/@pb-name[starts-with(., 'repair')]) and not(ancestor::book[contains(@doctype,'oh')] and ancestor::page-block/@pb-name[starts-with(., 'repair')]) and not(ancestor::ata-page-block/@pb-name[(starts-with(., 'cl') and 'cl' = translate(., '0123456789', '') and string-length(.) &gt; 2) or .='install' or starts-with(.,'rem-inst') or (starts-with(., 'reminst') and 'reminst' = translate(., '0123456789', '') and string-length(.) &gt; 7) or .='remove' or (starts-with(., 'repair') and 'repair' = translate(., '0123456789', '') and string-length(.) &gt; 6)]) and not(ancestor::page-block/@pb-name[(starts-with(., 'cl') and 'cl' = translate(., '0123456789', '') and string-length(.) &gt; 2) or .='install' or starts-with(.,'rem-inst') or (starts-with(., 'reminst') and 'reminst' = translate(., '0123456789', '') and string-length(.) &gt; 7) or .='remove' or (starts-with(., 'repair') and 'repair' = translate(., '0123456789', '') and string-length(.) &gt; 6)]) and not(ancestor::ata-page-block/@pb-name[starts-with(., 'assy') or (starts-with(., 'ic') and 'ic' = translate(., '0123456789', '') and string-length(.) &gt; 2) or (starts-with(., 'te') and 'te' = translate(., '0123456789', '') and string-length(.) &gt; 2) or .='test']) and not(ancestor::page-block/@pb-name[starts-with(., 'assy') or (starts-with(., 'ic') and 'ic' = translate(., '0123456789', '') and string-length(.) &gt; 2) or (starts-with(., 'te') and 'te' = translate(., '0123456789', '') and string-length(.) &gt; 2) or .='test']) and not(ancestor::ata-page-block/@pb-name[.='f-and-c' or starts-with(., 'inspect') or (starts-with(., 're') and 're' = translate(., '0123456789', '') and string-length(.) &gt; 2)]) and not(ancestor::page-block/@pb-name[.='f-and-c' or starts-with(., 'inspect') or (starts-with(., 're') and 're' = translate(., '0123456789', '') and string-length(.) &gt; 2)]) and not(ancestor::ata-page-block/@pb-name[(starts-with(., 'as') and 'as' = translate(., '0123456789', '') and string-length(.) &gt; 2) or starts-with(.,'clean') or (starts-with(., 'test') and 'test' = translate(., '0123456789', '') and string-length(.) &gt; 4)]) and not(ancestor::page-block/@pb-name[(starts-with(., 'as') and 'as' = translate(., '0123456789', '') and string-length(.) &gt; 2) or starts-with(.,'clean') or (starts-with(., 'test') and 'test' = translate(., '0123456789', '') and string-length(.) &gt; 4)]) and not(ancestor::ata-page-block/@pb-name[(starts-with(., 'fc') and 'fc' = translate(., '0123456789', '') and string-length(.) &gt; 2) or starts-with(.,'repair') or .='trouble']) and not(ancestor::page-block/@pb-name[(starts-with(., 'fc') and 'fc' = translate(., '0123456789', '') and string-length(.) &gt; 2) or starts-with(.,'repair') or .='trouble']) and not(ancestor::ata-page-block/@pb-name[starts-with(.,'storage') or (starts-with(., 'to') and 'to' = translate(., '0123456789', '') and string-length(.) &gt; 2)]) and not(ancestor::page-block/@pb-name[starts-with(.,'storage') or (starts-with(., 'to') and 'to' = translate(., '0123456789', '') and string-length(.) &gt; 2)]) and not(ancestor-or-self::ata-page-block[1]/@pb-name and string(ancestor-or-self::ata-page-block[1]/@pb-name)='it-oh') and (ancestor-or-self::page-block[1]/@pb-name and string(ancestor-or-self::page-block[1]/@pb-name)='it-oh')">
               <xsl:attribute name="_gte:count-as-id">cnt__table^page-block.cnt</xsl:attribute>
            </xsl:when>
            <xsl:when test="not(ancestor::book[contains(@doctype,'cir') or contains(@doctype,'em') or contains(@doctype,'tmm')]) and not(ancestor::book[contains(@doctype,'oh')] and ancestor::ata-page-block/@pb-name[.='service']) and not(ancestor::book[contains(@doctype,'oh')] and ancestor::page-block/@pb-name[.='service']) and not(ancestor::ata-page-block/@pb-name[.='00awl' or .='00intro' or .='airlim' or .='awl' or .='awlror' or .='chapsect' or .='consume' or .='d-and-o' or .='frontmatte' or .='howtouse' or .='00howtouse' or .='intro' or .='nut_option' or .='oplimits' or .='sblist' or .='schedchk' or .='spectool' or .='timelim' or .='title-page']) and not(ancestor::page-block/@pb-name[.='00awl' or .='00intro' or .='airlim' or .='awl' or .='awlror' or .='chapsect' or .='consume' or .='d-and-o' or .='frontmatte' or .='howtouse' or .='00howtouse' or .='intro' or .='nut_option' or .='oplimits' or .='sblist' or .='schedchk' or .='spectool' or .='timelim' or .='title-page']) and not(ancestor::ata-page-block/@pb-name[(starts-with(., 'do') and 'do' = translate(., '0123456789', '') and string-length(.) &gt; 2) or (starts-with(., 'in') and 'in' = translate(., '0123456789', '') and string-length(.) &gt; 2) or (starts-with(., 'tl') and 'tl' = translate(., '0123456789', '') and string-length(.) &gt; 2) or .='toolsht' or .='trlist' or .='unschedc' or .='unschedchk']) and not(ancestor::page-block/@pb-name[(starts-with(., 'do') and 'do' = translate(., '0123456789', '') and string-length(.) &gt; 2) or (starts-with(., 'in') and 'in' = translate(., '0123456789', '') and string-length(.) &gt; 2) or (starts-with(., 'tl') and 'tl' = translate(., '0123456789', '') and string-length(.) &gt; 2) or .='toolsht' or .='trlist' or .='unschedc' or .='unschedchk']) and not(ancestor-or-self::ata-page-block[1]/@pb-name and string(ancestor-or-self::ata-page-block[1]/@pb-name)='intro00') and not(ancestor-or-self::page-block[1]/@pb-name and string(ancestor-or-self::page-block[1]/@pb-name)='intro00') and not(ancestor::ata-page-block/@pb-name[starts-with(., 'disassy') or starts-with(., 'fault')]) and not(ancestor::page-block/@pb-name[starts-with(., 'disassy') or starts-with(., 'fault')]) and not(ancestor::book[contains(@doctype,'oh')] and ancestor::ata-page-block/@pb-name[starts-with(., 'clean')]) and not(ancestor::book[contains(@doctype,'oh')] and ancestor::page-block/@pb-name[starts-with(., 'clean')]) and not(ancestor::ata-page-block/@pb-name[starts-with(., 'mainprac')]) and not(ancestor::page-block/@pb-name[starts-with(., 'mainprac')]) and not(ancestor::book[contains(@doctype,'oh')] and ancestor::ata-page-block/@pb-name[starts-with(., 'inspect')]) and not(ancestor::book[contains(@doctype,'oh')] and ancestor::page-block/@pb-name[starts-with(., 'inspect')]) and not(ancestor::ata-page-block/@pb-name[(starts-with(., 'di') and 'di' = translate(., '0123456789', '') and string-length(.) &gt; 2) or starts-with(.,'service')]) and not(ancestor::page-block/@pb-name[(starts-with(., 'di') and 'di' = translate(., '0123456789', '') and string-length(.) &gt; 2) or starts-with(.,'service')]) and not(ancestor::book[contains(@doctype,'oh')] and ancestor::ata-page-block/@pb-name[starts-with(., 'repair')]) and not(ancestor::book[contains(@doctype,'oh')] and ancestor::page-block/@pb-name[starts-with(., 'repair')]) and not(ancestor::ata-page-block/@pb-name[(starts-with(., 'cl') and 'cl' = translate(., '0123456789', '') and string-length(.) &gt; 2) or .='install' or starts-with(.,'rem-inst') or (starts-with(., 'reminst') and 'reminst' = translate(., '0123456789', '') and string-length(.) &gt; 7) or .='remove' or (starts-with(., 'repair') and 'repair' = translate(., '0123456789', '') and string-length(.) &gt; 6)]) and not(ancestor::page-block/@pb-name[(starts-with(., 'cl') and 'cl' = translate(., '0123456789', '') and string-length(.) &gt; 2) or .='install' or starts-with(.,'rem-inst') or (starts-with(., 'reminst') and 'reminst' = translate(., '0123456789', '') and string-length(.) &gt; 7) or .='remove' or (starts-with(., 'repair') and 'repair' = translate(., '0123456789', '') and string-length(.) &gt; 6)]) and not(ancestor::ata-page-block/@pb-name[starts-with(., 'assy') or (starts-with(., 'ic') and 'ic' = translate(., '0123456789', '') and string-length(.) &gt; 2) or (starts-with(., 'te') and 'te' = translate(., '0123456789', '') and string-length(.) &gt; 2) or .='test']) and not(ancestor::page-block/@pb-name[starts-with(., 'assy') or (starts-with(., 'ic') and 'ic' = translate(., '0123456789', '') and string-length(.) &gt; 2) or (starts-with(., 'te') and 'te' = translate(., '0123456789', '') and string-length(.) &gt; 2) or .='test']) and not(ancestor::ata-page-block/@pb-name[.='f-and-c' or starts-with(., 'inspect') or (starts-with(., 're') and 're' = translate(., '0123456789', '') and string-length(.) &gt; 2)]) and not(ancestor::page-block/@pb-name[.='f-and-c' or starts-with(., 'inspect') or (starts-with(., 're') and 're' = translate(., '0123456789', '') and string-length(.) &gt; 2)]) and not(ancestor::ata-page-block/@pb-name[(starts-with(., 'as') and 'as' = translate(., '0123456789', '') and string-length(.) &gt; 2) or starts-with(.,'clean') or (starts-with(., 'test') and 'test' = translate(., '0123456789', '') and string-length(.) &gt; 4)]) and not(ancestor::page-block/@pb-name[(starts-with(., 'as') and 'as' = translate(., '0123456789', '') and string-length(.) &gt; 2) or starts-with(.,'clean') or (starts-with(., 'test') and 'test' = translate(., '0123456789', '') and string-length(.) &gt; 4)]) and not(ancestor::ata-page-block/@pb-name[(starts-with(., 'fc') and 'fc' = translate(., '0123456789', '') and string-length(.) &gt; 2) or starts-with(.,'repair') or .='trouble']) and not(ancestor::page-block/@pb-name[(starts-with(., 'fc') and 'fc' = translate(., '0123456789', '') and string-length(.) &gt; 2) or starts-with(.,'repair') or .='trouble']) and not(ancestor::ata-page-block/@pb-name[starts-with(.,'storage') or (starts-with(., 'to') and 'to' = translate(., '0123456789', '') and string-length(.) &gt; 2)]) and not(ancestor::page-block/@pb-name[starts-with(.,'storage') or (starts-with(., 'to') and 'to' = translate(., '0123456789', '') and string-length(.) &gt; 2)]) and (ancestor-or-self::ata-page-block[1]/@pb-name and string(ancestor-or-self::ata-page-block[1]/@pb-name)='it-oh')">
               <xsl:attribute name="_gte:count-as-id">cnt__table^ata-page-block.cnt</xsl:attribute>
            </xsl:when>
            <xsl:when test="not(ancestor::book[contains(@doctype,'cir') or contains(@doctype,'em') or contains(@doctype,'tmm')]) and not(ancestor::book[contains(@doctype,'oh')] and ancestor::ata-page-block/@pb-name[.='service']) and not(ancestor::book[contains(@doctype,'oh')] and ancestor::page-block/@pb-name[.='service']) and not(ancestor::ata-page-block/@pb-name[.='00awl' or .='00intro' or .='airlim' or .='awl' or .='awlror' or .='chapsect' or .='consume' or .='d-and-o' or .='frontmatte' or .='howtouse' or .='00howtouse' or .='intro' or .='nut_option' or .='oplimits' or .='sblist' or .='schedchk' or .='spectool' or .='timelim' or .='title-page']) and not(ancestor::page-block/@pb-name[.='00awl' or .='00intro' or .='airlim' or .='awl' or .='awlror' or .='chapsect' or .='consume' or .='d-and-o' or .='frontmatte' or .='howtouse' or .='00howtouse' or .='intro' or .='nut_option' or .='oplimits' or .='sblist' or .='schedchk' or .='spectool' or .='timelim' or .='title-page']) and not(ancestor::ata-page-block/@pb-name[(starts-with(., 'do') and 'do' = translate(., '0123456789', '') and string-length(.) &gt; 2) or (starts-with(., 'in') and 'in' = translate(., '0123456789', '') and string-length(.) &gt; 2) or (starts-with(., 'tl') and 'tl' = translate(., '0123456789', '') and string-length(.) &gt; 2) or .='toolsht' or .='trlist' or .='unschedc' or .='unschedchk']) and not(ancestor::page-block/@pb-name[(starts-with(., 'do') and 'do' = translate(., '0123456789', '') and string-length(.) &gt; 2) or (starts-with(., 'in') and 'in' = translate(., '0123456789', '') and string-length(.) &gt; 2) or (starts-with(., 'tl') and 'tl' = translate(., '0123456789', '') and string-length(.) &gt; 2) or .='toolsht' or .='trlist' or .='unschedc' or .='unschedchk']) and not(ancestor-or-self::ata-page-block[1]/@pb-name and string(ancestor-or-self::ata-page-block[1]/@pb-name)='intro00') and not(ancestor-or-self::page-block[1]/@pb-name and string(ancestor-or-self::page-block[1]/@pb-name)='intro00') and not(ancestor::ata-page-block/@pb-name[starts-with(., 'disassy') or starts-with(., 'fault')]) and not(ancestor::page-block/@pb-name[starts-with(., 'disassy') or starts-with(., 'fault')]) and not(ancestor::book[contains(@doctype,'oh')] and ancestor::ata-page-block/@pb-name[starts-with(., 'clean')]) and not(ancestor::book[contains(@doctype,'oh')] and ancestor::page-block/@pb-name[starts-with(., 'clean')]) and not(ancestor::ata-page-block/@pb-name[starts-with(., 'mainprac')]) and not(ancestor::page-block/@pb-name[starts-with(., 'mainprac')]) and not(ancestor::book[contains(@doctype,'oh')] and ancestor::ata-page-block/@pb-name[starts-with(., 'inspect')]) and not(ancestor::book[contains(@doctype,'oh')] and ancestor::page-block/@pb-name[starts-with(., 'inspect')]) and not(ancestor::ata-page-block/@pb-name[(starts-with(., 'di') and 'di' = translate(., '0123456789', '') and string-length(.) &gt; 2) or starts-with(.,'service')]) and not(ancestor::page-block/@pb-name[(starts-with(., 'di') and 'di' = translate(., '0123456789', '') and string-length(.) &gt; 2) or starts-with(.,'service')]) and not(ancestor::book[contains(@doctype,'oh')] and ancestor::ata-page-block/@pb-name[starts-with(., 'repair')]) and not(ancestor::book[contains(@doctype,'oh')] and ancestor::page-block/@pb-name[starts-with(., 'repair')]) and not(ancestor::ata-page-block/@pb-name[(starts-with(., 'cl') and 'cl' = translate(., '0123456789', '') and string-length(.) &gt; 2) or .='install' or starts-with(.,'rem-inst') or (starts-with(., 'reminst') and 'reminst' = translate(., '0123456789', '') and string-length(.) &gt; 7) or .='remove' or (starts-with(., 'repair') and 'repair' = translate(., '0123456789', '') and string-length(.) &gt; 6)]) and not(ancestor::page-block/@pb-name[(starts-with(., 'cl') and 'cl' = translate(., '0123456789', '') and string-length(.) &gt; 2) or .='install' or starts-with(.,'rem-inst') or (starts-with(., 'reminst') and 'reminst' = translate(., '0123456789', '') and string-length(.) &gt; 7) or .='remove' or (starts-with(., 'repair') and 'repair' = translate(., '0123456789', '') and string-length(.) &gt; 6)]) and not(ancestor::ata-page-block/@pb-name[starts-with(., 'assy') or (starts-with(., 'ic') and 'ic' = translate(., '0123456789', '') and string-length(.) &gt; 2) or (starts-with(., 'te') and 'te' = translate(., '0123456789', '') and string-length(.) &gt; 2) or .='test']) and not(ancestor::page-block/@pb-name[starts-with(., 'assy') or (starts-with(., 'ic') and 'ic' = translate(., '0123456789', '') and string-length(.) &gt; 2) or (starts-with(., 'te') and 'te' = translate(., '0123456789', '') and string-length(.) &gt; 2) or .='test']) and not(ancestor::ata-page-block/@pb-name[.='f-and-c' or starts-with(., 'inspect') or (starts-with(., 're') and 're' = translate(., '0123456789', '') and string-length(.) &gt; 2)]) and not(ancestor::page-block/@pb-name[.='f-and-c' or starts-with(., 'inspect') or (starts-with(., 're') and 're' = translate(., '0123456789', '') and string-length(.) &gt; 2)]) and not(ancestor::ata-page-block/@pb-name[(starts-with(., 'as') and 'as' = translate(., '0123456789', '') and string-length(.) &gt; 2) or starts-with(.,'clean') or (starts-with(., 'test') and 'test' = translate(., '0123456789', '') and string-length(.) &gt; 4)]) and not(ancestor::page-block/@pb-name[(starts-with(., 'as') and 'as' = translate(., '0123456789', '') and string-length(.) &gt; 2) or starts-with(.,'clean') or (starts-with(., 'test') and 'test' = translate(., '0123456789', '') and string-length(.) &gt; 4)]) and not(ancestor::ata-page-block/@pb-name[(starts-with(., 'fc') and 'fc' = translate(., '0123456789', '') and string-length(.) &gt; 2) or starts-with(.,'repair') or .='trouble']) and not(ancestor::page-block/@pb-name[(starts-with(., 'fc') and 'fc' = translate(., '0123456789', '') and string-length(.) &gt; 2) or starts-with(.,'repair') or .='trouble']) and not(ancestor::ata-page-block/@pb-name[starts-with(.,'storage') or (starts-with(., 'to') and 'to' = translate(., '0123456789', '') and string-length(.) &gt; 2)]) and (ancestor::page-block/@pb-name[starts-with(.,'storage') or (starts-with(., 'to') and 'to' = translate(., '0123456789', '') and string-length(.) &gt; 2)])">
               <xsl:attribute name="_gte:count-as-id">cnt__table^page-block.cnt</xsl:attribute>
            </xsl:when>
            <xsl:when test="not(ancestor::book[contains(@doctype,'cir') or contains(@doctype,'em') or contains(@doctype,'tmm')]) and not(ancestor::book[contains(@doctype,'oh')] and ancestor::ata-page-block/@pb-name[.='service']) and not(ancestor::book[contains(@doctype,'oh')] and ancestor::page-block/@pb-name[.='service']) and not(ancestor::ata-page-block/@pb-name[.='00awl' or .='00intro' or .='airlim' or .='awl' or .='awlror' or .='chapsect' or .='consume' or .='d-and-o' or .='frontmatte' or .='howtouse' or .='00howtouse' or .='intro' or .='nut_option' or .='oplimits' or .='sblist' or .='schedchk' or .='spectool' or .='timelim' or .='title-page']) and not(ancestor::page-block/@pb-name[.='00awl' or .='00intro' or .='airlim' or .='awl' or .='awlror' or .='chapsect' or .='consume' or .='d-and-o' or .='frontmatte' or .='howtouse' or .='00howtouse' or .='intro' or .='nut_option' or .='oplimits' or .='sblist' or .='schedchk' or .='spectool' or .='timelim' or .='title-page']) and not(ancestor::ata-page-block/@pb-name[(starts-with(., 'do') and 'do' = translate(., '0123456789', '') and string-length(.) &gt; 2) or (starts-with(., 'in') and 'in' = translate(., '0123456789', '') and string-length(.) &gt; 2) or (starts-with(., 'tl') and 'tl' = translate(., '0123456789', '') and string-length(.) &gt; 2) or .='toolsht' or .='trlist' or .='unschedc' or .='unschedchk']) and not(ancestor::page-block/@pb-name[(starts-with(., 'do') and 'do' = translate(., '0123456789', '') and string-length(.) &gt; 2) or (starts-with(., 'in') and 'in' = translate(., '0123456789', '') and string-length(.) &gt; 2) or (starts-with(., 'tl') and 'tl' = translate(., '0123456789', '') and string-length(.) &gt; 2) or .='toolsht' or .='trlist' or .='unschedc' or .='unschedchk']) and not(ancestor-or-self::ata-page-block[1]/@pb-name and string(ancestor-or-self::ata-page-block[1]/@pb-name)='intro00') and not(ancestor-or-self::page-block[1]/@pb-name and string(ancestor-or-self::page-block[1]/@pb-name)='intro00') and not(ancestor::ata-page-block/@pb-name[starts-with(., 'disassy') or starts-with(., 'fault')]) and not(ancestor::page-block/@pb-name[starts-with(., 'disassy') or starts-with(., 'fault')]) and not(ancestor::book[contains(@doctype,'oh')] and ancestor::ata-page-block/@pb-name[starts-with(., 'clean')]) and not(ancestor::book[contains(@doctype,'oh')] and ancestor::page-block/@pb-name[starts-with(., 'clean')]) and not(ancestor::ata-page-block/@pb-name[starts-with(., 'mainprac')]) and not(ancestor::page-block/@pb-name[starts-with(., 'mainprac')]) and not(ancestor::book[contains(@doctype,'oh')] and ancestor::ata-page-block/@pb-name[starts-with(., 'inspect')]) and not(ancestor::book[contains(@doctype,'oh')] and ancestor::page-block/@pb-name[starts-with(., 'inspect')]) and not(ancestor::ata-page-block/@pb-name[(starts-with(., 'di') and 'di' = translate(., '0123456789', '') and string-length(.) &gt; 2) or starts-with(.,'service')]) and not(ancestor::page-block/@pb-name[(starts-with(., 'di') and 'di' = translate(., '0123456789', '') and string-length(.) &gt; 2) or starts-with(.,'service')]) and not(ancestor::book[contains(@doctype,'oh')] and ancestor::ata-page-block/@pb-name[starts-with(., 'repair')]) and not(ancestor::book[contains(@doctype,'oh')] and ancestor::page-block/@pb-name[starts-with(., 'repair')]) and not(ancestor::ata-page-block/@pb-name[(starts-with(., 'cl') and 'cl' = translate(., '0123456789', '') and string-length(.) &gt; 2) or .='install' or starts-with(.,'rem-inst') or (starts-with(., 'reminst') and 'reminst' = translate(., '0123456789', '') and string-length(.) &gt; 7) or .='remove' or (starts-with(., 'repair') and 'repair' = translate(., '0123456789', '') and string-length(.) &gt; 6)]) and not(ancestor::page-block/@pb-name[(starts-with(., 'cl') and 'cl' = translate(., '0123456789', '') and string-length(.) &gt; 2) or .='install' or starts-with(.,'rem-inst') or (starts-with(., 'reminst') and 'reminst' = translate(., '0123456789', '') and string-length(.) &gt; 7) or .='remove' or (starts-with(., 'repair') and 'repair' = translate(., '0123456789', '') and string-length(.) &gt; 6)]) and not(ancestor::ata-page-block/@pb-name[starts-with(., 'assy') or (starts-with(., 'ic') and 'ic' = translate(., '0123456789', '') and string-length(.) &gt; 2) or (starts-with(., 'te') and 'te' = translate(., '0123456789', '') and string-length(.) &gt; 2) or .='test']) and not(ancestor::page-block/@pb-name[starts-with(., 'assy') or (starts-with(., 'ic') and 'ic' = translate(., '0123456789', '') and string-length(.) &gt; 2) or (starts-with(., 'te') and 'te' = translate(., '0123456789', '') and string-length(.) &gt; 2) or .='test']) and not(ancestor::ata-page-block/@pb-name[.='f-and-c' or starts-with(., 'inspect') or (starts-with(., 're') and 're' = translate(., '0123456789', '') and string-length(.) &gt; 2)]) and not(ancestor::page-block/@pb-name[.='f-and-c' or starts-with(., 'inspect') or (starts-with(., 're') and 're' = translate(., '0123456789', '') and string-length(.) &gt; 2)]) and not(ancestor::ata-page-block/@pb-name[(starts-with(., 'as') and 'as' = translate(., '0123456789', '') and string-length(.) &gt; 2) or starts-with(.,'clean') or (starts-with(., 'test') and 'test' = translate(., '0123456789', '') and string-length(.) &gt; 4)]) and not(ancestor::page-block/@pb-name[(starts-with(., 'as') and 'as' = translate(., '0123456789', '') and string-length(.) &gt; 2) or starts-with(.,'clean') or (starts-with(., 'test') and 'test' = translate(., '0123456789', '') and string-length(.) &gt; 4)]) and not(ancestor::ata-page-block/@pb-name[(starts-with(., 'fc') and 'fc' = translate(., '0123456789', '') and string-length(.) &gt; 2) or starts-with(.,'repair') or .='trouble']) and not(ancestor::page-block/@pb-name[(starts-with(., 'fc') and 'fc' = translate(., '0123456789', '') and string-length(.) &gt; 2) or starts-with(.,'repair') or .='trouble']) and (ancestor::ata-page-block/@pb-name[starts-with(.,'storage') or (starts-with(., 'to') and 'to' = translate(., '0123456789', '') and string-length(.) &gt; 2)])">
               <xsl:attribute name="_gte:count-as-id">cnt__table^ata-page-block.cnt</xsl:attribute>
            </xsl:when>
            <xsl:when test="not(ancestor::book[contains(@doctype,'cir') or contains(@doctype,'em') or contains(@doctype,'tmm')]) and not(ancestor::book[contains(@doctype,'oh')] and ancestor::ata-page-block/@pb-name[.='service']) and not(ancestor::book[contains(@doctype,'oh')] and ancestor::page-block/@pb-name[.='service']) and not(ancestor::ata-page-block/@pb-name[.='00awl' or .='00intro' or .='airlim' or .='awl' or .='awlror' or .='chapsect' or .='consume' or .='d-and-o' or .='frontmatte' or .='howtouse' or .='00howtouse' or .='intro' or .='nut_option' or .='oplimits' or .='sblist' or .='schedchk' or .='spectool' or .='timelim' or .='title-page']) and not(ancestor::page-block/@pb-name[.='00awl' or .='00intro' or .='airlim' or .='awl' or .='awlror' or .='chapsect' or .='consume' or .='d-and-o' or .='frontmatte' or .='howtouse' or .='00howtouse' or .='intro' or .='nut_option' or .='oplimits' or .='sblist' or .='schedchk' or .='spectool' or .='timelim' or .='title-page']) and not(ancestor::ata-page-block/@pb-name[(starts-with(., 'do') and 'do' = translate(., '0123456789', '') and string-length(.) &gt; 2) or (starts-with(., 'in') and 'in' = translate(., '0123456789', '') and string-length(.) &gt; 2) or (starts-with(., 'tl') and 'tl' = translate(., '0123456789', '') and string-length(.) &gt; 2) or .='toolsht' or .='trlist' or .='unschedc' or .='unschedchk']) and not(ancestor::page-block/@pb-name[(starts-with(., 'do') and 'do' = translate(., '0123456789', '') and string-length(.) &gt; 2) or (starts-with(., 'in') and 'in' = translate(., '0123456789', '') and string-length(.) &gt; 2) or (starts-with(., 'tl') and 'tl' = translate(., '0123456789', '') and string-length(.) &gt; 2) or .='toolsht' or .='trlist' or .='unschedc' or .='unschedchk']) and not(ancestor-or-self::ata-page-block[1]/@pb-name and string(ancestor-or-self::ata-page-block[1]/@pb-name)='intro00') and not(ancestor-or-self::page-block[1]/@pb-name and string(ancestor-or-self::page-block[1]/@pb-name)='intro00') and not(ancestor::ata-page-block/@pb-name[starts-with(., 'disassy') or starts-with(., 'fault')]) and not(ancestor::page-block/@pb-name[starts-with(., 'disassy') or starts-with(., 'fault')]) and not(ancestor::book[contains(@doctype,'oh')] and ancestor::ata-page-block/@pb-name[starts-with(., 'clean')]) and not(ancestor::book[contains(@doctype,'oh')] and ancestor::page-block/@pb-name[starts-with(., 'clean')]) and not(ancestor::ata-page-block/@pb-name[starts-with(., 'mainprac')]) and not(ancestor::page-block/@pb-name[starts-with(., 'mainprac')]) and not(ancestor::book[contains(@doctype,'oh')] and ancestor::ata-page-block/@pb-name[starts-with(., 'inspect')]) and not(ancestor::book[contains(@doctype,'oh')] and ancestor::page-block/@pb-name[starts-with(., 'inspect')]) and not(ancestor::ata-page-block/@pb-name[(starts-with(., 'di') and 'di' = translate(., '0123456789', '') and string-length(.) &gt; 2) or starts-with(.,'service')]) and not(ancestor::page-block/@pb-name[(starts-with(., 'di') and 'di' = translate(., '0123456789', '') and string-length(.) &gt; 2) or starts-with(.,'service')]) and not(ancestor::book[contains(@doctype,'oh')] and ancestor::ata-page-block/@pb-name[starts-with(., 'repair')]) and not(ancestor::book[contains(@doctype,'oh')] and ancestor::page-block/@pb-name[starts-with(., 'repair')]) and not(ancestor::ata-page-block/@pb-name[(starts-with(., 'cl') and 'cl' = translate(., '0123456789', '') and string-length(.) &gt; 2) or .='install' or starts-with(.,'rem-inst') or (starts-with(., 'reminst') and 'reminst' = translate(., '0123456789', '') and string-length(.) &gt; 7) or .='remove' or (starts-with(., 'repair') and 'repair' = translate(., '0123456789', '') and string-length(.) &gt; 6)]) and not(ancestor::page-block/@pb-name[(starts-with(., 'cl') and 'cl' = translate(., '0123456789', '') and string-length(.) &gt; 2) or .='install' or starts-with(.,'rem-inst') or (starts-with(., 'reminst') and 'reminst' = translate(., '0123456789', '') and string-length(.) &gt; 7) or .='remove' or (starts-with(., 'repair') and 'repair' = translate(., '0123456789', '') and string-length(.) &gt; 6)]) and not(ancestor::ata-page-block/@pb-name[starts-with(., 'assy') or (starts-with(., 'ic') and 'ic' = translate(., '0123456789', '') and string-length(.) &gt; 2) or (starts-with(., 'te') and 'te' = translate(., '0123456789', '') and string-length(.) &gt; 2) or .='test']) and not(ancestor::page-block/@pb-name[starts-with(., 'assy') or (starts-with(., 'ic') and 'ic' = translate(., '0123456789', '') and string-length(.) &gt; 2) or (starts-with(., 'te') and 'te' = translate(., '0123456789', '') and string-length(.) &gt; 2) or .='test']) and not(ancestor::ata-page-block/@pb-name[.='f-and-c' or starts-with(., 'inspect') or (starts-with(., 're') and 're' = translate(., '0123456789', '') and string-length(.) &gt; 2)]) and not(ancestor::page-block/@pb-name[.='f-and-c' or starts-with(., 'inspect') or (starts-with(., 're') and 're' = translate(., '0123456789', '') and string-length(.) &gt; 2)]) and not(ancestor::ata-page-block/@pb-name[(starts-with(., 'as') and 'as' = translate(., '0123456789', '') and string-length(.) &gt; 2) or starts-with(.,'clean') or (starts-with(., 'test') and 'test' = translate(., '0123456789', '') and string-length(.) &gt; 4)]) and not(ancestor::page-block/@pb-name[(starts-with(., 'as') and 'as' = translate(., '0123456789', '') and string-length(.) &gt; 2) or starts-with(.,'clean') or (starts-with(., 'test') and 'test' = translate(., '0123456789', '') and string-length(.) &gt; 4)]) and not(ancestor::ata-page-block/@pb-name[(starts-with(., 'fc') and 'fc' = translate(., '0123456789', '') and string-length(.) &gt; 2) or starts-with(.,'repair') or .='trouble']) and (ancestor::page-block/@pb-name[(starts-with(., 'fc') and 'fc' = translate(., '0123456789', '') and string-length(.) &gt; 2) or starts-with(.,'repair') or .='trouble'])">
               <xsl:attribute name="_gte:count-as-id">cnt__table^page-block.cnt</xsl:attribute>
            </xsl:when>
            <xsl:when test="not(ancestor::book[contains(@doctype,'cir') or contains(@doctype,'em') or contains(@doctype,'tmm')]) and not(ancestor::book[contains(@doctype,'oh')] and ancestor::ata-page-block/@pb-name[.='service']) and not(ancestor::book[contains(@doctype,'oh')] and ancestor::page-block/@pb-name[.='service']) and not(ancestor::ata-page-block/@pb-name[.='00awl' or .='00intro' or .='airlim' or .='awl' or .='awlror' or .='chapsect' or .='consume' or .='d-and-o' or .='frontmatte' or .='howtouse' or .='00howtouse' or .='intro' or .='nut_option' or .='oplimits' or .='sblist' or .='schedchk' or .='spectool' or .='timelim' or .='title-page']) and not(ancestor::page-block/@pb-name[.='00awl' or .='00intro' or .='airlim' or .='awl' or .='awlror' or .='chapsect' or .='consume' or .='d-and-o' or .='frontmatte' or .='howtouse' or .='00howtouse' or .='intro' or .='nut_option' or .='oplimits' or .='sblist' or .='schedchk' or .='spectool' or .='timelim' or .='title-page']) and not(ancestor::ata-page-block/@pb-name[(starts-with(., 'do') and 'do' = translate(., '0123456789', '') and string-length(.) &gt; 2) or (starts-with(., 'in') and 'in' = translate(., '0123456789', '') and string-length(.) &gt; 2) or (starts-with(., 'tl') and 'tl' = translate(., '0123456789', '') and string-length(.) &gt; 2) or .='toolsht' or .='trlist' or .='unschedc' or .='unschedchk']) and not(ancestor::page-block/@pb-name[(starts-with(., 'do') and 'do' = translate(., '0123456789', '') and string-length(.) &gt; 2) or (starts-with(., 'in') and 'in' = translate(., '0123456789', '') and string-length(.) &gt; 2) or (starts-with(., 'tl') and 'tl' = translate(., '0123456789', '') and string-length(.) &gt; 2) or .='toolsht' or .='trlist' or .='unschedc' or .='unschedchk']) and not(ancestor-or-self::ata-page-block[1]/@pb-name and string(ancestor-or-self::ata-page-block[1]/@pb-name)='intro00') and not(ancestor-or-self::page-block[1]/@pb-name and string(ancestor-or-self::page-block[1]/@pb-name)='intro00') and not(ancestor::ata-page-block/@pb-name[starts-with(., 'disassy') or starts-with(., 'fault')]) and not(ancestor::page-block/@pb-name[starts-with(., 'disassy') or starts-with(., 'fault')]) and not(ancestor::book[contains(@doctype,'oh')] and ancestor::ata-page-block/@pb-name[starts-with(., 'clean')]) and not(ancestor::book[contains(@doctype,'oh')] and ancestor::page-block/@pb-name[starts-with(., 'clean')]) and not(ancestor::ata-page-block/@pb-name[starts-with(., 'mainprac')]) and not(ancestor::page-block/@pb-name[starts-with(., 'mainprac')]) and not(ancestor::book[contains(@doctype,'oh')] and ancestor::ata-page-block/@pb-name[starts-with(., 'inspect')]) and not(ancestor::book[contains(@doctype,'oh')] and ancestor::page-block/@pb-name[starts-with(., 'inspect')]) and not(ancestor::ata-page-block/@pb-name[(starts-with(., 'di') and 'di' = translate(., '0123456789', '') and string-length(.) &gt; 2) or starts-with(.,'service')]) and not(ancestor::page-block/@pb-name[(starts-with(., 'di') and 'di' = translate(., '0123456789', '') and string-length(.) &gt; 2) or starts-with(.,'service')]) and not(ancestor::book[contains(@doctype,'oh')] and ancestor::ata-page-block/@pb-name[starts-with(., 'repair')]) and not(ancestor::book[contains(@doctype,'oh')] and ancestor::page-block/@pb-name[starts-with(., 'repair')]) and not(ancestor::ata-page-block/@pb-name[(starts-with(., 'cl') and 'cl' = translate(., '0123456789', '') and string-length(.) &gt; 2) or .='install' or starts-with(.,'rem-inst') or (starts-with(., 'reminst') and 'reminst' = translate(., '0123456789', '') and string-length(.) &gt; 7) or .='remove' or (starts-with(., 'repair') and 'repair' = translate(., '0123456789', '') and string-length(.) &gt; 6)]) and not(ancestor::page-block/@pb-name[(starts-with(., 'cl') and 'cl' = translate(., '0123456789', '') and string-length(.) &gt; 2) or .='install' or starts-with(.,'rem-inst') or (starts-with(., 'reminst') and 'reminst' = translate(., '0123456789', '') and string-length(.) &gt; 7) or .='remove' or (starts-with(., 'repair') and 'repair' = translate(., '0123456789', '') and string-length(.) &gt; 6)]) and not(ancestor::ata-page-block/@pb-name[starts-with(., 'assy') or (starts-with(., 'ic') and 'ic' = translate(., '0123456789', '') and string-length(.) &gt; 2) or (starts-with(., 'te') and 'te' = translate(., '0123456789', '') and string-length(.) &gt; 2) or .='test']) and not(ancestor::page-block/@pb-name[starts-with(., 'assy') or (starts-with(., 'ic') and 'ic' = translate(., '0123456789', '') and string-length(.) &gt; 2) or (starts-with(., 'te') and 'te' = translate(., '0123456789', '') and string-length(.) &gt; 2) or .='test']) and not(ancestor::ata-page-block/@pb-name[.='f-and-c' or starts-with(., 'inspect') or (starts-with(., 're') and 're' = translate(., '0123456789', '') and string-length(.) &gt; 2)]) and not(ancestor::page-block/@pb-name[.='f-and-c' or starts-with(., 'inspect') or (starts-with(., 're') and 're' = translate(., '0123456789', '') and string-length(.) &gt; 2)]) and not(ancestor::ata-page-block/@pb-name[(starts-with(., 'as') and 'as' = translate(., '0123456789', '') and string-length(.) &gt; 2) or starts-with(.,'clean') or (starts-with(., 'test') and 'test' = translate(., '0123456789', '') and string-length(.) &gt; 4)]) and not(ancestor::page-block/@pb-name[(starts-with(., 'as') and 'as' = translate(., '0123456789', '') and string-length(.) &gt; 2) or starts-with(.,'clean') or (starts-with(., 'test') and 'test' = translate(., '0123456789', '') and string-length(.) &gt; 4)]) and (ancestor::ata-page-block/@pb-name[(starts-with(., 'fc') and 'fc' = translate(., '0123456789', '') and string-length(.) &gt; 2) or starts-with(.,'repair') or .='trouble'])">
               <xsl:attribute name="_gte:count-as-id">cnt__table^ata-page-block.cnt</xsl:attribute>
            </xsl:when>
            <xsl:when test="not(ancestor::book[contains(@doctype,'cir') or contains(@doctype,'em') or contains(@doctype,'tmm')]) and not(ancestor::book[contains(@doctype,'oh')] and ancestor::ata-page-block/@pb-name[.='service']) and not(ancestor::book[contains(@doctype,'oh')] and ancestor::page-block/@pb-name[.='service']) and not(ancestor::ata-page-block/@pb-name[.='00awl' or .='00intro' or .='airlim' or .='awl' or .='awlror' or .='chapsect' or .='consume' or .='d-and-o' or .='frontmatte' or .='howtouse' or .='00howtouse' or .='intro' or .='nut_option' or .='oplimits' or .='sblist' or .='schedchk' or .='spectool' or .='timelim' or .='title-page']) and not(ancestor::page-block/@pb-name[.='00awl' or .='00intro' or .='airlim' or .='awl' or .='awlror' or .='chapsect' or .='consume' or .='d-and-o' or .='frontmatte' or .='howtouse' or .='00howtouse' or .='intro' or .='nut_option' or .='oplimits' or .='sblist' or .='schedchk' or .='spectool' or .='timelim' or .='title-page']) and not(ancestor::ata-page-block/@pb-name[(starts-with(., 'do') and 'do' = translate(., '0123456789', '') and string-length(.) &gt; 2) or (starts-with(., 'in') and 'in' = translate(., '0123456789', '') and string-length(.) &gt; 2) or (starts-with(., 'tl') and 'tl' = translate(., '0123456789', '') and string-length(.) &gt; 2) or .='toolsht' or .='trlist' or .='unschedc' or .='unschedchk']) and not(ancestor::page-block/@pb-name[(starts-with(., 'do') and 'do' = translate(., '0123456789', '') and string-length(.) &gt; 2) or (starts-with(., 'in') and 'in' = translate(., '0123456789', '') and string-length(.) &gt; 2) or (starts-with(., 'tl') and 'tl' = translate(., '0123456789', '') and string-length(.) &gt; 2) or .='toolsht' or .='trlist' or .='unschedc' or .='unschedchk']) and not(ancestor-or-self::ata-page-block[1]/@pb-name and string(ancestor-or-self::ata-page-block[1]/@pb-name)='intro00') and not(ancestor-or-self::page-block[1]/@pb-name and string(ancestor-or-self::page-block[1]/@pb-name)='intro00') and not(ancestor::ata-page-block/@pb-name[starts-with(., 'disassy') or starts-with(., 'fault')]) and not(ancestor::page-block/@pb-name[starts-with(., 'disassy') or starts-with(., 'fault')]) and not(ancestor::book[contains(@doctype,'oh')] and ancestor::ata-page-block/@pb-name[starts-with(., 'clean')]) and not(ancestor::book[contains(@doctype,'oh')] and ancestor::page-block/@pb-name[starts-with(., 'clean')]) and not(ancestor::ata-page-block/@pb-name[starts-with(., 'mainprac')]) and not(ancestor::page-block/@pb-name[starts-with(., 'mainprac')]) and not(ancestor::book[contains(@doctype,'oh')] and ancestor::ata-page-block/@pb-name[starts-with(., 'inspect')]) and not(ancestor::book[contains(@doctype,'oh')] and ancestor::page-block/@pb-name[starts-with(., 'inspect')]) and not(ancestor::ata-page-block/@pb-name[(starts-with(., 'di') and 'di' = translate(., '0123456789', '') and string-length(.) &gt; 2) or starts-with(.,'service')]) and not(ancestor::page-block/@pb-name[(starts-with(., 'di') and 'di' = translate(., '0123456789', '') and string-length(.) &gt; 2) or starts-with(.,'service')]) and not(ancestor::book[contains(@doctype,'oh')] and ancestor::ata-page-block/@pb-name[starts-with(., 'repair')]) and not(ancestor::book[contains(@doctype,'oh')] and ancestor::page-block/@pb-name[starts-with(., 'repair')]) and not(ancestor::ata-page-block/@pb-name[(starts-with(., 'cl') and 'cl' = translate(., '0123456789', '') and string-length(.) &gt; 2) or .='install' or starts-with(.,'rem-inst') or (starts-with(., 'reminst') and 'reminst' = translate(., '0123456789', '') and string-length(.) &gt; 7) or .='remove' or (starts-with(., 'repair') and 'repair' = translate(., '0123456789', '') and string-length(.) &gt; 6)]) and not(ancestor::page-block/@pb-name[(starts-with(., 'cl') and 'cl' = translate(., '0123456789', '') and string-length(.) &gt; 2) or .='install' or starts-with(.,'rem-inst') or (starts-with(., 'reminst') and 'reminst' = translate(., '0123456789', '') and string-length(.) &gt; 7) or .='remove' or (starts-with(., 'repair') and 'repair' = translate(., '0123456789', '') and string-length(.) &gt; 6)]) and not(ancestor::ata-page-block/@pb-name[starts-with(., 'assy') or (starts-with(., 'ic') and 'ic' = translate(., '0123456789', '') and string-length(.) &gt; 2) or (starts-with(., 'te') and 'te' = translate(., '0123456789', '') and string-length(.) &gt; 2) or .='test']) and not(ancestor::page-block/@pb-name[starts-with(., 'assy') or (starts-with(., 'ic') and 'ic' = translate(., '0123456789', '') and string-length(.) &gt; 2) or (starts-with(., 'te') and 'te' = translate(., '0123456789', '') and string-length(.) &gt; 2) or .='test']) and not(ancestor::ata-page-block/@pb-name[.='f-and-c' or starts-with(., 'inspect') or (starts-with(., 're') and 're' = translate(., '0123456789', '') and string-length(.) &gt; 2)]) and not(ancestor::page-block/@pb-name[.='f-and-c' or starts-with(., 'inspect') or (starts-with(., 're') and 're' = translate(., '0123456789', '') and string-length(.) &gt; 2)]) and not(ancestor::ata-page-block/@pb-name[(starts-with(., 'as') and 'as' = translate(., '0123456789', '') and string-length(.) &gt; 2) or starts-with(.,'clean') or (starts-with(., 'test') and 'test' = translate(., '0123456789', '') and string-length(.) &gt; 4)]) and (ancestor::page-block/@pb-name[(starts-with(., 'as') and 'as' = translate(., '0123456789', '') and string-length(.) &gt; 2) or starts-with(.,'clean') or (starts-with(., 'test') and 'test' = translate(., '0123456789', '') and string-length(.) &gt; 4)])">
               <xsl:attribute name="_gte:count-as-id">cnt__table^page-block.cnt</xsl:attribute>
            </xsl:when>
            <xsl:when test="not(ancestor::book[contains(@doctype,'cir') or contains(@doctype,'em') or contains(@doctype,'tmm')]) and not(ancestor::book[contains(@doctype,'oh')] and ancestor::ata-page-block/@pb-name[.='service']) and not(ancestor::book[contains(@doctype,'oh')] and ancestor::page-block/@pb-name[.='service']) and not(ancestor::ata-page-block/@pb-name[.='00awl' or .='00intro' or .='airlim' or .='awl' or .='awlror' or .='chapsect' or .='consume' or .='d-and-o' or .='frontmatte' or .='howtouse' or .='00howtouse' or .='intro' or .='nut_option' or .='oplimits' or .='sblist' or .='schedchk' or .='spectool' or .='timelim' or .='title-page']) and not(ancestor::page-block/@pb-name[.='00awl' or .='00intro' or .='airlim' or .='awl' or .='awlror' or .='chapsect' or .='consume' or .='d-and-o' or .='frontmatte' or .='howtouse' or .='00howtouse' or .='intro' or .='nut_option' or .='oplimits' or .='sblist' or .='schedchk' or .='spectool' or .='timelim' or .='title-page']) and not(ancestor::ata-page-block/@pb-name[(starts-with(., 'do') and 'do' = translate(., '0123456789', '') and string-length(.) &gt; 2) or (starts-with(., 'in') and 'in' = translate(., '0123456789', '') and string-length(.) &gt; 2) or (starts-with(., 'tl') and 'tl' = translate(., '0123456789', '') and string-length(.) &gt; 2) or .='toolsht' or .='trlist' or .='unschedc' or .='unschedchk']) and not(ancestor::page-block/@pb-name[(starts-with(., 'do') and 'do' = translate(., '0123456789', '') and string-length(.) &gt; 2) or (starts-with(., 'in') and 'in' = translate(., '0123456789', '') and string-length(.) &gt; 2) or (starts-with(., 'tl') and 'tl' = translate(., '0123456789', '') and string-length(.) &gt; 2) or .='toolsht' or .='trlist' or .='unschedc' or .='unschedchk']) and not(ancestor-or-self::ata-page-block[1]/@pb-name and string(ancestor-or-self::ata-page-block[1]/@pb-name)='intro00') and not(ancestor-or-self::page-block[1]/@pb-name and string(ancestor-or-self::page-block[1]/@pb-name)='intro00') and not(ancestor::ata-page-block/@pb-name[starts-with(., 'disassy') or starts-with(., 'fault')]) and not(ancestor::page-block/@pb-name[starts-with(., 'disassy') or starts-with(., 'fault')]) and not(ancestor::book[contains(@doctype,'oh')] and ancestor::ata-page-block/@pb-name[starts-with(., 'clean')]) and not(ancestor::book[contains(@doctype,'oh')] and ancestor::page-block/@pb-name[starts-with(., 'clean')]) and not(ancestor::ata-page-block/@pb-name[starts-with(., 'mainprac')]) and not(ancestor::page-block/@pb-name[starts-with(., 'mainprac')]) and not(ancestor::book[contains(@doctype,'oh')] and ancestor::ata-page-block/@pb-name[starts-with(., 'inspect')]) and not(ancestor::book[contains(@doctype,'oh')] and ancestor::page-block/@pb-name[starts-with(., 'inspect')]) and not(ancestor::ata-page-block/@pb-name[(starts-with(., 'di') and 'di' = translate(., '0123456789', '') and string-length(.) &gt; 2) or starts-with(.,'service')]) and not(ancestor::page-block/@pb-name[(starts-with(., 'di') and 'di' = translate(., '0123456789', '') and string-length(.) &gt; 2) or starts-with(.,'service')]) and not(ancestor::book[contains(@doctype,'oh')] and ancestor::ata-page-block/@pb-name[starts-with(., 'repair')]) and not(ancestor::book[contains(@doctype,'oh')] and ancestor::page-block/@pb-name[starts-with(., 'repair')]) and not(ancestor::ata-page-block/@pb-name[(starts-with(., 'cl') and 'cl' = translate(., '0123456789', '') and string-length(.) &gt; 2) or .='install' or starts-with(.,'rem-inst') or (starts-with(., 'reminst') and 'reminst' = translate(., '0123456789', '') and string-length(.) &gt; 7) or .='remove' or (starts-with(., 'repair') and 'repair' = translate(., '0123456789', '') and string-length(.) &gt; 6)]) and not(ancestor::page-block/@pb-name[(starts-with(., 'cl') and 'cl' = translate(., '0123456789', '') and string-length(.) &gt; 2) or .='install' or starts-with(.,'rem-inst') or (starts-with(., 'reminst') and 'reminst' = translate(., '0123456789', '') and string-length(.) &gt; 7) or .='remove' or (starts-with(., 'repair') and 'repair' = translate(., '0123456789', '') and string-length(.) &gt; 6)]) and not(ancestor::ata-page-block/@pb-name[starts-with(., 'assy') or (starts-with(., 'ic') and 'ic' = translate(., '0123456789', '') and string-length(.) &gt; 2) or (starts-with(., 'te') and 'te' = translate(., '0123456789', '') and string-length(.) &gt; 2) or .='test']) and not(ancestor::page-block/@pb-name[starts-with(., 'assy') or (starts-with(., 'ic') and 'ic' = translate(., '0123456789', '') and string-length(.) &gt; 2) or (starts-with(., 'te') and 'te' = translate(., '0123456789', '') and string-length(.) &gt; 2) or .='test']) and not(ancestor::ata-page-block/@pb-name[.='f-and-c' or starts-with(., 'inspect') or (starts-with(., 're') and 're' = translate(., '0123456789', '') and string-length(.) &gt; 2)]) and not(ancestor::page-block/@pb-name[.='f-and-c' or starts-with(., 'inspect') or (starts-with(., 're') and 're' = translate(., '0123456789', '') and string-length(.) &gt; 2)]) and (ancestor::ata-page-block/@pb-name[(starts-with(., 'as') and 'as' = translate(., '0123456789', '') and string-length(.) &gt; 2) or starts-with(.,'clean') or (starts-with(., 'test') and 'test' = translate(., '0123456789', '') and string-length(.) &gt; 4)])">
               <xsl:attribute name="_gte:count-as-id">cnt__table^ata-page-block.cnt</xsl:attribute>
            </xsl:when>
            <xsl:when test="not(ancestor::book[contains(@doctype,'cir') or contains(@doctype,'em') or contains(@doctype,'tmm')]) and not(ancestor::book[contains(@doctype,'oh')] and ancestor::ata-page-block/@pb-name[.='service']) and not(ancestor::book[contains(@doctype,'oh')] and ancestor::page-block/@pb-name[.='service']) and not(ancestor::ata-page-block/@pb-name[.='00awl' or .='00intro' or .='airlim' or .='awl' or .='awlror' or .='chapsect' or .='consume' or .='d-and-o' or .='frontmatte' or .='howtouse' or .='00howtouse' or .='intro' or .='nut_option' or .='oplimits' or .='sblist' or .='schedchk' or .='spectool' or .='timelim' or .='title-page']) and not(ancestor::page-block/@pb-name[.='00awl' or .='00intro' or .='airlim' or .='awl' or .='awlror' or .='chapsect' or .='consume' or .='d-and-o' or .='frontmatte' or .='howtouse' or .='00howtouse' or .='intro' or .='nut_option' or .='oplimits' or .='sblist' or .='schedchk' or .='spectool' or .='timelim' or .='title-page']) and not(ancestor::ata-page-block/@pb-name[(starts-with(., 'do') and 'do' = translate(., '0123456789', '') and string-length(.) &gt; 2) or (starts-with(., 'in') and 'in' = translate(., '0123456789', '') and string-length(.) &gt; 2) or (starts-with(., 'tl') and 'tl' = translate(., '0123456789', '') and string-length(.) &gt; 2) or .='toolsht' or .='trlist' or .='unschedc' or .='unschedchk']) and not(ancestor::page-block/@pb-name[(starts-with(., 'do') and 'do' = translate(., '0123456789', '') and string-length(.) &gt; 2) or (starts-with(., 'in') and 'in' = translate(., '0123456789', '') and string-length(.) &gt; 2) or (starts-with(., 'tl') and 'tl' = translate(., '0123456789', '') and string-length(.) &gt; 2) or .='toolsht' or .='trlist' or .='unschedc' or .='unschedchk']) and not(ancestor-or-self::ata-page-block[1]/@pb-name and string(ancestor-or-self::ata-page-block[1]/@pb-name)='intro00') and not(ancestor-or-self::page-block[1]/@pb-name and string(ancestor-or-self::page-block[1]/@pb-name)='intro00') and not(ancestor::ata-page-block/@pb-name[starts-with(., 'disassy') or starts-with(., 'fault')]) and not(ancestor::page-block/@pb-name[starts-with(., 'disassy') or starts-with(., 'fault')]) and not(ancestor::book[contains(@doctype,'oh')] and ancestor::ata-page-block/@pb-name[starts-with(., 'clean')]) and not(ancestor::book[contains(@doctype,'oh')] and ancestor::page-block/@pb-name[starts-with(., 'clean')]) and not(ancestor::ata-page-block/@pb-name[starts-with(., 'mainprac')]) and not(ancestor::page-block/@pb-name[starts-with(., 'mainprac')]) and not(ancestor::book[contains(@doctype,'oh')] and ancestor::ata-page-block/@pb-name[starts-with(., 'inspect')]) and not(ancestor::book[contains(@doctype,'oh')] and ancestor::page-block/@pb-name[starts-with(., 'inspect')]) and not(ancestor::ata-page-block/@pb-name[(starts-with(., 'di') and 'di' = translate(., '0123456789', '') and string-length(.) &gt; 2) or starts-with(.,'service')]) and not(ancestor::page-block/@pb-name[(starts-with(., 'di') and 'di' = translate(., '0123456789', '') and string-length(.) &gt; 2) or starts-with(.,'service')]) and not(ancestor::book[contains(@doctype,'oh')] and ancestor::ata-page-block/@pb-name[starts-with(., 'repair')]) and not(ancestor::book[contains(@doctype,'oh')] and ancestor::page-block/@pb-name[starts-with(., 'repair')]) and not(ancestor::ata-page-block/@pb-name[(starts-with(., 'cl') and 'cl' = translate(., '0123456789', '') and string-length(.) &gt; 2) or .='install' or starts-with(.,'rem-inst') or (starts-with(., 'reminst') and 'reminst' = translate(., '0123456789', '') and string-length(.) &gt; 7) or .='remove' or (starts-with(., 'repair') and 'repair' = translate(., '0123456789', '') and string-length(.) &gt; 6)]) and not(ancestor::page-block/@pb-name[(starts-with(., 'cl') and 'cl' = translate(., '0123456789', '') and string-length(.) &gt; 2) or .='install' or starts-with(.,'rem-inst') or (starts-with(., 'reminst') and 'reminst' = translate(., '0123456789', '') and string-length(.) &gt; 7) or .='remove' or (starts-with(., 'repair') and 'repair' = translate(., '0123456789', '') and string-length(.) &gt; 6)]) and not(ancestor::ata-page-block/@pb-name[starts-with(., 'assy') or (starts-with(., 'ic') and 'ic' = translate(., '0123456789', '') and string-length(.) &gt; 2) or (starts-with(., 'te') and 'te' = translate(., '0123456789', '') and string-length(.) &gt; 2) or .='test']) and not(ancestor::page-block/@pb-name[starts-with(., 'assy') or (starts-with(., 'ic') and 'ic' = translate(., '0123456789', '') and string-length(.) &gt; 2) or (starts-with(., 'te') and 'te' = translate(., '0123456789', '') and string-length(.) &gt; 2) or .='test']) and not(ancestor::ata-page-block/@pb-name[.='f-and-c' or starts-with(., 'inspect') or (starts-with(., 're') and 're' = translate(., '0123456789', '') and string-length(.) &gt; 2)]) and (ancestor::page-block/@pb-name[.='f-and-c' or starts-with(., 'inspect') or (starts-with(., 're') and 're' = translate(., '0123456789', '') and string-length(.) &gt; 2)])">
               <xsl:attribute name="_gte:count-as-id">cnt__table^page-block.cnt</xsl:attribute>
            </xsl:when>
            <xsl:when test="not(ancestor::book[contains(@doctype,'cir') or contains(@doctype,'em') or contains(@doctype,'tmm')]) and not(ancestor::book[contains(@doctype,'oh')] and ancestor::ata-page-block/@pb-name[.='service']) and not(ancestor::book[contains(@doctype,'oh')] and ancestor::page-block/@pb-name[.='service']) and not(ancestor::ata-page-block/@pb-name[.='00awl' or .='00intro' or .='airlim' or .='awl' or .='awlror' or .='chapsect' or .='consume' or .='d-and-o' or .='frontmatte' or .='howtouse' or .='00howtouse' or .='intro' or .='nut_option' or .='oplimits' or .='sblist' or .='schedchk' or .='spectool' or .='timelim' or .='title-page']) and not(ancestor::page-block/@pb-name[.='00awl' or .='00intro' or .='airlim' or .='awl' or .='awlror' or .='chapsect' or .='consume' or .='d-and-o' or .='frontmatte' or .='howtouse' or .='00howtouse' or .='intro' or .='nut_option' or .='oplimits' or .='sblist' or .='schedchk' or .='spectool' or .='timelim' or .='title-page']) and not(ancestor::ata-page-block/@pb-name[(starts-with(., 'do') and 'do' = translate(., '0123456789', '') and string-length(.) &gt; 2) or (starts-with(., 'in') and 'in' = translate(., '0123456789', '') and string-length(.) &gt; 2) or (starts-with(., 'tl') and 'tl' = translate(., '0123456789', '') and string-length(.) &gt; 2) or .='toolsht' or .='trlist' or .='unschedc' or .='unschedchk']) and not(ancestor::page-block/@pb-name[(starts-with(., 'do') and 'do' = translate(., '0123456789', '') and string-length(.) &gt; 2) or (starts-with(., 'in') and 'in' = translate(., '0123456789', '') and string-length(.) &gt; 2) or (starts-with(., 'tl') and 'tl' = translate(., '0123456789', '') and string-length(.) &gt; 2) or .='toolsht' or .='trlist' or .='unschedc' or .='unschedchk']) and not(ancestor-or-self::ata-page-block[1]/@pb-name and string(ancestor-or-self::ata-page-block[1]/@pb-name)='intro00') and not(ancestor-or-self::page-block[1]/@pb-name and string(ancestor-or-self::page-block[1]/@pb-name)='intro00') and not(ancestor::ata-page-block/@pb-name[starts-with(., 'disassy') or starts-with(., 'fault')]) and not(ancestor::page-block/@pb-name[starts-with(., 'disassy') or starts-with(., 'fault')]) and not(ancestor::book[contains(@doctype,'oh')] and ancestor::ata-page-block/@pb-name[starts-with(., 'clean')]) and not(ancestor::book[contains(@doctype,'oh')] and ancestor::page-block/@pb-name[starts-with(., 'clean')]) and not(ancestor::ata-page-block/@pb-name[starts-with(., 'mainprac')]) and not(ancestor::page-block/@pb-name[starts-with(., 'mainprac')]) and not(ancestor::book[contains(@doctype,'oh')] and ancestor::ata-page-block/@pb-name[starts-with(., 'inspect')]) and not(ancestor::book[contains(@doctype,'oh')] and ancestor::page-block/@pb-name[starts-with(., 'inspect')]) and not(ancestor::ata-page-block/@pb-name[(starts-with(., 'di') and 'di' = translate(., '0123456789', '') and string-length(.) &gt; 2) or starts-with(.,'service')]) and not(ancestor::page-block/@pb-name[(starts-with(., 'di') and 'di' = translate(., '0123456789', '') and string-length(.) &gt; 2) or starts-with(.,'service')]) and not(ancestor::book[contains(@doctype,'oh')] and ancestor::ata-page-block/@pb-name[starts-with(., 'repair')]) and not(ancestor::book[contains(@doctype,'oh')] and ancestor::page-block/@pb-name[starts-with(., 'repair')]) and not(ancestor::ata-page-block/@pb-name[(starts-with(., 'cl') and 'cl' = translate(., '0123456789', '') and string-length(.) &gt; 2) or .='install' or starts-with(.,'rem-inst') or (starts-with(., 'reminst') and 'reminst' = translate(., '0123456789', '') and string-length(.) &gt; 7) or .='remove' or (starts-with(., 'repair') and 'repair' = translate(., '0123456789', '') and string-length(.) &gt; 6)]) and not(ancestor::page-block/@pb-name[(starts-with(., 'cl') and 'cl' = translate(., '0123456789', '') and string-length(.) &gt; 2) or .='install' or starts-with(.,'rem-inst') or (starts-with(., 'reminst') and 'reminst' = translate(., '0123456789', '') and string-length(.) &gt; 7) or .='remove' or (starts-with(., 'repair') and 'repair' = translate(., '0123456789', '') and string-length(.) &gt; 6)]) and not(ancestor::ata-page-block/@pb-name[starts-with(., 'assy') or (starts-with(., 'ic') and 'ic' = translate(., '0123456789', '') and string-length(.) &gt; 2) or (starts-with(., 'te') and 'te' = translate(., '0123456789', '') and string-length(.) &gt; 2) or .='test']) and not(ancestor::page-block/@pb-name[starts-with(., 'assy') or (starts-with(., 'ic') and 'ic' = translate(., '0123456789', '') and string-length(.) &gt; 2) or (starts-with(., 'te') and 'te' = translate(., '0123456789', '') and string-length(.) &gt; 2) or .='test']) and (ancestor::ata-page-block/@pb-name[.='f-and-c' or starts-with(., 'inspect') or (starts-with(., 're') and 're' = translate(., '0123456789', '') and string-length(.) &gt; 2)])">
               <xsl:attribute name="_gte:count-as-id">cnt__table^ata-page-block.cnt</xsl:attribute>
            </xsl:when>
            <xsl:when test="not(ancestor::book[contains(@doctype,'cir') or contains(@doctype,'em') or contains(@doctype,'tmm')]) and not(ancestor::book[contains(@doctype,'oh')] and ancestor::ata-page-block/@pb-name[.='service']) and not(ancestor::book[contains(@doctype,'oh')] and ancestor::page-block/@pb-name[.='service']) and not(ancestor::ata-page-block/@pb-name[.='00awl' or .='00intro' or .='airlim' or .='awl' or .='awlror' or .='chapsect' or .='consume' or .='d-and-o' or .='frontmatte' or .='howtouse' or .='00howtouse' or .='intro' or .='nut_option' or .='oplimits' or .='sblist' or .='schedchk' or .='spectool' or .='timelim' or .='title-page']) and not(ancestor::page-block/@pb-name[.='00awl' or .='00intro' or .='airlim' or .='awl' or .='awlror' or .='chapsect' or .='consume' or .='d-and-o' or .='frontmatte' or .='howtouse' or .='00howtouse' or .='intro' or .='nut_option' or .='oplimits' or .='sblist' or .='schedchk' or .='spectool' or .='timelim' or .='title-page']) and not(ancestor::ata-page-block/@pb-name[(starts-with(., 'do') and 'do' = translate(., '0123456789', '') and string-length(.) &gt; 2) or (starts-with(., 'in') and 'in' = translate(., '0123456789', '') and string-length(.) &gt; 2) or (starts-with(., 'tl') and 'tl' = translate(., '0123456789', '') and string-length(.) &gt; 2) or .='toolsht' or .='trlist' or .='unschedc' or .='unschedchk']) and not(ancestor::page-block/@pb-name[(starts-with(., 'do') and 'do' = translate(., '0123456789', '') and string-length(.) &gt; 2) or (starts-with(., 'in') and 'in' = translate(., '0123456789', '') and string-length(.) &gt; 2) or (starts-with(., 'tl') and 'tl' = translate(., '0123456789', '') and string-length(.) &gt; 2) or .='toolsht' or .='trlist' or .='unschedc' or .='unschedchk']) and not(ancestor-or-self::ata-page-block[1]/@pb-name and string(ancestor-or-self::ata-page-block[1]/@pb-name)='intro00') and not(ancestor-or-self::page-block[1]/@pb-name and string(ancestor-or-self::page-block[1]/@pb-name)='intro00') and not(ancestor::ata-page-block/@pb-name[starts-with(., 'disassy') or starts-with(., 'fault')]) and not(ancestor::page-block/@pb-name[starts-with(., 'disassy') or starts-with(., 'fault')]) and not(ancestor::book[contains(@doctype,'oh')] and ancestor::ata-page-block/@pb-name[starts-with(., 'clean')]) and not(ancestor::book[contains(@doctype,'oh')] and ancestor::page-block/@pb-name[starts-with(., 'clean')]) and not(ancestor::ata-page-block/@pb-name[starts-with(., 'mainprac')]) and not(ancestor::page-block/@pb-name[starts-with(., 'mainprac')]) and not(ancestor::book[contains(@doctype,'oh')] and ancestor::ata-page-block/@pb-name[starts-with(., 'inspect')]) and not(ancestor::book[contains(@doctype,'oh')] and ancestor::page-block/@pb-name[starts-with(., 'inspect')]) and not(ancestor::ata-page-block/@pb-name[(starts-with(., 'di') and 'di' = translate(., '0123456789', '') and string-length(.) &gt; 2) or starts-with(.,'service')]) and not(ancestor::page-block/@pb-name[(starts-with(., 'di') and 'di' = translate(., '0123456789', '') and string-length(.) &gt; 2) or starts-with(.,'service')]) and not(ancestor::book[contains(@doctype,'oh')] and ancestor::ata-page-block/@pb-name[starts-with(., 'repair')]) and not(ancestor::book[contains(@doctype,'oh')] and ancestor::page-block/@pb-name[starts-with(., 'repair')]) and not(ancestor::ata-page-block/@pb-name[(starts-with(., 'cl') and 'cl' = translate(., '0123456789', '') and string-length(.) &gt; 2) or .='install' or starts-with(.,'rem-inst') or (starts-with(., 'reminst') and 'reminst' = translate(., '0123456789', '') and string-length(.) &gt; 7) or .='remove' or (starts-with(., 'repair') and 'repair' = translate(., '0123456789', '') and string-length(.) &gt; 6)]) and not(ancestor::page-block/@pb-name[(starts-with(., 'cl') and 'cl' = translate(., '0123456789', '') and string-length(.) &gt; 2) or .='install' or starts-with(.,'rem-inst') or (starts-with(., 'reminst') and 'reminst' = translate(., '0123456789', '') and string-length(.) &gt; 7) or .='remove' or (starts-with(., 'repair') and 'repair' = translate(., '0123456789', '') and string-length(.) &gt; 6)]) and not(ancestor::ata-page-block/@pb-name[starts-with(., 'assy') or (starts-with(., 'ic') and 'ic' = translate(., '0123456789', '') and string-length(.) &gt; 2) or (starts-with(., 'te') and 'te' = translate(., '0123456789', '') and string-length(.) &gt; 2) or .='test']) and (ancestor::page-block/@pb-name[starts-with(., 'assy') or (starts-with(., 'ic') and 'ic' = translate(., '0123456789', '') and string-length(.) &gt; 2) or (starts-with(., 'te') and 'te' = translate(., '0123456789', '') and string-length(.) &gt; 2) or .='test'])">
               <xsl:attribute name="_gte:count-as-id">cnt__table^page-block.cnt</xsl:attribute>
            </xsl:when>
            <xsl:when test="not(ancestor::book[contains(@doctype,'cir') or contains(@doctype,'em') or contains(@doctype,'tmm')]) and not(ancestor::book[contains(@doctype,'oh')] and ancestor::ata-page-block/@pb-name[.='service']) and not(ancestor::book[contains(@doctype,'oh')] and ancestor::page-block/@pb-name[.='service']) and not(ancestor::ata-page-block/@pb-name[.='00awl' or .='00intro' or .='airlim' or .='awl' or .='awlror' or .='chapsect' or .='consume' or .='d-and-o' or .='frontmatte' or .='howtouse' or .='00howtouse' or .='intro' or .='nut_option' or .='oplimits' or .='sblist' or .='schedchk' or .='spectool' or .='timelim' or .='title-page']) and not(ancestor::page-block/@pb-name[.='00awl' or .='00intro' or .='airlim' or .='awl' or .='awlror' or .='chapsect' or .='consume' or .='d-and-o' or .='frontmatte' or .='howtouse' or .='00howtouse' or .='intro' or .='nut_option' or .='oplimits' or .='sblist' or .='schedchk' or .='spectool' or .='timelim' or .='title-page']) and not(ancestor::ata-page-block/@pb-name[(starts-with(., 'do') and 'do' = translate(., '0123456789', '') and string-length(.) &gt; 2) or (starts-with(., 'in') and 'in' = translate(., '0123456789', '') and string-length(.) &gt; 2) or (starts-with(., 'tl') and 'tl' = translate(., '0123456789', '') and string-length(.) &gt; 2) or .='toolsht' or .='trlist' or .='unschedc' or .='unschedchk']) and not(ancestor::page-block/@pb-name[(starts-with(., 'do') and 'do' = translate(., '0123456789', '') and string-length(.) &gt; 2) or (starts-with(., 'in') and 'in' = translate(., '0123456789', '') and string-length(.) &gt; 2) or (starts-with(., 'tl') and 'tl' = translate(., '0123456789', '') and string-length(.) &gt; 2) or .='toolsht' or .='trlist' or .='unschedc' or .='unschedchk']) and not(ancestor-or-self::ata-page-block[1]/@pb-name and string(ancestor-or-self::ata-page-block[1]/@pb-name)='intro00') and not(ancestor-or-self::page-block[1]/@pb-name and string(ancestor-or-self::page-block[1]/@pb-name)='intro00') and not(ancestor::ata-page-block/@pb-name[starts-with(., 'disassy') or starts-with(., 'fault')]) and not(ancestor::page-block/@pb-name[starts-with(., 'disassy') or starts-with(., 'fault')]) and not(ancestor::book[contains(@doctype,'oh')] and ancestor::ata-page-block/@pb-name[starts-with(., 'clean')]) and not(ancestor::book[contains(@doctype,'oh')] and ancestor::page-block/@pb-name[starts-with(., 'clean')]) and not(ancestor::ata-page-block/@pb-name[starts-with(., 'mainprac')]) and not(ancestor::page-block/@pb-name[starts-with(., 'mainprac')]) and not(ancestor::book[contains(@doctype,'oh')] and ancestor::ata-page-block/@pb-name[starts-with(., 'inspect')]) and not(ancestor::book[contains(@doctype,'oh')] and ancestor::page-block/@pb-name[starts-with(., 'inspect')]) and not(ancestor::ata-page-block/@pb-name[(starts-with(., 'di') and 'di' = translate(., '0123456789', '') and string-length(.) &gt; 2) or starts-with(.,'service')]) and not(ancestor::page-block/@pb-name[(starts-with(., 'di') and 'di' = translate(., '0123456789', '') and string-length(.) &gt; 2) or starts-with(.,'service')]) and not(ancestor::book[contains(@doctype,'oh')] and ancestor::ata-page-block/@pb-name[starts-with(., 'repair')]) and not(ancestor::book[contains(@doctype,'oh')] and ancestor::page-block/@pb-name[starts-with(., 'repair')]) and not(ancestor::ata-page-block/@pb-name[(starts-with(., 'cl') and 'cl' = translate(., '0123456789', '') and string-length(.) &gt; 2) or .='install' or starts-with(.,'rem-inst') or (starts-with(., 'reminst') and 'reminst' = translate(., '0123456789', '') and string-length(.) &gt; 7) or .='remove' or (starts-with(., 'repair') and 'repair' = translate(., '0123456789', '') and string-length(.) &gt; 6)]) and not(ancestor::page-block/@pb-name[(starts-with(., 'cl') and 'cl' = translate(., '0123456789', '') and string-length(.) &gt; 2) or .='install' or starts-with(.,'rem-inst') or (starts-with(., 'reminst') and 'reminst' = translate(., '0123456789', '') and string-length(.) &gt; 7) or .='remove' or (starts-with(., 'repair') and 'repair' = translate(., '0123456789', '') and string-length(.) &gt; 6)]) and (ancestor::ata-page-block/@pb-name[starts-with(., 'assy') or (starts-with(., 'ic') and 'ic' = translate(., '0123456789', '') and string-length(.) &gt; 2) or (starts-with(., 'te') and 'te' = translate(., '0123456789', '') and string-length(.) &gt; 2) or .='test'])">
               <xsl:attribute name="_gte:count-as-id">cnt__table^ata-page-block.cnt</xsl:attribute>
            </xsl:when>
            <xsl:when test="not(ancestor::book[contains(@doctype,'cir') or contains(@doctype,'em') or contains(@doctype,'tmm')]) and not(ancestor::book[contains(@doctype,'oh')] and ancestor::ata-page-block/@pb-name[.='service']) and not(ancestor::book[contains(@doctype,'oh')] and ancestor::page-block/@pb-name[.='service']) and not(ancestor::ata-page-block/@pb-name[.='00awl' or .='00intro' or .='airlim' or .='awl' or .='awlror' or .='chapsect' or .='consume' or .='d-and-o' or .='frontmatte' or .='howtouse' or .='00howtouse' or .='intro' or .='nut_option' or .='oplimits' or .='sblist' or .='schedchk' or .='spectool' or .='timelim' or .='title-page']) and not(ancestor::page-block/@pb-name[.='00awl' or .='00intro' or .='airlim' or .='awl' or .='awlror' or .='chapsect' or .='consume' or .='d-and-o' or .='frontmatte' or .='howtouse' or .='00howtouse' or .='intro' or .='nut_option' or .='oplimits' or .='sblist' or .='schedchk' or .='spectool' or .='timelim' or .='title-page']) and not(ancestor::ata-page-block/@pb-name[(starts-with(., 'do') and 'do' = translate(., '0123456789', '') and string-length(.) &gt; 2) or (starts-with(., 'in') and 'in' = translate(., '0123456789', '') and string-length(.) &gt; 2) or (starts-with(., 'tl') and 'tl' = translate(., '0123456789', '') and string-length(.) &gt; 2) or .='toolsht' or .='trlist' or .='unschedc' or .='unschedchk']) and not(ancestor::page-block/@pb-name[(starts-with(., 'do') and 'do' = translate(., '0123456789', '') and string-length(.) &gt; 2) or (starts-with(., 'in') and 'in' = translate(., '0123456789', '') and string-length(.) &gt; 2) or (starts-with(., 'tl') and 'tl' = translate(., '0123456789', '') and string-length(.) &gt; 2) or .='toolsht' or .='trlist' or .='unschedc' or .='unschedchk']) and not(ancestor-or-self::ata-page-block[1]/@pb-name and string(ancestor-or-self::ata-page-block[1]/@pb-name)='intro00') and not(ancestor-or-self::page-block[1]/@pb-name and string(ancestor-or-self::page-block[1]/@pb-name)='intro00') and not(ancestor::ata-page-block/@pb-name[starts-with(., 'disassy') or starts-with(., 'fault')]) and not(ancestor::page-block/@pb-name[starts-with(., 'disassy') or starts-with(., 'fault')]) and not(ancestor::book[contains(@doctype,'oh')] and ancestor::ata-page-block/@pb-name[starts-with(., 'clean')]) and not(ancestor::book[contains(@doctype,'oh')] and ancestor::page-block/@pb-name[starts-with(., 'clean')]) and not(ancestor::ata-page-block/@pb-name[starts-with(., 'mainprac')]) and not(ancestor::page-block/@pb-name[starts-with(., 'mainprac')]) and not(ancestor::book[contains(@doctype,'oh')] and ancestor::ata-page-block/@pb-name[starts-with(., 'inspect')]) and not(ancestor::book[contains(@doctype,'oh')] and ancestor::page-block/@pb-name[starts-with(., 'inspect')]) and not(ancestor::ata-page-block/@pb-name[(starts-with(., 'di') and 'di' = translate(., '0123456789', '') and string-length(.) &gt; 2) or starts-with(.,'service')]) and not(ancestor::page-block/@pb-name[(starts-with(., 'di') and 'di' = translate(., '0123456789', '') and string-length(.) &gt; 2) or starts-with(.,'service')]) and not(ancestor::book[contains(@doctype,'oh')] and ancestor::ata-page-block/@pb-name[starts-with(., 'repair')]) and not(ancestor::book[contains(@doctype,'oh')] and ancestor::page-block/@pb-name[starts-with(., 'repair')]) and not(ancestor::ata-page-block/@pb-name[(starts-with(., 'cl') and 'cl' = translate(., '0123456789', '') and string-length(.) &gt; 2) or .='install' or starts-with(.,'rem-inst') or (starts-with(., 'reminst') and 'reminst' = translate(., '0123456789', '') and string-length(.) &gt; 7) or .='remove' or (starts-with(., 'repair') and 'repair' = translate(., '0123456789', '') and string-length(.) &gt; 6)]) and (ancestor::page-block/@pb-name[(starts-with(., 'cl') and 'cl' = translate(., '0123456789', '') and string-length(.) &gt; 2) or .='install' or starts-with(.,'rem-inst') or (starts-with(., 'reminst') and 'reminst' = translate(., '0123456789', '') and string-length(.) &gt; 7) or .='remove' or (starts-with(., 'repair') and 'repair' = translate(., '0123456789', '') and string-length(.) &gt; 6)])">
               <xsl:attribute name="_gte:count-as-id">cnt__table^page-block.cnt</xsl:attribute>
            </xsl:when>
            <xsl:when test="not(ancestor::book[contains(@doctype,'cir') or contains(@doctype,'em') or contains(@doctype,'tmm')]) and not(ancestor::book[contains(@doctype,'oh')] and ancestor::ata-page-block/@pb-name[.='service']) and not(ancestor::book[contains(@doctype,'oh')] and ancestor::page-block/@pb-name[.='service']) and not(ancestor::ata-page-block/@pb-name[.='00awl' or .='00intro' or .='airlim' or .='awl' or .='awlror' or .='chapsect' or .='consume' or .='d-and-o' or .='frontmatte' or .='howtouse' or .='00howtouse' or .='intro' or .='nut_option' or .='oplimits' or .='sblist' or .='schedchk' or .='spectool' or .='timelim' or .='title-page']) and not(ancestor::page-block/@pb-name[.='00awl' or .='00intro' or .='airlim' or .='awl' or .='awlror' or .='chapsect' or .='consume' or .='d-and-o' or .='frontmatte' or .='howtouse' or .='00howtouse' or .='intro' or .='nut_option' or .='oplimits' or .='sblist' or .='schedchk' or .='spectool' or .='timelim' or .='title-page']) and not(ancestor::ata-page-block/@pb-name[(starts-with(., 'do') and 'do' = translate(., '0123456789', '') and string-length(.) &gt; 2) or (starts-with(., 'in') and 'in' = translate(., '0123456789', '') and string-length(.) &gt; 2) or (starts-with(., 'tl') and 'tl' = translate(., '0123456789', '') and string-length(.) &gt; 2) or .='toolsht' or .='trlist' or .='unschedc' or .='unschedchk']) and not(ancestor::page-block/@pb-name[(starts-with(., 'do') and 'do' = translate(., '0123456789', '') and string-length(.) &gt; 2) or (starts-with(., 'in') and 'in' = translate(., '0123456789', '') and string-length(.) &gt; 2) or (starts-with(., 'tl') and 'tl' = translate(., '0123456789', '') and string-length(.) &gt; 2) or .='toolsht' or .='trlist' or .='unschedc' or .='unschedchk']) and not(ancestor-or-self::ata-page-block[1]/@pb-name and string(ancestor-or-self::ata-page-block[1]/@pb-name)='intro00') and not(ancestor-or-self::page-block[1]/@pb-name and string(ancestor-or-self::page-block[1]/@pb-name)='intro00') and not(ancestor::ata-page-block/@pb-name[starts-with(., 'disassy') or starts-with(., 'fault')]) and not(ancestor::page-block/@pb-name[starts-with(., 'disassy') or starts-with(., 'fault')]) and not(ancestor::book[contains(@doctype,'oh')] and ancestor::ata-page-block/@pb-name[starts-with(., 'clean')]) and not(ancestor::book[contains(@doctype,'oh')] and ancestor::page-block/@pb-name[starts-with(., 'clean')]) and not(ancestor::ata-page-block/@pb-name[starts-with(., 'mainprac')]) and not(ancestor::page-block/@pb-name[starts-with(., 'mainprac')]) and not(ancestor::book[contains(@doctype,'oh')] and ancestor::ata-page-block/@pb-name[starts-with(., 'inspect')]) and not(ancestor::book[contains(@doctype,'oh')] and ancestor::page-block/@pb-name[starts-with(., 'inspect')]) and not(ancestor::ata-page-block/@pb-name[(starts-with(., 'di') and 'di' = translate(., '0123456789', '') and string-length(.) &gt; 2) or starts-with(.,'service')]) and not(ancestor::page-block/@pb-name[(starts-with(., 'di') and 'di' = translate(., '0123456789', '') and string-length(.) &gt; 2) or starts-with(.,'service')]) and not(ancestor::book[contains(@doctype,'oh')] and ancestor::ata-page-block/@pb-name[starts-with(., 'repair')]) and not(ancestor::book[contains(@doctype,'oh')] and ancestor::page-block/@pb-name[starts-with(., 'repair')]) and (ancestor::ata-page-block/@pb-name[(starts-with(., 'cl') and 'cl' = translate(., '0123456789', '') and string-length(.) &gt; 2) or .='install' or starts-with(.,'rem-inst') or (starts-with(., 'reminst') and 'reminst' = translate(., '0123456789', '') and string-length(.) &gt; 7) or .='remove' or (starts-with(., 'repair') and 'repair' = translate(., '0123456789', '') and string-length(.) &gt; 6)])">
               <xsl:attribute name="_gte:count-as-id">cnt__table^ata-page-block.cnt</xsl:attribute>
            </xsl:when>
            <xsl:when test="not(ancestor::book[contains(@doctype,'cir') or contains(@doctype,'em') or contains(@doctype,'tmm')]) and not(ancestor::book[contains(@doctype,'oh')] and ancestor::ata-page-block/@pb-name[.='service']) and not(ancestor::book[contains(@doctype,'oh')] and ancestor::page-block/@pb-name[.='service']) and not(ancestor::ata-page-block/@pb-name[.='00awl' or .='00intro' or .='airlim' or .='awl' or .='awlror' or .='chapsect' or .='consume' or .='d-and-o' or .='frontmatte' or .='howtouse' or .='00howtouse' or .='intro' or .='nut_option' or .='oplimits' or .='sblist' or .='schedchk' or .='spectool' or .='timelim' or .='title-page']) and not(ancestor::page-block/@pb-name[.='00awl' or .='00intro' or .='airlim' or .='awl' or .='awlror' or .='chapsect' or .='consume' or .='d-and-o' or .='frontmatte' or .='howtouse' or .='00howtouse' or .='intro' or .='nut_option' or .='oplimits' or .='sblist' or .='schedchk' or .='spectool' or .='timelim' or .='title-page']) and not(ancestor::ata-page-block/@pb-name[(starts-with(., 'do') and 'do' = translate(., '0123456789', '') and string-length(.) &gt; 2) or (starts-with(., 'in') and 'in' = translate(., '0123456789', '') and string-length(.) &gt; 2) or (starts-with(., 'tl') and 'tl' = translate(., '0123456789', '') and string-length(.) &gt; 2) or .='toolsht' or .='trlist' or .='unschedc' or .='unschedchk']) and not(ancestor::page-block/@pb-name[(starts-with(., 'do') and 'do' = translate(., '0123456789', '') and string-length(.) &gt; 2) or (starts-with(., 'in') and 'in' = translate(., '0123456789', '') and string-length(.) &gt; 2) or (starts-with(., 'tl') and 'tl' = translate(., '0123456789', '') and string-length(.) &gt; 2) or .='toolsht' or .='trlist' or .='unschedc' or .='unschedchk']) and not(ancestor-or-self::ata-page-block[1]/@pb-name and string(ancestor-or-self::ata-page-block[1]/@pb-name)='intro00') and not(ancestor-or-self::page-block[1]/@pb-name and string(ancestor-or-self::page-block[1]/@pb-name)='intro00') and not(ancestor::ata-page-block/@pb-name[starts-with(., 'disassy') or starts-with(., 'fault')]) and not(ancestor::page-block/@pb-name[starts-with(., 'disassy') or starts-with(., 'fault')]) and not(ancestor::book[contains(@doctype,'oh')] and ancestor::ata-page-block/@pb-name[starts-with(., 'clean')]) and not(ancestor::book[contains(@doctype,'oh')] and ancestor::page-block/@pb-name[starts-with(., 'clean')]) and not(ancestor::ata-page-block/@pb-name[starts-with(., 'mainprac')]) and not(ancestor::page-block/@pb-name[starts-with(., 'mainprac')]) and not(ancestor::book[contains(@doctype,'oh')] and ancestor::ata-page-block/@pb-name[starts-with(., 'inspect')]) and not(ancestor::book[contains(@doctype,'oh')] and ancestor::page-block/@pb-name[starts-with(., 'inspect')]) and not(ancestor::ata-page-block/@pb-name[(starts-with(., 'di') and 'di' = translate(., '0123456789', '') and string-length(.) &gt; 2) or starts-with(.,'service')]) and not(ancestor::page-block/@pb-name[(starts-with(., 'di') and 'di' = translate(., '0123456789', '') and string-length(.) &gt; 2) or starts-with(.,'service')]) and not(ancestor::book[contains(@doctype,'oh')] and ancestor::ata-page-block/@pb-name[starts-with(., 'repair')]) and (ancestor::book[contains(@doctype,'oh')] and ancestor::page-block/@pb-name[starts-with(., 'repair')])">
               <xsl:attribute name="_gte:count-as-id">cnt__table^page-block.cnt</xsl:attribute>
            </xsl:when>
            <xsl:when test="not(ancestor::book[contains(@doctype,'cir') or contains(@doctype,'em') or contains(@doctype,'tmm')]) and not(ancestor::book[contains(@doctype,'oh')] and ancestor::ata-page-block/@pb-name[.='service']) and not(ancestor::book[contains(@doctype,'oh')] and ancestor::page-block/@pb-name[.='service']) and not(ancestor::ata-page-block/@pb-name[.='00awl' or .='00intro' or .='airlim' or .='awl' or .='awlror' or .='chapsect' or .='consume' or .='d-and-o' or .='frontmatte' or .='howtouse' or .='00howtouse' or .='intro' or .='nut_option' or .='oplimits' or .='sblist' or .='schedchk' or .='spectool' or .='timelim' or .='title-page']) and not(ancestor::page-block/@pb-name[.='00awl' or .='00intro' or .='airlim' or .='awl' or .='awlror' or .='chapsect' or .='consume' or .='d-and-o' or .='frontmatte' or .='howtouse' or .='00howtouse' or .='intro' or .='nut_option' or .='oplimits' or .='sblist' or .='schedchk' or .='spectool' or .='timelim' or .='title-page']) and not(ancestor::ata-page-block/@pb-name[(starts-with(., 'do') and 'do' = translate(., '0123456789', '') and string-length(.) &gt; 2) or (starts-with(., 'in') and 'in' = translate(., '0123456789', '') and string-length(.) &gt; 2) or (starts-with(., 'tl') and 'tl' = translate(., '0123456789', '') and string-length(.) &gt; 2) or .='toolsht' or .='trlist' or .='unschedc' or .='unschedchk']) and not(ancestor::page-block/@pb-name[(starts-with(., 'do') and 'do' = translate(., '0123456789', '') and string-length(.) &gt; 2) or (starts-with(., 'in') and 'in' = translate(., '0123456789', '') and string-length(.) &gt; 2) or (starts-with(., 'tl') and 'tl' = translate(., '0123456789', '') and string-length(.) &gt; 2) or .='toolsht' or .='trlist' or .='unschedc' or .='unschedchk']) and not(ancestor-or-self::ata-page-block[1]/@pb-name and string(ancestor-or-self::ata-page-block[1]/@pb-name)='intro00') and not(ancestor-or-self::page-block[1]/@pb-name and string(ancestor-or-self::page-block[1]/@pb-name)='intro00') and not(ancestor::ata-page-block/@pb-name[starts-with(., 'disassy') or starts-with(., 'fault')]) and not(ancestor::page-block/@pb-name[starts-with(., 'disassy') or starts-with(., 'fault')]) and not(ancestor::book[contains(@doctype,'oh')] and ancestor::ata-page-block/@pb-name[starts-with(., 'clean')]) and not(ancestor::book[contains(@doctype,'oh')] and ancestor::page-block/@pb-name[starts-with(., 'clean')]) and not(ancestor::ata-page-block/@pb-name[starts-with(., 'mainprac')]) and not(ancestor::page-block/@pb-name[starts-with(., 'mainprac')]) and not(ancestor::book[contains(@doctype,'oh')] and ancestor::ata-page-block/@pb-name[starts-with(., 'inspect')]) and not(ancestor::book[contains(@doctype,'oh')] and ancestor::page-block/@pb-name[starts-with(., 'inspect')]) and not(ancestor::ata-page-block/@pb-name[(starts-with(., 'di') and 'di' = translate(., '0123456789', '') and string-length(.) &gt; 2) or starts-with(.,'service')]) and not(ancestor::page-block/@pb-name[(starts-with(., 'di') and 'di' = translate(., '0123456789', '') and string-length(.) &gt; 2) or starts-with(.,'service')]) and (ancestor::book[contains(@doctype,'oh')] and ancestor::ata-page-block/@pb-name[starts-with(., 'repair')])">
               <xsl:attribute name="_gte:count-as-id">cnt__table^ata-page-block.cnt</xsl:attribute>
            </xsl:when>
            <xsl:when test="not(ancestor::book[contains(@doctype,'cir') or contains(@doctype,'em') or contains(@doctype,'tmm')]) and not(ancestor::book[contains(@doctype,'oh')] and ancestor::ata-page-block/@pb-name[.='service']) and not(ancestor::book[contains(@doctype,'oh')] and ancestor::page-block/@pb-name[.='service']) and not(ancestor::ata-page-block/@pb-name[.='00awl' or .='00intro' or .='airlim' or .='awl' or .='awlror' or .='chapsect' or .='consume' or .='d-and-o' or .='frontmatte' or .='howtouse' or .='00howtouse' or .='intro' or .='nut_option' or .='oplimits' or .='sblist' or .='schedchk' or .='spectool' or .='timelim' or .='title-page']) and not(ancestor::page-block/@pb-name[.='00awl' or .='00intro' or .='airlim' or .='awl' or .='awlror' or .='chapsect' or .='consume' or .='d-and-o' or .='frontmatte' or .='howtouse' or .='00howtouse' or .='intro' or .='nut_option' or .='oplimits' or .='sblist' or .='schedchk' or .='spectool' or .='timelim' or .='title-page']) and not(ancestor::ata-page-block/@pb-name[(starts-with(., 'do') and 'do' = translate(., '0123456789', '') and string-length(.) &gt; 2) or (starts-with(., 'in') and 'in' = translate(., '0123456789', '') and string-length(.) &gt; 2) or (starts-with(., 'tl') and 'tl' = translate(., '0123456789', '') and string-length(.) &gt; 2) or .='toolsht' or .='trlist' or .='unschedc' or .='unschedchk']) and not(ancestor::page-block/@pb-name[(starts-with(., 'do') and 'do' = translate(., '0123456789', '') and string-length(.) &gt; 2) or (starts-with(., 'in') and 'in' = translate(., '0123456789', '') and string-length(.) &gt; 2) or (starts-with(., 'tl') and 'tl' = translate(., '0123456789', '') and string-length(.) &gt; 2) or .='toolsht' or .='trlist' or .='unschedc' or .='unschedchk']) and not(ancestor-or-self::ata-page-block[1]/@pb-name and string(ancestor-or-self::ata-page-block[1]/@pb-name)='intro00') and not(ancestor-or-self::page-block[1]/@pb-name and string(ancestor-or-self::page-block[1]/@pb-name)='intro00') and not(ancestor::ata-page-block/@pb-name[starts-with(., 'disassy') or starts-with(., 'fault')]) and not(ancestor::page-block/@pb-name[starts-with(., 'disassy') or starts-with(., 'fault')]) and not(ancestor::book[contains(@doctype,'oh')] and ancestor::ata-page-block/@pb-name[starts-with(., 'clean')]) and not(ancestor::book[contains(@doctype,'oh')] and ancestor::page-block/@pb-name[starts-with(., 'clean')]) and not(ancestor::ata-page-block/@pb-name[starts-with(., 'mainprac')]) and not(ancestor::page-block/@pb-name[starts-with(., 'mainprac')]) and not(ancestor::book[contains(@doctype,'oh')] and ancestor::ata-page-block/@pb-name[starts-with(., 'inspect')]) and not(ancestor::book[contains(@doctype,'oh')] and ancestor::page-block/@pb-name[starts-with(., 'inspect')]) and not(ancestor::ata-page-block/@pb-name[(starts-with(., 'di') and 'di' = translate(., '0123456789', '') and string-length(.) &gt; 2) or starts-with(.,'service')]) and (ancestor::page-block/@pb-name[(starts-with(., 'di') and 'di' = translate(., '0123456789', '') and string-length(.) &gt; 2) or starts-with(.,'service')])">
               <xsl:attribute name="_gte:count-as-id">cnt__table^page-block.cnt</xsl:attribute>
            </xsl:when>
            <xsl:when test="not(ancestor::book[contains(@doctype,'cir') or contains(@doctype,'em') or contains(@doctype,'tmm')]) and not(ancestor::book[contains(@doctype,'oh')] and ancestor::ata-page-block/@pb-name[.='service']) and not(ancestor::book[contains(@doctype,'oh')] and ancestor::page-block/@pb-name[.='service']) and not(ancestor::ata-page-block/@pb-name[.='00awl' or .='00intro' or .='airlim' or .='awl' or .='awlror' or .='chapsect' or .='consume' or .='d-and-o' or .='frontmatte' or .='howtouse' or .='00howtouse' or .='intro' or .='nut_option' or .='oplimits' or .='sblist' or .='schedchk' or .='spectool' or .='timelim' or .='title-page']) and not(ancestor::page-block/@pb-name[.='00awl' or .='00intro' or .='airlim' or .='awl' or .='awlror' or .='chapsect' or .='consume' or .='d-and-o' or .='frontmatte' or .='howtouse' or .='00howtouse' or .='intro' or .='nut_option' or .='oplimits' or .='sblist' or .='schedchk' or .='spectool' or .='timelim' or .='title-page']) and not(ancestor::ata-page-block/@pb-name[(starts-with(., 'do') and 'do' = translate(., '0123456789', '') and string-length(.) &gt; 2) or (starts-with(., 'in') and 'in' = translate(., '0123456789', '') and string-length(.) &gt; 2) or (starts-with(., 'tl') and 'tl' = translate(., '0123456789', '') and string-length(.) &gt; 2) or .='toolsht' or .='trlist' or .='unschedc' or .='unschedchk']) and not(ancestor::page-block/@pb-name[(starts-with(., 'do') and 'do' = translate(., '0123456789', '') and string-length(.) &gt; 2) or (starts-with(., 'in') and 'in' = translate(., '0123456789', '') and string-length(.) &gt; 2) or (starts-with(., 'tl') and 'tl' = translate(., '0123456789', '') and string-length(.) &gt; 2) or .='toolsht' or .='trlist' or .='unschedc' or .='unschedchk']) and not(ancestor-or-self::ata-page-block[1]/@pb-name and string(ancestor-or-self::ata-page-block[1]/@pb-name)='intro00') and not(ancestor-or-self::page-block[1]/@pb-name and string(ancestor-or-self::page-block[1]/@pb-name)='intro00') and not(ancestor::ata-page-block/@pb-name[starts-with(., 'disassy') or starts-with(., 'fault')]) and not(ancestor::page-block/@pb-name[starts-with(., 'disassy') or starts-with(., 'fault')]) and not(ancestor::book[contains(@doctype,'oh')] and ancestor::ata-page-block/@pb-name[starts-with(., 'clean')]) and not(ancestor::book[contains(@doctype,'oh')] and ancestor::page-block/@pb-name[starts-with(., 'clean')]) and not(ancestor::ata-page-block/@pb-name[starts-with(., 'mainprac')]) and not(ancestor::page-block/@pb-name[starts-with(., 'mainprac')]) and not(ancestor::book[contains(@doctype,'oh')] and ancestor::ata-page-block/@pb-name[starts-with(., 'inspect')]) and not(ancestor::book[contains(@doctype,'oh')] and ancestor::page-block/@pb-name[starts-with(., 'inspect')]) and (ancestor::ata-page-block/@pb-name[(starts-with(., 'di') and 'di' = translate(., '0123456789', '') and string-length(.) &gt; 2) or starts-with(.,'service')])">
               <xsl:attribute name="_gte:count-as-id">cnt__table^ata-page-block.cnt</xsl:attribute>
            </xsl:when>
            <xsl:when test="not(ancestor::book[contains(@doctype,'cir') or contains(@doctype,'em') or contains(@doctype,'tmm')]) and not(ancestor::book[contains(@doctype,'oh')] and ancestor::ata-page-block/@pb-name[.='service']) and not(ancestor::book[contains(@doctype,'oh')] and ancestor::page-block/@pb-name[.='service']) and not(ancestor::ata-page-block/@pb-name[.='00awl' or .='00intro' or .='airlim' or .='awl' or .='awlror' or .='chapsect' or .='consume' or .='d-and-o' or .='frontmatte' or .='howtouse' or .='00howtouse' or .='intro' or .='nut_option' or .='oplimits' or .='sblist' or .='schedchk' or .='spectool' or .='timelim' or .='title-page']) and not(ancestor::page-block/@pb-name[.='00awl' or .='00intro' or .='airlim' or .='awl' or .='awlror' or .='chapsect' or .='consume' or .='d-and-o' or .='frontmatte' or .='howtouse' or .='00howtouse' or .='intro' or .='nut_option' or .='oplimits' or .='sblist' or .='schedchk' or .='spectool' or .='timelim' or .='title-page']) and not(ancestor::ata-page-block/@pb-name[(starts-with(., 'do') and 'do' = translate(., '0123456789', '') and string-length(.) &gt; 2) or (starts-with(., 'in') and 'in' = translate(., '0123456789', '') and string-length(.) &gt; 2) or (starts-with(., 'tl') and 'tl' = translate(., '0123456789', '') and string-length(.) &gt; 2) or .='toolsht' or .='trlist' or .='unschedc' or .='unschedchk']) and not(ancestor::page-block/@pb-name[(starts-with(., 'do') and 'do' = translate(., '0123456789', '') and string-length(.) &gt; 2) or (starts-with(., 'in') and 'in' = translate(., '0123456789', '') and string-length(.) &gt; 2) or (starts-with(., 'tl') and 'tl' = translate(., '0123456789', '') and string-length(.) &gt; 2) or .='toolsht' or .='trlist' or .='unschedc' or .='unschedchk']) and not(ancestor-or-self::ata-page-block[1]/@pb-name and string(ancestor-or-self::ata-page-block[1]/@pb-name)='intro00') and not(ancestor-or-self::page-block[1]/@pb-name and string(ancestor-or-self::page-block[1]/@pb-name)='intro00') and not(ancestor::ata-page-block/@pb-name[starts-with(., 'disassy') or starts-with(., 'fault')]) and not(ancestor::page-block/@pb-name[starts-with(., 'disassy') or starts-with(., 'fault')]) and not(ancestor::book[contains(@doctype,'oh')] and ancestor::ata-page-block/@pb-name[starts-with(., 'clean')]) and not(ancestor::book[contains(@doctype,'oh')] and ancestor::page-block/@pb-name[starts-with(., 'clean')]) and not(ancestor::ata-page-block/@pb-name[starts-with(., 'mainprac')]) and not(ancestor::page-block/@pb-name[starts-with(., 'mainprac')]) and not(ancestor::book[contains(@doctype,'oh')] and ancestor::ata-page-block/@pb-name[starts-with(., 'inspect')]) and (ancestor::book[contains(@doctype,'oh')] and ancestor::page-block/@pb-name[starts-with(., 'inspect')])">
               <xsl:attribute name="_gte:count-as-id">cnt__table^page-block.cnt</xsl:attribute>
            </xsl:when>
            <xsl:when test="not(ancestor::book[contains(@doctype,'cir') or contains(@doctype,'em') or contains(@doctype,'tmm')]) and not(ancestor::book[contains(@doctype,'oh')] and ancestor::ata-page-block/@pb-name[.='service']) and not(ancestor::book[contains(@doctype,'oh')] and ancestor::page-block/@pb-name[.='service']) and not(ancestor::ata-page-block/@pb-name[.='00awl' or .='00intro' or .='airlim' or .='awl' or .='awlror' or .='chapsect' or .='consume' or .='d-and-o' or .='frontmatte' or .='howtouse' or .='00howtouse' or .='intro' or .='nut_option' or .='oplimits' or .='sblist' or .='schedchk' or .='spectool' or .='timelim' or .='title-page']) and not(ancestor::page-block/@pb-name[.='00awl' or .='00intro' or .='airlim' or .='awl' or .='awlror' or .='chapsect' or .='consume' or .='d-and-o' or .='frontmatte' or .='howtouse' or .='00howtouse' or .='intro' or .='nut_option' or .='oplimits' or .='sblist' or .='schedchk' or .='spectool' or .='timelim' or .='title-page']) and not(ancestor::ata-page-block/@pb-name[(starts-with(., 'do') and 'do' = translate(., '0123456789', '') and string-length(.) &gt; 2) or (starts-with(., 'in') and 'in' = translate(., '0123456789', '') and string-length(.) &gt; 2) or (starts-with(., 'tl') and 'tl' = translate(., '0123456789', '') and string-length(.) &gt; 2) or .='toolsht' or .='trlist' or .='unschedc' or .='unschedchk']) and not(ancestor::page-block/@pb-name[(starts-with(., 'do') and 'do' = translate(., '0123456789', '') and string-length(.) &gt; 2) or (starts-with(., 'in') and 'in' = translate(., '0123456789', '') and string-length(.) &gt; 2) or (starts-with(., 'tl') and 'tl' = translate(., '0123456789', '') and string-length(.) &gt; 2) or .='toolsht' or .='trlist' or .='unschedc' or .='unschedchk']) and not(ancestor-or-self::ata-page-block[1]/@pb-name and string(ancestor-or-self::ata-page-block[1]/@pb-name)='intro00') and not(ancestor-or-self::page-block[1]/@pb-name and string(ancestor-or-self::page-block[1]/@pb-name)='intro00') and not(ancestor::ata-page-block/@pb-name[starts-with(., 'disassy') or starts-with(., 'fault')]) and not(ancestor::page-block/@pb-name[starts-with(., 'disassy') or starts-with(., 'fault')]) and not(ancestor::book[contains(@doctype,'oh')] and ancestor::ata-page-block/@pb-name[starts-with(., 'clean')]) and not(ancestor::book[contains(@doctype,'oh')] and ancestor::page-block/@pb-name[starts-with(., 'clean')]) and not(ancestor::ata-page-block/@pb-name[starts-with(., 'mainprac')]) and not(ancestor::page-block/@pb-name[starts-with(., 'mainprac')]) and (ancestor::book[contains(@doctype,'oh')] and ancestor::ata-page-block/@pb-name[starts-with(., 'inspect')])">
               <xsl:attribute name="_gte:count-as-id">cnt__table^ata-page-block.cnt</xsl:attribute>
            </xsl:when>
            <xsl:when test="not(ancestor::book[contains(@doctype,'cir') or contains(@doctype,'em') or contains(@doctype,'tmm')]) and not(ancestor::book[contains(@doctype,'oh')] and ancestor::ata-page-block/@pb-name[.='service']) and not(ancestor::book[contains(@doctype,'oh')] and ancestor::page-block/@pb-name[.='service']) and not(ancestor::ata-page-block/@pb-name[.='00awl' or .='00intro' or .='airlim' or .='awl' or .='awlror' or .='chapsect' or .='consume' or .='d-and-o' or .='frontmatte' or .='howtouse' or .='00howtouse' or .='intro' or .='nut_option' or .='oplimits' or .='sblist' or .='schedchk' or .='spectool' or .='timelim' or .='title-page']) and not(ancestor::page-block/@pb-name[.='00awl' or .='00intro' or .='airlim' or .='awl' or .='awlror' or .='chapsect' or .='consume' or .='d-and-o' or .='frontmatte' or .='howtouse' or .='00howtouse' or .='intro' or .='nut_option' or .='oplimits' or .='sblist' or .='schedchk' or .='spectool' or .='timelim' or .='title-page']) and not(ancestor::ata-page-block/@pb-name[(starts-with(., 'do') and 'do' = translate(., '0123456789', '') and string-length(.) &gt; 2) or (starts-with(., 'in') and 'in' = translate(., '0123456789', '') and string-length(.) &gt; 2) or (starts-with(., 'tl') and 'tl' = translate(., '0123456789', '') and string-length(.) &gt; 2) or .='toolsht' or .='trlist' or .='unschedc' or .='unschedchk']) and not(ancestor::page-block/@pb-name[(starts-with(., 'do') and 'do' = translate(., '0123456789', '') and string-length(.) &gt; 2) or (starts-with(., 'in') and 'in' = translate(., '0123456789', '') and string-length(.) &gt; 2) or (starts-with(., 'tl') and 'tl' = translate(., '0123456789', '') and string-length(.) &gt; 2) or .='toolsht' or .='trlist' or .='unschedc' or .='unschedchk']) and not(ancestor-or-self::ata-page-block[1]/@pb-name and string(ancestor-or-self::ata-page-block[1]/@pb-name)='intro00') and not(ancestor-or-self::page-block[1]/@pb-name and string(ancestor-or-self::page-block[1]/@pb-name)='intro00') and not(ancestor::ata-page-block/@pb-name[starts-with(., 'disassy') or starts-with(., 'fault')]) and not(ancestor::page-block/@pb-name[starts-with(., 'disassy') or starts-with(., 'fault')]) and not(ancestor::book[contains(@doctype,'oh')] and ancestor::ata-page-block/@pb-name[starts-with(., 'clean')]) and not(ancestor::book[contains(@doctype,'oh')] and ancestor::page-block/@pb-name[starts-with(., 'clean')]) and not(ancestor::ata-page-block/@pb-name[starts-with(., 'mainprac')]) and (ancestor::page-block/@pb-name[starts-with(., 'mainprac')])">
               <xsl:attribute name="_gte:count-as-id">cnt__table^page-block.cnt</xsl:attribute>
            </xsl:when>
            <xsl:when test="not(ancestor::book[contains(@doctype,'cir') or contains(@doctype,'em') or contains(@doctype,'tmm')]) and not(ancestor::book[contains(@doctype,'oh')] and ancestor::ata-page-block/@pb-name[.='service']) and not(ancestor::book[contains(@doctype,'oh')] and ancestor::page-block/@pb-name[.='service']) and not(ancestor::ata-page-block/@pb-name[.='00awl' or .='00intro' or .='airlim' or .='awl' or .='awlror' or .='chapsect' or .='consume' or .='d-and-o' or .='frontmatte' or .='howtouse' or .='00howtouse' or .='intro' or .='nut_option' or .='oplimits' or .='sblist' or .='schedchk' or .='spectool' or .='timelim' or .='title-page']) and not(ancestor::page-block/@pb-name[.='00awl' or .='00intro' or .='airlim' or .='awl' or .='awlror' or .='chapsect' or .='consume' or .='d-and-o' or .='frontmatte' or .='howtouse' or .='00howtouse' or .='intro' or .='nut_option' or .='oplimits' or .='sblist' or .='schedchk' or .='spectool' or .='timelim' or .='title-page']) and not(ancestor::ata-page-block/@pb-name[(starts-with(., 'do') and 'do' = translate(., '0123456789', '') and string-length(.) &gt; 2) or (starts-with(., 'in') and 'in' = translate(., '0123456789', '') and string-length(.) &gt; 2) or (starts-with(., 'tl') and 'tl' = translate(., '0123456789', '') and string-length(.) &gt; 2) or .='toolsht' or .='trlist' or .='unschedc' or .='unschedchk']) and not(ancestor::page-block/@pb-name[(starts-with(., 'do') and 'do' = translate(., '0123456789', '') and string-length(.) &gt; 2) or (starts-with(., 'in') and 'in' = translate(., '0123456789', '') and string-length(.) &gt; 2) or (starts-with(., 'tl') and 'tl' = translate(., '0123456789', '') and string-length(.) &gt; 2) or .='toolsht' or .='trlist' or .='unschedc' or .='unschedchk']) and not(ancestor-or-self::ata-page-block[1]/@pb-name and string(ancestor-or-self::ata-page-block[1]/@pb-name)='intro00') and not(ancestor-or-self::page-block[1]/@pb-name and string(ancestor-or-self::page-block[1]/@pb-name)='intro00') and not(ancestor::ata-page-block/@pb-name[starts-with(., 'disassy') or starts-with(., 'fault')]) and not(ancestor::page-block/@pb-name[starts-with(., 'disassy') or starts-with(., 'fault')]) and not(ancestor::book[contains(@doctype,'oh')] and ancestor::ata-page-block/@pb-name[starts-with(., 'clean')]) and not(ancestor::book[contains(@doctype,'oh')] and ancestor::page-block/@pb-name[starts-with(., 'clean')]) and (ancestor::ata-page-block/@pb-name[starts-with(., 'mainprac')])">
               <xsl:attribute name="_gte:count-as-id">cnt__table^ata-page-block.cnt</xsl:attribute>
            </xsl:when>
            <xsl:when test="not(ancestor::book[contains(@doctype,'cir') or contains(@doctype,'em') or contains(@doctype,'tmm')]) and not(ancestor::book[contains(@doctype,'oh')] and ancestor::ata-page-block/@pb-name[.='service']) and not(ancestor::book[contains(@doctype,'oh')] and ancestor::page-block/@pb-name[.='service']) and not(ancestor::ata-page-block/@pb-name[.='00awl' or .='00intro' or .='airlim' or .='awl' or .='awlror' or .='chapsect' or .='consume' or .='d-and-o' or .='frontmatte' or .='howtouse' or .='00howtouse' or .='intro' or .='nut_option' or .='oplimits' or .='sblist' or .='schedchk' or .='spectool' or .='timelim' or .='title-page']) and not(ancestor::page-block/@pb-name[.='00awl' or .='00intro' or .='airlim' or .='awl' or .='awlror' or .='chapsect' or .='consume' or .='d-and-o' or .='frontmatte' or .='howtouse' or .='00howtouse' or .='intro' or .='nut_option' or .='oplimits' or .='sblist' or .='schedchk' or .='spectool' or .='timelim' or .='title-page']) and not(ancestor::ata-page-block/@pb-name[(starts-with(., 'do') and 'do' = translate(., '0123456789', '') and string-length(.) &gt; 2) or (starts-with(., 'in') and 'in' = translate(., '0123456789', '') and string-length(.) &gt; 2) or (starts-with(., 'tl') and 'tl' = translate(., '0123456789', '') and string-length(.) &gt; 2) or .='toolsht' or .='trlist' or .='unschedc' or .='unschedchk']) and not(ancestor::page-block/@pb-name[(starts-with(., 'do') and 'do' = translate(., '0123456789', '') and string-length(.) &gt; 2) or (starts-with(., 'in') and 'in' = translate(., '0123456789', '') and string-length(.) &gt; 2) or (starts-with(., 'tl') and 'tl' = translate(., '0123456789', '') and string-length(.) &gt; 2) or .='toolsht' or .='trlist' or .='unschedc' or .='unschedchk']) and not(ancestor-or-self::ata-page-block[1]/@pb-name and string(ancestor-or-self::ata-page-block[1]/@pb-name)='intro00') and not(ancestor-or-self::page-block[1]/@pb-name and string(ancestor-or-self::page-block[1]/@pb-name)='intro00') and not(ancestor::ata-page-block/@pb-name[starts-with(., 'disassy') or starts-with(., 'fault')]) and not(ancestor::page-block/@pb-name[starts-with(., 'disassy') or starts-with(., 'fault')]) and not(ancestor::book[contains(@doctype,'oh')] and ancestor::ata-page-block/@pb-name[starts-with(., 'clean')]) and (ancestor::book[contains(@doctype,'oh')] and ancestor::page-block/@pb-name[starts-with(., 'clean')])">
               <xsl:attribute name="_gte:count-as-id">cnt__table^page-block.cnt</xsl:attribute>
            </xsl:when>
            <xsl:when test="not(ancestor::book[contains(@doctype,'cir') or contains(@doctype,'em') or contains(@doctype,'tmm')]) and not(ancestor::book[contains(@doctype,'oh')] and ancestor::ata-page-block/@pb-name[.='service']) and not(ancestor::book[contains(@doctype,'oh')] and ancestor::page-block/@pb-name[.='service']) and not(ancestor::ata-page-block/@pb-name[.='00awl' or .='00intro' or .='airlim' or .='awl' or .='awlror' or .='chapsect' or .='consume' or .='d-and-o' or .='frontmatte' or .='howtouse' or .='00howtouse' or .='intro' or .='nut_option' or .='oplimits' or .='sblist' or .='schedchk' or .='spectool' or .='timelim' or .='title-page']) and not(ancestor::page-block/@pb-name[.='00awl' or .='00intro' or .='airlim' or .='awl' or .='awlror' or .='chapsect' or .='consume' or .='d-and-o' or .='frontmatte' or .='howtouse' or .='00howtouse' or .='intro' or .='nut_option' or .='oplimits' or .='sblist' or .='schedchk' or .='spectool' or .='timelim' or .='title-page']) and not(ancestor::ata-page-block/@pb-name[(starts-with(., 'do') and 'do' = translate(., '0123456789', '') and string-length(.) &gt; 2) or (starts-with(., 'in') and 'in' = translate(., '0123456789', '') and string-length(.) &gt; 2) or (starts-with(., 'tl') and 'tl' = translate(., '0123456789', '') and string-length(.) &gt; 2) or .='toolsht' or .='trlist' or .='unschedc' or .='unschedchk']) and not(ancestor::page-block/@pb-name[(starts-with(., 'do') and 'do' = translate(., '0123456789', '') and string-length(.) &gt; 2) or (starts-with(., 'in') and 'in' = translate(., '0123456789', '') and string-length(.) &gt; 2) or (starts-with(., 'tl') and 'tl' = translate(., '0123456789', '') and string-length(.) &gt; 2) or .='toolsht' or .='trlist' or .='unschedc' or .='unschedchk']) and not(ancestor-or-self::ata-page-block[1]/@pb-name and string(ancestor-or-self::ata-page-block[1]/@pb-name)='intro00') and not(ancestor-or-self::page-block[1]/@pb-name and string(ancestor-or-self::page-block[1]/@pb-name)='intro00') and not(ancestor::ata-page-block/@pb-name[starts-with(., 'disassy') or starts-with(., 'fault')]) and not(ancestor::page-block/@pb-name[starts-with(., 'disassy') or starts-with(., 'fault')]) and (ancestor::book[contains(@doctype,'oh')] and ancestor::ata-page-block/@pb-name[starts-with(., 'clean')])">
               <xsl:attribute name="_gte:count-as-id">cnt__table^ata-page-block.cnt</xsl:attribute>
            </xsl:when>
            <xsl:when test="not(ancestor::book[contains(@doctype,'cir') or contains(@doctype,'em') or contains(@doctype,'tmm')]) and not(ancestor::book[contains(@doctype,'oh')] and ancestor::ata-page-block/@pb-name[.='service']) and not(ancestor::book[contains(@doctype,'oh')] and ancestor::page-block/@pb-name[.='service']) and not(ancestor::ata-page-block/@pb-name[.='00awl' or .='00intro' or .='airlim' or .='awl' or .='awlror' or .='chapsect' or .='consume' or .='d-and-o' or .='frontmatte' or .='howtouse' or .='00howtouse' or .='intro' or .='nut_option' or .='oplimits' or .='sblist' or .='schedchk' or .='spectool' or .='timelim' or .='title-page']) and not(ancestor::page-block/@pb-name[.='00awl' or .='00intro' or .='airlim' or .='awl' or .='awlror' or .='chapsect' or .='consume' or .='d-and-o' or .='frontmatte' or .='howtouse' or .='00howtouse' or .='intro' or .='nut_option' or .='oplimits' or .='sblist' or .='schedchk' or .='spectool' or .='timelim' or .='title-page']) and not(ancestor::ata-page-block/@pb-name[(starts-with(., 'do') and 'do' = translate(., '0123456789', '') and string-length(.) &gt; 2) or (starts-with(., 'in') and 'in' = translate(., '0123456789', '') and string-length(.) &gt; 2) or (starts-with(., 'tl') and 'tl' = translate(., '0123456789', '') and string-length(.) &gt; 2) or .='toolsht' or .='trlist' or .='unschedc' or .='unschedchk']) and not(ancestor::page-block/@pb-name[(starts-with(., 'do') and 'do' = translate(., '0123456789', '') and string-length(.) &gt; 2) or (starts-with(., 'in') and 'in' = translate(., '0123456789', '') and string-length(.) &gt; 2) or (starts-with(., 'tl') and 'tl' = translate(., '0123456789', '') and string-length(.) &gt; 2) or .='toolsht' or .='trlist' or .='unschedc' or .='unschedchk']) and not(ancestor-or-self::ata-page-block[1]/@pb-name and string(ancestor-or-self::ata-page-block[1]/@pb-name)='intro00') and not(ancestor-or-self::page-block[1]/@pb-name and string(ancestor-or-self::page-block[1]/@pb-name)='intro00') and not(ancestor::ata-page-block/@pb-name[starts-with(., 'disassy') or starts-with(., 'fault')]) and (ancestor::page-block/@pb-name[starts-with(., 'disassy') or starts-with(., 'fault')])">
               <xsl:attribute name="_gte:count-as-id">cnt__table^page-block.cnt</xsl:attribute>
            </xsl:when>
            <xsl:when test="not(ancestor::book[contains(@doctype,'cir') or contains(@doctype,'em') or contains(@doctype,'tmm')]) and not(ancestor::book[contains(@doctype,'oh')] and ancestor::ata-page-block/@pb-name[.='service']) and not(ancestor::book[contains(@doctype,'oh')] and ancestor::page-block/@pb-name[.='service']) and not(ancestor::ata-page-block/@pb-name[.='00awl' or .='00intro' or .='airlim' or .='awl' or .='awlror' or .='chapsect' or .='consume' or .='d-and-o' or .='frontmatte' or .='howtouse' or .='00howtouse' or .='intro' or .='nut_option' or .='oplimits' or .='sblist' or .='schedchk' or .='spectool' or .='timelim' or .='title-page']) and not(ancestor::page-block/@pb-name[.='00awl' or .='00intro' or .='airlim' or .='awl' or .='awlror' or .='chapsect' or .='consume' or .='d-and-o' or .='frontmatte' or .='howtouse' or .='00howtouse' or .='intro' or .='nut_option' or .='oplimits' or .='sblist' or .='schedchk' or .='spectool' or .='timelim' or .='title-page']) and not(ancestor::ata-page-block/@pb-name[(starts-with(., 'do') and 'do' = translate(., '0123456789', '') and string-length(.) &gt; 2) or (starts-with(., 'in') and 'in' = translate(., '0123456789', '') and string-length(.) &gt; 2) or (starts-with(., 'tl') and 'tl' = translate(., '0123456789', '') and string-length(.) &gt; 2) or .='toolsht' or .='trlist' or .='unschedc' or .='unschedchk']) and not(ancestor::page-block/@pb-name[(starts-with(., 'do') and 'do' = translate(., '0123456789', '') and string-length(.) &gt; 2) or (starts-with(., 'in') and 'in' = translate(., '0123456789', '') and string-length(.) &gt; 2) or (starts-with(., 'tl') and 'tl' = translate(., '0123456789', '') and string-length(.) &gt; 2) or .='toolsht' or .='trlist' or .='unschedc' or .='unschedchk']) and not(ancestor-or-self::ata-page-block[1]/@pb-name and string(ancestor-or-self::ata-page-block[1]/@pb-name)='intro00') and not(ancestor-or-self::page-block[1]/@pb-name and string(ancestor-or-self::page-block[1]/@pb-name)='intro00') and (ancestor::ata-page-block/@pb-name[starts-with(., 'disassy') or starts-with(., 'fault')])">
               <xsl:attribute name="_gte:count-as-id">cnt__table^ata-page-block.cnt</xsl:attribute>
            </xsl:when>
            <xsl:when test="not(ancestor::book[contains(@doctype,'cir') or contains(@doctype,'em') or contains(@doctype,'tmm')]) and not(ancestor::book[contains(@doctype,'oh')] and ancestor::ata-page-block/@pb-name[.='service']) and not(ancestor::book[contains(@doctype,'oh')] and ancestor::page-block/@pb-name[.='service']) and not(ancestor::ata-page-block/@pb-name[.='00awl' or .='00intro' or .='airlim' or .='awl' or .='awlror' or .='chapsect' or .='consume' or .='d-and-o' or .='frontmatte' or .='howtouse' or .='00howtouse' or .='intro' or .='nut_option' or .='oplimits' or .='sblist' or .='schedchk' or .='spectool' or .='timelim' or .='title-page']) and not(ancestor::page-block/@pb-name[.='00awl' or .='00intro' or .='airlim' or .='awl' or .='awlror' or .='chapsect' or .='consume' or .='d-and-o' or .='frontmatte' or .='howtouse' or .='00howtouse' or .='intro' or .='nut_option' or .='oplimits' or .='sblist' or .='schedchk' or .='spectool' or .='timelim' or .='title-page']) and not(ancestor::ata-page-block/@pb-name[(starts-with(., 'do') and 'do' = translate(., '0123456789', '') and string-length(.) &gt; 2) or (starts-with(., 'in') and 'in' = translate(., '0123456789', '') and string-length(.) &gt; 2) or (starts-with(., 'tl') and 'tl' = translate(., '0123456789', '') and string-length(.) &gt; 2) or .='toolsht' or .='trlist' or .='unschedc' or .='unschedchk']) and not(ancestor::page-block/@pb-name[(starts-with(., 'do') and 'do' = translate(., '0123456789', '') and string-length(.) &gt; 2) or (starts-with(., 'in') and 'in' = translate(., '0123456789', '') and string-length(.) &gt; 2) or (starts-with(., 'tl') and 'tl' = translate(., '0123456789', '') and string-length(.) &gt; 2) or .='toolsht' or .='trlist' or .='unschedc' or .='unschedchk']) and not(ancestor-or-self::ata-page-block[1]/@pb-name and string(ancestor-or-self::ata-page-block[1]/@pb-name)='intro00') and (ancestor-or-self::page-block[1]/@pb-name and string(ancestor-or-self::page-block[1]/@pb-name)='intro00')">
               <xsl:attribute name="_gte:count-as-id">cnt__table^page-block.cnt</xsl:attribute>
            </xsl:when>
            <xsl:when test="not(ancestor::book[contains(@doctype,'cir') or contains(@doctype,'em') or contains(@doctype,'tmm')]) and not(ancestor::book[contains(@doctype,'oh')] and ancestor::ata-page-block/@pb-name[.='service']) and not(ancestor::book[contains(@doctype,'oh')] and ancestor::page-block/@pb-name[.='service']) and not(ancestor::ata-page-block/@pb-name[.='00awl' or .='00intro' or .='airlim' or .='awl' or .='awlror' or .='chapsect' or .='consume' or .='d-and-o' or .='frontmatte' or .='howtouse' or .='00howtouse' or .='intro' or .='nut_option' or .='oplimits' or .='sblist' or .='schedchk' or .='spectool' or .='timelim' or .='title-page']) and not(ancestor::page-block/@pb-name[.='00awl' or .='00intro' or .='airlim' or .='awl' or .='awlror' or .='chapsect' or .='consume' or .='d-and-o' or .='frontmatte' or .='howtouse' or .='00howtouse' or .='intro' or .='nut_option' or .='oplimits' or .='sblist' or .='schedchk' or .='spectool' or .='timelim' or .='title-page']) and not(ancestor::ata-page-block/@pb-name[(starts-with(., 'do') and 'do' = translate(., '0123456789', '') and string-length(.) &gt; 2) or (starts-with(., 'in') and 'in' = translate(., '0123456789', '') and string-length(.) &gt; 2) or (starts-with(., 'tl') and 'tl' = translate(., '0123456789', '') and string-length(.) &gt; 2) or .='toolsht' or .='trlist' or .='unschedc' or .='unschedchk']) and not(ancestor::page-block/@pb-name[(starts-with(., 'do') and 'do' = translate(., '0123456789', '') and string-length(.) &gt; 2) or (starts-with(., 'in') and 'in' = translate(., '0123456789', '') and string-length(.) &gt; 2) or (starts-with(., 'tl') and 'tl' = translate(., '0123456789', '') and string-length(.) &gt; 2) or .='toolsht' or .='trlist' or .='unschedc' or .='unschedchk']) and (ancestor-or-self::ata-page-block[1]/@pb-name and string(ancestor-or-self::ata-page-block[1]/@pb-name)='intro00')">
               <xsl:attribute name="_gte:count-as-id">cnt__table^ata-page-block.cnt</xsl:attribute>
            </xsl:when>
            <xsl:when test="not(ancestor::book[contains(@doctype,'cir') or contains(@doctype,'em') or contains(@doctype,'tmm')]) and not(ancestor::book[contains(@doctype,'oh')] and ancestor::ata-page-block/@pb-name[.='service']) and not(ancestor::book[contains(@doctype,'oh')] and ancestor::page-block/@pb-name[.='service']) and not(ancestor::ata-page-block/@pb-name[.='00awl' or .='00intro' or .='airlim' or .='awl' or .='awlror' or .='chapsect' or .='consume' or .='d-and-o' or .='frontmatte' or .='howtouse' or .='00howtouse' or .='intro' or .='nut_option' or .='oplimits' or .='sblist' or .='schedchk' or .='spectool' or .='timelim' or .='title-page']) and not(ancestor::page-block/@pb-name[.='00awl' or .='00intro' or .='airlim' or .='awl' or .='awlror' or .='chapsect' or .='consume' or .='d-and-o' or .='frontmatte' or .='howtouse' or .='00howtouse' or .='intro' or .='nut_option' or .='oplimits' or .='sblist' or .='schedchk' or .='spectool' or .='timelim' or .='title-page']) and not(ancestor::ata-page-block/@pb-name[(starts-with(., 'do') and 'do' = translate(., '0123456789', '') and string-length(.) &gt; 2) or (starts-with(., 'in') and 'in' = translate(., '0123456789', '') and string-length(.) &gt; 2) or (starts-with(., 'tl') and 'tl' = translate(., '0123456789', '') and string-length(.) &gt; 2) or .='toolsht' or .='trlist' or .='unschedc' or .='unschedchk']) and (ancestor::page-block/@pb-name[(starts-with(., 'do') and 'do' = translate(., '0123456789', '') and string-length(.) &gt; 2) or (starts-with(., 'in') and 'in' = translate(., '0123456789', '') and string-length(.) &gt; 2) or (starts-with(., 'tl') and 'tl' = translate(., '0123456789', '') and string-length(.) &gt; 2) or .='toolsht' or .='trlist' or .='unschedc' or .='unschedchk'])">
               <xsl:attribute name="_gte:count-as-id">cnt__table^page-block.cnt</xsl:attribute>
            </xsl:when>
            <xsl:when test="not(ancestor::book[contains(@doctype,'cir') or contains(@doctype,'em') or contains(@doctype,'tmm')]) and not(ancestor::book[contains(@doctype,'oh')] and ancestor::ata-page-block/@pb-name[.='service']) and not(ancestor::book[contains(@doctype,'oh')] and ancestor::page-block/@pb-name[.='service']) and not(ancestor::ata-page-block/@pb-name[.='00awl' or .='00intro' or .='airlim' or .='awl' or .='awlror' or .='chapsect' or .='consume' or .='d-and-o' or .='frontmatte' or .='howtouse' or .='00howtouse' or .='intro' or .='nut_option' or .='oplimits' or .='sblist' or .='schedchk' or .='spectool' or .='timelim' or .='title-page']) and not(ancestor::page-block/@pb-name[.='00awl' or .='00intro' or .='airlim' or .='awl' or .='awlror' or .='chapsect' or .='consume' or .='d-and-o' or .='frontmatte' or .='howtouse' or .='00howtouse' or .='intro' or .='nut_option' or .='oplimits' or .='sblist' or .='schedchk' or .='spectool' or .='timelim' or .='title-page']) and (ancestor::ata-page-block/@pb-name[(starts-with(., 'do') and 'do' = translate(., '0123456789', '') and string-length(.) &gt; 2) or (starts-with(., 'in') and 'in' = translate(., '0123456789', '') and string-length(.) &gt; 2) or (starts-with(., 'tl') and 'tl' = translate(., '0123456789', '') and string-length(.) &gt; 2) or .='toolsht' or .='trlist' or .='unschedc' or .='unschedchk'])">
               <xsl:attribute name="_gte:count-as-id">cnt__table^ata-page-block.cnt</xsl:attribute>
            </xsl:when>
            <xsl:when test="not(ancestor::book[contains(@doctype,'cir') or contains(@doctype,'em') or contains(@doctype,'tmm')]) and not(ancestor::book[contains(@doctype,'oh')] and ancestor::ata-page-block/@pb-name[.='service']) and not(ancestor::book[contains(@doctype,'oh')] and ancestor::page-block/@pb-name[.='service']) and not(ancestor::ata-page-block/@pb-name[.='00awl' or .='00intro' or .='airlim' or .='awl' or .='awlror' or .='chapsect' or .='consume' or .='d-and-o' or .='frontmatte' or .='howtouse' or .='00howtouse' or .='intro' or .='nut_option' or .='oplimits' or .='sblist' or .='schedchk' or .='spectool' or .='timelim' or .='title-page']) and (ancestor::page-block/@pb-name[.='00awl' or .='00intro' or .='airlim' or .='awl' or .='awlror' or .='chapsect' or .='consume' or .='d-and-o' or .='frontmatte' or .='howtouse' or .='00howtouse' or .='intro' or .='nut_option' or .='oplimits' or .='sblist' or .='schedchk' or .='spectool' or .='timelim' or .='title-page'])">
               <xsl:attribute name="_gte:count-as-id">cnt__table^page-block.cnt</xsl:attribute>
            </xsl:when>
            <xsl:when test="not(ancestor::book[contains(@doctype,'cir') or contains(@doctype,'em') or contains(@doctype,'tmm')]) and not(ancestor::book[contains(@doctype,'oh')] and ancestor::ata-page-block/@pb-name[.='service']) and not(ancestor::book[contains(@doctype,'oh')] and ancestor::page-block/@pb-name[.='service']) and (ancestor::ata-page-block/@pb-name[.='00awl' or .='00intro' or .='airlim' or .='awl' or .='awlror' or .='chapsect' or .='consume' or .='d-and-o' or .='frontmatte' or .='howtouse' or .='00howtouse' or .='intro' or .='nut_option' or .='oplimits' or .='sblist' or .='schedchk' or .='spectool' or .='timelim' or .='title-page'])">
               <xsl:attribute name="_gte:count-as-id">cnt__table^ata-page-block.cnt</xsl:attribute>
            </xsl:when>
            <xsl:when test="not(ancestor::book[contains(@doctype,'cir') or contains(@doctype,'em') or contains(@doctype,'tmm')]) and not(ancestor::book[contains(@doctype,'oh')] and ancestor::ata-page-block/@pb-name[.='service']) and (ancestor::book[contains(@doctype,'oh')] and ancestor::page-block/@pb-name[.='service'])"/>
            <xsl:when test="not(ancestor::book[contains(@doctype,'cir') or contains(@doctype,'em') or contains(@doctype,'tmm')]) and (ancestor::book[contains(@doctype,'oh')] and ancestor::ata-page-block/@pb-name[.='service'])"/>
            <xsl:when test="(ancestor::book[contains(@doctype,'cir') or contains(@doctype,'em') or contains(@doctype,'tmm')]) and not(number(ancestor::pgblk/@pgblknbr)&gt;0 and number(ancestor::pgblk/@pgblknbr)&lt;=13)">
               <xsl:attribute name="_gte:count-as-id">cnt__table^pgblk.cnt</xsl:attribute>
            </xsl:when>
            <xsl:when test="(ancestor::book[contains(@doctype,'cir') or contains(@doctype,'em') or contains(@doctype,'tmm')]) and (number(ancestor::pgblk/@pgblknbr)&gt;0 and number(ancestor::pgblk/@pgblknbr)&lt;=13)">
               <xsl:attribute name="_gte:count-as-id">cnt__table^pgblk.cnt</xsl:attribute>
            </xsl:when>
            <xsl:when test="true()"><!--This is the "otherwise" clause, but there may be no when's--><!--We emit this even though we do nothing here to avoid a possible empty xsl:choose--></xsl:when>
         </xsl:choose>
         <xsl:apply-templates select="@*|node()" mode="set-countas"/>
      </xsl:copy>
   </xsl:template>

<xsl:template match="table/title" mode="set-countas" priority="5">
      <xsl:copy>
         <xsl:choose>
            <xsl:when test="(ancestor-or-self::table[1]/@tabstyle and string(ancestor-or-self::table[1]/@tabstyle)='fits-and-clears') and (/ata-page-block//table/title)">
               <xsl:attribute name="_gte:count-as-id">npara-ata</xsl:attribute>
            </xsl:when>
            <xsl:when test="(ancestor-or-self::table[1]/@tabstyle and string(ancestor-or-self::table[1]/@tabstyle)='fits-and-clears') and (/page-block//table/title)">
               <xsl:attribute name="_gte:count-as-id">npara</xsl:attribute>
            </xsl:when>
            <xsl:when test="not(ancestor::book[contains(@doctype,'cir') or contains(@doctype,'em') or contains(@doctype,'tmm')]) and not(ancestor::book[contains(@doctype,'oh')] and ancestor::ata-page-block/@pb-name[.='service']) and not(ancestor::book[contains(@doctype,'oh')] and ancestor::page-block/@pb-name[.='service']) and not(ancestor::ata-page-block/@pb-name[.='00awl' or .='00intro' or .='airlim' or .='awl' or .='awlror' or .='chapsect' or .='consume' or .='d-and-o' or .='frontmatte' or .='howtouse' or .='00howtouse' or .='intro' or .='nut_option' or .='oplimits' or .='sblist' or .='schedchk' or .='spectool' or .='timelim' or .='title-page']) and not(ancestor::page-block/@pb-name[.='00awl' or .='00intro' or .='airlim' or .='awl' or .='awlror' or .='chapsect' or .='consume' or .='d-and-o' or .='frontmatte' or .='howtouse' or .='00howtouse' or .='intro' or .='nut_option' or .='oplimits' or .='sblist' or .='schedchk' or .='spectool' or .='timelim' or .='title-page']) and not(ancestor::ata-page-block/@pb-name[(starts-with(., 'do') and 'do' = translate(., '0123456789', '') and string-length(.) &gt; 2) or (starts-with(., 'in') and 'in' = translate(., '0123456789', '') and string-length(.) &gt; 2) or (starts-with(., 'tl') and 'tl' = translate(., '0123456789', '') and string-length(.) &gt; 2) or .='toolsht' or .='trlist' or .='unschedc' or .='unschedchk']) and not(ancestor::page-block/@pb-name[(starts-with(., 'do') and 'do' = translate(., '0123456789', '') and string-length(.) &gt; 2) or (starts-with(., 'in') and 'in' = translate(., '0123456789', '') and string-length(.) &gt; 2) or (starts-with(., 'tl') and 'tl' = translate(., '0123456789', '') and string-length(.) &gt; 2) or .='toolsht' or .='trlist' or .='unschedc' or .='unschedchk']) and not(ancestor-or-self::ata-page-block[1]/@pb-name and string(ancestor-or-self::ata-page-block[1]/@pb-name)='intro00') and not(ancestor-or-self::page-block[1]/@pb-name and string(ancestor-or-self::page-block[1]/@pb-name)='intro00') and not(ancestor::ata-page-block/@pb-name[starts-with(., 'disassy') or starts-with(., 'fault')]) and not(ancestor::page-block/@pb-name[starts-with(., 'disassy') or starts-with(., 'fault')]) and not(ancestor::book[contains(@doctype,'oh')] and ancestor::ata-page-block/@pb-name[starts-with(., 'clean')]) and not(ancestor::book[contains(@doctype,'oh')] and ancestor::page-block/@pb-name[starts-with(., 'clean')]) and not(ancestor::ata-page-block/@pb-name[starts-with(., 'mainprac')]) and not(ancestor::page-block/@pb-name[starts-with(., 'mainprac')]) and not(ancestor::book[contains(@doctype,'oh')] and ancestor::ata-page-block/@pb-name[starts-with(., 'inspect')]) and not(ancestor::book[contains(@doctype,'oh')] and ancestor::page-block/@pb-name[starts-with(., 'inspect')]) and not(ancestor::ata-page-block/@pb-name[(starts-with(., 'di') and 'di' = translate(., '0123456789', '') and string-length(.) &gt; 2) or starts-with(.,'service')]) and not(ancestor::page-block/@pb-name[(starts-with(., 'di') and 'di' = translate(., '0123456789', '') and string-length(.) &gt; 2) or starts-with(.,'service')]) and not(ancestor::book[contains(@doctype,'oh')] and ancestor::ata-page-block/@pb-name[starts-with(., 'repair')]) and not(ancestor::book[contains(@doctype,'oh')] and ancestor::page-block/@pb-name[starts-with(., 'repair')]) and not(ancestor::book[contains(@doctype,'oh')] and ancestor::ata-page-block/@pb-name[starts-with(., 'test')]) and not(ancestor::book[contains(@doctype,'oh')] and ancestor::page-block/@pb-name[starts-with(., 'test')]) and not(ancestor::ata-page-block/@pb-name[(starts-with(., 'cl') and 'cl' = translate(., '0123456789', '') and string-length(.) &gt; 2) or .='install' or starts-with(.,'rem-inst') or (starts-with(., 'reminst') and 'reminst' = translate(., '0123456789', '') and string-length(.) &gt; 7) or .='remove' or (starts-with(., 'repair') and 'repair' = translate(., '0123456789', '') and string-length(.) &gt; 6)]) and not(ancestor::page-block/@pb-name[(starts-with(., 'cl') and 'cl' = translate(., '0123456789', '') and string-length(.) &gt; 2) or .='install' or starts-with(.,'rem-inst') or (starts-with(., 'reminst') and 'reminst' = translate(., '0123456789', '') and string-length(.) &gt; 7) or .='remove' or (starts-with(., 'repair') and 'repair' = translate(., '0123456789', '') and string-length(.) &gt; 6)]) and not(ancestor::ata-page-block/@pb-name[starts-with(., 'assy') or (starts-with(., 'ic') and 'ic' = translate(., '0123456789', '') and string-length(.) &gt; 2) or (starts-with(., 'te') and 'te' = translate(., '0123456789', '') and string-length(.) &gt; 2) or .='test']) and not(ancestor::page-block/@pb-name[starts-with(., 'assy') or (starts-with(., 'ic') and 'ic' = translate(., '0123456789', '') and string-length(.) &gt; 2) or (starts-with(., 'te') and 'te' = translate(., '0123456789', '') and string-length(.) &gt; 2) or .='test']) and not(ancestor::ata-page-block/@pb-name[.='f-and-c' or starts-with(., 'inspect') or (starts-with(., 're') and 're' = translate(., '0123456789', '') and string-length(.) &gt; 2)]) and not(ancestor::page-block/@pb-name[.='f-and-c' or starts-with(., 'inspect') or (starts-with(., 're') and 're' = translate(., '0123456789', '') and string-length(.) &gt; 2)]) and not(ancestor::ata-page-block/@pb-name[(starts-with(., 'as') and 'as' = translate(., '0123456789', '') and string-length(.) &gt; 2) or starts-with(.,'clean') or (starts-with(., 'test') and 'test' = translate(., '0123456789', '') and string-length(.) &gt; 4)]) and not(ancestor::page-block/@pb-name[(starts-with(., 'as') and 'as' = translate(., '0123456789', '') and string-length(.) &gt; 2) or starts-with(.,'clean') or (starts-with(., 'test') and 'test' = translate(., '0123456789', '') and string-length(.) &gt; 4)]) and not(ancestor::ata-page-block/@pb-name[(starts-with(., 'fc') and 'fc' = translate(., '0123456789', '') and string-length(.) &gt; 2) or starts-with(.,'repair') or .='trouble']) and not(ancestor::page-block/@pb-name[(starts-with(., 'fc') and 'fc' = translate(., '0123456789', '') and string-length(.) &gt; 2) or starts-with(.,'repair') or .='trouble']) and not(ancestor::ata-page-block/@pb-name[starts-with(.,'storage') or (starts-with(., 'to') and 'to' = translate(., '0123456789', '') and string-length(.) &gt; 2)]) and not(ancestor::page-block/@pb-name[starts-with(.,'storage') or (starts-with(., 'to') and 'to' = translate(., '0123456789', '') and string-length(.) &gt; 2)]) and not(ancestor::ata-page-block/@pb-name[.='it-oh' or .='lt-oh']) and (ancestor::page-block/@pb-name[.='it-oh' or .='lt-oh'])">
               <xsl:attribute name="_gte:count-as-id">cnt__table^page-block.cnt</xsl:attribute>
            </xsl:when>
            <xsl:when test="not(ancestor::book[contains(@doctype,'cir') or contains(@doctype,'em') or contains(@doctype,'tmm')]) and not(ancestor::book[contains(@doctype,'oh')] and ancestor::ata-page-block/@pb-name[.='service']) and not(ancestor::book[contains(@doctype,'oh')] and ancestor::page-block/@pb-name[.='service']) and not(ancestor::ata-page-block/@pb-name[.='00awl' or .='00intro' or .='airlim' or .='awl' or .='awlror' or .='chapsect' or .='consume' or .='d-and-o' or .='frontmatte' or .='howtouse' or .='00howtouse' or .='intro' or .='nut_option' or .='oplimits' or .='sblist' or .='schedchk' or .='spectool' or .='timelim' or .='title-page']) and not(ancestor::page-block/@pb-name[.='00awl' or .='00intro' or .='airlim' or .='awl' or .='awlror' or .='chapsect' or .='consume' or .='d-and-o' or .='frontmatte' or .='howtouse' or .='00howtouse' or .='intro' or .='nut_option' or .='oplimits' or .='sblist' or .='schedchk' or .='spectool' or .='timelim' or .='title-page']) and not(ancestor::ata-page-block/@pb-name[(starts-with(., 'do') and 'do' = translate(., '0123456789', '') and string-length(.) &gt; 2) or (starts-with(., 'in') and 'in' = translate(., '0123456789', '') and string-length(.) &gt; 2) or (starts-with(., 'tl') and 'tl' = translate(., '0123456789', '') and string-length(.) &gt; 2) or .='toolsht' or .='trlist' or .='unschedc' or .='unschedchk']) and not(ancestor::page-block/@pb-name[(starts-with(., 'do') and 'do' = translate(., '0123456789', '') and string-length(.) &gt; 2) or (starts-with(., 'in') and 'in' = translate(., '0123456789', '') and string-length(.) &gt; 2) or (starts-with(., 'tl') and 'tl' = translate(., '0123456789', '') and string-length(.) &gt; 2) or .='toolsht' or .='trlist' or .='unschedc' or .='unschedchk']) and not(ancestor-or-self::ata-page-block[1]/@pb-name and string(ancestor-or-self::ata-page-block[1]/@pb-name)='intro00') and not(ancestor-or-self::page-block[1]/@pb-name and string(ancestor-or-self::page-block[1]/@pb-name)='intro00') and not(ancestor::ata-page-block/@pb-name[starts-with(., 'disassy') or starts-with(., 'fault')]) and not(ancestor::page-block/@pb-name[starts-with(., 'disassy') or starts-with(., 'fault')]) and not(ancestor::book[contains(@doctype,'oh')] and ancestor::ata-page-block/@pb-name[starts-with(., 'clean')]) and not(ancestor::book[contains(@doctype,'oh')] and ancestor::page-block/@pb-name[starts-with(., 'clean')]) and not(ancestor::ata-page-block/@pb-name[starts-with(., 'mainprac')]) and not(ancestor::page-block/@pb-name[starts-with(., 'mainprac')]) and not(ancestor::book[contains(@doctype,'oh')] and ancestor::ata-page-block/@pb-name[starts-with(., 'inspect')]) and not(ancestor::book[contains(@doctype,'oh')] and ancestor::page-block/@pb-name[starts-with(., 'inspect')]) and not(ancestor::ata-page-block/@pb-name[(starts-with(., 'di') and 'di' = translate(., '0123456789', '') and string-length(.) &gt; 2) or starts-with(.,'service')]) and not(ancestor::page-block/@pb-name[(starts-with(., 'di') and 'di' = translate(., '0123456789', '') and string-length(.) &gt; 2) or starts-with(.,'service')]) and not(ancestor::book[contains(@doctype,'oh')] and ancestor::ata-page-block/@pb-name[starts-with(., 'repair')]) and not(ancestor::book[contains(@doctype,'oh')] and ancestor::page-block/@pb-name[starts-with(., 'repair')]) and not(ancestor::book[contains(@doctype,'oh')] and ancestor::ata-page-block/@pb-name[starts-with(., 'test')]) and not(ancestor::book[contains(@doctype,'oh')] and ancestor::page-block/@pb-name[starts-with(., 'test')]) and not(ancestor::ata-page-block/@pb-name[(starts-with(., 'cl') and 'cl' = translate(., '0123456789', '') and string-length(.) &gt; 2) or .='install' or starts-with(.,'rem-inst') or (starts-with(., 'reminst') and 'reminst' = translate(., '0123456789', '') and string-length(.) &gt; 7) or .='remove' or (starts-with(., 'repair') and 'repair' = translate(., '0123456789', '') and string-length(.) &gt; 6)]) and not(ancestor::page-block/@pb-name[(starts-with(., 'cl') and 'cl' = translate(., '0123456789', '') and string-length(.) &gt; 2) or .='install' or starts-with(.,'rem-inst') or (starts-with(., 'reminst') and 'reminst' = translate(., '0123456789', '') and string-length(.) &gt; 7) or .='remove' or (starts-with(., 'repair') and 'repair' = translate(., '0123456789', '') and string-length(.) &gt; 6)]) and not(ancestor::ata-page-block/@pb-name[starts-with(., 'assy') or (starts-with(., 'ic') and 'ic' = translate(., '0123456789', '') and string-length(.) &gt; 2) or (starts-with(., 'te') and 'te' = translate(., '0123456789', '') and string-length(.) &gt; 2) or .='test']) and not(ancestor::page-block/@pb-name[starts-with(., 'assy') or (starts-with(., 'ic') and 'ic' = translate(., '0123456789', '') and string-length(.) &gt; 2) or (starts-with(., 'te') and 'te' = translate(., '0123456789', '') and string-length(.) &gt; 2) or .='test']) and not(ancestor::ata-page-block/@pb-name[.='f-and-c' or starts-with(., 'inspect') or (starts-with(., 're') and 're' = translate(., '0123456789', '') and string-length(.) &gt; 2)]) and not(ancestor::page-block/@pb-name[.='f-and-c' or starts-with(., 'inspect') or (starts-with(., 're') and 're' = translate(., '0123456789', '') and string-length(.) &gt; 2)]) and not(ancestor::ata-page-block/@pb-name[(starts-with(., 'as') and 'as' = translate(., '0123456789', '') and string-length(.) &gt; 2) or starts-with(.,'clean') or (starts-with(., 'test') and 'test' = translate(., '0123456789', '') and string-length(.) &gt; 4)]) and not(ancestor::page-block/@pb-name[(starts-with(., 'as') and 'as' = translate(., '0123456789', '') and string-length(.) &gt; 2) or starts-with(.,'clean') or (starts-with(., 'test') and 'test' = translate(., '0123456789', '') and string-length(.) &gt; 4)]) and not(ancestor::ata-page-block/@pb-name[(starts-with(., 'fc') and 'fc' = translate(., '0123456789', '') and string-length(.) &gt; 2) or starts-with(.,'repair') or .='trouble']) and not(ancestor::page-block/@pb-name[(starts-with(., 'fc') and 'fc' = translate(., '0123456789', '') and string-length(.) &gt; 2) or starts-with(.,'repair') or .='trouble']) and not(ancestor::ata-page-block/@pb-name[starts-with(.,'storage') or (starts-with(., 'to') and 'to' = translate(., '0123456789', '') and string-length(.) &gt; 2)]) and not(ancestor::page-block/@pb-name[starts-with(.,'storage') or (starts-with(., 'to') and 'to' = translate(., '0123456789', '') and string-length(.) &gt; 2)]) and (ancestor::ata-page-block/@pb-name[.='it-oh' or .='lt-oh'])">
               <xsl:attribute name="_gte:count-as-id">cnt__table^ata-page-block.cnt</xsl:attribute>
            </xsl:when>
            <xsl:when test="not(ancestor::book[contains(@doctype,'cir') or contains(@doctype,'em') or contains(@doctype,'tmm')]) and not(ancestor::book[contains(@doctype,'oh')] and ancestor::ata-page-block/@pb-name[.='service']) and not(ancestor::book[contains(@doctype,'oh')] and ancestor::page-block/@pb-name[.='service']) and not(ancestor::ata-page-block/@pb-name[.='00awl' or .='00intro' or .='airlim' or .='awl' or .='awlror' or .='chapsect' or .='consume' or .='d-and-o' or .='frontmatte' or .='howtouse' or .='00howtouse' or .='intro' or .='nut_option' or .='oplimits' or .='sblist' or .='schedchk' or .='spectool' or .='timelim' or .='title-page']) and not(ancestor::page-block/@pb-name[.='00awl' or .='00intro' or .='airlim' or .='awl' or .='awlror' or .='chapsect' or .='consume' or .='d-and-o' or .='frontmatte' or .='howtouse' or .='00howtouse' or .='intro' or .='nut_option' or .='oplimits' or .='sblist' or .='schedchk' or .='spectool' or .='timelim' or .='title-page']) and not(ancestor::ata-page-block/@pb-name[(starts-with(., 'do') and 'do' = translate(., '0123456789', '') and string-length(.) &gt; 2) or (starts-with(., 'in') and 'in' = translate(., '0123456789', '') and string-length(.) &gt; 2) or (starts-with(., 'tl') and 'tl' = translate(., '0123456789', '') and string-length(.) &gt; 2) or .='toolsht' or .='trlist' or .='unschedc' or .='unschedchk']) and not(ancestor::page-block/@pb-name[(starts-with(., 'do') and 'do' = translate(., '0123456789', '') and string-length(.) &gt; 2) or (starts-with(., 'in') and 'in' = translate(., '0123456789', '') and string-length(.) &gt; 2) or (starts-with(., 'tl') and 'tl' = translate(., '0123456789', '') and string-length(.) &gt; 2) or .='toolsht' or .='trlist' or .='unschedc' or .='unschedchk']) and not(ancestor-or-self::ata-page-block[1]/@pb-name and string(ancestor-or-self::ata-page-block[1]/@pb-name)='intro00') and not(ancestor-or-self::page-block[1]/@pb-name and string(ancestor-or-self::page-block[1]/@pb-name)='intro00') and not(ancestor::ata-page-block/@pb-name[starts-with(., 'disassy') or starts-with(., 'fault')]) and not(ancestor::page-block/@pb-name[starts-with(., 'disassy') or starts-with(., 'fault')]) and not(ancestor::book[contains(@doctype,'oh')] and ancestor::ata-page-block/@pb-name[starts-with(., 'clean')]) and not(ancestor::book[contains(@doctype,'oh')] and ancestor::page-block/@pb-name[starts-with(., 'clean')]) and not(ancestor::ata-page-block/@pb-name[starts-with(., 'mainprac')]) and not(ancestor::page-block/@pb-name[starts-with(., 'mainprac')]) and not(ancestor::book[contains(@doctype,'oh')] and ancestor::ata-page-block/@pb-name[starts-with(., 'inspect')]) and not(ancestor::book[contains(@doctype,'oh')] and ancestor::page-block/@pb-name[starts-with(., 'inspect')]) and not(ancestor::ata-page-block/@pb-name[(starts-with(., 'di') and 'di' = translate(., '0123456789', '') and string-length(.) &gt; 2) or starts-with(.,'service')]) and not(ancestor::page-block/@pb-name[(starts-with(., 'di') and 'di' = translate(., '0123456789', '') and string-length(.) &gt; 2) or starts-with(.,'service')]) and not(ancestor::book[contains(@doctype,'oh')] and ancestor::ata-page-block/@pb-name[starts-with(., 'repair')]) and not(ancestor::book[contains(@doctype,'oh')] and ancestor::page-block/@pb-name[starts-with(., 'repair')]) and not(ancestor::book[contains(@doctype,'oh')] and ancestor::ata-page-block/@pb-name[starts-with(., 'test')]) and not(ancestor::book[contains(@doctype,'oh')] and ancestor::page-block/@pb-name[starts-with(., 'test')]) and not(ancestor::ata-page-block/@pb-name[(starts-with(., 'cl') and 'cl' = translate(., '0123456789', '') and string-length(.) &gt; 2) or .='install' or starts-with(.,'rem-inst') or (starts-with(., 'reminst') and 'reminst' = translate(., '0123456789', '') and string-length(.) &gt; 7) or .='remove' or (starts-with(., 'repair') and 'repair' = translate(., '0123456789', '') and string-length(.) &gt; 6)]) and not(ancestor::page-block/@pb-name[(starts-with(., 'cl') and 'cl' = translate(., '0123456789', '') and string-length(.) &gt; 2) or .='install' or starts-with(.,'rem-inst') or (starts-with(., 'reminst') and 'reminst' = translate(., '0123456789', '') and string-length(.) &gt; 7) or .='remove' or (starts-with(., 'repair') and 'repair' = translate(., '0123456789', '') and string-length(.) &gt; 6)]) and not(ancestor::ata-page-block/@pb-name[starts-with(., 'assy') or (starts-with(., 'ic') and 'ic' = translate(., '0123456789', '') and string-length(.) &gt; 2) or (starts-with(., 'te') and 'te' = translate(., '0123456789', '') and string-length(.) &gt; 2) or .='test']) and not(ancestor::page-block/@pb-name[starts-with(., 'assy') or (starts-with(., 'ic') and 'ic' = translate(., '0123456789', '') and string-length(.) &gt; 2) or (starts-with(., 'te') and 'te' = translate(., '0123456789', '') and string-length(.) &gt; 2) or .='test']) and not(ancestor::ata-page-block/@pb-name[.='f-and-c' or starts-with(., 'inspect') or (starts-with(., 're') and 're' = translate(., '0123456789', '') and string-length(.) &gt; 2)]) and not(ancestor::page-block/@pb-name[.='f-and-c' or starts-with(., 'inspect') or (starts-with(., 're') and 're' = translate(., '0123456789', '') and string-length(.) &gt; 2)]) and not(ancestor::ata-page-block/@pb-name[(starts-with(., 'as') and 'as' = translate(., '0123456789', '') and string-length(.) &gt; 2) or starts-with(.,'clean') or (starts-with(., 'test') and 'test' = translate(., '0123456789', '') and string-length(.) &gt; 4)]) and not(ancestor::page-block/@pb-name[(starts-with(., 'as') and 'as' = translate(., '0123456789', '') and string-length(.) &gt; 2) or starts-with(.,'clean') or (starts-with(., 'test') and 'test' = translate(., '0123456789', '') and string-length(.) &gt; 4)]) and not(ancestor::ata-page-block/@pb-name[(starts-with(., 'fc') and 'fc' = translate(., '0123456789', '') and string-length(.) &gt; 2) or starts-with(.,'repair') or .='trouble']) and not(ancestor::page-block/@pb-name[(starts-with(., 'fc') and 'fc' = translate(., '0123456789', '') and string-length(.) &gt; 2) or starts-with(.,'repair') or .='trouble']) and not(ancestor::ata-page-block/@pb-name[starts-with(.,'storage') or (starts-with(., 'to') and 'to' = translate(., '0123456789', '') and string-length(.) &gt; 2)]) and (ancestor::page-block/@pb-name[starts-with(.,'storage') or (starts-with(., 'to') and 'to' = translate(., '0123456789', '') and string-length(.) &gt; 2)])">
               <xsl:attribute name="_gte:count-as-id">cnt__table^page-block.cnt</xsl:attribute>
            </xsl:when>
            <xsl:when test="not(ancestor::book[contains(@doctype,'cir') or contains(@doctype,'em') or contains(@doctype,'tmm')]) and not(ancestor::book[contains(@doctype,'oh')] and ancestor::ata-page-block/@pb-name[.='service']) and not(ancestor::book[contains(@doctype,'oh')] and ancestor::page-block/@pb-name[.='service']) and not(ancestor::ata-page-block/@pb-name[.='00awl' or .='00intro' or .='airlim' or .='awl' or .='awlror' or .='chapsect' or .='consume' or .='d-and-o' or .='frontmatte' or .='howtouse' or .='00howtouse' or .='intro' or .='nut_option' or .='oplimits' or .='sblist' or .='schedchk' or .='spectool' or .='timelim' or .='title-page']) and not(ancestor::page-block/@pb-name[.='00awl' or .='00intro' or .='airlim' or .='awl' or .='awlror' or .='chapsect' or .='consume' or .='d-and-o' or .='frontmatte' or .='howtouse' or .='00howtouse' or .='intro' or .='nut_option' or .='oplimits' or .='sblist' or .='schedchk' or .='spectool' or .='timelim' or .='title-page']) and not(ancestor::ata-page-block/@pb-name[(starts-with(., 'do') and 'do' = translate(., '0123456789', '') and string-length(.) &gt; 2) or (starts-with(., 'in') and 'in' = translate(., '0123456789', '') and string-length(.) &gt; 2) or (starts-with(., 'tl') and 'tl' = translate(., '0123456789', '') and string-length(.) &gt; 2) or .='toolsht' or .='trlist' or .='unschedc' or .='unschedchk']) and not(ancestor::page-block/@pb-name[(starts-with(., 'do') and 'do' = translate(., '0123456789', '') and string-length(.) &gt; 2) or (starts-with(., 'in') and 'in' = translate(., '0123456789', '') and string-length(.) &gt; 2) or (starts-with(., 'tl') and 'tl' = translate(., '0123456789', '') and string-length(.) &gt; 2) or .='toolsht' or .='trlist' or .='unschedc' or .='unschedchk']) and not(ancestor-or-self::ata-page-block[1]/@pb-name and string(ancestor-or-self::ata-page-block[1]/@pb-name)='intro00') and not(ancestor-or-self::page-block[1]/@pb-name and string(ancestor-or-self::page-block[1]/@pb-name)='intro00') and not(ancestor::ata-page-block/@pb-name[starts-with(., 'disassy') or starts-with(., 'fault')]) and not(ancestor::page-block/@pb-name[starts-with(., 'disassy') or starts-with(., 'fault')]) and not(ancestor::book[contains(@doctype,'oh')] and ancestor::ata-page-block/@pb-name[starts-with(., 'clean')]) and not(ancestor::book[contains(@doctype,'oh')] and ancestor::page-block/@pb-name[starts-with(., 'clean')]) and not(ancestor::ata-page-block/@pb-name[starts-with(., 'mainprac')]) and not(ancestor::page-block/@pb-name[starts-with(., 'mainprac')]) and not(ancestor::book[contains(@doctype,'oh')] and ancestor::ata-page-block/@pb-name[starts-with(., 'inspect')]) and not(ancestor::book[contains(@doctype,'oh')] and ancestor::page-block/@pb-name[starts-with(., 'inspect')]) and not(ancestor::ata-page-block/@pb-name[(starts-with(., 'di') and 'di' = translate(., '0123456789', '') and string-length(.) &gt; 2) or starts-with(.,'service')]) and not(ancestor::page-block/@pb-name[(starts-with(., 'di') and 'di' = translate(., '0123456789', '') and string-length(.) &gt; 2) or starts-with(.,'service')]) and not(ancestor::book[contains(@doctype,'oh')] and ancestor::ata-page-block/@pb-name[starts-with(., 'repair')]) and not(ancestor::book[contains(@doctype,'oh')] and ancestor::page-block/@pb-name[starts-with(., 'repair')]) and not(ancestor::book[contains(@doctype,'oh')] and ancestor::ata-page-block/@pb-name[starts-with(., 'test')]) and not(ancestor::book[contains(@doctype,'oh')] and ancestor::page-block/@pb-name[starts-with(., 'test')]) and not(ancestor::ata-page-block/@pb-name[(starts-with(., 'cl') and 'cl' = translate(., '0123456789', '') and string-length(.) &gt; 2) or .='install' or starts-with(.,'rem-inst') or (starts-with(., 'reminst') and 'reminst' = translate(., '0123456789', '') and string-length(.) &gt; 7) or .='remove' or (starts-with(., 'repair') and 'repair' = translate(., '0123456789', '') and string-length(.) &gt; 6)]) and not(ancestor::page-block/@pb-name[(starts-with(., 'cl') and 'cl' = translate(., '0123456789', '') and string-length(.) &gt; 2) or .='install' or starts-with(.,'rem-inst') or (starts-with(., 'reminst') and 'reminst' = translate(., '0123456789', '') and string-length(.) &gt; 7) or .='remove' or (starts-with(., 'repair') and 'repair' = translate(., '0123456789', '') and string-length(.) &gt; 6)]) and not(ancestor::ata-page-block/@pb-name[starts-with(., 'assy') or (starts-with(., 'ic') and 'ic' = translate(., '0123456789', '') and string-length(.) &gt; 2) or (starts-with(., 'te') and 'te' = translate(., '0123456789', '') and string-length(.) &gt; 2) or .='test']) and not(ancestor::page-block/@pb-name[starts-with(., 'assy') or (starts-with(., 'ic') and 'ic' = translate(., '0123456789', '') and string-length(.) &gt; 2) or (starts-with(., 'te') and 'te' = translate(., '0123456789', '') and string-length(.) &gt; 2) or .='test']) and not(ancestor::ata-page-block/@pb-name[.='f-and-c' or starts-with(., 'inspect') or (starts-with(., 're') and 're' = translate(., '0123456789', '') and string-length(.) &gt; 2)]) and not(ancestor::page-block/@pb-name[.='f-and-c' or starts-with(., 'inspect') or (starts-with(., 're') and 're' = translate(., '0123456789', '') and string-length(.) &gt; 2)]) and not(ancestor::ata-page-block/@pb-name[(starts-with(., 'as') and 'as' = translate(., '0123456789', '') and string-length(.) &gt; 2) or starts-with(.,'clean') or (starts-with(., 'test') and 'test' = translate(., '0123456789', '') and string-length(.) &gt; 4)]) and not(ancestor::page-block/@pb-name[(starts-with(., 'as') and 'as' = translate(., '0123456789', '') and string-length(.) &gt; 2) or starts-with(.,'clean') or (starts-with(., 'test') and 'test' = translate(., '0123456789', '') and string-length(.) &gt; 4)]) and not(ancestor::ata-page-block/@pb-name[(starts-with(., 'fc') and 'fc' = translate(., '0123456789', '') and string-length(.) &gt; 2) or starts-with(.,'repair') or .='trouble']) and not(ancestor::page-block/@pb-name[(starts-with(., 'fc') and 'fc' = translate(., '0123456789', '') and string-length(.) &gt; 2) or starts-with(.,'repair') or .='trouble']) and (ancestor::ata-page-block/@pb-name[starts-with(.,'storage') or (starts-with(., 'to') and 'to' = translate(., '0123456789', '') and string-length(.) &gt; 2)])">
               <xsl:attribute name="_gte:count-as-id">cnt__table^ata-page-block.cnt</xsl:attribute>
            </xsl:when>
            <xsl:when test="not(ancestor::book[contains(@doctype,'cir') or contains(@doctype,'em') or contains(@doctype,'tmm')]) and not(ancestor::book[contains(@doctype,'oh')] and ancestor::ata-page-block/@pb-name[.='service']) and not(ancestor::book[contains(@doctype,'oh')] and ancestor::page-block/@pb-name[.='service']) and not(ancestor::ata-page-block/@pb-name[.='00awl' or .='00intro' or .='airlim' or .='awl' or .='awlror' or .='chapsect' or .='consume' or .='d-and-o' or .='frontmatte' or .='howtouse' or .='00howtouse' or .='intro' or .='nut_option' or .='oplimits' or .='sblist' or .='schedchk' or .='spectool' or .='timelim' or .='title-page']) and not(ancestor::page-block/@pb-name[.='00awl' or .='00intro' or .='airlim' or .='awl' or .='awlror' or .='chapsect' or .='consume' or .='d-and-o' or .='frontmatte' or .='howtouse' or .='00howtouse' or .='intro' or .='nut_option' or .='oplimits' or .='sblist' or .='schedchk' or .='spectool' or .='timelim' or .='title-page']) and not(ancestor::ata-page-block/@pb-name[(starts-with(., 'do') and 'do' = translate(., '0123456789', '') and string-length(.) &gt; 2) or (starts-with(., 'in') and 'in' = translate(., '0123456789', '') and string-length(.) &gt; 2) or (starts-with(., 'tl') and 'tl' = translate(., '0123456789', '') and string-length(.) &gt; 2) or .='toolsht' or .='trlist' or .='unschedc' or .='unschedchk']) and not(ancestor::page-block/@pb-name[(starts-with(., 'do') and 'do' = translate(., '0123456789', '') and string-length(.) &gt; 2) or (starts-with(., 'in') and 'in' = translate(., '0123456789', '') and string-length(.) &gt; 2) or (starts-with(., 'tl') and 'tl' = translate(., '0123456789', '') and string-length(.) &gt; 2) or .='toolsht' or .='trlist' or .='unschedc' or .='unschedchk']) and not(ancestor-or-self::ata-page-block[1]/@pb-name and string(ancestor-or-self::ata-page-block[1]/@pb-name)='intro00') and not(ancestor-or-self::page-block[1]/@pb-name and string(ancestor-or-self::page-block[1]/@pb-name)='intro00') and not(ancestor::ata-page-block/@pb-name[starts-with(., 'disassy') or starts-with(., 'fault')]) and not(ancestor::page-block/@pb-name[starts-with(., 'disassy') or starts-with(., 'fault')]) and not(ancestor::book[contains(@doctype,'oh')] and ancestor::ata-page-block/@pb-name[starts-with(., 'clean')]) and not(ancestor::book[contains(@doctype,'oh')] and ancestor::page-block/@pb-name[starts-with(., 'clean')]) and not(ancestor::ata-page-block/@pb-name[starts-with(., 'mainprac')]) and not(ancestor::page-block/@pb-name[starts-with(., 'mainprac')]) and not(ancestor::book[contains(@doctype,'oh')] and ancestor::ata-page-block/@pb-name[starts-with(., 'inspect')]) and not(ancestor::book[contains(@doctype,'oh')] and ancestor::page-block/@pb-name[starts-with(., 'inspect')]) and not(ancestor::ata-page-block/@pb-name[(starts-with(., 'di') and 'di' = translate(., '0123456789', '') and string-length(.) &gt; 2) or starts-with(.,'service')]) and not(ancestor::page-block/@pb-name[(starts-with(., 'di') and 'di' = translate(., '0123456789', '') and string-length(.) &gt; 2) or starts-with(.,'service')]) and not(ancestor::book[contains(@doctype,'oh')] and ancestor::ata-page-block/@pb-name[starts-with(., 'repair')]) and not(ancestor::book[contains(@doctype,'oh')] and ancestor::page-block/@pb-name[starts-with(., 'repair')]) and not(ancestor::book[contains(@doctype,'oh')] and ancestor::ata-page-block/@pb-name[starts-with(., 'test')]) and not(ancestor::book[contains(@doctype,'oh')] and ancestor::page-block/@pb-name[starts-with(., 'test')]) and not(ancestor::ata-page-block/@pb-name[(starts-with(., 'cl') and 'cl' = translate(., '0123456789', '') and string-length(.) &gt; 2) or .='install' or starts-with(.,'rem-inst') or (starts-with(., 'reminst') and 'reminst' = translate(., '0123456789', '') and string-length(.) &gt; 7) or .='remove' or (starts-with(., 'repair') and 'repair' = translate(., '0123456789', '') and string-length(.) &gt; 6)]) and not(ancestor::page-block/@pb-name[(starts-with(., 'cl') and 'cl' = translate(., '0123456789', '') and string-length(.) &gt; 2) or .='install' or starts-with(.,'rem-inst') or (starts-with(., 'reminst') and 'reminst' = translate(., '0123456789', '') and string-length(.) &gt; 7) or .='remove' or (starts-with(., 'repair') and 'repair' = translate(., '0123456789', '') and string-length(.) &gt; 6)]) and not(ancestor::ata-page-block/@pb-name[starts-with(., 'assy') or (starts-with(., 'ic') and 'ic' = translate(., '0123456789', '') and string-length(.) &gt; 2) or (starts-with(., 'te') and 'te' = translate(., '0123456789', '') and string-length(.) &gt; 2) or .='test']) and not(ancestor::page-block/@pb-name[starts-with(., 'assy') or (starts-with(., 'ic') and 'ic' = translate(., '0123456789', '') and string-length(.) &gt; 2) or (starts-with(., 'te') and 'te' = translate(., '0123456789', '') and string-length(.) &gt; 2) or .='test']) and not(ancestor::ata-page-block/@pb-name[.='f-and-c' or starts-with(., 'inspect') or (starts-with(., 're') and 're' = translate(., '0123456789', '') and string-length(.) &gt; 2)]) and not(ancestor::page-block/@pb-name[.='f-and-c' or starts-with(., 'inspect') or (starts-with(., 're') and 're' = translate(., '0123456789', '') and string-length(.) &gt; 2)]) and not(ancestor::ata-page-block/@pb-name[(starts-with(., 'as') and 'as' = translate(., '0123456789', '') and string-length(.) &gt; 2) or starts-with(.,'clean') or (starts-with(., 'test') and 'test' = translate(., '0123456789', '') and string-length(.) &gt; 4)]) and not(ancestor::page-block/@pb-name[(starts-with(., 'as') and 'as' = translate(., '0123456789', '') and string-length(.) &gt; 2) or starts-with(.,'clean') or (starts-with(., 'test') and 'test' = translate(., '0123456789', '') and string-length(.) &gt; 4)]) and not(ancestor::ata-page-block/@pb-name[(starts-with(., 'fc') and 'fc' = translate(., '0123456789', '') and string-length(.) &gt; 2) or starts-with(.,'repair') or .='trouble']) and (ancestor::page-block/@pb-name[(starts-with(., 'fc') and 'fc' = translate(., '0123456789', '') and string-length(.) &gt; 2) or starts-with(.,'repair') or .='trouble'])">
               <xsl:attribute name="_gte:count-as-id">cnt__table^page-block.cnt</xsl:attribute>
            </xsl:when>
            <xsl:when test="not(ancestor::book[contains(@doctype,'cir') or contains(@doctype,'em') or contains(@doctype,'tmm')]) and not(ancestor::book[contains(@doctype,'oh')] and ancestor::ata-page-block/@pb-name[.='service']) and not(ancestor::book[contains(@doctype,'oh')] and ancestor::page-block/@pb-name[.='service']) and not(ancestor::ata-page-block/@pb-name[.='00awl' or .='00intro' or .='airlim' or .='awl' or .='awlror' or .='chapsect' or .='consume' or .='d-and-o' or .='frontmatte' or .='howtouse' or .='00howtouse' or .='intro' or .='nut_option' or .='oplimits' or .='sblist' or .='schedchk' or .='spectool' or .='timelim' or .='title-page']) and not(ancestor::page-block/@pb-name[.='00awl' or .='00intro' or .='airlim' or .='awl' or .='awlror' or .='chapsect' or .='consume' or .='d-and-o' or .='frontmatte' or .='howtouse' or .='00howtouse' or .='intro' or .='nut_option' or .='oplimits' or .='sblist' or .='schedchk' or .='spectool' or .='timelim' or .='title-page']) and not(ancestor::ata-page-block/@pb-name[(starts-with(., 'do') and 'do' = translate(., '0123456789', '') and string-length(.) &gt; 2) or (starts-with(., 'in') and 'in' = translate(., '0123456789', '') and string-length(.) &gt; 2) or (starts-with(., 'tl') and 'tl' = translate(., '0123456789', '') and string-length(.) &gt; 2) or .='toolsht' or .='trlist' or .='unschedc' or .='unschedchk']) and not(ancestor::page-block/@pb-name[(starts-with(., 'do') and 'do' = translate(., '0123456789', '') and string-length(.) &gt; 2) or (starts-with(., 'in') and 'in' = translate(., '0123456789', '') and string-length(.) &gt; 2) or (starts-with(., 'tl') and 'tl' = translate(., '0123456789', '') and string-length(.) &gt; 2) or .='toolsht' or .='trlist' or .='unschedc' or .='unschedchk']) and not(ancestor-or-self::ata-page-block[1]/@pb-name and string(ancestor-or-self::ata-page-block[1]/@pb-name)='intro00') and not(ancestor-or-self::page-block[1]/@pb-name and string(ancestor-or-self::page-block[1]/@pb-name)='intro00') and not(ancestor::ata-page-block/@pb-name[starts-with(., 'disassy') or starts-with(., 'fault')]) and not(ancestor::page-block/@pb-name[starts-with(., 'disassy') or starts-with(., 'fault')]) and not(ancestor::book[contains(@doctype,'oh')] and ancestor::ata-page-block/@pb-name[starts-with(., 'clean')]) and not(ancestor::book[contains(@doctype,'oh')] and ancestor::page-block/@pb-name[starts-with(., 'clean')]) and not(ancestor::ata-page-block/@pb-name[starts-with(., 'mainprac')]) and not(ancestor::page-block/@pb-name[starts-with(., 'mainprac')]) and not(ancestor::book[contains(@doctype,'oh')] and ancestor::ata-page-block/@pb-name[starts-with(., 'inspect')]) and not(ancestor::book[contains(@doctype,'oh')] and ancestor::page-block/@pb-name[starts-with(., 'inspect')]) and not(ancestor::ata-page-block/@pb-name[(starts-with(., 'di') and 'di' = translate(., '0123456789', '') and string-length(.) &gt; 2) or starts-with(.,'service')]) and not(ancestor::page-block/@pb-name[(starts-with(., 'di') and 'di' = translate(., '0123456789', '') and string-length(.) &gt; 2) or starts-with(.,'service')]) and not(ancestor::book[contains(@doctype,'oh')] and ancestor::ata-page-block/@pb-name[starts-with(., 'repair')]) and not(ancestor::book[contains(@doctype,'oh')] and ancestor::page-block/@pb-name[starts-with(., 'repair')]) and not(ancestor::book[contains(@doctype,'oh')] and ancestor::ata-page-block/@pb-name[starts-with(., 'test')]) and not(ancestor::book[contains(@doctype,'oh')] and ancestor::page-block/@pb-name[starts-with(., 'test')]) and not(ancestor::ata-page-block/@pb-name[(starts-with(., 'cl') and 'cl' = translate(., '0123456789', '') and string-length(.) &gt; 2) or .='install' or starts-with(.,'rem-inst') or (starts-with(., 'reminst') and 'reminst' = translate(., '0123456789', '') and string-length(.) &gt; 7) or .='remove' or (starts-with(., 'repair') and 'repair' = translate(., '0123456789', '') and string-length(.) &gt; 6)]) and not(ancestor::page-block/@pb-name[(starts-with(., 'cl') and 'cl' = translate(., '0123456789', '') and string-length(.) &gt; 2) or .='install' or starts-with(.,'rem-inst') or (starts-with(., 'reminst') and 'reminst' = translate(., '0123456789', '') and string-length(.) &gt; 7) or .='remove' or (starts-with(., 'repair') and 'repair' = translate(., '0123456789', '') and string-length(.) &gt; 6)]) and not(ancestor::ata-page-block/@pb-name[starts-with(., 'assy') or (starts-with(., 'ic') and 'ic' = translate(., '0123456789', '') and string-length(.) &gt; 2) or (starts-with(., 'te') and 'te' = translate(., '0123456789', '') and string-length(.) &gt; 2) or .='test']) and not(ancestor::page-block/@pb-name[starts-with(., 'assy') or (starts-with(., 'ic') and 'ic' = translate(., '0123456789', '') and string-length(.) &gt; 2) or (starts-with(., 'te') and 'te' = translate(., '0123456789', '') and string-length(.) &gt; 2) or .='test']) and not(ancestor::ata-page-block/@pb-name[.='f-and-c' or starts-with(., 'inspect') or (starts-with(., 're') and 're' = translate(., '0123456789', '') and string-length(.) &gt; 2)]) and not(ancestor::page-block/@pb-name[.='f-and-c' or starts-with(., 'inspect') or (starts-with(., 're') and 're' = translate(., '0123456789', '') and string-length(.) &gt; 2)]) and not(ancestor::ata-page-block/@pb-name[(starts-with(., 'as') and 'as' = translate(., '0123456789', '') and string-length(.) &gt; 2) or starts-with(.,'clean') or (starts-with(., 'test') and 'test' = translate(., '0123456789', '') and string-length(.) &gt; 4)]) and not(ancestor::page-block/@pb-name[(starts-with(., 'as') and 'as' = translate(., '0123456789', '') and string-length(.) &gt; 2) or starts-with(.,'clean') or (starts-with(., 'test') and 'test' = translate(., '0123456789', '') and string-length(.) &gt; 4)]) and (ancestor::ata-page-block/@pb-name[(starts-with(., 'fc') and 'fc' = translate(., '0123456789', '') and string-length(.) &gt; 2) or starts-with(.,'repair') or .='trouble'])">
               <xsl:attribute name="_gte:count-as-id">cnt__table^ata-page-block.cnt</xsl:attribute>
            </xsl:when>
            <xsl:when test="not(ancestor::book[contains(@doctype,'cir') or contains(@doctype,'em') or contains(@doctype,'tmm')]) and not(ancestor::book[contains(@doctype,'oh')] and ancestor::ata-page-block/@pb-name[.='service']) and not(ancestor::book[contains(@doctype,'oh')] and ancestor::page-block/@pb-name[.='service']) and not(ancestor::ata-page-block/@pb-name[.='00awl' or .='00intro' or .='airlim' or .='awl' or .='awlror' or .='chapsect' or .='consume' or .='d-and-o' or .='frontmatte' or .='howtouse' or .='00howtouse' or .='intro' or .='nut_option' or .='oplimits' or .='sblist' or .='schedchk' or .='spectool' or .='timelim' or .='title-page']) and not(ancestor::page-block/@pb-name[.='00awl' or .='00intro' or .='airlim' or .='awl' or .='awlror' or .='chapsect' or .='consume' or .='d-and-o' or .='frontmatte' or .='howtouse' or .='00howtouse' or .='intro' or .='nut_option' or .='oplimits' or .='sblist' or .='schedchk' or .='spectool' or .='timelim' or .='title-page']) and not(ancestor::ata-page-block/@pb-name[(starts-with(., 'do') and 'do' = translate(., '0123456789', '') and string-length(.) &gt; 2) or (starts-with(., 'in') and 'in' = translate(., '0123456789', '') and string-length(.) &gt; 2) or (starts-with(., 'tl') and 'tl' = translate(., '0123456789', '') and string-length(.) &gt; 2) or .='toolsht' or .='trlist' or .='unschedc' or .='unschedchk']) and not(ancestor::page-block/@pb-name[(starts-with(., 'do') and 'do' = translate(., '0123456789', '') and string-length(.) &gt; 2) or (starts-with(., 'in') and 'in' = translate(., '0123456789', '') and string-length(.) &gt; 2) or (starts-with(., 'tl') and 'tl' = translate(., '0123456789', '') and string-length(.) &gt; 2) or .='toolsht' or .='trlist' or .='unschedc' or .='unschedchk']) and not(ancestor-or-self::ata-page-block[1]/@pb-name and string(ancestor-or-self::ata-page-block[1]/@pb-name)='intro00') and not(ancestor-or-self::page-block[1]/@pb-name and string(ancestor-or-self::page-block[1]/@pb-name)='intro00') and not(ancestor::ata-page-block/@pb-name[starts-with(., 'disassy') or starts-with(., 'fault')]) and not(ancestor::page-block/@pb-name[starts-with(., 'disassy') or starts-with(., 'fault')]) and not(ancestor::book[contains(@doctype,'oh')] and ancestor::ata-page-block/@pb-name[starts-with(., 'clean')]) and not(ancestor::book[contains(@doctype,'oh')] and ancestor::page-block/@pb-name[starts-with(., 'clean')]) and not(ancestor::ata-page-block/@pb-name[starts-with(., 'mainprac')]) and not(ancestor::page-block/@pb-name[starts-with(., 'mainprac')]) and not(ancestor::book[contains(@doctype,'oh')] and ancestor::ata-page-block/@pb-name[starts-with(., 'inspect')]) and not(ancestor::book[contains(@doctype,'oh')] and ancestor::page-block/@pb-name[starts-with(., 'inspect')]) and not(ancestor::ata-page-block/@pb-name[(starts-with(., 'di') and 'di' = translate(., '0123456789', '') and string-length(.) &gt; 2) or starts-with(.,'service')]) and not(ancestor::page-block/@pb-name[(starts-with(., 'di') and 'di' = translate(., '0123456789', '') and string-length(.) &gt; 2) or starts-with(.,'service')]) and not(ancestor::book[contains(@doctype,'oh')] and ancestor::ata-page-block/@pb-name[starts-with(., 'repair')]) and not(ancestor::book[contains(@doctype,'oh')] and ancestor::page-block/@pb-name[starts-with(., 'repair')]) and not(ancestor::book[contains(@doctype,'oh')] and ancestor::ata-page-block/@pb-name[starts-with(., 'test')]) and not(ancestor::book[contains(@doctype,'oh')] and ancestor::page-block/@pb-name[starts-with(., 'test')]) and not(ancestor::ata-page-block/@pb-name[(starts-with(., 'cl') and 'cl' = translate(., '0123456789', '') and string-length(.) &gt; 2) or .='install' or starts-with(.,'rem-inst') or (starts-with(., 'reminst') and 'reminst' = translate(., '0123456789', '') and string-length(.) &gt; 7) or .='remove' or (starts-with(., 'repair') and 'repair' = translate(., '0123456789', '') and string-length(.) &gt; 6)]) and not(ancestor::page-block/@pb-name[(starts-with(., 'cl') and 'cl' = translate(., '0123456789', '') and string-length(.) &gt; 2) or .='install' or starts-with(.,'rem-inst') or (starts-with(., 'reminst') and 'reminst' = translate(., '0123456789', '') and string-length(.) &gt; 7) or .='remove' or (starts-with(., 'repair') and 'repair' = translate(., '0123456789', '') and string-length(.) &gt; 6)]) and not(ancestor::ata-page-block/@pb-name[starts-with(., 'assy') or (starts-with(., 'ic') and 'ic' = translate(., '0123456789', '') and string-length(.) &gt; 2) or (starts-with(., 'te') and 'te' = translate(., '0123456789', '') and string-length(.) &gt; 2) or .='test']) and not(ancestor::page-block/@pb-name[starts-with(., 'assy') or (starts-with(., 'ic') and 'ic' = translate(., '0123456789', '') and string-length(.) &gt; 2) or (starts-with(., 'te') and 'te' = translate(., '0123456789', '') and string-length(.) &gt; 2) or .='test']) and not(ancestor::ata-page-block/@pb-name[.='f-and-c' or starts-with(., 'inspect') or (starts-with(., 're') and 're' = translate(., '0123456789', '') and string-length(.) &gt; 2)]) and not(ancestor::page-block/@pb-name[.='f-and-c' or starts-with(., 'inspect') or (starts-with(., 're') and 're' = translate(., '0123456789', '') and string-length(.) &gt; 2)]) and not(ancestor::ata-page-block/@pb-name[(starts-with(., 'as') and 'as' = translate(., '0123456789', '') and string-length(.) &gt; 2) or starts-with(.,'clean') or (starts-with(., 'test') and 'test' = translate(., '0123456789', '') and string-length(.) &gt; 4)]) and (ancestor::page-block/@pb-name[(starts-with(., 'as') and 'as' = translate(., '0123456789', '') and string-length(.) &gt; 2) or starts-with(.,'clean') or (starts-with(., 'test') and 'test' = translate(., '0123456789', '') and string-length(.) &gt; 4)])">
               <xsl:attribute name="_gte:count-as-id">cnt__table^page-block.cnt</xsl:attribute>
            </xsl:when>
            <xsl:when test="not(ancestor::book[contains(@doctype,'cir') or contains(@doctype,'em') or contains(@doctype,'tmm')]) and not(ancestor::book[contains(@doctype,'oh')] and ancestor::ata-page-block/@pb-name[.='service']) and not(ancestor::book[contains(@doctype,'oh')] and ancestor::page-block/@pb-name[.='service']) and not(ancestor::ata-page-block/@pb-name[.='00awl' or .='00intro' or .='airlim' or .='awl' or .='awlror' or .='chapsect' or .='consume' or .='d-and-o' or .='frontmatte' or .='howtouse' or .='00howtouse' or .='intro' or .='nut_option' or .='oplimits' or .='sblist' or .='schedchk' or .='spectool' or .='timelim' or .='title-page']) and not(ancestor::page-block/@pb-name[.='00awl' or .='00intro' or .='airlim' or .='awl' or .='awlror' or .='chapsect' or .='consume' or .='d-and-o' or .='frontmatte' or .='howtouse' or .='00howtouse' or .='intro' or .='nut_option' or .='oplimits' or .='sblist' or .='schedchk' or .='spectool' or .='timelim' or .='title-page']) and not(ancestor::ata-page-block/@pb-name[(starts-with(., 'do') and 'do' = translate(., '0123456789', '') and string-length(.) &gt; 2) or (starts-with(., 'in') and 'in' = translate(., '0123456789', '') and string-length(.) &gt; 2) or (starts-with(., 'tl') and 'tl' = translate(., '0123456789', '') and string-length(.) &gt; 2) or .='toolsht' or .='trlist' or .='unschedc' or .='unschedchk']) and not(ancestor::page-block/@pb-name[(starts-with(., 'do') and 'do' = translate(., '0123456789', '') and string-length(.) &gt; 2) or (starts-with(., 'in') and 'in' = translate(., '0123456789', '') and string-length(.) &gt; 2) or (starts-with(., 'tl') and 'tl' = translate(., '0123456789', '') and string-length(.) &gt; 2) or .='toolsht' or .='trlist' or .='unschedc' or .='unschedchk']) and not(ancestor-or-self::ata-page-block[1]/@pb-name and string(ancestor-or-self::ata-page-block[1]/@pb-name)='intro00') and not(ancestor-or-self::page-block[1]/@pb-name and string(ancestor-or-self::page-block[1]/@pb-name)='intro00') and not(ancestor::ata-page-block/@pb-name[starts-with(., 'disassy') or starts-with(., 'fault')]) and not(ancestor::page-block/@pb-name[starts-with(., 'disassy') or starts-with(., 'fault')]) and not(ancestor::book[contains(@doctype,'oh')] and ancestor::ata-page-block/@pb-name[starts-with(., 'clean')]) and not(ancestor::book[contains(@doctype,'oh')] and ancestor::page-block/@pb-name[starts-with(., 'clean')]) and not(ancestor::ata-page-block/@pb-name[starts-with(., 'mainprac')]) and not(ancestor::page-block/@pb-name[starts-with(., 'mainprac')]) and not(ancestor::book[contains(@doctype,'oh')] and ancestor::ata-page-block/@pb-name[starts-with(., 'inspect')]) and not(ancestor::book[contains(@doctype,'oh')] and ancestor::page-block/@pb-name[starts-with(., 'inspect')]) and not(ancestor::ata-page-block/@pb-name[(starts-with(., 'di') and 'di' = translate(., '0123456789', '') and string-length(.) &gt; 2) or starts-with(.,'service')]) and not(ancestor::page-block/@pb-name[(starts-with(., 'di') and 'di' = translate(., '0123456789', '') and string-length(.) &gt; 2) or starts-with(.,'service')]) and not(ancestor::book[contains(@doctype,'oh')] and ancestor::ata-page-block/@pb-name[starts-with(., 'repair')]) and not(ancestor::book[contains(@doctype,'oh')] and ancestor::page-block/@pb-name[starts-with(., 'repair')]) and not(ancestor::book[contains(@doctype,'oh')] and ancestor::ata-page-block/@pb-name[starts-with(., 'test')]) and not(ancestor::book[contains(@doctype,'oh')] and ancestor::page-block/@pb-name[starts-with(., 'test')]) and not(ancestor::ata-page-block/@pb-name[(starts-with(., 'cl') and 'cl' = translate(., '0123456789', '') and string-length(.) &gt; 2) or .='install' or starts-with(.,'rem-inst') or (starts-with(., 'reminst') and 'reminst' = translate(., '0123456789', '') and string-length(.) &gt; 7) or .='remove' or (starts-with(., 'repair') and 'repair' = translate(., '0123456789', '') and string-length(.) &gt; 6)]) and not(ancestor::page-block/@pb-name[(starts-with(., 'cl') and 'cl' = translate(., '0123456789', '') and string-length(.) &gt; 2) or .='install' or starts-with(.,'rem-inst') or (starts-with(., 'reminst') and 'reminst' = translate(., '0123456789', '') and string-length(.) &gt; 7) or .='remove' or (starts-with(., 'repair') and 'repair' = translate(., '0123456789', '') and string-length(.) &gt; 6)]) and not(ancestor::ata-page-block/@pb-name[starts-with(., 'assy') or (starts-with(., 'ic') and 'ic' = translate(., '0123456789', '') and string-length(.) &gt; 2) or (starts-with(., 'te') and 'te' = translate(., '0123456789', '') and string-length(.) &gt; 2) or .='test']) and not(ancestor::page-block/@pb-name[starts-with(., 'assy') or (starts-with(., 'ic') and 'ic' = translate(., '0123456789', '') and string-length(.) &gt; 2) or (starts-with(., 'te') and 'te' = translate(., '0123456789', '') and string-length(.) &gt; 2) or .='test']) and not(ancestor::ata-page-block/@pb-name[.='f-and-c' or starts-with(., 'inspect') or (starts-with(., 're') and 're' = translate(., '0123456789', '') and string-length(.) &gt; 2)]) and not(ancestor::page-block/@pb-name[.='f-and-c' or starts-with(., 'inspect') or (starts-with(., 're') and 're' = translate(., '0123456789', '') and string-length(.) &gt; 2)]) and (ancestor::ata-page-block/@pb-name[(starts-with(., 'as') and 'as' = translate(., '0123456789', '') and string-length(.) &gt; 2) or starts-with(.,'clean') or (starts-with(., 'test') and 'test' = translate(., '0123456789', '') and string-length(.) &gt; 4)])">
               <xsl:attribute name="_gte:count-as-id">cnt__table^ata-page-block.cnt</xsl:attribute>
            </xsl:when>
            <xsl:when test="not(ancestor::book[contains(@doctype,'cir') or contains(@doctype,'em') or contains(@doctype,'tmm')]) and not(ancestor::book[contains(@doctype,'oh')] and ancestor::ata-page-block/@pb-name[.='service']) and not(ancestor::book[contains(@doctype,'oh')] and ancestor::page-block/@pb-name[.='service']) and not(ancestor::ata-page-block/@pb-name[.='00awl' or .='00intro' or .='airlim' or .='awl' or .='awlror' or .='chapsect' or .='consume' or .='d-and-o' or .='frontmatte' or .='howtouse' or .='00howtouse' or .='intro' or .='nut_option' or .='oplimits' or .='sblist' or .='schedchk' or .='spectool' or .='timelim' or .='title-page']) and not(ancestor::page-block/@pb-name[.='00awl' or .='00intro' or .='airlim' or .='awl' or .='awlror' or .='chapsect' or .='consume' or .='d-and-o' or .='frontmatte' or .='howtouse' or .='00howtouse' or .='intro' or .='nut_option' or .='oplimits' or .='sblist' or .='schedchk' or .='spectool' or .='timelim' or .='title-page']) and not(ancestor::ata-page-block/@pb-name[(starts-with(., 'do') and 'do' = translate(., '0123456789', '') and string-length(.) &gt; 2) or (starts-with(., 'in') and 'in' = translate(., '0123456789', '') and string-length(.) &gt; 2) or (starts-with(., 'tl') and 'tl' = translate(., '0123456789', '') and string-length(.) &gt; 2) or .='toolsht' or .='trlist' or .='unschedc' or .='unschedchk']) and not(ancestor::page-block/@pb-name[(starts-with(., 'do') and 'do' = translate(., '0123456789', '') and string-length(.) &gt; 2) or (starts-with(., 'in') and 'in' = translate(., '0123456789', '') and string-length(.) &gt; 2) or (starts-with(., 'tl') and 'tl' = translate(., '0123456789', '') and string-length(.) &gt; 2) or .='toolsht' or .='trlist' or .='unschedc' or .='unschedchk']) and not(ancestor-or-self::ata-page-block[1]/@pb-name and string(ancestor-or-self::ata-page-block[1]/@pb-name)='intro00') and not(ancestor-or-self::page-block[1]/@pb-name and string(ancestor-or-self::page-block[1]/@pb-name)='intro00') and not(ancestor::ata-page-block/@pb-name[starts-with(., 'disassy') or starts-with(., 'fault')]) and not(ancestor::page-block/@pb-name[starts-with(., 'disassy') or starts-with(., 'fault')]) and not(ancestor::book[contains(@doctype,'oh')] and ancestor::ata-page-block/@pb-name[starts-with(., 'clean')]) and not(ancestor::book[contains(@doctype,'oh')] and ancestor::page-block/@pb-name[starts-with(., 'clean')]) and not(ancestor::ata-page-block/@pb-name[starts-with(., 'mainprac')]) and not(ancestor::page-block/@pb-name[starts-with(., 'mainprac')]) and not(ancestor::book[contains(@doctype,'oh')] and ancestor::ata-page-block/@pb-name[starts-with(., 'inspect')]) and not(ancestor::book[contains(@doctype,'oh')] and ancestor::page-block/@pb-name[starts-with(., 'inspect')]) and not(ancestor::ata-page-block/@pb-name[(starts-with(., 'di') and 'di' = translate(., '0123456789', '') and string-length(.) &gt; 2) or starts-with(.,'service')]) and not(ancestor::page-block/@pb-name[(starts-with(., 'di') and 'di' = translate(., '0123456789', '') and string-length(.) &gt; 2) or starts-with(.,'service')]) and not(ancestor::book[contains(@doctype,'oh')] and ancestor::ata-page-block/@pb-name[starts-with(., 'repair')]) and not(ancestor::book[contains(@doctype,'oh')] and ancestor::page-block/@pb-name[starts-with(., 'repair')]) and not(ancestor::book[contains(@doctype,'oh')] and ancestor::ata-page-block/@pb-name[starts-with(., 'test')]) and not(ancestor::book[contains(@doctype,'oh')] and ancestor::page-block/@pb-name[starts-with(., 'test')]) and not(ancestor::ata-page-block/@pb-name[(starts-with(., 'cl') and 'cl' = translate(., '0123456789', '') and string-length(.) &gt; 2) or .='install' or starts-with(.,'rem-inst') or (starts-with(., 'reminst') and 'reminst' = translate(., '0123456789', '') and string-length(.) &gt; 7) or .='remove' or (starts-with(., 'repair') and 'repair' = translate(., '0123456789', '') and string-length(.) &gt; 6)]) and not(ancestor::page-block/@pb-name[(starts-with(., 'cl') and 'cl' = translate(., '0123456789', '') and string-length(.) &gt; 2) or .='install' or starts-with(.,'rem-inst') or (starts-with(., 'reminst') and 'reminst' = translate(., '0123456789', '') and string-length(.) &gt; 7) or .='remove' or (starts-with(., 'repair') and 'repair' = translate(., '0123456789', '') and string-length(.) &gt; 6)]) and not(ancestor::ata-page-block/@pb-name[starts-with(., 'assy') or (starts-with(., 'ic') and 'ic' = translate(., '0123456789', '') and string-length(.) &gt; 2) or (starts-with(., 'te') and 'te' = translate(., '0123456789', '') and string-length(.) &gt; 2) or .='test']) and not(ancestor::page-block/@pb-name[starts-with(., 'assy') or (starts-with(., 'ic') and 'ic' = translate(., '0123456789', '') and string-length(.) &gt; 2) or (starts-with(., 'te') and 'te' = translate(., '0123456789', '') and string-length(.) &gt; 2) or .='test']) and not(ancestor::ata-page-block/@pb-name[.='f-and-c' or starts-with(., 'inspect') or (starts-with(., 're') and 're' = translate(., '0123456789', '') and string-length(.) &gt; 2)]) and (ancestor::page-block/@pb-name[.='f-and-c' or starts-with(., 'inspect') or (starts-with(., 're') and 're' = translate(., '0123456789', '') and string-length(.) &gt; 2)])">
               <xsl:attribute name="_gte:count-as-id">cnt__table^page-block.cnt</xsl:attribute>
            </xsl:when>
            <xsl:when test="not(ancestor::book[contains(@doctype,'cir') or contains(@doctype,'em') or contains(@doctype,'tmm')]) and not(ancestor::book[contains(@doctype,'oh')] and ancestor::ata-page-block/@pb-name[.='service']) and not(ancestor::book[contains(@doctype,'oh')] and ancestor::page-block/@pb-name[.='service']) and not(ancestor::ata-page-block/@pb-name[.='00awl' or .='00intro' or .='airlim' or .='awl' or .='awlror' or .='chapsect' or .='consume' or .='d-and-o' or .='frontmatte' or .='howtouse' or .='00howtouse' or .='intro' or .='nut_option' or .='oplimits' or .='sblist' or .='schedchk' or .='spectool' or .='timelim' or .='title-page']) and not(ancestor::page-block/@pb-name[.='00awl' or .='00intro' or .='airlim' or .='awl' or .='awlror' or .='chapsect' or .='consume' or .='d-and-o' or .='frontmatte' or .='howtouse' or .='00howtouse' or .='intro' or .='nut_option' or .='oplimits' or .='sblist' or .='schedchk' or .='spectool' or .='timelim' or .='title-page']) and not(ancestor::ata-page-block/@pb-name[(starts-with(., 'do') and 'do' = translate(., '0123456789', '') and string-length(.) &gt; 2) or (starts-with(., 'in') and 'in' = translate(., '0123456789', '') and string-length(.) &gt; 2) or (starts-with(., 'tl') and 'tl' = translate(., '0123456789', '') and string-length(.) &gt; 2) or .='toolsht' or .='trlist' or .='unschedc' or .='unschedchk']) and not(ancestor::page-block/@pb-name[(starts-with(., 'do') and 'do' = translate(., '0123456789', '') and string-length(.) &gt; 2) or (starts-with(., 'in') and 'in' = translate(., '0123456789', '') and string-length(.) &gt; 2) or (starts-with(., 'tl') and 'tl' = translate(., '0123456789', '') and string-length(.) &gt; 2) or .='toolsht' or .='trlist' or .='unschedc' or .='unschedchk']) and not(ancestor-or-self::ata-page-block[1]/@pb-name and string(ancestor-or-self::ata-page-block[1]/@pb-name)='intro00') and not(ancestor-or-self::page-block[1]/@pb-name and string(ancestor-or-self::page-block[1]/@pb-name)='intro00') and not(ancestor::ata-page-block/@pb-name[starts-with(., 'disassy') or starts-with(., 'fault')]) and not(ancestor::page-block/@pb-name[starts-with(., 'disassy') or starts-with(., 'fault')]) and not(ancestor::book[contains(@doctype,'oh')] and ancestor::ata-page-block/@pb-name[starts-with(., 'clean')]) and not(ancestor::book[contains(@doctype,'oh')] and ancestor::page-block/@pb-name[starts-with(., 'clean')]) and not(ancestor::ata-page-block/@pb-name[starts-with(., 'mainprac')]) and not(ancestor::page-block/@pb-name[starts-with(., 'mainprac')]) and not(ancestor::book[contains(@doctype,'oh')] and ancestor::ata-page-block/@pb-name[starts-with(., 'inspect')]) and not(ancestor::book[contains(@doctype,'oh')] and ancestor::page-block/@pb-name[starts-with(., 'inspect')]) and not(ancestor::ata-page-block/@pb-name[(starts-with(., 'di') and 'di' = translate(., '0123456789', '') and string-length(.) &gt; 2) or starts-with(.,'service')]) and not(ancestor::page-block/@pb-name[(starts-with(., 'di') and 'di' = translate(., '0123456789', '') and string-length(.) &gt; 2) or starts-with(.,'service')]) and not(ancestor::book[contains(@doctype,'oh')] and ancestor::ata-page-block/@pb-name[starts-with(., 'repair')]) and not(ancestor::book[contains(@doctype,'oh')] and ancestor::page-block/@pb-name[starts-with(., 'repair')]) and not(ancestor::book[contains(@doctype,'oh')] and ancestor::ata-page-block/@pb-name[starts-with(., 'test')]) and not(ancestor::book[contains(@doctype,'oh')] and ancestor::page-block/@pb-name[starts-with(., 'test')]) and not(ancestor::ata-page-block/@pb-name[(starts-with(., 'cl') and 'cl' = translate(., '0123456789', '') and string-length(.) &gt; 2) or .='install' or starts-with(.,'rem-inst') or (starts-with(., 'reminst') and 'reminst' = translate(., '0123456789', '') and string-length(.) &gt; 7) or .='remove' or (starts-with(., 'repair') and 'repair' = translate(., '0123456789', '') and string-length(.) &gt; 6)]) and not(ancestor::page-block/@pb-name[(starts-with(., 'cl') and 'cl' = translate(., '0123456789', '') and string-length(.) &gt; 2) or .='install' or starts-with(.,'rem-inst') or (starts-with(., 'reminst') and 'reminst' = translate(., '0123456789', '') and string-length(.) &gt; 7) or .='remove' or (starts-with(., 'repair') and 'repair' = translate(., '0123456789', '') and string-length(.) &gt; 6)]) and not(ancestor::ata-page-block/@pb-name[starts-with(., 'assy') or (starts-with(., 'ic') and 'ic' = translate(., '0123456789', '') and string-length(.) &gt; 2) or (starts-with(., 'te') and 'te' = translate(., '0123456789', '') and string-length(.) &gt; 2) or .='test']) and not(ancestor::page-block/@pb-name[starts-with(., 'assy') or (starts-with(., 'ic') and 'ic' = translate(., '0123456789', '') and string-length(.) &gt; 2) or (starts-with(., 'te') and 'te' = translate(., '0123456789', '') and string-length(.) &gt; 2) or .='test']) and (ancestor::ata-page-block/@pb-name[.='f-and-c' or starts-with(., 'inspect') or (starts-with(., 're') and 're' = translate(., '0123456789', '') and string-length(.) &gt; 2)])">
               <xsl:attribute name="_gte:count-as-id">cnt__table^ata-page-block.cnt</xsl:attribute>
            </xsl:when>
            <xsl:when test="not(ancestor::book[contains(@doctype,'cir') or contains(@doctype,'em') or contains(@doctype,'tmm')]) and not(ancestor::book[contains(@doctype,'oh')] and ancestor::ata-page-block/@pb-name[.='service']) and not(ancestor::book[contains(@doctype,'oh')] and ancestor::page-block/@pb-name[.='service']) and not(ancestor::ata-page-block/@pb-name[.='00awl' or .='00intro' or .='airlim' or .='awl' or .='awlror' or .='chapsect' or .='consume' or .='d-and-o' or .='frontmatte' or .='howtouse' or .='00howtouse' or .='intro' or .='nut_option' or .='oplimits' or .='sblist' or .='schedchk' or .='spectool' or .='timelim' or .='title-page']) and not(ancestor::page-block/@pb-name[.='00awl' or .='00intro' or .='airlim' or .='awl' or .='awlror' or .='chapsect' or .='consume' or .='d-and-o' or .='frontmatte' or .='howtouse' or .='00howtouse' or .='intro' or .='nut_option' or .='oplimits' or .='sblist' or .='schedchk' or .='spectool' or .='timelim' or .='title-page']) and not(ancestor::ata-page-block/@pb-name[(starts-with(., 'do') and 'do' = translate(., '0123456789', '') and string-length(.) &gt; 2) or (starts-with(., 'in') and 'in' = translate(., '0123456789', '') and string-length(.) &gt; 2) or (starts-with(., 'tl') and 'tl' = translate(., '0123456789', '') and string-length(.) &gt; 2) or .='toolsht' or .='trlist' or .='unschedc' or .='unschedchk']) and not(ancestor::page-block/@pb-name[(starts-with(., 'do') and 'do' = translate(., '0123456789', '') and string-length(.) &gt; 2) or (starts-with(., 'in') and 'in' = translate(., '0123456789', '') and string-length(.) &gt; 2) or (starts-with(., 'tl') and 'tl' = translate(., '0123456789', '') and string-length(.) &gt; 2) or .='toolsht' or .='trlist' or .='unschedc' or .='unschedchk']) and not(ancestor-or-self::ata-page-block[1]/@pb-name and string(ancestor-or-self::ata-page-block[1]/@pb-name)='intro00') and not(ancestor-or-self::page-block[1]/@pb-name and string(ancestor-or-self::page-block[1]/@pb-name)='intro00') and not(ancestor::ata-page-block/@pb-name[starts-with(., 'disassy') or starts-with(., 'fault')]) and not(ancestor::page-block/@pb-name[starts-with(., 'disassy') or starts-with(., 'fault')]) and not(ancestor::book[contains(@doctype,'oh')] and ancestor::ata-page-block/@pb-name[starts-with(., 'clean')]) and not(ancestor::book[contains(@doctype,'oh')] and ancestor::page-block/@pb-name[starts-with(., 'clean')]) and not(ancestor::ata-page-block/@pb-name[starts-with(., 'mainprac')]) and not(ancestor::page-block/@pb-name[starts-with(., 'mainprac')]) and not(ancestor::book[contains(@doctype,'oh')] and ancestor::ata-page-block/@pb-name[starts-with(., 'inspect')]) and not(ancestor::book[contains(@doctype,'oh')] and ancestor::page-block/@pb-name[starts-with(., 'inspect')]) and not(ancestor::ata-page-block/@pb-name[(starts-with(., 'di') and 'di' = translate(., '0123456789', '') and string-length(.) &gt; 2) or starts-with(.,'service')]) and not(ancestor::page-block/@pb-name[(starts-with(., 'di') and 'di' = translate(., '0123456789', '') and string-length(.) &gt; 2) or starts-with(.,'service')]) and not(ancestor::book[contains(@doctype,'oh')] and ancestor::ata-page-block/@pb-name[starts-with(., 'repair')]) and not(ancestor::book[contains(@doctype,'oh')] and ancestor::page-block/@pb-name[starts-with(., 'repair')]) and not(ancestor::book[contains(@doctype,'oh')] and ancestor::ata-page-block/@pb-name[starts-with(., 'test')]) and not(ancestor::book[contains(@doctype,'oh')] and ancestor::page-block/@pb-name[starts-with(., 'test')]) and not(ancestor::ata-page-block/@pb-name[(starts-with(., 'cl') and 'cl' = translate(., '0123456789', '') and string-length(.) &gt; 2) or .='install' or starts-with(.,'rem-inst') or (starts-with(., 'reminst') and 'reminst' = translate(., '0123456789', '') and string-length(.) &gt; 7) or .='remove' or (starts-with(., 'repair') and 'repair' = translate(., '0123456789', '') and string-length(.) &gt; 6)]) and not(ancestor::page-block/@pb-name[(starts-with(., 'cl') and 'cl' = translate(., '0123456789', '') and string-length(.) &gt; 2) or .='install' or starts-with(.,'rem-inst') or (starts-with(., 'reminst') and 'reminst' = translate(., '0123456789', '') and string-length(.) &gt; 7) or .='remove' or (starts-with(., 'repair') and 'repair' = translate(., '0123456789', '') and string-length(.) &gt; 6)]) and not(ancestor::ata-page-block/@pb-name[starts-with(., 'assy') or (starts-with(., 'ic') and 'ic' = translate(., '0123456789', '') and string-length(.) &gt; 2) or (starts-with(., 'te') and 'te' = translate(., '0123456789', '') and string-length(.) &gt; 2) or .='test']) and (ancestor::page-block/@pb-name[starts-with(., 'assy') or (starts-with(., 'ic') and 'ic' = translate(., '0123456789', '') and string-length(.) &gt; 2) or (starts-with(., 'te') and 'te' = translate(., '0123456789', '') and string-length(.) &gt; 2) or .='test'])">
               <xsl:attribute name="_gte:count-as-id">cnt__table^page-block.cnt</xsl:attribute>
            </xsl:when>
            <xsl:when test="not(ancestor::book[contains(@doctype,'cir') or contains(@doctype,'em') or contains(@doctype,'tmm')]) and not(ancestor::book[contains(@doctype,'oh')] and ancestor::ata-page-block/@pb-name[.='service']) and not(ancestor::book[contains(@doctype,'oh')] and ancestor::page-block/@pb-name[.='service']) and not(ancestor::ata-page-block/@pb-name[.='00awl' or .='00intro' or .='airlim' or .='awl' or .='awlror' or .='chapsect' or .='consume' or .='d-and-o' or .='frontmatte' or .='howtouse' or .='00howtouse' or .='intro' or .='nut_option' or .='oplimits' or .='sblist' or .='schedchk' or .='spectool' or .='timelim' or .='title-page']) and not(ancestor::page-block/@pb-name[.='00awl' or .='00intro' or .='airlim' or .='awl' or .='awlror' or .='chapsect' or .='consume' or .='d-and-o' or .='frontmatte' or .='howtouse' or .='00howtouse' or .='intro' or .='nut_option' or .='oplimits' or .='sblist' or .='schedchk' or .='spectool' or .='timelim' or .='title-page']) and not(ancestor::ata-page-block/@pb-name[(starts-with(., 'do') and 'do' = translate(., '0123456789', '') and string-length(.) &gt; 2) or (starts-with(., 'in') and 'in' = translate(., '0123456789', '') and string-length(.) &gt; 2) or (starts-with(., 'tl') and 'tl' = translate(., '0123456789', '') and string-length(.) &gt; 2) or .='toolsht' or .='trlist' or .='unschedc' or .='unschedchk']) and not(ancestor::page-block/@pb-name[(starts-with(., 'do') and 'do' = translate(., '0123456789', '') and string-length(.) &gt; 2) or (starts-with(., 'in') and 'in' = translate(., '0123456789', '') and string-length(.) &gt; 2) or (starts-with(., 'tl') and 'tl' = translate(., '0123456789', '') and string-length(.) &gt; 2) or .='toolsht' or .='trlist' or .='unschedc' or .='unschedchk']) and not(ancestor-or-self::ata-page-block[1]/@pb-name and string(ancestor-or-self::ata-page-block[1]/@pb-name)='intro00') and not(ancestor-or-self::page-block[1]/@pb-name and string(ancestor-or-self::page-block[1]/@pb-name)='intro00') and not(ancestor::ata-page-block/@pb-name[starts-with(., 'disassy') or starts-with(., 'fault')]) and not(ancestor::page-block/@pb-name[starts-with(., 'disassy') or starts-with(., 'fault')]) and not(ancestor::book[contains(@doctype,'oh')] and ancestor::ata-page-block/@pb-name[starts-with(., 'clean')]) and not(ancestor::book[contains(@doctype,'oh')] and ancestor::page-block/@pb-name[starts-with(., 'clean')]) and not(ancestor::ata-page-block/@pb-name[starts-with(., 'mainprac')]) and not(ancestor::page-block/@pb-name[starts-with(., 'mainprac')]) and not(ancestor::book[contains(@doctype,'oh')] and ancestor::ata-page-block/@pb-name[starts-with(., 'inspect')]) and not(ancestor::book[contains(@doctype,'oh')] and ancestor::page-block/@pb-name[starts-with(., 'inspect')]) and not(ancestor::ata-page-block/@pb-name[(starts-with(., 'di') and 'di' = translate(., '0123456789', '') and string-length(.) &gt; 2) or starts-with(.,'service')]) and not(ancestor::page-block/@pb-name[(starts-with(., 'di') and 'di' = translate(., '0123456789', '') and string-length(.) &gt; 2) or starts-with(.,'service')]) and not(ancestor::book[contains(@doctype,'oh')] and ancestor::ata-page-block/@pb-name[starts-with(., 'repair')]) and not(ancestor::book[contains(@doctype,'oh')] and ancestor::page-block/@pb-name[starts-with(., 'repair')]) and not(ancestor::book[contains(@doctype,'oh')] and ancestor::ata-page-block/@pb-name[starts-with(., 'test')]) and not(ancestor::book[contains(@doctype,'oh')] and ancestor::page-block/@pb-name[starts-with(., 'test')]) and not(ancestor::ata-page-block/@pb-name[(starts-with(., 'cl') and 'cl' = translate(., '0123456789', '') and string-length(.) &gt; 2) or .='install' or starts-with(.,'rem-inst') or (starts-with(., 'reminst') and 'reminst' = translate(., '0123456789', '') and string-length(.) &gt; 7) or .='remove' or (starts-with(., 'repair') and 'repair' = translate(., '0123456789', '') and string-length(.) &gt; 6)]) and not(ancestor::page-block/@pb-name[(starts-with(., 'cl') and 'cl' = translate(., '0123456789', '') and string-length(.) &gt; 2) or .='install' or starts-with(.,'rem-inst') or (starts-with(., 'reminst') and 'reminst' = translate(., '0123456789', '') and string-length(.) &gt; 7) or .='remove' or (starts-with(., 'repair') and 'repair' = translate(., '0123456789', '') and string-length(.) &gt; 6)]) and (ancestor::ata-page-block/@pb-name[starts-with(., 'assy') or (starts-with(., 'ic') and 'ic' = translate(., '0123456789', '') and string-length(.) &gt; 2) or (starts-with(., 'te') and 'te' = translate(., '0123456789', '') and string-length(.) &gt; 2) or .='test'])">
               <xsl:attribute name="_gte:count-as-id">cnt__table^ata-page-block.cnt</xsl:attribute>
            </xsl:when>
            <xsl:when test="not(ancestor::book[contains(@doctype,'cir') or contains(@doctype,'em') or contains(@doctype,'tmm')]) and not(ancestor::book[contains(@doctype,'oh')] and ancestor::ata-page-block/@pb-name[.='service']) and not(ancestor::book[contains(@doctype,'oh')] and ancestor::page-block/@pb-name[.='service']) and not(ancestor::ata-page-block/@pb-name[.='00awl' or .='00intro' or .='airlim' or .='awl' or .='awlror' or .='chapsect' or .='consume' or .='d-and-o' or .='frontmatte' or .='howtouse' or .='00howtouse' or .='intro' or .='nut_option' or .='oplimits' or .='sblist' or .='schedchk' or .='spectool' or .='timelim' or .='title-page']) and not(ancestor::page-block/@pb-name[.='00awl' or .='00intro' or .='airlim' or .='awl' or .='awlror' or .='chapsect' or .='consume' or .='d-and-o' or .='frontmatte' or .='howtouse' or .='00howtouse' or .='intro' or .='nut_option' or .='oplimits' or .='sblist' or .='schedchk' or .='spectool' or .='timelim' or .='title-page']) and not(ancestor::ata-page-block/@pb-name[(starts-with(., 'do') and 'do' = translate(., '0123456789', '') and string-length(.) &gt; 2) or (starts-with(., 'in') and 'in' = translate(., '0123456789', '') and string-length(.) &gt; 2) or (starts-with(., 'tl') and 'tl' = translate(., '0123456789', '') and string-length(.) &gt; 2) or .='toolsht' or .='trlist' or .='unschedc' or .='unschedchk']) and not(ancestor::page-block/@pb-name[(starts-with(., 'do') and 'do' = translate(., '0123456789', '') and string-length(.) &gt; 2) or (starts-with(., 'in') and 'in' = translate(., '0123456789', '') and string-length(.) &gt; 2) or (starts-with(., 'tl') and 'tl' = translate(., '0123456789', '') and string-length(.) &gt; 2) or .='toolsht' or .='trlist' or .='unschedc' or .='unschedchk']) and not(ancestor-or-self::ata-page-block[1]/@pb-name and string(ancestor-or-self::ata-page-block[1]/@pb-name)='intro00') and not(ancestor-or-self::page-block[1]/@pb-name and string(ancestor-or-self::page-block[1]/@pb-name)='intro00') and not(ancestor::ata-page-block/@pb-name[starts-with(., 'disassy') or starts-with(., 'fault')]) and not(ancestor::page-block/@pb-name[starts-with(., 'disassy') or starts-with(., 'fault')]) and not(ancestor::book[contains(@doctype,'oh')] and ancestor::ata-page-block/@pb-name[starts-with(., 'clean')]) and not(ancestor::book[contains(@doctype,'oh')] and ancestor::page-block/@pb-name[starts-with(., 'clean')]) and not(ancestor::ata-page-block/@pb-name[starts-with(., 'mainprac')]) and not(ancestor::page-block/@pb-name[starts-with(., 'mainprac')]) and not(ancestor::book[contains(@doctype,'oh')] and ancestor::ata-page-block/@pb-name[starts-with(., 'inspect')]) and not(ancestor::book[contains(@doctype,'oh')] and ancestor::page-block/@pb-name[starts-with(., 'inspect')]) and not(ancestor::ata-page-block/@pb-name[(starts-with(., 'di') and 'di' = translate(., '0123456789', '') and string-length(.) &gt; 2) or starts-with(.,'service')]) and not(ancestor::page-block/@pb-name[(starts-with(., 'di') and 'di' = translate(., '0123456789', '') and string-length(.) &gt; 2) or starts-with(.,'service')]) and not(ancestor::book[contains(@doctype,'oh')] and ancestor::ata-page-block/@pb-name[starts-with(., 'repair')]) and not(ancestor::book[contains(@doctype,'oh')] and ancestor::page-block/@pb-name[starts-with(., 'repair')]) and not(ancestor::book[contains(@doctype,'oh')] and ancestor::ata-page-block/@pb-name[starts-with(., 'test')]) and not(ancestor::book[contains(@doctype,'oh')] and ancestor::page-block/@pb-name[starts-with(., 'test')]) and not(ancestor::ata-page-block/@pb-name[(starts-with(., 'cl') and 'cl' = translate(., '0123456789', '') and string-length(.) &gt; 2) or .='install' or starts-with(.,'rem-inst') or (starts-with(., 'reminst') and 'reminst' = translate(., '0123456789', '') and string-length(.) &gt; 7) or .='remove' or (starts-with(., 'repair') and 'repair' = translate(., '0123456789', '') and string-length(.) &gt; 6)]) and (ancestor::page-block/@pb-name[(starts-with(., 'cl') and 'cl' = translate(., '0123456789', '') and string-length(.) &gt; 2) or .='install' or starts-with(.,'rem-inst') or (starts-with(., 'reminst') and 'reminst' = translate(., '0123456789', '') and string-length(.) &gt; 7) or .='remove' or (starts-with(., 'repair') and 'repair' = translate(., '0123456789', '') and string-length(.) &gt; 6)])">
               <xsl:attribute name="_gte:count-as-id">cnt__table^page-block.cnt</xsl:attribute>
            </xsl:when>
            <xsl:when test="not(ancestor::book[contains(@doctype,'cir') or contains(@doctype,'em') or contains(@doctype,'tmm')]) and not(ancestor::book[contains(@doctype,'oh')] and ancestor::ata-page-block/@pb-name[.='service']) and not(ancestor::book[contains(@doctype,'oh')] and ancestor::page-block/@pb-name[.='service']) and not(ancestor::ata-page-block/@pb-name[.='00awl' or .='00intro' or .='airlim' or .='awl' or .='awlror' or .='chapsect' or .='consume' or .='d-and-o' or .='frontmatte' or .='howtouse' or .='00howtouse' or .='intro' or .='nut_option' or .='oplimits' or .='sblist' or .='schedchk' or .='spectool' or .='timelim' or .='title-page']) and not(ancestor::page-block/@pb-name[.='00awl' or .='00intro' or .='airlim' or .='awl' or .='awlror' or .='chapsect' or .='consume' or .='d-and-o' or .='frontmatte' or .='howtouse' or .='00howtouse' or .='intro' or .='nut_option' or .='oplimits' or .='sblist' or .='schedchk' or .='spectool' or .='timelim' or .='title-page']) and not(ancestor::ata-page-block/@pb-name[(starts-with(., 'do') and 'do' = translate(., '0123456789', '') and string-length(.) &gt; 2) or (starts-with(., 'in') and 'in' = translate(., '0123456789', '') and string-length(.) &gt; 2) or (starts-with(., 'tl') and 'tl' = translate(., '0123456789', '') and string-length(.) &gt; 2) or .='toolsht' or .='trlist' or .='unschedc' or .='unschedchk']) and not(ancestor::page-block/@pb-name[(starts-with(., 'do') and 'do' = translate(., '0123456789', '') and string-length(.) &gt; 2) or (starts-with(., 'in') and 'in' = translate(., '0123456789', '') and string-length(.) &gt; 2) or (starts-with(., 'tl') and 'tl' = translate(., '0123456789', '') and string-length(.) &gt; 2) or .='toolsht' or .='trlist' or .='unschedc' or .='unschedchk']) and not(ancestor-or-self::ata-page-block[1]/@pb-name and string(ancestor-or-self::ata-page-block[1]/@pb-name)='intro00') and not(ancestor-or-self::page-block[1]/@pb-name and string(ancestor-or-self::page-block[1]/@pb-name)='intro00') and not(ancestor::ata-page-block/@pb-name[starts-with(., 'disassy') or starts-with(., 'fault')]) and not(ancestor::page-block/@pb-name[starts-with(., 'disassy') or starts-with(., 'fault')]) and not(ancestor::book[contains(@doctype,'oh')] and ancestor::ata-page-block/@pb-name[starts-with(., 'clean')]) and not(ancestor::book[contains(@doctype,'oh')] and ancestor::page-block/@pb-name[starts-with(., 'clean')]) and not(ancestor::ata-page-block/@pb-name[starts-with(., 'mainprac')]) and not(ancestor::page-block/@pb-name[starts-with(., 'mainprac')]) and not(ancestor::book[contains(@doctype,'oh')] and ancestor::ata-page-block/@pb-name[starts-with(., 'inspect')]) and not(ancestor::book[contains(@doctype,'oh')] and ancestor::page-block/@pb-name[starts-with(., 'inspect')]) and not(ancestor::ata-page-block/@pb-name[(starts-with(., 'di') and 'di' = translate(., '0123456789', '') and string-length(.) &gt; 2) or starts-with(.,'service')]) and not(ancestor::page-block/@pb-name[(starts-with(., 'di') and 'di' = translate(., '0123456789', '') and string-length(.) &gt; 2) or starts-with(.,'service')]) and not(ancestor::book[contains(@doctype,'oh')] and ancestor::ata-page-block/@pb-name[starts-with(., 'repair')]) and not(ancestor::book[contains(@doctype,'oh')] and ancestor::page-block/@pb-name[starts-with(., 'repair')]) and not(ancestor::book[contains(@doctype,'oh')] and ancestor::ata-page-block/@pb-name[starts-with(., 'test')]) and not(ancestor::book[contains(@doctype,'oh')] and ancestor::page-block/@pb-name[starts-with(., 'test')]) and (ancestor::ata-page-block/@pb-name[(starts-with(., 'cl') and 'cl' = translate(., '0123456789', '') and string-length(.) &gt; 2) or .='install' or starts-with(.,'rem-inst') or (starts-with(., 'reminst') and 'reminst' = translate(., '0123456789', '') and string-length(.) &gt; 7) or .='remove' or (starts-with(., 'repair') and 'repair' = translate(., '0123456789', '') and string-length(.) &gt; 6)])">
               <xsl:attribute name="_gte:count-as-id">cnt__table^ata-page-block.cnt</xsl:attribute>
            </xsl:when>
            <xsl:when test="not(ancestor::book[contains(@doctype,'cir') or contains(@doctype,'em') or contains(@doctype,'tmm')]) and not(ancestor::book[contains(@doctype,'oh')] and ancestor::ata-page-block/@pb-name[.='service']) and not(ancestor::book[contains(@doctype,'oh')] and ancestor::page-block/@pb-name[.='service']) and not(ancestor::ata-page-block/@pb-name[.='00awl' or .='00intro' or .='airlim' or .='awl' or .='awlror' or .='chapsect' or .='consume' or .='d-and-o' or .='frontmatte' or .='howtouse' or .='00howtouse' or .='intro' or .='nut_option' or .='oplimits' or .='sblist' or .='schedchk' or .='spectool' or .='timelim' or .='title-page']) and not(ancestor::page-block/@pb-name[.='00awl' or .='00intro' or .='airlim' or .='awl' or .='awlror' or .='chapsect' or .='consume' or .='d-and-o' or .='frontmatte' or .='howtouse' or .='00howtouse' or .='intro' or .='nut_option' or .='oplimits' or .='sblist' or .='schedchk' or .='spectool' or .='timelim' or .='title-page']) and not(ancestor::ata-page-block/@pb-name[(starts-with(., 'do') and 'do' = translate(., '0123456789', '') and string-length(.) &gt; 2) or (starts-with(., 'in') and 'in' = translate(., '0123456789', '') and string-length(.) &gt; 2) or (starts-with(., 'tl') and 'tl' = translate(., '0123456789', '') and string-length(.) &gt; 2) or .='toolsht' or .='trlist' or .='unschedc' or .='unschedchk']) and not(ancestor::page-block/@pb-name[(starts-with(., 'do') and 'do' = translate(., '0123456789', '') and string-length(.) &gt; 2) or (starts-with(., 'in') and 'in' = translate(., '0123456789', '') and string-length(.) &gt; 2) or (starts-with(., 'tl') and 'tl' = translate(., '0123456789', '') and string-length(.) &gt; 2) or .='toolsht' or .='trlist' or .='unschedc' or .='unschedchk']) and not(ancestor-or-self::ata-page-block[1]/@pb-name and string(ancestor-or-self::ata-page-block[1]/@pb-name)='intro00') and not(ancestor-or-self::page-block[1]/@pb-name and string(ancestor-or-self::page-block[1]/@pb-name)='intro00') and not(ancestor::ata-page-block/@pb-name[starts-with(., 'disassy') or starts-with(., 'fault')]) and not(ancestor::page-block/@pb-name[starts-with(., 'disassy') or starts-with(., 'fault')]) and not(ancestor::book[contains(@doctype,'oh')] and ancestor::ata-page-block/@pb-name[starts-with(., 'clean')]) and not(ancestor::book[contains(@doctype,'oh')] and ancestor::page-block/@pb-name[starts-with(., 'clean')]) and not(ancestor::ata-page-block/@pb-name[starts-with(., 'mainprac')]) and not(ancestor::page-block/@pb-name[starts-with(., 'mainprac')]) and not(ancestor::book[contains(@doctype,'oh')] and ancestor::ata-page-block/@pb-name[starts-with(., 'inspect')]) and not(ancestor::book[contains(@doctype,'oh')] and ancestor::page-block/@pb-name[starts-with(., 'inspect')]) and not(ancestor::ata-page-block/@pb-name[(starts-with(., 'di') and 'di' = translate(., '0123456789', '') and string-length(.) &gt; 2) or starts-with(.,'service')]) and not(ancestor::page-block/@pb-name[(starts-with(., 'di') and 'di' = translate(., '0123456789', '') and string-length(.) &gt; 2) or starts-with(.,'service')]) and not(ancestor::book[contains(@doctype,'oh')] and ancestor::ata-page-block/@pb-name[starts-with(., 'repair')]) and not(ancestor::book[contains(@doctype,'oh')] and ancestor::page-block/@pb-name[starts-with(., 'repair')]) and not(ancestor::book[contains(@doctype,'oh')] and ancestor::ata-page-block/@pb-name[starts-with(., 'test')]) and (ancestor::book[contains(@doctype,'oh')] and ancestor::page-block/@pb-name[starts-with(., 'test')])">
               <xsl:attribute name="_gte:count-as-id">cnt__table^page-block.cnt</xsl:attribute>
            </xsl:when>
            <xsl:when test="not(ancestor::book[contains(@doctype,'cir') or contains(@doctype,'em') or contains(@doctype,'tmm')]) and not(ancestor::book[contains(@doctype,'oh')] and ancestor::ata-page-block/@pb-name[.='service']) and not(ancestor::book[contains(@doctype,'oh')] and ancestor::page-block/@pb-name[.='service']) and not(ancestor::ata-page-block/@pb-name[.='00awl' or .='00intro' or .='airlim' or .='awl' or .='awlror' or .='chapsect' or .='consume' or .='d-and-o' or .='frontmatte' or .='howtouse' or .='00howtouse' or .='intro' or .='nut_option' or .='oplimits' or .='sblist' or .='schedchk' or .='spectool' or .='timelim' or .='title-page']) and not(ancestor::page-block/@pb-name[.='00awl' or .='00intro' or .='airlim' or .='awl' or .='awlror' or .='chapsect' or .='consume' or .='d-and-o' or .='frontmatte' or .='howtouse' or .='00howtouse' or .='intro' or .='nut_option' or .='oplimits' or .='sblist' or .='schedchk' or .='spectool' or .='timelim' or .='title-page']) and not(ancestor::ata-page-block/@pb-name[(starts-with(., 'do') and 'do' = translate(., '0123456789', '') and string-length(.) &gt; 2) or (starts-with(., 'in') and 'in' = translate(., '0123456789', '') and string-length(.) &gt; 2) or (starts-with(., 'tl') and 'tl' = translate(., '0123456789', '') and string-length(.) &gt; 2) or .='toolsht' or .='trlist' or .='unschedc' or .='unschedchk']) and not(ancestor::page-block/@pb-name[(starts-with(., 'do') and 'do' = translate(., '0123456789', '') and string-length(.) &gt; 2) or (starts-with(., 'in') and 'in' = translate(., '0123456789', '') and string-length(.) &gt; 2) or (starts-with(., 'tl') and 'tl' = translate(., '0123456789', '') and string-length(.) &gt; 2) or .='toolsht' or .='trlist' or .='unschedc' or .='unschedchk']) and not(ancestor-or-self::ata-page-block[1]/@pb-name and string(ancestor-or-self::ata-page-block[1]/@pb-name)='intro00') and not(ancestor-or-self::page-block[1]/@pb-name and string(ancestor-or-self::page-block[1]/@pb-name)='intro00') and not(ancestor::ata-page-block/@pb-name[starts-with(., 'disassy') or starts-with(., 'fault')]) and not(ancestor::page-block/@pb-name[starts-with(., 'disassy') or starts-with(., 'fault')]) and not(ancestor::book[contains(@doctype,'oh')] and ancestor::ata-page-block/@pb-name[starts-with(., 'clean')]) and not(ancestor::book[contains(@doctype,'oh')] and ancestor::page-block/@pb-name[starts-with(., 'clean')]) and not(ancestor::ata-page-block/@pb-name[starts-with(., 'mainprac')]) and not(ancestor::page-block/@pb-name[starts-with(., 'mainprac')]) and not(ancestor::book[contains(@doctype,'oh')] and ancestor::ata-page-block/@pb-name[starts-with(., 'inspect')]) and not(ancestor::book[contains(@doctype,'oh')] and ancestor::page-block/@pb-name[starts-with(., 'inspect')]) and not(ancestor::ata-page-block/@pb-name[(starts-with(., 'di') and 'di' = translate(., '0123456789', '') and string-length(.) &gt; 2) or starts-with(.,'service')]) and not(ancestor::page-block/@pb-name[(starts-with(., 'di') and 'di' = translate(., '0123456789', '') and string-length(.) &gt; 2) or starts-with(.,'service')]) and not(ancestor::book[contains(@doctype,'oh')] and ancestor::ata-page-block/@pb-name[starts-with(., 'repair')]) and not(ancestor::book[contains(@doctype,'oh')] and ancestor::page-block/@pb-name[starts-with(., 'repair')]) and (ancestor::book[contains(@doctype,'oh')] and ancestor::ata-page-block/@pb-name[starts-with(., 'test')])">
               <xsl:attribute name="_gte:count-as-id">cnt__table^ata-page-block.cnt</xsl:attribute>
            </xsl:when>
            <xsl:when test="not(ancestor::book[contains(@doctype,'cir') or contains(@doctype,'em') or contains(@doctype,'tmm')]) and not(ancestor::book[contains(@doctype,'oh')] and ancestor::ata-page-block/@pb-name[.='service']) and not(ancestor::book[contains(@doctype,'oh')] and ancestor::page-block/@pb-name[.='service']) and not(ancestor::ata-page-block/@pb-name[.='00awl' or .='00intro' or .='airlim' or .='awl' or .='awlror' or .='chapsect' or .='consume' or .='d-and-o' or .='frontmatte' or .='howtouse' or .='00howtouse' or .='intro' or .='nut_option' or .='oplimits' or .='sblist' or .='schedchk' or .='spectool' or .='timelim' or .='title-page']) and not(ancestor::page-block/@pb-name[.='00awl' or .='00intro' or .='airlim' or .='awl' or .='awlror' or .='chapsect' or .='consume' or .='d-and-o' or .='frontmatte' or .='howtouse' or .='00howtouse' or .='intro' or .='nut_option' or .='oplimits' or .='sblist' or .='schedchk' or .='spectool' or .='timelim' or .='title-page']) and not(ancestor::ata-page-block/@pb-name[(starts-with(., 'do') and 'do' = translate(., '0123456789', '') and string-length(.) &gt; 2) or (starts-with(., 'in') and 'in' = translate(., '0123456789', '') and string-length(.) &gt; 2) or (starts-with(., 'tl') and 'tl' = translate(., '0123456789', '') and string-length(.) &gt; 2) or .='toolsht' or .='trlist' or .='unschedc' or .='unschedchk']) and not(ancestor::page-block/@pb-name[(starts-with(., 'do') and 'do' = translate(., '0123456789', '') and string-length(.) &gt; 2) or (starts-with(., 'in') and 'in' = translate(., '0123456789', '') and string-length(.) &gt; 2) or (starts-with(., 'tl') and 'tl' = translate(., '0123456789', '') and string-length(.) &gt; 2) or .='toolsht' or .='trlist' or .='unschedc' or .='unschedchk']) and not(ancestor-or-self::ata-page-block[1]/@pb-name and string(ancestor-or-self::ata-page-block[1]/@pb-name)='intro00') and not(ancestor-or-self::page-block[1]/@pb-name and string(ancestor-or-self::page-block[1]/@pb-name)='intro00') and not(ancestor::ata-page-block/@pb-name[starts-with(., 'disassy') or starts-with(., 'fault')]) and not(ancestor::page-block/@pb-name[starts-with(., 'disassy') or starts-with(., 'fault')]) and not(ancestor::book[contains(@doctype,'oh')] and ancestor::ata-page-block/@pb-name[starts-with(., 'clean')]) and not(ancestor::book[contains(@doctype,'oh')] and ancestor::page-block/@pb-name[starts-with(., 'clean')]) and not(ancestor::ata-page-block/@pb-name[starts-with(., 'mainprac')]) and not(ancestor::page-block/@pb-name[starts-with(., 'mainprac')]) and not(ancestor::book[contains(@doctype,'oh')] and ancestor::ata-page-block/@pb-name[starts-with(., 'inspect')]) and not(ancestor::book[contains(@doctype,'oh')] and ancestor::page-block/@pb-name[starts-with(., 'inspect')]) and not(ancestor::ata-page-block/@pb-name[(starts-with(., 'di') and 'di' = translate(., '0123456789', '') and string-length(.) &gt; 2) or starts-with(.,'service')]) and not(ancestor::page-block/@pb-name[(starts-with(., 'di') and 'di' = translate(., '0123456789', '') and string-length(.) &gt; 2) or starts-with(.,'service')]) and not(ancestor::book[contains(@doctype,'oh')] and ancestor::ata-page-block/@pb-name[starts-with(., 'repair')]) and (ancestor::book[contains(@doctype,'oh')] and ancestor::page-block/@pb-name[starts-with(., 'repair')])">
               <xsl:attribute name="_gte:count-as-id">cnt__table^page-block.cnt</xsl:attribute>
            </xsl:when>
            <xsl:when test="not(ancestor::book[contains(@doctype,'cir') or contains(@doctype,'em') or contains(@doctype,'tmm')]) and not(ancestor::book[contains(@doctype,'oh')] and ancestor::ata-page-block/@pb-name[.='service']) and not(ancestor::book[contains(@doctype,'oh')] and ancestor::page-block/@pb-name[.='service']) and not(ancestor::ata-page-block/@pb-name[.='00awl' or .='00intro' or .='airlim' or .='awl' or .='awlror' or .='chapsect' or .='consume' or .='d-and-o' or .='frontmatte' or .='howtouse' or .='00howtouse' or .='intro' or .='nut_option' or .='oplimits' or .='sblist' or .='schedchk' or .='spectool' or .='timelim' or .='title-page']) and not(ancestor::page-block/@pb-name[.='00awl' or .='00intro' or .='airlim' or .='awl' or .='awlror' or .='chapsect' or .='consume' or .='d-and-o' or .='frontmatte' or .='howtouse' or .='00howtouse' or .='intro' or .='nut_option' or .='oplimits' or .='sblist' or .='schedchk' or .='spectool' or .='timelim' or .='title-page']) and not(ancestor::ata-page-block/@pb-name[(starts-with(., 'do') and 'do' = translate(., '0123456789', '') and string-length(.) &gt; 2) or (starts-with(., 'in') and 'in' = translate(., '0123456789', '') and string-length(.) &gt; 2) or (starts-with(., 'tl') and 'tl' = translate(., '0123456789', '') and string-length(.) &gt; 2) or .='toolsht' or .='trlist' or .='unschedc' or .='unschedchk']) and not(ancestor::page-block/@pb-name[(starts-with(., 'do') and 'do' = translate(., '0123456789', '') and string-length(.) &gt; 2) or (starts-with(., 'in') and 'in' = translate(., '0123456789', '') and string-length(.) &gt; 2) or (starts-with(., 'tl') and 'tl' = translate(., '0123456789', '') and string-length(.) &gt; 2) or .='toolsht' or .='trlist' or .='unschedc' or .='unschedchk']) and not(ancestor-or-self::ata-page-block[1]/@pb-name and string(ancestor-or-self::ata-page-block[1]/@pb-name)='intro00') and not(ancestor-or-self::page-block[1]/@pb-name and string(ancestor-or-self::page-block[1]/@pb-name)='intro00') and not(ancestor::ata-page-block/@pb-name[starts-with(., 'disassy') or starts-with(., 'fault')]) and not(ancestor::page-block/@pb-name[starts-with(., 'disassy') or starts-with(., 'fault')]) and not(ancestor::book[contains(@doctype,'oh')] and ancestor::ata-page-block/@pb-name[starts-with(., 'clean')]) and not(ancestor::book[contains(@doctype,'oh')] and ancestor::page-block/@pb-name[starts-with(., 'clean')]) and not(ancestor::ata-page-block/@pb-name[starts-with(., 'mainprac')]) and not(ancestor::page-block/@pb-name[starts-with(., 'mainprac')]) and not(ancestor::book[contains(@doctype,'oh')] and ancestor::ata-page-block/@pb-name[starts-with(., 'inspect')]) and not(ancestor::book[contains(@doctype,'oh')] and ancestor::page-block/@pb-name[starts-with(., 'inspect')]) and not(ancestor::ata-page-block/@pb-name[(starts-with(., 'di') and 'di' = translate(., '0123456789', '') and string-length(.) &gt; 2) or starts-with(.,'service')]) and not(ancestor::page-block/@pb-name[(starts-with(., 'di') and 'di' = translate(., '0123456789', '') and string-length(.) &gt; 2) or starts-with(.,'service')]) and (ancestor::book[contains(@doctype,'oh')] and ancestor::ata-page-block/@pb-name[starts-with(., 'repair')])">
               <xsl:attribute name="_gte:count-as-id">cnt__table^ata-page-block.cnt</xsl:attribute>
            </xsl:when>
            <xsl:when test="not(ancestor::book[contains(@doctype,'cir') or contains(@doctype,'em') or contains(@doctype,'tmm')]) and not(ancestor::book[contains(@doctype,'oh')] and ancestor::ata-page-block/@pb-name[.='service']) and not(ancestor::book[contains(@doctype,'oh')] and ancestor::page-block/@pb-name[.='service']) and not(ancestor::ata-page-block/@pb-name[.='00awl' or .='00intro' or .='airlim' or .='awl' or .='awlror' or .='chapsect' or .='consume' or .='d-and-o' or .='frontmatte' or .='howtouse' or .='00howtouse' or .='intro' or .='nut_option' or .='oplimits' or .='sblist' or .='schedchk' or .='spectool' or .='timelim' or .='title-page']) and not(ancestor::page-block/@pb-name[.='00awl' or .='00intro' or .='airlim' or .='awl' or .='awlror' or .='chapsect' or .='consume' or .='d-and-o' or .='frontmatte' or .='howtouse' or .='00howtouse' or .='intro' or .='nut_option' or .='oplimits' or .='sblist' or .='schedchk' or .='spectool' or .='timelim' or .='title-page']) and not(ancestor::ata-page-block/@pb-name[(starts-with(., 'do') and 'do' = translate(., '0123456789', '') and string-length(.) &gt; 2) or (starts-with(., 'in') and 'in' = translate(., '0123456789', '') and string-length(.) &gt; 2) or (starts-with(., 'tl') and 'tl' = translate(., '0123456789', '') and string-length(.) &gt; 2) or .='toolsht' or .='trlist' or .='unschedc' or .='unschedchk']) and not(ancestor::page-block/@pb-name[(starts-with(., 'do') and 'do' = translate(., '0123456789', '') and string-length(.) &gt; 2) or (starts-with(., 'in') and 'in' = translate(., '0123456789', '') and string-length(.) &gt; 2) or (starts-with(., 'tl') and 'tl' = translate(., '0123456789', '') and string-length(.) &gt; 2) or .='toolsht' or .='trlist' or .='unschedc' or .='unschedchk']) and not(ancestor-or-self::ata-page-block[1]/@pb-name and string(ancestor-or-self::ata-page-block[1]/@pb-name)='intro00') and not(ancestor-or-self::page-block[1]/@pb-name and string(ancestor-or-self::page-block[1]/@pb-name)='intro00') and not(ancestor::ata-page-block/@pb-name[starts-with(., 'disassy') or starts-with(., 'fault')]) and not(ancestor::page-block/@pb-name[starts-with(., 'disassy') or starts-with(., 'fault')]) and not(ancestor::book[contains(@doctype,'oh')] and ancestor::ata-page-block/@pb-name[starts-with(., 'clean')]) and not(ancestor::book[contains(@doctype,'oh')] and ancestor::page-block/@pb-name[starts-with(., 'clean')]) and not(ancestor::ata-page-block/@pb-name[starts-with(., 'mainprac')]) and not(ancestor::page-block/@pb-name[starts-with(., 'mainprac')]) and not(ancestor::book[contains(@doctype,'oh')] and ancestor::ata-page-block/@pb-name[starts-with(., 'inspect')]) and not(ancestor::book[contains(@doctype,'oh')] and ancestor::page-block/@pb-name[starts-with(., 'inspect')]) and not(ancestor::ata-page-block/@pb-name[(starts-with(., 'di') and 'di' = translate(., '0123456789', '') and string-length(.) &gt; 2) or starts-with(.,'service')]) and (ancestor::page-block/@pb-name[(starts-with(., 'di') and 'di' = translate(., '0123456789', '') and string-length(.) &gt; 2) or starts-with(.,'service')])">
               <xsl:attribute name="_gte:count-as-id">cnt__table^page-block.cnt</xsl:attribute>
            </xsl:when>
            <xsl:when test="not(ancestor::book[contains(@doctype,'cir') or contains(@doctype,'em') or contains(@doctype,'tmm')]) and not(ancestor::book[contains(@doctype,'oh')] and ancestor::ata-page-block/@pb-name[.='service']) and not(ancestor::book[contains(@doctype,'oh')] and ancestor::page-block/@pb-name[.='service']) and not(ancestor::ata-page-block/@pb-name[.='00awl' or .='00intro' or .='airlim' or .='awl' or .='awlror' or .='chapsect' or .='consume' or .='d-and-o' or .='frontmatte' or .='howtouse' or .='00howtouse' or .='intro' or .='nut_option' or .='oplimits' or .='sblist' or .='schedchk' or .='spectool' or .='timelim' or .='title-page']) and not(ancestor::page-block/@pb-name[.='00awl' or .='00intro' or .='airlim' or .='awl' or .='awlror' or .='chapsect' or .='consume' or .='d-and-o' or .='frontmatte' or .='howtouse' or .='00howtouse' or .='intro' or .='nut_option' or .='oplimits' or .='sblist' or .='schedchk' or .='spectool' or .='timelim' or .='title-page']) and not(ancestor::ata-page-block/@pb-name[(starts-with(., 'do') and 'do' = translate(., '0123456789', '') and string-length(.) &gt; 2) or (starts-with(., 'in') and 'in' = translate(., '0123456789', '') and string-length(.) &gt; 2) or (starts-with(., 'tl') and 'tl' = translate(., '0123456789', '') and string-length(.) &gt; 2) or .='toolsht' or .='trlist' or .='unschedc' or .='unschedchk']) and not(ancestor::page-block/@pb-name[(starts-with(., 'do') and 'do' = translate(., '0123456789', '') and string-length(.) &gt; 2) or (starts-with(., 'in') and 'in' = translate(., '0123456789', '') and string-length(.) &gt; 2) or (starts-with(., 'tl') and 'tl' = translate(., '0123456789', '') and string-length(.) &gt; 2) or .='toolsht' or .='trlist' or .='unschedc' or .='unschedchk']) and not(ancestor-or-self::ata-page-block[1]/@pb-name and string(ancestor-or-self::ata-page-block[1]/@pb-name)='intro00') and not(ancestor-or-self::page-block[1]/@pb-name and string(ancestor-or-self::page-block[1]/@pb-name)='intro00') and not(ancestor::ata-page-block/@pb-name[starts-with(., 'disassy') or starts-with(., 'fault')]) and not(ancestor::page-block/@pb-name[starts-with(., 'disassy') or starts-with(., 'fault')]) and not(ancestor::book[contains(@doctype,'oh')] and ancestor::ata-page-block/@pb-name[starts-with(., 'clean')]) and not(ancestor::book[contains(@doctype,'oh')] and ancestor::page-block/@pb-name[starts-with(., 'clean')]) and not(ancestor::ata-page-block/@pb-name[starts-with(., 'mainprac')]) and not(ancestor::page-block/@pb-name[starts-with(., 'mainprac')]) and not(ancestor::book[contains(@doctype,'oh')] and ancestor::ata-page-block/@pb-name[starts-with(., 'inspect')]) and not(ancestor::book[contains(@doctype,'oh')] and ancestor::page-block/@pb-name[starts-with(., 'inspect')]) and (ancestor::ata-page-block/@pb-name[(starts-with(., 'di') and 'di' = translate(., '0123456789', '') and string-length(.) &gt; 2) or starts-with(.,'service')])">
               <xsl:attribute name="_gte:count-as-id">cnt__table^ata-page-block.cnt</xsl:attribute>
            </xsl:when>
            <xsl:when test="not(ancestor::book[contains(@doctype,'cir') or contains(@doctype,'em') or contains(@doctype,'tmm')]) and not(ancestor::book[contains(@doctype,'oh')] and ancestor::ata-page-block/@pb-name[.='service']) and not(ancestor::book[contains(@doctype,'oh')] and ancestor::page-block/@pb-name[.='service']) and not(ancestor::ata-page-block/@pb-name[.='00awl' or .='00intro' or .='airlim' or .='awl' or .='awlror' or .='chapsect' or .='consume' or .='d-and-o' or .='frontmatte' or .='howtouse' or .='00howtouse' or .='intro' or .='nut_option' or .='oplimits' or .='sblist' or .='schedchk' or .='spectool' or .='timelim' or .='title-page']) and not(ancestor::page-block/@pb-name[.='00awl' or .='00intro' or .='airlim' or .='awl' or .='awlror' or .='chapsect' or .='consume' or .='d-and-o' or .='frontmatte' or .='howtouse' or .='00howtouse' or .='intro' or .='nut_option' or .='oplimits' or .='sblist' or .='schedchk' or .='spectool' or .='timelim' or .='title-page']) and not(ancestor::ata-page-block/@pb-name[(starts-with(., 'do') and 'do' = translate(., '0123456789', '') and string-length(.) &gt; 2) or (starts-with(., 'in') and 'in' = translate(., '0123456789', '') and string-length(.) &gt; 2) or (starts-with(., 'tl') and 'tl' = translate(., '0123456789', '') and string-length(.) &gt; 2) or .='toolsht' or .='trlist' or .='unschedc' or .='unschedchk']) and not(ancestor::page-block/@pb-name[(starts-with(., 'do') and 'do' = translate(., '0123456789', '') and string-length(.) &gt; 2) or (starts-with(., 'in') and 'in' = translate(., '0123456789', '') and string-length(.) &gt; 2) or (starts-with(., 'tl') and 'tl' = translate(., '0123456789', '') and string-length(.) &gt; 2) or .='toolsht' or .='trlist' or .='unschedc' or .='unschedchk']) and not(ancestor-or-self::ata-page-block[1]/@pb-name and string(ancestor-or-self::ata-page-block[1]/@pb-name)='intro00') and not(ancestor-or-self::page-block[1]/@pb-name and string(ancestor-or-self::page-block[1]/@pb-name)='intro00') and not(ancestor::ata-page-block/@pb-name[starts-with(., 'disassy') or starts-with(., 'fault')]) and not(ancestor::page-block/@pb-name[starts-with(., 'disassy') or starts-with(., 'fault')]) and not(ancestor::book[contains(@doctype,'oh')] and ancestor::ata-page-block/@pb-name[starts-with(., 'clean')]) and not(ancestor::book[contains(@doctype,'oh')] and ancestor::page-block/@pb-name[starts-with(., 'clean')]) and not(ancestor::ata-page-block/@pb-name[starts-with(., 'mainprac')]) and not(ancestor::page-block/@pb-name[starts-with(., 'mainprac')]) and not(ancestor::book[contains(@doctype,'oh')] and ancestor::ata-page-block/@pb-name[starts-with(., 'inspect')]) and (ancestor::book[contains(@doctype,'oh')] and ancestor::page-block/@pb-name[starts-with(., 'inspect')])">
               <xsl:attribute name="_gte:count-as-id">cnt__table^page-block.cnt</xsl:attribute>
            </xsl:when>
            <xsl:when test="not(ancestor::book[contains(@doctype,'cir') or contains(@doctype,'em') or contains(@doctype,'tmm')]) and not(ancestor::book[contains(@doctype,'oh')] and ancestor::ata-page-block/@pb-name[.='service']) and not(ancestor::book[contains(@doctype,'oh')] and ancestor::page-block/@pb-name[.='service']) and not(ancestor::ata-page-block/@pb-name[.='00awl' or .='00intro' or .='airlim' or .='awl' or .='awlror' or .='chapsect' or .='consume' or .='d-and-o' or .='frontmatte' or .='howtouse' or .='00howtouse' or .='intro' or .='nut_option' or .='oplimits' or .='sblist' or .='schedchk' or .='spectool' or .='timelim' or .='title-page']) and not(ancestor::page-block/@pb-name[.='00awl' or .='00intro' or .='airlim' or .='awl' or .='awlror' or .='chapsect' or .='consume' or .='d-and-o' or .='frontmatte' or .='howtouse' or .='00howtouse' or .='intro' or .='nut_option' or .='oplimits' or .='sblist' or .='schedchk' or .='spectool' or .='timelim' or .='title-page']) and not(ancestor::ata-page-block/@pb-name[(starts-with(., 'do') and 'do' = translate(., '0123456789', '') and string-length(.) &gt; 2) or (starts-with(., 'in') and 'in' = translate(., '0123456789', '') and string-length(.) &gt; 2) or (starts-with(., 'tl') and 'tl' = translate(., '0123456789', '') and string-length(.) &gt; 2) or .='toolsht' or .='trlist' or .='unschedc' or .='unschedchk']) and not(ancestor::page-block/@pb-name[(starts-with(., 'do') and 'do' = translate(., '0123456789', '') and string-length(.) &gt; 2) or (starts-with(., 'in') and 'in' = translate(., '0123456789', '') and string-length(.) &gt; 2) or (starts-with(., 'tl') and 'tl' = translate(., '0123456789', '') and string-length(.) &gt; 2) or .='toolsht' or .='trlist' or .='unschedc' or .='unschedchk']) and not(ancestor-or-self::ata-page-block[1]/@pb-name and string(ancestor-or-self::ata-page-block[1]/@pb-name)='intro00') and not(ancestor-or-self::page-block[1]/@pb-name and string(ancestor-or-self::page-block[1]/@pb-name)='intro00') and not(ancestor::ata-page-block/@pb-name[starts-with(., 'disassy') or starts-with(., 'fault')]) and not(ancestor::page-block/@pb-name[starts-with(., 'disassy') or starts-with(., 'fault')]) and not(ancestor::book[contains(@doctype,'oh')] and ancestor::ata-page-block/@pb-name[starts-with(., 'clean')]) and not(ancestor::book[contains(@doctype,'oh')] and ancestor::page-block/@pb-name[starts-with(., 'clean')]) and not(ancestor::ata-page-block/@pb-name[starts-with(., 'mainprac')]) and not(ancestor::page-block/@pb-name[starts-with(., 'mainprac')]) and (ancestor::book[contains(@doctype,'oh')] and ancestor::ata-page-block/@pb-name[starts-with(., 'inspect')])">
               <xsl:attribute name="_gte:count-as-id">cnt__table^ata-page-block.cnt</xsl:attribute>
            </xsl:when>
            <xsl:when test="not(ancestor::book[contains(@doctype,'cir') or contains(@doctype,'em') or contains(@doctype,'tmm')]) and not(ancestor::book[contains(@doctype,'oh')] and ancestor::ata-page-block/@pb-name[.='service']) and not(ancestor::book[contains(@doctype,'oh')] and ancestor::page-block/@pb-name[.='service']) and not(ancestor::ata-page-block/@pb-name[.='00awl' or .='00intro' or .='airlim' or .='awl' or .='awlror' or .='chapsect' or .='consume' or .='d-and-o' or .='frontmatte' or .='howtouse' or .='00howtouse' or .='intro' or .='nut_option' or .='oplimits' or .='sblist' or .='schedchk' or .='spectool' or .='timelim' or .='title-page']) and not(ancestor::page-block/@pb-name[.='00awl' or .='00intro' or .='airlim' or .='awl' or .='awlror' or .='chapsect' or .='consume' or .='d-and-o' or .='frontmatte' or .='howtouse' or .='00howtouse' or .='intro' or .='nut_option' or .='oplimits' or .='sblist' or .='schedchk' or .='spectool' or .='timelim' or .='title-page']) and not(ancestor::ata-page-block/@pb-name[(starts-with(., 'do') and 'do' = translate(., '0123456789', '') and string-length(.) &gt; 2) or (starts-with(., 'in') and 'in' = translate(., '0123456789', '') and string-length(.) &gt; 2) or (starts-with(., 'tl') and 'tl' = translate(., '0123456789', '') and string-length(.) &gt; 2) or .='toolsht' or .='trlist' or .='unschedc' or .='unschedchk']) and not(ancestor::page-block/@pb-name[(starts-with(., 'do') and 'do' = translate(., '0123456789', '') and string-length(.) &gt; 2) or (starts-with(., 'in') and 'in' = translate(., '0123456789', '') and string-length(.) &gt; 2) or (starts-with(., 'tl') and 'tl' = translate(., '0123456789', '') and string-length(.) &gt; 2) or .='toolsht' or .='trlist' or .='unschedc' or .='unschedchk']) and not(ancestor-or-self::ata-page-block[1]/@pb-name and string(ancestor-or-self::ata-page-block[1]/@pb-name)='intro00') and not(ancestor-or-self::page-block[1]/@pb-name and string(ancestor-or-self::page-block[1]/@pb-name)='intro00') and not(ancestor::ata-page-block/@pb-name[starts-with(., 'disassy') or starts-with(., 'fault')]) and not(ancestor::page-block/@pb-name[starts-with(., 'disassy') or starts-with(., 'fault')]) and not(ancestor::book[contains(@doctype,'oh')] and ancestor::ata-page-block/@pb-name[starts-with(., 'clean')]) and not(ancestor::book[contains(@doctype,'oh')] and ancestor::page-block/@pb-name[starts-with(., 'clean')]) and not(ancestor::ata-page-block/@pb-name[starts-with(., 'mainprac')]) and (ancestor::page-block/@pb-name[starts-with(., 'mainprac')])">
               <xsl:attribute name="_gte:count-as-id">cnt__table^page-block.cnt</xsl:attribute>
            </xsl:when>
            <xsl:when test="not(ancestor::book[contains(@doctype,'cir') or contains(@doctype,'em') or contains(@doctype,'tmm')]) and not(ancestor::book[contains(@doctype,'oh')] and ancestor::ata-page-block/@pb-name[.='service']) and not(ancestor::book[contains(@doctype,'oh')] and ancestor::page-block/@pb-name[.='service']) and not(ancestor::ata-page-block/@pb-name[.='00awl' or .='00intro' or .='airlim' or .='awl' or .='awlror' or .='chapsect' or .='consume' or .='d-and-o' or .='frontmatte' or .='howtouse' or .='00howtouse' or .='intro' or .='nut_option' or .='oplimits' or .='sblist' or .='schedchk' or .='spectool' or .='timelim' or .='title-page']) and not(ancestor::page-block/@pb-name[.='00awl' or .='00intro' or .='airlim' or .='awl' or .='awlror' or .='chapsect' or .='consume' or .='d-and-o' or .='frontmatte' or .='howtouse' or .='00howtouse' or .='intro' or .='nut_option' or .='oplimits' or .='sblist' or .='schedchk' or .='spectool' or .='timelim' or .='title-page']) and not(ancestor::ata-page-block/@pb-name[(starts-with(., 'do') and 'do' = translate(., '0123456789', '') and string-length(.) &gt; 2) or (starts-with(., 'in') and 'in' = translate(., '0123456789', '') and string-length(.) &gt; 2) or (starts-with(., 'tl') and 'tl' = translate(., '0123456789', '') and string-length(.) &gt; 2) or .='toolsht' or .='trlist' or .='unschedc' or .='unschedchk']) and not(ancestor::page-block/@pb-name[(starts-with(., 'do') and 'do' = translate(., '0123456789', '') and string-length(.) &gt; 2) or (starts-with(., 'in') and 'in' = translate(., '0123456789', '') and string-length(.) &gt; 2) or (starts-with(., 'tl') and 'tl' = translate(., '0123456789', '') and string-length(.) &gt; 2) or .='toolsht' or .='trlist' or .='unschedc' or .='unschedchk']) and not(ancestor-or-self::ata-page-block[1]/@pb-name and string(ancestor-or-self::ata-page-block[1]/@pb-name)='intro00') and not(ancestor-or-self::page-block[1]/@pb-name and string(ancestor-or-self::page-block[1]/@pb-name)='intro00') and not(ancestor::ata-page-block/@pb-name[starts-with(., 'disassy') or starts-with(., 'fault')]) and not(ancestor::page-block/@pb-name[starts-with(., 'disassy') or starts-with(., 'fault')]) and not(ancestor::book[contains(@doctype,'oh')] and ancestor::ata-page-block/@pb-name[starts-with(., 'clean')]) and not(ancestor::book[contains(@doctype,'oh')] and ancestor::page-block/@pb-name[starts-with(., 'clean')]) and (ancestor::ata-page-block/@pb-name[starts-with(., 'mainprac')])">
               <xsl:attribute name="_gte:count-as-id">cnt__table^ata-page-block.cnt</xsl:attribute>
            </xsl:when>
            <xsl:when test="not(ancestor::book[contains(@doctype,'cir') or contains(@doctype,'em') or contains(@doctype,'tmm')]) and not(ancestor::book[contains(@doctype,'oh')] and ancestor::ata-page-block/@pb-name[.='service']) and not(ancestor::book[contains(@doctype,'oh')] and ancestor::page-block/@pb-name[.='service']) and not(ancestor::ata-page-block/@pb-name[.='00awl' or .='00intro' or .='airlim' or .='awl' or .='awlror' or .='chapsect' or .='consume' or .='d-and-o' or .='frontmatte' or .='howtouse' or .='00howtouse' or .='intro' or .='nut_option' or .='oplimits' or .='sblist' or .='schedchk' or .='spectool' or .='timelim' or .='title-page']) and not(ancestor::page-block/@pb-name[.='00awl' or .='00intro' or .='airlim' or .='awl' or .='awlror' or .='chapsect' or .='consume' or .='d-and-o' or .='frontmatte' or .='howtouse' or .='00howtouse' or .='intro' or .='nut_option' or .='oplimits' or .='sblist' or .='schedchk' or .='spectool' or .='timelim' or .='title-page']) and not(ancestor::ata-page-block/@pb-name[(starts-with(., 'do') and 'do' = translate(., '0123456789', '') and string-length(.) &gt; 2) or (starts-with(., 'in') and 'in' = translate(., '0123456789', '') and string-length(.) &gt; 2) or (starts-with(., 'tl') and 'tl' = translate(., '0123456789', '') and string-length(.) &gt; 2) or .='toolsht' or .='trlist' or .='unschedc' or .='unschedchk']) and not(ancestor::page-block/@pb-name[(starts-with(., 'do') and 'do' = translate(., '0123456789', '') and string-length(.) &gt; 2) or (starts-with(., 'in') and 'in' = translate(., '0123456789', '') and string-length(.) &gt; 2) or (starts-with(., 'tl') and 'tl' = translate(., '0123456789', '') and string-length(.) &gt; 2) or .='toolsht' or .='trlist' or .='unschedc' or .='unschedchk']) and not(ancestor-or-self::ata-page-block[1]/@pb-name and string(ancestor-or-self::ata-page-block[1]/@pb-name)='intro00') and not(ancestor-or-self::page-block[1]/@pb-name and string(ancestor-or-self::page-block[1]/@pb-name)='intro00') and not(ancestor::ata-page-block/@pb-name[starts-with(., 'disassy') or starts-with(., 'fault')]) and not(ancestor::page-block/@pb-name[starts-with(., 'disassy') or starts-with(., 'fault')]) and not(ancestor::book[contains(@doctype,'oh')] and ancestor::ata-page-block/@pb-name[starts-with(., 'clean')]) and (ancestor::book[contains(@doctype,'oh')] and ancestor::page-block/@pb-name[starts-with(., 'clean')])">
               <xsl:attribute name="_gte:count-as-id">cnt__table^page-block.cnt</xsl:attribute>
            </xsl:when>
            <xsl:when test="not(ancestor::book[contains(@doctype,'cir') or contains(@doctype,'em') or contains(@doctype,'tmm')]) and not(ancestor::book[contains(@doctype,'oh')] and ancestor::ata-page-block/@pb-name[.='service']) and not(ancestor::book[contains(@doctype,'oh')] and ancestor::page-block/@pb-name[.='service']) and not(ancestor::ata-page-block/@pb-name[.='00awl' or .='00intro' or .='airlim' or .='awl' or .='awlror' or .='chapsect' or .='consume' or .='d-and-o' or .='frontmatte' or .='howtouse' or .='00howtouse' or .='intro' or .='nut_option' or .='oplimits' or .='sblist' or .='schedchk' or .='spectool' or .='timelim' or .='title-page']) and not(ancestor::page-block/@pb-name[.='00awl' or .='00intro' or .='airlim' or .='awl' or .='awlror' or .='chapsect' or .='consume' or .='d-and-o' or .='frontmatte' or .='howtouse' or .='00howtouse' or .='intro' or .='nut_option' or .='oplimits' or .='sblist' or .='schedchk' or .='spectool' or .='timelim' or .='title-page']) and not(ancestor::ata-page-block/@pb-name[(starts-with(., 'do') and 'do' = translate(., '0123456789', '') and string-length(.) &gt; 2) or (starts-with(., 'in') and 'in' = translate(., '0123456789', '') and string-length(.) &gt; 2) or (starts-with(., 'tl') and 'tl' = translate(., '0123456789', '') and string-length(.) &gt; 2) or .='toolsht' or .='trlist' or .='unschedc' or .='unschedchk']) and not(ancestor::page-block/@pb-name[(starts-with(., 'do') and 'do' = translate(., '0123456789', '') and string-length(.) &gt; 2) or (starts-with(., 'in') and 'in' = translate(., '0123456789', '') and string-length(.) &gt; 2) or (starts-with(., 'tl') and 'tl' = translate(., '0123456789', '') and string-length(.) &gt; 2) or .='toolsht' or .='trlist' or .='unschedc' or .='unschedchk']) and not(ancestor-or-self::ata-page-block[1]/@pb-name and string(ancestor-or-self::ata-page-block[1]/@pb-name)='intro00') and not(ancestor-or-self::page-block[1]/@pb-name and string(ancestor-or-self::page-block[1]/@pb-name)='intro00') and not(ancestor::ata-page-block/@pb-name[starts-with(., 'disassy') or starts-with(., 'fault')]) and not(ancestor::page-block/@pb-name[starts-with(., 'disassy') or starts-with(., 'fault')]) and (ancestor::book[contains(@doctype,'oh')] and ancestor::ata-page-block/@pb-name[starts-with(., 'clean')])">
               <xsl:attribute name="_gte:count-as-id">cnt__table^ata-page-block.cnt</xsl:attribute>
            </xsl:when>
            <xsl:when test="not(ancestor::book[contains(@doctype,'cir') or contains(@doctype,'em') or contains(@doctype,'tmm')]) and not(ancestor::book[contains(@doctype,'oh')] and ancestor::ata-page-block/@pb-name[.='service']) and not(ancestor::book[contains(@doctype,'oh')] and ancestor::page-block/@pb-name[.='service']) and not(ancestor::ata-page-block/@pb-name[.='00awl' or .='00intro' or .='airlim' or .='awl' or .='awlror' or .='chapsect' or .='consume' or .='d-and-o' or .='frontmatte' or .='howtouse' or .='00howtouse' or .='intro' or .='nut_option' or .='oplimits' or .='sblist' or .='schedchk' or .='spectool' or .='timelim' or .='title-page']) and not(ancestor::page-block/@pb-name[.='00awl' or .='00intro' or .='airlim' or .='awl' or .='awlror' or .='chapsect' or .='consume' or .='d-and-o' or .='frontmatte' or .='howtouse' or .='00howtouse' or .='intro' or .='nut_option' or .='oplimits' or .='sblist' or .='schedchk' or .='spectool' or .='timelim' or .='title-page']) and not(ancestor::ata-page-block/@pb-name[(starts-with(., 'do') and 'do' = translate(., '0123456789', '') and string-length(.) &gt; 2) or (starts-with(., 'in') and 'in' = translate(., '0123456789', '') and string-length(.) &gt; 2) or (starts-with(., 'tl') and 'tl' = translate(., '0123456789', '') and string-length(.) &gt; 2) or .='toolsht' or .='trlist' or .='unschedc' or .='unschedchk']) and not(ancestor::page-block/@pb-name[(starts-with(., 'do') and 'do' = translate(., '0123456789', '') and string-length(.) &gt; 2) or (starts-with(., 'in') and 'in' = translate(., '0123456789', '') and string-length(.) &gt; 2) or (starts-with(., 'tl') and 'tl' = translate(., '0123456789', '') and string-length(.) &gt; 2) or .='toolsht' or .='trlist' or .='unschedc' or .='unschedchk']) and not(ancestor-or-self::ata-page-block[1]/@pb-name and string(ancestor-or-self::ata-page-block[1]/@pb-name)='intro00') and not(ancestor-or-self::page-block[1]/@pb-name and string(ancestor-or-self::page-block[1]/@pb-name)='intro00') and not(ancestor::ata-page-block/@pb-name[starts-with(., 'disassy') or starts-with(., 'fault')]) and (ancestor::page-block/@pb-name[starts-with(., 'disassy') or starts-with(., 'fault')])">
               <xsl:attribute name="_gte:count-as-id">cnt__table^page-block.cnt</xsl:attribute>
            </xsl:when>
            <xsl:when test="not(ancestor::book[contains(@doctype,'cir') or contains(@doctype,'em') or contains(@doctype,'tmm')]) and not(ancestor::book[contains(@doctype,'oh')] and ancestor::ata-page-block/@pb-name[.='service']) and not(ancestor::book[contains(@doctype,'oh')] and ancestor::page-block/@pb-name[.='service']) and not(ancestor::ata-page-block/@pb-name[.='00awl' or .='00intro' or .='airlim' or .='awl' or .='awlror' or .='chapsect' or .='consume' or .='d-and-o' or .='frontmatte' or .='howtouse' or .='00howtouse' or .='intro' or .='nut_option' or .='oplimits' or .='sblist' or .='schedchk' or .='spectool' or .='timelim' or .='title-page']) and not(ancestor::page-block/@pb-name[.='00awl' or .='00intro' or .='airlim' or .='awl' or .='awlror' or .='chapsect' or .='consume' or .='d-and-o' or .='frontmatte' or .='howtouse' or .='00howtouse' or .='intro' or .='nut_option' or .='oplimits' or .='sblist' or .='schedchk' or .='spectool' or .='timelim' or .='title-page']) and not(ancestor::ata-page-block/@pb-name[(starts-with(., 'do') and 'do' = translate(., '0123456789', '') and string-length(.) &gt; 2) or (starts-with(., 'in') and 'in' = translate(., '0123456789', '') and string-length(.) &gt; 2) or (starts-with(., 'tl') and 'tl' = translate(., '0123456789', '') and string-length(.) &gt; 2) or .='toolsht' or .='trlist' or .='unschedc' or .='unschedchk']) and not(ancestor::page-block/@pb-name[(starts-with(., 'do') and 'do' = translate(., '0123456789', '') and string-length(.) &gt; 2) or (starts-with(., 'in') and 'in' = translate(., '0123456789', '') and string-length(.) &gt; 2) or (starts-with(., 'tl') and 'tl' = translate(., '0123456789', '') and string-length(.) &gt; 2) or .='toolsht' or .='trlist' or .='unschedc' or .='unschedchk']) and not(ancestor-or-self::ata-page-block[1]/@pb-name and string(ancestor-or-self::ata-page-block[1]/@pb-name)='intro00') and not(ancestor-or-self::page-block[1]/@pb-name and string(ancestor-or-self::page-block[1]/@pb-name)='intro00') and (ancestor::ata-page-block/@pb-name[starts-with(., 'disassy') or starts-with(., 'fault')])">
               <xsl:attribute name="_gte:count-as-id">cnt__table^ata-page-block.cnt</xsl:attribute>
            </xsl:when>
            <xsl:when test="not(ancestor::book[contains(@doctype,'cir') or contains(@doctype,'em') or contains(@doctype,'tmm')]) and not(ancestor::book[contains(@doctype,'oh')] and ancestor::ata-page-block/@pb-name[.='service']) and not(ancestor::book[contains(@doctype,'oh')] and ancestor::page-block/@pb-name[.='service']) and not(ancestor::ata-page-block/@pb-name[.='00awl' or .='00intro' or .='airlim' or .='awl' or .='awlror' or .='chapsect' or .='consume' or .='d-and-o' or .='frontmatte' or .='howtouse' or .='00howtouse' or .='intro' or .='nut_option' or .='oplimits' or .='sblist' or .='schedchk' or .='spectool' or .='timelim' or .='title-page']) and not(ancestor::page-block/@pb-name[.='00awl' or .='00intro' or .='airlim' or .='awl' or .='awlror' or .='chapsect' or .='consume' or .='d-and-o' or .='frontmatte' or .='howtouse' or .='00howtouse' or .='intro' or .='nut_option' or .='oplimits' or .='sblist' or .='schedchk' or .='spectool' or .='timelim' or .='title-page']) and not(ancestor::ata-page-block/@pb-name[(starts-with(., 'do') and 'do' = translate(., '0123456789', '') and string-length(.) &gt; 2) or (starts-with(., 'in') and 'in' = translate(., '0123456789', '') and string-length(.) &gt; 2) or (starts-with(., 'tl') and 'tl' = translate(., '0123456789', '') and string-length(.) &gt; 2) or .='toolsht' or .='trlist' or .='unschedc' or .='unschedchk']) and not(ancestor::page-block/@pb-name[(starts-with(., 'do') and 'do' = translate(., '0123456789', '') and string-length(.) &gt; 2) or (starts-with(., 'in') and 'in' = translate(., '0123456789', '') and string-length(.) &gt; 2) or (starts-with(., 'tl') and 'tl' = translate(., '0123456789', '') and string-length(.) &gt; 2) or .='toolsht' or .='trlist' or .='unschedc' or .='unschedchk']) and not(ancestor-or-self::ata-page-block[1]/@pb-name and string(ancestor-or-self::ata-page-block[1]/@pb-name)='intro00') and (ancestor-or-self::page-block[1]/@pb-name and string(ancestor-or-self::page-block[1]/@pb-name)='intro00')">
               <xsl:attribute name="_gte:count-as-id">cnt__table^page-block.cnt</xsl:attribute>
            </xsl:when>
            <xsl:when test="not(ancestor::book[contains(@doctype,'cir') or contains(@doctype,'em') or contains(@doctype,'tmm')]) and not(ancestor::book[contains(@doctype,'oh')] and ancestor::ata-page-block/@pb-name[.='service']) and not(ancestor::book[contains(@doctype,'oh')] and ancestor::page-block/@pb-name[.='service']) and not(ancestor::ata-page-block/@pb-name[.='00awl' or .='00intro' or .='airlim' or .='awl' or .='awlror' or .='chapsect' or .='consume' or .='d-and-o' or .='frontmatte' or .='howtouse' or .='00howtouse' or .='intro' or .='nut_option' or .='oplimits' or .='sblist' or .='schedchk' or .='spectool' or .='timelim' or .='title-page']) and not(ancestor::page-block/@pb-name[.='00awl' or .='00intro' or .='airlim' or .='awl' or .='awlror' or .='chapsect' or .='consume' or .='d-and-o' or .='frontmatte' or .='howtouse' or .='00howtouse' or .='intro' or .='nut_option' or .='oplimits' or .='sblist' or .='schedchk' or .='spectool' or .='timelim' or .='title-page']) and not(ancestor::ata-page-block/@pb-name[(starts-with(., 'do') and 'do' = translate(., '0123456789', '') and string-length(.) &gt; 2) or (starts-with(., 'in') and 'in' = translate(., '0123456789', '') and string-length(.) &gt; 2) or (starts-with(., 'tl') and 'tl' = translate(., '0123456789', '') and string-length(.) &gt; 2) or .='toolsht' or .='trlist' or .='unschedc' or .='unschedchk']) and not(ancestor::page-block/@pb-name[(starts-with(., 'do') and 'do' = translate(., '0123456789', '') and string-length(.) &gt; 2) or (starts-with(., 'in') and 'in' = translate(., '0123456789', '') and string-length(.) &gt; 2) or (starts-with(., 'tl') and 'tl' = translate(., '0123456789', '') and string-length(.) &gt; 2) or .='toolsht' or .='trlist' or .='unschedc' or .='unschedchk']) and (ancestor-or-self::ata-page-block[1]/@pb-name and string(ancestor-or-self::ata-page-block[1]/@pb-name)='intro00')">
               <xsl:attribute name="_gte:count-as-id">cnt__table^ata-page-block.cnt</xsl:attribute>
            </xsl:when>
            <xsl:when test="not(ancestor::book[contains(@doctype,'cir') or contains(@doctype,'em') or contains(@doctype,'tmm')]) and not(ancestor::book[contains(@doctype,'oh')] and ancestor::ata-page-block/@pb-name[.='service']) and not(ancestor::book[contains(@doctype,'oh')] and ancestor::page-block/@pb-name[.='service']) and not(ancestor::ata-page-block/@pb-name[.='00awl' or .='00intro' or .='airlim' or .='awl' or .='awlror' or .='chapsect' or .='consume' or .='d-and-o' or .='frontmatte' or .='howtouse' or .='00howtouse' or .='intro' or .='nut_option' or .='oplimits' or .='sblist' or .='schedchk' or .='spectool' or .='timelim' or .='title-page']) and not(ancestor::page-block/@pb-name[.='00awl' or .='00intro' or .='airlim' or .='awl' or .='awlror' or .='chapsect' or .='consume' or .='d-and-o' or .='frontmatte' or .='howtouse' or .='00howtouse' or .='intro' or .='nut_option' or .='oplimits' or .='sblist' or .='schedchk' or .='spectool' or .='timelim' or .='title-page']) and not(ancestor::ata-page-block/@pb-name[(starts-with(., 'do') and 'do' = translate(., '0123456789', '') and string-length(.) &gt; 2) or (starts-with(., 'in') and 'in' = translate(., '0123456789', '') and string-length(.) &gt; 2) or (starts-with(., 'tl') and 'tl' = translate(., '0123456789', '') and string-length(.) &gt; 2) or .='toolsht' or .='trlist' or .='unschedc' or .='unschedchk']) and (ancestor::page-block/@pb-name[(starts-with(., 'do') and 'do' = translate(., '0123456789', '') and string-length(.) &gt; 2) or (starts-with(., 'in') and 'in' = translate(., '0123456789', '') and string-length(.) &gt; 2) or (starts-with(., 'tl') and 'tl' = translate(., '0123456789', '') and string-length(.) &gt; 2) or .='toolsht' or .='trlist' or .='unschedc' or .='unschedchk'])">
               <xsl:attribute name="_gte:count-as-id">cnt__table^page-block.cnt</xsl:attribute>
            </xsl:when>
            <xsl:when test="not(ancestor::book[contains(@doctype,'cir') or contains(@doctype,'em') or contains(@doctype,'tmm')]) and not(ancestor::book[contains(@doctype,'oh')] and ancestor::ata-page-block/@pb-name[.='service']) and not(ancestor::book[contains(@doctype,'oh')] and ancestor::page-block/@pb-name[.='service']) and not(ancestor::ata-page-block/@pb-name[.='00awl' or .='00intro' or .='airlim' or .='awl' or .='awlror' or .='chapsect' or .='consume' or .='d-and-o' or .='frontmatte' or .='howtouse' or .='00howtouse' or .='intro' or .='nut_option' or .='oplimits' or .='sblist' or .='schedchk' or .='spectool' or .='timelim' or .='title-page']) and not(ancestor::page-block/@pb-name[.='00awl' or .='00intro' or .='airlim' or .='awl' or .='awlror' or .='chapsect' or .='consume' or .='d-and-o' or .='frontmatte' or .='howtouse' or .='00howtouse' or .='intro' or .='nut_option' or .='oplimits' or .='sblist' or .='schedchk' or .='spectool' or .='timelim' or .='title-page']) and (ancestor::ata-page-block/@pb-name[(starts-with(., 'do') and 'do' = translate(., '0123456789', '') and string-length(.) &gt; 2) or (starts-with(., 'in') and 'in' = translate(., '0123456789', '') and string-length(.) &gt; 2) or (starts-with(., 'tl') and 'tl' = translate(., '0123456789', '') and string-length(.) &gt; 2) or .='toolsht' or .='trlist' or .='unschedc' or .='unschedchk'])">
               <xsl:attribute name="_gte:count-as-id">cnt__table^ata-page-block.cnt</xsl:attribute>
            </xsl:when>
            <xsl:when test="not(ancestor::book[contains(@doctype,'cir') or contains(@doctype,'em') or contains(@doctype,'tmm')]) and not(ancestor::book[contains(@doctype,'oh')] and ancestor::ata-page-block/@pb-name[.='service']) and not(ancestor::book[contains(@doctype,'oh')] and ancestor::page-block/@pb-name[.='service']) and not(ancestor::ata-page-block/@pb-name[.='00awl' or .='00intro' or .='airlim' or .='awl' or .='awlror' or .='chapsect' or .='consume' or .='d-and-o' or .='frontmatte' or .='howtouse' or .='00howtouse' or .='intro' or .='nut_option' or .='oplimits' or .='sblist' or .='schedchk' or .='spectool' or .='timelim' or .='title-page']) and (ancestor::page-block/@pb-name[.='00awl' or .='00intro' or .='airlim' or .='awl' or .='awlror' or .='chapsect' or .='consume' or .='d-and-o' or .='frontmatte' or .='howtouse' or .='00howtouse' or .='intro' or .='nut_option' or .='oplimits' or .='sblist' or .='schedchk' or .='spectool' or .='timelim' or .='title-page'])">
               <xsl:attribute name="_gte:count-as-id">cnt__table^page-block.cnt</xsl:attribute>
            </xsl:when>
            <xsl:when test="not(ancestor::book[contains(@doctype,'cir') or contains(@doctype,'em') or contains(@doctype,'tmm')]) and not(ancestor::book[contains(@doctype,'oh')] and ancestor::ata-page-block/@pb-name[.='service']) and not(ancestor::book[contains(@doctype,'oh')] and ancestor::page-block/@pb-name[.='service']) and (ancestor::ata-page-block/@pb-name[.='00awl' or .='00intro' or .='airlim' or .='awl' or .='awlror' or .='chapsect' or .='consume' or .='d-and-o' or .='frontmatte' or .='howtouse' or .='00howtouse' or .='intro' or .='nut_option' or .='oplimits' or .='sblist' or .='schedchk' or .='spectool' or .='timelim' or .='title-page'])">
               <xsl:attribute name="_gte:count-as-id">cnt__table^ata-page-block.cnt</xsl:attribute>
            </xsl:when>
            <xsl:when test="not(ancestor::book[contains(@doctype,'cir') or contains(@doctype,'em') or contains(@doctype,'tmm')]) and not(ancestor::book[contains(@doctype,'oh')] and ancestor::ata-page-block/@pb-name[.='service']) and (ancestor::book[contains(@doctype,'oh')] and ancestor::page-block/@pb-name[.='service'])"/>
            <xsl:when test="not(ancestor::book[contains(@doctype,'cir') or contains(@doctype,'em') or contains(@doctype,'tmm')]) and (ancestor::book[contains(@doctype,'oh')] and ancestor::ata-page-block/@pb-name[.='service'])"/>
            <xsl:when test="(ancestor::book[contains(@doctype,'cir') or contains(@doctype,'em') or contains(@doctype,'tmm')]) and not(number(ancestor::pgblk/@pgblknbr)&gt;0 and number(ancestor::pgblk/@pgblknbr)&lt;=13)">
               <xsl:attribute name="_gte:count-as-id">cnt__table^pgblk.cnt</xsl:attribute>
            </xsl:when>
            <xsl:when test="(ancestor::book[contains(@doctype,'cir') or contains(@doctype,'em') or contains(@doctype,'tmm')]) and (number(ancestor::pgblk/@pgblknbr)&gt;0 and number(ancestor::pgblk/@pgblknbr)&lt;=13)">
               <xsl:attribute name="_gte:count-as-id">cnt__table^pgblk.cnt</xsl:attribute>
            </xsl:when>
            <xsl:when test="true()"><!--This is the "otherwise" clause, but there may be no when's--><!--We emit this even though we do nothing here to avoid a possible empty xsl:choose--></xsl:when>
         </xsl:choose>
         <xsl:apply-templates select="@*|node()" mode="set-countas"/>
      </xsl:copy>
   </xsl:template>

<xsl:template match="chapter/title" mode="set-countas" priority="4">
      <xsl:copy>
         <xsl:apply-templates select="@*|node()" mode="set-countas"/>
      </xsl:copy>
   </xsl:template>

<xsl:template match="book/title" mode="set-countas" priority="3">
      <xsl:copy>
         <xsl:apply-templates select="@*|node()" mode="set-countas"/>
      </xsl:copy>
   </xsl:template>

<xsl:template match="ata-page-block/title" mode="set-countas" priority="2">
      <xsl:copy>
         <xsl:apply-templates select="@*|node()" mode="set-countas"/>
      </xsl:copy>
   </xsl:template>

<xsl:template match="title-page/title" mode="set-countas" priority="1">
      <xsl:copy>
         <xsl:apply-templates select="@*|node()" mode="set-countas"/>
      </xsl:copy>
   </xsl:template>

<xsl:template match="title" mode="set-countas" priority="0">
      <xsl:copy>
         <xsl:apply-templates select="@*|node()" mode="set-countas"/>
      </xsl:copy>
   </xsl:template>

<xsl:template match="_ufe:title-block" mode="set-countas" priority="0">
      <xsl:copy>
         <xsl:apply-templates select="@*|node()" mode="set-countas"/>
      </xsl:copy>
   </xsl:template>

<xsl:template match="title-page" mode="set-countas" priority="0">
      <xsl:copy>
         <xsl:apply-templates mode="set-countas" select="@*|node()"> </xsl:apply-templates>
      </xsl:copy>
   </xsl:template>

<xsl:template match="pgblk/_ufe:tmm-title" mode="set-countas" priority="2">
      <xsl:copy>
         <xsl:apply-templates select="@*|node()" mode="set-countas"/>
      </xsl:copy>
   </xsl:template>

<xsl:template match="pbfmatr/_ufe:tmm-title" mode="set-countas" priority="1">
      <xsl:copy>
         <xsl:attribute name="_gte:count-as-id">cnt__pbfmatr^-None-.cnt</xsl:attribute>
         <xsl:apply-templates select="@*|node()" mode="set-countas"/>
      </xsl:copy>
   </xsl:template>

<xsl:template match="_ufe:tmm-title" mode="set-countas" priority="0">
      <xsl:copy>
         <xsl:apply-templates select="@*|node()" mode="set-countas"/>
      </xsl:copy>
   </xsl:template>

<xsl:template match="toc" mode="set-countas" priority="0">
      <xsl:copy>
         <xsl:apply-templates select="@*|node()" mode="set-countas"/>
      </xsl:copy>
   </xsl:template>

<xsl:template match="tool" mode="set-countas" priority="0">
      <xsl:copy>
         <xsl:apply-templates select="@*|node()" mode="set-countas"/>
      </xsl:copy>
   </xsl:template>

<xsl:template match="toolname" mode="set-countas" priority="0">
      <xsl:copy>
         <xsl:apply-templates select="@*|node()" mode="set-countas"/>
      </xsl:copy>
   </xsl:template>

<xsl:template match="toolnbr" mode="set-countas" priority="0">
      <xsl:copy>
         <xsl:apply-templates select="@*|node()" mode="set-countas"/>
      </xsl:copy>
   </xsl:template>

<xsl:template match="trbody" mode="set-countas" priority="0">
      <xsl:copy>
         <xsl:apply-templates select="@*|node()" mode="set-countas"/>
      </xsl:copy>
   </xsl:template>

<xsl:template match="trfignum" mode="set-countas" priority="0">
      <xsl:copy>
         <xsl:apply-templates select="@*|node()" mode="set-countas"/>
      </xsl:copy>
   </xsl:template>

<xsl:template match="trfmatr" mode="set-countas" priority="0">
      <xsl:copy>
         <xsl:apply-templates select="@*|node()" mode="set-countas"/>
      </xsl:copy>
   </xsl:template>

<xsl:template match="trreason" mode="set-countas" priority="0">
      <xsl:copy>
         <xsl:apply-templates select="@*|node()" mode="set-countas"/>
      </xsl:copy>
   </xsl:template>

<xsl:template match="trsupdata" mode="set-countas" priority="0">
      <xsl:copy>
         <xsl:apply-templates select="@*|node()" mode="set-countas"/>
      </xsl:copy>
   </xsl:template>

<xsl:template match="trtblnum" mode="set-countas" priority="0">
      <xsl:copy>
         <xsl:apply-templates select="@*|node()" mode="set-countas"/>
      </xsl:copy>
   </xsl:template>

<xsl:template match="trxref" mode="set-countas" priority="0">
      <xsl:copy>
         <xsl:apply-templates select="@*|node()" mode="set-countas"/>
      </xsl:copy>
   </xsl:template>

<xsl:template match="title-page/type" mode="set-countas" priority="1">
      <xsl:copy>
         <xsl:apply-templates select="@*|node()" mode="set-countas"/>
      </xsl:copy>
   </xsl:template>

<xsl:template match="type" mode="set-countas" priority="0">
      <xsl:copy>
         <xsl:apply-templates select="@*|node()" mode="set-countas"/>
      </xsl:copy>
   </xsl:template>

<xsl:template match="prcitem3/prcitem/unlist" mode="set-countas" priority="7">
      <xsl:copy>
         <xsl:apply-templates select="@*|node()" mode="set-countas"/>
      </xsl:copy>
   </xsl:template>

<xsl:template match="tprereq/unlist" mode="set-countas" priority="6">
      <xsl:copy>
         <xsl:apply-templates select="@*|node()" mode="set-countas"/>
      </xsl:copy>
   </xsl:template>

<xsl:template match="l1item/unlist" mode="set-countas" priority="5">
      <xsl:copy>
         <xsl:apply-templates select="@*|node()" mode="set-countas"/>
      </xsl:copy>
   </xsl:template>

<xsl:template match="l2item/unlist" mode="set-countas" priority="4">
      <xsl:copy>
         <xsl:apply-templates select="@*|node()" mode="set-countas"/>
      </xsl:copy>
   </xsl:template>

<xsl:template match="l3item/unlist" mode="set-countas" priority="3">
      <xsl:copy>
         <xsl:apply-templates select="@*|node()" mode="set-countas"/>
      </xsl:copy>
   </xsl:template>

<xsl:template match="l4item/unlist" mode="set-countas" priority="2">
      <xsl:copy>
         <xsl:apply-templates select="@*|node()" mode="set-countas"/>
      </xsl:copy>
   </xsl:template>

<xsl:template match="unlist[ancestor::book[contains(@doctype,'epc')]]" mode="set-countas" priority="1">
      <xsl:copy>
         <xsl:apply-templates select="@*|node()" mode="set-countas"/>
      </xsl:copy>
   </xsl:template>

<xsl:template match="unlist" mode="set-countas" priority="0">
      <xsl:copy>
         <xsl:apply-templates select="@*|node()" mode="set-countas"/>
      </xsl:copy>
   </xsl:template>

<xsl:template match="enumlist//enumlist//enumlist//enumlist/unlitem" mode="set-countas" priority="12">
      <xsl:copy>
         <xsl:apply-templates select="@*|node()" mode="set-countas"/>
      </xsl:copy>
   </xsl:template>

<xsl:template match="enumlist//enumlist//enumlist/unlitem" mode="set-countas" priority="11">
      <xsl:copy>
         <xsl:apply-templates select="@*|node()" mode="set-countas"/>
      </xsl:copy>
   </xsl:template>

<xsl:template match="list//list//list/unlitem" mode="set-countas" priority="10">
      <xsl:copy>
         <xsl:apply-templates select="@*|node()" mode="set-countas"/>
      </xsl:copy>
   </xsl:template>

<xsl:template match="bullist//bullist//bullist/unlitem" mode="set-countas" priority="9">
      <xsl:copy>
         <xsl:apply-templates select="@*|node()" mode="set-countas"/>
      </xsl:copy>
   </xsl:template>

<xsl:template match="enumlist//enumlist/unlitem" mode="set-countas" priority="8">
      <xsl:copy>
         <xsl:apply-templates select="@*|node()" mode="set-countas"/>
      </xsl:copy>
   </xsl:template>

<xsl:template match="list//list/unlitem" mode="set-countas" priority="7">
      <xsl:copy>
         <xsl:apply-templates select="@*|node()" mode="set-countas"/>
      </xsl:copy>
   </xsl:template>

<xsl:template match="bullist//bullist/unlitem" mode="set-countas" priority="6">
      <xsl:copy>
         <xsl:apply-templates select="@*|node()" mode="set-countas"/>
      </xsl:copy>
   </xsl:template>

<xsl:template match="enumlist/unlitem" mode="set-countas" priority="5">
      <xsl:copy>
         <xsl:apply-templates select="@*|node()" mode="set-countas"/>
      </xsl:copy>
   </xsl:template>

<xsl:template match="chapsect-list/unlitem" mode="set-countas" priority="4">
      <xsl:copy>
         <xsl:apply-templates select="@*|node()" mode="set-countas"/>
      </xsl:copy>
   </xsl:template>

<xsl:template match="unlist/unlitem" mode="set-countas" priority="3">
      <xsl:copy>
         <xsl:apply-templates select="@*|node()" mode="set-countas"/>
      </xsl:copy>
   </xsl:template>

<xsl:template match="list/unlitem" mode="set-countas" priority="2">
      <xsl:copy>
         <xsl:apply-templates select="@*|node()" mode="set-countas"/>
      </xsl:copy>
   </xsl:template>

<xsl:template match="bullist/unlitem" mode="set-countas" priority="1">
      <xsl:copy>
         <xsl:apply-templates select="@*|node()" mode="set-countas"/>
      </xsl:copy>
   </xsl:template>

<xsl:template match="unlitem" mode="set-countas" priority="0">
      <xsl:copy>
         <xsl:apply-templates select="@*|node()" mode="set-countas"/>
      </xsl:copy>
   </xsl:template>

<xsl:template match="url" mode="set-countas" priority="0">
      <xsl:copy>
         <xsl:apply-templates select="@*|node()" mode="set-countas"/>
      </xsl:copy>
   </xsl:template>

<xsl:template match="_ufe:url-link" mode="set-countas" priority="0">
      <xsl:copy>
         <xsl:apply-templates select="@*|node()" mode="set-countas"/>
      </xsl:copy>
   </xsl:template>

<xsl:template match="validation" mode="set-countas" priority="0">
      <xsl:copy>
         <xsl:apply-templates select="@*|node()" mode="set-countas"/>
      </xsl:copy>
   </xsl:template>

<xsl:template match="step//step/warning" mode="set-countas" priority="11">
      <xsl:copy>
         <xsl:apply-templates select="@*|node()" mode="set-countas"/>
      </xsl:copy>
   </xsl:template>

<xsl:template match="subtask/warning" mode="set-countas" priority="10">
      <xsl:copy>
         <xsl:apply-templates select="@*|node()" mode="set-countas"/>
      </xsl:copy>
   </xsl:template>

<xsl:template match="n-para/warning" mode="set-countas" priority="9">
      <xsl:copy>
         <xsl:apply-templates select="@*|node()" mode="set-countas"/>
      </xsl:copy>
   </xsl:template>

<xsl:template match="step/warning" mode="set-countas" priority="8">
      <xsl:copy>
         <xsl:apply-templates select="@*|node()" mode="set-countas"/>
      </xsl:copy>
   </xsl:template>

<xsl:template match="task/warning" mode="set-countas" priority="7">
      <xsl:copy>
         <xsl:apply-templates select="@*|node()" mode="set-countas"/>
      </xsl:copy>
   </xsl:template>

<xsl:template match="fandc/warning" mode="set-countas" priority="6">
      <xsl:copy>
         <xsl:apply-templates select="@*|node()" mode="set-countas"/>
      </xsl:copy>
   </xsl:template>

<xsl:template match="spec-assem/warning" mode="set-countas" priority="5">
      <xsl:copy>
         <xsl:apply-templates select="@*|node()" mode="set-countas"/>
      </xsl:copy>
   </xsl:template>

<xsl:template match="spring-pressure/warning" mode="set-countas" priority="4">
      <xsl:copy>
         <xsl:apply-templates select="@*|node()" mode="set-countas"/>
      </xsl:copy>
   </xsl:template>

<xsl:template match="torque-and-stretch/warning" mode="set-countas" priority="3">
      <xsl:copy>
         <xsl:apply-templates select="@*|node()" mode="set-countas"/>
      </xsl:copy>
   </xsl:template>

<xsl:template match="fits-and-clears/warning" mode="set-countas" priority="2">
      <xsl:copy>
         <xsl:apply-templates select="@*|node()" mode="set-countas"/>
      </xsl:copy>
   </xsl:template>

<xsl:template match="warning[parent::subpara]" mode="set-countas" priority="1">
      <xsl:copy>
         <xsl:apply-templates select="@*|node()" mode="set-countas"/>
      </xsl:copy>
   </xsl:template>

<xsl:template match="warning" mode="set-countas" priority="0">
      <xsl:copy>
         <xsl:apply-templates select="@*|node()" mode="set-countas"/>
      </xsl:copy>
   </xsl:template>

<xsl:template match="table/title/xref[id(@ref)/self::figure]" mode="set-countas" priority="7">
      <xsl:copy>
         <xsl:apply-templates select="@*|node()" mode="set-countas"/>
      </xsl:copy>
   </xsl:template>

<xsl:template match="lof-item//xref[id(@ref)/self::graphic]" mode="set-countas" priority="5">
      <xsl:copy>
         <xsl:apply-templates mode="set-countas" select="@*|node()"/>
      </xsl:copy>
   </xsl:template>

<xsl:template match="lof-item//xref[id(@ref)/self::figure]" mode="set-countas" priority="16">
      <xsl:copy>
         <xsl:apply-templates mode="set-countas" select="@*|node()"/>
      </xsl:copy>
   </xsl:template>

<xsl:template match="highlights//xref" mode="set-countas" priority="4">
      <xsl:copy>
         <xsl:apply-templates select="@*|node()" mode="set-countas"/>
      </xsl:copy>
   </xsl:template>

<xsl:template match="xref[name(id(@ref))='table' and (id(@ref)/ancestor::figure or id(@ref)/ancestor::graphic)]" mode="set-countas" priority="3">
      <xsl:copy>
         <xsl:apply-templates select="@*|node()" mode="set-countas"/>
      </xsl:copy>
   </xsl:template>

<xsl:template match="xref[id(@ref)/self::table]" mode="set-countas" priority="2">
      <xsl:copy>
         <xsl:apply-templates select="@*|node()" mode="set-countas"/>
      </xsl:copy>
   </xsl:template>

<xsl:template match="xref[id(@ref)/self::figure]" mode="set-countas" priority="1">
      <xsl:copy>
         <xsl:apply-templates mode="set-countas" select="@*|node()"/>
      </xsl:copy>
   </xsl:template>

<xsl:template match="xref" mode="set-countas" priority="0">
      <xsl:copy>
         <xsl:apply-templates select="@*|node()" mode="set-countas"/>
      </xsl:copy>
   </xsl:template>

<xsl:template match="zip" mode="set-countas" priority="0">
      <xsl:copy>
         <xsl:apply-templates select="@*|node()" mode="set-countas"/>
      </xsl:copy>
   </xsl:template>

<xsl:template match="_gte:styler_numbering" mode="set-countas">
      <xsl:copy>
         <xsl:copy-of select="@*"/>
      </xsl:copy>
   </xsl:template>

<xsl:template match="_sfe:BeforeOrAfterText" mode="set-countas" priority="0">
      <xsl:copy>
         <xsl:apply-templates select="@*|node()" mode="set-countas"/>
      </xsl:copy>
   </xsl:template>

<xsl:template match="_sfe:CollectionItem[1]" mode="set-countas" priority="3">
      <xsl:copy>
         <xsl:apply-templates select="@*|node()" mode="set-countas"/>
      </xsl:copy>
   </xsl:template>

<xsl:template match="_sfe:CollectionItem[position()&gt;1 and not(position()=last())]" mode="set-countas" priority="2">
      <xsl:copy>
         <xsl:apply-templates select="@*|node()" mode="set-countas"/>
      </xsl:copy>
   </xsl:template>

<xsl:template match="_sfe:CollectionItem[last()]" mode="set-countas" priority="1">
      <xsl:copy>
         <xsl:apply-templates select="@*|node()" mode="set-countas"/>
      </xsl:copy>
   </xsl:template>

<xsl:template match="_sfe:CollectionItem" mode="set-countas" priority="0">
      <xsl:copy>
         <xsl:apply-templates select="@*|node()" mode="set-countas"/>
      </xsl:copy>
   </xsl:template>

<xsl:template match="_sfe:CrossReference" mode="set-countas" priority="0">
      <xsl:copy>
         <xsl:apply-templates select="@*|node()" mode="set-countas"/>
      </xsl:copy>
   </xsl:template>

<xsl:template match="_sfe:HeaderOrFooter//_sfe:CrossReferenceTitle" mode="set-countas" priority="1">
      <xsl:copy>
         <xsl:apply-templates select="@*|node()" mode="set-countas"/>
      </xsl:copy>
   </xsl:template>

<xsl:template match="_sfe:CrossReferenceTitle" mode="set-countas" priority="0">
      <xsl:copy>
         <xsl:apply-templates select="@*|node()" mode="set-countas"/>
      </xsl:copy>
   </xsl:template>

<xsl:template match="_sfe:ExternalLink" mode="set-countas" priority="0">
      <xsl:copy>
         <xsl:apply-templates select="@*|node()" mode="set-countas"/>
      </xsl:copy>
   </xsl:template>

<xsl:template match="_sfe:Gentext" mode="set-countas" priority="0">
      <xsl:copy>
         <xsl:apply-templates select="@*|node()" mode="set-countas"/>
      </xsl:copy>
   </xsl:template>

<xsl:template match="_sfe:HeaderOrFooter" mode="set-countas" priority="0">
      <xsl:copy>
         <xsl:apply-templates select="@*|node()" mode="set-countas"/>
      </xsl:copy>
   </xsl:template>

<xsl:template match="_sfe:Index" mode="set-countas" priority="0">
      <xsl:copy>
         <xsl:apply-templates select="@*|node()" mode="set-countas"/>
      </xsl:copy>
   </xsl:template>

<xsl:template match="_sfe:IndexAlphaGroup" mode="set-countas" priority="0">
      <xsl:copy>
         <xsl:apply-templates select="@*|node()" mode="set-countas"/>
      </xsl:copy>
   </xsl:template>

<xsl:template match="_sfe:IndexEndPage" mode="set-countas" priority="0">
      <xsl:copy>
         <xsl:apply-templates select="@*|node()" mode="set-countas"/>
      </xsl:copy>
   </xsl:template>

<xsl:template match="_sfe:IndexEntry/_sfe:IndexEntry/_sfe:IndexEntry/_sfe:IndexEntry" mode="set-countas" priority="3">
      <xsl:copy>
         <xsl:apply-templates select="@*|node()" mode="set-countas"/>
      </xsl:copy>
   </xsl:template>

<xsl:template match="_sfe:IndexEntry/_sfe:IndexEntry/_sfe:IndexEntry" mode="set-countas" priority="2">
      <xsl:copy>
         <xsl:apply-templates select="@*|node()" mode="set-countas"/>
      </xsl:copy>
   </xsl:template>

<xsl:template match="_sfe:IndexEntry/_sfe:IndexEntry" mode="set-countas" priority="1">
      <xsl:copy>
         <xsl:apply-templates select="@*|node()" mode="set-countas"/>
      </xsl:copy>
   </xsl:template>

<xsl:template match="_sfe:IndexEntry" mode="set-countas" priority="0">
      <xsl:copy>
         <xsl:apply-templates select="@*|node()" mode="set-countas"/>
      </xsl:copy>
   </xsl:template>

<xsl:template match="_sfe:IndexGroupHead" mode="set-countas" priority="0">
      <xsl:copy>
         <xsl:apply-templates select="@*|node()" mode="set-countas"/>
      </xsl:copy>
   </xsl:template>

<xsl:template match="_sfe:IndexHeading" mode="set-countas" priority="0">
      <xsl:copy>
         <xsl:apply-templates select="@*|node()" mode="set-countas"/>
      </xsl:copy>
   </xsl:template>

<xsl:template match="_sfe:IndexLocators" mode="set-countas" priority="0">
      <xsl:copy>
         <xsl:apply-templates select="@*|node()" mode="set-countas"/>
      </xsl:copy>
   </xsl:template>

<xsl:template match="_sfe:IndexPage[position()&gt;1]" mode="set-countas" priority="1">
      <xsl:copy>
         <xsl:apply-templates select="@*|node()" mode="set-countas"/>
      </xsl:copy>
   </xsl:template>

<xsl:template match="_sfe:IndexPage" mode="set-countas" priority="0">
      <xsl:copy>
         <xsl:apply-templates select="@*|node()" mode="set-countas"/>
      </xsl:copy>
   </xsl:template>

<xsl:template match="_sfe:IndexPostGroup" mode="set-countas" priority="0">
      <xsl:copy>
         <xsl:apply-templates select="@*|node()" mode="set-countas"/>
      </xsl:copy>
   </xsl:template>

<xsl:template match="_sfe:IndexPreGroup" mode="set-countas" priority="0">
      <xsl:copy>
         <xsl:apply-templates select="@*|node()" mode="set-countas"/>
      </xsl:copy>
   </xsl:template>

<xsl:template match="_sfe:IndexRangeGroup" mode="set-countas" priority="0">
      <xsl:copy>
         <xsl:apply-templates select="@*|node()" mode="set-countas"/>
      </xsl:copy>
   </xsl:template>

<xsl:template match="_sfe:IndexSee" mode="set-countas" priority="0">
      <xsl:copy>
         <xsl:apply-templates select="@*|node()" mode="set-countas"/>
      </xsl:copy>
   </xsl:template>

<xsl:template match="_sfe:IndexSeeAlso" mode="set-countas" priority="0">
      <xsl:copy>
         <xsl:apply-templates select="@*|node()" mode="set-countas"/>
      </xsl:copy>
   </xsl:template>

<xsl:template match="_sfe:IndexSubGroupHead" mode="set-countas" priority="0">
      <xsl:copy>
         <xsl:apply-templates select="@*|node()" mode="set-countas"/>
      </xsl:copy>
   </xsl:template>

<xsl:template match="_sfe:InternalLink" mode="set-countas" priority="0">
      <xsl:copy>
         <xsl:apply-templates select="@*|node()" mode="set-countas"/>
      </xsl:copy>
   </xsl:template>

<xsl:template match="_sfe:RepeatingTitle" mode="set-countas" priority="0">
      <xsl:copy>
         <xsl:apply-templates select="@*|node()" mode="set-countas"/>
      </xsl:copy>
   </xsl:template>

<xsl:template match="_sfe:TableOfContents" mode="set-countas" priority="0">
      <xsl:copy>
         <xsl:apply-templates select="@*|node()" mode="set-countas"/>
      </xsl:copy>
   </xsl:template>

<xsl:template match="_sfe:TocEntry1_Table_of_Contents" mode="set-countas" priority="0">
      <xsl:copy>
         <xsl:apply-templates select="@*|node()" mode="set-countas"/>
      </xsl:copy>
   </xsl:template>

<xsl:template match="_sfe:TocEntry2_Table_of_Contents" mode="set-countas" priority="0">
      <xsl:copy>
         <xsl:apply-templates select="@*|node()" mode="set-countas"/>
      </xsl:copy>
   </xsl:template>

<xsl:template match="_sfe:TocEntry3_Table_of_Contents" mode="set-countas" priority="0">
      <xsl:copy>
         <xsl:apply-templates select="@*|node()" mode="set-countas"/>
      </xsl:copy>
   </xsl:template>

<xsl:template match="_sfe:TocEntry4_Table_of_Contents" mode="set-countas" priority="0">
      <xsl:copy>
         <xsl:apply-templates select="@*|node()" mode="set-countas"/>
      </xsl:copy>
   </xsl:template>

<xsl:template match="_sfe:TocEntry5_Table_of_Contents" mode="set-countas" priority="0">
      <xsl:copy>
         <xsl:apply-templates select="@*|node()" mode="set-countas"/>
      </xsl:copy>
   </xsl:template>

<xsl:template match="_sfe:TocEntry6_Table_of_Contents" mode="set-countas" priority="0">
      <xsl:copy>
         <xsl:apply-templates select="@*|node()" mode="set-countas"/>
      </xsl:copy>
   </xsl:template>

<xsl:template match="_sfe:TocLabel_Table_of_Contents" mode="set-countas" priority="0">
      <xsl:copy>
         <xsl:apply-templates select="@*|node()" mode="set-countas"/>
      </xsl:copy>
   </xsl:template>

<xsl:template match="_sfe:TocPage_Table_of_Contents" mode="set-countas" priority="0">
      <xsl:copy>
         <xsl:apply-templates select="@*|node()" mode="set-countas"/>
      </xsl:copy>
   </xsl:template>

<xsl:template match="_sfe:TocTable_of_Contents" mode="set-countas" priority="0">
      <xsl:copy>
         <xsl:apply-templates select="@*|node()" mode="set-countas"/>
      </xsl:copy>
   </xsl:template>

<xsl:template match="_sfe:TocTitle_Table_of_Contents" mode="set-countas" priority="0">
      <xsl:copy>
         <xsl:apply-templates select="@*|node()" mode="set-countas"/>
      </xsl:copy>
   </xsl:template>

</xsl:stylesheet>
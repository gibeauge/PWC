<?xml version="1.0" encoding="UTF-8"?><xsl:stylesheet xmlns:simg="java:net.sf.docbook.saxon.ImageIntrinsics" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:ximg="xaln://com.nwalsh.xalan.ImageIntrinsics" xmlns="http://www.w3.org/1999/xhtml" xmlns:exslt="http://exslt.org/common" xmlns:_acl="java:com.arbortext.epic.Acl" xmlns:msxsl="urn:schemas-microsoft-com:xslt" xmlns:_="http://www.pwc.ca/namespace/doctypes/emipc" xmlns:_dtd="http://www.arbortext.com/namespace/Styler/UserElements" xmlns:atidlm="http://www.arbortext.com/namespace/atidlm" xmlns:_2="http://www.pwc.ca/namespace/doctypes/jmtosmigrate" xmlns:ch="http://www.arbortext.com/namespace/chunker" xmlns:saxon="http://saxon.sf.net/" xmlns:_5="http://www.pwc.ca/namespace/doctypes/ipc" xmlns:_gte="http://www.arbortext.com/namespace/Styler/GeneratedTextElements" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:_sfe="http://www.arbortext.com/namespace/Styler/StylerFormattingElements" xmlns:_js="java:com.arbortext.epic.internal.js.JavaScript" xmlns:_3="http://www.pwc.ca/namespace/doctypes/migrate" xmlns:_ufe="http://www.arbortext.com/namespace/Styler/UserFormattingElements" version="1.0" exclude-result-prefixes="_ atidlm xml _2 ch saxon _5 xsi _js _3 #default exslt msxsl _dtd _ufe _sfe _gte simg ximg _acl">


<xsl:template match="chgdesc" mode="styler-collect-footnotes" priority="0">
      <xsl:apply-templates select="_sfe:BeforeOrAfterText/*" mode="styler-collect-footnotes"/>
   </xsl:template>

<xsl:template match="email" mode="styler-collect-footnotes" priority="0">
      <xsl:apply-templates select="_sfe:BeforeOrAfterText/*" mode="styler-collect-footnotes"/>
   </xsl:template>

<xsl:template match="figure/figno" mode="styler-collect-footnotes" priority="1">
      <xsl:apply-templates select="_sfe:BeforeOrAfterText/*" mode="styler-collect-footnotes"/>
   </xsl:template>

<xsl:template match="_ufe:hidden" mode="styler-collect-footnotes" priority="0">
      <xsl:apply-templates select="_sfe:BeforeOrAfterText/*" mode="styler-collect-footnotes"/>
   </xsl:template>

<xsl:template match="qty" mode="styler-collect-footnotes" priority="0">
      <xsl:apply-templates select="_sfe:BeforeOrAfterText/*" mode="styler-collect-footnotes"/>
   </xsl:template>

<xsl:template match="table[@tabstyle='parts-list']//refint[ancestor::book[contains(@doctype, 'epc')]]" mode="styler-collect-footnotes" priority="5">
      <xsl:apply-templates select="_sfe:BeforeOrAfterText/*" mode="styler-collect-footnotes"/>
   </xsl:template>

<xsl:template match="refint[ancestor::book[contains(@doctype, 'epc')]]" mode="styler-collect-footnotes" priority="2">
      <xsl:apply-templates select="_sfe:BeforeOrAfterText/*" mode="styler-collect-footnotes"/>
   </xsl:template>

<xsl:template match="refint[ancestor::book[contains(@doctype, 'cir') or contains(@doctype, 'em')]]" mode="styler-collect-footnotes" priority="1">
      <xsl:apply-templates select="_sfe:BeforeOrAfterText/*" mode="styler-collect-footnotes"/>
   </xsl:template>

<xsl:template match="refint" mode="styler-collect-footnotes" priority="0">
      <xsl:apply-templates select="_sfe:BeforeOrAfterText/*" mode="styler-collect-footnotes"/>
   </xsl:template>

<xsl:template match="title-page//rev-date" mode="styler-collect-footnotes" priority="1">
      <xsl:apply-templates select="_sfe:BeforeOrAfterText/*" mode="styler-collect-footnotes"/>
   </xsl:template>

<xsl:template match="sin" mode="styler-collect-footnotes" priority="0">
      <xsl:apply-templates select="_sfe:BeforeOrAfterText/*" mode="styler-collect-footnotes"/>
   </xsl:template>

<xsl:template match="task//table/title" mode="styler-collect-footnotes" priority="51">
      <xsl:apply-templates select="_sfe:BeforeOrAfterText/*" mode="styler-collect-footnotes"/>
   </xsl:template>

<xsl:template match="mfmatr/title" mode="styler-collect-footnotes" priority="42">
      <xsl:apply-templates select="_sfe:BeforeOrAfterText/*" mode="styler-collect-footnotes"/>
   </xsl:template>

<xsl:template match="pbfmatr/title" mode="styler-collect-footnotes" priority="40">
      <xsl:apply-templates select="_sfe:BeforeOrAfterText/*" mode="styler-collect-footnotes"/>
   </xsl:template>

<xsl:template match="intro/title" mode="styler-collect-footnotes" priority="36">
      <xsl:apply-templates select="_sfe:BeforeOrAfterText/*" mode="styler-collect-footnotes"/>
   </xsl:template>

<xsl:template match="howtouse/title" mode="styler-collect-footnotes" priority="23">
      <xsl:apply-templates select="_sfe:BeforeOrAfterText/*" mode="styler-collect-footnotes"/>
   </xsl:template>

<xsl:template match="table/title" mode="styler-collect-footnotes" priority="5">
      <xsl:apply-templates select="_sfe:BeforeOrAfterText/*" mode="styler-collect-footnotes"/>
   </xsl:template>

<xsl:template match="url" mode="styler-collect-footnotes" priority="0">
      <xsl:apply-templates select="_sfe:BeforeOrAfterText/*" mode="styler-collect-footnotes"/>
   </xsl:template>

<xsl:template match="highlights//xref" mode="styler-collect-footnotes" priority="4">
      <xsl:apply-templates select="_sfe:BeforeOrAfterText/*" mode="styler-collect-footnotes"/>
   </xsl:template>

<xsl:template match="_gte:FootnoteBody" mode="styler-collect-footnotes">
      <div id="{generate-id(.)}">
         <xsl:apply-templates select="."/>
      </div>
   </xsl:template>

<xsl:template match="*" mode="styler-collect-footnotes">
      <xsl:apply-templates select="*" mode="styler-collect-footnotes"/>
   </xsl:template>

<xsl:template match="_sfe:TocPage_Table_of_Contents" mode="styler-collect-footnotes" priority="0">
      <xsl:apply-templates select="_sfe:BeforeOrAfterText/*" mode="styler-collect-footnotes"/>
   </xsl:template>

</xsl:stylesheet>
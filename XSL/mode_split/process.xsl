<?xml version="1.0" encoding="UTF-8"?>

<xsl:stylesheet 
  xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
  xmlns="http://www.w3.org/1999/xhtml" 
  xmlns:exslt="http://exslt.org/common" xmlns:_acl="java:com.arbortext.epic.Acl"
  xmlns:ch="http://www.arbortext.com/namespace/chunker" xmlns:saxon="http://saxon.sf.net/"
  xmlns:_gte="http://www.arbortext.com/namespace/Styler/GeneratedTextElements"
  xmlns:_sfe="http://www.arbortext.com/namespace/Styler/StylerFormattingElements"
  xmlns:_ufe="http://www.arbortext.com/namespace/Styler/UserFormattingElements" version="1.0"
  exclude-result-prefixes="ch saxon #default exslt _ufe _sfe _gte">

<xsl:include href="chunking.xsl"/>
<xsl:include href="toc.xsl"/>

<!-- We try to set a default for graphics-path, but we expect this parameter to be set by the calling code -->
<xsl:param name="graphics-path" select="'/graphics'"/>
<xsl:param name="images-path"   select="'images'"/>
<xsl:param name="css-path"       select="'css'"/>
<xsl:param name="js-path"       select="'javascript'"/>

<xsl:param name="max-expansion-pass-count"  select="number(3)"/>
<xsl:param name="output-dir"                select="concat('_', $doctype, '_',/book/@object-key, '_', /book/@revnbr, '.', /book/@point-revnbr)"/>
  
<xsl:template match="/">
  <xsl:variable name="tree1">
    <xsl:apply-templates select="/" mode="initial-pass-mode"/>
  </xsl:variable>
  <xsl:variable name="tree2">
    <xsl:call-template name="t-expand-gentext">
      <xsl:with-param name="document-tree">
        <xsl:apply-templates select="exslt:node-set($tree1)" mode="expand-gentext"/>
      </xsl:with-param>
      <xsl:with-param name="expansion-pass-count" select="number(1)"/>
    </xsl:call-template>
  </xsl:variable>
  <xsl:variable name="tree3">
    <xsl:apply-templates select="exslt:node-set($tree2)" mode="set-countas"/>
  </xsl:variable>
  <xsl:variable name="tree4">
    <xsl:apply-templates select="exslt:node-set($tree3)" mode="expand-numbering"/>
  </xsl:variable>
  <xsl:variable name="tree5">
    <xsl:apply-templates select="exslt:node-set($tree4)/*"/>
  </xsl:variable>
  <xsl:variable name="tree6" select="$tree5"/>
  <xsl:variable name="tree7" select="$tree5"/>
  <xsl:apply-templates select="exslt:node-set($tree6)/*" mode="output"/>
  <xsl:apply-templates select="exslt:node-set($tree7)/*" mode="toc"/>
  <!--
  <xsl:variable name="tree6">
    <xsl:apply-templates select="exslt:node-set($tree5)" mode="temp-remove-ch"/>
  </xsl:variable>
  -->
  <xsl:copy-of select="$tree5"/>
</xsl:template>
 
<!--
<xsl:template match="ch:*|@ch:*|*[local-name(.)='div'][@id='pwcmetainfo' or @id='pwcbannerinfo']" mode="temp-remove-ch">
</xsl:template>
 
<xsl:template match="@*|node()" mode="temp-remove-ch">
  <xsl:copy>
    <xsl:apply-templates select="@*|node()" mode="temp-remove-ch"/>
  </xsl:copy>
</xsl:template>
-->
 
<!-- INITIAL PASS MODE : add id and chunk attributes -->
 
<xsl:template match="/*" mode="initial-pass-mode" priority="999">
  <xsl:copy>
    <xsl:call-template name="maybe-set-gte-id"/>
    <xsl:apply-templates select="@*" mode="initial-pass-mode"/>
    <xsl:apply-templates select="node()" mode="initial-pass-mode"/>
  </xsl:copy>
</xsl:template>

<xsl:template match="*" mode="initial-pass-mode" priority="1">
  <xsl:copy>
    <xsl:call-template name="maybe-set-gte-id"/>
    <xsl:apply-templates select="@*|node()" mode="initial-pass-mode"/>
  </xsl:copy>
</xsl:template>

<xsl:template match="@*|node()" mode="initial-pass-mode">
  <xsl:copy>
    <xsl:apply-templates select="@*|node()" mode="initial-pass-mode"/>
  </xsl:copy>
</xsl:template>
   
 <!-- EXPAND GENTEXT MODE : add generated text -->
 
<xsl:template name="t-expand-gentext">
  <xsl:param name="document-tree"/>
  <xsl:param name="expansion-pass-count"/>
  
  <xsl:choose>
  <xsl:when test="number($expansion-pass-count) &lt; number($max-expansion-pass-count)">
    <xsl:call-template name="t-expand-gentext">
      <xsl:with-param name="document-tree">
        <xsl:apply-templates select="exslt:node-set($document-tree)" mode="expand-gentext"/>
      </xsl:with-param>
      <xsl:with-param name="expansion-pass-count" select="number($expansion-pass-count) + 1"/>
    </xsl:call-template>
  </xsl:when>
  <xsl:otherwise>
    <xsl:copy-of select="$document-tree"/>
  </xsl:otherwise>
  </xsl:choose>
</xsl:template>

<xsl:template match="@*|node()" mode="expand-gentext">
  <xsl:copy>
    <xsl:apply-templates select="@*|node()" mode="expand-gentext"/>
  </xsl:copy>
</xsl:template>
 
<!-- COUNT AS MODE : set labels for numbering -->

<xsl:template match="@*|node()" mode="set-countas">
  <xsl:copy>
    <xsl:apply-templates select="@*|node()" mode="set-countas"/>
  </xsl:copy>
</xsl:template>

<!-- NUMBERING MODE : calculate numbering -->

<xsl:template match="@*|node()" mode="expand-numbering">
  <xsl:copy>
    <xsl:apply-templates select="@*|node()" mode="expand-numbering"/>
  </xsl:copy>
</xsl:template> 
   
</xsl:stylesheet>

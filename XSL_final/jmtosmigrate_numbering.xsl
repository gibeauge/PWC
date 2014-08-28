<?xml version="1.0" encoding="UTF-8"?>

<xsl:stylesheet 
  xmlns:xsl="http://www.w3.org/1999/XSL/Transform" 
  xmlns="http://www.w3.org/1999/xhtml" 
  xmlns:_gte="http://www.arbortext.com/namespace/Styler/GeneratedTextElements" 
  xmlns:_sfe="http://www.arbortext.com/namespace/Styler/StylerFormattingElements" 
  xmlns:_ufe="http://www.arbortext.com/namespace/Styler/UserFormattingElements" 
  version="1.0" 
  exclude-result-prefixes="#default _ufe _sfe _gte">

<xsl:template match="pbfmatr//list1/l1item" mode="s_numbering" priority="3">
  <xsl:number count="l1item" level="single" format="A."/>
</xsl:template>

<xsl:template match="list1/l1item" mode="s_numbering" priority="1">
  <xsl:number count="l1item" level="single" format="(1)"/>
</xsl:template>

<xsl:template match="pbfmatr//list2/l2item" mode="s_numbering" priority="3">
  <xsl:number count="l2item" level="single" format="(1)"/>
</xsl:template>

<xsl:template match="list2/l2item" mode="s_numbering" priority="1">
  <xsl:number count="l2item" level="single" format="(a)"/>
</xsl:template>

<xsl:template match="pbfmatr//list3/l3item" mode="s_numbering" priority="3">
  <xsl:number count="l3item" level="single" format="(a)"/>
</xsl:template>

<xsl:template match="list3/l3item" mode="s_numbering" priority="1">
  <xsl:number count="l3item" level="single" format="1"/>
</xsl:template>

<xsl:template match="pbfmatr//list4/l4item" mode="s_numbering" priority="3">
  <xsl:number count="l4item" level="single" format="1"/>
</xsl:template>

<xsl:template match="list4/l4item" mode="s_numbering" priority="1">
  <xsl:number count="l4item" level="single" format="a"/>
</xsl:template>

<xsl:template match="numlist/numlitem" mode="s_numbering" priority="1">
  <xsl:number count="numlitem" level="single" format="1."/>
</xsl:template>

<xsl:template match="frontmatter//module/pageblock-title" mode="s_numbering" priority="1">
  <xsl:for-each select="..">
    <xsl:number count="module[pageblock-title]" level="single" format="1"/>
  </xsl:for-each>
</xsl:template>

<xsl:template match="pageblock-title" mode="s_numbering" priority="0">
  <xsl:param name="do-qmark" select="'yes'"/>
  <xsl:if test="$do-qmark='yes'">
     <xsl:value-of select="'?'"/>
  </xsl:if>
</xsl:template>

<xsl:template match="numlist/step" mode="s_numbering" priority="3">
  <xsl:number count="step" level="single" format="1."/>
</xsl:template>

<xsl:template match="numlist/step2" mode="s_numbering" priority="2">
  <xsl:number count="step2" level="single" format="1."/>
</xsl:template>
   
<xsl:template match="numlist/step3" mode="s_numbering" priority="2">
  <xsl:number count="step3" level="single" format="1."/>
</xsl:template>

<xsl:template match="numlist/step4" mode="s_numbering" priority="2">
  <xsl:number count="step4" level="single" format="1."/>
</xsl:template>

<xsl:template match="numlist/step5" mode="s_numbering" priority="2">
  <xsl:number count="step5" level="single" format="1."/>
</xsl:template>

<xsl:template match="procedure//step" mode="s_numbering" priority="1">
  <xsl:number count="step" level="single" format="(1)"/>
</xsl:template>

</xsl:stylesheet>
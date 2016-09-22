<?xml version="1.0" encoding="UTF-8"?>

<xsl:stylesheet 
  xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
  xmlns="http://www.w3.org/1999/xhtml" 
  xmlns:exslt="http://exslt.org/common"
  xmlns:ch="http://www.arbortext.com/namespace/chunker" 
  xmlns:_gte="http://www.arbortext.com/namespace/Styler/GeneratedTextElements"
  xmlns:_sfe="http://www.arbortext.com/namespace/Styler/StylerFormattingElements"
  xmlns:_ufe="http://www.arbortext.com/namespace/Styler/UserFormattingElements" version="2.0"
  exclude-result-prefixes="ch #default exslt _ufe _sfe _gte">

<xsl:include href="chunking.xsl"/>
<xsl:include href="toc.xsl"/>

<xsl:param name="graphics-path" select="'graphics'"/>
<xsl:param name="images-path"   select="'images'"/>
<xsl:param name="css-path"      select="'css'"/>
<xsl:param name="js-path"       select="'javascript'"/>

<xsl:param name="max-expansion-pass-count"  select="number(3)"/>
<xsl:param name="output-dir"                select="concat('file:///C:/Work/Projects/PWC/Maintenance/data/chunks/_', $doctype, '_',/book/@object-key, '_', /book/@revnbr, '.', /book/@point-revnbr)"/>

<xsl:variable name="lang"       select="if (/*/@lang) then /*/@lang else 'EN'"/>
<xsl:variable name="gen-texts"  select="document('generated_texts.xml')//texts[@language=$lang]"/>

<xsl:template match="/">
  <!-- Create and output Metadatas file -->
  <xsl:result-document href="{concat($output-dir, '/XML/Metadata.xml')}" method="xml" encoding="utf-8" 
                       indent="yes" exclude-result-prefixes="ch #default" omit-xml-declaration="no">
    <Metadatas>
      <PartNo><xsl:value-of select="/book/@manualpnr"/></PartNo>
      <Title><xsl:call-template name="t-base-pwcbannerinfo-title-2"/></Title>
      <OriginalIssueDate><xsl:value-of select="/book/@exportdate"/></OriginalIssueDate>
      <Engine><xsl:value-of select="/book/@family"/></Engine>
      <EngineModels><xsl:value-of select="/book/@model"/></EngineModels>
      <RevisionDate><xsl:value-of select="/book/@revdate"/></RevisionDate>
      <RevisionNo><xsl:value-of select="concat(/book/@revnbr,'.',/book/@point-revnbr)"/></RevisionNo>
      <RevisionType><xsl:value-of select="/book/@status"/></RevisionType>
      <DocType><xsl:value-of select="substring-before(/book/@doctype,'_')"/></DocType>
    </Metadatas>
  </xsl:result-document>

  <!-- INITIAL PASS MODE : add id and chunk attributes -->
  <xsl:variable name="tree1">
    <xsl:apply-templates select="/" mode="initial-pass-mode"/>
  </xsl:variable>
  
  <!-- EXPAND GENTEXT MODE : add generated text (may contain HTML) -->
  <xsl:variable name="tree2">
    <xsl:call-template name="t-expand-gentext">
      <xsl:with-param name="document-tree">
        <xsl:apply-templates select="exslt:node-set($tree1)" mode="gentext"/>
      </xsl:with-param>
      <xsl:with-param name="expansion-pass-count" select="number(1)"/>
    </xsl:call-template>
  </xsl:variable>
  
  <!-- COUNT AS MODE : set labels for numbering -->
  <xsl:variable name="tree3">
    <xsl:apply-templates select="exslt:node-set($tree2)" mode="set-countas"/>
  </xsl:variable>
  
  <!-- NUMBERING MODE : calculate numbering -->
  <xsl:variable name="tree4">
    <xsl:apply-templates select="exslt:node-set($tree3)" mode="expand-numbering"/>
  </xsl:variable>
      
  <!-- NO MODE : create HTML tree -->
  <xsl:variable name="tree5">
    <xsl:apply-templates select="exslt:node-set($tree4)/*"/>
  </xsl:variable>
    
  <!-- CHUNKING : split and output HTML -->
  <xsl:variable name="tree6" select="$tree5"/>
  <xsl:apply-templates select="exslt:node-set($tree6)/*" mode="output"/>
  
  <!-- TOC : create TOC and Bookmarks -->
  <xsl:variable name="tree7" select="$tree5"/>
  <xsl:apply-templates select="exslt:node-set($tree7)/*" mode="toc"/>

  <!-- debug -->
  <!--
  <xsl:result-document href="{concat($output-dir, '/XML/tree5.xml')}" method="xml" encoding="utf-8" 
                         indent="yes" exclude-result-prefixes="ch" omit-xml-declaration="no">
    <xsl:copy-of select="$tree5"/>
  </xsl:result-document>
  -->
  <result/>
</xsl:template>
 
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

<xsl:template match="page-block[@pb-name='awl']" mode="initial-pass-mode" priority="3">
  <xsl:choose>
    <xsl:when test="$doctype='jmtosmigrate' or $doctype='emipc'">
      <xsl:copy>
        <xsl:attribute name="ch:chunk">yes</xsl:attribute>
        <xsl:attribute name="ch:bookmark">yes</xsl:attribute>
        <xsl:call-template name="set-gte-id"/>
        <xsl:apply-templates select="@*[not(name()='id')]|node()" mode="initial-pass-mode"/>
      </xsl:copy>
    </xsl:when>
    <xsl:otherwise>
      <xsl:copy>
        <xsl:attribute name="ch:chunk">yes</xsl:attribute>
        <xsl:attribute name="ch:bookmark">yes</xsl:attribute>
        <xsl:call-template name="maybe-set-gte-id"/>
        <xsl:apply-templates select="@*|node()" mode="initial-pass-mode"/>
      </xsl:copy>
    </xsl:otherwise>
  </xsl:choose>
</xsl:template>

<xsl:template match="page-block|frontmatter|chapter|num-index" mode="initial-pass-mode" priority="2">
  <xsl:choose>
    <xsl:when test="$doctype='jmtosmigrate' or $doctype='emipc'">
      <xsl:copy>
        <xsl:attribute name="ch:chunk">yes</xsl:attribute>
        <xsl:call-template name="set-gte-id"/>
        <xsl:apply-templates select="@*[not(name()='id')]|node()" mode="initial-pass-mode"/>
      </xsl:copy>
    </xsl:when>
    <xsl:otherwise>
      <xsl:copy>
        <xsl:attribute name="ch:chunk">yes</xsl:attribute>
        <xsl:call-template name="maybe-set-gte-id"/>
        <xsl:apply-templates select="@*|node()" mode="initial-pass-mode"/>
      </xsl:copy>
    </xsl:otherwise>
  </xsl:choose>
</xsl:template>

<xsl:template match="ata-page-block[@pb-name='schedchk']" mode="initial-pass-mode" priority="3">
  <xsl:choose>
    <xsl:when test="$doctype='jmtosmigrate'">
      <xsl:copy>
        <xsl:attribute name="ch:chunk">yes</xsl:attribute>
        <xsl:attribute name="ch:bookmark">yes</xsl:attribute>
        <xsl:call-template name="set-gte-id"/>
        <xsl:apply-templates select="@*[not(name()='id')]|node()" mode="initial-pass-mode"/>
      </xsl:copy>
    </xsl:when>
    <xsl:otherwise>
      <xsl:copy>
        <xsl:attribute name="ch:chunk">yes</xsl:attribute>
        <xsl:attribute name="ch:bookmark">yes</xsl:attribute>
        <xsl:call-template name="maybe-set-gte-id"/>
        <xsl:apply-templates select="@*|node()" mode="initial-pass-mode"/>
      </xsl:copy>
    </xsl:otherwise>
  </xsl:choose>
</xsl:template>

<xsl:template match="ata-page-block|section|subject" mode="initial-pass-mode" priority="2">
  <xsl:choose>
    <xsl:when test="$doctype='jmtosmigrate'">
      <xsl:copy>
        <xsl:attribute name="ch:chunk">yes</xsl:attribute>
        <xsl:call-template name="set-gte-id"/>
        <xsl:apply-templates select="@*[not(name()='id')]|node()" mode="initial-pass-mode"/>
      </xsl:copy>
    </xsl:when>
    <xsl:otherwise>
      <xsl:copy>
        <xsl:attribute name="ch:chunk">yes</xsl:attribute>
        <xsl:call-template name="maybe-set-gte-id"/>
        <xsl:apply-templates select="@*|node()" mode="initial-pass-mode"/>
      </xsl:copy>
    </xsl:otherwise>
  </xsl:choose>
</xsl:template>

<xsl:template match="ata-page-block/title|page-block/title|chapter/title|section/title|subject/title|pageblock-title" mode="initial-pass-mode" priority="2">
  <xsl:choose>
    <xsl:when test="$doctype='jmtosmigrate'">
      <xsl:copy>
        <xsl:call-template name="set-gte-id"/>
        <xsl:apply-templates select="@*[not(name()='id')]|node()" mode="initial-pass-mode"/>
      </xsl:copy>
    </xsl:when>
    <xsl:otherwise>
      <xsl:copy>
        <xsl:call-template name="maybe-set-gte-id"/>
        <xsl:apply-templates select="@*|node()" mode="initial-pass-mode"/>
      </xsl:copy>
    </xsl:otherwise>
  </xsl:choose>
</xsl:template>

<!--
<xsl:template match="page-block[@pb-name='nut_option']/lot" mode="initial-pass-mode" priority="3">
  <xsl:choose>
    <xsl:when test="$doctype='emipc'"/>
    <xsl:otherwise><xsl:next-match/></xsl:otherwise>
  </xsl:choose>
</xsl:template>
-->
      
<xsl:template match="lof|lot|title-page" mode="initial-pass-mode" priority="2">
  <xsl:copy>
    <xsl:attribute name="ch:chunk">yes</xsl:attribute>
    <xsl:call-template name="maybe-set-gte-id"/>
    <xsl:apply-templates select="@*|node()" mode="initial-pass-mode"/>
  </xsl:copy>
</xsl:template>

<xsl:template match="highlights" mode="initial-pass-mode" priority="2">
  <xsl:copy>
    <xsl:attribute name="ch:chunk">yes</xsl:attribute>
    <xsl:call-template name="set-gte-id"/>
    <xsl:apply-templates select="@*[not(name()='id')]|node()" mode="initial-pass-mode"/>
  </xsl:copy>
</xsl:template>

<xsl:template match="book|highlights/title" mode="initial-pass-mode" priority="2">
  <xsl:copy>
    <xsl:call-template name="set-gte-id"/>
    <xsl:apply-templates select="@*[not(name()='id')]|node()" mode="initial-pass-mode"/>
  </xsl:copy>
</xsl:template>

<xsl:template match="table[@id='eff-code-table']" mode="initial-pass-mode" priority="2">
  <xsl:copy>
    <xsl:apply-templates select="@*[not(name()='id')]|node()" mode="initial-pass-mode"/>
  </xsl:copy>
</xsl:template>
  
<xsl:template match="itemspec|marker[not(@id)]" mode="initial-pass-mode" priority="2">
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
        <xsl:apply-templates select="exslt:node-set($document-tree)" mode="gentext"/>
      </xsl:with-param>
      <xsl:with-param name="expansion-pass-count" select="number($expansion-pass-count) + 1"/>
    </xsl:call-template>
  </xsl:when>
  <xsl:otherwise>
    <xsl:copy-of select="$document-tree"/>
  </xsl:otherwise>
  </xsl:choose>
</xsl:template>

<xsl:template match="@*|node()" mode="gentext">
  <xsl:copy>
    <xsl:apply-templates select="@*|node()" mode="gentext"/>
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

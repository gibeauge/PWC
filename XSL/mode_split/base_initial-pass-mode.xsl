<?xml version="1.0" encoding="UTF-8"?>

<xsl:stylesheet 
  xmlns:xsl="http://www.w3.org/1999/XSL/Transform" 
  xmlns="http://www.w3.org/1999/xhtml" 
  xmlns:exslt="http://exslt.org/common" 
  xmlns:ch="http://www.arbortext.com/namespace/chunker" 
  xmlns:_gte="http://www.arbortext.com/namespace/Styler/GeneratedTextElements" 
  xmlns:_sfe="http://www.arbortext.com/namespace/Styler/StylerFormattingElements" 
  xmlns:_ufe="http://www.arbortext.com/namespace/Styler/UserFormattingElements" 
  version="1.0" 
  exclude-result-prefixes="xsl xml ch #default exslt _ufe _sfe _gte">

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

<xsl:template match="page-block|frontmatter|chapter" mode="initial-pass-mode" priority="2">
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

</xsl:stylesheet>
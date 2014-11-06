<?xml version="1.0"?>

<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
                version="1.0">

<xsl:import href="tbl-params.xsl"/>

<xsl:template name="copy-non-gte-attributes">
  <!-- As of 2011 Feb 16, we also do not copy @colspan or @rowspan or @span when equal to 1 -->
    <xsl:for-each select="@*[namespace-uri(.)!='http://www.arbortext.com/namespace/Styler/GeneratedTextElements']">
      <xsl:choose>
        <xsl:when test="namespace-uri(.)!=''">
          <xsl:attribute name="{name(.)}" namespace="{namespace-uri(.)}">
            <xsl:value-of select="."/>
          </xsl:attribute>
        </xsl:when>
        <xsl:when test="(name(.)='colspan' or name(.)='rowspan' or name(.)='span') and number(.)=1">
          <!-- do not copy @colspan or @rowspan when equal to 1 -->
        </xsl:when>
        <xsl:otherwise>
          <xsl:attribute name="{name(.)}">
            <xsl:value-of select="."/>
          </xsl:attribute>
        </xsl:otherwise>
      </xsl:choose>
    </xsl:for-each>
</xsl:template>

<!-- If we detect a table tag for an HTML table, copy its
     contents through until we get to a caption or td|th contents in
     which case we apply-templates to the caption or td|th contents -->

<xsl:template match="table[not(./tgroup)]" priority="0.1">
  <!-- Emit before text, though we realize emitting it here
      means it won't inherit properties set on the table element -->
  <xsl:apply-templates select="_sfe:BeforeOrAfterText[following-sibling::tbody]"
                       xmlns:_sfe="http://www.arbortext.com/namespace/Styler/StylerFormattingElements"/>
  <xsl:element name="{name(.)}">
    <xsl:attribute name="width">100%</xsl:attribute>
    <xsl:call-template name="copy-non-gte-attributes"/>
    <xsl:if test="$table.border.thickness.is.significant and not(@border) and (@frame and @frame!='void')">
      <!-- the default table border thickness is enough larger than the
           usual browser default that we want to reflect it. -->
      <xsl:attribute name="border">
        <xsl:value-of select="$table.border.thickness.in.pixels"/>
      </xsl:attribute>
    </xsl:if>
    
    <xsl:apply-templates mode="html-table"/>
  </xsl:element>
  <!-- Emit after text, though we realize emitting it here
      means it won't inherit properties set on the table element -->
  <xsl:apply-templates select="_sfe:BeforeOrAfterText[preceding-sibling::tbody]"
                       xmlns:_sfe="http://www.arbortext.com/namespace/Styler/StylerFormattingElements"/>
</xsl:template>

<xsl:template match="_sfe:BeforeOrAfterText" mode="html-table"
        xmlns:_sfe="http://www.arbortext.com/namespace/Styler/StylerFormattingElements">
  <!-- Toss _sfe:BeforeOrAfterText from within tables -->
</xsl:template>

<xsl:template match="caption" mode="html-table">
  <xsl:apply-templates select="."/>
</xsl:template>

<xsl:template match="col|colgroup" mode="html-table">
  <xsl:element name="{name(.)}">
    <xsl:call-template name="copy-non-gte-attributes"/>
    <xsl:apply-templates mode="html-table"/>
  </xsl:element>
</xsl:template>

<xsl:template match="thead" mode="html-table">
  <xsl:element name="{name(.)}">
    <xsl:call-template name="thead"/>
    <xsl:call-template name="copy-non-gte-attributes"/>
    <xsl:apply-templates mode="html-table"/>
  </xsl:element>
</xsl:template>

<xsl:template match="tfoot" mode="html-table">
  <xsl:element name="{name(.)}">
    <xsl:call-template name="tfoot"/>
    <xsl:call-template name="copy-non-gte-attributes"/>
    <xsl:apply-templates mode="html-table"/>
  </xsl:element>
</xsl:template>

<xsl:template match="tbody" mode="html-table">
  <xsl:element name="{name(.)}">
    <xsl:call-template name="tbody"/>
    <xsl:call-template name="copy-non-gte-attributes"/>
    <xsl:apply-templates mode="html-table"/>
  </xsl:element>
</xsl:template>

<xsl:template match="tr" mode="html-table">
  <xsl:element name="{name(.)}">
    <xsl:call-template name="htmltbl-tr"/>
    <xsl:call-template name="copy-non-gte-attributes"/>
    <xsl:apply-templates mode="html-table"/>
  </xsl:element>
</xsl:template>

<!-- Handle td and th including _cellfont -->

<xsl:template match="td|th" mode="html-table">
  <xsl:element name="{name(.)}">
    <xsl:choose>
      <xsl:when test="parent::*/parent::*[local-name(.)='thead' or local-name(.)='tfoot']">
        <xsl:call-template name="htmltbl-th">
          <xsl:with-param name="context" select="'thead'"/>
        </xsl:call-template>
      </xsl:when>
      <xsl:otherwise>
        <xsl:call-template name="htmltbl-td"/>
      </xsl:otherwise>
    </xsl:choose>
    <xsl:call-template name="copy-non-gte-attributes"/>
    
    <xsl:apply-templates/>
    
  </xsl:element>
</xsl:template>

</xsl:stylesheet>

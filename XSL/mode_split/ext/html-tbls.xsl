<?xml version="1.0"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
                version="1.0">

<!-- This file maps HTML tables into HTML -->

<!-- 
Revised 2003 March 2 (pbg):  
	Created 
Revised 2004 March 20 (pbg):  
	Augmented to call named templates defined by Styler 
Revised 2005 March 28 (pbg):  
	Set valign=top for thead, tfoot, tbody so that default
	matches that of CALS and XSL-FO and Epic (HTML defaults
	to middle)
Revised 2005 November 23 (pbg):  
	Added htmltbl-caption template and handling
-->

<xsl:import href="tbl-params.xsl"/>

<!-- This file is expected to be used in conjunction with pi.xsl
     (e.g., as loaded via the following inclusion of use-pi.xsl). -->

<xsl:include href="use-pi.xsl"/>

<!-- In particular, this code assumes certain definitions that
     are made in pi.xsl.  If pi.xsl is not being loaded, the
     following (currently commented out) definitions should be
     uncommented (but note that this means uses of _cellfont
     will be ignored).   -->

<!--

<xsl:template name="just-after-table-cell-stag"/>

<xsl:template name="just-before-table-cell-etag"/>

-->

<!-- This file is also expected to be used by a 5.1 or later Styler
     generated stylesheet.  In particular, it expects the various
     named templates to be defined.  If this is not the case, the 
     following (currently commented out) definitions should be
     uncommented.   -->

<!--

<xsl:template name="htmltbl-caption"/>

<xsl:template name="htmltbl-tr"/>

<xsl:template name="htmltbl-td"/>

<xsl:template name="htmltbl-th"/>

<xsl:template name="tbody"/>

<xsl:template name="thead"/>

<xsl:template name="tfoot"/>

-->

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

<xsl:template match="*[local-name(.)='table'][not(./*[local-name(.)='tgroup'])]" priority="0.1">
  <!-- Emit before text, though we realize emitting it here
      means it won't inherit properties set on the table element -->
  <xsl:apply-templates select="_sfe:BeforeOrAfterText[following-sibling::*[local-name(.)='tbody']]"
        xmlns:_sfe="http://www.arbortext.com/namespace/Styler/StylerFormattingElements"/>
  <xsl:element name="{name(.)}">
    <!-- If there is no PubTbl tgroup dispwid PI, we set width to 100% -->
    <xsl:if test="not(processing-instruction('PubTbl')[starts-with(.,'tgroup')
             and contains(.,'dispwid=')])">
      <xsl:attribute name="width">100%</xsl:attribute>
    </xsl:if>
    <xsl:call-template name="copy-non-gte-attributes"/>
    <xsl:if test="$table.border.thickness.is.significant and
                  not(@border) and (@frame and @frame!='void') and
                  not(processing-instruction('PubTbl')
                       [starts-with(.,'table') and contains(.,'border')])">
      <!-- the default table border thickness is enough larger than the
           usual browser default that we want to reflect it. -->
      <xsl:attribute name="border">
        <xsl:value-of select="$table.border.thickness.in.pixels"/>
      </xsl:attribute>
    </xsl:if>
    <xsl:variable name="border-style-props">
      <!-- As of 2011 April 11, we still need to set border-color to black to
           address an IE 7 bug, but we do that via a global CSS rule.
      <xsl:text> border-color: #000000; </xsl:text>
      -->
      <!-- If this table has any border PIs, we set border-collapse: collapse.
           We avoid doing this if there are no border PIs because doing so
           causes IE (7 at least) not to show non-frame rules that should
           otherwise show.  Omitting border-collapse also causes the rules
           to default to a 3D look in some browsers.
           As of 2011 April 11, we still need to set border-collapse, in fact
           we want to do that in all cases, but we do that via a global CSS rule.
      <xsl:if test=".//processing-instruction('PubTbl')[contains(.,'border')]">
        <xsl:text> border-collapse: collapse; </xsl:text>
      </xsl:if>
      -->
      <xsl:if test="processing-instruction('PubTbl')
                       [starts-with(.,'table') and contains(.,'border')]">
        <!-- We have a table-level border PI we need to process. -->
        <xsl:call-template name="set-border-style-props">
          <xsl:with-param name="frame" select="1"/>
        </xsl:call-template>
      </xsl:if>
    </xsl:variable>
    <xsl:if test="$border-style-props!=''">
      <xsl:attribute name="style">
        <xsl:if test="@style">
          <!-- Include @style from the input if any -->
          <xsl:value-of select="@style"/>
          <xsl:text>;</xsl:text>
        </xsl:if>
        <xsl:value-of select="$border-style-props"/>
      </xsl:attribute>
    </xsl:if>
    <xsl:apply-templates mode="html-table"/>
  </xsl:element>
  <!-- Emit after text, though we realize emitting it here
      means it won't inherit properties set on the table element -->
  <xsl:apply-templates select="_sfe:BeforeOrAfterText[preceding-sibling::*[local-name(.)='tbody']]"
        xmlns:_sfe="http://www.arbortext.com/namespace/Styler/StylerFormattingElements"/>
</xsl:template>

<xsl:template match="_sfe:BeforeOrAfterText" mode="html-table"
        xmlns:_sfe="http://www.arbortext.com/namespace/Styler/StylerFormattingElements">
  <!-- Toss _sfe:BeforeOrAfterText from within tables -->
</xsl:template>

<xsl:template match="*[local-name(.)='caption']" mode="html-table">
  <!-- As of 2009 June 5, we just process the caption via the styler-determined
       templates: SPR 1812425. -->
  <xsl:apply-templates select="."/>
  <!--
  <xsl:element name="{name(.)}">
    <xsl:call-template name="htmltbl-caption"/>
    <xsl:call-template name="copy-non-gte-attributes"/>
    <xsl:apply-templates/>
  </xsl:element>
  -->
</xsl:template>

<xsl:template match="*[local-name(.)='col']|
                     *[local-name(.)='colgroup']" mode="html-table">
  <xsl:element name="{name(.)}">
    <xsl:call-template name="copy-non-gte-attributes"/>
    <xsl:apply-templates mode="html-table"/>
  </xsl:element>
</xsl:template>

<xsl:template match="*[local-name(.)='thead']" mode="html-table">
  <xsl:element name="{name(.)}">
    <xsl:call-template name="thead"/>
    <xsl:call-template name="copy-non-gte-attributes"/>
    <xsl:apply-templates mode="html-table"/>
  </xsl:element>
</xsl:template>

<xsl:template match="*[local-name(.)='tfoot']" mode="html-table">
  <xsl:element name="{name(.)}">
    <xsl:call-template name="tfoot"/>
    <xsl:call-template name="copy-non-gte-attributes"/>
    <xsl:apply-templates mode="html-table"/>
  </xsl:element>
</xsl:template>

<xsl:template match="*[local-name(.)='tbody']" mode="html-table">
  <xsl:element name="{name(.)}">
    <xsl:call-template name="tbody"/>
    <xsl:call-template name="copy-non-gte-attributes"/>
    <xsl:apply-templates mode="html-table"/>
  </xsl:element>
</xsl:template>

<xsl:template match="*[local-name(.)='tr']" mode="html-table">
  <xsl:element name="{name(.)}">
    <xsl:call-template name="htmltbl-tr"/>
    <xsl:call-template name="copy-non-gte-attributes"/>
    <xsl:apply-templates mode="html-table"/>
  </xsl:element>
</xsl:template>

<!-- Handle td and th including _cellfont -->

<xsl:template match="*[local-name(.)='td' or local-name(.)='th']" mode="html-table">
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
    <xsl:if test="ancestor-or-self::*/processing-instruction('PubTbl')
                     [starts-with(.,'cell') and contains(.,'border')]">
      <!-- We have a cell- or row-level border PI we need to process. -->
      <xsl:variable name="lastrow">
        <xsl:call-template name="set-lastrow"/>
      </xsl:variable>
      <xsl:variable name="lastcol">
        <xsl:call-template name="set-lastcol"/>
      </xsl:variable>
      <xsl:variable name="border-style-props">
        <xsl:call-template name="set-border-style-props">
          <xsl:with-param name="lastrow" select="$lastrow"/>
          <xsl:with-param name="lastcol" select="$lastcol"/>
        </xsl:call-template>
      </xsl:variable>
      <xsl:if test="$border-style-props!=''">
        <xsl:attribute name="style">
          <xsl:if test="@style">
            <!-- Include @style from the input if any -->
            <xsl:value-of select="@style"/>
            <xsl:text>;</xsl:text>
          </xsl:if>
          <xsl:value-of select="$border-style-props"/>
        </xsl:attribute>
      </xsl:if>
    </xsl:if>
    <!-- ***** first added call to handle _cellfont ***** -->
    <xsl:call-template name="just-after-table-cell-stag"/>
    <!-- ***** end added line ***** -->
    <xsl:apply-templates/>
    <!-- ***** second added call to handle _cellfont ***** -->
    <xsl:call-template name="just-before-table-cell-etag"/>
    <!-- ***** end added line ***** -->
  </xsl:element>
</xsl:template>

<xsl:template name="set-border-style-props">
    <xsl:param name="frame" select="0"/>
    <xsl:param name="lastrow" select="0"/>
    <xsl:param name="lastcol" select="0"/>

  <xsl:if test="$frame=1">
        <xsl:variable name="border-left-style">
          <xsl:call-template name="get-border-prop">
            <xsl:with-param name="side" select="'left'"/>
            <xsl:with-param name="prop" select="'style'"/>
            <xsl:with-param name="frame" select="1"/>
            <xsl:with-param name="table-type" select="'html'"/>
          </xsl:call-template>
        </xsl:variable>

        <xsl:variable name="border-top-style">
          <xsl:call-template name="get-border-prop">
            <xsl:with-param name="side" select="'top'"/>
            <xsl:with-param name="prop" select="'style'"/>
            <xsl:with-param name="frame" select="1"/>
            <xsl:with-param name="table-type" select="'html'"/>
          </xsl:call-template>
        </xsl:variable>

        <xsl:text>border-left-style: </xsl:text>
        <xsl:value-of select="$border-left-style"/>
        <xsl:text>; </xsl:text>
        <xsl:if test="$border-left-style!='none' and $border-left-style!='hidden'">
          <xsl:text>border-left-width: </xsl:text>
          <xsl:call-template name="get-border-prop">
            <xsl:with-param name="side" select="'left'"/>
            <xsl:with-param name="prop" select="'width'"/>
            <xsl:with-param name="frame" select="1"/>
            <xsl:with-param name="table-type" select="'html'"/>
          </xsl:call-template>
          <xsl:text>; </xsl:text>
          <xsl:variable name="temp">
           <xsl:call-template name="get-border-prop">
            <xsl:with-param name="side" select="'left'"/>
            <xsl:with-param name="prop" select="'color'"/>
            <xsl:with-param name="frame" select="1"/>
            <xsl:with-param name="table-type" select="'html'"/>
           </xsl:call-template>
          </xsl:variable>
          <xsl:if test="$temp!='#000000' or $emit-black-border-color='yes'">
            <xsl:text>border-left-color: </xsl:text>
            <xsl:value-of select="$temp"/>
            <xsl:text>; </xsl:text>
          </xsl:if>
        </xsl:if>

        <xsl:text>border-top-style: </xsl:text>
        <xsl:value-of select="$border-top-style"/>
        <xsl:text>; </xsl:text>
        <xsl:if test="$border-top-style!='none' and $border-top-style!='hidden'">
          <xsl:text>border-top-width: </xsl:text>
          <xsl:call-template name="get-border-prop">
            <xsl:with-param name="side" select="'top'"/>
            <xsl:with-param name="prop" select="'width'"/>
            <xsl:with-param name="frame" select="1"/>
            <xsl:with-param name="table-type" select="'html'"/>
          </xsl:call-template>
          <xsl:text>; </xsl:text>
          <xsl:variable name="temp">
           <xsl:call-template name="get-border-prop">
            <xsl:with-param name="side" select="'top'"/>
            <xsl:with-param name="prop" select="'color'"/>
            <xsl:with-param name="frame" select="1"/>
            <xsl:with-param name="table-type" select="'html'"/>
           </xsl:call-template>
          </xsl:variable>
          <xsl:if test="$temp!='#000000' or $emit-black-border-color='yes'">
            <xsl:text>border-top-color: </xsl:text>
            <xsl:value-of select="$temp"/>
            <xsl:text>; </xsl:text>
          </xsl:if>
        </xsl:if>
  </xsl:if>

        <xsl:variable name="border-right-style">
          <xsl:call-template name="get-border-prop">
            <xsl:with-param name="side" select="'right'"/>
            <xsl:with-param name="prop" select="'style'"/>
            <xsl:with-param name="frame" select="$frame"/>
            <xsl:with-param name="lastrow" select="$lastrow"/>
            <xsl:with-param name="lastcol" select="$lastcol"/>
            <xsl:with-param name="table-type" select="'html'"/>
          </xsl:call-template>
        </xsl:variable>

        <xsl:variable name="border-bottom-style">
          <xsl:call-template name="get-border-prop">
            <xsl:with-param name="side" select="'bottom'"/>
            <xsl:with-param name="prop" select="'style'"/>
            <xsl:with-param name="frame" select="$frame"/>
            <xsl:with-param name="lastrow" select="$lastrow"/>
            <xsl:with-param name="lastcol" select="$lastcol"/>
            <xsl:with-param name="table-type" select="'html'"/>
          </xsl:call-template>
        </xsl:variable>

        <xsl:text>border-right-style: </xsl:text>
        <xsl:value-of select="$border-right-style"/>
        <xsl:text>; </xsl:text>
        <xsl:if test="$border-right-style!='none' and $border-right-style!='hidden'">
          <xsl:text>border-right-width: </xsl:text>
          <xsl:call-template name="get-border-prop">
            <xsl:with-param name="side" select="'right'"/>
            <xsl:with-param name="prop" select="'width'"/>
            <xsl:with-param name="frame" select="$frame"/>
            <xsl:with-param name="lastrow" select="$lastrow"/>
            <xsl:with-param name="lastcol" select="$lastcol"/>
            <xsl:with-param name="table-type" select="'html'"/>
          </xsl:call-template>
          <xsl:text>; </xsl:text>
          <xsl:variable name="temp">
           <xsl:call-template name="get-border-prop">
            <xsl:with-param name="side" select="'right'"/>
            <xsl:with-param name="prop" select="'color'"/>
            <xsl:with-param name="frame" select="$frame"/>
            <xsl:with-param name="lastrow" select="$lastrow"/>
            <xsl:with-param name="lastcol" select="$lastcol"/>
            <xsl:with-param name="table-type" select="'html'"/>
           </xsl:call-template>
          </xsl:variable>
          <xsl:if test="$temp!='#000000' or $emit-black-border-color='yes'">
            <xsl:text>border-right-color: </xsl:text>
            <xsl:value-of select="$temp"/>
            <xsl:text>; </xsl:text>
          </xsl:if>
        </xsl:if>

        <xsl:text>border-bottom-style: </xsl:text>
        <xsl:value-of select="$border-bottom-style"/>
        <xsl:text>; </xsl:text>
        <xsl:if test="$border-bottom-style!='none' and $border-bottom-style!='hidden'">
          <xsl:text>border-bottom-width: </xsl:text>
          <xsl:call-template name="get-border-prop">
            <xsl:with-param name="side" select="'bottom'"/>
            <xsl:with-param name="prop" select="'width'"/>
            <xsl:with-param name="frame" select="$frame"/>
            <xsl:with-param name="lastrow" select="$lastrow"/>
            <xsl:with-param name="lastcol" select="$lastcol"/>
            <xsl:with-param name="table-type" select="'html'"/>
          </xsl:call-template>
          <xsl:text>; </xsl:text>
          <xsl:variable name="temp">
           <xsl:call-template name="get-border-prop">
            <xsl:with-param name="side" select="'bottom'"/>
            <xsl:with-param name="prop" select="'color'"/>
            <xsl:with-param name="frame" select="$frame"/>
            <xsl:with-param name="lastrow" select="$lastrow"/>
            <xsl:with-param name="lastcol" select="$lastcol"/>
            <xsl:with-param name="table-type" select="'html'"/>
           </xsl:call-template>
          </xsl:variable>
          <xsl:if test="$temp!='#000000' or $emit-black-border-color='yes'">
            <xsl:text>border-bottom-color: </xsl:text>
            <xsl:value-of select="$temp"/>
            <xsl:text>; </xsl:text>
          </xsl:if>
        </xsl:if>
</xsl:template>

</xsl:stylesheet>

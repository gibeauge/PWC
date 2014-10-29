<?xml version='1.0'?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
                xmlns:exslt="http://exslt.org/common" 
                xmlns:msxsl="urn:schemas-microsoft-com:xslt" 
                xmlns="http://www.w3.org/1999/xhtml"
                exclude-result-prefixes="exslt msxsl"
                version='1.0'>

<!-- **********************************************************
       tbls.xsl - transforms OASIS Exchange tables into HTML
     ********************************************************** -->

<xsl:import href="tbl-params.xsl"/>

<!-- tbl-params.xsl sets the following parameters: 
<xsl:param name="thead.tfoot.style">font-weight: bold; </xsl:param>
<xsl:param name="obey-col_and_row-sep" select="'1'"/>
<xsl:param name="proportional-colwidth-supported" select="'no'"/>
<xsl:param name="special-docbook-table-footnote-handling" select="'no'"/>
<xsl:param name="inhibit-default-colwidth-emission" select="'0'"/>
-->

<xsl:param name="bgcolor-attrname" select="'bgcolor'"/>

<xsl:template match="*[local-name(.)='tgroup']" priority="0.1">
  <table>

    <xsl:choose>
      <xsl:when test="count(preceding-sibling::*[local-name(.)='tgroup'])=0">
        <xsl:call-template name="tgroup.first"/>
      </xsl:when>
      <xsl:otherwise>
        <xsl:call-template name="tgroup.notfirst"/>
      </xsl:otherwise>
    </xsl:choose>

    <!-- Here we handle cellpadding values -->
    <xsl:variable name="cellpadding">
      <xsl:call-template name="parse-cmarg-pi">
        <xsl:with-param name="side" select="'all'"/>
      </xsl:call-template>
    </xsl:variable>

    <xsl:if test="$cellpadding!=''">
      <xsl:attribute name="cellpadding">
        <xsl:value-of select="$cellpadding"/>
      </xsl:attribute>
    </xsl:if>

    <!-- If there is no PubTbl tgroup dispwid PI, we set width to 100%
         unless there is at least one colspec with an explicit absolute
         (non-proportional) colwidth -->
    <xsl:if test="../@pgwide=1 or
         not(processing-instruction('PubTbl')[starts-with(.,'tgroup')
             and contains(.,'dispwid=')]) and
         not(*[local-name(.)='colspec']/@colwidth[substring(.,string-length(.))!='*'])">
      <xsl:attribute name="width">100%</xsl:attribute>
    </xsl:if>

    <!-- We are still always setting the html:table/@frame attribute -->
    <xsl:choose>
      <xsl:when test="../@frame='none'">
        <xsl:attribute name="frame">void</xsl:attribute>
      </xsl:when>
      <xsl:when test="../@frame='all'">
        <xsl:attribute name="frame">box</xsl:attribute>
      </xsl:when>
      <xsl:when test="../@frame='bottom'">
        <xsl:attribute name="frame">below</xsl:attribute>
      </xsl:when>
      <xsl:when test="../@frame='sides'">
        <xsl:attribute name="frame">vsides</xsl:attribute>
      </xsl:when>
      <xsl:when test="../@frame='top'">
        <xsl:attribute name="frame">above</xsl:attribute>
      </xsl:when>
      <xsl:when test="../@frame='topbot'">
        <xsl:attribute name="frame">hsides</xsl:attribute>
      </xsl:when>
      <xsl:otherwise>
        <xsl:attribute name="frame">box</xsl:attribute>
      </xsl:otherwise>
    </xsl:choose>

    <xsl:variable name="must-set-individual-borders"
          select="$obey-col_and_row-sep='1' and 
              (parent::*//processing-instruction('PubTbl')[contains(.,'border')] or
              (.//*/@colsep='0' and .//*/@colsep='1') or (.//*/@rowsep='0' and .//*/@rowsep='1'))"/>

    <xsl:choose>
      <xsl:when test="$must-set-individual-borders">

        <xsl:attribute name="rules">none</xsl:attribute>

        <!-- Now fiddle around to set the style attribute using the node-set()
             extension so that we can capture the value of the style attribute
             that is set by the existing tgroup.first and tgroup.notfirst templates. -->
        <xsl:variable name="temp-table-element">
          <xsl:element name="___temp-styler-table-element">
            <xsl:choose>
              <xsl:when test="count(preceding-sibling::*[local-name(.)='tgroup'])=0">
                <xsl:call-template name="tgroup.first"/>
              </xsl:when>
              <xsl:otherwise>
                <xsl:call-template name="tgroup.notfirst"/>
              </xsl:otherwise>
            </xsl:choose>
          </xsl:element>
        </xsl:variable>
        <xsl:variable name="tgroup-style-props">
          <xsl:choose>
            <xsl:when test="function-available('exslt:node-set')">
              <xsl:apply-templates select="exslt:node-set($temp-table-element)/node()"/>
            </xsl:when>
            <xsl:when test="function-available('msxsl:node-set')">
              <xsl:apply-templates select="msxsl:node-set($temp-table-element)/node()"/>
            </xsl:when>
          </xsl:choose>
        </xsl:variable>

    <xsl:variable name="border-style-props">
      <xsl:if test="$obey-col_and_row-sep='1' and
               parent::*//processing-instruction('PubTbl')[contains(.,'border')]">
        <!-- If this table contains no border PIs, leave border-style-props null
             so that we basically fall back to "old style" border determination. -->

        <xsl:variable name="border-left-style">
          <xsl:call-template name="get-border-prop">
            <xsl:with-param name="side" select="'left'"/>
            <xsl:with-param name="prop" select="'style'"/>
            <xsl:with-param name="frame" select="1"/>
          </xsl:call-template>
        </xsl:variable>

        <xsl:variable name="border-top-style">
          <xsl:call-template name="get-border-prop">
            <xsl:with-param name="side" select="'top'"/>
            <xsl:with-param name="prop" select="'style'"/>
            <xsl:with-param name="frame" select="1"/>
          </xsl:call-template>
        </xsl:variable>

        <xsl:variable name="border-right-style">
          <xsl:call-template name="get-border-prop">
            <xsl:with-param name="side" select="'right'"/>
            <xsl:with-param name="prop" select="'style'"/>
            <xsl:with-param name="frame" select="1"/>
          </xsl:call-template>
        </xsl:variable>

        <xsl:variable name="border-bottom-style">
          <xsl:call-template name="get-border-prop">
            <xsl:with-param name="side" select="'bottom'"/>
            <xsl:with-param name="prop" select="'style'"/>
            <xsl:with-param name="frame" select="1"/>
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
          </xsl:call-template>
          <xsl:text>; </xsl:text>
          <xsl:variable name="temp">
           <xsl:call-template name="get-border-prop">
            <xsl:with-param name="side" select="'left'"/>
            <xsl:with-param name="prop" select="'color'"/>
            <xsl:with-param name="frame" select="1"/>
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
          </xsl:call-template>
          <xsl:text>; </xsl:text>
          <xsl:variable name="temp">
           <xsl:call-template name="get-border-prop">
            <xsl:with-param name="side" select="'top'"/>
            <xsl:with-param name="prop" select="'color'"/>
            <xsl:with-param name="frame" select="1"/>
           </xsl:call-template>
          </xsl:variable>
          <xsl:if test="$temp!='#000000' or $emit-black-border-color='yes'">
            <xsl:text>border-top-color: </xsl:text>
            <xsl:value-of select="$temp"/>
            <xsl:text>; </xsl:text>
          </xsl:if>
        </xsl:if>

        <xsl:text>border-right-style: </xsl:text>
        <xsl:value-of select="$border-right-style"/>
        <xsl:text>; </xsl:text>
        <xsl:if test="$border-right-style!='none' and $border-right-style!='hidden'">
          <xsl:text>border-right-width: </xsl:text>
          <xsl:call-template name="get-border-prop">
            <xsl:with-param name="side" select="'right'"/>
            <xsl:with-param name="prop" select="'width'"/>
            <xsl:with-param name="frame" select="1"/>
          </xsl:call-template>
          <xsl:text>; </xsl:text>
          <xsl:variable name="temp">
           <xsl:call-template name="get-border-prop">
            <xsl:with-param name="side" select="'right'"/>
            <xsl:with-param name="prop" select="'color'"/>
            <xsl:with-param name="frame" select="1"/>
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
            <xsl:with-param name="frame" select="1"/>
          </xsl:call-template>
          <xsl:text>; </xsl:text>
          <xsl:variable name="temp">
           <xsl:call-template name="get-border-prop">
            <xsl:with-param name="side" select="'bottom'"/>
            <xsl:with-param name="prop" select="'color'"/>
            <xsl:with-param name="frame" select="1"/>
           </xsl:call-template>
          </xsl:variable>
          <xsl:if test="$temp!='#000000' or $emit-black-border-color='yes'">
            <xsl:text>border-bottom-color: </xsl:text>
            <xsl:value-of select="$temp"/>
            <xsl:text>; </xsl:text>
          </xsl:if>
        </xsl:if>
      </xsl:if>
    </xsl:variable>

        <xsl:variable name="style-value">
          <xsl:value-of select="$tgroup-style-props"/>
          <!-- As of 2009 Dec 1, we add border-color: #000000 to address an IE bug,
               though as of 2011 April 11, we do it via a global CSS rule.
          <xsl:text> border-color: #000000; border-collapse: collapse; </xsl:text>
          -->
          <xsl:choose>
            <xsl:when test="$border-style-props != ''">
              <xsl:value-of select="$border-style-props"/>
            </xsl:when>
            <xsl:when test="$table.border.thickness.is.significant and @frame!='none'">
              <xsl:text>border-width: </xsl:text>
              <xsl:value-of select="$table.border.thickness"/>
              <xsl:text>; </xsl:text>
            </xsl:when>
          </xsl:choose>
        </xsl:variable>
        <xsl:if test="$style-value!=''">
          <xsl:attribute name="style">
            <xsl:value-of select="$style-value"/>
          </xsl:attribute>
        </xsl:if>
      </xsl:when>
      <xsl:otherwise>
        <!-- If obey-col_and_row-sep isn't 1, retain older behavior -->
        <xsl:attribute name="border">
          <xsl:value-of select="$table.border.thickness.in.pixels"/>
        </xsl:attribute>

        <!-- Default colsep and rowsep to 1 unless frame='none' -->
        <xsl:variable name="colsep">
          <xsl:choose>
            <xsl:when test="../@colsep='0'">0</xsl:when>
            <xsl:when test="../@frame='none'">0</xsl:when>
            <xsl:otherwise>1</xsl:otherwise>
          </xsl:choose>
        </xsl:variable>
        <xsl:variable name="rowsep">
          <xsl:choose>
            <xsl:when test="../@rowsep='0'">0</xsl:when>
            <xsl:when test="../@frame='none'">0</xsl:when>
            <xsl:otherwise>1</xsl:otherwise>
          </xsl:choose>
        </xsl:variable>
        <xsl:choose>
          <xsl:when test="$colsep='1' and $rowsep='1'">
            <xsl:attribute name="rules">all</xsl:attribute>
          </xsl:when>
          <xsl:when test="$colsep='1'">
            <xsl:attribute name="rules">cols</xsl:attribute>
          </xsl:when>
          <xsl:when test="$rowsep='1'">
            <xsl:attribute name="rules">rows</xsl:attribute>
          </xsl:when>
          <xsl:otherwise>
            <xsl:attribute name="rules">none</xsl:attribute>
          </xsl:otherwise>
        </xsl:choose>
      </xsl:otherwise>
    </xsl:choose>

    <colgroup>
      <xsl:call-template name="generate.colgroup">
        <xsl:with-param name="cols" select="@cols"/>
      </xsl:call-template>
    </colgroup>
    <xsl:apply-templates mode="cals-table"/>

    <xsl:if test=".//*[local-name(.)='footnote'] and $special-docbook-table-footnote-handling='yes'">
      <tr>
        <td colspan="{@cols}">
          <xsl:apply-templates select=".//*[local-name(.)='footnote']" 
                               mode="table.footnote.mode"/>
        </td>
      </tr>
    </xsl:if>
  </table>
</xsl:template>

<xsl:template match="*[local-name(.)='footnote']" mode="table.footnote.mode">
  <xsl:apply-templates select=".//_gte:FootnoteBody" 
       xmlns:_gte="http://www.arbortext.com/namespace/Styler/GeneratedTextElements"/>
</xsl:template>

<xsl:template match="___temp-styler-table-element">
  <xsl:value-of select="@style"/>
</xsl:template>

<xsl:template name="parse-cmarg-pi">
    <xsl:param name="side" select="'all'"/>
    <xsl:param name="cmarg-pi" 
        select="string(processing-instruction('PubTbl')
             [starts-with(.,'tgroup') and contains(.,'marg=')])"/>
  <xsl:variable name="default-marg" select="'5pt'"/>
  <!-- Might be nice to use $table.cell.padding.amount here someday,
       but we have to be sure it's declared only once, and that's
       trickier than I want to get right now. -->
  <xsl:variable name="default-marg-pixels">
    <xsl:call-template name="size-to-pixels">
      <xsl:with-param name="size" select="$default-marg"/>
    </xsl:call-template>
  </xsl:variable>
  <xsl:if test="$cmarg-pi='' and $side='all'">
    <xsl:value-of select="$default-marg-pixels"/>
  </xsl:if>
  <xsl:if test="$cmarg-pi!=''">
    <xsl:variable name="crmarg">
      <xsl:variable name="marg-pi2">
        <xsl:call-template name="get-pi-attr-value">
          <xsl:with-param name="pi" select="$cmarg-pi"/>
          <xsl:with-param name="piattr" select="'crmarg'"/>
        </xsl:call-template>
      </xsl:variable>
      <xsl:choose>
        <xsl:when test="$marg-pi2 != ''">
          <xsl:value-of select="$marg-pi2"/>
        </xsl:when>
        <xsl:otherwise>
          <xsl:value-of select="$default-marg"/>
        </xsl:otherwise>
      </xsl:choose>
    </xsl:variable>
    <xsl:variable name="clmarg">
      <xsl:variable name="marg-pi2">
        <xsl:call-template name="get-pi-attr-value">
          <xsl:with-param name="pi" select="$cmarg-pi"/>
          <xsl:with-param name="piattr" select="'clmarg'"/>
        </xsl:call-template>
      </xsl:variable>
      <xsl:choose>
        <xsl:when test="$marg-pi2 != ''">
          <xsl:value-of select="$marg-pi2"/>
        </xsl:when>
        <xsl:otherwise>
          <xsl:value-of select="$default-marg"/>
        </xsl:otherwise>
      </xsl:choose>
    </xsl:variable>
    <xsl:variable name="ctmarg">
      <xsl:variable name="marg-pi2">
        <xsl:call-template name="get-pi-attr-value">
          <xsl:with-param name="pi" select="$cmarg-pi"/>
          <xsl:with-param name="piattr" select="'ctmarg'"/>
        </xsl:call-template>
      </xsl:variable>
      <xsl:choose>
        <xsl:when test="$marg-pi2 != ''">
          <xsl:value-of select="$marg-pi2"/>
        </xsl:when>
        <xsl:otherwise>
          <xsl:value-of select="$default-marg"/>
        </xsl:otherwise>
      </xsl:choose>
    </xsl:variable>
    <xsl:variable name="cbmarg">
      <xsl:variable name="marg-pi2">
        <xsl:call-template name="get-pi-attr-value">
          <xsl:with-param name="pi" select="$cmarg-pi"/>
          <xsl:with-param name="piattr" select="'cbmarg'"/>
        </xsl:call-template>
      </xsl:variable>
      <xsl:choose>
        <xsl:when test="$marg-pi2 != ''">
          <xsl:value-of select="$marg-pi2"/>
        </xsl:when>
        <xsl:otherwise>
          <xsl:value-of select="$default-marg"/>
        </xsl:otherwise>
      </xsl:choose>
    </xsl:variable>
    <xsl:choose>
      <xsl:when test="$side='left'">
        <xsl:value-of select="$clmarg"/>
      </xsl:when>
      <xsl:when test="$side='right'">
        <xsl:value-of select="$crmarg"/>
      </xsl:when>
      <xsl:when test="$side='top'">
        <xsl:value-of select="$ctmarg"/>
      </xsl:when>
      <xsl:when test="$side='bottom'">
        <xsl:value-of select="$cbmarg"/>
      </xsl:when>
      <xsl:when test="$side='all'">
        <xsl:if test="($crmarg=$clmarg) and ($crmarg=$ctmarg) and ($crmarg=$cbmarg)">
          <xsl:call-template name="size-to-pixels">
            <xsl:with-param name="size" select="$crmarg"/>
          </xsl:call-template>
        </xsl:if>
      </xsl:when>
    </xsl:choose>
  </xsl:if>
</xsl:template>

<xsl:template match="*[local-name(.)='colspec']" mode="cals-table"></xsl:template>

<xsl:template match="*[local-name(.)='spanspec']" mode="cals-table"></xsl:template>

<xsl:template match="*[local-name(.)='thead']" mode="cals-table">
  <thead valign="{$default-thead-valign}">
    <xsl:if test="normalize-space($thead.tfoot.style) != ''">
      <xsl:attribute name="style">
        <xsl:value-of select="$thead.tfoot.style"/>
      </xsl:attribute>
    </xsl:if>
    <xsl:call-template name="thead"/>
    <xsl:if test="@align">
      <xsl:attribute name="align">
        <xsl:value-of select="@align"/>
      </xsl:attribute>
    </xsl:if>
    <!-- As of 2009 June 4, we default thead align to left -->
    <xsl:if test="not(@align)">
      <xsl:attribute name="align">left</xsl:attribute>
    </xsl:if>
    <xsl:if test="@char">
      <xsl:attribute name="char">
        <xsl:value-of select="@char"/>
      </xsl:attribute>
    </xsl:if>
    <xsl:if test="@charoff">
      <xsl:attribute name="charoff">
        <xsl:value-of select="@charoff"/>
      </xsl:attribute>
    </xsl:if>
    <xsl:if test="@valign">
      <xsl:attribute name="valign">
        <xsl:value-of select="@valign"/>
      </xsl:attribute>
    </xsl:if>

    <xsl:apply-templates mode="cals-table"/>
  </thead>
</xsl:template>

<xsl:template match="*[local-name(.)='tfoot']" mode="cals-table">
  <tfoot valign="top">
    <xsl:if test="normalize-space($thead.tfoot.style) != ''">
      <xsl:attribute name="style">
        <xsl:value-of select="$thead.tfoot.style"/>
      </xsl:attribute>
    </xsl:if>
    <xsl:call-template name="tfoot"/>
    <xsl:if test="@align">
      <xsl:attribute name="align">
        <xsl:value-of select="@align"/>
      </xsl:attribute>
    </xsl:if>
    <!-- As of 2009 June 4, we default tfoot align to left -->
    <xsl:if test="not(@align)">
      <xsl:attribute name="align">left</xsl:attribute>
    </xsl:if>
    <xsl:if test="@char">
      <xsl:attribute name="char">
        <xsl:value-of select="@char"/>
      </xsl:attribute>
    </xsl:if>
    <xsl:if test="@charoff">
      <xsl:attribute name="charoff">
        <xsl:value-of select="@charoff"/>
      </xsl:attribute>
    </xsl:if>
    <xsl:if test="@valign">
      <xsl:attribute name="valign">
        <xsl:value-of select="@valign"/>
      </xsl:attribute>
    </xsl:if>

    <xsl:apply-templates mode="cals-table"/>
  </tfoot>
</xsl:template>

<xsl:template match="*[local-name(.)='tbody']" mode="cals-table">
  <tbody valign="top">
    <xsl:call-template name="tbody"/>
    <xsl:if test="@align">
      <xsl:attribute name="align">
        <xsl:value-of select="@align"/>
      </xsl:attribute>
    </xsl:if>
    <xsl:if test="@char">
      <xsl:attribute name="char">
        <xsl:value-of select="@char"/>
      </xsl:attribute>
    </xsl:if>
    <xsl:if test="@charoff">
      <xsl:attribute name="charoff">
        <xsl:value-of select="@charoff"/>
      </xsl:attribute>
    </xsl:if>
    <xsl:if test="@valign">
      <xsl:attribute name="valign">
        <xsl:value-of select="@valign"/>
      </xsl:attribute>
    </xsl:if>

    <xsl:apply-templates mode="cals-table"/>
  </tbody>
</xsl:template>

<xsl:template match="*[local-name(.)='row']" mode="cals-table">
  <tr>
    <xsl:call-template name="row"/>
    <xsl:if test="@valign">
      <xsl:attribute name="valign">
        <xsl:value-of select="@valign"/>
      </xsl:attribute>
    </xsl:if>

    <xsl:apply-templates mode="cals-table"/>
  </tr>
</xsl:template>

<xsl:template match="*[local-name(.)='thead']/*[local-name(.)='row']/*[local-name(.)='entry']" mode="cals-table">
  <xsl:call-template name="process.cell">
    <xsl:with-param name="cellgi">th</xsl:with-param>
    <xsl:with-param name="context">thead</xsl:with-param>
  </xsl:call-template>
</xsl:template>

<xsl:template match="*[local-name(.)='tfoot']/*[local-name(.)='row']/*[local-name(.)='entry']" mode="cals-table">
  <xsl:call-template name="process.cell">
    <xsl:with-param name="cellgi">th</xsl:with-param>
    <xsl:with-param name="context">tfoot</xsl:with-param>
  </xsl:call-template>
</xsl:template>

<xsl:template match="*[local-name(.)='tbody']/*[local-name(.)='row']/*[local-name(.)='entry']" mode="cals-table">
  <xsl:call-template name="process.cell">
    <xsl:with-param name="cellgi">td</xsl:with-param>
  </xsl:call-template>
</xsl:template>

<xsl:template name="process.cell">
    <xsl:param name="cellgi">td</xsl:param>
    <xsl:param name="context">tbody</xsl:param>
    <xsl:param name="spans" select="''"/>

 <xsl:variable name="empty.cell" select="count(node()) = 0"/>

 <!-- If the cell is empty and it is the only entry in this row,
      we assume it is there only for the purposes of being spanned
      down into, and we don't emit anything, since this implies
      an extra unwanted column to HTML browsers. -->

 <xsl:if test="not($empty.cell and (count(../*[local-name(.)='entry'])=1))">

  <xsl:variable name="named.colnum">
    <xsl:call-template name="entry.colnum"/>
  </xsl:variable>

  <xsl:variable name="entry.colnum">
    <xsl:choose>
      <xsl:when test="$named.colnum &gt; 0">
        <xsl:value-of select="$named.colnum"/>
      </xsl:when>
      <xsl:otherwise>
        <xsl:value-of select="count(preceding-sibling::*[local-name(.)='entry']) + 1"/>
      </xsl:otherwise>
    </xsl:choose>
  </xsl:variable>

  <xsl:variable name="entry.colspan">
    <xsl:choose>
      <xsl:when test="@spanname or @namest">
        <xsl:call-template name="calculate.colspan"/>
      </xsl:when>
      <xsl:otherwise>1</xsl:otherwise>
    </xsl:choose>
  </xsl:variable>

  <xsl:variable name="following.spans">
    <xsl:call-template name="calculate.following.spans">
      <xsl:with-param name="colspan" select="$entry.colspan"/>
      <xsl:with-param name="spans" select="$spans"/>
    </xsl:call-template>
  </xsl:variable>

  <xsl:variable name="entry.row" select="ancestor-or-self::*[local-name(.)='row'][1]"/>

  <xsl:variable name="lastrow">
    <xsl:call-template name="set-lastrow"/>
  </xsl:variable>

  <xsl:variable name="lastcol">
    <xsl:call-template name="set-lastcol">
      <xsl:with-param name="col" select="$entry.colnum"/>
    </xsl:call-template>
  </xsl:variable>

  <xsl:variable name="align">
    <xsl:call-template name="inherited.table.attribute">
      <xsl:with-param name="entry" select="."/>
      <xsl:with-param name="colnum" select="$entry.colnum"/>
      <xsl:with-param name="attribute" select="'align'"/>
    </xsl:call-template>
  </xsl:variable>

  <!-- We only set valign, char, and charoff on the cell
       if it was specified explicitly on the entry; otherwise, we
       assume the proper value will be inherited from ancestors. -->
  <xsl:variable name="valign" select="@valign"/>

  <xsl:variable name="char" select="@char"/>

  <xsl:variable name="charoff" select="@charoff"/>

    <xsl:variable name="padding-style-props">
      <!-- Here we handle padding-* values -->
      <xsl:variable name="cmarg-pi" 
                     select="string(ancestor::*[local-name(.)='tgroup'][1]/processing-instruction('PubTbl')
                          [starts-with(.,'tgroup') and contains(.,'marg=')])"/>
      <xsl:variable name="cellpadding">
        <xsl:call-template name="parse-cmarg-pi">
          <xsl:with-param name="side" select="'all'"/>
          <xsl:with-param name="cmarg-pi" select="$cmarg-pi"/>
        </xsl:call-template>
      </xsl:variable>
      <xsl:if test="$cellpadding=''">
        <!-- We must use individual padding-* values -->
        <xsl:variable name="padding-left">
          <xsl:call-template name="parse-cmarg-pi">
            <xsl:with-param name="side" select="'left'"/>
            <xsl:with-param name="cmarg-pi" select="$cmarg-pi"/>
          </xsl:call-template>
        </xsl:variable>
        <xsl:variable name="padding-right">
          <xsl:call-template name="parse-cmarg-pi">
            <xsl:with-param name="side" select="'right'"/>
            <xsl:with-param name="cmarg-pi" select="$cmarg-pi"/>
          </xsl:call-template>
        </xsl:variable>
        <xsl:variable name="padding-top">
          <xsl:call-template name="parse-cmarg-pi">
            <xsl:with-param name="side" select="'top'"/>
            <xsl:with-param name="cmarg-pi" select="$cmarg-pi"/>
          </xsl:call-template>
        </xsl:variable>
        <xsl:variable name="padding-bottom">
          <xsl:call-template name="parse-cmarg-pi">
            <xsl:with-param name="side" select="'bottom'"/>
            <xsl:with-param name="cmarg-pi" select="$cmarg-pi"/>
          </xsl:call-template>
        </xsl:variable>
        <xsl:if test="$padding-left!=''">
          <xsl:text>padding-left: </xsl:text>
          <xsl:value-of select="$padding-left"/>
          <xsl:text>; </xsl:text>
        </xsl:if>
        <xsl:if test="$padding-right!=''">
          <xsl:text>padding-right: </xsl:text>
          <xsl:value-of select="$padding-right"/>
          <xsl:text>; </xsl:text>
        </xsl:if>
        <xsl:if test="$padding-top!=''">
          <xsl:text>padding-top: </xsl:text>
          <xsl:value-of select="$padding-top"/>
          <xsl:text>; </xsl:text>
        </xsl:if>
        <xsl:if test="$padding-bottom!=''">
          <xsl:text>padding-bottom: </xsl:text>
          <xsl:value-of select="$padding-bottom"/>
          <xsl:text>; </xsl:text>
        </xsl:if>
      </xsl:if>
    </xsl:variable>

    <xsl:variable name="table-has-any-border-pis"
       select="boolean(ancestor::*[local-name(.)='tgroup']/parent::*//
                  processing-instruction('PubTbl')[contains(.,'border')])"/>

        <xsl:variable name="table-colsep">
          <xsl:choose>
            <xsl:when test="../@colsep='0'">0</xsl:when>
            <xsl:when test="../@frame='none'">0</xsl:when>
            <xsl:otherwise>1</xsl:otherwise>
          </xsl:choose>
        </xsl:variable>
        <xsl:variable name="table-rowsep">
          <xsl:choose>
            <xsl:when test="../@rowsep='0'">0</xsl:when>
            <xsl:when test="../@frame='none'">0</xsl:when>
            <xsl:otherwise>1</xsl:otherwise>
          </xsl:choose>
        </xsl:variable>

    <xsl:variable name="border-style-props">
      <xsl:if test="$obey-col_and_row-sep='1'">
        <xsl:choose>
          <xsl:when test="$table-has-any-border-pis">

        <xsl:variable name="border-right-style">
          <xsl:call-template name="get-border-prop">
            <xsl:with-param name="side" select="'right'"/>
            <xsl:with-param name="prop" select="'style'"/>
            <xsl:with-param name="entry" select="."/>
            <xsl:with-param name="row" select="$entry.row"/>
            <xsl:with-param name="colnum" select="$entry.colnum"/>
            <xsl:with-param name="lastrow" select="$lastrow"/>
            <xsl:with-param name="lastcol" select="$lastcol"/>
          </xsl:call-template>
        </xsl:variable>
        <xsl:variable name="border-bottom-style">
          <xsl:call-template name="get-border-prop">
            <xsl:with-param name="side" select="'bottom'"/>
            <xsl:with-param name="prop" select="'style'"/>
            <xsl:with-param name="entry" select="."/>
            <xsl:with-param name="row" select="$entry.row"/>
            <xsl:with-param name="colnum" select="$entry.colnum"/>
            <xsl:with-param name="lastrow" select="$lastrow"/>
            <xsl:with-param name="lastcol" select="$lastcol"/>
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
            <xsl:with-param name="entry" select="."/>
            <xsl:with-param name="row" select="$entry.row"/>
            <xsl:with-param name="colnum" select="$entry.colnum"/>
            <xsl:with-param name="lastrow" select="$lastrow"/>
            <xsl:with-param name="lastcol" select="$lastcol"/>
          </xsl:call-template>
          <xsl:text>; </xsl:text>
          <xsl:variable name="temp">
           <xsl:call-template name="get-border-prop">
            <xsl:with-param name="side" select="'right'"/>
            <xsl:with-param name="prop" select="'color'"/>
            <xsl:with-param name="entry" select="."/>
            <xsl:with-param name="row" select="$entry.row"/>
            <xsl:with-param name="colnum" select="$entry.colnum"/>
            <xsl:with-param name="lastrow" select="$lastrow"/>
            <xsl:with-param name="lastcol" select="$lastcol"/>
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
            <xsl:with-param name="entry" select="."/>
            <xsl:with-param name="row" select="$entry.row"/>
            <xsl:with-param name="colnum" select="$entry.colnum"/>
            <xsl:with-param name="lastrow" select="$lastrow"/>
            <xsl:with-param name="lastcol" select="$lastcol"/>
          </xsl:call-template>
          <xsl:text>; </xsl:text>
          <xsl:variable name="temp">
           <xsl:call-template name="get-border-prop">
            <xsl:with-param name="side" select="'bottom'"/>
            <xsl:with-param name="prop" select="'color'"/>
            <xsl:with-param name="entry" select="."/>
            <xsl:with-param name="row" select="$entry.row"/>
            <xsl:with-param name="colnum" select="$entry.colnum"/>
            <xsl:with-param name="lastrow" select="$lastrow"/>
            <xsl:with-param name="lastcol" select="$lastcol"/>
           </xsl:call-template>
          </xsl:variable>
          <xsl:if test="$temp!='#000000' or $emit-black-border-color='yes'">
            <xsl:text>border-bottom-color: </xsl:text>
            <xsl:value-of select="$temp"/>
            <xsl:text>; </xsl:text>
          </xsl:if>
        </xsl:if>

          </xsl:when>

          <xsl:when test="
              (ancestor::*[local-name(.)='tgroup']//*/@colsep and ancestor::*[local-name(.)='tgroup']//*/@colsep!=$table-colsep) or
              (ancestor::*[local-name(.)='tgroup']//*/@rowsep and ancestor::*[local-name(.)='tgroup']//*/@rowsep!=$table-rowsep)">
            <!-- table has no border PIs but does have colseps or rowseps, so use "old" method -->

            <xsl:variable name="colsep">
              <xsl:call-template name="inherited.table.attribute">
                <xsl:with-param name="entry" select="."/>
                <xsl:with-param name="colnum" select="$entry.colnum"/>
                <xsl:with-param name="row" select="$entry.row"/>
                <xsl:with-param name="attribute" select="'colsep'"/>
                <xsl:with-param name="lastrow" select="$lastrow"/>
                <xsl:with-param name="lastcol" select="$lastcol"/>
              </xsl:call-template>
            </xsl:variable>

            <xsl:variable name="rowsep">
              <xsl:call-template name="inherited.table.attribute">
                <xsl:with-param name="entry" select="."/>
                <xsl:with-param name="colnum" select="$entry.colnum"/>
                <xsl:with-param name="row" select="$entry.row"/>
                <xsl:with-param name="attribute" select="'rowsep'"/>
                <xsl:with-param name="lastrow" select="$lastrow"/>
                <xsl:with-param name="lastcol" select="$lastcol"/>
              </xsl:call-template>
            </xsl:variable>

            <xsl:text>border-width: </xsl:text>
            <xsl:value-of select="$table.border.thickness"/>
            <xsl:text>; </xsl:text>
            <!-- Now set to solid each border-{right,bottom}-style with {col,row}sep!=0 -->
            <xsl:if test="number($colsep)!=0">
              <xsl:text>border-right-style: solid; </xsl:text>
            </xsl:if>
            <xsl:if test="number($rowsep)!=0">
              <xsl:text>border-bottom-style: solid; </xsl:text>
            </xsl:if>

          </xsl:when>
          <xsl:otherwise>
            <!-- table has no border PIs and no overriding colseps or rowseps,
                 so at most we might need to emit border-width -->
            <xsl:if test="$table.border.thickness.is.significant and ($table-colsep='1' or $table-rowsep='1')">
              <xsl:text>border-width: </xsl:text>
              <xsl:value-of select="$table.border.thickness"/>
              <xsl:text>; </xsl:text>
            </xsl:if>
          </xsl:otherwise>
        </xsl:choose>
      </xsl:if>
    </xsl:variable>

    <xsl:variable name="style-value">
      <xsl:value-of select="$padding-style-props"/>
      <xsl:value-of select="$border-style-props"/>
    </xsl:variable>

  <xsl:element name="{$cellgi}">
    <xsl:call-template name="entry">
      <xsl:with-param name="context" select="$context"/>
    </xsl:call-template>

    <xsl:if test="$style-value != ''">
      <xsl:attribute name="style">
        <xsl:value-of select="$style-value"/>
      </xsl:attribute>
    </xsl:if>

    <xsl:if test="@morerows">
      <xsl:attribute name="rowspan">
        <xsl:value-of select="@morerows+1"/>
      </xsl:attribute>
    </xsl:if>

    <xsl:if test="$entry.colspan &gt; 1">
      <xsl:attribute name="colspan">
        <xsl:value-of select="$entry.colspan"/>
      </xsl:attribute>
    </xsl:if>

    <xsl:if test="$valign != ''">
      <xsl:attribute name="valign">
        <xsl:value-of select="$valign"/>
      </xsl:attribute>
    </xsl:if>

    <xsl:if test="$align != ''">
      <xsl:attribute name="align">
        <xsl:value-of select="$align"/>
      </xsl:attribute>
    </xsl:if>

    <xsl:if test="($char != '') and ($align = 'char')">
      <xsl:attribute name="char">
        <xsl:value-of select="$char"/>
      </xsl:attribute>
    </xsl:if>

    <xsl:if test="$charoff != ''">
      <xsl:attribute name="charoff">
        <xsl:value-of select="$charoff"/>
      </xsl:attribute>
    </xsl:if>

    <!-- maybe set the height attribute from a PubTbl tr rht value -->
    <xsl:variable name="rht-pi" 
        select="string(ancestor-or-self::*[local-name(.)='row'][1]/processing-instruction('PubTbl')[starts-with(.,'row') and contains(.,' rht=')])"/>
    <xsl:if test="$rht-pi!=''">
      <xsl:attribute name="height">
        <xsl:call-template name="size-to-pixels">
          <xsl:with-param name="size">
            <xsl:call-template name="get-pi-attr-value">
              <xsl:with-param name="pi" select="$rht-pi"/>
              <xsl:with-param name="piattr" select="'rht'"/>
            </xsl:call-template>
          </xsl:with-param>
        </xsl:call-template>
      </xsl:attribute>
    </xsl:if>

    <!-- ***** first added call to handle _cellfont ***** -->
    <xsl:call-template name="just-after-table-cell-stag"/>
    <!-- ***** end added line ***** -->

    <xsl:choose>
      <xsl:when test="$empty.cell">
        <xsl:text>&#160;</xsl:text>
      </xsl:when>
      <xsl:otherwise>
        <xsl:apply-templates/>
      </xsl:otherwise>
    </xsl:choose>

    <!-- ***** second added call to handle _cellfont ***** -->
    <xsl:call-template name="just-before-table-cell-etag"/>
    <!-- ***** end added line ***** -->

  </xsl:element>

 </xsl:if>
</xsl:template>

<xsl:template name="generate.colgroup">
  <xsl:param name="cols" select="1"/>
  <xsl:param name="count" select="1"/>
  <xsl:choose>
    <xsl:when test="$count>$cols"></xsl:when>
    <xsl:otherwise>
      <xsl:call-template name="generate.col">
        <xsl:with-param name="countcol" select="$count"/>
      </xsl:call-template>
      <xsl:call-template name="generate.colgroup">
        <xsl:with-param name="cols" select="$cols"/>
        <xsl:with-param name="count" select="$count+1"/>
      </xsl:call-template>
    </xsl:otherwise>
  </xsl:choose>
</xsl:template>

<xsl:template name="generate.col">
  <xsl:param name="countcol">1</xsl:param>
  <xsl:param name="colspecs" select="./*[local-name(.)='colspec']"/>
  <xsl:param name="count">1</xsl:param>
  <xsl:param name="colnum">1</xsl:param>

  <xsl:choose>
    <xsl:when test="$count>count($colspecs)">
      <col>
	<xsl:if test="$inhibit-default-colwidth-emission='0'">
	  <xsl:attribute name="width">
            <xsl:call-template name="size-to-pixels">
              <xsl:with-param name="size" select="'1*'"/>
            </xsl:call-template>
	  </xsl:attribute>
	</xsl:if>
      </col>
    </xsl:when>
    <xsl:otherwise>
      <xsl:variable name="colspec" select="$colspecs[$count=position()]"/>
      <xsl:variable name="colspec.colnum">
        <xsl:choose>
          <xsl:when test="$colspec/@colnum">
            <xsl:value-of select="$colspec/@colnum"/>
          </xsl:when>
          <xsl:otherwise>
            <xsl:value-of select="$colnum"/>
          </xsl:otherwise>
        </xsl:choose>
      </xsl:variable>

      <xsl:choose>
        <xsl:when test="$colspec.colnum=$countcol">
          <xsl:element name="col">
            <xsl:if test="$colspec/@align">
              <xsl:attribute name="align">
                <xsl:value-of select="$colspec/@align"/>
              </xsl:attribute>
            </xsl:if>
            <xsl:if test="$colspec/@char">
              <xsl:attribute name="char">
                <xsl:value-of select="$colspec/@char"/>
              </xsl:attribute>
            </xsl:if>
            <xsl:if test="$colspec/@charoff">
              <xsl:attribute name="charoff">
                <xsl:value-of select="$colspec/@charoff"/>
              </xsl:attribute>
            </xsl:if>
            <xsl:if test="normalize-space($colspec/@colwidth)!=''">
              <xsl:attribute name="width">
                <xsl:call-template name="size-to-pixels">
                  <xsl:with-param name="size" select="$colspec/@colwidth"/>
                </xsl:call-template>
              </xsl:attribute>
            </xsl:if>
            <xsl:if test="normalize-space($colspec/@colwidth)='' and $inhibit-default-colwidth-emission='0'">
              <xsl:attribute name="width">
                <xsl:call-template name="size-to-pixels">
                  <xsl:with-param name="size" select="'1*'"/>
                </xsl:call-template>
              </xsl:attribute>
            </xsl:if>
          </xsl:element>
        </xsl:when>
        <xsl:otherwise>
          <xsl:call-template name="generate.col">
            <xsl:with-param name="countcol" select="$countcol"/>
            <xsl:with-param name="colspecs" select="$colspecs"/>
            <xsl:with-param name="count" select="$count+1"/>
            <xsl:with-param name="colnum">
              <xsl:choose>
                <xsl:when test="$colspec/@colnum">
                  <xsl:value-of select="$colspec/@colnum + 1"/>
                </xsl:when>
                <xsl:otherwise>
                  <xsl:value-of select="$colnum + 1"/>
                </xsl:otherwise>
              </xsl:choose>
            </xsl:with-param>
           </xsl:call-template>
        </xsl:otherwise>
      </xsl:choose>
    </xsl:otherwise>
  </xsl:choose>

</xsl:template>

<xsl:template name="colspec.colwidth">
  <!-- when this macro is called, the current context must be an entry -->
  <xsl:param name="colname"></xsl:param>
  <!-- .. = row, ../.. = thead|tbody, ../../.. = tgroup -->
  <xsl:param name="colspecs" select="../../../../*[local-name(.)='tgroup']/*[local-name(.)='colspec']"/>
  <xsl:param name="count">1</xsl:param>
  <xsl:choose>
    <xsl:when test="$count>count($colspecs)"></xsl:when>
    <xsl:otherwise>
      <xsl:variable name="colspec" select="$colspecs[$count=position()]"/>
      <xsl:choose>
        <xsl:when test="$colspec/@colname=$colname">
          <xsl:value-of select="$colspec/@colwidth"/>
        </xsl:when>
        <xsl:otherwise>
          <xsl:call-template name="colspec.colwidth">
            <xsl:with-param name="colname" select="$colname"/>
            <xsl:with-param name="colspecs" select="$colspecs"/>
            <xsl:with-param name="count" select="$count+1"/>
          </xsl:call-template>
        </xsl:otherwise>
      </xsl:choose>
    </xsl:otherwise>
  </xsl:choose>
</xsl:template>

<xsl:template name="colspec.align">
  <!-- when this macro is called, the current context must be an entry -->
  <xsl:param name="colname">
    <xsl:choose>
      <xsl:when test="@colname">
        <xsl:value-of select="@colname"/>
      </xsl:when>
      <xsl:otherwise>
        <xsl:call-template name="colnum.colspec">
          <xsl:with-param name="colnum" select="count(preceding-sibling::*[local-name(.)='entry'])+1"/>
        </xsl:call-template>
      </xsl:otherwise>
    </xsl:choose>
  </xsl:param>
  <!-- .. = row, ../.. = thead|tbody, ../../.. = tgroup -->
  <xsl:param name="colspecs" select="../../../../*[local-name(.)='tgroup']/*[local-name(.)='colspec']"/>
  <xsl:param name="count">1</xsl:param>
  <xsl:choose>
    <xsl:when test="$count>count($colspecs)"></xsl:when>
    <xsl:otherwise>
      <xsl:variable name="colspec" select="$colspecs[$count=position()]"/>
      <xsl:choose>
        <xsl:when test="$colspec/@colname=$colname">
          <xsl:value-of select="$colspec/@align"/>
        </xsl:when>
        <xsl:otherwise>
          <xsl:call-template name="colspec.align">
            <xsl:with-param name="colname" select="$colname"/>
            <xsl:with-param name="colspecs" select="$colspecs"/>
            <xsl:with-param name="count" select="$count+1"/>
          </xsl:call-template>
        </xsl:otherwise>
      </xsl:choose>
    </xsl:otherwise>
  </xsl:choose>
</xsl:template>

<xsl:template name="colnum.colspec">
  <xsl:param name="colnum" select="0"/>
  <xsl:param name="attribute" select="'colname'"/>
  <xsl:param name="colspecs" select="ancestor::*[local-name(.)='tgroup']/*[local-name(.)='colspec']"/>
  <xsl:param name="count" select="1"/>

  <xsl:choose>
    <xsl:when test="not($colspecs) or number($count) &gt; number($colnum)">
      <!-- nop -->
    </xsl:when>
    <xsl:when test="$colspecs[1]/@colnum">
      <xsl:choose>
        <xsl:when test="$colspecs[1]/@colnum = $colnum">
          <xsl:call-template name="get-attribute">
            <xsl:with-param name="element" select="$colspecs[1]"/>
            <xsl:with-param name="attribute" select="$attribute"/>
          </xsl:call-template>
        </xsl:when>
        <xsl:otherwise>
          <xsl:call-template name="colnum.colspec">
            <xsl:with-param name="colnum" select="$colnum"/>
            <xsl:with-param name="attribute" select="$attribute"/>
            <xsl:with-param name="colspecs"
                            select="$colspecs[position()&gt;1]"/>
            <xsl:with-param name="count"
                            select="$colspecs[1]/@colnum+1"/>
          </xsl:call-template>
        </xsl:otherwise>
      </xsl:choose>
    </xsl:when>
    <xsl:otherwise>
      <xsl:choose>
        <xsl:when test="$count = $colnum">
          <xsl:call-template name="get-attribute">
            <xsl:with-param name="element" select="$colspecs[1]"/>
            <xsl:with-param name="attribute" select="$attribute"/>
          </xsl:call-template>
        </xsl:when>
        <xsl:otherwise>
          <xsl:call-template name="colnum.colspec">
            <xsl:with-param name="colnum" select="$colnum"/>
            <xsl:with-param name="attribute" select="$attribute"/>
            <xsl:with-param name="colspecs"
                            select="$colspecs[position()&gt;1]"/>
            <xsl:with-param name="count" select="$count+1"/>
          </xsl:call-template>
        </xsl:otherwise>
      </xsl:choose>
    </xsl:otherwise>
  </xsl:choose>
</xsl:template>

<xsl:template name="get-attribute">
  <xsl:param name="element" select="."/>
  <xsl:param name="attribute" select="''"/>

  <xsl:for-each select="$element/@*">
    <xsl:if test="local-name(.) = $attribute">
      <xsl:value-of select="."/>
    </xsl:if>
  </xsl:for-each>
</xsl:template>

<xsl:template name="size-to-pixels">
    <xsl:param name="size"/>
    <xsl:param name="pixels-per-inch" select="'96'"/>
  <xsl:variable name="units">
    <xsl:choose>
      <xsl:when test="substring($size,string-length($size))='*'">*</xsl:when>
      <xsl:otherwise>
        <xsl:value-of select="substring($size,string-length($size)-1)"/>
      </xsl:otherwise>
    </xsl:choose>
  </xsl:variable>
  <xsl:variable name="val">
    <xsl:choose>
      <xsl:when test="$units='*'">
        <xsl:value-of select="number(substring($size,1,string-length($size)-1))"/>
      </xsl:when>
      <xsl:otherwise>
        <xsl:value-of select="number(substring($size,1,string-length($size)-2))"/>
      </xsl:otherwise>
    </xsl:choose>
  </xsl:variable>
  <xsl:choose>
    <xsl:when test="$val='' or $val=0 or string($val)='NaN'">
      <xsl:value-of select="number(0)"/>
    </xsl:when>
    <xsl:when test="$units='pc'">
      <xsl:value-of select="$val * $pixels-per-inch div 6"/>
    </xsl:when>
    <xsl:when test="$units='pt'">
      <xsl:value-of select="$val * $pixels-per-inch div 72"/>
    </xsl:when>
    <xsl:when test="$units='in'">
      <xsl:value-of select="$val * $pixels-per-inch"/>
    </xsl:when>
    <xsl:when test="$units='mm'">
      <xsl:value-of select="$val * $pixels-per-inch div 25.4"/>
    </xsl:when>
    <xsl:when test="$units='cm'">
      <xsl:value-of select="$val * $pixels-per-inch div 2.54"/>
    </xsl:when>
    <xsl:when test="$units='em'">
      <!-- For now, we just assume 1em=12pt -->
      <xsl:value-of select="$val * $pixels-per-inch div 6"/>
    </xsl:when>
    <xsl:when test="$units='*' and ($proportional-colwidth-supported='yes')">
      <!-- Here, we pass through the given proportional width -->
      <xsl:value-of select="$size"/>
    </xsl:when>
    <xsl:when test="$units='*'">
      <!-- For table column proportional width, pretend 1*=5in/numcols -->
      <xsl:variable name="numcols">
        <xsl:choose>
          <xsl:when test="count(ancestor-or-self::*[local-name(.)='tgroup'][1]/*[local-name(.)='colspec']) &gt; 0">
            <xsl:value-of select="count(ancestor-or-self::*[local-name(.)='tgroup'][1]/*[local-name(.)='colspec'])"/>
          </xsl:when>
          <xsl:otherwise>5</xsl:otherwise>
        </xsl:choose>
      </xsl:variable>
      <xsl:value-of select="$val * 5 div $numcols * $pixels-per-inch"/>
    </xsl:when>
    <xsl:otherwise>
      <xsl:value-of select="$val"/>
    </xsl:otherwise>
  </xsl:choose>
</xsl:template>

<!-- The templates above call various named templates to set style
     properties on various table related elements.  When this file is
     used via TurboStyler or Styler, appropriately defined named templates
     should already be defined.

       If this file is used in another context, the following (commented out)
     empty named template definitions can be used:

<xsl:template name="tgroup.first"/>

<xsl:template name="tgroup.notfirst"/>

<xsl:template name="thead"/>

<xsl:template name="tfoot"/>

<xsl:template name="tbody"/>

<xsl:template name="row"/>

<xsl:template name="entry"/>
-->

<!-- **********************************************************
       end tbl.xsl
     ********************************************************** -->

</xsl:stylesheet>

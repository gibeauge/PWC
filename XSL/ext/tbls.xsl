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

<xsl:template match="tgroup" priority="0.1">
  <table>
    <xsl:choose>
      <xsl:when test="count(preceding-sibling::tgroup)=0">
        <xsl:call-template name="tgroup.first"/>
      </xsl:when>
      <xsl:otherwise>
        <xsl:call-template name="tgroup.notfirst"/>
      </xsl:otherwise>
    </xsl:choose>

    <xsl:attribute name="cellpadding">
      <xsl:choose>
        <xsl:when test="@cellpadding">
          <xsl:value-of select="@cellpadding"/>
        </xsl:when>
        <xsl:otherwise>
          <xsl:call-template name="size-to-pixels">
            <xsl:with-param name="size" select="'5pt'"/>
          </xsl:call-template>
        </xsl:otherwise>
      </xsl:choose>
    </xsl:attribute>

    <!-- If there is no PubTbl tgroup dispwid PI, we set width to 100%
         unless there is at least one colspec with an explicit absolute
         (non-proportional) colwidth -->
    <xsl:if test="not(colspec/@colwidth[substring(.,string-length(.))!='*'])">
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
                  select="$obey-col_and_row-sep='1' and ((.//*/@colsep='0' and .//*/@colsep='1') or (.//*/@rowsep='0' and .//*/@rowsep='1'))"/>

    <xsl:choose>
      <xsl:when test="$must-set-individual-borders">
        <xsl:attribute name="rules">none</xsl:attribute>
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
  </table>
</xsl:template>

<xsl:template match="colspec" mode="cals-table"/>
<xsl:template match="spanspec" mode="cals-table"/>

<xsl:template match="thead" mode="cals-table">
  <thead valign="{$default-thead-valign}">
    <xsl:if test="normalize-space($thead.tfoot.style) != ''">
      <xsl:attribute name="style">
        <xsl:value-of select="$thead.tfoot.style"/>
      </xsl:attribute>
    </xsl:if>
    <xsl:call-template name="thead"/>
    <xsl:attribute name="align">
      <xsl:choose>
        <xsl:when test="@align"><xsl:value-of select="lower-case(@align)"/></xsl:when>
        <xsl:otherwise>left</xsl:otherwise>
      </xsl:choose>
    </xsl:attribute>
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
        <xsl:value-of select="lower-case(@valign)"/>
      </xsl:attribute>
    </xsl:if>

    <xsl:apply-templates mode="cals-table"/>
  </thead>
</xsl:template>

<xsl:template match="tfoot" mode="cals-table">
  <tfoot valign="top">
    <xsl:if test="normalize-space($thead.tfoot.style) != ''">
      <xsl:attribute name="style">
        <xsl:value-of select="$thead.tfoot.style"/>
      </xsl:attribute>
    </xsl:if>
    <xsl:call-template name="tfoot"/>
    <xsl:attribute name="align">
      <xsl:choose>
        <xsl:when test="@align"><xsl:value-of select="lower-case(@align)"/></xsl:when>
        <xsl:otherwise>left</xsl:otherwise>
      </xsl:choose>
    </xsl:attribute>
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
        <xsl:value-of select="lower-case(@valign)"/>
      </xsl:attribute>
    </xsl:if>

    <xsl:apply-templates mode="cals-table"/>
  </tfoot>
</xsl:template>

<xsl:template match="tbody" mode="cals-table">
  <tbody valign="top">
    <xsl:call-template name="tbody"/>
    <xsl:if test="@align">
      <xsl:attribute name="align">
        <xsl:value-of select="lower-case(@align)"/>
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
        <xsl:value-of select="lower-case(@valign)"/>
      </xsl:attribute>
    </xsl:if>

    <xsl:apply-templates mode="cals-table"/>
  </tbody>
</xsl:template>

<xsl:template match="row" mode="cals-table">
  <tr>
    <xsl:call-template name="row"/>
    <xsl:if test="@valign">
      <xsl:attribute name="valign">
        <xsl:value-of select="lower-case(@valign)"/>
      </xsl:attribute>
    </xsl:if>

    <xsl:apply-templates mode="cals-table"/>
  </tr>
</xsl:template>

<xsl:template match="thead/row/entry" mode="cals-table">
  <xsl:call-template name="process.cell">
    <xsl:with-param name="cellgi">th</xsl:with-param>
    <xsl:with-param name="context">thead</xsl:with-param>
  </xsl:call-template>
</xsl:template>

<xsl:template match="tfoot/row/entry" mode="cals-table">
  <xsl:call-template name="process.cell">
    <xsl:with-param name="cellgi">th</xsl:with-param>
    <xsl:with-param name="context">tfoot</xsl:with-param>
  </xsl:call-template>
</xsl:template>

<xsl:template match="tbody/row/entry" mode="cals-table">
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
          <xsl:value-of select="count(preceding-sibling::entry) + 1"/>
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

    <xsl:variable name="entry.row" select="ancestor-or-self::row[1]"/>

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
          <xsl:when test="
              (ancestor::tgroup//*/@colsep and ancestor::tgroup//*/@colsep!=$table-colsep) or
              (ancestor::tgroup//*/@rowsep and ancestor::tgroup//*/@rowsep!=$table-rowsep)">
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
          <xsl:value-of select="lower-case($valign)"/>
        </xsl:attribute>
      </xsl:if>

      <xsl:if test="$align != ''">
        <xsl:attribute name="align">
          <xsl:value-of select="lower-case($align)"/>
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

      <xsl:choose>
        <xsl:when test="$empty.cell"><xsl:text>&#xa0;</xsl:text></xsl:when>
        <xsl:otherwise><xsl:apply-templates/></xsl:otherwise>
      </xsl:choose>
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
        <!--
    	<xsl:if test="$inhibit-default-colwidth-emission='0'">
    	  <xsl:attribute name="width">
            <xsl:call-template name="size-to-pixels">
              <xsl:with-param name="size" select="'1*'"/>
            </xsl:call-template>
    	  </xsl:attribute>
    	</xsl:if>
        -->
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
                <xsl:value-of select="lower-case($colspec/@align)"/>
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
            <!--
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
            -->
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
      <!-- DBE -->
      <!--
      <xsl:choose>
        <xsl:when test="not(./colspec/@colwidth[substring(., string-length(.)) != '*']) and count(./colspec) > 0 and count(./colspec[@colwidth]) = count(./colspec)">
          <xsl:variable name="total-width" select="sum(./colspec/@colwidth/number(substring(., 1, string-length(.)-1)))"/>
          <xsl:value-of select="concat(format-number($val div $total-width * 100, '0'), '%')"/>
        </xsl:when>
        <xsl:otherwise>
          <xsl:value-of select="$size"/>
        </xsl:otherwise>
      </xsl:choose>
      -->
      <xsl:variable name="total-width" select="sum(./colspec/@colwidth[ends-with(.,'*')]/number(substring(., 1, string-length(.)-1))) + number(@cols) - count(colspec)"/>
      <xsl:value-of select="concat(format-number($val div $total-width * 100, '##.##'), '%')"/>
      <!-- DBE -->
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

</xsl:stylesheet>

<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:fn="http://www.pwc.ca"
    xmlns:xs="http://www.w3.org/2001/XMLSchema"
    xmlns="http://www.w3.org/1999/xhtml"
    exclude-result-prefixes="xs fn #default"
    version="2.0">

<!-- ************************************************************** -->
<!-- PARAMS -->

<xsl:param name="t-default-thead-valign" select="'bottom'"/>
<xsl:param name="t-thead-tfoot-style">font-weight: bold; </xsl:param>


<!-- ************************************************************** -->

<!-- table border -->
<xsl:template name="table.frame">
  <xsl:text>border-collapse: collapse;</xsl:text>
  <xsl:choose>
    <xsl:when test="@frame='none'">
    </xsl:when>
    <xsl:when test="@frame='all'">
      <xsl:call-template name="border">
        <xsl:with-param name="side" select="'all'"/>
      </xsl:call-template>
    </xsl:when>
    <xsl:when test="@frame='topbot'">
      <xsl:call-template name="border">
        <xsl:with-param name="side" select="'top'"/>
      </xsl:call-template>
      <xsl:call-template name="border">
        <xsl:with-param name="side" select="'bottom'"/>
      </xsl:call-template>
    </xsl:when>
    <xsl:when test="@frame='top'">
      <xsl:call-template name="border">
        <xsl:with-param name="side" select="'top'"/>
      </xsl:call-template>
    </xsl:when>
    <xsl:when test="@frame='bottom'">
      <xsl:call-template name="border">
        <xsl:with-param name="side" select="'bottom'"/>
      </xsl:call-template>
    </xsl:when>
    <xsl:when test="@frame='sides'">
      <xsl:call-template name="border">
        <xsl:with-param name="side" select="'left'"/>
      </xsl:call-template>
      <xsl:call-template name="border">
        <xsl:with-param name="side" select="'right'"/>
      </xsl:call-template>
    </xsl:when>
    <xsl:otherwise>
      <xsl:call-template name="border">
        <xsl:with-param name="side" select="'all'"/>
      </xsl:call-template>
    </xsl:otherwise>
  </xsl:choose>
</xsl:template>

<!-- border, CSS capabilities used 
     each cell can have its own borders -->
<xsl:template name="border">
  <xsl:param name="side" select="'left'"/>
  <xsl:param name="style" select="'solid'"/>
  <xsl:param name="color" select="'black'"/>
  <xsl:param name="thickness" select="'1px'"/>

  <xsl:choose>
    <xsl:when test="$side='all'">
      <xsl:value-of select="concat('border:',$thickness,' ',$style,' ',$color,';')"/>
    </xsl:when>
    <xsl:otherwise>
      <xsl:value-of select="concat('border-',$side,':',$thickness,' ',$style,' ',$color,';')"/>
    </xsl:otherwise>
  </xsl:choose>
</xsl:template>

<!-- table width -->
<xsl:template name="table.width">
  <xsl:variable name="l-need-width">
    <xsl:choose>
      <xsl:when test=".//colspec[not(@colwidth)]">1</xsl:when>
      <xsl:when test=".//colspec[contains(@colwidth,'*') or contains(@colwidth,'%')]">1</xsl:when>
      <xsl:when test=".//colspec[not(contains(@colwidth,'in') or contains(@colwidth,'cm') or 
                                     contains(@colwidth,'mm') or contains(@colwidth,'px') or 
                                     contains(@colwidth,'pc') or contains(@colwidth,'pt'))]">1</xsl:when>
      <xsl:otherwise>0</xsl:otherwise>
    </xsl:choose>
  </xsl:variable>
  <xsl:if test="$l-need-width='1'">
    <xsl:variable name="l-width">100%</xsl:variable>
    <xsl:value-of select="concat('width:',$l-width,';')"/>
  </xsl:if>
</xsl:template>

<xsl:template name="calc.table.width.px">
  <xsl:param name="p-pos" select="'1'"/>
  <xsl:param name="p-sum" select="'0'"/>
  
  <xsl:variable name="l-colspec" select="..//colspec[number($p-pos)]"/>
  <xsl:variable name="l-colwidth-tmp">
    <xsl:call-template name="calc.col.width.px">
      <xsl:with-param name="p-colwidth" select="$l-colspec/@colwidth"/>
    </xsl:call-template>
  </xsl:variable>
  <xsl:variable name="l-colwidth">
    <xsl:choose>
      <xsl:when test="normalize-space($l-colwidth-tmp)=''">0</xsl:when>
      <xsl:otherwise><xsl:value-of select="$l-colwidth-tmp"/></xsl:otherwise>
    </xsl:choose>
  </xsl:variable>
  
  <xsl:choose>
    <xsl:when test="$l-colspec[following-sibling::colspec]">
      <xsl:call-template name="calc.table.width.px">
        <xsl:with-param name="p-pos" select="number($p-pos)+1"/>
        <xsl:with-param name="p-sum" select="number($p-sum) + number($l-colwidth)"/>
      </xsl:call-template>
    </xsl:when>
    <xsl:otherwise>
      <xsl:value-of select="number($p-sum) + number($l-colwidth)"/>
    </xsl:otherwise>
  </xsl:choose>
</xsl:template>

<xsl:template name="calc.col.width.px">
  <xsl:param name="p-colwidth">1*</xsl:param>
  <xsl:variable name="l-width-units">
    <xsl:choose>
      <xsl:when test="contains($p-colwidth,'*')">
        <xsl:value-of select="normalize-space(substring-after($p-colwidth,'*'))"/>
      </xsl:when>
      <xsl:when test="contains($p-colwidth,'%')">
        <xsl:value-of select="normalize-space(substring-after($p-colwidth,'%'))"/>
      </xsl:when>
      <xsl:otherwise>
        <xsl:value-of select="normalize-space($p-colwidth)"/>
      </xsl:otherwise>
    </xsl:choose>
  </xsl:variable>

  <xsl:if test="$l-width-units!=''">
    <xsl:variable name="l-letters" select="'abcdefghijklmnopqrstuvwxyz'"/>
    <xsl:variable name="l-numbers" select="'+-0123456789.'"/>
    <xsl:variable name="l-width" select="normalize-space(translate($l-width-units,concat($l-numbers,$l-letters),$l-numbers))"/>
    <xsl:if test="$l-width!=''">
      <xsl:variable name="l-units" select="normalize-space(translate($l-width-units,concat($l-letters,$l-numbers),$l-letters))"/>
      <xsl:variable name="l-unit">
        <xsl:choose>
          <xsl:when test="$l-units='pi'">pc</xsl:when>
          <xsl:when test="$l-units='' and $l-width!=''">pt</xsl:when>
          <xsl:otherwise><xsl:value-of select="$l-units"/></xsl:otherwise>
        </xsl:choose>
      </xsl:variable>
      <xsl:variable name="l-factor">
        <xsl:choose>
          <xsl:when test="$l-unit='mm'">0.2822219</xsl:when>
          <xsl:when test="$l-unit='cm'">0.02822219</xsl:when>
          <xsl:when test="$l-unit='in'">0.0111111</xsl:when>
          <xsl:when test="$l-unit='pc'">0.0667191</xsl:when>
          <xsl:when test="$l-unit='pt'">0.8</xsl:when>
          <xsl:when test="$l-unit='px'">1</xsl:when>
          <xsl:otherwise>1</xsl:otherwise>
        </xsl:choose>
      </xsl:variable>
      <xsl:value-of select="number($l-width) * (1 div number($l-factor))"/>
    </xsl:if>
  </xsl:if>
</xsl:template>

<xsl:template name="copy-string">
    <!-- returns 'count' copies of 'string' -->
    <xsl:param name="string"/>
    <xsl:param name="count" select="0"/>
    <xsl:param name="result"/>
    
    <xsl:choose>
      <xsl:when test="$count&gt;0">
        <xsl:call-template name="copy-string">
          <xsl:with-param name="string" select="$string"/>
          <xsl:with-param name="count" select="$count - 1"/>
          <xsl:with-param name="result">
            <xsl:value-of select="$result"/>
            <xsl:value-of select="$string"/>
          </xsl:with-param>
        </xsl:call-template>
      </xsl:when>
      <xsl:otherwise>
        <xsl:value-of select="$result"/>
      </xsl:otherwise>
    </xsl:choose>
  </xsl:template>

<!-- ************************************************************** -->

<xsl:template match="table" priority="20">
  <div>
    <xsl:call-template name="setID"/>
    <xsl:if test="title">
      <xsl:attribute name="class">pr-tbl</xsl:attribute>
    </xsl:if>
    <div>
      <xsl:call-template name="change">
        <xsl:with-param name="class" select="concat($css-pfx, 'table', $css-sfx)"/>
      </xsl:call-template>
      <xsl:apply-templates select="title"/>
      <xsl:if test="@changeType='delete'">
        <div>
          <xsl:if test="not(title)">
            <xsl:value-of select="fn:getGenText('title-table')"/>
            <xsl:text> </xsl:text>
          </xsl:if>
          <xsl:value-of select="fn:getGenText('delete')"/>
        </div>
      </xsl:if>
      <div id="{generate-id(.)}" class="{$css-pfx}table-ct{$css-sfx}">
        <xsl:if test="title">
          <xsl:attribute name="style">display: none</xsl:attribute>
        </xsl:if>
        <xsl:apply-templates select="tgroup[not(../@changeType='delete')]"/>
      </div>
    </div>
  </div>
</xsl:template>
  
<xsl:template match="table[@changeType='delete']/title" priority="3">
  <div class="{$css-pfx}title-table{$css-sfx}">
    <xsl:next-match/>
  </div>
</xsl:template>

<xsl:template match="table[not(@changeType='delete')]/title" priority="3">
  <div class="{$css-pfx}title-table{$css-sfx}">
    <a href="#none" onclick="toggle('{generate-id(..)}', '{generate-id(..)}')">
      <xsl:next-match/>
    </a>
  </div>
</xsl:template>

<xsl:template match="table/title">
  <img src="{concat($images-path, '/table.gif')}" title="" style="border-style:none; display:inline;"/>
  <xsl:text>&#xa0;</xsl:text>
  <xsl:value-of select="fn:getGenText('title-table')"/>
  <xsl:text>&#xa0;</xsl:text>
  <xsl:apply-templates select=".." mode="numbering"/>
  <xsl:text>&#032;</xsl:text>
  <xsl:apply-templates/>
</xsl:template>

<xsl:template match="tgroup">
  <table class="s-table-group">
    <xsl:attribute name="style">
      <xsl:for-each select="..">
        <xsl:call-template name="table.frame"/>
        <xsl:call-template name="table.width"/>
      </xsl:for-each>
    </xsl:attribute>
    <colgroup>
      <xsl:apply-templates select="colspec"/>
    </colgroup>
    <xsl:apply-templates select="thead"/>
    <xsl:apply-templates select="tfoot"/>
    <xsl:apply-templates select="tbody"/>
  </table>
</xsl:template>

<xsl:template match="spanspec">
</xsl:template>  

<xsl:template match="colspec">
  <xsl:variable name="l-colcount" select="count(../colspec)"/>
  <col id="{@colname}" name="{@colname}">
    <xsl:choose>
      <xsl:when test="@align">
        <xsl:attribute name="align">
          <xsl:value-of select="@align"/>
        </xsl:attribute>
      </xsl:when>
      <xsl:when test="@captionAlign">
        <xsl:attribute name="align">
          <xsl:value-of select="@alignCaption"/>
        </xsl:attribute>
      </xsl:when>
      <xsl:when test="ancestor::tgroup/@align">
        <xsl:attribute name="align">
          <xsl:value-of select="ancestor::tgroup/@align"/>
        </xsl:attribute>
      </xsl:when>
      <xsl:when test="ancestor::captionGgroup/@alignCaption">
        <xsl:attribute name="align">
          <xsl:value-of select="ancestor::captionGgroup/@alignCaption"/>
        </xsl:attribute>
      </xsl:when>
    </xsl:choose>
    <!--
    <xsl:variable name="l-colwidth">
      <xsl:choose>
        <xsl:when test="not(@colwidth) or @colwidth='*' or @colwidth='%'">1*</xsl:when>
        <xsl:otherwise><xsl:value-of select="@colwidth"/></xsl:otherwise>
      </xsl:choose>
    </xsl:variable>
    <xsl:attribute name="style">
      <xsl:text>width: </xsl:text>
      <xsl:choose>
        <xsl:when test="contains($l-colwidth,'*') or contains($l-colwidth,'%')">
          <xsl:variable name="l-totalwidth">
            <xsl:call-template name="calculator">
              <xsl:with-param name="p-curr-sum" select="0"/>
              <xsl:with-param name="p-index"   select="$l-colcount"/>
            </xsl:call-template>
          </xsl:variable>
          <xsl:variable name="l-curwidth" select="substring-before(translate($l-colwidth,'%','*'),'*')"/>
          <xsl:value-of select="format-number(number($l-curwidth) div $l-totalwidth,'#.0%')"/>
        </xsl:when>
        <xsl:when test="contains($l-colwidth,'in') or contains($l-colwidth,'cm') or contains($l-colwidth,'mm') or
                        contains($l-colwidth,'px') or contains($l-colwidth,'pc') or contains($l-colwidth,'pt')">
          <xsl:call-template name="calc.col.width.px">
            <xsl:with-param name="p-colwidth" select="$l-colwidth"/>
          </xsl:call-template>
        </xsl:when>
        <xsl:otherwise>
          <xsl:variable name="l-totalwidth" select="sum(../colspec/@colwidth)"/>
          <xsl:value-of select="format-number(@colwidth div $l-totalwidth,'#.0%')"/>
        </xsl:otherwise>
      </xsl:choose>
      <xsl:text>;</xsl:text>
    </xsl:attribute>
    -->
  </col>
</xsl:template>

<!--
<xsl:template name="calculator">
  <xsl:param name="p-curr-sum"/>
  <xsl:param name="p-index"/>
  
  <xsl:variable name="l-width-tmp" select="../colspec[position()=$p-index]/@colwidth"/>
  <xsl:variable name="l-width">
    <xsl:choose>
      <xsl:when test="not($l-width-tmp) or $l-width-tmp='' or $l-width-tmp='*' or $l-width-tmp='%'">1*</xsl:when>
      <xsl:otherwise><xsl:value-of select="$l-width-tmp"/></xsl:otherwise>
    </xsl:choose>
  </xsl:variable>
  <xsl:variable name="l-colwidth"  select="substring-before(translate($l-width,'%','*'),'*')"/>
  <xsl:variable name="l-cycle-sum" select="number($p-curr-sum + number($l-colwidth))"/>

  <xsl:choose>
    <xsl:when test="number($p-index - 1) > 0">
      <xsl:call-template name="calculator">
        <xsl:with-param name="p-curr-sum" select="$l-cycle-sum"/>
        <xsl:with-param name="p-index"    select="number($p-index - 1)"/>
      </xsl:call-template>
    </xsl:when>
    <xsl:otherwise>
      <xsl:value-of select="$l-cycle-sum"/>
    </xsl:otherwise>
  </xsl:choose>
</xsl:template>
-->

<!-- ************************************************************** -->
<!-- Code from DocBook slightly modified -->

<xsl:template match="thead|tfoot">
  <xsl:variable name="l-cols" select="../@cols"/>

  <xsl:element name="{name()}">
    <xsl:attribute name="style">
      <xsl:value-of select="if (@valign) then concat('vertical-align:',@valign,';') else concat('vertical-align:', $t-default-thead-valign,';')"/>
      <xsl:value-of select="$t-thead-tfoot-style"/>
      <!--
      <xsl:if test="self::thead">
        <xsl:call-template name="border">
          <xsl:with-param name="side" select="'bottom'"/>
        </xsl:call-template>
      </xsl:if>
      -->
    </xsl:attribute>

    <xsl:apply-templates select="row[1]">
      <xsl:with-param name="spans">
        <xsl:call-template name="blank.spans">
          <xsl:with-param name="cols" select="$l-cols"/>
        </xsl:call-template>
      </xsl:with-param>
    </xsl:apply-templates>
  </xsl:element>
</xsl:template>

<xsl:template match="tbody|captionBody">
  <xsl:variable name="l-cols" select="../@cols"/>

  <tbody>
    <xsl:if test="@valign">
      <xsl:attribute name="style"><xsl:value-of select="concat('vertical-align:',@valign,';')"/></xsl:attribute>
    </xsl:if>

    <xsl:apply-templates select="row[1]|captionRow[1]">
      <xsl:with-param name="spans">
        <xsl:call-template name="blank.spans">
          <xsl:with-param name="cols" select="$l-cols"/>
        </xsl:call-template>
      </xsl:with-param>
    </xsl:apply-templates>
  </tbody>
</xsl:template>

<xsl:template match="row|captionRow">
  <xsl:param name="spans"/>

  <tr>
    <xsl:if test="@rowsep=1 and (following-sibling::row or following-sibling::captionRow)">
      <xsl:attribute name="style">
        <xsl:call-template name="border">
          <xsl:with-param name="side" select="'bottom'"/>
        </xsl:call-template>
      </xsl:attribute>
    </xsl:if>
    <xsl:call-template name="change"/>
    <xsl:apply-templates select="entry[1]|captionEntry[1]">
      <xsl:with-param name="spans" select="$spans"/>
    </xsl:apply-templates>
  </tr>

  <xsl:if test="following-sibling::row|following-sibling::captionRow">
    <xsl:variable name="nextspans">
      <xsl:apply-templates select="entry[1]|captionEntry[1]" mode="span">
        <xsl:with-param name="spans" select="$spans"/>
      </xsl:apply-templates>
    </xsl:variable>

    <xsl:apply-templates select="following-sibling::row[1]|following-sibling::captionRow[1]">
      <xsl:with-param name="spans" select="$nextspans"/>
    </xsl:apply-templates>
  </xsl:if>
</xsl:template>

<xsl:template match="entry|captionEntry" name="entry">
  <xsl:param name="col" select="1"/>
  <xsl:param name="spans"/>

  <xsl:variable name="empty.cell" select="count(node())=0"/>

  <xsl:variable name="entry.colnum" select="$col"/>

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

  <xsl:variable name="rowsep">
    <xsl:choose>
      <!-- If this is the last row, rowsep never applies. -->
      <xsl:when test="not(ancestor::row/following-sibling::row
                       or ancestor::thead/following-sibling::tbody
                       or ancestor::tbody/preceding-sibling::tfoot
                       or ancestor::captionRow/following-sibling::captionRow )">
        <xsl:value-of select="0"/>
      </xsl:when>
      <!--xsl:when test="@morerows and not(@morerows &lt; count(ancestor::row/following-sibling::row))">
        <xsl:value-of select="0"/>
      </xsl:when-->
      <xsl:otherwise>
        <xsl:call-template name="inherited.table.attribute">
          <xsl:with-param name="entry" select="self::node()"/>
          <xsl:with-param name="colnum" select="$entry.colnum"/>
          <xsl:with-param name="attribute" select="'rowsep'"/>
        </xsl:call-template>
      </xsl:otherwise>
    </xsl:choose>
  </xsl:variable>

  <xsl:variable name="colsep">
    <xsl:choose>
      <!-- If this is the last column, colsep never applies. -->
      <xsl:when test="$following.spans=''">0</xsl:when>
      <xsl:otherwise>
        <xsl:call-template name="inherited.table.attribute">
          <xsl:with-param name="entry" select="self::node()"/>
          <xsl:with-param name="colnum" select="$entry.colnum"/>
          <xsl:with-param name="attribute" select="'colsep'"/>
        </xsl:call-template>
      </xsl:otherwise>
    </xsl:choose>
  </xsl:variable>
  
  <xsl:variable name="delete.cell">
    <xsl:choose>
      <xsl:when test="self::entry and (ancestor::row[1]/@changeType = 'delete' or @changeType = 'delete')">1</xsl:when>
      <xsl:when test="self::captionEntry and (ancestor::captionRow[1]/@changeType = 'delete' or @changeType = 'delete')">1</xsl:when>
      <xsl:otherwise>0</xsl:otherwise>
    </xsl:choose>
  </xsl:variable>
  
  <xsl:choose>
    <xsl:when test="$spans!='' and not(starts-with($spans,'0:'))">
      <xsl:call-template name="entry">
        <xsl:with-param name="col" select="$col+1"/>
        <xsl:with-param name="spans" select="substring-after($spans,':')"/>
      </xsl:call-template>
    </xsl:when>
    <xsl:when test="$entry.colnum &gt; $col">
      <xsl:call-template name="empty.table.cell"/>
      <xsl:call-template name="entry">
        <xsl:with-param name="col" select="$col+1"/>
        <xsl:with-param name="spans" select="substring-after($spans,':')"/>
      </xsl:call-template>
    </xsl:when>
    <xsl:otherwise>
      <xsl:variable name="l-class">
        <xsl:choose>
          <xsl:when test="($colsep &gt; 0) and ($rowsep &gt; 0)">bd-rb</xsl:when>
          <xsl:when test="$colsep &gt; 0">bd-r</xsl:when>
          <xsl:when test="$rowsep &gt; 0">bd-b</xsl:when>
          <xsl:otherwise>bd-no</xsl:otherwise>
        </xsl:choose>
      </xsl:variable>
      <td class="{$l-class}">
        <xsl:if test="@valign">
          <xsl:attribute name="style">
            <xsl:value-of select="concat('vertical-align: ',@valign,';')"/>
          </xsl:attribute>
        </xsl:if>
        <xsl:if test="@morerows &gt; 0">
          <xsl:attribute name="rowspan">
            <xsl:value-of select="1+@morerows"/>
          </xsl:attribute>
        </xsl:if>
        <xsl:choose>
          <xsl:when test="$delete.cell = '1'">
            <xsl:attribute name="colspan">
              <xsl:value-of select="count(ancestor::table[1]//colspec)"/>
            </xsl:attribute>
          </xsl:when>
          <xsl:when test="$entry.colspan &gt; 1">
            <xsl:attribute name="colspan">
              <xsl:value-of select="$entry.colspan"/>
            </xsl:attribute>
          </xsl:when>
        </xsl:choose>
        <xsl:if test="@align">
          <xsl:attribute name="align">
            <xsl:value-of select="@align"/>
          </xsl:attribute>
        </xsl:if>
        <xsl:choose>
          <xsl:when test="$delete.cell = '1'"><xsl:value-of select="fn:getGenText('delete')"/></xsl:when>
          <xsl:when test="$empty.cell"><xsl:text>&#xa0;</xsl:text></xsl:when>
          <xsl:otherwise><xsl:apply-templates/></xsl:otherwise>
        </xsl:choose>
      </td>

      <xsl:choose>
        <xsl:when test="$delete.cell = '1'">
          <xsl:call-template name="finaltd">
            <xsl:with-param name="spans" select="''"/>
          </xsl:call-template>
        </xsl:when>
        <xsl:when test="following-sibling::entry|following-sibling::captionEntry">
          <xsl:apply-templates select="following-sibling::entry[1]|following-sibling::captionEntry[1]">
            <xsl:with-param name="col" select="$col+$entry.colspan"/>
            <xsl:with-param name="spans" select="$following.spans"/>
          </xsl:apply-templates>
        </xsl:when>
        <xsl:otherwise>
          <xsl:call-template name="finaltd">
            <xsl:with-param name="spans" select="$following.spans"/>
            <xsl:with-param name="col" select="$col+$entry.colspan"/>
          </xsl:call-template>
        </xsl:otherwise>
      </xsl:choose>
    </xsl:otherwise>
  </xsl:choose>
</xsl:template>

<xsl:template match="entry|captionEntry" name="sentry" mode="span">
  <xsl:param name="col" select="1"/>
  <xsl:param name="spans"/>

  <xsl:variable name="entry.colnum">
    <xsl:call-template name="entry.colnum"/>
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

  <xsl:choose>
    <xsl:when test="$spans!='' and not(starts-with($spans,'0:'))">
      <xsl:value-of select="number(substring-before($spans,':'))-1"/>
      <xsl:text>:</xsl:text>
      <xsl:call-template name="sentry">
        <xsl:with-param name="col" select="$col+1"/>
        <xsl:with-param name="spans" select="substring-after($spans,':')"/>
      </xsl:call-template>
    </xsl:when>

    <xsl:when test="$entry.colnum &gt; $col">
      <xsl:text>0:</xsl:text>
      <xsl:call-template name="sentry">
        <xsl:with-param name="col" select="$col+$entry.colspan"/>
        <xsl:with-param name="spans" select="$following.spans"/>
      </xsl:call-template>
    </xsl:when>

    <xsl:otherwise>
      <xsl:call-template name="copy-string">
        <xsl:with-param name="count" select="$entry.colspan"/>
        <xsl:with-param name="string">
          <xsl:choose>
            <xsl:when test="@morerows">
              <xsl:value-of select="@morerows"/>
            </xsl:when>
            <xsl:otherwise>0</xsl:otherwise>
          </xsl:choose>
          <xsl:text>:</xsl:text>
        </xsl:with-param>
      </xsl:call-template>

      <xsl:choose>
        <xsl:when test="following-sibling::entry|following-sibling::captionEntry">
          <xsl:apply-templates select="following-sibling::entry[1]|following-sibling::captionEntry[1]" mode="span">
            <xsl:with-param name="col" select="$col+$entry.colspan"/>
            <xsl:with-param name="spans" select="$following.spans"/>
          </xsl:apply-templates>
        </xsl:when>
        <xsl:otherwise>
          <xsl:call-template name="sfinaltd">
            <xsl:with-param name="spans" select="$following.spans"/>
          </xsl:call-template>
        </xsl:otherwise>
      </xsl:choose>
    </xsl:otherwise>
  </xsl:choose>
</xsl:template>

<xsl:template name="entry.colnum">
  <xsl:param name="entry" select="self::node()"/>

  <xsl:choose>
    <xsl:when test="$entry/@spanname">
      <xsl:variable name="spanname" select="$entry/@spanname"/>
      <xsl:variable name="spanspec" select="$entry/ancestor::tgroup/spanspec[@spanname=$spanname]|$entry/ancestor::captionGroup/spanspec[@spanname=$spanname]"/>
      <xsl:variable name="colspec"  select="$entry/ancestor::tgroup/colspec[@colname=$spanspec/@namest]|$entry/ancestor::captionGroup/colspec[@colname=$spanspec/@namest]"/>
      <xsl:call-template name="colspec.colnum">
        <xsl:with-param name="colspec" select="$colspec"/>
      </xsl:call-template>
    </xsl:when>
    <xsl:when test="$entry/@colname">
      <xsl:variable name="colname" select="$entry/@colname"/>
      <xsl:variable name="colspec" select="$entry/ancestor::tgroup/colspec[@colname=$colname]|$entry/ancestor::captionGroup/colspec[@colname=$colname]"/>
      <xsl:call-template name="colspec.colnum">
        <xsl:with-param name="colspec" select="$colspec"/>
      </xsl:call-template>
    </xsl:when>
    <xsl:when test="$entry/@namest">
      <xsl:variable name="namest"  select="$entry/@namest"/>
      <xsl:variable name="colspec" select="$entry/ancestor::tgroup/colspec[@colname=$namest]|$entry/ancestor::captionGroup/colspec[@colname=$namest]"/>
      <xsl:call-template name="colspec.colnum">
        <xsl:with-param name="colspec" select="$colspec"/>
      </xsl:call-template>
    </xsl:when>
    <xsl:otherwise>0</xsl:otherwise>
  </xsl:choose>
</xsl:template>

<xsl:template name="colspec.colnum">
  <xsl:param name="colspec" select="self::node()"/>
  <xsl:choose>
    <xsl:when test="$colspec/@colnum">
      <xsl:value-of select="$colspec/@colnum"/>
    </xsl:when>
    <xsl:when test="$colspec/preceding-sibling::colspec">
      <xsl:variable name="prec.colspec.colnum">
        <xsl:call-template name="colspec.colnum">
          <xsl:with-param name="colspec"
                          select="$colspec/preceding-sibling::colspec[1]"/>
        </xsl:call-template>
      </xsl:variable>
      <xsl:value-of select="$prec.colspec.colnum + 1"/>
    </xsl:when>
    <xsl:otherwise>1</xsl:otherwise>
  </xsl:choose>
</xsl:template>

<xsl:template name="blank.spans">
  <xsl:param name="cols" select="1"/>
  
  <xsl:if test="$cols &gt; 0">
    <xsl:text>0:</xsl:text>
    <xsl:call-template name="blank.spans">
      <xsl:with-param name="cols" select="$cols - 1"/>
    </xsl:call-template>
  </xsl:if>
</xsl:template>

<xsl:template name="calculate.following.spans">
  <xsl:param name="colspan" select="1"/>
  <xsl:param name="spans" select="''"/>

  <xsl:choose>
    <xsl:when test="$colspan &gt; 0">
      <xsl:call-template name="calculate.following.spans">
        <xsl:with-param name="colspan" select="$colspan - 1"/>
        <xsl:with-param name="spans" select="substring-after($spans,':')"/>
      </xsl:call-template>
    </xsl:when>
    <xsl:otherwise>
      <xsl:value-of select="$spans"/>
    </xsl:otherwise>
  </xsl:choose>
</xsl:template>

<xsl:template name="calculate.colspan">
  <xsl:param name="entry" select="self::node()"/>
  
  <xsl:variable name="spanname" select="$entry/@spanname"/>
  <xsl:variable name="spanspec" select="$entry/ancestor::tgroup/spanspec[@spanname=$spanname]|$entry/ancestor::captionGroup/spanspec[@spanname=$spanname]"/>

  <xsl:variable name="namest">
    <xsl:choose>
      <xsl:when test="$entry/@spanname">
        <xsl:value-of select="$spanspec/@namest"/>
      </xsl:when>
      <xsl:otherwise>
        <xsl:value-of select="$entry/@namest"/>
      </xsl:otherwise>
    </xsl:choose>
  </xsl:variable>

  <xsl:variable name="nameend">
    <xsl:choose>
      <xsl:when test="$entry/@spanname">
        <xsl:value-of select="$spanspec/@nameend"/>
      </xsl:when>
      <xsl:otherwise>
        <xsl:value-of select="$entry/@nameend"/>
      </xsl:otherwise>
    </xsl:choose>
  </xsl:variable>

  <xsl:variable name="scol">
    <xsl:call-template name="colspec.colnum">
      <xsl:with-param name="colspec" select="$entry/ancestor::tgroup/colspec[@colname=$namest]|$entry/ancestor::captionGroup/colspec[@colname=$namest]"/>
    </xsl:call-template>
  </xsl:variable>
  <xsl:variable name="ecol">
    <xsl:call-template name="colspec.colnum">
      <xsl:with-param name="colspec" select="$entry/ancestor::tgroup/colspec[@colname=$nameend]|$entry/ancestor::captionGroup/colspec[@colname=$nameend]"/>
    </xsl:call-template>
  </xsl:variable>

  <xsl:choose>
    <xsl:when test="$namest!='' and $nameend!=''">
      <xsl:choose>
        <xsl:when test="number($ecol) &gt;= number($scol)">
          <xsl:value-of select="$ecol - $scol + 1"/>
        </xsl:when>
        <xsl:otherwise>
          <xsl:value-of select="$scol - $ecol + 1"/>
        </xsl:otherwise>
      </xsl:choose>
    </xsl:when>
    <xsl:otherwise>1</xsl:otherwise>
  </xsl:choose>
</xsl:template>

<xsl:template name="inherited.table.attribute">
  <xsl:param name="entry" select="self::node()"/>
  <xsl:param name="row" select="$entry/ancestor::row|$entry/parent::captionRow"/>
  <xsl:param name="colnum" select="0"/>
  <xsl:param name="attribute" select="'colsep'"/>

  <xsl:variable name="tgroup" select="$row/ancestor::tgroup|$entry/parent::captionGroup"/>
  <xsl:variable name="table" select="$tgroup/ancestor::table|$entry/parent::captionGroup"/>

  <xsl:variable name="entry.value">
    <xsl:call-template name="get-attribute">
      <xsl:with-param name="element" select="$entry"/>
      <xsl:with-param name="attribute" select="$attribute"/>
    </xsl:call-template>
  </xsl:variable>

  <xsl:variable name="row.value">
    <xsl:call-template name="get-attribute">
      <xsl:with-param name="element" select="$row"/>
      <xsl:with-param name="attribute" select="$attribute"/>
    </xsl:call-template>
  </xsl:variable>

  <xsl:variable name="span.value">
    <xsl:if test="$entry/@spanname">
      <xsl:variable name="spanname" select="$entry/@spanname"/>
      <xsl:variable name="spanspec" select="$tgroup/spanspec[@spanname=$spanname]"/>
      <xsl:variable name="span.colspec" select="$tgroup/colspec[@colname=$spanspec/@namest]"/>

      <xsl:variable name="spanspec.value">
        <xsl:call-template name="get-attribute">
          <xsl:with-param name="element" select="$spanspec"/>
          <xsl:with-param name="attribute" select="$attribute"/>
        </xsl:call-template>
      </xsl:variable>

      <xsl:variable name="scolspec.value">
        <xsl:call-template name="get-attribute">
          <xsl:with-param name="element" select="$span.colspec"/>
          <xsl:with-param name="attribute" select="$attribute"/>
        </xsl:call-template>
      </xsl:variable>

      <xsl:choose>
        <xsl:when test="$spanspec.value!=''">
          <xsl:value-of select="$spanspec.value"/>
        </xsl:when>
        <xsl:when test="$scolspec.value!=''">
          <xsl:value-of select="$scolspec.value"/>
        </xsl:when>
        <xsl:otherwise></xsl:otherwise>
      </xsl:choose>
    </xsl:if>
  </xsl:variable>

  <xsl:variable name="namest.value">
    <xsl:if test="$entry/@namest">
      <xsl:variable name="namest"  select="$entry/@namest"/>
      <xsl:variable name="colspec" select="$tgroup/colspec[@colname=$namest]"/>

      <xsl:call-template name="get-attribute">
        <xsl:with-param name="element" select="$colspec"/>
        <xsl:with-param name="attribute" select="$attribute"/>
      </xsl:call-template>
    </xsl:if>
  </xsl:variable>

  <xsl:variable name="tgroup.value">
    <xsl:call-template name="get-attribute">
      <xsl:with-param name="element" select="$tgroup"/>
      <xsl:with-param name="attribute" select="$attribute"/>
    </xsl:call-template>
  </xsl:variable>

  <xsl:variable name="table.value">
    <xsl:call-template name="get-attribute">
      <xsl:with-param name="element" select="$table"/>
      <xsl:with-param name="attribute" select="$attribute"/>
    </xsl:call-template>
  </xsl:variable>

  <xsl:variable name="default.value">
    <xsl:choose>
      <xsl:when test="$attribute='rowsep' and $entry/ancestor::table/@frame='none'">0</xsl:when>
      <xsl:when test="$attribute='colsep' and $entry/ancestor::table/@frame='none'">0</xsl:when>
      <xsl:otherwise>1</xsl:otherwise>
    </xsl:choose>
  </xsl:variable>

  <xsl:variable name="calc.colvalue">
    <xsl:if test="$colnum &gt; 0">
      <xsl:call-template name="colnum.colspec">
        <xsl:with-param name="colnum" select="$colnum"/>
        <xsl:with-param name="attribute" select="$attribute"/>
      </xsl:call-template>
    </xsl:if>
  </xsl:variable>

  <xsl:choose>
    <xsl:when test="$entry.value!=''">
      <xsl:value-of select="$entry.value"/>
    </xsl:when>
    <xsl:when test="$row.value!=''">
      <xsl:value-of select="$row.value"/>
    </xsl:when>
    <xsl:when test="$span.value!=''">
      <xsl:value-of select="$span.value"/>
    </xsl:when>
    <xsl:when test="$namest.value!=''">
      <xsl:value-of select="$namest.value"/>
    </xsl:when>
    <xsl:when test="$calc.colvalue!=''">
      <xsl:value-of select="$calc.colvalue"/>
    </xsl:when>
    <xsl:when test="$tgroup.value!=''">
      <xsl:value-of select="$tgroup.value"/>
    </xsl:when>
    <xsl:when test="$table.value!=''">
      <xsl:value-of select="$table.value"/>
    </xsl:when>
    <xsl:otherwise>
      <xsl:value-of select="$default.value"/>
    </xsl:otherwise>
  </xsl:choose>
</xsl:template>

<xsl:template name="colnum.colspec">
  <xsl:param name="colnum" select="0"/>
  <xsl:param name="attribute" select="'colname'"/>
  <xsl:param name="colspecs" select="ancestor::tgroup/colspec|ancestor::captionGroup/colspec"/>
  <xsl:param name="count" select="1"/>

  <xsl:choose>
    <xsl:when test="not($colspecs) or $count &gt; $colnum">
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

<xsl:template name="empty.table.cell">
  <xsl:param name="colnum" select="0"/>
  <xsl:param name="entry" select="self::node()"/>

  <xsl:variable name="rowsep">
    <xsl:choose>
      <!-- If this is the last row, rowsep never applies. -->
      <xsl:when test="not($entry/parent::row/following-sibling::row
                       or $entry/ancestor::thead/following-sibling::tbody
                       or $entry/ancestor::tbody/preceding-sibling::tfoot
                       or $entry/parent::captionRow/following-sibling::captionRow)">
        <xsl:value-of select="0"/>
      </xsl:when>
      <xsl:otherwise>
        <xsl:call-template name="inherited.table.attribute">
          <xsl:with-param name="entry" select="NOT-AN-ELEMENT-NAME"/>
          <xsl:with-param name="row" select="$entry/parent::row|$entry/parent::captionRow"/>
          <xsl:with-param name="colnum" select="$colnum"/>
          <xsl:with-param name="attribute" select="'rowsep'"/>
        </xsl:call-template>
      </xsl:otherwise>
    </xsl:choose>
  </xsl:variable>

  <xsl:variable name="colsep">
    <xsl:choose>
      <!-- If this is the last column, colsep never applies. -->
      <xsl:when test="$colnum &gt;= ancestor::tgroup/@cols">0</xsl:when>
      <xsl:when test="$colnum &gt;= ancestor::captionGroup/@cols">0</xsl:when>
      <xsl:otherwise>
        <xsl:call-template name="inherited.table.attribute">
          <xsl:with-param name="entry" select="NOT-AN-ELEMENT-NAME"/>
          <xsl:with-param name="row" select="$entry/parent::row|$entry/parent::captionRow"/>
          <xsl:with-param name="colnum" select="$colnum"/>
          <xsl:with-param name="attribute" select="'colsep'"/>
        </xsl:call-template>
      </xsl:otherwise>
    </xsl:choose>
  </xsl:variable>

  <!--td>
    <xsl:if test="($colsep &gt; 0) or ($rowsep &gt; 0)">
      <xsl:attribute name="style">
        <xsl:if test="$colsep &gt; 0">
          <xsl:call-template name="border">
            <xsl:with-param name="side" select="'right'"/>
          </xsl:call-template>
        </xsl:if>
        <xsl:if test="$rowsep &gt; 0">
          <xsl:call-template name="border">
            <xsl:with-param name="side" select="'bottom'"/>
          </xsl:call-template>
        </xsl:if>
      </xsl:attribute>
    </xsl:if>
    <xsl:text>&#xa0;</xsl:text>
  </td-->
  <xsl:variable name="l-class">
    <xsl:choose>
      <xsl:when test="($colsep &gt; 0) and ($rowsep &gt; 0)">bd-rb</xsl:when>
      <xsl:when test="$colsep &gt; 0">bd-r</xsl:when>
      <xsl:when test="$rowsep &gt; 0">bd-b</xsl:when>
      <xsl:otherwise>bd-no</xsl:otherwise>
    </xsl:choose>
  </xsl:variable>
  <td class="{$l-class}"><xsl:text>&#xa0;</xsl:text></td>
</xsl:template>

<xsl:template name="finaltd">
  <xsl:param name="spans"/>
  <xsl:param name="col" select="0"/>
  <xsl:param name="entry" select="self::node()"/>

  <xsl:if test="$spans!=''">
    <xsl:if test="starts-with($spans,'0:')">
      <xsl:call-template name="empty.table.cell">
        <xsl:with-param name="colnum" select="$col"/>
        <xsl:with-param name="entry" select="$entry"/>
      </xsl:call-template>
    </xsl:if>

    <xsl:call-template name="finaltd">
      <xsl:with-param name="spans" select="substring-after($spans,':')"/>
      <xsl:with-param name="col" select="$col+1"/>
      <xsl:with-param name="entry" select="$entry"/>
    </xsl:call-template>
  </xsl:if>
</xsl:template>

<xsl:template name="sfinaltd">
  <xsl:param name="spans"/>

  <xsl:if test="$spans!=''">
    <xsl:choose>
      <xsl:when test="starts-with($spans,'0:')">0:</xsl:when>
      <xsl:otherwise>
        <xsl:value-of select="concat(number(substring-before($spans,':'))-1,':')"/>
      </xsl:otherwise>
    </xsl:choose>

    <xsl:call-template name="sfinaltd">
      <xsl:with-param name="spans" select="substring-after($spans,':')"/>
    </xsl:call-template>
  </xsl:if>
</xsl:template>

<xsl:template name="get-attribute">
  <xsl:param name="element" select="self::node()"/>
  <xsl:param name="attribute" select="''"/>

  <xsl:value-of select="$element/@*[local-name(.)=$attribute]"/>
</xsl:template>

</xsl:stylesheet>

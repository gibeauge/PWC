<?xml version='1.0'?>

<!-- **********************************************************
       common.xsl - some common code for table and PI handling
     ********************************************************** -->

<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version='1.0'>

<!-- **********************************************************
       Some general/utility templates for table handling
     ********************************************************** -->

<xsl:template name="inherited.table.attribute">
  <xsl:param name="entry"     select="."/>
  <xsl:param name="row"       select="$entry/ancestor-or-self::row[1]"/>
  <xsl:param name="colnum"    select="0"/>
  <xsl:param name="attribute" select="'colsep'"/>
  <xsl:param name="lastrow"   select="0"/>
  <xsl:param name="lastcol"   select="0"/>

  <xsl:variable name="tgroup"     select="$row/ancestor::tgroup[1]"/>
  <xsl:variable name="tsubgroup"  select="$row/ancestor::*[local-name(.)='thead' or local-name(.)='tfoot' or local-name(.)='tbody'][1]"/>

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
        <xsl:when test="$spanspec.value != ''">
          <xsl:value-of select="$spanspec.value"/>
        </xsl:when>
        <xsl:when test="$scolspec.value != ''">
          <xsl:value-of select="$scolspec.value"/>
        </xsl:when>
        <xsl:otherwise></xsl:otherwise>
      </xsl:choose>
    </xsl:if>
  </xsl:variable>

  <xsl:variable name="namest.value">
    <xsl:if test="$entry/@namest">
      <xsl:variable name="namest" select="$entry/@namest"/>
      <xsl:variable name="colspec" select="$tgroup/colspec[@colname=$namest]"/>

      <xsl:variable name="namest.value">
        <xsl:call-template name="get-attribute">
          <xsl:with-param name="element" select="$colspec"/>
          <xsl:with-param name="attribute" select="$attribute"/>
        </xsl:call-template>
      </xsl:variable>

      <xsl:choose>
        <xsl:when test="$namest.value">
          <xsl:value-of select="$namest.value"/>
        </xsl:when>
        <xsl:otherwise></xsl:otherwise>
      </xsl:choose>
    </xsl:if>
  </xsl:variable>

  <xsl:variable name="tsubgroup.value">
    <!-- Get value from thead, tfoot, or tbody -->
    <xsl:call-template name="get-attribute">
      <xsl:with-param name="element" select="$tsubgroup"/>
      <xsl:with-param name="attribute" select="$attribute"/>
    </xsl:call-template>
  </xsl:variable>

  <xsl:variable name="tgroup.value">
    <xsl:call-template name="get-attribute">
      <xsl:with-param name="element" select="$tgroup"/>
      <xsl:with-param name="attribute" select="$attribute"/>
    </xsl:call-template>
  </xsl:variable>

  <xsl:variable name="default.value">
    <!-- rowsep and colsep can have defaults on the "table" wrapper and 
         ultimately on the frame setting for outside rules.  Non-outside
         rules are unaffected by the frame setting.  Both rowsep and colsep
         default to 1 on the table wrapper if otherwise unspecified.  -->
    <!-- handle those here, for everything else, the default is the tsubgroup
         (thead, tfoot, or tbody) value or else the tgroup value -->
    <xsl:choose>
      <xsl:when test="$tsubgroup.value != ''">
        <xsl:value-of select="$tsubgroup.value"/>
      </xsl:when>
      <xsl:when test="$tgroup.value != ''">
        <xsl:value-of select="$tgroup.value"/>
      </xsl:when>
      <xsl:when test="$attribute = 'rowsep'">
        <xsl:choose>
          <xsl:when test="$tgroup/parent::*/@rowsep">
            <xsl:value-of select="$tgroup/parent::*/@rowsep"/>
          </xsl:when>
          <xsl:otherwise>1</xsl:otherwise>
        </xsl:choose>
      </xsl:when>
      <xsl:when test="$attribute = 'colsep'">
        <xsl:choose>
          <xsl:when test="$tgroup/parent::*/@colsep">
            <xsl:value-of select="$tgroup/parent::*/@colsep"/>
          </xsl:when>
          <xsl:otherwise>1</xsl:otherwise>
        </xsl:choose>
      </xsl:when>
      <xsl:otherwise><!-- empty --></xsl:otherwise>
    </xsl:choose>
  </xsl:variable>

  <xsl:variable name="frame.value">
    <xsl:variable name="frame">
      <xsl:choose>
        <xsl:when test="$tgroup/parent::*/@frame">
          <xsl:value-of select="$tgroup/parent::*/@frame"/>
        </xsl:when>
        <xsl:otherwise>all</xsl:otherwise>
      </xsl:choose>
    </xsl:variable>
    <xsl:choose>
      <xsl:when test="$attribute='rowsep'">
        <xsl:choose>
          <xsl:when test="$frame='all' or $frame='topbot' or $frame='bot'">1</xsl:when>
          <xsl:otherwise>0</xsl:otherwise>
        </xsl:choose>
      </xsl:when>
      <xsl:when test="$attribute='colsep'">
        <xsl:choose>
          <xsl:when test="$frame='all' or $frame='sides'">1</xsl:when>
          <xsl:otherwise>0</xsl:otherwise>
        </xsl:choose>
      </xsl:when>
    </xsl:choose>
  </xsl:variable>

  <xsl:choose>
    <xsl:when test="$lastrow='1' and $attribute='rowsep'">
      <xsl:value-of select="$frame.value"/>
    </xsl:when>
    <xsl:when test="$lastcol='1' and $attribute='colsep'">
      <xsl:value-of select="$frame.value"/>
    </xsl:when>
    <xsl:when test="$entry.value != ''">
      <xsl:value-of select="$entry.value"/>
    </xsl:when>
    <xsl:when test="$row.value != ''">
      <xsl:value-of select="$row.value"/>
    </xsl:when>
    <xsl:when test="$span.value != ''">
      <xsl:value-of select="$span.value"/>
    </xsl:when>
    <xsl:when test="$namest.value != ''">
      <xsl:value-of select="$namest.value"/>
    </xsl:when>
    <xsl:when test="$colnum &gt; 0">
      <xsl:variable name="calc.colvalue">
        <xsl:call-template name="colnum.colspec">
          <xsl:with-param name="colnum" select="$colnum"/>
          <xsl:with-param name="attribute" select="$attribute"/>
        </xsl:call-template>
      </xsl:variable>
      <xsl:choose>
        <xsl:when test="$calc.colvalue != ''">
          <xsl:value-of select="$calc.colvalue"/>
        </xsl:when>
        <xsl:otherwise>
          <xsl:value-of select="$default.value"/>
        </xsl:otherwise>
      </xsl:choose>
    </xsl:when>
    <xsl:otherwise>
      <xsl:value-of select="$default.value"/>
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

  <xsl:for-each select="$element/@*[local-name(.) = $attribute]">
    <xsl:value-of select="."/>
  </xsl:for-each>
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

<xsl:template name="calculate.colspan">
  <xsl:param name="entry" select="."/>
  <xsl:variable name="spanname" select="$entry/@spanname"/>
  <xsl:variable name="spanspec"
                select="$entry/ancestor::*[local-name(.)='tgroup']/*[local-name(.)='colspec'][@spanname=$spanname]"/>

  <xsl:variable name="namest">
    <xsl:choose>
      <xsl:when test="@spanname">
        <xsl:value-of select="$spanspec/@namest"/>
      </xsl:when>
      <xsl:otherwise>
        <xsl:value-of select="$entry/@namest"/>
      </xsl:otherwise>
    </xsl:choose>
  </xsl:variable>

  <xsl:variable name="nameend">
    <xsl:choose>
      <xsl:when test="@spanname">
        <xsl:value-of select="$spanspec/@nameend"/>
      </xsl:when>
      <xsl:otherwise>
        <xsl:value-of select="$entry/@nameend"/>
      </xsl:otherwise>
    </xsl:choose>
  </xsl:variable>

  <xsl:variable name="scol">
    <xsl:call-template name="colspec.colnum">
      <xsl:with-param name="colspec"
                      select="$entry/ancestor::*[local-name(.)='tgroup']/*[local-name(.)='colspec'][@colname=$namest]"/>
    </xsl:call-template>
  </xsl:variable>

  <xsl:variable name="ecol">
    <xsl:call-template name="colspec.colnum">
      <xsl:with-param name="colspec"
                      select="$entry/ancestor::*[local-name(.)='tgroup']/*[local-name(.)='colspec'][@colname=$nameend]"/>
    </xsl:call-template>
  </xsl:variable>

  <xsl:choose>
    <xsl:when test="$namest != '' and $nameend != ''">
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

<xsl:template name="colspec.colnum">
  <xsl:param name="colspec" select="."/>
  <xsl:choose>
    <xsl:when test="$colspec/@colnum">
      <xsl:value-of select="$colspec/@colnum"/>
    </xsl:when>
    <xsl:when test="$colspec/preceding-sibling::*[local-name(.)='colspec']">
      <xsl:variable name="prec.colspec.colnum">
        <xsl:call-template name="colspec.colnum">
          <xsl:with-param name="colspec"
                          select="$colspec/preceding-sibling::*[local-name(.)='colspec'][1]"/>
        </xsl:call-template>
      </xsl:variable>
      <xsl:value-of select="$prec.colspec.colnum + 1"/>
    </xsl:when>
    <xsl:otherwise>1</xsl:otherwise>
  </xsl:choose>
</xsl:template>

<xsl:template name="set-lastrow">
  <xsl:variable name="rows-spanned">
    <xsl:choose>
      <xsl:when test="@morerows">
        <xsl:value-of select="@morerows+1"/>
      </xsl:when>
      <xsl:when test="@rowspan">
        <xsl:value-of select="@rowspan"/>
      </xsl:when>
      <xsl:otherwise>1</xsl:otherwise>
    </xsl:choose>
  </xsl:variable>
  <xsl:choose>
    <xsl:when test="ancestor::thead">0</xsl:when>
    <xsl:when test="ancestor::tfoot and not(ancestor::*[local-name(.)='row' or local-name(.)='tr']/following-sibling::*[local-name(.)='row' or local-name(.)='tr'])">1</xsl:when>
    <xsl:when test="not(ancestor::tfoot) and ancestor::*[local-name(.)='tgroup' or local-name(.)='table'][1]/tfoot">0</xsl:when>
    <xsl:when test="not(ancestor::tfoot) and not(ancestor::*[local-name(.)='tgroup' or local-name(.)='table'][1]/tfoot)
                      and count(ancestor::*[local-name(.)='row' or local-name(.)='tr']/following-sibling::*[local-name(.)='row' or local-name(.)='tr']) &lt; $rows-spanned">1</xsl:when>
    <xsl:otherwise>0</xsl:otherwise>
  </xsl:choose>
</xsl:template>

<xsl:template name="set-lastcol">
  <xsl:param name="col" select="count(preceding-sibling::*[local-name(.)='td' or local-name(.)='th' or local-name(.)='entry']) + 1"/>
    <xsl:variable name="spanname" select="@spanname"/>
    <xsl:variable name="spanspec"
                select="ancestor::*[local-name(.)='tgroup']/*[local-name(.)='spanspec'][@spanname=$spanname]"/>
    <xsl:variable name="nameend">
      <xsl:choose>
        <xsl:when test="@spanname">
          <xsl:value-of select="$spanspec/@nameend"/>
        </xsl:when>
        <xsl:otherwise>
          <xsl:value-of select="@nameend"/>
        </xsl:otherwise>
      </xsl:choose>
    </xsl:variable>
    <xsl:variable name="xcols-spanned">
      <xsl:choose>
        <xsl:when test="string(number(@colspan)) != 'NaN'">
          <xsl:value-of select="@colspan - 1"/>
        </xsl:when>
        <xsl:otherwise>0</xsl:otherwise>
      </xsl:choose>
    </xsl:variable>
    <xsl:variable name="ecol">
      <xsl:choose>
        <xsl:when test="$nameend!=''">
          <xsl:call-template name="colspec.colnum">
            <xsl:with-param name="colspec"
                    select="ancestor::*[local-name(.)='tgroup']/*[local-name(.)='colspec'][@colname=$nameend]"/>
          </xsl:call-template>
        </xsl:when>
        <xsl:otherwise>
          <xsl:value-of select="$col + $xcols-spanned"/>
        </xsl:otherwise>
      </xsl:choose>
    </xsl:variable>
    <xsl:variable name="numcols">
      <xsl:choose>
        <xsl:when test="string(number(ancestor::*[local-name(.)='tgroup']/@cols))!='NaN'">
          <xsl:value-of select="number(ancestor::*[local-name(.)='tgroup']/@cols)"/>
        </xsl:when>
        <xsl:when test="ancestor::*[local-name(.)='tgroup']/*[local-name(.)='colspec']">
          <xsl:value-of select="count(ancestor::*[local-name(.)='tgroup']/*[local-name(.)='colspec'])"/>
        </xsl:when>
        <xsl:when test="ancestor::*[local-name(.)='table']//*[local-name(.)='col']">
          <xsl:value-of select="count(ancestor::*[local-name(.)='table']/*[local-name(.)='col']|
              ancestor::*[local-name(.)='table']/*[local-name(.)='colgroup']/*[local-name(.)='col'])"/>
        </xsl:when>
        <xsl:otherwise>0</xsl:otherwise>
      </xsl:choose>
    </xsl:variable>
    <xsl:choose>
      <xsl:when test="number($ecol) &lt; $numcols">0</xsl:when>
      <xsl:otherwise>1</xsl:otherwise>
    </xsl:choose>
</xsl:template>

<xsl:template name="set-firstrow">
    <xsl:choose>
      <xsl:when test="ancestor::*[local-name(.)='tfoot']">0</xsl:when>
      <xsl:when test="ancestor::*[local-name(.)='thead']
                      and not(ancestor::*[local-name(.)='row' or local-name(.)='tr']/preceding-sibling::*[local-name(.)='row' or local-name(.)='tr'])">1</xsl:when>
      <xsl:when test="not(ancestor::*[local-name(.)='thead'])
                      and ancestor::*[local-name(.)='tgroup' or local-name(.)='table'][1]/*[local-name(.)='thead']">0</xsl:when>
      <xsl:when test="not(ancestor::*[local-name(.)='thead'])
                      and not(ancestor::*[local-name(.)='tgroup' or local-name(.)='table'][1]/*[local-name(.)='thead'])
                      and not(ancestor::*[local-name(.)='row' or local-name(.)='tr']/preceding-sibling::*[local-name(.)='row' or local-name(.)='tr'])">1</xsl:when>
      <xsl:otherwise>0</xsl:otherwise>
    </xsl:choose>
</xsl:template>

<xsl:template name="set-firstcol">
  <xsl:param name="col" select="count(preceding-sibling::*[local-name(.)='td' or local-name(.)='th' or local-name(.)='entry']) + 1"/>
    <xsl:choose>
      <xsl:when test="$col &gt; 1">0</xsl:when>
      <xsl:otherwise>1</xsl:otherwise>
    </xsl:choose>
</xsl:template>

<xsl:template name="entry.colnum">
  <xsl:param name="entry" select="."/>

  <xsl:choose>
    <xsl:when test="$entry/@spanname">
      <xsl:variable name="spanname" select="$entry/@spanname"/>
      <xsl:variable name="spanspec"
                    select="$entry/ancestor::*[local-name(.)='tgroup']/*[local-name(.)='spanspec'][@spanname=$spanname]"/>
      <xsl:variable name="colspec"
                    select="$entry/ancestor::*[local-name(.)='tgroup']/*[local-name(.)='colspec'][@colname=$spanspec/@namest]"/>
      <xsl:call-template name="colspec.colnum">
        <xsl:with-param name="colspec" select="$colspec"/>
      </xsl:call-template>
    </xsl:when>
    <xsl:when test="$entry/@colname">
      <xsl:variable name="colname" select="$entry/@colname"/>
      <xsl:variable name="colspec"
                    select="$entry/ancestor::*[local-name(.)='tgroup']/*[local-name(.)='colspec'][@colname=$colname]"/>
      <xsl:call-template name="colspec.colnum">
        <xsl:with-param name="colspec" select="$colspec"/>
      </xsl:call-template>
    </xsl:when>
    <xsl:when test="$entry/@namest">
      <xsl:variable name="namest" select="$entry/@namest"/>
      <xsl:variable name="colspec"
                    select="$entry/ancestor::*[local-name(.)='tgroup']/*[local-name(.)='colspec'][@colname=$namest]"/>
      <xsl:call-template name="colspec.colnum">
        <xsl:with-param name="colspec" select="$colspec"/>
      </xsl:call-template>
    </xsl:when>
    <!-- no idea, return 0 -->
    <xsl:otherwise>0</xsl:otherwise>
  </xsl:choose>
</xsl:template>

</xsl:stylesheet>

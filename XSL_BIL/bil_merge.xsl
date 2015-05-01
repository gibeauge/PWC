<?xml version="1.0" encoding="UTF-8"?>

<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
                version="2.0">

<xsl:output method="html" indent="no"/>

<xsl:key name="k-id" match="*" use="@id"/>

<xsl:variable name="lang-orig" select="subsequence(tokenize(/html/@lang,'-'),1,1)"/>
<xsl:variable name="lang-trad" select="subsequence(tokenize(/html/@lang,'-'),2,1)"/>
<xsl:variable name="prefix" select="concat($lang-trad,'_')"/>

<xsl:template match="/">
  <xsl:apply-templates/>
</xsl:template>

<xsl:template match="@*|node()">
  <xsl:copy>
    <xsl:apply-templates select="@*|node()"/>
  </xsl:copy>
</xsl:template>

<xsl:template match="/html/@lang"/>

<xsl:template match="head/link"/>
<xsl:template match="head/script"/>
<xsl:template match="body/script"/>

<xsl:template match="td/node()[1][self::text()]|td/node()[position()=last()][self::text()]" priority="3">
  <xsl:choose>
    <xsl:when test="normalize-space(.)=''"></xsl:when>
    <xsl:otherwise>
      <xsl:next-match/>
    </xsl:otherwise>
  </xsl:choose>
</xsl:template>

<xsl:template match="div[contains(@class, 'x-pbfmatr-')]">
  <div>
    <xsl:apply-templates select="@*"/>
    <xsl:if test="@id and key('k-id',concat($prefix,@id))">
      <span id="{concat($prefix,@id)}"/>
    </xsl:if>
    <table class="merge">
      <colgroup>
        <col style="width:53%"/>
        <col style="width:47%"/>
      </colgroup>
      <tbody>
        <xsl:apply-templates select="node()"/>
      </tbody>
    </table>
  </div>
</xsl:template>

<xsl:template match="div[contains(@class,'x-pbfmatr-')]/div[contains(@class,'x-title')]" priority="5">
  <tr>
    <td class="merge-c1">
      <xsl:copy>
        <xsl:apply-templates select="@*|node()"/>
      </xsl:copy>
    </td>
    <td class="merge-c2">
      <xsl:call-template name="get-translated-object"/>
    </td>
  </tr>
</xsl:template>

<xsl:template match="div[contains(@class,'x-pbfmatr-')]/div[contains(@class,'x-list1-')]" priority="5">
  <xsl:apply-templates/>
</xsl:template>

<xsl:template match="div[contains(@class,'x-pbfmatr-')]/div[contains(@class,'x-list1-')]/table[contains(@class,'x-l1item')]" priority="5">
  <xsl:variable name="class" select="@class"/>
  <tr>
    <td class="merge-c1">
      <div class="{../@class}">
        <xsl:copy>
          <xsl:apply-templates select="@*|node()"/>
        </xsl:copy>
      </div>
    </td>
    <td class="merge-c2">
      <div class="{../@class}">
        <xsl:call-template name="get-translated-object">
          <xsl:with-param name="from-parent" select="'1'"/>
          <xsl:with-param name="class" select="@class"/>
          <xsl:with-param name="pos" select="count(preceding-sibling::*[contains(@class,$class)])+1"/>
        </xsl:call-template>
      </div>
    </td>
  </tr>
</xsl:template>

<xsl:template match="div[contains(@class, 'x-task-')]">
  <div>
    <xsl:apply-templates select="@*"/>
    <xsl:if test="@id and key('k-id',concat($prefix,@id))">
      <span id="{concat($prefix,@id)}"/>
    </xsl:if>
    <table class="merge">
      <colgroup>
        <col style="width:53%"/>
        <col style="width:47%"/>
      </colgroup>
      <tbody>
        <xsl:apply-templates select="node()"/>
      </tbody>
    </table>
  </div>
</xsl:template>

<xsl:template match="div[contains(@class,'x-task-')]/div[contains(@class,'task-postspace')]" priority="5">
  <tr>
    <td class="merge-c1">
      <xsl:copy>
        <xsl:apply-templates select="@*|node()"/>
      </xsl:copy>
    </td>
    <td class="merge-c2">
      <xsl:call-template name="get-translated-object">
        <xsl:with-param name="from-parent" select="'1'"/>
        <xsl:with-param name="class" select="@class"/>
      </xsl:call-template>
    </td>
  </tr>
</xsl:template>

<xsl:template match="div[contains(@class,'x-task-')]/div[contains(@class,'x-title')]" priority="5">
  <tr>
    <td class="merge-c1">
      <xsl:copy>
        <xsl:apply-templates select="@*|node()"/>
      </xsl:copy>
    </td>
    <td class="merge-c2">
      <xsl:call-template name="get-translated-object"/>
    </td>
  </tr>
</xsl:template>

<xsl:template match="div[contains(@class,'x-task-')]/div[contains(@class,'x-warning-wrapper') or contains(@class,'x-caution-wrapper')]" priority="5">
  <xsl:variable name="class" select="@class"/>
  <tr>
    <td class="merge-c1">
      <xsl:copy>
        <xsl:apply-templates select="@*|node()"/>
      </xsl:copy>
    </td>
    <td class="merge-c2">
      <xsl:call-template name="get-translated-object">
        <xsl:with-param name="from-parent" select="'1'"/>
        <xsl:with-param name="class" select="@class"/>
        <xsl:with-param name="pos" select="count(preceding-sibling::*[contains(@class,$class)])+1"/>
      </xsl:call-template>
    </td>
  </tr>
</xsl:template>

<xsl:template match="div[contains(@class,'x-task-')]/div[contains(@class,'x-subtask-')]" priority="5">
  <tr>
    <td class="merge-c1">
      <xsl:copy>
        <xsl:apply-templates select="@*|node()"/>
      </xsl:copy>
    </td>
    <td class="merge-c2">
      <xsl:call-template name="get-translated-object"/>
    </td>
  </tr>
</xsl:template>

<xsl:template match="div[contains(@class,'x-task-')]/div[contains(@class,'x-tfmatr')]" priority="5">
  <xsl:apply-templates/>
</xsl:template>

<xsl:template match="div[contains(@class,'x-task-')]/div[contains(@class,'x-tfmatr')]/div[contains(@class,'x-tprereq')]" priority="5">
  <tr>
    <td class="merge-c1">
      <div class="{../@class}">
        <xsl:copy>
          <xsl:apply-templates select="@*|node()"/>
        </xsl:copy>
      </div>
    </td>
    <td class="merge-c2">
      <div class="{../@class}">
        <xsl:call-template name="get-translated-object"/>
      </div>
    </td>
  </tr>
</xsl:template>

<xsl:template match="div[contains(@class,'x-task-')]/div[contains(@class,'x-taskproc')]" priority="5">
  <tr>
    <td class="merge-c1">
      <xsl:copy>
        <xsl:apply-templates select="@*|node()"/>
      </xsl:copy>
    </td>
    <td class="merge-c2">
      <xsl:call-template name="get-translated-object"/>
    </td>
  </tr>
</xsl:template>

<xsl:template match="div[contains(@class, 'x-task-')]/*" priority="1">
  <tr>
    <td colspan="2" class="merge-c">
      <xsl:copy>
        <xsl:apply-templates select="@*|node()"/>
      </xsl:copy>
    </td>
  </tr>
</xsl:template>

<xsl:template match="div[contains(@class, 'x-graphic-')]/*/div[contains(@class, 'x-title-')]" priority="5">
  <xsl:copy>
  	<xsl:apply-templates select="@*|node()"/>
    <xsl:text> / </xsl:text>
    <xsl:call-template name="get-translated-object">
      <xsl:with-param name="text-only" select="'1'"/>
    </xsl:call-template>
  </xsl:copy>
</xsl:template>

<xsl:template match="div[contains(@class, 'x-graphic-')]/*/div[contains(@class, 'block-prespace')]" priority="5">
  <xsl:copy>
    <xsl:apply-templates select="@*|node()"/>
    <xsl:text> / </xsl:text>
    <xsl:call-template name="get-translated-object">
      <xsl:with-param name="from-parent" select="'1'"/>
      <xsl:with-param name="class" select="'block-prespace'"/>
      <xsl:with-param name="text-only" select="'1'"/>
    </xsl:call-template>
  </xsl:copy>
</xsl:template>

<xsl:template match="div[contains(@class, 'x-graphic-')]/*/div[contains(@class, 'x-sheet-')]//div[contains(@class, 'pr-tbl')]" priority="5">
  <xsl:copy>
    <xsl:apply-templates select="@*|node()"/>
  </xsl:copy>
  <xsl:call-template name="get-translated-object"/>
</xsl:template>

<xsl:template match="div[contains(@class, 'x-lof-')]">
  <div>
    <xsl:apply-templates select="@*"/>
    <xsl:if test="@id and key('k-id',concat($prefix,@id))">
      <span id="{concat($prefix,@id)}"/>
    </xsl:if>
    <table class="merge">
      <colgroup>
        <col  style="width:53%"/>
        <col  style="width:47%"/>
      </colgroup>
      <tbody>
        <xsl:apply-templates select="node()"/>
      </tbody>
    </table>
  </div>
</xsl:template>

<xsl:template match="div[contains(@class,'x-lof-1')]/div[contains(@class,'x-lof-item')]" priority="5">
  <tr>
    <td class="merge-c1">
      <xsl:copy>
        <xsl:apply-templates select="@*|node()"/>
      </xsl:copy>
    </td>
    <td class="merge-c2">
      <xsl:call-template name="get-translated-object"/>
    </td>
  </tr>
</xsl:template>

<xsl:template match="div[contains(@class,'x-lof-1')]/div[contains(@class,'x-title')]" priority="5">
  <tr>
    <td class="merge-c1">
      <xsl:copy>
        <xsl:apply-templates select="@*|node()"/>
      </xsl:copy>
    </td>
    <td class="merge-c2">
      <xsl:call-template name="get-translated-object"/>
    </td>
  </tr>
</xsl:template>

<xsl:template match="div[contains(@class, 'x-lof-1')]/*" priority="1">
  <tr>
    <td colspan="2" class="merge-c">
      <xsl:copy>
        <xsl:apply-templates select="@*|node()"/>
      </xsl:copy>
    </td>
  </tr>
</xsl:template>

<!-- Remove translated content from file -->
<xsl:template match="div[starts-with(@id, $prefix)]" priority="8"/>

<xsl:template name="get-translated-object">
  <xsl:param name="from-parent" select="'0'"/>
  <xsl:param name="class"/>
  <xsl:param name="text-only" select="'0'"/>
  <xsl:param name="pos" select="number('1')"/>
  
  <xsl:choose>
    <xsl:when test="@id">
      <xsl:variable name="trad-obj" select="key('k-id',concat($prefix,@id))"/>
      <xsl:choose>
      	<xsl:when test="$trad-obj and $text-only='0'">
          <xsl:copy-of select="$trad-obj"/>
        </xsl:when>
        <xsl:when test="$trad-obj and $text-only='1'">
          <xsl:copy-of select="$trad-obj//text()"/>
        </xsl:when>
        <xsl:otherwise>
          <xsl:call-template name="error">
            <xsl:with-param name="msg">No corresponding structure found</xsl:with-param>
          </xsl:call-template>
        </xsl:otherwise>
      </xsl:choose>
    </xsl:when>
    <xsl:when test="$from-parent='1' and ../@id">
      <xsl:variable name="trad-obj" select="key('k-id',concat($prefix,../@id))"/>
      <xsl:choose>
        <xsl:when test="$trad-obj and $trad-obj/*[contains(@class,$class)] and $text-only='0'">
          <xsl:copy-of select="$trad-obj/*[contains(@class,$class)][$pos]"/>
        </xsl:when>
        <xsl:when test="$trad-obj and $trad-obj/*[contains(@class,$class)] and $text-only='1'">
          <xsl:copy-of select="$trad-obj/*[contains(@class,$class)][$pos]//text()"/>
        </xsl:when>
        <xsl:otherwise>
          <xsl:call-template name="error">
            <xsl:with-param name="msg">No corresponding structure found</xsl:with-param>
          </xsl:call-template>
        </xsl:otherwise>
      </xsl:choose>
    </xsl:when>
    <!-- try another level in case of not identified intermediate structure  -->
    <xsl:when test="$from-parent='1' and ../../@id">
      <xsl:variable name="trad-obj" select="key('k-id',concat($prefix,../../@id))"/>
      <xsl:choose>
        <xsl:when test="$trad-obj and $trad-obj/*/*[contains(@class,$class)] and $text-only='0'">
          <xsl:copy-of select="$trad-obj/*/*[contains(@class,$class)][$pos]"/>
        </xsl:when>
        <xsl:when test="$trad-obj and $trad-obj/*/*[contains(@class,$class)] and $text-only='1'">
          <xsl:copy-of select="$trad-obj/*/*[contains(@class,$class)][$pos]//text()"/>
        </xsl:when>
        <xsl:otherwise>
          <xsl:call-template name="error">
            <xsl:with-param name="msg">No corresponding structure found</xsl:with-param>
          </xsl:call-template>
        </xsl:otherwise>
      </xsl:choose>
    </xsl:when>
    <xsl:otherwise>
      <xsl:call-template name="error">
        <xsl:with-param name="msg">No Id available : cannot link original and translated structures</xsl:with-param>
      </xsl:call-template>
    </xsl:otherwise>
  </xsl:choose>
</xsl:template>
      
<xsl:template name="error">
  <xsl:param name="msg"/>
  <span style="color:red"><xsl:value-of select="$msg"/></span>
</xsl:template>

</xsl:stylesheet>
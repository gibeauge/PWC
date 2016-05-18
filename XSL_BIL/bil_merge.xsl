<?xml version="1.0" encoding="UTF-8"?>

<!-- 
  File        : bil_merge.xsl
  Author      : Gilles Beaugeais (euroscript Canada for PWC Canada)
  Description : Merge source contents (EN) and translated contents (ZH) as a table.
                 Correspondance is done using class names and ID
-->

<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
                xmlns:exslt="http://exslt.org/common"
                version="2.0">

<xsl:output method="xhtml" indent="yes" omit-xml-declaration="yes"/>

<xsl:key name="k-id" match="*" use="@id"/>

<xsl:variable name="lang-orig" select="subsequence(tokenize(/html/@lang,'-'),1,1)"/>
<xsl:variable name="lang-trad" select="subsequence(tokenize(/html/@lang,'-'),2,1)"/>
<xsl:variable name="prefix" select="concat($lang-trad,'_')"/>

<xsl:param name="output-as" select="'table'"/> <!-- table or div -->

<xsl:variable name="col1-width">
  <xsl:choose>
    <xsl:when test="$lang-orig='en' and $lang-trad='zh'">53%</xsl:when>
    <xsl:when test="$lang-orig='en' and $lang-trad='pt'">47%</xsl:when>
    <xsl:otherwise>50%</xsl:otherwise>
  </xsl:choose>
</xsl:variable>

<xsl:variable name="col2-width">
  <xsl:choose>
    <xsl:when test="$lang-orig='en' and $lang-trad='zh'">47%</xsl:when>
    <xsl:when test="$lang-orig='en' and $lang-trad='pt'">53%</xsl:when>
    <xsl:otherwise>50%</xsl:otherwise>
  </xsl:choose>
</xsl:variable>

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


<!-- ** FOR PORTUGUESE PROJECT ** -->

<xsl:template match="div[contains(@class, 'x-n-para-')]">
  <xsl:call-template name="main-table"/>
</xsl:template>

<xsl:template match="div[contains(@class, 'x-n-para-')]/div[contains(@class,'x-title')]" priority="5">
  <xsl:call-template name="main-table-title"/>
</xsl:template>

<xsl:template match="div[contains(@class,'x-n-para-')]/div[contains(@class,'x-procedure-')]" priority="5">
  <xsl:call-template name="main-table-object"/>
</xsl:template>

<xsl:template match="div[contains(@class,'x-n-para-')]/div[@class='pr-brk']" priority="5">
  <xsl:call-template name="main-table-cells-merged"/>
</xsl:template>

<xsl:template match="div[contains(@class,'x-n-para-')]/div[contains(@class,'x-figure')]" priority="5">
  <xsl:call-template name="main-table-cells-merged"/>
</xsl:template>

<xsl:template match="div[contains(@class,'x-n-para-')]/div[contains(@class,'x-warning-wrapper') or contains(@class,'x-caution-wrapper')]" priority="5">
  <xsl:call-template name="main-table-alert"/>
</xsl:template>

<xsl:template match="div[contains(@class,'x-n-para-')]/div[contains(@class,'x-note-')]" priority="5">
  <xsl:call-template name="main-table-alert"/>
</xsl:template>

<xsl:template match="div[contains(@class,'x-n-para-')]/*" priority="4">
  <xsl:call-template name="main-table-object"/>
</xsl:template>

<xsl:template match="div[contains(@class, 'x-figure-')]/*/div[contains(@class, 'x-title-')]" priority="5">
  <xsl:copy>
  	<xsl:apply-templates select="@*|node()"/>
    <span class="graphic-title-trans">
      <xsl:text> / </xsl:text>
      <xsl:call-template name="get-translated-object">
        <xsl:with-param name="text-only" select="'1'"/>
      </xsl:call-template>
    </span>
  </xsl:copy>
</xsl:template>

<xsl:template match="div[contains(@class, 'x-key-')]/span[contains(@class, 'x-def-')]" priority="5">
  <xsl:variable name="class" select="@class"/>
  <xsl:copy>
  	<xsl:apply-templates select="@*|node()[not(self::br)]"/>
    <span class="graphic-title-trans">
      <xsl:text> / </xsl:text>
      <xsl:call-template name="get-translated-object">
        <xsl:with-param name="text-only" select="'1'"/>
        <xsl:with-param name="from-parent" select="'1'"/>
        <xsl:with-param name="class" select="@class"/>
        <xsl:with-param name="pos" select="count(preceding-sibling::*[contains(@class,$class)])+1"/>
      </xsl:call-template>
    </span>
    <xsl:apply-templates select="br"/>
  </xsl:copy>
</xsl:template>

<xsl:template match="div[contains(@class, 'x-figure-')]/*/div[contains(@class, 'x-sheet-')]//div[contains(@class, 'pr-tbl')]" priority="5">
  <xsl:copy>
    <xsl:apply-templates select="@*|node()"/>
  </xsl:copy>
  <xsl:call-template name="get-translated-object"/>
</xsl:template>

<xsl:template match="div[ancestor::html[.//div[contains(@class, 'x-n-para-')]] and contains(@class, 'x-module-') and not(div[contains(@class, 'x-n-para-')])]" priority="5">
  <xsl:call-template name="main-table"/>
</xsl:template>

<xsl:template match="div[ancestor::html[.//div[contains(@class, 'x-n-para-')]] and contains(@class, 'x-module-') and not(div[contains(@class, 'x-n-para-')])]/div[@class='pr-brk']" priority="5">
  <xsl:call-template name="main-table-cells-merged"/>
</xsl:template>

<xsl:template match="div[ancestor::html[.//div[contains(@class, 'x-n-para-')]] and contains(@class, 'x-module-') and not(div[contains(@class, 'x-n-para-')])]/div[contains(@class,'x-figure')]" priority="5">
  <xsl:call-template name="main-table-cells-merged"/>
</xsl:template>

<xsl:template match="div[ancestor::html[.//div[contains(@class, 'x-n-para-')]] and contains(@class, 'x-module-') and not(div[contains(@class, 'x-n-para-')])]/*" priority="4">
  <xsl:call-template name="main-table-object"/>
</xsl:template>


<!-- ** FOR CHINESE PROJECT ** -->

<xsl:template match="div[contains(@class, 'x-pbfmatr-')]">
  <xsl:call-template name="main-table"/>
</xsl:template>

<xsl:template match="div[contains(@class,'x-pbfmatr-')]/div[contains(@class,'x-title')]" priority="5">
  <xsl:call-template name="main-table-title"/>
</xsl:template>

<xsl:template match="div[contains(@class,'x-pbfmatr-')]/div[contains(@class,'x-list1-')]" priority="5">
  <xsl:apply-templates/>
</xsl:template>

<xsl:template match="div[contains(@class,'x-pbfmatr-')]/div[contains(@class,'x-list1-')]/table[contains(@class,'x-l1item')]" priority="5">
  <xsl:variable name="class" select="@class"/>
  <xsl:choose>
    <xsl:when test="$output-as='table'">
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
    </xsl:when>
    <xsl:otherwise>
      <div class="merge-dr">
      <div class="merge-d1">
        <div class="{../@class}">
          <xsl:copy>
            <xsl:apply-templates select="@*|node()"/>
          </xsl:copy>
        </div>
      </div>
      <div class="merge-d2">
        <div class="{../@class}">
          <xsl:call-template name="get-translated-object">
            <xsl:with-param name="from-parent" select="'1'"/>
            <xsl:with-param name="class" select="@class"/>
            <xsl:with-param name="pos" select="count(preceding-sibling::*[contains(@class,$class)])+1"/>
          </xsl:call-template>
        </div>
      </div>
      </div>
    </xsl:otherwise>
  </xsl:choose>
</xsl:template>

<xsl:template match="div[contains(@class, 'x-task-')]">
  <xsl:call-template name="main-table"/>
</xsl:template>

<xsl:template match="div[contains(@class,'x-task-')]/div[contains(@class,'task-postspace')]" priority="5">
  <xsl:choose>
    <xsl:when test="$output-as='table'">
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
    </xsl:when>
    <xsl:otherwise>
      <div class="merge-dr">
      <div class="merge-d1">
        <xsl:copy>
          <xsl:apply-templates select="@*|node()"/>
        </xsl:copy>
      </div>
      <div class="merge-d2">
        <xsl:call-template name="get-translated-object">
          <xsl:with-param name="from-parent" select="'1'"/>
          <xsl:with-param name="class" select="@class"/>
        </xsl:call-template>
      </div>
      </div>
    </xsl:otherwise>
  </xsl:choose>
</xsl:template>

<xsl:template match="div[contains(@class,'x-task-')]/div[contains(@class,'x-title')]" priority="5">
  <xsl:call-template name="main-table-title"/>
</xsl:template>

<xsl:template match="div[contains(@class,'x-task-')]/div[contains(@class,'x-warning-wrapper') or contains(@class,'x-caution-wrapper')]" priority="5">
  <xsl:call-template name="main-table-alert"/>
</xsl:template>

<xsl:template match="div[contains(@class,'x-task-')]/div[contains(@class,'x-subtask-')]" priority="5">
  <xsl:call-template name="main-table-object"/>
</xsl:template>

<xsl:template match="div[contains(@class,'x-task-')]/div[contains(@class,'x-tfmatr')]" priority="5">
  <xsl:apply-templates/>
</xsl:template>

<xsl:template match="div[contains(@class,'x-task-')]/div[contains(@class,'x-tfmatr')]/div[contains(@class,'x-tprereq')]" priority="5">
  <xsl:choose>
    <xsl:when test="$output-as='table'">
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
    </xsl:when>
    <xsl:otherwise>
      <div class="merge-dr">
      <div class="merge-d1">
        <div class="{../@class}">
          <xsl:copy>
            <xsl:apply-templates select="@*|node()"/>
          </xsl:copy>
        </div>
      </div>
      <div class="merge-d2">
        <div class="{../@class}">
          <xsl:call-template name="get-translated-object"/>
        </div>
      </div>
      </div>
    </xsl:otherwise>
  </xsl:choose>
</xsl:template>

<xsl:template match="div[contains(@class,'x-task-')]/div[contains(@class,'x-taskproc')]" priority="5">
  <xsl:call-template name="main-table-object"/>
</xsl:template>

<xsl:template match="div[contains(@class, 'x-task-')]/*" priority="1">
  <xsl:call-template name="main-table-cells-merged"/>
</xsl:template>

<xsl:template match="div[contains(@class, 'x-graphic-')]/*/div[contains(@class, 'x-title-')]" priority="5">
  <xsl:copy>
  	<xsl:apply-templates select="@*|node()"/>
    <span class="graphic-title-trans">
      <xsl:text> / </xsl:text>
      <xsl:call-template name="get-translated-object">
        <xsl:with-param name="text-only" select="'1'"/>
      </xsl:call-template>
    </span>
  </xsl:copy>
</xsl:template>

<xsl:template match="div[contains(@class, 'x-graphic-')]/*/div[contains(@class, 'block-prespace')]" priority="5">
  <xsl:copy>
    <xsl:apply-templates select="@*|node()"/>
    <span class="graphic-title-trans">
      <xsl:text> / </xsl:text>
      <xsl:call-template name="get-translated-object">
        <xsl:with-param name="from-parent" select="'1'"/>
        <xsl:with-param name="class" select="'block-prespace'"/>
        <xsl:with-param name="text-only" select="'1'"/>
      </xsl:call-template>
    </span>
  </xsl:copy>
</xsl:template>

<xsl:template match="div[contains(@class, 'x-graphic-')]/*/div[contains(@class, 'x-sheet-')]//div[contains(@class, 'pr-tbl')]" priority="5">
  <xsl:copy>
    <xsl:apply-templates select="@*|node()"/>
  </xsl:copy>
  <xsl:call-template name="get-translated-object"/>
</xsl:template>

<xsl:template match="div[contains(@class, 'x-lof-')]">
  <xsl:call-template name="main-table"/>
</xsl:template>

<xsl:template match="div[contains(@class,'x-lof-1')]/div[contains(@class,'x-lof-item')]" priority="5">
  <xsl:call-template name="main-table-object"/>
</xsl:template>

<xsl:template match="div[contains(@class,'x-lof-1')]/div[contains(@class,'x-title')]" priority="5">
  <xsl:call-template name="main-table-title"/>
</xsl:template>

<xsl:template match="div[contains(@class, 'x-lof-1')]/*" priority="1">
  <xsl:call-template name="main-table-cells-merged"/>
</xsl:template>


<!-- ** COMMON ** -->

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

<xsl:template name="main-table">
  <div>
    <xsl:apply-templates select="@*"/>
    <xsl:if test="@id and key('k-id',concat($prefix,@id))">
      <span id="{concat($prefix,@id)}"/>
    </xsl:if>
    <xsl:choose>
      <xsl:when test="$output-as='table'">
        <table class="merge">
          <colgroup>
            <col style="{concat('width:',$col1-width)}"/>
            <col style="{concat('width:',$col2-width)}"/>
          </colgroup>
          <tbody>
            <xsl:apply-templates select="node()"/>
          </tbody>
        </table>
      </xsl:when>
      <xsl:otherwise>
        <div class="merge">
          <xsl:apply-templates select="node()"/>
        </div>
      </xsl:otherwise>
    </xsl:choose>
  </div>
</xsl:template>

<xsl:template name="main-table-title">
  <xsl:call-template name="main-table-object"/>
</xsl:template>

<xsl:template name="main-table-object">
  <xsl:choose>
    <xsl:when test="$output-as='table'">
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
    </xsl:when>
    <xsl:otherwise>
      <div class="merge-dr">
      <div class="merge-d1">
        <xsl:copy>
          <xsl:apply-templates select="@*|node()"/>
        </xsl:copy>
      </div>
      <div class="merge-d2">
        <xsl:call-template name="get-translated-object"/>
      </div>
      </div>
    </xsl:otherwise>
  </xsl:choose>
</xsl:template>

<xsl:template name="main-table-cells-merged">
  <xsl:choose>
    <xsl:when test="$output-as='table'">
      <tr>
        <td colspan="2" class="merge-c">
          <xsl:copy>
            <xsl:apply-templates select="@*|node()"/>
          </xsl:copy>
        </td>
      </tr>
    </xsl:when>
    <xsl:otherwise>
      <div class="merge-dr">
      <div class="merge-d">
        <xsl:copy>
          <xsl:apply-templates select="@*|node()"/>
        </xsl:copy>
      </div>
      </div>
    </xsl:otherwise>
  </xsl:choose>
</xsl:template>

<xsl:template name="main-table-alert">
  <xsl:variable name="class" select="@class"/>
  <xsl:choose>
    <xsl:when test="$output-as='table'">
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
    </xsl:when>
    <xsl:otherwise>
      <div class="merge-dr">
      <div class="merge-d1">
        <xsl:copy>
          <xsl:apply-templates select="@*|node()"/>
        </xsl:copy>
      </div>
      <div class="merge-d2">
        <xsl:call-template name="get-translated-object">
          <xsl:with-param name="from-parent" select="'1'"/>
          <xsl:with-param name="class" select="@class"/>
          <xsl:with-param name="pos" select="count(preceding-sibling::*[contains(@class,$class)])+1"/>
        </xsl:call-template>
      </div>
      </div>
    </xsl:otherwise>
  </xsl:choose>
</xsl:template>

<xsl:template name="error">
  <xsl:param name="msg"/>
  <span style="color:red"><xsl:value-of select="$msg"/></span>
</xsl:template>

</xsl:stylesheet>
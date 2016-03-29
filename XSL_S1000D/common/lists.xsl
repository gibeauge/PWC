<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:fn="http://www.pwc.ca"
    xmlns:xs="http://www.w3.org/2001/XMLSchema"
    xmlns="http://www.w3.org/1999/xhtml"
    exclude-result-prefixes="xs fn #default"
    version="2.0">
    
<!-- ************************************************************** -->

<xsl:template match="definitionList">
  <div>
    <xsl:call-template name="setID"/>
      <xsl:call-template name="change">
        <xsl:with-param name="class" select="'s-defList'"/>
      </xsl:call-template>
    <table>
      <xsl:apply-templates select="title"/>
      <xsl:apply-templates select="definitionListHeader"/>
      <col style="width:12em"/>
      <col style="width:24em"/>
      <tbody>
        <xsl:apply-templates select="child::*[not(self::definitionListHeader or self::title)]"/>
      </tbody>
    </table>
  </div>
</xsl:template>

<xsl:template match="definitionList" mode="chg-del">
  <xsl:call-template name="delete-as-div">
    <xsl:with-param name="class" select="'s-defList'"/>
  </xsl:call-template>
</xsl:template>

<xsl:template match="definitionList/title">
    <caption><xsl:apply-templates/></caption>
</xsl:template>

<xsl:template match="definitionListHeader">
  <thead>
    <tr>
      <xsl:apply-templates/>
    </tr>
  </thead>
</xsl:template>

<xsl:template match="termTitle|definitionTitle">
  <th><xsl:apply-templates/></th>
</xsl:template>

<xsl:template match="definitionListItem">
  <tr>
    <xsl:call-template name="change"/>
    <xsl:apply-templates/>
  </tr>
</xsl:template>

<xsl:template match="definitionListItem" mode="chg-del">
  <xsl:call-template name="delete-as-row">
    <xsl:with-param name="span" select="number(2)"/>
  </xsl:call-template>
</xsl:template>

<xsl:template match="listItemDefinition|listItemTerm">
  <td>
    <xsl:call-template name="change"/>
    <xsl:apply-templates/>
  </td>
</xsl:template>

<xsl:template match="listItemDefinition|listItemTerm" mode="chg-del">
  <xsl:call-template name="delete-as-cell">
    <xsl:with-param name="span" select="number(1)"/>
  </xsl:call-template>
</xsl:template>

<!-- ************************************************************** -->
    
<xsl:template match="legend/definitionList" priority="10">
  <div class="s-legend-defList">
    <table>
      <caption>
        <xsl:value-of select="fn:getGenText('title-legend')"/>
        <xsl:apply-templates select="ancestor::figure" mode="numbering"/>
        <xsl:value-of select="fn:getGenText('sep1')"/>
      </caption>
      <col style="width:2em"/>
      <col style="width:36em"/>
      <col style="width:2em"/>
      <col style="width:36em"/>
      <tbody>
        <xsl:next-match/>
      </tbody>
    </table>
  </div>
</xsl:template>

<xsl:template match="legend/definitionList">
  <xsl:call-template name="change">
    <xsl:with-param name="node" select=".."/>
  </xsl:call-template>
  <xsl:call-template name="change"/>

  <xsl:variable name="limit" select="round(count(definitionListItem) div 2)"/>
  <xsl:for-each select="definitionListItem[position() &lt; number($limit) + 1]">
    <xsl:variable name="position" select="position()"/>
    <tr>
      <xsl:apply-templates select="listItemTerm"/>
      <xsl:apply-templates select="listItemDefinition"/>
      <xsl:choose>
        <xsl:when test="not(../definitionListItem[$position + $limit])">
          <td>&#032;</td><td>&#032;</td>
        </xsl:when>
        <xsl:otherwise>
          <xsl:apply-templates select="../definitionListItem[($position + $limit)]/listItemTerm"/>
          <xsl:apply-templates select="../definitionListItem[($position + $limit)]/listItemDefinition"/>
        </xsl:otherwise>
      </xsl:choose>
    </tr>
  </xsl:for-each>
</xsl:template>

<xsl:template match="legend/definitionList" mode="chg-del">
  <xsl:call-template name="delete-as-row">
    <xsl:with-param name="span" select="number(4)"/>
  </xsl:call-template>
</xsl:template>

<!-- ************************************************************** -->

<xsl:template match="randomList|attentionRandomList">
  <div>
    <xsl:call-template name="setID"/>
      <xsl:call-template name="change">
      <xsl:with-param name="class" select="'s-randList'"/>
    </xsl:call-template>
    <xsl:apply-templates select="title"/>
    <ul class="s-randList-{if (@listItemPrefix) then @listItemPrefix else 'pf02'}">
      <xsl:apply-templates select="*[not(self::title)]"/>
    </ul>
  </div>
</xsl:template>
    
<xsl:template match="randomList|attentionRandomList" mode="chg-del">
  <xsl:call-template name="delete-as-div">
    <xsl:with-param name="class" select="'s-randList'"/>
  </xsl:call-template>
</xsl:template>

<xsl:template match="listItem|attentionRandomListItem|attentionSequentialListItem">
  <xsl:apply-templates select="warning"/>
  <xsl:apply-templates select="caution"/>
  <xsl:apply-templates select="note"/>
  <li>
    <xsl:call-template name="setID"/>
    <xsl:call-template name="change"/>
    <xsl:apply-templates select="*[not(self::warning or self::caution or self::note)]"/>
  </li>
</xsl:template>

<xsl:template match="listItem|attentionRandomListItem|attentionSequentialListItem" mode="chg-del">
  <xsl:call-template name="delete-as-li"/>
</xsl:template>

<xsl:template match="sequentialList|attentionSequentialList">
  <div>
    <xsl:call-template name="setID"/>
    <xsl:call-template name="change">
      <xsl:with-param name="class" select="'s-seqList'"/>
    </xsl:call-template>
    <xsl:apply-templates select="title"/>
    <ol>
      <xsl:apply-templates select="*[not(self::title)]"/>
    </ol>
  </div>
</xsl:template>

<xsl:template match="sequentialList|attentionSequentialList" mode="chg-del">
  <xsl:call-template name="delete-as-div">
    <xsl:with-param name="class" select="'s-seqList'"/>
  </xsl:call-template>
</xsl:template>

<xsl:template match="attentionListItemPara">
  <div>
    <xsl:call-template name="setID"/>
      <xsl:call-template name="change">
      <xsl:with-param name="class" select="'s-para'"/>
    </xsl:call-template>
    <xsl:apply-templates/>
  </div>
</xsl:template>

<xsl:template match="attentionListItemPara" mode="chg-del">
  <xsl:call-template name="delete-as-div">
    <xsl:with-param name="class" select="'s-para'"/>
  </xsl:call-template>
</xsl:template>

<xsl:template match="randomList/title|attentionRandomList/title|sequentialList/title|attentionSequentialList/title">
  <div class="s-list-title">
    <xsl:apply-templates/>
  </div>
</xsl:template>

</xsl:stylesheet>

<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:fn="http://www.pwc.ca"
    xmlns:xs="http://www.w3.org/2001/XMLSchema"
    xmlns="http://www.w3.org/1999/xhtml"
    exclude-result-prefixes="xs fn #default"
    version="2.0">

<!-- Mecanism for change delete:

     - Standard template definition
       (A) match="*[@changeType='delete']"  priority="10"
           -> it applies templates in mode 'chg-del'

   > Option 1: To be used when main HTML content is basic (a simple div, span or td, ...)
     - Templates definition
       (B) match="tag"                : output main HTML content
       (C) match="tag" mode="chg-del" : output 'Deleted' in various HTML structure 
     - Process
       With the priority (=10), (A) is matched first.
       It applies templates in mode 'chg-del', so process goes to (C).
       Process does not go to (B).

     - In main output, process goes to (B) only.

   > Option 2: To be used when main HTML content is complex (output as a table, as a list, with numbering, ...) 
     - Templates definition
       (D) match="tag" priority="20"  : output main HTML content
           -> use xsl:next-match
       (E) match="tag" mode="chg-del" : output 'Deleted' in simple HTML structure
       (F) match="tag"
     - Process
       With the priority (=20), (D) is matched first.
       Complex output is created even for delete (i.e. numbering has to be kept and well positioned).
       When difference is needed between main output and delete output, use <xsl:next:match/>.
       It goes to the next available match.
       So process goes to (A), then (E). 

     - In main output, process goes to (D) then (F).
-->

<xsl:template match="*[@changeType='delete']" priority="10">
    <xsl:apply-templates select="." mode="chg-del"/>
</xsl:template>
    
<!--
<xsl:template name="change">
  <xsl:param name="class" select="''"/>
  <xsl:param name="node" select="."/>
  <xsl:choose>
    <xsl:when test="$node/@changeMark = '1'">
      <xsl:attribute name="class" select="concat($class, ' s-change-mark')"/>
    </xsl:when>
    <xsl:when test="$class!=''">
      <xsl:attribute name="class" select="$class"/>
    </xsl:when>
  </xsl:choose>
</xsl:template>

<xsl:template name="change-inline">
  <xsl:param name="class" select="''"/>
  <xsl:choose>
    <xsl:when test="@changeMark = '1'">
      <xsl:attribute name="class" select="concat($class, ' s-change-mark-inline')"/>
    </xsl:when>
    <xsl:when test="$class!=''">
      <xsl:attribute name="class" select="$class"/>
    </xsl:when>
  </xsl:choose>
</xsl:template>
-->
  
<xsl:variable name="g-css-chg" select="'s-change'"/>

<xsl:template name="change">
  <xsl:param name="class" select="''"/>
  <xsl:param name="node" select="."/>
  <xsl:choose>
    <xsl:when test="$node/@changeMark = '1'">
      <xsl:attribute name="class" select="concat($class,' ',$g-css-chg)"/>
    </xsl:when>
    <xsl:when test="$class!=''">
      <xsl:attribute name="class" select="$class"/>
    </xsl:when>
  </xsl:choose>
</xsl:template>

<xsl:template match="*" mode="chg-del">
  <div style="color: red; font-weight: bold;">
    <xsl:text>No change delete template defined for &#60;</xsl:text>
    <xsl:value-of select="name()"/>
    <xsl:text>&#62;.</xsl:text>
  </div>
</xsl:template>

<xsl:template name="delete">
  <xsl:value-of select="fn:getGenText('delete')"/>
</xsl:template>

<xsl:template name="delete-as-div">
  <xsl:param name="class" select="''"/>

  <div class="{if ($class!='') then concat($class,' ',$g-css-chg) else $g-css-chg}">
    <xsl:call-template name="setID"/>
    <xsl:value-of select="fn:getGenText('delete')"/>
  </div>
</xsl:template>

<xsl:template name="delete-as-li">
  <xsl:param name="class" select="''"/>
  
  <li class="{if ($class!='') then concat($class,' ',$g-css-chg) else $g-css-chg}">
    <xsl:call-template name="setID"/>
    <xsl:value-of select="fn:getGenText('delete')"/>
  </li>
</xsl:template>

<xsl:template name="delete-as-div-no-id">
  <xsl:param name="class" select="''"/>

  <div class="{if ($class!='') then concat($class,' ',$g-css-chg) else $g-css-chg}">
    <xsl:value-of select="fn:getGenText('delete')"/>
  </div>
</xsl:template>
    
<xsl:template name="delete-as-span">
  <xsl:param name="class" select="''"/>
  
  <span class="{if ($class!='') then concat($class,' ',$g-css-chg) else $g-css-chg}">
    <xsl:call-template name="setID"/>
    <xsl:value-of select="fn:getGenText('delete')"/>
  </span>
</xsl:template>

<xsl:template name="delete-as-row">
  <xsl:param name="span"/>
  
  <tr>
    <td colspan="{$span}" class="ietm_change">
      <xsl:call-template name="setID"/>
      <xsl:value-of select="fn:getGenText('delete')"/>
    </td>
  </tr>
</xsl:template>

<xsl:template name="delete-as-cell">
  <xsl:param name="span"/>
  
  <td colspan="{$span}" class="ietm_change">
    <xsl:call-template name="setID"/>
    <xsl:value-of select="fn:getGenText('delete')"/>
  </td>
</xsl:template>

</xsl:stylesheet>

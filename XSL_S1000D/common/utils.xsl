<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:fn="http://www.pwc.ca"
    xmlns:xs="http://www.w3.org/2001/XMLSchema"
    xmlns="http://www.w3.org/1999/xhtml"
    exclude-result-prefixes="xs fn #default"
    version="2.0">
    
<!-- ************************************************************** -->
<!-- VARIABLES -->

<xsl:variable name="gen-texts"  select="document('generated_texts.xml')"/>    
<xsl:variable name="gentexts" select="doc('../generated_text/generated_texts.xml')" />
    
<!-- ************************************************************** -->
<!-- UTILS FUNCTION -->

<xsl:function name="fn:getDMC">
  <xsl:param name="node" as="node()"/>
  
  <xsl:choose>
    <xsl:when test="$node[self::dmCode]">
      <xsl:variable name="mi"     select="$node/@modelIdentCode"/>
      <xsl:variable name="sdc"    select="$node/@systemDiffCode"/>
      <xsl:variable name="sc"     select="$node/@systemCode"/>
      <xsl:variable name="ssc"    select="$node/@subSystemCode"/>
      <xsl:variable name="sssc"   select="$node/@subSubSystemCode"/>
      <xsl:variable name="ac"     select="$node/@assyCode"/>
      <xsl:variable name="dc"     select="$node/@disassyCode"/>
      <xsl:variable name="dcv"    select="$node/@disassyCodeVariant"/>
      <xsl:variable name="ic"     select="$node/@infoCode"/>
      <xsl:variable name="icv"    select="$node/@infoCodeVariant"/>
      <xsl:variable name="ilc"    select="$node/@itemLocationCode"/>
      <xsl:value-of select="concat('DMC-', $mi, '-', $sdc, '-', $sc, '-', $ssc, $sssc, '-', $ac, '-', $dc, $dcv, '-', $ic, $icv, '-', $ilc)"/>
    </xsl:when>
    <xsl:otherwise>Invalid node.</xsl:otherwise>
  </xsl:choose>
</xsl:function>

<xsl:function name="fn:getDMCBasic">
  <xsl:param name="dmc"/>
  <xsl:value-of select="replace(substring-after($dmc, 'DMC-'), '-', '&#x2011;')"/>
</xsl:function>

<xsl:function name="fn:getPMC">
  <xsl:param name="node" as="node()"/>
  
  <xsl:choose>
    <xsl:when test="$node[self::pmCode]">
      <xsl:variable name="mi" select="$node/@modelIdentCode"/>
      <xsl:variable name="pi" select="$node/@pmIssuer"/>
      <xsl:variable name="pn" select="$node/@pmNumber"/>
      <xsl:variable name="pv" select="$node/@pmVolume"/>
      <xsl:value-of select="concat('PMC-', $mi, '-', $pi, '-', $pn, '-', $pv)"/>
    </xsl:when>
    <xsl:otherwise>Invalid node.</xsl:otherwise>
  </xsl:choose>
</xsl:function>

<xsl:function name="fn:getPMCBasic">
  <xsl:param name="pmc"/>
  <xsl:value-of select="replace(substring-after($pmc, 'PMC-'), '-', '&#x2011;')"/>
</xsl:function>

<xsl:function name="fn:getGenText">
  <xsl:param name="key"/>
  
  <!--xsl:value-of select="$gen-texts//texts[@language=$g_lang]/text[@name=$key]"/-->
  <xsl:value-of select="if ($gen-texts//texts[@language=$g_lang]/text[@name=$key]) then $gen-texts//texts[@language=$g_lang]/text[@name=$key] else ''" />
</xsl:function>

<xsl:function name="fn:capitalize">
  <xsl:param name="str" as="xs:string"/>
  <xsl:sequence select="concat(upper-case(substring($str,1,1)), substring($str, 2), ' '[not(last())])"/>
</xsl:function>

<xsl:function name="fn:getDMCFM">
  <xsl:param name="mi"/>
  <xsl:param name="key"/>

  <xsl:variable name="incode">
    <xsl:choose>
      <xsl:when test="$key = 'title-page'">001</xsl:when>
      <xsl:when test="$key = 'loedm'">00S</xsl:when>
      <xsl:when test="$key = 'highlights'">00U</xsl:when>
      <xsl:when test="$key = 'warnings'">012</xsl:when>
      <xsl:when test="$key = 'loab'">005</xsl:when>
    </xsl:choose>
  </xsl:variable>
  <xsl:value-of select="concat('DMC-', $mi, '-A-00-00-00-00A-', $incode, 'A-A')"/>
</xsl:function>

<xsl:function name="fn:getDMCEntry">
  <xsl:param name="mi"/>
  <xsl:param name="chapter"/>
  <xsl:param name="key"/>

  <xsl:variable name="incode">
    <xsl:choose>
      <xsl:when test="$key = 'title-page'">001</xsl:when>
      <xsl:when test="$key = 'loedm'">00S</xsl:when>
      <xsl:when test="$key = 'highlights'">00U</xsl:when>
      <xsl:when test="$key = 'warnings'">012</xsl:when>
      <xsl:when test="$key = 'loab'">005</xsl:when>
    </xsl:choose>
  </xsl:variable>
  <xsl:value-of select="concat('DMC-', $mi, '-A-', $chapter, '-00-00-00A-', $incode, 'A-A')"/>
</xsl:function>

<xsl:function name="fn:getCompleteDMCEntry">
  <xsl:param name="mi"/>
  <xsl:param name="chapter"/>
  <xsl:param name="subsystem"/>
  <xsl:param name="subsubsystem"/>
  <xsl:param name="assy"/>
  <xsl:param name="disassy"/>
  <xsl:param name="key"/>

  <xsl:variable name="incode">
    <xsl:choose>
      <xsl:when test="$key = 'title-page'">001</xsl:when>
      <xsl:when test="$key = 'loedm'">00S</xsl:when>
      <xsl:when test="$key = 'highlights'">00U</xsl:when>
      <xsl:when test="$key = 'warnings'">012</xsl:when>
      <xsl:when test="$key = 'loab'">005</xsl:when>
    </xsl:choose>
  </xsl:variable>
  <xsl:value-of select="concat('DMC-', $mi, '-A-', $chapter, '-', $subsystem, $subsubsystem, '-', $assy, '-', $disassy ,'A-', $incode, 'A-A')"/>
</xsl:function>

<!-- 
 returns a well formated date 
  p-date   : date using YYYYMMDD input format
  p-format : output format
              long     : DD Month YYYY
              short-en : Mon DD/YY
              long-en  : Month DD, YYYY
-->
<xsl:function name="fn:formatDate">
  <xsl:param name="p-date"/>
  <xsl:param name="p-format"/>
  
  <xsl:variable name="l-year-long"  select="substring($p-date,1,4)"/>
  <xsl:variable name="l-year-short" select="substring($p-date,3,2)"/>
  <xsl:variable name="l-month"      select="substring($p-date,5,2)"/>
  <xsl:variable name="l-day"        select="substring($p-date,7,2)"/>
  
  <xsl:variable name="l-month-short" select="fn:getGenText(concat('month-s-',$l-month))"/>
  <xsl:variable name="l-month-long"  select="fn:getGenText(concat('month-',$l-month))"/>
  
  <xsl:choose>
    <xsl:when test="$p-format='long'">
      <xsl:value-of select="concat($l-day,' ',$l-month-long,' ',$l-year-long)"/>
    </xsl:when>
    <xsl:when test="$p-format='short-en'">
      <xsl:value-of select="concat($l-month-short,' ',$l-day,'/',$l-year-short)"/>
    </xsl:when>
    <xsl:when test="$p-format='long-en'"> 
      <xsl:value-of select="concat($l-month-long,' ',$l-day,', ',$l-year-long)"/>
    </xsl:when>    
  </xsl:choose>
</xsl:function>

<xsl:template name="setID">
  <xsl:if test="@id"><xsl:attribute name="id"><xsl:value-of select="@id"/></xsl:attribute></xsl:if>
</xsl:template>

<xsl:template name="setGenID">
  <xsl:attribute name="id"><xsl:value-of select="if (@id) then @id else generate-id(.)"/></xsl:attribute>
</xsl:template>

</xsl:stylesheet>

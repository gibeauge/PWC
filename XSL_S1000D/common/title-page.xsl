<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:fn="http://www.pwc.ca"
    xmlns:xs="http://www.w3.org/2001/XMLSchema"
    xmlns="http://www.w3.org/1999/xhtml"
    exclude-result-prefixes="xs fn #default"
    version="2.0">
    
<xsl:template name="build-dm-tp_old">
  <xsl:for-each select="content/description">
    <!-- manual type -->
    <xsl:variable name="man-type" select="tokenize(/pm/@id, '-')[1]"/>
    <div class="s-tp-manual-type">
      <xsl:value-of select="fn:getGenText(concat('tp-manual-', $man-type))"/>
    </div>

    <!-- engine type -->
    <div class="s-tp-engine-type">
      <xsl:apply-templates select="levelledPara[title=fn:getGenText('tp-engine-type')]/para/node()"/>
    </div>

    <!-- models -->
    <div class="s-tp-models">
      <xsl:value-of select="fn:getGenText('tp-models')"/><br/>
      <xsl:value-of select="/pm/identAndStatusSection/pmStatus/applic/displayText"/>
    </div>

    <!-- manual part no -->
    <div class="s-tp-manual-pno">
      <xsl:value-of select="fn:getGenText('tp-manual-pno')"/>
      <xsl:text> </xsl:text>
      <xsl:apply-templates select="levelledPara[title=fn:getGenText('tp-manual-pno')]/para/node()"/>
    </div>

    <!-- issue date -->
    <div class="s-tp-issue">
      <xsl:value-of select="fn:getGenText('tp-issued')"/>
      <xsl:text> </xsl:text>
      <xsl:apply-templates select="levelledPara[title=fn:getGenText('tp-issue')]/para/node()"/>
    </div>
    
    <!-- export control -->
    <div class="s-tp-export-ctl">
      <xsl:apply-templates select="levelledPara/title[.=fn:getGenText('tp-export-ctl')]/following-sibling::node()"/>
    </div>
    
    <!-- approval -->
    <div class="s-tp-approval">
      <xsl:apply-templates select="levelledPara/title[.=fn:getGenText('tp-approval')]/following-sibling::node()"/>
    </div>
    
    <!-- warnings, ... -->
    <div class="s-tp-warnings">
      <xsl:apply-templates select="levelledPara/title[starts-with(.,fn:getGenText('tp-warnings'))]/node()"/>
    </div>
    <xsl:apply-templates select="levelledPara/title[starts-with(.,fn:getGenText('tp-warnings'))]/following-sibling::node()"/>
    
  </xsl:for-each>
</xsl:template>

<xsl:template name="build-dm-tp">
  <xsl:for-each select="content/description">
  
    <!-- publication -->
    <div class="s-tp-div">
      <div><xsl:value-of select="fn:getGenText('tp-publication')"/></div>
      <div><xsl:value-of select="concat($g_mi, '-', $g_issuer, '-', $g_pm_num, '-', $g_pm_vol)"/></div>
      <div><xsl:value-of select="concat(fn:getGenText('tp-issue-no'), ' ', $g_issue)"/></div>
    </div>
    
    <!-- engine models -->
    <div class="s-tp-div">
      <div><xsl:value-of select="fn:getGenText('tp-models')"/></div>
      <div><xsl:value-of select="/pm/identAndStatusSection/pmStatus/applic/displayText"/></div>
    </div>
    
    <!-- issue date -->
    <div class="s-tp-div">
      <!--div><xsl:value-of select="fn:getGenText('tp-issue')"/></div>
      <div><xsl:value-of select="fn:formatDate($g_issue_date, 'long')"/></div-->
      <div><xsl:value-of select="fn:getGenText('tp-issue')"/></div>
      <div><xsl:apply-templates select="levelledPara[title=fn:getGenText('tp-issue')]/para/node()"/></div>
    </div>
    
    <!-- engine type -->
    <div class="s-tp-div">
      <div><xsl:value-of select="fn:getGenText('tp-engine-type')"/></div>
      <div><xsl:apply-templates select="levelledPara[title=fn:getGenText('tp-engine-type')]/para/node()"/></div>
    </div>
    
    <!-- manual part no -->
    <div class="s-tp-div">
      <div><xsl:value-of select="fn:getGenText('tp-manual-pno')"/></div>
      <div><xsl:apply-templates select="levelledPara[title=fn:getGenText('tp-manual-pno')]/para/node()"/></div>
    </div>
    
    <!-- warnings, ... -->
    <xsl:for-each select="levelledPara[title=fn:getGenText('tp-issue')]/following-sibling::levelledPara">
      <div class="s-tp-div">
        <div><xsl:apply-templates select="title/node()"/></div>
        <div><xsl:apply-templates select="*[not(self::title)]"/></div>
      </div>
    </xsl:for-each>
    
  </xsl:for-each>
</xsl:template>

</xsl:stylesheet>
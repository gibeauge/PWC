<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet 
  xmlns:xsl="http://www.w3.org/1999/XSL/Transform" 
  xmlns:ch="http://www.arbortext.com/namespace/chunker" 
  xmlns:random="http://exslt.org/random"
  extension-element-prefixes="random"
  xmlns:exslt="http://exslt.org/common"
  exclude-result-prefixes="ch random exslt" version="2.0">
  
  <xsl:variable name="html-ext" select="'.html'"/>
  <xsl:variable name="sharp" select="'#'"/>

  <!-- Create TOC and Bookmarks files -->
  <xsl:template match="/*" mode="toc">
    <xsl:variable name="toc-tmp">
      <Structure>
        <xsl:apply-templates mode="toc"/>
      </Structure>
    </xsl:variable>
    <!-- Use TOC to create bookmarks -->
    <xsl:variable name="bookmarks">
      <Bookmarks>
        <Pages>
          <xsl:for-each select="exslt:node-set($toc-tmp)//Page[@bookmark='yes']">
            <Page>
              <xsl:copy-of select="@*[not(name()='bookmark') and not(name()='FileType')]"/>
              <xsl:attribute name="FileType">FILE</xsl:attribute>
            </Page>
          </xsl:for-each>
        </Pages>
      </Bookmarks>
    </xsl:variable>
    <xsl:variable name="toc">
      <xsl:apply-templates select="exslt:node-set($toc-tmp)/*" mode="del-bookmark"/>
    </xsl:variable>
    
    <!-- Output TOC -->
    <xsl:result-document href="{concat($output-dir, '/XML/Structure.xml')}" method="xml" encoding="utf-8" 
                         indent="yes" exclude-result-prefixes="ch" omit-xml-declaration="no">
      <xsl:copy-of select="$toc"/>
    </xsl:result-document>
    
    <!-- Output Bookmarks -->
    <xsl:result-document href="{concat($output-dir, '/XML/Bookmark.xml')}" method="xml" encoding="utf-8" 
                         indent="yes" exclude-result-prefixes="ch" omit-xml-declaration="no">
      <xsl:copy-of select="$bookmarks"/>
    </xsl:result-document>
  </xsl:template>

  <xsl:template match="@*|node()" mode="del-bookmark">
    <xsl:copy>
      <xsl:apply-templates select="@*|node()" mode="del-bookmark"/>
    </xsl:copy>
  </xsl:template>
  
  <xsl:template match="@bookmark" mode="del-bookmark"/>

  <xsl:template match="*" mode="toc">
    <xsl:if test="descendant::*[@ch:chunk = 'yes'] or ancestor::*[@ch:title = 'toc']">
      <xsl:apply-templates mode="toc"/>
    </xsl:if>
  </xsl:template>

  <xsl:template match="*[@ch:chunk = 'yes']" mode="toc">
    <xsl:variable name="id" select="generate-id(.)"/>
    <xsl:variable name="toc" select="descendant::*[@ch:title][1]"/>
    <xsl:variable name="isFolder" select="descendant::*[@ch:chunk = 'yes' and descendant::*[@ch:title = 'toc']]"/>
    <xsl:variable name="hasTitle" select="count(.//*[@ch:title = 'toc' and generate-id(ancestor::*[@ch:chunk = 'yes'][1]) = $id][1]) > 0"/>
    <xsl:variable name="hasFiles" select="count(.//*[@ch:title = 'toc' and generate-id(ancestor::*[@ch:chunk = 'yes'][1]) = $id]) > 1"/>
    
    <xsl:variable name="isFigure">
      <xsl:choose>
        <xsl:when test="not($hasFiles) and $hasTitle and starts-with(.//*[@ch:title = 'toc' and generate-id(ancestor::*[@ch:chunk = 'yes'][1]) = $id][1], 'Figure')">1</xsl:when>
        <xsl:otherwise>0</xsl:otherwise>
      </xsl:choose>
    </xsl:variable>
    
    <xsl:choose>
      <xsl:when test="contains(@class, 'frontmatter')">
        <Page>
          <xsl:attribute name="ID">
            <xsl:call-template name="generate-toc-id"/>
          </xsl:attribute>
          <xsl:attribute name="Title">
            <xsl:text>FRONTMATTER</xsl:text>
          </xsl:attribute>
          
          <xsl:apply-templates select="descendant::*[@ch:chunk = 'yes' and generate-id(ancestor::*[@ch:chunk = 'yes'][1]) = $id]" mode="toc"/>
          <xsl:apply-templates select="following-sibling::*[position() = 1 and contains(@class, 'num-index')]/*[@ch:title = 'toc']" mode="toc"/>
        </Page>
      </xsl:when>
      <xsl:when test="(not($hasTitle) or parent::*[local-name(.)='body'])">
        <xsl:apply-templates select="descendant::*[@ch:chunk = 'yes' and generate-id(ancestor::*[@ch:chunk = 'yes'][1]) = $id]" mode="toc"/>
      </xsl:when>
      <xsl:otherwise>
        <Page>
          <xsl:if test="@ch:bookmark">
            <xsl:attribute name="bookmark">yes</xsl:attribute>
          </xsl:if>
          <xsl:attribute name="ID">
            <xsl:call-template name="generate-toc-id"/>
          </xsl:attribute>
          <xsl:attribute name="Title">
            <xsl:apply-templates select="$toc" mode="toc-title"/>
          </xsl:attribute>
          
          <xsl:if test="not($isFolder) or $hasFiles">
            <xsl:attribute name="URL">
              <xsl:value-of select="concat(@ch:filename, $html-ext, $sharp, $toc/@id)"/>
            </xsl:attribute>
          </xsl:if>
          
          <xsl:attribute name="FileType">
            <xsl:choose>
              <xsl:when test="$isFolder">FOLDER</xsl:when>
              <xsl:when test="$isFigure = '1'">IMAGE</xsl:when>
              <xsl:otherwise>FILE</xsl:otherwise>
            </xsl:choose>
          </xsl:attribute>
          
          <xsl:if test="not($isFolder)">
            <xsl:attribute name="MIMEType">text/html</xsl:attribute>
          </xsl:if>
          
          <xsl:if test="$toc/@ch:title = 'notoc'">
            <xsl:attribute name="Display">false</xsl:attribute>
          </xsl:if>
          
          <xsl:choose>
            <xsl:when test="starts-with($toc, 'List of Figures')">
              <xsl:apply-templates select="descendant::*[@ch:chunk = 'yes' and generate-id(ancestor::*[@ch:chunk = 'yes'][1]) = $id]|descendant::*[@ch:title and generate-id(ancestor::*[@ch:chunk = 'yes'][1]) = $id][position() > 1]" mode="toc">
                <xsl:with-param name="lof">1</xsl:with-param>
              </xsl:apply-templates>
            </xsl:when>
            <xsl:otherwise>
              <xsl:apply-templates select="descendant::*[@ch:chunk = 'yes' and generate-id(ancestor::*[@ch:chunk = 'yes'][1]) = $id]|descendant::*[@ch:title and generate-id(ancestor::*[@ch:chunk = 'yes'][1]) = $id][position() > 1 and not(starts-with(normalize-space(.), 'Figure')) ]" mode="toc"/>
            </xsl:otherwise>
          </xsl:choose>
          
        </Page>
      </xsl:otherwise>
    </xsl:choose>
  </xsl:template>
  
  <xsl:template match="*[@ch:title = 'toc']" mode="toc">
    <xsl:param name="lof" select="0"/>
    <xsl:variable name="chunk" select="ancestor::*[@ch:chunk = 'yes'][1]"/>
    <xsl:variable name="chunk-id" select="generate-id($chunk)"/>
    
    <xsl:variable name="hasFigure">
      <xsl:choose>
        <xsl:when test="string($lof) = '1'">0</xsl:when>
        <xsl:when test="following::*[@ch:title = 'toc'][position()=1 and generate-id(ancestor::*[@ch:chunk = 'yes'][1]) = $chunk-id and starts-with(normalize-space(.), 'Figure')]">1</xsl:when>
        <xsl:otherwise>0</xsl:otherwise>
      </xsl:choose>
    </xsl:variable>
    
    <!--<xsl:variable name="isFigure">
      <xsl:choose>
        <xsl:when test="starts-with(normalize-space(.), 'Figure')">1</xsl:when>
        <xsl:otherwise>0</xsl:otherwise>
      </xsl:choose>
    </xsl:variable>-->
    
    <Page>
      <xsl:attribute name="ID">
        <xsl:call-template name="generate-toc-id"/>
      </xsl:attribute>
      <xsl:attribute name="Title">
        <xsl:call-template name="normalize-space">
          <xsl:with-param name="str">
            <xsl:value-of select="replace(.,'(\(SHEET )([0-9A-Z ]+)(\))','')"/>
          </xsl:with-param>
        </xsl:call-template>
      </xsl:attribute>
      
      <xsl:attribute name="URL">
        <xsl:value-of select="concat($chunk/@ch:filename, $html-ext, $sharp, @id)"/>
      </xsl:attribute>
      
      <xsl:attribute name="FileType">
        <xsl:choose>
          <xsl:when test="$hasFigure = '1'">FOLDER</xsl:when>
          <!--<xsl:when test="$isFigure = '1'">IMAGE</xsl:when>-->
          <xsl:otherwise>FILE</xsl:otherwise>
        </xsl:choose>
      </xsl:attribute>
      
      <xsl:attribute name="MIMEType">text/html</xsl:attribute>
      
      <xsl:if test="string($lof) = '0' and $hasFigure = '1'">
        <xsl:apply-templates select="following::*[@ch:title = 'toc'][position()=1 and generate-id(ancestor::*[@ch:chunk = 'yes'][1]) = $chunk-id and starts-with(normalize-space(.), 'Figure')]" mode="tic"/>
      </xsl:if>
      
    </Page>
  </xsl:template>
  
  <!-- @ch:title of figures not in list of figures -->
  <xsl:template match="*[@ch:title = 'toc']" mode="tic">
    <xsl:variable name="chunk" select="ancestor::*[@ch:chunk = 'yes'][1]"/>
    <xsl:variable name="chunk-id" select="generate-id($chunk)"/>
    
    <Page>
      <xsl:attribute name="ID">
        <xsl:call-template name="generate-toc-id"/>
      </xsl:attribute>
      <xsl:attribute name="Title">
        <xsl:call-template name="normalize-space">
          <xsl:with-param name="str">
            <xsl:value-of select="."/>
          </xsl:with-param>
        </xsl:call-template>
      </xsl:attribute>
      
      <xsl:attribute name="URL">
        <xsl:value-of select="concat($chunk/@ch:filename, $html-ext, $sharp, @id)"/>
      </xsl:attribute>
      
      <xsl:attribute name="FileType">FILE</xsl:attribute>
      <!--<xsl:attribute name="FileType">IMAGE</xsl:attribute>-->
      
      <xsl:attribute name="MIMEType">text/html</xsl:attribute>
    </Page>
    
    <xsl:apply-templates select="following::*[@ch:title = 'toc'][position()=1 and generate-id(ancestor::*[@ch:chunk = 'yes'][1]) = $chunk-id and starts-with(normalize-space(.), 'Figure')]" mode="tic"/>
    
  </xsl:template>
  
  <xsl:template match="*[@ch:title]" mode="toc-title">
    <xsl:call-template name="normalize-space">
      <xsl:with-param name="str">
        <xsl:value-of select="."/>
      </xsl:with-param>
    </xsl:call-template>
  </xsl:template>
  
  <xsl:template name="generate-toc-id">
    <xsl:variable name="ps" select="count(preceding::*)"/>
    <xsl:value-of select="concat('ID', substring(translate(string(random:random-sequence(1, count(preceding::*)) * 100000000), '.', ''), 1, 10 - string-length(string($ps))), $ps)"/>
  </xsl:template>
  
  <xsl:template name="normalize-space">
    <xsl:param name="str" select="''"/>
    <xsl:value-of select="normalize-space(translate($str, '&#xa0;&#xA0;&#x2003;&#x2002;', '    '))"/>
  </xsl:template>
  
</xsl:stylesheet>

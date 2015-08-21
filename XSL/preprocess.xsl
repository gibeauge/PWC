<?xml version="1.0" encoding="UTF-8"?>
<!--================================================================================
 *
 *  File:   preprocess.xsl
 *  Purpose:  XSLT for pre-processing PWC documents 
 *  Author:   Parametric Technology Corporation
 *
 ==================================================================================-->
 
<xsl:stylesheet version="2.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance">
  <xsl:output encoding="UTF-8" method="xml" />
  <xsl:preserve-space elements="*"/>
  <!--These parameters values need to be set at the time of the transformation-->
  
  <!-- add by GBE -->
  <xsl:param name="manifest-file"/>
  <!-- end add by GBE -->
  
  <xsl:param name="base-url" select="''"/>
  <xsl:param name="ACM-container-root" select="'/Extracts'"/>
  <!-- mod by GBE -->
  <!--xsl:param name="manifest-node" select="''"/-->
  <xsl:param name="manifest-node" select="document($manifest-file)/*"/>
  <!-- end mod by GBE -->
  
  
  <xsl:param name="manifest-items" select="$manifest-node//manifest-item|$manifest-node//graphic"/>
  <!-- Manifest-items that already have Logical IDs -->
  <xsl:param name="server-objects" select="$manifest-node//manifest-item[starts-with(@ACM-logical-id, 'x-wc')]|$manifest-node//graphic[starts-with(@ACM-logical-id, 'x-wc')]"/>
  
  <xsl:param name="use-schema">
    <xsl:choose>
      <xsl:when test="starts-with(*/@doctype, 'oh')">migrate.xsd</xsl:when>
      <xsl:when test="starts-with(*/@doctype, 'ipc')">ipc.xsd</xsl:when>
      <xsl:when test="starts-with(*/@doctype, 'epc')">emipc.xsd</xsl:when>
      <xsl:when test="starts-with(*/@doctype, 'mm')">migrate.xsd</xsl:when>
      <xsl:when test="starts-with(*/@doctype, 'cir')">jmtosmigrate.xsd</xsl:when>
      <xsl:when test="starts-with(*/@doctype, 'em')">jmtosmigrate.xsd</xsl:when>
      <xsl:when test="starts-with(*/@doctype, 'lmm')">jmtosmigrate.xsd</xsl:when>
      <xsl:when test="starts-with(*/@doctype, 'tmm')">jmtosmigrate.xsd</xsl:when>
      <xsl:otherwise>migrate.xsd</xsl:otherwise>
    </xsl:choose>
  </xsl:param>
  
  <xsl:param name="book-pnbr">
    <xsl:choose>
      <xsl:when test="/*[name() = 'book']">
        <xsl:value-of select="/*/@manualpnr"></xsl:value-of>
      </xsl:when>
      <xsl:otherwise>
        <xsl:value-of select="$manifest-items[1][@type = 'book']/@object-key"/>
      </xsl:otherwise>
    </xsl:choose>
  </xsl:param>
  <xsl:param name="book-model" select="/*/@model" />
  <xsl:param name="book-family" select="/*/@family" />
  <xsl:param name="document-type">
    <xsl:call-template name="book-type">
      <xsl:with-param name="abbrev" select="/*/@doctype" />
    </xsl:call-template>
  </xsl:param>

  <xsl:param name="book-root">
    <xsl:choose>
      <xsl:when test="/*[name() = 'book']">
        <xsl:value-of select="concat($ACM-container-root,'/',$book-family,'/', $book-model,'/',$document-type, '/', $book-pnbr)" />
      </xsl:when>
      <xsl:otherwise>
        <xsl:value-of select="$manifest-items[1][@type = 'book']/@ACM-path"/>
      </xsl:otherwise>
    </xsl:choose>
    
  </xsl:param>
  
  <xsl:param name="offline">
    <xsl:choose>
      <xsl:when test="$manifest-node/@offline = 'yes'">true</xsl:when>
      <xsl:otherwise>false</xsl:otherwise>
    </xsl:choose>
  </xsl:param>
  
  <!-- add by GBE -->
  <xsl:variable name="lang" select="if (/*/@lang) then /*/@lang else 'EN'"/>
  <xsl:variable name="gen-texts" select="document('generated_texts2.xml')//texts[@language=$lang]"/>
  <!-- end add by GBE -->
  
  <!-- root template -->
  <xsl:template match="/">
    <xsl:apply-templates select="*"/>
  </xsl:template>
  
  <!-- match: book -->
  <xsl:template match="*[name() = 'book']">
    <xsl:variable name="objKey">
      <xsl:call-template name="format-key"/>
    </xsl:variable>
      
    <xsl:element name="book">
      
      <xsl:copy-of select="@*"/>
      <xsl:attribute name="xsi:noNamespaceSchemaLocation">
        <xsl:value-of select="$use-schema"/>
      </xsl:attribute>
      <xsl:attribute name="ACM-path">
        <xsl:call-template name="format-path"/>
      </xsl:attribute>
      <xsl:attribute name="object-key">
        <xsl:value-of select="$objKey"/>
      </xsl:attribute>
      <xsl:attribute name="offline">
        <xsl:value-of select="$offline"/>
      </xsl:attribute>
      <xsl:attribute name="id">
        <xsl:value-of select="concat('pwc', $objKey)"/>
      </xsl:attribute>
      <xsl:apply-templates/>
      
    </xsl:element>
    
  </xsl:template>
  
  <!-- match: frontmatter | page-block | chapter | section | subject | ata-page-block -->
  <xsl:template match="*[name() = 'frontmatter' 
              or name() = 'page-block' 
              or name() = 'chapter' 
              or name() = 'section'
              or name() = 'subject'
              or name() = 'ata-page-block']">
    
    <xsl:variable name="objKey" select="@object-key"/>
    <!--<xsl:choose>
      
      <xsl:when test="child::*[name() = 'revst']">
        <xsl:apply-templates select="." mode="revst"/>
      </xsl:when>
      
      <xsl:otherwise>-->
        
        <xsl:element name="{local-name()}">
        
          <xsl:copy-of select="@*"/>
          <xsl:attribute name="ACM-path">
            <xsl:call-template name="format-path"/>
          </xsl:attribute>
          <xsl:attribute name="id">
            <xsl:value-of select="concat('pwc', @object-key)"/>
          </xsl:attribute>
          <xsl:attribute name="xsi:noNamespaceSchemaLocation">
            <xsl:value-of select="$use-schema"/>
          </xsl:attribute>
          <!-- Move <pageblock-title> to the top of the <ata-page-block> -->
          <xsl:if test="name() = 'ata-page-block' or name() = 'page-block'">
            <!-- mod gy GBE -->
            <!--xsl:apply-templates select="descendant::*[name() = 'pageblock-title'][1]" mode="pb-title"/-->
            <xsl:choose>
              <xsl:when test=".//pageblock-title">
                <xsl:apply-templates select="descendant::*[name() = 'pageblock-title'][1]" mode="pb-title"/>
              </xsl:when>
              <xsl:when test=".//pgblk/title">
                <xsl:apply-templates select="descendant::*[name() = 'pgblk'][1]/title" mode="pb-title"/>
              </xsl:when>
            </xsl:choose>
            <!-- end mod by GBE -->
          </xsl:if>
          
          <xsl:apply-templates/>
          
          <!-- Add LOT and LOF to <ata-page-block>s -->
          <xsl:if test="name() = 'ata-page-block' or name() = 'page-block'">
            <xsl:choose>
              <xsl:when test="$document-type='epc' and descendant::*[name() = 'graphic'][title]">
                <xsl:element name="lof">
                  <xsl:element name="title"><xsl:value-of select="$gen-texts//text[@name='lof']"/></xsl:element>
                  <xsl:apply-templates select="descendant::*[name() = 'graphic'][title]" mode="lof"/>
                </xsl:element>
              </xsl:when>
              <xsl:when test="$document-type!='cir' and descendant::*[name() = 'graphic'][title]">
                <xsl:element name="lof">
                  <xsl:element name="title"><xsl:value-of select="$gen-texts//text[@name='lof']"/></xsl:element>
                  <xsl:apply-templates select="descendant::*[name() = 'graphic']" mode="lof"/>
                </xsl:element>
              </xsl:when>
              <xsl:when test="$document-type!='epc' and descendant::*[name() = 'figure'][title]">
                <xsl:element name="lof">
                  <xsl:element name="title"><xsl:value-of select="$gen-texts//text[@name='lof']"/></xsl:element>
                  <xsl:apply-templates select="descendant::*[name() = 'figure']" mode="lof"/>
                </xsl:element>
              </xsl:when>
              
            </xsl:choose>
            
            
            <xsl:if test="$document-type!='cir' and descendant::*[name() = 'table'][title]">
              <xsl:element name="lot">
                <xsl:element name="title"><xsl:value-of select="$gen-texts//text[@name='lot']"/></xsl:element>
                <xsl:apply-templates select="descendant::*[name() = 'table']" mode="lot"/>
              </xsl:element>
            </xsl:if>
          </xsl:if>
          
        </xsl:element>
        
        <!-- ethomas 11/08/12: Insert highlights AFTER the title page-block-->
          <xsl:if test="name() = 'page-block'">
            <xsl:if test="@pb-name='title-page' or @pb-name='title_page'">
              <xsl:call-template name="highlights"/>
            </xsl:if>
          </xsl:if>
          
        <!-- ethomas 11/08/12: Removing highlights from this location to prevent it from appearing at the end of frontmatter -->
        <!-- <xsl:if test="(page-block[@pb-name='title-page'] or page-block[@pb-name='title_page']) and parent::*">
          <xsl:call-template name="highlights"/>
        </xsl:if> -->
  
      <!--  </xsl:otherwise>
    </xsl:choose>-->
    
  </xsl:template>
  
  <xsl:template match="*[name() = 'pageblock-title']" mode="pb-title">
    <xsl:element name="{local-name()}">
      <xsl:copy-of select="@*"/>
      <xsl:if test="not(@id)">
        <xsl:attribute name="id">
          <xsl:value-of select="concat('pwc', ancestor::*[name() = 'page-block' or name() = 'ata-page-block'][1]/@object-key, '.title')"></xsl:value-of>
        </xsl:attribute>
      </xsl:if>
      <xsl:apply-templates/>
    </xsl:element>
  </xsl:template>
  
  <!-- add by GBE -->
  <xsl:template match="*[name() = 'pgblk']/title" mode="pb-title">
    <pageblock-title>
      <xsl:copy-of select="@*"/>
      <xsl:if test="not(@id)">
        <xsl:attribute name="id">
          <xsl:value-of select="concat('pwc', ancestor::*[name() = 'page-block' or name() = 'ata-page-block'][1]/@object-key, '.title')"></xsl:value-of>
        </xsl:attribute>
      </xsl:if>
      <xsl:apply-templates/>
    </pageblock-title>
  </xsl:template>

  <xsl:template match="*[name() = 'pgblk']/title" priority="2">
  </xsl:template>

  <!-- end add by GBE -->
    
  <xsl:template match="*[name() = 'title']">
    <xsl:element name="{local-name()}">
      <xsl:copy-of select="@*"/>
      <xsl:choose>
        <xsl:when test="parent::*[@object-key]">
          <xsl:attribute name="id">
            <xsl:value-of select="concat('pwc', parent::*/@object-key, '.title')"/>
          </xsl:attribute>
        </xsl:when>
        <xsl:when test="parent::table">
          <xsl:attribute name="id">
            <xsl:value-of select="concat('pwc', ancestor::*[@object-key][1]/@object-key, '.table')"/>
            <xsl:number count="table" from="ata-page-block|page-block" level="any"/>
            <xsl:text>.title</xsl:text>
          </xsl:attribute>
        </xsl:when>
        <xsl:when test="parent::figure">
          <xsl:attribute name="id">
            <xsl:value-of select="concat('pwc', ancestor::*[@object-key][1]/@object-key, '.figure')"/>
            <xsl:number count="figure" from="ata-page-block|page-block" level="any"/>
            <xsl:text>.title</xsl:text>
          </xsl:attribute>
        </xsl:when>
        <xsl:when test="parent::n-para">
          <xsl:attribute name="id">
            <xsl:value-of select="concat('pwc', ancestor::*[@object-key][1]/@object-key, '.n-para')"/>
            <xsl:number count="n-para" from="ata-page-block|page-block" level="any"/>
            <xsl:text>.title</xsl:text>
          </xsl:attribute>
        </xsl:when>
      </xsl:choose>
      
      <xsl:apply-templates/>
    </xsl:element>
  </xsl:template>
  
  <xsl:template match="*[name() = 'pageblock-title']">
    <!-- Do not process -->
  </xsl:template>

  <!-- match: graphic | sheet -->
  <!-- Graphics in the Content@ Extract source start as one graphic but need to be split into three graphics (big, med, thm) -->
  <xsl:template match="*[(name() = 'sheet' and @gnbr != '')
              or (name() = 'graphic' and @negnumber != '')
              or (name() = 'pwcsoa' and @negnumber != '')
              or (name() = 'soa' and @negnumber != '')]">
    <xsl:param name="revinfo"/>   
    <xsl:variable name="graphic-number">
      <xsl:choose>
        <xsl:when test="name() = 'sheet' and @gnbr != ''">
          <xsl:value-of select="lower-case(@gnbr)" />
        </xsl:when>
        <xsl:when test="name() = 'graphic' and @negnumber != ''">
          <xsl:value-of select="lower-case(@negnumber)" />
        </xsl:when>
        <xsl:when test="name() = 'soa' and @negnumber != ''">
          <xsl:value-of select="lower-case(@negnumber)" />
        </xsl:when>
        <xsl:when test="name() = 'pwcsoa' and @negnumber != ''">
          <xsl:value-of select="lower-case(@negnumber)" />
        </xsl:when>
      </xsl:choose>
    </xsl:variable>
    <xsl:variable name="attr-name">
      <xsl:choose>
        <xsl:when test="name() = 'sheet'">gnbr</xsl:when>
        <xsl:when test="name() = 'graphic'">negnumber</xsl:when>
        <xsl:when test="name() = 'soa'">negnumber</xsl:when>
        <xsl:when test="name() = 'pwcsoa'">negnumber</xsl:when>
      </xsl:choose>
    </xsl:variable>

    <!--Three graphics need to be added: half sheet, normal and tumbnail -->
    <!-- Full size graphic -->
    <xsl:apply-templates select="." mode="graphic-sizes">
      <xsl:with-param name="size" select="'big'"/>
      <xsl:with-param name="graphic-number" select="$graphic-number"/>
      <xsl:with-param name="attr-name" select="$attr-name"/>
      <xsl:with-param name="revinfo" select="$revinfo"/>
    </xsl:apply-templates>
    
    <!-- half size graphic -->
    <xsl:apply-templates select="." mode="graphic-sizes">
      <xsl:with-param name="size" select="'med'"/>
      <xsl:with-param name="graphic-number" select="$graphic-number"/>
      <xsl:with-param name="attr-name" select="$attr-name"/>
      <xsl:with-param name="revinfo" select="$revinfo"/>
    </xsl:apply-templates>
    
    <!-- Thumbnail graphic -->
    <xsl:apply-templates select="." mode="graphic-sizes">
      <xsl:with-param name="size" select="'thm'"/>
      <xsl:with-param name="graphic-number" select="$graphic-number"/>
      <xsl:with-param name="attr-name" select="$attr-name"/>
      <xsl:with-param name="revinfo" select="$revinfo"/>
    </xsl:apply-templates>
    
  </xsl:template>
  
  <xsl:template match="*" mode="graphic-sizes">
    <xsl:param name="graphic-number"/>
    <xsl:param name="size"/>
    <xsl:param name="attr-name"/>
    <xsl:param name="revinfo" select="''"/>
    
    <xsl:variable name="object-key">
      <xsl:value-of select="concat($book-pnbr, '.', $size, '.', $graphic-number)" />
    </xsl:variable>
      
    <xsl:element name="{local-name()}">
      <xsl:copy-of select="@*"/>
      <xsl:attribute name="size"><xsl:value-of select="$size"/></xsl:attribute>
      <xsl:if test="$revinfo != ''">
        <xsl:copy-of select="$revinfo"/>
        <xsl:attribute name="role">changebar</xsl:attribute>
      </xsl:if>
      <xsl:if test="@id != ''">
        <xsl:attribute name="id">
          <xsl:choose>
          <!-- gdb 01-08-13: JIRA-810 changed test="$size='med'" to ='big' -->
            <xsl:when test="$size='big'">
              <xsl:value-of select="@id"/>
            </xsl:when>
            <xsl:otherwise>
              <xsl:value-of select="concat(@id, '_', $size)"/>
            </xsl:otherwise>
          </xsl:choose>
        </xsl:attribute>
      </xsl:if>
      <xsl:attribute name="ACM-path">
        <xsl:value-of select="concat($book-root, '/graphics')"/>
      </xsl:attribute>
      <xsl:attribute name="object-key">
        <xsl:value-of select="$object-key"/>
      </xsl:attribute>
      <xsl:attribute name="negnum">
        <xsl:value-of select="$graphic-number"/>
      </xsl:attribute>
      <xsl:attribute name="{$attr-name}">
        <xsl:choose>
          <!--#############################################################################################
           ## If the the node is already listed in the manifest and has an ACM-logical-id, convert the   ##
           ## fileref attribute to the Logical ID.                             ##
           ## Example:                                           ##
           ## gnbr="x-wc://file=d@[pewatchdog[mm_pw300_pw306a_30b1412_32[graphics[big[c67078_big.png"    ##
           ################################################################################################-->
          <xsl:when test="$server-objects[@object-key = $object-key]">
            <xsl:variable name="fileref" select="$server-objects[@object-key = $object-key]/@ACM-logical-id"/>
            <xsl:value-of select="$fileref" />
          </xsl:when>
          <xsl:otherwise> 
            <xsl:value-of select="concat('graphics/', $size, '/', $graphic-number, '_', $size, '.png')" />
          </xsl:otherwise>
        </xsl:choose>
      </xsl:attribute>
      
                        <xsl:choose>
                            <!--RL 2012-06-01: suppress children of sheet in the CIR to prevent duplicate IDs.-->
                            <!--RL 2012-07-26: suppress children of OH, MM or EIPC figures to prevent duplicate IDs.-->
                            <!-- gdb 01-08-13: JIRA-810 changed $size!='med' to !='big' -->
                            <xsl:when test="($document-type='cir'
                                    or $document-type='eipc'
                                    or $document-type='mm'
                                    or $document-type='tmm'
                                    or $document-type='oh')
                                     and $size!='big'">
                                <!--Do not process-->
                            </xsl:when>
                            <xsl:otherwise>
                                <xsl:apply-templates/>
                            </xsl:otherwise>
                        </xsl:choose>
                        
    </xsl:element>
  </xsl:template>
  
  <!-- Format the @key based on the element being added to the manifest -->
  <xsl:template name="format-key">
    <xsl:choose>
      <xsl:when test="name() = 'book'">
        <xsl:value-of select="$book-pnbr" />
      </xsl:when>
      <xsl:when test="name() = 'frontmatter'">
        <xsl:value-of select="concat($book-pnbr, '.front')" />
      </xsl:when>
      <xsl:when test="name() = 'page-block'">
        <xsl:value-of select="concat($book-pnbr, '.front.', @pb-name)" />
      </xsl:when>
      <xsl:when test="name() = 'chapter'">
        <xsl:value-of select="concat($book-pnbr, '.', @chapnbr)" />
      </xsl:when>
      <xsl:when test="name() = 'section'">
        <xsl:value-of select="concat($book-pnbr, '.', ../@chapnbr, '.', @sectnbr)" />
      </xsl:when>
      <xsl:when test="name() = 'subject'">
        <xsl:value-of
          select="concat($book-pnbr, '.', ../../@chapnbr, '.', ../@sectnbr, '.', @subjnbr)" />
      </xsl:when>
      <xsl:when test="name() = 'ata-page-block'">
        <xsl:value-of
          select="concat($book-pnbr, '.', @chapter, '.', @section, '.', @subject, '.', @pb-name)" />
      </xsl:when>
      <xsl:when test="name() = 'module' and parent::*[name() = 'page-block']"> 
        <xsl:value-of select="concat($book-pnbr, '.', ../@pb-name, '.', @module-name)"/> 
      </xsl:when>
      <xsl:when test="name() = 'module'"> 
        <xsl:value-of select="concat($book-pnbr, 
        '.', ../@chapter, '.', ../@section, '.', ../@subject, '.', ../@pb-name, '.', @module-name)"/> 
      </xsl:when> 
    </xsl:choose>
  </xsl:template>
  
  
  <xsl:template name="format-path">
    <xsl:choose>
      <xsl:when test="@ACM-path != ''">
        <xsl:value-of select="@ACM-path"/>
      </xsl:when>
      <xsl:when test="name() = 'book'">
        <xsl:value-of select="$book-root"/>
      </xsl:when>
      <xsl:when test="name() = 'frontmatter'">
        <xsl:value-of select="concat($book-root, '/front')"/>
      </xsl:when>
      <xsl:when test="name() = 'page-block'">
        <xsl:value-of select="concat($book-root, '/front/', @pb-name)"/>
      </xsl:when>
      <xsl:when test="name() = 'chapter'">
        <xsl:value-of select="concat($book-root, '/', @chapnbr)"/>
      </xsl:when>
      <xsl:when test="name() = 'section'">
        <xsl:value-of select="concat($book-root, '/', ../@chapnbr, '/', @sectnbr)"/>
      </xsl:when>
      <xsl:when test="name() = 'subject'">
        <xsl:value-of select="concat($book-root, '/', ../../@chapnbr, '/', ../@sectnbr, '/', @subjnbr)"/>
      </xsl:when>
      <xsl:when test="name() = 'ata-page-block'">
        <xsl:value-of select="concat($book-root, '/', @chapter, '/', @section, '/', @subject, '/', @pb-name)"/>
      </xsl:when>
      <xsl:when test="name() = 'module' and parent::*[name() = 'page-block']">
        <xsl:value-of select="concat($book-root, '/', ../@pb-name)"/>
      </xsl:when>
      <xsl:when test="name() = 'module'">
        <xsl:value-of select="concat($book-root, '/', ../@chapter, '/', ../@section, '/', ../@subject, '/', ../@pb-name)"/>
      </xsl:when>
    </xsl:choose>
  </xsl:template>
  
  <xsl:template name="book-type">
    <xsl:param name="abbrev"/>
    <xsl:choose>
      <!-- Overhaul Manual -->
      <xsl:when test="starts-with($abbrev,'oh')">oh</xsl:when>
      <!-- Maintenance Manual -->
      <xsl:when test="starts-with($abbrev,'mm')">mm</xsl:when>
      <!-- Illustrated Parts Catalog -->
      <xsl:when test="starts-with($abbrev,'ipc')">ipc</xsl:when>
      <!-- Engine Parts Catalog -->
      <xsl:when test="starts-with($abbrev,'epc')">epc</xsl:when>
      <!-- Cleaning Inspection Repair -->
      <xsl:when test="starts-with($abbrev,'cir')">cir</xsl:when>
      <!-- Engine Manual -->
      <xsl:when test="starts-with($abbrev,'em')">em</xsl:when>
      <!-- Component Maintenance Manual -->
      <xsl:when test="starts-with($abbrev,'cmm')">cmm</xsl:when>
      <!-- Tasked Maintenance Manual -->
      <xsl:when test="starts-with($abbrev,'lmm') or starts-with($abbrev, 'tmm')">tmm</xsl:when>
      <!-- Service Bulletins -->
      <xsl:when test="starts-with($abbrev,'sb')">sb</xsl:when>
    </xsl:choose>
  </xsl:template>
  
  <!-- standard copy template -->
  <xsl:template match="*">
  <!--<xsl:choose>
    <xsl:when test="child::revst">
      <xsl:apply-templates select="." mode="revst"/>
    </xsl:when>
    <xsl:otherwise>-->
      <xsl:variable name="id">
        <xsl:choose>
          <xsl:when test="@id != ''">
            <xsl:value-of select="@id"/>
          </xsl:when>
          <xsl:when test="@object-key">
            <xsl:value-of select="concat('pwc', @object-key)"/>
          </xsl:when>
          <xsl:when test="name() = 'table'">
            <xsl:value-of select="concat('pwc', ancestor::*[@object-key][1]/@object-key, '.table')"/>
            <xsl:number count="table" from="ata-page-block|page-block" level="any"/>
          </xsl:when>
          <xsl:when test="name() = 'figure'">
            <xsl:value-of select="concat('pwc', ancestor::*[@object-key][1]/@object-key, '.figure')"/>
            <xsl:number count="figure" from="ata-page-block|page-block" level="any"/>
          </xsl:when>
          <xsl:when test="name() = 'n-para'">
            <xsl:value-of select="concat('pwc', ancestor::*[@object-key][1]/@object-key, '.n-para')"/>
            <xsl:number count="n-para" from="ata-page-block|page-block" level="any"/>
          </xsl:when>
        </xsl:choose>
      </xsl:variable>
      
      <xsl:element name="{local-name()}">
        <xsl:copy-of select="@*[not(name() = 't-xref')]"/>
        <xsl:if test="$id !='' ">
          <xsl:attribute name="id">
            <xsl:value-of select="$id"/>
          </xsl:attribute>
        </xsl:if>
        <xsl:apply-templates/>
      </xsl:element>
    <!--</xsl:otherwise>
  </xsl:choose>-->
    
  </xsl:template>
  
  <xsl:template match="processing-instruction()|comment()">
    <xsl:copy-of select="."/>
  </xsl:template>
  
  <xsl:template match="eff-code">
    <xsl:copy>
      <xsl:copy-of select="@*"/>
      <xsl:attribute name="ref">eff-code-table</xsl:attribute>
      <xsl:apply-templates/>
    </xsl:copy>
  </xsl:template>
  
  <xsl:template match="qty">
    <xsl:copy>
      <xsl:copy-of select="@*"/>
      <xsl:apply-templates/>
    </xsl:copy>
  </xsl:template>
  
  
  <!--======================================================================-->
  <!--    Structural Changes Needed to Support DMP Output         -->
  <!--======================================================================-->
  
  <!-- Handle table revstart/revend change tracking markup -->
  <xsl:template match="row[@changeref]">
    <xsl:copy>
      <xsl:copy-of select="@*[not(name() = 'ref')]"/>
      <xsl:variable name="refVal" select="@changeref"/>
      <xsl:variable name="prevRefs" select="count(preceding::row[@changeref = $refVal]) + count(preceding::revst[@ref = $refVal])"/>
      <xsl:attribute name="role">changebar</xsl:attribute>
      <xsl:apply-templates/>
    </xsl:copy>
  </xsl:template>
  
  <xsl:template match="row[@changeref]/entry[1]">
    <xsl:copy>
      <xsl:copy-of select="@*"/>
      <xsl:variable name="refVal" select="parent::row/@changeref"/>
      <xsl:variable name="prevRefs" select="count(parent::row/preceding::row[@changeref = $refVal])"/>
      <marker>
        <xsl:attribute name="id">
          <xsl:choose>
            <xsl:when test="$prevRefs &gt; 0">
              <xsl:value-of select="concat($refVal, '_', $prevRefs + 1)"/>
            </xsl:when>
            <xsl:otherwise>
              <xsl:value-of select="$refVal"/>
            </xsl:otherwise>
          </xsl:choose>
        </xsl:attribute>
      </marker>
      <!-- gdb 12-18-12: JIRA-809 added apply-template select='revst' --> 
      <xsl:apply-templates select="revst"/>
      <xsl:apply-templates/>
    </xsl:copy>
  </xsl:template>
  
  <!-- Handle table revstart/revend change tracking markup -->
  <xsl:template match="row[revst]">
    <xsl:copy>
      <xsl:copy-of select="@*"/>
      <xsl:attribute name="role">changebar</xsl:attribute>
      <xsl:apply-templates/>
    </xsl:copy>
  </xsl:template>
  
  <xsl:template match="row[revst]/entry[1]">
    <xsl:copy>
      <xsl:copy-of select="@*"/>
      <xsl:variable name="refVal" select="preceding-sibling::revst[1]/@ref"/>
      <marker>
        <xsl:attribute name="id">
              <xsl:value-of select="$refVal"/>
        </xsl:attribute>
      </marker>
      <xsl:apply-templates/>
    </xsl:copy>
  </xsl:template>
  
  <xsl:template match="chgdesc">
    <!-- Do not process -->
  </xsl:template>
  
  <xsl:template match="*" mode="lof">
    <xsl:if test="title">
      <xsl:element name="lof-item">
        <xsl:element name="title">
          <xsl:element name="xref">
            <xsl:choose>
              <xsl:when test="@id">
                <xsl:attribute name="ref">
                  <xsl:value-of select="@id"/>
                </xsl:attribute>
              </xsl:when>
              <xsl:when test="self::figure and not(@id)">
                <xsl:attribute name="ref">
                  <xsl:value-of select="concat('pwc', ancestor::*[@object-key][1]/@object-key, '.figure')"/>
                  <xsl:number count="figure" from="ata-page-block|page-block"/>
                </xsl:attribute>
              </xsl:when>
              <xsl:when test="self::graphic and not(@id)">
                <xsl:attribute name="ref">
                  <xsl:value-of select="concat('pwc', ancestor::*[@object-key][1]/@object-key, '.graphic')"/>
                  <xsl:number count="graphic" from="ata-page-block|page-block"/>
                </xsl:attribute>
              </xsl:when>
            </xsl:choose>
            <xsl:apply-templates select="*[name() = 'title']/node()"/>
          </xsl:element>
        </xsl:element>
      </xsl:element>
    </xsl:if>
  </xsl:template>
  
  <!-- Add all <tables>s to the list of tables -->
  <xsl:template match="*[name() = 'table']" mode="lot">
    <xsl:if test="title">
      <xsl:element name="lot-item">
        <xsl:element name="title">
          <xsl:element name="xref">
            <xsl:choose>
              <xsl:when test="@id">
                <xsl:attribute name="ref">
                  <xsl:value-of select="@id"/>
                </xsl:attribute>
              </xsl:when>
              <xsl:when test="self::table and not(@id)">
                <xsl:attribute name="ref">
                  <xsl:value-of select="concat('pwc', ancestor::*[@object-key][1]/@object-key, '.table')"/>
                  <xsl:number count="table" from="ata-page-block|page-block"/>
                </xsl:attribute>
              </xsl:when>
            </xsl:choose>
            <xsl:apply-templates select="*[name() = 'title']/node()"/>
          </xsl:element>
        </xsl:element>
      </xsl:element>
    </xsl:if>
  </xsl:template>
  
  <xsl:template match="step//step">
    <xsl:variable name="stepLevel" select="count(ancestor::step) + 1"/>
    <xsl:variable name="name" select="concat('step', string($stepLevel))"/>
    <xsl:element name="{$name}">
      <xsl:copy-of select="@*"/>
      <xsl:apply-templates/>
    </xsl:element>
  </xsl:template>
  
  <xsl:template match="page-block/module/intro">
    <xsl:copy>
      <xsl:copy-of select="@*"/>
      <xsl:choose>
        <xsl:when test="$document-type='epc'">
          <xsl:call-template name="nest-intro-content"/>
        </xsl:when>
        <xsl:otherwise>
          <xsl:apply-templates/>
        </xsl:otherwise>
      </xsl:choose>
      
    </xsl:copy>
  </xsl:template>
  
  <xsl:template name="nest-intro-content">
    <xsl:for-each select="title">
      <xsl:variable name="pos" select="count(preceding-sibling::title) + 1"/>
      <n-para>
        <xsl:copy-of select="."/>
        <xsl:apply-templates select="following-sibling::*[count(preceding-sibling::title) = $pos][not(name() = 'title')]"/>
      </n-para>
    </xsl:for-each>
  </xsl:template>
  
  <xsl:template match="subpara[not(title)]/para[table]">
    <xsl:copy>
      <!-- gdb 11-28-12 JIRA-814 <xsl:apply-templates select="*[not(name() = 'table')]|text()|processing-instruction()"/> -->
      <xsl:copy-of select="@*"/>
      <xsl:apply-templates select="*|text()|processing-instruction()"/>
    </xsl:copy>
    <!-- gdb 11-28-12 JIRA-814 <xsl:apply-templates select="table"/> -->
  </xsl:template>
  
  <xsl:template match="pgblk">
    <xsl:copy>
      <xsl:copy-of select="@*"/>
      <xsl:apply-templates select="title"/>
      <xsl:apply-templates select="*[not(name() = 'title')]|text()|processing-instruction()"></xsl:apply-templates>
    </xsl:copy>
  </xsl:template>
  
  <xsl:template match="frontmatter/page-block[@pb-name='title-page']/module/title-page">
    <xsl:copy>
      <xsl:copy-of select="@*"/>
      <xsl:apply-templates select="*[not(name() = 'model')]|model[1]|text()|processing-instruction()"/>
    </xsl:copy>
  </xsl:template>
  
  <xsl:template match="frontmatter/page-block[@pb-name='title-page']/module/title-page/model[1]">
    <xsl:copy>
      <xsl:copy-of select="@*"/>
      <xsl:apply-templates/>
      <!-- Combine all <engine>s into one <model> -->
      <xsl:apply-templates select="following-sibling::model/engine"/>
    </xsl:copy>
  </xsl:template>
  
  <xsl:template match="revst">
    <xsl:copy>
      <xsl:copy-of select="@*"/>
      <xsl:attribute name="id">
        <xsl:value-of select="@ref"/>
      </xsl:attribute>
      <xsl:apply-templates/>
    </xsl:copy>
  </xsl:template>
  
  <!-- gdb 12-18-12: JIRA-809 added template match='revst[ancestor::tbody]'-->
  <xsl:template match="revst[ancestor::tbody]">
    <xsl:copy>
      <xsl:copy-of select="@*"/>
      <xsl:attribute name="id">
        <xsl:value-of select="concat(@ref,'a')"/>
      </xsl:attribute>
      <xsl:apply-templates/>
    </xsl:copy>
  </xsl:template>
  
  <!--======================================================================-->
  <!--        Semantic to CALS Table Conversions            -->
  <!--======================================================================-->
  
  <!--<xsl:template match="eqn">
    <table tabstyle="eqn" frame="none">
      <tgroup cols="1">
        <colspec colname="col1" colwidth="100*"/>
        <tbody>
          <row>
            <entry valign="middle">
              <xsl:apply-templates/>
            </entry>
          </row>
        </tbody>
      </tgroup>
    </table>
  </xsl:template> -->
  
  <xsl:template match="frac">
    
    <table tabstyle="frac" frame="none" colsep="0">
      <xsl:variable name="numStringLength" select="number(string-length(normalize-space(num)))"/>
      <xsl:variable name="denomStringLength" select="number(string-length(normalize-space(denom)))"/>
      <xsl:variable name="rawColWidth">
        <xsl:choose>
          <xsl:when test="$numStringLength &gt; $denomStringLength">
            <xsl:value-of select="round($numStringLength * 7.2)"></xsl:value-of>
          </xsl:when>
          <xsl:otherwise>
            <xsl:value-of select="round($denomStringLength * 7.2)"></xsl:value-of>
          </xsl:otherwise>
        </xsl:choose>
      </xsl:variable>
      <xsl:variable name="colWidth" select="concat(string($rawColWidth), 'px')"></xsl:variable>
      
      <tgroup cols="2">
        <colspec colname="col1" colwidth="{$colWidth}"/>
        <colspec colname="col2" colwidth="0.1px"/>
        <tbody>
          <row>
            <entry valign="bottom" rowsep="1">
              <xsl:apply-templates select="num"/>
            </entry>
            <entry colsep="0" rowsep="0"></entry>
          </row>
          <row>
            <entry valign="top">
              <xsl:apply-templates select="denom"/>
            </entry>
            <entry colsep="0" rowsep="0"></entry>
          </row>
        </tbody>
      </tgroup>
    </table>
  </xsl:template>
  
  <xsl:template match="trlist">
    <xsl:variable name="cols">
      <xsl:choose>
        <xsl:when test="$document-type = 'cir'">4</xsl:when>
        <xsl:when test="$document-type = 'em'">4</xsl:when>
        <xsl:otherwise>3</xsl:otherwise>
      </xsl:choose>
    </xsl:variable>
    <table tabstyle="Highlights" role="{@applic}" frame="all">
      <tgroup cols="{$cols}" >
        <xsl:choose>
          <xsl:when test="$cols = '4'">
            <colspec colname="COL1" colwidth="1.00*"/>
            <colspec colname="COL2" colwidth="1.00*"/>
            <colspec colname="COL3" colwidth="2.00*"/>
            <colspec colname="COL4" colwidth="2.00*"/>      
          </xsl:when>
          <xsl:otherwise>
            <colspec colname="COL1" colwidth="1.00*"/>
            <colspec colname="COL2" colwidth="2.00*"/>
            <colspec colname="COL3" colwidth="2.00*"/>
          </xsl:otherwise>
        </xsl:choose>
          
          <thead>
            <row>
              <entry colsep="0" rowsep="1"><xsl:value-of select="$gen-texts//text[@name='trlist-col1']"/></entry>
              <xsl:if test="$cols = '4'">
                <entry colsep="0" rowsep="1"><xsl:value-of select="$gen-texts//text[@name='trlist-col2']"/></entry>
              </xsl:if>
              <entry colsep="0" rowsep="1"><xsl:value-of select="$gen-texts//text[@name='trlist-col3']"/></entry>
              <entry colsep="0" rowsep="1"><xsl:value-of select="$gen-texts//text[@name='trlist-col4']"/></entry>
            </row>
            
          </thead>
          <tbody>
            <xsl:for-each select="trdata">
              <row>
                <entry colsep="0" rowsep="0">
                  <xsl:if test="preceding-sibling::*[name() = 'revst'][1]/count(preceding-sibling::*[name() = 'revst']) =
                          following-sibling::*[name() = 'revend'][1]/count(preceding-sibling::*[name() = 'revend'])">
                    <xsl:text> </xsl:text>      
                    <marker>
                      <xsl:attribute name="id">
                        <xsl:value-of select="preceding-sibling::*[name() = 'revst'][1]/@ref"/>
                      </xsl:attribute>
                    </marker>
                  </xsl:if>
                  <xsl:apply-templates select="trnbr"/>
                </entry>
                <xsl:if test="$cols = '4'">
                  <entry colsep="0" rowsep="0">
                    <xsl:value-of select="effect/@effrg"/>
                  </entry>
                </xsl:if>
                <entry colsep="0" rowsep="0">
                  <xsl:apply-templates select="trloc"/>
                </entry>
                <entry colsep="0" rowsep="0">
                  <xsl:apply-templates select="trstatus"/>
                </entry>
              </row>
            </xsl:for-each>
          </tbody>
      </tgroup>
    </table>
  </xsl:template>
  
  <xsl:template match="highlights">
    <!--  Supress this content -->
  </xsl:template>
  
  <xsl:template name="highlights">
    <highlights id="{concat($book-pnbr, 'highlights')}">
      <title id="{concat($book-pnbr, 'highlights.title')}"><xsl:value-of select="$gen-texts//text[@name='highlights']"/></title>
      <table tabstyle="Highlights" role="{@applic}" frame="none">
        <!--<title>HIGHLIGHTS</title>-->
        <tgroup cols="4" >
                                        <!-- gdb 11-27-12 JIRA_811 added: Revision column -->
          <colspec colname="COL1" colwidth="1.00*"/>
          <colspec colname="COL2" colwidth="1.00*"/>
          <colspec colname="COL3" colwidth="1.00*"/>
          <colspec colname="COL4" colwidth="2.00*"/>
          <thead>
            <row>
              <!-- gdb 11-27-12 JIRA_811 added: Revision column -->
              <entry colsep="0" rowsep="1"><xsl:value-of select="$gen-texts//text[@name='highlights-col1']"/></entry>
              <entry colsep="0" rowsep="1"><xsl:value-of select="$gen-texts//text[@name='highlights-col2']"/></entry>
              <entry colsep="0" rowsep="1"><xsl:value-of select="$gen-texts//text[@name='highlights-col3']"/></entry>
              <entry colsep="0" rowsep="1"><xsl:value-of select="$gen-texts//text[@name='highlights-col4']"/></entry>
            </row>
            
          </thead>
          <tbody>
            <xsl:for-each select="//chgdesc">
              <row>   
                <!-- gdb 11-27-12 JIRA_811 added: Revision column -->
                <entry colsep="0" rowsep="0">
                <xsl:value-of select="@revnbr"/>
                <xsl:text>.</xsl:text>
                <xsl:value-of select="@point-revnbr"/>
                </entry>
                <!-- CH_SE_SU column -->
                <entry colsep="0" rowsep="0">
                  <xsl:choose>
                    <xsl:when test="ancestor::frontmatter">
                      <!--<xsl:value-of select="ancestor::page-block/module[1]/pageblock-title"></xsl:value-of>-->
                      <xsl:value-of select="$gen-texts//text[@name='highlights-front']"/>
                    </xsl:when>
                    <xsl:otherwise>
                      <xsl:value-of select="ancestor::subject/title"/>
                    </xsl:otherwise>
                  </xsl:choose>
                </entry>
                <!-- Page Block column -->
                <entry colsep="0" rowsep="0">
                  <xsl:choose>
                    <xsl:when test="ancestor::frontmatter">
                      <xsl:value-of select="ancestor::page-block/module[1]/pageblock-title"></xsl:value-of>
                    </xsl:when>
                    <xsl:otherwise>
                      <xsl:variable name="pb" select="ancestor::ata-page-block"/>
                      <xsl:value-of select="$pb/@chapter"/><xsl:text>-</xsl:text>
                      <xsl:value-of select="$pb/@section"/><xsl:text>-</xsl:text>
                      <xsl:value-of select="$pb/@subject"/><xsl:text> </xsl:text>
                      <xsl:value-of select="$pb/module[1]/pageblock-title"/>
                    </xsl:otherwise>
                  </xsl:choose>
                </entry>
                <!-- Description column -->
                <entry colsep="0" rowsep="0">
                  <xsl:variable name="id" select="@id"/>
                  <xsl:variable name="links" select="following::revst[@ref = $id]|following::row[@changeref = $id]"/>
                  <xref ref="{$id}">
                    <xsl:value-of select="."/>
                  </xref>
                  <!--<xsl:if test="count($links/*) &gt; 1">
                    <xsl:for-each select="$links/*[position() &gt; 1]">
                      <xsl:variable name="pos" select="position()"/>
                      <xsl:if test="$pos != 1">
                        <xsl:text>, </xsl:text>
                        <xref ref="{concat($id, '_', $pos)}">
                          <xsl:value-of select="$pos"/>
                        </xref>
                      </xsl:if>
                    </xsl:for-each>
                  </xsl:if> -->
                </entry>
              </row>
            </xsl:for-each>
          </tbody>
        </tgroup>
      </table>
    </highlights>
  </xsl:template>
  
  <xsl:template match="module-item/description">
    <xsl:copy>
      <xsl:copy-of select="@*"/>
      <xsl:apply-templates/>
      <xref ref="{@refid}"/>
    </xsl:copy>
  </xsl:template>
  
  <xsl:template match="pwcchapsect-list|chapsect-list">
    <xsl:copy>
      <xsl:copy-of select="@*"/>
      <table tabstyle="chapsect-list"  frame="none">
        <tgroup cols="2">
          <colspec colname="COL1" colwidth="100px"/>
          <colspec colname="COL2" colwidth="200px"/>
          <thead>
            <row>
              <entry colsep="0" rowsep="0">
                <xsl:processing-instruction name="Pub">_font Underline="single" ScoreSpace="no"</xsl:processing-instruction>
                <xsl:value-of select="$gen-texts//text[@name='chapsect-list-col1']"/>
                <xsl:processing-instruction name="Pub">/_font</xsl:processing-instruction>
              </entry>
              <entry colsep="0" rowsep="0">
                <xsl:processing-instruction name="Pub">_font Underline="single" ScoreSpace="no"</xsl:processing-instruction>
                <xsl:value-of select="$gen-texts//text[@name='chapsect-list-col2']"/>
                <xsl:processing-instruction name="Pub">/_font</xsl:processing-instruction>
              </entry>
            </row>
          </thead>
          <tbody>
            <xsl:for-each select="pwcchapsect-item|chapsect-item">
              <row>
                <entry colsep="0" rowsep="0">
                  <xsl:apply-templates select="pwcchapsect|chapsect"/>
                </entry>
                <entry colsep="0" rowsep="0">
                  <xsl:choose>
                    <xsl:when test="pwcchapsect/text() = title/text()">
                      <!-- Do not add duplicate content -->
                    </xsl:when>
                    <xsl:when test="chapsect/text() = title/text()">
                      <!-- Do not add duplicate content -->
                    </xsl:when>
                    <xsl:otherwise>
                      <xsl:apply-templates select="title"/>
                    </xsl:otherwise>
                  </xsl:choose>
                </entry>
              </row>
            </xsl:for-each>
          </tbody>
        </tgroup>
      </table>
    </xsl:copy>
  </xsl:template>
  
  <!-- IPC Parts List Table -->
  <xsl:template match="parts-list">
    <table tabstyle="parts-list" role="{@applic}" frame="none">
      <tgroup cols="7" >
        <colspec colname="COL1" colwidth="10px"/>
        <colspec colname="COL2" colwidth="1.00*"/>
        <colspec colname="COL3" colwidth="2.00*"/>
        <colspec colname="COL4" colwidth="2.00*"/>
        <colspec colname="COL5" colwidth="6.00*"/>
        <colspec colname="COL6" colwidth="1.00*"/>
        <colspec colname="COL7" colwidth="2.00*"/>
        <thead>
          <row>
            <entry colsep="0" rowsep="1"></entry>
            <entry colsep="0" rowsep="1"><xsl:value-of select="$gen-texts//text[@name='parts-list-col1']"/></entry>
            <entry colsep="0" rowsep="1"><xsl:value-of select="$gen-texts//text[@name='parts-list-col2']"/></entry>
            <entry colsep="0" rowsep="1"><xsl:value-of select="$gen-texts//text[@name='parts-list-col3']"/></entry>
            <entry colsep="0" rowsep="1"><xsl:value-of select="$gen-texts//text[@name='parts-list-col4']"/></entry>
            <entry colsep="0" rowsep="1"><xsl:value-of select="$gen-texts//text[@name='parts-list-col5']"/></entry>
            <entry colsep="0" rowsep="1"><xsl:value-of select="$gen-texts//text[@name='parts-list-col6']"/></entry>
          </row>
            
        </thead>
        <tbody>
          <!-- gdb 12-10-12: JIRA-819 added |kits/attach-parts/item-group to for-each select-->
          <xsl:for-each select="item-group|attach-parts/item-group|kits/item-group|kits/attach-parts/item-group">
            
            <xsl:if test="parent::*[name() = 'attach-parts'] and not(preceding-sibling::item-group)">
              <xsl:call-template name="attach-parts-row"/>
            </xsl:if>
            
            <xsl:if test="parent::*[name() = 'kits'] and not(preceding-sibling::item-group)">
              <xsl:call-template name="kits-row"/>
            </xsl:if>
            
            <xsl:choose>
              <xsl:when test="count(part-nbr) &gt; 1">
                <!-- We need a seperate row for each part-nbr -->
                <xsl:for-each select="part-nbr">
                  <xsl:if test="@partial='YES'">
                    <xsl:call-template name="partial-bd-row"/>
                  </xsl:if>
                
                  <row>
                    <xsl:if test="position() = last()">
                      <xsl:attribute name="rowsep">1</xsl:attribute>
                    </xsl:if>
                    <entry colsep="0" align="right">
                      <xsl:choose>
                        <xsl:when test="preceding-sibling::*[name() = 'revst'][1]/count(preceding-sibling::*[name() = 'revst']) =
                          following-sibling::*[name() = 'revend'][1]/count(preceding-sibling::*[name() = 'revend'])">
                          <xsl:variable name="refVal" select="preceding-sibling::*[name() = 'revst'][1]/@ref"/>
                          <xsl:variable name="prevRefs" select="count(preceding-sibling::revst[@ref = $refVal])"/>    
                          <marker>
                            <xsl:attribute name="id">
                              <xsl:choose>
                                <xsl:when test="$prevRefs &gt; 1">
                                  <xsl:value-of select="concat($refVal, '_', $prevRefs)"/>
                                </xsl:when>
                                <xsl:otherwise>
                                  <xsl:value-of select="$refVal"/>
                                </xsl:otherwise>
                              </xsl:choose>
                            </xsl:attribute>
                          </marker>
                        </xsl:when>
                        <xsl:when test="parent::item-group/preceding-sibling::*[name() = 'revst'][1]/count(preceding-sibling::*[name() = 'revst']) =
                          parent::item-group/following-sibling::*[name() = 'revend'][1]/count(preceding-sibling::*[name() = 'revend'])">
                          <xsl:variable name="refVal" select="parent::item-group/preceding-sibling::*[name() = 'revst'][1]/@ref"/>
                          <xsl:variable name="prevRefs" select="count(parent::item-group/preceding-sibling::revst[@ref = $refVal])"/>   
                          <marker>
                            <xsl:attribute name="id">
                              <xsl:choose>
                                <xsl:when test="$prevRefs &gt; 1">
                                  <xsl:value-of select="concat($refVal, '_', $prevRefs)"/>
                                </xsl:when>
                                <xsl:otherwise>
                                  <xsl:value-of select="$refVal"/>
                                </xsl:otherwise>
                              </xsl:choose>
                            </xsl:attribute>
                          </marker>
                        </xsl:when>
                        <!-- gdb 12-07-12: JIRA-818 added when-->
                        <xsl:when test="parent::kits/preceding-sibling::*[name() = 'revst'][1]/count(preceding-sibling::*[name() = 'revst']) =
                          parent::kits/following-sibling::*[name() = 'revend'][1]/count(preceding-sibling::*[name() = 'revend'])">
                          <xsl:variable name="refVal" select="parent::kits/preceding-sibling::*[name() = 'revst'][1]/@ref"/>
                          <xsl:variable name="prevRefs" select="count(parent::kits/preceding-sibling::revst[@ref = $refVal])"/>   
                          <marker>
                            <xsl:attribute name="id">
                              <xsl:choose>
                                <xsl:when test="$prevRefs &gt; 1">
                                  <xsl:value-of select="concat($refVal, '_', $prevRefs)"/>
                                </xsl:when>
                                <xsl:otherwise>
                                  <xsl:value-of select="$refVal"/>
                                </xsl:otherwise>
                              </xsl:choose>
                            </xsl:attribute>
                          </marker>
                        </xsl:when>
                      </xsl:choose>
                      <xsl:if test="parent::item-group[@illus='DASH'] and position() = 1">
                        <emphasis role="bold"><dash/></emphasis>
                      </xsl:if>
                    </entry>
                    <!-- Fig Item Column -->
                    <entry>
                      <xsl:if test="position() = 1">
                        <xsl:value-of select="parent::item-group/@item-nbr"/>
                      </xsl:if>
                    </entry>
                    <!-- Part No. Column -->
                    <entry>
                      <!-- gdb 12-11-12: JIRA-817 added choose -->
                      <xsl:choose>
                        <xsl:when test="following-sibling::prt-nbr[preceding-sibling::*[name()= 'revst']]">
                          <xsl:copy-of select="revst"></xsl:copy-of>
                          <xsl:apply-templates select="."/>
                          <xsl:apply-templates select="following-sibling::ata-nbr[1]"/>
                          <xsl:copy-of select="revend"></xsl:copy-of>
                        </xsl:when>
                        <xsl:otherwise>
                          <xsl:apply-templates select="."/>
                          <xsl:apply-templates select="following-sibling::ata-nbr[1]"/>
                        </xsl:otherwise>
                      </xsl:choose>
                    </entry>
                    <!-- Airline Part No -->
                    <entry>
                      <!-- Empty column -->
                    </entry>
                    <!-- Nomenclature Column -->
                    <entry>
                      <xsl:apply-templates select="following-sibling::nomen-col[1]"/>
                    </entry>
                    <!-- Effect Code Column -->
                    <entry>
                      <!-- gdb 12-04-12: JIRA-817 added choose -->
                      <xsl:choose>
                        <xsl:when test="following-sibling::eff-code[1][preceding-sibling::*[name()= 'revst']]">
                          <xsl:copy-of select="revst"></xsl:copy-of>
                          <eff-code>
                            <xsl:value-of select="following-sibling::eff-code[1]/text()"/>
                          </eff-code>
                          <xsl:copy-of select="revend"></xsl:copy-of>
                        </xsl:when>
                        <xsl:otherwise>
                          <eff-code>
                            <xsl:value-of select="following-sibling::eff-code[1]/text()"/>
                          </eff-code>
                        </xsl:otherwise>
                      </xsl:choose>
                    </entry>
                    <!-- Units Per Assy Column -->
                    <entry>
                      <!-- gdb 12-11-12: JIRA-817 added choose -->
                      <xsl:choose>
                        <xsl:when test="following-sibling::qty[1][preceding-sibling::*[name()= 'revst']]">
                          <xsl:copy-of select="revst"></xsl:copy-of>
                          <xsl:apply-templates select="following-sibling::qty[1]"/>
                          <xsl:copy-of select="revend"></xsl:copy-of>
                        </xsl:when>
                        <xsl:otherwise>
                          <xsl:apply-templates select="following-sibling::qty[1]"/>
                        </xsl:otherwise>
                      </xsl:choose>
                    </entry>
                  </row>
                </xsl:for-each>
              
              </xsl:when>
              <xsl:otherwise>
                <xsl:if test="part-nbr[@partial='YES']">
                  <xsl:call-template name="partial-bd-row"/>
                </xsl:if>
                <row rowsep="1">
                  <xsl:if test="parent::*[name() = 'attach-parts'] and not(following-sibling::item-group)">
                      <xsl:attribute name="rowsep">0</xsl:attribute>
                  </xsl:if>
                  <entry colsep="0" align="right">
                    <xsl:if test="preceding-sibling::*[name() = 'revst'][1]/count(preceding-sibling::*[name() = 'revst']) =
                          following-sibling::*[name() = 'revend'][1]/count(preceding-sibling::*[name() = 'revend'])">
                        <xsl:variable name="refVal" select="preceding-sibling::*[name() = 'revst'][1]/@ref"/>
                        <xsl:variable name="prevRefs" select="count(preceding-sibling::revst[@ref = $refVal])"/>    
                        <marker>
                          <xsl:attribute name="id">
                            <xsl:choose>
                              <xsl:when test="$prevRefs &gt; 1">
                                <xsl:value-of select="concat($refVal, '_', $prevRefs)"/>
                              </xsl:when>
                              <xsl:otherwise>
                                <xsl:value-of select="$refVal"/>
                              </xsl:otherwise>
                            </xsl:choose>
                          </xsl:attribute>
                        </marker>
                    </xsl:if>
                    <!-- gdb 12-07-12: JIRA-818 added if-->
                    <xsl:if test="parent::kits/preceding-sibling::*[name() = 'revst'][1]/count(preceding-sibling::*[name() = 'revst']) =
                      parent::kits/following-sibling::*[name() = 'revend'][1]/count(preceding-sibling::*[name() = 'revend'])">
                      <xsl:variable name="refVal" select="parent::kits/preceding-sibling::*[name() = 'revst'][1]/@ref"/>
                      <xsl:variable name="prevRefs" select="count(parent::kits/preceding-sibling::revst[@ref = $refVal])"/>   
                      <marker>
                        <xsl:attribute name="id">
                          <xsl:choose>
                            <xsl:when test="$prevRefs &gt; 1">
                              <xsl:value-of select="concat($refVal, '_', $prevRefs)"/>
                            </xsl:when>
                            <xsl:otherwise>
                              <xsl:value-of select="$refVal"/>
                            </xsl:otherwise>
                          </xsl:choose>
                        </xsl:attribute>
                      </marker>
                    </xsl:if>
                    <xsl:if test="@illus='DASH'">
                      <emphasis role="bold"><dash/></emphasis>
                    </xsl:if>
                  </entry>
                  <!-- Fig Item Column -->
                  <entry>
                    <xsl:value-of select="@item-nbr"/>
                  </entry>
                  <!-- Part No. Column -->
                  <entry>
                    <!-- gdb 12-11-12: JIRA-817 added choose -->
                    <xsl:choose>
                      <xsl:when test="child::part-nbr[preceding-sibling::*[1][name()= 'revst']]">
                        <xsl:copy-of select="revst"></xsl:copy-of>
                        <xsl:apply-templates select="part-nbr"/>
                        <xsl:apply-templates select="ata-nbr"/>
                        <xsl:copy-of select="revend"></xsl:copy-of>
                      </xsl:when>
                      <xsl:otherwise>
                        <xsl:apply-templates select="part-nbr"/>
                        <xsl:apply-templates select="ata-nbr"/>
                      </xsl:otherwise>
                    </xsl:choose>
                  </entry>
                  <!-- Airline Part No -->
                  <entry>
                    <!-- Empty column -->
                  </entry>
                  <!-- Nomenclature Column -->
                  <entry>
                    <xsl:apply-templates select="nomen-col"/>
                  </entry>
                  <!-- Effect Code Column -->
                  <entry>
                    <!-- gdb 12-04-12: JIRA-817 added choose -->
                    <xsl:choose>
                      <xsl:when test="child::eff-code[preceding-sibling::*[1][name()= 'revst']]">
                        <xsl:copy-of select="revst"></xsl:copy-of>
                        <xsl:apply-templates select="eff-code"/>
                        <xsl:copy-of select="revend"></xsl:copy-of>
                      </xsl:when>
                      <xsl:otherwise>
                        <xsl:apply-templates select="eff-code"/>
                      </xsl:otherwise>
                    </xsl:choose>
                  </entry>
                  <!-- Units Per Assy Column -->
                  <entry>
                    <!-- gdb 12-11-12: JIRA-817 added choose -->
                    <xsl:choose>
                      <xsl:when test="child::qty[preceding-sibling::*[1][name()= 'revst']]">
                        <xsl:copy-of select="revst"></xsl:copy-of>
                        <xsl:apply-templates select="qty"/>
                        <xsl:copy-of select="revend"></xsl:copy-of>
                      </xsl:when>
                      <xsl:otherwise>
                        <xsl:apply-templates select="qty"/>
                      </xsl:otherwise>
                    </xsl:choose>
                  </entry>
                </row>
              </xsl:otherwise>
            </xsl:choose>
            
            <xsl:if test="parent::*[name() = 'attach-parts'] and not(following-sibling::item-group)">
              <row rowsep="0">
                <entry rowsep="1" colsep="0"></entry>
                <entry rowsep="1"></entry>
                <entry rowsep="1"></entry>
                <entry rowsep="1"></entry>
                <entry rowsep="1">
                  <xsl:processing-instruction name="Pub">_newline</xsl:processing-instruction>
                  <emphasis role="bold">
                    <xsl:processing-instruction name="Pub">_font TypeSize="130%"</xsl:processing-instruction>
                    <xsl:text>------*------</xsl:text>
                    <xsl:processing-instruction name="Pub">/_font</xsl:processing-instruction>
                  </emphasis>
                </entry>
                <entry rowsep="1"></entry>
                <entry rowsep="1"></entry>
              </row>
            </xsl:if>
          </xsl:for-each>
          
        </tbody>
      </tgroup>
    
    </table>
    
    <xsl:if test="fignote">
      <table tabstyle="fignote" role="{@applic}" frame="none">
        <tgroup cols="2" >
          <colspec colname="COL1" colwidth="1.00*"/>
          <colspec colname="COL2" colwidth="4.00*"/>
          <tbody>
            <xsl:for-each select="fignote">
              <xsl:choose>
                <xsl:when test="preceding-sibling::*[name() = 'revst'][1]/count(preceding-sibling::*[name() = 'revst']) =
                          following-sibling::*[name() = 'revend'][1]/count(preceding-sibling::*[name() = 'revend'])">
                  <xsl:variable name="refVal" select="preceding-sibling::*[name() = 'revst'][1]/@ref"/>
                  <xsl:variable name="prevRefs" select="count(preceding-sibling::revst[@ref = $refVal])"/>
                  
                  <row role="changebar" changebar="yes">
                    <entry>
                      <fignote>
                        <xsl:copy-of select="@*"/>
                        <emphasis><xsl:value-of select="$gen-texts//text[@name='fignote']"/> <xsl:value-of select="@fignote-nbr"/>:</emphasis>
                      </fignote>
                    </entry>
                    <entry >
                      <xsl:value-of select="."/>
                    </entry>
                  </row>    
                </xsl:when>
                <xsl:otherwise>
                  <row>
                    <entry>
                      <fignote>
                        <xsl:copy-of select="@*"/>
                        <emphasis><xsl:value-of select="$gen-texts//text[@name='fignote']"/> <xsl:value-of select="@fignote-nbr"/>:</emphasis>
                      </fignote>
                    </entry>
                    <entry >
                      <xsl:value-of select="."/>
                    </entry>
                  </row>
                </xsl:otherwise>
              </xsl:choose>
              
            </xsl:for-each>
          </tbody>
        </tgroup>
      </table>
    </xsl:if>
    <para><emphasis role="bold"><dash/></emphasis> <xsl:value-of select="$gen-texts//text[@name='item-not-illus']"/></para>
    
    <table tabstyle="eff-code" frame="none" id="eff-code-table">
      <tgroup cols="2" >
        <colspec colname="COL1" colwidth="1.00*"/>
        <colspec colname="COL2" colwidth="1.5*"/>
        <thead>
          <row rowsep="1">
            <entry colsep="0" rowsep="1"><xsl:value-of select="$gen-texts//text[@name='eff-code-col1']"/></entry>
            <entry colsep="0" rowsep="1"><xsl:value-of select="$gen-texts//text[@name='eff-code-col2']"/></entry>
          </row>
        </thead>
        <tbody>
          
          <xsl:for-each select="/book/frontmatter/page-block[@pb-name='intro']//list/item[descendant::eff-letter]">
            <row>
              <entry colsep="0" rowsep="0"><xsl:value-of select="eff-letter"/></entry>
              <entry colsep="0" rowsep="0">
                <xsl:value-of select="eff-model"/>
                <!-- removing eff-bs Jira 807
                <xsl:for-each select="eff-bs">
                  <xsl:value-of select="."/>
                  
                  <xsl:if test="following-sibling::eff-bs">
                    <xsl:text>, </xsl:text>
                  </xsl:if>
                </xsl:for-each>
                -->
              </entry>
            </row>
          </xsl:for-each>
          
        </tbody>
      </tgroup>
    </table>
  </xsl:template>
  
  <xsl:template name="partial-bd-row">
    <row rowsep="0">
      <entry rowsep="0" colsep="0"></entry>
      <entry rowsep="0"></entry>
      <entry rowsep="0"></entry>
      <entry rowsep="0"></entry>
      <entry rowsep="0"><xsl:value-of select="$gen-texts//text[@name='partial-bd']"/>:</entry>
      <entry rowsep="0"></entry>
      <entry rowsep="0"></entry>
    </row>
  </xsl:template>
  
  <xsl:template name="attach-parts-row">
    <row rowsep="0">
      <entry rowsep="0" colsep="0"></entry>
      <entry rowsep="0"></entry>
      <entry rowsep="0"></entry>
      <entry rowsep="0"></entry>
      <entry rowsep="0">
        <emphasis role="bold"><xsl:value-of select="$gen-texts//text[@name='attach-parts']"/></emphasis>
        <xsl:processing-instruction name="Pub">_newline</xsl:processing-instruction>
      </entry>
      <entry rowsep="0"></entry>
      <entry rowsep="0"></entry>
    </row>
  </xsl:template>
  
  <xsl:template name="kits-row">
    <row rowsep="0">
      <entry rowsep="0" colsep="0"></entry>
      <entry rowsep="0"></entry>
      <entry rowsep="0"></entry>
      <entry rowsep="0"></entry>
      <entry rowsep="0"><xsl:value-of select="$gen-texts//text[@name='kits']"/></entry>
      <entry rowsep="0"></entry>
      <entry rowsep="0"></entry>
    </row>
  </xsl:template>
  
  <xsl:template match="nomen-col">
    <xsl:copy>
      <xsl:copy-of select="@*"/>
      <xsl:copy-of select="parent::item-group/@*[not(name() = 'select-at')]"/>
      <xsl:if test="count(preceding-sibling::nomen-col) = 0">
        <xsl:copy-of select="parent::item-group/@select-at"/>
      </xsl:if>
      <xsl:apply-templates/>
    </xsl:copy>
  </xsl:template>
  
  <!-- EMIPC Parts List -->
  <xsl:template match="prtlist">
    <table tabstyle="parts-list" role="{@applic}" frame="none">
      <tgroup cols="8" >
        <colspec colname="COL1" colwidth="10px"/>
        <colspec colname="COL2" colwidth="1.00*"/>
        <colspec colname="COL3" colwidth="2.00*"/>
        <colspec colname="COL4" colwidth="2.00*"/>
        <colspec colname="COL5" colwidth="6.00*"/>
        <colspec colname="COL6" colwidth="1.00*"/>
        <colspec colname="COL7" colwidth="2.00*"/>
        <thead>
          <row>
            <entry colsep="0" rowsep="1"></entry>
            <entry colsep="0" rowsep="1"><xsl:value-of select="$gen-texts//text[@name='parts-list-col1']"/></entry>
            <entry colsep="0" rowsep="1"><xsl:value-of select="$gen-texts//text[@name='parts-list-col2']"/></entry>
            <entry colsep="0" rowsep="1"><xsl:value-of select="$gen-texts//text[@name='parts-list-col3']"/></entry>
            <entry colsep="0" rowsep="1"><xsl:value-of select="$gen-texts//text[@name='parts-list-col4']"/></entry>
            <entry colsep="0" rowsep="1"><xsl:value-of select="$gen-texts//text[@name='parts-list-col5']"/></entry>
            <entry colsep="0" rowsep="1"><xsl:value-of select="$gen-texts//text[@name='parts-list-col6']"/></entry>
          </row>
            
        </thead>
        <tbody>
          <xsl:for-each select="item">
            <xsl:choose>
              <xsl:when test="count(part) &gt; 1">
                <!-- We need a seperate row for each part-nbr -->
                <xsl:for-each select="part">
                  <row rowsep="1">
                    <xsl:if test="count(following-sibling::part) &gt; 0">
                      <xsl:attribute name="rowsep">0</xsl:attribute>
                    </xsl:if>
                    <entry colsep="0" align="right">
                      <xsl:choose>
                        <xsl:when test="preceding-sibling::*[name() = 'revst'][1]/count(preceding-sibling::*[name() = 'revst']) =
                          following-sibling::*[name() = 'revend'][1]/count(preceding-sibling::*[name() = 'revend'])">
                          <xsl:variable name="refVal" select="preceding-sibling::*[name() = 'revst'][1]/@ref"/>
                          <xsl:variable name="prevRefs" select="count(preceding-sibling::revst[@ref = $refVal])"/>    
                          <marker>
                            <xsl:attribute name="id">
                              <xsl:choose>
                                <xsl:when test="$prevRefs &gt; 1">
                                  <xsl:value-of select="concat($refVal, '_', $prevRefs)"/>
                                </xsl:when>
                                <xsl:otherwise>
                                  <xsl:value-of select="$refVal"/>
                                </xsl:otherwise>
                              </xsl:choose>
                            </xsl:attribute>
                          </marker>
                        </xsl:when>
                        <xsl:when test="parent::item/preceding-sibling::*[name() = 'revst'][1]/count(preceding-sibling::*[name() = 'revst']) =
                          parent::item/following-sibling::*[name() = 'revend'][1]/count(preceding-sibling::*[name() = 'revend'])">
                          <xsl:variable name="refVal" select="parent::item/preceding-sibling::*[name() = 'revst'][1]/@ref"/>
                          <xsl:variable name="prevRefs" select="count(parent::item/preceding-sibling::revst[@ref = $refVal])"/>   
                          <marker>
                            <xsl:attribute name="id">
                              <xsl:choose>
                                <xsl:when test="$prevRefs &gt; 1">
                                  <xsl:value-of select="concat($refVal, '_', $prevRefs)"/>
                                </xsl:when>
                                <xsl:otherwise>
                                  <xsl:value-of select="$refVal"/>
                                </xsl:otherwise>
                              </xsl:choose>
                            </xsl:attribute>
                          </marker>
                        </xsl:when>
                      </xsl:choose>
                      
                      <xsl:if test="parent::item[@illusind='0'] and position() = 1">
                        <emphasis role="bold"><dash/></emphasis>
                      </xsl:if>
                    </entry>
                    <!-- Fig Item Column -->
                    <entry>
                      <xsl:if test="position() = 1">
                        <xsl:value-of select="parent::item/@itemnbr"/>
                      </xsl:if>
                    </entry>
                    <!-- Part No. Column -->
                    <entry>
                      <xsl:value-of select="pnr"/>
                      <xsl:apply-templates select="pwcatanbr"/>
                    </entry>
                    <!-- Airline Part No -->
                    <entry>
                      <!-- Empty column -->
                    </entry>
                    <!-- Nomenclature Column -->
                    <entry>
                      <xsl:if test="parent::item[@attach = '1'] 
                                and count(preceding-sibling::part) = 0
                                and not(parent::item/preceding-sibling::item[1][@attach = '1'])">
                        <emphasis role="bold"><xsl:value-of select="$gen-texts//text[@name='attach-parts']"/></emphasis>
                        <xsl:processing-instruction name="Pub">_newline</xsl:processing-instruction>
                      </xsl:if>
                      <itemspec>
                        <xsl:copy-of select="parent::item/@*"/>
                        <!-- Add indent attribute values for indented sub-assemblies -->
                        <xsl:choose>
                          <xsl:when test="starts-with(nom/kwd/text(), '...')">
                            <xsl:attribute name="indent">4</xsl:attribute>
                          </xsl:when>
                          <xsl:when test="starts-with(nom/kwd/text(), '..')">
                            <xsl:attribute name="indent">3</xsl:attribute>
                          </xsl:when>
                          <xsl:when test="starts-with(nom/kwd/text(), '.')">
                            <xsl:attribute name="indent">2</xsl:attribute>
                          </xsl:when>
                        </xsl:choose>
                        <xsl:apply-templates select="nom"/>
                        <xsl:apply-templates select="dd"/>
                        <xsl:apply-templates select="pwcsin|refint|refext|mfr|following-sibling::*[1][name() = 'itemspec']/*[not(name() = 'upa')]"/>
                        
                      </itemspec>
                      <xsl:if test="parent::item[@attach = '1'] 
                                and count(following-sibling::part) = 0
                                and not(parent::item/following-sibling::item[1][@attach = '1'])">
                        <xsl:processing-instruction name="Pub">_newline</xsl:processing-instruction>
                        <emphasis role="bold">
                          <xsl:processing-instruction name="Pub">_font TypeSize="130%"</xsl:processing-instruction>
                          <xsl:text>------*------</xsl:text>
                          <xsl:processing-instruction name="Pub">/_font</xsl:processing-instruction>
                        </emphasis>
                      </xsl:if>
                    </entry>
                    <!-- Effect Code Column -->
                    <entry>
                      <!-- Empty column -->
                    </entry>
                    <!-- Units Per Assy Column -->
                    <entry>
                      <xsl:apply-templates select="following-sibling::itemspec[1]/upa"/>
                      <xsl:apply-templates select="np"/>
                    </entry>
                  </row>
                </xsl:for-each>
              
              </xsl:when>
              <xsl:otherwise>
                <row rowsep="1">
                  <entry colsep="0" align="right">
                    <xsl:if test="preceding-sibling::*[name() = 'revst'][1]/count(preceding-sibling::*[name() = 'revst']) =
                          following-sibling::*[name() = 'revend'][1]/count(preceding-sibling::*[name() = 'revend'])">
                        <xsl:variable name="refVal" select="preceding-sibling::*[name() = 'revst'][1]/@ref"/>
                        <xsl:variable name="prevRefs" select="count(preceding-sibling::revst[@ref = $refVal])"/>    
                        <marker>
                          <xsl:attribute name="id">
                            <xsl:choose>
                              <xsl:when test="$prevRefs &gt; 1">
                                <xsl:value-of select="concat($refVal, '_', $prevRefs)"/>
                              </xsl:when>
                              <xsl:otherwise>
                                <xsl:value-of select="$refVal"/>
                              </xsl:otherwise>
                            </xsl:choose>
                          </xsl:attribute>
                        </marker>
                    </xsl:if>
                    <xsl:if test="@illusind='0'">
                      <emphasis role="bold"><dash/></emphasis>
                    </xsl:if>
                  </entry>
                  <!-- Fig Item Column -->
                  <entry>
                    <xsl:value-of select="@itemnbr"/>
                  </entry>
                  <!-- Part No. Column -->
                  <entry>
                    <xsl:apply-templates select="part/pnr"/>
                    <xsl:apply-templates select="part/pwcatanbr"/>
                  </entry>
                  <!-- Airline Part No -->
                  <entry>
                    <!-- Empty column -->
                  </entry>
                  
                  <!-- Nomenclature Column -->
                  <entry>
                    <xsl:if test="@attach = '1' and not(preceding-sibling::item[1][@attach = '1'])">
                      <emphasis role="bold"><xsl:value-of select="$gen-texts//text[@name='attach-parts']"/></emphasis>
                      <xsl:processing-instruction name="Pub">_newline</xsl:processing-instruction>
                    </xsl:if>
                    <itemspec>
                      <xsl:copy-of select="@*"/>
                      <xsl:apply-templates select="part/nom"/>
                      <xsl:apply-templates select="part/dd"/>
                      <xsl:apply-templates select="part/pwcsin|part/refint|part/refext|part/mfr|itemspec/*[not(name() = 'upa')]"/>
                    </itemspec>
                    <xsl:if test="@attach = '1' and not(following-sibling::item[1][@attach = '1'])">
                      <xsl:processing-instruction name="Pub">_newline</xsl:processing-instruction>
                      <emphasis role="bold">
                        <xsl:processing-instruction name="Pub">_font TypeSize="130%"</xsl:processing-instruction>
                        <xsl:text>------*------</xsl:text>
                        <xsl:processing-instruction name="Pub">/_font</xsl:processing-instruction>
                      </emphasis>
                    </xsl:if>
                  </entry>
                  <!-- Effect Code Column -->
                  <entry>
                    <!-- Empty column -->
                  </entry>
                  <!-- Units Per Assy Column -->
                  <entry>
                    <xsl:apply-templates select="itemspec/upa"/>
                    <xsl:apply-templates select="part/np"/>
                  </entry>
                </row>
              </xsl:otherwise>
            </xsl:choose>
            
          </xsl:for-each>
          
        </tbody>
      </tgroup>
    
    </table>
    
    <para><emphasis role="bold"><dash/></emphasis> <xsl:value-of select="$gen-texts//text[@name='item-not-illus']"/></para>
    
    
  </xsl:template>
  
  <!-- add by GBE -->
  <!-- keep sin in IPC -->
  <xsl:template match="item-group/part-nbr">
    <part-nbr>
      <xsl:copy-of select="@*"/>
      <xsl:copy-of select="preceding-sibling::sin[generate-id(following-sibling::part-nbr[1]) = generate-id(current())]"/>
      <xsl:apply-templates/>
    </part-nbr>
  </xsl:template>
    
  <!-- end add by GBE -->
  
  <!-- SPB List -->
  <xsl:template match="pwcspblist">
    <xsl:copy>
      <xsl:copy-of select="@*"/>
      <xsl:apply-templates select="*[not(self::pwcspbdata)]|processing-instruction()"/>
      <table>
        <tgroup cols="3" >
          <colspec colname="COL1" colwidth="1.00*"/>
          <colspec colname="COL2" colwidth="1.00*"/>
          <colspec colname="COL3" colwidth="2.00*"/>
          <thead>
            <row>
              <entry><xsl:value-of select="$gen-texts//text[@name='spblist-col1']"/></entry>
              <entry><xsl:value-of select="$gen-texts//text[@name='spblist-col2']"/></entry>
              <entry><xsl:value-of select="$gen-texts//text[@name='spblist-col3']"/></entry>
            </row>
          </thead>
          <tbody>
            <xsl:for-each select="pwcspbdata">
              <row>
                <entry>
                  <xsl:apply-templates select="spbnbr"/>
                </entry>
                <entry >
                  <xsl:apply-templates select="spbnbr/@revno"/>
                </entry>
                <entry>
                  <xsl:apply-templates select="ics"/>
                </entry>
              </row>
            </xsl:for-each>
          </tbody>
        </tgroup>
      </table>
    </xsl:copy>
  </xsl:template>
</xsl:stylesheet>
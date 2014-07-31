<?xml version="1.0" encoding="UTF-8"?><xsl:stylesheet xmlns:simg="java:net.sf.docbook.saxon.ImageIntrinsics" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:ximg="xaln://com.nwalsh.xalan.ImageIntrinsics" xmlns="http://www.w3.org/1999/xhtml" xmlns:exslt="http://exslt.org/common" xmlns:_acl="java:com.arbortext.epic.Acl" xmlns:msxsl="urn:schemas-microsoft-com:xslt" xmlns:_="http://www.pwc.ca/namespace/doctypes/emipc" xmlns:_dtd="http://www.arbortext.com/namespace/Styler/UserElements" xmlns:atidlm="http://www.arbortext.com/namespace/atidlm" xmlns:_2="http://www.pwc.ca/namespace/doctypes/jmtosmigrate" xmlns:ch="http://www.arbortext.com/namespace/chunker" xmlns:saxon="http://saxon.sf.net/" xmlns:_5="http://www.pwc.ca/namespace/doctypes/ipc" xmlns:_gte="http://www.arbortext.com/namespace/Styler/GeneratedTextElements" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:_sfe="http://www.arbortext.com/namespace/Styler/StylerFormattingElements" xmlns:_js="java:com.arbortext.epic.internal.js.JavaScript" xmlns:_3="http://www.pwc.ca/namespace/doctypes/migrate" xmlns:_ufe="http://www.arbortext.com/namespace/Styler/UserFormattingElements" version="1.0" exclude-result-prefixes="_ atidlm xml _2 ch saxon _5 xsi _js _3 #default exslt msxsl _dtd _ufe _sfe _gte simg ximg _acl">


<xsl:template match="pgblk/_ufe:chapsect-title" priority="2" mode="toc-mode-Table_of_Contents"><!--This title doesn't go into this ToC--></xsl:template>

<xsl:template match="pbfmatr/_ufe:chapsect-title" priority="1" mode="toc-mode-Table_of_Contents"><!--This title doesn't go into this ToC--></xsl:template>

<xsl:template match="_ufe:chapsect-title" priority="0" mode="toc-mode-Table_of_Contents">
      <_sfe:TocEntry1_Table_of_Contents>
         <xsl:attribute name="tocentry-indent-class"> x-Table-of-Contents-toc-entry-indent-1</xsl:attribute>
         <xsl:call-template name="maybe-set-id">
            <xsl:with-param name="attrname" select="'tocentry_id'"/>
            <xsl:with-param name="only-if-id-attr" select="'no'"/>
            <xsl:with-param name="generated-id-prefix" select="'styler-id'"/>
            <xsl:with-param name="context-node" select="(.[self::_ufe:*]|..)[last()]"/>
         </xsl:call-template>
         <_sfe:TocTitle_Table_of_Contents>
            <xsl:if test="node()[not(self::_sfe:BeforeOrAfterText)]">
               <_gte:Gentexted-Content-Wrapper>
                  <xsl:apply-templates mode="expand-gentext">
                     <xsl:with-param name="skip-expanded-gentext" select="'yes'"/>
                  </xsl:apply-templates>
               </_gte:Gentexted-Content-Wrapper>
            </xsl:if>
         </_sfe:TocTitle_Table_of_Contents>
         <_sfe:TocPage_Table_of_Contents> </_sfe:TocPage_Table_of_Contents>
      </_sfe:TocEntry1_Table_of_Contents>
   </xsl:template>

<xsl:template match="pgblk/_ufe:consumables-title" priority="5" mode="toc-mode-Table_of_Contents"><!--This title doesn't go into this ToC--></xsl:template>

<xsl:template match="pbfmatr/_ufe:consumables-title" priority="4" mode="toc-mode-Table_of_Contents"><!--This title doesn't go into this ToC--></xsl:template>

<xsl:template match="pwcspblist/_ufe:consumables-title" priority="3" mode="toc-mode-Table_of_Contents"><!--This title doesn't go into this ToC--></xsl:template>

<xsl:template match="ata-page-block//consumables//_ufe:consumables-title" priority="2" mode="toc-mode-Table_of_Contents">
      <_sfe:TocEntry1_Table_of_Contents>
         <xsl:attribute name="tocentry-indent-class"> x-Table-of-Contents-toc-entry-indent-1</xsl:attribute>
         <xsl:call-template name="maybe-set-id">
            <xsl:with-param name="attrname" select="'tocentry_id'"/>
            <xsl:with-param name="only-if-id-attr" select="'no'"/>
            <xsl:with-param name="generated-id-prefix" select="'styler-id'"/>
            <xsl:with-param name="context-node" select="(.[self::_ufe:*]|..)[last()]"/>
         </xsl:call-template>
         <_sfe:TocTitle_Table_of_Contents>
            <xsl:if test="node()[not(self::_sfe:BeforeOrAfterText)]">
               <_gte:Gentexted-Content-Wrapper>
                  <xsl:apply-templates mode="expand-gentext">
                     <xsl:with-param name="skip-expanded-gentext" select="'yes'"/>
                  </xsl:apply-templates>
               </_gte:Gentexted-Content-Wrapper>
            </xsl:if>
         </_sfe:TocTitle_Table_of_Contents>
         <_sfe:TocPage_Table_of_Contents> </_sfe:TocPage_Table_of_Contents>
      </_sfe:TocEntry1_Table_of_Contents>
   </xsl:template>

<xsl:template match="page-block//consumables//_ufe:consumables-title" priority="1" mode="toc-mode-Table_of_Contents">
      <_sfe:TocEntry1_Table_of_Contents>
         <xsl:attribute name="tocentry-indent-class">x-Table-of-Contents-toc-entry-indent-1</xsl:attribute>
         <xsl:call-template name="maybe-set-id">
            <xsl:with-param name="attrname" select="'tocentry_id'"/>
            <xsl:with-param name="only-if-id-attr" select="'no'"/>
            <xsl:with-param name="generated-id-prefix" select="'styler-id'"/>
            <xsl:with-param name="context-node" select="(.[self::_ufe:*]|..)[last()]"/>
         </xsl:call-template>
         <_sfe:TocTitle_Table_of_Contents>
            <xsl:if test="node()[not(self::_sfe:BeforeOrAfterText)]">
               <_gte:Gentexted-Content-Wrapper>
                  <xsl:apply-templates mode="expand-gentext">
                     <xsl:with-param name="skip-expanded-gentext" select="'yes'"/>
                  </xsl:apply-templates>
               </_gte:Gentexted-Content-Wrapper>
            </xsl:if>
         </_sfe:TocTitle_Table_of_Contents>
         <_sfe:TocPage_Table_of_Contents> </_sfe:TocPage_Table_of_Contents>
      </_sfe:TocEntry1_Table_of_Contents>
   </xsl:template>

<xsl:template match="_ufe:consumables-title" priority="0" mode="toc-mode-Table_of_Contents"><!--This title doesn't go into this ToC--></xsl:template>

<xsl:template match="pgblk/_ufe:fixequ-title" priority="5" mode="toc-mode-Table_of_Contents"><!--This title doesn't go into this ToC--></xsl:template>

<xsl:template match="pbfmatr/_ufe:fixequ-title" priority="4" mode="toc-mode-Table_of_Contents"><!--This title doesn't go into this ToC--></xsl:template>

<xsl:template match="pwcspblist/_ufe:fixequ-title" priority="3" mode="toc-mode-Table_of_Contents"><!--This title doesn't go into this ToC--></xsl:template>

<xsl:template match="page-block//fixtures-and-equipment//_ufe:fixequ-title" priority="2" mode="toc-mode-Table_of_Contents">
      <_sfe:TocEntry1_Table_of_Contents>
         <xsl:attribute name="tocentry-indent-class"> x-Table-of-Contents-toc-entry-indent-1</xsl:attribute>
         <xsl:call-template name="maybe-set-id">
            <xsl:with-param name="attrname" select="'tocentry_id'"/>
            <xsl:with-param name="only-if-id-attr" select="'no'"/>
            <xsl:with-param name="generated-id-prefix" select="'styler-id'"/>
            <xsl:with-param name="context-node" select="(.[self::_ufe:*]|..)[last()]"/>
         </xsl:call-template>
         <_sfe:TocTitle_Table_of_Contents>
            <xsl:if test="node()[not(self::_sfe:BeforeOrAfterText)]">
               <_gte:Gentexted-Content-Wrapper>
                  <xsl:apply-templates mode="expand-gentext">
                     <xsl:with-param name="skip-expanded-gentext" select="'yes'"/>
                  </xsl:apply-templates>
               </_gte:Gentexted-Content-Wrapper>
            </xsl:if>
         </_sfe:TocTitle_Table_of_Contents>
         <_sfe:TocPage_Table_of_Contents> </_sfe:TocPage_Table_of_Contents>
      </_sfe:TocEntry1_Table_of_Contents>
   </xsl:template>

<xsl:template match="ata-page-block//fixtures-and-equipment//_ufe:fixequ-title" priority="1" mode="toc-mode-Table_of_Contents">
      <_sfe:TocEntry1_Table_of_Contents>
         <xsl:attribute name="tocentry-indent-class"> x-Table-of-Contents-toc-entry-indent-1</xsl:attribute>
         <xsl:call-template name="maybe-set-id">
            <xsl:with-param name="attrname" select="'tocentry_id'"/>
            <xsl:with-param name="only-if-id-attr" select="'no'"/>
            <xsl:with-param name="generated-id-prefix" select="'styler-id'"/>
            <xsl:with-param name="context-node" select="(.[self::_ufe:*]|..)[last()]"/>
         </xsl:call-template>
         <_sfe:TocTitle_Table_of_Contents>
            <xsl:if test="node()[not(self::_sfe:BeforeOrAfterText)]">
               <_gte:Gentexted-Content-Wrapper>
                  <xsl:apply-templates mode="expand-gentext">
                     <xsl:with-param name="skip-expanded-gentext" select="'yes'"/>
                  </xsl:apply-templates>
               </_gte:Gentexted-Content-Wrapper>
            </xsl:if>
         </_sfe:TocTitle_Table_of_Contents>
         <_sfe:TocPage_Table_of_Contents> </_sfe:TocPage_Table_of_Contents>
      </_sfe:TocEntry1_Table_of_Contents>
   </xsl:template>

<xsl:template match="_ufe:fixequ-title" priority="0" mode="toc-mode-Table_of_Contents"><!--This title doesn't go into this ToC--></xsl:template>

<xsl:template match="pgblk/_ufe:general-title" priority="5" mode="toc-mode-Table_of_Contents"><!--This title doesn't go into this ToC--></xsl:template>

<xsl:template match="pbfmatr/_ufe:general-title" priority="4" mode="toc-mode-Table_of_Contents"><!--This title doesn't go into this ToC--></xsl:template>

<xsl:template match="pwcspblist/_ufe:general-title" priority="3" mode="toc-mode-Table_of_Contents"><!--This title doesn't go into this ToC--></xsl:template>

<xsl:template match="page-block//general//_ufe:general-title" priority="2" mode="toc-mode-Table_of_Contents">
      <_sfe:TocEntry1_Table_of_Contents>
         <xsl:attribute name="tocentry-indent-class"> x-Table-of-Contents-toc-entry-indent-1</xsl:attribute>
         <xsl:call-template name="maybe-set-id">
            <xsl:with-param name="attrname" select="'tocentry_id'"/>
            <xsl:with-param name="only-if-id-attr" select="'no'"/>
            <xsl:with-param name="generated-id-prefix" select="'styler-id'"/>
            <xsl:with-param name="context-node" select="(.[self::_ufe:*]|..)[last()]"/>
         </xsl:call-template>
         <_sfe:TocTitle_Table_of_Contents>
            <xsl:if test="node()[not(self::_sfe:BeforeOrAfterText)]">
               <_gte:Gentexted-Content-Wrapper>
                  <xsl:apply-templates mode="expand-gentext">
                     <xsl:with-param name="skip-expanded-gentext" select="'yes'"/>
                  </xsl:apply-templates>
               </_gte:Gentexted-Content-Wrapper>
            </xsl:if>
         </_sfe:TocTitle_Table_of_Contents>
         <_sfe:TocPage_Table_of_Contents> </_sfe:TocPage_Table_of_Contents>
      </_sfe:TocEntry1_Table_of_Contents>
   </xsl:template>

<xsl:template match="ata-page-block//general//_ufe:general-title" priority="1" mode="toc-mode-Table_of_Contents">
      <_sfe:TocEntry1_Table_of_Contents>
         <xsl:attribute name="tocentry-indent-class"> x-Table-of-Contents-toc-entry-indent-1</xsl:attribute>
         <xsl:call-template name="maybe-set-id">
            <xsl:with-param name="attrname" select="'tocentry_id'"/>
            <xsl:with-param name="only-if-id-attr" select="'no'"/>
            <xsl:with-param name="generated-id-prefix" select="'styler-id'"/>
            <xsl:with-param name="context-node" select="(.[self::_ufe:*]|..)[last()]"/>
         </xsl:call-template>
         <_sfe:TocTitle_Table_of_Contents>
            <xsl:if test="node()[not(self::_sfe:BeforeOrAfterText)]">
               <_gte:Gentexted-Content-Wrapper>
                  <xsl:apply-templates mode="expand-gentext">
                     <xsl:with-param name="skip-expanded-gentext" select="'yes'"/>
                  </xsl:apply-templates>
               </_gte:Gentexted-Content-Wrapper>
            </xsl:if>
         </_sfe:TocTitle_Table_of_Contents>
         <_sfe:TocPage_Table_of_Contents> </_sfe:TocPage_Table_of_Contents>
      </_sfe:TocEntry1_Table_of_Contents>
   </xsl:template>

<xsl:template match="_ufe:general-title" priority="0" mode="toc-mode-Table_of_Contents"><!--This title doesn't go into this ToC--></xsl:template>

<xsl:template match="pbfmatr/manual-title" priority="3" mode="toc-mode-Table_of_Contents"><!--This title doesn't go into this ToC--></xsl:template>

<xsl:template match="pwcspblist/manual-title" priority="2" mode="toc-mode-Table_of_Contents"><!--This title doesn't go into this ToC--></xsl:template>

<xsl:template match="pgblk/manual-title" priority="1" mode="toc-mode-Table_of_Contents"><!--This title doesn't go into this ToC--></xsl:template>

<xsl:template match="manual-title" priority="0" mode="toc-mode-Table_of_Contents">
      <_sfe:TocEntry1_Table_of_Contents>
         <xsl:attribute name="tocentry-indent-class"> x-Table-of-Contents-toc-entry-indent-1</xsl:attribute>
         <xsl:call-template name="maybe-set-id">
            <xsl:with-param name="attrname" select="'tocentry_id'"/>
            <xsl:with-param name="only-if-id-attr" select="'no'"/>
            <xsl:with-param name="generated-id-prefix" select="'styler-id'"/>
            <xsl:with-param name="context-node" select="(.[self::_ufe:*]|..)[last()]"/>
         </xsl:call-template>
         <_sfe:TocTitle_Table_of_Contents>
            <xsl:if test="node()[not(self::_sfe:BeforeOrAfterText)]">
               <_gte:Gentexted-Content-Wrapper>
                  <xsl:apply-templates mode="expand-gentext">
                     <xsl:with-param name="skip-expanded-gentext" select="'yes'"/>
                  </xsl:apply-templates>
               </_gte:Gentexted-Content-Wrapper>
            </xsl:if>
         </_sfe:TocTitle_Table_of_Contents>
         <_sfe:TocPage_Table_of_Contents> </_sfe:TocPage_Table_of_Contents>
      </_sfe:TocEntry1_Table_of_Contents>
   </xsl:template>

<xsl:template match="pgblk/_ufe:spectools-title" priority="5" mode="toc-mode-Table_of_Contents"><!--This title doesn't go into this ToC--></xsl:template>

<xsl:template match="pbfmatr/_ufe:spectools-title" priority="4" mode="toc-mode-Table_of_Contents"><!--This title doesn't go into this ToC--></xsl:template>

<xsl:template match="pwcspblist/_ufe:spectools-title" priority="3" mode="toc-mode-Table_of_Contents"><!--This title doesn't go into this ToC--></xsl:template>

<xsl:template match="page-block//special-tools//_ufe:spectools-title" priority="2" mode="toc-mode-Table_of_Contents">
      <_sfe:TocEntry1_Table_of_Contents>
         <xsl:attribute name="tocentry-indent-class"> x-Table-of-Contents-toc-entry-indent-1</xsl:attribute>
         <xsl:call-template name="maybe-set-id">
            <xsl:with-param name="attrname" select="'tocentry_id'"/>
            <xsl:with-param name="only-if-id-attr" select="'no'"/>
            <xsl:with-param name="generated-id-prefix" select="'styler-id'"/>
            <xsl:with-param name="context-node" select="(.[self::_ufe:*]|..)[last()]"/>
         </xsl:call-template>
         <_sfe:TocTitle_Table_of_Contents>
            <xsl:if test="node()[not(self::_sfe:BeforeOrAfterText)]">
               <_gte:Gentexted-Content-Wrapper>
                  <xsl:apply-templates mode="expand-gentext">
                     <xsl:with-param name="skip-expanded-gentext" select="'yes'"/>
                  </xsl:apply-templates>
               </_gte:Gentexted-Content-Wrapper>
            </xsl:if>
         </_sfe:TocTitle_Table_of_Contents>
         <_sfe:TocPage_Table_of_Contents> </_sfe:TocPage_Table_of_Contents>
      </_sfe:TocEntry1_Table_of_Contents>
   </xsl:template>

<xsl:template match="ata-page-block//special-tools//_ufe:spectools-title" priority="1" mode="toc-mode-Table_of_Contents">
      <_sfe:TocEntry1_Table_of_Contents>
         <xsl:attribute name="tocentry-indent-class"> x-Table-of-Contents-toc-entry-indent-1</xsl:attribute>
         <xsl:call-template name="maybe-set-id">
            <xsl:with-param name="attrname" select="'tocentry_id'"/>
            <xsl:with-param name="only-if-id-attr" select="'no'"/>
            <xsl:with-param name="generated-id-prefix" select="'styler-id'"/>
            <xsl:with-param name="context-node" select="(.[self::_ufe:*]|..)[last()]"/>
         </xsl:call-template>
         <_sfe:TocTitle_Table_of_Contents>
            <xsl:if test="node()[not(self::_sfe:BeforeOrAfterText)]">
               <_gte:Gentexted-Content-Wrapper>
                  <xsl:apply-templates mode="expand-gentext">
                     <xsl:with-param name="skip-expanded-gentext" select="'yes'"/>
                  </xsl:apply-templates>
               </_gte:Gentexted-Content-Wrapper>
            </xsl:if>
         </_sfe:TocTitle_Table_of_Contents>
         <_sfe:TocPage_Table_of_Contents> </_sfe:TocPage_Table_of_Contents>
      </_sfe:TocEntry1_Table_of_Contents>
   </xsl:template>

<xsl:template match="_ufe:spectools-title" priority="0" mode="toc-mode-Table_of_Contents"><!--This title doesn't go into this ToC--></xsl:template>

<xsl:template match="subpara/subpara/subpara/subpara/subpara/title" priority="72" mode="toc-mode-Table_of_Contents"><!--This title doesn't go into this ToC--></xsl:template>

<xsl:template match="subpara/subpara/subpara/subpara/title" priority="71" mode="toc-mode-Table_of_Contents"><!--This title doesn't go into this ToC--></xsl:template>

<xsl:template match="subpara/subpara/subpara/title" priority="70" mode="toc-mode-Table_of_Contents"><!--This title doesn't go into this ToC--></xsl:template>

<xsl:template match="book[contains(@doctype, 'epc')]/frontmatter//graphic/title" priority="69" mode="toc-mode-Table_of_Contents"><!--This title doesn't go into this ToC--></xsl:template>

<xsl:template match="ata-page-block//task/graphic/title" priority="67" mode="toc-mode-Table_of_Contents"><!--This title doesn't go into this ToC--></xsl:template>

<xsl:template match="page-block//task/graphic/title" priority="66" mode="toc-mode-Table_of_Contents"><!--This title doesn't go into this ToC--></xsl:template>

<xsl:template match="page-block[@pb-name='glossary']/module/title" mode="toc-mode-Table_of_Contents" priority="61"><!--This title doesn't go into this ToC--></xsl:template>

<xsl:template match="page-block[@pb-name='supp_list']/module/title" mode="toc-mode-Table_of_Contents" priority="60"><!--This title doesn't go into this ToC--></xsl:template>

<xsl:template match="mm-fits/subpara/title" priority="62" mode="toc-mode-Table_of_Contents"><!--This title doesn't go into this ToC--></xsl:template>

<xsl:template match="prcitem4/prcitem/title" mode="toc-mode-Table_of_Contents" priority="60"><!--This title doesn't go into this ToC--></xsl:template>

<xsl:template match="prcitem3/prcitem/title" priority="60" mode="toc-mode-Table_of_Contents"><!--This title doesn't go into this ToC--></xsl:template>

<xsl:template match="prcitem2/prcitem/title" priority="59" mode="toc-mode-Table_of_Contents"><!--This title doesn't go into this ToC--></xsl:template>

<xsl:template match="prcitem1/prcitem/title" mode="toc-mode-Table_of_Contents" priority="55">
      <_sfe:TocEntry1_Table_of_Contents>
         <xsl:attribute name="tocentry-indent-class">x-Table-of-Contents-toc-entry-indent-1</xsl:attribute>
         <xsl:call-template name="maybe-set-id">
            <xsl:with-param name="attrname" select="'tocentry_id'"/>
            <xsl:with-param name="only-if-id-attr" select="'no'"/>
            <xsl:with-param name="generated-id-prefix" select="'styler-id'"/>
            <xsl:with-param name="context-node" select="(.[self::_ufe:*]|..)[last()]"/>
         </xsl:call-template>
         <_sfe:TocTitle_Table_of_Contents>
            <xsl:if test="node()[not(self::_sfe:BeforeOrAfterText)]">
               <_gte:Gentexted-Content-Wrapper>
                  <xsl:apply-templates mode="expand-gentext">
                     <xsl:with-param name="skip-expanded-gentext" select="'yes'"/>
                  </xsl:apply-templates>
               </_gte:Gentexted-Content-Wrapper>
            </xsl:if>
         </_sfe:TocTitle_Table_of_Contents>
         <_sfe:TocPage_Table_of_Contents> </_sfe:TocPage_Table_of_Contents>
      </_sfe:TocEntry1_Table_of_Contents>
   </xsl:template>

<xsl:template match="subpara/subpara/title" priority="57" mode="toc-mode-Table_of_Contents"><!--This title doesn't go into this ToC--></xsl:template>

<xsl:template match="task//table/title" priority="51" mode="toc-mode-Table_of_Contents"><!--This title doesn't go into this ToC--></xsl:template>

<xsl:template match="page-block//graphic/title" priority="50" mode="toc-mode-Table_of_Contents"><!--This title doesn't go into this ToC--></xsl:template>

<xsl:template match="ata-page-block//graphic/title" priority="49" mode="toc-mode-Table_of_Contents"><!--This title doesn't go into this ToC--></xsl:template>

<xsl:template match="page-block//mm-fits/title" mode="toc-mode-Table_of_Contents" priority="47"><!--This title doesn't go into this ToC--></xsl:template>

<xsl:template match="ata-page-block//mm-fits/title" mode="toc-mode-Table_of_Contents" priority="46"><!--This title doesn't go into this ToC--></xsl:template>

<xsl:template match="ata-page-block//fits-and-clears/title" priority="46" mode="toc-mode-Table_of_Contents"><!--This title doesn't go into this ToC--></xsl:template>

<xsl:template match="page-block//fits-and-clears/title" priority="45" mode="toc-mode-Table_of_Contents"><!--This title doesn't go into this ToC--></xsl:template>

<xsl:template match="ata-page-block//n-para/title" mode="toc-mode-Table_of_Contents" priority="43">
      <_sfe:TocEntry5_Table_of_Contents>
         <xsl:attribute name="tocentry-indent-class"> x-Table-of-Contents-toc-entry-indent-5</xsl:attribute>
         <xsl:call-template name="maybe-set-id">
            <xsl:with-param name="attrname" select="'tocentry_id'"/>
            <xsl:with-param name="only-if-id-attr" select="'no'"/>
            <xsl:with-param name="generated-id-prefix" select="'styler-id'"/>
            <xsl:with-param name="context-node" select="(.[self::_ufe:*]|..)[last()]"/>
         </xsl:call-template>
         <_sfe:TocLabel_Table_of_Contents>
            <_gte:styler_numbering>
               <xsl:variable name="gte_id">
                  <xsl:choose>
                     <xsl:when test="@_gte:id">
                        <xsl:value-of select="@_gte:id"/>
                     </xsl:when>
                     <xsl:otherwise>
                        <xsl:value-of select="'_g_'"/>
                        <xsl:value-of select="generate-id(.)"/>
                     </xsl:otherwise>
                  </xsl:choose>
               </xsl:variable>
               <xsl:attribute name="gte_id">
                  <xsl:value-of select="$gte_id"/>
               </xsl:attribute>
            </_gte:styler_numbering>
            <xsl:text> </xsl:text>
         </_sfe:TocLabel_Table_of_Contents>
         <_sfe:TocTitle_Table_of_Contents>
            <xsl:if test="node()[not(self::_sfe:BeforeOrAfterText)]">
               <_gte:Gentexted-Content-Wrapper>
                  <xsl:apply-templates mode="expand-gentext">
                     <xsl:with-param name="skip-expanded-gentext" select="'yes'"/>
                  </xsl:apply-templates>
               </_gte:Gentexted-Content-Wrapper>
            </xsl:if>
         </_sfe:TocTitle_Table_of_Contents>
         <_sfe:TocPage_Table_of_Contents> </_sfe:TocPage_Table_of_Contents>
      </_sfe:TocEntry5_Table_of_Contents>
   </xsl:template>

<xsl:template match="page-block//n-para/title" mode="toc-mode-Table_of_Contents" priority="42">
      <_sfe:TocEntry5_Table_of_Contents>
         <xsl:attribute name="tocentry-indent-class"> x-Table-of-Contents-toc-entry-indent-5</xsl:attribute>
         <xsl:call-template name="maybe-set-id">
            <xsl:with-param name="attrname" select="'tocentry_id'"/>
            <xsl:with-param name="only-if-id-attr" select="'no'"/>
            <xsl:with-param name="generated-id-prefix" select="'styler-id'"/>
            <xsl:with-param name="context-node" select="(.[self::_ufe:*]|..)[last()]"/>
         </xsl:call-template>
         <_sfe:TocLabel_Table_of_Contents>
            <_gte:styler_numbering>
               <xsl:variable name="gte_id">
                  <xsl:choose>
                     <xsl:when test="@_gte:id">
                        <xsl:value-of select="@_gte:id"/>
                     </xsl:when>
                     <xsl:otherwise>
                        <xsl:value-of select="'_g_'"/>
                        <xsl:value-of select="generate-id(.)"/>
                     </xsl:otherwise>
                  </xsl:choose>
               </xsl:variable>
               <xsl:attribute name="gte_id">
                  <xsl:value-of select="$gte_id"/>
               </xsl:attribute>
            </_gte:styler_numbering>
            <xsl:text> </xsl:text>
         </_sfe:TocLabel_Table_of_Contents>
         <_sfe:TocTitle_Table_of_Contents>
            <xsl:if test="node()[not(self::_sfe:BeforeOrAfterText)]">
               <_gte:Gentexted-Content-Wrapper>
                  <xsl:apply-templates mode="expand-gentext">
                     <xsl:with-param name="skip-expanded-gentext" select="'yes'"/>
                  </xsl:apply-templates>
               </_gte:Gentexted-Content-Wrapper>
            </xsl:if>
         </_sfe:TocTitle_Table_of_Contents>
         <_sfe:TocPage_Table_of_Contents> </_sfe:TocPage_Table_of_Contents>
      </_sfe:TocEntry5_Table_of_Contents>
   </xsl:template>

<xsl:template match="mfmatr/title" priority="42" mode="toc-mode-Table_of_Contents"><!--This title doesn't go into this ToC--></xsl:template>

<xsl:template match="figure/title" priority="41" mode="toc-mode-Table_of_Contents"><!--This title doesn't go into this ToC--></xsl:template>

<xsl:template match="subpara/title" priority="38" mode="toc-mode-Table_of_Contents"><!--This title doesn't go into this ToC--></xsl:template>

<xsl:template match="procedure/title" priority="37" mode="toc-mode-Table_of_Contents"><!--This title doesn't go into this ToC--></xsl:template>

<xsl:template match="taskproc/title" priority="34" mode="toc-mode-Table_of_Contents"><!--This title doesn't go into this ToC--></xsl:template>

<xsl:template match="nutopt/title" mode="toc-mode-Table_of_Contents" priority="32"><!--This title doesn't go into this ToC--></xsl:template>

<xsl:template match="pwcchapsect-item/title" priority="28" mode="toc-mode-Table_of_Contents"><!--This title doesn't go into this ToC--></xsl:template>

<xsl:template match="tprereq/title" priority="27" mode="toc-mode-Table_of_Contents"><!--This title doesn't go into this ToC--></xsl:template>

<xsl:template match="subtask/title" priority="26" mode="toc-mode-Table_of_Contents"><!--This title doesn't go into this ToC--></xsl:template>

<xsl:template match="fits/title" priority="25" mode="toc-mode-Table_of_Contents">
      <_sfe:TocEntry1_Table_of_Contents>
         <xsl:attribute name="tocentry-indent-class"> x-Table-of-Contents-toc-entry-indent-1</xsl:attribute>
         <xsl:call-template name="maybe-set-id">
            <xsl:with-param name="attrname" select="'tocentry_id'"/>
            <xsl:with-param name="only-if-id-attr" select="'no'"/>
            <xsl:with-param name="generated-id-prefix" select="'styler-id'"/>
            <xsl:with-param name="context-node" select="(.[self::_ufe:*]|..)[last()]"/>
         </xsl:call-template>
         <_sfe:TocTitle_Table_of_Contents>
            <xsl:if test="node()[not(self::_sfe:BeforeOrAfterText)]">
               <_gte:Gentexted-Content-Wrapper>
                  <xsl:apply-templates mode="expand-gentext">
                     <xsl:with-param name="skip-expanded-gentext" select="'yes'"/>
                  </xsl:apply-templates>
               </_gte:Gentexted-Content-Wrapper>
            </xsl:if>
         </_sfe:TocTitle_Table_of_Contents>
         <_sfe:TocPage_Table_of_Contents> </_sfe:TocPage_Table_of_Contents>
      </_sfe:TocEntry1_Table_of_Contents>
   </xsl:template>

<xsl:template match="task/title" mode="toc-mode-Table_of_Contents" priority="24">
      <_sfe:TocEntry1_Table_of_Contents>
         <xsl:attribute name="tocentry-indent-class"> x-Table-of-Contents-toc-entry-indent-1</xsl:attribute>
         <xsl:call-template name="maybe-set-id">
            <xsl:with-param name="attrname" select="'tocentry_id'"/>
            <xsl:with-param name="only-if-id-attr" select="'no'"/>
            <xsl:with-param name="generated-id-prefix" select="'styler-id'"/>
            <xsl:with-param name="context-node" select="(.[self::_ufe:*]|..)[last()]"/>
         </xsl:call-template>
         <_sfe:TocTitle_Table_of_Contents>
            <xsl:if test="node()[not(self::_sfe:BeforeOrAfterText)]">
               <_gte:Gentexted-Content-Wrapper>
                  <xsl:apply-templates mode="expand-gentext">
                     <xsl:with-param name="skip-expanded-gentext" select="'yes'"/>
                  </xsl:apply-templates>
               </_gte:Gentexted-Content-Wrapper>
            </xsl:if>
         </_sfe:TocTitle_Table_of_Contents>
         <_sfe:TocPage_Table_of_Contents> </_sfe:TocPage_Table_of_Contents>
      </_sfe:TocEntry1_Table_of_Contents>
   </xsl:template>

<xsl:template match="howtouse/title" priority="23" mode="toc-mode-Table_of_Contents"><!--This title doesn't go into this ToC--></xsl:template>

<xsl:template match="highlights/title" priority="22" mode="toc-mode-Table_of_Contents">
      <_sfe:TocEntry2_Table_of_Contents>
         <xsl:attribute name="tocentry-indent-class"> x-Table-of-Contents-toc-entry-indent-2</xsl:attribute>
         <xsl:call-template name="maybe-set-id">
            <xsl:with-param name="attrname" select="'tocentry_id'"/>
            <xsl:with-param name="only-if-id-attr" select="'no'"/>
            <xsl:with-param name="generated-id-prefix" select="'styler-id'"/>
            <xsl:with-param name="context-node" select="(.[self::_ufe:*]|..)[last()]"/>
         </xsl:call-template>
         <_sfe:TocTitle_Table_of_Contents>
            <xsl:if test="node()[not(self::_sfe:BeforeOrAfterText)]">
               <_gte:Gentexted-Content-Wrapper>
                  <xsl:apply-templates mode="expand-gentext">
                     <xsl:with-param name="skip-expanded-gentext" select="'yes'"/>
                  </xsl:apply-templates>
               </_gte:Gentexted-Content-Wrapper>
            </xsl:if>
         </_sfe:TocTitle_Table_of_Contents>
         <_sfe:TocPage_Table_of_Contents> </_sfe:TocPage_Table_of_Contents>
      </_sfe:TocEntry2_Table_of_Contents>
   </xsl:template>

<xsl:template match="lot-item/title" priority="20" mode="toc-mode-Table_of_Contents"><!--This title doesn't go into this ToC--></xsl:template>

<xsl:template match="lot/title" priority="19" mode="toc-mode-Table_of_Contents">
      <_sfe:TocEntry5_Table_of_Contents>
         <xsl:attribute name="tocentry-indent-class"> x-Table-of-Contents-toc-entry-indent-5</xsl:attribute>
         <xsl:call-template name="maybe-set-id">
            <xsl:with-param name="attrname" select="'tocentry_id'"/>
            <xsl:with-param name="only-if-id-attr" select="'no'"/>
            <xsl:with-param name="generated-id-prefix" select="'styler-id'"/>
            <xsl:with-param name="context-node" select="(.[self::_ufe:*]|..)[last()]"/>
         </xsl:call-template>
         <_sfe:TocLabel_Table_of_Contents/>
         <_sfe:TocTitle_Table_of_Contents>
            <xsl:if test="node()[not(self::_sfe:BeforeOrAfterText)]">
               <_gte:Gentexted-Content-Wrapper>
                  <xsl:apply-templates mode="expand-gentext">
                     <xsl:with-param name="skip-expanded-gentext" select="'yes'"/>
                  </xsl:apply-templates>
               </_gte:Gentexted-Content-Wrapper>
            </xsl:if>
         </_sfe:TocTitle_Table_of_Contents>
         <_sfe:TocPage_Table_of_Contents> </_sfe:TocPage_Table_of_Contents>
      </_sfe:TocEntry5_Table_of_Contents>
   </xsl:template>

<xsl:template match="table//procedure//title" priority="17" mode="toc-mode-Table_of_Contents"><!--This title doesn't go into this ToC--></xsl:template>

<xsl:template match="torque-and-stretch/title" priority="16" mode="toc-mode-Table_of_Contents"><!--This title doesn't go into this ToC--></xsl:template>

<xsl:template match="spec-tool-table/title" priority="15" mode="toc-mode-Table_of_Contents"><!--This title doesn't go into this ToC--></xsl:template>

<xsl:template match="subject/title" priority="13" mode="toc-mode-Table_of_Contents">
      <_sfe:TocEntry3_Table_of_Contents>
         <xsl:attribute name="tocentry-indent-class">x-Table-of-Contents-toc-entry-indent-3</xsl:attribute>
         <xsl:call-template name="maybe-set-id">
            <xsl:with-param name="attrname" select="'tocentry_id'"/>
            <xsl:with-param name="only-if-id-attr" select="'no'"/>
            <xsl:with-param name="generated-id-prefix" select="'styler-id'"/>
            <xsl:with-param name="context-node" select="(.[self::_ufe:*]|..)[last()]"/>
         </xsl:call-template>
         <_sfe:TocTitle_Table_of_Contents>
            <xsl:if test="node()[not(self::_sfe:BeforeOrAfterText)]">
               <_gte:Gentexted-Content-Wrapper>
                  <xsl:apply-templates mode="expand-gentext">
                     <xsl:with-param name="skip-expanded-gentext" select="'yes'"/>
                  </xsl:apply-templates>
               </_gte:Gentexted-Content-Wrapper>
            </xsl:if>
         </_sfe:TocTitle_Table_of_Contents>
         <_sfe:TocPage_Table_of_Contents> </_sfe:TocPage_Table_of_Contents>
      </_sfe:TocEntry3_Table_of_Contents>
   </xsl:template>

<xsl:template match="section/title" priority="12" mode="toc-mode-Table_of_Contents">
      <_sfe:TocEntry2_Table_of_Contents>
         <xsl:attribute name="tocentry-indent-class">x-Table-of-Contents-toc-entry-indent-2</xsl:attribute>
         <xsl:call-template name="maybe-set-id">
            <xsl:with-param name="attrname" select="'tocentry_id'"/>
            <xsl:with-param name="only-if-id-attr" select="'no'"/>
            <xsl:with-param name="generated-id-prefix" select="'styler-id'"/>
            <xsl:with-param name="context-node" select="(.[self::_ufe:*]|..)[last()]"/>
         </xsl:call-template>
         <_sfe:TocTitle_Table_of_Contents>
            <xsl:if test="node()[not(self::_sfe:BeforeOrAfterText)]">
               <_gte:Gentexted-Content-Wrapper>
                  <xsl:apply-templates mode="expand-gentext">
                     <xsl:with-param name="skip-expanded-gentext" select="'yes'"/>
                  </xsl:apply-templates>
               </_gte:Gentexted-Content-Wrapper>
            </xsl:if>
         </_sfe:TocTitle_Table_of_Contents>
         <_sfe:TocPage_Table_of_Contents> </_sfe:TocPage_Table_of_Contents>
      </_sfe:TocEntry2_Table_of_Contents>
   </xsl:template>

<xsl:template match="page-block/title" priority="11" mode="toc-mode-Table_of_Contents"><!--This title doesn't go into this ToC--></xsl:template>

<xsl:template match="frontmatter/title" priority="8" mode="toc-mode-Table_of_Contents">
      <_sfe:TocEntry1_Table_of_Contents>
         <xsl:attribute name="tocentry-indent-class">x-Table-of-Contents-toc-entry-indent-1</xsl:attribute>
         <xsl:call-template name="maybe-set-id">
            <xsl:with-param name="attrname" select="'tocentry_id'"/>
            <xsl:with-param name="only-if-id-attr" select="'no'"/>
            <xsl:with-param name="generated-id-prefix" select="'styler-id'"/>
            <xsl:with-param name="context-node" select="(.[self::_ufe:*]|..)[last()]"/>
         </xsl:call-template>
         <_sfe:TocTitle_Table_of_Contents>
            <xsl:if test="node()[not(self::_sfe:BeforeOrAfterText)]">
               <_gte:Gentexted-Content-Wrapper>
                  <xsl:apply-templates mode="expand-gentext">
                     <xsl:with-param name="skip-expanded-gentext" select="'yes'"/>
                  </xsl:apply-templates>
               </_gte:Gentexted-Content-Wrapper>
            </xsl:if>
         </_sfe:TocTitle_Table_of_Contents>
         <_sfe:TocPage_Table_of_Contents> </_sfe:TocPage_Table_of_Contents>
      </_sfe:TocEntry1_Table_of_Contents>
   </xsl:template>

<xsl:template match="table[@display='expand']/title" priority="6" mode="toc-mode-Table_of_Contents"><!--This title doesn't go into this ToC--></xsl:template>

<xsl:template match="table/title" priority="5" mode="toc-mode-Table_of_Contents"><!--This title doesn't go into this ToC--></xsl:template>

<xsl:template match="chapter/title" priority="4" mode="toc-mode-Table_of_Contents">
      <_sfe:TocEntry1_Table_of_Contents>
         <xsl:attribute name="tocentry-indent-class"> x-Table-of-Contents-toc-entry-indent-1</xsl:attribute>
         <xsl:call-template name="maybe-set-id">
            <xsl:with-param name="attrname" select="'tocentry_id'"/>
            <xsl:with-param name="only-if-id-attr" select="'no'"/>
            <xsl:with-param name="generated-id-prefix" select="'styler-id'"/>
            <xsl:with-param name="context-node" select="(.[self::_ufe:*]|..)[last()]"/>
         </xsl:call-template>
         <_sfe:TocTitle_Table_of_Contents>
            <xsl:if test="node()[not(self::_sfe:BeforeOrAfterText)]">
               <_gte:Gentexted-Content-Wrapper>
                  <xsl:apply-templates mode="expand-gentext">
                     <xsl:with-param name="skip-expanded-gentext" select="'yes'"/>
                  </xsl:apply-templates>
               </_gte:Gentexted-Content-Wrapper>
            </xsl:if>
         </_sfe:TocTitle_Table_of_Contents>
         <_sfe:TocPage_Table_of_Contents> </_sfe:TocPage_Table_of_Contents>
      </_sfe:TocEntry1_Table_of_Contents>
   </xsl:template>

<xsl:template match="book/title" priority="3" mode="toc-mode-Table_of_Contents"><!--This title doesn't go into this ToC--></xsl:template>

<xsl:template match="ata-page-block/title" priority="2" mode="toc-mode-Table_of_Contents"><!--This title doesn't go into this ToC--></xsl:template>

<xsl:template match="title-page/title" priority="1" mode="toc-mode-Table_of_Contents"><!--This title doesn't go into this ToC--></xsl:template>

<xsl:template match="title" priority="0" mode="toc-mode-Table_of_Contents"><!--This title doesn't go into this ToC--></xsl:template>

</xsl:stylesheet>
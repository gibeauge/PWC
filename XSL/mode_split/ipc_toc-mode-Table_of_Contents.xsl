<?xml version="1.0" encoding="UTF-8"?><xsl:stylesheet xmlns:simg="java:net.sf.docbook.saxon.ImageIntrinsics" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:ximg="xaln://com.nwalsh.xalan.ImageIntrinsics" xmlns="http://www.w3.org/1999/xhtml" xmlns:exslt="http://exslt.org/common" xmlns:_acl="java:com.arbortext.epic.Acl" xmlns:msxsl="urn:schemas-microsoft-com:xslt" xmlns:_="http://www.pwc.ca/namespace/doctypes/emipc" xmlns:_dtd="http://www.arbortext.com/namespace/Styler/UserElements" xmlns:atidlm="http://www.arbortext.com/namespace/atidlm" xmlns:_2="http://www.pwc.ca/namespace/doctypes/jmtosmigrate" xmlns:ch="http://www.arbortext.com/namespace/chunker" xmlns:saxon="http://saxon.sf.net/" xmlns:_5="http://www.pwc.ca/namespace/doctypes/ipc" xmlns:_gte="http://www.arbortext.com/namespace/Styler/GeneratedTextElements" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:_sfe="http://www.arbortext.com/namespace/Styler/StylerFormattingElements" xmlns:_js="java:com.arbortext.epic.internal.js.JavaScript" xmlns:_3="http://www.pwc.ca/namespace/doctypes/migrate" xmlns:_ufe="http://www.arbortext.com/namespace/Styler/UserFormattingElements" version="1.0" exclude-result-prefixes="_ atidlm xml _2 ch saxon _5 xsi _js _3 #default exslt msxsl _dtd _ufe _sfe _gte simg ximg _acl">


<xsl:template match="pgblk/_ufe:intro-title" priority="2" mode="toc-mode-Table_of_Contents"><!--This title doesn't go into this ToC--></xsl:template>

<xsl:template match="pbfmatr/_ufe:intro-title" priority="1" mode="toc-mode-Table_of_Contents"><!--This title doesn't go into this ToC--></xsl:template>

<xsl:template match="_ufe:intro-title" priority="0" mode="toc-mode-Table_of_Contents">
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
         <_sfe:TocPage_Table_of_Contents>&#xa0;</_sfe:TocPage_Table_of_Contents>
      </_sfe:TocEntry1_Table_of_Contents>
   </xsl:template>

<xsl:template match="pgblk/_ufe:num-index-title" priority="3" mode="toc-mode-Table_of_Contents"><!--This title doesn't go into this ToC--></xsl:template>

<xsl:template match="pbfmatr/_ufe:num-index-title" priority="2" mode="toc-mode-Table_of_Contents"><!--This title doesn't go into this ToC--></xsl:template>

<xsl:template match="pwcspblist/_ufe:num-index-title" priority="1" mode="toc-mode-Table_of_Contents"><!--This title doesn't go into this ToC--></xsl:template>

<xsl:template match="_ufe:num-index-title" priority="0" mode="toc-mode-Table_of_Contents">
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
         <_sfe:TocPage_Table_of_Contents>&#xa0;</_sfe:TocPage_Table_of_Contents>
      </_sfe:TocEntry1_Table_of_Contents>
   </xsl:template>

<xsl:template match="pgblk/_ufe:pdlist-title" priority="1" mode="toc-mode-Table_of_Contents"><!--This title doesn't go into this ToC--></xsl:template>

<xsl:template match="_ufe:pdlist-title" priority="0" mode="toc-mode-Table_of_Contents">
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
         <_sfe:TocPage_Table_of_Contents>&#xa0;</_sfe:TocPage_Table_of_Contents>
      </_sfe:TocEntry1_Table_of_Contents>
   </xsl:template>

<xsl:template match="pgblk/_ufe:sblist-title" priority="2" mode="toc-mode-Table_of_Contents"><!--This title doesn't go into this ToC--></xsl:template>

<xsl:template match="pbfmatr/_ufe:sblist-title" priority="1" mode="toc-mode-Table_of_Contents"><!--This title doesn't go into this ToC--></xsl:template>

<xsl:template match="_ufe:sblist-title" priority="0" mode="toc-mode-Table_of_Contents">
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
         <_sfe:TocPage_Table_of_Contents>&#xa0;</_sfe:TocPage_Table_of_Contents>
      </_sfe:TocEntry1_Table_of_Contents>
   </xsl:template>

<xsl:template match="pgblk/_ufe:spblist-title" priority="2" mode="toc-mode-Table_of_Contents"><!--This title doesn't go into this ToC--></xsl:template>

<xsl:template match="pbfmatr/_ufe:spblist-title" priority="1" mode="toc-mode-Table_of_Contents"><!--This title doesn't go into this ToC--></xsl:template>

<xsl:template match="_ufe:spblist-title" priority="0" mode="toc-mode-Table_of_Contents">
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
         <_sfe:TocPage_Table_of_Contents>&#xa0;</_sfe:TocPage_Table_of_Contents>
      </_sfe:TocEntry1_Table_of_Contents>
   </xsl:template>

<xsl:template match="pgblk/_ufe:temp-rev-title" priority="2" mode="toc-mode-Table_of_Contents"><!--This title doesn't go into this ToC--></xsl:template>

<xsl:template match="pbfmatr/_ufe:temp-rev-title" priority="1" mode="toc-mode-Table_of_Contents"><!--This title doesn't go into this ToC--></xsl:template>

<xsl:template match="_ufe:temp-rev-title" priority="0" mode="toc-mode-Table_of_Contents">
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
         <_sfe:TocPage_Table_of_Contents>&#xa0;</_sfe:TocPage_Table_of_Contents>
      </_sfe:TocEntry1_Table_of_Contents>
   </xsl:template>

<xsl:template match="book[contains(@doctype, 'ipc')]/frontmatter//figure/title" priority="68" mode="toc-mode-Table_of_Contents">
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
         <_sfe:TocPage_Table_of_Contents>&#xa0;</_sfe:TocPage_Table_of_Contents>
      </_sfe:TocEntry1_Table_of_Contents>
   </xsl:template>

<xsl:template match="module[@module-name='Airworthiness_Limits']/pgblk/title" priority="65" mode="toc-mode-Table_of_Contents"><!--This title doesn't go into this ToC--></xsl:template>

<xsl:template match="page-block[@pb-name='ni']//mfmatr/title" priority="56" mode="toc-mode-Table_of_Contents"><!--This title doesn't go into this ToC--></xsl:template>

<xsl:template match="page-block[@pb-name='record-of-revisions']//n-para/title" priority="55" mode="toc-mode-Table_of_Contents">
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
         <_sfe:TocPage_Table_of_Contents>&#xa0;</_sfe:TocPage_Table_of_Contents>
      </_sfe:TocEntry1_Table_of_Contents>
   </xsl:template>

<xsl:template match="book[contains(@doctype, 'epc')]//figure/title" priority="54" mode="toc-mode-Table_of_Contents"><!--This title doesn't go into this ToC--></xsl:template>

<xsl:template match="book[contains(@doctype, 'epc')]//graphic/title" priority="53" mode="toc-mode-Table_of_Contents"><!--This title doesn't go into this ToC--></xsl:template>

<xsl:template match="book[contains(@doctype, 'ipc')]//figure/title" priority="52" mode="toc-mode-Table_of_Contents">
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
         <_sfe:TocPage_Table_of_Contents>&#xa0;</_sfe:TocPage_Table_of_Contents>
      </_sfe:TocEntry1_Table_of_Contents>
   </xsl:template>

<xsl:template match="pbfmatr/title" priority="40" mode="toc-mode-Table_of_Contents"><!--This title doesn't go into this ToC--></xsl:template>

<xsl:template match="pwcpbfront/title" priority="39" mode="toc-mode-Table_of_Contents"><!--This title doesn't go into this ToC--></xsl:template>

<xsl:template match="intro/title" priority="36" mode="toc-mode-Table_of_Contents"><!--This title doesn't go into this ToC--></xsl:template>

<xsl:template match="pwcspblist/title" priority="35" mode="toc-mode-Table_of_Contents"><!--This title doesn't go into this ToC--></xsl:template>

<xsl:template match="sblist/title" priority="32" mode="toc-mode-Table_of_Contents"><!--This title doesn't go into this ToC--></xsl:template>

<xsl:template match="pwcni/title" priority="31" mode="toc-mode-Table_of_Contents"><!--This title doesn't go into this ToC--></xsl:template>

<xsl:template match="vendlist/title" priority="30" mode="toc-mode-Table_of_Contents"><!--This title doesn't go into this ToC--></xsl:template>

<xsl:template match="pgblk/title" priority="29" mode="toc-mode-Table_of_Contents"><!--This title doesn't go into this ToC--></xsl:template>

<xsl:template match="lof-item/title" priority="21" mode="toc-mode-Table_of_Contents"><!--This title doesn't go into this ToC--></xsl:template>

<xsl:template match="lof/title" priority="18" mode="toc-mode-Table_of_Contents"><!--This title doesn't go into this ToC--></xsl:template>

<xsl:template match="spb-list/title" priority="14" mode="toc-mode-Table_of_Contents">
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
         <_sfe:TocPage_Table_of_Contents>&#xa0;</_sfe:TocPage_Table_of_Contents>
      </_sfe:TocEntry1_Table_of_Contents>
   </xsl:template>

<xsl:template match="service-bull-list/title" priority="10" mode="toc-mode-Table_of_Contents">
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
         <_sfe:TocPage_Table_of_Contents>&#xa0;</_sfe:TocPage_Table_of_Contents>
      </_sfe:TocEntry1_Table_of_Contents>
   </xsl:template>

<xsl:template match="module/title" priority="9" mode="toc-mode-Table_of_Contents">
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
         <_sfe:TocPage_Table_of_Contents>&#xa0;</_sfe:TocPage_Table_of_Contents>
      </_sfe:TocEntry1_Table_of_Contents>
   </xsl:template>

<xsl:template match="num-index/title" priority="7" mode="toc-mode-Table_of_Contents">
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
         <_sfe:TocPage_Table_of_Contents>&#xa0;</_sfe:TocPage_Table_of_Contents>
      </_sfe:TocEntry1_Table_of_Contents>
   </xsl:template>

</xsl:stylesheet>
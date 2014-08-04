<?xml version="1.0" encoding="UTF-8"?>

<xsl:stylesheet 
  xmlns:simg="java:net.sf.docbook.saxon.ImageIntrinsics" 
  xmlns:xsl="http://www.w3.org/1999/XSL/Transform" 
  xmlns:ximg="xaln://com.nwalsh.xalan.ImageIntrinsics" 
  xmlns="http://www.w3.org/1999/xhtml" 
  xmlns:exslt="http://exslt.org/common" 
  xmlns:_acl="java:com.arbortext.epic.Acl" 
  xmlns:msxsl="urn:schemas-microsoft-com:xslt" 
  xmlns:_="http://www.pwc.ca/namespace/doctypes/emipc" 
  xmlns:_dtd="http://www.arbortext.com/namespace/Styler/UserElements" 
  xmlns:atidlm="http://www.arbortext.com/namespace/atidlm" 
  xmlns:_2="http://www.pwc.ca/namespace/doctypes/jmtosmigrate" 
  xmlns:ch="http://www.arbortext.com/namespace/chunker" 
  xmlns:saxon="http://saxon.sf.net/" 
  xmlns:_5="http://www.pwc.ca/namespace/doctypes/ipc" 
  xmlns:_gte="http://www.arbortext.com/namespace/Styler/GeneratedTextElements" 
  xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" 
  xmlns:_sfe="http://www.arbortext.com/namespace/Styler/StylerFormattingElements" 
  xmlns:_js="java:com.arbortext.epic.internal.js.JavaScript" 
  xmlns:_3="http://www.pwc.ca/namespace/doctypes/migrate" 
  xmlns:_ufe="http://www.arbortext.com/namespace/Styler/UserFormattingElements" 
  version="1.0" 
  exclude-result-prefixes="_ atidlm xml _2 ch saxon _5 xsi _js _3 #default exslt msxsl _dtd _ufe _sfe _gte simg ximg _acl">

<xsl:template match="_gte:deferredCrossReference2" mode="expand-gentext" priority="5">
  <xsl:variable name="refed-id" select="@refed-id"/>
  <xsl:variable name="child-title-node" select="(//*[@_gte:id=$refed-id]/*[@_gte:unhidden-title]|
                                                 //*[@_gte:id=$refed-id]/_sfe:BeforeOrAfterText/*[@_gte:unhidden-title])[1]"/>
  <xsl:choose>
     <xsl:when test="@xrefStyle='Label_Number'">
        <xsl:apply-templates select="$child-title-node" mode="styler_xref-Label_Number"/>
     </xsl:when>
     <xsl:when test="@xrefStyle='Label_Number_Text'">
        <xsl:apply-templates select="$child-title-node" mode="styler_xref-Label_Number_Text"/>
     </xsl:when>
     <xsl:when test="@xrefStyle='Label_Number_Text_Page'">
        <xsl:apply-templates select="$child-title-node" mode="styler_xref-Label_Number_Text_Page"/>
     </xsl:when>
     <xsl:when test="@xrefStyle='Number'">
        <xsl:apply-templates select="$child-title-node" mode="styler_xref-Number"/>
     </xsl:when>
     <xsl:when test="@xrefStyle='Number_Text'">
        <xsl:apply-templates select="$child-title-node" mode="styler_xref-Number_Text"/>
     </xsl:when>
     <xsl:when test="@xrefStyle='Page'">
        <xsl:apply-templates select="$child-title-node" mode="styler_xref-Page"/>
     </xsl:when>
     <xsl:when test="@xrefStyle='Text'">
        <xsl:apply-templates select="$child-title-node" mode="styler_xref-Text"/>
     </xsl:when>
     <xsl:otherwise/>
  </xsl:choose>
</xsl:template>

<xsl:template name="t-styler-numbering">
  <_gte:styler_numbering gte_id="{@_gte:id}"/>
</xsl:template>

<xsl:template name="t-styler-numbering-no-qmark">
  <_gte:styler_numbering gte_id="{@_gte:id}" do-qmark="no"/>
</xsl:template>

<xsl:template name="t-crossref-title">
  <_sfe:CrossReferenceTitle>
     <xsl:if test="node()[not(self::_sfe:BeforeOrAfterText)]">
        <_gte:Gentexted-Content-Wrapper>
           <xsl:apply-templates mode="expand-gentext">
              <xsl:with-param name="skip-expanded-gentext" select="'yes'"/>
           </xsl:apply-templates>
        </_gte:Gentexted-Content-Wrapper>
     </xsl:if>
  </_sfe:CrossReferenceTitle>
</xsl:template>

<xsl:template match="*" mode="styler_xref-Label_Number">
  <xsl:apply-templates select="." mode="styler-LabelAndNumberMarker"/>
</xsl:template>

<xsl:template match="*" mode="styler_xref-Label_Number_Text">
  <xsl:apply-templates select="." mode="styler-LabelAndNumberMarker"/>
  <xsl:text> </xsl:text>
  <xsl:call-template name="t-crossref-title"/>
</xsl:template>

<xsl:template match="*" mode="styler_xref-Label_Number_Text_Page">
  <xsl:apply-templates select="." mode="styler_xref-Label_Number_Text"/>
  <xsl:text>, page </xsl:text>
</xsl:template>

<xsl:template match="*" mode="styler_xref-Number">
  <xsl:call-template name="t-styler-numbering-no-qmark"/>
</xsl:template>

<xsl:template match="*" mode="styler_xref-Number_Text">
  <xsl:call-template name="t-styler-numbering-no-qmark"/>
  <xsl:text> </xsl:text>
  <xsl:call-template name="t-crossref-title"/>
</xsl:template>

<xsl:template match="*" mode="styler_xref-Page">
</xsl:template>

<xsl:template match="*" mode="styler_xref-Text">
  <xsl:call-template name="t-crossref-title"/>
</xsl:template>
   
<xsl:template match="_gte:styler_numbering" mode="expand-numbering">
  <xsl:param name="do-qmark">
     <xsl:choose>
        <xsl:when test="@do-qmark">
           <xsl:value-of select="@do-qmark"/>
        </xsl:when>
        <xsl:otherwise>yes</xsl:otherwise>
     </xsl:choose>
  </xsl:param>
  <xsl:variable name="gte_id" select="@gte_id"/>
  <xsl:apply-templates mode="styler_numbering" select="//*[@_gte:id=$gte_id][not(self::_gte:FootnoteBody[not(self::*[not(ancestor::_sfe:BeforeOrAfterText)])])]">
     <xsl:with-param name="do-qmark" select="$do-qmark"/>
  </xsl:apply-templates>
</xsl:template>

</xsl:stylesheet>
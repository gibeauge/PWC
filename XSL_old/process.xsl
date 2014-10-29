<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:simg="java:net.sf.docbook.saxon.ImageIntrinsics"
   xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
   xmlns:ximg="xaln://com.nwalsh.xalan.ImageIntrinsics" xmlns="http://www.w3.org/1999/xhtml"
   xmlns:exslt="http://exslt.org/common" xmlns:_acl="java:com.arbortext.epic.Acl"
   xmlns:msxsl="urn:schemas-microsoft-com:xslt" xmlns:_="http://www.pwc.ca/namespace/doctypes/emipc"
   xmlns:_dtd="http://www.arbortext.com/namespace/Styler/UserElements"
   xmlns:atidlm="http://www.arbortext.com/namespace/atidlm"
   xmlns:_2="http://www.pwc.ca/namespace/doctypes/jmtosmigrate"
   xmlns:ch="http://www.arbortext.com/namespace/chunker" xmlns:saxon="http://saxon.sf.net/"
   xmlns:_5="http://www.pwc.ca/namespace/doctypes/ipc"
   xmlns:_gte="http://www.arbortext.com/namespace/Styler/GeneratedTextElements"
   xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
   xmlns:_sfe="http://www.arbortext.com/namespace/Styler/StylerFormattingElements"
   xmlns:_js="java:com.arbortext.epic.internal.js.JavaScript"
   xmlns:_3="http://www.pwc.ca/namespace/doctypes/migrate"
   xmlns:_ufe="http://www.arbortext.com/namespace/Styler/UserFormattingElements" version="1.0"
   exclude-result-prefixes="_ atidlm xml _2 ch saxon _5 xsi _js _3 #default exslt msxsl _dtd _ufe _sfe _gte simg ximg _acl">

   <xsl:variable name="generator-product-name">Arbortext Editor avec Styler</xsl:variable>
   <xsl:variable name="generator-version-number">6.0 M011</xsl:variable>
   <xsl:variable name="generator-version-date">June 01, 2012</xsl:variable>
   <xsl:variable name="generator-version-build">R60M011-153</xsl:variable>
 
   <!-- We try to set a default for graphics-path, but we expect this parameter to be set by the calling code -->
   <xsl:param name="graphics-path">
      <xsl:call-template name="substring-before-last">
         <xsl:with-param name="str">
            <xsl:call-template name="substring-before-last">
               <xsl:with-param name="str" select="$external-css-filename"/>
               <xsl:with-param name="delim" select="'/'"/>
            </xsl:call-template>
         </xsl:with-param>
         <xsl:with-param name="delim" select="'/'"/>
      </xsl:call-template>
      <xsl:text>/graphics</xsl:text>
   </xsl:param>
   <xsl:param name="available-graphic-getwidth-extension">
      <xsl:choose>
         <xsl:when test="$graphics-path=''">none</xsl:when>
         <xsl:when test="function-available('simg:new') and function-available('simg:properties')"
            >simg:properties</xsl:when>
         <xsl:when test="function-available('simg:getWidth')">simg:getWidth</xsl:when>
         <xsl:when test="function-available('ximg:getWidth')">ximg:getWidth</xsl:when>
         <xsl:otherwise>none</xsl:otherwise>
      </xsl:choose>
   </xsl:param>
   <xsl:param name="available-graphic-getdepth-extension">
      <xsl:choose>
         <xsl:when test="$graphics-path=''">none</xsl:when>
         <xsl:when test="function-available('simg:new') and function-available('simg:properties')"
            >simg:properties</xsl:when>
         <xsl:when test="function-available('simg:getDepth')">simg:getDepth</xsl:when>
         <xsl:when test="function-available('ximg:getDepth')">ximg:getDepth</xsl:when>
         <xsl:otherwise>none</xsl:otherwise>
      </xsl:choose>
   </xsl:param>

   <xsl:param name="max-expansion-pass-count" 				select="number(5)"/>
   <xsl:param name="skip-post-gentext-pass" 						select="'no'"/>
   <xsl:param name="gte-namespace-uri"  							select="'http://www.arbortext.com/namespace/Styler/GeneratedTextElements'"/>
   <xsl:param name="skip-remove-xhtml-namespace-pass" 	select="'no'"/>
   
   <xsl:param name="external-css-filename" 						select="''"/>
   <xsl:param name="relative-external-css-base-filename"     select="'css/epc_pw600_pw617fe_3072164_PROC'"/>

   <xsl:template match="/">
		<xsl:variable name="tree1">
			<xsl:apply-templates select="/" mode="initial-pass-mode"/>
		</xsl:variable>
		<xsl:variable name="tree2">
			<xsl:call-template name="t-expand-gentext">
				<xsl:with-param name="document-tree">
					<xsl:apply-templates select="exslt:node-set($tree1)" mode="expand-gentext"/>
				</xsl:with-param>
				<xsl:with-param name="expansion-pass-count" select="number(1)"/>
			 </xsl:call-template>
		</xsl:variable>
		<xsl:variable name="tree3">
			<xsl:apply-templates select="exslt:node-set($tree2)" mode="set-countas"/>
		</xsl:variable>
		<xsl:variable name="tree4">
			<xsl:apply-templates select="exslt:node-set($tree3)" mode="expand-numbering"/>
		</xsl:variable>
		<xsl:variable name="tree5">
			<xsl:apply-templates select="exslt:node-set($tree4)" mode="post-gentext-expansion"/>
		</xsl:variable>
		<xsl:variable name="tree6">
			<xsl:apply-templates select="exslt:node-set($tree5)" mode="remove-xhtml-namespace"/>
		</xsl:variable>
		<xsl:copy-of select="$tree6"/>
   </xsl:template>
   
   <!-- INITIAL PASS MODE (IDS AND CHUNKS) -->
   
    <xsl:template match="/*" mode="initial-pass-mode" priority="999">
      <xsl:copy>
         <xsl:call-template name="maybe-set-gte-id"/>
         <xsl:apply-templates select="@*" mode="initial-pass-mode"/>
         <xsl:apply-templates select="node()" mode="initial-pass-mode"/>
      </xsl:copy>
   </xsl:template>
  
	<xsl:template match="*" mode="initial-pass-mode" priority="1">
		<xsl:copy>
			<xsl:call-template name="maybe-set-gte-id"/>
			<xsl:apply-templates select="@*|node()" mode="initial-pass-mode"/>
		</xsl:copy>
	</xsl:template>
  
   <xsl:template match="@*|node()" mode="initial-pass-mode">
      <xsl:copy>
         <xsl:apply-templates select="@*|node()" mode="initial-pass-mode"/>
      </xsl:copy>
   </xsl:template>
   
   <!-- EXPAND GENTEXT MODE -->
   
   <xsl:template name="t-expand-gentext">
		<xsl:param name="document-tree"/>
		<xsl:param name="expansion-pass-count"/>
		
		<xsl:choose>
		<xsl:when test="number($expansion-pass-count) &lt; number($max-expansion-pass-count)">
			<xsl:call-template name="t-expand-gentext">
				<xsl:with-param name="document-tree">
					<xsl:apply-templates select="exslt:node-set($document-tree)" mode="expand-gentext"/>
				</xsl:with-param>
				<xsl:with-param name="expansion-pass-count" select="number($expansion-pass-count) + 1"/>
			 </xsl:call-template>
		</xsl:when>
		<xsl:otherwise>
			<xsl:copy-of select="$document-tree"/>
		</xsl:otherwise>
		</xsl:choose>
   </xsl:template>
   
   <xsl:template match="@*|node()" mode="expand-gentext">
      <xsl:copy>
         <xsl:apply-templates select="@*|node()" mode="expand-gentext"/>
      </xsl:copy>
   </xsl:template>
   
   <!-- COUNT AS MODE -->
   
   <xsl:template match="@*|node()" mode="set-countas">
      <xsl:copy>
         <xsl:apply-templates select="@*|node()" mode="set-countas"/>
      </xsl:copy>
   </xsl:template>

   <!-- NUMBERING MODE -->
   
   <xsl:template match="@*|node()" mode="expand-numbering">
      <xsl:copy>
         <xsl:apply-templates select="@*|node()" mode="expand-numbering"/>
      </xsl:copy>
   </xsl:template> 
   
   <!-- POST GENTEXT MODE -->
   
   <xsl:template match="/" mode="post-gentext-expansion">
      <xsl:call-template name="user-visible-root-template"/>
   </xsl:template>
   
   <!-- CLEANUP MODE -->
   
   <xsl:template match="node()" mode="remove-xhtml-namespace">
      <xsl:copy>
         <xsl:copy-of select="@*"/>
         <xsl:apply-templates mode="remove-xhtml-namespace"/>
      </xsl:copy>
   </xsl:template>
	
   <xsl:template xmlns:h="http://www.w3.org/1999/xhtml" match="h:*" mode="remove-xhtml-namespace">
      <xsl:element name="{local-name(.)}" namespace="">
         <xsl:copy-of select="@*"/>
         <xsl:apply-templates mode="remove-xhtml-namespace"/>
      </xsl:element>
   </xsl:template>
   <xsl:template xmlns:atievent="http://www.arbortext.com/namespace/AtiSaxEvents" match="atievent:*"
      mode="remove-xhtml-namespace">
      <xsl:choose>
         <xsl:when test="$Use-atievent-elements='' or $Use-atievent-elements='false'">
            <xsl:text disable-output-escaping="yes">&lt;</xsl:text>
            <xsl:if test="local-name(.)='endelement'">
               <xsl:text>/</xsl:text>
            </xsl:if>
            <xsl:value-of select="string(@atievent:name)"/>
            <xsl:for-each
               select="@*[namespace-uri(.)!='http://www.arbortext.com/namespace/AtiSaxEvents']">
               <xsl:value-of select="' '"/>
               <xsl:value-of select="name(.)"/>
               <xsl:text>="</xsl:text>
               <xsl:value-of select="."/>
               <xsl:text>"</xsl:text>
            </xsl:for-each>
            <xsl:text disable-output-escaping="yes">&gt;</xsl:text>
         </xsl:when>
         <xsl:otherwise>
            <xsl:element name="{name(.)}">
               <xsl:copy-of select="@*"/>
               <xsl:apply-templates mode="remove-xhtml-namespace"/>
            </xsl:element>
         </xsl:otherwise>
      </xsl:choose>
   </xsl:template>

   <!-- ******************************* -->

   <!--The user-visible root template-->
   <xsl:template name="user-visible-root-template">
      <!--Do not change the above line, and edit this template with caution!-->
      <html>
         <head>
            <title>
               <xsl:value-of select="$title"/>
            </title>
            <!--The following line pulls in required contents. Do not delete!-->
            <xsl:call-template name="include-required-head-contents"/>
            <style type="text/css">
               table[rules][rules = "none"] > tr > td,
               table[rules][rules = "none"] > * > tr > td,
               table[rules][rules = "none"] > tr > th,
               table[rules][rules = "none"] > * > tr > th,
               table[rules][rules = "none"] > td,
               table[rules][rules = "none"] > th{
                   border-width:thin;
                   border-style:none;
               }</style>
            <script language="JavaScript" src="_templates/frame/javascript/pwcdisplay.js" type="text/javascript">   <![CDATA[
// leave some space, so that the serializer won't collapse element          // which could cause browser to mis-behave]]></script>
         </head>
         <xsl:apply-templates/>
      </html>
   </xsl:template>

</xsl:stylesheet>

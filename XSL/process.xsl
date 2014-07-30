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

   <xsl:param name="max-expansion-pass-count" select="number(5)"/>
   <xsl:param name="skip-post-gentext-pass" select="'no'"/>
   <xsl:param name="gte-namespace-uri"
      select="'http://www.arbortext.com/namespace/Styler/GeneratedTextElements'"/>
   <xsl:param name="skip-remove-xhtml-namespace-pass" select="'no'"/>

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
   
   <!-- INITIAL PASS MODE -->
   
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

   <xsl:param name="external-css-filename" select="''"/>
   <xsl:param name="relative-external-css-base-filename"
      select="'css/epc_pw600_pw617fe_3072164_PROC'"/>

   <!-- *** Edited Source for the document root follows *** -->
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
         <xsl:apply-templates> </xsl:apply-templates>
      </html>
   </xsl:template>

   <xsl:template name="substring-before-last-occurrence">
      <xsl:param name="full-string"/>
      <xsl:param name="search-string"/>
      <xsl:variable name="front" select="substring-before($full-string,$search-string)"/>
      <xsl:variable name="back" select="substring-after($full-string,$search-string)"/>
      <xsl:choose>
         <xsl:when test="not(contains($back,$search-string))">
            <xsl:value-of select="$front"/>
         </xsl:when>
         <xsl:otherwise>
            <xsl:value-of select="$front"/>
            <xsl:value-of select="$search-string"/>
            <xsl:call-template name="substring-before-last-occurrence">
               <xsl:with-param name="full-string" select="$back"/>
               <xsl:with-param name="search-string" select="$search-string"/>
            </xsl:call-template>
         </xsl:otherwise>
      </xsl:choose>
   </xsl:template>

   <xsl:template name="return-matching-lang-within-targets">
      <xsl:param name="doclang"/>
      <xsl:param name="target-langs"/>
      <xsl:variable name="lc-doclang"
         select="translate($doclang,'ABCDEFGHIJKLMNOPQRSTUVWXYZ','abcdefghijklmnopqrstuvwxyz')"/>
      <xsl:variable name="lc-target-langs"
         select="translate($target-langs,'ABCDEFGHIJKLMNOPQRSTUVWXYZ','abcdefghijklmnopqrstuvwxyz')"/>
      <xsl:choose>
         <xsl:when test="contains($lc-target-langs,concat(' ',$lc-doclang,' '))">
            <xsl:value-of select="$lc-doclang"/>
         </xsl:when>
         <xsl:when test="contains($doclang,'-')">
            <xsl:call-template name="return-matching-lang-within-targets">
               <xsl:with-param name="doclang">
                  <xsl:call-template name="substring-before-last-occurrence">
                     <xsl:with-param name="full-string" select="$doclang"/>
                     <xsl:with-param name="search-string" select="'-'"/>
                  </xsl:call-template>
               </xsl:with-param>
               <xsl:with-param name="target-langs" select="$target-langs"/>
            </xsl:call-template>
         </xsl:when>
      </xsl:choose>
   </xsl:template>

   <xsl:template name="return-lang-applying-language-map">
      <xsl:param name="doclang"/>
      <xsl:variable name="lc-doclang"
         select="translate($doclang,'ABCDEFGHIJKLMNOPQRSTUVWXYZ','abcdefghijklmnopqrstuvwxyz')"/>
      <xsl:choose>
         <xsl:when test="$lc-doclang='en'">
            <xsl:value-of select="'en-US'"/>
         </xsl:when>
         <xsl:when test="$lc-doclang='de'">
            <xsl:value-of select="'de-1996'"/>
         </xsl:when>
         <xsl:otherwise>
            <xsl:value-of select="$doclang"/>
         </xsl:otherwise>
      </xsl:choose>
   </xsl:template>

   <xsl:template name="emit-unstyled-template-content">
      <!--Treat unstyled elements as no-ops-->
      <xsl:apply-templates/>
   </xsl:template>

   <xsl:template name="maybe-set-gte-id">
      <xsl:if test="not(@_gte:id)">
         <xsl:variable name="context-node" select="."/>
         <xsl:variable name="this-elements-real-id">
            <xsl:choose>
               <xsl:when test="@xml:id">
                  <xsl:value-of select="@xml:id"/>
               </xsl:when>
               <xsl:otherwise>
                  <xsl:for-each select="@*">
                     <xsl:variable name="can-call-generate-id">
                        <xsl:choose>
                           <xsl:when test="$using-msxsl">
                              <xsl:call-template name="can-call-generate-id"/>
                           </xsl:when>
                           <xsl:otherwise>true</xsl:otherwise>
                        </xsl:choose>
                     </xsl:variable>
                     <xsl:if test="$can-call-generate-id='true'">
                        <xsl:if test="generate-id(id(.)) = generate-id($context-node)">
                           <xsl:value-of select="."/>
                        </xsl:if>
                     </xsl:if>
                  </xsl:for-each>
               </xsl:otherwise>
            </xsl:choose>
         </xsl:variable>
         <xsl:attribute name="_gte:id">
            <xsl:choose>
               <xsl:when test="$this-elements-real-id!=''">
                  <xsl:value-of select="$this-elements-real-id"/>
               </xsl:when>
               <xsl:otherwise>
                  <xsl:value-of select="'_g_'"/>
                  <xsl:value-of select="generate-id($context-node)"/>
               </xsl:otherwise>
            </xsl:choose>
         </xsl:attribute>
         <xsl:if test="$this-elements-real-id!=''">
            <xsl:attribute name="xml:id">
               <xsl:value-of select="$this-elements-real-id"/>
            </xsl:attribute>
         </xsl:if>
      </xsl:if>
   </xsl:template>

   <xsl:variable name="name-start-chars"
      select="'ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz_:'"/>
   <xsl:variable name="using-msxsl" select="function-available('msxsl:node-set')"/>
   <!--We need to avoid calling generate-id() on things that cannot be valid IDs to avoid an MSXSL bug.  This code isn't close to perfect, but it helps.-->
   <xsl:template name="can-call-generate-id">
      <xsl:param name="str" select="."/>
      <xsl:choose>
         <xsl:when test="not($using-msxsl)">
            <!--Not using MSXSL, so generate-id() on this value shouldn't give an error-->
            <xsl:text>true</xsl:text>
         </xsl:when>
         <xsl:when test="not(contains($name-start-chars,substring($str,1,1)))">
            <xsl:text>false</xsl:text>
         </xsl:when>
         <xsl:when test="contains($str,'/')">
            <xsl:text>false</xsl:text>
         </xsl:when>
         <xsl:when test="contains($str,'@')">
            <xsl:text>false</xsl:text>
         </xsl:when>
         <xsl:when test="contains($str,'#')">
            <xsl:text>false</xsl:text>
         </xsl:when>
         <xsl:otherwise>true</xsl:otherwise>
      </xsl:choose>
   </xsl:template>

   <xsl:template name="maybe-set-gte-src">
      <xsl:param name="unparsed-entity-ref-attr"/>
      <xsl:variable name="entity-ref" select="attribute::*[name()=$unparsed-entity-ref-attr]"/>
      <xsl:if test="not(@_gte:src)">
         <xsl:attribute name="_gte:src">
            <xsl:if test="$entity-ref != ''">
               <xsl:value-of select="string(unparsed-entity-uri($entity-ref))"/>
            </xsl:if>
         </xsl:attribute>
      </xsl:if>
   </xsl:template>

   <xsl:template match="*" mode="set-id">
      <xsl:number level="multiple"
         count="*[not( (namespace-uri(.)='http://www.w3.org/1999/XSL/Format') or (namespace-uri(.)='http://www.arbortext.com/namespace/XslFoExtensions') or (starts-with(namespace-uri(.),'http://www.arbortext.com/namespace/Styler/')) )]"
      />
   </xsl:template>
	
   <xsl:template match="*" mode="ElementContent_All">
      <_sfe:CollectionItem>
         <xsl:apply-templates mode="expand-gentext">
            <xsl:with-param name="skip-expanded-gentext" select="'yes'"/>
         </xsl:apply-templates>
      </_sfe:CollectionItem>
   </xsl:template>

   <xsl:template name="maybe-set-id">
      <xsl:param name="attrname" select="'id'"/>
      <xsl:param name="only-if-id-attr" select="'yes'"/>
      <xsl:param name="check-for-real-id-attr" select="'no'"/>
      <xsl:param name="generated-id-prefix" select="'x'"/>
      <xsl:param name="context-node" select="."/>
      <xsl:if test="not(ancestor::_sfe:HeaderOrFooter)">
         <xsl:variable name="real-id-attr-value">
            <xsl:if test="$check-for-real-id-attr='yes'">
               <xsl:for-each select="$context-node/@*">
                  <xsl:if test="generate-id(id(.)) = generate-id($context-node)">
                     <xsl:value-of select="."/>
                  </xsl:if>
               </xsl:for-each>
            </xsl:if>
         </xsl:variable>
         <xsl:choose>
            <xsl:when
               test="$context-node/@_gte:id!='' and not(starts-with($context-node/@_gte:id,'_g_'))">
               <xsl:attribute name="{$attrname}">
                  <xsl:value-of select="$context-node/@_gte:id"/>
               </xsl:attribute>
            </xsl:when>
            <xsl:when test="$real-id-attr-value!=''">
               <xsl:attribute name="{$attrname}">
                  <xsl:value-of select="$real-id-attr-value"/>
               </xsl:attribute>
            </xsl:when>
            <xsl:when test="$only-if-id-attr!='yes'">
               <xsl:attribute name="{$attrname}">
                  <xsl:value-of select="$generated-id-prefix"/>
                  <xsl:if
                     test="namespace-uri($context-node)='http://www.arbortext.com/namespace/Styler/UserFormattingElements'"
                     >u</xsl:if>
                  <xsl:apply-templates select="$context-node" mode="set-id"/>
               </xsl:attribute>
            </xsl:when>
         </xsl:choose>
      </xsl:if>
   </xsl:template>

   <xsl:param name="show-gtes" select="'yes'"/>
   <xsl:template match="_gte:*">
      <!--It is probably an error for this template to be called-->
      <xsl:choose>
         <xsl:when test="$show-gtes='yes'">
            <!--For debugging, show the tagging in the output-->
            <span xsl:use-attribute-sets="unstyled..basestyle">
               <xsl:text xmlns:fo="http://www.w3.org/1999/XSL/Format">&lt;</xsl:text>
               <xsl:value-of select="name(.)"/>
               <xsl:for-each xmlns:fo="http://www.w3.org/1999/XSL/Format" select="@*">
                  <xsl:text/>
                  <xsl:value-of select="name(.)"/>
                  <xsl:text>="</xsl:text>
                  <xsl:value-of select="."/>
                  <xsl:text>"</xsl:text>
               </xsl:for-each>
               <xsl:text xmlns:fo="http://www.w3.org/1999/XSL/Format">&gt;</xsl:text>
               <xsl:apply-templates xmlns:fo="http://www.w3.org/1999/XSL/Format"/>
               <xsl:text xmlns:fo="http://www.w3.org/1999/XSL/Format">&lt;/</xsl:text>
               <xsl:value-of select="name(.)"/>
               <xsl:text xmlns:fo="http://www.w3.org/1999/XSL/Format">&gt;</xsl:text>
            </span>
         </xsl:when>
         <xsl:otherwise>
            <xsl:apply-templates/>
         </xsl:otherwise>
      </xsl:choose>
   </xsl:template>

   <xsl:template match="_gte:TableOfContents" mode="expand-gentext">
      <_gte:deferredTableOfContents tocNameRef="@tocNameRef"/>
   </xsl:template>

   <xsl:template match="_gte:deferredTableOfContents" mode="expand-gentext">
      <xsl:choose>
         <xsl:when test="@tocNameRef='Table_of_Contents'">
            <xsl:call-template name="_gte-toc-Table_of_Contents"/>
         </xsl:when>
         <xsl:when test="false()"/>
      </xsl:choose>
   </xsl:template>

   <xsl:template match="_gte:FootnoteBody" mode="expand-gentext" priority="-2">
      <xsl:copy>
         <xsl:apply-templates select="@* | node()" mode="expand-gentext"/>
      </xsl:copy>
   </xsl:template>
   <xsl:template match="_gte:FootnoteBody" priority="-0.2"/>
   <xsl:template
      match="_gte:FootnoteBody//processing-instruction('Pub')[starts-with(., '_font') or starts-with(., '/_font')]"
      priority="2"/>
   <xsl:template
      match="_gte:FootnoteBody//processing-instruction('Pub')[starts-with(., '_newline') or starts-with(., '_newcolumn') or starts-with(., '_newpage')]"
      priority="2"/>
   <xsl:template
      match="_gte:FootnoteBody//processing-instruction('Pub')[starts-with(., '_nolinebreak') or starts-with(., '/_nolinebreak')]"
      priority="2"/>

   <xsl:template
      match="_gte:Gentexted-Content-Wrapper//processing-instruction('Pub')[starts-with(., '_font') or starts-with(., '/_font')]"
      priority="2">
      <!--handle-pub-processing-instruction is defined in lib/xsl/{fo,html}/pi.xsl-->
      <xsl:call-template name="handle-pub-processing-instruction">
         <xsl:with-param name="within-gentext" select="true()"/>
      </xsl:call-template>
   </xsl:template>
   <xsl:template
      match="_gte:Gentexted-Content-Wrapper//processing-instruction('Pub')[starts-with(., '_newline') or starts-with(., '_newcolumn') or starts-with(., '_newpage')]"
      priority="2"/>
   <xsl:template
      match="_gte:Gentexted-Content-Wrapper//processing-instruction('Pub')[starts-with(., '_nolinebreak') or starts-with(., '/_nolinebreak')]"
      priority="2"/>

   <xsl:template match="_gte:Gentexted-Content-Wrapper" mode="expand-gentext">
      <xsl:copy>
         <xsl:apply-templates select="@* | node()" mode="expand-gentext"/>
      </xsl:copy>
   </xsl:template>
   <xsl:template match="_gte:Gentexted-Content-Wrapper">
      <xsl:apply-templates/>
   </xsl:template>

   <xsl:template match="_gte:Deferred-styler_numbering" mode="expand-gentext">
      <xsl:variable name="match">
         <xsl:choose>
            <xsl:when test="contains(@match,':')">
               <xsl:value-of select="substring-after(@match,':')"/>
            </xsl:when>
            <xsl:otherwise>
               <xsl:value-of select="@match"/>
            </xsl:otherwise>
         </xsl:choose>
      </xsl:variable>
      <xsl:variable name="gte_id" select="@gte_id"/>
      <xsl:choose>
         <xsl:when test="$gte_id">
            <xsl:apply-templates mode="styler_numbering" select="//*[@_gte:id=$gte_id]"/>
         </xsl:when>
         <xsl:when test="contains($match,'[')">
            <xsl:variable name="elemname" select="substring-before($match,'[')"/>
            <xsl:apply-templates mode="styler_numbering" select="ancestor::*[name()=$elemname][1]"/>
         </xsl:when>
         <xsl:otherwise>
            <xsl:apply-templates mode="styler_numbering" select="ancestor::*[name()=$match][1]"/>
         </xsl:otherwise>
      </xsl:choose>
   </xsl:template>

   <xsl:template match="_gte:styler_numbering" mode="expand-gentext">
      <xsl:copy>
         <xsl:copy-of select="@*"/>
      </xsl:copy>
   </xsl:template>
   
	<xsl:template match="_gte:styler_numbering" mode="set-countas">
      <xsl:copy>
         <xsl:copy-of select="@*"/>
      </xsl:copy>
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
      <xsl:apply-templates mode="styler_numbering"
         select="//*[@_gte:id=$gte_id][not(self::_gte:FootnoteBody[not(self::*[not(ancestor::_sfe:BeforeOrAfterText)])])]">
         <xsl:with-param name="do-qmark" select="$do-qmark"/>
      </xsl:apply-templates>
   </xsl:template>

   <xsl:template match="_gte:deferredCrossReference" mode="expand-gentext">
      <_gte:deferredCrossReference2>
         <xsl:copy-of select="@*"/>
      </_gte:deferredCrossReference2>
   </xsl:template>
   <xsl:template match="_gte:deferredCrossReference2" mode="expand-gentext">
      <xsl:variable name="refed-id" select="@refed-id"/>
      <xsl:variable name="child-title-node"
         select="(//*[@_gte:id=$refed-id]/*[@_gte:unhidden-title]|//*[@_gte:id=$refed-id]/_sfe:BeforeOrAfterText/*[@_gte:unhidden-title])[1]"/>
      <xsl:choose>
         <xsl:when test="@xrefStyle='Label_Number'">
            <xsl:apply-templates select="$child-title-node" mode="styler_xref-Label_Number"/>
         </xsl:when>
         <xsl:when test="@xrefStyle='Label_Number_Text'">
            <xsl:apply-templates select="$child-title-node" mode="styler_xref-Label_Number_Text"/>
         </xsl:when>
         <xsl:when test="@xrefStyle='Label_Number_Text_Page'">
            <xsl:apply-templates select="$child-title-node"
               mode="styler_xref-Label_Number_Text_Page"/>
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
         <xsl:when test="false()"/>
      </xsl:choose>
   </xsl:template>
   <xsl:template match="_gte:deferredCrossReference"/>

   <xsl:template match="_sfe:BeforeOrAfterText" mode="expand-gentext" priority="100">
      <xsl:param name="skip-expanded-gentext" select="'no'"/>
      <xsl:choose>
         <xsl:when test="$skip-expanded-gentext='yes'"/>
         <xsl:otherwise>
            <xsl:copy>
               <xsl:apply-templates select="@* | node()" mode="expand-gentext"/>
            </xsl:copy>
         </xsl:otherwise>
      </xsl:choose>
   </xsl:template>

   <xsl:template name="handle-gte-font-attrs">
      <xsl:call-template name="gte-font-attribute">
         <xsl:with-param name="attrval" select="string(@TypeSize)"/>
         <xsl:with-param name="fontattr">font-size</xsl:with-param>
      </xsl:call-template>
      <xsl:call-template name="gte-font-offset">
         <xsl:with-param name="attrval" select="string(@Offset)"/>
         <xsl:with-param name="fontattr">baseline-shift</xsl:with-param>
      </xsl:call-template>
      <xsl:call-template name="gte-font-attribute">
         <xsl:with-param name="attrval">
            <xsl:variable name="family" select="string(@FamName)"/>
            <xsl:variable name="apos">'</xsl:variable>
            <xsl:choose>
               <xsl:when test="$family = 'Serif'">serif</xsl:when>
               <xsl:when test="$family = 'Sanserif'">sans-serif</xsl:when>
               <xsl:when test="$family = 'Monospace'">monospace</xsl:when>
               <xsl:when test="contains($family,' ') and not(contains($family,$apos))">
                  <xsl:value-of select="concat($apos,$family,$apos)"/>
               </xsl:when>
               <xsl:otherwise>
                  <xsl:value-of select="$family"/>
               </xsl:otherwise>
            </xsl:choose>
         </xsl:with-param>
         <xsl:with-param name="fontattr">font-family</xsl:with-param>
      </xsl:call-template>
      <xsl:call-template name="gte-font-posture">
         <xsl:with-param name="attrval" select="string(@Posture)"/>
         <xsl:with-param name="fontattr">font-style</xsl:with-param>
      </xsl:call-template>
      <xsl:call-template name="gte-font-weight">
         <xsl:with-param name="attrval" select="string(@Weight)"/>
         <xsl:with-param name="fontattr">font-weight</xsl:with-param>
      </xsl:call-template>
      <xsl:call-template name="gte-font-style">
         <xsl:with-param name="attrval" select="string(@FontStyle)"/>
         <xsl:with-param name="fontattr">font-family</xsl:with-param>
      </xsl:call-template>
      <xsl:call-template name="gte-font-color">
         <xsl:with-param name="attrval" select="string(@FontColor)"/>
         <xsl:with-param name="fontattr">color</xsl:with-param>
      </xsl:call-template>
      <xsl:call-template name="gte-font-backcolor">
         <xsl:with-param name="attrval" select="string(@BackColor)"/>
         <xsl:with-param name="fontattr">background-color</xsl:with-param>
      </xsl:call-template>
      <xsl:call-template name="gte-font-keepline">
         <xsl:with-param name="attrval" select="string(@KeepLine)"/>
         <xsl:with-param name="fontattr">keep-together.within-line</xsl:with-param>
      </xsl:call-template>
      <xsl:call-template name="gte-font-scorespaces">
         <xsl:with-param name="attrval" select="string(@ScoreSpace)"/>
         <xsl:with-param name="fontattr">score-spaces</xsl:with-param>
      </xsl:call-template>
      <xsl:call-template name="gte-font-allcaps">
         <xsl:with-param name="attrval" select="string(@AllCap)"/>
         <xsl:with-param name="fontattr">text-transform</xsl:with-param>
      </xsl:call-template>
      <xsl:call-template name="gte-font-smallcaps">
         <xsl:with-param name="attrval" select="string(@SmallCap)"/>
         <xsl:with-param name="fontattr">font-variant</xsl:with-param>
      </xsl:call-template>
      <xsl:call-template name="gte-font-text-decoration">
         <xsl:with-param name="underline">
            <xsl:call-template name="gte-font-underline">
               <xsl:with-param name="attrval" select="string(@Underline)"/>
            </xsl:call-template>
         </xsl:with-param>
         <xsl:with-param name="strikethru">
            <xsl:call-template name="gte-font-strikethru">
               <xsl:with-param name="attrval" select="string(@ScoreCharOn)"/>
            </xsl:call-template>
         </xsl:with-param>
         <xsl:with-param name="fontattr">text-decoration</xsl:with-param>
      </xsl:call-template>
   </xsl:template>

   <xsl:template name="gte-font-attribute">
      <xsl:param name="attrval"/>
      <xsl:param name="fontattr"/>
      <xsl:if test="$attrval!=''">
         <xsl:call-template name="set-property">
            <xsl:with-param name="prop-name" select="$fontattr"/>
            <xsl:with-param name="prop-value" select="$attrval"/>
         </xsl:call-template>
      </xsl:if>
   </xsl:template>
   <xsl:param name="bg_colorizer"
      select="''bgreen=#C0FFC0; gray3=#D0D0D0; green=#C0FFC0; lime=#E0FFE0; bviolet=#FFC0FF; gray4=#C0C0C0; maroon=#C08080; navy=#A0A0C0; bred=#FFC0CB; borange=#FFC097; gray5=#B0B0B0; olive=#D0D000; red=#FFC0CB; byellow=#FFFFC0; bwhite=#FFFFFF; bbrown=#DEB887; bblack=#808080; black=#808080; brown=#DEB887; teal=#00E0E0; violet=#FFC0FF; white=#FFFFFF; bblue=#C0C0FF; blue=#C0C0FF; orange=#FFC097; transparent=transparent; aqua=#D0FFFF; gray1=#F0F0F0; bgray=#D0D0D0; gray2=#E0E0E0; gray=#D0D0D0; yellow=#FFFFC0;''"/>
   <xsl:template name="gte-font-posture">
      <xsl:param name="attrval"/>
      <xsl:param name="fontattr"/>
      <xsl:variable name="replval">
         <xsl:choose>
            <xsl:when test="$attrval='upright'">normal</xsl:when>
            <xsl:when test="$attrval=''"/>
            <xsl:otherwise>
               <xsl:value-of select="$attrval"/>
            </xsl:otherwise>
         </xsl:choose>
      </xsl:variable>
      <xsl:if test="$replval!=''">
         <xsl:call-template name="set-property">
            <xsl:with-param name="prop-name" select="$fontattr"/>
            <xsl:with-param name="prop-value" select="$replval"/>
         </xsl:call-template>
      </xsl:if>
   </xsl:template>
   <xsl:template name="gte-font-weight">
      <xsl:param name="attrval"/>
      <xsl:param name="fontattr"/>
      <xsl:variable name="replval">
         <xsl:choose>
            <xsl:when test="$attrval='medium'">normal</xsl:when>
            <xsl:when test="$attrval=''"/>
            <xsl:otherwise>
               <xsl:value-of select="$attrval"/>
            </xsl:otherwise>
         </xsl:choose>
      </xsl:variable>
      <xsl:if test="$replval!=''">
         <xsl:call-template name="set-property">
            <xsl:with-param name="prop-name" select="$fontattr"/>
            <xsl:with-param name="prop-value" select="$replval"/>
         </xsl:call-template>
      </xsl:if>
   </xsl:template>
   <xsl:template name="gte-font-style">
      <xsl:param name="attrval"/>
      <xsl:param name="fontattr"/>
      <xsl:variable name="replval">
         <xsl:choose>
            <xsl:when test="$attrval='serifed'">serif</xsl:when>
            <xsl:when test="$attrval='sans-serif'">sans-serif</xsl:when>
            <xsl:when test="$attrval='monospaced-serifed'">monospace</xsl:when>
            <xsl:when test="$attrval='monospaced-sans-serif'">monospace</xsl:when>
            <xsl:otherwise/>
         </xsl:choose>
      </xsl:variable>
      <xsl:if test="$replval!=''">
         <xsl:call-template name="set-property">
            <xsl:with-param name="prop-name" select="$fontattr"/>
            <xsl:with-param name="prop-value" select="$replval"/>
         </xsl:call-template>
      </xsl:if>
   </xsl:template>
   <xsl:template name="gte-font-color">
      <xsl:param name="attrval"/>
      <xsl:param name="fontattr"/>
      <xsl:variable name="replval">
         <xsl:choose>
            <xsl:when test="$attrval=''"/>
            <xsl:when test="starts-with($attrval,'#')">
               <xsl:value-of select="$attrval"/>
            </xsl:when>
            <xsl:when test="contains($fg_colorizer,$attrval)">
               <xsl:value-of
                  select="substring-before(substring-after($fg_colorizer,concat($attrval,'=')),';')"
               />
            </xsl:when>
            <xsl:otherwise/>
         </xsl:choose>
      </xsl:variable>
      <xsl:if test="$replval!=''">
         <xsl:choose>
            <xsl:when test="$attrval='transparent'">
               <xsl:call-template name="set-property">
                  <xsl:with-param name="prop-name" select="'visibility'"/>
                  <xsl:with-param name="prop-value" select="'hidden'"/>
               </xsl:call-template>
            </xsl:when>
            <xsl:otherwise>
               <xsl:call-template name="set-property">
                  <xsl:with-param name="prop-name" select="$fontattr"/>
                  <xsl:with-param name="prop-value" select="$replval"/>
               </xsl:call-template>
            </xsl:otherwise>
         </xsl:choose>
      </xsl:if>
   </xsl:template>
   <xsl:template name="gte-font-backcolor">
      <xsl:param name="attrval"/>
      <xsl:param name="fontattr"/>
      <xsl:variable name="replval">
         <xsl:choose>
            <xsl:when test="$attrval=''"/>
            <xsl:when test="starts-with($attrval,'#')">
               <xsl:value-of select="$attrval"/>
            </xsl:when>
            <xsl:when test="$attrval='transparent'">transparent</xsl:when>
            <xsl:when test="contains($bg_colorizer,$attrval)">
               <xsl:value-of
                  select="substring-before(substring-after($bg_colorizer,concat($attrval,'=')),';')"
               />
            </xsl:when>
            <xsl:otherwise/>
         </xsl:choose>
      </xsl:variable>
      <xsl:if test="$replval!=''">
         <xsl:call-template name="set-property">
            <xsl:with-param name="prop-name" select="$fontattr"/>
            <xsl:with-param name="prop-value" select="$replval"/>
         </xsl:call-template>
      </xsl:if>
   </xsl:template>
   <xsl:template name="gte-font-scorespaces">
      <xsl:param name="attrval"/>
      <xsl:param name="fontattr"/>
      <xsl:variable name="replval">
         <xsl:choose>
            <xsl:when test="$attrval='yes'">true</xsl:when>
            <xsl:when test="$attrval='no'">false</xsl:when>
            <xsl:otherwise/>
         </xsl:choose>
      </xsl:variable>
      <xsl:if test="$replval!=''">
         <xsl:call-template name="set-property">
            <xsl:with-param name="prop-name" select="$fontattr"/>
            <xsl:with-param name="prop-value" select="$replval"/>
         </xsl:call-template>
      </xsl:if>
   </xsl:template>
   <xsl:template name="gte-font-allcaps">
      <xsl:param name="attrval"/>
      <xsl:param name="fontattr"/>
      <xsl:variable name="replval">
         <xsl:choose>
            <xsl:when test="$attrval='yes'">uppercase</xsl:when>
            <xsl:otherwise/>
         </xsl:choose>
      </xsl:variable>
      <xsl:if test="$replval!=''">
         <xsl:call-template name="set-property">
            <xsl:with-param name="prop-name" select="$fontattr"/>
            <xsl:with-param name="prop-value" select="$replval"/>
         </xsl:call-template>
      </xsl:if>
   </xsl:template>
   <xsl:template name="gte-font-smallcaps">
      <xsl:param name="attrval"/>
      <xsl:param name="fontattr"/>
      <xsl:variable name="replval">
         <xsl:choose>
            <xsl:when test="$attrval='yes'">small-caps</xsl:when>
            <xsl:otherwise/>
         </xsl:choose>
      </xsl:variable>
      <xsl:if test="$replval!=''">
         <xsl:call-template name="set-property">
            <xsl:with-param name="prop-name" select="$fontattr"/>
            <xsl:with-param name="prop-value" select="$replval"/>
         </xsl:call-template>
      </xsl:if>
   </xsl:template>
   <xsl:template name="gte-font-text-decoration">
      <xsl:param name="underline"/>
      <xsl:param name="strikethru"/>
      <xsl:param name="fontattr">text-decoration</xsl:param>
      <xsl:if test="concat($underline,$strikethru) != ''">
         <xsl:variable name="replval">
            <xsl:choose>
               <xsl:when test="$underline = ''">
                  <xsl:text>line-through</xsl:text>
               </xsl:when>
               <xsl:when test="$strikethru = ''">
                  <xsl:text>underline</xsl:text>
               </xsl:when>
               <xsl:otherwise>
                  <xsl:text>underline line-through</xsl:text>
               </xsl:otherwise>
            </xsl:choose>
         </xsl:variable>
         <xsl:call-template name="set-property">
            <xsl:with-param name="prop-name" select="$fontattr"/>
            <xsl:with-param name="prop-value" select="$replval"/>
         </xsl:call-template>
      </xsl:if>
   </xsl:template>
   <xsl:template name="gte-font-underline">
      <xsl:param name="attrval"/>
      <xsl:choose>
         <xsl:when test="$attrval='yes'">underline</xsl:when>
         <xsl:otherwise/>
      </xsl:choose>
   </xsl:template>
   <xsl:template name="gte-font-strikethru">
      <xsl:param name="attrval"/>
      <xsl:choose>
         <xsl:when test="$attrval='yes'">line-through</xsl:when>
         <xsl:otherwise/>
      </xsl:choose>
   </xsl:template>

   <xsl:template match="_gte:MetaElement" mode="expand-gentext">
      <xsl:copy>
         <xsl:apply-templates select="@* | node()" mode="expand-gentext"/>
      </xsl:copy>
   </xsl:template>
   <xsl:template match="_gte:MetaElement">
      <ch:meta>
         <xsl:attribute name="name">
            <xsl:value-of select="_gte:MetaName"/>
         </xsl:attribute>
         <xsl:attribute name="content">
            <xsl:value-of select="_gte:MetaValue"/>
         </xsl:attribute>
      </ch:meta>
   </xsl:template>

   <xsl:template match="_gte:Link">
      <a>
         <xsl:attribute name="href">
            <xsl:text>#</xsl:text>
            <xsl:value-of select="@linkRef"/>
         </xsl:attribute>
         <xsl:apply-templates/>
      </a>
   </xsl:template>

   <xsl:template match="_gte:Leaders">
      <xsl:text> </xsl:text>
   </xsl:template>

   <xsl:template match="_gte:GeneratedTextGraphic">
      <img>
         <xsl:if test="@alt">
            <xsl:attribute name="alt">
               <xsl:value-of select="@alt"/>
            </xsl:attribute>
         </xsl:if>
         <xsl:if test="@longdesc">
            <xsl:attribute name="longdesc">
               <xsl:value-of select="@longdesc"/>
            </xsl:attribute>
         </xsl:if>
         <xsl:variable name="filename">
            <xsl:value-of select="@pathname"/>
         </xsl:variable>
         <xsl:variable name="graphic-prop-filename">
            <xsl:variable name="aclcmd">
               <xsl:text>filename_to_url(find_file_in_path('</xsl:text>
               <xsl:value-of select="$filename"/>
               <xsl:text>','e',option('graphicspath')))</xsl:text>
            </xsl:variable>
            <xsl:value-of select="_acl:eval($aclcmd)"/>
         </xsl:variable>
         <xsl:attribute name="src">
            <xsl:value-of select="string($filename)"/>
         </xsl:attribute>
         <xsl:variable name="intrinsic-width">
            <xsl:choose>
               <xsl:when test="$available-graphic-getwidth-extension='simg:getWidth'">
                  <xsl:value-of select="number(simg:getWidth(simg:new($graphic-prop-filename),0))"/>
               </xsl:when>
               <xsl:when test="$available-graphic-getwidth-extension='ximg:getWidth'">
                  <xsl:value-of select="number(ximg:getWidth(ximg:new($graphic-prop-filename),0))"/>
               </xsl:when>
               <xsl:otherwise>
                  <!--Get the info via ACL's graphic_information() function-->
                  <xsl:variable name="aclcmd">
                     <xsl:text>_ssutils::getImageWidth("</xsl:text>
                     <xsl:value-of select="$graphic-prop-filename"/>
                     <xsl:text>")</xsl:text>
                  </xsl:variable>
                  <xsl:variable name="w" select="_acl:eval($aclcmd)"/>
                  <xsl:choose>
                     <xsl:when test="string(number($w))='NaN'">
                        <xsl:value-of select="number('0')"/>
                     </xsl:when>
                     <xsl:otherwise>
                        <xsl:value-of select="number($w)"/>
                     </xsl:otherwise>
                  </xsl:choose>
               </xsl:otherwise>
            </xsl:choose>
         </xsl:variable>
         <xsl:variable name="hscaled-width">
            <xsl:choose>
               <xsl:when test="normalize-space(@hscale)!='' and $intrinsic-width &gt; 0">
                  <!--We ignore hscale if there is no intrinsic width-->
                  <xsl:variable name="hscale-attr-value">
                     <xsl:choose>
                        <xsl:when test="contains(@hscale,'%')">
                           <xsl:value-of select="translate(@hscale,'%','')"/>
                        </xsl:when>
                        <xsl:otherwise>
                           <xsl:value-of select="@hscale"/>
                        </xsl:otherwise>
                     </xsl:choose>
                  </xsl:variable>
                  <xsl:value-of select="round($hscale-attr-value * $intrinsic-width div 100)"/>
               </xsl:when>
               <xsl:otherwise>0</xsl:otherwise>
            </xsl:choose>
         </xsl:variable>
         <xsl:variable name="intrinsic-height">
            <xsl:choose>
               <xsl:when test="$available-graphic-getdepth-extension='simg:getDepth'">
                  <xsl:value-of select="number(simg:getDepth(simg:new($graphic-prop-filename),0))"/>
               </xsl:when>
               <xsl:when test="$available-graphic-getdepth-extension='ximg:getDepth'">
                  <xsl:value-of select="number(ximg:getDepth(ximg:new($graphic-prop-filename),0))"/>
               </xsl:when>
               <xsl:otherwise>
                  <!--Get the info via ACL's graphic_information() function-->
                  <xsl:variable name="aclcmd">
                     <xsl:text>_ssutils::getImageDepth("</xsl:text>
                     <xsl:value-of select="$graphic-prop-filename"/>
                     <xsl:text>")</xsl:text>
                  </xsl:variable>
                  <xsl:variable name="d" select="_acl:eval($aclcmd)"/>
                  <xsl:choose>
                     <xsl:when test="string(number($d))='NaN'">
                        <xsl:value-of select="number('0')"/>
                     </xsl:when>
                     <xsl:otherwise>
                        <xsl:value-of select="number($d)"/>
                     </xsl:otherwise>
                  </xsl:choose>
               </xsl:otherwise>
            </xsl:choose>
         </xsl:variable>
         <xsl:variable name="vscaled-height">
            <xsl:choose>
               <xsl:when test="normalize-space(@vscale)!='' and $intrinsic-height &gt; 0">
                  <!--We ignore vscale if there is no intrinsic height-->
                  <xsl:variable name="vscale-attr-value">
                     <xsl:choose>
                        <xsl:when test="contains(@vscale,'%')">
                           <xsl:value-of select="translate(@vscale,'%','')"/>
                        </xsl:when>
                        <xsl:otherwise>
                           <xsl:value-of select="@vscale"/>
                        </xsl:otherwise>
                     </xsl:choose>
                  </xsl:variable>
                  <xsl:value-of select="round($vscale-attr-value * $intrinsic-height div 100)"/>
               </xsl:when>
               <xsl:otherwise>0</xsl:otherwise>
            </xsl:choose>
         </xsl:variable>
         <xsl:choose>
            <xsl:when test="(@imagewidth or @imagedepth)">
               <!-- Set image size from given image dimen(s) -->
               <xsl:if test="@imagewidth">
                  <xsl:attribute name="width">
                     <xsl:call-template name="length-to-pixels">
                        <xsl:with-param name="dimen" select="@imagewidth"/>
                     </xsl:call-template>
                  </xsl:attribute>
               </xsl:if>
            </xsl:when>
            <xsl:otherwise>
               <xsl:choose>
                  <xsl:when test="@hscale">
                     <xsl:if test="$hscaled-width &gt; 0">
                        <xsl:attribute name="width">
                           <xsl:value-of select="$hscaled-width"/>
                        </xsl:attribute>
                     </xsl:if>
                  </xsl:when>
                  <xsl:when test="contains(concat('|','1|yes','|'),concat('|',@scalefit,'|'))">
                     <xsl:choose>
                        <xsl:when test="(@reprowidth or @reprodepth)">
                           <xsl:if test="@reprowidth">
                              <xsl:attribute name="width">
                                 <xsl:call-template name="length-to-pixels">
                                    <xsl:with-param name="dimen">
                                       <xsl:value-of select="@reprowidth"/>
                                    </xsl:with-param>
                                 </xsl:call-template>
                              </xsl:attribute>
                           </xsl:if>
                        </xsl:when>
                        <xsl:otherwise>
                           <xsl:attribute name="width">100%</xsl:attribute>
                        </xsl:otherwise>
                     </xsl:choose>
                  </xsl:when>
               </xsl:choose>
            </xsl:otherwise>
         </xsl:choose>
         <xsl:choose>
            <xsl:when test="(@imagewidth or @imagedepth)">
               <!-- Set image size from given image dimen(s) -->
               <xsl:if test="@imagedepth">
                  <xsl:attribute name="height">
                     <xsl:call-template name="length-to-pixels">
                        <xsl:with-param name="dimen" select="@imagedepth"/>
                     </xsl:call-template>
                  </xsl:attribute>
               </xsl:if>
            </xsl:when>
            <xsl:otherwise>
               <xsl:choose>
                  <xsl:when test="@vscale">
                     <xsl:if test="$vscaled-height &gt; 0">
                        <xsl:attribute name="height">
                           <xsl:value-of select="$vscaled-height"/>
                        </xsl:attribute>
                     </xsl:if>
                  </xsl:when>
                  <xsl:when test="contains(concat('|','1|yes','|'),concat('|',@scalefit,'|'))">
                     <xsl:choose>
                        <xsl:when test="(@reprowidth or @reprodepth)">
                           <xsl:if test="@reprodepth">
                              <xsl:attribute name="height">
                                 <xsl:call-template name="length-to-pixels">
                                    <xsl:with-param name="dimen">
                                       <xsl:value-of select="@reprodepth"/>
                                    </xsl:with-param>
                                 </xsl:call-template>
                              </xsl:attribute>
                           </xsl:if>
                        </xsl:when>
                     </xsl:choose>
                  </xsl:when>
               </xsl:choose>
            </xsl:otherwise>
         </xsl:choose>
         <xsl:attribute name="style">max-width: 100%; </xsl:attribute>
      </img>
   </xsl:template>

   <xsl:template match="_gte:Font">
      <xsl:if test="not(@Suppress='yes')">
         <xsl:variable name="style-attr-value">
            <xsl:call-template name="handle-gte-font-attrs"/>
         </xsl:variable>
         <xsl:choose>
            <xsl:when test="$style-attr-value!=''">
               <span>
                  <xsl:attribute name="style">
                     <xsl:value-of select="$style-attr-value"/>
                  </xsl:attribute>
                  <xsl:apply-templates/>
               </span>
            </xsl:when>
            <xsl:otherwise>
               <xsl:apply-templates/>
            </xsl:otherwise>
         </xsl:choose>
      </xsl:if>
   </xsl:template>
   <xsl:template name="gte-font-offset">
      <xsl:param name="attrval"/>
      <xsl:param name="fontattr"/>
      <xsl:if test="$attrval!=''">
         <xsl:variable name="temp">
            <xsl:call-template name="size-to-points">
               <xsl:with-param name="size" select="$attrval"/>
            </xsl:call-template>
         </xsl:variable>
         <xsl:if test="$temp != 0">
            <xsl:call-template name="set-property">
               <xsl:with-param name="prop-name" select="'position'"/>
               <xsl:with-param name="prop-value" select="'relative'"/>
            </xsl:call-template>
            <xsl:choose>
               <xsl:when test="$temp &gt; 0">
                  <xsl:call-template name="set-property">
                     <xsl:with-param name="prop-name" select="'top'"/>
                     <xsl:with-param name="prop-value" select="concat('-',$attrval)"/>
                  </xsl:call-template>
               </xsl:when>
               <xsl:otherwise>
                  <xsl:call-template name="set-property">
                     <xsl:with-param name="prop-name" select="'bottom'"/>
                     <xsl:with-param name="prop-value" select="$attrval"/>
                  </xsl:call-template>
               </xsl:otherwise>
            </xsl:choose>
         </xsl:if>
      </xsl:if>
   </xsl:template>
   <xsl:template name="gte-font-keepline"/>

   <xsl:template name="size-to-points">
      <xsl:param name="size"/>
      <xsl:variable name="units" select="substring($size,string-length($size)-1)"/>
      <xsl:variable name="val" select="number(substring($size,1,string-length($size)-2))"/>
      <xsl:choose>
         <xsl:when test="$val='' or $val=0">
            <xsl:value-of select="number(0)"/>
         </xsl:when>
         <xsl:when test="$units='pc'">
            <xsl:value-of select="$val * 12"/>
         </xsl:when>
         <xsl:when test="$units='in'">
            <xsl:value-of select="$val * 72"/>
         </xsl:when>
         <xsl:when test="$units='mm'">
            <xsl:value-of select="$val * 72 div 25.4"/>
         </xsl:when>
         <xsl:when test="$units='cm'">
            <xsl:value-of select="$val * 72 div 2.54"/>
         </xsl:when>
         <xsl:when test="$units='em'">
            <xsl:value-of select="$val * 12"/>
         </xsl:when>
         <xsl:otherwise>
            <xsl:value-of select="$val"/>
         </xsl:otherwise>
      </xsl:choose>
   </xsl:template>

   <xsl:template name="set-property">
      <xsl:param name="prop-name"/>
      <xsl:param name="prop-value"/>
      <xsl:if test="$prop-value!=''">
         <xsl:value-of select="$prop-name"/>
         <xsl:text>: </xsl:text>
         <xsl:value-of select="$prop-value"/>
         <xsl:text>; </xsl:text>
      </xsl:if>
   </xsl:template>

   <xsl:template xmlns:h="http://www.w3.org/1999/xhtml" match="h:*">
      <xsl:element name="{name(.)}">
         <xsl:copy-of select="@*"/>
         <xsl:apply-templates/>
      </xsl:element>
   </xsl:template>

   <!--Fallback Template for unstyled document element-->
   <xsl:template match="/*" priority="-0.1">
      <body ch:chunk="yes">
         <xsl:apply-templates/>
      </body>
   </xsl:template>

   <!--Compute the title text-->
   <xsl:variable name="title">
      <xsl:choose>
         <xsl:when test="$doctype='emipc'">
            <xsl:value-of select="//_ufe:chapsect-title[1]|//_ufe:cir-title[1]|//_ufe:consumables-title[1]|//_ufe:eipc-title[1]|//_ufe:em-title[1]|//_ufe:fixequ-title[1]|//_ufe:general-title[1]|//_ufe:glossary-title[1]|//_ufe:howtouse-title[1]|//_ufe:intro-title[1]|//manual-title[1]|//_ufe:num-index-title[1]|//_ufe:nut-option-title[1]|//_ufe:pdlist-title[1]|//pwc-title[1]|//_ufe:sblist-title[1]|//_ufe:spblist-title[1]|//_ufe:spectools-title[1]|//_ufe:supplier-list-title[1]|//_ufe:task-title[1]|//_ufe:temp-rev-title[1]|//title[1]|//_ufe:tmm-title[1]"/>
         </xsl:when>
         <xsl:when test="$doctype='ipc'">
            <xsl:value-of select="//_ufe:chapsect-title[1]|//_ufe:cir-title[1]|//_ufe:consumables-title[1]|//_ufe:eipc-title[1]|//_ufe:em-title[1]|//_ufe:fixequ-title[1]|//_ufe:general-title[1]|//_ufe:glossary-title[1]|//_ufe:howtouse-title[1]|//_ufe:intro-title[1]|//manual-title[1]|//_ufe:num-index-title[1]|//_ufe:nut-option-title[1]|//_ufe:pdlist-title[1]|//_ufe:sblist-title[1]|//_ufe:spblist-title[1]|//_ufe:spectools-title[1]|//_ufe:supplier-list-title[1]|//_ufe:task-title[1]|//_ufe:temp-rev-title[1]|//title[1]|//_ufe:tmm-title[1]"/>
         </xsl:when>
         <xsl:when test="$doctype='jmtosmigrate'">
            <xsl:value-of select="//_ufe:chapsect-title[1]|//_ufe:cir-title[1]|//_ufe:consumables-title[1]|//_ufe:eipc-title[1]|//_ufe:em-title[1]|//_ufe:fixequ-title[1]|//_ufe:general-title[1]|//_ufe:glossary-title[1]|//_ufe:howtouse-title[1]|//_ufe:intro-title[1]|//manual-title[1]|//_ufe:num-index-title[1]|//_ufe:nut-option-title[1]|//pageblock-title[1]|//_ufe:pdlist-title[1]|//_ufe:sblist-title[1]|//_ufe:spblist-title[1]|//_ufe:spectools-title[1]|//_ufe:supplier-list-title[1]|//_ufe:task-title[1]|//_ufe:temp-rev-title[1]|//title[1]|//_ufe:tmm-title[1]"/>
         </xsl:when>
         <xsl:when test="$doctype='migrate'">
            <xsl:value-of select="//_ufe:chapsect-title[1]|//_ufe:cir-title[1]|//_ufe:consumables-title[1]|//_ufe:eipc-title[1]|//_ufe:em-title[1]|//_ufe:fixequ-title[1]|//_ufe:general-title[1]|//_ufe:glossary-title[1]|//_ufe:howtouse-title[1]|//_ufe:intro-title[1]|//manual-title[1]|//_ufe:num-index-title[1]|//_ufe:nut-option-title[1]|//pageblock-title[1]|//_ufe:pdlist-title[1]|//_ufe:sblist-title[1]|//_ufe:spblist-title[1]|//_ufe:spectools-title[1]|//_ufe:supplier-list-title[1]|//_ufe:task-title[1]|//_ufe:temp-rev-title[1]|//title[1]|//_ufe:tmm-title[1]"/>
         </xsl:when>
      </xsl:choose>
   </xsl:variable>

   <!--Define the template with the required head contents-->
   <xsl:template name="include-required-head-contents">
      <meta name="Generator" content="{$generator-product-name} {$generator-version-number}"/>
      <xsl:value-of select="'&#xA;'"/>
      <xsl:if test="//*/namespace::*[string(.)='http://www.arbortext.com/namespace/graphics']">
         <xsl:variable name="result-doc-graphics-dir">
            <xsl:variable name="fileref-value">
               <xsl:choose>
                  <xsl:when test="$doctype='emipc'">
                     <xsl:value-of select="(//sheet/@gnbr)[1]"/>
                  </xsl:when>
                  <xsl:when test="$doctype='ipc'">
                     <xsl:value-of select="(//graphic/@negnumber)[1]"/>
                  </xsl:when>
                  <xsl:when test="$doctype='jmtosmigrate'">
                     <xsl:value-of select="(//pwcsoa/@negnumber|//sheet/@gnbr)[1]"/>
                  </xsl:when>
                  <xsl:when test="$doctype='migrate'">
                     <xsl:value-of select="(//graphic/@negnumber|//soa/@negnumber)[1]"/>
                  </xsl:when>
               </xsl:choose>
            </xsl:variable>
            <xsl:call-template name="substring-before-last">
               <xsl:with-param name="str" select="translate($fileref-value,'\','/')"/>
               <xsl:with-param name="delim" select="'/'"/>
            </xsl:call-template>
         </xsl:variable>
         <xsl:for-each xmlns:ati3d="http://www.arbortext.com/namespace/graphics"
            select="//*[@ati3d:viewer]">
            <xsl:variable name="viewer" select="@ati3d:viewer"/>
            <xsl:if test="generate-id(.) = generate-id(//*[@ati3d:viewer=$viewer][1])">
               <script type="text/javascript">
                  <xsl:attribute name="src">
                     <xsl:value-of select="$result-doc-graphics-dir"/>
                     <xsl:value-of select="'/html'"/>
                     <xsl:value-of select="$viewer"/>
                     <xsl:value-of select="'.js'"/>
                  </xsl:attribute>
               </script>
            </xsl:if>
         </xsl:for-each>
         <style type="text/css">
            .viewpath{
                display:none;
            }
            .viewlinks{
                display:none;
            }</style>
      </xsl:if>
      <ch:config>
         <ch:param name="ixsee-addbefore" value=", See "/>
         <ch:param name="ixseealso-addbefore" value="See also "/>
      </ch:config>
      <link href="{concat($relative-external-css-base-filename,'.css')}" rel="stylesheet"
         type="text/css"/>
   </xsl:template>

   <xsl:template name="length-to-pixels">
      <xsl:param name="dimen"/>
      <xsl:variable name="dimenx" select="concat('00',$dimen)"/>
      <xsl:variable name="units" select="substring($dimenx,string-length($dimenx)-1)"/>
      <xsl:variable name="numeric-value"
         select="number(substring($dimenx,1,string-length($dimenx)-2))"/>
      <xsl:choose>
         <xsl:when test="string(number($units))!='NaN' and string(number($numeric-value))!='NaN'">
            <xsl:value-of select="number(round(concat($numeric-value,$units)))"/>
         </xsl:when>
         <xsl:when test="string(number($numeric-value))='NaN'">
            <xsl:value-of select="'100%'"/>
         </xsl:when>
         <xsl:when test="$units='cm'">
            <xsl:value-of select="number(round($numeric-value * 96 div 2.54))"/>
         </xsl:when>
         <xsl:when test="$units='mm'">
            <xsl:value-of select="number(round($numeric-value * 96 div 25.4))"/>
         </xsl:when>
         <xsl:when test="$units='in'">
            <xsl:value-of select="number(round($numeric-value * 96))"/>
         </xsl:when>
         <xsl:when test="$units='pt'">
            <xsl:value-of select="number(round($numeric-value * 96 div 72))"/>
         </xsl:when>
         <xsl:when test="$units='pc'">
            <xsl:value-of select="number(round($numeric-value * 96 div 6))"/>
         </xsl:when>
         <xsl:when test="$units='px'">
            <xsl:value-of select="number(round($numeric-value))"/>
         </xsl:when>
         <xsl:when test="$units='em'">
            <xsl:value-of select="number(round($numeric-value * 96 div 6))"/>
         </xsl:when>
         <xsl:otherwise>
            <xsl:value-of select="'100%'"/>
         </xsl:otherwise>
      </xsl:choose>
   </xsl:template>

   <xsl:template name="substring-before-last">
      <xsl:param name="str" select="''"/>
      <xsl:param name="delim" select="'/'"/>
      <xsl:value-of select="substring-before($str,$delim)"/>
      <xsl:if test="contains(substring-after($str,$delim),$delim)">
         <xsl:value-of select="$delim"/>
         <xsl:call-template name="substring-before-last">
            <xsl:with-param name="str" select="substring-after($str,$delim)"/>
            <xsl:with-param name="delim" select="$delim"/>
         </xsl:call-template>
      </xsl:if>
   </xsl:template>

   <xsl:template name="substring-after-last">
      <xsl:param name="str" select="''"/>
      <xsl:param name="delim" select="'/'"/>
      <xsl:choose>
         <xsl:when test="contains($str,$delim)">
            <xsl:call-template name="substring-after-last">
               <xsl:with-param name="str" select="substring-after($str,$delim)"/>
               <xsl:with-param name="delim" select="$delim"/>
            </xsl:call-template>
         </xsl:when>
         <xsl:otherwise>
            <xsl:value-of select="$str"/>
         </xsl:otherwise>
      </xsl:choose>
   </xsl:template>

   <xsl:variable name="viewerdownloaduris"/>
   <xsl:template name="get-downloaduri">
      <xsl:param name="viewer" select="'pview'"/>
      <xsl:variable name="rest1"
         select="substring-after(concat(' ',$viewerdownloaduris),concat(' ',$viewer,'='))"/>
      <xsl:variable name="quote" select="substring($rest1,1,1)"/>
      <xsl:variable name="rest2" select="substring($rest1,2)"/>
      <xsl:value-of select="substring-before($rest2,$quote)"/>
   </xsl:template>

   <xsl:template match="_gte:FootnoteBody" mode="styler-collect-footnotes">
      <div id="{generate-id(.)}">
         <xsl:apply-templates select="."/>
      </div>
   </xsl:template>

   <xsl:template match="*" mode="styler-collect-footnotes">
      <xsl:apply-templates select="*" mode="styler-collect-footnotes"/>
   </xsl:template>

   <xsl:variable name="list-of-combined-font-names">'</xsl:variable>

   <!-- *** Start of templates to aid in web publishing processing *** -->

   <xsl:template match="processing-instruction('EpicOpts')">
      <xsl:processing-instruction name="EpicOpts">
         <xsl:value-of select="."/>
      </xsl:processing-instruction>
   </xsl:template>

   <xsl:template match="processing-instruction('ProfileValues')">
      <xsl:processing-instruction name="ProfileValues">
         <xsl:value-of select="."/>
      </xsl:processing-instruction>
   </xsl:template>

   <xsl:template match="processing-instruction('Profile')">
      <xsl:processing-instruction name="Profile">
         <xsl:value-of select="."/>
      </xsl:processing-instruction>
      <xsl:processing-instruction name="ProfileAxes">
         <xsl:call-template name="check-Profile-atts">
            <xsl:with-param name="target-atts" select="following-sibling::*[1]/@*"/>
            <xsl:with-param name="PI-data" select="string(current())"/>
         </xsl:call-template>
      </xsl:processing-instruction>
   </xsl:template>

   <xsl:template name="check-Profile-atts">
      <xsl:param name="target-atts"/>
      <xsl:param name="PI-data"/>
      <xsl:call-template name="check-Profile-att">
         <xsl:with-param name="target-atts" select="$target-atts"/>
         <xsl:with-param name="PI-att" select="substring-before($PI-data, '=')"/>
      </xsl:call-template>
      <xsl:if test="contains($PI-data, '&#34; ')">
         <xsl:call-template name="check-Profile-atts">
            <xsl:with-param name="target-atts" select="$target-atts"/>
            <xsl:with-param name="PI-data" select="substring-after($PI-data, '&#34; ')"/>
         </xsl:call-template>
      </xsl:if>
   </xsl:template>

   <xsl:template name="check-Profile-att">
      <xsl:param name="target-atts"/>
      <xsl:param name="PI-att"/>
      <xsl:for-each select="$target-atts">
         <xsl:if test="name()=$PI-att">
            <xsl:value-of select="name()"/>
            <xsl:text>="</xsl:text>
            <xsl:value-of select="string(current())"/>
            <xsl:text>" </xsl:text>
         </xsl:if>
      </xsl:for-each>
   </xsl:template>

   <xsl:template name="object.id">
      <xsl:param name="object" select="."/>
      <xsl:choose>
         <xsl:when test="$object/@id">
            <xsl:value-of select="$object/@id"/>
         </xsl:when>
         <xsl:otherwise>
            <xsl:value-of select="generate-id($object)"/>
         </xsl:otherwise>
      </xsl:choose>
   </xsl:template>

   <xsl:template match="processing-instruction('dbhtml')">
      <xsl:processing-instruction name="dbhtml">
         <xsl:value-of select="."/>
      </xsl:processing-instruction>
   </xsl:template>

   <xsl:template match="ch:*">
      <!-- Pass through ch:* elements -->
      <xsl:element name="{name(.)}">
         <xsl:copy-of select="@*"/>
         <xsl:apply-templates/>
      </xsl:element>
   </xsl:template>

   <!-- *** End of templates to aid in web publishing processing *** -->

   <xsl:param name="valid-lre-override-table">
      <xsl:text> hidden-block:div hidden-block:a hidden-inline:span hidden-block:a block:p block:div block:blockquote block:address formalBlock:p formalBlock:div formalBlock:blockquote formalBlock:address division:p division:div division:blockquote division:address paragraph-block:p paragraph-block:div paragraph-block:blockquote paragraph-block:address paragraph-inline:span paragraph-inline:q paragraph-inline:code paragraph-inline:cite paragraph:p paragraph:div paragraph:blockquote paragraph:address index:div tableOfContents:div document:body document:div page-sequence:body page-sequence:div definitionList:# definitionListItem:# definitionListDefinition:# definitionListTerm:# graphic-block:div graphic-inline:span link-block:div link-inline:a linkTarget-block:div bulletedList:ul bulletedList:div numberedList:ol numberedList:div listItem:# preformatted:# preformatted-block:# table:# title:h1 title:h2 title:h3 title:h4 title:h5 title:h6 title:div indexTermElementModel:# indexTermAttributeModel:# indexTermNestingElementModel:# footnoteOutOfLine:# footnote:# footnoteReference:# </xsl:text>
   </xsl:param>
   <xsl:param name="fo-class-fallback-lre-table">
      <xsl:text> hidden-block:div hidden-inline:span block:div formalBlock:div division:div paragraph-block:div paragraph-inline:span paragraph:div index:div tableOfContents:div document:body page-sequence:body definitionList:dl definitionListItem:# definitionListDefinition:dd definitionListTerm:dt graphic-block:div graphic-inline:span link-block:div link-inline:a linkTarget:span linkTarget-inline:span linkTarget-block:div inline:span bulletedList:ul bulletedList:div numberedList:ol numberedList:div listItem:li preformatted:pre preformatted-block:pre preformatted-inline:span table:# title:h3 indexTermElementModel:span indexTermAttributeModel:span indexTermNestingElementModel:span footnoteOutOfLine:# footnote:# footnoteReference:# </xsl:text>
   </xsl:param>
   <xsl:param name="inline-fo-classes-for-lre-override">
      <xsl:text> inline linkTarget-inline linkTarget preformatted-inline </xsl:text>
   </xsl:param>
   <xsl:param name="valid-inline-lre-override-table">
      <xsl:text> span tt i b u s strike big small em strong dfn code samp kbd var cite abbr acronym font q sub sup bdo </xsl:text>
   </xsl:param>
   <xsl:template name="determine-lre-override-name">
      <xsl:param name="given-lre-override-name"/>
      <xsl:param name="fo-class"/>
      <xsl:variable name="fallback-lre">
         <xsl:variable name="tmp"
            select="substring-after($fo-class-fallback-lre-table,concat(' ',$fo-class,':'))"/>
         <xsl:value-of select="substring-before($tmp,' ')"/>
      </xsl:variable>
      <xsl:choose>
         <xsl:when test="$given-lre-override-name=''">
            <xsl:value-of select="$fallback-lre"/>
         </xsl:when>
         <xsl:when test="contains($inline-fo-classes-for-lre-override,concat(' ',$fo-class,' '))">
            <xsl:choose>
               <xsl:when
                  test="contains($valid-inline-lre-override-table,concat(' ',$given-lre-override-name,' '))">
                  <xsl:value-of select="$given-lre-override-name"/>
               </xsl:when>
               <xsl:otherwise>
                  <xsl:value-of select="$fallback-lre"/>
               </xsl:otherwise>
            </xsl:choose>
         </xsl:when>
         <xsl:otherwise>
            <xsl:choose>
               <xsl:when test="contains($valid-lre-override-table,concat(' ',$fo-class,':','#'))">
                  <xsl:value-of select="$fallback-lre"/>
               </xsl:when>
               <xsl:when
                  test="contains($valid-lre-override-table,concat(' ',$fo-class,':','-',$given-lre-override-name,' '))">
                  <xsl:value-of select="$fallback-lre"/>
               </xsl:when>
               <xsl:when test="contains($valid-lre-override-table,concat(' ',$fo-class,':','*'))">
                  <xsl:value-of select="$given-lre-override-name"/>
               </xsl:when>
               <xsl:when
                  test="contains($valid-lre-override-table,concat(' ',$fo-class,':',$given-lre-override-name,' '))">
                  <xsl:value-of select="$given-lre-override-name"/>
               </xsl:when>
               <xsl:when test="not(contains($valid-lre-override-table,concat(' ',$fo-class,':')))">
                  <xsl:value-of select="$given-lre-override-name"/>
               </xsl:when>
               <xsl:otherwise>
                  <xsl:value-of select="$fallback-lre"/>
               </xsl:otherwise>
            </xsl:choose>
         </xsl:otherwise>
      </xsl:choose>
   </xsl:template>

   <xsl:attribute-set name="unstyled..basestyle">
      <xsl:attribute name="style">color: #0000FF; background-color: #FFC0CB</xsl:attribute>
   </xsl:attribute-set>

   <!-- *** Edited Source for the 'box' PropertySet follows ***-->
   <xsl:variable name="ps-box" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">background-color:
      #F0F0F0; border: thin solid; padding: 2pt; </xsl:variable>

   <!-- *** Edited Source for the 'double-underline' PropertySet follows ***-->
   <xsl:variable name="ps-double-underline">border-bottom: 0.2em double; </xsl:variable>

   <xsl:template name="ps-Footnote_font">font-family: serif; font-weight: normal; font-size: 12pt;
      font-style: normal; color: #000000; background-color: #FFFFFF; text-decoration: no-underline
      no-line-through; font-variant: normal; </xsl:template>

   <xsl:template name="ps-Index_grouphead_space">margin-bottom: .5pc; </xsl:template>

   <xsl:template name="ps-Index_group_space">margin-top: 1.5pc; </xsl:template>

   <xsl:template name="ps-Link">color: #0000FF; text-decoration: underline ; </xsl:template>

   <xsl:template name="ps-List_item_space">margin-top: 6pt; margin-bottom: 6pt; </xsl:template>

   <!-- *** Edited Source for the 'overline' PropertySet follows ***-->
   <xsl:variable name="ps-overline">text-decoration: overline; </xsl:variable>

   <xsl:template name="ps-overstrike-with-slash">text-decoration: line-through; </xsl:template>

   <xsl:template name="ps-Standard_space">margin-top: 8pt; </xsl:template>

   <xsl:template name="ps-Table_space">margin-top: 1.2em; </xsl:template>

   <xsl:template name="ps-Title_1">font-weight: bold; font-size: 20pt; </xsl:template>

   <xsl:template name="ps-Title_2">font-weight: bold; font-size: 18pt; </xsl:template>

   <xsl:template name="ps-Title_3">font-weight: bold; font-size: 16pt; </xsl:template>

   <xsl:template name="ps-Title_4">font-weight: bold; font-size: 14pt; </xsl:template>

   <xsl:template name="ps-Title_5">font-weight: bold; font-size: 12pt; </xsl:template>

   <xsl:template name="ps-Title_6">font-size: 12pt; </xsl:template>

   <xsl:template name="ps-Title_7">font-weight: bold; font-size: 12pt; </xsl:template>

   <xsl:template name="ps-Title_8">font-weight: bold; font-size: 12pt; </xsl:template>

   <xsl:template name="ps-Title_9">font-weight: bold; font-size: 12pt; </xsl:template>

   <xsl:template name="ps-Title_alignment">text-align: left; </xsl:template>

   <xsl:template name="ps-Title_color">color: #0000FF; </xsl:template>

   <xsl:template name="ps-Title_color_for_print">color: #0000FF; </xsl:template>

   <xsl:template name="ps-Title_font">font-family: sans-serif; </xsl:template>

   <xsl:template name="ps-Title_keeps"/>

   <xsl:template name="ps-Title_space">line-height: 1.1; margin-top: 1.5em; margin-bottom: 1em; </xsl:template>

   <!--Style template for Context: _sfe:BeforeOrAfterText-->
   <xsl:template name="__style-for__sfe-BeforeOrAfterText.1">
      <xsl:text> .x--sfe-BeforeOrAfterText-1-0 {margin-left: 0pt; margin-right: 0pt; }</xsl:text>
   </xsl:template>

   <!--Template for Context: _sfe:BeforeOrAfterText-->
   <xsl:template match="_sfe:BeforeOrAfterText" priority="0">
      <!--Emit a nostyle template-->
      <xsl:apply-templates/>
   </xsl:template>

   <!--Gentext template for Context: _sfe:BeforeOrAfterText-->
   <xsl:template match="_sfe:BeforeOrAfterText" mode="expand-gentext" priority="0">
      <xsl:copy>
         <xsl:apply-templates select="@*|node()" mode="expand-gentext"/>
      </xsl:copy>
   </xsl:template>

   <!--Set count-as pass template for Context: _sfe:BeforeOrAfterText-->
   <xsl:template match="_sfe:BeforeOrAfterText" mode="set-countas" priority="0">
      <xsl:copy>
         <xsl:apply-templates select="@*|node()" mode="set-countas"/>
      </xsl:copy>
   </xsl:template>

   <!--Style template for Context: _sfe:CollectionItem[1]-->
   <xsl:template name="__style-for__sfe-CollectionItem.4_sCoem221">
      <xsl:text> .x--sfe-CollectionItem-1-0 {margin-left: 0pt; margin-right: 0pt; }</xsl:text>
   </xsl:template>

   <!--Template for Context: _sfe:CollectionItem[1]-->
   <xsl:template match="_sfe:CollectionItem[1]" priority="3">
      <span>
         <!--Emit class values to reflect conditions-->
         <xsl:attribute name="class">
            <xsl:text> x--sfe-CollectionItem-1-0</xsl:text>
         </xsl:attribute>
         <xsl:if test="@xml:lang">
            <xsl:attribute name="lang">
               <xsl:call-template name="return-lang-applying-language-map">
                  <xsl:with-param name="doclang" select="@xml:lang"/>
               </xsl:call-template>
            </xsl:attribute>
         </xsl:if>
         <xsl:copy-of select="@ch:*"/>
         <xsl:copy-of xmlns:dmp="http://www.arbortext.com/namespace/dmp/dmpmap" select="@dmp:*"/>
         <xsl:if test="@xml:lang">
            <xsl:attribute name="lang">
               <xsl:call-template name="return-lang-applying-language-map">
                  <xsl:with-param name="doclang" select="@xml:lang"/>
               </xsl:call-template>
            </xsl:attribute>
         </xsl:if>
         <xsl:call-template name="maybe-set-id"/>
         <!--Process this element's content-->
         <xsl:apply-templates/>
      </span>
   </xsl:template>

   <!--Gentext template for Context: _sfe:CollectionItem[1]-->
   <xsl:template match="_sfe:CollectionItem[1]" mode="expand-gentext" priority="3">
      <xsl:copy>
         <xsl:apply-templates select="@*|node()" mode="expand-gentext"/>
      </xsl:copy>
   </xsl:template>

   <!--Set count-as pass template for Context: _sfe:CollectionItem[1]-->
   <xsl:template match="_sfe:CollectionItem[1]" mode="set-countas" priority="3">
      <xsl:copy>
         <xsl:apply-templates select="@*|node()" mode="set-countas"/>
      </xsl:copy>
   </xsl:template>

   <!--Style template for Context: _sfe:CollectionItem[position()>1 and not(position()=last())]-->
   <xsl:template name="__style-for__sfe-CollectionItem.4_sCoem602">
      <xsl:text> .x--sfe-CollectionItem-2-0 {margin-left: 0pt; margin-right: 0pt; }</xsl:text>
   </xsl:template>

   <!--Template for Context: _sfe:CollectionItem[position()>1 and not(position()=last())]-->
   <xsl:template match="_sfe:CollectionItem[position()&gt;1 and not(position()=last())]"
      priority="2">
      <span>
         <!--Emit class values to reflect conditions-->
         <xsl:attribute name="class">
            <xsl:text> x--sfe-CollectionItem-2-0</xsl:text>
         </xsl:attribute>
         <xsl:if test="@xml:lang">
            <xsl:attribute name="lang">
               <xsl:call-template name="return-lang-applying-language-map">
                  <xsl:with-param name="doclang" select="@xml:lang"/>
               </xsl:call-template>
            </xsl:attribute>
         </xsl:if>
         <xsl:copy-of select="@ch:*"/>
         <xsl:copy-of xmlns:dmp="http://www.arbortext.com/namespace/dmp/dmpmap" select="@dmp:*"/>
         <xsl:if test="@xml:lang">
            <xsl:attribute name="lang">
               <xsl:call-template name="return-lang-applying-language-map">
                  <xsl:with-param name="doclang" select="@xml:lang"/>
               </xsl:call-template>
            </xsl:attribute>
         </xsl:if>
         <xsl:call-template name="maybe-set-id"/>
         <!--Process this element's content-->
         <xsl:apply-templates/>
      </span>
   </xsl:template>

   <!--Gentext template for Context: _sfe:CollectionItem[position()>1 and not(position()=last())]-->
   <xsl:template match="_sfe:CollectionItem[position()&gt;1 and not(position()=last())]"
      mode="expand-gentext" priority="2">
      <xsl:copy>
         <xsl:attribute name="_gte:Gentext-Expanded">y</xsl:attribute>
         <xsl:apply-templates select="@*" mode="expand-gentext"/>
         <xsl:if test="not(@_gte:id)">
            <xsl:attribute name="_gte:id">
               <xsl:value-of select="'_g_'"/>
               <xsl:value-of select="generate-id(.)"/>
            </xsl:attribute>
         </xsl:if>
         <!--Unconditional AddBefore-->
         <xsl:if test="not(@_gte:Gentext-Expanded)">
            <_sfe:BeforeOrAfterText>
               <xsl:text>, </xsl:text>
            </_sfe:BeforeOrAfterText>
         </xsl:if>
         <xsl:apply-templates select="* | text() | processing-instruction()" mode="expand-gentext"/>
      </xsl:copy>
   </xsl:template>

   <!--Set count-as pass template for Context: _sfe:CollectionItem[position()>1 and not(position()=last())]-->
   <xsl:template match="_sfe:CollectionItem[position()&gt;1 and not(position()=last())]"
      mode="set-countas" priority="2">
      <xsl:copy>
         <xsl:apply-templates select="@*|node()" mode="set-countas"/>
      </xsl:copy>
   </xsl:template>

   <!--Style template for Context: _sfe:CollectionItem[last()]-->
   <xsl:template name="__style-for__sfe-CollectionItem.4_sCoem273">
      <xsl:text> .x--sfe-CollectionItem-3-0 {margin-left: 0pt; margin-right: 0pt; }</xsl:text>
   </xsl:template>

   <!--Template for Context: _sfe:CollectionItem[last()]-->
   <xsl:template match="_sfe:CollectionItem[last()]" priority="1">
      <span>
         <!--Emit class values to reflect conditions-->
         <xsl:attribute name="class">
            <xsl:text> x--sfe-CollectionItem-3-0</xsl:text>
         </xsl:attribute>
         <xsl:if test="@xml:lang">
            <xsl:attribute name="lang">
               <xsl:call-template name="return-lang-applying-language-map">
                  <xsl:with-param name="doclang" select="@xml:lang"/>
               </xsl:call-template>
            </xsl:attribute>
         </xsl:if>
         <xsl:copy-of select="@ch:*"/>
         <xsl:copy-of xmlns:dmp="http://www.arbortext.com/namespace/dmp/dmpmap" select="@dmp:*"/>
         <xsl:if test="@xml:lang">
            <xsl:attribute name="lang">
               <xsl:call-template name="return-lang-applying-language-map">
                  <xsl:with-param name="doclang" select="@xml:lang"/>
               </xsl:call-template>
            </xsl:attribute>
         </xsl:if>
         <xsl:call-template name="maybe-set-id"/>
         <!--Process this element's content-->
         <xsl:apply-templates/>
      </span>
   </xsl:template>

   <!--Gentext template for Context: _sfe:CollectionItem[last()]-->
   <xsl:template match="_sfe:CollectionItem[last()]" mode="expand-gentext" priority="1">
      <xsl:copy>
         <xsl:attribute name="_gte:Gentext-Expanded">y</xsl:attribute>
         <xsl:apply-templates select="@*" mode="expand-gentext"/>
         <xsl:if test="not(@_gte:id)">
            <xsl:attribute name="_gte:id">
               <xsl:value-of select="'_g_'"/>
               <xsl:value-of select="generate-id(.)"/>
            </xsl:attribute>
         </xsl:if>
         <!--Unconditional AddBefore-->
         <xsl:if test="not(@_gte:Gentext-Expanded)">
            <_sfe:BeforeOrAfterText>
               <xsl:text>, and </xsl:text>
            </_sfe:BeforeOrAfterText>
         </xsl:if>
         <xsl:apply-templates select="* | text() | processing-instruction()" mode="expand-gentext"/>
      </xsl:copy>
   </xsl:template>

   <!--Set count-as pass template for Context: _sfe:CollectionItem[last()]-->
   <xsl:template match="_sfe:CollectionItem[last()]" mode="set-countas" priority="1">
      <xsl:copy>
         <xsl:apply-templates select="@*|node()" mode="set-countas"/>
      </xsl:copy>
   </xsl:template>

   <!--Style template for Context: _sfe:CollectionItem-->
   <xsl:template name="__style-for__sfe-CollectionItem.4_sCoem194">
      <xsl:text> .x--sfe-CollectionItem-4-0 {margin-left: 0pt; margin-right: 0pt; }</xsl:text>
   </xsl:template>

   <!--Template for Context: _sfe:CollectionItem-->
   <xsl:template match="_sfe:CollectionItem" priority="0">
      <span>
         <!--Emit class values to reflect conditions-->
         <xsl:attribute name="class">
            <xsl:text> x--sfe-CollectionItem-4-0</xsl:text>
         </xsl:attribute>
         <xsl:if test="@xml:lang">
            <xsl:attribute name="lang">
               <xsl:call-template name="return-lang-applying-language-map">
                  <xsl:with-param name="doclang" select="@xml:lang"/>
               </xsl:call-template>
            </xsl:attribute>
         </xsl:if>
         <xsl:copy-of select="@ch:*"/>
         <xsl:copy-of xmlns:dmp="http://www.arbortext.com/namespace/dmp/dmpmap" select="@dmp:*"/>
         <xsl:if test="@xml:lang">
            <xsl:attribute name="lang">
               <xsl:call-template name="return-lang-applying-language-map">
                  <xsl:with-param name="doclang" select="@xml:lang"/>
               </xsl:call-template>
            </xsl:attribute>
         </xsl:if>
         <xsl:call-template name="maybe-set-id"/>
         <!--Process this element's content-->
         <xsl:apply-templates/>
      </span>
   </xsl:template>

   <!--Gentext template for Context: _sfe:CollectionItem-->
   <xsl:template match="_sfe:CollectionItem" mode="expand-gentext" priority="0">
      <xsl:copy>
         <xsl:apply-templates select="@*|node()" mode="expand-gentext"/>
      </xsl:copy>
   </xsl:template>

   <!--Set count-as pass template for Context: _sfe:CollectionItem-->
   <xsl:template match="_sfe:CollectionItem" mode="set-countas" priority="0">
      <xsl:copy>
         <xsl:apply-templates select="@*|node()" mode="set-countas"/>
      </xsl:copy>
   </xsl:template>

   <!--Style template for Context: _sfe:CrossReference-->
   <xsl:template name="__style-for__sfe-CrossReference.1">
      <xsl:text> .x--sfe-CrossReference-1-0 {margin-left: 0pt; margin-right: 0pt; }</xsl:text>
   </xsl:template>

   <!--Template for Context: _sfe:CrossReference-->
   <xsl:template match="_sfe:CrossReference" priority="0">
      <span>
         <!--Emit class values to reflect conditions-->
         <xsl:attribute name="class">
            <xsl:text> x--sfe-CrossReference-1-0</xsl:text>
         </xsl:attribute>
         <xsl:if test="@xml:lang">
            <xsl:attribute name="lang">
               <xsl:call-template name="return-lang-applying-language-map">
                  <xsl:with-param name="doclang" select="@xml:lang"/>
               </xsl:call-template>
            </xsl:attribute>
         </xsl:if>
         <xsl:copy-of select="@ch:*"/>
         <xsl:copy-of xmlns:dmp="http://www.arbortext.com/namespace/dmp/dmpmap" select="@dmp:*"/>
         <xsl:if test="@xml:lang">
            <xsl:attribute name="lang">
               <xsl:call-template name="return-lang-applying-language-map">
                  <xsl:with-param name="doclang" select="@xml:lang"/>
               </xsl:call-template>
            </xsl:attribute>
         </xsl:if>
         <xsl:call-template name="maybe-set-id"/>
         <!--Process this element's content-->
         <xsl:apply-templates/>
      </span>
   </xsl:template>

   <!--Gentext template for Context: _sfe:CrossReference-->
   <xsl:template match="_sfe:CrossReference" mode="expand-gentext" priority="0">
      <xsl:copy>
         <xsl:apply-templates select="@*|node()" mode="expand-gentext"/>
      </xsl:copy>
   </xsl:template>

   <!--Set count-as pass template for Context: _sfe:CrossReference-->
   <xsl:template match="_sfe:CrossReference" mode="set-countas" priority="0">
      <xsl:copy>
         <xsl:apply-templates select="@*|node()" mode="set-countas"/>
      </xsl:copy>
   </xsl:template>

   <!--Style template for Context: _sfe:HeaderOrFooter//_sfe:CrossReferenceTitle-->
   <xsl:template name="__style-for__sfe-CrossReferenceTitle.2_sHele451">
      <xsl:text> .x--sfe-CrossReferenceTitle-1-0 {margin-left: 0pt; margin-right: 0pt; }</xsl:text>
   </xsl:template>

   <!--Template for Context: _sfe:HeaderOrFooter//_sfe:CrossReferenceTitle-->
   <xsl:template match="_sfe:HeaderOrFooter//_sfe:CrossReferenceTitle" priority="1">
      <span>
         <!--Emit class values to reflect conditions-->
         <xsl:attribute name="class">
            <xsl:text> x--sfe-CrossReferenceTitle-1-0</xsl:text>
         </xsl:attribute>
         <xsl:if test="@xml:lang">
            <xsl:attribute name="lang">
               <xsl:call-template name="return-lang-applying-language-map">
                  <xsl:with-param name="doclang" select="@xml:lang"/>
               </xsl:call-template>
            </xsl:attribute>
         </xsl:if>
         <xsl:copy-of select="@ch:*"/>
         <xsl:copy-of xmlns:dmp="http://www.arbortext.com/namespace/dmp/dmpmap" select="@dmp:*"/>
         <xsl:if test="@xml:lang">
            <xsl:attribute name="lang">
               <xsl:call-template name="return-lang-applying-language-map">
                  <xsl:with-param name="doclang" select="@xml:lang"/>
               </xsl:call-template>
            </xsl:attribute>
         </xsl:if>
         <xsl:call-template name="maybe-set-id"/>
         <!--Process this element's content-->
         <xsl:apply-templates/>
      </span>
   </xsl:template>

   <!--Gentext template for Context: _sfe:HeaderOrFooter//_sfe:CrossReferenceTitle-->
   <xsl:template match="_sfe:HeaderOrFooter//_sfe:CrossReferenceTitle" mode="expand-gentext"
      priority="1">
      <xsl:copy>
         <xsl:apply-templates select="@*|node()" mode="expand-gentext"/>
      </xsl:copy>
   </xsl:template>

   <!--Set count-as pass template for Context: _sfe:HeaderOrFooter//_sfe:CrossReferenceTitle-->
   <xsl:template match="_sfe:HeaderOrFooter//_sfe:CrossReferenceTitle" mode="set-countas"
      priority="1">
      <xsl:copy>
         <xsl:apply-templates select="@*|node()" mode="set-countas"/>
      </xsl:copy>
   </xsl:template>

   <!--Style template for Context: _sfe:CrossReferenceTitle-->
   <xsl:template name="__style-for__sfe-CrossReferenceTitle.2_sCrle242">
      <xsl:text> .x--sfe-CrossReferenceTitle-2-0 {margin-left: 0pt; margin-right: 0pt; font-style: italic; }</xsl:text>
   </xsl:template>

   <!--Template for Context: _sfe:CrossReferenceTitle-->
   <xsl:template match="_sfe:CrossReferenceTitle" priority="0">
      <span>
         <!--Emit class values to reflect conditions-->
         <xsl:attribute name="class">
            <xsl:text> x--sfe-CrossReferenceTitle-2-0</xsl:text>
         </xsl:attribute>
         <xsl:if test="@xml:lang">
            <xsl:attribute name="lang">
               <xsl:call-template name="return-lang-applying-language-map">
                  <xsl:with-param name="doclang" select="@xml:lang"/>
               </xsl:call-template>
            </xsl:attribute>
         </xsl:if>
         <xsl:copy-of select="@ch:*"/>
         <xsl:copy-of xmlns:dmp="http://www.arbortext.com/namespace/dmp/dmpmap" select="@dmp:*"/>
         <xsl:if test="@xml:lang">
            <xsl:attribute name="lang">
               <xsl:call-template name="return-lang-applying-language-map">
                  <xsl:with-param name="doclang" select="@xml:lang"/>
               </xsl:call-template>
            </xsl:attribute>
         </xsl:if>
         <xsl:call-template name="maybe-set-id"/>
         <!--Process this element's content-->
         <xsl:apply-templates/>
      </span>
   </xsl:template>

   <!--Gentext template for Context: _sfe:CrossReferenceTitle-->
   <xsl:template match="_sfe:CrossReferenceTitle" mode="expand-gentext" priority="0">
      <xsl:copy>
         <xsl:apply-templates select="@*|node()" mode="expand-gentext"/>
      </xsl:copy>
   </xsl:template>

   <!--Set count-as pass template for Context: _sfe:CrossReferenceTitle-->
   <xsl:template match="_sfe:CrossReferenceTitle" mode="set-countas" priority="0">
      <xsl:copy>
         <xsl:apply-templates select="@*|node()" mode="set-countas"/>
      </xsl:copy>
   </xsl:template>

   <!--Style template for Context: _sfe:ExternalLink-->
   <xsl:template name="__style-for__sfe-ExternalLink.1">
      <xsl:text> .x--sfe-ExternalLink-1-0 {margin-left: 0pt; margin-right: 0pt; color: #0000FF; text-decoration: underline ; }</xsl:text>
   </xsl:template>

   <!--Template for Context: _sfe:ExternalLink-->
   <xsl:template match="_sfe:ExternalLink" priority="0">
      <a>
         <!--Emit class values to reflect conditions-->
         <xsl:attribute name="class">
            <xsl:text> x--sfe-ExternalLink-1-0</xsl:text>
         </xsl:attribute>
         <xsl:if test="@href">
            <xsl:attribute name="href">
               <xsl:value-of select="@href"/>
            </xsl:attribute>
         </xsl:if>
         <xsl:if test="@xml:lang">
            <xsl:attribute name="lang">
               <xsl:call-template name="return-lang-applying-language-map">
                  <xsl:with-param name="doclang" select="@xml:lang"/>
               </xsl:call-template>
            </xsl:attribute>
         </xsl:if>
         <xsl:copy-of select="@ch:*"/>
         <xsl:copy-of xmlns:dmp="http://www.arbortext.com/namespace/dmp/dmpmap" select="@dmp:*"/>
         <xsl:if test="@xml:lang">
            <xsl:attribute name="lang">
               <xsl:call-template name="return-lang-applying-language-map">
                  <xsl:with-param name="doclang" select="@xml:lang"/>
               </xsl:call-template>
            </xsl:attribute>
         </xsl:if>
         <xsl:call-template name="maybe-set-id"/>
         <!--Process this element's content-->
         <xsl:apply-templates/>
      </a>
   </xsl:template>

   <!--Gentext template for Context: _sfe:ExternalLink-->
   <xsl:template match="_sfe:ExternalLink" mode="expand-gentext" priority="0">
      <xsl:copy>
         <xsl:apply-templates select="@*|node()" mode="expand-gentext"/>
      </xsl:copy>
   </xsl:template>

   <!--Set count-as pass template for Context: _sfe:ExternalLink-->
   <xsl:template match="_sfe:ExternalLink" mode="set-countas" priority="0">
      <xsl:copy>
         <xsl:apply-templates select="@*|node()" mode="set-countas"/>
      </xsl:copy>
   </xsl:template>

   <!--Style template for Context: _sfe:Gentext-->
   <xsl:template name="__style-for__sfe-Gentext.1">
      <xsl:text> .x--sfe-Gentext-1-0 {margin-left: 0pt; margin-right: 0pt; }</xsl:text>
   </xsl:template>

   <!--Template for Context: _sfe:Gentext-->
   <xsl:template match="_sfe:Gentext" priority="0">
      <!--Emit a nostyle template-->
      <xsl:apply-templates/>
   </xsl:template>

   <!--Gentext template for Context: _sfe:Gentext-->
   <xsl:template match="_sfe:Gentext" mode="expand-gentext" priority="0">
      <xsl:copy>
         <xsl:apply-templates select="@*|node()" mode="expand-gentext"/>
      </xsl:copy>
   </xsl:template>

   <!--Set count-as pass template for Context: _sfe:Gentext-->
   <xsl:template match="_sfe:Gentext" mode="set-countas" priority="0">
      <xsl:copy>
         <xsl:apply-templates select="@*|node()" mode="set-countas"/>
      </xsl:copy>
   </xsl:template>

   <!--Style template for Context: _sfe:HeaderOrFooter-->
   <xsl:template name="__style-for__sfe-HeaderOrFooter.1">
      <xsl:text> .x--sfe-HeaderOrFooter-1-0 {margin-left: 0pt; margin-right: 0pt; text-indent: 0pt; margin-top: 0pt; }</xsl:text>
   </xsl:template>

   <!--Template for Context: _sfe:HeaderOrFooter-->
   <xsl:template match="_sfe:HeaderOrFooter" priority="0">
      <div>
         <!--Emit class values to reflect conditions-->
         <xsl:attribute name="class">
            <xsl:text> x--sfe-HeaderOrFooter-1-0</xsl:text>
         </xsl:attribute>
         <xsl:if test="@xml:lang">
            <xsl:attribute name="lang">
               <xsl:call-template name="return-lang-applying-language-map">
                  <xsl:with-param name="doclang" select="@xml:lang"/>
               </xsl:call-template>
            </xsl:attribute>
         </xsl:if>
         <xsl:copy-of select="@ch:*"/>
         <xsl:copy-of xmlns:dmp="http://www.arbortext.com/namespace/dmp/dmpmap" select="@dmp:*"/>
         <xsl:if test="@xml:lang">
            <xsl:attribute name="lang">
               <xsl:call-template name="return-lang-applying-language-map">
                  <xsl:with-param name="doclang" select="@xml:lang"/>
               </xsl:call-template>
            </xsl:attribute>
         </xsl:if>
         <xsl:call-template name="maybe-set-id"/>
         <!--Process this element's content-->
         <xsl:apply-templates/>
      </div>
   </xsl:template>

   <!--Gentext template for Context: _sfe:HeaderOrFooter-->
   <xsl:template match="_sfe:HeaderOrFooter" mode="expand-gentext" priority="0">
      <xsl:copy>
         <xsl:apply-templates select="@*|node()" mode="expand-gentext"/>
      </xsl:copy>
   </xsl:template>

   <!--Set count-as pass template for Context: _sfe:HeaderOrFooter-->
   <xsl:template match="_sfe:HeaderOrFooter" mode="set-countas" priority="0">
      <xsl:copy>
         <xsl:apply-templates select="@*|node()" mode="set-countas"/>
      </xsl:copy>
   </xsl:template>

   <!--Style template for Context: _sfe:Index-->
   <xsl:template name="__style-for__sfe-Index.1">
      <xsl:text> .x--sfe-Index-1-0 {margin-left: 0pt; margin-right: 0pt; text-indent: 0pt; }</xsl:text>
   </xsl:template>

   <!--Template for Context: _sfe:Index-->
   <xsl:template match="_sfe:Index" priority="0">
      <div>
         <!--Emit class values to reflect conditions-->
         <xsl:attribute name="class">
            <xsl:text> x--sfe-Index-1-0</xsl:text>
         </xsl:attribute>
         <xsl:if test="@xml:lang">
            <xsl:attribute name="lang">
               <xsl:call-template name="return-lang-applying-language-map">
                  <xsl:with-param name="doclang" select="@xml:lang"/>
               </xsl:call-template>
            </xsl:attribute>
         </xsl:if>
         <xsl:copy-of select="@ch:*"/>
         <xsl:copy-of xmlns:dmp="http://www.arbortext.com/namespace/dmp/dmpmap" select="@dmp:*"/>
         <xsl:if test="@xml:lang">
            <xsl:attribute name="lang">
               <xsl:call-template name="return-lang-applying-language-map">
                  <xsl:with-param name="doclang" select="@xml:lang"/>
               </xsl:call-template>
            </xsl:attribute>
         </xsl:if>
         <xsl:call-template name="maybe-set-id"/>
         <!--Process this element's content-->
         <xsl:apply-templates/>
      </div>
   </xsl:template>

   <!--Gentext template for Context: _sfe:Index-->
   <xsl:template match="_sfe:Index" mode="expand-gentext" priority="0">
      <xsl:copy>
         <xsl:apply-templates select="@*|node()" mode="expand-gentext"/>
      </xsl:copy>
   </xsl:template>

   <!--Set count-as pass template for Context: _sfe:Index-->
   <xsl:template match="_sfe:Index" mode="set-countas" priority="0">
      <xsl:copy>
         <xsl:apply-templates select="@*|node()" mode="set-countas"/>
      </xsl:copy>
   </xsl:template>

   <!--Style template for Context: _sfe:IndexAlphaGroup-->
   <xsl:template name="__style-for__sfe-IndexAlphaGroup.1">
      <xsl:text> .x--sfe-IndexAlphaGroup-1-0 {margin-left: 0pt; margin-right: 0pt; text-indent: 0pt; margin-top: 1.5pc; }</xsl:text>
   </xsl:template>

   <!--Template for Context: _sfe:IndexAlphaGroup-->
   <xsl:template match="_sfe:IndexAlphaGroup" priority="0">
      <div>
         <!--Emit class values to reflect conditions-->
         <xsl:attribute name="class">
            <xsl:text> x--sfe-IndexAlphaGroup-1-0</xsl:text>
         </xsl:attribute>
         <xsl:if test="@xml:lang">
            <xsl:attribute name="lang">
               <xsl:call-template name="return-lang-applying-language-map">
                  <xsl:with-param name="doclang" select="@xml:lang"/>
               </xsl:call-template>
            </xsl:attribute>
         </xsl:if>
         <xsl:copy-of select="@ch:*"/>
         <xsl:copy-of xmlns:dmp="http://www.arbortext.com/namespace/dmp/dmpmap" select="@dmp:*"/>
         <xsl:if test="@xml:lang">
            <xsl:attribute name="lang">
               <xsl:call-template name="return-lang-applying-language-map">
                  <xsl:with-param name="doclang" select="@xml:lang"/>
               </xsl:call-template>
            </xsl:attribute>
         </xsl:if>
         <xsl:call-template name="maybe-set-id"/>
         <!--Process this element's content-->
         <xsl:apply-templates/>
      </div>
   </xsl:template>

   <!--Gentext template for Context: _sfe:IndexAlphaGroup-->
   <xsl:template match="_sfe:IndexAlphaGroup" mode="expand-gentext" priority="0">
      <xsl:copy>
         <xsl:apply-templates select="@*|node()" mode="expand-gentext"/>
      </xsl:copy>
   </xsl:template>

   <!--Set count-as pass template for Context: _sfe:IndexAlphaGroup-->
   <xsl:template match="_sfe:IndexAlphaGroup" mode="set-countas" priority="0">
      <xsl:copy>
         <xsl:apply-templates select="@*|node()" mode="set-countas"/>
      </xsl:copy>
   </xsl:template>

   <!--Style template for Context: _sfe:IndexEndPage-->
   <xsl:template name="__style-for__sfe-IndexEndPage.1">
      <xsl:text> .x--sfe-IndexEndPage-1-0 {margin-left: 0pt; margin-right: 0pt; }</xsl:text>
   </xsl:template>

   <!--Template for Context: _sfe:IndexEndPage-->
   <xsl:template match="_sfe:IndexEndPage" priority="0">
      <span>
         <!--Emit class values to reflect conditions-->
         <xsl:attribute name="class">
            <xsl:text> x--sfe-IndexEndPage-1-0</xsl:text>
         </xsl:attribute>
         <xsl:if test="@xml:lang">
            <xsl:attribute name="lang">
               <xsl:call-template name="return-lang-applying-language-map">
                  <xsl:with-param name="doclang" select="@xml:lang"/>
               </xsl:call-template>
            </xsl:attribute>
         </xsl:if>
         <xsl:copy-of select="@ch:*"/>
         <xsl:copy-of xmlns:dmp="http://www.arbortext.com/namespace/dmp/dmpmap" select="@dmp:*"/>
         <xsl:if test="@xml:lang">
            <xsl:attribute name="lang">
               <xsl:call-template name="return-lang-applying-language-map">
                  <xsl:with-param name="doclang" select="@xml:lang"/>
               </xsl:call-template>
            </xsl:attribute>
         </xsl:if>
         <xsl:call-template name="maybe-set-id"/>
         <!--Process this element's content-->
         <xsl:apply-templates/>
      </span>
   </xsl:template>

   <!--Gentext template for Context: _sfe:IndexEndPage-->
   <xsl:template match="_sfe:IndexEndPage" mode="expand-gentext" priority="0">
      <xsl:copy>
         <xsl:attribute name="_gte:Gentext-Expanded">y</xsl:attribute>
         <xsl:apply-templates select="@*" mode="expand-gentext"/>
         <xsl:if test="not(@_gte:id)">
            <xsl:attribute name="_gte:id">
               <xsl:value-of select="'_g_'"/>
               <xsl:value-of select="generate-id(.)"/>
            </xsl:attribute>
         </xsl:if>
         <!--Unconditional AddBefore-->
         <xsl:if test="not(@_gte:Gentext-Expanded)">
            <_sfe:BeforeOrAfterText>
               <xsl:text>–</xsl:text>
            </_sfe:BeforeOrAfterText>
         </xsl:if>
         <xsl:apply-templates select="* | text() | processing-instruction()" mode="expand-gentext"/>
      </xsl:copy>
   </xsl:template>

   <!--Set count-as pass template for Context: _sfe:IndexEndPage-->
   <xsl:template match="_sfe:IndexEndPage" mode="set-countas" priority="0">
      <xsl:copy>
         <xsl:apply-templates select="@*|node()" mode="set-countas"/>
      </xsl:copy>
   </xsl:template>

   <!--Style template for Context: _sfe:IndexEntry/_sfe:IndexEntry/_sfe:IndexEntry/_sfe:IndexEntry-->
   <xsl:template name="__style-for__sfe-IndexEntry.4_sInry631">
      <xsl:text> .x--sfe-IndexEntry-1-0 {margin-left: 0pt; margin-right: 0pt; text-indent: 0pt; margin-left: 1em; text-indent: -.5em; text-align: left; }</xsl:text>
   </xsl:template>

   <!--Template for Context: _sfe:IndexEntry/_sfe:IndexEntry/_sfe:IndexEntry/_sfe:IndexEntry-->
   <xsl:template match="_sfe:IndexEntry/_sfe:IndexEntry/_sfe:IndexEntry/_sfe:IndexEntry"
      priority="3">
      <div>
         <!--Emit class values to reflect conditions-->
         <xsl:attribute name="class">
            <xsl:text> x--sfe-IndexEntry-1-0</xsl:text>
         </xsl:attribute>
         <xsl:if test="@xml:lang">
            <xsl:attribute name="lang">
               <xsl:call-template name="return-lang-applying-language-map">
                  <xsl:with-param name="doclang" select="@xml:lang"/>
               </xsl:call-template>
            </xsl:attribute>
         </xsl:if>
         <xsl:copy-of select="@ch:*"/>
         <xsl:copy-of xmlns:dmp="http://www.arbortext.com/namespace/dmp/dmpmap" select="@dmp:*"/>
         <xsl:if test="@xml:lang">
            <xsl:attribute name="lang">
               <xsl:call-template name="return-lang-applying-language-map">
                  <xsl:with-param name="doclang" select="@xml:lang"/>
               </xsl:call-template>
            </xsl:attribute>
         </xsl:if>
         <xsl:call-template name="maybe-set-id"/>
         <!--Process this element's content-->
         <xsl:apply-templates/>
      </div>
   </xsl:template>

   <!--Gentext template for Context: _sfe:IndexEntry/_sfe:IndexEntry/_sfe:IndexEntry/_sfe:IndexEntry-->
   <xsl:template match="_sfe:IndexEntry/_sfe:IndexEntry/_sfe:IndexEntry/_sfe:IndexEntry"
      mode="expand-gentext" priority="3">
      <xsl:copy>
         <xsl:apply-templates select="@*|node()" mode="expand-gentext"/>
      </xsl:copy>
   </xsl:template>

   <!--Set count-as pass template for Context: _sfe:IndexEntry/_sfe:IndexEntry/_sfe:IndexEntry/_sfe:IndexEntry-->
   <xsl:template match="_sfe:IndexEntry/_sfe:IndexEntry/_sfe:IndexEntry/_sfe:IndexEntry"
      mode="set-countas" priority="3">
      <xsl:copy>
         <xsl:apply-templates select="@*|node()" mode="set-countas"/>
      </xsl:copy>
   </xsl:template>

   <!--Style template for Context: _sfe:IndexEntry/_sfe:IndexEntry/_sfe:IndexEntry-->
   <xsl:template name="__style-for__sfe-IndexEntry.4_sInry472">
      <xsl:text> .x--sfe-IndexEntry-2-0 {margin-left: 0pt; margin-right: 0pt; text-indent: 0pt; margin-left: 1em; text-indent: -.5em; text-align: left; }</xsl:text>
   </xsl:template>

   <!--Template for Context: _sfe:IndexEntry/_sfe:IndexEntry/_sfe:IndexEntry-->
   <xsl:template match="_sfe:IndexEntry/_sfe:IndexEntry/_sfe:IndexEntry" priority="2">
      <div>
         <!--Emit class values to reflect conditions-->
         <xsl:attribute name="class">
            <xsl:text> x--sfe-IndexEntry-2-0</xsl:text>
         </xsl:attribute>
         <xsl:if test="@xml:lang">
            <xsl:attribute name="lang">
               <xsl:call-template name="return-lang-applying-language-map">
                  <xsl:with-param name="doclang" select="@xml:lang"/>
               </xsl:call-template>
            </xsl:attribute>
         </xsl:if>
         <xsl:copy-of select="@ch:*"/>
         <xsl:copy-of xmlns:dmp="http://www.arbortext.com/namespace/dmp/dmpmap" select="@dmp:*"/>
         <xsl:if test="@xml:lang">
            <xsl:attribute name="lang">
               <xsl:call-template name="return-lang-applying-language-map">
                  <xsl:with-param name="doclang" select="@xml:lang"/>
               </xsl:call-template>
            </xsl:attribute>
         </xsl:if>
         <xsl:call-template name="maybe-set-id"/>
         <!--Process this element's content-->
         <xsl:apply-templates/>
      </div>
   </xsl:template>

   <!--Gentext template for Context: _sfe:IndexEntry/_sfe:IndexEntry/_sfe:IndexEntry-->
   <xsl:template match="_sfe:IndexEntry/_sfe:IndexEntry/_sfe:IndexEntry" mode="expand-gentext"
      priority="2">
      <xsl:copy>
         <xsl:apply-templates select="@*|node()" mode="expand-gentext"/>
      </xsl:copy>
   </xsl:template>

   <!--Set count-as pass template for Context: _sfe:IndexEntry/_sfe:IndexEntry/_sfe:IndexEntry-->
   <xsl:template match="_sfe:IndexEntry/_sfe:IndexEntry/_sfe:IndexEntry" mode="set-countas"
      priority="2">
      <xsl:copy>
         <xsl:apply-templates select="@*|node()" mode="set-countas"/>
      </xsl:copy>
   </xsl:template>

   <!--Style template for Context: _sfe:IndexEntry/_sfe:IndexEntry-->
   <xsl:template name="__style-for__sfe-IndexEntry.4_sInry313">
      <xsl:text> .x--sfe-IndexEntry-3-0 {margin-left: 0pt; margin-right: 0pt; text-indent: 0pt; margin-left: 1em; text-indent: -.5em; text-align: left; }</xsl:text>
   </xsl:template>

   <!--Template for Context: _sfe:IndexEntry/_sfe:IndexEntry-->
   <xsl:template match="_sfe:IndexEntry/_sfe:IndexEntry" priority="1">
      <div>
         <!--Emit class values to reflect conditions-->
         <xsl:attribute name="class">
            <xsl:text> x--sfe-IndexEntry-3-0</xsl:text>
         </xsl:attribute>
         <xsl:if test="@xml:lang">
            <xsl:attribute name="lang">
               <xsl:call-template name="return-lang-applying-language-map">
                  <xsl:with-param name="doclang" select="@xml:lang"/>
               </xsl:call-template>
            </xsl:attribute>
         </xsl:if>
         <xsl:copy-of select="@ch:*"/>
         <xsl:copy-of xmlns:dmp="http://www.arbortext.com/namespace/dmp/dmpmap" select="@dmp:*"/>
         <xsl:if test="@xml:lang">
            <xsl:attribute name="lang">
               <xsl:call-template name="return-lang-applying-language-map">
                  <xsl:with-param name="doclang" select="@xml:lang"/>
               </xsl:call-template>
            </xsl:attribute>
         </xsl:if>
         <xsl:call-template name="maybe-set-id"/>
         <!--Process this element's content-->
         <xsl:apply-templates/>
      </div>
   </xsl:template>

   <!--Gentext template for Context: _sfe:IndexEntry/_sfe:IndexEntry-->
   <xsl:template match="_sfe:IndexEntry/_sfe:IndexEntry" mode="expand-gentext" priority="1">
      <xsl:copy>
         <xsl:apply-templates select="@*|node()" mode="expand-gentext"/>
      </xsl:copy>
   </xsl:template>

   <!--Set count-as pass template for Context: _sfe:IndexEntry/_sfe:IndexEntry-->
   <xsl:template match="_sfe:IndexEntry/_sfe:IndexEntry" mode="set-countas" priority="1">
      <xsl:copy>
         <xsl:apply-templates select="@*|node()" mode="set-countas"/>
      </xsl:copy>
   </xsl:template>

   <!--Style template for Context: _sfe:IndexEntry-->
   <xsl:template name="__style-for__sfe-IndexEntry.4_sInry154">
      <xsl:text> .x--sfe-IndexEntry-4-0 {margin-left: 0pt; margin-right: 0pt; text-indent: 0pt; margin-left: .5em; margin-right: 2pc; text-indent: -.5em; text-align: left; }</xsl:text>
   </xsl:template>

   <!--Template for Context: _sfe:IndexEntry-->
   <xsl:template match="_sfe:IndexEntry" priority="0">
      <div>
         <!--Emit class values to reflect conditions-->
         <xsl:attribute name="class">
            <xsl:text> x--sfe-IndexEntry-4-0</xsl:text>
         </xsl:attribute>
         <xsl:if test="@xml:lang">
            <xsl:attribute name="lang">
               <xsl:call-template name="return-lang-applying-language-map">
                  <xsl:with-param name="doclang" select="@xml:lang"/>
               </xsl:call-template>
            </xsl:attribute>
         </xsl:if>
         <xsl:copy-of select="@ch:*"/>
         <xsl:copy-of xmlns:dmp="http://www.arbortext.com/namespace/dmp/dmpmap" select="@dmp:*"/>
         <xsl:if test="@xml:lang">
            <xsl:attribute name="lang">
               <xsl:call-template name="return-lang-applying-language-map">
                  <xsl:with-param name="doclang" select="@xml:lang"/>
               </xsl:call-template>
            </xsl:attribute>
         </xsl:if>
         <xsl:call-template name="maybe-set-id"/>
         <!--Process this element's content-->
         <xsl:apply-templates/>
      </div>
   </xsl:template>

   <!--Gentext template for Context: _sfe:IndexEntry-->
   <xsl:template match="_sfe:IndexEntry" mode="expand-gentext" priority="0">
      <xsl:copy>
         <xsl:apply-templates select="@*|node()" mode="expand-gentext"/>
      </xsl:copy>
   </xsl:template>

   <!--Set count-as pass template for Context: _sfe:IndexEntry-->
   <xsl:template match="_sfe:IndexEntry" mode="set-countas" priority="0">
      <xsl:copy>
         <xsl:apply-templates select="@*|node()" mode="set-countas"/>
      </xsl:copy>
   </xsl:template>

   <!--Style template for Context: _sfe:IndexGroupHead-->
   <xsl:template name="__style-for__sfe-IndexGroupHead.1">
      <xsl:text> .x--sfe-IndexGroupHead-1-0 {margin-left: 0pt; margin-right: 0pt; text-indent: 0pt; font-family: sans-serif; font-weight: bold; font-size: 14pt; text-transform: uppercase; text-align: left; margin-bottom: .5pc; }</xsl:text>
   </xsl:template>

   <!--Template for Context: _sfe:IndexGroupHead-->
   <xsl:template match="_sfe:IndexGroupHead" priority="0">
      <div>
         <!--Emit class values to reflect conditions-->
         <xsl:attribute name="class">
            <xsl:text> x--sfe-IndexGroupHead-1-0</xsl:text>
         </xsl:attribute>
         <xsl:if test="@xml:lang">
            <xsl:attribute name="lang">
               <xsl:call-template name="return-lang-applying-language-map">
                  <xsl:with-param name="doclang" select="@xml:lang"/>
               </xsl:call-template>
            </xsl:attribute>
         </xsl:if>
         <xsl:copy-of select="@ch:*"/>
         <xsl:copy-of xmlns:dmp="http://www.arbortext.com/namespace/dmp/dmpmap" select="@dmp:*"/>
         <xsl:if test="@xml:lang">
            <xsl:attribute name="lang">
               <xsl:call-template name="return-lang-applying-language-map">
                  <xsl:with-param name="doclang" select="@xml:lang"/>
               </xsl:call-template>
            </xsl:attribute>
         </xsl:if>
         <xsl:call-template name="maybe-set-id"/>
         <!--Process this element's content-->
         <xsl:apply-templates/>
      </div>
   </xsl:template>

   <!--Gentext template for Context: _sfe:IndexGroupHead-->
   <xsl:template match="_sfe:IndexGroupHead" mode="expand-gentext" priority="0">
      <xsl:copy>
         <xsl:apply-templates select="@*|node()" mode="expand-gentext"/>
      </xsl:copy>
   </xsl:template>

   <!--Set count-as pass template for Context: _sfe:IndexGroupHead-->
   <xsl:template match="_sfe:IndexGroupHead" mode="set-countas" priority="0">
      <xsl:copy>
         <xsl:apply-templates select="@*|node()" mode="set-countas"/>
      </xsl:copy>
   </xsl:template>

   <!--Style template for Context: _sfe:IndexHeading-->
   <xsl:template name="__style-for__sfe-IndexHeading.1">
      <xsl:text> .x--sfe-IndexHeading-1-0 {margin-left: 0pt; margin-right: 0pt; }</xsl:text>
   </xsl:template>

   <!--Template for Context: _sfe:IndexHeading-->
   <xsl:template match="_sfe:IndexHeading" priority="0">
      <span>
         <!--Emit class values to reflect conditions-->
         <xsl:attribute name="class">
            <xsl:text> x--sfe-IndexHeading-1-0</xsl:text>
         </xsl:attribute>
         <xsl:if test="@xml:lang">
            <xsl:attribute name="lang">
               <xsl:call-template name="return-lang-applying-language-map">
                  <xsl:with-param name="doclang" select="@xml:lang"/>
               </xsl:call-template>
            </xsl:attribute>
         </xsl:if>
         <xsl:copy-of select="@ch:*"/>
         <xsl:copy-of xmlns:dmp="http://www.arbortext.com/namespace/dmp/dmpmap" select="@dmp:*"/>
         <xsl:if test="@xml:lang">
            <xsl:attribute name="lang">
               <xsl:call-template name="return-lang-applying-language-map">
                  <xsl:with-param name="doclang" select="@xml:lang"/>
               </xsl:call-template>
            </xsl:attribute>
         </xsl:if>
         <xsl:call-template name="maybe-set-id"/>
         <!--Process this element's content-->
         <xsl:apply-templates/>
      </span>
   </xsl:template>

   <!--Gentext template for Context: _sfe:IndexHeading-->
   <xsl:template match="_sfe:IndexHeading" mode="expand-gentext" priority="0">
      <xsl:copy>
         <xsl:apply-templates select="@*|node()" mode="expand-gentext"/>
      </xsl:copy>
   </xsl:template>

   <!--Set count-as pass template for Context: _sfe:IndexHeading-->
   <xsl:template match="_sfe:IndexHeading" mode="set-countas" priority="0">
      <xsl:copy>
         <xsl:apply-templates select="@*|node()" mode="set-countas"/>
      </xsl:copy>
   </xsl:template>

   <!--Style template for Context: _sfe:IndexLocators-->
   <xsl:template name="__style-for__sfe-IndexLocators.1">
      <xsl:text> .x--sfe-IndexLocators-1-0 {margin-left: 0pt; margin-right: 0pt; }</xsl:text>
   </xsl:template>

   <!--Template for Context: _sfe:IndexLocators-->
   <xsl:template match="_sfe:IndexLocators" priority="0">
      <span>
         <!--Emit class values to reflect conditions-->
         <xsl:attribute name="class">
            <xsl:text> x--sfe-IndexLocators-1-0</xsl:text>
         </xsl:attribute>
         <xsl:if test="@xml:lang">
            <xsl:attribute name="lang">
               <xsl:call-template name="return-lang-applying-language-map">
                  <xsl:with-param name="doclang" select="@xml:lang"/>
               </xsl:call-template>
            </xsl:attribute>
         </xsl:if>
         <xsl:copy-of select="@ch:*"/>
         <xsl:copy-of xmlns:dmp="http://www.arbortext.com/namespace/dmp/dmpmap" select="@dmp:*"/>
         <xsl:if test="@xml:lang">
            <xsl:attribute name="lang">
               <xsl:call-template name="return-lang-applying-language-map">
                  <xsl:with-param name="doclang" select="@xml:lang"/>
               </xsl:call-template>
            </xsl:attribute>
         </xsl:if>
         <xsl:call-template name="maybe-set-id"/>
         <!--Process this element's content-->
         <xsl:apply-templates/>
      </span>
   </xsl:template>

   <!--Gentext template for Context: _sfe:IndexLocators-->
   <xsl:template match="_sfe:IndexLocators" mode="expand-gentext" priority="0">
      <xsl:copy>
         <xsl:attribute name="_gte:Gentext-Expanded">y</xsl:attribute>
         <xsl:apply-templates select="@*" mode="expand-gentext"/>
         <xsl:if test="not(@_gte:id)">
            <xsl:attribute name="_gte:id">
               <xsl:value-of select="'_g_'"/>
               <xsl:value-of select="generate-id(.)"/>
            </xsl:attribute>
         </xsl:if>
         <!--Unconditional AddBefore-->
         <xsl:if test="not(@_gte:Gentext-Expanded)">
            <_sfe:BeforeOrAfterText> </_sfe:BeforeOrAfterText>
         </xsl:if>
         <xsl:apply-templates select="* | text() | processing-instruction()" mode="expand-gentext"/>
      </xsl:copy>
   </xsl:template>

   <!--Set count-as pass template for Context: _sfe:IndexLocators-->
   <xsl:template match="_sfe:IndexLocators" mode="set-countas" priority="0">
      <xsl:copy>
         <xsl:apply-templates select="@*|node()" mode="set-countas"/>
      </xsl:copy>
   </xsl:template>

   <!--Style template for Context: _sfe:IndexPage[position()>1]-->
   <xsl:template name="__style-for__sfe-IndexPage.2_sInge281">
      <xsl:text> .x--sfe-IndexPage-1-0 {margin-left: 0pt; margin-right: 0pt; }</xsl:text>
   </xsl:template>

   <!--Template for Context: _sfe:IndexPage[position()>1]-->
   <xsl:template match="_sfe:IndexPage[position()&gt;1]" priority="1">
      <span>
         <!--Emit class values to reflect conditions-->
         <xsl:attribute name="class">
            <xsl:text> x--sfe-IndexPage-1-0</xsl:text>
         </xsl:attribute>
         <xsl:if test="@xml:lang">
            <xsl:attribute name="lang">
               <xsl:call-template name="return-lang-applying-language-map">
                  <xsl:with-param name="doclang" select="@xml:lang"/>
               </xsl:call-template>
            </xsl:attribute>
         </xsl:if>
         <xsl:copy-of select="@ch:*"/>
         <xsl:copy-of xmlns:dmp="http://www.arbortext.com/namespace/dmp/dmpmap" select="@dmp:*"/>
         <xsl:if test="@xml:lang">
            <xsl:attribute name="lang">
               <xsl:call-template name="return-lang-applying-language-map">
                  <xsl:with-param name="doclang" select="@xml:lang"/>
               </xsl:call-template>
            </xsl:attribute>
         </xsl:if>
         <xsl:call-template name="maybe-set-id"/>
         <!--Process this element's content-->
         <xsl:apply-templates/>
      </span>
   </xsl:template>

   <!--Gentext template for Context: _sfe:IndexPage[position()>1]-->
   <xsl:template match="_sfe:IndexPage[position()&gt;1]" mode="expand-gentext" priority="1">
      <xsl:copy>
         <xsl:attribute name="_gte:Gentext-Expanded">y</xsl:attribute>
         <xsl:apply-templates select="@*" mode="expand-gentext"/>
         <xsl:if test="not(@_gte:id)">
            <xsl:attribute name="_gte:id">
               <xsl:value-of select="'_g_'"/>
               <xsl:value-of select="generate-id(.)"/>
            </xsl:attribute>
         </xsl:if>
         <!--Unconditional AddBefore-->
         <xsl:if test="not(@_gte:Gentext-Expanded)">
            <_sfe:BeforeOrAfterText>
               <xsl:text>, </xsl:text>
            </_sfe:BeforeOrAfterText>
         </xsl:if>
         <xsl:apply-templates select="* | text() | processing-instruction()" mode="expand-gentext"/>
      </xsl:copy>
   </xsl:template>

   <!--Set count-as pass template for Context: _sfe:IndexPage[position()>1]-->
   <xsl:template match="_sfe:IndexPage[position()&gt;1]" mode="set-countas" priority="1">
      <xsl:copy>
         <xsl:apply-templates select="@*|node()" mode="set-countas"/>
      </xsl:copy>
   </xsl:template>

   <!--Style template for Context: _sfe:IndexPage-->
   <xsl:template name="__style-for__sfe-IndexPage.2_sInge142">
      <xsl:text> .x--sfe-IndexPage-2-0 {margin-left: 0pt; margin-right: 0pt; }</xsl:text>
   </xsl:template>

   <!--Template for Context: _sfe:IndexPage-->
   <xsl:template match="_sfe:IndexPage" priority="0">
      <span>
         <!--Emit class values to reflect conditions-->
         <xsl:attribute name="class">
            <xsl:text> x--sfe-IndexPage-2-0</xsl:text>
         </xsl:attribute>
         <xsl:if test="@xml:lang">
            <xsl:attribute name="lang">
               <xsl:call-template name="return-lang-applying-language-map">
                  <xsl:with-param name="doclang" select="@xml:lang"/>
               </xsl:call-template>
            </xsl:attribute>
         </xsl:if>
         <xsl:copy-of select="@ch:*"/>
         <xsl:copy-of xmlns:dmp="http://www.arbortext.com/namespace/dmp/dmpmap" select="@dmp:*"/>
         <xsl:if test="@xml:lang">
            <xsl:attribute name="lang">
               <xsl:call-template name="return-lang-applying-language-map">
                  <xsl:with-param name="doclang" select="@xml:lang"/>
               </xsl:call-template>
            </xsl:attribute>
         </xsl:if>
         <xsl:call-template name="maybe-set-id"/>
         <!--Process this element's content-->
         <xsl:apply-templates/>
      </span>
   </xsl:template>

   <!--Gentext template for Context: _sfe:IndexPage-->
   <xsl:template match="_sfe:IndexPage" mode="expand-gentext" priority="0">
      <xsl:copy>
         <xsl:apply-templates select="@*|node()" mode="expand-gentext"/>
      </xsl:copy>
   </xsl:template>

   <!--Set count-as pass template for Context: _sfe:IndexPage-->
   <xsl:template match="_sfe:IndexPage" mode="set-countas" priority="0">
      <xsl:copy>
         <xsl:apply-templates select="@*|node()" mode="set-countas"/>
      </xsl:copy>
   </xsl:template>

   <!--Style template for Context: _sfe:IndexPostGroup-->
   <xsl:template name="__style-for__sfe-IndexPostGroup.1">
      <xsl:text> .x--sfe-IndexPostGroup-1-0 {margin-left: 0pt; margin-right: 0pt; text-indent: 0pt; margin-top: 1.5pc; }</xsl:text>
   </xsl:template>

   <!--Template for Context: _sfe:IndexPostGroup-->
   <xsl:template match="_sfe:IndexPostGroup" priority="0">
      <div>
         <!--Emit class values to reflect conditions-->
         <xsl:attribute name="class">
            <xsl:text> x--sfe-IndexPostGroup-1-0</xsl:text>
         </xsl:attribute>
         <xsl:if test="@xml:lang">
            <xsl:attribute name="lang">
               <xsl:call-template name="return-lang-applying-language-map">
                  <xsl:with-param name="doclang" select="@xml:lang"/>
               </xsl:call-template>
            </xsl:attribute>
         </xsl:if>
         <xsl:copy-of select="@ch:*"/>
         <xsl:copy-of xmlns:dmp="http://www.arbortext.com/namespace/dmp/dmpmap" select="@dmp:*"/>
         <xsl:if test="@xml:lang">
            <xsl:attribute name="lang">
               <xsl:call-template name="return-lang-applying-language-map">
                  <xsl:with-param name="doclang" select="@xml:lang"/>
               </xsl:call-template>
            </xsl:attribute>
         </xsl:if>
         <xsl:call-template name="maybe-set-id"/>
         <!--Process this element's content-->
         <xsl:apply-templates/>
      </div>
   </xsl:template>

   <!--Gentext template for Context: _sfe:IndexPostGroup-->
   <xsl:template match="_sfe:IndexPostGroup" mode="expand-gentext" priority="0">
      <xsl:copy>
         <xsl:apply-templates select="@*|node()" mode="expand-gentext"/>
      </xsl:copy>
   </xsl:template>

   <!--Set count-as pass template for Context: _sfe:IndexPostGroup-->
   <xsl:template match="_sfe:IndexPostGroup" mode="set-countas" priority="0">
      <xsl:copy>
         <xsl:apply-templates select="@*|node()" mode="set-countas"/>
      </xsl:copy>
   </xsl:template>

   <!--Style template for Context: _sfe:IndexPreGroup-->
   <xsl:template name="__style-for__sfe-IndexPreGroup.1">
      <xsl:text> .x--sfe-IndexPreGroup-1-0 {margin-left: 0pt; margin-right: 0pt; text-indent: 0pt; margin-top: 1.5pc; }</xsl:text>
   </xsl:template>

   <!--Template for Context: _sfe:IndexPreGroup-->
   <xsl:template match="_sfe:IndexPreGroup" priority="0">
      <div>
         <!--Emit class values to reflect conditions-->
         <xsl:attribute name="class">
            <xsl:text> x--sfe-IndexPreGroup-1-0</xsl:text>
         </xsl:attribute>
         <xsl:if test="@xml:lang">
            <xsl:attribute name="lang">
               <xsl:call-template name="return-lang-applying-language-map">
                  <xsl:with-param name="doclang" select="@xml:lang"/>
               </xsl:call-template>
            </xsl:attribute>
         </xsl:if>
         <xsl:copy-of select="@ch:*"/>
         <xsl:copy-of xmlns:dmp="http://www.arbortext.com/namespace/dmp/dmpmap" select="@dmp:*"/>
         <xsl:if test="@xml:lang">
            <xsl:attribute name="lang">
               <xsl:call-template name="return-lang-applying-language-map">
                  <xsl:with-param name="doclang" select="@xml:lang"/>
               </xsl:call-template>
            </xsl:attribute>
         </xsl:if>
         <xsl:call-template name="maybe-set-id"/>
         <!--Process this element's content-->
         <xsl:apply-templates/>
      </div>
   </xsl:template>

   <!--Gentext template for Context: _sfe:IndexPreGroup-->
   <xsl:template match="_sfe:IndexPreGroup" mode="expand-gentext" priority="0">
      <xsl:copy>
         <xsl:apply-templates select="@*|node()" mode="expand-gentext"/>
      </xsl:copy>
   </xsl:template>

   <!--Set count-as pass template for Context: _sfe:IndexPreGroup-->
   <xsl:template match="_sfe:IndexPreGroup" mode="set-countas" priority="0">
      <xsl:copy>
         <xsl:apply-templates select="@*|node()" mode="set-countas"/>
      </xsl:copy>
   </xsl:template>

   <!--Style template for Context: _sfe:IndexRangeGroup-->
   <xsl:template name="__style-for__sfe-IndexRangeGroup.1">
      <xsl:text> .x--sfe-IndexRangeGroup-1-0 {margin-left: 0pt; margin-right: 0pt; text-indent: 0pt; margin-top: 1.5pc; }</xsl:text>
   </xsl:template>

   <!--Template for Context: _sfe:IndexRangeGroup-->
   <xsl:template match="_sfe:IndexRangeGroup" priority="0">
      <div>
         <!--Emit class values to reflect conditions-->
         <xsl:attribute name="class">
            <xsl:text> x--sfe-IndexRangeGroup-1-0</xsl:text>
         </xsl:attribute>
         <xsl:if test="@xml:lang">
            <xsl:attribute name="lang">
               <xsl:call-template name="return-lang-applying-language-map">
                  <xsl:with-param name="doclang" select="@xml:lang"/>
               </xsl:call-template>
            </xsl:attribute>
         </xsl:if>
         <xsl:copy-of select="@ch:*"/>
         <xsl:copy-of xmlns:dmp="http://www.arbortext.com/namespace/dmp/dmpmap" select="@dmp:*"/>
         <xsl:if test="@xml:lang">
            <xsl:attribute name="lang">
               <xsl:call-template name="return-lang-applying-language-map">
                  <xsl:with-param name="doclang" select="@xml:lang"/>
               </xsl:call-template>
            </xsl:attribute>
         </xsl:if>
         <xsl:call-template name="maybe-set-id"/>
         <!--Process this element's content-->
         <xsl:apply-templates/>
      </div>
   </xsl:template>

   <!--Gentext template for Context: _sfe:IndexRangeGroup-->
   <xsl:template match="_sfe:IndexRangeGroup" mode="expand-gentext" priority="0">
      <xsl:copy>
         <xsl:apply-templates select="@*|node()" mode="expand-gentext"/>
      </xsl:copy>
   </xsl:template>

   <!--Set count-as pass template for Context: _sfe:IndexRangeGroup-->
   <xsl:template match="_sfe:IndexRangeGroup" mode="set-countas" priority="0">
      <xsl:copy>
         <xsl:apply-templates select="@*|node()" mode="set-countas"/>
      </xsl:copy>
   </xsl:template>

   <!--Style template for Context: _sfe:IndexSee-->
   <xsl:template name="__style-for__sfe-IndexSee.1">
      <xsl:text> .x--sfe-IndexSee-1-0 {margin-left: 0pt; margin-right: 0pt; }</xsl:text>
   </xsl:template>

   <!--Template for Context: _sfe:IndexSee-->
   <xsl:template match="_sfe:IndexSee" priority="0">
      <span>
         <!--Emit class values to reflect conditions-->
         <xsl:attribute name="class">
            <xsl:text> x--sfe-IndexSee-1-0</xsl:text>
         </xsl:attribute>
         <xsl:if test="@xml:lang">
            <xsl:attribute name="lang">
               <xsl:call-template name="return-lang-applying-language-map">
                  <xsl:with-param name="doclang" select="@xml:lang"/>
               </xsl:call-template>
            </xsl:attribute>
         </xsl:if>
         <xsl:copy-of select="@ch:*"/>
         <xsl:copy-of xmlns:dmp="http://www.arbortext.com/namespace/dmp/dmpmap" select="@dmp:*"/>
         <xsl:if test="@xml:lang">
            <xsl:attribute name="lang">
               <xsl:call-template name="return-lang-applying-language-map">
                  <xsl:with-param name="doclang" select="@xml:lang"/>
               </xsl:call-template>
            </xsl:attribute>
         </xsl:if>
         <xsl:call-template name="maybe-set-id"/>
         <!--Process this element's content-->
         <xsl:apply-templates/>
      </span>
   </xsl:template>

   <!--Gentext template for Context: _sfe:IndexSee-->
   <xsl:template match="_sfe:IndexSee" mode="expand-gentext" priority="0">
      <xsl:copy>
         <xsl:attribute name="_gte:Gentext-Expanded">y</xsl:attribute>
         <xsl:apply-templates select="@*" mode="expand-gentext"/>
         <xsl:if test="not(@_gte:id)">
            <xsl:attribute name="_gte:id">
               <xsl:value-of select="'_g_'"/>
               <xsl:value-of select="generate-id(.)"/>
            </xsl:attribute>
         </xsl:if>
         <!--Unconditional AddBefore-->
         <xsl:if test="not(@_gte:Gentext-Expanded)">
            <_sfe:BeforeOrAfterText>
               <xsl:text>, </xsl:text>
               <span style="font-style: italic; ">
                  <xsl:text>See </xsl:text>
               </span>
            </_sfe:BeforeOrAfterText>
         </xsl:if>
         <xsl:apply-templates select="* | text() | processing-instruction()" mode="expand-gentext"/>
      </xsl:copy>
   </xsl:template>

   <!--Set count-as pass template for Context: _sfe:IndexSee-->
   <xsl:template match="_sfe:IndexSee" mode="set-countas" priority="0">
      <xsl:copy>
         <xsl:apply-templates select="@*|node()" mode="set-countas"/>
      </xsl:copy>
   </xsl:template>

   <!--Style template for Context: _sfe:IndexSeeAlso-->
   <xsl:template name="__style-for__sfe-IndexSeeAlso.1">
      <xsl:text> .x--sfe-IndexSeeAlso-1-0 {margin-left: 0pt; margin-right: 0pt; text-indent: 0pt; margin-left: 3em; text-indent: -1.5em; }</xsl:text>
   </xsl:template>

   <!--Template for Context: _sfe:IndexSeeAlso-->
   <xsl:template match="_sfe:IndexSeeAlso" priority="0">
      <div>
         <!--Emit class values to reflect conditions-->
         <xsl:attribute name="class">
            <xsl:text> x--sfe-IndexSeeAlso-1-0</xsl:text>
         </xsl:attribute>
         <xsl:if test="@xml:lang">
            <xsl:attribute name="lang">
               <xsl:call-template name="return-lang-applying-language-map">
                  <xsl:with-param name="doclang" select="@xml:lang"/>
               </xsl:call-template>
            </xsl:attribute>
         </xsl:if>
         <xsl:copy-of select="@ch:*"/>
         <xsl:copy-of xmlns:dmp="http://www.arbortext.com/namespace/dmp/dmpmap" select="@dmp:*"/>
         <xsl:if test="@xml:lang">
            <xsl:attribute name="lang">
               <xsl:call-template name="return-lang-applying-language-map">
                  <xsl:with-param name="doclang" select="@xml:lang"/>
               </xsl:call-template>
            </xsl:attribute>
         </xsl:if>
         <xsl:call-template name="maybe-set-id"/>
         <!--Process this element's content-->
         <xsl:apply-templates/>
      </div>
   </xsl:template>

   <!--Gentext template for Context: _sfe:IndexSeeAlso-->
   <xsl:template match="_sfe:IndexSeeAlso" mode="expand-gentext" priority="0">
      <xsl:copy>
         <xsl:attribute name="_gte:Gentext-Expanded">y</xsl:attribute>
         <xsl:apply-templates select="@*" mode="expand-gentext"/>
         <xsl:if test="not(@_gte:id)">
            <xsl:attribute name="_gte:id">
               <xsl:value-of select="'_g_'"/>
               <xsl:value-of select="generate-id(.)"/>
            </xsl:attribute>
         </xsl:if>
         <!--Unconditional AddBefore-->
         <xsl:if test="not(@_gte:Gentext-Expanded)">
            <_sfe:BeforeOrAfterText>
               <span style="font-style: italic; ">
                  <xsl:text>See also </xsl:text>
               </span>
            </_sfe:BeforeOrAfterText>
         </xsl:if>
         <xsl:apply-templates select="* | text() | processing-instruction()" mode="expand-gentext"/>
      </xsl:copy>
   </xsl:template>

   <!--Set count-as pass template for Context: _sfe:IndexSeeAlso-->
   <xsl:template match="_sfe:IndexSeeAlso" mode="set-countas" priority="0">
      <xsl:copy>
         <xsl:apply-templates select="@*|node()" mode="set-countas"/>
      </xsl:copy>
   </xsl:template>

   <!--Style template for Context: _sfe:IndexSubGroupHead-->
   <xsl:template name="__style-for__sfe-IndexSubGroupHead.1">
      <xsl:text> .x--sfe-IndexSubGroupHead-1-0 {margin-left: 0pt; margin-right: 0pt; text-indent: 0pt; font-weight: bold; font-size: 14pt; text-transform: uppercase; text-align: left; margin-top: 2pc; }</xsl:text>
   </xsl:template>

   <!--Template for Context: _sfe:IndexSubGroupHead-->
   <xsl:template match="_sfe:IndexSubGroupHead" priority="0">
      <div>
         <!--Emit class values to reflect conditions-->
         <xsl:attribute name="class">
            <xsl:text> x--sfe-IndexSubGroupHead-1-0</xsl:text>
         </xsl:attribute>
         <xsl:if test="@xml:lang">
            <xsl:attribute name="lang">
               <xsl:call-template name="return-lang-applying-language-map">
                  <xsl:with-param name="doclang" select="@xml:lang"/>
               </xsl:call-template>
            </xsl:attribute>
         </xsl:if>
         <xsl:copy-of select="@ch:*"/>
         <xsl:copy-of xmlns:dmp="http://www.arbortext.com/namespace/dmp/dmpmap" select="@dmp:*"/>
         <xsl:if test="@xml:lang">
            <xsl:attribute name="lang">
               <xsl:call-template name="return-lang-applying-language-map">
                  <xsl:with-param name="doclang" select="@xml:lang"/>
               </xsl:call-template>
            </xsl:attribute>
         </xsl:if>
         <xsl:call-template name="maybe-set-id"/>
         <!--Process this element's content-->
         <xsl:apply-templates/>
      </div>
   </xsl:template>

   <!--Gentext template for Context: _sfe:IndexSubGroupHead-->
   <xsl:template match="_sfe:IndexSubGroupHead" mode="expand-gentext" priority="0">
      <xsl:copy>
         <xsl:apply-templates select="@*|node()" mode="expand-gentext"/>
      </xsl:copy>
   </xsl:template>

   <!--Set count-as pass template for Context: _sfe:IndexSubGroupHead-->
   <xsl:template match="_sfe:IndexSubGroupHead" mode="set-countas" priority="0">
      <xsl:copy>
         <xsl:apply-templates select="@*|node()" mode="set-countas"/>
      </xsl:copy>
   </xsl:template>

   <!--Style template for Context: _sfe:InternalLink-->
   <xsl:template name="__style-for__sfe-InternalLink.1">
      <xsl:text> .x--sfe-InternalLink-1-0 {margin-left: 0pt; margin-right: 0pt; color: #0000FF; text-decoration: underline ; }</xsl:text>
   </xsl:template>

   <!--Template for Context: _sfe:InternalLink-->
   <xsl:template match="_sfe:InternalLink" priority="0">
      <a>
         <!--Emit class values to reflect conditions-->
         <xsl:attribute name="class">
            <xsl:text> x--sfe-InternalLink-1-0</xsl:text>
         </xsl:attribute>
         <xsl:choose>
            <xsl:when xmlns:ati3d="http://www.arbortext.com/namespace/graphics"
               test="@ati3d:viewer and @targetId">
               <!--this is a link to a 3D graphic-->
               <xsl:variable name="annotation" select="@ati3d:view"/>
               <xsl:variable name="idrefvalue" select="@targetId"/>
               <xsl:variable name="viewer" select="@ati3d:viewer"/>
               <xsl:attribute name="href">
                  <xsl:text>#</xsl:text>
                  <xsl:value-of select="$idrefvalue"/>
               </xsl:attribute>
               <xsl:attribute name="onclick">
                  <xsl:value-of select="$viewer"/>
                  <xsl:text>_Link('</xsl:text>
                  <xsl:value-of select="$idrefvalue"/>
                  <xsl:text>','</xsl:text>
                  <xsl:value-of select="@ati3d:linkdata"/>
                  <xsl:text>')</xsl:text>
               </xsl:attribute>
            </xsl:when>
            <xsl:otherwise>
               <!--this is a "regular" link-->
               <xsl:if test="@targetId">
                  <xsl:attribute name="href">
                     <xsl:value-of select="concat('#',@targetId)"/>
                  </xsl:attribute>
               </xsl:if>
            </xsl:otherwise>
         </xsl:choose>
         <xsl:if test="@xml:lang">
            <xsl:attribute name="lang">
               <xsl:call-template name="return-lang-applying-language-map">
                  <xsl:with-param name="doclang" select="@xml:lang"/>
               </xsl:call-template>
            </xsl:attribute>
         </xsl:if>
         <xsl:copy-of select="@ch:*"/>
         <xsl:copy-of xmlns:dmp="http://www.arbortext.com/namespace/dmp/dmpmap" select="@dmp:*"/>
         <xsl:if test="@xml:lang">
            <xsl:attribute name="lang">
               <xsl:call-template name="return-lang-applying-language-map">
                  <xsl:with-param name="doclang" select="@xml:lang"/>
               </xsl:call-template>
            </xsl:attribute>
         </xsl:if>
         <xsl:call-template name="maybe-set-id"/>
         <!--Process this element's content-->
         <xsl:apply-templates/>
      </a>
   </xsl:template>

   <!--Gentext template for Context: _sfe:InternalLink-->
   <xsl:template match="_sfe:InternalLink" mode="expand-gentext" priority="0">
      <xsl:copy>
         <xsl:apply-templates select="@*|node()" mode="expand-gentext"/>
      </xsl:copy>
   </xsl:template>
   
   <!--Set count-as pass template for Context: _sfe:InternalLink-->
   <xsl:template match="_sfe:InternalLink" mode="set-countas" priority="0">
      <xsl:copy>
         <xsl:apply-templates select="@*|node()" mode="set-countas"/>
      </xsl:copy>
   </xsl:template>

   <!--Style template for Context: _sfe:RepeatingTitle-->
   <xsl:template name="__style-for__sfe-RepeatingTitle.1">
      <xsl:text> .x--sfe-RepeatingTitle-1-0 {margin-left: 0pt; margin-right: 0pt; text-indent: 0pt; }</xsl:text>
   </xsl:template>

   <!--Template for Context: _sfe:RepeatingTitle-->
   <xsl:template match="_sfe:RepeatingTitle" priority="0">
      <div>
         <!--Emit class values to reflect conditions-->
         <xsl:attribute name="class">
            <xsl:text> x--sfe-RepeatingTitle-1-0</xsl:text>
         </xsl:attribute>
         <xsl:if test="@xml:lang">
            <xsl:attribute name="lang">
               <xsl:call-template name="return-lang-applying-language-map">
                  <xsl:with-param name="doclang" select="@xml:lang"/>
               </xsl:call-template>
            </xsl:attribute>
         </xsl:if>
         <xsl:copy-of select="@ch:*"/>
         <xsl:copy-of xmlns:dmp="http://www.arbortext.com/namespace/dmp/dmpmap" select="@dmp:*"/>
         <xsl:if test="@xml:lang">
            <xsl:attribute name="lang">
               <xsl:call-template name="return-lang-applying-language-map">
                  <xsl:with-param name="doclang" select="@xml:lang"/>
               </xsl:call-template>
            </xsl:attribute>
         </xsl:if>
         <xsl:call-template name="maybe-set-id"/>
         <!--Process this element's content-->
         <xsl:apply-templates/>
      </div>
   </xsl:template>

   <!--Gentext template for Context: _sfe:RepeatingTitle-->
   <xsl:template match="_sfe:RepeatingTitle" mode="expand-gentext" priority="0">
      <xsl:copy>
         <xsl:apply-templates select="@*|node()" mode="expand-gentext"/>
      </xsl:copy>
   </xsl:template>

   <!--Set count-as pass template for Context: _sfe:RepeatingTitle-->
   <xsl:template match="_sfe:RepeatingTitle" mode="set-countas" priority="0">
      <xsl:copy>
         <xsl:apply-templates select="@*|node()" mode="set-countas"/>
      </xsl:copy>
   </xsl:template>

   <!--Style template for Context: _sfe:TableOfContents-->
   <xsl:template name="__style-for__sfe-TableOfContents.1">
      <xsl:text> .x--sfe-TableOfContents-1-0 {margin-left: 0pt; margin-right: 0pt; text-indent: 0pt; }</xsl:text>
   </xsl:template>

   <!--Template for Context: _sfe:TableOfContents-->
   <xsl:template match="_sfe:TableOfContents" priority="0">
      <div>
         <!--Emit class values to reflect conditions-->
         <xsl:attribute name="class">
            <xsl:text> x--sfe-TableOfContents-1-0</xsl:text>
         </xsl:attribute>
         <xsl:if test="@xml:lang">
            <xsl:attribute name="lang">
               <xsl:call-template name="return-lang-applying-language-map">
                  <xsl:with-param name="doclang" select="@xml:lang"/>
               </xsl:call-template>
            </xsl:attribute>
         </xsl:if>
         <xsl:copy-of select="@ch:*"/>
         <xsl:copy-of xmlns:dmp="http://www.arbortext.com/namespace/dmp/dmpmap" select="@dmp:*"/>
         <xsl:if test="@xml:lang">
            <xsl:attribute name="lang">
               <xsl:call-template name="return-lang-applying-language-map">
                  <xsl:with-param name="doclang" select="@xml:lang"/>
               </xsl:call-template>
            </xsl:attribute>
         </xsl:if>
         <xsl:call-template name="maybe-set-id"/>
         <!--Process this element's content-->
         <xsl:apply-templates/>
      </div>
   </xsl:template>

   <!--Gentext template for Context: _sfe:TableOfContents-->
   <xsl:template match="_sfe:TableOfContents" mode="expand-gentext" priority="0">
      <xsl:copy>
         <xsl:apply-templates select="@*|node()" mode="expand-gentext"/>
      </xsl:copy>
   </xsl:template>

   <!--Set count-as pass template for Context: _sfe:TableOfContents-->
   <xsl:template match="_sfe:TableOfContents" mode="set-countas" priority="0">
      <xsl:copy>
         <xsl:apply-templates select="@*|node()" mode="set-countas"/>
      </xsl:copy>
   </xsl:template>

   <!--Style template for Context: _sfe:TocEntry1_Table_of_Contents-->
   <xsl:template name="__style-for__sfe-TocEntry1_Table_of_Contents.1">
      <xsl:text> .x--sfe-TocEntry1-Table-of-Contents-1-0 {margin-left: 0pt; margin-right: 0pt; text-indent: 0pt; margin-left: 4em; margin-right: 2pc; text-indent: -4.00em; }</xsl:text>
   </xsl:template>

   <!--Template for Context: _sfe:TocEntry1_Table_of_Contents-->
   <xsl:template match="_sfe:TocEntry1_Table_of_Contents" priority="0">
      <div>
         <!--Emit class values to reflect conditions-->
         <xsl:attribute name="class">
            <xsl:text> x--sfe-TocEntry1-Table-of-Contents-1-0</xsl:text>
         </xsl:attribute>
         <a>
            <xsl:choose>
               <xsl:when xmlns:ati3d="http://www.arbortext.com/namespace/graphics"
                  test="@ati3d:viewer and @tocentry_id">
                  <!--this is a link to a 3D graphic-->
                  <xsl:variable name="annotation" select="@ati3d:view"/>
                  <xsl:variable name="idrefvalue" select="@tocentry_id"/>
                  <xsl:variable name="viewer" select="@ati3d:viewer"/>
                  <xsl:attribute name="href">
                     <xsl:text>#</xsl:text>
                     <xsl:value-of select="$idrefvalue"/>
                  </xsl:attribute>
                  <xsl:attribute name="onclick">
                     <xsl:value-of select="$viewer"/>
                     <xsl:text>_Link('</xsl:text>
                     <xsl:value-of select="$idrefvalue"/>
                     <xsl:text>','</xsl:text>
                     <xsl:value-of select="@ati3d:linkdata"/>
                     <xsl:text>')</xsl:text>
                  </xsl:attribute>
               </xsl:when>
               <xsl:otherwise>
                  <!--this is a "regular" link-->
                  <xsl:if test="@tocentry_id">
                     <xsl:attribute name="href">
                        <xsl:value-of select="concat('#',@tocentry_id)"/>
                     </xsl:attribute>
                  </xsl:if>
               </xsl:otherwise>
            </xsl:choose>
            <xsl:if test="@xml:lang">
               <xsl:attribute name="lang">
                  <xsl:call-template name="return-lang-applying-language-map">
                     <xsl:with-param name="doclang" select="@xml:lang"/>
                  </xsl:call-template>
               </xsl:attribute>
            </xsl:if>
            <xsl:copy-of select="@ch:*"/>
            <xsl:copy-of xmlns:dmp="http://www.arbortext.com/namespace/dmp/dmpmap" select="@dmp:*"/>
            <xsl:if test="@xml:lang">
               <xsl:attribute name="lang">
                  <xsl:call-template name="return-lang-applying-language-map">
                     <xsl:with-param name="doclang" select="@xml:lang"/>
                  </xsl:call-template>
               </xsl:attribute>
            </xsl:if>
            <xsl:call-template name="maybe-set-id"/>
            <!--Process this element's content-->
            <xsl:apply-templates/>
         </a>
      </div>
   </xsl:template>

   <!--Gentext template for Context: _sfe:TocEntry1_Table_of_Contents-->
   <xsl:template match="_sfe:TocEntry1_Table_of_Contents" mode="expand-gentext" priority="0">
      <xsl:copy>
         <xsl:apply-templates select="@*|node()" mode="expand-gentext"/>
      </xsl:copy>
   </xsl:template>

   <!--Set count-as pass template for Context: _sfe:TocEntry1_Table_of_Contents-->
   <xsl:template match="_sfe:TocEntry1_Table_of_Contents" mode="set-countas" priority="0">
      <xsl:copy>
         <xsl:apply-templates select="@*|node()" mode="set-countas"/>
      </xsl:copy>
   </xsl:template>

   <!--Style template for Context: _sfe:TocEntry2_Table_of_Contents-->
   <xsl:template name="__style-for__sfe-TocEntry2_Table_of_Contents.1">
      <xsl:text> .x--sfe-TocEntry2-Table-of-Contents-1-0 {margin-left: 0pt; margin-right: 0pt; text-indent: 0pt; margin-left: 6em; margin-right: 2pc; text-indent: -4.00em; }</xsl:text>
   </xsl:template>

   <!--Template for Context: _sfe:TocEntry2_Table_of_Contents-->
   <xsl:template match="_sfe:TocEntry2_Table_of_Contents" priority="0">
      <div>
         <!--Emit class values to reflect conditions-->
         <xsl:attribute name="class">
            <xsl:text> x--sfe-TocEntry2-Table-of-Contents-1-0</xsl:text>
         </xsl:attribute>
         <a>
            <xsl:choose>
               <xsl:when xmlns:ati3d="http://www.arbortext.com/namespace/graphics"
                  test="@ati3d:viewer and @tocentry_id">
                  <!--this is a link to a 3D graphic-->
                  <xsl:variable name="annotation" select="@ati3d:view"/>
                  <xsl:variable name="idrefvalue" select="@tocentry_id"/>
                  <xsl:variable name="viewer" select="@ati3d:viewer"/>
                  <xsl:attribute name="href">
                     <xsl:text>#</xsl:text>
                     <xsl:value-of select="$idrefvalue"/>
                  </xsl:attribute>
                  <xsl:attribute name="onclick">
                     <xsl:value-of select="$viewer"/>
                     <xsl:text>_Link('</xsl:text>
                     <xsl:value-of select="$idrefvalue"/>
                     <xsl:text>','</xsl:text>
                     <xsl:value-of select="@ati3d:linkdata"/>
                     <xsl:text>')</xsl:text>
                  </xsl:attribute>
               </xsl:when>
               <xsl:otherwise>
                  <!--this is a "regular" link-->
                  <xsl:if test="@tocentry_id">
                     <xsl:attribute name="href">
                        <xsl:value-of select="concat('#',@tocentry_id)"/>
                     </xsl:attribute>
                  </xsl:if>
               </xsl:otherwise>
            </xsl:choose>
            <xsl:if test="@xml:lang">
               <xsl:attribute name="lang">
                  <xsl:call-template name="return-lang-applying-language-map">
                     <xsl:with-param name="doclang" select="@xml:lang"/>
                  </xsl:call-template>
               </xsl:attribute>
            </xsl:if>
            <xsl:copy-of select="@ch:*"/>
            <xsl:copy-of xmlns:dmp="http://www.arbortext.com/namespace/dmp/dmpmap" select="@dmp:*"/>
            <xsl:if test="@xml:lang">
               <xsl:attribute name="lang">
                  <xsl:call-template name="return-lang-applying-language-map">
                     <xsl:with-param name="doclang" select="@xml:lang"/>
                  </xsl:call-template>
               </xsl:attribute>
            </xsl:if>
            <xsl:call-template name="maybe-set-id"/>
            <!--Process this element's content-->
            <xsl:apply-templates/>
         </a>
      </div>
   </xsl:template>

   <!--Gentext template for Context: _sfe:TocEntry2_Table_of_Contents-->
   <xsl:template match="_sfe:TocEntry2_Table_of_Contents" mode="expand-gentext" priority="0">
      <xsl:copy>
         <xsl:apply-templates select="@*|node()" mode="expand-gentext"/>
      </xsl:copy>
   </xsl:template>

   <!--Set count-as pass template for Context: _sfe:TocEntry2_Table_of_Contents-->
   <xsl:template match="_sfe:TocEntry2_Table_of_Contents" mode="set-countas" priority="0">
      <xsl:copy>
         <xsl:apply-templates select="@*|node()" mode="set-countas"/>
      </xsl:copy>
   </xsl:template>

   <!--Style template for Context: _sfe:TocEntry3_Table_of_Contents-->
   <xsl:template name="__style-for__sfe-TocEntry3_Table_of_Contents.1">
      <xsl:text> .x--sfe-TocEntry3-Table-of-Contents-1-0 {margin-left: 0pt; margin-right: 0pt; text-indent: 0pt; margin-left: 8em; margin-right: 2pc; text-indent: -4.00em; }</xsl:text>
   </xsl:template>

   <!--Template for Context: _sfe:TocEntry3_Table_of_Contents-->
   <xsl:template match="_sfe:TocEntry3_Table_of_Contents" priority="0">
      <div>
         <!--Emit class values to reflect conditions-->
         <xsl:attribute name="class">
            <xsl:text> x--sfe-TocEntry3-Table-of-Contents-1-0</xsl:text>
         </xsl:attribute>
         <a>
            <xsl:choose>
               <xsl:when xmlns:ati3d="http://www.arbortext.com/namespace/graphics"
                  test="@ati3d:viewer and @tocentry_id">
                  <!--this is a link to a 3D graphic-->
                  <xsl:variable name="annotation" select="@ati3d:view"/>
                  <xsl:variable name="idrefvalue" select="@tocentry_id"/>
                  <xsl:variable name="viewer" select="@ati3d:viewer"/>
                  <xsl:attribute name="href">
                     <xsl:text>#</xsl:text>
                     <xsl:value-of select="$idrefvalue"/>
                  </xsl:attribute>
                  <xsl:attribute name="onclick">
                     <xsl:value-of select="$viewer"/>
                     <xsl:text>_Link('</xsl:text>
                     <xsl:value-of select="$idrefvalue"/>
                     <xsl:text>','</xsl:text>
                     <xsl:value-of select="@ati3d:linkdata"/>
                     <xsl:text>')</xsl:text>
                  </xsl:attribute>
               </xsl:when>
               <xsl:otherwise>
                  <!--this is a "regular" link-->
                  <xsl:if test="@tocentry_id">
                     <xsl:attribute name="href">
                        <xsl:value-of select="concat('#',@tocentry_id)"/>
                     </xsl:attribute>
                  </xsl:if>
               </xsl:otherwise>
            </xsl:choose>
            <xsl:if test="@xml:lang">
               <xsl:attribute name="lang">
                  <xsl:call-template name="return-lang-applying-language-map">
                     <xsl:with-param name="doclang" select="@xml:lang"/>
                  </xsl:call-template>
               </xsl:attribute>
            </xsl:if>
            <xsl:copy-of select="@ch:*"/>
            <xsl:copy-of xmlns:dmp="http://www.arbortext.com/namespace/dmp/dmpmap" select="@dmp:*"/>
            <xsl:if test="@xml:lang">
               <xsl:attribute name="lang">
                  <xsl:call-template name="return-lang-applying-language-map">
                     <xsl:with-param name="doclang" select="@xml:lang"/>
                  </xsl:call-template>
               </xsl:attribute>
            </xsl:if>
            <xsl:call-template name="maybe-set-id"/>
            <!--Process this element's content-->
            <xsl:apply-templates/>
         </a>
      </div>
   </xsl:template>

   <!--Gentext template for Context: _sfe:TocEntry3_Table_of_Contents-->
   <xsl:template match="_sfe:TocEntry3_Table_of_Contents" mode="expand-gentext" priority="0">
      <xsl:copy>
         <xsl:apply-templates select="@*|node()" mode="expand-gentext"/>
      </xsl:copy>
   </xsl:template>

   <!--Set count-as pass template for Context: _sfe:TocEntry3_Table_of_Contents-->
   <xsl:template match="_sfe:TocEntry3_Table_of_Contents" mode="set-countas" priority="0">
      <xsl:copy>
         <xsl:apply-templates select="@*|node()" mode="set-countas"/>
      </xsl:copy>
   </xsl:template>

   <!--Style template for Context: _sfe:TocEntry4_Table_of_Contents-->
   <xsl:template name="__style-for__sfe-TocEntry4_Table_of_Contents.1">
      <xsl:text> .x--sfe-TocEntry4-Table-of-Contents-1-0 {margin-left: 0pt; margin-right: 0pt; text-indent: 0pt; margin-left: 10em; margin-right: 2pc; text-indent: -4.00em; }</xsl:text>
   </xsl:template>

   <!--Template for Context: _sfe:TocEntry4_Table_of_Contents-->
   <xsl:template match="_sfe:TocEntry4_Table_of_Contents" priority="0">
      <div>
         <!--Emit class values to reflect conditions-->
         <xsl:attribute name="class">
            <xsl:text> x--sfe-TocEntry4-Table-of-Contents-1-0</xsl:text>
         </xsl:attribute>
         <a>
            <xsl:choose>
               <xsl:when xmlns:ati3d="http://www.arbortext.com/namespace/graphics"
                  test="@ati3d:viewer and @tocentry_id">
                  <!--this is a link to a 3D graphic-->
                  <xsl:variable name="annotation" select="@ati3d:view"/>
                  <xsl:variable name="idrefvalue" select="@tocentry_id"/>
                  <xsl:variable name="viewer" select="@ati3d:viewer"/>
                  <xsl:attribute name="href">
                     <xsl:text>#</xsl:text>
                     <xsl:value-of select="$idrefvalue"/>
                  </xsl:attribute>
                  <xsl:attribute name="onclick">
                     <xsl:value-of select="$viewer"/>
                     <xsl:text>_Link('</xsl:text>
                     <xsl:value-of select="$idrefvalue"/>
                     <xsl:text>','</xsl:text>
                     <xsl:value-of select="@ati3d:linkdata"/>
                     <xsl:text>')</xsl:text>
                  </xsl:attribute>
               </xsl:when>
               <xsl:otherwise>
                  <!--this is a "regular" link-->
                  <xsl:if test="@tocentry_id">
                     <xsl:attribute name="href">
                        <xsl:value-of select="concat('#',@tocentry_id)"/>
                     </xsl:attribute>
                  </xsl:if>
               </xsl:otherwise>
            </xsl:choose>
            <xsl:if test="@xml:lang">
               <xsl:attribute name="lang">
                  <xsl:call-template name="return-lang-applying-language-map">
                     <xsl:with-param name="doclang" select="@xml:lang"/>
                  </xsl:call-template>
               </xsl:attribute>
            </xsl:if>
            <xsl:copy-of select="@ch:*"/>
            <xsl:copy-of xmlns:dmp="http://www.arbortext.com/namespace/dmp/dmpmap" select="@dmp:*"/>
            <xsl:if test="@xml:lang">
               <xsl:attribute name="lang">
                  <xsl:call-template name="return-lang-applying-language-map">
                     <xsl:with-param name="doclang" select="@xml:lang"/>
                  </xsl:call-template>
               </xsl:attribute>
            </xsl:if>
            <xsl:call-template name="maybe-set-id"/>
            <!--Process this element's content-->
            <xsl:apply-templates/>
         </a>
      </div>
   </xsl:template>

   <!--Gentext template for Context: _sfe:TocEntry4_Table_of_Contents-->
   <xsl:template match="_sfe:TocEntry4_Table_of_Contents" mode="expand-gentext" priority="0">
      <xsl:copy>
         <xsl:apply-templates select="@*|node()" mode="expand-gentext"/>
      </xsl:copy>
   </xsl:template>

   <!--Set count-as pass template for Context: _sfe:TocEntry4_Table_of_Contents-->
   <xsl:template match="_sfe:TocEntry4_Table_of_Contents" mode="set-countas" priority="0">
      <xsl:copy>
         <xsl:apply-templates select="@*|node()" mode="set-countas"/>
      </xsl:copy>
   </xsl:template>

   <!--Style template for Context: _sfe:TocEntry5_Table_of_Contents-->
   <xsl:template name="__style-for__sfe-TocEntry5_Table_of_Contents.1">
      <xsl:text> .x--sfe-TocEntry5-Table-of-Contents-1-0 {margin-left: 0pt; margin-right: 0pt; text-indent: 0pt; margin-left: 12em; margin-right: 2pc; text-indent: -12em; }</xsl:text>
   </xsl:template>

   <!--Template for Context: _sfe:TocEntry5_Table_of_Contents-->
   <xsl:template match="_sfe:TocEntry5_Table_of_Contents" priority="0">
      <div>
         <!--Emit class values to reflect conditions-->
         <xsl:attribute name="class">
            <xsl:text> x--sfe-TocEntry5-Table-of-Contents-1-0</xsl:text>
         </xsl:attribute>
         <a>
            <xsl:choose>
               <xsl:when xmlns:ati3d="http://www.arbortext.com/namespace/graphics"
                  test="@ati3d:viewer and @tocentry_id">
                  <!--this is a link to a 3D graphic-->
                  <xsl:variable name="annotation" select="@ati3d:view"/>
                  <xsl:variable name="idrefvalue" select="@tocentry_id"/>
                  <xsl:variable name="viewer" select="@ati3d:viewer"/>
                  <xsl:attribute name="href">
                     <xsl:text>#</xsl:text>
                     <xsl:value-of select="$idrefvalue"/>
                  </xsl:attribute>
                  <xsl:attribute name="onclick">
                     <xsl:value-of select="$viewer"/>
                     <xsl:text>_Link('</xsl:text>
                     <xsl:value-of select="$idrefvalue"/>
                     <xsl:text>','</xsl:text>
                     <xsl:value-of select="@ati3d:linkdata"/>
                     <xsl:text>')</xsl:text>
                  </xsl:attribute>
               </xsl:when>
               <xsl:otherwise>
                  <!--this is a "regular" link-->
                  <xsl:if test="@tocentry_id">
                     <xsl:attribute name="href">
                        <xsl:value-of select="concat('#',@tocentry_id)"/>
                     </xsl:attribute>
                  </xsl:if>
               </xsl:otherwise>
            </xsl:choose>
            <xsl:if test="@xml:lang">
               <xsl:attribute name="lang">
                  <xsl:call-template name="return-lang-applying-language-map">
                     <xsl:with-param name="doclang" select="@xml:lang"/>
                  </xsl:call-template>
               </xsl:attribute>
            </xsl:if>
            <xsl:copy-of select="@ch:*"/>
            <xsl:copy-of xmlns:dmp="http://www.arbortext.com/namespace/dmp/dmpmap" select="@dmp:*"/>
            <xsl:if test="@xml:lang">
               <xsl:attribute name="lang">
                  <xsl:call-template name="return-lang-applying-language-map">
                     <xsl:with-param name="doclang" select="@xml:lang"/>
                  </xsl:call-template>
               </xsl:attribute>
            </xsl:if>
            <xsl:call-template name="maybe-set-id"/>
            <!--Process this element's content-->
            <xsl:apply-templates/>
         </a>
      </div>
   </xsl:template>

   <!--Gentext template for Context: _sfe:TocEntry5_Table_of_Contents-->
   <xsl:template match="_sfe:TocEntry5_Table_of_Contents" mode="expand-gentext" priority="0">
      <xsl:copy>
         <xsl:apply-templates select="@*|node()" mode="expand-gentext"/>
      </xsl:copy>
   </xsl:template>

   <!--Set count-as pass template for Context: _sfe:TocEntry5_Table_of_Contents-->
   <xsl:template match="_sfe:TocEntry5_Table_of_Contents" mode="set-countas" priority="0">
      <xsl:copy>
         <xsl:apply-templates select="@*|node()" mode="set-countas"/>
      </xsl:copy>
   </xsl:template>

   <!--Style template for Context: _sfe:TocEntry6_Table_of_Contents-->
   <xsl:template name="__style-for__sfe-TocEntry6_Table_of_Contents.1">
      <xsl:text> .x--sfe-TocEntry6-Table-of-Contents-1-0 {margin-left: 0pt; margin-right: 0pt; text-indent: 0pt; margin-left: 14em; margin-right: 2pc; text-indent: -14em; }</xsl:text>
   </xsl:template>

   <!--Template for Context: _sfe:TocEntry6_Table_of_Contents-->
   <xsl:template match="_sfe:TocEntry6_Table_of_Contents" priority="0">
      <div>
         <!--Emit class values to reflect conditions-->
         <xsl:attribute name="class">
            <xsl:text> x--sfe-TocEntry6-Table-of-Contents-1-0</xsl:text>
         </xsl:attribute>
         <a>
            <xsl:choose>
               <xsl:when xmlns:ati3d="http://www.arbortext.com/namespace/graphics"
                  test="@ati3d:viewer and @tocentry_id">
                  <!--this is a link to a 3D graphic-->
                  <xsl:variable name="annotation" select="@ati3d:view"/>
                  <xsl:variable name="idrefvalue" select="@tocentry_id"/>
                  <xsl:variable name="viewer" select="@ati3d:viewer"/>
                  <xsl:attribute name="href">
                     <xsl:text>#</xsl:text>
                     <xsl:value-of select="$idrefvalue"/>
                  </xsl:attribute>
                  <xsl:attribute name="onclick">
                     <xsl:value-of select="$viewer"/>
                     <xsl:text>_Link('</xsl:text>
                     <xsl:value-of select="$idrefvalue"/>
                     <xsl:text>','</xsl:text>
                     <xsl:value-of select="@ati3d:linkdata"/>
                     <xsl:text>')</xsl:text>
                  </xsl:attribute>
               </xsl:when>
               <xsl:otherwise>
                  <!--this is a "regular" link-->
                  <xsl:if test="@tocentry_id">
                     <xsl:attribute name="href">
                        <xsl:value-of select="concat('#',@tocentry_id)"/>
                     </xsl:attribute>
                  </xsl:if>
               </xsl:otherwise>
            </xsl:choose>
            <xsl:if test="@xml:lang">
               <xsl:attribute name="lang">
                  <xsl:call-template name="return-lang-applying-language-map">
                     <xsl:with-param name="doclang" select="@xml:lang"/>
                  </xsl:call-template>
               </xsl:attribute>
            </xsl:if>
            <xsl:copy-of select="@ch:*"/>
            <xsl:copy-of xmlns:dmp="http://www.arbortext.com/namespace/dmp/dmpmap" select="@dmp:*"/>
            <xsl:if test="@xml:lang">
               <xsl:attribute name="lang">
                  <xsl:call-template name="return-lang-applying-language-map">
                     <xsl:with-param name="doclang" select="@xml:lang"/>
                  </xsl:call-template>
               </xsl:attribute>
            </xsl:if>
            <xsl:call-template name="maybe-set-id"/>
            <!--Process this element's content-->
            <xsl:apply-templates/>
         </a>
      </div>
   </xsl:template>

   <!--Gentext template for Context: _sfe:TocEntry6_Table_of_Contents-->
   <xsl:template match="_sfe:TocEntry6_Table_of_Contents" mode="expand-gentext" priority="0">
      <xsl:copy>
         <xsl:apply-templates select="@*|node()" mode="expand-gentext"/>
      </xsl:copy>
   </xsl:template>

   <!--Set count-as pass template for Context: _sfe:TocEntry6_Table_of_Contents-->
   <xsl:template match="_sfe:TocEntry6_Table_of_Contents" mode="set-countas" priority="0">
      <xsl:copy>
         <xsl:apply-templates select="@*|node()" mode="set-countas"/>
      </xsl:copy>
   </xsl:template>

   <!--Style template for Context: _sfe:TocLabel_Table_of_Contents-->
   <xsl:template name="__style-for__sfe-TocLabel_Table_of_Contents.1">
      <xsl:text> .x--sfe-TocLabel-Table-of-Contents-1-0 {margin-left: 0pt; margin-right: 0pt; }</xsl:text>
   </xsl:template>

   <!--Template for Context: _sfe:TocLabel_Table_of_Contents-->
   <xsl:template match="_sfe:TocLabel_Table_of_Contents" priority="0">
      <span>
         <!--Emit class values to reflect conditions-->
         <xsl:attribute name="class">
            <xsl:text> x--sfe-TocLabel-Table-of-Contents-1-0</xsl:text>
         </xsl:attribute>
         <xsl:if test="@xml:lang">
            <xsl:attribute name="lang">
               <xsl:call-template name="return-lang-applying-language-map">
                  <xsl:with-param name="doclang" select="@xml:lang"/>
               </xsl:call-template>
            </xsl:attribute>
         </xsl:if>
         <xsl:copy-of select="@ch:*"/>
         <xsl:copy-of xmlns:dmp="http://www.arbortext.com/namespace/dmp/dmpmap" select="@dmp:*"/>
         <xsl:if test="@xml:lang">
            <xsl:attribute name="lang">
               <xsl:call-template name="return-lang-applying-language-map">
                  <xsl:with-param name="doclang" select="@xml:lang"/>
               </xsl:call-template>
            </xsl:attribute>
         </xsl:if>
         <xsl:call-template name="maybe-set-id"/>
         <!--Process this element's content-->
         <xsl:apply-templates/>
      </span>
   </xsl:template>

   <!--Gentext template for Context: _sfe:TocLabel_Table_of_Contents-->
   <xsl:template match="_sfe:TocLabel_Table_of_Contents" mode="expand-gentext" priority="0">
      <xsl:copy>
         <xsl:apply-templates select="@*|node()" mode="expand-gentext"/>
      </xsl:copy>
   </xsl:template>

   <!--Set count-as pass template for Context: _sfe:TocLabel_Table_of_Contents-->
   <xsl:template match="_sfe:TocLabel_Table_of_Contents" mode="set-countas" priority="0">
      <xsl:copy>
         <xsl:apply-templates select="@*|node()" mode="set-countas"/>
      </xsl:copy>
   </xsl:template>

   <!--Style template for Context: _sfe:TocPage_Table_of_Contents-->
   <xsl:template name="__style-for__sfe-TocPage_Table_of_Contents.1">
      <xsl:text> .x--sfe-TocPage-Table-of-Contents-1-0 {margin-left: 0pt; margin-right: 0pt; }</xsl:text>
   </xsl:template>

   <!--Template for Context: _sfe:TocPage_Table_of_Contents-->
   <xsl:template match="_sfe:TocPage_Table_of_Contents" priority="0">
      <xsl:param name="hidden" select="'yes'"/>
      <xsl:if test="$hidden='no'">
         <span>
            <!--Emit class values to reflect conditions-->
            <xsl:attribute name="class">
               <xsl:text> x--sfe-TocPage-Table-of-Contents-1-0</xsl:text>
            </xsl:attribute>
            <xsl:if test="@xml:lang">
               <xsl:attribute name="lang">
                  <xsl:call-template name="return-lang-applying-language-map">
                     <xsl:with-param name="doclang" select="@xml:lang"/>
                  </xsl:call-template>
               </xsl:attribute>
            </xsl:if>
            <xsl:copy-of select="@ch:*"/>
            <xsl:copy-of xmlns:dmp="http://www.arbortext.com/namespace/dmp/dmpmap" select="@dmp:*"/>
            <xsl:if test="@xml:lang">
               <xsl:attribute name="lang">
                  <xsl:call-template name="return-lang-applying-language-map">
                     <xsl:with-param name="doclang" select="@xml:lang"/>
                  </xsl:call-template>
               </xsl:attribute>
            </xsl:if>
            <xsl:call-template name="maybe-set-id"/>
            <!--Suppress element contents (but not gentext) unless unhidden-->
            <xsl:choose>
               <xsl:when test="$hidden='no'">
                  <xsl:apply-templates/>
               </xsl:when>
               <xsl:otherwise>
                  <xsl:apply-templates select="_sfe:BeforeOrAfterText"/>
               </xsl:otherwise>
            </xsl:choose>
         </span>
      </xsl:if>
   </xsl:template>

   <!--Gentext template for Context: _sfe:TocPage_Table_of_Contents-->
   <xsl:template match="_sfe:TocPage_Table_of_Contents" mode="expand-gentext" priority="0">
      <xsl:copy>
         <xsl:apply-templates select="@*|node()" mode="expand-gentext"/>
      </xsl:copy>
   </xsl:template>

   <!--Set count-as pass template for Context: _sfe:TocPage_Table_of_Contents-->
   <xsl:template match="_sfe:TocPage_Table_of_Contents" mode="set-countas" priority="0">
      <xsl:copy>
         <xsl:apply-templates select="@*|node()" mode="set-countas"/>
      </xsl:copy>
   </xsl:template>

   <!--Collect footnote template for Context: _sfe:TocPage_Table_of_Contents-->
   <xsl:template match="_sfe:TocPage_Table_of_Contents" mode="styler-collect-footnotes" priority="0">
      <xsl:apply-templates select="_sfe:BeforeOrAfterText/*" mode="styler-collect-footnotes"/>
   </xsl:template>

   <!--Style template for Context: _sfe:TocTable_of_Contents-->
   <xsl:template name="__style-for__sfe-TocTable_of_Contents.1">
      <xsl:text> .x--sfe-TocTable-of-Contents-1-0 {margin-left: 0pt; margin-right: 0pt; }</xsl:text>
   </xsl:template>

   <!--Template for Context: _sfe:TocTable_of_Contents-->
   <xsl:template match="_sfe:TocTable_of_Contents" priority="0">
      <span>
         <!--Emit class values to reflect conditions-->
         <xsl:attribute name="class">
            <xsl:text> x--sfe-TocTable-of-Contents-1-0</xsl:text>
         </xsl:attribute>
         <xsl:if test="@xml:lang">
            <xsl:attribute name="lang">
               <xsl:call-template name="return-lang-applying-language-map">
                  <xsl:with-param name="doclang" select="@xml:lang"/>
               </xsl:call-template>
            </xsl:attribute>
         </xsl:if>
         <xsl:copy-of select="@ch:*"/>
         <xsl:copy-of xmlns:dmp="http://www.arbortext.com/namespace/dmp/dmpmap" select="@dmp:*"/>
         <xsl:if test="@xml:lang">
            <xsl:attribute name="lang">
               <xsl:call-template name="return-lang-applying-language-map">
                  <xsl:with-param name="doclang" select="@xml:lang"/>
               </xsl:call-template>
            </xsl:attribute>
         </xsl:if>
         <xsl:call-template name="maybe-set-id"/>
         <!--Process this element's content-->
         <xsl:apply-templates/>
      </span>
   </xsl:template>

   <!--Gentext template for Context: _sfe:TocTable_of_Contents-->
   <xsl:template match="_sfe:TocTable_of_Contents" mode="expand-gentext" priority="0">
      <xsl:copy>
         <xsl:apply-templates select="@*|node()" mode="expand-gentext"/>
      </xsl:copy>
   </xsl:template>

   <!--Set count-as pass template for Context: _sfe:TocTable_of_Contents-->
   <xsl:template match="_sfe:TocTable_of_Contents" mode="set-countas" priority="0">
      <xsl:copy>
         <xsl:apply-templates select="@*|node()" mode="set-countas"/>
      </xsl:copy>
   </xsl:template>

   <!--Style template for Context: _sfe:TocTitle_Table_of_Contents-->
   <xsl:template name="__style-for__sfe-TocTitle_Table_of_Contents.1">
      <xsl:text> .x--sfe-TocTitle-Table-of-Contents-1-0 {margin-left: 0pt; margin-right: 0pt; }</xsl:text>
   </xsl:template>

   <!--Template for Context: _sfe:TocTitle_Table_of_Contents-->
   <xsl:template match="_sfe:TocTitle_Table_of_Contents" priority="0">
      <span>
         <!--Emit class values to reflect conditions-->
         <xsl:attribute name="class">
            <xsl:text> x--sfe-TocTitle-Table-of-Contents-1-0</xsl:text>
         </xsl:attribute>
         <xsl:if test="@xml:lang">
            <xsl:attribute name="lang">
               <xsl:call-template name="return-lang-applying-language-map">
                  <xsl:with-param name="doclang" select="@xml:lang"/>
               </xsl:call-template>
            </xsl:attribute>
         </xsl:if>
         <xsl:copy-of select="@ch:*"/>
         <xsl:copy-of xmlns:dmp="http://www.arbortext.com/namespace/dmp/dmpmap" select="@dmp:*"/>
         <xsl:if test="@xml:lang">
            <xsl:attribute name="lang">
               <xsl:call-template name="return-lang-applying-language-map">
                  <xsl:with-param name="doclang" select="@xml:lang"/>
               </xsl:call-template>
            </xsl:attribute>
         </xsl:if>
         <xsl:call-template name="maybe-set-id"/>
         <!--Process this element's content-->
         <xsl:apply-templates/>
      </span>
   </xsl:template>

   <!--Gentext template for Context: _sfe:TocTitle_Table_of_Contents-->
   <xsl:template match="_sfe:TocTitle_Table_of_Contents" mode="expand-gentext" priority="0">
      <xsl:copy>
         <xsl:apply-templates select="@*|node()" mode="expand-gentext"/>
      </xsl:copy>
   </xsl:template>

   <!--Set count-as pass template for Context: _sfe:TocTitle_Table_of_Contents-->
   <xsl:template match="_sfe:TocTitle_Table_of_Contents" mode="set-countas" priority="0">
      <xsl:copy>
         <xsl:apply-templates select="@*|node()" mode="set-countas"/>
      </xsl:copy>
   </xsl:template>

</xsl:stylesheet>

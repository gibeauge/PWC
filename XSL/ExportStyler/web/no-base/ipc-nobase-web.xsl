<?xml version="1.0" encoding="UTF-8" standalone="yes"?>
<!--Copyright Arbortext, Inc., 1999-2008--><?APT StylesheetID Title="IPC Stylesheet no base (XSL-Web)" CompositionTypes="htmlhelp,web,xsl"?><xsl:stylesheet xmlns:simg="java:net.sf.docbook.saxon.ImageIntrinsics"
                xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
                xmlns:ximg="xaln://com.nwalsh.xalan.ImageIntrinsics"
                xmlns:exslt="http://exslt.org/common"
                xmlns:_acl="java:com.arbortext.epic.Acl"
                xmlns:msxsl="urn:schemas-microsoft-com:xslt"
                xmlns="http://www.w3.org/1999/xhtml"
                xmlns:_dtd="http://www.arbortext.com/namespace/Styler/UserElements"
                xmlns:_2="http://www.pwc.ca/namespace/doctypes/jmtosmigrate"
                xmlns:_3="http://www.pwc.ca/namespace/doctypes/migrate"
                xmlns:saxon="http://saxon.sf.net/"
                xmlns:_gte="http://www.arbortext.com/namespace/Styler/GeneratedTextElements"
                xmlns:_js="java:com.arbortext.epic.internal.js.JavaScript"
                xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
                xmlns:_sfe="http://www.arbortext.com/namespace/Styler/StylerFormattingElements"
                xmlns:ch="http://www.arbortext.com/namespace/chunker"
                xmlns:_4="http://www.pwc.ca/namespace/doctypes/emipc"
                xmlns:_="http://www.pwc.ca/namespace/doctypes/ipc"
                xmlns:_ufe="http://www.arbortext.com/namespace/Styler/UserFormattingElements"
                xmlns:atidlm="http://www.arbortext.com/namespace/atidlm"
                version="1.0"
                exclude-result-prefixes="xml _2 _3 saxon _js xsi ch _4 _ atidlm #default exslt msxsl _dtd _ufe _sfe _gte simg ximg _acl">

   <xsl:output encoding="UTF-8" method="html" omit-xml-declaration="yes" indent="yes"
               doctype-public="-//W3C//DTD HTML 4.01 Transitional//EN"
               doctype-system="http://www.w3.org/TR/html4/loose.dtd"/>

   <xsl:variable name="generator-product-name">Arbortext Editor avec Styler</xsl:variable>
   <xsl:variable name="generator-version-number">6.0 M011</xsl:variable>
   <xsl:variable name="generator-version-date">June 01, 2012</xsl:variable>
   <xsl:variable name="generator-version-build">R60M011-153</xsl:variable>


   <!-- We try to set a default for graphics-path, but we expect this parameter to be set by the calling code --><xsl:param name="graphics-path">
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
         <xsl:when test="function-available('simg:new') and function-available('simg:properties')">simg:properties</xsl:when>
         <xsl:when test="function-available('simg:getWidth')">simg:getWidth</xsl:when>
         <xsl:when test="function-available('ximg:getWidth')">ximg:getWidth</xsl:when>
         <xsl:otherwise>none</xsl:otherwise>
      </xsl:choose>
   </xsl:param>
   <xsl:param name="available-graphic-getdepth-extension">
      <xsl:choose>
         <xsl:when test="$graphics-path=''">none</xsl:when>
         <xsl:when test="function-available('simg:new') and function-available('simg:properties')">simg:properties</xsl:when>
         <xsl:when test="function-available('simg:getDepth')">simg:getDepth</xsl:when>
         <xsl:when test="function-available('ximg:getDepth')">ximg:getDepth</xsl:when>
         <xsl:otherwise>none</xsl:otherwise>
      </xsl:choose>
   </xsl:param>

   <xsl:param name="max-expansion-pass-count" select="'7'"/>
   <xsl:param name="skip-post-gentext-pass" select="'no'"/>
   <xsl:param name="gte-namespace-uri"
              select="'http://www.arbortext.com/namespace/Styler/GeneratedTextElements'"/>
   <xsl:param name="skip-remove-xhtml-namespace-pass" select="'no'"/>

   <xsl:template match="/">
      <xsl:call-template name="generate-external-css-file"/>
      <xsl:call-template name="Expand-Gentext"/>
   </xsl:template>

   <xsl:template name="Expand-Gentext">
      <xsl:param name="document-tree">
         <xsl:apply-templates select="/" mode="initial-pass-mode"/>
      </xsl:param>
      <xsl:param name="expansion-pass-count" select="'1'"/>
      <xsl:param name="remove-xhtml-namespace" select="'no'"/>
      <!-- The mode="expand-gentext" pass does what is basically -->
      <!-- an identity transform but adds generated text. -->
      <!-- The resulting result tree (representing the entire document) -->
      <!-- is inspected to see if it contains any _gte:Must-Expand-Gentext -->
      <!-- elements and, if so, we recurse on the expand-gentext process. -->
      <!-- When all gentext is (possibly recursively) expanded, the resulting -->
      <!-- result tree (representing the entire document) is processed in -->
      <!-- mode="post-gentext-expansion" which does the non-gentext part -->
      <!-- of the transformation and styling. -->
      <xsl:variable name="continue-expansion">
         <xsl:call-template name="use-node-set-extension">
            <xsl:with-param name="nodelist" select="$document-tree"/>
            <xsl:with-param name="use-key" select="'test-for-Must-Expand_Gentext'"/>
         </xsl:call-template>
      </xsl:variable>
      <xsl:variable name="need-countas-pass">
         <xsl:call-template name="use-node-set-extension">
            <xsl:with-param name="nodelist" select="$document-tree"/>
            <xsl:with-param name="use-key" select="'test-for-must-do-countas-pass'"/>
         </xsl:call-template>
      </xsl:variable>
      <xsl:variable name="need-numbering-pass">
         <xsl:call-template name="use-node-set-extension">
            <xsl:with-param name="nodelist" select="$document-tree"/>
            <xsl:with-param name="use-key" select="'test-for-must-do-numbering-pass'"/>
         </xsl:call-template>
      </xsl:variable>
      <xsl:variable name="did-set-ch-chunk">
         <xsl:call-template name="use-node-set-extension">
            <xsl:with-param name="nodelist" select="$document-tree"/>
            <xsl:with-param name="use-key" select="'test-for-did-set-ch-chunk'"/>
         </xsl:call-template>
      </xsl:variable>
      <xsl:choose>
         <xsl:when test="($continue-expansion='true') and ($did-set-ch-chunk!='true') and ($expansion-pass-count &lt; $max-expansion-pass-count)">
            <xsl:call-template name="Expand-Gentext">
               <xsl:with-param name="document-tree">
                  <xsl:call-template name="use-node-set-extension">
                     <xsl:with-param name="nodelist" select="$document-tree"/>
                     <xsl:with-param name="use-key" select="'apply-templates-in-set-ch-chunk-mode'"/>
                  </xsl:call-template>
               </xsl:with-param>
               <xsl:with-param name="expansion-pass-count" select="$expansion-pass-count"/>
            </xsl:call-template>
         </xsl:when>
         <xsl:when test="$remove-xhtml-namespace='yes' and $skip-remove-xhtml-namespace-pass='yes'"><!--This 'when' for debugging only--><xsl:copy-of select="$document-tree"/>
         </xsl:when>
         <xsl:when test="$remove-xhtml-namespace='yes'"><!--remove xhtml namespaces--><xsl:call-template name="use-node-set-extension">
               <xsl:with-param name="nodelist" select="$document-tree"/>
               <xsl:with-param name="use-key" select="'apply-templates-in-remove-ns-mode'"/>
            </xsl:call-template>
         </xsl:when>
         <xsl:when test="($continue-expansion='true') and ($expansion-pass-count &lt; $max-expansion-pass-count)">
            <xsl:call-template name="Expand-Gentext">
               <xsl:with-param name="document-tree">
                  <xsl:call-template name="use-node-set-extension">
                     <xsl:with-param name="nodelist" select="$document-tree"/>
                     <xsl:with-param name="use-key" select="'apply-templates-in-gentext-mode'"/>
                  </xsl:call-template>
               </xsl:with-param>
               <xsl:with-param name="expansion-pass-count" select="$expansion-pass-count + 1"/>
            </xsl:call-template>
         </xsl:when>
         <xsl:when test="($need-countas-pass='true') and ($skip-post-gentext-pass!='yes')">
            <xsl:call-template name="Expand-Gentext">
               <xsl:with-param name="document-tree">
                  <xsl:call-template name="use-node-set-extension">
                     <xsl:with-param name="nodelist" select="$document-tree"/>
                     <xsl:with-param name="use-key" select="'apply-templates-in-countas-mode'"/>
                  </xsl:call-template>
               </xsl:with-param>
               <xsl:with-param name="expansion-pass-count" select="$expansion-pass-count"/>
            </xsl:call-template>
         </xsl:when>
         <xsl:when test="($need-numbering-pass='true') and ($skip-post-gentext-pass!='yes')">
            <xsl:call-template name="Expand-Gentext">
               <xsl:with-param name="document-tree">
                  <xsl:call-template name="use-node-set-extension">
                     <xsl:with-param name="nodelist" select="$document-tree"/>
                     <xsl:with-param name="use-key" select="'apply-templates-in-expand-numbering-mode'"/>
                  </xsl:call-template>
               </xsl:with-param>
               <xsl:with-param name="expansion-pass-count" select="$expansion-pass-count"/>
            </xsl:call-template>
         </xsl:when>
         <xsl:when test="$skip-post-gentext-pass='yes'"><!--This 'when' for debugging only--><xsl:copy-of select="$document-tree"/>
         </xsl:when>
         <xsl:otherwise><!--do post gentext pass--><xsl:call-template name="Expand-Gentext">
               <xsl:with-param name="document-tree">
                  <xsl:call-template name="use-node-set-extension">
                     <xsl:with-param name="nodelist" select="$document-tree"/>
                     <xsl:with-param name="use-key" select="'apply-templates-in-post-gentext-mode'"/>
                  </xsl:call-template>
               </xsl:with-param>
               <xsl:with-param name="expansion-pass-count" select="$expansion-pass-count"/>
               <xsl:with-param name="remove-xhtml-namespace" select="'yes'"/>
            </xsl:call-template>
         </xsl:otherwise>
      </xsl:choose>
   </xsl:template>

   <xsl:template match="@*|node()" mode="expand-gentext">
      <xsl:copy>
         <xsl:apply-templates select="@*|node()" mode="expand-gentext"/>
      </xsl:copy>
   </xsl:template>
   <xsl:template match="@*|node()" mode="set-countas">
      <xsl:copy>
         <xsl:apply-templates select="@*|node()" mode="set-countas"/>
      </xsl:copy>
   </xsl:template>
   <xsl:template match="@*|node()" mode="expand-numbering">
      <xsl:copy>
         <xsl:apply-templates select="@*|node()" mode="expand-numbering"/>
      </xsl:copy>
   </xsl:template>

   <xsl:template match="/*" mode="initial-pass-mode" priority="999">
      <xsl:copy>
         <xsl:call-template name="maybe-set-gte-id"/>
         <xsl:apply-templates select="@*" mode="initial-pass-mode"/>
         <_gte:XSLT-pass-control must-do-numbering-pass="true" must-do-countas-pass="true"/>
         <_gte:Must-Expand-Gentext/>
         <xsl:apply-templates select="node()" mode="initial-pass-mode"/>
      </xsl:copy>
   </xsl:template>
   <xsl:template match="@*|node()" mode="initial-pass-mode">
      <xsl:copy>
         <xsl:call-template name="maybe-set-gte-id"/>
         <xsl:apply-templates select="@*|node()" mode="initial-pass-mode"/>
      </xsl:copy>
   </xsl:template>

   <xsl:template match="_gte:XSLT-pass-control" mode="expand-gentext">
      <xsl:copy>
         <xsl:copy-of select="@*"/>
      </xsl:copy>
   </xsl:template>
   <xsl:template match="_gte:XSLT-pass-control" mode="set-countas">
      <xsl:copy>
         <xsl:copy-of select="@*[not(name(.)='must-do-countas-pass')]"/>
      </xsl:copy>
   </xsl:template>
   <xsl:template match="_gte:XSLT-pass-control" mode="expand-numbering">
      <xsl:copy>
         <xsl:copy-of select="@*[not(name(.)='must-do-numbering-pass')]"/>
      </xsl:copy>
   </xsl:template>
   <xsl:template match="_gte:XSLT-pass-control"/>

   <xsl:template match="/*" mode="set-ch-chunk">
      <xsl:copy>
         <xsl:apply-templates select="@*" mode="set-ch-chunk"/>
         <_gte:Must-Expand-Gentext did-set-ch-chunk="yes"/>
         <xsl:apply-templates select="node()" mode="set-ch-chunk"/>
      </xsl:copy>
   </xsl:template>

   <xsl:template match="@*|node()" mode="set-ch-chunk">
      <xsl:copy>
         <xsl:apply-templates select="@*|node()" mode="set-ch-chunk"/>
      </xsl:copy>
   </xsl:template>

   <xsl:template match="_gte:Must-Expand-Gentext" mode="set-ch-chunk">
      <xsl:copy/>
   </xsl:template>

   <xsl:template match="_gte:XSLT-pass-control" mode="set-ch-chunk">
      <xsl:copy>
         <xsl:copy-of select="@*"/>
      </xsl:copy>
   </xsl:template>

   <xsl:template match="_gte:styler_numbering" mode="set-ch-chunk">
      <xsl:copy>
         <xsl:copy-of select="@*"/>
      </xsl:copy>
   </xsl:template>

   <xsl:template xmlns:h="http://www.w3.org/1999/xhtml" match="h:*" mode="remove-xhtml-namespace">
      <xsl:element name="{local-name(.)}" namespace="">
         <xsl:copy-of select="@*"/>
         <xsl:apply-templates mode="remove-xhtml-namespace"/>
      </xsl:element>
   </xsl:template>
   <xsl:template xmlns:atievent="http://www.arbortext.com/namespace/AtiSaxEvents"
                 match="atievent:*"
                 mode="remove-xhtml-namespace">
      <xsl:choose>
         <xsl:when test="$Use-atievent-elements='' or $Use-atievent-elements='false'">
            <xsl:text disable-output-escaping="yes">&lt;</xsl:text>
            <xsl:if test="local-name(.)='endelement'">
               <xsl:text>/</xsl:text>
            </xsl:if>
            <xsl:value-of select="string(@atievent:name)"/>
            <xsl:for-each select="@*[namespace-uri(.)!='http://www.arbortext.com/namespace/AtiSaxEvents']">
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
   <xsl:template match="node()" mode="remove-xhtml-namespace">
      <xsl:copy>
         <xsl:copy-of select="@*"/>
         <xsl:apply-templates mode="remove-xhtml-namespace"/>
      </xsl:copy>
   </xsl:template>

   <xsl:template match="/" mode="post-gentext-expansion">
      <xsl:call-template name="user-visible-root-template"/>
   </xsl:template>

   <xsl:param name="external-css-filename" select="''"/>
   <xsl:param name="relative-external-css-base-filename"
              select="'css/ipc_pw300_pw306a_30B1414_PROC'"/>

   <!-- *** Edited Source for the document root follows *** -->
<!--The user-visible root template--><xsl:template name="user-visible-root-template"><!--Do not change the above line, and edit this template with caution!--><html >          <head>             <title>                <xsl:value-of select="$title"/>             </title>             <!--The following line pulls in required contents. Do not delete!--><xsl:call-template name="include-required-head-contents"></xsl:call-template>          <style type="text/css"> table[rules][rules="none"] > tr > td, table[rules][rules="none"] > * > tr > td, table[rules][rules="none"] > tr > th, table[rules][rules="none"] > * > tr > th, table[rules][rules="none"] > td, table[rules][rules="none"] > th { border-width: thin; border-style: none; } </style></head>          <xsl:apply-templates></xsl:apply-templates>       </html>    </xsl:template>

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

   <xsl:template name="emit-unstyled-template-content"><!--Treat unstyled elements as no-ops--><xsl:apply-templates/>
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
         <xsl:when test="not($using-msxsl)"><!--Not using MSXSL, so generate-id() on this value shouldn't give an error--><xsl:text>true</xsl:text>
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
                  count="*[not( (namespace-uri(.)='http://www.w3.org/1999/XSL/Format') or (namespace-uri(.)='http://www.arbortext.com/namespace/XslFoExtensions') or (starts-with(namespace-uri(.),'http://www.arbortext.com/namespace/Styler/')) )]"/>
   </xsl:template>

   <xsl:template name="apply-templates-on-nodelist">
      <xsl:param name="nodelist-name"/>
      <!--This is no longer used by Styler code, but we include--><!--a definition since it may still be used by old edited source--><xsl:choose>
         <xsl:when test="function-available('exslt:node-set')">
            <xsl:apply-templates select="exslt:node-set($nodelist-name)/node()"/>
         </xsl:when>
         <xsl:when test="function-available('msxsl:node-set')">
            <xsl:apply-templates select="msxsl:node-set($nodelist-name)/node()"/>
         </xsl:when>
         <xsl:otherwise>
            <xsl:value-of select="$nodelist-name"/>
         </xsl:otherwise>
      </xsl:choose>
   </xsl:template>

   <xsl:template name="use-node-set-extension">
      <xsl:param name="nodelist"/>
      <xsl:param name="use-key" select="''"/>
      <xsl:choose>
         <xsl:when test="function-available('exslt:node-set')">
            <xsl:choose>
               <xsl:when test="$use-key='apply-templates-in-gentext-mode'">
                  <xsl:apply-templates select="exslt:node-set($nodelist)" mode="expand-gentext"/>
               </xsl:when>
               <xsl:when test="$use-key='apply-templates-in-set-ch-chunk-mode'">
                  <xsl:apply-templates select="exslt:node-set($nodelist)" mode="set-ch-chunk"/>
               </xsl:when>
               <xsl:when test="$use-key='apply-templates-in-post-gentext-mode'">
                  <xsl:apply-templates select="exslt:node-set($nodelist)" mode="post-gentext-expansion"/>
               </xsl:when>
               <xsl:when test="$use-key='apply-templates-in-remove-ns-mode'">
                  <xsl:apply-templates select="exslt:node-set($nodelist)" mode="remove-xhtml-namespace"/>
               </xsl:when>
               <xsl:when test="$use-key='apply-templates-in-countas-mode'">
                  <xsl:apply-templates select="exslt:node-set($nodelist)" mode="set-countas"/>
               </xsl:when>
               <xsl:when test="$use-key='apply-templates-in-expand-numbering-mode'">
                  <xsl:apply-templates select="exslt:node-set($nodelist)" mode="expand-numbering"/>
               </xsl:when>
               <xsl:when test="$use-key='test-for-did-set-ch-chunk'">
                  <xsl:value-of select="string(boolean(exslt:node-set($nodelist)//_gte:Must-Expand-Gentext/@did-set-ch-chunk))"/>
               </xsl:when>
               <xsl:when test="$use-key='test-for-Must-Expand_Gentext'">
                  <xsl:value-of select="string(boolean(exslt:node-set($nodelist)//_gte:Must-Expand-Gentext))"/>
               </xsl:when>
               <xsl:when test="$use-key='test-for-must-do-countas-pass'">
                  <xsl:value-of select="string(boolean(exslt:node-set($nodelist)/*/_gte:XSLT-pass-control[1]/@must-do-countas-pass))"/>
               </xsl:when>
               <xsl:when test="$use-key='test-for-must-do-numbering-pass'">
                  <xsl:value-of select="string(boolean(exslt:node-set($nodelist)/*/_gte:XSLT-pass-control[1]/@must-do-numbering-pass))"/>
               </xsl:when>
               <xsl:otherwise/>
            </xsl:choose>
         </xsl:when>
         <xsl:when test="function-available('msxsl:node-set')">
            <xsl:choose>
               <xsl:when test="$use-key='apply-templates-in-gentext-mode'">
                  <xsl:apply-templates select="msxsl:node-set($nodelist)" mode="expand-gentext"/>
               </xsl:when>
               <xsl:when test="$use-key='apply-templates-in-set-ch-chunk-mode'">
                  <xsl:apply-templates select="msxsl:node-set($nodelist)" mode="set-ch-chunk"/>
               </xsl:when>
               <xsl:when test="$use-key='apply-templates-in-post-gentext-mode'">
                  <xsl:apply-templates select="msxsl:node-set($nodelist)" mode="post-gentext-expansion"/>
               </xsl:when>
               <xsl:when test="$use-key='apply-templates-in-remove-ns-mode'">
                  <xsl:apply-templates select="msxsl:node-set($nodelist)" mode="remove-xhtml-namespace"/>
               </xsl:when>
               <xsl:when test="$use-key='apply-templates-in-countas-mode'">
                  <xsl:apply-templates select="msxsl:node-set($nodelist)" mode="set-countas"/>
               </xsl:when>
               <xsl:when test="$use-key='apply-templates-in-expand-numbering-mode'">
                  <xsl:apply-templates select="msxsl:node-set($nodelist)" mode="expand-numbering"/>
               </xsl:when>
               <xsl:when test="$use-key='test-for-did-set-ch-chunk'">
                  <xsl:value-of select="string(boolean(msxsl:node-set($nodelist)//_gte:Must-Expand-Gentext/@did-set-ch-chunk))"/>
               </xsl:when>
               <xsl:when test="$use-key='test-for-Must-Expand_Gentext'">
                  <xsl:value-of select="string(boolean(msxsl:node-set($nodelist)//_gte:Must-Expand-Gentext))"/>
               </xsl:when>
               <xsl:when test="$use-key='test-for-must-do-countas-pass'">
                  <xsl:value-of select="string(boolean(msxsl:node-set($nodelist)/*/_gte:XSLT-pass-control[1]/@must-do-countas-pass))"/>
               </xsl:when>
               <xsl:when test="$use-key='test-for-must-do-numbering-pass'">
                  <xsl:value-of select="string(boolean(msxsl:node-set($nodelist)/*/_gte:XSLT-pass-control[1]/@must-do-numbering-pass))"/>
               </xsl:when>
               <xsl:otherwise/>
            </xsl:choose>
         </xsl:when>
         <xsl:otherwise>
            <xsl:choose>
               <xsl:when test="$use-key='apply-templates-in-gentext-mode'">
                  <xsl:value-of select="$nodelist"/>
               </xsl:when>
               <xsl:when test="$use-key='apply-templates-in-set-ch-chunk-mode'">
                  <xsl:value-of select="$nodelist"/>
               </xsl:when>
               <xsl:when test="$use-key='apply-templates-in-post-gentext-mode'">
                  <xsl:value-of select="$nodelist"/>
               </xsl:when>
               <xsl:when test="$use-key='apply-templates-in-remove-ns-mode'">
                  <xsl:value-of select="$nodelist"/>
               </xsl:when>
               <xsl:when test="$use-key='apply-templates-in-countas-mode'">
                  <xsl:value-of select="$nodelist"/>
               </xsl:when>
               <xsl:when test="$use-key='apply-templates-in-expand-numbering-mode'">
                  <xsl:value-of select="$nodelist"/>
               </xsl:when>
               <xsl:when test="$use-key='test-for-did-set-ch-chunk'">
                  <xsl:value-of select="string('false')"/>
               </xsl:when>
               <xsl:when test="$use-key='test-for-Must-Expand_Gentext'">
                  <xsl:value-of select="string('false')"/>
               </xsl:when>
               <xsl:when test="$use-key='test-for-must-do-countas-pass'">
                  <xsl:value-of select="string('false')"/>
               </xsl:when>
               <xsl:when test="$use-key='test-for-must-do-numbering-pass'">
                  <xsl:value-of select="string('false')"/>
               </xsl:when>
               <xsl:otherwise/>
            </xsl:choose>
         </xsl:otherwise>
      </xsl:choose>
   </xsl:template>

   <xsl:template match="*" mode="ElementContent_All">
      <_gte:Must-Expand-Gentext/>
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
            <xsl:when test="$context-node/@_gte:id!='' and not(starts-with($context-node/@_gte:id,'_g_'))">
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
                  <xsl:if test="namespace-uri($context-node)='http://www.arbortext.com/namespace/Styler/UserFormattingElements'">u</xsl:if>
                  <xsl:apply-templates select="$context-node" mode="set-id"/>
               </xsl:attribute>
            </xsl:when>
         </xsl:choose>
      </xsl:if>
   </xsl:template>

   <xsl:param name="show-gtes" select="'yes'"/>
   <xsl:template match="_gte:*"><!--It is probably an error for this template to be called--><xsl:choose>
         <xsl:when test="$show-gtes='yes'"><!--For debugging, show the tagging in the output--><span xsl:use-attribute-sets="unstyled..basestyle">
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
      <_gte:Must-Expand-Gentext/>
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

   <xsl:template match="_gte:Must-Expand-Gentext" mode="expand-gentext"/>
   <xsl:template match="_gte:Must-Expand-Gentext"/>

   <xsl:template match="_gte:FootnoteBody" mode="expand-gentext" priority="-2">
      <xsl:copy>
         <xsl:apply-templates select="@* | node()" mode="expand-gentext"/>
      </xsl:copy>
   </xsl:template>
   <xsl:template match="_gte:FootnoteBody" priority="-0.2"/>
   <xsl:template match="_gte:FootnoteBody//processing-instruction('Pub')[starts-with(., '_font') or starts-with(., '/_font')]"
                 priority="2"/>
   <xsl:template match="_gte:FootnoteBody//processing-instruction('Pub')[starts-with(., '_newline') or starts-with(., '_newcolumn') or starts-with(., '_newpage')]"
                 priority="2"/>
   <xsl:template match="_gte:FootnoteBody//processing-instruction('Pub')[starts-with(., '_nolinebreak') or starts-with(., '/_nolinebreak')]"
                 priority="2"/>

   <xsl:template match="_gte:Gentexted-Content-Wrapper//processing-instruction('Pub')[starts-with(., '_font') or starts-with(., '/_font')]"
                 priority="2">
<!--handle-pub-processing-instruction is defined in lib/xsl/{fo,html}/pi.xsl-->
<xsl:call-template name="handle-pub-processing-instruction">
         <xsl:with-param name="within-gentext" select="true()"/>
      </xsl:call-template>
   </xsl:template>
   <xsl:template match="_gte:Gentexted-Content-Wrapper//processing-instruction('Pub')[starts-with(., '_newline') or starts-with(., '_newcolumn') or starts-with(., '_newpage')]"
                 priority="2"/>
   <xsl:template match="_gte:Gentexted-Content-Wrapper//processing-instruction('Pub')[starts-with(., '_nolinebreak') or starts-with(., '/_nolinebreak')]"
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
      <_gte:Must-Expand-Gentext/>
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
              select="'&#34;bgreen=#C0FFC0; gray3=#D0D0D0; green=#C0FFC0; lime=#E0FFE0; bviolet=#FFC0FF; gray4=#C0C0C0; maroon=#C08080; navy=#A0A0C0; bred=#FFC0CB; borange=#FFC097; gray5=#B0B0B0; olive=#D0D000; red=#FFC0CB; byellow=#FFFFC0; bwhite=#FFFFFF; bbrown=#DEB887; bblack=#808080; black=#808080; brown=#DEB887; teal=#00E0E0; violet=#FFC0FF; white=#FFFFFF; bblue=#C0C0FF; blue=#C0C0FF; orange=#FFC097; transparent=transparent; aqua=#D0FFFF; gray1=#F0F0F0; bgray=#D0D0D0; gray2=#E0E0E0; gray=#D0D0D0; yellow=#FFFFC0;&#34;'"/>
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
               <xsl:value-of select="substring-before(substring-after($fg_colorizer,concat($attrval,'=')),';')"/>
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
               <xsl:value-of select="substring-before(substring-after($bg_colorizer,concat($attrval,'=')),';')"/>
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
               <xsl:otherwise><!--Get the info via ACL's graphic_information() function--><xsl:variable name="aclcmd">
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
               <xsl:when test="normalize-space(@hscale)!='' and $intrinsic-width &gt; 0"><!--We ignore hscale if there is no intrinsic width--><xsl:variable name="hscale-attr-value">
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
               <xsl:otherwise><!--Get the info via ACL's graphic_information() function--><xsl:variable name="aclcmd">
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
               <xsl:when test="normalize-space(@vscale)!='' and $intrinsic-height &gt; 0"><!--We ignore vscale if there is no intrinsic height--><xsl:variable name="vscale-attr-value">
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
            <xsl:when test="(@imagewidth or @imagedepth)"><!-- Set image size from given image dimen(s) --><xsl:if test="@imagewidth">
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
            <xsl:when test="(@imagewidth or @imagedepth)"><!-- Set image size from given image dimen(s) --><xsl:if test="@imagedepth">
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
      <xsl:value-of select="'[No Title]'"/>
   </xsl:variable>

   <!--Define the template with the required head contents-->
<xsl:template name="include-required-head-contents">
      <meta name="Generator"
            content="{$generator-product-name} {$generator-version-number}"/>
      <xsl:value-of select="'&#xA;'"/>
      <xsl:if test="//*/namespace::*[string(.)='http://www.arbortext.com/namespace/graphics']">
         <xsl:variable name="result-doc-graphics-dir">
            <xsl:text>.</xsl:text>
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
         <style type="text/css">.viewpath {display: none;} .viewlinks {display: none;}</style>
      </xsl:if>
      <ch:config>
         <ch:param name="ixsee-addbefore" value=", See "/>
         <ch:param name="ixseealso-addbefore" value="See also "/>
      </ch:config>
      <link href="{concat($relative-external-css-base-filename,'.css')}" rel="stylesheet"
            type="text/css"/>
      <link href="{concat($relative-external-css-base-filename,'_custom.css')}"
            rel="stylesheet"
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

   <xsl:template match="ch:*"><!-- Pass through ch:* elements --><xsl:element name="{name(.)}">
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
               <xsl:when test="contains($valid-inline-lre-override-table,concat(' ',$given-lre-override-name,' '))">
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
               <xsl:when test="contains($valid-lre-override-table,concat(' ',$fo-class,':','-',$given-lre-override-name,' '))">
                  <xsl:value-of select="$fallback-lre"/>
               </xsl:when>
               <xsl:when test="contains($valid-lre-override-table,concat(' ',$fo-class,':','*'))">
                  <xsl:value-of select="$given-lre-override-name"/>
               </xsl:when>
               <xsl:when test="contains($valid-lre-override-table,concat(' ',$fo-class,':',$given-lre-override-name,' '))">
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
<xsl:variable name="ps-box" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">background-color: #F0F0F0; border: thin  solid; padding: 2pt; </xsl:variable>

<!-- *** Edited Source for the 'double-underline' PropertySet follows ***-->
<xsl:variable name="ps-double-underline">border-bottom: 0.2em double;     </xsl:variable>

<xsl:template name="ps-Footnote_font">font-family: serif; font-weight: normal; font-size: 12pt; font-style: normal; color: #000000; background-color: #FFFFFF; text-decoration: no-underline no-line-through; font-variant: normal; </xsl:template>

   <xsl:template name="ps-Index_grouphead_space">margin-bottom: .5pc; </xsl:template>

   <xsl:template name="ps-Index_group_space">margin-top: 1.5pc; </xsl:template>

   <xsl:template name="ps-Link">color: #0000FF; text-decoration: underline ; </xsl:template>

   <xsl:template name="ps-List_item_space">margin-top: 6pt; margin-bottom: 6pt; </xsl:template>

   <!-- *** Edited Source for the 'overline' PropertySet follows ***-->
<xsl:variable name="ps-overline">text-decoration: overline; </xsl:variable>

<xsl:template name="ps-overstrike-with-slash">text-decoration:  line-through; </xsl:template>

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
<xsl:template match="_sfe:BeforeOrAfterText" priority="0"><!--Emit a nostyle template--><xsl:apply-templates/>
   </xsl:template>

   <!--Gentext template for Context: _sfe:BeforeOrAfterText-->
<xsl:template match="_sfe:BeforeOrAfterText" mode="expand-gentext" priority="0">
      <xsl:copy>
         <xsl:apply-templates select="@*|node()" mode="expand-gentext"/>
      </xsl:copy>
   </xsl:template>

   <!--Initial pass template for Context: _sfe:BeforeOrAfterText-->
<xsl:template match="_sfe:BeforeOrAfterText" mode="initial-pass-mode" priority="0">
      <xsl:copy>
         <xsl:call-template name="maybe-set-gte-id"/>
         <xsl:apply-templates select="@*|node()" mode="initial-pass-mode"/>
      </xsl:copy>
   </xsl:template>

   <!--Set count-as pass template for Context: _sfe:BeforeOrAfterText-->
<xsl:template match="_sfe:BeforeOrAfterText" mode="set-countas" priority="0">
      <xsl:copy>
         <xsl:apply-templates select="@*|node()" mode="set-countas"/>
      </xsl:copy>
   </xsl:template>

   <!--Set ch:chunk template for Context: _sfe:BeforeOrAfterText-->
<xsl:template match="_sfe:BeforeOrAfterText" mode="set-ch-chunk" priority="0">
      <xsl:copy>
         <xsl:if test="not(@_gte:did-set-chunk)">
            <xsl:attribute name="_gte:did-set-chunk">yes</xsl:attribute>
         </xsl:if>
         <xsl:apply-templates select="@*|node()" mode="set-ch-chunk"/>
      </xsl:copy>
   </xsl:template>

   <!--Style template for Context: _sfe:CollectionItem[1]-->
<xsl:template name="__style-for__sfe-CollectionItem.4_sCoem221">
      <xsl:text> .x--sfe-CollectionItem-1-0 {margin-left: 0pt; margin-right: 0pt; }</xsl:text>
   </xsl:template>

   <!--Template for Context: _sfe:CollectionItem[1]-->
<xsl:template match="_sfe:CollectionItem[1]" priority="3">
      <span><!--Emit class values to reflect conditions--><xsl:attribute name="class">
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
         <xsl:if test="@xml:lang">
            <xsl:attribute name="lang">
               <xsl:call-template name="return-lang-applying-language-map">
                  <xsl:with-param name="doclang" select="@xml:lang"/>
               </xsl:call-template>
            </xsl:attribute>
         </xsl:if>
         <xsl:call-template name="maybe-set-id"/>
         <!--Process this element's content--><xsl:apply-templates/>
      </span>
   </xsl:template>

   <!--Gentext template for Context: _sfe:CollectionItem[1]-->
<xsl:template match="_sfe:CollectionItem[1]" mode="expand-gentext" priority="3">
      <xsl:copy>
         <xsl:apply-templates select="@*|node()" mode="expand-gentext"/>
      </xsl:copy>
   </xsl:template>

   <!--Initial pass template for Context: _sfe:CollectionItem[1]-->
<xsl:template match="_sfe:CollectionItem[1]" mode="initial-pass-mode" priority="3">
      <xsl:copy>
         <xsl:call-template name="maybe-set-gte-id"/>
         <xsl:apply-templates select="@*|node()" mode="initial-pass-mode"/>
      </xsl:copy>
   </xsl:template>

   <!--Set count-as pass template for Context: _sfe:CollectionItem[1]-->
<xsl:template match="_sfe:CollectionItem[1]" mode="set-countas" priority="3">
      <xsl:copy>
         <xsl:apply-templates select="@*|node()" mode="set-countas"/>
      </xsl:copy>
   </xsl:template>

   <!--Set ch:chunk template for Context: _sfe:CollectionItem[1]-->
<xsl:template match="_sfe:CollectionItem[1]" mode="set-ch-chunk" priority="3">
      <xsl:copy>
         <xsl:if test="not(@_gte:did-set-chunk)">
            <xsl:attribute name="_gte:did-set-chunk">yes</xsl:attribute>
         </xsl:if>
         <xsl:apply-templates select="@*|node()" mode="set-ch-chunk"/>
      </xsl:copy>
   </xsl:template>

   <!--Style template for Context: _sfe:CollectionItem[position()>1 and not(position()=last())]-->
<xsl:template name="__style-for__sfe-CollectionItem.4_sCoem602">
      <xsl:text> .x--sfe-CollectionItem-2-0 {margin-left: 0pt; margin-right: 0pt; }</xsl:text>
   </xsl:template>

   <!--Template for Context: _sfe:CollectionItem[position()>1 and not(position()=last())]-->
<xsl:template match="_sfe:CollectionItem[position()&gt;1 and not(position()=last())]"
                 priority="2">
      <span><!--Emit class values to reflect conditions--><xsl:attribute name="class">
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
         <xsl:if test="@xml:lang">
            <xsl:attribute name="lang">
               <xsl:call-template name="return-lang-applying-language-map">
                  <xsl:with-param name="doclang" select="@xml:lang"/>
               </xsl:call-template>
            </xsl:attribute>
         </xsl:if>
         <xsl:call-template name="maybe-set-id"/>
         <!--Process this element's content--><xsl:apply-templates/>
      </span>
   </xsl:template>

   <!--Gentext template for Context: _sfe:CollectionItem[position()>1 and not(position()=last())]-->
<xsl:template match="_sfe:CollectionItem[position()&gt;1 and not(position()=last())]"
                 mode="expand-gentext"
                 priority="2">
      <xsl:copy>
         <xsl:attribute name="_gte:Gentext-Expanded">y</xsl:attribute>
         <xsl:apply-templates select="@*" mode="expand-gentext"/>
         <xsl:if test="not(@_gte:id)">
            <xsl:attribute name="_gte:id">
               <xsl:value-of select="'_g_'"/>
               <xsl:value-of select="generate-id(.)"/>
            </xsl:attribute>
         </xsl:if>
         <!--Unconditional AddBefore--><xsl:if test="not(@_gte:Gentext-Expanded)">
            <_gte:Must-Expand-Gentext/>
            <_sfe:BeforeOrAfterText>
               <xsl:text>, </xsl:text>
            </_sfe:BeforeOrAfterText>
         </xsl:if>
         <xsl:apply-templates select="* | text() | processing-instruction()" mode="expand-gentext"/>
      </xsl:copy>
   </xsl:template>

   <!--Initial pass template for Context: _sfe:CollectionItem[position()>1 and not(position()=last())]-->
<xsl:template match="_sfe:CollectionItem[position()&gt;1 and not(position()=last())]"
                 mode="initial-pass-mode"
                 priority="2">
      <xsl:copy>
         <xsl:call-template name="maybe-set-gte-id"/>
         <xsl:apply-templates select="@*|node()" mode="initial-pass-mode"/>
      </xsl:copy>
   </xsl:template>

   <!--Set count-as pass template for Context: _sfe:CollectionItem[position()>1 and not(position()=last())]-->
<xsl:template match="_sfe:CollectionItem[position()&gt;1 and not(position()=last())]"
                 mode="set-countas"
                 priority="2">
      <xsl:copy>
         <xsl:apply-templates select="@*|node()" mode="set-countas"/>
      </xsl:copy>
   </xsl:template>

   <!--Set ch:chunk template for Context: _sfe:CollectionItem[position()>1 and not(position()=last())]-->
<xsl:template match="_sfe:CollectionItem[position()&gt;1 and not(position()=last())]"
                 mode="set-ch-chunk"
                 priority="2">
      <xsl:copy>
         <xsl:if test="not(@_gte:did-set-chunk)">
            <xsl:attribute name="_gte:did-set-chunk">yes</xsl:attribute>
         </xsl:if>
         <xsl:apply-templates select="@*|node()" mode="set-ch-chunk"/>
      </xsl:copy>
   </xsl:template>

   <!--Style template for Context: _sfe:CollectionItem[last()]-->
<xsl:template name="__style-for__sfe-CollectionItem.4_sCoem273">
      <xsl:text> .x--sfe-CollectionItem-3-0 {margin-left: 0pt; margin-right: 0pt; }</xsl:text>
   </xsl:template>

   <!--Template for Context: _sfe:CollectionItem[last()]-->
<xsl:template match="_sfe:CollectionItem[last()]" priority="1">
      <span><!--Emit class values to reflect conditions--><xsl:attribute name="class">
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
         <xsl:if test="@xml:lang">
            <xsl:attribute name="lang">
               <xsl:call-template name="return-lang-applying-language-map">
                  <xsl:with-param name="doclang" select="@xml:lang"/>
               </xsl:call-template>
            </xsl:attribute>
         </xsl:if>
         <xsl:call-template name="maybe-set-id"/>
         <!--Process this element's content--><xsl:apply-templates/>
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
         <!--Unconditional AddBefore--><xsl:if test="not(@_gte:Gentext-Expanded)">
            <_gte:Must-Expand-Gentext/>
            <_sfe:BeforeOrAfterText>
               <xsl:text>, and </xsl:text>
            </_sfe:BeforeOrAfterText>
         </xsl:if>
         <xsl:apply-templates select="* | text() | processing-instruction()" mode="expand-gentext"/>
      </xsl:copy>
   </xsl:template>

   <!--Initial pass template for Context: _sfe:CollectionItem[last()]-->
<xsl:template match="_sfe:CollectionItem[last()]" mode="initial-pass-mode" priority="1">
      <xsl:copy>
         <xsl:call-template name="maybe-set-gte-id"/>
         <xsl:apply-templates select="@*|node()" mode="initial-pass-mode"/>
      </xsl:copy>
   </xsl:template>

   <!--Set count-as pass template for Context: _sfe:CollectionItem[last()]-->
<xsl:template match="_sfe:CollectionItem[last()]" mode="set-countas" priority="1">
      <xsl:copy>
         <xsl:apply-templates select="@*|node()" mode="set-countas"/>
      </xsl:copy>
   </xsl:template>

   <!--Set ch:chunk template for Context: _sfe:CollectionItem[last()]-->
<xsl:template match="_sfe:CollectionItem[last()]" mode="set-ch-chunk" priority="1">
      <xsl:copy>
         <xsl:if test="not(@_gte:did-set-chunk)">
            <xsl:attribute name="_gte:did-set-chunk">yes</xsl:attribute>
         </xsl:if>
         <xsl:apply-templates select="@*|node()" mode="set-ch-chunk"/>
      </xsl:copy>
   </xsl:template>

   <!--Style template for Context: _sfe:CollectionItem-->
<xsl:template name="__style-for__sfe-CollectionItem.4_sCoem194">
      <xsl:text> .x--sfe-CollectionItem-4-0 {margin-left: 0pt; margin-right: 0pt; }</xsl:text>
   </xsl:template>

   <!--Template for Context: _sfe:CollectionItem-->
<xsl:template match="_sfe:CollectionItem" priority="0">
      <span><!--Emit class values to reflect conditions--><xsl:attribute name="class">
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
         <xsl:if test="@xml:lang">
            <xsl:attribute name="lang">
               <xsl:call-template name="return-lang-applying-language-map">
                  <xsl:with-param name="doclang" select="@xml:lang"/>
               </xsl:call-template>
            </xsl:attribute>
         </xsl:if>
         <xsl:call-template name="maybe-set-id"/>
         <!--Process this element's content--><xsl:apply-templates/>
      </span>
   </xsl:template>

   <!--Gentext template for Context: _sfe:CollectionItem-->
<xsl:template match="_sfe:CollectionItem" mode="expand-gentext" priority="0">
      <xsl:copy>
         <xsl:apply-templates select="@*|node()" mode="expand-gentext"/>
      </xsl:copy>
   </xsl:template>

   <!--Initial pass template for Context: _sfe:CollectionItem-->
<xsl:template match="_sfe:CollectionItem" mode="initial-pass-mode" priority="0">
      <xsl:copy>
         <xsl:call-template name="maybe-set-gte-id"/>
         <xsl:apply-templates select="@*|node()" mode="initial-pass-mode"/>
      </xsl:copy>
   </xsl:template>

   <!--Set count-as pass template for Context: _sfe:CollectionItem-->
<xsl:template match="_sfe:CollectionItem" mode="set-countas" priority="0">
      <xsl:copy>
         <xsl:apply-templates select="@*|node()" mode="set-countas"/>
      </xsl:copy>
   </xsl:template>

   <!--Set ch:chunk template for Context: _sfe:CollectionItem-->
<xsl:template match="_sfe:CollectionItem" mode="set-ch-chunk" priority="0">
      <xsl:copy>
         <xsl:if test="not(@_gte:did-set-chunk)">
            <xsl:attribute name="_gte:did-set-chunk">yes</xsl:attribute>
         </xsl:if>
         <xsl:apply-templates select="@*|node()" mode="set-ch-chunk"/>
      </xsl:copy>
   </xsl:template>

   <!--Style template for Context: _sfe:CrossReference-->
<xsl:template name="__style-for__sfe-CrossReference.1">
      <xsl:text> .x--sfe-CrossReference-1-0 {margin-left: 0pt; margin-right: 0pt; }</xsl:text>
   </xsl:template>

   <!--Template for Context: _sfe:CrossReference-->
<xsl:template match="_sfe:CrossReference" priority="0">
      <span><!--Emit class values to reflect conditions--><xsl:attribute name="class">
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
         <xsl:if test="@xml:lang">
            <xsl:attribute name="lang">
               <xsl:call-template name="return-lang-applying-language-map">
                  <xsl:with-param name="doclang" select="@xml:lang"/>
               </xsl:call-template>
            </xsl:attribute>
         </xsl:if>
         <xsl:call-template name="maybe-set-id"/>
         <!--Process this element's content--><xsl:apply-templates/>
      </span>
   </xsl:template>

   <!--Gentext template for Context: _sfe:CrossReference-->
<xsl:template match="_sfe:CrossReference" mode="expand-gentext" priority="0">
      <xsl:copy>
         <xsl:apply-templates select="@*|node()" mode="expand-gentext"/>
      </xsl:copy>
   </xsl:template>

   <!--Initial pass template for Context: _sfe:CrossReference-->
<xsl:template match="_sfe:CrossReference" mode="initial-pass-mode" priority="0">
      <xsl:copy>
         <xsl:call-template name="maybe-set-gte-id"/>
         <xsl:apply-templates select="@*|node()" mode="initial-pass-mode"/>
      </xsl:copy>
   </xsl:template>

   <!--Set count-as pass template for Context: _sfe:CrossReference-->
<xsl:template match="_sfe:CrossReference" mode="set-countas" priority="0">
      <xsl:copy>
         <xsl:apply-templates select="@*|node()" mode="set-countas"/>
      </xsl:copy>
   </xsl:template>

   <!--Set ch:chunk template for Context: _sfe:CrossReference-->
<xsl:template match="_sfe:CrossReference" mode="set-ch-chunk" priority="0">
      <xsl:copy>
         <xsl:if test="not(@_gte:did-set-chunk)">
            <xsl:attribute name="_gte:did-set-chunk">yes</xsl:attribute>
         </xsl:if>
         <xsl:apply-templates select="@*|node()" mode="set-ch-chunk"/>
      </xsl:copy>
   </xsl:template>

   <!--Style template for Context: _sfe:HeaderOrFooter//_sfe:CrossReferenceTitle-->
<xsl:template name="__style-for__sfe-CrossReferenceTitle.2_sHele451">
      <xsl:text> .x--sfe-CrossReferenceTitle-1-0 {margin-left: 0pt; margin-right: 0pt; }</xsl:text>
   </xsl:template>

   <!--Template for Context: _sfe:HeaderOrFooter//_sfe:CrossReferenceTitle-->
<xsl:template match="_sfe:HeaderOrFooter//_sfe:CrossReferenceTitle" priority="1">
      <span><!--Emit class values to reflect conditions--><xsl:attribute name="class">
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
         <xsl:if test="@xml:lang">
            <xsl:attribute name="lang">
               <xsl:call-template name="return-lang-applying-language-map">
                  <xsl:with-param name="doclang" select="@xml:lang"/>
               </xsl:call-template>
            </xsl:attribute>
         </xsl:if>
         <xsl:call-template name="maybe-set-id"/>
         <!--Process this element's content--><xsl:apply-templates/>
      </span>
   </xsl:template>

   <!--Gentext template for Context: _sfe:HeaderOrFooter//_sfe:CrossReferenceTitle-->
<xsl:template match="_sfe:HeaderOrFooter//_sfe:CrossReferenceTitle" mode="expand-gentext"
                 priority="1">
      <xsl:copy>
         <xsl:apply-templates select="@*|node()" mode="expand-gentext"/>
      </xsl:copy>
   </xsl:template>

   <!--Initial pass template for Context: _sfe:HeaderOrFooter//_sfe:CrossReferenceTitle-->
<xsl:template match="_sfe:HeaderOrFooter//_sfe:CrossReferenceTitle" mode="initial-pass-mode"
                 priority="1">
      <xsl:copy>
         <xsl:call-template name="maybe-set-gte-id"/>
         <xsl:apply-templates select="@*|node()" mode="initial-pass-mode"/>
      </xsl:copy>
   </xsl:template>

   <!--Set count-as pass template for Context: _sfe:HeaderOrFooter//_sfe:CrossReferenceTitle-->
<xsl:template match="_sfe:HeaderOrFooter//_sfe:CrossReferenceTitle" mode="set-countas"
                 priority="1">
      <xsl:copy>
         <xsl:apply-templates select="@*|node()" mode="set-countas"/>
      </xsl:copy>
   </xsl:template>

   <!--Set ch:chunk template for Context: _sfe:HeaderOrFooter//_sfe:CrossReferenceTitle-->
<xsl:template match="_sfe:HeaderOrFooter//_sfe:CrossReferenceTitle" mode="set-ch-chunk"
                 priority="1">
      <xsl:copy>
         <xsl:if test="not(@_gte:did-set-chunk)">
            <xsl:attribute name="_gte:did-set-chunk">yes</xsl:attribute>
         </xsl:if>
         <xsl:apply-templates select="@*|node()" mode="set-ch-chunk"/>
      </xsl:copy>
   </xsl:template>

   <!--Style template for Context: _sfe:CrossReferenceTitle-->
<xsl:template name="__style-for__sfe-CrossReferenceTitle.2_sCrle242">
      <xsl:text> .x--sfe-CrossReferenceTitle-2-0 {margin-left: 0pt; margin-right: 0pt; font-style: italic; }</xsl:text>
   </xsl:template>

   <!--Template for Context: _sfe:CrossReferenceTitle-->
<xsl:template match="_sfe:CrossReferenceTitle" priority="0">
      <span><!--Emit class values to reflect conditions--><xsl:attribute name="class">
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
         <xsl:if test="@xml:lang">
            <xsl:attribute name="lang">
               <xsl:call-template name="return-lang-applying-language-map">
                  <xsl:with-param name="doclang" select="@xml:lang"/>
               </xsl:call-template>
            </xsl:attribute>
         </xsl:if>
         <xsl:call-template name="maybe-set-id"/>
         <!--Process this element's content--><xsl:apply-templates/>
      </span>
   </xsl:template>

   <!--Gentext template for Context: _sfe:CrossReferenceTitle-->
<xsl:template match="_sfe:CrossReferenceTitle" mode="expand-gentext" priority="0">
      <xsl:copy>
         <xsl:apply-templates select="@*|node()" mode="expand-gentext"/>
      </xsl:copy>
   </xsl:template>

   <!--Initial pass template for Context: _sfe:CrossReferenceTitle-->
<xsl:template match="_sfe:CrossReferenceTitle" mode="initial-pass-mode" priority="0">
      <xsl:copy>
         <xsl:call-template name="maybe-set-gte-id"/>
         <xsl:apply-templates select="@*|node()" mode="initial-pass-mode"/>
      </xsl:copy>
   </xsl:template>

   <!--Set count-as pass template for Context: _sfe:CrossReferenceTitle-->
<xsl:template match="_sfe:CrossReferenceTitle" mode="set-countas" priority="0">
      <xsl:copy>
         <xsl:apply-templates select="@*|node()" mode="set-countas"/>
      </xsl:copy>
   </xsl:template>

   <!--Set ch:chunk template for Context: _sfe:CrossReferenceTitle-->
<xsl:template match="_sfe:CrossReferenceTitle" mode="set-ch-chunk" priority="0">
      <xsl:copy>
         <xsl:if test="not(@_gte:did-set-chunk)">
            <xsl:attribute name="_gte:did-set-chunk">yes</xsl:attribute>
         </xsl:if>
         <xsl:apply-templates select="@*|node()" mode="set-ch-chunk"/>
      </xsl:copy>
   </xsl:template>

   <!--Style template for Context: _sfe:Gentext-->
<xsl:template name="__style-for__sfe-Gentext.1">
      <xsl:text> .x--sfe-Gentext-1-0 {margin-left: 0pt; margin-right: 0pt; }</xsl:text>
   </xsl:template>

   <!--Template for Context: _sfe:Gentext-->
<xsl:template match="_sfe:Gentext" priority="0"><!--Emit a nostyle template--><xsl:apply-templates/>
   </xsl:template>

   <!--Gentext template for Context: _sfe:Gentext-->
<xsl:template match="_sfe:Gentext" mode="expand-gentext" priority="0">
      <xsl:copy>
         <xsl:apply-templates select="@*|node()" mode="expand-gentext"/>
      </xsl:copy>
   </xsl:template>

   <!--Initial pass template for Context: _sfe:Gentext-->
<xsl:template match="_sfe:Gentext" mode="initial-pass-mode" priority="0">
      <xsl:copy>
         <xsl:call-template name="maybe-set-gte-id"/>
         <xsl:apply-templates select="@*|node()" mode="initial-pass-mode"/>
      </xsl:copy>
   </xsl:template>

   <!--Set count-as pass template for Context: _sfe:Gentext-->
<xsl:template match="_sfe:Gentext" mode="set-countas" priority="0">
      <xsl:copy>
         <xsl:apply-templates select="@*|node()" mode="set-countas"/>
      </xsl:copy>
   </xsl:template>

   <!--Set ch:chunk template for Context: _sfe:Gentext-->
<xsl:template match="_sfe:Gentext" mode="set-ch-chunk" priority="0">
      <xsl:copy>
         <xsl:if test="not(@_gte:did-set-chunk)">
            <xsl:attribute name="_gte:did-set-chunk">yes</xsl:attribute>
         </xsl:if>
         <xsl:apply-templates select="@*|node()" mode="set-ch-chunk"/>
      </xsl:copy>
   </xsl:template>

   <!--Style template for Context: _sfe:HeaderOrFooter-->
<xsl:template name="__style-for__sfe-HeaderOrFooter.1">
      <xsl:text> .x--sfe-HeaderOrFooter-1-0 {margin-left: 0pt; margin-right: 0pt; text-indent: 0pt; margin-top: 0pt; }</xsl:text>
   </xsl:template>

   <!--Template for Context: _sfe:HeaderOrFooter-->
<xsl:template match="_sfe:HeaderOrFooter" priority="0">
      <div><!--Emit class values to reflect conditions--><xsl:attribute name="class">
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
         <xsl:if test="@xml:lang">
            <xsl:attribute name="lang">
               <xsl:call-template name="return-lang-applying-language-map">
                  <xsl:with-param name="doclang" select="@xml:lang"/>
               </xsl:call-template>
            </xsl:attribute>
         </xsl:if>
         <xsl:call-template name="maybe-set-id"/>
         <!--Process this element's content--><xsl:apply-templates/>
      </div>
   </xsl:template>

   <!--Gentext template for Context: _sfe:HeaderOrFooter-->
<xsl:template match="_sfe:HeaderOrFooter" mode="expand-gentext" priority="0">
      <xsl:copy>
         <xsl:apply-templates select="@*|node()" mode="expand-gentext"/>
      </xsl:copy>
   </xsl:template>

   <!--Initial pass template for Context: _sfe:HeaderOrFooter-->
<xsl:template match="_sfe:HeaderOrFooter" mode="initial-pass-mode" priority="0">
      <xsl:copy>
         <xsl:call-template name="maybe-set-gte-id"/>
         <xsl:apply-templates select="@*|node()" mode="initial-pass-mode"/>
      </xsl:copy>
   </xsl:template>

   <!--Set count-as pass template for Context: _sfe:HeaderOrFooter-->
<xsl:template match="_sfe:HeaderOrFooter" mode="set-countas" priority="0">
      <xsl:copy>
         <xsl:apply-templates select="@*|node()" mode="set-countas"/>
      </xsl:copy>
   </xsl:template>

   <!--Set ch:chunk template for Context: _sfe:HeaderOrFooter-->
<xsl:template match="_sfe:HeaderOrFooter" mode="set-ch-chunk" priority="0">
      <xsl:copy>
         <xsl:if test="not(@_gte:did-set-chunk)">
            <xsl:attribute name="_gte:did-set-chunk">yes</xsl:attribute>
         </xsl:if>
         <xsl:apply-templates select="@*|node()" mode="set-ch-chunk"/>
      </xsl:copy>
   </xsl:template>

   <!--Style template for Context: _sfe:Index-->
<xsl:template name="__style-for__sfe-Index.1">
      <xsl:text> .x--sfe-Index-1-0 {margin-left: 0pt; margin-right: 0pt; text-indent: 0pt; }</xsl:text>
   </xsl:template>

   <!--Template for Context: _sfe:Index-->
<xsl:template match="_sfe:Index" priority="0">
      <div><!--Emit class values to reflect conditions--><xsl:attribute name="class">
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
         <xsl:if test="@xml:lang">
            <xsl:attribute name="lang">
               <xsl:call-template name="return-lang-applying-language-map">
                  <xsl:with-param name="doclang" select="@xml:lang"/>
               </xsl:call-template>
            </xsl:attribute>
         </xsl:if>
         <xsl:call-template name="maybe-set-id"/>
         <!--Process this element's content--><xsl:apply-templates/>
      </div>
   </xsl:template>

   <!--Gentext template for Context: _sfe:Index-->
<xsl:template match="_sfe:Index" mode="expand-gentext" priority="0">
      <xsl:copy>
         <xsl:apply-templates select="@*|node()" mode="expand-gentext"/>
      </xsl:copy>
   </xsl:template>

   <!--Initial pass template for Context: _sfe:Index-->
<xsl:template match="_sfe:Index" mode="initial-pass-mode" priority="0">
      <xsl:copy>
         <xsl:call-template name="maybe-set-gte-id"/>
         <xsl:apply-templates select="@*|node()" mode="initial-pass-mode"/>
      </xsl:copy>
   </xsl:template>

   <!--Set count-as pass template for Context: _sfe:Index-->
<xsl:template match="_sfe:Index" mode="set-countas" priority="0">
      <xsl:copy>
         <xsl:apply-templates select="@*|node()" mode="set-countas"/>
      </xsl:copy>
   </xsl:template>

   <!--Set ch:chunk template for Context: _sfe:Index-->
<xsl:template match="_sfe:Index" mode="set-ch-chunk" priority="0">
      <xsl:copy>
         <xsl:if test="not(@_gte:did-set-chunk)">
            <xsl:attribute name="_gte:did-set-chunk">yes</xsl:attribute>
         </xsl:if>
         <xsl:apply-templates select="@*|node()" mode="set-ch-chunk"/>
      </xsl:copy>
   </xsl:template>

   <!--Style template for Context: _sfe:IndexAlphaGroup-->
<xsl:template name="__style-for__sfe-IndexAlphaGroup.1">
      <xsl:text> .x--sfe-IndexAlphaGroup-1-0 {margin-left: 0pt; margin-right: 0pt; text-indent: 0pt; margin-top: 1.5pc; }</xsl:text>
   </xsl:template>

   <!--Template for Context: _sfe:IndexAlphaGroup-->
<xsl:template match="_sfe:IndexAlphaGroup" priority="0">
      <div><!--Emit class values to reflect conditions--><xsl:attribute name="class">
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
         <xsl:if test="@xml:lang">
            <xsl:attribute name="lang">
               <xsl:call-template name="return-lang-applying-language-map">
                  <xsl:with-param name="doclang" select="@xml:lang"/>
               </xsl:call-template>
            </xsl:attribute>
         </xsl:if>
         <xsl:call-template name="maybe-set-id"/>
         <!--Process this element's content--><xsl:apply-templates/>
      </div>
   </xsl:template>

   <!--Gentext template for Context: _sfe:IndexAlphaGroup-->
<xsl:template match="_sfe:IndexAlphaGroup" mode="expand-gentext" priority="0">
      <xsl:copy>
         <xsl:apply-templates select="@*|node()" mode="expand-gentext"/>
      </xsl:copy>
   </xsl:template>

   <!--Initial pass template for Context: _sfe:IndexAlphaGroup-->
<xsl:template match="_sfe:IndexAlphaGroup" mode="initial-pass-mode" priority="0">
      <xsl:copy>
         <xsl:call-template name="maybe-set-gte-id"/>
         <xsl:apply-templates select="@*|node()" mode="initial-pass-mode"/>
      </xsl:copy>
   </xsl:template>

   <!--Set count-as pass template for Context: _sfe:IndexAlphaGroup-->
<xsl:template match="_sfe:IndexAlphaGroup" mode="set-countas" priority="0">
      <xsl:copy>
         <xsl:apply-templates select="@*|node()" mode="set-countas"/>
      </xsl:copy>
   </xsl:template>

   <!--Set ch:chunk template for Context: _sfe:IndexAlphaGroup-->
<xsl:template match="_sfe:IndexAlphaGroup" mode="set-ch-chunk" priority="0">
      <xsl:copy>
         <xsl:if test="not(@_gte:did-set-chunk)">
            <xsl:attribute name="_gte:did-set-chunk">yes</xsl:attribute>
         </xsl:if>
         <xsl:apply-templates select="@*|node()" mode="set-ch-chunk"/>
      </xsl:copy>
   </xsl:template>

   <!--Style template for Context: _sfe:IndexEndPage-->
<xsl:template name="__style-for__sfe-IndexEndPage.1">
      <xsl:text> .x--sfe-IndexEndPage-1-0 {margin-left: 0pt; margin-right: 0pt; }</xsl:text>
   </xsl:template>

   <!--Template for Context: _sfe:IndexEndPage-->
<xsl:template match="_sfe:IndexEndPage" priority="0">
      <span><!--Emit class values to reflect conditions--><xsl:attribute name="class">
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
         <xsl:if test="@xml:lang">
            <xsl:attribute name="lang">
               <xsl:call-template name="return-lang-applying-language-map">
                  <xsl:with-param name="doclang" select="@xml:lang"/>
               </xsl:call-template>
            </xsl:attribute>
         </xsl:if>
         <xsl:call-template name="maybe-set-id"/>
         <!--Process this element's content--><xsl:apply-templates/>
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
         <!--Unconditional AddBefore--><xsl:if test="not(@_gte:Gentext-Expanded)">
            <_gte:Must-Expand-Gentext/>
            <_sfe:BeforeOrAfterText>
               <xsl:text>–</xsl:text>
            </_sfe:BeforeOrAfterText>
         </xsl:if>
         <xsl:apply-templates select="* | text() | processing-instruction()" mode="expand-gentext"/>
      </xsl:copy>
   </xsl:template>

   <!--Initial pass template for Context: _sfe:IndexEndPage-->
<xsl:template match="_sfe:IndexEndPage" mode="initial-pass-mode" priority="0">
      <xsl:copy>
         <xsl:call-template name="maybe-set-gte-id"/>
         <xsl:apply-templates select="@*|node()" mode="initial-pass-mode"/>
      </xsl:copy>
   </xsl:template>

   <!--Set count-as pass template for Context: _sfe:IndexEndPage-->
<xsl:template match="_sfe:IndexEndPage" mode="set-countas" priority="0">
      <xsl:copy>
         <xsl:apply-templates select="@*|node()" mode="set-countas"/>
      </xsl:copy>
   </xsl:template>

   <!--Set ch:chunk template for Context: _sfe:IndexEndPage-->
<xsl:template match="_sfe:IndexEndPage" mode="set-ch-chunk" priority="0">
      <xsl:copy>
         <xsl:if test="not(@_gte:did-set-chunk)">
            <xsl:attribute name="_gte:did-set-chunk">yes</xsl:attribute>
         </xsl:if>
         <xsl:apply-templates select="@*|node()" mode="set-ch-chunk"/>
      </xsl:copy>
   </xsl:template>

   <!--Style template for Context: _sfe:IndexEntry/_sfe:IndexEntry/_sfe:IndexEntry/_sfe:IndexEntry-->
<xsl:template name="__style-for__sfe-IndexEntry.4_sInry631">
      <xsl:text> .x--sfe-IndexEntry-1-0 {margin-left: 0pt; margin-right: 0pt; text-indent: 0pt; margin-left: 1em; text-indent: -.5em; text-align: left; }</xsl:text>
   </xsl:template>

   <!--Template for Context: _sfe:IndexEntry/_sfe:IndexEntry/_sfe:IndexEntry/_sfe:IndexEntry-->
<xsl:template match="_sfe:IndexEntry/_sfe:IndexEntry/_sfe:IndexEntry/_sfe:IndexEntry"
                 priority="3">
      <div><!--Emit class values to reflect conditions--><xsl:attribute name="class">
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
         <xsl:if test="@xml:lang">
            <xsl:attribute name="lang">
               <xsl:call-template name="return-lang-applying-language-map">
                  <xsl:with-param name="doclang" select="@xml:lang"/>
               </xsl:call-template>
            </xsl:attribute>
         </xsl:if>
         <xsl:call-template name="maybe-set-id"/>
         <!--Process this element's content--><xsl:apply-templates/>
      </div>
   </xsl:template>

   <!--Gentext template for Context: _sfe:IndexEntry/_sfe:IndexEntry/_sfe:IndexEntry/_sfe:IndexEntry-->
<xsl:template match="_sfe:IndexEntry/_sfe:IndexEntry/_sfe:IndexEntry/_sfe:IndexEntry"
                 mode="expand-gentext"
                 priority="3">
      <xsl:copy>
         <xsl:apply-templates select="@*|node()" mode="expand-gentext"/>
      </xsl:copy>
   </xsl:template>

   <!--Initial pass template for Context: _sfe:IndexEntry/_sfe:IndexEntry/_sfe:IndexEntry/_sfe:IndexEntry-->
<xsl:template match="_sfe:IndexEntry/_sfe:IndexEntry/_sfe:IndexEntry/_sfe:IndexEntry"
                 mode="initial-pass-mode"
                 priority="3">
      <xsl:copy>
         <xsl:call-template name="maybe-set-gte-id"/>
         <xsl:apply-templates select="@*|node()" mode="initial-pass-mode"/>
      </xsl:copy>
   </xsl:template>

   <!--Set count-as pass template for Context: _sfe:IndexEntry/_sfe:IndexEntry/_sfe:IndexEntry/_sfe:IndexEntry-->
<xsl:template match="_sfe:IndexEntry/_sfe:IndexEntry/_sfe:IndexEntry/_sfe:IndexEntry"
                 mode="set-countas"
                 priority="3">
      <xsl:copy>
         <xsl:apply-templates select="@*|node()" mode="set-countas"/>
      </xsl:copy>
   </xsl:template>

   <!--Set ch:chunk template for Context: _sfe:IndexEntry/_sfe:IndexEntry/_sfe:IndexEntry/_sfe:IndexEntry-->
<xsl:template match="_sfe:IndexEntry/_sfe:IndexEntry/_sfe:IndexEntry/_sfe:IndexEntry"
                 mode="set-ch-chunk"
                 priority="3">
      <xsl:copy>
         <xsl:if test="not(@_gte:did-set-chunk)">
            <xsl:attribute name="_gte:did-set-chunk">yes</xsl:attribute>
         </xsl:if>
         <xsl:apply-templates select="@*|node()" mode="set-ch-chunk"/>
      </xsl:copy>
   </xsl:template>

   <!--Style template for Context: _sfe:IndexEntry/_sfe:IndexEntry/_sfe:IndexEntry-->
<xsl:template name="__style-for__sfe-IndexEntry.4_sInry472">
      <xsl:text> .x--sfe-IndexEntry-2-0 {margin-left: 0pt; margin-right: 0pt; text-indent: 0pt; margin-left: 1em; text-indent: -.5em; text-align: left; }</xsl:text>
   </xsl:template>

   <!--Template for Context: _sfe:IndexEntry/_sfe:IndexEntry/_sfe:IndexEntry-->
<xsl:template match="_sfe:IndexEntry/_sfe:IndexEntry/_sfe:IndexEntry" priority="2">
      <div><!--Emit class values to reflect conditions--><xsl:attribute name="class">
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
         <xsl:if test="@xml:lang">
            <xsl:attribute name="lang">
               <xsl:call-template name="return-lang-applying-language-map">
                  <xsl:with-param name="doclang" select="@xml:lang"/>
               </xsl:call-template>
            </xsl:attribute>
         </xsl:if>
         <xsl:call-template name="maybe-set-id"/>
         <!--Process this element's content--><xsl:apply-templates/>
      </div>
   </xsl:template>

   <!--Gentext template for Context: _sfe:IndexEntry/_sfe:IndexEntry/_sfe:IndexEntry-->
<xsl:template match="_sfe:IndexEntry/_sfe:IndexEntry/_sfe:IndexEntry" mode="expand-gentext"
                 priority="2">
      <xsl:copy>
         <xsl:apply-templates select="@*|node()" mode="expand-gentext"/>
      </xsl:copy>
   </xsl:template>

   <!--Initial pass template for Context: _sfe:IndexEntry/_sfe:IndexEntry/_sfe:IndexEntry-->
<xsl:template match="_sfe:IndexEntry/_sfe:IndexEntry/_sfe:IndexEntry"
                 mode="initial-pass-mode"
                 priority="2">
      <xsl:copy>
         <xsl:call-template name="maybe-set-gte-id"/>
         <xsl:apply-templates select="@*|node()" mode="initial-pass-mode"/>
      </xsl:copy>
   </xsl:template>

   <!--Set count-as pass template for Context: _sfe:IndexEntry/_sfe:IndexEntry/_sfe:IndexEntry-->
<xsl:template match="_sfe:IndexEntry/_sfe:IndexEntry/_sfe:IndexEntry" mode="set-countas"
                 priority="2">
      <xsl:copy>
         <xsl:apply-templates select="@*|node()" mode="set-countas"/>
      </xsl:copy>
   </xsl:template>

   <!--Set ch:chunk template for Context: _sfe:IndexEntry/_sfe:IndexEntry/_sfe:IndexEntry-->
<xsl:template match="_sfe:IndexEntry/_sfe:IndexEntry/_sfe:IndexEntry" mode="set-ch-chunk"
                 priority="2">
      <xsl:copy>
         <xsl:if test="not(@_gte:did-set-chunk)">
            <xsl:attribute name="_gte:did-set-chunk">yes</xsl:attribute>
         </xsl:if>
         <xsl:apply-templates select="@*|node()" mode="set-ch-chunk"/>
      </xsl:copy>
   </xsl:template>

   <!--Style template for Context: _sfe:IndexEntry/_sfe:IndexEntry-->
<xsl:template name="__style-for__sfe-IndexEntry.4_sInry313">
      <xsl:text> .x--sfe-IndexEntry-3-0 {margin-left: 0pt; margin-right: 0pt; text-indent: 0pt; margin-left: 1em; text-indent: -.5em; text-align: left; }</xsl:text>
   </xsl:template>

   <!--Template for Context: _sfe:IndexEntry/_sfe:IndexEntry-->
<xsl:template match="_sfe:IndexEntry/_sfe:IndexEntry" priority="1">
      <div><!--Emit class values to reflect conditions--><xsl:attribute name="class">
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
         <xsl:if test="@xml:lang">
            <xsl:attribute name="lang">
               <xsl:call-template name="return-lang-applying-language-map">
                  <xsl:with-param name="doclang" select="@xml:lang"/>
               </xsl:call-template>
            </xsl:attribute>
         </xsl:if>
         <xsl:call-template name="maybe-set-id"/>
         <!--Process this element's content--><xsl:apply-templates/>
      </div>
   </xsl:template>

   <!--Gentext template for Context: _sfe:IndexEntry/_sfe:IndexEntry-->
<xsl:template match="_sfe:IndexEntry/_sfe:IndexEntry" mode="expand-gentext" priority="1">
      <xsl:copy>
         <xsl:apply-templates select="@*|node()" mode="expand-gentext"/>
      </xsl:copy>
   </xsl:template>

   <!--Initial pass template for Context: _sfe:IndexEntry/_sfe:IndexEntry-->
<xsl:template match="_sfe:IndexEntry/_sfe:IndexEntry" mode="initial-pass-mode" priority="1">
      <xsl:copy>
         <xsl:call-template name="maybe-set-gte-id"/>
         <xsl:apply-templates select="@*|node()" mode="initial-pass-mode"/>
      </xsl:copy>
   </xsl:template>

   <!--Set count-as pass template for Context: _sfe:IndexEntry/_sfe:IndexEntry-->
<xsl:template match="_sfe:IndexEntry/_sfe:IndexEntry" mode="set-countas" priority="1">
      <xsl:copy>
         <xsl:apply-templates select="@*|node()" mode="set-countas"/>
      </xsl:copy>
   </xsl:template>

   <!--Set ch:chunk template for Context: _sfe:IndexEntry/_sfe:IndexEntry-->
<xsl:template match="_sfe:IndexEntry/_sfe:IndexEntry" mode="set-ch-chunk" priority="1">
      <xsl:copy>
         <xsl:if test="not(@_gte:did-set-chunk)">
            <xsl:attribute name="_gte:did-set-chunk">yes</xsl:attribute>
         </xsl:if>
         <xsl:apply-templates select="@*|node()" mode="set-ch-chunk"/>
      </xsl:copy>
   </xsl:template>

   <!--Style template for Context: _sfe:IndexEntry-->
<xsl:template name="__style-for__sfe-IndexEntry.4_sInry154">
      <xsl:text> .x--sfe-IndexEntry-4-0 {margin-left: 0pt; margin-right: 0pt; text-indent: 0pt; margin-left: .5em; margin-right: 2pc; text-indent: -.5em; text-align: left; }</xsl:text>
   </xsl:template>

   <!--Template for Context: _sfe:IndexEntry-->
<xsl:template match="_sfe:IndexEntry" priority="0">
      <div><!--Emit class values to reflect conditions--><xsl:attribute name="class">
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
         <xsl:if test="@xml:lang">
            <xsl:attribute name="lang">
               <xsl:call-template name="return-lang-applying-language-map">
                  <xsl:with-param name="doclang" select="@xml:lang"/>
               </xsl:call-template>
            </xsl:attribute>
         </xsl:if>
         <xsl:call-template name="maybe-set-id"/>
         <!--Process this element's content--><xsl:apply-templates/>
      </div>
   </xsl:template>

   <!--Gentext template for Context: _sfe:IndexEntry-->
<xsl:template match="_sfe:IndexEntry" mode="expand-gentext" priority="0">
      <xsl:copy>
         <xsl:apply-templates select="@*|node()" mode="expand-gentext"/>
      </xsl:copy>
   </xsl:template>

   <!--Initial pass template for Context: _sfe:IndexEntry-->
<xsl:template match="_sfe:IndexEntry" mode="initial-pass-mode" priority="0">
      <xsl:copy>
         <xsl:call-template name="maybe-set-gte-id"/>
         <xsl:apply-templates select="@*|node()" mode="initial-pass-mode"/>
      </xsl:copy>
   </xsl:template>

   <!--Set count-as pass template for Context: _sfe:IndexEntry-->
<xsl:template match="_sfe:IndexEntry" mode="set-countas" priority="0">
      <xsl:copy>
         <xsl:apply-templates select="@*|node()" mode="set-countas"/>
      </xsl:copy>
   </xsl:template>

   <!--Set ch:chunk template for Context: _sfe:IndexEntry-->
<xsl:template match="_sfe:IndexEntry" mode="set-ch-chunk" priority="0">
      <xsl:copy>
         <xsl:if test="not(@_gte:did-set-chunk)">
            <xsl:attribute name="_gte:did-set-chunk">yes</xsl:attribute>
         </xsl:if>
         <xsl:apply-templates select="@*|node()" mode="set-ch-chunk"/>
      </xsl:copy>
   </xsl:template>

   <!--Style template for Context: _sfe:IndexGroupHead-->
<xsl:template name="__style-for__sfe-IndexGroupHead.1">
      <xsl:text> .x--sfe-IndexGroupHead-1-0 {margin-left: 0pt; margin-right: 0pt; text-indent: 0pt; font-family: sans-serif; font-weight: bold; font-size: 14pt; text-transform: uppercase; text-align: left; margin-bottom: .5pc; }</xsl:text>
   </xsl:template>

   <!--Template for Context: _sfe:IndexGroupHead-->
<xsl:template match="_sfe:IndexGroupHead" priority="0">
      <div><!--Emit class values to reflect conditions--><xsl:attribute name="class">
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
         <xsl:if test="@xml:lang">
            <xsl:attribute name="lang">
               <xsl:call-template name="return-lang-applying-language-map">
                  <xsl:with-param name="doclang" select="@xml:lang"/>
               </xsl:call-template>
            </xsl:attribute>
         </xsl:if>
         <xsl:call-template name="maybe-set-id"/>
         <!--Process this element's content--><xsl:apply-templates/>
      </div>
   </xsl:template>

   <!--Gentext template for Context: _sfe:IndexGroupHead-->
<xsl:template match="_sfe:IndexGroupHead" mode="expand-gentext" priority="0">
      <xsl:copy>
         <xsl:apply-templates select="@*|node()" mode="expand-gentext"/>
      </xsl:copy>
   </xsl:template>

   <!--Initial pass template for Context: _sfe:IndexGroupHead-->
<xsl:template match="_sfe:IndexGroupHead" mode="initial-pass-mode" priority="0">
      <xsl:copy>
         <xsl:call-template name="maybe-set-gte-id"/>
         <xsl:apply-templates select="@*|node()" mode="initial-pass-mode"/>
      </xsl:copy>
   </xsl:template>

   <!--Set count-as pass template for Context: _sfe:IndexGroupHead-->
<xsl:template match="_sfe:IndexGroupHead" mode="set-countas" priority="0">
      <xsl:copy>
         <xsl:apply-templates select="@*|node()" mode="set-countas"/>
      </xsl:copy>
   </xsl:template>

   <!--Set ch:chunk template for Context: _sfe:IndexGroupHead-->
<xsl:template match="_sfe:IndexGroupHead" mode="set-ch-chunk" priority="0">
      <xsl:copy>
         <xsl:if test="not(@_gte:did-set-chunk)">
            <xsl:attribute name="_gte:did-set-chunk">yes</xsl:attribute>
         </xsl:if>
         <xsl:apply-templates select="@*|node()" mode="set-ch-chunk"/>
      </xsl:copy>
   </xsl:template>

   <!--Style template for Context: _sfe:IndexHeading-->
<xsl:template name="__style-for__sfe-IndexHeading.1">
      <xsl:text> .x--sfe-IndexHeading-1-0 {margin-left: 0pt; margin-right: 0pt; }</xsl:text>
   </xsl:template>

   <!--Template for Context: _sfe:IndexHeading-->
<xsl:template match="_sfe:IndexHeading" priority="0">
      <span><!--Emit class values to reflect conditions--><xsl:attribute name="class">
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
         <xsl:if test="@xml:lang">
            <xsl:attribute name="lang">
               <xsl:call-template name="return-lang-applying-language-map">
                  <xsl:with-param name="doclang" select="@xml:lang"/>
               </xsl:call-template>
            </xsl:attribute>
         </xsl:if>
         <xsl:call-template name="maybe-set-id"/>
         <!--Process this element's content--><xsl:apply-templates/>
      </span>
   </xsl:template>

   <!--Gentext template for Context: _sfe:IndexHeading-->
<xsl:template match="_sfe:IndexHeading" mode="expand-gentext" priority="0">
      <xsl:copy>
         <xsl:apply-templates select="@*|node()" mode="expand-gentext"/>
      </xsl:copy>
   </xsl:template>

   <!--Initial pass template for Context: _sfe:IndexHeading-->
<xsl:template match="_sfe:IndexHeading" mode="initial-pass-mode" priority="0">
      <xsl:copy>
         <xsl:call-template name="maybe-set-gte-id"/>
         <xsl:apply-templates select="@*|node()" mode="initial-pass-mode"/>
      </xsl:copy>
   </xsl:template>

   <!--Set count-as pass template for Context: _sfe:IndexHeading-->
<xsl:template match="_sfe:IndexHeading" mode="set-countas" priority="0">
      <xsl:copy>
         <xsl:apply-templates select="@*|node()" mode="set-countas"/>
      </xsl:copy>
   </xsl:template>

   <!--Set ch:chunk template for Context: _sfe:IndexHeading-->
<xsl:template match="_sfe:IndexHeading" mode="set-ch-chunk" priority="0">
      <xsl:copy>
         <xsl:if test="not(@_gte:did-set-chunk)">
            <xsl:attribute name="_gte:did-set-chunk">yes</xsl:attribute>
         </xsl:if>
         <xsl:apply-templates select="@*|node()" mode="set-ch-chunk"/>
      </xsl:copy>
   </xsl:template>

   <!--Style template for Context: _sfe:IndexLocators-->
<xsl:template name="__style-for__sfe-IndexLocators.1">
      <xsl:text> .x--sfe-IndexLocators-1-0 {margin-left: 0pt; margin-right: 0pt; }</xsl:text>
   </xsl:template>

   <!--Template for Context: _sfe:IndexLocators-->
<xsl:template match="_sfe:IndexLocators" priority="0">
      <span><!--Emit class values to reflect conditions--><xsl:attribute name="class">
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
         <xsl:if test="@xml:lang">
            <xsl:attribute name="lang">
               <xsl:call-template name="return-lang-applying-language-map">
                  <xsl:with-param name="doclang" select="@xml:lang"/>
               </xsl:call-template>
            </xsl:attribute>
         </xsl:if>
         <xsl:call-template name="maybe-set-id"/>
         <!--Process this element's content--><xsl:apply-templates/>
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
         <!--Unconditional AddBefore--><xsl:if test="not(@_gte:Gentext-Expanded)">
            <_gte:Must-Expand-Gentext/>
            <_sfe:BeforeOrAfterText> </_sfe:BeforeOrAfterText>
         </xsl:if>
         <xsl:apply-templates select="* | text() | processing-instruction()" mode="expand-gentext"/>
      </xsl:copy>
   </xsl:template>

   <!--Initial pass template for Context: _sfe:IndexLocators-->
<xsl:template match="_sfe:IndexLocators" mode="initial-pass-mode" priority="0">
      <xsl:copy>
         <xsl:call-template name="maybe-set-gte-id"/>
         <xsl:apply-templates select="@*|node()" mode="initial-pass-mode"/>
      </xsl:copy>
   </xsl:template>

   <!--Set count-as pass template for Context: _sfe:IndexLocators-->
<xsl:template match="_sfe:IndexLocators" mode="set-countas" priority="0">
      <xsl:copy>
         <xsl:apply-templates select="@*|node()" mode="set-countas"/>
      </xsl:copy>
   </xsl:template>

   <!--Set ch:chunk template for Context: _sfe:IndexLocators-->
<xsl:template match="_sfe:IndexLocators" mode="set-ch-chunk" priority="0">
      <xsl:copy>
         <xsl:if test="not(@_gte:did-set-chunk)">
            <xsl:attribute name="_gte:did-set-chunk">yes</xsl:attribute>
         </xsl:if>
         <xsl:apply-templates select="@*|node()" mode="set-ch-chunk"/>
      </xsl:copy>
   </xsl:template>

   <!--Style template for Context: _sfe:IndexPage[position()>1]-->
<xsl:template name="__style-for__sfe-IndexPage.2_sInge281">
      <xsl:text> .x--sfe-IndexPage-1-0 {margin-left: 0pt; margin-right: 0pt; }</xsl:text>
   </xsl:template>

   <!--Template for Context: _sfe:IndexPage[position()>1]-->
<xsl:template match="_sfe:IndexPage[position()&gt;1]" priority="1">
      <span><!--Emit class values to reflect conditions--><xsl:attribute name="class">
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
         <xsl:if test="@xml:lang">
            <xsl:attribute name="lang">
               <xsl:call-template name="return-lang-applying-language-map">
                  <xsl:with-param name="doclang" select="@xml:lang"/>
               </xsl:call-template>
            </xsl:attribute>
         </xsl:if>
         <xsl:call-template name="maybe-set-id"/>
         <!--Process this element's content--><xsl:apply-templates/>
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
         <!--Unconditional AddBefore--><xsl:if test="not(@_gte:Gentext-Expanded)">
            <_gte:Must-Expand-Gentext/>
            <_sfe:BeforeOrAfterText>
               <xsl:text>, </xsl:text>
            </_sfe:BeforeOrAfterText>
         </xsl:if>
         <xsl:apply-templates select="* | text() | processing-instruction()" mode="expand-gentext"/>
      </xsl:copy>
   </xsl:template>

   <!--Initial pass template for Context: _sfe:IndexPage[position()>1]-->
<xsl:template match="_sfe:IndexPage[position()&gt;1]" mode="initial-pass-mode" priority="1">
      <xsl:copy>
         <xsl:call-template name="maybe-set-gte-id"/>
         <xsl:apply-templates select="@*|node()" mode="initial-pass-mode"/>
      </xsl:copy>
   </xsl:template>

   <!--Set count-as pass template for Context: _sfe:IndexPage[position()>1]-->
<xsl:template match="_sfe:IndexPage[position()&gt;1]" mode="set-countas" priority="1">
      <xsl:copy>
         <xsl:apply-templates select="@*|node()" mode="set-countas"/>
      </xsl:copy>
   </xsl:template>

   <!--Set ch:chunk template for Context: _sfe:IndexPage[position()>1]-->
<xsl:template match="_sfe:IndexPage[position()&gt;1]" mode="set-ch-chunk" priority="1">
      <xsl:copy>
         <xsl:if test="not(@_gte:did-set-chunk)">
            <xsl:attribute name="_gte:did-set-chunk">yes</xsl:attribute>
         </xsl:if>
         <xsl:apply-templates select="@*|node()" mode="set-ch-chunk"/>
      </xsl:copy>
   </xsl:template>

   <!--Style template for Context: _sfe:IndexPage-->
<xsl:template name="__style-for__sfe-IndexPage.2_sInge142">
      <xsl:text> .x--sfe-IndexPage-2-0 {margin-left: 0pt; margin-right: 0pt; }</xsl:text>
   </xsl:template>

   <!--Template for Context: _sfe:IndexPage-->
<xsl:template match="_sfe:IndexPage" priority="0">
      <span><!--Emit class values to reflect conditions--><xsl:attribute name="class">
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
         <xsl:if test="@xml:lang">
            <xsl:attribute name="lang">
               <xsl:call-template name="return-lang-applying-language-map">
                  <xsl:with-param name="doclang" select="@xml:lang"/>
               </xsl:call-template>
            </xsl:attribute>
         </xsl:if>
         <xsl:call-template name="maybe-set-id"/>
         <!--Process this element's content--><xsl:apply-templates/>
      </span>
   </xsl:template>

   <!--Gentext template for Context: _sfe:IndexPage-->
<xsl:template match="_sfe:IndexPage" mode="expand-gentext" priority="0">
      <xsl:copy>
         <xsl:apply-templates select="@*|node()" mode="expand-gentext"/>
      </xsl:copy>
   </xsl:template>

   <!--Initial pass template for Context: _sfe:IndexPage-->
<xsl:template match="_sfe:IndexPage" mode="initial-pass-mode" priority="0">
      <xsl:copy>
         <xsl:call-template name="maybe-set-gte-id"/>
         <xsl:apply-templates select="@*|node()" mode="initial-pass-mode"/>
      </xsl:copy>
   </xsl:template>

   <!--Set count-as pass template for Context: _sfe:IndexPage-->
<xsl:template match="_sfe:IndexPage" mode="set-countas" priority="0">
      <xsl:copy>
         <xsl:apply-templates select="@*|node()" mode="set-countas"/>
      </xsl:copy>
   </xsl:template>

   <!--Set ch:chunk template for Context: _sfe:IndexPage-->
<xsl:template match="_sfe:IndexPage" mode="set-ch-chunk" priority="0">
      <xsl:copy>
         <xsl:if test="not(@_gte:did-set-chunk)">
            <xsl:attribute name="_gte:did-set-chunk">yes</xsl:attribute>
         </xsl:if>
         <xsl:apply-templates select="@*|node()" mode="set-ch-chunk"/>
      </xsl:copy>
   </xsl:template>

   <!--Style template for Context: _sfe:IndexPostGroup-->
<xsl:template name="__style-for__sfe-IndexPostGroup.1">
      <xsl:text> .x--sfe-IndexPostGroup-1-0 {margin-left: 0pt; margin-right: 0pt; text-indent: 0pt; margin-top: 1.5pc; }</xsl:text>
   </xsl:template>

   <!--Template for Context: _sfe:IndexPostGroup-->
<xsl:template match="_sfe:IndexPostGroup" priority="0">
      <div><!--Emit class values to reflect conditions--><xsl:attribute name="class">
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
         <xsl:if test="@xml:lang">
            <xsl:attribute name="lang">
               <xsl:call-template name="return-lang-applying-language-map">
                  <xsl:with-param name="doclang" select="@xml:lang"/>
               </xsl:call-template>
            </xsl:attribute>
         </xsl:if>
         <xsl:call-template name="maybe-set-id"/>
         <!--Process this element's content--><xsl:apply-templates/>
      </div>
   </xsl:template>

   <!--Gentext template for Context: _sfe:IndexPostGroup-->
<xsl:template match="_sfe:IndexPostGroup" mode="expand-gentext" priority="0">
      <xsl:copy>
         <xsl:apply-templates select="@*|node()" mode="expand-gentext"/>
      </xsl:copy>
   </xsl:template>

   <!--Initial pass template for Context: _sfe:IndexPostGroup-->
<xsl:template match="_sfe:IndexPostGroup" mode="initial-pass-mode" priority="0">
      <xsl:copy>
         <xsl:call-template name="maybe-set-gte-id"/>
         <xsl:apply-templates select="@*|node()" mode="initial-pass-mode"/>
      </xsl:copy>
   </xsl:template>

   <!--Set count-as pass template for Context: _sfe:IndexPostGroup-->
<xsl:template match="_sfe:IndexPostGroup" mode="set-countas" priority="0">
      <xsl:copy>
         <xsl:apply-templates select="@*|node()" mode="set-countas"/>
      </xsl:copy>
   </xsl:template>

   <!--Set ch:chunk template for Context: _sfe:IndexPostGroup-->
<xsl:template match="_sfe:IndexPostGroup" mode="set-ch-chunk" priority="0">
      <xsl:copy>
         <xsl:if test="not(@_gte:did-set-chunk)">
            <xsl:attribute name="_gte:did-set-chunk">yes</xsl:attribute>
         </xsl:if>
         <xsl:apply-templates select="@*|node()" mode="set-ch-chunk"/>
      </xsl:copy>
   </xsl:template>

   <!--Style template for Context: _sfe:IndexPreGroup-->
<xsl:template name="__style-for__sfe-IndexPreGroup.1">
      <xsl:text> .x--sfe-IndexPreGroup-1-0 {margin-left: 0pt; margin-right: 0pt; text-indent: 0pt; margin-top: 1.5pc; }</xsl:text>
   </xsl:template>

   <!--Template for Context: _sfe:IndexPreGroup-->
<xsl:template match="_sfe:IndexPreGroup" priority="0">
      <div><!--Emit class values to reflect conditions--><xsl:attribute name="class">
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
         <xsl:if test="@xml:lang">
            <xsl:attribute name="lang">
               <xsl:call-template name="return-lang-applying-language-map">
                  <xsl:with-param name="doclang" select="@xml:lang"/>
               </xsl:call-template>
            </xsl:attribute>
         </xsl:if>
         <xsl:call-template name="maybe-set-id"/>
         <!--Process this element's content--><xsl:apply-templates/>
      </div>
   </xsl:template>

   <!--Gentext template for Context: _sfe:IndexPreGroup-->
<xsl:template match="_sfe:IndexPreGroup" mode="expand-gentext" priority="0">
      <xsl:copy>
         <xsl:apply-templates select="@*|node()" mode="expand-gentext"/>
      </xsl:copy>
   </xsl:template>

   <!--Initial pass template for Context: _sfe:IndexPreGroup-->
<xsl:template match="_sfe:IndexPreGroup" mode="initial-pass-mode" priority="0">
      <xsl:copy>
         <xsl:call-template name="maybe-set-gte-id"/>
         <xsl:apply-templates select="@*|node()" mode="initial-pass-mode"/>
      </xsl:copy>
   </xsl:template>

   <!--Set count-as pass template for Context: _sfe:IndexPreGroup-->
<xsl:template match="_sfe:IndexPreGroup" mode="set-countas" priority="0">
      <xsl:copy>
         <xsl:apply-templates select="@*|node()" mode="set-countas"/>
      </xsl:copy>
   </xsl:template>

   <!--Set ch:chunk template for Context: _sfe:IndexPreGroup-->
<xsl:template match="_sfe:IndexPreGroup" mode="set-ch-chunk" priority="0">
      <xsl:copy>
         <xsl:if test="not(@_gte:did-set-chunk)">
            <xsl:attribute name="_gte:did-set-chunk">yes</xsl:attribute>
         </xsl:if>
         <xsl:apply-templates select="@*|node()" mode="set-ch-chunk"/>
      </xsl:copy>
   </xsl:template>

   <!--Style template for Context: _sfe:IndexRangeGroup-->
<xsl:template name="__style-for__sfe-IndexRangeGroup.1">
      <xsl:text> .x--sfe-IndexRangeGroup-1-0 {margin-left: 0pt; margin-right: 0pt; text-indent: 0pt; margin-top: 1.5pc; }</xsl:text>
   </xsl:template>

   <!--Template for Context: _sfe:IndexRangeGroup-->
<xsl:template match="_sfe:IndexRangeGroup" priority="0">
      <div><!--Emit class values to reflect conditions--><xsl:attribute name="class">
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
         <xsl:if test="@xml:lang">
            <xsl:attribute name="lang">
               <xsl:call-template name="return-lang-applying-language-map">
                  <xsl:with-param name="doclang" select="@xml:lang"/>
               </xsl:call-template>
            </xsl:attribute>
         </xsl:if>
         <xsl:call-template name="maybe-set-id"/>
         <!--Process this element's content--><xsl:apply-templates/>
      </div>
   </xsl:template>

   <!--Gentext template for Context: _sfe:IndexRangeGroup-->
<xsl:template match="_sfe:IndexRangeGroup" mode="expand-gentext" priority="0">
      <xsl:copy>
         <xsl:apply-templates select="@*|node()" mode="expand-gentext"/>
      </xsl:copy>
   </xsl:template>

   <!--Initial pass template for Context: _sfe:IndexRangeGroup-->
<xsl:template match="_sfe:IndexRangeGroup" mode="initial-pass-mode" priority="0">
      <xsl:copy>
         <xsl:call-template name="maybe-set-gte-id"/>
         <xsl:apply-templates select="@*|node()" mode="initial-pass-mode"/>
      </xsl:copy>
   </xsl:template>

   <!--Set count-as pass template for Context: _sfe:IndexRangeGroup-->
<xsl:template match="_sfe:IndexRangeGroup" mode="set-countas" priority="0">
      <xsl:copy>
         <xsl:apply-templates select="@*|node()" mode="set-countas"/>
      </xsl:copy>
   </xsl:template>

   <!--Set ch:chunk template for Context: _sfe:IndexRangeGroup-->
<xsl:template match="_sfe:IndexRangeGroup" mode="set-ch-chunk" priority="0">
      <xsl:copy>
         <xsl:if test="not(@_gte:did-set-chunk)">
            <xsl:attribute name="_gte:did-set-chunk">yes</xsl:attribute>
         </xsl:if>
         <xsl:apply-templates select="@*|node()" mode="set-ch-chunk"/>
      </xsl:copy>
   </xsl:template>

   <!--Style template for Context: _sfe:IndexSee-->
<xsl:template name="__style-for__sfe-IndexSee.1">
      <xsl:text> .x--sfe-IndexSee-1-0 {margin-left: 0pt; margin-right: 0pt; }</xsl:text>
   </xsl:template>

   <!--Template for Context: _sfe:IndexSee-->
<xsl:template match="_sfe:IndexSee" priority="0">
      <span><!--Emit class values to reflect conditions--><xsl:attribute name="class">
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
         <xsl:if test="@xml:lang">
            <xsl:attribute name="lang">
               <xsl:call-template name="return-lang-applying-language-map">
                  <xsl:with-param name="doclang" select="@xml:lang"/>
               </xsl:call-template>
            </xsl:attribute>
         </xsl:if>
         <xsl:call-template name="maybe-set-id"/>
         <!--Process this element's content--><xsl:apply-templates/>
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
         <!--Unconditional AddBefore--><xsl:if test="not(@_gte:Gentext-Expanded)">
            <_gte:Must-Expand-Gentext/>
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

   <!--Initial pass template for Context: _sfe:IndexSee-->
<xsl:template match="_sfe:IndexSee" mode="initial-pass-mode" priority="0">
      <xsl:copy>
         <xsl:call-template name="maybe-set-gte-id"/>
         <xsl:apply-templates select="@*|node()" mode="initial-pass-mode"/>
      </xsl:copy>
   </xsl:template>

   <!--Set count-as pass template for Context: _sfe:IndexSee-->
<xsl:template match="_sfe:IndexSee" mode="set-countas" priority="0">
      <xsl:copy>
         <xsl:apply-templates select="@*|node()" mode="set-countas"/>
      </xsl:copy>
   </xsl:template>

   <!--Set ch:chunk template for Context: _sfe:IndexSee-->
<xsl:template match="_sfe:IndexSee" mode="set-ch-chunk" priority="0">
      <xsl:copy>
         <xsl:if test="not(@_gte:did-set-chunk)">
            <xsl:attribute name="_gte:did-set-chunk">yes</xsl:attribute>
         </xsl:if>
         <xsl:apply-templates select="@*|node()" mode="set-ch-chunk"/>
      </xsl:copy>
   </xsl:template>

   <!--Style template for Context: _sfe:IndexSeeAlso-->
<xsl:template name="__style-for__sfe-IndexSeeAlso.1">
      <xsl:text> .x--sfe-IndexSeeAlso-1-0 {margin-left: 0pt; margin-right: 0pt; text-indent: 0pt; margin-left: 3em; text-indent: -1.5em; }</xsl:text>
   </xsl:template>

   <!--Template for Context: _sfe:IndexSeeAlso-->
<xsl:template match="_sfe:IndexSeeAlso" priority="0">
      <div><!--Emit class values to reflect conditions--><xsl:attribute name="class">
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
         <xsl:if test="@xml:lang">
            <xsl:attribute name="lang">
               <xsl:call-template name="return-lang-applying-language-map">
                  <xsl:with-param name="doclang" select="@xml:lang"/>
               </xsl:call-template>
            </xsl:attribute>
         </xsl:if>
         <xsl:call-template name="maybe-set-id"/>
         <!--Process this element's content--><xsl:apply-templates/>
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
         <!--Unconditional AddBefore--><xsl:if test="not(@_gte:Gentext-Expanded)">
            <_gte:Must-Expand-Gentext/>
            <_sfe:BeforeOrAfterText>
               <span style="font-style: italic; ">
                  <xsl:text>See also </xsl:text>
               </span>
            </_sfe:BeforeOrAfterText>
         </xsl:if>
         <xsl:apply-templates select="* | text() | processing-instruction()" mode="expand-gentext"/>
      </xsl:copy>
   </xsl:template>

   <!--Initial pass template for Context: _sfe:IndexSeeAlso-->
<xsl:template match="_sfe:IndexSeeAlso" mode="initial-pass-mode" priority="0">
      <xsl:copy>
         <xsl:call-template name="maybe-set-gte-id"/>
         <xsl:apply-templates select="@*|node()" mode="initial-pass-mode"/>
      </xsl:copy>
   </xsl:template>

   <!--Set count-as pass template for Context: _sfe:IndexSeeAlso-->
<xsl:template match="_sfe:IndexSeeAlso" mode="set-countas" priority="0">
      <xsl:copy>
         <xsl:apply-templates select="@*|node()" mode="set-countas"/>
      </xsl:copy>
   </xsl:template>

   <!--Set ch:chunk template for Context: _sfe:IndexSeeAlso-->
<xsl:template match="_sfe:IndexSeeAlso" mode="set-ch-chunk" priority="0">
      <xsl:copy>
         <xsl:if test="not(@_gte:did-set-chunk)">
            <xsl:attribute name="_gte:did-set-chunk">yes</xsl:attribute>
         </xsl:if>
         <xsl:apply-templates select="@*|node()" mode="set-ch-chunk"/>
      </xsl:copy>
   </xsl:template>

   <!--Style template for Context: _sfe:IndexSubGroupHead-->
<xsl:template name="__style-for__sfe-IndexSubGroupHead.1">
      <xsl:text> .x--sfe-IndexSubGroupHead-1-0 {margin-left: 0pt; margin-right: 0pt; text-indent: 0pt; font-weight: bold; font-size: 14pt; text-transform: uppercase; text-align: left; margin-top: 2pc; }</xsl:text>
   </xsl:template>

   <!--Template for Context: _sfe:IndexSubGroupHead-->
<xsl:template match="_sfe:IndexSubGroupHead" priority="0">
      <div><!--Emit class values to reflect conditions--><xsl:attribute name="class">
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
         <xsl:if test="@xml:lang">
            <xsl:attribute name="lang">
               <xsl:call-template name="return-lang-applying-language-map">
                  <xsl:with-param name="doclang" select="@xml:lang"/>
               </xsl:call-template>
            </xsl:attribute>
         </xsl:if>
         <xsl:call-template name="maybe-set-id"/>
         <!--Process this element's content--><xsl:apply-templates/>
      </div>
   </xsl:template>

   <!--Gentext template for Context: _sfe:IndexSubGroupHead-->
<xsl:template match="_sfe:IndexSubGroupHead" mode="expand-gentext" priority="0">
      <xsl:copy>
         <xsl:apply-templates select="@*|node()" mode="expand-gentext"/>
      </xsl:copy>
   </xsl:template>

   <!--Initial pass template for Context: _sfe:IndexSubGroupHead-->
<xsl:template match="_sfe:IndexSubGroupHead" mode="initial-pass-mode" priority="0">
      <xsl:copy>
         <xsl:call-template name="maybe-set-gte-id"/>
         <xsl:apply-templates select="@*|node()" mode="initial-pass-mode"/>
      </xsl:copy>
   </xsl:template>

   <!--Set count-as pass template for Context: _sfe:IndexSubGroupHead-->
<xsl:template match="_sfe:IndexSubGroupHead" mode="set-countas" priority="0">
      <xsl:copy>
         <xsl:apply-templates select="@*|node()" mode="set-countas"/>
      </xsl:copy>
   </xsl:template>

   <!--Set ch:chunk template for Context: _sfe:IndexSubGroupHead-->
<xsl:template match="_sfe:IndexSubGroupHead" mode="set-ch-chunk" priority="0">
      <xsl:copy>
         <xsl:if test="not(@_gte:did-set-chunk)">
            <xsl:attribute name="_gte:did-set-chunk">yes</xsl:attribute>
         </xsl:if>
         <xsl:apply-templates select="@*|node()" mode="set-ch-chunk"/>
      </xsl:copy>
   </xsl:template>

   <!--Style template for Context: _sfe:RepeatingTitle-->
<xsl:template name="__style-for__sfe-RepeatingTitle.1">
      <xsl:text> .x--sfe-RepeatingTitle-1-0 {margin-left: 0pt; margin-right: 0pt; text-indent: 0pt; }</xsl:text>
   </xsl:template>

   <!--Template for Context: _sfe:RepeatingTitle-->
<xsl:template match="_sfe:RepeatingTitle" priority="0">
      <div><!--Emit class values to reflect conditions--><xsl:attribute name="class">
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
         <xsl:if test="@xml:lang">
            <xsl:attribute name="lang">
               <xsl:call-template name="return-lang-applying-language-map">
                  <xsl:with-param name="doclang" select="@xml:lang"/>
               </xsl:call-template>
            </xsl:attribute>
         </xsl:if>
         <xsl:call-template name="maybe-set-id"/>
         <!--Process this element's content--><xsl:apply-templates/>
      </div>
   </xsl:template>

   <!--Gentext template for Context: _sfe:RepeatingTitle-->
<xsl:template match="_sfe:RepeatingTitle" mode="expand-gentext" priority="0">
      <xsl:copy>
         <xsl:apply-templates select="@*|node()" mode="expand-gentext"/>
      </xsl:copy>
   </xsl:template>

   <!--Initial pass template for Context: _sfe:RepeatingTitle-->
<xsl:template match="_sfe:RepeatingTitle" mode="initial-pass-mode" priority="0">
      <xsl:copy>
         <xsl:call-template name="maybe-set-gte-id"/>
         <xsl:apply-templates select="@*|node()" mode="initial-pass-mode"/>
      </xsl:copy>
   </xsl:template>

   <!--Set count-as pass template for Context: _sfe:RepeatingTitle-->
<xsl:template match="_sfe:RepeatingTitle" mode="set-countas" priority="0">
      <xsl:copy>
         <xsl:apply-templates select="@*|node()" mode="set-countas"/>
      </xsl:copy>
   </xsl:template>

   <!--Set ch:chunk template for Context: _sfe:RepeatingTitle-->
<xsl:template match="_sfe:RepeatingTitle" mode="set-ch-chunk" priority="0">
      <xsl:copy>
         <xsl:if test="not(@_gte:did-set-chunk)">
            <xsl:attribute name="_gte:did-set-chunk">yes</xsl:attribute>
         </xsl:if>
         <xsl:apply-templates select="@*|node()" mode="set-ch-chunk"/>
      </xsl:copy>
   </xsl:template>

   <!--Style template for Context: _sfe:TableOfContents-->
<xsl:template name="__style-for__sfe-TableOfContents.1">
      <xsl:text> .x--sfe-TableOfContents-1-0 {margin-left: 0pt; margin-right: 0pt; text-indent: 0pt; }</xsl:text>
   </xsl:template>

   <!--Template for Context: _sfe:TableOfContents-->
<xsl:template match="_sfe:TableOfContents" priority="0">
      <div><!--Emit class values to reflect conditions--><xsl:attribute name="class">
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
         <xsl:if test="@xml:lang">
            <xsl:attribute name="lang">
               <xsl:call-template name="return-lang-applying-language-map">
                  <xsl:with-param name="doclang" select="@xml:lang"/>
               </xsl:call-template>
            </xsl:attribute>
         </xsl:if>
         <xsl:call-template name="maybe-set-id"/>
         <!--Process this element's content--><xsl:apply-templates/>
      </div>
   </xsl:template>

   <!--Gentext template for Context: _sfe:TableOfContents-->
<xsl:template match="_sfe:TableOfContents" mode="expand-gentext" priority="0">
      <xsl:copy>
         <xsl:apply-templates select="@*|node()" mode="expand-gentext"/>
      </xsl:copy>
   </xsl:template>

   <!--Initial pass template for Context: _sfe:TableOfContents-->
<xsl:template match="_sfe:TableOfContents" mode="initial-pass-mode" priority="0">
      <xsl:copy>
         <xsl:call-template name="maybe-set-gte-id"/>
         <xsl:apply-templates select="@*|node()" mode="initial-pass-mode"/>
      </xsl:copy>
   </xsl:template>

   <!--Set count-as pass template for Context: _sfe:TableOfContents-->
<xsl:template match="_sfe:TableOfContents" mode="set-countas" priority="0">
      <xsl:copy>
         <xsl:apply-templates select="@*|node()" mode="set-countas"/>
      </xsl:copy>
   </xsl:template>

   <!--Set ch:chunk template for Context: _sfe:TableOfContents-->
<xsl:template match="_sfe:TableOfContents" mode="set-ch-chunk" priority="0">
      <xsl:copy>
         <xsl:if test="not(@_gte:did-set-chunk)">
            <xsl:attribute name="_gte:did-set-chunk">yes</xsl:attribute>
         </xsl:if>
         <xsl:apply-templates select="@*|node()" mode="set-ch-chunk"/>
      </xsl:copy>
   </xsl:template>

   <!--Style template for Context: _sfe:TocEntry1_Table_of_Contents-->
<xsl:template name="__style-for__sfe-TocEntry1_Table_of_Contents.1">
      <xsl:text> .x--sfe-TocEntry1-Table-of-Contents-1-0 {margin-left: 0pt; margin-right: 0pt; text-indent: 0pt; margin-left: 4em; margin-right: 2pc; text-indent: -4.00em; }</xsl:text>
   </xsl:template>

   <!--Template for Context: _sfe:TocEntry1_Table_of_Contents-->
<xsl:template match="_sfe:TocEntry1_Table_of_Contents" priority="0">
      <div><!--Emit class values to reflect conditions--><xsl:attribute name="class">
            <xsl:text> x--sfe-TocEntry1-Table-of-Contents-1-0</xsl:text>
         </xsl:attribute>
         <a>
            <xsl:choose>
               <xsl:when xmlns:ati3d="http://www.arbortext.com/namespace/graphics"
                         test="@ati3d:viewer and @tocentry_id"><!--this is a link to a 3D graphic--><xsl:variable name="annotation" select="@ati3d:view"/>
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
               <xsl:otherwise><!--this is a "regular" link--><xsl:if test="@tocentry_id">
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
            <xsl:if test="@xml:lang">
               <xsl:attribute name="lang">
                  <xsl:call-template name="return-lang-applying-language-map">
                     <xsl:with-param name="doclang" select="@xml:lang"/>
                  </xsl:call-template>
               </xsl:attribute>
            </xsl:if>
            <xsl:call-template name="maybe-set-id"/>
            <!--Process this element's content--><xsl:apply-templates/>
         </a>
      </div>
   </xsl:template>

   <!--Gentext template for Context: _sfe:TocEntry1_Table_of_Contents-->
<xsl:template match="_sfe:TocEntry1_Table_of_Contents" mode="expand-gentext" priority="0">
      <xsl:copy>
         <xsl:apply-templates select="@*|node()" mode="expand-gentext"/>
      </xsl:copy>
   </xsl:template>

   <!--Initial pass template for Context: _sfe:TocEntry1_Table_of_Contents-->
<xsl:template match="_sfe:TocEntry1_Table_of_Contents" mode="initial-pass-mode" priority="0">
      <xsl:copy>
         <xsl:call-template name="maybe-set-gte-id"/>
         <xsl:apply-templates select="@*|node()" mode="initial-pass-mode"/>
      </xsl:copy>
   </xsl:template>

   <!--Set count-as pass template for Context: _sfe:TocEntry1_Table_of_Contents-->
<xsl:template match="_sfe:TocEntry1_Table_of_Contents" mode="set-countas" priority="0">
      <xsl:copy>
         <xsl:apply-templates select="@*|node()" mode="set-countas"/>
      </xsl:copy>
   </xsl:template>

   <!--Set ch:chunk template for Context: _sfe:TocEntry1_Table_of_Contents-->
<xsl:template match="_sfe:TocEntry1_Table_of_Contents" mode="set-ch-chunk" priority="0">
      <xsl:copy>
         <xsl:if test="not(@_gte:did-set-chunk)">
            <xsl:attribute name="_gte:did-set-chunk">yes</xsl:attribute>
         </xsl:if>
         <xsl:apply-templates select="@*|node()" mode="set-ch-chunk"/>
      </xsl:copy>
   </xsl:template>

   <!--Style template for Context: _sfe:TocEntry2_Table_of_Contents-->
<xsl:template name="__style-for__sfe-TocEntry2_Table_of_Contents.1">
      <xsl:text> .x--sfe-TocEntry2-Table-of-Contents-1-0 {margin-left: 0pt; margin-right: 0pt; text-indent: 0pt; margin-left: 6em; margin-right: 2pc; text-indent: -4.00em; }</xsl:text>
   </xsl:template>

   <!--Template for Context: _sfe:TocEntry2_Table_of_Contents-->
<xsl:template match="_sfe:TocEntry2_Table_of_Contents" priority="0">
      <div><!--Emit class values to reflect conditions--><xsl:attribute name="class">
            <xsl:text> x--sfe-TocEntry2-Table-of-Contents-1-0</xsl:text>
         </xsl:attribute>
         <a>
            <xsl:choose>
               <xsl:when xmlns:ati3d="http://www.arbortext.com/namespace/graphics"
                         test="@ati3d:viewer and @tocentry_id"><!--this is a link to a 3D graphic--><xsl:variable name="annotation" select="@ati3d:view"/>
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
               <xsl:otherwise><!--this is a "regular" link--><xsl:if test="@tocentry_id">
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
            <xsl:if test="@xml:lang">
               <xsl:attribute name="lang">
                  <xsl:call-template name="return-lang-applying-language-map">
                     <xsl:with-param name="doclang" select="@xml:lang"/>
                  </xsl:call-template>
               </xsl:attribute>
            </xsl:if>
            <xsl:call-template name="maybe-set-id"/>
            <!--Process this element's content--><xsl:apply-templates/>
         </a>
      </div>
   </xsl:template>

   <!--Gentext template for Context: _sfe:TocEntry2_Table_of_Contents-->
<xsl:template match="_sfe:TocEntry2_Table_of_Contents" mode="expand-gentext" priority="0">
      <xsl:copy>
         <xsl:apply-templates select="@*|node()" mode="expand-gentext"/>
      </xsl:copy>
   </xsl:template>

   <!--Initial pass template for Context: _sfe:TocEntry2_Table_of_Contents-->
<xsl:template match="_sfe:TocEntry2_Table_of_Contents" mode="initial-pass-mode" priority="0">
      <xsl:copy>
         <xsl:call-template name="maybe-set-gte-id"/>
         <xsl:apply-templates select="@*|node()" mode="initial-pass-mode"/>
      </xsl:copy>
   </xsl:template>

   <!--Set count-as pass template for Context: _sfe:TocEntry2_Table_of_Contents-->
<xsl:template match="_sfe:TocEntry2_Table_of_Contents" mode="set-countas" priority="0">
      <xsl:copy>
         <xsl:apply-templates select="@*|node()" mode="set-countas"/>
      </xsl:copy>
   </xsl:template>

   <!--Set ch:chunk template for Context: _sfe:TocEntry2_Table_of_Contents-->
<xsl:template match="_sfe:TocEntry2_Table_of_Contents" mode="set-ch-chunk" priority="0">
      <xsl:copy>
         <xsl:if test="not(@_gte:did-set-chunk)">
            <xsl:attribute name="_gte:did-set-chunk">yes</xsl:attribute>
         </xsl:if>
         <xsl:apply-templates select="@*|node()" mode="set-ch-chunk"/>
      </xsl:copy>
   </xsl:template>

   <!--Style template for Context: _sfe:TocEntry3_Table_of_Contents-->
<xsl:template name="__style-for__sfe-TocEntry3_Table_of_Contents.1">
      <xsl:text> .x--sfe-TocEntry3-Table-of-Contents-1-0 {margin-left: 0pt; margin-right: 0pt; text-indent: 0pt; margin-left: 8em; margin-right: 2pc; text-indent: -4.00em; }</xsl:text>
   </xsl:template>

   <!--Template for Context: _sfe:TocEntry3_Table_of_Contents-->
<xsl:template match="_sfe:TocEntry3_Table_of_Contents" priority="0">
      <div><!--Emit class values to reflect conditions--><xsl:attribute name="class">
            <xsl:text> x--sfe-TocEntry3-Table-of-Contents-1-0</xsl:text>
         </xsl:attribute>
         <a>
            <xsl:choose>
               <xsl:when xmlns:ati3d="http://www.arbortext.com/namespace/graphics"
                         test="@ati3d:viewer and @tocentry_id"><!--this is a link to a 3D graphic--><xsl:variable name="annotation" select="@ati3d:view"/>
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
               <xsl:otherwise><!--this is a "regular" link--><xsl:if test="@tocentry_id">
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
            <xsl:if test="@xml:lang">
               <xsl:attribute name="lang">
                  <xsl:call-template name="return-lang-applying-language-map">
                     <xsl:with-param name="doclang" select="@xml:lang"/>
                  </xsl:call-template>
               </xsl:attribute>
            </xsl:if>
            <xsl:call-template name="maybe-set-id"/>
            <!--Process this element's content--><xsl:apply-templates/>
         </a>
      </div>
   </xsl:template>

   <!--Gentext template for Context: _sfe:TocEntry3_Table_of_Contents-->
<xsl:template match="_sfe:TocEntry3_Table_of_Contents" mode="expand-gentext" priority="0">
      <xsl:copy>
         <xsl:apply-templates select="@*|node()" mode="expand-gentext"/>
      </xsl:copy>
   </xsl:template>

   <!--Initial pass template for Context: _sfe:TocEntry3_Table_of_Contents-->
<xsl:template match="_sfe:TocEntry3_Table_of_Contents" mode="initial-pass-mode" priority="0">
      <xsl:copy>
         <xsl:call-template name="maybe-set-gte-id"/>
         <xsl:apply-templates select="@*|node()" mode="initial-pass-mode"/>
      </xsl:copy>
   </xsl:template>

   <!--Set count-as pass template for Context: _sfe:TocEntry3_Table_of_Contents-->
<xsl:template match="_sfe:TocEntry3_Table_of_Contents" mode="set-countas" priority="0">
      <xsl:copy>
         <xsl:apply-templates select="@*|node()" mode="set-countas"/>
      </xsl:copy>
   </xsl:template>

   <!--Set ch:chunk template for Context: _sfe:TocEntry3_Table_of_Contents-->
<xsl:template match="_sfe:TocEntry3_Table_of_Contents" mode="set-ch-chunk" priority="0">
      <xsl:copy>
         <xsl:if test="not(@_gte:did-set-chunk)">
            <xsl:attribute name="_gte:did-set-chunk">yes</xsl:attribute>
         </xsl:if>
         <xsl:apply-templates select="@*|node()" mode="set-ch-chunk"/>
      </xsl:copy>
   </xsl:template>

   <!--Style template for Context: _sfe:TocEntry4_Table_of_Contents-->
<xsl:template name="__style-for__sfe-TocEntry4_Table_of_Contents.1">
      <xsl:text> .x--sfe-TocEntry4-Table-of-Contents-1-0 {margin-left: 0pt; margin-right: 0pt; text-indent: 0pt; margin-left: 10em; margin-right: 2pc; text-indent: -4.00em; }</xsl:text>
   </xsl:template>

   <!--Template for Context: _sfe:TocEntry4_Table_of_Contents-->
<xsl:template match="_sfe:TocEntry4_Table_of_Contents" priority="0">
      <div><!--Emit class values to reflect conditions--><xsl:attribute name="class">
            <xsl:text> x--sfe-TocEntry4-Table-of-Contents-1-0</xsl:text>
         </xsl:attribute>
         <a>
            <xsl:choose>
               <xsl:when xmlns:ati3d="http://www.arbortext.com/namespace/graphics"
                         test="@ati3d:viewer and @tocentry_id"><!--this is a link to a 3D graphic--><xsl:variable name="annotation" select="@ati3d:view"/>
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
               <xsl:otherwise><!--this is a "regular" link--><xsl:if test="@tocentry_id">
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
            <xsl:if test="@xml:lang">
               <xsl:attribute name="lang">
                  <xsl:call-template name="return-lang-applying-language-map">
                     <xsl:with-param name="doclang" select="@xml:lang"/>
                  </xsl:call-template>
               </xsl:attribute>
            </xsl:if>
            <xsl:call-template name="maybe-set-id"/>
            <!--Process this element's content--><xsl:apply-templates/>
         </a>
      </div>
   </xsl:template>

   <!--Gentext template for Context: _sfe:TocEntry4_Table_of_Contents-->
<xsl:template match="_sfe:TocEntry4_Table_of_Contents" mode="expand-gentext" priority="0">
      <xsl:copy>
         <xsl:apply-templates select="@*|node()" mode="expand-gentext"/>
      </xsl:copy>
   </xsl:template>

   <!--Initial pass template for Context: _sfe:TocEntry4_Table_of_Contents-->
<xsl:template match="_sfe:TocEntry4_Table_of_Contents" mode="initial-pass-mode" priority="0">
      <xsl:copy>
         <xsl:call-template name="maybe-set-gte-id"/>
         <xsl:apply-templates select="@*|node()" mode="initial-pass-mode"/>
      </xsl:copy>
   </xsl:template>

   <!--Set count-as pass template for Context: _sfe:TocEntry4_Table_of_Contents-->
<xsl:template match="_sfe:TocEntry4_Table_of_Contents" mode="set-countas" priority="0">
      <xsl:copy>
         <xsl:apply-templates select="@*|node()" mode="set-countas"/>
      </xsl:copy>
   </xsl:template>

   <!--Set ch:chunk template for Context: _sfe:TocEntry4_Table_of_Contents-->
<xsl:template match="_sfe:TocEntry4_Table_of_Contents" mode="set-ch-chunk" priority="0">
      <xsl:copy>
         <xsl:if test="not(@_gte:did-set-chunk)">
            <xsl:attribute name="_gte:did-set-chunk">yes</xsl:attribute>
         </xsl:if>
         <xsl:apply-templates select="@*|node()" mode="set-ch-chunk"/>
      </xsl:copy>
   </xsl:template>

   <!--Style template for Context: _sfe:TocEntry5_Table_of_Contents-->
<xsl:template name="__style-for__sfe-TocEntry5_Table_of_Contents.1">
      <xsl:text> .x--sfe-TocEntry5-Table-of-Contents-1-0 {margin-left: 0pt; margin-right: 0pt; text-indent: 0pt; margin-left: 12em; margin-right: 2pc; text-indent: -12em; }</xsl:text>
   </xsl:template>

   <!--Template for Context: _sfe:TocEntry5_Table_of_Contents-->
<xsl:template match="_sfe:TocEntry5_Table_of_Contents" priority="0">
      <div><!--Emit class values to reflect conditions--><xsl:attribute name="class">
            <xsl:text> x--sfe-TocEntry5-Table-of-Contents-1-0</xsl:text>
         </xsl:attribute>
         <a>
            <xsl:choose>
               <xsl:when xmlns:ati3d="http://www.arbortext.com/namespace/graphics"
                         test="@ati3d:viewer and @tocentry_id"><!--this is a link to a 3D graphic--><xsl:variable name="annotation" select="@ati3d:view"/>
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
               <xsl:otherwise><!--this is a "regular" link--><xsl:if test="@tocentry_id">
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
            <xsl:if test="@xml:lang">
               <xsl:attribute name="lang">
                  <xsl:call-template name="return-lang-applying-language-map">
                     <xsl:with-param name="doclang" select="@xml:lang"/>
                  </xsl:call-template>
               </xsl:attribute>
            </xsl:if>
            <xsl:call-template name="maybe-set-id"/>
            <!--Process this element's content--><xsl:apply-templates/>
         </a>
      </div>
   </xsl:template>

   <!--Gentext template for Context: _sfe:TocEntry5_Table_of_Contents-->
<xsl:template match="_sfe:TocEntry5_Table_of_Contents" mode="expand-gentext" priority="0">
      <xsl:copy>
         <xsl:apply-templates select="@*|node()" mode="expand-gentext"/>
      </xsl:copy>
   </xsl:template>

   <!--Initial pass template for Context: _sfe:TocEntry5_Table_of_Contents-->
<xsl:template match="_sfe:TocEntry5_Table_of_Contents" mode="initial-pass-mode" priority="0">
      <xsl:copy>
         <xsl:call-template name="maybe-set-gte-id"/>
         <xsl:apply-templates select="@*|node()" mode="initial-pass-mode"/>
      </xsl:copy>
   </xsl:template>

   <!--Set count-as pass template for Context: _sfe:TocEntry5_Table_of_Contents-->
<xsl:template match="_sfe:TocEntry5_Table_of_Contents" mode="set-countas" priority="0">
      <xsl:copy>
         <xsl:apply-templates select="@*|node()" mode="set-countas"/>
      </xsl:copy>
   </xsl:template>

   <!--Set ch:chunk template for Context: _sfe:TocEntry5_Table_of_Contents-->
<xsl:template match="_sfe:TocEntry5_Table_of_Contents" mode="set-ch-chunk" priority="0">
      <xsl:copy>
         <xsl:if test="not(@_gte:did-set-chunk)">
            <xsl:attribute name="_gte:did-set-chunk">yes</xsl:attribute>
         </xsl:if>
         <xsl:apply-templates select="@*|node()" mode="set-ch-chunk"/>
      </xsl:copy>
   </xsl:template>

   <!--Style template for Context: _sfe:TocEntry6_Table_of_Contents-->
<xsl:template name="__style-for__sfe-TocEntry6_Table_of_Contents.1">
      <xsl:text> .x--sfe-TocEntry6-Table-of-Contents-1-0 {margin-left: 0pt; margin-right: 0pt; text-indent: 0pt; margin-left: 14em; margin-right: 2pc; text-indent: -14em; }</xsl:text>
   </xsl:template>

   <!--Template for Context: _sfe:TocEntry6_Table_of_Contents-->
<xsl:template match="_sfe:TocEntry6_Table_of_Contents" priority="0">
      <div><!--Emit class values to reflect conditions--><xsl:attribute name="class">
            <xsl:text> x--sfe-TocEntry6-Table-of-Contents-1-0</xsl:text>
         </xsl:attribute>
         <a>
            <xsl:choose>
               <xsl:when xmlns:ati3d="http://www.arbortext.com/namespace/graphics"
                         test="@ati3d:viewer and @tocentry_id"><!--this is a link to a 3D graphic--><xsl:variable name="annotation" select="@ati3d:view"/>
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
               <xsl:otherwise><!--this is a "regular" link--><xsl:if test="@tocentry_id">
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
            <xsl:if test="@xml:lang">
               <xsl:attribute name="lang">
                  <xsl:call-template name="return-lang-applying-language-map">
                     <xsl:with-param name="doclang" select="@xml:lang"/>
                  </xsl:call-template>
               </xsl:attribute>
            </xsl:if>
            <xsl:call-template name="maybe-set-id"/>
            <!--Process this element's content--><xsl:apply-templates/>
         </a>
      </div>
   </xsl:template>

   <!--Gentext template for Context: _sfe:TocEntry6_Table_of_Contents-->
<xsl:template match="_sfe:TocEntry6_Table_of_Contents" mode="expand-gentext" priority="0">
      <xsl:copy>
         <xsl:apply-templates select="@*|node()" mode="expand-gentext"/>
      </xsl:copy>
   </xsl:template>

   <!--Initial pass template for Context: _sfe:TocEntry6_Table_of_Contents-->
<xsl:template match="_sfe:TocEntry6_Table_of_Contents" mode="initial-pass-mode" priority="0">
      <xsl:copy>
         <xsl:call-template name="maybe-set-gte-id"/>
         <xsl:apply-templates select="@*|node()" mode="initial-pass-mode"/>
      </xsl:copy>
   </xsl:template>

   <!--Set count-as pass template for Context: _sfe:TocEntry6_Table_of_Contents-->
<xsl:template match="_sfe:TocEntry6_Table_of_Contents" mode="set-countas" priority="0">
      <xsl:copy>
         <xsl:apply-templates select="@*|node()" mode="set-countas"/>
      </xsl:copy>
   </xsl:template>

   <!--Set ch:chunk template for Context: _sfe:TocEntry6_Table_of_Contents-->
<xsl:template match="_sfe:TocEntry6_Table_of_Contents" mode="set-ch-chunk" priority="0">
      <xsl:copy>
         <xsl:if test="not(@_gte:did-set-chunk)">
            <xsl:attribute name="_gte:did-set-chunk">yes</xsl:attribute>
         </xsl:if>
         <xsl:apply-templates select="@*|node()" mode="set-ch-chunk"/>
      </xsl:copy>
   </xsl:template>

   <!--Style template for Context: _sfe:TocLabel_Table_of_Contents-->
<xsl:template name="__style-for__sfe-TocLabel_Table_of_Contents.1">
      <xsl:text> .x--sfe-TocLabel-Table-of-Contents-1-0 {margin-left: 0pt; margin-right: 0pt; }</xsl:text>
   </xsl:template>

   <!--Template for Context: _sfe:TocLabel_Table_of_Contents-->
<xsl:template match="_sfe:TocLabel_Table_of_Contents" priority="0">
      <span><!--Emit class values to reflect conditions--><xsl:attribute name="class">
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
         <xsl:if test="@xml:lang">
            <xsl:attribute name="lang">
               <xsl:call-template name="return-lang-applying-language-map">
                  <xsl:with-param name="doclang" select="@xml:lang"/>
               </xsl:call-template>
            </xsl:attribute>
         </xsl:if>
         <xsl:call-template name="maybe-set-id"/>
         <!--Process this element's content--><xsl:apply-templates/>
      </span>
   </xsl:template>

   <!--Gentext template for Context: _sfe:TocLabel_Table_of_Contents-->
<xsl:template match="_sfe:TocLabel_Table_of_Contents" mode="expand-gentext" priority="0">
      <xsl:copy>
         <xsl:apply-templates select="@*|node()" mode="expand-gentext"/>
      </xsl:copy>
   </xsl:template>

   <!--Initial pass template for Context: _sfe:TocLabel_Table_of_Contents-->
<xsl:template match="_sfe:TocLabel_Table_of_Contents" mode="initial-pass-mode" priority="0">
      <xsl:copy>
         <xsl:call-template name="maybe-set-gte-id"/>
         <xsl:apply-templates select="@*|node()" mode="initial-pass-mode"/>
      </xsl:copy>
   </xsl:template>

   <!--Set count-as pass template for Context: _sfe:TocLabel_Table_of_Contents-->
<xsl:template match="_sfe:TocLabel_Table_of_Contents" mode="set-countas" priority="0">
      <xsl:copy>
         <xsl:apply-templates select="@*|node()" mode="set-countas"/>
      </xsl:copy>
   </xsl:template>

   <!--Set ch:chunk template for Context: _sfe:TocLabel_Table_of_Contents-->
<xsl:template match="_sfe:TocLabel_Table_of_Contents" mode="set-ch-chunk" priority="0">
      <xsl:copy>
         <xsl:if test="not(@_gte:did-set-chunk)">
            <xsl:attribute name="_gte:did-set-chunk">yes</xsl:attribute>
         </xsl:if>
         <xsl:apply-templates select="@*|node()" mode="set-ch-chunk"/>
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
         <span><!--Emit class values to reflect conditions--><xsl:attribute name="class">
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
            <xsl:if test="@xml:lang">
               <xsl:attribute name="lang">
                  <xsl:call-template name="return-lang-applying-language-map">
                     <xsl:with-param name="doclang" select="@xml:lang"/>
                  </xsl:call-template>
               </xsl:attribute>
            </xsl:if>
            <xsl:call-template name="maybe-set-id"/>
            <!--Suppress element contents (but not gentext) unless unhidden--><xsl:choose>
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

   <!--Initial pass template for Context: _sfe:TocPage_Table_of_Contents-->
<xsl:template match="_sfe:TocPage_Table_of_Contents" mode="initial-pass-mode" priority="0">
      <xsl:copy>
         <xsl:call-template name="maybe-set-gte-id"/>
         <xsl:apply-templates select="@*|node()" mode="initial-pass-mode"/>
      </xsl:copy>
   </xsl:template>

   <!--Set count-as pass template for Context: _sfe:TocPage_Table_of_Contents-->
<xsl:template match="_sfe:TocPage_Table_of_Contents" mode="set-countas" priority="0">
      <xsl:copy>
         <xsl:apply-templates select="@*|node()" mode="set-countas"/>
      </xsl:copy>
   </xsl:template>

   <!--Set ch:chunk template for Context: _sfe:TocPage_Table_of_Contents-->
<xsl:template match="_sfe:TocPage_Table_of_Contents" mode="set-ch-chunk" priority="0">
      <xsl:copy>
         <xsl:if test="not(@_gte:did-set-chunk)">
            <xsl:attribute name="_gte:did-set-chunk">yes</xsl:attribute>
         </xsl:if>
         <xsl:apply-templates select="@*|node()" mode="set-ch-chunk"/>
      </xsl:copy>
   </xsl:template>

   <!--Collect footnote template for Context: _sfe:TocPage_Table_of_Contents-->
<xsl:template match="_sfe:TocPage_Table_of_Contents" mode="styler-collect-footnotes"
                 priority="0">
      <xsl:apply-templates select="_sfe:BeforeOrAfterText/*" mode="styler-collect-footnotes"/>
   </xsl:template>

   <!--Style template for Context: _sfe:TocTable_of_Contents-->
<xsl:template name="__style-for__sfe-TocTable_of_Contents.1">
      <xsl:text> .x--sfe-TocTable-of-Contents-1-0 {margin-left: 0pt; margin-right: 0pt; }</xsl:text>
   </xsl:template>

   <!--Template for Context: _sfe:TocTable_of_Contents-->
<xsl:template match="_sfe:TocTable_of_Contents" priority="0">
      <span><!--Emit class values to reflect conditions--><xsl:attribute name="class">
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
         <xsl:if test="@xml:lang">
            <xsl:attribute name="lang">
               <xsl:call-template name="return-lang-applying-language-map">
                  <xsl:with-param name="doclang" select="@xml:lang"/>
               </xsl:call-template>
            </xsl:attribute>
         </xsl:if>
         <xsl:call-template name="maybe-set-id"/>
         <!--Process this element's content--><xsl:apply-templates/>
      </span>
   </xsl:template>

   <!--Gentext template for Context: _sfe:TocTable_of_Contents-->
<xsl:template match="_sfe:TocTable_of_Contents" mode="expand-gentext" priority="0">
      <xsl:copy>
         <xsl:apply-templates select="@*|node()" mode="expand-gentext"/>
      </xsl:copy>
   </xsl:template>

   <!--Initial pass template for Context: _sfe:TocTable_of_Contents-->
<xsl:template match="_sfe:TocTable_of_Contents" mode="initial-pass-mode" priority="0">
      <xsl:copy>
         <xsl:call-template name="maybe-set-gte-id"/>
         <xsl:apply-templates select="@*|node()" mode="initial-pass-mode"/>
      </xsl:copy>
   </xsl:template>

   <!--Set count-as pass template for Context: _sfe:TocTable_of_Contents-->
<xsl:template match="_sfe:TocTable_of_Contents" mode="set-countas" priority="0">
      <xsl:copy>
         <xsl:apply-templates select="@*|node()" mode="set-countas"/>
      </xsl:copy>
   </xsl:template>

   <!--Set ch:chunk template for Context: _sfe:TocTable_of_Contents-->
<xsl:template match="_sfe:TocTable_of_Contents" mode="set-ch-chunk" priority="0">
      <xsl:copy>
         <xsl:if test="not(@_gte:did-set-chunk)">
            <xsl:attribute name="_gte:did-set-chunk">yes</xsl:attribute>
         </xsl:if>
         <xsl:apply-templates select="@*|node()" mode="set-ch-chunk"/>
      </xsl:copy>
   </xsl:template>

   <!--Style template for Context: _sfe:TocTitle_Table_of_Contents-->
<xsl:template name="__style-for__sfe-TocTitle_Table_of_Contents.1">
      <xsl:text> .x--sfe-TocTitle-Table-of-Contents-1-0 {margin-left: 0pt; margin-right: 0pt; }</xsl:text>
   </xsl:template>

   <!--Template for Context: _sfe:TocTitle_Table_of_Contents-->
<xsl:template match="_sfe:TocTitle_Table_of_Contents" priority="0">
      <span><!--Emit class values to reflect conditions--><xsl:attribute name="class">
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
         <xsl:if test="@xml:lang">
            <xsl:attribute name="lang">
               <xsl:call-template name="return-lang-applying-language-map">
                  <xsl:with-param name="doclang" select="@xml:lang"/>
               </xsl:call-template>
            </xsl:attribute>
         </xsl:if>
         <xsl:call-template name="maybe-set-id"/>
         <!--Process this element's content--><xsl:apply-templates/>
      </span>
   </xsl:template>

   <!--Gentext template for Context: _sfe:TocTitle_Table_of_Contents-->
<xsl:template match="_sfe:TocTitle_Table_of_Contents" mode="expand-gentext" priority="0">
      <xsl:copy>
         <xsl:apply-templates select="@*|node()" mode="expand-gentext"/>
      </xsl:copy>
   </xsl:template>

   <!--Initial pass template for Context: _sfe:TocTitle_Table_of_Contents-->
<xsl:template match="_sfe:TocTitle_Table_of_Contents" mode="initial-pass-mode" priority="0">
      <xsl:copy>
         <xsl:call-template name="maybe-set-gte-id"/>
         <xsl:apply-templates select="@*|node()" mode="initial-pass-mode"/>
      </xsl:copy>
   </xsl:template>

   <!--Set count-as pass template for Context: _sfe:TocTitle_Table_of_Contents-->
<xsl:template match="_sfe:TocTitle_Table_of_Contents" mode="set-countas" priority="0">
      <xsl:copy>
         <xsl:apply-templates select="@*|node()" mode="set-countas"/>
      </xsl:copy>
   </xsl:template>

   <!--Set ch:chunk template for Context: _sfe:TocTitle_Table_of_Contents-->
<xsl:template match="_sfe:TocTitle_Table_of_Contents" mode="set-ch-chunk" priority="0">
      <xsl:copy>
         <xsl:if test="not(@_gte:did-set-chunk)">
            <xsl:attribute name="_gte:did-set-chunk">yes</xsl:attribute>
         </xsl:if>
         <xsl:apply-templates select="@*|node()" mode="set-ch-chunk"/>
      </xsl:copy>
   </xsl:template>

   <!--Style template for Context: acc-man-ref-->
<xsl:template name="__style-for_acc-man-ref.1">
      <xsl:text> .x-acc-man-ref-1-0 {margin-left: 0pt; margin-right: 0pt; }</xsl:text>
   </xsl:template>

   <!--Template for Context: acc-man-ref-->
<xsl:template match="acc-man-ref" priority="0"><!--Emit a nostyle template--><xsl:apply-templates/>
   </xsl:template>

   <!--Gentext template for Context: acc-man-ref-->
<xsl:template match="acc-man-ref" mode="expand-gentext" priority="0">
      <xsl:copy>
         <xsl:apply-templates select="@*|node()" mode="expand-gentext"/>
      </xsl:copy>
   </xsl:template>

   <!--Initial pass template for Context: acc-man-ref-->
<xsl:template match="acc-man-ref" mode="initial-pass-mode" priority="0">
      <xsl:copy>
         <xsl:call-template name="maybe-set-gte-id"/>
         <xsl:apply-templates select="@*|node()" mode="initial-pass-mode"/>
      </xsl:copy>
   </xsl:template>

   <!--Set count-as pass template for Context: acc-man-ref-->
<xsl:template match="acc-man-ref" mode="set-countas" priority="0">
      <xsl:copy>
         <xsl:apply-templates select="@*|node()" mode="set-countas"/>
      </xsl:copy>
   </xsl:template>

   <!--Set ch:chunk template for Context: acc-man-ref-->
<xsl:template match="acc-man-ref" mode="set-ch-chunk" priority="0">
      <xsl:copy>
         <xsl:if test="not(@_gte:did-set-chunk)">
            <xsl:attribute name="_gte:did-set-chunk">yes</xsl:attribute>
         </xsl:if>
         <xsl:apply-templates select="@*|node()" mode="set-ch-chunk"/>
      </xsl:copy>
   </xsl:template>

   <!--Style template for Context: attach-parts-->
<xsl:template name="__style-for_attach-parts.1">
      <xsl:text> .x-attach-parts-1-0 {margin-left: 0pt; margin-right: 0pt; text-indent: 0pt; }</xsl:text>
   </xsl:template>

   <!--Template for Context: attach-parts-->
<xsl:template match="attach-parts" priority="0">
      <div><!--Emit class values to reflect conditions--><xsl:attribute name="class">
            <xsl:text> x-attach-parts-1-0</xsl:text>
         </xsl:attribute>
         <xsl:if test="@xml:lang">
            <xsl:attribute name="lang">
               <xsl:call-template name="return-lang-applying-language-map">
                  <xsl:with-param name="doclang" select="@xml:lang"/>
               </xsl:call-template>
            </xsl:attribute>
         </xsl:if>
         <xsl:copy-of select="@ch:*"/>
         <xsl:if test="@xml:lang">
            <xsl:attribute name="lang">
               <xsl:call-template name="return-lang-applying-language-map">
                  <xsl:with-param name="doclang" select="@xml:lang"/>
               </xsl:call-template>
            </xsl:attribute>
         </xsl:if>
         <xsl:call-template name="maybe-set-id"/>
         <!--Process this element's content--><xsl:apply-templates/>
      </div>
   </xsl:template>

   <!--Gentext template for Context: attach-parts-->
<xsl:template match="attach-parts" mode="expand-gentext" priority="0">
      <xsl:copy>
         <xsl:apply-templates select="@*|node()" mode="expand-gentext"/>
      </xsl:copy>
   </xsl:template>

   <!--Initial pass template for Context: attach-parts-->
<xsl:template match="attach-parts" mode="initial-pass-mode" priority="0">
      <xsl:copy>
         <xsl:call-template name="maybe-set-gte-id"/>
         <xsl:apply-templates select="@*|node()" mode="initial-pass-mode"/>
      </xsl:copy>
   </xsl:template>

   <!--Set count-as pass template for Context: attach-parts-->
<xsl:template match="attach-parts" mode="set-countas" priority="0">
      <xsl:copy>
         <xsl:apply-templates select="@*|node()" mode="set-countas"/>
      </xsl:copy>
   </xsl:template>

   <!--Set ch:chunk template for Context: attach-parts-->
<xsl:template match="attach-parts" mode="set-ch-chunk" priority="0">
      <xsl:copy>
         <xsl:if test="not(@_gte:did-set-chunk)">
            <xsl:attribute name="_gte:did-set-chunk">yes</xsl:attribute>
         </xsl:if>
         <xsl:apply-templates select="@*|node()" mode="set-ch-chunk"/>
      </xsl:copy>
   </xsl:template>

   <!--Style template for Context: bs-group-->
<xsl:template name="__style-for_bs-group.1">
      <xsl:text> .x-bs-group-1-0 {margin-left: 0pt; margin-right: 0pt; }</xsl:text>
   </xsl:template>

   <!--Template for Context: bs-group-->
<xsl:template match="bs-group" priority="0"><!--Emit a nostyle template--><xsl:apply-templates/>
   </xsl:template>

   <!--Gentext template for Context: bs-group-->
<xsl:template match="bs-group" mode="expand-gentext" priority="0">
      <xsl:copy>
         <xsl:apply-templates select="@*|node()" mode="expand-gentext"/>
      </xsl:copy>
   </xsl:template>

   <!--Initial pass template for Context: bs-group-->
<xsl:template match="bs-group" mode="initial-pass-mode" priority="0">
      <xsl:copy>
         <xsl:call-template name="maybe-set-gte-id"/>
         <xsl:apply-templates select="@*|node()" mode="initial-pass-mode"/>
      </xsl:copy>
   </xsl:template>

   <!--Set count-as pass template for Context: bs-group-->
<xsl:template match="bs-group" mode="set-countas" priority="0">
      <xsl:copy>
         <xsl:apply-templates select="@*|node()" mode="set-countas"/>
      </xsl:copy>
   </xsl:template>

   <!--Set ch:chunk template for Context: bs-group-->
<xsl:template match="bs-group" mode="set-ch-chunk" priority="0">
      <xsl:copy>
         <xsl:if test="not(@_gte:did-set-chunk)">
            <xsl:attribute name="_gte:did-set-chunk">yes</xsl:attribute>
         </xsl:if>
         <xsl:apply-templates select="@*|node()" mode="set-ch-chunk"/>
      </xsl:copy>
   </xsl:template>

   <!--Style template for Context: build-spec-->
<xsl:template name="__style-for_build-spec.1">
      <xsl:text> .x-build-spec-1-0 {margin-left: 0pt; margin-right: 0pt; text-indent: 0pt; margin-bottom: 12pt; }</xsl:text>
   </xsl:template>

   <!--Template for Context: build-spec-->
<xsl:template match="build-spec" priority="0">
      <div><!--Emit class values to reflect conditions--><xsl:attribute name="class">
            <xsl:text> x-build-spec-1-0</xsl:text>
         </xsl:attribute>
         <xsl:if test="@xml:lang">
            <xsl:attribute name="lang">
               <xsl:call-template name="return-lang-applying-language-map">
                  <xsl:with-param name="doclang" select="@xml:lang"/>
               </xsl:call-template>
            </xsl:attribute>
         </xsl:if>
         <xsl:copy-of select="@ch:*"/>
         <xsl:if test="@xml:lang">
            <xsl:attribute name="lang">
               <xsl:call-template name="return-lang-applying-language-map">
                  <xsl:with-param name="doclang" select="@xml:lang"/>
               </xsl:call-template>
            </xsl:attribute>
         </xsl:if>
         <xsl:call-template name="maybe-set-id"/>
         <!--Process this element's content--><xsl:apply-templates/>
      </div>
   </xsl:template>

   <!--Gentext template for Context: build-spec-->
<xsl:template match="build-spec" mode="expand-gentext" priority="0">
      <xsl:copy>
         <xsl:attribute name="_gte:Gentext-Expanded">y</xsl:attribute>
         <xsl:apply-templates select="@*" mode="expand-gentext"/>
         <xsl:if test="not(@_gte:id)">
            <xsl:attribute name="_gte:id">
               <xsl:value-of select="'_g_'"/>
               <xsl:value-of select="generate-id(.)"/>
            </xsl:attribute>
         </xsl:if>
         <!--Unconditional AddBefore--><xsl:if test="not(@_gte:Gentext-Expanded)">
            <_gte:Must-Expand-Gentext/>
            <_sfe:BeforeOrAfterText>
               <xsl:text>Build Specification No. </xsl:text>
            </_sfe:BeforeOrAfterText>
         </xsl:if>
         <xsl:apply-templates select="* | text() | processing-instruction()" mode="expand-gentext"/>
      </xsl:copy>
   </xsl:template>

   <!--Initial pass template for Context: build-spec-->
<xsl:template match="build-spec" mode="initial-pass-mode" priority="0">
      <xsl:copy>
         <xsl:call-template name="maybe-set-gte-id"/>
         <xsl:apply-templates select="@*|node()" mode="initial-pass-mode"/>
      </xsl:copy>
   </xsl:template>

   <!--Set count-as pass template for Context: build-spec-->
<xsl:template match="build-spec" mode="set-countas" priority="0">
      <xsl:copy>
         <xsl:apply-templates select="@*|node()" mode="set-countas"/>
      </xsl:copy>
   </xsl:template>

   <!--Set ch:chunk template for Context: build-spec-->
<xsl:template match="build-spec" mode="set-ch-chunk" priority="0">
      <xsl:copy>
         <xsl:if test="not(@_gte:did-set-chunk)">
            <xsl:attribute name="_gte:did-set-chunk">yes</xsl:attribute>
         </xsl:if>
         <xsl:apply-templates select="@*|node()" mode="set-ch-chunk"/>
      </xsl:copy>
   </xsl:template>

   <!--Style template for Context: chap-->
<xsl:template name="__style-for_chap.1">
      <xsl:text> .x-chap-1-0 {margin-left: 0pt; margin-right: 0pt; }</xsl:text>
   </xsl:template>

   <!--Template for Context: chap-->
<xsl:template match="chap" priority="0"><!--Emit a nostyle template--><xsl:apply-templates/>
   </xsl:template>

   <!--Gentext template for Context: chap-->
<xsl:template match="chap" mode="expand-gentext" priority="0">
      <xsl:copy>
         <xsl:apply-templates select="@*|node()" mode="expand-gentext"/>
      </xsl:copy>
   </xsl:template>

   <!--Initial pass template for Context: chap-->
<xsl:template match="chap" mode="initial-pass-mode" priority="0">
      <xsl:copy>
         <xsl:call-template name="maybe-set-gte-id"/>
         <xsl:apply-templates select="@*|node()" mode="initial-pass-mode"/>
      </xsl:copy>
   </xsl:template>

   <!--Set count-as pass template for Context: chap-->
<xsl:template match="chap" mode="set-countas" priority="0">
      <xsl:copy>
         <xsl:apply-templates select="@*|node()" mode="set-countas"/>
      </xsl:copy>
   </xsl:template>

   <!--Set ch:chunk template for Context: chap-->
<xsl:template match="chap" mode="set-ch-chunk" priority="0">
      <xsl:copy>
         <xsl:if test="not(@_gte:did-set-chunk)">
            <xsl:attribute name="_gte:did-set-chunk">yes</xsl:attribute>
         </xsl:if>
         <xsl:apply-templates select="@*|node()" mode="set-ch-chunk"/>
      </xsl:copy>
   </xsl:template>

   <!--Style template for Context: dimen-->
<xsl:template name="__style-for_dimen.1">
      <xsl:text> .x-dimen-1-0 {margin-left: 0pt; margin-right: 0pt; }</xsl:text>
   </xsl:template>

   <!--Template for Context: dimen-->
<xsl:template match="dimen" priority="0">
      <span><!--Emit class values to reflect conditions--><xsl:attribute name="class">
            <xsl:text> x-dimen-1-0</xsl:text>
         </xsl:attribute>
         <xsl:if test="@xml:lang">
            <xsl:attribute name="lang">
               <xsl:call-template name="return-lang-applying-language-map">
                  <xsl:with-param name="doclang" select="@xml:lang"/>
               </xsl:call-template>
            </xsl:attribute>
         </xsl:if>
         <xsl:copy-of select="@ch:*"/>
         <xsl:if test="@xml:lang">
            <xsl:attribute name="lang">
               <xsl:call-template name="return-lang-applying-language-map">
                  <xsl:with-param name="doclang" select="@xml:lang"/>
               </xsl:call-template>
            </xsl:attribute>
         </xsl:if>
         <xsl:call-template name="maybe-set-id"/>
         <!--Process this element's content--><xsl:apply-templates/>
      </span>
   </xsl:template>

   <!--Gentext template for Context: dimen-->
<xsl:template match="dimen" mode="expand-gentext" priority="0">
      <xsl:copy>
         <xsl:attribute name="_gte:Gentext-Expanded">y</xsl:attribute>
         <xsl:apply-templates select="@*" mode="expand-gentext"/>
         <xsl:if test="not(@_gte:id)">
            <xsl:attribute name="_gte:id">
               <xsl:value-of select="'_g_'"/>
               <xsl:value-of select="generate-id(.)"/>
            </xsl:attribute>
         </xsl:if>
         <!--Unconditional AddBefore--><xsl:if test="not(@_gte:Gentext-Expanded)">
            <_gte:Must-Expand-Gentext/>
            <_sfe:BeforeOrAfterText>
               <xsl:text> </xsl:text>
            </_sfe:BeforeOrAfterText>
         </xsl:if>
         <xsl:apply-templates select="* | text() | processing-instruction()" mode="expand-gentext"/>
         <!--Unconditional AddAfter--><xsl:if test="not(@_gte:Gentext-Expanded)">
            <_gte:Must-Expand-Gentext/>
            <_sfe:BeforeOrAfterText>
               <xsl:text> </xsl:text>
            </_sfe:BeforeOrAfterText>
         </xsl:if>
      </xsl:copy>
   </xsl:template>

   <!--Initial pass template for Context: dimen-->
<xsl:template match="dimen" mode="initial-pass-mode" priority="0">
      <xsl:copy>
         <xsl:call-template name="maybe-set-gte-id"/>
         <xsl:apply-templates select="@*|node()" mode="initial-pass-mode"/>
      </xsl:copy>
   </xsl:template>

   <!--Set count-as pass template for Context: dimen-->
<xsl:template match="dimen" mode="set-countas" priority="0">
      <xsl:copy>
         <xsl:apply-templates select="@*|node()" mode="set-countas"/>
      </xsl:copy>
   </xsl:template>

   <!--Set ch:chunk template for Context: dimen-->
<xsl:template match="dimen" mode="set-ch-chunk" priority="0">
      <xsl:copy>
         <xsl:if test="not(@_gte:did-set-chunk)">
            <xsl:attribute name="_gte:did-set-chunk">yes</xsl:attribute>
         </xsl:if>
         <xsl:apply-templates select="@*|node()" mode="set-ch-chunk"/>
      </xsl:copy>
   </xsl:template>

   <!--Style template for Context: eff-bs-->
<xsl:template name="__style-for_eff-bs.1">
      <xsl:text> .x-eff-bs-1-0 {margin-left: 0pt; margin-right: 0pt; }</xsl:text>
   </xsl:template>

   <!--Template for Context: eff-bs-->
<xsl:template match="eff-bs" priority="0">
      <span><!--Emit class values to reflect conditions--><xsl:attribute name="class">
            <xsl:text> x-eff-bs-1-0</xsl:text>
         </xsl:attribute>
         <xsl:if test="@xml:lang">
            <xsl:attribute name="lang">
               <xsl:call-template name="return-lang-applying-language-map">
                  <xsl:with-param name="doclang" select="@xml:lang"/>
               </xsl:call-template>
            </xsl:attribute>
         </xsl:if>
         <xsl:copy-of select="@ch:*"/>
         <xsl:if test="@xml:lang">
            <xsl:attribute name="lang">
               <xsl:call-template name="return-lang-applying-language-map">
                  <xsl:with-param name="doclang" select="@xml:lang"/>
               </xsl:call-template>
            </xsl:attribute>
         </xsl:if>
         <xsl:call-template name="maybe-set-id"/>
         <!--Process this element's content--><xsl:apply-templates/>
      </span>
   </xsl:template>

   <!--Gentext template for Context: eff-bs-->
<xsl:template match="eff-bs" mode="expand-gentext" priority="0">
      <xsl:copy>
         <xsl:apply-templates select="@*|node()" mode="expand-gentext"/>
      </xsl:copy>
   </xsl:template>

   <!--Initial pass template for Context: eff-bs-->
<xsl:template match="eff-bs" mode="initial-pass-mode" priority="0">
      <xsl:copy>
         <xsl:call-template name="maybe-set-gte-id"/>
         <xsl:apply-templates select="@*|node()" mode="initial-pass-mode"/>
      </xsl:copy>
   </xsl:template>

   <!--Set count-as pass template for Context: eff-bs-->
<xsl:template match="eff-bs" mode="set-countas" priority="0">
      <xsl:copy>
         <xsl:apply-templates select="@*|node()" mode="set-countas"/>
      </xsl:copy>
   </xsl:template>

   <!--Set ch:chunk template for Context: eff-bs-->
<xsl:template match="eff-bs" mode="set-ch-chunk" priority="0">
      <xsl:copy>
         <xsl:if test="not(@_gte:did-set-chunk)">
            <xsl:attribute name="_gte:did-set-chunk">yes</xsl:attribute>
         </xsl:if>
         <xsl:apply-templates select="@*|node()" mode="set-ch-chunk"/>
      </xsl:copy>
   </xsl:template>

   <!--Style template for Context: eff-code-->
<xsl:template name="__style-for_eff-code.1">
      <xsl:text> .x-eff-code-1-0 {margin-left: 0pt; margin-right: 0pt; text-indent: 0pt; } /* gdb 12-10-12: removed all source edits making it a hyperlink */</xsl:text>
   </xsl:template>

   <!--Template for Context: eff-code-->
<xsl:template match="eff-code" priority="0">
      <div><!--Emit class values to reflect conditions--><xsl:attribute name="class">
            <xsl:text> x-eff-code-1-0</xsl:text>
         </xsl:attribute>
         <xsl:if test="@xml:lang">
            <xsl:attribute name="lang">
               <xsl:call-template name="return-lang-applying-language-map">
                  <xsl:with-param name="doclang" select="@xml:lang"/>
               </xsl:call-template>
            </xsl:attribute>
         </xsl:if>
         <xsl:copy-of select="@ch:*"/>
         <xsl:if test="@xml:lang">
            <xsl:attribute name="lang">
               <xsl:call-template name="return-lang-applying-language-map">
                  <xsl:with-param name="doclang" select="@xml:lang"/>
               </xsl:call-template>
            </xsl:attribute>
         </xsl:if>
         <xsl:call-template name="maybe-set-id"/>
         <!--Process this element's content--><xsl:apply-templates/>
      </div>
   </xsl:template>

   <!--Gentext template for Context: eff-code-->
<xsl:template match="eff-code" mode="expand-gentext" priority="0">
      <xsl:copy>
         <xsl:apply-templates select="@*|node()" mode="expand-gentext"/>
      </xsl:copy>
   </xsl:template>

   <!--Initial pass template for Context: eff-code-->
<xsl:template match="eff-code" mode="initial-pass-mode" priority="0">
      <xsl:copy>
         <xsl:call-template name="maybe-set-gte-id"/>
         <xsl:apply-templates select="@*|node()" mode="initial-pass-mode"/>
      </xsl:copy>
   </xsl:template>

   <!--Set count-as pass template for Context: eff-code-->
<xsl:template match="eff-code" mode="set-countas" priority="0">
      <xsl:copy>
         <xsl:apply-templates select="@*|node()" mode="set-countas"/>
      </xsl:copy>
   </xsl:template>

   <!--Set ch:chunk template for Context: eff-code-->
<xsl:template match="eff-code" mode="set-ch-chunk" priority="0">
      <xsl:copy>
         <xsl:if test="not(@_gte:did-set-chunk)">
            <xsl:attribute name="_gte:did-set-chunk">yes</xsl:attribute>
         </xsl:if>
         <xsl:apply-templates select="@*|node()" mode="set-ch-chunk"/>
      </xsl:copy>
   </xsl:template>

   <!--Style template for Context: eff-letter-->
<xsl:template name="__style-for_eff-letter.1">
      <xsl:text> .x-eff-letter-1-0 {margin-left: 0pt; margin-right: 0pt; }</xsl:text>
   </xsl:template>

   <!--Template for Context: eff-letter-->
<xsl:template match="eff-letter" priority="0">
      <span><!--Emit class values to reflect conditions--><xsl:attribute name="class">
            <xsl:text> x-eff-letter-1-0</xsl:text>
         </xsl:attribute>
         <xsl:if test="@xml:lang">
            <xsl:attribute name="lang">
               <xsl:call-template name="return-lang-applying-language-map">
                  <xsl:with-param name="doclang" select="@xml:lang"/>
               </xsl:call-template>
            </xsl:attribute>
         </xsl:if>
         <xsl:copy-of select="@ch:*"/>
         <xsl:if test="@xml:lang">
            <xsl:attribute name="lang">
               <xsl:call-template name="return-lang-applying-language-map">
                  <xsl:with-param name="doclang" select="@xml:lang"/>
               </xsl:call-template>
            </xsl:attribute>
         </xsl:if>
         <xsl:call-template name="maybe-set-id"/>
         <!--Process this element's content--><xsl:apply-templates/>
      </span>
   </xsl:template>

   <!--Gentext template for Context: eff-letter-->
<xsl:template match="eff-letter" mode="expand-gentext" priority="0">
      <xsl:copy>
         <xsl:apply-templates select="@*|node()" mode="expand-gentext"/>
      </xsl:copy>
   </xsl:template>

   <!--Initial pass template for Context: eff-letter-->
<xsl:template match="eff-letter" mode="initial-pass-mode" priority="0">
      <xsl:copy>
         <xsl:call-template name="maybe-set-gte-id"/>
         <xsl:apply-templates select="@*|node()" mode="initial-pass-mode"/>
      </xsl:copy>
   </xsl:template>

   <!--Set count-as pass template for Context: eff-letter-->
<xsl:template match="eff-letter" mode="set-countas" priority="0">
      <xsl:copy>
         <xsl:apply-templates select="@*|node()" mode="set-countas"/>
      </xsl:copy>
   </xsl:template>

   <!--Set ch:chunk template for Context: eff-letter-->
<xsl:template match="eff-letter" mode="set-ch-chunk" priority="0">
      <xsl:copy>
         <xsl:if test="not(@_gte:did-set-chunk)">
            <xsl:attribute name="_gte:did-set-chunk">yes</xsl:attribute>
         </xsl:if>
         <xsl:apply-templates select="@*|node()" mode="set-ch-chunk"/>
      </xsl:copy>
   </xsl:template>

   <!--Style template for Context: eff-model-->
<xsl:template name="__style-for_eff-model.1">
      <xsl:text> .x-eff-model-1-0 {margin-left: 0pt; margin-right: 0pt; }</xsl:text>
   </xsl:template>

   <!--Template for Context: eff-model-->
<xsl:template match="eff-model" priority="0">
      <span><!--Emit class values to reflect conditions--><xsl:attribute name="class">
            <xsl:text> x-eff-model-1-0</xsl:text>
         </xsl:attribute>
         <xsl:if test="@xml:lang">
            <xsl:attribute name="lang">
               <xsl:call-template name="return-lang-applying-language-map">
                  <xsl:with-param name="doclang" select="@xml:lang"/>
               </xsl:call-template>
            </xsl:attribute>
         </xsl:if>
         <xsl:copy-of select="@ch:*"/>
         <xsl:if test="@xml:lang">
            <xsl:attribute name="lang">
               <xsl:call-template name="return-lang-applying-language-map">
                  <xsl:with-param name="doclang" select="@xml:lang"/>
               </xsl:call-template>
            </xsl:attribute>
         </xsl:if>
         <xsl:call-template name="maybe-set-id"/>
         <!--Process this element's content--><xsl:apply-templates/>
      </span>
   </xsl:template>

   <!--Gentext template for Context: eff-model-->
<xsl:template match="eff-model" mode="expand-gentext" priority="0">
      <xsl:copy>
         <xsl:apply-templates select="@*|node()" mode="expand-gentext"/>
      </xsl:copy>
   </xsl:template>

   <!--Initial pass template for Context: eff-model-->
<xsl:template match="eff-model" mode="initial-pass-mode" priority="0">
      <xsl:copy>
         <xsl:call-template name="maybe-set-gte-id"/>
         <xsl:apply-templates select="@*|node()" mode="initial-pass-mode"/>
      </xsl:copy>
   </xsl:template>

   <!--Set count-as pass template for Context: eff-model-->
<xsl:template match="eff-model" mode="set-countas" priority="0">
      <xsl:copy>
         <xsl:apply-templates select="@*|node()" mode="set-countas"/>
      </xsl:copy>
   </xsl:template>

   <!--Set ch:chunk template for Context: eff-model-->
<xsl:template match="eff-model" mode="set-ch-chunk" priority="0">
      <xsl:copy>
         <xsl:if test="not(@_gte:did-set-chunk)">
            <xsl:attribute name="_gte:did-set-chunk">yes</xsl:attribute>
         </xsl:if>
         <xsl:apply-templates select="@*|node()" mode="set-ch-chunk"/>
      </xsl:copy>
   </xsl:template>

   <!--Style template for Context: fignote-->
<xsl:template name="__style-for_fignote.1">
      <xsl:text> .x-fignote-1-0 {margin-left: 0pt; margin-right: 0pt; text-indent: 0pt; }</xsl:text>
   </xsl:template>

   <!--Template for Context: fignote-->
<xsl:template match="fignote" priority="0">
      <div><!--Emit class values to reflect conditions--><xsl:attribute name="class">
            <xsl:text> x-fignote-1-0</xsl:text>
         </xsl:attribute>
         <xsl:if test="@xml:lang">
            <xsl:attribute name="lang">
               <xsl:call-template name="return-lang-applying-language-map">
                  <xsl:with-param name="doclang" select="@xml:lang"/>
               </xsl:call-template>
            </xsl:attribute>
         </xsl:if>
         <xsl:copy-of select="@ch:*"/>
         <xsl:if test="@xml:lang">
            <xsl:attribute name="lang">
               <xsl:call-template name="return-lang-applying-language-map">
                  <xsl:with-param name="doclang" select="@xml:lang"/>
               </xsl:call-template>
            </xsl:attribute>
         </xsl:if>
         <xsl:call-template name="maybe-set-id"/>
         <!--Process this element's content--><xsl:apply-templates/>
      </div>
   </xsl:template>

   <!--Gentext template for Context: fignote-->
<xsl:template match="fignote" mode="expand-gentext" priority="0">
      <xsl:copy>
         <xsl:apply-templates select="@*|node()" mode="expand-gentext"/>
      </xsl:copy>
   </xsl:template>

   <!--Initial pass template for Context: fignote-->
<xsl:template match="fignote" mode="initial-pass-mode" priority="0">
      <xsl:copy>
         <xsl:call-template name="maybe-set-gte-id"/>
         <xsl:apply-templates select="@*|node()" mode="initial-pass-mode"/>
      </xsl:copy>
   </xsl:template>

   <!--Set count-as pass template for Context: fignote-->
<xsl:template match="fignote" mode="set-countas" priority="0">
      <xsl:copy>
         <xsl:apply-templates select="@*|node()" mode="set-countas"/>
      </xsl:copy>
   </xsl:template>

   <!--Set ch:chunk template for Context: fignote-->
<xsl:template match="fignote" mode="set-ch-chunk" priority="0">
      <xsl:copy>
         <xsl:if test="not(@_gte:did-set-chunk)">
            <xsl:attribute name="_gte:did-set-chunk">yes</xsl:attribute>
         </xsl:if>
         <xsl:apply-templates select="@*|node()" mode="set-ch-chunk"/>
      </xsl:copy>
   </xsl:template>

   <!--Style template for Context: figure[descendant::graphic]-->
<xsl:template name="__style-for_figure.2firere271">
      <xsl:text> .x-figure-1-0 {margin-left: 0pt; margin-right: 0pt; text-indent: 0pt; margin-top: 8pt; }</xsl:text>
   </xsl:template>

   <!--Template for Context: figure[descendant::graphic]-->
<xsl:template match="figure[descendant::graphic]" priority="1">
      <div><!--Emit class values to reflect conditions--><xsl:attribute name="class">
            <xsl:text> x-figure-1-0</xsl:text>
         </xsl:attribute>
         <xsl:if test="@xml:lang">
            <xsl:attribute name="lang">
               <xsl:call-template name="return-lang-applying-language-map">
                  <xsl:with-param name="doclang" select="@xml:lang"/>
               </xsl:call-template>
            </xsl:attribute>
         </xsl:if>
         <xsl:copy-of select="@ch:*"/>
         <xsl:if test="@xml:lang">
            <xsl:attribute name="lang">
               <xsl:call-template name="return-lang-applying-language-map">
                  <xsl:with-param name="doclang" select="@xml:lang"/>
               </xsl:call-template>
            </xsl:attribute>
         </xsl:if>
         <xsl:call-template name="maybe-set-id">
            <xsl:with-param name="only-if-id-attr" select="'no'"/>
            <xsl:with-param name="generated-id-prefix" select="'styler-id'"/>
         </xsl:call-template>
         <!--Process this element's content--><xsl:apply-templates/>
      </div>
   </xsl:template>

   <!--Gentext template for Context: figure[descendant::graphic]-->
<xsl:template match="figure[descendant::graphic]" mode="expand-gentext" priority="1">
      <xsl:copy>
         <xsl:apply-templates select="@*|node()" mode="expand-gentext"/>
      </xsl:copy>
   </xsl:template>

   <!--Initial pass template for Context: figure[descendant::graphic]-->
<xsl:template match="figure[descendant::graphic]" mode="initial-pass-mode" priority="1">
      <xsl:copy>
         <xsl:call-template name="maybe-set-gte-id"/>
         <xsl:apply-templates select="@*|node()" mode="initial-pass-mode"/>
      </xsl:copy>
   </xsl:template>

   <!--Set count-as pass template for Context: figure[descendant::graphic]-->
<xsl:template match="figure[descendant::graphic]" mode="set-countas" priority="1">
      <xsl:copy>
         <xsl:apply-templates select="@*|node()" mode="set-countas"/>
      </xsl:copy>
   </xsl:template>

   <!--Set ch:chunk template for Context: figure[descendant::graphic]-->
<xsl:template match="figure[descendant::graphic]" mode="set-ch-chunk" priority="1">
      <xsl:copy>
         <xsl:if test="not(@_gte:did-set-chunk)">
            <xsl:attribute name="_gte:did-set-chunk">yes</xsl:attribute>
         </xsl:if>
         <xsl:apply-templates select="@*|node()" mode="set-ch-chunk"/>
      </xsl:copy>
   </xsl:template>

   <!--Style template for Context: figure-->
<xsl:template name="__style-for_figure.2firere62">
      <xsl:text> .x-figure-2-0 {margin-left: 0pt; margin-right: 0pt; text-indent: 0pt; margin-top: 8pt; }</xsl:text>
   </xsl:template>

   <!--Template for Context: figure-->
<xsl:template match="figure" priority="0">
      <div><!--Emit class values to reflect conditions--><xsl:attribute name="class">
            <xsl:text> x-figure-2-0</xsl:text>
         </xsl:attribute>
         <xsl:if test="@xml:lang">
            <xsl:attribute name="lang">
               <xsl:call-template name="return-lang-applying-language-map">
                  <xsl:with-param name="doclang" select="@xml:lang"/>
               </xsl:call-template>
            </xsl:attribute>
         </xsl:if>
         <xsl:copy-of select="@ch:*"/>
         <xsl:if test="@xml:lang">
            <xsl:attribute name="lang">
               <xsl:call-template name="return-lang-applying-language-map">
                  <xsl:with-param name="doclang" select="@xml:lang"/>
               </xsl:call-template>
            </xsl:attribute>
         </xsl:if>
         <xsl:call-template name="maybe-set-id">
            <xsl:with-param name="only-if-id-attr" select="'no'"/>
            <xsl:with-param name="generated-id-prefix" select="'styler-id'"/>
         </xsl:call-template>
         <!--Process this element's content--><xsl:apply-templates/>
      </div>
   </xsl:template>

   <!--Gentext template for Context: figure-->
<xsl:template match="figure" mode="expand-gentext" priority="0">
      <xsl:copy>
         <xsl:apply-templates select="@*|node()" mode="expand-gentext"/>
      </xsl:copy>
   </xsl:template>

   <!--Initial pass template for Context: figure-->
<xsl:template match="figure" mode="initial-pass-mode" priority="0">
      <xsl:copy>
         <xsl:call-template name="maybe-set-gte-id"/>
         <xsl:apply-templates select="@*|node()" mode="initial-pass-mode"/>
      </xsl:copy>
   </xsl:template>

   <!--Set count-as pass template for Context: figure-->
<xsl:template match="figure" mode="set-countas" priority="0">
      <xsl:copy>
         <xsl:apply-templates select="@*|node()" mode="set-countas"/>
      </xsl:copy>
   </xsl:template>

   <!--Set ch:chunk template for Context: figure-->
<xsl:template match="figure" mode="set-ch-chunk" priority="0">
      <xsl:copy>
         <xsl:if test="not(@_gte:did-set-chunk)">
            <xsl:attribute name="_gte:did-set-chunk">yes</xsl:attribute>
         </xsl:if>
         <xsl:apply-templates select="@*|node()" mode="set-ch-chunk"/>
      </xsl:copy>
   </xsl:template>

   <!--Style template for Context: imp-->
<xsl:template name="__style-for_imp.1">
      <xsl:text> .x-imp-1-0 {margin-left: 0pt; margin-right: 0pt; }</xsl:text>
   </xsl:template>

   <!--Template for Context: imp-->
<xsl:template match="imp" priority="0">
      <span><!--Emit class values to reflect conditions--><xsl:attribute name="class">
            <xsl:text> x-imp-1-0</xsl:text>
         </xsl:attribute>
         <xsl:if test="@xml:lang">
            <xsl:attribute name="lang">
               <xsl:call-template name="return-lang-applying-language-map">
                  <xsl:with-param name="doclang" select="@xml:lang"/>
               </xsl:call-template>
            </xsl:attribute>
         </xsl:if>
         <xsl:copy-of select="@ch:*"/>
         <xsl:if test="@xml:lang">
            <xsl:attribute name="lang">
               <xsl:call-template name="return-lang-applying-language-map">
                  <xsl:with-param name="doclang" select="@xml:lang"/>
               </xsl:call-template>
            </xsl:attribute>
         </xsl:if>
         <xsl:call-template name="maybe-set-id"/>
         <!--Process this element's content--><xsl:apply-templates/>
      </span>
   </xsl:template>

   <!--Gentext template for Context: imp-->
<xsl:template match="imp" mode="expand-gentext" priority="0">
      <xsl:copy>
         <xsl:apply-templates select="@*|node()" mode="expand-gentext"/>
      </xsl:copy>
   </xsl:template>

   <!--Initial pass template for Context: imp-->
<xsl:template match="imp" mode="initial-pass-mode" priority="0">
      <xsl:copy>
         <xsl:call-template name="maybe-set-gte-id"/>
         <xsl:apply-templates select="@*|node()" mode="initial-pass-mode"/>
      </xsl:copy>
   </xsl:template>

   <!--Set count-as pass template for Context: imp-->
<xsl:template match="imp" mode="set-countas" priority="0">
      <xsl:copy>
         <xsl:apply-templates select="@*|node()" mode="set-countas"/>
      </xsl:copy>
   </xsl:template>

   <!--Set ch:chunk template for Context: imp-->
<xsl:template match="imp" mode="set-ch-chunk" priority="0">
      <xsl:copy>
         <xsl:if test="not(@_gte:did-set-chunk)">
            <xsl:attribute name="_gte:did-set-chunk">yes</xsl:attribute>
         </xsl:if>
         <xsl:apply-templates select="@*|node()" mode="set-ch-chunk"/>
      </xsl:copy>
   </xsl:template>

   <!--Style template for Context: atidlm:inclusion-->
<xsl:template name="__style-for_atidlm-inclusion.1">
      <xsl:text> .x-atidlm-inclusion-1-0 {margin-left: 0pt; margin-right: 0pt; text-indent: 0pt; }</xsl:text>
   </xsl:template>

   <!--Template for Context: atidlm:inclusion-->
<xsl:template match="atidlm:inclusion" priority="0">
      <span><!--Emit class values to reflect conditions--><xsl:attribute name="class">
            <xsl:text> x-atidlm-inclusion-1-0</xsl:text>
         </xsl:attribute>
         <xsl:if test="@xml:lang">
            <xsl:attribute name="lang">
               <xsl:call-template name="return-lang-applying-language-map">
                  <xsl:with-param name="doclang" select="@xml:lang"/>
               </xsl:call-template>
            </xsl:attribute>
         </xsl:if>
         <xsl:copy-of select="@ch:*"/>
         <xsl:if test="@xml:lang">
            <xsl:attribute name="lang">
               <xsl:call-template name="return-lang-applying-language-map">
                  <xsl:with-param name="doclang" select="@xml:lang"/>
               </xsl:call-template>
            </xsl:attribute>
         </xsl:if>
         <xsl:call-template name="maybe-set-id"/>
         <!--Process this element's content--><xsl:apply-templates/>
      </span>
   </xsl:template>

   <!--Gentext template for Context: atidlm:inclusion-->
<xsl:template match="atidlm:inclusion" mode="expand-gentext" priority="0">
      <xsl:copy>
         <xsl:apply-templates select="@*|node()" mode="expand-gentext"/>
      </xsl:copy>
   </xsl:template>

   <!--Initial pass template for Context: atidlm:inclusion-->
<xsl:template match="atidlm:inclusion" mode="initial-pass-mode" priority="0">
      <xsl:copy>
         <xsl:call-template name="maybe-set-gte-id"/>
         <xsl:apply-templates select="@*|node()" mode="initial-pass-mode"/>
      </xsl:copy>
   </xsl:template>

   <!--Set count-as pass template for Context: atidlm:inclusion-->
<xsl:template match="atidlm:inclusion" mode="set-countas" priority="0">
      <xsl:copy>
         <xsl:apply-templates select="@*|node()" mode="set-countas"/>
      </xsl:copy>
   </xsl:template>

   <!--Set ch:chunk template for Context: atidlm:inclusion-->
<xsl:template match="atidlm:inclusion" mode="set-ch-chunk" priority="0">
      <xsl:copy>
         <xsl:if test="not(@_gte:did-set-chunk)">
            <xsl:attribute name="_gte:did-set-chunk">yes</xsl:attribute>
         </xsl:if>
         <xsl:apply-templates select="@*|node()" mode="set-ch-chunk"/>
      </xsl:copy>
   </xsl:template>

   <!--Style template for Context: inter-->
<xsl:template name="__style-for_inter.1">
      <xsl:text> .x-inter-1-0 {margin-left: 0pt; margin-right: 0pt; text-indent: 0pt; } .x-inter-1-1 {} .x-inter-1-2 {} .x-inter-1-3 {} .x-inter-1-4 {} .x-inter-1-5 {} .x-inter-1-6 {} .x-inter-1-7 {}</xsl:text>
   </xsl:template>

   <!--Template for Context: inter-->
<xsl:template match="inter" priority="0">
      <xsl:variable name="foClass">block</xsl:variable>
      <xsl:variable name="blockness">block</xsl:variable>
      <xsl:variable name="startnew"/>
      <xsl:variable name="newpageset">#noChange</xsl:variable>
      <div><!--Emit class values to reflect conditions--><xsl:attribute name="class">
            <xsl:text> x-inter-1-0</xsl:text>
            <xsl:if test="@prc=number('1')"> x-inter-1-1</xsl:if>
            <xsl:if test="not(@prc=number('1')) and (@prc=number('2'))"> x-inter-1-2</xsl:if>
            <xsl:if test="not(@prc=number('1')) and not(@prc=number('2')) and (@prc=number('3'))"> x-inter-1-3</xsl:if>
            <xsl:if test="not(@prc=number('1')) and not(@prc=number('2')) and not(@prc=number('3')) and (@prc=number('6'))"> x-inter-1-4</xsl:if>
            <xsl:if test="not(@prc=number('1')) and not(@prc=number('2')) and not(@prc=number('3')) and not(@prc=number('6')) and (@prc=number('7'))"> x-inter-1-5</xsl:if>
            <xsl:if test="not(@prc=number('1')) and not(@prc=number('2')) and not(@prc=number('3')) and not(@prc=number('6')) and not(@prc=number('7')) and (@prc and string(@prc)='N')"> x-inter-1-6</xsl:if>
            <xsl:if test="not(@prc=number('1')) and not(@prc=number('2')) and not(@prc=number('3')) and not(@prc=number('6')) and not(@prc=number('7')) and not(@prc and string(@prc)='N') and (@prc and string(@prc)='S')"> x-inter-1-7</xsl:if>
         </xsl:attribute>
         <xsl:if test="@xml:lang">
            <xsl:attribute name="lang">
               <xsl:call-template name="return-lang-applying-language-map">
                  <xsl:with-param name="doclang" select="@xml:lang"/>
               </xsl:call-template>
            </xsl:attribute>
         </xsl:if>
         <xsl:copy-of select="@ch:*"/>
         <xsl:variable name="Breaks-chunkFilenameXPath"/>
         <xsl:variable name="Breaks-persistentFilename"/>
         <xsl:if test="($Breaks-persistentFilename='yes') and ($Breaks-chunkFilenameXPath!='')">
            <xsl:variable name="chunkFilename"/>
            <xsl:if test="$chunkFilename!=''">
               <xsl:attribute name="ch:filename">
                  <xsl:value-of select="$chunkFilename"/>
               </xsl:attribute>
               <xsl:attribute name="ch:namepriority">0</xsl:attribute>
            </xsl:if>
         </xsl:if>
         <xsl:if test="@xml:lang">
            <xsl:attribute name="lang">
               <xsl:call-template name="return-lang-applying-language-map">
                  <xsl:with-param name="doclang" select="@xml:lang"/>
               </xsl:call-template>
            </xsl:attribute>
         </xsl:if>
         <xsl:call-template name="maybe-set-id"/>
         <!--Process this element's content--><xsl:apply-templates/>
      </div>
   </xsl:template>

   <!--Gentext template for Context: inter-->
<xsl:template match="inter" mode="expand-gentext" priority="0">
      <xsl:copy>
         <xsl:attribute name="_gte:Gentext-Expanded">y</xsl:attribute>
         <xsl:apply-templates select="@*" mode="expand-gentext"/>
         <xsl:if test="not(@_gte:id)">
            <xsl:attribute name="_gte:id">
               <xsl:value-of select="'_g_'"/>
               <xsl:value-of select="generate-id(.)"/>
            </xsl:attribute>
         </xsl:if>
         <xsl:choose>
            <xsl:when test="not(@prc=number('1')) and not(@prc=number('2')) and not(@prc=number('3')) and not(@prc=number('6')) and not(@prc=number('7')) and not(@prc and string(@prc)='N') and (@prc and string(@prc)='S')"><!--AddBefore Condition #7--><xsl:if test="not(@_gte:Gentext-Expanded)">
                  <_gte:Must-Expand-Gentext/>
                  <_sfe:BeforeOrAfterText>
                     <xsl:text>INTRCHG WITH P/N </xsl:text>
                  </_sfe:BeforeOrAfterText>
               </xsl:if>
            </xsl:when>
            <xsl:when test="not(@prc=number('1')) and not(@prc=number('2')) and not(@prc=number('3')) and not(@prc=number('6')) and not(@prc=number('7')) and (@prc and string(@prc)='N')"><!--AddBefore Condition #6--><xsl:if test="not(@_gte:Gentext-Expanded)">
                  <_gte:Must-Expand-Gentext/>
                  <_sfe:BeforeOrAfterText>
                     <xsl:text>NONINTR WITH P/N </xsl:text>
                  </_sfe:BeforeOrAfterText>
               </xsl:if>
            </xsl:when>
            <xsl:when test="not(@prc=number('1')) and not(@prc=number('2')) and not(@prc=number('3')) and not(@prc=number('6')) and (@prc=number('7'))"><!--AddBefore Condition #5--><xsl:if test="not(@_gte:Gentext-Expanded)">
                  <_gte:Must-Expand-Gentext/>
                  <_sfe:BeforeOrAfterText>
                     <xsl:text>RESTRICTED INTERCHANGEABILITY WITH P/N </xsl:text>
                  </_sfe:BeforeOrAfterText>
               </xsl:if>
            </xsl:when>
            <xsl:when test="not(@prc=number('1')) and not(@prc=number('2')) and not(@prc=number('3')) and (@prc=number('6'))"><!--AddBefore Condition #4--><xsl:if test="not(@_gte:Gentext-Expanded)">
                  <_gte:Must-Expand-Gentext/>
                  <_sfe:BeforeOrAfterText>
                     <xsl:text>INTRCHG AS A SET WITH P/N </xsl:text>
                  </_sfe:BeforeOrAfterText>
               </xsl:if>
            </xsl:when>
            <xsl:when test="not(@prc=number('1')) and not(@prc=number('2')) and (@prc=number('3'))"><!--AddBefore Condition #3--><xsl:if test="not(@_gte:Gentext-Expanded)">
                  <_gte:Must-Expand-Gentext/>
                  <_sfe:BeforeOrAfterText>
                     <xsl:text>NOT INTR WITH P/N </xsl:text>
                  </_sfe:BeforeOrAfterText>
               </xsl:if>
            </xsl:when>
            <xsl:when test="not(@prc=number('1')) and (@prc=number('2'))"><!--AddBefore Condition #2--><xsl:if test="not(@_gte:Gentext-Expanded)">
                  <_gte:Must-Expand-Gentext/>
                  <_sfe:BeforeOrAfterText>
                     <xsl:text>TWO-WAY INTRCHG WITH P/N </xsl:text>
                  </_sfe:BeforeOrAfterText>
               </xsl:if>
            </xsl:when>
            <xsl:when test="@prc=number('1')"><!--AddBefore Condition #1--><xsl:if test="not(@_gte:Gentext-Expanded)">
                  <_gte:Must-Expand-Gentext/>
                  <_sfe:BeforeOrAfterText>
                     <xsl:text>ONE-WAY INTRCHG WITH P/N </xsl:text>
                  </_sfe:BeforeOrAfterText>
               </xsl:if>
            </xsl:when>
         </xsl:choose>
         <xsl:apply-templates select="* | text() | processing-instruction()" mode="expand-gentext"/>
         <xsl:choose>
            <xsl:when test="not(@prc=number('1')) and not(@prc=number('2')) and not(@prc=number('3')) and not(@prc=number('6')) and not(@prc=number('7')) and not(@prc and string(@prc)='N') and (@prc and string(@prc)='S')"><!--AddAfter Condition #7--></xsl:when>
            <xsl:when test="not(@prc=number('1')) and not(@prc=number('2')) and not(@prc=number('3')) and not(@prc=number('6')) and not(@prc=number('7')) and (@prc and string(@prc)='N')"><!--AddAfter Condition #6--></xsl:when>
            <xsl:when test="not(@prc=number('1')) and not(@prc=number('2')) and not(@prc=number('3')) and not(@prc=number('6')) and (@prc=number('7'))"><!--AddAfter Condition #5--><xsl:if test="not(@_gte:Gentext-Expanded)">
                  <_gte:Must-Expand-Gentext/>
                  <_sfe:BeforeOrAfterText>
                     <xsl:text>. REFER TO APPLICABLE SERVICE BULLETIN.</xsl:text>
                  </_sfe:BeforeOrAfterText>
               </xsl:if>
            </xsl:when>
            <xsl:when test="not(@prc=number('1')) and not(@prc=number('2')) and not(@prc=number('3')) and (@prc=number('6'))"><!--AddAfter Condition #4--></xsl:when>
            <xsl:when test="not(@prc=number('1')) and not(@prc=number('2')) and (@prc=number('3'))"><!--AddAfter Condition #3--></xsl:when>
            <xsl:when test="not(@prc=number('1')) and (@prc=number('2'))"><!--AddAfter Condition #2--></xsl:when>
            <xsl:when test="@prc=number('1')"><!--AddAfter Condition #1--></xsl:when>
         </xsl:choose>
      </xsl:copy>
   </xsl:template>

   <!--Initial pass template for Context: inter-->
<xsl:template match="inter" mode="initial-pass-mode" priority="0">
      <xsl:copy>
         <xsl:call-template name="maybe-set-gte-id"/>
         <xsl:apply-templates select="@*|node()" mode="initial-pass-mode"/>
      </xsl:copy>
   </xsl:template>

   <!--Set count-as pass template for Context: inter-->
<xsl:template match="inter" mode="set-countas" priority="0">
      <xsl:copy>
         <xsl:apply-templates select="@*|node()" mode="set-countas"/>
      </xsl:copy>
   </xsl:template>

   <!--Set ch:chunk template for Context: inter-->
<xsl:template match="inter" mode="set-ch-chunk" priority="0">
      <xsl:copy>
         <xsl:if test="not(@_gte:did-set-chunk)">
            <xsl:variable name="Breaks-chunkBoundary"/>
            <xsl:if test="$Breaks-chunkBoundary = 'yes'">
               <xsl:attribute name="ch:chunk">yes</xsl:attribute>
            </xsl:if>
            <xsl:attribute name="_gte:did-set-chunk">yes</xsl:attribute>
         </xsl:if>
         <xsl:apply-templates select="@*|node()" mode="set-ch-chunk"/>
      </xsl:copy>
   </xsl:template>

   <!--Style template for Context: ipc-fig-->
<xsl:template name="__style-for_ipc-fig.1">
      <xsl:text> .x-ipc-fig-1-0 {margin-left: 0pt; margin-right: 0pt; text-indent: 0pt; }</xsl:text>
   </xsl:template>

   <!--Template for Context: ipc-fig-->
<xsl:template match="ipc-fig" priority="0">
      <div><!--Emit class values to reflect conditions--><xsl:attribute name="class">
            <xsl:text> x-ipc-fig-1-0</xsl:text>
         </xsl:attribute>
         <xsl:if test="@xml:lang">
            <xsl:attribute name="lang">
               <xsl:call-template name="return-lang-applying-language-map">
                  <xsl:with-param name="doclang" select="@xml:lang"/>
               </xsl:call-template>
            </xsl:attribute>
         </xsl:if>
         <xsl:copy-of select="@ch:*"/>
         <xsl:if test="@xml:lang">
            <xsl:attribute name="lang">
               <xsl:call-template name="return-lang-applying-language-map">
                  <xsl:with-param name="doclang" select="@xml:lang"/>
               </xsl:call-template>
            </xsl:attribute>
         </xsl:if>
         <xsl:call-template name="maybe-set-id"/>
         <!--Process this element's content--><xsl:apply-templates/>
      </div>
   </xsl:template>

   <!--Gentext template for Context: ipc-fig-->
<xsl:template match="ipc-fig" mode="expand-gentext" priority="0">
      <xsl:copy>
         <xsl:attribute name="_gte:Gentext-Expanded">y</xsl:attribute>
         <xsl:apply-templates select="@*" mode="expand-gentext"/>
         <xsl:if test="not(@_gte:id)">
            <xsl:attribute name="_gte:id">
               <xsl:value-of select="'_g_'"/>
               <xsl:value-of select="generate-id(.)"/>
            </xsl:attribute>
         </xsl:if>
         <!--Unconditional AddBefore--><xsl:if test="not(@_gte:Gentext-Expanded)">
            <_gte:Must-Expand-Gentext/>
            <_sfe:BeforeOrAfterText>
               <_ufe:fig-title>
                  <xsl:text>Figure </xsl:text>
                  <xsl:if test="(ancestor-or-self::ipc-fig[1]//figno)[1]/*|(ancestor-or-self::ipc-fig[1]//figno)[1]/text()|(ancestor-or-self::ipc-fig[1]//figno)[1]/processing-instruction()">
                     <_gte:Gentexted-Content-Wrapper>
                        <xsl:apply-templates mode="expand-gentext"
                                             select="(ancestor-or-self::ipc-fig[1]//figno)[1]/*|(ancestor-or-self::ipc-fig[1]//figno)[1]/text()|(ancestor-or-self::ipc-fig[1]//figno)[1]/processing-instruction()">
                           <xsl:with-param name="skip-expanded-gentext" select="'yes'"/>
                        </xsl:apply-templates>
                     </_gte:Gentexted-Content-Wrapper>
                  </xsl:if>
                  <xsl:text> </xsl:text>
                  <xsl:if test="./figure/title/node()">
                     <_gte:Gentexted-Content-Wrapper>
                        <xsl:apply-templates mode="ElementContent_All" select="./figure/title"/>
                     </_gte:Gentexted-Content-Wrapper>
                  </xsl:if>
               </_ufe:fig-title>
            </_sfe:BeforeOrAfterText>
         </xsl:if>
         <xsl:apply-templates select="* | text() | processing-instruction()" mode="expand-gentext"/>
      </xsl:copy>
   </xsl:template>

   <!--Initial pass template for Context: ipc-fig-->
<xsl:template match="ipc-fig" mode="initial-pass-mode" priority="0">
      <xsl:copy>
         <xsl:call-template name="maybe-set-gte-id"/>
         <xsl:apply-templates select="@*|node()" mode="initial-pass-mode"/>
      </xsl:copy>
   </xsl:template>

   <!--Set count-as pass template for Context: ipc-fig-->
<xsl:template match="ipc-fig" mode="set-countas" priority="0">
      <xsl:copy>
         <xsl:apply-templates select="@*|node()" mode="set-countas"/>
      </xsl:copy>
   </xsl:template>

   <!--Set ch:chunk template for Context: ipc-fig-->
<xsl:template match="ipc-fig" mode="set-ch-chunk" priority="0">
      <xsl:copy>
         <xsl:if test="not(@_gte:did-set-chunk)">
            <xsl:attribute name="_gte:did-set-chunk">yes</xsl:attribute>
         </xsl:if>
         <xsl:apply-templates select="@*|node()" mode="set-ch-chunk"/>
      </xsl:copy>
   </xsl:template>

   <!--Style template for Context: ipc-fig-delete-->
<xsl:template name="__style-for_ipc-fig-delete.1">
      <xsl:text> .x-ipc-fig-delete-1-0 {margin-left: 0pt; margin-right: 0pt; }</xsl:text>
   </xsl:template>

   <!--Template for Context: ipc-fig-delete-->
<xsl:template match="ipc-fig-delete" priority="0"><!--Emit a nostyle template--><xsl:apply-templates/>
   </xsl:template>

   <!--Gentext template for Context: ipc-fig-delete-->
<xsl:template match="ipc-fig-delete" mode="expand-gentext" priority="0">
      <xsl:copy>
         <xsl:apply-templates select="@*|node()" mode="expand-gentext"/>
      </xsl:copy>
   </xsl:template>

   <!--Initial pass template for Context: ipc-fig-delete-->
<xsl:template match="ipc-fig-delete" mode="initial-pass-mode" priority="0">
      <xsl:copy>
         <xsl:call-template name="maybe-set-gte-id"/>
         <xsl:apply-templates select="@*|node()" mode="initial-pass-mode"/>
      </xsl:copy>
   </xsl:template>

   <!--Set count-as pass template for Context: ipc-fig-delete-->
<xsl:template match="ipc-fig-delete" mode="set-countas" priority="0">
      <xsl:copy>
         <xsl:apply-templates select="@*|node()" mode="set-countas"/>
      </xsl:copy>
   </xsl:template>

   <!--Set ch:chunk template for Context: ipc-fig-delete-->
<xsl:template match="ipc-fig-delete" mode="set-ch-chunk" priority="0">
      <xsl:copy>
         <xsl:if test="not(@_gte:did-set-chunk)">
            <xsl:attribute name="_gte:did-set-chunk">yes</xsl:attribute>
         </xsl:if>
         <xsl:apply-templates select="@*|node()" mode="set-ch-chunk"/>
      </xsl:copy>
   </xsl:template>

   <!--Style template for Context: ipc-fig-reloc-->
<xsl:template name="__style-for_ipc-fig-reloc.1">
      <xsl:text> .x-ipc-fig-reloc-1-0 {margin-left: 0pt; margin-right: 0pt; }</xsl:text>
   </xsl:template>

   <!--Template for Context: ipc-fig-reloc-->
<xsl:template match="ipc-fig-reloc" priority="0"><!--Emit a nostyle template--><xsl:apply-templates/>
   </xsl:template>

   <!--Gentext template for Context: ipc-fig-reloc-->
<xsl:template match="ipc-fig-reloc" mode="expand-gentext" priority="0">
      <xsl:copy>
         <xsl:apply-templates select="@*|node()" mode="expand-gentext"/>
      </xsl:copy>
   </xsl:template>

   <!--Initial pass template for Context: ipc-fig-reloc-->
<xsl:template match="ipc-fig-reloc" mode="initial-pass-mode" priority="0">
      <xsl:copy>
         <xsl:call-template name="maybe-set-gte-id"/>
         <xsl:apply-templates select="@*|node()" mode="initial-pass-mode"/>
      </xsl:copy>
   </xsl:template>

   <!--Set count-as pass template for Context: ipc-fig-reloc-->
<xsl:template match="ipc-fig-reloc" mode="set-countas" priority="0">
      <xsl:copy>
         <xsl:apply-templates select="@*|node()" mode="set-countas"/>
      </xsl:copy>
   </xsl:template>

   <!--Set ch:chunk template for Context: ipc-fig-reloc-->
<xsl:template match="ipc-fig-reloc" mode="set-ch-chunk" priority="0">
      <xsl:copy>
         <xsl:if test="not(@_gte:did-set-chunk)">
            <xsl:attribute name="_gte:did-set-chunk">yes</xsl:attribute>
         </xsl:if>
         <xsl:apply-templates select="@*|node()" mode="set-ch-chunk"/>
      </xsl:copy>
   </xsl:template>

   <!--Style template for Context: kits-->
<xsl:template name="__style-for_kits.1">
      <xsl:text> .x-kits-1-0 {margin-left: 0pt; margin-right: 0pt; text-indent: 0pt; }</xsl:text>
   </xsl:template>

   <!--Template for Context: kits-->
<xsl:template match="kits" priority="0">
      <div><!--Emit class values to reflect conditions--><xsl:attribute name="class">
            <xsl:text> x-kits-1-0</xsl:text>
         </xsl:attribute>
         <xsl:if test="@xml:lang">
            <xsl:attribute name="lang">
               <xsl:call-template name="return-lang-applying-language-map">
                  <xsl:with-param name="doclang" select="@xml:lang"/>
               </xsl:call-template>
            </xsl:attribute>
         </xsl:if>
         <xsl:copy-of select="@ch:*"/>
         <xsl:if test="@xml:lang">
            <xsl:attribute name="lang">
               <xsl:call-template name="return-lang-applying-language-map">
                  <xsl:with-param name="doclang" select="@xml:lang"/>
               </xsl:call-template>
            </xsl:attribute>
         </xsl:if>
         <xsl:call-template name="maybe-set-id"/>
         <!--Process this element's content--><xsl:apply-templates/>
      </div>
   </xsl:template>

   <!--Gentext template for Context: kits-->
<xsl:template match="kits" mode="expand-gentext" priority="0">
      <xsl:copy>
         <xsl:attribute name="_gte:Gentext-Expanded">y</xsl:attribute>
         <xsl:apply-templates select="@*" mode="expand-gentext"/>
         <xsl:if test="not(@_gte:id)">
            <xsl:attribute name="_gte:id">
               <xsl:value-of select="'_g_'"/>
               <xsl:value-of select="generate-id(.)"/>
            </xsl:attribute>
         </xsl:if>
         <!--Unconditional AddBefore--><xsl:if test="not(@_gte:Gentext-Expanded)">
            <_gte:Must-Expand-Gentext/>
            <_sfe:BeforeOrAfterText>
               <xsl:text>KITS, REPAIR/SERVICE PARTS</xsl:text>
            </_sfe:BeforeOrAfterText>
         </xsl:if>
         <xsl:apply-templates select="* | text() | processing-instruction()" mode="expand-gentext"/>
      </xsl:copy>
   </xsl:template>

   <!--Initial pass template for Context: kits-->
<xsl:template match="kits" mode="initial-pass-mode" priority="0">
      <xsl:copy>
         <xsl:call-template name="maybe-set-gte-id"/>
         <xsl:apply-templates select="@*|node()" mode="initial-pass-mode"/>
      </xsl:copy>
   </xsl:template>

   <!--Set count-as pass template for Context: kits-->
<xsl:template match="kits" mode="set-countas" priority="0">
      <xsl:copy>
         <xsl:apply-templates select="@*|node()" mode="set-countas"/>
      </xsl:copy>
   </xsl:template>

   <!--Set ch:chunk template for Context: kits-->
<xsl:template match="kits" mode="set-ch-chunk" priority="0">
      <xsl:copy>
         <xsl:if test="not(@_gte:did-set-chunk)">
            <xsl:attribute name="_gte:did-set-chunk">yes</xsl:attribute>
         </xsl:if>
         <xsl:apply-templates select="@*|node()" mode="set-ch-chunk"/>
      </xsl:copy>
   </xsl:template>

   <!--Style template for Context: atidlm:linkcontent-->
<xsl:template name="__style-for_atidlm-linkcontent.1">
      <xsl:text> .x-atidlm-linkcontent-1-0 {margin-left: 0pt; margin-right: 0pt; text-indent: 0pt; }</xsl:text>
   </xsl:template>

   <!--Template for Context: atidlm:linkcontent-->
<xsl:template match="atidlm:linkcontent" priority="0">
      <span><!--Emit class values to reflect conditions--><xsl:attribute name="class">
            <xsl:text> x-atidlm-linkcontent-1-0</xsl:text>
         </xsl:attribute>
         <xsl:if test="@xml:lang">
            <xsl:attribute name="lang">
               <xsl:call-template name="return-lang-applying-language-map">
                  <xsl:with-param name="doclang" select="@xml:lang"/>
               </xsl:call-template>
            </xsl:attribute>
         </xsl:if>
         <xsl:copy-of select="@ch:*"/>
         <xsl:if test="@xml:lang">
            <xsl:attribute name="lang">
               <xsl:call-template name="return-lang-applying-language-map">
                  <xsl:with-param name="doclang" select="@xml:lang"/>
               </xsl:call-template>
            </xsl:attribute>
         </xsl:if>
         <xsl:call-template name="maybe-set-id"/>
         <!--Process this element's content--><xsl:apply-templates/>
      </span>
   </xsl:template>

   <!--Gentext template for Context: atidlm:linkcontent-->
<xsl:template match="atidlm:linkcontent" mode="expand-gentext" priority="0">
      <xsl:copy>
         <xsl:apply-templates select="@*|node()" mode="expand-gentext"/>
      </xsl:copy>
   </xsl:template>

   <!--Initial pass template for Context: atidlm:linkcontent-->
<xsl:template match="atidlm:linkcontent" mode="initial-pass-mode" priority="0">
      <xsl:copy>
         <xsl:call-template name="maybe-set-gte-id"/>
         <xsl:apply-templates select="@*|node()" mode="initial-pass-mode"/>
      </xsl:copy>
   </xsl:template>

   <!--Set count-as pass template for Context: atidlm:linkcontent-->
<xsl:template match="atidlm:linkcontent" mode="set-countas" priority="0">
      <xsl:copy>
         <xsl:apply-templates select="@*|node()" mode="set-countas"/>
      </xsl:copy>
   </xsl:template>

   <!--Set ch:chunk template for Context: atidlm:linkcontent-->
<xsl:template match="atidlm:linkcontent" mode="set-ch-chunk" priority="0">
      <xsl:copy>
         <xsl:if test="not(@_gte:did-set-chunk)">
            <xsl:attribute name="_gte:did-set-chunk">yes</xsl:attribute>
         </xsl:if>
         <xsl:apply-templates select="@*|node()" mode="set-ch-chunk"/>
      </xsl:copy>
   </xsl:template>

   <!--Style template for Context: lpln-->
<xsl:template name="__style-for_lpln.1">
      <xsl:text> .x-lpln-1-0 {margin-left: 0pt; margin-right: 0pt; text-indent: 0pt; }</xsl:text>
   </xsl:template>

   <!--Template for Context: lpln-->
<xsl:template match="lpln" priority="0">
      <div><!--Emit class values to reflect conditions--><xsl:attribute name="class">
            <xsl:text> x-lpln-1-0</xsl:text>
         </xsl:attribute>
         <xsl:if test="@xml:lang">
            <xsl:attribute name="lang">
               <xsl:call-template name="return-lang-applying-language-map">
                  <xsl:with-param name="doclang" select="@xml:lang"/>
               </xsl:call-template>
            </xsl:attribute>
         </xsl:if>
         <xsl:copy-of select="@ch:*"/>
         <xsl:if test="@xml:lang">
            <xsl:attribute name="lang">
               <xsl:call-template name="return-lang-applying-language-map">
                  <xsl:with-param name="doclang" select="@xml:lang"/>
               </xsl:call-template>
            </xsl:attribute>
         </xsl:if>
         <xsl:call-template name="maybe-set-id"/>
         <!--Process this element's content--><xsl:apply-templates/>
      </div>
   </xsl:template>

   <!--Gentext template for Context: lpln-->
<xsl:template match="lpln" mode="expand-gentext" priority="0">
      <xsl:copy>
         <xsl:attribute name="_gte:Gentext-Expanded">y</xsl:attribute>
         <xsl:apply-templates select="@*" mode="expand-gentext"/>
         <xsl:if test="not(@_gte:id)">
            <xsl:attribute name="_gte:id">
               <xsl:value-of select="'_g_'"/>
               <xsl:value-of select="generate-id(.)"/>
            </xsl:attribute>
         </xsl:if>
         <!--Unconditional AddBefore--><xsl:if test="not(@_gte:Gentext-Expanded)">
            <_gte:Must-Expand-Gentext/>
            <_sfe:BeforeOrAfterText>
               <xsl:text>LATEST PARTS LIST NO: </xsl:text>
            </_sfe:BeforeOrAfterText>
         </xsl:if>
         <xsl:apply-templates select="* | text() | processing-instruction()" mode="expand-gentext"/>
      </xsl:copy>
   </xsl:template>

   <!--Initial pass template for Context: lpln-->
<xsl:template match="lpln" mode="initial-pass-mode" priority="0">
      <xsl:copy>
         <xsl:call-template name="maybe-set-gte-id"/>
         <xsl:apply-templates select="@*|node()" mode="initial-pass-mode"/>
      </xsl:copy>
   </xsl:template>

   <!--Set count-as pass template for Context: lpln-->
<xsl:template match="lpln" mode="set-countas" priority="0">
      <xsl:copy>
         <xsl:apply-templates select="@*|node()" mode="set-countas"/>
      </xsl:copy>
   </xsl:template>

   <!--Set ch:chunk template for Context: lpln-->
<xsl:template match="lpln" mode="set-ch-chunk" priority="0">
      <xsl:copy>
         <xsl:if test="not(@_gte:did-set-chunk)">
            <xsl:attribute name="_gte:did-set-chunk">yes</xsl:attribute>
         </xsl:if>
         <xsl:apply-templates select="@*|node()" mode="set-ch-chunk"/>
      </xsl:copy>
   </xsl:template>

   <!--Style template for Context: met-->
<xsl:template name="__style-for_met.1">
      <xsl:text> .x-met-1-0 {margin-left: 0pt; margin-right: 0pt; }</xsl:text>
   </xsl:template>

   <!--Template for Context: met-->
<xsl:template match="met" priority="0">
      <span><!--Emit class values to reflect conditions--><xsl:attribute name="class">
            <xsl:text> x-met-1-0</xsl:text>
         </xsl:attribute>
         <xsl:if test="@xml:lang">
            <xsl:attribute name="lang">
               <xsl:call-template name="return-lang-applying-language-map">
                  <xsl:with-param name="doclang" select="@xml:lang"/>
               </xsl:call-template>
            </xsl:attribute>
         </xsl:if>
         <xsl:copy-of select="@ch:*"/>
         <xsl:if test="@xml:lang">
            <xsl:attribute name="lang">
               <xsl:call-template name="return-lang-applying-language-map">
                  <xsl:with-param name="doclang" select="@xml:lang"/>
               </xsl:call-template>
            </xsl:attribute>
         </xsl:if>
         <xsl:call-template name="maybe-set-id"/>
         <!--Process this element's content--><xsl:apply-templates/>
      </span>
   </xsl:template>

   <!--Gentext template for Context: met-->
<xsl:template match="met" mode="expand-gentext" priority="0">
      <xsl:copy>
         <xsl:apply-templates select="@*|node()" mode="expand-gentext"/>
      </xsl:copy>
   </xsl:template>

   <!--Initial pass template for Context: met-->
<xsl:template match="met" mode="initial-pass-mode" priority="0">
      <xsl:copy>
         <xsl:call-template name="maybe-set-gte-id"/>
         <xsl:apply-templates select="@*|node()" mode="initial-pass-mode"/>
      </xsl:copy>
   </xsl:template>

   <!--Set count-as pass template for Context: met-->
<xsl:template match="met" mode="set-countas" priority="0">
      <xsl:copy>
         <xsl:apply-templates select="@*|node()" mode="set-countas"/>
      </xsl:copy>
   </xsl:template>

   <!--Set ch:chunk template for Context: met-->
<xsl:template match="met" mode="set-ch-chunk" priority="0">
      <xsl:copy>
         <xsl:if test="not(@_gte:did-set-chunk)">
            <xsl:attribute name="_gte:did-set-chunk">yes</xsl:attribute>
         </xsl:if>
         <xsl:apply-templates select="@*|node()" mode="set-ch-chunk"/>
      </xsl:copy>
   </xsl:template>

   <!--Style template for Context: atidlm:metadata-->
<xsl:template name="__style-for_atidlm-metadata.1">
      <xsl:text> .x-atidlm-metadata-1-0 {margin-left: 0pt; margin-right: 0pt; text-indent: 0pt; }</xsl:text>
   </xsl:template>

   <!--Template for Context: atidlm:metadata-->
<xsl:template match="atidlm:metadata" priority="0">
      <span><!--Emit class values to reflect conditions--><xsl:attribute name="class">
            <xsl:text> x-atidlm-metadata-1-0</xsl:text>
         </xsl:attribute>
         <xsl:if test="@xml:lang">
            <xsl:attribute name="lang">
               <xsl:call-template name="return-lang-applying-language-map">
                  <xsl:with-param name="doclang" select="@xml:lang"/>
               </xsl:call-template>
            </xsl:attribute>
         </xsl:if>
         <xsl:copy-of select="@ch:*"/>
         <xsl:if test="@xml:lang">
            <xsl:attribute name="lang">
               <xsl:call-template name="return-lang-applying-language-map">
                  <xsl:with-param name="doclang" select="@xml:lang"/>
               </xsl:call-template>
            </xsl:attribute>
         </xsl:if>
         <xsl:call-template name="maybe-set-id"/>
         <!--Process this element's content--><xsl:apply-templates/>
      </span>
   </xsl:template>

   <!--Gentext template for Context: atidlm:metadata-->
<xsl:template match="atidlm:metadata" mode="expand-gentext" priority="0">
      <xsl:copy>
         <xsl:apply-templates select="@*|node()" mode="expand-gentext"/>
      </xsl:copy>
   </xsl:template>

   <!--Initial pass template for Context: atidlm:metadata-->
<xsl:template match="atidlm:metadata" mode="initial-pass-mode" priority="0">
      <xsl:copy>
         <xsl:call-template name="maybe-set-gte-id"/>
         <xsl:apply-templates select="@*|node()" mode="initial-pass-mode"/>
      </xsl:copy>
   </xsl:template>

   <!--Set count-as pass template for Context: atidlm:metadata-->
<xsl:template match="atidlm:metadata" mode="set-countas" priority="0">
      <xsl:copy>
         <xsl:apply-templates select="@*|node()" mode="set-countas"/>
      </xsl:copy>
   </xsl:template>

   <!--Set ch:chunk template for Context: atidlm:metadata-->
<xsl:template match="atidlm:metadata" mode="set-ch-chunk" priority="0">
      <xsl:copy>
         <xsl:if test="not(@_gte:did-set-chunk)">
            <xsl:attribute name="_gte:did-set-chunk">yes</xsl:attribute>
         </xsl:if>
         <xsl:apply-templates select="@*|node()" mode="set-ch-chunk"/>
      </xsl:copy>
   </xsl:template>

   <!--Style template for Context: misc-->
<xsl:template name="__style-for_misc.1">
      <xsl:text> .x-misc-1-0 {margin-left: 0pt; margin-right: 0pt; text-indent: 0pt; }</xsl:text>
   </xsl:template>

   <!--Template for Context: misc-->
<xsl:template match="misc" priority="0">
      <div><!--Emit class values to reflect conditions--><xsl:attribute name="class">
            <xsl:text> x-misc-1-0</xsl:text>
         </xsl:attribute>
         <xsl:if test="@xml:lang">
            <xsl:attribute name="lang">
               <xsl:call-template name="return-lang-applying-language-map">
                  <xsl:with-param name="doclang" select="@xml:lang"/>
               </xsl:call-template>
            </xsl:attribute>
         </xsl:if>
         <xsl:copy-of select="@ch:*"/>
         <xsl:if test="@xml:lang">
            <xsl:attribute name="lang">
               <xsl:call-template name="return-lang-applying-language-map">
                  <xsl:with-param name="doclang" select="@xml:lang"/>
               </xsl:call-template>
            </xsl:attribute>
         </xsl:if>
         <xsl:call-template name="maybe-set-id"/>
         <!--Process this element's content--><xsl:apply-templates/>
      </div>
   </xsl:template>

   <!--Gentext template for Context: misc-->
<xsl:template match="misc" mode="expand-gentext" priority="0">
      <xsl:copy>
         <xsl:apply-templates select="@*|node()" mode="expand-gentext"/>
      </xsl:copy>
   </xsl:template>

   <!--Initial pass template for Context: misc-->
<xsl:template match="misc" mode="initial-pass-mode" priority="0">
      <xsl:copy>
         <xsl:call-template name="maybe-set-gte-id"/>
         <xsl:apply-templates select="@*|node()" mode="initial-pass-mode"/>
      </xsl:copy>
   </xsl:template>

   <!--Set count-as pass template for Context: misc-->
<xsl:template match="misc" mode="set-countas" priority="0">
      <xsl:copy>
         <xsl:apply-templates select="@*|node()" mode="set-countas"/>
      </xsl:copy>
   </xsl:template>

   <!--Set ch:chunk template for Context: misc-->
<xsl:template match="misc" mode="set-ch-chunk" priority="0">
      <xsl:copy>
         <xsl:if test="not(@_gte:did-set-chunk)">
            <xsl:attribute name="_gte:did-set-chunk">yes</xsl:attribute>
         </xsl:if>
         <xsl:apply-templates select="@*|node()" mode="set-ch-chunk"/>
      </xsl:copy>
   </xsl:template>

   <!--Style template for Context: name-->
<xsl:template name="__style-for_name.1">
      <xsl:text> .x-name-1-0 {margin-left: 0pt; margin-right: 0pt; } .x-name-1-1 {} .x-name-1-2 {} .x-name-1-3 {} .x-name-1-4 {} .x-name-1-5 {} .x-name-1-6 {} .x-name-1-7 {} .x-name-1-8 {} .x-name-1-9 {} .x-name-1-10 {} .x-name-1-11 {} .x-name-1-12 {}</xsl:text>
   </xsl:template>

   <!--Template for Context: name-->
<xsl:template match="name" priority="0">
      <xsl:variable name="foClass">inline</xsl:variable>
      <xsl:variable name="blockness">inline</xsl:variable>
      <span><!--Emit class values to reflect conditions--><xsl:attribute name="class">
            <xsl:text> x-name-1-0</xsl:text>
            <xsl:if test="ancestor::entry[preceding-sibling::entry[part-nbr[@indent = '1']]]"> x-name-1-1</xsl:if>
            <xsl:if test="(ancestor::entry[preceding-sibling::entry[part-nbr[@indent = '1']]]) and (not(ancestor::*[not(self::_sfe:BeforeOrAfterText)][1]/text()[normalize-space(.)!='']|ancestor::*[not(self::_sfe:BeforeOrAfterText)][1]/*[not(self::_sfe:BeforeOrAfterText)]//text()[normalize-space(.)!=''][not(parent::_sfe:BeforeOrAfterText)]))"> x-name-1-2</xsl:if>
            <xsl:if test="not(ancestor::entry[preceding-sibling::entry[part-nbr[@indent = '1']]]) and (ancestor::entry[preceding-sibling::entry[part-nbr[@indent = '2']]])"> x-name-1-3</xsl:if>
            <xsl:if test="not(ancestor::entry[preceding-sibling::entry[part-nbr[@indent = '1']]]) and (ancestor::entry[preceding-sibling::entry[part-nbr[@indent = '2']]]) and (not(ancestor::*[not(self::_sfe:BeforeOrAfterText)][1]/text()[normalize-space(.)!='']|ancestor::*[not(self::_sfe:BeforeOrAfterText)][1]/*[not(self::_sfe:BeforeOrAfterText)]//text()[normalize-space(.)!=''][not(parent::_sfe:BeforeOrAfterText)]))"> x-name-1-4</xsl:if>
            <xsl:if test="not(ancestor::entry[preceding-sibling::entry[part-nbr[@indent = '1']]]) and not(ancestor::entry[preceding-sibling::entry[part-nbr[@indent = '2']]]) and (ancestor::entry[preceding-sibling::entry[part-nbr[@indent = '3']]])"> x-name-1-5</xsl:if>
            <xsl:if test="not(ancestor::entry[preceding-sibling::entry[part-nbr[@indent = '1']]]) and not(ancestor::entry[preceding-sibling::entry[part-nbr[@indent = '2']]]) and (ancestor::entry[preceding-sibling::entry[part-nbr[@indent = '3']]]) and (not(ancestor::*[not(self::_sfe:BeforeOrAfterText)][1]/text()[normalize-space(.)!='']|ancestor::*[not(self::_sfe:BeforeOrAfterText)][1]/*[not(self::_sfe:BeforeOrAfterText)]//text()[normalize-space(.)!=''][not(parent::_sfe:BeforeOrAfterText)]))"> x-name-1-6</xsl:if>
            <xsl:if test="not(ancestor::entry[preceding-sibling::entry[part-nbr[@indent = '1']]]) and not(ancestor::entry[preceding-sibling::entry[part-nbr[@indent = '2']]]) and not(ancestor::entry[preceding-sibling::entry[part-nbr[@indent = '3']]]) and (ancestor::entry[preceding-sibling::entry[part-nbr[@indent = '4']]])"> x-name-1-7</xsl:if>
            <xsl:if test="not(ancestor::entry[preceding-sibling::entry[part-nbr[@indent = '1']]]) and not(ancestor::entry[preceding-sibling::entry[part-nbr[@indent = '2']]]) and not(ancestor::entry[preceding-sibling::entry[part-nbr[@indent = '3']]]) and (ancestor::entry[preceding-sibling::entry[part-nbr[@indent = '4']]]) and (not(ancestor::*[not(self::_sfe:BeforeOrAfterText)][1]/text()[normalize-space(.)!='']|ancestor::*[not(self::_sfe:BeforeOrAfterText)][1]/*[not(self::_sfe:BeforeOrAfterText)]//text()[normalize-space(.)!=''][not(parent::_sfe:BeforeOrAfterText)]))"> x-name-1-8</xsl:if>
            <xsl:if test="ancestor::entry[preceding-sibling::entry[part-nbr[@ic-opt = 'NUT-TABLE']]] and ancestor::entry[preceding-sibling::entry[part-nbr[@indent = '1']]]"> x-name-1-9</xsl:if>
            <xsl:if test="not(ancestor::entry[preceding-sibling::entry[part-nbr[@ic-opt = 'NUT-TABLE']]] and ancestor::entry[preceding-sibling::entry[part-nbr[@indent = '1']]]) and (ancestor::entry[preceding-sibling::entry[part-nbr[@ic-opt = 'NUT-TABLE']]] and ancestor::entry[preceding-sibling::entry[part-nbr[@indent = '2']]])"> x-name-1-10</xsl:if>
            <xsl:if test="not(ancestor::entry[preceding-sibling::entry[part-nbr[@ic-opt = 'NUT-TABLE']]] and ancestor::entry[preceding-sibling::entry[part-nbr[@indent = '1']]]) and not(ancestor::entry[preceding-sibling::entry[part-nbr[@ic-opt = 'NUT-TABLE']]] and ancestor::entry[preceding-sibling::entry[part-nbr[@indent = '2']]]) and (ancestor::entry[preceding-sibling::entry[part-nbr[@ic-opt = 'NUT-TABLE']]] and ancestor::entry[preceding-sibling::entry[part-nbr[@indent = '3']]])"> x-name-1-11</xsl:if>
            <xsl:if test="not(ancestor::entry[preceding-sibling::entry[part-nbr[@ic-opt = 'NUT-TABLE']]] and ancestor::entry[preceding-sibling::entry[part-nbr[@indent = '1']]]) and not(ancestor::entry[preceding-sibling::entry[part-nbr[@ic-opt = 'NUT-TABLE']]] and ancestor::entry[preceding-sibling::entry[part-nbr[@indent = '2']]]) and not(ancestor::entry[preceding-sibling::entry[part-nbr[@ic-opt = 'NUT-TABLE']]] and ancestor::entry[preceding-sibling::entry[part-nbr[@indent = '3']]]) and (ancestor::entry[preceding-sibling::entry[part-nbr[@ic-opt = 'NUT-TABLE']]] and ancestor::entry[preceding-sibling::entry[part-nbr[@indent = '4']]])"> x-name-1-12</xsl:if>
         </xsl:attribute>
         <xsl:if test="@xml:lang">
            <xsl:attribute name="lang">
               <xsl:call-template name="return-lang-applying-language-map">
                  <xsl:with-param name="doclang" select="@xml:lang"/>
               </xsl:call-template>
            </xsl:attribute>
         </xsl:if>
         <xsl:copy-of select="@ch:*"/>
         <xsl:variable name="Breaks-chunkFilenameXPath"/>
         <xsl:variable name="Breaks-persistentFilename"/>
         <xsl:if test="($Breaks-persistentFilename='yes') and ($Breaks-chunkFilenameXPath!='')">
            <xsl:variable name="chunkFilename"/>
            <xsl:if test="$chunkFilename!=''">
               <xsl:attribute name="ch:filename">
                  <xsl:value-of select="$chunkFilename"/>
               </xsl:attribute>
               <xsl:attribute name="ch:namepriority">0</xsl:attribute>
            </xsl:if>
         </xsl:if>
         <xsl:if test="@xml:lang">
            <xsl:attribute name="lang">
               <xsl:call-template name="return-lang-applying-language-map">
                  <xsl:with-param name="doclang" select="@xml:lang"/>
               </xsl:call-template>
            </xsl:attribute>
         </xsl:if>
         <xsl:call-template name="maybe-set-id"/>
         <!--Process this element's content--><xsl:apply-templates/>
      </span>
   </xsl:template>

   <!--Gentext template for Context: name-->
<xsl:template match="name" mode="expand-gentext" priority="0">
      <xsl:copy>
         <xsl:attribute name="_gte:Gentext-Expanded">y</xsl:attribute>
         <xsl:apply-templates select="@*" mode="expand-gentext"/>
         <xsl:if test="not(@_gte:id)">
            <xsl:attribute name="_gte:id">
               <xsl:value-of select="'_g_'"/>
               <xsl:value-of select="generate-id(.)"/>
            </xsl:attribute>
         </xsl:if>
         <xsl:choose>
            <xsl:when test="not(ancestor::entry[preceding-sibling::entry[part-nbr[@ic-opt = 'NUT-TABLE']]] and ancestor::entry[preceding-sibling::entry[part-nbr[@indent = '1']]]) and not(ancestor::entry[preceding-sibling::entry[part-nbr[@ic-opt = 'NUT-TABLE']]] and ancestor::entry[preceding-sibling::entry[part-nbr[@indent = '2']]]) and not(ancestor::entry[preceding-sibling::entry[part-nbr[@ic-opt = 'NUT-TABLE']]] and ancestor::entry[preceding-sibling::entry[part-nbr[@indent = '3']]]) and (ancestor::entry[preceding-sibling::entry[part-nbr[@ic-opt = 'NUT-TABLE']]] and ancestor::entry[preceding-sibling::entry[part-nbr[@indent = '4']]])"><!--AddBefore Condition #12--><xsl:if test="not(@_gte:Gentext-Expanded)">
                  <_gte:Must-Expand-Gentext/>
                  <_sfe:BeforeOrAfterText>
                     <xsl:text>▪▪▪▪ </xsl:text>
                  </_sfe:BeforeOrAfterText>
               </xsl:if>
            </xsl:when>
            <xsl:when test="not(ancestor::entry[preceding-sibling::entry[part-nbr[@ic-opt = 'NUT-TABLE']]] and ancestor::entry[preceding-sibling::entry[part-nbr[@indent = '1']]]) and not(ancestor::entry[preceding-sibling::entry[part-nbr[@ic-opt = 'NUT-TABLE']]] and ancestor::entry[preceding-sibling::entry[part-nbr[@indent = '2']]]) and (ancestor::entry[preceding-sibling::entry[part-nbr[@ic-opt = 'NUT-TABLE']]] and ancestor::entry[preceding-sibling::entry[part-nbr[@indent = '3']]])"><!--AddBefore Condition #11--><xsl:if test="not(@_gte:Gentext-Expanded)">
                  <_gte:Must-Expand-Gentext/>
                  <_sfe:BeforeOrAfterText>
                     <xsl:text>▪▪▪ </xsl:text>
                  </_sfe:BeforeOrAfterText>
               </xsl:if>
            </xsl:when>
            <xsl:when test="not(ancestor::entry[preceding-sibling::entry[part-nbr[@ic-opt = 'NUT-TABLE']]] and ancestor::entry[preceding-sibling::entry[part-nbr[@indent = '1']]]) and (ancestor::entry[preceding-sibling::entry[part-nbr[@ic-opt = 'NUT-TABLE']]] and ancestor::entry[preceding-sibling::entry[part-nbr[@indent = '2']]])"><!--AddBefore Condition #10--><xsl:if test="not(@_gte:Gentext-Expanded)">
                  <_gte:Must-Expand-Gentext/>
                  <_sfe:BeforeOrAfterText>
                     <xsl:text>▪▪ </xsl:text>
                  </_sfe:BeforeOrAfterText>
               </xsl:if>
            </xsl:when>
            <xsl:when test="ancestor::entry[preceding-sibling::entry[part-nbr[@ic-opt = 'NUT-TABLE']]] and ancestor::entry[preceding-sibling::entry[part-nbr[@indent = '1']]]"><!--AddBefore Condition #9--><xsl:if test="not(@_gte:Gentext-Expanded)">
                  <_gte:Must-Expand-Gentext/>
                  <_sfe:BeforeOrAfterText>
                     <xsl:text>▪ </xsl:text>
                  </_sfe:BeforeOrAfterText>
               </xsl:if>
            </xsl:when>
            <xsl:when test="not(ancestor::entry[preceding-sibling::entry[part-nbr[@indent = '1']]]) and not(ancestor::entry[preceding-sibling::entry[part-nbr[@indent = '2']]]) and not(ancestor::entry[preceding-sibling::entry[part-nbr[@indent = '3']]]) and (ancestor::entry[preceding-sibling::entry[part-nbr[@indent = '4']]]) and (not(ancestor::*[not(self::_sfe:BeforeOrAfterText)][1]/text()[normalize-space(.)!='']|ancestor::*[not(self::_sfe:BeforeOrAfterText)][1]/*[not(self::_sfe:BeforeOrAfterText)]//text()[normalize-space(.)!=''][not(parent::_sfe:BeforeOrAfterText)]))"><!--AddBefore Condition #8--><xsl:if test="not(@_gte:Gentext-Expanded)">
                  <_gte:Must-Expand-Gentext/>
                  <_sfe:BeforeOrAfterText/>
               </xsl:if>
            </xsl:when>
            <xsl:when test="not(ancestor::entry[preceding-sibling::entry[part-nbr[@indent = '1']]]) and not(ancestor::entry[preceding-sibling::entry[part-nbr[@indent = '2']]]) and not(ancestor::entry[preceding-sibling::entry[part-nbr[@indent = '3']]]) and (ancestor::entry[preceding-sibling::entry[part-nbr[@indent = '4']]])"><!--AddBefore Condition #7--><xsl:if test="not(@_gte:Gentext-Expanded)">
                  <_gte:Must-Expand-Gentext/>
                  <_sfe:BeforeOrAfterText>
                     <xsl:text>▪▪▪▪ </xsl:text>
                  </_sfe:BeforeOrAfterText>
               </xsl:if>
            </xsl:when>
            <xsl:when test="not(ancestor::entry[preceding-sibling::entry[part-nbr[@indent = '1']]]) and not(ancestor::entry[preceding-sibling::entry[part-nbr[@indent = '2']]]) and (ancestor::entry[preceding-sibling::entry[part-nbr[@indent = '3']]]) and (not(ancestor::*[not(self::_sfe:BeforeOrAfterText)][1]/text()[normalize-space(.)!='']|ancestor::*[not(self::_sfe:BeforeOrAfterText)][1]/*[not(self::_sfe:BeforeOrAfterText)]//text()[normalize-space(.)!=''][not(parent::_sfe:BeforeOrAfterText)]))"><!--AddBefore Condition #6--><xsl:if test="not(@_gte:Gentext-Expanded)">
                  <_gte:Must-Expand-Gentext/>
                  <_sfe:BeforeOrAfterText/>
               </xsl:if>
            </xsl:when>
            <xsl:when test="not(ancestor::entry[preceding-sibling::entry[part-nbr[@indent = '1']]]) and not(ancestor::entry[preceding-sibling::entry[part-nbr[@indent = '2']]]) and (ancestor::entry[preceding-sibling::entry[part-nbr[@indent = '3']]])"><!--AddBefore Condition #5--><xsl:if test="not(@_gte:Gentext-Expanded)">
                  <_gte:Must-Expand-Gentext/>
                  <_sfe:BeforeOrAfterText>
                     <xsl:text>▪▪▪ </xsl:text>
                  </_sfe:BeforeOrAfterText>
               </xsl:if>
            </xsl:when>
            <xsl:when test="not(ancestor::entry[preceding-sibling::entry[part-nbr[@indent = '1']]]) and (ancestor::entry[preceding-sibling::entry[part-nbr[@indent = '2']]]) and (not(ancestor::*[not(self::_sfe:BeforeOrAfterText)][1]/text()[normalize-space(.)!='']|ancestor::*[not(self::_sfe:BeforeOrAfterText)][1]/*[not(self::_sfe:BeforeOrAfterText)]//text()[normalize-space(.)!=''][not(parent::_sfe:BeforeOrAfterText)]))"><!--AddBefore Condition #4--><xsl:if test="not(@_gte:Gentext-Expanded)">
                  <_gte:Must-Expand-Gentext/>
                  <_sfe:BeforeOrAfterText/>
               </xsl:if>
            </xsl:when>
            <xsl:when test="not(ancestor::entry[preceding-sibling::entry[part-nbr[@indent = '1']]]) and (ancestor::entry[preceding-sibling::entry[part-nbr[@indent = '2']]])"><!--AddBefore Condition #3--><xsl:if test="not(@_gte:Gentext-Expanded)">
                  <_gte:Must-Expand-Gentext/>
                  <_sfe:BeforeOrAfterText>
                     <xsl:text>▪▪ </xsl:text>
                  </_sfe:BeforeOrAfterText>
               </xsl:if>
            </xsl:when>
            <xsl:when test="(ancestor::entry[preceding-sibling::entry[part-nbr[@indent = '1']]]) and (not(ancestor::*[not(self::_sfe:BeforeOrAfterText)][1]/text()[normalize-space(.)!='']|ancestor::*[not(self::_sfe:BeforeOrAfterText)][1]/*[not(self::_sfe:BeforeOrAfterText)]//text()[normalize-space(.)!=''][not(parent::_sfe:BeforeOrAfterText)]))"><!--AddBefore Condition #2--><xsl:if test="not(@_gte:Gentext-Expanded)">
                  <_gte:Must-Expand-Gentext/>
                  <_sfe:BeforeOrAfterText/>
               </xsl:if>
            </xsl:when>
            <xsl:when test="ancestor::entry[preceding-sibling::entry[part-nbr[@indent = '1']]]"><!--AddBefore Condition #1--><xsl:if test="not(@_gte:Gentext-Expanded)">
                  <_gte:Must-Expand-Gentext/>
                  <_sfe:BeforeOrAfterText>
                     <xsl:text>▪ </xsl:text>
                  </_sfe:BeforeOrAfterText>
               </xsl:if>
            </xsl:when>
         </xsl:choose>
         <xsl:apply-templates select="* | text() | processing-instruction()" mode="expand-gentext"/>
         <xsl:choose>
            <xsl:when test="not(ancestor::entry[preceding-sibling::entry[part-nbr[@ic-opt = 'NUT-TABLE']]] and ancestor::entry[preceding-sibling::entry[part-nbr[@indent = '1']]]) and not(ancestor::entry[preceding-sibling::entry[part-nbr[@ic-opt = 'NUT-TABLE']]] and ancestor::entry[preceding-sibling::entry[part-nbr[@indent = '2']]]) and not(ancestor::entry[preceding-sibling::entry[part-nbr[@ic-opt = 'NUT-TABLE']]] and ancestor::entry[preceding-sibling::entry[part-nbr[@indent = '3']]]) and (ancestor::entry[preceding-sibling::entry[part-nbr[@ic-opt = 'NUT-TABLE']]] and ancestor::entry[preceding-sibling::entry[part-nbr[@indent = '4']]])"><!--AddAfter Condition #12--><xsl:if test="not(@_gte:Gentext-Expanded)">
                  <_gte:Must-Expand-Gentext/>
                  <_sfe:BeforeOrAfterText>
                     <_ufe:block-nospace>
                        <xsl:text>SEE TABLE FOR OPTIONAL PART NUMBERS</xsl:text>
                     </_ufe:block-nospace>
                  </_sfe:BeforeOrAfterText>
               </xsl:if>
            </xsl:when>
            <xsl:when test="not(ancestor::entry[preceding-sibling::entry[part-nbr[@ic-opt = 'NUT-TABLE']]] and ancestor::entry[preceding-sibling::entry[part-nbr[@indent = '1']]]) and not(ancestor::entry[preceding-sibling::entry[part-nbr[@ic-opt = 'NUT-TABLE']]] and ancestor::entry[preceding-sibling::entry[part-nbr[@indent = '2']]]) and (ancestor::entry[preceding-sibling::entry[part-nbr[@ic-opt = 'NUT-TABLE']]] and ancestor::entry[preceding-sibling::entry[part-nbr[@indent = '3']]])"><!--AddAfter Condition #11--><xsl:if test="not(@_gte:Gentext-Expanded)">
                  <_gte:Must-Expand-Gentext/>
                  <_sfe:BeforeOrAfterText>
                     <_ufe:block-nospace>
                        <xsl:text>SEE TABLE FOR OPTIONAL PART NUMBERS</xsl:text>
                     </_ufe:block-nospace>
                  </_sfe:BeforeOrAfterText>
               </xsl:if>
            </xsl:when>
            <xsl:when test="not(ancestor::entry[preceding-sibling::entry[part-nbr[@ic-opt = 'NUT-TABLE']]] and ancestor::entry[preceding-sibling::entry[part-nbr[@indent = '1']]]) and (ancestor::entry[preceding-sibling::entry[part-nbr[@ic-opt = 'NUT-TABLE']]] and ancestor::entry[preceding-sibling::entry[part-nbr[@indent = '2']]])"><!--AddAfter Condition #10--><xsl:if test="not(@_gte:Gentext-Expanded)">
                  <_gte:Must-Expand-Gentext/>
                  <_sfe:BeforeOrAfterText>
                     <_ufe:block-nospace>
                        <xsl:text>SEE TABLE FOR OPTIONAL PART NUMBERS</xsl:text>
                     </_ufe:block-nospace>
                  </_sfe:BeforeOrAfterText>
               </xsl:if>
            </xsl:when>
            <xsl:when test="ancestor::entry[preceding-sibling::entry[part-nbr[@ic-opt = 'NUT-TABLE']]] and ancestor::entry[preceding-sibling::entry[part-nbr[@indent = '1']]]"><!--AddAfter Condition #9--><xsl:if test="not(@_gte:Gentext-Expanded)">
                  <_gte:Must-Expand-Gentext/>
                  <_sfe:BeforeOrAfterText>
                     <_ufe:block-nospace>
                        <xsl:text>SEE TABLE FOR OPTIONAL PART NUMBERS</xsl:text>
                     </_ufe:block-nospace>
                  </_sfe:BeforeOrAfterText>
               </xsl:if>
            </xsl:when>
            <xsl:when test="not(ancestor::entry[preceding-sibling::entry[part-nbr[@indent = '1']]]) and not(ancestor::entry[preceding-sibling::entry[part-nbr[@indent = '2']]]) and not(ancestor::entry[preceding-sibling::entry[part-nbr[@indent = '3']]]) and (ancestor::entry[preceding-sibling::entry[part-nbr[@indent = '4']]]) and (not(ancestor::*[not(self::_sfe:BeforeOrAfterText)][1]/text()[normalize-space(.)!='']|ancestor::*[not(self::_sfe:BeforeOrAfterText)][1]/*[not(self::_sfe:BeforeOrAfterText)]//text()[normalize-space(.)!=''][not(parent::_sfe:BeforeOrAfterText)]))"><!--AddAfter Condition #8--><xsl:if test="not(@_gte:Gentext-Expanded)">
                  <_gte:Must-Expand-Gentext/>
                  <_sfe:BeforeOrAfterText/>
               </xsl:if>
            </xsl:when>
            <xsl:when test="not(ancestor::entry[preceding-sibling::entry[part-nbr[@indent = '1']]]) and not(ancestor::entry[preceding-sibling::entry[part-nbr[@indent = '2']]]) and not(ancestor::entry[preceding-sibling::entry[part-nbr[@indent = '3']]]) and (ancestor::entry[preceding-sibling::entry[part-nbr[@indent = '4']]])"><!--AddAfter Condition #7--></xsl:when>
            <xsl:when test="not(ancestor::entry[preceding-sibling::entry[part-nbr[@indent = '1']]]) and not(ancestor::entry[preceding-sibling::entry[part-nbr[@indent = '2']]]) and (ancestor::entry[preceding-sibling::entry[part-nbr[@indent = '3']]]) and (not(ancestor::*[not(self::_sfe:BeforeOrAfterText)][1]/text()[normalize-space(.)!='']|ancestor::*[not(self::_sfe:BeforeOrAfterText)][1]/*[not(self::_sfe:BeforeOrAfterText)]//text()[normalize-space(.)!=''][not(parent::_sfe:BeforeOrAfterText)]))"><!--AddAfter Condition #6--><xsl:if test="not(@_gte:Gentext-Expanded)">
                  <_gte:Must-Expand-Gentext/>
                  <_sfe:BeforeOrAfterText/>
               </xsl:if>
            </xsl:when>
            <xsl:when test="not(ancestor::entry[preceding-sibling::entry[part-nbr[@indent = '1']]]) and not(ancestor::entry[preceding-sibling::entry[part-nbr[@indent = '2']]]) and (ancestor::entry[preceding-sibling::entry[part-nbr[@indent = '3']]])"><!--AddAfter Condition #5--></xsl:when>
            <xsl:when test="not(ancestor::entry[preceding-sibling::entry[part-nbr[@indent = '1']]]) and (ancestor::entry[preceding-sibling::entry[part-nbr[@indent = '2']]]) and (not(ancestor::*[not(self::_sfe:BeforeOrAfterText)][1]/text()[normalize-space(.)!='']|ancestor::*[not(self::_sfe:BeforeOrAfterText)][1]/*[not(self::_sfe:BeforeOrAfterText)]//text()[normalize-space(.)!=''][not(parent::_sfe:BeforeOrAfterText)]))"><!--AddAfter Condition #4--><xsl:if test="not(@_gte:Gentext-Expanded)">
                  <_gte:Must-Expand-Gentext/>
                  <_sfe:BeforeOrAfterText/>
               </xsl:if>
            </xsl:when>
            <xsl:when test="not(ancestor::entry[preceding-sibling::entry[part-nbr[@indent = '1']]]) and (ancestor::entry[preceding-sibling::entry[part-nbr[@indent = '2']]])"><!--AddAfter Condition #3--></xsl:when>
            <xsl:when test="(ancestor::entry[preceding-sibling::entry[part-nbr[@indent = '1']]]) and (not(ancestor::*[not(self::_sfe:BeforeOrAfterText)][1]/text()[normalize-space(.)!='']|ancestor::*[not(self::_sfe:BeforeOrAfterText)][1]/*[not(self::_sfe:BeforeOrAfterText)]//text()[normalize-space(.)!=''][not(parent::_sfe:BeforeOrAfterText)]))"><!--AddAfter Condition #2--><xsl:if test="not(@_gte:Gentext-Expanded)">
                  <_gte:Must-Expand-Gentext/>
                  <_sfe:BeforeOrAfterText/>
               </xsl:if>
            </xsl:when>
            <xsl:when test="ancestor::entry[preceding-sibling::entry[part-nbr[@indent = '1']]]"><!--AddAfter Condition #1--><xsl:if test="not(@_gte:Gentext-Expanded)">
                  <_gte:Must-Expand-Gentext/>
                  <_sfe:BeforeOrAfterText/>
               </xsl:if>
            </xsl:when>
         </xsl:choose>
      </xsl:copy>
   </xsl:template>

   <!--Initial pass template for Context: name-->
<xsl:template match="name" mode="initial-pass-mode" priority="0">
      <xsl:copy>
         <xsl:call-template name="maybe-set-gte-id"/>
         <xsl:apply-templates select="@*|node()" mode="initial-pass-mode"/>
      </xsl:copy>
   </xsl:template>

   <!--Set count-as pass template for Context: name-->
<xsl:template match="name" mode="set-countas" priority="0">
      <xsl:copy>
         <xsl:apply-templates select="@*|node()" mode="set-countas"/>
      </xsl:copy>
   </xsl:template>

   <!--Set ch:chunk template for Context: name-->
<xsl:template match="name" mode="set-ch-chunk" priority="0">
      <xsl:copy>
         <xsl:if test="not(@_gte:did-set-chunk)">
            <xsl:variable name="Breaks-chunkBoundary"/>
            <xsl:if test="$Breaks-chunkBoundary = 'yes'">
               <xsl:attribute name="ch:chunk">yes</xsl:attribute>
            </xsl:if>
            <xsl:attribute name="_gte:did-set-chunk">yes</xsl:attribute>
         </xsl:if>
         <xsl:apply-templates select="@*|node()" mode="set-ch-chunk"/>
      </xsl:copy>
   </xsl:template>

   <!--Style template for Context: nomen-col-->
<xsl:template name="__style-for_nomen-col.1">
      <xsl:text> .x-nomen-col-1-0 {margin-left: 0pt; margin-right: 0pt; text-indent: 0pt; text-transform: uppercase; } .x-nomen-col-1-1 {margin-left: 8pt; text-indent: -7pt; } .x-nomen-col-1-2 {margin-left: 12pt; text-indent: -11pt; } .x-nomen-col-1-3 {margin-left: 16pt; text-indent: -15pt; } .x-nomen-col-1-4 {margin-left: 20pt; text-indent: -19pt; } .x-nomen-col-1-5 {} .x-nomen-col-1-6 {} .x-nomen-col-1-7 {} .x-nomen-col-1-8 {} .x-nomen-col-1-9 {} .x-nomen-col-1-10 {} .x-nomen-col-1-11 {} .x-nomen-col-1-12 {} .x-nomen-col-1-13 {}</xsl:text>
   </xsl:template>

   <!--Template for Context: nomen-col-->
<xsl:template match="nomen-col" priority="0">
      <xsl:variable name="foClass">block</xsl:variable>
      <xsl:variable name="blockness">block</xsl:variable>
      <xsl:variable name="startnew"/>
      <xsl:variable name="newpageset">#noChange</xsl:variable>
      <div><!--Emit class values to reflect conditions--><xsl:attribute name="class">
            <xsl:text> x-nomen-col-1-0</xsl:text>
            <xsl:if test="parent::entry[preceding-sibling::entry[part-nbr[@indent = '1']]]"> x-nomen-col-1-1</xsl:if>
            <xsl:if test="not(parent::entry[preceding-sibling::entry[part-nbr[@indent = '1']]]) and (parent::entry[preceding-sibling::entry[part-nbr[@indent = '2']]])"> x-nomen-col-1-2</xsl:if>
            <xsl:if test="not(parent::entry[preceding-sibling::entry[part-nbr[@indent = '1']]]) and not(parent::entry[preceding-sibling::entry[part-nbr[@indent = '2']]]) and (parent::entry[preceding-sibling::entry[part-nbr[@indent = '3']]])"> x-nomen-col-1-3</xsl:if>
            <xsl:if test="not(parent::entry[preceding-sibling::entry[part-nbr[@indent = '1']]]) and not(parent::entry[preceding-sibling::entry[part-nbr[@indent = '2']]]) and not(parent::entry[preceding-sibling::entry[part-nbr[@indent = '3']]]) and (parent::entry[preceding-sibling::entry[part-nbr[@indent = '4']]])"> x-nomen-col-1-4</xsl:if>
            <xsl:if test="(@select-at and string(@select-at)='ASSEMBLY') and (parent::entry[preceding-sibling::entry[part-nbr[@ic-opt = 'LIST']]])"> x-nomen-col-1-5</xsl:if>
            <xsl:if test="not((@select-at and string(@select-at)='ASSEMBLY') and (parent::entry[preceding-sibling::entry[part-nbr[@ic-opt = 'LIST']]])) and ((@select-at and string(@select-at)='BALANCING') and (parent::entry[preceding-sibling::entry[part-nbr[@ic-opt = 'LIST']]]))"> x-nomen-col-1-6</xsl:if>
            <xsl:if test="not((@select-at and string(@select-at)='ASSEMBLY') and (parent::entry[preceding-sibling::entry[part-nbr[@ic-opt = 'LIST']]])) and not((@select-at and string(@select-at)='BALANCING') and (parent::entry[preceding-sibling::entry[part-nbr[@ic-opt = 'LIST']]])) and ((@select-at and string(@select-at)='DETAIL-BAL') and (parent::entry[preceding-sibling::entry[part-nbr[@ic-opt = 'LIST']]]))"> x-nomen-col-1-7</xsl:if>
            <xsl:if test="not((@select-at and string(@select-at)='ASSEMBLY') and (parent::entry[preceding-sibling::entry[part-nbr[@ic-opt = 'LIST']]])) and not((@select-at and string(@select-at)='BALANCING') and (parent::entry[preceding-sibling::entry[part-nbr[@ic-opt = 'LIST']]])) and not((@select-at and string(@select-at)='DETAIL-BAL') and (parent::entry[preceding-sibling::entry[part-nbr[@ic-opt = 'LIST']]])) and ((@select-at and string(@select-at)='TRIM-BAL') and (parent::entry[preceding-sibling::entry[part-nbr[@ic-opt = 'LIST']]]))"> x-nomen-col-1-8</xsl:if>
            <xsl:if test="not((@select-at and string(@select-at)='ASSEMBLY') and (parent::entry[preceding-sibling::entry[part-nbr[@ic-opt = 'LIST']]])) and not((@select-at and string(@select-at)='BALANCING') and (parent::entry[preceding-sibling::entry[part-nbr[@ic-opt = 'LIST']]])) and not((@select-at and string(@select-at)='DETAIL-BAL') and (parent::entry[preceding-sibling::entry[part-nbr[@ic-opt = 'LIST']]])) and not((@select-at and string(@select-at)='TRIM-BAL') and (parent::entry[preceding-sibling::entry[part-nbr[@ic-opt = 'LIST']]])) and (parent::entry[preceding-sibling::entry[part-nbr[@ic-opt = 'LIST']]])"> x-nomen-col-1-9</xsl:if>
            <xsl:if test="not((@select-at and string(@select-at)='ASSEMBLY') and (parent::entry[preceding-sibling::entry[part-nbr[@ic-opt = 'LIST']]])) and not((@select-at and string(@select-at)='BALANCING') and (parent::entry[preceding-sibling::entry[part-nbr[@ic-opt = 'LIST']]])) and not((@select-at and string(@select-at)='DETAIL-BAL') and (parent::entry[preceding-sibling::entry[part-nbr[@ic-opt = 'LIST']]])) and not((@select-at and string(@select-at)='TRIM-BAL') and (parent::entry[preceding-sibling::entry[part-nbr[@ic-opt = 'LIST']]])) and not(parent::entry[preceding-sibling::entry[part-nbr[@ic-opt = 'LIST']]]) and (@select-at and string(@select-at)='ASSEMBLY')"> x-nomen-col-1-10</xsl:if>
            <xsl:if test="not((@select-at and string(@select-at)='ASSEMBLY') and (parent::entry[preceding-sibling::entry[part-nbr[@ic-opt = 'LIST']]])) and not((@select-at and string(@select-at)='BALANCING') and (parent::entry[preceding-sibling::entry[part-nbr[@ic-opt = 'LIST']]])) and not((@select-at and string(@select-at)='DETAIL-BAL') and (parent::entry[preceding-sibling::entry[part-nbr[@ic-opt = 'LIST']]])) and not((@select-at and string(@select-at)='TRIM-BAL') and (parent::entry[preceding-sibling::entry[part-nbr[@ic-opt = 'LIST']]])) and not(parent::entry[preceding-sibling::entry[part-nbr[@ic-opt = 'LIST']]]) and not(@select-at and string(@select-at)='ASSEMBLY') and (@select-at and string(@select-at)='BALANCING')"> x-nomen-col-1-11</xsl:if>
            <xsl:if test="not((@select-at and string(@select-at)='ASSEMBLY') and (parent::entry[preceding-sibling::entry[part-nbr[@ic-opt = 'LIST']]])) and not((@select-at and string(@select-at)='BALANCING') and (parent::entry[preceding-sibling::entry[part-nbr[@ic-opt = 'LIST']]])) and not((@select-at and string(@select-at)='DETAIL-BAL') and (parent::entry[preceding-sibling::entry[part-nbr[@ic-opt = 'LIST']]])) and not((@select-at and string(@select-at)='TRIM-BAL') and (parent::entry[preceding-sibling::entry[part-nbr[@ic-opt = 'LIST']]])) and not(parent::entry[preceding-sibling::entry[part-nbr[@ic-opt = 'LIST']]]) and not(@select-at and string(@select-at)='ASSEMBLY') and not(@select-at and string(@select-at)='BALANCING') and (@select-at and string(@select-at)='DETAIL-BAL')"> x-nomen-col-1-12</xsl:if>
            <xsl:if test="not((@select-at and string(@select-at)='ASSEMBLY') and (parent::entry[preceding-sibling::entry[part-nbr[@ic-opt = 'LIST']]])) and not((@select-at and string(@select-at)='BALANCING') and (parent::entry[preceding-sibling::entry[part-nbr[@ic-opt = 'LIST']]])) and not((@select-at and string(@select-at)='DETAIL-BAL') and (parent::entry[preceding-sibling::entry[part-nbr[@ic-opt = 'LIST']]])) and not((@select-at and string(@select-at)='TRIM-BAL') and (parent::entry[preceding-sibling::entry[part-nbr[@ic-opt = 'LIST']]])) and not(parent::entry[preceding-sibling::entry[part-nbr[@ic-opt = 'LIST']]]) and not(@select-at and string(@select-at)='ASSEMBLY') and not(@select-at and string(@select-at)='BALANCING') and not(@select-at and string(@select-at)='DETAIL-BAL') and (@select-at and string(@select-at)='TRIM-BAL')"> x-nomen-col-1-13</xsl:if>
         </xsl:attribute>
         <xsl:if test="@xml:lang">
            <xsl:attribute name="lang">
               <xsl:call-template name="return-lang-applying-language-map">
                  <xsl:with-param name="doclang" select="@xml:lang"/>
               </xsl:call-template>
            </xsl:attribute>
         </xsl:if>
         <xsl:copy-of select="@ch:*"/>
         <xsl:variable name="Breaks-chunkFilenameXPath"/>
         <xsl:variable name="Breaks-persistentFilename"/>
         <xsl:if test="($Breaks-persistentFilename='yes') and ($Breaks-chunkFilenameXPath!='')">
            <xsl:variable name="chunkFilename"/>
            <xsl:if test="$chunkFilename!=''">
               <xsl:attribute name="ch:filename">
                  <xsl:value-of select="$chunkFilename"/>
               </xsl:attribute>
               <xsl:attribute name="ch:namepriority">0</xsl:attribute>
            </xsl:if>
         </xsl:if>
         <xsl:if test="@xml:lang">
            <xsl:attribute name="lang">
               <xsl:call-template name="return-lang-applying-language-map">
                  <xsl:with-param name="doclang" select="@xml:lang"/>
               </xsl:call-template>
            </xsl:attribute>
         </xsl:if>
         <xsl:call-template name="maybe-set-id"/>
         <!--Process this element's content--><xsl:apply-templates/>
      </div>
   </xsl:template>

   <!--Gentext template for Context: nomen-col-->
<xsl:template match="nomen-col" mode="expand-gentext" priority="0">
      <xsl:copy>
         <xsl:attribute name="_gte:Gentext-Expanded">y</xsl:attribute>
         <xsl:apply-templates select="@*" mode="expand-gentext"/>
         <xsl:if test="not(@_gte:id)">
            <xsl:attribute name="_gte:id">
               <xsl:value-of select="'_g_'"/>
               <xsl:value-of select="generate-id(.)"/>
            </xsl:attribute>
         </xsl:if>
         <xsl:choose>
            <xsl:when test="not((@select-at and string(@select-at)='ASSEMBLY') and (parent::entry[preceding-sibling::entry[part-nbr[@ic-opt = 'LIST']]])) and not((@select-at and string(@select-at)='BALANCING') and (parent::entry[preceding-sibling::entry[part-nbr[@ic-opt = 'LIST']]])) and not((@select-at and string(@select-at)='DETAIL-BAL') and (parent::entry[preceding-sibling::entry[part-nbr[@ic-opt = 'LIST']]])) and not((@select-at and string(@select-at)='TRIM-BAL') and (parent::entry[preceding-sibling::entry[part-nbr[@ic-opt = 'LIST']]])) and not(parent::entry[preceding-sibling::entry[part-nbr[@ic-opt = 'LIST']]]) and not(@select-at and string(@select-at)='ASSEMBLY') and not(@select-at and string(@select-at)='BALANCING') and not(@select-at and string(@select-at)='DETAIL-BAL') and (@select-at and string(@select-at)='TRIM-BAL')"><!--AddBefore Condition #13--></xsl:when>
            <xsl:when test="not((@select-at and string(@select-at)='ASSEMBLY') and (parent::entry[preceding-sibling::entry[part-nbr[@ic-opt = 'LIST']]])) and not((@select-at and string(@select-at)='BALANCING') and (parent::entry[preceding-sibling::entry[part-nbr[@ic-opt = 'LIST']]])) and not((@select-at and string(@select-at)='DETAIL-BAL') and (parent::entry[preceding-sibling::entry[part-nbr[@ic-opt = 'LIST']]])) and not((@select-at and string(@select-at)='TRIM-BAL') and (parent::entry[preceding-sibling::entry[part-nbr[@ic-opt = 'LIST']]])) and not(parent::entry[preceding-sibling::entry[part-nbr[@ic-opt = 'LIST']]]) and not(@select-at and string(@select-at)='ASSEMBLY') and not(@select-at and string(@select-at)='BALANCING') and (@select-at and string(@select-at)='DETAIL-BAL')"><!--AddBefore Condition #12--></xsl:when>
            <xsl:when test="not((@select-at and string(@select-at)='ASSEMBLY') and (parent::entry[preceding-sibling::entry[part-nbr[@ic-opt = 'LIST']]])) and not((@select-at and string(@select-at)='BALANCING') and (parent::entry[preceding-sibling::entry[part-nbr[@ic-opt = 'LIST']]])) and not((@select-at and string(@select-at)='DETAIL-BAL') and (parent::entry[preceding-sibling::entry[part-nbr[@ic-opt = 'LIST']]])) and not((@select-at and string(@select-at)='TRIM-BAL') and (parent::entry[preceding-sibling::entry[part-nbr[@ic-opt = 'LIST']]])) and not(parent::entry[preceding-sibling::entry[part-nbr[@ic-opt = 'LIST']]]) and not(@select-at and string(@select-at)='ASSEMBLY') and (@select-at and string(@select-at)='BALANCING')"><!--AddBefore Condition #11--></xsl:when>
            <xsl:when test="not((@select-at and string(@select-at)='ASSEMBLY') and (parent::entry[preceding-sibling::entry[part-nbr[@ic-opt = 'LIST']]])) and not((@select-at and string(@select-at)='BALANCING') and (parent::entry[preceding-sibling::entry[part-nbr[@ic-opt = 'LIST']]])) and not((@select-at and string(@select-at)='DETAIL-BAL') and (parent::entry[preceding-sibling::entry[part-nbr[@ic-opt = 'LIST']]])) and not((@select-at and string(@select-at)='TRIM-BAL') and (parent::entry[preceding-sibling::entry[part-nbr[@ic-opt = 'LIST']]])) and not(parent::entry[preceding-sibling::entry[part-nbr[@ic-opt = 'LIST']]]) and (@select-at and string(@select-at)='ASSEMBLY')"><!--AddBefore Condition #10--></xsl:when>
            <xsl:when test="not((@select-at and string(@select-at)='ASSEMBLY') and (parent::entry[preceding-sibling::entry[part-nbr[@ic-opt = 'LIST']]])) and not((@select-at and string(@select-at)='BALANCING') and (parent::entry[preceding-sibling::entry[part-nbr[@ic-opt = 'LIST']]])) and not((@select-at and string(@select-at)='DETAIL-BAL') and (parent::entry[preceding-sibling::entry[part-nbr[@ic-opt = 'LIST']]])) and not((@select-at and string(@select-at)='TRIM-BAL') and (parent::entry[preceding-sibling::entry[part-nbr[@ic-opt = 'LIST']]])) and (parent::entry[preceding-sibling::entry[part-nbr[@ic-opt = 'LIST']]])"><!--AddBefore Condition #9--></xsl:when>
            <xsl:when test="not((@select-at and string(@select-at)='ASSEMBLY') and (parent::entry[preceding-sibling::entry[part-nbr[@ic-opt = 'LIST']]])) and not((@select-at and string(@select-at)='BALANCING') and (parent::entry[preceding-sibling::entry[part-nbr[@ic-opt = 'LIST']]])) and not((@select-at and string(@select-at)='DETAIL-BAL') and (parent::entry[preceding-sibling::entry[part-nbr[@ic-opt = 'LIST']]])) and ((@select-at and string(@select-at)='TRIM-BAL') and (parent::entry[preceding-sibling::entry[part-nbr[@ic-opt = 'LIST']]]))"><!--AddBefore Condition #8--><xsl:if test="not(@_gte:Gentext-Expanded)">
                  <_gte:Must-Expand-Gentext/>
                  <_sfe:BeforeOrAfterText/>
               </xsl:if>
            </xsl:when>
            <xsl:when test="not((@select-at and string(@select-at)='ASSEMBLY') and (parent::entry[preceding-sibling::entry[part-nbr[@ic-opt = 'LIST']]])) and not((@select-at and string(@select-at)='BALANCING') and (parent::entry[preceding-sibling::entry[part-nbr[@ic-opt = 'LIST']]])) and ((@select-at and string(@select-at)='DETAIL-BAL') and (parent::entry[preceding-sibling::entry[part-nbr[@ic-opt = 'LIST']]]))"><!--AddBefore Condition #7--><xsl:if test="not(@_gte:Gentext-Expanded)">
                  <_gte:Must-Expand-Gentext/>
                  <_sfe:BeforeOrAfterText/>
               </xsl:if>
            </xsl:when>
            <xsl:when test="not((@select-at and string(@select-at)='ASSEMBLY') and (parent::entry[preceding-sibling::entry[part-nbr[@ic-opt = 'LIST']]])) and ((@select-at and string(@select-at)='BALANCING') and (parent::entry[preceding-sibling::entry[part-nbr[@ic-opt = 'LIST']]]))"><!--AddBefore Condition #6--><xsl:if test="not(@_gte:Gentext-Expanded)">
                  <_gte:Must-Expand-Gentext/>
                  <_sfe:BeforeOrAfterText/>
               </xsl:if>
            </xsl:when>
            <xsl:when test="(@select-at and string(@select-at)='ASSEMBLY') and (parent::entry[preceding-sibling::entry[part-nbr[@ic-opt = 'LIST']]])"><!--AddBefore Condition #5--><xsl:if test="not(@_gte:Gentext-Expanded)">
                  <_gte:Must-Expand-Gentext/>
                  <_sfe:BeforeOrAfterText/>
               </xsl:if>
            </xsl:when>
         </xsl:choose>
         <xsl:apply-templates select="* | text() | processing-instruction()" mode="expand-gentext"/>
         <xsl:choose>
            <xsl:when test="not((@select-at and string(@select-at)='ASSEMBLY') and (parent::entry[preceding-sibling::entry[part-nbr[@ic-opt = 'LIST']]])) and not((@select-at and string(@select-at)='BALANCING') and (parent::entry[preceding-sibling::entry[part-nbr[@ic-opt = 'LIST']]])) and not((@select-at and string(@select-at)='DETAIL-BAL') and (parent::entry[preceding-sibling::entry[part-nbr[@ic-opt = 'LIST']]])) and not((@select-at and string(@select-at)='TRIM-BAL') and (parent::entry[preceding-sibling::entry[part-nbr[@ic-opt = 'LIST']]])) and not(parent::entry[preceding-sibling::entry[part-nbr[@ic-opt = 'LIST']]]) and not(@select-at and string(@select-at)='ASSEMBLY') and not(@select-at and string(@select-at)='BALANCING') and not(@select-at and string(@select-at)='DETAIL-BAL') and (@select-at and string(@select-at)='TRIM-BAL')"><!--AddAfter Condition #13--><xsl:if test="not(@_gte:Gentext-Expanded)">
                  <_gte:Must-Expand-Gentext/>
                  <_sfe:BeforeOrAfterText>
                     <_ufe:block-nospace>
                        <xsl:text>SELECT AT TRIM-BAL</xsl:text>
                     </_ufe:block-nospace>
                  </_sfe:BeforeOrAfterText>
               </xsl:if>
            </xsl:when>
            <xsl:when test="not((@select-at and string(@select-at)='ASSEMBLY') and (parent::entry[preceding-sibling::entry[part-nbr[@ic-opt = 'LIST']]])) and not((@select-at and string(@select-at)='BALANCING') and (parent::entry[preceding-sibling::entry[part-nbr[@ic-opt = 'LIST']]])) and not((@select-at and string(@select-at)='DETAIL-BAL') and (parent::entry[preceding-sibling::entry[part-nbr[@ic-opt = 'LIST']]])) and not((@select-at and string(@select-at)='TRIM-BAL') and (parent::entry[preceding-sibling::entry[part-nbr[@ic-opt = 'LIST']]])) and not(parent::entry[preceding-sibling::entry[part-nbr[@ic-opt = 'LIST']]]) and not(@select-at and string(@select-at)='ASSEMBLY') and not(@select-at and string(@select-at)='BALANCING') and (@select-at and string(@select-at)='DETAIL-BAL')"><!--AddAfter Condition #12--><xsl:if test="not(@_gte:Gentext-Expanded)">
                  <_gte:Must-Expand-Gentext/>
                  <_sfe:BeforeOrAfterText>
                     <_ufe:block-nospace>
                        <xsl:text>SELECT AT DETAIL-BAL</xsl:text>
                     </_ufe:block-nospace>
                  </_sfe:BeforeOrAfterText>
               </xsl:if>
            </xsl:when>
            <xsl:when test="not((@select-at and string(@select-at)='ASSEMBLY') and (parent::entry[preceding-sibling::entry[part-nbr[@ic-opt = 'LIST']]])) and not((@select-at and string(@select-at)='BALANCING') and (parent::entry[preceding-sibling::entry[part-nbr[@ic-opt = 'LIST']]])) and not((@select-at and string(@select-at)='DETAIL-BAL') and (parent::entry[preceding-sibling::entry[part-nbr[@ic-opt = 'LIST']]])) and not((@select-at and string(@select-at)='TRIM-BAL') and (parent::entry[preceding-sibling::entry[part-nbr[@ic-opt = 'LIST']]])) and not(parent::entry[preceding-sibling::entry[part-nbr[@ic-opt = 'LIST']]]) and not(@select-at and string(@select-at)='ASSEMBLY') and (@select-at and string(@select-at)='BALANCING')"><!--AddAfter Condition #11--><xsl:if test="not(@_gte:Gentext-Expanded)">
                  <_gte:Must-Expand-Gentext/>
                  <_sfe:BeforeOrAfterText>
                     <_ufe:block-nospace>
                        <xsl:text>SELECT AT BALANCING</xsl:text>
                     </_ufe:block-nospace>
                  </_sfe:BeforeOrAfterText>
               </xsl:if>
            </xsl:when>
            <xsl:when test="not((@select-at and string(@select-at)='ASSEMBLY') and (parent::entry[preceding-sibling::entry[part-nbr[@ic-opt = 'LIST']]])) and not((@select-at and string(@select-at)='BALANCING') and (parent::entry[preceding-sibling::entry[part-nbr[@ic-opt = 'LIST']]])) and not((@select-at and string(@select-at)='DETAIL-BAL') and (parent::entry[preceding-sibling::entry[part-nbr[@ic-opt = 'LIST']]])) and not((@select-at and string(@select-at)='TRIM-BAL') and (parent::entry[preceding-sibling::entry[part-nbr[@ic-opt = 'LIST']]])) and not(parent::entry[preceding-sibling::entry[part-nbr[@ic-opt = 'LIST']]]) and (@select-at and string(@select-at)='ASSEMBLY')"><!--AddAfter Condition #10--><xsl:if test="not(@_gte:Gentext-Expanded)">
                  <_gte:Must-Expand-Gentext/>
                  <_sfe:BeforeOrAfterText>
                     <_ufe:block-nospace>
                        <xsl:text>SELECT AT ASSEMBLY</xsl:text>
                     </_ufe:block-nospace>
                  </_sfe:BeforeOrAfterText>
               </xsl:if>
            </xsl:when>
            <xsl:when test="not((@select-at and string(@select-at)='ASSEMBLY') and (parent::entry[preceding-sibling::entry[part-nbr[@ic-opt = 'LIST']]])) and not((@select-at and string(@select-at)='BALANCING') and (parent::entry[preceding-sibling::entry[part-nbr[@ic-opt = 'LIST']]])) and not((@select-at and string(@select-at)='DETAIL-BAL') and (parent::entry[preceding-sibling::entry[part-nbr[@ic-opt = 'LIST']]])) and not((@select-at and string(@select-at)='TRIM-BAL') and (parent::entry[preceding-sibling::entry[part-nbr[@ic-opt = 'LIST']]])) and (parent::entry[preceding-sibling::entry[part-nbr[@ic-opt = 'LIST']]])"><!--AddAfter Condition #9--><xsl:if test="not(@_gte:Gentext-Expanded)">
                  <_gte:Must-Expand-Gentext/>
                  <_sfe:BeforeOrAfterText>
                     <_ufe:block-nospace>
                        <xsl:text>(IC) CONSISTS OF:</xsl:text>
                     </_ufe:block-nospace>
                  </_sfe:BeforeOrAfterText>
               </xsl:if>
            </xsl:when>
            <xsl:when test="not((@select-at and string(@select-at)='ASSEMBLY') and (parent::entry[preceding-sibling::entry[part-nbr[@ic-opt = 'LIST']]])) and not((@select-at and string(@select-at)='BALANCING') and (parent::entry[preceding-sibling::entry[part-nbr[@ic-opt = 'LIST']]])) and not((@select-at and string(@select-at)='DETAIL-BAL') and (parent::entry[preceding-sibling::entry[part-nbr[@ic-opt = 'LIST']]])) and ((@select-at and string(@select-at)='TRIM-BAL') and (parent::entry[preceding-sibling::entry[part-nbr[@ic-opt = 'LIST']]]))"><!--AddAfter Condition #8--><xsl:if test="not(@_gte:Gentext-Expanded)">
                  <_gte:Must-Expand-Gentext/>
                  <_sfe:BeforeOrAfterText>
                     <_ufe:block-nospace>
                        <xsl:text>SELECT AT TRIM-BAL</xsl:text>
                     </_ufe:block-nospace>
                     <_ufe:block-nospace>
                        <xsl:text>(IC) CONSISTS OF:</xsl:text>
                     </_ufe:block-nospace>
                  </_sfe:BeforeOrAfterText>
               </xsl:if>
            </xsl:when>
            <xsl:when test="not((@select-at and string(@select-at)='ASSEMBLY') and (parent::entry[preceding-sibling::entry[part-nbr[@ic-opt = 'LIST']]])) and not((@select-at and string(@select-at)='BALANCING') and (parent::entry[preceding-sibling::entry[part-nbr[@ic-opt = 'LIST']]])) and ((@select-at and string(@select-at)='DETAIL-BAL') and (parent::entry[preceding-sibling::entry[part-nbr[@ic-opt = 'LIST']]]))"><!--AddAfter Condition #7--><xsl:if test="not(@_gte:Gentext-Expanded)">
                  <_gte:Must-Expand-Gentext/>
                  <_sfe:BeforeOrAfterText>
                     <_ufe:block-nospace>
                        <xsl:text>SELECT AT DETAIL-BAL</xsl:text>
                     </_ufe:block-nospace>
                     <_ufe:block-nospace>
                        <xsl:text>(IC) CONSISTS OF:</xsl:text>
                     </_ufe:block-nospace>
                  </_sfe:BeforeOrAfterText>
               </xsl:if>
            </xsl:when>
            <xsl:when test="not((@select-at and string(@select-at)='ASSEMBLY') and (parent::entry[preceding-sibling::entry[part-nbr[@ic-opt = 'LIST']]])) and ((@select-at and string(@select-at)='BALANCING') and (parent::entry[preceding-sibling::entry[part-nbr[@ic-opt = 'LIST']]]))"><!--AddAfter Condition #6--><xsl:if test="not(@_gte:Gentext-Expanded)">
                  <_gte:Must-Expand-Gentext/>
                  <_sfe:BeforeOrAfterText>
                     <_ufe:block-nospace>
                        <xsl:text>SELECT AT BALANCING</xsl:text>
                     </_ufe:block-nospace>
                     <_ufe:block-nospace>
                        <xsl:text>(IC) CONSISTS OF:</xsl:text>
                     </_ufe:block-nospace>
                  </_sfe:BeforeOrAfterText>
               </xsl:if>
            </xsl:when>
            <xsl:when test="(@select-at and string(@select-at)='ASSEMBLY') and (parent::entry[preceding-sibling::entry[part-nbr[@ic-opt = 'LIST']]])"><!--AddAfter Condition #5--><xsl:if test="not(@_gte:Gentext-Expanded)">
                  <_gte:Must-Expand-Gentext/>
                  <_sfe:BeforeOrAfterText>
                     <_ufe:block-nospace>
                        <xsl:text>SELECT AT ASSEMBLY</xsl:text>
                     </_ufe:block-nospace>
                     <_ufe:block-nospace>
                        <xsl:text>(IC) CONSISTS OF:</xsl:text>
                     </_ufe:block-nospace>
                  </_sfe:BeforeOrAfterText>
               </xsl:if>
            </xsl:when>
         </xsl:choose>
      </xsl:copy>
   </xsl:template>

   <!--Initial pass template for Context: nomen-col-->
<xsl:template match="nomen-col" mode="initial-pass-mode" priority="0">
      <xsl:copy>
         <xsl:call-template name="maybe-set-gte-id"/>
         <xsl:apply-templates select="@*|node()" mode="initial-pass-mode"/>
      </xsl:copy>
   </xsl:template>

   <!--Set count-as pass template for Context: nomen-col-->
<xsl:template match="nomen-col" mode="set-countas" priority="0">
      <xsl:copy>
         <xsl:apply-templates select="@*|node()" mode="set-countas"/>
      </xsl:copy>
   </xsl:template>

   <!--Set ch:chunk template for Context: nomen-col-->
<xsl:template match="nomen-col" mode="set-ch-chunk" priority="0">
      <xsl:copy>
         <xsl:if test="not(@_gte:did-set-chunk)">
            <xsl:variable name="Breaks-chunkBoundary"/>
            <xsl:if test="$Breaks-chunkBoundary = 'yes'">
               <xsl:attribute name="ch:chunk">yes</xsl:attribute>
            </xsl:if>
            <xsl:attribute name="_gte:did-set-chunk">yes</xsl:attribute>
         </xsl:if>
         <xsl:apply-templates select="@*|node()" mode="set-ch-chunk"/>
      </xsl:copy>
   </xsl:template>

   <!--Style template for Context: n-para/note-->
<xsl:template name="__style-for_note.9n-rate111">
      <xsl:text> .x-note-1-0 {margin-left: 0pt; margin-right: 0pt; text-indent: 0pt; margin-top: 8pt; margin-left: 70pt; text-indent: -45pt; } .x-note-1-1 {}</xsl:text>
   </xsl:template>

   <!--Template for Context: n-para/note-->
<xsl:template match="n-para/note" priority="8">
      <xsl:variable name="foClass">block</xsl:variable>
      <xsl:variable name="blockness">block</xsl:variable>
      <xsl:variable name="startnew"/>
      <xsl:variable name="newpageset">#noChange</xsl:variable>
      <div><!--Emit class values to reflect conditions--><xsl:attribute name="class">
            <xsl:text> x-note-1-0</xsl:text>
            <xsl:if test="(following-sibling::note) or (preceding-sibling::note)"> x-note-1-1</xsl:if>
         </xsl:attribute>
         <xsl:if test="@xml:lang">
            <xsl:attribute name="lang">
               <xsl:call-template name="return-lang-applying-language-map">
                  <xsl:with-param name="doclang" select="@xml:lang"/>
               </xsl:call-template>
            </xsl:attribute>
         </xsl:if>
         <xsl:copy-of select="@ch:*"/>
         <xsl:variable name="Breaks-chunkFilenameXPath"/>
         <xsl:variable name="Breaks-persistentFilename"/>
         <xsl:if test="($Breaks-persistentFilename='yes') and ($Breaks-chunkFilenameXPath!='')">
            <xsl:variable name="chunkFilename"/>
            <xsl:if test="$chunkFilename!=''">
               <xsl:attribute name="ch:filename">
                  <xsl:value-of select="$chunkFilename"/>
               </xsl:attribute>
               <xsl:attribute name="ch:namepriority">0</xsl:attribute>
            </xsl:if>
         </xsl:if>
         <xsl:if test="@xml:lang">
            <xsl:attribute name="lang">
               <xsl:call-template name="return-lang-applying-language-map">
                  <xsl:with-param name="doclang" select="@xml:lang"/>
               </xsl:call-template>
            </xsl:attribute>
         </xsl:if>
         <xsl:call-template name="maybe-set-id"/>
         <!--Process this element's content--><xsl:apply-templates/>
      </div>
   </xsl:template>

   <!--Gentext template for Context: n-para/note-->
<xsl:template match="n-para/note" mode="expand-gentext" priority="8">
      <xsl:copy>
         <xsl:attribute name="_gte:Gentext-Expanded">y</xsl:attribute>
         <xsl:apply-templates select="@*" mode="expand-gentext"/>
         <xsl:if test="not(@_gte:id)">
            <xsl:attribute name="_gte:id">
               <xsl:value-of select="'_g_'"/>
               <xsl:value-of select="generate-id(.)"/>
            </xsl:attribute>
         </xsl:if>
         <xsl:choose>
            <xsl:when test="(following-sibling::note) or (preceding-sibling::note)"><!--AddBefore Condition #1--><xsl:if test="not(@_gte:Gentext-Expanded)">
                  <_gte:Must-Expand-Gentext/>
                  <_sfe:BeforeOrAfterText>
                     <span style="text-decoration: underline; ">
                        <xsl:text>NOTE</xsl:text>
                     </span>
                     <xsl:text>: </xsl:text>
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
                     <xsl:text> </xsl:text>
                  </_sfe:BeforeOrAfterText>
               </xsl:if>
            </xsl:when>
            <xsl:otherwise>
               <xsl:if test="not(@_gte:Gentext-Expanded)">
                  <_gte:Must-Expand-Gentext/>
                  <_sfe:BeforeOrAfterText>
                     <span style="text-decoration: underline; ">
                        <xsl:text>NOTE</xsl:text>
                     </span>
                     <xsl:text>: </xsl:text>
                  </_sfe:BeforeOrAfterText>
               </xsl:if>
            </xsl:otherwise>
         </xsl:choose>
         <xsl:apply-templates select="* | text() | processing-instruction()" mode="expand-gentext"/>
      </xsl:copy>
   </xsl:template>

   <!--Initial pass template for Context: n-para/note-->
<xsl:template match="n-para/note" mode="initial-pass-mode" priority="8">
      <xsl:copy>
         <xsl:call-template name="maybe-set-gte-id"/>
         <xsl:apply-templates select="@*|node()" mode="initial-pass-mode"/>
      </xsl:copy>
   </xsl:template>

   <!--Numbering template for context=n-para/note-->
<xsl:template match="n-para/note" mode="styler_numbering" priority="8">
      <xsl:choose>
         <xsl:when test="(following-sibling::note) or (preceding-sibling::note)">
            <xsl:variable name="node-id" select="generate-id(.)"/>
            <xsl:variable name="num">
               <xsl:for-each select="parent::*/*[@_gte:count-as-id='cnt__note.xcnt']">
                  <xsl:if test="generate-id(.) = $node-id">
                     <xsl:value-of select="position()"/>
                  </xsl:if>
               </xsl:for-each>
            </xsl:variable>
            <xsl:choose>
               <xsl:when test="string(number($num))!='NaN'">
                  <xsl:number value="$num" format="1"/>
               </xsl:when>
               <xsl:otherwise>?</xsl:otherwise>
            </xsl:choose>
            <xsl:text>.</xsl:text>
         </xsl:when>
      </xsl:choose>
   </xsl:template>

   <!--Set count-as pass template for Context: n-para/note-->
<xsl:template match="n-para/note" mode="set-countas" priority="8">
      <xsl:copy>
         <xsl:choose>
            <xsl:when test="(following-sibling::note) or (preceding-sibling::note)">
               <xsl:attribute name="_gte:count-as-id">cnt__note.xcnt</xsl:attribute>
            </xsl:when>
            <xsl:when test="true()"><!--This is the "otherwise" clause, but there may be no when's--><!--We emit this even though we do nothing here to avoid a possible empty xsl:choose--></xsl:when>
         </xsl:choose>
         <xsl:apply-templates select="@*|node()" mode="set-countas"/>
      </xsl:copy>
   </xsl:template>

   <!--LabelAndNumberMarker template-->
<xsl:template match="n-para/note" mode="styler-LabelAndNumberMarker" priority="8">
      <xsl:choose>
         <xsl:when test="(following-sibling::note) or (preceding-sibling::note)"><!--LabelAndNumberMarker for condition #1--><_gte:styler_numbering>
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
         </xsl:when>
         <xsl:otherwise/>
      </xsl:choose>
   </xsl:template>

   <!--Set ch:chunk template for Context: n-para/note-->
<xsl:template match="n-para/note" mode="set-ch-chunk" priority="8">
      <xsl:copy>
         <xsl:if test="not(@_gte:did-set-chunk)">
            <xsl:variable name="Breaks-chunkBoundary"/>
            <xsl:if test="$Breaks-chunkBoundary = 'yes'">
               <xsl:attribute name="ch:chunk">yes</xsl:attribute>
            </xsl:if>
            <xsl:attribute name="_gte:did-set-chunk">yes</xsl:attribute>
         </xsl:if>
         <xsl:apply-templates select="@*|node()" mode="set-ch-chunk"/>
      </xsl:copy>
   </xsl:template>

   <!--Style template for Context: procedure/note-->
<xsl:template name="__style-for_note.9predte142">
      <xsl:text> .x-note-2-0 {margin-left: 0pt; margin-right: 0pt; text-indent: 0pt; margin-top: 8pt; margin-left: 59pt; text-indent: -41pt; } .x-note-2-1 {margin-left: 76pt; text-indent: -57pt; }</xsl:text>
   </xsl:template>

   <!--Template for Context: procedure/note-->
<xsl:template match="procedure/note" priority="7">
      <xsl:variable name="foClass">block</xsl:variable>
      <xsl:variable name="blockness">block</xsl:variable>
      <xsl:variable name="startnew"/>
      <xsl:variable name="newpageset">#noChange</xsl:variable>
      <div><!--Emit class values to reflect conditions--><xsl:attribute name="class">
            <xsl:text> x-note-2-0</xsl:text>
            <xsl:if test="(following-sibling::note) or (preceding-sibling::note)"> x-note-2-1</xsl:if>
         </xsl:attribute>
         <xsl:if test="@xml:lang">
            <xsl:attribute name="lang">
               <xsl:call-template name="return-lang-applying-language-map">
                  <xsl:with-param name="doclang" select="@xml:lang"/>
               </xsl:call-template>
            </xsl:attribute>
         </xsl:if>
         <xsl:copy-of select="@ch:*"/>
         <xsl:variable name="Breaks-chunkFilenameXPath"/>
         <xsl:variable name="Breaks-persistentFilename"/>
         <xsl:if test="($Breaks-persistentFilename='yes') and ($Breaks-chunkFilenameXPath!='')">
            <xsl:variable name="chunkFilename"/>
            <xsl:if test="$chunkFilename!=''">
               <xsl:attribute name="ch:filename">
                  <xsl:value-of select="$chunkFilename"/>
               </xsl:attribute>
               <xsl:attribute name="ch:namepriority">0</xsl:attribute>
            </xsl:if>
         </xsl:if>
         <xsl:if test="@xml:lang">
            <xsl:attribute name="lang">
               <xsl:call-template name="return-lang-applying-language-map">
                  <xsl:with-param name="doclang" select="@xml:lang"/>
               </xsl:call-template>
            </xsl:attribute>
         </xsl:if>
         <xsl:call-template name="maybe-set-id"/>
         <!--Process this element's content--><xsl:apply-templates/>
      </div>
   </xsl:template>

   <!--Gentext template for Context: procedure/note-->
<xsl:template match="procedure/note" mode="expand-gentext" priority="7">
      <xsl:copy>
         <xsl:attribute name="_gte:Gentext-Expanded">y</xsl:attribute>
         <xsl:apply-templates select="@*" mode="expand-gentext"/>
         <xsl:if test="not(@_gte:id)">
            <xsl:attribute name="_gte:id">
               <xsl:value-of select="'_g_'"/>
               <xsl:value-of select="generate-id(.)"/>
            </xsl:attribute>
         </xsl:if>
         <xsl:choose>
            <xsl:when test="(following-sibling::note) or (preceding-sibling::note)"><!--AddBefore Condition #1--><xsl:if test="not(@_gte:Gentext-Expanded)">
                  <_gte:Must-Expand-Gentext/>
                  <_sfe:BeforeOrAfterText>
                     <span style="text-decoration: underline; ">
                        <xsl:text>NOTE</xsl:text>
                     </span>
                     <xsl:text>: </xsl:text>
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
                     <xsl:text> </xsl:text>
                  </_sfe:BeforeOrAfterText>
               </xsl:if>
            </xsl:when>
            <xsl:otherwise>
               <xsl:if test="not(@_gte:Gentext-Expanded)">
                  <_gte:Must-Expand-Gentext/>
                  <_sfe:BeforeOrAfterText>
                     <span style="text-decoration: underline; ">
                        <xsl:text>NOTE</xsl:text>
                     </span>
                     <xsl:text>: </xsl:text>
                  </_sfe:BeforeOrAfterText>
               </xsl:if>
            </xsl:otherwise>
         </xsl:choose>
         <xsl:apply-templates select="* | text() | processing-instruction()" mode="expand-gentext"/>
      </xsl:copy>
   </xsl:template>

   <!--Initial pass template for Context: procedure/note-->
<xsl:template match="procedure/note" mode="initial-pass-mode" priority="7">
      <xsl:copy>
         <xsl:call-template name="maybe-set-gte-id"/>
         <xsl:apply-templates select="@*|node()" mode="initial-pass-mode"/>
      </xsl:copy>
   </xsl:template>

   <!--Numbering template for context=procedure/note-->
<xsl:template match="procedure/note" mode="styler_numbering" priority="7">
      <xsl:choose>
         <xsl:when test="(following-sibling::note) or (preceding-sibling::note)">
            <xsl:variable name="node-id" select="generate-id(.)"/>
            <xsl:variable name="num">
               <xsl:for-each select="parent::*/*[@_gte:count-as-id='cnt__note.xcnt']">
                  <xsl:if test="generate-id(.) = $node-id">
                     <xsl:value-of select="position()"/>
                  </xsl:if>
               </xsl:for-each>
            </xsl:variable>
            <xsl:choose>
               <xsl:when test="string(number($num))!='NaN'">
                  <xsl:number value="$num" format="1"/>
               </xsl:when>
               <xsl:otherwise>?</xsl:otherwise>
            </xsl:choose>
            <xsl:text>.</xsl:text>
         </xsl:when>
      </xsl:choose>
   </xsl:template>

   <!--Set count-as pass template for Context: procedure/note-->
<xsl:template match="procedure/note" mode="set-countas" priority="7">
      <xsl:copy>
         <xsl:choose>
            <xsl:when test="(following-sibling::note) or (preceding-sibling::note)">
               <xsl:attribute name="_gte:count-as-id">cnt__note.xcnt</xsl:attribute>
            </xsl:when>
            <xsl:when test="true()"><!--This is the "otherwise" clause, but there may be no when's--><!--We emit this even though we do nothing here to avoid a possible empty xsl:choose--></xsl:when>
         </xsl:choose>
         <xsl:apply-templates select="@*|node()" mode="set-countas"/>
      </xsl:copy>
   </xsl:template>

   <!--LabelAndNumberMarker template-->
<xsl:template match="procedure/note" mode="styler-LabelAndNumberMarker" priority="7">
      <xsl:choose>
         <xsl:when test="(following-sibling::note) or (preceding-sibling::note)"><!--LabelAndNumberMarker for condition #1--><_gte:styler_numbering>
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
         </xsl:when>
         <xsl:otherwise/>
      </xsl:choose>
   </xsl:template>

   <!--Set ch:chunk template for Context: procedure/note-->
<xsl:template match="procedure/note" mode="set-ch-chunk" priority="7">
      <xsl:copy>
         <xsl:if test="not(@_gte:did-set-chunk)">
            <xsl:variable name="Breaks-chunkBoundary"/>
            <xsl:if test="$Breaks-chunkBoundary = 'yes'">
               <xsl:attribute name="ch:chunk">yes</xsl:attribute>
            </xsl:if>
            <xsl:attribute name="_gte:did-set-chunk">yes</xsl:attribute>
         </xsl:if>
         <xsl:apply-templates select="@*|node()" mode="set-ch-chunk"/>
      </xsl:copy>
   </xsl:template>

   <!--Style template for Context: fandc/note-->
<xsl:template name="__style-for_note.9facnte103">
      <xsl:text> .x-note-3-0 {margin-left: 0pt; margin-right: 0pt; text-indent: 0pt; }</xsl:text>
   </xsl:template>

   <!--Template for Context: fandc/note-->
<xsl:template match="fandc/note" priority="6">
      <div><!--Emit class values to reflect conditions--><xsl:attribute name="class">
            <xsl:text> x-note-3-0</xsl:text>
         </xsl:attribute>
         <xsl:if test="@xml:lang">
            <xsl:attribute name="lang">
               <xsl:call-template name="return-lang-applying-language-map">
                  <xsl:with-param name="doclang" select="@xml:lang"/>
               </xsl:call-template>
            </xsl:attribute>
         </xsl:if>
         <xsl:copy-of select="@ch:*"/>
         <xsl:if test="@xml:lang">
            <xsl:attribute name="lang">
               <xsl:call-template name="return-lang-applying-language-map">
                  <xsl:with-param name="doclang" select="@xml:lang"/>
               </xsl:call-template>
            </xsl:attribute>
         </xsl:if>
         <xsl:call-template name="maybe-set-id"/>
         <!--Process this element's content--><xsl:apply-templates/>
      </div>
   </xsl:template>

   <!--Gentext template for Context: fandc/note-->
<xsl:template match="fandc/note" mode="expand-gentext" priority="6">
      <xsl:copy>
         <xsl:apply-templates select="@*|node()" mode="expand-gentext"/>
      </xsl:copy>
   </xsl:template>

   <!--Initial pass template for Context: fandc/note-->
<xsl:template match="fandc/note" mode="initial-pass-mode" priority="6">
      <xsl:copy>
         <xsl:call-template name="maybe-set-gte-id"/>
         <xsl:apply-templates select="@*|node()" mode="initial-pass-mode"/>
      </xsl:copy>
   </xsl:template>

   <!--Set count-as pass template for Context: fandc/note-->
<xsl:template match="fandc/note" mode="set-countas" priority="6">
      <xsl:copy>
         <xsl:apply-templates select="@*|node()" mode="set-countas"/>
      </xsl:copy>
   </xsl:template>

   <!--Set ch:chunk template for Context: fandc/note-->
<xsl:template match="fandc/note" mode="set-ch-chunk" priority="6">
      <xsl:copy>
         <xsl:if test="not(@_gte:did-set-chunk)">
            <xsl:attribute name="_gte:did-set-chunk">yes</xsl:attribute>
         </xsl:if>
         <xsl:apply-templates select="@*|node()" mode="set-ch-chunk"/>
      </xsl:copy>
   </xsl:template>

   <!--Style template for Context: spec-assem/note-->
<xsl:template name="__style-for_note.9sp-ate154">
      <xsl:text> .x-note-4-0 {margin-left: 0pt; margin-right: 0pt; text-indent: 0pt; }</xsl:text>
   </xsl:template>

   <!--Template for Context: spec-assem/note-->
<xsl:template match="spec-assem/note" priority="5">
      <div><!--Emit class values to reflect conditions--><xsl:attribute name="class">
            <xsl:text> x-note-4-0</xsl:text>
         </xsl:attribute>
         <xsl:if test="@xml:lang">
            <xsl:attribute name="lang">
               <xsl:call-template name="return-lang-applying-language-map">
                  <xsl:with-param name="doclang" select="@xml:lang"/>
               </xsl:call-template>
            </xsl:attribute>
         </xsl:if>
         <xsl:copy-of select="@ch:*"/>
         <xsl:if test="@xml:lang">
            <xsl:attribute name="lang">
               <xsl:call-template name="return-lang-applying-language-map">
                  <xsl:with-param name="doclang" select="@xml:lang"/>
               </xsl:call-template>
            </xsl:attribute>
         </xsl:if>
         <xsl:call-template name="maybe-set-id"/>
         <!--Process this element's content--><xsl:apply-templates/>
      </div>
   </xsl:template>

   <!--Gentext template for Context: spec-assem/note-->
<xsl:template match="spec-assem/note" mode="expand-gentext" priority="5">
      <xsl:copy>
         <xsl:apply-templates select="@*|node()" mode="expand-gentext"/>
      </xsl:copy>
   </xsl:template>

   <!--Initial pass template for Context: spec-assem/note-->
<xsl:template match="spec-assem/note" mode="initial-pass-mode" priority="5">
      <xsl:copy>
         <xsl:call-template name="maybe-set-gte-id"/>
         <xsl:apply-templates select="@*|node()" mode="initial-pass-mode"/>
      </xsl:copy>
   </xsl:template>

   <!--Set count-as pass template for Context: spec-assem/note-->
<xsl:template match="spec-assem/note" mode="set-countas" priority="5">
      <xsl:copy>
         <xsl:apply-templates select="@*|node()" mode="set-countas"/>
      </xsl:copy>
   </xsl:template>

   <!--Set ch:chunk template for Context: spec-assem/note-->
<xsl:template match="spec-assem/note" mode="set-ch-chunk" priority="5">
      <xsl:copy>
         <xsl:if test="not(@_gte:did-set-chunk)">
            <xsl:attribute name="_gte:did-set-chunk">yes</xsl:attribute>
         </xsl:if>
         <xsl:apply-templates select="@*|node()" mode="set-ch-chunk"/>
      </xsl:copy>
   </xsl:template>

   <!--Style template for Context: spring-pressure/note-->
<xsl:template name="__style-for_note.9spngte205">
      <xsl:text> .x-note-5-0 {margin-left: 0pt; margin-right: 0pt; text-indent: 0pt; }</xsl:text>
   </xsl:template>

   <!--Template for Context: spring-pressure/note-->
<xsl:template match="spring-pressure/note" priority="4">
      <div><!--Emit class values to reflect conditions--><xsl:attribute name="class">
            <xsl:text> x-note-5-0</xsl:text>
         </xsl:attribute>
         <xsl:if test="@xml:lang">
            <xsl:attribute name="lang">
               <xsl:call-template name="return-lang-applying-language-map">
                  <xsl:with-param name="doclang" select="@xml:lang"/>
               </xsl:call-template>
            </xsl:attribute>
         </xsl:if>
         <xsl:copy-of select="@ch:*"/>
         <xsl:if test="@xml:lang">
            <xsl:attribute name="lang">
               <xsl:call-template name="return-lang-applying-language-map">
                  <xsl:with-param name="doclang" select="@xml:lang"/>
               </xsl:call-template>
            </xsl:attribute>
         </xsl:if>
         <xsl:call-template name="maybe-set-id"/>
         <!--Process this element's content--><xsl:apply-templates/>
      </div>
   </xsl:template>

   <!--Gentext template for Context: spring-pressure/note-->
<xsl:template match="spring-pressure/note" mode="expand-gentext" priority="4">
      <xsl:copy>
         <xsl:apply-templates select="@*|node()" mode="expand-gentext"/>
      </xsl:copy>
   </xsl:template>

   <!--Initial pass template for Context: spring-pressure/note-->
<xsl:template match="spring-pressure/note" mode="initial-pass-mode" priority="4">
      <xsl:copy>
         <xsl:call-template name="maybe-set-gte-id"/>
         <xsl:apply-templates select="@*|node()" mode="initial-pass-mode"/>
      </xsl:copy>
   </xsl:template>

   <!--Set count-as pass template for Context: spring-pressure/note-->
<xsl:template match="spring-pressure/note" mode="set-countas" priority="4">
      <xsl:copy>
         <xsl:apply-templates select="@*|node()" mode="set-countas"/>
      </xsl:copy>
   </xsl:template>

   <!--Set ch:chunk template for Context: spring-pressure/note-->
<xsl:template match="spring-pressure/note" mode="set-ch-chunk" priority="4">
      <xsl:copy>
         <xsl:if test="not(@_gte:did-set-chunk)">
            <xsl:attribute name="_gte:did-set-chunk">yes</xsl:attribute>
         </xsl:if>
         <xsl:apply-templates select="@*|node()" mode="set-ch-chunk"/>
      </xsl:copy>
   </xsl:template>

   <!--Style template for Context: torque-and-stretch/note-->
<xsl:template name="__style-for_note.9touete236">
      <xsl:text> .x-note-6-0 {margin-left: 0pt; margin-right: 0pt; text-indent: 0pt; }</xsl:text>
   </xsl:template>

   <!--Template for Context: torque-and-stretch/note-->
<xsl:template match="torque-and-stretch/note" priority="3">
      <div><!--Emit class values to reflect conditions--><xsl:attribute name="class">
            <xsl:text> x-note-6-0</xsl:text>
         </xsl:attribute>
         <xsl:if test="@xml:lang">
            <xsl:attribute name="lang">
               <xsl:call-template name="return-lang-applying-language-map">
                  <xsl:with-param name="doclang" select="@xml:lang"/>
               </xsl:call-template>
            </xsl:attribute>
         </xsl:if>
         <xsl:copy-of select="@ch:*"/>
         <xsl:if test="@xml:lang">
            <xsl:attribute name="lang">
               <xsl:call-template name="return-lang-applying-language-map">
                  <xsl:with-param name="doclang" select="@xml:lang"/>
               </xsl:call-template>
            </xsl:attribute>
         </xsl:if>
         <xsl:call-template name="maybe-set-id"/>
         <!--Process this element's content--><xsl:apply-templates/>
      </div>
   </xsl:template>

   <!--Gentext template for Context: torque-and-stretch/note-->
<xsl:template match="torque-and-stretch/note" mode="expand-gentext" priority="3">
      <xsl:copy>
         <xsl:apply-templates select="@*|node()" mode="expand-gentext"/>
      </xsl:copy>
   </xsl:template>

   <!--Initial pass template for Context: torque-and-stretch/note-->
<xsl:template match="torque-and-stretch/note" mode="initial-pass-mode" priority="3">
      <xsl:copy>
         <xsl:call-template name="maybe-set-gte-id"/>
         <xsl:apply-templates select="@*|node()" mode="initial-pass-mode"/>
      </xsl:copy>
   </xsl:template>

   <!--Set count-as pass template for Context: torque-and-stretch/note-->
<xsl:template match="torque-and-stretch/note" mode="set-countas" priority="3">
      <xsl:copy>
         <xsl:apply-templates select="@*|node()" mode="set-countas"/>
      </xsl:copy>
   </xsl:template>

   <!--Set ch:chunk template for Context: torque-and-stretch/note-->
<xsl:template match="torque-and-stretch/note" mode="set-ch-chunk" priority="3">
      <xsl:copy>
         <xsl:if test="not(@_gte:did-set-chunk)">
            <xsl:attribute name="_gte:did-set-chunk">yes</xsl:attribute>
         </xsl:if>
         <xsl:apply-templates select="@*|node()" mode="set-ch-chunk"/>
      </xsl:copy>
   </xsl:template>

   <!--Style template for Context: fits-and-clears/note-->
<xsl:template name="__style-for_note.9fi-ate207">
      <xsl:text> .x-note-7-0 {margin-left: 0pt; margin-right: 0pt; text-indent: 0pt; }</xsl:text>
   </xsl:template>

   <!--Template for Context: fits-and-clears/note-->
<xsl:template match="fits-and-clears/note" priority="2">
      <div><!--Emit class values to reflect conditions--><xsl:attribute name="class">
            <xsl:text> x-note-7-0</xsl:text>
         </xsl:attribute>
         <xsl:if test="@xml:lang">
            <xsl:attribute name="lang">
               <xsl:call-template name="return-lang-applying-language-map">
                  <xsl:with-param name="doclang" select="@xml:lang"/>
               </xsl:call-template>
            </xsl:attribute>
         </xsl:if>
         <xsl:copy-of select="@ch:*"/>
         <xsl:if test="@xml:lang">
            <xsl:attribute name="lang">
               <xsl:call-template name="return-lang-applying-language-map">
                  <xsl:with-param name="doclang" select="@xml:lang"/>
               </xsl:call-template>
            </xsl:attribute>
         </xsl:if>
         <xsl:call-template name="maybe-set-id"/>
         <!--Process this element's content--><xsl:apply-templates/>
      </div>
   </xsl:template>

   <!--Gentext template for Context: fits-and-clears/note-->
<xsl:template match="fits-and-clears/note" mode="expand-gentext" priority="2">
      <xsl:copy>
         <xsl:apply-templates select="@*|node()" mode="expand-gentext"/>
      </xsl:copy>
   </xsl:template>

   <!--Initial pass template for Context: fits-and-clears/note-->
<xsl:template match="fits-and-clears/note" mode="initial-pass-mode" priority="2">
      <xsl:copy>
         <xsl:call-template name="maybe-set-gte-id"/>
         <xsl:apply-templates select="@*|node()" mode="initial-pass-mode"/>
      </xsl:copy>
   </xsl:template>

   <!--Set count-as pass template for Context: fits-and-clears/note-->
<xsl:template match="fits-and-clears/note" mode="set-countas" priority="2">
      <xsl:copy>
         <xsl:apply-templates select="@*|node()" mode="set-countas"/>
      </xsl:copy>
   </xsl:template>

   <!--Set ch:chunk template for Context: fits-and-clears/note-->
<xsl:template match="fits-and-clears/note" mode="set-ch-chunk" priority="2">
      <xsl:copy>
         <xsl:if test="not(@_gte:did-set-chunk)">
            <xsl:attribute name="_gte:did-set-chunk">yes</xsl:attribute>
         </xsl:if>
         <xsl:apply-templates select="@*|node()" mode="set-ch-chunk"/>
      </xsl:copy>
   </xsl:template>

   <!--Style template for Context: note[parent::subpara]-->
<xsl:template name="__style-for_note.9note218">
      <xsl:text> .x-note-8-0 {margin-left: 0pt; margin-right: 0pt; text-indent: 0pt; margin-top: 8pt; margin-left: 59pt; text-indent: -41pt; } .x-note-8-1 {margin-left: 76pt; text-indent: -57pt; }</xsl:text>
   </xsl:template>

   <!--Template for Context: note[parent::subpara]-->
<xsl:template match="note[parent::subpara]" priority="1">
      <xsl:variable name="foClass">block</xsl:variable>
      <xsl:variable name="blockness">block</xsl:variable>
      <xsl:variable name="startnew"/>
      <xsl:variable name="newpageset">#noChange</xsl:variable>
      <div><!--Emit class values to reflect conditions--><xsl:attribute name="class">
            <xsl:text> x-note-8-0</xsl:text>
            <xsl:if test="(following-sibling::note) or (preceding-sibling::note)"> x-note-8-1</xsl:if>
         </xsl:attribute>
         <xsl:if test="@xml:lang">
            <xsl:attribute name="lang">
               <xsl:call-template name="return-lang-applying-language-map">
                  <xsl:with-param name="doclang" select="@xml:lang"/>
               </xsl:call-template>
            </xsl:attribute>
         </xsl:if>
         <xsl:copy-of select="@ch:*"/>
         <xsl:variable name="Breaks-chunkFilenameXPath"/>
         <xsl:variable name="Breaks-persistentFilename"/>
         <xsl:if test="($Breaks-persistentFilename='yes') and ($Breaks-chunkFilenameXPath!='')">
            <xsl:variable name="chunkFilename"/>
            <xsl:if test="$chunkFilename!=''">
               <xsl:attribute name="ch:filename">
                  <xsl:value-of select="$chunkFilename"/>
               </xsl:attribute>
               <xsl:attribute name="ch:namepriority">0</xsl:attribute>
            </xsl:if>
         </xsl:if>
         <xsl:if test="@xml:lang">
            <xsl:attribute name="lang">
               <xsl:call-template name="return-lang-applying-language-map">
                  <xsl:with-param name="doclang" select="@xml:lang"/>
               </xsl:call-template>
            </xsl:attribute>
         </xsl:if>
         <xsl:call-template name="maybe-set-id"/>
         <!--Process this element's content--><xsl:apply-templates/>
      </div>
   </xsl:template>

   <!--Gentext template for Context: note[parent::subpara]-->
<xsl:template match="note[parent::subpara]" mode="expand-gentext" priority="1">
      <xsl:copy>
         <xsl:attribute name="_gte:Gentext-Expanded">y</xsl:attribute>
         <xsl:apply-templates select="@*" mode="expand-gentext"/>
         <xsl:if test="not(@_gte:id)">
            <xsl:attribute name="_gte:id">
               <xsl:value-of select="'_g_'"/>
               <xsl:value-of select="generate-id(.)"/>
            </xsl:attribute>
         </xsl:if>
         <xsl:choose>
            <xsl:when test="(following-sibling::note) or (preceding-sibling::note)"><!--AddBefore Condition #1--><xsl:if test="not(@_gte:Gentext-Expanded)">
                  <_gte:Must-Expand-Gentext/>
                  <_sfe:BeforeOrAfterText>
                     <span style="text-decoration: underline; ">
                        <xsl:text>NOTE</xsl:text>
                     </span>
                     <xsl:text>: </xsl:text>
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
                     <xsl:text> </xsl:text>
                  </_sfe:BeforeOrAfterText>
               </xsl:if>
            </xsl:when>
            <xsl:otherwise>
               <xsl:if test="not(@_gte:Gentext-Expanded)">
                  <_gte:Must-Expand-Gentext/>
                  <_sfe:BeforeOrAfterText>
                     <span style="text-decoration: underline; ">
                        <xsl:text>NOTE</xsl:text>
                     </span>
                     <xsl:text>: </xsl:text>
                  </_sfe:BeforeOrAfterText>
               </xsl:if>
            </xsl:otherwise>
         </xsl:choose>
         <xsl:apply-templates select="* | text() | processing-instruction()" mode="expand-gentext"/>
      </xsl:copy>
   </xsl:template>

   <!--Initial pass template for Context: note[parent::subpara]-->
<xsl:template match="note[parent::subpara]" mode="initial-pass-mode" priority="1">
      <xsl:copy>
         <xsl:call-template name="maybe-set-gte-id"/>
         <xsl:apply-templates select="@*|node()" mode="initial-pass-mode"/>
      </xsl:copy>
   </xsl:template>

   <!--Numbering template for context=note[parent::subpara]-->
<xsl:template match="note[parent::subpara]" mode="styler_numbering" priority="1">
      <xsl:choose>
         <xsl:when test="(following-sibling::note) or (preceding-sibling::note)">
            <xsl:variable name="node-id" select="generate-id(.)"/>
            <xsl:variable name="num">
               <xsl:for-each select="parent::*/*[@_gte:count-as-id='cnt__note.xcnt']">
                  <xsl:if test="generate-id(.) = $node-id">
                     <xsl:value-of select="position()"/>
                  </xsl:if>
               </xsl:for-each>
            </xsl:variable>
            <xsl:choose>
               <xsl:when test="string(number($num))!='NaN'">
                  <xsl:number value="$num" format="1"/>
               </xsl:when>
               <xsl:otherwise>?</xsl:otherwise>
            </xsl:choose>
            <xsl:text>.</xsl:text>
         </xsl:when>
      </xsl:choose>
   </xsl:template>

   <!--Set count-as pass template for Context: note[parent::subpara]-->
<xsl:template match="note[parent::subpara]" mode="set-countas" priority="1">
      <xsl:copy>
         <xsl:choose>
            <xsl:when test="(following-sibling::note) or (preceding-sibling::note)">
               <xsl:attribute name="_gte:count-as-id">cnt__note.xcnt</xsl:attribute>
            </xsl:when>
            <xsl:when test="true()"><!--This is the "otherwise" clause, but there may be no when's--><!--We emit this even though we do nothing here to avoid a possible empty xsl:choose--></xsl:when>
         </xsl:choose>
         <xsl:apply-templates select="@*|node()" mode="set-countas"/>
      </xsl:copy>
   </xsl:template>

   <!--LabelAndNumberMarker template-->
<xsl:template match="note[parent::subpara]" mode="styler-LabelAndNumberMarker" priority="1">
      <xsl:choose>
         <xsl:when test="(following-sibling::note) or (preceding-sibling::note)"><!--LabelAndNumberMarker for condition #1--><_gte:styler_numbering>
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
         </xsl:when>
         <xsl:otherwise/>
      </xsl:choose>
   </xsl:template>

   <!--Set ch:chunk template for Context: note[parent::subpara]-->
<xsl:template match="note[parent::subpara]" mode="set-ch-chunk" priority="1">
      <xsl:copy>
         <xsl:if test="not(@_gte:did-set-chunk)">
            <xsl:variable name="Breaks-chunkBoundary"/>
            <xsl:if test="$Breaks-chunkBoundary = 'yes'">
               <xsl:attribute name="ch:chunk">yes</xsl:attribute>
            </xsl:if>
            <xsl:attribute name="_gte:did-set-chunk">yes</xsl:attribute>
         </xsl:if>
         <xsl:apply-templates select="@*|node()" mode="set-ch-chunk"/>
      </xsl:copy>
   </xsl:template>

   <!--Style template for Context: note-->
<xsl:template name="__style-for_note.9note49">
      <xsl:text> .x-note-9-0 {margin-left: 0pt; margin-right: 0pt; text-indent: 0pt; margin-top: 8pt; margin-left: 43pt; text-indent: -43pt; } .x-note-9-1 {}</xsl:text>
   </xsl:template>

   <!--Template for Context: note-->
<xsl:template match="note" priority="0">
      <xsl:variable name="foClass">block</xsl:variable>
      <xsl:variable name="blockness">block</xsl:variable>
      <xsl:variable name="startnew"/>
      <xsl:variable name="newpageset">#noChange</xsl:variable>
      <div><!--Emit class values to reflect conditions--><xsl:attribute name="class">
            <xsl:text> x-note-9-0</xsl:text>
            <xsl:if test="(following-sibling::note) or (preceding-sibling::note)"> x-note-9-1</xsl:if>
         </xsl:attribute>
         <xsl:if test="@xml:lang">
            <xsl:attribute name="lang">
               <xsl:call-template name="return-lang-applying-language-map">
                  <xsl:with-param name="doclang" select="@xml:lang"/>
               </xsl:call-template>
            </xsl:attribute>
         </xsl:if>
         <xsl:copy-of select="@ch:*"/>
         <xsl:variable name="Breaks-chunkFilenameXPath"/>
         <xsl:variable name="Breaks-persistentFilename"/>
         <xsl:if test="($Breaks-persistentFilename='yes') and ($Breaks-chunkFilenameXPath!='')">
            <xsl:variable name="chunkFilename"/>
            <xsl:if test="$chunkFilename!=''">
               <xsl:attribute name="ch:filename">
                  <xsl:value-of select="$chunkFilename"/>
               </xsl:attribute>
               <xsl:attribute name="ch:namepriority">0</xsl:attribute>
            </xsl:if>
         </xsl:if>
         <xsl:if test="@xml:lang">
            <xsl:attribute name="lang">
               <xsl:call-template name="return-lang-applying-language-map">
                  <xsl:with-param name="doclang" select="@xml:lang"/>
               </xsl:call-template>
            </xsl:attribute>
         </xsl:if>
         <xsl:call-template name="maybe-set-id"/>
         <!--Process this element's content--><xsl:apply-templates/>
      </div>
   </xsl:template>

   <!--Gentext template for Context: note-->
<xsl:template match="note" mode="expand-gentext" priority="0">
      <xsl:copy>
         <xsl:attribute name="_gte:Gentext-Expanded">y</xsl:attribute>
         <xsl:apply-templates select="@*" mode="expand-gentext"/>
         <xsl:if test="not(@_gte:id)">
            <xsl:attribute name="_gte:id">
               <xsl:value-of select="'_g_'"/>
               <xsl:value-of select="generate-id(.)"/>
            </xsl:attribute>
         </xsl:if>
         <xsl:choose>
            <xsl:when test="(following-sibling::note) or (preceding-sibling::note)"><!--AddBefore Condition #1--><xsl:if test="not(@_gte:Gentext-Expanded)">
                  <_gte:Must-Expand-Gentext/>
                  <_sfe:BeforeOrAfterText>
                     <span style="text-decoration: underline; ">
                        <xsl:text>NOTE</xsl:text>
                     </span>
                     <xsl:text>: </xsl:text>
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
                     <xsl:text> </xsl:text>
                  </_sfe:BeforeOrAfterText>
               </xsl:if>
            </xsl:when>
            <xsl:otherwise>
               <xsl:if test="not(@_gte:Gentext-Expanded)">
                  <_gte:Must-Expand-Gentext/>
                  <_sfe:BeforeOrAfterText>
                     <span style="text-decoration: underline; ">
                        <xsl:text>NOTE</xsl:text>
                     </span>
                     <xsl:text>: </xsl:text>
                  </_sfe:BeforeOrAfterText>
               </xsl:if>
            </xsl:otherwise>
         </xsl:choose>
         <xsl:apply-templates select="* | text() | processing-instruction()" mode="expand-gentext"/>
      </xsl:copy>
   </xsl:template>

   <!--Initial pass template for Context: note-->
<xsl:template match="note" mode="initial-pass-mode" priority="0">
      <xsl:copy>
         <xsl:call-template name="maybe-set-gte-id"/>
         <xsl:apply-templates select="@*|node()" mode="initial-pass-mode"/>
      </xsl:copy>
   </xsl:template>

   <!--Numbering template for context=note-->
<xsl:template match="note" mode="styler_numbering" priority="0">
      <xsl:choose>
         <xsl:when test="(following-sibling::note) or (preceding-sibling::note)">
            <xsl:variable name="node-id" select="generate-id(.)"/>
            <xsl:variable name="num">
               <xsl:for-each select="parent::*/*[@_gte:count-as-id='cnt__note.xcnt']">
                  <xsl:if test="generate-id(.) = $node-id">
                     <xsl:value-of select="position()"/>
                  </xsl:if>
               </xsl:for-each>
            </xsl:variable>
            <xsl:choose>
               <xsl:when test="string(number($num))!='NaN'">
                  <xsl:number value="$num" format="1"/>
               </xsl:when>
               <xsl:otherwise>?</xsl:otherwise>
            </xsl:choose>
            <xsl:text>.</xsl:text>
         </xsl:when>
      </xsl:choose>
   </xsl:template>

   <!--Set count-as pass template for Context: note-->
<xsl:template match="note" mode="set-countas" priority="0">
      <xsl:copy>
         <xsl:choose>
            <xsl:when test="(following-sibling::note) or (preceding-sibling::note)">
               <xsl:attribute name="_gte:count-as-id">cnt__note.xcnt</xsl:attribute>
            </xsl:when>
            <xsl:when test="true()"><!--This is the "otherwise" clause, but there may be no when's--><!--We emit this even though we do nothing here to avoid a possible empty xsl:choose--></xsl:when>
         </xsl:choose>
         <xsl:apply-templates select="@*|node()" mode="set-countas"/>
      </xsl:copy>
   </xsl:template>

   <!--LabelAndNumberMarker template-->
<xsl:template match="note" mode="styler-LabelAndNumberMarker" priority="0">
      <xsl:choose>
         <xsl:when test="(following-sibling::note) or (preceding-sibling::note)"><!--LabelAndNumberMarker for condition #1--><_gte:styler_numbering>
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
         </xsl:when>
         <xsl:otherwise/>
      </xsl:choose>
   </xsl:template>

   <!--Set ch:chunk template for Context: note-->
<xsl:template match="note" mode="set-ch-chunk" priority="0">
      <xsl:copy>
         <xsl:if test="not(@_gte:did-set-chunk)">
            <xsl:variable name="Breaks-chunkBoundary"/>
            <xsl:if test="$Breaks-chunkBoundary = 'yes'">
               <xsl:attribute name="ch:chunk">yes</xsl:attribute>
            </xsl:if>
            <xsl:attribute name="_gte:did-set-chunk">yes</xsl:attribute>
         </xsl:if>
         <xsl:apply-templates select="@*|node()" mode="set-ch-chunk"/>
      </xsl:copy>
   </xsl:template>

   <!--Style template for Context: optitem-->
<xsl:template name="__style-for_optitem.1">
      <xsl:text> .x-optitem-1-0 {margin-left: 0pt; margin-right: 0pt; }</xsl:text>
   </xsl:template>

   <!--Template for Context: optitem-->
<xsl:template match="optitem" priority="0">
      <span><!--Emit class values to reflect conditions--><xsl:attribute name="class">
            <xsl:text> x-optitem-1-0</xsl:text>
         </xsl:attribute>
         <xsl:if test="@xml:lang">
            <xsl:attribute name="lang">
               <xsl:call-template name="return-lang-applying-language-map">
                  <xsl:with-param name="doclang" select="@xml:lang"/>
               </xsl:call-template>
            </xsl:attribute>
         </xsl:if>
         <xsl:copy-of select="@ch:*"/>
         <xsl:if test="@xml:lang">
            <xsl:attribute name="lang">
               <xsl:call-template name="return-lang-applying-language-map">
                  <xsl:with-param name="doclang" select="@xml:lang"/>
               </xsl:call-template>
            </xsl:attribute>
         </xsl:if>
         <xsl:call-template name="maybe-set-id"/>
         <!--Process this element's content--><xsl:apply-templates/>
      </span>
   </xsl:template>

   <!--Gentext template for Context: optitem-->
<xsl:template match="optitem" mode="expand-gentext" priority="0">
      <xsl:copy>
         <xsl:apply-templates select="@*|node()" mode="expand-gentext"/>
      </xsl:copy>
   </xsl:template>

   <!--Initial pass template for Context: optitem-->
<xsl:template match="optitem" mode="initial-pass-mode" priority="0">
      <xsl:copy>
         <xsl:call-template name="maybe-set-gte-id"/>
         <xsl:apply-templates select="@*|node()" mode="initial-pass-mode"/>
      </xsl:copy>
   </xsl:template>

   <!--Set count-as pass template for Context: optitem-->
<xsl:template match="optitem" mode="set-countas" priority="0">
      <xsl:copy>
         <xsl:apply-templates select="@*|node()" mode="set-countas"/>
      </xsl:copy>
   </xsl:template>

   <!--Set ch:chunk template for Context: optitem-->
<xsl:template match="optitem" mode="set-ch-chunk" priority="0">
      <xsl:copy>
         <xsl:if test="not(@_gte:did-set-chunk)">
            <xsl:attribute name="_gte:did-set-chunk">yes</xsl:attribute>
         </xsl:if>
         <xsl:apply-templates select="@*|node()" mode="set-ch-chunk"/>
      </xsl:copy>
   </xsl:template>

   <!--Style template for Context: optpn-->
<xsl:template name="__style-for_optpn.1">
      <xsl:text> .x-optpn-1-0 {margin-left: 0pt; margin-right: 0pt; }</xsl:text>
   </xsl:template>

   <!--Template for Context: optpn-->
<xsl:template match="optpn" priority="0">
      <span><!--Emit class values to reflect conditions--><xsl:attribute name="class">
            <xsl:text> x-optpn-1-0</xsl:text>
         </xsl:attribute>
         <xsl:if test="@xml:lang">
            <xsl:attribute name="lang">
               <xsl:call-template name="return-lang-applying-language-map">
                  <xsl:with-param name="doclang" select="@xml:lang"/>
               </xsl:call-template>
            </xsl:attribute>
         </xsl:if>
         <xsl:copy-of select="@ch:*"/>
         <xsl:if test="@xml:lang">
            <xsl:attribute name="lang">
               <xsl:call-template name="return-lang-applying-language-map">
                  <xsl:with-param name="doclang" select="@xml:lang"/>
               </xsl:call-template>
            </xsl:attribute>
         </xsl:if>
         <xsl:call-template name="maybe-set-id"/>
         <!--Process this element's content--><xsl:apply-templates/>
      </span>
   </xsl:template>

   <!--Gentext template for Context: optpn-->
<xsl:template match="optpn" mode="expand-gentext" priority="0">
      <xsl:copy>
         <xsl:apply-templates select="@*|node()" mode="expand-gentext"/>
      </xsl:copy>
   </xsl:template>

   <!--Initial pass template for Context: optpn-->
<xsl:template match="optpn" mode="initial-pass-mode" priority="0">
      <xsl:copy>
         <xsl:call-template name="maybe-set-gte-id"/>
         <xsl:apply-templates select="@*|node()" mode="initial-pass-mode"/>
      </xsl:copy>
   </xsl:template>

   <!--Set count-as pass template for Context: optpn-->
<xsl:template match="optpn" mode="set-countas" priority="0">
      <xsl:copy>
         <xsl:apply-templates select="@*|node()" mode="set-countas"/>
      </xsl:copy>
   </xsl:template>

   <!--Set ch:chunk template for Context: optpn-->
<xsl:template match="optpn" mode="set-ch-chunk" priority="0">
      <xsl:copy>
         <xsl:if test="not(@_gte:did-set-chunk)">
            <xsl:attribute name="_gte:did-set-chunk">yes</xsl:attribute>
         </xsl:if>
         <xsl:apply-templates select="@*|node()" mode="set-ch-chunk"/>
      </xsl:copy>
   </xsl:template>

   <!--Style template for Context: part-nbr-->
<xsl:template name="__style-for_part-nbr.1">
      <xsl:text> .x-part-nbr-1-0 {margin-left: 0pt; margin-right: 0pt; text-indent: 0pt; } .x-part-nbr-1-1 {}</xsl:text>
   </xsl:template>

   <!--Template for Context: part-nbr-->
<xsl:template match="part-nbr" priority="0">
      <xsl:param name="hidden" select="'yes'"/>
      <!--Dynamically determine the fo-class--><xsl:variable name="foClass">
         <xsl:choose>
            <xsl:when test="(@ref) and (not(@ref) or (@ref and string(@ref)!=''))">hidden</xsl:when>
            <xsl:otherwise>block</xsl:otherwise>
         </xsl:choose>
      </xsl:variable>
      <xsl:variable name="blockness">block</xsl:variable>
      <xsl:variable name="hiddenness">
         <xsl:choose>
            <xsl:when test="(@ref) and (not(@ref) or (@ref and string(@ref)!=''))">yes</xsl:when>
            <xsl:otherwise>no</xsl:otherwise>
         </xsl:choose>
      </xsl:variable>
      <xsl:variable name="startnew"/>
      <xsl:variable name="newpageset">#noChange</xsl:variable>
      <xsl:variable name="fo-class">
         <xsl:choose>
            <xsl:when test="$hiddenness='yes'">
               <xsl:text>hidden-</xsl:text>
               <xsl:value-of select="$blockness"/>
            </xsl:when>
            <xsl:when test="$hiddenness='no' and starts-with($foClass,'hidden-')">
               <xsl:value-of select="substring($foClass,8)"/>
            </xsl:when>
            <xsl:when test="true()"><!--This is the "otherwise" clause, but there may be no when's--><xsl:value-of select="$foClass"/>
            </xsl:when>
         </xsl:choose>
      </xsl:variable>
      <xsl:variable name="given-lre-override-name"/>
      <xsl:variable name="lre-override-name">
         <xsl:call-template name="determine-lre-override-name">
            <xsl:with-param name="given-lre-override-name" select="$given-lre-override-name"/>
            <xsl:with-param name="fo-class" select="$fo-class"/>
         </xsl:call-template>
      </xsl:variable>
      <!--Execute the appropriate code for the dynamically determined fo-class--><xsl:choose>
         <xsl:when test="$fo-class='hidden-block'">
            <div><!--Emit class values to reflect conditions--><xsl:attribute name="class">
                  <xsl:text> x-part-nbr-1-0</xsl:text>
                  <xsl:if test="(@ref) and (not(@ref) or (@ref and string(@ref)!=''))"> x-part-nbr-1-1</xsl:if>
               </xsl:attribute>
               <xsl:if test="@xml:lang">
                  <xsl:attribute name="lang">
                     <xsl:call-template name="return-lang-applying-language-map">
                        <xsl:with-param name="doclang" select="@xml:lang"/>
                     </xsl:call-template>
                  </xsl:attribute>
               </xsl:if>
               <xsl:copy-of select="@ch:*"/>
               <xsl:variable name="Breaks-chunkFilenameXPath"/>
               <xsl:variable name="Breaks-persistentFilename"/>
               <xsl:if test="($Breaks-persistentFilename='yes') and ($Breaks-chunkFilenameXPath!='')">
                  <xsl:variable name="chunkFilename"/>
                  <xsl:if test="$chunkFilename!=''">
                     <xsl:attribute name="ch:filename">
                        <xsl:value-of select="$chunkFilename"/>
                     </xsl:attribute>
                     <xsl:attribute name="ch:namepriority">0</xsl:attribute>
                  </xsl:if>
               </xsl:if>
               <xsl:if test="@xml:lang">
                  <xsl:attribute name="lang">
                     <xsl:call-template name="return-lang-applying-language-map">
                        <xsl:with-param name="doclang" select="@xml:lang"/>
                     </xsl:call-template>
                  </xsl:attribute>
               </xsl:if>
               <xsl:call-template name="maybe-set-id"/>
               <!--Suppress element contents (but not gentext) unless unhidden--><xsl:choose>
                  <xsl:when test="$hidden='no'">
                     <xsl:apply-templates/>
                  </xsl:when>
                  <xsl:otherwise>
                     <xsl:apply-templates select="_sfe:BeforeOrAfterText"/>
                  </xsl:otherwise>
               </xsl:choose>
            </div>
         </xsl:when>
         <xsl:when test="$fo-class='block'">
            <div><!--Emit class values to reflect conditions--><xsl:attribute name="class">
                  <xsl:text> x-part-nbr-1-0</xsl:text>
                  <xsl:if test="(@ref) and (not(@ref) or (@ref and string(@ref)!=''))"> x-part-nbr-1-1</xsl:if>
               </xsl:attribute>
               <xsl:if test="@xml:lang">
                  <xsl:attribute name="lang">
                     <xsl:call-template name="return-lang-applying-language-map">
                        <xsl:with-param name="doclang" select="@xml:lang"/>
                     </xsl:call-template>
                  </xsl:attribute>
               </xsl:if>
               <xsl:copy-of select="@ch:*"/>
               <xsl:variable name="Breaks-chunkFilenameXPath"/>
               <xsl:variable name="Breaks-persistentFilename"/>
               <xsl:if test="($Breaks-persistentFilename='yes') and ($Breaks-chunkFilenameXPath!='')">
                  <xsl:variable name="chunkFilename"/>
                  <xsl:if test="$chunkFilename!=''">
                     <xsl:attribute name="ch:filename">
                        <xsl:value-of select="$chunkFilename"/>
                     </xsl:attribute>
                     <xsl:attribute name="ch:namepriority">0</xsl:attribute>
                  </xsl:if>
               </xsl:if>
               <xsl:if test="@xml:lang">
                  <xsl:attribute name="lang">
                     <xsl:call-template name="return-lang-applying-language-map">
                        <xsl:with-param name="doclang" select="@xml:lang"/>
                     </xsl:call-template>
                  </xsl:attribute>
               </xsl:if>
               <xsl:call-template name="maybe-set-id"/>
               <!--Process this element's content--><xsl:apply-templates/>
            </div>
         </xsl:when>
      </xsl:choose>
   </xsl:template>

   <!--Gentext template for Context: part-nbr-->
<xsl:template match="part-nbr" mode="expand-gentext" priority="0">
      <xsl:copy>
         <xsl:attribute name="_gte:Gentext-Expanded">y</xsl:attribute>
         <xsl:apply-templates select="@*" mode="expand-gentext"/>
         <xsl:if test="not(@_gte:id)">
            <xsl:attribute name="_gte:id">
               <xsl:value-of select="'_g_'"/>
               <xsl:value-of select="generate-id(.)"/>
            </xsl:attribute>
         </xsl:if>
         <xsl:choose>
            <xsl:when test="(@ref) and (not(@ref) or (@ref and string(@ref)!=''))"><!--AddBefore Condition #1--><xsl:if test="not(@_gte:Gentext-Expanded)">
                  <_gte:Must-Expand-Gentext/>
                  <_sfe:BeforeOrAfterText>
                     <_sfe:InternalLink>
                        <xsl:if test="string(./@ref)">
                           <xsl:attribute name="targetId">
                              <xsl:value-of select="string(./@ref)"/>
                           </xsl:attribute>
                        </xsl:if>
                        <xsl:if test="node()[not(self::_sfe:BeforeOrAfterText)]">
                           <_gte:Gentexted-Content-Wrapper>
                              <xsl:apply-templates mode="expand-gentext">
                                 <xsl:with-param name="skip-expanded-gentext" select="'yes'"/>
                              </xsl:apply-templates>
                           </_gte:Gentexted-Content-Wrapper>
                        </xsl:if>
                     </_sfe:InternalLink>
                  </_sfe:BeforeOrAfterText>
               </xsl:if>
            </xsl:when>
         </xsl:choose>
         <xsl:apply-templates select="* | text() | processing-instruction()" mode="expand-gentext"/>
      </xsl:copy>
   </xsl:template>

   <!--Initial pass template for Context: part-nbr-->
<xsl:template match="part-nbr" mode="initial-pass-mode" priority="0">
      <xsl:copy>
         <xsl:call-template name="maybe-set-gte-id"/>
         <xsl:apply-templates select="@*|node()" mode="initial-pass-mode"/>
      </xsl:copy>
   </xsl:template>

   <!--Set count-as pass template for Context: part-nbr-->
<xsl:template match="part-nbr" mode="set-countas" priority="0">
      <xsl:copy>
         <xsl:apply-templates select="@*|node()" mode="set-countas"/>
      </xsl:copy>
   </xsl:template>

   <!--Set ch:chunk template for Context: part-nbr-->
<xsl:template match="part-nbr" mode="set-ch-chunk" priority="0">
      <xsl:copy>
         <xsl:if test="not(@_gte:did-set-chunk)">
            <xsl:variable name="Breaks-chunkBoundary"/>
            <xsl:if test="$Breaks-chunkBoundary = 'yes'">
               <xsl:attribute name="ch:chunk">yes</xsl:attribute>
            </xsl:if>
            <xsl:attribute name="_gte:did-set-chunk">yes</xsl:attribute>
         </xsl:if>
         <xsl:apply-templates select="@*|node()" mode="set-ch-chunk"/>
      </xsl:copy>
   </xsl:template>

   <!--Style template for Context: _ufe:partial-breakdown-->
<xsl:template name="__style-for__ufe-partial-breakdown.1">
      <xsl:text> .x--ufe-partial-breakdown-1-0 {margin-left: 0pt; margin-right: 0pt; text-indent: 0pt; } .x--ufe-partial-breakdown-1-1 {margin-left: -8pt; text-indent: 0pt; } .x--ufe-partial-breakdown-1-2 {margin-left: -12pt; text-indent: 0pt; } .x--ufe-partial-breakdown-1-3 {margin-left: -16pt; text-indent: 0pt; } .x--ufe-partial-breakdown-1-4 {margin-left: -20pt; text-indent: 0pt; }</xsl:text>
   </xsl:template>

   <!--Template for Context: _ufe:partial-breakdown-->
<xsl:template match="_ufe:partial-breakdown" priority="0">
      <xsl:variable name="foClass">block</xsl:variable>
      <xsl:variable name="blockness">block</xsl:variable>
      <xsl:variable name="startnew"/>
      <xsl:variable name="newpageset">#noChange</xsl:variable>
      <div><!--Emit class values to reflect conditions--><xsl:attribute name="class">
            <xsl:text> x--ufe-partial-breakdown-1-0</xsl:text>
            <xsl:if test="@indent=number('1')"> x--ufe-partial-breakdown-1-1</xsl:if>
            <xsl:if test="not(@indent=number('1')) and (@indent=number('2'))"> x--ufe-partial-breakdown-1-2</xsl:if>
            <xsl:if test="not(@indent=number('1')) and not(@indent=number('2')) and (@indent=number('3'))"> x--ufe-partial-breakdown-1-3</xsl:if>
            <xsl:if test="not(@indent=number('1')) and not(@indent=number('2')) and not(@indent=number('3')) and (@indent=number('4'))"> x--ufe-partial-breakdown-1-4</xsl:if>
         </xsl:attribute>
         <xsl:if test="@xml:lang">
            <xsl:attribute name="lang">
               <xsl:call-template name="return-lang-applying-language-map">
                  <xsl:with-param name="doclang" select="@xml:lang"/>
               </xsl:call-template>
            </xsl:attribute>
         </xsl:if>
         <xsl:copy-of select="@ch:*"/>
         <xsl:variable name="Breaks-chunkFilenameXPath"/>
         <xsl:variable name="Breaks-persistentFilename"/>
         <xsl:if test="($Breaks-persistentFilename='yes') and ($Breaks-chunkFilenameXPath!='')">
            <xsl:variable name="chunkFilename"/>
            <xsl:if test="$chunkFilename!=''">
               <xsl:attribute name="ch:filename">
                  <xsl:value-of select="$chunkFilename"/>
               </xsl:attribute>
               <xsl:attribute name="ch:namepriority">0</xsl:attribute>
            </xsl:if>
         </xsl:if>
         <xsl:if test="@xml:lang">
            <xsl:attribute name="lang">
               <xsl:call-template name="return-lang-applying-language-map">
                  <xsl:with-param name="doclang" select="@xml:lang"/>
               </xsl:call-template>
            </xsl:attribute>
         </xsl:if>
         <xsl:call-template name="maybe-set-id"/>
         <!--Process this element's content--><xsl:apply-templates/>
      </div>
   </xsl:template>

   <!--Gentext template for Context: _ufe:partial-breakdown-->
<xsl:template match="_ufe:partial-breakdown" mode="expand-gentext" priority="0">
      <xsl:copy>
         <xsl:apply-templates select="@*|node()" mode="expand-gentext"/>
      </xsl:copy>
   </xsl:template>

   <!--Initial pass template for Context: _ufe:partial-breakdown-->
<xsl:template match="_ufe:partial-breakdown" mode="initial-pass-mode" priority="0">
      <xsl:copy>
         <xsl:call-template name="maybe-set-gte-id"/>
         <xsl:apply-templates select="@*|node()" mode="initial-pass-mode"/>
      </xsl:copy>
   </xsl:template>

   <!--Set count-as pass template for Context: _ufe:partial-breakdown-->
<xsl:template match="_ufe:partial-breakdown" mode="set-countas" priority="0">
      <xsl:copy>
         <xsl:apply-templates select="@*|node()" mode="set-countas"/>
      </xsl:copy>
   </xsl:template>

   <!--Set ch:chunk template for Context: _ufe:partial-breakdown-->
<xsl:template match="_ufe:partial-breakdown" mode="set-ch-chunk" priority="0">
      <xsl:copy>
         <xsl:if test="not(@_gte:did-set-chunk)">
            <xsl:variable name="Breaks-chunkBoundary"/>
            <xsl:if test="$Breaks-chunkBoundary = 'yes'">
               <xsl:attribute name="ch:chunk">yes</xsl:attribute>
            </xsl:if>
            <xsl:attribute name="_gte:did-set-chunk">yes</xsl:attribute>
         </xsl:if>
         <xsl:apply-templates select="@*|node()" mode="set-ch-chunk"/>
      </xsl:copy>
   </xsl:template>

   <!--Style template for Context: parts-list-->
<xsl:template name="__style-for_parts-list.1">
      <xsl:text> .x-parts-list-1-0 {margin-left: 0pt; margin-right: 0pt; text-indent: 0pt; }</xsl:text>
   </xsl:template>

   <!--Template for Context: parts-list-->
<xsl:template match="parts-list" priority="0">
      <div><!--Emit class values to reflect conditions--><xsl:attribute name="class">
            <xsl:text> x-parts-list-1-0</xsl:text>
         </xsl:attribute>
         <xsl:if test="@xml:lang">
            <xsl:attribute name="lang">
               <xsl:call-template name="return-lang-applying-language-map">
                  <xsl:with-param name="doclang" select="@xml:lang"/>
               </xsl:call-template>
            </xsl:attribute>
         </xsl:if>
         <xsl:copy-of select="@ch:*"/>
         <xsl:if test="@xml:lang">
            <xsl:attribute name="lang">
               <xsl:call-template name="return-lang-applying-language-map">
                  <xsl:with-param name="doclang" select="@xml:lang"/>
               </xsl:call-template>
            </xsl:attribute>
         </xsl:if>
         <xsl:call-template name="maybe-set-id"/>
         <!--Process this element's content--><xsl:apply-templates/>
      </div>
   </xsl:template>

   <!--Gentext template for Context: parts-list-->
<xsl:template match="parts-list" mode="expand-gentext" priority="0">
      <xsl:copy>
         <xsl:apply-templates select="@*|node()" mode="expand-gentext"/>
      </xsl:copy>
   </xsl:template>

   <!--Initial pass template for Context: parts-list-->
<xsl:template match="parts-list" mode="initial-pass-mode" priority="0">
      <xsl:copy>
         <xsl:call-template name="maybe-set-gte-id"/>
         <xsl:apply-templates select="@*|node()" mode="initial-pass-mode"/>
      </xsl:copy>
   </xsl:template>

   <!--Set count-as pass template for Context: parts-list-->
<xsl:template match="parts-list" mode="set-countas" priority="0">
      <xsl:copy>
         <xsl:apply-templates select="@*|node()" mode="set-countas"/>
      </xsl:copy>
   </xsl:template>

   <!--Set ch:chunk template for Context: parts-list-->
<xsl:template match="parts-list" mode="set-ch-chunk" priority="0">
      <xsl:copy>
         <xsl:if test="not(@_gte:did-set-chunk)">
            <xsl:attribute name="_gte:did-set-chunk">yes</xsl:attribute>
         </xsl:if>
         <xsl:apply-templates select="@*|node()" mode="set-ch-chunk"/>
      </xsl:copy>
   </xsl:template>

   <!--Style template for Context: pd-list-->
<xsl:template name="__style-for_pd-list.1">
      <xsl:text> .x-pd-list-1-0 {margin-left: 0pt; margin-right: 0pt; }</xsl:text>
   </xsl:template>

   <!--Template for Context: pd-list-->
<xsl:template match="pd-list" priority="0"><!--Emit a nostyle template--><xsl:apply-templates/>
   </xsl:template>

   <!--Gentext template for Context: pd-list-->
<xsl:template match="pd-list" mode="expand-gentext" priority="0">
      <xsl:copy>
         <xsl:apply-templates select="@*|node()" mode="expand-gentext"/>
      </xsl:copy>
   </xsl:template>

   <!--Initial pass template for Context: pd-list-->
<xsl:template match="pd-list" mode="initial-pass-mode" priority="0">
      <xsl:copy>
         <xsl:call-template name="maybe-set-gte-id"/>
         <xsl:apply-templates select="@*|node()" mode="initial-pass-mode"/>
      </xsl:copy>
   </xsl:template>

   <!--Set count-as pass template for Context: pd-list-->
<xsl:template match="pd-list" mode="set-countas" priority="0">
      <xsl:copy>
         <xsl:apply-templates select="@*|node()" mode="set-countas"/>
      </xsl:copy>
   </xsl:template>

   <!--Set ch:chunk template for Context: pd-list-->
<xsl:template match="pd-list" mode="set-ch-chunk" priority="0">
      <xsl:copy>
         <xsl:if test="not(@_gte:did-set-chunk)">
            <xsl:attribute name="_gte:did-set-chunk">yes</xsl:attribute>
         </xsl:if>
         <xsl:apply-templates select="@*|node()" mode="set-ch-chunk"/>
      </xsl:copy>
   </xsl:template>

   <!--Style template for Context: pntype[position()>1]-->
<xsl:template name="__style-for_pntype.2pnpepe201">
      <xsl:text> .x-pntype-1-0 {margin-left: 0pt; margin-right: 0pt; text-indent: 0pt; } .x-pntype-1-1 {} .x-pntype-1-2 {} .x-pntype-1-3 {} .x-pntype-1-4 {} .x-pntype-1-5 {} .x-pntype-1-6 {} .x-pntype-1-7 {} .x-pntype-1-8 {} .x-pntype-1-9 {} .x-pntype-1-10 {}</xsl:text>
   </xsl:template>

   <!--Template for Context: pntype[position()>1]-->
<xsl:template match="pntype[position()&gt;1]" priority="1">
      <xsl:param name="hidden" select="'yes'"/>
      <!--Dynamically determine the fo-class--><xsl:variable name="foClass">
         <xsl:choose>
            <xsl:when test="not((@cat and string(@cat)='comp-of') and (preceding-sibling::pntype[1][@cat='comp-of'])) and not((@cat and string(@cat)='NewMay') and (preceding-sibling::pntype[1][@cat='NewMay'])) and not((@cat and string(@cat)='rew') and (preceding-sibling::pntype[1][@cat='rew'])) and not((@cat and string(@cat)='field') and (preceding-sibling::pntype[1][@cat='field'])) and not((@cat and string(@cat)='use-with') and (preceding-sibling::pntype[1][@cat='use-with'])) and not((@cat and string(@cat)='comp-of') and (preceding-sibling::pntype[1][@cat!='comp-of'])) and not((@cat and string(@cat)='NewMay') and (preceding-sibling::pntype[1][@cat!='NewMay'])) and not((@cat and string(@cat)='rew') and (preceding-sibling::pntype[1][@cat!='rew'])) and not((@cat and string(@cat)='field') and (preceding-sibling::pntype[1][@cat!='field'])) and ((@cat and string(@cat)='use-with') and (preceding-sibling::pntype[1][@cat!='use-with']))">block</xsl:when>
            <xsl:when test="not((@cat and string(@cat)='comp-of') and (preceding-sibling::pntype[1][@cat='comp-of'])) and not((@cat and string(@cat)='NewMay') and (preceding-sibling::pntype[1][@cat='NewMay'])) and not((@cat and string(@cat)='rew') and (preceding-sibling::pntype[1][@cat='rew'])) and not((@cat and string(@cat)='field') and (preceding-sibling::pntype[1][@cat='field'])) and not((@cat and string(@cat)='use-with') and (preceding-sibling::pntype[1][@cat='use-with'])) and not((@cat and string(@cat)='comp-of') and (preceding-sibling::pntype[1][@cat!='comp-of'])) and not((@cat and string(@cat)='NewMay') and (preceding-sibling::pntype[1][@cat!='NewMay'])) and not((@cat and string(@cat)='rew') and (preceding-sibling::pntype[1][@cat!='rew'])) and ((@cat and string(@cat)='field') and (preceding-sibling::pntype[1][@cat!='field']))">block</xsl:when>
            <xsl:when test="not((@cat and string(@cat)='comp-of') and (preceding-sibling::pntype[1][@cat='comp-of'])) and not((@cat and string(@cat)='NewMay') and (preceding-sibling::pntype[1][@cat='NewMay'])) and not((@cat and string(@cat)='rew') and (preceding-sibling::pntype[1][@cat='rew'])) and not((@cat and string(@cat)='field') and (preceding-sibling::pntype[1][@cat='field'])) and not((@cat and string(@cat)='use-with') and (preceding-sibling::pntype[1][@cat='use-with'])) and not((@cat and string(@cat)='comp-of') and (preceding-sibling::pntype[1][@cat!='comp-of'])) and not((@cat and string(@cat)='NewMay') and (preceding-sibling::pntype[1][@cat!='NewMay'])) and ((@cat and string(@cat)='rew') and (preceding-sibling::pntype[1][@cat!='rew']))">block</xsl:when>
            <xsl:when test="not((@cat and string(@cat)='comp-of') and (preceding-sibling::pntype[1][@cat='comp-of'])) and not((@cat and string(@cat)='NewMay') and (preceding-sibling::pntype[1][@cat='NewMay'])) and not((@cat and string(@cat)='rew') and (preceding-sibling::pntype[1][@cat='rew'])) and not((@cat and string(@cat)='field') and (preceding-sibling::pntype[1][@cat='field'])) and not((@cat and string(@cat)='use-with') and (preceding-sibling::pntype[1][@cat='use-with'])) and not((@cat and string(@cat)='comp-of') and (preceding-sibling::pntype[1][@cat!='comp-of'])) and ((@cat and string(@cat)='NewMay') and (preceding-sibling::pntype[1][@cat!='NewMay']))">block</xsl:when>
            <xsl:when test="not((@cat and string(@cat)='comp-of') and (preceding-sibling::pntype[1][@cat='comp-of'])) and not((@cat and string(@cat)='NewMay') and (preceding-sibling::pntype[1][@cat='NewMay'])) and not((@cat and string(@cat)='rew') and (preceding-sibling::pntype[1][@cat='rew'])) and not((@cat and string(@cat)='field') and (preceding-sibling::pntype[1][@cat='field'])) and not((@cat and string(@cat)='use-with') and (preceding-sibling::pntype[1][@cat='use-with'])) and ((@cat and string(@cat)='comp-of') and (preceding-sibling::pntype[1][@cat!='comp-of']))">block</xsl:when>
            <xsl:when test="not((@cat and string(@cat)='comp-of') and (preceding-sibling::pntype[1][@cat='comp-of'])) and not((@cat and string(@cat)='NewMay') and (preceding-sibling::pntype[1][@cat='NewMay'])) and not((@cat and string(@cat)='rew') and (preceding-sibling::pntype[1][@cat='rew'])) and not((@cat and string(@cat)='field') and (preceding-sibling::pntype[1][@cat='field'])) and ((@cat and string(@cat)='use-with') and (preceding-sibling::pntype[1][@cat='use-with']))">inline</xsl:when>
            <xsl:when test="not((@cat and string(@cat)='comp-of') and (preceding-sibling::pntype[1][@cat='comp-of'])) and not((@cat and string(@cat)='NewMay') and (preceding-sibling::pntype[1][@cat='NewMay'])) and not((@cat and string(@cat)='rew') and (preceding-sibling::pntype[1][@cat='rew'])) and ((@cat and string(@cat)='field') and (preceding-sibling::pntype[1][@cat='field']))">inline</xsl:when>
            <xsl:when test="not((@cat and string(@cat)='comp-of') and (preceding-sibling::pntype[1][@cat='comp-of'])) and not((@cat and string(@cat)='NewMay') and (preceding-sibling::pntype[1][@cat='NewMay'])) and ((@cat and string(@cat)='rew') and (preceding-sibling::pntype[1][@cat='rew']))">inline</xsl:when>
            <xsl:when test="not((@cat and string(@cat)='comp-of') and (preceding-sibling::pntype[1][@cat='comp-of'])) and ((@cat and string(@cat)='NewMay') and (preceding-sibling::pntype[1][@cat='NewMay']))">inline</xsl:when>
            <xsl:when test="(@cat and string(@cat)='comp-of') and (preceding-sibling::pntype[1][@cat='comp-of'])">inline</xsl:when>
            <xsl:otherwise>block</xsl:otherwise>
         </xsl:choose>
      </xsl:variable>
      <xsl:variable name="blockness">
         <xsl:choose>
            <xsl:when test="not((@cat and string(@cat)='comp-of') and (preceding-sibling::pntype[1][@cat='comp-of'])) and not((@cat and string(@cat)='NewMay') and (preceding-sibling::pntype[1][@cat='NewMay'])) and not((@cat and string(@cat)='rew') and (preceding-sibling::pntype[1][@cat='rew'])) and not((@cat and string(@cat)='field') and (preceding-sibling::pntype[1][@cat='field'])) and ((@cat and string(@cat)='use-with') and (preceding-sibling::pntype[1][@cat='use-with']))">inline</xsl:when>
            <xsl:when test="not((@cat and string(@cat)='comp-of') and (preceding-sibling::pntype[1][@cat='comp-of'])) and not((@cat and string(@cat)='NewMay') and (preceding-sibling::pntype[1][@cat='NewMay'])) and not((@cat and string(@cat)='rew') and (preceding-sibling::pntype[1][@cat='rew'])) and ((@cat and string(@cat)='field') and (preceding-sibling::pntype[1][@cat='field']))">inline</xsl:when>
            <xsl:when test="not((@cat and string(@cat)='comp-of') and (preceding-sibling::pntype[1][@cat='comp-of'])) and not((@cat and string(@cat)='NewMay') and (preceding-sibling::pntype[1][@cat='NewMay'])) and ((@cat and string(@cat)='rew') and (preceding-sibling::pntype[1][@cat='rew']))">inline</xsl:when>
            <xsl:when test="not((@cat and string(@cat)='comp-of') and (preceding-sibling::pntype[1][@cat='comp-of'])) and ((@cat and string(@cat)='NewMay') and (preceding-sibling::pntype[1][@cat='NewMay']))">inline</xsl:when>
            <xsl:when test="(@cat and string(@cat)='comp-of') and (preceding-sibling::pntype[1][@cat='comp-of'])">inline</xsl:when>
            <xsl:otherwise>block</xsl:otherwise>
         </xsl:choose>
      </xsl:variable>
      <xsl:variable name="startnew"/>
      <xsl:variable name="newpageset">#noChange</xsl:variable>
      <xsl:variable name="fo-class">
         <xsl:choose>
            <xsl:when test="($foClass='block') and ($blockness='inline')">inline</xsl:when>
            <xsl:when test="($foClass='inline') and ($blockness='block')">block</xsl:when>
            <xsl:when test="true()"><!--This is the "otherwise" clause, but there may be no when's--><xsl:value-of select="$foClass"/>
            </xsl:when>
         </xsl:choose>
      </xsl:variable>
      <xsl:variable name="given-lre-override-name"/>
      <xsl:variable name="lre-override-name">
         <xsl:call-template name="determine-lre-override-name">
            <xsl:with-param name="given-lre-override-name" select="$given-lre-override-name"/>
            <xsl:with-param name="fo-class" select="$fo-class"/>
         </xsl:call-template>
      </xsl:variable>
      <!--Execute the appropriate code for the dynamically determined fo-class--><xsl:choose>
         <xsl:when test="$fo-class='block'">
            <div><!--Emit class values to reflect conditions--><xsl:attribute name="class">
                  <xsl:text> x-pntype-1-0</xsl:text>
                  <xsl:if test="(@cat and string(@cat)='comp-of') and (preceding-sibling::pntype[1][@cat='comp-of'])"> x-pntype-1-1</xsl:if>
                  <xsl:if test="not((@cat and string(@cat)='comp-of') and (preceding-sibling::pntype[1][@cat='comp-of'])) and ((@cat and string(@cat)='NewMay') and (preceding-sibling::pntype[1][@cat='NewMay']))"> x-pntype-1-2</xsl:if>
                  <xsl:if test="not((@cat and string(@cat)='comp-of') and (preceding-sibling::pntype[1][@cat='comp-of'])) and not((@cat and string(@cat)='NewMay') and (preceding-sibling::pntype[1][@cat='NewMay'])) and ((@cat and string(@cat)='rew') and (preceding-sibling::pntype[1][@cat='rew']))"> x-pntype-1-3</xsl:if>
                  <xsl:if test="not((@cat and string(@cat)='comp-of') and (preceding-sibling::pntype[1][@cat='comp-of'])) and not((@cat and string(@cat)='NewMay') and (preceding-sibling::pntype[1][@cat='NewMay'])) and not((@cat and string(@cat)='rew') and (preceding-sibling::pntype[1][@cat='rew'])) and ((@cat and string(@cat)='field') and (preceding-sibling::pntype[1][@cat='field']))"> x-pntype-1-4</xsl:if>
                  <xsl:if test="not((@cat and string(@cat)='comp-of') and (preceding-sibling::pntype[1][@cat='comp-of'])) and not((@cat and string(@cat)='NewMay') and (preceding-sibling::pntype[1][@cat='NewMay'])) and not((@cat and string(@cat)='rew') and (preceding-sibling::pntype[1][@cat='rew'])) and not((@cat and string(@cat)='field') and (preceding-sibling::pntype[1][@cat='field'])) and ((@cat and string(@cat)='use-with') and (preceding-sibling::pntype[1][@cat='use-with']))"> x-pntype-1-5</xsl:if>
                  <xsl:if test="not((@cat and string(@cat)='comp-of') and (preceding-sibling::pntype[1][@cat='comp-of'])) and not((@cat and string(@cat)='NewMay') and (preceding-sibling::pntype[1][@cat='NewMay'])) and not((@cat and string(@cat)='rew') and (preceding-sibling::pntype[1][@cat='rew'])) and not((@cat and string(@cat)='field') and (preceding-sibling::pntype[1][@cat='field'])) and not((@cat and string(@cat)='use-with') and (preceding-sibling::pntype[1][@cat='use-with'])) and ((@cat and string(@cat)='comp-of') and (preceding-sibling::pntype[1][@cat!='comp-of']))"> x-pntype-1-6</xsl:if>
                  <xsl:if test="not((@cat and string(@cat)='comp-of') and (preceding-sibling::pntype[1][@cat='comp-of'])) and not((@cat and string(@cat)='NewMay') and (preceding-sibling::pntype[1][@cat='NewMay'])) and not((@cat and string(@cat)='rew') and (preceding-sibling::pntype[1][@cat='rew'])) and not((@cat and string(@cat)='field') and (preceding-sibling::pntype[1][@cat='field'])) and not((@cat and string(@cat)='use-with') and (preceding-sibling::pntype[1][@cat='use-with'])) and not((@cat and string(@cat)='comp-of') and (preceding-sibling::pntype[1][@cat!='comp-of'])) and ((@cat and string(@cat)='NewMay') and (preceding-sibling::pntype[1][@cat!='NewMay']))"> x-pntype-1-7</xsl:if>
                  <xsl:if test="not((@cat and string(@cat)='comp-of') and (preceding-sibling::pntype[1][@cat='comp-of'])) and not((@cat and string(@cat)='NewMay') and (preceding-sibling::pntype[1][@cat='NewMay'])) and not((@cat and string(@cat)='rew') and (preceding-sibling::pntype[1][@cat='rew'])) and not((@cat and string(@cat)='field') and (preceding-sibling::pntype[1][@cat='field'])) and not((@cat and string(@cat)='use-with') and (preceding-sibling::pntype[1][@cat='use-with'])) and not((@cat and string(@cat)='comp-of') and (preceding-sibling::pntype[1][@cat!='comp-of'])) and not((@cat and string(@cat)='NewMay') and (preceding-sibling::pntype[1][@cat!='NewMay'])) and ((@cat and string(@cat)='rew') and (preceding-sibling::pntype[1][@cat!='rew']))"> x-pntype-1-8</xsl:if>
                  <xsl:if test="not((@cat and string(@cat)='comp-of') and (preceding-sibling::pntype[1][@cat='comp-of'])) and not((@cat and string(@cat)='NewMay') and (preceding-sibling::pntype[1][@cat='NewMay'])) and not((@cat and string(@cat)='rew') and (preceding-sibling::pntype[1][@cat='rew'])) and not((@cat and string(@cat)='field') and (preceding-sibling::pntype[1][@cat='field'])) and not((@cat and string(@cat)='use-with') and (preceding-sibling::pntype[1][@cat='use-with'])) and not((@cat and string(@cat)='comp-of') and (preceding-sibling::pntype[1][@cat!='comp-of'])) and not((@cat and string(@cat)='NewMay') and (preceding-sibling::pntype[1][@cat!='NewMay'])) and not((@cat and string(@cat)='rew') and (preceding-sibling::pntype[1][@cat!='rew'])) and ((@cat and string(@cat)='field') and (preceding-sibling::pntype[1][@cat!='field']))"> x-pntype-1-9</xsl:if>
                  <xsl:if test="not((@cat and string(@cat)='comp-of') and (preceding-sibling::pntype[1][@cat='comp-of'])) and not((@cat and string(@cat)='NewMay') and (preceding-sibling::pntype[1][@cat='NewMay'])) and not((@cat and string(@cat)='rew') and (preceding-sibling::pntype[1][@cat='rew'])) and not((@cat and string(@cat)='field') and (preceding-sibling::pntype[1][@cat='field'])) and not((@cat and string(@cat)='use-with') and (preceding-sibling::pntype[1][@cat='use-with'])) and not((@cat and string(@cat)='comp-of') and (preceding-sibling::pntype[1][@cat!='comp-of'])) and not((@cat and string(@cat)='NewMay') and (preceding-sibling::pntype[1][@cat!='NewMay'])) and not((@cat and string(@cat)='rew') and (preceding-sibling::pntype[1][@cat!='rew'])) and not((@cat and string(@cat)='field') and (preceding-sibling::pntype[1][@cat!='field'])) and ((@cat and string(@cat)='use-with') and (preceding-sibling::pntype[1][@cat!='use-with']))"> x-pntype-1-10</xsl:if>
               </xsl:attribute>
               <xsl:if test="@xml:lang">
                  <xsl:attribute name="lang">
                     <xsl:call-template name="return-lang-applying-language-map">
                        <xsl:with-param name="doclang" select="@xml:lang"/>
                     </xsl:call-template>
                  </xsl:attribute>
               </xsl:if>
               <xsl:copy-of select="@ch:*"/>
               <xsl:variable name="Breaks-chunkFilenameXPath"/>
               <xsl:variable name="Breaks-persistentFilename"/>
               <xsl:if test="($Breaks-persistentFilename='yes') and ($Breaks-chunkFilenameXPath!='')">
                  <xsl:variable name="chunkFilename"/>
                  <xsl:if test="$chunkFilename!=''">
                     <xsl:attribute name="ch:filename">
                        <xsl:value-of select="$chunkFilename"/>
                     </xsl:attribute>
                     <xsl:attribute name="ch:namepriority">0</xsl:attribute>
                  </xsl:if>
               </xsl:if>
               <xsl:if test="@xml:lang">
                  <xsl:attribute name="lang">
                     <xsl:call-template name="return-lang-applying-language-map">
                        <xsl:with-param name="doclang" select="@xml:lang"/>
                     </xsl:call-template>
                  </xsl:attribute>
               </xsl:if>
               <xsl:call-template name="maybe-set-id"/>
               <!--Process this element's content--><xsl:apply-templates/>
            </div>
         </xsl:when>
         <xsl:when test="$fo-class='inline'">
            <span><!--Emit class values to reflect conditions--><xsl:attribute name="class">
                  <xsl:text> x-pntype-1-0</xsl:text>
                  <xsl:if test="(@cat and string(@cat)='comp-of') and (preceding-sibling::pntype[1][@cat='comp-of'])"> x-pntype-1-1</xsl:if>
                  <xsl:if test="not((@cat and string(@cat)='comp-of') and (preceding-sibling::pntype[1][@cat='comp-of'])) and ((@cat and string(@cat)='NewMay') and (preceding-sibling::pntype[1][@cat='NewMay']))"> x-pntype-1-2</xsl:if>
                  <xsl:if test="not((@cat and string(@cat)='comp-of') and (preceding-sibling::pntype[1][@cat='comp-of'])) and not((@cat and string(@cat)='NewMay') and (preceding-sibling::pntype[1][@cat='NewMay'])) and ((@cat and string(@cat)='rew') and (preceding-sibling::pntype[1][@cat='rew']))"> x-pntype-1-3</xsl:if>
                  <xsl:if test="not((@cat and string(@cat)='comp-of') and (preceding-sibling::pntype[1][@cat='comp-of'])) and not((@cat and string(@cat)='NewMay') and (preceding-sibling::pntype[1][@cat='NewMay'])) and not((@cat and string(@cat)='rew') and (preceding-sibling::pntype[1][@cat='rew'])) and ((@cat and string(@cat)='field') and (preceding-sibling::pntype[1][@cat='field']))"> x-pntype-1-4</xsl:if>
                  <xsl:if test="not((@cat and string(@cat)='comp-of') and (preceding-sibling::pntype[1][@cat='comp-of'])) and not((@cat and string(@cat)='NewMay') and (preceding-sibling::pntype[1][@cat='NewMay'])) and not((@cat and string(@cat)='rew') and (preceding-sibling::pntype[1][@cat='rew'])) and not((@cat and string(@cat)='field') and (preceding-sibling::pntype[1][@cat='field'])) and ((@cat and string(@cat)='use-with') and (preceding-sibling::pntype[1][@cat='use-with']))"> x-pntype-1-5</xsl:if>
                  <xsl:if test="not((@cat and string(@cat)='comp-of') and (preceding-sibling::pntype[1][@cat='comp-of'])) and not((@cat and string(@cat)='NewMay') and (preceding-sibling::pntype[1][@cat='NewMay'])) and not((@cat and string(@cat)='rew') and (preceding-sibling::pntype[1][@cat='rew'])) and not((@cat and string(@cat)='field') and (preceding-sibling::pntype[1][@cat='field'])) and not((@cat and string(@cat)='use-with') and (preceding-sibling::pntype[1][@cat='use-with'])) and ((@cat and string(@cat)='comp-of') and (preceding-sibling::pntype[1][@cat!='comp-of']))"> x-pntype-1-6</xsl:if>
                  <xsl:if test="not((@cat and string(@cat)='comp-of') and (preceding-sibling::pntype[1][@cat='comp-of'])) and not((@cat and string(@cat)='NewMay') and (preceding-sibling::pntype[1][@cat='NewMay'])) and not((@cat and string(@cat)='rew') and (preceding-sibling::pntype[1][@cat='rew'])) and not((@cat and string(@cat)='field') and (preceding-sibling::pntype[1][@cat='field'])) and not((@cat and string(@cat)='use-with') and (preceding-sibling::pntype[1][@cat='use-with'])) and not((@cat and string(@cat)='comp-of') and (preceding-sibling::pntype[1][@cat!='comp-of'])) and ((@cat and string(@cat)='NewMay') and (preceding-sibling::pntype[1][@cat!='NewMay']))"> x-pntype-1-7</xsl:if>
                  <xsl:if test="not((@cat and string(@cat)='comp-of') and (preceding-sibling::pntype[1][@cat='comp-of'])) and not((@cat and string(@cat)='NewMay') and (preceding-sibling::pntype[1][@cat='NewMay'])) and not((@cat and string(@cat)='rew') and (preceding-sibling::pntype[1][@cat='rew'])) and not((@cat and string(@cat)='field') and (preceding-sibling::pntype[1][@cat='field'])) and not((@cat and string(@cat)='use-with') and (preceding-sibling::pntype[1][@cat='use-with'])) and not((@cat and string(@cat)='comp-of') and (preceding-sibling::pntype[1][@cat!='comp-of'])) and not((@cat and string(@cat)='NewMay') and (preceding-sibling::pntype[1][@cat!='NewMay'])) and ((@cat and string(@cat)='rew') and (preceding-sibling::pntype[1][@cat!='rew']))"> x-pntype-1-8</xsl:if>
                  <xsl:if test="not((@cat and string(@cat)='comp-of') and (preceding-sibling::pntype[1][@cat='comp-of'])) and not((@cat and string(@cat)='NewMay') and (preceding-sibling::pntype[1][@cat='NewMay'])) and not((@cat and string(@cat)='rew') and (preceding-sibling::pntype[1][@cat='rew'])) and not((@cat and string(@cat)='field') and (preceding-sibling::pntype[1][@cat='field'])) and not((@cat and string(@cat)='use-with') and (preceding-sibling::pntype[1][@cat='use-with'])) and not((@cat and string(@cat)='comp-of') and (preceding-sibling::pntype[1][@cat!='comp-of'])) and not((@cat and string(@cat)='NewMay') and (preceding-sibling::pntype[1][@cat!='NewMay'])) and not((@cat and string(@cat)='rew') and (preceding-sibling::pntype[1][@cat!='rew'])) and ((@cat and string(@cat)='field') and (preceding-sibling::pntype[1][@cat!='field']))"> x-pntype-1-9</xsl:if>
                  <xsl:if test="not((@cat and string(@cat)='comp-of') and (preceding-sibling::pntype[1][@cat='comp-of'])) and not((@cat and string(@cat)='NewMay') and (preceding-sibling::pntype[1][@cat='NewMay'])) and not((@cat and string(@cat)='rew') and (preceding-sibling::pntype[1][@cat='rew'])) and not((@cat and string(@cat)='field') and (preceding-sibling::pntype[1][@cat='field'])) and not((@cat and string(@cat)='use-with') and (preceding-sibling::pntype[1][@cat='use-with'])) and not((@cat and string(@cat)='comp-of') and (preceding-sibling::pntype[1][@cat!='comp-of'])) and not((@cat and string(@cat)='NewMay') and (preceding-sibling::pntype[1][@cat!='NewMay'])) and not((@cat and string(@cat)='rew') and (preceding-sibling::pntype[1][@cat!='rew'])) and not((@cat and string(@cat)='field') and (preceding-sibling::pntype[1][@cat!='field'])) and ((@cat and string(@cat)='use-with') and (preceding-sibling::pntype[1][@cat!='use-with']))"> x-pntype-1-10</xsl:if>
               </xsl:attribute>
               <xsl:if test="@xml:lang">
                  <xsl:attribute name="lang">
                     <xsl:call-template name="return-lang-applying-language-map">
                        <xsl:with-param name="doclang" select="@xml:lang"/>
                     </xsl:call-template>
                  </xsl:attribute>
               </xsl:if>
               <xsl:copy-of select="@ch:*"/>
               <xsl:variable name="Breaks-chunkFilenameXPath"/>
               <xsl:variable name="Breaks-persistentFilename"/>
               <xsl:if test="($Breaks-persistentFilename='yes') and ($Breaks-chunkFilenameXPath!='')">
                  <xsl:variable name="chunkFilename"/>
                  <xsl:if test="$chunkFilename!=''">
                     <xsl:attribute name="ch:filename">
                        <xsl:value-of select="$chunkFilename"/>
                     </xsl:attribute>
                     <xsl:attribute name="ch:namepriority">0</xsl:attribute>
                  </xsl:if>
               </xsl:if>
               <xsl:if test="@xml:lang">
                  <xsl:attribute name="lang">
                     <xsl:call-template name="return-lang-applying-language-map">
                        <xsl:with-param name="doclang" select="@xml:lang"/>
                     </xsl:call-template>
                  </xsl:attribute>
               </xsl:if>
               <xsl:call-template name="maybe-set-id"/>
               <!--Process this element's content--><xsl:apply-templates/>
            </span>
         </xsl:when>
      </xsl:choose>
   </xsl:template>

   <!--Gentext template for Context: pntype[position()>1]-->
<xsl:template match="pntype[position()&gt;1]" mode="expand-gentext" priority="1">
      <xsl:copy>
         <xsl:attribute name="_gte:Gentext-Expanded">y</xsl:attribute>
         <xsl:apply-templates select="@*" mode="expand-gentext"/>
         <xsl:if test="not(@_gte:id)">
            <xsl:attribute name="_gte:id">
               <xsl:value-of select="'_g_'"/>
               <xsl:value-of select="generate-id(.)"/>
            </xsl:attribute>
         </xsl:if>
         <xsl:choose>
            <xsl:when test="not((@cat and string(@cat)='comp-of') and (preceding-sibling::pntype[1][@cat='comp-of'])) and not((@cat and string(@cat)='NewMay') and (preceding-sibling::pntype[1][@cat='NewMay'])) and not((@cat and string(@cat)='rew') and (preceding-sibling::pntype[1][@cat='rew'])) and not((@cat and string(@cat)='field') and (preceding-sibling::pntype[1][@cat='field'])) and not((@cat and string(@cat)='use-with') and (preceding-sibling::pntype[1][@cat='use-with'])) and not((@cat and string(@cat)='comp-of') and (preceding-sibling::pntype[1][@cat!='comp-of'])) and not((@cat and string(@cat)='NewMay') and (preceding-sibling::pntype[1][@cat!='NewMay'])) and not((@cat and string(@cat)='rew') and (preceding-sibling::pntype[1][@cat!='rew'])) and not((@cat and string(@cat)='field') and (preceding-sibling::pntype[1][@cat!='field'])) and ((@cat and string(@cat)='use-with') and (preceding-sibling::pntype[1][@cat!='use-with']))"><!--AddBefore Condition #10--><xsl:if test="not(@_gte:Gentext-Expanded)">
                  <_gte:Must-Expand-Gentext/>
                  <_sfe:BeforeOrAfterText>
                     <xsl:text>use with P/N </xsl:text>
                  </_sfe:BeforeOrAfterText>
               </xsl:if>
            </xsl:when>
            <xsl:when test="not((@cat and string(@cat)='comp-of') and (preceding-sibling::pntype[1][@cat='comp-of'])) and not((@cat and string(@cat)='NewMay') and (preceding-sibling::pntype[1][@cat='NewMay'])) and not((@cat and string(@cat)='rew') and (preceding-sibling::pntype[1][@cat='rew'])) and not((@cat and string(@cat)='field') and (preceding-sibling::pntype[1][@cat='field'])) and not((@cat and string(@cat)='use-with') and (preceding-sibling::pntype[1][@cat='use-with'])) and not((@cat and string(@cat)='comp-of') and (preceding-sibling::pntype[1][@cat!='comp-of'])) and not((@cat and string(@cat)='NewMay') and (preceding-sibling::pntype[1][@cat!='NewMay'])) and not((@cat and string(@cat)='rew') and (preceding-sibling::pntype[1][@cat!='rew'])) and ((@cat and string(@cat)='field') and (preceding-sibling::pntype[1][@cat!='field']))"><!--AddBefore Condition #9--><xsl:if test="not(@_gte:Gentext-Expanded)">
                  <_gte:Must-Expand-Gentext/>
                  <_sfe:BeforeOrAfterText>
                     <xsl:text>Field reidentification P/N </xsl:text>
                  </_sfe:BeforeOrAfterText>
               </xsl:if>
            </xsl:when>
            <xsl:when test="not((@cat and string(@cat)='comp-of') and (preceding-sibling::pntype[1][@cat='comp-of'])) and not((@cat and string(@cat)='NewMay') and (preceding-sibling::pntype[1][@cat='NewMay'])) and not((@cat and string(@cat)='rew') and (preceding-sibling::pntype[1][@cat='rew'])) and not((@cat and string(@cat)='field') and (preceding-sibling::pntype[1][@cat='field'])) and not((@cat and string(@cat)='use-with') and (preceding-sibling::pntype[1][@cat='use-with'])) and not((@cat and string(@cat)='comp-of') and (preceding-sibling::pntype[1][@cat!='comp-of'])) and not((@cat and string(@cat)='NewMay') and (preceding-sibling::pntype[1][@cat!='NewMay'])) and ((@cat and string(@cat)='rew') and (preceding-sibling::pntype[1][@cat!='rew']))"><!--AddBefore Condition #8--><xsl:if test="not(@_gte:Gentext-Expanded)">
                  <_gte:Must-Expand-Gentext/>
                  <_sfe:BeforeOrAfterText>
                     <xsl:text>Reworked from P/N </xsl:text>
                  </_sfe:BeforeOrAfterText>
               </xsl:if>
            </xsl:when>
            <xsl:when test="not((@cat and string(@cat)='comp-of') and (preceding-sibling::pntype[1][@cat='comp-of'])) and not((@cat and string(@cat)='NewMay') and (preceding-sibling::pntype[1][@cat='NewMay'])) and not((@cat and string(@cat)='rew') and (preceding-sibling::pntype[1][@cat='rew'])) and not((@cat and string(@cat)='field') and (preceding-sibling::pntype[1][@cat='field'])) and not((@cat and string(@cat)='use-with') and (preceding-sibling::pntype[1][@cat='use-with'])) and not((@cat and string(@cat)='comp-of') and (preceding-sibling::pntype[1][@cat!='comp-of'])) and ((@cat and string(@cat)='NewMay') and (preceding-sibling::pntype[1][@cat!='NewMay']))"><!--AddBefore Condition #7--><xsl:if test="not(@_gte:Gentext-Expanded)">
                  <_gte:Must-Expand-Gentext/>
                  <_sfe:BeforeOrAfterText>
                     <xsl:text>May be obtained by rework of P/N </xsl:text>
                  </_sfe:BeforeOrAfterText>
               </xsl:if>
            </xsl:when>
            <xsl:when test="not((@cat and string(@cat)='comp-of') and (preceding-sibling::pntype[1][@cat='comp-of'])) and not((@cat and string(@cat)='NewMay') and (preceding-sibling::pntype[1][@cat='NewMay'])) and not((@cat and string(@cat)='rew') and (preceding-sibling::pntype[1][@cat='rew'])) and not((@cat and string(@cat)='field') and (preceding-sibling::pntype[1][@cat='field'])) and not((@cat and string(@cat)='use-with') and (preceding-sibling::pntype[1][@cat='use-with'])) and ((@cat and string(@cat)='comp-of') and (preceding-sibling::pntype[1][@cat!='comp-of']))"><!--AddBefore Condition #6--><xsl:if test="not(@_gte:Gentext-Expanded)">
                  <_gte:Must-Expand-Gentext/>
                  <_sfe:BeforeOrAfterText>
                     <xsl:text>component of P/N </xsl:text>
                  </_sfe:BeforeOrAfterText>
               </xsl:if>
            </xsl:when>
            <xsl:when test="not((@cat and string(@cat)='comp-of') and (preceding-sibling::pntype[1][@cat='comp-of'])) and not((@cat and string(@cat)='NewMay') and (preceding-sibling::pntype[1][@cat='NewMay'])) and not((@cat and string(@cat)='rew') and (preceding-sibling::pntype[1][@cat='rew'])) and not((@cat and string(@cat)='field') and (preceding-sibling::pntype[1][@cat='field'])) and ((@cat and string(@cat)='use-with') and (preceding-sibling::pntype[1][@cat='use-with']))"><!--AddBefore Condition #5--><xsl:if test="not(@_gte:Gentext-Expanded)">
                  <_gte:Must-Expand-Gentext/>
                  <_sfe:BeforeOrAfterText>
                     <xsl:text> AND </xsl:text>
                  </_sfe:BeforeOrAfterText>
               </xsl:if>
            </xsl:when>
            <xsl:when test="not((@cat and string(@cat)='comp-of') and (preceding-sibling::pntype[1][@cat='comp-of'])) and not((@cat and string(@cat)='NewMay') and (preceding-sibling::pntype[1][@cat='NewMay'])) and not((@cat and string(@cat)='rew') and (preceding-sibling::pntype[1][@cat='rew'])) and ((@cat and string(@cat)='field') and (preceding-sibling::pntype[1][@cat='field']))"><!--AddBefore Condition #4--><xsl:if test="not(@_gte:Gentext-Expanded)">
                  <_gte:Must-Expand-Gentext/>
                  <_sfe:BeforeOrAfterText>
                     <xsl:text> AND </xsl:text>
                  </_sfe:BeforeOrAfterText>
               </xsl:if>
            </xsl:when>
            <xsl:when test="not((@cat and string(@cat)='comp-of') and (preceding-sibling::pntype[1][@cat='comp-of'])) and not((@cat and string(@cat)='NewMay') and (preceding-sibling::pntype[1][@cat='NewMay'])) and ((@cat and string(@cat)='rew') and (preceding-sibling::pntype[1][@cat='rew']))"><!--AddBefore Condition #3--><xsl:if test="not(@_gte:Gentext-Expanded)">
                  <_gte:Must-Expand-Gentext/>
                  <_sfe:BeforeOrAfterText>
                     <xsl:text> OR </xsl:text>
                  </_sfe:BeforeOrAfterText>
               </xsl:if>
            </xsl:when>
            <xsl:when test="not((@cat and string(@cat)='comp-of') and (preceding-sibling::pntype[1][@cat='comp-of'])) and ((@cat and string(@cat)='NewMay') and (preceding-sibling::pntype[1][@cat='NewMay']))"><!--AddBefore Condition #2--><xsl:if test="not(@_gte:Gentext-Expanded)">
                  <_gte:Must-Expand-Gentext/>
                  <_sfe:BeforeOrAfterText>
                     <xsl:text> OR </xsl:text>
                  </_sfe:BeforeOrAfterText>
               </xsl:if>
            </xsl:when>
            <xsl:when test="(@cat and string(@cat)='comp-of') and (preceding-sibling::pntype[1][@cat='comp-of'])"><!--AddBefore Condition #1--><xsl:if test="not(@_gte:Gentext-Expanded)">
                  <_gte:Must-Expand-Gentext/>
                  <_sfe:BeforeOrAfterText>
                     <xsl:text> AND </xsl:text>
                  </_sfe:BeforeOrAfterText>
               </xsl:if>
            </xsl:when>
         </xsl:choose>
         <xsl:apply-templates select="* | text() | processing-instruction()" mode="expand-gentext"/>
      </xsl:copy>
   </xsl:template>

   <!--Initial pass template for Context: pntype[position()>1]-->
<xsl:template match="pntype[position()&gt;1]" mode="initial-pass-mode" priority="1">
      <xsl:copy>
         <xsl:call-template name="maybe-set-gte-id"/>
         <xsl:apply-templates select="@*|node()" mode="initial-pass-mode"/>
      </xsl:copy>
   </xsl:template>

   <!--Set count-as pass template for Context: pntype[position()>1]-->
<xsl:template match="pntype[position()&gt;1]" mode="set-countas" priority="1">
      <xsl:copy>
         <xsl:apply-templates select="@*|node()" mode="set-countas"/>
      </xsl:copy>
   </xsl:template>

   <!--Set ch:chunk template for Context: pntype[position()>1]-->
<xsl:template match="pntype[position()&gt;1]" mode="set-ch-chunk" priority="1">
      <xsl:copy>
         <xsl:if test="not(@_gte:did-set-chunk)">
            <xsl:variable name="Breaks-chunkBoundary"/>
            <xsl:if test="$Breaks-chunkBoundary = 'yes'">
               <xsl:attribute name="ch:chunk">yes</xsl:attribute>
            </xsl:if>
            <xsl:attribute name="_gte:did-set-chunk">yes</xsl:attribute>
         </xsl:if>
         <xsl:apply-templates select="@*|node()" mode="set-ch-chunk"/>
      </xsl:copy>
   </xsl:template>

   <!--Style template for Context: pntype-->
<xsl:template name="__style-for_pntype.2pnpepe62">
      <xsl:text> .x-pntype-2-0 {margin-left: 0pt; margin-right: 0pt; text-indent: 0pt; } .x-pntype-2-1 {} .x-pntype-2-2 {} .x-pntype-2-3 {} .x-pntype-2-4 {} .x-pntype-2-5 {}</xsl:text>
   </xsl:template>

   <!--Template for Context: pntype-->
<xsl:template match="pntype" priority="0">
      <xsl:variable name="foClass">block</xsl:variable>
      <xsl:variable name="blockness">block</xsl:variable>
      <xsl:variable name="startnew"/>
      <xsl:variable name="newpageset">#noChange</xsl:variable>
      <div><!--Emit class values to reflect conditions--><xsl:attribute name="class">
            <xsl:text> x-pntype-2-0</xsl:text>
            <xsl:if test="@cat and string(@cat)='comp-of'"> x-pntype-2-1</xsl:if>
            <xsl:if test="not(@cat and string(@cat)='comp-of') and (@cat and string(@cat)='NewMay')"> x-pntype-2-2</xsl:if>
            <xsl:if test="not(@cat and string(@cat)='comp-of') and not(@cat and string(@cat)='NewMay') and (@cat and string(@cat)='rew')"> x-pntype-2-3</xsl:if>
            <xsl:if test="not(@cat and string(@cat)='comp-of') and not(@cat and string(@cat)='NewMay') and not(@cat and string(@cat)='rew') and (@cat and string(@cat)='field')"> x-pntype-2-4</xsl:if>
            <xsl:if test="not(@cat and string(@cat)='comp-of') and not(@cat and string(@cat)='NewMay') and not(@cat and string(@cat)='rew') and not(@cat and string(@cat)='field') and (@cat and string(@cat)='use-with')"> x-pntype-2-5</xsl:if>
         </xsl:attribute>
         <xsl:if test="@xml:lang">
            <xsl:attribute name="lang">
               <xsl:call-template name="return-lang-applying-language-map">
                  <xsl:with-param name="doclang" select="@xml:lang"/>
               </xsl:call-template>
            </xsl:attribute>
         </xsl:if>
         <xsl:copy-of select="@ch:*"/>
         <xsl:variable name="Breaks-chunkFilenameXPath"/>
         <xsl:variable name="Breaks-persistentFilename"/>
         <xsl:if test="($Breaks-persistentFilename='yes') and ($Breaks-chunkFilenameXPath!='')">
            <xsl:variable name="chunkFilename"/>
            <xsl:if test="$chunkFilename!=''">
               <xsl:attribute name="ch:filename">
                  <xsl:value-of select="$chunkFilename"/>
               </xsl:attribute>
               <xsl:attribute name="ch:namepriority">0</xsl:attribute>
            </xsl:if>
         </xsl:if>
         <xsl:if test="@xml:lang">
            <xsl:attribute name="lang">
               <xsl:call-template name="return-lang-applying-language-map">
                  <xsl:with-param name="doclang" select="@xml:lang"/>
               </xsl:call-template>
            </xsl:attribute>
         </xsl:if>
         <xsl:call-template name="maybe-set-id"/>
         <!--Process this element's content--><xsl:apply-templates/>
      </div>
   </xsl:template>

   <!--Gentext template for Context: pntype-->
<xsl:template match="pntype" mode="expand-gentext" priority="0">
      <xsl:copy>
         <xsl:attribute name="_gte:Gentext-Expanded">y</xsl:attribute>
         <xsl:apply-templates select="@*" mode="expand-gentext"/>
         <xsl:if test="not(@_gte:id)">
            <xsl:attribute name="_gte:id">
               <xsl:value-of select="'_g_'"/>
               <xsl:value-of select="generate-id(.)"/>
            </xsl:attribute>
         </xsl:if>
         <xsl:choose>
            <xsl:when test="not(@cat and string(@cat)='comp-of') and not(@cat and string(@cat)='NewMay') and not(@cat and string(@cat)='rew') and not(@cat and string(@cat)='field') and (@cat and string(@cat)='use-with')"><!--AddBefore Condition #5--><xsl:if test="not(@_gte:Gentext-Expanded)">
                  <_gte:Must-Expand-Gentext/>
                  <_sfe:BeforeOrAfterText>
                     <xsl:text>use with P/N </xsl:text>
                  </_sfe:BeforeOrAfterText>
               </xsl:if>
            </xsl:when>
            <xsl:when test="not(@cat and string(@cat)='comp-of') and not(@cat and string(@cat)='NewMay') and not(@cat and string(@cat)='rew') and (@cat and string(@cat)='field')"><!--AddBefore Condition #4--><xsl:if test="not(@_gte:Gentext-Expanded)">
                  <_gte:Must-Expand-Gentext/>
                  <_sfe:BeforeOrAfterText>
                     <xsl:text>Field reidentification P/N </xsl:text>
                  </_sfe:BeforeOrAfterText>
               </xsl:if>
            </xsl:when>
            <xsl:when test="not(@cat and string(@cat)='comp-of') and not(@cat and string(@cat)='NewMay') and (@cat and string(@cat)='rew')"><!--AddBefore Condition #3--><xsl:if test="not(@_gte:Gentext-Expanded)">
                  <_gte:Must-Expand-Gentext/>
                  <_sfe:BeforeOrAfterText>
                     <xsl:text>Reworked from P/N </xsl:text>
                  </_sfe:BeforeOrAfterText>
               </xsl:if>
            </xsl:when>
            <xsl:when test="not(@cat and string(@cat)='comp-of') and (@cat and string(@cat)='NewMay')"><!--AddBefore Condition #2--><xsl:if test="not(@_gte:Gentext-Expanded)">
                  <_gte:Must-Expand-Gentext/>
                  <_sfe:BeforeOrAfterText>
                     <xsl:text>May be obtained by rework of P/N </xsl:text>
                  </_sfe:BeforeOrAfterText>
               </xsl:if>
            </xsl:when>
            <xsl:when test="@cat and string(@cat)='comp-of'"><!--AddBefore Condition #1--><xsl:if test="not(@_gte:Gentext-Expanded)">
                  <_gte:Must-Expand-Gentext/>
                  <_sfe:BeforeOrAfterText>
                     <xsl:text>component of P/N </xsl:text>
                  </_sfe:BeforeOrAfterText>
               </xsl:if>
            </xsl:when>
         </xsl:choose>
         <xsl:apply-templates select="* | text() | processing-instruction()" mode="expand-gentext"/>
      </xsl:copy>
   </xsl:template>

   <!--Initial pass template for Context: pntype-->
<xsl:template match="pntype" mode="initial-pass-mode" priority="0">
      <xsl:copy>
         <xsl:call-template name="maybe-set-gte-id"/>
         <xsl:apply-templates select="@*|node()" mode="initial-pass-mode"/>
      </xsl:copy>
   </xsl:template>

   <!--Set count-as pass template for Context: pntype-->
<xsl:template match="pntype" mode="set-countas" priority="0">
      <xsl:copy>
         <xsl:apply-templates select="@*|node()" mode="set-countas"/>
      </xsl:copy>
   </xsl:template>

   <!--Set ch:chunk template for Context: pntype-->
<xsl:template match="pntype" mode="set-ch-chunk" priority="0">
      <xsl:copy>
         <xsl:if test="not(@_gte:did-set-chunk)">
            <xsl:variable name="Breaks-chunkBoundary"/>
            <xsl:if test="$Breaks-chunkBoundary = 'yes'">
               <xsl:attribute name="ch:chunk">yes</xsl:attribute>
            </xsl:if>
            <xsl:attribute name="_gte:did-set-chunk">yes</xsl:attribute>
         </xsl:if>
         <xsl:apply-templates select="@*|node()" mode="set-ch-chunk"/>
      </xsl:copy>
   </xsl:template>

   <!--Style template for Context: pwc-pn-->
<xsl:template name="__style-for_pwc-pn.1">
      <xsl:text> .x-pwc-pn-1-0 {margin-left: 0pt; margin-right: 0pt; text-indent: 0pt; }</xsl:text>
   </xsl:template>

   <!--Template for Context: pwc-pn-->
<xsl:template match="pwc-pn" priority="0">
      <div><!--Emit class values to reflect conditions--><xsl:attribute name="class">
            <xsl:text> x-pwc-pn-1-0</xsl:text>
         </xsl:attribute>
         <xsl:if test="@xml:lang">
            <xsl:attribute name="lang">
               <xsl:call-template name="return-lang-applying-language-map">
                  <xsl:with-param name="doclang" select="@xml:lang"/>
               </xsl:call-template>
            </xsl:attribute>
         </xsl:if>
         <xsl:copy-of select="@ch:*"/>
         <xsl:if test="@xml:lang">
            <xsl:attribute name="lang">
               <xsl:call-template name="return-lang-applying-language-map">
                  <xsl:with-param name="doclang" select="@xml:lang"/>
               </xsl:call-template>
            </xsl:attribute>
         </xsl:if>
         <xsl:call-template name="maybe-set-id"/>
         <!--Process this element's content--><xsl:apply-templates/>
      </div>
   </xsl:template>

   <!--Gentext template for Context: pwc-pn-->
<xsl:template match="pwc-pn" mode="expand-gentext" priority="0">
      <xsl:copy>
         <xsl:attribute name="_gte:Gentext-Expanded">y</xsl:attribute>
         <xsl:apply-templates select="@*" mode="expand-gentext"/>
         <xsl:if test="not(@_gte:id)">
            <xsl:attribute name="_gte:id">
               <xsl:value-of select="'_g_'"/>
               <xsl:value-of select="generate-id(.)"/>
            </xsl:attribute>
         </xsl:if>
         <!--Unconditional AddBefore--><xsl:if test="not(@_gte:Gentext-Expanded)">
            <_gte:Must-Expand-Gentext/>
            <_sfe:BeforeOrAfterText>
               <xsl:text>P&amp;WC P/N: </xsl:text>
            </_sfe:BeforeOrAfterText>
         </xsl:if>
         <xsl:apply-templates select="* | text() | processing-instruction()" mode="expand-gentext"/>
      </xsl:copy>
   </xsl:template>

   <!--Initial pass template for Context: pwc-pn-->
<xsl:template match="pwc-pn" mode="initial-pass-mode" priority="0">
      <xsl:copy>
         <xsl:call-template name="maybe-set-gte-id"/>
         <xsl:apply-templates select="@*|node()" mode="initial-pass-mode"/>
      </xsl:copy>
   </xsl:template>

   <!--Set count-as pass template for Context: pwc-pn-->
<xsl:template match="pwc-pn" mode="set-countas" priority="0">
      <xsl:copy>
         <xsl:apply-templates select="@*|node()" mode="set-countas"/>
      </xsl:copy>
   </xsl:template>

   <!--Set ch:chunk template for Context: pwc-pn-->
<xsl:template match="pwc-pn" mode="set-ch-chunk" priority="0">
      <xsl:copy>
         <xsl:if test="not(@_gte:did-set-chunk)">
            <xsl:attribute name="_gte:did-set-chunk">yes</xsl:attribute>
         </xsl:if>
         <xsl:apply-templates select="@*|node()" mode="set-ch-chunk"/>
      </xsl:copy>
   </xsl:template>

   <!--Style template for Context: range-->
<xsl:template name="__style-for_range.1">
      <xsl:text> .x-range-1-0 {margin-left: 0pt; margin-right: 0pt; text-indent: 0pt; } .x-range-1-1 {}</xsl:text>
   </xsl:template>

   <!--Template for Context: range-->
<xsl:template match="range" priority="0">
      <xsl:param name="hidden" select="'yes'"/>
      <xsl:variable name="foClass">hidden-block</xsl:variable>
      <xsl:variable name="blockness">block</xsl:variable>
      <xsl:variable name="hiddenness">yes</xsl:variable>
      <xsl:variable name="startnew"/>
      <xsl:variable name="newpageset">#noChange</xsl:variable>
      <div><!--Emit class values to reflect conditions--><xsl:attribute name="class">
            <xsl:text> x-range-1-0</xsl:text>
            <xsl:if test="substring-before(.,&#34;,&#34;) != '0'"> x-range-1-1</xsl:if>
         </xsl:attribute>
         <xsl:if test="@xml:lang">
            <xsl:attribute name="lang">
               <xsl:call-template name="return-lang-applying-language-map">
                  <xsl:with-param name="doclang" select="@xml:lang"/>
               </xsl:call-template>
            </xsl:attribute>
         </xsl:if>
         <xsl:copy-of select="@ch:*"/>
         <xsl:variable name="Breaks-chunkFilenameXPath"/>
         <xsl:variable name="Breaks-persistentFilename"/>
         <xsl:if test="($Breaks-persistentFilename='yes') and ($Breaks-chunkFilenameXPath!='')">
            <xsl:variable name="chunkFilename"/>
            <xsl:if test="$chunkFilename!=''">
               <xsl:attribute name="ch:filename">
                  <xsl:value-of select="$chunkFilename"/>
               </xsl:attribute>
               <xsl:attribute name="ch:namepriority">0</xsl:attribute>
            </xsl:if>
         </xsl:if>
         <xsl:if test="@xml:lang">
            <xsl:attribute name="lang">
               <xsl:call-template name="return-lang-applying-language-map">
                  <xsl:with-param name="doclang" select="@xml:lang"/>
               </xsl:call-template>
            </xsl:attribute>
         </xsl:if>
         <xsl:call-template name="maybe-set-id"/>
         <!--Suppress element contents (but not gentext) unless unhidden--><xsl:choose>
            <xsl:when test="$hidden='no'">
               <xsl:apply-templates/>
            </xsl:when>
            <xsl:otherwise>
               <xsl:apply-templates select="_sfe:BeforeOrAfterText"/>
            </xsl:otherwise>
         </xsl:choose>
      </div>
   </xsl:template>

   <!--Gentext template for Context: range-->
<xsl:template match="range" mode="expand-gentext" priority="0">
      <xsl:copy>
         <xsl:attribute name="_gte:Gentext-Expanded">y</xsl:attribute>
         <xsl:apply-templates select="@*" mode="expand-gentext"/>
         <xsl:if test="not(@_gte:id)">
            <xsl:attribute name="_gte:id">
               <xsl:value-of select="'_g_'"/>
               <xsl:value-of select="generate-id(.)"/>
            </xsl:attribute>
         </xsl:if>
         <xsl:choose>
            <xsl:when test="substring-before(.,&#34;,&#34;) != '0'"><!--AddBefore Condition #1--><xsl:if test="not(@_gte:Gentext-Expanded)">
                  <_gte:Must-Expand-Gentext/>
                  <_sfe:BeforeOrAfterText>
                     <xsl:text>USE </xsl:text>
                     <xsl:value-of select="string(substring-before(.,&#34;,&#34;))"/>
                     <xsl:text> MIN
TO </xsl:text>
                     <xsl:value-of select="string(substring-after(.,&#34;,&#34;))"/>
                     <xsl:text> MAX.</xsl:text>
                  </_sfe:BeforeOrAfterText>
               </xsl:if>
            </xsl:when>
            <xsl:otherwise>
               <xsl:if test="not(@_gte:Gentext-Expanded)">
                  <_gte:Must-Expand-Gentext/>
                  <_sfe:BeforeOrAfterText>
                     <xsl:text>USE </xsl:text>
                     <xsl:value-of select="string(substring-before(.,&#34;,&#34;))"/>
                     <xsl:text> TO </xsl:text>
                     <xsl:value-of select="string(substring-after(.,&#34;,&#34;))"/>
                     <xsl:text> MAX.</xsl:text>
                  </_sfe:BeforeOrAfterText>
               </xsl:if>
            </xsl:otherwise>
         </xsl:choose>
         <xsl:apply-templates select="* | text() | processing-instruction()" mode="expand-gentext"/>
      </xsl:copy>
   </xsl:template>

   <!--Initial pass template for Context: range-->
<xsl:template match="range" mode="initial-pass-mode" priority="0">
      <xsl:copy>
         <xsl:call-template name="maybe-set-gte-id"/>
         <xsl:apply-templates select="@*|node()" mode="initial-pass-mode"/>
      </xsl:copy>
   </xsl:template>

   <!--Set count-as pass template for Context: range-->
<xsl:template match="range" mode="set-countas" priority="0">
      <xsl:copy>
         <xsl:apply-templates select="@*|node()" mode="set-countas"/>
      </xsl:copy>
   </xsl:template>

   <!--Set ch:chunk template for Context: range-->
<xsl:template match="range" mode="set-ch-chunk" priority="0">
      <xsl:copy>
         <xsl:if test="not(@_gte:did-set-chunk)">
            <xsl:variable name="Breaks-chunkBoundary"/>
            <xsl:if test="$Breaks-chunkBoundary = 'yes'">
               <xsl:attribute name="ch:chunk">yes</xsl:attribute>
            </xsl:if>
            <xsl:attribute name="_gte:did-set-chunk">yes</xsl:attribute>
         </xsl:if>
         <xsl:apply-templates select="@*|node()" mode="set-ch-chunk"/>
      </xsl:copy>
   </xsl:template>

   <!--Collect footnote template for Context: range-->
<xsl:template match="range" mode="styler-collect-footnotes" priority="0">
      <xsl:apply-templates select="_sfe:BeforeOrAfterText/*" mode="styler-collect-footnotes"/>
   </xsl:template>

   <!--Style template for Context: atidlm:resourcepair-->
<xsl:template name="__style-for_atidlm-resourcepair.1">
      <xsl:text> .x-atidlm-resourcepair-1-0 {margin-left: 0pt; margin-right: 0pt; text-indent: 0pt; }</xsl:text>
   </xsl:template>

   <!--Template for Context: atidlm:resourcepair-->
<xsl:template match="atidlm:resourcepair" priority="0">
      <span><!--Emit class values to reflect conditions--><xsl:attribute name="class">
            <xsl:text> x-atidlm-resourcepair-1-0</xsl:text>
         </xsl:attribute>
         <xsl:if test="@xml:lang">
            <xsl:attribute name="lang">
               <xsl:call-template name="return-lang-applying-language-map">
                  <xsl:with-param name="doclang" select="@xml:lang"/>
               </xsl:call-template>
            </xsl:attribute>
         </xsl:if>
         <xsl:copy-of select="@ch:*"/>
         <xsl:if test="@xml:lang">
            <xsl:attribute name="lang">
               <xsl:call-template name="return-lang-applying-language-map">
                  <xsl:with-param name="doclang" select="@xml:lang"/>
               </xsl:call-template>
            </xsl:attribute>
         </xsl:if>
         <xsl:call-template name="maybe-set-id"/>
         <!--Process this element's content--><xsl:apply-templates/>
      </span>
   </xsl:template>

   <!--Gentext template for Context: atidlm:resourcepair-->
<xsl:template match="atidlm:resourcepair" mode="expand-gentext" priority="0">
      <xsl:copy>
         <xsl:apply-templates select="@*|node()" mode="expand-gentext"/>
      </xsl:copy>
   </xsl:template>

   <!--Initial pass template for Context: atidlm:resourcepair-->
<xsl:template match="atidlm:resourcepair" mode="initial-pass-mode" priority="0">
      <xsl:copy>
         <xsl:call-template name="maybe-set-gte-id"/>
         <xsl:apply-templates select="@*|node()" mode="initial-pass-mode"/>
      </xsl:copy>
   </xsl:template>

   <!--Set count-as pass template for Context: atidlm:resourcepair-->
<xsl:template match="atidlm:resourcepair" mode="set-countas" priority="0">
      <xsl:copy>
         <xsl:apply-templates select="@*|node()" mode="set-countas"/>
      </xsl:copy>
   </xsl:template>

   <!--Set ch:chunk template for Context: atidlm:resourcepair-->
<xsl:template match="atidlm:resourcepair" mode="set-ch-chunk" priority="0">
      <xsl:copy>
         <xsl:if test="not(@_gte:did-set-chunk)">
            <xsl:attribute name="_gte:did-set-chunk">yes</xsl:attribute>
         </xsl:if>
         <xsl:apply-templates select="@*|node()" mode="set-ch-chunk"/>
      </xsl:copy>
   </xsl:template>

   <!--Style template for Context: nomen-col/sb-stat[@type='SPB']-->
<xsl:template name="__style-for_sb-stat.4non-at301">
      <xsl:text> .x-sb-stat-1-0 {margin-left: 0pt; margin-right: 0pt; text-indent: 0pt; color: #0000FF; text-decoration: underline ; text-decoration: underline ; } .x-sb-stat-1-1 {} .x-sb-stat-1-2 {} .x-sb-stat-1-3 {} .x-sb-stat-1-4 {} .x-sb-stat-1-5 {}</xsl:text>
   </xsl:template>

   <!--Template for Context: nomen-col/sb-stat[@type='SPB']-->
<xsl:template match="nomen-col/sb-stat[@type='SPB']" priority="3">
      <xsl:param name="hidden" select="'yes'"/>
      <xsl:variable name="foClass">hidden-block</xsl:variable>
      <xsl:variable name="blockness">block</xsl:variable>
      <xsl:variable name="hiddenness">yes</xsl:variable>
      <xsl:variable name="startnew"/>
      <xsl:variable name="newpageset">#noChange</xsl:variable>
      <div><!--Emit class values to reflect conditions--><xsl:attribute name="class">
            <xsl:text> x-sb-stat-1-0</xsl:text>
            <xsl:if test="ancestor::entry/preceding-sibling::entry[2]/*[name()='part-nbr']/@indent='0'"> x-sb-stat-1-1</xsl:if>
            <xsl:if test="not(ancestor::entry/preceding-sibling::entry[2]/*[name()='part-nbr']/@indent='0') and (ancestor::entry/preceding-sibling::entry[2]/*[name()='part-nbr']/@indent='1')"> x-sb-stat-1-2</xsl:if>
            <xsl:if test="not(ancestor::entry/preceding-sibling::entry[2]/*[name()='part-nbr']/@indent='0') and not(ancestor::entry/preceding-sibling::entry[2]/*[name()='part-nbr']/@indent='1') and (ancestor::entry/preceding-sibling::entry[2]/*[name()='part-nbr']/@indent='2')"> x-sb-stat-1-3</xsl:if>
            <xsl:if test="not(ancestor::entry/preceding-sibling::entry[2]/*[name()='part-nbr']/@indent='0') and not(ancestor::entry/preceding-sibling::entry[2]/*[name()='part-nbr']/@indent='1') and not(ancestor::entry/preceding-sibling::entry[2]/*[name()='part-nbr']/@indent='2') and (ancestor::entry/preceding-sibling::entry[2]/*[name()='part-nbr']/@indent='3')"> x-sb-stat-1-4</xsl:if>
            <xsl:if test="not(ancestor::entry/preceding-sibling::entry[2]/*[name()='part-nbr']/@indent='0') and not(ancestor::entry/preceding-sibling::entry[2]/*[name()='part-nbr']/@indent='1') and not(ancestor::entry/preceding-sibling::entry[2]/*[name()='part-nbr']/@indent='2') and not(ancestor::entry/preceding-sibling::entry[2]/*[name()='part-nbr']/@indent='3') and (ancestor::entry/preceding-sibling::entry[2]/*[name()='part-nbr']/@indent='4')"> x-sb-stat-1-5</xsl:if>
         </xsl:attribute>
         <xsl:if test="@xml:lang">
            <xsl:attribute name="lang">
               <xsl:call-template name="return-lang-applying-language-map">
                  <xsl:with-param name="doclang" select="@xml:lang"/>
               </xsl:call-template>
            </xsl:attribute>
         </xsl:if>
         <xsl:copy-of select="@ch:*"/>
         <xsl:variable name="Breaks-chunkFilenameXPath"/>
         <xsl:variable name="Breaks-persistentFilename"/>
         <xsl:if test="($Breaks-persistentFilename='yes') and ($Breaks-chunkFilenameXPath!='')">
            <xsl:variable name="chunkFilename"/>
            <xsl:if test="$chunkFilename!=''">
               <xsl:attribute name="ch:filename">
                  <xsl:value-of select="$chunkFilename"/>
               </xsl:attribute>
               <xsl:attribute name="ch:namepriority">0</xsl:attribute>
            </xsl:if>
         </xsl:if>
         <xsl:if test="@xml:lang">
            <xsl:attribute name="lang">
               <xsl:call-template name="return-lang-applying-language-map">
                  <xsl:with-param name="doclang" select="@xml:lang"/>
               </xsl:call-template>
            </xsl:attribute>
         </xsl:if>
         <xsl:call-template name="maybe-set-id"/>
         <!--Suppress element contents (but not gentext) unless unhidden--><xsl:choose>
            <xsl:when test="$hidden='no'">
               <xsl:apply-templates/>
            </xsl:when>
            <xsl:otherwise>
               <xsl:apply-templates select="_sfe:BeforeOrAfterText"/>
            </xsl:otherwise>
         </xsl:choose>
      </div>
   </xsl:template>

   <!--Gentext template for Context: nomen-col/sb-stat[@type='SPB']-->
<xsl:template match="nomen-col/sb-stat[@type='SPB']" mode="expand-gentext" priority="3">
      <xsl:copy>
         <xsl:attribute name="_gte:Gentext-Expanded">y</xsl:attribute>
         <xsl:apply-templates select="@*" mode="expand-gentext"/>
         <xsl:if test="not(@_gte:id)">
            <xsl:attribute name="_gte:id">
               <xsl:value-of select="'_g_'"/>
               <xsl:value-of select="generate-id(.)"/>
            </xsl:attribute>
         </xsl:if>
         <xsl:choose>
            <xsl:when test="not(ancestor::entry/preceding-sibling::entry[2]/*[name()='part-nbr']/@indent='0') and not(ancestor::entry/preceding-sibling::entry[2]/*[name()='part-nbr']/@indent='1') and not(ancestor::entry/preceding-sibling::entry[2]/*[name()='part-nbr']/@indent='2') and not(ancestor::entry/preceding-sibling::entry[2]/*[name()='part-nbr']/@indent='3') and (ancestor::entry/preceding-sibling::entry[2]/*[name()='part-nbr']/@indent='4')"><!--AddBefore Condition #5--><xsl:if test="not(@_gte:Gentext-Expanded)">
                  <_gte:Must-Expand-Gentext/>
                  <_sfe:BeforeOrAfterText>
                     <_ufe:block-nospace/>
                     <xsl:processing-instruction name="Pub">_hardspace</xsl:processing-instruction>
                     <xsl:processing-instruction name="Pub">_hardspace</xsl:processing-instruction>
                     <xsl:processing-instruction name="Pub">_hardspace</xsl:processing-instruction>
                     <xsl:processing-instruction name="Pub">_hardspace</xsl:processing-instruction>
                     <xsl:processing-instruction name="Pub">_hardspace</xsl:processing-instruction>
                     <xsl:processing-instruction name="Pub">_hardspace</xsl:processing-instruction>
                     <xsl:value-of select="@cond"/>
                     <xsl:text>-</xsl:text>
                     <xsl:value-of select="string(substring-before(., ','))"/>
                     <xsl:text> </xsl:text>
                     <xsl:value-of select="@type"/>
                     <xsl:text> NO. </xsl:text>
                     <xsl:value-of select="string(substring-after(., ','))"/>
                  </_sfe:BeforeOrAfterText>
               </xsl:if>
            </xsl:when>
            <xsl:when test="not(ancestor::entry/preceding-sibling::entry[2]/*[name()='part-nbr']/@indent='0') and not(ancestor::entry/preceding-sibling::entry[2]/*[name()='part-nbr']/@indent='1') and not(ancestor::entry/preceding-sibling::entry[2]/*[name()='part-nbr']/@indent='2') and (ancestor::entry/preceding-sibling::entry[2]/*[name()='part-nbr']/@indent='3')"><!--AddBefore Condition #4--><xsl:if test="not(@_gte:Gentext-Expanded)">
                  <_gte:Must-Expand-Gentext/>
                  <_sfe:BeforeOrAfterText>
                     <_ufe:block-nospace/>
                     <xsl:processing-instruction name="Pub">_hardspace</xsl:processing-instruction>
                     <xsl:processing-instruction name="Pub">_hardspace</xsl:processing-instruction>
                     <xsl:processing-instruction name="Pub">_hardspace</xsl:processing-instruction>
                     <xsl:processing-instruction name="Pub">_hardspace</xsl:processing-instruction>
                     <xsl:processing-instruction name="Pub">_hardspace</xsl:processing-instruction>
                     <xsl:value-of select="@cond"/>
                     <xsl:text>-</xsl:text>
                     <xsl:value-of select="string(substring-before(., ','))"/>
                     <xsl:text> </xsl:text>
                     <xsl:value-of select="@type"/>
                     <xsl:text> NO. </xsl:text>
                     <xsl:value-of select="string(substring-after(., ','))"/>
                  </_sfe:BeforeOrAfterText>
               </xsl:if>
            </xsl:when>
            <xsl:when test="not(ancestor::entry/preceding-sibling::entry[2]/*[name()='part-nbr']/@indent='0') and not(ancestor::entry/preceding-sibling::entry[2]/*[name()='part-nbr']/@indent='1') and (ancestor::entry/preceding-sibling::entry[2]/*[name()='part-nbr']/@indent='2')"><!--AddBefore Condition #3--><xsl:if test="not(@_gte:Gentext-Expanded)">
                  <_gte:Must-Expand-Gentext/>
                  <_sfe:BeforeOrAfterText>
                     <_ufe:block-nospace/>
                     <xsl:processing-instruction name="Pub">_hardspace</xsl:processing-instruction>
                     <xsl:processing-instruction name="Pub">_hardspace</xsl:processing-instruction>
                     <xsl:processing-instruction name="Pub">_hardspace</xsl:processing-instruction>
                     <xsl:processing-instruction name="Pub">_hardspace</xsl:processing-instruction>
                     <xsl:value-of select="@cond"/>
                     <xsl:text>-</xsl:text>
                     <xsl:value-of select="string(substring-before(., ','))"/>
                     <xsl:text> </xsl:text>
                     <xsl:value-of select="@type"/>
                     <xsl:text> NO. </xsl:text>
                     <xsl:value-of select="string(substring-after(., ','))"/>
                  </_sfe:BeforeOrAfterText>
               </xsl:if>
            </xsl:when>
            <xsl:when test="not(ancestor::entry/preceding-sibling::entry[2]/*[name()='part-nbr']/@indent='0') and (ancestor::entry/preceding-sibling::entry[2]/*[name()='part-nbr']/@indent='1')"><!--AddBefore Condition #2--><xsl:if test="not(@_gte:Gentext-Expanded)">
                  <_gte:Must-Expand-Gentext/>
                  <_sfe:BeforeOrAfterText>
                     <_ufe:block-nospace/>
                     <xsl:processing-instruction name="Pub">_hardspace</xsl:processing-instruction>
                     <xsl:processing-instruction name="Pub">_hardspace</xsl:processing-instruction>
                     <xsl:processing-instruction name="Pub">_hardspace</xsl:processing-instruction>
                     <xsl:value-of select="@cond"/>
                     <xsl:text>-</xsl:text>
                     <xsl:value-of select="string(substring-before(., ','))"/>
                     <xsl:text> </xsl:text>
                     <xsl:value-of select="@type"/>
                     <xsl:text> NO. </xsl:text>
                     <xsl:value-of select="string(substring-after(., ','))"/>
                  </_sfe:BeforeOrAfterText>
               </xsl:if>
            </xsl:when>
            <xsl:when test="ancestor::entry/preceding-sibling::entry[2]/*[name()='part-nbr']/@indent='0'"><!--AddBefore Condition #1--><xsl:if test="not(@_gte:Gentext-Expanded)">
                  <_gte:Must-Expand-Gentext/>
                  <_sfe:BeforeOrAfterText>
                     <_ufe:block-nospace/>
                     <xsl:value-of select="@cond"/>
                     <xsl:text>-</xsl:text>
                     <xsl:value-of select="string(substring-before(., ','))"/>
                     <xsl:text> </xsl:text>
                     <xsl:value-of select="@type"/>
                     <xsl:text> NO. </xsl:text>
                     <xsl:value-of select="string(substring-after(., ','))"/>
                  </_sfe:BeforeOrAfterText>
               </xsl:if>
            </xsl:when>
            <xsl:otherwise>
               <xsl:if test="not(@_gte:Gentext-Expanded)">
                  <_gte:Must-Expand-Gentext/>
                  <_sfe:BeforeOrAfterText>
                     <_ufe:block-nospace/>
                     <xsl:value-of select="@cond"/>
                     <xsl:text>-</xsl:text>
                     <xsl:value-of select="string(substring-before(., ','))"/>
                     <xsl:text> </xsl:text>
                     <xsl:value-of select="@type"/>
                     <xsl:text> NO. </xsl:text>
                     <xsl:value-of select="string(substring-after(., ','))"/>
                  </_sfe:BeforeOrAfterText>
               </xsl:if>
            </xsl:otherwise>
         </xsl:choose>
         <xsl:apply-templates select="* | text() | processing-instruction()" mode="expand-gentext"/>
      </xsl:copy>
   </xsl:template>

   <!--Initial pass template for Context: nomen-col/sb-stat[@type='SPB']-->
<xsl:template match="nomen-col/sb-stat[@type='SPB']" mode="initial-pass-mode" priority="3">
      <xsl:copy>
         <xsl:call-template name="maybe-set-gte-id"/>
         <xsl:apply-templates select="@*|node()" mode="initial-pass-mode"/>
      </xsl:copy>
   </xsl:template>

   <!--Set count-as pass template for Context: nomen-col/sb-stat[@type='SPB']-->
<xsl:template match="nomen-col/sb-stat[@type='SPB']" mode="set-countas" priority="3">
      <xsl:copy>
         <xsl:apply-templates select="@*|node()" mode="set-countas"/>
      </xsl:copy>
   </xsl:template>

   <!--Set ch:chunk template for Context: nomen-col/sb-stat[@type='SPB']-->
<xsl:template match="nomen-col/sb-stat[@type='SPB']" mode="set-ch-chunk" priority="3">
      <xsl:copy>
         <xsl:if test="not(@_gte:did-set-chunk)">
            <xsl:variable name="Breaks-chunkBoundary"/>
            <xsl:if test="$Breaks-chunkBoundary = 'yes'">
               <xsl:attribute name="ch:chunk">yes</xsl:attribute>
            </xsl:if>
            <xsl:attribute name="_gte:did-set-chunk">yes</xsl:attribute>
         </xsl:if>
         <xsl:apply-templates select="@*|node()" mode="set-ch-chunk"/>
      </xsl:copy>
   </xsl:template>

   <!--Collect footnote template for Context: nomen-col/sb-stat[@type='SPB']-->
<xsl:template match="nomen-col/sb-stat[@type='SPB']" mode="styler-collect-footnotes"
                 priority="3">
      <xsl:apply-templates select="_sfe:BeforeOrAfterText/*" mode="styler-collect-footnotes"/>
   </xsl:template>

   <!--Style template for Context: nomen-col/sb-stat-->
<xsl:template name="__style-for_sb-stat.4non-at172">
      <xsl:text> .x-sb-stat-2-0 {margin-left: 0pt; margin-right: 0pt; text-indent: 0pt; color: #0000FF; text-decoration: underline ; text-decoration: underline ; } .x-sb-stat-2-1 {} .x-sb-stat-2-2 {} .x-sb-stat-2-3 {} .x-sb-stat-2-4 {} .x-sb-stat-2-5 {}</xsl:text>
   </xsl:template>

   <!--Template for Context: nomen-col/sb-stat-->
<xsl:template match="nomen-col/sb-stat" priority="2">
      <xsl:variable name="foClass">block</xsl:variable>
      <xsl:variable name="blockness">block</xsl:variable>
      <xsl:variable name="startnew"/>
      <xsl:variable name="newpageset">#noChange</xsl:variable>
      <div><!--Emit class values to reflect conditions--><xsl:attribute name="class">
            <xsl:text> x-sb-stat-2-0</xsl:text>
            <xsl:if test="ancestor::entry/preceding-sibling::entry[2]/*[name()='part-nbr']/@indent='0'"> x-sb-stat-2-1</xsl:if>
            <xsl:if test="not(ancestor::entry/preceding-sibling::entry[2]/*[name()='part-nbr']/@indent='0') and (ancestor::entry/preceding-sibling::entry[2]/*[name()='part-nbr']/@indent='1')"> x-sb-stat-2-2</xsl:if>
            <xsl:if test="not(ancestor::entry/preceding-sibling::entry[2]/*[name()='part-nbr']/@indent='0') and not(ancestor::entry/preceding-sibling::entry[2]/*[name()='part-nbr']/@indent='1') and (ancestor::entry/preceding-sibling::entry[2]/*[name()='part-nbr']/@indent='2')"> x-sb-stat-2-3</xsl:if>
            <xsl:if test="not(ancestor::entry/preceding-sibling::entry[2]/*[name()='part-nbr']/@indent='0') and not(ancestor::entry/preceding-sibling::entry[2]/*[name()='part-nbr']/@indent='1') and not(ancestor::entry/preceding-sibling::entry[2]/*[name()='part-nbr']/@indent='2') and (ancestor::entry/preceding-sibling::entry[2]/*[name()='part-nbr']/@indent='3')"> x-sb-stat-2-4</xsl:if>
            <xsl:if test="not(ancestor::entry/preceding-sibling::entry[2]/*[name()='part-nbr']/@indent='0') and not(ancestor::entry/preceding-sibling::entry[2]/*[name()='part-nbr']/@indent='1') and not(ancestor::entry/preceding-sibling::entry[2]/*[name()='part-nbr']/@indent='2') and not(ancestor::entry/preceding-sibling::entry[2]/*[name()='part-nbr']/@indent='3') and (ancestor::entry/preceding-sibling::entry[2]/*[name()='part-nbr']/@indent='4')"> x-sb-stat-2-5</xsl:if>
         </xsl:attribute>
         <xsl:if test="@xml:lang">
            <xsl:attribute name="lang">
               <xsl:call-template name="return-lang-applying-language-map">
                  <xsl:with-param name="doclang" select="@xml:lang"/>
               </xsl:call-template>
            </xsl:attribute>
         </xsl:if>
         <xsl:copy-of select="@ch:*"/>
         <xsl:variable name="Breaks-chunkFilenameXPath"/>
         <xsl:variable name="Breaks-persistentFilename"/>
         <xsl:if test="($Breaks-persistentFilename='yes') and ($Breaks-chunkFilenameXPath!='')">
            <xsl:variable name="chunkFilename"/>
            <xsl:if test="$chunkFilename!=''">
               <xsl:attribute name="ch:filename">
                  <xsl:value-of select="$chunkFilename"/>
               </xsl:attribute>
               <xsl:attribute name="ch:namepriority">0</xsl:attribute>
            </xsl:if>
         </xsl:if>
         <xsl:if test="@xml:lang">
            <xsl:attribute name="lang">
               <xsl:call-template name="return-lang-applying-language-map">
                  <xsl:with-param name="doclang" select="@xml:lang"/>
               </xsl:call-template>
            </xsl:attribute>
         </xsl:if>
         <xsl:call-template name="maybe-set-id"/>
         <!--Process this element's content--><xsl:apply-templates/>
      </div>
   </xsl:template>

   <!--Gentext template for Context: nomen-col/sb-stat-->
<xsl:template match="nomen-col/sb-stat" mode="expand-gentext" priority="2">
      <xsl:copy>
         <xsl:attribute name="_gte:Gentext-Expanded">y</xsl:attribute>
         <xsl:apply-templates select="@*" mode="expand-gentext"/>
         <xsl:if test="not(@_gte:id)">
            <xsl:attribute name="_gte:id">
               <xsl:value-of select="'_g_'"/>
               <xsl:value-of select="generate-id(.)"/>
            </xsl:attribute>
         </xsl:if>
         <xsl:choose>
            <xsl:when test="not(ancestor::entry/preceding-sibling::entry[2]/*[name()='part-nbr']/@indent='0') and not(ancestor::entry/preceding-sibling::entry[2]/*[name()='part-nbr']/@indent='1') and not(ancestor::entry/preceding-sibling::entry[2]/*[name()='part-nbr']/@indent='2') and not(ancestor::entry/preceding-sibling::entry[2]/*[name()='part-nbr']/@indent='3') and (ancestor::entry/preceding-sibling::entry[2]/*[name()='part-nbr']/@indent='4')"><!--AddBefore Condition #5--><xsl:if test="not(@_gte:Gentext-Expanded)">
                  <_gte:Must-Expand-Gentext/>
                  <_sfe:BeforeOrAfterText>
                     <_ufe:block-nospace/>
                     <xsl:processing-instruction name="Pub">_hardspace</xsl:processing-instruction>
                     <xsl:processing-instruction name="Pub">_hardspace</xsl:processing-instruction>
                     <xsl:processing-instruction name="Pub">_hardspace</xsl:processing-instruction>
                     <xsl:processing-instruction name="Pub">_hardspace</xsl:processing-instruction>
                     <xsl:processing-instruction name="Pub">_hardspace</xsl:processing-instruction>
                     <xsl:processing-instruction name="Pub">_hardspace</xsl:processing-instruction>
                     <xsl:value-of select="@cond"/>
                     <xsl:text>-</xsl:text>
                     <xsl:value-of select="@type"/>
                  </_sfe:BeforeOrAfterText>
               </xsl:if>
            </xsl:when>
            <xsl:when test="not(ancestor::entry/preceding-sibling::entry[2]/*[name()='part-nbr']/@indent='0') and not(ancestor::entry/preceding-sibling::entry[2]/*[name()='part-nbr']/@indent='1') and not(ancestor::entry/preceding-sibling::entry[2]/*[name()='part-nbr']/@indent='2') and (ancestor::entry/preceding-sibling::entry[2]/*[name()='part-nbr']/@indent='3')"><!--AddBefore Condition #4--><xsl:if test="not(@_gte:Gentext-Expanded)">
                  <_gte:Must-Expand-Gentext/>
                  <_sfe:BeforeOrAfterText>
                     <_ufe:block-nospace/>
                     <xsl:processing-instruction name="Pub">_hardspace</xsl:processing-instruction>
                     <xsl:processing-instruction name="Pub">_hardspace</xsl:processing-instruction>
                     <xsl:processing-instruction name="Pub">_hardspace</xsl:processing-instruction>
                     <xsl:processing-instruction name="Pub">_hardspace</xsl:processing-instruction>
                     <xsl:processing-instruction name="Pub">_hardspace</xsl:processing-instruction>
                     <xsl:value-of select="@cond"/>
                     <xsl:text>-</xsl:text>
                     <xsl:value-of select="@type"/>
                  </_sfe:BeforeOrAfterText>
               </xsl:if>
            </xsl:when>
            <xsl:when test="not(ancestor::entry/preceding-sibling::entry[2]/*[name()='part-nbr']/@indent='0') and not(ancestor::entry/preceding-sibling::entry[2]/*[name()='part-nbr']/@indent='1') and (ancestor::entry/preceding-sibling::entry[2]/*[name()='part-nbr']/@indent='2')"><!--AddBefore Condition #3--><xsl:if test="not(@_gte:Gentext-Expanded)">
                  <_gte:Must-Expand-Gentext/>
                  <_sfe:BeforeOrAfterText>
                     <_ufe:block-nospace/>
                     <xsl:processing-instruction name="Pub">_hardspace</xsl:processing-instruction>
                     <xsl:processing-instruction name="Pub">_hardspace</xsl:processing-instruction>
                     <xsl:processing-instruction name="Pub">_hardspace</xsl:processing-instruction>
                     <xsl:processing-instruction name="Pub">_hardspace</xsl:processing-instruction>
                     <xsl:value-of select="@cond"/>
                     <xsl:text>-</xsl:text>
                     <xsl:value-of select="@type"/>
                  </_sfe:BeforeOrAfterText>
               </xsl:if>
            </xsl:when>
            <xsl:when test="not(ancestor::entry/preceding-sibling::entry[2]/*[name()='part-nbr']/@indent='0') and (ancestor::entry/preceding-sibling::entry[2]/*[name()='part-nbr']/@indent='1')"><!--AddBefore Condition #2--><xsl:if test="not(@_gte:Gentext-Expanded)">
                  <_gte:Must-Expand-Gentext/>
                  <_sfe:BeforeOrAfterText>
                     <_ufe:block-nospace/>
                     <xsl:processing-instruction name="Pub">_hardspace</xsl:processing-instruction>
                     <xsl:processing-instruction name="Pub">_hardspace</xsl:processing-instruction>
                     <xsl:processing-instruction name="Pub">_hardspace</xsl:processing-instruction>
                     <xsl:value-of select="@cond"/>
                     <xsl:text>-</xsl:text>
                     <xsl:value-of select="@type"/>
                  </_sfe:BeforeOrAfterText>
               </xsl:if>
            </xsl:when>
            <xsl:when test="ancestor::entry/preceding-sibling::entry[2]/*[name()='part-nbr']/@indent='0'"><!--AddBefore Condition #1--><xsl:if test="not(@_gte:Gentext-Expanded)">
                  <_gte:Must-Expand-Gentext/>
                  <_sfe:BeforeOrAfterText>
                     <_ufe:block-nospace/>
                     <xsl:value-of select="@cond"/>
                     <xsl:text>-</xsl:text>
                     <xsl:value-of select="@type"/>
                  </_sfe:BeforeOrAfterText>
               </xsl:if>
            </xsl:when>
         </xsl:choose>
         <xsl:apply-templates select="* | text() | processing-instruction()" mode="expand-gentext"/>
      </xsl:copy>
   </xsl:template>

   <!--Initial pass template for Context: nomen-col/sb-stat-->
<xsl:template match="nomen-col/sb-stat" mode="initial-pass-mode" priority="2">
      <xsl:copy>
         <xsl:call-template name="maybe-set-gte-id"/>
         <xsl:apply-templates select="@*|node()" mode="initial-pass-mode"/>
      </xsl:copy>
   </xsl:template>

   <!--Set count-as pass template for Context: nomen-col/sb-stat-->
<xsl:template match="nomen-col/sb-stat" mode="set-countas" priority="2">
      <xsl:copy>
         <xsl:apply-templates select="@*|node()" mode="set-countas"/>
      </xsl:copy>
   </xsl:template>

   <!--Set ch:chunk template for Context: nomen-col/sb-stat-->
<xsl:template match="nomen-col/sb-stat" mode="set-ch-chunk" priority="2">
      <xsl:copy>
         <xsl:if test="not(@_gte:did-set-chunk)">
            <xsl:variable name="Breaks-chunkBoundary"/>
            <xsl:if test="$Breaks-chunkBoundary = 'yes'">
               <xsl:attribute name="ch:chunk">yes</xsl:attribute>
            </xsl:if>
            <xsl:attribute name="_gte:did-set-chunk">yes</xsl:attribute>
         </xsl:if>
         <xsl:apply-templates select="@*|node()" mode="set-ch-chunk"/>
      </xsl:copy>
   </xsl:template>

   <!--Style template for Context: sb-stat[@type='SPB']-->
<xsl:template name="__style-for_sb-stat.4sbtaat203">
      <xsl:text> .x-sb-stat-3-0 {margin-left: 0pt; margin-right: 0pt; color: #0000FF; text-decoration: underline ; text-decoration: underline ; }</xsl:text>
   </xsl:template>

   <!--Template for Context: sb-stat[@type='SPB']-->
<xsl:template match="sb-stat[@type='SPB']" priority="1">
      <xsl:param name="hidden" select="'yes'"/>
      <span><!--Emit class values to reflect conditions--><xsl:attribute name="class">
            <xsl:text> x-sb-stat-3-0</xsl:text>
         </xsl:attribute>
         <xsl:if test="@xml:lang">
            <xsl:attribute name="lang">
               <xsl:call-template name="return-lang-applying-language-map">
                  <xsl:with-param name="doclang" select="@xml:lang"/>
               </xsl:call-template>
            </xsl:attribute>
         </xsl:if>
         <xsl:copy-of select="@ch:*"/>
         <xsl:if test="@xml:lang">
            <xsl:attribute name="lang">
               <xsl:call-template name="return-lang-applying-language-map">
                  <xsl:with-param name="doclang" select="@xml:lang"/>
               </xsl:call-template>
            </xsl:attribute>
         </xsl:if>
         <xsl:call-template name="maybe-set-id"/>
         <!--Suppress element contents (but not gentext) unless unhidden--><xsl:choose>
            <xsl:when test="$hidden='no'">
               <xsl:apply-templates/>
            </xsl:when>
            <xsl:otherwise>
               <xsl:apply-templates select="_sfe:BeforeOrAfterText"/>
            </xsl:otherwise>
         </xsl:choose>
      </span>
   </xsl:template>

   <!--Gentext template for Context: sb-stat[@type='SPB']-->
<xsl:template match="sb-stat[@type='SPB']" mode="expand-gentext" priority="1">
      <xsl:copy>
         <xsl:attribute name="_gte:Gentext-Expanded">y</xsl:attribute>
         <xsl:apply-templates select="@*" mode="expand-gentext"/>
         <xsl:if test="not(@_gte:id)">
            <xsl:attribute name="_gte:id">
               <xsl:value-of select="'_g_'"/>
               <xsl:value-of select="generate-id(.)"/>
            </xsl:attribute>
         </xsl:if>
         <!--Unconditional AddBefore--><xsl:if test="not(@_gte:Gentext-Expanded)">
            <_gte:Must-Expand-Gentext/>
            <_sfe:BeforeOrAfterText>
               <_ufe:block-nospace/>
               <xsl:value-of select="@cond"/>
               <xsl:text>-</xsl:text>
               <xsl:value-of select="string(substring-before(., ','))"/>
               <xsl:text> </xsl:text>
               <xsl:value-of select="@type"/>
               <xsl:text> NO. </xsl:text>
               <xsl:value-of select="string(substring-after(., ','))"/>
            </_sfe:BeforeOrAfterText>
         </xsl:if>
         <xsl:apply-templates select="* | text() | processing-instruction()" mode="expand-gentext"/>
      </xsl:copy>
   </xsl:template>

   <!--Initial pass template for Context: sb-stat[@type='SPB']-->
<xsl:template match="sb-stat[@type='SPB']" mode="initial-pass-mode" priority="1">
      <xsl:copy>
         <xsl:call-template name="maybe-set-gte-id"/>
         <xsl:apply-templates select="@*|node()" mode="initial-pass-mode"/>
      </xsl:copy>
   </xsl:template>

   <!--Set count-as pass template for Context: sb-stat[@type='SPB']-->
<xsl:template match="sb-stat[@type='SPB']" mode="set-countas" priority="1">
      <xsl:copy>
         <xsl:apply-templates select="@*|node()" mode="set-countas"/>
      </xsl:copy>
   </xsl:template>

   <!--Set ch:chunk template for Context: sb-stat[@type='SPB']-->
<xsl:template match="sb-stat[@type='SPB']" mode="set-ch-chunk" priority="1">
      <xsl:copy>
         <xsl:if test="not(@_gte:did-set-chunk)">
            <xsl:attribute name="_gte:did-set-chunk">yes</xsl:attribute>
         </xsl:if>
         <xsl:apply-templates select="@*|node()" mode="set-ch-chunk"/>
      </xsl:copy>
   </xsl:template>

   <!--Collect footnote template for Context: sb-stat[@type='SPB']-->
<xsl:template match="sb-stat[@type='SPB']" mode="styler-collect-footnotes" priority="1">
      <xsl:apply-templates select="_sfe:BeforeOrAfterText/*" mode="styler-collect-footnotes"/>
   </xsl:template>

   <!--Style template for Context: sb-stat-->
<xsl:template name="__style-for_sb-stat.4sbtaat74">
      <xsl:text> .x-sb-stat-4-0 {margin-left: 0pt; margin-right: 0pt; color: #0000FF; text-decoration: underline ; text-decoration: underline ; }</xsl:text>
   </xsl:template>

   <!--Template for Context: sb-stat-->
<xsl:template match="sb-stat" priority="0">
      <span><!--Emit class values to reflect conditions--><xsl:attribute name="class">
            <xsl:text> x-sb-stat-4-0</xsl:text>
         </xsl:attribute>
         <xsl:if test="@xml:lang">
            <xsl:attribute name="lang">
               <xsl:call-template name="return-lang-applying-language-map">
                  <xsl:with-param name="doclang" select="@xml:lang"/>
               </xsl:call-template>
            </xsl:attribute>
         </xsl:if>
         <xsl:copy-of select="@ch:*"/>
         <xsl:if test="@xml:lang">
            <xsl:attribute name="lang">
               <xsl:call-template name="return-lang-applying-language-map">
                  <xsl:with-param name="doclang" select="@xml:lang"/>
               </xsl:call-template>
            </xsl:attribute>
         </xsl:if>
         <xsl:call-template name="maybe-set-id"/>
         <!--Process this element's content--><xsl:apply-templates/>
      </span>
   </xsl:template>

   <!--Gentext template for Context: sb-stat-->
<xsl:template match="sb-stat" mode="expand-gentext" priority="0">
      <xsl:copy>
         <xsl:attribute name="_gte:Gentext-Expanded">y</xsl:attribute>
         <xsl:apply-templates select="@*" mode="expand-gentext"/>
         <xsl:if test="not(@_gte:id)">
            <xsl:attribute name="_gte:id">
               <xsl:value-of select="'_g_'"/>
               <xsl:value-of select="generate-id(.)"/>
            </xsl:attribute>
         </xsl:if>
         <!--Unconditional AddBefore--><xsl:if test="not(@_gte:Gentext-Expanded)">
            <_gte:Must-Expand-Gentext/>
            <_sfe:BeforeOrAfterText>
               <_ufe:block-nospace/>
               <xsl:value-of select="@cond"/>
               <xsl:text>-</xsl:text>
               <xsl:value-of select="@type"/>
            </_sfe:BeforeOrAfterText>
         </xsl:if>
         <xsl:apply-templates select="* | text() | processing-instruction()" mode="expand-gentext"/>
      </xsl:copy>
   </xsl:template>

   <!--Initial pass template for Context: sb-stat-->
<xsl:template match="sb-stat" mode="initial-pass-mode" priority="0">
      <xsl:copy>
         <xsl:call-template name="maybe-set-gte-id"/>
         <xsl:apply-templates select="@*|node()" mode="initial-pass-mode"/>
      </xsl:copy>
   </xsl:template>

   <!--Set count-as pass template for Context: sb-stat-->
<xsl:template match="sb-stat" mode="set-countas" priority="0">
      <xsl:copy>
         <xsl:apply-templates select="@*|node()" mode="set-countas"/>
      </xsl:copy>
   </xsl:template>

   <!--Set ch:chunk template for Context: sb-stat-->
<xsl:template match="sb-stat" mode="set-ch-chunk" priority="0">
      <xsl:copy>
         <xsl:if test="not(@_gte:did-set-chunk)">
            <xsl:attribute name="_gte:did-set-chunk">yes</xsl:attribute>
         </xsl:if>
         <xsl:apply-templates select="@*|node()" mode="set-ch-chunk"/>
      </xsl:copy>
   </xsl:template>

   <!--Style template for Context: see-->
<xsl:template name="__style-for_see.1">
      <xsl:text> .x-see-1-0 {margin-left: 0pt; margin-right: 0pt; text-indent: 0pt; } .x-see-1-1 {} .x-see-1-2 {} .x-see-1-3 {} .x-see-1-4 {} .x-see-1-5 {} .x-see-1-6 {} .x-see-1-7 {}</xsl:text>
   </xsl:template>

   <!--Template for Context: see-->
<xsl:template match="see" priority="0">
      <xsl:param name="hidden" select="'yes'"/>
      <!--Dynamically determine the fo-class--><xsl:variable name="foClass">
         <xsl:choose>
            <xsl:when test="not((@ntype and string(@ntype)='FIGNOTE') and (not(@fignote-nbr))) and not(@ntype and string(@ntype)='FIGNOTE') and not(@ntype and string(@ntype)='FIGNHA') and not(@ntype and string(@ntype)='CHAPFIG') and not(@ntype and string(@ntype)='CHAPFIGBDN') and not(@ntype and string(@ntype)='CHAPFIGNHA') and (@ntype and string(@ntype)='FIGBDN')">hidden</xsl:when>
            <xsl:when test="not((@ntype and string(@ntype)='FIGNOTE') and (not(@fignote-nbr))) and not(@ntype and string(@ntype)='FIGNOTE') and not(@ntype and string(@ntype)='FIGNHA') and not(@ntype and string(@ntype)='CHAPFIG') and not(@ntype and string(@ntype)='CHAPFIGBDN') and (@ntype and string(@ntype)='CHAPFIGNHA')">hidden</xsl:when>
            <xsl:when test="not((@ntype and string(@ntype)='FIGNOTE') and (not(@fignote-nbr))) and not(@ntype and string(@ntype)='FIGNOTE') and not(@ntype and string(@ntype)='FIGNHA') and not(@ntype and string(@ntype)='CHAPFIG') and (@ntype and string(@ntype)='CHAPFIGBDN')">hidden</xsl:when>
            <xsl:when test="not((@ntype and string(@ntype)='FIGNOTE') and (not(@fignote-nbr))) and not(@ntype and string(@ntype)='FIGNOTE') and not(@ntype and string(@ntype)='FIGNHA') and (@ntype and string(@ntype)='CHAPFIG')">hidden</xsl:when>
            <xsl:when test="not((@ntype and string(@ntype)='FIGNOTE') and (not(@fignote-nbr))) and not(@ntype and string(@ntype)='FIGNOTE') and (@ntype and string(@ntype)='FIGNHA')">hidden</xsl:when>
            <xsl:when test="not((@ntype and string(@ntype)='FIGNOTE') and (not(@fignote-nbr))) and (@ntype and string(@ntype)='FIGNOTE')">hidden</xsl:when>
            <xsl:when test="(@ntype and string(@ntype)='FIGNOTE') and (not(@fignote-nbr))">hidden</xsl:when>
            <xsl:otherwise>block</xsl:otherwise>
         </xsl:choose>
      </xsl:variable>
      <xsl:variable name="blockness">block</xsl:variable>
      <xsl:variable name="hiddenness">
         <xsl:choose>
            <xsl:when test="not((@ntype and string(@ntype)='FIGNOTE') and (not(@fignote-nbr))) and not(@ntype and string(@ntype)='FIGNOTE') and not(@ntype and string(@ntype)='FIGNHA') and not(@ntype and string(@ntype)='CHAPFIG') and not(@ntype and string(@ntype)='CHAPFIGBDN') and not(@ntype and string(@ntype)='CHAPFIGNHA') and (@ntype and string(@ntype)='FIGBDN')">yes</xsl:when>
            <xsl:when test="not((@ntype and string(@ntype)='FIGNOTE') and (not(@fignote-nbr))) and not(@ntype and string(@ntype)='FIGNOTE') and not(@ntype and string(@ntype)='FIGNHA') and not(@ntype and string(@ntype)='CHAPFIG') and not(@ntype and string(@ntype)='CHAPFIGBDN') and (@ntype and string(@ntype)='CHAPFIGNHA')">yes</xsl:when>
            <xsl:when test="not((@ntype and string(@ntype)='FIGNOTE') and (not(@fignote-nbr))) and not(@ntype and string(@ntype)='FIGNOTE') and not(@ntype and string(@ntype)='FIGNHA') and not(@ntype and string(@ntype)='CHAPFIG') and (@ntype and string(@ntype)='CHAPFIGBDN')">yes</xsl:when>
            <xsl:when test="not((@ntype and string(@ntype)='FIGNOTE') and (not(@fignote-nbr))) and not(@ntype and string(@ntype)='FIGNOTE') and not(@ntype and string(@ntype)='FIGNHA') and (@ntype and string(@ntype)='CHAPFIG')">yes</xsl:when>
            <xsl:when test="not((@ntype and string(@ntype)='FIGNOTE') and (not(@fignote-nbr))) and not(@ntype and string(@ntype)='FIGNOTE') and (@ntype and string(@ntype)='FIGNHA')">yes</xsl:when>
            <xsl:when test="not((@ntype and string(@ntype)='FIGNOTE') and (not(@fignote-nbr))) and (@ntype and string(@ntype)='FIGNOTE')">yes</xsl:when>
            <xsl:when test="(@ntype and string(@ntype)='FIGNOTE') and (not(@fignote-nbr))">yes</xsl:when>
            <xsl:otherwise>no</xsl:otherwise>
         </xsl:choose>
      </xsl:variable>
      <xsl:variable name="startnew"/>
      <xsl:variable name="newpageset">#noChange</xsl:variable>
      <xsl:variable name="fo-class">
         <xsl:choose>
            <xsl:when test="$hiddenness='yes'">
               <xsl:text>hidden-</xsl:text>
               <xsl:value-of select="$blockness"/>
            </xsl:when>
            <xsl:when test="$hiddenness='no' and starts-with($foClass,'hidden-')">
               <xsl:value-of select="substring($foClass,8)"/>
            </xsl:when>
            <xsl:when test="true()"><!--This is the "otherwise" clause, but there may be no when's--><xsl:value-of select="$foClass"/>
            </xsl:when>
         </xsl:choose>
      </xsl:variable>
      <xsl:variable name="given-lre-override-name"/>
      <xsl:variable name="lre-override-name">
         <xsl:call-template name="determine-lre-override-name">
            <xsl:with-param name="given-lre-override-name" select="$given-lre-override-name"/>
            <xsl:with-param name="fo-class" select="$fo-class"/>
         </xsl:call-template>
      </xsl:variable>
      <!--Execute the appropriate code for the dynamically determined fo-class--><xsl:choose>
         <xsl:when test="$fo-class='hidden-block'">
            <div><!--Emit class values to reflect conditions--><xsl:attribute name="class">
                  <xsl:text> x-see-1-0</xsl:text>
                  <xsl:if test="(@ntype and string(@ntype)='FIGNOTE') and (not(@fignote-nbr))"> x-see-1-1</xsl:if>
                  <xsl:if test="not((@ntype and string(@ntype)='FIGNOTE') and (not(@fignote-nbr))) and (@ntype and string(@ntype)='FIGNOTE')"> x-see-1-2</xsl:if>
                  <xsl:if test="not((@ntype and string(@ntype)='FIGNOTE') and (not(@fignote-nbr))) and not(@ntype and string(@ntype)='FIGNOTE') and (@ntype and string(@ntype)='FIGNHA')"> x-see-1-3</xsl:if>
                  <xsl:if test="not((@ntype and string(@ntype)='FIGNOTE') and (not(@fignote-nbr))) and not(@ntype and string(@ntype)='FIGNOTE') and not(@ntype and string(@ntype)='FIGNHA') and (@ntype and string(@ntype)='CHAPFIG')"> x-see-1-4</xsl:if>
                  <xsl:if test="not((@ntype and string(@ntype)='FIGNOTE') and (not(@fignote-nbr))) and not(@ntype and string(@ntype)='FIGNOTE') and not(@ntype and string(@ntype)='FIGNHA') and not(@ntype and string(@ntype)='CHAPFIG') and (@ntype and string(@ntype)='CHAPFIGBDN')"> x-see-1-5</xsl:if>
                  <xsl:if test="not((@ntype and string(@ntype)='FIGNOTE') and (not(@fignote-nbr))) and not(@ntype and string(@ntype)='FIGNOTE') and not(@ntype and string(@ntype)='FIGNHA') and not(@ntype and string(@ntype)='CHAPFIG') and not(@ntype and string(@ntype)='CHAPFIGBDN') and (@ntype and string(@ntype)='CHAPFIGNHA')"> x-see-1-6</xsl:if>
                  <xsl:if test="not((@ntype and string(@ntype)='FIGNOTE') and (not(@fignote-nbr))) and not(@ntype and string(@ntype)='FIGNOTE') and not(@ntype and string(@ntype)='FIGNHA') and not(@ntype and string(@ntype)='CHAPFIG') and not(@ntype and string(@ntype)='CHAPFIGBDN') and not(@ntype and string(@ntype)='CHAPFIGNHA') and (@ntype and string(@ntype)='FIGBDN')"> x-see-1-7</xsl:if>
               </xsl:attribute>
               <xsl:if test="@xml:lang">
                  <xsl:attribute name="lang">
                     <xsl:call-template name="return-lang-applying-language-map">
                        <xsl:with-param name="doclang" select="@xml:lang"/>
                     </xsl:call-template>
                  </xsl:attribute>
               </xsl:if>
               <xsl:copy-of select="@ch:*"/>
               <xsl:variable name="Breaks-chunkFilenameXPath"/>
               <xsl:variable name="Breaks-persistentFilename"/>
               <xsl:if test="($Breaks-persistentFilename='yes') and ($Breaks-chunkFilenameXPath!='')">
                  <xsl:variable name="chunkFilename"/>
                  <xsl:if test="$chunkFilename!=''">
                     <xsl:attribute name="ch:filename">
                        <xsl:value-of select="$chunkFilename"/>
                     </xsl:attribute>
                     <xsl:attribute name="ch:namepriority">0</xsl:attribute>
                  </xsl:if>
               </xsl:if>
               <xsl:if test="@xml:lang">
                  <xsl:attribute name="lang">
                     <xsl:call-template name="return-lang-applying-language-map">
                        <xsl:with-param name="doclang" select="@xml:lang"/>
                     </xsl:call-template>
                  </xsl:attribute>
               </xsl:if>
               <xsl:call-template name="maybe-set-id"/>
               <!--Suppress element contents (but not gentext) unless unhidden--><xsl:choose>
                  <xsl:when test="$hidden='no'">
                     <xsl:apply-templates/>
                  </xsl:when>
                  <xsl:otherwise>
                     <xsl:apply-templates select="_sfe:BeforeOrAfterText"/>
                  </xsl:otherwise>
               </xsl:choose>
            </div>
         </xsl:when>
         <xsl:when test="$fo-class='block'">
            <div><!--Emit class values to reflect conditions--><xsl:attribute name="class">
                  <xsl:text> x-see-1-0</xsl:text>
                  <xsl:if test="(@ntype and string(@ntype)='FIGNOTE') and (not(@fignote-nbr))"> x-see-1-1</xsl:if>
                  <xsl:if test="not((@ntype and string(@ntype)='FIGNOTE') and (not(@fignote-nbr))) and (@ntype and string(@ntype)='FIGNOTE')"> x-see-1-2</xsl:if>
                  <xsl:if test="not((@ntype and string(@ntype)='FIGNOTE') and (not(@fignote-nbr))) and not(@ntype and string(@ntype)='FIGNOTE') and (@ntype and string(@ntype)='FIGNHA')"> x-see-1-3</xsl:if>
                  <xsl:if test="not((@ntype and string(@ntype)='FIGNOTE') and (not(@fignote-nbr))) and not(@ntype and string(@ntype)='FIGNOTE') and not(@ntype and string(@ntype)='FIGNHA') and (@ntype and string(@ntype)='CHAPFIG')"> x-see-1-4</xsl:if>
                  <xsl:if test="not((@ntype and string(@ntype)='FIGNOTE') and (not(@fignote-nbr))) and not(@ntype and string(@ntype)='FIGNOTE') and not(@ntype and string(@ntype)='FIGNHA') and not(@ntype and string(@ntype)='CHAPFIG') and (@ntype and string(@ntype)='CHAPFIGBDN')"> x-see-1-5</xsl:if>
                  <xsl:if test="not((@ntype and string(@ntype)='FIGNOTE') and (not(@fignote-nbr))) and not(@ntype and string(@ntype)='FIGNOTE') and not(@ntype and string(@ntype)='FIGNHA') and not(@ntype and string(@ntype)='CHAPFIG') and not(@ntype and string(@ntype)='CHAPFIGBDN') and (@ntype and string(@ntype)='CHAPFIGNHA')"> x-see-1-6</xsl:if>
                  <xsl:if test="not((@ntype and string(@ntype)='FIGNOTE') and (not(@fignote-nbr))) and not(@ntype and string(@ntype)='FIGNOTE') and not(@ntype and string(@ntype)='FIGNHA') and not(@ntype and string(@ntype)='CHAPFIG') and not(@ntype and string(@ntype)='CHAPFIGBDN') and not(@ntype and string(@ntype)='CHAPFIGNHA') and (@ntype and string(@ntype)='FIGBDN')"> x-see-1-7</xsl:if>
               </xsl:attribute>
               <xsl:if test="@xml:lang">
                  <xsl:attribute name="lang">
                     <xsl:call-template name="return-lang-applying-language-map">
                        <xsl:with-param name="doclang" select="@xml:lang"/>
                     </xsl:call-template>
                  </xsl:attribute>
               </xsl:if>
               <xsl:copy-of select="@ch:*"/>
               <xsl:variable name="Breaks-chunkFilenameXPath"/>
               <xsl:variable name="Breaks-persistentFilename"/>
               <xsl:if test="($Breaks-persistentFilename='yes') and ($Breaks-chunkFilenameXPath!='')">
                  <xsl:variable name="chunkFilename"/>
                  <xsl:if test="$chunkFilename!=''">
                     <xsl:attribute name="ch:filename">
                        <xsl:value-of select="$chunkFilename"/>
                     </xsl:attribute>
                     <xsl:attribute name="ch:namepriority">0</xsl:attribute>
                  </xsl:if>
               </xsl:if>
               <xsl:if test="@xml:lang">
                  <xsl:attribute name="lang">
                     <xsl:call-template name="return-lang-applying-language-map">
                        <xsl:with-param name="doclang" select="@xml:lang"/>
                     </xsl:call-template>
                  </xsl:attribute>
               </xsl:if>
               <xsl:call-template name="maybe-set-id"/>
               <!--Process this element's content--><xsl:apply-templates/>
            </div>
         </xsl:when>
      </xsl:choose>
   </xsl:template>

   <!--Gentext template for Context: see-->
<xsl:template match="see" mode="expand-gentext" priority="0">
      <xsl:copy>
         <xsl:attribute name="_gte:Gentext-Expanded">y</xsl:attribute>
         <xsl:apply-templates select="@*" mode="expand-gentext"/>
         <xsl:if test="not(@_gte:id)">
            <xsl:attribute name="_gte:id">
               <xsl:value-of select="'_g_'"/>
               <xsl:value-of select="generate-id(.)"/>
            </xsl:attribute>
         </xsl:if>
         <xsl:choose>
            <xsl:when test="not((@ntype and string(@ntype)='FIGNOTE') and (not(@fignote-nbr))) and not(@ntype and string(@ntype)='FIGNOTE') and not(@ntype and string(@ntype)='FIGNHA') and not(@ntype and string(@ntype)='CHAPFIG') and not(@ntype and string(@ntype)='CHAPFIGBDN') and not(@ntype and string(@ntype)='CHAPFIGNHA') and (@ntype and string(@ntype)='FIGBDN')"><!--AddBefore Condition #7--><xsl:if test="not(@_gte:Gentext-Expanded)">
                  <_gte:Must-Expand-Gentext/>
                  <_sfe:BeforeOrAfterText>
                     <_sfe:InternalLink>
                        <xsl:if test="string(./@ref)">
                           <xsl:attribute name="targetId">
                              <xsl:value-of select="string(./@ref)"/>
                           </xsl:attribute>
                        </xsl:if>
                        <xsl:text>SEE FIG. </xsl:text>
                        <xsl:if test="node()[not(self::_sfe:BeforeOrAfterText)]">
                           <_gte:Gentexted-Content-Wrapper>
                              <xsl:apply-templates mode="expand-gentext">
                                 <xsl:with-param name="skip-expanded-gentext" select="'yes'"/>
                              </xsl:apply-templates>
                           </_gte:Gentexted-Content-Wrapper>
                        </xsl:if>
                        <xsl:text> FOR BREAKDOWN</xsl:text>
                     </_sfe:InternalLink>
                  </_sfe:BeforeOrAfterText>
               </xsl:if>
            </xsl:when>
            <xsl:when test="not((@ntype and string(@ntype)='FIGNOTE') and (not(@fignote-nbr))) and not(@ntype and string(@ntype)='FIGNOTE') and not(@ntype and string(@ntype)='FIGNHA') and not(@ntype and string(@ntype)='CHAPFIG') and not(@ntype and string(@ntype)='CHAPFIGBDN') and (@ntype and string(@ntype)='CHAPFIGNHA')"><!--AddBefore Condition #6--><xsl:if test="not(@_gte:Gentext-Expanded)">
                  <_gte:Must-Expand-Gentext/>
                  <_sfe:BeforeOrAfterText>
                     <_sfe:InternalLink>
                        <xsl:if test="string(./@ref)">
                           <xsl:attribute name="targetId">
                              <xsl:value-of select="string(./@ref)"/>
                           </xsl:attribute>
                        </xsl:if>
                        <xsl:text>SEE </xsl:text>
                        <xsl:value-of select="string(substring-before(.,&#34; &#34;))"/>
                        <xsl:text> FIG.</xsl:text>
                        <xsl:value-of select="string(substring-after(.,&#34; &#34;))"/>
                        <xsl:text> FOR NHA</xsl:text>
                     </_sfe:InternalLink>
                  </_sfe:BeforeOrAfterText>
               </xsl:if>
            </xsl:when>
            <xsl:when test="not((@ntype and string(@ntype)='FIGNOTE') and (not(@fignote-nbr))) and not(@ntype and string(@ntype)='FIGNOTE') and not(@ntype and string(@ntype)='FIGNHA') and not(@ntype and string(@ntype)='CHAPFIG') and (@ntype and string(@ntype)='CHAPFIGBDN')"><!--AddBefore Condition #5--><xsl:if test="not(@_gte:Gentext-Expanded)">
                  <_gte:Must-Expand-Gentext/>
                  <_sfe:BeforeOrAfterText>
                     <_sfe:InternalLink>
                        <xsl:if test="string(./@ref)">
                           <xsl:attribute name="targetId">
                              <xsl:value-of select="string(./@ref)"/>
                           </xsl:attribute>
                        </xsl:if>
                        <xsl:text>SEE </xsl:text>
                        <xsl:value-of select="string(substring-before(.,&#34; &#34;))"/>
                        <xsl:text> FIG.</xsl:text>
                        <xsl:value-of select="string(substring-after(.,&#34; &#34;))"/>
                        <xsl:text> FOR BREAKDOWN</xsl:text>
                     </_sfe:InternalLink>
                  </_sfe:BeforeOrAfterText>
               </xsl:if>
            </xsl:when>
            <xsl:when test="not((@ntype and string(@ntype)='FIGNOTE') and (not(@fignote-nbr))) and not(@ntype and string(@ntype)='FIGNOTE') and not(@ntype and string(@ntype)='FIGNHA') and (@ntype and string(@ntype)='CHAPFIG')"><!--AddBefore Condition #4--><xsl:if test="not(@_gte:Gentext-Expanded)">
                  <_gte:Must-Expand-Gentext/>
                  <_sfe:BeforeOrAfterText>
                     <_sfe:InternalLink>
                        <xsl:if test="string(./@ref)">
                           <xsl:attribute name="targetId">
                              <xsl:value-of select="string(./@ref)"/>
                           </xsl:attribute>
                        </xsl:if>
                        <xsl:text>SEE </xsl:text>
                        <xsl:value-of select="string(substring-before(.,&#34; &#34;))"/>
                        <xsl:text> FIG.</xsl:text>
                        <xsl:value-of select="string(substring-after(.,&#34; &#34;))"/>
                     </_sfe:InternalLink>
                  </_sfe:BeforeOrAfterText>
               </xsl:if>
            </xsl:when>
            <xsl:when test="not((@ntype and string(@ntype)='FIGNOTE') and (not(@fignote-nbr))) and not(@ntype and string(@ntype)='FIGNOTE') and (@ntype and string(@ntype)='FIGNHA')"><!--AddBefore Condition #3--><xsl:if test="not(@_gte:Gentext-Expanded)">
                  <_gte:Must-Expand-Gentext/>
                  <_sfe:BeforeOrAfterText>
                     <_sfe:InternalLink>
                        <xsl:if test="string(./@ref)">
                           <xsl:attribute name="targetId">
                              <xsl:value-of select="string(./@ref)"/>
                           </xsl:attribute>
                        </xsl:if>
                        <xsl:text>SEE FIG. </xsl:text>
                        <xsl:if test="node()[not(self::_sfe:BeforeOrAfterText)]">
                           <_gte:Gentexted-Content-Wrapper>
                              <xsl:apply-templates mode="expand-gentext">
                                 <xsl:with-param name="skip-expanded-gentext" select="'yes'"/>
                              </xsl:apply-templates>
                           </_gte:Gentexted-Content-Wrapper>
                        </xsl:if>
                        <xsl:text> FOR NHA</xsl:text>
                     </_sfe:InternalLink>
                  </_sfe:BeforeOrAfterText>
               </xsl:if>
            </xsl:when>
            <xsl:when test="not((@ntype and string(@ntype)='FIGNOTE') and (not(@fignote-nbr))) and (@ntype and string(@ntype)='FIGNOTE')"><!--AddBefore Condition #2--><xsl:if test="not(@_gte:Gentext-Expanded)">
                  <_gte:Must-Expand-Gentext/>
                  <_sfe:BeforeOrAfterText>
                     <_sfe:InternalLink>
                        <xsl:if test="string(./@ref)">
                           <xsl:attribute name="targetId">
                              <xsl:value-of select="string(./@ref)"/>
                           </xsl:attribute>
                        </xsl:if>
                        <xsl:text>SEE NOTE </xsl:text>
                        <xsl:value-of select="@fignote-nbr"/>
                     </_sfe:InternalLink>
                  </_sfe:BeforeOrAfterText>
               </xsl:if>
            </xsl:when>
            <xsl:when test="(@ntype and string(@ntype)='FIGNOTE') and (not(@fignote-nbr))"><!--AddBefore Condition #1--><xsl:if test="not(@_gte:Gentext-Expanded)">
                  <_gte:Must-Expand-Gentext/>
                  <_sfe:BeforeOrAfterText>
                     <_sfe:InternalLink>
                        <xsl:if test="string(./@ref)">
                           <xsl:attribute name="targetId">
                              <xsl:value-of select="string(./@ref)"/>
                           </xsl:attribute>
                        </xsl:if>
                        <xsl:text>SEE NOTE </xsl:text>
                        <xsl:if test="node()[not(self::_sfe:BeforeOrAfterText)]">
                           <_gte:Gentexted-Content-Wrapper>
                              <xsl:apply-templates mode="expand-gentext">
                                 <xsl:with-param name="skip-expanded-gentext" select="'yes'"/>
                              </xsl:apply-templates>
                           </_gte:Gentexted-Content-Wrapper>
                        </xsl:if>
                     </_sfe:InternalLink>
                  </_sfe:BeforeOrAfterText>
               </xsl:if>
            </xsl:when>
         </xsl:choose>
         <xsl:apply-templates select="* | text() | processing-instruction()" mode="expand-gentext"/>
         <xsl:choose>
            <xsl:when test="not((@ntype and string(@ntype)='FIGNOTE') and (not(@fignote-nbr))) and not(@ntype and string(@ntype)='FIGNOTE') and not(@ntype and string(@ntype)='FIGNHA') and not(@ntype and string(@ntype)='CHAPFIG') and not(@ntype and string(@ntype)='CHAPFIGBDN') and not(@ntype and string(@ntype)='CHAPFIGNHA') and (@ntype and string(@ntype)='FIGBDN')"><!--AddAfter Condition #7--><xsl:if test="not(@_gte:Gentext-Expanded)">
                  <_gte:Must-Expand-Gentext/>
                  <_sfe:BeforeOrAfterText/>
               </xsl:if>
            </xsl:when>
            <xsl:when test="not((@ntype and string(@ntype)='FIGNOTE') and (not(@fignote-nbr))) and not(@ntype and string(@ntype)='FIGNOTE') and not(@ntype and string(@ntype)='FIGNHA') and not(@ntype and string(@ntype)='CHAPFIG') and not(@ntype and string(@ntype)='CHAPFIGBDN') and (@ntype and string(@ntype)='CHAPFIGNHA')"><!--AddAfter Condition #6--></xsl:when>
            <xsl:when test="not((@ntype and string(@ntype)='FIGNOTE') and (not(@fignote-nbr))) and not(@ntype and string(@ntype)='FIGNOTE') and not(@ntype and string(@ntype)='FIGNHA') and not(@ntype and string(@ntype)='CHAPFIG') and (@ntype and string(@ntype)='CHAPFIGBDN')"><!--AddAfter Condition #5--></xsl:when>
            <xsl:when test="not((@ntype and string(@ntype)='FIGNOTE') and (not(@fignote-nbr))) and not(@ntype and string(@ntype)='FIGNOTE') and not(@ntype and string(@ntype)='FIGNHA') and (@ntype and string(@ntype)='CHAPFIG')"><!--AddAfter Condition #4--></xsl:when>
            <xsl:when test="not((@ntype and string(@ntype)='FIGNOTE') and (not(@fignote-nbr))) and not(@ntype and string(@ntype)='FIGNOTE') and (@ntype and string(@ntype)='FIGNHA')"><!--AddAfter Condition #3--><xsl:if test="not(@_gte:Gentext-Expanded)">
                  <_gte:Must-Expand-Gentext/>
                  <_sfe:BeforeOrAfterText/>
               </xsl:if>
            </xsl:when>
            <xsl:when test="not((@ntype and string(@ntype)='FIGNOTE') and (not(@fignote-nbr))) and (@ntype and string(@ntype)='FIGNOTE')"><!--AddAfter Condition #2--></xsl:when>
            <xsl:when test="(@ntype and string(@ntype)='FIGNOTE') and (not(@fignote-nbr))"><!--AddAfter Condition #1--></xsl:when>
         </xsl:choose>
      </xsl:copy>
   </xsl:template>

   <!--Initial pass template for Context: see-->
<xsl:template match="see" mode="initial-pass-mode" priority="0">
      <xsl:copy>
         <xsl:call-template name="maybe-set-gte-id"/>
         <xsl:apply-templates select="@*|node()" mode="initial-pass-mode"/>
      </xsl:copy>
   </xsl:template>

   <!--Set count-as pass template for Context: see-->
<xsl:template match="see" mode="set-countas" priority="0">
      <xsl:copy>
         <xsl:apply-templates select="@*|node()" mode="set-countas"/>
      </xsl:copy>
   </xsl:template>

   <!--Set ch:chunk template for Context: see-->
<xsl:template match="see" mode="set-ch-chunk" priority="0">
      <xsl:copy>
         <xsl:if test="not(@_gte:did-set-chunk)">
            <xsl:variable name="Breaks-chunkBoundary"/>
            <xsl:if test="$Breaks-chunkBoundary = 'yes'">
               <xsl:attribute name="ch:chunk">yes</xsl:attribute>
            </xsl:if>
            <xsl:attribute name="_gte:did-set-chunk">yes</xsl:attribute>
         </xsl:if>
         <xsl:apply-templates select="@*|node()" mode="set-ch-chunk"/>
      </xsl:copy>
   </xsl:template>

   <!--Style template for Context: service-bull-list-->
<xsl:template name="__style-for_service-bull-list.1">
      <xsl:text> .x-service-bull-list-1-0 {margin-left: 0pt; margin-right: 0pt; text-indent: 0pt; margin-top: 8pt; }</xsl:text>
   </xsl:template>

   <!--Template for Context: service-bull-list-->
<xsl:template match="service-bull-list" priority="0">
      <div><!--Emit class values to reflect conditions--><xsl:attribute name="class">
            <xsl:text> x-service-bull-list-1-0</xsl:text>
         </xsl:attribute>
         <xsl:if test="@xml:lang">
            <xsl:attribute name="lang">
               <xsl:call-template name="return-lang-applying-language-map">
                  <xsl:with-param name="doclang" select="@xml:lang"/>
               </xsl:call-template>
            </xsl:attribute>
         </xsl:if>
         <xsl:copy-of select="@ch:*"/>
         <xsl:if test="@xml:lang">
            <xsl:attribute name="lang">
               <xsl:call-template name="return-lang-applying-language-map">
                  <xsl:with-param name="doclang" select="@xml:lang"/>
               </xsl:call-template>
            </xsl:attribute>
         </xsl:if>
         <xsl:call-template name="maybe-set-id">
            <xsl:with-param name="only-if-id-attr" select="'no'"/>
            <xsl:with-param name="generated-id-prefix" select="'styler-id'"/>
         </xsl:call-template>
         <!--Process this element's content--><xsl:apply-templates/>
      </div>
   </xsl:template>

   <!--Gentext template for Context: service-bull-list-->
<xsl:template match="service-bull-list" mode="expand-gentext" priority="0">
      <xsl:copy>
         <xsl:apply-templates select="@*|node()" mode="expand-gentext"/>
      </xsl:copy>
   </xsl:template>

   <!--Initial pass template for Context: service-bull-list-->
<xsl:template match="service-bull-list" mode="initial-pass-mode" priority="0">
      <xsl:copy>
         <xsl:call-template name="maybe-set-gte-id"/>
         <xsl:apply-templates select="@*|node()" mode="initial-pass-mode"/>
      </xsl:copy>
   </xsl:template>

   <!--Set count-as pass template for Context: service-bull-list-->
<xsl:template match="service-bull-list" mode="set-countas" priority="0">
      <xsl:copy>
         <xsl:apply-templates select="@*|node()" mode="set-countas"/>
      </xsl:copy>
   </xsl:template>

   <!--Set ch:chunk template for Context: service-bull-list-->
<xsl:template match="service-bull-list" mode="set-ch-chunk" priority="0">
      <xsl:copy>
         <xsl:if test="not(@_gte:did-set-chunk)">
            <xsl:attribute name="_gte:did-set-chunk">yes</xsl:attribute>
         </xsl:if>
         <xsl:apply-templates select="@*|node()" mode="set-ch-chunk"/>
      </xsl:copy>
   </xsl:template>

   <!--Style template for Context: atidlm:source-->
<xsl:template name="__style-for_atidlm-source.1">
      <xsl:text> .x-atidlm-source-1-0 {margin-left: 0pt; margin-right: 0pt; text-indent: 0pt; }</xsl:text>
   </xsl:template>

   <!--Template for Context: atidlm:source-->
<xsl:template match="atidlm:source" priority="0">
      <span><!--Emit class values to reflect conditions--><xsl:attribute name="class">
            <xsl:text> x-atidlm-source-1-0</xsl:text>
         </xsl:attribute>
         <xsl:if test="@xml:lang">
            <xsl:attribute name="lang">
               <xsl:call-template name="return-lang-applying-language-map">
                  <xsl:with-param name="doclang" select="@xml:lang"/>
               </xsl:call-template>
            </xsl:attribute>
         </xsl:if>
         <xsl:copy-of select="@ch:*"/>
         <xsl:if test="@xml:lang">
            <xsl:attribute name="lang">
               <xsl:call-template name="return-lang-applying-language-map">
                  <xsl:with-param name="doclang" select="@xml:lang"/>
               </xsl:call-template>
            </xsl:attribute>
         </xsl:if>
         <xsl:call-template name="maybe-set-id"/>
         <!--Process this element's content--><xsl:apply-templates/>
      </span>
   </xsl:template>

   <!--Gentext template for Context: atidlm:source-->
<xsl:template match="atidlm:source" mode="expand-gentext" priority="0">
      <xsl:copy>
         <xsl:apply-templates select="@*|node()" mode="expand-gentext"/>
      </xsl:copy>
   </xsl:template>

   <!--Initial pass template for Context: atidlm:source-->
<xsl:template match="atidlm:source" mode="initial-pass-mode" priority="0">
      <xsl:copy>
         <xsl:call-template name="maybe-set-gte-id"/>
         <xsl:apply-templates select="@*|node()" mode="initial-pass-mode"/>
      </xsl:copy>
   </xsl:template>

   <!--Set count-as pass template for Context: atidlm:source-->
<xsl:template match="atidlm:source" mode="set-countas" priority="0">
      <xsl:copy>
         <xsl:apply-templates select="@*|node()" mode="set-countas"/>
      </xsl:copy>
   </xsl:template>

   <!--Set ch:chunk template for Context: atidlm:source-->
<xsl:template match="atidlm:source" mode="set-ch-chunk" priority="0">
      <xsl:copy>
         <xsl:if test="not(@_gte:did-set-chunk)">
            <xsl:attribute name="_gte:did-set-chunk">yes</xsl:attribute>
         </xsl:if>
         <xsl:apply-templates select="@*|node()" mode="set-ch-chunk"/>
      </xsl:copy>
   </xsl:template>

   <!--Style template for Context: spb-item-->
<xsl:template name="__style-for_spb-item.1">
      <xsl:text> .x-spb-item-1-0 {margin-left: 0pt; margin-right: 0pt; }</xsl:text>
   </xsl:template>

   <!--Template for Context: spb-item-->
<xsl:template match="spb-item" priority="0"><!--Emit a nostyle template--><xsl:apply-templates/>
   </xsl:template>

   <!--Gentext template for Context: spb-item-->
<xsl:template match="spb-item" mode="expand-gentext" priority="0">
      <xsl:copy>
         <xsl:apply-templates select="@*|node()" mode="expand-gentext"/>
      </xsl:copy>
   </xsl:template>

   <!--Initial pass template for Context: spb-item-->
<xsl:template match="spb-item" mode="initial-pass-mode" priority="0">
      <xsl:copy>
         <xsl:call-template name="maybe-set-gte-id"/>
         <xsl:apply-templates select="@*|node()" mode="initial-pass-mode"/>
      </xsl:copy>
   </xsl:template>

   <!--Set count-as pass template for Context: spb-item-->
<xsl:template match="spb-item" mode="set-countas" priority="0">
      <xsl:copy>
         <xsl:apply-templates select="@*|node()" mode="set-countas"/>
      </xsl:copy>
   </xsl:template>

   <!--Set ch:chunk template for Context: spb-item-->
<xsl:template match="spb-item" mode="set-ch-chunk" priority="0">
      <xsl:copy>
         <xsl:if test="not(@_gte:did-set-chunk)">
            <xsl:attribute name="_gte:did-set-chunk">yes</xsl:attribute>
         </xsl:if>
         <xsl:apply-templates select="@*|node()" mode="set-ch-chunk"/>
      </xsl:copy>
   </xsl:template>

   <!--Style template for Context: spb-list-->
<xsl:template name="__style-for_spb-list.1">
      <xsl:text> .x-spb-list-1-0 {margin-left: 0pt; margin-right: 0pt; text-indent: 0pt; margin-top: 8pt; }</xsl:text>
   </xsl:template>

   <!--Template for Context: spb-list-->
<xsl:template match="spb-list" priority="0">
      <div><!--Emit class values to reflect conditions--><xsl:attribute name="class">
            <xsl:text> x-spb-list-1-0</xsl:text>
         </xsl:attribute>
         <xsl:if test="@xml:lang">
            <xsl:attribute name="lang">
               <xsl:call-template name="return-lang-applying-language-map">
                  <xsl:with-param name="doclang" select="@xml:lang"/>
               </xsl:call-template>
            </xsl:attribute>
         </xsl:if>
         <xsl:copy-of select="@ch:*"/>
         <xsl:if test="@xml:lang">
            <xsl:attribute name="lang">
               <xsl:call-template name="return-lang-applying-language-map">
                  <xsl:with-param name="doclang" select="@xml:lang"/>
               </xsl:call-template>
            </xsl:attribute>
         </xsl:if>
         <xsl:call-template name="maybe-set-id">
            <xsl:with-param name="only-if-id-attr" select="'no'"/>
            <xsl:with-param name="generated-id-prefix" select="'styler-id'"/>
         </xsl:call-template>
         <!--Process this element's content--><xsl:apply-templates/>
      </div>
   </xsl:template>

   <!--Gentext template for Context: spb-list-->
<xsl:template match="spb-list" mode="expand-gentext" priority="0">
      <xsl:copy>
         <xsl:apply-templates select="@*|node()" mode="expand-gentext"/>
      </xsl:copy>
   </xsl:template>

   <!--Initial pass template for Context: spb-list-->
<xsl:template match="spb-list" mode="initial-pass-mode" priority="0">
      <xsl:copy>
         <xsl:call-template name="maybe-set-gte-id"/>
         <xsl:apply-templates select="@*|node()" mode="initial-pass-mode"/>
      </xsl:copy>
   </xsl:template>

   <!--Set count-as pass template for Context: spb-list-->
<xsl:template match="spb-list" mode="set-countas" priority="0">
      <xsl:copy>
         <xsl:apply-templates select="@*|node()" mode="set-countas"/>
      </xsl:copy>
   </xsl:template>

   <!--Set ch:chunk template for Context: spb-list-->
<xsl:template match="spb-list" mode="set-ch-chunk" priority="0">
      <xsl:copy>
         <xsl:if test="not(@_gte:did-set-chunk)">
            <xsl:attribute name="_gte:did-set-chunk">yes</xsl:attribute>
         </xsl:if>
         <xsl:apply-templates select="@*|node()" mode="set-ch-chunk"/>
      </xsl:copy>
   </xsl:template>

   <!--Style template for Context: subattach-->
<xsl:template name="__style-for_subattach.1">
      <xsl:text> .x-subattach-1-0 {margin-left: 0pt; margin-right: 0pt; text-indent: 0pt; }</xsl:text>
   </xsl:template>

   <!--Template for Context: subattach-->
<xsl:template match="subattach" priority="0">
      <div><!--Emit class values to reflect conditions--><xsl:attribute name="class">
            <xsl:text> x-subattach-1-0</xsl:text>
         </xsl:attribute>
         <xsl:if test="@xml:lang">
            <xsl:attribute name="lang">
               <xsl:call-template name="return-lang-applying-language-map">
                  <xsl:with-param name="doclang" select="@xml:lang"/>
               </xsl:call-template>
            </xsl:attribute>
         </xsl:if>
         <xsl:copy-of select="@ch:*"/>
         <xsl:if test="@xml:lang">
            <xsl:attribute name="lang">
               <xsl:call-template name="return-lang-applying-language-map">
                  <xsl:with-param name="doclang" select="@xml:lang"/>
               </xsl:call-template>
            </xsl:attribute>
         </xsl:if>
         <xsl:call-template name="maybe-set-id"/>
         <!--Process this element's content--><xsl:apply-templates/>
      </div>
   </xsl:template>

   <!--Gentext template for Context: subattach-->
<xsl:template match="subattach" mode="expand-gentext" priority="0">
      <xsl:copy>
         <xsl:attribute name="_gte:Gentext-Expanded">y</xsl:attribute>
         <xsl:apply-templates select="@*" mode="expand-gentext"/>
         <xsl:if test="not(@_gte:id)">
            <xsl:attribute name="_gte:id">
               <xsl:value-of select="'_g_'"/>
               <xsl:value-of select="generate-id(.)"/>
            </xsl:attribute>
         </xsl:if>
         <!--Unconditional AddBefore--><xsl:if test="not(@_gte:Gentext-Expanded)">
            <_gte:Must-Expand-Gentext/>
            <_sfe:BeforeOrAfterText>
               <xsl:text>ATTACHING PARTS</xsl:text>
            </_sfe:BeforeOrAfterText>
         </xsl:if>
         <xsl:apply-templates select="* | text() | processing-instruction()" mode="expand-gentext"/>
         <!--Unconditional AddAfter--><xsl:if test="not(@_gte:Gentext-Expanded)">
            <_gte:Must-Expand-Gentext/>
            <_sfe:BeforeOrAfterText>
               <xsl:processing-instruction name="Pub">_newline</xsl:processing-instruction>
               <xsl:text>------ * ------</xsl:text>
            </_sfe:BeforeOrAfterText>
         </xsl:if>
      </xsl:copy>
   </xsl:template>

   <!--Initial pass template for Context: subattach-->
<xsl:template match="subattach" mode="initial-pass-mode" priority="0">
      <xsl:copy>
         <xsl:call-template name="maybe-set-gte-id"/>
         <xsl:apply-templates select="@*|node()" mode="initial-pass-mode"/>
      </xsl:copy>
   </xsl:template>

   <!--Set count-as pass template for Context: subattach-->
<xsl:template match="subattach" mode="set-countas" priority="0">
      <xsl:copy>
         <xsl:apply-templates select="@*|node()" mode="set-countas"/>
      </xsl:copy>
   </xsl:template>

   <!--Set ch:chunk template for Context: subattach-->
<xsl:template match="subattach" mode="set-ch-chunk" priority="0">
      <xsl:copy>
         <xsl:if test="not(@_gte:did-set-chunk)">
            <xsl:attribute name="_gte:did-set-chunk">yes</xsl:attribute>
         </xsl:if>
         <xsl:apply-templates select="@*|node()" mode="set-ch-chunk"/>
      </xsl:copy>
   </xsl:template>

   <!--Style template for Context: supp-code-->
<xsl:template name="__style-for_supp-code.1">
      <xsl:text> .x-supp-code-1-0 {margin-left: 0pt; margin-right: 0pt; text-indent: 0pt; }</xsl:text>
   </xsl:template>

   <!--Template for Context: supp-code-->
<xsl:template match="supp-code" priority="0">
      <div><!--Emit class values to reflect conditions--><xsl:attribute name="class">
            <xsl:text> x-supp-code-1-0</xsl:text>
         </xsl:attribute>
         <xsl:if test="@xml:lang">
            <xsl:attribute name="lang">
               <xsl:call-template name="return-lang-applying-language-map">
                  <xsl:with-param name="doclang" select="@xml:lang"/>
               </xsl:call-template>
            </xsl:attribute>
         </xsl:if>
         <xsl:copy-of select="@ch:*"/>
         <xsl:if test="@xml:lang">
            <xsl:attribute name="lang">
               <xsl:call-template name="return-lang-applying-language-map">
                  <xsl:with-param name="doclang" select="@xml:lang"/>
               </xsl:call-template>
            </xsl:attribute>
         </xsl:if>
         <xsl:call-template name="maybe-set-id"/>
         <!--Process this element's content--><xsl:apply-templates/>
      </div>
   </xsl:template>

   <!--Gentext template for Context: supp-code-->
<xsl:template match="supp-code" mode="expand-gentext" priority="0">
      <xsl:copy>
         <xsl:attribute name="_gte:Gentext-Expanded">y</xsl:attribute>
         <xsl:apply-templates select="@*" mode="expand-gentext"/>
         <xsl:if test="not(@_gte:id)">
            <xsl:attribute name="_gte:id">
               <xsl:value-of select="'_g_'"/>
               <xsl:value-of select="generate-id(.)"/>
            </xsl:attribute>
         </xsl:if>
         <!--Unconditional AddBefore--><xsl:if test="not(@_gte:Gentext-Expanded)">
            <_gte:Must-Expand-Gentext/>
            <_sfe:BeforeOrAfterText>
               <xsl:text>SUPPLIER CODE: </xsl:text>
            </_sfe:BeforeOrAfterText>
         </xsl:if>
         <xsl:apply-templates select="* | text() | processing-instruction()" mode="expand-gentext"/>
      </xsl:copy>
   </xsl:template>

   <!--Initial pass template for Context: supp-code-->
<xsl:template match="supp-code" mode="initial-pass-mode" priority="0">
      <xsl:copy>
         <xsl:call-template name="maybe-set-gte-id"/>
         <xsl:apply-templates select="@*|node()" mode="initial-pass-mode"/>
      </xsl:copy>
   </xsl:template>

   <!--Set count-as pass template for Context: supp-code-->
<xsl:template match="supp-code" mode="set-countas" priority="0">
      <xsl:copy>
         <xsl:apply-templates select="@*|node()" mode="set-countas"/>
      </xsl:copy>
   </xsl:template>

   <!--Set ch:chunk template for Context: supp-code-->
<xsl:template match="supp-code" mode="set-ch-chunk" priority="0">
      <xsl:copy>
         <xsl:if test="not(@_gte:did-set-chunk)">
            <xsl:attribute name="_gte:did-set-chunk">yes</xsl:attribute>
         </xsl:if>
         <xsl:apply-templates select="@*|node()" mode="set-ch-chunk"/>
      </xsl:copy>
   </xsl:template>

   <!--Style template for Context: supp-pn-->
<xsl:template name="__style-for_supp-pn.1">
      <xsl:text> .x-supp-pn-1-0 {margin-left: 0pt; margin-right: 0pt; text-indent: 0pt; }</xsl:text>
   </xsl:template>

   <!--Template for Context: supp-pn-->
<xsl:template match="supp-pn" priority="0">
      <div><!--Emit class values to reflect conditions--><xsl:attribute name="class">
            <xsl:text> x-supp-pn-1-0</xsl:text>
         </xsl:attribute>
         <xsl:if test="@xml:lang">
            <xsl:attribute name="lang">
               <xsl:call-template name="return-lang-applying-language-map">
                  <xsl:with-param name="doclang" select="@xml:lang"/>
               </xsl:call-template>
            </xsl:attribute>
         </xsl:if>
         <xsl:copy-of select="@ch:*"/>
         <xsl:if test="@xml:lang">
            <xsl:attribute name="lang">
               <xsl:call-template name="return-lang-applying-language-map">
                  <xsl:with-param name="doclang" select="@xml:lang"/>
               </xsl:call-template>
            </xsl:attribute>
         </xsl:if>
         <xsl:call-template name="maybe-set-id"/>
         <!--Process this element's content--><xsl:apply-templates/>
      </div>
   </xsl:template>

   <!--Gentext template for Context: supp-pn-->
<xsl:template match="supp-pn" mode="expand-gentext" priority="0">
      <xsl:copy>
         <xsl:attribute name="_gte:Gentext-Expanded">y</xsl:attribute>
         <xsl:apply-templates select="@*" mode="expand-gentext"/>
         <xsl:if test="not(@_gte:id)">
            <xsl:attribute name="_gte:id">
               <xsl:value-of select="'_g_'"/>
               <xsl:value-of select="generate-id(.)"/>
            </xsl:attribute>
         </xsl:if>
         <!--Unconditional AddBefore--><xsl:if test="not(@_gte:Gentext-Expanded)">
            <_gte:Must-Expand-Gentext/>
            <_sfe:BeforeOrAfterText>
               <xsl:text>SUPPLIER P/N </xsl:text>
            </_sfe:BeforeOrAfterText>
         </xsl:if>
         <xsl:apply-templates select="* | text() | processing-instruction()" mode="expand-gentext"/>
      </xsl:copy>
   </xsl:template>

   <!--Initial pass template for Context: supp-pn-->
<xsl:template match="supp-pn" mode="initial-pass-mode" priority="0">
      <xsl:copy>
         <xsl:call-template name="maybe-set-gte-id"/>
         <xsl:apply-templates select="@*|node()" mode="initial-pass-mode"/>
      </xsl:copy>
   </xsl:template>

   <!--Set count-as pass template for Context: supp-pn-->
<xsl:template match="supp-pn" mode="set-countas" priority="0">
      <xsl:copy>
         <xsl:apply-templates select="@*|node()" mode="set-countas"/>
      </xsl:copy>
   </xsl:template>

   <!--Set ch:chunk template for Context: supp-pn-->
<xsl:template match="supp-pn" mode="set-ch-chunk" priority="0">
      <xsl:copy>
         <xsl:if test="not(@_gte:did-set-chunk)">
            <xsl:attribute name="_gte:did-set-chunk">yes</xsl:attribute>
         </xsl:if>
         <xsl:apply-templates select="@*|node()" mode="set-ch-chunk"/>
      </xsl:copy>
   </xsl:template>

   <!--Style template for Context: atidlm:target-->
<xsl:template name="__style-for_atidlm-target.1">
      <xsl:text> .x-atidlm-target-1-0 {margin-left: 0pt; margin-right: 0pt; text-indent: 0pt; }</xsl:text>
   </xsl:template>

   <!--Template for Context: atidlm:target-->
<xsl:template match="atidlm:target" priority="0">
      <span><!--Emit class values to reflect conditions--><xsl:attribute name="class">
            <xsl:text> x-atidlm-target-1-0</xsl:text>
         </xsl:attribute>
         <xsl:if test="@xml:lang">
            <xsl:attribute name="lang">
               <xsl:call-template name="return-lang-applying-language-map">
                  <xsl:with-param name="doclang" select="@xml:lang"/>
               </xsl:call-template>
            </xsl:attribute>
         </xsl:if>
         <xsl:copy-of select="@ch:*"/>
         <xsl:if test="@xml:lang">
            <xsl:attribute name="lang">
               <xsl:call-template name="return-lang-applying-language-map">
                  <xsl:with-param name="doclang" select="@xml:lang"/>
               </xsl:call-template>
            </xsl:attribute>
         </xsl:if>
         <xsl:call-template name="maybe-set-id"/>
         <!--Process this element's content--><xsl:apply-templates/>
      </span>
   </xsl:template>

   <!--Gentext template for Context: atidlm:target-->
<xsl:template match="atidlm:target" mode="expand-gentext" priority="0">
      <xsl:copy>
         <xsl:apply-templates select="@*|node()" mode="expand-gentext"/>
      </xsl:copy>
   </xsl:template>

   <!--Initial pass template for Context: atidlm:target-->
<xsl:template match="atidlm:target" mode="initial-pass-mode" priority="0">
      <xsl:copy>
         <xsl:call-template name="maybe-set-gte-id"/>
         <xsl:apply-templates select="@*|node()" mode="initial-pass-mode"/>
      </xsl:copy>
   </xsl:template>

   <!--Set count-as pass template for Context: atidlm:target-->
<xsl:template match="atidlm:target" mode="set-countas" priority="0">
      <xsl:copy>
         <xsl:apply-templates select="@*|node()" mode="set-countas"/>
      </xsl:copy>
   </xsl:template>

   <!--Set ch:chunk template for Context: atidlm:target-->
<xsl:template match="atidlm:target" mode="set-ch-chunk" priority="0">
      <xsl:copy>
         <xsl:if test="not(@_gte:did-set-chunk)">
            <xsl:attribute name="_gte:did-set-chunk">yes</xsl:attribute>
         </xsl:if>
         <xsl:apply-templates select="@*|node()" mode="set-ch-chunk"/>
      </xsl:copy>
   </xsl:template>

   <!--Style template for Context: unit-title-->
<xsl:template name="__style-for_unit-title.1">
      <xsl:text> .x-unit-title-1-0 {margin-left: 0pt; margin-right: 0pt; }</xsl:text>
   </xsl:template>

   <!--Template for Context: unit-title-->
<xsl:template match="unit-title" priority="0"><!--Emit a nostyle template--><xsl:apply-templates/>
   </xsl:template>

   <!--Gentext template for Context: unit-title-->
<xsl:template match="unit-title" mode="expand-gentext" priority="0">
      <xsl:copy>
         <xsl:apply-templates select="@*|node()" mode="expand-gentext"/>
      </xsl:copy>
   </xsl:template>

   <!--Initial pass template for Context: unit-title-->
<xsl:template match="unit-title" mode="initial-pass-mode" priority="0">
      <xsl:copy>
         <xsl:call-template name="maybe-set-gte-id"/>
         <xsl:apply-templates select="@*|node()" mode="initial-pass-mode"/>
      </xsl:copy>
   </xsl:template>

   <!--Set count-as pass template for Context: unit-title-->
<xsl:template match="unit-title" mode="set-countas" priority="0">
      <xsl:copy>
         <xsl:apply-templates select="@*|node()" mode="set-countas"/>
      </xsl:copy>
   </xsl:template>

   <!--Set ch:chunk template for Context: unit-title-->
<xsl:template match="unit-title" mode="set-ch-chunk" priority="0">
      <xsl:copy>
         <xsl:if test="not(@_gte:did-set-chunk)">
            <xsl:attribute name="_gte:did-set-chunk">yes</xsl:attribute>
         </xsl:if>
         <xsl:apply-templates select="@*|node()" mode="set-ch-chunk"/>
      </xsl:copy>
   </xsl:template>

   <!--Global ReferenceFormat template for referenceFormatName=Label_Number-->
<xsl:template match="*" mode="styler_xref-Label_Number">
      <_gte:Must-Expand-Gentext/>
      <xsl:apply-templates mode="styler-LabelAndNumberMarker" select="."/>
   </xsl:template>

   <!--Global ReferenceFormat template for referenceFormatName=Label_Number_Text-->
<xsl:template match="*" mode="styler_xref-Label_Number_Text">
      <_gte:Must-Expand-Gentext/>
      <xsl:apply-templates mode="styler-LabelAndNumberMarker" select="."/>
      <xsl:text> </xsl:text>
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

   <!--Global ReferenceFormat template for referenceFormatName=Label_Number_Text_Page-->
<xsl:template match="*" mode="styler_xref-Label_Number_Text_Page">
      <_gte:Must-Expand-Gentext/>
      <xsl:apply-templates mode="styler-LabelAndNumberMarker" select="."/>
      <xsl:text> </xsl:text>
      <_sfe:CrossReferenceTitle>
         <xsl:if test="node()[not(self::_sfe:BeforeOrAfterText)]">
            <_gte:Gentexted-Content-Wrapper>
               <xsl:apply-templates mode="expand-gentext">
                  <xsl:with-param name="skip-expanded-gentext" select="'yes'"/>
               </xsl:apply-templates>
            </_gte:Gentexted-Content-Wrapper>
         </xsl:if>
      </_sfe:CrossReferenceTitle>
      <xsl:text>, page </xsl:text>
   </xsl:template>

   <!--Global ReferenceFormat template for referenceFormatName=Number-->
<xsl:template match="*" mode="styler_xref-Number">
      <_gte:Must-Expand-Gentext/>
      <_gte:styler_numbering do-qmark="no">
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
   </xsl:template>

   <!--Global ReferenceFormat template for referenceFormatName=Number_Text-->
<xsl:template match="*" mode="styler_xref-Number_Text">
      <_gte:Must-Expand-Gentext/>
      <_gte:styler_numbering do-qmark="no">
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
      <xsl:text> </xsl:text>
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

   <!--Global ReferenceFormat template for referenceFormatName=Page-->
<xsl:template match="*" mode="styler_xref-Page">
      <_gte:Must-Expand-Gentext/>
   </xsl:template>

   <!--Global ReferenceFormat template for referenceFormatName=Text-->
<xsl:template match="*" mode="styler_xref-Text">
      <_gte:Must-Expand-Gentext/>
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

   <!--There is no mapping for PageTypes (an unexpected element).-->

<!--There is no mapping for PageRegions (an unexpected element).-->

<!--There is no mapping for GeneratedContents (an unexpected element).-->

<!--Named template for TableOfContents=Table_of_Contents-->
<xsl:template name="_gte-toc-Table_of_Contents"/>

   <!--Template to generate external CSS file-->
<xsl:template name="generate-external-css-file">
      <xsl:if test="$external-css-filename!=''">
         <xsl:result-document href="{$external-css-filename}" method="text" indent="yes">
&#xD;
            <xsl:variable name="effective-document-elemname"
                          select="name(//*[not(self::RDStyle) and not(self::ResolvedMap)][1])"/>
            <xsl:choose>
               <xsl:when test="true()"/>
            </xsl:choose>
&#xD;

&#xD;
 .x--sfe-BeforeOrAfterText-1-0 {margin-left: 0pt; margin-right: 0pt; }
&#xD;

&#xD;
 .x--sfe-CollectionItem-1-0 {margin-left: 0pt; margin-right: 0pt; }
&#xD;

&#xD;
 .x--sfe-CollectionItem-2-0 {margin-left: 0pt; margin-right: 0pt; }
&#xD;

&#xD;
 .x--sfe-CollectionItem-3-0 {margin-left: 0pt; margin-right: 0pt; }
&#xD;

&#xD;
 .x--sfe-CollectionItem-4-0 {margin-left: 0pt; margin-right: 0pt; }
&#xD;

&#xD;
 .x--sfe-CrossReference-1-0 {margin-left: 0pt; margin-right: 0pt; }
&#xD;

&#xD;
 .x--sfe-CrossReferenceTitle-1-0 {margin-left: 0pt; margin-right: 0pt; }
&#xD;

&#xD;
 .x--sfe-CrossReferenceTitle-2-0 {margin-left: 0pt; margin-right: 0pt; font-style: italic; }
&#xD;

&#xD;
 .x--sfe-Gentext-1-0 {margin-left: 0pt; margin-right: 0pt; }
&#xD;

&#xD;
 .x--sfe-HeaderOrFooter-1-0 {margin-left: 0pt; margin-right: 0pt; text-indent: 0pt; margin-top: 0pt; }
&#xD;

&#xD;
 .x--sfe-Index-1-0 {margin-left: 0pt; margin-right: 0pt; text-indent: 0pt; }
&#xD;

&#xD;
 .x--sfe-IndexAlphaGroup-1-0 {margin-left: 0pt; margin-right: 0pt; text-indent: 0pt; margin-top: 1.5pc; }
&#xD;

&#xD;
 .x--sfe-IndexEndPage-1-0 {margin-left: 0pt; margin-right: 0pt; }
&#xD;

&#xD;
 .x--sfe-IndexEntry-1-0 {margin-left: 0pt; margin-right: 0pt; text-indent: 0pt; margin-left: 1em; text-indent: -.5em; text-align: left; }
&#xD;

&#xD;
 .x--sfe-IndexEntry-2-0 {margin-left: 0pt; margin-right: 0pt; text-indent: 0pt; margin-left: 1em; text-indent: -.5em; text-align: left; }
&#xD;

&#xD;
 .x--sfe-IndexEntry-3-0 {margin-left: 0pt; margin-right: 0pt; text-indent: 0pt; margin-left: 1em; text-indent: -.5em; text-align: left; }
&#xD;

&#xD;
 .x--sfe-IndexEntry-4-0 {margin-left: 0pt; margin-right: 0pt; text-indent: 0pt; margin-left: .5em; margin-right: 2pc; text-indent: -.5em; text-align: left; }
&#xD;

&#xD;
 .x--sfe-IndexGroupHead-1-0 {margin-left: 0pt; margin-right: 0pt; text-indent: 0pt; font-family: sans-serif; font-weight: bold; font-size: 14pt; text-transform: uppercase; text-align: left; margin-bottom: .5pc; }
&#xD;

&#xD;
 .x--sfe-IndexHeading-1-0 {margin-left: 0pt; margin-right: 0pt; }
&#xD;

&#xD;
 .x--sfe-IndexLocators-1-0 {margin-left: 0pt; margin-right: 0pt; }
&#xD;

&#xD;
 .x--sfe-IndexPage-1-0 {margin-left: 0pt; margin-right: 0pt; }
&#xD;

&#xD;
 .x--sfe-IndexPage-2-0 {margin-left: 0pt; margin-right: 0pt; }
&#xD;

&#xD;
 .x--sfe-IndexPostGroup-1-0 {margin-left: 0pt; margin-right: 0pt; text-indent: 0pt; margin-top: 1.5pc; }
&#xD;

&#xD;
 .x--sfe-IndexPreGroup-1-0 {margin-left: 0pt; margin-right: 0pt; text-indent: 0pt; margin-top: 1.5pc; }
&#xD;

&#xD;
 .x--sfe-IndexRangeGroup-1-0 {margin-left: 0pt; margin-right: 0pt; text-indent: 0pt; margin-top: 1.5pc; }
&#xD;

&#xD;
 .x--sfe-IndexSee-1-0 {margin-left: 0pt; margin-right: 0pt; }
&#xD;

&#xD;
 .x--sfe-IndexSeeAlso-1-0 {margin-left: 0pt; margin-right: 0pt; text-indent: 0pt; margin-left: 3em; text-indent: -1.5em; }
&#xD;

&#xD;
 .x--sfe-IndexSubGroupHead-1-0 {margin-left: 0pt; margin-right: 0pt; text-indent: 0pt; font-weight: bold; font-size: 14pt; text-transform: uppercase; text-align: left; margin-top: 2pc; }
&#xD;

&#xD;
 .x--sfe-RepeatingTitle-1-0 {margin-left: 0pt; margin-right: 0pt; text-indent: 0pt; }
&#xD;

&#xD;
 .x--sfe-TableOfContents-1-0 {margin-left: 0pt; margin-right: 0pt; text-indent: 0pt; }
&#xD;

&#xD;
 .x--sfe-TocEntry1-Table-of-Contents-1-0 {margin-left: 0pt; margin-right: 0pt; text-indent: 0pt; margin-left: 4em; margin-right: 2pc; text-indent: -4.00em; }
&#xD;

&#xD;
 .x--sfe-TocEntry2-Table-of-Contents-1-0 {margin-left: 0pt; margin-right: 0pt; text-indent: 0pt; margin-left: 6em; margin-right: 2pc; text-indent: -4.00em; }
&#xD;

&#xD;
 .x--sfe-TocEntry3-Table-of-Contents-1-0 {margin-left: 0pt; margin-right: 0pt; text-indent: 0pt; margin-left: 8em; margin-right: 2pc; text-indent: -4.00em; }
&#xD;

&#xD;
 .x--sfe-TocEntry4-Table-of-Contents-1-0 {margin-left: 0pt; margin-right: 0pt; text-indent: 0pt; margin-left: 10em; margin-right: 2pc; text-indent: -4.00em; }
&#xD;

&#xD;
 .x--sfe-TocEntry5-Table-of-Contents-1-0 {margin-left: 0pt; margin-right: 0pt; text-indent: 0pt; margin-left: 12em; margin-right: 2pc; text-indent: -12em; }
&#xD;

&#xD;
 .x--sfe-TocEntry6-Table-of-Contents-1-0 {margin-left: 0pt; margin-right: 0pt; text-indent: 0pt; margin-left: 14em; margin-right: 2pc; text-indent: -14em; }
&#xD;

&#xD;
 .x--sfe-TocLabel-Table-of-Contents-1-0 {margin-left: 0pt; margin-right: 0pt; }
&#xD;

&#xD;
 .x--sfe-TocPage-Table-of-Contents-1-0 {margin-left: 0pt; margin-right: 0pt; }
&#xD;

&#xD;
 .x--sfe-TocTable-of-Contents-1-0 {margin-left: 0pt; margin-right: 0pt; }
&#xD;

&#xD;
 .x--sfe-TocTitle-Table-of-Contents-1-0 {margin-left: 0pt; margin-right: 0pt; }
&#xD;

&#xD;
 .x-acc-man-ref-1-0 {margin-left: 0pt; margin-right: 0pt; }
&#xD;

&#xD;
 .x-attach-parts-1-0 {margin-left: 0pt; margin-right: 0pt; text-indent: 0pt; }
&#xD;

&#xD;
 .x-bs-group-1-0 {margin-left: 0pt; margin-right: 0pt; }
&#xD;

&#xD;
 .x-build-spec-1-0 {margin-left: 0pt; margin-right: 0pt; text-indent: 0pt; margin-bottom: 12pt; }
&#xD;

&#xD;
 .x-chap-1-0 {margin-left: 0pt; margin-right: 0pt; }
&#xD;

&#xD;
 .x-dimen-1-0 {margin-left: 0pt; margin-right: 0pt; }
&#xD;

&#xD;
 .x-eff-bs-1-0 {margin-left: 0pt; margin-right: 0pt; }
&#xD;

&#xD;
 .x-eff-code-1-0 {margin-left: 0pt; margin-right: 0pt; text-indent: 0pt; } /* gdb 12-10-12: removed all source edits making it a hyperlink */
&#xD;

&#xD;
 .x-eff-letter-1-0 {margin-left: 0pt; margin-right: 0pt; }
&#xD;

&#xD;
 .x-eff-model-1-0 {margin-left: 0pt; margin-right: 0pt; }
&#xD;

&#xD;
 .x-fignote-1-0 {margin-left: 0pt; margin-right: 0pt; text-indent: 0pt; }
&#xD;

&#xD;
 .x-figure-1-0 {margin-left: 0pt; margin-right: 0pt; text-indent: 0pt; margin-top: 8pt; }
&#xD;

&#xD;
 .x-figure-2-0 {margin-left: 0pt; margin-right: 0pt; text-indent: 0pt; margin-top: 8pt; }
&#xD;

&#xD;
 .x-imp-1-0 {margin-left: 0pt; margin-right: 0pt; }
&#xD;

&#xD;
 .x-atidlm-inclusion-1-0 {margin-left: 0pt; margin-right: 0pt; text-indent: 0pt; }
&#xD;

&#xD;
 .x-inter-1-0 {margin-left: 0pt; margin-right: 0pt; text-indent: 0pt; }
&#xD;
 .x-inter-1-1 {}
&#xD;
 .x-inter-1-2 {}
&#xD;
 .x-inter-1-3 {}
&#xD;
 .x-inter-1-4 {}
&#xD;
 .x-inter-1-5 {}
&#xD;
 .x-inter-1-6 {}
&#xD;
 .x-inter-1-7 {}
&#xD;

&#xD;
 .x-ipc-fig-1-0 {margin-left: 0pt; margin-right: 0pt; text-indent: 0pt; }
&#xD;

&#xD;
 .x-ipc-fig-delete-1-0 {margin-left: 0pt; margin-right: 0pt; }
&#xD;

&#xD;
 .x-ipc-fig-reloc-1-0 {margin-left: 0pt; margin-right: 0pt; }
&#xD;

&#xD;
 .x-kits-1-0 {margin-left: 0pt; margin-right: 0pt; text-indent: 0pt; }
&#xD;

&#xD;
 .x-atidlm-linkcontent-1-0 {margin-left: 0pt; margin-right: 0pt; text-indent: 0pt; }
&#xD;

&#xD;
 .x-lpln-1-0 {margin-left: 0pt; margin-right: 0pt; text-indent: 0pt; }
&#xD;

&#xD;
 .x-met-1-0 {margin-left: 0pt; margin-right: 0pt; }
&#xD;

&#xD;
 .x-atidlm-metadata-1-0 {margin-left: 0pt; margin-right: 0pt; text-indent: 0pt; }
&#xD;

&#xD;
 .x-misc-1-0 {margin-left: 0pt; margin-right: 0pt; text-indent: 0pt; }
&#xD;

&#xD;
 .x-name-1-0 {margin-left: 0pt; margin-right: 0pt; }
&#xD;
 .x-name-1-1 {}
&#xD;
 .x-name-1-2 {}
&#xD;
 .x-name-1-3 {}
&#xD;
 .x-name-1-4 {}
&#xD;
 .x-name-1-5 {}
&#xD;
 .x-name-1-6 {}
&#xD;
 .x-name-1-7 {}
&#xD;
 .x-name-1-8 {}
&#xD;
 .x-name-1-9 {}
&#xD;
 .x-name-1-10 {}
&#xD;
 .x-name-1-11 {}
&#xD;
 .x-name-1-12 {}
&#xD;

&#xD;
 .x-nomen-col-1-0 {margin-left: 0pt; margin-right: 0pt; text-indent: 0pt; text-transform: uppercase; }
&#xD;
 .x-nomen-col-1-1 {margin-left: 8pt; text-indent: -7pt; }
&#xD;
 .x-nomen-col-1-2 {margin-left: 12pt; text-indent: -11pt; }
&#xD;
 .x-nomen-col-1-3 {margin-left: 16pt; text-indent: -15pt; }
&#xD;
 .x-nomen-col-1-4 {margin-left: 20pt; text-indent: -19pt; }
&#xD;
 .x-nomen-col-1-5 {}
&#xD;
 .x-nomen-col-1-6 {}
&#xD;
 .x-nomen-col-1-7 {}
&#xD;
 .x-nomen-col-1-8 {}
&#xD;
 .x-nomen-col-1-9 {}
&#xD;
 .x-nomen-col-1-10 {}
&#xD;
 .x-nomen-col-1-11 {}
&#xD;
 .x-nomen-col-1-12 {}
&#xD;
 .x-nomen-col-1-13 {}
&#xD;

&#xD;
 .x-note-1-0 {margin-left: 0pt; margin-right: 0pt; text-indent: 0pt; margin-top: 8pt; margin-left: 70pt; text-indent: -45pt; }
&#xD;
 .x-note-1-1 {}
&#xD;

&#xD;
 .x-note-2-0 {margin-left: 0pt; margin-right: 0pt; text-indent: 0pt; margin-top: 8pt; margin-left: 59pt; text-indent: -41pt; }
&#xD;
 .x-note-2-1 {margin-left: 76pt; text-indent: -57pt; }
&#xD;

&#xD;
 .x-note-3-0 {margin-left: 0pt; margin-right: 0pt; text-indent: 0pt; }
&#xD;

&#xD;
 .x-note-4-0 {margin-left: 0pt; margin-right: 0pt; text-indent: 0pt; }
&#xD;

&#xD;
 .x-note-5-0 {margin-left: 0pt; margin-right: 0pt; text-indent: 0pt; }
&#xD;

&#xD;
 .x-note-6-0 {margin-left: 0pt; margin-right: 0pt; text-indent: 0pt; }
&#xD;

&#xD;
 .x-note-7-0 {margin-left: 0pt; margin-right: 0pt; text-indent: 0pt; }
&#xD;

&#xD;
 .x-note-8-0 {margin-left: 0pt; margin-right: 0pt; text-indent: 0pt; margin-top: 8pt; margin-left: 59pt; text-indent: -41pt; }
&#xD;
 .x-note-8-1 {margin-left: 76pt; text-indent: -57pt; }
&#xD;

&#xD;
 .x-note-9-0 {margin-left: 0pt; margin-right: 0pt; text-indent: 0pt; margin-top: 8pt; margin-left: 43pt; text-indent: -43pt; }
&#xD;
 .x-note-9-1 {}
&#xD;

&#xD;
 .x-optitem-1-0 {margin-left: 0pt; margin-right: 0pt; }
&#xD;

&#xD;
 .x-optpn-1-0 {margin-left: 0pt; margin-right: 0pt; }
&#xD;

&#xD;
 .x-part-nbr-1-0 {margin-left: 0pt; margin-right: 0pt; text-indent: 0pt; }
&#xD;
 .x-part-nbr-1-1 {}
&#xD;

&#xD;
 .x--ufe-partial-breakdown-1-0 {margin-left: 0pt; margin-right: 0pt; text-indent: 0pt; }
&#xD;
 .x--ufe-partial-breakdown-1-1 {margin-left: -8pt; text-indent: 0pt; }
&#xD;
 .x--ufe-partial-breakdown-1-2 {margin-left: -12pt; text-indent: 0pt; }
&#xD;
 .x--ufe-partial-breakdown-1-3 {margin-left: -16pt; text-indent: 0pt; }
&#xD;
 .x--ufe-partial-breakdown-1-4 {margin-left: -20pt; text-indent: 0pt; }
&#xD;

&#xD;
 .x-parts-list-1-0 {margin-left: 0pt; margin-right: 0pt; text-indent: 0pt; }
&#xD;

&#xD;
 .x-pd-list-1-0 {margin-left: 0pt; margin-right: 0pt; }
&#xD;

&#xD;
 .x-pntype-1-0 {margin-left: 0pt; margin-right: 0pt; text-indent: 0pt; }
&#xD;
 .x-pntype-1-1 {}
&#xD;
 .x-pntype-1-2 {}
&#xD;
 .x-pntype-1-3 {}
&#xD;
 .x-pntype-1-4 {}
&#xD;
 .x-pntype-1-5 {}
&#xD;
 .x-pntype-1-6 {}
&#xD;
 .x-pntype-1-7 {}
&#xD;
 .x-pntype-1-8 {}
&#xD;
 .x-pntype-1-9 {}
&#xD;
 .x-pntype-1-10 {}
&#xD;

&#xD;
 .x-pntype-2-0 {margin-left: 0pt; margin-right: 0pt; text-indent: 0pt; }
&#xD;
 .x-pntype-2-1 {}
&#xD;
 .x-pntype-2-2 {}
&#xD;
 .x-pntype-2-3 {}
&#xD;
 .x-pntype-2-4 {}
&#xD;
 .x-pntype-2-5 {}
&#xD;

&#xD;
 .x-pwc-pn-1-0 {margin-left: 0pt; margin-right: 0pt; text-indent: 0pt; }
&#xD;

&#xD;
 .x-range-1-0 {margin-left: 0pt; margin-right: 0pt; text-indent: 0pt; }
&#xD;
 .x-range-1-1 {}
&#xD;

&#xD;
 .x-atidlm-resourcepair-1-0 {margin-left: 0pt; margin-right: 0pt; text-indent: 0pt; }
&#xD;

&#xD;
 .x-sb-stat-1-0 {margin-left: 0pt; margin-right: 0pt; text-indent: 0pt; color: #0000FF; text-decoration: underline ; text-decoration: underline ; }
&#xD;
 .x-sb-stat-1-1 {}
&#xD;
 .x-sb-stat-1-2 {}
&#xD;
 .x-sb-stat-1-3 {}
&#xD;
 .x-sb-stat-1-4 {}
&#xD;
 .x-sb-stat-1-5 {}
&#xD;

&#xD;
 .x-sb-stat-2-0 {margin-left: 0pt; margin-right: 0pt; text-indent: 0pt; color: #0000FF; text-decoration: underline ; text-decoration: underline ; }
&#xD;
 .x-sb-stat-2-1 {}
&#xD;
 .x-sb-stat-2-2 {}
&#xD;
 .x-sb-stat-2-3 {}
&#xD;
 .x-sb-stat-2-4 {}
&#xD;
 .x-sb-stat-2-5 {}
&#xD;

&#xD;
 .x-sb-stat-3-0 {margin-left: 0pt; margin-right: 0pt; color: #0000FF; text-decoration: underline ; text-decoration: underline ; }
&#xD;

&#xD;
 .x-sb-stat-4-0 {margin-left: 0pt; margin-right: 0pt; color: #0000FF; text-decoration: underline ; text-decoration: underline ; }
&#xD;

&#xD;
 .x-see-1-0 {margin-left: 0pt; margin-right: 0pt; text-indent: 0pt; }
&#xD;
 .x-see-1-1 {}
&#xD;
 .x-see-1-2 {}
&#xD;
 .x-see-1-3 {}
&#xD;
 .x-see-1-4 {}
&#xD;
 .x-see-1-5 {}
&#xD;
 .x-see-1-6 {}
&#xD;
 .x-see-1-7 {}
&#xD;

&#xD;
 .x-service-bull-list-1-0 {margin-left: 0pt; margin-right: 0pt; text-indent: 0pt; margin-top: 8pt; }
&#xD;

&#xD;
 .x-atidlm-source-1-0 {margin-left: 0pt; margin-right: 0pt; text-indent: 0pt; }
&#xD;

&#xD;
 .x-spb-item-1-0 {margin-left: 0pt; margin-right: 0pt; }
&#xD;

&#xD;
 .x-spb-list-1-0 {margin-left: 0pt; margin-right: 0pt; text-indent: 0pt; margin-top: 8pt; }
&#xD;

&#xD;
 .x-subattach-1-0 {margin-left: 0pt; margin-right: 0pt; text-indent: 0pt; }
&#xD;

&#xD;
 .x-supp-code-1-0 {margin-left: 0pt; margin-right: 0pt; text-indent: 0pt; }
&#xD;

&#xD;
 .x-supp-pn-1-0 {margin-left: 0pt; margin-right: 0pt; text-indent: 0pt; }
&#xD;

&#xD;
 .x-atidlm-target-1-0 {margin-left: 0pt; margin-right: 0pt; text-indent: 0pt; }
&#xD;

&#xD;
 .x-unit-title-1-0 {margin-left: 0pt; margin-right: 0pt; }
&#xD;

&#xD;
table {border-color: #000000; font-size: 100%; border-collapse: collapse; }
&#xD;
td, th, { border-color: #000000; }
&#xD;
table[rules][rules="none"]  &gt; tr &gt; td, table[rules][rules="none"] &gt; * &gt; tr &gt; td, table[rules][rules="none"] &gt; tr &gt; th, table[rules][rules="none"] &gt; * &gt; tr &gt; th, table[rules][rules="none"] &gt; td, table[rules][rules="none"] &gt; th { border-width: thin; border-style: none; }
&#xD;
table[frame="box"][border]:not([border="0"]), table[frame="border"][border]:not([border="0"]), table:not([frame])[border]:not([border="0"]) { border-style: solid; }
&#xD;
 .entry-in-tbody {}
&#xD;

&#xD;
 .x-Table-of-Contents-toc-entry-indent-1 {text-decoration: none; margin-left: 0em}
&#xD;
 .x-Table-of-Contents-toc-entry-indent-2 {text-decoration: none; margin-left: 0em}
&#xD;
 .x-Table-of-Contents-toc-entry-indent-3 {text-decoration: none; margin-left: 0em}
&#xD;
 .x-Table-of-Contents-toc-entry-indent-4 {text-decoration: none; margin-left: 0em}
&#xD;
 .x-Table-of-Contents-toc-entry-indent-5 {text-decoration: none; margin-left: 8em}
&#xD;
 .x-Table-of-Contents-toc-entry-indent-6 {text-decoration: none; margin-left: 10em}
&#xD;
 .x-Table-of-Contents-toc-entry-indent-7 {text-decoration: none; margin-left: 12em}
&#xD;
 .x-Table-of-Contents-toc-entry-indent-8 {text-decoration: none; margin-left: 14em}
&#xD;
 .x-Table-of-Contents-toc-entry-indent-9 {text-decoration: none; margin-left: 16em}
&#xD;
 .x-Table-of-Contents-toc-entry-indent-10 {text-decoration: none; margin-left: 18em}
&#xD;
 .x--zero-left-margins {margin-left: 0pt; text-indent: 0pt; }
&#xD;
 .x--zero-text-indent {text-indent: 0pt; }
&#xD;
 .x--zero-top-bot-margins {margin-top: 0pt; margin-bottom: 0pt; }</xsl:result-document>
      </xsl:if>
   </xsl:template>

   <xsl:template match="*" mode="styler-LabelAndNumberMarker"/>

   <xsl:template match="*" mode="startat-xpath"><!-- This will evaluate to NaN which will cause no numbering offset -->
<xsl:value-of select="number('no-startAtXPath')"/>
   </xsl:template>

   <xsl:template match="*" mode="styler_numbering">
      <xsl:param name="do-qmark" select="'yes'"/>
      <xsl:if test="$do-qmark='yes'">
         <xsl:value-of select="'?'"/>
      </xsl:if>
   </xsl:template>

   <!-- This is an "atitag" (aka formatting PI), pass it through -->
<xsl:template match="*[starts-with(local-name(.),'_')]" priority="-0.9">
      <xsl:element name="{name(.)}">
         <xsl:copy-of select="@*"/>
         <xsl:apply-templates/>
      </xsl:element>
   </xsl:template>

   <xsl:template xmlns:atievent="http://www.arbortext.com/namespace/AtiSaxEvents"
                 match="atievent:*">
      <xsl:element name="{name(.)}">
         <xsl:copy-of select="@*"/>
         <xsl:apply-templates/>
      </xsl:element>
   </xsl:template>

   <xsl:template match="*" priority="-1">
      <xsl:call-template name="emit-unstyled-template-content"/>
   </xsl:template>

   <!-- Include code to handle CALS tables -->
<xsl:param name="table.border.thickness" select="'1pt'"/>
   <xsl:param name="table.cell.padding.amount" select="'5pt'"/>
   <xsl:param name="thead.tfoot.style">font-weight: bold; </xsl:param>
   <xsl:template name="tgroup.first"/>
   <xsl:template name="tgroup.notfirst"/>
   <xsl:template name="row"/>
   <xsl:template name="entry"/>
   <xsl:template name="thead"/>
   <xsl:template name="tfoot"/>
   <xsl:template name="tbody"/>
   <xsl:include href="file:///C:/Program%20Files/PTC/Arbortext%20Editor_M010//lib/xsl/html/tbls.xsl"/>

   <!-- Include code to handle HTML tables (which includes ATI PI handling)-->
<xsl:template name="htmltbl-tr"/>
   <xsl:template name="htmltbl-td"/>
   <xsl:template name="htmltbl-th"/>
   <xsl:template name="htmltbl-caption"/>
   <xsl:include href="file:///C:/Program%20Files/PTC/Arbortext%20Editor_M010//lib/xsl/html/html-tbls.xsl"/>
</xsl:stylesheet>
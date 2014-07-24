<?xml version="1.0" encoding="UTF-8" standalone="yes"?>
<!--Copyright Arbortext, Inc., 1999-2008--><?APT StylesheetID Title="JMTOS Migrate Stylesheet (XSL-Web)" CompositionTypes="htmlhelp,web,xsl"?><xsl:stylesheet xmlns:simg="java:net.sf.docbook.saxon.ImageIntrinsics"
                xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
                xmlns:ximg="xaln://com.nwalsh.xalan.ImageIntrinsics"
                xmlns:exslt="http://exslt.org/common"
                xmlns:_acl="java:com.arbortext.epic.Acl"
                xmlns:msxsl="urn:schemas-microsoft-com:xslt"
                xmlns="http://www.w3.org/1999/xhtml"
                xmlns:_dtd="http://www.arbortext.com/namespace/Styler/UserElements"
                xmlns:saxon="http://saxon.sf.net/"
                xmlns:_5="http://www.pwc.ca/namespace/doctypes/ipc"
                xmlns:_gte="http://www.arbortext.com/namespace/Styler/GeneratedTextElements"
                xmlns:_js="java:com.arbortext.epic.internal.js.JavaScript"
                xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
                xmlns:_sfe="http://www.arbortext.com/namespace/Styler/StylerFormattingElements"
                xmlns:ch="http://www.arbortext.com/namespace/chunker"
                xmlns:_1="http://www.pwc.ca/namespace/doctypes/migrate"
                xmlns:_="http://www.pwc.ca/namespace/doctypes/jmtosmigrate"
                xmlns:_4="http://www.pwc.ca/namespace/doctypes/emipc"
                xmlns:_ufe="http://www.arbortext.com/namespace/Styler/UserFormattingElements"
                xmlns:atidlm="http://www.arbortext.com/namespace/atidlm"
                version="1.0"
                exclude-result-prefixes="xml saxon _5 _js xsi ch _1 _ _4 atidlm #default exslt msxsl _dtd _ufe _sfe _gte simg ximg _acl">

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
              select="'css/tmm_pw600_pw617fe_3072162_PROC'"/>

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
            <xsl:variable name="fileref-value" select="(//pwcsoa/@negnumber|//sheet/@gnbr)[1]"/>
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

   <!--Style template for Context: ais-item-->
<xsl:template name="__style-for_ais-item.1">
      <xsl:text> .x-ais-item-1-0 {margin-left: 0pt; margin-right: 0pt; }</xsl:text>
   </xsl:template>

   <!--Template for Context: ais-item-->
<xsl:template match="ais-item" priority="0"><!--Emit a nostyle template--><xsl:apply-templates/>
   </xsl:template>

   <!--Gentext template for Context: ais-item-->
<xsl:template match="ais-item" mode="expand-gentext" priority="0">
      <xsl:copy>
         <xsl:apply-templates select="@*|node()" mode="expand-gentext"/>
      </xsl:copy>
   </xsl:template>

   <!--Initial pass template for Context: ais-item-->
<xsl:template match="ais-item" mode="initial-pass-mode" priority="0">
      <xsl:copy>
         <xsl:call-template name="maybe-set-gte-id"/>
         <xsl:apply-templates select="@*|node()" mode="initial-pass-mode"/>
      </xsl:copy>
   </xsl:template>

   <!--Set count-as pass template for Context: ais-item-->
<xsl:template match="ais-item" mode="set-countas" priority="0">
      <xsl:copy>
         <xsl:apply-templates select="@*|node()" mode="set-countas"/>
      </xsl:copy>
   </xsl:template>

   <!--Set ch:chunk template for Context: ais-item-->
<xsl:template match="ais-item" mode="set-ch-chunk" priority="0">
      <xsl:copy>
         <xsl:if test="not(@_gte:did-set-chunk)">
            <xsl:attribute name="_gte:did-set-chunk">yes</xsl:attribute>
         </xsl:if>
         <xsl:apply-templates select="@*|node()" mode="set-ch-chunk"/>
      </xsl:copy>
   </xsl:template>

   <!--Style template for Context: ais-list-->
<xsl:template name="__style-for_ais-list.1">
      <xsl:text> .x-ais-list-1-0 {margin-left: 0pt; margin-right: 0pt; }</xsl:text>
   </xsl:template>

   <!--Template for Context: ais-list-->
<xsl:template match="ais-list" priority="0">
      <xsl:param name="hidden" select="'yes'"/>
      <xsl:if test="$hidden='no'">
         <span><!--Emit class values to reflect conditions--><xsl:attribute name="class">
               <xsl:text> x-ais-list-1-0</xsl:text>
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

   <!--Gentext template for Context: ais-list-->
<xsl:template match="ais-list" mode="expand-gentext" priority="0">
      <xsl:copy>
         <xsl:apply-templates select="@*|node()" mode="expand-gentext"/>
      </xsl:copy>
   </xsl:template>

   <!--Initial pass template for Context: ais-list-->
<xsl:template match="ais-list" mode="initial-pass-mode" priority="0">
      <xsl:copy>
         <xsl:call-template name="maybe-set-gte-id"/>
         <xsl:apply-templates select="@*|node()" mode="initial-pass-mode"/>
      </xsl:copy>
   </xsl:template>

   <!--Set count-as pass template for Context: ais-list-->
<xsl:template match="ais-list" mode="set-countas" priority="0">
      <xsl:copy>
         <xsl:apply-templates select="@*|node()" mode="set-countas"/>
      </xsl:copy>
   </xsl:template>

   <!--Set ch:chunk template for Context: ais-list-->
<xsl:template match="ais-list" mode="set-ch-chunk" priority="0">
      <xsl:copy>
         <xsl:if test="not(@_gte:did-set-chunk)">
            <xsl:attribute name="_gte:did-set-chunk">yes</xsl:attribute>
         </xsl:if>
         <xsl:apply-templates select="@*|node()" mode="set-ch-chunk"/>
      </xsl:copy>
   </xsl:template>

   <!--Collect footnote template for Context: ais-list-->
<xsl:template match="ais-list" mode="styler-collect-footnotes" priority="0">
      <xsl:apply-templates select="_sfe:BeforeOrAfterText/*" mode="styler-collect-footnotes"/>
   </xsl:template>

   <!--Style template for Context: aisnbr-->
<xsl:template name="__style-for_aisnbr.1">
      <xsl:text> .x-aisnbr-1-0 {margin-left: 0pt; margin-right: 0pt; }</xsl:text>
   </xsl:template>

   <!--Template for Context: aisnbr-->
<xsl:template match="aisnbr" priority="0"><!--Emit a nostyle template--><xsl:apply-templates/>
   </xsl:template>

   <!--Gentext template for Context: aisnbr-->
<xsl:template match="aisnbr" mode="expand-gentext" priority="0">
      <xsl:copy>
         <xsl:apply-templates select="@*|node()" mode="expand-gentext"/>
      </xsl:copy>
   </xsl:template>

   <!--Initial pass template for Context: aisnbr-->
<xsl:template match="aisnbr" mode="initial-pass-mode" priority="0">
      <xsl:copy>
         <xsl:call-template name="maybe-set-gte-id"/>
         <xsl:apply-templates select="@*|node()" mode="initial-pass-mode"/>
      </xsl:copy>
   </xsl:template>

   <!--Set count-as pass template for Context: aisnbr-->
<xsl:template match="aisnbr" mode="set-countas" priority="0">
      <xsl:copy>
         <xsl:apply-templates select="@*|node()" mode="set-countas"/>
      </xsl:copy>
   </xsl:template>

   <!--Set ch:chunk template for Context: aisnbr-->
<xsl:template match="aisnbr" mode="set-ch-chunk" priority="0">
      <xsl:copy>
         <xsl:if test="not(@_gte:did-set-chunk)">
            <xsl:attribute name="_gte:did-set-chunk">yes</xsl:attribute>
         </xsl:if>
         <xsl:apply-templates select="@*|node()" mode="set-ch-chunk"/>
      </xsl:copy>
   </xsl:template>

   <!--Style template for Context: aistitle-->
<xsl:template name="__style-for_aistitle.1">
      <xsl:text> .x-aistitle-1-0 {margin-left: 0pt; margin-right: 0pt; }</xsl:text>
   </xsl:template>

   <!--Template for Context: aistitle-->
<xsl:template match="aistitle" priority="0"><!--Emit a nostyle template--><xsl:apply-templates/>
   </xsl:template>

   <!--Gentext template for Context: aistitle-->
<xsl:template match="aistitle" mode="expand-gentext" priority="0">
      <xsl:copy>
         <xsl:apply-templates select="@*|node()" mode="expand-gentext"/>
      </xsl:copy>
   </xsl:template>

   <!--Initial pass template for Context: aistitle-->
<xsl:template match="aistitle" mode="initial-pass-mode" priority="0">
      <xsl:copy>
         <xsl:call-template name="maybe-set-gte-id"/>
         <xsl:apply-templates select="@*|node()" mode="initial-pass-mode"/>
      </xsl:copy>
   </xsl:template>

   <!--Set count-as pass template for Context: aistitle-->
<xsl:template match="aistitle" mode="set-countas" priority="0">
      <xsl:copy>
         <xsl:apply-templates select="@*|node()" mode="set-countas"/>
      </xsl:copy>
   </xsl:template>

   <!--Set ch:chunk template for Context: aistitle-->
<xsl:template match="aistitle" mode="set-ch-chunk" priority="0">
      <xsl:copy>
         <xsl:if test="not(@_gte:did-set-chunk)">
            <xsl:attribute name="_gte:did-set-chunk">yes</xsl:attribute>
         </xsl:if>
         <xsl:apply-templates select="@*|node()" mode="set-ch-chunk"/>
      </xsl:copy>
   </xsl:template>

   <!--Style template for Context: con-->
<xsl:template name="__style-for_con.1">
      <xsl:text> .x-con-1-0 {margin-left: 0pt; margin-right: 0pt; } .x-con-1-1 {}</xsl:text>
   </xsl:template>

   <!--Template for Context: con-->
<xsl:template match="con" priority="0">
      <xsl:param name="hidden" select="'yes'"/>
      <xsl:variable name="foClass">hidden-inline</xsl:variable>
      <xsl:variable name="blockness">inline</xsl:variable>
      <xsl:variable name="hiddenness">yes</xsl:variable>
      <span><!--Emit class values to reflect conditions--><xsl:attribute name="class">
            <xsl:text> x-con-1-0</xsl:text>
            <xsl:if test="((./refint|./*[not(self::_sfe:BeforeOrAfterText)]//refint)) and (not(./connbr|./*[not(self::_sfe:BeforeOrAfterText)]//connbr))"> x-con-1-1</xsl:if>
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
      </span>
   </xsl:template>

   <!--Gentext template for Context: con-->
<xsl:template match="con" mode="expand-gentext" priority="0">
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
            <xsl:when test="((./refint|./*[not(self::_sfe:BeforeOrAfterText)]//refint)) and (not(./connbr|./*[not(self::_sfe:BeforeOrAfterText)]//connbr))"><!--AddBefore Condition #1--><xsl:if test="not(@_gte:Gentext-Expanded)">
                  <_gte:Must-Expand-Gentext/>
                  <_sfe:BeforeOrAfterText>
                     <xsl:if test="(ancestor-or-self::con[1]//conname)[1]/*|(ancestor-or-self::con[1]//conname)[1]/text()|(ancestor-or-self::con[1]//conname)[1]/processing-instruction()">
                        <_gte:Gentexted-Content-Wrapper>
                           <xsl:apply-templates mode="expand-gentext"
                                                select="(ancestor-or-self::con[1]//conname)[1]/*|(ancestor-or-self::con[1]//conname)[1]/text()|(ancestor-or-self::con[1]//conname)[1]/processing-instruction()">
                              <xsl:with-param name="skip-expanded-gentext" select="'yes'"/>
                           </xsl:apply-templates>
                        </_gte:Gentexted-Content-Wrapper>
                     </xsl:if>
                     <xsl:text> (</xsl:text>
                     <xsl:if test="(ancestor-or-self::con[1]//refint)[1]/*|(ancestor-or-self::con[1]//refint)[1]/text()|(ancestor-or-self::con[1]//refint)[1]/processing-instruction()">
                        <_gte:Gentexted-Content-Wrapper>
                           <xsl:apply-templates mode="expand-gentext"
                                                select="(ancestor-or-self::con[1]//refint)[1]/*|(ancestor-or-self::con[1]//refint)[1]/text()|(ancestor-or-self::con[1]//refint)[1]/processing-instruction()">
                              <xsl:with-param name="skip-expanded-gentext" select="'yes'"/>
                           </xsl:apply-templates>
                        </_gte:Gentexted-Content-Wrapper>
                     </xsl:if>
                     <xsl:text>)</xsl:text>
                  </_sfe:BeforeOrAfterText>
               </xsl:if>
            </xsl:when>
            <xsl:otherwise>
               <xsl:if test="not(@_gte:Gentext-Expanded)">
                  <_gte:Must-Expand-Gentext/>
                  <_sfe:BeforeOrAfterText>
                     <xsl:if test="(ancestor-or-self::con[1]//conname)[1]/*|(ancestor-or-self::con[1]//conname)[1]/text()|(ancestor-or-self::con[1]//conname)[1]/processing-instruction()">
                        <_gte:Gentexted-Content-Wrapper>
                           <xsl:apply-templates mode="expand-gentext"
                                                select="(ancestor-or-self::con[1]//conname)[1]/*|(ancestor-or-self::con[1]//conname)[1]/text()|(ancestor-or-self::con[1]//conname)[1]/processing-instruction()">
                              <xsl:with-param name="skip-expanded-gentext" select="'yes'"/>
                           </xsl:apply-templates>
                        </_gte:Gentexted-Content-Wrapper>
                     </xsl:if>
                     <xsl:text> (</xsl:text>
                     <xsl:if test="(ancestor-or-self::con[1]//connbr)[1]/*|(ancestor-or-self::con[1]//connbr)[1]/text()|(ancestor-or-self::con[1]//connbr)[1]/processing-instruction()">
                        <_gte:Gentexted-Content-Wrapper>
                           <xsl:apply-templates mode="expand-gentext"
                                                select="(ancestor-or-self::con[1]//connbr)[1]/*|(ancestor-or-self::con[1]//connbr)[1]/text()|(ancestor-or-self::con[1]//connbr)[1]/processing-instruction()">
                              <xsl:with-param name="skip-expanded-gentext" select="'yes'"/>
                           </xsl:apply-templates>
                        </_gte:Gentexted-Content-Wrapper>
                     </xsl:if>
                     <xsl:text>)</xsl:text>
                  </_sfe:BeforeOrAfterText>
               </xsl:if>
            </xsl:otherwise>
         </xsl:choose>
         <xsl:apply-templates select="* | text() | processing-instruction()" mode="expand-gentext"/>
      </xsl:copy>
   </xsl:template>

   <!--Initial pass template for Context: con-->
<xsl:template match="con" mode="initial-pass-mode" priority="0">
      <xsl:copy>
         <xsl:call-template name="maybe-set-gte-id"/>
         <xsl:apply-templates select="@*|node()" mode="initial-pass-mode"/>
      </xsl:copy>
   </xsl:template>

   <!--Set count-as pass template for Context: con-->
<xsl:template match="con" mode="set-countas" priority="0">
      <xsl:copy>
         <xsl:apply-templates select="@*|node()" mode="set-countas"/>
      </xsl:copy>
   </xsl:template>

   <!--Set ch:chunk template for Context: con-->
<xsl:template match="con" mode="set-ch-chunk" priority="0">
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

   <!--Collect footnote template for Context: con-->
<xsl:template match="con" mode="styler-collect-footnotes" priority="0">
      <xsl:apply-templates select="_sfe:BeforeOrAfterText/*" mode="styler-collect-footnotes"/>
   </xsl:template>

   <!--Style template for Context: conindex-->
<xsl:template name="__style-for_conindex.1">
      <xsl:text> .x-conindex-1-0 {margin-left: 0pt; margin-right: 0pt; }</xsl:text>
   </xsl:template>

   <!--Template for Context: conindex-->
<xsl:template match="conindex" priority="0"><!--Emit a nostyle template--><xsl:apply-templates/>
   </xsl:template>

   <!--Gentext template for Context: conindex-->
<xsl:template match="conindex" mode="expand-gentext" priority="0">
      <xsl:copy>
         <xsl:apply-templates select="@*|node()" mode="expand-gentext"/>
      </xsl:copy>
   </xsl:template>

   <!--Initial pass template for Context: conindex-->
<xsl:template match="conindex" mode="initial-pass-mode" priority="0">
      <xsl:copy>
         <xsl:call-template name="maybe-set-gte-id"/>
         <xsl:apply-templates select="@*|node()" mode="initial-pass-mode"/>
      </xsl:copy>
   </xsl:template>

   <!--Set count-as pass template for Context: conindex-->
<xsl:template match="conindex" mode="set-countas" priority="0">
      <xsl:copy>
         <xsl:apply-templates select="@*|node()" mode="set-countas"/>
      </xsl:copy>
   </xsl:template>

   <!--Set ch:chunk template for Context: conindex-->
<xsl:template match="conindex" mode="set-ch-chunk" priority="0">
      <xsl:copy>
         <xsl:if test="not(@_gte:did-set-chunk)">
            <xsl:attribute name="_gte:did-set-chunk">yes</xsl:attribute>
         </xsl:if>
         <xsl:apply-templates select="@*|node()" mode="set-ch-chunk"/>
      </xsl:copy>
   </xsl:template>

   <!--Style template for Context: conname-->
<xsl:template name="__style-for_conname.1">
      <xsl:text> .x-conname-1-0 {margin-left: 0pt; margin-right: 0pt; }</xsl:text>
   </xsl:template>

   <!--Template for Context: conname-->
<xsl:template match="conname" priority="0">
      <span><!--Emit class values to reflect conditions--><xsl:attribute name="class">
            <xsl:text> x-conname-1-0</xsl:text>
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

   <!--Gentext template for Context: conname-->
<xsl:template match="conname" mode="expand-gentext" priority="0">
      <xsl:copy>
         <xsl:apply-templates select="@*|node()" mode="expand-gentext"/>
      </xsl:copy>
   </xsl:template>

   <!--Initial pass template for Context: conname-->
<xsl:template match="conname" mode="initial-pass-mode" priority="0">
      <xsl:copy>
         <xsl:call-template name="maybe-set-gte-id"/>
         <xsl:apply-templates select="@*|node()" mode="initial-pass-mode"/>
      </xsl:copy>
   </xsl:template>

   <!--Set count-as pass template for Context: conname-->
<xsl:template match="conname" mode="set-countas" priority="0">
      <xsl:copy>
         <xsl:apply-templates select="@*|node()" mode="set-countas"/>
      </xsl:copy>
   </xsl:template>

   <!--Set ch:chunk template for Context: conname-->
<xsl:template match="conname" mode="set-ch-chunk" priority="0">
      <xsl:copy>
         <xsl:if test="not(@_gte:did-set-chunk)">
            <xsl:attribute name="_gte:did-set-chunk">yes</xsl:attribute>
         </xsl:if>
         <xsl:apply-templates select="@*|node()" mode="set-ch-chunk"/>
      </xsl:copy>
   </xsl:template>

   <!--Style template for Context: connbr-->
<xsl:template name="__style-for_connbr.1">
      <xsl:text> .x-connbr-1-0 {margin-left: 0pt; margin-right: 0pt; }</xsl:text>
   </xsl:template>

   <!--Template for Context: connbr-->
<xsl:template match="connbr" priority="0">
      <span><!--Emit class values to reflect conditions--><xsl:attribute name="class">
            <xsl:text> x-connbr-1-0</xsl:text>
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

   <!--Gentext template for Context: connbr-->
<xsl:template match="connbr" mode="expand-gentext" priority="0">
      <xsl:copy>
         <xsl:apply-templates select="@*|node()" mode="expand-gentext"/>
      </xsl:copy>
   </xsl:template>

   <!--Initial pass template for Context: connbr-->
<xsl:template match="connbr" mode="initial-pass-mode" priority="0">
      <xsl:copy>
         <xsl:call-template name="maybe-set-gte-id"/>
         <xsl:apply-templates select="@*|node()" mode="initial-pass-mode"/>
      </xsl:copy>
   </xsl:template>

   <!--Set count-as pass template for Context: connbr-->
<xsl:template match="connbr" mode="set-countas" priority="0">
      <xsl:copy>
         <xsl:apply-templates select="@*|node()" mode="set-countas"/>
      </xsl:copy>
   </xsl:template>

   <!--Set ch:chunk template for Context: connbr-->
<xsl:template match="connbr" mode="set-ch-chunk" priority="0">
      <xsl:copy>
         <xsl:if test="not(@_gte:did-set-chunk)">
            <xsl:attribute name="_gte:did-set-chunk">yes</xsl:attribute>
         </xsl:if>
         <xsl:apply-templates select="@*|node()" mode="set-ch-chunk"/>
      </xsl:copy>
   </xsl:template>

   <!--Style template for Context: csn-->
<xsl:template name="__style-for_csn.1">
      <xsl:text> .x-csn-1-0 {margin-left: 0pt; margin-right: 0pt; }</xsl:text>
   </xsl:template>

   <!--Template for Context: csn-->
<xsl:template match="csn" priority="0">
      <span><!--Emit class values to reflect conditions--><xsl:attribute name="class">
            <xsl:text> x-csn-1-0</xsl:text>
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

   <!--Gentext template for Context: csn-->
<xsl:template match="csn" mode="expand-gentext" priority="0">
      <xsl:copy>
         <xsl:apply-templates select="@*|node()" mode="expand-gentext"/>
      </xsl:copy>
   </xsl:template>

   <!--Initial pass template for Context: csn-->
<xsl:template match="csn" mode="initial-pass-mode" priority="0">
      <xsl:copy>
         <xsl:call-template name="maybe-set-gte-id"/>
         <xsl:apply-templates select="@*|node()" mode="initial-pass-mode"/>
      </xsl:copy>
   </xsl:template>

   <!--Set count-as pass template for Context: csn-->
<xsl:template match="csn" mode="set-countas" priority="0">
      <xsl:copy>
         <xsl:apply-templates select="@*|node()" mode="set-countas"/>
      </xsl:copy>
   </xsl:template>

   <!--Set ch:chunk template for Context: csn-->
<xsl:template match="csn" mode="set-ch-chunk" priority="0">
      <xsl:copy>
         <xsl:if test="not(@_gte:did-set-chunk)">
            <xsl:attribute name="_gte:did-set-chunk">yes</xsl:attribute>
         </xsl:if>
         <xsl:apply-templates select="@*|node()" mode="set-ch-chunk"/>
      </xsl:copy>
   </xsl:template>

   <!--Style template for Context: dtlname-->
<xsl:template name="__style-for_dtlname.1">
      <xsl:text> .x-dtlname-1-0 {margin-left: 0pt; margin-right: 0pt; }</xsl:text>
   </xsl:template>

   <!--Template for Context: dtlname-->
<xsl:template match="dtlname" priority="0">
      <span><!--Emit class values to reflect conditions--><xsl:attribute name="class">
            <xsl:text> x-dtlname-1-0</xsl:text>
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

   <!--Gentext template for Context: dtlname-->
<xsl:template match="dtlname" mode="expand-gentext" priority="0">
      <xsl:copy>
         <xsl:apply-templates select="@*|node()" mode="expand-gentext"/>
      </xsl:copy>
   </xsl:template>

   <!--Initial pass template for Context: dtlname-->
<xsl:template match="dtlname" mode="initial-pass-mode" priority="0">
      <xsl:copy>
         <xsl:call-template name="maybe-set-gte-id"/>
         <xsl:apply-templates select="@*|node()" mode="initial-pass-mode"/>
      </xsl:copy>
   </xsl:template>

   <!--Set count-as pass template for Context: dtlname-->
<xsl:template match="dtlname" mode="set-countas" priority="0">
      <xsl:copy>
         <xsl:apply-templates select="@*|node()" mode="set-countas"/>
      </xsl:copy>
   </xsl:template>

   <!--Set ch:chunk template for Context: dtlname-->
<xsl:template match="dtlname" mode="set-ch-chunk" priority="0">
      <xsl:copy>
         <xsl:if test="not(@_gte:did-set-chunk)">
            <xsl:attribute name="_gte:did-set-chunk">yes</xsl:attribute>
         </xsl:if>
         <xsl:apply-templates select="@*|node()" mode="set-ch-chunk"/>
      </xsl:copy>
   </xsl:template>

   <!--Style template for Context: dtlnbr-->
<xsl:template name="__style-for_dtlnbr.1">
      <xsl:text> .x-dtlnbr-1-0 {margin-left: 0pt; margin-right: 0pt; }</xsl:text>
   </xsl:template>

   <!--Template for Context: dtlnbr-->
<xsl:template match="dtlnbr" priority="0">
      <span><!--Emit class values to reflect conditions--><xsl:attribute name="class">
            <xsl:text> x-dtlnbr-1-0</xsl:text>
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

   <!--Gentext template for Context: dtlnbr-->
<xsl:template match="dtlnbr" mode="expand-gentext" priority="0">
      <xsl:copy>
         <xsl:apply-templates select="@*|node()" mode="expand-gentext"/>
      </xsl:copy>
   </xsl:template>

   <!--Initial pass template for Context: dtlnbr-->
<xsl:template match="dtlnbr" mode="initial-pass-mode" priority="0">
      <xsl:copy>
         <xsl:call-template name="maybe-set-gte-id"/>
         <xsl:apply-templates select="@*|node()" mode="initial-pass-mode"/>
      </xsl:copy>
   </xsl:template>

   <!--Set count-as pass template for Context: dtlnbr-->
<xsl:template match="dtlnbr" mode="set-countas" priority="0">
      <xsl:copy>
         <xsl:apply-templates select="@*|node()" mode="set-countas"/>
      </xsl:copy>
   </xsl:template>

   <!--Set ch:chunk template for Context: dtlnbr-->
<xsl:template match="dtlnbr" mode="set-ch-chunk" priority="0">
      <xsl:copy>
         <xsl:if test="not(@_gte:did-set-chunk)">
            <xsl:attribute name="_gte:did-set-chunk">yes</xsl:attribute>
         </xsl:if>
         <xsl:apply-templates select="@*|node()" mode="set-ch-chunk"/>
      </xsl:copy>
   </xsl:template>

   <!--Style template for Context: pgblk/effect-->
<xsl:template name="__style-for_effect.2pgkect121">
      <xsl:text> .x-effect-1-0 {margin-left: 0pt; margin-right: 0pt; text-indent: 0pt; font-weight: bold; margin-top: 4pt; margin-bottom: 4pt; }</xsl:text>
   </xsl:template>

   <!--Template for Context: pgblk/effect-->
<xsl:template match="pgblk/effect" priority="1">
      <div><!--Emit class values to reflect conditions--><xsl:attribute name="class">
            <xsl:text> x-effect-1-0</xsl:text>
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

   <!--Gentext template for Context: pgblk/effect-->
<xsl:template match="pgblk/effect" mode="expand-gentext" priority="1">
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
               <xsl:text>EFF: </xsl:text>
               <xsl:value-of select="@effrg"/>
            </_sfe:BeforeOrAfterText>
         </xsl:if>
         <xsl:apply-templates select="* | text() | processing-instruction()" mode="expand-gentext"/>
      </xsl:copy>
   </xsl:template>

   <!--Initial pass template for Context: pgblk/effect-->
<xsl:template match="pgblk/effect" mode="initial-pass-mode" priority="1">
      <xsl:copy>
         <xsl:call-template name="maybe-set-gte-id"/>
         <xsl:apply-templates select="@*|node()" mode="initial-pass-mode"/>
      </xsl:copy>
   </xsl:template>

   <!--Set count-as pass template for Context: pgblk/effect-->
<xsl:template match="pgblk/effect" mode="set-countas" priority="1">
      <xsl:copy>
         <xsl:apply-templates select="@*|node()" mode="set-countas"/>
      </xsl:copy>
   </xsl:template>

   <!--Set ch:chunk template for Context: pgblk/effect-->
<xsl:template match="pgblk/effect" mode="set-ch-chunk" priority="1">
      <xsl:copy>
         <xsl:if test="not(@_gte:did-set-chunk)">
            <xsl:attribute name="_gte:did-set-chunk">yes</xsl:attribute>
         </xsl:if>
         <xsl:apply-templates select="@*|node()" mode="set-ch-chunk"/>
      </xsl:copy>
   </xsl:template>

   <!--Style template for Context: effect-->
<xsl:template name="__style-for_effect.2efctct62">
      <xsl:text> .x-effect-2-0 {margin-left: 0pt; margin-right: 0pt; font-weight: bold; }</xsl:text>
   </xsl:template>

   <!--Template for Context: effect-->
<xsl:template match="effect" priority="0">
      <span><!--Emit class values to reflect conditions--><xsl:attribute name="class">
            <xsl:text> x-effect-2-0</xsl:text>
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

   <!--Gentext template for Context: effect-->
<xsl:template match="effect" mode="expand-gentext" priority="0">
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
               <xsl:value-of select="@effrg"/>
            </_sfe:BeforeOrAfterText>
         </xsl:if>
         <xsl:apply-templates select="* | text() | processing-instruction()" mode="expand-gentext"/>
      </xsl:copy>
   </xsl:template>

   <!--Initial pass template for Context: effect-->
<xsl:template match="effect" mode="initial-pass-mode" priority="0">
      <xsl:copy>
         <xsl:call-template name="maybe-set-gte-id"/>
         <xsl:apply-templates select="@*|node()" mode="initial-pass-mode"/>
      </xsl:copy>
   </xsl:template>

   <!--Set count-as pass template for Context: effect-->
<xsl:template match="effect" mode="set-countas" priority="0">
      <xsl:copy>
         <xsl:apply-templates select="@*|node()" mode="set-countas"/>
      </xsl:copy>
   </xsl:template>

   <!--Set ch:chunk template for Context: effect-->
<xsl:template match="effect" mode="set-ch-chunk" priority="0">
      <xsl:copy>
         <xsl:if test="not(@_gte:did-set-chunk)">
            <xsl:attribute name="_gte:did-set-chunk">yes</xsl:attribute>
         </xsl:if>
         <xsl:apply-templates select="@*|node()" mode="set-ch-chunk"/>
      </xsl:copy>
   </xsl:template>

   <!--Style template for Context: equ[child::table]-->
<xsl:template name="__style-for_equ.2eqqu171">
      <xsl:text> .x-equ-1-0 {margin-left: 0pt; margin-right: 0pt; text-indent: 0pt; margin-bottom: 8pt; }</xsl:text>
   </xsl:template>

   <!--Template for Context: equ[child::table]-->
<xsl:template match="equ[child::table]" priority="1">
      <div><!--Emit class values to reflect conditions--><xsl:attribute name="class">
            <xsl:text> x-equ-1-0</xsl:text>
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

   <!--Gentext template for Context: equ[child::table]-->
<xsl:template match="equ[child::table]" mode="expand-gentext" priority="1">
      <xsl:copy>
         <xsl:apply-templates select="@*|node()" mode="expand-gentext"/>
      </xsl:copy>
   </xsl:template>

   <!--Initial pass template for Context: equ[child::table]-->
<xsl:template match="equ[child::table]" mode="initial-pass-mode" priority="1">
      <xsl:copy>
         <xsl:call-template name="maybe-set-gte-id"/>
         <xsl:apply-templates select="@*|node()" mode="initial-pass-mode"/>
      </xsl:copy>
   </xsl:template>

   <!--Set count-as pass template for Context: equ[child::table]-->
<xsl:template match="equ[child::table]" mode="set-countas" priority="1">
      <xsl:copy>
         <xsl:apply-templates select="@*|node()" mode="set-countas"/>
      </xsl:copy>
   </xsl:template>

   <!--Set ch:chunk template for Context: equ[child::table]-->
<xsl:template match="equ[child::table]" mode="set-ch-chunk" priority="1">
      <xsl:copy>
         <xsl:if test="not(@_gte:did-set-chunk)">
            <xsl:attribute name="_gte:did-set-chunk">yes</xsl:attribute>
         </xsl:if>
         <xsl:apply-templates select="@*|node()" mode="set-ch-chunk"/>
      </xsl:copy>
   </xsl:template>

   <!--Style template for Context: equ-->
<xsl:template name="__style-for_equ.2eqqu32">
      <xsl:text> .x-equ-2-0 {margin-left: 0pt; margin-right: 0pt; text-indent: 0pt; }</xsl:text>
   </xsl:template>

   <!--Template for Context: equ-->
<xsl:template match="equ" priority="0">
      <div><!--Emit class values to reflect conditions--><xsl:attribute name="class">
            <xsl:text> x-equ-2-0</xsl:text>
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

   <!--Gentext template for Context: equ-->
<xsl:template match="equ" mode="expand-gentext" priority="0">
      <xsl:copy>
         <xsl:apply-templates select="@*|node()" mode="expand-gentext"/>
      </xsl:copy>
   </xsl:template>

   <!--Initial pass template for Context: equ-->
<xsl:template match="equ" mode="initial-pass-mode" priority="0">
      <xsl:copy>
         <xsl:call-template name="maybe-set-gte-id"/>
         <xsl:apply-templates select="@*|node()" mode="initial-pass-mode"/>
      </xsl:copy>
   </xsl:template>

   <!--Set count-as pass template for Context: equ-->
<xsl:template match="equ" mode="set-countas" priority="0">
      <xsl:copy>
         <xsl:apply-templates select="@*|node()" mode="set-countas"/>
      </xsl:copy>
   </xsl:template>

   <!--Set ch:chunk template for Context: equ-->
<xsl:template match="equ" mode="set-ch-chunk" priority="0">
      <xsl:copy>
         <xsl:if test="not(@_gte:did-set-chunk)">
            <xsl:attribute name="_gte:did-set-chunk">yes</xsl:attribute>
         </xsl:if>
         <xsl:apply-templates select="@*|node()" mode="set-ch-chunk"/>
      </xsl:copy>
   </xsl:template>

   <!--Style template for Context: ftnote-->
<xsl:template name="__style-for_ftnote.1">
      <xsl:text> .x-ftnote-1-0 {margin-left: 0pt; margin-right: 0pt; }</xsl:text>
   </xsl:template>

   <!--Template for Context: ftnote-->
<xsl:template match="ftnote" priority="0"><!--Emit a nostyle template--><xsl:apply-templates/>
   </xsl:template>

   <!--Gentext template for Context: ftnote-->
<xsl:template match="ftnote" mode="expand-gentext" priority="0">
      <xsl:copy>
         <xsl:apply-templates select="@*|node()" mode="expand-gentext"/>
      </xsl:copy>
   </xsl:template>

   <!--Initial pass template for Context: ftnote-->
<xsl:template match="ftnote" mode="initial-pass-mode" priority="0">
      <xsl:copy>
         <xsl:call-template name="maybe-set-gte-id"/>
         <xsl:apply-templates select="@*|node()" mode="initial-pass-mode"/>
      </xsl:copy>
   </xsl:template>

   <!--Set count-as pass template for Context: ftnote-->
<xsl:template match="ftnote" mode="set-countas" priority="0">
      <xsl:copy>
         <xsl:apply-templates select="@*|node()" mode="set-countas"/>
      </xsl:copy>
   </xsl:template>

   <!--Set ch:chunk template for Context: ftnote-->
<xsl:template match="ftnote" mode="set-ch-chunk" priority="0">
      <xsl:copy>
         <xsl:if test="not(@_gte:did-set-chunk)">
            <xsl:attribute name="_gte:did-set-chunk">yes</xsl:attribute>
         </xsl:if>
         <xsl:apply-templates select="@*|node()" mode="set-ch-chunk"/>
      </xsl:copy>
   </xsl:template>

   <!--Style template for Context: gdesc-->
<xsl:template name="__style-for_gdesc.1">
      <xsl:text> .x-gdesc-1-0 {margin-left: 0pt; margin-right: 0pt; text-indent: 0pt; }</xsl:text>
   </xsl:template>

   <!--Template for Context: gdesc-->
<xsl:template match="gdesc" priority="0">
      <div><!--Emit class values to reflect conditions--><xsl:attribute name="class">
            <xsl:text> x-gdesc-1-0</xsl:text>
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

   <!--Gentext template for Context: gdesc-->
<xsl:template match="gdesc" mode="expand-gentext" priority="0">
      <xsl:copy>
         <xsl:apply-templates select="@*|node()" mode="expand-gentext"/>
      </xsl:copy>
   </xsl:template>

   <!--Initial pass template for Context: gdesc-->
<xsl:template match="gdesc" mode="initial-pass-mode" priority="0">
      <xsl:copy>
         <xsl:call-template name="maybe-set-gte-id"/>
         <xsl:apply-templates select="@*|node()" mode="initial-pass-mode"/>
      </xsl:copy>
   </xsl:template>

   <!--Set count-as pass template for Context: gdesc-->
<xsl:template match="gdesc" mode="set-countas" priority="0">
      <xsl:copy>
         <xsl:apply-templates select="@*|node()" mode="set-countas"/>
      </xsl:copy>
   </xsl:template>

   <!--Set ch:chunk template for Context: gdesc-->
<xsl:template match="gdesc" mode="set-ch-chunk" priority="0">
      <xsl:copy>
         <xsl:if test="not(@_gte:did-set-chunk)">
            <xsl:attribute name="_gte:did-set-chunk">yes</xsl:attribute>
         </xsl:if>
         <xsl:apply-templates select="@*|node()" mode="set-ch-chunk"/>
      </xsl:copy>
   </xsl:template>

   <!--Style template for Context: graphic[descendant::sheet]-->
<xsl:template name="__style-for_graphic.2grhiic261">
      <xsl:text> .x-graphic-1-0 {margin-left: 0pt; margin-right: 0pt; text-indent: 0pt; margin-top: 8pt; }</xsl:text>
   </xsl:template>

   <!--Template for Context: graphic[descendant::sheet]-->
<xsl:template match="graphic[descendant::sheet]" priority="1">
      <div><!--Emit class values to reflect conditions--><xsl:attribute name="class">
            <xsl:text> x-graphic-1-0</xsl:text>
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

   <!--Gentext template for Context: graphic[descendant::sheet]-->
<xsl:template match="graphic[descendant::sheet]" mode="expand-gentext" priority="1">
      <xsl:copy>
         <xsl:apply-templates select="@*|node()" mode="expand-gentext"/>
      </xsl:copy>
   </xsl:template>

   <!--Initial pass template for Context: graphic[descendant::sheet]-->
<xsl:template match="graphic[descendant::sheet]" mode="initial-pass-mode" priority="1">
      <xsl:copy>
         <xsl:call-template name="maybe-set-gte-id"/>
         <xsl:apply-templates select="@*|node()" mode="initial-pass-mode"/>
      </xsl:copy>
   </xsl:template>

   <!--Set count-as pass template for Context: graphic[descendant::sheet]-->
<xsl:template match="graphic[descendant::sheet]" mode="set-countas" priority="1">
      <xsl:copy>
         <xsl:apply-templates select="@*|node()" mode="set-countas"/>
      </xsl:copy>
   </xsl:template>

   <!--Set ch:chunk template for Context: graphic[descendant::sheet]-->
<xsl:template match="graphic[descendant::sheet]" mode="set-ch-chunk" priority="1">
      <xsl:copy>
         <xsl:if test="not(@_gte:did-set-chunk)">
            <xsl:attribute name="_gte:did-set-chunk">yes</xsl:attribute>
         </xsl:if>
         <xsl:apply-templates select="@*|node()" mode="set-ch-chunk"/>
      </xsl:copy>
   </xsl:template>

   <!--Style template for Context: graphic-->
<xsl:template name="__style-for_graphic.2grhiic72">
      <xsl:text> .x-graphic-2-0 {margin-left: 0pt; margin-right: 0pt; text-indent: 0pt; margin-top: 8pt; }</xsl:text>
   </xsl:template>

   <!--Template for Context: graphic-->
<xsl:template match="graphic" priority="0">
      <div><!--Emit class values to reflect conditions--><xsl:attribute name="class">
            <xsl:text> x-graphic-2-0</xsl:text>
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

   <!--Gentext template for Context: graphic-->
<xsl:template match="graphic" mode="expand-gentext" priority="0">
      <xsl:copy>
         <xsl:apply-templates select="@*|node()" mode="expand-gentext"/>
      </xsl:copy>
   </xsl:template>

   <!--Initial pass template for Context: graphic-->
<xsl:template match="graphic" mode="initial-pass-mode" priority="0">
      <xsl:copy>
         <xsl:call-template name="maybe-set-gte-id"/>
         <xsl:apply-templates select="@*|node()" mode="initial-pass-mode"/>
      </xsl:copy>
   </xsl:template>

   <!--Set count-as pass template for Context: graphic-->
<xsl:template match="graphic" mode="set-countas" priority="0">
      <xsl:copy>
         <xsl:apply-templates select="@*|node()" mode="set-countas"/>
      </xsl:copy>
   </xsl:template>

   <!--Set ch:chunk template for Context: graphic-->
<xsl:template match="graphic" mode="set-ch-chunk" priority="0">
      <xsl:copy>
         <xsl:if test="not(@_gte:did-set-chunk)">
            <xsl:attribute name="_gte:did-set-chunk">yes</xsl:attribute>
         </xsl:if>
         <xsl:apply-templates select="@*|node()" mode="set-ch-chunk"/>
      </xsl:copy>
   </xsl:template>

   <!--Style template for Context: grphcref-->
<xsl:template name="__style-for_grphcref.1">
      <xsl:text> .x-grphcref-1-0 {margin-left: 0pt; margin-right: 0pt; }</xsl:text>
   </xsl:template>

   <!--Template for Context: grphcref-->
<xsl:template match="grphcref" priority="0">
      <span><!--Emit class values to reflect conditions--><xsl:attribute name="class">
            <xsl:text> x-grphcref-1-0</xsl:text>
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

   <!--Gentext template for Context: grphcref-->
<xsl:template match="grphcref" mode="expand-gentext" priority="0">
      <xsl:copy>
         <xsl:apply-templates select="@*|node()" mode="expand-gentext"/>
      </xsl:copy>
   </xsl:template>

   <!--Initial pass template for Context: grphcref-->
<xsl:template match="grphcref" mode="initial-pass-mode" priority="0">
      <xsl:copy>
         <xsl:call-template name="maybe-set-gte-id"/>
         <xsl:apply-templates select="@*|node()" mode="initial-pass-mode"/>
      </xsl:copy>
   </xsl:template>

   <!--Set count-as pass template for Context: grphcref-->
<xsl:template match="grphcref" mode="set-countas" priority="0">
      <xsl:copy>
         <xsl:apply-templates select="@*|node()" mode="set-countas"/>
      </xsl:copy>
   </xsl:template>

   <!--Set ch:chunk template for Context: grphcref-->
<xsl:template match="grphcref" mode="set-ch-chunk" priority="0">
      <xsl:copy>
         <xsl:if test="not(@_gte:did-set-chunk)">
            <xsl:attribute name="_gte:did-set-chunk">yes</xsl:attribute>
         </xsl:if>
         <xsl:apply-templates select="@*|node()" mode="set-ch-chunk"/>
      </xsl:copy>
   </xsl:template>

   <!--Style template for Context: hotlink-->
<xsl:template name="__style-for_hotlink.1">
      <xsl:text> .x-hotlink-1-0 {margin-left: 0pt; margin-right: 0pt; }</xsl:text>
   </xsl:template>

   <!--Template for Context: hotlink-->
<xsl:template match="hotlink" priority="0"><!--Emit a nostyle template--><xsl:apply-templates/>
   </xsl:template>

   <!--Gentext template for Context: hotlink-->
<xsl:template match="hotlink" mode="expand-gentext" priority="0">
      <xsl:copy>
         <xsl:apply-templates select="@*|node()" mode="expand-gentext"/>
      </xsl:copy>
   </xsl:template>

   <!--Initial pass template for Context: hotlink-->
<xsl:template match="hotlink" mode="initial-pass-mode" priority="0">
      <xsl:copy>
         <xsl:call-template name="maybe-set-gte-id"/>
         <xsl:apply-templates select="@*|node()" mode="initial-pass-mode"/>
      </xsl:copy>
   </xsl:template>

   <!--Set count-as pass template for Context: hotlink-->
<xsl:template match="hotlink" mode="set-countas" priority="0">
      <xsl:copy>
         <xsl:apply-templates select="@*|node()" mode="set-countas"/>
      </xsl:copy>
   </xsl:template>

   <!--Set ch:chunk template for Context: hotlink-->
<xsl:template match="hotlink" mode="set-ch-chunk" priority="0">
      <xsl:copy>
         <xsl:if test="not(@_gte:did-set-chunk)">
            <xsl:attribute name="_gte:did-set-chunk">yes</xsl:attribute>
         </xsl:if>
         <xsl:apply-templates select="@*|node()" mode="set-ch-chunk"/>
      </xsl:copy>
   </xsl:template>

   <!--Style template for Context: howtouse-->
<xsl:template name="__style-for_howtouse.1">
      <xsl:text> .x-howtouse-1-0 {margin-left: 0pt; margin-right: 0pt; text-indent: 0pt; margin-top: 8pt; }</xsl:text>
   </xsl:template>

   <!--Template for Context: howtouse-->
<xsl:template match="howtouse" priority="0">
      <div><!--Emit class values to reflect conditions--><xsl:attribute name="class">
            <xsl:text> x-howtouse-1-0</xsl:text>
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

   <!--Gentext template for Context: howtouse-->
<xsl:template match="howtouse" mode="expand-gentext" priority="0">
      <xsl:copy>
         <xsl:apply-templates select="@*|node()" mode="expand-gentext"/>
      </xsl:copy>
   </xsl:template>

   <!--Initial pass template for Context: howtouse-->
<xsl:template match="howtouse" mode="initial-pass-mode" priority="0">
      <xsl:copy>
         <xsl:call-template name="maybe-set-gte-id"/>
         <xsl:apply-templates select="@*|node()" mode="initial-pass-mode"/>
      </xsl:copy>
   </xsl:template>

   <!--Set count-as pass template for Context: howtouse-->
<xsl:template match="howtouse" mode="set-countas" priority="0">
      <xsl:copy>
         <xsl:apply-templates select="@*|node()" mode="set-countas"/>
      </xsl:copy>
   </xsl:template>

   <!--Set ch:chunk template for Context: howtouse-->
<xsl:template match="howtouse" mode="set-ch-chunk" priority="0">
      <xsl:copy>
         <xsl:if test="not(@_gte:did-set-chunk)">
            <xsl:attribute name="_gte:did-set-chunk">yes</xsl:attribute>
         </xsl:if>
         <xsl:apply-templates select="@*|node()" mode="set-ch-chunk"/>
      </xsl:copy>
   </xsl:template>

   <!--Style template for Context: ics-->
<xsl:template name="__style-for_ics.1">
      <xsl:text> .x-ics-1-0 {margin-left: 0pt; margin-right: 0pt; text-indent: 0pt; margin-top: 6pt; margin-bottom: 6pt; }</xsl:text>
   </xsl:template>

   <!--Template for Context: ics-->
<xsl:template match="ics" priority="0">
      <xsl:variable name="foClass">definitionListItem</xsl:variable>
      <xsl:variable name="blockness">block</xsl:variable>
      <xsl:variable name="startnew"/>
      <xsl:variable name="newpageset">#noChange</xsl:variable>
      <xsl:apply-templates/>
   </xsl:template>

   <!--Gentext template for Context: ics-->
<xsl:template match="ics" mode="expand-gentext" priority="0">
      <xsl:copy>
         <xsl:apply-templates select="@*|node()" mode="expand-gentext"/>
      </xsl:copy>
   </xsl:template>

   <!--Initial pass template for Context: ics-->
<xsl:template match="ics" mode="initial-pass-mode" priority="0">
      <xsl:copy>
         <xsl:call-template name="maybe-set-gte-id"/>
         <xsl:apply-templates select="@*|node()" mode="initial-pass-mode"/>
      </xsl:copy>
   </xsl:template>

   <!--Set count-as pass template for Context: ics-->
<xsl:template match="ics" mode="set-countas" priority="0">
      <xsl:copy>
         <xsl:apply-templates select="@*|node()" mode="set-countas"/>
      </xsl:copy>
   </xsl:template>

   <!--Set ch:chunk template for Context: ics-->
<xsl:template match="ics" mode="set-ch-chunk" priority="0">
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

   <!--Style template for Context: increv-->
<xsl:template name="__style-for_increv.1">
      <xsl:text> .x-increv-1-0 {margin-left: 0pt; margin-right: 0pt; }</xsl:text>
   </xsl:template>

   <!--Template for Context: increv-->
<xsl:template match="increv" priority="0"><!--Emit a nostyle template--><xsl:apply-templates/>
   </xsl:template>

   <!--Gentext template for Context: increv-->
<xsl:template match="increv" mode="expand-gentext" priority="0">
      <xsl:copy>
         <xsl:apply-templates select="@*|node()" mode="expand-gentext"/>
      </xsl:copy>
   </xsl:template>

   <!--Initial pass template for Context: increv-->
<xsl:template match="increv" mode="initial-pass-mode" priority="0">
      <xsl:copy>
         <xsl:call-template name="maybe-set-gte-id"/>
         <xsl:apply-templates select="@*|node()" mode="initial-pass-mode"/>
      </xsl:copy>
   </xsl:template>

   <!--Set count-as pass template for Context: increv-->
<xsl:template match="increv" mode="set-countas" priority="0">
      <xsl:copy>
         <xsl:apply-templates select="@*|node()" mode="set-countas"/>
      </xsl:copy>
   </xsl:template>

   <!--Set ch:chunk template for Context: increv-->
<xsl:template match="increv" mode="set-ch-chunk" priority="0">
      <xsl:copy>
         <xsl:if test="not(@_gte:did-set-chunk)">
            <xsl:attribute name="_gte:did-set-chunk">yes</xsl:attribute>
         </xsl:if>
         <xsl:apply-templates select="@*|node()" mode="set-ch-chunk"/>
      </xsl:copy>
   </xsl:template>

   <!--Style template for Context: issdate-->
<xsl:template name="__style-for_issdate.1">
      <xsl:text> .x-issdate-1-0 {margin-left: 0pt; margin-right: 0pt; }</xsl:text>
   </xsl:template>

   <!--Template for Context: issdate-->
<xsl:template match="issdate" priority="0"><!--Emit a nostyle template--><xsl:apply-templates/>
   </xsl:template>

   <!--Gentext template for Context: issdate-->
<xsl:template match="issdate" mode="expand-gentext" priority="0">
      <xsl:copy>
         <xsl:apply-templates select="@*|node()" mode="expand-gentext"/>
      </xsl:copy>
   </xsl:template>

   <!--Initial pass template for Context: issdate-->
<xsl:template match="issdate" mode="initial-pass-mode" priority="0">
      <xsl:copy>
         <xsl:call-template name="maybe-set-gte-id"/>
         <xsl:apply-templates select="@*|node()" mode="initial-pass-mode"/>
      </xsl:copy>
   </xsl:template>

   <!--Set count-as pass template for Context: issdate-->
<xsl:template match="issdate" mode="set-countas" priority="0">
      <xsl:copy>
         <xsl:apply-templates select="@*|node()" mode="set-countas"/>
      </xsl:copy>
   </xsl:template>

   <!--Set ch:chunk template for Context: issdate-->
<xsl:template match="issdate" mode="set-ch-chunk" priority="0">
      <xsl:copy>
         <xsl:if test="not(@_gte:did-set-chunk)">
            <xsl:attribute name="_gte:did-set-chunk">yes</xsl:attribute>
         </xsl:if>
         <xsl:apply-templates select="@*|node()" mode="set-ch-chunk"/>
      </xsl:copy>
   </xsl:template>

   <!--Style template for Context: pbfmatr//list1/l1item[child::*[1] != 'note']-->
<xsl:template name="__style-for_l1item.5pbatem441">
      <xsl:text> .x-l1item-1-0 {margin-left: 0pt; margin-right: 0pt; text-indent: 0pt; margin-top: 6pt; margin-bottom: 6pt; margin-left: 0pt; text-indent: 0pt; }</xsl:text>
   </xsl:template>

   <!--Template for Context: pbfmatr//list1/l1item[child::*[1] != 'note']-->
<xsl:template match="pbfmatr//list1/l1item[child::*[1] != 'note']" priority="4">
      <table border="0" cellpadding="0" cellspacing="0">
         <xsl:attribute name="style">
            <xsl:variable name="followWith">emspace</xsl:variable>
            <xsl:if test="$followWith='tab'">table-layout: fixed; </xsl:if>
         </xsl:attribute>
         <!--Emit class values to reflect conditions--><xsl:attribute name="class">
            <xsl:text> x-l1item-1-0</xsl:text> x--zero-left-margins</xsl:attribute>
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
         <xsl:variable name="col1-width">0pt</xsl:variable>
         <xsl:variable name="col2-width"/>
         <xsl:variable name="col3-width">100%</xsl:variable>
         <xsl:variable name="itemlabel-colnum">2</xsl:variable>
         <xsl:variable name="col2-align">left</xsl:variable>
         <col>
            <xsl:if test="$col1-width!=''">
               <xsl:attribute name="style">
                  <xsl:text>width: </xsl:text>
                  <xsl:value-of select="$col1-width"/>
               </xsl:attribute>
            </xsl:if>
         </col>
         <col>
            <xsl:if test="$col2-width!=''">
               <xsl:attribute name="style">
                  <xsl:text>width: </xsl:text>
                  <xsl:value-of select="$col2-width"/>
               </xsl:attribute>
            </xsl:if>
         </col>
         <col>
            <xsl:if test="$col3-width!=''">
               <xsl:attribute name="style">
                  <xsl:text>width: </xsl:text>
                  <xsl:value-of select="$col3-width"/>
               </xsl:attribute>
            </xsl:if>
         </col>
         <tbody>
            <tr valign="baseline">
               <td align="right">
                  <xsl:if test="$itemlabel-colnum=1">
                     <xsl:attribute name="style">word-break: keep-all; </xsl:attribute>
                     <xsl:apply-templates select="_sfe:BeforeOrAfterText[1]"/>
                  </xsl:if>
               </td>
               <td align="{$col2-align}">
                  <xsl:if test="$itemlabel-colnum=2">
                     <xsl:attribute name="style">word-break: keep-all; </xsl:attribute>
                     <xsl:apply-templates select="_sfe:BeforeOrAfterText[1]"/>
                  </xsl:if>
               </td>
               <td>
                  <xsl:if test="$itemlabel-colnum=3">
                     <xsl:attribute name="style">word-break: keep-all; </xsl:attribute>
                     <xsl:apply-templates select="_sfe:BeforeOrAfterText[1]"/>
                  </xsl:if>
                  <!--Process this element's content--><xsl:apply-templates select="node()[name(.)!='_sfe:BeforeOrAfterText']"/>
               </td>
            </tr>
         </tbody>
      </table>
   </xsl:template>

   <!--Gentext template for Context: pbfmatr//list1/l1item[child::*[1] != 'note']-->
<xsl:template match="pbfmatr//list1/l1item[child::*[1] != 'note']" mode="expand-gentext"
                 priority="4">
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
               <xsl:text> </xsl:text>
            </_sfe:BeforeOrAfterText>
         </xsl:if>
         <xsl:apply-templates select="* | text() | processing-instruction()" mode="expand-gentext"/>
      </xsl:copy>
   </xsl:template>

   <!--Initial pass template for Context: pbfmatr//list1/l1item[child::*[1] != 'note']-->
<xsl:template match="pbfmatr//list1/l1item[child::*[1] != 'note']" mode="initial-pass-mode"
                 priority="4">
      <xsl:copy>
         <xsl:call-template name="maybe-set-gte-id"/>
         <xsl:apply-templates select="@*|node()" mode="initial-pass-mode"/>
      </xsl:copy>
   </xsl:template>

   <!--Numbering template for context=pbfmatr//list1/l1item[child::*[1] != 'note']-->
<xsl:template match="pbfmatr//list1/l1item[child::*[1] != 'note']" mode="styler_numbering"
                 priority="4">
      <xsl:number count="pbfmatr//list1/l1item" format="A"/>
      <xsl:text>.</xsl:text>
   </xsl:template>

   <!--Set count-as pass template for Context: pbfmatr//list1/l1item[child::*[1] != 'note']-->
<xsl:template match="pbfmatr//list1/l1item[child::*[1] != 'note']" mode="set-countas"
                 priority="4">
      <xsl:copy>
         <xsl:apply-templates select="@*|node()" mode="set-countas"/>
      </xsl:copy>
   </xsl:template>

   <!--LabelAndNumberMarker template-->
<xsl:template match="pbfmatr//list1/l1item[child::*[1] != 'note']"
                 mode="styler-LabelAndNumberMarker"
                 priority="4">
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
   </xsl:template>

   <!--Set ch:chunk template for Context: pbfmatr//list1/l1item[child::*[1] != 'note']-->
<xsl:template match="pbfmatr//list1/l1item[child::*[1] != 'note']" mode="set-ch-chunk"
                 priority="4">
      <xsl:copy>
         <xsl:if test="not(@_gte:did-set-chunk)">
            <xsl:attribute name="_gte:did-set-chunk">yes</xsl:attribute>
         </xsl:if>
         <xsl:apply-templates select="@*|node()" mode="set-ch-chunk"/>
      </xsl:copy>
   </xsl:template>

   <!--Style template for Context: pbfmatr//list1/l1item-->
<xsl:template name="__style-for_l1item.5pbatem212">
      <xsl:text> .x-l1item-2-0 {margin-left: 0pt; margin-right: 0pt; text-indent: 0pt; margin-top: 6pt; margin-bottom: 6pt; margin-left: 0pt; text-indent: 0pt; }</xsl:text>
   </xsl:template>

   <!--Template for Context: pbfmatr//list1/l1item-->
<xsl:template match="pbfmatr//list1/l1item" priority="3">
      <table border="0" cellpadding="0" cellspacing="0">
         <xsl:attribute name="style">
            <xsl:variable name="followWith">emspace</xsl:variable>
            <xsl:if test="$followWith='tab'">table-layout: fixed; </xsl:if>
         </xsl:attribute>
         <!--Emit class values to reflect conditions--><xsl:attribute name="class">
            <xsl:text> x-l1item-2-0</xsl:text> x--zero-left-margins</xsl:attribute>
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
         <xsl:variable name="col1-width">0pt</xsl:variable>
         <xsl:variable name="col2-width"/>
         <xsl:variable name="col3-width">100%</xsl:variable>
         <xsl:variable name="itemlabel-colnum">2</xsl:variable>
         <xsl:variable name="col2-align">left</xsl:variable>
         <col>
            <xsl:if test="$col1-width!=''">
               <xsl:attribute name="style">
                  <xsl:text>width: </xsl:text>
                  <xsl:value-of select="$col1-width"/>
               </xsl:attribute>
            </xsl:if>
         </col>
         <col>
            <xsl:if test="$col2-width!=''">
               <xsl:attribute name="style">
                  <xsl:text>width: </xsl:text>
                  <xsl:value-of select="$col2-width"/>
               </xsl:attribute>
            </xsl:if>
         </col>
         <col>
            <xsl:if test="$col3-width!=''">
               <xsl:attribute name="style">
                  <xsl:text>width: </xsl:text>
                  <xsl:value-of select="$col3-width"/>
               </xsl:attribute>
            </xsl:if>
         </col>
         <tbody>
            <tr valign="baseline">
               <td align="right">
                  <xsl:if test="$itemlabel-colnum=1">
                     <xsl:attribute name="style">word-break: keep-all; </xsl:attribute>
                     <xsl:apply-templates select="_sfe:BeforeOrAfterText[1]"/>
                  </xsl:if>
               </td>
               <td align="{$col2-align}">
                  <xsl:if test="$itemlabel-colnum=2">
                     <xsl:attribute name="style">word-break: keep-all; </xsl:attribute>
                     <xsl:apply-templates select="_sfe:BeforeOrAfterText[1]"/>
                  </xsl:if>
               </td>
               <td>
                  <xsl:if test="$itemlabel-colnum=3">
                     <xsl:attribute name="style">word-break: keep-all; </xsl:attribute>
                     <xsl:apply-templates select="_sfe:BeforeOrAfterText[1]"/>
                  </xsl:if>
                  <!--Process this element's content--><xsl:apply-templates select="node()[name(.)!='_sfe:BeforeOrAfterText']"/>
               </td>
            </tr>
         </tbody>
      </table>
   </xsl:template>

   <!--Gentext template for Context: pbfmatr//list1/l1item-->
<xsl:template match="pbfmatr//list1/l1item" mode="expand-gentext" priority="3">
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
               <xsl:text> </xsl:text>
            </_sfe:BeforeOrAfterText>
         </xsl:if>
         <xsl:apply-templates select="* | text() | processing-instruction()" mode="expand-gentext"/>
      </xsl:copy>
   </xsl:template>

   <!--Initial pass template for Context: pbfmatr//list1/l1item-->
<xsl:template match="pbfmatr//list1/l1item" mode="initial-pass-mode" priority="3">
      <xsl:copy>
         <xsl:call-template name="maybe-set-gte-id"/>
         <xsl:apply-templates select="@*|node()" mode="initial-pass-mode"/>
      </xsl:copy>
   </xsl:template>

   <!--Numbering template for context=pbfmatr//list1/l1item-->
<xsl:template match="pbfmatr//list1/l1item" mode="styler_numbering" priority="3">
      <xsl:number count="pbfmatr//list1/l1item" format="A"/>
      <xsl:text>.</xsl:text>
   </xsl:template>

   <!--Set count-as pass template for Context: pbfmatr//list1/l1item-->
<xsl:template match="pbfmatr//list1/l1item" mode="set-countas" priority="3">
      <xsl:copy>
         <xsl:apply-templates select="@*|node()" mode="set-countas"/>
      </xsl:copy>
   </xsl:template>

   <!--LabelAndNumberMarker template-->
<xsl:template match="pbfmatr//list1/l1item" mode="styler-LabelAndNumberMarker" priority="3">
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
   </xsl:template>

   <!--Set ch:chunk template for Context: pbfmatr//list1/l1item-->
<xsl:template match="pbfmatr//list1/l1item" mode="set-ch-chunk" priority="3">
      <xsl:copy>
         <xsl:if test="not(@_gte:did-set-chunk)">
            <xsl:attribute name="_gte:did-set-chunk">yes</xsl:attribute>
         </xsl:if>
         <xsl:apply-templates select="@*|node()" mode="set-ch-chunk"/>
      </xsl:copy>
   </xsl:template>

   <!--Style template for Context: list1/l1item[child::*[1] != 'note']-->
<xsl:template name="__style-for_l1item.5li1lem353">
      <xsl:text> .x-l1item-3-0 {margin-left: 0pt; margin-right: 0pt; text-indent: 0pt; margin-top: 6pt; margin-bottom: 6pt; margin-left: 0pt; text-indent: 0pt; }</xsl:text>
   </xsl:template>

   <!--Template for Context: list1/l1item[child::*[1] != 'note']-->
<xsl:template match="list1/l1item[child::*[1] != 'note']" priority="2">
      <table border="0" cellpadding="0" cellspacing="0">
         <xsl:attribute name="style">
            <xsl:variable name="followWith">emspace</xsl:variable>
            <xsl:if test="$followWith='tab'">table-layout: fixed; </xsl:if>
         </xsl:attribute>
         <!--Emit class values to reflect conditions--><xsl:attribute name="class">
            <xsl:text> x-l1item-3-0</xsl:text> x--zero-left-margins</xsl:attribute>
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
         <xsl:variable name="col1-width">0pt</xsl:variable>
         <xsl:variable name="col2-width"/>
         <xsl:variable name="col3-width">100%</xsl:variable>
         <xsl:variable name="itemlabel-colnum">2</xsl:variable>
         <xsl:variable name="col2-align">left</xsl:variable>
         <col>
            <xsl:if test="$col1-width!=''">
               <xsl:attribute name="style">
                  <xsl:text>width: </xsl:text>
                  <xsl:value-of select="$col1-width"/>
               </xsl:attribute>
            </xsl:if>
         </col>
         <col>
            <xsl:if test="$col2-width!=''">
               <xsl:attribute name="style">
                  <xsl:text>width: </xsl:text>
                  <xsl:value-of select="$col2-width"/>
               </xsl:attribute>
            </xsl:if>
         </col>
         <col>
            <xsl:if test="$col3-width!=''">
               <xsl:attribute name="style">
                  <xsl:text>width: </xsl:text>
                  <xsl:value-of select="$col3-width"/>
               </xsl:attribute>
            </xsl:if>
         </col>
         <tbody>
            <tr valign="baseline">
               <td align="right">
                  <xsl:if test="$itemlabel-colnum=1">
                     <xsl:attribute name="style">word-break: keep-all; </xsl:attribute>
                     <xsl:apply-templates select="_sfe:BeforeOrAfterText[1]"/>
                  </xsl:if>
               </td>
               <td align="{$col2-align}">
                  <xsl:if test="$itemlabel-colnum=2">
                     <xsl:attribute name="style">word-break: keep-all; </xsl:attribute>
                     <xsl:apply-templates select="_sfe:BeforeOrAfterText[1]"/>
                  </xsl:if>
               </td>
               <td>
                  <xsl:if test="$itemlabel-colnum=3">
                     <xsl:attribute name="style">word-break: keep-all; </xsl:attribute>
                     <xsl:apply-templates select="_sfe:BeforeOrAfterText[1]"/>
                  </xsl:if>
                  <!--Process this element's content--><xsl:apply-templates select="node()[name(.)!='_sfe:BeforeOrAfterText']"/>
               </td>
            </tr>
         </tbody>
      </table>
   </xsl:template>

   <!--Gentext template for Context: list1/l1item[child::*[1] != 'note']-->
<xsl:template match="list1/l1item[child::*[1] != 'note']" mode="expand-gentext" priority="2">
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
               <xsl:text> </xsl:text>
            </_sfe:BeforeOrAfterText>
         </xsl:if>
         <xsl:apply-templates select="* | text() | processing-instruction()" mode="expand-gentext"/>
      </xsl:copy>
   </xsl:template>

   <!--Initial pass template for Context: list1/l1item[child::*[1] != 'note']-->
<xsl:template match="list1/l1item[child::*[1] != 'note']" mode="initial-pass-mode"
                 priority="2">
      <xsl:copy>
         <xsl:call-template name="maybe-set-gte-id"/>
         <xsl:apply-templates select="@*|node()" mode="initial-pass-mode"/>
      </xsl:copy>
   </xsl:template>

   <!--Numbering template for context=list1/l1item[child::*[1] != 'note']-->
<xsl:template match="list1/l1item[child::*[1] != 'note']" mode="styler_numbering"
                 priority="2">
      <xsl:text>(</xsl:text>
      <xsl:number count="list1/l1item" format="1"/>
      <xsl:text>)</xsl:text>
   </xsl:template>

   <!--Set count-as pass template for Context: list1/l1item[child::*[1] != 'note']-->
<xsl:template match="list1/l1item[child::*[1] != 'note']" mode="set-countas" priority="2">
      <xsl:copy>
         <xsl:apply-templates select="@*|node()" mode="set-countas"/>
      </xsl:copy>
   </xsl:template>

   <!--LabelAndNumberMarker template-->
<xsl:template match="list1/l1item[child::*[1] != 'note']" mode="styler-LabelAndNumberMarker"
                 priority="2">
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
   </xsl:template>

   <!--Set ch:chunk template for Context: list1/l1item[child::*[1] != 'note']-->
<xsl:template match="list1/l1item[child::*[1] != 'note']" mode="set-ch-chunk" priority="2">
      <xsl:copy>
         <xsl:if test="not(@_gte:did-set-chunk)">
            <xsl:attribute name="_gte:did-set-chunk">yes</xsl:attribute>
         </xsl:if>
         <xsl:apply-templates select="@*|node()" mode="set-ch-chunk"/>
      </xsl:copy>
   </xsl:template>

   <!--Style template for Context: list1/l1item-->
<xsl:template name="__style-for_l1item.5li1lem124">
      <xsl:text> .x-l1item-4-0 {margin-left: 0pt; margin-right: 0pt; text-indent: 0pt; margin-top: 6pt; margin-bottom: 6pt; margin-left: 0pt; text-indent: 0pt; }</xsl:text>
   </xsl:template>

   <!--Template for Context: list1/l1item-->
<xsl:template match="list1/l1item" priority="1">
      <table border="0" cellpadding="0" cellspacing="0">
         <xsl:attribute name="style">
            <xsl:variable name="followWith">emspace</xsl:variable>
            <xsl:if test="$followWith='tab'">table-layout: fixed; </xsl:if>
         </xsl:attribute>
         <!--Emit class values to reflect conditions--><xsl:attribute name="class">
            <xsl:text> x-l1item-4-0</xsl:text> x--zero-left-margins</xsl:attribute>
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
         <xsl:variable name="col1-width">0pt</xsl:variable>
         <xsl:variable name="col2-width"/>
         <xsl:variable name="col3-width">100%</xsl:variable>
         <xsl:variable name="itemlabel-colnum">2</xsl:variable>
         <xsl:variable name="col2-align">left</xsl:variable>
         <col>
            <xsl:if test="$col1-width!=''">
               <xsl:attribute name="style">
                  <xsl:text>width: </xsl:text>
                  <xsl:value-of select="$col1-width"/>
               </xsl:attribute>
            </xsl:if>
         </col>
         <col>
            <xsl:if test="$col2-width!=''">
               <xsl:attribute name="style">
                  <xsl:text>width: </xsl:text>
                  <xsl:value-of select="$col2-width"/>
               </xsl:attribute>
            </xsl:if>
         </col>
         <col>
            <xsl:if test="$col3-width!=''">
               <xsl:attribute name="style">
                  <xsl:text>width: </xsl:text>
                  <xsl:value-of select="$col3-width"/>
               </xsl:attribute>
            </xsl:if>
         </col>
         <tbody>
            <tr valign="baseline">
               <td align="right">
                  <xsl:if test="$itemlabel-colnum=1">
                     <xsl:attribute name="style">word-break: keep-all; </xsl:attribute>
                     <xsl:apply-templates select="_sfe:BeforeOrAfterText[1]"/>
                  </xsl:if>
               </td>
               <td align="{$col2-align}">
                  <xsl:if test="$itemlabel-colnum=2">
                     <xsl:attribute name="style">word-break: keep-all; </xsl:attribute>
                     <xsl:apply-templates select="_sfe:BeforeOrAfterText[1]"/>
                  </xsl:if>
               </td>
               <td>
                  <xsl:if test="$itemlabel-colnum=3">
                     <xsl:attribute name="style">word-break: keep-all; </xsl:attribute>
                     <xsl:apply-templates select="_sfe:BeforeOrAfterText[1]"/>
                  </xsl:if>
                  <!--Process this element's content--><xsl:apply-templates select="node()[name(.)!='_sfe:BeforeOrAfterText']"/>
               </td>
            </tr>
         </tbody>
      </table>
   </xsl:template>

   <!--Gentext template for Context: list1/l1item-->
<xsl:template match="list1/l1item" mode="expand-gentext" priority="1">
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
               <xsl:text> </xsl:text>
            </_sfe:BeforeOrAfterText>
         </xsl:if>
         <xsl:apply-templates select="* | text() | processing-instruction()" mode="expand-gentext"/>
      </xsl:copy>
   </xsl:template>

   <!--Initial pass template for Context: list1/l1item-->
<xsl:template match="list1/l1item" mode="initial-pass-mode" priority="1">
      <xsl:copy>
         <xsl:call-template name="maybe-set-gte-id"/>
         <xsl:apply-templates select="@*|node()" mode="initial-pass-mode"/>
      </xsl:copy>
   </xsl:template>

   <!--Numbering template for context=list1/l1item-->
<xsl:template match="list1/l1item" mode="styler_numbering" priority="1">
      <xsl:text>(</xsl:text>
      <xsl:number count="list1/l1item" format="1"/>
      <xsl:text>)</xsl:text>
   </xsl:template>

   <!--Set count-as pass template for Context: list1/l1item-->
<xsl:template match="list1/l1item" mode="set-countas" priority="1">
      <xsl:copy>
         <xsl:apply-templates select="@*|node()" mode="set-countas"/>
      </xsl:copy>
   </xsl:template>

   <!--LabelAndNumberMarker template-->
<xsl:template match="list1/l1item" mode="styler-LabelAndNumberMarker" priority="1">
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
   </xsl:template>

   <!--Set ch:chunk template for Context: list1/l1item-->
<xsl:template match="list1/l1item" mode="set-ch-chunk" priority="1">
      <xsl:copy>
         <xsl:if test="not(@_gte:did-set-chunk)">
            <xsl:attribute name="_gte:did-set-chunk">yes</xsl:attribute>
         </xsl:if>
         <xsl:apply-templates select="@*|node()" mode="set-ch-chunk"/>
      </xsl:copy>
   </xsl:template>

   <!--Style template for Context: l1item-->
<xsl:template name="__style-for_l1item.5l1emem65">
      <xsl:text> .x-l1item-5-0 {margin-left: 0pt; margin-right: 0pt; text-indent: 0pt; margin-top: 6pt; margin-bottom: 6pt; margin-left: 0pt; text-indent: 0pt; }</xsl:text>
   </xsl:template>

   <!--Template for Context: l1item-->
<xsl:template match="l1item" priority="0">
      <table border="0" cellpadding="0" cellspacing="0">
         <xsl:attribute name="style">
            <xsl:variable name="followWith"/>
            <xsl:if test="$followWith='tab'">table-layout: fixed; </xsl:if>
         </xsl:attribute>
         <!--Emit class values to reflect conditions--><xsl:attribute name="class">
            <xsl:text> x-l1item-5-0</xsl:text> x--zero-left-margins</xsl:attribute>
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
         <xsl:variable name="col1-width">0pt</xsl:variable>
         <xsl:variable name="col2-width">0pt</xsl:variable>
         <xsl:variable name="col3-width"/>
         <xsl:variable name="itemlabel-colnum">3</xsl:variable>
         <xsl:variable name="col2-align">center</xsl:variable>
         <col>
            <xsl:if test="$col1-width!=''">
               <xsl:attribute name="style">
                  <xsl:text>width: </xsl:text>
                  <xsl:value-of select="$col1-width"/>
               </xsl:attribute>
            </xsl:if>
         </col>
         <col>
            <xsl:if test="$col2-width!=''">
               <xsl:attribute name="style">
                  <xsl:text>width: </xsl:text>
                  <xsl:value-of select="$col2-width"/>
               </xsl:attribute>
            </xsl:if>
         </col>
         <col>
            <xsl:if test="$col3-width!=''">
               <xsl:attribute name="style">
                  <xsl:text>width: </xsl:text>
                  <xsl:value-of select="$col3-width"/>
               </xsl:attribute>
            </xsl:if>
         </col>
         <tbody>
            <tr valign="baseline">
               <td align="right">
                  <xsl:if test="$itemlabel-colnum=1">
                     <xsl:attribute name="style">word-break: keep-all; </xsl:attribute>
                  </xsl:if>
               </td>
               <td align="{$col2-align}">
                  <xsl:if test="$itemlabel-colnum=2">
                     <xsl:attribute name="style">word-break: keep-all; </xsl:attribute>
                  </xsl:if>
               </td>
               <td>
                  <xsl:if test="$itemlabel-colnum=3">
                     <xsl:attribute name="style">word-break: keep-all; </xsl:attribute>
                  </xsl:if>
                  <!--Process this element's content--><xsl:apply-templates select="node()[name(.)!='_sfe:BeforeOrAfterText']"/>
               </td>
            </tr>
         </tbody>
      </table>
   </xsl:template>

   <!--Gentext template for Context: l1item-->
<xsl:template match="l1item" mode="expand-gentext" priority="0">
      <xsl:copy>
         <xsl:apply-templates select="@*|node()" mode="expand-gentext"/>
      </xsl:copy>
   </xsl:template>

   <!--Initial pass template for Context: l1item-->
<xsl:template match="l1item" mode="initial-pass-mode" priority="0">
      <xsl:copy>
         <xsl:call-template name="maybe-set-gte-id"/>
         <xsl:apply-templates select="@*|node()" mode="initial-pass-mode"/>
      </xsl:copy>
   </xsl:template>

   <!--Set count-as pass template for Context: l1item-->
<xsl:template match="l1item" mode="set-countas" priority="0">
      <xsl:copy>
         <xsl:apply-templates select="@*|node()" mode="set-countas"/>
      </xsl:copy>
   </xsl:template>

   <!--Set ch:chunk template for Context: l1item-->
<xsl:template match="l1item" mode="set-ch-chunk" priority="0">
      <xsl:copy>
         <xsl:if test="not(@_gte:did-set-chunk)">
            <xsl:attribute name="_gte:did-set-chunk">yes</xsl:attribute>
         </xsl:if>
         <xsl:apply-templates select="@*|node()" mode="set-ch-chunk"/>
      </xsl:copy>
   </xsl:template>

   <!--Style template for Context: pbfmatr//list2/l2item[child::*[1] != 'note']-->
<xsl:template name="__style-for_l2item.5pbatem441">
      <xsl:text> .x-l2item-1-0 {margin-left: 0pt; margin-right: 0pt; text-indent: 0pt; margin-top: 6pt; margin-bottom: 6pt; margin-left: 0pt; text-indent: 0pt; }</xsl:text>
   </xsl:template>

   <!--Template for Context: pbfmatr//list2/l2item[child::*[1] != 'note']-->
<xsl:template match="pbfmatr//list2/l2item[child::*[1] != 'note']" priority="4">
      <table border="0" cellpadding="0" cellspacing="0">
         <xsl:attribute name="style">
            <xsl:variable name="followWith">emspace</xsl:variable>
            <xsl:if test="$followWith='tab'">table-layout: fixed; </xsl:if>
         </xsl:attribute>
         <!--Emit class values to reflect conditions--><xsl:attribute name="class">
            <xsl:text> x-l2item-1-0</xsl:text> x--zero-left-margins</xsl:attribute>
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
         <xsl:variable name="col1-width">1.5em</xsl:variable>
         <xsl:variable name="col2-width"/>
         <xsl:variable name="col3-width">100%</xsl:variable>
         <xsl:variable name="itemlabel-colnum">1</xsl:variable>
         <xsl:variable name="col2-align">right</xsl:variable>
         <col>
            <xsl:if test="$col1-width!=''">
               <xsl:attribute name="style">
                  <xsl:text>width: </xsl:text>
                  <xsl:value-of select="$col1-width"/>
               </xsl:attribute>
            </xsl:if>
         </col>
         <col>
            <xsl:if test="$col2-width!=''">
               <xsl:attribute name="style">
                  <xsl:text>width: </xsl:text>
                  <xsl:value-of select="$col2-width"/>
               </xsl:attribute>
            </xsl:if>
         </col>
         <col>
            <xsl:if test="$col3-width!=''">
               <xsl:attribute name="style">
                  <xsl:text>width: </xsl:text>
                  <xsl:value-of select="$col3-width"/>
               </xsl:attribute>
            </xsl:if>
         </col>
         <tbody>
            <tr valign="baseline">
               <td align="right">
                  <xsl:if test="$itemlabel-colnum=1">
                     <xsl:attribute name="style">word-break: keep-all; </xsl:attribute>
                     <xsl:apply-templates select="_sfe:BeforeOrAfterText[1]"/>
                  </xsl:if>
               </td>
               <td align="{$col2-align}">
                  <xsl:if test="$itemlabel-colnum=2">
                     <xsl:attribute name="style">word-break: keep-all; </xsl:attribute>
                     <xsl:apply-templates select="_sfe:BeforeOrAfterText[1]"/>
                  </xsl:if>
               </td>
               <td>
                  <xsl:if test="$itemlabel-colnum=3">
                     <xsl:attribute name="style">word-break: keep-all; </xsl:attribute>
                     <xsl:apply-templates select="_sfe:BeforeOrAfterText[1]"/>
                  </xsl:if>
                  <!--Process this element's content--><xsl:apply-templates select="node()[name(.)!='_sfe:BeforeOrAfterText']"/>
               </td>
            </tr>
         </tbody>
      </table>
   </xsl:template>

   <!--Gentext template for Context: pbfmatr//list2/l2item[child::*[1] != 'note']-->
<xsl:template match="pbfmatr//list2/l2item[child::*[1] != 'note']" mode="expand-gentext"
                 priority="4">
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
               <xsl:text> </xsl:text>
            </_sfe:BeforeOrAfterText>
         </xsl:if>
         <xsl:apply-templates select="* | text() | processing-instruction()" mode="expand-gentext"/>
      </xsl:copy>
   </xsl:template>

   <!--Initial pass template for Context: pbfmatr//list2/l2item[child::*[1] != 'note']-->
<xsl:template match="pbfmatr//list2/l2item[child::*[1] != 'note']" mode="initial-pass-mode"
                 priority="4">
      <xsl:copy>
         <xsl:call-template name="maybe-set-gte-id"/>
         <xsl:apply-templates select="@*|node()" mode="initial-pass-mode"/>
      </xsl:copy>
   </xsl:template>

   <!--Numbering template for context=pbfmatr//list2/l2item[child::*[1] != 'note']-->
<xsl:template match="pbfmatr//list2/l2item[child::*[1] != 'note']" mode="styler_numbering"
                 priority="4">
      <xsl:text>(</xsl:text>
      <xsl:number count="pbfmatr//list2/l2item" format="1"/>
      <xsl:text>)</xsl:text>
   </xsl:template>

   <!--Set count-as pass template for Context: pbfmatr//list2/l2item[child::*[1] != 'note']-->
<xsl:template match="pbfmatr//list2/l2item[child::*[1] != 'note']" mode="set-countas"
                 priority="4">
      <xsl:copy>
         <xsl:apply-templates select="@*|node()" mode="set-countas"/>
      </xsl:copy>
   </xsl:template>

   <!--LabelAndNumberMarker template-->
<xsl:template match="pbfmatr//list2/l2item[child::*[1] != 'note']"
                 mode="styler-LabelAndNumberMarker"
                 priority="4">
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
   </xsl:template>

   <!--Set ch:chunk template for Context: pbfmatr//list2/l2item[child::*[1] != 'note']-->
<xsl:template match="pbfmatr//list2/l2item[child::*[1] != 'note']" mode="set-ch-chunk"
                 priority="4">
      <xsl:copy>
         <xsl:if test="not(@_gte:did-set-chunk)">
            <xsl:attribute name="_gte:did-set-chunk">yes</xsl:attribute>
         </xsl:if>
         <xsl:apply-templates select="@*|node()" mode="set-ch-chunk"/>
      </xsl:copy>
   </xsl:template>

   <!--Style template for Context: pbfmatr//list2/l2item-->
<xsl:template name="__style-for_l2item.5pbatem212">
      <xsl:text> .x-l2item-2-0 {margin-left: 0pt; margin-right: 0pt; text-indent: 0pt; margin-top: 6pt; margin-bottom: 6pt; margin-left: 0pt; text-indent: 0pt; }</xsl:text>
   </xsl:template>

   <!--Template for Context: pbfmatr//list2/l2item-->
<xsl:template match="pbfmatr//list2/l2item" priority="3">
      <table border="0" cellpadding="0" cellspacing="0">
         <xsl:attribute name="style">
            <xsl:variable name="followWith">emspace</xsl:variable>
            <xsl:if test="$followWith='tab'">table-layout: fixed; </xsl:if>
         </xsl:attribute>
         <!--Emit class values to reflect conditions--><xsl:attribute name="class">
            <xsl:text> x-l2item-2-0</xsl:text> x--zero-left-margins</xsl:attribute>
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
         <xsl:variable name="col1-width">1.5em</xsl:variable>
         <xsl:variable name="col2-width"/>
         <xsl:variable name="col3-width">100%</xsl:variable>
         <xsl:variable name="itemlabel-colnum">1</xsl:variable>
         <xsl:variable name="col2-align">right</xsl:variable>
         <col>
            <xsl:if test="$col1-width!=''">
               <xsl:attribute name="style">
                  <xsl:text>width: </xsl:text>
                  <xsl:value-of select="$col1-width"/>
               </xsl:attribute>
            </xsl:if>
         </col>
         <col>
            <xsl:if test="$col2-width!=''">
               <xsl:attribute name="style">
                  <xsl:text>width: </xsl:text>
                  <xsl:value-of select="$col2-width"/>
               </xsl:attribute>
            </xsl:if>
         </col>
         <col>
            <xsl:if test="$col3-width!=''">
               <xsl:attribute name="style">
                  <xsl:text>width: </xsl:text>
                  <xsl:value-of select="$col3-width"/>
               </xsl:attribute>
            </xsl:if>
         </col>
         <tbody>
            <tr valign="baseline">
               <td align="right">
                  <xsl:if test="$itemlabel-colnum=1">
                     <xsl:attribute name="style">word-break: keep-all; </xsl:attribute>
                     <xsl:apply-templates select="_sfe:BeforeOrAfterText[1]"/>
                  </xsl:if>
               </td>
               <td align="{$col2-align}">
                  <xsl:if test="$itemlabel-colnum=2">
                     <xsl:attribute name="style">word-break: keep-all; </xsl:attribute>
                     <xsl:apply-templates select="_sfe:BeforeOrAfterText[1]"/>
                  </xsl:if>
               </td>
               <td>
                  <xsl:if test="$itemlabel-colnum=3">
                     <xsl:attribute name="style">word-break: keep-all; </xsl:attribute>
                     <xsl:apply-templates select="_sfe:BeforeOrAfterText[1]"/>
                  </xsl:if>
                  <!--Process this element's content--><xsl:apply-templates select="node()[name(.)!='_sfe:BeforeOrAfterText']"/>
               </td>
            </tr>
         </tbody>
      </table>
   </xsl:template>

   <!--Gentext template for Context: pbfmatr//list2/l2item-->
<xsl:template match="pbfmatr//list2/l2item" mode="expand-gentext" priority="3">
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
               <xsl:text> </xsl:text>
            </_sfe:BeforeOrAfterText>
         </xsl:if>
         <xsl:apply-templates select="* | text() | processing-instruction()" mode="expand-gentext"/>
      </xsl:copy>
   </xsl:template>

   <!--Initial pass template for Context: pbfmatr//list2/l2item-->
<xsl:template match="pbfmatr//list2/l2item" mode="initial-pass-mode" priority="3">
      <xsl:copy>
         <xsl:call-template name="maybe-set-gte-id"/>
         <xsl:apply-templates select="@*|node()" mode="initial-pass-mode"/>
      </xsl:copy>
   </xsl:template>

   <!--Numbering template for context=pbfmatr//list2/l2item-->
<xsl:template match="pbfmatr//list2/l2item" mode="styler_numbering" priority="3">
      <xsl:text>(</xsl:text>
      <xsl:number count="pbfmatr//list2/l2item" format="1"/>
      <xsl:text>)</xsl:text>
   </xsl:template>

   <!--Set count-as pass template for Context: pbfmatr//list2/l2item-->
<xsl:template match="pbfmatr//list2/l2item" mode="set-countas" priority="3">
      <xsl:copy>
         <xsl:apply-templates select="@*|node()" mode="set-countas"/>
      </xsl:copy>
   </xsl:template>

   <!--LabelAndNumberMarker template-->
<xsl:template match="pbfmatr//list2/l2item" mode="styler-LabelAndNumberMarker" priority="3">
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
   </xsl:template>

   <!--Set ch:chunk template for Context: pbfmatr//list2/l2item-->
<xsl:template match="pbfmatr//list2/l2item" mode="set-ch-chunk" priority="3">
      <xsl:copy>
         <xsl:if test="not(@_gte:did-set-chunk)">
            <xsl:attribute name="_gte:did-set-chunk">yes</xsl:attribute>
         </xsl:if>
         <xsl:apply-templates select="@*|node()" mode="set-ch-chunk"/>
      </xsl:copy>
   </xsl:template>

   <!--Style template for Context: list2/l2item[child::*[1] != 'note']-->
<xsl:template name="__style-for_l2item.5li2lem353">
      <xsl:text> .x-l2item-3-0 {margin-left: 0pt; margin-right: 0pt; text-indent: 0pt; margin-top: 6pt; margin-bottom: 6pt; margin-left: 0pt; text-indent: 0pt; }</xsl:text>
   </xsl:template>

   <!--Template for Context: list2/l2item[child::*[1] != 'note']-->
<xsl:template match="list2/l2item[child::*[1] != 'note']" priority="2">
      <table border="0" cellpadding="0" cellspacing="0">
         <xsl:attribute name="style">
            <xsl:variable name="followWith">emspace</xsl:variable>
            <xsl:if test="$followWith='tab'">table-layout: fixed; </xsl:if>
         </xsl:attribute>
         <!--Emit class values to reflect conditions--><xsl:attribute name="class">
            <xsl:text> x-l2item-3-0</xsl:text> x--zero-left-margins</xsl:attribute>
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
         <xsl:variable name="col1-width">1.5em</xsl:variable>
         <xsl:variable name="col2-width"/>
         <xsl:variable name="col3-width">100%</xsl:variable>
         <xsl:variable name="itemlabel-colnum">1</xsl:variable>
         <xsl:variable name="col2-align">right</xsl:variable>
         <col>
            <xsl:if test="$col1-width!=''">
               <xsl:attribute name="style">
                  <xsl:text>width: </xsl:text>
                  <xsl:value-of select="$col1-width"/>
               </xsl:attribute>
            </xsl:if>
         </col>
         <col>
            <xsl:if test="$col2-width!=''">
               <xsl:attribute name="style">
                  <xsl:text>width: </xsl:text>
                  <xsl:value-of select="$col2-width"/>
               </xsl:attribute>
            </xsl:if>
         </col>
         <col>
            <xsl:if test="$col3-width!=''">
               <xsl:attribute name="style">
                  <xsl:text>width: </xsl:text>
                  <xsl:value-of select="$col3-width"/>
               </xsl:attribute>
            </xsl:if>
         </col>
         <tbody>
            <tr valign="baseline">
               <td align="right">
                  <xsl:if test="$itemlabel-colnum=1">
                     <xsl:attribute name="style">word-break: keep-all; </xsl:attribute>
                     <xsl:apply-templates select="_sfe:BeforeOrAfterText[1]"/>
                  </xsl:if>
               </td>
               <td align="{$col2-align}">
                  <xsl:if test="$itemlabel-colnum=2">
                     <xsl:attribute name="style">word-break: keep-all; </xsl:attribute>
                     <xsl:apply-templates select="_sfe:BeforeOrAfterText[1]"/>
                  </xsl:if>
               </td>
               <td>
                  <xsl:if test="$itemlabel-colnum=3">
                     <xsl:attribute name="style">word-break: keep-all; </xsl:attribute>
                     <xsl:apply-templates select="_sfe:BeforeOrAfterText[1]"/>
                  </xsl:if>
                  <!--Process this element's content--><xsl:apply-templates select="node()[name(.)!='_sfe:BeforeOrAfterText']"/>
               </td>
            </tr>
         </tbody>
      </table>
   </xsl:template>

   <!--Gentext template for Context: list2/l2item[child::*[1] != 'note']-->
<xsl:template match="list2/l2item[child::*[1] != 'note']" mode="expand-gentext" priority="2">
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
               <xsl:text> </xsl:text>
            </_sfe:BeforeOrAfterText>
         </xsl:if>
         <xsl:apply-templates select="* | text() | processing-instruction()" mode="expand-gentext"/>
      </xsl:copy>
   </xsl:template>

   <!--Initial pass template for Context: list2/l2item[child::*[1] != 'note']-->
<xsl:template match="list2/l2item[child::*[1] != 'note']" mode="initial-pass-mode"
                 priority="2">
      <xsl:copy>
         <xsl:call-template name="maybe-set-gte-id"/>
         <xsl:apply-templates select="@*|node()" mode="initial-pass-mode"/>
      </xsl:copy>
   </xsl:template>

   <!--Numbering template for context=list2/l2item[child::*[1] != 'note']-->
<xsl:template match="list2/l2item[child::*[1] != 'note']" mode="styler_numbering"
                 priority="2">
      <xsl:text>(</xsl:text>
      <xsl:number count="list2/l2item" format="a"/>
      <xsl:text>)</xsl:text>
   </xsl:template>

   <!--Set count-as pass template for Context: list2/l2item[child::*[1] != 'note']-->
<xsl:template match="list2/l2item[child::*[1] != 'note']" mode="set-countas" priority="2">
      <xsl:copy>
         <xsl:apply-templates select="@*|node()" mode="set-countas"/>
      </xsl:copy>
   </xsl:template>

   <!--LabelAndNumberMarker template-->
<xsl:template match="list2/l2item[child::*[1] != 'note']" mode="styler-LabelAndNumberMarker"
                 priority="2">
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
   </xsl:template>

   <!--Set ch:chunk template for Context: list2/l2item[child::*[1] != 'note']-->
<xsl:template match="list2/l2item[child::*[1] != 'note']" mode="set-ch-chunk" priority="2">
      <xsl:copy>
         <xsl:if test="not(@_gte:did-set-chunk)">
            <xsl:attribute name="_gte:did-set-chunk">yes</xsl:attribute>
         </xsl:if>
         <xsl:apply-templates select="@*|node()" mode="set-ch-chunk"/>
      </xsl:copy>
   </xsl:template>

   <!--Style template for Context: list2/l2item-->
<xsl:template name="__style-for_l2item.5li2lem124">
      <xsl:text> .x-l2item-4-0 {margin-left: 0pt; margin-right: 0pt; text-indent: 0pt; margin-top: 6pt; margin-bottom: 6pt; margin-left: 0pt; text-indent: 0pt; }</xsl:text>
   </xsl:template>

   <!--Template for Context: list2/l2item-->
<xsl:template match="list2/l2item" priority="1">
      <table border="0" cellpadding="0" cellspacing="0">
         <xsl:attribute name="style">
            <xsl:variable name="followWith">emspace</xsl:variable>
            <xsl:if test="$followWith='tab'">table-layout: fixed; </xsl:if>
         </xsl:attribute>
         <!--Emit class values to reflect conditions--><xsl:attribute name="class">
            <xsl:text> x-l2item-4-0</xsl:text> x--zero-left-margins</xsl:attribute>
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
         <xsl:variable name="col1-width">1.5em</xsl:variable>
         <xsl:variable name="col2-width"/>
         <xsl:variable name="col3-width">100%</xsl:variable>
         <xsl:variable name="itemlabel-colnum">1</xsl:variable>
         <xsl:variable name="col2-align">right</xsl:variable>
         <col>
            <xsl:if test="$col1-width!=''">
               <xsl:attribute name="style">
                  <xsl:text>width: </xsl:text>
                  <xsl:value-of select="$col1-width"/>
               </xsl:attribute>
            </xsl:if>
         </col>
         <col>
            <xsl:if test="$col2-width!=''">
               <xsl:attribute name="style">
                  <xsl:text>width: </xsl:text>
                  <xsl:value-of select="$col2-width"/>
               </xsl:attribute>
            </xsl:if>
         </col>
         <col>
            <xsl:if test="$col3-width!=''">
               <xsl:attribute name="style">
                  <xsl:text>width: </xsl:text>
                  <xsl:value-of select="$col3-width"/>
               </xsl:attribute>
            </xsl:if>
         </col>
         <tbody>
            <tr valign="baseline">
               <td align="right">
                  <xsl:if test="$itemlabel-colnum=1">
                     <xsl:attribute name="style">word-break: keep-all; </xsl:attribute>
                     <xsl:apply-templates select="_sfe:BeforeOrAfterText[1]"/>
                  </xsl:if>
               </td>
               <td align="{$col2-align}">
                  <xsl:if test="$itemlabel-colnum=2">
                     <xsl:attribute name="style">word-break: keep-all; </xsl:attribute>
                     <xsl:apply-templates select="_sfe:BeforeOrAfterText[1]"/>
                  </xsl:if>
               </td>
               <td>
                  <xsl:if test="$itemlabel-colnum=3">
                     <xsl:attribute name="style">word-break: keep-all; </xsl:attribute>
                     <xsl:apply-templates select="_sfe:BeforeOrAfterText[1]"/>
                  </xsl:if>
                  <!--Process this element's content--><xsl:apply-templates select="node()[name(.)!='_sfe:BeforeOrAfterText']"/>
               </td>
            </tr>
         </tbody>
      </table>
   </xsl:template>

   <!--Gentext template for Context: list2/l2item-->
<xsl:template match="list2/l2item" mode="expand-gentext" priority="1">
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
               <xsl:text> </xsl:text>
            </_sfe:BeforeOrAfterText>
         </xsl:if>
         <xsl:apply-templates select="* | text() | processing-instruction()" mode="expand-gentext"/>
      </xsl:copy>
   </xsl:template>

   <!--Initial pass template for Context: list2/l2item-->
<xsl:template match="list2/l2item" mode="initial-pass-mode" priority="1">
      <xsl:copy>
         <xsl:call-template name="maybe-set-gte-id"/>
         <xsl:apply-templates select="@*|node()" mode="initial-pass-mode"/>
      </xsl:copy>
   </xsl:template>

   <!--Numbering template for context=list2/l2item-->
<xsl:template match="list2/l2item" mode="styler_numbering" priority="1">
      <xsl:text>(</xsl:text>
      <xsl:number count="list2/l2item" format="a"/>
      <xsl:text>)</xsl:text>
   </xsl:template>

   <!--Set count-as pass template for Context: list2/l2item-->
<xsl:template match="list2/l2item" mode="set-countas" priority="1">
      <xsl:copy>
         <xsl:apply-templates select="@*|node()" mode="set-countas"/>
      </xsl:copy>
   </xsl:template>

   <!--LabelAndNumberMarker template-->
<xsl:template match="list2/l2item" mode="styler-LabelAndNumberMarker" priority="1">
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
   </xsl:template>

   <!--Set ch:chunk template for Context: list2/l2item-->
<xsl:template match="list2/l2item" mode="set-ch-chunk" priority="1">
      <xsl:copy>
         <xsl:if test="not(@_gte:did-set-chunk)">
            <xsl:attribute name="_gte:did-set-chunk">yes</xsl:attribute>
         </xsl:if>
         <xsl:apply-templates select="@*|node()" mode="set-ch-chunk"/>
      </xsl:copy>
   </xsl:template>

   <!--Style template for Context: l2item-->
<xsl:template name="__style-for_l2item.5l2emem65">
      <xsl:text> .x-l2item-5-0 {margin-left: 0pt; margin-right: 0pt; text-indent: 0pt; margin-top: 6pt; margin-bottom: 6pt; margin-left: 0pt; text-indent: 0pt; }</xsl:text>
   </xsl:template>

   <!--Template for Context: l2item-->
<xsl:template match="l2item" priority="0">
      <table border="0" cellpadding="0" cellspacing="0">
         <xsl:attribute name="style">
            <xsl:variable name="followWith"/>
            <xsl:if test="$followWith='tab'">table-layout: fixed; </xsl:if>
         </xsl:attribute>
         <!--Emit class values to reflect conditions--><xsl:attribute name="class">
            <xsl:text> x-l2item-5-0</xsl:text> x--zero-left-margins</xsl:attribute>
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
         <xsl:variable name="col1-width">0pt</xsl:variable>
         <xsl:variable name="col2-width">0pt</xsl:variable>
         <xsl:variable name="col3-width"/>
         <xsl:variable name="itemlabel-colnum">3</xsl:variable>
         <xsl:variable name="col2-align">center</xsl:variable>
         <col>
            <xsl:if test="$col1-width!=''">
               <xsl:attribute name="style">
                  <xsl:text>width: </xsl:text>
                  <xsl:value-of select="$col1-width"/>
               </xsl:attribute>
            </xsl:if>
         </col>
         <col>
            <xsl:if test="$col2-width!=''">
               <xsl:attribute name="style">
                  <xsl:text>width: </xsl:text>
                  <xsl:value-of select="$col2-width"/>
               </xsl:attribute>
            </xsl:if>
         </col>
         <col>
            <xsl:if test="$col3-width!=''">
               <xsl:attribute name="style">
                  <xsl:text>width: </xsl:text>
                  <xsl:value-of select="$col3-width"/>
               </xsl:attribute>
            </xsl:if>
         </col>
         <tbody>
            <tr valign="baseline">
               <td align="right">
                  <xsl:if test="$itemlabel-colnum=1">
                     <xsl:attribute name="style">word-break: keep-all; </xsl:attribute>
                  </xsl:if>
               </td>
               <td align="{$col2-align}">
                  <xsl:if test="$itemlabel-colnum=2">
                     <xsl:attribute name="style">word-break: keep-all; </xsl:attribute>
                  </xsl:if>
               </td>
               <td>
                  <xsl:if test="$itemlabel-colnum=3">
                     <xsl:attribute name="style">word-break: keep-all; </xsl:attribute>
                  </xsl:if>
                  <!--Process this element's content--><xsl:apply-templates select="node()[name(.)!='_sfe:BeforeOrAfterText']"/>
               </td>
            </tr>
         </tbody>
      </table>
   </xsl:template>

   <!--Gentext template for Context: l2item-->
<xsl:template match="l2item" mode="expand-gentext" priority="0">
      <xsl:copy>
         <xsl:apply-templates select="@*|node()" mode="expand-gentext"/>
      </xsl:copy>
   </xsl:template>

   <!--Initial pass template for Context: l2item-->
<xsl:template match="l2item" mode="initial-pass-mode" priority="0">
      <xsl:copy>
         <xsl:call-template name="maybe-set-gte-id"/>
         <xsl:apply-templates select="@*|node()" mode="initial-pass-mode"/>
      </xsl:copy>
   </xsl:template>

   <!--Set count-as pass template for Context: l2item-->
<xsl:template match="l2item" mode="set-countas" priority="0">
      <xsl:copy>
         <xsl:apply-templates select="@*|node()" mode="set-countas"/>
      </xsl:copy>
   </xsl:template>

   <!--Set ch:chunk template for Context: l2item-->
<xsl:template match="l2item" mode="set-ch-chunk" priority="0">
      <xsl:copy>
         <xsl:if test="not(@_gte:did-set-chunk)">
            <xsl:attribute name="_gte:did-set-chunk">yes</xsl:attribute>
         </xsl:if>
         <xsl:apply-templates select="@*|node()" mode="set-ch-chunk"/>
      </xsl:copy>
   </xsl:template>

   <!--Style template for Context: pbfmatr//list3/l3item[child::*[1] != 'note']-->
<xsl:template name="__style-for_l3item.5pbatem441">
      <xsl:text> .x-l3item-1-0 {margin-left: 0pt; margin-right: 0pt; text-indent: 0pt; margin-top: 6pt; margin-bottom: 6pt; margin-left: 0pt; text-indent: 0pt; }</xsl:text>
   </xsl:template>

   <!--Template for Context: pbfmatr//list3/l3item[child::*[1] != 'note']-->
<xsl:template match="pbfmatr//list3/l3item[child::*[1] != 'note']" priority="4">
      <table border="0" cellpadding="0" cellspacing="0">
         <xsl:attribute name="style">
            <xsl:variable name="followWith">emspace</xsl:variable>
            <xsl:if test="$followWith='tab'">table-layout: fixed; </xsl:if>
         </xsl:attribute>
         <!--Emit class values to reflect conditions--><xsl:attribute name="class">
            <xsl:text> x-l3item-1-0</xsl:text> x--zero-left-margins</xsl:attribute>
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
         <xsl:variable name="col1-width">1.5em</xsl:variable>
         <xsl:variable name="col2-width"/>
         <xsl:variable name="col3-width">100%</xsl:variable>
         <xsl:variable name="itemlabel-colnum">1</xsl:variable>
         <xsl:variable name="col2-align">right</xsl:variable>
         <col>
            <xsl:if test="$col1-width!=''">
               <xsl:attribute name="style">
                  <xsl:text>width: </xsl:text>
                  <xsl:value-of select="$col1-width"/>
               </xsl:attribute>
            </xsl:if>
         </col>
         <col>
            <xsl:if test="$col2-width!=''">
               <xsl:attribute name="style">
                  <xsl:text>width: </xsl:text>
                  <xsl:value-of select="$col2-width"/>
               </xsl:attribute>
            </xsl:if>
         </col>
         <col>
            <xsl:if test="$col3-width!=''">
               <xsl:attribute name="style">
                  <xsl:text>width: </xsl:text>
                  <xsl:value-of select="$col3-width"/>
               </xsl:attribute>
            </xsl:if>
         </col>
         <tbody>
            <tr valign="baseline">
               <td align="right">
                  <xsl:if test="$itemlabel-colnum=1">
                     <xsl:attribute name="style">word-break: keep-all; </xsl:attribute>
                     <xsl:apply-templates select="_sfe:BeforeOrAfterText[1]"/>
                  </xsl:if>
               </td>
               <td align="{$col2-align}">
                  <xsl:if test="$itemlabel-colnum=2">
                     <xsl:attribute name="style">word-break: keep-all; </xsl:attribute>
                     <xsl:apply-templates select="_sfe:BeforeOrAfterText[1]"/>
                  </xsl:if>
               </td>
               <td>
                  <xsl:if test="$itemlabel-colnum=3">
                     <xsl:attribute name="style">word-break: keep-all; </xsl:attribute>
                     <xsl:apply-templates select="_sfe:BeforeOrAfterText[1]"/>
                  </xsl:if>
                  <!--Process this element's content--><xsl:apply-templates select="node()[name(.)!='_sfe:BeforeOrAfterText']"/>
               </td>
            </tr>
         </tbody>
      </table>
   </xsl:template>

   <!--Gentext template for Context: pbfmatr//list3/l3item[child::*[1] != 'note']-->
<xsl:template match="pbfmatr//list3/l3item[child::*[1] != 'note']" mode="expand-gentext"
                 priority="4">
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
               <xsl:text> </xsl:text>
            </_sfe:BeforeOrAfterText>
         </xsl:if>
         <xsl:apply-templates select="* | text() | processing-instruction()" mode="expand-gentext"/>
      </xsl:copy>
   </xsl:template>

   <!--Initial pass template for Context: pbfmatr//list3/l3item[child::*[1] != 'note']-->
<xsl:template match="pbfmatr//list3/l3item[child::*[1] != 'note']" mode="initial-pass-mode"
                 priority="4">
      <xsl:copy>
         <xsl:call-template name="maybe-set-gte-id"/>
         <xsl:apply-templates select="@*|node()" mode="initial-pass-mode"/>
      </xsl:copy>
   </xsl:template>

   <!--Numbering template for context=pbfmatr//list3/l3item[child::*[1] != 'note']-->
<xsl:template match="pbfmatr//list3/l3item[child::*[1] != 'note']" mode="styler_numbering"
                 priority="4">
      <xsl:text>(</xsl:text>
      <xsl:number count="pbfmatr//list3/l3item" format="a"/>
      <xsl:text>)</xsl:text>
   </xsl:template>

   <!--Set count-as pass template for Context: pbfmatr//list3/l3item[child::*[1] != 'note']-->
<xsl:template match="pbfmatr//list3/l3item[child::*[1] != 'note']" mode="set-countas"
                 priority="4">
      <xsl:copy>
         <xsl:apply-templates select="@*|node()" mode="set-countas"/>
      </xsl:copy>
   </xsl:template>

   <!--LabelAndNumberMarker template-->
<xsl:template match="pbfmatr//list3/l3item[child::*[1] != 'note']"
                 mode="styler-LabelAndNumberMarker"
                 priority="4">
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
   </xsl:template>

   <!--Set ch:chunk template for Context: pbfmatr//list3/l3item[child::*[1] != 'note']-->
<xsl:template match="pbfmatr//list3/l3item[child::*[1] != 'note']" mode="set-ch-chunk"
                 priority="4">
      <xsl:copy>
         <xsl:if test="not(@_gte:did-set-chunk)">
            <xsl:attribute name="_gte:did-set-chunk">yes</xsl:attribute>
         </xsl:if>
         <xsl:apply-templates select="@*|node()" mode="set-ch-chunk"/>
      </xsl:copy>
   </xsl:template>

   <!--Style template for Context: pbfmatr//list3/l3item-->
<xsl:template name="__style-for_l3item.5pbatem212">
      <xsl:text> .x-l3item-2-0 {margin-left: 0pt; margin-right: 0pt; text-indent: 0pt; margin-top: 6pt; margin-bottom: 6pt; margin-left: 0pt; text-indent: 0pt; }</xsl:text>
   </xsl:template>

   <!--Template for Context: pbfmatr//list3/l3item-->
<xsl:template match="pbfmatr//list3/l3item" priority="3">
      <table border="0" cellpadding="0" cellspacing="0">
         <xsl:attribute name="style">
            <xsl:variable name="followWith">emspace</xsl:variable>
            <xsl:if test="$followWith='tab'">table-layout: fixed; </xsl:if>
         </xsl:attribute>
         <!--Emit class values to reflect conditions--><xsl:attribute name="class">
            <xsl:text> x-l3item-2-0</xsl:text> x--zero-left-margins</xsl:attribute>
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
         <xsl:variable name="col1-width">1.5em</xsl:variable>
         <xsl:variable name="col2-width"/>
         <xsl:variable name="col3-width">100%</xsl:variable>
         <xsl:variable name="itemlabel-colnum">1</xsl:variable>
         <xsl:variable name="col2-align">right</xsl:variable>
         <col>
            <xsl:if test="$col1-width!=''">
               <xsl:attribute name="style">
                  <xsl:text>width: </xsl:text>
                  <xsl:value-of select="$col1-width"/>
               </xsl:attribute>
            </xsl:if>
         </col>
         <col>
            <xsl:if test="$col2-width!=''">
               <xsl:attribute name="style">
                  <xsl:text>width: </xsl:text>
                  <xsl:value-of select="$col2-width"/>
               </xsl:attribute>
            </xsl:if>
         </col>
         <col>
            <xsl:if test="$col3-width!=''">
               <xsl:attribute name="style">
                  <xsl:text>width: </xsl:text>
                  <xsl:value-of select="$col3-width"/>
               </xsl:attribute>
            </xsl:if>
         </col>
         <tbody>
            <tr valign="baseline">
               <td align="right">
                  <xsl:if test="$itemlabel-colnum=1">
                     <xsl:attribute name="style">word-break: keep-all; </xsl:attribute>
                     <xsl:apply-templates select="_sfe:BeforeOrAfterText[1]"/>
                  </xsl:if>
               </td>
               <td align="{$col2-align}">
                  <xsl:if test="$itemlabel-colnum=2">
                     <xsl:attribute name="style">word-break: keep-all; </xsl:attribute>
                     <xsl:apply-templates select="_sfe:BeforeOrAfterText[1]"/>
                  </xsl:if>
               </td>
               <td>
                  <xsl:if test="$itemlabel-colnum=3">
                     <xsl:attribute name="style">word-break: keep-all; </xsl:attribute>
                     <xsl:apply-templates select="_sfe:BeforeOrAfterText[1]"/>
                  </xsl:if>
                  <!--Process this element's content--><xsl:apply-templates select="node()[name(.)!='_sfe:BeforeOrAfterText']"/>
               </td>
            </tr>
         </tbody>
      </table>
   </xsl:template>

   <!--Gentext template for Context: pbfmatr//list3/l3item-->
<xsl:template match="pbfmatr//list3/l3item" mode="expand-gentext" priority="3">
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
               <xsl:text> </xsl:text>
            </_sfe:BeforeOrAfterText>
         </xsl:if>
         <xsl:apply-templates select="* | text() | processing-instruction()" mode="expand-gentext"/>
      </xsl:copy>
   </xsl:template>

   <!--Initial pass template for Context: pbfmatr//list3/l3item-->
<xsl:template match="pbfmatr//list3/l3item" mode="initial-pass-mode" priority="3">
      <xsl:copy>
         <xsl:call-template name="maybe-set-gte-id"/>
         <xsl:apply-templates select="@*|node()" mode="initial-pass-mode"/>
      </xsl:copy>
   </xsl:template>

   <!--Numbering template for context=pbfmatr//list3/l3item-->
<xsl:template match="pbfmatr//list3/l3item" mode="styler_numbering" priority="3">
      <xsl:text>(</xsl:text>
      <xsl:number count="pbfmatr//list3/l3item" format="a"/>
      <xsl:text>)</xsl:text>
   </xsl:template>

   <!--Set count-as pass template for Context: pbfmatr//list3/l3item-->
<xsl:template match="pbfmatr//list3/l3item" mode="set-countas" priority="3">
      <xsl:copy>
         <xsl:apply-templates select="@*|node()" mode="set-countas"/>
      </xsl:copy>
   </xsl:template>

   <!--LabelAndNumberMarker template-->
<xsl:template match="pbfmatr//list3/l3item" mode="styler-LabelAndNumberMarker" priority="3">
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
   </xsl:template>

   <!--Set ch:chunk template for Context: pbfmatr//list3/l3item-->
<xsl:template match="pbfmatr//list3/l3item" mode="set-ch-chunk" priority="3">
      <xsl:copy>
         <xsl:if test="not(@_gte:did-set-chunk)">
            <xsl:attribute name="_gte:did-set-chunk">yes</xsl:attribute>
         </xsl:if>
         <xsl:apply-templates select="@*|node()" mode="set-ch-chunk"/>
      </xsl:copy>
   </xsl:template>

   <!--Style template for Context: list3/l3item[child::*[1] != 'note']-->
<xsl:template name="__style-for_l3item.5li3lem353">
      <xsl:text> .x-l3item-3-0 {margin-left: 0pt; margin-right: 0pt; text-indent: 0pt; margin-top: 6pt; margin-bottom: 6pt; margin-left: 0pt; text-indent: 0pt; }</xsl:text>
   </xsl:template>

   <!--Template for Context: list3/l3item[child::*[1] != 'note']-->
<xsl:template match="list3/l3item[child::*[1] != 'note']" priority="2">
      <table border="0" cellpadding="0" cellspacing="0">
         <xsl:attribute name="style">
            <xsl:variable name="followWith">emspace</xsl:variable>
            <xsl:if test="$followWith='tab'">table-layout: fixed; </xsl:if>
         </xsl:attribute>
         <!--Emit class values to reflect conditions--><xsl:attribute name="class">
            <xsl:text> x-l3item-3-0</xsl:text> x--zero-left-margins</xsl:attribute>
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
         <xsl:variable name="col1-width">1.5em</xsl:variable>
         <xsl:variable name="col2-width"/>
         <xsl:variable name="col3-width">100%</xsl:variable>
         <xsl:variable name="itemlabel-colnum">1</xsl:variable>
         <xsl:variable name="col2-align">right</xsl:variable>
         <col>
            <xsl:if test="$col1-width!=''">
               <xsl:attribute name="style">
                  <xsl:text>width: </xsl:text>
                  <xsl:value-of select="$col1-width"/>
               </xsl:attribute>
            </xsl:if>
         </col>
         <col>
            <xsl:if test="$col2-width!=''">
               <xsl:attribute name="style">
                  <xsl:text>width: </xsl:text>
                  <xsl:value-of select="$col2-width"/>
               </xsl:attribute>
            </xsl:if>
         </col>
         <col>
            <xsl:if test="$col3-width!=''">
               <xsl:attribute name="style">
                  <xsl:text>width: </xsl:text>
                  <xsl:value-of select="$col3-width"/>
               </xsl:attribute>
            </xsl:if>
         </col>
         <tbody>
            <tr valign="baseline">
               <td align="right">
                  <xsl:if test="$itemlabel-colnum=1">
                     <xsl:attribute name="style">word-break: keep-all; </xsl:attribute>
                     <xsl:apply-templates select="_sfe:BeforeOrAfterText[1]"/>
                  </xsl:if>
               </td>
               <td align="{$col2-align}">
                  <xsl:if test="$itemlabel-colnum=2">
                     <xsl:attribute name="style">word-break: keep-all; </xsl:attribute>
                     <xsl:apply-templates select="_sfe:BeforeOrAfterText[1]"/>
                  </xsl:if>
               </td>
               <td>
                  <xsl:if test="$itemlabel-colnum=3">
                     <xsl:attribute name="style">word-break: keep-all; </xsl:attribute>
                     <xsl:apply-templates select="_sfe:BeforeOrAfterText[1]"/>
                  </xsl:if>
                  <!--Process this element's content--><xsl:apply-templates select="node()[name(.)!='_sfe:BeforeOrAfterText']"/>
               </td>
            </tr>
         </tbody>
      </table>
   </xsl:template>

   <!--Gentext template for Context: list3/l3item[child::*[1] != 'note']-->
<xsl:template match="list3/l3item[child::*[1] != 'note']" mode="expand-gentext" priority="2">
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
               <span style="text-decoration: underline; ">
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
               </span>
               <xsl:text> </xsl:text>
               <xsl:text> </xsl:text>
            </_sfe:BeforeOrAfterText>
         </xsl:if>
         <xsl:apply-templates select="* | text() | processing-instruction()" mode="expand-gentext"/>
      </xsl:copy>
   </xsl:template>

   <!--Initial pass template for Context: list3/l3item[child::*[1] != 'note']-->
<xsl:template match="list3/l3item[child::*[1] != 'note']" mode="initial-pass-mode"
                 priority="2">
      <xsl:copy>
         <xsl:call-template name="maybe-set-gte-id"/>
         <xsl:apply-templates select="@*|node()" mode="initial-pass-mode"/>
      </xsl:copy>
   </xsl:template>

   <!--Numbering template for context=list3/l3item[child::*[1] != 'note']-->
<xsl:template match="list3/l3item[child::*[1] != 'note']" mode="styler_numbering"
                 priority="2">
      <xsl:number count="list3/l3item" format="1"/>
   </xsl:template>

   <!--Set count-as pass template for Context: list3/l3item[child::*[1] != 'note']-->
<xsl:template match="list3/l3item[child::*[1] != 'note']" mode="set-countas" priority="2">
      <xsl:copy>
         <xsl:apply-templates select="@*|node()" mode="set-countas"/>
      </xsl:copy>
   </xsl:template>

   <!--LabelAndNumberMarker template-->
<xsl:template match="list3/l3item[child::*[1] != 'note']" mode="styler-LabelAndNumberMarker"
                 priority="2">
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
   </xsl:template>

   <!--Set ch:chunk template for Context: list3/l3item[child::*[1] != 'note']-->
<xsl:template match="list3/l3item[child::*[1] != 'note']" mode="set-ch-chunk" priority="2">
      <xsl:copy>
         <xsl:if test="not(@_gte:did-set-chunk)">
            <xsl:attribute name="_gte:did-set-chunk">yes</xsl:attribute>
         </xsl:if>
         <xsl:apply-templates select="@*|node()" mode="set-ch-chunk"/>
      </xsl:copy>
   </xsl:template>

   <!--Style template for Context: list3/l3item-->
<xsl:template name="__style-for_l3item.5li3lem124">
      <xsl:text> .x-l3item-4-0 {margin-left: 0pt; margin-right: 0pt; text-indent: 0pt; margin-top: 6pt; margin-bottom: 6pt; margin-left: 0pt; text-indent: 0pt; }</xsl:text>
   </xsl:template>

   <!--Template for Context: list3/l3item-->
<xsl:template match="list3/l3item" priority="1">
      <table border="0" cellpadding="0" cellspacing="0">
         <xsl:attribute name="style">
            <xsl:variable name="followWith">emspace</xsl:variable>
            <xsl:if test="$followWith='tab'">table-layout: fixed; </xsl:if>
         </xsl:attribute>
         <!--Emit class values to reflect conditions--><xsl:attribute name="class">
            <xsl:text> x-l3item-4-0</xsl:text> x--zero-left-margins</xsl:attribute>
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
         <xsl:variable name="col1-width">1.5em</xsl:variable>
         <xsl:variable name="col2-width"/>
         <xsl:variable name="col3-width">100%</xsl:variable>
         <xsl:variable name="itemlabel-colnum">1</xsl:variable>
         <xsl:variable name="col2-align">right</xsl:variable>
         <col>
            <xsl:if test="$col1-width!=''">
               <xsl:attribute name="style">
                  <xsl:text>width: </xsl:text>
                  <xsl:value-of select="$col1-width"/>
               </xsl:attribute>
            </xsl:if>
         </col>
         <col>
            <xsl:if test="$col2-width!=''">
               <xsl:attribute name="style">
                  <xsl:text>width: </xsl:text>
                  <xsl:value-of select="$col2-width"/>
               </xsl:attribute>
            </xsl:if>
         </col>
         <col>
            <xsl:if test="$col3-width!=''">
               <xsl:attribute name="style">
                  <xsl:text>width: </xsl:text>
                  <xsl:value-of select="$col3-width"/>
               </xsl:attribute>
            </xsl:if>
         </col>
         <tbody>
            <tr valign="baseline">
               <td align="right">
                  <xsl:if test="$itemlabel-colnum=1">
                     <xsl:attribute name="style">word-break: keep-all; </xsl:attribute>
                     <xsl:apply-templates select="_sfe:BeforeOrAfterText[1]"/>
                  </xsl:if>
               </td>
               <td align="{$col2-align}">
                  <xsl:if test="$itemlabel-colnum=2">
                     <xsl:attribute name="style">word-break: keep-all; </xsl:attribute>
                     <xsl:apply-templates select="_sfe:BeforeOrAfterText[1]"/>
                  </xsl:if>
               </td>
               <td>
                  <xsl:if test="$itemlabel-colnum=3">
                     <xsl:attribute name="style">word-break: keep-all; </xsl:attribute>
                     <xsl:apply-templates select="_sfe:BeforeOrAfterText[1]"/>
                  </xsl:if>
                  <!--Process this element's content--><xsl:apply-templates select="node()[name(.)!='_sfe:BeforeOrAfterText']"/>
               </td>
            </tr>
         </tbody>
      </table>
   </xsl:template>

   <!--Gentext template for Context: list3/l3item-->
<xsl:template match="list3/l3item" mode="expand-gentext" priority="1">
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
               <span style="text-decoration: underline; ">
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
               </span>
               <xsl:text> </xsl:text>
               <xsl:text> </xsl:text>
            </_sfe:BeforeOrAfterText>
         </xsl:if>
         <xsl:apply-templates select="* | text() | processing-instruction()" mode="expand-gentext"/>
      </xsl:copy>
   </xsl:template>

   <!--Initial pass template for Context: list3/l3item-->
<xsl:template match="list3/l3item" mode="initial-pass-mode" priority="1">
      <xsl:copy>
         <xsl:call-template name="maybe-set-gte-id"/>
         <xsl:apply-templates select="@*|node()" mode="initial-pass-mode"/>
      </xsl:copy>
   </xsl:template>

   <!--Numbering template for context=list3/l3item-->
<xsl:template match="list3/l3item" mode="styler_numbering" priority="1">
      <xsl:number count="list3/l3item" format="1"/>
   </xsl:template>

   <!--Set count-as pass template for Context: list3/l3item-->
<xsl:template match="list3/l3item" mode="set-countas" priority="1">
      <xsl:copy>
         <xsl:apply-templates select="@*|node()" mode="set-countas"/>
      </xsl:copy>
   </xsl:template>

   <!--LabelAndNumberMarker template-->
<xsl:template match="list3/l3item" mode="styler-LabelAndNumberMarker" priority="1">
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
   </xsl:template>

   <!--Set ch:chunk template for Context: list3/l3item-->
<xsl:template match="list3/l3item" mode="set-ch-chunk" priority="1">
      <xsl:copy>
         <xsl:if test="not(@_gte:did-set-chunk)">
            <xsl:attribute name="_gte:did-set-chunk">yes</xsl:attribute>
         </xsl:if>
         <xsl:apply-templates select="@*|node()" mode="set-ch-chunk"/>
      </xsl:copy>
   </xsl:template>

   <!--Style template for Context: l3item-->
<xsl:template name="__style-for_l3item.5l3emem65">
      <xsl:text> .x-l3item-5-0 {margin-left: 0pt; margin-right: 0pt; text-indent: 0pt; margin-top: 6pt; margin-bottom: 6pt; margin-left: 0pt; text-indent: 0pt; }</xsl:text>
   </xsl:template>

   <!--Template for Context: l3item-->
<xsl:template match="l3item" priority="0">
      <table border="0" cellpadding="0" cellspacing="0">
         <xsl:attribute name="style">
            <xsl:variable name="followWith"/>
            <xsl:if test="$followWith='tab'">table-layout: fixed; </xsl:if>
         </xsl:attribute>
         <!--Emit class values to reflect conditions--><xsl:attribute name="class">
            <xsl:text> x-l3item-5-0</xsl:text> x--zero-left-margins</xsl:attribute>
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
         <xsl:variable name="col1-width">0pt</xsl:variable>
         <xsl:variable name="col2-width">0pt</xsl:variable>
         <xsl:variable name="col3-width"/>
         <xsl:variable name="itemlabel-colnum">3</xsl:variable>
         <xsl:variable name="col2-align">center</xsl:variable>
         <col>
            <xsl:if test="$col1-width!=''">
               <xsl:attribute name="style">
                  <xsl:text>width: </xsl:text>
                  <xsl:value-of select="$col1-width"/>
               </xsl:attribute>
            </xsl:if>
         </col>
         <col>
            <xsl:if test="$col2-width!=''">
               <xsl:attribute name="style">
                  <xsl:text>width: </xsl:text>
                  <xsl:value-of select="$col2-width"/>
               </xsl:attribute>
            </xsl:if>
         </col>
         <col>
            <xsl:if test="$col3-width!=''">
               <xsl:attribute name="style">
                  <xsl:text>width: </xsl:text>
                  <xsl:value-of select="$col3-width"/>
               </xsl:attribute>
            </xsl:if>
         </col>
         <tbody>
            <tr valign="baseline">
               <td align="right">
                  <xsl:if test="$itemlabel-colnum=1">
                     <xsl:attribute name="style">word-break: keep-all; </xsl:attribute>
                  </xsl:if>
               </td>
               <td align="{$col2-align}">
                  <xsl:if test="$itemlabel-colnum=2">
                     <xsl:attribute name="style">word-break: keep-all; </xsl:attribute>
                  </xsl:if>
               </td>
               <td>
                  <xsl:if test="$itemlabel-colnum=3">
                     <xsl:attribute name="style">word-break: keep-all; </xsl:attribute>
                  </xsl:if>
                  <!--Process this element's content--><xsl:apply-templates select="node()[name(.)!='_sfe:BeforeOrAfterText']"/>
               </td>
            </tr>
         </tbody>
      </table>
   </xsl:template>

   <!--Gentext template for Context: l3item-->
<xsl:template match="l3item" mode="expand-gentext" priority="0">
      <xsl:copy>
         <xsl:apply-templates select="@*|node()" mode="expand-gentext"/>
      </xsl:copy>
   </xsl:template>

   <!--Initial pass template for Context: l3item-->
<xsl:template match="l3item" mode="initial-pass-mode" priority="0">
      <xsl:copy>
         <xsl:call-template name="maybe-set-gte-id"/>
         <xsl:apply-templates select="@*|node()" mode="initial-pass-mode"/>
      </xsl:copy>
   </xsl:template>

   <!--Set count-as pass template for Context: l3item-->
<xsl:template match="l3item" mode="set-countas" priority="0">
      <xsl:copy>
         <xsl:apply-templates select="@*|node()" mode="set-countas"/>
      </xsl:copy>
   </xsl:template>

   <!--Set ch:chunk template for Context: l3item-->
<xsl:template match="l3item" mode="set-ch-chunk" priority="0">
      <xsl:copy>
         <xsl:if test="not(@_gte:did-set-chunk)">
            <xsl:attribute name="_gte:did-set-chunk">yes</xsl:attribute>
         </xsl:if>
         <xsl:apply-templates select="@*|node()" mode="set-ch-chunk"/>
      </xsl:copy>
   </xsl:template>

   <!--Style template for Context: pbfmatr//list4/l4item[child::*[1] != 'note']-->
<xsl:template name="__style-for_l4item.5pbatem441">
      <xsl:text> .x-l4item-1-0 {margin-left: 0pt; margin-right: 0pt; text-indent: 0pt; margin-top: 6pt; margin-bottom: 6pt; margin-left: 0pt; text-indent: 0pt; }</xsl:text>
   </xsl:template>

   <!--Template for Context: pbfmatr//list4/l4item[child::*[1] != 'note']-->
<xsl:template match="pbfmatr//list4/l4item[child::*[1] != 'note']" priority="4">
      <table border="0" cellpadding="0" cellspacing="0">
         <xsl:attribute name="style">
            <xsl:variable name="followWith">emspace</xsl:variable>
            <xsl:if test="$followWith='tab'">table-layout: fixed; </xsl:if>
         </xsl:attribute>
         <!--Emit class values to reflect conditions--><xsl:attribute name="class">
            <xsl:text> x-l4item-1-0</xsl:text> x--zero-left-margins</xsl:attribute>
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
         <xsl:variable name="col1-width">1.5em</xsl:variable>
         <xsl:variable name="col2-width"/>
         <xsl:variable name="col3-width">100%</xsl:variable>
         <xsl:variable name="itemlabel-colnum">1</xsl:variable>
         <xsl:variable name="col2-align">right</xsl:variable>
         <col>
            <xsl:if test="$col1-width!=''">
               <xsl:attribute name="style">
                  <xsl:text>width: </xsl:text>
                  <xsl:value-of select="$col1-width"/>
               </xsl:attribute>
            </xsl:if>
         </col>
         <col>
            <xsl:if test="$col2-width!=''">
               <xsl:attribute name="style">
                  <xsl:text>width: </xsl:text>
                  <xsl:value-of select="$col2-width"/>
               </xsl:attribute>
            </xsl:if>
         </col>
         <col>
            <xsl:if test="$col3-width!=''">
               <xsl:attribute name="style">
                  <xsl:text>width: </xsl:text>
                  <xsl:value-of select="$col3-width"/>
               </xsl:attribute>
            </xsl:if>
         </col>
         <tbody>
            <tr valign="baseline">
               <td align="right">
                  <xsl:if test="$itemlabel-colnum=1">
                     <xsl:attribute name="style">word-break: keep-all; </xsl:attribute>
                     <xsl:apply-templates select="_sfe:BeforeOrAfterText[1]"/>
                  </xsl:if>
               </td>
               <td align="{$col2-align}">
                  <xsl:if test="$itemlabel-colnum=2">
                     <xsl:attribute name="style">word-break: keep-all; </xsl:attribute>
                     <xsl:apply-templates select="_sfe:BeforeOrAfterText[1]"/>
                  </xsl:if>
               </td>
               <td>
                  <xsl:if test="$itemlabel-colnum=3">
                     <xsl:attribute name="style">word-break: keep-all; </xsl:attribute>
                     <xsl:apply-templates select="_sfe:BeforeOrAfterText[1]"/>
                  </xsl:if>
                  <!--Process this element's content--><xsl:apply-templates select="node()[name(.)!='_sfe:BeforeOrAfterText']"/>
               </td>
            </tr>
         </tbody>
      </table>
   </xsl:template>

   <!--Gentext template for Context: pbfmatr//list4/l4item[child::*[1] != 'note']-->
<xsl:template match="pbfmatr//list4/l4item[child::*[1] != 'note']" mode="expand-gentext"
                 priority="4">
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
               <span style="text-decoration: underline; ">
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
               </span>
               <xsl:text> </xsl:text>
               <xsl:text> </xsl:text>
            </_sfe:BeforeOrAfterText>
         </xsl:if>
         <xsl:apply-templates select="* | text() | processing-instruction()" mode="expand-gentext"/>
      </xsl:copy>
   </xsl:template>

   <!--Initial pass template for Context: pbfmatr//list4/l4item[child::*[1] != 'note']-->
<xsl:template match="pbfmatr//list4/l4item[child::*[1] != 'note']" mode="initial-pass-mode"
                 priority="4">
      <xsl:copy>
         <xsl:call-template name="maybe-set-gte-id"/>
         <xsl:apply-templates select="@*|node()" mode="initial-pass-mode"/>
      </xsl:copy>
   </xsl:template>

   <!--Numbering template for context=pbfmatr//list4/l4item[child::*[1] != 'note']-->
<xsl:template match="pbfmatr//list4/l4item[child::*[1] != 'note']" mode="styler_numbering"
                 priority="4">
      <xsl:number count="pbfmatr//list4/l4item" format="1"/>
   </xsl:template>

   <!--Set count-as pass template for Context: pbfmatr//list4/l4item[child::*[1] != 'note']-->
<xsl:template match="pbfmatr//list4/l4item[child::*[1] != 'note']" mode="set-countas"
                 priority="4">
      <xsl:copy>
         <xsl:apply-templates select="@*|node()" mode="set-countas"/>
      </xsl:copy>
   </xsl:template>

   <!--LabelAndNumberMarker template-->
<xsl:template match="pbfmatr//list4/l4item[child::*[1] != 'note']"
                 mode="styler-LabelAndNumberMarker"
                 priority="4">
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
   </xsl:template>

   <!--Set ch:chunk template for Context: pbfmatr//list4/l4item[child::*[1] != 'note']-->
<xsl:template match="pbfmatr//list4/l4item[child::*[1] != 'note']" mode="set-ch-chunk"
                 priority="4">
      <xsl:copy>
         <xsl:if test="not(@_gte:did-set-chunk)">
            <xsl:attribute name="_gte:did-set-chunk">yes</xsl:attribute>
         </xsl:if>
         <xsl:apply-templates select="@*|node()" mode="set-ch-chunk"/>
      </xsl:copy>
   </xsl:template>

   <!--Style template for Context: pbfmatr//list4/l4item-->
<xsl:template name="__style-for_l4item.5pbatem212">
      <xsl:text> .x-l4item-2-0 {margin-left: 0pt; margin-right: 0pt; text-indent: 0pt; margin-top: 6pt; margin-bottom: 6pt; margin-left: 0pt; text-indent: 0pt; }</xsl:text>
   </xsl:template>

   <!--Template for Context: pbfmatr//list4/l4item-->
<xsl:template match="pbfmatr//list4/l4item" priority="3">
      <table border="0" cellpadding="0" cellspacing="0">
         <xsl:attribute name="style">
            <xsl:variable name="followWith">emspace</xsl:variable>
            <xsl:if test="$followWith='tab'">table-layout: fixed; </xsl:if>
         </xsl:attribute>
         <!--Emit class values to reflect conditions--><xsl:attribute name="class">
            <xsl:text> x-l4item-2-0</xsl:text> x--zero-left-margins</xsl:attribute>
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
         <xsl:variable name="col1-width">1.5em</xsl:variable>
         <xsl:variable name="col2-width"/>
         <xsl:variable name="col3-width">100%</xsl:variable>
         <xsl:variable name="itemlabel-colnum">1</xsl:variable>
         <xsl:variable name="col2-align">right</xsl:variable>
         <col>
            <xsl:if test="$col1-width!=''">
               <xsl:attribute name="style">
                  <xsl:text>width: </xsl:text>
                  <xsl:value-of select="$col1-width"/>
               </xsl:attribute>
            </xsl:if>
         </col>
         <col>
            <xsl:if test="$col2-width!=''">
               <xsl:attribute name="style">
                  <xsl:text>width: </xsl:text>
                  <xsl:value-of select="$col2-width"/>
               </xsl:attribute>
            </xsl:if>
         </col>
         <col>
            <xsl:if test="$col3-width!=''">
               <xsl:attribute name="style">
                  <xsl:text>width: </xsl:text>
                  <xsl:value-of select="$col3-width"/>
               </xsl:attribute>
            </xsl:if>
         </col>
         <tbody>
            <tr valign="baseline">
               <td align="right">
                  <xsl:if test="$itemlabel-colnum=1">
                     <xsl:attribute name="style">word-break: keep-all; </xsl:attribute>
                     <xsl:apply-templates select="_sfe:BeforeOrAfterText[1]"/>
                  </xsl:if>
               </td>
               <td align="{$col2-align}">
                  <xsl:if test="$itemlabel-colnum=2">
                     <xsl:attribute name="style">word-break: keep-all; </xsl:attribute>
                     <xsl:apply-templates select="_sfe:BeforeOrAfterText[1]"/>
                  </xsl:if>
               </td>
               <td>
                  <xsl:if test="$itemlabel-colnum=3">
                     <xsl:attribute name="style">word-break: keep-all; </xsl:attribute>
                     <xsl:apply-templates select="_sfe:BeforeOrAfterText[1]"/>
                  </xsl:if>
                  <!--Process this element's content--><xsl:apply-templates select="node()[name(.)!='_sfe:BeforeOrAfterText']"/>
               </td>
            </tr>
         </tbody>
      </table>
   </xsl:template>

   <!--Gentext template for Context: pbfmatr//list4/l4item-->
<xsl:template match="pbfmatr//list4/l4item" mode="expand-gentext" priority="3">
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
               <span style="text-decoration: underline; ">
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
               </span>
               <xsl:text> </xsl:text>
               <xsl:text> </xsl:text>
            </_sfe:BeforeOrAfterText>
         </xsl:if>
         <xsl:apply-templates select="* | text() | processing-instruction()" mode="expand-gentext"/>
      </xsl:copy>
   </xsl:template>

   <!--Initial pass template for Context: pbfmatr//list4/l4item-->
<xsl:template match="pbfmatr//list4/l4item" mode="initial-pass-mode" priority="3">
      <xsl:copy>
         <xsl:call-template name="maybe-set-gte-id"/>
         <xsl:apply-templates select="@*|node()" mode="initial-pass-mode"/>
      </xsl:copy>
   </xsl:template>

   <!--Numbering template for context=pbfmatr//list4/l4item-->
<xsl:template match="pbfmatr//list4/l4item" mode="styler_numbering" priority="3">
      <xsl:number count="pbfmatr//list4/l4item" format="1"/>
   </xsl:template>

   <!--Set count-as pass template for Context: pbfmatr//list4/l4item-->
<xsl:template match="pbfmatr//list4/l4item" mode="set-countas" priority="3">
      <xsl:copy>
         <xsl:apply-templates select="@*|node()" mode="set-countas"/>
      </xsl:copy>
   </xsl:template>

   <!--LabelAndNumberMarker template-->
<xsl:template match="pbfmatr//list4/l4item" mode="styler-LabelAndNumberMarker" priority="3">
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
   </xsl:template>

   <!--Set ch:chunk template for Context: pbfmatr//list4/l4item-->
<xsl:template match="pbfmatr//list4/l4item" mode="set-ch-chunk" priority="3">
      <xsl:copy>
         <xsl:if test="not(@_gte:did-set-chunk)">
            <xsl:attribute name="_gte:did-set-chunk">yes</xsl:attribute>
         </xsl:if>
         <xsl:apply-templates select="@*|node()" mode="set-ch-chunk"/>
      </xsl:copy>
   </xsl:template>

   <!--Style template for Context: list4/l4item[child::*[1] != 'note']-->
<xsl:template name="__style-for_l4item.5li4lem353">
      <xsl:text> .x-l4item-3-0 {margin-left: 0pt; margin-right: 0pt; text-indent: 0pt; margin-top: 6pt; margin-bottom: 6pt; margin-left: 0pt; text-indent: 0pt; }</xsl:text>
   </xsl:template>

   <!--Template for Context: list4/l4item[child::*[1] != 'note']-->
<xsl:template match="list4/l4item[child::*[1] != 'note']" priority="2">
      <table border="0" cellpadding="0" cellspacing="0">
         <xsl:attribute name="style">
            <xsl:variable name="followWith">emspace</xsl:variable>
            <xsl:if test="$followWith='tab'">table-layout: fixed; </xsl:if>
         </xsl:attribute>
         <!--Emit class values to reflect conditions--><xsl:attribute name="class">
            <xsl:text> x-l4item-3-0</xsl:text> x--zero-left-margins</xsl:attribute>
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
         <xsl:variable name="col1-width">1.5em</xsl:variable>
         <xsl:variable name="col2-width"/>
         <xsl:variable name="col3-width">100%</xsl:variable>
         <xsl:variable name="itemlabel-colnum">1</xsl:variable>
         <xsl:variable name="col2-align">right</xsl:variable>
         <col>
            <xsl:if test="$col1-width!=''">
               <xsl:attribute name="style">
                  <xsl:text>width: </xsl:text>
                  <xsl:value-of select="$col1-width"/>
               </xsl:attribute>
            </xsl:if>
         </col>
         <col>
            <xsl:if test="$col2-width!=''">
               <xsl:attribute name="style">
                  <xsl:text>width: </xsl:text>
                  <xsl:value-of select="$col2-width"/>
               </xsl:attribute>
            </xsl:if>
         </col>
         <col>
            <xsl:if test="$col3-width!=''">
               <xsl:attribute name="style">
                  <xsl:text>width: </xsl:text>
                  <xsl:value-of select="$col3-width"/>
               </xsl:attribute>
            </xsl:if>
         </col>
         <tbody>
            <tr valign="baseline">
               <td align="right">
                  <xsl:if test="$itemlabel-colnum=1">
                     <xsl:attribute name="style">word-break: keep-all; </xsl:attribute>
                     <xsl:apply-templates select="_sfe:BeforeOrAfterText[1]"/>
                  </xsl:if>
               </td>
               <td align="{$col2-align}">
                  <xsl:if test="$itemlabel-colnum=2">
                     <xsl:attribute name="style">word-break: keep-all; </xsl:attribute>
                     <xsl:apply-templates select="_sfe:BeforeOrAfterText[1]"/>
                  </xsl:if>
               </td>
               <td>
                  <xsl:if test="$itemlabel-colnum=3">
                     <xsl:attribute name="style">word-break: keep-all; </xsl:attribute>
                     <xsl:apply-templates select="_sfe:BeforeOrAfterText[1]"/>
                  </xsl:if>
                  <!--Process this element's content--><xsl:apply-templates select="node()[name(.)!='_sfe:BeforeOrAfterText']"/>
               </td>
            </tr>
         </tbody>
      </table>
   </xsl:template>

   <!--Gentext template for Context: list4/l4item[child::*[1] != 'note']-->
<xsl:template match="list4/l4item[child::*[1] != 'note']" mode="expand-gentext" priority="2">
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
               <span style="text-decoration: underline; ">
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
               </span>
               <xsl:text> </xsl:text>
               <xsl:text> </xsl:text>
            </_sfe:BeforeOrAfterText>
         </xsl:if>
         <xsl:apply-templates select="* | text() | processing-instruction()" mode="expand-gentext"/>
      </xsl:copy>
   </xsl:template>

   <!--Initial pass template for Context: list4/l4item[child::*[1] != 'note']-->
<xsl:template match="list4/l4item[child::*[1] != 'note']" mode="initial-pass-mode"
                 priority="2">
      <xsl:copy>
         <xsl:call-template name="maybe-set-gte-id"/>
         <xsl:apply-templates select="@*|node()" mode="initial-pass-mode"/>
      </xsl:copy>
   </xsl:template>

   <!--Numbering template for context=list4/l4item[child::*[1] != 'note']-->
<xsl:template match="list4/l4item[child::*[1] != 'note']" mode="styler_numbering"
                 priority="2">
      <xsl:number count="list4/l4item" format="a"/>
   </xsl:template>

   <!--Set count-as pass template for Context: list4/l4item[child::*[1] != 'note']-->
<xsl:template match="list4/l4item[child::*[1] != 'note']" mode="set-countas" priority="2">
      <xsl:copy>
         <xsl:apply-templates select="@*|node()" mode="set-countas"/>
      </xsl:copy>
   </xsl:template>

   <!--LabelAndNumberMarker template-->
<xsl:template match="list4/l4item[child::*[1] != 'note']" mode="styler-LabelAndNumberMarker"
                 priority="2">
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
   </xsl:template>

   <!--Set ch:chunk template for Context: list4/l4item[child::*[1] != 'note']-->
<xsl:template match="list4/l4item[child::*[1] != 'note']" mode="set-ch-chunk" priority="2">
      <xsl:copy>
         <xsl:if test="not(@_gte:did-set-chunk)">
            <xsl:attribute name="_gte:did-set-chunk">yes</xsl:attribute>
         </xsl:if>
         <xsl:apply-templates select="@*|node()" mode="set-ch-chunk"/>
      </xsl:copy>
   </xsl:template>

   <!--Style template for Context: list4/l4item-->
<xsl:template name="__style-for_l4item.5li4lem124">
      <xsl:text> .x-l4item-4-0 {margin-left: 0pt; margin-right: 0pt; text-indent: 0pt; margin-top: 6pt; margin-bottom: 6pt; margin-left: 0pt; text-indent: 0pt; }</xsl:text>
   </xsl:template>

   <!--Template for Context: list4/l4item-->
<xsl:template match="list4/l4item" priority="1">
      <table border="0" cellpadding="0" cellspacing="0">
         <xsl:attribute name="style">
            <xsl:variable name="followWith">emspace</xsl:variable>
            <xsl:if test="$followWith='tab'">table-layout: fixed; </xsl:if>
         </xsl:attribute>
         <!--Emit class values to reflect conditions--><xsl:attribute name="class">
            <xsl:text> x-l4item-4-0</xsl:text> x--zero-left-margins</xsl:attribute>
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
         <xsl:variable name="col1-width">1.5em</xsl:variable>
         <xsl:variable name="col2-width"/>
         <xsl:variable name="col3-width">100%</xsl:variable>
         <xsl:variable name="itemlabel-colnum">1</xsl:variable>
         <xsl:variable name="col2-align">right</xsl:variable>
         <col>
            <xsl:if test="$col1-width!=''">
               <xsl:attribute name="style">
                  <xsl:text>width: </xsl:text>
                  <xsl:value-of select="$col1-width"/>
               </xsl:attribute>
            </xsl:if>
         </col>
         <col>
            <xsl:if test="$col2-width!=''">
               <xsl:attribute name="style">
                  <xsl:text>width: </xsl:text>
                  <xsl:value-of select="$col2-width"/>
               </xsl:attribute>
            </xsl:if>
         </col>
         <col>
            <xsl:if test="$col3-width!=''">
               <xsl:attribute name="style">
                  <xsl:text>width: </xsl:text>
                  <xsl:value-of select="$col3-width"/>
               </xsl:attribute>
            </xsl:if>
         </col>
         <tbody>
            <tr valign="baseline">
               <td align="right">
                  <xsl:if test="$itemlabel-colnum=1">
                     <xsl:attribute name="style">word-break: keep-all; </xsl:attribute>
                     <xsl:apply-templates select="_sfe:BeforeOrAfterText[1]"/>
                  </xsl:if>
               </td>
               <td align="{$col2-align}">
                  <xsl:if test="$itemlabel-colnum=2">
                     <xsl:attribute name="style">word-break: keep-all; </xsl:attribute>
                     <xsl:apply-templates select="_sfe:BeforeOrAfterText[1]"/>
                  </xsl:if>
               </td>
               <td>
                  <xsl:if test="$itemlabel-colnum=3">
                     <xsl:attribute name="style">word-break: keep-all; </xsl:attribute>
                     <xsl:apply-templates select="_sfe:BeforeOrAfterText[1]"/>
                  </xsl:if>
                  <!--Process this element's content--><xsl:apply-templates select="node()[name(.)!='_sfe:BeforeOrAfterText']"/>
               </td>
            </tr>
         </tbody>
      </table>
   </xsl:template>

   <!--Gentext template for Context: list4/l4item-->
<xsl:template match="list4/l4item" mode="expand-gentext" priority="1">
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
               <span style="text-decoration: underline; ">
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
               </span>
               <xsl:text> </xsl:text>
               <xsl:text> </xsl:text>
            </_sfe:BeforeOrAfterText>
         </xsl:if>
         <xsl:apply-templates select="* | text() | processing-instruction()" mode="expand-gentext"/>
      </xsl:copy>
   </xsl:template>

   <!--Initial pass template for Context: list4/l4item-->
<xsl:template match="list4/l4item" mode="initial-pass-mode" priority="1">
      <xsl:copy>
         <xsl:call-template name="maybe-set-gte-id"/>
         <xsl:apply-templates select="@*|node()" mode="initial-pass-mode"/>
      </xsl:copy>
   </xsl:template>

   <!--Numbering template for context=list4/l4item-->
<xsl:template match="list4/l4item" mode="styler_numbering" priority="1">
      <xsl:number count="list4/l4item" format="a"/>
   </xsl:template>

   <!--Set count-as pass template for Context: list4/l4item-->
<xsl:template match="list4/l4item" mode="set-countas" priority="1">
      <xsl:copy>
         <xsl:apply-templates select="@*|node()" mode="set-countas"/>
      </xsl:copy>
   </xsl:template>

   <!--LabelAndNumberMarker template-->
<xsl:template match="list4/l4item" mode="styler-LabelAndNumberMarker" priority="1">
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
   </xsl:template>

   <!--Set ch:chunk template for Context: list4/l4item-->
<xsl:template match="list4/l4item" mode="set-ch-chunk" priority="1">
      <xsl:copy>
         <xsl:if test="not(@_gte:did-set-chunk)">
            <xsl:attribute name="_gte:did-set-chunk">yes</xsl:attribute>
         </xsl:if>
         <xsl:apply-templates select="@*|node()" mode="set-ch-chunk"/>
      </xsl:copy>
   </xsl:template>

   <!--Style template for Context: l4item-->
<xsl:template name="__style-for_l4item.5l4emem65">
      <xsl:text> .x-l4item-5-0 {margin-left: 0pt; margin-right: 0pt; text-indent: 0pt; margin-top: 6pt; margin-bottom: 6pt; margin-left: 0pt; text-indent: 0pt; }</xsl:text>
   </xsl:template>

   <!--Template for Context: l4item-->
<xsl:template match="l4item" priority="0">
      <table border="0" cellpadding="0" cellspacing="0">
         <xsl:attribute name="style">
            <xsl:variable name="followWith"/>
            <xsl:if test="$followWith='tab'">table-layout: fixed; </xsl:if>
         </xsl:attribute>
         <!--Emit class values to reflect conditions--><xsl:attribute name="class">
            <xsl:text> x-l4item-5-0</xsl:text> x--zero-left-margins</xsl:attribute>
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
         <xsl:variable name="col1-width">0pt</xsl:variable>
         <xsl:variable name="col2-width">0pt</xsl:variable>
         <xsl:variable name="col3-width"/>
         <xsl:variable name="itemlabel-colnum">3</xsl:variable>
         <xsl:variable name="col2-align">center</xsl:variable>
         <col>
            <xsl:if test="$col1-width!=''">
               <xsl:attribute name="style">
                  <xsl:text>width: </xsl:text>
                  <xsl:value-of select="$col1-width"/>
               </xsl:attribute>
            </xsl:if>
         </col>
         <col>
            <xsl:if test="$col2-width!=''">
               <xsl:attribute name="style">
                  <xsl:text>width: </xsl:text>
                  <xsl:value-of select="$col2-width"/>
               </xsl:attribute>
            </xsl:if>
         </col>
         <col>
            <xsl:if test="$col3-width!=''">
               <xsl:attribute name="style">
                  <xsl:text>width: </xsl:text>
                  <xsl:value-of select="$col3-width"/>
               </xsl:attribute>
            </xsl:if>
         </col>
         <tbody>
            <tr valign="baseline">
               <td align="right">
                  <xsl:if test="$itemlabel-colnum=1">
                     <xsl:attribute name="style">word-break: keep-all; </xsl:attribute>
                  </xsl:if>
               </td>
               <td align="{$col2-align}">
                  <xsl:if test="$itemlabel-colnum=2">
                     <xsl:attribute name="style">word-break: keep-all; </xsl:attribute>
                  </xsl:if>
               </td>
               <td>
                  <xsl:if test="$itemlabel-colnum=3">
                     <xsl:attribute name="style">word-break: keep-all; </xsl:attribute>
                  </xsl:if>
                  <!--Process this element's content--><xsl:apply-templates select="node()[name(.)!='_sfe:BeforeOrAfterText']"/>
               </td>
            </tr>
         </tbody>
      </table>
   </xsl:template>

   <!--Gentext template for Context: l4item-->
<xsl:template match="l4item" mode="expand-gentext" priority="0">
      <xsl:copy>
         <xsl:apply-templates select="@*|node()" mode="expand-gentext"/>
      </xsl:copy>
   </xsl:template>

   <!--Initial pass template for Context: l4item-->
<xsl:template match="l4item" mode="initial-pass-mode" priority="0">
      <xsl:copy>
         <xsl:call-template name="maybe-set-gte-id"/>
         <xsl:apply-templates select="@*|node()" mode="initial-pass-mode"/>
      </xsl:copy>
   </xsl:template>

   <!--Set count-as pass template for Context: l4item-->
<xsl:template match="l4item" mode="set-countas" priority="0">
      <xsl:copy>
         <xsl:apply-templates select="@*|node()" mode="set-countas"/>
      </xsl:copy>
   </xsl:template>

   <!--Set ch:chunk template for Context: l4item-->
<xsl:template match="l4item" mode="set-ch-chunk" priority="0">
      <xsl:copy>
         <xsl:if test="not(@_gte:did-set-chunk)">
            <xsl:attribute name="_gte:did-set-chunk">yes</xsl:attribute>
         </xsl:if>
         <xsl:apply-templates select="@*|node()" mode="set-ch-chunk"/>
      </xsl:copy>
   </xsl:template>

   <!--Style template for Context: l5item-->
<xsl:template name="__style-for_l5item.1">
      <xsl:text> .x-l5item-1-0 {margin-left: 0pt; margin-right: 0pt; }</xsl:text>
   </xsl:template>

   <!--Template for Context: l5item-->
<xsl:template match="l5item" priority="0"><!--Emit a nostyle template--><xsl:apply-templates/>
   </xsl:template>

   <!--Gentext template for Context: l5item-->
<xsl:template match="l5item" mode="expand-gentext" priority="0">
      <xsl:copy>
         <xsl:apply-templates select="@*|node()" mode="expand-gentext"/>
      </xsl:copy>
   </xsl:template>

   <!--Initial pass template for Context: l5item-->
<xsl:template match="l5item" mode="initial-pass-mode" priority="0">
      <xsl:copy>
         <xsl:call-template name="maybe-set-gte-id"/>
         <xsl:apply-templates select="@*|node()" mode="initial-pass-mode"/>
      </xsl:copy>
   </xsl:template>

   <!--Set count-as pass template for Context: l5item-->
<xsl:template match="l5item" mode="set-countas" priority="0">
      <xsl:copy>
         <xsl:apply-templates select="@*|node()" mode="set-countas"/>
      </xsl:copy>
   </xsl:template>

   <!--Set ch:chunk template for Context: l5item-->
<xsl:template match="l5item" mode="set-ch-chunk" priority="0">
      <xsl:copy>
         <xsl:if test="not(@_gte:did-set-chunk)">
            <xsl:attribute name="_gte:did-set-chunk">yes</xsl:attribute>
         </xsl:if>
         <xsl:apply-templates select="@*|node()" mode="set-ch-chunk"/>
      </xsl:copy>
   </xsl:template>

   <!--Style template for Context: l6item-->
<xsl:template name="__style-for_l6item.1">
      <xsl:text> .x-l6item-1-0 {margin-left: 0pt; margin-right: 0pt; }</xsl:text>
   </xsl:template>

   <!--Template for Context: l6item-->
<xsl:template match="l6item" priority="0"><!--Emit a nostyle template--><xsl:apply-templates/>
   </xsl:template>

   <!--Gentext template for Context: l6item-->
<xsl:template match="l6item" mode="expand-gentext" priority="0">
      <xsl:copy>
         <xsl:apply-templates select="@*|node()" mode="expand-gentext"/>
      </xsl:copy>
   </xsl:template>

   <!--Initial pass template for Context: l6item-->
<xsl:template match="l6item" mode="initial-pass-mode" priority="0">
      <xsl:copy>
         <xsl:call-template name="maybe-set-gte-id"/>
         <xsl:apply-templates select="@*|node()" mode="initial-pass-mode"/>
      </xsl:copy>
   </xsl:template>

   <!--Set count-as pass template for Context: l6item-->
<xsl:template match="l6item" mode="set-countas" priority="0">
      <xsl:copy>
         <xsl:apply-templates select="@*|node()" mode="set-countas"/>
      </xsl:copy>
   </xsl:template>

   <!--Set ch:chunk template for Context: l6item-->
<xsl:template match="l6item" mode="set-ch-chunk" priority="0">
      <xsl:copy>
         <xsl:if test="not(@_gte:did-set-chunk)">
            <xsl:attribute name="_gte:did-set-chunk">yes</xsl:attribute>
         </xsl:if>
         <xsl:apply-templates select="@*|node()" mode="set-ch-chunk"/>
      </xsl:copy>
   </xsl:template>

   <!--Style template for Context: l7item-->
<xsl:template name="__style-for_l7item.1">
      <xsl:text> .x-l7item-1-0 {margin-left: 0pt; margin-right: 0pt; }</xsl:text>
   </xsl:template>

   <!--Template for Context: l7item-->
<xsl:template match="l7item" priority="0"><!--Emit a nostyle template--><xsl:apply-templates/>
   </xsl:template>

   <!--Gentext template for Context: l7item-->
<xsl:template match="l7item" mode="expand-gentext" priority="0">
      <xsl:copy>
         <xsl:apply-templates select="@*|node()" mode="expand-gentext"/>
      </xsl:copy>
   </xsl:template>

   <!--Initial pass template for Context: l7item-->
<xsl:template match="l7item" mode="initial-pass-mode" priority="0">
      <xsl:copy>
         <xsl:call-template name="maybe-set-gte-id"/>
         <xsl:apply-templates select="@*|node()" mode="initial-pass-mode"/>
      </xsl:copy>
   </xsl:template>

   <!--Set count-as pass template for Context: l7item-->
<xsl:template match="l7item" mode="set-countas" priority="0">
      <xsl:copy>
         <xsl:apply-templates select="@*|node()" mode="set-countas"/>
      </xsl:copy>
   </xsl:template>

   <!--Set ch:chunk template for Context: l7item-->
<xsl:template match="l7item" mode="set-ch-chunk" priority="0">
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

   <!--Style template for Context: list1-->
<xsl:template name="__style-for_list1.1">
      <xsl:text> .x-list1-1-0 {margin-left: 0pt; margin-right: 0pt; text-indent: 0pt; margin-top: 8pt; margin-left: 18pt; text-indent: 0pt; }</xsl:text>
   </xsl:template>

   <!--Template for Context: list1-->
<xsl:template match="list1" priority="0">
      <div><!--Emit class values to reflect conditions--><xsl:attribute name="class">
            <xsl:text> x-list1-1-0</xsl:text>
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

   <!--Gentext template for Context: list1-->
<xsl:template match="list1" mode="expand-gentext" priority="0">
      <xsl:copy>
         <xsl:apply-templates select="@*|node()" mode="expand-gentext"/>
      </xsl:copy>
   </xsl:template>

   <!--Initial pass template for Context: list1-->
<xsl:template match="list1" mode="initial-pass-mode" priority="0">
      <xsl:copy>
         <xsl:call-template name="maybe-set-gte-id"/>
         <xsl:apply-templates select="@*|node()" mode="initial-pass-mode"/>
      </xsl:copy>
   </xsl:template>

   <!--Set count-as pass template for Context: list1-->
<xsl:template match="list1" mode="set-countas" priority="0">
      <xsl:copy>
         <xsl:apply-templates select="@*|node()" mode="set-countas"/>
      </xsl:copy>
   </xsl:template>

   <!--Set ch:chunk template for Context: list1-->
<xsl:template match="list1" mode="set-ch-chunk" priority="0">
      <xsl:copy>
         <xsl:if test="not(@_gte:did-set-chunk)">
            <xsl:attribute name="_gte:did-set-chunk">yes</xsl:attribute>
         </xsl:if>
         <xsl:apply-templates select="@*|node()" mode="set-ch-chunk"/>
      </xsl:copy>
   </xsl:template>

   <!--Style template for Context: list2-->
<xsl:template name="__style-for_list2.1">
      <xsl:text> .x-list2-1-0 {margin-left: 0pt; margin-right: 0pt; text-indent: 0pt; margin-top: 8pt; }</xsl:text>
   </xsl:template>

   <!--Template for Context: list2-->
<xsl:template match="list2" priority="0">
      <div><!--Emit class values to reflect conditions--><xsl:attribute name="class">
            <xsl:text> x-list2-1-0</xsl:text>
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

   <!--Gentext template for Context: list2-->
<xsl:template match="list2" mode="expand-gentext" priority="0">
      <xsl:copy>
         <xsl:apply-templates select="@*|node()" mode="expand-gentext"/>
      </xsl:copy>
   </xsl:template>

   <!--Initial pass template for Context: list2-->
<xsl:template match="list2" mode="initial-pass-mode" priority="0">
      <xsl:copy>
         <xsl:call-template name="maybe-set-gte-id"/>
         <xsl:apply-templates select="@*|node()" mode="initial-pass-mode"/>
      </xsl:copy>
   </xsl:template>

   <!--Set count-as pass template for Context: list2-->
<xsl:template match="list2" mode="set-countas" priority="0">
      <xsl:copy>
         <xsl:apply-templates select="@*|node()" mode="set-countas"/>
      </xsl:copy>
   </xsl:template>

   <!--Set ch:chunk template for Context: list2-->
<xsl:template match="list2" mode="set-ch-chunk" priority="0">
      <xsl:copy>
         <xsl:if test="not(@_gte:did-set-chunk)">
            <xsl:attribute name="_gte:did-set-chunk">yes</xsl:attribute>
         </xsl:if>
         <xsl:apply-templates select="@*|node()" mode="set-ch-chunk"/>
      </xsl:copy>
   </xsl:template>

   <!--Style template for Context: list3-->
<xsl:template name="__style-for_list3.1">
      <xsl:text> .x-list3-1-0 {margin-left: 0pt; margin-right: 0pt; text-indent: 0pt; margin-top: 8pt; }</xsl:text>
   </xsl:template>

   <!--Template for Context: list3-->
<xsl:template match="list3" priority="0">
      <div><!--Emit class values to reflect conditions--><xsl:attribute name="class">
            <xsl:text> x-list3-1-0</xsl:text>
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

   <!--Gentext template for Context: list3-->
<xsl:template match="list3" mode="expand-gentext" priority="0">
      <xsl:copy>
         <xsl:apply-templates select="@*|node()" mode="expand-gentext"/>
      </xsl:copy>
   </xsl:template>

   <!--Initial pass template for Context: list3-->
<xsl:template match="list3" mode="initial-pass-mode" priority="0">
      <xsl:copy>
         <xsl:call-template name="maybe-set-gte-id"/>
         <xsl:apply-templates select="@*|node()" mode="initial-pass-mode"/>
      </xsl:copy>
   </xsl:template>

   <!--Set count-as pass template for Context: list3-->
<xsl:template match="list3" mode="set-countas" priority="0">
      <xsl:copy>
         <xsl:apply-templates select="@*|node()" mode="set-countas"/>
      </xsl:copy>
   </xsl:template>

   <!--Set ch:chunk template for Context: list3-->
<xsl:template match="list3" mode="set-ch-chunk" priority="0">
      <xsl:copy>
         <xsl:if test="not(@_gte:did-set-chunk)">
            <xsl:attribute name="_gte:did-set-chunk">yes</xsl:attribute>
         </xsl:if>
         <xsl:apply-templates select="@*|node()" mode="set-ch-chunk"/>
      </xsl:copy>
   </xsl:template>

   <!--Style template for Context: list4-->
<xsl:template name="__style-for_list4.1">
      <xsl:text> .x-list4-1-0 {margin-left: 0pt; margin-right: 0pt; text-indent: 0pt; margin-top: 8pt; }</xsl:text>
   </xsl:template>

   <!--Template for Context: list4-->
<xsl:template match="list4" priority="0">
      <div><!--Emit class values to reflect conditions--><xsl:attribute name="class">
            <xsl:text> x-list4-1-0</xsl:text>
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

   <!--Gentext template for Context: list4-->
<xsl:template match="list4" mode="expand-gentext" priority="0">
      <xsl:copy>
         <xsl:apply-templates select="@*|node()" mode="expand-gentext"/>
      </xsl:copy>
   </xsl:template>

   <!--Initial pass template for Context: list4-->
<xsl:template match="list4" mode="initial-pass-mode" priority="0">
      <xsl:copy>
         <xsl:call-template name="maybe-set-gte-id"/>
         <xsl:apply-templates select="@*|node()" mode="initial-pass-mode"/>
      </xsl:copy>
   </xsl:template>

   <!--Set count-as pass template for Context: list4-->
<xsl:template match="list4" mode="set-countas" priority="0">
      <xsl:copy>
         <xsl:apply-templates select="@*|node()" mode="set-countas"/>
      </xsl:copy>
   </xsl:template>

   <!--Set ch:chunk template for Context: list4-->
<xsl:template match="list4" mode="set-ch-chunk" priority="0">
      <xsl:copy>
         <xsl:if test="not(@_gte:did-set-chunk)">
            <xsl:attribute name="_gte:did-set-chunk">yes</xsl:attribute>
         </xsl:if>
         <xsl:apply-templates select="@*|node()" mode="set-ch-chunk"/>
      </xsl:copy>
   </xsl:template>

   <!--Style template for Context: list5-->
<xsl:template name="__style-for_list5.1">
      <xsl:text> .x-list5-1-0 {margin-left: 0pt; margin-right: 0pt; }</xsl:text>
   </xsl:template>

   <!--Template for Context: list5-->
<xsl:template match="list5" priority="0"><!--Emit a nostyle template--><xsl:apply-templates/>
   </xsl:template>

   <!--Gentext template for Context: list5-->
<xsl:template match="list5" mode="expand-gentext" priority="0">
      <xsl:copy>
         <xsl:apply-templates select="@*|node()" mode="expand-gentext"/>
      </xsl:copy>
   </xsl:template>

   <!--Initial pass template for Context: list5-->
<xsl:template match="list5" mode="initial-pass-mode" priority="0">
      <xsl:copy>
         <xsl:call-template name="maybe-set-gte-id"/>
         <xsl:apply-templates select="@*|node()" mode="initial-pass-mode"/>
      </xsl:copy>
   </xsl:template>

   <!--Set count-as pass template for Context: list5-->
<xsl:template match="list5" mode="set-countas" priority="0">
      <xsl:copy>
         <xsl:apply-templates select="@*|node()" mode="set-countas"/>
      </xsl:copy>
   </xsl:template>

   <!--Set ch:chunk template for Context: list5-->
<xsl:template match="list5" mode="set-ch-chunk" priority="0">
      <xsl:copy>
         <xsl:if test="not(@_gte:did-set-chunk)">
            <xsl:attribute name="_gte:did-set-chunk">yes</xsl:attribute>
         </xsl:if>
         <xsl:apply-templates select="@*|node()" mode="set-ch-chunk"/>
      </xsl:copy>
   </xsl:template>

   <!--Style template for Context: list6-->
<xsl:template name="__style-for_list6.1">
      <xsl:text> .x-list6-1-0 {margin-left: 0pt; margin-right: 0pt; }</xsl:text>
   </xsl:template>

   <!--Template for Context: list6-->
<xsl:template match="list6" priority="0"><!--Emit a nostyle template--><xsl:apply-templates/>
   </xsl:template>

   <!--Gentext template for Context: list6-->
<xsl:template match="list6" mode="expand-gentext" priority="0">
      <xsl:copy>
         <xsl:apply-templates select="@*|node()" mode="expand-gentext"/>
      </xsl:copy>
   </xsl:template>

   <!--Initial pass template for Context: list6-->
<xsl:template match="list6" mode="initial-pass-mode" priority="0">
      <xsl:copy>
         <xsl:call-template name="maybe-set-gte-id"/>
         <xsl:apply-templates select="@*|node()" mode="initial-pass-mode"/>
      </xsl:copy>
   </xsl:template>

   <!--Set count-as pass template for Context: list6-->
<xsl:template match="list6" mode="set-countas" priority="0">
      <xsl:copy>
         <xsl:apply-templates select="@*|node()" mode="set-countas"/>
      </xsl:copy>
   </xsl:template>

   <!--Set ch:chunk template for Context: list6-->
<xsl:template match="list6" mode="set-ch-chunk" priority="0">
      <xsl:copy>
         <xsl:if test="not(@_gte:did-set-chunk)">
            <xsl:attribute name="_gte:did-set-chunk">yes</xsl:attribute>
         </xsl:if>
         <xsl:apply-templates select="@*|node()" mode="set-ch-chunk"/>
      </xsl:copy>
   </xsl:template>

   <!--Style template for Context: list7-->
<xsl:template name="__style-for_list7.1">
      <xsl:text> .x-list7-1-0 {margin-left: 0pt; margin-right: 0pt; }</xsl:text>
   </xsl:template>

   <!--Template for Context: list7-->
<xsl:template match="list7" priority="0"><!--Emit a nostyle template--><xsl:apply-templates/>
   </xsl:template>

   <!--Gentext template for Context: list7-->
<xsl:template match="list7" mode="expand-gentext" priority="0">
      <xsl:copy>
         <xsl:apply-templates select="@*|node()" mode="expand-gentext"/>
      </xsl:copy>
   </xsl:template>

   <!--Initial pass template for Context: list7-->
<xsl:template match="list7" mode="initial-pass-mode" priority="0">
      <xsl:copy>
         <xsl:call-template name="maybe-set-gte-id"/>
         <xsl:apply-templates select="@*|node()" mode="initial-pass-mode"/>
      </xsl:copy>
   </xsl:template>

   <!--Set count-as pass template for Context: list7-->
<xsl:template match="list7" mode="set-countas" priority="0">
      <xsl:copy>
         <xsl:apply-templates select="@*|node()" mode="set-countas"/>
      </xsl:copy>
   </xsl:template>

   <!--Set ch:chunk template for Context: list7-->
<xsl:template match="list7" mode="set-ch-chunk" priority="0">
      <xsl:copy>
         <xsl:if test="not(@_gte:did-set-chunk)">
            <xsl:attribute name="_gte:did-set-chunk">yes</xsl:attribute>
         </xsl:if>
         <xsl:apply-templates select="@*|node()" mode="set-ch-chunk"/>
      </xsl:copy>
   </xsl:template>

   <!--Style template for Context: lmm-statement-->
<xsl:template name="__style-for_lmm-statement.1">
      <xsl:text> .x-lmm-statement-1-0 {margin-left: 0pt; margin-right: 0pt; text-indent: 0pt; font-size: 10pt; text-align: justify; margin-top: 10pt; margin-bottom: 10pt; }</xsl:text>
   </xsl:template>

   <!--Template for Context: lmm-statement-->
<xsl:template match="lmm-statement" priority="0">
      <div><!--Emit class values to reflect conditions--><xsl:attribute name="class">
            <xsl:text> x-lmm-statement-1-0</xsl:text>
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

   <!--Gentext template for Context: lmm-statement-->
<xsl:template match="lmm-statement" mode="expand-gentext" priority="0">
      <xsl:copy>
         <xsl:apply-templates select="@*|node()" mode="expand-gentext"/>
      </xsl:copy>
   </xsl:template>

   <!--Initial pass template for Context: lmm-statement-->
<xsl:template match="lmm-statement" mode="initial-pass-mode" priority="0">
      <xsl:copy>
         <xsl:call-template name="maybe-set-gte-id"/>
         <xsl:apply-templates select="@*|node()" mode="initial-pass-mode"/>
      </xsl:copy>
   </xsl:template>

   <!--Set count-as pass template for Context: lmm-statement-->
<xsl:template match="lmm-statement" mode="set-countas" priority="0">
      <xsl:copy>
         <xsl:apply-templates select="@*|node()" mode="set-countas"/>
      </xsl:copy>
   </xsl:template>

   <!--Set ch:chunk template for Context: lmm-statement-->
<xsl:template match="lmm-statement" mode="set-ch-chunk" priority="0">
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

   <!--Style template for Context: mfmatr-->
<xsl:template name="__style-for_mfmatr.1">
      <xsl:text> .x-mfmatr-1-0 {margin-left: 0pt; margin-right: 0pt; text-indent: 0pt; }</xsl:text>
   </xsl:template>

   <!--Template for Context: mfmatr-->
<xsl:template match="mfmatr" priority="0">
      <div><!--Emit class values to reflect conditions--><xsl:attribute name="class">
            <xsl:text> x-mfmatr-1-0</xsl:text>
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

   <!--Gentext template for Context: mfmatr-->
<xsl:template match="mfmatr" mode="expand-gentext" priority="0">
      <xsl:copy>
         <xsl:apply-templates select="@*|node()" mode="expand-gentext"/>
      </xsl:copy>
   </xsl:template>

   <!--Initial pass template for Context: mfmatr-->
<xsl:template match="mfmatr" mode="initial-pass-mode" priority="0">
      <xsl:copy>
         <xsl:call-template name="maybe-set-gte-id"/>
         <xsl:apply-templates select="@*|node()" mode="initial-pass-mode"/>
      </xsl:copy>
   </xsl:template>

   <!--Set count-as pass template for Context: mfmatr-->
<xsl:template match="mfmatr" mode="set-countas" priority="0">
      <xsl:copy>
         <xsl:apply-templates select="@*|node()" mode="set-countas"/>
      </xsl:copy>
   </xsl:template>

   <!--Set ch:chunk template for Context: mfmatr-->
<xsl:template match="mfmatr" mode="set-ch-chunk" priority="0">
      <xsl:copy>
         <xsl:if test="not(@_gte:did-set-chunk)">
            <xsl:attribute name="_gte:did-set-chunk">yes</xsl:attribute>
         </xsl:if>
         <xsl:apply-templates select="@*|node()" mode="set-ch-chunk"/>
      </xsl:copy>
   </xsl:template>

   <!--Style template for Context: ncon-->
<xsl:template name="__style-for_ncon.1">
      <xsl:text> .x-ncon-1-0 {margin-left: 0pt; margin-right: 0pt; }</xsl:text>
   </xsl:template>

   <!--Template for Context: ncon-->
<xsl:template match="ncon" priority="0">
      <span><!--Emit class values to reflect conditions--><xsl:attribute name="class">
            <xsl:text> x-ncon-1-0</xsl:text>
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

   <!--Gentext template for Context: ncon-->
<xsl:template match="ncon" mode="expand-gentext" priority="0">
      <xsl:copy>
         <xsl:apply-templates select="@*|node()" mode="expand-gentext"/>
      </xsl:copy>
   </xsl:template>

   <!--Initial pass template for Context: ncon-->
<xsl:template match="ncon" mode="initial-pass-mode" priority="0">
      <xsl:copy>
         <xsl:call-template name="maybe-set-gte-id"/>
         <xsl:apply-templates select="@*|node()" mode="initial-pass-mode"/>
      </xsl:copy>
   </xsl:template>

   <!--Set count-as pass template for Context: ncon-->
<xsl:template match="ncon" mode="set-countas" priority="0">
      <xsl:copy>
         <xsl:apply-templates select="@*|node()" mode="set-countas"/>
      </xsl:copy>
   </xsl:template>

   <!--Set ch:chunk template for Context: ncon-->
<xsl:template match="ncon" mode="set-ch-chunk" priority="0">
      <xsl:copy>
         <xsl:if test="not(@_gte:did-set-chunk)">
            <xsl:attribute name="_gte:did-set-chunk">yes</xsl:attribute>
         </xsl:if>
         <xsl:apply-templates select="@*|node()" mode="set-ch-chunk"/>
      </xsl:copy>
   </xsl:template>

   <!--Style template for Context: numlist-->
<xsl:template name="__style-for_numlist.1">
      <xsl:text> .x-numlist-1-0 {margin-left: 0pt; margin-right: 0pt; text-indent: 0pt; margin-top: 8pt; margin-left: 18pt; text-indent: 0pt; }</xsl:text>
   </xsl:template>

   <!--Template for Context: numlist-->
<xsl:template match="numlist" priority="0">
      <div><!--Emit class values to reflect conditions--><xsl:attribute name="class">
            <xsl:text> x-numlist-1-0</xsl:text>
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

   <!--Gentext template for Context: numlist-->
<xsl:template match="numlist" mode="expand-gentext" priority="0">
      <xsl:copy>
         <xsl:apply-templates select="@*|node()" mode="expand-gentext"/>
      </xsl:copy>
   </xsl:template>

   <!--Initial pass template for Context: numlist-->
<xsl:template match="numlist" mode="initial-pass-mode" priority="0">
      <xsl:copy>
         <xsl:call-template name="maybe-set-gte-id"/>
         <xsl:apply-templates select="@*|node()" mode="initial-pass-mode"/>
      </xsl:copy>
   </xsl:template>

   <!--Set count-as pass template for Context: numlist-->
<xsl:template match="numlist" mode="set-countas" priority="0">
      <xsl:copy>
         <xsl:apply-templates select="@*|node()" mode="set-countas"/>
      </xsl:copy>
   </xsl:template>

   <!--Set ch:chunk template for Context: numlist-->
<xsl:template match="numlist" mode="set-ch-chunk" priority="0">
      <xsl:copy>
         <xsl:if test="not(@_gte:did-set-chunk)">
            <xsl:attribute name="_gte:did-set-chunk">yes</xsl:attribute>
         </xsl:if>
         <xsl:apply-templates select="@*|node()" mode="set-ch-chunk"/>
      </xsl:copy>
   </xsl:template>

   <!--Style template for Context: numlist/numlitem-->
<xsl:template name="__style-for_numlitem.2nuisem161">
      <xsl:text> .x-numlitem-1-0 {margin-left: 0pt; margin-right: 0pt; text-indent: 0pt; margin-top: 6pt; margin-bottom: 6pt; margin-left: 0pt; text-indent: 0pt; }</xsl:text>
   </xsl:template>

   <!--Template for Context: numlist/numlitem-->
<xsl:template match="numlist/numlitem" priority="1">
      <table border="0" cellpadding="0" cellspacing="0">
         <xsl:attribute name="style">
            <xsl:variable name="followWith">emspace</xsl:variable>
            <xsl:if test="$followWith='tab'">table-layout: fixed; </xsl:if>
         </xsl:attribute>
         <!--Emit class values to reflect conditions--><xsl:attribute name="class">
            <xsl:text> x-numlitem-1-0</xsl:text> x--zero-left-margins</xsl:attribute>
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
         <xsl:variable name="col1-width">1.5em</xsl:variable>
         <xsl:variable name="col2-width"/>
         <xsl:variable name="col3-width">100%</xsl:variable>
         <xsl:variable name="itemlabel-colnum">1</xsl:variable>
         <xsl:variable name="col2-align">right</xsl:variable>
         <col>
            <xsl:if test="$col1-width!=''">
               <xsl:attribute name="style">
                  <xsl:text>width: </xsl:text>
                  <xsl:value-of select="$col1-width"/>
               </xsl:attribute>
            </xsl:if>
         </col>
         <col>
            <xsl:if test="$col2-width!=''">
               <xsl:attribute name="style">
                  <xsl:text>width: </xsl:text>
                  <xsl:value-of select="$col2-width"/>
               </xsl:attribute>
            </xsl:if>
         </col>
         <col>
            <xsl:if test="$col3-width!=''">
               <xsl:attribute name="style">
                  <xsl:text>width: </xsl:text>
                  <xsl:value-of select="$col3-width"/>
               </xsl:attribute>
            </xsl:if>
         </col>
         <tbody>
            <tr valign="baseline">
               <td align="right">
                  <xsl:if test="$itemlabel-colnum=1">
                     <xsl:attribute name="style">word-break: keep-all; </xsl:attribute>
                     <xsl:apply-templates select="_sfe:BeforeOrAfterText[1]"/>
                  </xsl:if>
               </td>
               <td align="{$col2-align}">
                  <xsl:if test="$itemlabel-colnum=2">
                     <xsl:attribute name="style">word-break: keep-all; </xsl:attribute>
                     <xsl:apply-templates select="_sfe:BeforeOrAfterText[1]"/>
                  </xsl:if>
               </td>
               <td>
                  <xsl:if test="$itemlabel-colnum=3">
                     <xsl:attribute name="style">word-break: keep-all; </xsl:attribute>
                     <xsl:apply-templates select="_sfe:BeforeOrAfterText[1]"/>
                  </xsl:if>
                  <!--Process this element's content--><xsl:apply-templates select="node()[name(.)!='_sfe:BeforeOrAfterText']"/>
               </td>
            </tr>
         </tbody>
      </table>
   </xsl:template>

   <!--Gentext template for Context: numlist/numlitem-->
<xsl:template match="numlist/numlitem" mode="expand-gentext" priority="1">
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
               <xsl:text> </xsl:text>
            </_sfe:BeforeOrAfterText>
         </xsl:if>
         <xsl:apply-templates select="* | text() | processing-instruction()" mode="expand-gentext"/>
      </xsl:copy>
   </xsl:template>

   <!--Initial pass template for Context: numlist/numlitem-->
<xsl:template match="numlist/numlitem" mode="initial-pass-mode" priority="1">
      <xsl:copy>
         <xsl:call-template name="maybe-set-gte-id"/>
         <xsl:apply-templates select="@*|node()" mode="initial-pass-mode"/>
      </xsl:copy>
   </xsl:template>

   <!--Numbering template for context=numlist/numlitem-->
<xsl:template match="numlist/numlitem" mode="styler_numbering" priority="1">
      <xsl:number count="numlist/numlitem" format="1"/>
      <xsl:text>.</xsl:text>
   </xsl:template>

   <!--Set count-as pass template for Context: numlist/numlitem-->
<xsl:template match="numlist/numlitem" mode="set-countas" priority="1">
      <xsl:copy>
         <xsl:apply-templates select="@*|node()" mode="set-countas"/>
      </xsl:copy>
   </xsl:template>

   <!--LabelAndNumberMarker template-->
<xsl:template match="numlist/numlitem" mode="styler-LabelAndNumberMarker" priority="1">
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
   </xsl:template>

   <!--Set ch:chunk template for Context: numlist/numlitem-->
<xsl:template match="numlist/numlitem" mode="set-ch-chunk" priority="1">
      <xsl:copy>
         <xsl:if test="not(@_gte:did-set-chunk)">
            <xsl:attribute name="_gte:did-set-chunk">yes</xsl:attribute>
         </xsl:if>
         <xsl:apply-templates select="@*|node()" mode="set-ch-chunk"/>
      </xsl:copy>
   </xsl:template>

   <!--Style template for Context: numlitem-->
<xsl:template name="__style-for_numlitem.2nuitem82">
      <xsl:text> .x-numlitem-2-0 {margin-left: 0pt; margin-right: 0pt; text-indent: 0pt; margin-top: 6pt; margin-bottom: 6pt; margin-left: 0pt; text-indent: 0pt; }</xsl:text>
   </xsl:template>

   <!--Template for Context: numlitem-->
<xsl:template match="numlitem" priority="0">
      <table border="0" cellpadding="0" cellspacing="0">
         <xsl:attribute name="style">
            <xsl:variable name="followWith"/>
            <xsl:if test="$followWith='tab'">table-layout: fixed; </xsl:if>
         </xsl:attribute>
         <!--Emit class values to reflect conditions--><xsl:attribute name="class">
            <xsl:text> x-numlitem-2-0</xsl:text> x--zero-left-margins</xsl:attribute>
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
         <xsl:variable name="col1-width">0pt</xsl:variable>
         <xsl:variable name="col2-width">0pt</xsl:variable>
         <xsl:variable name="col3-width"/>
         <xsl:variable name="itemlabel-colnum">3</xsl:variable>
         <xsl:variable name="col2-align">center</xsl:variable>
         <col>
            <xsl:if test="$col1-width!=''">
               <xsl:attribute name="style">
                  <xsl:text>width: </xsl:text>
                  <xsl:value-of select="$col1-width"/>
               </xsl:attribute>
            </xsl:if>
         </col>
         <col>
            <xsl:if test="$col2-width!=''">
               <xsl:attribute name="style">
                  <xsl:text>width: </xsl:text>
                  <xsl:value-of select="$col2-width"/>
               </xsl:attribute>
            </xsl:if>
         </col>
         <col>
            <xsl:if test="$col3-width!=''">
               <xsl:attribute name="style">
                  <xsl:text>width: </xsl:text>
                  <xsl:value-of select="$col3-width"/>
               </xsl:attribute>
            </xsl:if>
         </col>
         <tbody>
            <tr valign="baseline">
               <td align="right">
                  <xsl:if test="$itemlabel-colnum=1">
                     <xsl:attribute name="style">word-break: keep-all; </xsl:attribute>
                  </xsl:if>
               </td>
               <td align="{$col2-align}">
                  <xsl:if test="$itemlabel-colnum=2">
                     <xsl:attribute name="style">word-break: keep-all; </xsl:attribute>
                  </xsl:if>
               </td>
               <td>
                  <xsl:if test="$itemlabel-colnum=3">
                     <xsl:attribute name="style">word-break: keep-all; </xsl:attribute>
                  </xsl:if>
                  <!--Process this element's content--><xsl:apply-templates select="node()[name(.)!='_sfe:BeforeOrAfterText']"/>
               </td>
            </tr>
         </tbody>
      </table>
   </xsl:template>

   <!--Gentext template for Context: numlitem-->
<xsl:template match="numlitem" mode="expand-gentext" priority="0">
      <xsl:copy>
         <xsl:apply-templates select="@*|node()" mode="expand-gentext"/>
      </xsl:copy>
   </xsl:template>

   <!--Initial pass template for Context: numlitem-->
<xsl:template match="numlitem" mode="initial-pass-mode" priority="0">
      <xsl:copy>
         <xsl:call-template name="maybe-set-gte-id"/>
         <xsl:apply-templates select="@*|node()" mode="initial-pass-mode"/>
      </xsl:copy>
   </xsl:template>

   <!--Set count-as pass template for Context: numlitem-->
<xsl:template match="numlitem" mode="set-countas" priority="0">
      <xsl:copy>
         <xsl:apply-templates select="@*|node()" mode="set-countas"/>
      </xsl:copy>
   </xsl:template>

   <!--Set ch:chunk template for Context: numlitem-->
<xsl:template match="numlitem" mode="set-ch-chunk" priority="0">
      <xsl:copy>
         <xsl:if test="not(@_gte:did-set-chunk)">
            <xsl:attribute name="_gte:did-set-chunk">yes</xsl:attribute>
         </xsl:if>
         <xsl:apply-templates select="@*|node()" mode="set-ch-chunk"/>
      </xsl:copy>
   </xsl:template>

   <!--Style template for Context: frontmatter//module/pageblock-title-->
<xsl:template name="__style-for_pageblock-title.2frtmle351">
      <xsl:text> .x-pageblock-title-1-0 {margin-left: 0pt; margin-right: 0pt; text-indent: 0pt; font-weight: bold; text-decoration: underline ; text-transform: uppercase; margin-left: 0pt; text-indent: 0pt; text-align: center; }</xsl:text>
   </xsl:template>

   <!--Template for Context: frontmatter//module/pageblock-title-->
<xsl:template match="frontmatter//module/pageblock-title" priority="1">
      <div>
         <xsl:attribute name="ch:title">toc</xsl:attribute>
         <!--Emit class values to reflect conditions--><xsl:attribute name="class">
            <xsl:text> x-pageblock-title-1-0</xsl:text>
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
         <xsl:attribute name="id">
            <xsl:call-template name="object.id"/>
         </xsl:attribute>
         <xsl:call-template name="maybe-set-id">
            <xsl:with-param name="only-if-id-attr" select="'no'"/>
            <xsl:with-param name="generated-id-prefix" select="'styler-id'"/>
         </xsl:call-template>
         <!--Process this element's content--><xsl:apply-templates/>
      </div>
   </xsl:template>

   <!--Gentext template for Context: frontmatter//module/pageblock-title-->
<xsl:template match="frontmatter//module/pageblock-title" mode="expand-gentext" priority="1">
      <xsl:copy>
         <xsl:attribute name="_gte:Gentext-Expanded">y</xsl:attribute>
         <xsl:apply-templates select="@*" mode="expand-gentext"/>
         <xsl:if test="not(@_gte:id)">
            <xsl:attribute name="_gte:id">
               <xsl:value-of select="'_g_'"/>
               <xsl:value-of select="generate-id(.)"/>
            </xsl:attribute>
         </xsl:if>
         <xsl:attribute name="_gte:unhidden-title">yes</xsl:attribute>
         <!--Unconditional AddBefore--><xsl:if test="not(@_gte:Gentext-Expanded)">
            <_gte:Must-Expand-Gentext/>
            <_sfe:BeforeOrAfterText>
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
            </_sfe:BeforeOrAfterText>
         </xsl:if>
         <xsl:apply-templates select="* | text() | processing-instruction()" mode="expand-gentext"/>
      </xsl:copy>
   </xsl:template>

   <!--Initial pass template for Context: frontmatter//module/pageblock-title-->
<xsl:template match="frontmatter//module/pageblock-title" mode="initial-pass-mode"
                 priority="1">
      <xsl:copy>
         <xsl:call-template name="maybe-set-gte-id"/>
         <xsl:apply-templates select="@*|node()" mode="initial-pass-mode"/>
      </xsl:copy>
   </xsl:template>

   <!--TocEntry template for tocNameReference=Table_of_Contents-->
<xsl:template match="frontmatter//module/pageblock-title" priority="1"
                 mode="toc-mode-Table_of_Contents">
      <_gte:Must-Expand-Gentext/>
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

   <!--Numbering template for context=frontmatter//module/pageblock-title-->
<xsl:template match="frontmatter//module/pageblock-title" mode="styler_numbering"
                 priority="1">
      <xsl:number count="frontmatter//module[pageblock-title]" format="1"/>
   </xsl:template>

   <!--Set count-as pass template for Context: frontmatter//module/pageblock-title-->
<xsl:template match="frontmatter//module/pageblock-title" mode="set-countas" priority="1">
      <xsl:copy>
         <xsl:apply-templates select="@*|node()" mode="set-countas"/>
      </xsl:copy>
   </xsl:template>

   <!--LabelAndNumberMarker template-->
<xsl:template match="frontmatter//module/pageblock-title" mode="styler-LabelAndNumberMarker"
                 priority="1">
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
   </xsl:template>

   <!--Set ch:chunk template for Context: frontmatter//module/pageblock-title-->
<xsl:template match="frontmatter//module/pageblock-title" mode="set-ch-chunk" priority="1">
      <xsl:copy>
         <xsl:if test="not(@_gte:did-set-chunk)">
            <xsl:attribute name="_gte:did-set-chunk">yes</xsl:attribute>
         </xsl:if>
         <xsl:apply-templates select="@*|node()" mode="set-ch-chunk"/>
      </xsl:copy>
   </xsl:template>

   <!--Style template for Context: pageblock-title-->
<xsl:template name="__style-for_pageblock-title.2pablle152">
      <xsl:text> .x-pageblock-title-2-0 {margin-left: 0pt; margin-right: 0pt; text-indent: 0pt; font-weight: bold; font-size: 14pt; }</xsl:text>
   </xsl:template>

   <!--Template for Context: pageblock-title-->
<xsl:template match="pageblock-title" priority="0">
      <div>
         <xsl:attribute name="ch:title">toc</xsl:attribute>
         <!--Emit class values to reflect conditions--><xsl:attribute name="class">
            <xsl:text> x-pageblock-title-2-0</xsl:text>
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
         <xsl:attribute name="id">
            <xsl:call-template name="object.id"/>
         </xsl:attribute>
         <xsl:call-template name="maybe-set-id">
            <xsl:with-param name="only-if-id-attr" select="'no'"/>
            <xsl:with-param name="generated-id-prefix" select="'styler-id'"/>
         </xsl:call-template>
         <!--Process this element's content--><xsl:apply-templates/>
      </div>
   </xsl:template>

   <!--Gentext template for Context: pageblock-title-->
<xsl:template match="pageblock-title" mode="expand-gentext" priority="0">
      <xsl:copy>
         <xsl:attribute name="_gte:Gentext-Expanded">y</xsl:attribute>
         <xsl:apply-templates select="@*" mode="expand-gentext"/>
         <xsl:if test="not(@_gte:id)">
            <xsl:attribute name="_gte:id">
               <xsl:value-of select="'_g_'"/>
               <xsl:value-of select="generate-id(.)"/>
            </xsl:attribute>
         </xsl:if>
         <xsl:attribute name="_gte:unhidden-title">yes</xsl:attribute>
         <xsl:apply-templates select="* | text() | processing-instruction()" mode="expand-gentext"/>
      </xsl:copy>
   </xsl:template>

   <!--Initial pass template for Context: pageblock-title-->
<xsl:template match="pageblock-title" mode="initial-pass-mode" priority="0">
      <xsl:copy>
         <xsl:call-template name="maybe-set-gte-id"/>
         <xsl:apply-templates select="@*|node()" mode="initial-pass-mode"/>
      </xsl:copy>
   </xsl:template>

   <!--TocEntry template for tocNameReference=Table_of_Contents-->
<xsl:template match="pageblock-title" priority="0" mode="toc-mode-Table_of_Contents">
      <_gte:Must-Expand-Gentext/>
      <_sfe:TocEntry4_Table_of_Contents>
         <xsl:attribute name="tocentry-indent-class">x-Table-of-Contents-toc-entry-indent-4</xsl:attribute>
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
      </_sfe:TocEntry4_Table_of_Contents>
   </xsl:template>

   <!--Numbering template for context=pageblock-title-->
<xsl:template match="pageblock-title" mode="styler_numbering" priority="0"><!--This context has no numbering--><xsl:param name="do-qmark" select="'yes'"/>
      <xsl:if test="$do-qmark='yes'">
         <xsl:value-of select="'?'"/>
      </xsl:if>
   </xsl:template>

   <!--Set count-as pass template for Context: pageblock-title-->
<xsl:template match="pageblock-title" mode="set-countas" priority="0">
      <xsl:copy>
         <xsl:apply-templates select="@*|node()" mode="set-countas"/>
      </xsl:copy>
   </xsl:template>

   <!--Set ch:chunk template for Context: pageblock-title-->
<xsl:template match="pageblock-title" mode="set-ch-chunk" priority="0">
      <xsl:copy>
         <xsl:if test="not(@_gte:did-set-chunk)">
            <xsl:attribute name="_gte:did-set-chunk">yes</xsl:attribute>
         </xsl:if>
         <xsl:apply-templates select="@*|node()" mode="set-ch-chunk"/>
      </xsl:copy>
   </xsl:template>

   <!--Style template for Context: part-->
<xsl:template name="__style-for_part.1">
      <xsl:text> .x-part-1-0 {margin-left: 0pt; margin-right: 0pt; }</xsl:text>
   </xsl:template>

   <!--Template for Context: part-->
<xsl:template match="part" priority="0">
      <span><!--Emit class values to reflect conditions--><xsl:attribute name="class">
            <xsl:text> x-part-1-0</xsl:text>
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

   <!--Gentext template for Context: part-->
<xsl:template match="part" mode="expand-gentext" priority="0">
      <xsl:copy>
         <xsl:apply-templates select="@*|node()" mode="expand-gentext"/>
      </xsl:copy>
   </xsl:template>

   <!--Initial pass template for Context: part-->
<xsl:template match="part" mode="initial-pass-mode" priority="0">
      <xsl:copy>
         <xsl:call-template name="maybe-set-gte-id"/>
         <xsl:apply-templates select="@*|node()" mode="initial-pass-mode"/>
      </xsl:copy>
   </xsl:template>

   <!--Set count-as pass template for Context: part-->
<xsl:template match="part" mode="set-countas" priority="0">
      <xsl:copy>
         <xsl:apply-templates select="@*|node()" mode="set-countas"/>
      </xsl:copy>
   </xsl:template>

   <!--Set ch:chunk template for Context: part-->
<xsl:template match="part" mode="set-ch-chunk" priority="0">
      <xsl:copy>
         <xsl:if test="not(@_gte:did-set-chunk)">
            <xsl:attribute name="_gte:did-set-chunk">yes</xsl:attribute>
         </xsl:if>
         <xsl:apply-templates select="@*|node()" mode="set-ch-chunk"/>
      </xsl:copy>
   </xsl:template>

   <!--Style template for Context: pbfmatr-->
<xsl:template name="__style-for_pbfmatr.1">
      <xsl:text> .x-pbfmatr-1-0 {margin-left: 0pt; margin-right: 0pt; text-indent: 0pt; }</xsl:text>
   </xsl:template>

   <!--Template for Context: pbfmatr-->
<xsl:template match="pbfmatr" priority="0">
      <div><!--Emit class values to reflect conditions--><xsl:attribute name="class">
            <xsl:text> x-pbfmatr-1-0</xsl:text>
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

   <!--Gentext template for Context: pbfmatr-->
<xsl:template match="pbfmatr" mode="expand-gentext" priority="0">
      <xsl:copy>
         <xsl:apply-templates select="@*|node()" mode="expand-gentext"/>
      </xsl:copy>
   </xsl:template>

   <!--Initial pass template for Context: pbfmatr-->
<xsl:template match="pbfmatr" mode="initial-pass-mode" priority="0">
      <xsl:copy>
         <xsl:call-template name="maybe-set-gte-id"/>
         <xsl:apply-templates select="@*|node()" mode="initial-pass-mode"/>
      </xsl:copy>
   </xsl:template>

   <!--Set count-as pass template for Context: pbfmatr-->
<xsl:template match="pbfmatr" mode="set-countas" priority="0">
      <xsl:copy>
         <xsl:apply-templates select="@*|node()" mode="set-countas"/>
      </xsl:copy>
   </xsl:template>

   <!--Set ch:chunk template for Context: pbfmatr-->
<xsl:template match="pbfmatr" mode="set-ch-chunk" priority="0">
      <xsl:copy>
         <xsl:if test="not(@_gte:did-set-chunk)">
            <xsl:attribute name="_gte:did-set-chunk">yes</xsl:attribute>
         </xsl:if>
         <xsl:apply-templates select="@*|node()" mode="set-ch-chunk"/>
      </xsl:copy>
   </xsl:template>

   <!--Style template for Context: pgblk-->
<xsl:template name="__style-for_pgblk.1">
      <xsl:text> .x-pgblk-1-0 {margin-left: 0pt; margin-right: 0pt; text-indent: 0pt; margin-top: 8pt; }</xsl:text>
   </xsl:template>

   <!--Template for Context: pgblk-->
<xsl:template match="pgblk" priority="0">
      <div><!--Emit class values to reflect conditions--><xsl:attribute name="class">
            <xsl:text> x-pgblk-1-0</xsl:text>
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

   <!--Gentext template for Context: pgblk-->
<xsl:template match="pgblk" mode="expand-gentext" priority="0">
      <xsl:copy>
         <xsl:apply-templates select="@*|node()" mode="expand-gentext"/>
      </xsl:copy>
   </xsl:template>

   <!--Initial pass template for Context: pgblk-->
<xsl:template match="pgblk" mode="initial-pass-mode" priority="0">
      <xsl:copy>
         <xsl:call-template name="maybe-set-gte-id"/>
         <xsl:apply-templates select="@*|node()" mode="initial-pass-mode"/>
      </xsl:copy>
   </xsl:template>

   <!--Set count-as pass template for Context: pgblk-->
<xsl:template match="pgblk" mode="set-countas" priority="0">
      <xsl:copy>
         <xsl:apply-templates select="@*|node()" mode="set-countas"/>
      </xsl:copy>
   </xsl:template>

   <!--Set ch:chunk template for Context: pgblk-->
<xsl:template match="pgblk" mode="set-ch-chunk" priority="0">
      <xsl:copy>
         <xsl:if test="not(@_gte:did-set-chunk)">
            <xsl:attribute name="_gte:did-set-chunk">yes</xsl:attribute>
         </xsl:if>
         <xsl:apply-templates select="@*|node()" mode="set-ch-chunk"/>
      </xsl:copy>
   </xsl:template>

   <!--Style template for Context: prcitem-->
<xsl:template name="__style-for_prcitem.1">
      <xsl:text> .x-prcitem-1-0 {margin-left: 0pt; margin-right: 0pt; text-indent: 0pt; margin-top: 8pt; }</xsl:text>
   </xsl:template>

   <!--Template for Context: prcitem-->
<xsl:template match="prcitem" priority="0">
      <div><!--Emit class values to reflect conditions--><xsl:attribute name="class">
            <xsl:text> x-prcitem-1-0</xsl:text>
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

   <!--Gentext template for Context: prcitem-->
<xsl:template match="prcitem" mode="expand-gentext" priority="0">
      <xsl:copy>
         <xsl:apply-templates select="@*|node()" mode="expand-gentext"/>
      </xsl:copy>
   </xsl:template>

   <!--Initial pass template for Context: prcitem-->
<xsl:template match="prcitem" mode="initial-pass-mode" priority="0">
      <xsl:copy>
         <xsl:call-template name="maybe-set-gte-id"/>
         <xsl:apply-templates select="@*|node()" mode="initial-pass-mode"/>
      </xsl:copy>
   </xsl:template>

   <!--Set count-as pass template for Context: prcitem-->
<xsl:template match="prcitem" mode="set-countas" priority="0">
      <xsl:copy>
         <xsl:apply-templates select="@*|node()" mode="set-countas"/>
      </xsl:copy>
   </xsl:template>

   <!--Set ch:chunk template for Context: prcitem-->
<xsl:template match="prcitem" mode="set-ch-chunk" priority="0">
      <xsl:copy>
         <xsl:if test="not(@_gte:did-set-chunk)">
            <xsl:attribute name="_gte:did-set-chunk">yes</xsl:attribute>
         </xsl:if>
         <xsl:apply-templates select="@*|node()" mode="set-ch-chunk"/>
      </xsl:copy>
   </xsl:template>

   <!--Style template for Context: prclist1/prcitem1-->
<xsl:template name="__style-for_prcitem1.2prism1171">
      <xsl:text> .x-prcitem1-1-0 {margin-left: 0pt; margin-right: 0pt; text-indent: 0pt; margin-top: 6pt; margin-bottom: 6pt; margin-left: 0pt; text-indent: 0pt; }</xsl:text>
   </xsl:template>

   <!--Template for Context: prclist1/prcitem1-->
<xsl:template match="prclist1/prcitem1" priority="1">
      <table border="0" cellpadding="0" cellspacing="0">
         <xsl:attribute name="style">
            <xsl:variable name="followWith"/>
            <xsl:if test="$followWith='tab'">table-layout: fixed; </xsl:if>
         </xsl:attribute>
         <!--Emit class values to reflect conditions--><xsl:attribute name="class">
            <xsl:text> x-prcitem1-1-0</xsl:text> x--zero-left-margins</xsl:attribute>
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
         <xsl:variable name="col1-width">0pt</xsl:variable>
         <xsl:variable name="col2-width">0pt</xsl:variable>
         <xsl:variable name="col3-width"/>
         <xsl:variable name="itemlabel-colnum">3</xsl:variable>
         <xsl:variable name="col2-align">center</xsl:variable>
         <col>
            <xsl:if test="$col1-width!=''">
               <xsl:attribute name="style">
                  <xsl:text>width: </xsl:text>
                  <xsl:value-of select="$col1-width"/>
               </xsl:attribute>
            </xsl:if>
         </col>
         <col>
            <xsl:if test="$col2-width!=''">
               <xsl:attribute name="style">
                  <xsl:text>width: </xsl:text>
                  <xsl:value-of select="$col2-width"/>
               </xsl:attribute>
            </xsl:if>
         </col>
         <col>
            <xsl:if test="$col3-width!=''">
               <xsl:attribute name="style">
                  <xsl:text>width: </xsl:text>
                  <xsl:value-of select="$col3-width"/>
               </xsl:attribute>
            </xsl:if>
         </col>
         <tbody>
            <tr valign="baseline">
               <td align="right">
                  <xsl:if test="$itemlabel-colnum=1">
                     <xsl:attribute name="style">word-break: keep-all; </xsl:attribute>
                  </xsl:if>
               </td>
               <td align="{$col2-align}">
                  <xsl:if test="$itemlabel-colnum=2">
                     <xsl:attribute name="style">word-break: keep-all; </xsl:attribute>
                  </xsl:if>
               </td>
               <td>
                  <xsl:if test="$itemlabel-colnum=3">
                     <xsl:attribute name="style">word-break: keep-all; </xsl:attribute>
                  </xsl:if>
                  <!--Process this element's content--><xsl:apply-templates select="node()[name(.)!='_sfe:BeforeOrAfterText']"/>
               </td>
            </tr>
         </tbody>
      </table>
   </xsl:template>

   <!--Gentext template for Context: prclist1/prcitem1-->
<xsl:template match="prclist1/prcitem1" mode="expand-gentext" priority="1">
      <xsl:copy>
         <xsl:apply-templates select="@*|node()" mode="expand-gentext"/>
      </xsl:copy>
   </xsl:template>

   <!--Initial pass template for Context: prclist1/prcitem1-->
<xsl:template match="prclist1/prcitem1" mode="initial-pass-mode" priority="1">
      <xsl:copy>
         <xsl:call-template name="maybe-set-gte-id"/>
         <xsl:apply-templates select="@*|node()" mode="initial-pass-mode"/>
      </xsl:copy>
   </xsl:template>

   <!--Set count-as pass template for Context: prclist1/prcitem1-->
<xsl:template match="prclist1/prcitem1" mode="set-countas" priority="1">
      <xsl:copy>
         <xsl:apply-templates select="@*|node()" mode="set-countas"/>
      </xsl:copy>
   </xsl:template>

   <!--Set ch:chunk template for Context: prclist1/prcitem1-->
<xsl:template match="prclist1/prcitem1" mode="set-ch-chunk" priority="1">
      <xsl:copy>
         <xsl:if test="not(@_gte:did-set-chunk)">
            <xsl:attribute name="_gte:did-set-chunk">yes</xsl:attribute>
         </xsl:if>
         <xsl:apply-templates select="@*|node()" mode="set-ch-chunk"/>
      </xsl:copy>
   </xsl:template>

   <!--Style template for Context: prcitem1-->
<xsl:template name="__style-for_prcitem1.2prtem182">
      <xsl:text> .x-prcitem1-2-0 {margin-left: 0pt; margin-right: 0pt; text-indent: 0pt; margin-top: 6pt; margin-bottom: 6pt; margin-left: 0pt; text-indent: 0pt; }</xsl:text>
   </xsl:template>

   <!--Template for Context: prcitem1-->
<xsl:template match="prcitem1" priority="0">
      <table border="0" cellpadding="0" cellspacing="0">
         <xsl:attribute name="style">
            <xsl:variable name="followWith"/>
            <xsl:if test="$followWith='tab'">table-layout: fixed; </xsl:if>
         </xsl:attribute>
         <!--Emit class values to reflect conditions--><xsl:attribute name="class">
            <xsl:text> x-prcitem1-2-0</xsl:text> x--zero-left-margins</xsl:attribute>
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
         <xsl:variable name="col1-width">0pt</xsl:variable>
         <xsl:variable name="col2-width">0pt</xsl:variable>
         <xsl:variable name="col3-width"/>
         <xsl:variable name="itemlabel-colnum">3</xsl:variable>
         <xsl:variable name="col2-align">center</xsl:variable>
         <col>
            <xsl:if test="$col1-width!=''">
               <xsl:attribute name="style">
                  <xsl:text>width: </xsl:text>
                  <xsl:value-of select="$col1-width"/>
               </xsl:attribute>
            </xsl:if>
         </col>
         <col>
            <xsl:if test="$col2-width!=''">
               <xsl:attribute name="style">
                  <xsl:text>width: </xsl:text>
                  <xsl:value-of select="$col2-width"/>
               </xsl:attribute>
            </xsl:if>
         </col>
         <col>
            <xsl:if test="$col3-width!=''">
               <xsl:attribute name="style">
                  <xsl:text>width: </xsl:text>
                  <xsl:value-of select="$col3-width"/>
               </xsl:attribute>
            </xsl:if>
         </col>
         <tbody>
            <tr valign="baseline">
               <td align="right">
                  <xsl:if test="$itemlabel-colnum=1">
                     <xsl:attribute name="style">word-break: keep-all; </xsl:attribute>
                  </xsl:if>
               </td>
               <td align="{$col2-align}">
                  <xsl:if test="$itemlabel-colnum=2">
                     <xsl:attribute name="style">word-break: keep-all; </xsl:attribute>
                  </xsl:if>
               </td>
               <td>
                  <xsl:if test="$itemlabel-colnum=3">
                     <xsl:attribute name="style">word-break: keep-all; </xsl:attribute>
                  </xsl:if>
                  <!--Process this element's content--><xsl:apply-templates select="node()[name(.)!='_sfe:BeforeOrAfterText']"/>
               </td>
            </tr>
         </tbody>
      </table>
   </xsl:template>

   <!--Gentext template for Context: prcitem1-->
<xsl:template match="prcitem1" mode="expand-gentext" priority="0">
      <xsl:copy>
         <xsl:apply-templates select="@*|node()" mode="expand-gentext"/>
      </xsl:copy>
   </xsl:template>

   <!--Initial pass template for Context: prcitem1-->
<xsl:template match="prcitem1" mode="initial-pass-mode" priority="0">
      <xsl:copy>
         <xsl:call-template name="maybe-set-gte-id"/>
         <xsl:apply-templates select="@*|node()" mode="initial-pass-mode"/>
      </xsl:copy>
   </xsl:template>

   <!--Set count-as pass template for Context: prcitem1-->
<xsl:template match="prcitem1" mode="set-countas" priority="0">
      <xsl:copy>
         <xsl:apply-templates select="@*|node()" mode="set-countas"/>
      </xsl:copy>
   </xsl:template>

   <!--Set ch:chunk template for Context: prcitem1-->
<xsl:template match="prcitem1" mode="set-ch-chunk" priority="0">
      <xsl:copy>
         <xsl:if test="not(@_gte:did-set-chunk)">
            <xsl:attribute name="_gte:did-set-chunk">yes</xsl:attribute>
         </xsl:if>
         <xsl:apply-templates select="@*|node()" mode="set-ch-chunk"/>
      </xsl:copy>
   </xsl:template>

   <!--Style template for Context: prclist2/prcitem2-->
<xsl:template name="__style-for_prcitem2.2prism2171">
      <xsl:text> .x-prcitem2-1-0 {margin-left: 0pt; margin-right: 0pt; text-indent: 0pt; margin-top: 6pt; margin-bottom: 6pt; margin-left: 0pt; text-indent: 0pt; }</xsl:text>
   </xsl:template>

   <!--Template for Context: prclist2/prcitem2-->
<xsl:template match="prclist2/prcitem2" priority="1">
      <table border="0" cellpadding="0" cellspacing="0">
         <xsl:attribute name="style">
            <xsl:variable name="followWith"/>
            <xsl:if test="$followWith='tab'">table-layout: fixed; </xsl:if>
         </xsl:attribute>
         <!--Emit class values to reflect conditions--><xsl:attribute name="class">
            <xsl:text> x-prcitem2-1-0</xsl:text> x--zero-left-margins</xsl:attribute>
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
         <xsl:variable name="col1-width">0pt</xsl:variable>
         <xsl:variable name="col2-width">0pt</xsl:variable>
         <xsl:variable name="col3-width"/>
         <xsl:variable name="itemlabel-colnum">3</xsl:variable>
         <xsl:variable name="col2-align">center</xsl:variable>
         <col>
            <xsl:if test="$col1-width!=''">
               <xsl:attribute name="style">
                  <xsl:text>width: </xsl:text>
                  <xsl:value-of select="$col1-width"/>
               </xsl:attribute>
            </xsl:if>
         </col>
         <col>
            <xsl:if test="$col2-width!=''">
               <xsl:attribute name="style">
                  <xsl:text>width: </xsl:text>
                  <xsl:value-of select="$col2-width"/>
               </xsl:attribute>
            </xsl:if>
         </col>
         <col>
            <xsl:if test="$col3-width!=''">
               <xsl:attribute name="style">
                  <xsl:text>width: </xsl:text>
                  <xsl:value-of select="$col3-width"/>
               </xsl:attribute>
            </xsl:if>
         </col>
         <tbody>
            <tr valign="baseline">
               <td align="right">
                  <xsl:if test="$itemlabel-colnum=1">
                     <xsl:attribute name="style">word-break: keep-all; </xsl:attribute>
                  </xsl:if>
               </td>
               <td align="{$col2-align}">
                  <xsl:if test="$itemlabel-colnum=2">
                     <xsl:attribute name="style">word-break: keep-all; </xsl:attribute>
                  </xsl:if>
               </td>
               <td>
                  <xsl:if test="$itemlabel-colnum=3">
                     <xsl:attribute name="style">word-break: keep-all; </xsl:attribute>
                  </xsl:if>
                  <!--Process this element's content--><xsl:apply-templates select="node()[name(.)!='_sfe:BeforeOrAfterText']"/>
               </td>
            </tr>
         </tbody>
      </table>
   </xsl:template>

   <!--Gentext template for Context: prclist2/prcitem2-->
<xsl:template match="prclist2/prcitem2" mode="expand-gentext" priority="1">
      <xsl:copy>
         <xsl:apply-templates select="@*|node()" mode="expand-gentext"/>
      </xsl:copy>
   </xsl:template>

   <!--Initial pass template for Context: prclist2/prcitem2-->
<xsl:template match="prclist2/prcitem2" mode="initial-pass-mode" priority="1">
      <xsl:copy>
         <xsl:call-template name="maybe-set-gte-id"/>
         <xsl:apply-templates select="@*|node()" mode="initial-pass-mode"/>
      </xsl:copy>
   </xsl:template>

   <!--Set count-as pass template for Context: prclist2/prcitem2-->
<xsl:template match="prclist2/prcitem2" mode="set-countas" priority="1">
      <xsl:copy>
         <xsl:apply-templates select="@*|node()" mode="set-countas"/>
      </xsl:copy>
   </xsl:template>

   <!--Set ch:chunk template for Context: prclist2/prcitem2-->
<xsl:template match="prclist2/prcitem2" mode="set-ch-chunk" priority="1">
      <xsl:copy>
         <xsl:if test="not(@_gte:did-set-chunk)">
            <xsl:attribute name="_gte:did-set-chunk">yes</xsl:attribute>
         </xsl:if>
         <xsl:apply-templates select="@*|node()" mode="set-ch-chunk"/>
      </xsl:copy>
   </xsl:template>

   <!--Style template for Context: prcitem2-->
<xsl:template name="__style-for_prcitem2.2prtem282">
      <xsl:text> .x-prcitem2-2-0 {margin-left: 0pt; margin-right: 0pt; text-indent: 0pt; margin-top: 6pt; margin-bottom: 6pt; margin-left: 0pt; text-indent: 0pt; }</xsl:text>
   </xsl:template>

   <!--Template for Context: prcitem2-->
<xsl:template match="prcitem2" priority="0">
      <table border="0" cellpadding="0" cellspacing="0">
         <xsl:attribute name="style">
            <xsl:variable name="followWith"/>
            <xsl:if test="$followWith='tab'">table-layout: fixed; </xsl:if>
         </xsl:attribute>
         <!--Emit class values to reflect conditions--><xsl:attribute name="class">
            <xsl:text> x-prcitem2-2-0</xsl:text> x--zero-left-margins</xsl:attribute>
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
         <xsl:variable name="col1-width">0pt</xsl:variable>
         <xsl:variable name="col2-width">0pt</xsl:variable>
         <xsl:variable name="col3-width"/>
         <xsl:variable name="itemlabel-colnum">3</xsl:variable>
         <xsl:variable name="col2-align">center</xsl:variable>
         <col>
            <xsl:if test="$col1-width!=''">
               <xsl:attribute name="style">
                  <xsl:text>width: </xsl:text>
                  <xsl:value-of select="$col1-width"/>
               </xsl:attribute>
            </xsl:if>
         </col>
         <col>
            <xsl:if test="$col2-width!=''">
               <xsl:attribute name="style">
                  <xsl:text>width: </xsl:text>
                  <xsl:value-of select="$col2-width"/>
               </xsl:attribute>
            </xsl:if>
         </col>
         <col>
            <xsl:if test="$col3-width!=''">
               <xsl:attribute name="style">
                  <xsl:text>width: </xsl:text>
                  <xsl:value-of select="$col3-width"/>
               </xsl:attribute>
            </xsl:if>
         </col>
         <tbody>
            <tr valign="baseline">
               <td align="right">
                  <xsl:if test="$itemlabel-colnum=1">
                     <xsl:attribute name="style">word-break: keep-all; </xsl:attribute>
                  </xsl:if>
               </td>
               <td align="{$col2-align}">
                  <xsl:if test="$itemlabel-colnum=2">
                     <xsl:attribute name="style">word-break: keep-all; </xsl:attribute>
                  </xsl:if>
               </td>
               <td>
                  <xsl:if test="$itemlabel-colnum=3">
                     <xsl:attribute name="style">word-break: keep-all; </xsl:attribute>
                  </xsl:if>
                  <!--Process this element's content--><xsl:apply-templates select="node()[name(.)!='_sfe:BeforeOrAfterText']"/>
               </td>
            </tr>
         </tbody>
      </table>
   </xsl:template>

   <!--Gentext template for Context: prcitem2-->
<xsl:template match="prcitem2" mode="expand-gentext" priority="0">
      <xsl:copy>
         <xsl:apply-templates select="@*|node()" mode="expand-gentext"/>
      </xsl:copy>
   </xsl:template>

   <!--Initial pass template for Context: prcitem2-->
<xsl:template match="prcitem2" mode="initial-pass-mode" priority="0">
      <xsl:copy>
         <xsl:call-template name="maybe-set-gte-id"/>
         <xsl:apply-templates select="@*|node()" mode="initial-pass-mode"/>
      </xsl:copy>
   </xsl:template>

   <!--Set count-as pass template for Context: prcitem2-->
<xsl:template match="prcitem2" mode="set-countas" priority="0">
      <xsl:copy>
         <xsl:apply-templates select="@*|node()" mode="set-countas"/>
      </xsl:copy>
   </xsl:template>

   <!--Set ch:chunk template for Context: prcitem2-->
<xsl:template match="prcitem2" mode="set-ch-chunk" priority="0">
      <xsl:copy>
         <xsl:if test="not(@_gte:did-set-chunk)">
            <xsl:attribute name="_gte:did-set-chunk">yes</xsl:attribute>
         </xsl:if>
         <xsl:apply-templates select="@*|node()" mode="set-ch-chunk"/>
      </xsl:copy>
   </xsl:template>

   <!--Style template for Context: prclist3/prcitem3-->
<xsl:template name="__style-for_prcitem3.2prism3171">
      <xsl:text> .x-prcitem3-1-0 {margin-left: 0pt; margin-right: 0pt; text-indent: 0pt; margin-top: 6pt; margin-bottom: 6pt; margin-left: 0pt; text-indent: 0pt; }</xsl:text>
   </xsl:template>

   <!--Template for Context: prclist3/prcitem3-->
<xsl:template match="prclist3/prcitem3" priority="1">
      <table border="0" cellpadding="0" cellspacing="0">
         <xsl:attribute name="style">
            <xsl:variable name="followWith"/>
            <xsl:if test="$followWith='tab'">table-layout: fixed; </xsl:if>
         </xsl:attribute>
         <!--Emit class values to reflect conditions--><xsl:attribute name="class">
            <xsl:text> x-prcitem3-1-0</xsl:text> x--zero-left-margins</xsl:attribute>
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
         <xsl:variable name="col1-width">0pt</xsl:variable>
         <xsl:variable name="col2-width">0pt</xsl:variable>
         <xsl:variable name="col3-width"/>
         <xsl:variable name="itemlabel-colnum">3</xsl:variable>
         <xsl:variable name="col2-align">center</xsl:variable>
         <col>
            <xsl:if test="$col1-width!=''">
               <xsl:attribute name="style">
                  <xsl:text>width: </xsl:text>
                  <xsl:value-of select="$col1-width"/>
               </xsl:attribute>
            </xsl:if>
         </col>
         <col>
            <xsl:if test="$col2-width!=''">
               <xsl:attribute name="style">
                  <xsl:text>width: </xsl:text>
                  <xsl:value-of select="$col2-width"/>
               </xsl:attribute>
            </xsl:if>
         </col>
         <col>
            <xsl:if test="$col3-width!=''">
               <xsl:attribute name="style">
                  <xsl:text>width: </xsl:text>
                  <xsl:value-of select="$col3-width"/>
               </xsl:attribute>
            </xsl:if>
         </col>
         <tbody>
            <tr valign="baseline">
               <td align="right">
                  <xsl:if test="$itemlabel-colnum=1">
                     <xsl:attribute name="style">word-break: keep-all; </xsl:attribute>
                  </xsl:if>
               </td>
               <td align="{$col2-align}">
                  <xsl:if test="$itemlabel-colnum=2">
                     <xsl:attribute name="style">word-break: keep-all; </xsl:attribute>
                  </xsl:if>
               </td>
               <td>
                  <xsl:if test="$itemlabel-colnum=3">
                     <xsl:attribute name="style">word-break: keep-all; </xsl:attribute>
                  </xsl:if>
                  <!--Process this element's content--><xsl:apply-templates select="node()[name(.)!='_sfe:BeforeOrAfterText']"/>
               </td>
            </tr>
         </tbody>
      </table>
   </xsl:template>

   <!--Gentext template for Context: prclist3/prcitem3-->
<xsl:template match="prclist3/prcitem3" mode="expand-gentext" priority="1">
      <xsl:copy>
         <xsl:apply-templates select="@*|node()" mode="expand-gentext"/>
      </xsl:copy>
   </xsl:template>

   <!--Initial pass template for Context: prclist3/prcitem3-->
<xsl:template match="prclist3/prcitem3" mode="initial-pass-mode" priority="1">
      <xsl:copy>
         <xsl:call-template name="maybe-set-gte-id"/>
         <xsl:apply-templates select="@*|node()" mode="initial-pass-mode"/>
      </xsl:copy>
   </xsl:template>

   <!--Set count-as pass template for Context: prclist3/prcitem3-->
<xsl:template match="prclist3/prcitem3" mode="set-countas" priority="1">
      <xsl:copy>
         <xsl:apply-templates select="@*|node()" mode="set-countas"/>
      </xsl:copy>
   </xsl:template>

   <!--Set ch:chunk template for Context: prclist3/prcitem3-->
<xsl:template match="prclist3/prcitem3" mode="set-ch-chunk" priority="1">
      <xsl:copy>
         <xsl:if test="not(@_gte:did-set-chunk)">
            <xsl:attribute name="_gte:did-set-chunk">yes</xsl:attribute>
         </xsl:if>
         <xsl:apply-templates select="@*|node()" mode="set-ch-chunk"/>
      </xsl:copy>
   </xsl:template>

   <!--Style template for Context: prcitem3-->
<xsl:template name="__style-for_prcitem3.2prtem382">
      <xsl:text> .x-prcitem3-2-0 {margin-left: 0pt; margin-right: 0pt; text-indent: 0pt; margin-top: 6pt; margin-bottom: 6pt; margin-left: 0pt; text-indent: 0pt; }</xsl:text>
   </xsl:template>

   <!--Template for Context: prcitem3-->
<xsl:template match="prcitem3" priority="0">
      <table border="0" cellpadding="0" cellspacing="0">
         <xsl:attribute name="style">
            <xsl:variable name="followWith"/>
            <xsl:if test="$followWith='tab'">table-layout: fixed; </xsl:if>
         </xsl:attribute>
         <!--Emit class values to reflect conditions--><xsl:attribute name="class">
            <xsl:text> x-prcitem3-2-0</xsl:text> x--zero-left-margins</xsl:attribute>
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
         <xsl:variable name="col1-width">0pt</xsl:variable>
         <xsl:variable name="col2-width">0pt</xsl:variable>
         <xsl:variable name="col3-width"/>
         <xsl:variable name="itemlabel-colnum">3</xsl:variable>
         <xsl:variable name="col2-align">center</xsl:variable>
         <col>
            <xsl:if test="$col1-width!=''">
               <xsl:attribute name="style">
                  <xsl:text>width: </xsl:text>
                  <xsl:value-of select="$col1-width"/>
               </xsl:attribute>
            </xsl:if>
         </col>
         <col>
            <xsl:if test="$col2-width!=''">
               <xsl:attribute name="style">
                  <xsl:text>width: </xsl:text>
                  <xsl:value-of select="$col2-width"/>
               </xsl:attribute>
            </xsl:if>
         </col>
         <col>
            <xsl:if test="$col3-width!=''">
               <xsl:attribute name="style">
                  <xsl:text>width: </xsl:text>
                  <xsl:value-of select="$col3-width"/>
               </xsl:attribute>
            </xsl:if>
         </col>
         <tbody>
            <tr valign="baseline">
               <td align="right">
                  <xsl:if test="$itemlabel-colnum=1">
                     <xsl:attribute name="style">word-break: keep-all; </xsl:attribute>
                  </xsl:if>
               </td>
               <td align="{$col2-align}">
                  <xsl:if test="$itemlabel-colnum=2">
                     <xsl:attribute name="style">word-break: keep-all; </xsl:attribute>
                  </xsl:if>
               </td>
               <td>
                  <xsl:if test="$itemlabel-colnum=3">
                     <xsl:attribute name="style">word-break: keep-all; </xsl:attribute>
                  </xsl:if>
                  <!--Process this element's content--><xsl:apply-templates select="node()[name(.)!='_sfe:BeforeOrAfterText']"/>
               </td>
            </tr>
         </tbody>
      </table>
   </xsl:template>

   <!--Gentext template for Context: prcitem3-->
<xsl:template match="prcitem3" mode="expand-gentext" priority="0">
      <xsl:copy>
         <xsl:apply-templates select="@*|node()" mode="expand-gentext"/>
      </xsl:copy>
   </xsl:template>

   <!--Initial pass template for Context: prcitem3-->
<xsl:template match="prcitem3" mode="initial-pass-mode" priority="0">
      <xsl:copy>
         <xsl:call-template name="maybe-set-gte-id"/>
         <xsl:apply-templates select="@*|node()" mode="initial-pass-mode"/>
      </xsl:copy>
   </xsl:template>

   <!--Set count-as pass template for Context: prcitem3-->
<xsl:template match="prcitem3" mode="set-countas" priority="0">
      <xsl:copy>
         <xsl:apply-templates select="@*|node()" mode="set-countas"/>
      </xsl:copy>
   </xsl:template>

   <!--Set ch:chunk template for Context: prcitem3-->
<xsl:template match="prcitem3" mode="set-ch-chunk" priority="0">
      <xsl:copy>
         <xsl:if test="not(@_gte:did-set-chunk)">
            <xsl:attribute name="_gte:did-set-chunk">yes</xsl:attribute>
         </xsl:if>
         <xsl:apply-templates select="@*|node()" mode="set-ch-chunk"/>
      </xsl:copy>
   </xsl:template>

   <!--Style template for Context: prclist4/prcitem4-->
<xsl:template name="__style-for_prcitem4.3prism4171">
      <xsl:text> .x-prcitem4-1-0 {margin-left: 0pt; margin-right: 0pt; text-indent: 0pt; margin-top: 6pt; margin-bottom: 6pt; margin-left: 0pt; text-indent: 0pt; }</xsl:text>
   </xsl:template>

   <!--Template for Context: prclist4/prcitem4-->
<xsl:template match="prclist4/prcitem4" priority="2">
      <table border="0" cellpadding="0" cellspacing="0">
         <xsl:attribute name="style">
            <xsl:variable name="followWith"/>
            <xsl:if test="$followWith='tab'">table-layout: fixed; </xsl:if>
         </xsl:attribute>
         <!--Emit class values to reflect conditions--><xsl:attribute name="class">
            <xsl:text> x-prcitem4-1-0</xsl:text> x--zero-left-margins</xsl:attribute>
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
         <xsl:variable name="col1-width">0pt</xsl:variable>
         <xsl:variable name="col2-width">0pt</xsl:variable>
         <xsl:variable name="col3-width"/>
         <xsl:variable name="itemlabel-colnum">3</xsl:variable>
         <xsl:variable name="col2-align">center</xsl:variable>
         <col>
            <xsl:if test="$col1-width!=''">
               <xsl:attribute name="style">
                  <xsl:text>width: </xsl:text>
                  <xsl:value-of select="$col1-width"/>
               </xsl:attribute>
            </xsl:if>
         </col>
         <col>
            <xsl:if test="$col2-width!=''">
               <xsl:attribute name="style">
                  <xsl:text>width: </xsl:text>
                  <xsl:value-of select="$col2-width"/>
               </xsl:attribute>
            </xsl:if>
         </col>
         <col>
            <xsl:if test="$col3-width!=''">
               <xsl:attribute name="style">
                  <xsl:text>width: </xsl:text>
                  <xsl:value-of select="$col3-width"/>
               </xsl:attribute>
            </xsl:if>
         </col>
         <tbody>
            <tr valign="baseline">
               <td align="right">
                  <xsl:if test="$itemlabel-colnum=1">
                     <xsl:attribute name="style">word-break: keep-all; </xsl:attribute>
                  </xsl:if>
               </td>
               <td align="{$col2-align}">
                  <xsl:if test="$itemlabel-colnum=2">
                     <xsl:attribute name="style">word-break: keep-all; </xsl:attribute>
                  </xsl:if>
               </td>
               <td>
                  <xsl:if test="$itemlabel-colnum=3">
                     <xsl:attribute name="style">word-break: keep-all; </xsl:attribute>
                  </xsl:if>
                  <!--Process this element's content--><xsl:apply-templates select="node()[name(.)!='_sfe:BeforeOrAfterText']"/>
               </td>
            </tr>
         </tbody>
      </table>
   </xsl:template>

   <!--Gentext template for Context: prclist4/prcitem4-->
<xsl:template match="prclist4/prcitem4" mode="expand-gentext" priority="2">
      <xsl:copy>
         <xsl:apply-templates select="@*|node()" mode="expand-gentext"/>
      </xsl:copy>
   </xsl:template>

   <!--Initial pass template for Context: prclist4/prcitem4-->
<xsl:template match="prclist4/prcitem4" mode="initial-pass-mode" priority="2">
      <xsl:copy>
         <xsl:call-template name="maybe-set-gte-id"/>
         <xsl:apply-templates select="@*|node()" mode="initial-pass-mode"/>
      </xsl:copy>
   </xsl:template>

   <!--Set count-as pass template for Context: prclist4/prcitem4-->
<xsl:template match="prclist4/prcitem4" mode="set-countas" priority="2">
      <xsl:copy>
         <xsl:apply-templates select="@*|node()" mode="set-countas"/>
      </xsl:copy>
   </xsl:template>

   <!--Set ch:chunk template for Context: prclist4/prcitem4-->
<xsl:template match="prclist4/prcitem4" mode="set-ch-chunk" priority="2">
      <xsl:copy>
         <xsl:if test="not(@_gte:did-set-chunk)">
            <xsl:attribute name="_gte:did-set-chunk">yes</xsl:attribute>
         </xsl:if>
         <xsl:apply-templates select="@*|node()" mode="set-ch-chunk"/>
      </xsl:copy>
   </xsl:template>

   <!--Style template for Context: numlist/prcitem4-->
<xsl:template name="__style-for_prcitem4.3nuism4162">
      <xsl:text> .x-prcitem4-2-0 {margin-left: 0pt; margin-right: 0pt; text-indent: 0pt; margin-top: 6pt; margin-bottom: 6pt; margin-left: 0pt; text-indent: 0pt; }</xsl:text>
   </xsl:template>

   <!--Template for Context: numlist/prcitem4-->
<xsl:template match="numlist/prcitem4" priority="1">
      <table border="0" cellpadding="0" cellspacing="0">
         <xsl:attribute name="style">
            <xsl:variable name="followWith">tab</xsl:variable>
            <xsl:if test="$followWith='tab'">table-layout: fixed; </xsl:if>
         </xsl:attribute>
         <!--Emit class values to reflect conditions--><xsl:attribute name="class">
            <xsl:text> x-prcitem4-2-0</xsl:text> x--zero-left-margins</xsl:attribute>
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
         <xsl:variable name="col1-width">1.5em</xsl:variable>
         <xsl:variable name="col2-width">12pt</xsl:variable>
         <xsl:variable name="col3-width"/>
         <xsl:variable name="itemlabel-colnum">1</xsl:variable>
         <xsl:variable name="col2-align">right</xsl:variable>
         <col>
            <xsl:if test="$col1-width!=''">
               <xsl:attribute name="style">
                  <xsl:text>width: </xsl:text>
                  <xsl:value-of select="$col1-width"/>
               </xsl:attribute>
            </xsl:if>
         </col>
         <col>
            <xsl:if test="$col2-width!=''">
               <xsl:attribute name="style">
                  <xsl:text>width: </xsl:text>
                  <xsl:value-of select="$col2-width"/>
               </xsl:attribute>
            </xsl:if>
         </col>
         <col>
            <xsl:if test="$col3-width!=''">
               <xsl:attribute name="style">
                  <xsl:text>width: </xsl:text>
                  <xsl:value-of select="$col3-width"/>
               </xsl:attribute>
            </xsl:if>
         </col>
         <tbody>
            <tr valign="baseline">
               <td align="right">
                  <xsl:if test="$itemlabel-colnum=1">
                     <xsl:attribute name="style">word-break: keep-all; </xsl:attribute>
                     <xsl:apply-templates select="_sfe:BeforeOrAfterText[1]"/>
                  </xsl:if>
               </td>
               <td align="{$col2-align}">
                  <xsl:if test="$itemlabel-colnum=2">
                     <xsl:attribute name="style">word-break: keep-all; </xsl:attribute>
                     <xsl:apply-templates select="_sfe:BeforeOrAfterText[1]"/>
                  </xsl:if>
               </td>
               <td>
                  <xsl:if test="$itemlabel-colnum=3">
                     <xsl:attribute name="style">word-break: keep-all; </xsl:attribute>
                     <xsl:apply-templates select="_sfe:BeforeOrAfterText[1]"/>
                  </xsl:if>
                  <!--Process this element's content--><xsl:apply-templates select="node()[name(.)!='_sfe:BeforeOrAfterText']"/>
               </td>
            </tr>
         </tbody>
      </table>
   </xsl:template>

   <!--Gentext template for Context: numlist/prcitem4-->
<xsl:template match="numlist/prcitem4" mode="expand-gentext" priority="1">
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
            </_sfe:BeforeOrAfterText>
         </xsl:if>
         <xsl:apply-templates select="* | text() | processing-instruction()" mode="expand-gentext"/>
      </xsl:copy>
   </xsl:template>

   <!--Initial pass template for Context: numlist/prcitem4-->
<xsl:template match="numlist/prcitem4" mode="initial-pass-mode" priority="1">
      <xsl:copy>
         <xsl:call-template name="maybe-set-gte-id"/>
         <xsl:apply-templates select="@*|node()" mode="initial-pass-mode"/>
      </xsl:copy>
   </xsl:template>

   <!--Numbering template for context=numlist/prcitem4-->
<xsl:template match="numlist/prcitem4" mode="styler_numbering" priority="1">
      <xsl:number count="numlist/prcitem4" format="1"/>
      <xsl:text>.</xsl:text>
   </xsl:template>

   <!--Set count-as pass template for Context: numlist/prcitem4-->
<xsl:template match="numlist/prcitem4" mode="set-countas" priority="1">
      <xsl:copy>
         <xsl:apply-templates select="@*|node()" mode="set-countas"/>
      </xsl:copy>
   </xsl:template>

   <!--LabelAndNumberMarker template-->
<xsl:template match="numlist/prcitem4" mode="styler-LabelAndNumberMarker" priority="1">
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
   </xsl:template>

   <!--Set ch:chunk template for Context: numlist/prcitem4-->
<xsl:template match="numlist/prcitem4" mode="set-ch-chunk" priority="1">
      <xsl:copy>
         <xsl:if test="not(@_gte:did-set-chunk)">
            <xsl:attribute name="_gte:did-set-chunk">yes</xsl:attribute>
         </xsl:if>
         <xsl:apply-templates select="@*|node()" mode="set-ch-chunk"/>
      </xsl:copy>
   </xsl:template>

   <!--Style template for Context: prcitem4-->
<xsl:template name="__style-for_prcitem4.3prtem483">
      <xsl:text> .x-prcitem4-3-0 {margin-left: 0pt; margin-right: 0pt; text-indent: 0pt; margin-top: 6pt; margin-bottom: 6pt; margin-left: 0pt; text-indent: 0pt; }</xsl:text>
   </xsl:template>

   <!--Template for Context: prcitem4-->
<xsl:template match="prcitem4" priority="0">
      <table border="0" cellpadding="0" cellspacing="0">
         <xsl:attribute name="style">
            <xsl:variable name="followWith"/>
            <xsl:if test="$followWith='tab'">table-layout: fixed; </xsl:if>
         </xsl:attribute>
         <!--Emit class values to reflect conditions--><xsl:attribute name="class">
            <xsl:text> x-prcitem4-3-0</xsl:text> x--zero-left-margins</xsl:attribute>
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
         <xsl:variable name="col1-width">0pt</xsl:variable>
         <xsl:variable name="col2-width">0pt</xsl:variable>
         <xsl:variable name="col3-width"/>
         <xsl:variable name="itemlabel-colnum">3</xsl:variable>
         <xsl:variable name="col2-align">center</xsl:variable>
         <col>
            <xsl:if test="$col1-width!=''">
               <xsl:attribute name="style">
                  <xsl:text>width: </xsl:text>
                  <xsl:value-of select="$col1-width"/>
               </xsl:attribute>
            </xsl:if>
         </col>
         <col>
            <xsl:if test="$col2-width!=''">
               <xsl:attribute name="style">
                  <xsl:text>width: </xsl:text>
                  <xsl:value-of select="$col2-width"/>
               </xsl:attribute>
            </xsl:if>
         </col>
         <col>
            <xsl:if test="$col3-width!=''">
               <xsl:attribute name="style">
                  <xsl:text>width: </xsl:text>
                  <xsl:value-of select="$col3-width"/>
               </xsl:attribute>
            </xsl:if>
         </col>
         <tbody>
            <tr valign="baseline">
               <td align="right">
                  <xsl:if test="$itemlabel-colnum=1">
                     <xsl:attribute name="style">word-break: keep-all; </xsl:attribute>
                  </xsl:if>
               </td>
               <td align="{$col2-align}">
                  <xsl:if test="$itemlabel-colnum=2">
                     <xsl:attribute name="style">word-break: keep-all; </xsl:attribute>
                  </xsl:if>
               </td>
               <td>
                  <xsl:if test="$itemlabel-colnum=3">
                     <xsl:attribute name="style">word-break: keep-all; </xsl:attribute>
                  </xsl:if>
                  <!--Process this element's content--><xsl:apply-templates select="node()[name(.)!='_sfe:BeforeOrAfterText']"/>
               </td>
            </tr>
         </tbody>
      </table>
   </xsl:template>

   <!--Gentext template for Context: prcitem4-->
<xsl:template match="prcitem4" mode="expand-gentext" priority="0">
      <xsl:copy>
         <xsl:apply-templates select="@*|node()" mode="expand-gentext"/>
      </xsl:copy>
   </xsl:template>

   <!--Initial pass template for Context: prcitem4-->
<xsl:template match="prcitem4" mode="initial-pass-mode" priority="0">
      <xsl:copy>
         <xsl:call-template name="maybe-set-gte-id"/>
         <xsl:apply-templates select="@*|node()" mode="initial-pass-mode"/>
      </xsl:copy>
   </xsl:template>

   <!--Set count-as pass template for Context: prcitem4-->
<xsl:template match="prcitem4" mode="set-countas" priority="0">
      <xsl:copy>
         <xsl:apply-templates select="@*|node()" mode="set-countas"/>
      </xsl:copy>
   </xsl:template>

   <!--Set ch:chunk template for Context: prcitem4-->
<xsl:template match="prcitem4" mode="set-ch-chunk" priority="0">
      <xsl:copy>
         <xsl:if test="not(@_gte:did-set-chunk)">
            <xsl:attribute name="_gte:did-set-chunk">yes</xsl:attribute>
         </xsl:if>
         <xsl:apply-templates select="@*|node()" mode="set-ch-chunk"/>
      </xsl:copy>
   </xsl:template>

   <!--Style template for Context: prcitem5-->
<xsl:template name="__style-for_prcitem5.1">
      <xsl:text> .x-prcitem5-1-0 {margin-left: 0pt; margin-right: 0pt; }</xsl:text>
   </xsl:template>

   <!--Template for Context: prcitem5-->
<xsl:template match="prcitem5" priority="0"><!--Emit a nostyle template--><xsl:apply-templates/>
   </xsl:template>

   <!--Gentext template for Context: prcitem5-->
<xsl:template match="prcitem5" mode="expand-gentext" priority="0">
      <xsl:copy>
         <xsl:apply-templates select="@*|node()" mode="expand-gentext"/>
      </xsl:copy>
   </xsl:template>

   <!--Initial pass template for Context: prcitem5-->
<xsl:template match="prcitem5" mode="initial-pass-mode" priority="0">
      <xsl:copy>
         <xsl:call-template name="maybe-set-gte-id"/>
         <xsl:apply-templates select="@*|node()" mode="initial-pass-mode"/>
      </xsl:copy>
   </xsl:template>

   <!--Set count-as pass template for Context: prcitem5-->
<xsl:template match="prcitem5" mode="set-countas" priority="0">
      <xsl:copy>
         <xsl:apply-templates select="@*|node()" mode="set-countas"/>
      </xsl:copy>
   </xsl:template>

   <!--Set ch:chunk template for Context: prcitem5-->
<xsl:template match="prcitem5" mode="set-ch-chunk" priority="0">
      <xsl:copy>
         <xsl:if test="not(@_gte:did-set-chunk)">
            <xsl:attribute name="_gte:did-set-chunk">yes</xsl:attribute>
         </xsl:if>
         <xsl:apply-templates select="@*|node()" mode="set-ch-chunk"/>
      </xsl:copy>
   </xsl:template>

   <!--Style template for Context: prcitem6-->
<xsl:template name="__style-for_prcitem6.1">
      <xsl:text> .x-prcitem6-1-0 {margin-left: 0pt; margin-right: 0pt; }</xsl:text>
   </xsl:template>

   <!--Template for Context: prcitem6-->
<xsl:template match="prcitem6" priority="0"><!--Emit a nostyle template--><xsl:apply-templates/>
   </xsl:template>

   <!--Gentext template for Context: prcitem6-->
<xsl:template match="prcitem6" mode="expand-gentext" priority="0">
      <xsl:copy>
         <xsl:apply-templates select="@*|node()" mode="expand-gentext"/>
      </xsl:copy>
   </xsl:template>

   <!--Initial pass template for Context: prcitem6-->
<xsl:template match="prcitem6" mode="initial-pass-mode" priority="0">
      <xsl:copy>
         <xsl:call-template name="maybe-set-gte-id"/>
         <xsl:apply-templates select="@*|node()" mode="initial-pass-mode"/>
      </xsl:copy>
   </xsl:template>

   <!--Set count-as pass template for Context: prcitem6-->
<xsl:template match="prcitem6" mode="set-countas" priority="0">
      <xsl:copy>
         <xsl:apply-templates select="@*|node()" mode="set-countas"/>
      </xsl:copy>
   </xsl:template>

   <!--Set ch:chunk template for Context: prcitem6-->
<xsl:template match="prcitem6" mode="set-ch-chunk" priority="0">
      <xsl:copy>
         <xsl:if test="not(@_gte:did-set-chunk)">
            <xsl:attribute name="_gte:did-set-chunk">yes</xsl:attribute>
         </xsl:if>
         <xsl:apply-templates select="@*|node()" mode="set-ch-chunk"/>
      </xsl:copy>
   </xsl:template>

   <!--Style template for Context: prcitem7-->
<xsl:template name="__style-for_prcitem7.1">
      <xsl:text> .x-prcitem7-1-0 {margin-left: 0pt; margin-right: 0pt; }</xsl:text>
   </xsl:template>

   <!--Template for Context: prcitem7-->
<xsl:template match="prcitem7" priority="0"><!--Emit a nostyle template--><xsl:apply-templates/>
   </xsl:template>

   <!--Gentext template for Context: prcitem7-->
<xsl:template match="prcitem7" mode="expand-gentext" priority="0">
      <xsl:copy>
         <xsl:apply-templates select="@*|node()" mode="expand-gentext"/>
      </xsl:copy>
   </xsl:template>

   <!--Initial pass template for Context: prcitem7-->
<xsl:template match="prcitem7" mode="initial-pass-mode" priority="0">
      <xsl:copy>
         <xsl:call-template name="maybe-set-gte-id"/>
         <xsl:apply-templates select="@*|node()" mode="initial-pass-mode"/>
      </xsl:copy>
   </xsl:template>

   <!--Set count-as pass template for Context: prcitem7-->
<xsl:template match="prcitem7" mode="set-countas" priority="0">
      <xsl:copy>
         <xsl:apply-templates select="@*|node()" mode="set-countas"/>
      </xsl:copy>
   </xsl:template>

   <!--Set ch:chunk template for Context: prcitem7-->
<xsl:template match="prcitem7" mode="set-ch-chunk" priority="0">
      <xsl:copy>
         <xsl:if test="not(@_gte:did-set-chunk)">
            <xsl:attribute name="_gte:did-set-chunk">yes</xsl:attribute>
         </xsl:if>
         <xsl:apply-templates select="@*|node()" mode="set-ch-chunk"/>
      </xsl:copy>
   </xsl:template>

   <!--Style template for Context: prclist1-->
<xsl:template name="__style-for_prclist1.1">
      <xsl:text> .x-prclist1-1-0 {margin-left: 0pt; margin-right: 0pt; text-indent: 0pt; margin-top: 8pt; }</xsl:text>
   </xsl:template>

   <!--Template for Context: prclist1-->
<xsl:template match="prclist1" priority="0">
      <div><!--Emit class values to reflect conditions--><xsl:attribute name="class">
            <xsl:text> x-prclist1-1-0</xsl:text>
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

   <!--Gentext template for Context: prclist1-->
<xsl:template match="prclist1" mode="expand-gentext" priority="0">
      <xsl:copy>
         <xsl:apply-templates select="@*|node()" mode="expand-gentext"/>
      </xsl:copy>
   </xsl:template>

   <!--Initial pass template for Context: prclist1-->
<xsl:template match="prclist1" mode="initial-pass-mode" priority="0">
      <xsl:copy>
         <xsl:call-template name="maybe-set-gte-id"/>
         <xsl:apply-templates select="@*|node()" mode="initial-pass-mode"/>
      </xsl:copy>
   </xsl:template>

   <!--Set count-as pass template for Context: prclist1-->
<xsl:template match="prclist1" mode="set-countas" priority="0">
      <xsl:copy>
         <xsl:apply-templates select="@*|node()" mode="set-countas"/>
      </xsl:copy>
   </xsl:template>

   <!--Set ch:chunk template for Context: prclist1-->
<xsl:template match="prclist1" mode="set-ch-chunk" priority="0">
      <xsl:copy>
         <xsl:if test="not(@_gte:did-set-chunk)">
            <xsl:attribute name="_gte:did-set-chunk">yes</xsl:attribute>
         </xsl:if>
         <xsl:apply-templates select="@*|node()" mode="set-ch-chunk"/>
      </xsl:copy>
   </xsl:template>

   <!--Style template for Context: prclist2-->
<xsl:template name="__style-for_prclist2.1">
      <xsl:text> .x-prclist2-1-0 {margin-left: 0pt; margin-right: 0pt; text-indent: 0pt; margin-top: 8pt; margin-left: 18pt; text-indent: 0pt; }</xsl:text>
   </xsl:template>

   <!--Template for Context: prclist2-->
<xsl:template match="prclist2" priority="0">
      <div><!--Emit class values to reflect conditions--><xsl:attribute name="class">
            <xsl:text> x-prclist2-1-0</xsl:text>
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

   <!--Gentext template for Context: prclist2-->
<xsl:template match="prclist2" mode="expand-gentext" priority="0">
      <xsl:copy>
         <xsl:apply-templates select="@*|node()" mode="expand-gentext"/>
      </xsl:copy>
   </xsl:template>

   <!--Initial pass template for Context: prclist2-->
<xsl:template match="prclist2" mode="initial-pass-mode" priority="0">
      <xsl:copy>
         <xsl:call-template name="maybe-set-gte-id"/>
         <xsl:apply-templates select="@*|node()" mode="initial-pass-mode"/>
      </xsl:copy>
   </xsl:template>

   <!--Set count-as pass template for Context: prclist2-->
<xsl:template match="prclist2" mode="set-countas" priority="0">
      <xsl:copy>
         <xsl:apply-templates select="@*|node()" mode="set-countas"/>
      </xsl:copy>
   </xsl:template>

   <!--Set ch:chunk template for Context: prclist2-->
<xsl:template match="prclist2" mode="set-ch-chunk" priority="0">
      <xsl:copy>
         <xsl:if test="not(@_gte:did-set-chunk)">
            <xsl:attribute name="_gte:did-set-chunk">yes</xsl:attribute>
         </xsl:if>
         <xsl:apply-templates select="@*|node()" mode="set-ch-chunk"/>
      </xsl:copy>
   </xsl:template>

   <!--Style template for Context: prclist3-->
<xsl:template name="__style-for_prclist3.1">
      <xsl:text> .x-prclist3-1-0 {margin-left: 0pt; margin-right: 0pt; text-indent: 0pt; margin-top: 8pt; margin-left: 18pt; text-indent: 0pt; }</xsl:text>
   </xsl:template>

   <!--Template for Context: prclist3-->
<xsl:template match="prclist3" priority="0">
      <div><!--Emit class values to reflect conditions--><xsl:attribute name="class">
            <xsl:text> x-prclist3-1-0</xsl:text>
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

   <!--Gentext template for Context: prclist3-->
<xsl:template match="prclist3" mode="expand-gentext" priority="0">
      <xsl:copy>
         <xsl:apply-templates select="@*|node()" mode="expand-gentext"/>
      </xsl:copy>
   </xsl:template>

   <!--Initial pass template for Context: prclist3-->
<xsl:template match="prclist3" mode="initial-pass-mode" priority="0">
      <xsl:copy>
         <xsl:call-template name="maybe-set-gte-id"/>
         <xsl:apply-templates select="@*|node()" mode="initial-pass-mode"/>
      </xsl:copy>
   </xsl:template>

   <!--Set count-as pass template for Context: prclist3-->
<xsl:template match="prclist3" mode="set-countas" priority="0">
      <xsl:copy>
         <xsl:apply-templates select="@*|node()" mode="set-countas"/>
      </xsl:copy>
   </xsl:template>

   <!--Set ch:chunk template for Context: prclist3-->
<xsl:template match="prclist3" mode="set-ch-chunk" priority="0">
      <xsl:copy>
         <xsl:if test="not(@_gte:did-set-chunk)">
            <xsl:attribute name="_gte:did-set-chunk">yes</xsl:attribute>
         </xsl:if>
         <xsl:apply-templates select="@*|node()" mode="set-ch-chunk"/>
      </xsl:copy>
   </xsl:template>

   <!--Style template for Context: prclist4-->
<xsl:template name="__style-for_prclist4.1">
      <xsl:text> .x-prclist4-1-0 {margin-left: 0pt; margin-right: 0pt; text-indent: 0pt; margin-top: 8pt; }</xsl:text>
   </xsl:template>

   <!--Template for Context: prclist4-->
<xsl:template match="prclist4" priority="0">
      <div><!--Emit class values to reflect conditions--><xsl:attribute name="class">
            <xsl:text> x-prclist4-1-0</xsl:text>
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

   <!--Gentext template for Context: prclist4-->
<xsl:template match="prclist4" mode="expand-gentext" priority="0">
      <xsl:copy>
         <xsl:apply-templates select="@*|node()" mode="expand-gentext"/>
      </xsl:copy>
   </xsl:template>

   <!--Initial pass template for Context: prclist4-->
<xsl:template match="prclist4" mode="initial-pass-mode" priority="0">
      <xsl:copy>
         <xsl:call-template name="maybe-set-gte-id"/>
         <xsl:apply-templates select="@*|node()" mode="initial-pass-mode"/>
      </xsl:copy>
   </xsl:template>

   <!--Set count-as pass template for Context: prclist4-->
<xsl:template match="prclist4" mode="set-countas" priority="0">
      <xsl:copy>
         <xsl:apply-templates select="@*|node()" mode="set-countas"/>
      </xsl:copy>
   </xsl:template>

   <!--Set ch:chunk template for Context: prclist4-->
<xsl:template match="prclist4" mode="set-ch-chunk" priority="0">
      <xsl:copy>
         <xsl:if test="not(@_gte:did-set-chunk)">
            <xsl:attribute name="_gte:did-set-chunk">yes</xsl:attribute>
         </xsl:if>
         <xsl:apply-templates select="@*|node()" mode="set-ch-chunk"/>
      </xsl:copy>
   </xsl:template>

   <!--Style template for Context: prclist5-->
<xsl:template name="__style-for_prclist5.1">
      <xsl:text> .x-prclist5-1-0 {margin-left: 0pt; margin-right: 0pt; }</xsl:text>
   </xsl:template>

   <!--Template for Context: prclist5-->
<xsl:template match="prclist5" priority="0"><!--Emit a nostyle template--><xsl:apply-templates/>
   </xsl:template>

   <!--Gentext template for Context: prclist5-->
<xsl:template match="prclist5" mode="expand-gentext" priority="0">
      <xsl:copy>
         <xsl:apply-templates select="@*|node()" mode="expand-gentext"/>
      </xsl:copy>
   </xsl:template>

   <!--Initial pass template for Context: prclist5-->
<xsl:template match="prclist5" mode="initial-pass-mode" priority="0">
      <xsl:copy>
         <xsl:call-template name="maybe-set-gte-id"/>
         <xsl:apply-templates select="@*|node()" mode="initial-pass-mode"/>
      </xsl:copy>
   </xsl:template>

   <!--Set count-as pass template for Context: prclist5-->
<xsl:template match="prclist5" mode="set-countas" priority="0">
      <xsl:copy>
         <xsl:apply-templates select="@*|node()" mode="set-countas"/>
      </xsl:copy>
   </xsl:template>

   <!--Set ch:chunk template for Context: prclist5-->
<xsl:template match="prclist5" mode="set-ch-chunk" priority="0">
      <xsl:copy>
         <xsl:if test="not(@_gte:did-set-chunk)">
            <xsl:attribute name="_gte:did-set-chunk">yes</xsl:attribute>
         </xsl:if>
         <xsl:apply-templates select="@*|node()" mode="set-ch-chunk"/>
      </xsl:copy>
   </xsl:template>

   <!--Style template for Context: prclist6-->
<xsl:template name="__style-for_prclist6.1">
      <xsl:text> .x-prclist6-1-0 {margin-left: 0pt; margin-right: 0pt; }</xsl:text>
   </xsl:template>

   <!--Template for Context: prclist6-->
<xsl:template match="prclist6" priority="0"><!--Emit a nostyle template--><xsl:apply-templates/>
   </xsl:template>

   <!--Gentext template for Context: prclist6-->
<xsl:template match="prclist6" mode="expand-gentext" priority="0">
      <xsl:copy>
         <xsl:apply-templates select="@*|node()" mode="expand-gentext"/>
      </xsl:copy>
   </xsl:template>

   <!--Initial pass template for Context: prclist6-->
<xsl:template match="prclist6" mode="initial-pass-mode" priority="0">
      <xsl:copy>
         <xsl:call-template name="maybe-set-gte-id"/>
         <xsl:apply-templates select="@*|node()" mode="initial-pass-mode"/>
      </xsl:copy>
   </xsl:template>

   <!--Set count-as pass template for Context: prclist6-->
<xsl:template match="prclist6" mode="set-countas" priority="0">
      <xsl:copy>
         <xsl:apply-templates select="@*|node()" mode="set-countas"/>
      </xsl:copy>
   </xsl:template>

   <!--Set ch:chunk template for Context: prclist6-->
<xsl:template match="prclist6" mode="set-ch-chunk" priority="0">
      <xsl:copy>
         <xsl:if test="not(@_gte:did-set-chunk)">
            <xsl:attribute name="_gte:did-set-chunk">yes</xsl:attribute>
         </xsl:if>
         <xsl:apply-templates select="@*|node()" mode="set-ch-chunk"/>
      </xsl:copy>
   </xsl:template>

   <!--Style template for Context: prclist7-->
<xsl:template name="__style-for_prclist7.1">
      <xsl:text> .x-prclist7-1-0 {margin-left: 0pt; margin-right: 0pt; }</xsl:text>
   </xsl:template>

   <!--Template for Context: prclist7-->
<xsl:template match="prclist7" priority="0"><!--Emit a nostyle template--><xsl:apply-templates/>
   </xsl:template>

   <!--Gentext template for Context: prclist7-->
<xsl:template match="prclist7" mode="expand-gentext" priority="0">
      <xsl:copy>
         <xsl:apply-templates select="@*|node()" mode="expand-gentext"/>
      </xsl:copy>
   </xsl:template>

   <!--Initial pass template for Context: prclist7-->
<xsl:template match="prclist7" mode="initial-pass-mode" priority="0">
      <xsl:copy>
         <xsl:call-template name="maybe-set-gte-id"/>
         <xsl:apply-templates select="@*|node()" mode="initial-pass-mode"/>
      </xsl:copy>
   </xsl:template>

   <!--Set count-as pass template for Context: prclist7-->
<xsl:template match="prclist7" mode="set-countas" priority="0">
      <xsl:copy>
         <xsl:apply-templates select="@*|node()" mode="set-countas"/>
      </xsl:copy>
   </xsl:template>

   <!--Set ch:chunk template for Context: prclist7-->
<xsl:template match="prclist7" mode="set-ch-chunk" priority="0">
      <xsl:copy>
         <xsl:if test="not(@_gte:did-set-chunk)">
            <xsl:attribute name="_gte:did-set-chunk">yes</xsl:attribute>
         </xsl:if>
         <xsl:apply-templates select="@*|node()" mode="set-ch-chunk"/>
      </xsl:copy>
   </xsl:template>

   <!--Style template for Context: print-module-->
<xsl:template name="__style-for_print-module.1">
      <xsl:text> .x-print-module-1-0 {margin-left: 0pt; margin-right: 0pt; }</xsl:text>
   </xsl:template>

   <!--Template for Context: print-module-->
<xsl:template match="print-module" priority="0"><!--Emit a nostyle template--><xsl:apply-templates/>
   </xsl:template>

   <!--Gentext template for Context: print-module-->
<xsl:template match="print-module" mode="expand-gentext" priority="0">
      <xsl:copy>
         <xsl:apply-templates select="@*|node()" mode="expand-gentext"/>
      </xsl:copy>
   </xsl:template>

   <!--Initial pass template for Context: print-module-->
<xsl:template match="print-module" mode="initial-pass-mode" priority="0">
      <xsl:copy>
         <xsl:call-template name="maybe-set-gte-id"/>
         <xsl:apply-templates select="@*|node()" mode="initial-pass-mode"/>
      </xsl:copy>
   </xsl:template>

   <!--Set count-as pass template for Context: print-module-->
<xsl:template match="print-module" mode="set-countas" priority="0">
      <xsl:copy>
         <xsl:apply-templates select="@*|node()" mode="set-countas"/>
      </xsl:copy>
   </xsl:template>

   <!--Set ch:chunk template for Context: print-module-->
<xsl:template match="print-module" mode="set-ch-chunk" priority="0">
      <xsl:copy>
         <xsl:if test="not(@_gte:did-set-chunk)">
            <xsl:attribute name="_gte:did-set-chunk">yes</xsl:attribute>
         </xsl:if>
         <xsl:apply-templates select="@*|node()" mode="set-ch-chunk"/>
      </xsl:copy>
   </xsl:template>

   <!--Style template for Context: print-unit-->
<xsl:template name="__style-for_print-unit.1">
      <xsl:text> .x-print-unit-1-0 {margin-left: 0pt; margin-right: 0pt; }</xsl:text>
   </xsl:template>

   <!--Template for Context: print-unit-->
<xsl:template match="print-unit" priority="0"><!--Emit a nostyle template--><xsl:apply-templates/>
   </xsl:template>

   <!--Gentext template for Context: print-unit-->
<xsl:template match="print-unit" mode="expand-gentext" priority="0">
      <xsl:copy>
         <xsl:apply-templates select="@*|node()" mode="expand-gentext"/>
      </xsl:copy>
   </xsl:template>

   <!--Initial pass template for Context: print-unit-->
<xsl:template match="print-unit" mode="initial-pass-mode" priority="0">
      <xsl:copy>
         <xsl:call-template name="maybe-set-gte-id"/>
         <xsl:apply-templates select="@*|node()" mode="initial-pass-mode"/>
      </xsl:copy>
   </xsl:template>

   <!--Set count-as pass template for Context: print-unit-->
<xsl:template match="print-unit" mode="set-countas" priority="0">
      <xsl:copy>
         <xsl:apply-templates select="@*|node()" mode="set-countas"/>
      </xsl:copy>
   </xsl:template>

   <!--Set ch:chunk template for Context: print-unit-->
<xsl:template match="print-unit" mode="set-ch-chunk" priority="0">
      <xsl:copy>
         <xsl:if test="not(@_gte:did-set-chunk)">
            <xsl:attribute name="_gte:did-set-chunk">yes</xsl:attribute>
         </xsl:if>
         <xsl:apply-templates select="@*|node()" mode="set-ch-chunk"/>
      </xsl:copy>
   </xsl:template>

   <!--Style template for Context: pwc-awl-->
<xsl:template name="__style-for_pwc-awl.1">
      <xsl:text> .x-pwc-awl-1-0 {margin-left: 0pt; margin-right: 0pt; }</xsl:text>
   </xsl:template>

   <!--Template for Context: pwc-awl-->
<xsl:template match="pwc-awl" priority="0"><!--Emit a nostyle template--><xsl:apply-templates/>
   </xsl:template>

   <!--Gentext template for Context: pwc-awl-->
<xsl:template match="pwc-awl" mode="expand-gentext" priority="0">
      <xsl:copy>
         <xsl:apply-templates select="@*|node()" mode="expand-gentext"/>
      </xsl:copy>
   </xsl:template>

   <!--Initial pass template for Context: pwc-awl-->
<xsl:template match="pwc-awl" mode="initial-pass-mode" priority="0">
      <xsl:copy>
         <xsl:call-template name="maybe-set-gte-id"/>
         <xsl:apply-templates select="@*|node()" mode="initial-pass-mode"/>
      </xsl:copy>
   </xsl:template>

   <!--Set count-as pass template for Context: pwc-awl-->
<xsl:template match="pwc-awl" mode="set-countas" priority="0">
      <xsl:copy>
         <xsl:apply-templates select="@*|node()" mode="set-countas"/>
      </xsl:copy>
   </xsl:template>

   <!--Set ch:chunk template for Context: pwc-awl-->
<xsl:template match="pwc-awl" mode="set-ch-chunk" priority="0">
      <xsl:copy>
         <xsl:if test="not(@_gte:did-set-chunk)">
            <xsl:attribute name="_gte:did-set-chunk">yes</xsl:attribute>
         </xsl:if>
         <xsl:apply-templates select="@*|node()" mode="set-ch-chunk"/>
      </xsl:copy>
   </xsl:template>

   <!--Style template for Context: pwc-cgp-stmnt-->
<xsl:template name="__style-for_pwc-cgp-stmnt.1">
      <xsl:text> .x-pwc-cgp-stmnt-1-0 {margin-left: 0pt; margin-right: 0pt; text-indent: 0pt; font-size: 10pt; margin-top: 10pt; margin-bottom: 10pt; }</xsl:text>
   </xsl:template>

   <!--Template for Context: pwc-cgp-stmnt-->
<xsl:template match="pwc-cgp-stmnt" priority="0">
      <div><!--Emit class values to reflect conditions--><xsl:attribute name="class">
            <xsl:text> x-pwc-cgp-stmnt-1-0</xsl:text>
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

   <!--Gentext template for Context: pwc-cgp-stmnt-->
<xsl:template match="pwc-cgp-stmnt" mode="expand-gentext" priority="0">
      <xsl:copy>
         <xsl:apply-templates select="@*|node()" mode="expand-gentext"/>
      </xsl:copy>
   </xsl:template>

   <!--Initial pass template for Context: pwc-cgp-stmnt-->
<xsl:template match="pwc-cgp-stmnt" mode="initial-pass-mode" priority="0">
      <xsl:copy>
         <xsl:call-template name="maybe-set-gte-id"/>
         <xsl:apply-templates select="@*|node()" mode="initial-pass-mode"/>
      </xsl:copy>
   </xsl:template>

   <!--Set count-as pass template for Context: pwc-cgp-stmnt-->
<xsl:template match="pwc-cgp-stmnt" mode="set-countas" priority="0">
      <xsl:copy>
         <xsl:apply-templates select="@*|node()" mode="set-countas"/>
      </xsl:copy>
   </xsl:template>

   <!--Set ch:chunk template for Context: pwc-cgp-stmnt-->
<xsl:template match="pwc-cgp-stmnt" mode="set-ch-chunk" priority="0">
      <xsl:copy>
         <xsl:if test="not(@_gte:did-set-chunk)">
            <xsl:attribute name="_gte:did-set-chunk">yes</xsl:attribute>
         </xsl:if>
         <xsl:apply-templates select="@*|node()" mode="set-ch-chunk"/>
      </xsl:copy>
   </xsl:template>

   <!--Style template for Context: pwccallout-->
<xsl:template name="__style-for_pwccallout.1">
      <xsl:text> .x-pwccallout-1-0 {margin-left: 0pt; margin-right: 0pt; }</xsl:text>
   </xsl:template>

   <!--Template for Context: pwccallout-->
<xsl:template match="pwccallout" priority="0">
      <span><!--Emit class values to reflect conditions--><xsl:attribute name="class">
            <xsl:text> x-pwccallout-1-0</xsl:text>
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

   <!--Gentext template for Context: pwccallout-->
<xsl:template match="pwccallout" mode="expand-gentext" priority="0">
      <xsl:copy>
         <xsl:apply-templates select="@*|node()" mode="expand-gentext"/>
      </xsl:copy>
   </xsl:template>

   <!--Initial pass template for Context: pwccallout-->
<xsl:template match="pwccallout" mode="initial-pass-mode" priority="0">
      <xsl:copy>
         <xsl:call-template name="maybe-set-gte-id"/>
         <xsl:apply-templates select="@*|node()" mode="initial-pass-mode"/>
      </xsl:copy>
   </xsl:template>

   <!--Set count-as pass template for Context: pwccallout-->
<xsl:template match="pwccallout" mode="set-countas" priority="0">
      <xsl:copy>
         <xsl:apply-templates select="@*|node()" mode="set-countas"/>
      </xsl:copy>
   </xsl:template>

   <!--Set ch:chunk template for Context: pwccallout-->
<xsl:template match="pwccallout" mode="set-ch-chunk" priority="0">
      <xsl:copy>
         <xsl:if test="not(@_gte:did-set-chunk)">
            <xsl:attribute name="_gte:did-set-chunk">yes</xsl:attribute>
         </xsl:if>
         <xsl:apply-templates select="@*|node()" mode="set-ch-chunk"/>
      </xsl:copy>
   </xsl:template>

   <!--Style template for Context: pwcchapsect-->
<xsl:template name="__style-for_pwcchapsect.1">
      <xsl:text> .x-pwcchapsect-1-0 {margin-left: 0pt; margin-right: 0pt; text-indent: 0pt; }</xsl:text>
   </xsl:template>

   <!--Template for Context: pwcchapsect-->
<xsl:template match="pwcchapsect" priority="0">
      <div><!--Emit class values to reflect conditions--><xsl:attribute name="class">
            <xsl:text> x-pwcchapsect-1-0</xsl:text>
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

   <!--Gentext template for Context: pwcchapsect-->
<xsl:template match="pwcchapsect" mode="expand-gentext" priority="0">
      <xsl:copy>
         <xsl:apply-templates select="@*|node()" mode="expand-gentext"/>
      </xsl:copy>
   </xsl:template>

   <!--Initial pass template for Context: pwcchapsect-->
<xsl:template match="pwcchapsect" mode="initial-pass-mode" priority="0">
      <xsl:copy>
         <xsl:call-template name="maybe-set-gte-id"/>
         <xsl:apply-templates select="@*|node()" mode="initial-pass-mode"/>
      </xsl:copy>
   </xsl:template>

   <!--Set count-as pass template for Context: pwcchapsect-->
<xsl:template match="pwcchapsect" mode="set-countas" priority="0">
      <xsl:copy>
         <xsl:apply-templates select="@*|node()" mode="set-countas"/>
      </xsl:copy>
   </xsl:template>

   <!--DefList Term Template for pwcchapsect-->
<xsl:template match="pwcchapsect-list//pwcchapsect-item/pwcchapsect" priority="101">
      <dt><!--Emit class values to reflect conditions--><xsl:attribute name="class">
            <xsl:if test="name(..)='ics' or name(..)='pwcchapsect-item' or name(..)='pwcspbdata' or name(..)='sbdata' or name(..)='spbnbr'">
               <xsl:text/>
               <xsl:text>x-</xsl:text>
               <xsl:value-of select="string(translate(name(..),':._','---'))"/>
               <xsl:text>-1-0</xsl:text>
            </xsl:if>
            <xsl:text> x-pwcchapsect-1-0</xsl:text>
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
      </dt>
   </xsl:template>

   <!--Set ch:chunk template for Context: pwcchapsect-->
<xsl:template match="pwcchapsect" mode="set-ch-chunk" priority="0">
      <xsl:copy>
         <xsl:if test="not(@_gte:did-set-chunk)">
            <xsl:attribute name="_gte:did-set-chunk">yes</xsl:attribute>
         </xsl:if>
         <xsl:apply-templates select="@*|node()" mode="set-ch-chunk"/>
      </xsl:copy>
   </xsl:template>

   <!--Style template for Context: pwcchapsect-item-->
<xsl:template name="__style-for_pwcchapsect-item.1">
      <xsl:text> .x-pwcchapsect-item-1-0 {margin-left: 0pt; margin-right: 0pt; text-indent: 0pt; margin-top: 6pt; margin-bottom: 6pt; }</xsl:text>
   </xsl:template>

   <!--Template for Context: pwcchapsect-item-->
<xsl:template match="pwcchapsect-item" priority="0">
      <xsl:variable name="foClass">definitionListItem</xsl:variable>
      <xsl:variable name="blockness">block</xsl:variable>
      <xsl:variable name="startnew"/>
      <xsl:variable name="newpageset">#noChange</xsl:variable>
      <xsl:apply-templates/>
   </xsl:template>

   <!--Gentext template for Context: pwcchapsect-item-->
<xsl:template match="pwcchapsect-item" mode="expand-gentext" priority="0">
      <xsl:copy>
         <xsl:apply-templates select="@*|node()" mode="expand-gentext"/>
      </xsl:copy>
   </xsl:template>

   <!--Initial pass template for Context: pwcchapsect-item-->
<xsl:template match="pwcchapsect-item" mode="initial-pass-mode" priority="0">
      <xsl:copy>
         <xsl:call-template name="maybe-set-gte-id"/>
         <xsl:apply-templates select="@*|node()" mode="initial-pass-mode"/>
      </xsl:copy>
   </xsl:template>

   <!--Set count-as pass template for Context: pwcchapsect-item-->
<xsl:template match="pwcchapsect-item" mode="set-countas" priority="0">
      <xsl:copy>
         <xsl:apply-templates select="@*|node()" mode="set-countas"/>
      </xsl:copy>
   </xsl:template>

   <!--Set ch:chunk template for Context: pwcchapsect-item-->
<xsl:template match="pwcchapsect-item" mode="set-ch-chunk" priority="0">
      <xsl:copy>
         <xsl:if test="not(@_gte:did-set-chunk)">
            <xsl:attribute name="_gte:did-set-chunk">yes</xsl:attribute>
         </xsl:if>
         <xsl:apply-templates select="@*|node()" mode="set-ch-chunk"/>
      </xsl:copy>
   </xsl:template>

   <!--Style template for Context: pwcchapsect-list-->
<xsl:template name="__style-for_pwcchapsect-list.1">
      <xsl:text> .x-pwcchapsect-list-1-0 {margin-left: 0pt; margin-right: 0pt; text-indent: 0pt; margin-top: 8pt; }</xsl:text>
   </xsl:template>

   <!--Template for Context: pwcchapsect-list-->
<xsl:template match="pwcchapsect-list" priority="0">
      <div>
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
         <xsl:apply-templates select="_sfe:BeforeOrAfterText[not(preceding-sibling::*)]"/>
         <xsl:apply-templates select="pageblock-title"/>
         <dl><!--Emit class values to reflect conditions--><xsl:attribute name="class">
               <xsl:text> x-pwcchapsect-list-1-0</xsl:text>
            </xsl:attribute>
            <xsl:call-template name="maybe-set-id"/>
            <!--Process this element's content--><xsl:apply-templates select="pwcchapsect-item|pwcchapsect"/>
         </dl>
         <xsl:apply-templates select="*[not(self::_sfe:BeforeOrAfterText|self::pageblock-title|self::pwcchapsect-item|self::pwcchapsect|self::title)]"/>
         <xsl:apply-templates select="_sfe:BeforeOrAfterText[not(following-sibling::*)][preceding-sibling::*]"/>
      </div>
   </xsl:template>

   <!--Gentext template for Context: pwcchapsect-list-->
<xsl:template match="pwcchapsect-list" mode="expand-gentext" priority="0">
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
               <_ufe:chapsect-title/>
            </_sfe:BeforeOrAfterText>
         </xsl:if>
         <xsl:apply-templates select="* | text() | processing-instruction()" mode="expand-gentext"/>
      </xsl:copy>
   </xsl:template>

   <!--Initial pass template for Context: pwcchapsect-list-->
<xsl:template match="pwcchapsect-list" mode="initial-pass-mode" priority="0">
      <xsl:copy>
         <xsl:call-template name="maybe-set-gte-id"/>
         <xsl:apply-templates select="@*|node()" mode="initial-pass-mode"/>
      </xsl:copy>
   </xsl:template>

   <!--Set count-as pass template for Context: pwcchapsect-list-->
<xsl:template match="pwcchapsect-list" mode="set-countas" priority="0">
      <xsl:copy>
         <xsl:apply-templates select="@*|node()" mode="set-countas"/>
      </xsl:copy>
   </xsl:template>

   <!--Set ch:chunk template for Context: pwcchapsect-list-->
<xsl:template match="pwcchapsect-list" mode="set-ch-chunk" priority="0">
      <xsl:copy>
         <xsl:if test="not(@_gte:did-set-chunk)">
            <xsl:attribute name="_gte:did-set-chunk">yes</xsl:attribute>
         </xsl:if>
         <xsl:apply-templates select="@*|node()" mode="set-ch-chunk"/>
      </xsl:copy>
   </xsl:template>

   <!--Style template for Context: pwccss-->
<xsl:template name="__style-for_pwccss.1">
      <xsl:text> .x-pwccss-1-0 {margin-left: 0pt; margin-right: 0pt; text-indent: 0pt; }</xsl:text>
   </xsl:template>

   <!--Template for Context: pwccss-->
<xsl:template match="pwccss" priority="0">
      <div><!--Emit class values to reflect conditions--><xsl:attribute name="class">
            <xsl:text> x-pwccss-1-0</xsl:text>
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

   <!--Gentext template for Context: pwccss-->
<xsl:template match="pwccss" mode="expand-gentext" priority="0">
      <xsl:copy>
         <xsl:apply-templates select="@*|node()" mode="expand-gentext"/>
      </xsl:copy>
   </xsl:template>

   <!--Initial pass template for Context: pwccss-->
<xsl:template match="pwccss" mode="initial-pass-mode" priority="0">
      <xsl:copy>
         <xsl:call-template name="maybe-set-gte-id"/>
         <xsl:apply-templates select="@*|node()" mode="initial-pass-mode"/>
      </xsl:copy>
   </xsl:template>

   <!--Set count-as pass template for Context: pwccss-->
<xsl:template match="pwccss" mode="set-countas" priority="0">
      <xsl:copy>
         <xsl:apply-templates select="@*|node()" mode="set-countas"/>
      </xsl:copy>
   </xsl:template>

   <!--Set ch:chunk template for Context: pwccss-->
<xsl:template match="pwccss" mode="set-ch-chunk" priority="0">
      <xsl:copy>
         <xsl:if test="not(@_gte:did-set-chunk)">
            <xsl:attribute name="_gte:did-set-chunk">yes</xsl:attribute>
         </xsl:if>
         <xsl:apply-templates select="@*|node()" mode="set-ch-chunk"/>
      </xsl:copy>
   </xsl:template>

   <!--Style template for Context: pwcem-apu-title-->
<xsl:template name="__style-for_pwcem-apu-title.1">
      <xsl:text> .x-pwcem-apu-title-1-0 {margin-left: 0pt; margin-right: 0pt; }</xsl:text>
   </xsl:template>

   <!--Template for Context: pwcem-apu-title-->
<xsl:template match="pwcem-apu-title" priority="0"><!--Emit a nostyle template--><xsl:apply-templates/>
   </xsl:template>

   <!--Gentext template for Context: pwcem-apu-title-->
<xsl:template match="pwcem-apu-title" mode="expand-gentext" priority="0">
      <xsl:copy>
         <xsl:apply-templates select="@*|node()" mode="expand-gentext"/>
      </xsl:copy>
   </xsl:template>

   <!--Initial pass template for Context: pwcem-apu-title-->
<xsl:template match="pwcem-apu-title" mode="initial-pass-mode" priority="0">
      <xsl:copy>
         <xsl:call-template name="maybe-set-gte-id"/>
         <xsl:apply-templates select="@*|node()" mode="initial-pass-mode"/>
      </xsl:copy>
   </xsl:template>

   <!--Set count-as pass template for Context: pwcem-apu-title-->
<xsl:template match="pwcem-apu-title" mode="set-countas" priority="0">
      <xsl:copy>
         <xsl:apply-templates select="@*|node()" mode="set-countas"/>
      </xsl:copy>
   </xsl:template>

   <!--Set ch:chunk template for Context: pwcem-apu-title-->
<xsl:template match="pwcem-apu-title" mode="set-ch-chunk" priority="0">
      <xsl:copy>
         <xsl:if test="not(@_gte:did-set-chunk)">
            <xsl:attribute name="_gte:did-set-chunk">yes</xsl:attribute>
         </xsl:if>
         <xsl:apply-templates select="@*|node()" mode="set-ch-chunk"/>
      </xsl:copy>
   </xsl:template>

   <!--Style template for Context: pwcem-title-->
<xsl:template name="__style-for_pwcem-title.1">
      <xsl:text> .x-pwcem-title-1-0 {margin-left: 0pt; margin-right: 0pt; text-indent: 0pt; font-weight: bold; font-size: 24pt; text-align: center; }</xsl:text>
   </xsl:template>

   <!--Template for Context: pwcem-title-->
<xsl:template match="pwcem-title" priority="0">
      <div><!--Emit class values to reflect conditions--><xsl:attribute name="class">
            <xsl:text> x-pwcem-title-1-0</xsl:text>
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

   <!--Gentext template for Context: pwcem-title-->
<xsl:template match="pwcem-title" mode="expand-gentext" priority="0">
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
               <_ufe:engine-type>
                  <xsl:if test="string(./@enginetype)">
                     <xsl:attribute name="enginetype">
                        <xsl:value-of select="string(./@enginetype)"/>
                     </xsl:attribute>
                  </xsl:if>
               </_ufe:engine-type>
               <_ufe:title-block>
                  <xsl:text>MODEL(S)</xsl:text>
               </_ufe:title-block>
               <_ufe:title-block>
                  <xsl:value-of select="@model"/>
                  <xsl:text> ENGINES</xsl:text>
               </_ufe:title-block>
               <span style="font-size: 11pt; font-weight: normal; ">
                  <xsl:if test="(ancestor-or-self::pwcem-title[1]//statement)[1]/*|(ancestor-or-self::pwcem-title[1]//statement)[1]/text()|(ancestor-or-self::pwcem-title[1]//statement)[1]/processing-instruction()">
                     <_gte:Gentexted-Content-Wrapper>
                        <xsl:apply-templates mode="expand-gentext"
                                             select="(ancestor-or-self::pwcem-title[1]//statement)[1]/*|(ancestor-or-self::pwcem-title[1]//statement)[1]/text()|(ancestor-or-self::pwcem-title[1]//statement)[1]/processing-instruction()">
                           <xsl:with-param name="skip-expanded-gentext" select="'yes'"/>
                        </xsl:apply-templates>
                     </_gte:Gentexted-Content-Wrapper>
                  </xsl:if>
               </span>
               <_ufe:title-block>
                  <xsl:text>Manual Part No. </xsl:text>
                  <xsl:value-of select="@docnbr"/>
               </_ufe:title-block>
               <_ufe:title-block>
                  <xsl:text>Issued </xsl:text>
                  <xsl:value-of select="@oidate"/>
               </_ufe:title-block>
            </_sfe:BeforeOrAfterText>
         </xsl:if>
         <xsl:apply-templates select="* | text() | processing-instruction()" mode="expand-gentext"/>
         <!--Unconditional AddAfter--><xsl:if test="not(@_gte:Gentext-Expanded)">
            <_gte:Must-Expand-Gentext/>
            <_sfe:BeforeOrAfterText>
               <_ufe:proprietary-notice/>
            </_sfe:BeforeOrAfterText>
         </xsl:if>
      </xsl:copy>
   </xsl:template>

   <!--Initial pass template for Context: pwcem-title-->
<xsl:template match="pwcem-title" mode="initial-pass-mode" priority="0">
      <xsl:copy>
         <xsl:call-template name="maybe-set-gte-id"/>
         <xsl:apply-templates select="@*|node()" mode="initial-pass-mode"/>
      </xsl:copy>
   </xsl:template>

   <!--Set count-as pass template for Context: pwcem-title-->
<xsl:template match="pwcem-title" mode="set-countas" priority="0">
      <xsl:copy>
         <xsl:apply-templates select="@*|node()" mode="set-countas"/>
      </xsl:copy>
   </xsl:template>

   <!--Set ch:chunk template for Context: pwcem-title-->
<xsl:template match="pwcem-title" mode="set-ch-chunk" priority="0">
      <xsl:copy>
         <xsl:if test="not(@_gte:did-set-chunk)">
            <xsl:attribute name="_gte:did-set-chunk">yes</xsl:attribute>
         </xsl:if>
         <xsl:apply-templates select="@*|node()" mode="set-ch-chunk"/>
      </xsl:copy>
   </xsl:template>

   <!--Style template for Context: pwcemtask-->
<xsl:template name="__style-for_pwcemtask.1">
      <xsl:text> .x-pwcemtask-1-0 {margin-left: 0pt; margin-right: 0pt; }</xsl:text>
   </xsl:template>

   <!--Template for Context: pwcemtask-->
<xsl:template match="pwcemtask" priority="0"><!--Emit a nostyle template--><xsl:apply-templates/>
   </xsl:template>

   <!--Gentext template for Context: pwcemtask-->
<xsl:template match="pwcemtask" mode="expand-gentext" priority="0">
      <xsl:copy>
         <xsl:apply-templates select="@*|node()" mode="expand-gentext"/>
      </xsl:copy>
   </xsl:template>

   <!--Initial pass template for Context: pwcemtask-->
<xsl:template match="pwcemtask" mode="initial-pass-mode" priority="0">
      <xsl:copy>
         <xsl:call-template name="maybe-set-gte-id"/>
         <xsl:apply-templates select="@*|node()" mode="initial-pass-mode"/>
      </xsl:copy>
   </xsl:template>

   <!--Set count-as pass template for Context: pwcemtask-->
<xsl:template match="pwcemtask" mode="set-countas" priority="0">
      <xsl:copy>
         <xsl:apply-templates select="@*|node()" mode="set-countas"/>
      </xsl:copy>
   </xsl:template>

   <!--Set ch:chunk template for Context: pwcemtask-->
<xsl:template match="pwcemtask" mode="set-ch-chunk" priority="0">
      <xsl:copy>
         <xsl:if test="not(@_gte:did-set-chunk)">
            <xsl:attribute name="_gte:did-set-chunk">yes</xsl:attribute>
         </xsl:if>
         <xsl:apply-templates select="@*|node()" mode="set-ch-chunk"/>
      </xsl:copy>
   </xsl:template>

   <!--Style template for Context: pwclmm-title-->
<xsl:template name="__style-for_pwclmm-title.1">
      <xsl:text> .x-pwclmm-title-1-0 {margin-left: 0pt; margin-right: 0pt; text-indent: 0pt; font-weight: bold; font-size: 24pt; text-align: center; }</xsl:text>
   </xsl:template>

   <!--Template for Context: pwclmm-title-->
<xsl:template match="pwclmm-title" priority="0">
      <div><!--Emit class values to reflect conditions--><xsl:attribute name="class">
            <xsl:text> x-pwclmm-title-1-0</xsl:text>
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

   <!--Gentext template for Context: pwclmm-title-->
<xsl:template match="pwclmm-title" mode="expand-gentext" priority="0">
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
               <_ufe:engine-type>
                  <xsl:if test="string(./@enginetype)">
                     <xsl:attribute name="enginetype">
                        <xsl:value-of select="string(./@enginetype)"/>
                     </xsl:attribute>
                  </xsl:if>
               </_ufe:engine-type>
               <_ufe:title-block>
                  <xsl:text>MODEL(S)</xsl:text>
               </_ufe:title-block>
               <_ufe:title-block>
                  <xsl:value-of select="@model"/>
                  <xsl:text> ENGINES</xsl:text>
               </_ufe:title-block>
               <span style="font-size: 11pt; font-weight: normal; ">
                  <xsl:if test="(ancestor-or-self::pwcem-title[1]//statement)[1]/*|(ancestor-or-self::pwcem-title[1]//statement)[1]/text()|(ancestor-or-self::pwcem-title[1]//statement)[1]/processing-instruction()">
                     <_gte:Gentexted-Content-Wrapper>
                        <xsl:apply-templates mode="expand-gentext"
                                             select="(ancestor-or-self::pwcem-title[1]//statement)[1]/*|(ancestor-or-self::pwcem-title[1]//statement)[1]/text()|(ancestor-or-self::pwcem-title[1]//statement)[1]/processing-instruction()">
                           <xsl:with-param name="skip-expanded-gentext" select="'yes'"/>
                        </xsl:apply-templates>
                     </_gte:Gentexted-Content-Wrapper>
                  </xsl:if>
               </span>
               <_ufe:title-block>
                  <xsl:text>Manual Part No. </xsl:text>
                  <xsl:value-of select="@docnbr"/>
               </_ufe:title-block>
               <_ufe:title-block>
                  <xsl:text>Issued </xsl:text>
                  <xsl:value-of select="@oidate"/>
               </_ufe:title-block>
            </_sfe:BeforeOrAfterText>
         </xsl:if>
         <xsl:apply-templates select="* | text() | processing-instruction()" mode="expand-gentext"/>
         <!--Unconditional AddAfter--><xsl:if test="not(@_gte:Gentext-Expanded)">
            <_gte:Must-Expand-Gentext/>
            <_sfe:BeforeOrAfterText>
               <_ufe:proprietary-notice/>
            </_sfe:BeforeOrAfterText>
         </xsl:if>
      </xsl:copy>
   </xsl:template>

   <!--Initial pass template for Context: pwclmm-title-->
<xsl:template match="pwclmm-title" mode="initial-pass-mode" priority="0">
      <xsl:copy>
         <xsl:call-template name="maybe-set-gte-id"/>
         <xsl:apply-templates select="@*|node()" mode="initial-pass-mode"/>
      </xsl:copy>
   </xsl:template>

   <!--Set count-as pass template for Context: pwclmm-title-->
<xsl:template match="pwclmm-title" mode="set-countas" priority="0">
      <xsl:copy>
         <xsl:apply-templates select="@*|node()" mode="set-countas"/>
      </xsl:copy>
   </xsl:template>

   <!--Set ch:chunk template for Context: pwclmm-title-->
<xsl:template match="pwclmm-title" mode="set-ch-chunk" priority="0">
      <xsl:copy>
         <xsl:if test="not(@_gte:did-set-chunk)">
            <xsl:attribute name="_gte:did-set-chunk">yes</xsl:attribute>
         </xsl:if>
         <xsl:apply-templates select="@*|node()" mode="set-ch-chunk"/>
      </xsl:copy>
   </xsl:template>

   <!--Style template for Context: pwcni-->
<xsl:template name="__style-for_pwcni.1">
      <xsl:text> .x-pwcni-1-0 {margin-left: 0pt; margin-right: 0pt; text-indent: 0pt; margin-top: 8pt; }</xsl:text>
   </xsl:template>

   <!--Template for Context: pwcni-->
<xsl:template match="pwcni" priority="0">
      <div><!--Emit class values to reflect conditions--><xsl:attribute name="class">
            <xsl:text> x-pwcni-1-0</xsl:text>
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

   <!--Gentext template for Context: pwcni-->
<xsl:template match="pwcni" mode="expand-gentext" priority="0">
      <xsl:copy>
         <xsl:apply-templates select="@*|node()" mode="expand-gentext"/>
      </xsl:copy>
   </xsl:template>

   <!--Initial pass template for Context: pwcni-->
<xsl:template match="pwcni" mode="initial-pass-mode" priority="0">
      <xsl:copy>
         <xsl:call-template name="maybe-set-gte-id"/>
         <xsl:apply-templates select="@*|node()" mode="initial-pass-mode"/>
      </xsl:copy>
   </xsl:template>

   <!--Set count-as pass template for Context: pwcni-->
<xsl:template match="pwcni" mode="set-countas" priority="0">
      <xsl:copy>
         <xsl:apply-templates select="@*|node()" mode="set-countas"/>
      </xsl:copy>
   </xsl:template>

   <!--Set ch:chunk template for Context: pwcni-->
<xsl:template match="pwcni" mode="set-ch-chunk" priority="0">
      <xsl:copy>
         <xsl:if test="not(@_gte:did-set-chunk)">
            <xsl:attribute name="_gte:did-set-chunk">yes</xsl:attribute>
         </xsl:if>
         <xsl:apply-templates select="@*|node()" mode="set-ch-chunk"/>
      </xsl:copy>
   </xsl:template>

   <!--Style template for Context: pwcnitem-->
<xsl:template name="__style-for_pwcnitem.1">
      <xsl:text> .x-pwcnitem-1-0 {margin-left: 0pt; margin-right: 0pt; text-indent: 0pt; }</xsl:text>
   </xsl:template>

   <!--Template for Context: pwcnitem-->
<xsl:template match="pwcnitem" priority="0">
      <div><!--Emit class values to reflect conditions--><xsl:attribute name="class">
            <xsl:text> x-pwcnitem-1-0</xsl:text>
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

   <!--Gentext template for Context: pwcnitem-->
<xsl:template match="pwcnitem" mode="expand-gentext" priority="0">
      <xsl:copy>
         <xsl:apply-templates select="@*|node()" mode="expand-gentext"/>
      </xsl:copy>
   </xsl:template>

   <!--Initial pass template for Context: pwcnitem-->
<xsl:template match="pwcnitem" mode="initial-pass-mode" priority="0">
      <xsl:copy>
         <xsl:call-template name="maybe-set-gte-id"/>
         <xsl:apply-templates select="@*|node()" mode="initial-pass-mode"/>
      </xsl:copy>
   </xsl:template>

   <!--Set count-as pass template for Context: pwcnitem-->
<xsl:template match="pwcnitem" mode="set-countas" priority="0">
      <xsl:copy>
         <xsl:apply-templates select="@*|node()" mode="set-countas"/>
      </xsl:copy>
   </xsl:template>

   <!--Set ch:chunk template for Context: pwcnitem-->
<xsl:template match="pwcnitem" mode="set-ch-chunk" priority="0">
      <xsl:copy>
         <xsl:if test="not(@_gte:did-set-chunk)">
            <xsl:attribute name="_gte:did-set-chunk">yes</xsl:attribute>
         </xsl:if>
         <xsl:apply-templates select="@*|node()" mode="set-ch-chunk"/>
      </xsl:copy>
   </xsl:template>

   <!--Style template for Context: pwcpbfront-->
<xsl:template name="__style-for_pwcpbfront.1">
      <xsl:text> .x-pwcpbfront-1-0 {margin-left: 0pt; margin-right: 0pt; }</xsl:text>
   </xsl:template>

   <!--Template for Context: pwcpbfront-->
<xsl:template match="pwcpbfront" priority="0"><!--Emit a nostyle template--><xsl:apply-templates/>
   </xsl:template>

   <!--Gentext template for Context: pwcpbfront-->
<xsl:template match="pwcpbfront" mode="expand-gentext" priority="0">
      <xsl:copy>
         <xsl:apply-templates select="@*|node()" mode="expand-gentext"/>
      </xsl:copy>
   </xsl:template>

   <!--Initial pass template for Context: pwcpbfront-->
<xsl:template match="pwcpbfront" mode="initial-pass-mode" priority="0">
      <xsl:copy>
         <xsl:call-template name="maybe-set-gte-id"/>
         <xsl:apply-templates select="@*|node()" mode="initial-pass-mode"/>
      </xsl:copy>
   </xsl:template>

   <!--Set count-as pass template for Context: pwcpbfront-->
<xsl:template match="pwcpbfront" mode="set-countas" priority="0">
      <xsl:copy>
         <xsl:apply-templates select="@*|node()" mode="set-countas"/>
      </xsl:copy>
   </xsl:template>

   <!--Set ch:chunk template for Context: pwcpbfront-->
<xsl:template match="pwcpbfront" mode="set-ch-chunk" priority="0">
      <xsl:copy>
         <xsl:if test="not(@_gte:did-set-chunk)">
            <xsl:attribute name="_gte:did-set-chunk">yes</xsl:attribute>
         </xsl:if>
         <xsl:apply-templates select="@*|node()" mode="set-ch-chunk"/>
      </xsl:copy>
   </xsl:template>

   <!--Style template for Context: pwcsbnbr-->
<xsl:template name="__style-for_pwcsbnbr.1">
      <xsl:text> .x-pwcsbnbr-1-0 {margin-left: 0pt; margin-right: 0pt; color: #0000FF; text-decoration: underline ; text-decoration: underline ; }</xsl:text>
   </xsl:template>

   <!--Template for Context: pwcsbnbr-->
<xsl:template match="pwcsbnbr" priority="0">
      <span><!--Emit class values to reflect conditions--><xsl:attribute name="class">
            <xsl:text> x-pwcsbnbr-1-0</xsl:text>
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

   <!--Gentext template for Context: pwcsbnbr-->
<xsl:template match="pwcsbnbr" mode="expand-gentext" priority="0">
      <xsl:copy>
         <xsl:apply-templates select="@*|node()" mode="expand-gentext"/>
      </xsl:copy>
   </xsl:template>

   <!--Initial pass template for Context: pwcsbnbr-->
<xsl:template match="pwcsbnbr" mode="initial-pass-mode" priority="0">
      <xsl:copy>
         <xsl:call-template name="maybe-set-gte-id"/>
         <xsl:apply-templates select="@*|node()" mode="initial-pass-mode"/>
      </xsl:copy>
   </xsl:template>

   <!--Set count-as pass template for Context: pwcsbnbr-->
<xsl:template match="pwcsbnbr" mode="set-countas" priority="0">
      <xsl:copy>
         <xsl:apply-templates select="@*|node()" mode="set-countas"/>
      </xsl:copy>
   </xsl:template>

   <!--Set ch:chunk template for Context: pwcsbnbr-->
<xsl:template match="pwcsbnbr" mode="set-ch-chunk" priority="0">
      <xsl:copy>
         <xsl:if test="not(@_gte:did-set-chunk)">
            <xsl:attribute name="_gte:did-set-chunk">yes</xsl:attribute>
         </xsl:if>
         <xsl:apply-templates select="@*|node()" mode="set-ch-chunk"/>
      </xsl:copy>
   </xsl:template>

   <!--Style template for Context: pwcsoa-->
<xsl:template name="__style-for_pwcsoa.1">
      <xsl:text> .x-pwcsoa-1-0 {margin-left: 0pt; margin-right: 0pt; text-indent: 0pt; margin-top: 8pt; } .x-pwcsoa-1-1 {}</xsl:text>
   </xsl:template>

   <!--Template for Context: pwcsoa-->
<xsl:template match="pwcsoa" priority="0">
      <xsl:param name="hidden" select="'yes'"/>
      <!--Dynamically determine the fo-class--><xsl:variable name="foClass">
         <xsl:choose>
            <xsl:when test="not(@size) or (@size and string(@size)!='med')">hidden</xsl:when>
            <xsl:otherwise>graphic-block</xsl:otherwise>
         </xsl:choose>
      </xsl:variable>
      <xsl:variable name="blockness">block</xsl:variable>
      <xsl:variable name="hiddenness">
         <xsl:choose>
            <xsl:when test="not(@size) or (@size and string(@size)!='med')">yes</xsl:when>
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
            <xsl:if test="$hidden='no'">
               <div><!--Emit class values to reflect conditions--><xsl:attribute name="class">
                     <xsl:text> x-pwcsoa-1-0</xsl:text>
                     <xsl:if test="not(@size) or (@size and string(@size)!='med')"> x-pwcsoa-1-1</xsl:if>
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
            </xsl:if>
         </xsl:when>
         <xsl:when test="$fo-class='block'">
            <div><!--Emit class values to reflect conditions--><xsl:attribute name="class">
                  <xsl:text> x-pwcsoa-1-0</xsl:text>
                  <xsl:if test="not(@size) or (@size and string(@size)!='med')"> x-pwcsoa-1-1</xsl:if>
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
         <xsl:when test="$fo-class='graphic-block'">
            <div><!--Emit class values to reflect conditions--><xsl:attribute name="class">
                  <xsl:text> x-pwcsoa-1-0</xsl:text>
                  <xsl:if test="not(@size) or (@size and string(@size)!='med')"> x-pwcsoa-1-1</xsl:if>
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
               <xsl:choose>
                  <xsl:when xmlns:ati3d="http://www.arbortext.com/namespace/graphics" test="@ati3d:viewer"><!--this graphic is a 3D graphic--><xsl:variable name="viewer" select="@ati3d:viewer"/>
                     <xsl:variable name="generated-idval">
                        <xsl:value-of select="concat($viewer,'_')"/>
                        <xsl:apply-templates select="." mode="set-id"/>
                     </xsl:variable>
                     <xsl:variable name="idval">
                        <xsl:value-of select="translate($generated-idval,'.','_')"/>
                     </xsl:variable>
                     <span id="{$idval}">
                        <xsl:variable name="specified-idval" select="string(@_gte:id)"/>
                        <span>
                           <xsl:if test="$specified-idval!=''">
                              <xsl:attribute name="id">
                                 <xsl:value-of select="$specified-idval"/>
                              </xsl:attribute>
                           </xsl:if>
                           <xsl:variable name="filename">
                              <xsl:value-of select="@negnumber"/>
                           </xsl:variable>
                           <span class="viewpath">
                              <xsl:value-of select="translate($filename,'\','/')"/>
                           </span>
                           <xsl:if test="@ati3d:links">
                              <span class="viewlinks">
                                 <xsl:value-of select="@ati3d:links"/>
                              </span>
                           </xsl:if>
                        </span>
                        <xsl:variable name="annotation" select="@ati3d:view"/>
                        <xsl:variable name="height"/>
                        <xsl:variable name="width"/>
                        <script>
                           <xsl:value-of select="$viewer"/>
                           <xsl:text>_Insert('</xsl:text>
                           <xsl:value-of select="$idval"/>
                           <xsl:text>', '</xsl:text>
                           <xsl:value-of select="$width"/>
                           <xsl:text>', '</xsl:text>
                           <xsl:value-of select="$height"/>
                           <xsl:text>', '</xsl:text>
                           <xsl:value-of select="$annotation"/>
                           <xsl:text>', '</xsl:text>
                           <xsl:call-template name="get-downloaduri">
                              <xsl:with-param name="viewer" select="$viewer"/>
                           </xsl:call-template>
                           <xsl:text>');</xsl:text>
                        </script>
                     </span>
                  </xsl:when>
                  <xsl:otherwise><!--this is a "regular" graphic--><img alt="Graphic">
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
                        <xsl:variable name="filename">
                           <xsl:value-of select="@negnumber"/>
                        </xsl:variable>
                        <xsl:variable name="graphic-prop-filename">
                           <xsl:if test="$graphics-path!=''">
                              <xsl:call-template name="substring-before-last">
                                 <xsl:with-param name="str" select="$graphics-path"/>
                                 <xsl:with-param name="delim" select="'/'"/>
                              </xsl:call-template>
                              <xsl:text>/</xsl:text>
                           </xsl:if>
                           <xsl:value-of select="$filename"/>
                        </xsl:variable>
                        <xsl:attribute name="src">
                           <xsl:value-of select="string($filename)"/>
                        </xsl:attribute>
                        <xsl:attribute name="style">max-width: 100%; </xsl:attribute>
                        <xsl:call-template name="maybe-set-id"/>
                        <!--Process this element's content--><xsl:apply-templates/>
                     </img>
                  </xsl:otherwise>
               </xsl:choose>
            </div>
         </xsl:when>
      </xsl:choose>
   </xsl:template>

   <!--Gentext template for Context: pwcsoa-->
<xsl:template match="pwcsoa" mode="expand-gentext" priority="0">
      <xsl:copy>
         <xsl:apply-templates select="@*|node()" mode="expand-gentext"/>
      </xsl:copy>
   </xsl:template>

   <!--Initial pass template for Context: pwcsoa-->
<xsl:template match="pwcsoa" mode="initial-pass-mode" priority="0">
      <xsl:copy>
         <xsl:call-template name="maybe-set-gte-id"/>
         <xsl:apply-templates select="@*|node()" mode="initial-pass-mode"/>
      </xsl:copy>
   </xsl:template>

   <!--Set count-as pass template for Context: pwcsoa-->
<xsl:template match="pwcsoa" mode="set-countas" priority="0">
      <xsl:copy>
         <xsl:apply-templates select="@*|node()" mode="set-countas"/>
      </xsl:copy>
   </xsl:template>

   <!--Set ch:chunk template for Context: pwcsoa-->
<xsl:template match="pwcsoa" mode="set-ch-chunk" priority="0">
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

   <!--Style template for Context: pwcspbdata-->
<xsl:template name="__style-for_pwcspbdata.1">
      <xsl:text> .x-pwcspbdata-1-0 {margin-left: 0pt; margin-right: 0pt; text-indent: 0pt; margin-top: 6pt; margin-bottom: 6pt; }</xsl:text>
   </xsl:template>

   <!--Template for Context: pwcspbdata-->
<xsl:template match="pwcspbdata" priority="0">
      <xsl:variable name="foClass">definitionListItem</xsl:variable>
      <xsl:variable name="blockness">block</xsl:variable>
      <xsl:variable name="startnew"/>
      <xsl:variable name="newpageset">#noChange</xsl:variable>
      <xsl:apply-templates/>
   </xsl:template>

   <!--Gentext template for Context: pwcspbdata-->
<xsl:template match="pwcspbdata" mode="expand-gentext" priority="0">
      <xsl:copy>
         <xsl:apply-templates select="@*|node()" mode="expand-gentext"/>
      </xsl:copy>
   </xsl:template>

   <!--Initial pass template for Context: pwcspbdata-->
<xsl:template match="pwcspbdata" mode="initial-pass-mode" priority="0">
      <xsl:copy>
         <xsl:call-template name="maybe-set-gte-id"/>
         <xsl:apply-templates select="@*|node()" mode="initial-pass-mode"/>
      </xsl:copy>
   </xsl:template>

   <!--Set count-as pass template for Context: pwcspbdata-->
<xsl:template match="pwcspbdata" mode="set-countas" priority="0">
      <xsl:copy>
         <xsl:apply-templates select="@*|node()" mode="set-countas"/>
      </xsl:copy>
   </xsl:template>

   <!--Set ch:chunk template for Context: pwcspbdata-->
<xsl:template match="pwcspbdata" mode="set-ch-chunk" priority="0">
      <xsl:copy>
         <xsl:if test="not(@_gte:did-set-chunk)">
            <xsl:attribute name="_gte:did-set-chunk">yes</xsl:attribute>
         </xsl:if>
         <xsl:apply-templates select="@*|node()" mode="set-ch-chunk"/>
      </xsl:copy>
   </xsl:template>

   <!--Style template for Context: pwcspblist-->
<xsl:template name="__style-for_pwcspblist.1">
      <xsl:text> .x-pwcspblist-1-0 {margin-left: 0pt; margin-right: 0pt; text-indent: 0pt; margin-top: 8pt; }</xsl:text>
   </xsl:template>

   <!--Template for Context: pwcspblist-->
<xsl:template match="pwcspblist" priority="0">
      <div><!--Emit class values to reflect conditions--><xsl:attribute name="class">
            <xsl:text> x-pwcspblist-1-0</xsl:text>
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

   <!--Gentext template for Context: pwcspblist-->
<xsl:template match="pwcspblist" mode="expand-gentext" priority="0">
      <xsl:copy>
         <xsl:apply-templates select="@*|node()" mode="expand-gentext"/>
      </xsl:copy>
   </xsl:template>

   <!--Initial pass template for Context: pwcspblist-->
<xsl:template match="pwcspblist" mode="initial-pass-mode" priority="0">
      <xsl:copy>
         <xsl:call-template name="maybe-set-gte-id"/>
         <xsl:apply-templates select="@*|node()" mode="initial-pass-mode"/>
      </xsl:copy>
   </xsl:template>

   <!--Set count-as pass template for Context: pwcspblist-->
<xsl:template match="pwcspblist" mode="set-countas" priority="0">
      <xsl:copy>
         <xsl:apply-templates select="@*|node()" mode="set-countas"/>
      </xsl:copy>
   </xsl:template>

   <!--Set ch:chunk template for Context: pwcspblist-->
<xsl:template match="pwcspblist" mode="set-ch-chunk" priority="0">
      <xsl:copy>
         <xsl:if test="not(@_gte:did-set-chunk)">
            <xsl:attribute name="_gte:did-set-chunk">yes</xsl:attribute>
         </xsl:if>
         <xsl:apply-templates select="@*|node()" mode="set-ch-chunk"/>
      </xsl:copy>
   </xsl:template>

   <!--Style template for Context: pwcspbnbr-->
<xsl:template name="__style-for_pwcspbnbr.1">
      <xsl:text> .x-pwcspbnbr-1-0 {margin-left: 0pt; margin-right: 0pt; color: #0000FF; text-decoration: underline ; text-decoration: underline ; }</xsl:text>
   </xsl:template>

   <!--Template for Context: pwcspbnbr-->
<xsl:template match="pwcspbnbr" priority="0">
      <span><!--Emit class values to reflect conditions--><xsl:attribute name="class">
            <xsl:text> x-pwcspbnbr-1-0</xsl:text>
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

   <!--Gentext template for Context: pwcspbnbr-->
<xsl:template match="pwcspbnbr" mode="expand-gentext" priority="0">
      <xsl:copy>
         <xsl:apply-templates select="@*|node()" mode="expand-gentext"/>
      </xsl:copy>
   </xsl:template>

   <!--Initial pass template for Context: pwcspbnbr-->
<xsl:template match="pwcspbnbr" mode="initial-pass-mode" priority="0">
      <xsl:copy>
         <xsl:call-template name="maybe-set-gte-id"/>
         <xsl:apply-templates select="@*|node()" mode="initial-pass-mode"/>
      </xsl:copy>
   </xsl:template>

   <!--Set count-as pass template for Context: pwcspbnbr-->
<xsl:template match="pwcspbnbr" mode="set-countas" priority="0">
      <xsl:copy>
         <xsl:apply-templates select="@*|node()" mode="set-countas"/>
      </xsl:copy>
   </xsl:template>

   <!--Set ch:chunk template for Context: pwcspbnbr-->
<xsl:template match="pwcspbnbr" mode="set-ch-chunk" priority="0">
      <xsl:copy>
         <xsl:if test="not(@_gte:did-set-chunk)">
            <xsl:attribute name="_gte:did-set-chunk">yes</xsl:attribute>
         </xsl:if>
         <xsl:apply-templates select="@*|node()" mode="set-ch-chunk"/>
      </xsl:copy>
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

   <!--Style template for Context: sbdata-->
<xsl:template name="__style-for_sbdata.1">
      <xsl:text> .x-sbdata-1-0 {margin-left: 0pt; margin-right: 0pt; text-indent: 0pt; margin-top: 6pt; margin-bottom: 6pt; }</xsl:text>
   </xsl:template>

   <!--Template for Context: sbdata-->
<xsl:template match="sbdata" priority="0">
      <xsl:variable name="foClass">definitionListItem</xsl:variable>
      <xsl:variable name="blockness">block</xsl:variable>
      <xsl:variable name="startnew"/>
      <xsl:variable name="newpageset">#noChange</xsl:variable>
      <xsl:apply-templates/>
   </xsl:template>

   <!--Gentext template for Context: sbdata-->
<xsl:template match="sbdata" mode="expand-gentext" priority="0">
      <xsl:copy>
         <xsl:apply-templates select="@*|node()" mode="expand-gentext"/>
      </xsl:copy>
   </xsl:template>

   <!--Initial pass template for Context: sbdata-->
<xsl:template match="sbdata" mode="initial-pass-mode" priority="0">
      <xsl:copy>
         <xsl:call-template name="maybe-set-gte-id"/>
         <xsl:apply-templates select="@*|node()" mode="initial-pass-mode"/>
      </xsl:copy>
   </xsl:template>

   <!--Set count-as pass template for Context: sbdata-->
<xsl:template match="sbdata" mode="set-countas" priority="0">
      <xsl:copy>
         <xsl:apply-templates select="@*|node()" mode="set-countas"/>
      </xsl:copy>
   </xsl:template>

   <!--Set ch:chunk template for Context: sbdata-->
<xsl:template match="sbdata" mode="set-ch-chunk" priority="0">
      <xsl:copy>
         <xsl:if test="not(@_gte:did-set-chunk)">
            <xsl:attribute name="_gte:did-set-chunk">yes</xsl:attribute>
         </xsl:if>
         <xsl:apply-templates select="@*|node()" mode="set-ch-chunk"/>
      </xsl:copy>
   </xsl:template>

   <!--Style template for Context: sbeff-->
<xsl:template name="__style-for_sbeff.1">
      <xsl:text> .x-sbeff-1-0 {margin-left: 0pt; margin-right: 0pt; } .x-sbeff-1-1 {}</xsl:text>
   </xsl:template>

   <!--Template for Context: sbeff-->
<xsl:template match="sbeff" priority="0">
      <xsl:variable name="foClass">inline</xsl:variable>
      <xsl:variable name="blockness">inline</xsl:variable>
      <span><!--Emit class values to reflect conditions--><xsl:attribute name="class">
            <xsl:text> x-sbeff-1-0</xsl:text>
            <xsl:if test="(@sbcond and string(@sbcond)='NA') or (@sbcond and string(@sbcond)='na') or (not(@sbcond)) or (@sbcond and string(@sbcond)='RWK') or (@sbcond and string(@sbcond)='rwk')"> x-sbeff-1-1</xsl:if>
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

   <!--Gentext template for Context: sbeff-->
<xsl:template match="sbeff" mode="expand-gentext" priority="0">
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
            <xsl:when test="(@sbcond and string(@sbcond)='NA') or (@sbcond and string(@sbcond)='na') or (not(@sbcond)) or (@sbcond and string(@sbcond)='RWK') or (@sbcond and string(@sbcond)='rwk')"><!--AddBefore Condition #1--><xsl:if test="not(@_gte:Gentext-Expanded)">
                  <_gte:Must-Expand-Gentext/>
                  <_sfe:BeforeOrAfterText>
                     <xsl:text>SB</xsl:text>
                     <xsl:value-of select="@sbnbr"/>
                  </_sfe:BeforeOrAfterText>
               </xsl:if>
            </xsl:when>
            <xsl:otherwise>
               <xsl:if test="not(@_gte:Gentext-Expanded)">
                  <_gte:Must-Expand-Gentext/>
                  <_sfe:BeforeOrAfterText>
                     <xsl:value-of select="@sbcond"/>
                     <xsl:text>-SB</xsl:text>
                     <xsl:value-of select="@sbnbr"/>
                  </_sfe:BeforeOrAfterText>
               </xsl:if>
            </xsl:otherwise>
         </xsl:choose>
         <xsl:apply-templates select="* | text() | processing-instruction()" mode="expand-gentext"/>
      </xsl:copy>
   </xsl:template>

   <!--Initial pass template for Context: sbeff-->
<xsl:template match="sbeff" mode="initial-pass-mode" priority="0">
      <xsl:copy>
         <xsl:call-template name="maybe-set-gte-id"/>
         <xsl:apply-templates select="@*|node()" mode="initial-pass-mode"/>
      </xsl:copy>
   </xsl:template>

   <!--Set count-as pass template for Context: sbeff-->
<xsl:template match="sbeff" mode="set-countas" priority="0">
      <xsl:copy>
         <xsl:apply-templates select="@*|node()" mode="set-countas"/>
      </xsl:copy>
   </xsl:template>

   <!--Set ch:chunk template for Context: sbeff-->
<xsl:template match="sbeff" mode="set-ch-chunk" priority="0">
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

   <!--Style template for Context: sbnbr-->
<xsl:template name="__style-for_sbnbr.1">
      <xsl:text> .x-sbnbr-1-0 {margin-left: 0pt; margin-right: 0pt; text-indent: 0pt; color: #0000FF; text-decoration: underline ; text-decoration: underline ; }</xsl:text>
   </xsl:template>

   <!--Template for Context: sbnbr-->
<xsl:template match="sbnbr" priority="0">
      <div><!--Emit class values to reflect conditions--><xsl:attribute name="class">
            <xsl:text> x-sbnbr-1-0</xsl:text>
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

   <!--Gentext template for Context: sbnbr-->
<xsl:template match="sbnbr" mode="expand-gentext" priority="0">
      <xsl:copy>
         <xsl:attribute name="_gte:Gentext-Expanded">y</xsl:attribute>
         <xsl:apply-templates select="@*" mode="expand-gentext"/>
         <xsl:if test="not(@_gte:id)">
            <xsl:attribute name="_gte:id">
               <xsl:value-of select="'_g_'"/>
               <xsl:value-of select="generate-id(.)"/>
            </xsl:attribute>
         </xsl:if>
         <xsl:apply-templates select="* | text() | processing-instruction()" mode="expand-gentext"/>
         <!--Unconditional AddAfter--><xsl:if test="not(@_gte:Gentext-Expanded)">
            <_gte:Must-Expand-Gentext/>
            <_sfe:BeforeOrAfterText>
               <xsl:text> </xsl:text>
               <xsl:value-of select="@pwcrevno"/>
            </_sfe:BeforeOrAfterText>
         </xsl:if>
      </xsl:copy>
   </xsl:template>

   <!--Initial pass template for Context: sbnbr-->
<xsl:template match="sbnbr" mode="initial-pass-mode" priority="0">
      <xsl:copy>
         <xsl:call-template name="maybe-set-gte-id"/>
         <xsl:apply-templates select="@*|node()" mode="initial-pass-mode"/>
      </xsl:copy>
   </xsl:template>

   <!--Set count-as pass template for Context: sbnbr-->
<xsl:template match="sbnbr" mode="set-countas" priority="0">
      <xsl:copy>
         <xsl:apply-templates select="@*|node()" mode="set-countas"/>
      </xsl:copy>
   </xsl:template>

   <!--Set ch:chunk template for Context: sbnbr-->
<xsl:template match="sbnbr" mode="set-ch-chunk" priority="0">
      <xsl:copy>
         <xsl:if test="not(@_gte:did-set-chunk)">
            <xsl:attribute name="_gte:did-set-chunk">yes</xsl:attribute>
         </xsl:if>
         <xsl:apply-templates select="@*|node()" mode="set-ch-chunk"/>
      </xsl:copy>
   </xsl:template>

   <!--Style template for Context: sheet-->
<xsl:template name="__style-for_sheet.1">
      <xsl:text> .x-sheet-1-0 {margin-left: 0pt; margin-right: 0pt; text-indent: 0pt; margin-top: 8pt; } .x-sheet-1-1 {} .x-sheet-1-2 {}</xsl:text>
   </xsl:template>

   <!--Template for Context: sheet-->
<xsl:template match="sheet" priority="0">
      <xsl:param name="hidden" select="'yes'"/>
      <!--Dynamically determine the fo-class--><xsl:variable name="foClass">
         <xsl:choose>
            <xsl:when test="not(@size) or (@size and string(@size)!='big')">block</xsl:when>
            <xsl:when test="count(following-sibling::sheet[@size=&#34;big&#34;]) &gt; 0">block</xsl:when>
            <xsl:otherwise>hidden-block</xsl:otherwise>
         </xsl:choose>
      </xsl:variable>
      <xsl:variable name="blockness">block</xsl:variable>
      <xsl:variable name="hiddenness">
         <xsl:choose>
            <xsl:when test="not(@size) or (@size and string(@size)!='big')">no</xsl:when>
            <xsl:when test="count(following-sibling::sheet[@size=&#34;big&#34;]) &gt; 0">no</xsl:when>
            <xsl:otherwise>yes</xsl:otherwise>
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
                  <xsl:text> x-sheet-1-0</xsl:text>
                  <xsl:if test="count(following-sibling::sheet[@size=&#34;big&#34;]) &gt; 0"> x-sheet-1-1</xsl:if>
                  <xsl:if test="not(@size) or (@size and string(@size)!='big')"> x-sheet-1-2</xsl:if>
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
                  <xsl:text> x-sheet-1-0</xsl:text>
                  <xsl:if test="count(following-sibling::sheet[@size=&#34;big&#34;]) &gt; 0"> x-sheet-1-1</xsl:if>
                  <xsl:if test="not(@size) or (@size and string(@size)!='big')"> x-sheet-1-2</xsl:if>
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

   <!--Gentext template for Context: sheet-->
<xsl:template match="sheet" mode="expand-gentext" priority="0">
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
            <xsl:when test="not(@size) or (@size and string(@size)!='big')"><!--AddBefore Condition #2--><xsl:if test="not(@_gte:Gentext-Expanded)">
                  <_gte:Must-Expand-Gentext/>
                  <_sfe:BeforeOrAfterText/>
               </xsl:if>
            </xsl:when>
            <xsl:otherwise>
               <xsl:if test="not(@_gte:Gentext-Expanded)">
                  <_gte:Must-Expand-Gentext/>
                  <_sfe:BeforeOrAfterText>
                     <_ufe:block-prespace>
                        <xsl:text>SHEET (</xsl:text>
                        <xsl:value-of select="@sheetnbr"/>
                        <xsl:text> OF </xsl:text>
                        <xsl:value-of select="(ancestor-or-self::graphic[1]//sheet)[position()=last()]/@sheetnbr"/>
                        <xsl:text>)</xsl:text>
                     </_ufe:block-prespace>
                  </_sfe:BeforeOrAfterText>
               </xsl:if>
            </xsl:otherwise>
         </xsl:choose>
         <xsl:apply-templates select="* | text() | processing-instruction()" mode="expand-gentext"/>
      </xsl:copy>
   </xsl:template>

   <!--Initial pass template for Context: sheet-->
<xsl:template match="sheet" mode="initial-pass-mode" priority="0">
      <xsl:copy>
         <xsl:call-template name="maybe-set-gte-id"/>
         <xsl:apply-templates select="@*|node()" mode="initial-pass-mode"/>
      </xsl:copy>
   </xsl:template>

   <!--Set count-as pass template for Context: sheet-->
<xsl:template match="sheet" mode="set-countas" priority="0">
      <xsl:copy>
         <xsl:apply-templates select="@*|node()" mode="set-countas"/>
      </xsl:copy>
   </xsl:template>

   <!--Set ch:chunk template for Context: sheet-->
<xsl:template match="sheet" mode="set-ch-chunk" priority="0">
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

   <!--Collect footnote template for Context: sheet-->
<xsl:template match="sheet" mode="styler-collect-footnotes" priority="0">
      <xsl:apply-templates select="_sfe:BeforeOrAfterText/*" mode="styler-collect-footnotes"/>
   </xsl:template>

   <!--Style template for Context: slavename-->
<xsl:template name="__style-for_slavename.1">
      <xsl:text> .x-slavename-1-0 {margin-left: 0pt; margin-right: 0pt; }</xsl:text>
   </xsl:template>

   <!--Template for Context: slavename-->
<xsl:template match="slavename" priority="0">
      <span><!--Emit class values to reflect conditions--><xsl:attribute name="class">
            <xsl:text> x-slavename-1-0</xsl:text>
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

   <!--Gentext template for Context: slavename-->
<xsl:template match="slavename" mode="expand-gentext" priority="0">
      <xsl:copy>
         <xsl:apply-templates select="@*|node()" mode="expand-gentext"/>
      </xsl:copy>
   </xsl:template>

   <!--Initial pass template for Context: slavename-->
<xsl:template match="slavename" mode="initial-pass-mode" priority="0">
      <xsl:copy>
         <xsl:call-template name="maybe-set-gte-id"/>
         <xsl:apply-templates select="@*|node()" mode="initial-pass-mode"/>
      </xsl:copy>
   </xsl:template>

   <!--Set count-as pass template for Context: slavename-->
<xsl:template match="slavename" mode="set-countas" priority="0">
      <xsl:copy>
         <xsl:apply-templates select="@*|node()" mode="set-countas"/>
      </xsl:copy>
   </xsl:template>

   <!--Set ch:chunk template for Context: slavename-->
<xsl:template match="slavename" mode="set-ch-chunk" priority="0">
      <xsl:copy>
         <xsl:if test="not(@_gte:did-set-chunk)">
            <xsl:attribute name="_gte:did-set-chunk">yes</xsl:attribute>
         </xsl:if>
         <xsl:apply-templates select="@*|node()" mode="set-ch-chunk"/>
      </xsl:copy>
   </xsl:template>

   <!--Style template for Context: slavenbr-->
<xsl:template name="__style-for_slavenbr.1">
      <xsl:text> .x-slavenbr-1-0 {margin-left: 0pt; margin-right: 0pt; }</xsl:text>
   </xsl:template>

   <!--Template for Context: slavenbr-->
<xsl:template match="slavenbr" priority="0">
      <span><!--Emit class values to reflect conditions--><xsl:attribute name="class">
            <xsl:text> x-slavenbr-1-0</xsl:text>
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

   <!--Gentext template for Context: slavenbr-->
<xsl:template match="slavenbr" mode="expand-gentext" priority="0">
      <xsl:copy>
         <xsl:apply-templates select="@*|node()" mode="expand-gentext"/>
      </xsl:copy>
   </xsl:template>

   <!--Initial pass template for Context: slavenbr-->
<xsl:template match="slavenbr" mode="initial-pass-mode" priority="0">
      <xsl:copy>
         <xsl:call-template name="maybe-set-gte-id"/>
         <xsl:apply-templates select="@*|node()" mode="initial-pass-mode"/>
      </xsl:copy>
   </xsl:template>

   <!--Set count-as pass template for Context: slavenbr-->
<xsl:template match="slavenbr" mode="set-countas" priority="0">
      <xsl:copy>
         <xsl:apply-templates select="@*|node()" mode="set-countas"/>
      </xsl:copy>
   </xsl:template>

   <!--Set ch:chunk template for Context: slavenbr-->
<xsl:template match="slavenbr" mode="set-ch-chunk" priority="0">
      <xsl:copy>
         <xsl:if test="not(@_gte:did-set-chunk)">
            <xsl:attribute name="_gte:did-set-chunk">yes</xsl:attribute>
         </xsl:if>
         <xsl:apply-templates select="@*|node()" mode="set-ch-chunk"/>
      </xsl:copy>
   </xsl:template>

   <!--Style template for Context: slavepart-->
<xsl:template name="__style-for_slavepart.1">
      <xsl:text> .x-slavepart-1-0 {margin-left: 0pt; margin-right: 0pt; }</xsl:text>
   </xsl:template>

   <!--Template for Context: slavepart-->
<xsl:template match="slavepart" priority="0">
      <span><!--Emit class values to reflect conditions--><xsl:attribute name="class">
            <xsl:text> x-slavepart-1-0</xsl:text>
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

   <!--Gentext template for Context: slavepart-->
<xsl:template match="slavepart" mode="expand-gentext" priority="0">
      <xsl:copy>
         <xsl:apply-templates select="@*|node()" mode="expand-gentext"/>
      </xsl:copy>
   </xsl:template>

   <!--Initial pass template for Context: slavepart-->
<xsl:template match="slavepart" mode="initial-pass-mode" priority="0">
      <xsl:copy>
         <xsl:call-template name="maybe-set-gte-id"/>
         <xsl:apply-templates select="@*|node()" mode="initial-pass-mode"/>
      </xsl:copy>
   </xsl:template>

   <!--Set count-as pass template for Context: slavepart-->
<xsl:template match="slavepart" mode="set-countas" priority="0">
      <xsl:copy>
         <xsl:apply-templates select="@*|node()" mode="set-countas"/>
      </xsl:copy>
   </xsl:template>

   <!--Set ch:chunk template for Context: slavepart-->
<xsl:template match="slavepart" mode="set-ch-chunk" priority="0">
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

   <!--Style template for Context: spbnbr-->
<xsl:template name="__style-for_spbnbr.1">
      <xsl:text> .x-spbnbr-1-0 {margin-left: 0pt; margin-right: 0pt; text-indent: 0pt; margin-top: 6pt; margin-bottom: 6pt; color: #0000FF; text-decoration: underline ; text-decoration: underline ; }</xsl:text>
   </xsl:template>

   <!--Template for Context: spbnbr-->
<xsl:template match="spbnbr" priority="0">
      <xsl:variable name="foClass">definitionListItem</xsl:variable>
      <xsl:variable name="blockness">block</xsl:variable>
      <xsl:variable name="startnew"/>
      <xsl:variable name="newpageset">#noChange</xsl:variable>
      <xsl:apply-templates/>
   </xsl:template>

   <!--Gentext template for Context: spbnbr-->
<xsl:template match="spbnbr" mode="expand-gentext" priority="0">
      <xsl:copy>
         <xsl:apply-templates select="@*|node()" mode="expand-gentext"/>
      </xsl:copy>
   </xsl:template>

   <!--Initial pass template for Context: spbnbr-->
<xsl:template match="spbnbr" mode="initial-pass-mode" priority="0">
      <xsl:copy>
         <xsl:call-template name="maybe-set-gte-id"/>
         <xsl:apply-templates select="@*|node()" mode="initial-pass-mode"/>
      </xsl:copy>
   </xsl:template>

   <!--Set count-as pass template for Context: spbnbr-->
<xsl:template match="spbnbr" mode="set-countas" priority="0">
      <xsl:copy>
         <xsl:apply-templates select="@*|node()" mode="set-countas"/>
      </xsl:copy>
   </xsl:template>

   <!--Set ch:chunk template for Context: spbnbr-->
<xsl:template match="spbnbr" mode="set-ch-chunk" priority="0">
      <xsl:copy>
         <xsl:if test="not(@_gte:did-set-chunk)">
            <xsl:attribute name="_gte:did-set-chunk">yes</xsl:attribute>
         </xsl:if>
         <xsl:apply-templates select="@*|node()" mode="set-ch-chunk"/>
      </xsl:copy>
   </xsl:template>

   <!--Style template for Context: statement-->
<xsl:template name="__style-for_statement.1">
      <xsl:text> .x-statement-1-0 {margin-left: 0pt; margin-right: 0pt; text-indent: 0pt; font-weight: normal; font-size: 11pt; text-align: center; }</xsl:text>
   </xsl:template>

   <!--Template for Context: statement-->
<xsl:template match="statement" priority="0">
      <xsl:param name="hidden" select="'yes'"/>
      <xsl:if test="$hidden='no'">
         <div><!--Emit class values to reflect conditions--><xsl:attribute name="class">
               <xsl:text> x-statement-1-0</xsl:text>
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
         </div>
      </xsl:if>
   </xsl:template>

   <!--Gentext template for Context: statement-->
<xsl:template match="statement" mode="expand-gentext" priority="0">
      <xsl:copy>
         <xsl:apply-templates select="@*|node()" mode="expand-gentext"/>
      </xsl:copy>
   </xsl:template>

   <!--Initial pass template for Context: statement-->
<xsl:template match="statement" mode="initial-pass-mode" priority="0">
      <xsl:copy>
         <xsl:call-template name="maybe-set-gte-id"/>
         <xsl:apply-templates select="@*|node()" mode="initial-pass-mode"/>
      </xsl:copy>
   </xsl:template>

   <!--Set count-as pass template for Context: statement-->
<xsl:template match="statement" mode="set-countas" priority="0">
      <xsl:copy>
         <xsl:apply-templates select="@*|node()" mode="set-countas"/>
      </xsl:copy>
   </xsl:template>

   <!--Set ch:chunk template for Context: statement-->
<xsl:template match="statement" mode="set-ch-chunk" priority="0">
      <xsl:copy>
         <xsl:if test="not(@_gte:did-set-chunk)">
            <xsl:attribute name="_gte:did-set-chunk">yes</xsl:attribute>
         </xsl:if>
         <xsl:apply-templates select="@*|node()" mode="set-ch-chunk"/>
      </xsl:copy>
   </xsl:template>

   <!--Collect footnote template for Context: statement-->
<xsl:template match="statement" mode="styler-collect-footnotes" priority="0">
      <xsl:apply-templates select="_sfe:BeforeOrAfterText/*" mode="styler-collect-footnotes"/>
   </xsl:template>

   <!--Style template for Context: std-->
<xsl:template name="__style-for_std.1">
      <xsl:text> .x-std-1-0 {margin-left: 0pt; margin-right: 0pt; } .x-std-1-1 {}</xsl:text>
   </xsl:template>

   <!--Template for Context: std-->
<xsl:template match="std" priority="0">
      <xsl:param name="hidden" select="'yes'"/>
      <xsl:variable name="foClass">hidden-inline</xsl:variable>
      <xsl:variable name="blockness">inline</xsl:variable>
      <xsl:variable name="hiddenness">yes</xsl:variable>
      <span><!--Emit class values to reflect conditions--><xsl:attribute name="class">
            <xsl:text> x-std-1-0</xsl:text>
            <xsl:if test="(self::std/stdnbr[contains(., 'NA')]) and (string-length(self::std/stdnbr) = 2)"> x-std-1-1</xsl:if>
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
      </span>
   </xsl:template>

   <!--Gentext template for Context: std-->
<xsl:template match="std" mode="expand-gentext" priority="0">
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
            <xsl:when test="(self::std/stdnbr[contains(., 'NA')]) and (string-length(self::std/stdnbr) = 2)"><!--AddBefore Condition #1--><xsl:if test="not(@_gte:Gentext-Expanded)">
                  <_gte:Must-Expand-Gentext/>
                  <_sfe:BeforeOrAfterText>
                     <xsl:if test="(ancestor-or-self::std[1]//stdname)[1]/*|(ancestor-or-self::std[1]//stdname)[1]/text()|(ancestor-or-self::std[1]//stdname)[1]/processing-instruction()">
                        <_gte:Gentexted-Content-Wrapper>
                           <xsl:apply-templates mode="expand-gentext"
                                                select="(ancestor-or-self::std[1]//stdname)[1]/*|(ancestor-or-self::std[1]//stdname)[1]/text()|(ancestor-or-self::std[1]//stdname)[1]/processing-instruction()">
                              <xsl:with-param name="skip-expanded-gentext" select="'yes'"/>
                           </xsl:apply-templates>
                        </_gte:Gentexted-Content-Wrapper>
                     </xsl:if>
                  </_sfe:BeforeOrAfterText>
               </xsl:if>
            </xsl:when>
            <xsl:otherwise>
               <xsl:if test="not(@_gte:Gentext-Expanded)">
                  <_gte:Must-Expand-Gentext/>
                  <_sfe:BeforeOrAfterText>
                     <xsl:if test="(ancestor-or-self::std[1]//stdname)[1]/*|(ancestor-or-self::std[1]//stdname)[1]/text()|(ancestor-or-self::std[1]//stdname)[1]/processing-instruction()">
                        <_gte:Gentexted-Content-Wrapper>
                           <xsl:apply-templates mode="expand-gentext"
                                                select="(ancestor-or-self::std[1]//stdname)[1]/*|(ancestor-or-self::std[1]//stdname)[1]/text()|(ancestor-or-self::std[1]//stdname)[1]/processing-instruction()">
                              <xsl:with-param name="skip-expanded-gentext" select="'yes'"/>
                           </xsl:apply-templates>
                        </_gte:Gentexted-Content-Wrapper>
                     </xsl:if>
                     <xsl:text> (</xsl:text>
                     <xsl:if test="(ancestor-or-self::std[1]//stdnbr)[1]/*|(ancestor-or-self::std[1]//stdnbr)[1]/text()|(ancestor-or-self::std[1]//stdnbr)[1]/processing-instruction()">
                        <_gte:Gentexted-Content-Wrapper>
                           <xsl:apply-templates mode="expand-gentext"
                                                select="(ancestor-or-self::std[1]//stdnbr)[1]/*|(ancestor-or-self::std[1]//stdnbr)[1]/text()|(ancestor-or-self::std[1]//stdnbr)[1]/processing-instruction()">
                              <xsl:with-param name="skip-expanded-gentext" select="'yes'"/>
                           </xsl:apply-templates>
                        </_gte:Gentexted-Content-Wrapper>
                     </xsl:if>
                     <xsl:text>)</xsl:text>
                  </_sfe:BeforeOrAfterText>
               </xsl:if>
            </xsl:otherwise>
         </xsl:choose>
         <xsl:apply-templates select="* | text() | processing-instruction()" mode="expand-gentext"/>
      </xsl:copy>
   </xsl:template>

   <!--Initial pass template for Context: std-->
<xsl:template match="std" mode="initial-pass-mode" priority="0">
      <xsl:copy>
         <xsl:call-template name="maybe-set-gte-id"/>
         <xsl:apply-templates select="@*|node()" mode="initial-pass-mode"/>
      </xsl:copy>
   </xsl:template>

   <!--Set count-as pass template for Context: std-->
<xsl:template match="std" mode="set-countas" priority="0">
      <xsl:copy>
         <xsl:apply-templates select="@*|node()" mode="set-countas"/>
      </xsl:copy>
   </xsl:template>

   <!--Set ch:chunk template for Context: std-->
<xsl:template match="std" mode="set-ch-chunk" priority="0">
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

   <!--Collect footnote template for Context: std-->
<xsl:template match="std" mode="styler-collect-footnotes" priority="0">
      <xsl:apply-templates select="_sfe:BeforeOrAfterText/*" mode="styler-collect-footnotes"/>
   </xsl:template>

   <!--Style template for Context: stdname-->
<xsl:template name="__style-for_stdname.1">
      <xsl:text> .x-stdname-1-0 {margin-left: 0pt; margin-right: 0pt; }</xsl:text>
   </xsl:template>

   <!--Template for Context: stdname-->
<xsl:template match="stdname" priority="0">
      <span><!--Emit class values to reflect conditions--><xsl:attribute name="class">
            <xsl:text> x-stdname-1-0</xsl:text>
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

   <!--Gentext template for Context: stdname-->
<xsl:template match="stdname" mode="expand-gentext" priority="0">
      <xsl:copy>
         <xsl:apply-templates select="@*|node()" mode="expand-gentext"/>
      </xsl:copy>
   </xsl:template>

   <!--Initial pass template for Context: stdname-->
<xsl:template match="stdname" mode="initial-pass-mode" priority="0">
      <xsl:copy>
         <xsl:call-template name="maybe-set-gte-id"/>
         <xsl:apply-templates select="@*|node()" mode="initial-pass-mode"/>
      </xsl:copy>
   </xsl:template>

   <!--Set count-as pass template for Context: stdname-->
<xsl:template match="stdname" mode="set-countas" priority="0">
      <xsl:copy>
         <xsl:apply-templates select="@*|node()" mode="set-countas"/>
      </xsl:copy>
   </xsl:template>

   <!--Set ch:chunk template for Context: stdname-->
<xsl:template match="stdname" mode="set-ch-chunk" priority="0">
      <xsl:copy>
         <xsl:if test="not(@_gte:did-set-chunk)">
            <xsl:attribute name="_gte:did-set-chunk">yes</xsl:attribute>
         </xsl:if>
         <xsl:apply-templates select="@*|node()" mode="set-ch-chunk"/>
      </xsl:copy>
   </xsl:template>

   <!--Style template for Context: stdnbr-->
<xsl:template name="__style-for_stdnbr.1">
      <xsl:text> .x-stdnbr-1-0 {margin-left: 0pt; margin-right: 0pt; }</xsl:text>
   </xsl:template>

   <!--Template for Context: stdnbr-->
<xsl:template match="stdnbr" priority="0">
      <span><!--Emit class values to reflect conditions--><xsl:attribute name="class">
            <xsl:text> x-stdnbr-1-0</xsl:text>
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

   <!--Gentext template for Context: stdnbr-->
<xsl:template match="stdnbr" mode="expand-gentext" priority="0">
      <xsl:copy>
         <xsl:apply-templates select="@*|node()" mode="expand-gentext"/>
      </xsl:copy>
   </xsl:template>

   <!--Initial pass template for Context: stdnbr-->
<xsl:template match="stdnbr" mode="initial-pass-mode" priority="0">
      <xsl:copy>
         <xsl:call-template name="maybe-set-gte-id"/>
         <xsl:apply-templates select="@*|node()" mode="initial-pass-mode"/>
      </xsl:copy>
   </xsl:template>

   <!--Set count-as pass template for Context: stdnbr-->
<xsl:template match="stdnbr" mode="set-countas" priority="0">
      <xsl:copy>
         <xsl:apply-templates select="@*|node()" mode="set-countas"/>
      </xsl:copy>
   </xsl:template>

   <!--Set ch:chunk template for Context: stdnbr-->
<xsl:template match="stdnbr" mode="set-ch-chunk" priority="0">
      <xsl:copy>
         <xsl:if test="not(@_gte:did-set-chunk)">
            <xsl:attribute name="_gte:did-set-chunk">yes</xsl:attribute>
         </xsl:if>
         <xsl:apply-templates select="@*|node()" mode="set-ch-chunk"/>
      </xsl:copy>
   </xsl:template>

   <!--Style template for Context: numlist/step-->
<xsl:template name="__style-for_step.4nuisep121">
      <xsl:text> .x-step-1-0 {margin-left: 0pt; margin-right: 0pt; text-indent: 0pt; margin-top: 6pt; margin-bottom: 6pt; margin-left: 0pt; text-indent: 0pt; }</xsl:text>
   </xsl:template>

   <!--Template for Context: numlist/step-->
<xsl:template match="numlist/step" priority="3">
      <table border="0" cellpadding="0" cellspacing="0">
         <xsl:attribute name="style">
            <xsl:variable name="followWith">tab</xsl:variable>
            <xsl:if test="$followWith='tab'">table-layout: fixed; </xsl:if>
         </xsl:attribute>
         <!--Emit class values to reflect conditions--><xsl:attribute name="class">
            <xsl:text> x-step-1-0</xsl:text> x--zero-left-margins</xsl:attribute>
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
         <xsl:variable name="col1-width">1.5em</xsl:variable>
         <xsl:variable name="col2-width">12pt</xsl:variable>
         <xsl:variable name="col3-width"/>
         <xsl:variable name="itemlabel-colnum">1</xsl:variable>
         <xsl:variable name="col2-align">right</xsl:variable>
         <col>
            <xsl:if test="$col1-width!=''">
               <xsl:attribute name="style">
                  <xsl:text>width: </xsl:text>
                  <xsl:value-of select="$col1-width"/>
               </xsl:attribute>
            </xsl:if>
         </col>
         <col>
            <xsl:if test="$col2-width!=''">
               <xsl:attribute name="style">
                  <xsl:text>width: </xsl:text>
                  <xsl:value-of select="$col2-width"/>
               </xsl:attribute>
            </xsl:if>
         </col>
         <col>
            <xsl:if test="$col3-width!=''">
               <xsl:attribute name="style">
                  <xsl:text>width: </xsl:text>
                  <xsl:value-of select="$col3-width"/>
               </xsl:attribute>
            </xsl:if>
         </col>
         <tbody>
            <tr valign="baseline">
               <td align="right">
                  <xsl:if test="$itemlabel-colnum=1">
                     <xsl:attribute name="style">word-break: keep-all; </xsl:attribute>
                     <xsl:apply-templates select="_sfe:BeforeOrAfterText[1]"/>
                  </xsl:if>
               </td>
               <td align="{$col2-align}">
                  <xsl:if test="$itemlabel-colnum=2">
                     <xsl:attribute name="style">word-break: keep-all; </xsl:attribute>
                     <xsl:apply-templates select="_sfe:BeforeOrAfterText[1]"/>
                  </xsl:if>
               </td>
               <td>
                  <xsl:if test="$itemlabel-colnum=3">
                     <xsl:attribute name="style">word-break: keep-all; </xsl:attribute>
                     <xsl:apply-templates select="_sfe:BeforeOrAfterText[1]"/>
                  </xsl:if>
                  <!--Process this element's content--><xsl:apply-templates select="node()[name(.)!='_sfe:BeforeOrAfterText']"/>
               </td>
            </tr>
         </tbody>
      </table>
   </xsl:template>

   <!--Gentext template for Context: numlist/step-->
<xsl:template match="numlist/step" mode="expand-gentext" priority="3">
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
            </_sfe:BeforeOrAfterText>
         </xsl:if>
         <xsl:apply-templates select="* | text() | processing-instruction()" mode="expand-gentext"/>
      </xsl:copy>
   </xsl:template>

   <!--Initial pass template for Context: numlist/step-->
<xsl:template match="numlist/step" mode="initial-pass-mode" priority="3">
      <xsl:copy>
         <xsl:call-template name="maybe-set-gte-id"/>
         <xsl:apply-templates select="@*|node()" mode="initial-pass-mode"/>
      </xsl:copy>
   </xsl:template>

   <!--Numbering template for context=numlist/step-->
<xsl:template match="numlist/step" mode="styler_numbering" priority="3">
      <xsl:number count="numlist/step" format="1"/>
      <xsl:text>.</xsl:text>
   </xsl:template>

   <!--Set count-as pass template for Context: numlist/step-->
<xsl:template match="numlist/step" mode="set-countas" priority="3">
      <xsl:copy>
         <xsl:apply-templates select="@*|node()" mode="set-countas"/>
      </xsl:copy>
   </xsl:template>

   <!--LabelAndNumberMarker template-->
<xsl:template match="numlist/step" mode="styler-LabelAndNumberMarker" priority="3">
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
   </xsl:template>

   <!--Set ch:chunk template for Context: numlist/step-->
<xsl:template match="numlist/step" mode="set-ch-chunk" priority="3">
      <xsl:copy>
         <xsl:if test="not(@_gte:did-set-chunk)">
            <xsl:attribute name="_gte:did-set-chunk">yes</xsl:attribute>
         </xsl:if>
         <xsl:apply-templates select="@*|node()" mode="set-ch-chunk"/>
      </xsl:copy>
   </xsl:template>

   <!--Style template for Context: procedure//step[child::*[1] != 'note']-->
<xsl:template name="__style-for_step.4predep382">
      <xsl:text> .x-step-2-0 {margin-left: 0pt; margin-right: 0pt; text-indent: 0pt; margin-top: 6pt; margin-bottom: 6pt; margin-left: 0pt; text-indent: 0pt; }</xsl:text>
   </xsl:template>

   <!--Template for Context: procedure//step[child::*[1] != 'note']-->
<xsl:template match="procedure//step[child::*[1] != 'note']" priority="2">
      <table border="0" cellpadding="0" cellspacing="0">
         <xsl:attribute name="style">
            <xsl:variable name="followWith">emspace</xsl:variable>
            <xsl:if test="$followWith='tab'">table-layout: fixed; </xsl:if>
         </xsl:attribute>
         <!--Emit class values to reflect conditions--><xsl:attribute name="class">
            <xsl:text> x-step-2-0</xsl:text> x--zero-left-margins</xsl:attribute>
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
         <xsl:variable name="col1-width">0pt</xsl:variable>
         <xsl:variable name="col2-width"/>
         <xsl:variable name="col3-width">100%</xsl:variable>
         <xsl:variable name="itemlabel-colnum">2</xsl:variable>
         <xsl:variable name="col2-align">left</xsl:variable>
         <col>
            <xsl:if test="$col1-width!=''">
               <xsl:attribute name="style">
                  <xsl:text>width: </xsl:text>
                  <xsl:value-of select="$col1-width"/>
               </xsl:attribute>
            </xsl:if>
         </col>
         <col>
            <xsl:if test="$col2-width!=''">
               <xsl:attribute name="style">
                  <xsl:text>width: </xsl:text>
                  <xsl:value-of select="$col2-width"/>
               </xsl:attribute>
            </xsl:if>
         </col>
         <col>
            <xsl:if test="$col3-width!=''">
               <xsl:attribute name="style">
                  <xsl:text>width: </xsl:text>
                  <xsl:value-of select="$col3-width"/>
               </xsl:attribute>
            </xsl:if>
         </col>
         <tbody>
            <tr valign="baseline">
               <td align="right">
                  <xsl:if test="$itemlabel-colnum=1">
                     <xsl:attribute name="style">word-break: keep-all; </xsl:attribute>
                     <xsl:apply-templates select="_sfe:BeforeOrAfterText[1]"/>
                  </xsl:if>
               </td>
               <td align="{$col2-align}">
                  <xsl:if test="$itemlabel-colnum=2">
                     <xsl:attribute name="style">word-break: keep-all; </xsl:attribute>
                     <xsl:apply-templates select="_sfe:BeforeOrAfterText[1]"/>
                  </xsl:if>
               </td>
               <td>
                  <xsl:if test="$itemlabel-colnum=3">
                     <xsl:attribute name="style">word-break: keep-all; </xsl:attribute>
                     <xsl:apply-templates select="_sfe:BeforeOrAfterText[1]"/>
                  </xsl:if>
                  <!--Process this element's content--><xsl:apply-templates select="node()[name(.)!='_sfe:BeforeOrAfterText']"/>
               </td>
            </tr>
         </tbody>
      </table>
   </xsl:template>

   <!--Gentext template for Context: procedure//step[child::*[1] != 'note']-->
<xsl:template match="procedure//step[child::*[1] != 'note']" mode="expand-gentext"
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
               <xsl:text> </xsl:text>
            </_sfe:BeforeOrAfterText>
         </xsl:if>
         <xsl:apply-templates select="* | text() | processing-instruction()" mode="expand-gentext"/>
      </xsl:copy>
   </xsl:template>

   <!--Initial pass template for Context: procedure//step[child::*[1] != 'note']-->
<xsl:template match="procedure//step[child::*[1] != 'note']" mode="initial-pass-mode"
                 priority="2">
      <xsl:copy>
         <xsl:call-template name="maybe-set-gte-id"/>
         <xsl:apply-templates select="@*|node()" mode="initial-pass-mode"/>
      </xsl:copy>
   </xsl:template>

   <!--Numbering template for context=procedure//step[child::*[1] != 'note']-->
<xsl:template match="procedure//step[child::*[1] != 'note']" mode="styler_numbering"
                 priority="2">
      <xsl:text>(</xsl:text>
      <xsl:variable name="node-id" select="generate-id(.)"/>
      <xsl:variable name="from-node"
                    select="(ancestor-or-self::procedure[not(ancestor::procedure)])[last()]"/>
      <xsl:variable name="num">
         <xsl:variable name="candidate-num">
            <xsl:choose>
               <xsl:when test="count($from-node) &gt; 0">
                  <xsl:for-each select="$from-node/descendant-or-self::*[@_gte:count-as-id='cnt__^procedure.cnt']">
                     <xsl:if test="generate-id(.) = $node-id">
                        <xsl:value-of select="position()"/>
                     </xsl:if>
                  </xsl:for-each>
               </xsl:when>
               <xsl:otherwise>
                  <xsl:for-each select="//*[@_gte:count-as-id='cnt__^procedure.cnt'][not(ancestor-or-self::procedure)]">
                     <xsl:if test="generate-id(.) = $node-id">
                        <xsl:value-of select="position()"/>
                     </xsl:if>
                  </xsl:for-each>
               </xsl:otherwise>
            </xsl:choose>
         </xsl:variable>
         <xsl:choose>
            <xsl:when test="string(number($candidate-num))!='NaN'">
               <xsl:value-of select="$candidate-num"/>
            </xsl:when>
            <xsl:otherwise>1</xsl:otherwise>
         </xsl:choose>
      </xsl:variable>
      <xsl:choose>
         <xsl:when test="string(number($num))!='NaN'">
            <xsl:number value="$num" format="1"/>
         </xsl:when>
         <xsl:otherwise>?</xsl:otherwise>
      </xsl:choose>
      <xsl:text>)</xsl:text>
   </xsl:template>

   <!--Set count-as pass template for Context: procedure//step[child::*[1] != 'note']-->
<xsl:template match="procedure//step[child::*[1] != 'note']" mode="set-countas" priority="2">
      <xsl:copy>
         <xsl:attribute name="_gte:count-as-id">cnt__^procedure.cnt</xsl:attribute>
         <xsl:apply-templates select="@*|node()" mode="set-countas"/>
      </xsl:copy>
   </xsl:template>

   <!--LabelAndNumberMarker template-->
<xsl:template match="procedure//step[child::*[1] != 'note']"
                 mode="styler-LabelAndNumberMarker"
                 priority="2">
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
   </xsl:template>

   <!--Set ch:chunk template for Context: procedure//step[child::*[1] != 'note']-->
<xsl:template match="procedure//step[child::*[1] != 'note']" mode="set-ch-chunk" priority="2">
      <xsl:copy>
         <xsl:if test="not(@_gte:did-set-chunk)">
            <xsl:attribute name="_gte:did-set-chunk">yes</xsl:attribute>
         </xsl:if>
         <xsl:apply-templates select="@*|node()" mode="set-ch-chunk"/>
      </xsl:copy>
   </xsl:template>

   <!--Style template for Context: procedure//step-->
<xsl:template name="__style-for_step.4predep153">
      <xsl:text> .x-step-3-0 {margin-left: 0pt; margin-right: 0pt; text-indent: 0pt; margin-top: 6pt; margin-bottom: 6pt; margin-left: 0pt; text-indent: 0pt; }</xsl:text>
   </xsl:template>

   <!--Template for Context: procedure//step-->
<xsl:template match="procedure//step" priority="1">
      <table border="0" cellpadding="0" cellspacing="0">
         <xsl:attribute name="style">
            <xsl:variable name="followWith">emspace</xsl:variable>
            <xsl:if test="$followWith='tab'">table-layout: fixed; </xsl:if>
         </xsl:attribute>
         <!--Emit class values to reflect conditions--><xsl:attribute name="class">
            <xsl:text> x-step-3-0</xsl:text> x--zero-left-margins</xsl:attribute>
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
         <xsl:variable name="col1-width">0pt</xsl:variable>
         <xsl:variable name="col2-width"/>
         <xsl:variable name="col3-width">100%</xsl:variable>
         <xsl:variable name="itemlabel-colnum">2</xsl:variable>
         <xsl:variable name="col2-align">left</xsl:variable>
         <col>
            <xsl:if test="$col1-width!=''">
               <xsl:attribute name="style">
                  <xsl:text>width: </xsl:text>
                  <xsl:value-of select="$col1-width"/>
               </xsl:attribute>
            </xsl:if>
         </col>
         <col>
            <xsl:if test="$col2-width!=''">
               <xsl:attribute name="style">
                  <xsl:text>width: </xsl:text>
                  <xsl:value-of select="$col2-width"/>
               </xsl:attribute>
            </xsl:if>
         </col>
         <col>
            <xsl:if test="$col3-width!=''">
               <xsl:attribute name="style">
                  <xsl:text>width: </xsl:text>
                  <xsl:value-of select="$col3-width"/>
               </xsl:attribute>
            </xsl:if>
         </col>
         <tbody>
            <tr valign="baseline">
               <td align="right">
                  <xsl:if test="$itemlabel-colnum=1">
                     <xsl:attribute name="style">word-break: keep-all; </xsl:attribute>
                     <xsl:apply-templates select="_sfe:BeforeOrAfterText[1]"/>
                  </xsl:if>
               </td>
               <td align="{$col2-align}">
                  <xsl:if test="$itemlabel-colnum=2">
                     <xsl:attribute name="style">word-break: keep-all; </xsl:attribute>
                     <xsl:apply-templates select="_sfe:BeforeOrAfterText[1]"/>
                  </xsl:if>
               </td>
               <td>
                  <xsl:if test="$itemlabel-colnum=3">
                     <xsl:attribute name="style">word-break: keep-all; </xsl:attribute>
                     <xsl:apply-templates select="_sfe:BeforeOrAfterText[1]"/>
                  </xsl:if>
                  <!--Process this element's content--><xsl:apply-templates select="node()[name(.)!='_sfe:BeforeOrAfterText']"/>
               </td>
            </tr>
         </tbody>
      </table>
   </xsl:template>

   <!--Gentext template for Context: procedure//step-->
<xsl:template match="procedure//step" mode="expand-gentext" priority="1">
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
               <xsl:text> </xsl:text>
            </_sfe:BeforeOrAfterText>
         </xsl:if>
         <xsl:apply-templates select="* | text() | processing-instruction()" mode="expand-gentext"/>
      </xsl:copy>
   </xsl:template>

   <!--Initial pass template for Context: procedure//step-->
<xsl:template match="procedure//step" mode="initial-pass-mode" priority="1">
      <xsl:copy>
         <xsl:call-template name="maybe-set-gte-id"/>
         <xsl:apply-templates select="@*|node()" mode="initial-pass-mode"/>
      </xsl:copy>
   </xsl:template>

   <!--Numbering template for context=procedure//step-->
<xsl:template match="procedure//step" mode="styler_numbering" priority="1">
      <xsl:text>(</xsl:text>
      <xsl:variable name="node-id" select="generate-id(.)"/>
      <xsl:variable name="from-node"
                    select="(ancestor-or-self::procedure[not(ancestor::procedure)])[last()]"/>
      <xsl:variable name="num">
         <xsl:variable name="candidate-num">
            <xsl:choose>
               <xsl:when test="count($from-node) &gt; 0">
                  <xsl:for-each select="$from-node/descendant-or-self::*[@_gte:count-as-id='cnt__^procedure.cnt']">
                     <xsl:if test="generate-id(.) = $node-id">
                        <xsl:value-of select="position()"/>
                     </xsl:if>
                  </xsl:for-each>
               </xsl:when>
               <xsl:otherwise>
                  <xsl:for-each select="//*[@_gte:count-as-id='cnt__^procedure.cnt'][not(ancestor-or-self::procedure)]">
                     <xsl:if test="generate-id(.) = $node-id">
                        <xsl:value-of select="position()"/>
                     </xsl:if>
                  </xsl:for-each>
               </xsl:otherwise>
            </xsl:choose>
         </xsl:variable>
         <xsl:choose>
            <xsl:when test="string(number($candidate-num))!='NaN'">
               <xsl:value-of select="$candidate-num"/>
            </xsl:when>
            <xsl:otherwise>1</xsl:otherwise>
         </xsl:choose>
      </xsl:variable>
      <xsl:choose>
         <xsl:when test="string(number($num))!='NaN'">
            <xsl:number value="$num" format="1"/>
         </xsl:when>
         <xsl:otherwise>?</xsl:otherwise>
      </xsl:choose>
      <xsl:text>)</xsl:text>
   </xsl:template>

   <!--Set count-as pass template for Context: procedure//step-->
<xsl:template match="procedure//step" mode="set-countas" priority="1">
      <xsl:copy>
         <xsl:attribute name="_gte:count-as-id">cnt__^procedure.cnt</xsl:attribute>
         <xsl:apply-templates select="@*|node()" mode="set-countas"/>
      </xsl:copy>
   </xsl:template>

   <!--LabelAndNumberMarker template-->
<xsl:template match="procedure//step" mode="styler-LabelAndNumberMarker" priority="1">
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
   </xsl:template>

   <!--Set ch:chunk template for Context: procedure//step-->
<xsl:template match="procedure//step" mode="set-ch-chunk" priority="1">
      <xsl:copy>
         <xsl:if test="not(@_gte:did-set-chunk)">
            <xsl:attribute name="_gte:did-set-chunk">yes</xsl:attribute>
         </xsl:if>
         <xsl:apply-templates select="@*|node()" mode="set-ch-chunk"/>
      </xsl:copy>
   </xsl:template>

   <!--Style template for Context: step-->
<xsl:template name="__style-for_step.4step44">
      <xsl:text> .x-step-4-0 {margin-left: 0pt; margin-right: 0pt; text-indent: 0pt; margin-top: 6pt; margin-bottom: 6pt; margin-left: 0pt; text-indent: 0pt; }</xsl:text>
   </xsl:template>

   <!--Template for Context: step-->
<xsl:template match="step" priority="0">
      <table border="0" cellpadding="0" cellspacing="0">
         <xsl:attribute name="style">
            <xsl:variable name="followWith"/>
            <xsl:if test="$followWith='tab'">table-layout: fixed; </xsl:if>
         </xsl:attribute>
         <!--Emit class values to reflect conditions--><xsl:attribute name="class">
            <xsl:text> x-step-4-0</xsl:text> x--zero-left-margins</xsl:attribute>
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
         <xsl:variable name="col1-width">0pt</xsl:variable>
         <xsl:variable name="col2-width">0pt</xsl:variable>
         <xsl:variable name="col3-width"/>
         <xsl:variable name="itemlabel-colnum">3</xsl:variable>
         <xsl:variable name="col2-align">center</xsl:variable>
         <col>
            <xsl:if test="$col1-width!=''">
               <xsl:attribute name="style">
                  <xsl:text>width: </xsl:text>
                  <xsl:value-of select="$col1-width"/>
               </xsl:attribute>
            </xsl:if>
         </col>
         <col>
            <xsl:if test="$col2-width!=''">
               <xsl:attribute name="style">
                  <xsl:text>width: </xsl:text>
                  <xsl:value-of select="$col2-width"/>
               </xsl:attribute>
            </xsl:if>
         </col>
         <col>
            <xsl:if test="$col3-width!=''">
               <xsl:attribute name="style">
                  <xsl:text>width: </xsl:text>
                  <xsl:value-of select="$col3-width"/>
               </xsl:attribute>
            </xsl:if>
         </col>
         <tbody>
            <tr valign="baseline">
               <td align="right">
                  <xsl:if test="$itemlabel-colnum=1">
                     <xsl:attribute name="style">word-break: keep-all; </xsl:attribute>
                  </xsl:if>
               </td>
               <td align="{$col2-align}">
                  <xsl:if test="$itemlabel-colnum=2">
                     <xsl:attribute name="style">word-break: keep-all; </xsl:attribute>
                  </xsl:if>
               </td>
               <td>
                  <xsl:if test="$itemlabel-colnum=3">
                     <xsl:attribute name="style">word-break: keep-all; </xsl:attribute>
                  </xsl:if>
                  <!--Process this element's content--><xsl:apply-templates select="node()[name(.)!='_sfe:BeforeOrAfterText']"/>
               </td>
            </tr>
         </tbody>
      </table>
   </xsl:template>

   <!--Gentext template for Context: step-->
<xsl:template match="step" mode="expand-gentext" priority="0">
      <xsl:copy>
         <xsl:apply-templates select="@*|node()" mode="expand-gentext"/>
      </xsl:copy>
   </xsl:template>

   <!--Initial pass template for Context: step-->
<xsl:template match="step" mode="initial-pass-mode" priority="0">
      <xsl:copy>
         <xsl:call-template name="maybe-set-gte-id"/>
         <xsl:apply-templates select="@*|node()" mode="initial-pass-mode"/>
      </xsl:copy>
   </xsl:template>

   <!--Set count-as pass template for Context: step-->
<xsl:template match="step" mode="set-countas" priority="0">
      <xsl:copy>
         <xsl:apply-templates select="@*|node()" mode="set-countas"/>
      </xsl:copy>
   </xsl:template>

   <!--Set ch:chunk template for Context: step-->
<xsl:template match="step" mode="set-ch-chunk" priority="0">
      <xsl:copy>
         <xsl:if test="not(@_gte:did-set-chunk)">
            <xsl:attribute name="_gte:did-set-chunk">yes</xsl:attribute>
         </xsl:if>
         <xsl:apply-templates select="@*|node()" mode="set-ch-chunk"/>
      </xsl:copy>
   </xsl:template>

   <!--Style template for Context: numlist/step2-->
<xsl:template name="__style-for_step2.3nuisp2131">
      <xsl:text> .x-step2-1-0 {margin-left: 0pt; margin-right: 0pt; text-indent: 0pt; margin-top: 6pt; margin-bottom: 6pt; margin-left: 0pt; text-indent: 0pt; }</xsl:text>
   </xsl:template>

   <!--Template for Context: numlist/step2-->
<xsl:template match="numlist/step2" priority="2">
      <table border="0" cellpadding="0" cellspacing="0">
         <xsl:attribute name="style">
            <xsl:variable name="followWith">tab</xsl:variable>
            <xsl:if test="$followWith='tab'">table-layout: fixed; </xsl:if>
         </xsl:attribute>
         <!--Emit class values to reflect conditions--><xsl:attribute name="class">
            <xsl:text> x-step2-1-0</xsl:text> x--zero-left-margins</xsl:attribute>
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
         <xsl:variable name="col1-width">1.5em</xsl:variable>
         <xsl:variable name="col2-width">12pt</xsl:variable>
         <xsl:variable name="col3-width"/>
         <xsl:variable name="itemlabel-colnum">1</xsl:variable>
         <xsl:variable name="col2-align">right</xsl:variable>
         <col>
            <xsl:if test="$col1-width!=''">
               <xsl:attribute name="style">
                  <xsl:text>width: </xsl:text>
                  <xsl:value-of select="$col1-width"/>
               </xsl:attribute>
            </xsl:if>
         </col>
         <col>
            <xsl:if test="$col2-width!=''">
               <xsl:attribute name="style">
                  <xsl:text>width: </xsl:text>
                  <xsl:value-of select="$col2-width"/>
               </xsl:attribute>
            </xsl:if>
         </col>
         <col>
            <xsl:if test="$col3-width!=''">
               <xsl:attribute name="style">
                  <xsl:text>width: </xsl:text>
                  <xsl:value-of select="$col3-width"/>
               </xsl:attribute>
            </xsl:if>
         </col>
         <tbody>
            <tr valign="baseline">
               <td align="right">
                  <xsl:if test="$itemlabel-colnum=1">
                     <xsl:attribute name="style">word-break: keep-all; </xsl:attribute>
                     <xsl:apply-templates select="_sfe:BeforeOrAfterText[1]"/>
                  </xsl:if>
               </td>
               <td align="{$col2-align}">
                  <xsl:if test="$itemlabel-colnum=2">
                     <xsl:attribute name="style">word-break: keep-all; </xsl:attribute>
                     <xsl:apply-templates select="_sfe:BeforeOrAfterText[1]"/>
                  </xsl:if>
               </td>
               <td>
                  <xsl:if test="$itemlabel-colnum=3">
                     <xsl:attribute name="style">word-break: keep-all; </xsl:attribute>
                     <xsl:apply-templates select="_sfe:BeforeOrAfterText[1]"/>
                  </xsl:if>
                  <!--Process this element's content--><xsl:apply-templates select="node()[name(.)!='_sfe:BeforeOrAfterText']"/>
               </td>
            </tr>
         </tbody>
      </table>
   </xsl:template>

   <!--Gentext template for Context: numlist/step2-->
<xsl:template match="numlist/step2" mode="expand-gentext" priority="2">
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
            </_sfe:BeforeOrAfterText>
         </xsl:if>
         <xsl:apply-templates select="* | text() | processing-instruction()" mode="expand-gentext"/>
      </xsl:copy>
   </xsl:template>

   <!--Initial pass template for Context: numlist/step2-->
<xsl:template match="numlist/step2" mode="initial-pass-mode" priority="2">
      <xsl:copy>
         <xsl:call-template name="maybe-set-gte-id"/>
         <xsl:apply-templates select="@*|node()" mode="initial-pass-mode"/>
      </xsl:copy>
   </xsl:template>

   <!--Numbering template for context=numlist/step2-->
<xsl:template match="numlist/step2" mode="styler_numbering" priority="2">
      <xsl:number count="numlist/step2" format="1"/>
      <xsl:text>.</xsl:text>
   </xsl:template>

   <!--Set count-as pass template for Context: numlist/step2-->
<xsl:template match="numlist/step2" mode="set-countas" priority="2">
      <xsl:copy>
         <xsl:apply-templates select="@*|node()" mode="set-countas"/>
      </xsl:copy>
   </xsl:template>

   <!--LabelAndNumberMarker template-->
<xsl:template match="numlist/step2" mode="styler-LabelAndNumberMarker" priority="2">
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
   </xsl:template>

   <!--Set ch:chunk template for Context: numlist/step2-->
<xsl:template match="numlist/step2" mode="set-ch-chunk" priority="2">
      <xsl:copy>
         <xsl:if test="not(@_gte:did-set-chunk)">
            <xsl:attribute name="_gte:did-set-chunk">yes</xsl:attribute>
         </xsl:if>
         <xsl:apply-templates select="@*|node()" mode="set-ch-chunk"/>
      </xsl:copy>
   </xsl:template>

   <!--Style template for Context: step2[child::*[1] != 'note']-->
<xsl:template name="__style-for_step2.3st2p2282">
      <xsl:text> .x-step2-2-0 {margin-left: 0pt; margin-right: 0pt; text-indent: 0pt; margin-top: 6pt; margin-bottom: 6pt; margin-left: 0pt; text-indent: 0pt; }</xsl:text>
   </xsl:template>

   <!--Template for Context: step2[child::*[1] != 'note']-->
<xsl:template match="step2[child::*[1] != 'note']" priority="1">
      <table border="0" cellpadding="0" cellspacing="0">
         <xsl:attribute name="style">
            <xsl:variable name="followWith">emspace</xsl:variable>
            <xsl:if test="$followWith='tab'">table-layout: fixed; </xsl:if>
         </xsl:attribute>
         <!--Emit class values to reflect conditions--><xsl:attribute name="class">
            <xsl:text> x-step2-2-0</xsl:text> x--zero-left-margins</xsl:attribute>
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
         <xsl:variable name="col1-width">0pt</xsl:variable>
         <xsl:variable name="col2-width"/>
         <xsl:variable name="col3-width">100%</xsl:variable>
         <xsl:variable name="itemlabel-colnum">2</xsl:variable>
         <xsl:variable name="col2-align">left</xsl:variable>
         <col>
            <xsl:if test="$col1-width!=''">
               <xsl:attribute name="style">
                  <xsl:text>width: </xsl:text>
                  <xsl:value-of select="$col1-width"/>
               </xsl:attribute>
            </xsl:if>
         </col>
         <col>
            <xsl:if test="$col2-width!=''">
               <xsl:attribute name="style">
                  <xsl:text>width: </xsl:text>
                  <xsl:value-of select="$col2-width"/>
               </xsl:attribute>
            </xsl:if>
         </col>
         <col>
            <xsl:if test="$col3-width!=''">
               <xsl:attribute name="style">
                  <xsl:text>width: </xsl:text>
                  <xsl:value-of select="$col3-width"/>
               </xsl:attribute>
            </xsl:if>
         </col>
         <tbody>
            <tr valign="baseline">
               <td align="right">
                  <xsl:if test="$itemlabel-colnum=1">
                     <xsl:attribute name="style">word-break: keep-all; </xsl:attribute>
                     <xsl:apply-templates select="_sfe:BeforeOrAfterText[1]"/>
                  </xsl:if>
               </td>
               <td align="{$col2-align}">
                  <xsl:if test="$itemlabel-colnum=2">
                     <xsl:attribute name="style">word-break: keep-all; </xsl:attribute>
                     <xsl:apply-templates select="_sfe:BeforeOrAfterText[1]"/>
                  </xsl:if>
               </td>
               <td>
                  <xsl:if test="$itemlabel-colnum=3">
                     <xsl:attribute name="style">word-break: keep-all; </xsl:attribute>
                     <xsl:apply-templates select="_sfe:BeforeOrAfterText[1]"/>
                  </xsl:if>
                  <!--Process this element's content--><xsl:apply-templates select="node()[name(.)!='_sfe:BeforeOrAfterText']"/>
               </td>
            </tr>
         </tbody>
      </table>
   </xsl:template>

   <!--Gentext template for Context: step2[child::*[1] != 'note']-->
<xsl:template match="step2[child::*[1] != 'note']" mode="expand-gentext" priority="1">
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
               <xsl:text> </xsl:text>
            </_sfe:BeforeOrAfterText>
         </xsl:if>
         <xsl:apply-templates select="* | text() | processing-instruction()" mode="expand-gentext"/>
      </xsl:copy>
   </xsl:template>

   <!--Initial pass template for Context: step2[child::*[1] != 'note']-->
<xsl:template match="step2[child::*[1] != 'note']" mode="initial-pass-mode" priority="1">
      <xsl:copy>
         <xsl:call-template name="maybe-set-gte-id"/>
         <xsl:apply-templates select="@*|node()" mode="initial-pass-mode"/>
      </xsl:copy>
   </xsl:template>

   <!--Numbering template for context=step2[child::*[1] != 'note']-->
<xsl:template match="step2[child::*[1] != 'note']" mode="styler_numbering" priority="1">
      <xsl:text>(</xsl:text>
      <xsl:variable name="node-id" select="generate-id(.)"/>
      <xsl:variable name="from-node" select="(ancestor-or-self::step[not(ancestor::step)])[last()]"/>
      <xsl:variable name="num">
         <xsl:variable name="candidate-num">
            <xsl:choose>
               <xsl:when test="count($from-node) &gt; 0">
                  <xsl:for-each select="$from-node/descendant-or-self::*[@_gte:count-as-id='cnt__^step.cnt']">
                     <xsl:if test="generate-id(.) = $node-id">
                        <xsl:value-of select="position()"/>
                     </xsl:if>
                  </xsl:for-each>
               </xsl:when>
               <xsl:otherwise>
                  <xsl:for-each select="//*[@_gte:count-as-id='cnt__^step.cnt'][not(ancestor-or-self::step)]">
                     <xsl:if test="generate-id(.) = $node-id">
                        <xsl:value-of select="position()"/>
                     </xsl:if>
                  </xsl:for-each>
               </xsl:otherwise>
            </xsl:choose>
         </xsl:variable>
         <xsl:choose>
            <xsl:when test="string(number($candidate-num))!='NaN'">
               <xsl:value-of select="$candidate-num"/>
            </xsl:when>
            <xsl:otherwise>1</xsl:otherwise>
         </xsl:choose>
      </xsl:variable>
      <xsl:choose>
         <xsl:when test="string(number($num))!='NaN'">
            <xsl:number value="$num" format="a"/>
         </xsl:when>
         <xsl:otherwise>?</xsl:otherwise>
      </xsl:choose>
      <xsl:text>)</xsl:text>
   </xsl:template>

   <!--Set count-as pass template for Context: step2[child::*[1] != 'note']-->
<xsl:template match="step2[child::*[1] != 'note']" mode="set-countas" priority="1">
      <xsl:copy>
         <xsl:attribute name="_gte:count-as-id">cnt__^step.cnt</xsl:attribute>
         <xsl:apply-templates select="@*|node()" mode="set-countas"/>
      </xsl:copy>
   </xsl:template>

   <!--LabelAndNumberMarker template-->
<xsl:template match="step2[child::*[1] != 'note']" mode="styler-LabelAndNumberMarker"
                 priority="1">
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
   </xsl:template>

   <!--Set ch:chunk template for Context: step2[child::*[1] != 'note']-->
<xsl:template match="step2[child::*[1] != 'note']" mode="set-ch-chunk" priority="1">
      <xsl:copy>
         <xsl:if test="not(@_gte:did-set-chunk)">
            <xsl:attribute name="_gte:did-set-chunk">yes</xsl:attribute>
         </xsl:if>
         <xsl:apply-templates select="@*|node()" mode="set-ch-chunk"/>
      </xsl:copy>
   </xsl:template>

   <!--Style template for Context: step2-->
<xsl:template name="__style-for_step2.3st2p253">
      <xsl:text> .x-step2-3-0 {margin-left: 0pt; margin-right: 0pt; text-indent: 0pt; margin-top: 6pt; margin-bottom: 6pt; margin-left: 0pt; text-indent: 0pt; }</xsl:text>
   </xsl:template>

   <!--Template for Context: step2-->
<xsl:template match="step2" priority="0">
      <table border="0" cellpadding="0" cellspacing="0">
         <xsl:attribute name="style">
            <xsl:variable name="followWith">emspace</xsl:variable>
            <xsl:if test="$followWith='tab'">table-layout: fixed; </xsl:if>
         </xsl:attribute>
         <!--Emit class values to reflect conditions--><xsl:attribute name="class">
            <xsl:text> x-step2-3-0</xsl:text> x--zero-left-margins</xsl:attribute>
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
         <xsl:variable name="col1-width">0pt</xsl:variable>
         <xsl:variable name="col2-width"/>
         <xsl:variable name="col3-width">100%</xsl:variable>
         <xsl:variable name="itemlabel-colnum">2</xsl:variable>
         <xsl:variable name="col2-align">left</xsl:variable>
         <col>
            <xsl:if test="$col1-width!=''">
               <xsl:attribute name="style">
                  <xsl:text>width: </xsl:text>
                  <xsl:value-of select="$col1-width"/>
               </xsl:attribute>
            </xsl:if>
         </col>
         <col>
            <xsl:if test="$col2-width!=''">
               <xsl:attribute name="style">
                  <xsl:text>width: </xsl:text>
                  <xsl:value-of select="$col2-width"/>
               </xsl:attribute>
            </xsl:if>
         </col>
         <col>
            <xsl:if test="$col3-width!=''">
               <xsl:attribute name="style">
                  <xsl:text>width: </xsl:text>
                  <xsl:value-of select="$col3-width"/>
               </xsl:attribute>
            </xsl:if>
         </col>
         <tbody>
            <tr valign="baseline">
               <td align="right">
                  <xsl:if test="$itemlabel-colnum=1">
                     <xsl:attribute name="style">word-break: keep-all; </xsl:attribute>
                     <xsl:apply-templates select="_sfe:BeforeOrAfterText[1]"/>
                  </xsl:if>
               </td>
               <td align="{$col2-align}">
                  <xsl:if test="$itemlabel-colnum=2">
                     <xsl:attribute name="style">word-break: keep-all; </xsl:attribute>
                     <xsl:apply-templates select="_sfe:BeforeOrAfterText[1]"/>
                  </xsl:if>
               </td>
               <td>
                  <xsl:if test="$itemlabel-colnum=3">
                     <xsl:attribute name="style">word-break: keep-all; </xsl:attribute>
                     <xsl:apply-templates select="_sfe:BeforeOrAfterText[1]"/>
                  </xsl:if>
                  <!--Process this element's content--><xsl:apply-templates select="node()[name(.)!='_sfe:BeforeOrAfterText']"/>
               </td>
            </tr>
         </tbody>
      </table>
   </xsl:template>

   <!--Gentext template for Context: step2-->
<xsl:template match="step2" mode="expand-gentext" priority="0">
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
               <xsl:text> </xsl:text>
            </_sfe:BeforeOrAfterText>
         </xsl:if>
         <xsl:apply-templates select="* | text() | processing-instruction()" mode="expand-gentext"/>
      </xsl:copy>
   </xsl:template>

   <!--Initial pass template for Context: step2-->
<xsl:template match="step2" mode="initial-pass-mode" priority="0">
      <xsl:copy>
         <xsl:call-template name="maybe-set-gte-id"/>
         <xsl:apply-templates select="@*|node()" mode="initial-pass-mode"/>
      </xsl:copy>
   </xsl:template>

   <!--Numbering template for context=step2-->
<xsl:template match="step2" mode="styler_numbering" priority="0">
      <xsl:text>(</xsl:text>
      <xsl:variable name="node-id" select="generate-id(.)"/>
      <xsl:variable name="from-node" select="(ancestor-or-self::step[not(ancestor::step)])[last()]"/>
      <xsl:variable name="num">
         <xsl:variable name="candidate-num">
            <xsl:choose>
               <xsl:when test="count($from-node) &gt; 0">
                  <xsl:for-each select="$from-node/descendant-or-self::*[@_gte:count-as-id='cnt__^step.cnt']">
                     <xsl:if test="generate-id(.) = $node-id">
                        <xsl:value-of select="position()"/>
                     </xsl:if>
                  </xsl:for-each>
               </xsl:when>
               <xsl:otherwise>
                  <xsl:for-each select="//*[@_gte:count-as-id='cnt__^step.cnt'][not(ancestor-or-self::step)]">
                     <xsl:if test="generate-id(.) = $node-id">
                        <xsl:value-of select="position()"/>
                     </xsl:if>
                  </xsl:for-each>
               </xsl:otherwise>
            </xsl:choose>
         </xsl:variable>
         <xsl:choose>
            <xsl:when test="string(number($candidate-num))!='NaN'">
               <xsl:value-of select="$candidate-num"/>
            </xsl:when>
            <xsl:otherwise>1</xsl:otherwise>
         </xsl:choose>
      </xsl:variable>
      <xsl:choose>
         <xsl:when test="string(number($num))!='NaN'">
            <xsl:number value="$num" format="a"/>
         </xsl:when>
         <xsl:otherwise>?</xsl:otherwise>
      </xsl:choose>
      <xsl:text>)</xsl:text>
   </xsl:template>

   <!--Set count-as pass template for Context: step2-->
<xsl:template match="step2" mode="set-countas" priority="0">
      <xsl:copy>
         <xsl:attribute name="_gte:count-as-id">cnt__^step.cnt</xsl:attribute>
         <xsl:apply-templates select="@*|node()" mode="set-countas"/>
      </xsl:copy>
   </xsl:template>

   <!--LabelAndNumberMarker template-->
<xsl:template match="step2" mode="styler-LabelAndNumberMarker" priority="0">
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
   </xsl:template>

   <!--Set ch:chunk template for Context: step2-->
<xsl:template match="step2" mode="set-ch-chunk" priority="0">
      <xsl:copy>
         <xsl:if test="not(@_gte:did-set-chunk)">
            <xsl:attribute name="_gte:did-set-chunk">yes</xsl:attribute>
         </xsl:if>
         <xsl:apply-templates select="@*|node()" mode="set-ch-chunk"/>
      </xsl:copy>
   </xsl:template>

   <!--Style template for Context: numlist/step3-->
<xsl:template name="__style-for_step3.3nuisp3131">
      <xsl:text> .x-step3-1-0 {margin-left: 0pt; margin-right: 0pt; text-indent: 0pt; margin-top: 6pt; margin-bottom: 6pt; margin-left: 0pt; text-indent: 0pt; }</xsl:text>
   </xsl:template>

   <!--Template for Context: numlist/step3-->
<xsl:template match="numlist/step3" priority="2">
      <table border="0" cellpadding="0" cellspacing="0">
         <xsl:attribute name="style">
            <xsl:variable name="followWith">tab</xsl:variable>
            <xsl:if test="$followWith='tab'">table-layout: fixed; </xsl:if>
         </xsl:attribute>
         <!--Emit class values to reflect conditions--><xsl:attribute name="class">
            <xsl:text> x-step3-1-0</xsl:text> x--zero-left-margins</xsl:attribute>
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
         <xsl:variable name="col1-width">1.5em</xsl:variable>
         <xsl:variable name="col2-width">12pt</xsl:variable>
         <xsl:variable name="col3-width"/>
         <xsl:variable name="itemlabel-colnum">1</xsl:variable>
         <xsl:variable name="col2-align">right</xsl:variable>
         <col>
            <xsl:if test="$col1-width!=''">
               <xsl:attribute name="style">
                  <xsl:text>width: </xsl:text>
                  <xsl:value-of select="$col1-width"/>
               </xsl:attribute>
            </xsl:if>
         </col>
         <col>
            <xsl:if test="$col2-width!=''">
               <xsl:attribute name="style">
                  <xsl:text>width: </xsl:text>
                  <xsl:value-of select="$col2-width"/>
               </xsl:attribute>
            </xsl:if>
         </col>
         <col>
            <xsl:if test="$col3-width!=''">
               <xsl:attribute name="style">
                  <xsl:text>width: </xsl:text>
                  <xsl:value-of select="$col3-width"/>
               </xsl:attribute>
            </xsl:if>
         </col>
         <tbody>
            <tr valign="baseline">
               <td align="right">
                  <xsl:if test="$itemlabel-colnum=1">
                     <xsl:attribute name="style">word-break: keep-all; </xsl:attribute>
                     <xsl:apply-templates select="_sfe:BeforeOrAfterText[1]"/>
                  </xsl:if>
               </td>
               <td align="{$col2-align}">
                  <xsl:if test="$itemlabel-colnum=2">
                     <xsl:attribute name="style">word-break: keep-all; </xsl:attribute>
                     <xsl:apply-templates select="_sfe:BeforeOrAfterText[1]"/>
                  </xsl:if>
               </td>
               <td>
                  <xsl:if test="$itemlabel-colnum=3">
                     <xsl:attribute name="style">word-break: keep-all; </xsl:attribute>
                     <xsl:apply-templates select="_sfe:BeforeOrAfterText[1]"/>
                  </xsl:if>
                  <!--Process this element's content--><xsl:apply-templates select="node()[name(.)!='_sfe:BeforeOrAfterText']"/>
               </td>
            </tr>
         </tbody>
      </table>
   </xsl:template>

   <!--Gentext template for Context: numlist/step3-->
<xsl:template match="numlist/step3" mode="expand-gentext" priority="2">
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
            </_sfe:BeforeOrAfterText>
         </xsl:if>
         <xsl:apply-templates select="* | text() | processing-instruction()" mode="expand-gentext"/>
      </xsl:copy>
   </xsl:template>

   <!--Initial pass template for Context: numlist/step3-->
<xsl:template match="numlist/step3" mode="initial-pass-mode" priority="2">
      <xsl:copy>
         <xsl:call-template name="maybe-set-gte-id"/>
         <xsl:apply-templates select="@*|node()" mode="initial-pass-mode"/>
      </xsl:copy>
   </xsl:template>

   <!--Numbering template for context=numlist/step3-->
<xsl:template match="numlist/step3" mode="styler_numbering" priority="2">
      <xsl:number count="numlist/step3" format="1"/>
      <xsl:text>.</xsl:text>
   </xsl:template>

   <!--Set count-as pass template for Context: numlist/step3-->
<xsl:template match="numlist/step3" mode="set-countas" priority="2">
      <xsl:copy>
         <xsl:apply-templates select="@*|node()" mode="set-countas"/>
      </xsl:copy>
   </xsl:template>

   <!--LabelAndNumberMarker template-->
<xsl:template match="numlist/step3" mode="styler-LabelAndNumberMarker" priority="2">
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
   </xsl:template>

   <!--Set ch:chunk template for Context: numlist/step3-->
<xsl:template match="numlist/step3" mode="set-ch-chunk" priority="2">
      <xsl:copy>
         <xsl:if test="not(@_gte:did-set-chunk)">
            <xsl:attribute name="_gte:did-set-chunk">yes</xsl:attribute>
         </xsl:if>
         <xsl:apply-templates select="@*|node()" mode="set-ch-chunk"/>
      </xsl:copy>
   </xsl:template>

   <!--Style template for Context: step3[child::*[1] != 'note']-->
<xsl:template name="__style-for_step3.3st3p3282">
      <xsl:text> .x-step3-2-0 {margin-left: 0pt; margin-right: 0pt; text-indent: 0pt; margin-top: 6pt; margin-bottom: 6pt; margin-left: 0pt; text-indent: 0pt; }</xsl:text>
   </xsl:template>

   <!--Template for Context: step3[child::*[1] != 'note']-->
<xsl:template match="step3[child::*[1] != 'note']" priority="1">
      <table border="0" cellpadding="0" cellspacing="0">
         <xsl:attribute name="style">
            <xsl:variable name="followWith">emspace</xsl:variable>
            <xsl:if test="$followWith='tab'">table-layout: fixed; </xsl:if>
         </xsl:attribute>
         <!--Emit class values to reflect conditions--><xsl:attribute name="class">
            <xsl:text> x-step3-2-0</xsl:text> x--zero-left-margins</xsl:attribute>
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
         <xsl:variable name="col1-width">0pt</xsl:variable>
         <xsl:variable name="col2-width"/>
         <xsl:variable name="col3-width">100%</xsl:variable>
         <xsl:variable name="itemlabel-colnum">2</xsl:variable>
         <xsl:variable name="col2-align">left</xsl:variable>
         <col>
            <xsl:if test="$col1-width!=''">
               <xsl:attribute name="style">
                  <xsl:text>width: </xsl:text>
                  <xsl:value-of select="$col1-width"/>
               </xsl:attribute>
            </xsl:if>
         </col>
         <col>
            <xsl:if test="$col2-width!=''">
               <xsl:attribute name="style">
                  <xsl:text>width: </xsl:text>
                  <xsl:value-of select="$col2-width"/>
               </xsl:attribute>
            </xsl:if>
         </col>
         <col>
            <xsl:if test="$col3-width!=''">
               <xsl:attribute name="style">
                  <xsl:text>width: </xsl:text>
                  <xsl:value-of select="$col3-width"/>
               </xsl:attribute>
            </xsl:if>
         </col>
         <tbody>
            <tr valign="baseline">
               <td align="right">
                  <xsl:if test="$itemlabel-colnum=1">
                     <xsl:attribute name="style">word-break: keep-all; </xsl:attribute>
                     <xsl:apply-templates select="_sfe:BeforeOrAfterText[1]"/>
                  </xsl:if>
               </td>
               <td align="{$col2-align}">
                  <xsl:if test="$itemlabel-colnum=2">
                     <xsl:attribute name="style">word-break: keep-all; </xsl:attribute>
                     <xsl:apply-templates select="_sfe:BeforeOrAfterText[1]"/>
                  </xsl:if>
               </td>
               <td>
                  <xsl:if test="$itemlabel-colnum=3">
                     <xsl:attribute name="style">word-break: keep-all; </xsl:attribute>
                     <xsl:apply-templates select="_sfe:BeforeOrAfterText[1]"/>
                  </xsl:if>
                  <!--Process this element's content--><xsl:apply-templates select="node()[name(.)!='_sfe:BeforeOrAfterText']"/>
               </td>
            </tr>
         </tbody>
      </table>
   </xsl:template>

   <!--Gentext template for Context: step3[child::*[1] != 'note']-->
<xsl:template match="step3[child::*[1] != 'note']" mode="expand-gentext" priority="1">
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
               <xsl:text> </xsl:text>
            </_sfe:BeforeOrAfterText>
         </xsl:if>
         <xsl:apply-templates select="* | text() | processing-instruction()" mode="expand-gentext"/>
      </xsl:copy>
   </xsl:template>

   <!--Initial pass template for Context: step3[child::*[1] != 'note']-->
<xsl:template match="step3[child::*[1] != 'note']" mode="initial-pass-mode" priority="1">
      <xsl:copy>
         <xsl:call-template name="maybe-set-gte-id"/>
         <xsl:apply-templates select="@*|node()" mode="initial-pass-mode"/>
      </xsl:copy>
   </xsl:template>

   <!--Numbering template for context=step3[child::*[1] != 'note']-->
<xsl:template match="step3[child::*[1] != 'note']" mode="styler_numbering" priority="1">
      <xsl:variable name="node-id" select="generate-id(.)"/>
      <xsl:variable name="from-node"
                    select="(ancestor-or-self::step2[not(ancestor::step2)])[last()]"/>
      <xsl:variable name="num">
         <xsl:variable name="candidate-num">
            <xsl:choose>
               <xsl:when test="count($from-node) &gt; 0">
                  <xsl:for-each select="$from-node/descendant-or-self::*[@_gte:count-as-id='cnt__^step2.cnt']">
                     <xsl:if test="generate-id(.) = $node-id">
                        <xsl:value-of select="position()"/>
                     </xsl:if>
                  </xsl:for-each>
               </xsl:when>
               <xsl:otherwise>
                  <xsl:for-each select="//*[@_gte:count-as-id='cnt__^step2.cnt'][not(ancestor-or-self::step2)]">
                     <xsl:if test="generate-id(.) = $node-id">
                        <xsl:value-of select="position()"/>
                     </xsl:if>
                  </xsl:for-each>
               </xsl:otherwise>
            </xsl:choose>
         </xsl:variable>
         <xsl:choose>
            <xsl:when test="string(number($candidate-num))!='NaN'">
               <xsl:value-of select="$candidate-num"/>
            </xsl:when>
            <xsl:otherwise>1</xsl:otherwise>
         </xsl:choose>
      </xsl:variable>
      <xsl:choose>
         <xsl:when test="string(number($num))!='NaN'">
            <xsl:number value="$num" format="1"/>
         </xsl:when>
         <xsl:otherwise>?</xsl:otherwise>
      </xsl:choose>
   </xsl:template>

   <!--Set count-as pass template for Context: step3[child::*[1] != 'note']-->
<xsl:template match="step3[child::*[1] != 'note']" mode="set-countas" priority="1">
      <xsl:copy>
         <xsl:attribute name="_gte:count-as-id">cnt__^step2.cnt</xsl:attribute>
         <xsl:apply-templates select="@*|node()" mode="set-countas"/>
      </xsl:copy>
   </xsl:template>

   <!--LabelAndNumberMarker template-->
<xsl:template match="step3[child::*[1] != 'note']" mode="styler-LabelAndNumberMarker"
                 priority="1">
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
   </xsl:template>

   <!--Set ch:chunk template for Context: step3[child::*[1] != 'note']-->
<xsl:template match="step3[child::*[1] != 'note']" mode="set-ch-chunk" priority="1">
      <xsl:copy>
         <xsl:if test="not(@_gte:did-set-chunk)">
            <xsl:attribute name="_gte:did-set-chunk">yes</xsl:attribute>
         </xsl:if>
         <xsl:apply-templates select="@*|node()" mode="set-ch-chunk"/>
      </xsl:copy>
   </xsl:template>

   <!--Style template for Context: step3-->
<xsl:template name="__style-for_step3.3st3p353">
      <xsl:text> .x-step3-3-0 {margin-left: 0pt; margin-right: 0pt; text-indent: 0pt; margin-top: 6pt; margin-bottom: 6pt; margin-left: 0pt; text-indent: 0pt; }</xsl:text>
   </xsl:template>

   <!--Template for Context: step3-->
<xsl:template match="step3" priority="0">
      <table border="0" cellpadding="0" cellspacing="0">
         <xsl:attribute name="style">
            <xsl:variable name="followWith">emspace</xsl:variable>
            <xsl:if test="$followWith='tab'">table-layout: fixed; </xsl:if>
         </xsl:attribute>
         <!--Emit class values to reflect conditions--><xsl:attribute name="class">
            <xsl:text> x-step3-3-0</xsl:text> x--zero-left-margins</xsl:attribute>
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
         <xsl:variable name="col1-width">0pt</xsl:variable>
         <xsl:variable name="col2-width"/>
         <xsl:variable name="col3-width">100%</xsl:variable>
         <xsl:variable name="itemlabel-colnum">2</xsl:variable>
         <xsl:variable name="col2-align">left</xsl:variable>
         <col>
            <xsl:if test="$col1-width!=''">
               <xsl:attribute name="style">
                  <xsl:text>width: </xsl:text>
                  <xsl:value-of select="$col1-width"/>
               </xsl:attribute>
            </xsl:if>
         </col>
         <col>
            <xsl:if test="$col2-width!=''">
               <xsl:attribute name="style">
                  <xsl:text>width: </xsl:text>
                  <xsl:value-of select="$col2-width"/>
               </xsl:attribute>
            </xsl:if>
         </col>
         <col>
            <xsl:if test="$col3-width!=''">
               <xsl:attribute name="style">
                  <xsl:text>width: </xsl:text>
                  <xsl:value-of select="$col3-width"/>
               </xsl:attribute>
            </xsl:if>
         </col>
         <tbody>
            <tr valign="baseline">
               <td align="right">
                  <xsl:if test="$itemlabel-colnum=1">
                     <xsl:attribute name="style">word-break: keep-all; </xsl:attribute>
                     <xsl:apply-templates select="_sfe:BeforeOrAfterText[1]"/>
                  </xsl:if>
               </td>
               <td align="{$col2-align}">
                  <xsl:if test="$itemlabel-colnum=2">
                     <xsl:attribute name="style">word-break: keep-all; </xsl:attribute>
                     <xsl:apply-templates select="_sfe:BeforeOrAfterText[1]"/>
                  </xsl:if>
               </td>
               <td>
                  <xsl:if test="$itemlabel-colnum=3">
                     <xsl:attribute name="style">word-break: keep-all; </xsl:attribute>
                     <xsl:apply-templates select="_sfe:BeforeOrAfterText[1]"/>
                  </xsl:if>
                  <!--Process this element's content--><xsl:apply-templates select="node()[name(.)!='_sfe:BeforeOrAfterText']"/>
               </td>
            </tr>
         </tbody>
      </table>
   </xsl:template>

   <!--Gentext template for Context: step3-->
<xsl:template match="step3" mode="expand-gentext" priority="0">
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
               <span style="text-decoration: underline; ">
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
               </span>
               <xsl:text> </xsl:text>
               <xsl:text> </xsl:text>
            </_sfe:BeforeOrAfterText>
         </xsl:if>
         <xsl:apply-templates select="* | text() | processing-instruction()" mode="expand-gentext"/>
      </xsl:copy>
   </xsl:template>

   <!--Initial pass template for Context: step3-->
<xsl:template match="step3" mode="initial-pass-mode" priority="0">
      <xsl:copy>
         <xsl:call-template name="maybe-set-gte-id"/>
         <xsl:apply-templates select="@*|node()" mode="initial-pass-mode"/>
      </xsl:copy>
   </xsl:template>

   <!--Numbering template for context=step3-->
<xsl:template match="step3" mode="styler_numbering" priority="0">
      <xsl:variable name="node-id" select="generate-id(.)"/>
      <xsl:variable name="from-node"
                    select="(ancestor-or-self::step2[not(ancestor::step2)])[last()]"/>
      <xsl:variable name="num">
         <xsl:variable name="candidate-num">
            <xsl:choose>
               <xsl:when test="count($from-node) &gt; 0">
                  <xsl:for-each select="$from-node/descendant-or-self::*[@_gte:count-as-id='cnt__^step2.cnt']">
                     <xsl:if test="generate-id(.) = $node-id">
                        <xsl:value-of select="position()"/>
                     </xsl:if>
                  </xsl:for-each>
               </xsl:when>
               <xsl:otherwise>
                  <xsl:for-each select="//*[@_gte:count-as-id='cnt__^step2.cnt'][not(ancestor-or-self::step2)]">
                     <xsl:if test="generate-id(.) = $node-id">
                        <xsl:value-of select="position()"/>
                     </xsl:if>
                  </xsl:for-each>
               </xsl:otherwise>
            </xsl:choose>
         </xsl:variable>
         <xsl:choose>
            <xsl:when test="string(number($candidate-num))!='NaN'">
               <xsl:value-of select="$candidate-num"/>
            </xsl:when>
            <xsl:otherwise>1</xsl:otherwise>
         </xsl:choose>
      </xsl:variable>
      <xsl:choose>
         <xsl:when test="string(number($num))!='NaN'">
            <xsl:number value="$num" format="1"/>
         </xsl:when>
         <xsl:otherwise>?</xsl:otherwise>
      </xsl:choose>
   </xsl:template>

   <!--Set count-as pass template for Context: step3-->
<xsl:template match="step3" mode="set-countas" priority="0">
      <xsl:copy>
         <xsl:attribute name="_gte:count-as-id">cnt__^step2.cnt</xsl:attribute>
         <xsl:apply-templates select="@*|node()" mode="set-countas"/>
      </xsl:copy>
   </xsl:template>

   <!--LabelAndNumberMarker template-->
<xsl:template match="step3" mode="styler-LabelAndNumberMarker" priority="0">
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
   </xsl:template>

   <!--Set ch:chunk template for Context: step3-->
<xsl:template match="step3" mode="set-ch-chunk" priority="0">
      <xsl:copy>
         <xsl:if test="not(@_gte:did-set-chunk)">
            <xsl:attribute name="_gte:did-set-chunk">yes</xsl:attribute>
         </xsl:if>
         <xsl:apply-templates select="@*|node()" mode="set-ch-chunk"/>
      </xsl:copy>
   </xsl:template>

   <!--Style template for Context: numlist/step4-->
<xsl:template name="__style-for_step4.3nuisp4131">
      <xsl:text> .x-step4-1-0 {margin-left: 0pt; margin-right: 0pt; text-indent: 0pt; margin-top: 6pt; margin-bottom: 6pt; margin-left: 0pt; text-indent: 0pt; }</xsl:text>
   </xsl:template>

   <!--Template for Context: numlist/step4-->
<xsl:template match="numlist/step4" priority="2">
      <table border="0" cellpadding="0" cellspacing="0">
         <xsl:attribute name="style">
            <xsl:variable name="followWith">tab</xsl:variable>
            <xsl:if test="$followWith='tab'">table-layout: fixed; </xsl:if>
         </xsl:attribute>
         <!--Emit class values to reflect conditions--><xsl:attribute name="class">
            <xsl:text> x-step4-1-0</xsl:text> x--zero-left-margins</xsl:attribute>
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
         <xsl:variable name="col1-width">1.5em</xsl:variable>
         <xsl:variable name="col2-width">12pt</xsl:variable>
         <xsl:variable name="col3-width"/>
         <xsl:variable name="itemlabel-colnum">1</xsl:variable>
         <xsl:variable name="col2-align">right</xsl:variable>
         <col>
            <xsl:if test="$col1-width!=''">
               <xsl:attribute name="style">
                  <xsl:text>width: </xsl:text>
                  <xsl:value-of select="$col1-width"/>
               </xsl:attribute>
            </xsl:if>
         </col>
         <col>
            <xsl:if test="$col2-width!=''">
               <xsl:attribute name="style">
                  <xsl:text>width: </xsl:text>
                  <xsl:value-of select="$col2-width"/>
               </xsl:attribute>
            </xsl:if>
         </col>
         <col>
            <xsl:if test="$col3-width!=''">
               <xsl:attribute name="style">
                  <xsl:text>width: </xsl:text>
                  <xsl:value-of select="$col3-width"/>
               </xsl:attribute>
            </xsl:if>
         </col>
         <tbody>
            <tr valign="baseline">
               <td align="right">
                  <xsl:if test="$itemlabel-colnum=1">
                     <xsl:attribute name="style">word-break: keep-all; </xsl:attribute>
                     <xsl:apply-templates select="_sfe:BeforeOrAfterText[1]"/>
                  </xsl:if>
               </td>
               <td align="{$col2-align}">
                  <xsl:if test="$itemlabel-colnum=2">
                     <xsl:attribute name="style">word-break: keep-all; </xsl:attribute>
                     <xsl:apply-templates select="_sfe:BeforeOrAfterText[1]"/>
                  </xsl:if>
               </td>
               <td>
                  <xsl:if test="$itemlabel-colnum=3">
                     <xsl:attribute name="style">word-break: keep-all; </xsl:attribute>
                     <xsl:apply-templates select="_sfe:BeforeOrAfterText[1]"/>
                  </xsl:if>
                  <!--Process this element's content--><xsl:apply-templates select="node()[name(.)!='_sfe:BeforeOrAfterText']"/>
               </td>
            </tr>
         </tbody>
      </table>
   </xsl:template>

   <!--Gentext template for Context: numlist/step4-->
<xsl:template match="numlist/step4" mode="expand-gentext" priority="2">
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
            </_sfe:BeforeOrAfterText>
         </xsl:if>
         <xsl:apply-templates select="* | text() | processing-instruction()" mode="expand-gentext"/>
      </xsl:copy>
   </xsl:template>

   <!--Initial pass template for Context: numlist/step4-->
<xsl:template match="numlist/step4" mode="initial-pass-mode" priority="2">
      <xsl:copy>
         <xsl:call-template name="maybe-set-gte-id"/>
         <xsl:apply-templates select="@*|node()" mode="initial-pass-mode"/>
      </xsl:copy>
   </xsl:template>

   <!--Numbering template for context=numlist/step4-->
<xsl:template match="numlist/step4" mode="styler_numbering" priority="2">
      <xsl:number count="numlist/step4" format="1"/>
      <xsl:text>.</xsl:text>
   </xsl:template>

   <!--Set count-as pass template for Context: numlist/step4-->
<xsl:template match="numlist/step4" mode="set-countas" priority="2">
      <xsl:copy>
         <xsl:apply-templates select="@*|node()" mode="set-countas"/>
      </xsl:copy>
   </xsl:template>

   <!--LabelAndNumberMarker template-->
<xsl:template match="numlist/step4" mode="styler-LabelAndNumberMarker" priority="2">
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
   </xsl:template>

   <!--Set ch:chunk template for Context: numlist/step4-->
<xsl:template match="numlist/step4" mode="set-ch-chunk" priority="2">
      <xsl:copy>
         <xsl:if test="not(@_gte:did-set-chunk)">
            <xsl:attribute name="_gte:did-set-chunk">yes</xsl:attribute>
         </xsl:if>
         <xsl:apply-templates select="@*|node()" mode="set-ch-chunk"/>
      </xsl:copy>
   </xsl:template>

   <!--Style template for Context: step4[child::*[1] != 'note']-->
<xsl:template name="__style-for_step4.3st4p4282">
      <xsl:text> .x-step4-2-0 {margin-left: 0pt; margin-right: 0pt; text-indent: 0pt; margin-top: 6pt; margin-bottom: 6pt; margin-left: 0pt; text-indent: 0pt; }</xsl:text>
   </xsl:template>

   <!--Template for Context: step4[child::*[1] != 'note']-->
<xsl:template match="step4[child::*[1] != 'note']" priority="1">
      <table border="0" cellpadding="0" cellspacing="0">
         <xsl:attribute name="style">
            <xsl:variable name="followWith">emspace</xsl:variable>
            <xsl:if test="$followWith='tab'">table-layout: fixed; </xsl:if>
         </xsl:attribute>
         <!--Emit class values to reflect conditions--><xsl:attribute name="class">
            <xsl:text> x-step4-2-0</xsl:text> x--zero-left-margins</xsl:attribute>
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
         <xsl:variable name="col1-width">0pt</xsl:variable>
         <xsl:variable name="col2-width"/>
         <xsl:variable name="col3-width">100%</xsl:variable>
         <xsl:variable name="itemlabel-colnum">2</xsl:variable>
         <xsl:variable name="col2-align">left</xsl:variable>
         <col>
            <xsl:if test="$col1-width!=''">
               <xsl:attribute name="style">
                  <xsl:text>width: </xsl:text>
                  <xsl:value-of select="$col1-width"/>
               </xsl:attribute>
            </xsl:if>
         </col>
         <col>
            <xsl:if test="$col2-width!=''">
               <xsl:attribute name="style">
                  <xsl:text>width: </xsl:text>
                  <xsl:value-of select="$col2-width"/>
               </xsl:attribute>
            </xsl:if>
         </col>
         <col>
            <xsl:if test="$col3-width!=''">
               <xsl:attribute name="style">
                  <xsl:text>width: </xsl:text>
                  <xsl:value-of select="$col3-width"/>
               </xsl:attribute>
            </xsl:if>
         </col>
         <tbody>
            <tr valign="baseline">
               <td align="right">
                  <xsl:if test="$itemlabel-colnum=1">
                     <xsl:attribute name="style">word-break: keep-all; </xsl:attribute>
                     <xsl:apply-templates select="_sfe:BeforeOrAfterText[1]"/>
                  </xsl:if>
               </td>
               <td align="{$col2-align}">
                  <xsl:if test="$itemlabel-colnum=2">
                     <xsl:attribute name="style">word-break: keep-all; </xsl:attribute>
                     <xsl:apply-templates select="_sfe:BeforeOrAfterText[1]"/>
                  </xsl:if>
               </td>
               <td>
                  <xsl:if test="$itemlabel-colnum=3">
                     <xsl:attribute name="style">word-break: keep-all; </xsl:attribute>
                     <xsl:apply-templates select="_sfe:BeforeOrAfterText[1]"/>
                  </xsl:if>
                  <!--Process this element's content--><xsl:apply-templates select="node()[name(.)!='_sfe:BeforeOrAfterText']"/>
               </td>
            </tr>
         </tbody>
      </table>
   </xsl:template>

   <!--Gentext template for Context: step4[child::*[1] != 'note']-->
<xsl:template match="step4[child::*[1] != 'note']" mode="expand-gentext" priority="1">
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
               <xsl:text> </xsl:text>
            </_sfe:BeforeOrAfterText>
         </xsl:if>
         <xsl:apply-templates select="* | text() | processing-instruction()" mode="expand-gentext"/>
      </xsl:copy>
   </xsl:template>

   <!--Initial pass template for Context: step4[child::*[1] != 'note']-->
<xsl:template match="step4[child::*[1] != 'note']" mode="initial-pass-mode" priority="1">
      <xsl:copy>
         <xsl:call-template name="maybe-set-gte-id"/>
         <xsl:apply-templates select="@*|node()" mode="initial-pass-mode"/>
      </xsl:copy>
   </xsl:template>

   <!--Numbering template for context=step4[child::*[1] != 'note']-->
<xsl:template match="step4[child::*[1] != 'note']" mode="styler_numbering" priority="1">
      <xsl:variable name="node-id" select="generate-id(.)"/>
      <xsl:variable name="from-node"
                    select="(ancestor-or-self::step3[not(ancestor::step3)])[last()]"/>
      <xsl:variable name="num">
         <xsl:variable name="candidate-num">
            <xsl:choose>
               <xsl:when test="count($from-node) &gt; 0">
                  <xsl:for-each select="$from-node/descendant-or-self::*[@_gte:count-as-id='cnt__^step3.cnt']">
                     <xsl:if test="generate-id(.) = $node-id">
                        <xsl:value-of select="position()"/>
                     </xsl:if>
                  </xsl:for-each>
               </xsl:when>
               <xsl:otherwise>
                  <xsl:for-each select="//*[@_gte:count-as-id='cnt__^step3.cnt'][not(ancestor-or-self::step3)]">
                     <xsl:if test="generate-id(.) = $node-id">
                        <xsl:value-of select="position()"/>
                     </xsl:if>
                  </xsl:for-each>
               </xsl:otherwise>
            </xsl:choose>
         </xsl:variable>
         <xsl:choose>
            <xsl:when test="string(number($candidate-num))!='NaN'">
               <xsl:value-of select="$candidate-num"/>
            </xsl:when>
            <xsl:otherwise>1</xsl:otherwise>
         </xsl:choose>
      </xsl:variable>
      <xsl:choose>
         <xsl:when test="string(number($num))!='NaN'">
            <xsl:number value="$num" format="a"/>
         </xsl:when>
         <xsl:otherwise>?</xsl:otherwise>
      </xsl:choose>
   </xsl:template>

   <!--Set count-as pass template for Context: step4[child::*[1] != 'note']-->
<xsl:template match="step4[child::*[1] != 'note']" mode="set-countas" priority="1">
      <xsl:copy>
         <xsl:attribute name="_gte:count-as-id">cnt__^step3.cnt</xsl:attribute>
         <xsl:apply-templates select="@*|node()" mode="set-countas"/>
      </xsl:copy>
   </xsl:template>

   <!--LabelAndNumberMarker template-->
<xsl:template match="step4[child::*[1] != 'note']" mode="styler-LabelAndNumberMarker"
                 priority="1">
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
   </xsl:template>

   <!--Set ch:chunk template for Context: step4[child::*[1] != 'note']-->
<xsl:template match="step4[child::*[1] != 'note']" mode="set-ch-chunk" priority="1">
      <xsl:copy>
         <xsl:if test="not(@_gte:did-set-chunk)">
            <xsl:attribute name="_gte:did-set-chunk">yes</xsl:attribute>
         </xsl:if>
         <xsl:apply-templates select="@*|node()" mode="set-ch-chunk"/>
      </xsl:copy>
   </xsl:template>

   <!--Style template for Context: step4-->
<xsl:template name="__style-for_step4.3st4p453">
      <xsl:text> .x-step4-3-0 {margin-left: 0pt; margin-right: 0pt; text-indent: 0pt; margin-top: 6pt; margin-bottom: 6pt; margin-left: 0pt; text-indent: 0pt; }</xsl:text>
   </xsl:template>

   <!--Template for Context: step4-->
<xsl:template match="step4" priority="0">
      <table border="0" cellpadding="0" cellspacing="0">
         <xsl:attribute name="style">
            <xsl:variable name="followWith">emspace</xsl:variable>
            <xsl:if test="$followWith='tab'">table-layout: fixed; </xsl:if>
         </xsl:attribute>
         <!--Emit class values to reflect conditions--><xsl:attribute name="class">
            <xsl:text> x-step4-3-0</xsl:text> x--zero-left-margins</xsl:attribute>
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
         <xsl:variable name="col1-width">0pt</xsl:variable>
         <xsl:variable name="col2-width"/>
         <xsl:variable name="col3-width">100%</xsl:variable>
         <xsl:variable name="itemlabel-colnum">2</xsl:variable>
         <xsl:variable name="col2-align">left</xsl:variable>
         <col>
            <xsl:if test="$col1-width!=''">
               <xsl:attribute name="style">
                  <xsl:text>width: </xsl:text>
                  <xsl:value-of select="$col1-width"/>
               </xsl:attribute>
            </xsl:if>
         </col>
         <col>
            <xsl:if test="$col2-width!=''">
               <xsl:attribute name="style">
                  <xsl:text>width: </xsl:text>
                  <xsl:value-of select="$col2-width"/>
               </xsl:attribute>
            </xsl:if>
         </col>
         <col>
            <xsl:if test="$col3-width!=''">
               <xsl:attribute name="style">
                  <xsl:text>width: </xsl:text>
                  <xsl:value-of select="$col3-width"/>
               </xsl:attribute>
            </xsl:if>
         </col>
         <tbody>
            <tr valign="baseline">
               <td align="right">
                  <xsl:if test="$itemlabel-colnum=1">
                     <xsl:attribute name="style">word-break: keep-all; </xsl:attribute>
                     <xsl:apply-templates select="_sfe:BeforeOrAfterText[1]"/>
                  </xsl:if>
               </td>
               <td align="{$col2-align}">
                  <xsl:if test="$itemlabel-colnum=2">
                     <xsl:attribute name="style">word-break: keep-all; </xsl:attribute>
                     <xsl:apply-templates select="_sfe:BeforeOrAfterText[1]"/>
                  </xsl:if>
               </td>
               <td>
                  <xsl:if test="$itemlabel-colnum=3">
                     <xsl:attribute name="style">word-break: keep-all; </xsl:attribute>
                     <xsl:apply-templates select="_sfe:BeforeOrAfterText[1]"/>
                  </xsl:if>
                  <!--Process this element's content--><xsl:apply-templates select="node()[name(.)!='_sfe:BeforeOrAfterText']"/>
               </td>
            </tr>
         </tbody>
      </table>
   </xsl:template>

   <!--Gentext template for Context: step4-->
<xsl:template match="step4" mode="expand-gentext" priority="0">
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
               <span style="text-decoration: underline; ">
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
               </span>
               <xsl:text> </xsl:text>
               <xsl:text> </xsl:text>
            </_sfe:BeforeOrAfterText>
         </xsl:if>
         <xsl:apply-templates select="* | text() | processing-instruction()" mode="expand-gentext"/>
      </xsl:copy>
   </xsl:template>

   <!--Initial pass template for Context: step4-->
<xsl:template match="step4" mode="initial-pass-mode" priority="0">
      <xsl:copy>
         <xsl:call-template name="maybe-set-gte-id"/>
         <xsl:apply-templates select="@*|node()" mode="initial-pass-mode"/>
      </xsl:copy>
   </xsl:template>

   <!--Numbering template for context=step4-->
<xsl:template match="step4" mode="styler_numbering" priority="0">
      <xsl:variable name="node-id" select="generate-id(.)"/>
      <xsl:variable name="from-node"
                    select="(ancestor-or-self::step3[not(ancestor::step3)])[last()]"/>
      <xsl:variable name="num">
         <xsl:variable name="candidate-num">
            <xsl:choose>
               <xsl:when test="count($from-node) &gt; 0">
                  <xsl:for-each select="$from-node/descendant-or-self::*[@_gte:count-as-id='cnt__^step3.cnt']">
                     <xsl:if test="generate-id(.) = $node-id">
                        <xsl:value-of select="position()"/>
                     </xsl:if>
                  </xsl:for-each>
               </xsl:when>
               <xsl:otherwise>
                  <xsl:for-each select="//*[@_gte:count-as-id='cnt__^step3.cnt'][not(ancestor-or-self::step3)]">
                     <xsl:if test="generate-id(.) = $node-id">
                        <xsl:value-of select="position()"/>
                     </xsl:if>
                  </xsl:for-each>
               </xsl:otherwise>
            </xsl:choose>
         </xsl:variable>
         <xsl:choose>
            <xsl:when test="string(number($candidate-num))!='NaN'">
               <xsl:value-of select="$candidate-num"/>
            </xsl:when>
            <xsl:otherwise>1</xsl:otherwise>
         </xsl:choose>
      </xsl:variable>
      <xsl:choose>
         <xsl:when test="string(number($num))!='NaN'">
            <xsl:number value="$num" format="a"/>
         </xsl:when>
         <xsl:otherwise>?</xsl:otherwise>
      </xsl:choose>
   </xsl:template>

   <!--Set count-as pass template for Context: step4-->
<xsl:template match="step4" mode="set-countas" priority="0">
      <xsl:copy>
         <xsl:attribute name="_gte:count-as-id">cnt__^step3.cnt</xsl:attribute>
         <xsl:apply-templates select="@*|node()" mode="set-countas"/>
      </xsl:copy>
   </xsl:template>

   <!--LabelAndNumberMarker template-->
<xsl:template match="step4" mode="styler-LabelAndNumberMarker" priority="0">
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
   </xsl:template>

   <!--Set ch:chunk template for Context: step4-->
<xsl:template match="step4" mode="set-ch-chunk" priority="0">
      <xsl:copy>
         <xsl:if test="not(@_gte:did-set-chunk)">
            <xsl:attribute name="_gte:did-set-chunk">yes</xsl:attribute>
         </xsl:if>
         <xsl:apply-templates select="@*|node()" mode="set-ch-chunk"/>
      </xsl:copy>
   </xsl:template>

   <!--Style template for Context: numlist/step5-->
<xsl:template name="__style-for_step5.3nuisp5131">
      <xsl:text> .x-step5-1-0 {margin-left: 0pt; margin-right: 0pt; text-indent: 0pt; margin-top: 6pt; margin-bottom: 6pt; margin-left: 0pt; text-indent: 0pt; }</xsl:text>
   </xsl:template>

   <!--Template for Context: numlist/step5-->
<xsl:template match="numlist/step5" priority="2">
      <table border="0" cellpadding="0" cellspacing="0">
         <xsl:attribute name="style">
            <xsl:variable name="followWith">tab</xsl:variable>
            <xsl:if test="$followWith='tab'">table-layout: fixed; </xsl:if>
         </xsl:attribute>
         <!--Emit class values to reflect conditions--><xsl:attribute name="class">
            <xsl:text> x-step5-1-0</xsl:text> x--zero-left-margins</xsl:attribute>
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
         <xsl:variable name="col1-width">1.5em</xsl:variable>
         <xsl:variable name="col2-width">12pt</xsl:variable>
         <xsl:variable name="col3-width"/>
         <xsl:variable name="itemlabel-colnum">1</xsl:variable>
         <xsl:variable name="col2-align">right</xsl:variable>
         <col>
            <xsl:if test="$col1-width!=''">
               <xsl:attribute name="style">
                  <xsl:text>width: </xsl:text>
                  <xsl:value-of select="$col1-width"/>
               </xsl:attribute>
            </xsl:if>
         </col>
         <col>
            <xsl:if test="$col2-width!=''">
               <xsl:attribute name="style">
                  <xsl:text>width: </xsl:text>
                  <xsl:value-of select="$col2-width"/>
               </xsl:attribute>
            </xsl:if>
         </col>
         <col>
            <xsl:if test="$col3-width!=''">
               <xsl:attribute name="style">
                  <xsl:text>width: </xsl:text>
                  <xsl:value-of select="$col3-width"/>
               </xsl:attribute>
            </xsl:if>
         </col>
         <tbody>
            <tr valign="baseline">
               <td align="right">
                  <xsl:if test="$itemlabel-colnum=1">
                     <xsl:attribute name="style">word-break: keep-all; </xsl:attribute>
                     <xsl:apply-templates select="_sfe:BeforeOrAfterText[1]"/>
                  </xsl:if>
               </td>
               <td align="{$col2-align}">
                  <xsl:if test="$itemlabel-colnum=2">
                     <xsl:attribute name="style">word-break: keep-all; </xsl:attribute>
                     <xsl:apply-templates select="_sfe:BeforeOrAfterText[1]"/>
                  </xsl:if>
               </td>
               <td>
                  <xsl:if test="$itemlabel-colnum=3">
                     <xsl:attribute name="style">word-break: keep-all; </xsl:attribute>
                     <xsl:apply-templates select="_sfe:BeforeOrAfterText[1]"/>
                  </xsl:if>
                  <!--Process this element's content--><xsl:apply-templates select="node()[name(.)!='_sfe:BeforeOrAfterText']"/>
               </td>
            </tr>
         </tbody>
      </table>
   </xsl:template>

   <!--Gentext template for Context: numlist/step5-->
<xsl:template match="numlist/step5" mode="expand-gentext" priority="2">
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
            </_sfe:BeforeOrAfterText>
         </xsl:if>
         <xsl:apply-templates select="* | text() | processing-instruction()" mode="expand-gentext"/>
      </xsl:copy>
   </xsl:template>

   <!--Initial pass template for Context: numlist/step5-->
<xsl:template match="numlist/step5" mode="initial-pass-mode" priority="2">
      <xsl:copy>
         <xsl:call-template name="maybe-set-gte-id"/>
         <xsl:apply-templates select="@*|node()" mode="initial-pass-mode"/>
      </xsl:copy>
   </xsl:template>

   <!--Numbering template for context=numlist/step5-->
<xsl:template match="numlist/step5" mode="styler_numbering" priority="2">
      <xsl:number count="numlist/step5" format="1"/>
      <xsl:text>.</xsl:text>
   </xsl:template>

   <!--Set count-as pass template for Context: numlist/step5-->
<xsl:template match="numlist/step5" mode="set-countas" priority="2">
      <xsl:copy>
         <xsl:apply-templates select="@*|node()" mode="set-countas"/>
      </xsl:copy>
   </xsl:template>

   <!--LabelAndNumberMarker template-->
<xsl:template match="numlist/step5" mode="styler-LabelAndNumberMarker" priority="2">
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
   </xsl:template>

   <!--Set ch:chunk template for Context: numlist/step5-->
<xsl:template match="numlist/step5" mode="set-ch-chunk" priority="2">
      <xsl:copy>
         <xsl:if test="not(@_gte:did-set-chunk)">
            <xsl:attribute name="_gte:did-set-chunk">yes</xsl:attribute>
         </xsl:if>
         <xsl:apply-templates select="@*|node()" mode="set-ch-chunk"/>
      </xsl:copy>
   </xsl:template>

   <!--Style template for Context: step5[child::*[1] != 'note']-->
<xsl:template name="__style-for_step5.3st5p5282">
      <xsl:text> .x-step5-2-0 {margin-left: 0pt; margin-right: 0pt; text-indent: 0pt; margin-top: 6pt; margin-bottom: 6pt; margin-left: 0pt; text-indent: 0pt; }</xsl:text>
   </xsl:template>

   <!--Template for Context: step5[child::*[1] != 'note']-->
<xsl:template match="step5[child::*[1] != 'note']" priority="1">
      <table border="0" cellpadding="0" cellspacing="0">
         <xsl:attribute name="style">
            <xsl:variable name="followWith"/>
            <xsl:if test="$followWith='tab'">table-layout: fixed; </xsl:if>
         </xsl:attribute>
         <!--Emit class values to reflect conditions--><xsl:attribute name="class">
            <xsl:text> x-step5-2-0</xsl:text> x--zero-left-margins</xsl:attribute>
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
         <xsl:variable name="col1-width">0pt</xsl:variable>
         <xsl:variable name="col2-width">0pt</xsl:variable>
         <xsl:variable name="col3-width"/>
         <xsl:variable name="itemlabel-colnum">3</xsl:variable>
         <xsl:variable name="col2-align">center</xsl:variable>
         <col>
            <xsl:if test="$col1-width!=''">
               <xsl:attribute name="style">
                  <xsl:text>width: </xsl:text>
                  <xsl:value-of select="$col1-width"/>
               </xsl:attribute>
            </xsl:if>
         </col>
         <col>
            <xsl:if test="$col2-width!=''">
               <xsl:attribute name="style">
                  <xsl:text>width: </xsl:text>
                  <xsl:value-of select="$col2-width"/>
               </xsl:attribute>
            </xsl:if>
         </col>
         <col>
            <xsl:if test="$col3-width!=''">
               <xsl:attribute name="style">
                  <xsl:text>width: </xsl:text>
                  <xsl:value-of select="$col3-width"/>
               </xsl:attribute>
            </xsl:if>
         </col>
         <tbody>
            <tr valign="baseline">
               <td align="right">
                  <xsl:if test="$itemlabel-colnum=1">
                     <xsl:attribute name="style">word-break: keep-all; </xsl:attribute>
                  </xsl:if>
               </td>
               <td align="{$col2-align}">
                  <xsl:if test="$itemlabel-colnum=2">
                     <xsl:attribute name="style">word-break: keep-all; </xsl:attribute>
                  </xsl:if>
               </td>
               <td>
                  <xsl:if test="$itemlabel-colnum=3">
                     <xsl:attribute name="style">word-break: keep-all; </xsl:attribute>
                  </xsl:if>
                  <!--Process this element's content--><xsl:apply-templates select="node()[name(.)!='_sfe:BeforeOrAfterText']"/>
               </td>
            </tr>
         </tbody>
      </table>
   </xsl:template>

   <!--Gentext template for Context: step5[child::*[1] != 'note']-->
<xsl:template match="step5[child::*[1] != 'note']" mode="expand-gentext" priority="1">
      <xsl:copy>
         <xsl:apply-templates select="@*|node()" mode="expand-gentext"/>
      </xsl:copy>
   </xsl:template>

   <!--Initial pass template for Context: step5[child::*[1] != 'note']-->
<xsl:template match="step5[child::*[1] != 'note']" mode="initial-pass-mode" priority="1">
      <xsl:copy>
         <xsl:call-template name="maybe-set-gte-id"/>
         <xsl:apply-templates select="@*|node()" mode="initial-pass-mode"/>
      </xsl:copy>
   </xsl:template>

   <!--Set count-as pass template for Context: step5[child::*[1] != 'note']-->
<xsl:template match="step5[child::*[1] != 'note']" mode="set-countas" priority="1">
      <xsl:copy>
         <xsl:apply-templates select="@*|node()" mode="set-countas"/>
      </xsl:copy>
   </xsl:template>

   <!--Set ch:chunk template for Context: step5[child::*[1] != 'note']-->
<xsl:template match="step5[child::*[1] != 'note']" mode="set-ch-chunk" priority="1">
      <xsl:copy>
         <xsl:if test="not(@_gte:did-set-chunk)">
            <xsl:attribute name="_gte:did-set-chunk">yes</xsl:attribute>
         </xsl:if>
         <xsl:apply-templates select="@*|node()" mode="set-ch-chunk"/>
      </xsl:copy>
   </xsl:template>

   <!--Style template for Context: step5-->
<xsl:template name="__style-for_step5.3st5p553">
      <xsl:text> .x-step5-3-0 {margin-left: 0pt; margin-right: 0pt; text-indent: 0pt; margin-top: 6pt; margin-bottom: 6pt; margin-left: 0pt; text-indent: 0pt; }</xsl:text>
   </xsl:template>

   <!--Template for Context: step5-->
<xsl:template match="step5" priority="0">
      <table border="0" cellpadding="0" cellspacing="0">
         <xsl:attribute name="style">
            <xsl:variable name="followWith"/>
            <xsl:if test="$followWith='tab'">table-layout: fixed; </xsl:if>
         </xsl:attribute>
         <!--Emit class values to reflect conditions--><xsl:attribute name="class">
            <xsl:text> x-step5-3-0</xsl:text> x--zero-left-margins</xsl:attribute>
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
         <xsl:variable name="col1-width">0pt</xsl:variable>
         <xsl:variable name="col2-width">0pt</xsl:variable>
         <xsl:variable name="col3-width"/>
         <xsl:variable name="itemlabel-colnum">3</xsl:variable>
         <xsl:variable name="col2-align">center</xsl:variable>
         <col>
            <xsl:if test="$col1-width!=''">
               <xsl:attribute name="style">
                  <xsl:text>width: </xsl:text>
                  <xsl:value-of select="$col1-width"/>
               </xsl:attribute>
            </xsl:if>
         </col>
         <col>
            <xsl:if test="$col2-width!=''">
               <xsl:attribute name="style">
                  <xsl:text>width: </xsl:text>
                  <xsl:value-of select="$col2-width"/>
               </xsl:attribute>
            </xsl:if>
         </col>
         <col>
            <xsl:if test="$col3-width!=''">
               <xsl:attribute name="style">
                  <xsl:text>width: </xsl:text>
                  <xsl:value-of select="$col3-width"/>
               </xsl:attribute>
            </xsl:if>
         </col>
         <tbody>
            <tr valign="baseline">
               <td align="right">
                  <xsl:if test="$itemlabel-colnum=1">
                     <xsl:attribute name="style">word-break: keep-all; </xsl:attribute>
                  </xsl:if>
               </td>
               <td align="{$col2-align}">
                  <xsl:if test="$itemlabel-colnum=2">
                     <xsl:attribute name="style">word-break: keep-all; </xsl:attribute>
                  </xsl:if>
               </td>
               <td>
                  <xsl:if test="$itemlabel-colnum=3">
                     <xsl:attribute name="style">word-break: keep-all; </xsl:attribute>
                  </xsl:if>
                  <!--Process this element's content--><xsl:apply-templates select="node()[name(.)!='_sfe:BeforeOrAfterText']"/>
               </td>
            </tr>
         </tbody>
      </table>
   </xsl:template>

   <!--Gentext template for Context: step5-->
<xsl:template match="step5" mode="expand-gentext" priority="0">
      <xsl:copy>
         <xsl:apply-templates select="@*|node()" mode="expand-gentext"/>
      </xsl:copy>
   </xsl:template>

   <!--Initial pass template for Context: step5-->
<xsl:template match="step5" mode="initial-pass-mode" priority="0">
      <xsl:copy>
         <xsl:call-template name="maybe-set-gte-id"/>
         <xsl:apply-templates select="@*|node()" mode="initial-pass-mode"/>
      </xsl:copy>
   </xsl:template>

   <!--Set count-as pass template for Context: step5-->
<xsl:template match="step5" mode="set-countas" priority="0">
      <xsl:copy>
         <xsl:apply-templates select="@*|node()" mode="set-countas"/>
      </xsl:copy>
   </xsl:template>

   <!--Set ch:chunk template for Context: step5-->
<xsl:template match="step5" mode="set-ch-chunk" priority="0">
      <xsl:copy>
         <xsl:if test="not(@_gte:did-set-chunk)">
            <xsl:attribute name="_gte:did-set-chunk">yes</xsl:attribute>
         </xsl:if>
         <xsl:apply-templates select="@*|node()" mode="set-ch-chunk"/>
      </xsl:copy>
   </xsl:template>

   <!--Style template for Context: subtask-->
<xsl:template name="__style-for_subtask.1">
      <xsl:text> .x-subtask-1-0 {margin-left: 0pt; margin-right: 0pt; text-indent: 0pt; margin-top: 8pt; margin-left: 18pt; text-indent: 0pt; } .x-subtask-1-1 {} .x-subtask-1-2 {} .x-subtask-1-3 {}</xsl:text>
   </xsl:template>

   <!--Template for Context: subtask-->
<xsl:template match="subtask" priority="0">
      <xsl:variable name="foClass">formalBlock</xsl:variable>
      <xsl:variable name="blockness">block</xsl:variable>
      <xsl:variable name="startnew"/>
      <xsl:variable name="newpageset">#noChange</xsl:variable>
      <div><!--Emit class values to reflect conditions--><xsl:attribute name="class">
            <xsl:text> x-subtask-1-0</xsl:text>
            <xsl:if test="(@confltr) and (not(@confltr) or (@confltr and string(@confltr)!='')) and (@varnbr) and (not(@varnbr) or (@varnbr and string(@varnbr)!='')) and (not(@varnbr) or (@varnbr and string(@varnbr)!='0'))"> x-subtask-1-1</xsl:if>
            <xsl:if test="not((@confltr) and (not(@confltr) or (@confltr and string(@confltr)!='')) and (@varnbr) and (not(@varnbr) or (@varnbr and string(@varnbr)!='')) and (not(@varnbr) or (@varnbr and string(@varnbr)!='0'))) and ((@confltr) and (not(@confltr) or (@confltr and string(@confltr)!='')))"> x-subtask-1-2</xsl:if>
            <xsl:if test="not((@confltr) and (not(@confltr) or (@confltr and string(@confltr)!='')) and (@varnbr) and (not(@varnbr) or (@varnbr and string(@varnbr)!='')) and (not(@varnbr) or (@varnbr and string(@varnbr)!='0'))) and not((@confltr) and (not(@confltr) or (@confltr and string(@confltr)!=''))) and ((@varnbr) and (not(@varnbr) or (@varnbr and string(@varnbr)!='')) and (not(@varnbr) or (@varnbr and string(@varnbr)!='0')))"> x-subtask-1-3</xsl:if>
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
         <xsl:call-template name="maybe-set-id">
            <xsl:with-param name="only-if-id-attr" select="'no'"/>
            <xsl:with-param name="generated-id-prefix" select="'styler-id'"/>
         </xsl:call-template>
         <!--Process this element's content--><xsl:apply-templates/>
      </div>
   </xsl:template>

   <!--Gentext template for Context: subtask-->
<xsl:template match="subtask" mode="expand-gentext" priority="0">
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
            <xsl:when test="not((@confltr) and (not(@confltr) or (@confltr and string(@confltr)!='')) and (@varnbr) and (not(@varnbr) or (@varnbr and string(@varnbr)!='')) and (not(@varnbr) or (@varnbr and string(@varnbr)!='0'))) and not((@confltr) and (not(@confltr) or (@confltr and string(@confltr)!=''))) and ((@varnbr) and (not(@varnbr) or (@varnbr and string(@varnbr)!='')) and (not(@varnbr) or (@varnbr and string(@varnbr)!='0')))"><!--AddBefore Condition #3--><xsl:if test="not(@_gte:Gentext-Expanded)">
                  <_gte:Must-Expand-Gentext/>
                  <_sfe:BeforeOrAfterText>
                     <_ufe:task-postspace>
                        <xsl:text>Subtask </xsl:text>
                        <xsl:value-of select="@chapnbr"/>
                        <xsl:text>-</xsl:text>
                        <xsl:value-of select="@sectnbr"/>
                        <xsl:text>-</xsl:text>
                        <xsl:value-of select="@subjnbr"/>
                        <xsl:text>-</xsl:text>
                        <xsl:value-of select="@func"/>
                        <xsl:text>-</xsl:text>
                        <xsl:value-of select="@seq"/>
                        <xsl:text>-</xsl:text>
                        <xsl:value-of select="@varnbr"/>
                     </_ufe:task-postspace>
                  </_sfe:BeforeOrAfterText>
               </xsl:if>
            </xsl:when>
            <xsl:when test="not((@confltr) and (not(@confltr) or (@confltr and string(@confltr)!='')) and (@varnbr) and (not(@varnbr) or (@varnbr and string(@varnbr)!='')) and (not(@varnbr) or (@varnbr and string(@varnbr)!='0'))) and ((@confltr) and (not(@confltr) or (@confltr and string(@confltr)!='')))"><!--AddBefore Condition #2--><xsl:if test="not(@_gte:Gentext-Expanded)">
                  <_gte:Must-Expand-Gentext/>
                  <_sfe:BeforeOrAfterText>
                     <_ufe:task-postspace>
                        <xsl:text>Subtask </xsl:text>
                        <xsl:value-of select="@chapnbr"/>
                        <xsl:text>-</xsl:text>
                        <xsl:value-of select="@sectnbr"/>
                        <xsl:text>-</xsl:text>
                        <xsl:value-of select="@subjnbr"/>
                        <xsl:text>-</xsl:text>
                        <xsl:value-of select="@func"/>
                        <xsl:text>-</xsl:text>
                        <xsl:value-of select="@seq"/>
                        <xsl:text>-</xsl:text>
                        <xsl:value-of select="@confltr"/>
                     </_ufe:task-postspace>
                  </_sfe:BeforeOrAfterText>
               </xsl:if>
            </xsl:when>
            <xsl:when test="(@confltr) and (not(@confltr) or (@confltr and string(@confltr)!='')) and (@varnbr) and (not(@varnbr) or (@varnbr and string(@varnbr)!='')) and (not(@varnbr) or (@varnbr and string(@varnbr)!='0'))"><!--AddBefore Condition #1--><xsl:if test="not(@_gte:Gentext-Expanded)">
                  <_gte:Must-Expand-Gentext/>
                  <_sfe:BeforeOrAfterText>
                     <_ufe:task-postspace>
                        <xsl:text>Subtask </xsl:text>
                        <xsl:value-of select="@chapnbr"/>
                        <xsl:text>-</xsl:text>
                        <xsl:value-of select="@sectnbr"/>
                        <xsl:text>-</xsl:text>
                        <xsl:value-of select="@subjnbr"/>
                        <xsl:text>-</xsl:text>
                        <xsl:value-of select="@func"/>
                        <xsl:text>-</xsl:text>
                        <xsl:value-of select="@seq"/>
                        <xsl:text>-</xsl:text>
                        <xsl:value-of select="@confltr"/>
                        <xsl:text>-</xsl:text>
                        <xsl:value-of select="@varnbr"/>
                     </_ufe:task-postspace>
                  </_sfe:BeforeOrAfterText>
               </xsl:if>
            </xsl:when>
            <xsl:otherwise>
               <xsl:if test="not(@_gte:Gentext-Expanded)">
                  <_gte:Must-Expand-Gentext/>
                  <_sfe:BeforeOrAfterText>
                     <_ufe:task-postspace>
                        <xsl:text>Subtask </xsl:text>
                        <xsl:value-of select="@chapnbr"/>
                        <xsl:text>-</xsl:text>
                        <xsl:value-of select="@sectnbr"/>
                        <xsl:text>-</xsl:text>
                        <xsl:value-of select="@subjnbr"/>
                        <xsl:text>-</xsl:text>
                        <xsl:value-of select="@func"/>
                        <xsl:text>-</xsl:text>
                        <xsl:value-of select="@seq"/>
                     </_ufe:task-postspace>
                  </_sfe:BeforeOrAfterText>
               </xsl:if>
            </xsl:otherwise>
         </xsl:choose>
         <xsl:apply-templates select="* | text() | processing-instruction()" mode="expand-gentext"/>
      </xsl:copy>
   </xsl:template>

   <!--Initial pass template for Context: subtask-->
<xsl:template match="subtask" mode="initial-pass-mode" priority="0">
      <xsl:copy>
         <xsl:call-template name="maybe-set-gte-id"/>
         <xsl:apply-templates select="@*|node()" mode="initial-pass-mode"/>
      </xsl:copy>
   </xsl:template>

   <!--Set count-as pass template for Context: subtask-->
<xsl:template match="subtask" mode="set-countas" priority="0">
      <xsl:copy>
         <xsl:apply-templates select="@*|node()" mode="set-countas"/>
      </xsl:copy>
   </xsl:template>

   <!--Set ch:chunk template for Context: subtask-->
<xsl:template match="subtask" mode="set-ch-chunk" priority="0">
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

   <!--Style template for Context: task-->
<xsl:template name="__style-for_task.1">
      <xsl:text> .x-task-1-0 {margin-left: 0pt; margin-right: 0pt; text-indent: 0pt; margin-top: 8pt; } .x-task-1-1 {} .x-task-1-2 {}</xsl:text>
   </xsl:template>

   <!--Template for Context: task-->
<xsl:template match="task" priority="0">
      <xsl:variable name="foClass">formalBlock</xsl:variable>
      <xsl:variable name="blockness">block</xsl:variable>
      <xsl:variable name="startnew"/>
      <xsl:variable name="newpageset">#noChange</xsl:variable>
      <div><!--Emit class values to reflect conditions--><xsl:attribute name="class">
            <xsl:text> x-task-1-0</xsl:text>
            <xsl:if test="(@confltr) and (not(@confltr) or (@confltr and string(@confltr)!=''))"> x-task-1-1</xsl:if>
            <xsl:if test="(@varnbr) and (not(@varnbr) or (@varnbr and string(@varnbr)!='')) and (not(@varnbr) or (@varnbr and string(@varnbr)!='0'))"> x-task-1-2</xsl:if>
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
         <xsl:call-template name="maybe-set-id">
            <xsl:with-param name="only-if-id-attr" select="'no'"/>
            <xsl:with-param name="generated-id-prefix" select="'styler-id'"/>
         </xsl:call-template>
         <!--Process this element's content--><xsl:apply-templates/>
      </div>
   </xsl:template>

   <!--Gentext template for Context: task-->
<xsl:template match="task" mode="expand-gentext" priority="0">
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
            <xsl:when test="(@varnbr) and (not(@varnbr) or (@varnbr and string(@varnbr)!='')) and (not(@varnbr) or (@varnbr and string(@varnbr)!='0'))"><!--AddBefore Condition #2--><xsl:if test="not(@_gte:Gentext-Expanded)">
                  <_gte:Must-Expand-Gentext/>
                  <_sfe:BeforeOrAfterText>
                     <_ufe:task-postspace>
                        <xsl:text>Task </xsl:text>
                        <xsl:value-of select="@chapnbr"/>
                        <xsl:text>-</xsl:text>
                        <xsl:value-of select="@sectnbr"/>
                        <xsl:text>-</xsl:text>
                        <xsl:value-of select="@subjnbr"/>
                        <xsl:text>-</xsl:text>
                        <xsl:value-of select="@func"/>
                        <xsl:text>-</xsl:text>
                        <xsl:value-of select="@seq"/>
                        <xsl:text>-</xsl:text>
                        <xsl:value-of select="@varnbr"/>
                     </_ufe:task-postspace>
                  </_sfe:BeforeOrAfterText>
               </xsl:if>
            </xsl:when>
            <xsl:when test="(@confltr) and (not(@confltr) or (@confltr and string(@confltr)!=''))"><!--AddBefore Condition #1--><xsl:if test="not(@_gte:Gentext-Expanded)">
                  <_gte:Must-Expand-Gentext/>
                  <_sfe:BeforeOrAfterText>
                     <_ufe:task-postspace>
                        <xsl:text>Task </xsl:text>
                        <xsl:value-of select="@chapnbr"/>
                        <xsl:text>-</xsl:text>
                        <xsl:value-of select="@sectnbr"/>
                        <xsl:text>-</xsl:text>
                        <xsl:value-of select="@subjnbr"/>
                        <xsl:text>-</xsl:text>
                        <xsl:value-of select="@func"/>
                        <xsl:text>-</xsl:text>
                        <xsl:value-of select="@seq"/>
                        <xsl:text>-</xsl:text>
                        <xsl:value-of select="@confltr"/>
                     </_ufe:task-postspace>
                  </_sfe:BeforeOrAfterText>
               </xsl:if>
            </xsl:when>
            <xsl:otherwise>
               <xsl:if test="not(@_gte:Gentext-Expanded)">
                  <_gte:Must-Expand-Gentext/>
                  <_sfe:BeforeOrAfterText>
                     <_ufe:task-postspace>
                        <xsl:text>Task </xsl:text>
                        <xsl:value-of select="@chapnbr"/>
                        <xsl:text>-</xsl:text>
                        <xsl:value-of select="@sectnbr"/>
                        <xsl:text>-</xsl:text>
                        <xsl:value-of select="@subjnbr"/>
                        <xsl:text>-</xsl:text>
                        <xsl:value-of select="@func"/>
                        <xsl:text>-</xsl:text>
                        <xsl:value-of select="@seq"/>
                     </_ufe:task-postspace>
                  </_sfe:BeforeOrAfterText>
               </xsl:if>
            </xsl:otherwise>
         </xsl:choose>
         <xsl:apply-templates select="* | text() | processing-instruction()" mode="expand-gentext"/>
      </xsl:copy>
   </xsl:template>

   <!--Initial pass template for Context: task-->
<xsl:template match="task" mode="initial-pass-mode" priority="0">
      <xsl:copy>
         <xsl:call-template name="maybe-set-gte-id"/>
         <xsl:apply-templates select="@*|node()" mode="initial-pass-mode"/>
      </xsl:copy>
   </xsl:template>

   <!--Set count-as pass template for Context: task-->
<xsl:template match="task" mode="set-countas" priority="0">
      <xsl:copy>
         <xsl:apply-templates select="@*|node()" mode="set-countas"/>
      </xsl:copy>
   </xsl:template>

   <!--Set ch:chunk template for Context: task-->
<xsl:template match="task" mode="set-ch-chunk" priority="0">
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

   <!--Style template for Context: taskproc-->
<xsl:template name="__style-for_taskproc.1">
      <xsl:text> .x-taskproc-1-0 {margin-left: 0pt; margin-right: 0pt; text-indent: 0pt; margin-top: 8pt; margin-left: 18pt; text-indent: 0pt; }</xsl:text>
   </xsl:template>

   <!--Template for Context: taskproc-->
<xsl:template match="taskproc" priority="0">
      <div><!--Emit class values to reflect conditions--><xsl:attribute name="class">
            <xsl:text> x-taskproc-1-0</xsl:text>
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

   <!--Gentext template for Context: taskproc-->
<xsl:template match="taskproc" mode="expand-gentext" priority="0">
      <xsl:copy>
         <xsl:apply-templates select="@*|node()" mode="expand-gentext"/>
      </xsl:copy>
   </xsl:template>

   <!--Initial pass template for Context: taskproc-->
<xsl:template match="taskproc" mode="initial-pass-mode" priority="0">
      <xsl:copy>
         <xsl:call-template name="maybe-set-gte-id"/>
         <xsl:apply-templates select="@*|node()" mode="initial-pass-mode"/>
      </xsl:copy>
   </xsl:template>

   <!--Set count-as pass template for Context: taskproc-->
<xsl:template match="taskproc" mode="set-countas" priority="0">
      <xsl:copy>
         <xsl:apply-templates select="@*|node()" mode="set-countas"/>
      </xsl:copy>
   </xsl:template>

   <!--Set ch:chunk template for Context: taskproc-->
<xsl:template match="taskproc" mode="set-ch-chunk" priority="0">
      <xsl:copy>
         <xsl:if test="not(@_gte:did-set-chunk)">
            <xsl:attribute name="_gte:did-set-chunk">yes</xsl:attribute>
         </xsl:if>
         <xsl:apply-templates select="@*|node()" mode="set-ch-chunk"/>
      </xsl:copy>
   </xsl:template>

   <!--Style template for Context: ted-->
<xsl:template name="__style-for_ted.1">
      <xsl:text> .x-ted-1-0 {margin-left: 0pt; margin-right: 0pt; }</xsl:text>
   </xsl:template>

   <!--Template for Context: ted-->
<xsl:template match="ted" priority="0">
      <xsl:param name="hidden" select="'yes'"/>
      <span><!--Emit class values to reflect conditions--><xsl:attribute name="class">
            <xsl:text> x-ted-1-0</xsl:text>
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

   <!--Gentext template for Context: ted-->
<xsl:template match="ted" mode="expand-gentext" priority="0">
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
               <xsl:if test="(ancestor-or-self::ted[1]//toolname)[1]/*|(ancestor-or-self::ted[1]//toolname)[1]/text()|(ancestor-or-self::ted[1]//toolname)[1]/processing-instruction()">
                  <_gte:Gentexted-Content-Wrapper>
                     <xsl:apply-templates mode="expand-gentext"
                                          select="(ancestor-or-self::ted[1]//toolname)[1]/*|(ancestor-or-self::ted[1]//toolname)[1]/text()|(ancestor-or-self::ted[1]//toolname)[1]/processing-instruction()">
                        <xsl:with-param name="skip-expanded-gentext" select="'yes'"/>
                     </xsl:apply-templates>
                  </_gte:Gentexted-Content-Wrapper>
               </xsl:if>
               <xsl:text> (</xsl:text>
               <xsl:if test="(ancestor-or-self::ted[1]//toolnbr)[1]/*|(ancestor-or-self::ted[1]//toolnbr)[1]/text()|(ancestor-or-self::ted[1]//toolnbr)[1]/processing-instruction()">
                  <_gte:Gentexted-Content-Wrapper>
                     <xsl:apply-templates mode="expand-gentext"
                                          select="(ancestor-or-self::ted[1]//toolnbr)[1]/*|(ancestor-or-self::ted[1]//toolnbr)[1]/text()|(ancestor-or-self::ted[1]//toolnbr)[1]/processing-instruction()">
                        <xsl:with-param name="skip-expanded-gentext" select="'yes'"/>
                     </xsl:apply-templates>
                  </_gte:Gentexted-Content-Wrapper>
               </xsl:if>
               <xsl:text>)</xsl:text>
            </_sfe:BeforeOrAfterText>
         </xsl:if>
         <xsl:apply-templates select="* | text() | processing-instruction()" mode="expand-gentext"/>
      </xsl:copy>
   </xsl:template>

   <!--Initial pass template for Context: ted-->
<xsl:template match="ted" mode="initial-pass-mode" priority="0">
      <xsl:copy>
         <xsl:call-template name="maybe-set-gte-id"/>
         <xsl:apply-templates select="@*|node()" mode="initial-pass-mode"/>
      </xsl:copy>
   </xsl:template>

   <!--Set count-as pass template for Context: ted-->
<xsl:template match="ted" mode="set-countas" priority="0">
      <xsl:copy>
         <xsl:apply-templates select="@*|node()" mode="set-countas"/>
      </xsl:copy>
   </xsl:template>

   <!--Set ch:chunk template for Context: ted-->
<xsl:template match="ted" mode="set-ch-chunk" priority="0">
      <xsl:copy>
         <xsl:if test="not(@_gte:did-set-chunk)">
            <xsl:attribute name="_gte:did-set-chunk">yes</xsl:attribute>
         </xsl:if>
         <xsl:apply-templates select="@*|node()" mode="set-ch-chunk"/>
      </xsl:copy>
   </xsl:template>

   <!--Collect footnote template for Context: ted-->
<xsl:template match="ted" mode="styler-collect-footnotes" priority="0">
      <xsl:apply-templates select="_sfe:BeforeOrAfterText/*" mode="styler-collect-footnotes"/>
   </xsl:template>

   <!--Style template for Context: teddtl-->
<xsl:template name="__style-for_teddtl.1">
      <xsl:text> .x-teddtl-1-0 {margin-left: 0pt; margin-right: 0pt; }</xsl:text>
   </xsl:template>

   <!--Template for Context: teddtl-->
<xsl:template match="teddtl" priority="0">
      <xsl:param name="hidden" select="'yes'"/>
      <span><!--Emit class values to reflect conditions--><xsl:attribute name="class">
            <xsl:text> x-teddtl-1-0</xsl:text>
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

   <!--Gentext template for Context: teddtl-->
<xsl:template match="teddtl" mode="expand-gentext" priority="0">
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
               <xsl:if test="(ancestor-or-self::teddtl[1]//dtlname)[1]/*|(ancestor-or-self::teddtl[1]//dtlname)[1]/text()|(ancestor-or-self::teddtl[1]//dtlname)[1]/processing-instruction()">
                  <_gte:Gentexted-Content-Wrapper>
                     <xsl:apply-templates mode="expand-gentext"
                                          select="(ancestor-or-self::teddtl[1]//dtlname)[1]/*|(ancestor-or-self::teddtl[1]//dtlname)[1]/text()|(ancestor-or-self::teddtl[1]//dtlname)[1]/processing-instruction()">
                        <xsl:with-param name="skip-expanded-gentext" select="'yes'"/>
                     </xsl:apply-templates>
                  </_gte:Gentexted-Content-Wrapper>
               </xsl:if>
               <xsl:text> (</xsl:text>
               <xsl:if test="(ancestor-or-self::teddtl[1]//dtlnbr)[1]/*|(ancestor-or-self::teddtl[1]//dtlnbr)[1]/text()|(ancestor-or-self::teddtl[1]//dtlnbr)[1]/processing-instruction()">
                  <_gte:Gentexted-Content-Wrapper>
                     <xsl:apply-templates mode="expand-gentext"
                                          select="(ancestor-or-self::teddtl[1]//dtlnbr)[1]/*|(ancestor-or-self::teddtl[1]//dtlnbr)[1]/text()|(ancestor-or-self::teddtl[1]//dtlnbr)[1]/processing-instruction()">
                        <xsl:with-param name="skip-expanded-gentext" select="'yes'"/>
                     </xsl:apply-templates>
                  </_gte:Gentexted-Content-Wrapper>
               </xsl:if>
               <xsl:text> of </xsl:text>
               <xsl:if test="(ancestor-or-self::teddtl[1]//toolnbr)[1]/*|(ancestor-or-self::teddtl[1]//toolnbr)[1]/text()|(ancestor-or-self::teddtl[1]//toolnbr)[1]/processing-instruction()">
                  <_gte:Gentexted-Content-Wrapper>
                     <xsl:apply-templates mode="expand-gentext"
                                          select="(ancestor-or-self::teddtl[1]//toolnbr)[1]/*|(ancestor-or-self::teddtl[1]//toolnbr)[1]/text()|(ancestor-or-self::teddtl[1]//toolnbr)[1]/processing-instruction()">
                        <xsl:with-param name="skip-expanded-gentext" select="'yes'"/>
                     </xsl:apply-templates>
                  </_gte:Gentexted-Content-Wrapper>
               </xsl:if>
               <xsl:text>)</xsl:text>
            </_sfe:BeforeOrAfterText>
         </xsl:if>
         <xsl:apply-templates select="* | text() | processing-instruction()" mode="expand-gentext"/>
      </xsl:copy>
   </xsl:template>

   <!--Initial pass template for Context: teddtl-->
<xsl:template match="teddtl" mode="initial-pass-mode" priority="0">
      <xsl:copy>
         <xsl:call-template name="maybe-set-gte-id"/>
         <xsl:apply-templates select="@*|node()" mode="initial-pass-mode"/>
      </xsl:copy>
   </xsl:template>

   <!--Set count-as pass template for Context: teddtl-->
<xsl:template match="teddtl" mode="set-countas" priority="0">
      <xsl:copy>
         <xsl:apply-templates select="@*|node()" mode="set-countas"/>
      </xsl:copy>
   </xsl:template>

   <!--Set ch:chunk template for Context: teddtl-->
<xsl:template match="teddtl" mode="set-ch-chunk" priority="0">
      <xsl:copy>
         <xsl:if test="not(@_gte:did-set-chunk)">
            <xsl:attribute name="_gte:did-set-chunk">yes</xsl:attribute>
         </xsl:if>
         <xsl:apply-templates select="@*|node()" mode="set-ch-chunk"/>
      </xsl:copy>
   </xsl:template>

   <!--Collect footnote template for Context: teddtl-->
<xsl:template match="teddtl" mode="styler-collect-footnotes" priority="0">
      <xsl:apply-templates select="_sfe:BeforeOrAfterText/*" mode="styler-collect-footnotes"/>
   </xsl:template>

   <!--Style template for Context: tfmatr-->
<xsl:template name="__style-for_tfmatr.1">
      <xsl:text> .x-tfmatr-1-0 {margin-left: 0pt; margin-right: 0pt; text-indent: 0pt; margin-left: 18pt; text-indent: 0pt; }</xsl:text>
   </xsl:template>

   <!--Template for Context: tfmatr-->
<xsl:template match="tfmatr" priority="0">
      <div><!--Emit class values to reflect conditions--><xsl:attribute name="class">
            <xsl:text> x-tfmatr-1-0</xsl:text>
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

   <!--Gentext template for Context: tfmatr-->
<xsl:template match="tfmatr" mode="expand-gentext" priority="0">
      <xsl:copy>
         <xsl:apply-templates select="@*|node()" mode="expand-gentext"/>
      </xsl:copy>
   </xsl:template>

   <!--Initial pass template for Context: tfmatr-->
<xsl:template match="tfmatr" mode="initial-pass-mode" priority="0">
      <xsl:copy>
         <xsl:call-template name="maybe-set-gte-id"/>
         <xsl:apply-templates select="@*|node()" mode="initial-pass-mode"/>
      </xsl:copy>
   </xsl:template>

   <!--Set count-as pass template for Context: tfmatr-->
<xsl:template match="tfmatr" mode="set-countas" priority="0">
      <xsl:copy>
         <xsl:apply-templates select="@*|node()" mode="set-countas"/>
      </xsl:copy>
   </xsl:template>

   <!--Set ch:chunk template for Context: tfmatr-->
<xsl:template match="tfmatr" mode="set-ch-chunk" priority="0">
      <xsl:copy>
         <xsl:if test="not(@_gte:did-set-chunk)">
            <xsl:attribute name="_gte:did-set-chunk">yes</xsl:attribute>
         </xsl:if>
         <xsl:apply-templates select="@*|node()" mode="set-ch-chunk"/>
      </xsl:copy>
   </xsl:template>

   <!--Style template for Context: tprereq-->
<xsl:template name="__style-for_tprereq.1">
      <xsl:text> .x-tprereq-1-0 {margin-left: 0pt; margin-right: 0pt; text-indent: 0pt; margin-top: 8pt; }</xsl:text>
   </xsl:template>

   <!--Template for Context: tprereq-->
<xsl:template match="tprereq" priority="0">
      <div><!--Emit class values to reflect conditions--><xsl:attribute name="class">
            <xsl:text> x-tprereq-1-0</xsl:text>
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

   <!--Gentext template for Context: tprereq-->
<xsl:template match="tprereq" mode="expand-gentext" priority="0">
      <xsl:copy>
         <xsl:apply-templates select="@*|node()" mode="expand-gentext"/>
      </xsl:copy>
   </xsl:template>

   <!--Initial pass template for Context: tprereq-->
<xsl:template match="tprereq" mode="initial-pass-mode" priority="0">
      <xsl:copy>
         <xsl:call-template name="maybe-set-gte-id"/>
         <xsl:apply-templates select="@*|node()" mode="initial-pass-mode"/>
      </xsl:copy>
   </xsl:template>

   <!--Set count-as pass template for Context: tprereq-->
<xsl:template match="tprereq" mode="set-countas" priority="0">
      <xsl:copy>
         <xsl:apply-templates select="@*|node()" mode="set-countas"/>
      </xsl:copy>
   </xsl:template>

   <!--Set ch:chunk template for Context: tprereq-->
<xsl:template match="tprereq" mode="set-ch-chunk" priority="0">
      <xsl:copy>
         <xsl:if test="not(@_gte:did-set-chunk)">
            <xsl:attribute name="_gte:did-set-chunk">yes</xsl:attribute>
         </xsl:if>
         <xsl:apply-templates select="@*|node()" mode="set-ch-chunk"/>
      </xsl:copy>
   </xsl:template>

   <!--Style template for Context: transltr-->
<xsl:template name="__style-for_transltr.1">
      <xsl:text> .x-transltr-1-0 {margin-left: 0pt; margin-right: 0pt; }</xsl:text>
   </xsl:template>

   <!--Template for Context: transltr-->
<xsl:template match="transltr" priority="0"><!--Emit a nostyle template--><xsl:apply-templates/>
   </xsl:template>

   <!--Gentext template for Context: transltr-->
<xsl:template match="transltr" mode="expand-gentext" priority="0">
      <xsl:copy>
         <xsl:apply-templates select="@*|node()" mode="expand-gentext"/>
      </xsl:copy>
   </xsl:template>

   <!--Initial pass template for Context: transltr-->
<xsl:template match="transltr" mode="initial-pass-mode" priority="0">
      <xsl:copy>
         <xsl:call-template name="maybe-set-gte-id"/>
         <xsl:apply-templates select="@*|node()" mode="initial-pass-mode"/>
      </xsl:copy>
   </xsl:template>

   <!--Set count-as pass template for Context: transltr-->
<xsl:template match="transltr" mode="set-countas" priority="0">
      <xsl:copy>
         <xsl:apply-templates select="@*|node()" mode="set-countas"/>
      </xsl:copy>
   </xsl:template>

   <!--Set ch:chunk template for Context: transltr-->
<xsl:template match="transltr" mode="set-ch-chunk" priority="0">
      <xsl:copy>
         <xsl:if test="not(@_gte:did-set-chunk)">
            <xsl:attribute name="_gte:did-set-chunk">yes</xsl:attribute>
         </xsl:if>
         <xsl:apply-templates select="@*|node()" mode="set-ch-chunk"/>
      </xsl:copy>
   </xsl:template>

   <!--Style template for Context: trdata-->
<xsl:template name="__style-for_trdata.1">
      <xsl:text> .x-trdata-1-0 {margin-left: 0pt; margin-right: 0pt; text-indent: 0pt; }</xsl:text>
   </xsl:template>

   <!--Template for Context: trdata-->
<xsl:template match="trdata" priority="0">
      <div><!--Emit class values to reflect conditions--><xsl:attribute name="class">
            <xsl:text> x-trdata-1-0</xsl:text>
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

   <!--Gentext template for Context: trdata-->
<xsl:template match="trdata" mode="expand-gentext" priority="0">
      <xsl:copy>
         <xsl:apply-templates select="@*|node()" mode="expand-gentext"/>
      </xsl:copy>
   </xsl:template>

   <!--Initial pass template for Context: trdata-->
<xsl:template match="trdata" mode="initial-pass-mode" priority="0">
      <xsl:copy>
         <xsl:call-template name="maybe-set-gte-id"/>
         <xsl:apply-templates select="@*|node()" mode="initial-pass-mode"/>
      </xsl:copy>
   </xsl:template>

   <!--Set count-as pass template for Context: trdata-->
<xsl:template match="trdata" mode="set-countas" priority="0">
      <xsl:copy>
         <xsl:apply-templates select="@*|node()" mode="set-countas"/>
      </xsl:copy>
   </xsl:template>

   <!--Set ch:chunk template for Context: trdata-->
<xsl:template match="trdata" mode="set-ch-chunk" priority="0">
      <xsl:copy>
         <xsl:if test="not(@_gte:did-set-chunk)">
            <xsl:attribute name="_gte:did-set-chunk">yes</xsl:attribute>
         </xsl:if>
         <xsl:apply-templates select="@*|node()" mode="set-ch-chunk"/>
      </xsl:copy>
   </xsl:template>

   <!--Style template for Context: trlist-->
<xsl:template name="__style-for_trlist.1">
      <xsl:text> .x-trlist-1-0 {margin-left: 0pt; margin-right: 0pt; text-indent: 0pt; }</xsl:text>
   </xsl:template>

   <!--Template for Context: trlist-->
<xsl:template match="trlist" priority="0">
      <div><!--Emit class values to reflect conditions--><xsl:attribute name="class">
            <xsl:text> x-trlist-1-0</xsl:text>
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

   <!--Gentext template for Context: trlist-->
<xsl:template match="trlist" mode="expand-gentext" priority="0">
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
               <_ufe:center>
                  <span style="text-decoration: underline; ">
                     <xsl:text>TEMPORARY
REVISION INDEX</xsl:text>
                  </span>
               </_ufe:center>
            </_sfe:BeforeOrAfterText>
         </xsl:if>
         <xsl:apply-templates select="* | text() | processing-instruction()" mode="expand-gentext"/>
      </xsl:copy>
   </xsl:template>

   <!--Initial pass template for Context: trlist-->
<xsl:template match="trlist" mode="initial-pass-mode" priority="0">
      <xsl:copy>
         <xsl:call-template name="maybe-set-gte-id"/>
         <xsl:apply-templates select="@*|node()" mode="initial-pass-mode"/>
      </xsl:copy>
   </xsl:template>

   <!--Set count-as pass template for Context: trlist-->
<xsl:template match="trlist" mode="set-countas" priority="0">
      <xsl:copy>
         <xsl:apply-templates select="@*|node()" mode="set-countas"/>
      </xsl:copy>
   </xsl:template>

   <!--Set ch:chunk template for Context: trlist-->
<xsl:template match="trlist" mode="set-ch-chunk" priority="0">
      <xsl:copy>
         <xsl:if test="not(@_gte:did-set-chunk)">
            <xsl:attribute name="_gte:did-set-chunk">yes</xsl:attribute>
         </xsl:if>
         <xsl:apply-templates select="@*|node()" mode="set-ch-chunk"/>
      </xsl:copy>
   </xsl:template>

   <!--Style template for Context: trloc-->
<xsl:template name="__style-for_trloc.1">
      <xsl:text> .x-trloc-1-0 {margin-left: 0pt; margin-right: 0pt; }</xsl:text>
   </xsl:template>

   <!--Template for Context: trloc-->
<xsl:template match="trloc" priority="0">
      <span><!--Emit class values to reflect conditions--><xsl:attribute name="class">
            <xsl:text> x-trloc-1-0</xsl:text>
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

   <!--Gentext template for Context: trloc-->
<xsl:template match="trloc" mode="expand-gentext" priority="0">
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
      </xsl:copy>
   </xsl:template>

   <!--Initial pass template for Context: trloc-->
<xsl:template match="trloc" mode="initial-pass-mode" priority="0">
      <xsl:copy>
         <xsl:call-template name="maybe-set-gte-id"/>
         <xsl:apply-templates select="@*|node()" mode="initial-pass-mode"/>
      </xsl:copy>
   </xsl:template>

   <!--Set count-as pass template for Context: trloc-->
<xsl:template match="trloc" mode="set-countas" priority="0">
      <xsl:copy>
         <xsl:apply-templates select="@*|node()" mode="set-countas"/>
      </xsl:copy>
   </xsl:template>

   <!--Set ch:chunk template for Context: trloc-->
<xsl:template match="trloc" mode="set-ch-chunk" priority="0">
      <xsl:copy>
         <xsl:if test="not(@_gte:did-set-chunk)">
            <xsl:attribute name="_gte:did-set-chunk">yes</xsl:attribute>
         </xsl:if>
         <xsl:apply-templates select="@*|node()" mode="set-ch-chunk"/>
      </xsl:copy>
   </xsl:template>

   <!--Style template for Context: trnbr-->
<xsl:template name="__style-for_trnbr.1">
      <xsl:text> .x-trnbr-1-0 {margin-left: 0pt; margin-right: 0pt; }</xsl:text>
   </xsl:template>

   <!--Template for Context: trnbr-->
<xsl:template match="trnbr" priority="0">
      <span><!--Emit class values to reflect conditions--><xsl:attribute name="class">
            <xsl:text> x-trnbr-1-0</xsl:text>
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

   <!--Gentext template for Context: trnbr-->
<xsl:template match="trnbr" mode="expand-gentext" priority="0">
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
      </xsl:copy>
   </xsl:template>

   <!--Initial pass template for Context: trnbr-->
<xsl:template match="trnbr" mode="initial-pass-mode" priority="0">
      <xsl:copy>
         <xsl:call-template name="maybe-set-gte-id"/>
         <xsl:apply-templates select="@*|node()" mode="initial-pass-mode"/>
      </xsl:copy>
   </xsl:template>

   <!--Set count-as pass template for Context: trnbr-->
<xsl:template match="trnbr" mode="set-countas" priority="0">
      <xsl:copy>
         <xsl:apply-templates select="@*|node()" mode="set-countas"/>
      </xsl:copy>
   </xsl:template>

   <!--Set ch:chunk template for Context: trnbr-->
<xsl:template match="trnbr" mode="set-ch-chunk" priority="0">
      <xsl:copy>
         <xsl:if test="not(@_gte:did-set-chunk)">
            <xsl:attribute name="_gte:did-set-chunk">yes</xsl:attribute>
         </xsl:if>
         <xsl:apply-templates select="@*|node()" mode="set-ch-chunk"/>
      </xsl:copy>
   </xsl:template>

   <!--Style template for Context: trstatus-->
<xsl:template name="__style-for_trstatus.1">
      <xsl:text> .x-trstatus-1-0 {margin-left: 0pt; margin-right: 0pt; }</xsl:text>
   </xsl:template>

   <!--Template for Context: trstatus-->
<xsl:template match="trstatus" priority="0">
      <span><!--Emit class values to reflect conditions--><xsl:attribute name="class">
            <xsl:text> x-trstatus-1-0</xsl:text>
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

   <!--Gentext template for Context: trstatus-->
<xsl:template match="trstatus" mode="expand-gentext" priority="0">
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
      </xsl:copy>
   </xsl:template>

   <!--Initial pass template for Context: trstatus-->
<xsl:template match="trstatus" mode="initial-pass-mode" priority="0">
      <xsl:copy>
         <xsl:call-template name="maybe-set-gte-id"/>
         <xsl:apply-templates select="@*|node()" mode="initial-pass-mode"/>
      </xsl:copy>
   </xsl:template>

   <!--Set count-as pass template for Context: trstatus-->
<xsl:template match="trstatus" mode="set-countas" priority="0">
      <xsl:copy>
         <xsl:apply-templates select="@*|node()" mode="set-countas"/>
      </xsl:copy>
   </xsl:template>

   <!--Set ch:chunk template for Context: trstatus-->
<xsl:template match="trstatus" mode="set-ch-chunk" priority="0">
      <xsl:copy>
         <xsl:if test="not(@_gte:did-set-chunk)">
            <xsl:attribute name="_gte:did-set-chunk">yes</xsl:attribute>
         </xsl:if>
         <xsl:apply-templates select="@*|node()" mode="set-ch-chunk"/>
      </xsl:copy>
   </xsl:template>

   <!--Style template for Context: txtgrphc-->
<xsl:template name="__style-for_txtgrphc.1">
      <xsl:text> .x-txtgrphc-1-0 {margin-left: 0pt; margin-right: 0pt; }</xsl:text>
   </xsl:template>

   <!--Template for Context: txtgrphc-->
<xsl:template match="txtgrphc" priority="0"><!--Emit a nostyle template--><xsl:apply-templates/>
   </xsl:template>

   <!--Gentext template for Context: txtgrphc-->
<xsl:template match="txtgrphc" mode="expand-gentext" priority="0">
      <xsl:copy>
         <xsl:apply-templates select="@*|node()" mode="expand-gentext"/>
      </xsl:copy>
   </xsl:template>

   <!--Initial pass template for Context: txtgrphc-->
<xsl:template match="txtgrphc" mode="initial-pass-mode" priority="0">
      <xsl:copy>
         <xsl:call-template name="maybe-set-gte-id"/>
         <xsl:apply-templates select="@*|node()" mode="initial-pass-mode"/>
      </xsl:copy>
   </xsl:template>

   <!--Set count-as pass template for Context: txtgrphc-->
<xsl:template match="txtgrphc" mode="set-countas" priority="0">
      <xsl:copy>
         <xsl:apply-templates select="@*|node()" mode="set-countas"/>
      </xsl:copy>
   </xsl:template>

   <!--Set ch:chunk template for Context: txtgrphc-->
<xsl:template match="txtgrphc" mode="set-ch-chunk" priority="0">
      <xsl:copy>
         <xsl:if test="not(@_gte:did-set-chunk)">
            <xsl:attribute name="_gte:did-set-chunk">yes</xsl:attribute>
         </xsl:if>
         <xsl:apply-templates select="@*|node()" mode="set-ch-chunk"/>
      </xsl:copy>
   </xsl:template>

   <!--Style template for Context: txtline-->
<xsl:template name="__style-for_txtline.1">
      <xsl:text> .x-txtline-1-0 {margin-left: 0pt; margin-right: 0pt; }</xsl:text>
   </xsl:template>

   <!--Template for Context: txtline-->
<xsl:template match="txtline" priority="0"><!--Emit a nostyle template--><xsl:apply-templates/>
   </xsl:template>

   <!--Gentext template for Context: txtline-->
<xsl:template match="txtline" mode="expand-gentext" priority="0">
      <xsl:copy>
         <xsl:apply-templates select="@*|node()" mode="expand-gentext"/>
      </xsl:copy>
   </xsl:template>

   <!--Initial pass template for Context: txtline-->
<xsl:template match="txtline" mode="initial-pass-mode" priority="0">
      <xsl:copy>
         <xsl:call-template name="maybe-set-gte-id"/>
         <xsl:apply-templates select="@*|node()" mode="initial-pass-mode"/>
      </xsl:copy>
   </xsl:template>

   <!--Set count-as pass template for Context: txtline-->
<xsl:template match="txtline" mode="set-countas" priority="0">
      <xsl:copy>
         <xsl:apply-templates select="@*|node()" mode="set-countas"/>
      </xsl:copy>
   </xsl:template>

   <!--Set ch:chunk template for Context: txtline-->
<xsl:template match="txtline" mode="set-ch-chunk" priority="0">
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
<xsl:template name="_gte-toc-Table_of_Contents">
      <xsl:apply-templates mode="toc-mode-Table_of_Contents" select="//pageblock-title|//pageblock-title"/>
   </xsl:template>

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
 .x-ais-item-1-0 {margin-left: 0pt; margin-right: 0pt; }
&#xD;

&#xD;
 .x-ais-list-1-0 {margin-left: 0pt; margin-right: 0pt; }
&#xD;

&#xD;
 .x-aisnbr-1-0 {margin-left: 0pt; margin-right: 0pt; }
&#xD;

&#xD;
 .x-aistitle-1-0 {margin-left: 0pt; margin-right: 0pt; }
&#xD;

&#xD;
 .x-con-1-0 {margin-left: 0pt; margin-right: 0pt; }
&#xD;
 .x-con-1-1 {}
&#xD;

&#xD;
 .x-conindex-1-0 {margin-left: 0pt; margin-right: 0pt; }
&#xD;

&#xD;
 .x-conname-1-0 {margin-left: 0pt; margin-right: 0pt; }
&#xD;

&#xD;
 .x-connbr-1-0 {margin-left: 0pt; margin-right: 0pt; }
&#xD;

&#xD;
 .x-csn-1-0 {margin-left: 0pt; margin-right: 0pt; }
&#xD;

&#xD;
 .x-dtlname-1-0 {margin-left: 0pt; margin-right: 0pt; }
&#xD;

&#xD;
 .x-dtlnbr-1-0 {margin-left: 0pt; margin-right: 0pt; }
&#xD;

&#xD;
 .x-effect-1-0 {margin-left: 0pt; margin-right: 0pt; text-indent: 0pt; font-weight: bold; margin-top: 4pt; margin-bottom: 4pt; }
&#xD;

&#xD;
 .x-effect-2-0 {margin-left: 0pt; margin-right: 0pt; font-weight: bold; }
&#xD;

&#xD;
 .x-equ-1-0 {margin-left: 0pt; margin-right: 0pt; text-indent: 0pt; margin-bottom: 8pt; }
&#xD;

&#xD;
 .x-equ-2-0 {margin-left: 0pt; margin-right: 0pt; text-indent: 0pt; }
&#xD;

&#xD;
 .x-ftnote-1-0 {margin-left: 0pt; margin-right: 0pt; }
&#xD;

&#xD;
 .x-gdesc-1-0 {margin-left: 0pt; margin-right: 0pt; text-indent: 0pt; }
&#xD;

&#xD;
 .x-graphic-1-0 {margin-left: 0pt; margin-right: 0pt; text-indent: 0pt; margin-top: 8pt; }
&#xD;

&#xD;
 .x-graphic-2-0 {margin-left: 0pt; margin-right: 0pt; text-indent: 0pt; margin-top: 8pt; }
&#xD;

&#xD;
 .x-grphcref-1-0 {margin-left: 0pt; margin-right: 0pt; }
&#xD;

&#xD;
 .x-hotlink-1-0 {margin-left: 0pt; margin-right: 0pt; }
&#xD;

&#xD;
 .x-howtouse-1-0 {margin-left: 0pt; margin-right: 0pt; text-indent: 0pt; margin-top: 8pt; }
&#xD;

&#xD;
 .x-ics-1-0 {margin-left: 0pt; margin-right: 0pt; text-indent: 0pt; margin-top: 6pt; margin-bottom: 6pt; }
&#xD;

&#xD;
 .x-atidlm-inclusion-1-0 {margin-left: 0pt; margin-right: 0pt; text-indent: 0pt; }
&#xD;

&#xD;
 .x-increv-1-0 {margin-left: 0pt; margin-right: 0pt; }
&#xD;

&#xD;
 .x-issdate-1-0 {margin-left: 0pt; margin-right: 0pt; }
&#xD;

&#xD;
 .x-l1item-1-0 {margin-left: 0pt; margin-right: 0pt; text-indent: 0pt; margin-top: 6pt; margin-bottom: 6pt; margin-left: 0pt; text-indent: 0pt; }
&#xD;

&#xD;
 .x-l1item-2-0 {margin-left: 0pt; margin-right: 0pt; text-indent: 0pt; margin-top: 6pt; margin-bottom: 6pt; margin-left: 0pt; text-indent: 0pt; }
&#xD;

&#xD;
 .x-l1item-3-0 {margin-left: 0pt; margin-right: 0pt; text-indent: 0pt; margin-top: 6pt; margin-bottom: 6pt; margin-left: 0pt; text-indent: 0pt; }
&#xD;

&#xD;
 .x-l1item-4-0 {margin-left: 0pt; margin-right: 0pt; text-indent: 0pt; margin-top: 6pt; margin-bottom: 6pt; margin-left: 0pt; text-indent: 0pt; }
&#xD;

&#xD;
 .x-l1item-5-0 {margin-left: 0pt; margin-right: 0pt; text-indent: 0pt; margin-top: 6pt; margin-bottom: 6pt; margin-left: 0pt; text-indent: 0pt; }
&#xD;

&#xD;
 .x-l2item-1-0 {margin-left: 0pt; margin-right: 0pt; text-indent: 0pt; margin-top: 6pt; margin-bottom: 6pt; margin-left: 0pt; text-indent: 0pt; }
&#xD;

&#xD;
 .x-l2item-2-0 {margin-left: 0pt; margin-right: 0pt; text-indent: 0pt; margin-top: 6pt; margin-bottom: 6pt; margin-left: 0pt; text-indent: 0pt; }
&#xD;

&#xD;
 .x-l2item-3-0 {margin-left: 0pt; margin-right: 0pt; text-indent: 0pt; margin-top: 6pt; margin-bottom: 6pt; margin-left: 0pt; text-indent: 0pt; }
&#xD;

&#xD;
 .x-l2item-4-0 {margin-left: 0pt; margin-right: 0pt; text-indent: 0pt; margin-top: 6pt; margin-bottom: 6pt; margin-left: 0pt; text-indent: 0pt; }
&#xD;

&#xD;
 .x-l2item-5-0 {margin-left: 0pt; margin-right: 0pt; text-indent: 0pt; margin-top: 6pt; margin-bottom: 6pt; margin-left: 0pt; text-indent: 0pt; }
&#xD;

&#xD;
 .x-l3item-1-0 {margin-left: 0pt; margin-right: 0pt; text-indent: 0pt; margin-top: 6pt; margin-bottom: 6pt; margin-left: 0pt; text-indent: 0pt; }
&#xD;

&#xD;
 .x-l3item-2-0 {margin-left: 0pt; margin-right: 0pt; text-indent: 0pt; margin-top: 6pt; margin-bottom: 6pt; margin-left: 0pt; text-indent: 0pt; }
&#xD;

&#xD;
 .x-l3item-3-0 {margin-left: 0pt; margin-right: 0pt; text-indent: 0pt; margin-top: 6pt; margin-bottom: 6pt; margin-left: 0pt; text-indent: 0pt; }
&#xD;

&#xD;
 .x-l3item-4-0 {margin-left: 0pt; margin-right: 0pt; text-indent: 0pt; margin-top: 6pt; margin-bottom: 6pt; margin-left: 0pt; text-indent: 0pt; }
&#xD;

&#xD;
 .x-l3item-5-0 {margin-left: 0pt; margin-right: 0pt; text-indent: 0pt; margin-top: 6pt; margin-bottom: 6pt; margin-left: 0pt; text-indent: 0pt; }
&#xD;

&#xD;
 .x-l4item-1-0 {margin-left: 0pt; margin-right: 0pt; text-indent: 0pt; margin-top: 6pt; margin-bottom: 6pt; margin-left: 0pt; text-indent: 0pt; }
&#xD;

&#xD;
 .x-l4item-2-0 {margin-left: 0pt; margin-right: 0pt; text-indent: 0pt; margin-top: 6pt; margin-bottom: 6pt; margin-left: 0pt; text-indent: 0pt; }
&#xD;

&#xD;
 .x-l4item-3-0 {margin-left: 0pt; margin-right: 0pt; text-indent: 0pt; margin-top: 6pt; margin-bottom: 6pt; margin-left: 0pt; text-indent: 0pt; }
&#xD;

&#xD;
 .x-l4item-4-0 {margin-left: 0pt; margin-right: 0pt; text-indent: 0pt; margin-top: 6pt; margin-bottom: 6pt; margin-left: 0pt; text-indent: 0pt; }
&#xD;

&#xD;
 .x-l4item-5-0 {margin-left: 0pt; margin-right: 0pt; text-indent: 0pt; margin-top: 6pt; margin-bottom: 6pt; margin-left: 0pt; text-indent: 0pt; }
&#xD;

&#xD;
 .x-l5item-1-0 {margin-left: 0pt; margin-right: 0pt; }
&#xD;

&#xD;
 .x-l6item-1-0 {margin-left: 0pt; margin-right: 0pt; }
&#xD;

&#xD;
 .x-l7item-1-0 {margin-left: 0pt; margin-right: 0pt; }
&#xD;

&#xD;
 .x-atidlm-linkcontent-1-0 {margin-left: 0pt; margin-right: 0pt; text-indent: 0pt; }
&#xD;

&#xD;
 .x-list1-1-0 {margin-left: 0pt; margin-right: 0pt; text-indent: 0pt; margin-top: 8pt; margin-left: 18pt; text-indent: 0pt; }
&#xD;

&#xD;
 .x-list2-1-0 {margin-left: 0pt; margin-right: 0pt; text-indent: 0pt; margin-top: 8pt; }
&#xD;

&#xD;
 .x-list3-1-0 {margin-left: 0pt; margin-right: 0pt; text-indent: 0pt; margin-top: 8pt; }
&#xD;

&#xD;
 .x-list4-1-0 {margin-left: 0pt; margin-right: 0pt; text-indent: 0pt; margin-top: 8pt; }
&#xD;

&#xD;
 .x-list5-1-0 {margin-left: 0pt; margin-right: 0pt; }
&#xD;

&#xD;
 .x-list6-1-0 {margin-left: 0pt; margin-right: 0pt; }
&#xD;

&#xD;
 .x-list7-1-0 {margin-left: 0pt; margin-right: 0pt; }
&#xD;

&#xD;
 .x-lmm-statement-1-0 {margin-left: 0pt; margin-right: 0pt; text-indent: 0pt; font-size: 10pt; text-align: justify; margin-top: 10pt; margin-bottom: 10pt; }
&#xD;

&#xD;
 .x-atidlm-metadata-1-0 {margin-left: 0pt; margin-right: 0pt; text-indent: 0pt; }
&#xD;

&#xD;
 .x-mfmatr-1-0 {margin-left: 0pt; margin-right: 0pt; text-indent: 0pt; }
&#xD;

&#xD;
 .x-ncon-1-0 {margin-left: 0pt; margin-right: 0pt; }
&#xD;

&#xD;
 .x-numlist-1-0 {margin-left: 0pt; margin-right: 0pt; text-indent: 0pt; margin-top: 8pt; margin-left: 18pt; text-indent: 0pt; }
&#xD;

&#xD;
 .x-numlitem-1-0 {margin-left: 0pt; margin-right: 0pt; text-indent: 0pt; margin-top: 6pt; margin-bottom: 6pt; margin-left: 0pt; text-indent: 0pt; }
&#xD;

&#xD;
 .x-numlitem-2-0 {margin-left: 0pt; margin-right: 0pt; text-indent: 0pt; margin-top: 6pt; margin-bottom: 6pt; margin-left: 0pt; text-indent: 0pt; }
&#xD;

&#xD;
 .x-pageblock-title-1-0 {margin-left: 0pt; margin-right: 0pt; text-indent: 0pt; font-weight: bold; text-decoration: underline ; text-transform: uppercase; margin-left: 0pt; text-indent: 0pt; text-align: center; }
&#xD;

&#xD;
 .x-pageblock-title-2-0 {margin-left: 0pt; margin-right: 0pt; text-indent: 0pt; font-weight: bold; font-size: 14pt; }
&#xD;

&#xD;
 .x-part-1-0 {margin-left: 0pt; margin-right: 0pt; }
&#xD;

&#xD;
 .x-pbfmatr-1-0 {margin-left: 0pt; margin-right: 0pt; text-indent: 0pt; }
&#xD;

&#xD;
 .x-pgblk-1-0 {margin-left: 0pt; margin-right: 0pt; text-indent: 0pt; margin-top: 8pt; }
&#xD;

&#xD;
 .x-prcitem-1-0 {margin-left: 0pt; margin-right: 0pt; text-indent: 0pt; margin-top: 8pt; }
&#xD;

&#xD;
 .x-prcitem1-1-0 {margin-left: 0pt; margin-right: 0pt; text-indent: 0pt; margin-top: 6pt; margin-bottom: 6pt; margin-left: 0pt; text-indent: 0pt; }
&#xD;

&#xD;
 .x-prcitem1-2-0 {margin-left: 0pt; margin-right: 0pt; text-indent: 0pt; margin-top: 6pt; margin-bottom: 6pt; margin-left: 0pt; text-indent: 0pt; }
&#xD;

&#xD;
 .x-prcitem2-1-0 {margin-left: 0pt; margin-right: 0pt; text-indent: 0pt; margin-top: 6pt; margin-bottom: 6pt; margin-left: 0pt; text-indent: 0pt; }
&#xD;

&#xD;
 .x-prcitem2-2-0 {margin-left: 0pt; margin-right: 0pt; text-indent: 0pt; margin-top: 6pt; margin-bottom: 6pt; margin-left: 0pt; text-indent: 0pt; }
&#xD;

&#xD;
 .x-prcitem3-1-0 {margin-left: 0pt; margin-right: 0pt; text-indent: 0pt; margin-top: 6pt; margin-bottom: 6pt; margin-left: 0pt; text-indent: 0pt; }
&#xD;

&#xD;
 .x-prcitem3-2-0 {margin-left: 0pt; margin-right: 0pt; text-indent: 0pt; margin-top: 6pt; margin-bottom: 6pt; margin-left: 0pt; text-indent: 0pt; }
&#xD;

&#xD;
 .x-prcitem4-1-0 {margin-left: 0pt; margin-right: 0pt; text-indent: 0pt; margin-top: 6pt; margin-bottom: 6pt; margin-left: 0pt; text-indent: 0pt; }
&#xD;

&#xD;
 .x-prcitem4-2-0 {margin-left: 0pt; margin-right: 0pt; text-indent: 0pt; margin-top: 6pt; margin-bottom: 6pt; margin-left: 0pt; text-indent: 0pt; }
&#xD;

&#xD;
 .x-prcitem4-3-0 {margin-left: 0pt; margin-right: 0pt; text-indent: 0pt; margin-top: 6pt; margin-bottom: 6pt; margin-left: 0pt; text-indent: 0pt; }
&#xD;

&#xD;
 .x-prcitem5-1-0 {margin-left: 0pt; margin-right: 0pt; }
&#xD;

&#xD;
 .x-prcitem6-1-0 {margin-left: 0pt; margin-right: 0pt; }
&#xD;

&#xD;
 .x-prcitem7-1-0 {margin-left: 0pt; margin-right: 0pt; }
&#xD;

&#xD;
 .x-prclist1-1-0 {margin-left: 0pt; margin-right: 0pt; text-indent: 0pt; margin-top: 8pt; }
&#xD;

&#xD;
 .x-prclist2-1-0 {margin-left: 0pt; margin-right: 0pt; text-indent: 0pt; margin-top: 8pt; margin-left: 18pt; text-indent: 0pt; }
&#xD;

&#xD;
 .x-prclist3-1-0 {margin-left: 0pt; margin-right: 0pt; text-indent: 0pt; margin-top: 8pt; margin-left: 18pt; text-indent: 0pt; }
&#xD;

&#xD;
 .x-prclist4-1-0 {margin-left: 0pt; margin-right: 0pt; text-indent: 0pt; margin-top: 8pt; }
&#xD;

&#xD;
 .x-prclist5-1-0 {margin-left: 0pt; margin-right: 0pt; }
&#xD;

&#xD;
 .x-prclist6-1-0 {margin-left: 0pt; margin-right: 0pt; }
&#xD;

&#xD;
 .x-prclist7-1-0 {margin-left: 0pt; margin-right: 0pt; }
&#xD;

&#xD;
 .x-print-module-1-0 {margin-left: 0pt; margin-right: 0pt; }
&#xD;

&#xD;
 .x-print-unit-1-0 {margin-left: 0pt; margin-right: 0pt; }
&#xD;

&#xD;
 .x-pwc-awl-1-0 {margin-left: 0pt; margin-right: 0pt; }
&#xD;

&#xD;
 .x-pwc-cgp-stmnt-1-0 {margin-left: 0pt; margin-right: 0pt; text-indent: 0pt; font-size: 10pt; margin-top: 10pt; margin-bottom: 10pt; }
&#xD;

&#xD;
 .x-pwccallout-1-0 {margin-left: 0pt; margin-right: 0pt; }
&#xD;

&#xD;
 .x-pwcchapsect-1-0 {margin-left: 0pt; margin-right: 0pt; text-indent: 0pt; }
&#xD;

&#xD;
 .x-pwcchapsect-item-1-0 {margin-left: 0pt; margin-right: 0pt; text-indent: 0pt; margin-top: 6pt; margin-bottom: 6pt; }
&#xD;

&#xD;
 .x-pwcchapsect-list-1-0 {margin-left: 0pt; margin-right: 0pt; text-indent: 0pt; margin-top: 8pt; }
&#xD;

&#xD;
 .x-pwccss-1-0 {margin-left: 0pt; margin-right: 0pt; text-indent: 0pt; }
&#xD;

&#xD;
 .x-pwcem-apu-title-1-0 {margin-left: 0pt; margin-right: 0pt; }
&#xD;

&#xD;
 .x-pwcem-title-1-0 {margin-left: 0pt; margin-right: 0pt; text-indent: 0pt; font-weight: bold; font-size: 24pt; text-align: center; }
&#xD;

&#xD;
 .x-pwcemtask-1-0 {margin-left: 0pt; margin-right: 0pt; }
&#xD;

&#xD;
 .x-pwclmm-title-1-0 {margin-left: 0pt; margin-right: 0pt; text-indent: 0pt; font-weight: bold; font-size: 24pt; text-align: center; }
&#xD;

&#xD;
 .x-pwcni-1-0 {margin-left: 0pt; margin-right: 0pt; text-indent: 0pt; margin-top: 8pt; }
&#xD;

&#xD;
 .x-pwcnitem-1-0 {margin-left: 0pt; margin-right: 0pt; text-indent: 0pt; }
&#xD;

&#xD;
 .x-pwcpbfront-1-0 {margin-left: 0pt; margin-right: 0pt; }
&#xD;

&#xD;
 .x-pwcsbnbr-1-0 {margin-left: 0pt; margin-right: 0pt; color: #0000FF; text-decoration: underline ; text-decoration: underline ; }
&#xD;

&#xD;
 .x-pwcsoa-1-0 {margin-left: 0pt; margin-right: 0pt; text-indent: 0pt; margin-top: 8pt; }
&#xD;
 .x-pwcsoa-1-1 {}
&#xD;

&#xD;
 .x-pwcspbdata-1-0 {margin-left: 0pt; margin-right: 0pt; text-indent: 0pt; margin-top: 6pt; margin-bottom: 6pt; }
&#xD;

&#xD;
 .x-pwcspblist-1-0 {margin-left: 0pt; margin-right: 0pt; text-indent: 0pt; margin-top: 8pt; }
&#xD;

&#xD;
 .x-pwcspbnbr-1-0 {margin-left: 0pt; margin-right: 0pt; color: #0000FF; text-decoration: underline ; text-decoration: underline ; }
&#xD;

&#xD;
 .x-atidlm-resourcepair-1-0 {margin-left: 0pt; margin-right: 0pt; text-indent: 0pt; }
&#xD;

&#xD;
 .x-sbdata-1-0 {margin-left: 0pt; margin-right: 0pt; text-indent: 0pt; margin-top: 6pt; margin-bottom: 6pt; }
&#xD;

&#xD;
 .x-sbeff-1-0 {margin-left: 0pt; margin-right: 0pt; }
&#xD;
 .x-sbeff-1-1 {}
&#xD;

&#xD;
 .x-sbnbr-1-0 {margin-left: 0pt; margin-right: 0pt; text-indent: 0pt; color: #0000FF; text-decoration: underline ; text-decoration: underline ; }
&#xD;

&#xD;
 .x-sheet-1-0 {margin-left: 0pt; margin-right: 0pt; text-indent: 0pt; margin-top: 8pt; }
&#xD;
 .x-sheet-1-1 {}
&#xD;
 .x-sheet-1-2 {}
&#xD;

&#xD;
 .x-slavename-1-0 {margin-left: 0pt; margin-right: 0pt; }
&#xD;

&#xD;
 .x-slavenbr-1-0 {margin-left: 0pt; margin-right: 0pt; }
&#xD;

&#xD;
 .x-slavepart-1-0 {margin-left: 0pt; margin-right: 0pt; }
&#xD;

&#xD;
 .x-atidlm-source-1-0 {margin-left: 0pt; margin-right: 0pt; text-indent: 0pt; }
&#xD;

&#xD;
 .x-spbnbr-1-0 {margin-left: 0pt; margin-right: 0pt; text-indent: 0pt; margin-top: 6pt; margin-bottom: 6pt; color: #0000FF; text-decoration: underline ; text-decoration: underline ; }
&#xD;

&#xD;
 .x-statement-1-0 {margin-left: 0pt; margin-right: 0pt; text-indent: 0pt; font-weight: normal; font-size: 11pt; text-align: center; }
&#xD;

&#xD;
 .x-std-1-0 {margin-left: 0pt; margin-right: 0pt; }
&#xD;
 .x-std-1-1 {}
&#xD;

&#xD;
 .x-stdname-1-0 {margin-left: 0pt; margin-right: 0pt; }
&#xD;

&#xD;
 .x-stdnbr-1-0 {margin-left: 0pt; margin-right: 0pt; }
&#xD;

&#xD;
 .x-step-1-0 {margin-left: 0pt; margin-right: 0pt; text-indent: 0pt; margin-top: 6pt; margin-bottom: 6pt; margin-left: 0pt; text-indent: 0pt; }
&#xD;

&#xD;
 .x-step-2-0 {margin-left: 0pt; margin-right: 0pt; text-indent: 0pt; margin-top: 6pt; margin-bottom: 6pt; margin-left: 0pt; text-indent: 0pt; }
&#xD;

&#xD;
 .x-step-3-0 {margin-left: 0pt; margin-right: 0pt; text-indent: 0pt; margin-top: 6pt; margin-bottom: 6pt; margin-left: 0pt; text-indent: 0pt; }
&#xD;

&#xD;
 .x-step-4-0 {margin-left: 0pt; margin-right: 0pt; text-indent: 0pt; margin-top: 6pt; margin-bottom: 6pt; margin-left: 0pt; text-indent: 0pt; }
&#xD;

&#xD;
 .x-step2-1-0 {margin-left: 0pt; margin-right: 0pt; text-indent: 0pt; margin-top: 6pt; margin-bottom: 6pt; margin-left: 0pt; text-indent: 0pt; }
&#xD;

&#xD;
 .x-step2-2-0 {margin-left: 0pt; margin-right: 0pt; text-indent: 0pt; margin-top: 6pt; margin-bottom: 6pt; margin-left: 0pt; text-indent: 0pt; }
&#xD;

&#xD;
 .x-step2-3-0 {margin-left: 0pt; margin-right: 0pt; text-indent: 0pt; margin-top: 6pt; margin-bottom: 6pt; margin-left: 0pt; text-indent: 0pt; }
&#xD;

&#xD;
 .x-step3-1-0 {margin-left: 0pt; margin-right: 0pt; text-indent: 0pt; margin-top: 6pt; margin-bottom: 6pt; margin-left: 0pt; text-indent: 0pt; }
&#xD;

&#xD;
 .x-step3-2-0 {margin-left: 0pt; margin-right: 0pt; text-indent: 0pt; margin-top: 6pt; margin-bottom: 6pt; margin-left: 0pt; text-indent: 0pt; }
&#xD;

&#xD;
 .x-step3-3-0 {margin-left: 0pt; margin-right: 0pt; text-indent: 0pt; margin-top: 6pt; margin-bottom: 6pt; margin-left: 0pt; text-indent: 0pt; }
&#xD;

&#xD;
 .x-step4-1-0 {margin-left: 0pt; margin-right: 0pt; text-indent: 0pt; margin-top: 6pt; margin-bottom: 6pt; margin-left: 0pt; text-indent: 0pt; }
&#xD;

&#xD;
 .x-step4-2-0 {margin-left: 0pt; margin-right: 0pt; text-indent: 0pt; margin-top: 6pt; margin-bottom: 6pt; margin-left: 0pt; text-indent: 0pt; }
&#xD;

&#xD;
 .x-step4-3-0 {margin-left: 0pt; margin-right: 0pt; text-indent: 0pt; margin-top: 6pt; margin-bottom: 6pt; margin-left: 0pt; text-indent: 0pt; }
&#xD;

&#xD;
 .x-step5-1-0 {margin-left: 0pt; margin-right: 0pt; text-indent: 0pt; margin-top: 6pt; margin-bottom: 6pt; margin-left: 0pt; text-indent: 0pt; }
&#xD;

&#xD;
 .x-step5-2-0 {margin-left: 0pt; margin-right: 0pt; text-indent: 0pt; margin-top: 6pt; margin-bottom: 6pt; margin-left: 0pt; text-indent: 0pt; }
&#xD;

&#xD;
 .x-step5-3-0 {margin-left: 0pt; margin-right: 0pt; text-indent: 0pt; margin-top: 6pt; margin-bottom: 6pt; margin-left: 0pt; text-indent: 0pt; }
&#xD;

&#xD;
 .x-subtask-1-0 {margin-left: 0pt; margin-right: 0pt; text-indent: 0pt; margin-top: 8pt; margin-left: 18pt; text-indent: 0pt; }
&#xD;
 .x-subtask-1-1 {}
&#xD;
 .x-subtask-1-2 {}
&#xD;
 .x-subtask-1-3 {}
&#xD;

&#xD;
 .x-atidlm-target-1-0 {margin-left: 0pt; margin-right: 0pt; text-indent: 0pt; }
&#xD;

&#xD;
 .x-task-1-0 {margin-left: 0pt; margin-right: 0pt; text-indent: 0pt; margin-top: 8pt; }
&#xD;
 .x-task-1-1 {}
&#xD;
 .x-task-1-2 {}
&#xD;

&#xD;
 .x-taskproc-1-0 {margin-left: 0pt; margin-right: 0pt; text-indent: 0pt; margin-top: 8pt; margin-left: 18pt; text-indent: 0pt; }
&#xD;

&#xD;
 .x-ted-1-0 {margin-left: 0pt; margin-right: 0pt; }
&#xD;

&#xD;
 .x-teddtl-1-0 {margin-left: 0pt; margin-right: 0pt; }
&#xD;

&#xD;
 .x-tfmatr-1-0 {margin-left: 0pt; margin-right: 0pt; text-indent: 0pt; margin-left: 18pt; text-indent: 0pt; }
&#xD;

&#xD;
 .x-tprereq-1-0 {margin-left: 0pt; margin-right: 0pt; text-indent: 0pt; margin-top: 8pt; }
&#xD;

&#xD;
 .x-transltr-1-0 {margin-left: 0pt; margin-right: 0pt; }
&#xD;

&#xD;
 .x-trdata-1-0 {margin-left: 0pt; margin-right: 0pt; text-indent: 0pt; }
&#xD;

&#xD;
 .x-trlist-1-0 {margin-left: 0pt; margin-right: 0pt; text-indent: 0pt; }
&#xD;

&#xD;
 .x-trloc-1-0 {margin-left: 0pt; margin-right: 0pt; }
&#xD;

&#xD;
 .x-trnbr-1-0 {margin-left: 0pt; margin-right: 0pt; }
&#xD;

&#xD;
 .x-trstatus-1-0 {margin-left: 0pt; margin-right: 0pt; }
&#xD;

&#xD;
 .x-txtgrphc-1-0 {margin-left: 0pt; margin-right: 0pt; }
&#xD;

&#xD;
 .x-txtline-1-0 {margin-left: 0pt; margin-right: 0pt; }
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
table table[class~="x-l1item-1-0"] {width: 100%; }
&#xD;
table table[class~="x-l1item-2-0"] {width: 100%; }
&#xD;
table table[class~="x-l1item-3-0"] {width: 100%; }
&#xD;
table table[class~="x-l1item-4-0"] {width: 100%; }
&#xD;
table table[class~="x-l1item-5-0"] {width: 100%; }
&#xD;
table table[class~="x-l2item-1-0"] {width: 100%; }
&#xD;
table table[class~="x-l2item-2-0"] {width: 100%; }
&#xD;
table table[class~="x-l2item-3-0"] {width: 100%; }
&#xD;
table table[class~="x-l2item-4-0"] {width: 100%; }
&#xD;
table table[class~="x-l2item-5-0"] {width: 100%; }
&#xD;
table table[class~="x-l3item-1-0"] {width: 100%; }
&#xD;
table table[class~="x-l3item-2-0"] {width: 100%; }
&#xD;
table table[class~="x-l3item-3-0"] {width: 100%; }
&#xD;
table table[class~="x-l3item-4-0"] {width: 100%; }
&#xD;
table table[class~="x-l3item-5-0"] {width: 100%; }
&#xD;
table table[class~="x-l4item-1-0"] {width: 100%; }
&#xD;
table table[class~="x-l4item-2-0"] {width: 100%; }
&#xD;
table table[class~="x-l4item-3-0"] {width: 100%; }
&#xD;
table table[class~="x-l4item-4-0"] {width: 100%; }
&#xD;
table table[class~="x-l4item-5-0"] {width: 100%; }
&#xD;
table table[class~="x-numlitem-1-0"] {width: 100%; }
&#xD;
table table[class~="x-numlitem-2-0"] {width: 100%; }
&#xD;
table table[class~="x-prcitem1-1-0"] {width: 100%; }
&#xD;
table table[class~="x-prcitem1-2-0"] {width: 100%; }
&#xD;
table table[class~="x-prcitem2-1-0"] {width: 100%; }
&#xD;
table table[class~="x-prcitem2-2-0"] {width: 100%; }
&#xD;
table table[class~="x-prcitem3-1-0"] {width: 100%; }
&#xD;
table table[class~="x-prcitem3-2-0"] {width: 100%; }
&#xD;
table table[class~="x-prcitem4-1-0"] {width: 100%; }
&#xD;
table table[class~="x-prcitem4-2-0"] {width: 100%; }
&#xD;
table table[class~="x-prcitem4-3-0"] {width: 100%; }
&#xD;
table table[class~="x-step-1-0"] {width: 100%; }
&#xD;
table table[class~="x-step-2-0"] {width: 100%; }
&#xD;
table table[class~="x-step-3-0"] {width: 100%; }
&#xD;
table table[class~="x-step-4-0"] {width: 100%; }
&#xD;
table table[class~="x-step2-1-0"] {width: 100%; }
&#xD;
table table[class~="x-step2-2-0"] {width: 100%; }
&#xD;
table table[class~="x-step2-3-0"] {width: 100%; }
&#xD;
table table[class~="x-step3-1-0"] {width: 100%; }
&#xD;
table table[class~="x-step3-2-0"] {width: 100%; }
&#xD;
table table[class~="x-step3-3-0"] {width: 100%; }
&#xD;
table table[class~="x-step4-1-0"] {width: 100%; }
&#xD;
table table[class~="x-step4-2-0"] {width: 100%; }
&#xD;
table table[class~="x-step4-3-0"] {width: 100%; }
&#xD;
table table[class~="x-step5-1-0"] {width: 100%; }
&#xD;
table table[class~="x-step5-2-0"] {width: 100%; }
&#xD;
table table[class~="x-step5-3-0"] {width: 100%; }
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
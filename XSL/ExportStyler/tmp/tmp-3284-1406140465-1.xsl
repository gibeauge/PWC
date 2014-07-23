<?xml version="1.0" encoding="UTF-8" standalone="yes"?>
<!--Copyright Arbortext, Inc., 1999-2008--><?APT StylesheetID Title="Styler generated DMP (XSL-DMP) stylesheet" CompositionTypes="dmp,xsl"?><xsl:stylesheet xmlns:simg="java:net.sf.docbook.saxon.ImageIntrinsics"
                xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
                xmlns:ximg="xaln://com.nwalsh.xalan.ImageIntrinsics"
                xmlns="http://www.w3.org/1999/xhtml"
                xmlns:exslt="http://exslt.org/common"
                xmlns:_acl="java:com.arbortext.epic.Acl"
                xmlns:msxsl="urn:schemas-microsoft-com:xslt"
                xmlns:_dtd="http://www.arbortext.com/namespace/Styler/UserElements"
                xmlns:atidlm="http://www.arbortext.com/namespace/atidlm"
                xmlns:_="http://www.pwc.ca/namespace/doctypes/migrate"
                xmlns:_2="http://www.pwc.ca/namespace/doctypes/jmtosmigrate"
                xmlns:ch="http://www.arbortext.com/namespace/chunker"
                xmlns:saxon="http://saxon.sf.net/"
                xmlns:_5="http://www.pwc.ca/namespace/doctypes/ipc"
                xmlns:_gte="http://www.arbortext.com/namespace/Styler/GeneratedTextElements"
                xmlns:_4="http://www.pwc.ca/namespace/doctypes/emipc"
                xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
                xmlns:_sfe="http://www.arbortext.com/namespace/Styler/StylerFormattingElements"
                xmlns:_js="java:com.arbortext.epic.internal.js.JavaScript"
                xmlns:_ufe="http://www.arbortext.com/namespace/Styler/UserFormattingElements"
                version="1.0"
                exclude-result-prefixes="atidlm xml _ _2 ch saxon _5 _4 xsi _js #default exslt msxsl _dtd _ufe _sfe _gte simg ximg _acl">

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
         <_gte:XSLT-pass-control must-do-numbering-pass="true"/>
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
              select="'css/mm_pw300_pw306a_30B1412'"/>

   <!--The user-visible root template-->
<xsl:template name="user-visible-root-template"><!--Do not change the above line, and edit this template with caution!--><html>
         <head>
            <title>
               <xsl:value-of select="$title"/>
            </title>
            <!--The following line pulls in required contents. Do not delete!--><xsl:call-template name="include-required-head-contents"/>
         </head>
         <xsl:apply-templates/>
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
            <xsl:variable name="fileref-value" select="(//soa/@negnumber)[1]"/>
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
      <ch:config/>
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

   <!--Style template for Context: limits/annot-->
<xsl:template name="__style-for_annot.2litsot121">
      <xsl:text> .x-annot-1-0 {margin-left: 0pt; margin-right: 0pt; text-indent: 0pt; }</xsl:text>
   </xsl:template>

   <!--Template for Context: limits/annot-->
<xsl:template match="limits/annot" priority="1">
      <div><!--Emit class values to reflect conditions--><xsl:attribute name="class">
            <xsl:text> x-annot-1-0</xsl:text>
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
         <!--Process this element's content--><xsl:apply-templates/>
      </div>
   </xsl:template>

   <!--Gentext template for Context: limits/annot-->
<xsl:template match="limits/annot" mode="expand-gentext" priority="1">
      <xsl:copy>
         <xsl:apply-templates select="@*|node()" mode="expand-gentext"/>
      </xsl:copy>
   </xsl:template>

   <!--Initial pass template for Context: limits/annot-->
<xsl:template match="limits/annot" mode="initial-pass-mode" priority="1">
      <xsl:copy>
         <xsl:call-template name="maybe-set-gte-id"/>
         <xsl:apply-templates select="@*|node()" mode="initial-pass-mode"/>
      </xsl:copy>
   </xsl:template>

   <!--Set count-as pass template for Context: limits/annot-->
<xsl:template match="limits/annot" mode="set-countas" priority="1">
      <xsl:copy>
         <xsl:apply-templates select="@*|node()" mode="set-countas"/>
      </xsl:copy>
   </xsl:template>

   <!--Set ch:chunk template for Context: limits/annot-->
<xsl:template match="limits/annot" mode="set-ch-chunk" priority="1">
      <xsl:copy>
         <xsl:if test="not(@_gte:did-set-chunk)">
            <xsl:attribute name="_gte:did-set-chunk">yes</xsl:attribute>
         </xsl:if>
         <xsl:apply-templates select="@*|node()" mode="set-ch-chunk"/>
      </xsl:copy>
   </xsl:template>

   <!--Style template for Context: annot-->
<xsl:template name="__style-for_annot.2antot52">
      <xsl:text> .x-annot-2-0 {margin-left: 0pt; margin-right: 0pt; text-indent: 0pt; }</xsl:text>
   </xsl:template>

   <!--Template for Context: annot-->
<xsl:template match="annot" priority="0">
      <div><!--Emit class values to reflect conditions--><xsl:attribute name="class">
            <xsl:text> x-annot-2-0</xsl:text>
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
         <!--Process this element's content--><xsl:apply-templates/>
      </div>
   </xsl:template>

   <!--Gentext template for Context: annot-->
<xsl:template match="annot" mode="expand-gentext" priority="0">
      <xsl:copy>
         <xsl:apply-templates select="@*|node()" mode="expand-gentext"/>
      </xsl:copy>
   </xsl:template>

   <!--Initial pass template for Context: annot-->
<xsl:template match="annot" mode="initial-pass-mode" priority="0">
      <xsl:copy>
         <xsl:call-template name="maybe-set-gte-id"/>
         <xsl:apply-templates select="@*|node()" mode="initial-pass-mode"/>
      </xsl:copy>
   </xsl:template>

   <!--Set count-as pass template for Context: annot-->
<xsl:template match="annot" mode="set-countas" priority="0">
      <xsl:copy>
         <xsl:apply-templates select="@*|node()" mode="set-countas"/>
      </xsl:copy>
   </xsl:template>

   <!--Set ch:chunk template for Context: annot-->
<xsl:template match="annot" mode="set-ch-chunk" priority="0">
      <xsl:copy>
         <xsl:if test="not(@_gte:did-set-chunk)">
            <xsl:attribute name="_gte:did-set-chunk">yes</xsl:attribute>
         </xsl:if>
         <xsl:apply-templates select="@*|node()" mode="set-ch-chunk"/>
      </xsl:copy>
   </xsl:template>

   <!--Style template for Context: at-length-->
<xsl:template name="__style-for_at-length.1">
      <xsl:text> .x-at-length-1-0 {margin-left: 0pt; margin-right: 0pt; }</xsl:text>
   </xsl:template>

   <!--Template for Context: at-length-->
<xsl:template match="at-length" priority="0"><!--Emit a nostyle template--><xsl:apply-templates/>
   </xsl:template>

   <!--Gentext template for Context: at-length-->
<xsl:template match="at-length" mode="expand-gentext" priority="0">
      <xsl:copy>
         <xsl:apply-templates select="@*|node()" mode="expand-gentext"/>
      </xsl:copy>
   </xsl:template>

   <!--Initial pass template for Context: at-length-->
<xsl:template match="at-length" mode="initial-pass-mode" priority="0">
      <xsl:copy>
         <xsl:call-template name="maybe-set-gte-id"/>
         <xsl:apply-templates select="@*|node()" mode="initial-pass-mode"/>
      </xsl:copy>
   </xsl:template>

   <!--Set count-as pass template for Context: at-length-->
<xsl:template match="at-length" mode="set-countas" priority="0">
      <xsl:copy>
         <xsl:apply-templates select="@*|node()" mode="set-countas"/>
      </xsl:copy>
   </xsl:template>

   <!--Set ch:chunk template for Context: at-length-->
<xsl:template match="at-length" mode="set-ch-chunk" priority="0">
      <xsl:copy>
         <xsl:if test="not(@_gte:did-set-chunk)">
            <xsl:attribute name="_gte:did-set-chunk">yes</xsl:attribute>
         </xsl:if>
         <xsl:apply-templates select="@*|node()" mode="set-ch-chunk"/>
      </xsl:copy>
   </xsl:template>

   <!--Style template for Context: build-spec-->
<xsl:template name="__style-for_build-spec.1">
      <xsl:text> .x-build-spec-1-0 {margin-left: 0pt; margin-right: 0pt; text-indent: 0pt; }</xsl:text>
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
         <xsl:copy-of xmlns:dmp="http://www.arbortext.com/namespace/dmp/dmpmap" select="@dmp:*"/>
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
               <xsl:text>BS</xsl:text>
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

   <!--Style template for Context: consumables-->
<xsl:template name="__style-for_consumables.1">
      <xsl:text> .x-consumables-1-0 {margin-left: 0pt; margin-right: 0pt; text-indent: 0pt; } .x-consumables-1-1 {}</xsl:text>
   </xsl:template>

   <!--Template for Context: consumables-->
<xsl:template match="consumables" priority="0">
      <xsl:variable name="foClass">formalBlock</xsl:variable>
      <xsl:variable name="blockness">block</xsl:variable>
      <xsl:variable name="startnew"/>
      <xsl:variable name="newpageset">#noChange</xsl:variable>
      <div><!--Emit class values to reflect conditions--><xsl:attribute name="class">
            <xsl:text> x-consumables-1-0</xsl:text>
            <xsl:if test="@empty and string(@empty)='YES'"> x-consumables-1-1</xsl:if>
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

   <!--Gentext template for Context: consumables-->
<xsl:template match="consumables" mode="expand-gentext" priority="0">
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
            <xsl:when test="@empty and string(@empty)='YES'"><!--AddBefore Condition #1--><xsl:if test="not(@_gte:Gentext-Expanded)">
                  <_gte:Must-Expand-Gentext/>
                  <_sfe:BeforeOrAfterText>
                     <_ufe:consumables-title/>
                     <_ufe:not-applicable/>
                  </_sfe:BeforeOrAfterText>
               </xsl:if>
            </xsl:when>
            <xsl:otherwise>
               <xsl:if test="not(@_gte:Gentext-Expanded)">
                  <_gte:Must-Expand-Gentext/>
                  <_sfe:BeforeOrAfterText>
                     <_ufe:consumables-title/>
                  </_sfe:BeforeOrAfterText>
               </xsl:if>
            </xsl:otherwise>
         </xsl:choose>
         <xsl:apply-templates select="* | text() | processing-instruction()" mode="expand-gentext"/>
      </xsl:copy>
   </xsl:template>

   <!--Initial pass template for Context: consumables-->
<xsl:template match="consumables" mode="initial-pass-mode" priority="0">
      <xsl:copy>
         <xsl:call-template name="maybe-set-gte-id"/>
         <xsl:apply-templates select="@*|node()" mode="initial-pass-mode"/>
      </xsl:copy>
   </xsl:template>

   <!--Set count-as pass template for Context: consumables-->
<xsl:template match="consumables" mode="set-countas" priority="0">
      <xsl:copy>
         <xsl:apply-templates select="@*|node()" mode="set-countas"/>
      </xsl:copy>
   </xsl:template>

   <!--Set ch:chunk template for Context: consumables-->
<xsl:template match="consumables" mode="set-ch-chunk" priority="0">
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

   <!--Style template for Context: fandc-proc-->
<xsl:template name="__style-for_fandc-proc.1">
      <xsl:text> .x-fandc-proc-1-0 {margin-left: 0pt; margin-right: 0pt; }</xsl:text>
   </xsl:template>

   <!--Template for Context: fandc-proc-->
<xsl:template match="fandc-proc" priority="0"><!--Emit a nostyle template--><xsl:apply-templates/>
   </xsl:template>

   <!--Gentext template for Context: fandc-proc-->
<xsl:template match="fandc-proc" mode="expand-gentext" priority="0">
      <xsl:copy>
         <xsl:apply-templates select="@*|node()" mode="expand-gentext"/>
      </xsl:copy>
   </xsl:template>

   <!--Initial pass template for Context: fandc-proc-->
<xsl:template match="fandc-proc" mode="initial-pass-mode" priority="0">
      <xsl:copy>
         <xsl:call-template name="maybe-set-gte-id"/>
         <xsl:apply-templates select="@*|node()" mode="initial-pass-mode"/>
      </xsl:copy>
   </xsl:template>

   <!--Set count-as pass template for Context: fandc-proc-->
<xsl:template match="fandc-proc" mode="set-countas" priority="0">
      <xsl:copy>
         <xsl:apply-templates select="@*|node()" mode="set-countas"/>
      </xsl:copy>
   </xsl:template>

   <!--Set ch:chunk template for Context: fandc-proc-->
<xsl:template match="fandc-proc" mode="set-ch-chunk" priority="0">
      <xsl:copy>
         <xsl:if test="not(@_gte:did-set-chunk)">
            <xsl:attribute name="_gte:did-set-chunk">yes</xsl:attribute>
         </xsl:if>
         <xsl:apply-templates select="@*|node()" mode="set-ch-chunk"/>
      </xsl:copy>
   </xsl:template>

   <!--Style template for Context: fits-->
<xsl:template name="__style-for_fits.1">
      <xsl:text> .x-fits-1-0 {margin-left: 0pt; margin-right: 0pt; text-indent: 0pt; }</xsl:text>
   </xsl:template>

   <!--Template for Context: fits-->
<xsl:template match="fits" priority="0">
      <div><!--Emit class values to reflect conditions--><xsl:attribute name="class">
            <xsl:text> x-fits-1-0</xsl:text>
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
         <!--Process this element's content--><xsl:apply-templates/>
      </div>
   </xsl:template>

   <!--Gentext template for Context: fits-->
<xsl:template match="fits" mode="expand-gentext" priority="0">
      <xsl:copy>
         <xsl:apply-templates select="@*|node()" mode="expand-gentext"/>
      </xsl:copy>
   </xsl:template>

   <!--Initial pass template for Context: fits-->
<xsl:template match="fits" mode="initial-pass-mode" priority="0">
      <xsl:copy>
         <xsl:call-template name="maybe-set-gte-id"/>
         <xsl:apply-templates select="@*|node()" mode="initial-pass-mode"/>
      </xsl:copy>
   </xsl:template>

   <!--Set count-as pass template for Context: fits-->
<xsl:template match="fits" mode="set-countas" priority="0">
      <xsl:copy>
         <xsl:apply-templates select="@*|node()" mode="set-countas"/>
      </xsl:copy>
   </xsl:template>

   <!--Set ch:chunk template for Context: fits-->
<xsl:template match="fits" mode="set-ch-chunk" priority="0">
      <xsl:copy>
         <xsl:if test="not(@_gte:did-set-chunk)">
            <xsl:attribute name="_gte:did-set-chunk">yes</xsl:attribute>
         </xsl:if>
         <xsl:apply-templates select="@*|node()" mode="set-ch-chunk"/>
      </xsl:copy>
   </xsl:template>

   <!--Style template for Context: fits-and-clears-->
<xsl:template name="__style-for_fits-and-clears.1">
      <xsl:text> .x-fits-and-clears-1-0 {margin-left: 0pt; margin-right: 0pt; text-indent: 0pt; }</xsl:text>
   </xsl:template>

   <!--Template for Context: fits-and-clears-->
<xsl:template match="fits-and-clears" priority="0">
      <div><!--Emit class values to reflect conditions--><xsl:attribute name="class">
            <xsl:text> x-fits-and-clears-1-0</xsl:text>
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
         <xsl:call-template name="maybe-set-id">
            <xsl:with-param name="only-if-id-attr" select="'no'"/>
            <xsl:with-param name="generated-id-prefix" select="'styler-id'"/>
         </xsl:call-template>
         <!--Process this element's content--><xsl:apply-templates/>
      </div>
   </xsl:template>

   <!--Gentext template for Context: fits-and-clears-->
<xsl:template match="fits-and-clears" mode="expand-gentext" priority="0">
      <xsl:copy>
         <xsl:apply-templates select="@*|node()" mode="expand-gentext"/>
      </xsl:copy>
   </xsl:template>

   <!--Initial pass template for Context: fits-and-clears-->
<xsl:template match="fits-and-clears" mode="initial-pass-mode" priority="0">
      <xsl:copy>
         <xsl:call-template name="maybe-set-gte-id"/>
         <xsl:apply-templates select="@*|node()" mode="initial-pass-mode"/>
      </xsl:copy>
   </xsl:template>

   <!--Set count-as pass template for Context: fits-and-clears-->
<xsl:template match="fits-and-clears" mode="set-countas" priority="0">
      <xsl:copy>
         <xsl:apply-templates select="@*|node()" mode="set-countas"/>
      </xsl:copy>
   </xsl:template>

   <!--Set ch:chunk template for Context: fits-and-clears-->
<xsl:template match="fits-and-clears" mode="set-ch-chunk" priority="0">
      <xsl:copy>
         <xsl:if test="not(@_gte:did-set-chunk)">
            <xsl:attribute name="_gte:did-set-chunk">yes</xsl:attribute>
         </xsl:if>
         <xsl:apply-templates select="@*|node()" mode="set-ch-chunk"/>
      </xsl:copy>
   </xsl:template>

   <!--Style template for Context: fix-equip-list-->
<xsl:template name="__style-for_fix-equip-list.1">
      <xsl:text> .x-fix-equip-list-1-0 {margin-left: 0pt; margin-right: 0pt; }</xsl:text>
   </xsl:template>

   <!--Template for Context: fix-equip-list-->
<xsl:template match="fix-equip-list" priority="0"><!--Emit a nostyle template--><xsl:apply-templates/>
   </xsl:template>

   <!--Gentext template for Context: fix-equip-list-->
<xsl:template match="fix-equip-list" mode="expand-gentext" priority="0">
      <xsl:copy>
         <xsl:apply-templates select="@*|node()" mode="expand-gentext"/>
      </xsl:copy>
   </xsl:template>

   <!--Initial pass template for Context: fix-equip-list-->
<xsl:template match="fix-equip-list" mode="initial-pass-mode" priority="0">
      <xsl:copy>
         <xsl:call-template name="maybe-set-gte-id"/>
         <xsl:apply-templates select="@*|node()" mode="initial-pass-mode"/>
      </xsl:copy>
   </xsl:template>

   <!--Set count-as pass template for Context: fix-equip-list-->
<xsl:template match="fix-equip-list" mode="set-countas" priority="0">
      <xsl:copy>
         <xsl:apply-templates select="@*|node()" mode="set-countas"/>
      </xsl:copy>
   </xsl:template>

   <!--Set ch:chunk template for Context: fix-equip-list-->
<xsl:template match="fix-equip-list" mode="set-ch-chunk" priority="0">
      <xsl:copy>
         <xsl:if test="not(@_gte:did-set-chunk)">
            <xsl:attribute name="_gte:did-set-chunk">yes</xsl:attribute>
         </xsl:if>
         <xsl:apply-templates select="@*|node()" mode="set-ch-chunk"/>
      </xsl:copy>
   </xsl:template>

   <!--Style template for Context: fixtures-and-equipment-->
<xsl:template name="__style-for_fixtures-and-equipment.1">
      <xsl:text> .x-fixtures-and-equipment-1-0 {margin-left: 0pt; margin-right: 0pt; text-indent: 0pt; } .x-fixtures-and-equipment-1-1 {}</xsl:text>
   </xsl:template>

   <!--Template for Context: fixtures-and-equipment-->
<xsl:template match="fixtures-and-equipment" priority="0">
      <xsl:variable name="foClass">formalBlock</xsl:variable>
      <xsl:variable name="blockness">block</xsl:variable>
      <xsl:variable name="startnew"/>
      <xsl:variable name="newpageset">#noChange</xsl:variable>
      <div><!--Emit class values to reflect conditions--><xsl:attribute name="class">
            <xsl:text> x-fixtures-and-equipment-1-0</xsl:text>
            <xsl:if test="@empty and string(@empty)='YES'"> x-fixtures-and-equipment-1-1</xsl:if>
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

   <!--Gentext template for Context: fixtures-and-equipment-->
<xsl:template match="fixtures-and-equipment" mode="expand-gentext" priority="0">
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
            <xsl:when test="@empty and string(@empty)='YES'"><!--AddBefore Condition #1--><xsl:if test="not(@_gte:Gentext-Expanded)">
                  <_gte:Must-Expand-Gentext/>
                  <_sfe:BeforeOrAfterText>
                     <_ufe:fixequ-title/>
                     <_ufe:not-applicable/>
                  </_sfe:BeforeOrAfterText>
               </xsl:if>
            </xsl:when>
            <xsl:otherwise>
               <xsl:if test="not(@_gte:Gentext-Expanded)">
                  <_gte:Must-Expand-Gentext/>
                  <_sfe:BeforeOrAfterText>
                     <_ufe:fixequ-title/>
                  </_sfe:BeforeOrAfterText>
               </xsl:if>
            </xsl:otherwise>
         </xsl:choose>
         <xsl:apply-templates select="* | text() | processing-instruction()" mode="expand-gentext"/>
      </xsl:copy>
   </xsl:template>

   <!--Initial pass template for Context: fixtures-and-equipment-->
<xsl:template match="fixtures-and-equipment" mode="initial-pass-mode" priority="0">
      <xsl:copy>
         <xsl:call-template name="maybe-set-gte-id"/>
         <xsl:apply-templates select="@*|node()" mode="initial-pass-mode"/>
      </xsl:copy>
   </xsl:template>

   <!--Set count-as pass template for Context: fixtures-and-equipment-->
<xsl:template match="fixtures-and-equipment" mode="set-countas" priority="0">
      <xsl:copy>
         <xsl:apply-templates select="@*|node()" mode="set-countas"/>
      </xsl:copy>
   </xsl:template>

   <!--Set ch:chunk template for Context: fixtures-and-equipment-->
<xsl:template match="fixtures-and-equipment" mode="set-ch-chunk" priority="0">
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

   <!--Style template for Context: general-->
<xsl:template name="__style-for_general.1">
      <xsl:text> .x-general-1-0 {margin-left: 0pt; margin-right: 0pt; text-indent: 0pt; }</xsl:text>
   </xsl:template>

   <!--Template for Context: general-->
<xsl:template match="general" priority="0">
      <div><!--Emit class values to reflect conditions--><xsl:attribute name="class">
            <xsl:text> x-general-1-0</xsl:text>
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
         <xsl:call-template name="maybe-set-id">
            <xsl:with-param name="only-if-id-attr" select="'no'"/>
            <xsl:with-param name="generated-id-prefix" select="'styler-id'"/>
         </xsl:call-template>
         <!--Process this element's content--><xsl:apply-templates/>
      </div>
   </xsl:template>

   <!--Gentext template for Context: general-->
<xsl:template match="general" mode="expand-gentext" priority="0">
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
               <_ufe:general-title/>
            </_sfe:BeforeOrAfterText>
         </xsl:if>
         <xsl:apply-templates select="* | text() | processing-instruction()" mode="expand-gentext"/>
      </xsl:copy>
   </xsl:template>

   <!--Initial pass template for Context: general-->
<xsl:template match="general" mode="initial-pass-mode" priority="0">
      <xsl:copy>
         <xsl:call-template name="maybe-set-gte-id"/>
         <xsl:apply-templates select="@*|node()" mode="initial-pass-mode"/>
      </xsl:copy>
   </xsl:template>

   <!--Set count-as pass template for Context: general-->
<xsl:template match="general" mode="set-countas" priority="0">
      <xsl:copy>
         <xsl:apply-templates select="@*|node()" mode="set-countas"/>
      </xsl:copy>
   </xsl:template>

   <!--Set ch:chunk template for Context: general-->
<xsl:template match="general" mode="set-ch-chunk" priority="0">
      <xsl:copy>
         <xsl:if test="not(@_gte:did-set-chunk)">
            <xsl:attribute name="_gte:did-set-chunk">yes</xsl:attribute>
         </xsl:if>
         <xsl:apply-templates select="@*|node()" mode="set-ch-chunk"/>
      </xsl:copy>
   </xsl:template>

   <!--Style template for Context: ifr-->
<xsl:template name="__style-for_ifr.1">
      <xsl:text> .x-ifr-1-0 {margin-left: 0pt; margin-right: 0pt; }</xsl:text>
   </xsl:template>

   <!--Template for Context: ifr-->
<xsl:template match="ifr" priority="0"><!--Emit a nostyle template--><xsl:apply-templates/>
   </xsl:template>

   <!--Gentext template for Context: ifr-->
<xsl:template match="ifr" mode="expand-gentext" priority="0">
      <xsl:copy>
         <xsl:apply-templates select="@*|node()" mode="expand-gentext"/>
      </xsl:copy>
   </xsl:template>

   <!--Initial pass template for Context: ifr-->
<xsl:template match="ifr" mode="initial-pass-mode" priority="0">
      <xsl:copy>
         <xsl:call-template name="maybe-set-gte-id"/>
         <xsl:apply-templates select="@*|node()" mode="initial-pass-mode"/>
      </xsl:copy>
   </xsl:template>

   <!--Set count-as pass template for Context: ifr-->
<xsl:template match="ifr" mode="set-countas" priority="0">
      <xsl:copy>
         <xsl:apply-templates select="@*|node()" mode="set-countas"/>
      </xsl:copy>
   </xsl:template>

   <!--Set ch:chunk template for Context: ifr-->
<xsl:template match="ifr" mode="set-ch-chunk" priority="0">
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
<xsl:template match="imp" priority="0"><!--Emit a nostyle template--><xsl:apply-templates/>
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
         <xsl:copy-of xmlns:dmp="http://www.arbortext.com/namespace/dmp/dmpmap" select="@dmp:*"/>
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

   <!--Style template for Context: limits-->
<xsl:template name="__style-for_limits.1">
      <xsl:text> .x-limits-1-0 {margin-left: 0pt; margin-right: 0pt; }</xsl:text>
   </xsl:template>

   <!--Template for Context: limits-->
<xsl:template match="limits" priority="0"><!--Emit a nostyle template--><xsl:apply-templates/>
   </xsl:template>

   <!--Gentext template for Context: limits-->
<xsl:template match="limits" mode="expand-gentext" priority="0">
      <xsl:copy>
         <xsl:apply-templates select="@*|node()" mode="expand-gentext"/>
      </xsl:copy>
   </xsl:template>

   <!--Initial pass template for Context: limits-->
<xsl:template match="limits" mode="initial-pass-mode" priority="0">
      <xsl:copy>
         <xsl:call-template name="maybe-set-gte-id"/>
         <xsl:apply-templates select="@*|node()" mode="initial-pass-mode"/>
      </xsl:copy>
   </xsl:template>

   <!--Set count-as pass template for Context: limits-->
<xsl:template match="limits" mode="set-countas" priority="0">
      <xsl:copy>
         <xsl:apply-templates select="@*|node()" mode="set-countas"/>
      </xsl:copy>
   </xsl:template>

   <!--Set ch:chunk template for Context: limits-->
<xsl:template match="limits" mode="set-ch-chunk" priority="0">
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
         <xsl:copy-of xmlns:dmp="http://www.arbortext.com/namespace/dmp/dmpmap" select="@dmp:*"/>
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

   <!--Style template for Context: mating-part-->
<xsl:template name="__style-for_mating-part.1">
      <xsl:text> .x-mating-part-1-0 {margin-left: 0pt; margin-right: 0pt; }</xsl:text>
   </xsl:template>

   <!--Template for Context: mating-part-->
<xsl:template match="mating-part" priority="0"><!--Emit a nostyle template--><xsl:apply-templates/>
   </xsl:template>

   <!--Gentext template for Context: mating-part-->
<xsl:template match="mating-part" mode="expand-gentext" priority="0">
      <xsl:copy>
         <xsl:apply-templates select="@*|node()" mode="expand-gentext"/>
      </xsl:copy>
   </xsl:template>

   <!--Initial pass template for Context: mating-part-->
<xsl:template match="mating-part" mode="initial-pass-mode" priority="0">
      <xsl:copy>
         <xsl:call-template name="maybe-set-gte-id"/>
         <xsl:apply-templates select="@*|node()" mode="initial-pass-mode"/>
      </xsl:copy>
   </xsl:template>

   <!--Set count-as pass template for Context: mating-part-->
<xsl:template match="mating-part" mode="set-countas" priority="0">
      <xsl:copy>
         <xsl:apply-templates select="@*|node()" mode="set-countas"/>
      </xsl:copy>
   </xsl:template>

   <!--Set ch:chunk template for Context: mating-part-->
<xsl:template match="mating-part" mode="set-ch-chunk" priority="0">
      <xsl:copy>
         <xsl:if test="not(@_gte:did-set-chunk)">
            <xsl:attribute name="_gte:did-set-chunk">yes</xsl:attribute>
         </xsl:if>
         <xsl:apply-templates select="@*|node()" mode="set-ch-chunk"/>
      </xsl:copy>
   </xsl:template>

   <!--Style template for Context: max-->
<xsl:template name="__style-for_max.1">
      <xsl:text> .x-max-1-0 {margin-left: 0pt; margin-right: 0pt; }</xsl:text>
   </xsl:template>

   <!--Template for Context: max-->
<xsl:template match="max" priority="0"><!--Emit a nostyle template--><xsl:apply-templates/>
   </xsl:template>

   <!--Gentext template for Context: max-->
<xsl:template match="max" mode="expand-gentext" priority="0">
      <xsl:copy>
         <xsl:apply-templates select="@*|node()" mode="expand-gentext"/>
      </xsl:copy>
   </xsl:template>

   <!--Initial pass template for Context: max-->
<xsl:template match="max" mode="initial-pass-mode" priority="0">
      <xsl:copy>
         <xsl:call-template name="maybe-set-gte-id"/>
         <xsl:apply-templates select="@*|node()" mode="initial-pass-mode"/>
      </xsl:copy>
   </xsl:template>

   <!--Set count-as pass template for Context: max-->
<xsl:template match="max" mode="set-countas" priority="0">
      <xsl:copy>
         <xsl:apply-templates select="@*|node()" mode="set-countas"/>
      </xsl:copy>
   </xsl:template>

   <!--Set ch:chunk template for Context: max-->
<xsl:template match="max" mode="set-ch-chunk" priority="0">
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
<xsl:template match="met" priority="0"><!--Emit a nostyle template--><xsl:apply-templates/>
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
         <xsl:copy-of xmlns:dmp="http://www.arbortext.com/namespace/dmp/dmpmap" select="@dmp:*"/>
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

   <!--Style template for Context: min-->
<xsl:template name="__style-for_min.1">
      <xsl:text> .x-min-1-0 {margin-left: 0pt; margin-right: 0pt; }</xsl:text>
   </xsl:template>

   <!--Template for Context: min-->
<xsl:template match="min" priority="0"><!--Emit a nostyle template--><xsl:apply-templates/>
   </xsl:template>

   <!--Gentext template for Context: min-->
<xsl:template match="min" mode="expand-gentext" priority="0">
      <xsl:copy>
         <xsl:apply-templates select="@*|node()" mode="expand-gentext"/>
      </xsl:copy>
   </xsl:template>

   <!--Initial pass template for Context: min-->
<xsl:template match="min" mode="initial-pass-mode" priority="0">
      <xsl:copy>
         <xsl:call-template name="maybe-set-gte-id"/>
         <xsl:apply-templates select="@*|node()" mode="initial-pass-mode"/>
      </xsl:copy>
   </xsl:template>

   <!--Set count-as pass template for Context: min-->
<xsl:template match="min" mode="set-countas" priority="0">
      <xsl:copy>
         <xsl:apply-templates select="@*|node()" mode="set-countas"/>
      </xsl:copy>
   </xsl:template>

   <!--Set ch:chunk template for Context: min-->
<xsl:template match="min" mode="set-ch-chunk" priority="0">
      <xsl:copy>
         <xsl:if test="not(@_gte:did-set-chunk)">
            <xsl:attribute name="_gte:did-set-chunk">yes</xsl:attribute>
         </xsl:if>
         <xsl:apply-templates select="@*|node()" mode="set-ch-chunk"/>
      </xsl:copy>
   </xsl:template>

   <!--Style template for Context: mm-fits-->
<xsl:template name="__style-for_mm-fits.1">
      <xsl:text> .x-mm-fits-1-0 {margin-left: 0pt; margin-right: 0pt; text-indent: 0pt; }</xsl:text>
   </xsl:template>

   <!--Template for Context: mm-fits-->
<xsl:template match="mm-fits" priority="0">
      <div><!--Emit class values to reflect conditions--><xsl:attribute name="class">
            <xsl:text> x-mm-fits-1-0</xsl:text>
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
         <xsl:call-template name="maybe-set-id">
            <xsl:with-param name="only-if-id-attr" select="'no'"/>
            <xsl:with-param name="generated-id-prefix" select="'styler-id'"/>
         </xsl:call-template>
         <!--Process this element's content--><xsl:apply-templates/>
      </div>
   </xsl:template>

   <!--Gentext template for Context: mm-fits-->
<xsl:template match="mm-fits" mode="expand-gentext" priority="0">
      <xsl:copy>
         <xsl:apply-templates select="@*|node()" mode="expand-gentext"/>
      </xsl:copy>
   </xsl:template>

   <!--Initial pass template for Context: mm-fits-->
<xsl:template match="mm-fits" mode="initial-pass-mode" priority="0">
      <xsl:copy>
         <xsl:call-template name="maybe-set-gte-id"/>
         <xsl:apply-templates select="@*|node()" mode="initial-pass-mode"/>
      </xsl:copy>
   </xsl:template>

   <!--Set count-as pass template for Context: mm-fits-->
<xsl:template match="mm-fits" mode="set-countas" priority="0">
      <xsl:copy>
         <xsl:apply-templates select="@*|node()" mode="set-countas"/>
      </xsl:copy>
   </xsl:template>

   <!--Set ch:chunk template for Context: mm-fits-->
<xsl:template match="mm-fits" mode="set-ch-chunk" priority="0">
      <xsl:copy>
         <xsl:if test="not(@_gte:did-set-chunk)">
            <xsl:attribute name="_gte:did-set-chunk">yes</xsl:attribute>
         </xsl:if>
         <xsl:apply-templates select="@*|node()" mode="set-ch-chunk"/>
      </xsl:copy>
   </xsl:template>

   <!--Style template for Context: nomen-->
<xsl:template name="__style-for_nomen.1">
      <xsl:text> .x-nomen-1-0 {margin-left: 0pt; margin-right: 0pt; }</xsl:text>
   </xsl:template>

   <!--Template for Context: nomen-->
<xsl:template match="nomen" priority="0"><!--Emit a nostyle template--><xsl:apply-templates/>
   </xsl:template>

   <!--Gentext template for Context: nomen-->
<xsl:template match="nomen" mode="expand-gentext" priority="0">
      <xsl:copy>
         <xsl:apply-templates select="@*|node()" mode="expand-gentext"/>
      </xsl:copy>
   </xsl:template>

   <!--Initial pass template for Context: nomen-->
<xsl:template match="nomen" mode="initial-pass-mode" priority="0">
      <xsl:copy>
         <xsl:call-template name="maybe-set-gte-id"/>
         <xsl:apply-templates select="@*|node()" mode="initial-pass-mode"/>
      </xsl:copy>
   </xsl:template>

   <!--Set count-as pass template for Context: nomen-->
<xsl:template match="nomen" mode="set-countas" priority="0">
      <xsl:copy>
         <xsl:apply-templates select="@*|node()" mode="set-countas"/>
      </xsl:copy>
   </xsl:template>

   <!--Set ch:chunk template for Context: nomen-->
<xsl:template match="nomen" mode="set-ch-chunk" priority="0">
      <xsl:copy>
         <xsl:if test="not(@_gte:did-set-chunk)">
            <xsl:attribute name="_gte:did-set-chunk">yes</xsl:attribute>
         </xsl:if>
         <xsl:apply-templates select="@*|node()" mode="set-ch-chunk"/>
      </xsl:copy>
   </xsl:template>

   <!--Style template for Context: pageblock-front-->
<xsl:template name="__style-for_pageblock-front.1">
      <xsl:text> .x-pageblock-front-1-0 {margin-left: 0pt; margin-right: 0pt; text-indent: 0pt; }</xsl:text>
   </xsl:template>

   <!--Template for Context: pageblock-front-->
<xsl:template match="pageblock-front" priority="0">
      <div><!--Emit class values to reflect conditions--><xsl:attribute name="class">
            <xsl:text> x-pageblock-front-1-0</xsl:text>
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
         <!--Process this element's content--><xsl:apply-templates/>
      </div>
   </xsl:template>

   <!--Gentext template for Context: pageblock-front-->
<xsl:template match="pageblock-front" mode="expand-gentext" priority="0">
      <xsl:copy>
         <xsl:apply-templates select="@*|node()" mode="expand-gentext"/>
      </xsl:copy>
   </xsl:template>

   <!--Initial pass template for Context: pageblock-front-->
<xsl:template match="pageblock-front" mode="initial-pass-mode" priority="0">
      <xsl:copy>
         <xsl:call-template name="maybe-set-gte-id"/>
         <xsl:apply-templates select="@*|node()" mode="initial-pass-mode"/>
      </xsl:copy>
   </xsl:template>

   <!--Set count-as pass template for Context: pageblock-front-->
<xsl:template match="pageblock-front" mode="set-countas" priority="0">
      <xsl:copy>
         <xsl:apply-templates select="@*|node()" mode="set-countas"/>
      </xsl:copy>
   </xsl:template>

   <!--Set ch:chunk template for Context: pageblock-front-->
<xsl:template match="pageblock-front" mode="set-ch-chunk" priority="0">
      <xsl:copy>
         <xsl:if test="not(@_gte:did-set-chunk)">
            <xsl:attribute name="_gte:did-set-chunk">yes</xsl:attribute>
         </xsl:if>
         <xsl:apply-templates select="@*|node()" mode="set-ch-chunk"/>
      </xsl:copy>
   </xsl:template>

   <!--Style template for Context: frontmatter//module/pageblock-title-->
<xsl:template name="__style-for_pageblock-title.3frtmle351">
      <xsl:text> .x-pageblock-title-1-0 {margin-left: 0pt; margin-right: 0pt; text-indent: 0pt; font-weight: bold; text-decoration: underline ; text-transform: uppercase; margin-left: 0pt; text-indent: 0pt; text-align: center; }</xsl:text>
   </xsl:template>

   <!--Template for Context: frontmatter//module/pageblock-title-->
<xsl:template match="frontmatter//module/pageblock-title" priority="2">
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
         <xsl:copy-of xmlns:dmp="http://www.arbortext.com/namespace/dmp/dmpmap" select="@dmp:*"/>
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
<xsl:template match="frontmatter//module/pageblock-title" mode="expand-gentext" priority="2">
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
                 priority="2">
      <xsl:copy>
         <xsl:call-template name="maybe-set-gte-id"/>
         <xsl:apply-templates select="@*|node()" mode="initial-pass-mode"/>
      </xsl:copy>
   </xsl:template>

   <!--Numbering template for context=frontmatter//module/pageblock-title-->
<xsl:template match="frontmatter//module/pageblock-title" mode="styler_numbering"
                 priority="2">
      <xsl:number count="frontmatter//module[pageblock-title]" format="1"/>
   </xsl:template>

   <!--Set count-as pass template for Context: frontmatter//module/pageblock-title-->
<xsl:template match="frontmatter//module/pageblock-title" mode="set-countas" priority="2">
      <xsl:copy>
         <xsl:apply-templates select="@*|node()" mode="set-countas"/>
      </xsl:copy>
   </xsl:template>

   <!--LabelAndNumberMarker template-->
<xsl:template match="frontmatter//module/pageblock-title" mode="styler-LabelAndNumberMarker"
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

   <!--Set ch:chunk template for Context: frontmatter//module/pageblock-title-->
<xsl:template match="frontmatter//module/pageblock-title" mode="set-ch-chunk" priority="2">
      <xsl:copy>
         <xsl:if test="not(@_gte:did-set-chunk)">
            <xsl:attribute name="_gte:did-set-chunk">yes</xsl:attribute>
         </xsl:if>
         <xsl:apply-templates select="@*|node()" mode="set-ch-chunk"/>
      </xsl:copy>
   </xsl:template>

   <!--Style template for Context: pgblk/pageblock-title-->
<xsl:template name="__style-for_pageblock-title.3pgkple212">
      <xsl:text> .x-pageblock-title-2-0 {margin-left: 0pt; margin-right: 0pt; text-indent: 0pt; margin-left: 0pt; text-indent: 0pt; }</xsl:text>
   </xsl:template>

   <!--Template for Context: pgblk/pageblock-title-->
<xsl:template match="pgblk/pageblock-title" priority="1">
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
         <xsl:copy-of xmlns:dmp="http://www.arbortext.com/namespace/dmp/dmpmap" select="@dmp:*"/>
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

   <!--Gentext template for Context: pgblk/pageblock-title-->
<xsl:template match="pgblk/pageblock-title" mode="expand-gentext" priority="1">
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

   <!--Initial pass template for Context: pgblk/pageblock-title-->
<xsl:template match="pgblk/pageblock-title" mode="initial-pass-mode" priority="1">
      <xsl:copy>
         <xsl:call-template name="maybe-set-gte-id"/>
         <xsl:apply-templates select="@*|node()" mode="initial-pass-mode"/>
      </xsl:copy>
   </xsl:template>

   <!--Numbering template for context=pgblk/pageblock-title-->
<xsl:template match="pgblk/pageblock-title" mode="styler_numbering" priority="1">
      <xsl:variable name="node-id" select="generate-id(ancestor::pgblk[1])"/>
      <xsl:variable name="num">
         <xsl:for-each select="//*[not(ancestor-or-self::pgblk)]/pgblk[pageblock-title]|/pgblk[pageblock-title]">
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
   </xsl:template>

   <!--Set count-as pass template for Context: pgblk/pageblock-title-->
<xsl:template match="pgblk/pageblock-title" mode="set-countas" priority="1">
      <xsl:copy>
         <xsl:apply-templates select="@*|node()" mode="set-countas"/>
      </xsl:copy>
   </xsl:template>

   <!--LabelAndNumberMarker template-->
<xsl:template match="pgblk/pageblock-title" mode="styler-LabelAndNumberMarker" priority="1">
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

   <!--Set ch:chunk template for Context: pgblk/pageblock-title-->
<xsl:template match="pgblk/pageblock-title" mode="set-ch-chunk" priority="1">
      <xsl:copy>
         <xsl:if test="not(@_gte:did-set-chunk)">
            <xsl:attribute name="_gte:did-set-chunk">yes</xsl:attribute>
         </xsl:if>
         <xsl:apply-templates select="@*|node()" mode="set-ch-chunk"/>
      </xsl:copy>
   </xsl:template>

   <!--Style template for Context: pageblock-title-->
<xsl:template name="__style-for_pageblock-title.3pablle153">
      <xsl:text> .x-pageblock-title-3-0 {margin-left: 0pt; margin-right: 0pt; text-indent: 0pt; font-weight: bold; font-size: 14pt; }</xsl:text>
   </xsl:template>

   <!--Template for Context: pageblock-title-->
<xsl:template match="pageblock-title" priority="0">
      <div>
         <xsl:attribute name="ch:title">toc</xsl:attribute>
         <!--Emit class values to reflect conditions--><xsl:attribute name="class">
            <xsl:text> x-pageblock-title-3-0</xsl:text>
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
<xsl:template match="part" priority="0"><!--Emit a nostyle template--><xsl:apply-templates/>
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

   <!--Style template for Context: q-and-st-->
<xsl:template name="__style-for_q-and-st.1">
      <xsl:text> .x-q-and-st-1-0 {margin-left: 0pt; margin-right: 0pt; }</xsl:text>
   </xsl:template>

   <!--Template for Context: q-and-st-->
<xsl:template match="q-and-st" priority="0"><!--Emit a nostyle template--><xsl:apply-templates/>
   </xsl:template>

   <!--Gentext template for Context: q-and-st-->
<xsl:template match="q-and-st" mode="expand-gentext" priority="0">
      <xsl:copy>
         <xsl:apply-templates select="@*|node()" mode="expand-gentext"/>
      </xsl:copy>
   </xsl:template>

   <!--Initial pass template for Context: q-and-st-->
<xsl:template match="q-and-st" mode="initial-pass-mode" priority="0">
      <xsl:copy>
         <xsl:call-template name="maybe-set-gte-id"/>
         <xsl:apply-templates select="@*|node()" mode="initial-pass-mode"/>
      </xsl:copy>
   </xsl:template>

   <!--Set count-as pass template for Context: q-and-st-->
<xsl:template match="q-and-st" mode="set-countas" priority="0">
      <xsl:copy>
         <xsl:apply-templates select="@*|node()" mode="set-countas"/>
      </xsl:copy>
   </xsl:template>

   <!--Set ch:chunk template for Context: q-and-st-->
<xsl:template match="q-and-st" mode="set-ch-chunk" priority="0">
      <xsl:copy>
         <xsl:if test="not(@_gte:did-set-chunk)">
            <xsl:attribute name="_gte:did-set-chunk">yes</xsl:attribute>
         </xsl:if>
         <xsl:apply-templates select="@*|node()" mode="set-ch-chunk"/>
      </xsl:copy>
   </xsl:template>

   <!--Style template for Context: ref-nbr-->
<xsl:template name="__style-for_ref-nbr.1">
      <xsl:text> .x-ref-nbr-1-0 {margin-left: 0pt; margin-right: 0pt; }</xsl:text>
   </xsl:template>

   <!--Template for Context: ref-nbr-->
<xsl:template match="ref-nbr" priority="0"><!--Emit a nostyle template--><xsl:apply-templates/>
   </xsl:template>

   <!--Gentext template for Context: ref-nbr-->
<xsl:template match="ref-nbr" mode="expand-gentext" priority="0">
      <xsl:copy>
         <xsl:apply-templates select="@*|node()" mode="expand-gentext"/>
      </xsl:copy>
   </xsl:template>

   <!--Initial pass template for Context: ref-nbr-->
<xsl:template match="ref-nbr" mode="initial-pass-mode" priority="0">
      <xsl:copy>
         <xsl:call-template name="maybe-set-gte-id"/>
         <xsl:apply-templates select="@*|node()" mode="initial-pass-mode"/>
      </xsl:copy>
   </xsl:template>

   <!--Set count-as pass template for Context: ref-nbr-->
<xsl:template match="ref-nbr" mode="set-countas" priority="0">
      <xsl:copy>
         <xsl:apply-templates select="@*|node()" mode="set-countas"/>
      </xsl:copy>
   </xsl:template>

   <!--Set ch:chunk template for Context: ref-nbr-->
<xsl:template match="ref-nbr" mode="set-ch-chunk" priority="0">
      <xsl:copy>
         <xsl:if test="not(@_gte:did-set-chunk)">
            <xsl:attribute name="_gte:did-set-chunk">yes</xsl:attribute>
         </xsl:if>
         <xsl:apply-templates select="@*|node()" mode="set-ch-chunk"/>
      </xsl:copy>
   </xsl:template>

   <!--Style template for Context: remarks-->
<xsl:template name="__style-for_remarks.1">
      <xsl:text> .x-remarks-1-0 {margin-left: 0pt; margin-right: 0pt; }</xsl:text>
   </xsl:template>

   <!--Template for Context: remarks-->
<xsl:template match="remarks" priority="0"><!--Emit a nostyle template--><xsl:apply-templates/>
   </xsl:template>

   <!--Gentext template for Context: remarks-->
<xsl:template match="remarks" mode="expand-gentext" priority="0">
      <xsl:copy>
         <xsl:apply-templates select="@*|node()" mode="expand-gentext"/>
      </xsl:copy>
   </xsl:template>

   <!--Initial pass template for Context: remarks-->
<xsl:template match="remarks" mode="initial-pass-mode" priority="0">
      <xsl:copy>
         <xsl:call-template name="maybe-set-gte-id"/>
         <xsl:apply-templates select="@*|node()" mode="initial-pass-mode"/>
      </xsl:copy>
   </xsl:template>

   <!--Set count-as pass template for Context: remarks-->
<xsl:template match="remarks" mode="set-countas" priority="0">
      <xsl:copy>
         <xsl:apply-templates select="@*|node()" mode="set-countas"/>
      </xsl:copy>
   </xsl:template>

   <!--Set ch:chunk template for Context: remarks-->
<xsl:template match="remarks" mode="set-ch-chunk" priority="0">
      <xsl:copy>
         <xsl:if test="not(@_gte:did-set-chunk)">
            <xsl:attribute name="_gte:did-set-chunk">yes</xsl:attribute>
         </xsl:if>
         <xsl:apply-templates select="@*|node()" mode="set-ch-chunk"/>
      </xsl:copy>
   </xsl:template>

   <!--Style template for Context: repl-->
<xsl:template name="__style-for_repl.1">
      <xsl:text> .x-repl-1-0 {margin-left: 0pt; margin-right: 0pt; }</xsl:text>
   </xsl:template>

   <!--Template for Context: repl-->
<xsl:template match="repl" priority="0"><!--Emit a nostyle template--><xsl:apply-templates/>
   </xsl:template>

   <!--Gentext template for Context: repl-->
<xsl:template match="repl" mode="expand-gentext" priority="0">
      <xsl:copy>
         <xsl:apply-templates select="@*|node()" mode="expand-gentext"/>
      </xsl:copy>
   </xsl:template>

   <!--Initial pass template for Context: repl-->
<xsl:template match="repl" mode="initial-pass-mode" priority="0">
      <xsl:copy>
         <xsl:call-template name="maybe-set-gte-id"/>
         <xsl:apply-templates select="@*|node()" mode="initial-pass-mode"/>
      </xsl:copy>
   </xsl:template>

   <!--Set count-as pass template for Context: repl-->
<xsl:template match="repl" mode="set-countas" priority="0">
      <xsl:copy>
         <xsl:apply-templates select="@*|node()" mode="set-countas"/>
      </xsl:copy>
   </xsl:template>

   <!--Set ch:chunk template for Context: repl-->
<xsl:template match="repl" mode="set-ch-chunk" priority="0">
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
         <xsl:copy-of xmlns:dmp="http://www.arbortext.com/namespace/dmp/dmpmap" select="@dmp:*"/>
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

   <!--Style template for Context: title-page/soa[@size='med']-->
<xsl:template name="__style-for_soa.3tie-oa271">
      <xsl:text> .x-soa-1-0 {margin-left: 0pt; margin-right: 0pt; text-indent: 0pt; text-align: center; }</xsl:text>
   </xsl:template>

   <!--Template for Context: title-page/soa[@size='med']-->
<xsl:template match="title-page/soa[@size='med']" priority="2">
      <div><!--Emit class values to reflect conditions--><xsl:attribute name="class">
            <xsl:text> x-soa-1-0</xsl:text>
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
                  <xsl:copy-of xmlns:dmp="http://www.arbortext.com/namespace/dmp/dmpmap" select="@dmp:*"/>
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
   </xsl:template>

   <!--Gentext template for Context: title-page/soa[@size='med']-->
<xsl:template match="title-page/soa[@size='med']" mode="expand-gentext" priority="2">
      <xsl:copy>
         <xsl:apply-templates select="@*|node()" mode="expand-gentext"/>
      </xsl:copy>
   </xsl:template>

   <!--Initial pass template for Context: title-page/soa[@size='med']-->
<xsl:template match="title-page/soa[@size='med']" mode="initial-pass-mode" priority="2">
      <xsl:copy>
         <xsl:call-template name="maybe-set-gte-id"/>
         <xsl:apply-templates select="@*|node()" mode="initial-pass-mode"/>
      </xsl:copy>
   </xsl:template>

   <!--Set count-as pass template for Context: title-page/soa[@size='med']-->
<xsl:template match="title-page/soa[@size='med']" mode="set-countas" priority="2">
      <xsl:copy>
         <xsl:apply-templates select="@*|node()" mode="set-countas"/>
      </xsl:copy>
   </xsl:template>

   <!--Set ch:chunk template for Context: title-page/soa[@size='med']-->
<xsl:template match="title-page/soa[@size='med']" mode="set-ch-chunk" priority="2">
      <xsl:copy>
         <xsl:if test="not(@_gte:did-set-chunk)">
            <xsl:attribute name="_gte:did-set-chunk">yes</xsl:attribute>
         </xsl:if>
         <xsl:apply-templates select="@*|node()" mode="set-ch-chunk"/>
      </xsl:copy>
   </xsl:template>

   <!--Style template for Context: soa[@size='med']-->
<xsl:template name="__style-for_soa.3sooa162">
      <xsl:text> .x-soa-2-0 {margin-left: 0pt; margin-right: 0pt; text-indent: 0pt; }</xsl:text>
   </xsl:template>

   <!--Template for Context: soa[@size='med']-->
<xsl:template match="soa[@size='med']" priority="1">
      <div><!--Emit class values to reflect conditions--><xsl:attribute name="class">
            <xsl:text> x-soa-2-0</xsl:text>
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
                  <xsl:copy-of xmlns:dmp="http://www.arbortext.com/namespace/dmp/dmpmap" select="@dmp:*"/>
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
   </xsl:template>

   <!--Gentext template for Context: soa[@size='med']-->
<xsl:template match="soa[@size='med']" mode="expand-gentext" priority="1">
      <xsl:copy>
         <xsl:apply-templates select="@*|node()" mode="expand-gentext"/>
      </xsl:copy>
   </xsl:template>

   <!--Initial pass template for Context: soa[@size='med']-->
<xsl:template match="soa[@size='med']" mode="initial-pass-mode" priority="1">
      <xsl:copy>
         <xsl:call-template name="maybe-set-gte-id"/>
         <xsl:apply-templates select="@*|node()" mode="initial-pass-mode"/>
      </xsl:copy>
   </xsl:template>

   <!--Set count-as pass template for Context: soa[@size='med']-->
<xsl:template match="soa[@size='med']" mode="set-countas" priority="1">
      <xsl:copy>
         <xsl:apply-templates select="@*|node()" mode="set-countas"/>
      </xsl:copy>
   </xsl:template>

   <!--Set ch:chunk template for Context: soa[@size='med']-->
<xsl:template match="soa[@size='med']" mode="set-ch-chunk" priority="1">
      <xsl:copy>
         <xsl:if test="not(@_gte:did-set-chunk)">
            <xsl:attribute name="_gte:did-set-chunk">yes</xsl:attribute>
         </xsl:if>
         <xsl:apply-templates select="@*|node()" mode="set-ch-chunk"/>
      </xsl:copy>
   </xsl:template>

   <!--Style template for Context: soa-->
<xsl:template name="__style-for_soa.3sooa33">
      <xsl:text> .x-soa-3-0 {margin-left: 0pt; margin-right: 0pt; text-indent: 0pt; }</xsl:text>
   </xsl:template>

   <!--Template for Context: soa-->
<xsl:template match="soa" priority="0">
      <xsl:param name="hidden" select="'yes'"/>
      <xsl:if test="$hidden='no'">
         <div><!--Emit class values to reflect conditions--><xsl:attribute name="class">
               <xsl:text> x-soa-3-0</xsl:text>
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

   <!--Gentext template for Context: soa-->
<xsl:template match="soa" mode="expand-gentext" priority="0">
      <xsl:copy>
         <xsl:apply-templates select="@*|node()" mode="expand-gentext"/>
      </xsl:copy>
   </xsl:template>

   <!--Initial pass template for Context: soa-->
<xsl:template match="soa" mode="initial-pass-mode" priority="0">
      <xsl:copy>
         <xsl:call-template name="maybe-set-gte-id"/>
         <xsl:apply-templates select="@*|node()" mode="initial-pass-mode"/>
      </xsl:copy>
   </xsl:template>

   <!--Set count-as pass template for Context: soa-->
<xsl:template match="soa" mode="set-countas" priority="0">
      <xsl:copy>
         <xsl:apply-templates select="@*|node()" mode="set-countas"/>
      </xsl:copy>
   </xsl:template>

   <!--Set ch:chunk template for Context: soa-->
<xsl:template match="soa" mode="set-ch-chunk" priority="0">
      <xsl:copy>
         <xsl:if test="not(@_gte:did-set-chunk)">
            <xsl:attribute name="_gte:did-set-chunk">yes</xsl:attribute>
         </xsl:if>
         <xsl:apply-templates select="@*|node()" mode="set-ch-chunk"/>
      </xsl:copy>
   </xsl:template>

   <!--Collect footnote template for Context: soa-->
<xsl:template match="soa" mode="styler-collect-footnotes" priority="0">
      <xsl:apply-templates select="_sfe:BeforeOrAfterText/*" mode="styler-collect-footnotes"/>
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
         <xsl:copy-of xmlns:dmp="http://www.arbortext.com/namespace/dmp/dmpmap" select="@dmp:*"/>
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

   <!--Style template for Context: spec-assem-->
<xsl:template name="__style-for_spec-assem.1">
      <xsl:text> .x-spec-assem-1-0 {margin-left: 0pt; margin-right: 0pt; }</xsl:text>
   </xsl:template>

   <!--Template for Context: spec-assem-->
<xsl:template match="spec-assem" priority="0"><!--Emit a nostyle template--><xsl:apply-templates/>
   </xsl:template>

   <!--Gentext template for Context: spec-assem-->
<xsl:template match="spec-assem" mode="expand-gentext" priority="0">
      <xsl:copy>
         <xsl:apply-templates select="@*|node()" mode="expand-gentext"/>
      </xsl:copy>
   </xsl:template>

   <!--Initial pass template for Context: spec-assem-->
<xsl:template match="spec-assem" mode="initial-pass-mode" priority="0">
      <xsl:copy>
         <xsl:call-template name="maybe-set-gte-id"/>
         <xsl:apply-templates select="@*|node()" mode="initial-pass-mode"/>
      </xsl:copy>
   </xsl:template>

   <!--Set count-as pass template for Context: spec-assem-->
<xsl:template match="spec-assem" mode="set-countas" priority="0">
      <xsl:copy>
         <xsl:apply-templates select="@*|node()" mode="set-countas"/>
      </xsl:copy>
   </xsl:template>

   <!--Set ch:chunk template for Context: spec-assem-->
<xsl:template match="spec-assem" mode="set-ch-chunk" priority="0">
      <xsl:copy>
         <xsl:if test="not(@_gte:did-set-chunk)">
            <xsl:attribute name="_gte:did-set-chunk">yes</xsl:attribute>
         </xsl:if>
         <xsl:apply-templates select="@*|node()" mode="set-ch-chunk"/>
      </xsl:copy>
   </xsl:template>

   <!--Style template for Context: spec-tool-->
<xsl:template name="__style-for_spec-tool.1">
      <xsl:text> .x-spec-tool-1-0 {margin-left: 0pt; margin-right: 0pt; }</xsl:text>
   </xsl:template>

   <!--Template for Context: spec-tool-->
<xsl:template match="spec-tool" priority="0"><!--Emit a nostyle template--><xsl:apply-templates/>
   </xsl:template>

   <!--Gentext template for Context: spec-tool-->
<xsl:template match="spec-tool" mode="expand-gentext" priority="0">
      <xsl:copy>
         <xsl:apply-templates select="@*|node()" mode="expand-gentext"/>
      </xsl:copy>
   </xsl:template>

   <!--Initial pass template for Context: spec-tool-->
<xsl:template match="spec-tool" mode="initial-pass-mode" priority="0">
      <xsl:copy>
         <xsl:call-template name="maybe-set-gte-id"/>
         <xsl:apply-templates select="@*|node()" mode="initial-pass-mode"/>
      </xsl:copy>
   </xsl:template>

   <!--Set count-as pass template for Context: spec-tool-->
<xsl:template match="spec-tool" mode="set-countas" priority="0">
      <xsl:copy>
         <xsl:apply-templates select="@*|node()" mode="set-countas"/>
      </xsl:copy>
   </xsl:template>

   <!--Set ch:chunk template for Context: spec-tool-->
<xsl:template match="spec-tool" mode="set-ch-chunk" priority="0">
      <xsl:copy>
         <xsl:if test="not(@_gte:did-set-chunk)">
            <xsl:attribute name="_gte:did-set-chunk">yes</xsl:attribute>
         </xsl:if>
         <xsl:apply-templates select="@*|node()" mode="set-ch-chunk"/>
      </xsl:copy>
   </xsl:template>

   <!--Style template for Context: special-tools-->
<xsl:template name="__style-for_special-tools.1">
      <xsl:text> .x-special-tools-1-0 {margin-left: 0pt; margin-right: 0pt; text-indent: 0pt; } .x-special-tools-1-1 {}</xsl:text>
   </xsl:template>

   <!--Template for Context: special-tools-->
<xsl:template match="special-tools" priority="0">
      <xsl:variable name="foClass">formalBlock</xsl:variable>
      <xsl:variable name="blockness">block</xsl:variable>
      <xsl:variable name="startnew"/>
      <xsl:variable name="newpageset">#noChange</xsl:variable>
      <div><!--Emit class values to reflect conditions--><xsl:attribute name="class">
            <xsl:text> x-special-tools-1-0</xsl:text>
            <xsl:if test="@empty and string(@empty)='YES'"> x-special-tools-1-1</xsl:if>
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

   <!--Gentext template for Context: special-tools-->
<xsl:template match="special-tools" mode="expand-gentext" priority="0">
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
            <xsl:when test="@empty and string(@empty)='YES'"><!--AddBefore Condition #1--><xsl:if test="not(@_gte:Gentext-Expanded)">
                  <_gte:Must-Expand-Gentext/>
                  <_sfe:BeforeOrAfterText>
                     <_ufe:spectools-title/>
                     <_ufe:not-applicable/>
                  </_sfe:BeforeOrAfterText>
               </xsl:if>
            </xsl:when>
            <xsl:otherwise>
               <xsl:if test="not(@_gte:Gentext-Expanded)">
                  <_gte:Must-Expand-Gentext/>
                  <_sfe:BeforeOrAfterText>
                     <_ufe:spectools-title/>
                  </_sfe:BeforeOrAfterText>
               </xsl:if>
            </xsl:otherwise>
         </xsl:choose>
         <xsl:apply-templates select="* | text() | processing-instruction()" mode="expand-gentext"/>
      </xsl:copy>
   </xsl:template>

   <!--Initial pass template for Context: special-tools-->
<xsl:template match="special-tools" mode="initial-pass-mode" priority="0">
      <xsl:copy>
         <xsl:call-template name="maybe-set-gte-id"/>
         <xsl:apply-templates select="@*|node()" mode="initial-pass-mode"/>
      </xsl:copy>
   </xsl:template>

   <!--Set count-as pass template for Context: special-tools-->
<xsl:template match="special-tools" mode="set-countas" priority="0">
      <xsl:copy>
         <xsl:apply-templates select="@*|node()" mode="set-countas"/>
      </xsl:copy>
   </xsl:template>

   <!--Set ch:chunk template for Context: special-tools-->
<xsl:template match="special-tools" mode="set-ch-chunk" priority="0">
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

   <!--Style template for Context: spring-->
<xsl:template name="__style-for_spring.1">
      <xsl:text> .x-spring-1-0 {margin-left: 0pt; margin-right: 0pt; }</xsl:text>
   </xsl:template>

   <!--Template for Context: spring-->
<xsl:template match="spring" priority="0"><!--Emit a nostyle template--><xsl:apply-templates/>
   </xsl:template>

   <!--Gentext template for Context: spring-->
<xsl:template match="spring" mode="expand-gentext" priority="0">
      <xsl:copy>
         <xsl:apply-templates select="@*|node()" mode="expand-gentext"/>
      </xsl:copy>
   </xsl:template>

   <!--Initial pass template for Context: spring-->
<xsl:template match="spring" mode="initial-pass-mode" priority="0">
      <xsl:copy>
         <xsl:call-template name="maybe-set-gte-id"/>
         <xsl:apply-templates select="@*|node()" mode="initial-pass-mode"/>
      </xsl:copy>
   </xsl:template>

   <!--Set count-as pass template for Context: spring-->
<xsl:template match="spring" mode="set-countas" priority="0">
      <xsl:copy>
         <xsl:apply-templates select="@*|node()" mode="set-countas"/>
      </xsl:copy>
   </xsl:template>

   <!--Set ch:chunk template for Context: spring-->
<xsl:template match="spring" mode="set-ch-chunk" priority="0">
      <xsl:copy>
         <xsl:if test="not(@_gte:did-set-chunk)">
            <xsl:attribute name="_gte:did-set-chunk">yes</xsl:attribute>
         </xsl:if>
         <xsl:apply-templates select="@*|node()" mode="set-ch-chunk"/>
      </xsl:copy>
   </xsl:template>

   <!--Style template for Context: spring-pressure-->
<xsl:template name="__style-for_spring-pressure.1">
      <xsl:text> .x-spring-pressure-1-0 {margin-left: 0pt; margin-right: 0pt; }</xsl:text>
   </xsl:template>

   <!--Template for Context: spring-pressure-->
<xsl:template match="spring-pressure" priority="0"><!--Emit a nostyle template--><xsl:apply-templates/>
   </xsl:template>

   <!--Gentext template for Context: spring-pressure-->
<xsl:template match="spring-pressure" mode="expand-gentext" priority="0">
      <xsl:copy>
         <xsl:apply-templates select="@*|node()" mode="expand-gentext"/>
      </xsl:copy>
   </xsl:template>

   <!--Initial pass template for Context: spring-pressure-->
<xsl:template match="spring-pressure" mode="initial-pass-mode" priority="0">
      <xsl:copy>
         <xsl:call-template name="maybe-set-gte-id"/>
         <xsl:apply-templates select="@*|node()" mode="initial-pass-mode"/>
      </xsl:copy>
   </xsl:template>

   <!--Set count-as pass template for Context: spring-pressure-->
<xsl:template match="spring-pressure" mode="set-countas" priority="0">
      <xsl:copy>
         <xsl:apply-templates select="@*|node()" mode="set-countas"/>
      </xsl:copy>
   </xsl:template>

   <!--Set ch:chunk template for Context: spring-pressure-->
<xsl:template match="spring-pressure" mode="set-ch-chunk" priority="0">
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
         <xsl:copy-of xmlns:dmp="http://www.arbortext.com/namespace/dmp/dmpmap" select="@dmp:*"/>
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

   <!--Style template for Context: tool-list-->
<xsl:template name="__style-for_tool-list.1">
      <xsl:text> .x-tool-list-1-0 {margin-left: 0pt; margin-right: 0pt; }</xsl:text>
   </xsl:template>

   <!--Template for Context: tool-list-->
<xsl:template match="tool-list" priority="0"><!--Emit a nostyle template--><xsl:apply-templates/>
   </xsl:template>

   <!--Gentext template for Context: tool-list-->
<xsl:template match="tool-list" mode="expand-gentext" priority="0">
      <xsl:copy>
         <xsl:apply-templates select="@*|node()" mode="expand-gentext"/>
      </xsl:copy>
   </xsl:template>

   <!--Initial pass template for Context: tool-list-->
<xsl:template match="tool-list" mode="initial-pass-mode" priority="0">
      <xsl:copy>
         <xsl:call-template name="maybe-set-gte-id"/>
         <xsl:apply-templates select="@*|node()" mode="initial-pass-mode"/>
      </xsl:copy>
   </xsl:template>

   <!--Set count-as pass template for Context: tool-list-->
<xsl:template match="tool-list" mode="set-countas" priority="0">
      <xsl:copy>
         <xsl:apply-templates select="@*|node()" mode="set-countas"/>
      </xsl:copy>
   </xsl:template>

   <!--Set ch:chunk template for Context: tool-list-->
<xsl:template match="tool-list" mode="set-ch-chunk" priority="0">
      <xsl:copy>
         <xsl:if test="not(@_gte:did-set-chunk)">
            <xsl:attribute name="_gte:did-set-chunk">yes</xsl:attribute>
         </xsl:if>
         <xsl:apply-templates select="@*|node()" mode="set-ch-chunk"/>
      </xsl:copy>
   </xsl:template>

   <!--Style template for Context: torque-and-stretch-->
<xsl:template name="__style-for_torque-and-stretch.1">
      <xsl:text> .x-torque-and-stretch-1-0 {margin-left: 0pt; margin-right: 0pt; text-indent: 0pt; font-size: 9pt; }</xsl:text>
   </xsl:template>

   <!--Template for Context: torque-and-stretch-->
<xsl:template match="torque-and-stretch" priority="0">
      <div><!--Emit class values to reflect conditions--><xsl:attribute name="class">
            <xsl:text> x-torque-and-stretch-1-0</xsl:text>
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
         <xsl:call-template name="maybe-set-id">
            <xsl:with-param name="only-if-id-attr" select="'no'"/>
            <xsl:with-param name="generated-id-prefix" select="'styler-id'"/>
         </xsl:call-template>
         <!--Process this element's content--><xsl:apply-templates/>
      </div>
   </xsl:template>

   <!--Gentext template for Context: torque-and-stretch-->
<xsl:template match="torque-and-stretch" mode="expand-gentext" priority="0">
      <xsl:copy>
         <xsl:apply-templates select="@*|node()" mode="expand-gentext"/>
      </xsl:copy>
   </xsl:template>

   <!--Initial pass template for Context: torque-and-stretch-->
<xsl:template match="torque-and-stretch" mode="initial-pass-mode" priority="0">
      <xsl:copy>
         <xsl:call-template name="maybe-set-gte-id"/>
         <xsl:apply-templates select="@*|node()" mode="initial-pass-mode"/>
      </xsl:copy>
   </xsl:template>

   <!--Set count-as pass template for Context: torque-and-stretch-->
<xsl:template match="torque-and-stretch" mode="set-countas" priority="0">
      <xsl:copy>
         <xsl:apply-templates select="@*|node()" mode="set-countas"/>
      </xsl:copy>
   </xsl:template>

   <!--Set ch:chunk template for Context: torque-and-stretch-->
<xsl:template match="torque-and-stretch" mode="set-ch-chunk" priority="0">
      <xsl:copy>
         <xsl:if test="not(@_gte:did-set-chunk)">
            <xsl:attribute name="_gte:did-set-chunk">yes</xsl:attribute>
         </xsl:if>
         <xsl:apply-templates select="@*|node()" mode="set-ch-chunk"/>
      </xsl:copy>
   </xsl:template>

   <!--Style template for Context: trdata-->
<xsl:template name="__style-for_trdata.1">
      <xsl:text> .x-trdata-1-0 {margin-left: 0pt; margin-right: 0pt; }</xsl:text>
   </xsl:template>

   <!--Template for Context: trdata-->
<xsl:template match="trdata" priority="0"><!--Emit a nostyle template--><xsl:apply-templates/>
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
      <xsl:text> .x-trlist-1-0 {margin-left: 0pt; margin-right: 0pt; }</xsl:text>
   </xsl:template>

   <!--Template for Context: trlist-->
<xsl:template match="trlist" priority="0"><!--Emit a nostyle template--><xsl:apply-templates/>
   </xsl:template>

   <!--Gentext template for Context: trlist-->
<xsl:template match="trlist" mode="expand-gentext" priority="0">
      <xsl:copy>
         <xsl:apply-templates select="@*|node()" mode="expand-gentext"/>
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
<xsl:template match="trloc" priority="0"><!--Emit a nostyle template--><xsl:apply-templates/>
   </xsl:template>

   <!--Gentext template for Context: trloc-->
<xsl:template match="trloc" mode="expand-gentext" priority="0">
      <xsl:copy>
         <xsl:apply-templates select="@*|node()" mode="expand-gentext"/>
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
<xsl:template match="trnbr" priority="0"><!--Emit a nostyle template--><xsl:apply-templates/>
   </xsl:template>

   <!--Gentext template for Context: trnbr-->
<xsl:template match="trnbr" mode="expand-gentext" priority="0">
      <xsl:copy>
         <xsl:apply-templates select="@*|node()" mode="expand-gentext"/>
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
<xsl:template match="trstatus" priority="0"><!--Emit a nostyle template--><xsl:apply-templates/>
   </xsl:template>

   <!--Gentext template for Context: trstatus-->
<xsl:template match="trstatus" mode="expand-gentext" priority="0">
      <xsl:copy>
         <xsl:apply-templates select="@*|node()" mode="expand-gentext"/>
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

   <!--There is no mapping for PageTypes (an unexpected element).-->

<!--There is no mapping for PageRegions (an unexpected element).-->

<!--There is no mapping for GeneratedContents (an unexpected element).-->

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
 .x-annot-1-0 {margin-left: 0pt; margin-right: 0pt; text-indent: 0pt; }
&#xD;

&#xD;
 .x-annot-2-0 {margin-left: 0pt; margin-right: 0pt; text-indent: 0pt; }
&#xD;

&#xD;
 .x-at-length-1-0 {margin-left: 0pt; margin-right: 0pt; }
&#xD;

&#xD;
 .x-build-spec-1-0 {margin-left: 0pt; margin-right: 0pt; text-indent: 0pt; }
&#xD;

&#xD;
 .x-consumables-1-0 {margin-left: 0pt; margin-right: 0pt; text-indent: 0pt; }
&#xD;
 .x-consumables-1-1 {}
&#xD;

&#xD;
 .x-fandc-proc-1-0 {margin-left: 0pt; margin-right: 0pt; }
&#xD;

&#xD;
 .x-fits-1-0 {margin-left: 0pt; margin-right: 0pt; text-indent: 0pt; }
&#xD;

&#xD;
 .x-fits-and-clears-1-0 {margin-left: 0pt; margin-right: 0pt; text-indent: 0pt; }
&#xD;

&#xD;
 .x-fix-equip-list-1-0 {margin-left: 0pt; margin-right: 0pt; }
&#xD;

&#xD;
 .x-fixtures-and-equipment-1-0 {margin-left: 0pt; margin-right: 0pt; text-indent: 0pt; }
&#xD;
 .x-fixtures-and-equipment-1-1 {}
&#xD;

&#xD;
 .x-general-1-0 {margin-left: 0pt; margin-right: 0pt; text-indent: 0pt; }
&#xD;

&#xD;
 .x-ifr-1-0 {margin-left: 0pt; margin-right: 0pt; }
&#xD;

&#xD;
 .x-imp-1-0 {margin-left: 0pt; margin-right: 0pt; }
&#xD;

&#xD;
 .x-atidlm-inclusion-1-0 {margin-left: 0pt; margin-right: 0pt; text-indent: 0pt; }
&#xD;

&#xD;
 .x-limits-1-0 {margin-left: 0pt; margin-right: 0pt; }
&#xD;

&#xD;
 .x-atidlm-linkcontent-1-0 {margin-left: 0pt; margin-right: 0pt; text-indent: 0pt; }
&#xD;

&#xD;
 .x-mating-part-1-0 {margin-left: 0pt; margin-right: 0pt; }
&#xD;

&#xD;
 .x-max-1-0 {margin-left: 0pt; margin-right: 0pt; }
&#xD;

&#xD;
 .x-met-1-0 {margin-left: 0pt; margin-right: 0pt; }
&#xD;

&#xD;
 .x-atidlm-metadata-1-0 {margin-left: 0pt; margin-right: 0pt; text-indent: 0pt; }
&#xD;

&#xD;
 .x-min-1-0 {margin-left: 0pt; margin-right: 0pt; }
&#xD;

&#xD;
 .x-mm-fits-1-0 {margin-left: 0pt; margin-right: 0pt; text-indent: 0pt; }
&#xD;

&#xD;
 .x-nomen-1-0 {margin-left: 0pt; margin-right: 0pt; }
&#xD;

&#xD;
 .x-pageblock-front-1-0 {margin-left: 0pt; margin-right: 0pt; text-indent: 0pt; }
&#xD;

&#xD;
 .x-pageblock-title-1-0 {margin-left: 0pt; margin-right: 0pt; text-indent: 0pt; font-weight: bold; text-decoration: underline ; text-transform: uppercase; margin-left: 0pt; text-indent: 0pt; text-align: center; }
&#xD;

&#xD;
 .x-pageblock-title-2-0 {margin-left: 0pt; margin-right: 0pt; text-indent: 0pt; margin-left: 0pt; text-indent: 0pt; }
&#xD;

&#xD;
 .x-pageblock-title-3-0 {margin-left: 0pt; margin-right: 0pt; text-indent: 0pt; font-weight: bold; font-size: 14pt; }
&#xD;

&#xD;
 .x-part-1-0 {margin-left: 0pt; margin-right: 0pt; }
&#xD;

&#xD;
 .x-q-and-st-1-0 {margin-left: 0pt; margin-right: 0pt; }
&#xD;

&#xD;
 .x-ref-nbr-1-0 {margin-left: 0pt; margin-right: 0pt; }
&#xD;

&#xD;
 .x-remarks-1-0 {margin-left: 0pt; margin-right: 0pt; }
&#xD;

&#xD;
 .x-repl-1-0 {margin-left: 0pt; margin-right: 0pt; }
&#xD;

&#xD;
 .x-atidlm-resourcepair-1-0 {margin-left: 0pt; margin-right: 0pt; text-indent: 0pt; }
&#xD;

&#xD;
 .x-soa-1-0 {margin-left: 0pt; margin-right: 0pt; text-indent: 0pt; text-align: center; }
&#xD;

&#xD;
 .x-soa-2-0 {margin-left: 0pt; margin-right: 0pt; text-indent: 0pt; }
&#xD;

&#xD;
 .x-soa-3-0 {margin-left: 0pt; margin-right: 0pt; text-indent: 0pt; }
&#xD;

&#xD;
 .x-atidlm-source-1-0 {margin-left: 0pt; margin-right: 0pt; text-indent: 0pt; }
&#xD;

&#xD;
 .x-spec-assem-1-0 {margin-left: 0pt; margin-right: 0pt; }
&#xD;

&#xD;
 .x-spec-tool-1-0 {margin-left: 0pt; margin-right: 0pt; }
&#xD;

&#xD;
 .x-special-tools-1-0 {margin-left: 0pt; margin-right: 0pt; text-indent: 0pt; }
&#xD;
 .x-special-tools-1-1 {}
&#xD;

&#xD;
 .x-spring-1-0 {margin-left: 0pt; margin-right: 0pt; }
&#xD;

&#xD;
 .x-spring-pressure-1-0 {margin-left: 0pt; margin-right: 0pt; }
&#xD;

&#xD;
 .x-atidlm-target-1-0 {margin-left: 0pt; margin-right: 0pt; text-indent: 0pt; }
&#xD;

&#xD;
 .x-tool-list-1-0 {margin-left: 0pt; margin-right: 0pt; }
&#xD;

&#xD;
 .x-torque-and-stretch-1-0 {margin-left: 0pt; margin-right: 0pt; text-indent: 0pt; font-size: 9pt; }
&#xD;

&#xD;
 .x-trdata-1-0 {margin-left: 0pt; margin-right: 0pt; }
&#xD;

&#xD;
 .x-trlist-1-0 {margin-left: 0pt; margin-right: 0pt; }
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
   <xsl:include href="file:///C:/Program%20Files/PTC/Arbortext%20Editor//lib/xsl/html/tbls.xsl"/>

   <!-- Include code to handle HTML tables (which includes ATI PI handling)-->
<xsl:template name="htmltbl-tr"/>
   <xsl:template name="htmltbl-td"/>
   <xsl:template name="htmltbl-th"/>
   <xsl:template name="htmltbl-caption"/>
   <xsl:include href="file:///C:/Program%20Files/PTC/Arbortext%20Editor//lib/xsl/html/html-tbls.xsl"/>
</xsl:stylesheet>
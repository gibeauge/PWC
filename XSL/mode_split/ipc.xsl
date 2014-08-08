<?xml version="1.0" encoding="UTF-8"?>

<!DOCTYPE xsl:stylesheet [
    <!ENTITY % entities_commun SYSTEM "xsl_entities_commun.ent">
    %entities_commun;
]>
<xsl:stylesheet xmlns:simg="java:net.sf.docbook.saxon.ImageIntrinsics" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:ximg="xaln://com.nwalsh.xalan.ImageIntrinsics" xmlns="http://www.w3.org/1999/xhtml" xmlns:exslt="http://exslt.org/common" xmlns:_acl="java:com.arbortext.epic.Acl" xmlns:msxsl="urn:schemas-microsoft-com:xslt" xmlns:_="http://www.pwc.ca/namespace/doctypes/emipc" xmlns:_dtd="http://www.arbortext.com/namespace/Styler/UserElements" xmlns:atidlm="http://www.arbortext.com/namespace/atidlm" xmlns:_2="http://www.pwc.ca/namespace/doctypes/jmtosmigrate" xmlns:ch="http://www.arbortext.com/namespace/chunker" xmlns:saxon="http://saxon.sf.net/" xmlns:_5="http://www.pwc.ca/namespace/doctypes/ipc" xmlns:_gte="http://www.arbortext.com/namespace/Styler/GeneratedTextElements" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:_sfe="http://www.arbortext.com/namespace/Styler/StylerFormattingElements" xmlns:_js="java:com.arbortext.epic.internal.js.JavaScript" xmlns:_3="http://www.pwc.ca/namespace/doctypes/migrate" xmlns:_ufe="http://www.arbortext.com/namespace/Styler/UserFormattingElements" version="1.0" exclude-result-prefixes="_ atidlm xml _2 ch saxon _5 xsi _js _3 #default exslt msxsl _dtd _ufe _sfe _gte simg ximg _acl">

<xsl:include href="ipc_expand-gentext.xsl"/>
<xsl:include href="ipc_set-countas.xsl"/>
<xsl:include href="ipc_toc-mode-Table_of_Contents.xsl"/>
<xsl:include href="ipc_styler_numbering.xsl"/>
<xsl:include href="ipc_styler-LabelAndNumberMarker.xsl"/>
<xsl:include href="ipc_styler-collect-footnotes.xsl"/>

<xsl:output encoding="UTF-8" method="html" omit-xml-declaration="yes" indent="yes"/>

<xsl:variable name="doctype" select="'ipc'"/>

<xsl:include href="base.xsl"/>
<xsl:include href="base_steps_set-countas.xsl"/>
<xsl:include href="base_steps_styler_numbering.xsl"/>
<xsl:include href="process.xsl"/>

<xsl:template name="__style-for_attach-parts.1">
      <xsl:text> .x-attach-parts-1-0 {margin-left: 0pt; margin-right: 0pt; text-indent: 0pt; }</xsl:text>
   </xsl:template>

<xsl:template match="attach-parts" priority="0">
      <div>
         <!--Emit class values to reflect conditions-->
         <xsl:attribute name="class">
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

<xsl:template name="__style-for_bs-group.1">
      <xsl:text> .x-bs-group-1-0 {margin-left: 0pt; margin-right: 0pt; }</xsl:text>
   </xsl:template>

<xsl:template match="bs-group" priority="0">
      <!--Emit a nostyle template-->
      <xsl:apply-templates/>
   </xsl:template>

<xsl:template name="__style-for_build-spec.1">
      <xsl:text> .x-build-spec-1-0 {margin-left: 0pt; margin-right: 0pt; text-indent: 0pt; margin-bottom: 12pt; }</xsl:text>
   </xsl:template>

<xsl:template match="build-spec" priority="0">
      <div>
         <!--Emit class values to reflect conditions-->
         <xsl:attribute name="class">
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
         <!--Process this element's content-->
         <xsl:apply-templates/>
      </div>
   </xsl:template>

<xsl:template name="__style-for_chap.1">
      <xsl:text> .x-chap-1-0 {margin-left: 0pt; margin-right: 0pt; }</xsl:text>
   </xsl:template>

<xsl:template match="chap" priority="0">
      <!--Emit a nostyle template-->
      <xsl:apply-templates/>
   </xsl:template>

<xsl:template match="_ufe:cir-title" priority="0">
  <div ch:title="notoc" class=" x--ufe-cir-title-3-0">
    <xsl:call-template name="t-base-div-title"/>
  </div>
</xsl:template>

<xsl:template name="__style-for_dimen.1">
      <xsl:text> .x-dimen-1-0 {margin-left: 0pt; margin-right: 0pt; }</xsl:text>
   </xsl:template>

<xsl:template match="dimen" priority="0">
      <span>
         <!--Emit class values to reflect conditions-->
         <xsl:attribute name="class">
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

<xsl:template name="__style-for_eff-bs.1">
      <xsl:text> .x-eff-bs-1-0 {margin-left: 0pt; margin-right: 0pt; }</xsl:text>
   </xsl:template>

<xsl:template match="eff-bs" priority="0">
      <span>
         <!--Emit class values to reflect conditions-->
         <xsl:attribute name="class">
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

<xsl:template name="__style-for_eff-code.1">
      <xsl:text> .x-eff-code-1-0 {margin-left: 0pt; margin-right: 0pt; text-indent: 0pt; } /* gdb 12-10-12: removed all source edits making it a hyperlink */</xsl:text>
   </xsl:template>

<xsl:template match="eff-code" priority="0">
      <div>
         <!--Emit class values to reflect conditions-->
         <xsl:attribute name="class">
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

<xsl:template name="__style-for_eff-letter.1">
      <xsl:text> .x-eff-letter-1-0 {margin-left: 0pt; margin-right: 0pt; }</xsl:text>
   </xsl:template>

<xsl:template match="eff-letter" priority="0">
      <span>
         <!--Emit class values to reflect conditions-->
         <xsl:attribute name="class">
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

<xsl:template name="__style-for_eff-model.1">
      <xsl:text> .x-eff-model-1-0 {margin-left: 0pt; margin-right: 0pt; }</xsl:text>
   </xsl:template>

<xsl:template match="eff-model" priority="0">
      <span>
         <!--Emit class values to reflect conditions-->
         <xsl:attribute name="class">
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

<xsl:template match="_ufe:eipc-title" priority="0">
  <div ch:title="notoc" class=" x--ufe-eipc-title-3-0">
    <xsl:call-template name="t-base-div-title"/>
  </div>
</xsl:template>

<xsl:template match="_ufe:em-title" priority="0">
  <div ch:title="notoc" class=" x--ufe-em-title-3-0">
    <xsl:call-template name="t-base-div-title"/>
  </div>
</xsl:template>

<xsl:template name="__style-for_fignote.1">
      <xsl:text> .x-fignote-1-0 {margin-left: 0pt; margin-right: 0pt; text-indent: 0pt; }</xsl:text>
   </xsl:template>

<xsl:template match="fignote" priority="0">
      <div>
         <!--Emit class values to reflect conditions-->
         <xsl:attribute name="class">
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

<xsl:template name="__style-for_figure.2firere271">
      <xsl:text> .x-figure-1-0
{margin-left: 0pt; margin-right: 0pt; text-indent: 0pt; margin-top:
8pt; }</xsl:text>
   </xsl:template>

<xsl:template match="figure[descendant::graphic]" priority="1">
      <div style="display:none;">
         <!--Emit class values to reflect conditions-->
         <xsl:attribute name="class">
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
         <xsl:attribute name="id">
            <xsl:text>styler-id</xsl:text>
            <xsl:apply-templates mode="set-id" select="."/>
         </xsl:attribute>
         <!--Process this element's content-->
         <xsl:apply-templates> </xsl:apply-templates>
      </div>
      <a>
         <xsl:attribute name="href">
            <xsl:text>#styler-id</xsl:text>
            <xsl:apply-templates mode="set-id" select="."> </xsl:apply-templates>
         </xsl:attribute>
         <xsl:attribute name="onClick">
            <xsl:text>displayGraphics('</xsl:text>
            <xsl:text>styler-id</xsl:text>
            <xsl:apply-templates mode="set-id" select="."> </xsl:apply-templates>
            <xsl:text>');</xsl:text>
         </xsl:attribute>
         <img alt="Graphic">
            <xsl:attribute name="src">
               <xsl:value-of select="descendant::graphic[@size='thm']/@negnumber"/>
            </xsl:attribute>
         </img>
      </a>
   </xsl:template>

<xsl:template name="__style-for_figure.2firere62">
      <xsl:text> .x-figure-2-0 {margin-left: 0pt; margin-right: 0pt; text-indent: 0pt; margin-top: 8pt; }</xsl:text>
   </xsl:template>

<xsl:template match="figure" priority="0">
      <div>
         <!--Emit class values to reflect conditions-->
         <xsl:attribute name="class">
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
         <!--Process this element's content-->
         <xsl:apply-templates/>
      </div>
   </xsl:template>

<xsl:template match="_ufe:glossary-title" priority="0">
  <div ch:title="notoc" class=" x--ufe-glossary-title-4-0">
    <xsl:call-template name="t-base-div-title"/>
  </div>
</xsl:template>

<xsl:template name="__style-for_graphic.1">
      <xsl:text> .x-graphic-1-0 {margin-left:
0pt; margin-right: 0pt; text-indent: 0pt; margin-top: 8pt; } .x-graphic-1-1
{border-bottom: 2px solid #000000;} .x-graphic-1-2 {}</xsl:text>
   </xsl:template>

<xsl:template match="graphic" priority="0">
      <xsl:param name="hidden" select="'yes'"/>
      <!--Dynamically determine the fo-class-->
      <xsl:variable name="foClass">
         <xsl:choose>
            <xsl:when test="not(@size) or (@size and string(@size)!='big')">hidden</xsl:when>
            <xsl:when test="count(following-sibling::graphic[@size='big']) &gt; 0">graphic-block</xsl:when>
            <xsl:otherwise>graphic-block</xsl:otherwise>
         </xsl:choose>
      </xsl:variable>
      <xsl:variable name="blockness">block</xsl:variable>
      <xsl:variable name="hiddenness">
         <xsl:choose>
            <xsl:when test="not(@size) or (@size and string(@size)!='big')">yes</xsl:when>
            <xsl:when test="count(following-sibling::graphic[@size='big']) &gt; 0">no</xsl:when>
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
            <xsl:when test="true()">
               <!--This is the "otherwise" clause, but there may be no when's-->
               <xsl:value-of select="$foClass"/>
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
      <!--Execute the appropriate code for the dynamically determined fo-class-->
      <xsl:choose>
         <xsl:when test="$fo-class='hidden-block'">
            <xsl:if test="$hidden=no">
               <div>
                  <!--Emit class values to reflect conditions-->
                  <xsl:attribute name="class">
                     <xsl:text> x-graphic-1-0</xsl:text>
                     <xsl:if test="count(following-sibling::graphic[@size='big']) &gt; 0"> x-graphic-1-1</xsl:if>
                     <xsl:if test="not(@size) or (@size and string(@size)!='big')"> x-graphic-1-2</xsl:if>
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
                  <xsl:call-template name="maybe-set-id"> </xsl:call-template>
                  <!--Suppress element contents (but not gentext) unless unhidden-->
                  <xsl:choose>
                     <xsl:when test="$hidden='no'">
                        <xsl:apply-templates> </xsl:apply-templates>
                     </xsl:when>
                     <xsl:otherwise>
                        <xsl:apply-templates select="_sfe:BeforeOrAfterText"/>
                     </xsl:otherwise>
                  </xsl:choose>
               </div>
            </xsl:if>
         </xsl:when>
         <xsl:when test="$fo-class='block'">
            <div>
               <!--Emit class values to reflect conditions-->
               <xsl:attribute name="class">
                  <xsl:text> x-graphic-1-0</xsl:text>
                  <xsl:if test="count(following-sibling::graphic[@size='big']) &gt; 0"> x-graphic-1-1</xsl:if>
                  <xsl:if test="not(@size) or (@size and string(@size)!='big')"> x-graphic-1-2</xsl:if>
               </xsl:attribute>
               <xsl:if test="count(following-sibling::graphic[@size='big']) &gt; 0">
                  <xsl:attribute name="style">margin-bottom: 8pt; border-bottom: 2px solid #000000;</xsl:attribute>
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
               <xsl:call-template name="maybe-set-id"> </xsl:call-template>
               <!--Process this element's content-->
               <xsl:apply-templates> </xsl:apply-templates>
            </div>
         </xsl:when>
         <xsl:when test="$fo-class='graphic-block'">
            <div>
               <!--Emit class values to reflect conditions-->
               <xsl:attribute name="class">
                  <xsl:text> x-graphic-1-0</xsl:text>
                  <xsl:if test="count(following-sibling::graphic[@size='big']) &gt; 0"> x-graphic-1-1</xsl:if>
                  <xsl:if test="not(@size) or (@size and string(@size)!='big')"> x-graphic-1-2</xsl:if>
               </xsl:attribute>
               <xsl:if test="count(following-sibling::graphic[@size='big']) &gt; 0">
                  <xsl:attribute name="style">margin-bottom: 8pt; border-bottom: 2px solid #000000;</xsl:attribute>
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
                  <xsl:when xmlns:ati3d="http://www.arbortext.com/namespace/graphics" test="@ati3d:viewer">
                     <!--this graphic is a 3D graphic-->
                     <xsl:variable name="viewer" select="@ati3d:viewer"/>
                     <xsl:variable name="generated-idval">
                        <xsl:value-of select="concat($viewer,'_')"/>
                        <xsl:apply-templates mode="set-id" select="."> </xsl:apply-templates>
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
                       <xsl:value-of select="$viewer"/><xsl:text>_Insert('</xsl:text><xsl:value-of select="$idval"/><xsl:text>', '</xsl:text><xsl:value-of select="$width"/><xsl:text>', '</xsl:text><xsl:value-of select="$height"/><xsl:text>', '</xsl:text><xsl:value-of select="$annotation"/><xsl:text>', '</xsl:text>     <xsl:call-template name="get-downloaduri"><xsl:with-param name="viewer" select="$viewer"/></xsl:call-template><xsl:text>');</xsl:text>
					   </script>
                     </span>
                  </xsl:when>
                  <xsl:otherwise>
                     <!--this is a "regular" graphic-->
                     <img alt="Graphic">
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
                        <!--Process this element's content-->
                        <xsl:apply-templates> </xsl:apply-templates>
                     </img>
                  </xsl:otherwise>
               </xsl:choose>
               <!--Source edit to add negnum and annot to graphic pop-up window.-->
               <xsl:if test="@annot">
                  <div>
                     <xsl:attribute name="style">margin-bottom: 8pt;</xsl:attribute>
                     <xsl:value-of select="@annot"/>
                  </div>
               </xsl:if>
               <xsl:if test="@negnum">
                  <div>
                     <xsl:attribute name="style">margin-bottom: 8pt;</xsl:attribute>
                     <xsl:value-of select="@negnum"/>
                  </div>
               </xsl:if>
            </div>
         </xsl:when>
      </xsl:choose>
   </xsl:template>

<xsl:template match="_ufe:howtouse-title" priority="0">
  <div ch:title="notoc" class=" x--ufe-howtouse-title-3-0">
    <xsl:call-template name="t-base-div-title"/>
  </div>
</xsl:template>

<xsl:template name="__style-for_imp.1">
      <xsl:text> .x-imp-1-0 {margin-left: 0pt; margin-right: 0pt; }</xsl:text>
   </xsl:template>

<xsl:template match="imp" priority="0">
      <span>
         <!--Emit class values to reflect conditions-->
         <xsl:attribute name="class">
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

<xsl:template name="__style-for_atidlm-inclusion.1">
      <xsl:text> .x-atidlm-inclusion-1-0 {margin-left: 0pt; margin-right: 0pt; text-indent: 0pt; }</xsl:text>
   </xsl:template>

<xsl:template match="atidlm:inclusion" priority="0">
      <span>
         <!--Emit class values to reflect conditions-->
         <xsl:attribute name="class">
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
         <!--Process this element's content-->
         <xsl:apply-templates/>
      </span>
   </xsl:template>

<xsl:template name="__style-for_inter.1">
      <xsl:text> .x-inter-1-0 {margin-left: 0pt; margin-right: 0pt; text-indent: 0pt; } .x-inter-1-1 {} .x-inter-1-2 {} .x-inter-1-3 {} .x-inter-1-4 {} .x-inter-1-5 {} .x-inter-1-6 {} .x-inter-1-7 {}</xsl:text>
   </xsl:template>

<xsl:template match="inter" priority="0">
      <xsl:variable name="foClass">block</xsl:variable>
      <xsl:variable name="blockness">block</xsl:variable>
      <xsl:variable name="startnew"/>
      <xsl:variable name="newpageset">#noChange</xsl:variable>
      <div>
         <!--Emit class values to reflect conditions-->
         <xsl:attribute name="class">
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
         <xsl:call-template name="maybe-set-id"/>
         <!--Process this element's content-->
         <xsl:apply-templates/>
      </div>
   </xsl:template>

<xsl:template match="_ufe:intro-title" priority="0">
  <div ch:title="toc" class=" x--ufe-intro-title-3-0">
    <xsl:call-template name="t-base-div-title"/>
  </div>
</xsl:template>

<xsl:template name="__style-for_ipc-fig.1">
      <xsl:text> .x-ipc-fig-1-0 {margin-left: 0pt; margin-right: 0pt; text-indent: 0pt; }</xsl:text>
   </xsl:template>

<xsl:template match="ipc-fig" priority="0">
      <div>
         <!--Emit class values to reflect conditions-->
         <xsl:attribute name="class">
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

<xsl:template name="__style-for_ipc-fig-delete.1">
      <xsl:text> .x-ipc-fig-delete-1-0 {margin-left: 0pt; margin-right: 0pt; }</xsl:text>
   </xsl:template>

<xsl:template match="ipc-fig-delete" priority="0">
      <!--Emit a nostyle template-->
      <xsl:apply-templates/>
   </xsl:template>

<xsl:template name="__style-for_ipc-fig-reloc.1">
      <xsl:text> .x-ipc-fig-reloc-1-0 {margin-left: 0pt; margin-right: 0pt; }</xsl:text>
   </xsl:template>

<xsl:template match="ipc-fig-reloc" priority="0">
      <!--Emit a nostyle template-->
      <xsl:apply-templates/>
   </xsl:template>

<xsl:template name="__style-for_kits.1">
      <xsl:text> .x-kits-1-0 {margin-left: 0pt; margin-right: 0pt; text-indent: 0pt; }</xsl:text>
   </xsl:template>

<xsl:template match="kits" priority="0">
      <div>
         <!--Emit class values to reflect conditions-->
         <xsl:attribute name="class">
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

<xsl:template name="__style-for_atidlm-linkcontent.1">
      <xsl:text> .x-atidlm-linkcontent-1-0 {margin-left: 0pt; margin-right: 0pt; text-indent: 0pt; }</xsl:text>
   </xsl:template>

<xsl:template match="atidlm:linkcontent" priority="0">
      <span>
         <!--Emit class values to reflect conditions-->
         <xsl:attribute name="class">
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
         <!--Process this element's content-->
         <xsl:apply-templates/>
      </span>
   </xsl:template>

<xsl:template name="__style-for_lpln.1">
      <xsl:text> .x-lpln-1-0 {margin-left: 0pt; margin-right: 0pt; text-indent: 0pt; }</xsl:text>
   </xsl:template>

<xsl:template match="lpln" priority="0">
      <div>
         <!--Emit class values to reflect conditions-->
         <xsl:attribute name="class">
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

<xsl:template name="__style-for_met.1">
      <xsl:text> .x-met-1-0 {margin-left: 0pt; margin-right: 0pt; }</xsl:text>
   </xsl:template>

<xsl:template match="met" priority="0">
      <span>
         <!--Emit class values to reflect conditions-->
         <xsl:attribute name="class">
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

<xsl:template name="__style-for_atidlm-metadata.1">
      <xsl:text> .x-atidlm-metadata-1-0 {margin-left: 0pt; margin-right: 0pt; text-indent: 0pt; }</xsl:text>
   </xsl:template>

<xsl:template match="atidlm:metadata" priority="0">
      <span>
         <!--Emit class values to reflect conditions-->
         <xsl:attribute name="class">
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
         <!--Process this element's content-->
         <xsl:apply-templates/>
      </span>
   </xsl:template>

<xsl:template name="__style-for_misc.1">
      <xsl:text> .x-misc-1-0 {margin-left: 0pt; margin-right: 0pt; text-indent: 0pt; }</xsl:text>
   </xsl:template>

<xsl:template match="misc" priority="0">
      <div>
         <!--Emit class values to reflect conditions-->
         <xsl:attribute name="class">
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

<xsl:template name="__style-for_name.1">
      <xsl:text> .x-name-1-0 {margin-left: 0pt; margin-right: 0pt; } .x-name-1-1 {} .x-name-1-2 {} .x-name-1-3 {} .x-name-1-4 {} .x-name-1-5 {} .x-name-1-6 {} .x-name-1-7 {} .x-name-1-8 {} .x-name-1-9 {} .x-name-1-10 {} .x-name-1-11 {} .x-name-1-12 {}</xsl:text>
   </xsl:template>

<xsl:template match="name" priority="0">
      <xsl:variable name="foClass">inline</xsl:variable>
      <xsl:variable name="blockness">inline</xsl:variable>
      <span>
         <!--Emit class values to reflect conditions-->
         <xsl:attribute name="class">
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
         <xsl:call-template name="maybe-set-id"/>
         <!--Process this element's content-->
         <xsl:apply-templates/>
      </span>
   </xsl:template>

<xsl:template name="__style-for_nomen-col.1">
      <xsl:text> .x-nomen-col-1-0 {margin-left: 0pt; margin-right: 0pt; text-indent: 0pt; text-transform: uppercase; } .x-nomen-col-1-1 {margin-left: 8pt; text-indent: -7pt; } .x-nomen-col-1-2 {margin-left: 12pt; text-indent: -11pt; } .x-nomen-col-1-3 {margin-left: 16pt; text-indent: -15pt; } .x-nomen-col-1-4 {margin-left: 20pt; text-indent: -19pt; } .x-nomen-col-1-5 {} .x-nomen-col-1-6 {} .x-nomen-col-1-7 {} .x-nomen-col-1-8 {} .x-nomen-col-1-9 {} .x-nomen-col-1-10 {} .x-nomen-col-1-11 {} .x-nomen-col-1-12 {} .x-nomen-col-1-13 {}</xsl:text>
   </xsl:template>

<xsl:template match="nomen-col" priority="0">
      <xsl:variable name="foClass">block</xsl:variable>
      <xsl:variable name="blockness">block</xsl:variable>
      <xsl:variable name="startnew"/>
      <xsl:variable name="newpageset">#noChange</xsl:variable>
      <div>
         <!--Emit class values to reflect conditions-->
         <xsl:attribute name="class">
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
         <xsl:call-template name="maybe-set-id"/>
         <!--Process this element's content-->
         <xsl:apply-templates/>
      </div>
   </xsl:template>

<xsl:template name="__style-for_note.9n-rate111">
      <xsl:text> .x-note-1-0 {margin-left: 0pt; margin-right: 0pt; text-indent: 0pt; margin-top: 8pt; margin-left: 70pt; text-indent: -45pt; } .x-note-1-1 {}</xsl:text>
   </xsl:template>

<xsl:template match="n-para/note" priority="8">
      <xsl:variable name="foClass">block</xsl:variable>
      <xsl:variable name="blockness">block</xsl:variable>
      <xsl:variable name="startnew"/>
      <xsl:variable name="newpageset">#noChange</xsl:variable>
      <div>
         <!--Emit class values to reflect conditions-->
         <xsl:attribute name="class">
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
         <xsl:call-template name="maybe-set-id"/>
         <!--Process this element's content-->
         <xsl:apply-templates/>
      </div>
   </xsl:template>

<xsl:template name="__style-for_note.9predte142">
      <xsl:text> .x-note-2-0 {margin-left: 0pt; margin-right: 0pt; text-indent: 0pt; margin-top: 8pt; margin-left: 59pt; text-indent: -41pt; } .x-note-2-1 {margin-left: 76pt; text-indent: -57pt; }</xsl:text>
   </xsl:template>

<xsl:template match="procedure/note" priority="7">
      <xsl:variable name="foClass">block</xsl:variable>
      <xsl:variable name="blockness">block</xsl:variable>
      <xsl:variable name="startnew"/>
      <xsl:variable name="newpageset">#noChange</xsl:variable>
      <div>
         <!--Emit class values to reflect conditions-->
         <xsl:attribute name="class">
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
         <xsl:call-template name="maybe-set-id"/>
         <!--Process this element's content-->
         <xsl:apply-templates/>
      </div>
   </xsl:template>

<xsl:template name="__style-for_note.9facnte103">
      <xsl:text> .x-note-3-0 {margin-left: 0pt; margin-right: 0pt; text-indent: 0pt; }</xsl:text>
   </xsl:template>

<xsl:template match="fandc/note" priority="6">
      <div>
         <!--Emit class values to reflect conditions-->
         <xsl:attribute name="class">
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

<xsl:template name="__style-for_note.9sp-ate154">
      <xsl:text> .x-note-4-0 {margin-left: 0pt; margin-right: 0pt; text-indent: 0pt; }</xsl:text>
   </xsl:template>

<xsl:template match="spec-assem/note" priority="5">
      <div>
         <!--Emit class values to reflect conditions-->
         <xsl:attribute name="class">
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

<xsl:template name="__style-for_note.9spngte205">
      <xsl:text> .x-note-5-0 {margin-left: 0pt; margin-right: 0pt; text-indent: 0pt; }</xsl:text>
   </xsl:template>

<xsl:template match="spring-pressure/note" priority="4">
      <div>
         <!--Emit class values to reflect conditions-->
         <xsl:attribute name="class">
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

<xsl:template name="__style-for_note.9touete236">
      <xsl:text> .x-note-6-0 {margin-left: 0pt; margin-right: 0pt; text-indent: 0pt; }</xsl:text>
   </xsl:template>

<xsl:template match="torque-and-stretch/note" priority="3">
      <div>
         <!--Emit class values to reflect conditions-->
         <xsl:attribute name="class">
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

<xsl:template name="__style-for_note.9fi-ate207">
      <xsl:text> .x-note-7-0 {margin-left: 0pt; margin-right: 0pt; text-indent: 0pt; }</xsl:text>
   </xsl:template>

<xsl:template match="fits-and-clears/note" priority="2">
      <div>
         <!--Emit class values to reflect conditions-->
         <xsl:attribute name="class">
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

<xsl:template name="__style-for_note.9note218">
      <xsl:text> .x-note-8-0 {margin-left: 0pt; margin-right: 0pt; text-indent: 0pt; margin-top: 8pt; margin-left: 59pt; text-indent: -41pt; } .x-note-8-1 {margin-left: 76pt; text-indent: -57pt; }</xsl:text>
   </xsl:template>

<xsl:template match="note[parent::subpara]" priority="1">
      <xsl:variable name="foClass">block</xsl:variable>
      <xsl:variable name="blockness">block</xsl:variable>
      <xsl:variable name="startnew"/>
      <xsl:variable name="newpageset">#noChange</xsl:variable>
      <div>
         <!--Emit class values to reflect conditions-->
         <xsl:attribute name="class">
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
         <xsl:call-template name="maybe-set-id"/>
         <!--Process this element's content-->
         <xsl:apply-templates/>
      </div>
   </xsl:template>

<xsl:template name="__style-for_note.9note49">
      <xsl:text> .x-note-9-0 {margin-left: 0pt; margin-right: 0pt; text-indent: 0pt; margin-top: 8pt; margin-left: 43pt; text-indent: -43pt; } .x-note-9-1 {}</xsl:text>
   </xsl:template>

<xsl:template match="note" priority="0">
      <xsl:variable name="foClass">block</xsl:variable>
      <xsl:variable name="blockness">block</xsl:variable>
      <xsl:variable name="startnew"/>
      <xsl:variable name="newpageset">#noChange</xsl:variable>
      <div>
         <!--Emit class values to reflect conditions-->
         <xsl:attribute name="class">
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
         <xsl:call-template name="maybe-set-id"/>
         <!--Process this element's content-->
         <xsl:apply-templates/>
      </div>
   </xsl:template>

<xsl:template match="_ufe:num-index-title" priority="0">
  <div ch:title="toc" class=" x--ufe-num-index-title-4-0">
    <xsl:call-template name="t-base-div-title"/>
  </div>
</xsl:template>

<xsl:template match="_ufe:nut-option-title" priority="0">
  <div ch:title="notoc" class=" x--ufe-nut-option-title-4-0">
    <xsl:call-template name="t-base-div-title"/>
  </div>
</xsl:template>

<xsl:template name="__style-for_optitem.1">
      <xsl:text> .x-optitem-1-0 {margin-left: 0pt; margin-right: 0pt; }</xsl:text>
   </xsl:template>

<xsl:template match="optitem" priority="0">
      <span>
         <!--Emit class values to reflect conditions-->
         <xsl:attribute name="class">
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

<xsl:template name="__style-for_optpn.1">
      <xsl:text> .x-optpn-1-0 {margin-left: 0pt; margin-right: 0pt; }</xsl:text>
   </xsl:template>

<xsl:template match="optpn" priority="0">
      <span>
         <!--Emit class values to reflect conditions-->
         <xsl:attribute name="class">
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

<xsl:template name="__style-for_part-nbr.1">
      <xsl:text> .x-part-nbr-1-0 {margin-left: 0pt; margin-right: 0pt; text-indent: 0pt; } .x-part-nbr-1-1 {}</xsl:text>
   </xsl:template>

<xsl:template match="part-nbr" priority="0">
      <xsl:param name="hidden" select="'yes'"/>
      <!--Dynamically determine the fo-class-->
      <xsl:variable name="foClass">
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
            <xsl:when test="true()">
               <!--This is the "otherwise" clause, but there may be no when's-->
               <xsl:value-of select="$foClass"/>
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
      <!--Execute the appropriate code for the dynamically determined fo-class-->
      <xsl:choose>
         <xsl:when test="$fo-class='hidden-block'">
            <div>
               <!--Emit class values to reflect conditions-->
               <xsl:attribute name="class">
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
            </div>
         </xsl:when>
         <xsl:when test="$fo-class='block'">
            <div>
               <!--Emit class values to reflect conditions-->
               <xsl:attribute name="class">
                  <xsl:text> x-part-nbr-1-0</xsl:text>
                  <xsl:if test="(@ref) and (not(@ref) or (@ref and string(@ref)!=''))">x-part-nbr-1-1</xsl:if>
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
               <xsl:call-template name="maybe-set-id"/>
               <!--Process this element's content-->
               <xsl:apply-templates/>
            </div>
         </xsl:when>
      </xsl:choose>
   </xsl:template>

<xsl:template name="__style-for__ufe-partial-breakdown.1">
      <xsl:text> .x--ufe-partial-breakdown-1-0 {margin-left: 0pt; margin-right: 0pt; text-indent: 0pt; } .x--ufe-partial-breakdown-1-1 {margin-left: -8pt; text-indent: 0pt; } .x--ufe-partial-breakdown-1-2 {margin-left: -12pt; text-indent: 0pt; } .x--ufe-partial-breakdown-1-3 {margin-left: -16pt; text-indent: 0pt; } .x--ufe-partial-breakdown-1-4 {margin-left: -20pt; text-indent: 0pt; }</xsl:text>
   </xsl:template>

<xsl:template match="_ufe:partial-breakdown" priority="0">
      <xsl:variable name="foClass">block</xsl:variable>
      <xsl:variable name="blockness">block</xsl:variable>
      <xsl:variable name="startnew"/>
      <xsl:variable name="newpageset">#noChange</xsl:variable>
      <div>
         <!--Emit class values to reflect conditions-->
         <xsl:attribute name="class">
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
         <xsl:call-template name="maybe-set-id"/>
         <!--Process this element's content-->
         <xsl:apply-templates/>
      </div>
   </xsl:template>

<xsl:template name="__style-for_parts-list.1">
      <xsl:text> .x-parts-list-1-0 {margin-left: 0pt; margin-right: 0pt; text-indent: 0pt; }</xsl:text>
   </xsl:template>

<xsl:template match="parts-list" priority="0">
      <div>
         <!--Emit class values to reflect conditions-->
         <xsl:attribute name="class">
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

<xsl:template name="__style-for_pd-list.1">
      <xsl:text> .x-pd-list-1-0 {margin-left: 0pt; margin-right: 0pt; }</xsl:text>
   </xsl:template>

<xsl:template match="pd-list" priority="0">
      <!--Emit a nostyle template-->
      <xsl:apply-templates/>
   </xsl:template>

<xsl:template match="_ufe:pdlist-title" priority="0">
  <div ch:title="toc" class=" x--ufe-pdlist-title-2-0">
    <xsl:call-template name="t-base-div-title"/>
  </div>
</xsl:template>

<xsl:template name="__style-for_pntype.2pnpepe201">
      <xsl:text> .x-pntype-1-0 {margin-left: 0pt; margin-right: 0pt; text-indent: 0pt; } .x-pntype-1-1 {} .x-pntype-1-2 {} .x-pntype-1-3 {} .x-pntype-1-4 {} .x-pntype-1-5 {} .x-pntype-1-6 {} .x-pntype-1-7 {} .x-pntype-1-8 {} .x-pntype-1-9 {} .x-pntype-1-10 {}</xsl:text>
   </xsl:template>

<xsl:template match="pntype[position()&gt;1]" priority="1">
      <xsl:param name="hidden" select="'yes'"/>
      <!--Dynamically determine the fo-class-->
      <xsl:variable name="foClass">
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
            <xsl:when test="true()">
               <!--This is the "otherwise" clause, but there may be no when's-->
               <xsl:value-of select="$foClass"/>
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
      <!--Execute the appropriate code for the dynamically determined fo-class-->
      <xsl:choose>
         <xsl:when test="$fo-class='block'">
            <div>
               <!--Emit class values to reflect conditions-->
               <xsl:attribute name="class">
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
               <xsl:call-template name="maybe-set-id"/>
               <!--Process this element's content-->
               <xsl:apply-templates/>
            </div>
         </xsl:when>
         <xsl:when test="$fo-class='inline'">
            <span>
               <!--Emit class values to reflect conditions-->
               <xsl:attribute name="class">
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
               <xsl:call-template name="maybe-set-id"/>
               <!--Process this element's content-->
               <xsl:apply-templates/>
            </span>
         </xsl:when>
      </xsl:choose>
   </xsl:template>

<xsl:template name="__style-for_pntype.2pnpepe62">
      <xsl:text> .x-pntype-2-0 {margin-left: 0pt; margin-right: 0pt; text-indent: 0pt; } .x-pntype-2-1 {} .x-pntype-2-2 {} .x-pntype-2-3 {} .x-pntype-2-4 {} .x-pntype-2-5 {}</xsl:text>
   </xsl:template>

<xsl:template match="pntype" priority="0">
      <xsl:variable name="foClass">block</xsl:variable>
      <xsl:variable name="blockness">block</xsl:variable>
      <xsl:variable name="startnew"/>
      <xsl:variable name="newpageset">#noChange</xsl:variable>
      <div>
         <!--Emit class values to reflect conditions-->
         <xsl:attribute name="class">
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
         <xsl:call-template name="maybe-set-id"/>
         <!--Process this element's content-->
         <xsl:apply-templates/>
      </div>
   </xsl:template>

<xsl:template name="__style-for_pwc-pn.1">
      <xsl:text> .x-pwc-pn-1-0 {margin-left: 0pt; margin-right: 0pt; text-indent: 0pt; }</xsl:text>
   </xsl:template>

<xsl:template match="pwc-pn" priority="0">
      <div>
         <!--Emit class values to reflect conditions-->
         <xsl:attribute name="class">
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

<xsl:template name="__style-for_range.1">
      <xsl:text> .x-range-1-0 {margin-left: 0pt; margin-right: 0pt; text-indent: 0pt; } .x-range-1-1 {}</xsl:text>
   </xsl:template>

<xsl:template match="range" priority="0">
      <xsl:param name="hidden" select="'yes'"/>
      <xsl:variable name="foClass">hidden-block</xsl:variable>
      <xsl:variable name="blockness">block</xsl:variable>
      <xsl:variable name="hiddenness">yes</xsl:variable>
      <xsl:variable name="startnew"/>
      <xsl:variable name="newpageset">#noChange</xsl:variable>
      <div>
         <!--Emit class values to reflect conditions-->
         <xsl:attribute name="class">
            <xsl:text> x-range-1-0</xsl:text>
            <xsl:if test="substring-before(.,',') != '0'"> x-range-1-1</xsl:if>
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
      </div>
   </xsl:template>

<xsl:template name="__style-for_atidlm-resourcepair.1">
      <xsl:text> .x-atidlm-resourcepair-1-0 {margin-left: 0pt; margin-right: 0pt; text-indent: 0pt; }</xsl:text>
   </xsl:template>

<xsl:template match="atidlm:resourcepair" priority="0">
      <span>
         <!--Emit class values to reflect conditions-->
         <xsl:attribute name="class">
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
         <!--Process this element's content-->
         <xsl:apply-templates/>
      </span>
   </xsl:template>

<xsl:template name="__style-for_sb-stat.4non-at301">
      <xsl:text> .x-sb-stat-1-0
{margin-left: 0pt; margin-right: 0pt; text-indent: 0pt; color: #0000FF;
text-decoration: underline ; text-decoration: underline ; } .x-sb-stat-1-1
{} .x-sb-stat-1-2 {} .x-sb-stat-1-3 {} .x-sb-stat-1-4 {} .x-sb-stat-1-5
{}</xsl:text>
   </xsl:template>

<xsl:template match="nomen-col/sb-stat[@type='SPB']" priority="3">
      <xsl:param name="hidden" select="'yes'"/>
      <xsl:variable name="foClass">hidden-block</xsl:variable>
      <xsl:variable name="blockness">block</xsl:variable>
      <xsl:variable name="hiddenness">yes</xsl:variable>
      <xsl:variable name="startnew"/>
      <xsl:variable name="newpageset">#noChange</xsl:variable>
      <div>
         <!--Emit class values to reflect conditions-->
         <xsl:attribute name="class">
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
         <xsl:call-template name="maybe-set-id"/>
         <!--Suppress element contents (but not gentext) unless unhidden-->
         <xsl:choose>
            <xsl:when test="$hidden='no'">
               <xsl:apply-templates> </xsl:apply-templates>
            </xsl:when>
            <xsl:otherwise>
               <a href="#">
                  <xsl:attribute name="onClick">
                     <xsl:text>spbLink('</xsl:text>
                     <xsl:value-of select="."/>
                     <xsl:text>');</xsl:text>
                  </xsl:attribute>
                  <xsl:apply-templates select="_sfe:BeforeOrAfterText"> </xsl:apply-templates>
               </a>
            </xsl:otherwise>
         </xsl:choose>
      </div>
   </xsl:template>

<xsl:template name="__style-for_sb-stat.4non-at172">
      <xsl:text> .x-sb-stat-2-0
{margin-left: 0pt; margin-right: 0pt; text-indent: 0pt; color: #0000FF;
text-decoration: underline ; text-decoration: underline ; } .x-sb-stat-2-1
{} .x-sb-stat-2-2 {} .x-sb-stat-2-3 {} .x-sb-stat-2-4 {} .x-sb-stat-2-5
{}</xsl:text>
   </xsl:template>

<xsl:template match="nomen-col/sb-stat" priority="2">
      <xsl:variable name="foClass">block</xsl:variable>
      <xsl:variable name="blockness">block</xsl:variable>
      <xsl:variable name="startnew"/>
      <xsl:variable name="newpageset">#noChange</xsl:variable>
      <div>
         <!--Emit class values to reflect conditions-->
         <xsl:attribute name="class">
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
         <xsl:call-template name="maybe-set-id"/>
         <!--Process this element's content-->
         <a href="#">
            <xsl:attribute name="onClick">
               <xsl:text>sbLink('</xsl:text>
               <xsl:value-of select="."/>
               <xsl:text>');</xsl:text>
            </xsl:attribute>
            <xsl:apply-templates> </xsl:apply-templates>
         </a>
      </div>
   </xsl:template>

<xsl:template name="__style-for_sb-stat.2sbtaat201">
      <xsl:text> .x-sb-stat-1-0
{margin-left: 0pt; margin-right: 0pt; color: #0000FF; text-decoration:
underline ; text-decoration: underline ; }</xsl:text>
   </xsl:template>

<xsl:template match="sb-stat[@type='SPB']" priority="1">
      <xsl:param name="hidden" select="'yes'"/>
      <span>
         <!--Emit class values to reflect conditions-->
         <xsl:attribute name="class">
            <xsl:text> x-sb-stat-1-0</xsl:text>
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
               <xsl:apply-templates> </xsl:apply-templates>
            </xsl:when>
            <xsl:otherwise>
               <a href="#">
                  <xsl:attribute name="onClick">
                     <xsl:text>spbLink('</xsl:text>
                     <xsl:value-of select="."/>
                     <xsl:text>');</xsl:text>
                  </xsl:attribute>
                  <xsl:apply-templates select="_sfe:BeforeOrAfterText"> </xsl:apply-templates>
               </a>
            </xsl:otherwise>
         </xsl:choose>
      </span>
   </xsl:template>

<xsl:template name="__style-for_sb-stat.2sbtaat72">
      <xsl:text> .x-sb-stat-2-0
{margin-left: 0pt; margin-right: 0pt; color: #0000FF; text-decoration:
underline ; text-decoration: underline ; }</xsl:text>
   </xsl:template>

<xsl:template match="sb-stat" priority="0">
      <span>
         <!--Emit class values to reflect conditions-->
         <xsl:attribute name="class">
            <xsl:text> x-sb-stat-2-0</xsl:text>
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
         <a href="#">
            <xsl:attribute name="onClick">
               <xsl:text>sbLink('</xsl:text>
               <xsl:value-of select="."/>
               <xsl:text>');</xsl:text>
            </xsl:attribute>
            <xsl:apply-templates> </xsl:apply-templates>
         </a>
      </span>
   </xsl:template>

<xsl:template match="_ufe:sblist-title" priority="0">
  <div ch:title="toc" class=" x--ufe-sblist-title-3-0">
    <xsl:call-template name="t-base-div-title"/>
  </div>
</xsl:template>

<xsl:template name="__style-for_see.1">
      <xsl:text> .x-see-1-0 {margin-left: 0pt; margin-right: 0pt; text-indent: 0pt; } .x-see-1-1 {} .x-see-1-2 {} .x-see-1-3 {} .x-see-1-4 {} .x-see-1-5 {} .x-see-1-6 {} .x-see-1-7 {}</xsl:text>
   </xsl:template>

<xsl:template match="see" priority="0">
      <xsl:param name="hidden" select="'yes'"/>
      <!--Dynamically determine the fo-class-->
      <xsl:variable name="foClass">
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
            <xsl:when test="true()">
               <!--This is the "otherwise" clause, but there may be no when's-->
               <xsl:value-of select="$foClass"/>
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
      <!--Execute the appropriate code for the dynamically determined fo-class-->
      <xsl:choose>
         <xsl:when test="$fo-class='hidden-block'">
            <div>
               <!--Emit class values to reflect conditions-->
               <xsl:attribute name="class">
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
            </div>
         </xsl:when>
         <xsl:when test="$fo-class='block'">
            <div>
               <!--Emit class values to reflect conditions-->
               <xsl:attribute name="class">
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
               <xsl:call-template name="maybe-set-id"/>
               <!--Process this element's content-->
               <xsl:apply-templates/>
            </div>
         </xsl:when>
      </xsl:choose>
   </xsl:template>

<xsl:template name="__style-for_service-bull-list.1">
      <xsl:text> .x-service-bull-list-1-0 {margin-left: 0pt; margin-right: 0pt; text-indent: 0pt; margin-top: 8pt; }</xsl:text>
   </xsl:template>

<xsl:template match="service-bull-list" priority="0">
      <div>
         <!--Emit class values to reflect conditions-->
         <xsl:attribute name="class">
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
         <!--Process this element's content-->
         <xsl:apply-templates/>
      </div>
   </xsl:template>

<xsl:template name="__style-for_atidlm-source.1">
      <xsl:text> .x-atidlm-source-1-0 {margin-left: 0pt; margin-right: 0pt; text-indent: 0pt; }</xsl:text>
   </xsl:template>

<xsl:template match="atidlm:source" priority="0">
      <span>
         <!--Emit class values to reflect conditions-->
         <xsl:attribute name="class">
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
         <!--Process this element's content-->
         <xsl:apply-templates/>
      </span>
   </xsl:template>

<xsl:template name="__style-for_spb-item.1">
      <xsl:text> .x-spb-item-1-0 {margin-left: 0pt; margin-right: 0pt; }</xsl:text>
   </xsl:template>

<xsl:template match="spb-item" priority="0">
      <!--Emit a nostyle template-->
      <xsl:apply-templates/>
   </xsl:template>

<xsl:template name="__style-for_spb-list.1">
      <xsl:text> .x-spb-list-1-0 {margin-left: 0pt; margin-right: 0pt; text-indent: 0pt; margin-top: 8pt; }</xsl:text>
   </xsl:template>

<xsl:template match="spb-list" priority="0">
      <div>
         <!--Emit class values to reflect conditions-->
         <xsl:attribute name="class">
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
         <!--Process this element's content-->
         <xsl:apply-templates/>
      </div>
   </xsl:template>

<xsl:template match="_ufe:spblist-title" priority="0">
  <div ch:title="toc" class=" x--ufe-spblist-title-3-0">
    <xsl:call-template name="t-base-div-title"/>
  </div>
</xsl:template>

<xsl:template name="__style-for_step.4nuisep121">
      <xsl:text> .x-step-1-0 {margin-left: 0pt; margin-right: 0pt; text-indent: 0pt; margin-top: 6pt; margin-bottom: 6pt; margin-left: 0pt; text-indent: 0pt; }</xsl:text>
   </xsl:template>

<xsl:template match="numlist/step" priority="3">
      <table border="0" cellpadding="0" cellspacing="0">
         <xsl:attribute name="style">
            <xsl:variable name="followWith">tab</xsl:variable>
            <xsl:if test="$followWith='tab'">table-layout: fixed; </xsl:if>
         </xsl:attribute>
         <!--Emit class values to reflect conditions-->
         <xsl:attribute name="class">
            <xsl:text> x-step-1-0</xsl:text> x--zero-left-margins</xsl:attribute>
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
                  <!--Process this element's content-->
                  <xsl:apply-templates select="node()[name(.)!='_sfe:BeforeOrAfterText']"/>
               </td>
            </tr>
         </tbody>
      </table>
   </xsl:template>

<xsl:template name="__style-for_step.4predep152">
      <xsl:text> .x-step-2-0 {margin-left:
0pt; margin-right: 0pt; text-indent: 0pt; margin-top: 6pt; margin-bottom:
6pt; margin-left: 0pt; text-indent: 0pt; }</xsl:text>
   </xsl:template>

<xsl:template match="procedure//step" priority="2">
      <!--gdb 11-29-12 JIRA-814: added  or name() = 'revst' and following-sibling::*[1][name() = 'warning']...  or name() = 'revst' and following-sibling::*[1][name() = 'caution'] to move change  markup with <warning> or <caution> -->
      <xsl:apply-templates select="node()[self::warning or (self::revst and following-sibling::*[1][self::warning]) or self::caution or (self::revst and following-sibling::*[1][self::caution]) or name() = 'revend']"> </xsl:apply-templates>
      <table border="0" cellpadding="0" cellspacing="0">
         <xsl:attribute name="style">
            <xsl:variable name="followWith">tab</xsl:variable>
            <xsl:if test="$followWith='tab'">table-layout: fixed; </xsl:if>
         </xsl:attribute>
         <!--Emit class values to reflect conditions-->
         <xsl:attribute name="class">
            <xsl:text> x-step-2-0</xsl:text> x--zero-left-margins</xsl:attribute>
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
         <xsl:variable name="col1-width">18pt</xsl:variable>
         <xsl:variable name="col2-width">20pt</xsl:variable>
         <xsl:variable name="col3-width"/>
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
                     <xsl:apply-templates select="_sfe:BeforeOrAfterText[1]"> </xsl:apply-templates>
                  </xsl:if>
               </td>
               <td>
                  <xsl:if test="$itemlabel-colnum=3">
                     <xsl:attribute name="style">word-break: keep-all; </xsl:attribute>
                     <xsl:apply-templates select="_sfe:BeforeOrAfterText[1]"> </xsl:apply-templates>
                  </xsl:if>
                  <!--Process this element's content-->
                  <xsl:apply-templates select="node()[name(.) != '_sfe:BeforeOrAfterText' and name() != 'warning'  and name() != 'caution']"/>
               </td>
            </tr>
         </tbody>
      </table>
   </xsl:template>

<xsl:template name="__style-for_step.4step283">
      <xsl:text> .x-step-3-0 {margin-left:
0pt; margin-right: 0pt; text-indent: 0pt; line-height: 14pt; margin-bottom:
6pt; margin-left: 0pt; text-indent: 0pt; }</xsl:text>
   </xsl:template>

<xsl:template match="step[table/@tabstyle='frac']" priority="1">
      <!--gdb 11-29-12 JIRA-814: added  or name() = 'revst' and following-sibling::*[1][name() = 'warning']...  or name() = 'revst' and following-sibling::*[1][name() = 'caution'] to move change  markup with <warning> or <caution> -->
      <xsl:apply-templates select="node()[self::warning or (self::revst and following-sibling::*[1][self::warning]) or self::caution or (self::revst and following-sibling::*[1][self::caution]) or name() = 'revend']"> </xsl:apply-templates>
      <table border="0" cellpadding="0" cellspacing="0">
         <xsl:attribute name="style">
            <xsl:variable name="followWith">emspace</xsl:variable>
            <xsl:if test="$followWith='tab'">table-layout: fixed; </xsl:if>
         </xsl:attribute>
         <!--Emit class values to reflect conditions-->
         <xsl:attribute name="class">
            <xsl:text> x-step-3-0</xsl:text> x--zero-left-margins</xsl:attribute>
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
                     <xsl:apply-templates select="_sfe:BeforeOrAfterText[1]"> </xsl:apply-templates>
                  </xsl:if>
               </td>
               <td>
                  <xsl:if test="$itemlabel-colnum=3">
                     <xsl:attribute name="style">word-break: keep-all; </xsl:attribute>
                     <xsl:apply-templates select="_sfe:BeforeOrAfterText[1]"> </xsl:apply-templates>
                  </xsl:if>
                  <!--Process this element's content-->
                  <xsl:apply-templates select="node()[name(.)!='_sfe:BeforeOrAfterText' and name() != 'warning'  and name() != 'caution' ]"/>
               </td>
            </tr>
         </tbody>
      </table>
   </xsl:template>

<xsl:template name="__style-for_step.4step44">
      <xsl:text> .x-step-4-0 {margin-left: 0pt; margin-right: 0pt; text-indent: 0pt; margin-top: 6pt; margin-bottom: 6pt; margin-left: 0pt; text-indent: 0pt; }</xsl:text>
   </xsl:template>

<xsl:template match="step" priority="0">
      <table border="0" cellpadding="0" cellspacing="0">
         <xsl:attribute name="style">
            <xsl:variable name="followWith"/>
            <xsl:if test="$followWith='tab'">table-layout: fixed; </xsl:if>
         </xsl:attribute>
         <!--Emit class values to reflect conditions-->
         <xsl:attribute name="class">
            <xsl:text> x-step-4-0</xsl:text> x--zero-left-margins</xsl:attribute>
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
                  <!--Process this element's content-->
                  <xsl:apply-templates select="node()[name(.)!='_sfe:BeforeOrAfterText']"/>
               </td>
            </tr>
         </tbody>
      </table>
   </xsl:template>

<xsl:template name="__style-for_step2.3nuisp2131">
      <xsl:text> .x-step2-1-0 {margin-left: 0pt; margin-right: 0pt; text-indent: 0pt; margin-top: 6pt; margin-bottom: 6pt; margin-left: 0pt; text-indent: 0pt; }</xsl:text>
   </xsl:template>

<xsl:template match="numlist/step2" priority="2">
      <table border="0" cellpadding="0" cellspacing="0">
         <xsl:attribute name="style">
            <xsl:variable name="followWith">tab</xsl:variable>
            <xsl:if test="$followWith='tab'">table-layout: fixed; </xsl:if>
         </xsl:attribute>
         <!--Emit class values to reflect conditions-->
         <xsl:attribute name="class">
            <xsl:text> x-step2-1-0</xsl:text> x--zero-left-margins</xsl:attribute>
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
                  <!--Process this element's content-->
                  <xsl:apply-templates select="node()[name(.)!='_sfe:BeforeOrAfterText']"/>
               </td>
            </tr>
         </tbody>
      </table>
   </xsl:template>

<xsl:template name="__style-for_step2.3st2p2292">
      <xsl:text> .x-step2-2-0
{margin-left: 0pt; margin-right: 0pt; text-indent: 0pt; line-height:
14pt; margin-bottom: 6pt; margin-left: 0pt; text-indent: 0pt; }</xsl:text>
   </xsl:template>

<xsl:template match="step2[table/@tabstyle='frac']" priority="1">
      <!--gdb 11-29-12 JIRA-814: added  or name() = 'revst' and following-sibling::*[1][name() = 'warning']...  or name() = 'revst' and following-sibling::*[1][name() = 'caution'] to move change  markup with <warning> or <caution> -->
      <xsl:apply-templates select="node()[self::warning or (self::revst and following-sibling::*[1][self::warning]) or self::caution or (self::revst and following-sibling::*[1][self::caution]) or name() = 'revend']"> </xsl:apply-templates>
      <table border="0" cellpadding="0" cellspacing="0">
         <xsl:attribute name="style">
            <xsl:variable name="followWith">emspace</xsl:variable>
            <xsl:if test="$followWith='tab'">table-layout: fixed; </xsl:if>
         </xsl:attribute>
         <!--Emit class values to reflect conditions-->
         <xsl:attribute name="class">
            <xsl:text> x-step2-2-0</xsl:text> x--zero-left-margins</xsl:attribute>
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
                     <xsl:apply-templates select="_sfe:BeforeOrAfterText[1]"> </xsl:apply-templates>
                  </xsl:if>
               </td>
               <td>
                  <xsl:if test="$itemlabel-colnum=3">
                     <xsl:attribute name="style">word-break: keep-all; </xsl:attribute>
                     <xsl:apply-templates select="_sfe:BeforeOrAfterText[1]"> </xsl:apply-templates>
                  </xsl:if>
                  <!--Process this element's content-->
                  <xsl:apply-templates select="node()[name(.)!='_sfe:BeforeOrAfterText' and name() != 'warning'  and name() != 'caution' ]"/>
               </td>
            </tr>
         </tbody>
      </table>
   </xsl:template>

<xsl:template name="__style-for_step2.3st2p253">
      <xsl:text> .x-step2-3-0 {margin-left:
0pt; margin-right: 0pt; text-indent: 0pt; margin-top: 6pt; margin-bottom:
6pt; margin-left: 0pt; text-indent: 0pt; }</xsl:text>
   </xsl:template>

<xsl:template match="step2" priority="0">
      <!--gdb 11-29-12 JIRA-814: added  or name() = 'revst' and following-sibling::*[1][name() = 'warning']...  or name() = 'revst' and following-sibling::*[1][name() = 'caution'] to move change  markup with <warning> or <caution> -->
      <xsl:apply-templates select="node()[self::warning or (self::revst and following-sibling::*[1][self::warning]) or self::caution or (self::revst and following-sibling::*[1][self::caution]) or name() = 'revend']"> </xsl:apply-templates>
      <table border="0" cellpadding="0" cellspacing="0">
         <xsl:attribute name="style">
            <xsl:variable name="followWith">emspace</xsl:variable>
            <xsl:if test="$followWith='tab'">table-layout: fixed; </xsl:if>
         </xsl:attribute>
         <!--Emit class values to reflect conditions-->
         <xsl:attribute name="class">
            <xsl:text> x-step2-3-0</xsl:text> x--zero-left-margins</xsl:attribute>
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
                     <xsl:apply-templates select="_sfe:BeforeOrAfterText[1]"> </xsl:apply-templates>
                  </xsl:if>
               </td>
               <td>
                  <xsl:if test="$itemlabel-colnum=3">
                     <xsl:attribute name="style">word-break: keep-all; </xsl:attribute>
                     <xsl:apply-templates select="_sfe:BeforeOrAfterText[1]"> </xsl:apply-templates>
                  </xsl:if>
                  <!--Process this element's content-->
                  <xsl:apply-templates select="node()[name(.)!='_sfe:BeforeOrAfterText' and name() != 'warning'  and name() != 'caution' ]"/>
               </td>
            </tr>
         </tbody>
      </table>
   </xsl:template>

<xsl:template name="__style-for_step3.3nuisp3131">
      <xsl:text> .x-step3-1-0 {margin-left: 0pt; margin-right: 0pt; text-indent: 0pt; margin-top: 6pt; margin-bottom: 6pt; margin-left: 0pt; text-indent: 0pt; }</xsl:text>
   </xsl:template>

<xsl:template match="numlist/step3" priority="2">
      <table border="0" cellpadding="0" cellspacing="0">
         <xsl:attribute name="style">
            <xsl:variable name="followWith">tab</xsl:variable>
            <xsl:if test="$followWith='tab'">table-layout: fixed; </xsl:if>
         </xsl:attribute>
         <!--Emit class values to reflect conditions-->
         <xsl:attribute name="class">
            <xsl:text> x-step3-1-0</xsl:text> x--zero-left-margins</xsl:attribute>
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
                  <!--Process this element's content-->
                  <xsl:apply-templates select="node()[name(.)!='_sfe:BeforeOrAfterText']"/>
               </td>
            </tr>
         </tbody>
      </table>
   </xsl:template>

<xsl:template name="__style-for_step3.3st3p3292">
      <xsl:text> .x-step3-2-0
{margin-left: 0pt; margin-right: 0pt; text-indent: 0pt; line-height:
14pt; margin-bottom: 6pt; margin-left: 0pt; text-indent: 0pt; }</xsl:text>
   </xsl:template>

<xsl:template match="step3[table/@tabstyle='frac']" priority="1">
      <!--gdb 11-29-12 JIRA-814: added  or name() = 'revst' and following-sibling::*[1][name() = 'warning']...  or name() = 'revst' and following-sibling::*[1][name() = 'caution'] to move change  markup with <warning> or <caution> -->
      <xsl:apply-templates select="node()[self::warning or (self::revst and following-sibling::*[1][self::warning]) or self::caution or (self::revst and following-sibling::*[1][self::caution]) or name() = 'revend']"> </xsl:apply-templates>
      <table border="0" cellpadding="0" cellspacing="0">
         <xsl:attribute name="style">
            <xsl:variable name="followWith">emspace</xsl:variable>
            <xsl:if test="$followWith='tab'">table-layout: fixed; </xsl:if>
         </xsl:attribute>
         <!--Emit class values to reflect conditions-->
         <xsl:attribute name="class">
            <xsl:text> x-step3-2-0</xsl:text> x--zero-left-margins</xsl:attribute>
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
                     <xsl:apply-templates select="_sfe:BeforeOrAfterText[1]"> </xsl:apply-templates>
                  </xsl:if>
               </td>
               <td>
                  <xsl:if test="$itemlabel-colnum=3">
                     <xsl:attribute name="style">word-break: keep-all; </xsl:attribute>
                     <xsl:apply-templates select="_sfe:BeforeOrAfterText[1]"> </xsl:apply-templates>
                  </xsl:if>
                  <!--Process this element's content-->
                  <xsl:apply-templates select="node()[name(.)!='_sfe:BeforeOrAfterText' and name() != 'warning'  and name() != 'caution' ]"/>
               </td>
            </tr>
         </tbody>
      </table>
   </xsl:template>

<xsl:template name="__style-for_step3.3st3p353">
      <xsl:text> .x-step3-3-0 {margin-left:
0pt; margin-right: 0pt; text-indent: 0pt; margin-top: 6pt; margin-bottom:
6pt; margin-left: 0pt; text-indent: 0pt; }</xsl:text>
   </xsl:template>

<xsl:template match="step3" priority="0">
      <!--gdb 11-29-12 JIRA-814: added  or name() = 'revst' and following-sibling::*[1][name() = 'warning']...  or name() = 'revst' and following-sibling::*[1][name() = 'caution'] to move change  markup with <warning> or <caution> -->
      <xsl:apply-templates select="node()[self::warning or (self::revst and following-sibling::*[1][self::warning]) or self::caution or (self::revst and following-sibling::*[1][self::caution]) or name() = 'revend']"> </xsl:apply-templates>
      <table border="0" cellpadding="0" cellspacing="0">
         <xsl:attribute name="style">
            <xsl:variable name="followWith">emspace</xsl:variable>
            <xsl:if test="$followWith='tab'">table-layout: fixed; </xsl:if>
         </xsl:attribute>
         <!--Emit class values to reflect conditions-->
         <xsl:attribute name="class">
            <xsl:text> x-step3-3-0</xsl:text> x--zero-left-margins</xsl:attribute>
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
                     <xsl:apply-templates select="_sfe:BeforeOrAfterText[1]"> </xsl:apply-templates>
                  </xsl:if>
               </td>
               <td>
                  <xsl:if test="$itemlabel-colnum=3">
                     <xsl:attribute name="style">word-break: keep-all; </xsl:attribute>
                     <xsl:apply-templates select="_sfe:BeforeOrAfterText[1]"> </xsl:apply-templates>
                  </xsl:if>
                  <!--Process this element's content-->
                  <xsl:apply-templates select="node()[name(.)!='_sfe:BeforeOrAfterText' and name() != 'warning'  and name() != 'caution' ]"/>
               </td>
            </tr>
         </tbody>
      </table>
   </xsl:template>

<xsl:template name="__style-for_step4.3nuisp4131">
      <xsl:text> .x-step4-1-0 {margin-left: 0pt; margin-right: 0pt; text-indent: 0pt; margin-top: 6pt; margin-bottom: 6pt; margin-left: 0pt; text-indent: 0pt; }</xsl:text>
   </xsl:template>

<xsl:template match="numlist/step4" priority="2">
      <table border="0" cellpadding="0" cellspacing="0">
         <xsl:attribute name="style">
            <xsl:variable name="followWith">tab</xsl:variable>
            <xsl:if test="$followWith='tab'">table-layout: fixed; </xsl:if>
         </xsl:attribute>
         <!--Emit class values to reflect conditions-->
         <xsl:attribute name="class">
            <xsl:text> x-step4-1-0</xsl:text> x--zero-left-margins</xsl:attribute>
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
                  <!--Process this element's content-->
                  <xsl:apply-templates select="node()[name(.)!='_sfe:BeforeOrAfterText']"/>
               </td>
            </tr>
         </tbody>
      </table>
   </xsl:template>

<xsl:template name="__style-for_step4.3st4p4292">
      <xsl:text> .x-step4-2-0
{margin-left: 0pt; margin-right: 0pt; text-indent: 0pt; line-height:
14pt; margin-bottom: 6pt; margin-left: 0pt; text-indent: 0pt; }</xsl:text>
   </xsl:template>

<xsl:template match="step4[table/@tabstyle='frac']" priority="1">
      <!--gdb 11-29-12 JIRA-814: added  or name() = 'revst' and following-sibling::*[1][name() = 'warning']...  or name() = 'revst' and following-sibling::*[1][name() = 'caution'] to move change  markup with <warning> or <caution> -->
      <xsl:apply-templates select="node()[self::warning or (self::revst and following-sibling::*[1][self::warning]) or self::caution or (self::revst and following-sibling::*[1][self::caution]) or name() = 'revend']"> </xsl:apply-templates>
      <table border="0" cellpadding="0" cellspacing="0">
         <xsl:attribute name="style">
            <xsl:variable name="followWith">emspace</xsl:variable>
            <xsl:if test="$followWith='tab'">table-layout: fixed; </xsl:if>
         </xsl:attribute>
         <!--Emit class values to reflect conditions-->
         <xsl:attribute name="class">
            <xsl:text> x-step4-2-0</xsl:text> x--zero-left-margins</xsl:attribute>
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
                     <xsl:apply-templates select="_sfe:BeforeOrAfterText[1]"> </xsl:apply-templates>
                  </xsl:if>
               </td>
               <td>
                  <xsl:if test="$itemlabel-colnum=3">
                     <xsl:attribute name="style">word-break: keep-all; </xsl:attribute>
                     <xsl:apply-templates select="_sfe:BeforeOrAfterText[1]"> </xsl:apply-templates>
                  </xsl:if>
                  <!--Process this element's content-->
                  <xsl:apply-templates select="node()[name(.)!='_sfe:BeforeOrAfterText' and name() != 'warning'  and name() != 'caution' ]"/>
               </td>
            </tr>
         </tbody>
      </table>
   </xsl:template>

<xsl:template name="__style-for_step4.3st4p453">
      <xsl:text> .x-step4-3-0 {margin-left:
0pt; margin-right: 0pt; text-indent: 0pt; margin-top: 6pt; margin-bottom:
6pt; margin-left: 0pt; text-indent: 0pt; }</xsl:text>
   </xsl:template>

<xsl:template match="step4" priority="0">
      <!--gdb 11-29-12 JIRA-814: added  or name() = 'revst' and following-sibling::*[1][name() = 'warning']...  or name() = 'revst' and following-sibling::*[1][name() = 'caution'] to move change  markup with <warning> or <caution> -->
      <xsl:apply-templates select="node()[self::warning or (self::revst and following-sibling::*[1][self::warning]) or self::caution or (self::revst and following-sibling::*[1][self::caution]) or name() = 'revend']"> </xsl:apply-templates>
      <table border="0" cellpadding="0" cellspacing="0">
         <xsl:attribute name="style">
            <xsl:variable name="followWith">emspace</xsl:variable>
            <xsl:if test="$followWith='tab'">table-layout: fixed; </xsl:if>
         </xsl:attribute>
         <!--Emit class values to reflect conditions-->
         <xsl:attribute name="class">
            <xsl:text> x-step4-3-0</xsl:text> x--zero-left-margins</xsl:attribute>
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
                     <xsl:apply-templates select="_sfe:BeforeOrAfterText[1]"> </xsl:apply-templates>
                  </xsl:if>
               </td>
               <td>
                  <xsl:if test="$itemlabel-colnum=3">
                     <xsl:attribute name="style">word-break: keep-all; </xsl:attribute>
                     <xsl:apply-templates select="_sfe:BeforeOrAfterText[1]"> </xsl:apply-templates>
                  </xsl:if>
                  <!--Process this element's content-->
                  <xsl:apply-templates select="node()[name(.)!='_sfe:BeforeOrAfterText' and name() != 'warning'  and name() != 'caution' ]"/>
               </td>
            </tr>
         </tbody>
      </table>
   </xsl:template>

<xsl:template name="__style-for_step5.3nuisp5131">
      <xsl:text> .x-step5-1-0 {margin-left: 0pt; margin-right: 0pt; text-indent: 0pt; margin-top: 6pt; margin-bottom: 6pt; margin-left: 0pt; text-indent: 0pt; }</xsl:text>
   </xsl:template>

<xsl:template match="numlist/step5" priority="2">
      <table border="0" cellpadding="0" cellspacing="0">
         <xsl:attribute name="style">
            <xsl:variable name="followWith"/>
            <xsl:if test="$followWith='tab'">table-layout: fixed; </xsl:if>
         </xsl:attribute>
         <!--Emit class values to reflect conditions-->
         <xsl:attribute name="class">
            <xsl:text> x-step5-1-0</xsl:text> x--zero-left-margins</xsl:attribute>
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
                  <!--Process this element's content-->
                  <xsl:apply-templates select="node()[name(.)!='_sfe:BeforeOrAfterText']"/>
               </td>
            </tr>
         </tbody>
      </table>
   </xsl:template>

<xsl:template name="__style-for_step5.3st5p5292">
      <xsl:text> .x-step5-2-0
{margin-left: 0pt; margin-right: 0pt; text-indent: 0pt; line-height:
14pt; margin-bottom: 6pt; margin-left: 0pt; text-indent: 0pt; }</xsl:text>
   </xsl:template>

<xsl:template match="step5[table/@tabstyle='frac']" priority="1">
      <!--gdb 11-29-12 JIRA-814: added  or name() = 'revst' and following-sibling::*[1][name() = 'warning']...  or name() = 'revst' and following-sibling::*[1][name() = 'caution'] to move change  markup with <warning> or <caution> -->
      <xsl:apply-templates select="node()[self::warning or (self::revst and following-sibling::*[1][self::warning]) or self::caution or (self::revst and following-sibling::*[1][self::caution]) or name() = 'revend']"> </xsl:apply-templates>
      <table border="0" cellpadding="0" cellspacing="0">
         <xsl:attribute name="style">
            <xsl:variable name="followWith"/>
            <xsl:if test="$followWith='tab'">table-layout: fixed; </xsl:if>
         </xsl:attribute>
         <!--Emit class values to reflect conditions-->
         <xsl:attribute name="class">
            <xsl:text> x-step5-2-0</xsl:text> x--zero-left-margins</xsl:attribute>
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
                     <xsl:apply-templates select="_sfe:BeforeOrAfterText[1]"/>
                  </xsl:if>
               </td>
               <td align="{$col2-align}">
                  <xsl:if test="$itemlabel-colnum=2">
                     <xsl:attribute name="style">word-break: keep-all; </xsl:attribute>
                     <xsl:apply-templates select="_sfe:BeforeOrAfterText[1]"> </xsl:apply-templates>
                  </xsl:if>
               </td>
               <td>
                  <xsl:if test="$itemlabel-colnum=3">
                     <xsl:attribute name="style">word-break: keep-all; </xsl:attribute>
                     <xsl:apply-templates select="_sfe:BeforeOrAfterText[1]"> </xsl:apply-templates>
                  </xsl:if>
                  <!--Process this element's content-->
                  <xsl:apply-templates select="node()[name(.)!='_sfe:BeforeOrAfterText' and name() != 'warning'  and name() != 'caution' ]"/>
               </td>
            </tr>
         </tbody>
      </table>
   </xsl:template>

<xsl:template name="__style-for_step5.3st5p553">
      <xsl:text> .x-step5-3-0 {margin-left:
0pt; margin-right: 0pt; text-indent: 0pt; margin-top: 6pt; margin-bottom:
6pt; margin-left: 0pt; text-indent: 0pt; }</xsl:text>
   </xsl:template>

<xsl:template match="step5" priority="0">
      <!--gdb 11-29-12 JIRA-814: added  or name() = 'revst' and following-sibling::*[1][name() = 'warning']...  or name() = 'revst' and following-sibling::*[1][name() = 'caution'] to move change  markup with <warning> or <caution> -->
      <xsl:apply-templates select="node()[self::warning or (self::revst and following-sibling::*[1][self::warning]) or self::caution or (self::revst and following-sibling::*[1][self::caution]) or name() = 'revend']"> </xsl:apply-templates>
      <table border="0" cellpadding="0" cellspacing="0">
         <xsl:attribute name="style">
            <xsl:variable name="followWith"/>
            <xsl:if test="$followWith='tab'">table-layout: fixed; </xsl:if>
         </xsl:attribute>
         <!--Emit class values to reflect conditions-->
         <xsl:attribute name="class">
            <xsl:text> x-step5-3-0</xsl:text> x--zero-left-margins</xsl:attribute>
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
                  <!--Process this element's content-->
                  <xsl:apply-templates select="node()[name(.)!='_sfe:BeforeOrAfterText' and name() != 'warning'  and name() != 'caution' ]"/>
               </td>
            </tr>
         </tbody>
      </table>
   </xsl:template>

<xsl:template name="__style-for_subattach.1">
      <xsl:text> .x-subattach-1-0 {margin-left: 0pt; margin-right: 0pt; text-indent: 0pt; }</xsl:text>
   </xsl:template>

<xsl:template match="subattach" priority="0">
      <div>
         <!--Emit class values to reflect conditions-->
         <xsl:attribute name="class">
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

<xsl:template name="__style-for_supp-code.1">
      <xsl:text> .x-supp-code-1-0 {margin-left: 0pt; margin-right: 0pt; text-indent: 0pt; }</xsl:text>
   </xsl:template>

<xsl:template match="supp-code" priority="0">
      <div>
         <!--Emit class values to reflect conditions-->
         <xsl:attribute name="class">
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

<xsl:template name="__style-for_supp-pn.1">
      <xsl:text> .x-supp-pn-1-0 {margin-left: 0pt; margin-right: 0pt; text-indent: 0pt; }</xsl:text>
   </xsl:template>

<xsl:template match="supp-pn" priority="0">
      <div>
         <!--Emit class values to reflect conditions-->
         <xsl:attribute name="class">
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

<xsl:template match="_ufe:supplier-list-title" priority="0">
  <div ch:title="notoc" class=" x--ufe-supplier-list-title-4-0">
    <xsl:call-template name="t-base-div-title"/>
  </div>
</xsl:template>

<xsl:template match="pbfmatr//_ufe:task-title" priority="1">
  <div ch:title="notoc" class=" x--ufe-task-title-3-0">
    <xsl:call-template name="t-base-div-title"/>
  </div>
</xsl:template>

<xsl:template match="_ufe:temp-rev-title" priority="0">
  <div ch:title="toc" class=" x--ufe-temp-rev-title-3-0">
    <xsl:call-template name="t-base-div-title"/>
  </div>
</xsl:template>

<xsl:template match="book[contains(@doctype, 'ipc')]/frontmatter//figure/title" priority="68">
  <div ch:title="toc" class=" x-title-5-0">
    <xsl:call-template name="t-base-div-title"/>
  </div>
</xsl:template>

<xsl:template match="module[@module-name='Airworthiness_Limits']/pgblk/title" priority="65">
  <div ch:title="notoc" class=" x-title-8-0">
    <xsl:call-template name="t-base-div-title"/>
  </div>
</xsl:template>

<xsl:template match="page-block[@pb-name='ni']//mfmatr/title" priority="56">
  <div ch:title="notoc" class=" x-title-17-0">
    <xsl:call-template name="t-base-div-title"/>
  </div>
</xsl:template>

<xsl:template match="page-block[@pb-name='record-of-revisions']//n-para/title" priority="55">
  <div ch:title="toc" class=" x-title-18-0">
    <xsl:call-template name="t-base-div-title"/>
  </div>
</xsl:template>

<xsl:template match="book[contains(@doctype, 'epc')]//figure/title" priority="54">
  <div ch:title="notoc" class=" x-title-19-0">
    <xsl:call-template name="t-base-div-title"/>
  </div>
</xsl:template>

<xsl:template match="book[contains(@doctype, 'epc')]//graphic/title" priority="53">
  <div ch:title="notoc" class=" x-title-20-0">
    <xsl:call-template name="t-base-div-title"/>
  </div>
</xsl:template>

<xsl:template match="book[contains(@doctype, 'ipc')]//figure/title" priority="52">
  <div ch:title="toc" class=" x-title-21-0">
    <xsl:call-template name="t-base-div-title"/>
  </div>
</xsl:template>

<xsl:template match="pbfmatr/title" priority="40">
      <xsl:param name="hidden" select="'yes'"/>
      <!--Dynamically determine the fo-class-->
      <xsl:variable name="foClass">
         <xsl:choose>
            <xsl:when test="((ancestor-or-self::pwcpbfront[1]/title)) and ((ancestor-or-self::pwcpbfront[1]/pbfmatr))">hidden</xsl:when>
            <xsl:otherwise>hidden-block</xsl:otherwise>
         </xsl:choose>
      </xsl:variable>
      <xsl:variable name="blockness">block</xsl:variable>
      <xsl:variable name="hiddenness">yes</xsl:variable>
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
            <xsl:when test="true()">
               <!--This is the "otherwise" clause, but there may be no when's-->
               <xsl:value-of select="$foClass"/>
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
      <!--Execute the appropriate code for the dynamically determined fo-class-->
      <xsl:choose>
         <xsl:when test="$fo-class='hidden-block'">
            <div>
               <!--Emit class values to reflect conditions-->
               <xsl:attribute name="class">
                  <xsl:text> x-title-33-0</xsl:text>
                  <xsl:if test="((ancestor-or-self::pwcpbfront[1]/title)) and ((ancestor-or-self::pwcpbfront[1]/pbfmatr))"> x-title-33-1</xsl:if>
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
            </div>
         </xsl:when>
         <xsl:when test="$fo-class='block'">
            <div>
               <!--Emit class values to reflect conditions-->
               <xsl:attribute name="class">
                  <xsl:text> x-title-33-0</xsl:text>
                  <xsl:if test="((ancestor-or-self::pwcpbfront[1]/title)) and ((ancestor-or-self::pwcpbfront[1]/pbfmatr))"> x-title-33-1</xsl:if>
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
               <xsl:call-template name="maybe-set-id"/>
               <!--Process this element's content-->
               <xsl:apply-templates/>
            </div>
         </xsl:when>
      </xsl:choose>
   </xsl:template>

<xsl:template match="pwcpbfront/title" priority="39">
  <div ch:title="notoc" class=" x-title-34-0">
    <xsl:call-template name="t-base-div-title"/>
  </div>
</xsl:template>

<xsl:template match="intro/title" priority="36">
      <xsl:param name="hidden" select="'yes'"/>
      <xsl:if test="$hidden='no'">
         <div>
            <!--Emit class values to reflect conditions-->
            <xsl:attribute name="class">
               <xsl:text> x-title-37-0</xsl:text>
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
         </div>
      </xsl:if>
   </xsl:template>

<xsl:template match="pwcspblist/title" priority="35">
  <div ch:title="notoc" class=" x-title-38-0">
    <xsl:call-template name="t-base-div-title"/>
  </div>
</xsl:template>

<xsl:template match="sblist/title" priority="32">
  <div ch:title="notoc" class=" x-title-41-0">
    <xsl:call-template name="t-base-div-title"/>
  </div>
</xsl:template>

<xsl:template match="pwcni/title" priority="31">
  <div ch:title="notoc" class=" x-title-42-0">
    <xsl:call-template name="t-base-div-title"/>
  </div>
</xsl:template>

<xsl:template match="vendlist/title" priority="30">
  <div ch:title="notoc" class=" x-title-43-0">
    <xsl:call-template name="t-base-div-title"/>
  </div>
</xsl:template>

<xsl:template match="pgblk/title" priority="29">
  <div ch:title="notoc" class=" x-title-44-0">
    <xsl:call-template name="t-base-div-title"/>
  </div>
</xsl:template>

<xsl:template match="lof-item/title" priority="21">
  <div ch:title="notoc" class=" x-title-52-0">
    <xsl:call-template name="t-base-div-title"/>
  </div>
</xsl:template>

<xsl:template match="lof/title" priority="18">
  <div ch:title="notoc" class=" x-title-55-0">
    <xsl:call-template name="t-base-div-title"/>
  </div>
</xsl:template>

<xsl:template match="spb-list/title" priority="14">
  <div ch:title="toc" class=" x-title-59-0">
    <xsl:call-template name="t-base-div-title"/>
  </div>
</xsl:template>

<xsl:template match="service-bull-list/title" priority="10">
  <div ch:title="toc" class=" x-title-63-0">
    <xsl:call-template name="t-base-div-title"/>
  </div>
</xsl:template>

<xsl:template match="module/title" priority="9">
  <div ch:title="toc" class=" x-title-64-0">
    <xsl:call-template name="t-base-div-title"/>
  </div>
</xsl:template>

<xsl:template match="num-index/title" priority="7">
  <div ch:title="toc" class=" x-title-66-0">
    <xsl:call-template name="t-base-div-title"/>
  </div>
</xsl:template>

<xsl:template match="_ufe:tmm-title" priority="0">
  <div ch:title="notoc">
     <xsl:attribute name="class">
        <xsl:text> x--ufe-tmm-title-3-0</xsl:text>
        <xsl:if test="contains(//book/@doctype, 'lmm')"> x--ufe-tmm-title-3-1</xsl:if>
     </xsl:attribute>
     <xsl:call-template name="t-base-div-title"/>
  </div>
</xsl:template>

<xsl:template match="unit-title" priority="0">
  <xsl:apply-templates/>
</xsl:template>

</xsl:stylesheet>
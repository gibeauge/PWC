<?xml version="1.0" encoding="UTF-8"?><xsl:stylesheet xmlns:simg="java:net.sf.docbook.saxon.ImageIntrinsics" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:ximg="xaln://com.nwalsh.xalan.ImageIntrinsics" xmlns="http://www.w3.org/1999/xhtml" xmlns:exslt="http://exslt.org/common" xmlns:_acl="java:com.arbortext.epic.Acl" xmlns:msxsl="urn:schemas-microsoft-com:xslt" xmlns:_="http://www.pwc.ca/namespace/doctypes/emipc" xmlns:_dtd="http://www.arbortext.com/namespace/Styler/UserElements" xmlns:atidlm="http://www.arbortext.com/namespace/atidlm" xmlns:_2="http://www.pwc.ca/namespace/doctypes/jmtosmigrate" xmlns:ch="http://www.arbortext.com/namespace/chunker" xmlns:saxon="http://saxon.sf.net/" xmlns:_5="http://www.pwc.ca/namespace/doctypes/ipc" xmlns:_gte="http://www.arbortext.com/namespace/Styler/GeneratedTextElements" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:_sfe="http://www.arbortext.com/namespace/Styler/StylerFormattingElements" xmlns:_js="java:com.arbortext.epic.internal.js.JavaScript" xmlns:_3="http://www.pwc.ca/namespace/doctypes/migrate" xmlns:_ufe="http://www.arbortext.com/namespace/Styler/UserFormattingElements" version="1.0" exclude-result-prefixes="_ atidlm xml _2 ch saxon _5 xsi _js _3 #default exslt msxsl _dtd _ufe _sfe _gte simg ximg _acl">

<xsl:include href="jmtosmigrate_expand-gentext.xsl"/>
<xsl:include href="jmtosmigrate_set-countas.xsl"/>
<xsl:include href="jmtosmigrate_styler-collect-footnotes.xsl"/>
<xsl:include href="jmtosmigrate_toc-mode-Table_of_Contents.xsl"/>
<xsl:include href="jmtosmigrate_styler_numbering.xsl"/>
<xsl:include href="jmtosmigrate_styler-LabelAndNumberMarker.xsl"/>
<xsl:include href="jmtosmigrate_styler_xref-Label_Number.xsl"/>
<xsl:include href="jmtosmigrate_styler_xref-Label_Number_Text.xsl"/>
<xsl:include href="jmtosmigrate_styler_xref-Label_Number_Text_Page.xsl"/>
<xsl:include href="jmtosmigrate_styler_xref-Number.xsl"/>
<xsl:include href="jmtosmigrate_styler_xref-Number_Text.xsl"/>
<xsl:include href="jmtosmigrate_styler_xref-Page.xsl"/>
<xsl:include href="jmtosmigrate_styler_xref-Text.xsl"/>
<xsl:include href="jmtosmigrate_startat-xpath.xsl"/>

<xsl:output encoding="UTF-8" method="html" omit-xml-declaration="yes" indent="yes"/>

<xsl:variable name="doctype" select="'jmtosmigrate'"/>

<xsl:include href="base.xsl"/>

<xsl:include href="process.xsl"/>

<xsl:template name="__style-for_ais-item.1">
      <xsl:text> .x-ais-item-1-0 {margin-left: 0pt; margin-right: 0pt; }</xsl:text>
   </xsl:template>

<xsl:template match="ais-item" priority="0">
      <!--Emit a nostyle template-->
      <xsl:apply-templates/>
   </xsl:template>

<xsl:template name="__style-for_ais-list.1">
      <xsl:text> .x-ais-list-1-0 {margin-left: 0pt; margin-right: 0pt; }</xsl:text>
   </xsl:template>

<xsl:template match="ais-list" priority="0">
      <xsl:param name="hidden" select="'yes'"/>
      <xsl:if test="$hidden='no'">
         <span>
            <!--Emit class values to reflect conditions-->
            <xsl:attribute name="class">
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

<xsl:template name="__style-for_aisnbr.1">
      <xsl:text> .x-aisnbr-1-0 {margin-left: 0pt; margin-right: 0pt; }</xsl:text>
   </xsl:template>

<xsl:template match="aisnbr" priority="0">
      <!--Emit a nostyle template-->
      <xsl:apply-templates/>
   </xsl:template>

<xsl:template name="__style-for_aistitle.1">
      <xsl:text> .x-aistitle-1-0 {margin-left: 0pt; margin-right: 0pt; }</xsl:text>
   </xsl:template>

<xsl:template match="aistitle" priority="0">
      <!--Emit a nostyle template-->
      <xsl:apply-templates/>
   </xsl:template>

<xsl:template match="_ufe:cir-title" priority="0">
      <div>
         <xsl:attribute name="ch:title">toc</xsl:attribute>
         <!--Emit class values to reflect conditions-->
         <xsl:attribute name="class">
            <xsl:text> x--ufe-cir-title-3-0</xsl:text>
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
         <!--Process this element's content-->
         <xsl:apply-templates/>
      </div>
   </xsl:template>

<xsl:template name="__style-for_con.1">
      <xsl:text> .x-con-1-0 {margin-left: 0pt; margin-right: 0pt; } .x-con-1-1 {}</xsl:text>
   </xsl:template>

<xsl:template match="con" priority="0">
      <xsl:param name="hidden" select="'yes'"/>
      <xsl:variable name="foClass">hidden-inline</xsl:variable>
      <xsl:variable name="blockness">inline</xsl:variable>
      <xsl:variable name="hiddenness">yes</xsl:variable>
      <span>
         <!--Emit class values to reflect conditions-->
         <xsl:attribute name="class">
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
      </span>
   </xsl:template>

<xsl:template name="__style-for_conindex.1">
      <xsl:text> .x-conindex-1-0 {margin-left: 0pt; margin-right: 0pt; }</xsl:text>
   </xsl:template>

<xsl:template match="conindex" priority="0">
      <!--Emit a nostyle template-->
      <xsl:apply-templates/>
   </xsl:template>

<xsl:template name="__style-for_conname.1">
      <xsl:text> .x-conname-1-0 {margin-left: 0pt; margin-right: 0pt; }</xsl:text>
   </xsl:template>

<xsl:template match="conname" priority="0">
      <span>
         <!--Emit class values to reflect conditions-->
         <xsl:attribute name="class">
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

<xsl:template name="__style-for_connbr.1">
      <xsl:text> .x-connbr-1-0 {margin-left: 0pt; margin-right: 0pt; }</xsl:text>
   </xsl:template>

<xsl:template match="connbr" priority="0">
      <span>
         <!--Emit class values to reflect conditions-->
         <xsl:attribute name="class">
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

<xsl:template name="__style-for_csn.1">
      <xsl:text> .x-csn-1-0 {margin-left: 0pt; margin-right: 0pt; }</xsl:text>
   </xsl:template>

<xsl:template match="csn" priority="0">
      <span>
         <!--Emit class values to reflect conditions-->
         <xsl:attribute name="class">
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

<xsl:template name="__style-for_dtlname.1">
      <xsl:text> .x-dtlname-1-0 {margin-left: 0pt; margin-right: 0pt; }</xsl:text>
   </xsl:template>

<xsl:template match="dtlname" priority="0">
      <span>
         <!--Emit class values to reflect conditions-->
         <xsl:attribute name="class">
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

<xsl:template name="__style-for_dtlnbr.1">
      <xsl:text> .x-dtlnbr-1-0 {margin-left: 0pt; margin-right: 0pt; }</xsl:text>
   </xsl:template>

<xsl:template match="dtlnbr" priority="0">
      <span>
         <!--Emit class values to reflect conditions-->
         <xsl:attribute name="class">
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

<xsl:template name="__style-for_effect.2pgkect121">
      <xsl:text> .x-effect-1-0 {margin-left: 0pt; margin-right: 0pt; text-indent: 0pt; font-weight: bold; margin-top: 4pt; margin-bottom: 4pt; }</xsl:text>
   </xsl:template>

<xsl:template match="pgblk/effect" priority="1">
      <div>
         <!--Emit class values to reflect conditions-->
         <xsl:attribute name="class">
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

<xsl:template name="__style-for_effect.2efctct62">
      <xsl:text> .x-effect-2-0 {margin-left: 0pt; margin-right: 0pt; font-weight: bold; }</xsl:text>
   </xsl:template>

<xsl:template match="effect" priority="0">
      <span>
         <!--Emit class values to reflect conditions-->
         <xsl:attribute name="class">
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
      <div>
         <xsl:attribute name="ch:title">notoc</xsl:attribute>
         <!--Emit class values to reflect conditions-->
         <xsl:attribute name="class">
            <xsl:text> x--ufe-eipc-title-3-0</xsl:text>
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
         <!--Process this element's content-->
         <xsl:apply-templates/>
      </div>
   </xsl:template>

<xsl:template match="_ufe:em-title" priority="0">
      <div>
         <xsl:attribute name="ch:title">toc</xsl:attribute>
         <!--Emit class values to reflect conditions-->
         <xsl:attribute name="class">
            <xsl:text> x--ufe-em-title-3-0</xsl:text>
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
         <!--Process this element's content-->
         <xsl:apply-templates/>
      </div>
   </xsl:template>

<xsl:template name="__style-for_equ.2eqqu171">
      <xsl:text> .x-equ-1-0 {margin-left: 0pt; margin-right: 0pt; text-indent: 0pt; margin-bottom: 8pt; }</xsl:text>
   </xsl:template>

<xsl:template match="equ[child::table]" priority="1">
      <div>
         <!--Emit class values to reflect conditions-->
         <xsl:attribute name="class">
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

<xsl:template name="__style-for_equ.2eqqu32">
      <xsl:text> .x-equ-2-0 {margin-left: 0pt; margin-right: 0pt; text-indent: 0pt; }</xsl:text>
   </xsl:template>

<xsl:template match="equ" priority="0">
      <div>
         <!--Emit class values to reflect conditions-->
         <xsl:attribute name="class">
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

<xsl:template name="__style-for_ftnote.1">
      <xsl:text> .x-ftnote-1-0 {margin-left: 0pt; margin-right: 0pt; }</xsl:text>
   </xsl:template>

<xsl:template match="ftnote" priority="0">
      <!--Emit a nostyle template-->
      <xsl:apply-templates/>
   </xsl:template>

<xsl:template name="__style-for_gdesc.1">
      <xsl:text> .x-gdesc-1-0 {margin-left: 0pt; margin-right: 0pt; text-indent: 0pt; }</xsl:text>
   </xsl:template>

<xsl:template match="gdesc" priority="0">
      <div>
         <!--Emit class values to reflect conditions-->
         <xsl:attribute name="class">
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

<xsl:template match="_ufe:glossary-title" priority="0">
      <div>
         <xsl:attribute name="ch:title">notoc</xsl:attribute>
         <!--Emit class values to reflect conditions-->
         <xsl:attribute name="class">
            <xsl:text> x--ufe-glossary-title-4-0</xsl:text>
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
         <!--Process this element's content-->
         <xsl:apply-templates/>
      </div>
   </xsl:template>

<xsl:template name="__style-for_graphic.2grhiic261">
      <xsl:text> .x-graphic-1-0
{margin-left: 0pt; margin-right: 0pt; text-indent: 0pt; margin-top:
8pt; }</xsl:text>
   </xsl:template>

<xsl:template match="graphic[descendant::sheet]" priority="1">
      <div style="display:none">
         <!--Emit class values to reflect conditions-->
         <xsl:attribute name="class">
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
      </a>
   </xsl:template>

<xsl:template name="__style-for_graphic.2grhiic72">
      <xsl:text> .x-graphic-2-0 {margin-left: 0pt; margin-right: 0pt; text-indent: 0pt; margin-top: 8pt; }</xsl:text>
   </xsl:template>

<xsl:template match="graphic" priority="0">
      <div>
         <!--Emit class values to reflect conditions-->
         <xsl:attribute name="class">
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

<xsl:template name="__style-for_grphcref.1">
      <xsl:text> .x-grphcref-1-0 {margin-left:
0pt; margin-right: 0pt; }</xsl:text>
   </xsl:template>

<xsl:template match="grphcref" priority="0">
      <span>
         <!--Emit class values to reflect conditions-->
         <xsl:attribute name="class">
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
         <xsl:apply-templates> </xsl:apply-templates>
         <a>
            <!--<xsl:attribute name="href">              
          <xsl:text>#styler-id</xsl:text> 
                       <xsl:apply-templates
mode="set-id" select="."></xsl:apply-templates
>                   </xsl:attribute>-->
            <xsl:attribute name="href">
               <xsl:text>#none</xsl:text>
            </xsl:attribute>
            <xsl:attribute name="onClick">
               <xsl:text>displayGraphics('</xsl:text>
               <xsl:text>styler-id</xsl:text>
               <xsl:apply-templates mode="set-id" select="id(@refid)"> </xsl:apply-templates>
               <xsl:text>');</xsl:text>
            </xsl:attribute>
            <xsl:text> </xsl:text>
            <xsl:apply-templates mode="styler_numbering" select="id(@refid)/title"/>
         </a>
         <xsl:if test="(@sheetnbr) and (not(@sheetnbr) or (@sheetnbr and string(@sheetnbr)!=''))">
            <xsl:text> Sheet </xsl:text>
            <xsl:value-of select="@sheetnbr"/>
         </xsl:if>
         <xsl:value-of select="@post-auto-text"/>
      </span>
   </xsl:template>

<xsl:template name="__style-for_hotlink.1">
      <xsl:text> .x-hotlink-1-0 {margin-left: 0pt; margin-right: 0pt; }</xsl:text>
   </xsl:template>

<xsl:template match="hotlink" priority="0">
      <!--Emit a nostyle template-->
      <xsl:apply-templates/>
   </xsl:template>

<xsl:template name="__style-for_howtouse.1">
      <xsl:text> .x-howtouse-1-0 {margin-left: 0pt; margin-right: 0pt; text-indent: 0pt; margin-top: 8pt; }</xsl:text>
   </xsl:template>

<xsl:template match="howtouse" priority="0">
      <div>
         <!--Emit class values to reflect conditions-->
         <xsl:attribute name="class">
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

<xsl:template match="_ufe:howtouse-title" priority="0">
      <div>
         <xsl:attribute name="ch:title">toc</xsl:attribute>
         <!--Emit class values to reflect conditions-->
         <xsl:attribute name="class">
            <xsl:text> x--ufe-howtouse-title-3-0</xsl:text>
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
         <!--Process this element's content-->
         <xsl:apply-templates/>
      </div>
   </xsl:template>

<xsl:template name="__style-for_ics.1">
      <xsl:text> .x-ics-1-0 {margin-left: 0pt; margin-right: 0pt; text-indent: 0pt; margin-top: 6pt; margin-bottom: 6pt; }</xsl:text>
   </xsl:template>

<xsl:template match="ics" priority="0">
      <xsl:variable name="foClass">definitionListItem</xsl:variable>
      <xsl:variable name="blockness">block</xsl:variable>
      <xsl:variable name="startnew"/>
      <xsl:variable name="newpageset">#noChange</xsl:variable>
      <xsl:apply-templates/>
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

<xsl:template name="__style-for_increv.1">
      <xsl:text> .x-increv-1-0 {margin-left: 0pt; margin-right: 0pt; }</xsl:text>
   </xsl:template>

<xsl:template match="increv" priority="0">
      <!--Emit a nostyle template-->
      <xsl:apply-templates/>
   </xsl:template>

<xsl:template match="_ufe:intro-title" priority="0">
      <div>
         <xsl:attribute name="ch:title">toc</xsl:attribute>
         <!--Emit class values to reflect conditions-->
         <xsl:attribute name="class">
            <xsl:text> x--ufe-intro-title-3-0</xsl:text>
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
         <!--Process this element's content-->
         <xsl:apply-templates/>
      </div>
   </xsl:template>

<xsl:template name="__style-for_issdate.1">
      <xsl:text> .x-issdate-1-0 {margin-left: 0pt; margin-right: 0pt; }</xsl:text>
   </xsl:template>

<xsl:template match="issdate" priority="0">
      <!--Emit a nostyle template-->
      <xsl:apply-templates/>
   </xsl:template>

<xsl:template name="__style-for_l1item.5pbatem441">
      <xsl:text> .x-l1item-1-0
{margin-left: 0pt; margin-right: 0pt; text-indent: 0pt; margin-top:
6pt; margin-bottom: 6pt; margin-left: 0pt; text-indent: 0pt; }</xsl:text>
   </xsl:template>

<xsl:template match="pbfmatr//list1/l1item[child::*[1] != 'note']" priority="4">
      <table border="0" cellpadding="0" cellspacing="0">
         <xsl:attribute name="style">
            <xsl:variable name="followWith">emspace</xsl:variable>
            <xsl:if test="$followWith='tab'">table-layout: fixed; </xsl:if>
         </xsl:attribute>
         <!--Emit class values to reflect conditions-->
         <xsl:attribute name="class">
            <xsl:text> x-l1item-1-0</xsl:text> x--zero-left-margins</xsl:attribute>
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
                  <xsl:apply-templates select="node()[name(.)!='_sfe:BeforeOrAfterText' and name() != 'warning' and name() != 'caution']"> </xsl:apply-templates>
               </td>
            </tr>
         </tbody>
      </table>
   </xsl:template>

<xsl:template name="__style-for_l1item.5pbatem212">
      <xsl:text> .x-l1item-2-0
{margin-left: 0pt; margin-right: 0pt; text-indent: 0pt; margin-top:
6pt; margin-bottom: 6pt; margin-left: 0pt; text-indent: 0pt; }</xsl:text>
   </xsl:template>

<xsl:template match="pbfmatr//list1/l1item" priority="3">
      <table border="0" cellpadding="0" cellspacing="0">
         <xsl:attribute name="style">
            <xsl:variable name="followWith">emspace</xsl:variable>
            <xsl:if test="$followWith='tab'">table-layout: fixed; </xsl:if>
         </xsl:attribute>
         <!--Emit class values to reflect conditions-->
         <xsl:attribute name="class">
            <xsl:text> x-l1item-2-0</xsl:text> x--zero-left-margins</xsl:attribute>
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
                  <xsl:apply-templates select="node()[name(.)!='_sfe:BeforeOrAfterText' and name() != 'warning' and name() != 'caution' and name() != 'note']"> </xsl:apply-templates>
               </td>
            </tr>
         </tbody>
      </table>
   </xsl:template>

<xsl:template name="__style-for_l1item.3li1lem351">
      <xsl:text> .x-l1item-1-0
{margin-left: 0pt; margin-right: 0pt; text-indent: 0pt; margin-top:
6pt; margin-bottom: 6pt; margin-left: 0pt; text-indent: 0pt; }</xsl:text>
   </xsl:template>

<xsl:template match="list1/l1item[child::*[1] != 'note']" priority="2">
      <xsl:apply-templates select="node()[name() = 'warning' or name() = 'caution' ]"> </xsl:apply-templates>
      <table border="0" cellpadding="0" cellspacing="0">
         <xsl:attribute name="style">
            <xsl:variable name="followWith">emspace</xsl:variable>
            <xsl:if test="$followWith='tab'">table-layout: fixed; </xsl:if>
         </xsl:attribute>
         <!--Emit class values to reflect conditions-->
         <xsl:attribute name="class">
            <xsl:text> x-l1item-1-0</xsl:text> x--zero-left-margins</xsl:attribute>
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
                  <xsl:apply-templates select="node()[name(.)!='_sfe:BeforeOrAfterText' and name() != 'warning' and name() != 'caution' ]"/>
               </td>
            </tr>
         </tbody>
      </table>
   </xsl:template>

<xsl:template name="__style-for_l1item.2li1lem121">
      <xsl:text> .x-l1item-1-0
{margin-left: 0pt; margin-right: 0pt; text-indent: 0pt; margin-top:
6pt; margin-bottom: 6pt; margin-left: 0pt; text-indent: 0pt; }</xsl:text>
   </xsl:template>

<xsl:template match="list1/l1item" priority="1">
      <xsl:apply-templates select="node()[name() = 'warning' or name() = 'caution' or name() = 'note' ]"> </xsl:apply-templates>
      <table border="0" cellpadding="0" cellspacing="0">
         <xsl:attribute name="style">
            <xsl:variable name="followWith">emspace</xsl:variable>
            <xsl:if test="$followWith='tab'">table-layout: fixed; </xsl:if>
         </xsl:attribute>
         <!--Emit class values to reflect conditions-->
         <xsl:attribute name="class">
            <xsl:text> x-l1item-1-0</xsl:text> x--zero-left-margins</xsl:attribute>
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
                  <xsl:apply-templates select="node()[name(.)!='_sfe:BeforeOrAfterText' and name() != 'warning' and name() != 'caution' and name() != 'note' ]"/>
               </td>
            </tr>
         </tbody>
      </table>
   </xsl:template>

<xsl:template name="__style-for_l1item.5l1emem65">
      <xsl:text> .x-l1item-5-0 {margin-left: 0pt; margin-right: 0pt; text-indent: 0pt; margin-top: 6pt; margin-bottom: 6pt; margin-left: 0pt; text-indent: 0pt; }</xsl:text>
   </xsl:template>

<xsl:template match="l1item" priority="0">
      <table border="0" cellpadding="0" cellspacing="0">
         <xsl:attribute name="style">
            <xsl:variable name="followWith"/>
            <xsl:if test="$followWith='tab'">table-layout: fixed; </xsl:if>
         </xsl:attribute>
         <!--Emit class values to reflect conditions-->
         <xsl:attribute name="class">
            <xsl:text> x-l1item-5-0</xsl:text> x--zero-left-margins</xsl:attribute>
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

<xsl:template name="__style-for_l2item.5pbatem441">
      <xsl:text> .x-l2item-1-0
{margin-left: 0pt; margin-right: 0pt; text-indent: 0pt; margin-top:
6pt; margin-bottom: 6pt; margin-left: 0pt; text-indent: 0pt; }</xsl:text>
   </xsl:template>

<xsl:template match="pbfmatr//list2/l2item[child::*[1] != 'note']" priority="4">
      <table border="0" cellpadding="0" cellspacing="0">
         <xsl:attribute name="style">
            <xsl:variable name="followWith">emspace</xsl:variable>
            <xsl:if test="$followWith='tab'">table-layout: fixed; </xsl:if>
         </xsl:attribute>
         <!--Emit class values to reflect conditions-->
         <xsl:attribute name="class">
            <xsl:text> x-l2item-1-0</xsl:text> x--zero-left-margins</xsl:attribute>
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
                     <xsl:apply-templates select="_sfe:BeforeOrAfterText[1]"> </xsl:apply-templates>
                  </xsl:if>
               </td>
               <td>
                  <xsl:if test="$itemlabel-colnum=3">
                     <xsl:attribute name="style">word-break: keep-all; </xsl:attribute>
                     <xsl:apply-templates select="_sfe:BeforeOrAfterText[1]"> </xsl:apply-templates>
                  </xsl:if>
                  <!--Process this element's content-->
                  <xsl:apply-templates select="node()[name(.)!='_sfe:BeforeOrAfterText' and name() != 'warning' and name() != 'caution']"> </xsl:apply-templates>
               </td>
            </tr>
         </tbody>
      </table>
   </xsl:template>

<xsl:template name="__style-for_l2item.5pbatem212">
      <xsl:text> .x-l2item-2-0
{margin-left: 0pt; margin-right: 0pt; text-indent: 0pt; margin-top:
6pt; margin-bottom: 6pt; margin-left: 0pt; text-indent: 0pt; }</xsl:text>
   </xsl:template>

<xsl:template match="pbfmatr//list2/l2item" priority="3">
      <table border="0" cellpadding="0" cellspacing="0">
         <xsl:attribute name="style">
            <xsl:variable name="followWith">emspace</xsl:variable>
            <xsl:if test="$followWith='tab'">table-layout: fixed; </xsl:if>
         </xsl:attribute>
         <!--Emit class values to reflect conditions-->
         <xsl:attribute name="class">
            <xsl:text> x-l2item-2-0</xsl:text> x--zero-left-margins</xsl:attribute>
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
                     <xsl:apply-templates select="_sfe:BeforeOrAfterText[1]"> </xsl:apply-templates>
                  </xsl:if>
               </td>
               <td>
                  <xsl:if test="$itemlabel-colnum=3">
                     <xsl:attribute name="style">word-break: keep-all; </xsl:attribute>
                     <xsl:apply-templates select="_sfe:BeforeOrAfterText[1]"> </xsl:apply-templates>
                  </xsl:if>
                  <!--Process this element's content-->
                  <xsl:apply-templates select="node()[name(.)!='_sfe:BeforeOrAfterText' and name() != 'warning' and name() != 'caution' and name() != 'note']"> </xsl:apply-templates>
               </td>
            </tr>
         </tbody>
      </table>
   </xsl:template>

<xsl:template name="__style-for_l2item.3li2lem351">
      <xsl:text> .x-l2item-1-0
{margin-left: 0pt; margin-right: 0pt; text-indent: 0pt; margin-top:
6pt; margin-bottom: 6pt; margin-left: 0pt; text-indent: 0pt; }</xsl:text>
   </xsl:template>

<xsl:template match="list2/l2item[child::*[1] != 'note']" priority="2">
      <xsl:apply-templates select="node()[name() = 'warning' or name() = 'caution' ]"> </xsl:apply-templates>
      <table border="0" cellpadding="0" cellspacing="0">
         <xsl:attribute name="style">
            <xsl:variable name="followWith">emspace</xsl:variable>
            <xsl:if test="$followWith='tab'">table-layout: fixed; </xsl:if>
         </xsl:attribute>
         <!--Emit class values to reflect conditions-->
         <xsl:attribute name="class">
            <xsl:text> x-l2item-1-0</xsl:text> x--zero-left-margins</xsl:attribute>
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
                     <xsl:apply-templates select="_sfe:BeforeOrAfterText[1]"> </xsl:apply-templates>
                  </xsl:if>
               </td>
               <td>
                  <xsl:if test="$itemlabel-colnum=3">
                     <xsl:attribute name="style">word-break: keep-all; </xsl:attribute>
                     <xsl:apply-templates select="_sfe:BeforeOrAfterText[1]"> </xsl:apply-templates>
                  </xsl:if>
                  <!--Process this element's content-->
                  <xsl:apply-templates select="node()[name(.)!='_sfe:BeforeOrAfterText' and name() != 'warning' and name() != 'caution' ]"/>
               </td>
            </tr>
         </tbody>
      </table>
   </xsl:template>

<xsl:template name="__style-for_l2item.2li2lem121">
      <xsl:text> .x-l2item-1-0
{margin-left: 0pt; margin-right: 0pt; text-indent: 0pt; margin-top:
6pt; margin-bottom: 6pt; margin-left: 0pt; text-indent: 0pt; }</xsl:text>
   </xsl:template>

<xsl:template match="list2/l2item" priority="1">
      <xsl:apply-templates select="node()[name() = 'warning' or name() = 'caution' or name() = 'note' ]"> </xsl:apply-templates>
      <table border="0" cellpadding="0" cellspacing="0">
         <xsl:attribute name="style">
            <xsl:variable name="followWith">emspace</xsl:variable>
            <xsl:if test="$followWith='tab'">table-layout: fixed; </xsl:if>
         </xsl:attribute>
         <!--Emit class values to reflect conditions-->
         <xsl:attribute name="class">
            <xsl:text> x-l2item-1-0</xsl:text> x--zero-left-margins</xsl:attribute>
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
                     <xsl:apply-templates select="_sfe:BeforeOrAfterText[1]"> </xsl:apply-templates>
                  </xsl:if>
               </td>
               <td>
                  <xsl:if test="$itemlabel-colnum=3">
                     <xsl:attribute name="style">word-break: keep-all; </xsl:attribute>
                     <xsl:apply-templates select="_sfe:BeforeOrAfterText[1]"> </xsl:apply-templates>
                  </xsl:if>
                  <!--Process this element's content-->
                  <xsl:apply-templates select="node()[name(.)!='_sfe:BeforeOrAfterText' and name() != 'warning' and name() != 'caution' and name() != 'note' ]"/>
               </td>
            </tr>
         </tbody>
      </table>
   </xsl:template>

<xsl:template name="__style-for_l2item.5l2emem65">
      <xsl:text> .x-l2item-5-0 {margin-left: 0pt; margin-right: 0pt; text-indent: 0pt; margin-top: 6pt; margin-bottom: 6pt; margin-left: 0pt; text-indent: 0pt; }</xsl:text>
   </xsl:template>

<xsl:template match="l2item" priority="0">
      <table border="0" cellpadding="0" cellspacing="0">
         <xsl:attribute name="style">
            <xsl:variable name="followWith"/>
            <xsl:if test="$followWith='tab'">table-layout: fixed; </xsl:if>
         </xsl:attribute>
         <!--Emit class values to reflect conditions-->
         <xsl:attribute name="class">
            <xsl:text> x-l2item-5-0</xsl:text> x--zero-left-margins</xsl:attribute>
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

<xsl:template name="__style-for_l3item.5pbatem441">
      <xsl:text> .x-l3item-1-0
{margin-left: 0pt; margin-right: 0pt; text-indent: 0pt; margin-top:
6pt; margin-bottom: 6pt; margin-left: 0pt; text-indent: 0pt; }</xsl:text>
   </xsl:template>

<xsl:template match="pbfmatr//list3/l3item[child::*[1] != 'note']" priority="4">
      <table border="0" cellpadding="0" cellspacing="0">
         <xsl:attribute name="style">
            <xsl:variable name="followWith">emspace</xsl:variable>
            <xsl:if test="$followWith='tab'">table-layout: fixed; </xsl:if>
         </xsl:attribute>
         <!--Emit class values to reflect conditions-->
         <xsl:attribute name="class">
            <xsl:text> x-l3item-1-0</xsl:text> x--zero-left-margins</xsl:attribute>
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
                     <xsl:apply-templates select="_sfe:BeforeOrAfterText[1]"> </xsl:apply-templates>
                  </xsl:if>
               </td>
               <td>
                  <xsl:if test="$itemlabel-colnum=3">
                     <xsl:attribute name="style">word-break: keep-all; </xsl:attribute>
                     <xsl:apply-templates select="_sfe:BeforeOrAfterText[1]"> </xsl:apply-templates>
                  </xsl:if>
                  <!--Process this element's content-->
                  <xsl:apply-templates select="node()[name(.)!='_sfe:BeforeOrAfterText' and name() != 'warning' and name() != 'caution']"> </xsl:apply-templates>
               </td>
            </tr>
         </tbody>
      </table>
   </xsl:template>

<xsl:template name="__style-for_l3item.5pbatem212">
      <xsl:text> .x-l3item-2-0
{margin-left: 0pt; margin-right: 0pt; text-indent: 0pt; margin-top:
6pt; margin-bottom: 6pt; margin-left: 0pt; text-indent: 0pt; }</xsl:text>
   </xsl:template>

<xsl:template match="pbfmatr//list3/l3item" priority="3">
      <table border="0" cellpadding="0" cellspacing="0">
         <xsl:attribute name="style">
            <xsl:variable name="followWith">emspace</xsl:variable>
            <xsl:if test="$followWith='tab'">table-layout: fixed; </xsl:if>
         </xsl:attribute>
         <!--Emit class values to reflect conditions-->
         <xsl:attribute name="class">
            <xsl:text> x-l3item-2-0</xsl:text> x--zero-left-margins</xsl:attribute>
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
                     <xsl:apply-templates select="_sfe:BeforeOrAfterText[1]"> </xsl:apply-templates>
                  </xsl:if>
               </td>
               <td>
                  <xsl:if test="$itemlabel-colnum=3">
                     <xsl:attribute name="style">word-break: keep-all; </xsl:attribute>
                     <xsl:apply-templates select="_sfe:BeforeOrAfterText[1]"> </xsl:apply-templates>
                  </xsl:if>
                  <!--Process this element's content-->
                  <xsl:apply-templates select="node()[name(.)!='_sfe:BeforeOrAfterText' and name() != 'warning' and name() != 'caution' and name() != 'note']"> </xsl:apply-templates>
               </td>
            </tr>
         </tbody>
      </table>
   </xsl:template>

<xsl:template name="__style-for_l3item.3li3lem351">
      <xsl:text> .x-l3item-1-0
{margin-left: 0pt; margin-right: 0pt; text-indent: 0pt; margin-top:
6pt; margin-bottom: 6pt; margin-left: 0pt; text-indent: 0pt; }</xsl:text>
   </xsl:template>

<xsl:template match="list3/l3item[child::*[1] != 'note']" priority="2">
      <table border="0" cellpadding="0" cellspacing="0">
         <xsl:attribute name="style">
            <xsl:variable name="followWith">emspace</xsl:variable>
            <xsl:if test="$followWith='tab'">table-layout: fixed; </xsl:if>
         </xsl:attribute>
         <!--Emit class values to reflect conditions-->
         <xsl:attribute name="class">
            <xsl:text> x-l3item-1-0</xsl:text> x--zero-left-margins</xsl:attribute>
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
                     <xsl:apply-templates select="_sfe:BeforeOrAfterText[1]"> </xsl:apply-templates>
                  </xsl:if>
               </td>
               <td>
                  <xsl:if test="$itemlabel-colnum=3">
                     <xsl:attribute name="style">word-break: keep-all; </xsl:attribute>
                     <xsl:apply-templates select="_sfe:BeforeOrAfterText[1]"> </xsl:apply-templates>
                  </xsl:if>
                  <!--Process this element's content-->
                  <xsl:apply-templates select="node()[name(.)!='_sfe:BeforeOrAfterText' and name() != 'warning' and name() != 'caution']"> </xsl:apply-templates>
               </td>
            </tr>
         </tbody>
      </table>
   </xsl:template>

<xsl:template name="__style-for_l3item.3li3lem122">
      <xsl:text> .x-l3item-2-0
{margin-left: 0pt; margin-right: 0pt; text-indent: 0pt; margin-top:
6pt; margin-bottom: 6pt; margin-left: 0pt; text-indent: 0pt; }</xsl:text>
   </xsl:template>

<xsl:template match="list3/l3item" priority="1">
      <table border="0" cellpadding="0" cellspacing="0">
         <xsl:attribute name="style">
            <xsl:variable name="followWith">emspace</xsl:variable>
            <xsl:if test="$followWith='tab'">table-layout: fixed; </xsl:if>
         </xsl:attribute>
         <!--Emit class values to reflect conditions-->
         <xsl:attribute name="class">
            <xsl:text> x-l3item-2-0</xsl:text> x--zero-left-margins</xsl:attribute>
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
                     <xsl:apply-templates select="_sfe:BeforeOrAfterText[1]"> </xsl:apply-templates>
                  </xsl:if>
               </td>
               <td>
                  <xsl:if test="$itemlabel-colnum=3">
                     <xsl:attribute name="style">word-break: keep-all; </xsl:attribute>
                     <xsl:apply-templates select="_sfe:BeforeOrAfterText[1]"> </xsl:apply-templates>
                  </xsl:if>
                  <!--Process this element's content-->
                  <xsl:apply-templates select="node()[name(.)!='_sfe:BeforeOrAfterText' and name() != 'warning' and name() != 'caution' and name() != 'note']"> </xsl:apply-templates>
               </td>
            </tr>
         </tbody>
      </table>
   </xsl:template>

<xsl:template name="__style-for_l3item.5l3emem65">
      <xsl:text> .x-l3item-5-0 {margin-left: 0pt; margin-right: 0pt; text-indent: 0pt; margin-top: 6pt; margin-bottom: 6pt; margin-left: 0pt; text-indent: 0pt; }</xsl:text>
   </xsl:template>

<xsl:template match="l3item" priority="0">
      <table border="0" cellpadding="0" cellspacing="0">
         <xsl:attribute name="style">
            <xsl:variable name="followWith"/>
            <xsl:if test="$followWith='tab'">table-layout: fixed; </xsl:if>
         </xsl:attribute>
         <!--Emit class values to reflect conditions-->
         <xsl:attribute name="class">
            <xsl:text> x-l3item-5-0</xsl:text> x--zero-left-margins</xsl:attribute>
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

<xsl:template name="__style-for_l4item.5pbatem441">
      <xsl:text> .x-l4item-1-0
{margin-left: 0pt; margin-right: 0pt; text-indent: 0pt; margin-top:
6pt; margin-bottom: 6pt; margin-left: 0pt; text-indent: 0pt; }</xsl:text>
   </xsl:template>

<xsl:template match="pbfmatr//list4/l4item[child::*[1] != 'note']" priority="4">
      <table border="0" cellpadding="0" cellspacing="0">
         <xsl:attribute name="style">
            <xsl:variable name="followWith">emspace</xsl:variable>
            <xsl:if test="$followWith='tab'">table-layout: fixed; </xsl:if>
         </xsl:attribute>
         <!--Emit class values to reflect conditions-->
         <xsl:attribute name="class">
            <xsl:text> x-l4item-1-0</xsl:text> x--zero-left-margins</xsl:attribute>
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
                     <xsl:apply-templates select="_sfe:BeforeOrAfterText[1]"> </xsl:apply-templates>
                  </xsl:if>
               </td>
               <td>
                  <xsl:if test="$itemlabel-colnum=3">
                     <xsl:attribute name="style">word-break: keep-all; </xsl:attribute>
                     <xsl:apply-templates select="_sfe:BeforeOrAfterText[1]"> </xsl:apply-templates>
                  </xsl:if>
                  <!--Process this element's content-->
                  <xsl:apply-templates select="node()[name(.)!='_sfe:BeforeOrAfterText' and name() != 'warning' and name() != 'caution']"> </xsl:apply-templates>
               </td>
            </tr>
         </tbody>
      </table>
   </xsl:template>

<xsl:template name="__style-for_l4item.5pbatem212">
      <xsl:text> .x-l4item-2-0
{margin-left: 0pt; margin-right: 0pt; text-indent: 0pt; margin-top:
6pt; margin-bottom: 6pt; margin-left: 0pt; text-indent: 0pt; }</xsl:text>
   </xsl:template>

<xsl:template match="pbfmatr//list4/l4item" priority="3">
      <table border="0" cellpadding="0" cellspacing="0">
         <xsl:attribute name="style">
            <xsl:variable name="followWith">emspace</xsl:variable>
            <xsl:if test="$followWith='tab'">table-layout: fixed; </xsl:if>
         </xsl:attribute>
         <!--Emit class values to reflect conditions-->
         <xsl:attribute name="class">
            <xsl:text> x-l4item-2-0</xsl:text> x--zero-left-margins</xsl:attribute>
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
                     <xsl:apply-templates select="_sfe:BeforeOrAfterText[1]"> </xsl:apply-templates>
                  </xsl:if>
               </td>
               <td>
                  <xsl:if test="$itemlabel-colnum=3">
                     <xsl:attribute name="style">word-break: keep-all; </xsl:attribute>
                     <xsl:apply-templates select="_sfe:BeforeOrAfterText[1]"> </xsl:apply-templates>
                  </xsl:if>
                  <!--Process this element's content-->
                  <xsl:apply-templates select="node()[name(.)!='_sfe:BeforeOrAfterText' and name() != 'warning' and name() != 'caution' and name() != 'note']"> </xsl:apply-templates>
               </td>
            </tr>
         </tbody>
      </table>
   </xsl:template>

<xsl:template name="__style-for_l4item.3li4lem351">
      <xsl:text> .x-l4item-1-0
{margin-left: 0pt; margin-right: 0pt; text-indent: 0pt; margin-top:
6pt; margin-bottom: 6pt; margin-left: 0pt; text-indent: 0pt; }</xsl:text>
   </xsl:template>

<xsl:template match="list4/l4item[child::*[1] != 'note']" priority="2">
      <table border="0" cellpadding="0" cellspacing="0">
         <xsl:attribute name="style">
            <xsl:variable name="followWith">emspace</xsl:variable>
            <xsl:if test="$followWith='tab'">table-layout: fixed; </xsl:if>
         </xsl:attribute>
         <!--Emit class values to reflect conditions-->
         <xsl:attribute name="class">
            <xsl:text> x-l4item-1-0</xsl:text> x--zero-left-margins</xsl:attribute>
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
                     <xsl:apply-templates select="_sfe:BeforeOrAfterText[1]"> </xsl:apply-templates>
                  </xsl:if>
               </td>
               <td>
                  <xsl:if test="$itemlabel-colnum=3">
                     <xsl:attribute name="style">word-break: keep-all; </xsl:attribute>
                     <xsl:apply-templates select="_sfe:BeforeOrAfterText[1]"> </xsl:apply-templates>
                  </xsl:if>
                  <!--Process this element's content-->
                  <xsl:apply-templates select="node()[name(.)!='_sfe:BeforeOrAfterText' and name() != 'warning' and name() != 'caution']"> </xsl:apply-templates>
               </td>
            </tr>
         </tbody>
      </table>
   </xsl:template>

<xsl:template name="__style-for_l4item.3li4lem122">
      <xsl:text> .x-l4item-2-0
{margin-left: 0pt; margin-right: 0pt; text-indent: 0pt; margin-top:
6pt; margin-bottom: 6pt; margin-left: 0pt; text-indent: 0pt; }</xsl:text>
   </xsl:template>

<xsl:template match="list4/l4item" priority="1">
      <table border="0" cellpadding="0" cellspacing="0">
         <xsl:attribute name="style">
            <xsl:variable name="followWith">emspace</xsl:variable>
            <xsl:if test="$followWith='tab'">table-layout: fixed; </xsl:if>
         </xsl:attribute>
         <!--Emit class values to reflect conditions-->
         <xsl:attribute name="class">
            <xsl:text> x-l4item-2-0</xsl:text> x--zero-left-margins</xsl:attribute>
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
                     <xsl:apply-templates select="_sfe:BeforeOrAfterText[1]"> </xsl:apply-templates>
                  </xsl:if>
               </td>
               <td>
                  <xsl:if test="$itemlabel-colnum=3">
                     <xsl:attribute name="style">word-break: keep-all; </xsl:attribute>
                     <xsl:apply-templates select="_sfe:BeforeOrAfterText[1]"> </xsl:apply-templates>
                  </xsl:if>
                  <!--Process this element's content-->
                  <xsl:apply-templates select="node()[name(.)!='_sfe:BeforeOrAfterText' and name() != 'warning' and name() != 'caution' and name() != 'note']"> </xsl:apply-templates>
               </td>
            </tr>
         </tbody>
      </table>
   </xsl:template>

<xsl:template name="__style-for_l4item.5l4emem65">
      <xsl:text> .x-l4item-5-0 {margin-left: 0pt; margin-right: 0pt; text-indent: 0pt; margin-top: 6pt; margin-bottom: 6pt; margin-left: 0pt; text-indent: 0pt; }</xsl:text>
   </xsl:template>

<xsl:template match="l4item" priority="0">
      <table border="0" cellpadding="0" cellspacing="0">
         <xsl:attribute name="style">
            <xsl:variable name="followWith"/>
            <xsl:if test="$followWith='tab'">table-layout: fixed; </xsl:if>
         </xsl:attribute>
         <!--Emit class values to reflect conditions-->
         <xsl:attribute name="class">
            <xsl:text> x-l4item-5-0</xsl:text> x--zero-left-margins</xsl:attribute>
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

<xsl:template name="__style-for_l5item.1">
      <xsl:text> .x-l5item-1-0 {margin-left: 0pt; margin-right: 0pt; }</xsl:text>
   </xsl:template>

<xsl:template match="l5item" priority="0">
      <!--Emit a nostyle template-->
      <xsl:apply-templates/>
   </xsl:template>

<xsl:template name="__style-for_l6item.1">
      <xsl:text> .x-l6item-1-0 {margin-left: 0pt; margin-right: 0pt; }</xsl:text>
   </xsl:template>

<xsl:template match="l6item" priority="0">
      <!--Emit a nostyle template-->
      <xsl:apply-templates/>
   </xsl:template>

<xsl:template name="__style-for_l7item.1">
      <xsl:text> .x-l7item-1-0 {margin-left: 0pt; margin-right: 0pt; }</xsl:text>
   </xsl:template>

<xsl:template match="l7item" priority="0">
      <!--Emit a nostyle template-->
      <xsl:apply-templates/>
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

<xsl:template name="__style-for_list1.1">
      <xsl:text> .x-list1-1-0 {margin-left: 0pt; margin-right: 0pt; text-indent: 0pt; margin-top: 8pt; margin-left: 18pt; text-indent: 0pt; }</xsl:text>
   </xsl:template>

<xsl:template match="list1" priority="0">
      <div>
         <!--Emit class values to reflect conditions-->
         <xsl:attribute name="class">
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

<xsl:template name="__style-for_list2.1">
      <xsl:text> .x-list2-1-0 {margin-left: 0pt; margin-right: 0pt; text-indent: 0pt; margin-top: 8pt; }</xsl:text>
   </xsl:template>

<xsl:template match="list2" priority="0">
      <div>
         <!--Emit class values to reflect conditions-->
         <xsl:attribute name="class">
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

<xsl:template name="__style-for_list3.1">
      <xsl:text> .x-list3-1-0 {margin-left: 0pt; margin-right: 0pt; text-indent: 0pt; margin-top: 8pt; }</xsl:text>
   </xsl:template>

<xsl:template match="list3" priority="0">
      <div>
         <!--Emit class values to reflect conditions-->
         <xsl:attribute name="class">
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

<xsl:template name="__style-for_list4.1">
      <xsl:text> .x-list4-1-0 {margin-left: 0pt; margin-right: 0pt; text-indent: 0pt; margin-top: 8pt; }</xsl:text>
   </xsl:template>

<xsl:template match="list4" priority="0">
      <div>
         <!--Emit class values to reflect conditions-->
         <xsl:attribute name="class">
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

<xsl:template name="__style-for_list5.1">
      <xsl:text> .x-list5-1-0 {margin-left: 0pt; margin-right: 0pt; }</xsl:text>
   </xsl:template>

<xsl:template match="list5" priority="0">
      <!--Emit a nostyle template-->
      <xsl:apply-templates/>
   </xsl:template>

<xsl:template name="__style-for_list6.1">
      <xsl:text> .x-list6-1-0 {margin-left: 0pt; margin-right: 0pt; }</xsl:text>
   </xsl:template>

<xsl:template match="list6" priority="0">
      <!--Emit a nostyle template-->
      <xsl:apply-templates/>
   </xsl:template>

<xsl:template name="__style-for_list7.1">
      <xsl:text> .x-list7-1-0 {margin-left: 0pt; margin-right: 0pt; }</xsl:text>
   </xsl:template>

<xsl:template match="list7" priority="0">
      <!--Emit a nostyle template-->
      <xsl:apply-templates/>
   </xsl:template>

<xsl:template name="__style-for_lmm-statement.1">
      <xsl:text> .x-lmm-statement-1-0 {margin-left: 0pt; margin-right: 0pt; text-indent: 0pt; font-size: 10pt; text-align: justify; margin-top: 10pt; margin-bottom: 10pt; }</xsl:text>
   </xsl:template>

<xsl:template match="lmm-statement" priority="0">
      <div>
         <!--Emit class values to reflect conditions-->
         <xsl:attribute name="class">
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

<xsl:template name="__style-for_mfmatr.1">
      <xsl:text> .x-mfmatr-1-0 {margin-left: 0pt; margin-right: 0pt; text-indent: 0pt; }</xsl:text>
   </xsl:template>

<xsl:template match="mfmatr" priority="0">
      <div>
         <!--Emit class values to reflect conditions-->
         <xsl:attribute name="class">
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
      <xsl:text> .x-name-1-0 {margin-left: 0pt; margin-right: 0pt; text-indent: 0pt; }</xsl:text>
   </xsl:template>

<xsl:template match="name" priority="0">
      <div>
         <!--Emit class values to reflect conditions-->
         <xsl:attribute name="class">
            <xsl:text> x-name-1-0</xsl:text>
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

<xsl:template name="__style-for_ncon.1">
      <xsl:text> .x-ncon-1-0 {margin-left: 0pt; margin-right: 0pt; }</xsl:text>
   </xsl:template>

<xsl:template match="ncon" priority="0">
      <span>
         <!--Emit class values to reflect conditions-->
         <xsl:attribute name="class">
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

<xsl:template name="__style-for_note.12molete111">
      <xsl:text> .x-note-1-0 {margin-left: 0pt; margin-right: 0pt; text-indent: 0pt; margin-top: 8pt; margin-left: 61pt; text-indent: -43pt; }</xsl:text>
   </xsl:template>

<xsl:template match="module/note" priority="11">
      <div>
         <!--Emit class values to reflect conditions-->
         <xsl:attribute name="class">
            <xsl:text> x-note-1-0</xsl:text>
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

<xsl:template name="__style-for_note.12suaste122">
      <xsl:text> .x-note-2-0 {margin-left: 0pt; margin-right: 0pt; text-indent: 0pt; margin-top: 8pt; margin-left: 61pt; text-indent: -43pt; }</xsl:text>
   </xsl:template>

<xsl:template match="subtask/note" priority="10">
      <div>
         <!--Emit class values to reflect conditions-->
         <xsl:attribute name="class">
            <xsl:text> x-note-2-0</xsl:text>
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

<xsl:template name="__style-for_note.12tanote93">
      <xsl:text> .x-note-3-0 {margin-left: 0pt; margin-right: 0pt; text-indent: 0pt; margin-top: 8pt; margin-left: 61pt; text-indent: -43pt; }</xsl:text>
   </xsl:template>

<xsl:template match="task/note" priority="9">
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

<xsl:template name="__style-for_note.12n-rate114">
      <xsl:text> .x-note-4-0 {margin-left: 0pt; margin-right: 0pt; text-indent: 0pt; margin-top: 8pt; margin-left: 70pt; text-indent: -45pt; } .x-note-4-1 {}</xsl:text>
   </xsl:template>

<xsl:template match="n-para/note" priority="8">
      <xsl:variable name="foClass">block</xsl:variable>
      <xsl:variable name="blockness">block</xsl:variable>
      <xsl:variable name="startnew"/>
      <xsl:variable name="newpageset">#noChange</xsl:variable>
      <div>
         <!--Emit class values to reflect conditions-->
         <xsl:attribute name="class">
            <xsl:text> x-note-4-0</xsl:text>
            <xsl:if test="@nbr"> x-note-4-1</xsl:if>
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

<xsl:template name="__style-for_note.12predte145">
      <xsl:text> .x-note-5-0 {margin-left: 0pt; margin-right: 0pt; text-indent: 0pt; margin-top: 8pt; margin-left: 63pt; text-indent: -43pt; } .x-note-5-1 {margin-left: 76pt; text-indent: -57pt; }</xsl:text>
   </xsl:template>

<xsl:template match="procedure/note" priority="7">
      <xsl:variable name="foClass">block</xsl:variable>
      <xsl:variable name="blockness">block</xsl:variable>
      <xsl:variable name="startnew"/>
      <xsl:variable name="newpageset">#noChange</xsl:variable>
      <div>
         <!--Emit class values to reflect conditions-->
         <xsl:attribute name="class">
            <xsl:text> x-note-5-0</xsl:text>
            <xsl:if test="@nbr"> x-note-5-1</xsl:if>
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

<xsl:template name="__style-for_note.12facnte106">
      <xsl:text> .x-note-6-0 {margin-left: 0pt; margin-right: 0pt; text-indent: 0pt; }</xsl:text>
   </xsl:template>

<xsl:template match="fandc/note" priority="6">
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

<xsl:template name="__style-for_note.12sp-ate157">
      <xsl:text> .x-note-7-0 {margin-left: 0pt; margin-right: 0pt; text-indent: 0pt; }</xsl:text>
   </xsl:template>

<xsl:template match="spec-assem/note" priority="5">
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

<xsl:template name="__style-for_note.12spngte208">
      <xsl:text> .x-note-8-0 {margin-left: 0pt; margin-right: 0pt; text-indent: 0pt; }</xsl:text>
   </xsl:template>

<xsl:template match="spring-pressure/note" priority="4">
      <div>
         <!--Emit class values to reflect conditions-->
         <xsl:attribute name="class">
            <xsl:text> x-note-8-0</xsl:text>
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

<xsl:template name="__style-for_note.12touete239">
      <xsl:text> .x-note-9-0 {margin-left: 0pt; margin-right: 0pt; text-indent: 0pt; }</xsl:text>
   </xsl:template>

<xsl:template match="torque-and-stretch/note" priority="3">
      <div>
         <!--Emit class values to reflect conditions-->
         <xsl:attribute name="class">
            <xsl:text> x-note-9-0</xsl:text>
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

<xsl:template name="__style-for_note.12fi-ate2010">
      <xsl:text> .x-note-10-0 {margin-left: 0pt; margin-right: 0pt; text-indent: 0pt; }</xsl:text>
   </xsl:template>

<xsl:template match="fits-and-clears/note" priority="2">
      <div>
         <!--Emit class values to reflect conditions-->
         <xsl:attribute name="class">
            <xsl:text> x-note-10-0</xsl:text>
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

<xsl:template name="__style-for_note.12note2311">
      <xsl:text> .x-note-11-0 {margin-left: 0pt; margin-right: 0pt; text-indent: 0pt; margin-top: 8pt; margin-left: 61pt; text-indent: -43pt; } .x-note-11-1 {}</xsl:text>
   </xsl:template>

<xsl:template match="note[ancestor::subpara]" priority="1">
      <xsl:variable name="foClass">block</xsl:variable>
      <xsl:variable name="blockness">block</xsl:variable>
      <xsl:variable name="startnew"/>
      <xsl:variable name="newpageset">#noChange</xsl:variable>
      <div>
         <!--Emit class values to reflect conditions-->
         <xsl:attribute name="class">
            <xsl:text> x-note-11-0</xsl:text>
            <xsl:if test="@nbr"> x-note-11-1</xsl:if>
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

<xsl:template name="__style-for_note.12note412">
      <xsl:text> .x-note-12-0 {margin-left: 0pt; margin-right: 0pt; text-indent: 0pt; margin-top: 8pt; margin-left: 43pt; text-indent: -43pt; } .x-note-12-1 {margin-left: 55pt; text-indent: -55pt; }</xsl:text>
   </xsl:template>

<xsl:template match="note" priority="0">
      <xsl:variable name="foClass">block</xsl:variable>
      <xsl:variable name="blockness">block</xsl:variable>
      <xsl:variable name="startnew"/>
      <xsl:variable name="newpageset">#noChange</xsl:variable>
      <div>
         <!--Emit class values to reflect conditions-->
         <xsl:attribute name="class">
            <xsl:text> x-note-12-0</xsl:text>
            <xsl:if test="@nbr"> x-note-12-1</xsl:if>
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
      <div>
         <xsl:attribute name="ch:title">notoc</xsl:attribute>
         <!--Emit class values to reflect conditions-->
         <xsl:attribute name="class">
            <xsl:text> x--ufe-num-index-title-4-0</xsl:text>
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
         <!--Process this element's content-->
         <xsl:apply-templates/>
      </div>
   </xsl:template>

<xsl:template name="__style-for_numlist.1">
      <xsl:text> .x-numlist-1-0 {margin-left: 0pt; margin-right: 0pt; text-indent: 0pt; margin-top: 8pt; margin-left: 18pt; text-indent: 0pt; }</xsl:text>
   </xsl:template>

<xsl:template match="numlist" priority="0">
      <div>
         <!--Emit class values to reflect conditions-->
         <xsl:attribute name="class">
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

<xsl:template name="__style-for_numlitem.2nuisem161">
      <xsl:text> .x-numlitem-1-0 {margin-left: 0pt; margin-right: 0pt; text-indent: 0pt; margin-top: 6pt; margin-bottom: 6pt; margin-left: 0pt; text-indent: 0pt; }</xsl:text>
   </xsl:template>

<xsl:template match="numlist/numlitem" priority="1">
      <table border="0" cellpadding="0" cellspacing="0">
         <xsl:attribute name="style">
            <xsl:variable name="followWith">emspace</xsl:variable>
            <xsl:if test="$followWith='tab'">table-layout: fixed; </xsl:if>
         </xsl:attribute>
         <!--Emit class values to reflect conditions-->
         <xsl:attribute name="class">
            <xsl:text> x-numlitem-1-0</xsl:text> x--zero-left-margins</xsl:attribute>
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
                  <!--Process this element's content-->
                  <xsl:apply-templates select="node()[name(.)!='_sfe:BeforeOrAfterText']"/>
               </td>
            </tr>
         </tbody>
      </table>
   </xsl:template>

<xsl:template name="__style-for_numlitem.2nuitem82">
      <xsl:text> .x-numlitem-2-0 {margin-left: 0pt; margin-right: 0pt; text-indent: 0pt; margin-top: 6pt; margin-bottom: 6pt; margin-left: 0pt; text-indent: 0pt; }</xsl:text>
   </xsl:template>

<xsl:template match="numlitem" priority="0">
      <table border="0" cellpadding="0" cellspacing="0">
         <xsl:attribute name="style">
            <xsl:variable name="followWith"/>
            <xsl:if test="$followWith='tab'">table-layout: fixed; </xsl:if>
         </xsl:attribute>
         <!--Emit class values to reflect conditions-->
         <xsl:attribute name="class">
            <xsl:text> x-numlitem-2-0</xsl:text> x--zero-left-margins</xsl:attribute>
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

<xsl:template match="_ufe:nut-option-title" priority="0">
      <div>
         <xsl:attribute name="ch:title">notoc</xsl:attribute>
         <!--Emit class values to reflect conditions-->
         <xsl:attribute name="class">
            <xsl:text> x--ufe-nut-option-title-4-0</xsl:text>
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
         <!--Process this element's content-->
         <xsl:apply-templates/>
      </div>
   </xsl:template>

<xsl:template name="__style-for_pageblock-title.2frtmle351">
      <xsl:text> .x-pageblock-title-1-0 {margin-left: 0pt; margin-right: 0pt; text-indent: 0pt; font-weight: bold; text-decoration: underline ; text-transform: uppercase; margin-left: 0pt; text-indent: 0pt; text-align: center; }</xsl:text>
   </xsl:template>

<xsl:template match="frontmatter//module/pageblock-title" priority="1">
      <div>
         <xsl:attribute name="ch:title">toc</xsl:attribute>
         <!--Emit class values to reflect conditions-->
         <xsl:attribute name="class">
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
         <!--Process this element's content-->
         <xsl:apply-templates/>
      </div>
   </xsl:template>

<xsl:template name="__style-for_pageblock-title.2pablle152">
      <xsl:text> .x-pageblock-title-2-0 {margin-left: 0pt; margin-right: 0pt; text-indent: 0pt; font-weight: bold; font-size: 14pt; }</xsl:text>
   </xsl:template>

<xsl:template match="pageblock-title" priority="0">
      <div>
         <xsl:attribute name="ch:title">toc</xsl:attribute>
         <!--Emit class values to reflect conditions-->
         <xsl:attribute name="class">
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
         <!--Process this element's content-->
         <xsl:apply-templates/>
      </div>
   </xsl:template>

<xsl:template name="__style-for_part.1">
      <xsl:text> .x-part-1-0 {margin-left: 0pt; margin-right: 0pt; }</xsl:text>
   </xsl:template>

<xsl:template match="part" priority="0">
      <span>
         <!--Emit class values to reflect conditions-->
         <xsl:attribute name="class">
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

<xsl:template name="__style-for_pbfmatr.1">
      <xsl:text> .x-pbfmatr-1-0 {margin-left: 0pt; margin-right: 0pt; text-indent: 0pt; }</xsl:text>
   </xsl:template>

<xsl:template match="pbfmatr" priority="0">
      <div>
         <!--Emit class values to reflect conditions-->
         <xsl:attribute name="class">
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

<xsl:template match="_ufe:pdlist-title" priority="0">
      <div>
         <xsl:attribute name="ch:title">notoc</xsl:attribute>
         <!--Emit class values to reflect conditions-->
         <xsl:attribute name="class">
            <xsl:text> x--ufe-pdlist-title-2-0</xsl:text>
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
         <!--Process this element's content-->
         <xsl:apply-templates/>
      </div>
   </xsl:template>

<xsl:template name="__style-for_pgblk.1">
      <xsl:text> .x-pgblk-1-0 {margin-left: 0pt; margin-right: 0pt; text-indent: 0pt; margin-top: 8pt; }</xsl:text>
   </xsl:template>

<xsl:template match="pgblk" priority="0">
      <div>
         <!--Emit class values to reflect conditions-->
         <xsl:attribute name="class">
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

<xsl:template name="__style-for_prcitem.1">
      <xsl:text> .x-prcitem-1-0 {margin-left: 0pt; margin-right: 0pt; text-indent: 0pt; margin-top: 8pt; }</xsl:text>
   </xsl:template>

<xsl:template match="prcitem" priority="0">
      <div>
         <!--Emit class values to reflect conditions-->
         <xsl:attribute name="class">
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

<xsl:template name="__style-for_prcitem1.2prism1171">
      <xsl:text> .x-prcitem1-1-0 {margin-left: 0pt; margin-right: 0pt; text-indent: 0pt; margin-top: 6pt; margin-bottom: 6pt; margin-left: 0pt; text-indent: 0pt; }</xsl:text>
   </xsl:template>

<xsl:template match="prclist1/prcitem1" priority="1">
      <table border="0" cellpadding="0" cellspacing="0">
         <xsl:attribute name="style">
            <xsl:variable name="followWith"/>
            <xsl:if test="$followWith='tab'">table-layout: fixed; </xsl:if>
         </xsl:attribute>
         <!--Emit class values to reflect conditions-->
         <xsl:attribute name="class">
            <xsl:text> x-prcitem1-1-0</xsl:text> x--zero-left-margins</xsl:attribute>
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

<xsl:template name="__style-for_prcitem1.2prtem182">
      <xsl:text> .x-prcitem1-2-0 {margin-left: 0pt; margin-right: 0pt; text-indent: 0pt; margin-top: 6pt; margin-bottom: 6pt; margin-left: 0pt; text-indent: 0pt; }</xsl:text>
   </xsl:template>

<xsl:template match="prcitem1" priority="0">
      <table border="0" cellpadding="0" cellspacing="0">
         <xsl:attribute name="style">
            <xsl:variable name="followWith"/>
            <xsl:if test="$followWith='tab'">table-layout: fixed; </xsl:if>
         </xsl:attribute>
         <!--Emit class values to reflect conditions-->
         <xsl:attribute name="class">
            <xsl:text> x-prcitem1-2-0</xsl:text> x--zero-left-margins</xsl:attribute>
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

<xsl:template name="__style-for_prcitem2.2prism2171">
      <xsl:text> .x-prcitem2-1-0 {margin-left: 0pt; margin-right: 0pt; text-indent: 0pt; margin-top: 6pt; margin-bottom: 6pt; margin-left: 0pt; text-indent: 0pt; }</xsl:text>
   </xsl:template>

<xsl:template match="prclist2/prcitem2" priority="1">
      <table border="0" cellpadding="0" cellspacing="0">
         <xsl:attribute name="style">
            <xsl:variable name="followWith"/>
            <xsl:if test="$followWith='tab'">table-layout: fixed; </xsl:if>
         </xsl:attribute>
         <!--Emit class values to reflect conditions-->
         <xsl:attribute name="class">
            <xsl:text> x-prcitem2-1-0</xsl:text> x--zero-left-margins</xsl:attribute>
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

<xsl:template name="__style-for_prcitem2.2prtem282">
      <xsl:text> .x-prcitem2-2-0 {margin-left: 0pt; margin-right: 0pt; text-indent: 0pt; margin-top: 6pt; margin-bottom: 6pt; margin-left: 0pt; text-indent: 0pt; }</xsl:text>
   </xsl:template>

<xsl:template match="prcitem2" priority="0">
      <table border="0" cellpadding="0" cellspacing="0">
         <xsl:attribute name="style">
            <xsl:variable name="followWith"/>
            <xsl:if test="$followWith='tab'">table-layout: fixed; </xsl:if>
         </xsl:attribute>
         <!--Emit class values to reflect conditions-->
         <xsl:attribute name="class">
            <xsl:text> x-prcitem2-2-0</xsl:text> x--zero-left-margins</xsl:attribute>
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

<xsl:template name="__style-for_prcitem3.2prism3171">
      <xsl:text> .x-prcitem3-1-0 {margin-left: 0pt; margin-right: 0pt; text-indent: 0pt; margin-top: 6pt; margin-bottom: 6pt; margin-left: 0pt; text-indent: 0pt; }</xsl:text>
   </xsl:template>

<xsl:template match="prclist3/prcitem3" priority="1">
      <table border="0" cellpadding="0" cellspacing="0">
         <xsl:attribute name="style">
            <xsl:variable name="followWith"/>
            <xsl:if test="$followWith='tab'">table-layout: fixed; </xsl:if>
         </xsl:attribute>
         <!--Emit class values to reflect conditions-->
         <xsl:attribute name="class">
            <xsl:text> x-prcitem3-1-0</xsl:text> x--zero-left-margins</xsl:attribute>
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

<xsl:template name="__style-for_prcitem3.2prtem382">
      <xsl:text> .x-prcitem3-2-0 {margin-left: 0pt; margin-right: 0pt; text-indent: 0pt; margin-top: 6pt; margin-bottom: 6pt; margin-left: 0pt; text-indent: 0pt; }</xsl:text>
   </xsl:template>

<xsl:template match="prcitem3" priority="0">
      <table border="0" cellpadding="0" cellspacing="0">
         <xsl:attribute name="style">
            <xsl:variable name="followWith"/>
            <xsl:if test="$followWith='tab'">table-layout: fixed; </xsl:if>
         </xsl:attribute>
         <!--Emit class values to reflect conditions-->
         <xsl:attribute name="class">
            <xsl:text> x-prcitem3-2-0</xsl:text> x--zero-left-margins</xsl:attribute>
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

<xsl:template name="__style-for_prcitem4.3prism4171">
      <xsl:text> .x-prcitem4-1-0 {margin-left: 0pt; margin-right: 0pt; text-indent: 0pt; margin-top: 6pt; margin-bottom: 6pt; margin-left: 0pt; text-indent: 0pt; }</xsl:text>
   </xsl:template>

<xsl:template match="prclist4/prcitem4" priority="2">
      <table border="0" cellpadding="0" cellspacing="0">
         <xsl:attribute name="style">
            <xsl:variable name="followWith"/>
            <xsl:if test="$followWith='tab'">table-layout: fixed; </xsl:if>
         </xsl:attribute>
         <!--Emit class values to reflect conditions-->
         <xsl:attribute name="class">
            <xsl:text> x-prcitem4-1-0</xsl:text> x--zero-left-margins</xsl:attribute>
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

<xsl:template name="__style-for_prcitem4.3nuism4162">
      <xsl:text> .x-prcitem4-2-0 {margin-left: 0pt; margin-right: 0pt; text-indent: 0pt; margin-top: 6pt; margin-bottom: 6pt; margin-left: 0pt; text-indent: 0pt; }</xsl:text>
   </xsl:template>

<xsl:template match="numlist/prcitem4" priority="1">
      <table border="0" cellpadding="0" cellspacing="0">
         <xsl:attribute name="style">
            <xsl:variable name="followWith">tab</xsl:variable>
            <xsl:if test="$followWith='tab'">table-layout: fixed; </xsl:if>
         </xsl:attribute>
         <!--Emit class values to reflect conditions-->
         <xsl:attribute name="class">
            <xsl:text> x-prcitem4-2-0</xsl:text> x--zero-left-margins</xsl:attribute>
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

<xsl:template name="__style-for_prcitem4.3prtem483">
      <xsl:text> .x-prcitem4-3-0 {margin-left: 0pt; margin-right: 0pt; text-indent: 0pt; margin-top: 6pt; margin-bottom: 6pt; margin-left: 0pt; text-indent: 0pt; }</xsl:text>
   </xsl:template>

<xsl:template match="prcitem4" priority="0">
      <table border="0" cellpadding="0" cellspacing="0">
         <xsl:attribute name="style">
            <xsl:variable name="followWith"/>
            <xsl:if test="$followWith='tab'">table-layout: fixed; </xsl:if>
         </xsl:attribute>
         <!--Emit class values to reflect conditions-->
         <xsl:attribute name="class">
            <xsl:text> x-prcitem4-3-0</xsl:text> x--zero-left-margins</xsl:attribute>
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

<xsl:template name="__style-for_prcitem5.1">
      <xsl:text> .x-prcitem5-1-0 {margin-left: 0pt; margin-right: 0pt; }</xsl:text>
   </xsl:template>

<xsl:template match="prcitem5" priority="0">
      <!--Emit a nostyle template-->
      <xsl:apply-templates/>
   </xsl:template>

<xsl:template name="__style-for_prcitem6.1">
      <xsl:text> .x-prcitem6-1-0 {margin-left: 0pt; margin-right: 0pt; }</xsl:text>
   </xsl:template>

<xsl:template match="prcitem6" priority="0">
      <!--Emit a nostyle template-->
      <xsl:apply-templates/>
   </xsl:template>

<xsl:template name="__style-for_prcitem7.1">
      <xsl:text> .x-prcitem7-1-0 {margin-left: 0pt; margin-right: 0pt; }</xsl:text>
   </xsl:template>

<xsl:template match="prcitem7" priority="0">
      <!--Emit a nostyle template-->
      <xsl:apply-templates/>
   </xsl:template>

<xsl:template name="__style-for_prclist1.1">
      <xsl:text> .x-prclist1-1-0 {margin-left: 0pt; margin-right: 0pt; text-indent: 0pt; margin-top: 8pt; }</xsl:text>
   </xsl:template>

<xsl:template match="prclist1" priority="0">
      <div>
         <!--Emit class values to reflect conditions-->
         <xsl:attribute name="class">
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

<xsl:template name="__style-for_prclist2.1">
      <xsl:text> .x-prclist2-1-0 {margin-left: 0pt; margin-right: 0pt; text-indent: 0pt; margin-top: 8pt; margin-left: 18pt; text-indent: 0pt; }</xsl:text>
   </xsl:template>

<xsl:template match="prclist2" priority="0">
      <div>
         <!--Emit class values to reflect conditions-->
         <xsl:attribute name="class">
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

<xsl:template name="__style-for_prclist3.1">
      <xsl:text> .x-prclist3-1-0 {margin-left: 0pt; margin-right: 0pt; text-indent: 0pt; margin-top: 8pt; margin-left: 18pt; text-indent: 0pt; }</xsl:text>
   </xsl:template>

<xsl:template match="prclist3" priority="0">
      <div>
         <!--Emit class values to reflect conditions-->
         <xsl:attribute name="class">
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

<xsl:template name="__style-for_prclist4.1">
      <xsl:text> .x-prclist4-1-0 {margin-left: 0pt; margin-right: 0pt; text-indent: 0pt; margin-top: 8pt; }</xsl:text>
   </xsl:template>

<xsl:template match="prclist4" priority="0">
      <div>
         <!--Emit class values to reflect conditions-->
         <xsl:attribute name="class">
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

<xsl:template name="__style-for_prclist5.1">
      <xsl:text> .x-prclist5-1-0 {margin-left: 0pt; margin-right: 0pt; }</xsl:text>
   </xsl:template>

<xsl:template match="prclist5" priority="0">
      <!--Emit a nostyle template-->
      <xsl:apply-templates/>
   </xsl:template>

<xsl:template name="__style-for_prclist6.1">
      <xsl:text> .x-prclist6-1-0 {margin-left: 0pt; margin-right: 0pt; }</xsl:text>
   </xsl:template>

<xsl:template match="prclist6" priority="0">
      <!--Emit a nostyle template-->
      <xsl:apply-templates/>
   </xsl:template>

<xsl:template name="__style-for_prclist7.1">
      <xsl:text> .x-prclist7-1-0 {margin-left: 0pt; margin-right: 0pt; }</xsl:text>
   </xsl:template>

<xsl:template match="prclist7" priority="0">
      <!--Emit a nostyle template-->
      <xsl:apply-templates/>
   </xsl:template>

<xsl:template name="__style-for_print-module.1">
      <xsl:text> .x-print-module-1-0 {margin-left: 0pt; margin-right: 0pt; }</xsl:text>
   </xsl:template>

<xsl:template match="print-module" priority="0">
      <!--Emit a nostyle template-->
      <xsl:apply-templates/>
   </xsl:template>

<xsl:template name="__style-for_print-unit.1">
      <xsl:text> .x-print-unit-1-0 {margin-left: 0pt; margin-right: 0pt; }</xsl:text>
   </xsl:template>

<xsl:template match="print-unit" priority="0">
      <!--Emit a nostyle template-->
      <xsl:apply-templates/>
   </xsl:template>

<xsl:template name="__style-for_pwc-awl.1">
      <xsl:text> .x-pwc-awl-1-0 {margin-left: 0pt; margin-right: 0pt; }</xsl:text>
   </xsl:template>

<xsl:template match="pwc-awl" priority="0">
      <!--Emit a nostyle template-->
      <xsl:apply-templates/>
   </xsl:template>

<xsl:template name="__style-for_pwc-cgp-stmnt.1">
      <xsl:text> .x-pwc-cgp-stmnt-1-0 {margin-left: 0pt; margin-right: 0pt; text-indent: 0pt; font-size: 10pt; margin-top: 10pt; margin-bottom: 10pt; }</xsl:text>
   </xsl:template>

<xsl:template match="pwc-cgp-stmnt" priority="0">
      <div>
         <!--Emit class values to reflect conditions-->
         <xsl:attribute name="class">
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

<xsl:template name="__style-for_pwccallout.1">
      <xsl:text> .x-pwccallout-1-0 {margin-left: 0pt; margin-right: 0pt; }</xsl:text>
   </xsl:template>

<xsl:template match="pwccallout" priority="0">
      <span>
         <!--Emit class values to reflect conditions-->
         <xsl:attribute name="class">
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

<xsl:template name="__style-for_pwcchapsect.1">
      <xsl:text> .x-pwcchapsect-1-0 {margin-left: 0pt; margin-right: 0pt; text-indent: 0pt; }</xsl:text>
   </xsl:template>

<xsl:template match="pwcchapsect" priority="0">
      <div>
         <!--Emit class values to reflect conditions-->
         <xsl:attribute name="class">
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

<xsl:template match="pwcchapsect-list//pwcchapsect-item/pwcchapsect" priority="101">
      <dt>
         <!--Emit class values to reflect conditions-->
         <xsl:attribute name="class">
            <xsl:if test="name(..)='chapsect-item' or name(..)='chapsect-title' or name(..)='ics' or name(..)='pwcchapsect-item' or name(..)='pwcspbdata' or name(..)='sbdata' or name(..)='spbnbr'">
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
      </dt>
   </xsl:template>

<xsl:template name="__style-for_pwcchapsect-item.1">
      <xsl:text> .x-pwcchapsect-item-1-0 {margin-left: 0pt; margin-right: 0pt; text-indent: 0pt; margin-top: 6pt; margin-bottom: 6pt; }</xsl:text>
   </xsl:template>

<xsl:template match="pwcchapsect-item" priority="0">
      <xsl:variable name="foClass">definitionListItem</xsl:variable>
      <xsl:variable name="blockness">block</xsl:variable>
      <xsl:variable name="startnew"/>
      <xsl:variable name="newpageset">#noChange</xsl:variable>
      <xsl:apply-templates/>
   </xsl:template>

<xsl:template name="__style-for_pwcchapsect-list.1">
      <xsl:text> .x-pwcchapsect-list-1-0 {margin-left: 0pt; margin-right: 0pt; text-indent: 0pt; margin-top: 8pt; }</xsl:text>
   </xsl:template>

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
         <xsl:copy-of xmlns:dmp="http://www.arbortext.com/namespace/dmp/dmpmap" select="@dmp:*"/>
         <xsl:if test="@xml:lang">
            <xsl:attribute name="lang">
               <xsl:call-template name="return-lang-applying-language-map">
                  <xsl:with-param name="doclang" select="@xml:lang"/>
               </xsl:call-template>
            </xsl:attribute>
         </xsl:if>
         <xsl:apply-templates select="_sfe:BeforeOrAfterText[not(preceding-sibling::*)]"/>
         <xsl:apply-templates select="_ufe:chapsect-title|_ufe:cir-title|_ufe:consumables-title|_ufe:eipc-title|_ufe:em-title|_ufe:fixequ-title|_ufe:general-title|_ufe:glossary-title|_ufe:howtouse-title|_ufe:intro-title|manual-title|_ufe:num-index-title|_ufe:nut-option-title|pageblock-title|_ufe:pdlist-title|_ufe:sblist-title|_ufe:spblist-title|_ufe:spectools-title|_ufe:supplier-list-title|_ufe:task-title|_ufe:temp-rev-title|title|_ufe:tmm-title"/>
         <dl>
            <!--Emit class values to reflect conditions-->
            <xsl:attribute name="class">
               <xsl:text> x-pwcchapsect-list-1-0</xsl:text>
            </xsl:attribute>
            <xsl:call-template name="maybe-set-id"/>
            <!--Process this element's content-->
            <xsl:apply-templates select="pwcchapsect-item|pwcchapsect"/>
         </dl>
         <xsl:apply-templates select="*[not(self::_sfe:BeforeOrAfterText|self::_ufe:chapsect-title|self::_ufe:cir-title|self::_ufe:consumables-title|self::_ufe:eipc-title|self::_ufe:em-title|self::_ufe:fixequ-title|self::_ufe:general-title|self::_ufe:glossary-title|self::_ufe:howtouse-title|self::_ufe:intro-title|self::manual-title|self::_ufe:num-index-title|self::_ufe:nut-option-title|self::pageblock-title|self::_ufe:pdlist-title|self::_ufe:sblist-title|self::_ufe:spblist-title|self::_ufe:spectools-title|self::_ufe:supplier-list-title|self::_ufe:task-title|self::_ufe:temp-rev-title|self::title|self::_ufe:tmm-title|self::pwcchapsect-item|self::pwcchapsect|self::title)]"/>
         <xsl:apply-templates select="_sfe:BeforeOrAfterText[not(following-sibling::*)][preceding-sibling::*]"/>
      </div>
   </xsl:template>

<xsl:template name="__style-for_pwccss.1">
      <xsl:text> .x-pwccss-1-0 {margin-left: 0pt; margin-right: 0pt; text-indent: 0pt; }</xsl:text>
   </xsl:template>

<xsl:template match="pwccss" priority="0">
      <div>
         <!--Emit class values to reflect conditions-->
         <xsl:attribute name="class">
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

<xsl:template name="__style-for_pwcem-apu-title.1">
      <xsl:text> .x-pwcem-apu-title-1-0 {margin-left: 0pt; margin-right: 0pt; }</xsl:text>
   </xsl:template>

<xsl:template match="pwcem-apu-title" priority="0">
      <!--Emit a nostyle template-->
      <xsl:apply-templates/>
   </xsl:template>

<xsl:template name="__style-for_pwcem-title.1">
      <xsl:text> .x-pwcem-title-1-0
{margin-left: 0pt; margin-right: 0pt; text-indent: 0pt; font-weight:
bold; font-size: 24pt; text-align: center; }</xsl:text>
   </xsl:template>

<xsl:template match="pwcem-title" priority="0">
      <div>
         <!--Emit class values to reflect conditions-->
         <xsl:attribute name="class">
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
         <xsl:apply-templates> </xsl:apply-templates>
      </div>
   </xsl:template>

<xsl:template name="__style-for_pwcemtask.1">
      <xsl:text> .x-pwcemtask-1-0 {margin-left: 0pt; margin-right: 0pt; }</xsl:text>
   </xsl:template>

<xsl:template match="pwcemtask" priority="0">
      <!--Emit a nostyle template-->
      <xsl:apply-templates/>
   </xsl:template>

<xsl:template name="__style-for_pwclmm-title.1">
      <?Pub Dtl?>
      <xsl:text> .x-pwclmm-title-1-0
{margin-left: 0pt; margin-right: 0pt; text-indent: 0pt; font-weight:
bold; font-size: 24pt; text-align: center; }</xsl:text>
   </xsl:template>

<xsl:template match="pwclmm-title" priority="0">
      <?Pub Dtl?>
      <div>
         <!--Emit class values to reflect conditions-->
         <xsl:attribute name="class">
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
         <xsl:apply-templates> </xsl:apply-templates>
      </div>
   </xsl:template>

<xsl:template name="FormatDate">
      <?Pub Dtl?>
      <xsl:param name="DateTime"/>
      <xsl:param name="DateFormat"/>
      <xsl:variable name="year">
         <xsl:value-of select="substring($DateTime,1,4)"/>
      </xsl:variable>
      <xsl:variable name="month">
         <xsl:value-of select="substring($DateTime,5,2)"/>
      </xsl:variable>
      <xsl:variable name="day">
         <xsl:value-of select="substring($DateTime,7,2)"/>
      </xsl:variable>
      <xsl:choose>
         <xsl:when test="$DateFormat = 'dmy'">
            <xsl:value-of select="$day"/>
            <xsl:value-of select="' '"/>
            <xsl:choose>
               <xsl:when test="$month = 01">January</xsl:when>
               <xsl:when test="$month = 02">February</xsl:when>
               <xsl:when test="$month = 03">March</xsl:when>
               <xsl:when test="$month = 04">April</xsl:when>
               <xsl:when test="$month = 05">May</xsl:when>
               <xsl:when test="$month = 06">June</xsl:when>
               <xsl:when test="$month = 07">July</xsl:when>
               <xsl:when test="$month = 08">August</xsl:when>
               <xsl:when test="$month = 09">September</xsl:when>
               <xsl:when test="$month = 10">October</xsl:when>
               <xsl:when test="$month = 11">November</xsl:when>
               <xsl:when test="$month = 12">December</xsl:when>
            </xsl:choose>
            <xsl:value-of select="' '"/>
            <xsl:value-of select="$year"/>
         </xsl:when>
         <xsl:when test="$DateFormat = 'mdy'">
            <xsl:choose>
               <xsl:when test="$month = 01">January</xsl:when>
               <xsl:when test="$month = 02">February</xsl:when>
               <xsl:when test="$month = 03">March</xsl:when>
               <xsl:when test="$month = 04">April</xsl:when>
               <xsl:when test="$month = 05">May</xsl:when>
               <xsl:when test="$month = 06">June</xsl:when>
               <xsl:when test="$month = 07">July</xsl:when>
               <xsl:when test="$month = 08">August</xsl:when>
               <xsl:when test="$month = 09">September</xsl:when>
               <xsl:when test="$month = 10">October</xsl:when>
               <xsl:when test="$month = 11">November</xsl:when>
               <xsl:when test="$month = 12">December</xsl:when>
            </xsl:choose>
            <xsl:value-of select="' '"/>
            <xsl:value-of select="$day"/>
            <xsl:value-of select="'/'"/>
            <xsl:value-of select="$year"/>
         </xsl:when>
      </xsl:choose>
   </xsl:template>

<xsl:template name="__style-for_pwcni.1">
      <xsl:text> .x-pwcni-1-0 {margin-left: 0pt; margin-right: 0pt; text-indent: 0pt; margin-top: 8pt; }</xsl:text>
   </xsl:template>

<xsl:template match="pwcni" priority="0">
      <div>
         <!--Emit class values to reflect conditions-->
         <xsl:attribute name="class">
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

<xsl:template name="__style-for_pwcnitem.1">
      <xsl:text> .x-pwcnitem-1-0 {margin-left: 0pt; margin-right: 0pt; text-indent: 0pt; }</xsl:text>
   </xsl:template>

<xsl:template match="pwcnitem" priority="0">
      <div>
         <!--Emit class values to reflect conditions-->
         <xsl:attribute name="class">
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

<xsl:template name="__style-for_pwcpbfront.1">
      <xsl:text> .x-pwcpbfront-1-0 {margin-left: 0pt; margin-right: 0pt; }</xsl:text>
   </xsl:template>

<xsl:template match="pwcpbfront" priority="0">
      <!--Emit a nostyle template-->
      <xsl:apply-templates/>
   </xsl:template>

<xsl:template name="__style-for_pwcsbnbr.1">
      <xsl:text> .x-pwcsbnbr-1-0 {margin-left:
0pt; margin-right: 0pt; color: #0000FF; text-decoration: underline
; text-decoration: underline ; }</xsl:text>
   </xsl:template>

<xsl:template match="pwcsbnbr" priority="0">
      <span xmlns:dmp="http://www.arbortext.com/namespace/dmp/dmpmap">
         <!--Emit class values to reflect conditions-->
         <xsl:attribute name="class">
            <xsl:text> x-pwcsbnbr-1-0</xsl:text>
         </xsl:attribute>
         <xsl:copy-of select="@ch:*"/>
         <xsl:copy-of select="@dmp:*"/>
         <xsl:call-template name="maybe-set-id"/>
         <!--Process this element's content-->
         <a>
            <xsl:attribute name="onClick">
               <xsl:text>sbLink('</xsl:text>
               <xsl:value-of select="."/>
               <xsl:text>');</xsl:text>
            </xsl:attribute>
            <xsl:apply-templates> </xsl:apply-templates>
         </a>
      </span>
   </xsl:template>

<xsl:template name="__style-for_pwcsoa.1">
      <xsl:text> .x-pwcsoa-1-0 {margin-left: 0pt; margin-right: 0pt; text-indent: 0pt; margin-top: 8pt; } .x-pwcsoa-1-1 {}</xsl:text>
   </xsl:template>

<xsl:template match="pwcsoa" priority="0">
      <xsl:param name="hidden" select="'yes'"/>
      <!--Dynamically determine the fo-class-->
      <xsl:variable name="foClass">
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
            <xsl:if test="$hidden='no'">
               <div>
                  <!--Emit class values to reflect conditions-->
                  <xsl:attribute name="class">
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
            </xsl:if>
         </xsl:when>
         <xsl:when test="$fo-class='block'">
            <div>
               <!--Emit class values to reflect conditions-->
               <xsl:attribute name="class">
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
         <xsl:when test="$fo-class='graphic-block'">
            <div>
               <!--Emit class values to reflect conditions-->
               <xsl:attribute name="class">
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
                        <xsl:apply-templates/>
                     </img>
                  </xsl:otherwise>
               </xsl:choose>
            </div>
         </xsl:when>
      </xsl:choose>
   </xsl:template>

<xsl:template name="__style-for_pwcspbdata.1">
      <xsl:text> .x-pwcspbdata-1-0 {margin-left: 0pt; margin-right: 0pt; text-indent: 0pt; margin-top: 6pt; margin-bottom: 6pt; }</xsl:text>
   </xsl:template>

<xsl:template match="pwcspbdata" priority="0">
      <xsl:variable name="foClass">definitionListItem</xsl:variable>
      <xsl:variable name="blockness">block</xsl:variable>
      <xsl:variable name="startnew"/>
      <xsl:variable name="newpageset">#noChange</xsl:variable>
      <xsl:apply-templates/>
   </xsl:template>

<xsl:template name="__style-for_pwcspblist.1">
      <xsl:text> .x-pwcspblist-1-0 {margin-left: 0pt; margin-right: 0pt; text-indent: 0pt; margin-top: 8pt; }</xsl:text>
   </xsl:template>

<xsl:template match="pwcspblist" priority="0">
      <div>
         <!--Emit class values to reflect conditions-->
         <xsl:attribute name="class">
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

<xsl:template name="__style-for_pwcspbnbr.1">
      <xsl:text> .x-pwcspbnbr-1-0
{margin-left: 0pt; margin-right: 0pt; color: #0000FF; text-decoration:
underline ; text-decoration: underline ; }</xsl:text>
   </xsl:template>

<xsl:template match="pwcspbnbr" priority="0">
      <span xmlns:dmp="http://www.arbortext.com/namespace/dmp/dmpmap">
         <!--Emit class values to reflect conditions-->
         <xsl:attribute name="class">
            <xsl:text> x-pwcspbnbr-1-0</xsl:text>
         </xsl:attribute>
         <xsl:copy-of select="@ch:*"/>
         <xsl:copy-of select="@dmp:*"/>
         <xsl:call-template name="maybe-set-id"/>
         <!--Process this element's content-->
         <a>
            <xsl:attribute name="onClick">
               <xsl:text>spbLink('</xsl:text>
               <xsl:value-of select="."/>
               <xsl:text>');</xsl:text>
            </xsl:attribute>
            <xsl:apply-templates> </xsl:apply-templates>
         </a>
      </span>
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

<xsl:template name="__style-for_sbdata.1">
      <xsl:text> .x-sbdata-1-0 {margin-left: 0pt; margin-right: 0pt; text-indent: 0pt; margin-top: 6pt; margin-bottom: 6pt; }</xsl:text>
   </xsl:template>

<xsl:template match="sbdata" priority="0">
      <xsl:variable name="foClass">definitionListItem</xsl:variable>
      <xsl:variable name="blockness">block</xsl:variable>
      <xsl:variable name="startnew"/>
      <xsl:variable name="newpageset">#noChange</xsl:variable>
      <xsl:apply-templates/>
   </xsl:template>

<xsl:template name="__style-for_sbeff.1">
      <xsl:text> .x-sbeff-1-0 {margin-left:
0pt; margin-right: 0pt; } .x-sbeff-1-1 {}</xsl:text>
   </xsl:template>

<xsl:template match="sbeff" priority="0">
      <xsl:variable name="foClass">inline</xsl:variable>
      <xsl:variable name="blockness">inline</xsl:variable>
      <span>
         <!--Emit class values to reflect conditions-->
         <xsl:attribute name="class">
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
      </span>
   </xsl:template>

<xsl:template match="_ufe:sblist-title" priority="0">
      <div>
         <xsl:attribute name="ch:title">toc</xsl:attribute>
         <!--Emit class values to reflect conditions-->
         <xsl:attribute name="class">
            <xsl:text> x--ufe-sblist-title-3-0</xsl:text>
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
         <!--Process this element's content-->
         <xsl:apply-templates/>
      </div>
   </xsl:template>

<xsl:template name="__style-for_sbnbr.1">
      <xsl:text> .x-sbnbr-1-0 {margin-left:
0pt; margin-right: 0pt; text-indent: 0pt; color: #0000FF; text-decoration:
underline ; text-decoration: underline ; }</xsl:text>
   </xsl:template>

<xsl:template match="sbnbr" priority="0">
      <div xmlns:dmp="http://www.arbortext.com/namespace/dmp/dmpmap">
         <!--Emit class values to reflect conditions-->
         <xsl:attribute name="class">
            <xsl:text> x-sbnbr-1-0</xsl:text>
         </xsl:attribute>
         <xsl:copy-of select="@ch:*"/>
         <xsl:copy-of select="@dmp:*"/>
         <xsl:call-template name="maybe-set-id"/>
         <!--Process this element's content-->
         <a href="#">
            <xsl:attribute name="onClick">
               <xsl:text>sbLink('</xsl:text>
               <xsl:value-of select="."/>
               <xsl:text>');</xsl:text>
            </xsl:attribute>
            <xsl:apply-templates/>
         </a>
      </div>
   </xsl:template>

<xsl:template match="sblist//sbdata/sbnbr" priority="101">
      <dt xmlns:dmp="http://www.arbortext.com/namespace/dmp/dmpmap">
         <!--Emit class values to reflect conditions-->
         <xsl:attribute name="class">
            <xsl:if test="name(..)='ics' or name(..)='pwcchapsect-item' or name(..)='sbdata' or name(..)='spbnbr'">
               <xsl:text/>
               <xsl:text>x-</xsl:text>
               <xsl:value-of select="string(translate(name(..),':._','---'))"/>
               <xsl:text>-1-0</xsl:text>
            </xsl:if>
            <xsl:text> x-sbnbr-1-0</xsl:text>
         </xsl:attribute>
         <xsl:copy-of select="@ch:*"/>
         <xsl:copy-of select="@dmp:*"/>
         <xsl:call-template name="maybe-set-id"/>
         <!--Process this element's content-->
         <xsl:apply-templates> </xsl:apply-templates>
      </dt>
   </xsl:template>

<xsl:template name="__style-for_sheet.1">
      <xsl:text> .x-sheet-1-0 {margin-left:
0pt; margin-right: 0pt; text-indent: 0pt; margin-top: 8pt; } .x-sheet-1-1
{border-bottom: 2px solid #000000;} .x-sheet-1-2 {}</xsl:text>
   </xsl:template>

<xsl:template match="sheet" priority="0">
      <xsl:param name="hidden" select="'yes'"/>
      <!--Dynamically determine the fo-class-->
      <xsl:variable name="foClass">
         <xsl:choose>
            <xsl:when test="not(@size) or (@size and string(@size)!='big')">hidden</xsl:when>
            <xsl:when test="count(following-sibling::sheet[@size='big']) &gt; 0">graphic-block</xsl:when>
            <xsl:otherwise>graphic-block</xsl:otherwise>
         </xsl:choose>
      </xsl:variable>
      <xsl:variable name="blockness">block</xsl:variable>
      <xsl:variable name="hiddenness">
         <xsl:choose>
            <xsl:when test="not(@size) or (@size and string(@size)!='big')">yes</xsl:when>
            <xsl:when test="count(following-sibling::sheet[@size='big']) &gt; 0">no</xsl:when>
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
                  <xsl:text> x-sheet-1-0</xsl:text>
                  <xsl:if test="count(following-sibling::sheet[@size='big']) &gt; 0"> x-sheet-1-1</xsl:if>
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
         </xsl:when>
         <xsl:when test="$fo-class='block'">
            <div>
               <!--Emit class values to reflect conditions-->
               <xsl:attribute name="class">
                  <xsl:text> x-sheet-1-0</xsl:text>
                  <xsl:if test="count(following-sibling::sheet[@size='big']) &gt; 0"> x-sheet-1-1</xsl:if>
                  <xsl:if test="not(@size) or (@size and string(@size)!='big')"> x-sheet-1-2</xsl:if>
               </xsl:attribute>
               <xsl:if test="count(following-sibling::sheet[@size='big']) &gt; 0">
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
                  <xsl:text> x-sheet-1-0</xsl:text>
                  <xsl:if test="count(following-sibling::sheet[@size='big']) &gt; 0"> x-sheet-1-1</xsl:if>
                  <xsl:if test="not(@size) or (@size and string(@size)!='big')"> x-sheet-1-2</xsl:if>
               </xsl:attribute>
               <xsl:if test="count(following-sibling::sheet[@size='big']) &gt; 0">
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
                              <xsl:value-of select="@gnbr"/>
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
                       <xsl:value-of select="$viewer"/><xsl:text>_Insert('</xsl:text><xsl:value-of select="$idval"/><xsl:text>', '</xsl:text><xsl:value-of select="$width"/><xsl:text>', '</xsl:text><xsl:value-of select="$height"/><xsl:text>', '</xsl:text><xsl:value-of select="$annotation"/><xsl:text>', '</xsl:text>    <xsl:call-template name="get-downloaduri"><xsl:with-param name="viewer" select="$viewer"/></xsl:call-template><xsl:text>');</xsl:text>                         
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
                           <xsl:value-of select="@gnbr"/>
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
               <!--Source edit to add negnum to graphic pop-up window.-->
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

<xsl:template name="__style-for_slavename.1">
      <xsl:text> .x-slavename-1-0 {margin-left: 0pt; margin-right: 0pt; }</xsl:text>
   </xsl:template>

<xsl:template match="slavename" priority="0">
      <span>
         <!--Emit class values to reflect conditions-->
         <xsl:attribute name="class">
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

<xsl:template name="__style-for_slavenbr.1">
      <xsl:text> .x-slavenbr-1-0 {margin-left: 0pt; margin-right: 0pt; }</xsl:text>
   </xsl:template>

<xsl:template match="slavenbr" priority="0">
      <span>
         <!--Emit class values to reflect conditions-->
         <xsl:attribute name="class">
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

<xsl:template name="__style-for_slavepart.1">
      <xsl:text> .x-slavepart-1-0 {margin-left: 0pt; margin-right: 0pt; }</xsl:text>
   </xsl:template>

<xsl:template match="slavepart" priority="0">
      <span>
         <!--Emit class values to reflect conditions-->
         <xsl:attribute name="class">
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

<xsl:template match="_ufe:spblist-title" priority="0">
      <div>
         <xsl:attribute name="ch:title">toc</xsl:attribute>
         <!--Emit class values to reflect conditions-->
         <xsl:attribute name="class">
            <xsl:text> x--ufe-spblist-title-3-0</xsl:text>
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
         <!--Process this element's content-->
         <xsl:apply-templates/>
      </div>
   </xsl:template>

<xsl:template name="__style-for_spbnbr.1">
      <xsl:text> .x-spbnbr-1-0 {margin-left:
0pt; margin-right: 0pt; text-indent: 0pt; margin-top: 6pt; margin-bottom:
6pt; color: #0000FF; text-decoration: underline ; text-decoration:
underline ; }</xsl:text>
   </xsl:template>

<xsl:template match="spbnbr" priority="0">
      <xsl:variable name="foClass">definitionListItem</xsl:variable>
      <xsl:variable name="blockness">block</xsl:variable>
      <xsl:variable name="startnew"/>
      <xsl:variable name="newpageset">#noChange</xsl:variable>
      <a>
         <xsl:attribute name="onClick">
            <xsl:text>spbLink('</xsl:text>
            <xsl:value-of select="."/>
            <xsl:text>');</xsl:text>
         </xsl:attribute>
         <xsl:apply-templates/>
      </a>
   </xsl:template>

<xsl:template match="pwcspblist//pwcspbdata/spbnbr" priority="101">
      <dt>
         <!--Emit class values to reflect conditions-->
         <xsl:attribute name="class">
            <xsl:if test="name(..)='chapsect-item' or name(..)='ics' or name(..)='pwcchapsect-item' or name(..)='pwcspbdata' or name(..)='sbdata' or name(..)='spbnbr'">
               <xsl:text/>
               <xsl:text>x-</xsl:text>
               <xsl:value-of select="string(translate(name(..),':._','---'))"/>
               <xsl:text>-1-0</xsl:text>
            </xsl:if>
            <xsl:text> x-spbnbr-1-0</xsl:text>
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
         <xsl:apply-templates> </xsl:apply-templates>
      </dt>
   </xsl:template>

<xsl:template name="__style-for_statement.1">
      <xsl:text> .x-statement-1-0 {margin-left: 0pt; margin-right: 0pt; text-indent: 0pt; font-weight: normal; font-size: 11pt; text-align: center; }</xsl:text>
   </xsl:template>

<xsl:template match="statement" priority="0">
      <xsl:param name="hidden" select="'yes'"/>
      <xsl:if test="$hidden='no'">
         <div>
            <!--Emit class values to reflect conditions-->
            <xsl:attribute name="class">
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

<xsl:template name="__style-for_std.1">
      <xsl:text> .x-std-1-0 {margin-left: 0pt; margin-right: 0pt; } .x-std-1-1 {}</xsl:text>
   </xsl:template>

<xsl:template match="std" priority="0">
      <xsl:param name="hidden" select="'yes'"/>
      <xsl:variable name="foClass">hidden-inline</xsl:variable>
      <xsl:variable name="blockness">inline</xsl:variable>
      <xsl:variable name="hiddenness">yes</xsl:variable>
      <span>
         <!--Emit class values to reflect conditions-->
         <xsl:attribute name="class">
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
      </span>
   </xsl:template>

<xsl:template name="__style-for_stdname.1">
      <xsl:text> .x-stdname-1-0 {margin-left: 0pt; margin-right: 0pt; }</xsl:text>
   </xsl:template>

<xsl:template match="stdname" priority="0">
      <span>
         <!--Emit class values to reflect conditions-->
         <xsl:attribute name="class">
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

<xsl:template name="__style-for_stdnbr.1">
      <xsl:text> .x-stdnbr-1-0 {margin-left: 0pt; margin-right: 0pt; }</xsl:text>
   </xsl:template>

<xsl:template match="stdnbr" priority="0">
      <span>
         <!--Emit class values to reflect conditions-->
         <xsl:attribute name="class">
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

<xsl:template name="__style-for_step.4predep382">
      <xsl:text> .x-step-2-0 {margin-left:
0pt; margin-right: 0pt; text-indent: 0pt; margin-top: 6pt; margin-bottom:
6pt; margin-left: 0pt; text-indent: 0pt; }</xsl:text>
   </xsl:template>

<xsl:template match="procedure//step[child::*[1] != 'note']" priority="2">
      <xsl:apply-templates select="node()[name() = 'warning' or name() = 'caution' ]"> </xsl:apply-templates>
      <table border="0" cellpadding="0" cellspacing="0">
         <xsl:attribute name="style">
            <xsl:variable name="followWith">emspace</xsl:variable>
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
                  <xsl:apply-templates select="node()[name(.)!='_sfe:BeforeOrAfterText' and name() != 'warning' and name() != 'caution' ]"/>
               </td>
            </tr>
         </tbody>
      </table>
   </xsl:template>

<xsl:template name="__style-for_step.2predep151">
      <xsl:text> .x-step-1-0 {margin-left:
0pt; margin-right: 0pt; text-indent: 0pt; margin-top: 6pt; margin-bottom:
6pt; margin-left: 16pt; text-indent: 0pt; }</xsl:text>
   </xsl:template>

<xsl:template match="procedure//step" priority="10">
      <xsl:apply-templates select="node()[name() = 'warning' or name() = 'caution' or name() = 'note' ]"> </xsl:apply-templates>
      <table xmlns:dmp="http://www.arbortext.com/namespace/dmp/dmpmap" border="0" cellpadding="0" cellspacing="0" width="100%">
         <xsl:variable name="followWith">emspace</xsl:variable>
         <xsl:if test="$followWith='tab'">
            <xsl:attribute name="style">table-layout: fixed; </xsl:attribute>
         </xsl:if>
         <!--Emit class values to reflect conditions-->
         <xsl:attribute name="class">
            <xsl:text> x-step-1-0</xsl:text>
         </xsl:attribute>
         <xsl:copy-of select="@ch:*"/>
         <xsl:copy-of select="@dmp:*"/>
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
                  <xsl:apply-templates select="node()[name(.)!='_sfe:BeforeOrAfterText' and name() != 'warning' and name() != 'caution' and name() != 'note' ]"/>
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

<xsl:template name="__style-for_step2.3st2p2282">
      <xsl:text> .x-step2-2-0
{margin-left: 0pt; margin-right: 0pt; text-indent: 0pt; margin-top:
6pt; margin-bottom: 6pt; margin-left: 0pt; text-indent: 0pt; }</xsl:text>
   </xsl:template>

<xsl:template match="step2[child::*[1] != 'note']" priority="1">
      <xsl:apply-templates select="node()[name() = 'warning' or name() = 'caution' ]"> </xsl:apply-templates>
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
                  <xsl:apply-templates select="node()[name(.)!='_sfe:BeforeOrAfterText' and name() != 'warning' and name() != 'caution' ]"/>
               </td>
            </tr>
         </tbody>
      </table>
   </xsl:template>

<xsl:template name="__style-for_step2.1">
      <xsl:text> .x-step2-1-0 {margin-left:
0pt; margin-right: 0pt; text-indent: 0pt; margin-top: 6pt; margin-bottom:
6pt; margin-left: 0pt; text-indent: 0pt; }</xsl:text>
   </xsl:template>

<xsl:template match="step2" priority="0">
      <xsl:apply-templates select="node()[name() = 'warning' or name() = 'caution' or name() = 'note' ]"> </xsl:apply-templates>
      <table xmlns:dmp="http://www.arbortext.com/namespace/dmp/dmpmap" border="0" cellpadding="0" cellspacing="0" width="100%">
         <xsl:variable name="followWith">emspace</xsl:variable>
         <xsl:if test="$followWith='tab'">
            <xsl:attribute name="style">table-layout: fixed; </xsl:attribute>
         </xsl:if>
         <!--Emit class values to reflect conditions-->
         <xsl:attribute name="class">
            <xsl:text> x-step2-1-0</xsl:text>
         </xsl:attribute>
         <xsl:copy-of select="@ch:*"/>
         <xsl:copy-of select="@dmp:*"/>
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
                  <xsl:apply-templates select="node()[name(.)!='_sfe:BeforeOrAfterText' and name() != 'warning' and name() != 'caution' and name() != 'note' ]"/>
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

<xsl:template name="__style-for_step3.3st3p3282">
      <xsl:text> .x-step3-2-0
{margin-left: 0pt; margin-right: 0pt; text-indent: 0pt; margin-top:
6pt; margin-bottom: 6pt; margin-left: 0pt; text-indent: 0pt; }</xsl:text>
   </xsl:template>

<xsl:template match="step3[child::*[1] != 'note']" priority="1">
      <xsl:apply-templates select="node()[name() = 'warning' or name() = 'caution' ]"> </xsl:apply-templates>
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
                  <xsl:apply-templates select="node()[name(.)!='_sfe:BeforeOrAfterText' and name() != 'warning' and name() != 'caution' ]"/>
               </td>
            </tr>
         </tbody>
      </table>
   </xsl:template>

<xsl:template name="__style-for_step3.1">
      <xsl:text> .x-step3-1-0 {margin-left:
0pt; margin-right: 0pt; text-indent: 0pt; margin-top: 6pt; margin-bottom:
6pt; margin-left: 0pt; text-indent: 0pt; }</xsl:text>
   </xsl:template>

<xsl:template match="step3" priority="0">
      <xsl:apply-templates select="node()[name() = 'warning' or name() = 'caution' or name() = 'note' ]"> </xsl:apply-templates>
      <table border="0" cellpadding="0" cellspacing="0">
         <xsl:attribute name="style">
            <xsl:variable name="followWith">emspace</xsl:variable>
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
                  <xsl:apply-templates select="node()[name(.)!='_sfe:BeforeOrAfterText' and name() != 'warning' and name() != 'caution' and name() != 'note' ]"/>
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

<xsl:template name="__style-for_step4.3st4p4282">
      <xsl:text> .x-step4-2-0
{margin-left: 0pt; margin-right: 0pt; text-indent: 0pt; margin-top:
6pt; margin-bottom: 6pt; margin-left: 0pt; text-indent: 0pt; }</xsl:text>
   </xsl:template>

<xsl:template match="step4[child::*[1] != 'note']" priority="1">
      <xsl:apply-templates select="node()[name() = 'warning' or name() = 'caution' ]"> </xsl:apply-templates>
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
                  <xsl:apply-templates select="node()[name(.)!='_sfe:BeforeOrAfterText' and name() != 'warning' and name() != 'caution' ]"/>
               </td>
            </tr>
         </tbody>
      </table>
   </xsl:template>

<xsl:template name="__style-for_step4.1">
      <xsl:text> .x-step4-1-0 {margin-left:
0pt; margin-right: 0pt; text-indent: 0pt; margin-top: 6pt; margin-bottom:
6pt; margin-left: 0pt; text-indent: 0pt; }</xsl:text>
   </xsl:template>

<xsl:template match="step4" priority="0">
      <xsl:apply-templates select="node()[name() = 'warning' or name() = 'caution' or name() = 'note' ]"> </xsl:apply-templates>
      <table border="0" cellpadding="0" cellspacing="0">
         <xsl:attribute name="style">
            <xsl:variable name="followWith">emspace</xsl:variable>
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
                  <xsl:apply-templates select="node()[name(.)!='_sfe:BeforeOrAfterText' and name() != 'warning' and name() != 'caution' and name() != 'note' ]"/>
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
            <xsl:variable name="followWith">tab</xsl:variable>
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

<xsl:template name="__style-for_step5.3st5p5282">
      <xsl:text> .x-step5-2-0
{margin-left: 0pt; margin-right: 0pt; text-indent: 0pt; margin-top:
6pt; margin-bottom: 6pt; margin-left: 0pt; text-indent: 0pt; }</xsl:text>
   </xsl:template>

<xsl:template match="step5[child::*[1] != 'note']" priority="1">
      <xsl:apply-templates select="node()[name() = 'warning' or name() = 'caution' ]"> </xsl:apply-templates>
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
                  <xsl:apply-templates select="node()[name(.)!='_sfe:BeforeOrAfterText' and name() != 'warning' and name() != 'caution' ]"/>
               </td>
            </tr>
         </tbody>
      </table>
   </xsl:template>

<xsl:template name="__style-for_step5.2st5p552">
      <xsl:text> .x-step5-2-0 {margin-left:
0pt; margin-right: 0pt; text-indent: 0pt; margin-top: 6pt; margin-bottom:
6pt; margin-left: 0pt; text-indent: 0pt; }</xsl:text>
   </xsl:template>

<xsl:template match="step5" priority="0">
      <xsl:apply-templates select="node()[name() = 'warning' or name() = 'caution' or name() = 'note' ]"> </xsl:apply-templates>
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
                  <xsl:apply-templates select="node()[name(.)!='_sfe:BeforeOrAfterText' and name() != 'warning' and name() != 'caution' and name() != 'note' ]"/>
               </td>
            </tr>
         </tbody>
      </table>
   </xsl:template>

<xsl:template name="__style-for_subtask.1">
      <xsl:text> .x-subtask-1-0 {margin-left: 0pt; margin-right: 0pt; text-indent: 0pt; margin-top: 8pt; margin-left: 18pt; text-indent: 0pt; } .x-subtask-1-1 {} .x-subtask-1-2 {} .x-subtask-1-3 {}</xsl:text>
   </xsl:template>

<xsl:template match="subtask" priority="0">
      <xsl:variable name="foClass">formalBlock</xsl:variable>
      <xsl:variable name="blockness">block</xsl:variable>
      <xsl:variable name="startnew"/>
      <xsl:variable name="newpageset">#noChange</xsl:variable>
      <div>
         <!--Emit class values to reflect conditions-->
         <xsl:attribute name="class">
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
         <!--Process this element's content-->
         <xsl:apply-templates/>
      </div>
   </xsl:template>

<xsl:template match="_ufe:supplier-list-title" priority="0">
      <div>
         <xsl:attribute name="ch:title">notoc</xsl:attribute>
         <!--Emit class values to reflect conditions-->
         <xsl:attribute name="class">
            <xsl:text> x--ufe-supplier-list-title-4-0</xsl:text>
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
         <!--Process this element's content-->
         <xsl:apply-templates/>
      </div>
   </xsl:template>

<xsl:template name="__style-for_atidlm-target.1">
      <xsl:text> .x-atidlm-target-1-0 {margin-left: 0pt; margin-right: 0pt; text-indent: 0pt; }</xsl:text>
   </xsl:template>

<xsl:template match="atidlm:target" priority="0">
      <span>
         <!--Emit class values to reflect conditions-->
         <xsl:attribute name="class">
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
         <!--Process this element's content-->
         <xsl:apply-templates/>
      </span>
   </xsl:template>

<xsl:template name="__style-for_task.1">
      <xsl:text> .x-task-1-0 {margin-left: 0pt; margin-right: 0pt; text-indent: 0pt; margin-top: 8pt; } .x-task-1-1 {} .x-task-1-2 {}</xsl:text>
   </xsl:template>

<xsl:template match="task" priority="0">
      <xsl:variable name="foClass">formalBlock</xsl:variable>
      <xsl:variable name="blockness">block</xsl:variable>
      <xsl:variable name="startnew"/>
      <xsl:variable name="newpageset">#noChange</xsl:variable>
      <div>
         <!--Emit class values to reflect conditions-->
         <xsl:attribute name="class">
            <xsl:text> x-task-1-0</xsl:text>
            <xsl:if test="(@confltr) and (not(@confltr) or (@confltr and string(@confltr)!=''))">
               x-task-1-1</xsl:if>
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
         <!--Process this element's content-->
         <xsl:apply-templates/>
      </div>
   </xsl:template>

<xsl:template match="pbfmatr//_ufe:task-title" priority="1">
      <div>
         <xsl:attribute name="ch:title">toc</xsl:attribute>
         <!--Emit class values to reflect conditions-->
         <xsl:attribute name="class">
            <xsl:text> x--ufe-task-title-3-0</xsl:text>
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
         <!--Process this element's content-->
         <xsl:apply-templates/>
      </div>
   </xsl:template>

<xsl:template name="__style-for_taskproc.1">
      <xsl:text> .x-taskproc-1-0 {margin-left: 0pt; margin-right: 0pt; text-indent: 0pt; margin-top: 8pt; margin-left: 18pt; text-indent: 0pt; }</xsl:text>
   </xsl:template>

<xsl:template match="taskproc" priority="0">
      <div>
         <!--Emit class values to reflect conditions-->
         <xsl:attribute name="class">
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

<xsl:template name="__style-for_ted.1">
      <xsl:text> .x-ted-1-0 {margin-left: 0pt; margin-right: 0pt; }</xsl:text>
   </xsl:template>

<xsl:template match="ted" priority="0">
      <xsl:param name="hidden" select="'yes'"/>
      <span>
         <!--Emit class values to reflect conditions-->
         <xsl:attribute name="class">
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
   </xsl:template>

<xsl:template name="__style-for_teddtl.1">
      <xsl:text> .x-teddtl-1-0 {margin-left: 0pt; margin-right: 0pt; }</xsl:text>
   </xsl:template>

<xsl:template match="teddtl" priority="0">
      <xsl:param name="hidden" select="'yes'"/>
      <span>
         <!--Emit class values to reflect conditions-->
         <xsl:attribute name="class">
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
   </xsl:template>

<xsl:template match="_ufe:temp-rev-title" priority="0">
      <div>
         <xsl:attribute name="ch:title">toc</xsl:attribute>
         <!--Emit class values to reflect conditions-->
         <xsl:attribute name="class">
            <xsl:text> x--ufe-temp-rev-title-3-0</xsl:text>
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
         <!--Process this element's content-->
         <xsl:apply-templates/>
      </div>
   </xsl:template>

<xsl:template name="__style-for_tfmatr.1">
      <xsl:text> .x-tfmatr-1-0 {margin-left: 0pt; margin-right: 0pt; text-indent: 0pt; margin-left: 18pt; text-indent: 0pt; }</xsl:text>
   </xsl:template>

<xsl:template match="tfmatr" priority="0">
      <div>
         <!--Emit class values to reflect conditions-->
         <xsl:attribute name="class">
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

<xsl:template match="book[contains(@doctype, 'ipc')]/frontmatter//figure/title" priority="68">
      <div>
         <xsl:attribute name="ch:title">notoc</xsl:attribute>
         <!--Emit class values to reflect conditions-->
         <xsl:attribute name="class">
            <xsl:text> x-title-5-0</xsl:text>
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
         <!--Process this element's content-->
         <xsl:apply-templates/>
      </div>
   </xsl:template>

<xsl:template match="module[@module-name='Airworthiness_Limits']/pgblk/title" priority="65">
      <div>
         <xsl:attribute name="ch:title">toc</xsl:attribute>
         <!--Emit class values to reflect conditions-->
         <xsl:attribute name="class">
            <xsl:text> x-title-8-0</xsl:text>
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
         <!--Process this element's content-->
         <xsl:apply-templates/>
      </div>
   </xsl:template>

<xsl:template match="page-block[@pb-name='ni']//mfmatr/title" priority="56">
      <div>
         <xsl:attribute name="ch:title">toc</xsl:attribute>
         <!--Emit class values to reflect conditions-->
         <xsl:attribute name="class">
            <xsl:text> x-title-17-0</xsl:text>
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
         <!--Process this element's content-->
         <xsl:apply-templates/>
      </div>
   </xsl:template>

<xsl:template match="page-block[@pb-name='record-of-revisions']//n-para/title" priority="55">
      <div>
         <xsl:attribute name="ch:title">notoc</xsl:attribute>
         <!--Emit class values to reflect conditions-->
         <xsl:attribute name="class">
            <xsl:text> x-title-18-0</xsl:text>
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
         <!--Process this element's content-->
         <xsl:apply-templates/>
      </div>
   </xsl:template>

<xsl:template match="book[contains(@doctype, 'epc')]//figure/title" priority="54">
      <div>
         <xsl:attribute name="ch:title">notoc</xsl:attribute>
         <!--Emit class values to reflect conditions-->
         <xsl:attribute name="class">
            <xsl:text> x-title-19-0</xsl:text>
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
         <!--Process this element's content-->
         <xsl:apply-templates/>
      </div>
   </xsl:template>

<xsl:template match="book[contains(@doctype, 'epc')]//graphic/title" priority="53">
      <div>
         <xsl:attribute name="ch:title">notoc</xsl:attribute>
         <!--Emit class values to reflect conditions-->
         <xsl:attribute name="class">
            <xsl:text> x-title-20-0</xsl:text>
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
         <!--Process this element's content-->
         <xsl:apply-templates/>
      </div>
   </xsl:template>

<xsl:template match="book[contains(@doctype, 'ipc')]//figure/title" priority="52">
      <div>
         <xsl:attribute name="ch:title">notoc</xsl:attribute>
         <!--Emit class values to reflect conditions-->
         <xsl:attribute name="class">
            <xsl:text> x-title-21-0</xsl:text>
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
         <!--Process this element's content-->
         <xsl:apply-templates/>
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
               <xsl:call-template name="maybe-set-id">
                  <xsl:with-param name="only-if-id-attr" select="'no'"/>
                  <xsl:with-param name="generated-id-prefix" select="'styler-id'"/>
               </xsl:call-template>
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
               <xsl:call-template name="maybe-set-id">
                  <xsl:with-param name="only-if-id-attr" select="'no'"/>
                  <xsl:with-param name="generated-id-prefix" select="'styler-id'"/>
               </xsl:call-template>
               <!--Process this element's content-->
               <xsl:apply-templates/>
            </div>
         </xsl:when>
      </xsl:choose>
   </xsl:template>

<xsl:template match="pwcpbfront/title" priority="39">
      <div>
         <xsl:attribute name="ch:title">toc</xsl:attribute>
         <!--Emit class values to reflect conditions-->
         <xsl:attribute name="class">
            <xsl:text> x-title-34-0</xsl:text>
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
         <!--Process this element's content-->
         <xsl:apply-templates/>
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
      <div>
         <xsl:attribute name="ch:title">toc</xsl:attribute>
         <!--Emit class values to reflect conditions-->
         <xsl:attribute name="class">
            <xsl:text> x-title-38-0</xsl:text>
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
         <!--Process this element's content-->
         <xsl:apply-templates/>
      </div>
   </xsl:template>

<xsl:template match="sblist/title" priority="32">
      <div>
         <xsl:attribute name="ch:title">toc</xsl:attribute>
         <!--Emit class values to reflect conditions-->
         <xsl:attribute name="class">
            <xsl:text> x-title-41-0</xsl:text>
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
         <!--Process this element's content-->
         <xsl:apply-templates/>
      </div>
   </xsl:template>

<xsl:template match="pwcni/title" priority="31">
      <div>
         <xsl:attribute name="ch:title">toc</xsl:attribute>
         <!--Emit class values to reflect conditions-->
         <xsl:attribute name="class">
            <xsl:text> x-title-42-0</xsl:text>
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
         <!--Process this element's content-->
         <xsl:apply-templates/>
      </div>
   </xsl:template>

<xsl:template match="vendlist/title" priority="30">
      <div>
         <xsl:attribute name="ch:title">notoc</xsl:attribute>
         <!--Emit class values to reflect conditions-->
         <xsl:attribute name="class">
            <xsl:text> x-title-43-0</xsl:text>
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
         <!--Process this element's content-->
         <xsl:apply-templates/>
      </div>
   </xsl:template>

<xsl:template match="pgblk/title" priority="29">
      <div>
         <xsl:attribute name="ch:title">toc</xsl:attribute>
         <!--Emit class values to reflect conditions-->
         <xsl:attribute name="class">
            <xsl:text> x-title-44-0</xsl:text>
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
         <!--Process this element's content-->
         <xsl:apply-templates/>
      </div>
   </xsl:template>

<xsl:template match="lof-item/title" priority="21">
      <div>
         <xsl:attribute name="ch:title">toc</xsl:attribute>
         <!--Emit class values to reflect conditions-->
         <xsl:attribute name="class">
            <xsl:text> x-title-52-0</xsl:text>
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
         <!--Process this element's content-->
         <xsl:apply-templates/>
      </div>
   </xsl:template>

<xsl:template match="lof/title" priority="18">
      <div>
         <xsl:attribute name="ch:title">toc</xsl:attribute>
         <!--Emit class values to reflect conditions-->
         <xsl:attribute name="class">
            <xsl:text> x-title-55-0</xsl:text>
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
         <!--Process this element's content-->
         <xsl:apply-templates/>
      </div>
   </xsl:template>

<xsl:template match="spb-list/title" priority="14">
      <div>
         <xsl:attribute name="ch:title">notoc</xsl:attribute>
         <!--Emit class values to reflect conditions-->
         <xsl:attribute name="class">
            <xsl:text> x-title-59-0</xsl:text>
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
         <!--Process this element's content-->
         <xsl:apply-templates/>
      </div>
   </xsl:template>

<xsl:template match="service-bull-list/title" priority="10">
      <div>
         <xsl:attribute name="ch:title">notoc</xsl:attribute>
         <!--Emit class values to reflect conditions-->
         <xsl:attribute name="class">
            <xsl:text> x-title-63-0</xsl:text>
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
         <!--Process this element's content-->
         <xsl:apply-templates/>
      </div>
   </xsl:template>

<xsl:template match="module/title" priority="9">
      <div>
         <xsl:attribute name="ch:title">notoc</xsl:attribute>
         <!--Emit class values to reflect conditions-->
         <xsl:attribute name="class">
            <xsl:text> x-title-64-0</xsl:text>
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
         <!--Process this element's content-->
         <xsl:apply-templates/>
      </div>
   </xsl:template>

<xsl:template match="num-index/title" priority="7">
      <div>
         <xsl:attribute name="ch:title">notoc</xsl:attribute>
         <!--Emit class values to reflect conditions-->
         <xsl:attribute name="class">
            <xsl:text> x-title-66-0</xsl:text>
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
         <!--Process this element's content-->
         <xsl:apply-templates/>
      </div>
   </xsl:template>

<xsl:template match="pwcchapsect-list//pwcchapsect-item/title" priority="100">
      <dd>
         <!--Emit class values to reflect conditions-->
         <xsl:attribute name="class">
            <xsl:if test="name(..)='chapsect-item' or name(..)='chapsect-title' or name(..)='ics' or name(..)='pwcchapsect-item' or name(..)='pwcspbdata' or name(..)='sbdata' or name(..)='spbnbr'">
               <xsl:text/>
               <xsl:text>x-</xsl:text>
               <xsl:value-of select="string(translate(name(..),':._','---'))"/>
               <xsl:text>-1-0</xsl:text>
            </xsl:if>
            <xsl:text> x-title-45-0</xsl:text>
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
      </dd>
   </xsl:template>

<xsl:template match="_ufe:tmm-title" priority="0">
      <xsl:variable name="foClass">title</xsl:variable>
      <xsl:variable name="blockness">block</xsl:variable>
      <xsl:variable name="startnew"/>
      <xsl:variable name="newpageset">#noChange</xsl:variable>
      <div>
         <xsl:attribute name="ch:title">toc</xsl:attribute>
         <!--Emit class values to reflect conditions-->
         <xsl:attribute name="class">
            <xsl:text> x--ufe-tmm-title-3-0</xsl:text>
            <xsl:if test="contains(//book/@doctype, 'lmm')"> x--ufe-tmm-title-3-1</xsl:if>
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
         <xsl:attribute name="id">
            <xsl:call-template name="object.id"/>
         </xsl:attribute>
         <xsl:call-template name="maybe-set-id">
            <xsl:with-param name="only-if-id-attr" select="'no'"/>
            <xsl:with-param name="generated-id-prefix" select="'styler-id'"/>
         </xsl:call-template>
         <!--Process this element's content-->
         <xsl:apply-templates/>
      </div>
   </xsl:template>

<xsl:template name="__style-for_tprereq.1">
      <xsl:text> .x-tprereq-1-0 {margin-left: 0pt; margin-right: 0pt; text-indent: 0pt; margin-top: 8pt; }</xsl:text>
   </xsl:template>

<xsl:template match="tprereq" priority="0">
      <div>
         <!--Emit class values to reflect conditions-->
         <xsl:attribute name="class">
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

<xsl:template name="__style-for_transltr.1">
      <xsl:text> .x-transltr-1-0 {margin-left: 0pt; margin-right: 0pt; }</xsl:text>
   </xsl:template>

<xsl:template match="transltr" priority="0">
      <!--Emit a nostyle template-->
      <xsl:apply-templates/>
   </xsl:template>

<xsl:template name="__style-for_trdata.1">
      <xsl:text> .x-trdata-1-0 {margin-left: 0pt; margin-right: 0pt; text-indent: 0pt; }</xsl:text>
   </xsl:template>

<xsl:template match="trdata" priority="0">
      <div>
         <!--Emit class values to reflect conditions-->
         <xsl:attribute name="class">
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

<xsl:template name="__style-for_trlist.1">
      <xsl:text> .x-trlist-1-0 {margin-left: 0pt; margin-right: 0pt; text-indent: 0pt; }</xsl:text>
   </xsl:template>

<xsl:template match="trlist" priority="0">
      <div>
         <!--Emit class values to reflect conditions-->
         <xsl:attribute name="class">
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

<xsl:template name="__style-for_trloc.1">
      <xsl:text> .x-trloc-1-0 {margin-left: 0pt; margin-right: 0pt; }</xsl:text>
   </xsl:template>

<xsl:template match="trloc" priority="0">
      <span>
         <!--Emit class values to reflect conditions-->
         <xsl:attribute name="class">
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

<xsl:template name="__style-for_trnbr.1">
      <xsl:text> .x-trnbr-1-0 {margin-left: 0pt; margin-right: 0pt; }</xsl:text>
   </xsl:template>

<xsl:template match="trnbr" priority="0">
      <span>
         <!--Emit class values to reflect conditions-->
         <xsl:attribute name="class">
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

<xsl:template name="__style-for_trstatus.1">
      <xsl:text> .x-trstatus-1-0 {margin-left: 0pt; margin-right: 0pt; }</xsl:text>
   </xsl:template>

<xsl:template match="trstatus" priority="0">
      <span>
         <!--Emit class values to reflect conditions-->
         <xsl:attribute name="class">
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

<xsl:template name="__style-for_txtgrphc.1">
      <xsl:text> .x-txtgrphc-1-0 {margin-left: 0pt; margin-right: 0pt; }</xsl:text>
   </xsl:template>

<xsl:template match="txtgrphc" priority="0">
      <!--Emit a nostyle template-->
      <xsl:apply-templates/>
   </xsl:template>

<xsl:template name="__style-for_txtline.1">
      <xsl:text> .x-txtline-1-0 {margin-left: 0pt; margin-right: 0pt; }</xsl:text>
   </xsl:template>

<xsl:template match="txtline" priority="0">
      <!--Emit a nostyle template-->
      <xsl:apply-templates/>
   </xsl:template>

<xsl:template name="_gte-toc-Table_of_Contents">
      <xsl:apply-templates mode="toc-mode-Table_of_Contents" select="//_ufe:chapsect-title|//_ufe:cir-title|//_ufe:consumables-title|//_ufe:consumables-title|//_ufe:em-title|//_ufe:fixequ-title|//_ufe:fixequ-title|//_ufe:general-title|//_ufe:general-title|//_ufe:howtouse-title|//_ufe:intro-title|//manual-title|//pageblock-title|//pageblock-title|//_ufe:sblist-title|//_ufe:spblist-title|//_ufe:spectools-title|//_ufe:spectools-title|//_ufe:task-title|//_ufe:temp-rev-title|//title|//title|//title|//title|//title|//title|//title|//title|//title|//title|//title|//title|//title|//title|//title|//title|//title|//title|//title|//title|//title|//_ufe:tmm-title"/>
   </xsl:template>

<xsl:template name="generate-external-css-file">
      <xsl:if test="$external-css-filename!=''">
         <xsl:result-document href="{$external-css-filename}" method="text" indent="yes"> &#xD;
               <xsl:variable name="effective-document-elemname" select="name(//*[not(self::RDStyle) and not(self::ResolvedMap)][1])"/>
            <xsl:choose>
               <xsl:when test="$effective-document-elemname='book'">
                  <xsl:text>body {font-family: serif; font-weight: normal; font-style: normal; score-spaces: true; line-height: 1.1; margin-left: 0pt; margin-right: 0pt; text-indent: 0pt; font-family: Verdana; font-size: 10pt; margin-left: 5px; width: 95%; }</xsl:text>
               </xsl:when>
               <xsl:when test="true()"/>
            </xsl:choose> &#xD; &#xD; .x--sfe-BeforeOrAfterText-1-0 {margin-left: 0pt; margin-right:
            0pt; } &#xD; &#xD; .x--sfe-CollectionItem-1-0 {margin-left: 0pt; margin-right: 0pt; }
            &#xD; &#xD; .x--sfe-CollectionItem-2-0 {margin-left: 0pt; margin-right: 0pt; } &#xD;
            &#xD; .x--sfe-CollectionItem-3-0 {margin-left: 0pt; margin-right: 0pt; } &#xD; &#xD;
            .x--sfe-CollectionItem-4-0 {margin-left: 0pt; margin-right: 0pt; } &#xD; &#xD;
            .x--sfe-CrossReference-1-0 {margin-left: 0pt; margin-right: 0pt; } &#xD; &#xD;
            .x--sfe-CrossReferenceTitle-1-0 {margin-left: 0pt; margin-right: 0pt; } &#xD; &#xD;
            .x--sfe-CrossReferenceTitle-2-0 {margin-left: 0pt; margin-right: 0pt; font-style:
            italic; } &#xD; &#xD; .x--sfe-ExternalLink-1-0 {margin-left: 0pt; margin-right: 0pt;
            color: #0000FF; text-decoration: underline ; } &#xD; &#xD; .x--sfe-Gentext-1-0
            {margin-left: 0pt; margin-right: 0pt; } &#xD; &#xD; .x--sfe-HeaderOrFooter-1-0
            {margin-left: 0pt; margin-right: 0pt; text-indent: 0pt; margin-top: 0pt; } &#xD; &#xD;
            .x--sfe-Index-1-0 {margin-left: 0pt; margin-right: 0pt; text-indent: 0pt; } &#xD; &#xD;
            .x--sfe-IndexAlphaGroup-1-0 {margin-left: 0pt; margin-right: 0pt; text-indent: 0pt;
            margin-top: 1.5pc; } &#xD; &#xD; .x--sfe-IndexEndPage-1-0 {margin-left: 0pt;
            margin-right: 0pt; } &#xD; &#xD; .x--sfe-IndexEntry-1-0 {margin-left: 0pt; margin-right:
            0pt; text-indent: 0pt; margin-left: 1em; text-indent: -.5em; text-align: left; } &#xD;
            &#xD; .x--sfe-IndexEntry-2-0 {margin-left: 0pt; margin-right: 0pt; text-indent: 0pt;
            margin-left: 1em; text-indent: -.5em; text-align: left; } &#xD; &#xD;
            .x--sfe-IndexEntry-3-0 {margin-left: 0pt; margin-right: 0pt; text-indent: 0pt;
            margin-left: 1em; text-indent: -.5em; text-align: left; } &#xD; &#xD;
            .x--sfe-IndexEntry-4-0 {margin-left: 0pt; margin-right: 0pt; text-indent: 0pt;
            margin-left: .5em; margin-right: 2pc; text-indent: -.5em; text-align: left; } &#xD;
            &#xD; .x--sfe-IndexGroupHead-1-0 {margin-left: 0pt; margin-right: 0pt; text-indent: 0pt;
            font-family: sans-serif; font-weight: bold; font-size: 14pt; text-transform: uppercase;
            text-align: left; margin-bottom: .5pc; } &#xD; &#xD; .x--sfe-IndexHeading-1-0
            {margin-left: 0pt; margin-right: 0pt; } &#xD; &#xD; .x--sfe-IndexLocators-1-0
            {margin-left: 0pt; margin-right: 0pt; } &#xD; &#xD; .x--sfe-IndexPage-1-0 {margin-left:
            0pt; margin-right: 0pt; } &#xD; &#xD; .x--sfe-IndexPage-2-0 {margin-left: 0pt;
            margin-right: 0pt; } &#xD; &#xD; .x--sfe-IndexPostGroup-1-0 {margin-left: 0pt;
            margin-right: 0pt; text-indent: 0pt; margin-top: 1.5pc; } &#xD; &#xD;
            .x--sfe-IndexPreGroup-1-0 {margin-left: 0pt; margin-right: 0pt; text-indent: 0pt;
            margin-top: 1.5pc; } &#xD; &#xD; .x--sfe-IndexRangeGroup-1-0 {margin-left: 0pt;
            margin-right: 0pt; text-indent: 0pt; margin-top: 1.5pc; } &#xD; &#xD;
            .x--sfe-IndexSee-1-0 {margin-left: 0pt; margin-right: 0pt; } &#xD; &#xD;
            .x--sfe-IndexSeeAlso-1-0 {margin-left: 0pt; margin-right: 0pt; text-indent: 0pt;
            margin-left: 3em; text-indent: -1.5em; } &#xD; &#xD; .x--sfe-IndexSubGroupHead-1-0
            {margin-left: 0pt; margin-right: 0pt; text-indent: 0pt; font-weight: bold; font-size:
            14pt; text-transform: uppercase; text-align: left; margin-top: 2pc; } &#xD; &#xD;
            .x--sfe-InternalLink-1-0 {margin-left: 0pt; margin-right: 0pt; color: #0000FF;
            text-decoration: underline ; } &#xD; &#xD; .x--sfe-RepeatingTitle-1-0 {margin-left: 0pt;
            margin-right: 0pt; text-indent: 0pt; } &#xD; &#xD; .x--sfe-TableOfContents-1-0
            {margin-left: 0pt; margin-right: 0pt; text-indent: 0pt; } &#xD; &#xD;
            .x--sfe-TocEntry1-Table-of-Contents-1-0 {margin-left: 0pt; margin-right: 0pt;
            text-indent: 0pt; margin-left: 4em; margin-right: 2pc; text-indent: -4.00em; } &#xD;
            &#xD; .x--sfe-TocEntry2-Table-of-Contents-1-0 {margin-left: 0pt; margin-right: 0pt;
            text-indent: 0pt; margin-left: 6em; margin-right: 2pc; text-indent: -4.00em; } &#xD;
            &#xD; .x--sfe-TocEntry3-Table-of-Contents-1-0 {margin-left: 0pt; margin-right: 0pt;
            text-indent: 0pt; margin-left: 8em; margin-right: 2pc; text-indent: -4.00em; } &#xD;
            &#xD; .x--sfe-TocEntry4-Table-of-Contents-1-0 {margin-left: 0pt; margin-right: 0pt;
            text-indent: 0pt; margin-left: 10em; margin-right: 2pc; text-indent: -4.00em; } &#xD;
            &#xD; .x--sfe-TocEntry5-Table-of-Contents-1-0 {margin-left: 0pt; margin-right: 0pt;
            text-indent: 0pt; margin-left: 12em; margin-right: 2pc; text-indent: -12em; } &#xD;
            &#xD; .x--sfe-TocEntry6-Table-of-Contents-1-0 {margin-left: 0pt; margin-right: 0pt;
            text-indent: 0pt; margin-left: 14em; margin-right: 2pc; text-indent: -14em; } &#xD;
            &#xD; .x--sfe-TocLabel-Table-of-Contents-1-0 {margin-left: 0pt; margin-right: 0pt; }
            &#xD; &#xD; .x--sfe-TocPage-Table-of-Contents-1-0 {margin-left: 0pt; margin-right: 0pt;
            } &#xD; &#xD; .x--sfe-TocTable-of-Contents-1-0 {margin-left: 0pt; margin-right: 0pt; }
            &#xD; &#xD; .x--sfe-TocTitle-Table-of-Contents-1-0 {margin-left: 0pt; margin-right: 0pt;
            } &#xD; &#xD; .x-address-1-0 {margin-left: 0pt; margin-right: 0pt; text-indent: 0pt;
            margin-top: 6pt; margin-bottom: 6pt; margin-left: 0pt; text-indent: 0pt; } &#xD; &#xD;
            .x-address-2-0 {margin-left: 0pt; margin-right: 0pt; text-indent: 0pt; margin-top: 6pt;
            margin-bottom: 6pt; margin-left: 0pt; text-indent: 0pt; } &#xD; &#xD; .x-address-3-0
            {margin-left: 0pt; margin-right: 0pt; text-indent: 0pt; margin-top: 6pt; margin-bottom:
            6pt; margin-left: 0pt; text-indent: 0pt; } &#xD; &#xD; .x-address-4-0 {margin-left: 0pt;
            margin-right: 0pt; text-indent: 0pt; margin-top: 6pt; margin-bottom: 6pt; margin-left:
            0pt; text-indent: 0pt; } &#xD; &#xD; .x-address-5-0 {margin-left: 0pt; margin-right:
            0pt; text-indent: 0pt; margin-top: 6pt; margin-bottom: 6pt; margin-left: 0pt;
            text-indent: 0pt; } &#xD; &#xD; .x-address-6-0 {margin-left: 0pt; margin-right: 0pt;
            text-indent: 0pt; margin-top: 6pt; margin-bottom: 6pt; margin-left: 0pt; text-indent:
            0pt; } &#xD; &#xD; .x-address-7-0 {margin-left: 0pt; margin-right: 0pt; text-indent:
            0pt; margin-top: 6pt; margin-bottom: 6pt; margin-left: 0pt; text-indent: 0pt; } &#xD;
            &#xD; .x-address-8-0 {margin-left: 0pt; margin-right: 0pt; text-indent: 0pt; margin-top:
            6pt; margin-bottom: 6pt; margin-left: 0pt; text-indent: 0pt; } &#xD; &#xD;
            .x-ais-item-1-0 {margin-left: 0pt; margin-right: 0pt; } &#xD; &#xD; .x-ais-list-1-0
            {margin-left: 0pt; margin-right: 0pt; } &#xD; &#xD; .x-aisnbr-1-0 {margin-left: 0pt;
            margin-right: 0pt; } &#xD; &#xD; .x-aispart-1-0 {margin-left: 0pt; margin-right: 0pt; }
            &#xD; &#xD; .x-aistitle-1-0 {margin-left: 0pt; margin-right: 0pt; } &#xD; &#xD;
            .x-alpha-list-1-0 {margin-left: 0pt; margin-right: 0pt; text-indent: 0pt; margin-top:
            8pt; } &#xD; &#xD; .x-applic-group-1-0 {margin-left: 0pt; margin-right: 0pt; } &#xD;
            &#xD; .x-applic-item-1-0 {margin-left: 0pt; margin-right: 0pt; } &#xD; &#xD; .x-att-1-0
            {margin-left: 0pt; margin-right: 0pt; text-indent: 0pt; margin-top: 8pt; margin-left:
            61.00pt; text-indent: -60pt; margin-bottom: 8pt; } &#xD; &#xD; .x-att-2-0 {margin-left:
            0pt; margin-right: 0pt; text-indent: 0pt; } &#xD; &#xD; .x-aw-notice-1-0 {margin-left:
            0pt; margin-right: 0pt; text-indent: 0pt; font-weight: normal; font-size: 11pt;
            text-align: center; } &#xD; &#xD; .x-awlror-1-0 {margin-left: 0pt; margin-right: 0pt;
            text-indent: 0pt; } &#xD; &#xD; .x-awlrorsection-1-0 {margin-left: 0pt; margin-right:
            0pt; } &#xD; &#xD; .x-barend-1-0 {margin-left: 0pt; margin-right: 0pt; } &#xD; &#xD;
            .x-barstart-1-0 {margin-left: 0pt; margin-right: 0pt; } &#xD; &#xD;
            .x--ufe-block-nospace-1-0 {margin-left: 0pt; margin-right: 0pt; text-indent: 0pt; }
            &#xD; &#xD; .x--ufe-block-prespace-1-0 {margin-left: 0pt; margin-right: 0pt;
            text-indent: 0pt; margin-top: 8pt; } &#xD; &#xD; .x-book-1-0 {margin-left: 0pt;
            margin-right: 0pt; text-indent: 0pt; font-family: Verdana; font-size: 10pt; } &#xD;
            &#xD; .x-brk-1-0 {margin-left: 0pt; margin-right: 0pt; } &#xD; &#xD; .x-bullist-1-0
            {margin-left: 0pt; margin-right: 0pt; text-indent: 0pt; margin-top: 8pt; } &#xD; &#xD;
            .x-callout-1-0 {margin-left: 0pt; margin-right: 0pt; } &#xD; &#xD; .x-callout-2-0
            {margin-left: 0pt; margin-right: 0pt; } &#xD; &#xD; .x-caution-1-0 {margin-left: 0pt;
            margin-right: 0pt; text-indent: 0pt; margin-top: 8pt; font-weight: bold; margin-left:
            81pt; text-indent: -63pt; } &#xD; &#xD; .x-caution-2-0 {margin-left: 0pt; margin-right:
            0pt; text-indent: 0pt; margin-top: 8pt; font-weight: bold; margin-left: 81pt;
            text-indent: -63pt; } &#xD; &#xD; .x-caution-3-0 {margin-left: 0pt; margin-right: 0pt;
            text-indent: 0pt; margin-top: 8pt; font-weight: bold; margin-left: 87pt; text-indent:
            -63pt; } &#xD; &#xD; .x-caution-4-0 {margin-left: 0pt; margin-right: 0pt; text-indent:
            0pt; margin-top: 8pt; font-weight: bold; margin-left: 98pt; text-indent: -63pt; } &#xD;
            &#xD; .x-caution-5-0 {margin-left: 0pt; margin-right: 0pt; text-indent: 0pt; margin-top:
            8pt; font-weight: bold; margin-left: 98pt; text-indent: -63pt; } &#xD; &#xD;
            .x-caution-6-0 {margin-left: 0pt; margin-right: 0pt; text-indent: 0pt; } &#xD; &#xD;
            .x-caution-7-0 {margin-left: 0pt; margin-right: 0pt; text-indent: 0pt; } &#xD; &#xD;
            .x-caution-8-0 {margin-left: 0pt; margin-right: 0pt; text-indent: 0pt; } &#xD; &#xD;
            .x-caution-9-0 {margin-left: 0pt; margin-right: 0pt; text-indent: 0pt; } &#xD; &#xD;
            .x-caution-10-0 {margin-left: 0pt; margin-right: 0pt; text-indent: 0pt; } &#xD; &#xD;
            .x-caution-11-0 {margin-left: 0pt; margin-right: 0pt; text-indent: 0pt; margin-top: 8pt;
            font-weight: bold; margin-left: 80pt; text-indent: -62pt; } &#xD; &#xD; .x-caution-12-0
            {margin-left: 0pt; margin-right: 0pt; text-indent: 0pt; margin-top: 8pt; font-weight:
            bold; margin-left: 64pt; text-indent: -63pt; margin-top: 10pt; } &#xD; &#xD;
            .x--ufe-center-1-0 {margin-left: 0pt; margin-right: 0pt; text-indent: 0pt; text-align:
            center; } &#xD; &#xD; .x-ch-se-su-1-0 {margin-left: 0pt; margin-right: 0pt; } &#xD;
            &#xD; .x-change-1-0 {margin-left: 0pt; margin-right: 0pt; } &#xD; &#xD; .x-chapsect-1-0
            {margin-left: 0pt; margin-right: 0pt; } &#xD; &#xD; .x-chapsect-item-1-0 {margin-left:
            0pt; margin-right: 0pt; text-indent: 0pt; margin-top: 6pt; margin-bottom: 6pt; } &#xD;
            &#xD; .x-chapsect-list-1-0 {margin-left: 0pt; margin-right: 0pt; text-indent: 0pt;
            margin-top: 8pt; } &#xD; &#xD; .x-chapsect-title-1-0 {margin-left: 0pt; margin-right:
            0pt; text-indent: 0pt; margin-top: 6pt; margin-bottom: 6pt; } &#xD; &#xD;
            .x--ufe-chapsect-title-1-0 {margin-left: 0pt; margin-right: 0pt; text-indent: 0pt;
            font-family: sans-serif; color: #0000FF; text-align: left; line-height: 1.1; margin-top:
            1.5em; margin-bottom: 1em; margin-left: 0pt; text-indent: 0pt; } &#xD; &#xD;
            .x--ufe-chapsect-title-2-0 {margin-left: 0pt; margin-right: 0pt; text-indent: 0pt;
            font-family: sans-serif; color: #0000FF; text-align: left; line-height: 1.1; margin-top:
            1.5em; margin-bottom: 1em; margin-left: 0pt; text-indent: 0pt; } &#xD; &#xD;
            .x--ufe-chapsect-title-3-0 {margin-left: 0pt; margin-right: 0pt; text-indent: 0pt;
            font-weight: bold; font-size: 14pt; } &#xD; &#xD; .x-chapter-1-0 {margin-left: 0pt;
            margin-right: 0pt; text-indent: 0pt; } &#xD; &#xD; .x-chapter-front-1-0 {margin-left:
            0pt; margin-right: 0pt; } &#xD; &#xD; .x-chgdesc-1-0 {margin-left: 0pt; margin-right:
            0pt; } &#xD; &#xD; .x--ufe-cir-title-1-0 {margin-left: 0pt; margin-right: 0pt;
            text-indent: 0pt; font-family: sans-serif; color: #0000FF; text-align: left;
            line-height: 1.1; margin-top: 1.5em; margin-bottom: 1em; margin-left: 0pt; text-indent:
            0pt; } &#xD; &#xD; .x--ufe-cir-title-2-0 {margin-left: 0pt; margin-right: 0pt;
            text-indent: 0pt; font-family: sans-serif; color: #0000FF; text-align: left;
            line-height: 1.1; margin-top: 1.5em; margin-bottom: 1em; margin-left: 0pt; text-indent:
            0pt; } &#xD; &#xD; .x--ufe-cir-title-3-0 {margin-left: 0pt; margin-right: 0pt;
            text-indent: 0pt; font-weight: bold; font-size: 36pt; text-align: center; margin-bottom:
            12pt; } &#xD; &#xD; .x-city-1-0 {margin-left: 0pt; margin-right: 0pt; } &#xD;
            .x-city-1-1 {} &#xD; &#xD; .x-co-name-1-0 {margin-left: 0pt; margin-right: 0pt;
            text-indent: 0pt; } &#xD; &#xD; .x-colspec-1-0 {margin-left: 0pt; margin-right: 0pt; }
            &#xD; &#xD; .x-comment-1-0 {margin-left: 0pt; margin-right: 0pt; } &#xD; &#xD;
            .x-con-1-0 {margin-left: 0pt; margin-right: 0pt; } &#xD; .x-con-1-1 {} &#xD; &#xD;
            .x-conindex-1-0 {margin-left: 0pt; margin-right: 0pt; } &#xD; &#xD; .x-conname-1-0
            {margin-left: 0pt; margin-right: 0pt; } &#xD; &#xD; .x-connbr-1-0 {margin-left: 0pt;
            margin-right: 0pt; } &#xD; &#xD; .x-consumable-1-0 {margin-left: 0pt; margin-right: 0pt;
            color: #000080; text-decoration: underline ; } &#xD; &#xD; .x--ufe-consumables-title-1-0
            {margin-left: 0pt; margin-right: 0pt; text-indent: 0pt; font-family: sans-serif; color:
            #0000FF; text-align: left; line-height: 1.1; margin-top: 1.5em; margin-bottom: 1em;
            margin-left: 0pt; text-indent: 0pt; } &#xD; &#xD; .x--ufe-consumables-title-2-0
            {margin-left: 0pt; margin-right: 0pt; text-indent: 0pt; font-family: sans-serif; color:
            #0000FF; text-align: left; line-height: 1.1; margin-top: 1.5em; margin-bottom: 1em;
            margin-left: 0pt; text-indent: 0pt; } &#xD; &#xD; .x--ufe-consumables-title-3-0
            {margin-left: 0pt; margin-right: 0pt; text-indent: 0pt; font-family: sans-serif; color:
            #0000FF; text-align: left; line-height: 1.1; margin-top: 1.5em; margin-bottom: 1em;
            margin-left: 0pt; text-indent: 0pt; } &#xD; &#xD; .x--ufe-consumables-title-4-0
            {margin-left: 0pt; margin-right: 0pt; text-indent: 0pt; font-weight: bold; margin-left:
            1.5em; text-indent: -1.5em; } &#xD; &#xD; .x--ufe-consumables-title-5-0 {margin-left:
            0pt; margin-right: 0pt; text-indent: 0pt; font-weight: bold; margin-left: 1.5em;
            text-indent: -1.5em; } &#xD; &#xD; .x--ufe-consumables-title-6-0 {margin-left: 0pt;
            margin-right: 0pt; text-indent: 0pt; } &#xD; &#xD; .x-consume-list-1-0 {margin-left:
            0pt; margin-right: 0pt; text-indent: 0pt; } &#xD; &#xD; .x-country-1-0 {margin-left:
            0pt; margin-right: 0pt; text-indent: 0pt; } &#xD; &#xD; .x-csn-1-0 {margin-left: 0pt;
            margin-right: 0pt; } &#xD; &#xD; .x-csu-1-0 {margin-left: 0pt; margin-right: 0pt;
            text-indent: 0pt; } &#xD; &#xD; .x-csu-instance-1-0 {margin-left: 0pt; margin-right:
            0pt; } &#xD; &#xD; .x-dash-1-0 {margin-left: 0pt; margin-right: 0pt; } &#xD; &#xD;
            .x-def-1-0 {margin-left: 0pt; margin-right: 0pt; } &#xD; &#xD; .x-def-2-0 {margin-left:
            0pt; margin-right: 0pt; } &#xD; &#xD; .x-def-3-0 {margin-left: 0pt; margin-right: 0pt; }
            &#xD; &#xD; .x-deflist-1-0 {margin-left: 0pt; margin-right: 0pt; text-indent: 0pt;
            margin-left: 29pt; text-indent: 0pt; } &#xD; &#xD; .x-deflist-2-0 {margin-left: 0pt;
            margin-right: 0pt; text-indent: 0pt; margin-top: 8pt; font-size: 9pt; } &#xD; &#xD;
            .x-delete-1-0 {margin-left: 0pt; margin-right: 0pt; } &#xD; &#xD; .x-deleted-1-0
            {margin-left: 0pt; margin-right: 0pt; text-indent: 0pt; } &#xD; &#xD; .x-denom-1-0
            {margin-left: 0pt; margin-right: 0pt; text-indent: 0pt; text-align: center; } &#xD;
            &#xD; .x-describe-1-0 {margin-left: 0pt; margin-right: 0pt; } &#xD; &#xD;
            .x-description-1-0 {margin-left: 0pt; margin-right: 0pt; text-indent: 0pt; } &#xD; &#xD;
            .x-dtlname-1-0 {margin-left: 0pt; margin-right: 0pt; } &#xD; &#xD; .x-dtlnbr-1-0
            {margin-left: 0pt; margin-right: 0pt; } &#xD; &#xD; .x-effec-1-0 {margin-left: 0pt;
            margin-right: 0pt; font-weight: bold; } &#xD; &#xD; .x-effect-1-0 {margin-left: 0pt;
            margin-right: 0pt; text-indent: 0pt; font-weight: bold; margin-top: 4pt; margin-bottom:
            4pt; } &#xD; &#xD; .x-effect-2-0 {margin-left: 0pt; margin-right: 0pt; font-weight:
            bold; } &#xD; &#xD; .x--ufe-eipc-title-1-0 {margin-left: 0pt; margin-right: 0pt;
            text-indent: 0pt; font-family: sans-serif; color: #0000FF; text-align: left;
            line-height: 1.1; margin-top: 1.5em; margin-bottom: 1em; margin-left: 0pt; text-indent:
            0pt; } &#xD; &#xD; .x--ufe-eipc-title-2-0 {margin-left: 0pt; margin-right: 0pt;
            text-indent: 0pt; font-family: sans-serif; color: #0000FF; text-align: left;
            line-height: 1.1; margin-top: 1.5em; margin-bottom: 1em; margin-left: 0pt; text-indent:
            0pt; } &#xD; &#xD; .x--ufe-eipc-title-3-0 {margin-left: 0pt; margin-right: 0pt;
            text-indent: 0pt; font-weight: bold; font-size: 36pt; text-align: center; margin-bottom:
            12pt; } &#xD; &#xD; .x--ufe-em-title-1-0 {margin-left: 0pt; margin-right: 0pt;
            text-indent: 0pt; font-family: sans-serif; color: #0000FF; text-align: left;
            line-height: 1.1; margin-top: 1.5em; margin-bottom: 1em; margin-left: 0pt; text-indent:
            0pt; } &#xD; &#xD; .x--ufe-em-title-2-0 {margin-left: 0pt; margin-right: 0pt;
            text-indent: 0pt; font-family: sans-serif; color: #0000FF; text-align: left;
            line-height: 1.1; margin-top: 1.5em; margin-bottom: 1em; margin-left: 0pt; text-indent:
            0pt; } &#xD; &#xD; .x--ufe-em-title-3-0 {margin-left: 0pt; margin-right: 0pt;
            text-indent: 0pt; font-weight: bold; font-size: 36pt; text-align: center; margin-bottom:
            12pt; } &#xD; &#xD; .x-email-1-0 {margin-left: 0pt; margin-right: 0pt; text-indent: 0pt;
            } &#xD; &#xD; .x--ufe-email-link-1-0 {margin-left: 0pt; margin-right: 0pt; } &#xD; &#xD;
            .x-emphasis-1-0 {margin-left: 0pt; margin-right: 0pt; text-indent: 0pt; } &#xD;
            .x-emphasis-1-1 {font-weight: bold; text-align: center; } &#xD; .x-emphasis-1-2
            {margin-left: 8pt; text-indent: 0pt; } &#xD; .x-emphasis-1-3 {margin-left: 12pt;
            text-indent: 0pt; } &#xD; .x-emphasis-1-4 {margin-left: 16pt; text-indent: 0pt; } &#xD;
            .x-emphasis-1-5 {margin-left: 20pt; text-indent: 0pt; } &#xD; &#xD; .x-emphasis-2-0
            {margin-left: 0pt; margin-right: 0pt; font-weight: bold; } &#xD; .x-emphasis-2-1
            {font-weight: bold; } &#xD; &#xD; .x-endmulti-1-0 {margin-left: 0pt; margin-right: 0pt;
            } &#xD; &#xD; .x-engine-1-0 {margin-left: 0pt; margin-right: 0pt; } &#xD; &#xD;
            .x-engine-2-0 {margin-left: 0pt; margin-right: 0pt; } &#xD; &#xD;
            .x--ufe-engine-type-1-0 {margin-left: 0pt; margin-right: 0pt; text-indent: 0pt;
            margin-bottom: 12pt; } &#xD; .x--ufe-engine-type-1-1 {} &#xD; .x--ufe-engine-type-1-2 {}
            &#xD; .x--ufe-engine-type-1-3 {} &#xD; .x--ufe-engine-type-1-4 {} &#xD; &#xD;
            .x-entry-1-0 {margin-left: 0pt; margin-right: 0pt; } &#xD; &#xD; .x-enumlist-1-0
            {margin-left: 0pt; margin-right: 0pt; text-indent: 0pt; margin-top: 8pt; font-size: 9pt;
            } &#xD; &#xD; .x-eqn-1-0 {margin-left: 0pt; margin-right: 0pt; text-indent: 0pt;
            font-family: Arial; font-size: 9pt; text-align: center; margin-bottom: 11pt; } &#xD;
            &#xD; .x-eqn-2-0 {margin-left: 0pt; margin-right: 0pt; font-family: Arial; font-size:
            9pt; } &#xD; &#xD; .x-eqn-3-0 {margin-left: 0pt; margin-right: 0pt; text-indent: 0pt;
            font-family: Arial; font-size: 9pt; margin-bottom: 11pt; } &#xD; &#xD; .x-eqn-4-0
            {margin-left: 0pt; margin-right: 0pt; text-indent: 0pt; font-family: Arial; font-size:
            9pt; margin-bottom: 11pt; } &#xD; &#xD; .x-equ-1-0 {margin-left: 0pt; margin-right: 0pt;
            text-indent: 0pt; margin-bottom: 8pt; } &#xD; &#xD; .x-equ-2-0 {margin-left: 0pt;
            margin-right: 0pt; text-indent: 0pt; } &#xD; &#xD; .x-facility-1-0 {margin-left: 0pt;
            margin-right: 0pt; text-indent: 0pt; } &#xD; &#xD; .x-fandc-1-0 {margin-left: 0pt;
            margin-right: 0pt; } &#xD; &#xD; .x-fandc-note-1-0 {margin-left: 0pt; margin-right: 0pt;
            } &#xD; &#xD; .x-fax-1-0 {margin-left: 0pt; margin-right: 0pt; text-indent: 0pt; } &#xD;
            &#xD; .x-fax-2-0 {margin-left: 0pt; margin-right: 0pt; text-indent: 0pt; } &#xD; &#xD;
            .x--ufe-fig-title-1-0 {margin-left: 0pt; margin-right: 0pt; text-indent: 0pt;
            font-weight: bold; font-size: 14pt; } &#xD; &#xD; .x-figno-1-0 {margin-left: 0pt;
            margin-right: 0pt; text-indent: 0pt; } &#xD; &#xD; .x-figno-2-0 {margin-left: 0pt;
            margin-right: 0pt; text-indent: 0pt; } &#xD; &#xD; .x-figure-2-0 {margin-left: 0pt;
            margin-right: 0pt; text-indent: 0pt; margin-top: 8pt; } &#xD; &#xD; .x-fix-equip-1-0
            {margin-left: 0pt; margin-right: 0pt; } &#xD; &#xD; .x--ufe-fixequ-title-1-0
            {margin-left: 0pt; margin-right: 0pt; text-indent: 0pt; font-family: sans-serif; color:
            #0000FF; text-align: left; line-height: 1.1; margin-top: 1.5em; margin-bottom: 1em;
            margin-left: 0pt; text-indent: 0pt; } &#xD; &#xD; .x--ufe-fixequ-title-2-0 {margin-left:
            0pt; margin-right: 0pt; text-indent: 0pt; font-family: sans-serif; color: #0000FF;
            text-align: left; line-height: 1.1; margin-top: 1.5em; margin-bottom: 1em; margin-left:
            0pt; text-indent: 0pt; } &#xD; &#xD; .x--ufe-fixequ-title-3-0 {margin-left: 0pt;
            margin-right: 0pt; text-indent: 0pt; font-family: sans-serif; color: #0000FF;
            text-align: left; line-height: 1.1; margin-top: 1.5em; margin-bottom: 1em; margin-left:
            0pt; text-indent: 0pt; } &#xD; &#xD; .x--ufe-fixequ-title-4-0 {margin-left: 0pt;
            margin-right: 0pt; text-indent: 0pt; font-weight: bold; margin-left: 1.5em; text-indent:
            -1.5em; } &#xD; &#xD; .x--ufe-fixequ-title-5-0 {margin-left: 0pt; margin-right: 0pt;
            text-indent: 0pt; font-weight: bold; margin-left: 1.5em; text-indent: -1.5em; } &#xD;
            &#xD; .x--ufe-fixequ-title-6-0 {margin-left: 0pt; margin-right: 0pt; text-indent: 0pt; }
            &#xD; &#xD; .x-frac-2-0 {margin-left: 0pt; margin-right: 0pt; } &#xD; &#xD;
            .x-frontmatter-1-0 {margin-left: 0pt; margin-right: 0pt; text-indent: 0pt; } &#xD; &#xD;
            .x-ftnote-1-0 {margin-left: 0pt; margin-right: 0pt; } &#xD; &#xD; .x-gdesc-1-0
            {margin-left: 0pt; margin-right: 0pt; text-indent: 0pt; } &#xD; &#xD;
            .x--ufe-general-title-1-0 {margin-left: 0pt; margin-right: 0pt; text-indent: 0pt;
            font-family: sans-serif; color: #0000FF; text-align: left; line-height: 1.1; margin-top:
            1.5em; margin-bottom: 1em; margin-left: 0pt; text-indent: 0pt; } &#xD; &#xD;
            .x--ufe-general-title-2-0 {margin-left: 0pt; margin-right: 0pt; text-indent: 0pt;
            font-family: sans-serif; color: #0000FF; text-align: left; line-height: 1.1; margin-top:
            1.5em; margin-bottom: 1em; margin-left: 0pt; text-indent: 0pt; } &#xD; &#xD;
            .x--ufe-general-title-3-0 {margin-left: 0pt; margin-right: 0pt; text-indent: 0pt;
            font-family: sans-serif; color: #0000FF; text-align: left; line-height: 1.1; margin-top:
            1.5em; margin-bottom: 1em; margin-left: 0pt; text-indent: 0pt; } &#xD; &#xD;
            .x--ufe-general-title-4-0 {margin-left: 0pt; margin-right: 0pt; text-indent: 0pt;
            font-weight: bold; margin-left: 1.5em; text-indent: -1.5em; } &#xD; &#xD;
            .x--ufe-general-title-5-0 {margin-left: 0pt; margin-right: 0pt; text-indent: 0pt;
            font-weight: bold; margin-left: 1.5em; text-indent: -1.5em; } &#xD; &#xD;
            .x--ufe-general-title-6-0 {margin-left: 0pt; margin-right: 0pt; text-indent: 0pt; }
            &#xD; &#xD; .x--ufe-glossary-title-1-0 {margin-left: 0pt; margin-right: 0pt;
            text-indent: 0pt; font-family: sans-serif; color: #0000FF; text-align: left;
            line-height: 1.1; margin-top: 1.5em; margin-bottom: 1em; margin-left: 0pt; text-indent:
            0pt; } &#xD; &#xD; .x--ufe-glossary-title-2-0 {margin-left: 0pt; margin-right: 0pt;
            text-indent: 0pt; font-family: sans-serif; color: #0000FF; text-align: left;
            line-height: 1.1; margin-top: 1.5em; margin-bottom: 1em; margin-left: 0pt; text-indent:
            0pt; } &#xD; &#xD; .x--ufe-glossary-title-3-0 {margin-left: 0pt; margin-right: 0pt;
            text-indent: 0pt; font-family: sans-serif; color: #0000FF; text-align: left;
            line-height: 1.1; margin-top: 1.5em; margin-bottom: 1em; margin-left: 0pt; text-indent:
            0pt; } &#xD; &#xD; .x--ufe-glossary-title-4-0 {margin-left: 0pt; margin-right: 0pt;
            text-indent: 0pt; font-weight: bold; font-size: 14pt; } &#xD; &#xD; .x-graphic-2-0
            {margin-left: 0pt; margin-right: 0pt; text-indent: 0pt; margin-top: 8pt; } &#xD; &#xD;
            .x--ufe-hidden-1-0 {margin-left: 0pt; margin-right: 0pt; } &#xD; &#xD;
            .x--ufe-highlights-link-1-0 {margin-left: 0pt; margin-right: 0pt; } &#xD; &#xD;
            .x-history-1-0 {margin-left: 0pt; margin-right: 0pt; } &#xD; &#xD; .x-hl-fragment-1-0
            {margin-left: 0pt; margin-right: 0pt; } &#xD; &#xD; .x-hotlink-1-0 {margin-left: 0pt;
            margin-right: 0pt; } &#xD; &#xD; .x-howtouse-1-0 {margin-left: 0pt; margin-right: 0pt;
            text-indent: 0pt; margin-top: 8pt; } &#xD; &#xD; .x--ufe-howtouse-title-1-0
            {margin-left: 0pt; margin-right: 0pt; text-indent: 0pt; font-family: sans-serif; color:
            #0000FF; text-align: left; line-height: 1.1; margin-top: 1.5em; margin-bottom: 1em;
            margin-left: 0pt; text-indent: 0pt; } &#xD; &#xD; .x--ufe-howtouse-title-2-0
            {margin-left: 0pt; margin-right: 0pt; text-indent: 0pt; font-family: sans-serif; color:
            #0000FF; text-align: left; line-height: 1.1; margin-top: 1.5em; margin-bottom: 1em;
            margin-left: 0pt; text-indent: 0pt; } &#xD; &#xD; .x--ufe-howtouse-title-3-0
            {margin-left: 0pt; margin-right: 0pt; text-indent: 0pt; font-weight: bold; font-size:
            14pt; } &#xD; &#xD; .x-ics-1-0 {margin-left: 0pt; margin-right: 0pt; text-indent: 0pt;
            margin-top: 6pt; margin-bottom: 6pt; } &#xD; &#xD; .x-atidlm-inclusion-1-0 {margin-left:
            0pt; margin-right: 0pt; text-indent: 0pt; } &#xD; &#xD; .x-increv-1-0 {margin-left: 0pt;
            margin-right: 0pt; } &#xD; &#xD; .x-insert-1-0 {margin-left: 0pt; margin-right: 0pt; }
            &#xD; &#xD; .x-int-mail-1-0 {margin-left: 0pt; margin-right: 0pt; } &#xD; &#xD;
            .x-intro-1-0 {margin-left: 0pt; margin-right: 0pt; text-indent: 0pt; margin-top: 8pt;
            margin-left: 4pt; text-indent: 0pt; } &#xD; &#xD; .x--ufe-intro-title-1-0 {margin-left:
            0pt; margin-right: 0pt; text-indent: 0pt; font-family: sans-serif; color: #0000FF;
            text-align: left; line-height: 1.1; margin-top: 1.5em; margin-bottom: 1em; margin-left:
            0pt; text-indent: 0pt; } &#xD; &#xD; .x--ufe-intro-title-2-0 {margin-left: 0pt;
            margin-right: 0pt; text-indent: 0pt; font-family: sans-serif; color: #0000FF;
            text-align: left; line-height: 1.1; margin-top: 1.5em; margin-bottom: 1em; margin-left:
            0pt; text-indent: 0pt; } &#xD; &#xD; .x--ufe-intro-title-3-0 {margin-left: 0pt;
            margin-right: 0pt; text-indent: 0pt; font-weight: bold; font-size: 14pt; } &#xD; &#xD;
            .x-isempty-1-0 {margin-left: 0pt; margin-right: 0pt; } &#xD; &#xD; .x-issdate-1-0
            {margin-left: 0pt; margin-right: 0pt; } &#xD; &#xD; .x-item-1-0 {margin-left: 0pt;
            margin-right: 0pt; text-indent: 0pt; margin-top: 6pt; margin-bottom: 6pt; font-size:
            9pt; margin-left: 0pt; text-indent: 0pt; } &#xD; &#xD; .x-item-2-0 {margin-left: 0pt;
            margin-right: 0pt; text-indent: 0pt; margin-top: 6pt; margin-bottom: 6pt; margin-left:
            0pt; text-indent: 0pt; } &#xD; &#xD; .x-item-3-0 {margin-left: 0pt; margin-right: 0pt;
            text-indent: 0pt; margin-top: 6pt; margin-bottom: 6pt; margin-left: 0pt; text-indent:
            0pt; } &#xD; &#xD; .x-item-4-0 {margin-left: 0pt; margin-right: 0pt; text-indent: 0pt;
            margin-top: 6pt; margin-bottom: 6pt; margin-left: 0pt; text-indent: 0pt; } &#xD; &#xD;
            .x-item-5-0 {margin-left: 0pt; margin-right: 0pt; text-indent: 0pt; margin-top: 6pt;
            margin-bottom: 6pt; margin-left: 0pt; text-indent: 0pt; } &#xD; &#xD; .x-item-6-0
            {margin-left: 0pt; margin-right: 0pt; text-indent: 0pt; margin-top: 6pt; margin-bottom:
            6pt; margin-left: 0pt; text-indent: 0pt; } &#xD; &#xD; .x-item-7-0 {margin-left: 0pt;
            margin-right: 0pt; text-indent: 0pt; margin-top: 6pt; margin-bottom: 6pt; margin-left:
            0pt; text-indent: 0pt; } &#xD; &#xD; .x-item-8-0 {margin-left: 0pt; margin-right: 0pt;
            text-indent: 0pt; margin-top: 6pt; margin-bottom: 6pt; margin-left: 0pt; text-indent:
            0pt; } &#xD; &#xD; .x-item-9-0 {margin-left: 0pt; margin-right: 0pt; text-indent: 0pt;
            margin-top: 6pt; margin-bottom: 6pt; margin-left: 0pt; text-indent: 0pt; } &#xD; &#xD;
            .x-item-10-0 {margin-left: 0pt; margin-right: 0pt; text-indent: 0pt; margin-top: 6pt;
            margin-bottom: 6pt; margin-left: 0pt; text-indent: 0pt; } &#xD; &#xD; .x-item-11-0
            {margin-left: 0pt; margin-right: 0pt; text-indent: 0pt; margin-top: 6pt; margin-bottom:
            6pt; margin-left: 0pt; text-indent: 0pt; } &#xD; &#xD; .x-item-12-0 {margin-left: 0pt;
            margin-right: 0pt; text-indent: 0pt; margin-top: 6pt; margin-bottom: 6pt; margin-left:
            0pt; text-indent: 0pt; } &#xD; &#xD; .x-item-13-0 {margin-left: 0pt; margin-right: 0pt;
            text-indent: 0pt; margin-top: 6pt; margin-bottom: 6pt; margin-left: 0pt; text-indent:
            0pt; } &#xD; &#xD; .x-item-14-0 {margin-left: 0pt; margin-right: 0pt; text-indent: 0pt;
            margin-top: 6pt; margin-bottom: 6pt; margin-left: 0pt; text-indent: 0pt; } &#xD; &#xD;
            .x-item-17-0 {margin-left: 0pt; margin-right: 0pt; text-indent: 0pt; margin-top: 6pt;
            margin-bottom: 6pt; margin-left: 0pt; text-indent: 0pt; } &#xD; &#xD; .x-item-18-0
            {margin-left: 0pt; margin-right: 0pt; text-indent: 0pt; margin-top: 6pt; margin-bottom:
            6pt; margin-left: 0pt; text-indent: 0pt; } &#xD; &#xD; .x-item-19-0 {margin-left: 0pt;
            margin-right: 0pt; text-indent: 0pt; margin-top: 6pt; margin-bottom: 6pt; margin-left:
            0pt; text-indent: 0pt; } &#xD; &#xD; .x-item-20-0 {margin-left: 0pt; margin-right: 0pt;
            text-indent: 0pt; margin-top: 6pt; margin-bottom: 6pt; margin-left: 0pt; text-indent:
            0pt; } &#xD; &#xD; .x-item-21-0 {margin-left: 0pt; margin-right: 0pt; text-indent: 0pt;
            margin-top: 6pt; margin-bottom: 6pt; margin-left: 0pt; text-indent: 0pt; } &#xD; &#xD;
            .x-item-22-0 {margin-left: 0pt; margin-right: 0pt; text-indent: 0pt; margin-top: 6pt;
            margin-bottom: 6pt; margin-left: 0pt; text-indent: 0pt; } &#xD; &#xD; .x-item-23-0
            {margin-left: 0pt; margin-right: 0pt; text-indent: 0pt; margin-top: 6pt; margin-bottom:
            6pt; margin-left: 0pt; text-indent: 0pt; } &#xD; &#xD; .x-item-24-0 {margin-left: 0pt;
            margin-right: 0pt; text-indent: 0pt; margin-top: 6pt; margin-bottom: 6pt; margin-left:
            0pt; text-indent: 0pt; } &#xD; &#xD; .x-item-25-0 {margin-left: 0pt; margin-right: 0pt;
            text-indent: 0pt; margin-top: 6pt; margin-bottom: 6pt; margin-left: 0pt; text-indent:
            0pt; } &#xD; &#xD; .x-item-26-0 {margin-left: 0pt; margin-right: 0pt; text-indent: 0pt;
            margin-top: 6pt; margin-bottom: 6pt; margin-left: 0pt; text-indent: 0pt; } &#xD; &#xD;
            .x-item-27-0 {margin-left: 0pt; margin-right: 0pt; text-indent: 0pt; margin-top: 6pt;
            margin-bottom: 6pt; margin-left: 0pt; text-indent: 0pt; } &#xD; &#xD; .x-item-28-0
            {margin-left: 0pt; margin-right: 0pt; text-indent: 0pt; margin-top: 6pt; margin-bottom:
            6pt; font-size: 9pt; margin-left: 0pt; text-indent: 0pt; } &#xD; &#xD; .x-item-29-0
            {margin-left: 0pt; margin-right: 0pt; text-indent: 0pt; margin-top: 6pt; margin-bottom:
            6pt; font-size: 9pt; margin-left: 0pt; text-indent: 0pt; } &#xD; &#xD; .x-item-30-0
            {margin-left: 0pt; margin-right: 0pt; text-indent: 0pt; margin-top: 6pt; margin-bottom:
            6pt; margin-left: 0pt; text-indent: 0pt; } &#xD; &#xD; .x-item-31-0 {margin-left: 0pt;
            margin-right: 0pt; text-indent: 0pt; margin-top: 6pt; margin-bottom: 6pt; margin-left:
            0pt; text-indent: 0pt; } &#xD; &#xD; .x-item-nbr-1-0 {margin-left: 0pt; margin-right:
            0pt; text-indent: 0pt; } &#xD; &#xD; .x-key-2-0 {margin-left: 0pt; margin-right: 0pt;
            text-indent: 0pt; } &#xD; &#xD; .x-l1item-5-0 {margin-left: 0pt; margin-right: 0pt;
            text-indent: 0pt; margin-top: 6pt; margin-bottom: 6pt; margin-left: 0pt; text-indent:
            0pt; } &#xD; &#xD; .x-l2item-5-0 {margin-left: 0pt; margin-right: 0pt; text-indent: 0pt;
            margin-top: 6pt; margin-bottom: 6pt; margin-left: 0pt; text-indent: 0pt; } &#xD; &#xD;
            .x-l3item-5-0 {margin-left: 0pt; margin-right: 0pt; text-indent: 0pt; margin-top: 6pt;
            margin-bottom: 6pt; margin-left: 0pt; text-indent: 0pt; } &#xD; &#xD; .x-l4item-5-0
            {margin-left: 0pt; margin-right: 0pt; text-indent: 0pt; margin-top: 6pt; margin-bottom:
            6pt; margin-left: 0pt; text-indent: 0pt; } &#xD; &#xD; .x-l5item-1-0 {margin-left: 0pt;
            margin-right: 0pt; } &#xD; &#xD; .x-l6item-1-0 {margin-left: 0pt; margin-right: 0pt; }
            &#xD; &#xD; .x-l7item-1-0 {margin-left: 0pt; margin-right: 0pt; } &#xD; &#xD;
            .x-atidlm-linkcontent-1-0 {margin-left: 0pt; margin-right: 0pt; text-indent: 0pt; }
            &#xD; &#xD; .x-list-1-0 {margin-left: 0pt; margin-right: 0pt; text-indent: 0pt;
            margin-top: 8pt; margin-left: 1.5em; text-indent: 1.5em; } &#xD; &#xD; .x-list-2-0
            {margin-left: 0pt; margin-right: 0pt; text-indent: 0pt; margin-top: 8pt; font-size: 9pt;
            } &#xD; &#xD; .x-list1-1-0 {margin-left: 0pt; margin-right: 0pt; text-indent: 0pt;
            margin-top: 8pt; margin-left: 18pt; text-indent: 0pt; } &#xD; &#xD; .x-list2-1-0
            {margin-left: 0pt; margin-right: 0pt; text-indent: 0pt; margin-top: 8pt; } &#xD; &#xD;
            .x-list3-1-0 {margin-left: 0pt; margin-right: 0pt; text-indent: 0pt; margin-top: 8pt; }
            &#xD; &#xD; .x-list4-1-0 {margin-left: 0pt; margin-right: 0pt; text-indent: 0pt;
            margin-top: 8pt; } &#xD; &#xD; .x-list5-1-0 {margin-left: 0pt; margin-right: 0pt; }
            &#xD; &#xD; .x-list6-1-0 {margin-left: 0pt; margin-right: 0pt; } &#xD; &#xD;
            .x-list7-1-0 {margin-left: 0pt; margin-right: 0pt; } &#xD; &#xD; .x-lmm-statement-1-0
            {margin-left: 0pt; margin-right: 0pt; text-indent: 0pt; font-size: 10pt; text-align:
            justify; margin-top: 10pt; margin-bottom: 10pt; } &#xD; &#xD; .x-lof-1-0 {margin-left:
            0pt; margin-right: 0pt; text-indent: 0pt; } &#xD; &#xD; .x-lof-item-1-0 {margin-left:
            0pt; margin-right: 0pt; text-indent: 0pt; margin-top: 8pt; } &#xD; &#xD; .x-lot-item-1-0
            {margin-left: 0pt; margin-right: 0pt; text-indent: 0pt; margin-top: 8pt; } &#xD; &#xD;
            .x-maint-level-1-0 {margin-left: 0pt; margin-right: 0pt; } &#xD; &#xD; .x-manual-pn-1-0
            {margin-left: 0pt; margin-right: 0pt; text-indent: 0pt; font-size: 16pt; color: #666666;
            text-align: center; margin-bottom: 12pt; } &#xD; &#xD; .x-manual-title-1-0 {margin-left:
            0pt; margin-right: 0pt; text-indent: 0pt; font-family: sans-serif; color: #0000FF;
            text-align: left; line-height: 1.1; margin-top: 1.5em; margin-bottom: 1em; margin-left:
            0pt; text-indent: 0pt; } &#xD; &#xD; .x-manual-title-2-0 {margin-left: 0pt;
            margin-right: 0pt; text-indent: 0pt; font-family: sans-serif; color: #0000FF;
            text-align: left; line-height: 1.1; margin-top: 1.5em; margin-bottom: 1em; margin-left:
            0pt; text-indent: 0pt; } &#xD; &#xD; .x-manual-title-3-0 {margin-left: 0pt;
            margin-right: 0pt; text-indent: 0pt; font-family: sans-serif; color: #0000FF;
            text-align: left; line-height: 1.1; margin-top: 1.5em; margin-bottom: 1em; margin-left:
            0pt; text-indent: 0pt; } &#xD; &#xD; .x-manual-title-4-0 {margin-left: 0pt;
            margin-right: 0pt; text-indent: 0pt; font-weight: bold; font-size: 36pt; text-align:
            center; margin-bottom: 12pt; } &#xD; &#xD; .x-marker-1-0 {margin-left: 0pt;
            margin-right: 0pt; } &#xD; &#xD; .x-atidlm-metadata-1-0 {margin-left: 0pt; margin-right:
            0pt; text-indent: 0pt; } &#xD; &#xD; .x-mfmatr-1-0 {margin-left: 0pt; margin-right: 0pt;
            text-indent: 0pt; } &#xD; &#xD; .x-model-1-0 {margin-left: 0pt; margin-right: 0pt;
            text-indent: 0pt; font-weight: bold; font-size: 18pt; text-align: center; } &#xD; &#xD;
            .x-module-1-0 {margin-left: 0pt; margin-right: 0pt; text-indent: 0pt; } &#xD;
            .x-module-1-1 {} &#xD; .x-module-1-2 {} &#xD; .x-module-1-3 {} &#xD; .x-module-1-4 {}
            &#xD; &#xD; .x-module-item-1-0 {margin-left: 0pt; margin-right: 0pt; } &#xD; &#xD;
            .x-multi-1-0 {margin-left: 0pt; margin-right: 0pt; } &#xD; &#xD; .x-n-para-1-0
            {margin-left: 0pt; margin-right: 0pt; text-indent: 0pt; margin-top: 8pt; } &#xD; &#xD;
            .x-name-1-0 {margin-left: 0pt; margin-right: 0pt; text-indent: 0pt; } &#xD; &#xD;
            .x-ncon-1-0 {margin-left: 0pt; margin-right: 0pt; } &#xD; &#xD; .x-no-street-1-0
            {margin-left: 0pt; margin-right: 0pt; text-indent: 0pt; } &#xD; &#xD; .x-nobrk-1-0
            {margin-left: 0pt; margin-right: 0pt; } &#xD; &#xD; .x--ufe-not-applicable-1-0
            {margin-left: 0pt; margin-right: 0pt; text-indent: 0pt; margin-top: 8pt; margin-left:
            18pt; text-indent: 0pt; } &#xD; &#xD; .x-note-1-0 {margin-left: 0pt; margin-right: 0pt;
            text-indent: 0pt; margin-top: 8pt; margin-left: 61pt; text-indent: -43pt; } &#xD; &#xD;
            .x-note-2-0 {margin-left: 0pt; margin-right: 0pt; text-indent: 0pt; margin-top: 8pt;
            margin-left: 61pt; text-indent: -43pt; } &#xD; &#xD; .x-note-3-0 {margin-left: 0pt;
            margin-right: 0pt; text-indent: 0pt; margin-top: 8pt; margin-left: 61pt; text-indent:
            -43pt; } &#xD; &#xD; .x-note-4-0 {margin-left: 0pt; margin-right: 0pt; text-indent: 0pt;
            margin-top: 8pt; margin-left: 70pt; text-indent: -45pt; } &#xD; .x-note-4-1 {} &#xD;
            &#xD; .x-note-5-0 {margin-left: 0pt; margin-right: 0pt; text-indent: 0pt; margin-top:
            8pt; margin-left: 63pt; text-indent: -43pt; } &#xD; .x-note-5-1 {margin-left: 76pt;
            text-indent: -57pt; } &#xD; &#xD; .x-note-6-0 {margin-left: 0pt; margin-right: 0pt;
            text-indent: 0pt; } &#xD; &#xD; .x-note-7-0 {margin-left: 0pt; margin-right: 0pt;
            text-indent: 0pt; } &#xD; &#xD; .x-note-8-0 {margin-left: 0pt; margin-right: 0pt;
            text-indent: 0pt; } &#xD; &#xD; .x-note-9-0 {margin-left: 0pt; margin-right: 0pt;
            text-indent: 0pt; } &#xD; &#xD; .x-note-10-0 {margin-left: 0pt; margin-right: 0pt;
            text-indent: 0pt; } &#xD; &#xD; .x-note-11-0 {margin-left: 0pt; margin-right: 0pt;
            text-indent: 0pt; margin-top: 8pt; margin-left: 61pt; text-indent: -43pt; } &#xD;
            .x-note-11-1 {} &#xD; &#xD; .x-note-12-0 {margin-left: 0pt; margin-right: 0pt;
            text-indent: 0pt; margin-top: 8pt; margin-left: 43pt; text-indent: -43pt; } &#xD;
            .x-note-12-1 {margin-left: 55pt; text-indent: -55pt; } &#xD; &#xD;
            .x--ufe-npara-numbering-1-0 {margin-left: 0pt; margin-right: 0pt; text-decoration:
            no-underline ; text-indent: -0pt; } &#xD; &#xD; .x--ufe-npara-numbering-2-0
            {margin-left: 0pt; margin-right: 0pt; text-decoration: no-underline ; text-indent: -0pt;
            } &#xD; &#xD; .x--ufe-npara-numbering-3-0 {margin-left: 0pt; margin-right: 0pt; } &#xD;
            &#xD; .x-num-1-0 {margin-left: 0pt; margin-right: 0pt; text-indent: 0pt; text-align:
            center; } &#xD; &#xD; .x--ufe-num-index-title-1-0 {margin-left: 0pt; margin-right: 0pt;
            text-indent: 0pt; font-family: sans-serif; color: #0000FF; text-align: left;
            line-height: 1.1; margin-top: 1.5em; margin-bottom: 1em; margin-left: 0pt; text-indent:
            0pt; } &#xD; &#xD; .x--ufe-num-index-title-2-0 {margin-left: 0pt; margin-right: 0pt;
            text-indent: 0pt; font-family: sans-serif; color: #0000FF; text-align: left;
            line-height: 1.1; margin-top: 1.5em; margin-bottom: 1em; margin-left: 0pt; text-indent:
            0pt; } &#xD; &#xD; .x--ufe-num-index-title-3-0 {margin-left: 0pt; margin-right: 0pt;
            text-indent: 0pt; font-family: sans-serif; color: #0000FF; text-align: left;
            line-height: 1.1; margin-top: 1.5em; margin-bottom: 1em; margin-left: 0pt; text-indent:
            0pt; } &#xD; &#xD; .x--ufe-num-index-title-4-0 {margin-left: 0pt; margin-right: 0pt;
            text-indent: 0pt; font-weight: bold; font-size: 14pt; } &#xD; &#xD; .x-num-list-1-0
            {margin-left: 0pt; margin-right: 0pt; text-indent: 0pt; margin-top: 8pt; } &#xD; &#xD;
            .x-numlist-1-0 {margin-left: 0pt; margin-right: 0pt; text-indent: 0pt; margin-top: 8pt;
            margin-left: 18pt; text-indent: 0pt; } &#xD; &#xD; .x-numlitem-1-0 {margin-left: 0pt;
            margin-right: 0pt; text-indent: 0pt; margin-top: 6pt; margin-bottom: 6pt; margin-left:
            0pt; text-indent: 0pt; } &#xD; &#xD; .x-numlitem-2-0 {margin-left: 0pt; margin-right:
            0pt; text-indent: 0pt; margin-top: 6pt; margin-bottom: 6pt; margin-left: 0pt;
            text-indent: 0pt; } &#xD; &#xD; .x--ufe-nut-option-title-1-0 {margin-left: 0pt;
            margin-right: 0pt; text-indent: 0pt; font-family: sans-serif; color: #0000FF;
            text-align: left; line-height: 1.1; margin-top: 1.5em; margin-bottom: 1em; margin-left:
            0pt; text-indent: 0pt; } &#xD; &#xD; .x--ufe-nut-option-title-2-0 {margin-left: 0pt;
            margin-right: 0pt; text-indent: 0pt; font-family: sans-serif; color: #0000FF;
            text-align: left; line-height: 1.1; margin-top: 1.5em; margin-bottom: 1em; margin-left:
            0pt; text-indent: 0pt; } &#xD; &#xD; .x--ufe-nut-option-title-3-0 {margin-left: 0pt;
            margin-right: 0pt; text-indent: 0pt; font-family: sans-serif; color: #0000FF;
            text-align: left; line-height: 1.1; margin-top: 1.5em; margin-bottom: 1em; margin-left:
            0pt; text-indent: 0pt; } &#xD; &#xD; .x--ufe-nut-option-title-4-0 {margin-left: 0pt;
            margin-right: 0pt; text-indent: 0pt; margin-top: 8pt; font-weight: bold; font-size:
            14pt; } &#xD; &#xD; .x-orig-date-1-0 {margin-left: 0pt; margin-right: 0pt; text-indent:
            0pt; font-size: 14pt; color: #666666; text-align: center; margin-bottom: 12pt; } &#xD;
            &#xD; .x-pageblock-title-1-0 {margin-left: 0pt; margin-right: 0pt; text-indent: 0pt;
            font-weight: bold; text-decoration: underline ; text-transform: uppercase; margin-left:
            0pt; text-indent: 0pt; text-align: center; } &#xD; &#xD; .x-pageblock-title-2-0
            {margin-left: 0pt; margin-right: 0pt; text-indent: 0pt; font-weight: bold; font-size:
            14pt; } &#xD; &#xD; .x-para-1-0 {margin-left: 0pt; margin-right: 0pt; text-indent: 0pt;
            margin-top: 8pt; } &#xD; &#xD; .x-para-2-0 {margin-left: 0pt; margin-right: 0pt;
            text-indent: 0pt; margin-top: 8pt; margin-left: 18pt; text-indent: -18pt; } &#xD; &#xD;
            .x-para-3-0 {margin-left: 0pt; margin-right: 0pt; text-indent: 0pt; margin-top: 8pt;
            margin-left: 18pt; text-indent: -18pt; } &#xD; &#xD; .x-para-4-0 {margin-left: 0pt;
            margin-right: 0pt; text-indent: 0pt; margin-top: 8pt; margin-left: 23pt; text-indent:
            0pt; } &#xD; &#xD; .x-para-5-0 {margin-left: 0pt; margin-right: 0pt; text-indent: 0pt;
            margin-top: 8pt; margin-left: 23pt; text-indent: -23pt; } &#xD; &#xD; .x-para-6-0
            {margin-left: 0pt; margin-right: 0pt; text-indent: 0pt; margin-top: 8pt; margin-left:
            23pt; text-indent: -23pt; } &#xD; &#xD; .x-para-7-0 {margin-left: 0pt; margin-right:
            0pt; text-indent: 0pt; margin-top: 8pt; margin-left: 18pt; text-indent: 0pt; } &#xD;
            &#xD; .x-para-8-0 {margin-left: 0pt; margin-right: 0pt; text-indent: 0pt; margin-top:
            8pt; margin-left: 22pt; text-indent: 0pt; } &#xD; &#xD; .x-para-9-0 {margin-left: 0pt;
            margin-right: 0pt; text-indent: 0pt; margin-top: 8pt; margin-left: 18pt; text-indent:
            0pt; margin-bottom: 6pt; } &#xD; &#xD; .x-para-10-0 {margin-left: 0pt; margin-right:
            0pt; text-indent: 0pt; margin-top: 8pt; margin-left: 18pt; text-indent: -18pt; } &#xD;
            &#xD; .x-para-11-0 {margin-left: 0pt; margin-right: 0pt; } &#xD; &#xD; .x-para-13-0
            {margin-left: 0pt; margin-right: 0pt; margin-top: 8pt; } &#xD; &#xD; .x-para-14-0
            {margin-left: 0pt; margin-right: 0pt; margin-top: 8pt; } &#xD; &#xD; .x-para-15-0
            {margin-left: 0pt; margin-right: 0pt; } &#xD; &#xD; .x-para-16-0 {margin-left: 0pt;
            margin-right: 0pt; } &#xD; &#xD; .x-para-17-0 {margin-left: 0pt; margin-right: 0pt; }
            &#xD; &#xD; .x-para-18-0 {margin-left: 0pt; margin-right: 0pt; } &#xD; &#xD;
            .x-para-19-0 {margin-left: 0pt; margin-right: 0pt; } &#xD; &#xD; .x-para-20-0
            {margin-left: 0pt; margin-right: 0pt; } &#xD; &#xD; .x-para-21-0 {margin-left: 0pt;
            margin-right: 0pt; margin-top: 8pt; } &#xD; &#xD; .x-para-22-0 {margin-left: 0pt;
            margin-right: 0pt; } &#xD; &#xD; .x-para-23-0 {margin-left: 0pt; margin-right: 0pt; }
            &#xD; &#xD; .x-para-24-0 {margin-left: 0pt; margin-right: 0pt; } &#xD; &#xD;
            .x-para-25-0 {margin-left: 0pt; margin-right: 0pt; } &#xD; &#xD; .x-para-26-0
            {margin-left: 0pt; margin-right: 0pt; } &#xD; &#xD; .x-para-27-0 {margin-left: 0pt;
            margin-right: 0pt; } &#xD; &#xD; .x-para-28-0 {margin-left: 0pt; margin-right: 0pt; }
            &#xD; &#xD; .x-para-29-0 {margin-left: 0pt; margin-right: 0pt; } &#xD; &#xD;
            .x-para-31-0 {margin-left: 0pt; margin-right: 0pt; text-indent: 0pt; margin-top: 6pt;
            margin-bottom: 6pt; } &#xD; &#xD; .x-para-32-0 {margin-left: 0pt; margin-right: 0pt;
            text-indent: 0pt; margin-top: 6pt; margin-bottom: 6pt; } &#xD; &#xD; .x-para-33-0
            {margin-left: 0pt; margin-right: 0pt; text-indent: 0pt; margin-top: 6pt; margin-bottom:
            6pt; } &#xD; &#xD; .x-para-34-0 {margin-left: 0pt; margin-right: 0pt; text-indent: 0pt;
            margin-top: 6pt; margin-bottom: 6pt; } &#xD; &#xD; .x-para-35-0 {margin-left: 0pt;
            margin-right: 0pt; text-indent: 0pt; margin-top: 6pt; margin-bottom: 6pt; } &#xD; &#xD;
            .x-para-36-0 {margin-left: 0pt; margin-right: 0pt; text-indent: 0pt; margin-top: 6pt;
            margin-bottom: 6pt; } &#xD; &#xD; .x-para-37-0 {margin-left: 0pt; margin-right: 0pt;
            text-indent: 0pt; margin-top: 6pt; margin-bottom: 6pt; } &#xD; &#xD; .x-para-38-0
            {margin-left: 0pt; margin-right: 0pt; text-indent: 0pt; margin-top: 6pt; margin-bottom:
            6pt; } &#xD; &#xD; .x-para-39-0 {margin-left: 0pt; margin-right: 0pt; text-indent: 0pt;
            margin-top: 6pt; margin-bottom: 6pt; } &#xD; &#xD; .x-para-40-0 {margin-left: 0pt;
            margin-right: 0pt; text-indent: 0pt; margin-top: 6pt; margin-bottom: 6pt; } &#xD; &#xD;
            .x-para-41-0 {margin-left: 0pt; margin-right: 0pt; text-indent: 0pt; margin-top: 6pt;
            margin-bottom: 6pt; } &#xD; &#xD; .x-para-42-0 {margin-left: 0pt; margin-right: 0pt;
            text-indent: 0pt; margin-top: 6pt; margin-bottom: 6pt; } &#xD; &#xD; .x-para-43-0
            {margin-left: 0pt; margin-right: 0pt; text-indent: 0pt; margin-top: 6pt; margin-bottom:
            6pt; } &#xD; &#xD; .x-para-44-0 {margin-left: 0pt; margin-right: 0pt; text-indent: 0pt;
            margin-top: 6pt; margin-bottom: 6pt; } &#xD; &#xD; .x-para-46-0 {margin-left: 0pt;
            margin-right: 0pt; text-indent: 0pt; margin-top: 8pt; text-align: center; } &#xD; &#xD;
            .x-para-47-0 {margin-left: 0pt; margin-right: 0pt; margin-top: 8pt; } &#xD; &#xD;
            .x-para-49-0 {margin-left: 0pt; margin-right: 0pt; } &#xD; &#xD; .x-para-50-0
            {margin-left: 0pt; margin-right: 0pt; text-indent: 0pt; margin-top: 8pt; margin-left:
            18pt; text-indent: 0pt; } &#xD; &#xD; .x-para-51-0 {margin-left: 0pt; margin-right: 0pt;
            text-indent: 0pt; margin-top: 8pt; margin-left: 1.5em; text-indent: 0pt; margin-bottom:
            6pt; } &#xD; &#xD; .x-para-52-0 {margin-left: 0pt; margin-right: 0pt; text-indent: 0pt;
            margin-top: 8pt; margin-left: 18pt; text-indent: 0pt; } &#xD; &#xD; .x-para-53-0
            {margin-left: 0pt; margin-right: 0pt; text-indent: 0pt; margin-top: 8pt; margin-left:
            18pt; text-indent: 0pt; } &#xD; &#xD; .x-part-1-0 {margin-left: 0pt; margin-right: 0pt;
            } &#xD; &#xD; .x-part-group-1-0 {margin-left: 0pt; margin-right: 0pt; text-indent: 0pt;
            margin-top: 6pt; margin-bottom: 6pt; margin-left: 0pt; text-indent: 0pt; } &#xD; &#xD;
            .x-part-group-2-0 {margin-left: 0pt; margin-right: 0pt; text-indent: 0pt; margin-top:
            6pt; margin-bottom: 6pt; margin-left: 0pt; text-indent: 0pt; } &#xD; &#xD;
            .x-part-group-3-0 {margin-left: 0pt; margin-right: 0pt; text-indent: 0pt; margin-top:
            6pt; margin-bottom: 6pt; margin-left: 0pt; text-indent: 0pt; } &#xD; &#xD;
            .x-part-group-4-0 {margin-left: 0pt; margin-right: 0pt; text-indent: 0pt; margin-top:
            6pt; margin-bottom: 6pt; margin-left: 0pt; text-indent: 0pt; } &#xD; &#xD;
            .x-part-loc-1-0 {margin-left: 0pt; margin-right: 0pt; text-indent: 0pt; } &#xD; &#xD;
            .x-partname-1-0 {margin-left: 0pt; margin-right: 0pt; } &#xD; &#xD; .x-pbfmatr-1-0
            {margin-left: 0pt; margin-right: 0pt; text-indent: 0pt; } &#xD; &#xD; .x-pcextract-1-0
            {margin-left: 0pt; margin-right: 0pt; } &#xD; &#xD; .x--ufe-pdlist-title-1-0
            {margin-left: 0pt; margin-right: 0pt; text-indent: 0pt; font-family: sans-serif; color:
            #0000FF; text-align: left; line-height: 1.1; margin-top: 1.5em; margin-bottom: 1em;
            margin-left: 0pt; text-indent: 0pt; } &#xD; &#xD; .x--ufe-pdlist-title-2-0 {margin-left:
            0pt; margin-right: 0pt; text-indent: 0pt; font-weight: bold; font-size: 14pt; } &#xD;
            &#xD; .x-pgblk-1-0 {margin-left: 0pt; margin-right: 0pt; text-indent: 0pt; margin-top:
            8pt; } &#xD; &#xD; .x-pgblk-name-1-0 {margin-left: 0pt; margin-right: 0pt; } &#xD; &#xD;
            .x-pnr-1-0 {margin-left: 0pt; margin-right: 0pt; } &#xD; &#xD; .x-post-tr-1-0
            {margin-left: 0pt; margin-right: 0pt; } &#xD; &#xD; .x-postal-1-0 {margin-left: 0pt;
            margin-right: 0pt; } &#xD; &#xD; .x-prcitem-1-0 {margin-left: 0pt; margin-right: 0pt;
            text-indent: 0pt; margin-top: 8pt; } &#xD; &#xD; .x-prcitem1-1-0 {margin-left: 0pt;
            margin-right: 0pt; text-indent: 0pt; margin-top: 6pt; margin-bottom: 6pt; margin-left:
            0pt; text-indent: 0pt; } &#xD; &#xD; .x-prcitem1-2-0 {margin-left: 0pt; margin-right:
            0pt; text-indent: 0pt; margin-top: 6pt; margin-bottom: 6pt; margin-left: 0pt;
            text-indent: 0pt; } &#xD; &#xD; .x-prcitem2-1-0 {margin-left: 0pt; margin-right: 0pt;
            text-indent: 0pt; margin-top: 6pt; margin-bottom: 6pt; margin-left: 0pt; text-indent:
            0pt; } &#xD; &#xD; .x-prcitem2-2-0 {margin-left: 0pt; margin-right: 0pt; text-indent:
            0pt; margin-top: 6pt; margin-bottom: 6pt; margin-left: 0pt; text-indent: 0pt; } &#xD;
            &#xD; .x-prcitem3-1-0 {margin-left: 0pt; margin-right: 0pt; text-indent: 0pt;
            margin-top: 6pt; margin-bottom: 6pt; margin-left: 0pt; text-indent: 0pt; } &#xD; &#xD;
            .x-prcitem3-2-0 {margin-left: 0pt; margin-right: 0pt; text-indent: 0pt; margin-top: 6pt;
            margin-bottom: 6pt; margin-left: 0pt; text-indent: 0pt; } &#xD; &#xD; .x-prcitem4-1-0
            {margin-left: 0pt; margin-right: 0pt; text-indent: 0pt; margin-top: 6pt; margin-bottom:
            6pt; margin-left: 0pt; text-indent: 0pt; } &#xD; &#xD; .x-prcitem4-2-0 {margin-left:
            0pt; margin-right: 0pt; text-indent: 0pt; margin-top: 6pt; margin-bottom: 6pt;
            margin-left: 0pt; text-indent: 0pt; } &#xD; &#xD; .x-prcitem4-3-0 {margin-left: 0pt;
            margin-right: 0pt; text-indent: 0pt; margin-top: 6pt; margin-bottom: 6pt; margin-left:
            0pt; text-indent: 0pt; } &#xD; &#xD; .x-prcitem5-1-0 {margin-left: 0pt; margin-right:
            0pt; } &#xD; &#xD; .x-prcitem6-1-0 {margin-left: 0pt; margin-right: 0pt; } &#xD; &#xD;
            .x-prcitem7-1-0 {margin-left: 0pt; margin-right: 0pt; } &#xD; &#xD; .x-prclist1-1-0
            {margin-left: 0pt; margin-right: 0pt; text-indent: 0pt; margin-top: 8pt; } &#xD; &#xD;
            .x-prclist2-1-0 {margin-left: 0pt; margin-right: 0pt; text-indent: 0pt; margin-top: 8pt;
            margin-left: 18pt; text-indent: 0pt; } &#xD; &#xD; .x-prclist3-1-0 {margin-left: 0pt;
            margin-right: 0pt; text-indent: 0pt; margin-top: 8pt; margin-left: 18pt; text-indent:
            0pt; } &#xD; &#xD; .x-prclist4-1-0 {margin-left: 0pt; margin-right: 0pt; text-indent:
            0pt; margin-top: 8pt; } &#xD; &#xD; .x-prclist5-1-0 {margin-left: 0pt; margin-right:
            0pt; } &#xD; &#xD; .x-prclist6-1-0 {margin-left: 0pt; margin-right: 0pt; } &#xD; &#xD;
            .x-prclist7-1-0 {margin-left: 0pt; margin-right: 0pt; } &#xD; &#xD; .x-pre-tr-1-0
            {margin-left: 0pt; margin-right: 0pt; } &#xD; &#xD; .x-print-module-1-0 {margin-left:
            0pt; margin-right: 0pt; } &#xD; &#xD; .x-print-unit-1-0 {margin-left: 0pt; margin-right:
            0pt; } &#xD; &#xD; .x-procedure-1-0 {margin-left: 0pt; margin-right: 0pt; text-indent:
            0pt; margin-top: 8pt; margin-left: 18pt; text-indent: 0pt; } &#xD; &#xD; .x-process-1-0
            {margin-left: 0pt; margin-right: 0pt; } &#xD; &#xD; .x--ufe-proprietary-notice-1-0
            {margin-left: 0pt; margin-right: 0pt; text-indent: 0pt; font-weight: normal; font-size:
            10pt; text-align: justify; margin-top: 24pt; } &#xD; &#xD;
            .x--ufe-proprietary-notice-2-0 {margin-left: 0pt; margin-right: 0pt; text-indent: 0pt;
            font-weight: normal; font-size: 10pt; text-align: center; margin-top: 24pt; } &#xD;
            &#xD; .x--ufe-proprietary-warning-1-0 {margin-left: 0pt; margin-right: 0pt; text-indent:
            0pt; margin-top: 8pt; font-weight: normal; font-size: 10pt; text-decoration: underline ;
            text-align: center; } &#xD; &#xD; .x-province-1-0 {margin-left: 0pt; margin-right: 0pt;
            } &#xD; &#xD; .x-pwc-awl-1-0 {margin-left: 0pt; margin-right: 0pt; } &#xD; &#xD;
            .x-pwc-cgp-stmnt-1-0 {margin-left: 0pt; margin-right: 0pt; text-indent: 0pt; font-size:
            10pt; margin-top: 10pt; margin-bottom: 10pt; } &#xD; &#xD; .x-pwccallout-1-0
            {margin-left: 0pt; margin-right: 0pt; } &#xD; &#xD; .x-pwcchapsect-1-0 {margin-left:
            0pt; margin-right: 0pt; text-indent: 0pt; } &#xD; &#xD; .x-pwcchapsect-item-1-0
            {margin-left: 0pt; margin-right: 0pt; text-indent: 0pt; margin-top: 6pt; margin-bottom:
            6pt; } &#xD; &#xD; .x-pwcchapsect-list-1-0 {margin-left: 0pt; margin-right: 0pt;
            text-indent: 0pt; margin-top: 8pt; } &#xD; &#xD; .x-pwccss-1-0 {margin-left: 0pt;
            margin-right: 0pt; text-indent: 0pt; } &#xD; &#xD; .x-pwcem-apu-title-1-0 {margin-left:
            0pt; margin-right: 0pt; } &#xD; &#xD; .x-pwcemtask-1-0 {margin-left: 0pt; margin-right:
            0pt; } &#xD; &#xD; .x-pwcni-1-0 {margin-left: 0pt; margin-right: 0pt; text-indent: 0pt;
            margin-top: 8pt; } &#xD; &#xD; .x-pwcnitem-1-0 {margin-left: 0pt; margin-right: 0pt;
            text-indent: 0pt; } &#xD; &#xD; .x-pwcpbfront-1-0 {margin-left: 0pt; margin-right: 0pt;
            } &#xD; &#xD; .x-pwcsoa-1-0 {margin-left: 0pt; margin-right: 0pt; text-indent: 0pt;
            margin-top: 8pt; } &#xD; .x-pwcsoa-1-1 {} &#xD; &#xD; .x-pwcspbdata-1-0 {margin-left:
            0pt; margin-right: 0pt; text-indent: 0pt; margin-top: 6pt; margin-bottom: 6pt; } &#xD;
            &#xD; .x-pwcspblist-1-0 {margin-left: 0pt; margin-right: 0pt; text-indent: 0pt;
            margin-top: 8pt; } &#xD; &#xD; .x-qty-1-0 {margin-left: 0pt; margin-right: 0pt; } &#xD;
            .x-qty-1-1 {} &#xD; &#xD; .x-qty-2-0 {margin-left: 0pt; margin-right: 0pt; } &#xD; &#xD;
            .x-quantity-1-0 {margin-left: 0pt; margin-right: 0pt; text-indent: 0pt; } &#xD; &#xD;
            .x-record-of-revisions-1-0 {margin-left: 0pt; margin-right: 0pt; } &#xD; &#xD;
            .x-ref-1-0 {margin-left: 0pt; margin-right: 0pt; text-indent: 0pt; } &#xD; &#xD;
            .x-ref-2-0 {margin-left: 0pt; margin-right: 0pt; text-indent: 0pt; } &#xD; &#xD;
            .x-refext-1-0 {margin-left: 0pt; margin-right: 0pt; text-indent: 0pt; } &#xD; &#xD;
            .x-refext-2-0 {margin-left: 0pt; margin-right: 0pt; } &#xD; &#xD; .x-refint-1-0
            {margin-left: 0pt; margin-right: 0pt; text-indent: 0pt; } &#xD; &#xD; .x-refint-2-0
            {margin-left: 0pt; margin-right: 0pt; color: #000000; text-decoration: no-underline ; }
            &#xD; &#xD; .x-refint-3-0 {margin-left: 0pt; margin-right: 0pt; } &#xD; &#xD;
            .x-refint-4-0 {margin-left: 0pt; margin-right: 0pt; } &#xD; &#xD; .x-refint-5-0
            {margin-left: 0pt; margin-right: 0pt; } &#xD; &#xD; .x-refint-6-0 {margin-left: 0pt;
            margin-right: 0pt; } &#xD; .x-refint-6-1 {} &#xD; &#xD; .x--ufe-refint-link-1-0
            {margin-left: 0pt; margin-right: 0pt; } &#xD; &#xD; .x-atidlm-resourcepair-1-0
            {margin-left: 0pt; margin-right: 0pt; text-indent: 0pt; } &#xD; &#xD; .x-rev-date-1-0
            {margin-left: 0pt; margin-right: 0pt; text-indent: 0pt; font-size: 18pt; text-align:
            center; } &#xD; &#xD; .x-rev-date-2-0 {margin-left: 0pt; margin-right: 0pt; text-indent:
            0pt; } &#xD; &#xD; .x--ufe-revdate-block-1-0 {margin-left: 0pt; margin-right: 0pt;
            text-indent: 0pt; margin-bottom: 24pt; } &#xD; &#xD; .x-row-1-0 {margin-left: 0pt;
            margin-right: 0pt; } &#xD; .x-row-1-1 {} &#xD; &#xD; .x-sb-item-1-0 {margin-left: 0pt;
            margin-right: 0pt; } &#xD; &#xD; .x-sbdata-1-0 {margin-left: 0pt; margin-right: 0pt;
            text-indent: 0pt; margin-top: 6pt; margin-bottom: 6pt; } &#xD; &#xD; .x-sblist-1-0
            {margin-left: 0pt; margin-right: 0pt; text-indent: 0pt; margin-top: 8pt; } &#xD; &#xD;
            .x--ufe-sblist-title-1-0 {margin-left: 0pt; margin-right: 0pt; text-indent: 0pt;
            font-family: sans-serif; color: #0000FF; text-align: left; line-height: 1.1; margin-top:
            1.5em; margin-bottom: 1em; margin-left: 0pt; text-indent: 0pt; } &#xD; &#xD;
            .x--ufe-sblist-title-2-0 {margin-left: 0pt; margin-right: 0pt; text-indent: 0pt;
            font-family: sans-serif; color: #0000FF; text-align: left; line-height: 1.1; margin-top:
            1.5em; margin-bottom: 1em; margin-left: 0pt; text-indent: 0pt; } &#xD; &#xD;
            .x--ufe-sblist-title-3-0 {margin-left: 0pt; margin-right: 0pt; text-indent: 0pt;
            font-weight: bold; font-size: 14pt; } &#xD; &#xD; .x-section-1-0 {margin-left: 0pt;
            margin-right: 0pt; text-indent: 0pt; } &#xD; &#xD; .x-sin-1-0 {margin-left: 0pt;
            margin-right: 0pt; } &#xD; &#xD; .x-slavename-1-0 {margin-left: 0pt; margin-right: 0pt;
            } &#xD; &#xD; .x-slavenbr-1-0 {margin-left: 0pt; margin-right: 0pt; } &#xD; &#xD;
            .x-slavepart-1-0 {margin-left: 0pt; margin-right: 0pt; } &#xD; &#xD;
            .x-atidlm-source-1-0 {margin-left: 0pt; margin-right: 0pt; text-indent: 0pt; } &#xD;
            &#xD; .x-source-item-1-0 {margin-left: 0pt; margin-right: 0pt; } &#xD; &#xD;
            .x-spanspec-1-0 {margin-left: 0pt; margin-right: 0pt; } &#xD; &#xD;
            .x--ufe-spblist-title-1-0 {margin-left: 0pt; margin-right: 0pt; text-indent: 0pt;
            font-family: sans-serif; color: #0000FF; text-align: left; line-height: 1.1; margin-top:
            1.5em; margin-bottom: 1em; margin-left: 0pt; text-indent: 0pt; } &#xD; &#xD;
            .x--ufe-spblist-title-2-0 {margin-left: 0pt; margin-right: 0pt; text-indent: 0pt;
            font-family: sans-serif; color: #0000FF; text-align: left; line-height: 1.1; margin-top:
            1.5em; margin-bottom: 1em; margin-left: 0pt; text-indent: 0pt; } &#xD; &#xD;
            .x--ufe-spblist-title-3-0 {margin-left: 0pt; margin-right: 0pt; text-indent: 0pt;
            font-weight: bold; font-size: 14pt; } &#xD; &#xD; .x-spec-tool-head-1-0 {margin-left:
            0pt; margin-right: 0pt; } &#xD; &#xD; .x-spec-tool-row-1-0 {margin-left: 0pt;
            margin-right: 0pt; } &#xD; &#xD; .x-spec-tool-table-1-0 {margin-left: 0pt; margin-right:
            0pt; text-indent: 0pt; margin-top: 8pt; } &#xD; &#xD; .x--ufe-spectools-title-1-0
            {margin-left: 0pt; margin-right: 0pt; text-indent: 0pt; font-family: sans-serif; color:
            #0000FF; text-align: left; line-height: 1.1; margin-top: 1.5em; margin-bottom: 1em;
            margin-left: 0pt; text-indent: 0pt; } &#xD; &#xD; .x--ufe-spectools-title-2-0
            {margin-left: 0pt; margin-right: 0pt; text-indent: 0pt; font-family: sans-serif; color:
            #0000FF; text-align: left; line-height: 1.1; margin-top: 1.5em; margin-bottom: 1em;
            margin-left: 0pt; text-indent: 0pt; } &#xD; &#xD; .x--ufe-spectools-title-3-0
            {margin-left: 0pt; margin-right: 0pt; text-indent: 0pt; font-family: sans-serif; color:
            #0000FF; text-align: left; line-height: 1.1; margin-top: 1.5em; margin-bottom: 1em;
            margin-left: 0pt; text-indent: 0pt; } &#xD; &#xD; .x--ufe-spectools-title-4-0
            {margin-left: 0pt; margin-right: 0pt; text-indent: 0pt; font-weight: bold; margin-left:
            1.5em; text-indent: -1.5em; } &#xD; &#xD; .x--ufe-spectools-title-5-0 {margin-left: 0pt;
            margin-right: 0pt; text-indent: 0pt; font-weight: bold; margin-left: 1.5em; text-indent:
            -1.5em; } &#xD; &#xD; .x--ufe-spectools-title-6-0 {margin-left: 0pt; margin-right: 0pt;
            text-indent: 0pt; } &#xD; &#xD; .x-sqrt-1-0 {margin-left: 0pt; margin-right: 0pt; }
            &#xD; &#xD; .x-state-1-0 {margin-left: 0pt; margin-right: 0pt; } &#xD; .x-state-1-1 {}
            &#xD; &#xD; .x-statement-1-0 {margin-left: 0pt; margin-right: 0pt; text-indent: 0pt;
            font-weight: normal; font-size: 11pt; text-align: center; } &#xD; &#xD; .x-std-1-0
            {margin-left: 0pt; margin-right: 0pt; } &#xD; .x-std-1-1 {} &#xD; &#xD; .x-stdname-1-0
            {margin-left: 0pt; margin-right: 0pt; } &#xD; &#xD; .x-stdnbr-1-0 {margin-left: 0pt;
            margin-right: 0pt; } &#xD; &#xD; .x-step-1-0 {margin-left: 0pt; margin-right: 0pt;
            text-indent: 0pt; margin-top: 6pt; margin-bottom: 6pt; margin-left: 0pt; text-indent:
            0pt; } &#xD; &#xD; .x-step-4-0 {margin-left: 0pt; margin-right: 0pt; text-indent: 0pt;
            margin-top: 6pt; margin-bottom: 6pt; margin-left: 0pt; text-indent: 0pt; } &#xD; &#xD;
            .x-step2-1-0 {margin-left: 0pt; margin-right: 0pt; text-indent: 0pt; margin-top: 6pt;
            margin-bottom: 6pt; margin-left: 0pt; text-indent: 0pt; } &#xD; &#xD; .x-step3-1-0
            {margin-left: 0pt; margin-right: 0pt; text-indent: 0pt; margin-top: 6pt; margin-bottom:
            6pt; margin-left: 0pt; text-indent: 0pt; } &#xD; &#xD; .x-step4-1-0 {margin-left: 0pt;
            margin-right: 0pt; text-indent: 0pt; margin-top: 6pt; margin-bottom: 6pt; margin-left:
            0pt; text-indent: 0pt; } &#xD; &#xD; .x-step5-1-0 {margin-left: 0pt; margin-right: 0pt;
            text-indent: 0pt; margin-top: 6pt; margin-bottom: 6pt; margin-left: 0pt; text-indent:
            0pt; } &#xD; &#xD; .x-sub-1-0 {margin-left: 0pt; margin-right: 0pt; font-size: .69em;
            bottom: -.15em; position: relative; } &#xD; &#xD; .x-subject-1-0 {margin-left: 0pt;
            margin-right: 0pt; text-indent: 0pt; } &#xD; &#xD; .x-subpara-1-0 {margin-left: 0pt;
            margin-right: 0pt; text-indent: 0pt; margin-top: 8pt; margin-left: 66pt; text-indent:
            0pt; } &#xD; &#xD; .x-subpara-2-0 {margin-left: 0pt; margin-right: 0pt; text-indent:
            0pt; margin-top: 8pt; margin-left: 35pt; text-indent: 0pt; } &#xD; &#xD; .x-subpara-3-0
            {margin-left: 0pt; margin-right: 0pt; text-indent: 0pt; margin-top: 8pt; margin-left:
            48pt; text-indent: 0pt; } &#xD; &#xD; .x-subpara-4-0 {margin-left: 0pt; margin-right:
            0pt; text-indent: 0pt; margin-top: 8pt; margin-left: 18pt; text-indent: 0pt; } &#xD;
            &#xD; .x-subpara-5-0 {margin-left: 0pt; margin-right: 0pt; text-indent: 0pt; margin-top:
            8pt; margin-left: 18pt; text-indent: 0pt; } &#xD; &#xD; .x-subpara-6-0 {margin-left:
            0pt; margin-right: 0pt; text-indent: 0pt; margin-top: 8pt; margin-left: 36pt;
            text-indent: 0pt; } &#xD; &#xD; .x-subpara-7-0 {margin-left: 0pt; margin-right: 0pt;
            text-indent: 0pt; margin-top: 8pt; margin-left: 36pt; text-indent: 0pt; } &#xD; &#xD;
            .x-subpara-8-0 {margin-left: 0pt; margin-right: 0pt; text-indent: 0pt; margin-top: 8pt;
            margin-left: 36pt; text-indent: 0pt; } &#xD; &#xD; .x-subpara-9-0 {margin-left: 0pt;
            margin-right: 0pt; text-indent: 0pt; margin-top: 8pt; margin-left: 18pt; text-indent:
            0pt; } &#xD; &#xD; .x-subpara-10-0 {margin-left: 0pt; margin-right: 0pt; text-indent:
            0pt; margin-top: 8pt; margin-left: 18pt; text-indent: 0pt; } &#xD; &#xD; .x-subpara-11-0
            {margin-left: 0pt; margin-right: 0pt; text-indent: 0pt; margin-top: 8pt; margin-left:
            18pt; text-indent: 0pt; } &#xD; &#xD; .x-subpara-12-0 {margin-left: 0pt; margin-right:
            0pt; text-indent: 0pt; margin-top: 8pt; margin-left: 18pt; text-indent: 0pt; } &#xD;
            &#xD; .x-subpara-13-0 {margin-left: 0pt; margin-right: 0pt; text-indent: 0pt;
            margin-top: 8pt; margin-left: 18pt; text-indent: 0pt; } &#xD; &#xD; .x-subpara-14-0
            {margin-left: 0pt; margin-right: 0pt; text-indent: 0pt; margin-top: 8pt; margin-left:
            0pt; text-indent: 0pt; } &#xD; &#xD; .x-subpara-15-0 {margin-left: 0pt; margin-right:
            0pt; text-indent: 0pt; margin-top: 8pt; margin-left: 18pt; text-indent: 0pt; } &#xD;
            &#xD; .x-subpara-16-0 {margin-left: 0pt; margin-right: 0pt; text-indent: 0pt;
            margin-top: 8pt; margin-left: 18pt; text-indent: 0pt; } &#xD; &#xD; .x-subtask-1-0
            {margin-left: 0pt; margin-right: 0pt; text-indent: 0pt; margin-top: 8pt; margin-left:
            18pt; text-indent: 0pt; } &#xD; .x-subtask-1-1 {} &#xD; .x-subtask-1-2 {} &#xD;
            .x-subtask-1-3 {} &#xD; &#xD; .x-sup-1-0 {margin-left: 0pt; margin-right: 0pt;
            font-size: .69em; top: -.33em; position: relative; } &#xD; &#xD;
            .x--ufe-supplier-list-title-1-0 {margin-left: 0pt; margin-right: 0pt; text-indent: 0pt;
            font-family: sans-serif; color: #0000FF; text-align: left; line-height: 1.1; margin-top:
            1.5em; margin-bottom: 1em; margin-left: 0pt; text-indent: 0pt; } &#xD; &#xD;
            .x--ufe-supplier-list-title-2-0 {margin-left: 0pt; margin-right: 0pt; text-indent: 0pt;
            font-family: sans-serif; color: #0000FF; text-align: left; line-height: 1.1; margin-top:
            1.5em; margin-bottom: 1em; margin-left: 0pt; text-indent: 0pt; } &#xD; &#xD;
            .x--ufe-supplier-list-title-3-0 {margin-left: 0pt; margin-right: 0pt; text-indent: 0pt;
            font-family: sans-serif; color: #0000FF; text-align: left; line-height: 1.1; margin-top:
            1.5em; margin-bottom: 1em; margin-left: 0pt; text-indent: 0pt; } &#xD; &#xD;
            .x--ufe-supplier-list-title-4-0 {margin-left: 0pt; margin-right: 0pt; text-indent: 0pt;
            font-weight: bold; font-size: 14pt; } &#xD; &#xD; .x-table-1-0 {margin-left: 0pt;
            margin-right: 0pt; text-indent: 0pt; margin-top: 8pt; font-family: Arial; margin-left:
            18pt; text-indent: 0pt; } &#xD; &#xD; .x-table-2-0 {margin-left: 0pt; margin-right: 0pt;
            text-indent: 0pt; margin-top: 8pt; font-family: Arial; margin-left: 18pt; text-indent:
            0pt; } &#xD; .x-table-2-1 {font-size: 10pt; } &#xD; &#xD; .x-table-4-0 {margin-left:
            0pt; margin-right: 0pt; text-indent: 0pt; margin-top: 8pt; font-family: Arial; } &#xD;
            &#xD; .x-table-7-0 {margin-left: 0pt; margin-right: 0pt; text-indent: 0pt; margin-top:
            8pt; font-family: Arial; font-size: 10pt; margin-left: 18pt; text-indent: 0pt; } &#xD;
            &#xD; .x-table-9-0 {margin-left: 0pt; margin-right: 0pt; text-indent: 0pt; margin-top:
            8pt; font-family: Arial; font-weight: bold; margin-left: 18pt; text-indent: 0pt; } &#xD;
            &#xD; .x-table-13-0 {margin-left: 0pt; margin-right: 0pt; text-indent: 0pt; margin-top:
            8pt; font-family: Arial; font-size: 9pt; } &#xD; &#xD; .x-atidlm-target-1-0
            {margin-left: 0pt; margin-right: 0pt; text-indent: 0pt; } &#xD; &#xD; .x-task-1-0
            {margin-left: 0pt; margin-right: 0pt; text-indent: 0pt; margin-top: 8pt; } &#xD;
            .x-task-1-1 {} &#xD; .x-task-1-2 {} &#xD; &#xD; .x--ufe-task-postspace-1-0 {margin-left:
            0pt; margin-right: 0pt; text-indent: 0pt; margin-bottom: 4pt; } &#xD; &#xD;
            .x--ufe-task-title-1-0 {margin-left: 0pt; margin-right: 0pt; text-indent: 0pt;
            font-family: sans-serif; color: #0000FF; text-align: left; line-height: 1.1; margin-top:
            1.5em; margin-bottom: 1em; margin-left: 0pt; text-indent: 0pt; } &#xD; &#xD;
            .x--ufe-task-title-2-0 {margin-left: 0pt; margin-right: 0pt; text-indent: 0pt;
            font-family: sans-serif; color: #0000FF; text-align: left; line-height: 1.1; margin-top:
            1.5em; margin-bottom: 1em; margin-left: 0pt; text-indent: 0pt; } &#xD; &#xD;
            .x--ufe-task-title-3-0 {margin-left: 0pt; margin-right: 0pt; text-indent: 0pt;
            margin-left: 1.5em; text-indent: -1.5em; } &#xD; &#xD; .x--ufe-task-title-4-0
            {margin-left: 0pt; margin-right: 0pt; text-indent: 0pt; } &#xD; &#xD; .x-taskproc-1-0
            {margin-left: 0pt; margin-right: 0pt; text-indent: 0pt; margin-top: 8pt; margin-left:
            18pt; text-indent: 0pt; } &#xD; &#xD; .x-tbody-1-0 {margin-left: 0pt; margin-right: 0pt;
            } &#xD; &#xD; .x-ted-1-0 {margin-left: 0pt; margin-right: 0pt; } &#xD; &#xD;
            .x-teddtl-1-0 {margin-left: 0pt; margin-right: 0pt; } &#xD; &#xD; .x-tel-1-0
            {margin-left: 0pt; margin-right: 0pt; text-indent: 0pt; } &#xD; &#xD; .x-tel-2-0
            {margin-left: 0pt; margin-right: 0pt; text-indent: 0pt; margin-left: 27pt; text-indent:
            0pt; } &#xD; &#xD; .x-tel-3-0 {margin-left: 0pt; margin-right: 0pt; text-indent: 0pt; }
            &#xD; &#xD; .x--ufe-temp-rev-title-1-0 {margin-left: 0pt; margin-right: 0pt;
            text-indent: 0pt; font-family: sans-serif; color: #0000FF; text-align: left;
            line-height: 1.1; margin-top: 1.5em; margin-bottom: 1em; margin-left: 0pt; text-indent:
            0pt; } &#xD; &#xD; .x--ufe-temp-rev-title-2-0 {margin-left: 0pt; margin-right: 0pt;
            text-indent: 0pt; font-family: sans-serif; color: #0000FF; text-align: left;
            line-height: 1.1; margin-top: 1.5em; margin-bottom: 1em; margin-left: 0pt; text-indent:
            0pt; } &#xD; &#xD; .x--ufe-temp-rev-title-3-0 {margin-left: 0pt; margin-right: 0pt;
            text-indent: 0pt; font-weight: bold; font-size: 14pt; } &#xD; &#xD; .x-term-1-0
            {margin-left: 0pt; margin-right: 0pt; } &#xD; &#xD; .x-term-2-0 {margin-left: 0pt;
            margin-right: 0pt; } &#xD; &#xD; .x-tfmatr-1-0 {margin-left: 0pt; margin-right: 0pt;
            text-indent: 0pt; margin-left: 18pt; text-indent: 0pt; } &#xD; &#xD; .x-tfoot-1-0
            {text-align: left; margin-left: 0pt; margin-right: 0pt; } &#xD; &#xD; .x-tgroup-1-0
            {margin-left: 0pt; margin-right: 0pt; } &#xD; &#xD; .x-thead-1-0 {text-align: left;
            margin-left: 0pt; margin-right: 0pt; } &#xD; &#xD; .x-title-1-0 {margin-left: 0pt;
            margin-right: 0pt; text-indent: 0pt; margin-left: 1.5em; text-indent: -1.5em; } &#xD;
            &#xD; .x-title-2-0 {margin-left: 0pt; margin-right: 0pt; text-indent: 0pt; margin-left:
            1.5em; text-indent: -1.5em; } &#xD; &#xD; .x-title-3-0 {margin-left: 0pt; margin-right:
            0pt; text-indent: 0pt; margin-left: 1.5em; text-indent: -1.5em; } &#xD; &#xD;
            .x-title-4-0 {margin-left: 0pt; margin-right: 0pt; text-indent: 0pt; font-weight: bold;
            font-size: 14pt; margin-left: 0pt; text-indent: -0pt; } &#xD; &#xD; .x-title-5-0
            {margin-left: 0pt; margin-right: 0pt; text-indent: 0pt; font-weight: bold; font-size:
            14pt; margin-left: 0pt; text-indent: -0pt; } &#xD; &#xD; .x-title-6-0 {margin-left: 0pt;
            margin-right: 0pt; text-indent: 0pt; font-weight: bold; font-size: 14pt; margin-left:
            3em; text-indent: -3em; } &#xD; .x-title-6-1 {margin-left: 3em; text-indent: -3em; }
            &#xD; .x-title-6-2 {margin-left: 3em; text-indent: -3em; } &#xD; .x-title-6-3
            {margin-left: 3em; text-indent: -3em; } &#xD; .x-title-6-4 {margin-left: 3em;
            text-indent: -3em; } &#xD; .x-title-6-5 {margin-left: 3em; text-indent: -3em; } &#xD;
            .x-title-6-6 {margin-left: 3em; text-indent: -3em; } &#xD; &#xD; .x-title-7-0
            {margin-left: 0pt; margin-right: 0pt; text-indent: 0pt; font-family: sans-serif; color:
            #0000FF; text-align: left; line-height: 1.1; margin-top: 1.5em; margin-bottom: 1em; }
            &#xD; .x-title-7-1 {margin-left: 3em; text-indent: -3em; } &#xD; .x-title-7-2
            {margin-left: 3em; text-indent: -3em; } &#xD; .x-title-7-3 {margin-left: 3em;
            text-indent: -3em; } &#xD; .x-title-7-4 {margin-left: 3em; text-indent: -3em; } &#xD;
            .x-title-7-5 {margin-left: 3em; text-indent: -3em; } &#xD; .x-title-7-6 {margin-left:
            3em; text-indent: -3em; } &#xD; &#xD; .x-title-8-0 {margin-left: 0pt; margin-right: 0pt;
            text-indent: 0pt; font-weight: bold; font-size: 14pt; } &#xD; &#xD; .x-title-11-0
            {margin-left: 0pt; margin-right: 0pt; text-indent: 0pt; margin-left: 18pt; text-indent:
            -18pt; } &#xD; &#xD; .x-title-13-0 {margin-left: 0pt; margin-right: 0pt; text-indent:
            0pt; margin-left: 19pt; text-indent: -19pt; } &#xD; &#xD; .x-title-14-0 {margin-left:
            0pt; margin-right: 0pt; text-indent: 0pt; margin-left: 1.5em; text-indent: -1.5em; }
            &#xD; &#xD; .x-title-16-0 {margin-left: 0pt; margin-right: 0pt; text-indent: 0pt;
            margin-left: 1.5em; text-indent: -1.5em; } &#xD; &#xD; .x-title-17-0 {margin-left: 0pt;
            margin-right: 0pt; text-indent: 0pt; font-weight: bold; font-size: 14pt; } &#xD; &#xD;
            .x-title-18-0 {margin-left: 0pt; margin-right: 0pt; text-indent: 0pt; font-weight: bold;
            font-size: 14pt; text-transform: uppercase; } &#xD; &#xD; .x-title-19-0 {margin-left:
            0pt; margin-right: 0pt; text-indent: 0pt; font-weight: bold; font-size: 14pt; } &#xD;
            &#xD; .x-title-20-0 {margin-left: 0pt; margin-right: 0pt; text-indent: 0pt; font-weight:
            bold; font-size: 14pt; } &#xD; &#xD; .x-title-21-0 {margin-left: 0pt; margin-right: 0pt;
            text-indent: 0pt; font-weight: bold; font-size: 14pt; } &#xD; &#xD; .x-title-22-0
            {margin-left: 0pt; margin-right: 0pt; text-indent: 0pt; font-family: sans-serif; color:
            #0000FF; text-align: left; line-height: 1.1; margin-top: 1.5em; margin-bottom: 1em;
            font-weight: bold; font-size: 14pt; margin-left: 3em; text-indent: -3em; } &#xD;
            .x-title-22-1 {margin-left: 3em; text-indent: -3em; } &#xD; .x-title-22-2 {margin-left:
            3em; text-indent: -3em; } &#xD; .x-title-22-3 {margin-left: 3em; text-indent: -3em; }
            &#xD; .x-title-22-4 {margin-left: 3em; text-indent: -3em; } &#xD; .x-title-22-5
            {margin-left: 3em; text-indent: -3em; } &#xD; .x-title-22-6 {margin-left: 3em;
            text-indent: -3em; } &#xD; .x-title-22-7 {margin-left: 3em; text-indent: -3em; } &#xD;
            .x-title-22-8 {margin-left: 3em; text-indent: -3em; } &#xD; &#xD; .x-title-23-0
            {margin-left: 0pt; margin-right: 0pt; text-indent: 0pt; font-family: sans-serif; color:
            #0000FF; text-align: left; line-height: 1.1; margin-top: 1.5em; margin-bottom: 1em;
            font-weight: bold; font-size: 14pt; margin-left: 3em; text-indent: -3em; } &#xD;
            .x-title-23-1 {margin-left: 3em; text-indent: -3em; } &#xD; .x-title-23-2 {margin-left:
            3em; text-indent: -3em; } &#xD; &#xD; .x-title-24-0 {margin-left: 0pt; margin-right:
            0pt; text-indent: 0pt; font-family: sans-serif; color: #0000FF; text-align: left;
            line-height: 1.1; margin-top: 1.5em; margin-bottom: 1em; font-weight: bold; font-size:
            14pt; margin-left: 3em; text-indent: -3em; } &#xD; .x-title-24-1 {margin-left: 3em;
            text-indent: -3em; } &#xD; .x-title-24-2 {margin-left: 3em; text-indent: -3em; } &#xD;
            &#xD; .x-title-27-0 {margin-left: 0pt; margin-right: 0pt; text-indent: 0pt; font-weight:
            bold; margin-left: 1.5em; text-indent: -1.5em; } &#xD; &#xD; .x-title-28-0 {margin-left:
            0pt; margin-right: 0pt; text-indent: 0pt; font-weight: bold; margin-left: 1.5em;
            text-indent: -1.5em; } &#xD; &#xD; .x-title-31-0 {margin-left: 0pt; margin-right: 0pt;
            text-indent: 0pt; font-weight: bold; font-size: 14pt; } &#xD; &#xD; .x-title-32-0
            {margin-left: 0pt; margin-right: 0pt; text-indent: 0pt; font-weight: bold; font-size:
            14pt; margin-left: 0pt; text-indent: -0pt; } &#xD; .x-title-32-1 {margin-left: 3em;
            text-indent: -3em; } &#xD; .x-title-32-2 {margin-left: 3em; text-indent: -3em; } &#xD;
            .x-title-32-3 {margin-left: 3em; text-indent: -3em; } &#xD; .x-title-32-4 {margin-left:
            3em; text-indent: -3em; } &#xD; .x-title-32-5 {margin-left: 3em; text-indent: -3em; }
            &#xD; .x-title-32-6 {margin-left: 3em; text-indent: -3em; } &#xD; .x-title-32-7
            {margin-left: 3em; text-indent: -3em; } &#xD; .x-title-32-8 {margin-left: 3em;
            text-indent: -3em; } &#xD; .x-title-32-9 {margin-left: 3em; text-indent: -3em; } &#xD;
            .x-title-32-10 {margin-left: 3em; text-indent: -3em; } &#xD; .x-title-32-11
            {margin-left: 3em; text-indent: -3em; } &#xD; .x-title-32-12 {margin-left: 3em;
            text-indent: -3em; } &#xD; .x-title-32-13 {margin-left: 3em; text-indent: -3em; } &#xD;
            .x-title-32-14 {margin-left: 3em; text-indent: -3em; } &#xD; .x-title-32-15
            {margin-left: 3em; text-indent: -3em; } &#xD; .x-title-32-16 {margin-left: 3em;
            text-indent: -3em; } &#xD; .x-title-32-17 {margin-left: 3em; text-indent: -3em; } &#xD;
            .x-title-32-18 {margin-left: 3em; text-indent: -3em; } &#xD; .x-title-32-19
            {margin-left: 3em; text-indent: -3em; } &#xD; .x-title-32-20 {margin-left: 3em;
            text-indent: -3em; } &#xD; .x-title-32-21 {margin-left: 3em; text-indent: -3em; } &#xD;
            .x-title-32-22 {margin-left: 3em; text-indent: -3em; } &#xD; .x-title-32-23
            {margin-left: 3em; text-indent: -3em; } &#xD; .x-title-32-24 {margin-left: 3em;
            text-indent: -3em; } &#xD; .x-title-32-25 {margin-left: 3em; text-indent: -3em; } &#xD;
            .x-title-32-26 {margin-left: 3em; text-indent: -3em; } &#xD; .x-title-32-27
            {margin-left: 3em; text-indent: -3em; } &#xD; .x-title-32-28 {margin-left: 3em;
            text-indent: -3em; } &#xD; .x-title-32-29 {margin-left: 3em; text-indent: -3em; } &#xD;
            .x-title-32-30 {margin-left: 3em; text-indent: -3em; } &#xD; .x-title-32-31
            {margin-left: 3em; text-indent: -3em; } &#xD; .x-title-32-32 {margin-left: 3em;
            text-indent: -3em; } &#xD; .x-title-32-33 {margin-left: 3em; text-indent: -3em; } &#xD;
            .x-title-32-34 {margin-left: 3em; text-indent: -3em; } &#xD; .x-title-32-35
            {margin-left: 3em; text-indent: -3em; } &#xD; .x-title-32-36 {margin-left: 3em;
            text-indent: -3em; } &#xD; &#xD; .x-title-33-0 {margin-left: 0pt; margin-right: 0pt;
            text-indent: 0pt; } &#xD; .x-title-33-1 {} &#xD; &#xD; .x-title-34-0 {margin-left: 0pt;
            margin-right: 0pt; text-indent: 0pt; font-weight: bold; font-size: 14pt; text-transform:
            uppercase; } &#xD; &#xD; .x-title-35-0 {margin-left: 0pt; margin-right: 0pt;
            text-indent: 0pt; margin-left: 1.5em; text-indent: -1.5em; } &#xD; &#xD; .x-title-36-0
            {margin-left: 0pt; margin-right: 0pt; text-indent: 0pt; margin-left: 1.5em; text-indent:
            -1.5em; } &#xD; .x-title-36-1 {} &#xD; &#xD; .x-title-37-0 {margin-left: 0pt;
            margin-right: 0pt; text-indent: 0pt; font-weight: bold; font-size: 14pt; } &#xD; &#xD;
            .x-title-38-0 {margin-left: 0pt; margin-right: 0pt; text-indent: 0pt; font-weight: bold;
            font-size: 14pt; text-transform: uppercase; margin-left: 0pt; text-indent: 0pt; } &#xD;
            &#xD; .x-title-39-0 {margin-left: 0pt; margin-right: 0pt; text-indent: 0pt; margin-left:
            18pt; text-indent: -18pt; } &#xD; &#xD; .x-title-41-0 {margin-left: 0pt; margin-right:
            0pt; text-indent: 0pt; font-weight: bold; font-size: 14pt; text-transform: uppercase; }
            &#xD; &#xD; .x-title-42-0 {margin-left: 0pt; margin-right: 0pt; text-indent: 0pt;
            font-weight: bold; font-size: 14pt; } &#xD; &#xD; .x-title-43-0 {margin-left: 0pt;
            margin-right: 0pt; text-indent: 0pt; font-size: 12pt; text-decoration: underline ;
            margin-left: 0pt; text-indent: 0pt; } &#xD; &#xD; .x-title-44-0 {margin-left: 0pt;
            margin-right: 0pt; text-indent: 0pt; margin-left: 0pt; text-indent: 0pt; } &#xD; &#xD;
            .x-title-45-0 {margin-left: 0pt; margin-right: 0pt; text-indent: 0pt; } &#xD; &#xD;
            .x-title-46-0 {margin-left: 0pt; margin-right: 0pt; text-indent: 0pt; margin-left: 18pt;
            text-indent: -18pt; } &#xD; &#xD; .x-title-47-0 {margin-left: 0pt; margin-right: 0pt;
            text-indent: 0pt; margin-left: 1.5em; text-indent: -1.5em; } &#xD; &#xD; .x-title-48-0
            {margin-left: 0pt; margin-right: 0pt; text-indent: 0pt; font-weight: bold; font-size:
            12pt; margin-left: 1em; text-indent: -1em; } &#xD; &#xD; .x-title-50-0 {margin-left:
            0pt; margin-right: 0pt; text-indent: 0pt; font-weight: bold; font-size: 14pt;
            margin-left: 0pt; text-indent: 0pt; } &#xD; &#xD; .x-title-51-0 {margin-left: 0pt;
            margin-right: 0pt; text-indent: 0pt; font-weight: bold; font-size: 14pt; margin-left:
            0pt; text-indent: 0pt; } &#xD; &#xD; .x-title-52-0 {margin-left: 0pt; margin-right: 0pt;
            text-indent: 0pt; font-weight: bold; margin-left: 0pt; text-indent: 0pt; } &#xD; &#xD;
            .x-title-53-0 {margin-left: 0pt; margin-right: 0pt; text-indent: 0pt; font-weight: bold;
            margin-left: 0pt; text-indent: 0pt; } &#xD; &#xD; .x-title-54-0 {margin-left: 0pt;
            margin-right: 0pt; text-indent: 0pt; font-weight: bold; font-size: 12pt; margin-left:
            0pt; text-indent: 0pt; } &#xD; &#xD; .x-title-55-0 {margin-left: 0pt; margin-right: 0pt;
            text-indent: 0pt; font-weight: bold; font-size: 12pt; margin-left: 0pt; text-indent:
            0pt; } &#xD; &#xD; .x-title-56-0 {margin-left: 0pt; margin-right: 0pt; text-indent: 0pt;
            margin-left: 1.5em; text-indent: -1.5em; } &#xD; &#xD; .x-title-57-0 {margin-left: 0pt;
            margin-right: 0pt; text-indent: 0pt; } &#xD; &#xD; .x-title-58-0 {margin-left: 0pt;
            margin-right: 0pt; text-indent: 0pt; margin-left: 18pt; text-indent: 0pt; } &#xD; &#xD;
            .x-title-59-0 {margin-left: 0pt; margin-right: 0pt; text-indent: 0pt; font-weight: bold;
            font-size: 14pt; margin-left: 0pt; text-indent: 0pt; } &#xD; &#xD; .x-title-60-0
            {margin-left: 0pt; margin-right: 0pt; text-indent: 0pt; font-weight: bold; font-size:
            12pt; text-decoration: underline ; margin-left: 0pt; text-indent: -0pt; } &#xD; &#xD;
            .x-title-61-0 {margin-left: 0pt; margin-right: 0pt; text-indent: 0pt; font-weight: bold;
            font-size: 12pt; text-decoration: underline ; margin-left: 0pt; text-indent: -0pt; }
            &#xD; &#xD; .x-title-62-0 {margin-left: 0pt; margin-right: 0pt; text-indent: 0pt;
            margin-left: 0pt; text-indent: 0pt; } &#xD; &#xD; .x-title-63-0 {margin-left: 0pt;
            margin-right: 0pt; text-indent: 0pt; font-weight: bold; font-size: 14pt; margin-left:
            0pt; text-indent: 0pt; } &#xD; &#xD; .x-title-64-0 {margin-left: 0pt; margin-right: 0pt;
            text-indent: 0pt; font-weight: bold; font-size: 14pt; margin-left: 0pt; text-indent:
            -0pt; } &#xD; &#xD; .x-title-65-0 {margin-left: 0pt; margin-right: 0pt; text-indent:
            0pt; margin-left: 0pt; text-indent: 0pt; } &#xD; &#xD; .x-title-66-0 {margin-left: 0pt;
            margin-right: 0pt; text-indent: 0pt; font-weight: bold; font-size: 14pt; margin-left:
            0pt; text-indent: 0pt; } &#xD; &#xD; .x-title-67-0 {margin-left: 0pt; margin-right: 0pt;
            text-indent: 0pt; font-weight: bold; font-size: 14pt; margin-left: 0pt; text-indent:
            -0pt; } &#xD; .x-title-67-1 {} &#xD; .x-title-67-2 {margin-left: 3em; text-indent: -3em;
            } &#xD; .x-title-67-3 {margin-left: 3em; text-indent: -3em; } &#xD; .x-title-67-4
            {margin-left: 3em; text-indent: -3em; } &#xD; .x-title-67-5 {margin-left: 3em;
            text-indent: -3em; } &#xD; .x-title-67-6 {margin-left: 3em; text-indent: -3em; } &#xD;
            .x-title-67-7 {margin-left: 3em; text-indent: -3em; } &#xD; .x-title-67-8 {margin-left:
            3em; text-indent: -3em; } &#xD; .x-title-67-9 {margin-left: 3em; text-indent: -3em; }
            &#xD; .x-title-67-10 {margin-left: 3em; text-indent: -3em; } &#xD; .x-title-67-11
            {margin-left: 3em; text-indent: -3em; } &#xD; .x-title-67-12 {margin-left: 3em;
            text-indent: -3em; } &#xD; .x-title-67-13 {margin-left: 3em; text-indent: -3em; } &#xD;
            .x-title-67-14 {margin-left: 3em; text-indent: -3em; } &#xD; .x-title-67-15
            {margin-left: 3em; text-indent: -3em; } &#xD; .x-title-67-16 {margin-left: 3em;
            text-indent: -3em; } &#xD; .x-title-67-17 {margin-left: 3em; text-indent: -3em; } &#xD;
            .x-title-67-18 {margin-left: 3em; text-indent: -3em; } &#xD; .x-title-67-19
            {margin-left: 3em; text-indent: -3em; } &#xD; .x-title-67-20 {margin-left: 3em;
            text-indent: -3em; } &#xD; .x-title-67-21 {margin-left: 3em; text-indent: -3em; } &#xD;
            .x-title-67-22 {margin-left: 3em; text-indent: -3em; } &#xD; .x-title-67-23
            {margin-left: 3em; text-indent: -3em; } &#xD; .x-title-67-24 {margin-left: 3em;
            text-indent: -3em; } &#xD; .x-title-67-25 {margin-left: 3em; text-indent: -3em; } &#xD;
            .x-title-67-26 {margin-left: 3em; text-indent: -3em; } &#xD; .x-title-67-27
            {margin-left: 3em; text-indent: -3em; } &#xD; .x-title-67-28 {margin-left: 3em;
            text-indent: -3em; } &#xD; .x-title-67-29 {margin-left: 3em; text-indent: -3em; } &#xD;
            .x-title-67-30 {margin-left: 3em; text-indent: -3em; } &#xD; .x-title-67-31
            {margin-left: 3em; text-indent: -3em; } &#xD; .x-title-67-32 {margin-left: 3em;
            text-indent: -3em; } &#xD; .x-title-67-33 {margin-left: 3em; text-indent: -3em; } &#xD;
            .x-title-67-34 {margin-left: 3em; text-indent: -3em; } &#xD; .x-title-67-35
            {margin-left: 3em; text-indent: -3em; } &#xD; .x-title-67-36 {margin-left: 3em;
            text-indent: -3em; } &#xD; .x-title-67-37 {margin-left: 3em; text-indent: -3em; } &#xD;
            .x-title-67-38 {font-size: 10pt; margin-left: 1.5em; text-indent: -1.5em; } &#xD;
            .x-title-67-39 {font-size: 10pt; margin-left: 1.5em; text-indent: -1.5em; } &#xD; &#xD;
            .x-title-68-0 {margin-left: 0pt; margin-right: 0pt; text-indent: 0pt; font-weight: bold;
            font-size: 14pt; margin-left: 0pt; text-indent: -0pt; } &#xD; .x-title-68-1 {} &#xD;
            .x-title-68-2 {margin-left: 3em; text-indent: -3em; } &#xD; .x-title-68-3 {margin-left:
            3em; text-indent: -3em; } &#xD; .x-title-68-4 {margin-left: 3em; text-indent: -3em; }
            &#xD; .x-title-68-5 {margin-left: 3em; text-indent: -3em; } &#xD; .x-title-68-6
            {margin-left: 3em; text-indent: -3em; } &#xD; .x-title-68-7 {margin-left: 3em;
            text-indent: -3em; } &#xD; .x-title-68-8 {margin-left: 3em; text-indent: -3em; } &#xD;
            .x-title-68-9 {margin-left: 3em; text-indent: -3em; } &#xD; .x-title-68-10 {margin-left:
            3em; text-indent: -3em; } &#xD; .x-title-68-11 {margin-left: 3em; text-indent: -3em; }
            &#xD; .x-title-68-12 {margin-left: 3em; text-indent: -3em; } &#xD; .x-title-68-13
            {margin-left: 3em; text-indent: -3em; } &#xD; .x-title-68-14 {margin-left: 3em;
            text-indent: -3em; } &#xD; .x-title-68-15 {margin-left: 3em; text-indent: -3em; } &#xD;
            .x-title-68-16 {margin-left: 3em; text-indent: -3em; } &#xD; .x-title-68-17
            {margin-left: 3em; text-indent: -3em; } &#xD; .x-title-68-18 {margin-left: 3em;
            text-indent: -3em; } &#xD; .x-title-68-19 {margin-left: 3em; text-indent: -3em; } &#xD;
            .x-title-68-20 {margin-left: 3em; text-indent: -3em; } &#xD; .x-title-68-21
            {margin-left: 3em; text-indent: -3em; } &#xD; .x-title-68-22 {margin-left: 3em;
            text-indent: -3em; } &#xD; .x-title-68-23 {margin-left: 3em; text-indent: -3em; } &#xD;
            .x-title-68-24 {margin-left: 3em; text-indent: -3em; } &#xD; .x-title-68-25
            {margin-left: 3em; text-indent: -3em; } &#xD; .x-title-68-26 {margin-left: 3em;
            text-indent: -3em; } &#xD; .x-title-68-27 {margin-left: 3em; text-indent: -3em; } &#xD;
            .x-title-68-28 {margin-left: 3em; text-indent: -3em; } &#xD; .x-title-68-29
            {margin-left: 3em; text-indent: -3em; } &#xD; .x-title-68-30 {margin-left: 3em;
            text-indent: -3em; } &#xD; .x-title-68-31 {margin-left: 3em; text-indent: -3em; } &#xD;
            .x-title-68-32 {margin-left: 3em; text-indent: -3em; } &#xD; .x-title-68-33
            {margin-left: 3em; text-indent: -3em; } &#xD; .x-title-68-34 {margin-left: 3em;
            text-indent: -3em; } &#xD; .x-title-68-35 {margin-left: 3em; text-indent: -3em; } &#xD;
            .x-title-68-36 {margin-left: 3em; text-indent: -3em; } &#xD; .x-title-68-37
            {margin-left: 3em; text-indent: -3em; } &#xD; .x-title-68-38 {margin-left: 3em;
            text-indent: -3em; } &#xD; .x-title-68-39 {margin-left: 3em; text-indent: -3em; } &#xD;
            .x-title-68-40 {font-size: 10pt; margin-left: 1.5em; text-indent: -1.5em; } &#xD;
            .x-title-68-41 {font-size: 10pt; margin-left: 1.5em; text-indent: -1.5em; } &#xD; &#xD;
            .x-title-69-0 {margin-left: 0pt; margin-right: 0pt; text-indent: 0pt; font-weight: bold;
            font-size: 12pt; text-decoration: underline ; margin-left: 0pt; text-indent: -0pt; }
            &#xD; &#xD; .x-title-70-0 {margin-left: 0pt; margin-right: 0pt; text-indent: 0pt;
            font-weight: bold; font-size: 24pt; } &#xD; &#xD; .x-title-71-0 {margin-left: 0pt;
            margin-right: 0pt; text-indent: 0pt; margin-left: 0pt; text-indent: -0pt; } &#xD; &#xD;
            .x-title-72-0 {margin-left: 0pt; margin-right: 0pt; text-indent: 0pt; font-weight: bold;
            font-size: 14pt; margin-left: 0pt; text-indent: 0pt; } &#xD; &#xD; .x-title-73-0
            {margin-left: 0pt; margin-right: 0pt; text-indent: 0pt; font-weight: bold; } &#xD;
            .x-title-73-1 {font-weight: normal; text-decoration: underline ; } &#xD; &#xD;
            .x--ufe-title-block-1-0 {margin-left: 0pt; margin-right: 0pt; text-indent: 0pt;
            font-weight: normal; font-size: 16pt; margin-top: 12pt; margin-bottom: 12pt; } &#xD;
            &#xD; .x--ufe-tmm-title-1-0 {margin-left: 0pt; margin-right: 0pt; text-indent: 0pt;
            font-family: sans-serif; color: #0000FF; text-align: left; line-height: 1.1; margin-top:
            1.5em; margin-bottom: 1em; margin-left: 0pt; text-indent: 0pt; } &#xD; &#xD;
            .x--ufe-tmm-title-2-0 {margin-left: 0pt; margin-right: 0pt; text-indent: 0pt;
            font-family: sans-serif; color: #0000FF; text-align: left; line-height: 1.1; margin-top:
            1.5em; margin-bottom: 1em; margin-left: 0pt; text-indent: 0pt; } &#xD; &#xD;
            .x--ufe-tmm-title-3-0 {margin-left: 0pt; margin-right: 0pt; text-indent: 0pt;
            font-weight: bold; font-size: 36pt; text-align: center; margin-bottom: 12pt; } &#xD;
            .x--ufe-tmm-title-3-1 {} &#xD; &#xD; .x-toc-1-0 {margin-left: 0pt; margin-right: 0pt; }
            &#xD; &#xD; .x-tool-1-0 {margin-left: 0pt; margin-right: 0pt; } &#xD; &#xD;
            .x-toolname-1-0 {margin-left: 0pt; margin-right: 0pt; } &#xD; &#xD; .x-toolnbr-1-0
            {margin-left: 0pt; margin-right: 0pt; } &#xD; &#xD; .x-tprereq-1-0 {margin-left: 0pt;
            margin-right: 0pt; text-indent: 0pt; margin-top: 8pt; } &#xD; &#xD; .x-tr-1-0
            {margin-left: 0pt; margin-right: 0pt; } &#xD; &#xD; .x-transltr-1-0 {margin-left: 0pt;
            margin-right: 0pt; } &#xD; &#xD; .x-trbody-1-0 {margin-left: 0pt; margin-right: 0pt; }
            &#xD; &#xD; .x-trdata-1-0 {margin-left: 0pt; margin-right: 0pt; text-indent: 0pt; }
            &#xD; &#xD; .x-trfignum-1-0 {margin-left: 0pt; margin-right: 0pt; } &#xD; &#xD;
            .x-trfmatr-1-0 {margin-left: 0pt; margin-right: 0pt; } &#xD; &#xD; .x-trlist-1-0
            {margin-left: 0pt; margin-right: 0pt; text-indent: 0pt; } &#xD; &#xD; .x-trloc-1-0
            {margin-left: 0pt; margin-right: 0pt; } &#xD; &#xD; .x-trnbr-1-0 {margin-left: 0pt;
            margin-right: 0pt; } &#xD; &#xD; .x-trreason-1-0 {margin-left: 0pt; margin-right: 0pt; }
            &#xD; &#xD; .x-trstatus-1-0 {margin-left: 0pt; margin-right: 0pt; } &#xD; &#xD;
            .x-trsupdata-1-0 {margin-left: 0pt; margin-right: 0pt; } &#xD; &#xD; .x-trtblnum-1-0
            {margin-left: 0pt; margin-right: 0pt; } &#xD; &#xD; .x-trxref-1-0 {margin-left: 0pt;
            margin-right: 0pt; } &#xD; &#xD; .x-txtgrphc-1-0 {margin-left: 0pt; margin-right: 0pt; }
            &#xD; &#xD; .x-txtline-1-0 {margin-left: 0pt; margin-right: 0pt; } &#xD; &#xD;
            .x-type-1-0 {margin-left: 0pt; margin-right: 0pt; text-indent: 0pt; font-size: 18pt;
            text-align: center; margin-bottom: 12pt; } &#xD; &#xD; .x-type-2-0 {margin-left: 0pt;
            margin-right: 0pt; text-indent: 0pt; } &#xD; &#xD; .x-unlist-1-0 {margin-left: 0pt;
            margin-right: 0pt; text-indent: 0pt; margin-top: 8pt; margin-left: 22pt; text-indent:
            0pt; } &#xD; &#xD; .x-unlist-2-0 {margin-left: 0pt; margin-right: 0pt; text-indent: 0pt;
            margin-top: 8pt; font-size: 9pt; margin-left: 38pt; text-indent: 0pt; } &#xD; &#xD;
            .x-unlist-3-0 {margin-left: 0pt; margin-right: 0pt; text-indent: 0pt; margin-top: 8pt;
            font-size: 9pt; } &#xD; &#xD; .x-unlist-4-0 {margin-left: 0pt; margin-right: 0pt;
            text-indent: 0pt; margin-top: 8pt; font-size: 9pt; } &#xD; &#xD; .x-unlist-5-0
            {margin-left: 0pt; margin-right: 0pt; text-indent: 0pt; margin-top: 8pt; font-size: 9pt;
            } &#xD; &#xD; .x-unlist-6-0 {margin-left: 0pt; margin-right: 0pt; text-indent: 0pt;
            margin-top: 8pt; font-size: 9pt; } &#xD; &#xD; .x-unlist-7-0 {margin-left: 0pt;
            margin-right: 0pt; text-indent: 0pt; margin-top: 8pt; font-size: 9pt; margin-left: 36pt;
            text-indent: 0pt; } &#xD; &#xD; .x-unlist-8-0 {margin-left: 0pt; margin-right: 0pt;
            text-indent: 0pt; margin-top: 8pt; font-size: 9pt; margin-left: 18pt; text-indent: 0pt;
            } &#xD; &#xD; .x-unlitem-1-0 {margin-left: 0pt; margin-right: 0pt; text-indent: 0pt;
            margin-top: 6pt; margin-bottom: 6pt; margin-left: 0pt; text-indent: 0pt; } &#xD; &#xD;
            .x-unlitem-2-0 {margin-left: 0pt; margin-right: 0pt; text-indent: 0pt; margin-top: 6pt;
            margin-bottom: 6pt; margin-left: 0pt; text-indent: 0pt; } &#xD; &#xD; .x-unlitem-3-0
            {margin-left: 0pt; margin-right: 0pt; text-indent: 0pt; margin-top: 6pt; margin-bottom:
            6pt; margin-left: 0pt; text-indent: 0pt; } &#xD; &#xD; .x-unlitem-4-0 {margin-left: 0pt;
            margin-right: 0pt; text-indent: 0pt; margin-top: 6pt; margin-bottom: 6pt; margin-left:
            0pt; text-indent: 0pt; } &#xD; &#xD; .x-unlitem-5-0 {margin-left: 0pt; margin-right:
            0pt; text-indent: 0pt; margin-top: 6pt; margin-bottom: 6pt; margin-left: 0pt;
            text-indent: 0pt; } &#xD; &#xD; .x-unlitem-6-0 {margin-left: 0pt; margin-right: 0pt;
            text-indent: 0pt; margin-top: 6pt; margin-bottom: 6pt; margin-left: 0pt; text-indent:
            0pt; } &#xD; &#xD; .x-unlitem-7-0 {margin-left: 0pt; margin-right: 0pt; text-indent:
            0pt; margin-top: 6pt; margin-bottom: 6pt; margin-left: 0pt; text-indent: 0pt; } &#xD;
            &#xD; .x-unlitem-8-0 {margin-left: 0pt; margin-right: 0pt; text-indent: 0pt; margin-top:
            6pt; margin-bottom: 6pt; margin-left: 0pt; text-indent: 0pt; } &#xD; &#xD;
            .x-unlitem-9-0 {margin-left: 0pt; margin-right: 0pt; text-indent: 0pt; margin-top: 6pt;
            margin-bottom: 6pt; margin-left: 0pt; text-indent: 0pt; } &#xD; &#xD; .x-unlitem-10-0
            {margin-left: 0pt; margin-right: 0pt; text-indent: 0pt; margin-top: 6pt; margin-bottom:
            6pt; margin-left: 0pt; text-indent: 0pt; } &#xD; .x-unlitem-10-1 {margin-left: 0pt;
            text-indent: 0pt; } &#xD; .x-unlitem-10-2 {margin-left: 0pt; text-indent: 0pt; } &#xD;
            &#xD; .x-unlitem-11-0 {margin-left: 0pt; margin-right: 0pt; text-indent: 0pt;
            margin-top: 6pt; margin-bottom: 6pt; margin-left: 0pt; text-indent: 0pt; } &#xD; &#xD;
            .x-unlitem-12-0 {margin-left: 0pt; margin-right: 0pt; text-indent: 0pt; margin-top: 6pt;
            margin-bottom: 6pt; margin-left: 0pt; text-indent: 0pt; } &#xD; &#xD; .x-unlitem-13-0
            {margin-left: 0pt; margin-right: 0pt; text-indent: 0pt; margin-top: 6pt; margin-bottom:
            6pt; margin-left: 0pt; text-indent: 0pt; } &#xD; &#xD; .x-url-1-0 {margin-left: 0pt;
            margin-right: 0pt; margin-top: 8pt; } &#xD; &#xD; .x--ufe-url-link-1-0 {margin-left:
            0pt; margin-right: 0pt; } &#xD; &#xD; .x-validation-1-0 {margin-left: 0pt; margin-right:
            0pt; } &#xD; &#xD; .x-warning-1-0 {margin-left: 0pt; margin-right: 0pt; text-indent:
            0pt; margin-top: 8pt; font-weight: bold; margin-left: 6.5em; text-indent: -6.5em; }
            &#xD; &#xD; .x-warning-2-0 {margin-left: 0pt; margin-right: 0pt; text-indent: 0pt;
            margin-top: 8pt; margin-left: 83pt; text-indent: -66pt; } &#xD; &#xD; .x-warning-3-0
            {margin-left: 0pt; margin-right: 0pt; text-indent: 0pt; margin-top: 8pt; font-weight:
            bold; margin-left: 89pt; text-indent: -65pt; } &#xD; &#xD; .x-warning-4-0 {margin-left:
            0pt; margin-right: 0pt; text-indent: 0pt; margin-top: 8pt; font-weight: bold;
            margin-left: 86pt; text-indent: -67pt; } &#xD; &#xD; .x-warning-5-0 {margin-left: 0pt;
            margin-right: 0pt; text-indent: 0pt; margin-top: 8pt; margin-left: 83pt; text-indent:
            -66pt; } &#xD; &#xD; .x-warning-6-0 {margin-left: 0pt; margin-right: 0pt; text-indent:
            0pt; } &#xD; &#xD; .x-warning-7-0 {margin-left: 0pt; margin-right: 0pt; text-indent:
            0pt; } &#xD; &#xD; .x-warning-8-0 {margin-left: 0pt; margin-right: 0pt; text-indent:
            0pt; } &#xD; &#xD; .x-warning-9-0 {margin-left: 0pt; margin-right: 0pt; text-indent:
            0pt; } &#xD; &#xD; .x-warning-10-0 {margin-left: 0pt; margin-right: 0pt; text-indent:
            0pt; } &#xD; &#xD; .x-warning-11-0 {margin-left: 0pt; margin-right: 0pt; text-indent:
            0pt; margin-top: 8pt; font-weight: bold; margin-left: 8.5em; text-indent: -6.5em; }
            &#xD; &#xD; .x-warning-12-0 {margin-left: 0pt; margin-right: 0pt; text-indent: 0pt;
            margin-top: 8pt; font-weight: bold; margin-left: 6.5em; text-indent: -6.5em; } &#xD;
            &#xD; .x-xref-1-0 {margin-left: 0pt; margin-right: 0pt; } &#xD; &#xD; .x-xref-4-0
            {margin-left: 0pt; margin-right: 0pt; } &#xD; &#xD; .x-xref-5-0 {margin-left: 0pt;
            margin-right: 0pt; } &#xD; &#xD; .x-xref-6-0 {margin-left: 0pt; margin-right: 0pt; }
            &#xD; &#xD; .x-xref-8-0 {margin-left: 0pt; margin-right: 0pt; } &#xD; &#xD; .x-zip-1-0
            {margin-left: 0pt; margin-right: 0pt; } &#xD; .x-zip-1-1 {} &#xD; &#xD;
               <xsl:call-template name="__style-for_ata-page-block.1"/>
            <xsl:value-of select="'&#xA;&#xD;&#xA;&#xD;&#xA;'"/>
            <xsl:call-template name="__style-for_changebar.1"/>
            <xsl:value-of select="'&#xA;&#xD;&#xA;&#xD;&#xA;'"/>
            <xsl:call-template name="__style-for_figure.2firere271"/>
            <xsl:value-of select="'&#xA;&#xD;&#xA;&#xD;&#xA;'"/>
            <xsl:call-template name="__style-for_frac.2eqraac81"/>
            <xsl:value-of select="'&#xA;&#xD;&#xA;&#xD;&#xA;'"/>
            <xsl:call-template name="__style-for_graphic.2grhiic261"/>
            <xsl:value-of select="'&#xA;&#xD;&#xA;&#xD;&#xA;'"/>
            <xsl:call-template name="__style-for_grphcref.1"/>
            <xsl:value-of select="'&#xA;&#xD;&#xA;&#xD;&#xA;'"/>
            <xsl:call-template name="__style-for_highlights.1"/>
            <xsl:value-of select="'&#xA;&#xD;&#xA;&#xD;&#xA;'"/>
            <xsl:call-template name="__style-for_item.31liitem3315"/>
            <xsl:value-of select="'&#xA;&#xD;&#xA;&#xD;&#xA;'"/>
            <xsl:call-template name="__style-for_item.31buisem3616"/>
            <xsl:value-of select="'&#xA;&#xD;&#xA;&#xD;&#xA;'"/>
            <xsl:call-template name="__style-for_key.2fireey101"/>
            <xsl:value-of select="'&#xA;&#xD;&#xA;&#xD;&#xA;'"/>
            <xsl:call-template name="__style-for_l1item.5pbatem441"/>
            <xsl:value-of select="'&#xA;&#xD;&#xA;&#xD;&#xA;'"/>
            <xsl:call-template name="__style-for_l1item.5pbatem212"/>
            <xsl:value-of select="'&#xA;&#xD;&#xA;&#xD;&#xA;'"/>
            <xsl:call-template name="__style-for_l1item.3li1lem351"/>
            <xsl:value-of select="'&#xA;&#xD;&#xA;&#xD;&#xA;'"/>
            <xsl:call-template name="__style-for_l1item.2li1lem121"/>
            <xsl:value-of select="'&#xA;&#xD;&#xA;&#xD;&#xA;'"/>
            <xsl:call-template name="__style-for_l2item.5pbatem441"/>
            <xsl:value-of select="'&#xA;&#xD;&#xA;&#xD;&#xA;'"/>
            <xsl:call-template name="__style-for_l2item.5pbatem212"/>
            <xsl:value-of select="'&#xA;&#xD;&#xA;&#xD;&#xA;'"/>
            <xsl:call-template name="__style-for_l2item.3li2lem351"/>
            <xsl:value-of select="'&#xA;&#xD;&#xA;&#xD;&#xA;'"/>
            <xsl:call-template name="__style-for_l2item.2li2lem121"/>
            <xsl:value-of select="'&#xA;&#xD;&#xA;&#xD;&#xA;'"/>
            <xsl:call-template name="__style-for_l3item.5pbatem441"/>
            <xsl:value-of select="'&#xA;&#xD;&#xA;&#xD;&#xA;'"/>
            <xsl:call-template name="__style-for_l3item.5pbatem212"/>
            <xsl:value-of select="'&#xA;&#xD;&#xA;&#xD;&#xA;'"/>
            <xsl:call-template name="__style-for_l3item.3li3lem351"/>
            <xsl:value-of select="'&#xA;&#xD;&#xA;&#xD;&#xA;'"/>
            <xsl:call-template name="__style-for_l3item.3li3lem122"/>
            <xsl:value-of select="'&#xA;&#xD;&#xA;&#xD;&#xA;'"/>
            <xsl:call-template name="__style-for_l4item.5pbatem441"/>
            <xsl:value-of select="'&#xA;&#xD;&#xA;&#xD;&#xA;'"/>
            <xsl:call-template name="__style-for_l4item.5pbatem212"/>
            <xsl:value-of select="'&#xA;&#xD;&#xA;&#xD;&#xA;'"/>
            <xsl:call-template name="__style-for_l4item.3li4lem351"/>
            <xsl:value-of select="'&#xA;&#xD;&#xA;&#xD;&#xA;'"/>
            <xsl:call-template name="__style-for_l4item.3li4lem122"/>
            <xsl:value-of select="'&#xA;&#xD;&#xA;&#xD;&#xA;'"/>
            <xsl:call-template name="__style-for_lot.1"/>
            <xsl:value-of select="'&#xA;&#xD;&#xA;&#xD;&#xA;'"/>
            <xsl:call-template name="__style-for_nowrap.1"/>
            <xsl:value-of select="'&#xA;&#xD;&#xA;&#xD;&#xA;'"/>
            <xsl:call-template name="__style-for_num-index.1"/>
            <xsl:value-of select="'&#xA;&#xD;&#xA;&#xD;&#xA;'"/>
            <xsl:call-template name="__style-for_page-block.7bopack661"/>
            <xsl:value-of select="'&#xA;&#xD;&#xA;&#xD;&#xA;'"/>
            <xsl:call-template name="__style-for_page-block.11bopack662"/>
            <xsl:value-of select="'&#xA;&#xD;&#xA;&#xD;&#xA;'"/>
            <xsl:call-template name="__style-for_page-block.11bopack6623"/>
            <xsl:value-of select="'&#xA;&#xD;&#xA;&#xD;&#xA;'"/>
            <xsl:call-template name="__style-for_page-block.10bopack652"/>
            <xsl:value-of select="'&#xA;&#xD;&#xA;&#xD;&#xA;'"/>
            <xsl:call-template name="__style-for_page-block.9bopack662"/>
            <xsl:value-of select="'&#xA;&#xD;&#xA;&#xD;&#xA;'"/>
            <xsl:call-template name="__style-for_page-block.7frtmck452"/>
            <xsl:value-of select="'&#xA;&#xD;&#xA;&#xD;&#xA;'"/>
            <xsl:call-template name="__style-for_page-block.10bopack925"/>
            <xsl:value-of select="'&#xA;&#xD;&#xA;&#xD;&#xA;'"/>
            <xsl:call-template name="__style-for_page-block.6pa-bck322"/>
            <xsl:value-of select="'&#xA;&#xD;&#xA;&#xD;&#xA;'"/>
            <xsl:call-template name="__style-for_page-block.6pa-bck313"/>
            <xsl:value-of select="'&#xA;&#xD;&#xA;&#xD;&#xA;'"/>
            <xsl:call-template name="__style-for_page-block.9pa-bck287"/>
            <xsl:value-of select="'&#xA;&#xD;&#xA;&#xD;&#xA;'"/>
            <xsl:call-template name="__style-for_page-block.4pa-bck333"/>
            <xsl:value-of select="'&#xA;&#xD;&#xA;&#xD;&#xA;'"/>
            <xsl:call-template name="__style-for_page-block.2pa-bck102"/>
            <xsl:value-of select="'&#xA;&#xD;&#xA;&#xD;&#xA;'"/>
            <xsl:call-template name="__style-for_para.46pablra296"/>
            <xsl:value-of select="'&#xA;&#xD;&#xA;&#xD;&#xA;'"/>
            <xsl:call-template name="__style-for_para.38n-rara5420"/>
            <xsl:value-of select="'&#xA;&#xD;&#xA;&#xD;&#xA;'"/>
            <xsl:call-template name="__style-for_para.47taprra1340"/>
            <xsl:value-of select="'&#xA;&#xD;&#xA;&#xD;&#xA;'"/>
            <xsl:call-template name="__style-for_para.39tprera1235"/>
            <xsl:value-of select="'&#xA;&#xD;&#xA;&#xD;&#xA;'"/>
            <xsl:call-template name="__style-for_postsb.1"/>
            <xsl:value-of select="'&#xA;&#xD;&#xA;&#xD;&#xA;'"/>
            <xsl:call-template name="__style-for_presb.1"/>
            <xsl:value-of select="'&#xA;&#xD;&#xA;&#xD;&#xA;'"/>
            <xsl:call-template name="__style-for_pwcem-title.1"/>
            <xsl:value-of select="'&#xA;&#xD;&#xA;&#xD;&#xA;'"/>
            <xsl:call-template name="__style-for_pwclmm-title.1"/>
            <xsl:value-of select="'&#xA;&#xD;&#xA;&#xD;&#xA;'"/>
            <xsl:call-template name="__style-for_pwcsbnbr.1"/>
            <xsl:value-of select="'&#xA;&#xD;&#xA;&#xD;&#xA;'"/>
            <xsl:call-template name="__style-for_pwcspbnbr.1"/>
            <xsl:value-of select="'&#xA;&#xD;&#xA;&#xD;&#xA;'"/>
            <xsl:call-template name="__style-for_revend.1"/>
            <xsl:value-of select="'&#xA;&#xD;&#xA;&#xD;&#xA;'"/>
            <xsl:call-template name="__style-for_revst.1"/>
            <xsl:value-of select="'&#xA;&#xD;&#xA;&#xD;&#xA;'"/>
            <xsl:call-template name="__style-for_sb.1"/>
            <xsl:value-of select="'&#xA;&#xD;&#xA;&#xD;&#xA;'"/>
            <xsl:call-template name="__style-for_sbeff.1"/>
            <xsl:value-of select="'&#xA;&#xD;&#xA;&#xD;&#xA;'"/>
            <xsl:call-template name="__style-for_sbnbr.1"/>
            <xsl:value-of select="'&#xA;&#xD;&#xA;&#xD;&#xA;'"/>
            <xsl:call-template name="__style-for_sheet.1"/>
            <xsl:value-of select="'&#xA;&#xD;&#xA;&#xD;&#xA;'"/>
            <xsl:call-template name="__style-for_spbnbr.1"/>
            <xsl:value-of select="'&#xA;&#xD;&#xA;&#xD;&#xA;'"/>
            <xsl:call-template name="__style-for_step.4predep382"/>
            <xsl:value-of select="'&#xA;&#xD;&#xA;&#xD;&#xA;'"/>
            <xsl:call-template name="__style-for_step.2predep151"/>
            <xsl:value-of select="'&#xA;&#xD;&#xA;&#xD;&#xA;'"/>
            <xsl:call-template name="__style-for_step2.3st2p2282"/>
            <xsl:value-of select="'&#xA;&#xD;&#xA;&#xD;&#xA;'"/>
            <xsl:call-template name="__style-for_step2.1"/>
            <xsl:value-of select="'&#xA;&#xD;&#xA;&#xD;&#xA;'"/>
            <xsl:call-template name="__style-for_step3.3st3p3282"/>
            <xsl:value-of select="'&#xA;&#xD;&#xA;&#xD;&#xA;'"/>
            <xsl:call-template name="__style-for_step3.1"/>
            <xsl:value-of select="'&#xA;&#xD;&#xA;&#xD;&#xA;'"/>
            <xsl:call-template name="__style-for_step4.3st4p4282"/>
            <xsl:value-of select="'&#xA;&#xD;&#xA;&#xD;&#xA;'"/>
            <xsl:call-template name="__style-for_step4.1"/>
            <xsl:value-of select="'&#xA;&#xD;&#xA;&#xD;&#xA;'"/>
            <xsl:call-template name="__style-for_step5.3st5p5282"/>
            <xsl:value-of select="'&#xA;&#xD;&#xA;&#xD;&#xA;'"/>
            <xsl:call-template name="__style-for_step5.2st5p552"/>
            <xsl:value-of select="'&#xA;&#xD;&#xA;&#xD;&#xA;'"/>
            <xsl:call-template name="__style-for_table.8shtgle171"/>
            <xsl:value-of select="'&#xA;&#xD;&#xA;&#xD;&#xA;'"/>
            <xsl:call-template name="__style-for_table.10firele124"/>
            <xsl:value-of select="'&#xA;&#xD;&#xA;&#xD;&#xA;'"/>
            <xsl:call-template name="__style-for_table.14mftrle206"/>
            <xsl:value-of select="'&#xA;&#xD;&#xA;&#xD;&#xA;'"/>
            <xsl:call-template name="__style-for_table.7taele442"/>
            <xsl:value-of select="'&#xA;&#xD;&#xA;&#xD;&#xA;'"/>
            <xsl:call-template name="__style-for_table.12taele409"/>
            <xsl:value-of select="'&#xA;&#xD;&#xA;&#xD;&#xA;'"/>
            <xsl:call-template name="__style-for_table.13taele19312"/>
            <xsl:value-of select="'&#xA;&#xD;&#xA;&#xD;&#xA;'"/>
            <xsl:call-template name="__style-for_table.11taele238"/>
            <xsl:value-of select="'&#xA;&#xD;&#xA;&#xD;&#xA;'"/>
            <xsl:call-template name="__style-for_table.6taele56"/>
            <xsl:value-of select="'&#xA;&#xD;&#xA;&#xD;&#xA;'"/>
            <xsl:call-template name="__style-for_title.64pa-ble443"/>
            <xsl:value-of select="'&#xA;&#xD;&#xA;&#xD;&#xA;'"/>
            <xsl:call-template name="__style-for_title.64pa-ble454"/>
            <xsl:value-of select="'&#xA;&#xD;&#xA;&#xD;&#xA;'"/>
            <xsl:call-template name="__style-for_title.66prtele226"/>
            <xsl:value-of select="'&#xA;&#xD;&#xA;&#xD;&#xA;'"/>
            <xsl:call-template name="__style-for_title.64prtele229"/>
            <xsl:value-of select="'&#xA;&#xD;&#xA;&#xD;&#xA;'"/>
            <xsl:call-template name="__style-for_title.64pa-ble2517"/>
            <xsl:value-of select="'&#xA;&#xD;&#xA;&#xD;&#xA;'"/>
            <xsl:call-template name="__style-for_title.64atpale2918"/>
            <xsl:value-of select="'&#xA;&#xD;&#xA;&#xD;&#xA;'"/>
            <xsl:call-template name="__style-for_title.64atpale2821"/>
            <xsl:value-of select="'&#xA;&#xD;&#xA;&#xD;&#xA;'"/>
            <xsl:call-template name="__style-for_title.64pa-ble2422"/>
            <xsl:value-of select="'&#xA;&#xD;&#xA;&#xD;&#xA;'"/>
            <xsl:call-template name="__style-for_title.64nuptle1232"/>
            <xsl:value-of select="'&#xA;&#xD;&#xA;&#xD;&#xA;'"/>
            <xsl:call-template name="__style-for_title.70tatile1046"/>
            <xsl:value-of select="'&#xA;&#xD;&#xA;&#xD;&#xA;'"/>
            <xsl:call-template name="__style-for_title-page.1"/>
            <xsl:value-of select="'&#xA;&#xD;&#xA;&#xD;&#xA;'"/>
            <xsl:call-template name="__style-for_xref.7loitef382"/>
            <xsl:value-of select="'&#xA;&#xD;&#xA;&#xD;&#xA;'"/>
            <xsl:call-template name="__style-for_xref.4loitef371"/>
            <xsl:value-of select="'&#xA;&#xD;&#xA;&#xD;&#xA;'"/>
            <xsl:call-template name="__style-for_xref.7xref276"/>
            <xsl:value-of select="'&#xA;&#xD;&#xA;&#xD;&#xA;'"/> &#xD; table {border-color: #000000;
            font-size: 100%; border-collapse: collapse; } &#xD; td, th, { border-color: #000000; }
            &#xD; table[rules][rules="none"] &gt; tr &gt; td, table[rules][rules="none"] &gt; * &gt;
            tr &gt; td, table[rules][rules="none"] &gt; tr &gt; th, table[rules][rules="none"] &gt;
            * &gt; tr &gt; th, table[rules][rules="none"] &gt; td, table[rules][rules="none"] &gt;
            th { border-width: thin; border-style: none; } &#xD;
            table[frame="box"][border]:not([border="0"]),
            table[frame="border"][border]:not([border="0"]),
            table:not([frame])[border]:not([border="0"]) { border-style: solid; } &#xD; table
            table[class~="x-address-1-0"] {width: 100%; } &#xD; table table[class~="x-address-2-0"]
            {width: 100%; } &#xD; table table[class~="x-address-3-0"] {width: 100%; } &#xD; table
            table[class~="x-address-4-0"] {width: 100%; } &#xD; table table[class~="x-address-5-0"]
            {width: 100%; } &#xD; table table[class~="x-address-6-0"] {width: 100%; } &#xD; table
            table[class~="x-address-7-0"] {width: 100%; } &#xD; table table[class~="x-address-8-0"]
            {width: 100%; } &#xD; table table[class~="x-item-1-0"] {width: 100%; } &#xD; table
            table[class~="x-item-2-0"] {width: 100%; } &#xD; table table[class~="x-item-3-0"]
            {width: 100%; } &#xD; table table[class~="x-item-4-0"] {width: 100%; } &#xD; table
            table[class~="x-item-5-0"] {width: 100%; } &#xD; table table[class~="x-item-6-0"]
            {width: 100%; } &#xD; table table[class~="x-item-7-0"] {width: 100%; } &#xD; table
            table[class~="x-item-8-0"] {width: 100%; } &#xD; table table[class~="x-item-9-0"]
            {width: 100%; } &#xD; table table[class~="x-item-10-0"] {width: 100%; } &#xD; table
            table[class~="x-item-11-0"] {width: 100%; } &#xD; table table[class~="x-item-12-0"]
            {width: 100%; } &#xD; table table[class~="x-item-13-0"] {width: 100%; } &#xD; table
            table[class~="x-item-14-0"] {width: 100%; } &#xD; table table[class~="x-item-15-0"]
            {width: 100%; } &#xD; table table[class~="x-item-16-0"] {width: 100%; } &#xD; table
            table[class~="x-item-17-0"] {width: 100%; } &#xD; table table[class~="x-item-18-0"]
            {width: 100%; } &#xD; table table[class~="x-item-19-0"] {width: 100%; } &#xD; table
            table[class~="x-item-20-0"] {width: 100%; } &#xD; table table[class~="x-item-21-0"]
            {width: 100%; } &#xD; table table[class~="x-item-22-0"] {width: 100%; } &#xD; table
            table[class~="x-item-23-0"] {width: 100%; } &#xD; table table[class~="x-item-24-0"]
            {width: 100%; } &#xD; table table[class~="x-item-25-0"] {width: 100%; } &#xD; table
            table[class~="x-item-26-0"] {width: 100%; } &#xD; table table[class~="x-item-27-0"]
            {width: 100%; } &#xD; table table[class~="x-item-28-0"] {width: 100%; } &#xD; table
            table[class~="x-item-29-0"] {width: 100%; } &#xD; table table[class~="x-item-30-0"]
            {width: 100%; } &#xD; table table[class~="x-item-31-0"] {width: 100%; } &#xD; table
            table[class~="x-l1item-1-0"] {width: 100%; } &#xD; table table[class~="x-l1item-2-0"]
            {width: 100%; } &#xD; table table[class~="x-l1item-3-0"] {width: 100%; } &#xD; table
            table[class~="x-l1item-4-0"] {width: 100%; } &#xD; table table[class~="x-l1item-5-0"]
            {width: 100%; } &#xD; table table[class~="x-l2item-1-0"] {width: 100%; } &#xD; table
            table[class~="x-l2item-2-0"] {width: 100%; } &#xD; table table[class~="x-l2item-3-0"]
            {width: 100%; } &#xD; table table[class~="x-l2item-4-0"] {width: 100%; } &#xD; table
            table[class~="x-l2item-5-0"] {width: 100%; } &#xD; table table[class~="x-l3item-1-0"]
            {width: 100%; } &#xD; table table[class~="x-l3item-2-0"] {width: 100%; } &#xD; table
            table[class~="x-l3item-3-0"] {width: 100%; } &#xD; table table[class~="x-l3item-4-0"]
            {width: 100%; } &#xD; table table[class~="x-l3item-5-0"] {width: 100%; } &#xD; table
            table[class~="x-l4item-1-0"] {width: 100%; } &#xD; table table[class~="x-l4item-2-0"]
            {width: 100%; } &#xD; table table[class~="x-l4item-3-0"] {width: 100%; } &#xD; table
            table[class~="x-l4item-4-0"] {width: 100%; } &#xD; table table[class~="x-l4item-5-0"]
            {width: 100%; } &#xD; table table[class~="x-numlitem-1-0"] {width: 100%; } &#xD; table
            table[class~="x-numlitem-2-0"] {width: 100%; } &#xD; table
            table[class~="x-part-group-1-0"] {width: 100%; } &#xD; table
            table[class~="x-part-group-2-0"] {width: 100%; } &#xD; table
            table[class~="x-part-group-3-0"] {width: 100%; } &#xD; table
            table[class~="x-part-group-4-0"] {width: 100%; } &#xD; table
            table[class~="x-prcitem1-1-0"] {width: 100%; } &#xD; table
            table[class~="x-prcitem1-2-0"] {width: 100%; } &#xD; table
            table[class~="x-prcitem2-1-0"] {width: 100%; } &#xD; table
            table[class~="x-prcitem2-2-0"] {width: 100%; } &#xD; table
            table[class~="x-prcitem3-1-0"] {width: 100%; } &#xD; table
            table[class~="x-prcitem3-2-0"] {width: 100%; } &#xD; table
            table[class~="x-prcitem4-1-0"] {width: 100%; } &#xD; table
            table[class~="x-prcitem4-2-0"] {width: 100%; } &#xD; table
            table[class~="x-prcitem4-3-0"] {width: 100%; } &#xD; table table[class~="x-step-1-0"]
            {width: 100%; } &#xD; table table[class~="x-step-2-0"] {width: 100%; } &#xD; table
            table[class~="x-step-3-0"] {width: 100%; } &#xD; table table[class~="x-step-4-0"]
            {width: 100%; } &#xD; table table[class~="x-step2-1-0"] {width: 100%; } &#xD; table
            table[class~="x-step2-2-0"] {width: 100%; } &#xD; table table[class~="x-step2-3-0"]
            {width: 100%; } &#xD; table table[class~="x-step3-1-0"] {width: 100%; } &#xD; table
            table[class~="x-step3-2-0"] {width: 100%; } &#xD; table table[class~="x-step3-3-0"]
            {width: 100%; } &#xD; table table[class~="x-step4-1-0"] {width: 100%; } &#xD; table
            table[class~="x-step4-2-0"] {width: 100%; } &#xD; table table[class~="x-step4-3-0"]
            {width: 100%; } &#xD; table table[class~="x-step5-1-0"] {width: 100%; } &#xD; table
            table[class~="x-step5-2-0"] {width: 100%; } &#xD; table table[class~="x-step5-3-0"]
            {width: 100%; } &#xD; table table[class~="x-unlitem-1-0"] {width: 100%; } &#xD; table
            table[class~="x-unlitem-2-0"] {width: 100%; } &#xD; table table[class~="x-unlitem-3-0"]
            {width: 100%; } &#xD; table table[class~="x-unlitem-4-0"] {width: 100%; } &#xD; table
            table[class~="x-unlitem-5-0"] {width: 100%; } &#xD; table table[class~="x-unlitem-6-0"]
            {width: 100%; } &#xD; table table[class~="x-unlitem-7-0"] {width: 100%; } &#xD; table
            table[class~="x-unlitem-8-0"] {width: 100%; } &#xD; table table[class~="x-unlitem-9-0"]
            {width: 100%; } &#xD; table table[class~="x-unlitem-10-0"] {width: 100%; } &#xD; table
            table[class~="x-unlitem-11-0"] {width: 100%; } &#xD; table
            table[class~="x-unlitem-12-0"] {width: 100%; } &#xD; table
            table[class~="x-unlitem-13-0"] {width: 100%; } &#xD; .entry-in-tbody {margin-left: 0pt;
            margin-right: 0pt; } &#xD; &#xD; .x-Table-of-Contents-toc-entry-indent-1
            {text-decoration: none; margin-left: 0em} &#xD; .x-Table-of-Contents-toc-entry-indent-2
            {text-decoration: none; margin-left: 0em} &#xD; .x-Table-of-Contents-toc-entry-indent-3
            {text-decoration: none; margin-left: 0em} &#xD; .x-Table-of-Contents-toc-entry-indent-4
            {text-decoration: none; margin-left: 0em} &#xD; .x-Table-of-Contents-toc-entry-indent-5
            {text-decoration: none; margin-left: 8em} &#xD; .x-Table-of-Contents-toc-entry-indent-6
            {text-decoration: none; margin-left: 10em} &#xD; .x-Table-of-Contents-toc-entry-indent-7
            {text-decoration: none; margin-left: 12em} &#xD; .x-Table-of-Contents-toc-entry-indent-8
            {text-decoration: none; margin-left: 14em} &#xD; .x-Table-of-Contents-toc-entry-indent-9
            {text-decoration: none; margin-left: 16em} &#xD;
            .x-Table-of-Contents-toc-entry-indent-10 {text-decoration: none; margin-left: 18em}
            &#xD; .x--zero-left-margins {margin-left: 0pt; text-indent: 0pt; } &#xD;
            .x--zero-text-indent {text-indent: 0pt; } &#xD; .x--zero-top-bot-margins {margin-top:
            0pt; margin-bottom: 0pt; }</xsl:result-document>
      </xsl:if>
   </xsl:template>

<xsl:template match="*[starts-with(local-name(.),'_')]" priority="-0.9">
      <xsl:element name="{name(.)}">
         <xsl:copy-of select="@*"/>
         <xsl:apply-templates/>
      </xsl:element>
   </xsl:template>

<xsl:template xmlns:atievent="http://www.arbortext.com/namespace/AtiSaxEvents" match="atievent:*">
      <xsl:element name="{name(.)}">
         <xsl:copy-of select="@*"/>
         <xsl:apply-templates/>
      </xsl:element>
   </xsl:template>

<xsl:template match="*" priority="-1">
      <xsl:call-template name="emit-unstyled-template-content"/>
   </xsl:template>

<xsl:param name="table.border.thickness" select="'1pt'"/>

<xsl:param name="table.cell.padding.amount" select="'5pt'"/>

<xsl:param name="thead.tfoot.style">font-weight: bold; </xsl:param>

<xsl:template name="tgroup.first">
      <!--Emit class values to reflect conditions-->
      <xsl:attribute name="class">
         <xsl:text> x-tgroup-1-0</xsl:text>
      </xsl:attribute>
   </xsl:template>

<xsl:template name="tgroup.notfirst">
      <!--Emit class values to reflect conditions-->
      <xsl:attribute name="class">
         <xsl:text> x-tgroup-1-0</xsl:text>
      </xsl:attribute>
   </xsl:template>

<xsl:template name="row">
      <!--Emit class values to reflect conditions-->
      <xsl:attribute name="class">
         <xsl:text> x-row-1-0</xsl:text>
         <xsl:if test="(@role and string(@role)='changebar') or (entry[1]/marker)"> x-row-1-1</xsl:if>
      </xsl:attribute>
   </xsl:template>

<xsl:template name="entry">
      <xsl:param name="context" select="'tbody'"/>
      <xsl:attribute name="class">entry-in-tbody</xsl:attribute>
   </xsl:template>

<xsl:template name="thead">
      <!--Emit class values to reflect conditions-->
      <xsl:attribute name="class">
         <xsl:text> x-thead-1-0</xsl:text>
      </xsl:attribute>
   </xsl:template>

<xsl:template name="tfoot">
      <!--Emit class values to reflect conditions-->
      <xsl:attribute name="class">
         <xsl:text> x-tfoot-1-0</xsl:text>
      </xsl:attribute>
   </xsl:template>

<xsl:template name="tbody">
      <!--Emit class values to reflect conditions-->
      <xsl:attribute name="class">
         <xsl:text> x-tbody-1-0</xsl:text>
      </xsl:attribute>
   </xsl:template>

<xsl:template name="htmltbl-tr">
      <!--Emit class values to reflect conditions-->
      <xsl:attribute name="class">
         <xsl:text> x-tr-1-0</xsl:text>
      </xsl:attribute>
   </xsl:template>

<xsl:template name="htmltbl-td"/>

<xsl:template name="htmltbl-th"/>

<xsl:template name="htmltbl-caption"/>

</xsl:stylesheet>
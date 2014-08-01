<?xml version="1.0" encoding="UTF-8"?><xsl:stylesheet xmlns:simg="java:net.sf.docbook.saxon.ImageIntrinsics" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:ximg="xaln://com.nwalsh.xalan.ImageIntrinsics" xmlns="http://www.w3.org/1999/xhtml" xmlns:exslt="http://exslt.org/common" xmlns:_acl="java:com.arbortext.epic.Acl" xmlns:msxsl="urn:schemas-microsoft-com:xslt" xmlns:_="http://www.pwc.ca/namespace/doctypes/emipc" xmlns:_dtd="http://www.arbortext.com/namespace/Styler/UserElements" xmlns:atidlm="http://www.arbortext.com/namespace/atidlm" xmlns:_2="http://www.pwc.ca/namespace/doctypes/jmtosmigrate" xmlns:ch="http://www.arbortext.com/namespace/chunker" xmlns:saxon="http://saxon.sf.net/" xmlns:_5="http://www.pwc.ca/namespace/doctypes/ipc" xmlns:_gte="http://www.arbortext.com/namespace/Styler/GeneratedTextElements" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:_sfe="http://www.arbortext.com/namespace/Styler/StylerFormattingElements" xmlns:_js="java:com.arbortext.epic.internal.js.JavaScript" xmlns:_3="http://www.pwc.ca/namespace/doctypes/migrate" xmlns:_ufe="http://www.arbortext.com/namespace/Styler/UserFormattingElements" version="1.0" exclude-result-prefixes="_ atidlm xml _2 ch saxon _5 xsi _js _3 #default exslt msxsl _dtd _ufe _sfe _gte simg ximg _acl">


<xsl:template match="numlist/address" mode="styler_numbering" priority="7">
  <xsl:number count="numlist/address" format="1"/>
  <xsl:text>.</xsl:text>
</xsl:template>

<xsl:template match="pgblk/_ufe:chapsect-title" mode="styler_numbering" priority="2">
  <!--
  <xsl:variable name="node-id" select="generate-id(ancestor::pgblk[1])"/>
  <xsl:variable name="num">
     <xsl:for-each select="//*[not(ancestor-or-self::pgblk)]/pgblk[_ufe:chapsect-title]|/pgblk[_ufe:chapsect-title]">
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
  -->
  <xsl:number count="pgblk[not(ancestor::pgblk) and _ufe:chapsect-title]" level="any" format="1"/>
</xsl:template>

<xsl:template match="pbfmatr/_ufe:chapsect-title" mode="styler_numbering" priority="1">
  <!--
  <xsl:variable name="node-id" select="generate-id(.)"/>
  <xsl:variable name="num">
     <xsl:for-each select="//*[@_gte:count-as-id='cnt__pbfmatr^-None-.cnt']">
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
  -->
  <xsl:number count="pbfmatr/*[@_gte:count-as-id='cnt__pbfmatr^-None-.cnt']" level="any" format="1"/>
</xsl:template>

<xsl:template match="_ufe:chapsect-title" mode="styler_numbering" priority="0">
  <!--This context has no numbering-->
  <xsl:param name="do-qmark" select="'yes'"/>
  <xsl:if test="$do-qmark='yes'">
     <xsl:value-of select="'?'"/>
  </xsl:if>
</xsl:template>

<xsl:template match="pgblk/_ufe:cir-title" mode="styler_numbering" priority="2">
      <xsl:variable name="node-id" select="generate-id(ancestor::pgblk[1])"/>
      <xsl:variable name="num">
         <xsl:for-each select="//*[not(ancestor-or-self::pgblk)]/pgblk[_ufe:cir-title]|/pgblk[_ufe:cir-title]">
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

<xsl:template match="pbfmatr/_ufe:cir-title" mode="styler_numbering" priority="1">
      <xsl:variable name="node-id" select="generate-id(.)"/>
      <xsl:variable name="num">
         <xsl:for-each select="//*[@_gte:count-as-id='cnt__pbfmatr^-None-.cnt']">
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

<xsl:template match="_ufe:cir-title" mode="styler_numbering" priority="0">
      <!--This context has no numbering-->
      <xsl:param name="do-qmark" select="'yes'"/>
      <xsl:if test="$do-qmark='yes'">
         <xsl:value-of select="'?'"/>
      </xsl:if>
   </xsl:template>

<xsl:template match="pgblk/_ufe:consumables-title" mode="styler_numbering" priority="5">
      <xsl:variable name="node-id" select="generate-id(ancestor::pgblk[1])"/>
      <xsl:variable name="num">
         <xsl:for-each select="//*[not(ancestor-or-self::pgblk)]/pgblk[_ufe:consumables-title]|/pgblk[_ufe:consumables-title]">
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

<xsl:template match="pbfmatr/_ufe:consumables-title" mode="styler_numbering" priority="4">
      <xsl:variable name="node-id" select="generate-id(.)"/>
      <xsl:variable name="num">
         <xsl:for-each select="//*[@_gte:count-as-id='cnt__pbfmatr^-None-.cnt']">
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

<xsl:template match="pwcspblist/_ufe:consumables-title" mode="styler_numbering" priority="3">
      <xsl:variable name="node-id" select="generate-id(ancestor::pwcspblist[1])"/>
      <xsl:variable name="num">
         <xsl:for-each select="//*[not(ancestor-or-self::pwcspblist)]/pwcspblist[_ufe:consumables-title]|/pwcspblist[_ufe:consumables-title]">
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

<xsl:template match="ata-page-block//consumables//_ufe:consumables-title" mode="styler_numbering" priority="2">
      <xsl:variable name="node-id" select="generate-id(.)"/>
      <xsl:variable name="from-node" select="(ancestor-or-self::ata-page-block[not(ancestor::ata-page-block)])[last()]"/>
      <xsl:variable name="num">
         <xsl:variable name="candidate-num">
            <xsl:choose>
               <xsl:when test="count($from-node) &gt; 0">
                  <xsl:for-each select="$from-node/descendant-or-self::*[@_gte:count-as-id='npara-ata']">
                     <xsl:if test="generate-id(.) = $node-id">
                        <xsl:value-of select="position()"/>
                     </xsl:if>
                  </xsl:for-each>
               </xsl:when>
               <xsl:otherwise>
                  <xsl:for-each select="//*[@_gte:count-as-id='npara-ata'][not(ancestor-or-self::ata-page-block)]">
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
      <xsl:text>.</xsl:text>
   </xsl:template>

<xsl:template match="page-block//consumables//_ufe:consumables-title" mode="styler_numbering" priority="1">
      <xsl:variable name="node-id" select="generate-id(.)"/>
      <xsl:variable name="from-node" select="(ancestor-or-self::page-block[not(ancestor::page-block)])[last()]"/>
      <xsl:variable name="num">
         <xsl:variable name="candidate-num">
            <xsl:choose>
               <xsl:when test="count($from-node) &gt; 0">
                  <xsl:for-each select="$from-node/descendant-or-self::*[@_gte:count-as-id='npara']">
                     <xsl:if test="generate-id(.) = $node-id">
                        <xsl:value-of select="position()"/>
                     </xsl:if>
                  </xsl:for-each>
               </xsl:when>
               <xsl:otherwise>
                  <xsl:for-each select="//*[@_gte:count-as-id='npara'][not(ancestor-or-self::page-block)]">
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
      <xsl:text>.</xsl:text>
   </xsl:template>

<xsl:template match="_ufe:consumables-title" mode="styler_numbering" priority="0">
      <!--This context has no numbering-->
      <xsl:param name="do-qmark" select="'yes'"/>
      <xsl:if test="$do-qmark='yes'">
         <xsl:value-of select="'?'"/>
      </xsl:if>
   </xsl:template>

<xsl:template match="pgblk/_ufe:eipc-title" mode="styler_numbering" priority="2">
      <xsl:variable name="node-id" select="generate-id(ancestor::pgblk[1])"/>
      <xsl:variable name="num">
         <xsl:for-each select="//*[not(ancestor-or-self::pgblk)]/pgblk[_ufe:eipc-title]|/pgblk[_ufe:eipc-title]">
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

<xsl:template match="pbfmatr/_ufe:eipc-title" mode="styler_numbering" priority="1">
      <xsl:variable name="node-id" select="generate-id(.)"/>
      <xsl:variable name="num">
         <xsl:for-each select="//*[@_gte:count-as-id='cnt__pbfmatr^-None-.cnt']">
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

<xsl:template match="_ufe:eipc-title" mode="styler_numbering" priority="0">
      <!--This context has no numbering-->
      <xsl:param name="do-qmark" select="'yes'"/>
      <xsl:if test="$do-qmark='yes'">
         <xsl:value-of select="'?'"/>
      </xsl:if>
   </xsl:template>

<xsl:template match="pgblk/_ufe:em-title" mode="styler_numbering" priority="2">
      <xsl:variable name="node-id" select="generate-id(ancestor::pgblk[1])"/>
      <xsl:variable name="num">
         <xsl:for-each select="//*[not(ancestor-or-self::pgblk)]/pgblk[_ufe:em-title]|/pgblk[_ufe:em-title]">
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

<xsl:template match="pbfmatr/_ufe:em-title" mode="styler_numbering" priority="1">
      <xsl:variable name="node-id" select="generate-id(.)"/>
      <xsl:variable name="num">
         <xsl:for-each select="//*[@_gte:count-as-id='cnt__pbfmatr^-None-.cnt']">
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

<xsl:template match="_ufe:em-title" mode="styler_numbering" priority="0">
      <!--This context has no numbering-->
      <xsl:param name="do-qmark" select="'yes'"/>
      <xsl:if test="$do-qmark='yes'">
         <xsl:value-of select="'?'"/>
      </xsl:if>
   </xsl:template>

<xsl:template match="pgblk/_ufe:fixequ-title" mode="styler_numbering" priority="5">
      <xsl:variable name="node-id" select="generate-id(ancestor::pgblk[1])"/>
      <xsl:variable name="num">
         <xsl:for-each select="//*[not(ancestor-or-self::pgblk)]/pgblk[_ufe:fixequ-title]|/pgblk[_ufe:fixequ-title]">
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

<xsl:template match="pbfmatr/_ufe:fixequ-title" mode="styler_numbering" priority="4">
      <xsl:variable name="node-id" select="generate-id(.)"/>
      <xsl:variable name="num">
         <xsl:for-each select="//*[@_gte:count-as-id='cnt__pbfmatr^-None-.cnt']">
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

<xsl:template match="pwcspblist/_ufe:fixequ-title" mode="styler_numbering" priority="3">
      <xsl:variable name="node-id" select="generate-id(ancestor::pwcspblist[1])"/>
      <xsl:variable name="num">
         <xsl:for-each select="//*[not(ancestor-or-self::pwcspblist)]/pwcspblist[_ufe:fixequ-title]|/pwcspblist[_ufe:fixequ-title]">
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

<xsl:template match="page-block//fixtures-and-equipment//_ufe:fixequ-title" mode="styler_numbering" priority="2">
      <xsl:variable name="node-id" select="generate-id(.)"/>
      <xsl:variable name="from-node" select="(ancestor-or-self::page-block[not(ancestor::page-block)])[last()]"/>
      <xsl:variable name="num">
         <xsl:variable name="candidate-num">
            <xsl:choose>
               <xsl:when test="count($from-node) &gt; 0">
                  <xsl:for-each select="$from-node/descendant-or-self::*[@_gte:count-as-id='npara']">
                     <xsl:if test="generate-id(.) = $node-id">
                        <xsl:value-of select="position()"/>
                     </xsl:if>
                  </xsl:for-each>
               </xsl:when>
               <xsl:otherwise>
                  <xsl:for-each select="//*[@_gte:count-as-id='npara'][not(ancestor-or-self::page-block)]">
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
      <xsl:text>.</xsl:text>
   </xsl:template>

<xsl:template match="ata-page-block//fixtures-and-equipment//_ufe:fixequ-title" mode="styler_numbering" priority="1">
      <xsl:variable name="node-id" select="generate-id(.)"/>
      <xsl:variable name="from-node" select="(ancestor-or-self::ata-page-block[not(ancestor::ata-page-block)])[last()]"/>
      <xsl:variable name="num">
         <xsl:variable name="candidate-num">
            <xsl:choose>
               <xsl:when test="count($from-node) &gt; 0">
                  <xsl:for-each select="$from-node/descendant-or-self::*[@_gte:count-as-id='npara-ata']">
                     <xsl:if test="generate-id(.) = $node-id">
                        <xsl:value-of select="position()"/>
                     </xsl:if>
                  </xsl:for-each>
               </xsl:when>
               <xsl:otherwise>
                  <xsl:for-each select="//*[@_gte:count-as-id='npara-ata'][not(ancestor-or-self::ata-page-block)]">
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
      <xsl:text>.</xsl:text>
   </xsl:template>

<xsl:template match="_ufe:fixequ-title" mode="styler_numbering" priority="0">
      <!--This context has no numbering-->
      <xsl:param name="do-qmark" select="'yes'"/>
      <xsl:if test="$do-qmark='yes'">
         <xsl:value-of select="'?'"/>
      </xsl:if>
   </xsl:template>

<xsl:template match="pgblk/_ufe:general-title" mode="styler_numbering" priority="5">
      <xsl:variable name="node-id" select="generate-id(ancestor::pgblk[1])"/>
      <xsl:variable name="num">
         <xsl:for-each select="//*[not(ancestor-or-self::pgblk)]/pgblk[_ufe:general-title]|/pgblk[_ufe:general-title]">
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

<xsl:template match="pbfmatr/_ufe:general-title" mode="styler_numbering" priority="4">
      <xsl:variable name="node-id" select="generate-id(.)"/>
      <xsl:variable name="num">
         <xsl:for-each select="//*[@_gte:count-as-id='cnt__pbfmatr^-None-.cnt']">
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

<xsl:template match="pwcspblist/_ufe:general-title" mode="styler_numbering" priority="3">
      <xsl:variable name="node-id" select="generate-id(ancestor::pwcspblist[1])"/>
      <xsl:variable name="num">
         <xsl:for-each select="//*[not(ancestor-or-self::pwcspblist)]/pwcspblist[_ufe:general-title]|/pwcspblist[_ufe:general-title]">
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

<xsl:template match="page-block//general//_ufe:general-title" mode="styler_numbering" priority="2">
      <xsl:variable name="node-id" select="generate-id(.)"/>
      <xsl:variable name="from-node" select="(ancestor-or-self::page-block[not(ancestor::page-block)])[last()]"/>
      <xsl:variable name="num">
         <xsl:variable name="candidate-num">
            <xsl:choose>
               <xsl:when test="count($from-node) &gt; 0">
                  <xsl:for-each select="$from-node/descendant-or-self::*[@_gte:count-as-id='npara']">
                     <xsl:if test="generate-id(.) = $node-id">
                        <xsl:value-of select="position()"/>
                     </xsl:if>
                  </xsl:for-each>
               </xsl:when>
               <xsl:otherwise>
                  <xsl:for-each select="//*[@_gte:count-as-id='npara'][not(ancestor-or-self::page-block)]">
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
      <xsl:text>.</xsl:text>
   </xsl:template>

<xsl:template match="ata-page-block//general//_ufe:general-title" mode="styler_numbering" priority="1">
      <xsl:variable name="node-id" select="generate-id(.)"/>
      <xsl:variable name="from-node" select="(ancestor-or-self::ata-page-block[not(ancestor::ata-page-block)])[last()]"/>
      <xsl:variable name="num">
         <xsl:variable name="candidate-num">
            <xsl:choose>
               <xsl:when test="count($from-node) &gt; 0">
                  <xsl:for-each select="$from-node/descendant-or-self::*[@_gte:count-as-id='npara-ata']">
                     <xsl:if test="generate-id(.) = $node-id">
                        <xsl:value-of select="position()"/>
                     </xsl:if>
                  </xsl:for-each>
               </xsl:when>
               <xsl:otherwise>
                  <xsl:for-each select="//*[@_gte:count-as-id='npara-ata'][not(ancestor-or-self::ata-page-block)]">
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
      <xsl:text>.</xsl:text>
   </xsl:template>

<xsl:template match="_ufe:general-title" mode="styler_numbering" priority="0">
      <!--This context has no numbering-->
      <xsl:param name="do-qmark" select="'yes'"/>
      <xsl:if test="$do-qmark='yes'">
         <xsl:value-of select="'?'"/>
      </xsl:if>
   </xsl:template>

<xsl:template match="pgblk/_ufe:glossary-title" mode="styler_numbering" priority="3">
      <xsl:variable name="node-id" select="generate-id(ancestor::pgblk[1])"/>
      <xsl:variable name="num">
         <xsl:for-each select="//*[not(ancestor-or-self::pgblk)]/pgblk[_ufe:glossary-title]|/pgblk[_ufe:glossary-title]">
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

<xsl:template match="pbfmatr/_ufe:glossary-title" mode="styler_numbering" priority="2">
      <xsl:variable name="node-id" select="generate-id(.)"/>
      <xsl:variable name="num">
         <xsl:for-each select="//*[@_gte:count-as-id='cnt__pbfmatr^-None-.cnt']">
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

<xsl:template match="pwcspblist/_ufe:glossary-title" mode="styler_numbering" priority="1">
      <xsl:variable name="node-id" select="generate-id(ancestor::pwcspblist[1])"/>
      <xsl:variable name="num">
         <xsl:for-each select="//*[not(ancestor-or-self::pwcspblist)]/pwcspblist[_ufe:glossary-title]|/pwcspblist[_ufe:glossary-title]">
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

<xsl:template match="_ufe:glossary-title" mode="styler_numbering" priority="0">
      <!--This context has no numbering-->
      <xsl:param name="do-qmark" select="'yes'"/>
      <xsl:if test="$do-qmark='yes'">
         <xsl:value-of select="'?'"/>
      </xsl:if>
   </xsl:template>

<xsl:template match="pgblk/_ufe:howtouse-title" mode="styler_numbering" priority="2">
      <xsl:variable name="node-id" select="generate-id(ancestor::pgblk[1])"/>
      <xsl:variable name="num">
         <xsl:for-each select="//*[not(ancestor-or-self::pgblk)]/pgblk[_ufe:howtouse-title]|/pgblk[_ufe:howtouse-title]">
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

<xsl:template match="pbfmatr/_ufe:howtouse-title" mode="styler_numbering" priority="1">
      <xsl:variable name="node-id" select="generate-id(.)"/>
      <xsl:variable name="num">
         <xsl:for-each select="//*[@_gte:count-as-id='cnt__pbfmatr^-None-.cnt']">
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

<xsl:template match="_ufe:howtouse-title" mode="styler_numbering" priority="0">
      <!--This context has no numbering-->
      <xsl:param name="do-qmark" select="'yes'"/>
      <xsl:if test="$do-qmark='yes'">
         <xsl:value-of select="'?'"/>
      </xsl:if>
   </xsl:template>

<xsl:template match="pgblk/_ufe:intro-title" mode="styler_numbering" priority="2">
      <xsl:variable name="node-id" select="generate-id(ancestor::pgblk[1])"/>
      <xsl:variable name="num">
         <xsl:for-each select="//*[not(ancestor-or-self::pgblk)]/pgblk[_ufe:intro-title]|/pgblk[_ufe:intro-title]">
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

<xsl:template match="pbfmatr/_ufe:intro-title" mode="styler_numbering" priority="1">
      <xsl:variable name="node-id" select="generate-id(.)"/>
      <xsl:variable name="num">
         <xsl:for-each select="//*[@_gte:count-as-id='cnt__pbfmatr^-None-.cnt']">
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

<xsl:template match="_ufe:intro-title" mode="styler_numbering" priority="0">
      <!--This context has no numbering-->
      <xsl:param name="do-qmark" select="'yes'"/>
      <xsl:if test="$do-qmark='yes'">
         <xsl:value-of select="'?'"/>
      </xsl:if>
   </xsl:template>

<xsl:template match="step/step/enumlist/item" mode="styler_numbering" priority="30">
      <xsl:number count="step/step/enumlist/item" format="1"/>
   </xsl:template>

<xsl:template match="prclist4//prclist4//prclist4//prclist4/item" mode="styler_numbering" priority="29">
      <xsl:number count="prclist4//prclist4//prclist4//prclist4/item" format="1"/>
      <xsl:text>)</xsl:text>
   </xsl:template>

<xsl:template match="list4//list4//list4//list4/item" mode="styler_numbering" priority="28">
      <xsl:number count="list4//list4//list4//list4/item" format="1"/>
      <xsl:text>)</xsl:text>
   </xsl:template>

<xsl:template match="enumlist//enumlist//enumlist//enumlist/item" mode="styler_numbering" priority="27">
      <xsl:number count="enumlist//enumlist//enumlist//enumlist/item" format="1"/>
      <xsl:text>)</xsl:text>
   </xsl:template>

<xsl:template match="prclist4//prclist4//prclist4/item" mode="styler_numbering" priority="26">
      <xsl:number count="prclist4//prclist4//prclist4/item" format="i"/>
      <xsl:text>.</xsl:text>
   </xsl:template>

<xsl:template match="list4//list4//list4/item" mode="styler_numbering" priority="25">
      <xsl:number count="list4//list4//list4/item" format="i"/>
      <xsl:text>.</xsl:text>
   </xsl:template>

<xsl:template match="enumlist//enumlist//enumlist/item" mode="styler_numbering" priority="23">
      <xsl:number count="enumlist//enumlist//enumlist/item" format="i"/>
      <xsl:text>.</xsl:text>
   </xsl:template>

<xsl:template match="prclist4//prclist4/item" mode="styler_numbering" priority="21">
      <xsl:number count="prclist4//prclist4/item" format="a"/>
      <xsl:text>.</xsl:text>
   </xsl:template>

<xsl:template match="list4//list4/item" mode="styler_numbering" priority="20">
      <xsl:number count="list4//list4/item" format="a"/>
      <xsl:text>.</xsl:text>
   </xsl:template>

<xsl:template match="enumlist//enumlist/item" mode="styler_numbering" priority="18">
      <xsl:number count="enumlist//enumlist/item" format="a"/>
      <xsl:text>.</xsl:text>
   </xsl:template>

<xsl:template match="numlist/item" mode="styler_numbering" priority="13">
      <xsl:number count="numlist/item" format="1"/>
      <xsl:text>.</xsl:text>
   </xsl:template>

<xsl:template match="prclist4/item" mode="styler_numbering" priority="11">
      <xsl:number count="prclist4/item" format="1"/>
      <xsl:text>.</xsl:text>
   </xsl:template>

<xsl:template match="prclist3/item" mode="styler_numbering" priority="10">
      <xsl:number count="prclist3/item" format="1"/>
      <xsl:text>.</xsl:text>
   </xsl:template>

<xsl:template match="prclist2/item" mode="styler_numbering" priority="9">
      <xsl:number count="prclist2/item" format="1"/>
      <xsl:text>.</xsl:text>
   </xsl:template>

<xsl:template match="prclist1/item" mode="styler_numbering" priority="8">
      <xsl:number count="prclist1/item" format="1"/>
      <xsl:text>.</xsl:text>
   </xsl:template>

<xsl:template match="list4/item" mode="styler_numbering" priority="7">
      <xsl:number count="list4/item" format="1"/>
      <xsl:text>.</xsl:text>
   </xsl:template>

<xsl:template match="list3/item" mode="styler_numbering" priority="6">
      <xsl:number count="list3/item" format="1"/>
      <xsl:text>.</xsl:text>
   </xsl:template>

<xsl:template match="list2/item" mode="styler_numbering" priority="5">
      <xsl:number count="list2/item" format="1"/>
      <xsl:text>.</xsl:text>
   </xsl:template>

<xsl:template match="list1/item" mode="styler_numbering" priority="4">
      <xsl:number count="list1/item" format="1"/>
      <xsl:text>.</xsl:text>
   </xsl:template>

<xsl:template match="enumlist/item" mode="styler_numbering" priority="2">
      <xsl:number count="enumlist/item" format="1"/>
      <xsl:text>.</xsl:text>
   </xsl:template>

<xsl:template match="pbfmatr/manual-title" mode="styler_numbering" priority="3">
      <xsl:variable name="node-id" select="generate-id(.)"/>
      <xsl:variable name="num">
         <xsl:for-each select="//*[@_gte:count-as-id='cnt__pbfmatr^-None-.cnt']">
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

<xsl:template match="pwcspblist/manual-title" mode="styler_numbering" priority="2">
      <xsl:variable name="node-id" select="generate-id(ancestor::pwcspblist[1])"/>
      <xsl:variable name="num">
         <xsl:for-each select="//*[not(ancestor-or-self::pwcspblist)]/pwcspblist[manual-title]|/pwcspblist[manual-title]">
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

<xsl:template match="pgblk/manual-title" mode="styler_numbering" priority="1">
      <xsl:variable name="node-id" select="generate-id(ancestor::pgblk[1])"/>
      <xsl:variable name="num">
         <xsl:for-each select="//*[not(ancestor-or-self::pgblk)]/pgblk[manual-title]|/pgblk[manual-title]">
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

<xsl:template match="manual-title" mode="styler_numbering" priority="0">
      <!--This context has no numbering-->
      <xsl:param name="do-qmark" select="'yes'"/>
      <xsl:if test="$do-qmark='yes'">
         <xsl:value-of select="'?'"/>
      </xsl:if>
   </xsl:template>

<xsl:template match="ata-page-block//_sfe:BeforeOrAfterText//_ufe:npara-numbering" mode="styler_numbering" priority="2">
      <xsl:variable name="node-id" select="generate-id(.)"/>
      <xsl:variable name="from-node" select="(ancestor-or-self::ata-page-block[not(ancestor::ata-page-block)])[last()]"/>
      <xsl:variable name="num">
         <xsl:variable name="candidate-num">
            <xsl:choose>
               <xsl:when test="count($from-node) &gt; 0">
                  <xsl:for-each select="$from-node/descendant-or-self::*[@_gte:count-as-id='cnt___ufe:npara-numbering^ata-page-block.cnt']">
                     <xsl:if test="generate-id(.) = $node-id">
                        <xsl:value-of select="position()"/>
                     </xsl:if>
                  </xsl:for-each>
               </xsl:when>
               <xsl:otherwise>
                  <xsl:for-each select="//*[@_gte:count-as-id='cnt___ufe:npara-numbering^ata-page-block.cnt'][not(ancestor-or-self::ata-page-block)]">
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
      <xsl:text>.</xsl:text>
   </xsl:template>

<xsl:template match="page-block//_sfe:BeforeOrAfterText//_ufe:npara-numbering" mode="styler_numbering" priority="1">
      <xsl:variable name="node-id" select="generate-id(.)"/>
      <xsl:variable name="from-node" select="(ancestor-or-self::page-block[not(ancestor::page-block)])[last()]"/>
      <xsl:variable name="num">
         <xsl:variable name="candidate-num">
            <xsl:choose>
               <xsl:when test="count($from-node) &gt; 0">
                  <xsl:for-each select="$from-node/descendant-or-self::*[@_gte:count-as-id='cnt___ufe:npara-numbering^page-block.cnt']">
                     <xsl:if test="generate-id(.) = $node-id">
                        <xsl:value-of select="position()"/>
                     </xsl:if>
                  </xsl:for-each>
               </xsl:when>
               <xsl:otherwise>
                  <xsl:for-each select="//*[@_gte:count-as-id='cnt___ufe:npara-numbering^page-block.cnt'][not(ancestor-or-self::page-block)]">
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
      <xsl:text>.</xsl:text>
   </xsl:template>

<xsl:template match="pgblk/_ufe:num-index-title" mode="styler_numbering" priority="3">
      <xsl:variable name="node-id" select="generate-id(ancestor::pgblk[1])"/>
      <xsl:variable name="num">
         <xsl:for-each select="//*[not(ancestor-or-self::pgblk)]/pgblk[_ufe:num-index-title]|/pgblk[_ufe:num-index-title]">
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

<xsl:template match="pbfmatr/_ufe:num-index-title" mode="styler_numbering" priority="2">
      <xsl:variable name="node-id" select="generate-id(.)"/>
      <xsl:variable name="num">
         <xsl:for-each select="//*[@_gte:count-as-id='cnt__pbfmatr^-None-.cnt']">
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

<xsl:template match="pwcspblist/_ufe:num-index-title" mode="styler_numbering" priority="1">
      <xsl:variable name="node-id" select="generate-id(ancestor::pwcspblist[1])"/>
      <xsl:variable name="num">
         <xsl:for-each select="//*[not(ancestor-or-self::pwcspblist)]/pwcspblist[_ufe:num-index-title]|/pwcspblist[_ufe:num-index-title]">
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

<xsl:template match="_ufe:num-index-title" mode="styler_numbering" priority="0">
      <!--This context has no numbering-->
      <xsl:param name="do-qmark" select="'yes'"/>
      <xsl:if test="$do-qmark='yes'">
         <xsl:value-of select="'?'"/>
      </xsl:if>
   </xsl:template>

<xsl:template match="pgblk/_ufe:nut-option-title" mode="styler_numbering" priority="3">
      <xsl:variable name="node-id" select="generate-id(ancestor::pgblk[1])"/>
      <xsl:variable name="num">
         <xsl:for-each select="//*[not(ancestor-or-self::pgblk)]/pgblk[_ufe:nut-option-title]|/pgblk[_ufe:nut-option-title]">
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

<xsl:template match="pbfmatr/_ufe:nut-option-title" mode="styler_numbering" priority="2">
      <xsl:variable name="node-id" select="generate-id(.)"/>
      <xsl:variable name="num">
         <xsl:for-each select="//*[@_gte:count-as-id='cnt__pbfmatr^-None-.cnt']">
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

<xsl:template match="pwcspblist/_ufe:nut-option-title" mode="styler_numbering" priority="1">
      <xsl:variable name="node-id" select="generate-id(ancestor::pwcspblist[1])"/>
      <xsl:variable name="num">
         <xsl:for-each select="//*[not(ancestor-or-self::pwcspblist)]/pwcspblist[_ufe:nut-option-title]|/pwcspblist[_ufe:nut-option-title]">
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

<xsl:template match="_ufe:nut-option-title" mode="styler_numbering" priority="0">
      <!--This context has no numbering-->
      <xsl:param name="do-qmark" select="'yes'"/>
      <xsl:if test="$do-qmark='yes'">
         <xsl:value-of select="'?'"/>
      </xsl:if>
   </xsl:template>

<xsl:template match="subpara/subpara/subpara/subpara/subpara[not(title)]/para" mode="styler_numbering" priority="51">
      <xsl:choose>
         <xsl:when test="string(number(count(parent::subpara/preceding-sibling::subpara/para) + count(preceding-sibling::para) + 1))!='NaN'">
            <xsl:number value="count(parent::subpara/preceding-sibling::subpara/para) + count(preceding-sibling::para) + 1" format="a"/>
         </xsl:when>
         <xsl:otherwise>?</xsl:otherwise>
      </xsl:choose>
   </xsl:template>

<xsl:template match="subpara/subpara/subpara/subpara[not(title)]/para" mode="styler_numbering" priority="50">
      <xsl:choose>
         <xsl:when test="string(number(count(parent::subpara/preceding-sibling::subpara/para) + count(preceding-sibling::para) + 1))!='NaN'">
            <xsl:number value="count(parent::subpara/preceding-sibling::subpara/para) + count(preceding-sibling::para) + 1" format="1"/>
         </xsl:when>
         <xsl:otherwise>?</xsl:otherwise>
      </xsl:choose>
   </xsl:template>

<xsl:template match="subpara/subpara/subpara[not(title)]/para" mode="styler_numbering" priority="48">
      <xsl:text>(</xsl:text>
      <xsl:choose>
         <xsl:when test="string(number(count(parent::subpara/preceding-sibling::subpara/para) + count(preceding-sibling::para) + 1))!='NaN'">
            <xsl:number value="count(parent::subpara/preceding-sibling::subpara/para) + count(preceding-sibling::para) + 1" format="a"/>
         </xsl:when>
         <xsl:otherwise>?</xsl:otherwise>
      </xsl:choose>
      <xsl:text>)</xsl:text>
   </xsl:template>

<xsl:template match="subpara/subpara[not(title)]/para" mode="styler_numbering" priority="47">
      <xsl:text>(</xsl:text>
      <xsl:choose>
         <xsl:when test="string(number(count(parent::subpara/preceding-sibling::subpara/para) + count(preceding-sibling::para) + 1))!='NaN'">
            <xsl:number value="count(parent::subpara/preceding-sibling::subpara/para) + count(preceding-sibling::para) + 1" format="1"/>
         </xsl:when>
         <xsl:otherwise>?</xsl:otherwise>
      </xsl:choose>
      <xsl:text>)</xsl:text>
   </xsl:template>

<xsl:template match="n-para/subpara/para" mode="styler_numbering" priority="43">
      <xsl:variable name="node-id" select="generate-id(.)"/>
      <xsl:variable name="from-node" select="(ancestor-or-self::n-para[not(ancestor::n-para)])[last()]"/>
      <xsl:variable name="num">
         <xsl:variable name="candidate-num">
            <xsl:choose>
               <xsl:when test="count($from-node) &gt; 0">
                  <xsl:for-each select="$from-node/descendant-or-self::*[@_gte:count-as-id='cnt__para^n-para.cnt']">
                     <xsl:if test="generate-id(.) = $node-id">
                        <xsl:value-of select="position()"/>
                     </xsl:if>
                  </xsl:for-each>
               </xsl:when>
               <xsl:otherwise>
                  <xsl:for-each select="//*[@_gte:count-as-id='cnt__para^n-para.cnt'][not(ancestor-or-self::n-para)]">
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
            <xsl:number value="$num" format="A"/>
         </xsl:when>
         <xsl:otherwise>?</xsl:otherwise>
      </xsl:choose>
      <xsl:text>.</xsl:text>
   </xsl:template>

<xsl:template match="pageblock-front/general//para" mode="styler_numbering" priority="40">
      <xsl:variable name="node-id" select="generate-id(.)"/>
      <xsl:variable name="from-node" select="(ancestor-or-self::general[not(ancestor::general)])[last()]"/>
      <xsl:variable name="num">
         <xsl:variable name="candidate-num">
            <xsl:choose>
               <xsl:when test="count($from-node) &gt; 0">
                  <xsl:for-each select="$from-node/descendant-or-self::*[@_gte:count-as-id='cnt__para^general.cnt']">
                     <xsl:if test="generate-id(.) = $node-id">
                        <xsl:value-of select="position()"/>
                     </xsl:if>
                  </xsl:for-each>
               </xsl:when>
               <xsl:otherwise>
                  <xsl:for-each select="//*[@_gte:count-as-id='cnt__para^general.cnt'][not(ancestor-or-self::general)]">
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
            <xsl:number format="A" value="$num"/>
         </xsl:when>
         <xsl:otherwise>?</xsl:otherwise>
      </xsl:choose>
      <xsl:text>.</xsl:text>
   </xsl:template>

<xsl:template match="n-para[ancestor::book[contains(@doctype, 'epc')]]/para" mode="styler_numbering" priority="18">
      <xsl:variable name="node-id" select="generate-id(.)"/>
      <xsl:variable name="num">
         <xsl:for-each select="parent::*/*[@_gte:count-as-id='cnt__para.xcnt']">
            <xsl:if test="generate-id(.) = $node-id">
               <xsl:value-of select="position()"/>
            </xsl:if>
         </xsl:for-each>
      </xsl:variable>
      <xsl:choose>
         <xsl:when test="string(number($num))!='NaN'">
            <xsl:number format="A" value="$num"/>
         </xsl:when>
         <xsl:otherwise>?</xsl:otherwise>
      </xsl:choose>
      <xsl:text>.</xsl:text>
   </xsl:template>

<xsl:template match="taskproc/para" mode="styler_numbering" priority="7">
      <xsl:text>(</xsl:text>
      <xsl:variable name="node-id" select="generate-id(.)"/>
      <xsl:variable name="num">
         <xsl:for-each select="parent::*/*[@_gte:count-as-id='cnt__para.xcnt']">
            <xsl:if test="generate-id(.) = $node-id">
               <xsl:value-of select="position()"/>
            </xsl:if>
         </xsl:for-each>
      </xsl:variable>
      <xsl:choose>
         <xsl:when test="string(number($num))!='NaN'">
            <xsl:number format="1" value="$num"/>
         </xsl:when>
         <xsl:otherwise>?</xsl:otherwise>
      </xsl:choose>
      <xsl:text>)</xsl:text>
   </xsl:template>

<xsl:template match="tprereq/para" mode="styler_numbering" priority="4">
      <xsl:text>(</xsl:text>
      <xsl:variable name="node-id" select="generate-id(.)"/>
      <xsl:variable name="num">
         <xsl:for-each select="parent::*/*[@_gte:count-as-id='cnt__para.xcnt']">
            <xsl:if test="generate-id(.) = $node-id">
               <xsl:value-of select="position()"/>
            </xsl:if>
         </xsl:for-each>
      </xsl:variable>
      <xsl:choose>
         <xsl:when test="string(number($num))!='NaN'">
            <xsl:number format="1" value="$num"/>
         </xsl:when>
         <xsl:otherwise>?</xsl:otherwise>
      </xsl:choose>
      <xsl:text>)</xsl:text>
   </xsl:template>

<xsl:template match="numlist/part-group" mode="styler_numbering" priority="2">
      <xsl:number count="numlist/part-group" format="1"/>
      <xsl:text>.</xsl:text>
   </xsl:template>

<xsl:template match="pgblk/_ufe:pdlist-title" mode="styler_numbering" priority="1">
      <xsl:variable name="node-id" select="generate-id(ancestor::pgblk[1])"/>
      <xsl:variable name="num">
         <xsl:for-each select="//*[not(ancestor-or-self::pgblk)]/pgblk[_ufe:pdlist-title]|/pgblk[_ufe:pdlist-title]">
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

<xsl:template match="_ufe:pdlist-title" mode="styler_numbering" priority="0">
      <!--This context has no numbering-->
      <xsl:param name="do-qmark" select="'yes'"/>
      <xsl:if test="$do-qmark='yes'">
         <xsl:value-of select="'?'"/>
      </xsl:if>
   </xsl:template>

<xsl:template match="pgblk/_ufe:sblist-title" mode="styler_numbering" priority="2">
      <xsl:variable name="node-id" select="generate-id(ancestor::pgblk[1])"/>
      <xsl:variable name="num">
         <xsl:for-each select="//*[not(ancestor-or-self::pgblk)]/pgblk[_ufe:sblist-title]|/pgblk[_ufe:sblist-title]">
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

<xsl:template match="pbfmatr/_ufe:sblist-title" mode="styler_numbering" priority="1">
      <xsl:variable name="node-id" select="generate-id(.)"/>
      <xsl:variable name="num">
         <xsl:for-each select="//*[@_gte:count-as-id='cnt__pbfmatr^-None-.cnt']">
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

<xsl:template match="_ufe:sblist-title" mode="styler_numbering" priority="0">
      <!--This context has no numbering-->
      <xsl:param name="do-qmark" select="'yes'"/>
      <xsl:if test="$do-qmark='yes'">
         <xsl:value-of select="'?'"/>
      </xsl:if>
   </xsl:template>

<xsl:template match="pgblk/_ufe:spblist-title" mode="styler_numbering" priority="2">
      <xsl:variable name="node-id" select="generate-id(ancestor::pgblk[1])"/>
      <xsl:variable name="num">
         <xsl:for-each select="//*[not(ancestor-or-self::pgblk)]/pgblk[_ufe:spblist-title]|/pgblk[_ufe:spblist-title]">
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

<xsl:template match="pbfmatr/_ufe:spblist-title" mode="styler_numbering" priority="1">
      <xsl:variable name="node-id" select="generate-id(.)"/>
      <xsl:variable name="num">
         <xsl:for-each select="//*[@_gte:count-as-id='cnt__pbfmatr^-None-.cnt']">
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

<xsl:template match="_ufe:spblist-title" mode="styler_numbering" priority="0">
      <!--This context has no numbering-->
      <xsl:param name="do-qmark" select="'yes'"/>
      <xsl:if test="$do-qmark='yes'">
         <xsl:value-of select="'?'"/>
      </xsl:if>
   </xsl:template>

<xsl:template match="pgblk/_ufe:spectools-title" mode="styler_numbering" priority="5">
      <xsl:variable name="node-id" select="generate-id(ancestor::pgblk[1])"/>
      <xsl:variable name="num">
         <xsl:for-each select="//*[not(ancestor-or-self::pgblk)]/pgblk[_ufe:spectools-title]|/pgblk[_ufe:spectools-title]">
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

<xsl:template match="pbfmatr/_ufe:spectools-title" mode="styler_numbering" priority="4">
      <xsl:variable name="node-id" select="generate-id(.)"/>
      <xsl:variable name="num">
         <xsl:for-each select="//*[@_gte:count-as-id='cnt__pbfmatr^-None-.cnt']">
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

<xsl:template match="pwcspblist/_ufe:spectools-title" mode="styler_numbering" priority="3">
      <xsl:variable name="node-id" select="generate-id(ancestor::pwcspblist[1])"/>
      <xsl:variable name="num">
         <xsl:for-each select="//*[not(ancestor-or-self::pwcspblist)]/pwcspblist[_ufe:spectools-title]|/pwcspblist[_ufe:spectools-title]">
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

<xsl:template match="page-block//special-tools//_ufe:spectools-title" mode="styler_numbering" priority="2">
      <xsl:variable name="node-id" select="generate-id(.)"/>
      <xsl:variable name="from-node" select="(ancestor-or-self::page-block[not(ancestor::page-block)])[last()]"/>
      <xsl:variable name="num">
         <xsl:variable name="candidate-num">
            <xsl:choose>
               <xsl:when test="count($from-node) &gt; 0">
                  <xsl:for-each select="$from-node/descendant-or-self::*[@_gte:count-as-id='npara']">
                     <xsl:if test="generate-id(.) = $node-id">
                        <xsl:value-of select="position()"/>
                     </xsl:if>
                  </xsl:for-each>
               </xsl:when>
               <xsl:otherwise>
                  <xsl:for-each select="//*[@_gte:count-as-id='npara'][not(ancestor-or-self::page-block)]">
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
      <xsl:text>.</xsl:text>
   </xsl:template>

<xsl:template match="ata-page-block//special-tools//_ufe:spectools-title" mode="styler_numbering" priority="1">
      <xsl:variable name="node-id" select="generate-id(.)"/>
      <xsl:variable name="from-node" select="(ancestor-or-self::ata-page-block[not(ancestor::ata-page-block)])[last()]"/>
      <xsl:variable name="num">
         <xsl:variable name="candidate-num">
            <xsl:choose>
               <xsl:when test="count($from-node) &gt; 0">
                  <xsl:for-each select="$from-node/descendant-or-self::*[@_gte:count-as-id='npara-ata']">
                     <xsl:if test="generate-id(.) = $node-id">
                        <xsl:value-of select="position()"/>
                     </xsl:if>
                  </xsl:for-each>
               </xsl:when>
               <xsl:otherwise>
                  <xsl:for-each select="//*[@_gte:count-as-id='npara-ata'][not(ancestor-or-self::ata-page-block)]">
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
      <xsl:text>.</xsl:text>
   </xsl:template>

<xsl:template match="_ufe:spectools-title" mode="styler_numbering" priority="0">
      <!--This context has no numbering-->
      <xsl:param name="do-qmark" select="'yes'"/>
      <xsl:if test="$do-qmark='yes'">
         <xsl:value-of select="'?'"/>
      </xsl:if>
   </xsl:template>

<xsl:template match="pgblk/_ufe:supplier-list-title" mode="styler_numbering" priority="3">
      <xsl:variable name="node-id" select="generate-id(ancestor::pgblk[1])"/>
      <xsl:variable name="num">
         <xsl:for-each select="//*[not(ancestor-or-self::pgblk)]/pgblk[_ufe:supplier-list-title]|/pgblk[_ufe:supplier-list-title]">
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

<xsl:template match="pbfmatr/_ufe:supplier-list-title" mode="styler_numbering" priority="2">
      <xsl:variable name="node-id" select="generate-id(.)"/>
      <xsl:variable name="num">
         <xsl:for-each select="//*[@_gte:count-as-id='cnt__pbfmatr^-None-.cnt']">
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

<xsl:template match="pwcspblist/_ufe:supplier-list-title" mode="styler_numbering" priority="1">
      <xsl:variable name="node-id" select="generate-id(ancestor::pwcspblist[1])"/>
      <xsl:variable name="num">
         <xsl:for-each select="//*[not(ancestor-or-self::pwcspblist)]/pwcspblist[_ufe:supplier-list-title]|/pwcspblist[_ufe:supplier-list-title]">
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

<xsl:template match="_ufe:supplier-list-title" mode="styler_numbering" priority="0">
      <!--This context has no numbering-->
      <xsl:param name="do-qmark" select="'yes'"/>
      <xsl:if test="$do-qmark='yes'">
         <xsl:value-of select="'?'"/>
      </xsl:if>
   </xsl:template>

<xsl:template match="pgblk/_ufe:task-title" mode="styler_numbering" priority="3">
  <!--
  <xsl:variable name="node-id" select="generate-id(ancestor::pgblk[1])"/>
  <xsl:variable name="num">
     <xsl:for-each select="//*[not(ancestor-or-self::pgblk)]/pgblk[_ufe:task-title]|/pgblk[_ufe:task-title]">
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
  -->
  <xsl:number count="pgblk[not(ancestor::pgblk) and _ufe:task-title]" level="any" format="1"/>
</xsl:template>

<xsl:template match="pbfmatr/_ufe:task-title" mode="styler_numbering" priority="2">
      <xsl:variable name="node-id" select="generate-id(.)"/>
      <xsl:variable name="num">
         <xsl:for-each select="//*[@_gte:count-as-id='cnt__pbfmatr^-None-.cnt']">
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

<xsl:template match="pbfmatr//_ufe:task-title" mode="styler_numbering" priority="1">
      <xsl:variable name="node-id" select="generate-id(.)"/>
      <xsl:variable name="from-node" select="(ancestor-or-self::pgblk[not(ancestor::pgblk)])[last()]"/>
      <xsl:variable name="num">
         <xsl:variable name="candidate-num">
            <xsl:choose>
               <xsl:when test="count($from-node) &gt; 0">
                  <xsl:for-each select="$from-node/descendant-or-self::*[@_gte:count-as-id='task']">
                     <xsl:if test="generate-id(.) = $node-id">
                        <xsl:value-of select="position()"/>
                     </xsl:if>
                  </xsl:for-each>
               </xsl:when>
               <xsl:otherwise>
                  <xsl:for-each select="//*[@_gte:count-as-id='task'][not(ancestor-or-self::pgblk)]">
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
      <xsl:text>.</xsl:text>
   </xsl:template>

<xsl:template match="_ufe:task-title" mode="styler_numbering" priority="0">
      <!--This context has no numbering-->
      <xsl:param name="do-qmark" select="'yes'"/>
      <xsl:if test="$do-qmark='yes'">
         <xsl:value-of select="'?'"/>
      </xsl:if>
   </xsl:template>

<xsl:template match="pgblk/_ufe:temp-rev-title" mode="styler_numbering" priority="2">
      <xsl:variable name="node-id" select="generate-id(ancestor::pgblk[1])"/>
      <xsl:variable name="num">
         <xsl:for-each select="//*[not(ancestor-or-self::pgblk)]/pgblk[_ufe:temp-rev-title]|/pgblk[_ufe:temp-rev-title]">
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

<xsl:template match="pbfmatr/_ufe:temp-rev-title" mode="styler_numbering" priority="1">
      <xsl:variable name="node-id" select="generate-id(.)"/>
      <xsl:variable name="num">
         <xsl:for-each select="//*[@_gte:count-as-id='cnt__pbfmatr^-None-.cnt']">
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

<xsl:template match="_ufe:temp-rev-title" mode="styler_numbering" priority="0">
      <!--This context has no numbering-->
      <xsl:param name="do-qmark" select="'yes'"/>
      <xsl:if test="$do-qmark='yes'">
         <xsl:value-of select="'?'"/>
      </xsl:if>
   </xsl:template>

<xsl:template match="subpara/subpara/subpara/subpara/subpara/title" mode="styler_numbering" priority="72">
  <xsl:number count="subpara/subpara/subpara/subpara/subpara[title]" format="a"/>
</xsl:template>

<xsl:template match="subpara/subpara/subpara/subpara/title" mode="styler_numbering" priority="71">
  <xsl:number count="subpara/subpara/subpara/subpara[title]" format="1"/>
</xsl:template>

<xsl:template match="subpara/subpara/subpara/title" mode="styler_numbering" priority="70">
  <xsl:number count="subpara/subpara/subpara[title]" format="(a)"/>
</xsl:template>

<xsl:template match="subpara/subpara/title" mode="styler_numbering" priority="57">
  <xsl:number count="subpara/subpara[title]" format="(1)"/>
</xsl:template>

<xsl:template match="subpara/title" mode="styler_numbering" priority="38">
  <!--
  <xsl:variable name="node-id" select="generate-id(.)"/>
  <xsl:variable name="from-node" select="(ancestor-or-self::n-para[not(ancestor::n-para)])[last()]"/>
  <xsl:variable name="num">
     <xsl:variable name="candidate-num">
        <xsl:choose>
           <xsl:when test="count($from-node) &gt; 0">
              <xsl:for-each select="$from-node/descendant-or-self::*[@_gte:count-as-id='subpara']">
                 <xsl:if test="generate-id(.) = $node-id">
                    <xsl:value-of select="position()"/>
                 </xsl:if>
              </xsl:for-each>
           </xsl:when>
           <xsl:otherwise>
              <xsl:for-each select="//*[@_gte:count-as-id='subpara'][not(ancestor-or-self::n-para)]">
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
        <xsl:number value="$num" format="A"/>
     </xsl:when>
     <xsl:otherwise>?</xsl:otherwise>
  </xsl:choose>
  <xsl:text>.</xsl:text>
  -->
  <xsl:choose>
    <xsl:when test="ancestor::n-para">
      <xsl:number count="subpara/title[@_gte:count-as-id='subpara']|procedure/title[@_gte:count-as-id='subpara']" 
                  from="(ancestor::n-para[not(ancestor::n-para)])[last()]" level="any" format="A."/>
    </xsl:when>
    <xsl:otherwise>
      <xsl:number count="subpara/title[@_gte:count-as-id='subpara']|procedure/title[@_gte:count-as-id='subpara']" 
                  level="any" format="A."/>
    </xsl:otherwise>
  </xsl:choose>
</xsl:template>
   
<xsl:template match="book[contains(@doctype, 'epc')]/frontmatter//graphic/title" mode="styler_numbering" priority="69">
      <xsl:variable name="node-id" select="generate-id(.)"/>
      <xsl:variable name="from-node" select="(ancestor-or-self::frontmatter[not(ancestor::frontmatter)])[last()]"/>
      <xsl:variable name="num">
         <xsl:variable name="candidate-num">
            <xsl:choose>
               <xsl:when test="count($from-node) &gt; 0">
                  <xsl:for-each select="$from-node/descendant-or-self::*[@_gte:count-as-id='cnt__graphic^frontmatter.cnt']">
                     <xsl:if test="generate-id(.) = $node-id">
                        <xsl:value-of select="position()"/>
                     </xsl:if>
                  </xsl:for-each>
               </xsl:when>
               <xsl:otherwise>
                  <xsl:for-each select="//*[@_gte:count-as-id='cnt__graphic^frontmatter.cnt'][not(ancestor-or-self::frontmatter)]">
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

<xsl:template match="book[contains(@doctype, 'ipc')]/frontmatter//figure/title" mode="styler_numbering" priority="68">
      <xsl:variable name="node-id" select="generate-id(.)"/>
      <xsl:variable name="num">
         <xsl:for-each select="parent::*/parent::*/*/*[@_gte:count-as-id='cnt__figure.xcnt']">
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

<xsl:template match="ata-page-block//task/graphic/title" mode="styler_numbering" priority="67">
      <xsl:choose>
         <xsl:when test="not(number(ancestor::pgblk/@pgblknbr)&gt;0 and number(ancestor::pgblk/@pgblknbr)&lt;=13 and ancestor::task/@confltr!='') and not(number(ancestor::pgblk/@pgblknbr)&gt;0 and number(ancestor::pgblk/@pgblknbr)&lt;=13 and ancestor::task/@varnbr!='') and not(number(ancestor::pgblk/@pgblknbr)&gt;0 and number(ancestor::pgblk/@pgblknbr)&lt;=13) and not(ancestor::task/@confltr!='') and not(ancestor::task/@varnbr!='')">
            <xsl:variable name="node-id" select="generate-id(.)"/>
            <xsl:variable name="from-node" select="(ancestor-or-self::ata-page-block[not(ancestor::ata-page-block)])[last()]"/>
            <xsl:variable name="num">
               <xsl:variable name="candidate-num">
                  <xsl:choose>
                     <xsl:when test="count($from-node) &gt; 0">
                        <xsl:for-each select="$from-node/descendant-or-self::*[@_gte:count-as-id='cnt__graphic^ata-page-block.cnt']">
                           <xsl:if test="generate-id(.) = $node-id">
                              <xsl:value-of select="position()"/>
                           </xsl:if>
                        </xsl:for-each>
                     </xsl:when>
                     <xsl:otherwise>
                        <xsl:for-each select="//*[@_gte:count-as-id='cnt__graphic^ata-page-block.cnt'][not(ancestor-or-self::ata-page-block)]">
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
         </xsl:when>
         <xsl:when test="not(number(ancestor::pgblk/@pgblknbr)&gt;0 and number(ancestor::pgblk/@pgblknbr)&lt;=13 and ancestor::task/@confltr!='') and not(number(ancestor::pgblk/@pgblknbr)&gt;0 and number(ancestor::pgblk/@pgblknbr)&lt;=13 and ancestor::task/@varnbr!='') and not(number(ancestor::pgblk/@pgblknbr)&gt;0 and number(ancestor::pgblk/@pgblknbr)&lt;=13) and not(ancestor::task/@confltr!='') and (ancestor::task/@varnbr!='')">
            <xsl:variable name="node-id" select="generate-id(.)"/>
            <xsl:variable name="from-node" select="(ancestor-or-self::ata-page-block[not(ancestor::ata-page-block)])[last()]"/>
            <xsl:variable name="num">
               <xsl:variable name="candidate-num">
                  <xsl:choose>
                     <xsl:when test="count($from-node) &gt; 0">
                        <xsl:for-each select="$from-node/descendant-or-self::*[@_gte:count-as-id='cnt__graphic^ata-page-block.cnt']">
                           <xsl:if test="generate-id(.) = $node-id">
                              <xsl:value-of select="position()"/>
                           </xsl:if>
                        </xsl:for-each>
                     </xsl:when>
                     <xsl:otherwise>
                        <xsl:for-each select="//*[@_gte:count-as-id='cnt__graphic^ata-page-block.cnt'][not(ancestor-or-self::ata-page-block)]">
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
         </xsl:when>
         <xsl:when test="not(number(ancestor::pgblk/@pgblknbr)&gt;0 and number(ancestor::pgblk/@pgblknbr)&lt;=13 and ancestor::task/@confltr!='') and not(number(ancestor::pgblk/@pgblknbr)&gt;0 and number(ancestor::pgblk/@pgblknbr)&lt;=13 and ancestor::task/@varnbr!='') and not(number(ancestor::pgblk/@pgblknbr)&gt;0 and number(ancestor::pgblk/@pgblknbr)&lt;=13) and (ancestor::task/@confltr!='')">
            <xsl:variable name="node-id" select="generate-id(.)"/>
            <xsl:variable name="from-node" select="(ancestor-or-self::ata-page-block[not(ancestor::ata-page-block)])[last()]"/>
            <xsl:variable name="num">
               <xsl:variable name="candidate-num">
                  <xsl:choose>
                     <xsl:when test="count($from-node) &gt; 0">
                        <xsl:for-each select="$from-node/descendant-or-self::*[@_gte:count-as-id='cnt__graphic^ata-page-block.cnt']">
                           <xsl:if test="generate-id(.) = $node-id">
                              <xsl:value-of select="position()"/>
                           </xsl:if>
                        </xsl:for-each>
                     </xsl:when>
                     <xsl:otherwise>
                        <xsl:for-each select="//*[@_gte:count-as-id='cnt__graphic^ata-page-block.cnt'][not(ancestor-or-self::ata-page-block)]">
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
         </xsl:when>
         <xsl:when test="not(number(ancestor::pgblk/@pgblknbr)&gt;0 and number(ancestor::pgblk/@pgblknbr)&lt;=13 and ancestor::task/@confltr!='') and not(number(ancestor::pgblk/@pgblknbr)&gt;0 and number(ancestor::pgblk/@pgblknbr)&lt;=13 and ancestor::task/@varnbr!='') and (number(ancestor::pgblk/@pgblknbr)&gt;0 and number(ancestor::pgblk/@pgblknbr)&lt;=13)">
            <xsl:variable name="node-id" select="generate-id(.)"/>
            <xsl:variable name="from-node" select="(ancestor-or-self::ata-page-block[not(ancestor::ata-page-block)])[last()]"/>
            <xsl:variable name="num">
               <xsl:variable name="candidate-num">
                  <xsl:choose>
                     <xsl:when test="count($from-node) &gt; 0">
                        <xsl:for-each select="$from-node/descendant-or-self::*[@_gte:count-as-id='cnt__graphic^ata-page-block.cnt']">
                           <xsl:if test="generate-id(.) = $node-id">
                              <xsl:value-of select="position()"/>
                           </xsl:if>
                        </xsl:for-each>
                     </xsl:when>
                     <xsl:otherwise>
                        <xsl:for-each select="//*[@_gte:count-as-id='cnt__graphic^ata-page-block.cnt'][not(ancestor-or-self::ata-page-block)]">
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
            <xsl:variable name="offset">
               <!--Evaluate startAtXPath using the first counted element within the numbering scope as the context node-->
               <xsl:variable name="initial-num">
                  <xsl:choose>
                     <xsl:when test="count($from-node) &gt; 0">
                        <xsl:apply-templates select="($from-node/descendant-or-self::*[@_gte:count-as-id='cnt__graphic^ata-page-block.cnt'])[1]" mode="startat-xpath"/>
                     </xsl:when>
                     <xsl:otherwise>
                        <xsl:apply-templates select="(//*[@_gte:count-as-id='cnt__graphic^ata-page-block.cnt'][not(ancestor-or-self::ata-page-block)])[1]" mode="startat-xpath"/>
                     </xsl:otherwise>
                  </xsl:choose>
               </xsl:variable>
               <xsl:choose>
                  <xsl:when test="string(number($initial-num))!='NaN'">
                     <xsl:value-of select="$initial-num"/>
                  </xsl:when>
                  <xsl:otherwise>1</xsl:otherwise>
               </xsl:choose>
            </xsl:variable>
            <xsl:choose>
               <xsl:when test="string(number($num))!='NaN'">
                  <xsl:number value="$num + $offset - 1" format="1"/>
               </xsl:when>
               <xsl:otherwise>?</xsl:otherwise>
            </xsl:choose>
         </xsl:when>
         <xsl:when test="not(number(ancestor::pgblk/@pgblknbr)&gt;0 and number(ancestor::pgblk/@pgblknbr)&lt;=13 and ancestor::task/@confltr!='') and (number(ancestor::pgblk/@pgblknbr)&gt;0 and number(ancestor::pgblk/@pgblknbr)&lt;=13 and ancestor::task/@varnbr!='')">
            <xsl:variable name="node-id" select="generate-id(.)"/>
            <xsl:variable name="from-node" select="(ancestor-or-self::ata-page-block[not(ancestor::ata-page-block)])[last()]"/>
            <xsl:variable name="num">
               <xsl:variable name="candidate-num">
                  <xsl:choose>
                     <xsl:when test="count($from-node) &gt; 0">
                        <xsl:for-each select="$from-node/descendant-or-self::*[@_gte:count-as-id='cnt__graphic^ata-page-block.cnt']">
                           <xsl:if test="generate-id(.) = $node-id">
                              <xsl:value-of select="position()"/>
                           </xsl:if>
                        </xsl:for-each>
                     </xsl:when>
                     <xsl:otherwise>
                        <xsl:for-each select="//*[@_gte:count-as-id='cnt__graphic^ata-page-block.cnt'][not(ancestor-or-self::ata-page-block)]">
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
            <xsl:variable name="offset">
               <!--Evaluate startAtXPath using the first counted element within the numbering scope as the context node-->
               <xsl:variable name="initial-num">
                  <xsl:choose>
                     <xsl:when test="count($from-node) &gt; 0">
                        <xsl:apply-templates select="($from-node/descendant-or-self::*[@_gte:count-as-id='cnt__graphic^ata-page-block.cnt'])[1]" mode="startat-xpath"/>
                     </xsl:when>
                     <xsl:otherwise>
                        <xsl:apply-templates select="(//*[@_gte:count-as-id='cnt__graphic^ata-page-block.cnt'][not(ancestor-or-self::ata-page-block)])[1]" mode="startat-xpath"/>
                     </xsl:otherwise>
                  </xsl:choose>
               </xsl:variable>
               <xsl:choose>
                  <xsl:when test="string(number($initial-num))!='NaN'">
                     <xsl:value-of select="$initial-num"/>
                  </xsl:when>
                  <xsl:otherwise>1</xsl:otherwise>
               </xsl:choose>
            </xsl:variable>
            <xsl:choose>
               <xsl:when test="string(number($num))!='NaN'">
                  <xsl:number value="$num + $offset - 1" format="1"/>
               </xsl:when>
               <xsl:otherwise>?</xsl:otherwise>
            </xsl:choose>
         </xsl:when>
         <xsl:when test="number(ancestor::pgblk/@pgblknbr)&gt;0 and number(ancestor::pgblk/@pgblknbr)&lt;=13 and ancestor::task/@confltr!=''">
            <xsl:variable name="node-id" select="generate-id(.)"/>
            <xsl:variable name="from-node" select="(ancestor-or-self::ata-page-block[not(ancestor::ata-page-block)])[last()]"/>
            <xsl:variable name="num">
               <xsl:variable name="candidate-num">
                  <xsl:choose>
                     <xsl:when test="count($from-node) &gt; 0">
                        <xsl:for-each select="$from-node/descendant-or-self::*[@_gte:count-as-id='cnt__graphic^ata-page-block.cnt']">
                           <xsl:if test="generate-id(.) = $node-id">
                              <xsl:value-of select="position()"/>
                           </xsl:if>
                        </xsl:for-each>
                     </xsl:when>
                     <xsl:otherwise>
                        <xsl:for-each select="//*[@_gte:count-as-id='cnt__graphic^ata-page-block.cnt'][not(ancestor-or-self::ata-page-block)]">
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
            <xsl:variable name="offset">
               <!--Evaluate startAtXPath using the first counted element within the numbering scope as the context node-->
               <xsl:variable name="initial-num">
                  <xsl:choose>
                     <xsl:when test="count($from-node) &gt; 0">
                        <xsl:apply-templates select="($from-node/descendant-or-self::*[@_gte:count-as-id='cnt__graphic^ata-page-block.cnt'])[1]" mode="startat-xpath"/>
                     </xsl:when>
                     <xsl:otherwise>
                        <xsl:apply-templates select="(//*[@_gte:count-as-id='cnt__graphic^ata-page-block.cnt'][not(ancestor-or-self::ata-page-block)])[1]" mode="startat-xpath"/>
                     </xsl:otherwise>
                  </xsl:choose>
               </xsl:variable>
               <xsl:choose>
                  <xsl:when test="string(number($initial-num))!='NaN'">
                     <xsl:value-of select="$initial-num"/>
                  </xsl:when>
                  <xsl:otherwise>1</xsl:otherwise>
               </xsl:choose>
            </xsl:variable>
            <xsl:choose>
               <xsl:when test="string(number($num))!='NaN'">
                  <xsl:number value="$num + $offset - 1" format="1"/>
               </xsl:when>
               <xsl:otherwise>?</xsl:otherwise>
            </xsl:choose>
         </xsl:when>
      </xsl:choose>
   </xsl:template>

<xsl:template match="page-block//task/graphic/title" mode="styler_numbering" priority="66">
      <xsl:choose>
         <xsl:when test="not(number(ancestor::pgblk/@pgblknbr)&gt;0 and number(ancestor::pgblk/@pgblknbr)&lt;=13 and ancestor::task/@confltr!='') and not(number(ancestor::pgblk/@pgblknbr)&gt;0 and number(ancestor::pgblk/@pgblknbr)&lt;=13 and ancestor::task/@varnbr!='') and not(number(ancestor::pgblk/@pgblknbr)&gt;0 and number(ancestor::pgblk/@pgblknbr)&lt;=13) and not(ancestor::task/@confltr!='') and not(ancestor::task/@varnbr!='')">
            <xsl:variable name="node-id" select="generate-id(.)"/>
            <xsl:variable name="from-node" select="(ancestor-or-self::page-block[not(ancestor::page-block)])[last()]"/>
            <xsl:variable name="num">
               <xsl:variable name="candidate-num">
                  <xsl:choose>
                     <xsl:when test="count($from-node) &gt; 0">
                        <xsl:for-each select="$from-node/descendant-or-self::*[@_gte:count-as-id='cnt__graphic^page-block.cnt']">
                           <xsl:if test="generate-id(.) = $node-id">
                              <xsl:value-of select="position()"/>
                           </xsl:if>
                        </xsl:for-each>
                     </xsl:when>
                     <xsl:otherwise>
                        <xsl:for-each select="//*[@_gte:count-as-id='cnt__graphic^page-block.cnt'][not(ancestor-or-self::page-block)]">
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
         </xsl:when>
         <xsl:when test="not(number(ancestor::pgblk/@pgblknbr)&gt;0 and number(ancestor::pgblk/@pgblknbr)&lt;=13 and ancestor::task/@confltr!='') and not(number(ancestor::pgblk/@pgblknbr)&gt;0 and number(ancestor::pgblk/@pgblknbr)&lt;=13 and ancestor::task/@varnbr!='') and not(number(ancestor::pgblk/@pgblknbr)&gt;0 and number(ancestor::pgblk/@pgblknbr)&lt;=13) and not(ancestor::task/@confltr!='') and (ancestor::task/@varnbr!='')">
            <xsl:variable name="node-id" select="generate-id(.)"/>
            <xsl:variable name="from-node" select="(ancestor-or-self::page-block[not(ancestor::page-block)])[last()]"/>
            <xsl:variable name="num">
               <xsl:variable name="candidate-num">
                  <xsl:choose>
                     <xsl:when test="count($from-node) &gt; 0">
                        <xsl:for-each select="$from-node/descendant-or-self::*[@_gte:count-as-id='cnt__graphic^page-block.cnt']">
                           <xsl:if test="generate-id(.) = $node-id">
                              <xsl:value-of select="position()"/>
                           </xsl:if>
                        </xsl:for-each>
                     </xsl:when>
                     <xsl:otherwise>
                        <xsl:for-each select="//*[@_gte:count-as-id='cnt__graphic^page-block.cnt'][not(ancestor-or-self::page-block)]">
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
         </xsl:when>
         <xsl:when test="not(number(ancestor::pgblk/@pgblknbr)&gt;0 and number(ancestor::pgblk/@pgblknbr)&lt;=13 and ancestor::task/@confltr!='') and not(number(ancestor::pgblk/@pgblknbr)&gt;0 and number(ancestor::pgblk/@pgblknbr)&lt;=13 and ancestor::task/@varnbr!='') and not(number(ancestor::pgblk/@pgblknbr)&gt;0 and number(ancestor::pgblk/@pgblknbr)&lt;=13) and (ancestor::task/@confltr!='')">
            <xsl:variable name="node-id" select="generate-id(.)"/>
            <xsl:variable name="from-node" select="(ancestor-or-self::page-block[not(ancestor::page-block)])[last()]"/>
            <xsl:variable name="num">
               <xsl:variable name="candidate-num">
                  <xsl:choose>
                     <xsl:when test="count($from-node) &gt; 0">
                        <xsl:for-each select="$from-node/descendant-or-self::*[@_gte:count-as-id='cnt__graphic^page-block.cnt']">
                           <xsl:if test="generate-id(.) = $node-id">
                              <xsl:value-of select="position()"/>
                           </xsl:if>
                        </xsl:for-each>
                     </xsl:when>
                     <xsl:otherwise>
                        <xsl:for-each select="//*[@_gte:count-as-id='cnt__graphic^page-block.cnt'][not(ancestor-or-self::page-block)]">
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
         </xsl:when>
         <xsl:when test="not(number(ancestor::pgblk/@pgblknbr)&gt;0 and number(ancestor::pgblk/@pgblknbr)&lt;=13 and ancestor::task/@confltr!='') and not(number(ancestor::pgblk/@pgblknbr)&gt;0 and number(ancestor::pgblk/@pgblknbr)&lt;=13 and ancestor::task/@varnbr!='') and (number(ancestor::pgblk/@pgblknbr)&gt;0 and number(ancestor::pgblk/@pgblknbr)&lt;=13)">
            <xsl:variable name="node-id" select="generate-id(.)"/>
            <xsl:variable name="from-node" select="(ancestor-or-self::page-block[not(ancestor::page-block)])[last()]"/>
            <xsl:variable name="num">
               <xsl:variable name="candidate-num">
                  <xsl:choose>
                     <xsl:when test="count($from-node) &gt; 0">
                        <xsl:for-each select="$from-node/descendant-or-self::*[@_gte:count-as-id='cnt__graphic^page-block.cnt']">
                           <xsl:if test="generate-id(.) = $node-id">
                              <xsl:value-of select="position()"/>
                           </xsl:if>
                        </xsl:for-each>
                     </xsl:when>
                     <xsl:otherwise>
                        <xsl:for-each select="//*[@_gte:count-as-id='cnt__graphic^page-block.cnt'][not(ancestor-or-self::page-block)]">
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
            <xsl:variable name="offset">
               <!--Evaluate startAtXPath using the first counted element within the numbering scope as the context node-->
               <xsl:variable name="initial-num">
                  <xsl:choose>
                     <xsl:when test="count($from-node) &gt; 0">
                        <xsl:apply-templates select="($from-node/descendant-or-self::*[@_gte:count-as-id='cnt__graphic^page-block.cnt'])[1]" mode="startat-xpath"/>
                     </xsl:when>
                     <xsl:otherwise>
                        <xsl:apply-templates select="(//*[@_gte:count-as-id='cnt__graphic^page-block.cnt'][not(ancestor-or-self::page-block)])[1]" mode="startat-xpath"/>
                     </xsl:otherwise>
                  </xsl:choose>
               </xsl:variable>
               <xsl:choose>
                  <xsl:when test="string(number($initial-num))!='NaN'">
                     <xsl:value-of select="$initial-num"/>
                  </xsl:when>
                  <xsl:otherwise>1</xsl:otherwise>
               </xsl:choose>
            </xsl:variable>
            <xsl:choose>
               <xsl:when test="string(number($num))!='NaN'">
                  <xsl:number value="$num + $offset - 1" format="1"/>
               </xsl:when>
               <xsl:otherwise>?</xsl:otherwise>
            </xsl:choose>
         </xsl:when>
         <xsl:when test="not(number(ancestor::pgblk/@pgblknbr)&gt;0 and number(ancestor::pgblk/@pgblknbr)&lt;=13 and ancestor::task/@confltr!='') and (number(ancestor::pgblk/@pgblknbr)&gt;0 and number(ancestor::pgblk/@pgblknbr)&lt;=13 and ancestor::task/@varnbr!='')">
            <xsl:variable name="node-id" select="generate-id(.)"/>
            <xsl:variable name="from-node" select="(ancestor-or-self::page-block[not(ancestor::page-block)])[last()]"/>
            <xsl:variable name="num">
               <xsl:variable name="candidate-num">
                  <xsl:choose>
                     <xsl:when test="count($from-node) &gt; 0">
                        <xsl:for-each select="$from-node/descendant-or-self::*[@_gte:count-as-id='cnt__graphic^page-block.cnt']">
                           <xsl:if test="generate-id(.) = $node-id">
                              <xsl:value-of select="position()"/>
                           </xsl:if>
                        </xsl:for-each>
                     </xsl:when>
                     <xsl:otherwise>
                        <xsl:for-each select="//*[@_gte:count-as-id='cnt__graphic^page-block.cnt'][not(ancestor-or-self::page-block)]">
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
            <xsl:variable name="offset">
               <!--Evaluate startAtXPath using the first counted element within the numbering scope as the context node-->
               <xsl:variable name="initial-num">
                  <xsl:choose>
                     <xsl:when test="count($from-node) &gt; 0">
                        <xsl:apply-templates select="($from-node/descendant-or-self::*[@_gte:count-as-id='cnt__graphic^page-block.cnt'])[1]" mode="startat-xpath"/>
                     </xsl:when>
                     <xsl:otherwise>
                        <xsl:apply-templates select="(//*[@_gte:count-as-id='cnt__graphic^page-block.cnt'][not(ancestor-or-self::page-block)])[1]" mode="startat-xpath"/>
                     </xsl:otherwise>
                  </xsl:choose>
               </xsl:variable>
               <xsl:choose>
                  <xsl:when test="string(number($initial-num))!='NaN'">
                     <xsl:value-of select="$initial-num"/>
                  </xsl:when>
                  <xsl:otherwise>1</xsl:otherwise>
               </xsl:choose>
            </xsl:variable>
            <xsl:choose>
               <xsl:when test="string(number($num))!='NaN'">
                  <xsl:number value="$num + $offset - 1" format="1"/>
               </xsl:when>
               <xsl:otherwise>?</xsl:otherwise>
            </xsl:choose>
         </xsl:when>
         <xsl:when test="number(ancestor::pgblk/@pgblknbr)&gt;0 and number(ancestor::pgblk/@pgblknbr)&lt;=13 and ancestor::task/@confltr!=''">
            <xsl:variable name="node-id" select="generate-id(.)"/>
            <xsl:variable name="from-node" select="(ancestor-or-self::page-block[not(ancestor::page-block)])[last()]"/>
            <xsl:variable name="num">
               <xsl:variable name="candidate-num">
                  <xsl:choose>
                     <xsl:when test="count($from-node) &gt; 0">
                        <xsl:for-each select="$from-node/descendant-or-self::*[@_gte:count-as-id='cnt__graphic^page-block.cnt']">
                           <xsl:if test="generate-id(.) = $node-id">
                              <xsl:value-of select="position()"/>
                           </xsl:if>
                        </xsl:for-each>
                     </xsl:when>
                     <xsl:otherwise>
                        <xsl:for-each select="//*[@_gte:count-as-id='cnt__graphic^page-block.cnt'][not(ancestor-or-self::page-block)]">
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
            <xsl:variable name="offset">
               <!--Evaluate startAtXPath using the first counted element within the numbering scope as the context node-->
               <xsl:variable name="initial-num">
                  <xsl:choose>
                     <xsl:when test="count($from-node) &gt; 0">
                        <xsl:apply-templates select="($from-node/descendant-or-self::*[@_gte:count-as-id='cnt__graphic^page-block.cnt'])[1]" mode="startat-xpath"/>
                     </xsl:when>
                     <xsl:otherwise>
                        <xsl:apply-templates select="(//*[@_gte:count-as-id='cnt__graphic^page-block.cnt'][not(ancestor-or-self::page-block)])[1]" mode="startat-xpath"/>
                     </xsl:otherwise>
                  </xsl:choose>
               </xsl:variable>
               <xsl:choose>
                  <xsl:when test="string(number($initial-num))!='NaN'">
                     <xsl:value-of select="$initial-num"/>
                  </xsl:when>
                  <xsl:otherwise>1</xsl:otherwise>
               </xsl:choose>
            </xsl:variable>
            <xsl:choose>
               <xsl:when test="string(number($num))!='NaN'">
                  <xsl:number value="$num + $offset - 1" format="1"/>
               </xsl:when>
               <xsl:otherwise>?</xsl:otherwise>
            </xsl:choose>
         </xsl:when>
      </xsl:choose>
   </xsl:template>

<xsl:template match="module[@module-name='Airworthiness_Limits']/pgblk/title" mode="styler_numbering" priority="65">
      <!--This context has no numbering-->
      <xsl:param name="do-qmark" select="'yes'"/>
      <xsl:if test="$do-qmark='yes'">
         <xsl:value-of select="'?'"/>
      </xsl:if>
   </xsl:template>

<xsl:template match="page-block[@pb-name='glossary']/module/title" mode="styler_numbering" priority="61">
      <xsl:variable name="node-id" select="generate-id(.)"/>
      <xsl:variable name="from-node" select="(ancestor-or-self::page-block[not(ancestor::page-block)])[last()]"/>
      <xsl:variable name="num">
         <xsl:variable name="candidate-num">
            <xsl:choose>
               <xsl:when test="count($from-node) &gt; 0">
                  <xsl:for-each select="$from-node/descendant-or-self::*[@_gte:count-as-id='npara']">
                     <xsl:if test="generate-id(.) = $node-id">
                        <xsl:value-of select="position()"/>
                     </xsl:if>
                  </xsl:for-each>
               </xsl:when>
               <xsl:otherwise>
                  <xsl:for-each select="//*[@_gte:count-as-id='npara'][not(ancestor-or-self::page-block)]">
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
            <xsl:number format="1" value="$num"/>
         </xsl:when>
         <xsl:otherwise>?</xsl:otherwise>
      </xsl:choose>
      <xsl:text>.</xsl:text>
   </xsl:template>

<xsl:template match="page-block[@pb-name='supp_list']/module/title" mode="styler_numbering" priority="60">
      <xsl:variable name="node-id" select="generate-id(.)"/>
      <xsl:variable name="from-node" select="(ancestor-or-self::page-block[not(ancestor::page-block)])[last()]"/>
      <xsl:variable name="num">
         <xsl:variable name="candidate-num">
            <xsl:choose>
               <xsl:when test="count($from-node) &gt; 0">
                  <xsl:for-each select="$from-node/descendant-or-self::*[@_gte:count-as-id='npara']">
                     <xsl:if test="generate-id(.) = $node-id">
                        <xsl:value-of select="position()"/>
                     </xsl:if>
                  </xsl:for-each>
               </xsl:when>
               <xsl:otherwise>
                  <xsl:for-each select="//*[@_gte:count-as-id='npara'][not(ancestor-or-self::page-block)]">
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
            <xsl:number format="1" value="$num"/>
         </xsl:when>
         <xsl:otherwise>?</xsl:otherwise>
      </xsl:choose>
      <xsl:text>.</xsl:text>
   </xsl:template>

<xsl:template match="mm-fits/subpara/title" mode="styler_numbering" priority="62">
      <xsl:variable name="node-id" select="generate-id(.)"/>
      <xsl:variable name="from-node" select="(ancestor-or-self::mm-fits[not(ancestor::mm-fits)])[last()]"/>
      <xsl:variable name="num">
         <xsl:variable name="candidate-num">
            <xsl:choose>
               <xsl:when test="count($from-node) &gt; 0">
                  <xsl:for-each select="$from-node/descendant-or-self::*[@_gte:count-as-id='cnt__subpara^mm-fits.cnt']">
                     <xsl:if test="generate-id(.) = $node-id">
                        <xsl:value-of select="position()"/>
                     </xsl:if>
                  </xsl:for-each>
               </xsl:when>
               <xsl:otherwise>
                  <xsl:for-each select="//*[@_gte:count-as-id='cnt__subpara^mm-fits.cnt'][not(ancestor-or-self::mm-fits)]">
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
            <xsl:number value="$num" format="A"/>
         </xsl:when>
         <xsl:otherwise>?</xsl:otherwise>
      </xsl:choose>
      <xsl:text>.</xsl:text>
   </xsl:template>

<xsl:template match="prcitem4/prcitem/title" mode="styler_numbering" priority="60">
      <xsl:variable name="node-id" select="generate-id(.)"/>
      <xsl:variable name="from-node" select="(ancestor-or-self::prclist4[not(ancestor::prclist4)])[last()]"/>
      <xsl:variable name="num">
         <xsl:variable name="candidate-num">
            <xsl:choose>
               <xsl:when test="count($from-node) &gt; 0">
                  <xsl:for-each select="$from-node/descendant-or-self::*[@_gte:count-as-id='cnt__prcitem^prclist4.cnt']">
                     <xsl:if test="generate-id(.) = $node-id">
                        <xsl:value-of select="position()"/>
                     </xsl:if>
                  </xsl:for-each>
               </xsl:when>
               <xsl:otherwise>
                  <xsl:for-each select="//*[@_gte:count-as-id='cnt__prcitem^prclist4.cnt'][not(ancestor-or-self::prclist4)]">
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
            <xsl:number format="1" value="$num"/>
         </xsl:when>
         <xsl:otherwise>?</xsl:otherwise>
      </xsl:choose>
      <xsl:text>.</xsl:text>
   </xsl:template>

<xsl:template match="prcitem3/prcitem/title" mode="styler_numbering" priority="60">
      <xsl:text>(</xsl:text>
      <xsl:variable name="node-id" select="generate-id(.)"/>
      <xsl:variable name="from-node" select="(ancestor-or-self::prclist3[not(ancestor::prclist3)])[last()]"/>
      <xsl:variable name="num">
         <xsl:variable name="candidate-num">
            <xsl:choose>
               <xsl:when test="count($from-node) &gt; 0">
                  <xsl:for-each select="$from-node/descendant-or-self::*[@_gte:count-as-id='cnt__prcitem^prclist3.cnt']">
                     <xsl:if test="generate-id(.) = $node-id">
                        <xsl:value-of select="position()"/>
                     </xsl:if>
                  </xsl:for-each>
               </xsl:when>
               <xsl:otherwise>
                  <xsl:for-each select="//*[@_gte:count-as-id='cnt__prcitem^prclist3.cnt'][not(ancestor-or-self::prclist3)]">
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

<xsl:template match="prcitem2/prcitem/title" mode="styler_numbering" priority="59">
      <xsl:variable name="node-id" select="generate-id(.)"/>
      <xsl:variable name="from-node" select="(ancestor-or-self::prclist2[not(ancestor::prclist2)])[last()]"/>
      <xsl:variable name="num">
         <xsl:variable name="candidate-num">
            <xsl:choose>
               <xsl:when test="count($from-node) &gt; 0">
                  <xsl:for-each select="$from-node/descendant-or-self::*[@_gte:count-as-id='cnt__prcitem^prclist2.cnt']">
                     <xsl:if test="generate-id(.) = $node-id">
                        <xsl:value-of select="position()"/>
                     </xsl:if>
                  </xsl:for-each>
               </xsl:when>
               <xsl:otherwise>
                  <xsl:for-each select="//*[@_gte:count-as-id='cnt__prcitem^prclist2.cnt'][not(ancestor-or-self::prclist2)]">
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
            <xsl:number value="$num" format="A"/>
         </xsl:when>
         <xsl:otherwise>?</xsl:otherwise>
      </xsl:choose>
      <xsl:text>.</xsl:text>
   </xsl:template>

<xsl:template match="prcitem1/prcitem/title" mode="styler_numbering" priority="55">
      <xsl:variable name="node-id" select="generate-id(.)"/>
      <xsl:variable name="from-node" select="(ancestor-or-self::prclist1[not(ancestor::prclist1)])[last()]"/>
      <xsl:variable name="num">
         <xsl:variable name="candidate-num">
            <xsl:choose>
               <xsl:when test="count($from-node) &gt; 0">
                  <xsl:for-each select="$from-node/descendant-or-self::*[@_gte:count-as-id='cnt__prcitem^prclist1.cnt']">
                     <xsl:if test="generate-id(.) = $node-id">
                        <xsl:value-of select="position()"/>
                     </xsl:if>
                  </xsl:for-each>
               </xsl:when>
               <xsl:otherwise>
                  <xsl:for-each select="//*[@_gte:count-as-id='cnt__prcitem^prclist1.cnt'][not(ancestor-or-self::prclist1)]">
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
            <xsl:number format="1" value="$num"/>
         </xsl:when>
         <xsl:otherwise>?</xsl:otherwise>
      </xsl:choose>
      <xsl:text>.</xsl:text>
   </xsl:template>

<xsl:template match="page-block[@pb-name='ni']//mfmatr/title" mode="styler_numbering" priority="56">
      <!--This context has no numbering-->
      <xsl:param name="do-qmark" select="'yes'"/>
      <xsl:if test="$do-qmark='yes'">
         <xsl:value-of select="'?'"/>
      </xsl:if>
   </xsl:template>

<xsl:template match="page-block[@pb-name='record-of-revisions']//n-para/title" mode="styler_numbering" priority="55">
      <!--This context has no numbering-->
      <xsl:param name="do-qmark" select="'yes'"/>
      <xsl:if test="$do-qmark='yes'">
         <xsl:value-of select="'?'"/>
      </xsl:if>
   </xsl:template>

<xsl:template match="book[contains(@doctype, 'epc')]//figure/title" mode="styler_numbering" priority="54">
      <!--This context has no numbering-->
      <xsl:param name="do-qmark" select="'yes'"/>
      <xsl:if test="$do-qmark='yes'">
         <xsl:value-of select="'?'"/>
      </xsl:if>
   </xsl:template>

<xsl:template match="book[contains(@doctype, 'epc')]//graphic/title" mode="styler_numbering" priority="53">
      <!--This context has no numbering-->
      <xsl:param name="do-qmark" select="'yes'"/>
      <xsl:if test="$do-qmark='yes'">
         <xsl:value-of select="'?'"/>
      </xsl:if>
   </xsl:template>

<xsl:template match="book[contains(@doctype, 'ipc')]//figure/title" mode="styler_numbering" priority="52">
      <!--This context has no numbering-->
      <xsl:param name="do-qmark" select="'yes'"/>
      <xsl:if test="$do-qmark='yes'">
         <xsl:value-of select="'?'"/>
      </xsl:if>
   </xsl:template>

<xsl:template match="task//table/title" mode="styler_numbering" priority="51">
      <xsl:choose>
         <xsl:when test="not(number(ancestor::pgblk/@pgblknbr)&gt;0 and number(ancestor::pgblk/@pgblknbr)&lt;=13 and ancestor::task/@confltr!='' and ../@display='expand') and not(number(ancestor::pgblk/@pgblknbr)&gt;0 and number(ancestor::pgblk/@pgblknbr)&lt;=13 and ancestor::task/@varnbr!='' and ../@display='expand') and not(number(ancestor::pgblk/@pgblknbr)&gt;0 and number(ancestor::pgblk/@pgblknbr)&lt;=13 and ../@display='expand') and not(number(ancestor::pgblk/@pgblknbr)&gt;0 and number(ancestor::pgblk/@pgblknbr)&lt;=13) and not(ancestor::task/@confltr!='' and ../@display='expand') and not(ancestor::task/@varnbr!='' and ../@display='expand') and not(../@display='expand')">
            <xsl:variable name="node-id" select="generate-id(.)"/>
            <xsl:variable name="from-node" select="(ancestor-or-self::pgblk[not(ancestor::pgblk)])[last()]"/>
            <xsl:variable name="num">
               <xsl:variable name="candidate-num">
                  <xsl:choose>
                     <xsl:when test="count($from-node) &gt; 0">
                        <xsl:for-each select="$from-node/descendant-or-self::*[@_gte:count-as-id='cnt__table^pgblk.cnt']">
                           <xsl:if test="generate-id(.) = $node-id">
                              <xsl:value-of select="position()"/>
                           </xsl:if>
                        </xsl:for-each>
                     </xsl:when>
                     <xsl:otherwise>
                        <xsl:for-each select="//*[@_gte:count-as-id='cnt__table^pgblk.cnt'][not(ancestor-or-self::pgblk)]">
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
         </xsl:when>
         <xsl:when test="not(number(ancestor::pgblk/@pgblknbr)&gt;0 and number(ancestor::pgblk/@pgblknbr)&lt;=13 and ancestor::task/@confltr!='' and ../@display='expand') and not(number(ancestor::pgblk/@pgblknbr)&gt;0 and number(ancestor::pgblk/@pgblknbr)&lt;=13 and ancestor::task/@varnbr!='' and ../@display='expand') and not(number(ancestor::pgblk/@pgblknbr)&gt;0 and number(ancestor::pgblk/@pgblknbr)&lt;=13 and ../@display='expand') and not(number(ancestor::pgblk/@pgblknbr)&gt;0 and number(ancestor::pgblk/@pgblknbr)&lt;=13) and not(ancestor::task/@confltr!='' and ../@display='expand') and not(ancestor::task/@varnbr!='' and ../@display='expand') and (../@display='expand')">
            <xsl:variable name="node-id" select="generate-id(.)"/>
            <xsl:variable name="from-node" select="(ancestor-or-self::pgblk[not(ancestor::pgblk)])[last()]"/>
            <xsl:variable name="num">
               <xsl:variable name="candidate-num">
                  <xsl:choose>
                     <xsl:when test="count($from-node) &gt; 0">
                        <xsl:for-each select="$from-node/descendant-or-self::*[@_gte:count-as-id='cnt__table^pgblk.cnt']">
                           <xsl:if test="generate-id(.) = $node-id">
                              <xsl:value-of select="position()"/>
                           </xsl:if>
                        </xsl:for-each>
                     </xsl:when>
                     <xsl:otherwise>
                        <xsl:for-each select="//*[@_gte:count-as-id='cnt__table^pgblk.cnt'][not(ancestor-or-self::pgblk)]">
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
         </xsl:when>
         <xsl:when test="not(number(ancestor::pgblk/@pgblknbr)&gt;0 and number(ancestor::pgblk/@pgblknbr)&lt;=13 and ancestor::task/@confltr!='' and ../@display='expand') and not(number(ancestor::pgblk/@pgblknbr)&gt;0 and number(ancestor::pgblk/@pgblknbr)&lt;=13 and ancestor::task/@varnbr!='' and ../@display='expand') and not(number(ancestor::pgblk/@pgblknbr)&gt;0 and number(ancestor::pgblk/@pgblknbr)&lt;=13 and ../@display='expand') and not(number(ancestor::pgblk/@pgblknbr)&gt;0 and number(ancestor::pgblk/@pgblknbr)&lt;=13) and not(ancestor::task/@confltr!='' and ../@display='expand') and (ancestor::task/@varnbr!='' and ../@display='expand')">
            <xsl:variable name="node-id" select="generate-id(.)"/>
            <xsl:variable name="from-node" select="(ancestor-or-self::pgblk[not(ancestor::pgblk)])[last()]"/>
            <xsl:variable name="num">
               <xsl:variable name="candidate-num">
                  <xsl:choose>
                     <xsl:when test="count($from-node) &gt; 0">
                        <xsl:for-each select="$from-node/descendant-or-self::*[@_gte:count-as-id='cnt__table^pgblk.cnt']">
                           <xsl:if test="generate-id(.) = $node-id">
                              <xsl:value-of select="position()"/>
                           </xsl:if>
                        </xsl:for-each>
                     </xsl:when>
                     <xsl:otherwise>
                        <xsl:for-each select="//*[@_gte:count-as-id='cnt__table^pgblk.cnt'][not(ancestor-or-self::pgblk)]">
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
         </xsl:when>
         <xsl:when test="not(number(ancestor::pgblk/@pgblknbr)&gt;0 and number(ancestor::pgblk/@pgblknbr)&lt;=13 and ancestor::task/@confltr!='' and ../@display='expand') and not(number(ancestor::pgblk/@pgblknbr)&gt;0 and number(ancestor::pgblk/@pgblknbr)&lt;=13 and ancestor::task/@varnbr!='' and ../@display='expand') and not(number(ancestor::pgblk/@pgblknbr)&gt;0 and number(ancestor::pgblk/@pgblknbr)&lt;=13 and ../@display='expand') and not(number(ancestor::pgblk/@pgblknbr)&gt;0 and number(ancestor::pgblk/@pgblknbr)&lt;=13) and (ancestor::task/@confltr!='' and ../@display='expand')">
            <xsl:variable name="node-id" select="generate-id(.)"/>
            <xsl:variable name="from-node" select="(ancestor-or-self::pgblk[not(ancestor::pgblk)])[last()]"/>
            <xsl:variable name="num">
               <xsl:variable name="candidate-num">
                  <xsl:choose>
                     <xsl:when test="count($from-node) &gt; 0">
                        <xsl:for-each select="$from-node/descendant-or-self::*[@_gte:count-as-id='cnt__table^pgblk.cnt']">
                           <xsl:if test="generate-id(.) = $node-id">
                              <xsl:value-of select="position()"/>
                           </xsl:if>
                        </xsl:for-each>
                     </xsl:when>
                     <xsl:otherwise>
                        <xsl:for-each select="//*[@_gte:count-as-id='cnt__table^pgblk.cnt'][not(ancestor-or-self::pgblk)]">
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
         </xsl:when>
         <xsl:when test="not(number(ancestor::pgblk/@pgblknbr)&gt;0 and number(ancestor::pgblk/@pgblknbr)&lt;=13 and ancestor::task/@confltr!='' and ../@display='expand') and not(number(ancestor::pgblk/@pgblknbr)&gt;0 and number(ancestor::pgblk/@pgblknbr)&lt;=13 and ancestor::task/@varnbr!='' and ../@display='expand') and not(number(ancestor::pgblk/@pgblknbr)&gt;0 and number(ancestor::pgblk/@pgblknbr)&lt;=13 and ../@display='expand') and (number(ancestor::pgblk/@pgblknbr)&gt;0 and number(ancestor::pgblk/@pgblknbr)&lt;=13)">
            <xsl:variable name="node-id" select="generate-id(.)"/>
            <xsl:variable name="from-node" select="(ancestor-or-self::pgblk[not(ancestor::pgblk)])[last()]"/>
            <xsl:variable name="num">
               <xsl:variable name="candidate-num">
                  <xsl:choose>
                     <xsl:when test="count($from-node) &gt; 0">
                        <xsl:for-each select="$from-node/descendant-or-self::*[@_gte:count-as-id='cnt__table^pgblk.cnt']">
                           <xsl:if test="generate-id(.) = $node-id">
                              <xsl:value-of select="position()"/>
                           </xsl:if>
                        </xsl:for-each>
                     </xsl:when>
                     <xsl:otherwise>
                        <xsl:for-each select="//*[@_gte:count-as-id='cnt__table^pgblk.cnt'][not(ancestor-or-self::pgblk)]">
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
            <xsl:variable name="offset">
               <!--Evaluate startAtXPath using the first counted element within the numbering scope as the context node-->
               <xsl:variable name="initial-num">
                  <xsl:choose>
                     <xsl:when test="count($from-node) &gt; 0">
                        <xsl:apply-templates select="($from-node/descendant-or-self::*[@_gte:count-as-id='cnt__table^pgblk.cnt'])[1]" mode="startat-xpath"/>
                     </xsl:when>
                     <xsl:otherwise>
                        <xsl:apply-templates select="(//*[@_gte:count-as-id='cnt__table^pgblk.cnt'][not(ancestor-or-self::pgblk)])[1]" mode="startat-xpath"/>
                     </xsl:otherwise>
                  </xsl:choose>
               </xsl:variable>
               <xsl:choose>
                  <xsl:when test="string(number($initial-num))!='NaN'">
                     <xsl:value-of select="$initial-num"/>
                  </xsl:when>
                  <xsl:otherwise>1</xsl:otherwise>
               </xsl:choose>
            </xsl:variable>
            <xsl:choose>
               <xsl:when test="string(number($num))!='NaN'">
                  <xsl:number value="$num + $offset - 1" format="1"/>
               </xsl:when>
               <xsl:otherwise>?</xsl:otherwise>
            </xsl:choose>
         </xsl:when>
         <xsl:when test="not(number(ancestor::pgblk/@pgblknbr)&gt;0 and number(ancestor::pgblk/@pgblknbr)&lt;=13 and ancestor::task/@confltr!='' and ../@display='expand') and not(number(ancestor::pgblk/@pgblknbr)&gt;0 and number(ancestor::pgblk/@pgblknbr)&lt;=13 and ancestor::task/@varnbr!='' and ../@display='expand') and (number(ancestor::pgblk/@pgblknbr)&gt;0 and number(ancestor::pgblk/@pgblknbr)&lt;=13 and ../@display='expand')">
            <xsl:variable name="node-id" select="generate-id(.)"/>
            <xsl:variable name="from-node" select="(ancestor-or-self::pgblk[not(ancestor::pgblk)])[last()]"/>
            <xsl:variable name="num">
               <xsl:variable name="candidate-num">
                  <xsl:choose>
                     <xsl:when test="count($from-node) &gt; 0">
                        <xsl:for-each select="$from-node/descendant-or-self::*[@_gte:count-as-id='cnt__table^pgblk.cnt']">
                           <xsl:if test="generate-id(.) = $node-id">
                              <xsl:value-of select="position()"/>
                           </xsl:if>
                        </xsl:for-each>
                     </xsl:when>
                     <xsl:otherwise>
                        <xsl:for-each select="//*[@_gte:count-as-id='cnt__table^pgblk.cnt'][not(ancestor-or-self::pgblk)]">
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
            <xsl:variable name="offset">
               <!--Evaluate startAtXPath using the first counted element within the numbering scope as the context node-->
               <xsl:variable name="initial-num">
                  <xsl:choose>
                     <xsl:when test="count($from-node) &gt; 0">
                        <xsl:apply-templates select="($from-node/descendant-or-self::*[@_gte:count-as-id='cnt__table^pgblk.cnt'])[1]" mode="startat-xpath"/>
                     </xsl:when>
                     <xsl:otherwise>
                        <xsl:apply-templates select="(//*[@_gte:count-as-id='cnt__table^pgblk.cnt'][not(ancestor-or-self::pgblk)])[1]" mode="startat-xpath"/>
                     </xsl:otherwise>
                  </xsl:choose>
               </xsl:variable>
               <xsl:choose>
                  <xsl:when test="string(number($initial-num))!='NaN'">
                     <xsl:value-of select="$initial-num"/>
                  </xsl:when>
                  <xsl:otherwise>1</xsl:otherwise>
               </xsl:choose>
            </xsl:variable>
            <xsl:choose>
               <xsl:when test="string(number($num))!='NaN'">
                  <xsl:number value="$num + $offset - 1" format="1"/>
               </xsl:when>
               <xsl:otherwise>?</xsl:otherwise>
            </xsl:choose>
         </xsl:when>
         <xsl:when test="not(number(ancestor::pgblk/@pgblknbr)&gt;0 and number(ancestor::pgblk/@pgblknbr)&lt;=13 and ancestor::task/@confltr!='' and ../@display='expand') and (number(ancestor::pgblk/@pgblknbr)&gt;0 and number(ancestor::pgblk/@pgblknbr)&lt;=13 and ancestor::task/@varnbr!='' and ../@display='expand')">
            <xsl:variable name="node-id" select="generate-id(.)"/>
            <xsl:variable name="from-node" select="(ancestor-or-self::pgblk[not(ancestor::pgblk)])[last()]"/>
            <xsl:variable name="num">
               <xsl:variable name="candidate-num">
                  <xsl:choose>
                     <xsl:when test="count($from-node) &gt; 0">
                        <xsl:for-each select="$from-node/descendant-or-self::*[@_gte:count-as-id='cnt__table^pgblk.cnt']">
                           <xsl:if test="generate-id(.) = $node-id">
                              <xsl:value-of select="position()"/>
                           </xsl:if>
                        </xsl:for-each>
                     </xsl:when>
                     <xsl:otherwise>
                        <xsl:for-each select="//*[@_gte:count-as-id='cnt__table^pgblk.cnt'][not(ancestor-or-self::pgblk)]">
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
            <xsl:variable name="offset">
               <!--Evaluate startAtXPath using the first counted element within the numbering scope as the context node-->
               <xsl:variable name="initial-num">
                  <xsl:choose>
                     <xsl:when test="count($from-node) &gt; 0">
                        <xsl:apply-templates select="($from-node/descendant-or-self::*[@_gte:count-as-id='cnt__table^pgblk.cnt'])[1]" mode="startat-xpath"/>
                     </xsl:when>
                     <xsl:otherwise>
                        <xsl:apply-templates select="(//*[@_gte:count-as-id='cnt__table^pgblk.cnt'][not(ancestor-or-self::pgblk)])[1]" mode="startat-xpath"/>
                     </xsl:otherwise>
                  </xsl:choose>
               </xsl:variable>
               <xsl:choose>
                  <xsl:when test="string(number($initial-num))!='NaN'">
                     <xsl:value-of select="$initial-num"/>
                  </xsl:when>
                  <xsl:otherwise>1</xsl:otherwise>
               </xsl:choose>
            </xsl:variable>
            <xsl:choose>
               <xsl:when test="string(number($num))!='NaN'">
                  <xsl:number value="$num + $offset - 1" format="1"/>
               </xsl:when>
               <xsl:otherwise>?</xsl:otherwise>
            </xsl:choose>
         </xsl:when>
         <xsl:when test="number(ancestor::pgblk/@pgblknbr)&gt;0 and number(ancestor::pgblk/@pgblknbr)&lt;=13 and ancestor::task/@confltr!='' and ../@display='expand'">
            <xsl:variable name="node-id" select="generate-id(.)"/>
            <xsl:variable name="from-node" select="(ancestor-or-self::pgblk[not(ancestor::pgblk)])[last()]"/>
            <xsl:variable name="num">
               <xsl:variable name="candidate-num">
                  <xsl:choose>
                     <xsl:when test="count($from-node) &gt; 0">
                        <xsl:for-each select="$from-node/descendant-or-self::*[@_gte:count-as-id='cnt__table^pgblk.cnt']">
                           <xsl:if test="generate-id(.) = $node-id">
                              <xsl:value-of select="position()"/>
                           </xsl:if>
                        </xsl:for-each>
                     </xsl:when>
                     <xsl:otherwise>
                        <xsl:for-each select="//*[@_gte:count-as-id='cnt__table^pgblk.cnt'][not(ancestor-or-self::pgblk)]">
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
            <xsl:variable name="offset">
               <!--Evaluate startAtXPath using the first counted element within the numbering scope as the context node-->
               <xsl:variable name="initial-num">
                  <xsl:choose>
                     <xsl:when test="count($from-node) &gt; 0">
                        <xsl:apply-templates select="($from-node/descendant-or-self::*[@_gte:count-as-id='cnt__table^pgblk.cnt'])[1]" mode="startat-xpath"/>
                     </xsl:when>
                     <xsl:otherwise>
                        <xsl:apply-templates select="(//*[@_gte:count-as-id='cnt__table^pgblk.cnt'][not(ancestor-or-self::pgblk)])[1]" mode="startat-xpath"/>
                     </xsl:otherwise>
                  </xsl:choose>
               </xsl:variable>
               <xsl:choose>
                  <xsl:when test="string(number($initial-num))!='NaN'">
                     <xsl:value-of select="$initial-num"/>
                  </xsl:when>
                  <xsl:otherwise>1</xsl:otherwise>
               </xsl:choose>
            </xsl:variable>
            <xsl:choose>
               <xsl:when test="string(number($num))!='NaN'">
                  <xsl:number value="$num + $offset - 1" format="1"/>
               </xsl:when>
               <xsl:otherwise>?</xsl:otherwise>
            </xsl:choose>
         </xsl:when>
      </xsl:choose>
   </xsl:template>

<xsl:template match="page-block//graphic/title" mode="styler_numbering" priority="50">
      <xsl:choose>
         <xsl:when test="not(number(ancestor::pgblk/@pgblknbr)&gt;0 and number(ancestor::pgblk/@pgblknbr)&lt;=13)">
            <xsl:variable name="node-id" select="generate-id(.)"/>
            <xsl:variable name="from-node" select="(ancestor-or-self::page-block[not(ancestor::page-block)])[last()]"/>
            <xsl:variable name="num">
               <xsl:variable name="candidate-num">
                  <xsl:choose>
                     <xsl:when test="count($from-node) &gt; 0">
                        <xsl:for-each select="$from-node/descendant-or-self::*[@_gte:count-as-id='cnt__graphic^page-block.cnt']">
                           <xsl:if test="generate-id(.) = $node-id">
                              <xsl:value-of select="position()"/>
                           </xsl:if>
                        </xsl:for-each>
                     </xsl:when>
                     <xsl:otherwise>
                        <xsl:for-each select="//*[@_gte:count-as-id='cnt__graphic^page-block.cnt'][not(ancestor-or-self::page-block)]">
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
         </xsl:when>
         <xsl:when test="number(ancestor::pgblk/@pgblknbr)&gt;0 and number(ancestor::pgblk/@pgblknbr)&lt;=13">
            <xsl:variable name="node-id" select="generate-id(.)"/>
            <xsl:variable name="from-node" select="(ancestor-or-self::page-block[not(ancestor::page-block)])[last()]"/>
            <xsl:variable name="num">
               <xsl:variable name="candidate-num">
                  <xsl:choose>
                     <xsl:when test="count($from-node) &gt; 0">
                        <xsl:for-each select="$from-node/descendant-or-self::*[@_gte:count-as-id='cnt__graphic^page-block.cnt']">
                           <xsl:if test="generate-id(.) = $node-id">
                              <xsl:value-of select="position()"/>
                           </xsl:if>
                        </xsl:for-each>
                     </xsl:when>
                     <xsl:otherwise>
                        <xsl:for-each select="//*[@_gte:count-as-id='cnt__graphic^page-block.cnt'][not(ancestor-or-self::page-block)]">
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
            <xsl:variable name="offset">
               <!--Evaluate startAtXPath using the first counted element within the numbering scope as the context node-->
               <xsl:variable name="initial-num">
                  <xsl:choose>
                     <xsl:when test="count($from-node) &gt; 0">
                        <xsl:apply-templates select="($from-node/descendant-or-self::*[@_gte:count-as-id='cnt__graphic^page-block.cnt'])[1]" mode="startat-xpath"/>
                     </xsl:when>
                     <xsl:otherwise>
                        <xsl:apply-templates select="(//*[@_gte:count-as-id='cnt__graphic^page-block.cnt'][not(ancestor-or-self::page-block)])[1]" mode="startat-xpath"/>
                     </xsl:otherwise>
                  </xsl:choose>
               </xsl:variable>
               <xsl:choose>
                  <xsl:when test="string(number($initial-num))!='NaN'">
                     <xsl:value-of select="$initial-num"/>
                  </xsl:when>
                  <xsl:otherwise>1</xsl:otherwise>
               </xsl:choose>
            </xsl:variable>
            <xsl:choose>
               <xsl:when test="string(number($num))!='NaN'">
                  <xsl:number value="$num + $offset - 1" format="1"/>
               </xsl:when>
               <xsl:otherwise>?</xsl:otherwise>
            </xsl:choose>
         </xsl:when>
      </xsl:choose>
   </xsl:template>

<xsl:template match="ata-page-block//graphic/title" mode="styler_numbering" priority="49">
      <xsl:choose>
         <xsl:when test="not(number(ancestor::pgblk/@pgblknbr)&gt;0 and number(ancestor::pgblk/@pgblknbr)&lt;=13)">
            <xsl:variable name="node-id" select="generate-id(.)"/>
            <xsl:variable name="from-node" select="(ancestor-or-self::ata-page-block[not(ancestor::ata-page-block)])[last()]"/>
            <xsl:variable name="num">
               <xsl:variable name="candidate-num">
                  <xsl:choose>
                     <xsl:when test="count($from-node) &gt; 0">
                        <xsl:for-each select="$from-node/descendant-or-self::*[@_gte:count-as-id='cnt__graphic^ata-page-block.cnt']">
                           <xsl:if test="generate-id(.) = $node-id">
                              <xsl:value-of select="position()"/>
                           </xsl:if>
                        </xsl:for-each>
                     </xsl:when>
                     <xsl:otherwise>
                        <xsl:for-each select="//*[@_gte:count-as-id='cnt__graphic^ata-page-block.cnt'][not(ancestor-or-self::ata-page-block)]">
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
         </xsl:when>
         <xsl:when test="number(ancestor::pgblk/@pgblknbr)&gt;0 and number(ancestor::pgblk/@pgblknbr)&lt;=13">
            <xsl:variable name="node-id" select="generate-id(.)"/>
            <xsl:variable name="from-node" select="(ancestor-or-self::ata-page-block[not(ancestor::ata-page-block)])[last()]"/>
            <xsl:variable name="num">
               <xsl:variable name="candidate-num">
                  <xsl:choose>
                     <xsl:when test="count($from-node) &gt; 0">
                        <xsl:for-each select="$from-node/descendant-or-self::*[@_gte:count-as-id='cnt__graphic^ata-page-block.cnt']">
                           <xsl:if test="generate-id(.) = $node-id">
                              <xsl:value-of select="position()"/>
                           </xsl:if>
                        </xsl:for-each>
                     </xsl:when>
                     <xsl:otherwise>
                        <xsl:for-each select="//*[@_gte:count-as-id='cnt__graphic^ata-page-block.cnt'][not(ancestor-or-self::ata-page-block)]">
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
            <xsl:variable name="offset">
               <!--Evaluate startAtXPath using the first counted element within the numbering scope as the context node-->
               <xsl:variable name="initial-num">
                  <xsl:choose>
                     <xsl:when test="count($from-node) &gt; 0">
                        <xsl:apply-templates select="($from-node/descendant-or-self::*[@_gte:count-as-id='cnt__graphic^ata-page-block.cnt'])[1]" mode="startat-xpath"/>
                     </xsl:when>
                     <xsl:otherwise>
                        <xsl:apply-templates select="(//*[@_gte:count-as-id='cnt__graphic^ata-page-block.cnt'][not(ancestor-or-self::ata-page-block)])[1]" mode="startat-xpath"/>
                     </xsl:otherwise>
                  </xsl:choose>
               </xsl:variable>
               <xsl:choose>
                  <xsl:when test="string(number($initial-num))!='NaN'">
                     <xsl:value-of select="$initial-num"/>
                  </xsl:when>
                  <xsl:otherwise>1</xsl:otherwise>
               </xsl:choose>
            </xsl:variable>
            <xsl:choose>
               <xsl:when test="string(number($num))!='NaN'">
                  <xsl:number value="$num + $offset - 1" format="1"/>
               </xsl:when>
               <xsl:otherwise>?</xsl:otherwise>
            </xsl:choose>
         </xsl:when>
      </xsl:choose>
   </xsl:template>

<xsl:template match="page-block//mm-fits/title" mode="styler_numbering" priority="47">
      <xsl:variable name="node-id" select="generate-id(.)"/>
      <xsl:variable name="from-node" select="(ancestor-or-self::page-block[not(ancestor::page-block)])[last()]"/>
      <xsl:variable name="num">
         <xsl:variable name="candidate-num">
            <xsl:choose>
               <xsl:when test="count($from-node) &gt; 0">
                  <xsl:for-each select="$from-node/descendant-or-self::*[@_gte:count-as-id='npara']">
                     <xsl:if test="generate-id(.) = $node-id">
                        <xsl:value-of select="position()"/>
                     </xsl:if>
                  </xsl:for-each>
               </xsl:when>
               <xsl:otherwise>
                  <xsl:for-each select="//*[@_gte:count-as-id='npara'][not(ancestor-or-self::page-block)]">
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
            <xsl:number format="1" value="$num"/>
         </xsl:when>
         <xsl:otherwise>?</xsl:otherwise>
      </xsl:choose>
      <xsl:text>.</xsl:text>
   </xsl:template>

<xsl:template match="ata-page-block//mm-fits/title" mode="styler_numbering" priority="46">
      <xsl:variable name="node-id" select="generate-id(.)"/>
      <xsl:variable name="from-node" select="(ancestor-or-self::ata-page-block[not(ancestor::ata-page-block)])[last()]"/>
      <xsl:variable name="num">
         <xsl:variable name="candidate-num">
            <xsl:choose>
               <xsl:when test="count($from-node) &gt; 0">
                  <xsl:for-each select="$from-node/descendant-or-self::*[@_gte:count-as-id='npara-ata']">
                     <xsl:if test="generate-id(.) = $node-id">
                        <xsl:value-of select="position()"/>
                     </xsl:if>
                  </xsl:for-each>
               </xsl:when>
               <xsl:otherwise>
                  <xsl:for-each select="//*[@_gte:count-as-id='npara-ata'][not(ancestor-or-self::ata-page-block)]">
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
            <xsl:number format="1" value="$num"/>
         </xsl:when>
         <xsl:otherwise>?</xsl:otherwise>
      </xsl:choose>
      <xsl:text>.</xsl:text>
   </xsl:template>

<xsl:template match="ata-page-block//fits-and-clears/title" mode="styler_numbering" priority="46">
      <xsl:variable name="node-id" select="generate-id(.)"/>
      <xsl:variable name="from-node" select="(ancestor-or-self::ata-page-block[not(ancestor::ata-page-block)])[last()]"/>
      <xsl:variable name="num">
         <xsl:variable name="candidate-num">
            <xsl:choose>
               <xsl:when test="count($from-node) &gt; 0">
                  <xsl:for-each select="$from-node/descendant-or-self::*[@_gte:count-as-id='npara-ata']">
                     <xsl:if test="generate-id(.) = $node-id">
                        <xsl:value-of select="position()"/>
                     </xsl:if>
                  </xsl:for-each>
               </xsl:when>
               <xsl:otherwise>
                  <xsl:for-each select="//*[@_gte:count-as-id='npara-ata'][not(ancestor-or-self::ata-page-block)]">
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
      <xsl:text>.</xsl:text>
   </xsl:template>

<xsl:template match="page-block//fits-and-clears/title" mode="styler_numbering" priority="45">
      <xsl:variable name="node-id" select="generate-id(.)"/>
      <xsl:variable name="from-node" select="(ancestor-or-self::page-block[not(ancestor::page-block)])[last()]"/>
      <xsl:variable name="num">
         <xsl:variable name="candidate-num">
            <xsl:choose>
               <xsl:when test="count($from-node) &gt; 0">
                  <xsl:for-each select="$from-node/descendant-or-self::*[@_gte:count-as-id='npara']">
                     <xsl:if test="generate-id(.) = $node-id">
                        <xsl:value-of select="position()"/>
                     </xsl:if>
                  </xsl:for-each>
               </xsl:when>
               <xsl:otherwise>
                  <xsl:for-each select="//*[@_gte:count-as-id='npara'][not(ancestor-or-self::page-block)]">
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
      <xsl:text>.</xsl:text>
   </xsl:template>

<xsl:template match="ata-page-block//n-para/title" mode="styler_numbering" priority="43">
      <xsl:variable name="node-id" select="generate-id(.)"/>
      <xsl:variable name="from-node" select="(ancestor-or-self::ata-page-block[not(ancestor::ata-page-block)])[last()]"/>
      <xsl:variable name="num">
         <xsl:variable name="candidate-num">
            <xsl:choose>
               <xsl:when test="count($from-node) &gt; 0">
                  <xsl:for-each select="$from-node/descendant-or-self::*[@_gte:count-as-id='npara-ata']">
                     <xsl:if test="generate-id(.) = $node-id">
                        <xsl:value-of select="position()"/>
                     </xsl:if>
                  </xsl:for-each>
               </xsl:when>
               <xsl:otherwise>
                  <xsl:for-each select="//*[@_gte:count-as-id='npara-ata'][not(ancestor-or-self::ata-page-block)]">
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
            <xsl:number format="1" value="$num"/>
         </xsl:when>
         <xsl:otherwise>?</xsl:otherwise>
      </xsl:choose>
      <xsl:text>.</xsl:text>
   </xsl:template>

<xsl:template match="page-block//n-para/title" mode="styler_numbering" priority="42">
      <xsl:variable name="node-id" select="generate-id(.)"/>
      <xsl:variable name="from-node" select="(ancestor-or-self::page-block[not(ancestor::page-block)])[last()]"/>
      <xsl:variable name="num">
         <xsl:variable name="candidate-num">
            <xsl:choose>
               <xsl:when test="count($from-node) &gt; 0">
                  <xsl:for-each select="$from-node/descendant-or-self::*[@_gte:count-as-id='npara']">
                     <xsl:if test="generate-id(.) = $node-id">
                        <xsl:value-of select="position()"/>
                     </xsl:if>
                  </xsl:for-each>
               </xsl:when>
               <xsl:otherwise>
                  <xsl:for-each select="//*[@_gte:count-as-id='npara'][not(ancestor-or-self::page-block)]">
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
            <xsl:number format="1" value="$num"/>
         </xsl:when>
         <xsl:otherwise>?</xsl:otherwise>
      </xsl:choose>
      <xsl:text>.</xsl:text>
   </xsl:template>

<xsl:template match="figure/title" mode="styler_numbering" priority="41">
      <xsl:choose>
         <xsl:when test="not(ancestor::book[contains(@doctype,'oh')] and ancestor::ata-page-block/@pb-name[.='service']) and not(ancestor::book[contains(@doctype,'oh')] and ancestor::page-block/@pb-name[.='service']) and not(ancestor::ata-page-block/@pb-name[.='00awl' or .='00intro' or .='airlim' or .='awl' or .='awlror' or .='chapsect' or .='consume' or .='d-and-o' or .='frontmatte' or .='howtouse' or .='00howtouse' or .='intro' or .='nut_option' or .='oplimits' or .='sblist' or .='schedchk' or .='spectool' or .='timelim' or .='title-page']) and not(ancestor::page-block/@pb-name[.='00awl' or .='00intro' or .='airlim' or .='awl' or .='awlror' or .='chapsect' or .='consume' or .='d-and-o' or .='frontmatte' or .='howtouse' or .='00howtouse' or .='intro' or .='nut_option' or .='oplimits' or .='sblist' or .='schedchk' or .='spectool' or .='timelim' or .='title-page']) and not(ancestor::ata-page-block/@pb-name[(starts-with(., 'do') and 'do' = translate(., '0123456789', '') and string-length(.) &gt; 2) or (starts-with(., 'in') and 'in' = translate(., '0123456789', '') and string-length(.) &gt; 2) or (starts-with(., 'tl') and 'tl' = translate(., '0123456789', '') and string-length(.) &gt; 2) or .='toolsht' or .='trlist' or .='unschedc' or .='unschedchk']) and not(ancestor::page-block/@pb-name[(starts-with(., 'do') and 'do' = translate(., '0123456789', '') and string-length(.) &gt; 2) or (starts-with(., 'in') and 'in' = translate(., '0123456789', '') and string-length(.) &gt; 2) or (starts-with(., 'tl') and 'tl' = translate(., '0123456789', '') and string-length(.) &gt; 2) or .='toolsht' or .='trlist' or .='unschedc' or .='unschedchk']) and not(ancestor-or-self::ata-page-block[1]/@pb-name and string(ancestor-or-self::ata-page-block[1]/@pb-name)='intro00') and not(ancestor-or-self::page-block[1]/@pb-name and string(ancestor-or-self::page-block[1]/@pb-name)='intro00') and not(ancestor::ata-page-block/@pb-name[starts-with(., 'disassy') or starts-with(., 'fault')]) and not(ancestor::page-block/@pb-name[starts-with(., 'disassy') or starts-with(., 'fault')]) and not(ancestor::book[contains(@doctype,'oh')] and ancestor::ata-page-block/@pb-name[starts-with(., 'clean')]) and not(ancestor::book[contains(@doctype,'oh')] and ancestor::page-block/@pb-name[starts-with(., 'clean')]) and not(ancestor::ata-page-block/@pb-name[starts-with(., 'mainprac')]) and not(ancestor::page-block/@pb-name[starts-with(., 'mainprac')]) and not(ancestor::book[contains(@doctype,'oh')] and ancestor::ata-page-block/@pb-name[starts-with(., 'inspect')]) and not(ancestor::book[contains(@doctype,'oh')] and ancestor::page-block/@pb-name[starts-with(., 'inspect')]) and not(ancestor::ata-page-block/@pb-name[(starts-with(., 'di') and 'di' = translate(., '0123456789', '') and string-length(.) &gt; 2) or starts-with(.,'service')]) and not(ancestor::page-block/@pb-name[(starts-with(., 'di') and 'di' = translate(., '0123456789', '') and string-length(.) &gt; 2) or starts-with(.,'service')]) and not(ancestor::book[contains(@doctype,'oh')] and ancestor::ata-page-block/@pb-name[starts-with(., 'repair')]) and not(ancestor::book[contains(@doctype,'oh')] and ancestor::page-block/@pb-name[starts-with(., 'repair')]) and not(ancestor::book[contains(@doctype,'oh')] and ancestor::ata-page-block/@pb-name[starts-with(., 'test')]) and not(ancestor::book[contains(@doctype,'oh')] and ancestor::page-block/@pb-name[starts-with(., 'test')]) and not(ancestor::ata-page-block/@pb-name[(starts-with(., 'cl') and 'cl' = translate(., '0123456789', '') and string-length(.) &gt; 2) or .='install' or starts-with(.,'rem-inst') or (starts-with(., 'reminst') and 'reminst' = translate(., '0123456789', '') and string-length(.) &gt; 7) or .='remove' or (starts-with(., 'repair') and 'repair' = translate(., '0123456789', '') and string-length(.) &gt; 6)]) and not(ancestor::page-block/@pb-name[(starts-with(., 'cl') and 'cl' = translate(., '0123456789', '') and string-length(.) &gt; 2) or .='install' or starts-with(.,'rem-inst') or (starts-with(., 'reminst') and 'reminst' = translate(., '0123456789', '') and string-length(.) &gt; 7) or .='remove' or (starts-with(., 'repair') and 'repair' = translate(., '0123456789', '') and string-length(.) &gt; 6)]) and not(ancestor::ata-page-block/@pb-name[starts-with(., 'assy') or (starts-with(., 'ic') and 'ic' = translate(., '0123456789', '') and string-length(.) &gt; 2) or (starts-with(., 'te') and 'te' = translate(., '0123456789', '') and string-length(.) &gt; 2) or .='test']) and not(ancestor::page-block/@pb-name[starts-with(., 'assy') or (starts-with(., 'ic') and 'ic' = translate(., '0123456789', '') and string-length(.) &gt; 2) or (starts-with(., 'te') and 'te' = translate(., '0123456789', '') and string-length(.) &gt; 2) or .='test']) and not(ancestor::ata-page-block/@pb-name[.='f-and-c' or starts-with(., 'inspect') or (starts-with(., 're') and 're' = translate(., '0123456789', '') and string-length(.) &gt; 2)]) and not(ancestor::page-block/@pb-name[.='f-and-c' or starts-with(., 'inspect') or (starts-with(., 're') and 're' = translate(., '0123456789', '') and string-length(.) &gt; 2)]) and not(ancestor::ata-page-block/@pb-name[(starts-with(., 'as') and 'as' = translate(., '0123456789', '') and string-length(.) &gt; 2) or starts-with(.,'clean') or (starts-with(., 'test') and 'test' = translate(., '0123456789', '') and string-length(.) &gt; 4)]) and not(ancestor::page-block/@pb-name[(starts-with(., 'as') and 'as' = translate(., '0123456789', '') and string-length(.) &gt; 2) or starts-with(.,'clean') or (starts-with(., 'test') and 'test' = translate(., '0123456789', '') and string-length(.) &gt; 4)]) and not(ancestor::ata-page-block/@pb-name[(starts-with(., 'fc') and 'fc' = translate(., '0123456789', '') and string-length(.) &gt; 2) or starts-with(.,'repair') or .='trouble']) and not(ancestor::page-block/@pb-name[(starts-with(., 'fc') and 'fc' = translate(., '0123456789', '') and string-length(.) &gt; 2) or starts-with(.,'repair') or .='trouble']) and not(ancestor::ata-page-block/@pb-name[starts-with(.,'storage') or (starts-with(., 'to') and 'to' = translate(., '0123456789', '') and string-length(.) &gt; 2)]) and not(ancestor::page-block/@pb-name[starts-with(.,'storage') or (starts-with(., 'to') and 'to' = translate(., '0123456789', '') and string-length(.) &gt; 2)]) and not(ancestor::ata-page-block/@pb-name[.='it-oh' or .='lt-oh']) and (ancestor::page-block/@pb-name[.='it-oh' or .='lt-oh'])">
            <xsl:variable name="node-id" select="generate-id(.)"/>
            <xsl:variable name="from-node" select="(ancestor-or-self::page-block[not(ancestor::page-block)])[last()]"/>
            <xsl:variable name="num">
               <xsl:variable name="candidate-num">
                  <xsl:choose>
                     <xsl:when test="count($from-node) &gt; 0">
                        <xsl:for-each select="$from-node/descendant-or-self::*[@_gte:count-as-id='cnt__figure^page-block.cnt']">
                           <xsl:if test="generate-id(.) = $node-id">
                              <xsl:value-of select="position()"/>
                           </xsl:if>
                        </xsl:for-each>
                     </xsl:when>
                     <xsl:otherwise>
                        <xsl:for-each select="//*[@_gte:count-as-id='cnt__figure^page-block.cnt'][not(ancestor-or-self::page-block)]">
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
            <xsl:variable name="offset">
               <!--Evaluate startAtXPath using the first counted element within the numbering scope as the context node-->
               <xsl:variable name="initial-num">
                  <xsl:choose>
                     <xsl:when test="count($from-node) &gt; 0">
                        <xsl:apply-templates select="($from-node/descendant-or-self::*[@_gte:count-as-id='cnt__figure^page-block.cnt'])[1]" mode="startat-xpath"/>
                     </xsl:when>
                     <xsl:otherwise>
                        <xsl:apply-templates select="(//*[@_gte:count-as-id='cnt__figure^page-block.cnt'][not(ancestor-or-self::page-block)])[1]" mode="startat-xpath"/>
                     </xsl:otherwise>
                  </xsl:choose>
               </xsl:variable>
               <xsl:choose>
                  <xsl:when test="string(number($initial-num))!='NaN'">
                     <xsl:value-of select="$initial-num"/>
                  </xsl:when>
                  <xsl:otherwise>1</xsl:otherwise>
               </xsl:choose>
            </xsl:variable>
            <xsl:choose>
               <xsl:when test="string(number($num))!='NaN'">
                  <xsl:number value="$num + $offset - 1" format="1"/>
               </xsl:when>
               <xsl:otherwise>?</xsl:otherwise>
            </xsl:choose>
         </xsl:when>
         <xsl:when test="not(ancestor::book[contains(@doctype,'oh')] and ancestor::ata-page-block/@pb-name[.='service']) and not(ancestor::book[contains(@doctype,'oh')] and ancestor::page-block/@pb-name[.='service']) and not(ancestor::ata-page-block/@pb-name[.='00awl' or .='00intro' or .='airlim' or .='awl' or .='awlror' or .='chapsect' or .='consume' or .='d-and-o' or .='frontmatte' or .='howtouse' or .='00howtouse' or .='intro' or .='nut_option' or .='oplimits' or .='sblist' or .='schedchk' or .='spectool' or .='timelim' or .='title-page']) and not(ancestor::page-block/@pb-name[.='00awl' or .='00intro' or .='airlim' or .='awl' or .='awlror' or .='chapsect' or .='consume' or .='d-and-o' or .='frontmatte' or .='howtouse' or .='00howtouse' or .='intro' or .='nut_option' or .='oplimits' or .='sblist' or .='schedchk' or .='spectool' or .='timelim' or .='title-page']) and not(ancestor::ata-page-block/@pb-name[(starts-with(., 'do') and 'do' = translate(., '0123456789', '') and string-length(.) &gt; 2) or (starts-with(., 'in') and 'in' = translate(., '0123456789', '') and string-length(.) &gt; 2) or (starts-with(., 'tl') and 'tl' = translate(., '0123456789', '') and string-length(.) &gt; 2) or .='toolsht' or .='trlist' or .='unschedc' or .='unschedchk']) and not(ancestor::page-block/@pb-name[(starts-with(., 'do') and 'do' = translate(., '0123456789', '') and string-length(.) &gt; 2) or (starts-with(., 'in') and 'in' = translate(., '0123456789', '') and string-length(.) &gt; 2) or (starts-with(., 'tl') and 'tl' = translate(., '0123456789', '') and string-length(.) &gt; 2) or .='toolsht' or .='trlist' or .='unschedc' or .='unschedchk']) and not(ancestor-or-self::ata-page-block[1]/@pb-name and string(ancestor-or-self::ata-page-block[1]/@pb-name)='intro00') and not(ancestor-or-self::page-block[1]/@pb-name and string(ancestor-or-self::page-block[1]/@pb-name)='intro00') and not(ancestor::ata-page-block/@pb-name[starts-with(., 'disassy') or starts-with(., 'fault')]) and not(ancestor::page-block/@pb-name[starts-with(., 'disassy') or starts-with(., 'fault')]) and not(ancestor::book[contains(@doctype,'oh')] and ancestor::ata-page-block/@pb-name[starts-with(., 'clean')]) and not(ancestor::book[contains(@doctype,'oh')] and ancestor::page-block/@pb-name[starts-with(., 'clean')]) and not(ancestor::ata-page-block/@pb-name[starts-with(., 'mainprac')]) and not(ancestor::page-block/@pb-name[starts-with(., 'mainprac')]) and not(ancestor::book[contains(@doctype,'oh')] and ancestor::ata-page-block/@pb-name[starts-with(., 'inspect')]) and not(ancestor::book[contains(@doctype,'oh')] and ancestor::page-block/@pb-name[starts-with(., 'inspect')]) and not(ancestor::ata-page-block/@pb-name[(starts-with(., 'di') and 'di' = translate(., '0123456789', '') and string-length(.) &gt; 2) or starts-with(.,'service')]) and not(ancestor::page-block/@pb-name[(starts-with(., 'di') and 'di' = translate(., '0123456789', '') and string-length(.) &gt; 2) or starts-with(.,'service')]) and not(ancestor::book[contains(@doctype,'oh')] and ancestor::ata-page-block/@pb-name[starts-with(., 'repair')]) and not(ancestor::book[contains(@doctype,'oh')] and ancestor::page-block/@pb-name[starts-with(., 'repair')]) and not(ancestor::book[contains(@doctype,'oh')] and ancestor::ata-page-block/@pb-name[starts-with(., 'test')]) and not(ancestor::book[contains(@doctype,'oh')] and ancestor::page-block/@pb-name[starts-with(., 'test')]) and not(ancestor::ata-page-block/@pb-name[(starts-with(., 'cl') and 'cl' = translate(., '0123456789', '') and string-length(.) &gt; 2) or .='install' or starts-with(.,'rem-inst') or (starts-with(., 'reminst') and 'reminst' = translate(., '0123456789', '') and string-length(.) &gt; 7) or .='remove' or (starts-with(., 'repair') and 'repair' = translate(., '0123456789', '') and string-length(.) &gt; 6)]) and not(ancestor::page-block/@pb-name[(starts-with(., 'cl') and 'cl' = translate(., '0123456789', '') and string-length(.) &gt; 2) or .='install' or starts-with(.,'rem-inst') or (starts-with(., 'reminst') and 'reminst' = translate(., '0123456789', '') and string-length(.) &gt; 7) or .='remove' or (starts-with(., 'repair') and 'repair' = translate(., '0123456789', '') and string-length(.) &gt; 6)]) and not(ancestor::ata-page-block/@pb-name[starts-with(., 'assy') or (starts-with(., 'ic') and 'ic' = translate(., '0123456789', '') and string-length(.) &gt; 2) or (starts-with(., 'te') and 'te' = translate(., '0123456789', '') and string-length(.) &gt; 2) or .='test']) and not(ancestor::page-block/@pb-name[starts-with(., 'assy') or (starts-with(., 'ic') and 'ic' = translate(., '0123456789', '') and string-length(.) &gt; 2) or (starts-with(., 'te') and 'te' = translate(., '0123456789', '') and string-length(.) &gt; 2) or .='test']) and not(ancestor::ata-page-block/@pb-name[.='f-and-c' or starts-with(., 'inspect') or (starts-with(., 're') and 're' = translate(., '0123456789', '') and string-length(.) &gt; 2)]) and not(ancestor::page-block/@pb-name[.='f-and-c' or starts-with(., 'inspect') or (starts-with(., 're') and 're' = translate(., '0123456789', '') and string-length(.) &gt; 2)]) and not(ancestor::ata-page-block/@pb-name[(starts-with(., 'as') and 'as' = translate(., '0123456789', '') and string-length(.) &gt; 2) or starts-with(.,'clean') or (starts-with(., 'test') and 'test' = translate(., '0123456789', '') and string-length(.) &gt; 4)]) and not(ancestor::page-block/@pb-name[(starts-with(., 'as') and 'as' = translate(., '0123456789', '') and string-length(.) &gt; 2) or starts-with(.,'clean') or (starts-with(., 'test') and 'test' = translate(., '0123456789', '') and string-length(.) &gt; 4)]) and not(ancestor::ata-page-block/@pb-name[(starts-with(., 'fc') and 'fc' = translate(., '0123456789', '') and string-length(.) &gt; 2) or starts-with(.,'repair') or .='trouble']) and not(ancestor::page-block/@pb-name[(starts-with(., 'fc') and 'fc' = translate(., '0123456789', '') and string-length(.) &gt; 2) or starts-with(.,'repair') or .='trouble']) and not(ancestor::ata-page-block/@pb-name[starts-with(.,'storage') or (starts-with(., 'to') and 'to' = translate(., '0123456789', '') and string-length(.) &gt; 2)]) and not(ancestor::page-block/@pb-name[starts-with(.,'storage') or (starts-with(., 'to') and 'to' = translate(., '0123456789', '') and string-length(.) &gt; 2)]) and (ancestor::ata-page-block/@pb-name[.='it-oh' or .='lt-oh'])">
            <xsl:variable name="node-id" select="generate-id(.)"/>
            <xsl:variable name="from-node" select="(ancestor-or-self::ata-page-block[not(ancestor::ata-page-block)])[last()]"/>
            <xsl:variable name="num">
               <xsl:variable name="candidate-num">
                  <xsl:choose>
                     <xsl:when test="count($from-node) &gt; 0">
                        <xsl:for-each select="$from-node/descendant-or-self::*[@_gte:count-as-id='cnt__figure^ata-page-block.cnt']">
                           <xsl:if test="generate-id(.) = $node-id">
                              <xsl:value-of select="position()"/>
                           </xsl:if>
                        </xsl:for-each>
                     </xsl:when>
                     <xsl:otherwise>
                        <xsl:for-each select="//*[@_gte:count-as-id='cnt__figure^ata-page-block.cnt'][not(ancestor-or-self::ata-page-block)]">
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
            <xsl:variable name="offset">
               <!--Evaluate startAtXPath using the first counted element within the numbering scope as the context node-->
               <xsl:variable name="initial-num">
                  <xsl:choose>
                     <xsl:when test="count($from-node) &gt; 0">
                        <xsl:apply-templates select="($from-node/descendant-or-self::*[@_gte:count-as-id='cnt__figure^ata-page-block.cnt'])[1]" mode="startat-xpath"/>
                     </xsl:when>
                     <xsl:otherwise>
                        <xsl:apply-templates select="(//*[@_gte:count-as-id='cnt__figure^ata-page-block.cnt'][not(ancestor-or-self::ata-page-block)])[1]" mode="startat-xpath"/>
                     </xsl:otherwise>
                  </xsl:choose>
               </xsl:variable>
               <xsl:choose>
                  <xsl:when test="string(number($initial-num))!='NaN'">
                     <xsl:value-of select="$initial-num"/>
                  </xsl:when>
                  <xsl:otherwise>1</xsl:otherwise>
               </xsl:choose>
            </xsl:variable>
            <xsl:choose>
               <xsl:when test="string(number($num))!='NaN'">
                  <xsl:number value="$num + $offset - 1" format="1"/>
               </xsl:when>
               <xsl:otherwise>?</xsl:otherwise>
            </xsl:choose>
         </xsl:when>
         <xsl:when test="not(ancestor::book[contains(@doctype,'oh')] and ancestor::ata-page-block/@pb-name[.='service']) and not(ancestor::book[contains(@doctype,'oh')] and ancestor::page-block/@pb-name[.='service']) and not(ancestor::ata-page-block/@pb-name[.='00awl' or .='00intro' or .='airlim' or .='awl' or .='awlror' or .='chapsect' or .='consume' or .='d-and-o' or .='frontmatte' or .='howtouse' or .='00howtouse' or .='intro' or .='nut_option' or .='oplimits' or .='sblist' or .='schedchk' or .='spectool' or .='timelim' or .='title-page']) and not(ancestor::page-block/@pb-name[.='00awl' or .='00intro' or .='airlim' or .='awl' or .='awlror' or .='chapsect' or .='consume' or .='d-and-o' or .='frontmatte' or .='howtouse' or .='00howtouse' or .='intro' or .='nut_option' or .='oplimits' or .='sblist' or .='schedchk' or .='spectool' or .='timelim' or .='title-page']) and not(ancestor::ata-page-block/@pb-name[(starts-with(., 'do') and 'do' = translate(., '0123456789', '') and string-length(.) &gt; 2) or (starts-with(., 'in') and 'in' = translate(., '0123456789', '') and string-length(.) &gt; 2) or (starts-with(., 'tl') and 'tl' = translate(., '0123456789', '') and string-length(.) &gt; 2) or .='toolsht' or .='trlist' or .='unschedc' or .='unschedchk']) and not(ancestor::page-block/@pb-name[(starts-with(., 'do') and 'do' = translate(., '0123456789', '') and string-length(.) &gt; 2) or (starts-with(., 'in') and 'in' = translate(., '0123456789', '') and string-length(.) &gt; 2) or (starts-with(., 'tl') and 'tl' = translate(., '0123456789', '') and string-length(.) &gt; 2) or .='toolsht' or .='trlist' or .='unschedc' or .='unschedchk']) and not(ancestor-or-self::ata-page-block[1]/@pb-name and string(ancestor-or-self::ata-page-block[1]/@pb-name)='intro00') and not(ancestor-or-self::page-block[1]/@pb-name and string(ancestor-or-self::page-block[1]/@pb-name)='intro00') and not(ancestor::ata-page-block/@pb-name[starts-with(., 'disassy') or starts-with(., 'fault')]) and not(ancestor::page-block/@pb-name[starts-with(., 'disassy') or starts-with(., 'fault')]) and not(ancestor::book[contains(@doctype,'oh')] and ancestor::ata-page-block/@pb-name[starts-with(., 'clean')]) and not(ancestor::book[contains(@doctype,'oh')] and ancestor::page-block/@pb-name[starts-with(., 'clean')]) and not(ancestor::ata-page-block/@pb-name[starts-with(., 'mainprac')]) and not(ancestor::page-block/@pb-name[starts-with(., 'mainprac')]) and not(ancestor::book[contains(@doctype,'oh')] and ancestor::ata-page-block/@pb-name[starts-with(., 'inspect')]) and not(ancestor::book[contains(@doctype,'oh')] and ancestor::page-block/@pb-name[starts-with(., 'inspect')]) and not(ancestor::ata-page-block/@pb-name[(starts-with(., 'di') and 'di' = translate(., '0123456789', '') and string-length(.) &gt; 2) or starts-with(.,'service')]) and not(ancestor::page-block/@pb-name[(starts-with(., 'di') and 'di' = translate(., '0123456789', '') and string-length(.) &gt; 2) or starts-with(.,'service')]) and not(ancestor::book[contains(@doctype,'oh')] and ancestor::ata-page-block/@pb-name[starts-with(., 'repair')]) and not(ancestor::book[contains(@doctype,'oh')] and ancestor::page-block/@pb-name[starts-with(., 'repair')]) and not(ancestor::book[contains(@doctype,'oh')] and ancestor::ata-page-block/@pb-name[starts-with(., 'test')]) and not(ancestor::book[contains(@doctype,'oh')] and ancestor::page-block/@pb-name[starts-with(., 'test')]) and not(ancestor::ata-page-block/@pb-name[(starts-with(., 'cl') and 'cl' = translate(., '0123456789', '') and string-length(.) &gt; 2) or .='install' or starts-with(.,'rem-inst') or (starts-with(., 'reminst') and 'reminst' = translate(., '0123456789', '') and string-length(.) &gt; 7) or .='remove' or (starts-with(., 'repair') and 'repair' = translate(., '0123456789', '') and string-length(.) &gt; 6)]) and not(ancestor::page-block/@pb-name[(starts-with(., 'cl') and 'cl' = translate(., '0123456789', '') and string-length(.) &gt; 2) or .='install' or starts-with(.,'rem-inst') or (starts-with(., 'reminst') and 'reminst' = translate(., '0123456789', '') and string-length(.) &gt; 7) or .='remove' or (starts-with(., 'repair') and 'repair' = translate(., '0123456789', '') and string-length(.) &gt; 6)]) and not(ancestor::ata-page-block/@pb-name[starts-with(., 'assy') or (starts-with(., 'ic') and 'ic' = translate(., '0123456789', '') and string-length(.) &gt; 2) or (starts-with(., 'te') and 'te' = translate(., '0123456789', '') and string-length(.) &gt; 2) or .='test']) and not(ancestor::page-block/@pb-name[starts-with(., 'assy') or (starts-with(., 'ic') and 'ic' = translate(., '0123456789', '') and string-length(.) &gt; 2) or (starts-with(., 'te') and 'te' = translate(., '0123456789', '') and string-length(.) &gt; 2) or .='test']) and not(ancestor::ata-page-block/@pb-name[.='f-and-c' or starts-with(., 'inspect') or (starts-with(., 're') and 're' = translate(., '0123456789', '') and string-length(.) &gt; 2)]) and not(ancestor::page-block/@pb-name[.='f-and-c' or starts-with(., 'inspect') or (starts-with(., 're') and 're' = translate(., '0123456789', '') and string-length(.) &gt; 2)]) and not(ancestor::ata-page-block/@pb-name[(starts-with(., 'as') and 'as' = translate(., '0123456789', '') and string-length(.) &gt; 2) or starts-with(.,'clean') or (starts-with(., 'test') and 'test' = translate(., '0123456789', '') and string-length(.) &gt; 4)]) and not(ancestor::page-block/@pb-name[(starts-with(., 'as') and 'as' = translate(., '0123456789', '') and string-length(.) &gt; 2) or starts-with(.,'clean') or (starts-with(., 'test') and 'test' = translate(., '0123456789', '') and string-length(.) &gt; 4)]) and not(ancestor::ata-page-block/@pb-name[(starts-with(., 'fc') and 'fc' = translate(., '0123456789', '') and string-length(.) &gt; 2) or starts-with(.,'repair') or .='trouble']) and not(ancestor::page-block/@pb-name[(starts-with(., 'fc') and 'fc' = translate(., '0123456789', '') and string-length(.) &gt; 2) or starts-with(.,'repair') or .='trouble']) and not(ancestor::ata-page-block/@pb-name[starts-with(.,'storage') or (starts-with(., 'to') and 'to' = translate(., '0123456789', '') and string-length(.) &gt; 2)]) and (ancestor::page-block/@pb-name[starts-with(.,'storage') or (starts-with(., 'to') and 'to' = translate(., '0123456789', '') and string-length(.) &gt; 2)])">
            <xsl:variable name="node-id" select="generate-id(.)"/>
            <xsl:variable name="from-node" select="(ancestor-or-self::page-block[not(ancestor::page-block)])[last()]"/>
            <xsl:variable name="num">
               <xsl:variable name="candidate-num">
                  <xsl:choose>
                     <xsl:when test="count($from-node) &gt; 0">
                        <xsl:for-each select="$from-node/descendant-or-self::*[@_gte:count-as-id='cnt__figure^page-block.cnt']">
                           <xsl:if test="generate-id(.) = $node-id">
                              <xsl:value-of select="position()"/>
                           </xsl:if>
                        </xsl:for-each>
                     </xsl:when>
                     <xsl:otherwise>
                        <xsl:for-each select="//*[@_gte:count-as-id='cnt__figure^page-block.cnt'][not(ancestor-or-self::page-block)]">
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
            <xsl:variable name="offset">
               <!--Evaluate startAtXPath using the first counted element within the numbering scope as the context node-->
               <xsl:variable name="initial-num">
                  <xsl:choose>
                     <xsl:when test="count($from-node) &gt; 0">
                        <xsl:apply-templates select="($from-node/descendant-or-self::*[@_gte:count-as-id='cnt__figure^page-block.cnt'])[1]" mode="startat-xpath"/>
                     </xsl:when>
                     <xsl:otherwise>
                        <xsl:apply-templates select="(//*[@_gte:count-as-id='cnt__figure^page-block.cnt'][not(ancestor-or-self::page-block)])[1]" mode="startat-xpath"/>
                     </xsl:otherwise>
                  </xsl:choose>
               </xsl:variable>
               <xsl:choose>
                  <xsl:when test="string(number($initial-num))!='NaN'">
                     <xsl:value-of select="$initial-num"/>
                  </xsl:when>
                  <xsl:otherwise>1</xsl:otherwise>
               </xsl:choose>
            </xsl:variable>
            <xsl:choose>
               <xsl:when test="string(number($num))!='NaN'">
                  <xsl:number value="$num + $offset - 1" format="1"/>
               </xsl:when>
               <xsl:otherwise>?</xsl:otherwise>
            </xsl:choose>
         </xsl:when>
         <xsl:when test="not(ancestor::book[contains(@doctype,'oh')] and ancestor::ata-page-block/@pb-name[.='service']) and not(ancestor::book[contains(@doctype,'oh')] and ancestor::page-block/@pb-name[.='service']) and not(ancestor::ata-page-block/@pb-name[.='00awl' or .='00intro' or .='airlim' or .='awl' or .='awlror' or .='chapsect' or .='consume' or .='d-and-o' or .='frontmatte' or .='howtouse' or .='00howtouse' or .='intro' or .='nut_option' or .='oplimits' or .='sblist' or .='schedchk' or .='spectool' or .='timelim' or .='title-page']) and not(ancestor::page-block/@pb-name[.='00awl' or .='00intro' or .='airlim' or .='awl' or .='awlror' or .='chapsect' or .='consume' or .='d-and-o' or .='frontmatte' or .='howtouse' or .='00howtouse' or .='intro' or .='nut_option' or .='oplimits' or .='sblist' or .='schedchk' or .='spectool' or .='timelim' or .='title-page']) and not(ancestor::ata-page-block/@pb-name[(starts-with(., 'do') and 'do' = translate(., '0123456789', '') and string-length(.) &gt; 2) or (starts-with(., 'in') and 'in' = translate(., '0123456789', '') and string-length(.) &gt; 2) or (starts-with(., 'tl') and 'tl' = translate(., '0123456789', '') and string-length(.) &gt; 2) or .='toolsht' or .='trlist' or .='unschedc' or .='unschedchk']) and not(ancestor::page-block/@pb-name[(starts-with(., 'do') and 'do' = translate(., '0123456789', '') and string-length(.) &gt; 2) or (starts-with(., 'in') and 'in' = translate(., '0123456789', '') and string-length(.) &gt; 2) or (starts-with(., 'tl') and 'tl' = translate(., '0123456789', '') and string-length(.) &gt; 2) or .='toolsht' or .='trlist' or .='unschedc' or .='unschedchk']) and not(ancestor-or-self::ata-page-block[1]/@pb-name and string(ancestor-or-self::ata-page-block[1]/@pb-name)='intro00') and not(ancestor-or-self::page-block[1]/@pb-name and string(ancestor-or-self::page-block[1]/@pb-name)='intro00') and not(ancestor::ata-page-block/@pb-name[starts-with(., 'disassy') or starts-with(., 'fault')]) and not(ancestor::page-block/@pb-name[starts-with(., 'disassy') or starts-with(., 'fault')]) and not(ancestor::book[contains(@doctype,'oh')] and ancestor::ata-page-block/@pb-name[starts-with(., 'clean')]) and not(ancestor::book[contains(@doctype,'oh')] and ancestor::page-block/@pb-name[starts-with(., 'clean')]) and not(ancestor::ata-page-block/@pb-name[starts-with(., 'mainprac')]) and not(ancestor::page-block/@pb-name[starts-with(., 'mainprac')]) and not(ancestor::book[contains(@doctype,'oh')] and ancestor::ata-page-block/@pb-name[starts-with(., 'inspect')]) and not(ancestor::book[contains(@doctype,'oh')] and ancestor::page-block/@pb-name[starts-with(., 'inspect')]) and not(ancestor::ata-page-block/@pb-name[(starts-with(., 'di') and 'di' = translate(., '0123456789', '') and string-length(.) &gt; 2) or starts-with(.,'service')]) and not(ancestor::page-block/@pb-name[(starts-with(., 'di') and 'di' = translate(., '0123456789', '') and string-length(.) &gt; 2) or starts-with(.,'service')]) and not(ancestor::book[contains(@doctype,'oh')] and ancestor::ata-page-block/@pb-name[starts-with(., 'repair')]) and not(ancestor::book[contains(@doctype,'oh')] and ancestor::page-block/@pb-name[starts-with(., 'repair')]) and not(ancestor::book[contains(@doctype,'oh')] and ancestor::ata-page-block/@pb-name[starts-with(., 'test')]) and not(ancestor::book[contains(@doctype,'oh')] and ancestor::page-block/@pb-name[starts-with(., 'test')]) and not(ancestor::ata-page-block/@pb-name[(starts-with(., 'cl') and 'cl' = translate(., '0123456789', '') and string-length(.) &gt; 2) or .='install' or starts-with(.,'rem-inst') or (starts-with(., 'reminst') and 'reminst' = translate(., '0123456789', '') and string-length(.) &gt; 7) or .='remove' or (starts-with(., 'repair') and 'repair' = translate(., '0123456789', '') and string-length(.) &gt; 6)]) and not(ancestor::page-block/@pb-name[(starts-with(., 'cl') and 'cl' = translate(., '0123456789', '') and string-length(.) &gt; 2) or .='install' or starts-with(.,'rem-inst') or (starts-with(., 'reminst') and 'reminst' = translate(., '0123456789', '') and string-length(.) &gt; 7) or .='remove' or (starts-with(., 'repair') and 'repair' = translate(., '0123456789', '') and string-length(.) &gt; 6)]) and not(ancestor::ata-page-block/@pb-name[starts-with(., 'assy') or (starts-with(., 'ic') and 'ic' = translate(., '0123456789', '') and string-length(.) &gt; 2) or (starts-with(., 'te') and 'te' = translate(., '0123456789', '') and string-length(.) &gt; 2) or .='test']) and not(ancestor::page-block/@pb-name[starts-with(., 'assy') or (starts-with(., 'ic') and 'ic' = translate(., '0123456789', '') and string-length(.) &gt; 2) or (starts-with(., 'te') and 'te' = translate(., '0123456789', '') and string-length(.) &gt; 2) or .='test']) and not(ancestor::ata-page-block/@pb-name[.='f-and-c' or starts-with(., 'inspect') or (starts-with(., 're') and 're' = translate(., '0123456789', '') and string-length(.) &gt; 2)]) and not(ancestor::page-block/@pb-name[.='f-and-c' or starts-with(., 'inspect') or (starts-with(., 're') and 're' = translate(., '0123456789', '') and string-length(.) &gt; 2)]) and not(ancestor::ata-page-block/@pb-name[(starts-with(., 'as') and 'as' = translate(., '0123456789', '') and string-length(.) &gt; 2) or starts-with(.,'clean') or (starts-with(., 'test') and 'test' = translate(., '0123456789', '') and string-length(.) &gt; 4)]) and not(ancestor::page-block/@pb-name[(starts-with(., 'as') and 'as' = translate(., '0123456789', '') and string-length(.) &gt; 2) or starts-with(.,'clean') or (starts-with(., 'test') and 'test' = translate(., '0123456789', '') and string-length(.) &gt; 4)]) and not(ancestor::ata-page-block/@pb-name[(starts-with(., 'fc') and 'fc' = translate(., '0123456789', '') and string-length(.) &gt; 2) or starts-with(.,'repair') or .='trouble']) and not(ancestor::page-block/@pb-name[(starts-with(., 'fc') and 'fc' = translate(., '0123456789', '') and string-length(.) &gt; 2) or starts-with(.,'repair') or .='trouble']) and (ancestor::ata-page-block/@pb-name[starts-with(.,'storage') or (starts-with(., 'to') and 'to' = translate(., '0123456789', '') and string-length(.) &gt; 2)])">
            <xsl:variable name="node-id" select="generate-id(.)"/>
            <xsl:variable name="from-node" select="(ancestor-or-self::ata-page-block[not(ancestor::ata-page-block)])[last()]"/>
            <xsl:variable name="num">
               <xsl:variable name="candidate-num">
                  <xsl:choose>
                     <xsl:when test="count($from-node) &gt; 0">
                        <xsl:for-each select="$from-node/descendant-or-self::*[@_gte:count-as-id='cnt__figure^ata-page-block.cnt']">
                           <xsl:if test="generate-id(.) = $node-id">
                              <xsl:value-of select="position()"/>
                           </xsl:if>
                        </xsl:for-each>
                     </xsl:when>
                     <xsl:otherwise>
                        <xsl:for-each select="//*[@_gte:count-as-id='cnt__figure^ata-page-block.cnt'][not(ancestor-or-self::ata-page-block)]">
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
            <xsl:variable name="offset">
               <!--Evaluate startAtXPath using the first counted element within the numbering scope as the context node-->
               <xsl:variable name="initial-num">
                  <xsl:choose>
                     <xsl:when test="count($from-node) &gt; 0">
                        <xsl:apply-templates select="($from-node/descendant-or-self::*[@_gte:count-as-id='cnt__figure^ata-page-block.cnt'])[1]" mode="startat-xpath"/>
                     </xsl:when>
                     <xsl:otherwise>
                        <xsl:apply-templates select="(//*[@_gte:count-as-id='cnt__figure^ata-page-block.cnt'][not(ancestor-or-self::ata-page-block)])[1]" mode="startat-xpath"/>
                     </xsl:otherwise>
                  </xsl:choose>
               </xsl:variable>
               <xsl:choose>
                  <xsl:when test="string(number($initial-num))!='NaN'">
                     <xsl:value-of select="$initial-num"/>
                  </xsl:when>
                  <xsl:otherwise>1</xsl:otherwise>
               </xsl:choose>
            </xsl:variable>
            <xsl:choose>
               <xsl:when test="string(number($num))!='NaN'">
                  <xsl:number value="$num + $offset - 1" format="1"/>
               </xsl:when>
               <xsl:otherwise>?</xsl:otherwise>
            </xsl:choose>
         </xsl:when>
         <xsl:when test="not(ancestor::book[contains(@doctype,'oh')] and ancestor::ata-page-block/@pb-name[.='service']) and not(ancestor::book[contains(@doctype,'oh')] and ancestor::page-block/@pb-name[.='service']) and not(ancestor::ata-page-block/@pb-name[.='00awl' or .='00intro' or .='airlim' or .='awl' or .='awlror' or .='chapsect' or .='consume' or .='d-and-o' or .='frontmatte' or .='howtouse' or .='00howtouse' or .='intro' or .='nut_option' or .='oplimits' or .='sblist' or .='schedchk' or .='spectool' or .='timelim' or .='title-page']) and not(ancestor::page-block/@pb-name[.='00awl' or .='00intro' or .='airlim' or .='awl' or .='awlror' or .='chapsect' or .='consume' or .='d-and-o' or .='frontmatte' or .='howtouse' or .='00howtouse' or .='intro' or .='nut_option' or .='oplimits' or .='sblist' or .='schedchk' or .='spectool' or .='timelim' or .='title-page']) and not(ancestor::ata-page-block/@pb-name[(starts-with(., 'do') and 'do' = translate(., '0123456789', '') and string-length(.) &gt; 2) or (starts-with(., 'in') and 'in' = translate(., '0123456789', '') and string-length(.) &gt; 2) or (starts-with(., 'tl') and 'tl' = translate(., '0123456789', '') and string-length(.) &gt; 2) or .='toolsht' or .='trlist' or .='unschedc' or .='unschedchk']) and not(ancestor::page-block/@pb-name[(starts-with(., 'do') and 'do' = translate(., '0123456789', '') and string-length(.) &gt; 2) or (starts-with(., 'in') and 'in' = translate(., '0123456789', '') and string-length(.) &gt; 2) or (starts-with(., 'tl') and 'tl' = translate(., '0123456789', '') and string-length(.) &gt; 2) or .='toolsht' or .='trlist' or .='unschedc' or .='unschedchk']) and not(ancestor-or-self::ata-page-block[1]/@pb-name and string(ancestor-or-self::ata-page-block[1]/@pb-name)='intro00') and not(ancestor-or-self::page-block[1]/@pb-name and string(ancestor-or-self::page-block[1]/@pb-name)='intro00') and not(ancestor::ata-page-block/@pb-name[starts-with(., 'disassy') or starts-with(., 'fault')]) and not(ancestor::page-block/@pb-name[starts-with(., 'disassy') or starts-with(., 'fault')]) and not(ancestor::book[contains(@doctype,'oh')] and ancestor::ata-page-block/@pb-name[starts-with(., 'clean')]) and not(ancestor::book[contains(@doctype,'oh')] and ancestor::page-block/@pb-name[starts-with(., 'clean')]) and not(ancestor::ata-page-block/@pb-name[starts-with(., 'mainprac')]) and not(ancestor::page-block/@pb-name[starts-with(., 'mainprac')]) and not(ancestor::book[contains(@doctype,'oh')] and ancestor::ata-page-block/@pb-name[starts-with(., 'inspect')]) and not(ancestor::book[contains(@doctype,'oh')] and ancestor::page-block/@pb-name[starts-with(., 'inspect')]) and not(ancestor::ata-page-block/@pb-name[(starts-with(., 'di') and 'di' = translate(., '0123456789', '') and string-length(.) &gt; 2) or starts-with(.,'service')]) and not(ancestor::page-block/@pb-name[(starts-with(., 'di') and 'di' = translate(., '0123456789', '') and string-length(.) &gt; 2) or starts-with(.,'service')]) and not(ancestor::book[contains(@doctype,'oh')] and ancestor::ata-page-block/@pb-name[starts-with(., 'repair')]) and not(ancestor::book[contains(@doctype,'oh')] and ancestor::page-block/@pb-name[starts-with(., 'repair')]) and not(ancestor::book[contains(@doctype,'oh')] and ancestor::ata-page-block/@pb-name[starts-with(., 'test')]) and not(ancestor::book[contains(@doctype,'oh')] and ancestor::page-block/@pb-name[starts-with(., 'test')]) and not(ancestor::ata-page-block/@pb-name[(starts-with(., 'cl') and 'cl' = translate(., '0123456789', '') and string-length(.) &gt; 2) or .='install' or starts-with(.,'rem-inst') or (starts-with(., 'reminst') and 'reminst' = translate(., '0123456789', '') and string-length(.) &gt; 7) or .='remove' or (starts-with(., 'repair') and 'repair' = translate(., '0123456789', '') and string-length(.) &gt; 6)]) and not(ancestor::page-block/@pb-name[(starts-with(., 'cl') and 'cl' = translate(., '0123456789', '') and string-length(.) &gt; 2) or .='install' or starts-with(.,'rem-inst') or (starts-with(., 'reminst') and 'reminst' = translate(., '0123456789', '') and string-length(.) &gt; 7) or .='remove' or (starts-with(., 'repair') and 'repair' = translate(., '0123456789', '') and string-length(.) &gt; 6)]) and not(ancestor::ata-page-block/@pb-name[starts-with(., 'assy') or (starts-with(., 'ic') and 'ic' = translate(., '0123456789', '') and string-length(.) &gt; 2) or (starts-with(., 'te') and 'te' = translate(., '0123456789', '') and string-length(.) &gt; 2) or .='test']) and not(ancestor::page-block/@pb-name[starts-with(., 'assy') or (starts-with(., 'ic') and 'ic' = translate(., '0123456789', '') and string-length(.) &gt; 2) or (starts-with(., 'te') and 'te' = translate(., '0123456789', '') and string-length(.) &gt; 2) or .='test']) and not(ancestor::ata-page-block/@pb-name[.='f-and-c' or starts-with(., 'inspect') or (starts-with(., 're') and 're' = translate(., '0123456789', '') and string-length(.) &gt; 2)]) and not(ancestor::page-block/@pb-name[.='f-and-c' or starts-with(., 'inspect') or (starts-with(., 're') and 're' = translate(., '0123456789', '') and string-length(.) &gt; 2)]) and not(ancestor::ata-page-block/@pb-name[(starts-with(., 'as') and 'as' = translate(., '0123456789', '') and string-length(.) &gt; 2) or starts-with(.,'clean') or (starts-with(., 'test') and 'test' = translate(., '0123456789', '') and string-length(.) &gt; 4)]) and not(ancestor::page-block/@pb-name[(starts-with(., 'as') and 'as' = translate(., '0123456789', '') and string-length(.) &gt; 2) or starts-with(.,'clean') or (starts-with(., 'test') and 'test' = translate(., '0123456789', '') and string-length(.) &gt; 4)]) and not(ancestor::ata-page-block/@pb-name[(starts-with(., 'fc') and 'fc' = translate(., '0123456789', '') and string-length(.) &gt; 2) or starts-with(.,'repair') or .='trouble']) and (ancestor::page-block/@pb-name[(starts-with(., 'fc') and 'fc' = translate(., '0123456789', '') and string-length(.) &gt; 2) or starts-with(.,'repair') or .='trouble'])">
            <xsl:variable name="node-id" select="generate-id(.)"/>
            <xsl:variable name="from-node" select="(ancestor-or-self::page-block[not(ancestor::page-block)])[last()]"/>
            <xsl:variable name="num">
               <xsl:variable name="candidate-num">
                  <xsl:choose>
                     <xsl:when test="count($from-node) &gt; 0">
                        <xsl:for-each select="$from-node/descendant-or-self::*[@_gte:count-as-id='cnt__figure^page-block.cnt']">
                           <xsl:if test="generate-id(.) = $node-id">
                              <xsl:value-of select="position()"/>
                           </xsl:if>
                        </xsl:for-each>
                     </xsl:when>
                     <xsl:otherwise>
                        <xsl:for-each select="//*[@_gte:count-as-id='cnt__figure^page-block.cnt'][not(ancestor-or-self::page-block)]">
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
            <xsl:variable name="offset">
               <!--Evaluate startAtXPath using the first counted element within the numbering scope as the context node-->
               <xsl:variable name="initial-num">
                  <xsl:choose>
                     <xsl:when test="count($from-node) &gt; 0">
                        <xsl:apply-templates select="($from-node/descendant-or-self::*[@_gte:count-as-id='cnt__figure^page-block.cnt'])[1]" mode="startat-xpath"/>
                     </xsl:when>
                     <xsl:otherwise>
                        <xsl:apply-templates select="(//*[@_gte:count-as-id='cnt__figure^page-block.cnt'][not(ancestor-or-self::page-block)])[1]" mode="startat-xpath"/>
                     </xsl:otherwise>
                  </xsl:choose>
               </xsl:variable>
               <xsl:choose>
                  <xsl:when test="string(number($initial-num))!='NaN'">
                     <xsl:value-of select="$initial-num"/>
                  </xsl:when>
                  <xsl:otherwise>1</xsl:otherwise>
               </xsl:choose>
            </xsl:variable>
            <xsl:choose>
               <xsl:when test="string(number($num))!='NaN'">
                  <xsl:number value="$num + $offset - 1" format="1"/>
               </xsl:when>
               <xsl:otherwise>?</xsl:otherwise>
            </xsl:choose>
         </xsl:when>
         <xsl:when test="not(ancestor::book[contains(@doctype,'oh')] and ancestor::ata-page-block/@pb-name[.='service']) and not(ancestor::book[contains(@doctype,'oh')] and ancestor::page-block/@pb-name[.='service']) and not(ancestor::ata-page-block/@pb-name[.='00awl' or .='00intro' or .='airlim' or .='awl' or .='awlror' or .='chapsect' or .='consume' or .='d-and-o' or .='frontmatte' or .='howtouse' or .='00howtouse' or .='intro' or .='nut_option' or .='oplimits' or .='sblist' or .='schedchk' or .='spectool' or .='timelim' or .='title-page']) and not(ancestor::page-block/@pb-name[.='00awl' or .='00intro' or .='airlim' or .='awl' or .='awlror' or .='chapsect' or .='consume' or .='d-and-o' or .='frontmatte' or .='howtouse' or .='00howtouse' or .='intro' or .='nut_option' or .='oplimits' or .='sblist' or .='schedchk' or .='spectool' or .='timelim' or .='title-page']) and not(ancestor::ata-page-block/@pb-name[(starts-with(., 'do') and 'do' = translate(., '0123456789', '') and string-length(.) &gt; 2) or (starts-with(., 'in') and 'in' = translate(., '0123456789', '') and string-length(.) &gt; 2) or (starts-with(., 'tl') and 'tl' = translate(., '0123456789', '') and string-length(.) &gt; 2) or .='toolsht' or .='trlist' or .='unschedc' or .='unschedchk']) and not(ancestor::page-block/@pb-name[(starts-with(., 'do') and 'do' = translate(., '0123456789', '') and string-length(.) &gt; 2) or (starts-with(., 'in') and 'in' = translate(., '0123456789', '') and string-length(.) &gt; 2) or (starts-with(., 'tl') and 'tl' = translate(., '0123456789', '') and string-length(.) &gt; 2) or .='toolsht' or .='trlist' or .='unschedc' or .='unschedchk']) and not(ancestor-or-self::ata-page-block[1]/@pb-name and string(ancestor-or-self::ata-page-block[1]/@pb-name)='intro00') and not(ancestor-or-self::page-block[1]/@pb-name and string(ancestor-or-self::page-block[1]/@pb-name)='intro00') and not(ancestor::ata-page-block/@pb-name[starts-with(., 'disassy') or starts-with(., 'fault')]) and not(ancestor::page-block/@pb-name[starts-with(., 'disassy') or starts-with(., 'fault')]) and not(ancestor::book[contains(@doctype,'oh')] and ancestor::ata-page-block/@pb-name[starts-with(., 'clean')]) and not(ancestor::book[contains(@doctype,'oh')] and ancestor::page-block/@pb-name[starts-with(., 'clean')]) and not(ancestor::ata-page-block/@pb-name[starts-with(., 'mainprac')]) and not(ancestor::page-block/@pb-name[starts-with(., 'mainprac')]) and not(ancestor::book[contains(@doctype,'oh')] and ancestor::ata-page-block/@pb-name[starts-with(., 'inspect')]) and not(ancestor::book[contains(@doctype,'oh')] and ancestor::page-block/@pb-name[starts-with(., 'inspect')]) and not(ancestor::ata-page-block/@pb-name[(starts-with(., 'di') and 'di' = translate(., '0123456789', '') and string-length(.) &gt; 2) or starts-with(.,'service')]) and not(ancestor::page-block/@pb-name[(starts-with(., 'di') and 'di' = translate(., '0123456789', '') and string-length(.) &gt; 2) or starts-with(.,'service')]) and not(ancestor::book[contains(@doctype,'oh')] and ancestor::ata-page-block/@pb-name[starts-with(., 'repair')]) and not(ancestor::book[contains(@doctype,'oh')] and ancestor::page-block/@pb-name[starts-with(., 'repair')]) and not(ancestor::book[contains(@doctype,'oh')] and ancestor::ata-page-block/@pb-name[starts-with(., 'test')]) and not(ancestor::book[contains(@doctype,'oh')] and ancestor::page-block/@pb-name[starts-with(., 'test')]) and not(ancestor::ata-page-block/@pb-name[(starts-with(., 'cl') and 'cl' = translate(., '0123456789', '') and string-length(.) &gt; 2) or .='install' or starts-with(.,'rem-inst') or (starts-with(., 'reminst') and 'reminst' = translate(., '0123456789', '') and string-length(.) &gt; 7) or .='remove' or (starts-with(., 'repair') and 'repair' = translate(., '0123456789', '') and string-length(.) &gt; 6)]) and not(ancestor::page-block/@pb-name[(starts-with(., 'cl') and 'cl' = translate(., '0123456789', '') and string-length(.) &gt; 2) or .='install' or starts-with(.,'rem-inst') or (starts-with(., 'reminst') and 'reminst' = translate(., '0123456789', '') and string-length(.) &gt; 7) or .='remove' or (starts-with(., 'repair') and 'repair' = translate(., '0123456789', '') and string-length(.) &gt; 6)]) and not(ancestor::ata-page-block/@pb-name[starts-with(., 'assy') or (starts-with(., 'ic') and 'ic' = translate(., '0123456789', '') and string-length(.) &gt; 2) or (starts-with(., 'te') and 'te' = translate(., '0123456789', '') and string-length(.) &gt; 2) or .='test']) and not(ancestor::page-block/@pb-name[starts-with(., 'assy') or (starts-with(., 'ic') and 'ic' = translate(., '0123456789', '') and string-length(.) &gt; 2) or (starts-with(., 'te') and 'te' = translate(., '0123456789', '') and string-length(.) &gt; 2) or .='test']) and not(ancestor::ata-page-block/@pb-name[.='f-and-c' or starts-with(., 'inspect') or (starts-with(., 're') and 're' = translate(., '0123456789', '') and string-length(.) &gt; 2)]) and not(ancestor::page-block/@pb-name[.='f-and-c' or starts-with(., 'inspect') or (starts-with(., 're') and 're' = translate(., '0123456789', '') and string-length(.) &gt; 2)]) and not(ancestor::ata-page-block/@pb-name[(starts-with(., 'as') and 'as' = translate(., '0123456789', '') and string-length(.) &gt; 2) or starts-with(.,'clean') or (starts-with(., 'test') and 'test' = translate(., '0123456789', '') and string-length(.) &gt; 4)]) and not(ancestor::page-block/@pb-name[(starts-with(., 'as') and 'as' = translate(., '0123456789', '') and string-length(.) &gt; 2) or starts-with(.,'clean') or (starts-with(., 'test') and 'test' = translate(., '0123456789', '') and string-length(.) &gt; 4)]) and (ancestor::ata-page-block/@pb-name[(starts-with(., 'fc') and 'fc' = translate(., '0123456789', '') and string-length(.) &gt; 2) or starts-with(.,'repair') or .='trouble'])">
            <xsl:variable name="node-id" select="generate-id(.)"/>
            <xsl:variable name="from-node" select="(ancestor-or-self::ata-page-block[not(ancestor::ata-page-block)])[last()]"/>
            <xsl:variable name="num">
               <xsl:variable name="candidate-num">
                  <xsl:choose>
                     <xsl:when test="count($from-node) &gt; 0">
                        <xsl:for-each select="$from-node/descendant-or-self::*[@_gte:count-as-id='cnt__figure^ata-page-block.cnt']">
                           <xsl:if test="generate-id(.) = $node-id">
                              <xsl:value-of select="position()"/>
                           </xsl:if>
                        </xsl:for-each>
                     </xsl:when>
                     <xsl:otherwise>
                        <xsl:for-each select="//*[@_gte:count-as-id='cnt__figure^ata-page-block.cnt'][not(ancestor-or-self::ata-page-block)]">
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
            <xsl:variable name="offset">
               <!--Evaluate startAtXPath using the first counted element within the numbering scope as the context node-->
               <xsl:variable name="initial-num">
                  <xsl:choose>
                     <xsl:when test="count($from-node) &gt; 0">
                        <xsl:apply-templates select="($from-node/descendant-or-self::*[@_gte:count-as-id='cnt__figure^ata-page-block.cnt'])[1]" mode="startat-xpath"/>
                     </xsl:when>
                     <xsl:otherwise>
                        <xsl:apply-templates select="(//*[@_gte:count-as-id='cnt__figure^ata-page-block.cnt'][not(ancestor-or-self::ata-page-block)])[1]" mode="startat-xpath"/>
                     </xsl:otherwise>
                  </xsl:choose>
               </xsl:variable>
               <xsl:choose>
                  <xsl:when test="string(number($initial-num))!='NaN'">
                     <xsl:value-of select="$initial-num"/>
                  </xsl:when>
                  <xsl:otherwise>1</xsl:otherwise>
               </xsl:choose>
            </xsl:variable>
            <xsl:choose>
               <xsl:when test="string(number($num))!='NaN'">
                  <xsl:number value="$num + $offset - 1" format="1"/>
               </xsl:when>
               <xsl:otherwise>?</xsl:otherwise>
            </xsl:choose>
         </xsl:when>
         <xsl:when test="not(ancestor::book[contains(@doctype,'oh')] and ancestor::ata-page-block/@pb-name[.='service']) and not(ancestor::book[contains(@doctype,'oh')] and ancestor::page-block/@pb-name[.='service']) and not(ancestor::ata-page-block/@pb-name[.='00awl' or .='00intro' or .='airlim' or .='awl' or .='awlror' or .='chapsect' or .='consume' or .='d-and-o' or .='frontmatte' or .='howtouse' or .='00howtouse' or .='intro' or .='nut_option' or .='oplimits' or .='sblist' or .='schedchk' or .='spectool' or .='timelim' or .='title-page']) and not(ancestor::page-block/@pb-name[.='00awl' or .='00intro' or .='airlim' or .='awl' or .='awlror' or .='chapsect' or .='consume' or .='d-and-o' or .='frontmatte' or .='howtouse' or .='00howtouse' or .='intro' or .='nut_option' or .='oplimits' or .='sblist' or .='schedchk' or .='spectool' or .='timelim' or .='title-page']) and not(ancestor::ata-page-block/@pb-name[(starts-with(., 'do') and 'do' = translate(., '0123456789', '') and string-length(.) &gt; 2) or (starts-with(., 'in') and 'in' = translate(., '0123456789', '') and string-length(.) &gt; 2) or (starts-with(., 'tl') and 'tl' = translate(., '0123456789', '') and string-length(.) &gt; 2) or .='toolsht' or .='trlist' or .='unschedc' or .='unschedchk']) and not(ancestor::page-block/@pb-name[(starts-with(., 'do') and 'do' = translate(., '0123456789', '') and string-length(.) &gt; 2) or (starts-with(., 'in') and 'in' = translate(., '0123456789', '') and string-length(.) &gt; 2) or (starts-with(., 'tl') and 'tl' = translate(., '0123456789', '') and string-length(.) &gt; 2) or .='toolsht' or .='trlist' or .='unschedc' or .='unschedchk']) and not(ancestor-or-self::ata-page-block[1]/@pb-name and string(ancestor-or-self::ata-page-block[1]/@pb-name)='intro00') and not(ancestor-or-self::page-block[1]/@pb-name and string(ancestor-or-self::page-block[1]/@pb-name)='intro00') and not(ancestor::ata-page-block/@pb-name[starts-with(., 'disassy') or starts-with(., 'fault')]) and not(ancestor::page-block/@pb-name[starts-with(., 'disassy') or starts-with(., 'fault')]) and not(ancestor::book[contains(@doctype,'oh')] and ancestor::ata-page-block/@pb-name[starts-with(., 'clean')]) and not(ancestor::book[contains(@doctype,'oh')] and ancestor::page-block/@pb-name[starts-with(., 'clean')]) and not(ancestor::ata-page-block/@pb-name[starts-with(., 'mainprac')]) and not(ancestor::page-block/@pb-name[starts-with(., 'mainprac')]) and not(ancestor::book[contains(@doctype,'oh')] and ancestor::ata-page-block/@pb-name[starts-with(., 'inspect')]) and not(ancestor::book[contains(@doctype,'oh')] and ancestor::page-block/@pb-name[starts-with(., 'inspect')]) and not(ancestor::ata-page-block/@pb-name[(starts-with(., 'di') and 'di' = translate(., '0123456789', '') and string-length(.) &gt; 2) or starts-with(.,'service')]) and not(ancestor::page-block/@pb-name[(starts-with(., 'di') and 'di' = translate(., '0123456789', '') and string-length(.) &gt; 2) or starts-with(.,'service')]) and not(ancestor::book[contains(@doctype,'oh')] and ancestor::ata-page-block/@pb-name[starts-with(., 'repair')]) and not(ancestor::book[contains(@doctype,'oh')] and ancestor::page-block/@pb-name[starts-with(., 'repair')]) and not(ancestor::book[contains(@doctype,'oh')] and ancestor::ata-page-block/@pb-name[starts-with(., 'test')]) and not(ancestor::book[contains(@doctype,'oh')] and ancestor::page-block/@pb-name[starts-with(., 'test')]) and not(ancestor::ata-page-block/@pb-name[(starts-with(., 'cl') and 'cl' = translate(., '0123456789', '') and string-length(.) &gt; 2) or .='install' or starts-with(.,'rem-inst') or (starts-with(., 'reminst') and 'reminst' = translate(., '0123456789', '') and string-length(.) &gt; 7) or .='remove' or (starts-with(., 'repair') and 'repair' = translate(., '0123456789', '') and string-length(.) &gt; 6)]) and not(ancestor::page-block/@pb-name[(starts-with(., 'cl') and 'cl' = translate(., '0123456789', '') and string-length(.) &gt; 2) or .='install' or starts-with(.,'rem-inst') or (starts-with(., 'reminst') and 'reminst' = translate(., '0123456789', '') and string-length(.) &gt; 7) or .='remove' or (starts-with(., 'repair') and 'repair' = translate(., '0123456789', '') and string-length(.) &gt; 6)]) and not(ancestor::ata-page-block/@pb-name[starts-with(., 'assy') or (starts-with(., 'ic') and 'ic' = translate(., '0123456789', '') and string-length(.) &gt; 2) or (starts-with(., 'te') and 'te' = translate(., '0123456789', '') and string-length(.) &gt; 2) or .='test']) and not(ancestor::page-block/@pb-name[starts-with(., 'assy') or (starts-with(., 'ic') and 'ic' = translate(., '0123456789', '') and string-length(.) &gt; 2) or (starts-with(., 'te') and 'te' = translate(., '0123456789', '') and string-length(.) &gt; 2) or .='test']) and not(ancestor::ata-page-block/@pb-name[.='f-and-c' or starts-with(., 'inspect') or (starts-with(., 're') and 're' = translate(., '0123456789', '') and string-length(.) &gt; 2)]) and not(ancestor::page-block/@pb-name[.='f-and-c' or starts-with(., 'inspect') or (starts-with(., 're') and 're' = translate(., '0123456789', '') and string-length(.) &gt; 2)]) and not(ancestor::ata-page-block/@pb-name[(starts-with(., 'as') and 'as' = translate(., '0123456789', '') and string-length(.) &gt; 2) or starts-with(.,'clean') or (starts-with(., 'test') and 'test' = translate(., '0123456789', '') and string-length(.) &gt; 4)]) and (ancestor::page-block/@pb-name[(starts-with(., 'as') and 'as' = translate(., '0123456789', '') and string-length(.) &gt; 2) or starts-with(.,'clean') or (starts-with(., 'test') and 'test' = translate(., '0123456789', '') and string-length(.) &gt; 4)])">
            <xsl:variable name="node-id" select="generate-id(.)"/>
            <xsl:variable name="from-node" select="(ancestor-or-self::page-block[not(ancestor::page-block)])[last()]"/>
            <xsl:variable name="num">
               <xsl:variable name="candidate-num">
                  <xsl:choose>
                     <xsl:when test="count($from-node) &gt; 0">
                        <xsl:for-each select="$from-node/descendant-or-self::*[@_gte:count-as-id='cnt__figure^page-block.cnt']">
                           <xsl:if test="generate-id(.) = $node-id">
                              <xsl:value-of select="position()"/>
                           </xsl:if>
                        </xsl:for-each>
                     </xsl:when>
                     <xsl:otherwise>
                        <xsl:for-each select="//*[@_gte:count-as-id='cnt__figure^page-block.cnt'][not(ancestor-or-self::page-block)]">
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
            <xsl:variable name="offset">
               <!--Evaluate startAtXPath using the first counted element within the numbering scope as the context node-->
               <xsl:variable name="initial-num">
                  <xsl:choose>
                     <xsl:when test="count($from-node) &gt; 0">
                        <xsl:apply-templates select="($from-node/descendant-or-self::*[@_gte:count-as-id='cnt__figure^page-block.cnt'])[1]" mode="startat-xpath"/>
                     </xsl:when>
                     <xsl:otherwise>
                        <xsl:apply-templates select="(//*[@_gte:count-as-id='cnt__figure^page-block.cnt'][not(ancestor-or-self::page-block)])[1]" mode="startat-xpath"/>
                     </xsl:otherwise>
                  </xsl:choose>
               </xsl:variable>
               <xsl:choose>
                  <xsl:when test="string(number($initial-num))!='NaN'">
                     <xsl:value-of select="$initial-num"/>
                  </xsl:when>
                  <xsl:otherwise>1</xsl:otherwise>
               </xsl:choose>
            </xsl:variable>
            <xsl:choose>
               <xsl:when test="string(number($num))!='NaN'">
                  <xsl:number value="$num + $offset - 1" format="1"/>
               </xsl:when>
               <xsl:otherwise>?</xsl:otherwise>
            </xsl:choose>
         </xsl:when>
         <xsl:when test="not(ancestor::book[contains(@doctype,'oh')] and ancestor::ata-page-block/@pb-name[.='service']) and not(ancestor::book[contains(@doctype,'oh')] and ancestor::page-block/@pb-name[.='service']) and not(ancestor::ata-page-block/@pb-name[.='00awl' or .='00intro' or .='airlim' or .='awl' or .='awlror' or .='chapsect' or .='consume' or .='d-and-o' or .='frontmatte' or .='howtouse' or .='00howtouse' or .='intro' or .='nut_option' or .='oplimits' or .='sblist' or .='schedchk' or .='spectool' or .='timelim' or .='title-page']) and not(ancestor::page-block/@pb-name[.='00awl' or .='00intro' or .='airlim' or .='awl' or .='awlror' or .='chapsect' or .='consume' or .='d-and-o' or .='frontmatte' or .='howtouse' or .='00howtouse' or .='intro' or .='nut_option' or .='oplimits' or .='sblist' or .='schedchk' or .='spectool' or .='timelim' or .='title-page']) and not(ancestor::ata-page-block/@pb-name[(starts-with(., 'do') and 'do' = translate(., '0123456789', '') and string-length(.) &gt; 2) or (starts-with(., 'in') and 'in' = translate(., '0123456789', '') and string-length(.) &gt; 2) or (starts-with(., 'tl') and 'tl' = translate(., '0123456789', '') and string-length(.) &gt; 2) or .='toolsht' or .='trlist' or .='unschedc' or .='unschedchk']) and not(ancestor::page-block/@pb-name[(starts-with(., 'do') and 'do' = translate(., '0123456789', '') and string-length(.) &gt; 2) or (starts-with(., 'in') and 'in' = translate(., '0123456789', '') and string-length(.) &gt; 2) or (starts-with(., 'tl') and 'tl' = translate(., '0123456789', '') and string-length(.) &gt; 2) or .='toolsht' or .='trlist' or .='unschedc' or .='unschedchk']) and not(ancestor-or-self::ata-page-block[1]/@pb-name and string(ancestor-or-self::ata-page-block[1]/@pb-name)='intro00') and not(ancestor-or-self::page-block[1]/@pb-name and string(ancestor-or-self::page-block[1]/@pb-name)='intro00') and not(ancestor::ata-page-block/@pb-name[starts-with(., 'disassy') or starts-with(., 'fault')]) and not(ancestor::page-block/@pb-name[starts-with(., 'disassy') or starts-with(., 'fault')]) and not(ancestor::book[contains(@doctype,'oh')] and ancestor::ata-page-block/@pb-name[starts-with(., 'clean')]) and not(ancestor::book[contains(@doctype,'oh')] and ancestor::page-block/@pb-name[starts-with(., 'clean')]) and not(ancestor::ata-page-block/@pb-name[starts-with(., 'mainprac')]) and not(ancestor::page-block/@pb-name[starts-with(., 'mainprac')]) and not(ancestor::book[contains(@doctype,'oh')] and ancestor::ata-page-block/@pb-name[starts-with(., 'inspect')]) and not(ancestor::book[contains(@doctype,'oh')] and ancestor::page-block/@pb-name[starts-with(., 'inspect')]) and not(ancestor::ata-page-block/@pb-name[(starts-with(., 'di') and 'di' = translate(., '0123456789', '') and string-length(.) &gt; 2) or starts-with(.,'service')]) and not(ancestor::page-block/@pb-name[(starts-with(., 'di') and 'di' = translate(., '0123456789', '') and string-length(.) &gt; 2) or starts-with(.,'service')]) and not(ancestor::book[contains(@doctype,'oh')] and ancestor::ata-page-block/@pb-name[starts-with(., 'repair')]) and not(ancestor::book[contains(@doctype,'oh')] and ancestor::page-block/@pb-name[starts-with(., 'repair')]) and not(ancestor::book[contains(@doctype,'oh')] and ancestor::ata-page-block/@pb-name[starts-with(., 'test')]) and not(ancestor::book[contains(@doctype,'oh')] and ancestor::page-block/@pb-name[starts-with(., 'test')]) and not(ancestor::ata-page-block/@pb-name[(starts-with(., 'cl') and 'cl' = translate(., '0123456789', '') and string-length(.) &gt; 2) or .='install' or starts-with(.,'rem-inst') or (starts-with(., 'reminst') and 'reminst' = translate(., '0123456789', '') and string-length(.) &gt; 7) or .='remove' or (starts-with(., 'repair') and 'repair' = translate(., '0123456789', '') and string-length(.) &gt; 6)]) and not(ancestor::page-block/@pb-name[(starts-with(., 'cl') and 'cl' = translate(., '0123456789', '') and string-length(.) &gt; 2) or .='install' or starts-with(.,'rem-inst') or (starts-with(., 'reminst') and 'reminst' = translate(., '0123456789', '') and string-length(.) &gt; 7) or .='remove' or (starts-with(., 'repair') and 'repair' = translate(., '0123456789', '') and string-length(.) &gt; 6)]) and not(ancestor::ata-page-block/@pb-name[starts-with(., 'assy') or (starts-with(., 'ic') and 'ic' = translate(., '0123456789', '') and string-length(.) &gt; 2) or (starts-with(., 'te') and 'te' = translate(., '0123456789', '') and string-length(.) &gt; 2) or .='test']) and not(ancestor::page-block/@pb-name[starts-with(., 'assy') or (starts-with(., 'ic') and 'ic' = translate(., '0123456789', '') and string-length(.) &gt; 2) or (starts-with(., 'te') and 'te' = translate(., '0123456789', '') and string-length(.) &gt; 2) or .='test']) and not(ancestor::ata-page-block/@pb-name[.='f-and-c' or starts-with(., 'inspect') or (starts-with(., 're') and 're' = translate(., '0123456789', '') and string-length(.) &gt; 2)]) and not(ancestor::page-block/@pb-name[.='f-and-c' or starts-with(., 'inspect') or (starts-with(., 're') and 're' = translate(., '0123456789', '') and string-length(.) &gt; 2)]) and (ancestor::ata-page-block/@pb-name[(starts-with(., 'as') and 'as' = translate(., '0123456789', '') and string-length(.) &gt; 2) or starts-with(.,'clean') or (starts-with(., 'test') and 'test' = translate(., '0123456789', '') and string-length(.) &gt; 4)])">
            <xsl:variable name="node-id" select="generate-id(.)"/>
            <xsl:variable name="from-node" select="(ancestor-or-self::ata-page-block[not(ancestor::ata-page-block)])[last()]"/>
            <xsl:variable name="num">
               <xsl:variable name="candidate-num">
                  <xsl:choose>
                     <xsl:when test="count($from-node) &gt; 0">
                        <xsl:for-each select="$from-node/descendant-or-self::*[@_gte:count-as-id='cnt__figure^ata-page-block.cnt']">
                           <xsl:if test="generate-id(.) = $node-id">
                              <xsl:value-of select="position()"/>
                           </xsl:if>
                        </xsl:for-each>
                     </xsl:when>
                     <xsl:otherwise>
                        <xsl:for-each select="//*[@_gte:count-as-id='cnt__figure^ata-page-block.cnt'][not(ancestor-or-self::ata-page-block)]">
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
            <xsl:variable name="offset">
               <!--Evaluate startAtXPath using the first counted element within the numbering scope as the context node-->
               <xsl:variable name="initial-num">
                  <xsl:choose>
                     <xsl:when test="count($from-node) &gt; 0">
                        <xsl:apply-templates select="($from-node/descendant-or-self::*[@_gte:count-as-id='cnt__figure^ata-page-block.cnt'])[1]" mode="startat-xpath"/>
                     </xsl:when>
                     <xsl:otherwise>
                        <xsl:apply-templates select="(//*[@_gte:count-as-id='cnt__figure^ata-page-block.cnt'][not(ancestor-or-self::ata-page-block)])[1]" mode="startat-xpath"/>
                     </xsl:otherwise>
                  </xsl:choose>
               </xsl:variable>
               <xsl:choose>
                  <xsl:when test="string(number($initial-num))!='NaN'">
                     <xsl:value-of select="$initial-num"/>
                  </xsl:when>
                  <xsl:otherwise>1</xsl:otherwise>
               </xsl:choose>
            </xsl:variable>
            <xsl:choose>
               <xsl:when test="string(number($num))!='NaN'">
                  <xsl:number value="$num + $offset - 1" format="1"/>
               </xsl:when>
               <xsl:otherwise>?</xsl:otherwise>
            </xsl:choose>
         </xsl:when>
         <xsl:when test="not(ancestor::book[contains(@doctype,'oh')] and ancestor::ata-page-block/@pb-name[.='service']) and not(ancestor::book[contains(@doctype,'oh')] and ancestor::page-block/@pb-name[.='service']) and not(ancestor::ata-page-block/@pb-name[.='00awl' or .='00intro' or .='airlim' or .='awl' or .='awlror' or .='chapsect' or .='consume' or .='d-and-o' or .='frontmatte' or .='howtouse' or .='00howtouse' or .='intro' or .='nut_option' or .='oplimits' or .='sblist' or .='schedchk' or .='spectool' or .='timelim' or .='title-page']) and not(ancestor::page-block/@pb-name[.='00awl' or .='00intro' or .='airlim' or .='awl' or .='awlror' or .='chapsect' or .='consume' or .='d-and-o' or .='frontmatte' or .='howtouse' or .='00howtouse' or .='intro' or .='nut_option' or .='oplimits' or .='sblist' or .='schedchk' or .='spectool' or .='timelim' or .='title-page']) and not(ancestor::ata-page-block/@pb-name[(starts-with(., 'do') and 'do' = translate(., '0123456789', '') and string-length(.) &gt; 2) or (starts-with(., 'in') and 'in' = translate(., '0123456789', '') and string-length(.) &gt; 2) or (starts-with(., 'tl') and 'tl' = translate(., '0123456789', '') and string-length(.) &gt; 2) or .='toolsht' or .='trlist' or .='unschedc' or .='unschedchk']) and not(ancestor::page-block/@pb-name[(starts-with(., 'do') and 'do' = translate(., '0123456789', '') and string-length(.) &gt; 2) or (starts-with(., 'in') and 'in' = translate(., '0123456789', '') and string-length(.) &gt; 2) or (starts-with(., 'tl') and 'tl' = translate(., '0123456789', '') and string-length(.) &gt; 2) or .='toolsht' or .='trlist' or .='unschedc' or .='unschedchk']) and not(ancestor-or-self::ata-page-block[1]/@pb-name and string(ancestor-or-self::ata-page-block[1]/@pb-name)='intro00') and not(ancestor-or-self::page-block[1]/@pb-name and string(ancestor-or-self::page-block[1]/@pb-name)='intro00') and not(ancestor::ata-page-block/@pb-name[starts-with(., 'disassy') or starts-with(., 'fault')]) and not(ancestor::page-block/@pb-name[starts-with(., 'disassy') or starts-with(., 'fault')]) and not(ancestor::book[contains(@doctype,'oh')] and ancestor::ata-page-block/@pb-name[starts-with(., 'clean')]) and not(ancestor::book[contains(@doctype,'oh')] and ancestor::page-block/@pb-name[starts-with(., 'clean')]) and not(ancestor::ata-page-block/@pb-name[starts-with(., 'mainprac')]) and not(ancestor::page-block/@pb-name[starts-with(., 'mainprac')]) and not(ancestor::book[contains(@doctype,'oh')] and ancestor::ata-page-block/@pb-name[starts-with(., 'inspect')]) and not(ancestor::book[contains(@doctype,'oh')] and ancestor::page-block/@pb-name[starts-with(., 'inspect')]) and not(ancestor::ata-page-block/@pb-name[(starts-with(., 'di') and 'di' = translate(., '0123456789', '') and string-length(.) &gt; 2) or starts-with(.,'service')]) and not(ancestor::page-block/@pb-name[(starts-with(., 'di') and 'di' = translate(., '0123456789', '') and string-length(.) &gt; 2) or starts-with(.,'service')]) and not(ancestor::book[contains(@doctype,'oh')] and ancestor::ata-page-block/@pb-name[starts-with(., 'repair')]) and not(ancestor::book[contains(@doctype,'oh')] and ancestor::page-block/@pb-name[starts-with(., 'repair')]) and not(ancestor::book[contains(@doctype,'oh')] and ancestor::ata-page-block/@pb-name[starts-with(., 'test')]) and not(ancestor::book[contains(@doctype,'oh')] and ancestor::page-block/@pb-name[starts-with(., 'test')]) and not(ancestor::ata-page-block/@pb-name[(starts-with(., 'cl') and 'cl' = translate(., '0123456789', '') and string-length(.) &gt; 2) or .='install' or starts-with(.,'rem-inst') or (starts-with(., 'reminst') and 'reminst' = translate(., '0123456789', '') and string-length(.) &gt; 7) or .='remove' or (starts-with(., 'repair') and 'repair' = translate(., '0123456789', '') and string-length(.) &gt; 6)]) and not(ancestor::page-block/@pb-name[(starts-with(., 'cl') and 'cl' = translate(., '0123456789', '') and string-length(.) &gt; 2) or .='install' or starts-with(.,'rem-inst') or (starts-with(., 'reminst') and 'reminst' = translate(., '0123456789', '') and string-length(.) &gt; 7) or .='remove' or (starts-with(., 'repair') and 'repair' = translate(., '0123456789', '') and string-length(.) &gt; 6)]) and not(ancestor::ata-page-block/@pb-name[starts-with(., 'assy') or (starts-with(., 'ic') and 'ic' = translate(., '0123456789', '') and string-length(.) &gt; 2) or (starts-with(., 'te') and 'te' = translate(., '0123456789', '') and string-length(.) &gt; 2) or .='test']) and not(ancestor::page-block/@pb-name[starts-with(., 'assy') or (starts-with(., 'ic') and 'ic' = translate(., '0123456789', '') and string-length(.) &gt; 2) or (starts-with(., 'te') and 'te' = translate(., '0123456789', '') and string-length(.) &gt; 2) or .='test']) and not(ancestor::ata-page-block/@pb-name[.='f-and-c' or starts-with(., 'inspect') or (starts-with(., 're') and 're' = translate(., '0123456789', '') and string-length(.) &gt; 2)]) and (ancestor::page-block/@pb-name[.='f-and-c' or starts-with(., 'inspect') or (starts-with(., 're') and 're' = translate(., '0123456789', '') and string-length(.) &gt; 2)])">
            <xsl:variable name="node-id" select="generate-id(.)"/>
            <xsl:variable name="from-node" select="(ancestor-or-self::page-block[not(ancestor::page-block)])[last()]"/>
            <xsl:variable name="num">
               <xsl:variable name="candidate-num">
                  <xsl:choose>
                     <xsl:when test="count($from-node) &gt; 0">
                        <xsl:for-each select="$from-node/descendant-or-self::*[@_gte:count-as-id='cnt__figure^page-block.cnt']">
                           <xsl:if test="generate-id(.) = $node-id">
                              <xsl:value-of select="position()"/>
                           </xsl:if>
                        </xsl:for-each>
                     </xsl:when>
                     <xsl:otherwise>
                        <xsl:for-each select="//*[@_gte:count-as-id='cnt__figure^page-block.cnt'][not(ancestor-or-self::page-block)]">
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
            <xsl:variable name="offset">
               <!--Evaluate startAtXPath using the first counted element within the numbering scope as the context node-->
               <xsl:variable name="initial-num">
                  <xsl:choose>
                     <xsl:when test="count($from-node) &gt; 0">
                        <xsl:apply-templates select="($from-node/descendant-or-self::*[@_gte:count-as-id='cnt__figure^page-block.cnt'])[1]" mode="startat-xpath"/>
                     </xsl:when>
                     <xsl:otherwise>
                        <xsl:apply-templates select="(//*[@_gte:count-as-id='cnt__figure^page-block.cnt'][not(ancestor-or-self::page-block)])[1]" mode="startat-xpath"/>
                     </xsl:otherwise>
                  </xsl:choose>
               </xsl:variable>
               <xsl:choose>
                  <xsl:when test="string(number($initial-num))!='NaN'">
                     <xsl:value-of select="$initial-num"/>
                  </xsl:when>
                  <xsl:otherwise>1</xsl:otherwise>
               </xsl:choose>
            </xsl:variable>
            <xsl:choose>
               <xsl:when test="string(number($num))!='NaN'">
                  <xsl:number value="$num + $offset - 1" format="1"/>
               </xsl:when>
               <xsl:otherwise>?</xsl:otherwise>
            </xsl:choose>
         </xsl:when>
         <xsl:when test="not(ancestor::book[contains(@doctype,'oh')] and ancestor::ata-page-block/@pb-name[.='service']) and not(ancestor::book[contains(@doctype,'oh')] and ancestor::page-block/@pb-name[.='service']) and not(ancestor::ata-page-block/@pb-name[.='00awl' or .='00intro' or .='airlim' or .='awl' or .='awlror' or .='chapsect' or .='consume' or .='d-and-o' or .='frontmatte' or .='howtouse' or .='00howtouse' or .='intro' or .='nut_option' or .='oplimits' or .='sblist' or .='schedchk' or .='spectool' or .='timelim' or .='title-page']) and not(ancestor::page-block/@pb-name[.='00awl' or .='00intro' or .='airlim' or .='awl' or .='awlror' or .='chapsect' or .='consume' or .='d-and-o' or .='frontmatte' or .='howtouse' or .='00howtouse' or .='intro' or .='nut_option' or .='oplimits' or .='sblist' or .='schedchk' or .='spectool' or .='timelim' or .='title-page']) and not(ancestor::ata-page-block/@pb-name[(starts-with(., 'do') and 'do' = translate(., '0123456789', '') and string-length(.) &gt; 2) or (starts-with(., 'in') and 'in' = translate(., '0123456789', '') and string-length(.) &gt; 2) or (starts-with(., 'tl') and 'tl' = translate(., '0123456789', '') and string-length(.) &gt; 2) or .='toolsht' or .='trlist' or .='unschedc' or .='unschedchk']) and not(ancestor::page-block/@pb-name[(starts-with(., 'do') and 'do' = translate(., '0123456789', '') and string-length(.) &gt; 2) or (starts-with(., 'in') and 'in' = translate(., '0123456789', '') and string-length(.) &gt; 2) or (starts-with(., 'tl') and 'tl' = translate(., '0123456789', '') and string-length(.) &gt; 2) or .='toolsht' or .='trlist' or .='unschedc' or .='unschedchk']) and not(ancestor-or-self::ata-page-block[1]/@pb-name and string(ancestor-or-self::ata-page-block[1]/@pb-name)='intro00') and not(ancestor-or-self::page-block[1]/@pb-name and string(ancestor-or-self::page-block[1]/@pb-name)='intro00') and not(ancestor::ata-page-block/@pb-name[starts-with(., 'disassy') or starts-with(., 'fault')]) and not(ancestor::page-block/@pb-name[starts-with(., 'disassy') or starts-with(., 'fault')]) and not(ancestor::book[contains(@doctype,'oh')] and ancestor::ata-page-block/@pb-name[starts-with(., 'clean')]) and not(ancestor::book[contains(@doctype,'oh')] and ancestor::page-block/@pb-name[starts-with(., 'clean')]) and not(ancestor::ata-page-block/@pb-name[starts-with(., 'mainprac')]) and not(ancestor::page-block/@pb-name[starts-with(., 'mainprac')]) and not(ancestor::book[contains(@doctype,'oh')] and ancestor::ata-page-block/@pb-name[starts-with(., 'inspect')]) and not(ancestor::book[contains(@doctype,'oh')] and ancestor::page-block/@pb-name[starts-with(., 'inspect')]) and not(ancestor::ata-page-block/@pb-name[(starts-with(., 'di') and 'di' = translate(., '0123456789', '') and string-length(.) &gt; 2) or starts-with(.,'service')]) and not(ancestor::page-block/@pb-name[(starts-with(., 'di') and 'di' = translate(., '0123456789', '') and string-length(.) &gt; 2) or starts-with(.,'service')]) and not(ancestor::book[contains(@doctype,'oh')] and ancestor::ata-page-block/@pb-name[starts-with(., 'repair')]) and not(ancestor::book[contains(@doctype,'oh')] and ancestor::page-block/@pb-name[starts-with(., 'repair')]) and not(ancestor::book[contains(@doctype,'oh')] and ancestor::ata-page-block/@pb-name[starts-with(., 'test')]) and not(ancestor::book[contains(@doctype,'oh')] and ancestor::page-block/@pb-name[starts-with(., 'test')]) and not(ancestor::ata-page-block/@pb-name[(starts-with(., 'cl') and 'cl' = translate(., '0123456789', '') and string-length(.) &gt; 2) or .='install' or starts-with(.,'rem-inst') or (starts-with(., 'reminst') and 'reminst' = translate(., '0123456789', '') and string-length(.) &gt; 7) or .='remove' or (starts-with(., 'repair') and 'repair' = translate(., '0123456789', '') and string-length(.) &gt; 6)]) and not(ancestor::page-block/@pb-name[(starts-with(., 'cl') and 'cl' = translate(., '0123456789', '') and string-length(.) &gt; 2) or .='install' or starts-with(.,'rem-inst') or (starts-with(., 'reminst') and 'reminst' = translate(., '0123456789', '') and string-length(.) &gt; 7) or .='remove' or (starts-with(., 'repair') and 'repair' = translate(., '0123456789', '') and string-length(.) &gt; 6)]) and not(ancestor::ata-page-block/@pb-name[starts-with(., 'assy') or (starts-with(., 'ic') and 'ic' = translate(., '0123456789', '') and string-length(.) &gt; 2) or (starts-with(., 'te') and 'te' = translate(., '0123456789', '') and string-length(.) &gt; 2) or .='test']) and not(ancestor::page-block/@pb-name[starts-with(., 'assy') or (starts-with(., 'ic') and 'ic' = translate(., '0123456789', '') and string-length(.) &gt; 2) or (starts-with(., 'te') and 'te' = translate(., '0123456789', '') and string-length(.) &gt; 2) or .='test']) and (ancestor::ata-page-block/@pb-name[.='f-and-c' or starts-with(., 'inspect') or (starts-with(., 're') and 're' = translate(., '0123456789', '') and string-length(.) &gt; 2)])">
            <xsl:variable name="node-id" select="generate-id(.)"/>
            <xsl:variable name="from-node" select="(ancestor-or-self::ata-page-block[not(ancestor::ata-page-block)])[last()]"/>
            <xsl:variable name="num">
               <xsl:variable name="candidate-num">
                  <xsl:choose>
                     <xsl:when test="count($from-node) &gt; 0">
                        <xsl:for-each select="$from-node/descendant-or-self::*[@_gte:count-as-id='cnt__figure^ata-page-block.cnt']">
                           <xsl:if test="generate-id(.) = $node-id">
                              <xsl:value-of select="position()"/>
                           </xsl:if>
                        </xsl:for-each>
                     </xsl:when>
                     <xsl:otherwise>
                        <xsl:for-each select="//*[@_gte:count-as-id='cnt__figure^ata-page-block.cnt'][not(ancestor-or-self::ata-page-block)]">
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
            <xsl:variable name="offset">
               <!--Evaluate startAtXPath using the first counted element within the numbering scope as the context node-->
               <xsl:variable name="initial-num">
                  <xsl:choose>
                     <xsl:when test="count($from-node) &gt; 0">
                        <xsl:apply-templates select="($from-node/descendant-or-self::*[@_gte:count-as-id='cnt__figure^ata-page-block.cnt'])[1]" mode="startat-xpath"/>
                     </xsl:when>
                     <xsl:otherwise>
                        <xsl:apply-templates select="(//*[@_gte:count-as-id='cnt__figure^ata-page-block.cnt'][not(ancestor-or-self::ata-page-block)])[1]" mode="startat-xpath"/>
                     </xsl:otherwise>
                  </xsl:choose>
               </xsl:variable>
               <xsl:choose>
                  <xsl:when test="string(number($initial-num))!='NaN'">
                     <xsl:value-of select="$initial-num"/>
                  </xsl:when>
                  <xsl:otherwise>1</xsl:otherwise>
               </xsl:choose>
            </xsl:variable>
            <xsl:choose>
               <xsl:when test="string(number($num))!='NaN'">
                  <xsl:number value="$num + $offset - 1" format="1"/>
               </xsl:when>
               <xsl:otherwise>?</xsl:otherwise>
            </xsl:choose>
         </xsl:when>
         <xsl:when test="not(ancestor::book[contains(@doctype,'oh')] and ancestor::ata-page-block/@pb-name[.='service']) and not(ancestor::book[contains(@doctype,'oh')] and ancestor::page-block/@pb-name[.='service']) and not(ancestor::ata-page-block/@pb-name[.='00awl' or .='00intro' or .='airlim' or .='awl' or .='awlror' or .='chapsect' or .='consume' or .='d-and-o' or .='frontmatte' or .='howtouse' or .='00howtouse' or .='intro' or .='nut_option' or .='oplimits' or .='sblist' or .='schedchk' or .='spectool' or .='timelim' or .='title-page']) and not(ancestor::page-block/@pb-name[.='00awl' or .='00intro' or .='airlim' or .='awl' or .='awlror' or .='chapsect' or .='consume' or .='d-and-o' or .='frontmatte' or .='howtouse' or .='00howtouse' or .='intro' or .='nut_option' or .='oplimits' or .='sblist' or .='schedchk' or .='spectool' or .='timelim' or .='title-page']) and not(ancestor::ata-page-block/@pb-name[(starts-with(., 'do') and 'do' = translate(., '0123456789', '') and string-length(.) &gt; 2) or (starts-with(., 'in') and 'in' = translate(., '0123456789', '') and string-length(.) &gt; 2) or (starts-with(., 'tl') and 'tl' = translate(., '0123456789', '') and string-length(.) &gt; 2) or .='toolsht' or .='trlist' or .='unschedc' or .='unschedchk']) and not(ancestor::page-block/@pb-name[(starts-with(., 'do') and 'do' = translate(., '0123456789', '') and string-length(.) &gt; 2) or (starts-with(., 'in') and 'in' = translate(., '0123456789', '') and string-length(.) &gt; 2) or (starts-with(., 'tl') and 'tl' = translate(., '0123456789', '') and string-length(.) &gt; 2) or .='toolsht' or .='trlist' or .='unschedc' or .='unschedchk']) and not(ancestor-or-self::ata-page-block[1]/@pb-name and string(ancestor-or-self::ata-page-block[1]/@pb-name)='intro00') and not(ancestor-or-self::page-block[1]/@pb-name and string(ancestor-or-self::page-block[1]/@pb-name)='intro00') and not(ancestor::ata-page-block/@pb-name[starts-with(., 'disassy') or starts-with(., 'fault')]) and not(ancestor::page-block/@pb-name[starts-with(., 'disassy') or starts-with(., 'fault')]) and not(ancestor::book[contains(@doctype,'oh')] and ancestor::ata-page-block/@pb-name[starts-with(., 'clean')]) and not(ancestor::book[contains(@doctype,'oh')] and ancestor::page-block/@pb-name[starts-with(., 'clean')]) and not(ancestor::ata-page-block/@pb-name[starts-with(., 'mainprac')]) and not(ancestor::page-block/@pb-name[starts-with(., 'mainprac')]) and not(ancestor::book[contains(@doctype,'oh')] and ancestor::ata-page-block/@pb-name[starts-with(., 'inspect')]) and not(ancestor::book[contains(@doctype,'oh')] and ancestor::page-block/@pb-name[starts-with(., 'inspect')]) and not(ancestor::ata-page-block/@pb-name[(starts-with(., 'di') and 'di' = translate(., '0123456789', '') and string-length(.) &gt; 2) or starts-with(.,'service')]) and not(ancestor::page-block/@pb-name[(starts-with(., 'di') and 'di' = translate(., '0123456789', '') and string-length(.) &gt; 2) or starts-with(.,'service')]) and not(ancestor::book[contains(@doctype,'oh')] and ancestor::ata-page-block/@pb-name[starts-with(., 'repair')]) and not(ancestor::book[contains(@doctype,'oh')] and ancestor::page-block/@pb-name[starts-with(., 'repair')]) and not(ancestor::book[contains(@doctype,'oh')] and ancestor::ata-page-block/@pb-name[starts-with(., 'test')]) and not(ancestor::book[contains(@doctype,'oh')] and ancestor::page-block/@pb-name[starts-with(., 'test')]) and not(ancestor::ata-page-block/@pb-name[(starts-with(., 'cl') and 'cl' = translate(., '0123456789', '') and string-length(.) &gt; 2) or .='install' or starts-with(.,'rem-inst') or (starts-with(., 'reminst') and 'reminst' = translate(., '0123456789', '') and string-length(.) &gt; 7) or .='remove' or (starts-with(., 'repair') and 'repair' = translate(., '0123456789', '') and string-length(.) &gt; 6)]) and not(ancestor::page-block/@pb-name[(starts-with(., 'cl') and 'cl' = translate(., '0123456789', '') and string-length(.) &gt; 2) or .='install' or starts-with(.,'rem-inst') or (starts-with(., 'reminst') and 'reminst' = translate(., '0123456789', '') and string-length(.) &gt; 7) or .='remove' or (starts-with(., 'repair') and 'repair' = translate(., '0123456789', '') and string-length(.) &gt; 6)]) and not(ancestor::ata-page-block/@pb-name[starts-with(., 'assy') or (starts-with(., 'ic') and 'ic' = translate(., '0123456789', '') and string-length(.) &gt; 2) or (starts-with(., 'te') and 'te' = translate(., '0123456789', '') and string-length(.) &gt; 2) or .='test']) and (ancestor::page-block/@pb-name[starts-with(., 'assy') or (starts-with(., 'ic') and 'ic' = translate(., '0123456789', '') and string-length(.) &gt; 2) or (starts-with(., 'te') and 'te' = translate(., '0123456789', '') and string-length(.) &gt; 2) or .='test'])">
            <xsl:variable name="node-id" select="generate-id(.)"/>
            <xsl:variable name="from-node" select="(ancestor-or-self::page-block[not(ancestor::page-block)])[last()]"/>
            <xsl:variable name="num">
               <xsl:variable name="candidate-num">
                  <xsl:choose>
                     <xsl:when test="count($from-node) &gt; 0">
                        <xsl:for-each select="$from-node/descendant-or-self::*[@_gte:count-as-id='cnt__figure^page-block.cnt']">
                           <xsl:if test="generate-id(.) = $node-id">
                              <xsl:value-of select="position()"/>
                           </xsl:if>
                        </xsl:for-each>
                     </xsl:when>
                     <xsl:otherwise>
                        <xsl:for-each select="//*[@_gte:count-as-id='cnt__figure^page-block.cnt'][not(ancestor-or-self::page-block)]">
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
            <xsl:variable name="offset">
               <!--Evaluate startAtXPath using the first counted element within the numbering scope as the context node-->
               <xsl:variable name="initial-num">
                  <xsl:choose>
                     <xsl:when test="count($from-node) &gt; 0">
                        <xsl:apply-templates select="($from-node/descendant-or-self::*[@_gte:count-as-id='cnt__figure^page-block.cnt'])[1]" mode="startat-xpath"/>
                     </xsl:when>
                     <xsl:otherwise>
                        <xsl:apply-templates select="(//*[@_gte:count-as-id='cnt__figure^page-block.cnt'][not(ancestor-or-self::page-block)])[1]" mode="startat-xpath"/>
                     </xsl:otherwise>
                  </xsl:choose>
               </xsl:variable>
               <xsl:choose>
                  <xsl:when test="string(number($initial-num))!='NaN'">
                     <xsl:value-of select="$initial-num"/>
                  </xsl:when>
                  <xsl:otherwise>1</xsl:otherwise>
               </xsl:choose>
            </xsl:variable>
            <xsl:choose>
               <xsl:when test="string(number($num))!='NaN'">
                  <xsl:number value="$num + $offset - 1" format="1"/>
               </xsl:when>
               <xsl:otherwise>?</xsl:otherwise>
            </xsl:choose>
         </xsl:when>
         <xsl:when test="not(ancestor::book[contains(@doctype,'oh')] and ancestor::ata-page-block/@pb-name[.='service']) and not(ancestor::book[contains(@doctype,'oh')] and ancestor::page-block/@pb-name[.='service']) and not(ancestor::ata-page-block/@pb-name[.='00awl' or .='00intro' or .='airlim' or .='awl' or .='awlror' or .='chapsect' or .='consume' or .='d-and-o' or .='frontmatte' or .='howtouse' or .='00howtouse' or .='intro' or .='nut_option' or .='oplimits' or .='sblist' or .='schedchk' or .='spectool' or .='timelim' or .='title-page']) and not(ancestor::page-block/@pb-name[.='00awl' or .='00intro' or .='airlim' or .='awl' or .='awlror' or .='chapsect' or .='consume' or .='d-and-o' or .='frontmatte' or .='howtouse' or .='00howtouse' or .='intro' or .='nut_option' or .='oplimits' or .='sblist' or .='schedchk' or .='spectool' or .='timelim' or .='title-page']) and not(ancestor::ata-page-block/@pb-name[(starts-with(., 'do') and 'do' = translate(., '0123456789', '') and string-length(.) &gt; 2) or (starts-with(., 'in') and 'in' = translate(., '0123456789', '') and string-length(.) &gt; 2) or (starts-with(., 'tl') and 'tl' = translate(., '0123456789', '') and string-length(.) &gt; 2) or .='toolsht' or .='trlist' or .='unschedc' or .='unschedchk']) and not(ancestor::page-block/@pb-name[(starts-with(., 'do') and 'do' = translate(., '0123456789', '') and string-length(.) &gt; 2) or (starts-with(., 'in') and 'in' = translate(., '0123456789', '') and string-length(.) &gt; 2) or (starts-with(., 'tl') and 'tl' = translate(., '0123456789', '') and string-length(.) &gt; 2) or .='toolsht' or .='trlist' or .='unschedc' or .='unschedchk']) and not(ancestor-or-self::ata-page-block[1]/@pb-name and string(ancestor-or-self::ata-page-block[1]/@pb-name)='intro00') and not(ancestor-or-self::page-block[1]/@pb-name and string(ancestor-or-self::page-block[1]/@pb-name)='intro00') and not(ancestor::ata-page-block/@pb-name[starts-with(., 'disassy') or starts-with(., 'fault')]) and not(ancestor::page-block/@pb-name[starts-with(., 'disassy') or starts-with(., 'fault')]) and not(ancestor::book[contains(@doctype,'oh')] and ancestor::ata-page-block/@pb-name[starts-with(., 'clean')]) and not(ancestor::book[contains(@doctype,'oh')] and ancestor::page-block/@pb-name[starts-with(., 'clean')]) and not(ancestor::ata-page-block/@pb-name[starts-with(., 'mainprac')]) and not(ancestor::page-block/@pb-name[starts-with(., 'mainprac')]) and not(ancestor::book[contains(@doctype,'oh')] and ancestor::ata-page-block/@pb-name[starts-with(., 'inspect')]) and not(ancestor::book[contains(@doctype,'oh')] and ancestor::page-block/@pb-name[starts-with(., 'inspect')]) and not(ancestor::ata-page-block/@pb-name[(starts-with(., 'di') and 'di' = translate(., '0123456789', '') and string-length(.) &gt; 2) or starts-with(.,'service')]) and not(ancestor::page-block/@pb-name[(starts-with(., 'di') and 'di' = translate(., '0123456789', '') and string-length(.) &gt; 2) or starts-with(.,'service')]) and not(ancestor::book[contains(@doctype,'oh')] and ancestor::ata-page-block/@pb-name[starts-with(., 'repair')]) and not(ancestor::book[contains(@doctype,'oh')] and ancestor::page-block/@pb-name[starts-with(., 'repair')]) and not(ancestor::book[contains(@doctype,'oh')] and ancestor::ata-page-block/@pb-name[starts-with(., 'test')]) and not(ancestor::book[contains(@doctype,'oh')] and ancestor::page-block/@pb-name[starts-with(., 'test')]) and not(ancestor::ata-page-block/@pb-name[(starts-with(., 'cl') and 'cl' = translate(., '0123456789', '') and string-length(.) &gt; 2) or .='install' or starts-with(.,'rem-inst') or (starts-with(., 'reminst') and 'reminst' = translate(., '0123456789', '') and string-length(.) &gt; 7) or .='remove' or (starts-with(., 'repair') and 'repair' = translate(., '0123456789', '') and string-length(.) &gt; 6)]) and not(ancestor::page-block/@pb-name[(starts-with(., 'cl') and 'cl' = translate(., '0123456789', '') and string-length(.) &gt; 2) or .='install' or starts-with(.,'rem-inst') or (starts-with(., 'reminst') and 'reminst' = translate(., '0123456789', '') and string-length(.) &gt; 7) or .='remove' or (starts-with(., 'repair') and 'repair' = translate(., '0123456789', '') and string-length(.) &gt; 6)]) and (ancestor::ata-page-block/@pb-name[starts-with(., 'assy') or (starts-with(., 'ic') and 'ic' = translate(., '0123456789', '') and string-length(.) &gt; 2) or (starts-with(., 'te') and 'te' = translate(., '0123456789', '') and string-length(.) &gt; 2) or .='test'])">
            <xsl:variable name="node-id" select="generate-id(.)"/>
            <xsl:variable name="from-node" select="(ancestor-or-self::ata-page-block[not(ancestor::ata-page-block)])[last()]"/>
            <xsl:variable name="num">
               <xsl:variable name="candidate-num">
                  <xsl:choose>
                     <xsl:when test="count($from-node) &gt; 0">
                        <xsl:for-each select="$from-node/descendant-or-self::*[@_gte:count-as-id='cnt__figure^ata-page-block.cnt']">
                           <xsl:if test="generate-id(.) = $node-id">
                              <xsl:value-of select="position()"/>
                           </xsl:if>
                        </xsl:for-each>
                     </xsl:when>
                     <xsl:otherwise>
                        <xsl:for-each select="//*[@_gte:count-as-id='cnt__figure^ata-page-block.cnt'][not(ancestor-or-self::ata-page-block)]">
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
            <xsl:variable name="offset">
               <!--Evaluate startAtXPath using the first counted element within the numbering scope as the context node-->
               <xsl:variable name="initial-num">
                  <xsl:choose>
                     <xsl:when test="count($from-node) &gt; 0">
                        <xsl:apply-templates select="($from-node/descendant-or-self::*[@_gte:count-as-id='cnt__figure^ata-page-block.cnt'])[1]" mode="startat-xpath"/>
                     </xsl:when>
                     <xsl:otherwise>
                        <xsl:apply-templates select="(//*[@_gte:count-as-id='cnt__figure^ata-page-block.cnt'][not(ancestor-or-self::ata-page-block)])[1]" mode="startat-xpath"/>
                     </xsl:otherwise>
                  </xsl:choose>
               </xsl:variable>
               <xsl:choose>
                  <xsl:when test="string(number($initial-num))!='NaN'">
                     <xsl:value-of select="$initial-num"/>
                  </xsl:when>
                  <xsl:otherwise>1</xsl:otherwise>
               </xsl:choose>
            </xsl:variable>
            <xsl:choose>
               <xsl:when test="string(number($num))!='NaN'">
                  <xsl:number value="$num + $offset - 1" format="1"/>
               </xsl:when>
               <xsl:otherwise>?</xsl:otherwise>
            </xsl:choose>
         </xsl:when>
         <xsl:when test="not(ancestor::book[contains(@doctype,'oh')] and ancestor::ata-page-block/@pb-name[.='service']) and not(ancestor::book[contains(@doctype,'oh')] and ancestor::page-block/@pb-name[.='service']) and not(ancestor::ata-page-block/@pb-name[.='00awl' or .='00intro' or .='airlim' or .='awl' or .='awlror' or .='chapsect' or .='consume' or .='d-and-o' or .='frontmatte' or .='howtouse' or .='00howtouse' or .='intro' or .='nut_option' or .='oplimits' or .='sblist' or .='schedchk' or .='spectool' or .='timelim' or .='title-page']) and not(ancestor::page-block/@pb-name[.='00awl' or .='00intro' or .='airlim' or .='awl' or .='awlror' or .='chapsect' or .='consume' or .='d-and-o' or .='frontmatte' or .='howtouse' or .='00howtouse' or .='intro' or .='nut_option' or .='oplimits' or .='sblist' or .='schedchk' or .='spectool' or .='timelim' or .='title-page']) and not(ancestor::ata-page-block/@pb-name[(starts-with(., 'do') and 'do' = translate(., '0123456789', '') and string-length(.) &gt; 2) or (starts-with(., 'in') and 'in' = translate(., '0123456789', '') and string-length(.) &gt; 2) or (starts-with(., 'tl') and 'tl' = translate(., '0123456789', '') and string-length(.) &gt; 2) or .='toolsht' or .='trlist' or .='unschedc' or .='unschedchk']) and not(ancestor::page-block/@pb-name[(starts-with(., 'do') and 'do' = translate(., '0123456789', '') and string-length(.) &gt; 2) or (starts-with(., 'in') and 'in' = translate(., '0123456789', '') and string-length(.) &gt; 2) or (starts-with(., 'tl') and 'tl' = translate(., '0123456789', '') and string-length(.) &gt; 2) or .='toolsht' or .='trlist' or .='unschedc' or .='unschedchk']) and not(ancestor-or-self::ata-page-block[1]/@pb-name and string(ancestor-or-self::ata-page-block[1]/@pb-name)='intro00') and not(ancestor-or-self::page-block[1]/@pb-name and string(ancestor-or-self::page-block[1]/@pb-name)='intro00') and not(ancestor::ata-page-block/@pb-name[starts-with(., 'disassy') or starts-with(., 'fault')]) and not(ancestor::page-block/@pb-name[starts-with(., 'disassy') or starts-with(., 'fault')]) and not(ancestor::book[contains(@doctype,'oh')] and ancestor::ata-page-block/@pb-name[starts-with(., 'clean')]) and not(ancestor::book[contains(@doctype,'oh')] and ancestor::page-block/@pb-name[starts-with(., 'clean')]) and not(ancestor::ata-page-block/@pb-name[starts-with(., 'mainprac')]) and not(ancestor::page-block/@pb-name[starts-with(., 'mainprac')]) and not(ancestor::book[contains(@doctype,'oh')] and ancestor::ata-page-block/@pb-name[starts-with(., 'inspect')]) and not(ancestor::book[contains(@doctype,'oh')] and ancestor::page-block/@pb-name[starts-with(., 'inspect')]) and not(ancestor::ata-page-block/@pb-name[(starts-with(., 'di') and 'di' = translate(., '0123456789', '') and string-length(.) &gt; 2) or starts-with(.,'service')]) and not(ancestor::page-block/@pb-name[(starts-with(., 'di') and 'di' = translate(., '0123456789', '') and string-length(.) &gt; 2) or starts-with(.,'service')]) and not(ancestor::book[contains(@doctype,'oh')] and ancestor::ata-page-block/@pb-name[starts-with(., 'repair')]) and not(ancestor::book[contains(@doctype,'oh')] and ancestor::page-block/@pb-name[starts-with(., 'repair')]) and not(ancestor::book[contains(@doctype,'oh')] and ancestor::ata-page-block/@pb-name[starts-with(., 'test')]) and not(ancestor::book[contains(@doctype,'oh')] and ancestor::page-block/@pb-name[starts-with(., 'test')]) and not(ancestor::ata-page-block/@pb-name[(starts-with(., 'cl') and 'cl' = translate(., '0123456789', '') and string-length(.) &gt; 2) or .='install' or starts-with(.,'rem-inst') or (starts-with(., 'reminst') and 'reminst' = translate(., '0123456789', '') and string-length(.) &gt; 7) or .='remove' or (starts-with(., 'repair') and 'repair' = translate(., '0123456789', '') and string-length(.) &gt; 6)]) and (ancestor::page-block/@pb-name[(starts-with(., 'cl') and 'cl' = translate(., '0123456789', '') and string-length(.) &gt; 2) or .='install' or starts-with(.,'rem-inst') or (starts-with(., 'reminst') and 'reminst' = translate(., '0123456789', '') and string-length(.) &gt; 7) or .='remove' or (starts-with(., 'repair') and 'repair' = translate(., '0123456789', '') and string-length(.) &gt; 6)])">
            <xsl:variable name="node-id" select="generate-id(.)"/>
            <xsl:variable name="from-node" select="(ancestor-or-self::page-block[not(ancestor::page-block)])[last()]"/>
            <xsl:variable name="num">
               <xsl:variable name="candidate-num">
                  <xsl:choose>
                     <xsl:when test="count($from-node) &gt; 0">
                        <xsl:for-each select="$from-node/descendant-or-self::*[@_gte:count-as-id='cnt__figure^page-block.cnt']">
                           <xsl:if test="generate-id(.) = $node-id">
                              <xsl:value-of select="position()"/>
                           </xsl:if>
                        </xsl:for-each>
                     </xsl:when>
                     <xsl:otherwise>
                        <xsl:for-each select="//*[@_gte:count-as-id='cnt__figure^page-block.cnt'][not(ancestor-or-self::page-block)]">
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
            <xsl:variable name="offset">
               <!--Evaluate startAtXPath using the first counted element within the numbering scope as the context node-->
               <xsl:variable name="initial-num">
                  <xsl:choose>
                     <xsl:when test="count($from-node) &gt; 0">
                        <xsl:apply-templates select="($from-node/descendant-or-self::*[@_gte:count-as-id='cnt__figure^page-block.cnt'])[1]" mode="startat-xpath"/>
                     </xsl:when>
                     <xsl:otherwise>
                        <xsl:apply-templates select="(//*[@_gte:count-as-id='cnt__figure^page-block.cnt'][not(ancestor-or-self::page-block)])[1]" mode="startat-xpath"/>
                     </xsl:otherwise>
                  </xsl:choose>
               </xsl:variable>
               <xsl:choose>
                  <xsl:when test="string(number($initial-num))!='NaN'">
                     <xsl:value-of select="$initial-num"/>
                  </xsl:when>
                  <xsl:otherwise>1</xsl:otherwise>
               </xsl:choose>
            </xsl:variable>
            <xsl:choose>
               <xsl:when test="string(number($num))!='NaN'">
                  <xsl:number value="$num + $offset - 1" format="1"/>
               </xsl:when>
               <xsl:otherwise>?</xsl:otherwise>
            </xsl:choose>
         </xsl:when>
         <xsl:when test="not(ancestor::book[contains(@doctype,'oh')] and ancestor::ata-page-block/@pb-name[.='service']) and not(ancestor::book[contains(@doctype,'oh')] and ancestor::page-block/@pb-name[.='service']) and not(ancestor::ata-page-block/@pb-name[.='00awl' or .='00intro' or .='airlim' or .='awl' or .='awlror' or .='chapsect' or .='consume' or .='d-and-o' or .='frontmatte' or .='howtouse' or .='00howtouse' or .='intro' or .='nut_option' or .='oplimits' or .='sblist' or .='schedchk' or .='spectool' or .='timelim' or .='title-page']) and not(ancestor::page-block/@pb-name[.='00awl' or .='00intro' or .='airlim' or .='awl' or .='awlror' or .='chapsect' or .='consume' or .='d-and-o' or .='frontmatte' or .='howtouse' or .='00howtouse' or .='intro' or .='nut_option' or .='oplimits' or .='sblist' or .='schedchk' or .='spectool' or .='timelim' or .='title-page']) and not(ancestor::ata-page-block/@pb-name[(starts-with(., 'do') and 'do' = translate(., '0123456789', '') and string-length(.) &gt; 2) or (starts-with(., 'in') and 'in' = translate(., '0123456789', '') and string-length(.) &gt; 2) or (starts-with(., 'tl') and 'tl' = translate(., '0123456789', '') and string-length(.) &gt; 2) or .='toolsht' or .='trlist' or .='unschedc' or .='unschedchk']) and not(ancestor::page-block/@pb-name[(starts-with(., 'do') and 'do' = translate(., '0123456789', '') and string-length(.) &gt; 2) or (starts-with(., 'in') and 'in' = translate(., '0123456789', '') and string-length(.) &gt; 2) or (starts-with(., 'tl') and 'tl' = translate(., '0123456789', '') and string-length(.) &gt; 2) or .='toolsht' or .='trlist' or .='unschedc' or .='unschedchk']) and not(ancestor-or-self::ata-page-block[1]/@pb-name and string(ancestor-or-self::ata-page-block[1]/@pb-name)='intro00') and not(ancestor-or-self::page-block[1]/@pb-name and string(ancestor-or-self::page-block[1]/@pb-name)='intro00') and not(ancestor::ata-page-block/@pb-name[starts-with(., 'disassy') or starts-with(., 'fault')]) and not(ancestor::page-block/@pb-name[starts-with(., 'disassy') or starts-with(., 'fault')]) and not(ancestor::book[contains(@doctype,'oh')] and ancestor::ata-page-block/@pb-name[starts-with(., 'clean')]) and not(ancestor::book[contains(@doctype,'oh')] and ancestor::page-block/@pb-name[starts-with(., 'clean')]) and not(ancestor::ata-page-block/@pb-name[starts-with(., 'mainprac')]) and not(ancestor::page-block/@pb-name[starts-with(., 'mainprac')]) and not(ancestor::book[contains(@doctype,'oh')] and ancestor::ata-page-block/@pb-name[starts-with(., 'inspect')]) and not(ancestor::book[contains(@doctype,'oh')] and ancestor::page-block/@pb-name[starts-with(., 'inspect')]) and not(ancestor::ata-page-block/@pb-name[(starts-with(., 'di') and 'di' = translate(., '0123456789', '') and string-length(.) &gt; 2) or starts-with(.,'service')]) and not(ancestor::page-block/@pb-name[(starts-with(., 'di') and 'di' = translate(., '0123456789', '') and string-length(.) &gt; 2) or starts-with(.,'service')]) and not(ancestor::book[contains(@doctype,'oh')] and ancestor::ata-page-block/@pb-name[starts-with(., 'repair')]) and not(ancestor::book[contains(@doctype,'oh')] and ancestor::page-block/@pb-name[starts-with(., 'repair')]) and not(ancestor::book[contains(@doctype,'oh')] and ancestor::ata-page-block/@pb-name[starts-with(., 'test')]) and not(ancestor::book[contains(@doctype,'oh')] and ancestor::page-block/@pb-name[starts-with(., 'test')]) and (ancestor::ata-page-block/@pb-name[(starts-with(., 'cl') and 'cl' = translate(., '0123456789', '') and string-length(.) &gt; 2) or .='install' or starts-with(.,'rem-inst') or (starts-with(., 'reminst') and 'reminst' = translate(., '0123456789', '') and string-length(.) &gt; 7) or .='remove' or (starts-with(., 'repair') and 'repair' = translate(., '0123456789', '') and string-length(.) &gt; 6)])">
            <xsl:variable name="node-id" select="generate-id(.)"/>
            <xsl:variable name="from-node" select="(ancestor-or-self::ata-page-block[not(ancestor::ata-page-block)])[last()]"/>
            <xsl:variable name="num">
               <xsl:variable name="candidate-num">
                  <xsl:choose>
                     <xsl:when test="count($from-node) &gt; 0">
                        <xsl:for-each select="$from-node/descendant-or-self::*[@_gte:count-as-id='cnt__figure^ata-page-block.cnt']">
                           <xsl:if test="generate-id(.) = $node-id">
                              <xsl:value-of select="position()"/>
                           </xsl:if>
                        </xsl:for-each>
                     </xsl:when>
                     <xsl:otherwise>
                        <xsl:for-each select="//*[@_gte:count-as-id='cnt__figure^ata-page-block.cnt'][not(ancestor-or-self::ata-page-block)]">
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
            <xsl:variable name="offset">
               <!--Evaluate startAtXPath using the first counted element within the numbering scope as the context node-->
               <xsl:variable name="initial-num">
                  <xsl:choose>
                     <xsl:when test="count($from-node) &gt; 0">
                        <xsl:apply-templates select="($from-node/descendant-or-self::*[@_gte:count-as-id='cnt__figure^ata-page-block.cnt'])[1]" mode="startat-xpath"/>
                     </xsl:when>
                     <xsl:otherwise>
                        <xsl:apply-templates select="(//*[@_gte:count-as-id='cnt__figure^ata-page-block.cnt'][not(ancestor-or-self::ata-page-block)])[1]" mode="startat-xpath"/>
                     </xsl:otherwise>
                  </xsl:choose>
               </xsl:variable>
               <xsl:choose>
                  <xsl:when test="string(number($initial-num))!='NaN'">
                     <xsl:value-of select="$initial-num"/>
                  </xsl:when>
                  <xsl:otherwise>1</xsl:otherwise>
               </xsl:choose>
            </xsl:variable>
            <xsl:choose>
               <xsl:when test="string(number($num))!='NaN'">
                  <xsl:number value="$num + $offset - 1" format="1"/>
               </xsl:when>
               <xsl:otherwise>?</xsl:otherwise>
            </xsl:choose>
         </xsl:when>
         <xsl:when test="not(ancestor::book[contains(@doctype,'oh')] and ancestor::ata-page-block/@pb-name[.='service']) and not(ancestor::book[contains(@doctype,'oh')] and ancestor::page-block/@pb-name[.='service']) and not(ancestor::ata-page-block/@pb-name[.='00awl' or .='00intro' or .='airlim' or .='awl' or .='awlror' or .='chapsect' or .='consume' or .='d-and-o' or .='frontmatte' or .='howtouse' or .='00howtouse' or .='intro' or .='nut_option' or .='oplimits' or .='sblist' or .='schedchk' or .='spectool' or .='timelim' or .='title-page']) and not(ancestor::page-block/@pb-name[.='00awl' or .='00intro' or .='airlim' or .='awl' or .='awlror' or .='chapsect' or .='consume' or .='d-and-o' or .='frontmatte' or .='howtouse' or .='00howtouse' or .='intro' or .='nut_option' or .='oplimits' or .='sblist' or .='schedchk' or .='spectool' or .='timelim' or .='title-page']) and not(ancestor::ata-page-block/@pb-name[(starts-with(., 'do') and 'do' = translate(., '0123456789', '') and string-length(.) &gt; 2) or (starts-with(., 'in') and 'in' = translate(., '0123456789', '') and string-length(.) &gt; 2) or (starts-with(., 'tl') and 'tl' = translate(., '0123456789', '') and string-length(.) &gt; 2) or .='toolsht' or .='trlist' or .='unschedc' or .='unschedchk']) and not(ancestor::page-block/@pb-name[(starts-with(., 'do') and 'do' = translate(., '0123456789', '') and string-length(.) &gt; 2) or (starts-with(., 'in') and 'in' = translate(., '0123456789', '') and string-length(.) &gt; 2) or (starts-with(., 'tl') and 'tl' = translate(., '0123456789', '') and string-length(.) &gt; 2) or .='toolsht' or .='trlist' or .='unschedc' or .='unschedchk']) and not(ancestor-or-self::ata-page-block[1]/@pb-name and string(ancestor-or-self::ata-page-block[1]/@pb-name)='intro00') and not(ancestor-or-self::page-block[1]/@pb-name and string(ancestor-or-self::page-block[1]/@pb-name)='intro00') and not(ancestor::ata-page-block/@pb-name[starts-with(., 'disassy') or starts-with(., 'fault')]) and not(ancestor::page-block/@pb-name[starts-with(., 'disassy') or starts-with(., 'fault')]) and not(ancestor::book[contains(@doctype,'oh')] and ancestor::ata-page-block/@pb-name[starts-with(., 'clean')]) and not(ancestor::book[contains(@doctype,'oh')] and ancestor::page-block/@pb-name[starts-with(., 'clean')]) and not(ancestor::ata-page-block/@pb-name[starts-with(., 'mainprac')]) and not(ancestor::page-block/@pb-name[starts-with(., 'mainprac')]) and not(ancestor::book[contains(@doctype,'oh')] and ancestor::ata-page-block/@pb-name[starts-with(., 'inspect')]) and not(ancestor::book[contains(@doctype,'oh')] and ancestor::page-block/@pb-name[starts-with(., 'inspect')]) and not(ancestor::ata-page-block/@pb-name[(starts-with(., 'di') and 'di' = translate(., '0123456789', '') and string-length(.) &gt; 2) or starts-with(.,'service')]) and not(ancestor::page-block/@pb-name[(starts-with(., 'di') and 'di' = translate(., '0123456789', '') and string-length(.) &gt; 2) or starts-with(.,'service')]) and not(ancestor::book[contains(@doctype,'oh')] and ancestor::ata-page-block/@pb-name[starts-with(., 'repair')]) and not(ancestor::book[contains(@doctype,'oh')] and ancestor::page-block/@pb-name[starts-with(., 'repair')]) and not(ancestor::book[contains(@doctype,'oh')] and ancestor::ata-page-block/@pb-name[starts-with(., 'test')]) and (ancestor::book[contains(@doctype,'oh')] and ancestor::page-block/@pb-name[starts-with(., 'test')])">
            <xsl:variable name="node-id" select="generate-id(.)"/>
            <xsl:variable name="from-node" select="(ancestor-or-self::page-block[not(ancestor::page-block)])[last()]"/>
            <xsl:variable name="num">
               <xsl:variable name="candidate-num">
                  <xsl:choose>
                     <xsl:when test="count($from-node) &gt; 0">
                        <xsl:for-each select="$from-node/descendant-or-self::*[@_gte:count-as-id='cnt__figure^page-block.cnt']">
                           <xsl:if test="generate-id(.) = $node-id">
                              <xsl:value-of select="position()"/>
                           </xsl:if>
                        </xsl:for-each>
                     </xsl:when>
                     <xsl:otherwise>
                        <xsl:for-each select="//*[@_gte:count-as-id='cnt__figure^page-block.cnt'][not(ancestor-or-self::page-block)]">
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
            <xsl:variable name="offset">
               <!--Evaluate startAtXPath using the first counted element within the numbering scope as the context node-->
               <xsl:variable name="initial-num">
                  <xsl:choose>
                     <xsl:when test="count($from-node) &gt; 0">
                        <xsl:apply-templates select="($from-node/descendant-or-self::*[@_gte:count-as-id='cnt__figure^page-block.cnt'])[1]" mode="startat-xpath"/>
                     </xsl:when>
                     <xsl:otherwise>
                        <xsl:apply-templates select="(//*[@_gte:count-as-id='cnt__figure^page-block.cnt'][not(ancestor-or-self::page-block)])[1]" mode="startat-xpath"/>
                     </xsl:otherwise>
                  </xsl:choose>
               </xsl:variable>
               <xsl:choose>
                  <xsl:when test="string(number($initial-num))!='NaN'">
                     <xsl:value-of select="$initial-num"/>
                  </xsl:when>
                  <xsl:otherwise>1</xsl:otherwise>
               </xsl:choose>
            </xsl:variable>
            <xsl:choose>
               <xsl:when test="string(number($num))!='NaN'">
                  <xsl:number value="$num + $offset - 1" format="1"/>
               </xsl:when>
               <xsl:otherwise>?</xsl:otherwise>
            </xsl:choose>
         </xsl:when>
         <xsl:when test="not(ancestor::book[contains(@doctype,'oh')] and ancestor::ata-page-block/@pb-name[.='service']) and not(ancestor::book[contains(@doctype,'oh')] and ancestor::page-block/@pb-name[.='service']) and not(ancestor::ata-page-block/@pb-name[.='00awl' or .='00intro' or .='airlim' or .='awl' or .='awlror' or .='chapsect' or .='consume' or .='d-and-o' or .='frontmatte' or .='howtouse' or .='00howtouse' or .='intro' or .='nut_option' or .='oplimits' or .='sblist' or .='schedchk' or .='spectool' or .='timelim' or .='title-page']) and not(ancestor::page-block/@pb-name[.='00awl' or .='00intro' or .='airlim' or .='awl' or .='awlror' or .='chapsect' or .='consume' or .='d-and-o' or .='frontmatte' or .='howtouse' or .='00howtouse' or .='intro' or .='nut_option' or .='oplimits' or .='sblist' or .='schedchk' or .='spectool' or .='timelim' or .='title-page']) and not(ancestor::ata-page-block/@pb-name[(starts-with(., 'do') and 'do' = translate(., '0123456789', '') and string-length(.) &gt; 2) or (starts-with(., 'in') and 'in' = translate(., '0123456789', '') and string-length(.) &gt; 2) or (starts-with(., 'tl') and 'tl' = translate(., '0123456789', '') and string-length(.) &gt; 2) or .='toolsht' or .='trlist' or .='unschedc' or .='unschedchk']) and not(ancestor::page-block/@pb-name[(starts-with(., 'do') and 'do' = translate(., '0123456789', '') and string-length(.) &gt; 2) or (starts-with(., 'in') and 'in' = translate(., '0123456789', '') and string-length(.) &gt; 2) or (starts-with(., 'tl') and 'tl' = translate(., '0123456789', '') and string-length(.) &gt; 2) or .='toolsht' or .='trlist' or .='unschedc' or .='unschedchk']) and not(ancestor-or-self::ata-page-block[1]/@pb-name and string(ancestor-or-self::ata-page-block[1]/@pb-name)='intro00') and not(ancestor-or-self::page-block[1]/@pb-name and string(ancestor-or-self::page-block[1]/@pb-name)='intro00') and not(ancestor::ata-page-block/@pb-name[starts-with(., 'disassy') or starts-with(., 'fault')]) and not(ancestor::page-block/@pb-name[starts-with(., 'disassy') or starts-with(., 'fault')]) and not(ancestor::book[contains(@doctype,'oh')] and ancestor::ata-page-block/@pb-name[starts-with(., 'clean')]) and not(ancestor::book[contains(@doctype,'oh')] and ancestor::page-block/@pb-name[starts-with(., 'clean')]) and not(ancestor::ata-page-block/@pb-name[starts-with(., 'mainprac')]) and not(ancestor::page-block/@pb-name[starts-with(., 'mainprac')]) and not(ancestor::book[contains(@doctype,'oh')] and ancestor::ata-page-block/@pb-name[starts-with(., 'inspect')]) and not(ancestor::book[contains(@doctype,'oh')] and ancestor::page-block/@pb-name[starts-with(., 'inspect')]) and not(ancestor::ata-page-block/@pb-name[(starts-with(., 'di') and 'di' = translate(., '0123456789', '') and string-length(.) &gt; 2) or starts-with(.,'service')]) and not(ancestor::page-block/@pb-name[(starts-with(., 'di') and 'di' = translate(., '0123456789', '') and string-length(.) &gt; 2) or starts-with(.,'service')]) and not(ancestor::book[contains(@doctype,'oh')] and ancestor::ata-page-block/@pb-name[starts-with(., 'repair')]) and not(ancestor::book[contains(@doctype,'oh')] and ancestor::page-block/@pb-name[starts-with(., 'repair')]) and (ancestor::book[contains(@doctype,'oh')] and ancestor::ata-page-block/@pb-name[starts-with(., 'test')])">
            <xsl:variable name="node-id" select="generate-id(.)"/>
            <xsl:variable name="from-node" select="(ancestor-or-self::ata-page-block[not(ancestor::ata-page-block)])[last()]"/>
            <xsl:variable name="num">
               <xsl:variable name="candidate-num">
                  <xsl:choose>
                     <xsl:when test="count($from-node) &gt; 0">
                        <xsl:for-each select="$from-node/descendant-or-self::*[@_gte:count-as-id='cnt__figure^ata-page-block.cnt']">
                           <xsl:if test="generate-id(.) = $node-id">
                              <xsl:value-of select="position()"/>
                           </xsl:if>
                        </xsl:for-each>
                     </xsl:when>
                     <xsl:otherwise>
                        <xsl:for-each select="//*[@_gte:count-as-id='cnt__figure^ata-page-block.cnt'][not(ancestor-or-self::ata-page-block)]">
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
            <xsl:variable name="offset">
               <!--Evaluate startAtXPath using the first counted element within the numbering scope as the context node-->
               <xsl:variable name="initial-num">
                  <xsl:choose>
                     <xsl:when test="count($from-node) &gt; 0">
                        <xsl:apply-templates select="($from-node/descendant-or-self::*[@_gte:count-as-id='cnt__figure^ata-page-block.cnt'])[1]" mode="startat-xpath"/>
                     </xsl:when>
                     <xsl:otherwise>
                        <xsl:apply-templates select="(//*[@_gte:count-as-id='cnt__figure^ata-page-block.cnt'][not(ancestor-or-self::ata-page-block)])[1]" mode="startat-xpath"/>
                     </xsl:otherwise>
                  </xsl:choose>
               </xsl:variable>
               <xsl:choose>
                  <xsl:when test="string(number($initial-num))!='NaN'">
                     <xsl:value-of select="$initial-num"/>
                  </xsl:when>
                  <xsl:otherwise>1</xsl:otherwise>
               </xsl:choose>
            </xsl:variable>
            <xsl:choose>
               <xsl:when test="string(number($num))!='NaN'">
                  <xsl:number value="$num + $offset - 1" format="1"/>
               </xsl:when>
               <xsl:otherwise>?</xsl:otherwise>
            </xsl:choose>
         </xsl:when>
         <xsl:when test="not(ancestor::book[contains(@doctype,'oh')] and ancestor::ata-page-block/@pb-name[.='service']) and not(ancestor::book[contains(@doctype,'oh')] and ancestor::page-block/@pb-name[.='service']) and not(ancestor::ata-page-block/@pb-name[.='00awl' or .='00intro' or .='airlim' or .='awl' or .='awlror' or .='chapsect' or .='consume' or .='d-and-o' or .='frontmatte' or .='howtouse' or .='00howtouse' or .='intro' or .='nut_option' or .='oplimits' or .='sblist' or .='schedchk' or .='spectool' or .='timelim' or .='title-page']) and not(ancestor::page-block/@pb-name[.='00awl' or .='00intro' or .='airlim' or .='awl' or .='awlror' or .='chapsect' or .='consume' or .='d-and-o' or .='frontmatte' or .='howtouse' or .='00howtouse' or .='intro' or .='nut_option' or .='oplimits' or .='sblist' or .='schedchk' or .='spectool' or .='timelim' or .='title-page']) and not(ancestor::ata-page-block/@pb-name[(starts-with(., 'do') and 'do' = translate(., '0123456789', '') and string-length(.) &gt; 2) or (starts-with(., 'in') and 'in' = translate(., '0123456789', '') and string-length(.) &gt; 2) or (starts-with(., 'tl') and 'tl' = translate(., '0123456789', '') and string-length(.) &gt; 2) or .='toolsht' or .='trlist' or .='unschedc' or .='unschedchk']) and not(ancestor::page-block/@pb-name[(starts-with(., 'do') and 'do' = translate(., '0123456789', '') and string-length(.) &gt; 2) or (starts-with(., 'in') and 'in' = translate(., '0123456789', '') and string-length(.) &gt; 2) or (starts-with(., 'tl') and 'tl' = translate(., '0123456789', '') and string-length(.) &gt; 2) or .='toolsht' or .='trlist' or .='unschedc' or .='unschedchk']) and not(ancestor-or-self::ata-page-block[1]/@pb-name and string(ancestor-or-self::ata-page-block[1]/@pb-name)='intro00') and not(ancestor-or-self::page-block[1]/@pb-name and string(ancestor-or-self::page-block[1]/@pb-name)='intro00') and not(ancestor::ata-page-block/@pb-name[starts-with(., 'disassy') or starts-with(., 'fault')]) and not(ancestor::page-block/@pb-name[starts-with(., 'disassy') or starts-with(., 'fault')]) and not(ancestor::book[contains(@doctype,'oh')] and ancestor::ata-page-block/@pb-name[starts-with(., 'clean')]) and not(ancestor::book[contains(@doctype,'oh')] and ancestor::page-block/@pb-name[starts-with(., 'clean')]) and not(ancestor::ata-page-block/@pb-name[starts-with(., 'mainprac')]) and not(ancestor::page-block/@pb-name[starts-with(., 'mainprac')]) and not(ancestor::book[contains(@doctype,'oh')] and ancestor::ata-page-block/@pb-name[starts-with(., 'inspect')]) and not(ancestor::book[contains(@doctype,'oh')] and ancestor::page-block/@pb-name[starts-with(., 'inspect')]) and not(ancestor::ata-page-block/@pb-name[(starts-with(., 'di') and 'di' = translate(., '0123456789', '') and string-length(.) &gt; 2) or starts-with(.,'service')]) and not(ancestor::page-block/@pb-name[(starts-with(., 'di') and 'di' = translate(., '0123456789', '') and string-length(.) &gt; 2) or starts-with(.,'service')]) and not(ancestor::book[contains(@doctype,'oh')] and ancestor::ata-page-block/@pb-name[starts-with(., 'repair')]) and (ancestor::book[contains(@doctype,'oh')] and ancestor::page-block/@pb-name[starts-with(., 'repair')])">
            <xsl:variable name="node-id" select="generate-id(.)"/>
            <xsl:variable name="from-node" select="(ancestor-or-self::page-block[not(ancestor::page-block)])[last()]"/>
            <xsl:variable name="num">
               <xsl:variable name="candidate-num">
                  <xsl:choose>
                     <xsl:when test="count($from-node) &gt; 0">
                        <xsl:for-each select="$from-node/descendant-or-self::*[@_gte:count-as-id='cnt__figure^page-block.cnt']">
                           <xsl:if test="generate-id(.) = $node-id">
                              <xsl:value-of select="position()"/>
                           </xsl:if>
                        </xsl:for-each>
                     </xsl:when>
                     <xsl:otherwise>
                        <xsl:for-each select="//*[@_gte:count-as-id='cnt__figure^page-block.cnt'][not(ancestor-or-self::page-block)]">
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
            <xsl:variable name="offset">
               <!--Evaluate startAtXPath using the first counted element within the numbering scope as the context node-->
               <xsl:variable name="initial-num">
                  <xsl:choose>
                     <xsl:when test="count($from-node) &gt; 0">
                        <xsl:apply-templates select="($from-node/descendant-or-self::*[@_gte:count-as-id='cnt__figure^page-block.cnt'])[1]" mode="startat-xpath"/>
                     </xsl:when>
                     <xsl:otherwise>
                        <xsl:apply-templates select="(//*[@_gte:count-as-id='cnt__figure^page-block.cnt'][not(ancestor-or-self::page-block)])[1]" mode="startat-xpath"/>
                     </xsl:otherwise>
                  </xsl:choose>
               </xsl:variable>
               <xsl:choose>
                  <xsl:when test="string(number($initial-num))!='NaN'">
                     <xsl:value-of select="$initial-num"/>
                  </xsl:when>
                  <xsl:otherwise>1</xsl:otherwise>
               </xsl:choose>
            </xsl:variable>
            <xsl:choose>
               <xsl:when test="string(number($num))!='NaN'">
                  <xsl:number value="$num + $offset - 1" format="1"/>
               </xsl:when>
               <xsl:otherwise>?</xsl:otherwise>
            </xsl:choose>
         </xsl:when>
         <xsl:when test="not(ancestor::book[contains(@doctype,'oh')] and ancestor::ata-page-block/@pb-name[.='service']) and not(ancestor::book[contains(@doctype,'oh')] and ancestor::page-block/@pb-name[.='service']) and not(ancestor::ata-page-block/@pb-name[.='00awl' or .='00intro' or .='airlim' or .='awl' or .='awlror' or .='chapsect' or .='consume' or .='d-and-o' or .='frontmatte' or .='howtouse' or .='00howtouse' or .='intro' or .='nut_option' or .='oplimits' or .='sblist' or .='schedchk' or .='spectool' or .='timelim' or .='title-page']) and not(ancestor::page-block/@pb-name[.='00awl' or .='00intro' or .='airlim' or .='awl' or .='awlror' or .='chapsect' or .='consume' or .='d-and-o' or .='frontmatte' or .='howtouse' or .='00howtouse' or .='intro' or .='nut_option' or .='oplimits' or .='sblist' or .='schedchk' or .='spectool' or .='timelim' or .='title-page']) and not(ancestor::ata-page-block/@pb-name[(starts-with(., 'do') and 'do' = translate(., '0123456789', '') and string-length(.) &gt; 2) or (starts-with(., 'in') and 'in' = translate(., '0123456789', '') and string-length(.) &gt; 2) or (starts-with(., 'tl') and 'tl' = translate(., '0123456789', '') and string-length(.) &gt; 2) or .='toolsht' or .='trlist' or .='unschedc' or .='unschedchk']) and not(ancestor::page-block/@pb-name[(starts-with(., 'do') and 'do' = translate(., '0123456789', '') and string-length(.) &gt; 2) or (starts-with(., 'in') and 'in' = translate(., '0123456789', '') and string-length(.) &gt; 2) or (starts-with(., 'tl') and 'tl' = translate(., '0123456789', '') and string-length(.) &gt; 2) or .='toolsht' or .='trlist' or .='unschedc' or .='unschedchk']) and not(ancestor-or-self::ata-page-block[1]/@pb-name and string(ancestor-or-self::ata-page-block[1]/@pb-name)='intro00') and not(ancestor-or-self::page-block[1]/@pb-name and string(ancestor-or-self::page-block[1]/@pb-name)='intro00') and not(ancestor::ata-page-block/@pb-name[starts-with(., 'disassy') or starts-with(., 'fault')]) and not(ancestor::page-block/@pb-name[starts-with(., 'disassy') or starts-with(., 'fault')]) and not(ancestor::book[contains(@doctype,'oh')] and ancestor::ata-page-block/@pb-name[starts-with(., 'clean')]) and not(ancestor::book[contains(@doctype,'oh')] and ancestor::page-block/@pb-name[starts-with(., 'clean')]) and not(ancestor::ata-page-block/@pb-name[starts-with(., 'mainprac')]) and not(ancestor::page-block/@pb-name[starts-with(., 'mainprac')]) and not(ancestor::book[contains(@doctype,'oh')] and ancestor::ata-page-block/@pb-name[starts-with(., 'inspect')]) and not(ancestor::book[contains(@doctype,'oh')] and ancestor::page-block/@pb-name[starts-with(., 'inspect')]) and not(ancestor::ata-page-block/@pb-name[(starts-with(., 'di') and 'di' = translate(., '0123456789', '') and string-length(.) &gt; 2) or starts-with(.,'service')]) and not(ancestor::page-block/@pb-name[(starts-with(., 'di') and 'di' = translate(., '0123456789', '') and string-length(.) &gt; 2) or starts-with(.,'service')]) and (ancestor::book[contains(@doctype,'oh')] and ancestor::ata-page-block/@pb-name[starts-with(., 'repair')])">
            <xsl:variable name="node-id" select="generate-id(.)"/>
            <xsl:variable name="from-node" select="(ancestor-or-self::ata-page-block[not(ancestor::ata-page-block)])[last()]"/>
            <xsl:variable name="num">
               <xsl:variable name="candidate-num">
                  <xsl:choose>
                     <xsl:when test="count($from-node) &gt; 0">
                        <xsl:for-each select="$from-node/descendant-or-self::*[@_gte:count-as-id='cnt__figure^ata-page-block.cnt']">
                           <xsl:if test="generate-id(.) = $node-id">
                              <xsl:value-of select="position()"/>
                           </xsl:if>
                        </xsl:for-each>
                     </xsl:when>
                     <xsl:otherwise>
                        <xsl:for-each select="//*[@_gte:count-as-id='cnt__figure^ata-page-block.cnt'][not(ancestor-or-self::ata-page-block)]">
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
            <xsl:variable name="offset">
               <!--Evaluate startAtXPath using the first counted element within the numbering scope as the context node-->
               <xsl:variable name="initial-num">
                  <xsl:choose>
                     <xsl:when test="count($from-node) &gt; 0">
                        <xsl:apply-templates select="($from-node/descendant-or-self::*[@_gte:count-as-id='cnt__figure^ata-page-block.cnt'])[1]" mode="startat-xpath"/>
                     </xsl:when>
                     <xsl:otherwise>
                        <xsl:apply-templates select="(//*[@_gte:count-as-id='cnt__figure^ata-page-block.cnt'][not(ancestor-or-self::ata-page-block)])[1]" mode="startat-xpath"/>
                     </xsl:otherwise>
                  </xsl:choose>
               </xsl:variable>
               <xsl:choose>
                  <xsl:when test="string(number($initial-num))!='NaN'">
                     <xsl:value-of select="$initial-num"/>
                  </xsl:when>
                  <xsl:otherwise>1</xsl:otherwise>
               </xsl:choose>
            </xsl:variable>
            <xsl:choose>
               <xsl:when test="string(number($num))!='NaN'">
                  <xsl:number value="$num + $offset - 1" format="1"/>
               </xsl:when>
               <xsl:otherwise>?</xsl:otherwise>
            </xsl:choose>
         </xsl:when>
         <xsl:when test="not(ancestor::book[contains(@doctype,'oh')] and ancestor::ata-page-block/@pb-name[.='service']) and not(ancestor::book[contains(@doctype,'oh')] and ancestor::page-block/@pb-name[.='service']) and not(ancestor::ata-page-block/@pb-name[.='00awl' or .='00intro' or .='airlim' or .='awl' or .='awlror' or .='chapsect' or .='consume' or .='d-and-o' or .='frontmatte' or .='howtouse' or .='00howtouse' or .='intro' or .='nut_option' or .='oplimits' or .='sblist' or .='schedchk' or .='spectool' or .='timelim' or .='title-page']) and not(ancestor::page-block/@pb-name[.='00awl' or .='00intro' or .='airlim' or .='awl' or .='awlror' or .='chapsect' or .='consume' or .='d-and-o' or .='frontmatte' or .='howtouse' or .='00howtouse' or .='intro' or .='nut_option' or .='oplimits' or .='sblist' or .='schedchk' or .='spectool' or .='timelim' or .='title-page']) and not(ancestor::ata-page-block/@pb-name[(starts-with(., 'do') and 'do' = translate(., '0123456789', '') and string-length(.) &gt; 2) or (starts-with(., 'in') and 'in' = translate(., '0123456789', '') and string-length(.) &gt; 2) or (starts-with(., 'tl') and 'tl' = translate(., '0123456789', '') and string-length(.) &gt; 2) or .='toolsht' or .='trlist' or .='unschedc' or .='unschedchk']) and not(ancestor::page-block/@pb-name[(starts-with(., 'do') and 'do' = translate(., '0123456789', '') and string-length(.) &gt; 2) or (starts-with(., 'in') and 'in' = translate(., '0123456789', '') and string-length(.) &gt; 2) or (starts-with(., 'tl') and 'tl' = translate(., '0123456789', '') and string-length(.) &gt; 2) or .='toolsht' or .='trlist' or .='unschedc' or .='unschedchk']) and not(ancestor-or-self::ata-page-block[1]/@pb-name and string(ancestor-or-self::ata-page-block[1]/@pb-name)='intro00') and not(ancestor-or-self::page-block[1]/@pb-name and string(ancestor-or-self::page-block[1]/@pb-name)='intro00') and not(ancestor::ata-page-block/@pb-name[starts-with(., 'disassy') or starts-with(., 'fault')]) and not(ancestor::page-block/@pb-name[starts-with(., 'disassy') or starts-with(., 'fault')]) and not(ancestor::book[contains(@doctype,'oh')] and ancestor::ata-page-block/@pb-name[starts-with(., 'clean')]) and not(ancestor::book[contains(@doctype,'oh')] and ancestor::page-block/@pb-name[starts-with(., 'clean')]) and not(ancestor::ata-page-block/@pb-name[starts-with(., 'mainprac')]) and not(ancestor::page-block/@pb-name[starts-with(., 'mainprac')]) and not(ancestor::book[contains(@doctype,'oh')] and ancestor::ata-page-block/@pb-name[starts-with(., 'inspect')]) and not(ancestor::book[contains(@doctype,'oh')] and ancestor::page-block/@pb-name[starts-with(., 'inspect')]) and not(ancestor::ata-page-block/@pb-name[(starts-with(., 'di') and 'di' = translate(., '0123456789', '') and string-length(.) &gt; 2) or starts-with(.,'service')]) and (ancestor::page-block/@pb-name[(starts-with(., 'di') and 'di' = translate(., '0123456789', '') and string-length(.) &gt; 2) or starts-with(.,'service')])">
            <xsl:variable name="node-id" select="generate-id(.)"/>
            <xsl:variable name="from-node" select="(ancestor-or-self::page-block[not(ancestor::page-block)])[last()]"/>
            <xsl:variable name="num">
               <xsl:variable name="candidate-num">
                  <xsl:choose>
                     <xsl:when test="count($from-node) &gt; 0">
                        <xsl:for-each select="$from-node/descendant-or-self::*[@_gte:count-as-id='cnt__figure^page-block.cnt']">
                           <xsl:if test="generate-id(.) = $node-id">
                              <xsl:value-of select="position()"/>
                           </xsl:if>
                        </xsl:for-each>
                     </xsl:when>
                     <xsl:otherwise>
                        <xsl:for-each select="//*[@_gte:count-as-id='cnt__figure^page-block.cnt'][not(ancestor-or-self::page-block)]">
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
            <xsl:variable name="offset">
               <!--Evaluate startAtXPath using the first counted element within the numbering scope as the context node-->
               <xsl:variable name="initial-num">
                  <xsl:choose>
                     <xsl:when test="count($from-node) &gt; 0">
                        <xsl:apply-templates select="($from-node/descendant-or-self::*[@_gte:count-as-id='cnt__figure^page-block.cnt'])[1]" mode="startat-xpath"/>
                     </xsl:when>
                     <xsl:otherwise>
                        <xsl:apply-templates select="(//*[@_gte:count-as-id='cnt__figure^page-block.cnt'][not(ancestor-or-self::page-block)])[1]" mode="startat-xpath"/>
                     </xsl:otherwise>
                  </xsl:choose>
               </xsl:variable>
               <xsl:choose>
                  <xsl:when test="string(number($initial-num))!='NaN'">
                     <xsl:value-of select="$initial-num"/>
                  </xsl:when>
                  <xsl:otherwise>1</xsl:otherwise>
               </xsl:choose>
            </xsl:variable>
            <xsl:choose>
               <xsl:when test="string(number($num))!='NaN'">
                  <xsl:number value="$num + $offset - 1" format="1"/>
               </xsl:when>
               <xsl:otherwise>?</xsl:otherwise>
            </xsl:choose>
         </xsl:when>
         <xsl:when test="not(ancestor::book[contains(@doctype,'oh')] and ancestor::ata-page-block/@pb-name[.='service']) and not(ancestor::book[contains(@doctype,'oh')] and ancestor::page-block/@pb-name[.='service']) and not(ancestor::ata-page-block/@pb-name[.='00awl' or .='00intro' or .='airlim' or .='awl' or .='awlror' or .='chapsect' or .='consume' or .='d-and-o' or .='frontmatte' or .='howtouse' or .='00howtouse' or .='intro' or .='nut_option' or .='oplimits' or .='sblist' or .='schedchk' or .='spectool' or .='timelim' or .='title-page']) and not(ancestor::page-block/@pb-name[.='00awl' or .='00intro' or .='airlim' or .='awl' or .='awlror' or .='chapsect' or .='consume' or .='d-and-o' or .='frontmatte' or .='howtouse' or .='00howtouse' or .='intro' or .='nut_option' or .='oplimits' or .='sblist' or .='schedchk' or .='spectool' or .='timelim' or .='title-page']) and not(ancestor::ata-page-block/@pb-name[(starts-with(., 'do') and 'do' = translate(., '0123456789', '') and string-length(.) &gt; 2) or (starts-with(., 'in') and 'in' = translate(., '0123456789', '') and string-length(.) &gt; 2) or (starts-with(., 'tl') and 'tl' = translate(., '0123456789', '') and string-length(.) &gt; 2) or .='toolsht' or .='trlist' or .='unschedc' or .='unschedchk']) and not(ancestor::page-block/@pb-name[(starts-with(., 'do') and 'do' = translate(., '0123456789', '') and string-length(.) &gt; 2) or (starts-with(., 'in') and 'in' = translate(., '0123456789', '') and string-length(.) &gt; 2) or (starts-with(., 'tl') and 'tl' = translate(., '0123456789', '') and string-length(.) &gt; 2) or .='toolsht' or .='trlist' or .='unschedc' or .='unschedchk']) and not(ancestor-or-self::ata-page-block[1]/@pb-name and string(ancestor-or-self::ata-page-block[1]/@pb-name)='intro00') and not(ancestor-or-self::page-block[1]/@pb-name and string(ancestor-or-self::page-block[1]/@pb-name)='intro00') and not(ancestor::ata-page-block/@pb-name[starts-with(., 'disassy') or starts-with(., 'fault')]) and not(ancestor::page-block/@pb-name[starts-with(., 'disassy') or starts-with(., 'fault')]) and not(ancestor::book[contains(@doctype,'oh')] and ancestor::ata-page-block/@pb-name[starts-with(., 'clean')]) and not(ancestor::book[contains(@doctype,'oh')] and ancestor::page-block/@pb-name[starts-with(., 'clean')]) and not(ancestor::ata-page-block/@pb-name[starts-with(., 'mainprac')]) and not(ancestor::page-block/@pb-name[starts-with(., 'mainprac')]) and not(ancestor::book[contains(@doctype,'oh')] and ancestor::ata-page-block/@pb-name[starts-with(., 'inspect')]) and not(ancestor::book[contains(@doctype,'oh')] and ancestor::page-block/@pb-name[starts-with(., 'inspect')]) and (ancestor::ata-page-block/@pb-name[(starts-with(., 'di') and 'di' = translate(., '0123456789', '') and string-length(.) &gt; 2) or starts-with(.,'service')])">
            <xsl:variable name="node-id" select="generate-id(.)"/>
            <xsl:variable name="from-node" select="(ancestor-or-self::ata-page-block[not(ancestor::ata-page-block)])[last()]"/>
            <xsl:variable name="num">
               <xsl:variable name="candidate-num">
                  <xsl:choose>
                     <xsl:when test="count($from-node) &gt; 0">
                        <xsl:for-each select="$from-node/descendant-or-self::*[@_gte:count-as-id='cnt__figure^ata-page-block.cnt']">
                           <xsl:if test="generate-id(.) = $node-id">
                              <xsl:value-of select="position()"/>
                           </xsl:if>
                        </xsl:for-each>
                     </xsl:when>
                     <xsl:otherwise>
                        <xsl:for-each select="//*[@_gte:count-as-id='cnt__figure^ata-page-block.cnt'][not(ancestor-or-self::ata-page-block)]">
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
            <xsl:variable name="offset">
               <!--Evaluate startAtXPath using the first counted element within the numbering scope as the context node-->
               <xsl:variable name="initial-num">
                  <xsl:choose>
                     <xsl:when test="count($from-node) &gt; 0">
                        <xsl:apply-templates select="($from-node/descendant-or-self::*[@_gte:count-as-id='cnt__figure^ata-page-block.cnt'])[1]" mode="startat-xpath"/>
                     </xsl:when>
                     <xsl:otherwise>
                        <xsl:apply-templates select="(//*[@_gte:count-as-id='cnt__figure^ata-page-block.cnt'][not(ancestor-or-self::ata-page-block)])[1]" mode="startat-xpath"/>
                     </xsl:otherwise>
                  </xsl:choose>
               </xsl:variable>
               <xsl:choose>
                  <xsl:when test="string(number($initial-num))!='NaN'">
                     <xsl:value-of select="$initial-num"/>
                  </xsl:when>
                  <xsl:otherwise>1</xsl:otherwise>
               </xsl:choose>
            </xsl:variable>
            <xsl:choose>
               <xsl:when test="string(number($num))!='NaN'">
                  <xsl:number value="$num + $offset - 1" format="1"/>
               </xsl:when>
               <xsl:otherwise>?</xsl:otherwise>
            </xsl:choose>
         </xsl:when>
         <xsl:when test="not(ancestor::book[contains(@doctype,'oh')] and ancestor::ata-page-block/@pb-name[.='service']) and not(ancestor::book[contains(@doctype,'oh')] and ancestor::page-block/@pb-name[.='service']) and not(ancestor::ata-page-block/@pb-name[.='00awl' or .='00intro' or .='airlim' or .='awl' or .='awlror' or .='chapsect' or .='consume' or .='d-and-o' or .='frontmatte' or .='howtouse' or .='00howtouse' or .='intro' or .='nut_option' or .='oplimits' or .='sblist' or .='schedchk' or .='spectool' or .='timelim' or .='title-page']) and not(ancestor::page-block/@pb-name[.='00awl' or .='00intro' or .='airlim' or .='awl' or .='awlror' or .='chapsect' or .='consume' or .='d-and-o' or .='frontmatte' or .='howtouse' or .='00howtouse' or .='intro' or .='nut_option' or .='oplimits' or .='sblist' or .='schedchk' or .='spectool' or .='timelim' or .='title-page']) and not(ancestor::ata-page-block/@pb-name[(starts-with(., 'do') and 'do' = translate(., '0123456789', '') and string-length(.) &gt; 2) or (starts-with(., 'in') and 'in' = translate(., '0123456789', '') and string-length(.) &gt; 2) or (starts-with(., 'tl') and 'tl' = translate(., '0123456789', '') and string-length(.) &gt; 2) or .='toolsht' or .='trlist' or .='unschedc' or .='unschedchk']) and not(ancestor::page-block/@pb-name[(starts-with(., 'do') and 'do' = translate(., '0123456789', '') and string-length(.) &gt; 2) or (starts-with(., 'in') and 'in' = translate(., '0123456789', '') and string-length(.) &gt; 2) or (starts-with(., 'tl') and 'tl' = translate(., '0123456789', '') and string-length(.) &gt; 2) or .='toolsht' or .='trlist' or .='unschedc' or .='unschedchk']) and not(ancestor-or-self::ata-page-block[1]/@pb-name and string(ancestor-or-self::ata-page-block[1]/@pb-name)='intro00') and not(ancestor-or-self::page-block[1]/@pb-name and string(ancestor-or-self::page-block[1]/@pb-name)='intro00') and not(ancestor::ata-page-block/@pb-name[starts-with(., 'disassy') or starts-with(., 'fault')]) and not(ancestor::page-block/@pb-name[starts-with(., 'disassy') or starts-with(., 'fault')]) and not(ancestor::book[contains(@doctype,'oh')] and ancestor::ata-page-block/@pb-name[starts-with(., 'clean')]) and not(ancestor::book[contains(@doctype,'oh')] and ancestor::page-block/@pb-name[starts-with(., 'clean')]) and not(ancestor::ata-page-block/@pb-name[starts-with(., 'mainprac')]) and not(ancestor::page-block/@pb-name[starts-with(., 'mainprac')]) and not(ancestor::book[contains(@doctype,'oh')] and ancestor::ata-page-block/@pb-name[starts-with(., 'inspect')]) and (ancestor::book[contains(@doctype,'oh')] and ancestor::page-block/@pb-name[starts-with(., 'inspect')])">
            <xsl:variable name="node-id" select="generate-id(.)"/>
            <xsl:variable name="from-node" select="(ancestor-or-self::page-block[not(ancestor::page-block)])[last()]"/>
            <xsl:variable name="num">
               <xsl:variable name="candidate-num">
                  <xsl:choose>
                     <xsl:when test="count($from-node) &gt; 0">
                        <xsl:for-each select="$from-node/descendant-or-self::*[@_gte:count-as-id='cnt__figure^page-block.cnt']">
                           <xsl:if test="generate-id(.) = $node-id">
                              <xsl:value-of select="position()"/>
                           </xsl:if>
                        </xsl:for-each>
                     </xsl:when>
                     <xsl:otherwise>
                        <xsl:for-each select="//*[@_gte:count-as-id='cnt__figure^page-block.cnt'][not(ancestor-or-self::page-block)]">
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
            <xsl:variable name="offset">
               <!--Evaluate startAtXPath using the first counted element within the numbering scope as the context node-->
               <xsl:variable name="initial-num">
                  <xsl:choose>
                     <xsl:when test="count($from-node) &gt; 0">
                        <xsl:apply-templates select="($from-node/descendant-or-self::*[@_gte:count-as-id='cnt__figure^page-block.cnt'])[1]" mode="startat-xpath"/>
                     </xsl:when>
                     <xsl:otherwise>
                        <xsl:apply-templates select="(//*[@_gte:count-as-id='cnt__figure^page-block.cnt'][not(ancestor-or-self::page-block)])[1]" mode="startat-xpath"/>
                     </xsl:otherwise>
                  </xsl:choose>
               </xsl:variable>
               <xsl:choose>
                  <xsl:when test="string(number($initial-num))!='NaN'">
                     <xsl:value-of select="$initial-num"/>
                  </xsl:when>
                  <xsl:otherwise>1</xsl:otherwise>
               </xsl:choose>
            </xsl:variable>
            <xsl:choose>
               <xsl:when test="string(number($num))!='NaN'">
                  <xsl:number value="$num + $offset - 1" format="1"/>
               </xsl:when>
               <xsl:otherwise>?</xsl:otherwise>
            </xsl:choose>
         </xsl:when>
         <xsl:when test="not(ancestor::book[contains(@doctype,'oh')] and ancestor::ata-page-block/@pb-name[.='service']) and not(ancestor::book[contains(@doctype,'oh')] and ancestor::page-block/@pb-name[.='service']) and not(ancestor::ata-page-block/@pb-name[.='00awl' or .='00intro' or .='airlim' or .='awl' or .='awlror' or .='chapsect' or .='consume' or .='d-and-o' or .='frontmatte' or .='howtouse' or .='00howtouse' or .='intro' or .='nut_option' or .='oplimits' or .='sblist' or .='schedchk' or .='spectool' or .='timelim' or .='title-page']) and not(ancestor::page-block/@pb-name[.='00awl' or .='00intro' or .='airlim' or .='awl' or .='awlror' or .='chapsect' or .='consume' or .='d-and-o' or .='frontmatte' or .='howtouse' or .='00howtouse' or .='intro' or .='nut_option' or .='oplimits' or .='sblist' or .='schedchk' or .='spectool' or .='timelim' or .='title-page']) and not(ancestor::ata-page-block/@pb-name[(starts-with(., 'do') and 'do' = translate(., '0123456789', '') and string-length(.) &gt; 2) or (starts-with(., 'in') and 'in' = translate(., '0123456789', '') and string-length(.) &gt; 2) or (starts-with(., 'tl') and 'tl' = translate(., '0123456789', '') and string-length(.) &gt; 2) or .='toolsht' or .='trlist' or .='unschedc' or .='unschedchk']) and not(ancestor::page-block/@pb-name[(starts-with(., 'do') and 'do' = translate(., '0123456789', '') and string-length(.) &gt; 2) or (starts-with(., 'in') and 'in' = translate(., '0123456789', '') and string-length(.) &gt; 2) or (starts-with(., 'tl') and 'tl' = translate(., '0123456789', '') and string-length(.) &gt; 2) or .='toolsht' or .='trlist' or .='unschedc' or .='unschedchk']) and not(ancestor-or-self::ata-page-block[1]/@pb-name and string(ancestor-or-self::ata-page-block[1]/@pb-name)='intro00') and not(ancestor-or-self::page-block[1]/@pb-name and string(ancestor-or-self::page-block[1]/@pb-name)='intro00') and not(ancestor::ata-page-block/@pb-name[starts-with(., 'disassy') or starts-with(., 'fault')]) and not(ancestor::page-block/@pb-name[starts-with(., 'disassy') or starts-with(., 'fault')]) and not(ancestor::book[contains(@doctype,'oh')] and ancestor::ata-page-block/@pb-name[starts-with(., 'clean')]) and not(ancestor::book[contains(@doctype,'oh')] and ancestor::page-block/@pb-name[starts-with(., 'clean')]) and not(ancestor::ata-page-block/@pb-name[starts-with(., 'mainprac')]) and not(ancestor::page-block/@pb-name[starts-with(., 'mainprac')]) and (ancestor::book[contains(@doctype,'oh')] and ancestor::ata-page-block/@pb-name[starts-with(., 'inspect')])">
            <xsl:variable name="node-id" select="generate-id(.)"/>
            <xsl:variable name="from-node" select="(ancestor-or-self::ata-page-block[not(ancestor::ata-page-block)])[last()]"/>
            <xsl:variable name="num">
               <xsl:variable name="candidate-num">
                  <xsl:choose>
                     <xsl:when test="count($from-node) &gt; 0">
                        <xsl:for-each select="$from-node/descendant-or-self::*[@_gte:count-as-id='cnt__figure^ata-page-block.cnt']">
                           <xsl:if test="generate-id(.) = $node-id">
                              <xsl:value-of select="position()"/>
                           </xsl:if>
                        </xsl:for-each>
                     </xsl:when>
                     <xsl:otherwise>
                        <xsl:for-each select="//*[@_gte:count-as-id='cnt__figure^ata-page-block.cnt'][not(ancestor-or-self::ata-page-block)]">
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
            <xsl:variable name="offset">
               <!--Evaluate startAtXPath using the first counted element within the numbering scope as the context node-->
               <xsl:variable name="initial-num">
                  <xsl:choose>
                     <xsl:when test="count($from-node) &gt; 0">
                        <xsl:apply-templates select="($from-node/descendant-or-self::*[@_gte:count-as-id='cnt__figure^ata-page-block.cnt'])[1]" mode="startat-xpath"/>
                     </xsl:when>
                     <xsl:otherwise>
                        <xsl:apply-templates select="(//*[@_gte:count-as-id='cnt__figure^ata-page-block.cnt'][not(ancestor-or-self::ata-page-block)])[1]" mode="startat-xpath"/>
                     </xsl:otherwise>
                  </xsl:choose>
               </xsl:variable>
               <xsl:choose>
                  <xsl:when test="string(number($initial-num))!='NaN'">
                     <xsl:value-of select="$initial-num"/>
                  </xsl:when>
                  <xsl:otherwise>1</xsl:otherwise>
               </xsl:choose>
            </xsl:variable>
            <xsl:choose>
               <xsl:when test="string(number($num))!='NaN'">
                  <xsl:number value="$num + $offset - 1" format="1"/>
               </xsl:when>
               <xsl:otherwise>?</xsl:otherwise>
            </xsl:choose>
         </xsl:when>
         <xsl:when test="not(ancestor::book[contains(@doctype,'oh')] and ancestor::ata-page-block/@pb-name[.='service']) and not(ancestor::book[contains(@doctype,'oh')] and ancestor::page-block/@pb-name[.='service']) and not(ancestor::ata-page-block/@pb-name[.='00awl' or .='00intro' or .='airlim' or .='awl' or .='awlror' or .='chapsect' or .='consume' or .='d-and-o' or .='frontmatte' or .='howtouse' or .='00howtouse' or .='intro' or .='nut_option' or .='oplimits' or .='sblist' or .='schedchk' or .='spectool' or .='timelim' or .='title-page']) and not(ancestor::page-block/@pb-name[.='00awl' or .='00intro' or .='airlim' or .='awl' or .='awlror' or .='chapsect' or .='consume' or .='d-and-o' or .='frontmatte' or .='howtouse' or .='00howtouse' or .='intro' or .='nut_option' or .='oplimits' or .='sblist' or .='schedchk' or .='spectool' or .='timelim' or .='title-page']) and not(ancestor::ata-page-block/@pb-name[(starts-with(., 'do') and 'do' = translate(., '0123456789', '') and string-length(.) &gt; 2) or (starts-with(., 'in') and 'in' = translate(., '0123456789', '') and string-length(.) &gt; 2) or (starts-with(., 'tl') and 'tl' = translate(., '0123456789', '') and string-length(.) &gt; 2) or .='toolsht' or .='trlist' or .='unschedc' or .='unschedchk']) and not(ancestor::page-block/@pb-name[(starts-with(., 'do') and 'do' = translate(., '0123456789', '') and string-length(.) &gt; 2) or (starts-with(., 'in') and 'in' = translate(., '0123456789', '') and string-length(.) &gt; 2) or (starts-with(., 'tl') and 'tl' = translate(., '0123456789', '') and string-length(.) &gt; 2) or .='toolsht' or .='trlist' or .='unschedc' or .='unschedchk']) and not(ancestor-or-self::ata-page-block[1]/@pb-name and string(ancestor-or-self::ata-page-block[1]/@pb-name)='intro00') and not(ancestor-or-self::page-block[1]/@pb-name and string(ancestor-or-self::page-block[1]/@pb-name)='intro00') and not(ancestor::ata-page-block/@pb-name[starts-with(., 'disassy') or starts-with(., 'fault')]) and not(ancestor::page-block/@pb-name[starts-with(., 'disassy') or starts-with(., 'fault')]) and not(ancestor::book[contains(@doctype,'oh')] and ancestor::ata-page-block/@pb-name[starts-with(., 'clean')]) and not(ancestor::book[contains(@doctype,'oh')] and ancestor::page-block/@pb-name[starts-with(., 'clean')]) and not(ancestor::ata-page-block/@pb-name[starts-with(., 'mainprac')]) and (ancestor::page-block/@pb-name[starts-with(., 'mainprac')])">
            <xsl:variable name="node-id" select="generate-id(.)"/>
            <xsl:variable name="from-node" select="(ancestor-or-self::page-block[not(ancestor::page-block)])[last()]"/>
            <xsl:variable name="num">
               <xsl:variable name="candidate-num">
                  <xsl:choose>
                     <xsl:when test="count($from-node) &gt; 0">
                        <xsl:for-each select="$from-node/descendant-or-self::*[@_gte:count-as-id='cnt__figure^page-block.cnt']">
                           <xsl:if test="generate-id(.) = $node-id">
                              <xsl:value-of select="position()"/>
                           </xsl:if>
                        </xsl:for-each>
                     </xsl:when>
                     <xsl:otherwise>
                        <xsl:for-each select="//*[@_gte:count-as-id='cnt__figure^page-block.cnt'][not(ancestor-or-self::page-block)]">
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
            <xsl:variable name="offset">
               <!--Evaluate startAtXPath using the first counted element within the numbering scope as the context node-->
               <xsl:variable name="initial-num">
                  <xsl:choose>
                     <xsl:when test="count($from-node) &gt; 0">
                        <xsl:apply-templates select="($from-node/descendant-or-self::*[@_gte:count-as-id='cnt__figure^page-block.cnt'])[1]" mode="startat-xpath"/>
                     </xsl:when>
                     <xsl:otherwise>
                        <xsl:apply-templates select="(//*[@_gte:count-as-id='cnt__figure^page-block.cnt'][not(ancestor-or-self::page-block)])[1]" mode="startat-xpath"/>
                     </xsl:otherwise>
                  </xsl:choose>
               </xsl:variable>
               <xsl:choose>
                  <xsl:when test="string(number($initial-num))!='NaN'">
                     <xsl:value-of select="$initial-num"/>
                  </xsl:when>
                  <xsl:otherwise>1</xsl:otherwise>
               </xsl:choose>
            </xsl:variable>
            <xsl:choose>
               <xsl:when test="string(number($num))!='NaN'">
                  <xsl:number value="$num + $offset - 1" format="1"/>
               </xsl:when>
               <xsl:otherwise>?</xsl:otherwise>
            </xsl:choose>
         </xsl:when>
         <xsl:when test="not(ancestor::book[contains(@doctype,'oh')] and ancestor::ata-page-block/@pb-name[.='service']) and not(ancestor::book[contains(@doctype,'oh')] and ancestor::page-block/@pb-name[.='service']) and not(ancestor::ata-page-block/@pb-name[.='00awl' or .='00intro' or .='airlim' or .='awl' or .='awlror' or .='chapsect' or .='consume' or .='d-and-o' or .='frontmatte' or .='howtouse' or .='00howtouse' or .='intro' or .='nut_option' or .='oplimits' or .='sblist' or .='schedchk' or .='spectool' or .='timelim' or .='title-page']) and not(ancestor::page-block/@pb-name[.='00awl' or .='00intro' or .='airlim' or .='awl' or .='awlror' or .='chapsect' or .='consume' or .='d-and-o' or .='frontmatte' or .='howtouse' or .='00howtouse' or .='intro' or .='nut_option' or .='oplimits' or .='sblist' or .='schedchk' or .='spectool' or .='timelim' or .='title-page']) and not(ancestor::ata-page-block/@pb-name[(starts-with(., 'do') and 'do' = translate(., '0123456789', '') and string-length(.) &gt; 2) or (starts-with(., 'in') and 'in' = translate(., '0123456789', '') and string-length(.) &gt; 2) or (starts-with(., 'tl') and 'tl' = translate(., '0123456789', '') and string-length(.) &gt; 2) or .='toolsht' or .='trlist' or .='unschedc' or .='unschedchk']) and not(ancestor::page-block/@pb-name[(starts-with(., 'do') and 'do' = translate(., '0123456789', '') and string-length(.) &gt; 2) or (starts-with(., 'in') and 'in' = translate(., '0123456789', '') and string-length(.) &gt; 2) or (starts-with(., 'tl') and 'tl' = translate(., '0123456789', '') and string-length(.) &gt; 2) or .='toolsht' or .='trlist' or .='unschedc' or .='unschedchk']) and not(ancestor-or-self::ata-page-block[1]/@pb-name and string(ancestor-or-self::ata-page-block[1]/@pb-name)='intro00') and not(ancestor-or-self::page-block[1]/@pb-name and string(ancestor-or-self::page-block[1]/@pb-name)='intro00') and not(ancestor::ata-page-block/@pb-name[starts-with(., 'disassy') or starts-with(., 'fault')]) and not(ancestor::page-block/@pb-name[starts-with(., 'disassy') or starts-with(., 'fault')]) and not(ancestor::book[contains(@doctype,'oh')] and ancestor::ata-page-block/@pb-name[starts-with(., 'clean')]) and not(ancestor::book[contains(@doctype,'oh')] and ancestor::page-block/@pb-name[starts-with(., 'clean')]) and (ancestor::ata-page-block/@pb-name[starts-with(., 'mainprac')])">
            <xsl:variable name="node-id" select="generate-id(.)"/>
            <xsl:variable name="from-node" select="(ancestor-or-self::ata-page-block[not(ancestor::ata-page-block)])[last()]"/>
            <xsl:variable name="num">
               <xsl:variable name="candidate-num">
                  <xsl:choose>
                     <xsl:when test="count($from-node) &gt; 0">
                        <xsl:for-each select="$from-node/descendant-or-self::*[@_gte:count-as-id='cnt__figure^ata-page-block.cnt']">
                           <xsl:if test="generate-id(.) = $node-id">
                              <xsl:value-of select="position()"/>
                           </xsl:if>
                        </xsl:for-each>
                     </xsl:when>
                     <xsl:otherwise>
                        <xsl:for-each select="//*[@_gte:count-as-id='cnt__figure^ata-page-block.cnt'][not(ancestor-or-self::ata-page-block)]">
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
            <xsl:variable name="offset">
               <!--Evaluate startAtXPath using the first counted element within the numbering scope as the context node-->
               <xsl:variable name="initial-num">
                  <xsl:choose>
                     <xsl:when test="count($from-node) &gt; 0">
                        <xsl:apply-templates select="($from-node/descendant-or-self::*[@_gte:count-as-id='cnt__figure^ata-page-block.cnt'])[1]" mode="startat-xpath"/>
                     </xsl:when>
                     <xsl:otherwise>
                        <xsl:apply-templates select="(//*[@_gte:count-as-id='cnt__figure^ata-page-block.cnt'][not(ancestor-or-self::ata-page-block)])[1]" mode="startat-xpath"/>
                     </xsl:otherwise>
                  </xsl:choose>
               </xsl:variable>
               <xsl:choose>
                  <xsl:when test="string(number($initial-num))!='NaN'">
                     <xsl:value-of select="$initial-num"/>
                  </xsl:when>
                  <xsl:otherwise>1</xsl:otherwise>
               </xsl:choose>
            </xsl:variable>
            <xsl:choose>
               <xsl:when test="string(number($num))!='NaN'">
                  <xsl:number value="$num + $offset - 1" format="1"/>
               </xsl:when>
               <xsl:otherwise>?</xsl:otherwise>
            </xsl:choose>
         </xsl:when>
         <xsl:when test="not(ancestor::book[contains(@doctype,'oh')] and ancestor::ata-page-block/@pb-name[.='service']) and not(ancestor::book[contains(@doctype,'oh')] and ancestor::page-block/@pb-name[.='service']) and not(ancestor::ata-page-block/@pb-name[.='00awl' or .='00intro' or .='airlim' or .='awl' or .='awlror' or .='chapsect' or .='consume' or .='d-and-o' or .='frontmatte' or .='howtouse' or .='00howtouse' or .='intro' or .='nut_option' or .='oplimits' or .='sblist' or .='schedchk' or .='spectool' or .='timelim' or .='title-page']) and not(ancestor::page-block/@pb-name[.='00awl' or .='00intro' or .='airlim' or .='awl' or .='awlror' or .='chapsect' or .='consume' or .='d-and-o' or .='frontmatte' or .='howtouse' or .='00howtouse' or .='intro' or .='nut_option' or .='oplimits' or .='sblist' or .='schedchk' or .='spectool' or .='timelim' or .='title-page']) and not(ancestor::ata-page-block/@pb-name[(starts-with(., 'do') and 'do' = translate(., '0123456789', '') and string-length(.) &gt; 2) or (starts-with(., 'in') and 'in' = translate(., '0123456789', '') and string-length(.) &gt; 2) or (starts-with(., 'tl') and 'tl' = translate(., '0123456789', '') and string-length(.) &gt; 2) or .='toolsht' or .='trlist' or .='unschedc' or .='unschedchk']) and not(ancestor::page-block/@pb-name[(starts-with(., 'do') and 'do' = translate(., '0123456789', '') and string-length(.) &gt; 2) or (starts-with(., 'in') and 'in' = translate(., '0123456789', '') and string-length(.) &gt; 2) or (starts-with(., 'tl') and 'tl' = translate(., '0123456789', '') and string-length(.) &gt; 2) or .='toolsht' or .='trlist' or .='unschedc' or .='unschedchk']) and not(ancestor-or-self::ata-page-block[1]/@pb-name and string(ancestor-or-self::ata-page-block[1]/@pb-name)='intro00') and not(ancestor-or-self::page-block[1]/@pb-name and string(ancestor-or-self::page-block[1]/@pb-name)='intro00') and not(ancestor::ata-page-block/@pb-name[starts-with(., 'disassy') or starts-with(., 'fault')]) and not(ancestor::page-block/@pb-name[starts-with(., 'disassy') or starts-with(., 'fault')]) and not(ancestor::book[contains(@doctype,'oh')] and ancestor::ata-page-block/@pb-name[starts-with(., 'clean')]) and (ancestor::book[contains(@doctype,'oh')] and ancestor::page-block/@pb-name[starts-with(., 'clean')])">
            <xsl:variable name="node-id" select="generate-id(.)"/>
            <xsl:variable name="from-node" select="(ancestor-or-self::page-block[not(ancestor::page-block)])[last()]"/>
            <xsl:variable name="num">
               <xsl:variable name="candidate-num">
                  <xsl:choose>
                     <xsl:when test="count($from-node) &gt; 0">
                        <xsl:for-each select="$from-node/descendant-or-self::*[@_gte:count-as-id='cnt__figure^page-block.cnt']">
                           <xsl:if test="generate-id(.) = $node-id">
                              <xsl:value-of select="position()"/>
                           </xsl:if>
                        </xsl:for-each>
                     </xsl:when>
                     <xsl:otherwise>
                        <xsl:for-each select="//*[@_gte:count-as-id='cnt__figure^page-block.cnt'][not(ancestor-or-self::page-block)]">
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
            <xsl:variable name="offset">
               <!--Evaluate startAtXPath using the first counted element within the numbering scope as the context node-->
               <xsl:variable name="initial-num">
                  <xsl:choose>
                     <xsl:when test="count($from-node) &gt; 0">
                        <xsl:apply-templates select="($from-node/descendant-or-self::*[@_gte:count-as-id='cnt__figure^page-block.cnt'])[1]" mode="startat-xpath"/>
                     </xsl:when>
                     <xsl:otherwise>
                        <xsl:apply-templates select="(//*[@_gte:count-as-id='cnt__figure^page-block.cnt'][not(ancestor-or-self::page-block)])[1]" mode="startat-xpath"/>
                     </xsl:otherwise>
                  </xsl:choose>
               </xsl:variable>
               <xsl:choose>
                  <xsl:when test="string(number($initial-num))!='NaN'">
                     <xsl:value-of select="$initial-num"/>
                  </xsl:when>
                  <xsl:otherwise>1</xsl:otherwise>
               </xsl:choose>
            </xsl:variable>
            <xsl:choose>
               <xsl:when test="string(number($num))!='NaN'">
                  <xsl:number value="$num + $offset - 1" format="1"/>
               </xsl:when>
               <xsl:otherwise>?</xsl:otherwise>
            </xsl:choose>
         </xsl:when>
         <xsl:when test="not(ancestor::book[contains(@doctype,'oh')] and ancestor::ata-page-block/@pb-name[.='service']) and not(ancestor::book[contains(@doctype,'oh')] and ancestor::page-block/@pb-name[.='service']) and not(ancestor::ata-page-block/@pb-name[.='00awl' or .='00intro' or .='airlim' or .='awl' or .='awlror' or .='chapsect' or .='consume' or .='d-and-o' or .='frontmatte' or .='howtouse' or .='00howtouse' or .='intro' or .='nut_option' or .='oplimits' or .='sblist' or .='schedchk' or .='spectool' or .='timelim' or .='title-page']) and not(ancestor::page-block/@pb-name[.='00awl' or .='00intro' or .='airlim' or .='awl' or .='awlror' or .='chapsect' or .='consume' or .='d-and-o' or .='frontmatte' or .='howtouse' or .='00howtouse' or .='intro' or .='nut_option' or .='oplimits' or .='sblist' or .='schedchk' or .='spectool' or .='timelim' or .='title-page']) and not(ancestor::ata-page-block/@pb-name[(starts-with(., 'do') and 'do' = translate(., '0123456789', '') and string-length(.) &gt; 2) or (starts-with(., 'in') and 'in' = translate(., '0123456789', '') and string-length(.) &gt; 2) or (starts-with(., 'tl') and 'tl' = translate(., '0123456789', '') and string-length(.) &gt; 2) or .='toolsht' or .='trlist' or .='unschedc' or .='unschedchk']) and not(ancestor::page-block/@pb-name[(starts-with(., 'do') and 'do' = translate(., '0123456789', '') and string-length(.) &gt; 2) or (starts-with(., 'in') and 'in' = translate(., '0123456789', '') and string-length(.) &gt; 2) or (starts-with(., 'tl') and 'tl' = translate(., '0123456789', '') and string-length(.) &gt; 2) or .='toolsht' or .='trlist' or .='unschedc' or .='unschedchk']) and not(ancestor-or-self::ata-page-block[1]/@pb-name and string(ancestor-or-self::ata-page-block[1]/@pb-name)='intro00') and not(ancestor-or-self::page-block[1]/@pb-name and string(ancestor-or-self::page-block[1]/@pb-name)='intro00') and not(ancestor::ata-page-block/@pb-name[starts-with(., 'disassy') or starts-with(., 'fault')]) and not(ancestor::page-block/@pb-name[starts-with(., 'disassy') or starts-with(., 'fault')]) and (ancestor::book[contains(@doctype,'oh')] and ancestor::ata-page-block/@pb-name[starts-with(., 'clean')])">
            <xsl:variable name="node-id" select="generate-id(.)"/>
            <xsl:variable name="from-node" select="(ancestor-or-self::ata-page-block[not(ancestor::ata-page-block)])[last()]"/>
            <xsl:variable name="num">
               <xsl:variable name="candidate-num">
                  <xsl:choose>
                     <xsl:when test="count($from-node) &gt; 0">
                        <xsl:for-each select="$from-node/descendant-or-self::*[@_gte:count-as-id='cnt__figure^ata-page-block.cnt']">
                           <xsl:if test="generate-id(.) = $node-id">
                              <xsl:value-of select="position()"/>
                           </xsl:if>
                        </xsl:for-each>
                     </xsl:when>
                     <xsl:otherwise>
                        <xsl:for-each select="//*[@_gte:count-as-id='cnt__figure^ata-page-block.cnt'][not(ancestor-or-self::ata-page-block)]">
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
            <xsl:variable name="offset">
               <!--Evaluate startAtXPath using the first counted element within the numbering scope as the context node-->
               <xsl:variable name="initial-num">
                  <xsl:choose>
                     <xsl:when test="count($from-node) &gt; 0">
                        <xsl:apply-templates select="($from-node/descendant-or-self::*[@_gte:count-as-id='cnt__figure^ata-page-block.cnt'])[1]" mode="startat-xpath"/>
                     </xsl:when>
                     <xsl:otherwise>
                        <xsl:apply-templates select="(//*[@_gte:count-as-id='cnt__figure^ata-page-block.cnt'][not(ancestor-or-self::ata-page-block)])[1]" mode="startat-xpath"/>
                     </xsl:otherwise>
                  </xsl:choose>
               </xsl:variable>
               <xsl:choose>
                  <xsl:when test="string(number($initial-num))!='NaN'">
                     <xsl:value-of select="$initial-num"/>
                  </xsl:when>
                  <xsl:otherwise>1</xsl:otherwise>
               </xsl:choose>
            </xsl:variable>
            <xsl:choose>
               <xsl:when test="string(number($num))!='NaN'">
                  <xsl:number value="$num + $offset - 1" format="1"/>
               </xsl:when>
               <xsl:otherwise>?</xsl:otherwise>
            </xsl:choose>
         </xsl:when>
         <xsl:when test="not(ancestor::book[contains(@doctype,'oh')] and ancestor::ata-page-block/@pb-name[.='service']) and not(ancestor::book[contains(@doctype,'oh')] and ancestor::page-block/@pb-name[.='service']) and not(ancestor::ata-page-block/@pb-name[.='00awl' or .='00intro' or .='airlim' or .='awl' or .='awlror' or .='chapsect' or .='consume' or .='d-and-o' or .='frontmatte' or .='howtouse' or .='00howtouse' or .='intro' or .='nut_option' or .='oplimits' or .='sblist' or .='schedchk' or .='spectool' or .='timelim' or .='title-page']) and not(ancestor::page-block/@pb-name[.='00awl' or .='00intro' or .='airlim' or .='awl' or .='awlror' or .='chapsect' or .='consume' or .='d-and-o' or .='frontmatte' or .='howtouse' or .='00howtouse' or .='intro' or .='nut_option' or .='oplimits' or .='sblist' or .='schedchk' or .='spectool' or .='timelim' or .='title-page']) and not(ancestor::ata-page-block/@pb-name[(starts-with(., 'do') and 'do' = translate(., '0123456789', '') and string-length(.) &gt; 2) or (starts-with(., 'in') and 'in' = translate(., '0123456789', '') and string-length(.) &gt; 2) or (starts-with(., 'tl') and 'tl' = translate(., '0123456789', '') and string-length(.) &gt; 2) or .='toolsht' or .='trlist' or .='unschedc' or .='unschedchk']) and not(ancestor::page-block/@pb-name[(starts-with(., 'do') and 'do' = translate(., '0123456789', '') and string-length(.) &gt; 2) or (starts-with(., 'in') and 'in' = translate(., '0123456789', '') and string-length(.) &gt; 2) or (starts-with(., 'tl') and 'tl' = translate(., '0123456789', '') and string-length(.) &gt; 2) or .='toolsht' or .='trlist' or .='unschedc' or .='unschedchk']) and not(ancestor-or-self::ata-page-block[1]/@pb-name and string(ancestor-or-self::ata-page-block[1]/@pb-name)='intro00') and not(ancestor-or-self::page-block[1]/@pb-name and string(ancestor-or-self::page-block[1]/@pb-name)='intro00') and not(ancestor::ata-page-block/@pb-name[starts-with(., 'disassy') or starts-with(., 'fault')]) and (ancestor::page-block/@pb-name[starts-with(., 'disassy') or starts-with(., 'fault')])">
            <xsl:variable name="node-id" select="generate-id(.)"/>
            <xsl:variable name="from-node" select="(ancestor-or-self::page-block[not(ancestor::page-block)])[last()]"/>
            <xsl:variable name="num">
               <xsl:variable name="candidate-num">
                  <xsl:choose>
                     <xsl:when test="count($from-node) &gt; 0">
                        <xsl:for-each select="$from-node/descendant-or-self::*[@_gte:count-as-id='cnt__figure^page-block.cnt']">
                           <xsl:if test="generate-id(.) = $node-id">
                              <xsl:value-of select="position()"/>
                           </xsl:if>
                        </xsl:for-each>
                     </xsl:when>
                     <xsl:otherwise>
                        <xsl:for-each select="//*[@_gte:count-as-id='cnt__figure^page-block.cnt'][not(ancestor-or-self::page-block)]">
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
            <xsl:variable name="offset">
               <!--Evaluate startAtXPath using the first counted element within the numbering scope as the context node-->
               <xsl:variable name="initial-num">
                  <xsl:choose>
                     <xsl:when test="count($from-node) &gt; 0">
                        <xsl:apply-templates select="($from-node/descendant-or-self::*[@_gte:count-as-id='cnt__figure^page-block.cnt'])[1]" mode="startat-xpath"/>
                     </xsl:when>
                     <xsl:otherwise>
                        <xsl:apply-templates select="(//*[@_gte:count-as-id='cnt__figure^page-block.cnt'][not(ancestor-or-self::page-block)])[1]" mode="startat-xpath"/>
                     </xsl:otherwise>
                  </xsl:choose>
               </xsl:variable>
               <xsl:choose>
                  <xsl:when test="string(number($initial-num))!='NaN'">
                     <xsl:value-of select="$initial-num"/>
                  </xsl:when>
                  <xsl:otherwise>1</xsl:otherwise>
               </xsl:choose>
            </xsl:variable>
            <xsl:choose>
               <xsl:when test="string(number($num))!='NaN'">
                  <xsl:number value="$num + $offset - 1" format="1"/>
               </xsl:when>
               <xsl:otherwise>?</xsl:otherwise>
            </xsl:choose>
         </xsl:when>
         <xsl:when test="not(ancestor::book[contains(@doctype,'oh')] and ancestor::ata-page-block/@pb-name[.='service']) and not(ancestor::book[contains(@doctype,'oh')] and ancestor::page-block/@pb-name[.='service']) and not(ancestor::ata-page-block/@pb-name[.='00awl' or .='00intro' or .='airlim' or .='awl' or .='awlror' or .='chapsect' or .='consume' or .='d-and-o' or .='frontmatte' or .='howtouse' or .='00howtouse' or .='intro' or .='nut_option' or .='oplimits' or .='sblist' or .='schedchk' or .='spectool' or .='timelim' or .='title-page']) and not(ancestor::page-block/@pb-name[.='00awl' or .='00intro' or .='airlim' or .='awl' or .='awlror' or .='chapsect' or .='consume' or .='d-and-o' or .='frontmatte' or .='howtouse' or .='00howtouse' or .='intro' or .='nut_option' or .='oplimits' or .='sblist' or .='schedchk' or .='spectool' or .='timelim' or .='title-page']) and not(ancestor::ata-page-block/@pb-name[(starts-with(., 'do') and 'do' = translate(., '0123456789', '') and string-length(.) &gt; 2) or (starts-with(., 'in') and 'in' = translate(., '0123456789', '') and string-length(.) &gt; 2) or (starts-with(., 'tl') and 'tl' = translate(., '0123456789', '') and string-length(.) &gt; 2) or .='toolsht' or .='trlist' or .='unschedc' or .='unschedchk']) and not(ancestor::page-block/@pb-name[(starts-with(., 'do') and 'do' = translate(., '0123456789', '') and string-length(.) &gt; 2) or (starts-with(., 'in') and 'in' = translate(., '0123456789', '') and string-length(.) &gt; 2) or (starts-with(., 'tl') and 'tl' = translate(., '0123456789', '') and string-length(.) &gt; 2) or .='toolsht' or .='trlist' or .='unschedc' or .='unschedchk']) and not(ancestor-or-self::ata-page-block[1]/@pb-name and string(ancestor-or-self::ata-page-block[1]/@pb-name)='intro00') and not(ancestor-or-self::page-block[1]/@pb-name and string(ancestor-or-self::page-block[1]/@pb-name)='intro00') and (ancestor::ata-page-block/@pb-name[starts-with(., 'disassy') or starts-with(., 'fault')])">
            <xsl:variable name="node-id" select="generate-id(.)"/>
            <xsl:variable name="from-node" select="(ancestor-or-self::ata-page-block[not(ancestor::ata-page-block)])[last()]"/>
            <xsl:variable name="num">
               <xsl:variable name="candidate-num">
                  <xsl:choose>
                     <xsl:when test="count($from-node) &gt; 0">
                        <xsl:for-each select="$from-node/descendant-or-self::*[@_gte:count-as-id='cnt__figure^ata-page-block.cnt']">
                           <xsl:if test="generate-id(.) = $node-id">
                              <xsl:value-of select="position()"/>
                           </xsl:if>
                        </xsl:for-each>
                     </xsl:when>
                     <xsl:otherwise>
                        <xsl:for-each select="//*[@_gte:count-as-id='cnt__figure^ata-page-block.cnt'][not(ancestor-or-self::ata-page-block)]">
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
            <xsl:variable name="offset">
               <!--Evaluate startAtXPath using the first counted element within the numbering scope as the context node-->
               <xsl:variable name="initial-num">
                  <xsl:choose>
                     <xsl:when test="count($from-node) &gt; 0">
                        <xsl:apply-templates select="($from-node/descendant-or-self::*[@_gte:count-as-id='cnt__figure^ata-page-block.cnt'])[1]" mode="startat-xpath"/>
                     </xsl:when>
                     <xsl:otherwise>
                        <xsl:apply-templates select="(//*[@_gte:count-as-id='cnt__figure^ata-page-block.cnt'][not(ancestor-or-self::ata-page-block)])[1]" mode="startat-xpath"/>
                     </xsl:otherwise>
                  </xsl:choose>
               </xsl:variable>
               <xsl:choose>
                  <xsl:when test="string(number($initial-num))!='NaN'">
                     <xsl:value-of select="$initial-num"/>
                  </xsl:when>
                  <xsl:otherwise>1</xsl:otherwise>
               </xsl:choose>
            </xsl:variable>
            <xsl:choose>
               <xsl:when test="string(number($num))!='NaN'">
                  <xsl:number value="$num + $offset - 1" format="1"/>
               </xsl:when>
               <xsl:otherwise>?</xsl:otherwise>
            </xsl:choose>
         </xsl:when>
         <xsl:when test="not(ancestor::book[contains(@doctype,'oh')] and ancestor::ata-page-block/@pb-name[.='service']) and not(ancestor::book[contains(@doctype,'oh')] and ancestor::page-block/@pb-name[.='service']) and not(ancestor::ata-page-block/@pb-name[.='00awl' or .='00intro' or .='airlim' or .='awl' or .='awlror' or .='chapsect' or .='consume' or .='d-and-o' or .='frontmatte' or .='howtouse' or .='00howtouse' or .='intro' or .='nut_option' or .='oplimits' or .='sblist' or .='schedchk' or .='spectool' or .='timelim' or .='title-page']) and not(ancestor::page-block/@pb-name[.='00awl' or .='00intro' or .='airlim' or .='awl' or .='awlror' or .='chapsect' or .='consume' or .='d-and-o' or .='frontmatte' or .='howtouse' or .='00howtouse' or .='intro' or .='nut_option' or .='oplimits' or .='sblist' or .='schedchk' or .='spectool' or .='timelim' or .='title-page']) and not(ancestor::ata-page-block/@pb-name[(starts-with(., 'do') and 'do' = translate(., '0123456789', '') and string-length(.) &gt; 2) or (starts-with(., 'in') and 'in' = translate(., '0123456789', '') and string-length(.) &gt; 2) or (starts-with(., 'tl') and 'tl' = translate(., '0123456789', '') and string-length(.) &gt; 2) or .='toolsht' or .='trlist' or .='unschedc' or .='unschedchk']) and not(ancestor::page-block/@pb-name[(starts-with(., 'do') and 'do' = translate(., '0123456789', '') and string-length(.) &gt; 2) or (starts-with(., 'in') and 'in' = translate(., '0123456789', '') and string-length(.) &gt; 2) or (starts-with(., 'tl') and 'tl' = translate(., '0123456789', '') and string-length(.) &gt; 2) or .='toolsht' or .='trlist' or .='unschedc' or .='unschedchk']) and not(ancestor-or-self::ata-page-block[1]/@pb-name and string(ancestor-or-self::ata-page-block[1]/@pb-name)='intro00') and (ancestor-or-self::page-block[1]/@pb-name and string(ancestor-or-self::page-block[1]/@pb-name)='intro00')">
            <xsl:variable name="node-id" select="generate-id(.)"/>
            <xsl:variable name="from-node" select="(ancestor-or-self::page-block[not(ancestor::page-block)])[last()]"/>
            <xsl:variable name="num">
               <xsl:variable name="candidate-num">
                  <xsl:choose>
                     <xsl:when test="count($from-node) &gt; 0">
                        <xsl:for-each select="$from-node/descendant-or-self::*[@_gte:count-as-id='cnt__figure^page-block.cnt']">
                           <xsl:if test="generate-id(.) = $node-id">
                              <xsl:value-of select="position()"/>
                           </xsl:if>
                        </xsl:for-each>
                     </xsl:when>
                     <xsl:otherwise>
                        <xsl:for-each select="//*[@_gte:count-as-id='cnt__figure^page-block.cnt'][not(ancestor-or-self::page-block)]">
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
            <xsl:variable name="offset">
               <!--Evaluate startAtXPath using the first counted element within the numbering scope as the context node-->
               <xsl:variable name="initial-num">
                  <xsl:choose>
                     <xsl:when test="count($from-node) &gt; 0">
                        <xsl:apply-templates select="($from-node/descendant-or-self::*[@_gte:count-as-id='cnt__figure^page-block.cnt'])[1]" mode="startat-xpath"/>
                     </xsl:when>
                     <xsl:otherwise>
                        <xsl:apply-templates select="(//*[@_gte:count-as-id='cnt__figure^page-block.cnt'][not(ancestor-or-self::page-block)])[1]" mode="startat-xpath"/>
                     </xsl:otherwise>
                  </xsl:choose>
               </xsl:variable>
               <xsl:choose>
                  <xsl:when test="string(number($initial-num))!='NaN'">
                     <xsl:value-of select="$initial-num"/>
                  </xsl:when>
                  <xsl:otherwise>1</xsl:otherwise>
               </xsl:choose>
            </xsl:variable>
            <xsl:choose>
               <xsl:when test="string(number($num))!='NaN'">
                  <xsl:number value="$num + $offset - 1" format="1"/>
               </xsl:when>
               <xsl:otherwise>?</xsl:otherwise>
            </xsl:choose>
         </xsl:when>
         <xsl:when test="not(ancestor::book[contains(@doctype,'oh')] and ancestor::ata-page-block/@pb-name[.='service']) and not(ancestor::book[contains(@doctype,'oh')] and ancestor::page-block/@pb-name[.='service']) and not(ancestor::ata-page-block/@pb-name[.='00awl' or .='00intro' or .='airlim' or .='awl' or .='awlror' or .='chapsect' or .='consume' or .='d-and-o' or .='frontmatte' or .='howtouse' or .='00howtouse' or .='intro' or .='nut_option' or .='oplimits' or .='sblist' or .='schedchk' or .='spectool' or .='timelim' or .='title-page']) and not(ancestor::page-block/@pb-name[.='00awl' or .='00intro' or .='airlim' or .='awl' or .='awlror' or .='chapsect' or .='consume' or .='d-and-o' or .='frontmatte' or .='howtouse' or .='00howtouse' or .='intro' or .='nut_option' or .='oplimits' or .='sblist' or .='schedchk' or .='spectool' or .='timelim' or .='title-page']) and not(ancestor::ata-page-block/@pb-name[(starts-with(., 'do') and 'do' = translate(., '0123456789', '') and string-length(.) &gt; 2) or (starts-with(., 'in') and 'in' = translate(., '0123456789', '') and string-length(.) &gt; 2) or (starts-with(., 'tl') and 'tl' = translate(., '0123456789', '') and string-length(.) &gt; 2) or .='toolsht' or .='trlist' or .='unschedc' or .='unschedchk']) and not(ancestor::page-block/@pb-name[(starts-with(., 'do') and 'do' = translate(., '0123456789', '') and string-length(.) &gt; 2) or (starts-with(., 'in') and 'in' = translate(., '0123456789', '') and string-length(.) &gt; 2) or (starts-with(., 'tl') and 'tl' = translate(., '0123456789', '') and string-length(.) &gt; 2) or .='toolsht' or .='trlist' or .='unschedc' or .='unschedchk']) and (ancestor-or-self::ata-page-block[1]/@pb-name and string(ancestor-or-self::ata-page-block[1]/@pb-name)='intro00')">
            <xsl:variable name="node-id" select="generate-id(.)"/>
            <xsl:variable name="from-node" select="(ancestor-or-self::ata-page-block[not(ancestor::ata-page-block)])[last()]"/>
            <xsl:variable name="num">
               <xsl:variable name="candidate-num">
                  <xsl:choose>
                     <xsl:when test="count($from-node) &gt; 0">
                        <xsl:for-each select="$from-node/descendant-or-self::*[@_gte:count-as-id='cnt__figure^ata-page-block.cnt']">
                           <xsl:if test="generate-id(.) = $node-id">
                              <xsl:value-of select="position()"/>
                           </xsl:if>
                        </xsl:for-each>
                     </xsl:when>
                     <xsl:otherwise>
                        <xsl:for-each select="//*[@_gte:count-as-id='cnt__figure^ata-page-block.cnt'][not(ancestor-or-self::ata-page-block)]">
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
            <xsl:variable name="offset">
               <!--Evaluate startAtXPath using the first counted element within the numbering scope as the context node-->
               <xsl:variable name="initial-num">
                  <xsl:choose>
                     <xsl:when test="count($from-node) &gt; 0">
                        <xsl:apply-templates select="($from-node/descendant-or-self::*[@_gte:count-as-id='cnt__figure^ata-page-block.cnt'])[1]" mode="startat-xpath"/>
                     </xsl:when>
                     <xsl:otherwise>
                        <xsl:apply-templates select="(//*[@_gte:count-as-id='cnt__figure^ata-page-block.cnt'][not(ancestor-or-self::ata-page-block)])[1]" mode="startat-xpath"/>
                     </xsl:otherwise>
                  </xsl:choose>
               </xsl:variable>
               <xsl:choose>
                  <xsl:when test="string(number($initial-num))!='NaN'">
                     <xsl:value-of select="$initial-num"/>
                  </xsl:when>
                  <xsl:otherwise>1</xsl:otherwise>
               </xsl:choose>
            </xsl:variable>
            <xsl:choose>
               <xsl:when test="string(number($num))!='NaN'">
                  <xsl:number value="$num + $offset - 1" format="1"/>
               </xsl:when>
               <xsl:otherwise>?</xsl:otherwise>
            </xsl:choose>
         </xsl:when>
         <xsl:when test="not(ancestor::book[contains(@doctype,'oh')] and ancestor::ata-page-block/@pb-name[.='service']) and not(ancestor::book[contains(@doctype,'oh')] and ancestor::page-block/@pb-name[.='service']) and not(ancestor::ata-page-block/@pb-name[.='00awl' or .='00intro' or .='airlim' or .='awl' or .='awlror' or .='chapsect' or .='consume' or .='d-and-o' or .='frontmatte' or .='howtouse' or .='00howtouse' or .='intro' or .='nut_option' or .='oplimits' or .='sblist' or .='schedchk' or .='spectool' or .='timelim' or .='title-page']) and not(ancestor::page-block/@pb-name[.='00awl' or .='00intro' or .='airlim' or .='awl' or .='awlror' or .='chapsect' or .='consume' or .='d-and-o' or .='frontmatte' or .='howtouse' or .='00howtouse' or .='intro' or .='nut_option' or .='oplimits' or .='sblist' or .='schedchk' or .='spectool' or .='timelim' or .='title-page']) and not(ancestor::ata-page-block/@pb-name[(starts-with(., 'do') and 'do' = translate(., '0123456789', '') and string-length(.) &gt; 2) or (starts-with(., 'in') and 'in' = translate(., '0123456789', '') and string-length(.) &gt; 2) or (starts-with(., 'tl') and 'tl' = translate(., '0123456789', '') and string-length(.) &gt; 2) or .='toolsht' or .='trlist' or .='unschedc' or .='unschedchk']) and (ancestor::page-block/@pb-name[(starts-with(., 'do') and 'do' = translate(., '0123456789', '') and string-length(.) &gt; 2) or (starts-with(., 'in') and 'in' = translate(., '0123456789', '') and string-length(.) &gt; 2) or (starts-with(., 'tl') and 'tl' = translate(., '0123456789', '') and string-length(.) &gt; 2) or .='toolsht' or .='trlist' or .='unschedc' or .='unschedchk'])">
            <xsl:variable name="node-id" select="generate-id(.)"/>
            <xsl:variable name="from-node" select="(ancestor-or-self::page-block[not(ancestor::page-block)])[last()]"/>
            <xsl:variable name="num">
               <xsl:variable name="candidate-num">
                  <xsl:choose>
                     <xsl:when test="count($from-node) &gt; 0">
                        <xsl:for-each select="$from-node/descendant-or-self::*[@_gte:count-as-id='cnt__figure^page-block.cnt']">
                           <xsl:if test="generate-id(.) = $node-id">
                              <xsl:value-of select="position()"/>
                           </xsl:if>
                        </xsl:for-each>
                     </xsl:when>
                     <xsl:otherwise>
                        <xsl:for-each select="//*[@_gte:count-as-id='cnt__figure^page-block.cnt'][not(ancestor-or-self::page-block)]">
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
         </xsl:when>
         <xsl:when test="not(ancestor::book[contains(@doctype,'oh')] and ancestor::ata-page-block/@pb-name[.='service']) and not(ancestor::book[contains(@doctype,'oh')] and ancestor::page-block/@pb-name[.='service']) and not(ancestor::ata-page-block/@pb-name[.='00awl' or .='00intro' or .='airlim' or .='awl' or .='awlror' or .='chapsect' or .='consume' or .='d-and-o' or .='frontmatte' or .='howtouse' or .='00howtouse' or .='intro' or .='nut_option' or .='oplimits' or .='sblist' or .='schedchk' or .='spectool' or .='timelim' or .='title-page']) and not(ancestor::page-block/@pb-name[.='00awl' or .='00intro' or .='airlim' or .='awl' or .='awlror' or .='chapsect' or .='consume' or .='d-and-o' or .='frontmatte' or .='howtouse' or .='00howtouse' or .='intro' or .='nut_option' or .='oplimits' or .='sblist' or .='schedchk' or .='spectool' or .='timelim' or .='title-page']) and (ancestor::ata-page-block/@pb-name[(starts-with(., 'do') and 'do' = translate(., '0123456789', '') and string-length(.) &gt; 2) or (starts-with(., 'in') and 'in' = translate(., '0123456789', '') and string-length(.) &gt; 2) or (starts-with(., 'tl') and 'tl' = translate(., '0123456789', '') and string-length(.) &gt; 2) or .='toolsht' or .='trlist' or .='unschedc' or .='unschedchk'])">
            <xsl:variable name="node-id" select="generate-id(.)"/>
            <xsl:variable name="from-node" select="(ancestor-or-self::ata-page-block[not(ancestor::ata-page-block)])[last()]"/>
            <xsl:variable name="num">
               <xsl:variable name="candidate-num">
                  <xsl:choose>
                     <xsl:when test="count($from-node) &gt; 0">
                        <xsl:for-each select="$from-node/descendant-or-self::*[@_gte:count-as-id='cnt__figure^ata-page-block.cnt']">
                           <xsl:if test="generate-id(.) = $node-id">
                              <xsl:value-of select="position()"/>
                           </xsl:if>
                        </xsl:for-each>
                     </xsl:when>
                     <xsl:otherwise>
                        <xsl:for-each select="//*[@_gte:count-as-id='cnt__figure^ata-page-block.cnt'][not(ancestor-or-self::ata-page-block)]">
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
         </xsl:when>
         <xsl:when test="not(ancestor::book[contains(@doctype,'oh')] and ancestor::ata-page-block/@pb-name[.='service']) and not(ancestor::book[contains(@doctype,'oh')] and ancestor::page-block/@pb-name[.='service']) and not(ancestor::ata-page-block/@pb-name[.='00awl' or .='00intro' or .='airlim' or .='awl' or .='awlror' or .='chapsect' or .='consume' or .='d-and-o' or .='frontmatte' or .='howtouse' or .='00howtouse' or .='intro' or .='nut_option' or .='oplimits' or .='sblist' or .='schedchk' or .='spectool' or .='timelim' or .='title-page']) and (ancestor::page-block/@pb-name[.='00awl' or .='00intro' or .='airlim' or .='awl' or .='awlror' or .='chapsect' or .='consume' or .='d-and-o' or .='frontmatte' or .='howtouse' or .='00howtouse' or .='intro' or .='nut_option' or .='oplimits' or .='sblist' or .='schedchk' or .='spectool' or .='timelim' or .='title-page'])">
            <xsl:variable name="node-id" select="generate-id(.)"/>
            <xsl:variable name="from-node" select="(ancestor-or-self::page-block[not(ancestor::page-block)])[last()]"/>
            <xsl:variable name="num">
               <xsl:variable name="candidate-num">
                  <xsl:choose>
                     <xsl:when test="count($from-node) &gt; 0">
                        <xsl:for-each select="$from-node/descendant-or-self::*[@_gte:count-as-id='cnt__figure^page-block.cnt']">
                           <xsl:if test="generate-id(.) = $node-id">
                              <xsl:value-of select="position()"/>
                           </xsl:if>
                        </xsl:for-each>
                     </xsl:when>
                     <xsl:otherwise>
                        <xsl:for-each select="//*[@_gte:count-as-id='cnt__figure^page-block.cnt'][not(ancestor-or-self::page-block)]">
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
         </xsl:when>
         <xsl:when test="not(ancestor::book[contains(@doctype,'oh')] and ancestor::ata-page-block/@pb-name[.='service']) and not(ancestor::book[contains(@doctype,'oh')] and ancestor::page-block/@pb-name[.='service']) and (ancestor::ata-page-block/@pb-name[.='00awl' or .='00intro' or .='airlim' or .='awl' or .='awlror' or .='chapsect' or .='consume' or .='d-and-o' or .='frontmatte' or .='howtouse' or .='00howtouse' or .='intro' or .='nut_option' or .='oplimits' or .='sblist' or .='schedchk' or .='spectool' or .='timelim' or .='title-page'])">
            <xsl:variable name="node-id" select="generate-id(.)"/>
            <xsl:variable name="from-node" select="(ancestor-or-self::ata-page-block[not(ancestor::ata-page-block)])[last()]"/>
            <xsl:variable name="num">
               <xsl:variable name="candidate-num">
                  <xsl:choose>
                     <xsl:when test="count($from-node) &gt; 0">
                        <xsl:for-each select="$from-node/descendant-or-self::*[@_gte:count-as-id='cnt__figure^ata-page-block.cnt']">
                           <xsl:if test="generate-id(.) = $node-id">
                              <xsl:value-of select="position()"/>
                           </xsl:if>
                        </xsl:for-each>
                     </xsl:when>
                     <xsl:otherwise>
                        <xsl:for-each select="//*[@_gte:count-as-id='cnt__figure^ata-page-block.cnt'][not(ancestor-or-self::ata-page-block)]">
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
         </xsl:when>
      </xsl:choose>
   </xsl:template>

<xsl:template match="pwcpbfront/title" mode="styler_numbering" priority="39">
      <!--This context has no numbering-->
      <xsl:param name="do-qmark" select="'yes'"/>
      <xsl:if test="$do-qmark='yes'">
         <xsl:value-of select="'?'"/>
      </xsl:if>
   </xsl:template>

<xsl:template match="procedure/title" mode="styler_numbering" priority="37">
      <xsl:variable name="node-id" select="generate-id(.)"/>
      <xsl:variable name="from-node" select="(ancestor-or-self::n-para[not(ancestor::n-para)])[last()]"/>
      <xsl:variable name="num">
         <xsl:variable name="candidate-num">
            <xsl:choose>
               <xsl:when test="count($from-node) &gt; 0">
                  <xsl:for-each select="$from-node/descendant-or-self::*[@_gte:count-as-id='subpara']">
                     <xsl:if test="generate-id(.) = $node-id">
                        <xsl:value-of select="position()"/>
                     </xsl:if>
                  </xsl:for-each>
               </xsl:when>
               <xsl:otherwise>
                  <xsl:for-each select="//*[@_gte:count-as-id='subpara'][not(ancestor-or-self::n-para)]">
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
            <xsl:number value="$num" format="A"/>
         </xsl:when>
         <xsl:otherwise>?</xsl:otherwise>
      </xsl:choose>
      <xsl:text>.</xsl:text>
   </xsl:template>

<xsl:template match="pwcspblist/title" mode="styler_numbering" priority="35">
      <!--This context has no numbering-->
      <xsl:param name="do-qmark" select="'yes'"/>
      <xsl:if test="$do-qmark='yes'">
         <xsl:value-of select="'?'"/>
      </xsl:if>
   </xsl:template>

<xsl:template match="taskproc/title" mode="styler_numbering" priority="34">
      <xsl:variable name="node-id" select="generate-id(.)"/>
      <xsl:variable name="from-node" select="(ancestor-or-self::task[not(ancestor::task)])[last()]"/>
      <xsl:variable name="num">
         <xsl:variable name="candidate-num">
            <xsl:choose>
               <xsl:when test="count($from-node) &gt; 0">
                  <xsl:for-each select="$from-node/descendant-or-self::*[@_gte:count-as-id='subtask']">
                     <xsl:if test="generate-id(.) = $node-id">
                        <xsl:value-of select="position()"/>
                     </xsl:if>
                  </xsl:for-each>
               </xsl:when>
               <xsl:otherwise>
                  <xsl:for-each select="//*[@_gte:count-as-id='subtask'][not(ancestor-or-self::task)]">
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
            <xsl:number value="$num" format="A"/>
         </xsl:when>
         <xsl:otherwise>?</xsl:otherwise>
      </xsl:choose>
      <xsl:text>.</xsl:text>
   </xsl:template>

<xsl:template match="nutopt/title" mode="styler_numbering" priority="32">
      <xsl:number count="nutopt[title]" format="1"/>
      <xsl:text>.</xsl:text>
   </xsl:template>

<xsl:template match="sblist/title" mode="styler_numbering" priority="32">
      <!--This context has no numbering-->
      <xsl:param name="do-qmark" select="'yes'"/>
      <xsl:if test="$do-qmark='yes'">
         <xsl:value-of select="'?'"/>
      </xsl:if>
   </xsl:template>

<xsl:template match="pwcni/title" mode="styler_numbering" priority="31">
      <!--This context has no numbering-->
      <xsl:param name="do-qmark" select="'yes'"/>
      <xsl:if test="$do-qmark='yes'">
         <xsl:value-of select="'?'"/>
      </xsl:if>
   </xsl:template>

<xsl:template match="vendlist/title" mode="styler_numbering" priority="30">
      <!--This context has no numbering-->
      <xsl:param name="do-qmark" select="'yes'"/>
      <xsl:if test="$do-qmark='yes'">
         <xsl:value-of select="'?'"/>
      </xsl:if>
   </xsl:template>

<xsl:template match="pgblk/title" mode="styler_numbering" priority="29">
      <!--This context has no numbering-->
      <xsl:param name="do-qmark" select="'yes'"/>
      <xsl:if test="$do-qmark='yes'">
         <xsl:value-of select="'?'"/>
      </xsl:if>
   </xsl:template>

<xsl:template match="pwcchapsect-item/title" mode="styler_numbering" priority="28">
      <!--This context has no numbering-->
      <xsl:param name="do-qmark" select="'yes'"/>
      <xsl:if test="$do-qmark='yes'">
         <xsl:value-of select="'?'"/>
      </xsl:if>
   </xsl:template>

<xsl:template match="tprereq/title" mode="styler_numbering" priority="27">
      <xsl:variable name="node-id" select="generate-id(.)"/>
      <xsl:variable name="from-node" select="(ancestor-or-self::task[not(ancestor::task)])[last()]"/>
      <xsl:variable name="num">
         <xsl:variable name="candidate-num">
            <xsl:choose>
               <xsl:when test="count($from-node) &gt; 0">
                  <xsl:for-each select="$from-node/descendant-or-self::*[@_gte:count-as-id='subtask']">
                     <xsl:if test="generate-id(.) = $node-id">
                        <xsl:value-of select="position()"/>
                     </xsl:if>
                  </xsl:for-each>
               </xsl:when>
               <xsl:otherwise>
                  <xsl:for-each select="//*[@_gte:count-as-id='subtask'][not(ancestor-or-self::task)]">
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
            <xsl:number value="$num" format="A"/>
         </xsl:when>
         <xsl:otherwise>?</xsl:otherwise>
      </xsl:choose>
      <xsl:text>.</xsl:text>
   </xsl:template>

<xsl:template match="subtask/title" mode="styler_numbering" priority="26">
      <xsl:variable name="node-id" select="generate-id(.)"/>
      <xsl:variable name="from-node" select="(ancestor-or-self::task[not(ancestor::task)])[last()]"/>
      <xsl:variable name="num">
         <xsl:variable name="candidate-num">
            <xsl:choose>
               <xsl:when test="count($from-node) &gt; 0">
                  <xsl:for-each select="$from-node/descendant-or-self::*[@_gte:count-as-id='subtask']">
                     <xsl:if test="generate-id(.) = $node-id">
                        <xsl:value-of select="position()"/>
                     </xsl:if>
                  </xsl:for-each>
               </xsl:when>
               <xsl:otherwise>
                  <xsl:for-each select="//*[@_gte:count-as-id='subtask'][not(ancestor-or-self::task)]">
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
            <xsl:number value="$num" format="A"/>
         </xsl:when>
         <xsl:otherwise>?</xsl:otherwise>
      </xsl:choose>
      <xsl:text>.</xsl:text>
   </xsl:template>

<xsl:template match="fits/title" mode="styler_numbering" priority="25">
      <!--This context has no numbering-->
      <xsl:param name="do-qmark" select="'yes'"/>
      <xsl:if test="$do-qmark='yes'">
         <xsl:value-of select="'?'"/>
      </xsl:if>
   </xsl:template>

<xsl:template match="task/title" mode="styler_numbering" priority="24">
      <xsl:variable name="node-id" select="generate-id(.)"/>
      <xsl:variable name="from-node" select="(ancestor-or-self::pgblk[not(ancestor::pgblk)])[last()]"/>
      <xsl:variable name="num">
         <xsl:variable name="candidate-num">
            <xsl:choose>
               <xsl:when test="count($from-node) &gt; 0">
                  <xsl:for-each select="$from-node/descendant-or-self::*[@_gte:count-as-id='task']">
                     <xsl:if test="generate-id(.) = $node-id">
                        <xsl:value-of select="position()"/>
                     </xsl:if>
                  </xsl:for-each>
               </xsl:when>
               <xsl:otherwise>
                  <xsl:for-each select="//*[@_gte:count-as-id='task'][not(ancestor-or-self::pgblk)]">
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
            <xsl:number format="1" value="$num"/>
         </xsl:when>
         <xsl:otherwise>?</xsl:otherwise>
      </xsl:choose>
      <xsl:text>.</xsl:text>
   </xsl:template>

<xsl:template match="highlights/title" mode="styler_numbering" priority="22">
      <!--This context has no numbering-->
      <xsl:param name="do-qmark" select="'yes'"/>
      <xsl:if test="$do-qmark='yes'">
         <xsl:value-of select="'?'"/>
      </xsl:if>
   </xsl:template>

<xsl:template match="lof-item/title" mode="styler_numbering" priority="21">
      <!--This context has no numbering-->
      <xsl:param name="do-qmark" select="'yes'"/>
      <xsl:if test="$do-qmark='yes'">
         <xsl:value-of select="'?'"/>
      </xsl:if>
   </xsl:template>

<xsl:template match="lot-item/title" mode="styler_numbering" priority="20">
      <!--This context has no numbering-->
      <xsl:param name="do-qmark" select="'yes'"/>
      <xsl:if test="$do-qmark='yes'">
         <xsl:value-of select="'?'"/>
      </xsl:if>
   </xsl:template>

<xsl:template match="lot/title" mode="styler_numbering" priority="19">
      <!--This context has no numbering-->
      <xsl:param name="do-qmark" select="'yes'"/>
      <xsl:if test="$do-qmark='yes'">
         <xsl:value-of select="'?'"/>
      </xsl:if>
   </xsl:template>

<xsl:template match="lof/title" mode="styler_numbering" priority="18">
      <!--This context has no numbering-->
      <xsl:param name="do-qmark" select="'yes'"/>
      <xsl:if test="$do-qmark='yes'">
         <xsl:value-of select="'?'"/>
      </xsl:if>
   </xsl:template>

<xsl:template match="table//procedure//title" mode="styler_numbering" priority="17">
      <!--This context has no numbering-->
      <xsl:param name="do-qmark" select="'yes'"/>
      <xsl:if test="$do-qmark='yes'">
         <xsl:value-of select="'?'"/>
      </xsl:if>
   </xsl:template>

<xsl:template match="torque-and-stretch/title" mode="styler_numbering" priority="16">
      <!--This context has no numbering-->
      <xsl:param name="do-qmark" select="'yes'"/>
      <xsl:if test="$do-qmark='yes'">
         <xsl:value-of select="'?'"/>
      </xsl:if>
   </xsl:template>

<xsl:template match="spec-tool-table/title" mode="styler_numbering" priority="15">
      <xsl:number count="spec-tool-table[title]" format="1"/>
   </xsl:template>

<xsl:template match="spb-list/title" mode="styler_numbering" priority="14">
      <!--This context has no numbering-->
      <xsl:param name="do-qmark" select="'yes'"/>
      <xsl:if test="$do-qmark='yes'">
         <xsl:value-of select="'?'"/>
      </xsl:if>
   </xsl:template>

<xsl:template match="subject/title" mode="styler_numbering" priority="13">
      <!--This context has no numbering-->
      <xsl:param name="do-qmark" select="'yes'"/>
      <xsl:if test="$do-qmark='yes'">
         <xsl:value-of select="'?'"/>
      </xsl:if>
   </xsl:template>

<xsl:template match="section/title" mode="styler_numbering" priority="12">
      <!--This context has no numbering-->
      <xsl:param name="do-qmark" select="'yes'"/>
      <xsl:if test="$do-qmark='yes'">
         <xsl:value-of select="'?'"/>
      </xsl:if>
   </xsl:template>

<xsl:template match="page-block/title" mode="styler_numbering" priority="11">
      <xsl:variable name="previous-node" select="(ancestor::*[not((namespace-uri(.)='http://www.w3.org/1999/XSL/Format') or (namespace-uri(.)='http://www.arbortext.com/namespace/XslFoExtensions') or (starts-with(namespace-uri(.),'http://www.arbortext.com/namespace/Styler/')))][1]/ancestor::*[not((namespace-uri(.)='http://www.w3.org/1999/XSL/Format') or (namespace-uri(.)='http://www.arbortext.com/namespace/XslFoExtensions') or (starts-with(namespace-uri(.),'http://www.arbortext.com/namespace/Styler/')))][1]|ancestor::*[not((namespace-uri(.)='http://www.w3.org/1999/XSL/Format') or (namespace-uri(.)='http://www.arbortext.com/namespace/XslFoExtensions') or (starts-with(namespace-uri(.),'http://www.arbortext.com/namespace/Styler/')))][1]/ancestor::*[not((namespace-uri(.)='http://www.w3.org/1999/XSL/Format') or (namespace-uri(.)='http://www.arbortext.com/namespace/XslFoExtensions') or (starts-with(namespace-uri(.),'http://www.arbortext.com/namespace/Styler/')))][1][local-name()='ata-page-block' or local-name()='chapter' or local-name()='figure' or local-name()='frontmatter' or local-name()='highlights' or local-name()='lof' or local-name()='lot' or local-name()='module' or local-name()='page-block' or local-name()='section' or local-name()='subject']/*[local-name()='chapsect-title' or local-name()='cir-title' or local-name()='consumables-title' or local-name()='eipc-title' or local-name()='em-title' or local-name()='fixequ-title' or local-name()='general-title' or local-name()='glossary-title' or local-name()='howtouse-title' or local-name()='intro-title' or local-name()='manual-title' or local-name()='num-index-title' or local-name()='nut-option-title' or local-name()='pdlist-title' or local-name()='pwc-title' or local-name()='sblist-title' or local-name()='spblist-title' or local-name()='spectools-title' or local-name()='supplier-list-title' or local-name()='task-title' or local-name()='temp-rev-title' or local-name()='title' or local-name()='tmm-title'][1])[last()]"/>
      <xsl:choose>
         <xsl:when test="boolean($previous-node)">
            <xsl:apply-templates mode="styler_numbering" select="$previous-node"/>
         </xsl:when>
         <xsl:otherwise>?</xsl:otherwise>
      </xsl:choose>
      <xsl:text>.</xsl:text>
      <xsl:number count="page-block[title]" format="1"/>
   </xsl:template>

<xsl:template match="service-bull-list/title" mode="styler_numbering" priority="10">
      <!--This context has no numbering-->
      <xsl:param name="do-qmark" select="'yes'"/>
      <xsl:if test="$do-qmark='yes'">
         <xsl:value-of select="'?'"/>
      </xsl:if>
   </xsl:template>

<xsl:template match="module/title" mode="styler_numbering" priority="9">
      <!--This context has no numbering-->
      <xsl:param name="do-qmark" select="'yes'"/>
      <xsl:if test="$do-qmark='yes'">
         <xsl:value-of select="'?'"/>
      </xsl:if>
   </xsl:template>

<xsl:template match="frontmatter/title" mode="styler_numbering" priority="8">
      <xsl:number count="frontmatter[title]" format="1"/>
   </xsl:template>

<xsl:template match="num-index/title" mode="styler_numbering" priority="7">
      <!--This context has no numbering-->
      <xsl:param name="do-qmark" select="'yes'"/>
      <xsl:if test="$do-qmark='yes'">
         <xsl:value-of select="'?'"/>
      </xsl:if>
   </xsl:template>

<xsl:template match="table[@display='expand']/title" mode="styler_numbering" priority="6">
      <xsl:choose>
         <xsl:when test="(ancestor-or-self::table[1]/@tabstyle and string(ancestor-or-self::table[1]/@tabstyle)='fits-and-clears') and (/ata-page-block//table/title)">
            <xsl:variable name="node-id" select="generate-id(.)"/>
            <xsl:variable name="from-node" select="(ancestor-or-self::ata-page-block[not(ancestor::ata-page-block)])[last()]"/>
            <xsl:variable name="num">
               <xsl:variable name="candidate-num">
                  <xsl:choose>
                     <xsl:when test="count($from-node) &gt; 0">
                        <xsl:for-each select="$from-node/descendant-or-self::*[@_gte:count-as-id='npara-ata']">
                           <xsl:if test="generate-id(.) = $node-id">
                              <xsl:value-of select="position()"/>
                           </xsl:if>
                        </xsl:for-each>
                     </xsl:when>
                     <xsl:otherwise>
                        <xsl:for-each select="//*[@_gte:count-as-id='npara-ata'][not(ancestor-or-self::ata-page-block)]">
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
            <xsl:text>.</xsl:text>
         </xsl:when>
         <xsl:when test="(ancestor-or-self::table[1]/@tabstyle and string(ancestor-or-self::table[1]/@tabstyle)='fits-and-clears') and (/page-block//table/title)">
            <xsl:variable name="node-id" select="generate-id(.)"/>
            <xsl:variable name="from-node" select="(ancestor-or-self::page-block[not(ancestor::page-block)])[last()]"/>
            <xsl:variable name="num">
               <xsl:variable name="candidate-num">
                  <xsl:choose>
                     <xsl:when test="count($from-node) &gt; 0">
                        <xsl:for-each select="$from-node/descendant-or-self::*[@_gte:count-as-id='npara']">
                           <xsl:if test="generate-id(.) = $node-id">
                              <xsl:value-of select="position()"/>
                           </xsl:if>
                        </xsl:for-each>
                     </xsl:when>
                     <xsl:otherwise>
                        <xsl:for-each select="//*[@_gte:count-as-id='npara'][not(ancestor-or-self::page-block)]">
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
            <xsl:text>.</xsl:text>
         </xsl:when>
         <xsl:when test="not(ancestor::book[contains(@doctype,'cir') or contains(@doctype,'em') or contains(@doctype,'tmm')]) and not(ancestor::book[contains(@doctype,'oh')] and ancestor::ata-page-block/@pb-name[.='service']) and not(ancestor::book[contains(@doctype,'oh')] and ancestor::page-block/@pb-name[.='service']) and not(ancestor::ata-page-block/@pb-name[.='00awl' or .='00intro' or .='airlim' or .='awl' or .='awlror' or .='chapsect' or .='consume' or .='d-and-o' or .='frontmatte' or .='howtouse' or .='00howtouse' or .='intro' or .='nut_option' or .='oplimits' or .='sblist' or .='schedchk' or .='spectool' or .='timelim' or .='title-page']) and not(ancestor::page-block/@pb-name[.='00awl' or .='00intro' or .='airlim' or .='awl' or .='awlror' or .='chapsect' or .='consume' or .='d-and-o' or .='frontmatte' or .='howtouse' or .='00howtouse' or .='intro' or .='nut_option' or .='oplimits' or .='sblist' or .='schedchk' or .='spectool' or .='timelim' or .='title-page']) and not(ancestor::ata-page-block/@pb-name[(starts-with(., 'do') and 'do' = translate(., '0123456789', '') and string-length(.) &gt; 2) or (starts-with(., 'in') and 'in' = translate(., '0123456789', '') and string-length(.) &gt; 2) or (starts-with(., 'tl') and 'tl' = translate(., '0123456789', '') and string-length(.) &gt; 2) or .='toolsht' or .='trlist' or .='unschedc' or .='unschedchk']) and not(ancestor::page-block/@pb-name[(starts-with(., 'do') and 'do' = translate(., '0123456789', '') and string-length(.) &gt; 2) or (starts-with(., 'in') and 'in' = translate(., '0123456789', '') and string-length(.) &gt; 2) or (starts-with(., 'tl') and 'tl' = translate(., '0123456789', '') and string-length(.) &gt; 2) or .='toolsht' or .='trlist' or .='unschedc' or .='unschedchk']) and not(ancestor-or-self::ata-page-block[1]/@pb-name and string(ancestor-or-self::ata-page-block[1]/@pb-name)='intro00') and not(ancestor-or-self::page-block[1]/@pb-name and string(ancestor-or-self::page-block[1]/@pb-name)='intro00') and not(ancestor::ata-page-block/@pb-name[starts-with(., 'disassy') or starts-with(., 'fault')]) and not(ancestor::page-block/@pb-name[starts-with(., 'disassy') or starts-with(., 'fault')]) and not(ancestor::book[contains(@doctype,'oh')] and ancestor::ata-page-block/@pb-name[starts-with(., 'clean')]) and not(ancestor::book[contains(@doctype,'oh')] and ancestor::page-block/@pb-name[starts-with(., 'clean')]) and not(ancestor::ata-page-block/@pb-name[starts-with(., 'mainprac')]) and not(ancestor::page-block/@pb-name[starts-with(., 'mainprac')]) and not(ancestor::book[contains(@doctype,'oh')] and ancestor::ata-page-block/@pb-name[starts-with(., 'inspect')]) and not(ancestor::book[contains(@doctype,'oh')] and ancestor::page-block/@pb-name[starts-with(., 'inspect')]) and not(ancestor::ata-page-block/@pb-name[(starts-with(., 'di') and 'di' = translate(., '0123456789', '') and string-length(.) &gt; 2) or starts-with(.,'service')]) and not(ancestor::page-block/@pb-name[(starts-with(., 'di') and 'di' = translate(., '0123456789', '') and string-length(.) &gt; 2) or starts-with(.,'service')]) and not(ancestor::book[contains(@doctype,'oh')] and ancestor::ata-page-block/@pb-name[starts-with(., 'repair')]) and not(ancestor::book[contains(@doctype,'oh')] and ancestor::page-block/@pb-name[starts-with(., 'repair')]) and not(ancestor::ata-page-block/@pb-name[(starts-with(., 'cl') and 'cl' = translate(., '0123456789', '') and string-length(.) &gt; 2) or .='install' or starts-with(.,'rem-inst') or (starts-with(., 'reminst') and 'reminst' = translate(., '0123456789', '') and string-length(.) &gt; 7) or .='remove' or (starts-with(., 'repair') and 'repair' = translate(., '0123456789', '') and string-length(.) &gt; 6)]) and not(ancestor::page-block/@pb-name[(starts-with(., 'cl') and 'cl' = translate(., '0123456789', '') and string-length(.) &gt; 2) or .='install' or starts-with(.,'rem-inst') or (starts-with(., 'reminst') and 'reminst' = translate(., '0123456789', '') and string-length(.) &gt; 7) or .='remove' or (starts-with(., 'repair') and 'repair' = translate(., '0123456789', '') and string-length(.) &gt; 6)]) and not(ancestor::ata-page-block/@pb-name[starts-with(., 'assy') or (starts-with(., 'ic') and 'ic' = translate(., '0123456789', '') and string-length(.) &gt; 2) or (starts-with(., 'te') and 'te' = translate(., '0123456789', '') and string-length(.) &gt; 2) or .='test']) and not(ancestor::page-block/@pb-name[starts-with(., 'assy') or (starts-with(., 'ic') and 'ic' = translate(., '0123456789', '') and string-length(.) &gt; 2) or (starts-with(., 'te') and 'te' = translate(., '0123456789', '') and string-length(.) &gt; 2) or .='test']) and not(ancestor::ata-page-block/@pb-name[.='f-and-c' or starts-with(., 'inspect') or (starts-with(., 're') and 're' = translate(., '0123456789', '') and string-length(.) &gt; 2)]) and not(ancestor::page-block/@pb-name[.='f-and-c' or starts-with(., 'inspect') or (starts-with(., 're') and 're' = translate(., '0123456789', '') and string-length(.) &gt; 2)]) and not(ancestor::ata-page-block/@pb-name[(starts-with(., 'as') and 'as' = translate(., '0123456789', '') and string-length(.) &gt; 2) or starts-with(.,'clean') or (starts-with(., 'test') and 'test' = translate(., '0123456789', '') and string-length(.) &gt; 4)]) and not(ancestor::page-block/@pb-name[(starts-with(., 'as') and 'as' = translate(., '0123456789', '') and string-length(.) &gt; 2) or starts-with(.,'clean') or (starts-with(., 'test') and 'test' = translate(., '0123456789', '') and string-length(.) &gt; 4)]) and not(ancestor::ata-page-block/@pb-name[(starts-with(., 'fc') and 'fc' = translate(., '0123456789', '') and string-length(.) &gt; 2) or starts-with(.,'repair') or .='trouble']) and not(ancestor::page-block/@pb-name[(starts-with(., 'fc') and 'fc' = translate(., '0123456789', '') and string-length(.) &gt; 2) or starts-with(.,'repair') or .='trouble']) and not(ancestor::ata-page-block/@pb-name[starts-with(.,'storage') or (starts-with(., 'to') and 'to' = translate(., '0123456789', '') and string-length(.) &gt; 2)]) and not(ancestor::page-block/@pb-name[starts-with(.,'storage') or (starts-with(., 'to') and 'to' = translate(., '0123456789', '') and string-length(.) &gt; 2)]) and not(ancestor-or-self::ata-page-block[1]/@pb-name and string(ancestor-or-self::ata-page-block[1]/@pb-name)='it-oh') and (ancestor-or-self::page-block[1]/@pb-name and string(ancestor-or-self::page-block[1]/@pb-name)='it-oh')">
            <xsl:variable name="node-id" select="generate-id(.)"/>
            <xsl:variable name="from-node" select="(ancestor-or-self::page-block[not(ancestor::page-block)])[last()]"/>
            <xsl:variable name="num">
               <xsl:variable name="candidate-num">
                  <xsl:choose>
                     <xsl:when test="count($from-node) &gt; 0">
                        <xsl:for-each select="$from-node/descendant-or-self::*[@_gte:count-as-id='cnt__table^page-block.cnt']">
                           <xsl:if test="generate-id(.) = $node-id">
                              <xsl:value-of select="position()"/>
                           </xsl:if>
                        </xsl:for-each>
                     </xsl:when>
                     <xsl:otherwise>
                        <xsl:for-each select="//*[@_gte:count-as-id='cnt__table^page-block.cnt'][not(ancestor-or-self::page-block)]">
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
            <xsl:variable name="offset">
               <!--Evaluate startAtXPath using the first counted element within the numbering scope as the context node-->
               <xsl:variable name="initial-num">
                  <xsl:choose>
                     <xsl:when test="count($from-node) &gt; 0">
                        <xsl:apply-templates select="($from-node/descendant-or-self::*[@_gte:count-as-id='cnt__table^page-block.cnt'])[1]" mode="startat-xpath"/>
                     </xsl:when>
                     <xsl:otherwise>
                        <xsl:apply-templates select="(//*[@_gte:count-as-id='cnt__table^page-block.cnt'][not(ancestor-or-self::page-block)])[1]" mode="startat-xpath"/>
                     </xsl:otherwise>
                  </xsl:choose>
               </xsl:variable>
               <xsl:choose>
                  <xsl:when test="string(number($initial-num))!='NaN'">
                     <xsl:value-of select="$initial-num"/>
                  </xsl:when>
                  <xsl:otherwise>1</xsl:otherwise>
               </xsl:choose>
            </xsl:variable>
            <xsl:choose>
               <xsl:when test="string(number($num))!='NaN'">
                  <xsl:number value="$num + $offset - 1" format="1"/>
               </xsl:when>
               <xsl:otherwise>?</xsl:otherwise>
            </xsl:choose>
         </xsl:when>
         <xsl:when test="not(ancestor::book[contains(@doctype,'cir') or contains(@doctype,'em') or contains(@doctype,'tmm')]) and not(ancestor::book[contains(@doctype,'oh')] and ancestor::ata-page-block/@pb-name[.='service']) and not(ancestor::book[contains(@doctype,'oh')] and ancestor::page-block/@pb-name[.='service']) and not(ancestor::ata-page-block/@pb-name[.='00awl' or .='00intro' or .='airlim' or .='awl' or .='awlror' or .='chapsect' or .='consume' or .='d-and-o' or .='frontmatte' or .='howtouse' or .='00howtouse' or .='intro' or .='nut_option' or .='oplimits' or .='sblist' or .='schedchk' or .='spectool' or .='timelim' or .='title-page']) and not(ancestor::page-block/@pb-name[.='00awl' or .='00intro' or .='airlim' or .='awl' or .='awlror' or .='chapsect' or .='consume' or .='d-and-o' or .='frontmatte' or .='howtouse' or .='00howtouse' or .='intro' or .='nut_option' or .='oplimits' or .='sblist' or .='schedchk' or .='spectool' or .='timelim' or .='title-page']) and not(ancestor::ata-page-block/@pb-name[(starts-with(., 'do') and 'do' = translate(., '0123456789', '') and string-length(.) &gt; 2) or (starts-with(., 'in') and 'in' = translate(., '0123456789', '') and string-length(.) &gt; 2) or (starts-with(., 'tl') and 'tl' = translate(., '0123456789', '') and string-length(.) &gt; 2) or .='toolsht' or .='trlist' or .='unschedc' or .='unschedchk']) and not(ancestor::page-block/@pb-name[(starts-with(., 'do') and 'do' = translate(., '0123456789', '') and string-length(.) &gt; 2) or (starts-with(., 'in') and 'in' = translate(., '0123456789', '') and string-length(.) &gt; 2) or (starts-with(., 'tl') and 'tl' = translate(., '0123456789', '') and string-length(.) &gt; 2) or .='toolsht' or .='trlist' or .='unschedc' or .='unschedchk']) and not(ancestor-or-self::ata-page-block[1]/@pb-name and string(ancestor-or-self::ata-page-block[1]/@pb-name)='intro00') and not(ancestor-or-self::page-block[1]/@pb-name and string(ancestor-or-self::page-block[1]/@pb-name)='intro00') and not(ancestor::ata-page-block/@pb-name[starts-with(., 'disassy') or starts-with(., 'fault')]) and not(ancestor::page-block/@pb-name[starts-with(., 'disassy') or starts-with(., 'fault')]) and not(ancestor::book[contains(@doctype,'oh')] and ancestor::ata-page-block/@pb-name[starts-with(., 'clean')]) and not(ancestor::book[contains(@doctype,'oh')] and ancestor::page-block/@pb-name[starts-with(., 'clean')]) and not(ancestor::ata-page-block/@pb-name[starts-with(., 'mainprac')]) and not(ancestor::page-block/@pb-name[starts-with(., 'mainprac')]) and not(ancestor::book[contains(@doctype,'oh')] and ancestor::ata-page-block/@pb-name[starts-with(., 'inspect')]) and not(ancestor::book[contains(@doctype,'oh')] and ancestor::page-block/@pb-name[starts-with(., 'inspect')]) and not(ancestor::ata-page-block/@pb-name[(starts-with(., 'di') and 'di' = translate(., '0123456789', '') and string-length(.) &gt; 2) or starts-with(.,'service')]) and not(ancestor::page-block/@pb-name[(starts-with(., 'di') and 'di' = translate(., '0123456789', '') and string-length(.) &gt; 2) or starts-with(.,'service')]) and not(ancestor::book[contains(@doctype,'oh')] and ancestor::ata-page-block/@pb-name[starts-with(., 'repair')]) and not(ancestor::book[contains(@doctype,'oh')] and ancestor::page-block/@pb-name[starts-with(., 'repair')]) and not(ancestor::ata-page-block/@pb-name[(starts-with(., 'cl') and 'cl' = translate(., '0123456789', '') and string-length(.) &gt; 2) or .='install' or starts-with(.,'rem-inst') or (starts-with(., 'reminst') and 'reminst' = translate(., '0123456789', '') and string-length(.) &gt; 7) or .='remove' or (starts-with(., 'repair') and 'repair' = translate(., '0123456789', '') and string-length(.) &gt; 6)]) and not(ancestor::page-block/@pb-name[(starts-with(., 'cl') and 'cl' = translate(., '0123456789', '') and string-length(.) &gt; 2) or .='install' or starts-with(.,'rem-inst') or (starts-with(., 'reminst') and 'reminst' = translate(., '0123456789', '') and string-length(.) &gt; 7) or .='remove' or (starts-with(., 'repair') and 'repair' = translate(., '0123456789', '') and string-length(.) &gt; 6)]) and not(ancestor::ata-page-block/@pb-name[starts-with(., 'assy') or (starts-with(., 'ic') and 'ic' = translate(., '0123456789', '') and string-length(.) &gt; 2) or (starts-with(., 'te') and 'te' = translate(., '0123456789', '') and string-length(.) &gt; 2) or .='test']) and not(ancestor::page-block/@pb-name[starts-with(., 'assy') or (starts-with(., 'ic') and 'ic' = translate(., '0123456789', '') and string-length(.) &gt; 2) or (starts-with(., 'te') and 'te' = translate(., '0123456789', '') and string-length(.) &gt; 2) or .='test']) and not(ancestor::ata-page-block/@pb-name[.='f-and-c' or starts-with(., 'inspect') or (starts-with(., 're') and 're' = translate(., '0123456789', '') and string-length(.) &gt; 2)]) and not(ancestor::page-block/@pb-name[.='f-and-c' or starts-with(., 'inspect') or (starts-with(., 're') and 're' = translate(., '0123456789', '') and string-length(.) &gt; 2)]) and not(ancestor::ata-page-block/@pb-name[(starts-with(., 'as') and 'as' = translate(., '0123456789', '') and string-length(.) &gt; 2) or starts-with(.,'clean') or (starts-with(., 'test') and 'test' = translate(., '0123456789', '') and string-length(.) &gt; 4)]) and not(ancestor::page-block/@pb-name[(starts-with(., 'as') and 'as' = translate(., '0123456789', '') and string-length(.) &gt; 2) or starts-with(.,'clean') or (starts-with(., 'test') and 'test' = translate(., '0123456789', '') and string-length(.) &gt; 4)]) and not(ancestor::ata-page-block/@pb-name[(starts-with(., 'fc') and 'fc' = translate(., '0123456789', '') and string-length(.) &gt; 2) or starts-with(.,'repair') or .='trouble']) and not(ancestor::page-block/@pb-name[(starts-with(., 'fc') and 'fc' = translate(., '0123456789', '') and string-length(.) &gt; 2) or starts-with(.,'repair') or .='trouble']) and not(ancestor::ata-page-block/@pb-name[starts-with(.,'storage') or (starts-with(., 'to') and 'to' = translate(., '0123456789', '') and string-length(.) &gt; 2)]) and not(ancestor::page-block/@pb-name[starts-with(.,'storage') or (starts-with(., 'to') and 'to' = translate(., '0123456789', '') and string-length(.) &gt; 2)]) and (ancestor-or-self::ata-page-block[1]/@pb-name and string(ancestor-or-self::ata-page-block[1]/@pb-name)='it-oh')">
            <xsl:variable name="node-id" select="generate-id(.)"/>
            <xsl:variable name="from-node" select="(ancestor-or-self::ata-page-block[not(ancestor::ata-page-block)])[last()]"/>
            <xsl:variable name="num">
               <xsl:variable name="candidate-num">
                  <xsl:choose>
                     <xsl:when test="count($from-node) &gt; 0">
                        <xsl:for-each select="$from-node/descendant-or-self::*[@_gte:count-as-id='cnt__table^ata-page-block.cnt']">
                           <xsl:if test="generate-id(.) = $node-id">
                              <xsl:value-of select="position()"/>
                           </xsl:if>
                        </xsl:for-each>
                     </xsl:when>
                     <xsl:otherwise>
                        <xsl:for-each select="//*[@_gte:count-as-id='cnt__table^ata-page-block.cnt'][not(ancestor-or-self::ata-page-block)]">
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
            <xsl:variable name="offset">
               <!--Evaluate startAtXPath using the first counted element within the numbering scope as the context node-->
               <xsl:variable name="initial-num">
                  <xsl:choose>
                     <xsl:when test="count($from-node) &gt; 0">
                        <xsl:apply-templates select="($from-node/descendant-or-self::*[@_gte:count-as-id='cnt__table^ata-page-block.cnt'])[1]" mode="startat-xpath"/>
                     </xsl:when>
                     <xsl:otherwise>
                        <xsl:apply-templates select="(//*[@_gte:count-as-id='cnt__table^ata-page-block.cnt'][not(ancestor-or-self::ata-page-block)])[1]" mode="startat-xpath"/>
                     </xsl:otherwise>
                  </xsl:choose>
               </xsl:variable>
               <xsl:choose>
                  <xsl:when test="string(number($initial-num))!='NaN'">
                     <xsl:value-of select="$initial-num"/>
                  </xsl:when>
                  <xsl:otherwise>1</xsl:otherwise>
               </xsl:choose>
            </xsl:variable>
            <xsl:choose>
               <xsl:when test="string(number($num))!='NaN'">
                  <xsl:number value="$num + $offset - 1" format="1"/>
               </xsl:when>
               <xsl:otherwise>?</xsl:otherwise>
            </xsl:choose>
         </xsl:when>
         <xsl:when test="not(ancestor::book[contains(@doctype,'cir') or contains(@doctype,'em') or contains(@doctype,'tmm')]) and not(ancestor::book[contains(@doctype,'oh')] and ancestor::ata-page-block/@pb-name[.='service']) and not(ancestor::book[contains(@doctype,'oh')] and ancestor::page-block/@pb-name[.='service']) and not(ancestor::ata-page-block/@pb-name[.='00awl' or .='00intro' or .='airlim' or .='awl' or .='awlror' or .='chapsect' or .='consume' or .='d-and-o' or .='frontmatte' or .='howtouse' or .='00howtouse' or .='intro' or .='nut_option' or .='oplimits' or .='sblist' or .='schedchk' or .='spectool' or .='timelim' or .='title-page']) and not(ancestor::page-block/@pb-name[.='00awl' or .='00intro' or .='airlim' or .='awl' or .='awlror' or .='chapsect' or .='consume' or .='d-and-o' or .='frontmatte' or .='howtouse' or .='00howtouse' or .='intro' or .='nut_option' or .='oplimits' or .='sblist' or .='schedchk' or .='spectool' or .='timelim' or .='title-page']) and not(ancestor::ata-page-block/@pb-name[(starts-with(., 'do') and 'do' = translate(., '0123456789', '') and string-length(.) &gt; 2) or (starts-with(., 'in') and 'in' = translate(., '0123456789', '') and string-length(.) &gt; 2) or (starts-with(., 'tl') and 'tl' = translate(., '0123456789', '') and string-length(.) &gt; 2) or .='toolsht' or .='trlist' or .='unschedc' or .='unschedchk']) and not(ancestor::page-block/@pb-name[(starts-with(., 'do') and 'do' = translate(., '0123456789', '') and string-length(.) &gt; 2) or (starts-with(., 'in') and 'in' = translate(., '0123456789', '') and string-length(.) &gt; 2) or (starts-with(., 'tl') and 'tl' = translate(., '0123456789', '') and string-length(.) &gt; 2) or .='toolsht' or .='trlist' or .='unschedc' or .='unschedchk']) and not(ancestor-or-self::ata-page-block[1]/@pb-name and string(ancestor-or-self::ata-page-block[1]/@pb-name)='intro00') and not(ancestor-or-self::page-block[1]/@pb-name and string(ancestor-or-self::page-block[1]/@pb-name)='intro00') and not(ancestor::ata-page-block/@pb-name[starts-with(., 'disassy') or starts-with(., 'fault')]) and not(ancestor::page-block/@pb-name[starts-with(., 'disassy') or starts-with(., 'fault')]) and not(ancestor::book[contains(@doctype,'oh')] and ancestor::ata-page-block/@pb-name[starts-with(., 'clean')]) and not(ancestor::book[contains(@doctype,'oh')] and ancestor::page-block/@pb-name[starts-with(., 'clean')]) and not(ancestor::ata-page-block/@pb-name[starts-with(., 'mainprac')]) and not(ancestor::page-block/@pb-name[starts-with(., 'mainprac')]) and not(ancestor::book[contains(@doctype,'oh')] and ancestor::ata-page-block/@pb-name[starts-with(., 'inspect')]) and not(ancestor::book[contains(@doctype,'oh')] and ancestor::page-block/@pb-name[starts-with(., 'inspect')]) and not(ancestor::ata-page-block/@pb-name[(starts-with(., 'di') and 'di' = translate(., '0123456789', '') and string-length(.) &gt; 2) or starts-with(.,'service')]) and not(ancestor::page-block/@pb-name[(starts-with(., 'di') and 'di' = translate(., '0123456789', '') and string-length(.) &gt; 2) or starts-with(.,'service')]) and not(ancestor::book[contains(@doctype,'oh')] and ancestor::ata-page-block/@pb-name[starts-with(., 'repair')]) and not(ancestor::book[contains(@doctype,'oh')] and ancestor::page-block/@pb-name[starts-with(., 'repair')]) and not(ancestor::ata-page-block/@pb-name[(starts-with(., 'cl') and 'cl' = translate(., '0123456789', '') and string-length(.) &gt; 2) or .='install' or starts-with(.,'rem-inst') or (starts-with(., 'reminst') and 'reminst' = translate(., '0123456789', '') and string-length(.) &gt; 7) or .='remove' or (starts-with(., 'repair') and 'repair' = translate(., '0123456789', '') and string-length(.) &gt; 6)]) and not(ancestor::page-block/@pb-name[(starts-with(., 'cl') and 'cl' = translate(., '0123456789', '') and string-length(.) &gt; 2) or .='install' or starts-with(.,'rem-inst') or (starts-with(., 'reminst') and 'reminst' = translate(., '0123456789', '') and string-length(.) &gt; 7) or .='remove' or (starts-with(., 'repair') and 'repair' = translate(., '0123456789', '') and string-length(.) &gt; 6)]) and not(ancestor::ata-page-block/@pb-name[starts-with(., 'assy') or (starts-with(., 'ic') and 'ic' = translate(., '0123456789', '') and string-length(.) &gt; 2) or (starts-with(., 'te') and 'te' = translate(., '0123456789', '') and string-length(.) &gt; 2) or .='test']) and not(ancestor::page-block/@pb-name[starts-with(., 'assy') or (starts-with(., 'ic') and 'ic' = translate(., '0123456789', '') and string-length(.) &gt; 2) or (starts-with(., 'te') and 'te' = translate(., '0123456789', '') and string-length(.) &gt; 2) or .='test']) and not(ancestor::ata-page-block/@pb-name[.='f-and-c' or starts-with(., 'inspect') or (starts-with(., 're') and 're' = translate(., '0123456789', '') and string-length(.) &gt; 2)]) and not(ancestor::page-block/@pb-name[.='f-and-c' or starts-with(., 'inspect') or (starts-with(., 're') and 're' = translate(., '0123456789', '') and string-length(.) &gt; 2)]) and not(ancestor::ata-page-block/@pb-name[(starts-with(., 'as') and 'as' = translate(., '0123456789', '') and string-length(.) &gt; 2) or starts-with(.,'clean') or (starts-with(., 'test') and 'test' = translate(., '0123456789', '') and string-length(.) &gt; 4)]) and not(ancestor::page-block/@pb-name[(starts-with(., 'as') and 'as' = translate(., '0123456789', '') and string-length(.) &gt; 2) or starts-with(.,'clean') or (starts-with(., 'test') and 'test' = translate(., '0123456789', '') and string-length(.) &gt; 4)]) and not(ancestor::ata-page-block/@pb-name[(starts-with(., 'fc') and 'fc' = translate(., '0123456789', '') and string-length(.) &gt; 2) or starts-with(.,'repair') or .='trouble']) and not(ancestor::page-block/@pb-name[(starts-with(., 'fc') and 'fc' = translate(., '0123456789', '') and string-length(.) &gt; 2) or starts-with(.,'repair') or .='trouble']) and not(ancestor::ata-page-block/@pb-name[starts-with(.,'storage') or (starts-with(., 'to') and 'to' = translate(., '0123456789', '') and string-length(.) &gt; 2)]) and (ancestor::page-block/@pb-name[starts-with(.,'storage') or (starts-with(., 'to') and 'to' = translate(., '0123456789', '') and string-length(.) &gt; 2)])">
            <xsl:variable name="node-id" select="generate-id(.)"/>
            <xsl:variable name="from-node" select="(ancestor-or-self::page-block[not(ancestor::page-block)])[last()]"/>
            <xsl:variable name="num">
               <xsl:variable name="candidate-num">
                  <xsl:choose>
                     <xsl:when test="count($from-node) &gt; 0">
                        <xsl:for-each select="$from-node/descendant-or-self::*[@_gte:count-as-id='cnt__table^page-block.cnt']">
                           <xsl:if test="generate-id(.) = $node-id">
                              <xsl:value-of select="position()"/>
                           </xsl:if>
                        </xsl:for-each>
                     </xsl:when>
                     <xsl:otherwise>
                        <xsl:for-each select="//*[@_gte:count-as-id='cnt__table^page-block.cnt'][not(ancestor-or-self::page-block)]">
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
            <xsl:variable name="offset">
               <!--Evaluate startAtXPath using the first counted element within the numbering scope as the context node-->
               <xsl:variable name="initial-num">
                  <xsl:choose>
                     <xsl:when test="count($from-node) &gt; 0">
                        <xsl:apply-templates select="($from-node/descendant-or-self::*[@_gte:count-as-id='cnt__table^page-block.cnt'])[1]" mode="startat-xpath"/>
                     </xsl:when>
                     <xsl:otherwise>
                        <xsl:apply-templates select="(//*[@_gte:count-as-id='cnt__table^page-block.cnt'][not(ancestor-or-self::page-block)])[1]" mode="startat-xpath"/>
                     </xsl:otherwise>
                  </xsl:choose>
               </xsl:variable>
               <xsl:choose>
                  <xsl:when test="string(number($initial-num))!='NaN'">
                     <xsl:value-of select="$initial-num"/>
                  </xsl:when>
                  <xsl:otherwise>1</xsl:otherwise>
               </xsl:choose>
            </xsl:variable>
            <xsl:choose>
               <xsl:when test="string(number($num))!='NaN'">
                  <xsl:number value="$num + $offset - 1" format="1"/>
               </xsl:when>
               <xsl:otherwise>?</xsl:otherwise>
            </xsl:choose>
         </xsl:when>
         <xsl:when test="not(ancestor::book[contains(@doctype,'cir') or contains(@doctype,'em') or contains(@doctype,'tmm')]) and not(ancestor::book[contains(@doctype,'oh')] and ancestor::ata-page-block/@pb-name[.='service']) and not(ancestor::book[contains(@doctype,'oh')] and ancestor::page-block/@pb-name[.='service']) and not(ancestor::ata-page-block/@pb-name[.='00awl' or .='00intro' or .='airlim' or .='awl' or .='awlror' or .='chapsect' or .='consume' or .='d-and-o' or .='frontmatte' or .='howtouse' or .='00howtouse' or .='intro' or .='nut_option' or .='oplimits' or .='sblist' or .='schedchk' or .='spectool' or .='timelim' or .='title-page']) and not(ancestor::page-block/@pb-name[.='00awl' or .='00intro' or .='airlim' or .='awl' or .='awlror' or .='chapsect' or .='consume' or .='d-and-o' or .='frontmatte' or .='howtouse' or .='00howtouse' or .='intro' or .='nut_option' or .='oplimits' or .='sblist' or .='schedchk' or .='spectool' or .='timelim' or .='title-page']) and not(ancestor::ata-page-block/@pb-name[(starts-with(., 'do') and 'do' = translate(., '0123456789', '') and string-length(.) &gt; 2) or (starts-with(., 'in') and 'in' = translate(., '0123456789', '') and string-length(.) &gt; 2) or (starts-with(., 'tl') and 'tl' = translate(., '0123456789', '') and string-length(.) &gt; 2) or .='toolsht' or .='trlist' or .='unschedc' or .='unschedchk']) and not(ancestor::page-block/@pb-name[(starts-with(., 'do') and 'do' = translate(., '0123456789', '') and string-length(.) &gt; 2) or (starts-with(., 'in') and 'in' = translate(., '0123456789', '') and string-length(.) &gt; 2) or (starts-with(., 'tl') and 'tl' = translate(., '0123456789', '') and string-length(.) &gt; 2) or .='toolsht' or .='trlist' or .='unschedc' or .='unschedchk']) and not(ancestor-or-self::ata-page-block[1]/@pb-name and string(ancestor-or-self::ata-page-block[1]/@pb-name)='intro00') and not(ancestor-or-self::page-block[1]/@pb-name and string(ancestor-or-self::page-block[1]/@pb-name)='intro00') and not(ancestor::ata-page-block/@pb-name[starts-with(., 'disassy') or starts-with(., 'fault')]) and not(ancestor::page-block/@pb-name[starts-with(., 'disassy') or starts-with(., 'fault')]) and not(ancestor::book[contains(@doctype,'oh')] and ancestor::ata-page-block/@pb-name[starts-with(., 'clean')]) and not(ancestor::book[contains(@doctype,'oh')] and ancestor::page-block/@pb-name[starts-with(., 'clean')]) and not(ancestor::ata-page-block/@pb-name[starts-with(., 'mainprac')]) and not(ancestor::page-block/@pb-name[starts-with(., 'mainprac')]) and not(ancestor::book[contains(@doctype,'oh')] and ancestor::ata-page-block/@pb-name[starts-with(., 'inspect')]) and not(ancestor::book[contains(@doctype,'oh')] and ancestor::page-block/@pb-name[starts-with(., 'inspect')]) and not(ancestor::ata-page-block/@pb-name[(starts-with(., 'di') and 'di' = translate(., '0123456789', '') and string-length(.) &gt; 2) or starts-with(.,'service')]) and not(ancestor::page-block/@pb-name[(starts-with(., 'di') and 'di' = translate(., '0123456789', '') and string-length(.) &gt; 2) or starts-with(.,'service')]) and not(ancestor::book[contains(@doctype,'oh')] and ancestor::ata-page-block/@pb-name[starts-with(., 'repair')]) and not(ancestor::book[contains(@doctype,'oh')] and ancestor::page-block/@pb-name[starts-with(., 'repair')]) and not(ancestor::ata-page-block/@pb-name[(starts-with(., 'cl') and 'cl' = translate(., '0123456789', '') and string-length(.) &gt; 2) or .='install' or starts-with(.,'rem-inst') or (starts-with(., 'reminst') and 'reminst' = translate(., '0123456789', '') and string-length(.) &gt; 7) or .='remove' or (starts-with(., 'repair') and 'repair' = translate(., '0123456789', '') and string-length(.) &gt; 6)]) and not(ancestor::page-block/@pb-name[(starts-with(., 'cl') and 'cl' = translate(., '0123456789', '') and string-length(.) &gt; 2) or .='install' or starts-with(.,'rem-inst') or (starts-with(., 'reminst') and 'reminst' = translate(., '0123456789', '') and string-length(.) &gt; 7) or .='remove' or (starts-with(., 'repair') and 'repair' = translate(., '0123456789', '') and string-length(.) &gt; 6)]) and not(ancestor::ata-page-block/@pb-name[starts-with(., 'assy') or (starts-with(., 'ic') and 'ic' = translate(., '0123456789', '') and string-length(.) &gt; 2) or (starts-with(., 'te') and 'te' = translate(., '0123456789', '') and string-length(.) &gt; 2) or .='test']) and not(ancestor::page-block/@pb-name[starts-with(., 'assy') or (starts-with(., 'ic') and 'ic' = translate(., '0123456789', '') and string-length(.) &gt; 2) or (starts-with(., 'te') and 'te' = translate(., '0123456789', '') and string-length(.) &gt; 2) or .='test']) and not(ancestor::ata-page-block/@pb-name[.='f-and-c' or starts-with(., 'inspect') or (starts-with(., 're') and 're' = translate(., '0123456789', '') and string-length(.) &gt; 2)]) and not(ancestor::page-block/@pb-name[.='f-and-c' or starts-with(., 'inspect') or (starts-with(., 're') and 're' = translate(., '0123456789', '') and string-length(.) &gt; 2)]) and not(ancestor::ata-page-block/@pb-name[(starts-with(., 'as') and 'as' = translate(., '0123456789', '') and string-length(.) &gt; 2) or starts-with(.,'clean') or (starts-with(., 'test') and 'test' = translate(., '0123456789', '') and string-length(.) &gt; 4)]) and not(ancestor::page-block/@pb-name[(starts-with(., 'as') and 'as' = translate(., '0123456789', '') and string-length(.) &gt; 2) or starts-with(.,'clean') or (starts-with(., 'test') and 'test' = translate(., '0123456789', '') and string-length(.) &gt; 4)]) and not(ancestor::ata-page-block/@pb-name[(starts-with(., 'fc') and 'fc' = translate(., '0123456789', '') and string-length(.) &gt; 2) or starts-with(.,'repair') or .='trouble']) and not(ancestor::page-block/@pb-name[(starts-with(., 'fc') and 'fc' = translate(., '0123456789', '') and string-length(.) &gt; 2) or starts-with(.,'repair') or .='trouble']) and (ancestor::ata-page-block/@pb-name[starts-with(.,'storage') or (starts-with(., 'to') and 'to' = translate(., '0123456789', '') and string-length(.) &gt; 2)])">
            <xsl:variable name="node-id" select="generate-id(.)"/>
            <xsl:variable name="from-node" select="(ancestor-or-self::ata-page-block[not(ancestor::ata-page-block)])[last()]"/>
            <xsl:variable name="num">
               <xsl:variable name="candidate-num">
                  <xsl:choose>
                     <xsl:when test="count($from-node) &gt; 0">
                        <xsl:for-each select="$from-node/descendant-or-self::*[@_gte:count-as-id='cnt__table^ata-page-block.cnt']">
                           <xsl:if test="generate-id(.) = $node-id">
                              <xsl:value-of select="position()"/>
                           </xsl:if>
                        </xsl:for-each>
                     </xsl:when>
                     <xsl:otherwise>
                        <xsl:for-each select="//*[@_gte:count-as-id='cnt__table^ata-page-block.cnt'][not(ancestor-or-self::ata-page-block)]">
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
            <xsl:variable name="offset">
               <!--Evaluate startAtXPath using the first counted element within the numbering scope as the context node-->
               <xsl:variable name="initial-num">
                  <xsl:choose>
                     <xsl:when test="count($from-node) &gt; 0">
                        <xsl:apply-templates select="($from-node/descendant-or-self::*[@_gte:count-as-id='cnt__table^ata-page-block.cnt'])[1]" mode="startat-xpath"/>
                     </xsl:when>
                     <xsl:otherwise>
                        <xsl:apply-templates select="(//*[@_gte:count-as-id='cnt__table^ata-page-block.cnt'][not(ancestor-or-self::ata-page-block)])[1]" mode="startat-xpath"/>
                     </xsl:otherwise>
                  </xsl:choose>
               </xsl:variable>
               <xsl:choose>
                  <xsl:when test="string(number($initial-num))!='NaN'">
                     <xsl:value-of select="$initial-num"/>
                  </xsl:when>
                  <xsl:otherwise>1</xsl:otherwise>
               </xsl:choose>
            </xsl:variable>
            <xsl:choose>
               <xsl:when test="string(number($num))!='NaN'">
                  <xsl:number value="$num + $offset - 1" format="1"/>
               </xsl:when>
               <xsl:otherwise>?</xsl:otherwise>
            </xsl:choose>
         </xsl:when>
         <xsl:when test="not(ancestor::book[contains(@doctype,'cir') or contains(@doctype,'em') or contains(@doctype,'tmm')]) and not(ancestor::book[contains(@doctype,'oh')] and ancestor::ata-page-block/@pb-name[.='service']) and not(ancestor::book[contains(@doctype,'oh')] and ancestor::page-block/@pb-name[.='service']) and not(ancestor::ata-page-block/@pb-name[.='00awl' or .='00intro' or .='airlim' or .='awl' or .='awlror' or .='chapsect' or .='consume' or .='d-and-o' or .='frontmatte' or .='howtouse' or .='00howtouse' or .='intro' or .='nut_option' or .='oplimits' or .='sblist' or .='schedchk' or .='spectool' or .='timelim' or .='title-page']) and not(ancestor::page-block/@pb-name[.='00awl' or .='00intro' or .='airlim' or .='awl' or .='awlror' or .='chapsect' or .='consume' or .='d-and-o' or .='frontmatte' or .='howtouse' or .='00howtouse' or .='intro' or .='nut_option' or .='oplimits' or .='sblist' or .='schedchk' or .='spectool' or .='timelim' or .='title-page']) and not(ancestor::ata-page-block/@pb-name[(starts-with(., 'do') and 'do' = translate(., '0123456789', '') and string-length(.) &gt; 2) or (starts-with(., 'in') and 'in' = translate(., '0123456789', '') and string-length(.) &gt; 2) or (starts-with(., 'tl') and 'tl' = translate(., '0123456789', '') and string-length(.) &gt; 2) or .='toolsht' or .='trlist' or .='unschedc' or .='unschedchk']) and not(ancestor::page-block/@pb-name[(starts-with(., 'do') and 'do' = translate(., '0123456789', '') and string-length(.) &gt; 2) or (starts-with(., 'in') and 'in' = translate(., '0123456789', '') and string-length(.) &gt; 2) or (starts-with(., 'tl') and 'tl' = translate(., '0123456789', '') and string-length(.) &gt; 2) or .='toolsht' or .='trlist' or .='unschedc' or .='unschedchk']) and not(ancestor-or-self::ata-page-block[1]/@pb-name and string(ancestor-or-self::ata-page-block[1]/@pb-name)='intro00') and not(ancestor-or-self::page-block[1]/@pb-name and string(ancestor-or-self::page-block[1]/@pb-name)='intro00') and not(ancestor::ata-page-block/@pb-name[starts-with(., 'disassy') or starts-with(., 'fault')]) and not(ancestor::page-block/@pb-name[starts-with(., 'disassy') or starts-with(., 'fault')]) and not(ancestor::book[contains(@doctype,'oh')] and ancestor::ata-page-block/@pb-name[starts-with(., 'clean')]) and not(ancestor::book[contains(@doctype,'oh')] and ancestor::page-block/@pb-name[starts-with(., 'clean')]) and not(ancestor::ata-page-block/@pb-name[starts-with(., 'mainprac')]) and not(ancestor::page-block/@pb-name[starts-with(., 'mainprac')]) and not(ancestor::book[contains(@doctype,'oh')] and ancestor::ata-page-block/@pb-name[starts-with(., 'inspect')]) and not(ancestor::book[contains(@doctype,'oh')] and ancestor::page-block/@pb-name[starts-with(., 'inspect')]) and not(ancestor::ata-page-block/@pb-name[(starts-with(., 'di') and 'di' = translate(., '0123456789', '') and string-length(.) &gt; 2) or starts-with(.,'service')]) and not(ancestor::page-block/@pb-name[(starts-with(., 'di') and 'di' = translate(., '0123456789', '') and string-length(.) &gt; 2) or starts-with(.,'service')]) and not(ancestor::book[contains(@doctype,'oh')] and ancestor::ata-page-block/@pb-name[starts-with(., 'repair')]) and not(ancestor::book[contains(@doctype,'oh')] and ancestor::page-block/@pb-name[starts-with(., 'repair')]) and not(ancestor::ata-page-block/@pb-name[(starts-with(., 'cl') and 'cl' = translate(., '0123456789', '') and string-length(.) &gt; 2) or .='install' or starts-with(.,'rem-inst') or (starts-with(., 'reminst') and 'reminst' = translate(., '0123456789', '') and string-length(.) &gt; 7) or .='remove' or (starts-with(., 'repair') and 'repair' = translate(., '0123456789', '') and string-length(.) &gt; 6)]) and not(ancestor::page-block/@pb-name[(starts-with(., 'cl') and 'cl' = translate(., '0123456789', '') and string-length(.) &gt; 2) or .='install' or starts-with(.,'rem-inst') or (starts-with(., 'reminst') and 'reminst' = translate(., '0123456789', '') and string-length(.) &gt; 7) or .='remove' or (starts-with(., 'repair') and 'repair' = translate(., '0123456789', '') and string-length(.) &gt; 6)]) and not(ancestor::ata-page-block/@pb-name[starts-with(., 'assy') or (starts-with(., 'ic') and 'ic' = translate(., '0123456789', '') and string-length(.) &gt; 2) or (starts-with(., 'te') and 'te' = translate(., '0123456789', '') and string-length(.) &gt; 2) or .='test']) and not(ancestor::page-block/@pb-name[starts-with(., 'assy') or (starts-with(., 'ic') and 'ic' = translate(., '0123456789', '') and string-length(.) &gt; 2) or (starts-with(., 'te') and 'te' = translate(., '0123456789', '') and string-length(.) &gt; 2) or .='test']) and not(ancestor::ata-page-block/@pb-name[.='f-and-c' or starts-with(., 'inspect') or (starts-with(., 're') and 're' = translate(., '0123456789', '') and string-length(.) &gt; 2)]) and not(ancestor::page-block/@pb-name[.='f-and-c' or starts-with(., 'inspect') or (starts-with(., 're') and 're' = translate(., '0123456789', '') and string-length(.) &gt; 2)]) and not(ancestor::ata-page-block/@pb-name[(starts-with(., 'as') and 'as' = translate(., '0123456789', '') and string-length(.) &gt; 2) or starts-with(.,'clean') or (starts-with(., 'test') and 'test' = translate(., '0123456789', '') and string-length(.) &gt; 4)]) and not(ancestor::page-block/@pb-name[(starts-with(., 'as') and 'as' = translate(., '0123456789', '') and string-length(.) &gt; 2) or starts-with(.,'clean') or (starts-with(., 'test') and 'test' = translate(., '0123456789', '') and string-length(.) &gt; 4)]) and not(ancestor::ata-page-block/@pb-name[(starts-with(., 'fc') and 'fc' = translate(., '0123456789', '') and string-length(.) &gt; 2) or starts-with(.,'repair') or .='trouble']) and (ancestor::page-block/@pb-name[(starts-with(., 'fc') and 'fc' = translate(., '0123456789', '') and string-length(.) &gt; 2) or starts-with(.,'repair') or .='trouble'])">
            <xsl:variable name="node-id" select="generate-id(.)"/>
            <xsl:variable name="from-node" select="(ancestor-or-self::page-block[not(ancestor::page-block)])[last()]"/>
            <xsl:variable name="num">
               <xsl:variable name="candidate-num">
                  <xsl:choose>
                     <xsl:when test="count($from-node) &gt; 0">
                        <xsl:for-each select="$from-node/descendant-or-self::*[@_gte:count-as-id='cnt__table^page-block.cnt']">
                           <xsl:if test="generate-id(.) = $node-id">
                              <xsl:value-of select="position()"/>
                           </xsl:if>
                        </xsl:for-each>
                     </xsl:when>
                     <xsl:otherwise>
                        <xsl:for-each select="//*[@_gte:count-as-id='cnt__table^page-block.cnt'][not(ancestor-or-self::page-block)]">
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
            <xsl:variable name="offset">
               <!--Evaluate startAtXPath using the first counted element within the numbering scope as the context node-->
               <xsl:variable name="initial-num">
                  <xsl:choose>
                     <xsl:when test="count($from-node) &gt; 0">
                        <xsl:apply-templates select="($from-node/descendant-or-self::*[@_gte:count-as-id='cnt__table^page-block.cnt'])[1]" mode="startat-xpath"/>
                     </xsl:when>
                     <xsl:otherwise>
                        <xsl:apply-templates select="(//*[@_gte:count-as-id='cnt__table^page-block.cnt'][not(ancestor-or-self::page-block)])[1]" mode="startat-xpath"/>
                     </xsl:otherwise>
                  </xsl:choose>
               </xsl:variable>
               <xsl:choose>
                  <xsl:when test="string(number($initial-num))!='NaN'">
                     <xsl:value-of select="$initial-num"/>
                  </xsl:when>
                  <xsl:otherwise>1</xsl:otherwise>
               </xsl:choose>
            </xsl:variable>
            <xsl:choose>
               <xsl:when test="string(number($num))!='NaN'">
                  <xsl:number value="$num + $offset - 1" format="1"/>
               </xsl:when>
               <xsl:otherwise>?</xsl:otherwise>
            </xsl:choose>
         </xsl:when>
         <xsl:when test="not(ancestor::book[contains(@doctype,'cir') or contains(@doctype,'em') or contains(@doctype,'tmm')]) and not(ancestor::book[contains(@doctype,'oh')] and ancestor::ata-page-block/@pb-name[.='service']) and not(ancestor::book[contains(@doctype,'oh')] and ancestor::page-block/@pb-name[.='service']) and not(ancestor::ata-page-block/@pb-name[.='00awl' or .='00intro' or .='airlim' or .='awl' or .='awlror' or .='chapsect' or .='consume' or .='d-and-o' or .='frontmatte' or .='howtouse' or .='00howtouse' or .='intro' or .='nut_option' or .='oplimits' or .='sblist' or .='schedchk' or .='spectool' or .='timelim' or .='title-page']) and not(ancestor::page-block/@pb-name[.='00awl' or .='00intro' or .='airlim' or .='awl' or .='awlror' or .='chapsect' or .='consume' or .='d-and-o' or .='frontmatte' or .='howtouse' or .='00howtouse' or .='intro' or .='nut_option' or .='oplimits' or .='sblist' or .='schedchk' or .='spectool' or .='timelim' or .='title-page']) and not(ancestor::ata-page-block/@pb-name[(starts-with(., 'do') and 'do' = translate(., '0123456789', '') and string-length(.) &gt; 2) or (starts-with(., 'in') and 'in' = translate(., '0123456789', '') and string-length(.) &gt; 2) or (starts-with(., 'tl') and 'tl' = translate(., '0123456789', '') and string-length(.) &gt; 2) or .='toolsht' or .='trlist' or .='unschedc' or .='unschedchk']) and not(ancestor::page-block/@pb-name[(starts-with(., 'do') and 'do' = translate(., '0123456789', '') and string-length(.) &gt; 2) or (starts-with(., 'in') and 'in' = translate(., '0123456789', '') and string-length(.) &gt; 2) or (starts-with(., 'tl') and 'tl' = translate(., '0123456789', '') and string-length(.) &gt; 2) or .='toolsht' or .='trlist' or .='unschedc' or .='unschedchk']) and not(ancestor-or-self::ata-page-block[1]/@pb-name and string(ancestor-or-self::ata-page-block[1]/@pb-name)='intro00') and not(ancestor-or-self::page-block[1]/@pb-name and string(ancestor-or-self::page-block[1]/@pb-name)='intro00') and not(ancestor::ata-page-block/@pb-name[starts-with(., 'disassy') or starts-with(., 'fault')]) and not(ancestor::page-block/@pb-name[starts-with(., 'disassy') or starts-with(., 'fault')]) and not(ancestor::book[contains(@doctype,'oh')] and ancestor::ata-page-block/@pb-name[starts-with(., 'clean')]) and not(ancestor::book[contains(@doctype,'oh')] and ancestor::page-block/@pb-name[starts-with(., 'clean')]) and not(ancestor::ata-page-block/@pb-name[starts-with(., 'mainprac')]) and not(ancestor::page-block/@pb-name[starts-with(., 'mainprac')]) and not(ancestor::book[contains(@doctype,'oh')] and ancestor::ata-page-block/@pb-name[starts-with(., 'inspect')]) and not(ancestor::book[contains(@doctype,'oh')] and ancestor::page-block/@pb-name[starts-with(., 'inspect')]) and not(ancestor::ata-page-block/@pb-name[(starts-with(., 'di') and 'di' = translate(., '0123456789', '') and string-length(.) &gt; 2) or starts-with(.,'service')]) and not(ancestor::page-block/@pb-name[(starts-with(., 'di') and 'di' = translate(., '0123456789', '') and string-length(.) &gt; 2) or starts-with(.,'service')]) and not(ancestor::book[contains(@doctype,'oh')] and ancestor::ata-page-block/@pb-name[starts-with(., 'repair')]) and not(ancestor::book[contains(@doctype,'oh')] and ancestor::page-block/@pb-name[starts-with(., 'repair')]) and not(ancestor::ata-page-block/@pb-name[(starts-with(., 'cl') and 'cl' = translate(., '0123456789', '') and string-length(.) &gt; 2) or .='install' or starts-with(.,'rem-inst') or (starts-with(., 'reminst') and 'reminst' = translate(., '0123456789', '') and string-length(.) &gt; 7) or .='remove' or (starts-with(., 'repair') and 'repair' = translate(., '0123456789', '') and string-length(.) &gt; 6)]) and not(ancestor::page-block/@pb-name[(starts-with(., 'cl') and 'cl' = translate(., '0123456789', '') and string-length(.) &gt; 2) or .='install' or starts-with(.,'rem-inst') or (starts-with(., 'reminst') and 'reminst' = translate(., '0123456789', '') and string-length(.) &gt; 7) or .='remove' or (starts-with(., 'repair') and 'repair' = translate(., '0123456789', '') and string-length(.) &gt; 6)]) and not(ancestor::ata-page-block/@pb-name[starts-with(., 'assy') or (starts-with(., 'ic') and 'ic' = translate(., '0123456789', '') and string-length(.) &gt; 2) or (starts-with(., 'te') and 'te' = translate(., '0123456789', '') and string-length(.) &gt; 2) or .='test']) and not(ancestor::page-block/@pb-name[starts-with(., 'assy') or (starts-with(., 'ic') and 'ic' = translate(., '0123456789', '') and string-length(.) &gt; 2) or (starts-with(., 'te') and 'te' = translate(., '0123456789', '') and string-length(.) &gt; 2) or .='test']) and not(ancestor::ata-page-block/@pb-name[.='f-and-c' or starts-with(., 'inspect') or (starts-with(., 're') and 're' = translate(., '0123456789', '') and string-length(.) &gt; 2)]) and not(ancestor::page-block/@pb-name[.='f-and-c' or starts-with(., 'inspect') or (starts-with(., 're') and 're' = translate(., '0123456789', '') and string-length(.) &gt; 2)]) and not(ancestor::ata-page-block/@pb-name[(starts-with(., 'as') and 'as' = translate(., '0123456789', '') and string-length(.) &gt; 2) or starts-with(.,'clean') or (starts-with(., 'test') and 'test' = translate(., '0123456789', '') and string-length(.) &gt; 4)]) and not(ancestor::page-block/@pb-name[(starts-with(., 'as') and 'as' = translate(., '0123456789', '') and string-length(.) &gt; 2) or starts-with(.,'clean') or (starts-with(., 'test') and 'test' = translate(., '0123456789', '') and string-length(.) &gt; 4)]) and (ancestor::ata-page-block/@pb-name[(starts-with(., 'fc') and 'fc' = translate(., '0123456789', '') and string-length(.) &gt; 2) or starts-with(.,'repair') or .='trouble'])">
            <xsl:variable name="node-id" select="generate-id(.)"/>
            <xsl:variable name="from-node" select="(ancestor-or-self::ata-page-block[not(ancestor::ata-page-block)])[last()]"/>
            <xsl:variable name="num">
               <xsl:variable name="candidate-num">
                  <xsl:choose>
                     <xsl:when test="count($from-node) &gt; 0">
                        <xsl:for-each select="$from-node/descendant-or-self::*[@_gte:count-as-id='cnt__table^ata-page-block.cnt']">
                           <xsl:if test="generate-id(.) = $node-id">
                              <xsl:value-of select="position()"/>
                           </xsl:if>
                        </xsl:for-each>
                     </xsl:when>
                     <xsl:otherwise>
                        <xsl:for-each select="//*[@_gte:count-as-id='cnt__table^ata-page-block.cnt'][not(ancestor-or-self::ata-page-block)]">
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
            <xsl:variable name="offset">
               <!--Evaluate startAtXPath using the first counted element within the numbering scope as the context node-->
               <xsl:variable name="initial-num">
                  <xsl:choose>
                     <xsl:when test="count($from-node) &gt; 0">
                        <xsl:apply-templates select="($from-node/descendant-or-self::*[@_gte:count-as-id='cnt__table^ata-page-block.cnt'])[1]" mode="startat-xpath"/>
                     </xsl:when>
                     <xsl:otherwise>
                        <xsl:apply-templates select="(//*[@_gte:count-as-id='cnt__table^ata-page-block.cnt'][not(ancestor-or-self::ata-page-block)])[1]" mode="startat-xpath"/>
                     </xsl:otherwise>
                  </xsl:choose>
               </xsl:variable>
               <xsl:choose>
                  <xsl:when test="string(number($initial-num))!='NaN'">
                     <xsl:value-of select="$initial-num"/>
                  </xsl:when>
                  <xsl:otherwise>1</xsl:otherwise>
               </xsl:choose>
            </xsl:variable>
            <xsl:choose>
               <xsl:when test="string(number($num))!='NaN'">
                  <xsl:number value="$num + $offset - 1" format="1"/>
               </xsl:when>
               <xsl:otherwise>?</xsl:otherwise>
            </xsl:choose>
         </xsl:when>
         <xsl:when test="not(ancestor::book[contains(@doctype,'cir') or contains(@doctype,'em') or contains(@doctype,'tmm')]) and not(ancestor::book[contains(@doctype,'oh')] and ancestor::ata-page-block/@pb-name[.='service']) and not(ancestor::book[contains(@doctype,'oh')] and ancestor::page-block/@pb-name[.='service']) and not(ancestor::ata-page-block/@pb-name[.='00awl' or .='00intro' or .='airlim' or .='awl' or .='awlror' or .='chapsect' or .='consume' or .='d-and-o' or .='frontmatte' or .='howtouse' or .='00howtouse' or .='intro' or .='nut_option' or .='oplimits' or .='sblist' or .='schedchk' or .='spectool' or .='timelim' or .='title-page']) and not(ancestor::page-block/@pb-name[.='00awl' or .='00intro' or .='airlim' or .='awl' or .='awlror' or .='chapsect' or .='consume' or .='d-and-o' or .='frontmatte' or .='howtouse' or .='00howtouse' or .='intro' or .='nut_option' or .='oplimits' or .='sblist' or .='schedchk' or .='spectool' or .='timelim' or .='title-page']) and not(ancestor::ata-page-block/@pb-name[(starts-with(., 'do') and 'do' = translate(., '0123456789', '') and string-length(.) &gt; 2) or (starts-with(., 'in') and 'in' = translate(., '0123456789', '') and string-length(.) &gt; 2) or (starts-with(., 'tl') and 'tl' = translate(., '0123456789', '') and string-length(.) &gt; 2) or .='toolsht' or .='trlist' or .='unschedc' or .='unschedchk']) and not(ancestor::page-block/@pb-name[(starts-with(., 'do') and 'do' = translate(., '0123456789', '') and string-length(.) &gt; 2) or (starts-with(., 'in') and 'in' = translate(., '0123456789', '') and string-length(.) &gt; 2) or (starts-with(., 'tl') and 'tl' = translate(., '0123456789', '') and string-length(.) &gt; 2) or .='toolsht' or .='trlist' or .='unschedc' or .='unschedchk']) and not(ancestor-or-self::ata-page-block[1]/@pb-name and string(ancestor-or-self::ata-page-block[1]/@pb-name)='intro00') and not(ancestor-or-self::page-block[1]/@pb-name and string(ancestor-or-self::page-block[1]/@pb-name)='intro00') and not(ancestor::ata-page-block/@pb-name[starts-with(., 'disassy') or starts-with(., 'fault')]) and not(ancestor::page-block/@pb-name[starts-with(., 'disassy') or starts-with(., 'fault')]) and not(ancestor::book[contains(@doctype,'oh')] and ancestor::ata-page-block/@pb-name[starts-with(., 'clean')]) and not(ancestor::book[contains(@doctype,'oh')] and ancestor::page-block/@pb-name[starts-with(., 'clean')]) and not(ancestor::ata-page-block/@pb-name[starts-with(., 'mainprac')]) and not(ancestor::page-block/@pb-name[starts-with(., 'mainprac')]) and not(ancestor::book[contains(@doctype,'oh')] and ancestor::ata-page-block/@pb-name[starts-with(., 'inspect')]) and not(ancestor::book[contains(@doctype,'oh')] and ancestor::page-block/@pb-name[starts-with(., 'inspect')]) and not(ancestor::ata-page-block/@pb-name[(starts-with(., 'di') and 'di' = translate(., '0123456789', '') and string-length(.) &gt; 2) or starts-with(.,'service')]) and not(ancestor::page-block/@pb-name[(starts-with(., 'di') and 'di' = translate(., '0123456789', '') and string-length(.) &gt; 2) or starts-with(.,'service')]) and not(ancestor::book[contains(@doctype,'oh')] and ancestor::ata-page-block/@pb-name[starts-with(., 'repair')]) and not(ancestor::book[contains(@doctype,'oh')] and ancestor::page-block/@pb-name[starts-with(., 'repair')]) and not(ancestor::ata-page-block/@pb-name[(starts-with(., 'cl') and 'cl' = translate(., '0123456789', '') and string-length(.) &gt; 2) or .='install' or starts-with(.,'rem-inst') or (starts-with(., 'reminst') and 'reminst' = translate(., '0123456789', '') and string-length(.) &gt; 7) or .='remove' or (starts-with(., 'repair') and 'repair' = translate(., '0123456789', '') and string-length(.) &gt; 6)]) and not(ancestor::page-block/@pb-name[(starts-with(., 'cl') and 'cl' = translate(., '0123456789', '') and string-length(.) &gt; 2) or .='install' or starts-with(.,'rem-inst') or (starts-with(., 'reminst') and 'reminst' = translate(., '0123456789', '') and string-length(.) &gt; 7) or .='remove' or (starts-with(., 'repair') and 'repair' = translate(., '0123456789', '') and string-length(.) &gt; 6)]) and not(ancestor::ata-page-block/@pb-name[starts-with(., 'assy') or (starts-with(., 'ic') and 'ic' = translate(., '0123456789', '') and string-length(.) &gt; 2) or (starts-with(., 'te') and 'te' = translate(., '0123456789', '') and string-length(.) &gt; 2) or .='test']) and not(ancestor::page-block/@pb-name[starts-with(., 'assy') or (starts-with(., 'ic') and 'ic' = translate(., '0123456789', '') and string-length(.) &gt; 2) or (starts-with(., 'te') and 'te' = translate(., '0123456789', '') and string-length(.) &gt; 2) or .='test']) and not(ancestor::ata-page-block/@pb-name[.='f-and-c' or starts-with(., 'inspect') or (starts-with(., 're') and 're' = translate(., '0123456789', '') and string-length(.) &gt; 2)]) and not(ancestor::page-block/@pb-name[.='f-and-c' or starts-with(., 'inspect') or (starts-with(., 're') and 're' = translate(., '0123456789', '') and string-length(.) &gt; 2)]) and not(ancestor::ata-page-block/@pb-name[(starts-with(., 'as') and 'as' = translate(., '0123456789', '') and string-length(.) &gt; 2) or starts-with(.,'clean') or (starts-with(., 'test') and 'test' = translate(., '0123456789', '') and string-length(.) &gt; 4)]) and (ancestor::page-block/@pb-name[(starts-with(., 'as') and 'as' = translate(., '0123456789', '') and string-length(.) &gt; 2) or starts-with(.,'clean') or (starts-with(., 'test') and 'test' = translate(., '0123456789', '') and string-length(.) &gt; 4)])">
            <xsl:variable name="node-id" select="generate-id(.)"/>
            <xsl:variable name="from-node" select="(ancestor-or-self::page-block[not(ancestor::page-block)])[last()]"/>
            <xsl:variable name="num">
               <xsl:variable name="candidate-num">
                  <xsl:choose>
                     <xsl:when test="count($from-node) &gt; 0">
                        <xsl:for-each select="$from-node/descendant-or-self::*[@_gte:count-as-id='cnt__table^page-block.cnt']">
                           <xsl:if test="generate-id(.) = $node-id">
                              <xsl:value-of select="position()"/>
                           </xsl:if>
                        </xsl:for-each>
                     </xsl:when>
                     <xsl:otherwise>
                        <xsl:for-each select="//*[@_gte:count-as-id='cnt__table^page-block.cnt'][not(ancestor-or-self::page-block)]">
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
            <xsl:variable name="offset">
               <!--Evaluate startAtXPath using the first counted element within the numbering scope as the context node-->
               <xsl:variable name="initial-num">
                  <xsl:choose>
                     <xsl:when test="count($from-node) &gt; 0">
                        <xsl:apply-templates select="($from-node/descendant-or-self::*[@_gte:count-as-id='cnt__table^page-block.cnt'])[1]" mode="startat-xpath"/>
                     </xsl:when>
                     <xsl:otherwise>
                        <xsl:apply-templates select="(//*[@_gte:count-as-id='cnt__table^page-block.cnt'][not(ancestor-or-self::page-block)])[1]" mode="startat-xpath"/>
                     </xsl:otherwise>
                  </xsl:choose>
               </xsl:variable>
               <xsl:choose>
                  <xsl:when test="string(number($initial-num))!='NaN'">
                     <xsl:value-of select="$initial-num"/>
                  </xsl:when>
                  <xsl:otherwise>1</xsl:otherwise>
               </xsl:choose>
            </xsl:variable>
            <xsl:choose>
               <xsl:when test="string(number($num))!='NaN'">
                  <xsl:number value="$num + $offset - 1" format="1"/>
               </xsl:when>
               <xsl:otherwise>?</xsl:otherwise>
            </xsl:choose>
         </xsl:when>
         <xsl:when test="not(ancestor::book[contains(@doctype,'cir') or contains(@doctype,'em') or contains(@doctype,'tmm')]) and not(ancestor::book[contains(@doctype,'oh')] and ancestor::ata-page-block/@pb-name[.='service']) and not(ancestor::book[contains(@doctype,'oh')] and ancestor::page-block/@pb-name[.='service']) and not(ancestor::ata-page-block/@pb-name[.='00awl' or .='00intro' or .='airlim' or .='awl' or .='awlror' or .='chapsect' or .='consume' or .='d-and-o' or .='frontmatte' or .='howtouse' or .='00howtouse' or .='intro' or .='nut_option' or .='oplimits' or .='sblist' or .='schedchk' or .='spectool' or .='timelim' or .='title-page']) and not(ancestor::page-block/@pb-name[.='00awl' or .='00intro' or .='airlim' or .='awl' or .='awlror' or .='chapsect' or .='consume' or .='d-and-o' or .='frontmatte' or .='howtouse' or .='00howtouse' or .='intro' or .='nut_option' or .='oplimits' or .='sblist' or .='schedchk' or .='spectool' or .='timelim' or .='title-page']) and not(ancestor::ata-page-block/@pb-name[(starts-with(., 'do') and 'do' = translate(., '0123456789', '') and string-length(.) &gt; 2) or (starts-with(., 'in') and 'in' = translate(., '0123456789', '') and string-length(.) &gt; 2) or (starts-with(., 'tl') and 'tl' = translate(., '0123456789', '') and string-length(.) &gt; 2) or .='toolsht' or .='trlist' or .='unschedc' or .='unschedchk']) and not(ancestor::page-block/@pb-name[(starts-with(., 'do') and 'do' = translate(., '0123456789', '') and string-length(.) &gt; 2) or (starts-with(., 'in') and 'in' = translate(., '0123456789', '') and string-length(.) &gt; 2) or (starts-with(., 'tl') and 'tl' = translate(., '0123456789', '') and string-length(.) &gt; 2) or .='toolsht' or .='trlist' or .='unschedc' or .='unschedchk']) and not(ancestor-or-self::ata-page-block[1]/@pb-name and string(ancestor-or-self::ata-page-block[1]/@pb-name)='intro00') and not(ancestor-or-self::page-block[1]/@pb-name and string(ancestor-or-self::page-block[1]/@pb-name)='intro00') and not(ancestor::ata-page-block/@pb-name[starts-with(., 'disassy') or starts-with(., 'fault')]) and not(ancestor::page-block/@pb-name[starts-with(., 'disassy') or starts-with(., 'fault')]) and not(ancestor::book[contains(@doctype,'oh')] and ancestor::ata-page-block/@pb-name[starts-with(., 'clean')]) and not(ancestor::book[contains(@doctype,'oh')] and ancestor::page-block/@pb-name[starts-with(., 'clean')]) and not(ancestor::ata-page-block/@pb-name[starts-with(., 'mainprac')]) and not(ancestor::page-block/@pb-name[starts-with(., 'mainprac')]) and not(ancestor::book[contains(@doctype,'oh')] and ancestor::ata-page-block/@pb-name[starts-with(., 'inspect')]) and not(ancestor::book[contains(@doctype,'oh')] and ancestor::page-block/@pb-name[starts-with(., 'inspect')]) and not(ancestor::ata-page-block/@pb-name[(starts-with(., 'di') and 'di' = translate(., '0123456789', '') and string-length(.) &gt; 2) or starts-with(.,'service')]) and not(ancestor::page-block/@pb-name[(starts-with(., 'di') and 'di' = translate(., '0123456789', '') and string-length(.) &gt; 2) or starts-with(.,'service')]) and not(ancestor::book[contains(@doctype,'oh')] and ancestor::ata-page-block/@pb-name[starts-with(., 'repair')]) and not(ancestor::book[contains(@doctype,'oh')] and ancestor::page-block/@pb-name[starts-with(., 'repair')]) and not(ancestor::ata-page-block/@pb-name[(starts-with(., 'cl') and 'cl' = translate(., '0123456789', '') and string-length(.) &gt; 2) or .='install' or starts-with(.,'rem-inst') or (starts-with(., 'reminst') and 'reminst' = translate(., '0123456789', '') and string-length(.) &gt; 7) or .='remove' or (starts-with(., 'repair') and 'repair' = translate(., '0123456789', '') and string-length(.) &gt; 6)]) and not(ancestor::page-block/@pb-name[(starts-with(., 'cl') and 'cl' = translate(., '0123456789', '') and string-length(.) &gt; 2) or .='install' or starts-with(.,'rem-inst') or (starts-with(., 'reminst') and 'reminst' = translate(., '0123456789', '') and string-length(.) &gt; 7) or .='remove' or (starts-with(., 'repair') and 'repair' = translate(., '0123456789', '') and string-length(.) &gt; 6)]) and not(ancestor::ata-page-block/@pb-name[starts-with(., 'assy') or (starts-with(., 'ic') and 'ic' = translate(., '0123456789', '') and string-length(.) &gt; 2) or (starts-with(., 'te') and 'te' = translate(., '0123456789', '') and string-length(.) &gt; 2) or .='test']) and not(ancestor::page-block/@pb-name[starts-with(., 'assy') or (starts-with(., 'ic') and 'ic' = translate(., '0123456789', '') and string-length(.) &gt; 2) or (starts-with(., 'te') and 'te' = translate(., '0123456789', '') and string-length(.) &gt; 2) or .='test']) and not(ancestor::ata-page-block/@pb-name[.='f-and-c' or starts-with(., 'inspect') or (starts-with(., 're') and 're' = translate(., '0123456789', '') and string-length(.) &gt; 2)]) and not(ancestor::page-block/@pb-name[.='f-and-c' or starts-with(., 'inspect') or (starts-with(., 're') and 're' = translate(., '0123456789', '') and string-length(.) &gt; 2)]) and (ancestor::ata-page-block/@pb-name[(starts-with(., 'as') and 'as' = translate(., '0123456789', '') and string-length(.) &gt; 2) or starts-with(.,'clean') or (starts-with(., 'test') and 'test' = translate(., '0123456789', '') and string-length(.) &gt; 4)])">
            <xsl:variable name="node-id" select="generate-id(.)"/>
            <xsl:variable name="from-node" select="(ancestor-or-self::ata-page-block[not(ancestor::ata-page-block)])[last()]"/>
            <xsl:variable name="num">
               <xsl:variable name="candidate-num">
                  <xsl:choose>
                     <xsl:when test="count($from-node) &gt; 0">
                        <xsl:for-each select="$from-node/descendant-or-self::*[@_gte:count-as-id='cnt__table^ata-page-block.cnt']">
                           <xsl:if test="generate-id(.) = $node-id">
                              <xsl:value-of select="position()"/>
                           </xsl:if>
                        </xsl:for-each>
                     </xsl:when>
                     <xsl:otherwise>
                        <xsl:for-each select="//*[@_gte:count-as-id='cnt__table^ata-page-block.cnt'][not(ancestor-or-self::ata-page-block)]">
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
            <xsl:variable name="offset">
               <!--Evaluate startAtXPath using the first counted element within the numbering scope as the context node-->
               <xsl:variable name="initial-num">
                  <xsl:choose>
                     <xsl:when test="count($from-node) &gt; 0">
                        <xsl:apply-templates select="($from-node/descendant-or-self::*[@_gte:count-as-id='cnt__table^ata-page-block.cnt'])[1]" mode="startat-xpath"/>
                     </xsl:when>
                     <xsl:otherwise>
                        <xsl:apply-templates select="(//*[@_gte:count-as-id='cnt__table^ata-page-block.cnt'][not(ancestor-or-self::ata-page-block)])[1]" mode="startat-xpath"/>
                     </xsl:otherwise>
                  </xsl:choose>
               </xsl:variable>
               <xsl:choose>
                  <xsl:when test="string(number($initial-num))!='NaN'">
                     <xsl:value-of select="$initial-num"/>
                  </xsl:when>
                  <xsl:otherwise>1</xsl:otherwise>
               </xsl:choose>
            </xsl:variable>
            <xsl:choose>
               <xsl:when test="string(number($num))!='NaN'">
                  <xsl:number value="$num + $offset - 1" format="1"/>
               </xsl:when>
               <xsl:otherwise>?</xsl:otherwise>
            </xsl:choose>
         </xsl:when>
         <xsl:when test="not(ancestor::book[contains(@doctype,'cir') or contains(@doctype,'em') or contains(@doctype,'tmm')]) and not(ancestor::book[contains(@doctype,'oh')] and ancestor::ata-page-block/@pb-name[.='service']) and not(ancestor::book[contains(@doctype,'oh')] and ancestor::page-block/@pb-name[.='service']) and not(ancestor::ata-page-block/@pb-name[.='00awl' or .='00intro' or .='airlim' or .='awl' or .='awlror' or .='chapsect' or .='consume' or .='d-and-o' or .='frontmatte' or .='howtouse' or .='00howtouse' or .='intro' or .='nut_option' or .='oplimits' or .='sblist' or .='schedchk' or .='spectool' or .='timelim' or .='title-page']) and not(ancestor::page-block/@pb-name[.='00awl' or .='00intro' or .='airlim' or .='awl' or .='awlror' or .='chapsect' or .='consume' or .='d-and-o' or .='frontmatte' or .='howtouse' or .='00howtouse' or .='intro' or .='nut_option' or .='oplimits' or .='sblist' or .='schedchk' or .='spectool' or .='timelim' or .='title-page']) and not(ancestor::ata-page-block/@pb-name[(starts-with(., 'do') and 'do' = translate(., '0123456789', '') and string-length(.) &gt; 2) or (starts-with(., 'in') and 'in' = translate(., '0123456789', '') and string-length(.) &gt; 2) or (starts-with(., 'tl') and 'tl' = translate(., '0123456789', '') and string-length(.) &gt; 2) or .='toolsht' or .='trlist' or .='unschedc' or .='unschedchk']) and not(ancestor::page-block/@pb-name[(starts-with(., 'do') and 'do' = translate(., '0123456789', '') and string-length(.) &gt; 2) or (starts-with(., 'in') and 'in' = translate(., '0123456789', '') and string-length(.) &gt; 2) or (starts-with(., 'tl') and 'tl' = translate(., '0123456789', '') and string-length(.) &gt; 2) or .='toolsht' or .='trlist' or .='unschedc' or .='unschedchk']) and not(ancestor-or-self::ata-page-block[1]/@pb-name and string(ancestor-or-self::ata-page-block[1]/@pb-name)='intro00') and not(ancestor-or-self::page-block[1]/@pb-name and string(ancestor-or-self::page-block[1]/@pb-name)='intro00') and not(ancestor::ata-page-block/@pb-name[starts-with(., 'disassy') or starts-with(., 'fault')]) and not(ancestor::page-block/@pb-name[starts-with(., 'disassy') or starts-with(., 'fault')]) and not(ancestor::book[contains(@doctype,'oh')] and ancestor::ata-page-block/@pb-name[starts-with(., 'clean')]) and not(ancestor::book[contains(@doctype,'oh')] and ancestor::page-block/@pb-name[starts-with(., 'clean')]) and not(ancestor::ata-page-block/@pb-name[starts-with(., 'mainprac')]) and not(ancestor::page-block/@pb-name[starts-with(., 'mainprac')]) and not(ancestor::book[contains(@doctype,'oh')] and ancestor::ata-page-block/@pb-name[starts-with(., 'inspect')]) and not(ancestor::book[contains(@doctype,'oh')] and ancestor::page-block/@pb-name[starts-with(., 'inspect')]) and not(ancestor::ata-page-block/@pb-name[(starts-with(., 'di') and 'di' = translate(., '0123456789', '') and string-length(.) &gt; 2) or starts-with(.,'service')]) and not(ancestor::page-block/@pb-name[(starts-with(., 'di') and 'di' = translate(., '0123456789', '') and string-length(.) &gt; 2) or starts-with(.,'service')]) and not(ancestor::book[contains(@doctype,'oh')] and ancestor::ata-page-block/@pb-name[starts-with(., 'repair')]) and not(ancestor::book[contains(@doctype,'oh')] and ancestor::page-block/@pb-name[starts-with(., 'repair')]) and not(ancestor::ata-page-block/@pb-name[(starts-with(., 'cl') and 'cl' = translate(., '0123456789', '') and string-length(.) &gt; 2) or .='install' or starts-with(.,'rem-inst') or (starts-with(., 'reminst') and 'reminst' = translate(., '0123456789', '') and string-length(.) &gt; 7) or .='remove' or (starts-with(., 'repair') and 'repair' = translate(., '0123456789', '') and string-length(.) &gt; 6)]) and not(ancestor::page-block/@pb-name[(starts-with(., 'cl') and 'cl' = translate(., '0123456789', '') and string-length(.) &gt; 2) or .='install' or starts-with(.,'rem-inst') or (starts-with(., 'reminst') and 'reminst' = translate(., '0123456789', '') and string-length(.) &gt; 7) or .='remove' or (starts-with(., 'repair') and 'repair' = translate(., '0123456789', '') and string-length(.) &gt; 6)]) and not(ancestor::ata-page-block/@pb-name[starts-with(., 'assy') or (starts-with(., 'ic') and 'ic' = translate(., '0123456789', '') and string-length(.) &gt; 2) or (starts-with(., 'te') and 'te' = translate(., '0123456789', '') and string-length(.) &gt; 2) or .='test']) and not(ancestor::page-block/@pb-name[starts-with(., 'assy') or (starts-with(., 'ic') and 'ic' = translate(., '0123456789', '') and string-length(.) &gt; 2) or (starts-with(., 'te') and 'te' = translate(., '0123456789', '') and string-length(.) &gt; 2) or .='test']) and not(ancestor::ata-page-block/@pb-name[.='f-and-c' or starts-with(., 'inspect') or (starts-with(., 're') and 're' = translate(., '0123456789', '') and string-length(.) &gt; 2)]) and (ancestor::page-block/@pb-name[.='f-and-c' or starts-with(., 'inspect') or (starts-with(., 're') and 're' = translate(., '0123456789', '') and string-length(.) &gt; 2)])">
            <xsl:variable name="node-id" select="generate-id(.)"/>
            <xsl:variable name="from-node" select="(ancestor-or-self::page-block[not(ancestor::page-block)])[last()]"/>
            <xsl:variable name="num">
               <xsl:variable name="candidate-num">
                  <xsl:choose>
                     <xsl:when test="count($from-node) &gt; 0">
                        <xsl:for-each select="$from-node/descendant-or-self::*[@_gte:count-as-id='cnt__table^page-block.cnt']">
                           <xsl:if test="generate-id(.) = $node-id">
                              <xsl:value-of select="position()"/>
                           </xsl:if>
                        </xsl:for-each>
                     </xsl:when>
                     <xsl:otherwise>
                        <xsl:for-each select="//*[@_gte:count-as-id='cnt__table^page-block.cnt'][not(ancestor-or-self::page-block)]">
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
            <xsl:variable name="offset">
               <!--Evaluate startAtXPath using the first counted element within the numbering scope as the context node-->
               <xsl:variable name="initial-num">
                  <xsl:choose>
                     <xsl:when test="count($from-node) &gt; 0">
                        <xsl:apply-templates select="($from-node/descendant-or-self::*[@_gte:count-as-id='cnt__table^page-block.cnt'])[1]" mode="startat-xpath"/>
                     </xsl:when>
                     <xsl:otherwise>
                        <xsl:apply-templates select="(//*[@_gte:count-as-id='cnt__table^page-block.cnt'][not(ancestor-or-self::page-block)])[1]" mode="startat-xpath"/>
                     </xsl:otherwise>
                  </xsl:choose>
               </xsl:variable>
               <xsl:choose>
                  <xsl:when test="string(number($initial-num))!='NaN'">
                     <xsl:value-of select="$initial-num"/>
                  </xsl:when>
                  <xsl:otherwise>1</xsl:otherwise>
               </xsl:choose>
            </xsl:variable>
            <xsl:choose>
               <xsl:when test="string(number($num))!='NaN'">
                  <xsl:number value="$num + $offset - 1" format="1"/>
               </xsl:when>
               <xsl:otherwise>?</xsl:otherwise>
            </xsl:choose>
         </xsl:when>
         <xsl:when test="not(ancestor::book[contains(@doctype,'cir') or contains(@doctype,'em') or contains(@doctype,'tmm')]) and not(ancestor::book[contains(@doctype,'oh')] and ancestor::ata-page-block/@pb-name[.='service']) and not(ancestor::book[contains(@doctype,'oh')] and ancestor::page-block/@pb-name[.='service']) and not(ancestor::ata-page-block/@pb-name[.='00awl' or .='00intro' or .='airlim' or .='awl' or .='awlror' or .='chapsect' or .='consume' or .='d-and-o' or .='frontmatte' or .='howtouse' or .='00howtouse' or .='intro' or .='nut_option' or .='oplimits' or .='sblist' or .='schedchk' or .='spectool' or .='timelim' or .='title-page']) and not(ancestor::page-block/@pb-name[.='00awl' or .='00intro' or .='airlim' or .='awl' or .='awlror' or .='chapsect' or .='consume' or .='d-and-o' or .='frontmatte' or .='howtouse' or .='00howtouse' or .='intro' or .='nut_option' or .='oplimits' or .='sblist' or .='schedchk' or .='spectool' or .='timelim' or .='title-page']) and not(ancestor::ata-page-block/@pb-name[(starts-with(., 'do') and 'do' = translate(., '0123456789', '') and string-length(.) &gt; 2) or (starts-with(., 'in') and 'in' = translate(., '0123456789', '') and string-length(.) &gt; 2) or (starts-with(., 'tl') and 'tl' = translate(., '0123456789', '') and string-length(.) &gt; 2) or .='toolsht' or .='trlist' or .='unschedc' or .='unschedchk']) and not(ancestor::page-block/@pb-name[(starts-with(., 'do') and 'do' = translate(., '0123456789', '') and string-length(.) &gt; 2) or (starts-with(., 'in') and 'in' = translate(., '0123456789', '') and string-length(.) &gt; 2) or (starts-with(., 'tl') and 'tl' = translate(., '0123456789', '') and string-length(.) &gt; 2) or .='toolsht' or .='trlist' or .='unschedc' or .='unschedchk']) and not(ancestor-or-self::ata-page-block[1]/@pb-name and string(ancestor-or-self::ata-page-block[1]/@pb-name)='intro00') and not(ancestor-or-self::page-block[1]/@pb-name and string(ancestor-or-self::page-block[1]/@pb-name)='intro00') and not(ancestor::ata-page-block/@pb-name[starts-with(., 'disassy') or starts-with(., 'fault')]) and not(ancestor::page-block/@pb-name[starts-with(., 'disassy') or starts-with(., 'fault')]) and not(ancestor::book[contains(@doctype,'oh')] and ancestor::ata-page-block/@pb-name[starts-with(., 'clean')]) and not(ancestor::book[contains(@doctype,'oh')] and ancestor::page-block/@pb-name[starts-with(., 'clean')]) and not(ancestor::ata-page-block/@pb-name[starts-with(., 'mainprac')]) and not(ancestor::page-block/@pb-name[starts-with(., 'mainprac')]) and not(ancestor::book[contains(@doctype,'oh')] and ancestor::ata-page-block/@pb-name[starts-with(., 'inspect')]) and not(ancestor::book[contains(@doctype,'oh')] and ancestor::page-block/@pb-name[starts-with(., 'inspect')]) and not(ancestor::ata-page-block/@pb-name[(starts-with(., 'di') and 'di' = translate(., '0123456789', '') and string-length(.) &gt; 2) or starts-with(.,'service')]) and not(ancestor::page-block/@pb-name[(starts-with(., 'di') and 'di' = translate(., '0123456789', '') and string-length(.) &gt; 2) or starts-with(.,'service')]) and not(ancestor::book[contains(@doctype,'oh')] and ancestor::ata-page-block/@pb-name[starts-with(., 'repair')]) and not(ancestor::book[contains(@doctype,'oh')] and ancestor::page-block/@pb-name[starts-with(., 'repair')]) and not(ancestor::ata-page-block/@pb-name[(starts-with(., 'cl') and 'cl' = translate(., '0123456789', '') and string-length(.) &gt; 2) or .='install' or starts-with(.,'rem-inst') or (starts-with(., 'reminst') and 'reminst' = translate(., '0123456789', '') and string-length(.) &gt; 7) or .='remove' or (starts-with(., 'repair') and 'repair' = translate(., '0123456789', '') and string-length(.) &gt; 6)]) and not(ancestor::page-block/@pb-name[(starts-with(., 'cl') and 'cl' = translate(., '0123456789', '') and string-length(.) &gt; 2) or .='install' or starts-with(.,'rem-inst') or (starts-with(., 'reminst') and 'reminst' = translate(., '0123456789', '') and string-length(.) &gt; 7) or .='remove' or (starts-with(., 'repair') and 'repair' = translate(., '0123456789', '') and string-length(.) &gt; 6)]) and not(ancestor::ata-page-block/@pb-name[starts-with(., 'assy') or (starts-with(., 'ic') and 'ic' = translate(., '0123456789', '') and string-length(.) &gt; 2) or (starts-with(., 'te') and 'te' = translate(., '0123456789', '') and string-length(.) &gt; 2) or .='test']) and not(ancestor::page-block/@pb-name[starts-with(., 'assy') or (starts-with(., 'ic') and 'ic' = translate(., '0123456789', '') and string-length(.) &gt; 2) or (starts-with(., 'te') and 'te' = translate(., '0123456789', '') and string-length(.) &gt; 2) or .='test']) and (ancestor::ata-page-block/@pb-name[.='f-and-c' or starts-with(., 'inspect') or (starts-with(., 're') and 're' = translate(., '0123456789', '') and string-length(.) &gt; 2)])">
            <xsl:variable name="node-id" select="generate-id(.)"/>
            <xsl:variable name="from-node" select="(ancestor-or-self::ata-page-block[not(ancestor::ata-page-block)])[last()]"/>
            <xsl:variable name="num">
               <xsl:variable name="candidate-num">
                  <xsl:choose>
                     <xsl:when test="count($from-node) &gt; 0">
                        <xsl:for-each select="$from-node/descendant-or-self::*[@_gte:count-as-id='cnt__table^ata-page-block.cnt']">
                           <xsl:if test="generate-id(.) = $node-id">
                              <xsl:value-of select="position()"/>
                           </xsl:if>
                        </xsl:for-each>
                     </xsl:when>
                     <xsl:otherwise>
                        <xsl:for-each select="//*[@_gte:count-as-id='cnt__table^ata-page-block.cnt'][not(ancestor-or-self::ata-page-block)]">
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
            <xsl:variable name="offset">
               <!--Evaluate startAtXPath using the first counted element within the numbering scope as the context node-->
               <xsl:variable name="initial-num">
                  <xsl:choose>
                     <xsl:when test="count($from-node) &gt; 0">
                        <xsl:apply-templates select="($from-node/descendant-or-self::*[@_gte:count-as-id='cnt__table^ata-page-block.cnt'])[1]" mode="startat-xpath"/>
                     </xsl:when>
                     <xsl:otherwise>
                        <xsl:apply-templates select="(//*[@_gte:count-as-id='cnt__table^ata-page-block.cnt'][not(ancestor-or-self::ata-page-block)])[1]" mode="startat-xpath"/>
                     </xsl:otherwise>
                  </xsl:choose>
               </xsl:variable>
               <xsl:choose>
                  <xsl:when test="string(number($initial-num))!='NaN'">
                     <xsl:value-of select="$initial-num"/>
                  </xsl:when>
                  <xsl:otherwise>1</xsl:otherwise>
               </xsl:choose>
            </xsl:variable>
            <xsl:choose>
               <xsl:when test="string(number($num))!='NaN'">
                  <xsl:number value="$num + $offset - 1" format="1"/>
               </xsl:when>
               <xsl:otherwise>?</xsl:otherwise>
            </xsl:choose>
         </xsl:when>
         <xsl:when test="not(ancestor::book[contains(@doctype,'cir') or contains(@doctype,'em') or contains(@doctype,'tmm')]) and not(ancestor::book[contains(@doctype,'oh')] and ancestor::ata-page-block/@pb-name[.='service']) and not(ancestor::book[contains(@doctype,'oh')] and ancestor::page-block/@pb-name[.='service']) and not(ancestor::ata-page-block/@pb-name[.='00awl' or .='00intro' or .='airlim' or .='awl' or .='awlror' or .='chapsect' or .='consume' or .='d-and-o' or .='frontmatte' or .='howtouse' or .='00howtouse' or .='intro' or .='nut_option' or .='oplimits' or .='sblist' or .='schedchk' or .='spectool' or .='timelim' or .='title-page']) and not(ancestor::page-block/@pb-name[.='00awl' or .='00intro' or .='airlim' or .='awl' or .='awlror' or .='chapsect' or .='consume' or .='d-and-o' or .='frontmatte' or .='howtouse' or .='00howtouse' or .='intro' or .='nut_option' or .='oplimits' or .='sblist' or .='schedchk' or .='spectool' or .='timelim' or .='title-page']) and not(ancestor::ata-page-block/@pb-name[(starts-with(., 'do') and 'do' = translate(., '0123456789', '') and string-length(.) &gt; 2) or (starts-with(., 'in') and 'in' = translate(., '0123456789', '') and string-length(.) &gt; 2) or (starts-with(., 'tl') and 'tl' = translate(., '0123456789', '') and string-length(.) &gt; 2) or .='toolsht' or .='trlist' or .='unschedc' or .='unschedchk']) and not(ancestor::page-block/@pb-name[(starts-with(., 'do') and 'do' = translate(., '0123456789', '') and string-length(.) &gt; 2) or (starts-with(., 'in') and 'in' = translate(., '0123456789', '') and string-length(.) &gt; 2) or (starts-with(., 'tl') and 'tl' = translate(., '0123456789', '') and string-length(.) &gt; 2) or .='toolsht' or .='trlist' or .='unschedc' or .='unschedchk']) and not(ancestor-or-self::ata-page-block[1]/@pb-name and string(ancestor-or-self::ata-page-block[1]/@pb-name)='intro00') and not(ancestor-or-self::page-block[1]/@pb-name and string(ancestor-or-self::page-block[1]/@pb-name)='intro00') and not(ancestor::ata-page-block/@pb-name[starts-with(., 'disassy') or starts-with(., 'fault')]) and not(ancestor::page-block/@pb-name[starts-with(., 'disassy') or starts-with(., 'fault')]) and not(ancestor::book[contains(@doctype,'oh')] and ancestor::ata-page-block/@pb-name[starts-with(., 'clean')]) and not(ancestor::book[contains(@doctype,'oh')] and ancestor::page-block/@pb-name[starts-with(., 'clean')]) and not(ancestor::ata-page-block/@pb-name[starts-with(., 'mainprac')]) and not(ancestor::page-block/@pb-name[starts-with(., 'mainprac')]) and not(ancestor::book[contains(@doctype,'oh')] and ancestor::ata-page-block/@pb-name[starts-with(., 'inspect')]) and not(ancestor::book[contains(@doctype,'oh')] and ancestor::page-block/@pb-name[starts-with(., 'inspect')]) and not(ancestor::ata-page-block/@pb-name[(starts-with(., 'di') and 'di' = translate(., '0123456789', '') and string-length(.) &gt; 2) or starts-with(.,'service')]) and not(ancestor::page-block/@pb-name[(starts-with(., 'di') and 'di' = translate(., '0123456789', '') and string-length(.) &gt; 2) or starts-with(.,'service')]) and not(ancestor::book[contains(@doctype,'oh')] and ancestor::ata-page-block/@pb-name[starts-with(., 'repair')]) and not(ancestor::book[contains(@doctype,'oh')] and ancestor::page-block/@pb-name[starts-with(., 'repair')]) and not(ancestor::ata-page-block/@pb-name[(starts-with(., 'cl') and 'cl' = translate(., '0123456789', '') and string-length(.) &gt; 2) or .='install' or starts-with(.,'rem-inst') or (starts-with(., 'reminst') and 'reminst' = translate(., '0123456789', '') and string-length(.) &gt; 7) or .='remove' or (starts-with(., 'repair') and 'repair' = translate(., '0123456789', '') and string-length(.) &gt; 6)]) and not(ancestor::page-block/@pb-name[(starts-with(., 'cl') and 'cl' = translate(., '0123456789', '') and string-length(.) &gt; 2) or .='install' or starts-with(.,'rem-inst') or (starts-with(., 'reminst') and 'reminst' = translate(., '0123456789', '') and string-length(.) &gt; 7) or .='remove' or (starts-with(., 'repair') and 'repair' = translate(., '0123456789', '') and string-length(.) &gt; 6)]) and not(ancestor::ata-page-block/@pb-name[starts-with(., 'assy') or (starts-with(., 'ic') and 'ic' = translate(., '0123456789', '') and string-length(.) &gt; 2) or (starts-with(., 'te') and 'te' = translate(., '0123456789', '') and string-length(.) &gt; 2) or .='test']) and (ancestor::page-block/@pb-name[starts-with(., 'assy') or (starts-with(., 'ic') and 'ic' = translate(., '0123456789', '') and string-length(.) &gt; 2) or (starts-with(., 'te') and 'te' = translate(., '0123456789', '') and string-length(.) &gt; 2) or .='test'])">
            <xsl:variable name="node-id" select="generate-id(.)"/>
            <xsl:variable name="from-node" select="(ancestor-or-self::page-block[not(ancestor::page-block)])[last()]"/>
            <xsl:variable name="num">
               <xsl:variable name="candidate-num">
                  <xsl:choose>
                     <xsl:when test="count($from-node) &gt; 0">
                        <xsl:for-each select="$from-node/descendant-or-self::*[@_gte:count-as-id='cnt__table^page-block.cnt']">
                           <xsl:if test="generate-id(.) = $node-id">
                              <xsl:value-of select="position()"/>
                           </xsl:if>
                        </xsl:for-each>
                     </xsl:when>
                     <xsl:otherwise>
                        <xsl:for-each select="//*[@_gte:count-as-id='cnt__table^page-block.cnt'][not(ancestor-or-self::page-block)]">
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
            <xsl:variable name="offset">
               <!--Evaluate startAtXPath using the first counted element within the numbering scope as the context node-->
               <xsl:variable name="initial-num">
                  <xsl:choose>
                     <xsl:when test="count($from-node) &gt; 0">
                        <xsl:apply-templates select="($from-node/descendant-or-self::*[@_gte:count-as-id='cnt__table^page-block.cnt'])[1]" mode="startat-xpath"/>
                     </xsl:when>
                     <xsl:otherwise>
                        <xsl:apply-templates select="(//*[@_gte:count-as-id='cnt__table^page-block.cnt'][not(ancestor-or-self::page-block)])[1]" mode="startat-xpath"/>
                     </xsl:otherwise>
                  </xsl:choose>
               </xsl:variable>
               <xsl:choose>
                  <xsl:when test="string(number($initial-num))!='NaN'">
                     <xsl:value-of select="$initial-num"/>
                  </xsl:when>
                  <xsl:otherwise>1</xsl:otherwise>
               </xsl:choose>
            </xsl:variable>
            <xsl:choose>
               <xsl:when test="string(number($num))!='NaN'">
                  <xsl:number value="$num + $offset - 1" format="1"/>
               </xsl:when>
               <xsl:otherwise>?</xsl:otherwise>
            </xsl:choose>
         </xsl:when>
         <xsl:when test="not(ancestor::book[contains(@doctype,'cir') or contains(@doctype,'em') or contains(@doctype,'tmm')]) and not(ancestor::book[contains(@doctype,'oh')] and ancestor::ata-page-block/@pb-name[.='service']) and not(ancestor::book[contains(@doctype,'oh')] and ancestor::page-block/@pb-name[.='service']) and not(ancestor::ata-page-block/@pb-name[.='00awl' or .='00intro' or .='airlim' or .='awl' or .='awlror' or .='chapsect' or .='consume' or .='d-and-o' or .='frontmatte' or .='howtouse' or .='00howtouse' or .='intro' or .='nut_option' or .='oplimits' or .='sblist' or .='schedchk' or .='spectool' or .='timelim' or .='title-page']) and not(ancestor::page-block/@pb-name[.='00awl' or .='00intro' or .='airlim' or .='awl' or .='awlror' or .='chapsect' or .='consume' or .='d-and-o' or .='frontmatte' or .='howtouse' or .='00howtouse' or .='intro' or .='nut_option' or .='oplimits' or .='sblist' or .='schedchk' or .='spectool' or .='timelim' or .='title-page']) and not(ancestor::ata-page-block/@pb-name[(starts-with(., 'do') and 'do' = translate(., '0123456789', '') and string-length(.) &gt; 2) or (starts-with(., 'in') and 'in' = translate(., '0123456789', '') and string-length(.) &gt; 2) or (starts-with(., 'tl') and 'tl' = translate(., '0123456789', '') and string-length(.) &gt; 2) or .='toolsht' or .='trlist' or .='unschedc' or .='unschedchk']) and not(ancestor::page-block/@pb-name[(starts-with(., 'do') and 'do' = translate(., '0123456789', '') and string-length(.) &gt; 2) or (starts-with(., 'in') and 'in' = translate(., '0123456789', '') and string-length(.) &gt; 2) or (starts-with(., 'tl') and 'tl' = translate(., '0123456789', '') and string-length(.) &gt; 2) or .='toolsht' or .='trlist' or .='unschedc' or .='unschedchk']) and not(ancestor-or-self::ata-page-block[1]/@pb-name and string(ancestor-or-self::ata-page-block[1]/@pb-name)='intro00') and not(ancestor-or-self::page-block[1]/@pb-name and string(ancestor-or-self::page-block[1]/@pb-name)='intro00') and not(ancestor::ata-page-block/@pb-name[starts-with(., 'disassy') or starts-with(., 'fault')]) and not(ancestor::page-block/@pb-name[starts-with(., 'disassy') or starts-with(., 'fault')]) and not(ancestor::book[contains(@doctype,'oh')] and ancestor::ata-page-block/@pb-name[starts-with(., 'clean')]) and not(ancestor::book[contains(@doctype,'oh')] and ancestor::page-block/@pb-name[starts-with(., 'clean')]) and not(ancestor::ata-page-block/@pb-name[starts-with(., 'mainprac')]) and not(ancestor::page-block/@pb-name[starts-with(., 'mainprac')]) and not(ancestor::book[contains(@doctype,'oh')] and ancestor::ata-page-block/@pb-name[starts-with(., 'inspect')]) and not(ancestor::book[contains(@doctype,'oh')] and ancestor::page-block/@pb-name[starts-with(., 'inspect')]) and not(ancestor::ata-page-block/@pb-name[(starts-with(., 'di') and 'di' = translate(., '0123456789', '') and string-length(.) &gt; 2) or starts-with(.,'service')]) and not(ancestor::page-block/@pb-name[(starts-with(., 'di') and 'di' = translate(., '0123456789', '') and string-length(.) &gt; 2) or starts-with(.,'service')]) and not(ancestor::book[contains(@doctype,'oh')] and ancestor::ata-page-block/@pb-name[starts-with(., 'repair')]) and not(ancestor::book[contains(@doctype,'oh')] and ancestor::page-block/@pb-name[starts-with(., 'repair')]) and not(ancestor::ata-page-block/@pb-name[(starts-with(., 'cl') and 'cl' = translate(., '0123456789', '') and string-length(.) &gt; 2) or .='install' or starts-with(.,'rem-inst') or (starts-with(., 'reminst') and 'reminst' = translate(., '0123456789', '') and string-length(.) &gt; 7) or .='remove' or (starts-with(., 'repair') and 'repair' = translate(., '0123456789', '') and string-length(.) &gt; 6)]) and not(ancestor::page-block/@pb-name[(starts-with(., 'cl') and 'cl' = translate(., '0123456789', '') and string-length(.) &gt; 2) or .='install' or starts-with(.,'rem-inst') or (starts-with(., 'reminst') and 'reminst' = translate(., '0123456789', '') and string-length(.) &gt; 7) or .='remove' or (starts-with(., 'repair') and 'repair' = translate(., '0123456789', '') and string-length(.) &gt; 6)]) and (ancestor::ata-page-block/@pb-name[starts-with(., 'assy') or (starts-with(., 'ic') and 'ic' = translate(., '0123456789', '') and string-length(.) &gt; 2) or (starts-with(., 'te') and 'te' = translate(., '0123456789', '') and string-length(.) &gt; 2) or .='test'])">
            <xsl:variable name="node-id" select="generate-id(.)"/>
            <xsl:variable name="from-node" select="(ancestor-or-self::ata-page-block[not(ancestor::ata-page-block)])[last()]"/>
            <xsl:variable name="num">
               <xsl:variable name="candidate-num">
                  <xsl:choose>
                     <xsl:when test="count($from-node) &gt; 0">
                        <xsl:for-each select="$from-node/descendant-or-self::*[@_gte:count-as-id='cnt__table^ata-page-block.cnt']">
                           <xsl:if test="generate-id(.) = $node-id">
                              <xsl:value-of select="position()"/>
                           </xsl:if>
                        </xsl:for-each>
                     </xsl:when>
                     <xsl:otherwise>
                        <xsl:for-each select="//*[@_gte:count-as-id='cnt__table^ata-page-block.cnt'][not(ancestor-or-self::ata-page-block)]">
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
            <xsl:variable name="offset">
               <!--Evaluate startAtXPath using the first counted element within the numbering scope as the context node-->
               <xsl:variable name="initial-num">
                  <xsl:choose>
                     <xsl:when test="count($from-node) &gt; 0">
                        <xsl:apply-templates select="($from-node/descendant-or-self::*[@_gte:count-as-id='cnt__table^ata-page-block.cnt'])[1]" mode="startat-xpath"/>
                     </xsl:when>
                     <xsl:otherwise>
                        <xsl:apply-templates select="(//*[@_gte:count-as-id='cnt__table^ata-page-block.cnt'][not(ancestor-or-self::ata-page-block)])[1]" mode="startat-xpath"/>
                     </xsl:otherwise>
                  </xsl:choose>
               </xsl:variable>
               <xsl:choose>
                  <xsl:when test="string(number($initial-num))!='NaN'">
                     <xsl:value-of select="$initial-num"/>
                  </xsl:when>
                  <xsl:otherwise>1</xsl:otherwise>
               </xsl:choose>
            </xsl:variable>
            <xsl:choose>
               <xsl:when test="string(number($num))!='NaN'">
                  <xsl:number value="$num + $offset - 1" format="1"/>
               </xsl:when>
               <xsl:otherwise>?</xsl:otherwise>
            </xsl:choose>
         </xsl:when>
         <xsl:when test="not(ancestor::book[contains(@doctype,'cir') or contains(@doctype,'em') or contains(@doctype,'tmm')]) and not(ancestor::book[contains(@doctype,'oh')] and ancestor::ata-page-block/@pb-name[.='service']) and not(ancestor::book[contains(@doctype,'oh')] and ancestor::page-block/@pb-name[.='service']) and not(ancestor::ata-page-block/@pb-name[.='00awl' or .='00intro' or .='airlim' or .='awl' or .='awlror' or .='chapsect' or .='consume' or .='d-and-o' or .='frontmatte' or .='howtouse' or .='00howtouse' or .='intro' or .='nut_option' or .='oplimits' or .='sblist' or .='schedchk' or .='spectool' or .='timelim' or .='title-page']) and not(ancestor::page-block/@pb-name[.='00awl' or .='00intro' or .='airlim' or .='awl' or .='awlror' or .='chapsect' or .='consume' or .='d-and-o' or .='frontmatte' or .='howtouse' or .='00howtouse' or .='intro' or .='nut_option' or .='oplimits' or .='sblist' or .='schedchk' or .='spectool' or .='timelim' or .='title-page']) and not(ancestor::ata-page-block/@pb-name[(starts-with(., 'do') and 'do' = translate(., '0123456789', '') and string-length(.) &gt; 2) or (starts-with(., 'in') and 'in' = translate(., '0123456789', '') and string-length(.) &gt; 2) or (starts-with(., 'tl') and 'tl' = translate(., '0123456789', '') and string-length(.) &gt; 2) or .='toolsht' or .='trlist' or .='unschedc' or .='unschedchk']) and not(ancestor::page-block/@pb-name[(starts-with(., 'do') and 'do' = translate(., '0123456789', '') and string-length(.) &gt; 2) or (starts-with(., 'in') and 'in' = translate(., '0123456789', '') and string-length(.) &gt; 2) or (starts-with(., 'tl') and 'tl' = translate(., '0123456789', '') and string-length(.) &gt; 2) or .='toolsht' or .='trlist' or .='unschedc' or .='unschedchk']) and not(ancestor-or-self::ata-page-block[1]/@pb-name and string(ancestor-or-self::ata-page-block[1]/@pb-name)='intro00') and not(ancestor-or-self::page-block[1]/@pb-name and string(ancestor-or-self::page-block[1]/@pb-name)='intro00') and not(ancestor::ata-page-block/@pb-name[starts-with(., 'disassy') or starts-with(., 'fault')]) and not(ancestor::page-block/@pb-name[starts-with(., 'disassy') or starts-with(., 'fault')]) and not(ancestor::book[contains(@doctype,'oh')] and ancestor::ata-page-block/@pb-name[starts-with(., 'clean')]) and not(ancestor::book[contains(@doctype,'oh')] and ancestor::page-block/@pb-name[starts-with(., 'clean')]) and not(ancestor::ata-page-block/@pb-name[starts-with(., 'mainprac')]) and not(ancestor::page-block/@pb-name[starts-with(., 'mainprac')]) and not(ancestor::book[contains(@doctype,'oh')] and ancestor::ata-page-block/@pb-name[starts-with(., 'inspect')]) and not(ancestor::book[contains(@doctype,'oh')] and ancestor::page-block/@pb-name[starts-with(., 'inspect')]) and not(ancestor::ata-page-block/@pb-name[(starts-with(., 'di') and 'di' = translate(., '0123456789', '') and string-length(.) &gt; 2) or starts-with(.,'service')]) and not(ancestor::page-block/@pb-name[(starts-with(., 'di') and 'di' = translate(., '0123456789', '') and string-length(.) &gt; 2) or starts-with(.,'service')]) and not(ancestor::book[contains(@doctype,'oh')] and ancestor::ata-page-block/@pb-name[starts-with(., 'repair')]) and not(ancestor::book[contains(@doctype,'oh')] and ancestor::page-block/@pb-name[starts-with(., 'repair')]) and not(ancestor::ata-page-block/@pb-name[(starts-with(., 'cl') and 'cl' = translate(., '0123456789', '') and string-length(.) &gt; 2) or .='install' or starts-with(.,'rem-inst') or (starts-with(., 'reminst') and 'reminst' = translate(., '0123456789', '') and string-length(.) &gt; 7) or .='remove' or (starts-with(., 'repair') and 'repair' = translate(., '0123456789', '') and string-length(.) &gt; 6)]) and (ancestor::page-block/@pb-name[(starts-with(., 'cl') and 'cl' = translate(., '0123456789', '') and string-length(.) &gt; 2) or .='install' or starts-with(.,'rem-inst') or (starts-with(., 'reminst') and 'reminst' = translate(., '0123456789', '') and string-length(.) &gt; 7) or .='remove' or (starts-with(., 'repair') and 'repair' = translate(., '0123456789', '') and string-length(.) &gt; 6)])">
            <xsl:variable name="node-id" select="generate-id(.)"/>
            <xsl:variable name="from-node" select="(ancestor-or-self::page-block[not(ancestor::page-block)])[last()]"/>
            <xsl:variable name="num">
               <xsl:variable name="candidate-num">
                  <xsl:choose>
                     <xsl:when test="count($from-node) &gt; 0">
                        <xsl:for-each select="$from-node/descendant-or-self::*[@_gte:count-as-id='cnt__table^page-block.cnt']">
                           <xsl:if test="generate-id(.) = $node-id">
                              <xsl:value-of select="position()"/>
                           </xsl:if>
                        </xsl:for-each>
                     </xsl:when>
                     <xsl:otherwise>
                        <xsl:for-each select="//*[@_gte:count-as-id='cnt__table^page-block.cnt'][not(ancestor-or-self::page-block)]">
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
            <xsl:variable name="offset">
               <!--Evaluate startAtXPath using the first counted element within the numbering scope as the context node-->
               <xsl:variable name="initial-num">
                  <xsl:choose>
                     <xsl:when test="count($from-node) &gt; 0">
                        <xsl:apply-templates select="($from-node/descendant-or-self::*[@_gte:count-as-id='cnt__table^page-block.cnt'])[1]" mode="startat-xpath"/>
                     </xsl:when>
                     <xsl:otherwise>
                        <xsl:apply-templates select="(//*[@_gte:count-as-id='cnt__table^page-block.cnt'][not(ancestor-or-self::page-block)])[1]" mode="startat-xpath"/>
                     </xsl:otherwise>
                  </xsl:choose>
               </xsl:variable>
               <xsl:choose>
                  <xsl:when test="string(number($initial-num))!='NaN'">
                     <xsl:value-of select="$initial-num"/>
                  </xsl:when>
                  <xsl:otherwise>1</xsl:otherwise>
               </xsl:choose>
            </xsl:variable>
            <xsl:choose>
               <xsl:when test="string(number($num))!='NaN'">
                  <xsl:number value="$num + $offset - 1" format="1"/>
               </xsl:when>
               <xsl:otherwise>?</xsl:otherwise>
            </xsl:choose>
         </xsl:when>
         <xsl:when test="not(ancestor::book[contains(@doctype,'cir') or contains(@doctype,'em') or contains(@doctype,'tmm')]) and not(ancestor::book[contains(@doctype,'oh')] and ancestor::ata-page-block/@pb-name[.='service']) and not(ancestor::book[contains(@doctype,'oh')] and ancestor::page-block/@pb-name[.='service']) and not(ancestor::ata-page-block/@pb-name[.='00awl' or .='00intro' or .='airlim' or .='awl' or .='awlror' or .='chapsect' or .='consume' or .='d-and-o' or .='frontmatte' or .='howtouse' or .='00howtouse' or .='intro' or .='nut_option' or .='oplimits' or .='sblist' or .='schedchk' or .='spectool' or .='timelim' or .='title-page']) and not(ancestor::page-block/@pb-name[.='00awl' or .='00intro' or .='airlim' or .='awl' or .='awlror' or .='chapsect' or .='consume' or .='d-and-o' or .='frontmatte' or .='howtouse' or .='00howtouse' or .='intro' or .='nut_option' or .='oplimits' or .='sblist' or .='schedchk' or .='spectool' or .='timelim' or .='title-page']) and not(ancestor::ata-page-block/@pb-name[(starts-with(., 'do') and 'do' = translate(., '0123456789', '') and string-length(.) &gt; 2) or (starts-with(., 'in') and 'in' = translate(., '0123456789', '') and string-length(.) &gt; 2) or (starts-with(., 'tl') and 'tl' = translate(., '0123456789', '') and string-length(.) &gt; 2) or .='toolsht' or .='trlist' or .='unschedc' or .='unschedchk']) and not(ancestor::page-block/@pb-name[(starts-with(., 'do') and 'do' = translate(., '0123456789', '') and string-length(.) &gt; 2) or (starts-with(., 'in') and 'in' = translate(., '0123456789', '') and string-length(.) &gt; 2) or (starts-with(., 'tl') and 'tl' = translate(., '0123456789', '') and string-length(.) &gt; 2) or .='toolsht' or .='trlist' or .='unschedc' or .='unschedchk']) and not(ancestor-or-self::ata-page-block[1]/@pb-name and string(ancestor-or-self::ata-page-block[1]/@pb-name)='intro00') and not(ancestor-or-self::page-block[1]/@pb-name and string(ancestor-or-self::page-block[1]/@pb-name)='intro00') and not(ancestor::ata-page-block/@pb-name[starts-with(., 'disassy') or starts-with(., 'fault')]) and not(ancestor::page-block/@pb-name[starts-with(., 'disassy') or starts-with(., 'fault')]) and not(ancestor::book[contains(@doctype,'oh')] and ancestor::ata-page-block/@pb-name[starts-with(., 'clean')]) and not(ancestor::book[contains(@doctype,'oh')] and ancestor::page-block/@pb-name[starts-with(., 'clean')]) and not(ancestor::ata-page-block/@pb-name[starts-with(., 'mainprac')]) and not(ancestor::page-block/@pb-name[starts-with(., 'mainprac')]) and not(ancestor::book[contains(@doctype,'oh')] and ancestor::ata-page-block/@pb-name[starts-with(., 'inspect')]) and not(ancestor::book[contains(@doctype,'oh')] and ancestor::page-block/@pb-name[starts-with(., 'inspect')]) and not(ancestor::ata-page-block/@pb-name[(starts-with(., 'di') and 'di' = translate(., '0123456789', '') and string-length(.) &gt; 2) or starts-with(.,'service')]) and not(ancestor::page-block/@pb-name[(starts-with(., 'di') and 'di' = translate(., '0123456789', '') and string-length(.) &gt; 2) or starts-with(.,'service')]) and not(ancestor::book[contains(@doctype,'oh')] and ancestor::ata-page-block/@pb-name[starts-with(., 'repair')]) and not(ancestor::book[contains(@doctype,'oh')] and ancestor::page-block/@pb-name[starts-with(., 'repair')]) and (ancestor::ata-page-block/@pb-name[(starts-with(., 'cl') and 'cl' = translate(., '0123456789', '') and string-length(.) &gt; 2) or .='install' or starts-with(.,'rem-inst') or (starts-with(., 'reminst') and 'reminst' = translate(., '0123456789', '') and string-length(.) &gt; 7) or .='remove' or (starts-with(., 'repair') and 'repair' = translate(., '0123456789', '') and string-length(.) &gt; 6)])">
            <xsl:variable name="node-id" select="generate-id(.)"/>
            <xsl:variable name="from-node" select="(ancestor-or-self::ata-page-block[not(ancestor::ata-page-block)])[last()]"/>
            <xsl:variable name="num">
               <xsl:variable name="candidate-num">
                  <xsl:choose>
                     <xsl:when test="count($from-node) &gt; 0">
                        <xsl:for-each select="$from-node/descendant-or-self::*[@_gte:count-as-id='cnt__table^ata-page-block.cnt']">
                           <xsl:if test="generate-id(.) = $node-id">
                              <xsl:value-of select="position()"/>
                           </xsl:if>
                        </xsl:for-each>
                     </xsl:when>
                     <xsl:otherwise>
                        <xsl:for-each select="//*[@_gte:count-as-id='cnt__table^ata-page-block.cnt'][not(ancestor-or-self::ata-page-block)]">
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
            <xsl:variable name="offset">
               <!--Evaluate startAtXPath using the first counted element within the numbering scope as the context node-->
               <xsl:variable name="initial-num">
                  <xsl:choose>
                     <xsl:when test="count($from-node) &gt; 0">
                        <xsl:apply-templates select="($from-node/descendant-or-self::*[@_gte:count-as-id='cnt__table^ata-page-block.cnt'])[1]" mode="startat-xpath"/>
                     </xsl:when>
                     <xsl:otherwise>
                        <xsl:apply-templates select="(//*[@_gte:count-as-id='cnt__table^ata-page-block.cnt'][not(ancestor-or-self::ata-page-block)])[1]" mode="startat-xpath"/>
                     </xsl:otherwise>
                  </xsl:choose>
               </xsl:variable>
               <xsl:choose>
                  <xsl:when test="string(number($initial-num))!='NaN'">
                     <xsl:value-of select="$initial-num"/>
                  </xsl:when>
                  <xsl:otherwise>1</xsl:otherwise>
               </xsl:choose>
            </xsl:variable>
            <xsl:choose>
               <xsl:when test="string(number($num))!='NaN'">
                  <xsl:number value="$num + $offset - 1" format="1"/>
               </xsl:when>
               <xsl:otherwise>?</xsl:otherwise>
            </xsl:choose>
         </xsl:when>
         <xsl:when test="not(ancestor::book[contains(@doctype,'cir') or contains(@doctype,'em') or contains(@doctype,'tmm')]) and not(ancestor::book[contains(@doctype,'oh')] and ancestor::ata-page-block/@pb-name[.='service']) and not(ancestor::book[contains(@doctype,'oh')] and ancestor::page-block/@pb-name[.='service']) and not(ancestor::ata-page-block/@pb-name[.='00awl' or .='00intro' or .='airlim' or .='awl' or .='awlror' or .='chapsect' or .='consume' or .='d-and-o' or .='frontmatte' or .='howtouse' or .='00howtouse' or .='intro' or .='nut_option' or .='oplimits' or .='sblist' or .='schedchk' or .='spectool' or .='timelim' or .='title-page']) and not(ancestor::page-block/@pb-name[.='00awl' or .='00intro' or .='airlim' or .='awl' or .='awlror' or .='chapsect' or .='consume' or .='d-and-o' or .='frontmatte' or .='howtouse' or .='00howtouse' or .='intro' or .='nut_option' or .='oplimits' or .='sblist' or .='schedchk' or .='spectool' or .='timelim' or .='title-page']) and not(ancestor::ata-page-block/@pb-name[(starts-with(., 'do') and 'do' = translate(., '0123456789', '') and string-length(.) &gt; 2) or (starts-with(., 'in') and 'in' = translate(., '0123456789', '') and string-length(.) &gt; 2) or (starts-with(., 'tl') and 'tl' = translate(., '0123456789', '') and string-length(.) &gt; 2) or .='toolsht' or .='trlist' or .='unschedc' or .='unschedchk']) and not(ancestor::page-block/@pb-name[(starts-with(., 'do') and 'do' = translate(., '0123456789', '') and string-length(.) &gt; 2) or (starts-with(., 'in') and 'in' = translate(., '0123456789', '') and string-length(.) &gt; 2) or (starts-with(., 'tl') and 'tl' = translate(., '0123456789', '') and string-length(.) &gt; 2) or .='toolsht' or .='trlist' or .='unschedc' or .='unschedchk']) and not(ancestor-or-self::ata-page-block[1]/@pb-name and string(ancestor-or-self::ata-page-block[1]/@pb-name)='intro00') and not(ancestor-or-self::page-block[1]/@pb-name and string(ancestor-or-self::page-block[1]/@pb-name)='intro00') and not(ancestor::ata-page-block/@pb-name[starts-with(., 'disassy') or starts-with(., 'fault')]) and not(ancestor::page-block/@pb-name[starts-with(., 'disassy') or starts-with(., 'fault')]) and not(ancestor::book[contains(@doctype,'oh')] and ancestor::ata-page-block/@pb-name[starts-with(., 'clean')]) and not(ancestor::book[contains(@doctype,'oh')] and ancestor::page-block/@pb-name[starts-with(., 'clean')]) and not(ancestor::ata-page-block/@pb-name[starts-with(., 'mainprac')]) and not(ancestor::page-block/@pb-name[starts-with(., 'mainprac')]) and not(ancestor::book[contains(@doctype,'oh')] and ancestor::ata-page-block/@pb-name[starts-with(., 'inspect')]) and not(ancestor::book[contains(@doctype,'oh')] and ancestor::page-block/@pb-name[starts-with(., 'inspect')]) and not(ancestor::ata-page-block/@pb-name[(starts-with(., 'di') and 'di' = translate(., '0123456789', '') and string-length(.) &gt; 2) or starts-with(.,'service')]) and not(ancestor::page-block/@pb-name[(starts-with(., 'di') and 'di' = translate(., '0123456789', '') and string-length(.) &gt; 2) or starts-with(.,'service')]) and not(ancestor::book[contains(@doctype,'oh')] and ancestor::ata-page-block/@pb-name[starts-with(., 'repair')]) and (ancestor::book[contains(@doctype,'oh')] and ancestor::page-block/@pb-name[starts-with(., 'repair')])">
            <xsl:variable name="node-id" select="generate-id(.)"/>
            <xsl:variable name="from-node" select="(ancestor-or-self::page-block[not(ancestor::page-block)])[last()]"/>
            <xsl:variable name="num">
               <xsl:variable name="candidate-num">
                  <xsl:choose>
                     <xsl:when test="count($from-node) &gt; 0">
                        <xsl:for-each select="$from-node/descendant-or-self::*[@_gte:count-as-id='cnt__table^page-block.cnt']">
                           <xsl:if test="generate-id(.) = $node-id">
                              <xsl:value-of select="position()"/>
                           </xsl:if>
                        </xsl:for-each>
                     </xsl:when>
                     <xsl:otherwise>
                        <xsl:for-each select="//*[@_gte:count-as-id='cnt__table^page-block.cnt'][not(ancestor-or-self::page-block)]">
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
            <xsl:variable name="offset">
               <!--Evaluate startAtXPath using the first counted element within the numbering scope as the context node-->
               <xsl:variable name="initial-num">
                  <xsl:choose>
                     <xsl:when test="count($from-node) &gt; 0">
                        <xsl:apply-templates select="($from-node/descendant-or-self::*[@_gte:count-as-id='cnt__table^page-block.cnt'])[1]" mode="startat-xpath"/>
                     </xsl:when>
                     <xsl:otherwise>
                        <xsl:apply-templates select="(//*[@_gte:count-as-id='cnt__table^page-block.cnt'][not(ancestor-or-self::page-block)])[1]" mode="startat-xpath"/>
                     </xsl:otherwise>
                  </xsl:choose>
               </xsl:variable>
               <xsl:choose>
                  <xsl:when test="string(number($initial-num))!='NaN'">
                     <xsl:value-of select="$initial-num"/>
                  </xsl:when>
                  <xsl:otherwise>1</xsl:otherwise>
               </xsl:choose>
            </xsl:variable>
            <xsl:choose>
               <xsl:when test="string(number($num))!='NaN'">
                  <xsl:number value="$num + $offset - 1" format="1"/>
               </xsl:when>
               <xsl:otherwise>?</xsl:otherwise>
            </xsl:choose>
         </xsl:when>
         <xsl:when test="not(ancestor::book[contains(@doctype,'cir') or contains(@doctype,'em') or contains(@doctype,'tmm')]) and not(ancestor::book[contains(@doctype,'oh')] and ancestor::ata-page-block/@pb-name[.='service']) and not(ancestor::book[contains(@doctype,'oh')] and ancestor::page-block/@pb-name[.='service']) and not(ancestor::ata-page-block/@pb-name[.='00awl' or .='00intro' or .='airlim' or .='awl' or .='awlror' or .='chapsect' or .='consume' or .='d-and-o' or .='frontmatte' or .='howtouse' or .='00howtouse' or .='intro' or .='nut_option' or .='oplimits' or .='sblist' or .='schedchk' or .='spectool' or .='timelim' or .='title-page']) and not(ancestor::page-block/@pb-name[.='00awl' or .='00intro' or .='airlim' or .='awl' or .='awlror' or .='chapsect' or .='consume' or .='d-and-o' or .='frontmatte' or .='howtouse' or .='00howtouse' or .='intro' or .='nut_option' or .='oplimits' or .='sblist' or .='schedchk' or .='spectool' or .='timelim' or .='title-page']) and not(ancestor::ata-page-block/@pb-name[(starts-with(., 'do') and 'do' = translate(., '0123456789', '') and string-length(.) &gt; 2) or (starts-with(., 'in') and 'in' = translate(., '0123456789', '') and string-length(.) &gt; 2) or (starts-with(., 'tl') and 'tl' = translate(., '0123456789', '') and string-length(.) &gt; 2) or .='toolsht' or .='trlist' or .='unschedc' or .='unschedchk']) and not(ancestor::page-block/@pb-name[(starts-with(., 'do') and 'do' = translate(., '0123456789', '') and string-length(.) &gt; 2) or (starts-with(., 'in') and 'in' = translate(., '0123456789', '') and string-length(.) &gt; 2) or (starts-with(., 'tl') and 'tl' = translate(., '0123456789', '') and string-length(.) &gt; 2) or .='toolsht' or .='trlist' or .='unschedc' or .='unschedchk']) and not(ancestor-or-self::ata-page-block[1]/@pb-name and string(ancestor-or-self::ata-page-block[1]/@pb-name)='intro00') and not(ancestor-or-self::page-block[1]/@pb-name and string(ancestor-or-self::page-block[1]/@pb-name)='intro00') and not(ancestor::ata-page-block/@pb-name[starts-with(., 'disassy') or starts-with(., 'fault')]) and not(ancestor::page-block/@pb-name[starts-with(., 'disassy') or starts-with(., 'fault')]) and not(ancestor::book[contains(@doctype,'oh')] and ancestor::ata-page-block/@pb-name[starts-with(., 'clean')]) and not(ancestor::book[contains(@doctype,'oh')] and ancestor::page-block/@pb-name[starts-with(., 'clean')]) and not(ancestor::ata-page-block/@pb-name[starts-with(., 'mainprac')]) and not(ancestor::page-block/@pb-name[starts-with(., 'mainprac')]) and not(ancestor::book[contains(@doctype,'oh')] and ancestor::ata-page-block/@pb-name[starts-with(., 'inspect')]) and not(ancestor::book[contains(@doctype,'oh')] and ancestor::page-block/@pb-name[starts-with(., 'inspect')]) and not(ancestor::ata-page-block/@pb-name[(starts-with(., 'di') and 'di' = translate(., '0123456789', '') and string-length(.) &gt; 2) or starts-with(.,'service')]) and not(ancestor::page-block/@pb-name[(starts-with(., 'di') and 'di' = translate(., '0123456789', '') and string-length(.) &gt; 2) or starts-with(.,'service')]) and (ancestor::book[contains(@doctype,'oh')] and ancestor::ata-page-block/@pb-name[starts-with(., 'repair')])">
            <xsl:variable name="node-id" select="generate-id(.)"/>
            <xsl:variable name="from-node" select="(ancestor-or-self::ata-page-block[not(ancestor::ata-page-block)])[last()]"/>
            <xsl:variable name="num">
               <xsl:variable name="candidate-num">
                  <xsl:choose>
                     <xsl:when test="count($from-node) &gt; 0">
                        <xsl:for-each select="$from-node/descendant-or-self::*[@_gte:count-as-id='cnt__table^ata-page-block.cnt']">
                           <xsl:if test="generate-id(.) = $node-id">
                              <xsl:value-of select="position()"/>
                           </xsl:if>
                        </xsl:for-each>
                     </xsl:when>
                     <xsl:otherwise>
                        <xsl:for-each select="//*[@_gte:count-as-id='cnt__table^ata-page-block.cnt'][not(ancestor-or-self::ata-page-block)]">
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
            <xsl:variable name="offset">
               <!--Evaluate startAtXPath using the first counted element within the numbering scope as the context node-->
               <xsl:variable name="initial-num">
                  <xsl:choose>
                     <xsl:when test="count($from-node) &gt; 0">
                        <xsl:apply-templates select="($from-node/descendant-or-self::*[@_gte:count-as-id='cnt__table^ata-page-block.cnt'])[1]" mode="startat-xpath"/>
                     </xsl:when>
                     <xsl:otherwise>
                        <xsl:apply-templates select="(//*[@_gte:count-as-id='cnt__table^ata-page-block.cnt'][not(ancestor-or-self::ata-page-block)])[1]" mode="startat-xpath"/>
                     </xsl:otherwise>
                  </xsl:choose>
               </xsl:variable>
               <xsl:choose>
                  <xsl:when test="string(number($initial-num))!='NaN'">
                     <xsl:value-of select="$initial-num"/>
                  </xsl:when>
                  <xsl:otherwise>1</xsl:otherwise>
               </xsl:choose>
            </xsl:variable>
            <xsl:choose>
               <xsl:when test="string(number($num))!='NaN'">
                  <xsl:number value="$num + $offset - 1" format="1"/>
               </xsl:when>
               <xsl:otherwise>?</xsl:otherwise>
            </xsl:choose>
         </xsl:when>
         <xsl:when test="not(ancestor::book[contains(@doctype,'cir') or contains(@doctype,'em') or contains(@doctype,'tmm')]) and not(ancestor::book[contains(@doctype,'oh')] and ancestor::ata-page-block/@pb-name[.='service']) and not(ancestor::book[contains(@doctype,'oh')] and ancestor::page-block/@pb-name[.='service']) and not(ancestor::ata-page-block/@pb-name[.='00awl' or .='00intro' or .='airlim' or .='awl' or .='awlror' or .='chapsect' or .='consume' or .='d-and-o' or .='frontmatte' or .='howtouse' or .='00howtouse' or .='intro' or .='nut_option' or .='oplimits' or .='sblist' or .='schedchk' or .='spectool' or .='timelim' or .='title-page']) and not(ancestor::page-block/@pb-name[.='00awl' or .='00intro' or .='airlim' or .='awl' or .='awlror' or .='chapsect' or .='consume' or .='d-and-o' or .='frontmatte' or .='howtouse' or .='00howtouse' or .='intro' or .='nut_option' or .='oplimits' or .='sblist' or .='schedchk' or .='spectool' or .='timelim' or .='title-page']) and not(ancestor::ata-page-block/@pb-name[(starts-with(., 'do') and 'do' = translate(., '0123456789', '') and string-length(.) &gt; 2) or (starts-with(., 'in') and 'in' = translate(., '0123456789', '') and string-length(.) &gt; 2) or (starts-with(., 'tl') and 'tl' = translate(., '0123456789', '') and string-length(.) &gt; 2) or .='toolsht' or .='trlist' or .='unschedc' or .='unschedchk']) and not(ancestor::page-block/@pb-name[(starts-with(., 'do') and 'do' = translate(., '0123456789', '') and string-length(.) &gt; 2) or (starts-with(., 'in') and 'in' = translate(., '0123456789', '') and string-length(.) &gt; 2) or (starts-with(., 'tl') and 'tl' = translate(., '0123456789', '') and string-length(.) &gt; 2) or .='toolsht' or .='trlist' or .='unschedc' or .='unschedchk']) and not(ancestor-or-self::ata-page-block[1]/@pb-name and string(ancestor-or-self::ata-page-block[1]/@pb-name)='intro00') and not(ancestor-or-self::page-block[1]/@pb-name and string(ancestor-or-self::page-block[1]/@pb-name)='intro00') and not(ancestor::ata-page-block/@pb-name[starts-with(., 'disassy') or starts-with(., 'fault')]) and not(ancestor::page-block/@pb-name[starts-with(., 'disassy') or starts-with(., 'fault')]) and not(ancestor::book[contains(@doctype,'oh')] and ancestor::ata-page-block/@pb-name[starts-with(., 'clean')]) and not(ancestor::book[contains(@doctype,'oh')] and ancestor::page-block/@pb-name[starts-with(., 'clean')]) and not(ancestor::ata-page-block/@pb-name[starts-with(., 'mainprac')]) and not(ancestor::page-block/@pb-name[starts-with(., 'mainprac')]) and not(ancestor::book[contains(@doctype,'oh')] and ancestor::ata-page-block/@pb-name[starts-with(., 'inspect')]) and not(ancestor::book[contains(@doctype,'oh')] and ancestor::page-block/@pb-name[starts-with(., 'inspect')]) and not(ancestor::ata-page-block/@pb-name[(starts-with(., 'di') and 'di' = translate(., '0123456789', '') and string-length(.) &gt; 2) or starts-with(.,'service')]) and (ancestor::page-block/@pb-name[(starts-with(., 'di') and 'di' = translate(., '0123456789', '') and string-length(.) &gt; 2) or starts-with(.,'service')])">
            <xsl:variable name="node-id" select="generate-id(.)"/>
            <xsl:variable name="from-node" select="(ancestor-or-self::page-block[not(ancestor::page-block)])[last()]"/>
            <xsl:variable name="num">
               <xsl:variable name="candidate-num">
                  <xsl:choose>
                     <xsl:when test="count($from-node) &gt; 0">
                        <xsl:for-each select="$from-node/descendant-or-self::*[@_gte:count-as-id='cnt__table^page-block.cnt']">
                           <xsl:if test="generate-id(.) = $node-id">
                              <xsl:value-of select="position()"/>
                           </xsl:if>
                        </xsl:for-each>
                     </xsl:when>
                     <xsl:otherwise>
                        <xsl:for-each select="//*[@_gte:count-as-id='cnt__table^page-block.cnt'][not(ancestor-or-self::page-block)]">
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
            <xsl:variable name="offset">
               <!--Evaluate startAtXPath using the first counted element within the numbering scope as the context node-->
               <xsl:variable name="initial-num">
                  <xsl:choose>
                     <xsl:when test="count($from-node) &gt; 0">
                        <xsl:apply-templates select="($from-node/descendant-or-self::*[@_gte:count-as-id='cnt__table^page-block.cnt'])[1]" mode="startat-xpath"/>
                     </xsl:when>
                     <xsl:otherwise>
                        <xsl:apply-templates select="(//*[@_gte:count-as-id='cnt__table^page-block.cnt'][not(ancestor-or-self::page-block)])[1]" mode="startat-xpath"/>
                     </xsl:otherwise>
                  </xsl:choose>
               </xsl:variable>
               <xsl:choose>
                  <xsl:when test="string(number($initial-num))!='NaN'">
                     <xsl:value-of select="$initial-num"/>
                  </xsl:when>
                  <xsl:otherwise>1</xsl:otherwise>
               </xsl:choose>
            </xsl:variable>
            <xsl:choose>
               <xsl:when test="string(number($num))!='NaN'">
                  <xsl:number value="$num + $offset - 1" format="1"/>
               </xsl:when>
               <xsl:otherwise>?</xsl:otherwise>
            </xsl:choose>
         </xsl:when>
         <xsl:when test="not(ancestor::book[contains(@doctype,'cir') or contains(@doctype,'em') or contains(@doctype,'tmm')]) and not(ancestor::book[contains(@doctype,'oh')] and ancestor::ata-page-block/@pb-name[.='service']) and not(ancestor::book[contains(@doctype,'oh')] and ancestor::page-block/@pb-name[.='service']) and not(ancestor::ata-page-block/@pb-name[.='00awl' or .='00intro' or .='airlim' or .='awl' or .='awlror' or .='chapsect' or .='consume' or .='d-and-o' or .='frontmatte' or .='howtouse' or .='00howtouse' or .='intro' or .='nut_option' or .='oplimits' or .='sblist' or .='schedchk' or .='spectool' or .='timelim' or .='title-page']) and not(ancestor::page-block/@pb-name[.='00awl' or .='00intro' or .='airlim' or .='awl' or .='awlror' or .='chapsect' or .='consume' or .='d-and-o' or .='frontmatte' or .='howtouse' or .='00howtouse' or .='intro' or .='nut_option' or .='oplimits' or .='sblist' or .='schedchk' or .='spectool' or .='timelim' or .='title-page']) and not(ancestor::ata-page-block/@pb-name[(starts-with(., 'do') and 'do' = translate(., '0123456789', '') and string-length(.) &gt; 2) or (starts-with(., 'in') and 'in' = translate(., '0123456789', '') and string-length(.) &gt; 2) or (starts-with(., 'tl') and 'tl' = translate(., '0123456789', '') and string-length(.) &gt; 2) or .='toolsht' or .='trlist' or .='unschedc' or .='unschedchk']) and not(ancestor::page-block/@pb-name[(starts-with(., 'do') and 'do' = translate(., '0123456789', '') and string-length(.) &gt; 2) or (starts-with(., 'in') and 'in' = translate(., '0123456789', '') and string-length(.) &gt; 2) or (starts-with(., 'tl') and 'tl' = translate(., '0123456789', '') and string-length(.) &gt; 2) or .='toolsht' or .='trlist' or .='unschedc' or .='unschedchk']) and not(ancestor-or-self::ata-page-block[1]/@pb-name and string(ancestor-or-self::ata-page-block[1]/@pb-name)='intro00') and not(ancestor-or-self::page-block[1]/@pb-name and string(ancestor-or-self::page-block[1]/@pb-name)='intro00') and not(ancestor::ata-page-block/@pb-name[starts-with(., 'disassy') or starts-with(., 'fault')]) and not(ancestor::page-block/@pb-name[starts-with(., 'disassy') or starts-with(., 'fault')]) and not(ancestor::book[contains(@doctype,'oh')] and ancestor::ata-page-block/@pb-name[starts-with(., 'clean')]) and not(ancestor::book[contains(@doctype,'oh')] and ancestor::page-block/@pb-name[starts-with(., 'clean')]) and not(ancestor::ata-page-block/@pb-name[starts-with(., 'mainprac')]) and not(ancestor::page-block/@pb-name[starts-with(., 'mainprac')]) and not(ancestor::book[contains(@doctype,'oh')] and ancestor::ata-page-block/@pb-name[starts-with(., 'inspect')]) and not(ancestor::book[contains(@doctype,'oh')] and ancestor::page-block/@pb-name[starts-with(., 'inspect')]) and (ancestor::ata-page-block/@pb-name[(starts-with(., 'di') and 'di' = translate(., '0123456789', '') and string-length(.) &gt; 2) or starts-with(.,'service')])">
            <xsl:variable name="node-id" select="generate-id(.)"/>
            <xsl:variable name="from-node" select="(ancestor-or-self::ata-page-block[not(ancestor::ata-page-block)])[last()]"/>
            <xsl:variable name="num">
               <xsl:variable name="candidate-num">
                  <xsl:choose>
                     <xsl:when test="count($from-node) &gt; 0">
                        <xsl:for-each select="$from-node/descendant-or-self::*[@_gte:count-as-id='cnt__table^ata-page-block.cnt']">
                           <xsl:if test="generate-id(.) = $node-id">
                              <xsl:value-of select="position()"/>
                           </xsl:if>
                        </xsl:for-each>
                     </xsl:when>
                     <xsl:otherwise>
                        <xsl:for-each select="//*[@_gte:count-as-id='cnt__table^ata-page-block.cnt'][not(ancestor-or-self::ata-page-block)]">
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
            <xsl:variable name="offset">
               <!--Evaluate startAtXPath using the first counted element within the numbering scope as the context node-->
               <xsl:variable name="initial-num">
                  <xsl:choose>
                     <xsl:when test="count($from-node) &gt; 0">
                        <xsl:apply-templates select="($from-node/descendant-or-self::*[@_gte:count-as-id='cnt__table^ata-page-block.cnt'])[1]" mode="startat-xpath"/>
                     </xsl:when>
                     <xsl:otherwise>
                        <xsl:apply-templates select="(//*[@_gte:count-as-id='cnt__table^ata-page-block.cnt'][not(ancestor-or-self::ata-page-block)])[1]" mode="startat-xpath"/>
                     </xsl:otherwise>
                  </xsl:choose>
               </xsl:variable>
               <xsl:choose>
                  <xsl:when test="string(number($initial-num))!='NaN'">
                     <xsl:value-of select="$initial-num"/>
                  </xsl:when>
                  <xsl:otherwise>1</xsl:otherwise>
               </xsl:choose>
            </xsl:variable>
            <xsl:choose>
               <xsl:when test="string(number($num))!='NaN'">
                  <xsl:number value="$num + $offset - 1" format="1"/>
               </xsl:when>
               <xsl:otherwise>?</xsl:otherwise>
            </xsl:choose>
         </xsl:when>
         <xsl:when test="not(ancestor::book[contains(@doctype,'cir') or contains(@doctype,'em') or contains(@doctype,'tmm')]) and not(ancestor::book[contains(@doctype,'oh')] and ancestor::ata-page-block/@pb-name[.='service']) and not(ancestor::book[contains(@doctype,'oh')] and ancestor::page-block/@pb-name[.='service']) and not(ancestor::ata-page-block/@pb-name[.='00awl' or .='00intro' or .='airlim' or .='awl' or .='awlror' or .='chapsect' or .='consume' or .='d-and-o' or .='frontmatte' or .='howtouse' or .='00howtouse' or .='intro' or .='nut_option' or .='oplimits' or .='sblist' or .='schedchk' or .='spectool' or .='timelim' or .='title-page']) and not(ancestor::page-block/@pb-name[.='00awl' or .='00intro' or .='airlim' or .='awl' or .='awlror' or .='chapsect' or .='consume' or .='d-and-o' or .='frontmatte' or .='howtouse' or .='00howtouse' or .='intro' or .='nut_option' or .='oplimits' or .='sblist' or .='schedchk' or .='spectool' or .='timelim' or .='title-page']) and not(ancestor::ata-page-block/@pb-name[(starts-with(., 'do') and 'do' = translate(., '0123456789', '') and string-length(.) &gt; 2) or (starts-with(., 'in') and 'in' = translate(., '0123456789', '') and string-length(.) &gt; 2) or (starts-with(., 'tl') and 'tl' = translate(., '0123456789', '') and string-length(.) &gt; 2) or .='toolsht' or .='trlist' or .='unschedc' or .='unschedchk']) and not(ancestor::page-block/@pb-name[(starts-with(., 'do') and 'do' = translate(., '0123456789', '') and string-length(.) &gt; 2) or (starts-with(., 'in') and 'in' = translate(., '0123456789', '') and string-length(.) &gt; 2) or (starts-with(., 'tl') and 'tl' = translate(., '0123456789', '') and string-length(.) &gt; 2) or .='toolsht' or .='trlist' or .='unschedc' or .='unschedchk']) and not(ancestor-or-self::ata-page-block[1]/@pb-name and string(ancestor-or-self::ata-page-block[1]/@pb-name)='intro00') and not(ancestor-or-self::page-block[1]/@pb-name and string(ancestor-or-self::page-block[1]/@pb-name)='intro00') and not(ancestor::ata-page-block/@pb-name[starts-with(., 'disassy') or starts-with(., 'fault')]) and not(ancestor::page-block/@pb-name[starts-with(., 'disassy') or starts-with(., 'fault')]) and not(ancestor::book[contains(@doctype,'oh')] and ancestor::ata-page-block/@pb-name[starts-with(., 'clean')]) and not(ancestor::book[contains(@doctype,'oh')] and ancestor::page-block/@pb-name[starts-with(., 'clean')]) and not(ancestor::ata-page-block/@pb-name[starts-with(., 'mainprac')]) and not(ancestor::page-block/@pb-name[starts-with(., 'mainprac')]) and not(ancestor::book[contains(@doctype,'oh')] and ancestor::ata-page-block/@pb-name[starts-with(., 'inspect')]) and (ancestor::book[contains(@doctype,'oh')] and ancestor::page-block/@pb-name[starts-with(., 'inspect')])">
            <xsl:variable name="node-id" select="generate-id(.)"/>
            <xsl:variable name="from-node" select="(ancestor-or-self::page-block[not(ancestor::page-block)])[last()]"/>
            <xsl:variable name="num">
               <xsl:variable name="candidate-num">
                  <xsl:choose>
                     <xsl:when test="count($from-node) &gt; 0">
                        <xsl:for-each select="$from-node/descendant-or-self::*[@_gte:count-as-id='cnt__table^page-block.cnt']">
                           <xsl:if test="generate-id(.) = $node-id">
                              <xsl:value-of select="position()"/>
                           </xsl:if>
                        </xsl:for-each>
                     </xsl:when>
                     <xsl:otherwise>
                        <xsl:for-each select="//*[@_gte:count-as-id='cnt__table^page-block.cnt'][not(ancestor-or-self::page-block)]">
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
            <xsl:variable name="offset">
               <!--Evaluate startAtXPath using the first counted element within the numbering scope as the context node-->
               <xsl:variable name="initial-num">
                  <xsl:choose>
                     <xsl:when test="count($from-node) &gt; 0">
                        <xsl:apply-templates select="($from-node/descendant-or-self::*[@_gte:count-as-id='cnt__table^page-block.cnt'])[1]" mode="startat-xpath"/>
                     </xsl:when>
                     <xsl:otherwise>
                        <xsl:apply-templates select="(//*[@_gte:count-as-id='cnt__table^page-block.cnt'][not(ancestor-or-self::page-block)])[1]" mode="startat-xpath"/>
                     </xsl:otherwise>
                  </xsl:choose>
               </xsl:variable>
               <xsl:choose>
                  <xsl:when test="string(number($initial-num))!='NaN'">
                     <xsl:value-of select="$initial-num"/>
                  </xsl:when>
                  <xsl:otherwise>1</xsl:otherwise>
               </xsl:choose>
            </xsl:variable>
            <xsl:choose>
               <xsl:when test="string(number($num))!='NaN'">
                  <xsl:number value="$num + $offset - 1" format="1"/>
               </xsl:when>
               <xsl:otherwise>?</xsl:otherwise>
            </xsl:choose>
         </xsl:when>
         <xsl:when test="not(ancestor::book[contains(@doctype,'cir') or contains(@doctype,'em') or contains(@doctype,'tmm')]) and not(ancestor::book[contains(@doctype,'oh')] and ancestor::ata-page-block/@pb-name[.='service']) and not(ancestor::book[contains(@doctype,'oh')] and ancestor::page-block/@pb-name[.='service']) and not(ancestor::ata-page-block/@pb-name[.='00awl' or .='00intro' or .='airlim' or .='awl' or .='awlror' or .='chapsect' or .='consume' or .='d-and-o' or .='frontmatte' or .='howtouse' or .='00howtouse' or .='intro' or .='nut_option' or .='oplimits' or .='sblist' or .='schedchk' or .='spectool' or .='timelim' or .='title-page']) and not(ancestor::page-block/@pb-name[.='00awl' or .='00intro' or .='airlim' or .='awl' or .='awlror' or .='chapsect' or .='consume' or .='d-and-o' or .='frontmatte' or .='howtouse' or .='00howtouse' or .='intro' or .='nut_option' or .='oplimits' or .='sblist' or .='schedchk' or .='spectool' or .='timelim' or .='title-page']) and not(ancestor::ata-page-block/@pb-name[(starts-with(., 'do') and 'do' = translate(., '0123456789', '') and string-length(.) &gt; 2) or (starts-with(., 'in') and 'in' = translate(., '0123456789', '') and string-length(.) &gt; 2) or (starts-with(., 'tl') and 'tl' = translate(., '0123456789', '') and string-length(.) &gt; 2) or .='toolsht' or .='trlist' or .='unschedc' or .='unschedchk']) and not(ancestor::page-block/@pb-name[(starts-with(., 'do') and 'do' = translate(., '0123456789', '') and string-length(.) &gt; 2) or (starts-with(., 'in') and 'in' = translate(., '0123456789', '') and string-length(.) &gt; 2) or (starts-with(., 'tl') and 'tl' = translate(., '0123456789', '') and string-length(.) &gt; 2) or .='toolsht' or .='trlist' or .='unschedc' or .='unschedchk']) and not(ancestor-or-self::ata-page-block[1]/@pb-name and string(ancestor-or-self::ata-page-block[1]/@pb-name)='intro00') and not(ancestor-or-self::page-block[1]/@pb-name and string(ancestor-or-self::page-block[1]/@pb-name)='intro00') and not(ancestor::ata-page-block/@pb-name[starts-with(., 'disassy') or starts-with(., 'fault')]) and not(ancestor::page-block/@pb-name[starts-with(., 'disassy') or starts-with(., 'fault')]) and not(ancestor::book[contains(@doctype,'oh')] and ancestor::ata-page-block/@pb-name[starts-with(., 'clean')]) and not(ancestor::book[contains(@doctype,'oh')] and ancestor::page-block/@pb-name[starts-with(., 'clean')]) and not(ancestor::ata-page-block/@pb-name[starts-with(., 'mainprac')]) and not(ancestor::page-block/@pb-name[starts-with(., 'mainprac')]) and (ancestor::book[contains(@doctype,'oh')] and ancestor::ata-page-block/@pb-name[starts-with(., 'inspect')])">
            <xsl:variable name="node-id" select="generate-id(.)"/>
            <xsl:variable name="from-node" select="(ancestor-or-self::ata-page-block[not(ancestor::ata-page-block)])[last()]"/>
            <xsl:variable name="num">
               <xsl:variable name="candidate-num">
                  <xsl:choose>
                     <xsl:when test="count($from-node) &gt; 0">
                        <xsl:for-each select="$from-node/descendant-or-self::*[@_gte:count-as-id='cnt__table^ata-page-block.cnt']">
                           <xsl:if test="generate-id(.) = $node-id">
                              <xsl:value-of select="position()"/>
                           </xsl:if>
                        </xsl:for-each>
                     </xsl:when>
                     <xsl:otherwise>
                        <xsl:for-each select="//*[@_gte:count-as-id='cnt__table^ata-page-block.cnt'][not(ancestor-or-self::ata-page-block)]">
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
            <xsl:variable name="offset">
               <!--Evaluate startAtXPath using the first counted element within the numbering scope as the context node-->
               <xsl:variable name="initial-num">
                  <xsl:choose>
                     <xsl:when test="count($from-node) &gt; 0">
                        <xsl:apply-templates select="($from-node/descendant-or-self::*[@_gte:count-as-id='cnt__table^ata-page-block.cnt'])[1]" mode="startat-xpath"/>
                     </xsl:when>
                     <xsl:otherwise>
                        <xsl:apply-templates select="(//*[@_gte:count-as-id='cnt__table^ata-page-block.cnt'][not(ancestor-or-self::ata-page-block)])[1]" mode="startat-xpath"/>
                     </xsl:otherwise>
                  </xsl:choose>
               </xsl:variable>
               <xsl:choose>
                  <xsl:when test="string(number($initial-num))!='NaN'">
                     <xsl:value-of select="$initial-num"/>
                  </xsl:when>
                  <xsl:otherwise>1</xsl:otherwise>
               </xsl:choose>
            </xsl:variable>
            <xsl:choose>
               <xsl:when test="string(number($num))!='NaN'">
                  <xsl:number value="$num + $offset - 1" format="1"/>
               </xsl:when>
               <xsl:otherwise>?</xsl:otherwise>
            </xsl:choose>
         </xsl:when>
         <xsl:when test="not(ancestor::book[contains(@doctype,'cir') or contains(@doctype,'em') or contains(@doctype,'tmm')]) and not(ancestor::book[contains(@doctype,'oh')] and ancestor::ata-page-block/@pb-name[.='service']) and not(ancestor::book[contains(@doctype,'oh')] and ancestor::page-block/@pb-name[.='service']) and not(ancestor::ata-page-block/@pb-name[.='00awl' or .='00intro' or .='airlim' or .='awl' or .='awlror' or .='chapsect' or .='consume' or .='d-and-o' or .='frontmatte' or .='howtouse' or .='00howtouse' or .='intro' or .='nut_option' or .='oplimits' or .='sblist' or .='schedchk' or .='spectool' or .='timelim' or .='title-page']) and not(ancestor::page-block/@pb-name[.='00awl' or .='00intro' or .='airlim' or .='awl' or .='awlror' or .='chapsect' or .='consume' or .='d-and-o' or .='frontmatte' or .='howtouse' or .='00howtouse' or .='intro' or .='nut_option' or .='oplimits' or .='sblist' or .='schedchk' or .='spectool' or .='timelim' or .='title-page']) and not(ancestor::ata-page-block/@pb-name[(starts-with(., 'do') and 'do' = translate(., '0123456789', '') and string-length(.) &gt; 2) or (starts-with(., 'in') and 'in' = translate(., '0123456789', '') and string-length(.) &gt; 2) or (starts-with(., 'tl') and 'tl' = translate(., '0123456789', '') and string-length(.) &gt; 2) or .='toolsht' or .='trlist' or .='unschedc' or .='unschedchk']) and not(ancestor::page-block/@pb-name[(starts-with(., 'do') and 'do' = translate(., '0123456789', '') and string-length(.) &gt; 2) or (starts-with(., 'in') and 'in' = translate(., '0123456789', '') and string-length(.) &gt; 2) or (starts-with(., 'tl') and 'tl' = translate(., '0123456789', '') and string-length(.) &gt; 2) or .='toolsht' or .='trlist' or .='unschedc' or .='unschedchk']) and not(ancestor-or-self::ata-page-block[1]/@pb-name and string(ancestor-or-self::ata-page-block[1]/@pb-name)='intro00') and not(ancestor-or-self::page-block[1]/@pb-name and string(ancestor-or-self::page-block[1]/@pb-name)='intro00') and not(ancestor::ata-page-block/@pb-name[starts-with(., 'disassy') or starts-with(., 'fault')]) and not(ancestor::page-block/@pb-name[starts-with(., 'disassy') or starts-with(., 'fault')]) and not(ancestor::book[contains(@doctype,'oh')] and ancestor::ata-page-block/@pb-name[starts-with(., 'clean')]) and not(ancestor::book[contains(@doctype,'oh')] and ancestor::page-block/@pb-name[starts-with(., 'clean')]) and not(ancestor::ata-page-block/@pb-name[starts-with(., 'mainprac')]) and (ancestor::page-block/@pb-name[starts-with(., 'mainprac')])">
            <xsl:variable name="node-id" select="generate-id(.)"/>
            <xsl:variable name="from-node" select="(ancestor-or-self::page-block[not(ancestor::page-block)])[last()]"/>
            <xsl:variable name="num">
               <xsl:variable name="candidate-num">
                  <xsl:choose>
                     <xsl:when test="count($from-node) &gt; 0">
                        <xsl:for-each select="$from-node/descendant-or-self::*[@_gte:count-as-id='cnt__table^page-block.cnt']">
                           <xsl:if test="generate-id(.) = $node-id">
                              <xsl:value-of select="position()"/>
                           </xsl:if>
                        </xsl:for-each>
                     </xsl:when>
                     <xsl:otherwise>
                        <xsl:for-each select="//*[@_gte:count-as-id='cnt__table^page-block.cnt'][not(ancestor-or-self::page-block)]">
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
            <xsl:variable name="offset">
               <!--Evaluate startAtXPath using the first counted element within the numbering scope as the context node-->
               <xsl:variable name="initial-num">
                  <xsl:choose>
                     <xsl:when test="count($from-node) &gt; 0">
                        <xsl:apply-templates select="($from-node/descendant-or-self::*[@_gte:count-as-id='cnt__table^page-block.cnt'])[1]" mode="startat-xpath"/>
                     </xsl:when>
                     <xsl:otherwise>
                        <xsl:apply-templates select="(//*[@_gte:count-as-id='cnt__table^page-block.cnt'][not(ancestor-or-self::page-block)])[1]" mode="startat-xpath"/>
                     </xsl:otherwise>
                  </xsl:choose>
               </xsl:variable>
               <xsl:choose>
                  <xsl:when test="string(number($initial-num))!='NaN'">
                     <xsl:value-of select="$initial-num"/>
                  </xsl:when>
                  <xsl:otherwise>1</xsl:otherwise>
               </xsl:choose>
            </xsl:variable>
            <xsl:choose>
               <xsl:when test="string(number($num))!='NaN'">
                  <xsl:number value="$num + $offset - 1" format="1"/>
               </xsl:when>
               <xsl:otherwise>?</xsl:otherwise>
            </xsl:choose>
         </xsl:when>
         <xsl:when test="not(ancestor::book[contains(@doctype,'cir') or contains(@doctype,'em') or contains(@doctype,'tmm')]) and not(ancestor::book[contains(@doctype,'oh')] and ancestor::ata-page-block/@pb-name[.='service']) and not(ancestor::book[contains(@doctype,'oh')] and ancestor::page-block/@pb-name[.='service']) and not(ancestor::ata-page-block/@pb-name[.='00awl' or .='00intro' or .='airlim' or .='awl' or .='awlror' or .='chapsect' or .='consume' or .='d-and-o' or .='frontmatte' or .='howtouse' or .='00howtouse' or .='intro' or .='nut_option' or .='oplimits' or .='sblist' or .='schedchk' or .='spectool' or .='timelim' or .='title-page']) and not(ancestor::page-block/@pb-name[.='00awl' or .='00intro' or .='airlim' or .='awl' or .='awlror' or .='chapsect' or .='consume' or .='d-and-o' or .='frontmatte' or .='howtouse' or .='00howtouse' or .='intro' or .='nut_option' or .='oplimits' or .='sblist' or .='schedchk' or .='spectool' or .='timelim' or .='title-page']) and not(ancestor::ata-page-block/@pb-name[(starts-with(., 'do') and 'do' = translate(., '0123456789', '') and string-length(.) &gt; 2) or (starts-with(., 'in') and 'in' = translate(., '0123456789', '') and string-length(.) &gt; 2) or (starts-with(., 'tl') and 'tl' = translate(., '0123456789', '') and string-length(.) &gt; 2) or .='toolsht' or .='trlist' or .='unschedc' or .='unschedchk']) and not(ancestor::page-block/@pb-name[(starts-with(., 'do') and 'do' = translate(., '0123456789', '') and string-length(.) &gt; 2) or (starts-with(., 'in') and 'in' = translate(., '0123456789', '') and string-length(.) &gt; 2) or (starts-with(., 'tl') and 'tl' = translate(., '0123456789', '') and string-length(.) &gt; 2) or .='toolsht' or .='trlist' or .='unschedc' or .='unschedchk']) and not(ancestor-or-self::ata-page-block[1]/@pb-name and string(ancestor-or-self::ata-page-block[1]/@pb-name)='intro00') and not(ancestor-or-self::page-block[1]/@pb-name and string(ancestor-or-self::page-block[1]/@pb-name)='intro00') and not(ancestor::ata-page-block/@pb-name[starts-with(., 'disassy') or starts-with(., 'fault')]) and not(ancestor::page-block/@pb-name[starts-with(., 'disassy') or starts-with(., 'fault')]) and not(ancestor::book[contains(@doctype,'oh')] and ancestor::ata-page-block/@pb-name[starts-with(., 'clean')]) and not(ancestor::book[contains(@doctype,'oh')] and ancestor::page-block/@pb-name[starts-with(., 'clean')]) and (ancestor::ata-page-block/@pb-name[starts-with(., 'mainprac')])">
            <xsl:variable name="node-id" select="generate-id(.)"/>
            <xsl:variable name="from-node" select="(ancestor-or-self::ata-page-block[not(ancestor::ata-page-block)])[last()]"/>
            <xsl:variable name="num">
               <xsl:variable name="candidate-num">
                  <xsl:choose>
                     <xsl:when test="count($from-node) &gt; 0">
                        <xsl:for-each select="$from-node/descendant-or-self::*[@_gte:count-as-id='cnt__table^ata-page-block.cnt']">
                           <xsl:if test="generate-id(.) = $node-id">
                              <xsl:value-of select="position()"/>
                           </xsl:if>
                        </xsl:for-each>
                     </xsl:when>
                     <xsl:otherwise>
                        <xsl:for-each select="//*[@_gte:count-as-id='cnt__table^ata-page-block.cnt'][not(ancestor-or-self::ata-page-block)]">
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
            <xsl:variable name="offset">
               <!--Evaluate startAtXPath using the first counted element within the numbering scope as the context node-->
               <xsl:variable name="initial-num">
                  <xsl:choose>
                     <xsl:when test="count($from-node) &gt; 0">
                        <xsl:apply-templates select="($from-node/descendant-or-self::*[@_gte:count-as-id='cnt__table^ata-page-block.cnt'])[1]" mode="startat-xpath"/>
                     </xsl:when>
                     <xsl:otherwise>
                        <xsl:apply-templates select="(//*[@_gte:count-as-id='cnt__table^ata-page-block.cnt'][not(ancestor-or-self::ata-page-block)])[1]" mode="startat-xpath"/>
                     </xsl:otherwise>
                  </xsl:choose>
               </xsl:variable>
               <xsl:choose>
                  <xsl:when test="string(number($initial-num))!='NaN'">
                     <xsl:value-of select="$initial-num"/>
                  </xsl:when>
                  <xsl:otherwise>1</xsl:otherwise>
               </xsl:choose>
            </xsl:variable>
            <xsl:choose>
               <xsl:when test="string(number($num))!='NaN'">
                  <xsl:number value="$num + $offset - 1" format="1"/>
               </xsl:when>
               <xsl:otherwise>?</xsl:otherwise>
            </xsl:choose>
         </xsl:when>
         <xsl:when test="not(ancestor::book[contains(@doctype,'cir') or contains(@doctype,'em') or contains(@doctype,'tmm')]) and not(ancestor::book[contains(@doctype,'oh')] and ancestor::ata-page-block/@pb-name[.='service']) and not(ancestor::book[contains(@doctype,'oh')] and ancestor::page-block/@pb-name[.='service']) and not(ancestor::ata-page-block/@pb-name[.='00awl' or .='00intro' or .='airlim' or .='awl' or .='awlror' or .='chapsect' or .='consume' or .='d-and-o' or .='frontmatte' or .='howtouse' or .='00howtouse' or .='intro' or .='nut_option' or .='oplimits' or .='sblist' or .='schedchk' or .='spectool' or .='timelim' or .='title-page']) and not(ancestor::page-block/@pb-name[.='00awl' or .='00intro' or .='airlim' or .='awl' or .='awlror' or .='chapsect' or .='consume' or .='d-and-o' or .='frontmatte' or .='howtouse' or .='00howtouse' or .='intro' or .='nut_option' or .='oplimits' or .='sblist' or .='schedchk' or .='spectool' or .='timelim' or .='title-page']) and not(ancestor::ata-page-block/@pb-name[(starts-with(., 'do') and 'do' = translate(., '0123456789', '') and string-length(.) &gt; 2) or (starts-with(., 'in') and 'in' = translate(., '0123456789', '') and string-length(.) &gt; 2) or (starts-with(., 'tl') and 'tl' = translate(., '0123456789', '') and string-length(.) &gt; 2) or .='toolsht' or .='trlist' or .='unschedc' or .='unschedchk']) and not(ancestor::page-block/@pb-name[(starts-with(., 'do') and 'do' = translate(., '0123456789', '') and string-length(.) &gt; 2) or (starts-with(., 'in') and 'in' = translate(., '0123456789', '') and string-length(.) &gt; 2) or (starts-with(., 'tl') and 'tl' = translate(., '0123456789', '') and string-length(.) &gt; 2) or .='toolsht' or .='trlist' or .='unschedc' or .='unschedchk']) and not(ancestor-or-self::ata-page-block[1]/@pb-name and string(ancestor-or-self::ata-page-block[1]/@pb-name)='intro00') and not(ancestor-or-self::page-block[1]/@pb-name and string(ancestor-or-self::page-block[1]/@pb-name)='intro00') and not(ancestor::ata-page-block/@pb-name[starts-with(., 'disassy') or starts-with(., 'fault')]) and not(ancestor::page-block/@pb-name[starts-with(., 'disassy') or starts-with(., 'fault')]) and not(ancestor::book[contains(@doctype,'oh')] and ancestor::ata-page-block/@pb-name[starts-with(., 'clean')]) and (ancestor::book[contains(@doctype,'oh')] and ancestor::page-block/@pb-name[starts-with(., 'clean')])">
            <xsl:variable name="node-id" select="generate-id(.)"/>
            <xsl:variable name="from-node" select="(ancestor-or-self::page-block[not(ancestor::page-block)])[last()]"/>
            <xsl:variable name="num">
               <xsl:variable name="candidate-num">
                  <xsl:choose>
                     <xsl:when test="count($from-node) &gt; 0">
                        <xsl:for-each select="$from-node/descendant-or-self::*[@_gte:count-as-id='cnt__table^page-block.cnt']">
                           <xsl:if test="generate-id(.) = $node-id">
                              <xsl:value-of select="position()"/>
                           </xsl:if>
                        </xsl:for-each>
                     </xsl:when>
                     <xsl:otherwise>
                        <xsl:for-each select="//*[@_gte:count-as-id='cnt__table^page-block.cnt'][not(ancestor-or-self::page-block)]">
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
            <xsl:variable name="offset">
               <!--Evaluate startAtXPath using the first counted element within the numbering scope as the context node-->
               <xsl:variable name="initial-num">
                  <xsl:choose>
                     <xsl:when test="count($from-node) &gt; 0">
                        <xsl:apply-templates select="($from-node/descendant-or-self::*[@_gte:count-as-id='cnt__table^page-block.cnt'])[1]" mode="startat-xpath"/>
                     </xsl:when>
                     <xsl:otherwise>
                        <xsl:apply-templates select="(//*[@_gte:count-as-id='cnt__table^page-block.cnt'][not(ancestor-or-self::page-block)])[1]" mode="startat-xpath"/>
                     </xsl:otherwise>
                  </xsl:choose>
               </xsl:variable>
               <xsl:choose>
                  <xsl:when test="string(number($initial-num))!='NaN'">
                     <xsl:value-of select="$initial-num"/>
                  </xsl:when>
                  <xsl:otherwise>1</xsl:otherwise>
               </xsl:choose>
            </xsl:variable>
            <xsl:choose>
               <xsl:when test="string(number($num))!='NaN'">
                  <xsl:number value="$num + $offset - 1" format="1"/>
               </xsl:when>
               <xsl:otherwise>?</xsl:otherwise>
            </xsl:choose>
         </xsl:when>
         <xsl:when test="not(ancestor::book[contains(@doctype,'cir') or contains(@doctype,'em') or contains(@doctype,'tmm')]) and not(ancestor::book[contains(@doctype,'oh')] and ancestor::ata-page-block/@pb-name[.='service']) and not(ancestor::book[contains(@doctype,'oh')] and ancestor::page-block/@pb-name[.='service']) and not(ancestor::ata-page-block/@pb-name[.='00awl' or .='00intro' or .='airlim' or .='awl' or .='awlror' or .='chapsect' or .='consume' or .='d-and-o' or .='frontmatte' or .='howtouse' or .='00howtouse' or .='intro' or .='nut_option' or .='oplimits' or .='sblist' or .='schedchk' or .='spectool' or .='timelim' or .='title-page']) and not(ancestor::page-block/@pb-name[.='00awl' or .='00intro' or .='airlim' or .='awl' or .='awlror' or .='chapsect' or .='consume' or .='d-and-o' or .='frontmatte' or .='howtouse' or .='00howtouse' or .='intro' or .='nut_option' or .='oplimits' or .='sblist' or .='schedchk' or .='spectool' or .='timelim' or .='title-page']) and not(ancestor::ata-page-block/@pb-name[(starts-with(., 'do') and 'do' = translate(., '0123456789', '') and string-length(.) &gt; 2) or (starts-with(., 'in') and 'in' = translate(., '0123456789', '') and string-length(.) &gt; 2) or (starts-with(., 'tl') and 'tl' = translate(., '0123456789', '') and string-length(.) &gt; 2) or .='toolsht' or .='trlist' or .='unschedc' or .='unschedchk']) and not(ancestor::page-block/@pb-name[(starts-with(., 'do') and 'do' = translate(., '0123456789', '') and string-length(.) &gt; 2) or (starts-with(., 'in') and 'in' = translate(., '0123456789', '') and string-length(.) &gt; 2) or (starts-with(., 'tl') and 'tl' = translate(., '0123456789', '') and string-length(.) &gt; 2) or .='toolsht' or .='trlist' or .='unschedc' or .='unschedchk']) and not(ancestor-or-self::ata-page-block[1]/@pb-name and string(ancestor-or-self::ata-page-block[1]/@pb-name)='intro00') and not(ancestor-or-self::page-block[1]/@pb-name and string(ancestor-or-self::page-block[1]/@pb-name)='intro00') and not(ancestor::ata-page-block/@pb-name[starts-with(., 'disassy') or starts-with(., 'fault')]) and not(ancestor::page-block/@pb-name[starts-with(., 'disassy') or starts-with(., 'fault')]) and (ancestor::book[contains(@doctype,'oh')] and ancestor::ata-page-block/@pb-name[starts-with(., 'clean')])">
            <xsl:variable name="node-id" select="generate-id(.)"/>
            <xsl:variable name="from-node" select="(ancestor-or-self::ata-page-block[not(ancestor::ata-page-block)])[last()]"/>
            <xsl:variable name="num">
               <xsl:variable name="candidate-num">
                  <xsl:choose>
                     <xsl:when test="count($from-node) &gt; 0">
                        <xsl:for-each select="$from-node/descendant-or-self::*[@_gte:count-as-id='cnt__table^ata-page-block.cnt']">
                           <xsl:if test="generate-id(.) = $node-id">
                              <xsl:value-of select="position()"/>
                           </xsl:if>
                        </xsl:for-each>
                     </xsl:when>
                     <xsl:otherwise>
                        <xsl:for-each select="//*[@_gte:count-as-id='cnt__table^ata-page-block.cnt'][not(ancestor-or-self::ata-page-block)]">
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
            <xsl:variable name="offset">
               <!--Evaluate startAtXPath using the first counted element within the numbering scope as the context node-->
               <xsl:variable name="initial-num">
                  <xsl:choose>
                     <xsl:when test="count($from-node) &gt; 0">
                        <xsl:apply-templates select="($from-node/descendant-or-self::*[@_gte:count-as-id='cnt__table^ata-page-block.cnt'])[1]" mode="startat-xpath"/>
                     </xsl:when>
                     <xsl:otherwise>
                        <xsl:apply-templates select="(//*[@_gte:count-as-id='cnt__table^ata-page-block.cnt'][not(ancestor-or-self::ata-page-block)])[1]" mode="startat-xpath"/>
                     </xsl:otherwise>
                  </xsl:choose>
               </xsl:variable>
               <xsl:choose>
                  <xsl:when test="string(number($initial-num))!='NaN'">
                     <xsl:value-of select="$initial-num"/>
                  </xsl:when>
                  <xsl:otherwise>1</xsl:otherwise>
               </xsl:choose>
            </xsl:variable>
            <xsl:choose>
               <xsl:when test="string(number($num))!='NaN'">
                  <xsl:number value="$num + $offset - 1" format="1"/>
               </xsl:when>
               <xsl:otherwise>?</xsl:otherwise>
            </xsl:choose>
         </xsl:when>
         <xsl:when test="not(ancestor::book[contains(@doctype,'cir') or contains(@doctype,'em') or contains(@doctype,'tmm')]) and not(ancestor::book[contains(@doctype,'oh')] and ancestor::ata-page-block/@pb-name[.='service']) and not(ancestor::book[contains(@doctype,'oh')] and ancestor::page-block/@pb-name[.='service']) and not(ancestor::ata-page-block/@pb-name[.='00awl' or .='00intro' or .='airlim' or .='awl' or .='awlror' or .='chapsect' or .='consume' or .='d-and-o' or .='frontmatte' or .='howtouse' or .='00howtouse' or .='intro' or .='nut_option' or .='oplimits' or .='sblist' or .='schedchk' or .='spectool' or .='timelim' or .='title-page']) and not(ancestor::page-block/@pb-name[.='00awl' or .='00intro' or .='airlim' or .='awl' or .='awlror' or .='chapsect' or .='consume' or .='d-and-o' or .='frontmatte' or .='howtouse' or .='00howtouse' or .='intro' or .='nut_option' or .='oplimits' or .='sblist' or .='schedchk' or .='spectool' or .='timelim' or .='title-page']) and not(ancestor::ata-page-block/@pb-name[(starts-with(., 'do') and 'do' = translate(., '0123456789', '') and string-length(.) &gt; 2) or (starts-with(., 'in') and 'in' = translate(., '0123456789', '') and string-length(.) &gt; 2) or (starts-with(., 'tl') and 'tl' = translate(., '0123456789', '') and string-length(.) &gt; 2) or .='toolsht' or .='trlist' or .='unschedc' or .='unschedchk']) and not(ancestor::page-block/@pb-name[(starts-with(., 'do') and 'do' = translate(., '0123456789', '') and string-length(.) &gt; 2) or (starts-with(., 'in') and 'in' = translate(., '0123456789', '') and string-length(.) &gt; 2) or (starts-with(., 'tl') and 'tl' = translate(., '0123456789', '') and string-length(.) &gt; 2) or .='toolsht' or .='trlist' or .='unschedc' or .='unschedchk']) and not(ancestor-or-self::ata-page-block[1]/@pb-name and string(ancestor-or-self::ata-page-block[1]/@pb-name)='intro00') and not(ancestor-or-self::page-block[1]/@pb-name and string(ancestor-or-self::page-block[1]/@pb-name)='intro00') and not(ancestor::ata-page-block/@pb-name[starts-with(., 'disassy') or starts-with(., 'fault')]) and (ancestor::page-block/@pb-name[starts-with(., 'disassy') or starts-with(., 'fault')])">
            <xsl:variable name="node-id" select="generate-id(.)"/>
            <xsl:variable name="from-node" select="(ancestor-or-self::page-block[not(ancestor::page-block)])[last()]"/>
            <xsl:variable name="num">
               <xsl:variable name="candidate-num">
                  <xsl:choose>
                     <xsl:when test="count($from-node) &gt; 0">
                        <xsl:for-each select="$from-node/descendant-or-self::*[@_gte:count-as-id='cnt__table^page-block.cnt']">
                           <xsl:if test="generate-id(.) = $node-id">
                              <xsl:value-of select="position()"/>
                           </xsl:if>
                        </xsl:for-each>
                     </xsl:when>
                     <xsl:otherwise>
                        <xsl:for-each select="//*[@_gte:count-as-id='cnt__table^page-block.cnt'][not(ancestor-or-self::page-block)]">
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
            <xsl:variable name="offset">
               <!--Evaluate startAtXPath using the first counted element within the numbering scope as the context node-->
               <xsl:variable name="initial-num">
                  <xsl:choose>
                     <xsl:when test="count($from-node) &gt; 0">
                        <xsl:apply-templates select="($from-node/descendant-or-self::*[@_gte:count-as-id='cnt__table^page-block.cnt'])[1]" mode="startat-xpath"/>
                     </xsl:when>
                     <xsl:otherwise>
                        <xsl:apply-templates select="(//*[@_gte:count-as-id='cnt__table^page-block.cnt'][not(ancestor-or-self::page-block)])[1]" mode="startat-xpath"/>
                     </xsl:otherwise>
                  </xsl:choose>
               </xsl:variable>
               <xsl:choose>
                  <xsl:when test="string(number($initial-num))!='NaN'">
                     <xsl:value-of select="$initial-num"/>
                  </xsl:when>
                  <xsl:otherwise>1</xsl:otherwise>
               </xsl:choose>
            </xsl:variable>
            <xsl:choose>
               <xsl:when test="string(number($num))!='NaN'">
                  <xsl:number value="$num + $offset - 1" format="1"/>
               </xsl:when>
               <xsl:otherwise>?</xsl:otherwise>
            </xsl:choose>
         </xsl:when>
         <xsl:when test="not(ancestor::book[contains(@doctype,'cir') or contains(@doctype,'em') or contains(@doctype,'tmm')]) and not(ancestor::book[contains(@doctype,'oh')] and ancestor::ata-page-block/@pb-name[.='service']) and not(ancestor::book[contains(@doctype,'oh')] and ancestor::page-block/@pb-name[.='service']) and not(ancestor::ata-page-block/@pb-name[.='00awl' or .='00intro' or .='airlim' or .='awl' or .='awlror' or .='chapsect' or .='consume' or .='d-and-o' or .='frontmatte' or .='howtouse' or .='00howtouse' or .='intro' or .='nut_option' or .='oplimits' or .='sblist' or .='schedchk' or .='spectool' or .='timelim' or .='title-page']) and not(ancestor::page-block/@pb-name[.='00awl' or .='00intro' or .='airlim' or .='awl' or .='awlror' or .='chapsect' or .='consume' or .='d-and-o' or .='frontmatte' or .='howtouse' or .='00howtouse' or .='intro' or .='nut_option' or .='oplimits' or .='sblist' or .='schedchk' or .='spectool' or .='timelim' or .='title-page']) and not(ancestor::ata-page-block/@pb-name[(starts-with(., 'do') and 'do' = translate(., '0123456789', '') and string-length(.) &gt; 2) or (starts-with(., 'in') and 'in' = translate(., '0123456789', '') and string-length(.) &gt; 2) or (starts-with(., 'tl') and 'tl' = translate(., '0123456789', '') and string-length(.) &gt; 2) or .='toolsht' or .='trlist' or .='unschedc' or .='unschedchk']) and not(ancestor::page-block/@pb-name[(starts-with(., 'do') and 'do' = translate(., '0123456789', '') and string-length(.) &gt; 2) or (starts-with(., 'in') and 'in' = translate(., '0123456789', '') and string-length(.) &gt; 2) or (starts-with(., 'tl') and 'tl' = translate(., '0123456789', '') and string-length(.) &gt; 2) or .='toolsht' or .='trlist' or .='unschedc' or .='unschedchk']) and not(ancestor-or-self::ata-page-block[1]/@pb-name and string(ancestor-or-self::ata-page-block[1]/@pb-name)='intro00') and not(ancestor-or-self::page-block[1]/@pb-name and string(ancestor-or-self::page-block[1]/@pb-name)='intro00') and (ancestor::ata-page-block/@pb-name[starts-with(., 'disassy') or starts-with(., 'fault')])">
            <xsl:variable name="node-id" select="generate-id(.)"/>
            <xsl:variable name="from-node" select="(ancestor-or-self::ata-page-block[not(ancestor::ata-page-block)])[last()]"/>
            <xsl:variable name="num">
               <xsl:variable name="candidate-num">
                  <xsl:choose>
                     <xsl:when test="count($from-node) &gt; 0">
                        <xsl:for-each select="$from-node/descendant-or-self::*[@_gte:count-as-id='cnt__table^ata-page-block.cnt']">
                           <xsl:if test="generate-id(.) = $node-id">
                              <xsl:value-of select="position()"/>
                           </xsl:if>
                        </xsl:for-each>
                     </xsl:when>
                     <xsl:otherwise>
                        <xsl:for-each select="//*[@_gte:count-as-id='cnt__table^ata-page-block.cnt'][not(ancestor-or-self::ata-page-block)]">
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
            <xsl:variable name="offset">
               <!--Evaluate startAtXPath using the first counted element within the numbering scope as the context node-->
               <xsl:variable name="initial-num">
                  <xsl:choose>
                     <xsl:when test="count($from-node) &gt; 0">
                        <xsl:apply-templates select="($from-node/descendant-or-self::*[@_gte:count-as-id='cnt__table^ata-page-block.cnt'])[1]" mode="startat-xpath"/>
                     </xsl:when>
                     <xsl:otherwise>
                        <xsl:apply-templates select="(//*[@_gte:count-as-id='cnt__table^ata-page-block.cnt'][not(ancestor-or-self::ata-page-block)])[1]" mode="startat-xpath"/>
                     </xsl:otherwise>
                  </xsl:choose>
               </xsl:variable>
               <xsl:choose>
                  <xsl:when test="string(number($initial-num))!='NaN'">
                     <xsl:value-of select="$initial-num"/>
                  </xsl:when>
                  <xsl:otherwise>1</xsl:otherwise>
               </xsl:choose>
            </xsl:variable>
            <xsl:choose>
               <xsl:when test="string(number($num))!='NaN'">
                  <xsl:number value="$num + $offset - 1" format="1"/>
               </xsl:when>
               <xsl:otherwise>?</xsl:otherwise>
            </xsl:choose>
         </xsl:when>
         <xsl:when test="not(ancestor::book[contains(@doctype,'cir') or contains(@doctype,'em') or contains(@doctype,'tmm')]) and not(ancestor::book[contains(@doctype,'oh')] and ancestor::ata-page-block/@pb-name[.='service']) and not(ancestor::book[contains(@doctype,'oh')] and ancestor::page-block/@pb-name[.='service']) and not(ancestor::ata-page-block/@pb-name[.='00awl' or .='00intro' or .='airlim' or .='awl' or .='awlror' or .='chapsect' or .='consume' or .='d-and-o' or .='frontmatte' or .='howtouse' or .='00howtouse' or .='intro' or .='nut_option' or .='oplimits' or .='sblist' or .='schedchk' or .='spectool' or .='timelim' or .='title-page']) and not(ancestor::page-block/@pb-name[.='00awl' or .='00intro' or .='airlim' or .='awl' or .='awlror' or .='chapsect' or .='consume' or .='d-and-o' or .='frontmatte' or .='howtouse' or .='00howtouse' or .='intro' or .='nut_option' or .='oplimits' or .='sblist' or .='schedchk' or .='spectool' or .='timelim' or .='title-page']) and not(ancestor::ata-page-block/@pb-name[(starts-with(., 'do') and 'do' = translate(., '0123456789', '') and string-length(.) &gt; 2) or (starts-with(., 'in') and 'in' = translate(., '0123456789', '') and string-length(.) &gt; 2) or (starts-with(., 'tl') and 'tl' = translate(., '0123456789', '') and string-length(.) &gt; 2) or .='toolsht' or .='trlist' or .='unschedc' or .='unschedchk']) and not(ancestor::page-block/@pb-name[(starts-with(., 'do') and 'do' = translate(., '0123456789', '') and string-length(.) &gt; 2) or (starts-with(., 'in') and 'in' = translate(., '0123456789', '') and string-length(.) &gt; 2) or (starts-with(., 'tl') and 'tl' = translate(., '0123456789', '') and string-length(.) &gt; 2) or .='toolsht' or .='trlist' or .='unschedc' or .='unschedchk']) and not(ancestor-or-self::ata-page-block[1]/@pb-name and string(ancestor-or-self::ata-page-block[1]/@pb-name)='intro00') and (ancestor-or-self::page-block[1]/@pb-name and string(ancestor-or-self::page-block[1]/@pb-name)='intro00')">
            <xsl:variable name="node-id" select="generate-id(.)"/>
            <xsl:variable name="from-node" select="(ancestor-or-self::page-block[not(ancestor::page-block)])[last()]"/>
            <xsl:variable name="num">
               <xsl:variable name="candidate-num">
                  <xsl:choose>
                     <xsl:when test="count($from-node) &gt; 0">
                        <xsl:for-each select="$from-node/descendant-or-self::*[@_gte:count-as-id='cnt__table^page-block.cnt']">
                           <xsl:if test="generate-id(.) = $node-id">
                              <xsl:value-of select="position()"/>
                           </xsl:if>
                        </xsl:for-each>
                     </xsl:when>
                     <xsl:otherwise>
                        <xsl:for-each select="//*[@_gte:count-as-id='cnt__table^page-block.cnt'][not(ancestor-or-self::page-block)]">
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
            <xsl:variable name="offset">
               <!--Evaluate startAtXPath using the first counted element within the numbering scope as the context node-->
               <xsl:variable name="initial-num">
                  <xsl:choose>
                     <xsl:when test="count($from-node) &gt; 0">
                        <xsl:apply-templates select="($from-node/descendant-or-self::*[@_gte:count-as-id='cnt__table^page-block.cnt'])[1]" mode="startat-xpath"/>
                     </xsl:when>
                     <xsl:otherwise>
                        <xsl:apply-templates select="(//*[@_gte:count-as-id='cnt__table^page-block.cnt'][not(ancestor-or-self::page-block)])[1]" mode="startat-xpath"/>
                     </xsl:otherwise>
                  </xsl:choose>
               </xsl:variable>
               <xsl:choose>
                  <xsl:when test="string(number($initial-num))!='NaN'">
                     <xsl:value-of select="$initial-num"/>
                  </xsl:when>
                  <xsl:otherwise>1</xsl:otherwise>
               </xsl:choose>
            </xsl:variable>
            <xsl:choose>
               <xsl:when test="string(number($num))!='NaN'">
                  <xsl:number value="$num + $offset - 1" format="1"/>
               </xsl:when>
               <xsl:otherwise>?</xsl:otherwise>
            </xsl:choose>
         </xsl:when>
         <xsl:when test="not(ancestor::book[contains(@doctype,'cir') or contains(@doctype,'em') or contains(@doctype,'tmm')]) and not(ancestor::book[contains(@doctype,'oh')] and ancestor::ata-page-block/@pb-name[.='service']) and not(ancestor::book[contains(@doctype,'oh')] and ancestor::page-block/@pb-name[.='service']) and not(ancestor::ata-page-block/@pb-name[.='00awl' or .='00intro' or .='airlim' or .='awl' or .='awlror' or .='chapsect' or .='consume' or .='d-and-o' or .='frontmatte' or .='howtouse' or .='00howtouse' or .='intro' or .='nut_option' or .='oplimits' or .='sblist' or .='schedchk' or .='spectool' or .='timelim' or .='title-page']) and not(ancestor::page-block/@pb-name[.='00awl' or .='00intro' or .='airlim' or .='awl' or .='awlror' or .='chapsect' or .='consume' or .='d-and-o' or .='frontmatte' or .='howtouse' or .='00howtouse' or .='intro' or .='nut_option' or .='oplimits' or .='sblist' or .='schedchk' or .='spectool' or .='timelim' or .='title-page']) and not(ancestor::ata-page-block/@pb-name[(starts-with(., 'do') and 'do' = translate(., '0123456789', '') and string-length(.) &gt; 2) or (starts-with(., 'in') and 'in' = translate(., '0123456789', '') and string-length(.) &gt; 2) or (starts-with(., 'tl') and 'tl' = translate(., '0123456789', '') and string-length(.) &gt; 2) or .='toolsht' or .='trlist' or .='unschedc' or .='unschedchk']) and not(ancestor::page-block/@pb-name[(starts-with(., 'do') and 'do' = translate(., '0123456789', '') and string-length(.) &gt; 2) or (starts-with(., 'in') and 'in' = translate(., '0123456789', '') and string-length(.) &gt; 2) or (starts-with(., 'tl') and 'tl' = translate(., '0123456789', '') and string-length(.) &gt; 2) or .='toolsht' or .='trlist' or .='unschedc' or .='unschedchk']) and (ancestor-or-self::ata-page-block[1]/@pb-name and string(ancestor-or-self::ata-page-block[1]/@pb-name)='intro00')">
            <xsl:variable name="node-id" select="generate-id(.)"/>
            <xsl:variable name="from-node" select="(ancestor-or-self::ata-page-block[not(ancestor::ata-page-block)])[last()]"/>
            <xsl:variable name="num">
               <xsl:variable name="candidate-num">
                  <xsl:choose>
                     <xsl:when test="count($from-node) &gt; 0">
                        <xsl:for-each select="$from-node/descendant-or-self::*[@_gte:count-as-id='cnt__table^ata-page-block.cnt']">
                           <xsl:if test="generate-id(.) = $node-id">
                              <xsl:value-of select="position()"/>
                           </xsl:if>
                        </xsl:for-each>
                     </xsl:when>
                     <xsl:otherwise>
                        <xsl:for-each select="//*[@_gte:count-as-id='cnt__table^ata-page-block.cnt'][not(ancestor-or-self::ata-page-block)]">
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
            <xsl:variable name="offset">
               <!--Evaluate startAtXPath using the first counted element within the numbering scope as the context node-->
               <xsl:variable name="initial-num">
                  <xsl:choose>
                     <xsl:when test="count($from-node) &gt; 0">
                        <xsl:apply-templates select="($from-node/descendant-or-self::*[@_gte:count-as-id='cnt__table^ata-page-block.cnt'])[1]" mode="startat-xpath"/>
                     </xsl:when>
                     <xsl:otherwise>
                        <xsl:apply-templates select="(//*[@_gte:count-as-id='cnt__table^ata-page-block.cnt'][not(ancestor-or-self::ata-page-block)])[1]" mode="startat-xpath"/>
                     </xsl:otherwise>
                  </xsl:choose>
               </xsl:variable>
               <xsl:choose>
                  <xsl:when test="string(number($initial-num))!='NaN'">
                     <xsl:value-of select="$initial-num"/>
                  </xsl:when>
                  <xsl:otherwise>1</xsl:otherwise>
               </xsl:choose>
            </xsl:variable>
            <xsl:choose>
               <xsl:when test="string(number($num))!='NaN'">
                  <xsl:number value="$num + $offset - 1" format="1"/>
               </xsl:when>
               <xsl:otherwise>?</xsl:otherwise>
            </xsl:choose>
         </xsl:when>
         <xsl:when test="not(ancestor::book[contains(@doctype,'cir') or contains(@doctype,'em') or contains(@doctype,'tmm')]) and not(ancestor::book[contains(@doctype,'oh')] and ancestor::ata-page-block/@pb-name[.='service']) and not(ancestor::book[contains(@doctype,'oh')] and ancestor::page-block/@pb-name[.='service']) and not(ancestor::ata-page-block/@pb-name[.='00awl' or .='00intro' or .='airlim' or .='awl' or .='awlror' or .='chapsect' or .='consume' or .='d-and-o' or .='frontmatte' or .='howtouse' or .='00howtouse' or .='intro' or .='nut_option' or .='oplimits' or .='sblist' or .='schedchk' or .='spectool' or .='timelim' or .='title-page']) and not(ancestor::page-block/@pb-name[.='00awl' or .='00intro' or .='airlim' or .='awl' or .='awlror' or .='chapsect' or .='consume' or .='d-and-o' or .='frontmatte' or .='howtouse' or .='00howtouse' or .='intro' or .='nut_option' or .='oplimits' or .='sblist' or .='schedchk' or .='spectool' or .='timelim' or .='title-page']) and not(ancestor::ata-page-block/@pb-name[(starts-with(., 'do') and 'do' = translate(., '0123456789', '') and string-length(.) &gt; 2) or (starts-with(., 'in') and 'in' = translate(., '0123456789', '') and string-length(.) &gt; 2) or (starts-with(., 'tl') and 'tl' = translate(., '0123456789', '') and string-length(.) &gt; 2) or .='toolsht' or .='trlist' or .='unschedc' or .='unschedchk']) and (ancestor::page-block/@pb-name[(starts-with(., 'do') and 'do' = translate(., '0123456789', '') and string-length(.) &gt; 2) or (starts-with(., 'in') and 'in' = translate(., '0123456789', '') and string-length(.) &gt; 2) or (starts-with(., 'tl') and 'tl' = translate(., '0123456789', '') and string-length(.) &gt; 2) or .='toolsht' or .='trlist' or .='unschedc' or .='unschedchk'])">
            <xsl:variable name="node-id" select="generate-id(.)"/>
            <xsl:variable name="from-node" select="(ancestor-or-self::page-block[not(ancestor::page-block)])[last()]"/>
            <xsl:variable name="num">
               <xsl:variable name="candidate-num">
                  <xsl:choose>
                     <xsl:when test="count($from-node) &gt; 0">
                        <xsl:for-each select="$from-node/descendant-or-self::*[@_gte:count-as-id='cnt__table^page-block.cnt']">
                           <xsl:if test="generate-id(.) = $node-id">
                              <xsl:value-of select="position()"/>
                           </xsl:if>
                        </xsl:for-each>
                     </xsl:when>
                     <xsl:otherwise>
                        <xsl:for-each select="//*[@_gte:count-as-id='cnt__table^page-block.cnt'][not(ancestor-or-self::page-block)]">
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
         </xsl:when>
         <xsl:when test="not(ancestor::book[contains(@doctype,'cir') or contains(@doctype,'em') or contains(@doctype,'tmm')]) and not(ancestor::book[contains(@doctype,'oh')] and ancestor::ata-page-block/@pb-name[.='service']) and not(ancestor::book[contains(@doctype,'oh')] and ancestor::page-block/@pb-name[.='service']) and not(ancestor::ata-page-block/@pb-name[.='00awl' or .='00intro' or .='airlim' or .='awl' or .='awlror' or .='chapsect' or .='consume' or .='d-and-o' or .='frontmatte' or .='howtouse' or .='00howtouse' or .='intro' or .='nut_option' or .='oplimits' or .='sblist' or .='schedchk' or .='spectool' or .='timelim' or .='title-page']) and not(ancestor::page-block/@pb-name[.='00awl' or .='00intro' or .='airlim' or .='awl' or .='awlror' or .='chapsect' or .='consume' or .='d-and-o' or .='frontmatte' or .='howtouse' or .='00howtouse' or .='intro' or .='nut_option' or .='oplimits' or .='sblist' or .='schedchk' or .='spectool' or .='timelim' or .='title-page']) and (ancestor::ata-page-block/@pb-name[(starts-with(., 'do') and 'do' = translate(., '0123456789', '') and string-length(.) &gt; 2) or (starts-with(., 'in') and 'in' = translate(., '0123456789', '') and string-length(.) &gt; 2) or (starts-with(., 'tl') and 'tl' = translate(., '0123456789', '') and string-length(.) &gt; 2) or .='toolsht' or .='trlist' or .='unschedc' or .='unschedchk'])">
            <xsl:variable name="node-id" select="generate-id(.)"/>
            <xsl:variable name="from-node" select="(ancestor-or-self::ata-page-block[not(ancestor::ata-page-block)])[last()]"/>
            <xsl:variable name="num">
               <xsl:variable name="candidate-num">
                  <xsl:choose>
                     <xsl:when test="count($from-node) &gt; 0">
                        <xsl:for-each select="$from-node/descendant-or-self::*[@_gte:count-as-id='cnt__table^ata-page-block.cnt']">
                           <xsl:if test="generate-id(.) = $node-id">
                              <xsl:value-of select="position()"/>
                           </xsl:if>
                        </xsl:for-each>
                     </xsl:when>
                     <xsl:otherwise>
                        <xsl:for-each select="//*[@_gte:count-as-id='cnt__table^ata-page-block.cnt'][not(ancestor-or-self::ata-page-block)]">
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
         </xsl:when>
         <xsl:when test="not(ancestor::book[contains(@doctype,'cir') or contains(@doctype,'em') or contains(@doctype,'tmm')]) and not(ancestor::book[contains(@doctype,'oh')] and ancestor::ata-page-block/@pb-name[.='service']) and not(ancestor::book[contains(@doctype,'oh')] and ancestor::page-block/@pb-name[.='service']) and not(ancestor::ata-page-block/@pb-name[.='00awl' or .='00intro' or .='airlim' or .='awl' or .='awlror' or .='chapsect' or .='consume' or .='d-and-o' or .='frontmatte' or .='howtouse' or .='00howtouse' or .='intro' or .='nut_option' or .='oplimits' or .='sblist' or .='schedchk' or .='spectool' or .='timelim' or .='title-page']) and (ancestor::page-block/@pb-name[.='00awl' or .='00intro' or .='airlim' or .='awl' or .='awlror' or .='chapsect' or .='consume' or .='d-and-o' or .='frontmatte' or .='howtouse' or .='00howtouse' or .='intro' or .='nut_option' or .='oplimits' or .='sblist' or .='schedchk' or .='spectool' or .='timelim' or .='title-page'])">
            <xsl:variable name="node-id" select="generate-id(.)"/>
            <xsl:variable name="from-node" select="(ancestor-or-self::page-block[not(ancestor::page-block)])[last()]"/>
            <xsl:variable name="num">
               <xsl:variable name="candidate-num">
                  <xsl:choose>
                     <xsl:when test="count($from-node) &gt; 0">
                        <xsl:for-each select="$from-node/descendant-or-self::*[@_gte:count-as-id='cnt__table^page-block.cnt']">
                           <xsl:if test="generate-id(.) = $node-id">
                              <xsl:value-of select="position()"/>
                           </xsl:if>
                        </xsl:for-each>
                     </xsl:when>
                     <xsl:otherwise>
                        <xsl:for-each select="//*[@_gte:count-as-id='cnt__table^page-block.cnt'][not(ancestor-or-self::page-block)]">
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
         </xsl:when>
         <xsl:when test="not(ancestor::book[contains(@doctype,'cir') or contains(@doctype,'em') or contains(@doctype,'tmm')]) and not(ancestor::book[contains(@doctype,'oh')] and ancestor::ata-page-block/@pb-name[.='service']) and not(ancestor::book[contains(@doctype,'oh')] and ancestor::page-block/@pb-name[.='service']) and (ancestor::ata-page-block/@pb-name[.='00awl' or .='00intro' or .='airlim' or .='awl' or .='awlror' or .='chapsect' or .='consume' or .='d-and-o' or .='frontmatte' or .='howtouse' or .='00howtouse' or .='intro' or .='nut_option' or .='oplimits' or .='sblist' or .='schedchk' or .='spectool' or .='timelim' or .='title-page'])">
            <xsl:variable name="node-id" select="generate-id(.)"/>
            <xsl:variable name="from-node" select="(ancestor-or-self::ata-page-block[not(ancestor::ata-page-block)])[last()]"/>
            <xsl:variable name="num">
               <xsl:variable name="candidate-num">
                  <xsl:choose>
                     <xsl:when test="count($from-node) &gt; 0">
                        <xsl:for-each select="$from-node/descendant-or-self::*[@_gte:count-as-id='cnt__table^ata-page-block.cnt']">
                           <xsl:if test="generate-id(.) = $node-id">
                              <xsl:value-of select="position()"/>
                           </xsl:if>
                        </xsl:for-each>
                     </xsl:when>
                     <xsl:otherwise>
                        <xsl:for-each select="//*[@_gte:count-as-id='cnt__table^ata-page-block.cnt'][not(ancestor-or-self::ata-page-block)]">
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
         </xsl:when>
         <xsl:when test="(ancestor::book[contains(@doctype,'cir') or contains(@doctype,'em') or contains(@doctype,'tmm')]) and not(number(ancestor::pgblk/@pgblknbr)&gt;0 and number(ancestor::pgblk/@pgblknbr)&lt;=13)">
            <xsl:variable name="node-id" select="generate-id(.)"/>
            <xsl:variable name="from-node" select="(ancestor-or-self::pgblk[not(ancestor::pgblk)])[last()]"/>
            <xsl:variable name="num">
               <xsl:variable name="candidate-num">
                  <xsl:choose>
                     <xsl:when test="count($from-node) &gt; 0">
                        <xsl:for-each select="$from-node/descendant-or-self::*[@_gte:count-as-id='cnt__table^pgblk.cnt']">
                           <xsl:if test="generate-id(.) = $node-id">
                              <xsl:value-of select="position()"/>
                           </xsl:if>
                        </xsl:for-each>
                     </xsl:when>
                     <xsl:otherwise>
                        <xsl:for-each select="//*[@_gte:count-as-id='cnt__table^pgblk.cnt'][not(ancestor-or-self::pgblk)]">
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
         </xsl:when>
         <xsl:when test="(ancestor::book[contains(@doctype,'cir') or contains(@doctype,'em') or contains(@doctype,'tmm')]) and (number(ancestor::pgblk/@pgblknbr)&gt;0 and number(ancestor::pgblk/@pgblknbr)&lt;=13)">
            <xsl:variable name="node-id" select="generate-id(.)"/>
            <xsl:variable name="from-node" select="(ancestor-or-self::pgblk[not(ancestor::pgblk)])[last()]"/>
            <xsl:variable name="num">
               <xsl:variable name="candidate-num">
                  <xsl:choose>
                     <xsl:when test="count($from-node) &gt; 0">
                        <xsl:for-each select="$from-node/descendant-or-self::*[@_gte:count-as-id='cnt__table^pgblk.cnt']">
                           <xsl:if test="generate-id(.) = $node-id">
                              <xsl:value-of select="position()"/>
                           </xsl:if>
                        </xsl:for-each>
                     </xsl:when>
                     <xsl:otherwise>
                        <xsl:for-each select="//*[@_gte:count-as-id='cnt__table^pgblk.cnt'][not(ancestor-or-self::pgblk)]">
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
            <xsl:variable name="offset">
               <!--Evaluate startAtXPath using the first counted element within the numbering scope as the context node-->
               <xsl:variable name="initial-num">
                  <xsl:choose>
                     <xsl:when test="count($from-node) &gt; 0">
                        <xsl:apply-templates select="($from-node/descendant-or-self::*[@_gte:count-as-id='cnt__table^pgblk.cnt'])[1]" mode="startat-xpath"/>
                     </xsl:when>
                     <xsl:otherwise>
                        <xsl:apply-templates select="(//*[@_gte:count-as-id='cnt__table^pgblk.cnt'][not(ancestor-or-self::pgblk)])[1]" mode="startat-xpath"/>
                     </xsl:otherwise>
                  </xsl:choose>
               </xsl:variable>
               <xsl:choose>
                  <xsl:when test="string(number($initial-num))!='NaN'">
                     <xsl:value-of select="$initial-num"/>
                  </xsl:when>
                  <xsl:otherwise>1</xsl:otherwise>
               </xsl:choose>
            </xsl:variable>
            <xsl:choose>
               <xsl:when test="string(number($num))!='NaN'">
                  <xsl:number value="$num + $offset - 1" format="1"/>
               </xsl:when>
               <xsl:otherwise>?</xsl:otherwise>
            </xsl:choose>
         </xsl:when>
      </xsl:choose>
   </xsl:template>

<xsl:template match="table/title" mode="styler_numbering" priority="5">
      <xsl:choose>
         <xsl:when test="(ancestor-or-self::table[1]/@tabstyle and string(ancestor-or-self::table[1]/@tabstyle)='fits-and-clears') and (/ata-page-block//table/title)">
            <xsl:variable name="node-id" select="generate-id(.)"/>
            <xsl:variable name="from-node" select="(ancestor-or-self::ata-page-block[not(ancestor::ata-page-block)])[last()]"/>
            <xsl:variable name="num">
               <xsl:variable name="candidate-num">
                  <xsl:choose>
                     <xsl:when test="count($from-node) &gt; 0">
                        <xsl:for-each select="$from-node/descendant-or-self::*[@_gte:count-as-id='npara-ata']">
                           <xsl:if test="generate-id(.) = $node-id">
                              <xsl:value-of select="position()"/>
                           </xsl:if>
                        </xsl:for-each>
                     </xsl:when>
                     <xsl:otherwise>
                        <xsl:for-each select="//*[@_gte:count-as-id='npara-ata'][not(ancestor-or-self::ata-page-block)]">
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
            <xsl:text>.</xsl:text>
         </xsl:when>
         <xsl:when test="(ancestor-or-self::table[1]/@tabstyle and string(ancestor-or-self::table[1]/@tabstyle)='fits-and-clears') and (/page-block//table/title)">
            <xsl:variable name="node-id" select="generate-id(.)"/>
            <xsl:variable name="from-node" select="(ancestor-or-self::page-block[not(ancestor::page-block)])[last()]"/>
            <xsl:variable name="num">
               <xsl:variable name="candidate-num">
                  <xsl:choose>
                     <xsl:when test="count($from-node) &gt; 0">
                        <xsl:for-each select="$from-node/descendant-or-self::*[@_gte:count-as-id='npara']">
                           <xsl:if test="generate-id(.) = $node-id">
                              <xsl:value-of select="position()"/>
                           </xsl:if>
                        </xsl:for-each>
                     </xsl:when>
                     <xsl:otherwise>
                        <xsl:for-each select="//*[@_gte:count-as-id='npara'][not(ancestor-or-self::page-block)]">
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
            <xsl:text>.</xsl:text>
         </xsl:when>
         <xsl:when test="not(ancestor::book[contains(@doctype,'cir') or contains(@doctype,'em') or contains(@doctype,'tmm')]) and not(ancestor::book[contains(@doctype,'oh')] and ancestor::ata-page-block/@pb-name[.='service']) and not(ancestor::book[contains(@doctype,'oh')] and ancestor::page-block/@pb-name[.='service']) and not(ancestor::ata-page-block/@pb-name[.='00awl' or .='00intro' or .='airlim' or .='awl' or .='awlror' or .='chapsect' or .='consume' or .='d-and-o' or .='frontmatte' or .='howtouse' or .='00howtouse' or .='intro' or .='nut_option' or .='oplimits' or .='sblist' or .='schedchk' or .='spectool' or .='timelim' or .='title-page']) and not(ancestor::page-block/@pb-name[.='00awl' or .='00intro' or .='airlim' or .='awl' or .='awlror' or .='chapsect' or .='consume' or .='d-and-o' or .='frontmatte' or .='howtouse' or .='00howtouse' or .='intro' or .='nut_option' or .='oplimits' or .='sblist' or .='schedchk' or .='spectool' or .='timelim' or .='title-page']) and not(ancestor::ata-page-block/@pb-name[(starts-with(., 'do') and 'do' = translate(., '0123456789', '') and string-length(.) &gt; 2) or (starts-with(., 'in') and 'in' = translate(., '0123456789', '') and string-length(.) &gt; 2) or (starts-with(., 'tl') and 'tl' = translate(., '0123456789', '') and string-length(.) &gt; 2) or .='toolsht' or .='trlist' or .='unschedc' or .='unschedchk']) and not(ancestor::page-block/@pb-name[(starts-with(., 'do') and 'do' = translate(., '0123456789', '') and string-length(.) &gt; 2) or (starts-with(., 'in') and 'in' = translate(., '0123456789', '') and string-length(.) &gt; 2) or (starts-with(., 'tl') and 'tl' = translate(., '0123456789', '') and string-length(.) &gt; 2) or .='toolsht' or .='trlist' or .='unschedc' or .='unschedchk']) and not(ancestor-or-self::ata-page-block[1]/@pb-name and string(ancestor-or-self::ata-page-block[1]/@pb-name)='intro00') and not(ancestor-or-self::page-block[1]/@pb-name and string(ancestor-or-self::page-block[1]/@pb-name)='intro00') and not(ancestor::ata-page-block/@pb-name[starts-with(., 'disassy') or starts-with(., 'fault')]) and not(ancestor::page-block/@pb-name[starts-with(., 'disassy') or starts-with(., 'fault')]) and not(ancestor::book[contains(@doctype,'oh')] and ancestor::ata-page-block/@pb-name[starts-with(., 'clean')]) and not(ancestor::book[contains(@doctype,'oh')] and ancestor::page-block/@pb-name[starts-with(., 'clean')]) and not(ancestor::ata-page-block/@pb-name[starts-with(., 'mainprac')]) and not(ancestor::page-block/@pb-name[starts-with(., 'mainprac')]) and not(ancestor::book[contains(@doctype,'oh')] and ancestor::ata-page-block/@pb-name[starts-with(., 'inspect')]) and not(ancestor::book[contains(@doctype,'oh')] and ancestor::page-block/@pb-name[starts-with(., 'inspect')]) and not(ancestor::ata-page-block/@pb-name[(starts-with(., 'di') and 'di' = translate(., '0123456789', '') and string-length(.) &gt; 2) or starts-with(.,'service')]) and not(ancestor::page-block/@pb-name[(starts-with(., 'di') and 'di' = translate(., '0123456789', '') and string-length(.) &gt; 2) or starts-with(.,'service')]) and not(ancestor::book[contains(@doctype,'oh')] and ancestor::ata-page-block/@pb-name[starts-with(., 'repair')]) and not(ancestor::book[contains(@doctype,'oh')] and ancestor::page-block/@pb-name[starts-with(., 'repair')]) and not(ancestor::book[contains(@doctype,'oh')] and ancestor::ata-page-block/@pb-name[starts-with(., 'test')]) and not(ancestor::book[contains(@doctype,'oh')] and ancestor::page-block/@pb-name[starts-with(., 'test')]) and not(ancestor::ata-page-block/@pb-name[(starts-with(., 'cl') and 'cl' = translate(., '0123456789', '') and string-length(.) &gt; 2) or .='install' or starts-with(.,'rem-inst') or (starts-with(., 'reminst') and 'reminst' = translate(., '0123456789', '') and string-length(.) &gt; 7) or .='remove' or (starts-with(., 'repair') and 'repair' = translate(., '0123456789', '') and string-length(.) &gt; 6)]) and not(ancestor::page-block/@pb-name[(starts-with(., 'cl') and 'cl' = translate(., '0123456789', '') and string-length(.) &gt; 2) or .='install' or starts-with(.,'rem-inst') or (starts-with(., 'reminst') and 'reminst' = translate(., '0123456789', '') and string-length(.) &gt; 7) or .='remove' or (starts-with(., 'repair') and 'repair' = translate(., '0123456789', '') and string-length(.) &gt; 6)]) and not(ancestor::ata-page-block/@pb-name[starts-with(., 'assy') or (starts-with(., 'ic') and 'ic' = translate(., '0123456789', '') and string-length(.) &gt; 2) or (starts-with(., 'te') and 'te' = translate(., '0123456789', '') and string-length(.) &gt; 2) or .='test']) and not(ancestor::page-block/@pb-name[starts-with(., 'assy') or (starts-with(., 'ic') and 'ic' = translate(., '0123456789', '') and string-length(.) &gt; 2) or (starts-with(., 'te') and 'te' = translate(., '0123456789', '') and string-length(.) &gt; 2) or .='test']) and not(ancestor::ata-page-block/@pb-name[.='f-and-c' or starts-with(., 'inspect') or (starts-with(., 're') and 're' = translate(., '0123456789', '') and string-length(.) &gt; 2)]) and not(ancestor::page-block/@pb-name[.='f-and-c' or starts-with(., 'inspect') or (starts-with(., 're') and 're' = translate(., '0123456789', '') and string-length(.) &gt; 2)]) and not(ancestor::ata-page-block/@pb-name[(starts-with(., 'as') and 'as' = translate(., '0123456789', '') and string-length(.) &gt; 2) or starts-with(.,'clean') or (starts-with(., 'test') and 'test' = translate(., '0123456789', '') and string-length(.) &gt; 4)]) and not(ancestor::page-block/@pb-name[(starts-with(., 'as') and 'as' = translate(., '0123456789', '') and string-length(.) &gt; 2) or starts-with(.,'clean') or (starts-with(., 'test') and 'test' = translate(., '0123456789', '') and string-length(.) &gt; 4)]) and not(ancestor::ata-page-block/@pb-name[(starts-with(., 'fc') and 'fc' = translate(., '0123456789', '') and string-length(.) &gt; 2) or starts-with(.,'repair') or .='trouble']) and not(ancestor::page-block/@pb-name[(starts-with(., 'fc') and 'fc' = translate(., '0123456789', '') and string-length(.) &gt; 2) or starts-with(.,'repair') or .='trouble']) and not(ancestor::ata-page-block/@pb-name[starts-with(.,'storage') or (starts-with(., 'to') and 'to' = translate(., '0123456789', '') and string-length(.) &gt; 2)]) and not(ancestor::page-block/@pb-name[starts-with(.,'storage') or (starts-with(., 'to') and 'to' = translate(., '0123456789', '') and string-length(.) &gt; 2)]) and not(ancestor::ata-page-block/@pb-name[.='it-oh' or .='lt-oh']) and (ancestor::page-block/@pb-name[.='it-oh' or .='lt-oh'])">
            <xsl:variable name="node-id" select="generate-id(.)"/>
            <xsl:variable name="from-node" select="(ancestor-or-self::page-block[not(ancestor::page-block)])[last()]"/>
            <xsl:variable name="num">
               <xsl:variable name="candidate-num">
                  <xsl:choose>
                     <xsl:when test="count($from-node) &gt; 0">
                        <xsl:for-each select="$from-node/descendant-or-self::*[@_gte:count-as-id='cnt__table^page-block.cnt']">
                           <xsl:if test="generate-id(.) = $node-id">
                              <xsl:value-of select="position()"/>
                           </xsl:if>
                        </xsl:for-each>
                     </xsl:when>
                     <xsl:otherwise>
                        <xsl:for-each select="//*[@_gte:count-as-id='cnt__table^page-block.cnt'][not(ancestor-or-self::page-block)]">
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
            <xsl:variable name="offset">
               <!--Evaluate startAtXPath using the first counted element within the numbering scope as the context node-->
               <xsl:variable name="initial-num">
                  <xsl:choose>
                     <xsl:when test="count($from-node) &gt; 0">
                        <xsl:apply-templates select="($from-node/descendant-or-self::*[@_gte:count-as-id='cnt__table^page-block.cnt'])[1]" mode="startat-xpath"/>
                     </xsl:when>
                     <xsl:otherwise>
                        <xsl:apply-templates select="(//*[@_gte:count-as-id='cnt__table^page-block.cnt'][not(ancestor-or-self::page-block)])[1]" mode="startat-xpath"/>
                     </xsl:otherwise>
                  </xsl:choose>
               </xsl:variable>
               <xsl:choose>
                  <xsl:when test="string(number($initial-num))!='NaN'">
                     <xsl:value-of select="$initial-num"/>
                  </xsl:when>
                  <xsl:otherwise>1</xsl:otherwise>
               </xsl:choose>
            </xsl:variable>
            <xsl:choose>
               <xsl:when test="string(number($num))!='NaN'">
                  <xsl:number value="$num + $offset - 1" format="1"/>
               </xsl:when>
               <xsl:otherwise>?</xsl:otherwise>
            </xsl:choose>
         </xsl:when>
         <xsl:when test="not(ancestor::book[contains(@doctype,'cir') or contains(@doctype,'em') or contains(@doctype,'tmm')]) and not(ancestor::book[contains(@doctype,'oh')] and ancestor::ata-page-block/@pb-name[.='service']) and not(ancestor::book[contains(@doctype,'oh')] and ancestor::page-block/@pb-name[.='service']) and not(ancestor::ata-page-block/@pb-name[.='00awl' or .='00intro' or .='airlim' or .='awl' or .='awlror' or .='chapsect' or .='consume' or .='d-and-o' or .='frontmatte' or .='howtouse' or .='00howtouse' or .='intro' or .='nut_option' or .='oplimits' or .='sblist' or .='schedchk' or .='spectool' or .='timelim' or .='title-page']) and not(ancestor::page-block/@pb-name[.='00awl' or .='00intro' or .='airlim' or .='awl' or .='awlror' or .='chapsect' or .='consume' or .='d-and-o' or .='frontmatte' or .='howtouse' or .='00howtouse' or .='intro' or .='nut_option' or .='oplimits' or .='sblist' or .='schedchk' or .='spectool' or .='timelim' or .='title-page']) and not(ancestor::ata-page-block/@pb-name[(starts-with(., 'do') and 'do' = translate(., '0123456789', '') and string-length(.) &gt; 2) or (starts-with(., 'in') and 'in' = translate(., '0123456789', '') and string-length(.) &gt; 2) or (starts-with(., 'tl') and 'tl' = translate(., '0123456789', '') and string-length(.) &gt; 2) or .='toolsht' or .='trlist' or .='unschedc' or .='unschedchk']) and not(ancestor::page-block/@pb-name[(starts-with(., 'do') and 'do' = translate(., '0123456789', '') and string-length(.) &gt; 2) or (starts-with(., 'in') and 'in' = translate(., '0123456789', '') and string-length(.) &gt; 2) or (starts-with(., 'tl') and 'tl' = translate(., '0123456789', '') and string-length(.) &gt; 2) or .='toolsht' or .='trlist' or .='unschedc' or .='unschedchk']) and not(ancestor-or-self::ata-page-block[1]/@pb-name and string(ancestor-or-self::ata-page-block[1]/@pb-name)='intro00') and not(ancestor-or-self::page-block[1]/@pb-name and string(ancestor-or-self::page-block[1]/@pb-name)='intro00') and not(ancestor::ata-page-block/@pb-name[starts-with(., 'disassy') or starts-with(., 'fault')]) and not(ancestor::page-block/@pb-name[starts-with(., 'disassy') or starts-with(., 'fault')]) and not(ancestor::book[contains(@doctype,'oh')] and ancestor::ata-page-block/@pb-name[starts-with(., 'clean')]) and not(ancestor::book[contains(@doctype,'oh')] and ancestor::page-block/@pb-name[starts-with(., 'clean')]) and not(ancestor::ata-page-block/@pb-name[starts-with(., 'mainprac')]) and not(ancestor::page-block/@pb-name[starts-with(., 'mainprac')]) and not(ancestor::book[contains(@doctype,'oh')] and ancestor::ata-page-block/@pb-name[starts-with(., 'inspect')]) and not(ancestor::book[contains(@doctype,'oh')] and ancestor::page-block/@pb-name[starts-with(., 'inspect')]) and not(ancestor::ata-page-block/@pb-name[(starts-with(., 'di') and 'di' = translate(., '0123456789', '') and string-length(.) &gt; 2) or starts-with(.,'service')]) and not(ancestor::page-block/@pb-name[(starts-with(., 'di') and 'di' = translate(., '0123456789', '') and string-length(.) &gt; 2) or starts-with(.,'service')]) and not(ancestor::book[contains(@doctype,'oh')] and ancestor::ata-page-block/@pb-name[starts-with(., 'repair')]) and not(ancestor::book[contains(@doctype,'oh')] and ancestor::page-block/@pb-name[starts-with(., 'repair')]) and not(ancestor::book[contains(@doctype,'oh')] and ancestor::ata-page-block/@pb-name[starts-with(., 'test')]) and not(ancestor::book[contains(@doctype,'oh')] and ancestor::page-block/@pb-name[starts-with(., 'test')]) and not(ancestor::ata-page-block/@pb-name[(starts-with(., 'cl') and 'cl' = translate(., '0123456789', '') and string-length(.) &gt; 2) or .='install' or starts-with(.,'rem-inst') or (starts-with(., 'reminst') and 'reminst' = translate(., '0123456789', '') and string-length(.) &gt; 7) or .='remove' or (starts-with(., 'repair') and 'repair' = translate(., '0123456789', '') and string-length(.) &gt; 6)]) and not(ancestor::page-block/@pb-name[(starts-with(., 'cl') and 'cl' = translate(., '0123456789', '') and string-length(.) &gt; 2) or .='install' or starts-with(.,'rem-inst') or (starts-with(., 'reminst') and 'reminst' = translate(., '0123456789', '') and string-length(.) &gt; 7) or .='remove' or (starts-with(., 'repair') and 'repair' = translate(., '0123456789', '') and string-length(.) &gt; 6)]) and not(ancestor::ata-page-block/@pb-name[starts-with(., 'assy') or (starts-with(., 'ic') and 'ic' = translate(., '0123456789', '') and string-length(.) &gt; 2) or (starts-with(., 'te') and 'te' = translate(., '0123456789', '') and string-length(.) &gt; 2) or .='test']) and not(ancestor::page-block/@pb-name[starts-with(., 'assy') or (starts-with(., 'ic') and 'ic' = translate(., '0123456789', '') and string-length(.) &gt; 2) or (starts-with(., 'te') and 'te' = translate(., '0123456789', '') and string-length(.) &gt; 2) or .='test']) and not(ancestor::ata-page-block/@pb-name[.='f-and-c' or starts-with(., 'inspect') or (starts-with(., 're') and 're' = translate(., '0123456789', '') and string-length(.) &gt; 2)]) and not(ancestor::page-block/@pb-name[.='f-and-c' or starts-with(., 'inspect') or (starts-with(., 're') and 're' = translate(., '0123456789', '') and string-length(.) &gt; 2)]) and not(ancestor::ata-page-block/@pb-name[(starts-with(., 'as') and 'as' = translate(., '0123456789', '') and string-length(.) &gt; 2) or starts-with(.,'clean') or (starts-with(., 'test') and 'test' = translate(., '0123456789', '') and string-length(.) &gt; 4)]) and not(ancestor::page-block/@pb-name[(starts-with(., 'as') and 'as' = translate(., '0123456789', '') and string-length(.) &gt; 2) or starts-with(.,'clean') or (starts-with(., 'test') and 'test' = translate(., '0123456789', '') and string-length(.) &gt; 4)]) and not(ancestor::ata-page-block/@pb-name[(starts-with(., 'fc') and 'fc' = translate(., '0123456789', '') and string-length(.) &gt; 2) or starts-with(.,'repair') or .='trouble']) and not(ancestor::page-block/@pb-name[(starts-with(., 'fc') and 'fc' = translate(., '0123456789', '') and string-length(.) &gt; 2) or starts-with(.,'repair') or .='trouble']) and not(ancestor::ata-page-block/@pb-name[starts-with(.,'storage') or (starts-with(., 'to') and 'to' = translate(., '0123456789', '') and string-length(.) &gt; 2)]) and not(ancestor::page-block/@pb-name[starts-with(.,'storage') or (starts-with(., 'to') and 'to' = translate(., '0123456789', '') and string-length(.) &gt; 2)]) and (ancestor::ata-page-block/@pb-name[.='it-oh' or .='lt-oh'])">
            <xsl:variable name="node-id" select="generate-id(.)"/>
            <xsl:variable name="from-node" select="(ancestor-or-self::ata-page-block[not(ancestor::ata-page-block)])[last()]"/>
            <xsl:variable name="num">
               <xsl:variable name="candidate-num">
                  <xsl:choose>
                     <xsl:when test="count($from-node) &gt; 0">
                        <xsl:for-each select="$from-node/descendant-or-self::*[@_gte:count-as-id='cnt__table^ata-page-block.cnt']">
                           <xsl:if test="generate-id(.) = $node-id">
                              <xsl:value-of select="position()"/>
                           </xsl:if>
                        </xsl:for-each>
                     </xsl:when>
                     <xsl:otherwise>
                        <xsl:for-each select="//*[@_gte:count-as-id='cnt__table^ata-page-block.cnt'][not(ancestor-or-self::ata-page-block)]">
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
            <xsl:variable name="offset">
               <!--Evaluate startAtXPath using the first counted element within the numbering scope as the context node-->
               <xsl:variable name="initial-num">
                  <xsl:choose>
                     <xsl:when test="count($from-node) &gt; 0">
                        <xsl:apply-templates select="($from-node/descendant-or-self::*[@_gte:count-as-id='cnt__table^ata-page-block.cnt'])[1]" mode="startat-xpath"/>
                     </xsl:when>
                     <xsl:otherwise>
                        <xsl:apply-templates select="(//*[@_gte:count-as-id='cnt__table^ata-page-block.cnt'][not(ancestor-or-self::ata-page-block)])[1]" mode="startat-xpath"/>
                     </xsl:otherwise>
                  </xsl:choose>
               </xsl:variable>
               <xsl:choose>
                  <xsl:when test="string(number($initial-num))!='NaN'">
                     <xsl:value-of select="$initial-num"/>
                  </xsl:when>
                  <xsl:otherwise>1</xsl:otherwise>
               </xsl:choose>
            </xsl:variable>
            <xsl:choose>
               <xsl:when test="string(number($num))!='NaN'">
                  <xsl:number value="$num + $offset - 1" format="1"/>
               </xsl:when>
               <xsl:otherwise>?</xsl:otherwise>
            </xsl:choose>
         </xsl:when>
         <xsl:when test="not(ancestor::book[contains(@doctype,'cir') or contains(@doctype,'em') or contains(@doctype,'tmm')]) and not(ancestor::book[contains(@doctype,'oh')] and ancestor::ata-page-block/@pb-name[.='service']) and not(ancestor::book[contains(@doctype,'oh')] and ancestor::page-block/@pb-name[.='service']) and not(ancestor::ata-page-block/@pb-name[.='00awl' or .='00intro' or .='airlim' or .='awl' or .='awlror' or .='chapsect' or .='consume' or .='d-and-o' or .='frontmatte' or .='howtouse' or .='00howtouse' or .='intro' or .='nut_option' or .='oplimits' or .='sblist' or .='schedchk' or .='spectool' or .='timelim' or .='title-page']) and not(ancestor::page-block/@pb-name[.='00awl' or .='00intro' or .='airlim' or .='awl' or .='awlror' or .='chapsect' or .='consume' or .='d-and-o' or .='frontmatte' or .='howtouse' or .='00howtouse' or .='intro' or .='nut_option' or .='oplimits' or .='sblist' or .='schedchk' or .='spectool' or .='timelim' or .='title-page']) and not(ancestor::ata-page-block/@pb-name[(starts-with(., 'do') and 'do' = translate(., '0123456789', '') and string-length(.) &gt; 2) or (starts-with(., 'in') and 'in' = translate(., '0123456789', '') and string-length(.) &gt; 2) or (starts-with(., 'tl') and 'tl' = translate(., '0123456789', '') and string-length(.) &gt; 2) or .='toolsht' or .='trlist' or .='unschedc' or .='unschedchk']) and not(ancestor::page-block/@pb-name[(starts-with(., 'do') and 'do' = translate(., '0123456789', '') and string-length(.) &gt; 2) or (starts-with(., 'in') and 'in' = translate(., '0123456789', '') and string-length(.) &gt; 2) or (starts-with(., 'tl') and 'tl' = translate(., '0123456789', '') and string-length(.) &gt; 2) or .='toolsht' or .='trlist' or .='unschedc' or .='unschedchk']) and not(ancestor-or-self::ata-page-block[1]/@pb-name and string(ancestor-or-self::ata-page-block[1]/@pb-name)='intro00') and not(ancestor-or-self::page-block[1]/@pb-name and string(ancestor-or-self::page-block[1]/@pb-name)='intro00') and not(ancestor::ata-page-block/@pb-name[starts-with(., 'disassy') or starts-with(., 'fault')]) and not(ancestor::page-block/@pb-name[starts-with(., 'disassy') or starts-with(., 'fault')]) and not(ancestor::book[contains(@doctype,'oh')] and ancestor::ata-page-block/@pb-name[starts-with(., 'clean')]) and not(ancestor::book[contains(@doctype,'oh')] and ancestor::page-block/@pb-name[starts-with(., 'clean')]) and not(ancestor::ata-page-block/@pb-name[starts-with(., 'mainprac')]) and not(ancestor::page-block/@pb-name[starts-with(., 'mainprac')]) and not(ancestor::book[contains(@doctype,'oh')] and ancestor::ata-page-block/@pb-name[starts-with(., 'inspect')]) and not(ancestor::book[contains(@doctype,'oh')] and ancestor::page-block/@pb-name[starts-with(., 'inspect')]) and not(ancestor::ata-page-block/@pb-name[(starts-with(., 'di') and 'di' = translate(., '0123456789', '') and string-length(.) &gt; 2) or starts-with(.,'service')]) and not(ancestor::page-block/@pb-name[(starts-with(., 'di') and 'di' = translate(., '0123456789', '') and string-length(.) &gt; 2) or starts-with(.,'service')]) and not(ancestor::book[contains(@doctype,'oh')] and ancestor::ata-page-block/@pb-name[starts-with(., 'repair')]) and not(ancestor::book[contains(@doctype,'oh')] and ancestor::page-block/@pb-name[starts-with(., 'repair')]) and not(ancestor::book[contains(@doctype,'oh')] and ancestor::ata-page-block/@pb-name[starts-with(., 'test')]) and not(ancestor::book[contains(@doctype,'oh')] and ancestor::page-block/@pb-name[starts-with(., 'test')]) and not(ancestor::ata-page-block/@pb-name[(starts-with(., 'cl') and 'cl' = translate(., '0123456789', '') and string-length(.) &gt; 2) or .='install' or starts-with(.,'rem-inst') or (starts-with(., 'reminst') and 'reminst' = translate(., '0123456789', '') and string-length(.) &gt; 7) or .='remove' or (starts-with(., 'repair') and 'repair' = translate(., '0123456789', '') and string-length(.) &gt; 6)]) and not(ancestor::page-block/@pb-name[(starts-with(., 'cl') and 'cl' = translate(., '0123456789', '') and string-length(.) &gt; 2) or .='install' or starts-with(.,'rem-inst') or (starts-with(., 'reminst') and 'reminst' = translate(., '0123456789', '') and string-length(.) &gt; 7) or .='remove' or (starts-with(., 'repair') and 'repair' = translate(., '0123456789', '') and string-length(.) &gt; 6)]) and not(ancestor::ata-page-block/@pb-name[starts-with(., 'assy') or (starts-with(., 'ic') and 'ic' = translate(., '0123456789', '') and string-length(.) &gt; 2) or (starts-with(., 'te') and 'te' = translate(., '0123456789', '') and string-length(.) &gt; 2) or .='test']) and not(ancestor::page-block/@pb-name[starts-with(., 'assy') or (starts-with(., 'ic') and 'ic' = translate(., '0123456789', '') and string-length(.) &gt; 2) or (starts-with(., 'te') and 'te' = translate(., '0123456789', '') and string-length(.) &gt; 2) or .='test']) and not(ancestor::ata-page-block/@pb-name[.='f-and-c' or starts-with(., 'inspect') or (starts-with(., 're') and 're' = translate(., '0123456789', '') and string-length(.) &gt; 2)]) and not(ancestor::page-block/@pb-name[.='f-and-c' or starts-with(., 'inspect') or (starts-with(., 're') and 're' = translate(., '0123456789', '') and string-length(.) &gt; 2)]) and not(ancestor::ata-page-block/@pb-name[(starts-with(., 'as') and 'as' = translate(., '0123456789', '') and string-length(.) &gt; 2) or starts-with(.,'clean') or (starts-with(., 'test') and 'test' = translate(., '0123456789', '') and string-length(.) &gt; 4)]) and not(ancestor::page-block/@pb-name[(starts-with(., 'as') and 'as' = translate(., '0123456789', '') and string-length(.) &gt; 2) or starts-with(.,'clean') or (starts-with(., 'test') and 'test' = translate(., '0123456789', '') and string-length(.) &gt; 4)]) and not(ancestor::ata-page-block/@pb-name[(starts-with(., 'fc') and 'fc' = translate(., '0123456789', '') and string-length(.) &gt; 2) or starts-with(.,'repair') or .='trouble']) and not(ancestor::page-block/@pb-name[(starts-with(., 'fc') and 'fc' = translate(., '0123456789', '') and string-length(.) &gt; 2) or starts-with(.,'repair') or .='trouble']) and not(ancestor::ata-page-block/@pb-name[starts-with(.,'storage') or (starts-with(., 'to') and 'to' = translate(., '0123456789', '') and string-length(.) &gt; 2)]) and (ancestor::page-block/@pb-name[starts-with(.,'storage') or (starts-with(., 'to') and 'to' = translate(., '0123456789', '') and string-length(.) &gt; 2)])">
            <xsl:variable name="node-id" select="generate-id(.)"/>
            <xsl:variable name="from-node" select="(ancestor-or-self::page-block[not(ancestor::page-block)])[last()]"/>
            <xsl:variable name="num">
               <xsl:variable name="candidate-num">
                  <xsl:choose>
                     <xsl:when test="count($from-node) &gt; 0">
                        <xsl:for-each select="$from-node/descendant-or-self::*[@_gte:count-as-id='cnt__table^page-block.cnt']">
                           <xsl:if test="generate-id(.) = $node-id">
                              <xsl:value-of select="position()"/>
                           </xsl:if>
                        </xsl:for-each>
                     </xsl:when>
                     <xsl:otherwise>
                        <xsl:for-each select="//*[@_gte:count-as-id='cnt__table^page-block.cnt'][not(ancestor-or-self::page-block)]">
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
            <xsl:variable name="offset">
               <!--Evaluate startAtXPath using the first counted element within the numbering scope as the context node-->
               <xsl:variable name="initial-num">
                  <xsl:choose>
                     <xsl:when test="count($from-node) &gt; 0">
                        <xsl:apply-templates select="($from-node/descendant-or-self::*[@_gte:count-as-id='cnt__table^page-block.cnt'])[1]" mode="startat-xpath"/>
                     </xsl:when>
                     <xsl:otherwise>
                        <xsl:apply-templates select="(//*[@_gte:count-as-id='cnt__table^page-block.cnt'][not(ancestor-or-self::page-block)])[1]" mode="startat-xpath"/>
                     </xsl:otherwise>
                  </xsl:choose>
               </xsl:variable>
               <xsl:choose>
                  <xsl:when test="string(number($initial-num))!='NaN'">
                     <xsl:value-of select="$initial-num"/>
                  </xsl:when>
                  <xsl:otherwise>1</xsl:otherwise>
               </xsl:choose>
            </xsl:variable>
            <xsl:choose>
               <xsl:when test="string(number($num))!='NaN'">
                  <xsl:number value="$num + $offset - 1" format="1"/>
               </xsl:when>
               <xsl:otherwise>?</xsl:otherwise>
            </xsl:choose>
         </xsl:when>
         <xsl:when test="not(ancestor::book[contains(@doctype,'cir') or contains(@doctype,'em') or contains(@doctype,'tmm')]) and not(ancestor::book[contains(@doctype,'oh')] and ancestor::ata-page-block/@pb-name[.='service']) and not(ancestor::book[contains(@doctype,'oh')] and ancestor::page-block/@pb-name[.='service']) and not(ancestor::ata-page-block/@pb-name[.='00awl' or .='00intro' or .='airlim' or .='awl' or .='awlror' or .='chapsect' or .='consume' or .='d-and-o' or .='frontmatte' or .='howtouse' or .='00howtouse' or .='intro' or .='nut_option' or .='oplimits' or .='sblist' or .='schedchk' or .='spectool' or .='timelim' or .='title-page']) and not(ancestor::page-block/@pb-name[.='00awl' or .='00intro' or .='airlim' or .='awl' or .='awlror' or .='chapsect' or .='consume' or .='d-and-o' or .='frontmatte' or .='howtouse' or .='00howtouse' or .='intro' or .='nut_option' or .='oplimits' or .='sblist' or .='schedchk' or .='spectool' or .='timelim' or .='title-page']) and not(ancestor::ata-page-block/@pb-name[(starts-with(., 'do') and 'do' = translate(., '0123456789', '') and string-length(.) &gt; 2) or (starts-with(., 'in') and 'in' = translate(., '0123456789', '') and string-length(.) &gt; 2) or (starts-with(., 'tl') and 'tl' = translate(., '0123456789', '') and string-length(.) &gt; 2) or .='toolsht' or .='trlist' or .='unschedc' or .='unschedchk']) and not(ancestor::page-block/@pb-name[(starts-with(., 'do') and 'do' = translate(., '0123456789', '') and string-length(.) &gt; 2) or (starts-with(., 'in') and 'in' = translate(., '0123456789', '') and string-length(.) &gt; 2) or (starts-with(., 'tl') and 'tl' = translate(., '0123456789', '') and string-length(.) &gt; 2) or .='toolsht' or .='trlist' or .='unschedc' or .='unschedchk']) and not(ancestor-or-self::ata-page-block[1]/@pb-name and string(ancestor-or-self::ata-page-block[1]/@pb-name)='intro00') and not(ancestor-or-self::page-block[1]/@pb-name and string(ancestor-or-self::page-block[1]/@pb-name)='intro00') and not(ancestor::ata-page-block/@pb-name[starts-with(., 'disassy') or starts-with(., 'fault')]) and not(ancestor::page-block/@pb-name[starts-with(., 'disassy') or starts-with(., 'fault')]) and not(ancestor::book[contains(@doctype,'oh')] and ancestor::ata-page-block/@pb-name[starts-with(., 'clean')]) and not(ancestor::book[contains(@doctype,'oh')] and ancestor::page-block/@pb-name[starts-with(., 'clean')]) and not(ancestor::ata-page-block/@pb-name[starts-with(., 'mainprac')]) and not(ancestor::page-block/@pb-name[starts-with(., 'mainprac')]) and not(ancestor::book[contains(@doctype,'oh')] and ancestor::ata-page-block/@pb-name[starts-with(., 'inspect')]) and not(ancestor::book[contains(@doctype,'oh')] and ancestor::page-block/@pb-name[starts-with(., 'inspect')]) and not(ancestor::ata-page-block/@pb-name[(starts-with(., 'di') and 'di' = translate(., '0123456789', '') and string-length(.) &gt; 2) or starts-with(.,'service')]) and not(ancestor::page-block/@pb-name[(starts-with(., 'di') and 'di' = translate(., '0123456789', '') and string-length(.) &gt; 2) or starts-with(.,'service')]) and not(ancestor::book[contains(@doctype,'oh')] and ancestor::ata-page-block/@pb-name[starts-with(., 'repair')]) and not(ancestor::book[contains(@doctype,'oh')] and ancestor::page-block/@pb-name[starts-with(., 'repair')]) and not(ancestor::book[contains(@doctype,'oh')] and ancestor::ata-page-block/@pb-name[starts-with(., 'test')]) and not(ancestor::book[contains(@doctype,'oh')] and ancestor::page-block/@pb-name[starts-with(., 'test')]) and not(ancestor::ata-page-block/@pb-name[(starts-with(., 'cl') and 'cl' = translate(., '0123456789', '') and string-length(.) &gt; 2) or .='install' or starts-with(.,'rem-inst') or (starts-with(., 'reminst') and 'reminst' = translate(., '0123456789', '') and string-length(.) &gt; 7) or .='remove' or (starts-with(., 'repair') and 'repair' = translate(., '0123456789', '') and string-length(.) &gt; 6)]) and not(ancestor::page-block/@pb-name[(starts-with(., 'cl') and 'cl' = translate(., '0123456789', '') and string-length(.) &gt; 2) or .='install' or starts-with(.,'rem-inst') or (starts-with(., 'reminst') and 'reminst' = translate(., '0123456789', '') and string-length(.) &gt; 7) or .='remove' or (starts-with(., 'repair') and 'repair' = translate(., '0123456789', '') and string-length(.) &gt; 6)]) and not(ancestor::ata-page-block/@pb-name[starts-with(., 'assy') or (starts-with(., 'ic') and 'ic' = translate(., '0123456789', '') and string-length(.) &gt; 2) or (starts-with(., 'te') and 'te' = translate(., '0123456789', '') and string-length(.) &gt; 2) or .='test']) and not(ancestor::page-block/@pb-name[starts-with(., 'assy') or (starts-with(., 'ic') and 'ic' = translate(., '0123456789', '') and string-length(.) &gt; 2) or (starts-with(., 'te') and 'te' = translate(., '0123456789', '') and string-length(.) &gt; 2) or .='test']) and not(ancestor::ata-page-block/@pb-name[.='f-and-c' or starts-with(., 'inspect') or (starts-with(., 're') and 're' = translate(., '0123456789', '') and string-length(.) &gt; 2)]) and not(ancestor::page-block/@pb-name[.='f-and-c' or starts-with(., 'inspect') or (starts-with(., 're') and 're' = translate(., '0123456789', '') and string-length(.) &gt; 2)]) and not(ancestor::ata-page-block/@pb-name[(starts-with(., 'as') and 'as' = translate(., '0123456789', '') and string-length(.) &gt; 2) or starts-with(.,'clean') or (starts-with(., 'test') and 'test' = translate(., '0123456789', '') and string-length(.) &gt; 4)]) and not(ancestor::page-block/@pb-name[(starts-with(., 'as') and 'as' = translate(., '0123456789', '') and string-length(.) &gt; 2) or starts-with(.,'clean') or (starts-with(., 'test') and 'test' = translate(., '0123456789', '') and string-length(.) &gt; 4)]) and not(ancestor::ata-page-block/@pb-name[(starts-with(., 'fc') and 'fc' = translate(., '0123456789', '') and string-length(.) &gt; 2) or starts-with(.,'repair') or .='trouble']) and not(ancestor::page-block/@pb-name[(starts-with(., 'fc') and 'fc' = translate(., '0123456789', '') and string-length(.) &gt; 2) or starts-with(.,'repair') or .='trouble']) and (ancestor::ata-page-block/@pb-name[starts-with(.,'storage') or (starts-with(., 'to') and 'to' = translate(., '0123456789', '') and string-length(.) &gt; 2)])">
            <xsl:variable name="node-id" select="generate-id(.)"/>
            <xsl:variable name="from-node" select="(ancestor-or-self::ata-page-block[not(ancestor::ata-page-block)])[last()]"/>
            <xsl:variable name="num">
               <xsl:variable name="candidate-num">
                  <xsl:choose>
                     <xsl:when test="count($from-node) &gt; 0">
                        <xsl:for-each select="$from-node/descendant-or-self::*[@_gte:count-as-id='cnt__table^ata-page-block.cnt']">
                           <xsl:if test="generate-id(.) = $node-id">
                              <xsl:value-of select="position()"/>
                           </xsl:if>
                        </xsl:for-each>
                     </xsl:when>
                     <xsl:otherwise>
                        <xsl:for-each select="//*[@_gte:count-as-id='cnt__table^ata-page-block.cnt'][not(ancestor-or-self::ata-page-block)]">
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
            <xsl:variable name="offset">
               <!--Evaluate startAtXPath using the first counted element within the numbering scope as the context node-->
               <xsl:variable name="initial-num">
                  <xsl:choose>
                     <xsl:when test="count($from-node) &gt; 0">
                        <xsl:apply-templates select="($from-node/descendant-or-self::*[@_gte:count-as-id='cnt__table^ata-page-block.cnt'])[1]" mode="startat-xpath"/>
                     </xsl:when>
                     <xsl:otherwise>
                        <xsl:apply-templates select="(//*[@_gte:count-as-id='cnt__table^ata-page-block.cnt'][not(ancestor-or-self::ata-page-block)])[1]" mode="startat-xpath"/>
                     </xsl:otherwise>
                  </xsl:choose>
               </xsl:variable>
               <xsl:choose>
                  <xsl:when test="string(number($initial-num))!='NaN'">
                     <xsl:value-of select="$initial-num"/>
                  </xsl:when>
                  <xsl:otherwise>1</xsl:otherwise>
               </xsl:choose>
            </xsl:variable>
            <xsl:choose>
               <xsl:when test="string(number($num))!='NaN'">
                  <xsl:number value="$num + $offset - 1" format="1"/>
               </xsl:when>
               <xsl:otherwise>?</xsl:otherwise>
            </xsl:choose>
         </xsl:when>
         <xsl:when test="not(ancestor::book[contains(@doctype,'cir') or contains(@doctype,'em') or contains(@doctype,'tmm')]) and not(ancestor::book[contains(@doctype,'oh')] and ancestor::ata-page-block/@pb-name[.='service']) and not(ancestor::book[contains(@doctype,'oh')] and ancestor::page-block/@pb-name[.='service']) and not(ancestor::ata-page-block/@pb-name[.='00awl' or .='00intro' or .='airlim' or .='awl' or .='awlror' or .='chapsect' or .='consume' or .='d-and-o' or .='frontmatte' or .='howtouse' or .='00howtouse' or .='intro' or .='nut_option' or .='oplimits' or .='sblist' or .='schedchk' or .='spectool' or .='timelim' or .='title-page']) and not(ancestor::page-block/@pb-name[.='00awl' or .='00intro' or .='airlim' or .='awl' or .='awlror' or .='chapsect' or .='consume' or .='d-and-o' or .='frontmatte' or .='howtouse' or .='00howtouse' or .='intro' or .='nut_option' or .='oplimits' or .='sblist' or .='schedchk' or .='spectool' or .='timelim' or .='title-page']) and not(ancestor::ata-page-block/@pb-name[(starts-with(., 'do') and 'do' = translate(., '0123456789', '') and string-length(.) &gt; 2) or (starts-with(., 'in') and 'in' = translate(., '0123456789', '') and string-length(.) &gt; 2) or (starts-with(., 'tl') and 'tl' = translate(., '0123456789', '') and string-length(.) &gt; 2) or .='toolsht' or .='trlist' or .='unschedc' or .='unschedchk']) and not(ancestor::page-block/@pb-name[(starts-with(., 'do') and 'do' = translate(., '0123456789', '') and string-length(.) &gt; 2) or (starts-with(., 'in') and 'in' = translate(., '0123456789', '') and string-length(.) &gt; 2) or (starts-with(., 'tl') and 'tl' = translate(., '0123456789', '') and string-length(.) &gt; 2) or .='toolsht' or .='trlist' or .='unschedc' or .='unschedchk']) and not(ancestor-or-self::ata-page-block[1]/@pb-name and string(ancestor-or-self::ata-page-block[1]/@pb-name)='intro00') and not(ancestor-or-self::page-block[1]/@pb-name and string(ancestor-or-self::page-block[1]/@pb-name)='intro00') and not(ancestor::ata-page-block/@pb-name[starts-with(., 'disassy') or starts-with(., 'fault')]) and not(ancestor::page-block/@pb-name[starts-with(., 'disassy') or starts-with(., 'fault')]) and not(ancestor::book[contains(@doctype,'oh')] and ancestor::ata-page-block/@pb-name[starts-with(., 'clean')]) and not(ancestor::book[contains(@doctype,'oh')] and ancestor::page-block/@pb-name[starts-with(., 'clean')]) and not(ancestor::ata-page-block/@pb-name[starts-with(., 'mainprac')]) and not(ancestor::page-block/@pb-name[starts-with(., 'mainprac')]) and not(ancestor::book[contains(@doctype,'oh')] and ancestor::ata-page-block/@pb-name[starts-with(., 'inspect')]) and not(ancestor::book[contains(@doctype,'oh')] and ancestor::page-block/@pb-name[starts-with(., 'inspect')]) and not(ancestor::ata-page-block/@pb-name[(starts-with(., 'di') and 'di' = translate(., '0123456789', '') and string-length(.) &gt; 2) or starts-with(.,'service')]) and not(ancestor::page-block/@pb-name[(starts-with(., 'di') and 'di' = translate(., '0123456789', '') and string-length(.) &gt; 2) or starts-with(.,'service')]) and not(ancestor::book[contains(@doctype,'oh')] and ancestor::ata-page-block/@pb-name[starts-with(., 'repair')]) and not(ancestor::book[contains(@doctype,'oh')] and ancestor::page-block/@pb-name[starts-with(., 'repair')]) and not(ancestor::book[contains(@doctype,'oh')] and ancestor::ata-page-block/@pb-name[starts-with(., 'test')]) and not(ancestor::book[contains(@doctype,'oh')] and ancestor::page-block/@pb-name[starts-with(., 'test')]) and not(ancestor::ata-page-block/@pb-name[(starts-with(., 'cl') and 'cl' = translate(., '0123456789', '') and string-length(.) &gt; 2) or .='install' or starts-with(.,'rem-inst') or (starts-with(., 'reminst') and 'reminst' = translate(., '0123456789', '') and string-length(.) &gt; 7) or .='remove' or (starts-with(., 'repair') and 'repair' = translate(., '0123456789', '') and string-length(.) &gt; 6)]) and not(ancestor::page-block/@pb-name[(starts-with(., 'cl') and 'cl' = translate(., '0123456789', '') and string-length(.) &gt; 2) or .='install' or starts-with(.,'rem-inst') or (starts-with(., 'reminst') and 'reminst' = translate(., '0123456789', '') and string-length(.) &gt; 7) or .='remove' or (starts-with(., 'repair') and 'repair' = translate(., '0123456789', '') and string-length(.) &gt; 6)]) and not(ancestor::ata-page-block/@pb-name[starts-with(., 'assy') or (starts-with(., 'ic') and 'ic' = translate(., '0123456789', '') and string-length(.) &gt; 2) or (starts-with(., 'te') and 'te' = translate(., '0123456789', '') and string-length(.) &gt; 2) or .='test']) and not(ancestor::page-block/@pb-name[starts-with(., 'assy') or (starts-with(., 'ic') and 'ic' = translate(., '0123456789', '') and string-length(.) &gt; 2) or (starts-with(., 'te') and 'te' = translate(., '0123456789', '') and string-length(.) &gt; 2) or .='test']) and not(ancestor::ata-page-block/@pb-name[.='f-and-c' or starts-with(., 'inspect') or (starts-with(., 're') and 're' = translate(., '0123456789', '') and string-length(.) &gt; 2)]) and not(ancestor::page-block/@pb-name[.='f-and-c' or starts-with(., 'inspect') or (starts-with(., 're') and 're' = translate(., '0123456789', '') and string-length(.) &gt; 2)]) and not(ancestor::ata-page-block/@pb-name[(starts-with(., 'as') and 'as' = translate(., '0123456789', '') and string-length(.) &gt; 2) or starts-with(.,'clean') or (starts-with(., 'test') and 'test' = translate(., '0123456789', '') and string-length(.) &gt; 4)]) and not(ancestor::page-block/@pb-name[(starts-with(., 'as') and 'as' = translate(., '0123456789', '') and string-length(.) &gt; 2) or starts-with(.,'clean') or (starts-with(., 'test') and 'test' = translate(., '0123456789', '') and string-length(.) &gt; 4)]) and not(ancestor::ata-page-block/@pb-name[(starts-with(., 'fc') and 'fc' = translate(., '0123456789', '') and string-length(.) &gt; 2) or starts-with(.,'repair') or .='trouble']) and (ancestor::page-block/@pb-name[(starts-with(., 'fc') and 'fc' = translate(., '0123456789', '') and string-length(.) &gt; 2) or starts-with(.,'repair') or .='trouble'])">
            <xsl:variable name="node-id" select="generate-id(.)"/>
            <xsl:variable name="from-node" select="(ancestor-or-self::page-block[not(ancestor::page-block)])[last()]"/>
            <xsl:variable name="num">
               <xsl:variable name="candidate-num">
                  <xsl:choose>
                     <xsl:when test="count($from-node) &gt; 0">
                        <xsl:for-each select="$from-node/descendant-or-self::*[@_gte:count-as-id='cnt__table^page-block.cnt']">
                           <xsl:if test="generate-id(.) = $node-id">
                              <xsl:value-of select="position()"/>
                           </xsl:if>
                        </xsl:for-each>
                     </xsl:when>
                     <xsl:otherwise>
                        <xsl:for-each select="//*[@_gte:count-as-id='cnt__table^page-block.cnt'][not(ancestor-or-self::page-block)]">
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
            <xsl:variable name="offset">
               <!--Evaluate startAtXPath using the first counted element within the numbering scope as the context node-->
               <xsl:variable name="initial-num">
                  <xsl:choose>
                     <xsl:when test="count($from-node) &gt; 0">
                        <xsl:apply-templates select="($from-node/descendant-or-self::*[@_gte:count-as-id='cnt__table^page-block.cnt'])[1]" mode="startat-xpath"/>
                     </xsl:when>
                     <xsl:otherwise>
                        <xsl:apply-templates select="(//*[@_gte:count-as-id='cnt__table^page-block.cnt'][not(ancestor-or-self::page-block)])[1]" mode="startat-xpath"/>
                     </xsl:otherwise>
                  </xsl:choose>
               </xsl:variable>
               <xsl:choose>
                  <xsl:when test="string(number($initial-num))!='NaN'">
                     <xsl:value-of select="$initial-num"/>
                  </xsl:when>
                  <xsl:otherwise>1</xsl:otherwise>
               </xsl:choose>
            </xsl:variable>
            <xsl:choose>
               <xsl:when test="string(number($num))!='NaN'">
                  <xsl:number value="$num + $offset - 1" format="1"/>
               </xsl:when>
               <xsl:otherwise>?</xsl:otherwise>
            </xsl:choose>
         </xsl:when>
         <xsl:when test="not(ancestor::book[contains(@doctype,'cir') or contains(@doctype,'em') or contains(@doctype,'tmm')]) and not(ancestor::book[contains(@doctype,'oh')] and ancestor::ata-page-block/@pb-name[.='service']) and not(ancestor::book[contains(@doctype,'oh')] and ancestor::page-block/@pb-name[.='service']) and not(ancestor::ata-page-block/@pb-name[.='00awl' or .='00intro' or .='airlim' or .='awl' or .='awlror' or .='chapsect' or .='consume' or .='d-and-o' or .='frontmatte' or .='howtouse' or .='00howtouse' or .='intro' or .='nut_option' or .='oplimits' or .='sblist' or .='schedchk' or .='spectool' or .='timelim' or .='title-page']) and not(ancestor::page-block/@pb-name[.='00awl' or .='00intro' or .='airlim' or .='awl' or .='awlror' or .='chapsect' or .='consume' or .='d-and-o' or .='frontmatte' or .='howtouse' or .='00howtouse' or .='intro' or .='nut_option' or .='oplimits' or .='sblist' or .='schedchk' or .='spectool' or .='timelim' or .='title-page']) and not(ancestor::ata-page-block/@pb-name[(starts-with(., 'do') and 'do' = translate(., '0123456789', '') and string-length(.) &gt; 2) or (starts-with(., 'in') and 'in' = translate(., '0123456789', '') and string-length(.) &gt; 2) or (starts-with(., 'tl') and 'tl' = translate(., '0123456789', '') and string-length(.) &gt; 2) or .='toolsht' or .='trlist' or .='unschedc' or .='unschedchk']) and not(ancestor::page-block/@pb-name[(starts-with(., 'do') and 'do' = translate(., '0123456789', '') and string-length(.) &gt; 2) or (starts-with(., 'in') and 'in' = translate(., '0123456789', '') and string-length(.) &gt; 2) or (starts-with(., 'tl') and 'tl' = translate(., '0123456789', '') and string-length(.) &gt; 2) or .='toolsht' or .='trlist' or .='unschedc' or .='unschedchk']) and not(ancestor-or-self::ata-page-block[1]/@pb-name and string(ancestor-or-self::ata-page-block[1]/@pb-name)='intro00') and not(ancestor-or-self::page-block[1]/@pb-name and string(ancestor-or-self::page-block[1]/@pb-name)='intro00') and not(ancestor::ata-page-block/@pb-name[starts-with(., 'disassy') or starts-with(., 'fault')]) and not(ancestor::page-block/@pb-name[starts-with(., 'disassy') or starts-with(., 'fault')]) and not(ancestor::book[contains(@doctype,'oh')] and ancestor::ata-page-block/@pb-name[starts-with(., 'clean')]) and not(ancestor::book[contains(@doctype,'oh')] and ancestor::page-block/@pb-name[starts-with(., 'clean')]) and not(ancestor::ata-page-block/@pb-name[starts-with(., 'mainprac')]) and not(ancestor::page-block/@pb-name[starts-with(., 'mainprac')]) and not(ancestor::book[contains(@doctype,'oh')] and ancestor::ata-page-block/@pb-name[starts-with(., 'inspect')]) and not(ancestor::book[contains(@doctype,'oh')] and ancestor::page-block/@pb-name[starts-with(., 'inspect')]) and not(ancestor::ata-page-block/@pb-name[(starts-with(., 'di') and 'di' = translate(., '0123456789', '') and string-length(.) &gt; 2) or starts-with(.,'service')]) and not(ancestor::page-block/@pb-name[(starts-with(., 'di') and 'di' = translate(., '0123456789', '') and string-length(.) &gt; 2) or starts-with(.,'service')]) and not(ancestor::book[contains(@doctype,'oh')] and ancestor::ata-page-block/@pb-name[starts-with(., 'repair')]) and not(ancestor::book[contains(@doctype,'oh')] and ancestor::page-block/@pb-name[starts-with(., 'repair')]) and not(ancestor::book[contains(@doctype,'oh')] and ancestor::ata-page-block/@pb-name[starts-with(., 'test')]) and not(ancestor::book[contains(@doctype,'oh')] and ancestor::page-block/@pb-name[starts-with(., 'test')]) and not(ancestor::ata-page-block/@pb-name[(starts-with(., 'cl') and 'cl' = translate(., '0123456789', '') and string-length(.) &gt; 2) or .='install' or starts-with(.,'rem-inst') or (starts-with(., 'reminst') and 'reminst' = translate(., '0123456789', '') and string-length(.) &gt; 7) or .='remove' or (starts-with(., 'repair') and 'repair' = translate(., '0123456789', '') and string-length(.) &gt; 6)]) and not(ancestor::page-block/@pb-name[(starts-with(., 'cl') and 'cl' = translate(., '0123456789', '') and string-length(.) &gt; 2) or .='install' or starts-with(.,'rem-inst') or (starts-with(., 'reminst') and 'reminst' = translate(., '0123456789', '') and string-length(.) &gt; 7) or .='remove' or (starts-with(., 'repair') and 'repair' = translate(., '0123456789', '') and string-length(.) &gt; 6)]) and not(ancestor::ata-page-block/@pb-name[starts-with(., 'assy') or (starts-with(., 'ic') and 'ic' = translate(., '0123456789', '') and string-length(.) &gt; 2) or (starts-with(., 'te') and 'te' = translate(., '0123456789', '') and string-length(.) &gt; 2) or .='test']) and not(ancestor::page-block/@pb-name[starts-with(., 'assy') or (starts-with(., 'ic') and 'ic' = translate(., '0123456789', '') and string-length(.) &gt; 2) or (starts-with(., 'te') and 'te' = translate(., '0123456789', '') and string-length(.) &gt; 2) or .='test']) and not(ancestor::ata-page-block/@pb-name[.='f-and-c' or starts-with(., 'inspect') or (starts-with(., 're') and 're' = translate(., '0123456789', '') and string-length(.) &gt; 2)]) and not(ancestor::page-block/@pb-name[.='f-and-c' or starts-with(., 'inspect') or (starts-with(., 're') and 're' = translate(., '0123456789', '') and string-length(.) &gt; 2)]) and not(ancestor::ata-page-block/@pb-name[(starts-with(., 'as') and 'as' = translate(., '0123456789', '') and string-length(.) &gt; 2) or starts-with(.,'clean') or (starts-with(., 'test') and 'test' = translate(., '0123456789', '') and string-length(.) &gt; 4)]) and not(ancestor::page-block/@pb-name[(starts-with(., 'as') and 'as' = translate(., '0123456789', '') and string-length(.) &gt; 2) or starts-with(.,'clean') or (starts-with(., 'test') and 'test' = translate(., '0123456789', '') and string-length(.) &gt; 4)]) and (ancestor::ata-page-block/@pb-name[(starts-with(., 'fc') and 'fc' = translate(., '0123456789', '') and string-length(.) &gt; 2) or starts-with(.,'repair') or .='trouble'])">
            <xsl:variable name="node-id" select="generate-id(.)"/>
            <xsl:variable name="from-node" select="(ancestor-or-self::ata-page-block[not(ancestor::ata-page-block)])[last()]"/>
            <xsl:variable name="num">
               <xsl:variable name="candidate-num">
                  <xsl:choose>
                     <xsl:when test="count($from-node) &gt; 0">
                        <xsl:for-each select="$from-node/descendant-or-self::*[@_gte:count-as-id='cnt__table^ata-page-block.cnt']">
                           <xsl:if test="generate-id(.) = $node-id">
                              <xsl:value-of select="position()"/>
                           </xsl:if>
                        </xsl:for-each>
                     </xsl:when>
                     <xsl:otherwise>
                        <xsl:for-each select="//*[@_gte:count-as-id='cnt__table^ata-page-block.cnt'][not(ancestor-or-self::ata-page-block)]">
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
            <xsl:variable name="offset">
               <!--Evaluate startAtXPath using the first counted element within the numbering scope as the context node-->
               <xsl:variable name="initial-num">
                  <xsl:choose>
                     <xsl:when test="count($from-node) &gt; 0">
                        <xsl:apply-templates select="($from-node/descendant-or-self::*[@_gte:count-as-id='cnt__table^ata-page-block.cnt'])[1]" mode="startat-xpath"/>
                     </xsl:when>
                     <xsl:otherwise>
                        <xsl:apply-templates select="(//*[@_gte:count-as-id='cnt__table^ata-page-block.cnt'][not(ancestor-or-self::ata-page-block)])[1]" mode="startat-xpath"/>
                     </xsl:otherwise>
                  </xsl:choose>
               </xsl:variable>
               <xsl:choose>
                  <xsl:when test="string(number($initial-num))!='NaN'">
                     <xsl:value-of select="$initial-num"/>
                  </xsl:when>
                  <xsl:otherwise>1</xsl:otherwise>
               </xsl:choose>
            </xsl:variable>
            <xsl:choose>
               <xsl:when test="string(number($num))!='NaN'">
                  <xsl:number value="$num + $offset - 1" format="1"/>
               </xsl:when>
               <xsl:otherwise>?</xsl:otherwise>
            </xsl:choose>
         </xsl:when>
         <xsl:when test="not(ancestor::book[contains(@doctype,'cir') or contains(@doctype,'em') or contains(@doctype,'tmm')]) and not(ancestor::book[contains(@doctype,'oh')] and ancestor::ata-page-block/@pb-name[.='service']) and not(ancestor::book[contains(@doctype,'oh')] and ancestor::page-block/@pb-name[.='service']) and not(ancestor::ata-page-block/@pb-name[.='00awl' or .='00intro' or .='airlim' or .='awl' or .='awlror' or .='chapsect' or .='consume' or .='d-and-o' or .='frontmatte' or .='howtouse' or .='00howtouse' or .='intro' or .='nut_option' or .='oplimits' or .='sblist' or .='schedchk' or .='spectool' or .='timelim' or .='title-page']) and not(ancestor::page-block/@pb-name[.='00awl' or .='00intro' or .='airlim' or .='awl' or .='awlror' or .='chapsect' or .='consume' or .='d-and-o' or .='frontmatte' or .='howtouse' or .='00howtouse' or .='intro' or .='nut_option' or .='oplimits' or .='sblist' or .='schedchk' or .='spectool' or .='timelim' or .='title-page']) and not(ancestor::ata-page-block/@pb-name[(starts-with(., 'do') and 'do' = translate(., '0123456789', '') and string-length(.) &gt; 2) or (starts-with(., 'in') and 'in' = translate(., '0123456789', '') and string-length(.) &gt; 2) or (starts-with(., 'tl') and 'tl' = translate(., '0123456789', '') and string-length(.) &gt; 2) or .='toolsht' or .='trlist' or .='unschedc' or .='unschedchk']) and not(ancestor::page-block/@pb-name[(starts-with(., 'do') and 'do' = translate(., '0123456789', '') and string-length(.) &gt; 2) or (starts-with(., 'in') and 'in' = translate(., '0123456789', '') and string-length(.) &gt; 2) or (starts-with(., 'tl') and 'tl' = translate(., '0123456789', '') and string-length(.) &gt; 2) or .='toolsht' or .='trlist' or .='unschedc' or .='unschedchk']) and not(ancestor-or-self::ata-page-block[1]/@pb-name and string(ancestor-or-self::ata-page-block[1]/@pb-name)='intro00') and not(ancestor-or-self::page-block[1]/@pb-name and string(ancestor-or-self::page-block[1]/@pb-name)='intro00') and not(ancestor::ata-page-block/@pb-name[starts-with(., 'disassy') or starts-with(., 'fault')]) and not(ancestor::page-block/@pb-name[starts-with(., 'disassy') or starts-with(., 'fault')]) and not(ancestor::book[contains(@doctype,'oh')] and ancestor::ata-page-block/@pb-name[starts-with(., 'clean')]) and not(ancestor::book[contains(@doctype,'oh')] and ancestor::page-block/@pb-name[starts-with(., 'clean')]) and not(ancestor::ata-page-block/@pb-name[starts-with(., 'mainprac')]) and not(ancestor::page-block/@pb-name[starts-with(., 'mainprac')]) and not(ancestor::book[contains(@doctype,'oh')] and ancestor::ata-page-block/@pb-name[starts-with(., 'inspect')]) and not(ancestor::book[contains(@doctype,'oh')] and ancestor::page-block/@pb-name[starts-with(., 'inspect')]) and not(ancestor::ata-page-block/@pb-name[(starts-with(., 'di') and 'di' = translate(., '0123456789', '') and string-length(.) &gt; 2) or starts-with(.,'service')]) and not(ancestor::page-block/@pb-name[(starts-with(., 'di') and 'di' = translate(., '0123456789', '') and string-length(.) &gt; 2) or starts-with(.,'service')]) and not(ancestor::book[contains(@doctype,'oh')] and ancestor::ata-page-block/@pb-name[starts-with(., 'repair')]) and not(ancestor::book[contains(@doctype,'oh')] and ancestor::page-block/@pb-name[starts-with(., 'repair')]) and not(ancestor::book[contains(@doctype,'oh')] and ancestor::ata-page-block/@pb-name[starts-with(., 'test')]) and not(ancestor::book[contains(@doctype,'oh')] and ancestor::page-block/@pb-name[starts-with(., 'test')]) and not(ancestor::ata-page-block/@pb-name[(starts-with(., 'cl') and 'cl' = translate(., '0123456789', '') and string-length(.) &gt; 2) or .='install' or starts-with(.,'rem-inst') or (starts-with(., 'reminst') and 'reminst' = translate(., '0123456789', '') and string-length(.) &gt; 7) or .='remove' or (starts-with(., 'repair') and 'repair' = translate(., '0123456789', '') and string-length(.) &gt; 6)]) and not(ancestor::page-block/@pb-name[(starts-with(., 'cl') and 'cl' = translate(., '0123456789', '') and string-length(.) &gt; 2) or .='install' or starts-with(.,'rem-inst') or (starts-with(., 'reminst') and 'reminst' = translate(., '0123456789', '') and string-length(.) &gt; 7) or .='remove' or (starts-with(., 'repair') and 'repair' = translate(., '0123456789', '') and string-length(.) &gt; 6)]) and not(ancestor::ata-page-block/@pb-name[starts-with(., 'assy') or (starts-with(., 'ic') and 'ic' = translate(., '0123456789', '') and string-length(.) &gt; 2) or (starts-with(., 'te') and 'te' = translate(., '0123456789', '') and string-length(.) &gt; 2) or .='test']) and not(ancestor::page-block/@pb-name[starts-with(., 'assy') or (starts-with(., 'ic') and 'ic' = translate(., '0123456789', '') and string-length(.) &gt; 2) or (starts-with(., 'te') and 'te' = translate(., '0123456789', '') and string-length(.) &gt; 2) or .='test']) and not(ancestor::ata-page-block/@pb-name[.='f-and-c' or starts-with(., 'inspect') or (starts-with(., 're') and 're' = translate(., '0123456789', '') and string-length(.) &gt; 2)]) and not(ancestor::page-block/@pb-name[.='f-and-c' or starts-with(., 'inspect') or (starts-with(., 're') and 're' = translate(., '0123456789', '') and string-length(.) &gt; 2)]) and not(ancestor::ata-page-block/@pb-name[(starts-with(., 'as') and 'as' = translate(., '0123456789', '') and string-length(.) &gt; 2) or starts-with(.,'clean') or (starts-with(., 'test') and 'test' = translate(., '0123456789', '') and string-length(.) &gt; 4)]) and (ancestor::page-block/@pb-name[(starts-with(., 'as') and 'as' = translate(., '0123456789', '') and string-length(.) &gt; 2) or starts-with(.,'clean') or (starts-with(., 'test') and 'test' = translate(., '0123456789', '') and string-length(.) &gt; 4)])">
            <xsl:variable name="node-id" select="generate-id(.)"/>
            <xsl:variable name="from-node" select="(ancestor-or-self::page-block[not(ancestor::page-block)])[last()]"/>
            <xsl:variable name="num">
               <xsl:variable name="candidate-num">
                  <xsl:choose>
                     <xsl:when test="count($from-node) &gt; 0">
                        <xsl:for-each select="$from-node/descendant-or-self::*[@_gte:count-as-id='cnt__table^page-block.cnt']">
                           <xsl:if test="generate-id(.) = $node-id">
                              <xsl:value-of select="position()"/>
                           </xsl:if>
                        </xsl:for-each>
                     </xsl:when>
                     <xsl:otherwise>
                        <xsl:for-each select="//*[@_gte:count-as-id='cnt__table^page-block.cnt'][not(ancestor-or-self::page-block)]">
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
            <xsl:variable name="offset">
               <!--Evaluate startAtXPath using the first counted element within the numbering scope as the context node-->
               <xsl:variable name="initial-num">
                  <xsl:choose>
                     <xsl:when test="count($from-node) &gt; 0">
                        <xsl:apply-templates select="($from-node/descendant-or-self::*[@_gte:count-as-id='cnt__table^page-block.cnt'])[1]" mode="startat-xpath"/>
                     </xsl:when>
                     <xsl:otherwise>
                        <xsl:apply-templates select="(//*[@_gte:count-as-id='cnt__table^page-block.cnt'][not(ancestor-or-self::page-block)])[1]" mode="startat-xpath"/>
                     </xsl:otherwise>
                  </xsl:choose>
               </xsl:variable>
               <xsl:choose>
                  <xsl:when test="string(number($initial-num))!='NaN'">
                     <xsl:value-of select="$initial-num"/>
                  </xsl:when>
                  <xsl:otherwise>1</xsl:otherwise>
               </xsl:choose>
            </xsl:variable>
            <xsl:choose>
               <xsl:when test="string(number($num))!='NaN'">
                  <xsl:number value="$num + $offset - 1" format="1"/>
               </xsl:when>
               <xsl:otherwise>?</xsl:otherwise>
            </xsl:choose>
         </xsl:when>
         <xsl:when test="not(ancestor::book[contains(@doctype,'cir') or contains(@doctype,'em') or contains(@doctype,'tmm')]) and not(ancestor::book[contains(@doctype,'oh')] and ancestor::ata-page-block/@pb-name[.='service']) and not(ancestor::book[contains(@doctype,'oh')] and ancestor::page-block/@pb-name[.='service']) and not(ancestor::ata-page-block/@pb-name[.='00awl' or .='00intro' or .='airlim' or .='awl' or .='awlror' or .='chapsect' or .='consume' or .='d-and-o' or .='frontmatte' or .='howtouse' or .='00howtouse' or .='intro' or .='nut_option' or .='oplimits' or .='sblist' or .='schedchk' or .='spectool' or .='timelim' or .='title-page']) and not(ancestor::page-block/@pb-name[.='00awl' or .='00intro' or .='airlim' or .='awl' or .='awlror' or .='chapsect' or .='consume' or .='d-and-o' or .='frontmatte' or .='howtouse' or .='00howtouse' or .='intro' or .='nut_option' or .='oplimits' or .='sblist' or .='schedchk' or .='spectool' or .='timelim' or .='title-page']) and not(ancestor::ata-page-block/@pb-name[(starts-with(., 'do') and 'do' = translate(., '0123456789', '') and string-length(.) &gt; 2) or (starts-with(., 'in') and 'in' = translate(., '0123456789', '') and string-length(.) &gt; 2) or (starts-with(., 'tl') and 'tl' = translate(., '0123456789', '') and string-length(.) &gt; 2) or .='toolsht' or .='trlist' or .='unschedc' or .='unschedchk']) and not(ancestor::page-block/@pb-name[(starts-with(., 'do') and 'do' = translate(., '0123456789', '') and string-length(.) &gt; 2) or (starts-with(., 'in') and 'in' = translate(., '0123456789', '') and string-length(.) &gt; 2) or (starts-with(., 'tl') and 'tl' = translate(., '0123456789', '') and string-length(.) &gt; 2) or .='toolsht' or .='trlist' or .='unschedc' or .='unschedchk']) and not(ancestor-or-self::ata-page-block[1]/@pb-name and string(ancestor-or-self::ata-page-block[1]/@pb-name)='intro00') and not(ancestor-or-self::page-block[1]/@pb-name and string(ancestor-or-self::page-block[1]/@pb-name)='intro00') and not(ancestor::ata-page-block/@pb-name[starts-with(., 'disassy') or starts-with(., 'fault')]) and not(ancestor::page-block/@pb-name[starts-with(., 'disassy') or starts-with(., 'fault')]) and not(ancestor::book[contains(@doctype,'oh')] and ancestor::ata-page-block/@pb-name[starts-with(., 'clean')]) and not(ancestor::book[contains(@doctype,'oh')] and ancestor::page-block/@pb-name[starts-with(., 'clean')]) and not(ancestor::ata-page-block/@pb-name[starts-with(., 'mainprac')]) and not(ancestor::page-block/@pb-name[starts-with(., 'mainprac')]) and not(ancestor::book[contains(@doctype,'oh')] and ancestor::ata-page-block/@pb-name[starts-with(., 'inspect')]) and not(ancestor::book[contains(@doctype,'oh')] and ancestor::page-block/@pb-name[starts-with(., 'inspect')]) and not(ancestor::ata-page-block/@pb-name[(starts-with(., 'di') and 'di' = translate(., '0123456789', '') and string-length(.) &gt; 2) or starts-with(.,'service')]) and not(ancestor::page-block/@pb-name[(starts-with(., 'di') and 'di' = translate(., '0123456789', '') and string-length(.) &gt; 2) or starts-with(.,'service')]) and not(ancestor::book[contains(@doctype,'oh')] and ancestor::ata-page-block/@pb-name[starts-with(., 'repair')]) and not(ancestor::book[contains(@doctype,'oh')] and ancestor::page-block/@pb-name[starts-with(., 'repair')]) and not(ancestor::book[contains(@doctype,'oh')] and ancestor::ata-page-block/@pb-name[starts-with(., 'test')]) and not(ancestor::book[contains(@doctype,'oh')] and ancestor::page-block/@pb-name[starts-with(., 'test')]) and not(ancestor::ata-page-block/@pb-name[(starts-with(., 'cl') and 'cl' = translate(., '0123456789', '') and string-length(.) &gt; 2) or .='install' or starts-with(.,'rem-inst') or (starts-with(., 'reminst') and 'reminst' = translate(., '0123456789', '') and string-length(.) &gt; 7) or .='remove' or (starts-with(., 'repair') and 'repair' = translate(., '0123456789', '') and string-length(.) &gt; 6)]) and not(ancestor::page-block/@pb-name[(starts-with(., 'cl') and 'cl' = translate(., '0123456789', '') and string-length(.) &gt; 2) or .='install' or starts-with(.,'rem-inst') or (starts-with(., 'reminst') and 'reminst' = translate(., '0123456789', '') and string-length(.) &gt; 7) or .='remove' or (starts-with(., 'repair') and 'repair' = translate(., '0123456789', '') and string-length(.) &gt; 6)]) and not(ancestor::ata-page-block/@pb-name[starts-with(., 'assy') or (starts-with(., 'ic') and 'ic' = translate(., '0123456789', '') and string-length(.) &gt; 2) or (starts-with(., 'te') and 'te' = translate(., '0123456789', '') and string-length(.) &gt; 2) or .='test']) and not(ancestor::page-block/@pb-name[starts-with(., 'assy') or (starts-with(., 'ic') and 'ic' = translate(., '0123456789', '') and string-length(.) &gt; 2) or (starts-with(., 'te') and 'te' = translate(., '0123456789', '') and string-length(.) &gt; 2) or .='test']) and not(ancestor::ata-page-block/@pb-name[.='f-and-c' or starts-with(., 'inspect') or (starts-with(., 're') and 're' = translate(., '0123456789', '') and string-length(.) &gt; 2)]) and not(ancestor::page-block/@pb-name[.='f-and-c' or starts-with(., 'inspect') or (starts-with(., 're') and 're' = translate(., '0123456789', '') and string-length(.) &gt; 2)]) and (ancestor::ata-page-block/@pb-name[(starts-with(., 'as') and 'as' = translate(., '0123456789', '') and string-length(.) &gt; 2) or starts-with(.,'clean') or (starts-with(., 'test') and 'test' = translate(., '0123456789', '') and string-length(.) &gt; 4)])">
            <xsl:variable name="node-id" select="generate-id(.)"/>
            <xsl:variable name="from-node" select="(ancestor-or-self::ata-page-block[not(ancestor::ata-page-block)])[last()]"/>
            <xsl:variable name="num">
               <xsl:variable name="candidate-num">
                  <xsl:choose>
                     <xsl:when test="count($from-node) &gt; 0">
                        <xsl:for-each select="$from-node/descendant-or-self::*[@_gte:count-as-id='cnt__table^ata-page-block.cnt']">
                           <xsl:if test="generate-id(.) = $node-id">
                              <xsl:value-of select="position()"/>
                           </xsl:if>
                        </xsl:for-each>
                     </xsl:when>
                     <xsl:otherwise>
                        <xsl:for-each select="//*[@_gte:count-as-id='cnt__table^ata-page-block.cnt'][not(ancestor-or-self::ata-page-block)]">
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
            <xsl:variable name="offset">
               <!--Evaluate startAtXPath using the first counted element within the numbering scope as the context node-->
               <xsl:variable name="initial-num">
                  <xsl:choose>
                     <xsl:when test="count($from-node) &gt; 0">
                        <xsl:apply-templates select="($from-node/descendant-or-self::*[@_gte:count-as-id='cnt__table^ata-page-block.cnt'])[1]" mode="startat-xpath"/>
                     </xsl:when>
                     <xsl:otherwise>
                        <xsl:apply-templates select="(//*[@_gte:count-as-id='cnt__table^ata-page-block.cnt'][not(ancestor-or-self::ata-page-block)])[1]" mode="startat-xpath"/>
                     </xsl:otherwise>
                  </xsl:choose>
               </xsl:variable>
               <xsl:choose>
                  <xsl:when test="string(number($initial-num))!='NaN'">
                     <xsl:value-of select="$initial-num"/>
                  </xsl:when>
                  <xsl:otherwise>1</xsl:otherwise>
               </xsl:choose>
            </xsl:variable>
            <xsl:choose>
               <xsl:when test="string(number($num))!='NaN'">
                  <xsl:number value="$num + $offset - 1" format="1"/>
               </xsl:when>
               <xsl:otherwise>?</xsl:otherwise>
            </xsl:choose>
         </xsl:when>
         <xsl:when test="not(ancestor::book[contains(@doctype,'cir') or contains(@doctype,'em') or contains(@doctype,'tmm')]) and not(ancestor::book[contains(@doctype,'oh')] and ancestor::ata-page-block/@pb-name[.='service']) and not(ancestor::book[contains(@doctype,'oh')] and ancestor::page-block/@pb-name[.='service']) and not(ancestor::ata-page-block/@pb-name[.='00awl' or .='00intro' or .='airlim' or .='awl' or .='awlror' or .='chapsect' or .='consume' or .='d-and-o' or .='frontmatte' or .='howtouse' or .='00howtouse' or .='intro' or .='nut_option' or .='oplimits' or .='sblist' or .='schedchk' or .='spectool' or .='timelim' or .='title-page']) and not(ancestor::page-block/@pb-name[.='00awl' or .='00intro' or .='airlim' or .='awl' or .='awlror' or .='chapsect' or .='consume' or .='d-and-o' or .='frontmatte' or .='howtouse' or .='00howtouse' or .='intro' or .='nut_option' or .='oplimits' or .='sblist' or .='schedchk' or .='spectool' or .='timelim' or .='title-page']) and not(ancestor::ata-page-block/@pb-name[(starts-with(., 'do') and 'do' = translate(., '0123456789', '') and string-length(.) &gt; 2) or (starts-with(., 'in') and 'in' = translate(., '0123456789', '') and string-length(.) &gt; 2) or (starts-with(., 'tl') and 'tl' = translate(., '0123456789', '') and string-length(.) &gt; 2) or .='toolsht' or .='trlist' or .='unschedc' or .='unschedchk']) and not(ancestor::page-block/@pb-name[(starts-with(., 'do') and 'do' = translate(., '0123456789', '') and string-length(.) &gt; 2) or (starts-with(., 'in') and 'in' = translate(., '0123456789', '') and string-length(.) &gt; 2) or (starts-with(., 'tl') and 'tl' = translate(., '0123456789', '') and string-length(.) &gt; 2) or .='toolsht' or .='trlist' or .='unschedc' or .='unschedchk']) and not(ancestor-or-self::ata-page-block[1]/@pb-name and string(ancestor-or-self::ata-page-block[1]/@pb-name)='intro00') and not(ancestor-or-self::page-block[1]/@pb-name and string(ancestor-or-self::page-block[1]/@pb-name)='intro00') and not(ancestor::ata-page-block/@pb-name[starts-with(., 'disassy') or starts-with(., 'fault')]) and not(ancestor::page-block/@pb-name[starts-with(., 'disassy') or starts-with(., 'fault')]) and not(ancestor::book[contains(@doctype,'oh')] and ancestor::ata-page-block/@pb-name[starts-with(., 'clean')]) and not(ancestor::book[contains(@doctype,'oh')] and ancestor::page-block/@pb-name[starts-with(., 'clean')]) and not(ancestor::ata-page-block/@pb-name[starts-with(., 'mainprac')]) and not(ancestor::page-block/@pb-name[starts-with(., 'mainprac')]) and not(ancestor::book[contains(@doctype,'oh')] and ancestor::ata-page-block/@pb-name[starts-with(., 'inspect')]) and not(ancestor::book[contains(@doctype,'oh')] and ancestor::page-block/@pb-name[starts-with(., 'inspect')]) and not(ancestor::ata-page-block/@pb-name[(starts-with(., 'di') and 'di' = translate(., '0123456789', '') and string-length(.) &gt; 2) or starts-with(.,'service')]) and not(ancestor::page-block/@pb-name[(starts-with(., 'di') and 'di' = translate(., '0123456789', '') and string-length(.) &gt; 2) or starts-with(.,'service')]) and not(ancestor::book[contains(@doctype,'oh')] and ancestor::ata-page-block/@pb-name[starts-with(., 'repair')]) and not(ancestor::book[contains(@doctype,'oh')] and ancestor::page-block/@pb-name[starts-with(., 'repair')]) and not(ancestor::book[contains(@doctype,'oh')] and ancestor::ata-page-block/@pb-name[starts-with(., 'test')]) and not(ancestor::book[contains(@doctype,'oh')] and ancestor::page-block/@pb-name[starts-with(., 'test')]) and not(ancestor::ata-page-block/@pb-name[(starts-with(., 'cl') and 'cl' = translate(., '0123456789', '') and string-length(.) &gt; 2) or .='install' or starts-with(.,'rem-inst') or (starts-with(., 'reminst') and 'reminst' = translate(., '0123456789', '') and string-length(.) &gt; 7) or .='remove' or (starts-with(., 'repair') and 'repair' = translate(., '0123456789', '') and string-length(.) &gt; 6)]) and not(ancestor::page-block/@pb-name[(starts-with(., 'cl') and 'cl' = translate(., '0123456789', '') and string-length(.) &gt; 2) or .='install' or starts-with(.,'rem-inst') or (starts-with(., 'reminst') and 'reminst' = translate(., '0123456789', '') and string-length(.) &gt; 7) or .='remove' or (starts-with(., 'repair') and 'repair' = translate(., '0123456789', '') and string-length(.) &gt; 6)]) and not(ancestor::ata-page-block/@pb-name[starts-with(., 'assy') or (starts-with(., 'ic') and 'ic' = translate(., '0123456789', '') and string-length(.) &gt; 2) or (starts-with(., 'te') and 'te' = translate(., '0123456789', '') and string-length(.) &gt; 2) or .='test']) and not(ancestor::page-block/@pb-name[starts-with(., 'assy') or (starts-with(., 'ic') and 'ic' = translate(., '0123456789', '') and string-length(.) &gt; 2) or (starts-with(., 'te') and 'te' = translate(., '0123456789', '') and string-length(.) &gt; 2) or .='test']) and not(ancestor::ata-page-block/@pb-name[.='f-and-c' or starts-with(., 'inspect') or (starts-with(., 're') and 're' = translate(., '0123456789', '') and string-length(.) &gt; 2)]) and (ancestor::page-block/@pb-name[.='f-and-c' or starts-with(., 'inspect') or (starts-with(., 're') and 're' = translate(., '0123456789', '') and string-length(.) &gt; 2)])">
            <xsl:variable name="node-id" select="generate-id(.)"/>
            <xsl:variable name="from-node" select="(ancestor-or-self::page-block[not(ancestor::page-block)])[last()]"/>
            <xsl:variable name="num">
               <xsl:variable name="candidate-num">
                  <xsl:choose>
                     <xsl:when test="count($from-node) &gt; 0">
                        <xsl:for-each select="$from-node/descendant-or-self::*[@_gte:count-as-id='cnt__table^page-block.cnt']">
                           <xsl:if test="generate-id(.) = $node-id">
                              <xsl:value-of select="position()"/>
                           </xsl:if>
                        </xsl:for-each>
                     </xsl:when>
                     <xsl:otherwise>
                        <xsl:for-each select="//*[@_gte:count-as-id='cnt__table^page-block.cnt'][not(ancestor-or-self::page-block)]">
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
            <xsl:variable name="offset">
               <!--Evaluate startAtXPath using the first counted element within the numbering scope as the context node-->
               <xsl:variable name="initial-num">
                  <xsl:choose>
                     <xsl:when test="count($from-node) &gt; 0">
                        <xsl:apply-templates select="($from-node/descendant-or-self::*[@_gte:count-as-id='cnt__table^page-block.cnt'])[1]" mode="startat-xpath"/>
                     </xsl:when>
                     <xsl:otherwise>
                        <xsl:apply-templates select="(//*[@_gte:count-as-id='cnt__table^page-block.cnt'][not(ancestor-or-self::page-block)])[1]" mode="startat-xpath"/>
                     </xsl:otherwise>
                  </xsl:choose>
               </xsl:variable>
               <xsl:choose>
                  <xsl:when test="string(number($initial-num))!='NaN'">
                     <xsl:value-of select="$initial-num"/>
                  </xsl:when>
                  <xsl:otherwise>1</xsl:otherwise>
               </xsl:choose>
            </xsl:variable>
            <xsl:choose>
               <xsl:when test="string(number($num))!='NaN'">
                  <xsl:number value="$num + $offset - 1" format="1"/>
               </xsl:when>
               <xsl:otherwise>?</xsl:otherwise>
            </xsl:choose>
         </xsl:when>
         <xsl:when test="not(ancestor::book[contains(@doctype,'cir') or contains(@doctype,'em') or contains(@doctype,'tmm')]) and not(ancestor::book[contains(@doctype,'oh')] and ancestor::ata-page-block/@pb-name[.='service']) and not(ancestor::book[contains(@doctype,'oh')] and ancestor::page-block/@pb-name[.='service']) and not(ancestor::ata-page-block/@pb-name[.='00awl' or .='00intro' or .='airlim' or .='awl' or .='awlror' or .='chapsect' or .='consume' or .='d-and-o' or .='frontmatte' or .='howtouse' or .='00howtouse' or .='intro' or .='nut_option' or .='oplimits' or .='sblist' or .='schedchk' or .='spectool' or .='timelim' or .='title-page']) and not(ancestor::page-block/@pb-name[.='00awl' or .='00intro' or .='airlim' or .='awl' or .='awlror' or .='chapsect' or .='consume' or .='d-and-o' or .='frontmatte' or .='howtouse' or .='00howtouse' or .='intro' or .='nut_option' or .='oplimits' or .='sblist' or .='schedchk' or .='spectool' or .='timelim' or .='title-page']) and not(ancestor::ata-page-block/@pb-name[(starts-with(., 'do') and 'do' = translate(., '0123456789', '') and string-length(.) &gt; 2) or (starts-with(., 'in') and 'in' = translate(., '0123456789', '') and string-length(.) &gt; 2) or (starts-with(., 'tl') and 'tl' = translate(., '0123456789', '') and string-length(.) &gt; 2) or .='toolsht' or .='trlist' or .='unschedc' or .='unschedchk']) and not(ancestor::page-block/@pb-name[(starts-with(., 'do') and 'do' = translate(., '0123456789', '') and string-length(.) &gt; 2) or (starts-with(., 'in') and 'in' = translate(., '0123456789', '') and string-length(.) &gt; 2) or (starts-with(., 'tl') and 'tl' = translate(., '0123456789', '') and string-length(.) &gt; 2) or .='toolsht' or .='trlist' or .='unschedc' or .='unschedchk']) and not(ancestor-or-self::ata-page-block[1]/@pb-name and string(ancestor-or-self::ata-page-block[1]/@pb-name)='intro00') and not(ancestor-or-self::page-block[1]/@pb-name and string(ancestor-or-self::page-block[1]/@pb-name)='intro00') and not(ancestor::ata-page-block/@pb-name[starts-with(., 'disassy') or starts-with(., 'fault')]) and not(ancestor::page-block/@pb-name[starts-with(., 'disassy') or starts-with(., 'fault')]) and not(ancestor::book[contains(@doctype,'oh')] and ancestor::ata-page-block/@pb-name[starts-with(., 'clean')]) and not(ancestor::book[contains(@doctype,'oh')] and ancestor::page-block/@pb-name[starts-with(., 'clean')]) and not(ancestor::ata-page-block/@pb-name[starts-with(., 'mainprac')]) and not(ancestor::page-block/@pb-name[starts-with(., 'mainprac')]) and not(ancestor::book[contains(@doctype,'oh')] and ancestor::ata-page-block/@pb-name[starts-with(., 'inspect')]) and not(ancestor::book[contains(@doctype,'oh')] and ancestor::page-block/@pb-name[starts-with(., 'inspect')]) and not(ancestor::ata-page-block/@pb-name[(starts-with(., 'di') and 'di' = translate(., '0123456789', '') and string-length(.) &gt; 2) or starts-with(.,'service')]) and not(ancestor::page-block/@pb-name[(starts-with(., 'di') and 'di' = translate(., '0123456789', '') and string-length(.) &gt; 2) or starts-with(.,'service')]) and not(ancestor::book[contains(@doctype,'oh')] and ancestor::ata-page-block/@pb-name[starts-with(., 'repair')]) and not(ancestor::book[contains(@doctype,'oh')] and ancestor::page-block/@pb-name[starts-with(., 'repair')]) and not(ancestor::book[contains(@doctype,'oh')] and ancestor::ata-page-block/@pb-name[starts-with(., 'test')]) and not(ancestor::book[contains(@doctype,'oh')] and ancestor::page-block/@pb-name[starts-with(., 'test')]) and not(ancestor::ata-page-block/@pb-name[(starts-with(., 'cl') and 'cl' = translate(., '0123456789', '') and string-length(.) &gt; 2) or .='install' or starts-with(.,'rem-inst') or (starts-with(., 'reminst') and 'reminst' = translate(., '0123456789', '') and string-length(.) &gt; 7) or .='remove' or (starts-with(., 'repair') and 'repair' = translate(., '0123456789', '') and string-length(.) &gt; 6)]) and not(ancestor::page-block/@pb-name[(starts-with(., 'cl') and 'cl' = translate(., '0123456789', '') and string-length(.) &gt; 2) or .='install' or starts-with(.,'rem-inst') or (starts-with(., 'reminst') and 'reminst' = translate(., '0123456789', '') and string-length(.) &gt; 7) or .='remove' or (starts-with(., 'repair') and 'repair' = translate(., '0123456789', '') and string-length(.) &gt; 6)]) and not(ancestor::ata-page-block/@pb-name[starts-with(., 'assy') or (starts-with(., 'ic') and 'ic' = translate(., '0123456789', '') and string-length(.) &gt; 2) or (starts-with(., 'te') and 'te' = translate(., '0123456789', '') and string-length(.) &gt; 2) or .='test']) and not(ancestor::page-block/@pb-name[starts-with(., 'assy') or (starts-with(., 'ic') and 'ic' = translate(., '0123456789', '') and string-length(.) &gt; 2) or (starts-with(., 'te') and 'te' = translate(., '0123456789', '') and string-length(.) &gt; 2) or .='test']) and (ancestor::ata-page-block/@pb-name[.='f-and-c' or starts-with(., 'inspect') or (starts-with(., 're') and 're' = translate(., '0123456789', '') and string-length(.) &gt; 2)])">
            <xsl:variable name="node-id" select="generate-id(.)"/>
            <xsl:variable name="from-node" select="(ancestor-or-self::ata-page-block[not(ancestor::ata-page-block)])[last()]"/>
            <xsl:variable name="num">
               <xsl:variable name="candidate-num">
                  <xsl:choose>
                     <xsl:when test="count($from-node) &gt; 0">
                        <xsl:for-each select="$from-node/descendant-or-self::*[@_gte:count-as-id='cnt__table^ata-page-block.cnt']">
                           <xsl:if test="generate-id(.) = $node-id">
                              <xsl:value-of select="position()"/>
                           </xsl:if>
                        </xsl:for-each>
                     </xsl:when>
                     <xsl:otherwise>
                        <xsl:for-each select="//*[@_gte:count-as-id='cnt__table^ata-page-block.cnt'][not(ancestor-or-self::ata-page-block)]">
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
            <xsl:variable name="offset">
               <!--Evaluate startAtXPath using the first counted element within the numbering scope as the context node-->
               <xsl:variable name="initial-num">
                  <xsl:choose>
                     <xsl:when test="count($from-node) &gt; 0">
                        <xsl:apply-templates select="($from-node/descendant-or-self::*[@_gte:count-as-id='cnt__table^ata-page-block.cnt'])[1]" mode="startat-xpath"/>
                     </xsl:when>
                     <xsl:otherwise>
                        <xsl:apply-templates select="(//*[@_gte:count-as-id='cnt__table^ata-page-block.cnt'][not(ancestor-or-self::ata-page-block)])[1]" mode="startat-xpath"/>
                     </xsl:otherwise>
                  </xsl:choose>
               </xsl:variable>
               <xsl:choose>
                  <xsl:when test="string(number($initial-num))!='NaN'">
                     <xsl:value-of select="$initial-num"/>
                  </xsl:when>
                  <xsl:otherwise>1</xsl:otherwise>
               </xsl:choose>
            </xsl:variable>
            <xsl:choose>
               <xsl:when test="string(number($num))!='NaN'">
                  <xsl:number value="$num + $offset - 1" format="1"/>
               </xsl:when>
               <xsl:otherwise>?</xsl:otherwise>
            </xsl:choose>
         </xsl:when>
         <xsl:when test="not(ancestor::book[contains(@doctype,'cir') or contains(@doctype,'em') or contains(@doctype,'tmm')]) and not(ancestor::book[contains(@doctype,'oh')] and ancestor::ata-page-block/@pb-name[.='service']) and not(ancestor::book[contains(@doctype,'oh')] and ancestor::page-block/@pb-name[.='service']) and not(ancestor::ata-page-block/@pb-name[.='00awl' or .='00intro' or .='airlim' or .='awl' or .='awlror' or .='chapsect' or .='consume' or .='d-and-o' or .='frontmatte' or .='howtouse' or .='00howtouse' or .='intro' or .='nut_option' or .='oplimits' or .='sblist' or .='schedchk' or .='spectool' or .='timelim' or .='title-page']) and not(ancestor::page-block/@pb-name[.='00awl' or .='00intro' or .='airlim' or .='awl' or .='awlror' or .='chapsect' or .='consume' or .='d-and-o' or .='frontmatte' or .='howtouse' or .='00howtouse' or .='intro' or .='nut_option' or .='oplimits' or .='sblist' or .='schedchk' or .='spectool' or .='timelim' or .='title-page']) and not(ancestor::ata-page-block/@pb-name[(starts-with(., 'do') and 'do' = translate(., '0123456789', '') and string-length(.) &gt; 2) or (starts-with(., 'in') and 'in' = translate(., '0123456789', '') and string-length(.) &gt; 2) or (starts-with(., 'tl') and 'tl' = translate(., '0123456789', '') and string-length(.) &gt; 2) or .='toolsht' or .='trlist' or .='unschedc' or .='unschedchk']) and not(ancestor::page-block/@pb-name[(starts-with(., 'do') and 'do' = translate(., '0123456789', '') and string-length(.) &gt; 2) or (starts-with(., 'in') and 'in' = translate(., '0123456789', '') and string-length(.) &gt; 2) or (starts-with(., 'tl') and 'tl' = translate(., '0123456789', '') and string-length(.) &gt; 2) or .='toolsht' or .='trlist' or .='unschedc' or .='unschedchk']) and not(ancestor-or-self::ata-page-block[1]/@pb-name and string(ancestor-or-self::ata-page-block[1]/@pb-name)='intro00') and not(ancestor-or-self::page-block[1]/@pb-name and string(ancestor-or-self::page-block[1]/@pb-name)='intro00') and not(ancestor::ata-page-block/@pb-name[starts-with(., 'disassy') or starts-with(., 'fault')]) and not(ancestor::page-block/@pb-name[starts-with(., 'disassy') or starts-with(., 'fault')]) and not(ancestor::book[contains(@doctype,'oh')] and ancestor::ata-page-block/@pb-name[starts-with(., 'clean')]) and not(ancestor::book[contains(@doctype,'oh')] and ancestor::page-block/@pb-name[starts-with(., 'clean')]) and not(ancestor::ata-page-block/@pb-name[starts-with(., 'mainprac')]) and not(ancestor::page-block/@pb-name[starts-with(., 'mainprac')]) and not(ancestor::book[contains(@doctype,'oh')] and ancestor::ata-page-block/@pb-name[starts-with(., 'inspect')]) and not(ancestor::book[contains(@doctype,'oh')] and ancestor::page-block/@pb-name[starts-with(., 'inspect')]) and not(ancestor::ata-page-block/@pb-name[(starts-with(., 'di') and 'di' = translate(., '0123456789', '') and string-length(.) &gt; 2) or starts-with(.,'service')]) and not(ancestor::page-block/@pb-name[(starts-with(., 'di') and 'di' = translate(., '0123456789', '') and string-length(.) &gt; 2) or starts-with(.,'service')]) and not(ancestor::book[contains(@doctype,'oh')] and ancestor::ata-page-block/@pb-name[starts-with(., 'repair')]) and not(ancestor::book[contains(@doctype,'oh')] and ancestor::page-block/@pb-name[starts-with(., 'repair')]) and not(ancestor::book[contains(@doctype,'oh')] and ancestor::ata-page-block/@pb-name[starts-with(., 'test')]) and not(ancestor::book[contains(@doctype,'oh')] and ancestor::page-block/@pb-name[starts-with(., 'test')]) and not(ancestor::ata-page-block/@pb-name[(starts-with(., 'cl') and 'cl' = translate(., '0123456789', '') and string-length(.) &gt; 2) or .='install' or starts-with(.,'rem-inst') or (starts-with(., 'reminst') and 'reminst' = translate(., '0123456789', '') and string-length(.) &gt; 7) or .='remove' or (starts-with(., 'repair') and 'repair' = translate(., '0123456789', '') and string-length(.) &gt; 6)]) and not(ancestor::page-block/@pb-name[(starts-with(., 'cl') and 'cl' = translate(., '0123456789', '') and string-length(.) &gt; 2) or .='install' or starts-with(.,'rem-inst') or (starts-with(., 'reminst') and 'reminst' = translate(., '0123456789', '') and string-length(.) &gt; 7) or .='remove' or (starts-with(., 'repair') and 'repair' = translate(., '0123456789', '') and string-length(.) &gt; 6)]) and not(ancestor::ata-page-block/@pb-name[starts-with(., 'assy') or (starts-with(., 'ic') and 'ic' = translate(., '0123456789', '') and string-length(.) &gt; 2) or (starts-with(., 'te') and 'te' = translate(., '0123456789', '') and string-length(.) &gt; 2) or .='test']) and (ancestor::page-block/@pb-name[starts-with(., 'assy') or (starts-with(., 'ic') and 'ic' = translate(., '0123456789', '') and string-length(.) &gt; 2) or (starts-with(., 'te') and 'te' = translate(., '0123456789', '') and string-length(.) &gt; 2) or .='test'])">
            <xsl:variable name="node-id" select="generate-id(.)"/>
            <xsl:variable name="from-node" select="(ancestor-or-self::page-block[not(ancestor::page-block)])[last()]"/>
            <xsl:variable name="num">
               <xsl:variable name="candidate-num">
                  <xsl:choose>
                     <xsl:when test="count($from-node) &gt; 0">
                        <xsl:for-each select="$from-node/descendant-or-self::*[@_gte:count-as-id='cnt__table^page-block.cnt']">
                           <xsl:if test="generate-id(.) = $node-id">
                              <xsl:value-of select="position()"/>
                           </xsl:if>
                        </xsl:for-each>
                     </xsl:when>
                     <xsl:otherwise>
                        <xsl:for-each select="//*[@_gte:count-as-id='cnt__table^page-block.cnt'][not(ancestor-or-self::page-block)]">
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
            <xsl:variable name="offset">
               <!--Evaluate startAtXPath using the first counted element within the numbering scope as the context node-->
               <xsl:variable name="initial-num">
                  <xsl:choose>
                     <xsl:when test="count($from-node) &gt; 0">
                        <xsl:apply-templates select="($from-node/descendant-or-self::*[@_gte:count-as-id='cnt__table^page-block.cnt'])[1]" mode="startat-xpath"/>
                     </xsl:when>
                     <xsl:otherwise>
                        <xsl:apply-templates select="(//*[@_gte:count-as-id='cnt__table^page-block.cnt'][not(ancestor-or-self::page-block)])[1]" mode="startat-xpath"/>
                     </xsl:otherwise>
                  </xsl:choose>
               </xsl:variable>
               <xsl:choose>
                  <xsl:when test="string(number($initial-num))!='NaN'">
                     <xsl:value-of select="$initial-num"/>
                  </xsl:when>
                  <xsl:otherwise>1</xsl:otherwise>
               </xsl:choose>
            </xsl:variable>
            <xsl:choose>
               <xsl:when test="string(number($num))!='NaN'">
                  <xsl:number value="$num + $offset - 1" format="1"/>
               </xsl:when>
               <xsl:otherwise>?</xsl:otherwise>
            </xsl:choose>
         </xsl:when>
         <xsl:when test="not(ancestor::book[contains(@doctype,'cir') or contains(@doctype,'em') or contains(@doctype,'tmm')]) and not(ancestor::book[contains(@doctype,'oh')] and ancestor::ata-page-block/@pb-name[.='service']) and not(ancestor::book[contains(@doctype,'oh')] and ancestor::page-block/@pb-name[.='service']) and not(ancestor::ata-page-block/@pb-name[.='00awl' or .='00intro' or .='airlim' or .='awl' or .='awlror' or .='chapsect' or .='consume' or .='d-and-o' or .='frontmatte' or .='howtouse' or .='00howtouse' or .='intro' or .='nut_option' or .='oplimits' or .='sblist' or .='schedchk' or .='spectool' or .='timelim' or .='title-page']) and not(ancestor::page-block/@pb-name[.='00awl' or .='00intro' or .='airlim' or .='awl' or .='awlror' or .='chapsect' or .='consume' or .='d-and-o' or .='frontmatte' or .='howtouse' or .='00howtouse' or .='intro' or .='nut_option' or .='oplimits' or .='sblist' or .='schedchk' or .='spectool' or .='timelim' or .='title-page']) and not(ancestor::ata-page-block/@pb-name[(starts-with(., 'do') and 'do' = translate(., '0123456789', '') and string-length(.) &gt; 2) or (starts-with(., 'in') and 'in' = translate(., '0123456789', '') and string-length(.) &gt; 2) or (starts-with(., 'tl') and 'tl' = translate(., '0123456789', '') and string-length(.) &gt; 2) or .='toolsht' or .='trlist' or .='unschedc' or .='unschedchk']) and not(ancestor::page-block/@pb-name[(starts-with(., 'do') and 'do' = translate(., '0123456789', '') and string-length(.) &gt; 2) or (starts-with(., 'in') and 'in' = translate(., '0123456789', '') and string-length(.) &gt; 2) or (starts-with(., 'tl') and 'tl' = translate(., '0123456789', '') and string-length(.) &gt; 2) or .='toolsht' or .='trlist' or .='unschedc' or .='unschedchk']) and not(ancestor-or-self::ata-page-block[1]/@pb-name and string(ancestor-or-self::ata-page-block[1]/@pb-name)='intro00') and not(ancestor-or-self::page-block[1]/@pb-name and string(ancestor-or-self::page-block[1]/@pb-name)='intro00') and not(ancestor::ata-page-block/@pb-name[starts-with(., 'disassy') or starts-with(., 'fault')]) and not(ancestor::page-block/@pb-name[starts-with(., 'disassy') or starts-with(., 'fault')]) and not(ancestor::book[contains(@doctype,'oh')] and ancestor::ata-page-block/@pb-name[starts-with(., 'clean')]) and not(ancestor::book[contains(@doctype,'oh')] and ancestor::page-block/@pb-name[starts-with(., 'clean')]) and not(ancestor::ata-page-block/@pb-name[starts-with(., 'mainprac')]) and not(ancestor::page-block/@pb-name[starts-with(., 'mainprac')]) and not(ancestor::book[contains(@doctype,'oh')] and ancestor::ata-page-block/@pb-name[starts-with(., 'inspect')]) and not(ancestor::book[contains(@doctype,'oh')] and ancestor::page-block/@pb-name[starts-with(., 'inspect')]) and not(ancestor::ata-page-block/@pb-name[(starts-with(., 'di') and 'di' = translate(., '0123456789', '') and string-length(.) &gt; 2) or starts-with(.,'service')]) and not(ancestor::page-block/@pb-name[(starts-with(., 'di') and 'di' = translate(., '0123456789', '') and string-length(.) &gt; 2) or starts-with(.,'service')]) and not(ancestor::book[contains(@doctype,'oh')] and ancestor::ata-page-block/@pb-name[starts-with(., 'repair')]) and not(ancestor::book[contains(@doctype,'oh')] and ancestor::page-block/@pb-name[starts-with(., 'repair')]) and not(ancestor::book[contains(@doctype,'oh')] and ancestor::ata-page-block/@pb-name[starts-with(., 'test')]) and not(ancestor::book[contains(@doctype,'oh')] and ancestor::page-block/@pb-name[starts-with(., 'test')]) and not(ancestor::ata-page-block/@pb-name[(starts-with(., 'cl') and 'cl' = translate(., '0123456789', '') and string-length(.) &gt; 2) or .='install' or starts-with(.,'rem-inst') or (starts-with(., 'reminst') and 'reminst' = translate(., '0123456789', '') and string-length(.) &gt; 7) or .='remove' or (starts-with(., 'repair') and 'repair' = translate(., '0123456789', '') and string-length(.) &gt; 6)]) and not(ancestor::page-block/@pb-name[(starts-with(., 'cl') and 'cl' = translate(., '0123456789', '') and string-length(.) &gt; 2) or .='install' or starts-with(.,'rem-inst') or (starts-with(., 'reminst') and 'reminst' = translate(., '0123456789', '') and string-length(.) &gt; 7) or .='remove' or (starts-with(., 'repair') and 'repair' = translate(., '0123456789', '') and string-length(.) &gt; 6)]) and (ancestor::ata-page-block/@pb-name[starts-with(., 'assy') or (starts-with(., 'ic') and 'ic' = translate(., '0123456789', '') and string-length(.) &gt; 2) or (starts-with(., 'te') and 'te' = translate(., '0123456789', '') and string-length(.) &gt; 2) or .='test'])">
            <xsl:variable name="node-id" select="generate-id(.)"/>
            <xsl:variable name="from-node" select="(ancestor-or-self::ata-page-block[not(ancestor::ata-page-block)])[last()]"/>
            <xsl:variable name="num">
               <xsl:variable name="candidate-num">
                  <xsl:choose>
                     <xsl:when test="count($from-node) &gt; 0">
                        <xsl:for-each select="$from-node/descendant-or-self::*[@_gte:count-as-id='cnt__table^ata-page-block.cnt']">
                           <xsl:if test="generate-id(.) = $node-id">
                              <xsl:value-of select="position()"/>
                           </xsl:if>
                        </xsl:for-each>
                     </xsl:when>
                     <xsl:otherwise>
                        <xsl:for-each select="//*[@_gte:count-as-id='cnt__table^ata-page-block.cnt'][not(ancestor-or-self::ata-page-block)]">
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
            <xsl:variable name="offset">
               <!--Evaluate startAtXPath using the first counted element within the numbering scope as the context node-->
               <xsl:variable name="initial-num">
                  <xsl:choose>
                     <xsl:when test="count($from-node) &gt; 0">
                        <xsl:apply-templates select="($from-node/descendant-or-self::*[@_gte:count-as-id='cnt__table^ata-page-block.cnt'])[1]" mode="startat-xpath"/>
                     </xsl:when>
                     <xsl:otherwise>
                        <xsl:apply-templates select="(//*[@_gte:count-as-id='cnt__table^ata-page-block.cnt'][not(ancestor-or-self::ata-page-block)])[1]" mode="startat-xpath"/>
                     </xsl:otherwise>
                  </xsl:choose>
               </xsl:variable>
               <xsl:choose>
                  <xsl:when test="string(number($initial-num))!='NaN'">
                     <xsl:value-of select="$initial-num"/>
                  </xsl:when>
                  <xsl:otherwise>1</xsl:otherwise>
               </xsl:choose>
            </xsl:variable>
            <xsl:choose>
               <xsl:when test="string(number($num))!='NaN'">
                  <xsl:number value="$num + $offset - 1" format="1"/>
               </xsl:when>
               <xsl:otherwise>?</xsl:otherwise>
            </xsl:choose>
         </xsl:when>
         <xsl:when test="not(ancestor::book[contains(@doctype,'cir') or contains(@doctype,'em') or contains(@doctype,'tmm')]) and not(ancestor::book[contains(@doctype,'oh')] and ancestor::ata-page-block/@pb-name[.='service']) and not(ancestor::book[contains(@doctype,'oh')] and ancestor::page-block/@pb-name[.='service']) and not(ancestor::ata-page-block/@pb-name[.='00awl' or .='00intro' or .='airlim' or .='awl' or .='awlror' or .='chapsect' or .='consume' or .='d-and-o' or .='frontmatte' or .='howtouse' or .='00howtouse' or .='intro' or .='nut_option' or .='oplimits' or .='sblist' or .='schedchk' or .='spectool' or .='timelim' or .='title-page']) and not(ancestor::page-block/@pb-name[.='00awl' or .='00intro' or .='airlim' or .='awl' or .='awlror' or .='chapsect' or .='consume' or .='d-and-o' or .='frontmatte' or .='howtouse' or .='00howtouse' or .='intro' or .='nut_option' or .='oplimits' or .='sblist' or .='schedchk' or .='spectool' or .='timelim' or .='title-page']) and not(ancestor::ata-page-block/@pb-name[(starts-with(., 'do') and 'do' = translate(., '0123456789', '') and string-length(.) &gt; 2) or (starts-with(., 'in') and 'in' = translate(., '0123456789', '') and string-length(.) &gt; 2) or (starts-with(., 'tl') and 'tl' = translate(., '0123456789', '') and string-length(.) &gt; 2) or .='toolsht' or .='trlist' or .='unschedc' or .='unschedchk']) and not(ancestor::page-block/@pb-name[(starts-with(., 'do') and 'do' = translate(., '0123456789', '') and string-length(.) &gt; 2) or (starts-with(., 'in') and 'in' = translate(., '0123456789', '') and string-length(.) &gt; 2) or (starts-with(., 'tl') and 'tl' = translate(., '0123456789', '') and string-length(.) &gt; 2) or .='toolsht' or .='trlist' or .='unschedc' or .='unschedchk']) and not(ancestor-or-self::ata-page-block[1]/@pb-name and string(ancestor-or-self::ata-page-block[1]/@pb-name)='intro00') and not(ancestor-or-self::page-block[1]/@pb-name and string(ancestor-or-self::page-block[1]/@pb-name)='intro00') and not(ancestor::ata-page-block/@pb-name[starts-with(., 'disassy') or starts-with(., 'fault')]) and not(ancestor::page-block/@pb-name[starts-with(., 'disassy') or starts-with(., 'fault')]) and not(ancestor::book[contains(@doctype,'oh')] and ancestor::ata-page-block/@pb-name[starts-with(., 'clean')]) and not(ancestor::book[contains(@doctype,'oh')] and ancestor::page-block/@pb-name[starts-with(., 'clean')]) and not(ancestor::ata-page-block/@pb-name[starts-with(., 'mainprac')]) and not(ancestor::page-block/@pb-name[starts-with(., 'mainprac')]) and not(ancestor::book[contains(@doctype,'oh')] and ancestor::ata-page-block/@pb-name[starts-with(., 'inspect')]) and not(ancestor::book[contains(@doctype,'oh')] and ancestor::page-block/@pb-name[starts-with(., 'inspect')]) and not(ancestor::ata-page-block/@pb-name[(starts-with(., 'di') and 'di' = translate(., '0123456789', '') and string-length(.) &gt; 2) or starts-with(.,'service')]) and not(ancestor::page-block/@pb-name[(starts-with(., 'di') and 'di' = translate(., '0123456789', '') and string-length(.) &gt; 2) or starts-with(.,'service')]) and not(ancestor::book[contains(@doctype,'oh')] and ancestor::ata-page-block/@pb-name[starts-with(., 'repair')]) and not(ancestor::book[contains(@doctype,'oh')] and ancestor::page-block/@pb-name[starts-with(., 'repair')]) and not(ancestor::book[contains(@doctype,'oh')] and ancestor::ata-page-block/@pb-name[starts-with(., 'test')]) and not(ancestor::book[contains(@doctype,'oh')] and ancestor::page-block/@pb-name[starts-with(., 'test')]) and not(ancestor::ata-page-block/@pb-name[(starts-with(., 'cl') and 'cl' = translate(., '0123456789', '') and string-length(.) &gt; 2) or .='install' or starts-with(.,'rem-inst') or (starts-with(., 'reminst') and 'reminst' = translate(., '0123456789', '') and string-length(.) &gt; 7) or .='remove' or (starts-with(., 'repair') and 'repair' = translate(., '0123456789', '') and string-length(.) &gt; 6)]) and (ancestor::page-block/@pb-name[(starts-with(., 'cl') and 'cl' = translate(., '0123456789', '') and string-length(.) &gt; 2) or .='install' or starts-with(.,'rem-inst') or (starts-with(., 'reminst') and 'reminst' = translate(., '0123456789', '') and string-length(.) &gt; 7) or .='remove' or (starts-with(., 'repair') and 'repair' = translate(., '0123456789', '') and string-length(.) &gt; 6)])">
            <xsl:variable name="node-id" select="generate-id(.)"/>
            <xsl:variable name="from-node" select="(ancestor-or-self::page-block[not(ancestor::page-block)])[last()]"/>
            <xsl:variable name="num">
               <xsl:variable name="candidate-num">
                  <xsl:choose>
                     <xsl:when test="count($from-node) &gt; 0">
                        <xsl:for-each select="$from-node/descendant-or-self::*[@_gte:count-as-id='cnt__table^page-block.cnt']">
                           <xsl:if test="generate-id(.) = $node-id">
                              <xsl:value-of select="position()"/>
                           </xsl:if>
                        </xsl:for-each>
                     </xsl:when>
                     <xsl:otherwise>
                        <xsl:for-each select="//*[@_gte:count-as-id='cnt__table^page-block.cnt'][not(ancestor-or-self::page-block)]">
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
            <xsl:variable name="offset">
               <!--Evaluate startAtXPath using the first counted element within the numbering scope as the context node-->
               <xsl:variable name="initial-num">
                  <xsl:choose>
                     <xsl:when test="count($from-node) &gt; 0">
                        <xsl:apply-templates select="($from-node/descendant-or-self::*[@_gte:count-as-id='cnt__table^page-block.cnt'])[1]" mode="startat-xpath"/>
                     </xsl:when>
                     <xsl:otherwise>
                        <xsl:apply-templates select="(//*[@_gte:count-as-id='cnt__table^page-block.cnt'][not(ancestor-or-self::page-block)])[1]" mode="startat-xpath"/>
                     </xsl:otherwise>
                  </xsl:choose>
               </xsl:variable>
               <xsl:choose>
                  <xsl:when test="string(number($initial-num))!='NaN'">
                     <xsl:value-of select="$initial-num"/>
                  </xsl:when>
                  <xsl:otherwise>1</xsl:otherwise>
               </xsl:choose>
            </xsl:variable>
            <xsl:choose>
               <xsl:when test="string(number($num))!='NaN'">
                  <xsl:number value="$num + $offset - 1" format="1"/>
               </xsl:when>
               <xsl:otherwise>?</xsl:otherwise>
            </xsl:choose>
         </xsl:when>
         <xsl:when test="not(ancestor::book[contains(@doctype,'cir') or contains(@doctype,'em') or contains(@doctype,'tmm')]) and not(ancestor::book[contains(@doctype,'oh')] and ancestor::ata-page-block/@pb-name[.='service']) and not(ancestor::book[contains(@doctype,'oh')] and ancestor::page-block/@pb-name[.='service']) and not(ancestor::ata-page-block/@pb-name[.='00awl' or .='00intro' or .='airlim' or .='awl' or .='awlror' or .='chapsect' or .='consume' or .='d-and-o' or .='frontmatte' or .='howtouse' or .='00howtouse' or .='intro' or .='nut_option' or .='oplimits' or .='sblist' or .='schedchk' or .='spectool' or .='timelim' or .='title-page']) and not(ancestor::page-block/@pb-name[.='00awl' or .='00intro' or .='airlim' or .='awl' or .='awlror' or .='chapsect' or .='consume' or .='d-and-o' or .='frontmatte' or .='howtouse' or .='00howtouse' or .='intro' or .='nut_option' or .='oplimits' or .='sblist' or .='schedchk' or .='spectool' or .='timelim' or .='title-page']) and not(ancestor::ata-page-block/@pb-name[(starts-with(., 'do') and 'do' = translate(., '0123456789', '') and string-length(.) &gt; 2) or (starts-with(., 'in') and 'in' = translate(., '0123456789', '') and string-length(.) &gt; 2) or (starts-with(., 'tl') and 'tl' = translate(., '0123456789', '') and string-length(.) &gt; 2) or .='toolsht' or .='trlist' or .='unschedc' or .='unschedchk']) and not(ancestor::page-block/@pb-name[(starts-with(., 'do') and 'do' = translate(., '0123456789', '') and string-length(.) &gt; 2) or (starts-with(., 'in') and 'in' = translate(., '0123456789', '') and string-length(.) &gt; 2) or (starts-with(., 'tl') and 'tl' = translate(., '0123456789', '') and string-length(.) &gt; 2) or .='toolsht' or .='trlist' or .='unschedc' or .='unschedchk']) and not(ancestor-or-self::ata-page-block[1]/@pb-name and string(ancestor-or-self::ata-page-block[1]/@pb-name)='intro00') and not(ancestor-or-self::page-block[1]/@pb-name and string(ancestor-or-self::page-block[1]/@pb-name)='intro00') and not(ancestor::ata-page-block/@pb-name[starts-with(., 'disassy') or starts-with(., 'fault')]) and not(ancestor::page-block/@pb-name[starts-with(., 'disassy') or starts-with(., 'fault')]) and not(ancestor::book[contains(@doctype,'oh')] and ancestor::ata-page-block/@pb-name[starts-with(., 'clean')]) and not(ancestor::book[contains(@doctype,'oh')] and ancestor::page-block/@pb-name[starts-with(., 'clean')]) and not(ancestor::ata-page-block/@pb-name[starts-with(., 'mainprac')]) and not(ancestor::page-block/@pb-name[starts-with(., 'mainprac')]) and not(ancestor::book[contains(@doctype,'oh')] and ancestor::ata-page-block/@pb-name[starts-with(., 'inspect')]) and not(ancestor::book[contains(@doctype,'oh')] and ancestor::page-block/@pb-name[starts-with(., 'inspect')]) and not(ancestor::ata-page-block/@pb-name[(starts-with(., 'di') and 'di' = translate(., '0123456789', '') and string-length(.) &gt; 2) or starts-with(.,'service')]) and not(ancestor::page-block/@pb-name[(starts-with(., 'di') and 'di' = translate(., '0123456789', '') and string-length(.) &gt; 2) or starts-with(.,'service')]) and not(ancestor::book[contains(@doctype,'oh')] and ancestor::ata-page-block/@pb-name[starts-with(., 'repair')]) and not(ancestor::book[contains(@doctype,'oh')] and ancestor::page-block/@pb-name[starts-with(., 'repair')]) and not(ancestor::book[contains(@doctype,'oh')] and ancestor::ata-page-block/@pb-name[starts-with(., 'test')]) and not(ancestor::book[contains(@doctype,'oh')] and ancestor::page-block/@pb-name[starts-with(., 'test')]) and (ancestor::ata-page-block/@pb-name[(starts-with(., 'cl') and 'cl' = translate(., '0123456789', '') and string-length(.) &gt; 2) or .='install' or starts-with(.,'rem-inst') or (starts-with(., 'reminst') and 'reminst' = translate(., '0123456789', '') and string-length(.) &gt; 7) or .='remove' or (starts-with(., 'repair') and 'repair' = translate(., '0123456789', '') and string-length(.) &gt; 6)])">
            <xsl:variable name="node-id" select="generate-id(.)"/>
            <xsl:variable name="from-node" select="(ancestor-or-self::ata-page-block[not(ancestor::ata-page-block)])[last()]"/>
            <xsl:variable name="num">
               <xsl:variable name="candidate-num">
                  <xsl:choose>
                     <xsl:when test="count($from-node) &gt; 0">
                        <xsl:for-each select="$from-node/descendant-or-self::*[@_gte:count-as-id='cnt__table^ata-page-block.cnt']">
                           <xsl:if test="generate-id(.) = $node-id">
                              <xsl:value-of select="position()"/>
                           </xsl:if>
                        </xsl:for-each>
                     </xsl:when>
                     <xsl:otherwise>
                        <xsl:for-each select="//*[@_gte:count-as-id='cnt__table^ata-page-block.cnt'][not(ancestor-or-self::ata-page-block)]">
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
            <xsl:variable name="offset">
               <!--Evaluate startAtXPath using the first counted element within the numbering scope as the context node-->
               <xsl:variable name="initial-num">
                  <xsl:choose>
                     <xsl:when test="count($from-node) &gt; 0">
                        <xsl:apply-templates select="($from-node/descendant-or-self::*[@_gte:count-as-id='cnt__table^ata-page-block.cnt'])[1]" mode="startat-xpath"/>
                     </xsl:when>
                     <xsl:otherwise>
                        <xsl:apply-templates select="(//*[@_gte:count-as-id='cnt__table^ata-page-block.cnt'][not(ancestor-or-self::ata-page-block)])[1]" mode="startat-xpath"/>
                     </xsl:otherwise>
                  </xsl:choose>
               </xsl:variable>
               <xsl:choose>
                  <xsl:when test="string(number($initial-num))!='NaN'">
                     <xsl:value-of select="$initial-num"/>
                  </xsl:when>
                  <xsl:otherwise>1</xsl:otherwise>
               </xsl:choose>
            </xsl:variable>
            <xsl:choose>
               <xsl:when test="string(number($num))!='NaN'">
                  <xsl:number value="$num + $offset - 1" format="1"/>
               </xsl:when>
               <xsl:otherwise>?</xsl:otherwise>
            </xsl:choose>
         </xsl:when>
         <xsl:when test="not(ancestor::book[contains(@doctype,'cir') or contains(@doctype,'em') or contains(@doctype,'tmm')]) and not(ancestor::book[contains(@doctype,'oh')] and ancestor::ata-page-block/@pb-name[.='service']) and not(ancestor::book[contains(@doctype,'oh')] and ancestor::page-block/@pb-name[.='service']) and not(ancestor::ata-page-block/@pb-name[.='00awl' or .='00intro' or .='airlim' or .='awl' or .='awlror' or .='chapsect' or .='consume' or .='d-and-o' or .='frontmatte' or .='howtouse' or .='00howtouse' or .='intro' or .='nut_option' or .='oplimits' or .='sblist' or .='schedchk' or .='spectool' or .='timelim' or .='title-page']) and not(ancestor::page-block/@pb-name[.='00awl' or .='00intro' or .='airlim' or .='awl' or .='awlror' or .='chapsect' or .='consume' or .='d-and-o' or .='frontmatte' or .='howtouse' or .='00howtouse' or .='intro' or .='nut_option' or .='oplimits' or .='sblist' or .='schedchk' or .='spectool' or .='timelim' or .='title-page']) and not(ancestor::ata-page-block/@pb-name[(starts-with(., 'do') and 'do' = translate(., '0123456789', '') and string-length(.) &gt; 2) or (starts-with(., 'in') and 'in' = translate(., '0123456789', '') and string-length(.) &gt; 2) or (starts-with(., 'tl') and 'tl' = translate(., '0123456789', '') and string-length(.) &gt; 2) or .='toolsht' or .='trlist' or .='unschedc' or .='unschedchk']) and not(ancestor::page-block/@pb-name[(starts-with(., 'do') and 'do' = translate(., '0123456789', '') and string-length(.) &gt; 2) or (starts-with(., 'in') and 'in' = translate(., '0123456789', '') and string-length(.) &gt; 2) or (starts-with(., 'tl') and 'tl' = translate(., '0123456789', '') and string-length(.) &gt; 2) or .='toolsht' or .='trlist' or .='unschedc' or .='unschedchk']) and not(ancestor-or-self::ata-page-block[1]/@pb-name and string(ancestor-or-self::ata-page-block[1]/@pb-name)='intro00') and not(ancestor-or-self::page-block[1]/@pb-name and string(ancestor-or-self::page-block[1]/@pb-name)='intro00') and not(ancestor::ata-page-block/@pb-name[starts-with(., 'disassy') or starts-with(., 'fault')]) and not(ancestor::page-block/@pb-name[starts-with(., 'disassy') or starts-with(., 'fault')]) and not(ancestor::book[contains(@doctype,'oh')] and ancestor::ata-page-block/@pb-name[starts-with(., 'clean')]) and not(ancestor::book[contains(@doctype,'oh')] and ancestor::page-block/@pb-name[starts-with(., 'clean')]) and not(ancestor::ata-page-block/@pb-name[starts-with(., 'mainprac')]) and not(ancestor::page-block/@pb-name[starts-with(., 'mainprac')]) and not(ancestor::book[contains(@doctype,'oh')] and ancestor::ata-page-block/@pb-name[starts-with(., 'inspect')]) and not(ancestor::book[contains(@doctype,'oh')] and ancestor::page-block/@pb-name[starts-with(., 'inspect')]) and not(ancestor::ata-page-block/@pb-name[(starts-with(., 'di') and 'di' = translate(., '0123456789', '') and string-length(.) &gt; 2) or starts-with(.,'service')]) and not(ancestor::page-block/@pb-name[(starts-with(., 'di') and 'di' = translate(., '0123456789', '') and string-length(.) &gt; 2) or starts-with(.,'service')]) and not(ancestor::book[contains(@doctype,'oh')] and ancestor::ata-page-block/@pb-name[starts-with(., 'repair')]) and not(ancestor::book[contains(@doctype,'oh')] and ancestor::page-block/@pb-name[starts-with(., 'repair')]) and not(ancestor::book[contains(@doctype,'oh')] and ancestor::ata-page-block/@pb-name[starts-with(., 'test')]) and (ancestor::book[contains(@doctype,'oh')] and ancestor::page-block/@pb-name[starts-with(., 'test')])">
            <xsl:variable name="node-id" select="generate-id(.)"/>
            <xsl:variable name="from-node" select="(ancestor-or-self::page-block[not(ancestor::page-block)])[last()]"/>
            <xsl:variable name="num">
               <xsl:variable name="candidate-num">
                  <xsl:choose>
                     <xsl:when test="count($from-node) &gt; 0">
                        <xsl:for-each select="$from-node/descendant-or-self::*[@_gte:count-as-id='cnt__table^page-block.cnt']">
                           <xsl:if test="generate-id(.) = $node-id">
                              <xsl:value-of select="position()"/>
                           </xsl:if>
                        </xsl:for-each>
                     </xsl:when>
                     <xsl:otherwise>
                        <xsl:for-each select="//*[@_gte:count-as-id='cnt__table^page-block.cnt'][not(ancestor-or-self::page-block)]">
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
            <xsl:variable name="offset">
               <!--Evaluate startAtXPath using the first counted element within the numbering scope as the context node-->
               <xsl:variable name="initial-num">
                  <xsl:choose>
                     <xsl:when test="count($from-node) &gt; 0">
                        <xsl:apply-templates select="($from-node/descendant-or-self::*[@_gte:count-as-id='cnt__table^page-block.cnt'])[1]" mode="startat-xpath"/>
                     </xsl:when>
                     <xsl:otherwise>
                        <xsl:apply-templates select="(//*[@_gte:count-as-id='cnt__table^page-block.cnt'][not(ancestor-or-self::page-block)])[1]" mode="startat-xpath"/>
                     </xsl:otherwise>
                  </xsl:choose>
               </xsl:variable>
               <xsl:choose>
                  <xsl:when test="string(number($initial-num))!='NaN'">
                     <xsl:value-of select="$initial-num"/>
                  </xsl:when>
                  <xsl:otherwise>1</xsl:otherwise>
               </xsl:choose>
            </xsl:variable>
            <xsl:choose>
               <xsl:when test="string(number($num))!='NaN'">
                  <xsl:number value="$num + $offset - 1" format="1"/>
               </xsl:when>
               <xsl:otherwise>?</xsl:otherwise>
            </xsl:choose>
         </xsl:when>
         <xsl:when test="not(ancestor::book[contains(@doctype,'cir') or contains(@doctype,'em') or contains(@doctype,'tmm')]) and not(ancestor::book[contains(@doctype,'oh')] and ancestor::ata-page-block/@pb-name[.='service']) and not(ancestor::book[contains(@doctype,'oh')] and ancestor::page-block/@pb-name[.='service']) and not(ancestor::ata-page-block/@pb-name[.='00awl' or .='00intro' or .='airlim' or .='awl' or .='awlror' or .='chapsect' or .='consume' or .='d-and-o' or .='frontmatte' or .='howtouse' or .='00howtouse' or .='intro' or .='nut_option' or .='oplimits' or .='sblist' or .='schedchk' or .='spectool' or .='timelim' or .='title-page']) and not(ancestor::page-block/@pb-name[.='00awl' or .='00intro' or .='airlim' or .='awl' or .='awlror' or .='chapsect' or .='consume' or .='d-and-o' or .='frontmatte' or .='howtouse' or .='00howtouse' or .='intro' or .='nut_option' or .='oplimits' or .='sblist' or .='schedchk' or .='spectool' or .='timelim' or .='title-page']) and not(ancestor::ata-page-block/@pb-name[(starts-with(., 'do') and 'do' = translate(., '0123456789', '') and string-length(.) &gt; 2) or (starts-with(., 'in') and 'in' = translate(., '0123456789', '') and string-length(.) &gt; 2) or (starts-with(., 'tl') and 'tl' = translate(., '0123456789', '') and string-length(.) &gt; 2) or .='toolsht' or .='trlist' or .='unschedc' or .='unschedchk']) and not(ancestor::page-block/@pb-name[(starts-with(., 'do') and 'do' = translate(., '0123456789', '') and string-length(.) &gt; 2) or (starts-with(., 'in') and 'in' = translate(., '0123456789', '') and string-length(.) &gt; 2) or (starts-with(., 'tl') and 'tl' = translate(., '0123456789', '') and string-length(.) &gt; 2) or .='toolsht' or .='trlist' or .='unschedc' or .='unschedchk']) and not(ancestor-or-self::ata-page-block[1]/@pb-name and string(ancestor-or-self::ata-page-block[1]/@pb-name)='intro00') and not(ancestor-or-self::page-block[1]/@pb-name and string(ancestor-or-self::page-block[1]/@pb-name)='intro00') and not(ancestor::ata-page-block/@pb-name[starts-with(., 'disassy') or starts-with(., 'fault')]) and not(ancestor::page-block/@pb-name[starts-with(., 'disassy') or starts-with(., 'fault')]) and not(ancestor::book[contains(@doctype,'oh')] and ancestor::ata-page-block/@pb-name[starts-with(., 'clean')]) and not(ancestor::book[contains(@doctype,'oh')] and ancestor::page-block/@pb-name[starts-with(., 'clean')]) and not(ancestor::ata-page-block/@pb-name[starts-with(., 'mainprac')]) and not(ancestor::page-block/@pb-name[starts-with(., 'mainprac')]) and not(ancestor::book[contains(@doctype,'oh')] and ancestor::ata-page-block/@pb-name[starts-with(., 'inspect')]) and not(ancestor::book[contains(@doctype,'oh')] and ancestor::page-block/@pb-name[starts-with(., 'inspect')]) and not(ancestor::ata-page-block/@pb-name[(starts-with(., 'di') and 'di' = translate(., '0123456789', '') and string-length(.) &gt; 2) or starts-with(.,'service')]) and not(ancestor::page-block/@pb-name[(starts-with(., 'di') and 'di' = translate(., '0123456789', '') and string-length(.) &gt; 2) or starts-with(.,'service')]) and not(ancestor::book[contains(@doctype,'oh')] and ancestor::ata-page-block/@pb-name[starts-with(., 'repair')]) and not(ancestor::book[contains(@doctype,'oh')] and ancestor::page-block/@pb-name[starts-with(., 'repair')]) and (ancestor::book[contains(@doctype,'oh')] and ancestor::ata-page-block/@pb-name[starts-with(., 'test')])">
            <xsl:variable name="node-id" select="generate-id(.)"/>
            <xsl:variable name="from-node" select="(ancestor-or-self::ata-page-block[not(ancestor::ata-page-block)])[last()]"/>
            <xsl:variable name="num">
               <xsl:variable name="candidate-num">
                  <xsl:choose>
                     <xsl:when test="count($from-node) &gt; 0">
                        <xsl:for-each select="$from-node/descendant-or-self::*[@_gte:count-as-id='cnt__table^ata-page-block.cnt']">
                           <xsl:if test="generate-id(.) = $node-id">
                              <xsl:value-of select="position()"/>
                           </xsl:if>
                        </xsl:for-each>
                     </xsl:when>
                     <xsl:otherwise>
                        <xsl:for-each select="//*[@_gte:count-as-id='cnt__table^ata-page-block.cnt'][not(ancestor-or-self::ata-page-block)]">
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
            <xsl:variable name="offset">
               <!--Evaluate startAtXPath using the first counted element within the numbering scope as the context node-->
               <xsl:variable name="initial-num">
                  <xsl:choose>
                     <xsl:when test="count($from-node) &gt; 0">
                        <xsl:apply-templates select="($from-node/descendant-or-self::*[@_gte:count-as-id='cnt__table^ata-page-block.cnt'])[1]" mode="startat-xpath"/>
                     </xsl:when>
                     <xsl:otherwise>
                        <xsl:apply-templates select="(//*[@_gte:count-as-id='cnt__table^ata-page-block.cnt'][not(ancestor-or-self::ata-page-block)])[1]" mode="startat-xpath"/>
                     </xsl:otherwise>
                  </xsl:choose>
               </xsl:variable>
               <xsl:choose>
                  <xsl:when test="string(number($initial-num))!='NaN'">
                     <xsl:value-of select="$initial-num"/>
                  </xsl:when>
                  <xsl:otherwise>1</xsl:otherwise>
               </xsl:choose>
            </xsl:variable>
            <xsl:choose>
               <xsl:when test="string(number($num))!='NaN'">
                  <xsl:number value="$num + $offset - 1" format="1"/>
               </xsl:when>
               <xsl:otherwise>?</xsl:otherwise>
            </xsl:choose>
         </xsl:when>
         <xsl:when test="not(ancestor::book[contains(@doctype,'cir') or contains(@doctype,'em') or contains(@doctype,'tmm')]) and not(ancestor::book[contains(@doctype,'oh')] and ancestor::ata-page-block/@pb-name[.='service']) and not(ancestor::book[contains(@doctype,'oh')] and ancestor::page-block/@pb-name[.='service']) and not(ancestor::ata-page-block/@pb-name[.='00awl' or .='00intro' or .='airlim' or .='awl' or .='awlror' or .='chapsect' or .='consume' or .='d-and-o' or .='frontmatte' or .='howtouse' or .='00howtouse' or .='intro' or .='nut_option' or .='oplimits' or .='sblist' or .='schedchk' or .='spectool' or .='timelim' or .='title-page']) and not(ancestor::page-block/@pb-name[.='00awl' or .='00intro' or .='airlim' or .='awl' or .='awlror' or .='chapsect' or .='consume' or .='d-and-o' or .='frontmatte' or .='howtouse' or .='00howtouse' or .='intro' or .='nut_option' or .='oplimits' or .='sblist' or .='schedchk' or .='spectool' or .='timelim' or .='title-page']) and not(ancestor::ata-page-block/@pb-name[(starts-with(., 'do') and 'do' = translate(., '0123456789', '') and string-length(.) &gt; 2) or (starts-with(., 'in') and 'in' = translate(., '0123456789', '') and string-length(.) &gt; 2) or (starts-with(., 'tl') and 'tl' = translate(., '0123456789', '') and string-length(.) &gt; 2) or .='toolsht' or .='trlist' or .='unschedc' or .='unschedchk']) and not(ancestor::page-block/@pb-name[(starts-with(., 'do') and 'do' = translate(., '0123456789', '') and string-length(.) &gt; 2) or (starts-with(., 'in') and 'in' = translate(., '0123456789', '') and string-length(.) &gt; 2) or (starts-with(., 'tl') and 'tl' = translate(., '0123456789', '') and string-length(.) &gt; 2) or .='toolsht' or .='trlist' or .='unschedc' or .='unschedchk']) and not(ancestor-or-self::ata-page-block[1]/@pb-name and string(ancestor-or-self::ata-page-block[1]/@pb-name)='intro00') and not(ancestor-or-self::page-block[1]/@pb-name and string(ancestor-or-self::page-block[1]/@pb-name)='intro00') and not(ancestor::ata-page-block/@pb-name[starts-with(., 'disassy') or starts-with(., 'fault')]) and not(ancestor::page-block/@pb-name[starts-with(., 'disassy') or starts-with(., 'fault')]) and not(ancestor::book[contains(@doctype,'oh')] and ancestor::ata-page-block/@pb-name[starts-with(., 'clean')]) and not(ancestor::book[contains(@doctype,'oh')] and ancestor::page-block/@pb-name[starts-with(., 'clean')]) and not(ancestor::ata-page-block/@pb-name[starts-with(., 'mainprac')]) and not(ancestor::page-block/@pb-name[starts-with(., 'mainprac')]) and not(ancestor::book[contains(@doctype,'oh')] and ancestor::ata-page-block/@pb-name[starts-with(., 'inspect')]) and not(ancestor::book[contains(@doctype,'oh')] and ancestor::page-block/@pb-name[starts-with(., 'inspect')]) and not(ancestor::ata-page-block/@pb-name[(starts-with(., 'di') and 'di' = translate(., '0123456789', '') and string-length(.) &gt; 2) or starts-with(.,'service')]) and not(ancestor::page-block/@pb-name[(starts-with(., 'di') and 'di' = translate(., '0123456789', '') and string-length(.) &gt; 2) or starts-with(.,'service')]) and not(ancestor::book[contains(@doctype,'oh')] and ancestor::ata-page-block/@pb-name[starts-with(., 'repair')]) and (ancestor::book[contains(@doctype,'oh')] and ancestor::page-block/@pb-name[starts-with(., 'repair')])">
            <xsl:variable name="node-id" select="generate-id(.)"/>
            <xsl:variable name="from-node" select="(ancestor-or-self::page-block[not(ancestor::page-block)])[last()]"/>
            <xsl:variable name="num">
               <xsl:variable name="candidate-num">
                  <xsl:choose>
                     <xsl:when test="count($from-node) &gt; 0">
                        <xsl:for-each select="$from-node/descendant-or-self::*[@_gte:count-as-id='cnt__table^page-block.cnt']">
                           <xsl:if test="generate-id(.) = $node-id">
                              <xsl:value-of select="position()"/>
                           </xsl:if>
                        </xsl:for-each>
                     </xsl:when>
                     <xsl:otherwise>
                        <xsl:for-each select="//*[@_gte:count-as-id='cnt__table^page-block.cnt'][not(ancestor-or-self::page-block)]">
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
            <xsl:variable name="offset">
               <!--Evaluate startAtXPath using the first counted element within the numbering scope as the context node-->
               <xsl:variable name="initial-num">
                  <xsl:choose>
                     <xsl:when test="count($from-node) &gt; 0">
                        <xsl:apply-templates select="($from-node/descendant-or-self::*[@_gte:count-as-id='cnt__table^page-block.cnt'])[1]" mode="startat-xpath"/>
                     </xsl:when>
                     <xsl:otherwise>
                        <xsl:apply-templates select="(//*[@_gte:count-as-id='cnt__table^page-block.cnt'][not(ancestor-or-self::page-block)])[1]" mode="startat-xpath"/>
                     </xsl:otherwise>
                  </xsl:choose>
               </xsl:variable>
               <xsl:choose>
                  <xsl:when test="string(number($initial-num))!='NaN'">
                     <xsl:value-of select="$initial-num"/>
                  </xsl:when>
                  <xsl:otherwise>1</xsl:otherwise>
               </xsl:choose>
            </xsl:variable>
            <xsl:choose>
               <xsl:when test="string(number($num))!='NaN'">
                  <xsl:number value="$num + $offset - 1" format="1"/>
               </xsl:when>
               <xsl:otherwise>?</xsl:otherwise>
            </xsl:choose>
         </xsl:when>
         <xsl:when test="not(ancestor::book[contains(@doctype,'cir') or contains(@doctype,'em') or contains(@doctype,'tmm')]) and not(ancestor::book[contains(@doctype,'oh')] and ancestor::ata-page-block/@pb-name[.='service']) and not(ancestor::book[contains(@doctype,'oh')] and ancestor::page-block/@pb-name[.='service']) and not(ancestor::ata-page-block/@pb-name[.='00awl' or .='00intro' or .='airlim' or .='awl' or .='awlror' or .='chapsect' or .='consume' or .='d-and-o' or .='frontmatte' or .='howtouse' or .='00howtouse' or .='intro' or .='nut_option' or .='oplimits' or .='sblist' or .='schedchk' or .='spectool' or .='timelim' or .='title-page']) and not(ancestor::page-block/@pb-name[.='00awl' or .='00intro' or .='airlim' or .='awl' or .='awlror' or .='chapsect' or .='consume' or .='d-and-o' or .='frontmatte' or .='howtouse' or .='00howtouse' or .='intro' or .='nut_option' or .='oplimits' or .='sblist' or .='schedchk' or .='spectool' or .='timelim' or .='title-page']) and not(ancestor::ata-page-block/@pb-name[(starts-with(., 'do') and 'do' = translate(., '0123456789', '') and string-length(.) &gt; 2) or (starts-with(., 'in') and 'in' = translate(., '0123456789', '') and string-length(.) &gt; 2) or (starts-with(., 'tl') and 'tl' = translate(., '0123456789', '') and string-length(.) &gt; 2) or .='toolsht' or .='trlist' or .='unschedc' or .='unschedchk']) and not(ancestor::page-block/@pb-name[(starts-with(., 'do') and 'do' = translate(., '0123456789', '') and string-length(.) &gt; 2) or (starts-with(., 'in') and 'in' = translate(., '0123456789', '') and string-length(.) &gt; 2) or (starts-with(., 'tl') and 'tl' = translate(., '0123456789', '') and string-length(.) &gt; 2) or .='toolsht' or .='trlist' or .='unschedc' or .='unschedchk']) and not(ancestor-or-self::ata-page-block[1]/@pb-name and string(ancestor-or-self::ata-page-block[1]/@pb-name)='intro00') and not(ancestor-or-self::page-block[1]/@pb-name and string(ancestor-or-self::page-block[1]/@pb-name)='intro00') and not(ancestor::ata-page-block/@pb-name[starts-with(., 'disassy') or starts-with(., 'fault')]) and not(ancestor::page-block/@pb-name[starts-with(., 'disassy') or starts-with(., 'fault')]) and not(ancestor::book[contains(@doctype,'oh')] and ancestor::ata-page-block/@pb-name[starts-with(., 'clean')]) and not(ancestor::book[contains(@doctype,'oh')] and ancestor::page-block/@pb-name[starts-with(., 'clean')]) and not(ancestor::ata-page-block/@pb-name[starts-with(., 'mainprac')]) and not(ancestor::page-block/@pb-name[starts-with(., 'mainprac')]) and not(ancestor::book[contains(@doctype,'oh')] and ancestor::ata-page-block/@pb-name[starts-with(., 'inspect')]) and not(ancestor::book[contains(@doctype,'oh')] and ancestor::page-block/@pb-name[starts-with(., 'inspect')]) and not(ancestor::ata-page-block/@pb-name[(starts-with(., 'di') and 'di' = translate(., '0123456789', '') and string-length(.) &gt; 2) or starts-with(.,'service')]) and not(ancestor::page-block/@pb-name[(starts-with(., 'di') and 'di' = translate(., '0123456789', '') and string-length(.) &gt; 2) or starts-with(.,'service')]) and (ancestor::book[contains(@doctype,'oh')] and ancestor::ata-page-block/@pb-name[starts-with(., 'repair')])">
            <xsl:variable name="node-id" select="generate-id(.)"/>
            <xsl:variable name="from-node" select="(ancestor-or-self::ata-page-block[not(ancestor::ata-page-block)])[last()]"/>
            <xsl:variable name="num">
               <xsl:variable name="candidate-num">
                  <xsl:choose>
                     <xsl:when test="count($from-node) &gt; 0">
                        <xsl:for-each select="$from-node/descendant-or-self::*[@_gte:count-as-id='cnt__table^ata-page-block.cnt']">
                           <xsl:if test="generate-id(.) = $node-id">
                              <xsl:value-of select="position()"/>
                           </xsl:if>
                        </xsl:for-each>
                     </xsl:when>
                     <xsl:otherwise>
                        <xsl:for-each select="//*[@_gte:count-as-id='cnt__table^ata-page-block.cnt'][not(ancestor-or-self::ata-page-block)]">
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
            <xsl:variable name="offset">
               <!--Evaluate startAtXPath using the first counted element within the numbering scope as the context node-->
               <xsl:variable name="initial-num">
                  <xsl:choose>
                     <xsl:when test="count($from-node) &gt; 0">
                        <xsl:apply-templates select="($from-node/descendant-or-self::*[@_gte:count-as-id='cnt__table^ata-page-block.cnt'])[1]" mode="startat-xpath"/>
                     </xsl:when>
                     <xsl:otherwise>
                        <xsl:apply-templates select="(//*[@_gte:count-as-id='cnt__table^ata-page-block.cnt'][not(ancestor-or-self::ata-page-block)])[1]" mode="startat-xpath"/>
                     </xsl:otherwise>
                  </xsl:choose>
               </xsl:variable>
               <xsl:choose>
                  <xsl:when test="string(number($initial-num))!='NaN'">
                     <xsl:value-of select="$initial-num"/>
                  </xsl:when>
                  <xsl:otherwise>1</xsl:otherwise>
               </xsl:choose>
            </xsl:variable>
            <xsl:choose>
               <xsl:when test="string(number($num))!='NaN'">
                  <xsl:number value="$num + $offset - 1" format="1"/>
               </xsl:when>
               <xsl:otherwise>?</xsl:otherwise>
            </xsl:choose>
         </xsl:when>
         <xsl:when test="not(ancestor::book[contains(@doctype,'cir') or contains(@doctype,'em') or contains(@doctype,'tmm')]) and not(ancestor::book[contains(@doctype,'oh')] and ancestor::ata-page-block/@pb-name[.='service']) and not(ancestor::book[contains(@doctype,'oh')] and ancestor::page-block/@pb-name[.='service']) and not(ancestor::ata-page-block/@pb-name[.='00awl' or .='00intro' or .='airlim' or .='awl' or .='awlror' or .='chapsect' or .='consume' or .='d-and-o' or .='frontmatte' or .='howtouse' or .='00howtouse' or .='intro' or .='nut_option' or .='oplimits' or .='sblist' or .='schedchk' or .='spectool' or .='timelim' or .='title-page']) and not(ancestor::page-block/@pb-name[.='00awl' or .='00intro' or .='airlim' or .='awl' or .='awlror' or .='chapsect' or .='consume' or .='d-and-o' or .='frontmatte' or .='howtouse' or .='00howtouse' or .='intro' or .='nut_option' or .='oplimits' or .='sblist' or .='schedchk' or .='spectool' or .='timelim' or .='title-page']) and not(ancestor::ata-page-block/@pb-name[(starts-with(., 'do') and 'do' = translate(., '0123456789', '') and string-length(.) &gt; 2) or (starts-with(., 'in') and 'in' = translate(., '0123456789', '') and string-length(.) &gt; 2) or (starts-with(., 'tl') and 'tl' = translate(., '0123456789', '') and string-length(.) &gt; 2) or .='toolsht' or .='trlist' or .='unschedc' or .='unschedchk']) and not(ancestor::page-block/@pb-name[(starts-with(., 'do') and 'do' = translate(., '0123456789', '') and string-length(.) &gt; 2) or (starts-with(., 'in') and 'in' = translate(., '0123456789', '') and string-length(.) &gt; 2) or (starts-with(., 'tl') and 'tl' = translate(., '0123456789', '') and string-length(.) &gt; 2) or .='toolsht' or .='trlist' or .='unschedc' or .='unschedchk']) and not(ancestor-or-self::ata-page-block[1]/@pb-name and string(ancestor-or-self::ata-page-block[1]/@pb-name)='intro00') and not(ancestor-or-self::page-block[1]/@pb-name and string(ancestor-or-self::page-block[1]/@pb-name)='intro00') and not(ancestor::ata-page-block/@pb-name[starts-with(., 'disassy') or starts-with(., 'fault')]) and not(ancestor::page-block/@pb-name[starts-with(., 'disassy') or starts-with(., 'fault')]) and not(ancestor::book[contains(@doctype,'oh')] and ancestor::ata-page-block/@pb-name[starts-with(., 'clean')]) and not(ancestor::book[contains(@doctype,'oh')] and ancestor::page-block/@pb-name[starts-with(., 'clean')]) and not(ancestor::ata-page-block/@pb-name[starts-with(., 'mainprac')]) and not(ancestor::page-block/@pb-name[starts-with(., 'mainprac')]) and not(ancestor::book[contains(@doctype,'oh')] and ancestor::ata-page-block/@pb-name[starts-with(., 'inspect')]) and not(ancestor::book[contains(@doctype,'oh')] and ancestor::page-block/@pb-name[starts-with(., 'inspect')]) and not(ancestor::ata-page-block/@pb-name[(starts-with(., 'di') and 'di' = translate(., '0123456789', '') and string-length(.) &gt; 2) or starts-with(.,'service')]) and (ancestor::page-block/@pb-name[(starts-with(., 'di') and 'di' = translate(., '0123456789', '') and string-length(.) &gt; 2) or starts-with(.,'service')])">
            <xsl:variable name="node-id" select="generate-id(.)"/>
            <xsl:variable name="from-node" select="(ancestor-or-self::page-block[not(ancestor::page-block)])[last()]"/>
            <xsl:variable name="num">
               <xsl:variable name="candidate-num">
                  <xsl:choose>
                     <xsl:when test="count($from-node) &gt; 0">
                        <xsl:for-each select="$from-node/descendant-or-self::*[@_gte:count-as-id='cnt__table^page-block.cnt']">
                           <xsl:if test="generate-id(.) = $node-id">
                              <xsl:value-of select="position()"/>
                           </xsl:if>
                        </xsl:for-each>
                     </xsl:when>
                     <xsl:otherwise>
                        <xsl:for-each select="//*[@_gte:count-as-id='cnt__table^page-block.cnt'][not(ancestor-or-self::page-block)]">
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
            <xsl:variable name="offset">
               <!--Evaluate startAtXPath using the first counted element within the numbering scope as the context node-->
               <xsl:variable name="initial-num">
                  <xsl:choose>
                     <xsl:when test="count($from-node) &gt; 0">
                        <xsl:apply-templates select="($from-node/descendant-or-self::*[@_gte:count-as-id='cnt__table^page-block.cnt'])[1]" mode="startat-xpath"/>
                     </xsl:when>
                     <xsl:otherwise>
                        <xsl:apply-templates select="(//*[@_gte:count-as-id='cnt__table^page-block.cnt'][not(ancestor-or-self::page-block)])[1]" mode="startat-xpath"/>
                     </xsl:otherwise>
                  </xsl:choose>
               </xsl:variable>
               <xsl:choose>
                  <xsl:when test="string(number($initial-num))!='NaN'">
                     <xsl:value-of select="$initial-num"/>
                  </xsl:when>
                  <xsl:otherwise>1</xsl:otherwise>
               </xsl:choose>
            </xsl:variable>
            <xsl:choose>
               <xsl:when test="string(number($num))!='NaN'">
                  <xsl:number value="$num + $offset - 1" format="1"/>
               </xsl:when>
               <xsl:otherwise>?</xsl:otherwise>
            </xsl:choose>
         </xsl:when>
         <xsl:when test="not(ancestor::book[contains(@doctype,'cir') or contains(@doctype,'em') or contains(@doctype,'tmm')]) and not(ancestor::book[contains(@doctype,'oh')] and ancestor::ata-page-block/@pb-name[.='service']) and not(ancestor::book[contains(@doctype,'oh')] and ancestor::page-block/@pb-name[.='service']) and not(ancestor::ata-page-block/@pb-name[.='00awl' or .='00intro' or .='airlim' or .='awl' or .='awlror' or .='chapsect' or .='consume' or .='d-and-o' or .='frontmatte' or .='howtouse' or .='00howtouse' or .='intro' or .='nut_option' or .='oplimits' or .='sblist' or .='schedchk' or .='spectool' or .='timelim' or .='title-page']) and not(ancestor::page-block/@pb-name[.='00awl' or .='00intro' or .='airlim' or .='awl' or .='awlror' or .='chapsect' or .='consume' or .='d-and-o' or .='frontmatte' or .='howtouse' or .='00howtouse' or .='intro' or .='nut_option' or .='oplimits' or .='sblist' or .='schedchk' or .='spectool' or .='timelim' or .='title-page']) and not(ancestor::ata-page-block/@pb-name[(starts-with(., 'do') and 'do' = translate(., '0123456789', '') and string-length(.) &gt; 2) or (starts-with(., 'in') and 'in' = translate(., '0123456789', '') and string-length(.) &gt; 2) or (starts-with(., 'tl') and 'tl' = translate(., '0123456789', '') and string-length(.) &gt; 2) or .='toolsht' or .='trlist' or .='unschedc' or .='unschedchk']) and not(ancestor::page-block/@pb-name[(starts-with(., 'do') and 'do' = translate(., '0123456789', '') and string-length(.) &gt; 2) or (starts-with(., 'in') and 'in' = translate(., '0123456789', '') and string-length(.) &gt; 2) or (starts-with(., 'tl') and 'tl' = translate(., '0123456789', '') and string-length(.) &gt; 2) or .='toolsht' or .='trlist' or .='unschedc' or .='unschedchk']) and not(ancestor-or-self::ata-page-block[1]/@pb-name and string(ancestor-or-self::ata-page-block[1]/@pb-name)='intro00') and not(ancestor-or-self::page-block[1]/@pb-name and string(ancestor-or-self::page-block[1]/@pb-name)='intro00') and not(ancestor::ata-page-block/@pb-name[starts-with(., 'disassy') or starts-with(., 'fault')]) and not(ancestor::page-block/@pb-name[starts-with(., 'disassy') or starts-with(., 'fault')]) and not(ancestor::book[contains(@doctype,'oh')] and ancestor::ata-page-block/@pb-name[starts-with(., 'clean')]) and not(ancestor::book[contains(@doctype,'oh')] and ancestor::page-block/@pb-name[starts-with(., 'clean')]) and not(ancestor::ata-page-block/@pb-name[starts-with(., 'mainprac')]) and not(ancestor::page-block/@pb-name[starts-with(., 'mainprac')]) and not(ancestor::book[contains(@doctype,'oh')] and ancestor::ata-page-block/@pb-name[starts-with(., 'inspect')]) and not(ancestor::book[contains(@doctype,'oh')] and ancestor::page-block/@pb-name[starts-with(., 'inspect')]) and (ancestor::ata-page-block/@pb-name[(starts-with(., 'di') and 'di' = translate(., '0123456789', '') and string-length(.) &gt; 2) or starts-with(.,'service')])">
            <xsl:variable name="node-id" select="generate-id(.)"/>
            <xsl:variable name="from-node" select="(ancestor-or-self::ata-page-block[not(ancestor::ata-page-block)])[last()]"/>
            <xsl:variable name="num">
               <xsl:variable name="candidate-num">
                  <xsl:choose>
                     <xsl:when test="count($from-node) &gt; 0">
                        <xsl:for-each select="$from-node/descendant-or-self::*[@_gte:count-as-id='cnt__table^ata-page-block.cnt']">
                           <xsl:if test="generate-id(.) = $node-id">
                              <xsl:value-of select="position()"/>
                           </xsl:if>
                        </xsl:for-each>
                     </xsl:when>
                     <xsl:otherwise>
                        <xsl:for-each select="//*[@_gte:count-as-id='cnt__table^ata-page-block.cnt'][not(ancestor-or-self::ata-page-block)]">
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
            <xsl:variable name="offset">
               <!--Evaluate startAtXPath using the first counted element within the numbering scope as the context node-->
               <xsl:variable name="initial-num">
                  <xsl:choose>
                     <xsl:when test="count($from-node) &gt; 0">
                        <xsl:apply-templates select="($from-node/descendant-or-self::*[@_gte:count-as-id='cnt__table^ata-page-block.cnt'])[1]" mode="startat-xpath"/>
                     </xsl:when>
                     <xsl:otherwise>
                        <xsl:apply-templates select="(//*[@_gte:count-as-id='cnt__table^ata-page-block.cnt'][not(ancestor-or-self::ata-page-block)])[1]" mode="startat-xpath"/>
                     </xsl:otherwise>
                  </xsl:choose>
               </xsl:variable>
               <xsl:choose>
                  <xsl:when test="string(number($initial-num))!='NaN'">
                     <xsl:value-of select="$initial-num"/>
                  </xsl:when>
                  <xsl:otherwise>1</xsl:otherwise>
               </xsl:choose>
            </xsl:variable>
            <xsl:choose>
               <xsl:when test="string(number($num))!='NaN'">
                  <xsl:number value="$num + $offset - 1" format="1"/>
               </xsl:when>
               <xsl:otherwise>?</xsl:otherwise>
            </xsl:choose>
         </xsl:when>
         <xsl:when test="not(ancestor::book[contains(@doctype,'cir') or contains(@doctype,'em') or contains(@doctype,'tmm')]) and not(ancestor::book[contains(@doctype,'oh')] and ancestor::ata-page-block/@pb-name[.='service']) and not(ancestor::book[contains(@doctype,'oh')] and ancestor::page-block/@pb-name[.='service']) and not(ancestor::ata-page-block/@pb-name[.='00awl' or .='00intro' or .='airlim' or .='awl' or .='awlror' or .='chapsect' or .='consume' or .='d-and-o' or .='frontmatte' or .='howtouse' or .='00howtouse' or .='intro' or .='nut_option' or .='oplimits' or .='sblist' or .='schedchk' or .='spectool' or .='timelim' or .='title-page']) and not(ancestor::page-block/@pb-name[.='00awl' or .='00intro' or .='airlim' or .='awl' or .='awlror' or .='chapsect' or .='consume' or .='d-and-o' or .='frontmatte' or .='howtouse' or .='00howtouse' or .='intro' or .='nut_option' or .='oplimits' or .='sblist' or .='schedchk' or .='spectool' or .='timelim' or .='title-page']) and not(ancestor::ata-page-block/@pb-name[(starts-with(., 'do') and 'do' = translate(., '0123456789', '') and string-length(.) &gt; 2) or (starts-with(., 'in') and 'in' = translate(., '0123456789', '') and string-length(.) &gt; 2) or (starts-with(., 'tl') and 'tl' = translate(., '0123456789', '') and string-length(.) &gt; 2) or .='toolsht' or .='trlist' or .='unschedc' or .='unschedchk']) and not(ancestor::page-block/@pb-name[(starts-with(., 'do') and 'do' = translate(., '0123456789', '') and string-length(.) &gt; 2) or (starts-with(., 'in') and 'in' = translate(., '0123456789', '') and string-length(.) &gt; 2) or (starts-with(., 'tl') and 'tl' = translate(., '0123456789', '') and string-length(.) &gt; 2) or .='toolsht' or .='trlist' or .='unschedc' or .='unschedchk']) and not(ancestor-or-self::ata-page-block[1]/@pb-name and string(ancestor-or-self::ata-page-block[1]/@pb-name)='intro00') and not(ancestor-or-self::page-block[1]/@pb-name and string(ancestor-or-self::page-block[1]/@pb-name)='intro00') and not(ancestor::ata-page-block/@pb-name[starts-with(., 'disassy') or starts-with(., 'fault')]) and not(ancestor::page-block/@pb-name[starts-with(., 'disassy') or starts-with(., 'fault')]) and not(ancestor::book[contains(@doctype,'oh')] and ancestor::ata-page-block/@pb-name[starts-with(., 'clean')]) and not(ancestor::book[contains(@doctype,'oh')] and ancestor::page-block/@pb-name[starts-with(., 'clean')]) and not(ancestor::ata-page-block/@pb-name[starts-with(., 'mainprac')]) and not(ancestor::page-block/@pb-name[starts-with(., 'mainprac')]) and not(ancestor::book[contains(@doctype,'oh')] and ancestor::ata-page-block/@pb-name[starts-with(., 'inspect')]) and (ancestor::book[contains(@doctype,'oh')] and ancestor::page-block/@pb-name[starts-with(., 'inspect')])">
            <xsl:variable name="node-id" select="generate-id(.)"/>
            <xsl:variable name="from-node" select="(ancestor-or-self::page-block[not(ancestor::page-block)])[last()]"/>
            <xsl:variable name="num">
               <xsl:variable name="candidate-num">
                  <xsl:choose>
                     <xsl:when test="count($from-node) &gt; 0">
                        <xsl:for-each select="$from-node/descendant-or-self::*[@_gte:count-as-id='cnt__table^page-block.cnt']">
                           <xsl:if test="generate-id(.) = $node-id">
                              <xsl:value-of select="position()"/>
                           </xsl:if>
                        </xsl:for-each>
                     </xsl:when>
                     <xsl:otherwise>
                        <xsl:for-each select="//*[@_gte:count-as-id='cnt__table^page-block.cnt'][not(ancestor-or-self::page-block)]">
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
            <xsl:variable name="offset">
               <!--Evaluate startAtXPath using the first counted element within the numbering scope as the context node-->
               <xsl:variable name="initial-num">
                  <xsl:choose>
                     <xsl:when test="count($from-node) &gt; 0">
                        <xsl:apply-templates select="($from-node/descendant-or-self::*[@_gte:count-as-id='cnt__table^page-block.cnt'])[1]" mode="startat-xpath"/>
                     </xsl:when>
                     <xsl:otherwise>
                        <xsl:apply-templates select="(//*[@_gte:count-as-id='cnt__table^page-block.cnt'][not(ancestor-or-self::page-block)])[1]" mode="startat-xpath"/>
                     </xsl:otherwise>
                  </xsl:choose>
               </xsl:variable>
               <xsl:choose>
                  <xsl:when test="string(number($initial-num))!='NaN'">
                     <xsl:value-of select="$initial-num"/>
                  </xsl:when>
                  <xsl:otherwise>1</xsl:otherwise>
               </xsl:choose>
            </xsl:variable>
            <xsl:choose>
               <xsl:when test="string(number($num))!='NaN'">
                  <xsl:number value="$num + $offset - 1" format="1"/>
               </xsl:when>
               <xsl:otherwise>?</xsl:otherwise>
            </xsl:choose>
         </xsl:when>
         <xsl:when test="not(ancestor::book[contains(@doctype,'cir') or contains(@doctype,'em') or contains(@doctype,'tmm')]) and not(ancestor::book[contains(@doctype,'oh')] and ancestor::ata-page-block/@pb-name[.='service']) and not(ancestor::book[contains(@doctype,'oh')] and ancestor::page-block/@pb-name[.='service']) and not(ancestor::ata-page-block/@pb-name[.='00awl' or .='00intro' or .='airlim' or .='awl' or .='awlror' or .='chapsect' or .='consume' or .='d-and-o' or .='frontmatte' or .='howtouse' or .='00howtouse' or .='intro' or .='nut_option' or .='oplimits' or .='sblist' or .='schedchk' or .='spectool' or .='timelim' or .='title-page']) and not(ancestor::page-block/@pb-name[.='00awl' or .='00intro' or .='airlim' or .='awl' or .='awlror' or .='chapsect' or .='consume' or .='d-and-o' or .='frontmatte' or .='howtouse' or .='00howtouse' or .='intro' or .='nut_option' or .='oplimits' or .='sblist' or .='schedchk' or .='spectool' or .='timelim' or .='title-page']) and not(ancestor::ata-page-block/@pb-name[(starts-with(., 'do') and 'do' = translate(., '0123456789', '') and string-length(.) &gt; 2) or (starts-with(., 'in') and 'in' = translate(., '0123456789', '') and string-length(.) &gt; 2) or (starts-with(., 'tl') and 'tl' = translate(., '0123456789', '') and string-length(.) &gt; 2) or .='toolsht' or .='trlist' or .='unschedc' or .='unschedchk']) and not(ancestor::page-block/@pb-name[(starts-with(., 'do') and 'do' = translate(., '0123456789', '') and string-length(.) &gt; 2) or (starts-with(., 'in') and 'in' = translate(., '0123456789', '') and string-length(.) &gt; 2) or (starts-with(., 'tl') and 'tl' = translate(., '0123456789', '') and string-length(.) &gt; 2) or .='toolsht' or .='trlist' or .='unschedc' or .='unschedchk']) and not(ancestor-or-self::ata-page-block[1]/@pb-name and string(ancestor-or-self::ata-page-block[1]/@pb-name)='intro00') and not(ancestor-or-self::page-block[1]/@pb-name and string(ancestor-or-self::page-block[1]/@pb-name)='intro00') and not(ancestor::ata-page-block/@pb-name[starts-with(., 'disassy') or starts-with(., 'fault')]) and not(ancestor::page-block/@pb-name[starts-with(., 'disassy') or starts-with(., 'fault')]) and not(ancestor::book[contains(@doctype,'oh')] and ancestor::ata-page-block/@pb-name[starts-with(., 'clean')]) and not(ancestor::book[contains(@doctype,'oh')] and ancestor::page-block/@pb-name[starts-with(., 'clean')]) and not(ancestor::ata-page-block/@pb-name[starts-with(., 'mainprac')]) and not(ancestor::page-block/@pb-name[starts-with(., 'mainprac')]) and (ancestor::book[contains(@doctype,'oh')] and ancestor::ata-page-block/@pb-name[starts-with(., 'inspect')])">
            <xsl:variable name="node-id" select="generate-id(.)"/>
            <xsl:variable name="from-node" select="(ancestor-or-self::ata-page-block[not(ancestor::ata-page-block)])[last()]"/>
            <xsl:variable name="num">
               <xsl:variable name="candidate-num">
                  <xsl:choose>
                     <xsl:when test="count($from-node) &gt; 0">
                        <xsl:for-each select="$from-node/descendant-or-self::*[@_gte:count-as-id='cnt__table^ata-page-block.cnt']">
                           <xsl:if test="generate-id(.) = $node-id">
                              <xsl:value-of select="position()"/>
                           </xsl:if>
                        </xsl:for-each>
                     </xsl:when>
                     <xsl:otherwise>
                        <xsl:for-each select="//*[@_gte:count-as-id='cnt__table^ata-page-block.cnt'][not(ancestor-or-self::ata-page-block)]">
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
            <xsl:variable name="offset">
               <!--Evaluate startAtXPath using the first counted element within the numbering scope as the context node-->
               <xsl:variable name="initial-num">
                  <xsl:choose>
                     <xsl:when test="count($from-node) &gt; 0">
                        <xsl:apply-templates select="($from-node/descendant-or-self::*[@_gte:count-as-id='cnt__table^ata-page-block.cnt'])[1]" mode="startat-xpath"/>
                     </xsl:when>
                     <xsl:otherwise>
                        <xsl:apply-templates select="(//*[@_gte:count-as-id='cnt__table^ata-page-block.cnt'][not(ancestor-or-self::ata-page-block)])[1]" mode="startat-xpath"/>
                     </xsl:otherwise>
                  </xsl:choose>
               </xsl:variable>
               <xsl:choose>
                  <xsl:when test="string(number($initial-num))!='NaN'">
                     <xsl:value-of select="$initial-num"/>
                  </xsl:when>
                  <xsl:otherwise>1</xsl:otherwise>
               </xsl:choose>
            </xsl:variable>
            <xsl:choose>
               <xsl:when test="string(number($num))!='NaN'">
                  <xsl:number value="$num + $offset - 1" format="1"/>
               </xsl:when>
               <xsl:otherwise>?</xsl:otherwise>
            </xsl:choose>
         </xsl:when>
         <xsl:when test="not(ancestor::book[contains(@doctype,'cir') or contains(@doctype,'em') or contains(@doctype,'tmm')]) and not(ancestor::book[contains(@doctype,'oh')] and ancestor::ata-page-block/@pb-name[.='service']) and not(ancestor::book[contains(@doctype,'oh')] and ancestor::page-block/@pb-name[.='service']) and not(ancestor::ata-page-block/@pb-name[.='00awl' or .='00intro' or .='airlim' or .='awl' or .='awlror' or .='chapsect' or .='consume' or .='d-and-o' or .='frontmatte' or .='howtouse' or .='00howtouse' or .='intro' or .='nut_option' or .='oplimits' or .='sblist' or .='schedchk' or .='spectool' or .='timelim' or .='title-page']) and not(ancestor::page-block/@pb-name[.='00awl' or .='00intro' or .='airlim' or .='awl' or .='awlror' or .='chapsect' or .='consume' or .='d-and-o' or .='frontmatte' or .='howtouse' or .='00howtouse' or .='intro' or .='nut_option' or .='oplimits' or .='sblist' or .='schedchk' or .='spectool' or .='timelim' or .='title-page']) and not(ancestor::ata-page-block/@pb-name[(starts-with(., 'do') and 'do' = translate(., '0123456789', '') and string-length(.) &gt; 2) or (starts-with(., 'in') and 'in' = translate(., '0123456789', '') and string-length(.) &gt; 2) or (starts-with(., 'tl') and 'tl' = translate(., '0123456789', '') and string-length(.) &gt; 2) or .='toolsht' or .='trlist' or .='unschedc' or .='unschedchk']) and not(ancestor::page-block/@pb-name[(starts-with(., 'do') and 'do' = translate(., '0123456789', '') and string-length(.) &gt; 2) or (starts-with(., 'in') and 'in' = translate(., '0123456789', '') and string-length(.) &gt; 2) or (starts-with(., 'tl') and 'tl' = translate(., '0123456789', '') and string-length(.) &gt; 2) or .='toolsht' or .='trlist' or .='unschedc' or .='unschedchk']) and not(ancestor-or-self::ata-page-block[1]/@pb-name and string(ancestor-or-self::ata-page-block[1]/@pb-name)='intro00') and not(ancestor-or-self::page-block[1]/@pb-name and string(ancestor-or-self::page-block[1]/@pb-name)='intro00') and not(ancestor::ata-page-block/@pb-name[starts-with(., 'disassy') or starts-with(., 'fault')]) and not(ancestor::page-block/@pb-name[starts-with(., 'disassy') or starts-with(., 'fault')]) and not(ancestor::book[contains(@doctype,'oh')] and ancestor::ata-page-block/@pb-name[starts-with(., 'clean')]) and not(ancestor::book[contains(@doctype,'oh')] and ancestor::page-block/@pb-name[starts-with(., 'clean')]) and not(ancestor::ata-page-block/@pb-name[starts-with(., 'mainprac')]) and (ancestor::page-block/@pb-name[starts-with(., 'mainprac')])">
            <xsl:variable name="node-id" select="generate-id(.)"/>
            <xsl:variable name="from-node" select="(ancestor-or-self::page-block[not(ancestor::page-block)])[last()]"/>
            <xsl:variable name="num">
               <xsl:variable name="candidate-num">
                  <xsl:choose>
                     <xsl:when test="count($from-node) &gt; 0">
                        <xsl:for-each select="$from-node/descendant-or-self::*[@_gte:count-as-id='cnt__table^page-block.cnt']">
                           <xsl:if test="generate-id(.) = $node-id">
                              <xsl:value-of select="position()"/>
                           </xsl:if>
                        </xsl:for-each>
                     </xsl:when>
                     <xsl:otherwise>
                        <xsl:for-each select="//*[@_gte:count-as-id='cnt__table^page-block.cnt'][not(ancestor-or-self::page-block)]">
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
            <xsl:variable name="offset">
               <!--Evaluate startAtXPath using the first counted element within the numbering scope as the context node-->
               <xsl:variable name="initial-num">
                  <xsl:choose>
                     <xsl:when test="count($from-node) &gt; 0">
                        <xsl:apply-templates select="($from-node/descendant-or-self::*[@_gte:count-as-id='cnt__table^page-block.cnt'])[1]" mode="startat-xpath"/>
                     </xsl:when>
                     <xsl:otherwise>
                        <xsl:apply-templates select="(//*[@_gte:count-as-id='cnt__table^page-block.cnt'][not(ancestor-or-self::page-block)])[1]" mode="startat-xpath"/>
                     </xsl:otherwise>
                  </xsl:choose>
               </xsl:variable>
               <xsl:choose>
                  <xsl:when test="string(number($initial-num))!='NaN'">
                     <xsl:value-of select="$initial-num"/>
                  </xsl:when>
                  <xsl:otherwise>1</xsl:otherwise>
               </xsl:choose>
            </xsl:variable>
            <xsl:choose>
               <xsl:when test="string(number($num))!='NaN'">
                  <xsl:number value="$num + $offset - 1" format="1"/>
               </xsl:when>
               <xsl:otherwise>?</xsl:otherwise>
            </xsl:choose>
         </xsl:when>
         <xsl:when test="not(ancestor::book[contains(@doctype,'cir') or contains(@doctype,'em') or contains(@doctype,'tmm')]) and not(ancestor::book[contains(@doctype,'oh')] and ancestor::ata-page-block/@pb-name[.='service']) and not(ancestor::book[contains(@doctype,'oh')] and ancestor::page-block/@pb-name[.='service']) and not(ancestor::ata-page-block/@pb-name[.='00awl' or .='00intro' or .='airlim' or .='awl' or .='awlror' or .='chapsect' or .='consume' or .='d-and-o' or .='frontmatte' or .='howtouse' or .='00howtouse' or .='intro' or .='nut_option' or .='oplimits' or .='sblist' or .='schedchk' or .='spectool' or .='timelim' or .='title-page']) and not(ancestor::page-block/@pb-name[.='00awl' or .='00intro' or .='airlim' or .='awl' or .='awlror' or .='chapsect' or .='consume' or .='d-and-o' or .='frontmatte' or .='howtouse' or .='00howtouse' or .='intro' or .='nut_option' or .='oplimits' or .='sblist' or .='schedchk' or .='spectool' or .='timelim' or .='title-page']) and not(ancestor::ata-page-block/@pb-name[(starts-with(., 'do') and 'do' = translate(., '0123456789', '') and string-length(.) &gt; 2) or (starts-with(., 'in') and 'in' = translate(., '0123456789', '') and string-length(.) &gt; 2) or (starts-with(., 'tl') and 'tl' = translate(., '0123456789', '') and string-length(.) &gt; 2) or .='toolsht' or .='trlist' or .='unschedc' or .='unschedchk']) and not(ancestor::page-block/@pb-name[(starts-with(., 'do') and 'do' = translate(., '0123456789', '') and string-length(.) &gt; 2) or (starts-with(., 'in') and 'in' = translate(., '0123456789', '') and string-length(.) &gt; 2) or (starts-with(., 'tl') and 'tl' = translate(., '0123456789', '') and string-length(.) &gt; 2) or .='toolsht' or .='trlist' or .='unschedc' or .='unschedchk']) and not(ancestor-or-self::ata-page-block[1]/@pb-name and string(ancestor-or-self::ata-page-block[1]/@pb-name)='intro00') and not(ancestor-or-self::page-block[1]/@pb-name and string(ancestor-or-self::page-block[1]/@pb-name)='intro00') and not(ancestor::ata-page-block/@pb-name[starts-with(., 'disassy') or starts-with(., 'fault')]) and not(ancestor::page-block/@pb-name[starts-with(., 'disassy') or starts-with(., 'fault')]) and not(ancestor::book[contains(@doctype,'oh')] and ancestor::ata-page-block/@pb-name[starts-with(., 'clean')]) and not(ancestor::book[contains(@doctype,'oh')] and ancestor::page-block/@pb-name[starts-with(., 'clean')]) and (ancestor::ata-page-block/@pb-name[starts-with(., 'mainprac')])">
            <xsl:variable name="node-id" select="generate-id(.)"/>
            <xsl:variable name="from-node" select="(ancestor-or-self::ata-page-block[not(ancestor::ata-page-block)])[last()]"/>
            <xsl:variable name="num">
               <xsl:variable name="candidate-num">
                  <xsl:choose>
                     <xsl:when test="count($from-node) &gt; 0">
                        <xsl:for-each select="$from-node/descendant-or-self::*[@_gte:count-as-id='cnt__table^ata-page-block.cnt']">
                           <xsl:if test="generate-id(.) = $node-id">
                              <xsl:value-of select="position()"/>
                           </xsl:if>
                        </xsl:for-each>
                     </xsl:when>
                     <xsl:otherwise>
                        <xsl:for-each select="//*[@_gte:count-as-id='cnt__table^ata-page-block.cnt'][not(ancestor-or-self::ata-page-block)]">
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
            <xsl:variable name="offset">
               <!--Evaluate startAtXPath using the first counted element within the numbering scope as the context node-->
               <xsl:variable name="initial-num">
                  <xsl:choose>
                     <xsl:when test="count($from-node) &gt; 0">
                        <xsl:apply-templates select="($from-node/descendant-or-self::*[@_gte:count-as-id='cnt__table^ata-page-block.cnt'])[1]" mode="startat-xpath"/>
                     </xsl:when>
                     <xsl:otherwise>
                        <xsl:apply-templates select="(//*[@_gte:count-as-id='cnt__table^ata-page-block.cnt'][not(ancestor-or-self::ata-page-block)])[1]" mode="startat-xpath"/>
                     </xsl:otherwise>
                  </xsl:choose>
               </xsl:variable>
               <xsl:choose>
                  <xsl:when test="string(number($initial-num))!='NaN'">
                     <xsl:value-of select="$initial-num"/>
                  </xsl:when>
                  <xsl:otherwise>1</xsl:otherwise>
               </xsl:choose>
            </xsl:variable>
            <xsl:choose>
               <xsl:when test="string(number($num))!='NaN'">
                  <xsl:number value="$num + $offset - 1" format="1"/>
               </xsl:when>
               <xsl:otherwise>?</xsl:otherwise>
            </xsl:choose>
         </xsl:when>
         <xsl:when test="not(ancestor::book[contains(@doctype,'cir') or contains(@doctype,'em') or contains(@doctype,'tmm')]) and not(ancestor::book[contains(@doctype,'oh')] and ancestor::ata-page-block/@pb-name[.='service']) and not(ancestor::book[contains(@doctype,'oh')] and ancestor::page-block/@pb-name[.='service']) and not(ancestor::ata-page-block/@pb-name[.='00awl' or .='00intro' or .='airlim' or .='awl' or .='awlror' or .='chapsect' or .='consume' or .='d-and-o' or .='frontmatte' or .='howtouse' or .='00howtouse' or .='intro' or .='nut_option' or .='oplimits' or .='sblist' or .='schedchk' or .='spectool' or .='timelim' or .='title-page']) and not(ancestor::page-block/@pb-name[.='00awl' or .='00intro' or .='airlim' or .='awl' or .='awlror' or .='chapsect' or .='consume' or .='d-and-o' or .='frontmatte' or .='howtouse' or .='00howtouse' or .='intro' or .='nut_option' or .='oplimits' or .='sblist' or .='schedchk' or .='spectool' or .='timelim' or .='title-page']) and not(ancestor::ata-page-block/@pb-name[(starts-with(., 'do') and 'do' = translate(., '0123456789', '') and string-length(.) &gt; 2) or (starts-with(., 'in') and 'in' = translate(., '0123456789', '') and string-length(.) &gt; 2) or (starts-with(., 'tl') and 'tl' = translate(., '0123456789', '') and string-length(.) &gt; 2) or .='toolsht' or .='trlist' or .='unschedc' or .='unschedchk']) and not(ancestor::page-block/@pb-name[(starts-with(., 'do') and 'do' = translate(., '0123456789', '') and string-length(.) &gt; 2) or (starts-with(., 'in') and 'in' = translate(., '0123456789', '') and string-length(.) &gt; 2) or (starts-with(., 'tl') and 'tl' = translate(., '0123456789', '') and string-length(.) &gt; 2) or .='toolsht' or .='trlist' or .='unschedc' or .='unschedchk']) and not(ancestor-or-self::ata-page-block[1]/@pb-name and string(ancestor-or-self::ata-page-block[1]/@pb-name)='intro00') and not(ancestor-or-self::page-block[1]/@pb-name and string(ancestor-or-self::page-block[1]/@pb-name)='intro00') and not(ancestor::ata-page-block/@pb-name[starts-with(., 'disassy') or starts-with(., 'fault')]) and not(ancestor::page-block/@pb-name[starts-with(., 'disassy') or starts-with(., 'fault')]) and not(ancestor::book[contains(@doctype,'oh')] and ancestor::ata-page-block/@pb-name[starts-with(., 'clean')]) and (ancestor::book[contains(@doctype,'oh')] and ancestor::page-block/@pb-name[starts-with(., 'clean')])">
            <xsl:variable name="node-id" select="generate-id(.)"/>
            <xsl:variable name="from-node" select="(ancestor-or-self::page-block[not(ancestor::page-block)])[last()]"/>
            <xsl:variable name="num">
               <xsl:variable name="candidate-num">
                  <xsl:choose>
                     <xsl:when test="count($from-node) &gt; 0">
                        <xsl:for-each select="$from-node/descendant-or-self::*[@_gte:count-as-id='cnt__table^page-block.cnt']">
                           <xsl:if test="generate-id(.) = $node-id">
                              <xsl:value-of select="position()"/>
                           </xsl:if>
                        </xsl:for-each>
                     </xsl:when>
                     <xsl:otherwise>
                        <xsl:for-each select="//*[@_gte:count-as-id='cnt__table^page-block.cnt'][not(ancestor-or-self::page-block)]">
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
            <xsl:variable name="offset">
               <!--Evaluate startAtXPath using the first counted element within the numbering scope as the context node-->
               <xsl:variable name="initial-num">
                  <xsl:choose>
                     <xsl:when test="count($from-node) &gt; 0">
                        <xsl:apply-templates select="($from-node/descendant-or-self::*[@_gte:count-as-id='cnt__table^page-block.cnt'])[1]" mode="startat-xpath"/>
                     </xsl:when>
                     <xsl:otherwise>
                        <xsl:apply-templates select="(//*[@_gte:count-as-id='cnt__table^page-block.cnt'][not(ancestor-or-self::page-block)])[1]" mode="startat-xpath"/>
                     </xsl:otherwise>
                  </xsl:choose>
               </xsl:variable>
               <xsl:choose>
                  <xsl:when test="string(number($initial-num))!='NaN'">
                     <xsl:value-of select="$initial-num"/>
                  </xsl:when>
                  <xsl:otherwise>1</xsl:otherwise>
               </xsl:choose>
            </xsl:variable>
            <xsl:choose>
               <xsl:when test="string(number($num))!='NaN'">
                  <xsl:number value="$num + $offset - 1" format="1"/>
               </xsl:when>
               <xsl:otherwise>?</xsl:otherwise>
            </xsl:choose>
         </xsl:when>
         <xsl:when test="not(ancestor::book[contains(@doctype,'cir') or contains(@doctype,'em') or contains(@doctype,'tmm')]) and not(ancestor::book[contains(@doctype,'oh')] and ancestor::ata-page-block/@pb-name[.='service']) and not(ancestor::book[contains(@doctype,'oh')] and ancestor::page-block/@pb-name[.='service']) and not(ancestor::ata-page-block/@pb-name[.='00awl' or .='00intro' or .='airlim' or .='awl' or .='awlror' or .='chapsect' or .='consume' or .='d-and-o' or .='frontmatte' or .='howtouse' or .='00howtouse' or .='intro' or .='nut_option' or .='oplimits' or .='sblist' or .='schedchk' or .='spectool' or .='timelim' or .='title-page']) and not(ancestor::page-block/@pb-name[.='00awl' or .='00intro' or .='airlim' or .='awl' or .='awlror' or .='chapsect' or .='consume' or .='d-and-o' or .='frontmatte' or .='howtouse' or .='00howtouse' or .='intro' or .='nut_option' or .='oplimits' or .='sblist' or .='schedchk' or .='spectool' or .='timelim' or .='title-page']) and not(ancestor::ata-page-block/@pb-name[(starts-with(., 'do') and 'do' = translate(., '0123456789', '') and string-length(.) &gt; 2) or (starts-with(., 'in') and 'in' = translate(., '0123456789', '') and string-length(.) &gt; 2) or (starts-with(., 'tl') and 'tl' = translate(., '0123456789', '') and string-length(.) &gt; 2) or .='toolsht' or .='trlist' or .='unschedc' or .='unschedchk']) and not(ancestor::page-block/@pb-name[(starts-with(., 'do') and 'do' = translate(., '0123456789', '') and string-length(.) &gt; 2) or (starts-with(., 'in') and 'in' = translate(., '0123456789', '') and string-length(.) &gt; 2) or (starts-with(., 'tl') and 'tl' = translate(., '0123456789', '') and string-length(.) &gt; 2) or .='toolsht' or .='trlist' or .='unschedc' or .='unschedchk']) and not(ancestor-or-self::ata-page-block[1]/@pb-name and string(ancestor-or-self::ata-page-block[1]/@pb-name)='intro00') and not(ancestor-or-self::page-block[1]/@pb-name and string(ancestor-or-self::page-block[1]/@pb-name)='intro00') and not(ancestor::ata-page-block/@pb-name[starts-with(., 'disassy') or starts-with(., 'fault')]) and not(ancestor::page-block/@pb-name[starts-with(., 'disassy') or starts-with(., 'fault')]) and (ancestor::book[contains(@doctype,'oh')] and ancestor::ata-page-block/@pb-name[starts-with(., 'clean')])">
            <xsl:variable name="node-id" select="generate-id(.)"/>
            <xsl:variable name="from-node" select="(ancestor-or-self::ata-page-block[not(ancestor::ata-page-block)])[last()]"/>
            <xsl:variable name="num">
               <xsl:variable name="candidate-num">
                  <xsl:choose>
                     <xsl:when test="count($from-node) &gt; 0">
                        <xsl:for-each select="$from-node/descendant-or-self::*[@_gte:count-as-id='cnt__table^ata-page-block.cnt']">
                           <xsl:if test="generate-id(.) = $node-id">
                              <xsl:value-of select="position()"/>
                           </xsl:if>
                        </xsl:for-each>
                     </xsl:when>
                     <xsl:otherwise>
                        <xsl:for-each select="//*[@_gte:count-as-id='cnt__table^ata-page-block.cnt'][not(ancestor-or-self::ata-page-block)]">
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
            <xsl:variable name="offset">
               <!--Evaluate startAtXPath using the first counted element within the numbering scope as the context node-->
               <xsl:variable name="initial-num">
                  <xsl:choose>
                     <xsl:when test="count($from-node) &gt; 0">
                        <xsl:apply-templates select="($from-node/descendant-or-self::*[@_gte:count-as-id='cnt__table^ata-page-block.cnt'])[1]" mode="startat-xpath"/>
                     </xsl:when>
                     <xsl:otherwise>
                        <xsl:apply-templates select="(//*[@_gte:count-as-id='cnt__table^ata-page-block.cnt'][not(ancestor-or-self::ata-page-block)])[1]" mode="startat-xpath"/>
                     </xsl:otherwise>
                  </xsl:choose>
               </xsl:variable>
               <xsl:choose>
                  <xsl:when test="string(number($initial-num))!='NaN'">
                     <xsl:value-of select="$initial-num"/>
                  </xsl:when>
                  <xsl:otherwise>1</xsl:otherwise>
               </xsl:choose>
            </xsl:variable>
            <xsl:choose>
               <xsl:when test="string(number($num))!='NaN'">
                  <xsl:number value="$num + $offset - 1" format="1"/>
               </xsl:when>
               <xsl:otherwise>?</xsl:otherwise>
            </xsl:choose>
         </xsl:when>
         <xsl:when test="not(ancestor::book[contains(@doctype,'cir') or contains(@doctype,'em') or contains(@doctype,'tmm')]) and not(ancestor::book[contains(@doctype,'oh')] and ancestor::ata-page-block/@pb-name[.='service']) and not(ancestor::book[contains(@doctype,'oh')] and ancestor::page-block/@pb-name[.='service']) and not(ancestor::ata-page-block/@pb-name[.='00awl' or .='00intro' or .='airlim' or .='awl' or .='awlror' or .='chapsect' or .='consume' or .='d-and-o' or .='frontmatte' or .='howtouse' or .='00howtouse' or .='intro' or .='nut_option' or .='oplimits' or .='sblist' or .='schedchk' or .='spectool' or .='timelim' or .='title-page']) and not(ancestor::page-block/@pb-name[.='00awl' or .='00intro' or .='airlim' or .='awl' or .='awlror' or .='chapsect' or .='consume' or .='d-and-o' or .='frontmatte' or .='howtouse' or .='00howtouse' or .='intro' or .='nut_option' or .='oplimits' or .='sblist' or .='schedchk' or .='spectool' or .='timelim' or .='title-page']) and not(ancestor::ata-page-block/@pb-name[(starts-with(., 'do') and 'do' = translate(., '0123456789', '') and string-length(.) &gt; 2) or (starts-with(., 'in') and 'in' = translate(., '0123456789', '') and string-length(.) &gt; 2) or (starts-with(., 'tl') and 'tl' = translate(., '0123456789', '') and string-length(.) &gt; 2) or .='toolsht' or .='trlist' or .='unschedc' or .='unschedchk']) and not(ancestor::page-block/@pb-name[(starts-with(., 'do') and 'do' = translate(., '0123456789', '') and string-length(.) &gt; 2) or (starts-with(., 'in') and 'in' = translate(., '0123456789', '') and string-length(.) &gt; 2) or (starts-with(., 'tl') and 'tl' = translate(., '0123456789', '') and string-length(.) &gt; 2) or .='toolsht' or .='trlist' or .='unschedc' or .='unschedchk']) and not(ancestor-or-self::ata-page-block[1]/@pb-name and string(ancestor-or-self::ata-page-block[1]/@pb-name)='intro00') and not(ancestor-or-self::page-block[1]/@pb-name and string(ancestor-or-self::page-block[1]/@pb-name)='intro00') and not(ancestor::ata-page-block/@pb-name[starts-with(., 'disassy') or starts-with(., 'fault')]) and (ancestor::page-block/@pb-name[starts-with(., 'disassy') or starts-with(., 'fault')])">
            <xsl:variable name="node-id" select="generate-id(.)"/>
            <xsl:variable name="from-node" select="(ancestor-or-self::page-block[not(ancestor::page-block)])[last()]"/>
            <xsl:variable name="num">
               <xsl:variable name="candidate-num">
                  <xsl:choose>
                     <xsl:when test="count($from-node) &gt; 0">
                        <xsl:for-each select="$from-node/descendant-or-self::*[@_gte:count-as-id='cnt__table^page-block.cnt']">
                           <xsl:if test="generate-id(.) = $node-id">
                              <xsl:value-of select="position()"/>
                           </xsl:if>
                        </xsl:for-each>
                     </xsl:when>
                     <xsl:otherwise>
                        <xsl:for-each select="//*[@_gte:count-as-id='cnt__table^page-block.cnt'][not(ancestor-or-self::page-block)]">
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
            <xsl:variable name="offset">
               <!--Evaluate startAtXPath using the first counted element within the numbering scope as the context node-->
               <xsl:variable name="initial-num">
                  <xsl:choose>
                     <xsl:when test="count($from-node) &gt; 0">
                        <xsl:apply-templates select="($from-node/descendant-or-self::*[@_gte:count-as-id='cnt__table^page-block.cnt'])[1]" mode="startat-xpath"/>
                     </xsl:when>
                     <xsl:otherwise>
                        <xsl:apply-templates select="(//*[@_gte:count-as-id='cnt__table^page-block.cnt'][not(ancestor-or-self::page-block)])[1]" mode="startat-xpath"/>
                     </xsl:otherwise>
                  </xsl:choose>
               </xsl:variable>
               <xsl:choose>
                  <xsl:when test="string(number($initial-num))!='NaN'">
                     <xsl:value-of select="$initial-num"/>
                  </xsl:when>
                  <xsl:otherwise>1</xsl:otherwise>
               </xsl:choose>
            </xsl:variable>
            <xsl:choose>
               <xsl:when test="string(number($num))!='NaN'">
                  <xsl:number value="$num + $offset - 1" format="1"/>
               </xsl:when>
               <xsl:otherwise>?</xsl:otherwise>
            </xsl:choose>
         </xsl:when>
         <xsl:when test="not(ancestor::book[contains(@doctype,'cir') or contains(@doctype,'em') or contains(@doctype,'tmm')]) and not(ancestor::book[contains(@doctype,'oh')] and ancestor::ata-page-block/@pb-name[.='service']) and not(ancestor::book[contains(@doctype,'oh')] and ancestor::page-block/@pb-name[.='service']) and not(ancestor::ata-page-block/@pb-name[.='00awl' or .='00intro' or .='airlim' or .='awl' or .='awlror' or .='chapsect' or .='consume' or .='d-and-o' or .='frontmatte' or .='howtouse' or .='00howtouse' or .='intro' or .='nut_option' or .='oplimits' or .='sblist' or .='schedchk' or .='spectool' or .='timelim' or .='title-page']) and not(ancestor::page-block/@pb-name[.='00awl' or .='00intro' or .='airlim' or .='awl' or .='awlror' or .='chapsect' or .='consume' or .='d-and-o' or .='frontmatte' or .='howtouse' or .='00howtouse' or .='intro' or .='nut_option' or .='oplimits' or .='sblist' or .='schedchk' or .='spectool' or .='timelim' or .='title-page']) and not(ancestor::ata-page-block/@pb-name[(starts-with(., 'do') and 'do' = translate(., '0123456789', '') and string-length(.) &gt; 2) or (starts-with(., 'in') and 'in' = translate(., '0123456789', '') and string-length(.) &gt; 2) or (starts-with(., 'tl') and 'tl' = translate(., '0123456789', '') and string-length(.) &gt; 2) or .='toolsht' or .='trlist' or .='unschedc' or .='unschedchk']) and not(ancestor::page-block/@pb-name[(starts-with(., 'do') and 'do' = translate(., '0123456789', '') and string-length(.) &gt; 2) or (starts-with(., 'in') and 'in' = translate(., '0123456789', '') and string-length(.) &gt; 2) or (starts-with(., 'tl') and 'tl' = translate(., '0123456789', '') and string-length(.) &gt; 2) or .='toolsht' or .='trlist' or .='unschedc' or .='unschedchk']) and not(ancestor-or-self::ata-page-block[1]/@pb-name and string(ancestor-or-self::ata-page-block[1]/@pb-name)='intro00') and not(ancestor-or-self::page-block[1]/@pb-name and string(ancestor-or-self::page-block[1]/@pb-name)='intro00') and (ancestor::ata-page-block/@pb-name[starts-with(., 'disassy') or starts-with(., 'fault')])">
            <xsl:variable name="node-id" select="generate-id(.)"/>
            <xsl:variable name="from-node" select="(ancestor-or-self::ata-page-block[not(ancestor::ata-page-block)])[last()]"/>
            <xsl:variable name="num">
               <xsl:variable name="candidate-num">
                  <xsl:choose>
                     <xsl:when test="count($from-node) &gt; 0">
                        <xsl:for-each select="$from-node/descendant-or-self::*[@_gte:count-as-id='cnt__table^ata-page-block.cnt']">
                           <xsl:if test="generate-id(.) = $node-id">
                              <xsl:value-of select="position()"/>
                           </xsl:if>
                        </xsl:for-each>
                     </xsl:when>
                     <xsl:otherwise>
                        <xsl:for-each select="//*[@_gte:count-as-id='cnt__table^ata-page-block.cnt'][not(ancestor-or-self::ata-page-block)]">
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
            <xsl:variable name="offset">
               <!--Evaluate startAtXPath using the first counted element within the numbering scope as the context node-->
               <xsl:variable name="initial-num">
                  <xsl:choose>
                     <xsl:when test="count($from-node) &gt; 0">
                        <xsl:apply-templates select="($from-node/descendant-or-self::*[@_gte:count-as-id='cnt__table^ata-page-block.cnt'])[1]" mode="startat-xpath"/>
                     </xsl:when>
                     <xsl:otherwise>
                        <xsl:apply-templates select="(//*[@_gte:count-as-id='cnt__table^ata-page-block.cnt'][not(ancestor-or-self::ata-page-block)])[1]" mode="startat-xpath"/>
                     </xsl:otherwise>
                  </xsl:choose>
               </xsl:variable>
               <xsl:choose>
                  <xsl:when test="string(number($initial-num))!='NaN'">
                     <xsl:value-of select="$initial-num"/>
                  </xsl:when>
                  <xsl:otherwise>1</xsl:otherwise>
               </xsl:choose>
            </xsl:variable>
            <xsl:choose>
               <xsl:when test="string(number($num))!='NaN'">
                  <xsl:number value="$num + $offset - 1" format="1"/>
               </xsl:when>
               <xsl:otherwise>?</xsl:otherwise>
            </xsl:choose>
         </xsl:when>
         <xsl:when test="not(ancestor::book[contains(@doctype,'cir') or contains(@doctype,'em') or contains(@doctype,'tmm')]) and not(ancestor::book[contains(@doctype,'oh')] and ancestor::ata-page-block/@pb-name[.='service']) and not(ancestor::book[contains(@doctype,'oh')] and ancestor::page-block/@pb-name[.='service']) and not(ancestor::ata-page-block/@pb-name[.='00awl' or .='00intro' or .='airlim' or .='awl' or .='awlror' or .='chapsect' or .='consume' or .='d-and-o' or .='frontmatte' or .='howtouse' or .='00howtouse' or .='intro' or .='nut_option' or .='oplimits' or .='sblist' or .='schedchk' or .='spectool' or .='timelim' or .='title-page']) and not(ancestor::page-block/@pb-name[.='00awl' or .='00intro' or .='airlim' or .='awl' or .='awlror' or .='chapsect' or .='consume' or .='d-and-o' or .='frontmatte' or .='howtouse' or .='00howtouse' or .='intro' or .='nut_option' or .='oplimits' or .='sblist' or .='schedchk' or .='spectool' or .='timelim' or .='title-page']) and not(ancestor::ata-page-block/@pb-name[(starts-with(., 'do') and 'do' = translate(., '0123456789', '') and string-length(.) &gt; 2) or (starts-with(., 'in') and 'in' = translate(., '0123456789', '') and string-length(.) &gt; 2) or (starts-with(., 'tl') and 'tl' = translate(., '0123456789', '') and string-length(.) &gt; 2) or .='toolsht' or .='trlist' or .='unschedc' or .='unschedchk']) and not(ancestor::page-block/@pb-name[(starts-with(., 'do') and 'do' = translate(., '0123456789', '') and string-length(.) &gt; 2) or (starts-with(., 'in') and 'in' = translate(., '0123456789', '') and string-length(.) &gt; 2) or (starts-with(., 'tl') and 'tl' = translate(., '0123456789', '') and string-length(.) &gt; 2) or .='toolsht' or .='trlist' or .='unschedc' or .='unschedchk']) and not(ancestor-or-self::ata-page-block[1]/@pb-name and string(ancestor-or-self::ata-page-block[1]/@pb-name)='intro00') and (ancestor-or-self::page-block[1]/@pb-name and string(ancestor-or-self::page-block[1]/@pb-name)='intro00')">
            <xsl:variable name="node-id" select="generate-id(.)"/>
            <xsl:variable name="from-node" select="(ancestor-or-self::page-block[not(ancestor::page-block)])[last()]"/>
            <xsl:variable name="num">
               <xsl:variable name="candidate-num">
                  <xsl:choose>
                     <xsl:when test="count($from-node) &gt; 0">
                        <xsl:for-each select="$from-node/descendant-or-self::*[@_gte:count-as-id='cnt__table^page-block.cnt']">
                           <xsl:if test="generate-id(.) = $node-id">
                              <xsl:value-of select="position()"/>
                           </xsl:if>
                        </xsl:for-each>
                     </xsl:when>
                     <xsl:otherwise>
                        <xsl:for-each select="//*[@_gte:count-as-id='cnt__table^page-block.cnt'][not(ancestor-or-self::page-block)]">
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
            <xsl:variable name="offset">
               <!--Evaluate startAtXPath using the first counted element within the numbering scope as the context node-->
               <xsl:variable name="initial-num">
                  <xsl:choose>
                     <xsl:when test="count($from-node) &gt; 0">
                        <xsl:apply-templates select="($from-node/descendant-or-self::*[@_gte:count-as-id='cnt__table^page-block.cnt'])[1]" mode="startat-xpath"/>
                     </xsl:when>
                     <xsl:otherwise>
                        <xsl:apply-templates select="(//*[@_gte:count-as-id='cnt__table^page-block.cnt'][not(ancestor-or-self::page-block)])[1]" mode="startat-xpath"/>
                     </xsl:otherwise>
                  </xsl:choose>
               </xsl:variable>
               <xsl:choose>
                  <xsl:when test="string(number($initial-num))!='NaN'">
                     <xsl:value-of select="$initial-num"/>
                  </xsl:when>
                  <xsl:otherwise>1</xsl:otherwise>
               </xsl:choose>
            </xsl:variable>
            <xsl:choose>
               <xsl:when test="string(number($num))!='NaN'">
                  <xsl:number value="$num + $offset - 1" format="1"/>
               </xsl:when>
               <xsl:otherwise>?</xsl:otherwise>
            </xsl:choose>
         </xsl:when>
         <xsl:when test="not(ancestor::book[contains(@doctype,'cir') or contains(@doctype,'em') or contains(@doctype,'tmm')]) and not(ancestor::book[contains(@doctype,'oh')] and ancestor::ata-page-block/@pb-name[.='service']) and not(ancestor::book[contains(@doctype,'oh')] and ancestor::page-block/@pb-name[.='service']) and not(ancestor::ata-page-block/@pb-name[.='00awl' or .='00intro' or .='airlim' or .='awl' or .='awlror' or .='chapsect' or .='consume' or .='d-and-o' or .='frontmatte' or .='howtouse' or .='00howtouse' or .='intro' or .='nut_option' or .='oplimits' or .='sblist' or .='schedchk' or .='spectool' or .='timelim' or .='title-page']) and not(ancestor::page-block/@pb-name[.='00awl' or .='00intro' or .='airlim' or .='awl' or .='awlror' or .='chapsect' or .='consume' or .='d-and-o' or .='frontmatte' or .='howtouse' or .='00howtouse' or .='intro' or .='nut_option' or .='oplimits' or .='sblist' or .='schedchk' or .='spectool' or .='timelim' or .='title-page']) and not(ancestor::ata-page-block/@pb-name[(starts-with(., 'do') and 'do' = translate(., '0123456789', '') and string-length(.) &gt; 2) or (starts-with(., 'in') and 'in' = translate(., '0123456789', '') and string-length(.) &gt; 2) or (starts-with(., 'tl') and 'tl' = translate(., '0123456789', '') and string-length(.) &gt; 2) or .='toolsht' or .='trlist' or .='unschedc' or .='unschedchk']) and not(ancestor::page-block/@pb-name[(starts-with(., 'do') and 'do' = translate(., '0123456789', '') and string-length(.) &gt; 2) or (starts-with(., 'in') and 'in' = translate(., '0123456789', '') and string-length(.) &gt; 2) or (starts-with(., 'tl') and 'tl' = translate(., '0123456789', '') and string-length(.) &gt; 2) or .='toolsht' or .='trlist' or .='unschedc' or .='unschedchk']) and (ancestor-or-self::ata-page-block[1]/@pb-name and string(ancestor-or-self::ata-page-block[1]/@pb-name)='intro00')">
            <xsl:variable name="node-id" select="generate-id(.)"/>
            <xsl:variable name="from-node" select="(ancestor-or-self::ata-page-block[not(ancestor::ata-page-block)])[last()]"/>
            <xsl:variable name="num">
               <xsl:variable name="candidate-num">
                  <xsl:choose>
                     <xsl:when test="count($from-node) &gt; 0">
                        <xsl:for-each select="$from-node/descendant-or-self::*[@_gte:count-as-id='cnt__table^ata-page-block.cnt']">
                           <xsl:if test="generate-id(.) = $node-id">
                              <xsl:value-of select="position()"/>
                           </xsl:if>
                        </xsl:for-each>
                     </xsl:when>
                     <xsl:otherwise>
                        <xsl:for-each select="//*[@_gte:count-as-id='cnt__table^ata-page-block.cnt'][not(ancestor-or-self::ata-page-block)]">
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
            <xsl:variable name="offset">
               <!--Evaluate startAtXPath using the first counted element within the numbering scope as the context node-->
               <xsl:variable name="initial-num">
                  <xsl:choose>
                     <xsl:when test="count($from-node) &gt; 0">
                        <xsl:apply-templates select="($from-node/descendant-or-self::*[@_gte:count-as-id='cnt__table^ata-page-block.cnt'])[1]" mode="startat-xpath"/>
                     </xsl:when>
                     <xsl:otherwise>
                        <xsl:apply-templates select="(//*[@_gte:count-as-id='cnt__table^ata-page-block.cnt'][not(ancestor-or-self::ata-page-block)])[1]" mode="startat-xpath"/>
                     </xsl:otherwise>
                  </xsl:choose>
               </xsl:variable>
               <xsl:choose>
                  <xsl:when test="string(number($initial-num))!='NaN'">
                     <xsl:value-of select="$initial-num"/>
                  </xsl:when>
                  <xsl:otherwise>1</xsl:otherwise>
               </xsl:choose>
            </xsl:variable>
            <xsl:choose>
               <xsl:when test="string(number($num))!='NaN'">
                  <xsl:number value="$num + $offset - 1" format="1"/>
               </xsl:when>
               <xsl:otherwise>?</xsl:otherwise>
            </xsl:choose>
         </xsl:when>
         <xsl:when test="not(ancestor::book[contains(@doctype,'cir') or contains(@doctype,'em') or contains(@doctype,'tmm')]) and not(ancestor::book[contains(@doctype,'oh')] and ancestor::ata-page-block/@pb-name[.='service']) and not(ancestor::book[contains(@doctype,'oh')] and ancestor::page-block/@pb-name[.='service']) and not(ancestor::ata-page-block/@pb-name[.='00awl' or .='00intro' or .='airlim' or .='awl' or .='awlror' or .='chapsect' or .='consume' or .='d-and-o' or .='frontmatte' or .='howtouse' or .='00howtouse' or .='intro' or .='nut_option' or .='oplimits' or .='sblist' or .='schedchk' or .='spectool' or .='timelim' or .='title-page']) and not(ancestor::page-block/@pb-name[.='00awl' or .='00intro' or .='airlim' or .='awl' or .='awlror' or .='chapsect' or .='consume' or .='d-and-o' or .='frontmatte' or .='howtouse' or .='00howtouse' or .='intro' or .='nut_option' or .='oplimits' or .='sblist' or .='schedchk' or .='spectool' or .='timelim' or .='title-page']) and not(ancestor::ata-page-block/@pb-name[(starts-with(., 'do') and 'do' = translate(., '0123456789', '') and string-length(.) &gt; 2) or (starts-with(., 'in') and 'in' = translate(., '0123456789', '') and string-length(.) &gt; 2) or (starts-with(., 'tl') and 'tl' = translate(., '0123456789', '') and string-length(.) &gt; 2) or .='toolsht' or .='trlist' or .='unschedc' or .='unschedchk']) and (ancestor::page-block/@pb-name[(starts-with(., 'do') and 'do' = translate(., '0123456789', '') and string-length(.) &gt; 2) or (starts-with(., 'in') and 'in' = translate(., '0123456789', '') and string-length(.) &gt; 2) or (starts-with(., 'tl') and 'tl' = translate(., '0123456789', '') and string-length(.) &gt; 2) or .='toolsht' or .='trlist' or .='unschedc' or .='unschedchk'])">
            <xsl:variable name="node-id" select="generate-id(.)"/>
            <xsl:variable name="from-node" select="(ancestor-or-self::page-block[not(ancestor::page-block)])[last()]"/>
            <xsl:variable name="num">
               <xsl:variable name="candidate-num">
                  <xsl:choose>
                     <xsl:when test="count($from-node) &gt; 0">
                        <xsl:for-each select="$from-node/descendant-or-self::*[@_gte:count-as-id='cnt__table^page-block.cnt']">
                           <xsl:if test="generate-id(.) = $node-id">
                              <xsl:value-of select="position()"/>
                           </xsl:if>
                        </xsl:for-each>
                     </xsl:when>
                     <xsl:otherwise>
                        <xsl:for-each select="//*[@_gte:count-as-id='cnt__table^page-block.cnt'][not(ancestor-or-self::page-block)]">
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
         </xsl:when>
         <xsl:when test="not(ancestor::book[contains(@doctype,'cir') or contains(@doctype,'em') or contains(@doctype,'tmm')]) and not(ancestor::book[contains(@doctype,'oh')] and ancestor::ata-page-block/@pb-name[.='service']) and not(ancestor::book[contains(@doctype,'oh')] and ancestor::page-block/@pb-name[.='service']) and not(ancestor::ata-page-block/@pb-name[.='00awl' or .='00intro' or .='airlim' or .='awl' or .='awlror' or .='chapsect' or .='consume' or .='d-and-o' or .='frontmatte' or .='howtouse' or .='00howtouse' or .='intro' or .='nut_option' or .='oplimits' or .='sblist' or .='schedchk' or .='spectool' or .='timelim' or .='title-page']) and not(ancestor::page-block/@pb-name[.='00awl' or .='00intro' or .='airlim' or .='awl' or .='awlror' or .='chapsect' or .='consume' or .='d-and-o' or .='frontmatte' or .='howtouse' or .='00howtouse' or .='intro' or .='nut_option' or .='oplimits' or .='sblist' or .='schedchk' or .='spectool' or .='timelim' or .='title-page']) and (ancestor::ata-page-block/@pb-name[(starts-with(., 'do') and 'do' = translate(., '0123456789', '') and string-length(.) &gt; 2) or (starts-with(., 'in') and 'in' = translate(., '0123456789', '') and string-length(.) &gt; 2) or (starts-with(., 'tl') and 'tl' = translate(., '0123456789', '') and string-length(.) &gt; 2) or .='toolsht' or .='trlist' or .='unschedc' or .='unschedchk'])">
            <xsl:variable name="node-id" select="generate-id(.)"/>
            <xsl:variable name="from-node" select="(ancestor-or-self::ata-page-block[not(ancestor::ata-page-block)])[last()]"/>
            <xsl:variable name="num">
               <xsl:variable name="candidate-num">
                  <xsl:choose>
                     <xsl:when test="count($from-node) &gt; 0">
                        <xsl:for-each select="$from-node/descendant-or-self::*[@_gte:count-as-id='cnt__table^ata-page-block.cnt']">
                           <xsl:if test="generate-id(.) = $node-id">
                              <xsl:value-of select="position()"/>
                           </xsl:if>
                        </xsl:for-each>
                     </xsl:when>
                     <xsl:otherwise>
                        <xsl:for-each select="//*[@_gte:count-as-id='cnt__table^ata-page-block.cnt'][not(ancestor-or-self::ata-page-block)]">
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
         </xsl:when>
         <xsl:when test="not(ancestor::book[contains(@doctype,'cir') or contains(@doctype,'em') or contains(@doctype,'tmm')]) and not(ancestor::book[contains(@doctype,'oh')] and ancestor::ata-page-block/@pb-name[.='service']) and not(ancestor::book[contains(@doctype,'oh')] and ancestor::page-block/@pb-name[.='service']) and not(ancestor::ata-page-block/@pb-name[.='00awl' or .='00intro' or .='airlim' or .='awl' or .='awlror' or .='chapsect' or .='consume' or .='d-and-o' or .='frontmatte' or .='howtouse' or .='00howtouse' or .='intro' or .='nut_option' or .='oplimits' or .='sblist' or .='schedchk' or .='spectool' or .='timelim' or .='title-page']) and (ancestor::page-block/@pb-name[.='00awl' or .='00intro' or .='airlim' or .='awl' or .='awlror' or .='chapsect' or .='consume' or .='d-and-o' or .='frontmatte' or .='howtouse' or .='00howtouse' or .='intro' or .='nut_option' or .='oplimits' or .='sblist' or .='schedchk' or .='spectool' or .='timelim' or .='title-page'])">
            <xsl:variable name="node-id" select="generate-id(.)"/>
            <xsl:variable name="from-node" select="(ancestor-or-self::page-block[not(ancestor::page-block)])[last()]"/>
            <xsl:variable name="num">
               <xsl:variable name="candidate-num">
                  <xsl:choose>
                     <xsl:when test="count($from-node) &gt; 0">
                        <xsl:for-each select="$from-node/descendant-or-self::*[@_gte:count-as-id='cnt__table^page-block.cnt']">
                           <xsl:if test="generate-id(.) = $node-id">
                              <xsl:value-of select="position()"/>
                           </xsl:if>
                        </xsl:for-each>
                     </xsl:when>
                     <xsl:otherwise>
                        <xsl:for-each select="//*[@_gte:count-as-id='cnt__table^page-block.cnt'][not(ancestor-or-self::page-block)]">
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
         </xsl:when>
         <xsl:when test="not(ancestor::book[contains(@doctype,'cir') or contains(@doctype,'em') or contains(@doctype,'tmm')]) and not(ancestor::book[contains(@doctype,'oh')] and ancestor::ata-page-block/@pb-name[.='service']) and not(ancestor::book[contains(@doctype,'oh')] and ancestor::page-block/@pb-name[.='service']) and (ancestor::ata-page-block/@pb-name[.='00awl' or .='00intro' or .='airlim' or .='awl' or .='awlror' or .='chapsect' or .='consume' or .='d-and-o' or .='frontmatte' or .='howtouse' or .='00howtouse' or .='intro' or .='nut_option' or .='oplimits' or .='sblist' or .='schedchk' or .='spectool' or .='timelim' or .='title-page'])">
            <xsl:variable name="node-id" select="generate-id(.)"/>
            <xsl:variable name="from-node" select="(ancestor-or-self::ata-page-block[not(ancestor::ata-page-block)])[last()]"/>
            <xsl:variable name="num">
               <xsl:variable name="candidate-num">
                  <xsl:choose>
                     <xsl:when test="count($from-node) &gt; 0">
                        <xsl:for-each select="$from-node/descendant-or-self::*[@_gte:count-as-id='cnt__table^ata-page-block.cnt']">
                           <xsl:if test="generate-id(.) = $node-id">
                              <xsl:value-of select="position()"/>
                           </xsl:if>
                        </xsl:for-each>
                     </xsl:when>
                     <xsl:otherwise>
                        <xsl:for-each select="//*[@_gte:count-as-id='cnt__table^ata-page-block.cnt'][not(ancestor-or-self::ata-page-block)]">
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
         </xsl:when>
         <xsl:when test="(ancestor::book[contains(@doctype,'cir') or contains(@doctype,'em') or contains(@doctype,'tmm')]) and not(number(ancestor::pgblk/@pgblknbr)&gt;0 and number(ancestor::pgblk/@pgblknbr)&lt;=13)">
            <xsl:variable name="node-id" select="generate-id(.)"/>
            <xsl:variable name="from-node" select="(ancestor-or-self::pgblk[not(ancestor::pgblk)])[last()]"/>
            <xsl:variable name="num">
               <xsl:variable name="candidate-num">
                  <xsl:choose>
                     <xsl:when test="count($from-node) &gt; 0">
                        <xsl:for-each select="$from-node/descendant-or-self::*[@_gte:count-as-id='cnt__table^pgblk.cnt']">
                           <xsl:if test="generate-id(.) = $node-id">
                              <xsl:value-of select="position()"/>
                           </xsl:if>
                        </xsl:for-each>
                     </xsl:when>
                     <xsl:otherwise>
                        <xsl:for-each select="//*[@_gte:count-as-id='cnt__table^pgblk.cnt'][not(ancestor-or-self::pgblk)]">
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
         </xsl:when>
         <xsl:when test="(ancestor::book[contains(@doctype,'cir') or contains(@doctype,'em') or contains(@doctype,'tmm')]) and (number(ancestor::pgblk/@pgblknbr)&gt;0 and number(ancestor::pgblk/@pgblknbr)&lt;=13)">
            <xsl:variable name="node-id" select="generate-id(.)"/>
            <xsl:variable name="from-node" select="(ancestor-or-self::pgblk[not(ancestor::pgblk)])[last()]"/>
            <xsl:variable name="num">
               <xsl:variable name="candidate-num">
                  <xsl:choose>
                     <xsl:when test="count($from-node) &gt; 0">
                        <xsl:for-each select="$from-node/descendant-or-self::*[@_gte:count-as-id='cnt__table^pgblk.cnt']">
                           <xsl:if test="generate-id(.) = $node-id">
                              <xsl:value-of select="position()"/>
                           </xsl:if>
                        </xsl:for-each>
                     </xsl:when>
                     <xsl:otherwise>
                        <xsl:for-each select="//*[@_gte:count-as-id='cnt__table^pgblk.cnt'][not(ancestor-or-self::pgblk)]">
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
            <xsl:variable name="offset">
               <!--Evaluate startAtXPath using the first counted element within the numbering scope as the context node-->
               <xsl:variable name="initial-num">
                  <xsl:choose>
                     <xsl:when test="count($from-node) &gt; 0">
                        <xsl:apply-templates select="($from-node/descendant-or-self::*[@_gte:count-as-id='cnt__table^pgblk.cnt'])[1]" mode="startat-xpath"/>
                     </xsl:when>
                     <xsl:otherwise>
                        <xsl:apply-templates select="(//*[@_gte:count-as-id='cnt__table^pgblk.cnt'][not(ancestor-or-self::pgblk)])[1]" mode="startat-xpath"/>
                     </xsl:otherwise>
                  </xsl:choose>
               </xsl:variable>
               <xsl:choose>
                  <xsl:when test="string(number($initial-num))!='NaN'">
                     <xsl:value-of select="$initial-num"/>
                  </xsl:when>
                  <xsl:otherwise>1</xsl:otherwise>
               </xsl:choose>
            </xsl:variable>
            <xsl:choose>
               <xsl:when test="string(number($num))!='NaN'">
                  <xsl:number value="$num + $offset - 1" format="1"/>
               </xsl:when>
               <xsl:otherwise>?</xsl:otherwise>
            </xsl:choose>
         </xsl:when>
      </xsl:choose>
   </xsl:template>

<xsl:template match="chapter/title" mode="styler_numbering" priority="4">
      <!--This context has no numbering-->
      <xsl:param name="do-qmark" select="'yes'"/>
      <xsl:if test="$do-qmark='yes'">
         <xsl:value-of select="'?'"/>
      </xsl:if>
   </xsl:template>

<xsl:template match="book/title" mode="styler_numbering" priority="3">
      <!--This context has no numbering-->
      <xsl:param name="do-qmark" select="'yes'"/>
      <xsl:if test="$do-qmark='yes'">
         <xsl:value-of select="'?'"/>
      </xsl:if>
   </xsl:template>

<xsl:template match="ata-page-block/title" mode="styler_numbering" priority="2">
      <xsl:variable name="previous-node" select="(ancestor::*[not((namespace-uri(.)='http://www.w3.org/1999/XSL/Format') or (namespace-uri(.)='http://www.arbortext.com/namespace/XslFoExtensions') or (starts-with(namespace-uri(.),'http://www.arbortext.com/namespace/Styler/')))][1]/ancestor::*[not((namespace-uri(.)='http://www.w3.org/1999/XSL/Format') or (namespace-uri(.)='http://www.arbortext.com/namespace/XslFoExtensions') or (starts-with(namespace-uri(.),'http://www.arbortext.com/namespace/Styler/')))][1]|ancestor::*[not((namespace-uri(.)='http://www.w3.org/1999/XSL/Format') or (namespace-uri(.)='http://www.arbortext.com/namespace/XslFoExtensions') or (starts-with(namespace-uri(.),'http://www.arbortext.com/namespace/Styler/')))][1]/ancestor::*[not((namespace-uri(.)='http://www.w3.org/1999/XSL/Format') or (namespace-uri(.)='http://www.arbortext.com/namespace/XslFoExtensions') or (starts-with(namespace-uri(.),'http://www.arbortext.com/namespace/Styler/')))][1][local-name()='ata-page-block' or local-name()='chapter' or local-name()='figure' or local-name()='frontmatter' or local-name()='highlights' or local-name()='lof' or local-name()='lot' or local-name()='module' or local-name()='page-block' or local-name()='section' or local-name()='subject']/*[local-name()='chapsect-title' or local-name()='cir-title' or local-name()='consumables-title' or local-name()='eipc-title' or local-name()='em-title' or local-name()='fixequ-title' or local-name()='general-title' or local-name()='glossary-title' or local-name()='howtouse-title' or local-name()='intro-title' or local-name()='manual-title' or local-name()='num-index-title' or local-name()='nut-option-title' or local-name()='pdlist-title' or local-name()='pwc-title' or local-name()='sblist-title' or local-name()='spblist-title' or local-name()='spectools-title' or local-name()='supplier-list-title' or local-name()='task-title' or local-name()='temp-rev-title' or local-name()='title' or local-name()='tmm-title'][1])[last()]"/>
      <xsl:choose>
         <xsl:when test="boolean($previous-node)">
            <xsl:apply-templates mode="styler_numbering" select="$previous-node"/>
         </xsl:when>
         <xsl:otherwise>?</xsl:otherwise>
      </xsl:choose>
      <xsl:text>-</xsl:text>
      <xsl:number count="ata-page-block[title]" format="01"/>
   </xsl:template>

<xsl:template match="title-page/title" mode="styler_numbering" priority="1">
      <xsl:number count="title-page[title]" format="1"/>
   </xsl:template>

<xsl:template match="title" mode="styler_numbering" priority="0">
      <!--This context has no numbering-->
      <xsl:param name="do-qmark" select="'yes'"/>
      <xsl:if test="$do-qmark='yes'">
         <xsl:value-of select="'?'"/>
      </xsl:if>
   </xsl:template>

<xsl:template match="pgblk/_ufe:tmm-title" mode="styler_numbering" priority="2">
  <!--
  <xsl:variable name="node-id" select="generate-id(ancestor::pgblk[1])"/>
  <xsl:variable name="num">
     <xsl:for-each select="//*[not(ancestor-or-self::pgblk)]/pgblk[_ufe:tmm-title]|/pgblk[_ufe:tmm-title]">
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
  -->
  <xsl:number count="pgblk[not(ancestor::pgblk) and _ufe:tmm-title]" level="any" format="1"/>
</xsl:template>

<xsl:template match="pbfmatr/_ufe:tmm-title" mode="styler_numbering" priority="1">
      <xsl:variable name="node-id" select="generate-id(.)"/>
      <xsl:variable name="num">
         <xsl:for-each select="//*[@_gte:count-as-id='cnt__pbfmatr^-None-.cnt']">
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

<xsl:template match="_ufe:tmm-title" mode="styler_numbering" priority="0">
      <!--This context has no numbering-->
      <xsl:param name="do-qmark" select="'yes'"/>
      <xsl:if test="$do-qmark='yes'">
         <xsl:value-of select="'?'"/>
      </xsl:if>
   </xsl:template>

<xsl:template match="enumlist//enumlist//enumlist//enumlist/unlitem" mode="styler_numbering" priority="12">
      <xsl:number count="enumlist//enumlist//enumlist//enumlist/unlitem" format="1"/>
      <xsl:text>)</xsl:text>
   </xsl:template>

<xsl:template match="enumlist//enumlist//enumlist/unlitem" mode="styler_numbering" priority="11">
      <xsl:number count="enumlist//enumlist//enumlist/unlitem" format="i"/>
      <xsl:text>.</xsl:text>
   </xsl:template>

<xsl:template match="enumlist//enumlist/unlitem" mode="styler_numbering" priority="8">
      <xsl:number count="enumlist//enumlist/unlitem" format="a"/>
      <xsl:text>.</xsl:text>
   </xsl:template>

<xsl:template match="enumlist/unlitem" mode="styler_numbering" priority="5">
      <xsl:number count="enumlist/unlitem" format="1"/>
      <xsl:text>.</xsl:text>
   </xsl:template>

</xsl:stylesheet>
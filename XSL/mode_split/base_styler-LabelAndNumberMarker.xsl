<?xml version="1.0" encoding="UTF-8"?><xsl:stylesheet xmlns:simg="java:net.sf.docbook.saxon.ImageIntrinsics" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:ximg="xaln://com.nwalsh.xalan.ImageIntrinsics" xmlns="http://www.w3.org/1999/xhtml" xmlns:exslt="http://exslt.org/common" xmlns:_acl="java:com.arbortext.epic.Acl" xmlns:msxsl="urn:schemas-microsoft-com:xslt" xmlns:_="http://www.pwc.ca/namespace/doctypes/emipc" xmlns:_dtd="http://www.arbortext.com/namespace/Styler/UserElements" xmlns:atidlm="http://www.arbortext.com/namespace/atidlm" xmlns:_2="http://www.pwc.ca/namespace/doctypes/jmtosmigrate" xmlns:ch="http://www.arbortext.com/namespace/chunker" xmlns:saxon="http://saxon.sf.net/" xmlns:_5="http://www.pwc.ca/namespace/doctypes/ipc" xmlns:_gte="http://www.arbortext.com/namespace/Styler/GeneratedTextElements" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:_sfe="http://www.arbortext.com/namespace/Styler/StylerFormattingElements" xmlns:_js="java:com.arbortext.epic.internal.js.JavaScript" xmlns:_3="http://www.pwc.ca/namespace/doctypes/migrate" xmlns:_ufe="http://www.arbortext.com/namespace/Styler/UserFormattingElements" version="1.0" exclude-result-prefixes="_ atidlm xml _2 ch saxon _5 xsi _js _3 #default exslt msxsl _dtd _ufe _sfe _gte simg ximg _acl">


<xsl:template match="numlist/address" mode="styler-LabelAndNumberMarker" priority="7">
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

<xsl:template match="pgblk/_ufe:chapsect-title" mode="styler-LabelAndNumberMarker" priority="2">
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

<xsl:template match="pbfmatr/_ufe:chapsect-title" mode="styler-LabelAndNumberMarker" priority="1">
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

<xsl:template match="pgblk/_ufe:cir-title" mode="styler-LabelAndNumberMarker" priority="2">
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

<xsl:template match="pbfmatr/_ufe:cir-title" mode="styler-LabelAndNumberMarker" priority="1">
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

<xsl:template match="pgblk/_ufe:consumables-title" mode="styler-LabelAndNumberMarker" priority="5">
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

<xsl:template match="pbfmatr/_ufe:consumables-title" mode="styler-LabelAndNumberMarker" priority="4">
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

<xsl:template match="pwcspblist/_ufe:consumables-title" mode="styler-LabelAndNumberMarker" priority="3">
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

<xsl:template match="ata-page-block//consumables//_ufe:consumables-title" mode="styler-LabelAndNumberMarker" priority="2">
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

<xsl:template match="page-block//consumables//_ufe:consumables-title" mode="styler-LabelAndNumberMarker" priority="1">
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

<xsl:template match="pgblk/_ufe:eipc-title" mode="styler-LabelAndNumberMarker" priority="2">
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

<xsl:template match="pbfmatr/_ufe:eipc-title" mode="styler-LabelAndNumberMarker" priority="1">
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

<xsl:template match="pgblk/_ufe:em-title" mode="styler-LabelAndNumberMarker" priority="2">
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

<xsl:template match="pbfmatr/_ufe:em-title" mode="styler-LabelAndNumberMarker" priority="1">
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

<xsl:template match="pgblk/_ufe:fixequ-title" mode="styler-LabelAndNumberMarker" priority="5">
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

<xsl:template match="pbfmatr/_ufe:fixequ-title" mode="styler-LabelAndNumberMarker" priority="4">
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

<xsl:template match="pwcspblist/_ufe:fixequ-title" mode="styler-LabelAndNumberMarker" priority="3">
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

<xsl:template match="page-block//fixtures-and-equipment//_ufe:fixequ-title" mode="styler-LabelAndNumberMarker" priority="2">
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

<xsl:template match="ata-page-block//fixtures-and-equipment//_ufe:fixequ-title" mode="styler-LabelAndNumberMarker" priority="1">
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

<xsl:template match="pgblk/_ufe:general-title" mode="styler-LabelAndNumberMarker" priority="5">
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

<xsl:template match="pbfmatr/_ufe:general-title" mode="styler-LabelAndNumberMarker" priority="4">
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

<xsl:template match="pwcspblist/_ufe:general-title" mode="styler-LabelAndNumberMarker" priority="3">
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

<xsl:template match="page-block//general//_ufe:general-title" mode="styler-LabelAndNumberMarker" priority="2">
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

<xsl:template match="ata-page-block//general//_ufe:general-title" mode="styler-LabelAndNumberMarker" priority="1">
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

<xsl:template match="pgblk/_ufe:glossary-title" mode="styler-LabelAndNumberMarker" priority="3">
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

<xsl:template match="pbfmatr/_ufe:glossary-title" mode="styler-LabelAndNumberMarker" priority="2">
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

<xsl:template match="pwcspblist/_ufe:glossary-title" mode="styler-LabelAndNumberMarker" priority="1">
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

<xsl:template match="pgblk/_ufe:howtouse-title" mode="styler-LabelAndNumberMarker" priority="2">
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

<xsl:template match="pbfmatr/_ufe:howtouse-title" mode="styler-LabelAndNumberMarker" priority="1">
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

<xsl:template match="pgblk/_ufe:intro-title" mode="styler-LabelAndNumberMarker" priority="2">
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

<xsl:template match="pbfmatr/_ufe:intro-title" mode="styler-LabelAndNumberMarker" priority="1">
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

<xsl:template match="step/step/enumlist/item" mode="styler-LabelAndNumberMarker" priority="30">
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

<xsl:template match="prclist4//prclist4//prclist4//prclist4/item" mode="styler-LabelAndNumberMarker" priority="29">
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

<xsl:template match="list4//list4//list4//list4/item" mode="styler-LabelAndNumberMarker" priority="28">
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

<xsl:template match="enumlist//enumlist//enumlist//enumlist/item" mode="styler-LabelAndNumberMarker" priority="27">
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

<xsl:template match="prclist4//prclist4//prclist4/item" mode="styler-LabelAndNumberMarker" priority="26">
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

<xsl:template match="list4//list4//list4/item" mode="styler-LabelAndNumberMarker" priority="25">
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

<xsl:template match="enumlist//enumlist//enumlist/item" mode="styler-LabelAndNumberMarker" priority="23">
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

<xsl:template match="prclist4//prclist4/item" mode="styler-LabelAndNumberMarker" priority="21">
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

<xsl:template match="list4//list4/item" mode="styler-LabelAndNumberMarker" priority="20">
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

<xsl:template match="enumlist//enumlist/item" mode="styler-LabelAndNumberMarker" priority="18">
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

<xsl:template match="numlist/item" mode="styler-LabelAndNumberMarker" priority="13">
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

<xsl:template match="prclist4/item" mode="styler-LabelAndNumberMarker" priority="11">
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

<xsl:template match="prclist3/item" mode="styler-LabelAndNumberMarker" priority="10">
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

<xsl:template match="prclist2/item" mode="styler-LabelAndNumberMarker" priority="9">
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

<xsl:template match="prclist1/item" mode="styler-LabelAndNumberMarker" priority="8">
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

<xsl:template match="list4/item" mode="styler-LabelAndNumberMarker" priority="7">
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

<xsl:template match="list3/item" mode="styler-LabelAndNumberMarker" priority="6">
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

<xsl:template match="list2/item" mode="styler-LabelAndNumberMarker" priority="5">
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

<xsl:template match="list1/item" mode="styler-LabelAndNumberMarker" priority="4">
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

<xsl:template match="enumlist/item" mode="styler-LabelAndNumberMarker" priority="2">
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

<xsl:template match="pbfmatr/manual-title" mode="styler-LabelAndNumberMarker" priority="3">
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

<xsl:template match="pwcspblist/manual-title" mode="styler-LabelAndNumberMarker" priority="2">
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

<xsl:template match="pgblk/manual-title" mode="styler-LabelAndNumberMarker" priority="1">
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

<xsl:template match="ata-page-block//_sfe:BeforeOrAfterText//_ufe:npara-numbering" mode="styler-LabelAndNumberMarker" priority="2">
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

<xsl:template match="page-block//_sfe:BeforeOrAfterText//_ufe:npara-numbering" mode="styler-LabelAndNumberMarker" priority="1">
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

<xsl:template match="pgblk/_ufe:num-index-title" mode="styler-LabelAndNumberMarker" priority="3">
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

<xsl:template match="pbfmatr/_ufe:num-index-title" mode="styler-LabelAndNumberMarker" priority="2">
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

<xsl:template match="pwcspblist/_ufe:num-index-title" mode="styler-LabelAndNumberMarker" priority="1">
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

<xsl:template match="pgblk/_ufe:nut-option-title" mode="styler-LabelAndNumberMarker" priority="3">
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

<xsl:template match="pbfmatr/_ufe:nut-option-title" mode="styler-LabelAndNumberMarker" priority="2">
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

<xsl:template match="pwcspblist/_ufe:nut-option-title" mode="styler-LabelAndNumberMarker" priority="1">
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

<xsl:template match="subpara/subpara/subpara/subpara/subpara[not(title)]/para" mode="styler-LabelAndNumberMarker" priority="51">
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

<xsl:template match="subpara/subpara/subpara/subpara[not(title)]/para" mode="styler-LabelAndNumberMarker" priority="50">
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

<xsl:template match="subpara/subpara/subpara[not(title)]/para" mode="styler-LabelAndNumberMarker" priority="48">
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

<xsl:template match="subpara/subpara[not(title)]/para" mode="styler-LabelAndNumberMarker" priority="47">
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

<xsl:template match="n-para/subpara/para" mode="styler-LabelAndNumberMarker" priority="43">
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

<xsl:template match="pageblock-front/general//para" mode="styler-LabelAndNumberMarker" priority="40">
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

<xsl:template match="n-para[ancestor::book[contains(@doctype, 'epc')]]/para" mode="styler-LabelAndNumberMarker" priority="18">
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

<xsl:template match="taskproc/para" mode="styler-LabelAndNumberMarker" priority="7">
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

<xsl:template match="tprereq/para" mode="styler-LabelAndNumberMarker" priority="4">
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

<xsl:template match="numlist/part-group" mode="styler-LabelAndNumberMarker" priority="2">
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

<xsl:template match="pgblk/_ufe:pdlist-title" mode="styler-LabelAndNumberMarker" priority="1">
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

<xsl:template match="pgblk/_ufe:sblist-title" mode="styler-LabelAndNumberMarker" priority="2">
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

<xsl:template match="pbfmatr/_ufe:sblist-title" mode="styler-LabelAndNumberMarker" priority="1">
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

<xsl:template match="pgblk/_ufe:spblist-title" mode="styler-LabelAndNumberMarker" priority="2">
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

<xsl:template match="pbfmatr/_ufe:spblist-title" mode="styler-LabelAndNumberMarker" priority="1">
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

<xsl:template match="pgblk/_ufe:spectools-title" mode="styler-LabelAndNumberMarker" priority="5">
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

<xsl:template match="pbfmatr/_ufe:spectools-title" mode="styler-LabelAndNumberMarker" priority="4">
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

<xsl:template match="pwcspblist/_ufe:spectools-title" mode="styler-LabelAndNumberMarker" priority="3">
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

<xsl:template match="page-block//special-tools//_ufe:spectools-title" mode="styler-LabelAndNumberMarker" priority="2">
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

<xsl:template match="ata-page-block//special-tools//_ufe:spectools-title" mode="styler-LabelAndNumberMarker" priority="1">
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

<xsl:template match="pgblk/_ufe:supplier-list-title" mode="styler-LabelAndNumberMarker" priority="3">
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

<xsl:template match="pbfmatr/_ufe:supplier-list-title" mode="styler-LabelAndNumberMarker" priority="2">
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

<xsl:template match="pwcspblist/_ufe:supplier-list-title" mode="styler-LabelAndNumberMarker" priority="1">
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

<xsl:template match="pgblk/_ufe:task-title" mode="styler-LabelAndNumberMarker" priority="3">
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

<xsl:template match="pbfmatr/_ufe:task-title" mode="styler-LabelAndNumberMarker" priority="2">
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

<xsl:template match="pbfmatr//_ufe:task-title" mode="styler-LabelAndNumberMarker" priority="1">
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

<xsl:template match="pgblk/_ufe:temp-rev-title" mode="styler-LabelAndNumberMarker" priority="2">
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

<xsl:template match="pbfmatr/_ufe:temp-rev-title" mode="styler-LabelAndNumberMarker" priority="1">
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

<xsl:template match="subpara/subpara/subpara/subpara/subpara/title" mode="styler-LabelAndNumberMarker" priority="72">
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

<xsl:template match="subpara/subpara/subpara/subpara/title" mode="styler-LabelAndNumberMarker" priority="71">
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

<xsl:template match="subpara/subpara/subpara/title" mode="styler-LabelAndNumberMarker" priority="70">
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

<xsl:template match="book[contains(@doctype, 'epc')]/frontmatter//graphic/title" mode="styler-LabelAndNumberMarker" priority="69">Figure <_gte:styler_numbering>
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

<xsl:template match="book[contains(@doctype, 'ipc')]/frontmatter//figure/title" mode="styler-LabelAndNumberMarker" priority="68">Figure <_gte:styler_numbering>
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

<xsl:template match="ata-page-block//task/graphic/title" mode="styler-LabelAndNumberMarker" priority="67">
      <xsl:choose>
         <xsl:when test="not(number(ancestor::pgblk/@pgblknbr)&gt;0 and number(ancestor::pgblk/@pgblknbr)&lt;=13 and ancestor::task/@confltr!='') and not(number(ancestor::pgblk/@pgblknbr)&gt;0 and number(ancestor::pgblk/@pgblknbr)&lt;=13 and ancestor::task/@varnbr!='') and not(number(ancestor::pgblk/@pgblknbr)&gt;0 and number(ancestor::pgblk/@pgblknbr)&lt;=13) and not(ancestor::task/@confltr!='') and not(ancestor::task/@varnbr!='')"><!--LabelAndNumberMarker for condition #6-->Figure <_gte:styler_numbering>
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
         <xsl:when test="not(number(ancestor::pgblk/@pgblknbr)&gt;0 and number(ancestor::pgblk/@pgblknbr)&lt;=13 and ancestor::task/@confltr!='') and not(number(ancestor::pgblk/@pgblknbr)&gt;0 and number(ancestor::pgblk/@pgblknbr)&lt;=13 and ancestor::task/@varnbr!='') and not(number(ancestor::pgblk/@pgblknbr)&gt;0 and number(ancestor::pgblk/@pgblknbr)&lt;=13) and not(ancestor::task/@confltr!='') and (ancestor::task/@varnbr!='')">
            <!-- Condition #5-->
            <xsl:if test="not(@_gte:Gentext-Expanded)">
               <_sfe:BeforeOrAfterText>Figure <_gte:styler_numbering>
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
         </xsl:when>
         <xsl:when test="not(number(ancestor::pgblk/@pgblknbr)&gt;0 and number(ancestor::pgblk/@pgblknbr)&lt;=13 and ancestor::task/@confltr!='') and not(number(ancestor::pgblk/@pgblknbr)&gt;0 and number(ancestor::pgblk/@pgblknbr)&lt;=13 and ancestor::task/@varnbr!='') and not(number(ancestor::pgblk/@pgblknbr)&gt;0 and number(ancestor::pgblk/@pgblknbr)&lt;=13) and (ancestor::task/@confltr!='')">
            <!-- Condition #4-->
            <xsl:if test="not(@_gte:Gentext-Expanded)">
               <_sfe:BeforeOrAfterText>Figure <_gte:styler_numbering>
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
         </xsl:when>
         <xsl:when test="not(number(ancestor::pgblk/@pgblknbr)&gt;0 and number(ancestor::pgblk/@pgblknbr)&lt;=13 and ancestor::task/@confltr!='') and not(number(ancestor::pgblk/@pgblknbr)&gt;0 and number(ancestor::pgblk/@pgblknbr)&lt;=13 and ancestor::task/@varnbr!='') and (number(ancestor::pgblk/@pgblknbr)&gt;0 and number(ancestor::pgblk/@pgblknbr)&lt;=13)">
            <!-- Condition #3-->
            <xsl:if test="not(@_gte:Gentext-Expanded)">
               <_sfe:BeforeOrAfterText>Figure <_gte:styler_numbering>
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
         </xsl:when>
         <xsl:when test="not(number(ancestor::pgblk/@pgblknbr)&gt;0 and number(ancestor::pgblk/@pgblknbr)&lt;=13 and ancestor::task/@confltr!='') and (number(ancestor::pgblk/@pgblknbr)&gt;0 and number(ancestor::pgblk/@pgblknbr)&lt;=13 and ancestor::task/@varnbr!='')">
            <!-- Condition #2-->
            <xsl:if test="not(@_gte:Gentext-Expanded)">
               <_sfe:BeforeOrAfterText>Figure <_gte:styler_numbering>
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
         </xsl:when>
         <xsl:when test="number(ancestor::pgblk/@pgblknbr)&gt;0 and number(ancestor::pgblk/@pgblknbr)&lt;=13 and ancestor::task/@confltr!=''">
            <!-- Condition #1-->
            <xsl:if test="not(@_gte:Gentext-Expanded)">
               <_sfe:BeforeOrAfterText>Figure <_gte:styler_numbering>
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
         </xsl:when>
      </xsl:choose>
   </xsl:template>

<xsl:template match="page-block//task/graphic/title" mode="styler-LabelAndNumberMarker" priority="66">
      <xsl:choose>
         <xsl:when test="not(number(ancestor::pgblk/@pgblknbr)&gt;0 and number(ancestor::pgblk/@pgblknbr)&lt;=13 and ancestor::task/@confltr!='') and not(number(ancestor::pgblk/@pgblknbr)&gt;0 and number(ancestor::pgblk/@pgblknbr)&lt;=13 and ancestor::task/@varnbr!='') and not(number(ancestor::pgblk/@pgblknbr)&gt;0 and number(ancestor::pgblk/@pgblknbr)&lt;=13) and not(ancestor::task/@confltr!='') and not(ancestor::task/@varnbr!='')"><!--LabelAndNumberMarker for condition #6-->Figure <_gte:styler_numbering>
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
         <xsl:when test="not(number(ancestor::pgblk/@pgblknbr)&gt;0 and number(ancestor::pgblk/@pgblknbr)&lt;=13 and ancestor::task/@confltr!='') and not(number(ancestor::pgblk/@pgblknbr)&gt;0 and number(ancestor::pgblk/@pgblknbr)&lt;=13 and ancestor::task/@varnbr!='') and not(number(ancestor::pgblk/@pgblknbr)&gt;0 and number(ancestor::pgblk/@pgblknbr)&lt;=13) and not(ancestor::task/@confltr!='') and (ancestor::task/@varnbr!='')">
            <!-- Condition #5-->
            <xsl:if test="not(@_gte:Gentext-Expanded)">
               <_sfe:BeforeOrAfterText>Figure <_gte:styler_numbering>
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
         </xsl:when>
         <xsl:when test="not(number(ancestor::pgblk/@pgblknbr)&gt;0 and number(ancestor::pgblk/@pgblknbr)&lt;=13 and ancestor::task/@confltr!='') and not(number(ancestor::pgblk/@pgblknbr)&gt;0 and number(ancestor::pgblk/@pgblknbr)&lt;=13 and ancestor::task/@varnbr!='') and not(number(ancestor::pgblk/@pgblknbr)&gt;0 and number(ancestor::pgblk/@pgblknbr)&lt;=13) and (ancestor::task/@confltr!='')">
            <!-- Condition #4-->
            <xsl:if test="not(@_gte:Gentext-Expanded)">
               <_sfe:BeforeOrAfterText>Figure <_gte:styler_numbering>
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
         </xsl:when>
         <xsl:when test="not(number(ancestor::pgblk/@pgblknbr)&gt;0 and number(ancestor::pgblk/@pgblknbr)&lt;=13 and ancestor::task/@confltr!='') and not(number(ancestor::pgblk/@pgblknbr)&gt;0 and number(ancestor::pgblk/@pgblknbr)&lt;=13 and ancestor::task/@varnbr!='') and (number(ancestor::pgblk/@pgblknbr)&gt;0 and number(ancestor::pgblk/@pgblknbr)&lt;=13)">
            <!-- Condition #3-->
            <xsl:if test="not(@_gte:Gentext-Expanded)">
               <_sfe:BeforeOrAfterText>Figure <_gte:styler_numbering>
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
         </xsl:when>
         <xsl:when test="not(number(ancestor::pgblk/@pgblknbr)&gt;0 and number(ancestor::pgblk/@pgblknbr)&lt;=13 and ancestor::task/@confltr!='') and (number(ancestor::pgblk/@pgblknbr)&gt;0 and number(ancestor::pgblk/@pgblknbr)&lt;=13 and ancestor::task/@varnbr!='')">
            <!-- Condition #2-->
            <xsl:if test="not(@_gte:Gentext-Expanded)">
               <_sfe:BeforeOrAfterText>Figure <_gte:styler_numbering>
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
         </xsl:when>
         <xsl:when test="number(ancestor::pgblk/@pgblknbr)&gt;0 and number(ancestor::pgblk/@pgblknbr)&lt;=13 and ancestor::task/@confltr!=''">
            <!-- Condition #1-->
            <xsl:if test="not(@_gte:Gentext-Expanded)">
               <_sfe:BeforeOrAfterText>Figure <_gte:styler_numbering>
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
         </xsl:when>
      </xsl:choose>
   </xsl:template>

<xsl:template match="page-block[@pb-name='glossary']/module/title" mode="styler-LabelAndNumberMarker" priority="61">
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

<xsl:template match="page-block[@pb-name='supp_list']/module/title" mode="styler-LabelAndNumberMarker" priority="60">
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

<xsl:template match="mm-fits/subpara/title" mode="styler-LabelAndNumberMarker" priority="62">
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

<xsl:template match="prcitem4/prcitem/title" mode="styler-LabelAndNumberMarker" priority="60">
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

<xsl:template match="prcitem3/prcitem/title" mode="styler-LabelAndNumberMarker" priority="60">
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

<xsl:template match="prcitem2/prcitem/title" mode="styler-LabelAndNumberMarker" priority="59">
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

<xsl:template match="prcitem1/prcitem/title" mode="styler-LabelAndNumberMarker" priority="55">
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

<xsl:template match="subpara/subpara/title" mode="styler-LabelAndNumberMarker" priority="57">
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

<xsl:template match="task//table/title" mode="styler-LabelAndNumberMarker" priority="51">
      <xsl:choose>
         <xsl:when test="not(number(ancestor::pgblk/@pgblknbr)&gt;0 and number(ancestor::pgblk/@pgblknbr)&lt;=13 and ancestor::task/@confltr!='' and ../@display='expand') and not(number(ancestor::pgblk/@pgblknbr)&gt;0 and number(ancestor::pgblk/@pgblknbr)&lt;=13 and ancestor::task/@varnbr!='' and ../@display='expand') and not(number(ancestor::pgblk/@pgblknbr)&gt;0 and number(ancestor::pgblk/@pgblknbr)&lt;=13 and ../@display='expand') and not(number(ancestor::pgblk/@pgblknbr)&gt;0 and number(ancestor::pgblk/@pgblknbr)&lt;=13) and not(ancestor::task/@confltr!='' and ../@display='expand') and not(ancestor::task/@varnbr!='' and ../@display='expand') and not(../@display='expand')"><!--LabelAndNumberMarker for condition #8-->Table <_gte:styler_numbering>
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
         <xsl:when test="not(number(ancestor::pgblk/@pgblknbr)&gt;0 and number(ancestor::pgblk/@pgblknbr)&lt;=13 and ancestor::task/@confltr!='' and ../@display='expand') and not(number(ancestor::pgblk/@pgblknbr)&gt;0 and number(ancestor::pgblk/@pgblknbr)&lt;=13 and ancestor::task/@varnbr!='' and ../@display='expand') and not(number(ancestor::pgblk/@pgblknbr)&gt;0 and number(ancestor::pgblk/@pgblknbr)&lt;=13 and ../@display='expand') and not(number(ancestor::pgblk/@pgblknbr)&gt;0 and number(ancestor::pgblk/@pgblknbr)&lt;=13) and not(ancestor::task/@confltr!='' and ../@display='expand') and not(ancestor::task/@varnbr!='' and ../@display='expand') and (../@display='expand')">
            <!-- Condition #7-->
            <xsl:if test="not(@_gte:Gentext-Expanded)">
               <_sfe:BeforeOrAfterText>Table <_gte:styler_numbering>
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
         </xsl:when>
         <xsl:when test="not(number(ancestor::pgblk/@pgblknbr)&gt;0 and number(ancestor::pgblk/@pgblknbr)&lt;=13 and ancestor::task/@confltr!='' and ../@display='expand') and not(number(ancestor::pgblk/@pgblknbr)&gt;0 and number(ancestor::pgblk/@pgblknbr)&lt;=13 and ancestor::task/@varnbr!='' and ../@display='expand') and not(number(ancestor::pgblk/@pgblknbr)&gt;0 and number(ancestor::pgblk/@pgblknbr)&lt;=13 and ../@display='expand') and not(number(ancestor::pgblk/@pgblknbr)&gt;0 and number(ancestor::pgblk/@pgblknbr)&lt;=13) and not(ancestor::task/@confltr!='' and ../@display='expand') and (ancestor::task/@varnbr!='' and ../@display='expand')">
            <!-- Condition #6-->
            <xsl:if test="not(@_gte:Gentext-Expanded)">
               <_sfe:BeforeOrAfterText>Table <_gte:styler_numbering>
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
         </xsl:when>
         <xsl:when test="not(number(ancestor::pgblk/@pgblknbr)&gt;0 and number(ancestor::pgblk/@pgblknbr)&lt;=13 and ancestor::task/@confltr!='' and ../@display='expand') and not(number(ancestor::pgblk/@pgblknbr)&gt;0 and number(ancestor::pgblk/@pgblknbr)&lt;=13 and ancestor::task/@varnbr!='' and ../@display='expand') and not(number(ancestor::pgblk/@pgblknbr)&gt;0 and number(ancestor::pgblk/@pgblknbr)&lt;=13 and ../@display='expand') and not(number(ancestor::pgblk/@pgblknbr)&gt;0 and number(ancestor::pgblk/@pgblknbr)&lt;=13) and (ancestor::task/@confltr!='' and ../@display='expand')">
            <!-- Condition #5-->
            <xsl:if test="not(@_gte:Gentext-Expanded)">
               <_sfe:BeforeOrAfterText>Table <_gte:styler_numbering>
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
         </xsl:when>
         <xsl:when test="not(number(ancestor::pgblk/@pgblknbr)&gt;0 and number(ancestor::pgblk/@pgblknbr)&lt;=13 and ancestor::task/@confltr!='' and ../@display='expand') and not(number(ancestor::pgblk/@pgblknbr)&gt;0 and number(ancestor::pgblk/@pgblknbr)&lt;=13 and ancestor::task/@varnbr!='' and ../@display='expand') and not(number(ancestor::pgblk/@pgblknbr)&gt;0 and number(ancestor::pgblk/@pgblknbr)&lt;=13 and ../@display='expand') and (number(ancestor::pgblk/@pgblknbr)&gt;0 and number(ancestor::pgblk/@pgblknbr)&lt;=13)">
            <!-- Condition #4-->
            <xsl:if test="not(@_gte:Gentext-Expanded)">
               <_sfe:BeforeOrAfterText>
                  <_ufe:hidden>Table <_gte:styler_numbering>
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
                  </_ufe:hidden>
                  <xsl:text> </xsl:text>
               </_sfe:BeforeOrAfterText>
            </xsl:if>
         </xsl:when>
         <xsl:when test="not(number(ancestor::pgblk/@pgblknbr)&gt;0 and number(ancestor::pgblk/@pgblknbr)&lt;=13 and ancestor::task/@confltr!='' and ../@display='expand') and not(number(ancestor::pgblk/@pgblknbr)&gt;0 and number(ancestor::pgblk/@pgblknbr)&lt;=13 and ancestor::task/@varnbr!='' and ../@display='expand') and (number(ancestor::pgblk/@pgblknbr)&gt;0 and number(ancestor::pgblk/@pgblknbr)&lt;=13 and ../@display='expand')">
            <!-- Condition #3-->
            <xsl:if test="not(@_gte:Gentext-Expanded)">
               <_sfe:BeforeOrAfterText>Table <_gte:styler_numbering>
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
         </xsl:when>
         <xsl:when test="not(number(ancestor::pgblk/@pgblknbr)&gt;0 and number(ancestor::pgblk/@pgblknbr)&lt;=13 and ancestor::task/@confltr!='' and ../@display='expand') and (number(ancestor::pgblk/@pgblknbr)&gt;0 and number(ancestor::pgblk/@pgblknbr)&lt;=13 and ancestor::task/@varnbr!='' and ../@display='expand')">
            <!-- Condition #2-->
            <xsl:if test="not(@_gte:Gentext-Expanded)">
               <_sfe:BeforeOrAfterText>Table <_gte:styler_numbering>
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
         </xsl:when>
         <xsl:when test="number(ancestor::pgblk/@pgblknbr)&gt;0 and number(ancestor::pgblk/@pgblknbr)&lt;=13 and ancestor::task/@confltr!='' and ../@display='expand'">
            <!-- Condition #1-->
            <xsl:if test="not(@_gte:Gentext-Expanded)">
               <_sfe:BeforeOrAfterText>Table <_gte:styler_numbering>
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
         </xsl:when>
      </xsl:choose>
   </xsl:template>

<xsl:template match="page-block//graphic/title" mode="styler-LabelAndNumberMarker" priority="50">
      <xsl:choose>
         <xsl:when test="not(number(ancestor::pgblk/@pgblknbr)&gt;0 and number(ancestor::pgblk/@pgblknbr)&lt;=13)"><!--LabelAndNumberMarker for condition #2-->Figure <_gte:styler_numbering>
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
         <xsl:when test="number(ancestor::pgblk/@pgblknbr)&gt;0 and number(ancestor::pgblk/@pgblknbr)&lt;=13">
            <!-- Condition #1-->
            <xsl:if test="not(@_gte:Gentext-Expanded)">
               <_sfe:BeforeOrAfterText>Figure <_gte:styler_numbering>
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
         </xsl:when>
      </xsl:choose>
   </xsl:template>

<xsl:template match="ata-page-block//graphic/title" mode="styler-LabelAndNumberMarker" priority="49">
      <xsl:choose>
         <xsl:when test="not(number(ancestor::pgblk/@pgblknbr)&gt;0 and number(ancestor::pgblk/@pgblknbr)&lt;=13)"><!--LabelAndNumberMarker for condition #2-->Figure <_gte:styler_numbering>
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
         <xsl:when test="number(ancestor::pgblk/@pgblknbr)&gt;0 and number(ancestor::pgblk/@pgblknbr)&lt;=13">
            <!-- Condition #1-->
            <xsl:if test="not(@_gte:Gentext-Expanded)">
               <_sfe:BeforeOrAfterText>Figure <_gte:styler_numbering>
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
         </xsl:when>
      </xsl:choose>
   </xsl:template>

<xsl:template match="page-block//mm-fits/title" mode="styler-LabelAndNumberMarker" priority="47">
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

<xsl:template match="ata-page-block//mm-fits/title" mode="styler-LabelAndNumberMarker" priority="46">
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

<xsl:template match="ata-page-block//fits-and-clears/title" mode="styler-LabelAndNumberMarker" priority="46">
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

<xsl:template match="page-block//fits-and-clears/title" mode="styler-LabelAndNumberMarker" priority="45">
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

<xsl:template match="ata-page-block//n-para/title" mode="styler-LabelAndNumberMarker" priority="43">
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

<xsl:template match="page-block//n-para/title" mode="styler-LabelAndNumberMarker" priority="42">
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

<xsl:template match="figure/title" mode="styler-LabelAndNumberMarker" priority="41">
      <xsl:choose>
         <xsl:when test="not(ancestor::book[contains(@doctype,'oh')] and ancestor::ata-page-block/@pb-name[.='service']) and not(ancestor::book[contains(@doctype,'oh')] and ancestor::page-block/@pb-name[.='service']) and not(ancestor::ata-page-block/@pb-name[.='00awl' or .='00intro' or .='airlim' or .='awl' or .='awlror' or .='chapsect' or .='consume' or .='d-and-o' or .='frontmatte' or .='howtouse' or .='00howtouse' or .='intro' or .='nut_option' or .='oplimits' or .='sblist' or .='schedchk' or .='spectool' or .='timelim' or .='title-page']) and not(ancestor::page-block/@pb-name[.='00awl' or .='00intro' or .='airlim' or .='awl' or .='awlror' or .='chapsect' or .='consume' or .='d-and-o' or .='frontmatte' or .='howtouse' or .='00howtouse' or .='intro' or .='nut_option' or .='oplimits' or .='sblist' or .='schedchk' or .='spectool' or .='timelim' or .='title-page']) and not(ancestor::ata-page-block/@pb-name[(starts-with(., 'do') and 'do' = translate(., '0123456789', '') and string-length(.) &gt; 2) or (starts-with(., 'in') and 'in' = translate(., '0123456789', '') and string-length(.) &gt; 2) or (starts-with(., 'tl') and 'tl' = translate(., '0123456789', '') and string-length(.) &gt; 2) or .='toolsht' or .='trlist' or .='unschedc' or .='unschedchk']) and not(ancestor::page-block/@pb-name[(starts-with(., 'do') and 'do' = translate(., '0123456789', '') and string-length(.) &gt; 2) or (starts-with(., 'in') and 'in' = translate(., '0123456789', '') and string-length(.) &gt; 2) or (starts-with(., 'tl') and 'tl' = translate(., '0123456789', '') and string-length(.) &gt; 2) or .='toolsht' or .='trlist' or .='unschedc' or .='unschedchk']) and not(ancestor-or-self::ata-page-block[1]/@pb-name and string(ancestor-or-self::ata-page-block[1]/@pb-name)='intro00') and not(ancestor-or-self::page-block[1]/@pb-name and string(ancestor-or-self::page-block[1]/@pb-name)='intro00') and not(ancestor::ata-page-block/@pb-name[starts-with(., 'disassy') or starts-with(., 'fault')]) and not(ancestor::page-block/@pb-name[starts-with(., 'disassy') or starts-with(., 'fault')]) and not(ancestor::book[contains(@doctype,'oh')] and ancestor::ata-page-block/@pb-name[starts-with(., 'clean')]) and not(ancestor::book[contains(@doctype,'oh')] and ancestor::page-block/@pb-name[starts-with(., 'clean')]) and not(ancestor::ata-page-block/@pb-name[starts-with(., 'mainprac')]) and not(ancestor::page-block/@pb-name[starts-with(., 'mainprac')]) and not(ancestor::book[contains(@doctype,'oh')] and ancestor::ata-page-block/@pb-name[starts-with(., 'inspect')]) and not(ancestor::book[contains(@doctype,'oh')] and ancestor::page-block/@pb-name[starts-with(., 'inspect')]) and not(ancestor::ata-page-block/@pb-name[(starts-with(., 'di') and 'di' = translate(., '0123456789', '') and string-length(.) &gt; 2) or starts-with(.,'service')]) and not(ancestor::page-block/@pb-name[(starts-with(., 'di') and 'di' = translate(., '0123456789', '') and string-length(.) &gt; 2) or starts-with(.,'service')]) and not(ancestor::book[contains(@doctype,'oh')] and ancestor::ata-page-block/@pb-name[starts-with(., 'repair')]) and not(ancestor::book[contains(@doctype,'oh')] and ancestor::page-block/@pb-name[starts-with(., 'repair')]) and not(ancestor::book[contains(@doctype,'oh')] and ancestor::ata-page-block/@pb-name[starts-with(., 'test')]) and not(ancestor::book[contains(@doctype,'oh')] and ancestor::page-block/@pb-name[starts-with(., 'test')]) and not(ancestor::ata-page-block/@pb-name[(starts-with(., 'cl') and 'cl' = translate(., '0123456789', '') and string-length(.) &gt; 2) or .='install' or starts-with(.,'rem-inst') or (starts-with(., 'reminst') and 'reminst' = translate(., '0123456789', '') and string-length(.) &gt; 7) or .='remove' or (starts-with(., 'repair') and 'repair' = translate(., '0123456789', '') and string-length(.) &gt; 6)]) and not(ancestor::page-block/@pb-name[(starts-with(., 'cl') and 'cl' = translate(., '0123456789', '') and string-length(.) &gt; 2) or .='install' or starts-with(.,'rem-inst') or (starts-with(., 'reminst') and 'reminst' = translate(., '0123456789', '') and string-length(.) &gt; 7) or .='remove' or (starts-with(., 'repair') and 'repair' = translate(., '0123456789', '') and string-length(.) &gt; 6)]) and not(ancestor::ata-page-block/@pb-name[starts-with(., 'assy') or (starts-with(., 'ic') and 'ic' = translate(., '0123456789', '') and string-length(.) &gt; 2) or (starts-with(., 'te') and 'te' = translate(., '0123456789', '') and string-length(.) &gt; 2) or .='test']) and not(ancestor::page-block/@pb-name[starts-with(., 'assy') or (starts-with(., 'ic') and 'ic' = translate(., '0123456789', '') and string-length(.) &gt; 2) or (starts-with(., 'te') and 'te' = translate(., '0123456789', '') and string-length(.) &gt; 2) or .='test']) and not(ancestor::ata-page-block/@pb-name[.='f-and-c' or starts-with(., 'inspect') or (starts-with(., 're') and 're' = translate(., '0123456789', '') and string-length(.) &gt; 2)]) and not(ancestor::page-block/@pb-name[.='f-and-c' or starts-with(., 'inspect') or (starts-with(., 're') and 're' = translate(., '0123456789', '') and string-length(.) &gt; 2)]) and not(ancestor::ata-page-block/@pb-name[(starts-with(., 'as') and 'as' = translate(., '0123456789', '') and string-length(.) &gt; 2) or starts-with(.,'clean') or (starts-with(., 'test') and 'test' = translate(., '0123456789', '') and string-length(.) &gt; 4)]) and not(ancestor::page-block/@pb-name[(starts-with(., 'as') and 'as' = translate(., '0123456789', '') and string-length(.) &gt; 2) or starts-with(.,'clean') or (starts-with(., 'test') and 'test' = translate(., '0123456789', '') and string-length(.) &gt; 4)]) and not(ancestor::ata-page-block/@pb-name[(starts-with(., 'fc') and 'fc' = translate(., '0123456789', '') and string-length(.) &gt; 2) or starts-with(.,'repair') or .='trouble']) and not(ancestor::page-block/@pb-name[(starts-with(., 'fc') and 'fc' = translate(., '0123456789', '') and string-length(.) &gt; 2) or starts-with(.,'repair') or .='trouble']) and not(ancestor::ata-page-block/@pb-name[starts-with(.,'storage') or (starts-with(., 'to') and 'to' = translate(., '0123456789', '') and string-length(.) &gt; 2)]) and not(ancestor::page-block/@pb-name[starts-with(.,'storage') or (starts-with(., 'to') and 'to' = translate(., '0123456789', '') and string-length(.) &gt; 2)]) and not(ancestor::ata-page-block/@pb-name[.='it-oh' or .='lt-oh']) and (ancestor::page-block/@pb-name[.='it-oh' or .='lt-oh'])"><!--LabelAndNumberMarker for condition #36-->Figure <_gte:styler_numbering>
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
         <xsl:when test="not(ancestor::book[contains(@doctype,'oh')] and ancestor::ata-page-block/@pb-name[.='service']) and not(ancestor::book[contains(@doctype,'oh')] and ancestor::page-block/@pb-name[.='service']) and not(ancestor::ata-page-block/@pb-name[.='00awl' or .='00intro' or .='airlim' or .='awl' or .='awlror' or .='chapsect' or .='consume' or .='d-and-o' or .='frontmatte' or .='howtouse' or .='00howtouse' or .='intro' or .='nut_option' or .='oplimits' or .='sblist' or .='schedchk' or .='spectool' or .='timelim' or .='title-page']) and not(ancestor::page-block/@pb-name[.='00awl' or .='00intro' or .='airlim' or .='awl' or .='awlror' or .='chapsect' or .='consume' or .='d-and-o' or .='frontmatte' or .='howtouse' or .='00howtouse' or .='intro' or .='nut_option' or .='oplimits' or .='sblist' or .='schedchk' or .='spectool' or .='timelim' or .='title-page']) and not(ancestor::ata-page-block/@pb-name[(starts-with(., 'do') and 'do' = translate(., '0123456789', '') and string-length(.) &gt; 2) or (starts-with(., 'in') and 'in' = translate(., '0123456789', '') and string-length(.) &gt; 2) or (starts-with(., 'tl') and 'tl' = translate(., '0123456789', '') and string-length(.) &gt; 2) or .='toolsht' or .='trlist' or .='unschedc' or .='unschedchk']) and not(ancestor::page-block/@pb-name[(starts-with(., 'do') and 'do' = translate(., '0123456789', '') and string-length(.) &gt; 2) or (starts-with(., 'in') and 'in' = translate(., '0123456789', '') and string-length(.) &gt; 2) or (starts-with(., 'tl') and 'tl' = translate(., '0123456789', '') and string-length(.) &gt; 2) or .='toolsht' or .='trlist' or .='unschedc' or .='unschedchk']) and not(ancestor-or-self::ata-page-block[1]/@pb-name and string(ancestor-or-self::ata-page-block[1]/@pb-name)='intro00') and not(ancestor-or-self::page-block[1]/@pb-name and string(ancestor-or-self::page-block[1]/@pb-name)='intro00') and not(ancestor::ata-page-block/@pb-name[starts-with(., 'disassy') or starts-with(., 'fault')]) and not(ancestor::page-block/@pb-name[starts-with(., 'disassy') or starts-with(., 'fault')]) and not(ancestor::book[contains(@doctype,'oh')] and ancestor::ata-page-block/@pb-name[starts-with(., 'clean')]) and not(ancestor::book[contains(@doctype,'oh')] and ancestor::page-block/@pb-name[starts-with(., 'clean')]) and not(ancestor::ata-page-block/@pb-name[starts-with(., 'mainprac')]) and not(ancestor::page-block/@pb-name[starts-with(., 'mainprac')]) and not(ancestor::book[contains(@doctype,'oh')] and ancestor::ata-page-block/@pb-name[starts-with(., 'inspect')]) and not(ancestor::book[contains(@doctype,'oh')] and ancestor::page-block/@pb-name[starts-with(., 'inspect')]) and not(ancestor::ata-page-block/@pb-name[(starts-with(., 'di') and 'di' = translate(., '0123456789', '') and string-length(.) &gt; 2) or starts-with(.,'service')]) and not(ancestor::page-block/@pb-name[(starts-with(., 'di') and 'di' = translate(., '0123456789', '') and string-length(.) &gt; 2) or starts-with(.,'service')]) and not(ancestor::book[contains(@doctype,'oh')] and ancestor::ata-page-block/@pb-name[starts-with(., 'repair')]) and not(ancestor::book[contains(@doctype,'oh')] and ancestor::page-block/@pb-name[starts-with(., 'repair')]) and not(ancestor::book[contains(@doctype,'oh')] and ancestor::ata-page-block/@pb-name[starts-with(., 'test')]) and not(ancestor::book[contains(@doctype,'oh')] and ancestor::page-block/@pb-name[starts-with(., 'test')]) and not(ancestor::ata-page-block/@pb-name[(starts-with(., 'cl') and 'cl' = translate(., '0123456789', '') and string-length(.) &gt; 2) or .='install' or starts-with(.,'rem-inst') or (starts-with(., 'reminst') and 'reminst' = translate(., '0123456789', '') and string-length(.) &gt; 7) or .='remove' or (starts-with(., 'repair') and 'repair' = translate(., '0123456789', '') and string-length(.) &gt; 6)]) and not(ancestor::page-block/@pb-name[(starts-with(., 'cl') and 'cl' = translate(., '0123456789', '') and string-length(.) &gt; 2) or .='install' or starts-with(.,'rem-inst') or (starts-with(., 'reminst') and 'reminst' = translate(., '0123456789', '') and string-length(.) &gt; 7) or .='remove' or (starts-with(., 'repair') and 'repair' = translate(., '0123456789', '') and string-length(.) &gt; 6)]) and not(ancestor::ata-page-block/@pb-name[starts-with(., 'assy') or (starts-with(., 'ic') and 'ic' = translate(., '0123456789', '') and string-length(.) &gt; 2) or (starts-with(., 'te') and 'te' = translate(., '0123456789', '') and string-length(.) &gt; 2) or .='test']) and not(ancestor::page-block/@pb-name[starts-with(., 'assy') or (starts-with(., 'ic') and 'ic' = translate(., '0123456789', '') and string-length(.) &gt; 2) or (starts-with(., 'te') and 'te' = translate(., '0123456789', '') and string-length(.) &gt; 2) or .='test']) and not(ancestor::ata-page-block/@pb-name[.='f-and-c' or starts-with(., 'inspect') or (starts-with(., 're') and 're' = translate(., '0123456789', '') and string-length(.) &gt; 2)]) and not(ancestor::page-block/@pb-name[.='f-and-c' or starts-with(., 'inspect') or (starts-with(., 're') and 're' = translate(., '0123456789', '') and string-length(.) &gt; 2)]) and not(ancestor::ata-page-block/@pb-name[(starts-with(., 'as') and 'as' = translate(., '0123456789', '') and string-length(.) &gt; 2) or starts-with(.,'clean') or (starts-with(., 'test') and 'test' = translate(., '0123456789', '') and string-length(.) &gt; 4)]) and not(ancestor::page-block/@pb-name[(starts-with(., 'as') and 'as' = translate(., '0123456789', '') and string-length(.) &gt; 2) or starts-with(.,'clean') or (starts-with(., 'test') and 'test' = translate(., '0123456789', '') and string-length(.) &gt; 4)]) and not(ancestor::ata-page-block/@pb-name[(starts-with(., 'fc') and 'fc' = translate(., '0123456789', '') and string-length(.) &gt; 2) or starts-with(.,'repair') or .='trouble']) and not(ancestor::page-block/@pb-name[(starts-with(., 'fc') and 'fc' = translate(., '0123456789', '') and string-length(.) &gt; 2) or starts-with(.,'repair') or .='trouble']) and not(ancestor::ata-page-block/@pb-name[starts-with(.,'storage') or (starts-with(., 'to') and 'to' = translate(., '0123456789', '') and string-length(.) &gt; 2)]) and not(ancestor::page-block/@pb-name[starts-with(.,'storage') or (starts-with(., 'to') and 'to' = translate(., '0123456789', '') and string-length(.) &gt; 2)]) and (ancestor::ata-page-block/@pb-name[.='it-oh' or .='lt-oh'])">
            <!-- Condition #35-->
            <xsl:if test="not(@_gte:Gentext-Expanded)">
               <_sfe:BeforeOrAfterText>Figure <_gte:styler_numbering>
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
         </xsl:when>
         <xsl:when test="not(ancestor::book[contains(@doctype,'oh')] and ancestor::ata-page-block/@pb-name[.='service']) and not(ancestor::book[contains(@doctype,'oh')] and ancestor::page-block/@pb-name[.='service']) and not(ancestor::ata-page-block/@pb-name[.='00awl' or .='00intro' or .='airlim' or .='awl' or .='awlror' or .='chapsect' or .='consume' or .='d-and-o' or .='frontmatte' or .='howtouse' or .='00howtouse' or .='intro' or .='nut_option' or .='oplimits' or .='sblist' or .='schedchk' or .='spectool' or .='timelim' or .='title-page']) and not(ancestor::page-block/@pb-name[.='00awl' or .='00intro' or .='airlim' or .='awl' or .='awlror' or .='chapsect' or .='consume' or .='d-and-o' or .='frontmatte' or .='howtouse' or .='00howtouse' or .='intro' or .='nut_option' or .='oplimits' or .='sblist' or .='schedchk' or .='spectool' or .='timelim' or .='title-page']) and not(ancestor::ata-page-block/@pb-name[(starts-with(., 'do') and 'do' = translate(., '0123456789', '') and string-length(.) &gt; 2) or (starts-with(., 'in') and 'in' = translate(., '0123456789', '') and string-length(.) &gt; 2) or (starts-with(., 'tl') and 'tl' = translate(., '0123456789', '') and string-length(.) &gt; 2) or .='toolsht' or .='trlist' or .='unschedc' or .='unschedchk']) and not(ancestor::page-block/@pb-name[(starts-with(., 'do') and 'do' = translate(., '0123456789', '') and string-length(.) &gt; 2) or (starts-with(., 'in') and 'in' = translate(., '0123456789', '') and string-length(.) &gt; 2) or (starts-with(., 'tl') and 'tl' = translate(., '0123456789', '') and string-length(.) &gt; 2) or .='toolsht' or .='trlist' or .='unschedc' or .='unschedchk']) and not(ancestor-or-self::ata-page-block[1]/@pb-name and string(ancestor-or-self::ata-page-block[1]/@pb-name)='intro00') and not(ancestor-or-self::page-block[1]/@pb-name and string(ancestor-or-self::page-block[1]/@pb-name)='intro00') and not(ancestor::ata-page-block/@pb-name[starts-with(., 'disassy') or starts-with(., 'fault')]) and not(ancestor::page-block/@pb-name[starts-with(., 'disassy') or starts-with(., 'fault')]) and not(ancestor::book[contains(@doctype,'oh')] and ancestor::ata-page-block/@pb-name[starts-with(., 'clean')]) and not(ancestor::book[contains(@doctype,'oh')] and ancestor::page-block/@pb-name[starts-with(., 'clean')]) and not(ancestor::ata-page-block/@pb-name[starts-with(., 'mainprac')]) and not(ancestor::page-block/@pb-name[starts-with(., 'mainprac')]) and not(ancestor::book[contains(@doctype,'oh')] and ancestor::ata-page-block/@pb-name[starts-with(., 'inspect')]) and not(ancestor::book[contains(@doctype,'oh')] and ancestor::page-block/@pb-name[starts-with(., 'inspect')]) and not(ancestor::ata-page-block/@pb-name[(starts-with(., 'di') and 'di' = translate(., '0123456789', '') and string-length(.) &gt; 2) or starts-with(.,'service')]) and not(ancestor::page-block/@pb-name[(starts-with(., 'di') and 'di' = translate(., '0123456789', '') and string-length(.) &gt; 2) or starts-with(.,'service')]) and not(ancestor::book[contains(@doctype,'oh')] and ancestor::ata-page-block/@pb-name[starts-with(., 'repair')]) and not(ancestor::book[contains(@doctype,'oh')] and ancestor::page-block/@pb-name[starts-with(., 'repair')]) and not(ancestor::book[contains(@doctype,'oh')] and ancestor::ata-page-block/@pb-name[starts-with(., 'test')]) and not(ancestor::book[contains(@doctype,'oh')] and ancestor::page-block/@pb-name[starts-with(., 'test')]) and not(ancestor::ata-page-block/@pb-name[(starts-with(., 'cl') and 'cl' = translate(., '0123456789', '') and string-length(.) &gt; 2) or .='install' or starts-with(.,'rem-inst') or (starts-with(., 'reminst') and 'reminst' = translate(., '0123456789', '') and string-length(.) &gt; 7) or .='remove' or (starts-with(., 'repair') and 'repair' = translate(., '0123456789', '') and string-length(.) &gt; 6)]) and not(ancestor::page-block/@pb-name[(starts-with(., 'cl') and 'cl' = translate(., '0123456789', '') and string-length(.) &gt; 2) or .='install' or starts-with(.,'rem-inst') or (starts-with(., 'reminst') and 'reminst' = translate(., '0123456789', '') and string-length(.) &gt; 7) or .='remove' or (starts-with(., 'repair') and 'repair' = translate(., '0123456789', '') and string-length(.) &gt; 6)]) and not(ancestor::ata-page-block/@pb-name[starts-with(., 'assy') or (starts-with(., 'ic') and 'ic' = translate(., '0123456789', '') and string-length(.) &gt; 2) or (starts-with(., 'te') and 'te' = translate(., '0123456789', '') and string-length(.) &gt; 2) or .='test']) and not(ancestor::page-block/@pb-name[starts-with(., 'assy') or (starts-with(., 'ic') and 'ic' = translate(., '0123456789', '') and string-length(.) &gt; 2) or (starts-with(., 'te') and 'te' = translate(., '0123456789', '') and string-length(.) &gt; 2) or .='test']) and not(ancestor::ata-page-block/@pb-name[.='f-and-c' or starts-with(., 'inspect') or (starts-with(., 're') and 're' = translate(., '0123456789', '') and string-length(.) &gt; 2)]) and not(ancestor::page-block/@pb-name[.='f-and-c' or starts-with(., 'inspect') or (starts-with(., 're') and 're' = translate(., '0123456789', '') and string-length(.) &gt; 2)]) and not(ancestor::ata-page-block/@pb-name[(starts-with(., 'as') and 'as' = translate(., '0123456789', '') and string-length(.) &gt; 2) or starts-with(.,'clean') or (starts-with(., 'test') and 'test' = translate(., '0123456789', '') and string-length(.) &gt; 4)]) and not(ancestor::page-block/@pb-name[(starts-with(., 'as') and 'as' = translate(., '0123456789', '') and string-length(.) &gt; 2) or starts-with(.,'clean') or (starts-with(., 'test') and 'test' = translate(., '0123456789', '') and string-length(.) &gt; 4)]) and not(ancestor::ata-page-block/@pb-name[(starts-with(., 'fc') and 'fc' = translate(., '0123456789', '') and string-length(.) &gt; 2) or starts-with(.,'repair') or .='trouble']) and not(ancestor::page-block/@pb-name[(starts-with(., 'fc') and 'fc' = translate(., '0123456789', '') and string-length(.) &gt; 2) or starts-with(.,'repair') or .='trouble']) and not(ancestor::ata-page-block/@pb-name[starts-with(.,'storage') or (starts-with(., 'to') and 'to' = translate(., '0123456789', '') and string-length(.) &gt; 2)]) and (ancestor::page-block/@pb-name[starts-with(.,'storage') or (starts-with(., 'to') and 'to' = translate(., '0123456789', '') and string-length(.) &gt; 2)])">
            <!-- Condition #34-->
            <xsl:if test="not(@_gte:Gentext-Expanded)">
               <_sfe:BeforeOrAfterText>Figure <_gte:styler_numbering>
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
         </xsl:when>
         <xsl:when test="not(ancestor::book[contains(@doctype,'oh')] and ancestor::ata-page-block/@pb-name[.='service']) and not(ancestor::book[contains(@doctype,'oh')] and ancestor::page-block/@pb-name[.='service']) and not(ancestor::ata-page-block/@pb-name[.='00awl' or .='00intro' or .='airlim' or .='awl' or .='awlror' or .='chapsect' or .='consume' or .='d-and-o' or .='frontmatte' or .='howtouse' or .='00howtouse' or .='intro' or .='nut_option' or .='oplimits' or .='sblist' or .='schedchk' or .='spectool' or .='timelim' or .='title-page']) and not(ancestor::page-block/@pb-name[.='00awl' or .='00intro' or .='airlim' or .='awl' or .='awlror' or .='chapsect' or .='consume' or .='d-and-o' or .='frontmatte' or .='howtouse' or .='00howtouse' or .='intro' or .='nut_option' or .='oplimits' or .='sblist' or .='schedchk' or .='spectool' or .='timelim' or .='title-page']) and not(ancestor::ata-page-block/@pb-name[(starts-with(., 'do') and 'do' = translate(., '0123456789', '') and string-length(.) &gt; 2) or (starts-with(., 'in') and 'in' = translate(., '0123456789', '') and string-length(.) &gt; 2) or (starts-with(., 'tl') and 'tl' = translate(., '0123456789', '') and string-length(.) &gt; 2) or .='toolsht' or .='trlist' or .='unschedc' or .='unschedchk']) and not(ancestor::page-block/@pb-name[(starts-with(., 'do') and 'do' = translate(., '0123456789', '') and string-length(.) &gt; 2) or (starts-with(., 'in') and 'in' = translate(., '0123456789', '') and string-length(.) &gt; 2) or (starts-with(., 'tl') and 'tl' = translate(., '0123456789', '') and string-length(.) &gt; 2) or .='toolsht' or .='trlist' or .='unschedc' or .='unschedchk']) and not(ancestor-or-self::ata-page-block[1]/@pb-name and string(ancestor-or-self::ata-page-block[1]/@pb-name)='intro00') and not(ancestor-or-self::page-block[1]/@pb-name and string(ancestor-or-self::page-block[1]/@pb-name)='intro00') and not(ancestor::ata-page-block/@pb-name[starts-with(., 'disassy') or starts-with(., 'fault')]) and not(ancestor::page-block/@pb-name[starts-with(., 'disassy') or starts-with(., 'fault')]) and not(ancestor::book[contains(@doctype,'oh')] and ancestor::ata-page-block/@pb-name[starts-with(., 'clean')]) and not(ancestor::book[contains(@doctype,'oh')] and ancestor::page-block/@pb-name[starts-with(., 'clean')]) and not(ancestor::ata-page-block/@pb-name[starts-with(., 'mainprac')]) and not(ancestor::page-block/@pb-name[starts-with(., 'mainprac')]) and not(ancestor::book[contains(@doctype,'oh')] and ancestor::ata-page-block/@pb-name[starts-with(., 'inspect')]) and not(ancestor::book[contains(@doctype,'oh')] and ancestor::page-block/@pb-name[starts-with(., 'inspect')]) and not(ancestor::ata-page-block/@pb-name[(starts-with(., 'di') and 'di' = translate(., '0123456789', '') and string-length(.) &gt; 2) or starts-with(.,'service')]) and not(ancestor::page-block/@pb-name[(starts-with(., 'di') and 'di' = translate(., '0123456789', '') and string-length(.) &gt; 2) or starts-with(.,'service')]) and not(ancestor::book[contains(@doctype,'oh')] and ancestor::ata-page-block/@pb-name[starts-with(., 'repair')]) and not(ancestor::book[contains(@doctype,'oh')] and ancestor::page-block/@pb-name[starts-with(., 'repair')]) and not(ancestor::book[contains(@doctype,'oh')] and ancestor::ata-page-block/@pb-name[starts-with(., 'test')]) and not(ancestor::book[contains(@doctype,'oh')] and ancestor::page-block/@pb-name[starts-with(., 'test')]) and not(ancestor::ata-page-block/@pb-name[(starts-with(., 'cl') and 'cl' = translate(., '0123456789', '') and string-length(.) &gt; 2) or .='install' or starts-with(.,'rem-inst') or (starts-with(., 'reminst') and 'reminst' = translate(., '0123456789', '') and string-length(.) &gt; 7) or .='remove' or (starts-with(., 'repair') and 'repair' = translate(., '0123456789', '') and string-length(.) &gt; 6)]) and not(ancestor::page-block/@pb-name[(starts-with(., 'cl') and 'cl' = translate(., '0123456789', '') and string-length(.) &gt; 2) or .='install' or starts-with(.,'rem-inst') or (starts-with(., 'reminst') and 'reminst' = translate(., '0123456789', '') and string-length(.) &gt; 7) or .='remove' or (starts-with(., 'repair') and 'repair' = translate(., '0123456789', '') and string-length(.) &gt; 6)]) and not(ancestor::ata-page-block/@pb-name[starts-with(., 'assy') or (starts-with(., 'ic') and 'ic' = translate(., '0123456789', '') and string-length(.) &gt; 2) or (starts-with(., 'te') and 'te' = translate(., '0123456789', '') and string-length(.) &gt; 2) or .='test']) and not(ancestor::page-block/@pb-name[starts-with(., 'assy') or (starts-with(., 'ic') and 'ic' = translate(., '0123456789', '') and string-length(.) &gt; 2) or (starts-with(., 'te') and 'te' = translate(., '0123456789', '') and string-length(.) &gt; 2) or .='test']) and not(ancestor::ata-page-block/@pb-name[.='f-and-c' or starts-with(., 'inspect') or (starts-with(., 're') and 're' = translate(., '0123456789', '') and string-length(.) &gt; 2)]) and not(ancestor::page-block/@pb-name[.='f-and-c' or starts-with(., 'inspect') or (starts-with(., 're') and 're' = translate(., '0123456789', '') and string-length(.) &gt; 2)]) and not(ancestor::ata-page-block/@pb-name[(starts-with(., 'as') and 'as' = translate(., '0123456789', '') and string-length(.) &gt; 2) or starts-with(.,'clean') or (starts-with(., 'test') and 'test' = translate(., '0123456789', '') and string-length(.) &gt; 4)]) and not(ancestor::page-block/@pb-name[(starts-with(., 'as') and 'as' = translate(., '0123456789', '') and string-length(.) &gt; 2) or starts-with(.,'clean') or (starts-with(., 'test') and 'test' = translate(., '0123456789', '') and string-length(.) &gt; 4)]) and not(ancestor::ata-page-block/@pb-name[(starts-with(., 'fc') and 'fc' = translate(., '0123456789', '') and string-length(.) &gt; 2) or starts-with(.,'repair') or .='trouble']) and not(ancestor::page-block/@pb-name[(starts-with(., 'fc') and 'fc' = translate(., '0123456789', '') and string-length(.) &gt; 2) or starts-with(.,'repair') or .='trouble']) and (ancestor::ata-page-block/@pb-name[starts-with(.,'storage') or (starts-with(., 'to') and 'to' = translate(., '0123456789', '') and string-length(.) &gt; 2)])">
            <!-- Condition #33-->
            <xsl:if test="not(@_gte:Gentext-Expanded)">
               <_sfe:BeforeOrAfterText>Figure <_gte:styler_numbering>
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
         </xsl:when>
         <xsl:when test="not(ancestor::book[contains(@doctype,'oh')] and ancestor::ata-page-block/@pb-name[.='service']) and not(ancestor::book[contains(@doctype,'oh')] and ancestor::page-block/@pb-name[.='service']) and not(ancestor::ata-page-block/@pb-name[.='00awl' or .='00intro' or .='airlim' or .='awl' or .='awlror' or .='chapsect' or .='consume' or .='d-and-o' or .='frontmatte' or .='howtouse' or .='00howtouse' or .='intro' or .='nut_option' or .='oplimits' or .='sblist' or .='schedchk' or .='spectool' or .='timelim' or .='title-page']) and not(ancestor::page-block/@pb-name[.='00awl' or .='00intro' or .='airlim' or .='awl' or .='awlror' or .='chapsect' or .='consume' or .='d-and-o' or .='frontmatte' or .='howtouse' or .='00howtouse' or .='intro' or .='nut_option' or .='oplimits' or .='sblist' or .='schedchk' or .='spectool' or .='timelim' or .='title-page']) and not(ancestor::ata-page-block/@pb-name[(starts-with(., 'do') and 'do' = translate(., '0123456789', '') and string-length(.) &gt; 2) or (starts-with(., 'in') and 'in' = translate(., '0123456789', '') and string-length(.) &gt; 2) or (starts-with(., 'tl') and 'tl' = translate(., '0123456789', '') and string-length(.) &gt; 2) or .='toolsht' or .='trlist' or .='unschedc' or .='unschedchk']) and not(ancestor::page-block/@pb-name[(starts-with(., 'do') and 'do' = translate(., '0123456789', '') and string-length(.) &gt; 2) or (starts-with(., 'in') and 'in' = translate(., '0123456789', '') and string-length(.) &gt; 2) or (starts-with(., 'tl') and 'tl' = translate(., '0123456789', '') and string-length(.) &gt; 2) or .='toolsht' or .='trlist' or .='unschedc' or .='unschedchk']) and not(ancestor-or-self::ata-page-block[1]/@pb-name and string(ancestor-or-self::ata-page-block[1]/@pb-name)='intro00') and not(ancestor-or-self::page-block[1]/@pb-name and string(ancestor-or-self::page-block[1]/@pb-name)='intro00') and not(ancestor::ata-page-block/@pb-name[starts-with(., 'disassy') or starts-with(., 'fault')]) and not(ancestor::page-block/@pb-name[starts-with(., 'disassy') or starts-with(., 'fault')]) and not(ancestor::book[contains(@doctype,'oh')] and ancestor::ata-page-block/@pb-name[starts-with(., 'clean')]) and not(ancestor::book[contains(@doctype,'oh')] and ancestor::page-block/@pb-name[starts-with(., 'clean')]) and not(ancestor::ata-page-block/@pb-name[starts-with(., 'mainprac')]) and not(ancestor::page-block/@pb-name[starts-with(., 'mainprac')]) and not(ancestor::book[contains(@doctype,'oh')] and ancestor::ata-page-block/@pb-name[starts-with(., 'inspect')]) and not(ancestor::book[contains(@doctype,'oh')] and ancestor::page-block/@pb-name[starts-with(., 'inspect')]) and not(ancestor::ata-page-block/@pb-name[(starts-with(., 'di') and 'di' = translate(., '0123456789', '') and string-length(.) &gt; 2) or starts-with(.,'service')]) and not(ancestor::page-block/@pb-name[(starts-with(., 'di') and 'di' = translate(., '0123456789', '') and string-length(.) &gt; 2) or starts-with(.,'service')]) and not(ancestor::book[contains(@doctype,'oh')] and ancestor::ata-page-block/@pb-name[starts-with(., 'repair')]) and not(ancestor::book[contains(@doctype,'oh')] and ancestor::page-block/@pb-name[starts-with(., 'repair')]) and not(ancestor::book[contains(@doctype,'oh')] and ancestor::ata-page-block/@pb-name[starts-with(., 'test')]) and not(ancestor::book[contains(@doctype,'oh')] and ancestor::page-block/@pb-name[starts-with(., 'test')]) and not(ancestor::ata-page-block/@pb-name[(starts-with(., 'cl') and 'cl' = translate(., '0123456789', '') and string-length(.) &gt; 2) or .='install' or starts-with(.,'rem-inst') or (starts-with(., 'reminst') and 'reminst' = translate(., '0123456789', '') and string-length(.) &gt; 7) or .='remove' or (starts-with(., 'repair') and 'repair' = translate(., '0123456789', '') and string-length(.) &gt; 6)]) and not(ancestor::page-block/@pb-name[(starts-with(., 'cl') and 'cl' = translate(., '0123456789', '') and string-length(.) &gt; 2) or .='install' or starts-with(.,'rem-inst') or (starts-with(., 'reminst') and 'reminst' = translate(., '0123456789', '') and string-length(.) &gt; 7) or .='remove' or (starts-with(., 'repair') and 'repair' = translate(., '0123456789', '') and string-length(.) &gt; 6)]) and not(ancestor::ata-page-block/@pb-name[starts-with(., 'assy') or (starts-with(., 'ic') and 'ic' = translate(., '0123456789', '') and string-length(.) &gt; 2) or (starts-with(., 'te') and 'te' = translate(., '0123456789', '') and string-length(.) &gt; 2) or .='test']) and not(ancestor::page-block/@pb-name[starts-with(., 'assy') or (starts-with(., 'ic') and 'ic' = translate(., '0123456789', '') and string-length(.) &gt; 2) or (starts-with(., 'te') and 'te' = translate(., '0123456789', '') and string-length(.) &gt; 2) or .='test']) and not(ancestor::ata-page-block/@pb-name[.='f-and-c' or starts-with(., 'inspect') or (starts-with(., 're') and 're' = translate(., '0123456789', '') and string-length(.) &gt; 2)]) and not(ancestor::page-block/@pb-name[.='f-and-c' or starts-with(., 'inspect') or (starts-with(., 're') and 're' = translate(., '0123456789', '') and string-length(.) &gt; 2)]) and not(ancestor::ata-page-block/@pb-name[(starts-with(., 'as') and 'as' = translate(., '0123456789', '') and string-length(.) &gt; 2) or starts-with(.,'clean') or (starts-with(., 'test') and 'test' = translate(., '0123456789', '') and string-length(.) &gt; 4)]) and not(ancestor::page-block/@pb-name[(starts-with(., 'as') and 'as' = translate(., '0123456789', '') and string-length(.) &gt; 2) or starts-with(.,'clean') or (starts-with(., 'test') and 'test' = translate(., '0123456789', '') and string-length(.) &gt; 4)]) and not(ancestor::ata-page-block/@pb-name[(starts-with(., 'fc') and 'fc' = translate(., '0123456789', '') and string-length(.) &gt; 2) or starts-with(.,'repair') or .='trouble']) and (ancestor::page-block/@pb-name[(starts-with(., 'fc') and 'fc' = translate(., '0123456789', '') and string-length(.) &gt; 2) or starts-with(.,'repair') or .='trouble'])">
            <!-- Condition #32-->
            <xsl:if test="not(@_gte:Gentext-Expanded)">
               <_sfe:BeforeOrAfterText>Figure <_gte:styler_numbering>
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
         </xsl:when>
         <xsl:when test="not(ancestor::book[contains(@doctype,'oh')] and ancestor::ata-page-block/@pb-name[.='service']) and not(ancestor::book[contains(@doctype,'oh')] and ancestor::page-block/@pb-name[.='service']) and not(ancestor::ata-page-block/@pb-name[.='00awl' or .='00intro' or .='airlim' or .='awl' or .='awlror' or .='chapsect' or .='consume' or .='d-and-o' or .='frontmatte' or .='howtouse' or .='00howtouse' or .='intro' or .='nut_option' or .='oplimits' or .='sblist' or .='schedchk' or .='spectool' or .='timelim' or .='title-page']) and not(ancestor::page-block/@pb-name[.='00awl' or .='00intro' or .='airlim' or .='awl' or .='awlror' or .='chapsect' or .='consume' or .='d-and-o' or .='frontmatte' or .='howtouse' or .='00howtouse' or .='intro' or .='nut_option' or .='oplimits' or .='sblist' or .='schedchk' or .='spectool' or .='timelim' or .='title-page']) and not(ancestor::ata-page-block/@pb-name[(starts-with(., 'do') and 'do' = translate(., '0123456789', '') and string-length(.) &gt; 2) or (starts-with(., 'in') and 'in' = translate(., '0123456789', '') and string-length(.) &gt; 2) or (starts-with(., 'tl') and 'tl' = translate(., '0123456789', '') and string-length(.) &gt; 2) or .='toolsht' or .='trlist' or .='unschedc' or .='unschedchk']) and not(ancestor::page-block/@pb-name[(starts-with(., 'do') and 'do' = translate(., '0123456789', '') and string-length(.) &gt; 2) or (starts-with(., 'in') and 'in' = translate(., '0123456789', '') and string-length(.) &gt; 2) or (starts-with(., 'tl') and 'tl' = translate(., '0123456789', '') and string-length(.) &gt; 2) or .='toolsht' or .='trlist' or .='unschedc' or .='unschedchk']) and not(ancestor-or-self::ata-page-block[1]/@pb-name and string(ancestor-or-self::ata-page-block[1]/@pb-name)='intro00') and not(ancestor-or-self::page-block[1]/@pb-name and string(ancestor-or-self::page-block[1]/@pb-name)='intro00') and not(ancestor::ata-page-block/@pb-name[starts-with(., 'disassy') or starts-with(., 'fault')]) and not(ancestor::page-block/@pb-name[starts-with(., 'disassy') or starts-with(., 'fault')]) and not(ancestor::book[contains(@doctype,'oh')] and ancestor::ata-page-block/@pb-name[starts-with(., 'clean')]) and not(ancestor::book[contains(@doctype,'oh')] and ancestor::page-block/@pb-name[starts-with(., 'clean')]) and not(ancestor::ata-page-block/@pb-name[starts-with(., 'mainprac')]) and not(ancestor::page-block/@pb-name[starts-with(., 'mainprac')]) and not(ancestor::book[contains(@doctype,'oh')] and ancestor::ata-page-block/@pb-name[starts-with(., 'inspect')]) and not(ancestor::book[contains(@doctype,'oh')] and ancestor::page-block/@pb-name[starts-with(., 'inspect')]) and not(ancestor::ata-page-block/@pb-name[(starts-with(., 'di') and 'di' = translate(., '0123456789', '') and string-length(.) &gt; 2) or starts-with(.,'service')]) and not(ancestor::page-block/@pb-name[(starts-with(., 'di') and 'di' = translate(., '0123456789', '') and string-length(.) &gt; 2) or starts-with(.,'service')]) and not(ancestor::book[contains(@doctype,'oh')] and ancestor::ata-page-block/@pb-name[starts-with(., 'repair')]) and not(ancestor::book[contains(@doctype,'oh')] and ancestor::page-block/@pb-name[starts-with(., 'repair')]) and not(ancestor::book[contains(@doctype,'oh')] and ancestor::ata-page-block/@pb-name[starts-with(., 'test')]) and not(ancestor::book[contains(@doctype,'oh')] and ancestor::page-block/@pb-name[starts-with(., 'test')]) and not(ancestor::ata-page-block/@pb-name[(starts-with(., 'cl') and 'cl' = translate(., '0123456789', '') and string-length(.) &gt; 2) or .='install' or starts-with(.,'rem-inst') or (starts-with(., 'reminst') and 'reminst' = translate(., '0123456789', '') and string-length(.) &gt; 7) or .='remove' or (starts-with(., 'repair') and 'repair' = translate(., '0123456789', '') and string-length(.) &gt; 6)]) and not(ancestor::page-block/@pb-name[(starts-with(., 'cl') and 'cl' = translate(., '0123456789', '') and string-length(.) &gt; 2) or .='install' or starts-with(.,'rem-inst') or (starts-with(., 'reminst') and 'reminst' = translate(., '0123456789', '') and string-length(.) &gt; 7) or .='remove' or (starts-with(., 'repair') and 'repair' = translate(., '0123456789', '') and string-length(.) &gt; 6)]) and not(ancestor::ata-page-block/@pb-name[starts-with(., 'assy') or (starts-with(., 'ic') and 'ic' = translate(., '0123456789', '') and string-length(.) &gt; 2) or (starts-with(., 'te') and 'te' = translate(., '0123456789', '') and string-length(.) &gt; 2) or .='test']) and not(ancestor::page-block/@pb-name[starts-with(., 'assy') or (starts-with(., 'ic') and 'ic' = translate(., '0123456789', '') and string-length(.) &gt; 2) or (starts-with(., 'te') and 'te' = translate(., '0123456789', '') and string-length(.) &gt; 2) or .='test']) and not(ancestor::ata-page-block/@pb-name[.='f-and-c' or starts-with(., 'inspect') or (starts-with(., 're') and 're' = translate(., '0123456789', '') and string-length(.) &gt; 2)]) and not(ancestor::page-block/@pb-name[.='f-and-c' or starts-with(., 'inspect') or (starts-with(., 're') and 're' = translate(., '0123456789', '') and string-length(.) &gt; 2)]) and not(ancestor::ata-page-block/@pb-name[(starts-with(., 'as') and 'as' = translate(., '0123456789', '') and string-length(.) &gt; 2) or starts-with(.,'clean') or (starts-with(., 'test') and 'test' = translate(., '0123456789', '') and string-length(.) &gt; 4)]) and not(ancestor::page-block/@pb-name[(starts-with(., 'as') and 'as' = translate(., '0123456789', '') and string-length(.) &gt; 2) or starts-with(.,'clean') or (starts-with(., 'test') and 'test' = translate(., '0123456789', '') and string-length(.) &gt; 4)]) and (ancestor::ata-page-block/@pb-name[(starts-with(., 'fc') and 'fc' = translate(., '0123456789', '') and string-length(.) &gt; 2) or starts-with(.,'repair') or .='trouble'])">
            <!-- Condition #31-->
            <xsl:if test="not(@_gte:Gentext-Expanded)">
               <_sfe:BeforeOrAfterText>Figure <_gte:styler_numbering>
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
         </xsl:when>
         <xsl:when test="not(ancestor::book[contains(@doctype,'oh')] and ancestor::ata-page-block/@pb-name[.='service']) and not(ancestor::book[contains(@doctype,'oh')] and ancestor::page-block/@pb-name[.='service']) and not(ancestor::ata-page-block/@pb-name[.='00awl' or .='00intro' or .='airlim' or .='awl' or .='awlror' or .='chapsect' or .='consume' or .='d-and-o' or .='frontmatte' or .='howtouse' or .='00howtouse' or .='intro' or .='nut_option' or .='oplimits' or .='sblist' or .='schedchk' or .='spectool' or .='timelim' or .='title-page']) and not(ancestor::page-block/@pb-name[.='00awl' or .='00intro' or .='airlim' or .='awl' or .='awlror' or .='chapsect' or .='consume' or .='d-and-o' or .='frontmatte' or .='howtouse' or .='00howtouse' or .='intro' or .='nut_option' or .='oplimits' or .='sblist' or .='schedchk' or .='spectool' or .='timelim' or .='title-page']) and not(ancestor::ata-page-block/@pb-name[(starts-with(., 'do') and 'do' = translate(., '0123456789', '') and string-length(.) &gt; 2) or (starts-with(., 'in') and 'in' = translate(., '0123456789', '') and string-length(.) &gt; 2) or (starts-with(., 'tl') and 'tl' = translate(., '0123456789', '') and string-length(.) &gt; 2) or .='toolsht' or .='trlist' or .='unschedc' or .='unschedchk']) and not(ancestor::page-block/@pb-name[(starts-with(., 'do') and 'do' = translate(., '0123456789', '') and string-length(.) &gt; 2) or (starts-with(., 'in') and 'in' = translate(., '0123456789', '') and string-length(.) &gt; 2) or (starts-with(., 'tl') and 'tl' = translate(., '0123456789', '') and string-length(.) &gt; 2) or .='toolsht' or .='trlist' or .='unschedc' or .='unschedchk']) and not(ancestor-or-self::ata-page-block[1]/@pb-name and string(ancestor-or-self::ata-page-block[1]/@pb-name)='intro00') and not(ancestor-or-self::page-block[1]/@pb-name and string(ancestor-or-self::page-block[1]/@pb-name)='intro00') and not(ancestor::ata-page-block/@pb-name[starts-with(., 'disassy') or starts-with(., 'fault')]) and not(ancestor::page-block/@pb-name[starts-with(., 'disassy') or starts-with(., 'fault')]) and not(ancestor::book[contains(@doctype,'oh')] and ancestor::ata-page-block/@pb-name[starts-with(., 'clean')]) and not(ancestor::book[contains(@doctype,'oh')] and ancestor::page-block/@pb-name[starts-with(., 'clean')]) and not(ancestor::ata-page-block/@pb-name[starts-with(., 'mainprac')]) and not(ancestor::page-block/@pb-name[starts-with(., 'mainprac')]) and not(ancestor::book[contains(@doctype,'oh')] and ancestor::ata-page-block/@pb-name[starts-with(., 'inspect')]) and not(ancestor::book[contains(@doctype,'oh')] and ancestor::page-block/@pb-name[starts-with(., 'inspect')]) and not(ancestor::ata-page-block/@pb-name[(starts-with(., 'di') and 'di' = translate(., '0123456789', '') and string-length(.) &gt; 2) or starts-with(.,'service')]) and not(ancestor::page-block/@pb-name[(starts-with(., 'di') and 'di' = translate(., '0123456789', '') and string-length(.) &gt; 2) or starts-with(.,'service')]) and not(ancestor::book[contains(@doctype,'oh')] and ancestor::ata-page-block/@pb-name[starts-with(., 'repair')]) and not(ancestor::book[contains(@doctype,'oh')] and ancestor::page-block/@pb-name[starts-with(., 'repair')]) and not(ancestor::book[contains(@doctype,'oh')] and ancestor::ata-page-block/@pb-name[starts-with(., 'test')]) and not(ancestor::book[contains(@doctype,'oh')] and ancestor::page-block/@pb-name[starts-with(., 'test')]) and not(ancestor::ata-page-block/@pb-name[(starts-with(., 'cl') and 'cl' = translate(., '0123456789', '') and string-length(.) &gt; 2) or .='install' or starts-with(.,'rem-inst') or (starts-with(., 'reminst') and 'reminst' = translate(., '0123456789', '') and string-length(.) &gt; 7) or .='remove' or (starts-with(., 'repair') and 'repair' = translate(., '0123456789', '') and string-length(.) &gt; 6)]) and not(ancestor::page-block/@pb-name[(starts-with(., 'cl') and 'cl' = translate(., '0123456789', '') and string-length(.) &gt; 2) or .='install' or starts-with(.,'rem-inst') or (starts-with(., 'reminst') and 'reminst' = translate(., '0123456789', '') and string-length(.) &gt; 7) or .='remove' or (starts-with(., 'repair') and 'repair' = translate(., '0123456789', '') and string-length(.) &gt; 6)]) and not(ancestor::ata-page-block/@pb-name[starts-with(., 'assy') or (starts-with(., 'ic') and 'ic' = translate(., '0123456789', '') and string-length(.) &gt; 2) or (starts-with(., 'te') and 'te' = translate(., '0123456789', '') and string-length(.) &gt; 2) or .='test']) and not(ancestor::page-block/@pb-name[starts-with(., 'assy') or (starts-with(., 'ic') and 'ic' = translate(., '0123456789', '') and string-length(.) &gt; 2) or (starts-with(., 'te') and 'te' = translate(., '0123456789', '') and string-length(.) &gt; 2) or .='test']) and not(ancestor::ata-page-block/@pb-name[.='f-and-c' or starts-with(., 'inspect') or (starts-with(., 're') and 're' = translate(., '0123456789', '') and string-length(.) &gt; 2)]) and not(ancestor::page-block/@pb-name[.='f-and-c' or starts-with(., 'inspect') or (starts-with(., 're') and 're' = translate(., '0123456789', '') and string-length(.) &gt; 2)]) and not(ancestor::ata-page-block/@pb-name[(starts-with(., 'as') and 'as' = translate(., '0123456789', '') and string-length(.) &gt; 2) or starts-with(.,'clean') or (starts-with(., 'test') and 'test' = translate(., '0123456789', '') and string-length(.) &gt; 4)]) and (ancestor::page-block/@pb-name[(starts-with(., 'as') and 'as' = translate(., '0123456789', '') and string-length(.) &gt; 2) or starts-with(.,'clean') or (starts-with(., 'test') and 'test' = translate(., '0123456789', '') and string-length(.) &gt; 4)])">
            <!-- Condition #30-->
            <xsl:if test="not(@_gte:Gentext-Expanded)">
               <_sfe:BeforeOrAfterText>Figure <_gte:styler_numbering>
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
         </xsl:when>
         <xsl:when test="not(ancestor::book[contains(@doctype,'oh')] and ancestor::ata-page-block/@pb-name[.='service']) and not(ancestor::book[contains(@doctype,'oh')] and ancestor::page-block/@pb-name[.='service']) and not(ancestor::ata-page-block/@pb-name[.='00awl' or .='00intro' or .='airlim' or .='awl' or .='awlror' or .='chapsect' or .='consume' or .='d-and-o' or .='frontmatte' or .='howtouse' or .='00howtouse' or .='intro' or .='nut_option' or .='oplimits' or .='sblist' or .='schedchk' or .='spectool' or .='timelim' or .='title-page']) and not(ancestor::page-block/@pb-name[.='00awl' or .='00intro' or .='airlim' or .='awl' or .='awlror' or .='chapsect' or .='consume' or .='d-and-o' or .='frontmatte' or .='howtouse' or .='00howtouse' or .='intro' or .='nut_option' or .='oplimits' or .='sblist' or .='schedchk' or .='spectool' or .='timelim' or .='title-page']) and not(ancestor::ata-page-block/@pb-name[(starts-with(., 'do') and 'do' = translate(., '0123456789', '') and string-length(.) &gt; 2) or (starts-with(., 'in') and 'in' = translate(., '0123456789', '') and string-length(.) &gt; 2) or (starts-with(., 'tl') and 'tl' = translate(., '0123456789', '') and string-length(.) &gt; 2) or .='toolsht' or .='trlist' or .='unschedc' or .='unschedchk']) and not(ancestor::page-block/@pb-name[(starts-with(., 'do') and 'do' = translate(., '0123456789', '') and string-length(.) &gt; 2) or (starts-with(., 'in') and 'in' = translate(., '0123456789', '') and string-length(.) &gt; 2) or (starts-with(., 'tl') and 'tl' = translate(., '0123456789', '') and string-length(.) &gt; 2) or .='toolsht' or .='trlist' or .='unschedc' or .='unschedchk']) and not(ancestor-or-self::ata-page-block[1]/@pb-name and string(ancestor-or-self::ata-page-block[1]/@pb-name)='intro00') and not(ancestor-or-self::page-block[1]/@pb-name and string(ancestor-or-self::page-block[1]/@pb-name)='intro00') and not(ancestor::ata-page-block/@pb-name[starts-with(., 'disassy') or starts-with(., 'fault')]) and not(ancestor::page-block/@pb-name[starts-with(., 'disassy') or starts-with(., 'fault')]) and not(ancestor::book[contains(@doctype,'oh')] and ancestor::ata-page-block/@pb-name[starts-with(., 'clean')]) and not(ancestor::book[contains(@doctype,'oh')] and ancestor::page-block/@pb-name[starts-with(., 'clean')]) and not(ancestor::ata-page-block/@pb-name[starts-with(., 'mainprac')]) and not(ancestor::page-block/@pb-name[starts-with(., 'mainprac')]) and not(ancestor::book[contains(@doctype,'oh')] and ancestor::ata-page-block/@pb-name[starts-with(., 'inspect')]) and not(ancestor::book[contains(@doctype,'oh')] and ancestor::page-block/@pb-name[starts-with(., 'inspect')]) and not(ancestor::ata-page-block/@pb-name[(starts-with(., 'di') and 'di' = translate(., '0123456789', '') and string-length(.) &gt; 2) or starts-with(.,'service')]) and not(ancestor::page-block/@pb-name[(starts-with(., 'di') and 'di' = translate(., '0123456789', '') and string-length(.) &gt; 2) or starts-with(.,'service')]) and not(ancestor::book[contains(@doctype,'oh')] and ancestor::ata-page-block/@pb-name[starts-with(., 'repair')]) and not(ancestor::book[contains(@doctype,'oh')] and ancestor::page-block/@pb-name[starts-with(., 'repair')]) and not(ancestor::book[contains(@doctype,'oh')] and ancestor::ata-page-block/@pb-name[starts-with(., 'test')]) and not(ancestor::book[contains(@doctype,'oh')] and ancestor::page-block/@pb-name[starts-with(., 'test')]) and not(ancestor::ata-page-block/@pb-name[(starts-with(., 'cl') and 'cl' = translate(., '0123456789', '') and string-length(.) &gt; 2) or .='install' or starts-with(.,'rem-inst') or (starts-with(., 'reminst') and 'reminst' = translate(., '0123456789', '') and string-length(.) &gt; 7) or .='remove' or (starts-with(., 'repair') and 'repair' = translate(., '0123456789', '') and string-length(.) &gt; 6)]) and not(ancestor::page-block/@pb-name[(starts-with(., 'cl') and 'cl' = translate(., '0123456789', '') and string-length(.) &gt; 2) or .='install' or starts-with(.,'rem-inst') or (starts-with(., 'reminst') and 'reminst' = translate(., '0123456789', '') and string-length(.) &gt; 7) or .='remove' or (starts-with(., 'repair') and 'repair' = translate(., '0123456789', '') and string-length(.) &gt; 6)]) and not(ancestor::ata-page-block/@pb-name[starts-with(., 'assy') or (starts-with(., 'ic') and 'ic' = translate(., '0123456789', '') and string-length(.) &gt; 2) or (starts-with(., 'te') and 'te' = translate(., '0123456789', '') and string-length(.) &gt; 2) or .='test']) and not(ancestor::page-block/@pb-name[starts-with(., 'assy') or (starts-with(., 'ic') and 'ic' = translate(., '0123456789', '') and string-length(.) &gt; 2) or (starts-with(., 'te') and 'te' = translate(., '0123456789', '') and string-length(.) &gt; 2) or .='test']) and not(ancestor::ata-page-block/@pb-name[.='f-and-c' or starts-with(., 'inspect') or (starts-with(., 're') and 're' = translate(., '0123456789', '') and string-length(.) &gt; 2)]) and not(ancestor::page-block/@pb-name[.='f-and-c' or starts-with(., 'inspect') or (starts-with(., 're') and 're' = translate(., '0123456789', '') and string-length(.) &gt; 2)]) and (ancestor::ata-page-block/@pb-name[(starts-with(., 'as') and 'as' = translate(., '0123456789', '') and string-length(.) &gt; 2) or starts-with(.,'clean') or (starts-with(., 'test') and 'test' = translate(., '0123456789', '') and string-length(.) &gt; 4)])">
            <!-- Condition #29-->
            <xsl:if test="not(@_gte:Gentext-Expanded)">
               <_sfe:BeforeOrAfterText>Figure <_gte:styler_numbering>
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
         </xsl:when>
         <xsl:when test="not(ancestor::book[contains(@doctype,'oh')] and ancestor::ata-page-block/@pb-name[.='service']) and not(ancestor::book[contains(@doctype,'oh')] and ancestor::page-block/@pb-name[.='service']) and not(ancestor::ata-page-block/@pb-name[.='00awl' or .='00intro' or .='airlim' or .='awl' or .='awlror' or .='chapsect' or .='consume' or .='d-and-o' or .='frontmatte' or .='howtouse' or .='00howtouse' or .='intro' or .='nut_option' or .='oplimits' or .='sblist' or .='schedchk' or .='spectool' or .='timelim' or .='title-page']) and not(ancestor::page-block/@pb-name[.='00awl' or .='00intro' or .='airlim' or .='awl' or .='awlror' or .='chapsect' or .='consume' or .='d-and-o' or .='frontmatte' or .='howtouse' or .='00howtouse' or .='intro' or .='nut_option' or .='oplimits' or .='sblist' or .='schedchk' or .='spectool' or .='timelim' or .='title-page']) and not(ancestor::ata-page-block/@pb-name[(starts-with(., 'do') and 'do' = translate(., '0123456789', '') and string-length(.) &gt; 2) or (starts-with(., 'in') and 'in' = translate(., '0123456789', '') and string-length(.) &gt; 2) or (starts-with(., 'tl') and 'tl' = translate(., '0123456789', '') and string-length(.) &gt; 2) or .='toolsht' or .='trlist' or .='unschedc' or .='unschedchk']) and not(ancestor::page-block/@pb-name[(starts-with(., 'do') and 'do' = translate(., '0123456789', '') and string-length(.) &gt; 2) or (starts-with(., 'in') and 'in' = translate(., '0123456789', '') and string-length(.) &gt; 2) or (starts-with(., 'tl') and 'tl' = translate(., '0123456789', '') and string-length(.) &gt; 2) or .='toolsht' or .='trlist' or .='unschedc' or .='unschedchk']) and not(ancestor-or-self::ata-page-block[1]/@pb-name and string(ancestor-or-self::ata-page-block[1]/@pb-name)='intro00') and not(ancestor-or-self::page-block[1]/@pb-name and string(ancestor-or-self::page-block[1]/@pb-name)='intro00') and not(ancestor::ata-page-block/@pb-name[starts-with(., 'disassy') or starts-with(., 'fault')]) and not(ancestor::page-block/@pb-name[starts-with(., 'disassy') or starts-with(., 'fault')]) and not(ancestor::book[contains(@doctype,'oh')] and ancestor::ata-page-block/@pb-name[starts-with(., 'clean')]) and not(ancestor::book[contains(@doctype,'oh')] and ancestor::page-block/@pb-name[starts-with(., 'clean')]) and not(ancestor::ata-page-block/@pb-name[starts-with(., 'mainprac')]) and not(ancestor::page-block/@pb-name[starts-with(., 'mainprac')]) and not(ancestor::book[contains(@doctype,'oh')] and ancestor::ata-page-block/@pb-name[starts-with(., 'inspect')]) and not(ancestor::book[contains(@doctype,'oh')] and ancestor::page-block/@pb-name[starts-with(., 'inspect')]) and not(ancestor::ata-page-block/@pb-name[(starts-with(., 'di') and 'di' = translate(., '0123456789', '') and string-length(.) &gt; 2) or starts-with(.,'service')]) and not(ancestor::page-block/@pb-name[(starts-with(., 'di') and 'di' = translate(., '0123456789', '') and string-length(.) &gt; 2) or starts-with(.,'service')]) and not(ancestor::book[contains(@doctype,'oh')] and ancestor::ata-page-block/@pb-name[starts-with(., 'repair')]) and not(ancestor::book[contains(@doctype,'oh')] and ancestor::page-block/@pb-name[starts-with(., 'repair')]) and not(ancestor::book[contains(@doctype,'oh')] and ancestor::ata-page-block/@pb-name[starts-with(., 'test')]) and not(ancestor::book[contains(@doctype,'oh')] and ancestor::page-block/@pb-name[starts-with(., 'test')]) and not(ancestor::ata-page-block/@pb-name[(starts-with(., 'cl') and 'cl' = translate(., '0123456789', '') and string-length(.) &gt; 2) or .='install' or starts-with(.,'rem-inst') or (starts-with(., 'reminst') and 'reminst' = translate(., '0123456789', '') and string-length(.) &gt; 7) or .='remove' or (starts-with(., 'repair') and 'repair' = translate(., '0123456789', '') and string-length(.) &gt; 6)]) and not(ancestor::page-block/@pb-name[(starts-with(., 'cl') and 'cl' = translate(., '0123456789', '') and string-length(.) &gt; 2) or .='install' or starts-with(.,'rem-inst') or (starts-with(., 'reminst') and 'reminst' = translate(., '0123456789', '') and string-length(.) &gt; 7) or .='remove' or (starts-with(., 'repair') and 'repair' = translate(., '0123456789', '') and string-length(.) &gt; 6)]) and not(ancestor::ata-page-block/@pb-name[starts-with(., 'assy') or (starts-with(., 'ic') and 'ic' = translate(., '0123456789', '') and string-length(.) &gt; 2) or (starts-with(., 'te') and 'te' = translate(., '0123456789', '') and string-length(.) &gt; 2) or .='test']) and not(ancestor::page-block/@pb-name[starts-with(., 'assy') or (starts-with(., 'ic') and 'ic' = translate(., '0123456789', '') and string-length(.) &gt; 2) or (starts-with(., 'te') and 'te' = translate(., '0123456789', '') and string-length(.) &gt; 2) or .='test']) and not(ancestor::ata-page-block/@pb-name[.='f-and-c' or starts-with(., 'inspect') or (starts-with(., 're') and 're' = translate(., '0123456789', '') and string-length(.) &gt; 2)]) and (ancestor::page-block/@pb-name[.='f-and-c' or starts-with(., 'inspect') or (starts-with(., 're') and 're' = translate(., '0123456789', '') and string-length(.) &gt; 2)])">
            <!-- Condition #28-->
            <xsl:if test="not(@_gte:Gentext-Expanded)">
               <_sfe:BeforeOrAfterText>Figure <_gte:styler_numbering>
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
         </xsl:when>
         <xsl:when test="not(ancestor::book[contains(@doctype,'oh')] and ancestor::ata-page-block/@pb-name[.='service']) and not(ancestor::book[contains(@doctype,'oh')] and ancestor::page-block/@pb-name[.='service']) and not(ancestor::ata-page-block/@pb-name[.='00awl' or .='00intro' or .='airlim' or .='awl' or .='awlror' or .='chapsect' or .='consume' or .='d-and-o' or .='frontmatte' or .='howtouse' or .='00howtouse' or .='intro' or .='nut_option' or .='oplimits' or .='sblist' or .='schedchk' or .='spectool' or .='timelim' or .='title-page']) and not(ancestor::page-block/@pb-name[.='00awl' or .='00intro' or .='airlim' or .='awl' or .='awlror' or .='chapsect' or .='consume' or .='d-and-o' or .='frontmatte' or .='howtouse' or .='00howtouse' or .='intro' or .='nut_option' or .='oplimits' or .='sblist' or .='schedchk' or .='spectool' or .='timelim' or .='title-page']) and not(ancestor::ata-page-block/@pb-name[(starts-with(., 'do') and 'do' = translate(., '0123456789', '') and string-length(.) &gt; 2) or (starts-with(., 'in') and 'in' = translate(., '0123456789', '') and string-length(.) &gt; 2) or (starts-with(., 'tl') and 'tl' = translate(., '0123456789', '') and string-length(.) &gt; 2) or .='toolsht' or .='trlist' or .='unschedc' or .='unschedchk']) and not(ancestor::page-block/@pb-name[(starts-with(., 'do') and 'do' = translate(., '0123456789', '') and string-length(.) &gt; 2) or (starts-with(., 'in') and 'in' = translate(., '0123456789', '') and string-length(.) &gt; 2) or (starts-with(., 'tl') and 'tl' = translate(., '0123456789', '') and string-length(.) &gt; 2) or .='toolsht' or .='trlist' or .='unschedc' or .='unschedchk']) and not(ancestor-or-self::ata-page-block[1]/@pb-name and string(ancestor-or-self::ata-page-block[1]/@pb-name)='intro00') and not(ancestor-or-self::page-block[1]/@pb-name and string(ancestor-or-self::page-block[1]/@pb-name)='intro00') and not(ancestor::ata-page-block/@pb-name[starts-with(., 'disassy') or starts-with(., 'fault')]) and not(ancestor::page-block/@pb-name[starts-with(., 'disassy') or starts-with(., 'fault')]) and not(ancestor::book[contains(@doctype,'oh')] and ancestor::ata-page-block/@pb-name[starts-with(., 'clean')]) and not(ancestor::book[contains(@doctype,'oh')] and ancestor::page-block/@pb-name[starts-with(., 'clean')]) and not(ancestor::ata-page-block/@pb-name[starts-with(., 'mainprac')]) and not(ancestor::page-block/@pb-name[starts-with(., 'mainprac')]) and not(ancestor::book[contains(@doctype,'oh')] and ancestor::ata-page-block/@pb-name[starts-with(., 'inspect')]) and not(ancestor::book[contains(@doctype,'oh')] and ancestor::page-block/@pb-name[starts-with(., 'inspect')]) and not(ancestor::ata-page-block/@pb-name[(starts-with(., 'di') and 'di' = translate(., '0123456789', '') and string-length(.) &gt; 2) or starts-with(.,'service')]) and not(ancestor::page-block/@pb-name[(starts-with(., 'di') and 'di' = translate(., '0123456789', '') and string-length(.) &gt; 2) or starts-with(.,'service')]) and not(ancestor::book[contains(@doctype,'oh')] and ancestor::ata-page-block/@pb-name[starts-with(., 'repair')]) and not(ancestor::book[contains(@doctype,'oh')] and ancestor::page-block/@pb-name[starts-with(., 'repair')]) and not(ancestor::book[contains(@doctype,'oh')] and ancestor::ata-page-block/@pb-name[starts-with(., 'test')]) and not(ancestor::book[contains(@doctype,'oh')] and ancestor::page-block/@pb-name[starts-with(., 'test')]) and not(ancestor::ata-page-block/@pb-name[(starts-with(., 'cl') and 'cl' = translate(., '0123456789', '') and string-length(.) &gt; 2) or .='install' or starts-with(.,'rem-inst') or (starts-with(., 'reminst') and 'reminst' = translate(., '0123456789', '') and string-length(.) &gt; 7) or .='remove' or (starts-with(., 'repair') and 'repair' = translate(., '0123456789', '') and string-length(.) &gt; 6)]) and not(ancestor::page-block/@pb-name[(starts-with(., 'cl') and 'cl' = translate(., '0123456789', '') and string-length(.) &gt; 2) or .='install' or starts-with(.,'rem-inst') or (starts-with(., 'reminst') and 'reminst' = translate(., '0123456789', '') and string-length(.) &gt; 7) or .='remove' or (starts-with(., 'repair') and 'repair' = translate(., '0123456789', '') and string-length(.) &gt; 6)]) and not(ancestor::ata-page-block/@pb-name[starts-with(., 'assy') or (starts-with(., 'ic') and 'ic' = translate(., '0123456789', '') and string-length(.) &gt; 2) or (starts-with(., 'te') and 'te' = translate(., '0123456789', '') and string-length(.) &gt; 2) or .='test']) and not(ancestor::page-block/@pb-name[starts-with(., 'assy') or (starts-with(., 'ic') and 'ic' = translate(., '0123456789', '') and string-length(.) &gt; 2) or (starts-with(., 'te') and 'te' = translate(., '0123456789', '') and string-length(.) &gt; 2) or .='test']) and (ancestor::ata-page-block/@pb-name[.='f-and-c' or starts-with(., 'inspect') or (starts-with(., 're') and 're' = translate(., '0123456789', '') and string-length(.) &gt; 2)])">
            <!-- Condition #27-->
            <xsl:if test="not(@_gte:Gentext-Expanded)">
               <_sfe:BeforeOrAfterText>Figure <_gte:styler_numbering>
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
         </xsl:when>
         <xsl:when test="not(ancestor::book[contains(@doctype,'oh')] and ancestor::ata-page-block/@pb-name[.='service']) and not(ancestor::book[contains(@doctype,'oh')] and ancestor::page-block/@pb-name[.='service']) and not(ancestor::ata-page-block/@pb-name[.='00awl' or .='00intro' or .='airlim' or .='awl' or .='awlror' or .='chapsect' or .='consume' or .='d-and-o' or .='frontmatte' or .='howtouse' or .='00howtouse' or .='intro' or .='nut_option' or .='oplimits' or .='sblist' or .='schedchk' or .='spectool' or .='timelim' or .='title-page']) and not(ancestor::page-block/@pb-name[.='00awl' or .='00intro' or .='airlim' or .='awl' or .='awlror' or .='chapsect' or .='consume' or .='d-and-o' or .='frontmatte' or .='howtouse' or .='00howtouse' or .='intro' or .='nut_option' or .='oplimits' or .='sblist' or .='schedchk' or .='spectool' or .='timelim' or .='title-page']) and not(ancestor::ata-page-block/@pb-name[(starts-with(., 'do') and 'do' = translate(., '0123456789', '') and string-length(.) &gt; 2) or (starts-with(., 'in') and 'in' = translate(., '0123456789', '') and string-length(.) &gt; 2) or (starts-with(., 'tl') and 'tl' = translate(., '0123456789', '') and string-length(.) &gt; 2) or .='toolsht' or .='trlist' or .='unschedc' or .='unschedchk']) and not(ancestor::page-block/@pb-name[(starts-with(., 'do') and 'do' = translate(., '0123456789', '') and string-length(.) &gt; 2) or (starts-with(., 'in') and 'in' = translate(., '0123456789', '') and string-length(.) &gt; 2) or (starts-with(., 'tl') and 'tl' = translate(., '0123456789', '') and string-length(.) &gt; 2) or .='toolsht' or .='trlist' or .='unschedc' or .='unschedchk']) and not(ancestor-or-self::ata-page-block[1]/@pb-name and string(ancestor-or-self::ata-page-block[1]/@pb-name)='intro00') and not(ancestor-or-self::page-block[1]/@pb-name and string(ancestor-or-self::page-block[1]/@pb-name)='intro00') and not(ancestor::ata-page-block/@pb-name[starts-with(., 'disassy') or starts-with(., 'fault')]) and not(ancestor::page-block/@pb-name[starts-with(., 'disassy') or starts-with(., 'fault')]) and not(ancestor::book[contains(@doctype,'oh')] and ancestor::ata-page-block/@pb-name[starts-with(., 'clean')]) and not(ancestor::book[contains(@doctype,'oh')] and ancestor::page-block/@pb-name[starts-with(., 'clean')]) and not(ancestor::ata-page-block/@pb-name[starts-with(., 'mainprac')]) and not(ancestor::page-block/@pb-name[starts-with(., 'mainprac')]) and not(ancestor::book[contains(@doctype,'oh')] and ancestor::ata-page-block/@pb-name[starts-with(., 'inspect')]) and not(ancestor::book[contains(@doctype,'oh')] and ancestor::page-block/@pb-name[starts-with(., 'inspect')]) and not(ancestor::ata-page-block/@pb-name[(starts-with(., 'di') and 'di' = translate(., '0123456789', '') and string-length(.) &gt; 2) or starts-with(.,'service')]) and not(ancestor::page-block/@pb-name[(starts-with(., 'di') and 'di' = translate(., '0123456789', '') and string-length(.) &gt; 2) or starts-with(.,'service')]) and not(ancestor::book[contains(@doctype,'oh')] and ancestor::ata-page-block/@pb-name[starts-with(., 'repair')]) and not(ancestor::book[contains(@doctype,'oh')] and ancestor::page-block/@pb-name[starts-with(., 'repair')]) and not(ancestor::book[contains(@doctype,'oh')] and ancestor::ata-page-block/@pb-name[starts-with(., 'test')]) and not(ancestor::book[contains(@doctype,'oh')] and ancestor::page-block/@pb-name[starts-with(., 'test')]) and not(ancestor::ata-page-block/@pb-name[(starts-with(., 'cl') and 'cl' = translate(., '0123456789', '') and string-length(.) &gt; 2) or .='install' or starts-with(.,'rem-inst') or (starts-with(., 'reminst') and 'reminst' = translate(., '0123456789', '') and string-length(.) &gt; 7) or .='remove' or (starts-with(., 'repair') and 'repair' = translate(., '0123456789', '') and string-length(.) &gt; 6)]) and not(ancestor::page-block/@pb-name[(starts-with(., 'cl') and 'cl' = translate(., '0123456789', '') and string-length(.) &gt; 2) or .='install' or starts-with(.,'rem-inst') or (starts-with(., 'reminst') and 'reminst' = translate(., '0123456789', '') and string-length(.) &gt; 7) or .='remove' or (starts-with(., 'repair') and 'repair' = translate(., '0123456789', '') and string-length(.) &gt; 6)]) and not(ancestor::ata-page-block/@pb-name[starts-with(., 'assy') or (starts-with(., 'ic') and 'ic' = translate(., '0123456789', '') and string-length(.) &gt; 2) or (starts-with(., 'te') and 'te' = translate(., '0123456789', '') and string-length(.) &gt; 2) or .='test']) and (ancestor::page-block/@pb-name[starts-with(., 'assy') or (starts-with(., 'ic') and 'ic' = translate(., '0123456789', '') and string-length(.) &gt; 2) or (starts-with(., 'te') and 'te' = translate(., '0123456789', '') and string-length(.) &gt; 2) or .='test'])">
            <!-- Condition #26-->
            <xsl:if test="not(@_gte:Gentext-Expanded)">
               <_sfe:BeforeOrAfterText>Figure <_gte:styler_numbering>
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
         </xsl:when>
         <xsl:when test="not(ancestor::book[contains(@doctype,'oh')] and ancestor::ata-page-block/@pb-name[.='service']) and not(ancestor::book[contains(@doctype,'oh')] and ancestor::page-block/@pb-name[.='service']) and not(ancestor::ata-page-block/@pb-name[.='00awl' or .='00intro' or .='airlim' or .='awl' or .='awlror' or .='chapsect' or .='consume' or .='d-and-o' or .='frontmatte' or .='howtouse' or .='00howtouse' or .='intro' or .='nut_option' or .='oplimits' or .='sblist' or .='schedchk' or .='spectool' or .='timelim' or .='title-page']) and not(ancestor::page-block/@pb-name[.='00awl' or .='00intro' or .='airlim' or .='awl' or .='awlror' or .='chapsect' or .='consume' or .='d-and-o' or .='frontmatte' or .='howtouse' or .='00howtouse' or .='intro' or .='nut_option' or .='oplimits' or .='sblist' or .='schedchk' or .='spectool' or .='timelim' or .='title-page']) and not(ancestor::ata-page-block/@pb-name[(starts-with(., 'do') and 'do' = translate(., '0123456789', '') and string-length(.) &gt; 2) or (starts-with(., 'in') and 'in' = translate(., '0123456789', '') and string-length(.) &gt; 2) or (starts-with(., 'tl') and 'tl' = translate(., '0123456789', '') and string-length(.) &gt; 2) or .='toolsht' or .='trlist' or .='unschedc' or .='unschedchk']) and not(ancestor::page-block/@pb-name[(starts-with(., 'do') and 'do' = translate(., '0123456789', '') and string-length(.) &gt; 2) or (starts-with(., 'in') and 'in' = translate(., '0123456789', '') and string-length(.) &gt; 2) or (starts-with(., 'tl') and 'tl' = translate(., '0123456789', '') and string-length(.) &gt; 2) or .='toolsht' or .='trlist' or .='unschedc' or .='unschedchk']) and not(ancestor-or-self::ata-page-block[1]/@pb-name and string(ancestor-or-self::ata-page-block[1]/@pb-name)='intro00') and not(ancestor-or-self::page-block[1]/@pb-name and string(ancestor-or-self::page-block[1]/@pb-name)='intro00') and not(ancestor::ata-page-block/@pb-name[starts-with(., 'disassy') or starts-with(., 'fault')]) and not(ancestor::page-block/@pb-name[starts-with(., 'disassy') or starts-with(., 'fault')]) and not(ancestor::book[contains(@doctype,'oh')] and ancestor::ata-page-block/@pb-name[starts-with(., 'clean')]) and not(ancestor::book[contains(@doctype,'oh')] and ancestor::page-block/@pb-name[starts-with(., 'clean')]) and not(ancestor::ata-page-block/@pb-name[starts-with(., 'mainprac')]) and not(ancestor::page-block/@pb-name[starts-with(., 'mainprac')]) and not(ancestor::book[contains(@doctype,'oh')] and ancestor::ata-page-block/@pb-name[starts-with(., 'inspect')]) and not(ancestor::book[contains(@doctype,'oh')] and ancestor::page-block/@pb-name[starts-with(., 'inspect')]) and not(ancestor::ata-page-block/@pb-name[(starts-with(., 'di') and 'di' = translate(., '0123456789', '') and string-length(.) &gt; 2) or starts-with(.,'service')]) and not(ancestor::page-block/@pb-name[(starts-with(., 'di') and 'di' = translate(., '0123456789', '') and string-length(.) &gt; 2) or starts-with(.,'service')]) and not(ancestor::book[contains(@doctype,'oh')] and ancestor::ata-page-block/@pb-name[starts-with(., 'repair')]) and not(ancestor::book[contains(@doctype,'oh')] and ancestor::page-block/@pb-name[starts-with(., 'repair')]) and not(ancestor::book[contains(@doctype,'oh')] and ancestor::ata-page-block/@pb-name[starts-with(., 'test')]) and not(ancestor::book[contains(@doctype,'oh')] and ancestor::page-block/@pb-name[starts-with(., 'test')]) and not(ancestor::ata-page-block/@pb-name[(starts-with(., 'cl') and 'cl' = translate(., '0123456789', '') and string-length(.) &gt; 2) or .='install' or starts-with(.,'rem-inst') or (starts-with(., 'reminst') and 'reminst' = translate(., '0123456789', '') and string-length(.) &gt; 7) or .='remove' or (starts-with(., 'repair') and 'repair' = translate(., '0123456789', '') and string-length(.) &gt; 6)]) and not(ancestor::page-block/@pb-name[(starts-with(., 'cl') and 'cl' = translate(., '0123456789', '') and string-length(.) &gt; 2) or .='install' or starts-with(.,'rem-inst') or (starts-with(., 'reminst') and 'reminst' = translate(., '0123456789', '') and string-length(.) &gt; 7) or .='remove' or (starts-with(., 'repair') and 'repair' = translate(., '0123456789', '') and string-length(.) &gt; 6)]) and (ancestor::ata-page-block/@pb-name[starts-with(., 'assy') or (starts-with(., 'ic') and 'ic' = translate(., '0123456789', '') and string-length(.) &gt; 2) or (starts-with(., 'te') and 'te' = translate(., '0123456789', '') and string-length(.) &gt; 2) or .='test'])">
            <!-- Condition #25-->
            <xsl:if test="not(@_gte:Gentext-Expanded)">
               <_sfe:BeforeOrAfterText>Figure <_gte:styler_numbering>
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
         </xsl:when>
         <xsl:when test="not(ancestor::book[contains(@doctype,'oh')] and ancestor::ata-page-block/@pb-name[.='service']) and not(ancestor::book[contains(@doctype,'oh')] and ancestor::page-block/@pb-name[.='service']) and not(ancestor::ata-page-block/@pb-name[.='00awl' or .='00intro' or .='airlim' or .='awl' or .='awlror' or .='chapsect' or .='consume' or .='d-and-o' or .='frontmatte' or .='howtouse' or .='00howtouse' or .='intro' or .='nut_option' or .='oplimits' or .='sblist' or .='schedchk' or .='spectool' or .='timelim' or .='title-page']) and not(ancestor::page-block/@pb-name[.='00awl' or .='00intro' or .='airlim' or .='awl' or .='awlror' or .='chapsect' or .='consume' or .='d-and-o' or .='frontmatte' or .='howtouse' or .='00howtouse' or .='intro' or .='nut_option' or .='oplimits' or .='sblist' or .='schedchk' or .='spectool' or .='timelim' or .='title-page']) and not(ancestor::ata-page-block/@pb-name[(starts-with(., 'do') and 'do' = translate(., '0123456789', '') and string-length(.) &gt; 2) or (starts-with(., 'in') and 'in' = translate(., '0123456789', '') and string-length(.) &gt; 2) or (starts-with(., 'tl') and 'tl' = translate(., '0123456789', '') and string-length(.) &gt; 2) or .='toolsht' or .='trlist' or .='unschedc' or .='unschedchk']) and not(ancestor::page-block/@pb-name[(starts-with(., 'do') and 'do' = translate(., '0123456789', '') and string-length(.) &gt; 2) or (starts-with(., 'in') and 'in' = translate(., '0123456789', '') and string-length(.) &gt; 2) or (starts-with(., 'tl') and 'tl' = translate(., '0123456789', '') and string-length(.) &gt; 2) or .='toolsht' or .='trlist' or .='unschedc' or .='unschedchk']) and not(ancestor-or-self::ata-page-block[1]/@pb-name and string(ancestor-or-self::ata-page-block[1]/@pb-name)='intro00') and not(ancestor-or-self::page-block[1]/@pb-name and string(ancestor-or-self::page-block[1]/@pb-name)='intro00') and not(ancestor::ata-page-block/@pb-name[starts-with(., 'disassy') or starts-with(., 'fault')]) and not(ancestor::page-block/@pb-name[starts-with(., 'disassy') or starts-with(., 'fault')]) and not(ancestor::book[contains(@doctype,'oh')] and ancestor::ata-page-block/@pb-name[starts-with(., 'clean')]) and not(ancestor::book[contains(@doctype,'oh')] and ancestor::page-block/@pb-name[starts-with(., 'clean')]) and not(ancestor::ata-page-block/@pb-name[starts-with(., 'mainprac')]) and not(ancestor::page-block/@pb-name[starts-with(., 'mainprac')]) and not(ancestor::book[contains(@doctype,'oh')] and ancestor::ata-page-block/@pb-name[starts-with(., 'inspect')]) and not(ancestor::book[contains(@doctype,'oh')] and ancestor::page-block/@pb-name[starts-with(., 'inspect')]) and not(ancestor::ata-page-block/@pb-name[(starts-with(., 'di') and 'di' = translate(., '0123456789', '') and string-length(.) &gt; 2) or starts-with(.,'service')]) and not(ancestor::page-block/@pb-name[(starts-with(., 'di') and 'di' = translate(., '0123456789', '') and string-length(.) &gt; 2) or starts-with(.,'service')]) and not(ancestor::book[contains(@doctype,'oh')] and ancestor::ata-page-block/@pb-name[starts-with(., 'repair')]) and not(ancestor::book[contains(@doctype,'oh')] and ancestor::page-block/@pb-name[starts-with(., 'repair')]) and not(ancestor::book[contains(@doctype,'oh')] and ancestor::ata-page-block/@pb-name[starts-with(., 'test')]) and not(ancestor::book[contains(@doctype,'oh')] and ancestor::page-block/@pb-name[starts-with(., 'test')]) and not(ancestor::ata-page-block/@pb-name[(starts-with(., 'cl') and 'cl' = translate(., '0123456789', '') and string-length(.) &gt; 2) or .='install' or starts-with(.,'rem-inst') or (starts-with(., 'reminst') and 'reminst' = translate(., '0123456789', '') and string-length(.) &gt; 7) or .='remove' or (starts-with(., 'repair') and 'repair' = translate(., '0123456789', '') and string-length(.) &gt; 6)]) and (ancestor::page-block/@pb-name[(starts-with(., 'cl') and 'cl' = translate(., '0123456789', '') and string-length(.) &gt; 2) or .='install' or starts-with(.,'rem-inst') or (starts-with(., 'reminst') and 'reminst' = translate(., '0123456789', '') and string-length(.) &gt; 7) or .='remove' or (starts-with(., 'repair') and 'repair' = translate(., '0123456789', '') and string-length(.) &gt; 6)])">
            <!-- Condition #24-->
            <xsl:if test="not(@_gte:Gentext-Expanded)">
               <_sfe:BeforeOrAfterText>Figure <_gte:styler_numbering>
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
         </xsl:when>
         <xsl:when test="not(ancestor::book[contains(@doctype,'oh')] and ancestor::ata-page-block/@pb-name[.='service']) and not(ancestor::book[contains(@doctype,'oh')] and ancestor::page-block/@pb-name[.='service']) and not(ancestor::ata-page-block/@pb-name[.='00awl' or .='00intro' or .='airlim' or .='awl' or .='awlror' or .='chapsect' or .='consume' or .='d-and-o' or .='frontmatte' or .='howtouse' or .='00howtouse' or .='intro' or .='nut_option' or .='oplimits' or .='sblist' or .='schedchk' or .='spectool' or .='timelim' or .='title-page']) and not(ancestor::page-block/@pb-name[.='00awl' or .='00intro' or .='airlim' or .='awl' or .='awlror' or .='chapsect' or .='consume' or .='d-and-o' or .='frontmatte' or .='howtouse' or .='00howtouse' or .='intro' or .='nut_option' or .='oplimits' or .='sblist' or .='schedchk' or .='spectool' or .='timelim' or .='title-page']) and not(ancestor::ata-page-block/@pb-name[(starts-with(., 'do') and 'do' = translate(., '0123456789', '') and string-length(.) &gt; 2) or (starts-with(., 'in') and 'in' = translate(., '0123456789', '') and string-length(.) &gt; 2) or (starts-with(., 'tl') and 'tl' = translate(., '0123456789', '') and string-length(.) &gt; 2) or .='toolsht' or .='trlist' or .='unschedc' or .='unschedchk']) and not(ancestor::page-block/@pb-name[(starts-with(., 'do') and 'do' = translate(., '0123456789', '') and string-length(.) &gt; 2) or (starts-with(., 'in') and 'in' = translate(., '0123456789', '') and string-length(.) &gt; 2) or (starts-with(., 'tl') and 'tl' = translate(., '0123456789', '') and string-length(.) &gt; 2) or .='toolsht' or .='trlist' or .='unschedc' or .='unschedchk']) and not(ancestor-or-self::ata-page-block[1]/@pb-name and string(ancestor-or-self::ata-page-block[1]/@pb-name)='intro00') and not(ancestor-or-self::page-block[1]/@pb-name and string(ancestor-or-self::page-block[1]/@pb-name)='intro00') and not(ancestor::ata-page-block/@pb-name[starts-with(., 'disassy') or starts-with(., 'fault')]) and not(ancestor::page-block/@pb-name[starts-with(., 'disassy') or starts-with(., 'fault')]) and not(ancestor::book[contains(@doctype,'oh')] and ancestor::ata-page-block/@pb-name[starts-with(., 'clean')]) and not(ancestor::book[contains(@doctype,'oh')] and ancestor::page-block/@pb-name[starts-with(., 'clean')]) and not(ancestor::ata-page-block/@pb-name[starts-with(., 'mainprac')]) and not(ancestor::page-block/@pb-name[starts-with(., 'mainprac')]) and not(ancestor::book[contains(@doctype,'oh')] and ancestor::ata-page-block/@pb-name[starts-with(., 'inspect')]) and not(ancestor::book[contains(@doctype,'oh')] and ancestor::page-block/@pb-name[starts-with(., 'inspect')]) and not(ancestor::ata-page-block/@pb-name[(starts-with(., 'di') and 'di' = translate(., '0123456789', '') and string-length(.) &gt; 2) or starts-with(.,'service')]) and not(ancestor::page-block/@pb-name[(starts-with(., 'di') and 'di' = translate(., '0123456789', '') and string-length(.) &gt; 2) or starts-with(.,'service')]) and not(ancestor::book[contains(@doctype,'oh')] and ancestor::ata-page-block/@pb-name[starts-with(., 'repair')]) and not(ancestor::book[contains(@doctype,'oh')] and ancestor::page-block/@pb-name[starts-with(., 'repair')]) and not(ancestor::book[contains(@doctype,'oh')] and ancestor::ata-page-block/@pb-name[starts-with(., 'test')]) and not(ancestor::book[contains(@doctype,'oh')] and ancestor::page-block/@pb-name[starts-with(., 'test')]) and (ancestor::ata-page-block/@pb-name[(starts-with(., 'cl') and 'cl' = translate(., '0123456789', '') and string-length(.) &gt; 2) or .='install' or starts-with(.,'rem-inst') or (starts-with(., 'reminst') and 'reminst' = translate(., '0123456789', '') and string-length(.) &gt; 7) or .='remove' or (starts-with(., 'repair') and 'repair' = translate(., '0123456789', '') and string-length(.) &gt; 6)])">
            <!-- Condition #23-->
            <xsl:if test="not(@_gte:Gentext-Expanded)">
               <_sfe:BeforeOrAfterText>Figure <_gte:styler_numbering>
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
         </xsl:when>
         <xsl:when test="not(ancestor::book[contains(@doctype,'oh')] and ancestor::ata-page-block/@pb-name[.='service']) and not(ancestor::book[contains(@doctype,'oh')] and ancestor::page-block/@pb-name[.='service']) and not(ancestor::ata-page-block/@pb-name[.='00awl' or .='00intro' or .='airlim' or .='awl' or .='awlror' or .='chapsect' or .='consume' or .='d-and-o' or .='frontmatte' or .='howtouse' or .='00howtouse' or .='intro' or .='nut_option' or .='oplimits' or .='sblist' or .='schedchk' or .='spectool' or .='timelim' or .='title-page']) and not(ancestor::page-block/@pb-name[.='00awl' or .='00intro' or .='airlim' or .='awl' or .='awlror' or .='chapsect' or .='consume' or .='d-and-o' or .='frontmatte' or .='howtouse' or .='00howtouse' or .='intro' or .='nut_option' or .='oplimits' or .='sblist' or .='schedchk' or .='spectool' or .='timelim' or .='title-page']) and not(ancestor::ata-page-block/@pb-name[(starts-with(., 'do') and 'do' = translate(., '0123456789', '') and string-length(.) &gt; 2) or (starts-with(., 'in') and 'in' = translate(., '0123456789', '') and string-length(.) &gt; 2) or (starts-with(., 'tl') and 'tl' = translate(., '0123456789', '') and string-length(.) &gt; 2) or .='toolsht' or .='trlist' or .='unschedc' or .='unschedchk']) and not(ancestor::page-block/@pb-name[(starts-with(., 'do') and 'do' = translate(., '0123456789', '') and string-length(.) &gt; 2) or (starts-with(., 'in') and 'in' = translate(., '0123456789', '') and string-length(.) &gt; 2) or (starts-with(., 'tl') and 'tl' = translate(., '0123456789', '') and string-length(.) &gt; 2) or .='toolsht' or .='trlist' or .='unschedc' or .='unschedchk']) and not(ancestor-or-self::ata-page-block[1]/@pb-name and string(ancestor-or-self::ata-page-block[1]/@pb-name)='intro00') and not(ancestor-or-self::page-block[1]/@pb-name and string(ancestor-or-self::page-block[1]/@pb-name)='intro00') and not(ancestor::ata-page-block/@pb-name[starts-with(., 'disassy') or starts-with(., 'fault')]) and not(ancestor::page-block/@pb-name[starts-with(., 'disassy') or starts-with(., 'fault')]) and not(ancestor::book[contains(@doctype,'oh')] and ancestor::ata-page-block/@pb-name[starts-with(., 'clean')]) and not(ancestor::book[contains(@doctype,'oh')] and ancestor::page-block/@pb-name[starts-with(., 'clean')]) and not(ancestor::ata-page-block/@pb-name[starts-with(., 'mainprac')]) and not(ancestor::page-block/@pb-name[starts-with(., 'mainprac')]) and not(ancestor::book[contains(@doctype,'oh')] and ancestor::ata-page-block/@pb-name[starts-with(., 'inspect')]) and not(ancestor::book[contains(@doctype,'oh')] and ancestor::page-block/@pb-name[starts-with(., 'inspect')]) and not(ancestor::ata-page-block/@pb-name[(starts-with(., 'di') and 'di' = translate(., '0123456789', '') and string-length(.) &gt; 2) or starts-with(.,'service')]) and not(ancestor::page-block/@pb-name[(starts-with(., 'di') and 'di' = translate(., '0123456789', '') and string-length(.) &gt; 2) or starts-with(.,'service')]) and not(ancestor::book[contains(@doctype,'oh')] and ancestor::ata-page-block/@pb-name[starts-with(., 'repair')]) and not(ancestor::book[contains(@doctype,'oh')] and ancestor::page-block/@pb-name[starts-with(., 'repair')]) and not(ancestor::book[contains(@doctype,'oh')] and ancestor::ata-page-block/@pb-name[starts-with(., 'test')]) and (ancestor::book[contains(@doctype,'oh')] and ancestor::page-block/@pb-name[starts-with(., 'test')])">
            <!-- Condition #22-->
            <xsl:if test="not(@_gte:Gentext-Expanded)">
               <_sfe:BeforeOrAfterText>Figure <_gte:styler_numbering>
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
         </xsl:when>
         <xsl:when test="not(ancestor::book[contains(@doctype,'oh')] and ancestor::ata-page-block/@pb-name[.='service']) and not(ancestor::book[contains(@doctype,'oh')] and ancestor::page-block/@pb-name[.='service']) and not(ancestor::ata-page-block/@pb-name[.='00awl' or .='00intro' or .='airlim' or .='awl' or .='awlror' or .='chapsect' or .='consume' or .='d-and-o' or .='frontmatte' or .='howtouse' or .='00howtouse' or .='intro' or .='nut_option' or .='oplimits' or .='sblist' or .='schedchk' or .='spectool' or .='timelim' or .='title-page']) and not(ancestor::page-block/@pb-name[.='00awl' or .='00intro' or .='airlim' or .='awl' or .='awlror' or .='chapsect' or .='consume' or .='d-and-o' or .='frontmatte' or .='howtouse' or .='00howtouse' or .='intro' or .='nut_option' or .='oplimits' or .='sblist' or .='schedchk' or .='spectool' or .='timelim' or .='title-page']) and not(ancestor::ata-page-block/@pb-name[(starts-with(., 'do') and 'do' = translate(., '0123456789', '') and string-length(.) &gt; 2) or (starts-with(., 'in') and 'in' = translate(., '0123456789', '') and string-length(.) &gt; 2) or (starts-with(., 'tl') and 'tl' = translate(., '0123456789', '') and string-length(.) &gt; 2) or .='toolsht' or .='trlist' or .='unschedc' or .='unschedchk']) and not(ancestor::page-block/@pb-name[(starts-with(., 'do') and 'do' = translate(., '0123456789', '') and string-length(.) &gt; 2) or (starts-with(., 'in') and 'in' = translate(., '0123456789', '') and string-length(.) &gt; 2) or (starts-with(., 'tl') and 'tl' = translate(., '0123456789', '') and string-length(.) &gt; 2) or .='toolsht' or .='trlist' or .='unschedc' or .='unschedchk']) and not(ancestor-or-self::ata-page-block[1]/@pb-name and string(ancestor-or-self::ata-page-block[1]/@pb-name)='intro00') and not(ancestor-or-self::page-block[1]/@pb-name and string(ancestor-or-self::page-block[1]/@pb-name)='intro00') and not(ancestor::ata-page-block/@pb-name[starts-with(., 'disassy') or starts-with(., 'fault')]) and not(ancestor::page-block/@pb-name[starts-with(., 'disassy') or starts-with(., 'fault')]) and not(ancestor::book[contains(@doctype,'oh')] and ancestor::ata-page-block/@pb-name[starts-with(., 'clean')]) and not(ancestor::book[contains(@doctype,'oh')] and ancestor::page-block/@pb-name[starts-with(., 'clean')]) and not(ancestor::ata-page-block/@pb-name[starts-with(., 'mainprac')]) and not(ancestor::page-block/@pb-name[starts-with(., 'mainprac')]) and not(ancestor::book[contains(@doctype,'oh')] and ancestor::ata-page-block/@pb-name[starts-with(., 'inspect')]) and not(ancestor::book[contains(@doctype,'oh')] and ancestor::page-block/@pb-name[starts-with(., 'inspect')]) and not(ancestor::ata-page-block/@pb-name[(starts-with(., 'di') and 'di' = translate(., '0123456789', '') and string-length(.) &gt; 2) or starts-with(.,'service')]) and not(ancestor::page-block/@pb-name[(starts-with(., 'di') and 'di' = translate(., '0123456789', '') and string-length(.) &gt; 2) or starts-with(.,'service')]) and not(ancestor::book[contains(@doctype,'oh')] and ancestor::ata-page-block/@pb-name[starts-with(., 'repair')]) and not(ancestor::book[contains(@doctype,'oh')] and ancestor::page-block/@pb-name[starts-with(., 'repair')]) and (ancestor::book[contains(@doctype,'oh')] and ancestor::ata-page-block/@pb-name[starts-with(., 'test')])">
            <!-- Condition #21-->
            <xsl:if test="not(@_gte:Gentext-Expanded)">
               <_sfe:BeforeOrAfterText>Figure <_gte:styler_numbering>
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
         </xsl:when>
         <xsl:when test="not(ancestor::book[contains(@doctype,'oh')] and ancestor::ata-page-block/@pb-name[.='service']) and not(ancestor::book[contains(@doctype,'oh')] and ancestor::page-block/@pb-name[.='service']) and not(ancestor::ata-page-block/@pb-name[.='00awl' or .='00intro' or .='airlim' or .='awl' or .='awlror' or .='chapsect' or .='consume' or .='d-and-o' or .='frontmatte' or .='howtouse' or .='00howtouse' or .='intro' or .='nut_option' or .='oplimits' or .='sblist' or .='schedchk' or .='spectool' or .='timelim' or .='title-page']) and not(ancestor::page-block/@pb-name[.='00awl' or .='00intro' or .='airlim' or .='awl' or .='awlror' or .='chapsect' or .='consume' or .='d-and-o' or .='frontmatte' or .='howtouse' or .='00howtouse' or .='intro' or .='nut_option' or .='oplimits' or .='sblist' or .='schedchk' or .='spectool' or .='timelim' or .='title-page']) and not(ancestor::ata-page-block/@pb-name[(starts-with(., 'do') and 'do' = translate(., '0123456789', '') and string-length(.) &gt; 2) or (starts-with(., 'in') and 'in' = translate(., '0123456789', '') and string-length(.) &gt; 2) or (starts-with(., 'tl') and 'tl' = translate(., '0123456789', '') and string-length(.) &gt; 2) or .='toolsht' or .='trlist' or .='unschedc' or .='unschedchk']) and not(ancestor::page-block/@pb-name[(starts-with(., 'do') and 'do' = translate(., '0123456789', '') and string-length(.) &gt; 2) or (starts-with(., 'in') and 'in' = translate(., '0123456789', '') and string-length(.) &gt; 2) or (starts-with(., 'tl') and 'tl' = translate(., '0123456789', '') and string-length(.) &gt; 2) or .='toolsht' or .='trlist' or .='unschedc' or .='unschedchk']) and not(ancestor-or-self::ata-page-block[1]/@pb-name and string(ancestor-or-self::ata-page-block[1]/@pb-name)='intro00') and not(ancestor-or-self::page-block[1]/@pb-name and string(ancestor-or-self::page-block[1]/@pb-name)='intro00') and not(ancestor::ata-page-block/@pb-name[starts-with(., 'disassy') or starts-with(., 'fault')]) and not(ancestor::page-block/@pb-name[starts-with(., 'disassy') or starts-with(., 'fault')]) and not(ancestor::book[contains(@doctype,'oh')] and ancestor::ata-page-block/@pb-name[starts-with(., 'clean')]) and not(ancestor::book[contains(@doctype,'oh')] and ancestor::page-block/@pb-name[starts-with(., 'clean')]) and not(ancestor::ata-page-block/@pb-name[starts-with(., 'mainprac')]) and not(ancestor::page-block/@pb-name[starts-with(., 'mainprac')]) and not(ancestor::book[contains(@doctype,'oh')] and ancestor::ata-page-block/@pb-name[starts-with(., 'inspect')]) and not(ancestor::book[contains(@doctype,'oh')] and ancestor::page-block/@pb-name[starts-with(., 'inspect')]) and not(ancestor::ata-page-block/@pb-name[(starts-with(., 'di') and 'di' = translate(., '0123456789', '') and string-length(.) &gt; 2) or starts-with(.,'service')]) and not(ancestor::page-block/@pb-name[(starts-with(., 'di') and 'di' = translate(., '0123456789', '') and string-length(.) &gt; 2) or starts-with(.,'service')]) and not(ancestor::book[contains(@doctype,'oh')] and ancestor::ata-page-block/@pb-name[starts-with(., 'repair')]) and (ancestor::book[contains(@doctype,'oh')] and ancestor::page-block/@pb-name[starts-with(., 'repair')])">
            <!-- Condition #20-->
            <xsl:if test="not(@_gte:Gentext-Expanded)">
               <_sfe:BeforeOrAfterText>Figure <_gte:styler_numbering>
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
         </xsl:when>
         <xsl:when test="not(ancestor::book[contains(@doctype,'oh')] and ancestor::ata-page-block/@pb-name[.='service']) and not(ancestor::book[contains(@doctype,'oh')] and ancestor::page-block/@pb-name[.='service']) and not(ancestor::ata-page-block/@pb-name[.='00awl' or .='00intro' or .='airlim' or .='awl' or .='awlror' or .='chapsect' or .='consume' or .='d-and-o' or .='frontmatte' or .='howtouse' or .='00howtouse' or .='intro' or .='nut_option' or .='oplimits' or .='sblist' or .='schedchk' or .='spectool' or .='timelim' or .='title-page']) and not(ancestor::page-block/@pb-name[.='00awl' or .='00intro' or .='airlim' or .='awl' or .='awlror' or .='chapsect' or .='consume' or .='d-and-o' or .='frontmatte' or .='howtouse' or .='00howtouse' or .='intro' or .='nut_option' or .='oplimits' or .='sblist' or .='schedchk' or .='spectool' or .='timelim' or .='title-page']) and not(ancestor::ata-page-block/@pb-name[(starts-with(., 'do') and 'do' = translate(., '0123456789', '') and string-length(.) &gt; 2) or (starts-with(., 'in') and 'in' = translate(., '0123456789', '') and string-length(.) &gt; 2) or (starts-with(., 'tl') and 'tl' = translate(., '0123456789', '') and string-length(.) &gt; 2) or .='toolsht' or .='trlist' or .='unschedc' or .='unschedchk']) and not(ancestor::page-block/@pb-name[(starts-with(., 'do') and 'do' = translate(., '0123456789', '') and string-length(.) &gt; 2) or (starts-with(., 'in') and 'in' = translate(., '0123456789', '') and string-length(.) &gt; 2) or (starts-with(., 'tl') and 'tl' = translate(., '0123456789', '') and string-length(.) &gt; 2) or .='toolsht' or .='trlist' or .='unschedc' or .='unschedchk']) and not(ancestor-or-self::ata-page-block[1]/@pb-name and string(ancestor-or-self::ata-page-block[1]/@pb-name)='intro00') and not(ancestor-or-self::page-block[1]/@pb-name and string(ancestor-or-self::page-block[1]/@pb-name)='intro00') and not(ancestor::ata-page-block/@pb-name[starts-with(., 'disassy') or starts-with(., 'fault')]) and not(ancestor::page-block/@pb-name[starts-with(., 'disassy') or starts-with(., 'fault')]) and not(ancestor::book[contains(@doctype,'oh')] and ancestor::ata-page-block/@pb-name[starts-with(., 'clean')]) and not(ancestor::book[contains(@doctype,'oh')] and ancestor::page-block/@pb-name[starts-with(., 'clean')]) and not(ancestor::ata-page-block/@pb-name[starts-with(., 'mainprac')]) and not(ancestor::page-block/@pb-name[starts-with(., 'mainprac')]) and not(ancestor::book[contains(@doctype,'oh')] and ancestor::ata-page-block/@pb-name[starts-with(., 'inspect')]) and not(ancestor::book[contains(@doctype,'oh')] and ancestor::page-block/@pb-name[starts-with(., 'inspect')]) and not(ancestor::ata-page-block/@pb-name[(starts-with(., 'di') and 'di' = translate(., '0123456789', '') and string-length(.) &gt; 2) or starts-with(.,'service')]) and not(ancestor::page-block/@pb-name[(starts-with(., 'di') and 'di' = translate(., '0123456789', '') and string-length(.) &gt; 2) or starts-with(.,'service')]) and (ancestor::book[contains(@doctype,'oh')] and ancestor::ata-page-block/@pb-name[starts-with(., 'repair')])">
            <!-- Condition #19-->
            <xsl:if test="not(@_gte:Gentext-Expanded)">
               <_sfe:BeforeOrAfterText>Figure <_gte:styler_numbering>
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
         </xsl:when>
         <xsl:when test="not(ancestor::book[contains(@doctype,'oh')] and ancestor::ata-page-block/@pb-name[.='service']) and not(ancestor::book[contains(@doctype,'oh')] and ancestor::page-block/@pb-name[.='service']) and not(ancestor::ata-page-block/@pb-name[.='00awl' or .='00intro' or .='airlim' or .='awl' or .='awlror' or .='chapsect' or .='consume' or .='d-and-o' or .='frontmatte' or .='howtouse' or .='00howtouse' or .='intro' or .='nut_option' or .='oplimits' or .='sblist' or .='schedchk' or .='spectool' or .='timelim' or .='title-page']) and not(ancestor::page-block/@pb-name[.='00awl' or .='00intro' or .='airlim' or .='awl' or .='awlror' or .='chapsect' or .='consume' or .='d-and-o' or .='frontmatte' or .='howtouse' or .='00howtouse' or .='intro' or .='nut_option' or .='oplimits' or .='sblist' or .='schedchk' or .='spectool' or .='timelim' or .='title-page']) and not(ancestor::ata-page-block/@pb-name[(starts-with(., 'do') and 'do' = translate(., '0123456789', '') and string-length(.) &gt; 2) or (starts-with(., 'in') and 'in' = translate(., '0123456789', '') and string-length(.) &gt; 2) or (starts-with(., 'tl') and 'tl' = translate(., '0123456789', '') and string-length(.) &gt; 2) or .='toolsht' or .='trlist' or .='unschedc' or .='unschedchk']) and not(ancestor::page-block/@pb-name[(starts-with(., 'do') and 'do' = translate(., '0123456789', '') and string-length(.) &gt; 2) or (starts-with(., 'in') and 'in' = translate(., '0123456789', '') and string-length(.) &gt; 2) or (starts-with(., 'tl') and 'tl' = translate(., '0123456789', '') and string-length(.) &gt; 2) or .='toolsht' or .='trlist' or .='unschedc' or .='unschedchk']) and not(ancestor-or-self::ata-page-block[1]/@pb-name and string(ancestor-or-self::ata-page-block[1]/@pb-name)='intro00') and not(ancestor-or-self::page-block[1]/@pb-name and string(ancestor-or-self::page-block[1]/@pb-name)='intro00') and not(ancestor::ata-page-block/@pb-name[starts-with(., 'disassy') or starts-with(., 'fault')]) and not(ancestor::page-block/@pb-name[starts-with(., 'disassy') or starts-with(., 'fault')]) and not(ancestor::book[contains(@doctype,'oh')] and ancestor::ata-page-block/@pb-name[starts-with(., 'clean')]) and not(ancestor::book[contains(@doctype,'oh')] and ancestor::page-block/@pb-name[starts-with(., 'clean')]) and not(ancestor::ata-page-block/@pb-name[starts-with(., 'mainprac')]) and not(ancestor::page-block/@pb-name[starts-with(., 'mainprac')]) and not(ancestor::book[contains(@doctype,'oh')] and ancestor::ata-page-block/@pb-name[starts-with(., 'inspect')]) and not(ancestor::book[contains(@doctype,'oh')] and ancestor::page-block/@pb-name[starts-with(., 'inspect')]) and not(ancestor::ata-page-block/@pb-name[(starts-with(., 'di') and 'di' = translate(., '0123456789', '') and string-length(.) &gt; 2) or starts-with(.,'service')]) and (ancestor::page-block/@pb-name[(starts-with(., 'di') and 'di' = translate(., '0123456789', '') and string-length(.) &gt; 2) or starts-with(.,'service')])">
            <!-- Condition #18-->
            <xsl:if test="not(@_gte:Gentext-Expanded)">
               <_sfe:BeforeOrAfterText>Figure <_gte:styler_numbering>
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
         </xsl:when>
         <xsl:when test="not(ancestor::book[contains(@doctype,'oh')] and ancestor::ata-page-block/@pb-name[.='service']) and not(ancestor::book[contains(@doctype,'oh')] and ancestor::page-block/@pb-name[.='service']) and not(ancestor::ata-page-block/@pb-name[.='00awl' or .='00intro' or .='airlim' or .='awl' or .='awlror' or .='chapsect' or .='consume' or .='d-and-o' or .='frontmatte' or .='howtouse' or .='00howtouse' or .='intro' or .='nut_option' or .='oplimits' or .='sblist' or .='schedchk' or .='spectool' or .='timelim' or .='title-page']) and not(ancestor::page-block/@pb-name[.='00awl' or .='00intro' or .='airlim' or .='awl' or .='awlror' or .='chapsect' or .='consume' or .='d-and-o' or .='frontmatte' or .='howtouse' or .='00howtouse' or .='intro' or .='nut_option' or .='oplimits' or .='sblist' or .='schedchk' or .='spectool' or .='timelim' or .='title-page']) and not(ancestor::ata-page-block/@pb-name[(starts-with(., 'do') and 'do' = translate(., '0123456789', '') and string-length(.) &gt; 2) or (starts-with(., 'in') and 'in' = translate(., '0123456789', '') and string-length(.) &gt; 2) or (starts-with(., 'tl') and 'tl' = translate(., '0123456789', '') and string-length(.) &gt; 2) or .='toolsht' or .='trlist' or .='unschedc' or .='unschedchk']) and not(ancestor::page-block/@pb-name[(starts-with(., 'do') and 'do' = translate(., '0123456789', '') and string-length(.) &gt; 2) or (starts-with(., 'in') and 'in' = translate(., '0123456789', '') and string-length(.) &gt; 2) or (starts-with(., 'tl') and 'tl' = translate(., '0123456789', '') and string-length(.) &gt; 2) or .='toolsht' or .='trlist' or .='unschedc' or .='unschedchk']) and not(ancestor-or-self::ata-page-block[1]/@pb-name and string(ancestor-or-self::ata-page-block[1]/@pb-name)='intro00') and not(ancestor-or-self::page-block[1]/@pb-name and string(ancestor-or-self::page-block[1]/@pb-name)='intro00') and not(ancestor::ata-page-block/@pb-name[starts-with(., 'disassy') or starts-with(., 'fault')]) and not(ancestor::page-block/@pb-name[starts-with(., 'disassy') or starts-with(., 'fault')]) and not(ancestor::book[contains(@doctype,'oh')] and ancestor::ata-page-block/@pb-name[starts-with(., 'clean')]) and not(ancestor::book[contains(@doctype,'oh')] and ancestor::page-block/@pb-name[starts-with(., 'clean')]) and not(ancestor::ata-page-block/@pb-name[starts-with(., 'mainprac')]) and not(ancestor::page-block/@pb-name[starts-with(., 'mainprac')]) and not(ancestor::book[contains(@doctype,'oh')] and ancestor::ata-page-block/@pb-name[starts-with(., 'inspect')]) and not(ancestor::book[contains(@doctype,'oh')] and ancestor::page-block/@pb-name[starts-with(., 'inspect')]) and (ancestor::ata-page-block/@pb-name[(starts-with(., 'di') and 'di' = translate(., '0123456789', '') and string-length(.) &gt; 2) or starts-with(.,'service')])">
            <!-- Condition #17-->
            <xsl:if test="not(@_gte:Gentext-Expanded)">
               <_sfe:BeforeOrAfterText>Figure <_gte:styler_numbering>
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
         </xsl:when>
         <xsl:when test="not(ancestor::book[contains(@doctype,'oh')] and ancestor::ata-page-block/@pb-name[.='service']) and not(ancestor::book[contains(@doctype,'oh')] and ancestor::page-block/@pb-name[.='service']) and not(ancestor::ata-page-block/@pb-name[.='00awl' or .='00intro' or .='airlim' or .='awl' or .='awlror' or .='chapsect' or .='consume' or .='d-and-o' or .='frontmatte' or .='howtouse' or .='00howtouse' or .='intro' or .='nut_option' or .='oplimits' or .='sblist' or .='schedchk' or .='spectool' or .='timelim' or .='title-page']) and not(ancestor::page-block/@pb-name[.='00awl' or .='00intro' or .='airlim' or .='awl' or .='awlror' or .='chapsect' or .='consume' or .='d-and-o' or .='frontmatte' or .='howtouse' or .='00howtouse' or .='intro' or .='nut_option' or .='oplimits' or .='sblist' or .='schedchk' or .='spectool' or .='timelim' or .='title-page']) and not(ancestor::ata-page-block/@pb-name[(starts-with(., 'do') and 'do' = translate(., '0123456789', '') and string-length(.) &gt; 2) or (starts-with(., 'in') and 'in' = translate(., '0123456789', '') and string-length(.) &gt; 2) or (starts-with(., 'tl') and 'tl' = translate(., '0123456789', '') and string-length(.) &gt; 2) or .='toolsht' or .='trlist' or .='unschedc' or .='unschedchk']) and not(ancestor::page-block/@pb-name[(starts-with(., 'do') and 'do' = translate(., '0123456789', '') and string-length(.) &gt; 2) or (starts-with(., 'in') and 'in' = translate(., '0123456789', '') and string-length(.) &gt; 2) or (starts-with(., 'tl') and 'tl' = translate(., '0123456789', '') and string-length(.) &gt; 2) or .='toolsht' or .='trlist' or .='unschedc' or .='unschedchk']) and not(ancestor-or-self::ata-page-block[1]/@pb-name and string(ancestor-or-self::ata-page-block[1]/@pb-name)='intro00') and not(ancestor-or-self::page-block[1]/@pb-name and string(ancestor-or-self::page-block[1]/@pb-name)='intro00') and not(ancestor::ata-page-block/@pb-name[starts-with(., 'disassy') or starts-with(., 'fault')]) and not(ancestor::page-block/@pb-name[starts-with(., 'disassy') or starts-with(., 'fault')]) and not(ancestor::book[contains(@doctype,'oh')] and ancestor::ata-page-block/@pb-name[starts-with(., 'clean')]) and not(ancestor::book[contains(@doctype,'oh')] and ancestor::page-block/@pb-name[starts-with(., 'clean')]) and not(ancestor::ata-page-block/@pb-name[starts-with(., 'mainprac')]) and not(ancestor::page-block/@pb-name[starts-with(., 'mainprac')]) and not(ancestor::book[contains(@doctype,'oh')] and ancestor::ata-page-block/@pb-name[starts-with(., 'inspect')]) and (ancestor::book[contains(@doctype,'oh')] and ancestor::page-block/@pb-name[starts-with(., 'inspect')])">
            <!-- Condition #16-->
            <xsl:if test="not(@_gte:Gentext-Expanded)">
               <_sfe:BeforeOrAfterText>Figure <_gte:styler_numbering>
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
         </xsl:when>
         <xsl:when test="not(ancestor::book[contains(@doctype,'oh')] and ancestor::ata-page-block/@pb-name[.='service']) and not(ancestor::book[contains(@doctype,'oh')] and ancestor::page-block/@pb-name[.='service']) and not(ancestor::ata-page-block/@pb-name[.='00awl' or .='00intro' or .='airlim' or .='awl' or .='awlror' or .='chapsect' or .='consume' or .='d-and-o' or .='frontmatte' or .='howtouse' or .='00howtouse' or .='intro' or .='nut_option' or .='oplimits' or .='sblist' or .='schedchk' or .='spectool' or .='timelim' or .='title-page']) and not(ancestor::page-block/@pb-name[.='00awl' or .='00intro' or .='airlim' or .='awl' or .='awlror' or .='chapsect' or .='consume' or .='d-and-o' or .='frontmatte' or .='howtouse' or .='00howtouse' or .='intro' or .='nut_option' or .='oplimits' or .='sblist' or .='schedchk' or .='spectool' or .='timelim' or .='title-page']) and not(ancestor::ata-page-block/@pb-name[(starts-with(., 'do') and 'do' = translate(., '0123456789', '') and string-length(.) &gt; 2) or (starts-with(., 'in') and 'in' = translate(., '0123456789', '') and string-length(.) &gt; 2) or (starts-with(., 'tl') and 'tl' = translate(., '0123456789', '') and string-length(.) &gt; 2) or .='toolsht' or .='trlist' or .='unschedc' or .='unschedchk']) and not(ancestor::page-block/@pb-name[(starts-with(., 'do') and 'do' = translate(., '0123456789', '') and string-length(.) &gt; 2) or (starts-with(., 'in') and 'in' = translate(., '0123456789', '') and string-length(.) &gt; 2) or (starts-with(., 'tl') and 'tl' = translate(., '0123456789', '') and string-length(.) &gt; 2) or .='toolsht' or .='trlist' or .='unschedc' or .='unschedchk']) and not(ancestor-or-self::ata-page-block[1]/@pb-name and string(ancestor-or-self::ata-page-block[1]/@pb-name)='intro00') and not(ancestor-or-self::page-block[1]/@pb-name and string(ancestor-or-self::page-block[1]/@pb-name)='intro00') and not(ancestor::ata-page-block/@pb-name[starts-with(., 'disassy') or starts-with(., 'fault')]) and not(ancestor::page-block/@pb-name[starts-with(., 'disassy') or starts-with(., 'fault')]) and not(ancestor::book[contains(@doctype,'oh')] and ancestor::ata-page-block/@pb-name[starts-with(., 'clean')]) and not(ancestor::book[contains(@doctype,'oh')] and ancestor::page-block/@pb-name[starts-with(., 'clean')]) and not(ancestor::ata-page-block/@pb-name[starts-with(., 'mainprac')]) and not(ancestor::page-block/@pb-name[starts-with(., 'mainprac')]) and (ancestor::book[contains(@doctype,'oh')] and ancestor::ata-page-block/@pb-name[starts-with(., 'inspect')])">
            <!-- Condition #15-->
            <xsl:if test="not(@_gte:Gentext-Expanded)">
               <_sfe:BeforeOrAfterText>Figure <_gte:styler_numbering>
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
         </xsl:when>
         <xsl:when test="not(ancestor::book[contains(@doctype,'oh')] and ancestor::ata-page-block/@pb-name[.='service']) and not(ancestor::book[contains(@doctype,'oh')] and ancestor::page-block/@pb-name[.='service']) and not(ancestor::ata-page-block/@pb-name[.='00awl' or .='00intro' or .='airlim' or .='awl' or .='awlror' or .='chapsect' or .='consume' or .='d-and-o' or .='frontmatte' or .='howtouse' or .='00howtouse' or .='intro' or .='nut_option' or .='oplimits' or .='sblist' or .='schedchk' or .='spectool' or .='timelim' or .='title-page']) and not(ancestor::page-block/@pb-name[.='00awl' or .='00intro' or .='airlim' or .='awl' or .='awlror' or .='chapsect' or .='consume' or .='d-and-o' or .='frontmatte' or .='howtouse' or .='00howtouse' or .='intro' or .='nut_option' or .='oplimits' or .='sblist' or .='schedchk' or .='spectool' or .='timelim' or .='title-page']) and not(ancestor::ata-page-block/@pb-name[(starts-with(., 'do') and 'do' = translate(., '0123456789', '') and string-length(.) &gt; 2) or (starts-with(., 'in') and 'in' = translate(., '0123456789', '') and string-length(.) &gt; 2) or (starts-with(., 'tl') and 'tl' = translate(., '0123456789', '') and string-length(.) &gt; 2) or .='toolsht' or .='trlist' or .='unschedc' or .='unschedchk']) and not(ancestor::page-block/@pb-name[(starts-with(., 'do') and 'do' = translate(., '0123456789', '') and string-length(.) &gt; 2) or (starts-with(., 'in') and 'in' = translate(., '0123456789', '') and string-length(.) &gt; 2) or (starts-with(., 'tl') and 'tl' = translate(., '0123456789', '') and string-length(.) &gt; 2) or .='toolsht' or .='trlist' or .='unschedc' or .='unschedchk']) and not(ancestor-or-self::ata-page-block[1]/@pb-name and string(ancestor-or-self::ata-page-block[1]/@pb-name)='intro00') and not(ancestor-or-self::page-block[1]/@pb-name and string(ancestor-or-self::page-block[1]/@pb-name)='intro00') and not(ancestor::ata-page-block/@pb-name[starts-with(., 'disassy') or starts-with(., 'fault')]) and not(ancestor::page-block/@pb-name[starts-with(., 'disassy') or starts-with(., 'fault')]) and not(ancestor::book[contains(@doctype,'oh')] and ancestor::ata-page-block/@pb-name[starts-with(., 'clean')]) and not(ancestor::book[contains(@doctype,'oh')] and ancestor::page-block/@pb-name[starts-with(., 'clean')]) and not(ancestor::ata-page-block/@pb-name[starts-with(., 'mainprac')]) and (ancestor::page-block/@pb-name[starts-with(., 'mainprac')])">
            <!-- Condition #14-->
            <xsl:if test="not(@_gte:Gentext-Expanded)">
               <_sfe:BeforeOrAfterText>Figure <_gte:styler_numbering>
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
         </xsl:when>
         <xsl:when test="not(ancestor::book[contains(@doctype,'oh')] and ancestor::ata-page-block/@pb-name[.='service']) and not(ancestor::book[contains(@doctype,'oh')] and ancestor::page-block/@pb-name[.='service']) and not(ancestor::ata-page-block/@pb-name[.='00awl' or .='00intro' or .='airlim' or .='awl' or .='awlror' or .='chapsect' or .='consume' or .='d-and-o' or .='frontmatte' or .='howtouse' or .='00howtouse' or .='intro' or .='nut_option' or .='oplimits' or .='sblist' or .='schedchk' or .='spectool' or .='timelim' or .='title-page']) and not(ancestor::page-block/@pb-name[.='00awl' or .='00intro' or .='airlim' or .='awl' or .='awlror' or .='chapsect' or .='consume' or .='d-and-o' or .='frontmatte' or .='howtouse' or .='00howtouse' or .='intro' or .='nut_option' or .='oplimits' or .='sblist' or .='schedchk' or .='spectool' or .='timelim' or .='title-page']) and not(ancestor::ata-page-block/@pb-name[(starts-with(., 'do') and 'do' = translate(., '0123456789', '') and string-length(.) &gt; 2) or (starts-with(., 'in') and 'in' = translate(., '0123456789', '') and string-length(.) &gt; 2) or (starts-with(., 'tl') and 'tl' = translate(., '0123456789', '') and string-length(.) &gt; 2) or .='toolsht' or .='trlist' or .='unschedc' or .='unschedchk']) and not(ancestor::page-block/@pb-name[(starts-with(., 'do') and 'do' = translate(., '0123456789', '') and string-length(.) &gt; 2) or (starts-with(., 'in') and 'in' = translate(., '0123456789', '') and string-length(.) &gt; 2) or (starts-with(., 'tl') and 'tl' = translate(., '0123456789', '') and string-length(.) &gt; 2) or .='toolsht' or .='trlist' or .='unschedc' or .='unschedchk']) and not(ancestor-or-self::ata-page-block[1]/@pb-name and string(ancestor-or-self::ata-page-block[1]/@pb-name)='intro00') and not(ancestor-or-self::page-block[1]/@pb-name and string(ancestor-or-self::page-block[1]/@pb-name)='intro00') and not(ancestor::ata-page-block/@pb-name[starts-with(., 'disassy') or starts-with(., 'fault')]) and not(ancestor::page-block/@pb-name[starts-with(., 'disassy') or starts-with(., 'fault')]) and not(ancestor::book[contains(@doctype,'oh')] and ancestor::ata-page-block/@pb-name[starts-with(., 'clean')]) and not(ancestor::book[contains(@doctype,'oh')] and ancestor::page-block/@pb-name[starts-with(., 'clean')]) and (ancestor::ata-page-block/@pb-name[starts-with(., 'mainprac')])">
            <!-- Condition #13-->
            <xsl:if test="not(@_gte:Gentext-Expanded)">
               <_sfe:BeforeOrAfterText>Figure <_gte:styler_numbering>
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
         </xsl:when>
         <xsl:when test="not(ancestor::book[contains(@doctype,'oh')] and ancestor::ata-page-block/@pb-name[.='service']) and not(ancestor::book[contains(@doctype,'oh')] and ancestor::page-block/@pb-name[.='service']) and not(ancestor::ata-page-block/@pb-name[.='00awl' or .='00intro' or .='airlim' or .='awl' or .='awlror' or .='chapsect' or .='consume' or .='d-and-o' or .='frontmatte' or .='howtouse' or .='00howtouse' or .='intro' or .='nut_option' or .='oplimits' or .='sblist' or .='schedchk' or .='spectool' or .='timelim' or .='title-page']) and not(ancestor::page-block/@pb-name[.='00awl' or .='00intro' or .='airlim' or .='awl' or .='awlror' or .='chapsect' or .='consume' or .='d-and-o' or .='frontmatte' or .='howtouse' or .='00howtouse' or .='intro' or .='nut_option' or .='oplimits' or .='sblist' or .='schedchk' or .='spectool' or .='timelim' or .='title-page']) and not(ancestor::ata-page-block/@pb-name[(starts-with(., 'do') and 'do' = translate(., '0123456789', '') and string-length(.) &gt; 2) or (starts-with(., 'in') and 'in' = translate(., '0123456789', '') and string-length(.) &gt; 2) or (starts-with(., 'tl') and 'tl' = translate(., '0123456789', '') and string-length(.) &gt; 2) or .='toolsht' or .='trlist' or .='unschedc' or .='unschedchk']) and not(ancestor::page-block/@pb-name[(starts-with(., 'do') and 'do' = translate(., '0123456789', '') and string-length(.) &gt; 2) or (starts-with(., 'in') and 'in' = translate(., '0123456789', '') and string-length(.) &gt; 2) or (starts-with(., 'tl') and 'tl' = translate(., '0123456789', '') and string-length(.) &gt; 2) or .='toolsht' or .='trlist' or .='unschedc' or .='unschedchk']) and not(ancestor-or-self::ata-page-block[1]/@pb-name and string(ancestor-or-self::ata-page-block[1]/@pb-name)='intro00') and not(ancestor-or-self::page-block[1]/@pb-name and string(ancestor-or-self::page-block[1]/@pb-name)='intro00') and not(ancestor::ata-page-block/@pb-name[starts-with(., 'disassy') or starts-with(., 'fault')]) and not(ancestor::page-block/@pb-name[starts-with(., 'disassy') or starts-with(., 'fault')]) and not(ancestor::book[contains(@doctype,'oh')] and ancestor::ata-page-block/@pb-name[starts-with(., 'clean')]) and (ancestor::book[contains(@doctype,'oh')] and ancestor::page-block/@pb-name[starts-with(., 'clean')])">
            <!-- Condition #12-->
            <xsl:if test="not(@_gte:Gentext-Expanded)">
               <_sfe:BeforeOrAfterText>Figure <_gte:styler_numbering>
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
         </xsl:when>
         <xsl:when test="not(ancestor::book[contains(@doctype,'oh')] and ancestor::ata-page-block/@pb-name[.='service']) and not(ancestor::book[contains(@doctype,'oh')] and ancestor::page-block/@pb-name[.='service']) and not(ancestor::ata-page-block/@pb-name[.='00awl' or .='00intro' or .='airlim' or .='awl' or .='awlror' or .='chapsect' or .='consume' or .='d-and-o' or .='frontmatte' or .='howtouse' or .='00howtouse' or .='intro' or .='nut_option' or .='oplimits' or .='sblist' or .='schedchk' or .='spectool' or .='timelim' or .='title-page']) and not(ancestor::page-block/@pb-name[.='00awl' or .='00intro' or .='airlim' or .='awl' or .='awlror' or .='chapsect' or .='consume' or .='d-and-o' or .='frontmatte' or .='howtouse' or .='00howtouse' or .='intro' or .='nut_option' or .='oplimits' or .='sblist' or .='schedchk' or .='spectool' or .='timelim' or .='title-page']) and not(ancestor::ata-page-block/@pb-name[(starts-with(., 'do') and 'do' = translate(., '0123456789', '') and string-length(.) &gt; 2) or (starts-with(., 'in') and 'in' = translate(., '0123456789', '') and string-length(.) &gt; 2) or (starts-with(., 'tl') and 'tl' = translate(., '0123456789', '') and string-length(.) &gt; 2) or .='toolsht' or .='trlist' or .='unschedc' or .='unschedchk']) and not(ancestor::page-block/@pb-name[(starts-with(., 'do') and 'do' = translate(., '0123456789', '') and string-length(.) &gt; 2) or (starts-with(., 'in') and 'in' = translate(., '0123456789', '') and string-length(.) &gt; 2) or (starts-with(., 'tl') and 'tl' = translate(., '0123456789', '') and string-length(.) &gt; 2) or .='toolsht' or .='trlist' or .='unschedc' or .='unschedchk']) and not(ancestor-or-self::ata-page-block[1]/@pb-name and string(ancestor-or-self::ata-page-block[1]/@pb-name)='intro00') and not(ancestor-or-self::page-block[1]/@pb-name and string(ancestor-or-self::page-block[1]/@pb-name)='intro00') and not(ancestor::ata-page-block/@pb-name[starts-with(., 'disassy') or starts-with(., 'fault')]) and not(ancestor::page-block/@pb-name[starts-with(., 'disassy') or starts-with(., 'fault')]) and (ancestor::book[contains(@doctype,'oh')] and ancestor::ata-page-block/@pb-name[starts-with(., 'clean')])">
            <!-- Condition #11-->
            <xsl:if test="not(@_gte:Gentext-Expanded)">
               <_sfe:BeforeOrAfterText>Figure <_gte:styler_numbering>
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
         </xsl:when>
         <xsl:when test="not(ancestor::book[contains(@doctype,'oh')] and ancestor::ata-page-block/@pb-name[.='service']) and not(ancestor::book[contains(@doctype,'oh')] and ancestor::page-block/@pb-name[.='service']) and not(ancestor::ata-page-block/@pb-name[.='00awl' or .='00intro' or .='airlim' or .='awl' or .='awlror' or .='chapsect' or .='consume' or .='d-and-o' or .='frontmatte' or .='howtouse' or .='00howtouse' or .='intro' or .='nut_option' or .='oplimits' or .='sblist' or .='schedchk' or .='spectool' or .='timelim' or .='title-page']) and not(ancestor::page-block/@pb-name[.='00awl' or .='00intro' or .='airlim' or .='awl' or .='awlror' or .='chapsect' or .='consume' or .='d-and-o' or .='frontmatte' or .='howtouse' or .='00howtouse' or .='intro' or .='nut_option' or .='oplimits' or .='sblist' or .='schedchk' or .='spectool' or .='timelim' or .='title-page']) and not(ancestor::ata-page-block/@pb-name[(starts-with(., 'do') and 'do' = translate(., '0123456789', '') and string-length(.) &gt; 2) or (starts-with(., 'in') and 'in' = translate(., '0123456789', '') and string-length(.) &gt; 2) or (starts-with(., 'tl') and 'tl' = translate(., '0123456789', '') and string-length(.) &gt; 2) or .='toolsht' or .='trlist' or .='unschedc' or .='unschedchk']) and not(ancestor::page-block/@pb-name[(starts-with(., 'do') and 'do' = translate(., '0123456789', '') and string-length(.) &gt; 2) or (starts-with(., 'in') and 'in' = translate(., '0123456789', '') and string-length(.) &gt; 2) or (starts-with(., 'tl') and 'tl' = translate(., '0123456789', '') and string-length(.) &gt; 2) or .='toolsht' or .='trlist' or .='unschedc' or .='unschedchk']) and not(ancestor-or-self::ata-page-block[1]/@pb-name and string(ancestor-or-self::ata-page-block[1]/@pb-name)='intro00') and not(ancestor-or-self::page-block[1]/@pb-name and string(ancestor-or-self::page-block[1]/@pb-name)='intro00') and not(ancestor::ata-page-block/@pb-name[starts-with(., 'disassy') or starts-with(., 'fault')]) and (ancestor::page-block/@pb-name[starts-with(., 'disassy') or starts-with(., 'fault')])">
            <!-- Condition #10-->
            <xsl:if test="not(@_gte:Gentext-Expanded)">
               <_sfe:BeforeOrAfterText>Figure <_gte:styler_numbering>
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
         </xsl:when>
         <xsl:when test="not(ancestor::book[contains(@doctype,'oh')] and ancestor::ata-page-block/@pb-name[.='service']) and not(ancestor::book[contains(@doctype,'oh')] and ancestor::page-block/@pb-name[.='service']) and not(ancestor::ata-page-block/@pb-name[.='00awl' or .='00intro' or .='airlim' or .='awl' or .='awlror' or .='chapsect' or .='consume' or .='d-and-o' or .='frontmatte' or .='howtouse' or .='00howtouse' or .='intro' or .='nut_option' or .='oplimits' or .='sblist' or .='schedchk' or .='spectool' or .='timelim' or .='title-page']) and not(ancestor::page-block/@pb-name[.='00awl' or .='00intro' or .='airlim' or .='awl' or .='awlror' or .='chapsect' or .='consume' or .='d-and-o' or .='frontmatte' or .='howtouse' or .='00howtouse' or .='intro' or .='nut_option' or .='oplimits' or .='sblist' or .='schedchk' or .='spectool' or .='timelim' or .='title-page']) and not(ancestor::ata-page-block/@pb-name[(starts-with(., 'do') and 'do' = translate(., '0123456789', '') and string-length(.) &gt; 2) or (starts-with(., 'in') and 'in' = translate(., '0123456789', '') and string-length(.) &gt; 2) or (starts-with(., 'tl') and 'tl' = translate(., '0123456789', '') and string-length(.) &gt; 2) or .='toolsht' or .='trlist' or .='unschedc' or .='unschedchk']) and not(ancestor::page-block/@pb-name[(starts-with(., 'do') and 'do' = translate(., '0123456789', '') and string-length(.) &gt; 2) or (starts-with(., 'in') and 'in' = translate(., '0123456789', '') and string-length(.) &gt; 2) or (starts-with(., 'tl') and 'tl' = translate(., '0123456789', '') and string-length(.) &gt; 2) or .='toolsht' or .='trlist' or .='unschedc' or .='unschedchk']) and not(ancestor-or-self::ata-page-block[1]/@pb-name and string(ancestor-or-self::ata-page-block[1]/@pb-name)='intro00') and not(ancestor-or-self::page-block[1]/@pb-name and string(ancestor-or-self::page-block[1]/@pb-name)='intro00') and (ancestor::ata-page-block/@pb-name[starts-with(., 'disassy') or starts-with(., 'fault')])">
            <!-- Condition #9-->
            <xsl:if test="not(@_gte:Gentext-Expanded)">
               <_sfe:BeforeOrAfterText>Figure <_gte:styler_numbering>
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
         </xsl:when>
         <xsl:when test="not(ancestor::book[contains(@doctype,'oh')] and ancestor::ata-page-block/@pb-name[.='service']) and not(ancestor::book[contains(@doctype,'oh')] and ancestor::page-block/@pb-name[.='service']) and not(ancestor::ata-page-block/@pb-name[.='00awl' or .='00intro' or .='airlim' or .='awl' or .='awlror' or .='chapsect' or .='consume' or .='d-and-o' or .='frontmatte' or .='howtouse' or .='00howtouse' or .='intro' or .='nut_option' or .='oplimits' or .='sblist' or .='schedchk' or .='spectool' or .='timelim' or .='title-page']) and not(ancestor::page-block/@pb-name[.='00awl' or .='00intro' or .='airlim' or .='awl' or .='awlror' or .='chapsect' or .='consume' or .='d-and-o' or .='frontmatte' or .='howtouse' or .='00howtouse' or .='intro' or .='nut_option' or .='oplimits' or .='sblist' or .='schedchk' or .='spectool' or .='timelim' or .='title-page']) and not(ancestor::ata-page-block/@pb-name[(starts-with(., 'do') and 'do' = translate(., '0123456789', '') and string-length(.) &gt; 2) or (starts-with(., 'in') and 'in' = translate(., '0123456789', '') and string-length(.) &gt; 2) or (starts-with(., 'tl') and 'tl' = translate(., '0123456789', '') and string-length(.) &gt; 2) or .='toolsht' or .='trlist' or .='unschedc' or .='unschedchk']) and not(ancestor::page-block/@pb-name[(starts-with(., 'do') and 'do' = translate(., '0123456789', '') and string-length(.) &gt; 2) or (starts-with(., 'in') and 'in' = translate(., '0123456789', '') and string-length(.) &gt; 2) or (starts-with(., 'tl') and 'tl' = translate(., '0123456789', '') and string-length(.) &gt; 2) or .='toolsht' or .='trlist' or .='unschedc' or .='unschedchk']) and not(ancestor-or-self::ata-page-block[1]/@pb-name and string(ancestor-or-self::ata-page-block[1]/@pb-name)='intro00') and (ancestor-or-self::page-block[1]/@pb-name and string(ancestor-or-self::page-block[1]/@pb-name)='intro00')">
            <!-- Condition #8-->
            <xsl:if test="not(@_gte:Gentext-Expanded)">
               <_sfe:BeforeOrAfterText>Figure <_gte:styler_numbering>
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
         </xsl:when>
         <xsl:when test="not(ancestor::book[contains(@doctype,'oh')] and ancestor::ata-page-block/@pb-name[.='service']) and not(ancestor::book[contains(@doctype,'oh')] and ancestor::page-block/@pb-name[.='service']) and not(ancestor::ata-page-block/@pb-name[.='00awl' or .='00intro' or .='airlim' or .='awl' or .='awlror' or .='chapsect' or .='consume' or .='d-and-o' or .='frontmatte' or .='howtouse' or .='00howtouse' or .='intro' or .='nut_option' or .='oplimits' or .='sblist' or .='schedchk' or .='spectool' or .='timelim' or .='title-page']) and not(ancestor::page-block/@pb-name[.='00awl' or .='00intro' or .='airlim' or .='awl' or .='awlror' or .='chapsect' or .='consume' or .='d-and-o' or .='frontmatte' or .='howtouse' or .='00howtouse' or .='intro' or .='nut_option' or .='oplimits' or .='sblist' or .='schedchk' or .='spectool' or .='timelim' or .='title-page']) and not(ancestor::ata-page-block/@pb-name[(starts-with(., 'do') and 'do' = translate(., '0123456789', '') and string-length(.) &gt; 2) or (starts-with(., 'in') and 'in' = translate(., '0123456789', '') and string-length(.) &gt; 2) or (starts-with(., 'tl') and 'tl' = translate(., '0123456789', '') and string-length(.) &gt; 2) or .='toolsht' or .='trlist' or .='unschedc' or .='unschedchk']) and not(ancestor::page-block/@pb-name[(starts-with(., 'do') and 'do' = translate(., '0123456789', '') and string-length(.) &gt; 2) or (starts-with(., 'in') and 'in' = translate(., '0123456789', '') and string-length(.) &gt; 2) or (starts-with(., 'tl') and 'tl' = translate(., '0123456789', '') and string-length(.) &gt; 2) or .='toolsht' or .='trlist' or .='unschedc' or .='unschedchk']) and (ancestor-or-self::ata-page-block[1]/@pb-name and string(ancestor-or-self::ata-page-block[1]/@pb-name)='intro00')">
            <!-- Condition #7-->
            <xsl:if test="not(@_gte:Gentext-Expanded)">
               <_sfe:BeforeOrAfterText>Figure <_gte:styler_numbering>
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
         </xsl:when>
         <xsl:when test="not(ancestor::book[contains(@doctype,'oh')] and ancestor::ata-page-block/@pb-name[.='service']) and not(ancestor::book[contains(@doctype,'oh')] and ancestor::page-block/@pb-name[.='service']) and not(ancestor::ata-page-block/@pb-name[.='00awl' or .='00intro' or .='airlim' or .='awl' or .='awlror' or .='chapsect' or .='consume' or .='d-and-o' or .='frontmatte' or .='howtouse' or .='00howtouse' or .='intro' or .='nut_option' or .='oplimits' or .='sblist' or .='schedchk' or .='spectool' or .='timelim' or .='title-page']) and not(ancestor::page-block/@pb-name[.='00awl' or .='00intro' or .='airlim' or .='awl' or .='awlror' or .='chapsect' or .='consume' or .='d-and-o' or .='frontmatte' or .='howtouse' or .='00howtouse' or .='intro' or .='nut_option' or .='oplimits' or .='sblist' or .='schedchk' or .='spectool' or .='timelim' or .='title-page']) and not(ancestor::ata-page-block/@pb-name[(starts-with(., 'do') and 'do' = translate(., '0123456789', '') and string-length(.) &gt; 2) or (starts-with(., 'in') and 'in' = translate(., '0123456789', '') and string-length(.) &gt; 2) or (starts-with(., 'tl') and 'tl' = translate(., '0123456789', '') and string-length(.) &gt; 2) or .='toolsht' or .='trlist' or .='unschedc' or .='unschedchk']) and (ancestor::page-block/@pb-name[(starts-with(., 'do') and 'do' = translate(., '0123456789', '') and string-length(.) &gt; 2) or (starts-with(., 'in') and 'in' = translate(., '0123456789', '') and string-length(.) &gt; 2) or (starts-with(., 'tl') and 'tl' = translate(., '0123456789', '') and string-length(.) &gt; 2) or .='toolsht' or .='trlist' or .='unschedc' or .='unschedchk'])">
            <!-- Condition #6-->
            <xsl:if test="not(@_gte:Gentext-Expanded)">
               <_sfe:BeforeOrAfterText>Figure <_gte:styler_numbering>
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
         </xsl:when>
         <xsl:when test="not(ancestor::book[contains(@doctype,'oh')] and ancestor::ata-page-block/@pb-name[.='service']) and not(ancestor::book[contains(@doctype,'oh')] and ancestor::page-block/@pb-name[.='service']) and not(ancestor::ata-page-block/@pb-name[.='00awl' or .='00intro' or .='airlim' or .='awl' or .='awlror' or .='chapsect' or .='consume' or .='d-and-o' or .='frontmatte' or .='howtouse' or .='00howtouse' or .='intro' or .='nut_option' or .='oplimits' or .='sblist' or .='schedchk' or .='spectool' or .='timelim' or .='title-page']) and not(ancestor::page-block/@pb-name[.='00awl' or .='00intro' or .='airlim' or .='awl' or .='awlror' or .='chapsect' or .='consume' or .='d-and-o' or .='frontmatte' or .='howtouse' or .='00howtouse' or .='intro' or .='nut_option' or .='oplimits' or .='sblist' or .='schedchk' or .='spectool' or .='timelim' or .='title-page']) and (ancestor::ata-page-block/@pb-name[(starts-with(., 'do') and 'do' = translate(., '0123456789', '') and string-length(.) &gt; 2) or (starts-with(., 'in') and 'in' = translate(., '0123456789', '') and string-length(.) &gt; 2) or (starts-with(., 'tl') and 'tl' = translate(., '0123456789', '') and string-length(.) &gt; 2) or .='toolsht' or .='trlist' or .='unschedc' or .='unschedchk'])">
            <!-- Condition #5-->
            <xsl:if test="not(@_gte:Gentext-Expanded)">
               <_sfe:BeforeOrAfterText>Figure <_gte:styler_numbering>
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
         </xsl:when>
         <xsl:when test="not(ancestor::book[contains(@doctype,'oh')] and ancestor::ata-page-block/@pb-name[.='service']) and not(ancestor::book[contains(@doctype,'oh')] and ancestor::page-block/@pb-name[.='service']) and not(ancestor::ata-page-block/@pb-name[.='00awl' or .='00intro' or .='airlim' or .='awl' or .='awlror' or .='chapsect' or .='consume' or .='d-and-o' or .='frontmatte' or .='howtouse' or .='00howtouse' or .='intro' or .='nut_option' or .='oplimits' or .='sblist' or .='schedchk' or .='spectool' or .='timelim' or .='title-page']) and (ancestor::page-block/@pb-name[.='00awl' or .='00intro' or .='airlim' or .='awl' or .='awlror' or .='chapsect' or .='consume' or .='d-and-o' or .='frontmatte' or .='howtouse' or .='00howtouse' or .='intro' or .='nut_option' or .='oplimits' or .='sblist' or .='schedchk' or .='spectool' or .='timelim' or .='title-page'])">
            <!-- Condition #4-->
            <xsl:if test="not(@_gte:Gentext-Expanded)">
               <_sfe:BeforeOrAfterText>Figure <_gte:styler_numbering>
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
         </xsl:when>
         <xsl:when test="not(ancestor::book[contains(@doctype,'oh')] and ancestor::ata-page-block/@pb-name[.='service']) and not(ancestor::book[contains(@doctype,'oh')] and ancestor::page-block/@pb-name[.='service']) and (ancestor::ata-page-block/@pb-name[.='00awl' or .='00intro' or .='airlim' or .='awl' or .='awlror' or .='chapsect' or .='consume' or .='d-and-o' or .='frontmatte' or .='howtouse' or .='00howtouse' or .='intro' or .='nut_option' or .='oplimits' or .='sblist' or .='schedchk' or .='spectool' or .='timelim' or .='title-page'])">
            <!-- Condition #3-->
            <xsl:if test="not(@_gte:Gentext-Expanded)">
               <_sfe:BeforeOrAfterText>Figure <_gte:styler_numbering>
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
         </xsl:when>
         <xsl:when test="not(ancestor::book[contains(@doctype,'oh')] and ancestor::ata-page-block/@pb-name[.='service']) and (ancestor::book[contains(@doctype,'oh')] and ancestor::page-block/@pb-name[.='service'])">
            <!-- Condition #2-->
            <xsl:if test="not(@_gte:Gentext-Expanded)">
               <_sfe:BeforeOrAfterText/>
            </xsl:if>
         </xsl:when>
         <xsl:when test="ancestor::book[contains(@doctype,'oh')] and ancestor::ata-page-block/@pb-name[.='service']">
            <!-- Condition #1-->
            <xsl:if test="not(@_gte:Gentext-Expanded)">
               <_sfe:BeforeOrAfterText/>
            </xsl:if>
         </xsl:when>
      </xsl:choose>
   </xsl:template>

<xsl:template match="subpara/title" mode="styler-LabelAndNumberMarker" priority="38">
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

<xsl:template match="procedure/title" mode="styler-LabelAndNumberMarker" priority="37">
      <xsl:choose>
         <xsl:when test="(ancestor-or-self::table[1]/@role and string(ancestor-or-self::table[1]/@role)='torque-and-stretch') or (ancestor-or-self::table[1]/@role and string(ancestor-or-self::table[1]/@role)='spec-assem')"><!--LabelAndNumberMarker for condition #1--></xsl:when>
         <xsl:otherwise>
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
         </xsl:otherwise>
      </xsl:choose>
   </xsl:template>

<xsl:template match="taskproc/title" mode="styler-LabelAndNumberMarker" priority="34">
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

<xsl:template match="nutopt/title" mode="styler-LabelAndNumberMarker" priority="32">
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

<xsl:template match="tprereq/title" mode="styler-LabelAndNumberMarker" priority="27">
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

<xsl:template match="subtask/title" mode="styler-LabelAndNumberMarker" priority="26">
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

<xsl:template match="task/title" mode="styler-LabelAndNumberMarker" priority="24">
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

<xsl:template match="spec-tool-table/title" mode="styler-LabelAndNumberMarker" priority="15">
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

<xsl:template match="page-block/title" mode="styler-LabelAndNumberMarker" priority="11">
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

<xsl:template match="frontmatter/title" mode="styler-LabelAndNumberMarker" priority="8">
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

<xsl:template match="table[@display='expand']/title" mode="styler-LabelAndNumberMarker" priority="6">
      <xsl:choose>
         <xsl:when test="(ancestor-or-self::table[1]/@tabstyle and string(ancestor-or-self::table[1]/@tabstyle)='fits-and-clears') and (/ata-page-block//table/title)">
            <!--LabelAndNumberMarker for condition #39-->
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
         </xsl:when>
         <xsl:when test="(ancestor-or-self::table[1]/@tabstyle and string(ancestor-or-self::table[1]/@tabstyle)='fits-and-clears') and (/page-block//table/title)">
            <!-- Condition #38-->
            <xsl:if test="not(@_gte:Gentext-Expanded)">
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
         </xsl:when>
         <xsl:when test="not(ancestor::book[contains(@doctype,'cir') or contains(@doctype,'em') or contains(@doctype,'tmm')]) and not(ancestor::book[contains(@doctype,'oh')] and ancestor::ata-page-block/@pb-name[.='service']) and not(ancestor::book[contains(@doctype,'oh')] and ancestor::page-block/@pb-name[.='service']) and not(ancestor::ata-page-block/@pb-name[.='00awl' or .='00intro' or .='airlim' or .='awl' or .='awlror' or .='chapsect' or .='consume' or .='d-and-o' or .='frontmatte' or .='howtouse' or .='00howtouse' or .='intro' or .='nut_option' or .='oplimits' or .='sblist' or .='schedchk' or .='spectool' or .='timelim' or .='title-page']) and not(ancestor::page-block/@pb-name[.='00awl' or .='00intro' or .='airlim' or .='awl' or .='awlror' or .='chapsect' or .='consume' or .='d-and-o' or .='frontmatte' or .='howtouse' or .='00howtouse' or .='intro' or .='nut_option' or .='oplimits' or .='sblist' or .='schedchk' or .='spectool' or .='timelim' or .='title-page']) and not(ancestor::ata-page-block/@pb-name[(starts-with(., 'do') and 'do' = translate(., '0123456789', '') and string-length(.) &gt; 2) or (starts-with(., 'in') and 'in' = translate(., '0123456789', '') and string-length(.) &gt; 2) or (starts-with(., 'tl') and 'tl' = translate(., '0123456789', '') and string-length(.) &gt; 2) or .='toolsht' or .='trlist' or .='unschedc' or .='unschedchk']) and not(ancestor::page-block/@pb-name[(starts-with(., 'do') and 'do' = translate(., '0123456789', '') and string-length(.) &gt; 2) or (starts-with(., 'in') and 'in' = translate(., '0123456789', '') and string-length(.) &gt; 2) or (starts-with(., 'tl') and 'tl' = translate(., '0123456789', '') and string-length(.) &gt; 2) or .='toolsht' or .='trlist' or .='unschedc' or .='unschedchk']) and not(ancestor-or-self::ata-page-block[1]/@pb-name and string(ancestor-or-self::ata-page-block[1]/@pb-name)='intro00') and not(ancestor-or-self::page-block[1]/@pb-name and string(ancestor-or-self::page-block[1]/@pb-name)='intro00') and not(ancestor::ata-page-block/@pb-name[starts-with(., 'disassy') or starts-with(., 'fault')]) and not(ancestor::page-block/@pb-name[starts-with(., 'disassy') or starts-with(., 'fault')]) and not(ancestor::book[contains(@doctype,'oh')] and ancestor::ata-page-block/@pb-name[starts-with(., 'clean')]) and not(ancestor::book[contains(@doctype,'oh')] and ancestor::page-block/@pb-name[starts-with(., 'clean')]) and not(ancestor::ata-page-block/@pb-name[starts-with(., 'mainprac')]) and not(ancestor::page-block/@pb-name[starts-with(., 'mainprac')]) and not(ancestor::book[contains(@doctype,'oh')] and ancestor::ata-page-block/@pb-name[starts-with(., 'inspect')]) and not(ancestor::book[contains(@doctype,'oh')] and ancestor::page-block/@pb-name[starts-with(., 'inspect')]) and not(ancestor::ata-page-block/@pb-name[(starts-with(., 'di') and 'di' = translate(., '0123456789', '') and string-length(.) &gt; 2) or starts-with(.,'service')]) and not(ancestor::page-block/@pb-name[(starts-with(., 'di') and 'di' = translate(., '0123456789', '') and string-length(.) &gt; 2) or starts-with(.,'service')]) and not(ancestor::book[contains(@doctype,'oh')] and ancestor::ata-page-block/@pb-name[starts-with(., 'repair')]) and not(ancestor::book[contains(@doctype,'oh')] and ancestor::page-block/@pb-name[starts-with(., 'repair')]) and not(ancestor::ata-page-block/@pb-name[(starts-with(., 'cl') and 'cl' = translate(., '0123456789', '') and string-length(.) &gt; 2) or .='install' or starts-with(.,'rem-inst') or (starts-with(., 'reminst') and 'reminst' = translate(., '0123456789', '') and string-length(.) &gt; 7) or .='remove' or (starts-with(., 'repair') and 'repair' = translate(., '0123456789', '') and string-length(.) &gt; 6)]) and not(ancestor::page-block/@pb-name[(starts-with(., 'cl') and 'cl' = translate(., '0123456789', '') and string-length(.) &gt; 2) or .='install' or starts-with(.,'rem-inst') or (starts-with(., 'reminst') and 'reminst' = translate(., '0123456789', '') and string-length(.) &gt; 7) or .='remove' or (starts-with(., 'repair') and 'repair' = translate(., '0123456789', '') and string-length(.) &gt; 6)]) and not(ancestor::ata-page-block/@pb-name[starts-with(., 'assy') or (starts-with(., 'ic') and 'ic' = translate(., '0123456789', '') and string-length(.) &gt; 2) or (starts-with(., 'te') and 'te' = translate(., '0123456789', '') and string-length(.) &gt; 2) or .='test']) and not(ancestor::page-block/@pb-name[starts-with(., 'assy') or (starts-with(., 'ic') and 'ic' = translate(., '0123456789', '') and string-length(.) &gt; 2) or (starts-with(., 'te') and 'te' = translate(., '0123456789', '') and string-length(.) &gt; 2) or .='test']) and not(ancestor::ata-page-block/@pb-name[.='f-and-c' or starts-with(., 'inspect') or (starts-with(., 're') and 're' = translate(., '0123456789', '') and string-length(.) &gt; 2)]) and not(ancestor::page-block/@pb-name[.='f-and-c' or starts-with(., 'inspect') or (starts-with(., 're') and 're' = translate(., '0123456789', '') and string-length(.) &gt; 2)]) and not(ancestor::ata-page-block/@pb-name[(starts-with(., 'as') and 'as' = translate(., '0123456789', '') and string-length(.) &gt; 2) or starts-with(.,'clean') or (starts-with(., 'test') and 'test' = translate(., '0123456789', '') and string-length(.) &gt; 4)]) and not(ancestor::page-block/@pb-name[(starts-with(., 'as') and 'as' = translate(., '0123456789', '') and string-length(.) &gt; 2) or starts-with(.,'clean') or (starts-with(., 'test') and 'test' = translate(., '0123456789', '') and string-length(.) &gt; 4)]) and not(ancestor::ata-page-block/@pb-name[(starts-with(., 'fc') and 'fc' = translate(., '0123456789', '') and string-length(.) &gt; 2) or starts-with(.,'repair') or .='trouble']) and not(ancestor::page-block/@pb-name[(starts-with(., 'fc') and 'fc' = translate(., '0123456789', '') and string-length(.) &gt; 2) or starts-with(.,'repair') or .='trouble']) and not(ancestor::ata-page-block/@pb-name[starts-with(.,'storage') or (starts-with(., 'to') and 'to' = translate(., '0123456789', '') and string-length(.) &gt; 2)]) and not(ancestor::page-block/@pb-name[starts-with(.,'storage') or (starts-with(., 'to') and 'to' = translate(., '0123456789', '') and string-length(.) &gt; 2)]) and not(ancestor-or-self::ata-page-block[1]/@pb-name and string(ancestor-or-self::ata-page-block[1]/@pb-name)='it-oh') and (ancestor-or-self::page-block[1]/@pb-name and string(ancestor-or-self::page-block[1]/@pb-name)='it-oh')">
            <!-- Condition #37-->
            <xsl:if test="not(@_gte:Gentext-Expanded)">
               <_sfe:BeforeOrAfterText>Table <_gte:styler_numbering>
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
         </xsl:when>
         <xsl:when test="not(ancestor::book[contains(@doctype,'cir') or contains(@doctype,'em') or contains(@doctype,'tmm')]) and not(ancestor::book[contains(@doctype,'oh')] and ancestor::ata-page-block/@pb-name[.='service']) and not(ancestor::book[contains(@doctype,'oh')] and ancestor::page-block/@pb-name[.='service']) and not(ancestor::ata-page-block/@pb-name[.='00awl' or .='00intro' or .='airlim' or .='awl' or .='awlror' or .='chapsect' or .='consume' or .='d-and-o' or .='frontmatte' or .='howtouse' or .='00howtouse' or .='intro' or .='nut_option' or .='oplimits' or .='sblist' or .='schedchk' or .='spectool' or .='timelim' or .='title-page']) and not(ancestor::page-block/@pb-name[.='00awl' or .='00intro' or .='airlim' or .='awl' or .='awlror' or .='chapsect' or .='consume' or .='d-and-o' or .='frontmatte' or .='howtouse' or .='00howtouse' or .='intro' or .='nut_option' or .='oplimits' or .='sblist' or .='schedchk' or .='spectool' or .='timelim' or .='title-page']) and not(ancestor::ata-page-block/@pb-name[(starts-with(., 'do') and 'do' = translate(., '0123456789', '') and string-length(.) &gt; 2) or (starts-with(., 'in') and 'in' = translate(., '0123456789', '') and string-length(.) &gt; 2) or (starts-with(., 'tl') and 'tl' = translate(., '0123456789', '') and string-length(.) &gt; 2) or .='toolsht' or .='trlist' or .='unschedc' or .='unschedchk']) and not(ancestor::page-block/@pb-name[(starts-with(., 'do') and 'do' = translate(., '0123456789', '') and string-length(.) &gt; 2) or (starts-with(., 'in') and 'in' = translate(., '0123456789', '') and string-length(.) &gt; 2) or (starts-with(., 'tl') and 'tl' = translate(., '0123456789', '') and string-length(.) &gt; 2) or .='toolsht' or .='trlist' or .='unschedc' or .='unschedchk']) and not(ancestor-or-self::ata-page-block[1]/@pb-name and string(ancestor-or-self::ata-page-block[1]/@pb-name)='intro00') and not(ancestor-or-self::page-block[1]/@pb-name and string(ancestor-or-self::page-block[1]/@pb-name)='intro00') and not(ancestor::ata-page-block/@pb-name[starts-with(., 'disassy') or starts-with(., 'fault')]) and not(ancestor::page-block/@pb-name[starts-with(., 'disassy') or starts-with(., 'fault')]) and not(ancestor::book[contains(@doctype,'oh')] and ancestor::ata-page-block/@pb-name[starts-with(., 'clean')]) and not(ancestor::book[contains(@doctype,'oh')] and ancestor::page-block/@pb-name[starts-with(., 'clean')]) and not(ancestor::ata-page-block/@pb-name[starts-with(., 'mainprac')]) and not(ancestor::page-block/@pb-name[starts-with(., 'mainprac')]) and not(ancestor::book[contains(@doctype,'oh')] and ancestor::ata-page-block/@pb-name[starts-with(., 'inspect')]) and not(ancestor::book[contains(@doctype,'oh')] and ancestor::page-block/@pb-name[starts-with(., 'inspect')]) and not(ancestor::ata-page-block/@pb-name[(starts-with(., 'di') and 'di' = translate(., '0123456789', '') and string-length(.) &gt; 2) or starts-with(.,'service')]) and not(ancestor::page-block/@pb-name[(starts-with(., 'di') and 'di' = translate(., '0123456789', '') and string-length(.) &gt; 2) or starts-with(.,'service')]) and not(ancestor::book[contains(@doctype,'oh')] and ancestor::ata-page-block/@pb-name[starts-with(., 'repair')]) and not(ancestor::book[contains(@doctype,'oh')] and ancestor::page-block/@pb-name[starts-with(., 'repair')]) and not(ancestor::ata-page-block/@pb-name[(starts-with(., 'cl') and 'cl' = translate(., '0123456789', '') and string-length(.) &gt; 2) or .='install' or starts-with(.,'rem-inst') or (starts-with(., 'reminst') and 'reminst' = translate(., '0123456789', '') and string-length(.) &gt; 7) or .='remove' or (starts-with(., 'repair') and 'repair' = translate(., '0123456789', '') and string-length(.) &gt; 6)]) and not(ancestor::page-block/@pb-name[(starts-with(., 'cl') and 'cl' = translate(., '0123456789', '') and string-length(.) &gt; 2) or .='install' or starts-with(.,'rem-inst') or (starts-with(., 'reminst') and 'reminst' = translate(., '0123456789', '') and string-length(.) &gt; 7) or .='remove' or (starts-with(., 'repair') and 'repair' = translate(., '0123456789', '') and string-length(.) &gt; 6)]) and not(ancestor::ata-page-block/@pb-name[starts-with(., 'assy') or (starts-with(., 'ic') and 'ic' = translate(., '0123456789', '') and string-length(.) &gt; 2) or (starts-with(., 'te') and 'te' = translate(., '0123456789', '') and string-length(.) &gt; 2) or .='test']) and not(ancestor::page-block/@pb-name[starts-with(., 'assy') or (starts-with(., 'ic') and 'ic' = translate(., '0123456789', '') and string-length(.) &gt; 2) or (starts-with(., 'te') and 'te' = translate(., '0123456789', '') and string-length(.) &gt; 2) or .='test']) and not(ancestor::ata-page-block/@pb-name[.='f-and-c' or starts-with(., 'inspect') or (starts-with(., 're') and 're' = translate(., '0123456789', '') and string-length(.) &gt; 2)]) and not(ancestor::page-block/@pb-name[.='f-and-c' or starts-with(., 'inspect') or (starts-with(., 're') and 're' = translate(., '0123456789', '') and string-length(.) &gt; 2)]) and not(ancestor::ata-page-block/@pb-name[(starts-with(., 'as') and 'as' = translate(., '0123456789', '') and string-length(.) &gt; 2) or starts-with(.,'clean') or (starts-with(., 'test') and 'test' = translate(., '0123456789', '') and string-length(.) &gt; 4)]) and not(ancestor::page-block/@pb-name[(starts-with(., 'as') and 'as' = translate(., '0123456789', '') and string-length(.) &gt; 2) or starts-with(.,'clean') or (starts-with(., 'test') and 'test' = translate(., '0123456789', '') and string-length(.) &gt; 4)]) and not(ancestor::ata-page-block/@pb-name[(starts-with(., 'fc') and 'fc' = translate(., '0123456789', '') and string-length(.) &gt; 2) or starts-with(.,'repair') or .='trouble']) and not(ancestor::page-block/@pb-name[(starts-with(., 'fc') and 'fc' = translate(., '0123456789', '') and string-length(.) &gt; 2) or starts-with(.,'repair') or .='trouble']) and not(ancestor::ata-page-block/@pb-name[starts-with(.,'storage') or (starts-with(., 'to') and 'to' = translate(., '0123456789', '') and string-length(.) &gt; 2)]) and not(ancestor::page-block/@pb-name[starts-with(.,'storage') or (starts-with(., 'to') and 'to' = translate(., '0123456789', '') and string-length(.) &gt; 2)]) and (ancestor-or-self::ata-page-block[1]/@pb-name and string(ancestor-or-self::ata-page-block[1]/@pb-name)='it-oh')">
            <!-- Condition #36-->
            <xsl:if test="not(@_gte:Gentext-Expanded)">
               <_sfe:BeforeOrAfterText>Table <_gte:styler_numbering>
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
         </xsl:when>
         <xsl:when test="not(ancestor::book[contains(@doctype,'cir') or contains(@doctype,'em') or contains(@doctype,'tmm')]) and not(ancestor::book[contains(@doctype,'oh')] and ancestor::ata-page-block/@pb-name[.='service']) and not(ancestor::book[contains(@doctype,'oh')] and ancestor::page-block/@pb-name[.='service']) and not(ancestor::ata-page-block/@pb-name[.='00awl' or .='00intro' or .='airlim' or .='awl' or .='awlror' or .='chapsect' or .='consume' or .='d-and-o' or .='frontmatte' or .='howtouse' or .='00howtouse' or .='intro' or .='nut_option' or .='oplimits' or .='sblist' or .='schedchk' or .='spectool' or .='timelim' or .='title-page']) and not(ancestor::page-block/@pb-name[.='00awl' or .='00intro' or .='airlim' or .='awl' or .='awlror' or .='chapsect' or .='consume' or .='d-and-o' or .='frontmatte' or .='howtouse' or .='00howtouse' or .='intro' or .='nut_option' or .='oplimits' or .='sblist' or .='schedchk' or .='spectool' or .='timelim' or .='title-page']) and not(ancestor::ata-page-block/@pb-name[(starts-with(., 'do') and 'do' = translate(., '0123456789', '') and string-length(.) &gt; 2) or (starts-with(., 'in') and 'in' = translate(., '0123456789', '') and string-length(.) &gt; 2) or (starts-with(., 'tl') and 'tl' = translate(., '0123456789', '') and string-length(.) &gt; 2) or .='toolsht' or .='trlist' or .='unschedc' or .='unschedchk']) and not(ancestor::page-block/@pb-name[(starts-with(., 'do') and 'do' = translate(., '0123456789', '') and string-length(.) &gt; 2) or (starts-with(., 'in') and 'in' = translate(., '0123456789', '') and string-length(.) &gt; 2) or (starts-with(., 'tl') and 'tl' = translate(., '0123456789', '') and string-length(.) &gt; 2) or .='toolsht' or .='trlist' or .='unschedc' or .='unschedchk']) and not(ancestor-or-self::ata-page-block[1]/@pb-name and string(ancestor-or-self::ata-page-block[1]/@pb-name)='intro00') and not(ancestor-or-self::page-block[1]/@pb-name and string(ancestor-or-self::page-block[1]/@pb-name)='intro00') and not(ancestor::ata-page-block/@pb-name[starts-with(., 'disassy') or starts-with(., 'fault')]) and not(ancestor::page-block/@pb-name[starts-with(., 'disassy') or starts-with(., 'fault')]) and not(ancestor::book[contains(@doctype,'oh')] and ancestor::ata-page-block/@pb-name[starts-with(., 'clean')]) and not(ancestor::book[contains(@doctype,'oh')] and ancestor::page-block/@pb-name[starts-with(., 'clean')]) and not(ancestor::ata-page-block/@pb-name[starts-with(., 'mainprac')]) and not(ancestor::page-block/@pb-name[starts-with(., 'mainprac')]) and not(ancestor::book[contains(@doctype,'oh')] and ancestor::ata-page-block/@pb-name[starts-with(., 'inspect')]) and not(ancestor::book[contains(@doctype,'oh')] and ancestor::page-block/@pb-name[starts-with(., 'inspect')]) and not(ancestor::ata-page-block/@pb-name[(starts-with(., 'di') and 'di' = translate(., '0123456789', '') and string-length(.) &gt; 2) or starts-with(.,'service')]) and not(ancestor::page-block/@pb-name[(starts-with(., 'di') and 'di' = translate(., '0123456789', '') and string-length(.) &gt; 2) or starts-with(.,'service')]) and not(ancestor::book[contains(@doctype,'oh')] and ancestor::ata-page-block/@pb-name[starts-with(., 'repair')]) and not(ancestor::book[contains(@doctype,'oh')] and ancestor::page-block/@pb-name[starts-with(., 'repair')]) and not(ancestor::ata-page-block/@pb-name[(starts-with(., 'cl') and 'cl' = translate(., '0123456789', '') and string-length(.) &gt; 2) or .='install' or starts-with(.,'rem-inst') or (starts-with(., 'reminst') and 'reminst' = translate(., '0123456789', '') and string-length(.) &gt; 7) or .='remove' or (starts-with(., 'repair') and 'repair' = translate(., '0123456789', '') and string-length(.) &gt; 6)]) and not(ancestor::page-block/@pb-name[(starts-with(., 'cl') and 'cl' = translate(., '0123456789', '') and string-length(.) &gt; 2) or .='install' or starts-with(.,'rem-inst') or (starts-with(., 'reminst') and 'reminst' = translate(., '0123456789', '') and string-length(.) &gt; 7) or .='remove' or (starts-with(., 'repair') and 'repair' = translate(., '0123456789', '') and string-length(.) &gt; 6)]) and not(ancestor::ata-page-block/@pb-name[starts-with(., 'assy') or (starts-with(., 'ic') and 'ic' = translate(., '0123456789', '') and string-length(.) &gt; 2) or (starts-with(., 'te') and 'te' = translate(., '0123456789', '') and string-length(.) &gt; 2) or .='test']) and not(ancestor::page-block/@pb-name[starts-with(., 'assy') or (starts-with(., 'ic') and 'ic' = translate(., '0123456789', '') and string-length(.) &gt; 2) or (starts-with(., 'te') and 'te' = translate(., '0123456789', '') and string-length(.) &gt; 2) or .='test']) and not(ancestor::ata-page-block/@pb-name[.='f-and-c' or starts-with(., 'inspect') or (starts-with(., 're') and 're' = translate(., '0123456789', '') and string-length(.) &gt; 2)]) and not(ancestor::page-block/@pb-name[.='f-and-c' or starts-with(., 'inspect') or (starts-with(., 're') and 're' = translate(., '0123456789', '') and string-length(.) &gt; 2)]) and not(ancestor::ata-page-block/@pb-name[(starts-with(., 'as') and 'as' = translate(., '0123456789', '') and string-length(.) &gt; 2) or starts-with(.,'clean') or (starts-with(., 'test') and 'test' = translate(., '0123456789', '') and string-length(.) &gt; 4)]) and not(ancestor::page-block/@pb-name[(starts-with(., 'as') and 'as' = translate(., '0123456789', '') and string-length(.) &gt; 2) or starts-with(.,'clean') or (starts-with(., 'test') and 'test' = translate(., '0123456789', '') and string-length(.) &gt; 4)]) and not(ancestor::ata-page-block/@pb-name[(starts-with(., 'fc') and 'fc' = translate(., '0123456789', '') and string-length(.) &gt; 2) or starts-with(.,'repair') or .='trouble']) and not(ancestor::page-block/@pb-name[(starts-with(., 'fc') and 'fc' = translate(., '0123456789', '') and string-length(.) &gt; 2) or starts-with(.,'repair') or .='trouble']) and not(ancestor::ata-page-block/@pb-name[starts-with(.,'storage') or (starts-with(., 'to') and 'to' = translate(., '0123456789', '') and string-length(.) &gt; 2)]) and (ancestor::page-block/@pb-name[starts-with(.,'storage') or (starts-with(., 'to') and 'to' = translate(., '0123456789', '') and string-length(.) &gt; 2)])">
            <!-- Condition #35-->
            <xsl:if test="not(@_gte:Gentext-Expanded)">
               <_sfe:BeforeOrAfterText>Table <_gte:styler_numbering>
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
         </xsl:when>
         <xsl:when test="not(ancestor::book[contains(@doctype,'cir') or contains(@doctype,'em') or contains(@doctype,'tmm')]) and not(ancestor::book[contains(@doctype,'oh')] and ancestor::ata-page-block/@pb-name[.='service']) and not(ancestor::book[contains(@doctype,'oh')] and ancestor::page-block/@pb-name[.='service']) and not(ancestor::ata-page-block/@pb-name[.='00awl' or .='00intro' or .='airlim' or .='awl' or .='awlror' or .='chapsect' or .='consume' or .='d-and-o' or .='frontmatte' or .='howtouse' or .='00howtouse' or .='intro' or .='nut_option' or .='oplimits' or .='sblist' or .='schedchk' or .='spectool' or .='timelim' or .='title-page']) and not(ancestor::page-block/@pb-name[.='00awl' or .='00intro' or .='airlim' or .='awl' or .='awlror' or .='chapsect' or .='consume' or .='d-and-o' or .='frontmatte' or .='howtouse' or .='00howtouse' or .='intro' or .='nut_option' or .='oplimits' or .='sblist' or .='schedchk' or .='spectool' or .='timelim' or .='title-page']) and not(ancestor::ata-page-block/@pb-name[(starts-with(., 'do') and 'do' = translate(., '0123456789', '') and string-length(.) &gt; 2) or (starts-with(., 'in') and 'in' = translate(., '0123456789', '') and string-length(.) &gt; 2) or (starts-with(., 'tl') and 'tl' = translate(., '0123456789', '') and string-length(.) &gt; 2) or .='toolsht' or .='trlist' or .='unschedc' or .='unschedchk']) and not(ancestor::page-block/@pb-name[(starts-with(., 'do') and 'do' = translate(., '0123456789', '') and string-length(.) &gt; 2) or (starts-with(., 'in') and 'in' = translate(., '0123456789', '') and string-length(.) &gt; 2) or (starts-with(., 'tl') and 'tl' = translate(., '0123456789', '') and string-length(.) &gt; 2) or .='toolsht' or .='trlist' or .='unschedc' or .='unschedchk']) and not(ancestor-or-self::ata-page-block[1]/@pb-name and string(ancestor-or-self::ata-page-block[1]/@pb-name)='intro00') and not(ancestor-or-self::page-block[1]/@pb-name and string(ancestor-or-self::page-block[1]/@pb-name)='intro00') and not(ancestor::ata-page-block/@pb-name[starts-with(., 'disassy') or starts-with(., 'fault')]) and not(ancestor::page-block/@pb-name[starts-with(., 'disassy') or starts-with(., 'fault')]) and not(ancestor::book[contains(@doctype,'oh')] and ancestor::ata-page-block/@pb-name[starts-with(., 'clean')]) and not(ancestor::book[contains(@doctype,'oh')] and ancestor::page-block/@pb-name[starts-with(., 'clean')]) and not(ancestor::ata-page-block/@pb-name[starts-with(., 'mainprac')]) and not(ancestor::page-block/@pb-name[starts-with(., 'mainprac')]) and not(ancestor::book[contains(@doctype,'oh')] and ancestor::ata-page-block/@pb-name[starts-with(., 'inspect')]) and not(ancestor::book[contains(@doctype,'oh')] and ancestor::page-block/@pb-name[starts-with(., 'inspect')]) and not(ancestor::ata-page-block/@pb-name[(starts-with(., 'di') and 'di' = translate(., '0123456789', '') and string-length(.) &gt; 2) or starts-with(.,'service')]) and not(ancestor::page-block/@pb-name[(starts-with(., 'di') and 'di' = translate(., '0123456789', '') and string-length(.) &gt; 2) or starts-with(.,'service')]) and not(ancestor::book[contains(@doctype,'oh')] and ancestor::ata-page-block/@pb-name[starts-with(., 'repair')]) and not(ancestor::book[contains(@doctype,'oh')] and ancestor::page-block/@pb-name[starts-with(., 'repair')]) and not(ancestor::ata-page-block/@pb-name[(starts-with(., 'cl') and 'cl' = translate(., '0123456789', '') and string-length(.) &gt; 2) or .='install' or starts-with(.,'rem-inst') or (starts-with(., 'reminst') and 'reminst' = translate(., '0123456789', '') and string-length(.) &gt; 7) or .='remove' or (starts-with(., 'repair') and 'repair' = translate(., '0123456789', '') and string-length(.) &gt; 6)]) and not(ancestor::page-block/@pb-name[(starts-with(., 'cl') and 'cl' = translate(., '0123456789', '') and string-length(.) &gt; 2) or .='install' or starts-with(.,'rem-inst') or (starts-with(., 'reminst') and 'reminst' = translate(., '0123456789', '') and string-length(.) &gt; 7) or .='remove' or (starts-with(., 'repair') and 'repair' = translate(., '0123456789', '') and string-length(.) &gt; 6)]) and not(ancestor::ata-page-block/@pb-name[starts-with(., 'assy') or (starts-with(., 'ic') and 'ic' = translate(., '0123456789', '') and string-length(.) &gt; 2) or (starts-with(., 'te') and 'te' = translate(., '0123456789', '') and string-length(.) &gt; 2) or .='test']) and not(ancestor::page-block/@pb-name[starts-with(., 'assy') or (starts-with(., 'ic') and 'ic' = translate(., '0123456789', '') and string-length(.) &gt; 2) or (starts-with(., 'te') and 'te' = translate(., '0123456789', '') and string-length(.) &gt; 2) or .='test']) and not(ancestor::ata-page-block/@pb-name[.='f-and-c' or starts-with(., 'inspect') or (starts-with(., 're') and 're' = translate(., '0123456789', '') and string-length(.) &gt; 2)]) and not(ancestor::page-block/@pb-name[.='f-and-c' or starts-with(., 'inspect') or (starts-with(., 're') and 're' = translate(., '0123456789', '') and string-length(.) &gt; 2)]) and not(ancestor::ata-page-block/@pb-name[(starts-with(., 'as') and 'as' = translate(., '0123456789', '') and string-length(.) &gt; 2) or starts-with(.,'clean') or (starts-with(., 'test') and 'test' = translate(., '0123456789', '') and string-length(.) &gt; 4)]) and not(ancestor::page-block/@pb-name[(starts-with(., 'as') and 'as' = translate(., '0123456789', '') and string-length(.) &gt; 2) or starts-with(.,'clean') or (starts-with(., 'test') and 'test' = translate(., '0123456789', '') and string-length(.) &gt; 4)]) and not(ancestor::ata-page-block/@pb-name[(starts-with(., 'fc') and 'fc' = translate(., '0123456789', '') and string-length(.) &gt; 2) or starts-with(.,'repair') or .='trouble']) and not(ancestor::page-block/@pb-name[(starts-with(., 'fc') and 'fc' = translate(., '0123456789', '') and string-length(.) &gt; 2) or starts-with(.,'repair') or .='trouble']) and (ancestor::ata-page-block/@pb-name[starts-with(.,'storage') or (starts-with(., 'to') and 'to' = translate(., '0123456789', '') and string-length(.) &gt; 2)])">
            <!-- Condition #34-->
            <xsl:if test="not(@_gte:Gentext-Expanded)">
               <_sfe:BeforeOrAfterText>Table <_gte:styler_numbering>
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
         </xsl:when>
         <xsl:when test="not(ancestor::book[contains(@doctype,'cir') or contains(@doctype,'em') or contains(@doctype,'tmm')]) and not(ancestor::book[contains(@doctype,'oh')] and ancestor::ata-page-block/@pb-name[.='service']) and not(ancestor::book[contains(@doctype,'oh')] and ancestor::page-block/@pb-name[.='service']) and not(ancestor::ata-page-block/@pb-name[.='00awl' or .='00intro' or .='airlim' or .='awl' or .='awlror' or .='chapsect' or .='consume' or .='d-and-o' or .='frontmatte' or .='howtouse' or .='00howtouse' or .='intro' or .='nut_option' or .='oplimits' or .='sblist' or .='schedchk' or .='spectool' or .='timelim' or .='title-page']) and not(ancestor::page-block/@pb-name[.='00awl' or .='00intro' or .='airlim' or .='awl' or .='awlror' or .='chapsect' or .='consume' or .='d-and-o' or .='frontmatte' or .='howtouse' or .='00howtouse' or .='intro' or .='nut_option' or .='oplimits' or .='sblist' or .='schedchk' or .='spectool' or .='timelim' or .='title-page']) and not(ancestor::ata-page-block/@pb-name[(starts-with(., 'do') and 'do' = translate(., '0123456789', '') and string-length(.) &gt; 2) or (starts-with(., 'in') and 'in' = translate(., '0123456789', '') and string-length(.) &gt; 2) or (starts-with(., 'tl') and 'tl' = translate(., '0123456789', '') and string-length(.) &gt; 2) or .='toolsht' or .='trlist' or .='unschedc' or .='unschedchk']) and not(ancestor::page-block/@pb-name[(starts-with(., 'do') and 'do' = translate(., '0123456789', '') and string-length(.) &gt; 2) or (starts-with(., 'in') and 'in' = translate(., '0123456789', '') and string-length(.) &gt; 2) or (starts-with(., 'tl') and 'tl' = translate(., '0123456789', '') and string-length(.) &gt; 2) or .='toolsht' or .='trlist' or .='unschedc' or .='unschedchk']) and not(ancestor-or-self::ata-page-block[1]/@pb-name and string(ancestor-or-self::ata-page-block[1]/@pb-name)='intro00') and not(ancestor-or-self::page-block[1]/@pb-name and string(ancestor-or-self::page-block[1]/@pb-name)='intro00') and not(ancestor::ata-page-block/@pb-name[starts-with(., 'disassy') or starts-with(., 'fault')]) and not(ancestor::page-block/@pb-name[starts-with(., 'disassy') or starts-with(., 'fault')]) and not(ancestor::book[contains(@doctype,'oh')] and ancestor::ata-page-block/@pb-name[starts-with(., 'clean')]) and not(ancestor::book[contains(@doctype,'oh')] and ancestor::page-block/@pb-name[starts-with(., 'clean')]) and not(ancestor::ata-page-block/@pb-name[starts-with(., 'mainprac')]) and not(ancestor::page-block/@pb-name[starts-with(., 'mainprac')]) and not(ancestor::book[contains(@doctype,'oh')] and ancestor::ata-page-block/@pb-name[starts-with(., 'inspect')]) and not(ancestor::book[contains(@doctype,'oh')] and ancestor::page-block/@pb-name[starts-with(., 'inspect')]) and not(ancestor::ata-page-block/@pb-name[(starts-with(., 'di') and 'di' = translate(., '0123456789', '') and string-length(.) &gt; 2) or starts-with(.,'service')]) and not(ancestor::page-block/@pb-name[(starts-with(., 'di') and 'di' = translate(., '0123456789', '') and string-length(.) &gt; 2) or starts-with(.,'service')]) and not(ancestor::book[contains(@doctype,'oh')] and ancestor::ata-page-block/@pb-name[starts-with(., 'repair')]) and not(ancestor::book[contains(@doctype,'oh')] and ancestor::page-block/@pb-name[starts-with(., 'repair')]) and not(ancestor::ata-page-block/@pb-name[(starts-with(., 'cl') and 'cl' = translate(., '0123456789', '') and string-length(.) &gt; 2) or .='install' or starts-with(.,'rem-inst') or (starts-with(., 'reminst') and 'reminst' = translate(., '0123456789', '') and string-length(.) &gt; 7) or .='remove' or (starts-with(., 'repair') and 'repair' = translate(., '0123456789', '') and string-length(.) &gt; 6)]) and not(ancestor::page-block/@pb-name[(starts-with(., 'cl') and 'cl' = translate(., '0123456789', '') and string-length(.) &gt; 2) or .='install' or starts-with(.,'rem-inst') or (starts-with(., 'reminst') and 'reminst' = translate(., '0123456789', '') and string-length(.) &gt; 7) or .='remove' or (starts-with(., 'repair') and 'repair' = translate(., '0123456789', '') and string-length(.) &gt; 6)]) and not(ancestor::ata-page-block/@pb-name[starts-with(., 'assy') or (starts-with(., 'ic') and 'ic' = translate(., '0123456789', '') and string-length(.) &gt; 2) or (starts-with(., 'te') and 'te' = translate(., '0123456789', '') and string-length(.) &gt; 2) or .='test']) and not(ancestor::page-block/@pb-name[starts-with(., 'assy') or (starts-with(., 'ic') and 'ic' = translate(., '0123456789', '') and string-length(.) &gt; 2) or (starts-with(., 'te') and 'te' = translate(., '0123456789', '') and string-length(.) &gt; 2) or .='test']) and not(ancestor::ata-page-block/@pb-name[.='f-and-c' or starts-with(., 'inspect') or (starts-with(., 're') and 're' = translate(., '0123456789', '') and string-length(.) &gt; 2)]) and not(ancestor::page-block/@pb-name[.='f-and-c' or starts-with(., 'inspect') or (starts-with(., 're') and 're' = translate(., '0123456789', '') and string-length(.) &gt; 2)]) and not(ancestor::ata-page-block/@pb-name[(starts-with(., 'as') and 'as' = translate(., '0123456789', '') and string-length(.) &gt; 2) or starts-with(.,'clean') or (starts-with(., 'test') and 'test' = translate(., '0123456789', '') and string-length(.) &gt; 4)]) and not(ancestor::page-block/@pb-name[(starts-with(., 'as') and 'as' = translate(., '0123456789', '') and string-length(.) &gt; 2) or starts-with(.,'clean') or (starts-with(., 'test') and 'test' = translate(., '0123456789', '') and string-length(.) &gt; 4)]) and not(ancestor::ata-page-block/@pb-name[(starts-with(., 'fc') and 'fc' = translate(., '0123456789', '') and string-length(.) &gt; 2) or starts-with(.,'repair') or .='trouble']) and (ancestor::page-block/@pb-name[(starts-with(., 'fc') and 'fc' = translate(., '0123456789', '') and string-length(.) &gt; 2) or starts-with(.,'repair') or .='trouble'])">
            <!-- Condition #33-->
            <xsl:if test="not(@_gte:Gentext-Expanded)">
               <_sfe:BeforeOrAfterText>Table <_gte:styler_numbering>
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
         </xsl:when>
         <xsl:when test="not(ancestor::book[contains(@doctype,'cir') or contains(@doctype,'em') or contains(@doctype,'tmm')]) and not(ancestor::book[contains(@doctype,'oh')] and ancestor::ata-page-block/@pb-name[.='service']) and not(ancestor::book[contains(@doctype,'oh')] and ancestor::page-block/@pb-name[.='service']) and not(ancestor::ata-page-block/@pb-name[.='00awl' or .='00intro' or .='airlim' or .='awl' or .='awlror' or .='chapsect' or .='consume' or .='d-and-o' or .='frontmatte' or .='howtouse' or .='00howtouse' or .='intro' or .='nut_option' or .='oplimits' or .='sblist' or .='schedchk' or .='spectool' or .='timelim' or .='title-page']) and not(ancestor::page-block/@pb-name[.='00awl' or .='00intro' or .='airlim' or .='awl' or .='awlror' or .='chapsect' or .='consume' or .='d-and-o' or .='frontmatte' or .='howtouse' or .='00howtouse' or .='intro' or .='nut_option' or .='oplimits' or .='sblist' or .='schedchk' or .='spectool' or .='timelim' or .='title-page']) and not(ancestor::ata-page-block/@pb-name[(starts-with(., 'do') and 'do' = translate(., '0123456789', '') and string-length(.) &gt; 2) or (starts-with(., 'in') and 'in' = translate(., '0123456789', '') and string-length(.) &gt; 2) or (starts-with(., 'tl') and 'tl' = translate(., '0123456789', '') and string-length(.) &gt; 2) or .='toolsht' or .='trlist' or .='unschedc' or .='unschedchk']) and not(ancestor::page-block/@pb-name[(starts-with(., 'do') and 'do' = translate(., '0123456789', '') and string-length(.) &gt; 2) or (starts-with(., 'in') and 'in' = translate(., '0123456789', '') and string-length(.) &gt; 2) or (starts-with(., 'tl') and 'tl' = translate(., '0123456789', '') and string-length(.) &gt; 2) or .='toolsht' or .='trlist' or .='unschedc' or .='unschedchk']) and not(ancestor-or-self::ata-page-block[1]/@pb-name and string(ancestor-or-self::ata-page-block[1]/@pb-name)='intro00') and not(ancestor-or-self::page-block[1]/@pb-name and string(ancestor-or-self::page-block[1]/@pb-name)='intro00') and not(ancestor::ata-page-block/@pb-name[starts-with(., 'disassy') or starts-with(., 'fault')]) and not(ancestor::page-block/@pb-name[starts-with(., 'disassy') or starts-with(., 'fault')]) and not(ancestor::book[contains(@doctype,'oh')] and ancestor::ata-page-block/@pb-name[starts-with(., 'clean')]) and not(ancestor::book[contains(@doctype,'oh')] and ancestor::page-block/@pb-name[starts-with(., 'clean')]) and not(ancestor::ata-page-block/@pb-name[starts-with(., 'mainprac')]) and not(ancestor::page-block/@pb-name[starts-with(., 'mainprac')]) and not(ancestor::book[contains(@doctype,'oh')] and ancestor::ata-page-block/@pb-name[starts-with(., 'inspect')]) and not(ancestor::book[contains(@doctype,'oh')] and ancestor::page-block/@pb-name[starts-with(., 'inspect')]) and not(ancestor::ata-page-block/@pb-name[(starts-with(., 'di') and 'di' = translate(., '0123456789', '') and string-length(.) &gt; 2) or starts-with(.,'service')]) and not(ancestor::page-block/@pb-name[(starts-with(., 'di') and 'di' = translate(., '0123456789', '') and string-length(.) &gt; 2) or starts-with(.,'service')]) and not(ancestor::book[contains(@doctype,'oh')] and ancestor::ata-page-block/@pb-name[starts-with(., 'repair')]) and not(ancestor::book[contains(@doctype,'oh')] and ancestor::page-block/@pb-name[starts-with(., 'repair')]) and not(ancestor::ata-page-block/@pb-name[(starts-with(., 'cl') and 'cl' = translate(., '0123456789', '') and string-length(.) &gt; 2) or .='install' or starts-with(.,'rem-inst') or (starts-with(., 'reminst') and 'reminst' = translate(., '0123456789', '') and string-length(.) &gt; 7) or .='remove' or (starts-with(., 'repair') and 'repair' = translate(., '0123456789', '') and string-length(.) &gt; 6)]) and not(ancestor::page-block/@pb-name[(starts-with(., 'cl') and 'cl' = translate(., '0123456789', '') and string-length(.) &gt; 2) or .='install' or starts-with(.,'rem-inst') or (starts-with(., 'reminst') and 'reminst' = translate(., '0123456789', '') and string-length(.) &gt; 7) or .='remove' or (starts-with(., 'repair') and 'repair' = translate(., '0123456789', '') and string-length(.) &gt; 6)]) and not(ancestor::ata-page-block/@pb-name[starts-with(., 'assy') or (starts-with(., 'ic') and 'ic' = translate(., '0123456789', '') and string-length(.) &gt; 2) or (starts-with(., 'te') and 'te' = translate(., '0123456789', '') and string-length(.) &gt; 2) or .='test']) and not(ancestor::page-block/@pb-name[starts-with(., 'assy') or (starts-with(., 'ic') and 'ic' = translate(., '0123456789', '') and string-length(.) &gt; 2) or (starts-with(., 'te') and 'te' = translate(., '0123456789', '') and string-length(.) &gt; 2) or .='test']) and not(ancestor::ata-page-block/@pb-name[.='f-and-c' or starts-with(., 'inspect') or (starts-with(., 're') and 're' = translate(., '0123456789', '') and string-length(.) &gt; 2)]) and not(ancestor::page-block/@pb-name[.='f-and-c' or starts-with(., 'inspect') or (starts-with(., 're') and 're' = translate(., '0123456789', '') and string-length(.) &gt; 2)]) and not(ancestor::ata-page-block/@pb-name[(starts-with(., 'as') and 'as' = translate(., '0123456789', '') and string-length(.) &gt; 2) or starts-with(.,'clean') or (starts-with(., 'test') and 'test' = translate(., '0123456789', '') and string-length(.) &gt; 4)]) and not(ancestor::page-block/@pb-name[(starts-with(., 'as') and 'as' = translate(., '0123456789', '') and string-length(.) &gt; 2) or starts-with(.,'clean') or (starts-with(., 'test') and 'test' = translate(., '0123456789', '') and string-length(.) &gt; 4)]) and (ancestor::ata-page-block/@pb-name[(starts-with(., 'fc') and 'fc' = translate(., '0123456789', '') and string-length(.) &gt; 2) or starts-with(.,'repair') or .='trouble'])">
            <!-- Condition #32-->
            <xsl:if test="not(@_gte:Gentext-Expanded)">
               <_sfe:BeforeOrAfterText>Table <_gte:styler_numbering>
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
         </xsl:when>
         <xsl:when test="not(ancestor::book[contains(@doctype,'cir') or contains(@doctype,'em') or contains(@doctype,'tmm')]) and not(ancestor::book[contains(@doctype,'oh')] and ancestor::ata-page-block/@pb-name[.='service']) and not(ancestor::book[contains(@doctype,'oh')] and ancestor::page-block/@pb-name[.='service']) and not(ancestor::ata-page-block/@pb-name[.='00awl' or .='00intro' or .='airlim' or .='awl' or .='awlror' or .='chapsect' or .='consume' or .='d-and-o' or .='frontmatte' or .='howtouse' or .='00howtouse' or .='intro' or .='nut_option' or .='oplimits' or .='sblist' or .='schedchk' or .='spectool' or .='timelim' or .='title-page']) and not(ancestor::page-block/@pb-name[.='00awl' or .='00intro' or .='airlim' or .='awl' or .='awlror' or .='chapsect' or .='consume' or .='d-and-o' or .='frontmatte' or .='howtouse' or .='00howtouse' or .='intro' or .='nut_option' or .='oplimits' or .='sblist' or .='schedchk' or .='spectool' or .='timelim' or .='title-page']) and not(ancestor::ata-page-block/@pb-name[(starts-with(., 'do') and 'do' = translate(., '0123456789', '') and string-length(.) &gt; 2) or (starts-with(., 'in') and 'in' = translate(., '0123456789', '') and string-length(.) &gt; 2) or (starts-with(., 'tl') and 'tl' = translate(., '0123456789', '') and string-length(.) &gt; 2) or .='toolsht' or .='trlist' or .='unschedc' or .='unschedchk']) and not(ancestor::page-block/@pb-name[(starts-with(., 'do') and 'do' = translate(., '0123456789', '') and string-length(.) &gt; 2) or (starts-with(., 'in') and 'in' = translate(., '0123456789', '') and string-length(.) &gt; 2) or (starts-with(., 'tl') and 'tl' = translate(., '0123456789', '') and string-length(.) &gt; 2) or .='toolsht' or .='trlist' or .='unschedc' or .='unschedchk']) and not(ancestor-or-self::ata-page-block[1]/@pb-name and string(ancestor-or-self::ata-page-block[1]/@pb-name)='intro00') and not(ancestor-or-self::page-block[1]/@pb-name and string(ancestor-or-self::page-block[1]/@pb-name)='intro00') and not(ancestor::ata-page-block/@pb-name[starts-with(., 'disassy') or starts-with(., 'fault')]) and not(ancestor::page-block/@pb-name[starts-with(., 'disassy') or starts-with(., 'fault')]) and not(ancestor::book[contains(@doctype,'oh')] and ancestor::ata-page-block/@pb-name[starts-with(., 'clean')]) and not(ancestor::book[contains(@doctype,'oh')] and ancestor::page-block/@pb-name[starts-with(., 'clean')]) and not(ancestor::ata-page-block/@pb-name[starts-with(., 'mainprac')]) and not(ancestor::page-block/@pb-name[starts-with(., 'mainprac')]) and not(ancestor::book[contains(@doctype,'oh')] and ancestor::ata-page-block/@pb-name[starts-with(., 'inspect')]) and not(ancestor::book[contains(@doctype,'oh')] and ancestor::page-block/@pb-name[starts-with(., 'inspect')]) and not(ancestor::ata-page-block/@pb-name[(starts-with(., 'di') and 'di' = translate(., '0123456789', '') and string-length(.) &gt; 2) or starts-with(.,'service')]) and not(ancestor::page-block/@pb-name[(starts-with(., 'di') and 'di' = translate(., '0123456789', '') and string-length(.) &gt; 2) or starts-with(.,'service')]) and not(ancestor::book[contains(@doctype,'oh')] and ancestor::ata-page-block/@pb-name[starts-with(., 'repair')]) and not(ancestor::book[contains(@doctype,'oh')] and ancestor::page-block/@pb-name[starts-with(., 'repair')]) and not(ancestor::ata-page-block/@pb-name[(starts-with(., 'cl') and 'cl' = translate(., '0123456789', '') and string-length(.) &gt; 2) or .='install' or starts-with(.,'rem-inst') or (starts-with(., 'reminst') and 'reminst' = translate(., '0123456789', '') and string-length(.) &gt; 7) or .='remove' or (starts-with(., 'repair') and 'repair' = translate(., '0123456789', '') and string-length(.) &gt; 6)]) and not(ancestor::page-block/@pb-name[(starts-with(., 'cl') and 'cl' = translate(., '0123456789', '') and string-length(.) &gt; 2) or .='install' or starts-with(.,'rem-inst') or (starts-with(., 'reminst') and 'reminst' = translate(., '0123456789', '') and string-length(.) &gt; 7) or .='remove' or (starts-with(., 'repair') and 'repair' = translate(., '0123456789', '') and string-length(.) &gt; 6)]) and not(ancestor::ata-page-block/@pb-name[starts-with(., 'assy') or (starts-with(., 'ic') and 'ic' = translate(., '0123456789', '') and string-length(.) &gt; 2) or (starts-with(., 'te') and 'te' = translate(., '0123456789', '') and string-length(.) &gt; 2) or .='test']) and not(ancestor::page-block/@pb-name[starts-with(., 'assy') or (starts-with(., 'ic') and 'ic' = translate(., '0123456789', '') and string-length(.) &gt; 2) or (starts-with(., 'te') and 'te' = translate(., '0123456789', '') and string-length(.) &gt; 2) or .='test']) and not(ancestor::ata-page-block/@pb-name[.='f-and-c' or starts-with(., 'inspect') or (starts-with(., 're') and 're' = translate(., '0123456789', '') and string-length(.) &gt; 2)]) and not(ancestor::page-block/@pb-name[.='f-and-c' or starts-with(., 'inspect') or (starts-with(., 're') and 're' = translate(., '0123456789', '') and string-length(.) &gt; 2)]) and not(ancestor::ata-page-block/@pb-name[(starts-with(., 'as') and 'as' = translate(., '0123456789', '') and string-length(.) &gt; 2) or starts-with(.,'clean') or (starts-with(., 'test') and 'test' = translate(., '0123456789', '') and string-length(.) &gt; 4)]) and (ancestor::page-block/@pb-name[(starts-with(., 'as') and 'as' = translate(., '0123456789', '') and string-length(.) &gt; 2) or starts-with(.,'clean') or (starts-with(., 'test') and 'test' = translate(., '0123456789', '') and string-length(.) &gt; 4)])">
            <!-- Condition #31-->
            <xsl:if test="not(@_gte:Gentext-Expanded)">
               <_sfe:BeforeOrAfterText>Table <_gte:styler_numbering>
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
         </xsl:when>
         <xsl:when test="not(ancestor::book[contains(@doctype,'cir') or contains(@doctype,'em') or contains(@doctype,'tmm')]) and not(ancestor::book[contains(@doctype,'oh')] and ancestor::ata-page-block/@pb-name[.='service']) and not(ancestor::book[contains(@doctype,'oh')] and ancestor::page-block/@pb-name[.='service']) and not(ancestor::ata-page-block/@pb-name[.='00awl' or .='00intro' or .='airlim' or .='awl' or .='awlror' or .='chapsect' or .='consume' or .='d-and-o' or .='frontmatte' or .='howtouse' or .='00howtouse' or .='intro' or .='nut_option' or .='oplimits' or .='sblist' or .='schedchk' or .='spectool' or .='timelim' or .='title-page']) and not(ancestor::page-block/@pb-name[.='00awl' or .='00intro' or .='airlim' or .='awl' or .='awlror' or .='chapsect' or .='consume' or .='d-and-o' or .='frontmatte' or .='howtouse' or .='00howtouse' or .='intro' or .='nut_option' or .='oplimits' or .='sblist' or .='schedchk' or .='spectool' or .='timelim' or .='title-page']) and not(ancestor::ata-page-block/@pb-name[(starts-with(., 'do') and 'do' = translate(., '0123456789', '') and string-length(.) &gt; 2) or (starts-with(., 'in') and 'in' = translate(., '0123456789', '') and string-length(.) &gt; 2) or (starts-with(., 'tl') and 'tl' = translate(., '0123456789', '') and string-length(.) &gt; 2) or .='toolsht' or .='trlist' or .='unschedc' or .='unschedchk']) and not(ancestor::page-block/@pb-name[(starts-with(., 'do') and 'do' = translate(., '0123456789', '') and string-length(.) &gt; 2) or (starts-with(., 'in') and 'in' = translate(., '0123456789', '') and string-length(.) &gt; 2) or (starts-with(., 'tl') and 'tl' = translate(., '0123456789', '') and string-length(.) &gt; 2) or .='toolsht' or .='trlist' or .='unschedc' or .='unschedchk']) and not(ancestor-or-self::ata-page-block[1]/@pb-name and string(ancestor-or-self::ata-page-block[1]/@pb-name)='intro00') and not(ancestor-or-self::page-block[1]/@pb-name and string(ancestor-or-self::page-block[1]/@pb-name)='intro00') and not(ancestor::ata-page-block/@pb-name[starts-with(., 'disassy') or starts-with(., 'fault')]) and not(ancestor::page-block/@pb-name[starts-with(., 'disassy') or starts-with(., 'fault')]) and not(ancestor::book[contains(@doctype,'oh')] and ancestor::ata-page-block/@pb-name[starts-with(., 'clean')]) and not(ancestor::book[contains(@doctype,'oh')] and ancestor::page-block/@pb-name[starts-with(., 'clean')]) and not(ancestor::ata-page-block/@pb-name[starts-with(., 'mainprac')]) and not(ancestor::page-block/@pb-name[starts-with(., 'mainprac')]) and not(ancestor::book[contains(@doctype,'oh')] and ancestor::ata-page-block/@pb-name[starts-with(., 'inspect')]) and not(ancestor::book[contains(@doctype,'oh')] and ancestor::page-block/@pb-name[starts-with(., 'inspect')]) and not(ancestor::ata-page-block/@pb-name[(starts-with(., 'di') and 'di' = translate(., '0123456789', '') and string-length(.) &gt; 2) or starts-with(.,'service')]) and not(ancestor::page-block/@pb-name[(starts-with(., 'di') and 'di' = translate(., '0123456789', '') and string-length(.) &gt; 2) or starts-with(.,'service')]) and not(ancestor::book[contains(@doctype,'oh')] and ancestor::ata-page-block/@pb-name[starts-with(., 'repair')]) and not(ancestor::book[contains(@doctype,'oh')] and ancestor::page-block/@pb-name[starts-with(., 'repair')]) and not(ancestor::ata-page-block/@pb-name[(starts-with(., 'cl') and 'cl' = translate(., '0123456789', '') and string-length(.) &gt; 2) or .='install' or starts-with(.,'rem-inst') or (starts-with(., 'reminst') and 'reminst' = translate(., '0123456789', '') and string-length(.) &gt; 7) or .='remove' or (starts-with(., 'repair') and 'repair' = translate(., '0123456789', '') and string-length(.) &gt; 6)]) and not(ancestor::page-block/@pb-name[(starts-with(., 'cl') and 'cl' = translate(., '0123456789', '') and string-length(.) &gt; 2) or .='install' or starts-with(.,'rem-inst') or (starts-with(., 'reminst') and 'reminst' = translate(., '0123456789', '') and string-length(.) &gt; 7) or .='remove' or (starts-with(., 'repair') and 'repair' = translate(., '0123456789', '') and string-length(.) &gt; 6)]) and not(ancestor::ata-page-block/@pb-name[starts-with(., 'assy') or (starts-with(., 'ic') and 'ic' = translate(., '0123456789', '') and string-length(.) &gt; 2) or (starts-with(., 'te') and 'te' = translate(., '0123456789', '') and string-length(.) &gt; 2) or .='test']) and not(ancestor::page-block/@pb-name[starts-with(., 'assy') or (starts-with(., 'ic') and 'ic' = translate(., '0123456789', '') and string-length(.) &gt; 2) or (starts-with(., 'te') and 'te' = translate(., '0123456789', '') and string-length(.) &gt; 2) or .='test']) and not(ancestor::ata-page-block/@pb-name[.='f-and-c' or starts-with(., 'inspect') or (starts-with(., 're') and 're' = translate(., '0123456789', '') and string-length(.) &gt; 2)]) and not(ancestor::page-block/@pb-name[.='f-and-c' or starts-with(., 'inspect') or (starts-with(., 're') and 're' = translate(., '0123456789', '') and string-length(.) &gt; 2)]) and (ancestor::ata-page-block/@pb-name[(starts-with(., 'as') and 'as' = translate(., '0123456789', '') and string-length(.) &gt; 2) or starts-with(.,'clean') or (starts-with(., 'test') and 'test' = translate(., '0123456789', '') and string-length(.) &gt; 4)])">
            <!-- Condition #30-->
            <xsl:if test="not(@_gte:Gentext-Expanded)">
               <_sfe:BeforeOrAfterText>Table <_gte:styler_numbering>
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
         </xsl:when>
         <xsl:when test="not(ancestor::book[contains(@doctype,'cir') or contains(@doctype,'em') or contains(@doctype,'tmm')]) and not(ancestor::book[contains(@doctype,'oh')] and ancestor::ata-page-block/@pb-name[.='service']) and not(ancestor::book[contains(@doctype,'oh')] and ancestor::page-block/@pb-name[.='service']) and not(ancestor::ata-page-block/@pb-name[.='00awl' or .='00intro' or .='airlim' or .='awl' or .='awlror' or .='chapsect' or .='consume' or .='d-and-o' or .='frontmatte' or .='howtouse' or .='00howtouse' or .='intro' or .='nut_option' or .='oplimits' or .='sblist' or .='schedchk' or .='spectool' or .='timelim' or .='title-page']) and not(ancestor::page-block/@pb-name[.='00awl' or .='00intro' or .='airlim' or .='awl' or .='awlror' or .='chapsect' or .='consume' or .='d-and-o' or .='frontmatte' or .='howtouse' or .='00howtouse' or .='intro' or .='nut_option' or .='oplimits' or .='sblist' or .='schedchk' or .='spectool' or .='timelim' or .='title-page']) and not(ancestor::ata-page-block/@pb-name[(starts-with(., 'do') and 'do' = translate(., '0123456789', '') and string-length(.) &gt; 2) or (starts-with(., 'in') and 'in' = translate(., '0123456789', '') and string-length(.) &gt; 2) or (starts-with(., 'tl') and 'tl' = translate(., '0123456789', '') and string-length(.) &gt; 2) or .='toolsht' or .='trlist' or .='unschedc' or .='unschedchk']) and not(ancestor::page-block/@pb-name[(starts-with(., 'do') and 'do' = translate(., '0123456789', '') and string-length(.) &gt; 2) or (starts-with(., 'in') and 'in' = translate(., '0123456789', '') and string-length(.) &gt; 2) or (starts-with(., 'tl') and 'tl' = translate(., '0123456789', '') and string-length(.) &gt; 2) or .='toolsht' or .='trlist' or .='unschedc' or .='unschedchk']) and not(ancestor-or-self::ata-page-block[1]/@pb-name and string(ancestor-or-self::ata-page-block[1]/@pb-name)='intro00') and not(ancestor-or-self::page-block[1]/@pb-name and string(ancestor-or-self::page-block[1]/@pb-name)='intro00') and not(ancestor::ata-page-block/@pb-name[starts-with(., 'disassy') or starts-with(., 'fault')]) and not(ancestor::page-block/@pb-name[starts-with(., 'disassy') or starts-with(., 'fault')]) and not(ancestor::book[contains(@doctype,'oh')] and ancestor::ata-page-block/@pb-name[starts-with(., 'clean')]) and not(ancestor::book[contains(@doctype,'oh')] and ancestor::page-block/@pb-name[starts-with(., 'clean')]) and not(ancestor::ata-page-block/@pb-name[starts-with(., 'mainprac')]) and not(ancestor::page-block/@pb-name[starts-with(., 'mainprac')]) and not(ancestor::book[contains(@doctype,'oh')] and ancestor::ata-page-block/@pb-name[starts-with(., 'inspect')]) and not(ancestor::book[contains(@doctype,'oh')] and ancestor::page-block/@pb-name[starts-with(., 'inspect')]) and not(ancestor::ata-page-block/@pb-name[(starts-with(., 'di') and 'di' = translate(., '0123456789', '') and string-length(.) &gt; 2) or starts-with(.,'service')]) and not(ancestor::page-block/@pb-name[(starts-with(., 'di') and 'di' = translate(., '0123456789', '') and string-length(.) &gt; 2) or starts-with(.,'service')]) and not(ancestor::book[contains(@doctype,'oh')] and ancestor::ata-page-block/@pb-name[starts-with(., 'repair')]) and not(ancestor::book[contains(@doctype,'oh')] and ancestor::page-block/@pb-name[starts-with(., 'repair')]) and not(ancestor::ata-page-block/@pb-name[(starts-with(., 'cl') and 'cl' = translate(., '0123456789', '') and string-length(.) &gt; 2) or .='install' or starts-with(.,'rem-inst') or (starts-with(., 'reminst') and 'reminst' = translate(., '0123456789', '') and string-length(.) &gt; 7) or .='remove' or (starts-with(., 'repair') and 'repair' = translate(., '0123456789', '') and string-length(.) &gt; 6)]) and not(ancestor::page-block/@pb-name[(starts-with(., 'cl') and 'cl' = translate(., '0123456789', '') and string-length(.) &gt; 2) or .='install' or starts-with(.,'rem-inst') or (starts-with(., 'reminst') and 'reminst' = translate(., '0123456789', '') and string-length(.) &gt; 7) or .='remove' or (starts-with(., 'repair') and 'repair' = translate(., '0123456789', '') and string-length(.) &gt; 6)]) and not(ancestor::ata-page-block/@pb-name[starts-with(., 'assy') or (starts-with(., 'ic') and 'ic' = translate(., '0123456789', '') and string-length(.) &gt; 2) or (starts-with(., 'te') and 'te' = translate(., '0123456789', '') and string-length(.) &gt; 2) or .='test']) and not(ancestor::page-block/@pb-name[starts-with(., 'assy') or (starts-with(., 'ic') and 'ic' = translate(., '0123456789', '') and string-length(.) &gt; 2) or (starts-with(., 'te') and 'te' = translate(., '0123456789', '') and string-length(.) &gt; 2) or .='test']) and not(ancestor::ata-page-block/@pb-name[.='f-and-c' or starts-with(., 'inspect') or (starts-with(., 're') and 're' = translate(., '0123456789', '') and string-length(.) &gt; 2)]) and (ancestor::page-block/@pb-name[.='f-and-c' or starts-with(., 'inspect') or (starts-with(., 're') and 're' = translate(., '0123456789', '') and string-length(.) &gt; 2)])">
            <!-- Condition #29-->
            <xsl:if test="not(@_gte:Gentext-Expanded)">
               <_sfe:BeforeOrAfterText>Table <_gte:styler_numbering>
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
         </xsl:when>
         <xsl:when test="not(ancestor::book[contains(@doctype,'cir') or contains(@doctype,'em') or contains(@doctype,'tmm')]) and not(ancestor::book[contains(@doctype,'oh')] and ancestor::ata-page-block/@pb-name[.='service']) and not(ancestor::book[contains(@doctype,'oh')] and ancestor::page-block/@pb-name[.='service']) and not(ancestor::ata-page-block/@pb-name[.='00awl' or .='00intro' or .='airlim' or .='awl' or .='awlror' or .='chapsect' or .='consume' or .='d-and-o' or .='frontmatte' or .='howtouse' or .='00howtouse' or .='intro' or .='nut_option' or .='oplimits' or .='sblist' or .='schedchk' or .='spectool' or .='timelim' or .='title-page']) and not(ancestor::page-block/@pb-name[.='00awl' or .='00intro' or .='airlim' or .='awl' or .='awlror' or .='chapsect' or .='consume' or .='d-and-o' or .='frontmatte' or .='howtouse' or .='00howtouse' or .='intro' or .='nut_option' or .='oplimits' or .='sblist' or .='schedchk' or .='spectool' or .='timelim' or .='title-page']) and not(ancestor::ata-page-block/@pb-name[(starts-with(., 'do') and 'do' = translate(., '0123456789', '') and string-length(.) &gt; 2) or (starts-with(., 'in') and 'in' = translate(., '0123456789', '') and string-length(.) &gt; 2) or (starts-with(., 'tl') and 'tl' = translate(., '0123456789', '') and string-length(.) &gt; 2) or .='toolsht' or .='trlist' or .='unschedc' or .='unschedchk']) and not(ancestor::page-block/@pb-name[(starts-with(., 'do') and 'do' = translate(., '0123456789', '') and string-length(.) &gt; 2) or (starts-with(., 'in') and 'in' = translate(., '0123456789', '') and string-length(.) &gt; 2) or (starts-with(., 'tl') and 'tl' = translate(., '0123456789', '') and string-length(.) &gt; 2) or .='toolsht' or .='trlist' or .='unschedc' or .='unschedchk']) and not(ancestor-or-self::ata-page-block[1]/@pb-name and string(ancestor-or-self::ata-page-block[1]/@pb-name)='intro00') and not(ancestor-or-self::page-block[1]/@pb-name and string(ancestor-or-self::page-block[1]/@pb-name)='intro00') and not(ancestor::ata-page-block/@pb-name[starts-with(., 'disassy') or starts-with(., 'fault')]) and not(ancestor::page-block/@pb-name[starts-with(., 'disassy') or starts-with(., 'fault')]) and not(ancestor::book[contains(@doctype,'oh')] and ancestor::ata-page-block/@pb-name[starts-with(., 'clean')]) and not(ancestor::book[contains(@doctype,'oh')] and ancestor::page-block/@pb-name[starts-with(., 'clean')]) and not(ancestor::ata-page-block/@pb-name[starts-with(., 'mainprac')]) and not(ancestor::page-block/@pb-name[starts-with(., 'mainprac')]) and not(ancestor::book[contains(@doctype,'oh')] and ancestor::ata-page-block/@pb-name[starts-with(., 'inspect')]) and not(ancestor::book[contains(@doctype,'oh')] and ancestor::page-block/@pb-name[starts-with(., 'inspect')]) and not(ancestor::ata-page-block/@pb-name[(starts-with(., 'di') and 'di' = translate(., '0123456789', '') and string-length(.) &gt; 2) or starts-with(.,'service')]) and not(ancestor::page-block/@pb-name[(starts-with(., 'di') and 'di' = translate(., '0123456789', '') and string-length(.) &gt; 2) or starts-with(.,'service')]) and not(ancestor::book[contains(@doctype,'oh')] and ancestor::ata-page-block/@pb-name[starts-with(., 'repair')]) and not(ancestor::book[contains(@doctype,'oh')] and ancestor::page-block/@pb-name[starts-with(., 'repair')]) and not(ancestor::ata-page-block/@pb-name[(starts-with(., 'cl') and 'cl' = translate(., '0123456789', '') and string-length(.) &gt; 2) or .='install' or starts-with(.,'rem-inst') or (starts-with(., 'reminst') and 'reminst' = translate(., '0123456789', '') and string-length(.) &gt; 7) or .='remove' or (starts-with(., 'repair') and 'repair' = translate(., '0123456789', '') and string-length(.) &gt; 6)]) and not(ancestor::page-block/@pb-name[(starts-with(., 'cl') and 'cl' = translate(., '0123456789', '') and string-length(.) &gt; 2) or .='install' or starts-with(.,'rem-inst') or (starts-with(., 'reminst') and 'reminst' = translate(., '0123456789', '') and string-length(.) &gt; 7) or .='remove' or (starts-with(., 'repair') and 'repair' = translate(., '0123456789', '') and string-length(.) &gt; 6)]) and not(ancestor::ata-page-block/@pb-name[starts-with(., 'assy') or (starts-with(., 'ic') and 'ic' = translate(., '0123456789', '') and string-length(.) &gt; 2) or (starts-with(., 'te') and 'te' = translate(., '0123456789', '') and string-length(.) &gt; 2) or .='test']) and not(ancestor::page-block/@pb-name[starts-with(., 'assy') or (starts-with(., 'ic') and 'ic' = translate(., '0123456789', '') and string-length(.) &gt; 2) or (starts-with(., 'te') and 'te' = translate(., '0123456789', '') and string-length(.) &gt; 2) or .='test']) and (ancestor::ata-page-block/@pb-name[.='f-and-c' or starts-with(., 'inspect') or (starts-with(., 're') and 're' = translate(., '0123456789', '') and string-length(.) &gt; 2)])">
            <!-- Condition #28-->
            <xsl:if test="not(@_gte:Gentext-Expanded)">
               <_sfe:BeforeOrAfterText>Table <_gte:styler_numbering>
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
         </xsl:when>
         <xsl:when test="not(ancestor::book[contains(@doctype,'cir') or contains(@doctype,'em') or contains(@doctype,'tmm')]) and not(ancestor::book[contains(@doctype,'oh')] and ancestor::ata-page-block/@pb-name[.='service']) and not(ancestor::book[contains(@doctype,'oh')] and ancestor::page-block/@pb-name[.='service']) and not(ancestor::ata-page-block/@pb-name[.='00awl' or .='00intro' or .='airlim' or .='awl' or .='awlror' or .='chapsect' or .='consume' or .='d-and-o' or .='frontmatte' or .='howtouse' or .='00howtouse' or .='intro' or .='nut_option' or .='oplimits' or .='sblist' or .='schedchk' or .='spectool' or .='timelim' or .='title-page']) and not(ancestor::page-block/@pb-name[.='00awl' or .='00intro' or .='airlim' or .='awl' or .='awlror' or .='chapsect' or .='consume' or .='d-and-o' or .='frontmatte' or .='howtouse' or .='00howtouse' or .='intro' or .='nut_option' or .='oplimits' or .='sblist' or .='schedchk' or .='spectool' or .='timelim' or .='title-page']) and not(ancestor::ata-page-block/@pb-name[(starts-with(., 'do') and 'do' = translate(., '0123456789', '') and string-length(.) &gt; 2) or (starts-with(., 'in') and 'in' = translate(., '0123456789', '') and string-length(.) &gt; 2) or (starts-with(., 'tl') and 'tl' = translate(., '0123456789', '') and string-length(.) &gt; 2) or .='toolsht' or .='trlist' or .='unschedc' or .='unschedchk']) and not(ancestor::page-block/@pb-name[(starts-with(., 'do') and 'do' = translate(., '0123456789', '') and string-length(.) &gt; 2) or (starts-with(., 'in') and 'in' = translate(., '0123456789', '') and string-length(.) &gt; 2) or (starts-with(., 'tl') and 'tl' = translate(., '0123456789', '') and string-length(.) &gt; 2) or .='toolsht' or .='trlist' or .='unschedc' or .='unschedchk']) and not(ancestor-or-self::ata-page-block[1]/@pb-name and string(ancestor-or-self::ata-page-block[1]/@pb-name)='intro00') and not(ancestor-or-self::page-block[1]/@pb-name and string(ancestor-or-self::page-block[1]/@pb-name)='intro00') and not(ancestor::ata-page-block/@pb-name[starts-with(., 'disassy') or starts-with(., 'fault')]) and not(ancestor::page-block/@pb-name[starts-with(., 'disassy') or starts-with(., 'fault')]) and not(ancestor::book[contains(@doctype,'oh')] and ancestor::ata-page-block/@pb-name[starts-with(., 'clean')]) and not(ancestor::book[contains(@doctype,'oh')] and ancestor::page-block/@pb-name[starts-with(., 'clean')]) and not(ancestor::ata-page-block/@pb-name[starts-with(., 'mainprac')]) and not(ancestor::page-block/@pb-name[starts-with(., 'mainprac')]) and not(ancestor::book[contains(@doctype,'oh')] and ancestor::ata-page-block/@pb-name[starts-with(., 'inspect')]) and not(ancestor::book[contains(@doctype,'oh')] and ancestor::page-block/@pb-name[starts-with(., 'inspect')]) and not(ancestor::ata-page-block/@pb-name[(starts-with(., 'di') and 'di' = translate(., '0123456789', '') and string-length(.) &gt; 2) or starts-with(.,'service')]) and not(ancestor::page-block/@pb-name[(starts-with(., 'di') and 'di' = translate(., '0123456789', '') and string-length(.) &gt; 2) or starts-with(.,'service')]) and not(ancestor::book[contains(@doctype,'oh')] and ancestor::ata-page-block/@pb-name[starts-with(., 'repair')]) and not(ancestor::book[contains(@doctype,'oh')] and ancestor::page-block/@pb-name[starts-with(., 'repair')]) and not(ancestor::ata-page-block/@pb-name[(starts-with(., 'cl') and 'cl' = translate(., '0123456789', '') and string-length(.) &gt; 2) or .='install' or starts-with(.,'rem-inst') or (starts-with(., 'reminst') and 'reminst' = translate(., '0123456789', '') and string-length(.) &gt; 7) or .='remove' or (starts-with(., 'repair') and 'repair' = translate(., '0123456789', '') and string-length(.) &gt; 6)]) and not(ancestor::page-block/@pb-name[(starts-with(., 'cl') and 'cl' = translate(., '0123456789', '') and string-length(.) &gt; 2) or .='install' or starts-with(.,'rem-inst') or (starts-with(., 'reminst') and 'reminst' = translate(., '0123456789', '') and string-length(.) &gt; 7) or .='remove' or (starts-with(., 'repair') and 'repair' = translate(., '0123456789', '') and string-length(.) &gt; 6)]) and not(ancestor::ata-page-block/@pb-name[starts-with(., 'assy') or (starts-with(., 'ic') and 'ic' = translate(., '0123456789', '') and string-length(.) &gt; 2) or (starts-with(., 'te') and 'te' = translate(., '0123456789', '') and string-length(.) &gt; 2) or .='test']) and (ancestor::page-block/@pb-name[starts-with(., 'assy') or (starts-with(., 'ic') and 'ic' = translate(., '0123456789', '') and string-length(.) &gt; 2) or (starts-with(., 'te') and 'te' = translate(., '0123456789', '') and string-length(.) &gt; 2) or .='test'])">
            <!-- Condition #27-->
            <xsl:if test="not(@_gte:Gentext-Expanded)">
               <_sfe:BeforeOrAfterText>Table <_gte:styler_numbering>
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
         </xsl:when>
         <xsl:when test="not(ancestor::book[contains(@doctype,'cir') or contains(@doctype,'em') or contains(@doctype,'tmm')]) and not(ancestor::book[contains(@doctype,'oh')] and ancestor::ata-page-block/@pb-name[.='service']) and not(ancestor::book[contains(@doctype,'oh')] and ancestor::page-block/@pb-name[.='service']) and not(ancestor::ata-page-block/@pb-name[.='00awl' or .='00intro' or .='airlim' or .='awl' or .='awlror' or .='chapsect' or .='consume' or .='d-and-o' or .='frontmatte' or .='howtouse' or .='00howtouse' or .='intro' or .='nut_option' or .='oplimits' or .='sblist' or .='schedchk' or .='spectool' or .='timelim' or .='title-page']) and not(ancestor::page-block/@pb-name[.='00awl' or .='00intro' or .='airlim' or .='awl' or .='awlror' or .='chapsect' or .='consume' or .='d-and-o' or .='frontmatte' or .='howtouse' or .='00howtouse' or .='intro' or .='nut_option' or .='oplimits' or .='sblist' or .='schedchk' or .='spectool' or .='timelim' or .='title-page']) and not(ancestor::ata-page-block/@pb-name[(starts-with(., 'do') and 'do' = translate(., '0123456789', '') and string-length(.) &gt; 2) or (starts-with(., 'in') and 'in' = translate(., '0123456789', '') and string-length(.) &gt; 2) or (starts-with(., 'tl') and 'tl' = translate(., '0123456789', '') and string-length(.) &gt; 2) or .='toolsht' or .='trlist' or .='unschedc' or .='unschedchk']) and not(ancestor::page-block/@pb-name[(starts-with(., 'do') and 'do' = translate(., '0123456789', '') and string-length(.) &gt; 2) or (starts-with(., 'in') and 'in' = translate(., '0123456789', '') and string-length(.) &gt; 2) or (starts-with(., 'tl') and 'tl' = translate(., '0123456789', '') and string-length(.) &gt; 2) or .='toolsht' or .='trlist' or .='unschedc' or .='unschedchk']) and not(ancestor-or-self::ata-page-block[1]/@pb-name and string(ancestor-or-self::ata-page-block[1]/@pb-name)='intro00') and not(ancestor-or-self::page-block[1]/@pb-name and string(ancestor-or-self::page-block[1]/@pb-name)='intro00') and not(ancestor::ata-page-block/@pb-name[starts-with(., 'disassy') or starts-with(., 'fault')]) and not(ancestor::page-block/@pb-name[starts-with(., 'disassy') or starts-with(., 'fault')]) and not(ancestor::book[contains(@doctype,'oh')] and ancestor::ata-page-block/@pb-name[starts-with(., 'clean')]) and not(ancestor::book[contains(@doctype,'oh')] and ancestor::page-block/@pb-name[starts-with(., 'clean')]) and not(ancestor::ata-page-block/@pb-name[starts-with(., 'mainprac')]) and not(ancestor::page-block/@pb-name[starts-with(., 'mainprac')]) and not(ancestor::book[contains(@doctype,'oh')] and ancestor::ata-page-block/@pb-name[starts-with(., 'inspect')]) and not(ancestor::book[contains(@doctype,'oh')] and ancestor::page-block/@pb-name[starts-with(., 'inspect')]) and not(ancestor::ata-page-block/@pb-name[(starts-with(., 'di') and 'di' = translate(., '0123456789', '') and string-length(.) &gt; 2) or starts-with(.,'service')]) and not(ancestor::page-block/@pb-name[(starts-with(., 'di') and 'di' = translate(., '0123456789', '') and string-length(.) &gt; 2) or starts-with(.,'service')]) and not(ancestor::book[contains(@doctype,'oh')] and ancestor::ata-page-block/@pb-name[starts-with(., 'repair')]) and not(ancestor::book[contains(@doctype,'oh')] and ancestor::page-block/@pb-name[starts-with(., 'repair')]) and not(ancestor::ata-page-block/@pb-name[(starts-with(., 'cl') and 'cl' = translate(., '0123456789', '') and string-length(.) &gt; 2) or .='install' or starts-with(.,'rem-inst') or (starts-with(., 'reminst') and 'reminst' = translate(., '0123456789', '') and string-length(.) &gt; 7) or .='remove' or (starts-with(., 'repair') and 'repair' = translate(., '0123456789', '') and string-length(.) &gt; 6)]) and not(ancestor::page-block/@pb-name[(starts-with(., 'cl') and 'cl' = translate(., '0123456789', '') and string-length(.) &gt; 2) or .='install' or starts-with(.,'rem-inst') or (starts-with(., 'reminst') and 'reminst' = translate(., '0123456789', '') and string-length(.) &gt; 7) or .='remove' or (starts-with(., 'repair') and 'repair' = translate(., '0123456789', '') and string-length(.) &gt; 6)]) and (ancestor::ata-page-block/@pb-name[starts-with(., 'assy') or (starts-with(., 'ic') and 'ic' = translate(., '0123456789', '') and string-length(.) &gt; 2) or (starts-with(., 'te') and 'te' = translate(., '0123456789', '') and string-length(.) &gt; 2) or .='test'])">
            <!-- Condition #26-->
            <xsl:if test="not(@_gte:Gentext-Expanded)">
               <_sfe:BeforeOrAfterText>Table <_gte:styler_numbering>
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
         </xsl:when>
         <xsl:when test="not(ancestor::book[contains(@doctype,'cir') or contains(@doctype,'em') or contains(@doctype,'tmm')]) and not(ancestor::book[contains(@doctype,'oh')] and ancestor::ata-page-block/@pb-name[.='service']) and not(ancestor::book[contains(@doctype,'oh')] and ancestor::page-block/@pb-name[.='service']) and not(ancestor::ata-page-block/@pb-name[.='00awl' or .='00intro' or .='airlim' or .='awl' or .='awlror' or .='chapsect' or .='consume' or .='d-and-o' or .='frontmatte' or .='howtouse' or .='00howtouse' or .='intro' or .='nut_option' or .='oplimits' or .='sblist' or .='schedchk' or .='spectool' or .='timelim' or .='title-page']) and not(ancestor::page-block/@pb-name[.='00awl' or .='00intro' or .='airlim' or .='awl' or .='awlror' or .='chapsect' or .='consume' or .='d-and-o' or .='frontmatte' or .='howtouse' or .='00howtouse' or .='intro' or .='nut_option' or .='oplimits' or .='sblist' or .='schedchk' or .='spectool' or .='timelim' or .='title-page']) and not(ancestor::ata-page-block/@pb-name[(starts-with(., 'do') and 'do' = translate(., '0123456789', '') and string-length(.) &gt; 2) or (starts-with(., 'in') and 'in' = translate(., '0123456789', '') and string-length(.) &gt; 2) or (starts-with(., 'tl') and 'tl' = translate(., '0123456789', '') and string-length(.) &gt; 2) or .='toolsht' or .='trlist' or .='unschedc' or .='unschedchk']) and not(ancestor::page-block/@pb-name[(starts-with(., 'do') and 'do' = translate(., '0123456789', '') and string-length(.) &gt; 2) or (starts-with(., 'in') and 'in' = translate(., '0123456789', '') and string-length(.) &gt; 2) or (starts-with(., 'tl') and 'tl' = translate(., '0123456789', '') and string-length(.) &gt; 2) or .='toolsht' or .='trlist' or .='unschedc' or .='unschedchk']) and not(ancestor-or-self::ata-page-block[1]/@pb-name and string(ancestor-or-self::ata-page-block[1]/@pb-name)='intro00') and not(ancestor-or-self::page-block[1]/@pb-name and string(ancestor-or-self::page-block[1]/@pb-name)='intro00') and not(ancestor::ata-page-block/@pb-name[starts-with(., 'disassy') or starts-with(., 'fault')]) and not(ancestor::page-block/@pb-name[starts-with(., 'disassy') or starts-with(., 'fault')]) and not(ancestor::book[contains(@doctype,'oh')] and ancestor::ata-page-block/@pb-name[starts-with(., 'clean')]) and not(ancestor::book[contains(@doctype,'oh')] and ancestor::page-block/@pb-name[starts-with(., 'clean')]) and not(ancestor::ata-page-block/@pb-name[starts-with(., 'mainprac')]) and not(ancestor::page-block/@pb-name[starts-with(., 'mainprac')]) and not(ancestor::book[contains(@doctype,'oh')] and ancestor::ata-page-block/@pb-name[starts-with(., 'inspect')]) and not(ancestor::book[contains(@doctype,'oh')] and ancestor::page-block/@pb-name[starts-with(., 'inspect')]) and not(ancestor::ata-page-block/@pb-name[(starts-with(., 'di') and 'di' = translate(., '0123456789', '') and string-length(.) &gt; 2) or starts-with(.,'service')]) and not(ancestor::page-block/@pb-name[(starts-with(., 'di') and 'di' = translate(., '0123456789', '') and string-length(.) &gt; 2) or starts-with(.,'service')]) and not(ancestor::book[contains(@doctype,'oh')] and ancestor::ata-page-block/@pb-name[starts-with(., 'repair')]) and not(ancestor::book[contains(@doctype,'oh')] and ancestor::page-block/@pb-name[starts-with(., 'repair')]) and not(ancestor::ata-page-block/@pb-name[(starts-with(., 'cl') and 'cl' = translate(., '0123456789', '') and string-length(.) &gt; 2) or .='install' or starts-with(.,'rem-inst') or (starts-with(., 'reminst') and 'reminst' = translate(., '0123456789', '') and string-length(.) &gt; 7) or .='remove' or (starts-with(., 'repair') and 'repair' = translate(., '0123456789', '') and string-length(.) &gt; 6)]) and (ancestor::page-block/@pb-name[(starts-with(., 'cl') and 'cl' = translate(., '0123456789', '') and string-length(.) &gt; 2) or .='install' or starts-with(.,'rem-inst') or (starts-with(., 'reminst') and 'reminst' = translate(., '0123456789', '') and string-length(.) &gt; 7) or .='remove' or (starts-with(., 'repair') and 'repair' = translate(., '0123456789', '') and string-length(.) &gt; 6)])">
            <!-- Condition #25-->
            <xsl:if test="not(@_gte:Gentext-Expanded)">
               <_sfe:BeforeOrAfterText>Table <_gte:styler_numbering>
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
         </xsl:when>
         <xsl:when test="not(ancestor::book[contains(@doctype,'cir') or contains(@doctype,'em') or contains(@doctype,'tmm')]) and not(ancestor::book[contains(@doctype,'oh')] and ancestor::ata-page-block/@pb-name[.='service']) and not(ancestor::book[contains(@doctype,'oh')] and ancestor::page-block/@pb-name[.='service']) and not(ancestor::ata-page-block/@pb-name[.='00awl' or .='00intro' or .='airlim' or .='awl' or .='awlror' or .='chapsect' or .='consume' or .='d-and-o' or .='frontmatte' or .='howtouse' or .='00howtouse' or .='intro' or .='nut_option' or .='oplimits' or .='sblist' or .='schedchk' or .='spectool' or .='timelim' or .='title-page']) and not(ancestor::page-block/@pb-name[.='00awl' or .='00intro' or .='airlim' or .='awl' or .='awlror' or .='chapsect' or .='consume' or .='d-and-o' or .='frontmatte' or .='howtouse' or .='00howtouse' or .='intro' or .='nut_option' or .='oplimits' or .='sblist' or .='schedchk' or .='spectool' or .='timelim' or .='title-page']) and not(ancestor::ata-page-block/@pb-name[(starts-with(., 'do') and 'do' = translate(., '0123456789', '') and string-length(.) &gt; 2) or (starts-with(., 'in') and 'in' = translate(., '0123456789', '') and string-length(.) &gt; 2) or (starts-with(., 'tl') and 'tl' = translate(., '0123456789', '') and string-length(.) &gt; 2) or .='toolsht' or .='trlist' or .='unschedc' or .='unschedchk']) and not(ancestor::page-block/@pb-name[(starts-with(., 'do') and 'do' = translate(., '0123456789', '') and string-length(.) &gt; 2) or (starts-with(., 'in') and 'in' = translate(., '0123456789', '') and string-length(.) &gt; 2) or (starts-with(., 'tl') and 'tl' = translate(., '0123456789', '') and string-length(.) &gt; 2) or .='toolsht' or .='trlist' or .='unschedc' or .='unschedchk']) and not(ancestor-or-self::ata-page-block[1]/@pb-name and string(ancestor-or-self::ata-page-block[1]/@pb-name)='intro00') and not(ancestor-or-self::page-block[1]/@pb-name and string(ancestor-or-self::page-block[1]/@pb-name)='intro00') and not(ancestor::ata-page-block/@pb-name[starts-with(., 'disassy') or starts-with(., 'fault')]) and not(ancestor::page-block/@pb-name[starts-with(., 'disassy') or starts-with(., 'fault')]) and not(ancestor::book[contains(@doctype,'oh')] and ancestor::ata-page-block/@pb-name[starts-with(., 'clean')]) and not(ancestor::book[contains(@doctype,'oh')] and ancestor::page-block/@pb-name[starts-with(., 'clean')]) and not(ancestor::ata-page-block/@pb-name[starts-with(., 'mainprac')]) and not(ancestor::page-block/@pb-name[starts-with(., 'mainprac')]) and not(ancestor::book[contains(@doctype,'oh')] and ancestor::ata-page-block/@pb-name[starts-with(., 'inspect')]) and not(ancestor::book[contains(@doctype,'oh')] and ancestor::page-block/@pb-name[starts-with(., 'inspect')]) and not(ancestor::ata-page-block/@pb-name[(starts-with(., 'di') and 'di' = translate(., '0123456789', '') and string-length(.) &gt; 2) or starts-with(.,'service')]) and not(ancestor::page-block/@pb-name[(starts-with(., 'di') and 'di' = translate(., '0123456789', '') and string-length(.) &gt; 2) or starts-with(.,'service')]) and not(ancestor::book[contains(@doctype,'oh')] and ancestor::ata-page-block/@pb-name[starts-with(., 'repair')]) and not(ancestor::book[contains(@doctype,'oh')] and ancestor::page-block/@pb-name[starts-with(., 'repair')]) and (ancestor::ata-page-block/@pb-name[(starts-with(., 'cl') and 'cl' = translate(., '0123456789', '') and string-length(.) &gt; 2) or .='install' or starts-with(.,'rem-inst') or (starts-with(., 'reminst') and 'reminst' = translate(., '0123456789', '') and string-length(.) &gt; 7) or .='remove' or (starts-with(., 'repair') and 'repair' = translate(., '0123456789', '') and string-length(.) &gt; 6)])">
            <!-- Condition #24-->
            <xsl:if test="not(@_gte:Gentext-Expanded)">
               <_sfe:BeforeOrAfterText>Table <_gte:styler_numbering>
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
         </xsl:when>
         <xsl:when test="not(ancestor::book[contains(@doctype,'cir') or contains(@doctype,'em') or contains(@doctype,'tmm')]) and not(ancestor::book[contains(@doctype,'oh')] and ancestor::ata-page-block/@pb-name[.='service']) and not(ancestor::book[contains(@doctype,'oh')] and ancestor::page-block/@pb-name[.='service']) and not(ancestor::ata-page-block/@pb-name[.='00awl' or .='00intro' or .='airlim' or .='awl' or .='awlror' or .='chapsect' or .='consume' or .='d-and-o' or .='frontmatte' or .='howtouse' or .='00howtouse' or .='intro' or .='nut_option' or .='oplimits' or .='sblist' or .='schedchk' or .='spectool' or .='timelim' or .='title-page']) and not(ancestor::page-block/@pb-name[.='00awl' or .='00intro' or .='airlim' or .='awl' or .='awlror' or .='chapsect' or .='consume' or .='d-and-o' or .='frontmatte' or .='howtouse' or .='00howtouse' or .='intro' or .='nut_option' or .='oplimits' or .='sblist' or .='schedchk' or .='spectool' or .='timelim' or .='title-page']) and not(ancestor::ata-page-block/@pb-name[(starts-with(., 'do') and 'do' = translate(., '0123456789', '') and string-length(.) &gt; 2) or (starts-with(., 'in') and 'in' = translate(., '0123456789', '') and string-length(.) &gt; 2) or (starts-with(., 'tl') and 'tl' = translate(., '0123456789', '') and string-length(.) &gt; 2) or .='toolsht' or .='trlist' or .='unschedc' or .='unschedchk']) and not(ancestor::page-block/@pb-name[(starts-with(., 'do') and 'do' = translate(., '0123456789', '') and string-length(.) &gt; 2) or (starts-with(., 'in') and 'in' = translate(., '0123456789', '') and string-length(.) &gt; 2) or (starts-with(., 'tl') and 'tl' = translate(., '0123456789', '') and string-length(.) &gt; 2) or .='toolsht' or .='trlist' or .='unschedc' or .='unschedchk']) and not(ancestor-or-self::ata-page-block[1]/@pb-name and string(ancestor-or-self::ata-page-block[1]/@pb-name)='intro00') and not(ancestor-or-self::page-block[1]/@pb-name and string(ancestor-or-self::page-block[1]/@pb-name)='intro00') and not(ancestor::ata-page-block/@pb-name[starts-with(., 'disassy') or starts-with(., 'fault')]) and not(ancestor::page-block/@pb-name[starts-with(., 'disassy') or starts-with(., 'fault')]) and not(ancestor::book[contains(@doctype,'oh')] and ancestor::ata-page-block/@pb-name[starts-with(., 'clean')]) and not(ancestor::book[contains(@doctype,'oh')] and ancestor::page-block/@pb-name[starts-with(., 'clean')]) and not(ancestor::ata-page-block/@pb-name[starts-with(., 'mainprac')]) and not(ancestor::page-block/@pb-name[starts-with(., 'mainprac')]) and not(ancestor::book[contains(@doctype,'oh')] and ancestor::ata-page-block/@pb-name[starts-with(., 'inspect')]) and not(ancestor::book[contains(@doctype,'oh')] and ancestor::page-block/@pb-name[starts-with(., 'inspect')]) and not(ancestor::ata-page-block/@pb-name[(starts-with(., 'di') and 'di' = translate(., '0123456789', '') and string-length(.) &gt; 2) or starts-with(.,'service')]) and not(ancestor::page-block/@pb-name[(starts-with(., 'di') and 'di' = translate(., '0123456789', '') and string-length(.) &gt; 2) or starts-with(.,'service')]) and not(ancestor::book[contains(@doctype,'oh')] and ancestor::ata-page-block/@pb-name[starts-with(., 'repair')]) and (ancestor::book[contains(@doctype,'oh')] and ancestor::page-block/@pb-name[starts-with(., 'repair')])">
            <!-- Condition #23-->
            <xsl:if test="not(@_gte:Gentext-Expanded)">
               <_sfe:BeforeOrAfterText>Table <_gte:styler_numbering>
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
         </xsl:when>
         <xsl:when test="not(ancestor::book[contains(@doctype,'cir') or contains(@doctype,'em') or contains(@doctype,'tmm')]) and not(ancestor::book[contains(@doctype,'oh')] and ancestor::ata-page-block/@pb-name[.='service']) and not(ancestor::book[contains(@doctype,'oh')] and ancestor::page-block/@pb-name[.='service']) and not(ancestor::ata-page-block/@pb-name[.='00awl' or .='00intro' or .='airlim' or .='awl' or .='awlror' or .='chapsect' or .='consume' or .='d-and-o' or .='frontmatte' or .='howtouse' or .='00howtouse' or .='intro' or .='nut_option' or .='oplimits' or .='sblist' or .='schedchk' or .='spectool' or .='timelim' or .='title-page']) and not(ancestor::page-block/@pb-name[.='00awl' or .='00intro' or .='airlim' or .='awl' or .='awlror' or .='chapsect' or .='consume' or .='d-and-o' or .='frontmatte' or .='howtouse' or .='00howtouse' or .='intro' or .='nut_option' or .='oplimits' or .='sblist' or .='schedchk' or .='spectool' or .='timelim' or .='title-page']) and not(ancestor::ata-page-block/@pb-name[(starts-with(., 'do') and 'do' = translate(., '0123456789', '') and string-length(.) &gt; 2) or (starts-with(., 'in') and 'in' = translate(., '0123456789', '') and string-length(.) &gt; 2) or (starts-with(., 'tl') and 'tl' = translate(., '0123456789', '') and string-length(.) &gt; 2) or .='toolsht' or .='trlist' or .='unschedc' or .='unschedchk']) and not(ancestor::page-block/@pb-name[(starts-with(., 'do') and 'do' = translate(., '0123456789', '') and string-length(.) &gt; 2) or (starts-with(., 'in') and 'in' = translate(., '0123456789', '') and string-length(.) &gt; 2) or (starts-with(., 'tl') and 'tl' = translate(., '0123456789', '') and string-length(.) &gt; 2) or .='toolsht' or .='trlist' or .='unschedc' or .='unschedchk']) and not(ancestor-or-self::ata-page-block[1]/@pb-name and string(ancestor-or-self::ata-page-block[1]/@pb-name)='intro00') and not(ancestor-or-self::page-block[1]/@pb-name and string(ancestor-or-self::page-block[1]/@pb-name)='intro00') and not(ancestor::ata-page-block/@pb-name[starts-with(., 'disassy') or starts-with(., 'fault')]) and not(ancestor::page-block/@pb-name[starts-with(., 'disassy') or starts-with(., 'fault')]) and not(ancestor::book[contains(@doctype,'oh')] and ancestor::ata-page-block/@pb-name[starts-with(., 'clean')]) and not(ancestor::book[contains(@doctype,'oh')] and ancestor::page-block/@pb-name[starts-with(., 'clean')]) and not(ancestor::ata-page-block/@pb-name[starts-with(., 'mainprac')]) and not(ancestor::page-block/@pb-name[starts-with(., 'mainprac')]) and not(ancestor::book[contains(@doctype,'oh')] and ancestor::ata-page-block/@pb-name[starts-with(., 'inspect')]) and not(ancestor::book[contains(@doctype,'oh')] and ancestor::page-block/@pb-name[starts-with(., 'inspect')]) and not(ancestor::ata-page-block/@pb-name[(starts-with(., 'di') and 'di' = translate(., '0123456789', '') and string-length(.) &gt; 2) or starts-with(.,'service')]) and not(ancestor::page-block/@pb-name[(starts-with(., 'di') and 'di' = translate(., '0123456789', '') and string-length(.) &gt; 2) or starts-with(.,'service')]) and (ancestor::book[contains(@doctype,'oh')] and ancestor::ata-page-block/@pb-name[starts-with(., 'repair')])">
            <!-- Condition #22-->
            <xsl:if test="not(@_gte:Gentext-Expanded)">
               <_sfe:BeforeOrAfterText>Table <_gte:styler_numbering>
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
         </xsl:when>
         <xsl:when test="not(ancestor::book[contains(@doctype,'cir') or contains(@doctype,'em') or contains(@doctype,'tmm')]) and not(ancestor::book[contains(@doctype,'oh')] and ancestor::ata-page-block/@pb-name[.='service']) and not(ancestor::book[contains(@doctype,'oh')] and ancestor::page-block/@pb-name[.='service']) and not(ancestor::ata-page-block/@pb-name[.='00awl' or .='00intro' or .='airlim' or .='awl' or .='awlror' or .='chapsect' or .='consume' or .='d-and-o' or .='frontmatte' or .='howtouse' or .='00howtouse' or .='intro' or .='nut_option' or .='oplimits' or .='sblist' or .='schedchk' or .='spectool' or .='timelim' or .='title-page']) and not(ancestor::page-block/@pb-name[.='00awl' or .='00intro' or .='airlim' or .='awl' or .='awlror' or .='chapsect' or .='consume' or .='d-and-o' or .='frontmatte' or .='howtouse' or .='00howtouse' or .='intro' or .='nut_option' or .='oplimits' or .='sblist' or .='schedchk' or .='spectool' or .='timelim' or .='title-page']) and not(ancestor::ata-page-block/@pb-name[(starts-with(., 'do') and 'do' = translate(., '0123456789', '') and string-length(.) &gt; 2) or (starts-with(., 'in') and 'in' = translate(., '0123456789', '') and string-length(.) &gt; 2) or (starts-with(., 'tl') and 'tl' = translate(., '0123456789', '') and string-length(.) &gt; 2) or .='toolsht' or .='trlist' or .='unschedc' or .='unschedchk']) and not(ancestor::page-block/@pb-name[(starts-with(., 'do') and 'do' = translate(., '0123456789', '') and string-length(.) &gt; 2) or (starts-with(., 'in') and 'in' = translate(., '0123456789', '') and string-length(.) &gt; 2) or (starts-with(., 'tl') and 'tl' = translate(., '0123456789', '') and string-length(.) &gt; 2) or .='toolsht' or .='trlist' or .='unschedc' or .='unschedchk']) and not(ancestor-or-self::ata-page-block[1]/@pb-name and string(ancestor-or-self::ata-page-block[1]/@pb-name)='intro00') and not(ancestor-or-self::page-block[1]/@pb-name and string(ancestor-or-self::page-block[1]/@pb-name)='intro00') and not(ancestor::ata-page-block/@pb-name[starts-with(., 'disassy') or starts-with(., 'fault')]) and not(ancestor::page-block/@pb-name[starts-with(., 'disassy') or starts-with(., 'fault')]) and not(ancestor::book[contains(@doctype,'oh')] and ancestor::ata-page-block/@pb-name[starts-with(., 'clean')]) and not(ancestor::book[contains(@doctype,'oh')] and ancestor::page-block/@pb-name[starts-with(., 'clean')]) and not(ancestor::ata-page-block/@pb-name[starts-with(., 'mainprac')]) and not(ancestor::page-block/@pb-name[starts-with(., 'mainprac')]) and not(ancestor::book[contains(@doctype,'oh')] and ancestor::ata-page-block/@pb-name[starts-with(., 'inspect')]) and not(ancestor::book[contains(@doctype,'oh')] and ancestor::page-block/@pb-name[starts-with(., 'inspect')]) and not(ancestor::ata-page-block/@pb-name[(starts-with(., 'di') and 'di' = translate(., '0123456789', '') and string-length(.) &gt; 2) or starts-with(.,'service')]) and (ancestor::page-block/@pb-name[(starts-with(., 'di') and 'di' = translate(., '0123456789', '') and string-length(.) &gt; 2) or starts-with(.,'service')])">
            <!-- Condition #21-->
            <xsl:if test="not(@_gte:Gentext-Expanded)">
               <_sfe:BeforeOrAfterText>Table <_gte:styler_numbering>
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
         </xsl:when>
         <xsl:when test="not(ancestor::book[contains(@doctype,'cir') or contains(@doctype,'em') or contains(@doctype,'tmm')]) and not(ancestor::book[contains(@doctype,'oh')] and ancestor::ata-page-block/@pb-name[.='service']) and not(ancestor::book[contains(@doctype,'oh')] and ancestor::page-block/@pb-name[.='service']) and not(ancestor::ata-page-block/@pb-name[.='00awl' or .='00intro' or .='airlim' or .='awl' or .='awlror' or .='chapsect' or .='consume' or .='d-and-o' or .='frontmatte' or .='howtouse' or .='00howtouse' or .='intro' or .='nut_option' or .='oplimits' or .='sblist' or .='schedchk' or .='spectool' or .='timelim' or .='title-page']) and not(ancestor::page-block/@pb-name[.='00awl' or .='00intro' or .='airlim' or .='awl' or .='awlror' or .='chapsect' or .='consume' or .='d-and-o' or .='frontmatte' or .='howtouse' or .='00howtouse' or .='intro' or .='nut_option' or .='oplimits' or .='sblist' or .='schedchk' or .='spectool' or .='timelim' or .='title-page']) and not(ancestor::ata-page-block/@pb-name[(starts-with(., 'do') and 'do' = translate(., '0123456789', '') and string-length(.) &gt; 2) or (starts-with(., 'in') and 'in' = translate(., '0123456789', '') and string-length(.) &gt; 2) or (starts-with(., 'tl') and 'tl' = translate(., '0123456789', '') and string-length(.) &gt; 2) or .='toolsht' or .='trlist' or .='unschedc' or .='unschedchk']) and not(ancestor::page-block/@pb-name[(starts-with(., 'do') and 'do' = translate(., '0123456789', '') and string-length(.) &gt; 2) or (starts-with(., 'in') and 'in' = translate(., '0123456789', '') and string-length(.) &gt; 2) or (starts-with(., 'tl') and 'tl' = translate(., '0123456789', '') and string-length(.) &gt; 2) or .='toolsht' or .='trlist' or .='unschedc' or .='unschedchk']) and not(ancestor-or-self::ata-page-block[1]/@pb-name and string(ancestor-or-self::ata-page-block[1]/@pb-name)='intro00') and not(ancestor-or-self::page-block[1]/@pb-name and string(ancestor-or-self::page-block[1]/@pb-name)='intro00') and not(ancestor::ata-page-block/@pb-name[starts-with(., 'disassy') or starts-with(., 'fault')]) and not(ancestor::page-block/@pb-name[starts-with(., 'disassy') or starts-with(., 'fault')]) and not(ancestor::book[contains(@doctype,'oh')] and ancestor::ata-page-block/@pb-name[starts-with(., 'clean')]) and not(ancestor::book[contains(@doctype,'oh')] and ancestor::page-block/@pb-name[starts-with(., 'clean')]) and not(ancestor::ata-page-block/@pb-name[starts-with(., 'mainprac')]) and not(ancestor::page-block/@pb-name[starts-with(., 'mainprac')]) and not(ancestor::book[contains(@doctype,'oh')] and ancestor::ata-page-block/@pb-name[starts-with(., 'inspect')]) and not(ancestor::book[contains(@doctype,'oh')] and ancestor::page-block/@pb-name[starts-with(., 'inspect')]) and (ancestor::ata-page-block/@pb-name[(starts-with(., 'di') and 'di' = translate(., '0123456789', '') and string-length(.) &gt; 2) or starts-with(.,'service')])">
            <!-- Condition #20-->
            <xsl:if test="not(@_gte:Gentext-Expanded)">
               <_sfe:BeforeOrAfterText>Table <_gte:styler_numbering>
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
         </xsl:when>
         <xsl:when test="not(ancestor::book[contains(@doctype,'cir') or contains(@doctype,'em') or contains(@doctype,'tmm')]) and not(ancestor::book[contains(@doctype,'oh')] and ancestor::ata-page-block/@pb-name[.='service']) and not(ancestor::book[contains(@doctype,'oh')] and ancestor::page-block/@pb-name[.='service']) and not(ancestor::ata-page-block/@pb-name[.='00awl' or .='00intro' or .='airlim' or .='awl' or .='awlror' or .='chapsect' or .='consume' or .='d-and-o' or .='frontmatte' or .='howtouse' or .='00howtouse' or .='intro' or .='nut_option' or .='oplimits' or .='sblist' or .='schedchk' or .='spectool' or .='timelim' or .='title-page']) and not(ancestor::page-block/@pb-name[.='00awl' or .='00intro' or .='airlim' or .='awl' or .='awlror' or .='chapsect' or .='consume' or .='d-and-o' or .='frontmatte' or .='howtouse' or .='00howtouse' or .='intro' or .='nut_option' or .='oplimits' or .='sblist' or .='schedchk' or .='spectool' or .='timelim' or .='title-page']) and not(ancestor::ata-page-block/@pb-name[(starts-with(., 'do') and 'do' = translate(., '0123456789', '') and string-length(.) &gt; 2) or (starts-with(., 'in') and 'in' = translate(., '0123456789', '') and string-length(.) &gt; 2) or (starts-with(., 'tl') and 'tl' = translate(., '0123456789', '') and string-length(.) &gt; 2) or .='toolsht' or .='trlist' or .='unschedc' or .='unschedchk']) and not(ancestor::page-block/@pb-name[(starts-with(., 'do') and 'do' = translate(., '0123456789', '') and string-length(.) &gt; 2) or (starts-with(., 'in') and 'in' = translate(., '0123456789', '') and string-length(.) &gt; 2) or (starts-with(., 'tl') and 'tl' = translate(., '0123456789', '') and string-length(.) &gt; 2) or .='toolsht' or .='trlist' or .='unschedc' or .='unschedchk']) and not(ancestor-or-self::ata-page-block[1]/@pb-name and string(ancestor-or-self::ata-page-block[1]/@pb-name)='intro00') and not(ancestor-or-self::page-block[1]/@pb-name and string(ancestor-or-self::page-block[1]/@pb-name)='intro00') and not(ancestor::ata-page-block/@pb-name[starts-with(., 'disassy') or starts-with(., 'fault')]) and not(ancestor::page-block/@pb-name[starts-with(., 'disassy') or starts-with(., 'fault')]) and not(ancestor::book[contains(@doctype,'oh')] and ancestor::ata-page-block/@pb-name[starts-with(., 'clean')]) and not(ancestor::book[contains(@doctype,'oh')] and ancestor::page-block/@pb-name[starts-with(., 'clean')]) and not(ancestor::ata-page-block/@pb-name[starts-with(., 'mainprac')]) and not(ancestor::page-block/@pb-name[starts-with(., 'mainprac')]) and not(ancestor::book[contains(@doctype,'oh')] and ancestor::ata-page-block/@pb-name[starts-with(., 'inspect')]) and (ancestor::book[contains(@doctype,'oh')] and ancestor::page-block/@pb-name[starts-with(., 'inspect')])">
            <!-- Condition #19-->
            <xsl:if test="not(@_gte:Gentext-Expanded)">
               <_sfe:BeforeOrAfterText>Table <_gte:styler_numbering>
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
         </xsl:when>
         <xsl:when test="not(ancestor::book[contains(@doctype,'cir') or contains(@doctype,'em') or contains(@doctype,'tmm')]) and not(ancestor::book[contains(@doctype,'oh')] and ancestor::ata-page-block/@pb-name[.='service']) and not(ancestor::book[contains(@doctype,'oh')] and ancestor::page-block/@pb-name[.='service']) and not(ancestor::ata-page-block/@pb-name[.='00awl' or .='00intro' or .='airlim' or .='awl' or .='awlror' or .='chapsect' or .='consume' or .='d-and-o' or .='frontmatte' or .='howtouse' or .='00howtouse' or .='intro' or .='nut_option' or .='oplimits' or .='sblist' or .='schedchk' or .='spectool' or .='timelim' or .='title-page']) and not(ancestor::page-block/@pb-name[.='00awl' or .='00intro' or .='airlim' or .='awl' or .='awlror' or .='chapsect' or .='consume' or .='d-and-o' or .='frontmatte' or .='howtouse' or .='00howtouse' or .='intro' or .='nut_option' or .='oplimits' or .='sblist' or .='schedchk' or .='spectool' or .='timelim' or .='title-page']) and not(ancestor::ata-page-block/@pb-name[(starts-with(., 'do') and 'do' = translate(., '0123456789', '') and string-length(.) &gt; 2) or (starts-with(., 'in') and 'in' = translate(., '0123456789', '') and string-length(.) &gt; 2) or (starts-with(., 'tl') and 'tl' = translate(., '0123456789', '') and string-length(.) &gt; 2) or .='toolsht' or .='trlist' or .='unschedc' or .='unschedchk']) and not(ancestor::page-block/@pb-name[(starts-with(., 'do') and 'do' = translate(., '0123456789', '') and string-length(.) &gt; 2) or (starts-with(., 'in') and 'in' = translate(., '0123456789', '') and string-length(.) &gt; 2) or (starts-with(., 'tl') and 'tl' = translate(., '0123456789', '') and string-length(.) &gt; 2) or .='toolsht' or .='trlist' or .='unschedc' or .='unschedchk']) and not(ancestor-or-self::ata-page-block[1]/@pb-name and string(ancestor-or-self::ata-page-block[1]/@pb-name)='intro00') and not(ancestor-or-self::page-block[1]/@pb-name and string(ancestor-or-self::page-block[1]/@pb-name)='intro00') and not(ancestor::ata-page-block/@pb-name[starts-with(., 'disassy') or starts-with(., 'fault')]) and not(ancestor::page-block/@pb-name[starts-with(., 'disassy') or starts-with(., 'fault')]) and not(ancestor::book[contains(@doctype,'oh')] and ancestor::ata-page-block/@pb-name[starts-with(., 'clean')]) and not(ancestor::book[contains(@doctype,'oh')] and ancestor::page-block/@pb-name[starts-with(., 'clean')]) and not(ancestor::ata-page-block/@pb-name[starts-with(., 'mainprac')]) and not(ancestor::page-block/@pb-name[starts-with(., 'mainprac')]) and (ancestor::book[contains(@doctype,'oh')] and ancestor::ata-page-block/@pb-name[starts-with(., 'inspect')])">
            <!-- Condition #18-->
            <xsl:if test="not(@_gte:Gentext-Expanded)">
               <_sfe:BeforeOrAfterText>Table <_gte:styler_numbering>
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
         </xsl:when>
         <xsl:when test="not(ancestor::book[contains(@doctype,'cir') or contains(@doctype,'em') or contains(@doctype,'tmm')]) and not(ancestor::book[contains(@doctype,'oh')] and ancestor::ata-page-block/@pb-name[.='service']) and not(ancestor::book[contains(@doctype,'oh')] and ancestor::page-block/@pb-name[.='service']) and not(ancestor::ata-page-block/@pb-name[.='00awl' or .='00intro' or .='airlim' or .='awl' or .='awlror' or .='chapsect' or .='consume' or .='d-and-o' or .='frontmatte' or .='howtouse' or .='00howtouse' or .='intro' or .='nut_option' or .='oplimits' or .='sblist' or .='schedchk' or .='spectool' or .='timelim' or .='title-page']) and not(ancestor::page-block/@pb-name[.='00awl' or .='00intro' or .='airlim' or .='awl' or .='awlror' or .='chapsect' or .='consume' or .='d-and-o' or .='frontmatte' or .='howtouse' or .='00howtouse' or .='intro' or .='nut_option' or .='oplimits' or .='sblist' or .='schedchk' or .='spectool' or .='timelim' or .='title-page']) and not(ancestor::ata-page-block/@pb-name[(starts-with(., 'do') and 'do' = translate(., '0123456789', '') and string-length(.) &gt; 2) or (starts-with(., 'in') and 'in' = translate(., '0123456789', '') and string-length(.) &gt; 2) or (starts-with(., 'tl') and 'tl' = translate(., '0123456789', '') and string-length(.) &gt; 2) or .='toolsht' or .='trlist' or .='unschedc' or .='unschedchk']) and not(ancestor::page-block/@pb-name[(starts-with(., 'do') and 'do' = translate(., '0123456789', '') and string-length(.) &gt; 2) or (starts-with(., 'in') and 'in' = translate(., '0123456789', '') and string-length(.) &gt; 2) or (starts-with(., 'tl') and 'tl' = translate(., '0123456789', '') and string-length(.) &gt; 2) or .='toolsht' or .='trlist' or .='unschedc' or .='unschedchk']) and not(ancestor-or-self::ata-page-block[1]/@pb-name and string(ancestor-or-self::ata-page-block[1]/@pb-name)='intro00') and not(ancestor-or-self::page-block[1]/@pb-name and string(ancestor-or-self::page-block[1]/@pb-name)='intro00') and not(ancestor::ata-page-block/@pb-name[starts-with(., 'disassy') or starts-with(., 'fault')]) and not(ancestor::page-block/@pb-name[starts-with(., 'disassy') or starts-with(., 'fault')]) and not(ancestor::book[contains(@doctype,'oh')] and ancestor::ata-page-block/@pb-name[starts-with(., 'clean')]) and not(ancestor::book[contains(@doctype,'oh')] and ancestor::page-block/@pb-name[starts-with(., 'clean')]) and not(ancestor::ata-page-block/@pb-name[starts-with(., 'mainprac')]) and (ancestor::page-block/@pb-name[starts-with(., 'mainprac')])">
            <!-- Condition #17-->
            <xsl:if test="not(@_gte:Gentext-Expanded)">
               <_sfe:BeforeOrAfterText>Table <_gte:styler_numbering>
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
         </xsl:when>
         <xsl:when test="not(ancestor::book[contains(@doctype,'cir') or contains(@doctype,'em') or contains(@doctype,'tmm')]) and not(ancestor::book[contains(@doctype,'oh')] and ancestor::ata-page-block/@pb-name[.='service']) and not(ancestor::book[contains(@doctype,'oh')] and ancestor::page-block/@pb-name[.='service']) and not(ancestor::ata-page-block/@pb-name[.='00awl' or .='00intro' or .='airlim' or .='awl' or .='awlror' or .='chapsect' or .='consume' or .='d-and-o' or .='frontmatte' or .='howtouse' or .='00howtouse' or .='intro' or .='nut_option' or .='oplimits' or .='sblist' or .='schedchk' or .='spectool' or .='timelim' or .='title-page']) and not(ancestor::page-block/@pb-name[.='00awl' or .='00intro' or .='airlim' or .='awl' or .='awlror' or .='chapsect' or .='consume' or .='d-and-o' or .='frontmatte' or .='howtouse' or .='00howtouse' or .='intro' or .='nut_option' or .='oplimits' or .='sblist' or .='schedchk' or .='spectool' or .='timelim' or .='title-page']) and not(ancestor::ata-page-block/@pb-name[(starts-with(., 'do') and 'do' = translate(., '0123456789', '') and string-length(.) &gt; 2) or (starts-with(., 'in') and 'in' = translate(., '0123456789', '') and string-length(.) &gt; 2) or (starts-with(., 'tl') and 'tl' = translate(., '0123456789', '') and string-length(.) &gt; 2) or .='toolsht' or .='trlist' or .='unschedc' or .='unschedchk']) and not(ancestor::page-block/@pb-name[(starts-with(., 'do') and 'do' = translate(., '0123456789', '') and string-length(.) &gt; 2) or (starts-with(., 'in') and 'in' = translate(., '0123456789', '') and string-length(.) &gt; 2) or (starts-with(., 'tl') and 'tl' = translate(., '0123456789', '') and string-length(.) &gt; 2) or .='toolsht' or .='trlist' or .='unschedc' or .='unschedchk']) and not(ancestor-or-self::ata-page-block[1]/@pb-name and string(ancestor-or-self::ata-page-block[1]/@pb-name)='intro00') and not(ancestor-or-self::page-block[1]/@pb-name and string(ancestor-or-self::page-block[1]/@pb-name)='intro00') and not(ancestor::ata-page-block/@pb-name[starts-with(., 'disassy') or starts-with(., 'fault')]) and not(ancestor::page-block/@pb-name[starts-with(., 'disassy') or starts-with(., 'fault')]) and not(ancestor::book[contains(@doctype,'oh')] and ancestor::ata-page-block/@pb-name[starts-with(., 'clean')]) and not(ancestor::book[contains(@doctype,'oh')] and ancestor::page-block/@pb-name[starts-with(., 'clean')]) and (ancestor::ata-page-block/@pb-name[starts-with(., 'mainprac')])">
            <!-- Condition #16-->
            <xsl:if test="not(@_gte:Gentext-Expanded)">
               <_sfe:BeforeOrAfterText>Table <_gte:styler_numbering>
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
         </xsl:when>
         <xsl:when test="not(ancestor::book[contains(@doctype,'cir') or contains(@doctype,'em') or contains(@doctype,'tmm')]) and not(ancestor::book[contains(@doctype,'oh')] and ancestor::ata-page-block/@pb-name[.='service']) and not(ancestor::book[contains(@doctype,'oh')] and ancestor::page-block/@pb-name[.='service']) and not(ancestor::ata-page-block/@pb-name[.='00awl' or .='00intro' or .='airlim' or .='awl' or .='awlror' or .='chapsect' or .='consume' or .='d-and-o' or .='frontmatte' or .='howtouse' or .='00howtouse' or .='intro' or .='nut_option' or .='oplimits' or .='sblist' or .='schedchk' or .='spectool' or .='timelim' or .='title-page']) and not(ancestor::page-block/@pb-name[.='00awl' or .='00intro' or .='airlim' or .='awl' or .='awlror' or .='chapsect' or .='consume' or .='d-and-o' or .='frontmatte' or .='howtouse' or .='00howtouse' or .='intro' or .='nut_option' or .='oplimits' or .='sblist' or .='schedchk' or .='spectool' or .='timelim' or .='title-page']) and not(ancestor::ata-page-block/@pb-name[(starts-with(., 'do') and 'do' = translate(., '0123456789', '') and string-length(.) &gt; 2) or (starts-with(., 'in') and 'in' = translate(., '0123456789', '') and string-length(.) &gt; 2) or (starts-with(., 'tl') and 'tl' = translate(., '0123456789', '') and string-length(.) &gt; 2) or .='toolsht' or .='trlist' or .='unschedc' or .='unschedchk']) and not(ancestor::page-block/@pb-name[(starts-with(., 'do') and 'do' = translate(., '0123456789', '') and string-length(.) &gt; 2) or (starts-with(., 'in') and 'in' = translate(., '0123456789', '') and string-length(.) &gt; 2) or (starts-with(., 'tl') and 'tl' = translate(., '0123456789', '') and string-length(.) &gt; 2) or .='toolsht' or .='trlist' or .='unschedc' or .='unschedchk']) and not(ancestor-or-self::ata-page-block[1]/@pb-name and string(ancestor-or-self::ata-page-block[1]/@pb-name)='intro00') and not(ancestor-or-self::page-block[1]/@pb-name and string(ancestor-or-self::page-block[1]/@pb-name)='intro00') and not(ancestor::ata-page-block/@pb-name[starts-with(., 'disassy') or starts-with(., 'fault')]) and not(ancestor::page-block/@pb-name[starts-with(., 'disassy') or starts-with(., 'fault')]) and not(ancestor::book[contains(@doctype,'oh')] and ancestor::ata-page-block/@pb-name[starts-with(., 'clean')]) and (ancestor::book[contains(@doctype,'oh')] and ancestor::page-block/@pb-name[starts-with(., 'clean')])">
            <!-- Condition #15-->
            <xsl:if test="not(@_gte:Gentext-Expanded)">
               <_sfe:BeforeOrAfterText>Table <_gte:styler_numbering>
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
         </xsl:when>
         <xsl:when test="not(ancestor::book[contains(@doctype,'cir') or contains(@doctype,'em') or contains(@doctype,'tmm')]) and not(ancestor::book[contains(@doctype,'oh')] and ancestor::ata-page-block/@pb-name[.='service']) and not(ancestor::book[contains(@doctype,'oh')] and ancestor::page-block/@pb-name[.='service']) and not(ancestor::ata-page-block/@pb-name[.='00awl' or .='00intro' or .='airlim' or .='awl' or .='awlror' or .='chapsect' or .='consume' or .='d-and-o' or .='frontmatte' or .='howtouse' or .='00howtouse' or .='intro' or .='nut_option' or .='oplimits' or .='sblist' or .='schedchk' or .='spectool' or .='timelim' or .='title-page']) and not(ancestor::page-block/@pb-name[.='00awl' or .='00intro' or .='airlim' or .='awl' or .='awlror' or .='chapsect' or .='consume' or .='d-and-o' or .='frontmatte' or .='howtouse' or .='00howtouse' or .='intro' or .='nut_option' or .='oplimits' or .='sblist' or .='schedchk' or .='spectool' or .='timelim' or .='title-page']) and not(ancestor::ata-page-block/@pb-name[(starts-with(., 'do') and 'do' = translate(., '0123456789', '') and string-length(.) &gt; 2) or (starts-with(., 'in') and 'in' = translate(., '0123456789', '') and string-length(.) &gt; 2) or (starts-with(., 'tl') and 'tl' = translate(., '0123456789', '') and string-length(.) &gt; 2) or .='toolsht' or .='trlist' or .='unschedc' or .='unschedchk']) and not(ancestor::page-block/@pb-name[(starts-with(., 'do') and 'do' = translate(., '0123456789', '') and string-length(.) &gt; 2) or (starts-with(., 'in') and 'in' = translate(., '0123456789', '') and string-length(.) &gt; 2) or (starts-with(., 'tl') and 'tl' = translate(., '0123456789', '') and string-length(.) &gt; 2) or .='toolsht' or .='trlist' or .='unschedc' or .='unschedchk']) and not(ancestor-or-self::ata-page-block[1]/@pb-name and string(ancestor-or-self::ata-page-block[1]/@pb-name)='intro00') and not(ancestor-or-self::page-block[1]/@pb-name and string(ancestor-or-self::page-block[1]/@pb-name)='intro00') and not(ancestor::ata-page-block/@pb-name[starts-with(., 'disassy') or starts-with(., 'fault')]) and not(ancestor::page-block/@pb-name[starts-with(., 'disassy') or starts-with(., 'fault')]) and (ancestor::book[contains(@doctype,'oh')] and ancestor::ata-page-block/@pb-name[starts-with(., 'clean')])">
            <!-- Condition #14-->
            <xsl:if test="not(@_gte:Gentext-Expanded)">
               <_sfe:BeforeOrAfterText>Table <_gte:styler_numbering>
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
         </xsl:when>
         <xsl:when test="not(ancestor::book[contains(@doctype,'cir') or contains(@doctype,'em') or contains(@doctype,'tmm')]) and not(ancestor::book[contains(@doctype,'oh')] and ancestor::ata-page-block/@pb-name[.='service']) and not(ancestor::book[contains(@doctype,'oh')] and ancestor::page-block/@pb-name[.='service']) and not(ancestor::ata-page-block/@pb-name[.='00awl' or .='00intro' or .='airlim' or .='awl' or .='awlror' or .='chapsect' or .='consume' or .='d-and-o' or .='frontmatte' or .='howtouse' or .='00howtouse' or .='intro' or .='nut_option' or .='oplimits' or .='sblist' or .='schedchk' or .='spectool' or .='timelim' or .='title-page']) and not(ancestor::page-block/@pb-name[.='00awl' or .='00intro' or .='airlim' or .='awl' or .='awlror' or .='chapsect' or .='consume' or .='d-and-o' or .='frontmatte' or .='howtouse' or .='00howtouse' or .='intro' or .='nut_option' or .='oplimits' or .='sblist' or .='schedchk' or .='spectool' or .='timelim' or .='title-page']) and not(ancestor::ata-page-block/@pb-name[(starts-with(., 'do') and 'do' = translate(., '0123456789', '') and string-length(.) &gt; 2) or (starts-with(., 'in') and 'in' = translate(., '0123456789', '') and string-length(.) &gt; 2) or (starts-with(., 'tl') and 'tl' = translate(., '0123456789', '') and string-length(.) &gt; 2) or .='toolsht' or .='trlist' or .='unschedc' or .='unschedchk']) and not(ancestor::page-block/@pb-name[(starts-with(., 'do') and 'do' = translate(., '0123456789', '') and string-length(.) &gt; 2) or (starts-with(., 'in') and 'in' = translate(., '0123456789', '') and string-length(.) &gt; 2) or (starts-with(., 'tl') and 'tl' = translate(., '0123456789', '') and string-length(.) &gt; 2) or .='toolsht' or .='trlist' or .='unschedc' or .='unschedchk']) and not(ancestor-or-self::ata-page-block[1]/@pb-name and string(ancestor-or-self::ata-page-block[1]/@pb-name)='intro00') and not(ancestor-or-self::page-block[1]/@pb-name and string(ancestor-or-self::page-block[1]/@pb-name)='intro00') and not(ancestor::ata-page-block/@pb-name[starts-with(., 'disassy') or starts-with(., 'fault')]) and (ancestor::page-block/@pb-name[starts-with(., 'disassy') or starts-with(., 'fault')])">
            <!-- Condition #13-->
            <xsl:if test="not(@_gte:Gentext-Expanded)">
               <_sfe:BeforeOrAfterText>Table <_gte:styler_numbering>
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
         </xsl:when>
         <xsl:when test="not(ancestor::book[contains(@doctype,'cir') or contains(@doctype,'em') or contains(@doctype,'tmm')]) and not(ancestor::book[contains(@doctype,'oh')] and ancestor::ata-page-block/@pb-name[.='service']) and not(ancestor::book[contains(@doctype,'oh')] and ancestor::page-block/@pb-name[.='service']) and not(ancestor::ata-page-block/@pb-name[.='00awl' or .='00intro' or .='airlim' or .='awl' or .='awlror' or .='chapsect' or .='consume' or .='d-and-o' or .='frontmatte' or .='howtouse' or .='00howtouse' or .='intro' or .='nut_option' or .='oplimits' or .='sblist' or .='schedchk' or .='spectool' or .='timelim' or .='title-page']) and not(ancestor::page-block/@pb-name[.='00awl' or .='00intro' or .='airlim' or .='awl' or .='awlror' or .='chapsect' or .='consume' or .='d-and-o' or .='frontmatte' or .='howtouse' or .='00howtouse' or .='intro' or .='nut_option' or .='oplimits' or .='sblist' or .='schedchk' or .='spectool' or .='timelim' or .='title-page']) and not(ancestor::ata-page-block/@pb-name[(starts-with(., 'do') and 'do' = translate(., '0123456789', '') and string-length(.) &gt; 2) or (starts-with(., 'in') and 'in' = translate(., '0123456789', '') and string-length(.) &gt; 2) or (starts-with(., 'tl') and 'tl' = translate(., '0123456789', '') and string-length(.) &gt; 2) or .='toolsht' or .='trlist' or .='unschedc' or .='unschedchk']) and not(ancestor::page-block/@pb-name[(starts-with(., 'do') and 'do' = translate(., '0123456789', '') and string-length(.) &gt; 2) or (starts-with(., 'in') and 'in' = translate(., '0123456789', '') and string-length(.) &gt; 2) or (starts-with(., 'tl') and 'tl' = translate(., '0123456789', '') and string-length(.) &gt; 2) or .='toolsht' or .='trlist' or .='unschedc' or .='unschedchk']) and not(ancestor-or-self::ata-page-block[1]/@pb-name and string(ancestor-or-self::ata-page-block[1]/@pb-name)='intro00') and not(ancestor-or-self::page-block[1]/@pb-name and string(ancestor-or-self::page-block[1]/@pb-name)='intro00') and (ancestor::ata-page-block/@pb-name[starts-with(., 'disassy') or starts-with(., 'fault')])">
            <!-- Condition #12-->
            <xsl:if test="not(@_gte:Gentext-Expanded)">
               <_sfe:BeforeOrAfterText>Table <_gte:styler_numbering>
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
         </xsl:when>
         <xsl:when test="not(ancestor::book[contains(@doctype,'cir') or contains(@doctype,'em') or contains(@doctype,'tmm')]) and not(ancestor::book[contains(@doctype,'oh')] and ancestor::ata-page-block/@pb-name[.='service']) and not(ancestor::book[contains(@doctype,'oh')] and ancestor::page-block/@pb-name[.='service']) and not(ancestor::ata-page-block/@pb-name[.='00awl' or .='00intro' or .='airlim' or .='awl' or .='awlror' or .='chapsect' or .='consume' or .='d-and-o' or .='frontmatte' or .='howtouse' or .='00howtouse' or .='intro' or .='nut_option' or .='oplimits' or .='sblist' or .='schedchk' or .='spectool' or .='timelim' or .='title-page']) and not(ancestor::page-block/@pb-name[.='00awl' or .='00intro' or .='airlim' or .='awl' or .='awlror' or .='chapsect' or .='consume' or .='d-and-o' or .='frontmatte' or .='howtouse' or .='00howtouse' or .='intro' or .='nut_option' or .='oplimits' or .='sblist' or .='schedchk' or .='spectool' or .='timelim' or .='title-page']) and not(ancestor::ata-page-block/@pb-name[(starts-with(., 'do') and 'do' = translate(., '0123456789', '') and string-length(.) &gt; 2) or (starts-with(., 'in') and 'in' = translate(., '0123456789', '') and string-length(.) &gt; 2) or (starts-with(., 'tl') and 'tl' = translate(., '0123456789', '') and string-length(.) &gt; 2) or .='toolsht' or .='trlist' or .='unschedc' or .='unschedchk']) and not(ancestor::page-block/@pb-name[(starts-with(., 'do') and 'do' = translate(., '0123456789', '') and string-length(.) &gt; 2) or (starts-with(., 'in') and 'in' = translate(., '0123456789', '') and string-length(.) &gt; 2) or (starts-with(., 'tl') and 'tl' = translate(., '0123456789', '') and string-length(.) &gt; 2) or .='toolsht' or .='trlist' or .='unschedc' or .='unschedchk']) and not(ancestor-or-self::ata-page-block[1]/@pb-name and string(ancestor-or-self::ata-page-block[1]/@pb-name)='intro00') and (ancestor-or-self::page-block[1]/@pb-name and string(ancestor-or-self::page-block[1]/@pb-name)='intro00')">
            <!-- Condition #11-->
            <xsl:if test="not(@_gte:Gentext-Expanded)">
               <_sfe:BeforeOrAfterText>Table <_gte:styler_numbering>
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
         </xsl:when>
         <xsl:when test="not(ancestor::book[contains(@doctype,'cir') or contains(@doctype,'em') or contains(@doctype,'tmm')]) and not(ancestor::book[contains(@doctype,'oh')] and ancestor::ata-page-block/@pb-name[.='service']) and not(ancestor::book[contains(@doctype,'oh')] and ancestor::page-block/@pb-name[.='service']) and not(ancestor::ata-page-block/@pb-name[.='00awl' or .='00intro' or .='airlim' or .='awl' or .='awlror' or .='chapsect' or .='consume' or .='d-and-o' or .='frontmatte' or .='howtouse' or .='00howtouse' or .='intro' or .='nut_option' or .='oplimits' or .='sblist' or .='schedchk' or .='spectool' or .='timelim' or .='title-page']) and not(ancestor::page-block/@pb-name[.='00awl' or .='00intro' or .='airlim' or .='awl' or .='awlror' or .='chapsect' or .='consume' or .='d-and-o' or .='frontmatte' or .='howtouse' or .='00howtouse' or .='intro' or .='nut_option' or .='oplimits' or .='sblist' or .='schedchk' or .='spectool' or .='timelim' or .='title-page']) and not(ancestor::ata-page-block/@pb-name[(starts-with(., 'do') and 'do' = translate(., '0123456789', '') and string-length(.) &gt; 2) or (starts-with(., 'in') and 'in' = translate(., '0123456789', '') and string-length(.) &gt; 2) or (starts-with(., 'tl') and 'tl' = translate(., '0123456789', '') and string-length(.) &gt; 2) or .='toolsht' or .='trlist' or .='unschedc' or .='unschedchk']) and not(ancestor::page-block/@pb-name[(starts-with(., 'do') and 'do' = translate(., '0123456789', '') and string-length(.) &gt; 2) or (starts-with(., 'in') and 'in' = translate(., '0123456789', '') and string-length(.) &gt; 2) or (starts-with(., 'tl') and 'tl' = translate(., '0123456789', '') and string-length(.) &gt; 2) or .='toolsht' or .='trlist' or .='unschedc' or .='unschedchk']) and (ancestor-or-self::ata-page-block[1]/@pb-name and string(ancestor-or-self::ata-page-block[1]/@pb-name)='intro00')">
            <!-- Condition #10-->
            <xsl:if test="not(@_gte:Gentext-Expanded)">
               <_sfe:BeforeOrAfterText>Table <_gte:styler_numbering>
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
         </xsl:when>
         <xsl:when test="not(ancestor::book[contains(@doctype,'cir') or contains(@doctype,'em') or contains(@doctype,'tmm')]) and not(ancestor::book[contains(@doctype,'oh')] and ancestor::ata-page-block/@pb-name[.='service']) and not(ancestor::book[contains(@doctype,'oh')] and ancestor::page-block/@pb-name[.='service']) and not(ancestor::ata-page-block/@pb-name[.='00awl' or .='00intro' or .='airlim' or .='awl' or .='awlror' or .='chapsect' or .='consume' or .='d-and-o' or .='frontmatte' or .='howtouse' or .='00howtouse' or .='intro' or .='nut_option' or .='oplimits' or .='sblist' or .='schedchk' or .='spectool' or .='timelim' or .='title-page']) and not(ancestor::page-block/@pb-name[.='00awl' or .='00intro' or .='airlim' or .='awl' or .='awlror' or .='chapsect' or .='consume' or .='d-and-o' or .='frontmatte' or .='howtouse' or .='00howtouse' or .='intro' or .='nut_option' or .='oplimits' or .='sblist' or .='schedchk' or .='spectool' or .='timelim' or .='title-page']) and not(ancestor::ata-page-block/@pb-name[(starts-with(., 'do') and 'do' = translate(., '0123456789', '') and string-length(.) &gt; 2) or (starts-with(., 'in') and 'in' = translate(., '0123456789', '') and string-length(.) &gt; 2) or (starts-with(., 'tl') and 'tl' = translate(., '0123456789', '') and string-length(.) &gt; 2) or .='toolsht' or .='trlist' or .='unschedc' or .='unschedchk']) and (ancestor::page-block/@pb-name[(starts-with(., 'do') and 'do' = translate(., '0123456789', '') and string-length(.) &gt; 2) or (starts-with(., 'in') and 'in' = translate(., '0123456789', '') and string-length(.) &gt; 2) or (starts-with(., 'tl') and 'tl' = translate(., '0123456789', '') and string-length(.) &gt; 2) or .='toolsht' or .='trlist' or .='unschedc' or .='unschedchk'])">
            <!-- Condition #9-->
            <xsl:if test="not(@_gte:Gentext-Expanded)">
               <_sfe:BeforeOrAfterText>Table <_gte:styler_numbering>
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
         </xsl:when>
         <xsl:when test="not(ancestor::book[contains(@doctype,'cir') or contains(@doctype,'em') or contains(@doctype,'tmm')]) and not(ancestor::book[contains(@doctype,'oh')] and ancestor::ata-page-block/@pb-name[.='service']) and not(ancestor::book[contains(@doctype,'oh')] and ancestor::page-block/@pb-name[.='service']) and not(ancestor::ata-page-block/@pb-name[.='00awl' or .='00intro' or .='airlim' or .='awl' or .='awlror' or .='chapsect' or .='consume' or .='d-and-o' or .='frontmatte' or .='howtouse' or .='00howtouse' or .='intro' or .='nut_option' or .='oplimits' or .='sblist' or .='schedchk' or .='spectool' or .='timelim' or .='title-page']) and not(ancestor::page-block/@pb-name[.='00awl' or .='00intro' or .='airlim' or .='awl' or .='awlror' or .='chapsect' or .='consume' or .='d-and-o' or .='frontmatte' or .='howtouse' or .='00howtouse' or .='intro' or .='nut_option' or .='oplimits' or .='sblist' or .='schedchk' or .='spectool' or .='timelim' or .='title-page']) and (ancestor::ata-page-block/@pb-name[(starts-with(., 'do') and 'do' = translate(., '0123456789', '') and string-length(.) &gt; 2) or (starts-with(., 'in') and 'in' = translate(., '0123456789', '') and string-length(.) &gt; 2) or (starts-with(., 'tl') and 'tl' = translate(., '0123456789', '') and string-length(.) &gt; 2) or .='toolsht' or .='trlist' or .='unschedc' or .='unschedchk'])">
            <!-- Condition #8-->
            <xsl:if test="not(@_gte:Gentext-Expanded)">
               <_sfe:BeforeOrAfterText>Table <_gte:styler_numbering>
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
         </xsl:when>
         <xsl:when test="not(ancestor::book[contains(@doctype,'cir') or contains(@doctype,'em') or contains(@doctype,'tmm')]) and not(ancestor::book[contains(@doctype,'oh')] and ancestor::ata-page-block/@pb-name[.='service']) and not(ancestor::book[contains(@doctype,'oh')] and ancestor::page-block/@pb-name[.='service']) and not(ancestor::ata-page-block/@pb-name[.='00awl' or .='00intro' or .='airlim' or .='awl' or .='awlror' or .='chapsect' or .='consume' or .='d-and-o' or .='frontmatte' or .='howtouse' or .='00howtouse' or .='intro' or .='nut_option' or .='oplimits' or .='sblist' or .='schedchk' or .='spectool' or .='timelim' or .='title-page']) and (ancestor::page-block/@pb-name[.='00awl' or .='00intro' or .='airlim' or .='awl' or .='awlror' or .='chapsect' or .='consume' or .='d-and-o' or .='frontmatte' or .='howtouse' or .='00howtouse' or .='intro' or .='nut_option' or .='oplimits' or .='sblist' or .='schedchk' or .='spectool' or .='timelim' or .='title-page'])">
            <!-- Condition #7-->
            <xsl:if test="not(@_gte:Gentext-Expanded)">
               <_sfe:BeforeOrAfterText>Table <_gte:styler_numbering>
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
         </xsl:when>
         <xsl:when test="not(ancestor::book[contains(@doctype,'cir') or contains(@doctype,'em') or contains(@doctype,'tmm')]) and not(ancestor::book[contains(@doctype,'oh')] and ancestor::ata-page-block/@pb-name[.='service']) and not(ancestor::book[contains(@doctype,'oh')] and ancestor::page-block/@pb-name[.='service']) and (ancestor::ata-page-block/@pb-name[.='00awl' or .='00intro' or .='airlim' or .='awl' or .='awlror' or .='chapsect' or .='consume' or .='d-and-o' or .='frontmatte' or .='howtouse' or .='00howtouse' or .='intro' or .='nut_option' or .='oplimits' or .='sblist' or .='schedchk' or .='spectool' or .='timelim' or .='title-page'])">
            <!-- Condition #6-->
            <xsl:if test="not(@_gte:Gentext-Expanded)">
               <_sfe:BeforeOrAfterText>Table <_gte:styler_numbering>
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
         </xsl:when>
         <xsl:when test="not(ancestor::book[contains(@doctype,'cir') or contains(@doctype,'em') or contains(@doctype,'tmm')]) and not(ancestor::book[contains(@doctype,'oh')] and ancestor::ata-page-block/@pb-name[.='service']) and (ancestor::book[contains(@doctype,'oh')] and ancestor::page-block/@pb-name[.='service'])">
            <!-- Condition #5-->
            <xsl:if test="not(@_gte:Gentext-Expanded)">
               <_sfe:BeforeOrAfterText/>
            </xsl:if>
         </xsl:when>
         <xsl:when test="not(ancestor::book[contains(@doctype,'cir') or contains(@doctype,'em') or contains(@doctype,'tmm')]) and (ancestor::book[contains(@doctype,'oh')] and ancestor::ata-page-block/@pb-name[.='service'])">
            <!-- Condition #4-->
            <xsl:if test="not(@_gte:Gentext-Expanded)">
               <_sfe:BeforeOrAfterText/>
            </xsl:if>
         </xsl:when>
         <xsl:when test="(ancestor::book[contains(@doctype,'cir') or contains(@doctype,'em') or contains(@doctype,'tmm')]) and not(number(ancestor::pgblk/@pgblknbr)&gt;0 and number(ancestor::pgblk/@pgblknbr)&lt;=13)">
            <!-- Condition #3-->
            <xsl:if test="not(@_gte:Gentext-Expanded)">
               <_sfe:BeforeOrAfterText>Table <_gte:styler_numbering>
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
         </xsl:when>
         <xsl:when test="(ancestor::book[contains(@doctype,'cir') or contains(@doctype,'em') or contains(@doctype,'tmm')]) and (number(ancestor::pgblk/@pgblknbr)&gt;0 and number(ancestor::pgblk/@pgblknbr)&lt;=13)">
            <!-- Condition #2-->
            <xsl:if test="not(@_gte:Gentext-Expanded)">
               <_sfe:BeforeOrAfterText>Table <_gte:styler_numbering>
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
         </xsl:when>
      </xsl:choose>
   </xsl:template>

<xsl:template match="table/title" mode="styler-LabelAndNumberMarker" priority="5">
      <xsl:choose>
         <xsl:when test="(ancestor-or-self::table[1]/@tabstyle and string(ancestor-or-self::table[1]/@tabstyle)='fits-and-clears') and (/ata-page-block//table/title)">
            <!--LabelAndNumberMarker for condition #41-->
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
         </xsl:when>
         <xsl:when test="(ancestor-or-self::table[1]/@tabstyle and string(ancestor-or-self::table[1]/@tabstyle)='fits-and-clears') and (/page-block//table/title)">
            <!-- Condition #40-->
            <xsl:if test="not(@_gte:Gentext-Expanded)">
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
         </xsl:when>
         <xsl:when test="not(ancestor::book[contains(@doctype,'cir') or contains(@doctype,'em') or contains(@doctype,'tmm')]) and not(ancestor::book[contains(@doctype,'oh')] and ancestor::ata-page-block/@pb-name[.='service']) and not(ancestor::book[contains(@doctype,'oh')] and ancestor::page-block/@pb-name[.='service']) and not(ancestor::ata-page-block/@pb-name[.='00awl' or .='00intro' or .='airlim' or .='awl' or .='awlror' or .='chapsect' or .='consume' or .='d-and-o' or .='frontmatte' or .='howtouse' or .='00howtouse' or .='intro' or .='nut_option' or .='oplimits' or .='sblist' or .='schedchk' or .='spectool' or .='timelim' or .='title-page']) and not(ancestor::page-block/@pb-name[.='00awl' or .='00intro' or .='airlim' or .='awl' or .='awlror' or .='chapsect' or .='consume' or .='d-and-o' or .='frontmatte' or .='howtouse' or .='00howtouse' or .='intro' or .='nut_option' or .='oplimits' or .='sblist' or .='schedchk' or .='spectool' or .='timelim' or .='title-page']) and not(ancestor::ata-page-block/@pb-name[(starts-with(., 'do') and 'do' = translate(., '0123456789', '') and string-length(.) &gt; 2) or (starts-with(., 'in') and 'in' = translate(., '0123456789', '') and string-length(.) &gt; 2) or (starts-with(., 'tl') and 'tl' = translate(., '0123456789', '') and string-length(.) &gt; 2) or .='toolsht' or .='trlist' or .='unschedc' or .='unschedchk']) and not(ancestor::page-block/@pb-name[(starts-with(., 'do') and 'do' = translate(., '0123456789', '') and string-length(.) &gt; 2) or (starts-with(., 'in') and 'in' = translate(., '0123456789', '') and string-length(.) &gt; 2) or (starts-with(., 'tl') and 'tl' = translate(., '0123456789', '') and string-length(.) &gt; 2) or .='toolsht' or .='trlist' or .='unschedc' or .='unschedchk']) and not(ancestor-or-self::ata-page-block[1]/@pb-name and string(ancestor-or-self::ata-page-block[1]/@pb-name)='intro00') and not(ancestor-or-self::page-block[1]/@pb-name and string(ancestor-or-self::page-block[1]/@pb-name)='intro00') and not(ancestor::ata-page-block/@pb-name[starts-with(., 'disassy') or starts-with(., 'fault')]) and not(ancestor::page-block/@pb-name[starts-with(., 'disassy') or starts-with(., 'fault')]) and not(ancestor::book[contains(@doctype,'oh')] and ancestor::ata-page-block/@pb-name[starts-with(., 'clean')]) and not(ancestor::book[contains(@doctype,'oh')] and ancestor::page-block/@pb-name[starts-with(., 'clean')]) and not(ancestor::ata-page-block/@pb-name[starts-with(., 'mainprac')]) and not(ancestor::page-block/@pb-name[starts-with(., 'mainprac')]) and not(ancestor::book[contains(@doctype,'oh')] and ancestor::ata-page-block/@pb-name[starts-with(., 'inspect')]) and not(ancestor::book[contains(@doctype,'oh')] and ancestor::page-block/@pb-name[starts-with(., 'inspect')]) and not(ancestor::ata-page-block/@pb-name[(starts-with(., 'di') and 'di' = translate(., '0123456789', '') and string-length(.) &gt; 2) or starts-with(.,'service')]) and not(ancestor::page-block/@pb-name[(starts-with(., 'di') and 'di' = translate(., '0123456789', '') and string-length(.) &gt; 2) or starts-with(.,'service')]) and not(ancestor::book[contains(@doctype,'oh')] and ancestor::ata-page-block/@pb-name[starts-with(., 'repair')]) and not(ancestor::book[contains(@doctype,'oh')] and ancestor::page-block/@pb-name[starts-with(., 'repair')]) and not(ancestor::book[contains(@doctype,'oh')] and ancestor::ata-page-block/@pb-name[starts-with(., 'test')]) and not(ancestor::book[contains(@doctype,'oh')] and ancestor::page-block/@pb-name[starts-with(., 'test')]) and not(ancestor::ata-page-block/@pb-name[(starts-with(., 'cl') and 'cl' = translate(., '0123456789', '') and string-length(.) &gt; 2) or .='install' or starts-with(.,'rem-inst') or (starts-with(., 'reminst') and 'reminst' = translate(., '0123456789', '') and string-length(.) &gt; 7) or .='remove' or (starts-with(., 'repair') and 'repair' = translate(., '0123456789', '') and string-length(.) &gt; 6)]) and not(ancestor::page-block/@pb-name[(starts-with(., 'cl') and 'cl' = translate(., '0123456789', '') and string-length(.) &gt; 2) or .='install' or starts-with(.,'rem-inst') or (starts-with(., 'reminst') and 'reminst' = translate(., '0123456789', '') and string-length(.) &gt; 7) or .='remove' or (starts-with(., 'repair') and 'repair' = translate(., '0123456789', '') and string-length(.) &gt; 6)]) and not(ancestor::ata-page-block/@pb-name[starts-with(., 'assy') or (starts-with(., 'ic') and 'ic' = translate(., '0123456789', '') and string-length(.) &gt; 2) or (starts-with(., 'te') and 'te' = translate(., '0123456789', '') and string-length(.) &gt; 2) or .='test']) and not(ancestor::page-block/@pb-name[starts-with(., 'assy') or (starts-with(., 'ic') and 'ic' = translate(., '0123456789', '') and string-length(.) &gt; 2) or (starts-with(., 'te') and 'te' = translate(., '0123456789', '') and string-length(.) &gt; 2) or .='test']) and not(ancestor::ata-page-block/@pb-name[.='f-and-c' or starts-with(., 'inspect') or (starts-with(., 're') and 're' = translate(., '0123456789', '') and string-length(.) &gt; 2)]) and not(ancestor::page-block/@pb-name[.='f-and-c' or starts-with(., 'inspect') or (starts-with(., 're') and 're' = translate(., '0123456789', '') and string-length(.) &gt; 2)]) and not(ancestor::ata-page-block/@pb-name[(starts-with(., 'as') and 'as' = translate(., '0123456789', '') and string-length(.) &gt; 2) or starts-with(.,'clean') or (starts-with(., 'test') and 'test' = translate(., '0123456789', '') and string-length(.) &gt; 4)]) and not(ancestor::page-block/@pb-name[(starts-with(., 'as') and 'as' = translate(., '0123456789', '') and string-length(.) &gt; 2) or starts-with(.,'clean') or (starts-with(., 'test') and 'test' = translate(., '0123456789', '') and string-length(.) &gt; 4)]) and not(ancestor::ata-page-block/@pb-name[(starts-with(., 'fc') and 'fc' = translate(., '0123456789', '') and string-length(.) &gt; 2) or starts-with(.,'repair') or .='trouble']) and not(ancestor::page-block/@pb-name[(starts-with(., 'fc') and 'fc' = translate(., '0123456789', '') and string-length(.) &gt; 2) or starts-with(.,'repair') or .='trouble']) and not(ancestor::ata-page-block/@pb-name[starts-with(.,'storage') or (starts-with(., 'to') and 'to' = translate(., '0123456789', '') and string-length(.) &gt; 2)]) and not(ancestor::page-block/@pb-name[starts-with(.,'storage') or (starts-with(., 'to') and 'to' = translate(., '0123456789', '') and string-length(.) &gt; 2)]) and not(ancestor::ata-page-block/@pb-name[.='it-oh' or .='lt-oh']) and (ancestor::page-block/@pb-name[.='it-oh' or .='lt-oh'])">
            <!-- Condition #39-->
            <xsl:if test="not(@_gte:Gentext-Expanded)">
               <_sfe:BeforeOrAfterText>
                  <_ufe:hidden>Table <_gte:styler_numbering>
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
                  </_ufe:hidden>
               </_sfe:BeforeOrAfterText>
            </xsl:if>
         </xsl:when>
         <xsl:when test="not(ancestor::book[contains(@doctype,'cir') or contains(@doctype,'em') or contains(@doctype,'tmm')]) and not(ancestor::book[contains(@doctype,'oh')] and ancestor::ata-page-block/@pb-name[.='service']) and not(ancestor::book[contains(@doctype,'oh')] and ancestor::page-block/@pb-name[.='service']) and not(ancestor::ata-page-block/@pb-name[.='00awl' or .='00intro' or .='airlim' or .='awl' or .='awlror' or .='chapsect' or .='consume' or .='d-and-o' or .='frontmatte' or .='howtouse' or .='00howtouse' or .='intro' or .='nut_option' or .='oplimits' or .='sblist' or .='schedchk' or .='spectool' or .='timelim' or .='title-page']) and not(ancestor::page-block/@pb-name[.='00awl' or .='00intro' or .='airlim' or .='awl' or .='awlror' or .='chapsect' or .='consume' or .='d-and-o' or .='frontmatte' or .='howtouse' or .='00howtouse' or .='intro' or .='nut_option' or .='oplimits' or .='sblist' or .='schedchk' or .='spectool' or .='timelim' or .='title-page']) and not(ancestor::ata-page-block/@pb-name[(starts-with(., 'do') and 'do' = translate(., '0123456789', '') and string-length(.) &gt; 2) or (starts-with(., 'in') and 'in' = translate(., '0123456789', '') and string-length(.) &gt; 2) or (starts-with(., 'tl') and 'tl' = translate(., '0123456789', '') and string-length(.) &gt; 2) or .='toolsht' or .='trlist' or .='unschedc' or .='unschedchk']) and not(ancestor::page-block/@pb-name[(starts-with(., 'do') and 'do' = translate(., '0123456789', '') and string-length(.) &gt; 2) or (starts-with(., 'in') and 'in' = translate(., '0123456789', '') and string-length(.) &gt; 2) or (starts-with(., 'tl') and 'tl' = translate(., '0123456789', '') and string-length(.) &gt; 2) or .='toolsht' or .='trlist' or .='unschedc' or .='unschedchk']) and not(ancestor-or-self::ata-page-block[1]/@pb-name and string(ancestor-or-self::ata-page-block[1]/@pb-name)='intro00') and not(ancestor-or-self::page-block[1]/@pb-name and string(ancestor-or-self::page-block[1]/@pb-name)='intro00') and not(ancestor::ata-page-block/@pb-name[starts-with(., 'disassy') or starts-with(., 'fault')]) and not(ancestor::page-block/@pb-name[starts-with(., 'disassy') or starts-with(., 'fault')]) and not(ancestor::book[contains(@doctype,'oh')] and ancestor::ata-page-block/@pb-name[starts-with(., 'clean')]) and not(ancestor::book[contains(@doctype,'oh')] and ancestor::page-block/@pb-name[starts-with(., 'clean')]) and not(ancestor::ata-page-block/@pb-name[starts-with(., 'mainprac')]) and not(ancestor::page-block/@pb-name[starts-with(., 'mainprac')]) and not(ancestor::book[contains(@doctype,'oh')] and ancestor::ata-page-block/@pb-name[starts-with(., 'inspect')]) and not(ancestor::book[contains(@doctype,'oh')] and ancestor::page-block/@pb-name[starts-with(., 'inspect')]) and not(ancestor::ata-page-block/@pb-name[(starts-with(., 'di') and 'di' = translate(., '0123456789', '') and string-length(.) &gt; 2) or starts-with(.,'service')]) and not(ancestor::page-block/@pb-name[(starts-with(., 'di') and 'di' = translate(., '0123456789', '') and string-length(.) &gt; 2) or starts-with(.,'service')]) and not(ancestor::book[contains(@doctype,'oh')] and ancestor::ata-page-block/@pb-name[starts-with(., 'repair')]) and not(ancestor::book[contains(@doctype,'oh')] and ancestor::page-block/@pb-name[starts-with(., 'repair')]) and not(ancestor::book[contains(@doctype,'oh')] and ancestor::ata-page-block/@pb-name[starts-with(., 'test')]) and not(ancestor::book[contains(@doctype,'oh')] and ancestor::page-block/@pb-name[starts-with(., 'test')]) and not(ancestor::ata-page-block/@pb-name[(starts-with(., 'cl') and 'cl' = translate(., '0123456789', '') and string-length(.) &gt; 2) or .='install' or starts-with(.,'rem-inst') or (starts-with(., 'reminst') and 'reminst' = translate(., '0123456789', '') and string-length(.) &gt; 7) or .='remove' or (starts-with(., 'repair') and 'repair' = translate(., '0123456789', '') and string-length(.) &gt; 6)]) and not(ancestor::page-block/@pb-name[(starts-with(., 'cl') and 'cl' = translate(., '0123456789', '') and string-length(.) &gt; 2) or .='install' or starts-with(.,'rem-inst') or (starts-with(., 'reminst') and 'reminst' = translate(., '0123456789', '') and string-length(.) &gt; 7) or .='remove' or (starts-with(., 'repair') and 'repair' = translate(., '0123456789', '') and string-length(.) &gt; 6)]) and not(ancestor::ata-page-block/@pb-name[starts-with(., 'assy') or (starts-with(., 'ic') and 'ic' = translate(., '0123456789', '') and string-length(.) &gt; 2) or (starts-with(., 'te') and 'te' = translate(., '0123456789', '') and string-length(.) &gt; 2) or .='test']) and not(ancestor::page-block/@pb-name[starts-with(., 'assy') or (starts-with(., 'ic') and 'ic' = translate(., '0123456789', '') and string-length(.) &gt; 2) or (starts-with(., 'te') and 'te' = translate(., '0123456789', '') and string-length(.) &gt; 2) or .='test']) and not(ancestor::ata-page-block/@pb-name[.='f-and-c' or starts-with(., 'inspect') or (starts-with(., 're') and 're' = translate(., '0123456789', '') and string-length(.) &gt; 2)]) and not(ancestor::page-block/@pb-name[.='f-and-c' or starts-with(., 'inspect') or (starts-with(., 're') and 're' = translate(., '0123456789', '') and string-length(.) &gt; 2)]) and not(ancestor::ata-page-block/@pb-name[(starts-with(., 'as') and 'as' = translate(., '0123456789', '') and string-length(.) &gt; 2) or starts-with(.,'clean') or (starts-with(., 'test') and 'test' = translate(., '0123456789', '') and string-length(.) &gt; 4)]) and not(ancestor::page-block/@pb-name[(starts-with(., 'as') and 'as' = translate(., '0123456789', '') and string-length(.) &gt; 2) or starts-with(.,'clean') or (starts-with(., 'test') and 'test' = translate(., '0123456789', '') and string-length(.) &gt; 4)]) and not(ancestor::ata-page-block/@pb-name[(starts-with(., 'fc') and 'fc' = translate(., '0123456789', '') and string-length(.) &gt; 2) or starts-with(.,'repair') or .='trouble']) and not(ancestor::page-block/@pb-name[(starts-with(., 'fc') and 'fc' = translate(., '0123456789', '') and string-length(.) &gt; 2) or starts-with(.,'repair') or .='trouble']) and not(ancestor::ata-page-block/@pb-name[starts-with(.,'storage') or (starts-with(., 'to') and 'to' = translate(., '0123456789', '') and string-length(.) &gt; 2)]) and not(ancestor::page-block/@pb-name[starts-with(.,'storage') or (starts-with(., 'to') and 'to' = translate(., '0123456789', '') and string-length(.) &gt; 2)]) and (ancestor::ata-page-block/@pb-name[.='it-oh' or .='lt-oh'])">
            <!-- Condition #38-->
            <xsl:if test="not(@_gte:Gentext-Expanded)">
               <_sfe:BeforeOrAfterText>
                  <_ufe:hidden>Table <_gte:styler_numbering>
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
                  </_ufe:hidden>
               </_sfe:BeforeOrAfterText>
            </xsl:if>
         </xsl:when>
         <xsl:when test="not(ancestor::book[contains(@doctype,'cir') or contains(@doctype,'em') or contains(@doctype,'tmm')]) and not(ancestor::book[contains(@doctype,'oh')] and ancestor::ata-page-block/@pb-name[.='service']) and not(ancestor::book[contains(@doctype,'oh')] and ancestor::page-block/@pb-name[.='service']) and not(ancestor::ata-page-block/@pb-name[.='00awl' or .='00intro' or .='airlim' or .='awl' or .='awlror' or .='chapsect' or .='consume' or .='d-and-o' or .='frontmatte' or .='howtouse' or .='00howtouse' or .='intro' or .='nut_option' or .='oplimits' or .='sblist' or .='schedchk' or .='spectool' or .='timelim' or .='title-page']) and not(ancestor::page-block/@pb-name[.='00awl' or .='00intro' or .='airlim' or .='awl' or .='awlror' or .='chapsect' or .='consume' or .='d-and-o' or .='frontmatte' or .='howtouse' or .='00howtouse' or .='intro' or .='nut_option' or .='oplimits' or .='sblist' or .='schedchk' or .='spectool' or .='timelim' or .='title-page']) and not(ancestor::ata-page-block/@pb-name[(starts-with(., 'do') and 'do' = translate(., '0123456789', '') and string-length(.) &gt; 2) or (starts-with(., 'in') and 'in' = translate(., '0123456789', '') and string-length(.) &gt; 2) or (starts-with(., 'tl') and 'tl' = translate(., '0123456789', '') and string-length(.) &gt; 2) or .='toolsht' or .='trlist' or .='unschedc' or .='unschedchk']) and not(ancestor::page-block/@pb-name[(starts-with(., 'do') and 'do' = translate(., '0123456789', '') and string-length(.) &gt; 2) or (starts-with(., 'in') and 'in' = translate(., '0123456789', '') and string-length(.) &gt; 2) or (starts-with(., 'tl') and 'tl' = translate(., '0123456789', '') and string-length(.) &gt; 2) or .='toolsht' or .='trlist' or .='unschedc' or .='unschedchk']) and not(ancestor-or-self::ata-page-block[1]/@pb-name and string(ancestor-or-self::ata-page-block[1]/@pb-name)='intro00') and not(ancestor-or-self::page-block[1]/@pb-name and string(ancestor-or-self::page-block[1]/@pb-name)='intro00') and not(ancestor::ata-page-block/@pb-name[starts-with(., 'disassy') or starts-with(., 'fault')]) and not(ancestor::page-block/@pb-name[starts-with(., 'disassy') or starts-with(., 'fault')]) and not(ancestor::book[contains(@doctype,'oh')] and ancestor::ata-page-block/@pb-name[starts-with(., 'clean')]) and not(ancestor::book[contains(@doctype,'oh')] and ancestor::page-block/@pb-name[starts-with(., 'clean')]) and not(ancestor::ata-page-block/@pb-name[starts-with(., 'mainprac')]) and not(ancestor::page-block/@pb-name[starts-with(., 'mainprac')]) and not(ancestor::book[contains(@doctype,'oh')] and ancestor::ata-page-block/@pb-name[starts-with(., 'inspect')]) and not(ancestor::book[contains(@doctype,'oh')] and ancestor::page-block/@pb-name[starts-with(., 'inspect')]) and not(ancestor::ata-page-block/@pb-name[(starts-with(., 'di') and 'di' = translate(., '0123456789', '') and string-length(.) &gt; 2) or starts-with(.,'service')]) and not(ancestor::page-block/@pb-name[(starts-with(., 'di') and 'di' = translate(., '0123456789', '') and string-length(.) &gt; 2) or starts-with(.,'service')]) and not(ancestor::book[contains(@doctype,'oh')] and ancestor::ata-page-block/@pb-name[starts-with(., 'repair')]) and not(ancestor::book[contains(@doctype,'oh')] and ancestor::page-block/@pb-name[starts-with(., 'repair')]) and not(ancestor::book[contains(@doctype,'oh')] and ancestor::ata-page-block/@pb-name[starts-with(., 'test')]) and not(ancestor::book[contains(@doctype,'oh')] and ancestor::page-block/@pb-name[starts-with(., 'test')]) and not(ancestor::ata-page-block/@pb-name[(starts-with(., 'cl') and 'cl' = translate(., '0123456789', '') and string-length(.) &gt; 2) or .='install' or starts-with(.,'rem-inst') or (starts-with(., 'reminst') and 'reminst' = translate(., '0123456789', '') and string-length(.) &gt; 7) or .='remove' or (starts-with(., 'repair') and 'repair' = translate(., '0123456789', '') and string-length(.) &gt; 6)]) and not(ancestor::page-block/@pb-name[(starts-with(., 'cl') and 'cl' = translate(., '0123456789', '') and string-length(.) &gt; 2) or .='install' or starts-with(.,'rem-inst') or (starts-with(., 'reminst') and 'reminst' = translate(., '0123456789', '') and string-length(.) &gt; 7) or .='remove' or (starts-with(., 'repair') and 'repair' = translate(., '0123456789', '') and string-length(.) &gt; 6)]) and not(ancestor::ata-page-block/@pb-name[starts-with(., 'assy') or (starts-with(., 'ic') and 'ic' = translate(., '0123456789', '') and string-length(.) &gt; 2) or (starts-with(., 'te') and 'te' = translate(., '0123456789', '') and string-length(.) &gt; 2) or .='test']) and not(ancestor::page-block/@pb-name[starts-with(., 'assy') or (starts-with(., 'ic') and 'ic' = translate(., '0123456789', '') and string-length(.) &gt; 2) or (starts-with(., 'te') and 'te' = translate(., '0123456789', '') and string-length(.) &gt; 2) or .='test']) and not(ancestor::ata-page-block/@pb-name[.='f-and-c' or starts-with(., 'inspect') or (starts-with(., 're') and 're' = translate(., '0123456789', '') and string-length(.) &gt; 2)]) and not(ancestor::page-block/@pb-name[.='f-and-c' or starts-with(., 'inspect') or (starts-with(., 're') and 're' = translate(., '0123456789', '') and string-length(.) &gt; 2)]) and not(ancestor::ata-page-block/@pb-name[(starts-with(., 'as') and 'as' = translate(., '0123456789', '') and string-length(.) &gt; 2) or starts-with(.,'clean') or (starts-with(., 'test') and 'test' = translate(., '0123456789', '') and string-length(.) &gt; 4)]) and not(ancestor::page-block/@pb-name[(starts-with(., 'as') and 'as' = translate(., '0123456789', '') and string-length(.) &gt; 2) or starts-with(.,'clean') or (starts-with(., 'test') and 'test' = translate(., '0123456789', '') and string-length(.) &gt; 4)]) and not(ancestor::ata-page-block/@pb-name[(starts-with(., 'fc') and 'fc' = translate(., '0123456789', '') and string-length(.) &gt; 2) or starts-with(.,'repair') or .='trouble']) and not(ancestor::page-block/@pb-name[(starts-with(., 'fc') and 'fc' = translate(., '0123456789', '') and string-length(.) &gt; 2) or starts-with(.,'repair') or .='trouble']) and not(ancestor::ata-page-block/@pb-name[starts-with(.,'storage') or (starts-with(., 'to') and 'to' = translate(., '0123456789', '') and string-length(.) &gt; 2)]) and (ancestor::page-block/@pb-name[starts-with(.,'storage') or (starts-with(., 'to') and 'to' = translate(., '0123456789', '') and string-length(.) &gt; 2)])">
            <!-- Condition #37-->
            <xsl:if test="not(@_gte:Gentext-Expanded)">
               <_sfe:BeforeOrAfterText>
                  <_ufe:hidden>Table <_gte:styler_numbering>
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
                  </_ufe:hidden>
               </_sfe:BeforeOrAfterText>
            </xsl:if>
         </xsl:when>
         <xsl:when test="not(ancestor::book[contains(@doctype,'cir') or contains(@doctype,'em') or contains(@doctype,'tmm')]) and not(ancestor::book[contains(@doctype,'oh')] and ancestor::ata-page-block/@pb-name[.='service']) and not(ancestor::book[contains(@doctype,'oh')] and ancestor::page-block/@pb-name[.='service']) and not(ancestor::ata-page-block/@pb-name[.='00awl' or .='00intro' or .='airlim' or .='awl' or .='awlror' or .='chapsect' or .='consume' or .='d-and-o' or .='frontmatte' or .='howtouse' or .='00howtouse' or .='intro' or .='nut_option' or .='oplimits' or .='sblist' or .='schedchk' or .='spectool' or .='timelim' or .='title-page']) and not(ancestor::page-block/@pb-name[.='00awl' or .='00intro' or .='airlim' or .='awl' or .='awlror' or .='chapsect' or .='consume' or .='d-and-o' or .='frontmatte' or .='howtouse' or .='00howtouse' or .='intro' or .='nut_option' or .='oplimits' or .='sblist' or .='schedchk' or .='spectool' or .='timelim' or .='title-page']) and not(ancestor::ata-page-block/@pb-name[(starts-with(., 'do') and 'do' = translate(., '0123456789', '') and string-length(.) &gt; 2) or (starts-with(., 'in') and 'in' = translate(., '0123456789', '') and string-length(.) &gt; 2) or (starts-with(., 'tl') and 'tl' = translate(., '0123456789', '') and string-length(.) &gt; 2) or .='toolsht' or .='trlist' or .='unschedc' or .='unschedchk']) and not(ancestor::page-block/@pb-name[(starts-with(., 'do') and 'do' = translate(., '0123456789', '') and string-length(.) &gt; 2) or (starts-with(., 'in') and 'in' = translate(., '0123456789', '') and string-length(.) &gt; 2) or (starts-with(., 'tl') and 'tl' = translate(., '0123456789', '') and string-length(.) &gt; 2) or .='toolsht' or .='trlist' or .='unschedc' or .='unschedchk']) and not(ancestor-or-self::ata-page-block[1]/@pb-name and string(ancestor-or-self::ata-page-block[1]/@pb-name)='intro00') and not(ancestor-or-self::page-block[1]/@pb-name and string(ancestor-or-self::page-block[1]/@pb-name)='intro00') and not(ancestor::ata-page-block/@pb-name[starts-with(., 'disassy') or starts-with(., 'fault')]) and not(ancestor::page-block/@pb-name[starts-with(., 'disassy') or starts-with(., 'fault')]) and not(ancestor::book[contains(@doctype,'oh')] and ancestor::ata-page-block/@pb-name[starts-with(., 'clean')]) and not(ancestor::book[contains(@doctype,'oh')] and ancestor::page-block/@pb-name[starts-with(., 'clean')]) and not(ancestor::ata-page-block/@pb-name[starts-with(., 'mainprac')]) and not(ancestor::page-block/@pb-name[starts-with(., 'mainprac')]) and not(ancestor::book[contains(@doctype,'oh')] and ancestor::ata-page-block/@pb-name[starts-with(., 'inspect')]) and not(ancestor::book[contains(@doctype,'oh')] and ancestor::page-block/@pb-name[starts-with(., 'inspect')]) and not(ancestor::ata-page-block/@pb-name[(starts-with(., 'di') and 'di' = translate(., '0123456789', '') and string-length(.) &gt; 2) or starts-with(.,'service')]) and not(ancestor::page-block/@pb-name[(starts-with(., 'di') and 'di' = translate(., '0123456789', '') and string-length(.) &gt; 2) or starts-with(.,'service')]) and not(ancestor::book[contains(@doctype,'oh')] and ancestor::ata-page-block/@pb-name[starts-with(., 'repair')]) and not(ancestor::book[contains(@doctype,'oh')] and ancestor::page-block/@pb-name[starts-with(., 'repair')]) and not(ancestor::book[contains(@doctype,'oh')] and ancestor::ata-page-block/@pb-name[starts-with(., 'test')]) and not(ancestor::book[contains(@doctype,'oh')] and ancestor::page-block/@pb-name[starts-with(., 'test')]) and not(ancestor::ata-page-block/@pb-name[(starts-with(., 'cl') and 'cl' = translate(., '0123456789', '') and string-length(.) &gt; 2) or .='install' or starts-with(.,'rem-inst') or (starts-with(., 'reminst') and 'reminst' = translate(., '0123456789', '') and string-length(.) &gt; 7) or .='remove' or (starts-with(., 'repair') and 'repair' = translate(., '0123456789', '') and string-length(.) &gt; 6)]) and not(ancestor::page-block/@pb-name[(starts-with(., 'cl') and 'cl' = translate(., '0123456789', '') and string-length(.) &gt; 2) or .='install' or starts-with(.,'rem-inst') or (starts-with(., 'reminst') and 'reminst' = translate(., '0123456789', '') and string-length(.) &gt; 7) or .='remove' or (starts-with(., 'repair') and 'repair' = translate(., '0123456789', '') and string-length(.) &gt; 6)]) and not(ancestor::ata-page-block/@pb-name[starts-with(., 'assy') or (starts-with(., 'ic') and 'ic' = translate(., '0123456789', '') and string-length(.) &gt; 2) or (starts-with(., 'te') and 'te' = translate(., '0123456789', '') and string-length(.) &gt; 2) or .='test']) and not(ancestor::page-block/@pb-name[starts-with(., 'assy') or (starts-with(., 'ic') and 'ic' = translate(., '0123456789', '') and string-length(.) &gt; 2) or (starts-with(., 'te') and 'te' = translate(., '0123456789', '') and string-length(.) &gt; 2) or .='test']) and not(ancestor::ata-page-block/@pb-name[.='f-and-c' or starts-with(., 'inspect') or (starts-with(., 're') and 're' = translate(., '0123456789', '') and string-length(.) &gt; 2)]) and not(ancestor::page-block/@pb-name[.='f-and-c' or starts-with(., 'inspect') or (starts-with(., 're') and 're' = translate(., '0123456789', '') and string-length(.) &gt; 2)]) and not(ancestor::ata-page-block/@pb-name[(starts-with(., 'as') and 'as' = translate(., '0123456789', '') and string-length(.) &gt; 2) or starts-with(.,'clean') or (starts-with(., 'test') and 'test' = translate(., '0123456789', '') and string-length(.) &gt; 4)]) and not(ancestor::page-block/@pb-name[(starts-with(., 'as') and 'as' = translate(., '0123456789', '') and string-length(.) &gt; 2) or starts-with(.,'clean') or (starts-with(., 'test') and 'test' = translate(., '0123456789', '') and string-length(.) &gt; 4)]) and not(ancestor::ata-page-block/@pb-name[(starts-with(., 'fc') and 'fc' = translate(., '0123456789', '') and string-length(.) &gt; 2) or starts-with(.,'repair') or .='trouble']) and not(ancestor::page-block/@pb-name[(starts-with(., 'fc') and 'fc' = translate(., '0123456789', '') and string-length(.) &gt; 2) or starts-with(.,'repair') or .='trouble']) and (ancestor::ata-page-block/@pb-name[starts-with(.,'storage') or (starts-with(., 'to') and 'to' = translate(., '0123456789', '') and string-length(.) &gt; 2)])">
            <!-- Condition #36-->
            <xsl:if test="not(@_gte:Gentext-Expanded)">
               <_sfe:BeforeOrAfterText>
                  <_ufe:hidden>Table <_gte:styler_numbering>
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
                  </_ufe:hidden>
               </_sfe:BeforeOrAfterText>
            </xsl:if>
         </xsl:when>
         <xsl:when test="not(ancestor::book[contains(@doctype,'cir') or contains(@doctype,'em') or contains(@doctype,'tmm')]) and not(ancestor::book[contains(@doctype,'oh')] and ancestor::ata-page-block/@pb-name[.='service']) and not(ancestor::book[contains(@doctype,'oh')] and ancestor::page-block/@pb-name[.='service']) and not(ancestor::ata-page-block/@pb-name[.='00awl' or .='00intro' or .='airlim' or .='awl' or .='awlror' or .='chapsect' or .='consume' or .='d-and-o' or .='frontmatte' or .='howtouse' or .='00howtouse' or .='intro' or .='nut_option' or .='oplimits' or .='sblist' or .='schedchk' or .='spectool' or .='timelim' or .='title-page']) and not(ancestor::page-block/@pb-name[.='00awl' or .='00intro' or .='airlim' or .='awl' or .='awlror' or .='chapsect' or .='consume' or .='d-and-o' or .='frontmatte' or .='howtouse' or .='00howtouse' or .='intro' or .='nut_option' or .='oplimits' or .='sblist' or .='schedchk' or .='spectool' or .='timelim' or .='title-page']) and not(ancestor::ata-page-block/@pb-name[(starts-with(., 'do') and 'do' = translate(., '0123456789', '') and string-length(.) &gt; 2) or (starts-with(., 'in') and 'in' = translate(., '0123456789', '') and string-length(.) &gt; 2) or (starts-with(., 'tl') and 'tl' = translate(., '0123456789', '') and string-length(.) &gt; 2) or .='toolsht' or .='trlist' or .='unschedc' or .='unschedchk']) and not(ancestor::page-block/@pb-name[(starts-with(., 'do') and 'do' = translate(., '0123456789', '') and string-length(.) &gt; 2) or (starts-with(., 'in') and 'in' = translate(., '0123456789', '') and string-length(.) &gt; 2) or (starts-with(., 'tl') and 'tl' = translate(., '0123456789', '') and string-length(.) &gt; 2) or .='toolsht' or .='trlist' or .='unschedc' or .='unschedchk']) and not(ancestor-or-self::ata-page-block[1]/@pb-name and string(ancestor-or-self::ata-page-block[1]/@pb-name)='intro00') and not(ancestor-or-self::page-block[1]/@pb-name and string(ancestor-or-self::page-block[1]/@pb-name)='intro00') and not(ancestor::ata-page-block/@pb-name[starts-with(., 'disassy') or starts-with(., 'fault')]) and not(ancestor::page-block/@pb-name[starts-with(., 'disassy') or starts-with(., 'fault')]) and not(ancestor::book[contains(@doctype,'oh')] and ancestor::ata-page-block/@pb-name[starts-with(., 'clean')]) and not(ancestor::book[contains(@doctype,'oh')] and ancestor::page-block/@pb-name[starts-with(., 'clean')]) and not(ancestor::ata-page-block/@pb-name[starts-with(., 'mainprac')]) and not(ancestor::page-block/@pb-name[starts-with(., 'mainprac')]) and not(ancestor::book[contains(@doctype,'oh')] and ancestor::ata-page-block/@pb-name[starts-with(., 'inspect')]) and not(ancestor::book[contains(@doctype,'oh')] and ancestor::page-block/@pb-name[starts-with(., 'inspect')]) and not(ancestor::ata-page-block/@pb-name[(starts-with(., 'di') and 'di' = translate(., '0123456789', '') and string-length(.) &gt; 2) or starts-with(.,'service')]) and not(ancestor::page-block/@pb-name[(starts-with(., 'di') and 'di' = translate(., '0123456789', '') and string-length(.) &gt; 2) or starts-with(.,'service')]) and not(ancestor::book[contains(@doctype,'oh')] and ancestor::ata-page-block/@pb-name[starts-with(., 'repair')]) and not(ancestor::book[contains(@doctype,'oh')] and ancestor::page-block/@pb-name[starts-with(., 'repair')]) and not(ancestor::book[contains(@doctype,'oh')] and ancestor::ata-page-block/@pb-name[starts-with(., 'test')]) and not(ancestor::book[contains(@doctype,'oh')] and ancestor::page-block/@pb-name[starts-with(., 'test')]) and not(ancestor::ata-page-block/@pb-name[(starts-with(., 'cl') and 'cl' = translate(., '0123456789', '') and string-length(.) &gt; 2) or .='install' or starts-with(.,'rem-inst') or (starts-with(., 'reminst') and 'reminst' = translate(., '0123456789', '') and string-length(.) &gt; 7) or .='remove' or (starts-with(., 'repair') and 'repair' = translate(., '0123456789', '') and string-length(.) &gt; 6)]) and not(ancestor::page-block/@pb-name[(starts-with(., 'cl') and 'cl' = translate(., '0123456789', '') and string-length(.) &gt; 2) or .='install' or starts-with(.,'rem-inst') or (starts-with(., 'reminst') and 'reminst' = translate(., '0123456789', '') and string-length(.) &gt; 7) or .='remove' or (starts-with(., 'repair') and 'repair' = translate(., '0123456789', '') and string-length(.) &gt; 6)]) and not(ancestor::ata-page-block/@pb-name[starts-with(., 'assy') or (starts-with(., 'ic') and 'ic' = translate(., '0123456789', '') and string-length(.) &gt; 2) or (starts-with(., 'te') and 'te' = translate(., '0123456789', '') and string-length(.) &gt; 2) or .='test']) and not(ancestor::page-block/@pb-name[starts-with(., 'assy') or (starts-with(., 'ic') and 'ic' = translate(., '0123456789', '') and string-length(.) &gt; 2) or (starts-with(., 'te') and 'te' = translate(., '0123456789', '') and string-length(.) &gt; 2) or .='test']) and not(ancestor::ata-page-block/@pb-name[.='f-and-c' or starts-with(., 'inspect') or (starts-with(., 're') and 're' = translate(., '0123456789', '') and string-length(.) &gt; 2)]) and not(ancestor::page-block/@pb-name[.='f-and-c' or starts-with(., 'inspect') or (starts-with(., 're') and 're' = translate(., '0123456789', '') and string-length(.) &gt; 2)]) and not(ancestor::ata-page-block/@pb-name[(starts-with(., 'as') and 'as' = translate(., '0123456789', '') and string-length(.) &gt; 2) or starts-with(.,'clean') or (starts-with(., 'test') and 'test' = translate(., '0123456789', '') and string-length(.) &gt; 4)]) and not(ancestor::page-block/@pb-name[(starts-with(., 'as') and 'as' = translate(., '0123456789', '') and string-length(.) &gt; 2) or starts-with(.,'clean') or (starts-with(., 'test') and 'test' = translate(., '0123456789', '') and string-length(.) &gt; 4)]) and not(ancestor::ata-page-block/@pb-name[(starts-with(., 'fc') and 'fc' = translate(., '0123456789', '') and string-length(.) &gt; 2) or starts-with(.,'repair') or .='trouble']) and (ancestor::page-block/@pb-name[(starts-with(., 'fc') and 'fc' = translate(., '0123456789', '') and string-length(.) &gt; 2) or starts-with(.,'repair') or .='trouble'])">
            <!-- Condition #35-->
            <xsl:if test="not(@_gte:Gentext-Expanded)">
               <_sfe:BeforeOrAfterText>
                  <_ufe:hidden>Table <_gte:styler_numbering>
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
                  </_ufe:hidden>
               </_sfe:BeforeOrAfterText>
            </xsl:if>
         </xsl:when>
         <xsl:when test="not(ancestor::book[contains(@doctype,'cir') or contains(@doctype,'em') or contains(@doctype,'tmm')]) and not(ancestor::book[contains(@doctype,'oh')] and ancestor::ata-page-block/@pb-name[.='service']) and not(ancestor::book[contains(@doctype,'oh')] and ancestor::page-block/@pb-name[.='service']) and not(ancestor::ata-page-block/@pb-name[.='00awl' or .='00intro' or .='airlim' or .='awl' or .='awlror' or .='chapsect' or .='consume' or .='d-and-o' or .='frontmatte' or .='howtouse' or .='00howtouse' or .='intro' or .='nut_option' or .='oplimits' or .='sblist' or .='schedchk' or .='spectool' or .='timelim' or .='title-page']) and not(ancestor::page-block/@pb-name[.='00awl' or .='00intro' or .='airlim' or .='awl' or .='awlror' or .='chapsect' or .='consume' or .='d-and-o' or .='frontmatte' or .='howtouse' or .='00howtouse' or .='intro' or .='nut_option' or .='oplimits' or .='sblist' or .='schedchk' or .='spectool' or .='timelim' or .='title-page']) and not(ancestor::ata-page-block/@pb-name[(starts-with(., 'do') and 'do' = translate(., '0123456789', '') and string-length(.) &gt; 2) or (starts-with(., 'in') and 'in' = translate(., '0123456789', '') and string-length(.) &gt; 2) or (starts-with(., 'tl') and 'tl' = translate(., '0123456789', '') and string-length(.) &gt; 2) or .='toolsht' or .='trlist' or .='unschedc' or .='unschedchk']) and not(ancestor::page-block/@pb-name[(starts-with(., 'do') and 'do' = translate(., '0123456789', '') and string-length(.) &gt; 2) or (starts-with(., 'in') and 'in' = translate(., '0123456789', '') and string-length(.) &gt; 2) or (starts-with(., 'tl') and 'tl' = translate(., '0123456789', '') and string-length(.) &gt; 2) or .='toolsht' or .='trlist' or .='unschedc' or .='unschedchk']) and not(ancestor-or-self::ata-page-block[1]/@pb-name and string(ancestor-or-self::ata-page-block[1]/@pb-name)='intro00') and not(ancestor-or-self::page-block[1]/@pb-name and string(ancestor-or-self::page-block[1]/@pb-name)='intro00') and not(ancestor::ata-page-block/@pb-name[starts-with(., 'disassy') or starts-with(., 'fault')]) and not(ancestor::page-block/@pb-name[starts-with(., 'disassy') or starts-with(., 'fault')]) and not(ancestor::book[contains(@doctype,'oh')] and ancestor::ata-page-block/@pb-name[starts-with(., 'clean')]) and not(ancestor::book[contains(@doctype,'oh')] and ancestor::page-block/@pb-name[starts-with(., 'clean')]) and not(ancestor::ata-page-block/@pb-name[starts-with(., 'mainprac')]) and not(ancestor::page-block/@pb-name[starts-with(., 'mainprac')]) and not(ancestor::book[contains(@doctype,'oh')] and ancestor::ata-page-block/@pb-name[starts-with(., 'inspect')]) and not(ancestor::book[contains(@doctype,'oh')] and ancestor::page-block/@pb-name[starts-with(., 'inspect')]) and not(ancestor::ata-page-block/@pb-name[(starts-with(., 'di') and 'di' = translate(., '0123456789', '') and string-length(.) &gt; 2) or starts-with(.,'service')]) and not(ancestor::page-block/@pb-name[(starts-with(., 'di') and 'di' = translate(., '0123456789', '') and string-length(.) &gt; 2) or starts-with(.,'service')]) and not(ancestor::book[contains(@doctype,'oh')] and ancestor::ata-page-block/@pb-name[starts-with(., 'repair')]) and not(ancestor::book[contains(@doctype,'oh')] and ancestor::page-block/@pb-name[starts-with(., 'repair')]) and not(ancestor::book[contains(@doctype,'oh')] and ancestor::ata-page-block/@pb-name[starts-with(., 'test')]) and not(ancestor::book[contains(@doctype,'oh')] and ancestor::page-block/@pb-name[starts-with(., 'test')]) and not(ancestor::ata-page-block/@pb-name[(starts-with(., 'cl') and 'cl' = translate(., '0123456789', '') and string-length(.) &gt; 2) or .='install' or starts-with(.,'rem-inst') or (starts-with(., 'reminst') and 'reminst' = translate(., '0123456789', '') and string-length(.) &gt; 7) or .='remove' or (starts-with(., 'repair') and 'repair' = translate(., '0123456789', '') and string-length(.) &gt; 6)]) and not(ancestor::page-block/@pb-name[(starts-with(., 'cl') and 'cl' = translate(., '0123456789', '') and string-length(.) &gt; 2) or .='install' or starts-with(.,'rem-inst') or (starts-with(., 'reminst') and 'reminst' = translate(., '0123456789', '') and string-length(.) &gt; 7) or .='remove' or (starts-with(., 'repair') and 'repair' = translate(., '0123456789', '') and string-length(.) &gt; 6)]) and not(ancestor::ata-page-block/@pb-name[starts-with(., 'assy') or (starts-with(., 'ic') and 'ic' = translate(., '0123456789', '') and string-length(.) &gt; 2) or (starts-with(., 'te') and 'te' = translate(., '0123456789', '') and string-length(.) &gt; 2) or .='test']) and not(ancestor::page-block/@pb-name[starts-with(., 'assy') or (starts-with(., 'ic') and 'ic' = translate(., '0123456789', '') and string-length(.) &gt; 2) or (starts-with(., 'te') and 'te' = translate(., '0123456789', '') and string-length(.) &gt; 2) or .='test']) and not(ancestor::ata-page-block/@pb-name[.='f-and-c' or starts-with(., 'inspect') or (starts-with(., 're') and 're' = translate(., '0123456789', '') and string-length(.) &gt; 2)]) and not(ancestor::page-block/@pb-name[.='f-and-c' or starts-with(., 'inspect') or (starts-with(., 're') and 're' = translate(., '0123456789', '') and string-length(.) &gt; 2)]) and not(ancestor::ata-page-block/@pb-name[(starts-with(., 'as') and 'as' = translate(., '0123456789', '') and string-length(.) &gt; 2) or starts-with(.,'clean') or (starts-with(., 'test') and 'test' = translate(., '0123456789', '') and string-length(.) &gt; 4)]) and not(ancestor::page-block/@pb-name[(starts-with(., 'as') and 'as' = translate(., '0123456789', '') and string-length(.) &gt; 2) or starts-with(.,'clean') or (starts-with(., 'test') and 'test' = translate(., '0123456789', '') and string-length(.) &gt; 4)]) and (ancestor::ata-page-block/@pb-name[(starts-with(., 'fc') and 'fc' = translate(., '0123456789', '') and string-length(.) &gt; 2) or starts-with(.,'repair') or .='trouble'])">
            <!-- Condition #34-->
            <xsl:if test="not(@_gte:Gentext-Expanded)">
               <_sfe:BeforeOrAfterText>
                  <_ufe:hidden>Table <_gte:styler_numbering>
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
                  </_ufe:hidden>
               </_sfe:BeforeOrAfterText>
            </xsl:if>
         </xsl:when>
         <xsl:when test="not(ancestor::book[contains(@doctype,'cir') or contains(@doctype,'em') or contains(@doctype,'tmm')]) and not(ancestor::book[contains(@doctype,'oh')] and ancestor::ata-page-block/@pb-name[.='service']) and not(ancestor::book[contains(@doctype,'oh')] and ancestor::page-block/@pb-name[.='service']) and not(ancestor::ata-page-block/@pb-name[.='00awl' or .='00intro' or .='airlim' or .='awl' or .='awlror' or .='chapsect' or .='consume' or .='d-and-o' or .='frontmatte' or .='howtouse' or .='00howtouse' or .='intro' or .='nut_option' or .='oplimits' or .='sblist' or .='schedchk' or .='spectool' or .='timelim' or .='title-page']) and not(ancestor::page-block/@pb-name[.='00awl' or .='00intro' or .='airlim' or .='awl' or .='awlror' or .='chapsect' or .='consume' or .='d-and-o' or .='frontmatte' or .='howtouse' or .='00howtouse' or .='intro' or .='nut_option' or .='oplimits' or .='sblist' or .='schedchk' or .='spectool' or .='timelim' or .='title-page']) and not(ancestor::ata-page-block/@pb-name[(starts-with(., 'do') and 'do' = translate(., '0123456789', '') and string-length(.) &gt; 2) or (starts-with(., 'in') and 'in' = translate(., '0123456789', '') and string-length(.) &gt; 2) or (starts-with(., 'tl') and 'tl' = translate(., '0123456789', '') and string-length(.) &gt; 2) or .='toolsht' or .='trlist' or .='unschedc' or .='unschedchk']) and not(ancestor::page-block/@pb-name[(starts-with(., 'do') and 'do' = translate(., '0123456789', '') and string-length(.) &gt; 2) or (starts-with(., 'in') and 'in' = translate(., '0123456789', '') and string-length(.) &gt; 2) or (starts-with(., 'tl') and 'tl' = translate(., '0123456789', '') and string-length(.) &gt; 2) or .='toolsht' or .='trlist' or .='unschedc' or .='unschedchk']) and not(ancestor-or-self::ata-page-block[1]/@pb-name and string(ancestor-or-self::ata-page-block[1]/@pb-name)='intro00') and not(ancestor-or-self::page-block[1]/@pb-name and string(ancestor-or-self::page-block[1]/@pb-name)='intro00') and not(ancestor::ata-page-block/@pb-name[starts-with(., 'disassy') or starts-with(., 'fault')]) and not(ancestor::page-block/@pb-name[starts-with(., 'disassy') or starts-with(., 'fault')]) and not(ancestor::book[contains(@doctype,'oh')] and ancestor::ata-page-block/@pb-name[starts-with(., 'clean')]) and not(ancestor::book[contains(@doctype,'oh')] and ancestor::page-block/@pb-name[starts-with(., 'clean')]) and not(ancestor::ata-page-block/@pb-name[starts-with(., 'mainprac')]) and not(ancestor::page-block/@pb-name[starts-with(., 'mainprac')]) and not(ancestor::book[contains(@doctype,'oh')] and ancestor::ata-page-block/@pb-name[starts-with(., 'inspect')]) and not(ancestor::book[contains(@doctype,'oh')] and ancestor::page-block/@pb-name[starts-with(., 'inspect')]) and not(ancestor::ata-page-block/@pb-name[(starts-with(., 'di') and 'di' = translate(., '0123456789', '') and string-length(.) &gt; 2) or starts-with(.,'service')]) and not(ancestor::page-block/@pb-name[(starts-with(., 'di') and 'di' = translate(., '0123456789', '') and string-length(.) &gt; 2) or starts-with(.,'service')]) and not(ancestor::book[contains(@doctype,'oh')] and ancestor::ata-page-block/@pb-name[starts-with(., 'repair')]) and not(ancestor::book[contains(@doctype,'oh')] and ancestor::page-block/@pb-name[starts-with(., 'repair')]) and not(ancestor::book[contains(@doctype,'oh')] and ancestor::ata-page-block/@pb-name[starts-with(., 'test')]) and not(ancestor::book[contains(@doctype,'oh')] and ancestor::page-block/@pb-name[starts-with(., 'test')]) and not(ancestor::ata-page-block/@pb-name[(starts-with(., 'cl') and 'cl' = translate(., '0123456789', '') and string-length(.) &gt; 2) or .='install' or starts-with(.,'rem-inst') or (starts-with(., 'reminst') and 'reminst' = translate(., '0123456789', '') and string-length(.) &gt; 7) or .='remove' or (starts-with(., 'repair') and 'repair' = translate(., '0123456789', '') and string-length(.) &gt; 6)]) and not(ancestor::page-block/@pb-name[(starts-with(., 'cl') and 'cl' = translate(., '0123456789', '') and string-length(.) &gt; 2) or .='install' or starts-with(.,'rem-inst') or (starts-with(., 'reminst') and 'reminst' = translate(., '0123456789', '') and string-length(.) &gt; 7) or .='remove' or (starts-with(., 'repair') and 'repair' = translate(., '0123456789', '') and string-length(.) &gt; 6)]) and not(ancestor::ata-page-block/@pb-name[starts-with(., 'assy') or (starts-with(., 'ic') and 'ic' = translate(., '0123456789', '') and string-length(.) &gt; 2) or (starts-with(., 'te') and 'te' = translate(., '0123456789', '') and string-length(.) &gt; 2) or .='test']) and not(ancestor::page-block/@pb-name[starts-with(., 'assy') or (starts-with(., 'ic') and 'ic' = translate(., '0123456789', '') and string-length(.) &gt; 2) or (starts-with(., 'te') and 'te' = translate(., '0123456789', '') and string-length(.) &gt; 2) or .='test']) and not(ancestor::ata-page-block/@pb-name[.='f-and-c' or starts-with(., 'inspect') or (starts-with(., 're') and 're' = translate(., '0123456789', '') and string-length(.) &gt; 2)]) and not(ancestor::page-block/@pb-name[.='f-and-c' or starts-with(., 'inspect') or (starts-with(., 're') and 're' = translate(., '0123456789', '') and string-length(.) &gt; 2)]) and not(ancestor::ata-page-block/@pb-name[(starts-with(., 'as') and 'as' = translate(., '0123456789', '') and string-length(.) &gt; 2) or starts-with(.,'clean') or (starts-with(., 'test') and 'test' = translate(., '0123456789', '') and string-length(.) &gt; 4)]) and (ancestor::page-block/@pb-name[(starts-with(., 'as') and 'as' = translate(., '0123456789', '') and string-length(.) &gt; 2) or starts-with(.,'clean') or (starts-with(., 'test') and 'test' = translate(., '0123456789', '') and string-length(.) &gt; 4)])">
            <!-- Condition #33-->
            <xsl:if test="not(@_gte:Gentext-Expanded)">
               <_sfe:BeforeOrAfterText>
                  <_ufe:hidden>Table <_gte:styler_numbering>
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
                  </_ufe:hidden>
               </_sfe:BeforeOrAfterText>
            </xsl:if>
         </xsl:when>
         <xsl:when test="not(ancestor::book[contains(@doctype,'cir') or contains(@doctype,'em') or contains(@doctype,'tmm')]) and not(ancestor::book[contains(@doctype,'oh')] and ancestor::ata-page-block/@pb-name[.='service']) and not(ancestor::book[contains(@doctype,'oh')] and ancestor::page-block/@pb-name[.='service']) and not(ancestor::ata-page-block/@pb-name[.='00awl' or .='00intro' or .='airlim' or .='awl' or .='awlror' or .='chapsect' or .='consume' or .='d-and-o' or .='frontmatte' or .='howtouse' or .='00howtouse' or .='intro' or .='nut_option' or .='oplimits' or .='sblist' or .='schedchk' or .='spectool' or .='timelim' or .='title-page']) and not(ancestor::page-block/@pb-name[.='00awl' or .='00intro' or .='airlim' or .='awl' or .='awlror' or .='chapsect' or .='consume' or .='d-and-o' or .='frontmatte' or .='howtouse' or .='00howtouse' or .='intro' or .='nut_option' or .='oplimits' or .='sblist' or .='schedchk' or .='spectool' or .='timelim' or .='title-page']) and not(ancestor::ata-page-block/@pb-name[(starts-with(., 'do') and 'do' = translate(., '0123456789', '') and string-length(.) &gt; 2) or (starts-with(., 'in') and 'in' = translate(., '0123456789', '') and string-length(.) &gt; 2) or (starts-with(., 'tl') and 'tl' = translate(., '0123456789', '') and string-length(.) &gt; 2) or .='toolsht' or .='trlist' or .='unschedc' or .='unschedchk']) and not(ancestor::page-block/@pb-name[(starts-with(., 'do') and 'do' = translate(., '0123456789', '') and string-length(.) &gt; 2) or (starts-with(., 'in') and 'in' = translate(., '0123456789', '') and string-length(.) &gt; 2) or (starts-with(., 'tl') and 'tl' = translate(., '0123456789', '') and string-length(.) &gt; 2) or .='toolsht' or .='trlist' or .='unschedc' or .='unschedchk']) and not(ancestor-or-self::ata-page-block[1]/@pb-name and string(ancestor-or-self::ata-page-block[1]/@pb-name)='intro00') and not(ancestor-or-self::page-block[1]/@pb-name and string(ancestor-or-self::page-block[1]/@pb-name)='intro00') and not(ancestor::ata-page-block/@pb-name[starts-with(., 'disassy') or starts-with(., 'fault')]) and not(ancestor::page-block/@pb-name[starts-with(., 'disassy') or starts-with(., 'fault')]) and not(ancestor::book[contains(@doctype,'oh')] and ancestor::ata-page-block/@pb-name[starts-with(., 'clean')]) and not(ancestor::book[contains(@doctype,'oh')] and ancestor::page-block/@pb-name[starts-with(., 'clean')]) and not(ancestor::ata-page-block/@pb-name[starts-with(., 'mainprac')]) and not(ancestor::page-block/@pb-name[starts-with(., 'mainprac')]) and not(ancestor::book[contains(@doctype,'oh')] and ancestor::ata-page-block/@pb-name[starts-with(., 'inspect')]) and not(ancestor::book[contains(@doctype,'oh')] and ancestor::page-block/@pb-name[starts-with(., 'inspect')]) and not(ancestor::ata-page-block/@pb-name[(starts-with(., 'di') and 'di' = translate(., '0123456789', '') and string-length(.) &gt; 2) or starts-with(.,'service')]) and not(ancestor::page-block/@pb-name[(starts-with(., 'di') and 'di' = translate(., '0123456789', '') and string-length(.) &gt; 2) or starts-with(.,'service')]) and not(ancestor::book[contains(@doctype,'oh')] and ancestor::ata-page-block/@pb-name[starts-with(., 'repair')]) and not(ancestor::book[contains(@doctype,'oh')] and ancestor::page-block/@pb-name[starts-with(., 'repair')]) and not(ancestor::book[contains(@doctype,'oh')] and ancestor::ata-page-block/@pb-name[starts-with(., 'test')]) and not(ancestor::book[contains(@doctype,'oh')] and ancestor::page-block/@pb-name[starts-with(., 'test')]) and not(ancestor::ata-page-block/@pb-name[(starts-with(., 'cl') and 'cl' = translate(., '0123456789', '') and string-length(.) &gt; 2) or .='install' or starts-with(.,'rem-inst') or (starts-with(., 'reminst') and 'reminst' = translate(., '0123456789', '') and string-length(.) &gt; 7) or .='remove' or (starts-with(., 'repair') and 'repair' = translate(., '0123456789', '') and string-length(.) &gt; 6)]) and not(ancestor::page-block/@pb-name[(starts-with(., 'cl') and 'cl' = translate(., '0123456789', '') and string-length(.) &gt; 2) or .='install' or starts-with(.,'rem-inst') or (starts-with(., 'reminst') and 'reminst' = translate(., '0123456789', '') and string-length(.) &gt; 7) or .='remove' or (starts-with(., 'repair') and 'repair' = translate(., '0123456789', '') and string-length(.) &gt; 6)]) and not(ancestor::ata-page-block/@pb-name[starts-with(., 'assy') or (starts-with(., 'ic') and 'ic' = translate(., '0123456789', '') and string-length(.) &gt; 2) or (starts-with(., 'te') and 'te' = translate(., '0123456789', '') and string-length(.) &gt; 2) or .='test']) and not(ancestor::page-block/@pb-name[starts-with(., 'assy') or (starts-with(., 'ic') and 'ic' = translate(., '0123456789', '') and string-length(.) &gt; 2) or (starts-with(., 'te') and 'te' = translate(., '0123456789', '') and string-length(.) &gt; 2) or .='test']) and not(ancestor::ata-page-block/@pb-name[.='f-and-c' or starts-with(., 'inspect') or (starts-with(., 're') and 're' = translate(., '0123456789', '') and string-length(.) &gt; 2)]) and not(ancestor::page-block/@pb-name[.='f-and-c' or starts-with(., 'inspect') or (starts-with(., 're') and 're' = translate(., '0123456789', '') and string-length(.) &gt; 2)]) and (ancestor::ata-page-block/@pb-name[(starts-with(., 'as') and 'as' = translate(., '0123456789', '') and string-length(.) &gt; 2) or starts-with(.,'clean') or (starts-with(., 'test') and 'test' = translate(., '0123456789', '') and string-length(.) &gt; 4)])">
            <!-- Condition #32-->
            <xsl:if test="not(@_gte:Gentext-Expanded)">
               <_sfe:BeforeOrAfterText>
                  <_ufe:hidden>Table <_gte:styler_numbering>
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
                  </_ufe:hidden>
               </_sfe:BeforeOrAfterText>
            </xsl:if>
         </xsl:when>
         <xsl:when test="not(ancestor::book[contains(@doctype,'cir') or contains(@doctype,'em') or contains(@doctype,'tmm')]) and not(ancestor::book[contains(@doctype,'oh')] and ancestor::ata-page-block/@pb-name[.='service']) and not(ancestor::book[contains(@doctype,'oh')] and ancestor::page-block/@pb-name[.='service']) and not(ancestor::ata-page-block/@pb-name[.='00awl' or .='00intro' or .='airlim' or .='awl' or .='awlror' or .='chapsect' or .='consume' or .='d-and-o' or .='frontmatte' or .='howtouse' or .='00howtouse' or .='intro' or .='nut_option' or .='oplimits' or .='sblist' or .='schedchk' or .='spectool' or .='timelim' or .='title-page']) and not(ancestor::page-block/@pb-name[.='00awl' or .='00intro' or .='airlim' or .='awl' or .='awlror' or .='chapsect' or .='consume' or .='d-and-o' or .='frontmatte' or .='howtouse' or .='00howtouse' or .='intro' or .='nut_option' or .='oplimits' or .='sblist' or .='schedchk' or .='spectool' or .='timelim' or .='title-page']) and not(ancestor::ata-page-block/@pb-name[(starts-with(., 'do') and 'do' = translate(., '0123456789', '') and string-length(.) &gt; 2) or (starts-with(., 'in') and 'in' = translate(., '0123456789', '') and string-length(.) &gt; 2) or (starts-with(., 'tl') and 'tl' = translate(., '0123456789', '') and string-length(.) &gt; 2) or .='toolsht' or .='trlist' or .='unschedc' or .='unschedchk']) and not(ancestor::page-block/@pb-name[(starts-with(., 'do') and 'do' = translate(., '0123456789', '') and string-length(.) &gt; 2) or (starts-with(., 'in') and 'in' = translate(., '0123456789', '') and string-length(.) &gt; 2) or (starts-with(., 'tl') and 'tl' = translate(., '0123456789', '') and string-length(.) &gt; 2) or .='toolsht' or .='trlist' or .='unschedc' or .='unschedchk']) and not(ancestor-or-self::ata-page-block[1]/@pb-name and string(ancestor-or-self::ata-page-block[1]/@pb-name)='intro00') and not(ancestor-or-self::page-block[1]/@pb-name and string(ancestor-or-self::page-block[1]/@pb-name)='intro00') and not(ancestor::ata-page-block/@pb-name[starts-with(., 'disassy') or starts-with(., 'fault')]) and not(ancestor::page-block/@pb-name[starts-with(., 'disassy') or starts-with(., 'fault')]) and not(ancestor::book[contains(@doctype,'oh')] and ancestor::ata-page-block/@pb-name[starts-with(., 'clean')]) and not(ancestor::book[contains(@doctype,'oh')] and ancestor::page-block/@pb-name[starts-with(., 'clean')]) and not(ancestor::ata-page-block/@pb-name[starts-with(., 'mainprac')]) and not(ancestor::page-block/@pb-name[starts-with(., 'mainprac')]) and not(ancestor::book[contains(@doctype,'oh')] and ancestor::ata-page-block/@pb-name[starts-with(., 'inspect')]) and not(ancestor::book[contains(@doctype,'oh')] and ancestor::page-block/@pb-name[starts-with(., 'inspect')]) and not(ancestor::ata-page-block/@pb-name[(starts-with(., 'di') and 'di' = translate(., '0123456789', '') and string-length(.) &gt; 2) or starts-with(.,'service')]) and not(ancestor::page-block/@pb-name[(starts-with(., 'di') and 'di' = translate(., '0123456789', '') and string-length(.) &gt; 2) or starts-with(.,'service')]) and not(ancestor::book[contains(@doctype,'oh')] and ancestor::ata-page-block/@pb-name[starts-with(., 'repair')]) and not(ancestor::book[contains(@doctype,'oh')] and ancestor::page-block/@pb-name[starts-with(., 'repair')]) and not(ancestor::book[contains(@doctype,'oh')] and ancestor::ata-page-block/@pb-name[starts-with(., 'test')]) and not(ancestor::book[contains(@doctype,'oh')] and ancestor::page-block/@pb-name[starts-with(., 'test')]) and not(ancestor::ata-page-block/@pb-name[(starts-with(., 'cl') and 'cl' = translate(., '0123456789', '') and string-length(.) &gt; 2) or .='install' or starts-with(.,'rem-inst') or (starts-with(., 'reminst') and 'reminst' = translate(., '0123456789', '') and string-length(.) &gt; 7) or .='remove' or (starts-with(., 'repair') and 'repair' = translate(., '0123456789', '') and string-length(.) &gt; 6)]) and not(ancestor::page-block/@pb-name[(starts-with(., 'cl') and 'cl' = translate(., '0123456789', '') and string-length(.) &gt; 2) or .='install' or starts-with(.,'rem-inst') or (starts-with(., 'reminst') and 'reminst' = translate(., '0123456789', '') and string-length(.) &gt; 7) or .='remove' or (starts-with(., 'repair') and 'repair' = translate(., '0123456789', '') and string-length(.) &gt; 6)]) and not(ancestor::ata-page-block/@pb-name[starts-with(., 'assy') or (starts-with(., 'ic') and 'ic' = translate(., '0123456789', '') and string-length(.) &gt; 2) or (starts-with(., 'te') and 'te' = translate(., '0123456789', '') and string-length(.) &gt; 2) or .='test']) and not(ancestor::page-block/@pb-name[starts-with(., 'assy') or (starts-with(., 'ic') and 'ic' = translate(., '0123456789', '') and string-length(.) &gt; 2) or (starts-with(., 'te') and 'te' = translate(., '0123456789', '') and string-length(.) &gt; 2) or .='test']) and not(ancestor::ata-page-block/@pb-name[.='f-and-c' or starts-with(., 'inspect') or (starts-with(., 're') and 're' = translate(., '0123456789', '') and string-length(.) &gt; 2)]) and (ancestor::page-block/@pb-name[.='f-and-c' or starts-with(., 'inspect') or (starts-with(., 're') and 're' = translate(., '0123456789', '') and string-length(.) &gt; 2)])">
            <!-- Condition #31-->
            <xsl:if test="not(@_gte:Gentext-Expanded)">
               <_sfe:BeforeOrAfterText>
                  <_ufe:hidden>Table <_gte:styler_numbering>
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
                  </_ufe:hidden>
               </_sfe:BeforeOrAfterText>
            </xsl:if>
         </xsl:when>
         <xsl:when test="not(ancestor::book[contains(@doctype,'cir') or contains(@doctype,'em') or contains(@doctype,'tmm')]) and not(ancestor::book[contains(@doctype,'oh')] and ancestor::ata-page-block/@pb-name[.='service']) and not(ancestor::book[contains(@doctype,'oh')] and ancestor::page-block/@pb-name[.='service']) and not(ancestor::ata-page-block/@pb-name[.='00awl' or .='00intro' or .='airlim' or .='awl' or .='awlror' or .='chapsect' or .='consume' or .='d-and-o' or .='frontmatte' or .='howtouse' or .='00howtouse' or .='intro' or .='nut_option' or .='oplimits' or .='sblist' or .='schedchk' or .='spectool' or .='timelim' or .='title-page']) and not(ancestor::page-block/@pb-name[.='00awl' or .='00intro' or .='airlim' or .='awl' or .='awlror' or .='chapsect' or .='consume' or .='d-and-o' or .='frontmatte' or .='howtouse' or .='00howtouse' or .='intro' or .='nut_option' or .='oplimits' or .='sblist' or .='schedchk' or .='spectool' or .='timelim' or .='title-page']) and not(ancestor::ata-page-block/@pb-name[(starts-with(., 'do') and 'do' = translate(., '0123456789', '') and string-length(.) &gt; 2) or (starts-with(., 'in') and 'in' = translate(., '0123456789', '') and string-length(.) &gt; 2) or (starts-with(., 'tl') and 'tl' = translate(., '0123456789', '') and string-length(.) &gt; 2) or .='toolsht' or .='trlist' or .='unschedc' or .='unschedchk']) and not(ancestor::page-block/@pb-name[(starts-with(., 'do') and 'do' = translate(., '0123456789', '') and string-length(.) &gt; 2) or (starts-with(., 'in') and 'in' = translate(., '0123456789', '') and string-length(.) &gt; 2) or (starts-with(., 'tl') and 'tl' = translate(., '0123456789', '') and string-length(.) &gt; 2) or .='toolsht' or .='trlist' or .='unschedc' or .='unschedchk']) and not(ancestor-or-self::ata-page-block[1]/@pb-name and string(ancestor-or-self::ata-page-block[1]/@pb-name)='intro00') and not(ancestor-or-self::page-block[1]/@pb-name and string(ancestor-or-self::page-block[1]/@pb-name)='intro00') and not(ancestor::ata-page-block/@pb-name[starts-with(., 'disassy') or starts-with(., 'fault')]) and not(ancestor::page-block/@pb-name[starts-with(., 'disassy') or starts-with(., 'fault')]) and not(ancestor::book[contains(@doctype,'oh')] and ancestor::ata-page-block/@pb-name[starts-with(., 'clean')]) and not(ancestor::book[contains(@doctype,'oh')] and ancestor::page-block/@pb-name[starts-with(., 'clean')]) and not(ancestor::ata-page-block/@pb-name[starts-with(., 'mainprac')]) and not(ancestor::page-block/@pb-name[starts-with(., 'mainprac')]) and not(ancestor::book[contains(@doctype,'oh')] and ancestor::ata-page-block/@pb-name[starts-with(., 'inspect')]) and not(ancestor::book[contains(@doctype,'oh')] and ancestor::page-block/@pb-name[starts-with(., 'inspect')]) and not(ancestor::ata-page-block/@pb-name[(starts-with(., 'di') and 'di' = translate(., '0123456789', '') and string-length(.) &gt; 2) or starts-with(.,'service')]) and not(ancestor::page-block/@pb-name[(starts-with(., 'di') and 'di' = translate(., '0123456789', '') and string-length(.) &gt; 2) or starts-with(.,'service')]) and not(ancestor::book[contains(@doctype,'oh')] and ancestor::ata-page-block/@pb-name[starts-with(., 'repair')]) and not(ancestor::book[contains(@doctype,'oh')] and ancestor::page-block/@pb-name[starts-with(., 'repair')]) and not(ancestor::book[contains(@doctype,'oh')] and ancestor::ata-page-block/@pb-name[starts-with(., 'test')]) and not(ancestor::book[contains(@doctype,'oh')] and ancestor::page-block/@pb-name[starts-with(., 'test')]) and not(ancestor::ata-page-block/@pb-name[(starts-with(., 'cl') and 'cl' = translate(., '0123456789', '') and string-length(.) &gt; 2) or .='install' or starts-with(.,'rem-inst') or (starts-with(., 'reminst') and 'reminst' = translate(., '0123456789', '') and string-length(.) &gt; 7) or .='remove' or (starts-with(., 'repair') and 'repair' = translate(., '0123456789', '') and string-length(.) &gt; 6)]) and not(ancestor::page-block/@pb-name[(starts-with(., 'cl') and 'cl' = translate(., '0123456789', '') and string-length(.) &gt; 2) or .='install' or starts-with(.,'rem-inst') or (starts-with(., 'reminst') and 'reminst' = translate(., '0123456789', '') and string-length(.) &gt; 7) or .='remove' or (starts-with(., 'repair') and 'repair' = translate(., '0123456789', '') and string-length(.) &gt; 6)]) and not(ancestor::ata-page-block/@pb-name[starts-with(., 'assy') or (starts-with(., 'ic') and 'ic' = translate(., '0123456789', '') and string-length(.) &gt; 2) or (starts-with(., 'te') and 'te' = translate(., '0123456789', '') and string-length(.) &gt; 2) or .='test']) and not(ancestor::page-block/@pb-name[starts-with(., 'assy') or (starts-with(., 'ic') and 'ic' = translate(., '0123456789', '') and string-length(.) &gt; 2) or (starts-with(., 'te') and 'te' = translate(., '0123456789', '') and string-length(.) &gt; 2) or .='test']) and (ancestor::ata-page-block/@pb-name[.='f-and-c' or starts-with(., 'inspect') or (starts-with(., 're') and 're' = translate(., '0123456789', '') and string-length(.) &gt; 2)])">
            <!-- Condition #30-->
            <xsl:if test="not(@_gte:Gentext-Expanded)">
               <_sfe:BeforeOrAfterText>
                  <_ufe:hidden>Table <_gte:styler_numbering>
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
                  </_ufe:hidden>
               </_sfe:BeforeOrAfterText>
            </xsl:if>
         </xsl:when>
         <xsl:when test="not(ancestor::book[contains(@doctype,'cir') or contains(@doctype,'em') or contains(@doctype,'tmm')]) and not(ancestor::book[contains(@doctype,'oh')] and ancestor::ata-page-block/@pb-name[.='service']) and not(ancestor::book[contains(@doctype,'oh')] and ancestor::page-block/@pb-name[.='service']) and not(ancestor::ata-page-block/@pb-name[.='00awl' or .='00intro' or .='airlim' or .='awl' or .='awlror' or .='chapsect' or .='consume' or .='d-and-o' or .='frontmatte' or .='howtouse' or .='00howtouse' or .='intro' or .='nut_option' or .='oplimits' or .='sblist' or .='schedchk' or .='spectool' or .='timelim' or .='title-page']) and not(ancestor::page-block/@pb-name[.='00awl' or .='00intro' or .='airlim' or .='awl' or .='awlror' or .='chapsect' or .='consume' or .='d-and-o' or .='frontmatte' or .='howtouse' or .='00howtouse' or .='intro' or .='nut_option' or .='oplimits' or .='sblist' or .='schedchk' or .='spectool' or .='timelim' or .='title-page']) and not(ancestor::ata-page-block/@pb-name[(starts-with(., 'do') and 'do' = translate(., '0123456789', '') and string-length(.) &gt; 2) or (starts-with(., 'in') and 'in' = translate(., '0123456789', '') and string-length(.) &gt; 2) or (starts-with(., 'tl') and 'tl' = translate(., '0123456789', '') and string-length(.) &gt; 2) or .='toolsht' or .='trlist' or .='unschedc' or .='unschedchk']) and not(ancestor::page-block/@pb-name[(starts-with(., 'do') and 'do' = translate(., '0123456789', '') and string-length(.) &gt; 2) or (starts-with(., 'in') and 'in' = translate(., '0123456789', '') and string-length(.) &gt; 2) or (starts-with(., 'tl') and 'tl' = translate(., '0123456789', '') and string-length(.) &gt; 2) or .='toolsht' or .='trlist' or .='unschedc' or .='unschedchk']) and not(ancestor-or-self::ata-page-block[1]/@pb-name and string(ancestor-or-self::ata-page-block[1]/@pb-name)='intro00') and not(ancestor-or-self::page-block[1]/@pb-name and string(ancestor-or-self::page-block[1]/@pb-name)='intro00') and not(ancestor::ata-page-block/@pb-name[starts-with(., 'disassy') or starts-with(., 'fault')]) and not(ancestor::page-block/@pb-name[starts-with(., 'disassy') or starts-with(., 'fault')]) and not(ancestor::book[contains(@doctype,'oh')] and ancestor::ata-page-block/@pb-name[starts-with(., 'clean')]) and not(ancestor::book[contains(@doctype,'oh')] and ancestor::page-block/@pb-name[starts-with(., 'clean')]) and not(ancestor::ata-page-block/@pb-name[starts-with(., 'mainprac')]) and not(ancestor::page-block/@pb-name[starts-with(., 'mainprac')]) and not(ancestor::book[contains(@doctype,'oh')] and ancestor::ata-page-block/@pb-name[starts-with(., 'inspect')]) and not(ancestor::book[contains(@doctype,'oh')] and ancestor::page-block/@pb-name[starts-with(., 'inspect')]) and not(ancestor::ata-page-block/@pb-name[(starts-with(., 'di') and 'di' = translate(., '0123456789', '') and string-length(.) &gt; 2) or starts-with(.,'service')]) and not(ancestor::page-block/@pb-name[(starts-with(., 'di') and 'di' = translate(., '0123456789', '') and string-length(.) &gt; 2) or starts-with(.,'service')]) and not(ancestor::book[contains(@doctype,'oh')] and ancestor::ata-page-block/@pb-name[starts-with(., 'repair')]) and not(ancestor::book[contains(@doctype,'oh')] and ancestor::page-block/@pb-name[starts-with(., 'repair')]) and not(ancestor::book[contains(@doctype,'oh')] and ancestor::ata-page-block/@pb-name[starts-with(., 'test')]) and not(ancestor::book[contains(@doctype,'oh')] and ancestor::page-block/@pb-name[starts-with(., 'test')]) and not(ancestor::ata-page-block/@pb-name[(starts-with(., 'cl') and 'cl' = translate(., '0123456789', '') and string-length(.) &gt; 2) or .='install' or starts-with(.,'rem-inst') or (starts-with(., 'reminst') and 'reminst' = translate(., '0123456789', '') and string-length(.) &gt; 7) or .='remove' or (starts-with(., 'repair') and 'repair' = translate(., '0123456789', '') and string-length(.) &gt; 6)]) and not(ancestor::page-block/@pb-name[(starts-with(., 'cl') and 'cl' = translate(., '0123456789', '') and string-length(.) &gt; 2) or .='install' or starts-with(.,'rem-inst') or (starts-with(., 'reminst') and 'reminst' = translate(., '0123456789', '') and string-length(.) &gt; 7) or .='remove' or (starts-with(., 'repair') and 'repair' = translate(., '0123456789', '') and string-length(.) &gt; 6)]) and not(ancestor::ata-page-block/@pb-name[starts-with(., 'assy') or (starts-with(., 'ic') and 'ic' = translate(., '0123456789', '') and string-length(.) &gt; 2) or (starts-with(., 'te') and 'te' = translate(., '0123456789', '') and string-length(.) &gt; 2) or .='test']) and (ancestor::page-block/@pb-name[starts-with(., 'assy') or (starts-with(., 'ic') and 'ic' = translate(., '0123456789', '') and string-length(.) &gt; 2) or (starts-with(., 'te') and 'te' = translate(., '0123456789', '') and string-length(.) &gt; 2) or .='test'])">
            <!-- Condition #29-->
            <xsl:if test="not(@_gte:Gentext-Expanded)">
               <_sfe:BeforeOrAfterText>
                  <_ufe:hidden>Table <_gte:styler_numbering>
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
                  </_ufe:hidden>
               </_sfe:BeforeOrAfterText>
            </xsl:if>
         </xsl:when>
         <xsl:when test="not(ancestor::book[contains(@doctype,'cir') or contains(@doctype,'em') or contains(@doctype,'tmm')]) and not(ancestor::book[contains(@doctype,'oh')] and ancestor::ata-page-block/@pb-name[.='service']) and not(ancestor::book[contains(@doctype,'oh')] and ancestor::page-block/@pb-name[.='service']) and not(ancestor::ata-page-block/@pb-name[.='00awl' or .='00intro' or .='airlim' or .='awl' or .='awlror' or .='chapsect' or .='consume' or .='d-and-o' or .='frontmatte' or .='howtouse' or .='00howtouse' or .='intro' or .='nut_option' or .='oplimits' or .='sblist' or .='schedchk' or .='spectool' or .='timelim' or .='title-page']) and not(ancestor::page-block/@pb-name[.='00awl' or .='00intro' or .='airlim' or .='awl' or .='awlror' or .='chapsect' or .='consume' or .='d-and-o' or .='frontmatte' or .='howtouse' or .='00howtouse' or .='intro' or .='nut_option' or .='oplimits' or .='sblist' or .='schedchk' or .='spectool' or .='timelim' or .='title-page']) and not(ancestor::ata-page-block/@pb-name[(starts-with(., 'do') and 'do' = translate(., '0123456789', '') and string-length(.) &gt; 2) or (starts-with(., 'in') and 'in' = translate(., '0123456789', '') and string-length(.) &gt; 2) or (starts-with(., 'tl') and 'tl' = translate(., '0123456789', '') and string-length(.) &gt; 2) or .='toolsht' or .='trlist' or .='unschedc' or .='unschedchk']) and not(ancestor::page-block/@pb-name[(starts-with(., 'do') and 'do' = translate(., '0123456789', '') and string-length(.) &gt; 2) or (starts-with(., 'in') and 'in' = translate(., '0123456789', '') and string-length(.) &gt; 2) or (starts-with(., 'tl') and 'tl' = translate(., '0123456789', '') and string-length(.) &gt; 2) or .='toolsht' or .='trlist' or .='unschedc' or .='unschedchk']) and not(ancestor-or-self::ata-page-block[1]/@pb-name and string(ancestor-or-self::ata-page-block[1]/@pb-name)='intro00') and not(ancestor-or-self::page-block[1]/@pb-name and string(ancestor-or-self::page-block[1]/@pb-name)='intro00') and not(ancestor::ata-page-block/@pb-name[starts-with(., 'disassy') or starts-with(., 'fault')]) and not(ancestor::page-block/@pb-name[starts-with(., 'disassy') or starts-with(., 'fault')]) and not(ancestor::book[contains(@doctype,'oh')] and ancestor::ata-page-block/@pb-name[starts-with(., 'clean')]) and not(ancestor::book[contains(@doctype,'oh')] and ancestor::page-block/@pb-name[starts-with(., 'clean')]) and not(ancestor::ata-page-block/@pb-name[starts-with(., 'mainprac')]) and not(ancestor::page-block/@pb-name[starts-with(., 'mainprac')]) and not(ancestor::book[contains(@doctype,'oh')] and ancestor::ata-page-block/@pb-name[starts-with(., 'inspect')]) and not(ancestor::book[contains(@doctype,'oh')] and ancestor::page-block/@pb-name[starts-with(., 'inspect')]) and not(ancestor::ata-page-block/@pb-name[(starts-with(., 'di') and 'di' = translate(., '0123456789', '') and string-length(.) &gt; 2) or starts-with(.,'service')]) and not(ancestor::page-block/@pb-name[(starts-with(., 'di') and 'di' = translate(., '0123456789', '') and string-length(.) &gt; 2) or starts-with(.,'service')]) and not(ancestor::book[contains(@doctype,'oh')] and ancestor::ata-page-block/@pb-name[starts-with(., 'repair')]) and not(ancestor::book[contains(@doctype,'oh')] and ancestor::page-block/@pb-name[starts-with(., 'repair')]) and not(ancestor::book[contains(@doctype,'oh')] and ancestor::ata-page-block/@pb-name[starts-with(., 'test')]) and not(ancestor::book[contains(@doctype,'oh')] and ancestor::page-block/@pb-name[starts-with(., 'test')]) and not(ancestor::ata-page-block/@pb-name[(starts-with(., 'cl') and 'cl' = translate(., '0123456789', '') and string-length(.) &gt; 2) or .='install' or starts-with(.,'rem-inst') or (starts-with(., 'reminst') and 'reminst' = translate(., '0123456789', '') and string-length(.) &gt; 7) or .='remove' or (starts-with(., 'repair') and 'repair' = translate(., '0123456789', '') and string-length(.) &gt; 6)]) and not(ancestor::page-block/@pb-name[(starts-with(., 'cl') and 'cl' = translate(., '0123456789', '') and string-length(.) &gt; 2) or .='install' or starts-with(.,'rem-inst') or (starts-with(., 'reminst') and 'reminst' = translate(., '0123456789', '') and string-length(.) &gt; 7) or .='remove' or (starts-with(., 'repair') and 'repair' = translate(., '0123456789', '') and string-length(.) &gt; 6)]) and (ancestor::ata-page-block/@pb-name[starts-with(., 'assy') or (starts-with(., 'ic') and 'ic' = translate(., '0123456789', '') and string-length(.) &gt; 2) or (starts-with(., 'te') and 'te' = translate(., '0123456789', '') and string-length(.) &gt; 2) or .='test'])">
            <!-- Condition #28-->
            <xsl:if test="not(@_gte:Gentext-Expanded)">
               <_sfe:BeforeOrAfterText>
                  <_ufe:hidden>Table <_gte:styler_numbering>
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
                  </_ufe:hidden>
               </_sfe:BeforeOrAfterText>
            </xsl:if>
         </xsl:when>
         <xsl:when test="not(ancestor::book[contains(@doctype,'cir') or contains(@doctype,'em') or contains(@doctype,'tmm')]) and not(ancestor::book[contains(@doctype,'oh')] and ancestor::ata-page-block/@pb-name[.='service']) and not(ancestor::book[contains(@doctype,'oh')] and ancestor::page-block/@pb-name[.='service']) and not(ancestor::ata-page-block/@pb-name[.='00awl' or .='00intro' or .='airlim' or .='awl' or .='awlror' or .='chapsect' or .='consume' or .='d-and-o' or .='frontmatte' or .='howtouse' or .='00howtouse' or .='intro' or .='nut_option' or .='oplimits' or .='sblist' or .='schedchk' or .='spectool' or .='timelim' or .='title-page']) and not(ancestor::page-block/@pb-name[.='00awl' or .='00intro' or .='airlim' or .='awl' or .='awlror' or .='chapsect' or .='consume' or .='d-and-o' or .='frontmatte' or .='howtouse' or .='00howtouse' or .='intro' or .='nut_option' or .='oplimits' or .='sblist' or .='schedchk' or .='spectool' or .='timelim' or .='title-page']) and not(ancestor::ata-page-block/@pb-name[(starts-with(., 'do') and 'do' = translate(., '0123456789', '') and string-length(.) &gt; 2) or (starts-with(., 'in') and 'in' = translate(., '0123456789', '') and string-length(.) &gt; 2) or (starts-with(., 'tl') and 'tl' = translate(., '0123456789', '') and string-length(.) &gt; 2) or .='toolsht' or .='trlist' or .='unschedc' or .='unschedchk']) and not(ancestor::page-block/@pb-name[(starts-with(., 'do') and 'do' = translate(., '0123456789', '') and string-length(.) &gt; 2) or (starts-with(., 'in') and 'in' = translate(., '0123456789', '') and string-length(.) &gt; 2) or (starts-with(., 'tl') and 'tl' = translate(., '0123456789', '') and string-length(.) &gt; 2) or .='toolsht' or .='trlist' or .='unschedc' or .='unschedchk']) and not(ancestor-or-self::ata-page-block[1]/@pb-name and string(ancestor-or-self::ata-page-block[1]/@pb-name)='intro00') and not(ancestor-or-self::page-block[1]/@pb-name and string(ancestor-or-self::page-block[1]/@pb-name)='intro00') and not(ancestor::ata-page-block/@pb-name[starts-with(., 'disassy') or starts-with(., 'fault')]) and not(ancestor::page-block/@pb-name[starts-with(., 'disassy') or starts-with(., 'fault')]) and not(ancestor::book[contains(@doctype,'oh')] and ancestor::ata-page-block/@pb-name[starts-with(., 'clean')]) and not(ancestor::book[contains(@doctype,'oh')] and ancestor::page-block/@pb-name[starts-with(., 'clean')]) and not(ancestor::ata-page-block/@pb-name[starts-with(., 'mainprac')]) and not(ancestor::page-block/@pb-name[starts-with(., 'mainprac')]) and not(ancestor::book[contains(@doctype,'oh')] and ancestor::ata-page-block/@pb-name[starts-with(., 'inspect')]) and not(ancestor::book[contains(@doctype,'oh')] and ancestor::page-block/@pb-name[starts-with(., 'inspect')]) and not(ancestor::ata-page-block/@pb-name[(starts-with(., 'di') and 'di' = translate(., '0123456789', '') and string-length(.) &gt; 2) or starts-with(.,'service')]) and not(ancestor::page-block/@pb-name[(starts-with(., 'di') and 'di' = translate(., '0123456789', '') and string-length(.) &gt; 2) or starts-with(.,'service')]) and not(ancestor::book[contains(@doctype,'oh')] and ancestor::ata-page-block/@pb-name[starts-with(., 'repair')]) and not(ancestor::book[contains(@doctype,'oh')] and ancestor::page-block/@pb-name[starts-with(., 'repair')]) and not(ancestor::book[contains(@doctype,'oh')] and ancestor::ata-page-block/@pb-name[starts-with(., 'test')]) and not(ancestor::book[contains(@doctype,'oh')] and ancestor::page-block/@pb-name[starts-with(., 'test')]) and not(ancestor::ata-page-block/@pb-name[(starts-with(., 'cl') and 'cl' = translate(., '0123456789', '') and string-length(.) &gt; 2) or .='install' or starts-with(.,'rem-inst') or (starts-with(., 'reminst') and 'reminst' = translate(., '0123456789', '') and string-length(.) &gt; 7) or .='remove' or (starts-with(., 'repair') and 'repair' = translate(., '0123456789', '') and string-length(.) &gt; 6)]) and (ancestor::page-block/@pb-name[(starts-with(., 'cl') and 'cl' = translate(., '0123456789', '') and string-length(.) &gt; 2) or .='install' or starts-with(.,'rem-inst') or (starts-with(., 'reminst') and 'reminst' = translate(., '0123456789', '') and string-length(.) &gt; 7) or .='remove' or (starts-with(., 'repair') and 'repair' = translate(., '0123456789', '') and string-length(.) &gt; 6)])">
            <!-- Condition #27-->
            <xsl:if test="not(@_gte:Gentext-Expanded)">
               <_sfe:BeforeOrAfterText>
                  <_ufe:hidden>Table <_gte:styler_numbering>
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
                  </_ufe:hidden>
               </_sfe:BeforeOrAfterText>
            </xsl:if>
         </xsl:when>
         <xsl:when test="not(ancestor::book[contains(@doctype,'cir') or contains(@doctype,'em') or contains(@doctype,'tmm')]) and not(ancestor::book[contains(@doctype,'oh')] and ancestor::ata-page-block/@pb-name[.='service']) and not(ancestor::book[contains(@doctype,'oh')] and ancestor::page-block/@pb-name[.='service']) and not(ancestor::ata-page-block/@pb-name[.='00awl' or .='00intro' or .='airlim' or .='awl' or .='awlror' or .='chapsect' or .='consume' or .='d-and-o' or .='frontmatte' or .='howtouse' or .='00howtouse' or .='intro' or .='nut_option' or .='oplimits' or .='sblist' or .='schedchk' or .='spectool' or .='timelim' or .='title-page']) and not(ancestor::page-block/@pb-name[.='00awl' or .='00intro' or .='airlim' or .='awl' or .='awlror' or .='chapsect' or .='consume' or .='d-and-o' or .='frontmatte' or .='howtouse' or .='00howtouse' or .='intro' or .='nut_option' or .='oplimits' or .='sblist' or .='schedchk' or .='spectool' or .='timelim' or .='title-page']) and not(ancestor::ata-page-block/@pb-name[(starts-with(., 'do') and 'do' = translate(., '0123456789', '') and string-length(.) &gt; 2) or (starts-with(., 'in') and 'in' = translate(., '0123456789', '') and string-length(.) &gt; 2) or (starts-with(., 'tl') and 'tl' = translate(., '0123456789', '') and string-length(.) &gt; 2) or .='toolsht' or .='trlist' or .='unschedc' or .='unschedchk']) and not(ancestor::page-block/@pb-name[(starts-with(., 'do') and 'do' = translate(., '0123456789', '') and string-length(.) &gt; 2) or (starts-with(., 'in') and 'in' = translate(., '0123456789', '') and string-length(.) &gt; 2) or (starts-with(., 'tl') and 'tl' = translate(., '0123456789', '') and string-length(.) &gt; 2) or .='toolsht' or .='trlist' or .='unschedc' or .='unschedchk']) and not(ancestor-or-self::ata-page-block[1]/@pb-name and string(ancestor-or-self::ata-page-block[1]/@pb-name)='intro00') and not(ancestor-or-self::page-block[1]/@pb-name and string(ancestor-or-self::page-block[1]/@pb-name)='intro00') and not(ancestor::ata-page-block/@pb-name[starts-with(., 'disassy') or starts-with(., 'fault')]) and not(ancestor::page-block/@pb-name[starts-with(., 'disassy') or starts-with(., 'fault')]) and not(ancestor::book[contains(@doctype,'oh')] and ancestor::ata-page-block/@pb-name[starts-with(., 'clean')]) and not(ancestor::book[contains(@doctype,'oh')] and ancestor::page-block/@pb-name[starts-with(., 'clean')]) and not(ancestor::ata-page-block/@pb-name[starts-with(., 'mainprac')]) and not(ancestor::page-block/@pb-name[starts-with(., 'mainprac')]) and not(ancestor::book[contains(@doctype,'oh')] and ancestor::ata-page-block/@pb-name[starts-with(., 'inspect')]) and not(ancestor::book[contains(@doctype,'oh')] and ancestor::page-block/@pb-name[starts-with(., 'inspect')]) and not(ancestor::ata-page-block/@pb-name[(starts-with(., 'di') and 'di' = translate(., '0123456789', '') and string-length(.) &gt; 2) or starts-with(.,'service')]) and not(ancestor::page-block/@pb-name[(starts-with(., 'di') and 'di' = translate(., '0123456789', '') and string-length(.) &gt; 2) or starts-with(.,'service')]) and not(ancestor::book[contains(@doctype,'oh')] and ancestor::ata-page-block/@pb-name[starts-with(., 'repair')]) and not(ancestor::book[contains(@doctype,'oh')] and ancestor::page-block/@pb-name[starts-with(., 'repair')]) and not(ancestor::book[contains(@doctype,'oh')] and ancestor::ata-page-block/@pb-name[starts-with(., 'test')]) and not(ancestor::book[contains(@doctype,'oh')] and ancestor::page-block/@pb-name[starts-with(., 'test')]) and (ancestor::ata-page-block/@pb-name[(starts-with(., 'cl') and 'cl' = translate(., '0123456789', '') and string-length(.) &gt; 2) or .='install' or starts-with(.,'rem-inst') or (starts-with(., 'reminst') and 'reminst' = translate(., '0123456789', '') and string-length(.) &gt; 7) or .='remove' or (starts-with(., 'repair') and 'repair' = translate(., '0123456789', '') and string-length(.) &gt; 6)])">
            <!-- Condition #26-->
            <xsl:if test="not(@_gte:Gentext-Expanded)">
               <_sfe:BeforeOrAfterText>
                  <_ufe:hidden>Table <_gte:styler_numbering>
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
                  </_ufe:hidden>
               </_sfe:BeforeOrAfterText>
            </xsl:if>
         </xsl:when>
         <xsl:when test="not(ancestor::book[contains(@doctype,'cir') or contains(@doctype,'em') or contains(@doctype,'tmm')]) and not(ancestor::book[contains(@doctype,'oh')] and ancestor::ata-page-block/@pb-name[.='service']) and not(ancestor::book[contains(@doctype,'oh')] and ancestor::page-block/@pb-name[.='service']) and not(ancestor::ata-page-block/@pb-name[.='00awl' or .='00intro' or .='airlim' or .='awl' or .='awlror' or .='chapsect' or .='consume' or .='d-and-o' or .='frontmatte' or .='howtouse' or .='00howtouse' or .='intro' or .='nut_option' or .='oplimits' or .='sblist' or .='schedchk' or .='spectool' or .='timelim' or .='title-page']) and not(ancestor::page-block/@pb-name[.='00awl' or .='00intro' or .='airlim' or .='awl' or .='awlror' or .='chapsect' or .='consume' or .='d-and-o' or .='frontmatte' or .='howtouse' or .='00howtouse' or .='intro' or .='nut_option' or .='oplimits' or .='sblist' or .='schedchk' or .='spectool' or .='timelim' or .='title-page']) and not(ancestor::ata-page-block/@pb-name[(starts-with(., 'do') and 'do' = translate(., '0123456789', '') and string-length(.) &gt; 2) or (starts-with(., 'in') and 'in' = translate(., '0123456789', '') and string-length(.) &gt; 2) or (starts-with(., 'tl') and 'tl' = translate(., '0123456789', '') and string-length(.) &gt; 2) or .='toolsht' or .='trlist' or .='unschedc' or .='unschedchk']) and not(ancestor::page-block/@pb-name[(starts-with(., 'do') and 'do' = translate(., '0123456789', '') and string-length(.) &gt; 2) or (starts-with(., 'in') and 'in' = translate(., '0123456789', '') and string-length(.) &gt; 2) or (starts-with(., 'tl') and 'tl' = translate(., '0123456789', '') and string-length(.) &gt; 2) or .='toolsht' or .='trlist' or .='unschedc' or .='unschedchk']) and not(ancestor-or-self::ata-page-block[1]/@pb-name and string(ancestor-or-self::ata-page-block[1]/@pb-name)='intro00') and not(ancestor-or-self::page-block[1]/@pb-name and string(ancestor-or-self::page-block[1]/@pb-name)='intro00') and not(ancestor::ata-page-block/@pb-name[starts-with(., 'disassy') or starts-with(., 'fault')]) and not(ancestor::page-block/@pb-name[starts-with(., 'disassy') or starts-with(., 'fault')]) and not(ancestor::book[contains(@doctype,'oh')] and ancestor::ata-page-block/@pb-name[starts-with(., 'clean')]) and not(ancestor::book[contains(@doctype,'oh')] and ancestor::page-block/@pb-name[starts-with(., 'clean')]) and not(ancestor::ata-page-block/@pb-name[starts-with(., 'mainprac')]) and not(ancestor::page-block/@pb-name[starts-with(., 'mainprac')]) and not(ancestor::book[contains(@doctype,'oh')] and ancestor::ata-page-block/@pb-name[starts-with(., 'inspect')]) and not(ancestor::book[contains(@doctype,'oh')] and ancestor::page-block/@pb-name[starts-with(., 'inspect')]) and not(ancestor::ata-page-block/@pb-name[(starts-with(., 'di') and 'di' = translate(., '0123456789', '') and string-length(.) &gt; 2) or starts-with(.,'service')]) and not(ancestor::page-block/@pb-name[(starts-with(., 'di') and 'di' = translate(., '0123456789', '') and string-length(.) &gt; 2) or starts-with(.,'service')]) and not(ancestor::book[contains(@doctype,'oh')] and ancestor::ata-page-block/@pb-name[starts-with(., 'repair')]) and not(ancestor::book[contains(@doctype,'oh')] and ancestor::page-block/@pb-name[starts-with(., 'repair')]) and not(ancestor::book[contains(@doctype,'oh')] and ancestor::ata-page-block/@pb-name[starts-with(., 'test')]) and (ancestor::book[contains(@doctype,'oh')] and ancestor::page-block/@pb-name[starts-with(., 'test')])">
            <!-- Condition #25-->
            <xsl:if test="not(@_gte:Gentext-Expanded)">
               <_sfe:BeforeOrAfterText>
                  <_ufe:hidden>Table <_gte:styler_numbering>
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
                  </_ufe:hidden>
               </_sfe:BeforeOrAfterText>
            </xsl:if>
         </xsl:when>
         <xsl:when test="not(ancestor::book[contains(@doctype,'cir') or contains(@doctype,'em') or contains(@doctype,'tmm')]) and not(ancestor::book[contains(@doctype,'oh')] and ancestor::ata-page-block/@pb-name[.='service']) and not(ancestor::book[contains(@doctype,'oh')] and ancestor::page-block/@pb-name[.='service']) and not(ancestor::ata-page-block/@pb-name[.='00awl' or .='00intro' or .='airlim' or .='awl' or .='awlror' or .='chapsect' or .='consume' or .='d-and-o' or .='frontmatte' or .='howtouse' or .='00howtouse' or .='intro' or .='nut_option' or .='oplimits' or .='sblist' or .='schedchk' or .='spectool' or .='timelim' or .='title-page']) and not(ancestor::page-block/@pb-name[.='00awl' or .='00intro' or .='airlim' or .='awl' or .='awlror' or .='chapsect' or .='consume' or .='d-and-o' or .='frontmatte' or .='howtouse' or .='00howtouse' or .='intro' or .='nut_option' or .='oplimits' or .='sblist' or .='schedchk' or .='spectool' or .='timelim' or .='title-page']) and not(ancestor::ata-page-block/@pb-name[(starts-with(., 'do') and 'do' = translate(., '0123456789', '') and string-length(.) &gt; 2) or (starts-with(., 'in') and 'in' = translate(., '0123456789', '') and string-length(.) &gt; 2) or (starts-with(., 'tl') and 'tl' = translate(., '0123456789', '') and string-length(.) &gt; 2) or .='toolsht' or .='trlist' or .='unschedc' or .='unschedchk']) and not(ancestor::page-block/@pb-name[(starts-with(., 'do') and 'do' = translate(., '0123456789', '') and string-length(.) &gt; 2) or (starts-with(., 'in') and 'in' = translate(., '0123456789', '') and string-length(.) &gt; 2) or (starts-with(., 'tl') and 'tl' = translate(., '0123456789', '') and string-length(.) &gt; 2) or .='toolsht' or .='trlist' or .='unschedc' or .='unschedchk']) and not(ancestor-or-self::ata-page-block[1]/@pb-name and string(ancestor-or-self::ata-page-block[1]/@pb-name)='intro00') and not(ancestor-or-self::page-block[1]/@pb-name and string(ancestor-or-self::page-block[1]/@pb-name)='intro00') and not(ancestor::ata-page-block/@pb-name[starts-with(., 'disassy') or starts-with(., 'fault')]) and not(ancestor::page-block/@pb-name[starts-with(., 'disassy') or starts-with(., 'fault')]) and not(ancestor::book[contains(@doctype,'oh')] and ancestor::ata-page-block/@pb-name[starts-with(., 'clean')]) and not(ancestor::book[contains(@doctype,'oh')] and ancestor::page-block/@pb-name[starts-with(., 'clean')]) and not(ancestor::ata-page-block/@pb-name[starts-with(., 'mainprac')]) and not(ancestor::page-block/@pb-name[starts-with(., 'mainprac')]) and not(ancestor::book[contains(@doctype,'oh')] and ancestor::ata-page-block/@pb-name[starts-with(., 'inspect')]) and not(ancestor::book[contains(@doctype,'oh')] and ancestor::page-block/@pb-name[starts-with(., 'inspect')]) and not(ancestor::ata-page-block/@pb-name[(starts-with(., 'di') and 'di' = translate(., '0123456789', '') and string-length(.) &gt; 2) or starts-with(.,'service')]) and not(ancestor::page-block/@pb-name[(starts-with(., 'di') and 'di' = translate(., '0123456789', '') and string-length(.) &gt; 2) or starts-with(.,'service')]) and not(ancestor::book[contains(@doctype,'oh')] and ancestor::ata-page-block/@pb-name[starts-with(., 'repair')]) and not(ancestor::book[contains(@doctype,'oh')] and ancestor::page-block/@pb-name[starts-with(., 'repair')]) and (ancestor::book[contains(@doctype,'oh')] and ancestor::ata-page-block/@pb-name[starts-with(., 'test')])">
            <!-- Condition #24-->
            <xsl:if test="not(@_gte:Gentext-Expanded)">
               <_sfe:BeforeOrAfterText>
                  <_ufe:hidden>Table <_gte:styler_numbering>
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
                  </_ufe:hidden>
               </_sfe:BeforeOrAfterText>
            </xsl:if>
         </xsl:when>
         <xsl:when test="not(ancestor::book[contains(@doctype,'cir') or contains(@doctype,'em') or contains(@doctype,'tmm')]) and not(ancestor::book[contains(@doctype,'oh')] and ancestor::ata-page-block/@pb-name[.='service']) and not(ancestor::book[contains(@doctype,'oh')] and ancestor::page-block/@pb-name[.='service']) and not(ancestor::ata-page-block/@pb-name[.='00awl' or .='00intro' or .='airlim' or .='awl' or .='awlror' or .='chapsect' or .='consume' or .='d-and-o' or .='frontmatte' or .='howtouse' or .='00howtouse' or .='intro' or .='nut_option' or .='oplimits' or .='sblist' or .='schedchk' or .='spectool' or .='timelim' or .='title-page']) and not(ancestor::page-block/@pb-name[.='00awl' or .='00intro' or .='airlim' or .='awl' or .='awlror' or .='chapsect' or .='consume' or .='d-and-o' or .='frontmatte' or .='howtouse' or .='00howtouse' or .='intro' or .='nut_option' or .='oplimits' or .='sblist' or .='schedchk' or .='spectool' or .='timelim' or .='title-page']) and not(ancestor::ata-page-block/@pb-name[(starts-with(., 'do') and 'do' = translate(., '0123456789', '') and string-length(.) &gt; 2) or (starts-with(., 'in') and 'in' = translate(., '0123456789', '') and string-length(.) &gt; 2) or (starts-with(., 'tl') and 'tl' = translate(., '0123456789', '') and string-length(.) &gt; 2) or .='toolsht' or .='trlist' or .='unschedc' or .='unschedchk']) and not(ancestor::page-block/@pb-name[(starts-with(., 'do') and 'do' = translate(., '0123456789', '') and string-length(.) &gt; 2) or (starts-with(., 'in') and 'in' = translate(., '0123456789', '') and string-length(.) &gt; 2) or (starts-with(., 'tl') and 'tl' = translate(., '0123456789', '') and string-length(.) &gt; 2) or .='toolsht' or .='trlist' or .='unschedc' or .='unschedchk']) and not(ancestor-or-self::ata-page-block[1]/@pb-name and string(ancestor-or-self::ata-page-block[1]/@pb-name)='intro00') and not(ancestor-or-self::page-block[1]/@pb-name and string(ancestor-or-self::page-block[1]/@pb-name)='intro00') and not(ancestor::ata-page-block/@pb-name[starts-with(., 'disassy') or starts-with(., 'fault')]) and not(ancestor::page-block/@pb-name[starts-with(., 'disassy') or starts-with(., 'fault')]) and not(ancestor::book[contains(@doctype,'oh')] and ancestor::ata-page-block/@pb-name[starts-with(., 'clean')]) and not(ancestor::book[contains(@doctype,'oh')] and ancestor::page-block/@pb-name[starts-with(., 'clean')]) and not(ancestor::ata-page-block/@pb-name[starts-with(., 'mainprac')]) and not(ancestor::page-block/@pb-name[starts-with(., 'mainprac')]) and not(ancestor::book[contains(@doctype,'oh')] and ancestor::ata-page-block/@pb-name[starts-with(., 'inspect')]) and not(ancestor::book[contains(@doctype,'oh')] and ancestor::page-block/@pb-name[starts-with(., 'inspect')]) and not(ancestor::ata-page-block/@pb-name[(starts-with(., 'di') and 'di' = translate(., '0123456789', '') and string-length(.) &gt; 2) or starts-with(.,'service')]) and not(ancestor::page-block/@pb-name[(starts-with(., 'di') and 'di' = translate(., '0123456789', '') and string-length(.) &gt; 2) or starts-with(.,'service')]) and not(ancestor::book[contains(@doctype,'oh')] and ancestor::ata-page-block/@pb-name[starts-with(., 'repair')]) and (ancestor::book[contains(@doctype,'oh')] and ancestor::page-block/@pb-name[starts-with(., 'repair')])">
            <!-- Condition #23-->
            <xsl:if test="not(@_gte:Gentext-Expanded)">
               <_sfe:BeforeOrAfterText>
                  <_ufe:hidden>Table <_gte:styler_numbering>
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
                  </_ufe:hidden>
               </_sfe:BeforeOrAfterText>
            </xsl:if>
         </xsl:when>
         <xsl:when test="not(ancestor::book[contains(@doctype,'cir') or contains(@doctype,'em') or contains(@doctype,'tmm')]) and not(ancestor::book[contains(@doctype,'oh')] and ancestor::ata-page-block/@pb-name[.='service']) and not(ancestor::book[contains(@doctype,'oh')] and ancestor::page-block/@pb-name[.='service']) and not(ancestor::ata-page-block/@pb-name[.='00awl' or .='00intro' or .='airlim' or .='awl' or .='awlror' or .='chapsect' or .='consume' or .='d-and-o' or .='frontmatte' or .='howtouse' or .='00howtouse' or .='intro' or .='nut_option' or .='oplimits' or .='sblist' or .='schedchk' or .='spectool' or .='timelim' or .='title-page']) and not(ancestor::page-block/@pb-name[.='00awl' or .='00intro' or .='airlim' or .='awl' or .='awlror' or .='chapsect' or .='consume' or .='d-and-o' or .='frontmatte' or .='howtouse' or .='00howtouse' or .='intro' or .='nut_option' or .='oplimits' or .='sblist' or .='schedchk' or .='spectool' or .='timelim' or .='title-page']) and not(ancestor::ata-page-block/@pb-name[(starts-with(., 'do') and 'do' = translate(., '0123456789', '') and string-length(.) &gt; 2) or (starts-with(., 'in') and 'in' = translate(., '0123456789', '') and string-length(.) &gt; 2) or (starts-with(., 'tl') and 'tl' = translate(., '0123456789', '') and string-length(.) &gt; 2) or .='toolsht' or .='trlist' or .='unschedc' or .='unschedchk']) and not(ancestor::page-block/@pb-name[(starts-with(., 'do') and 'do' = translate(., '0123456789', '') and string-length(.) &gt; 2) or (starts-with(., 'in') and 'in' = translate(., '0123456789', '') and string-length(.) &gt; 2) or (starts-with(., 'tl') and 'tl' = translate(., '0123456789', '') and string-length(.) &gt; 2) or .='toolsht' or .='trlist' or .='unschedc' or .='unschedchk']) and not(ancestor-or-self::ata-page-block[1]/@pb-name and string(ancestor-or-self::ata-page-block[1]/@pb-name)='intro00') and not(ancestor-or-self::page-block[1]/@pb-name and string(ancestor-or-self::page-block[1]/@pb-name)='intro00') and not(ancestor::ata-page-block/@pb-name[starts-with(., 'disassy') or starts-with(., 'fault')]) and not(ancestor::page-block/@pb-name[starts-with(., 'disassy') or starts-with(., 'fault')]) and not(ancestor::book[contains(@doctype,'oh')] and ancestor::ata-page-block/@pb-name[starts-with(., 'clean')]) and not(ancestor::book[contains(@doctype,'oh')] and ancestor::page-block/@pb-name[starts-with(., 'clean')]) and not(ancestor::ata-page-block/@pb-name[starts-with(., 'mainprac')]) and not(ancestor::page-block/@pb-name[starts-with(., 'mainprac')]) and not(ancestor::book[contains(@doctype,'oh')] and ancestor::ata-page-block/@pb-name[starts-with(., 'inspect')]) and not(ancestor::book[contains(@doctype,'oh')] and ancestor::page-block/@pb-name[starts-with(., 'inspect')]) and not(ancestor::ata-page-block/@pb-name[(starts-with(., 'di') and 'di' = translate(., '0123456789', '') and string-length(.) &gt; 2) or starts-with(.,'service')]) and not(ancestor::page-block/@pb-name[(starts-with(., 'di') and 'di' = translate(., '0123456789', '') and string-length(.) &gt; 2) or starts-with(.,'service')]) and (ancestor::book[contains(@doctype,'oh')] and ancestor::ata-page-block/@pb-name[starts-with(., 'repair')])">
            <!-- Condition #22-->
            <xsl:if test="not(@_gte:Gentext-Expanded)">
               <_sfe:BeforeOrAfterText>
                  <_ufe:hidden>Table <_gte:styler_numbering>
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
                  </_ufe:hidden>
               </_sfe:BeforeOrAfterText>
            </xsl:if>
         </xsl:when>
         <xsl:when test="not(ancestor::book[contains(@doctype,'cir') or contains(@doctype,'em') or contains(@doctype,'tmm')]) and not(ancestor::book[contains(@doctype,'oh')] and ancestor::ata-page-block/@pb-name[.='service']) and not(ancestor::book[contains(@doctype,'oh')] and ancestor::page-block/@pb-name[.='service']) and not(ancestor::ata-page-block/@pb-name[.='00awl' or .='00intro' or .='airlim' or .='awl' or .='awlror' or .='chapsect' or .='consume' or .='d-and-o' or .='frontmatte' or .='howtouse' or .='00howtouse' or .='intro' or .='nut_option' or .='oplimits' or .='sblist' or .='schedchk' or .='spectool' or .='timelim' or .='title-page']) and not(ancestor::page-block/@pb-name[.='00awl' or .='00intro' or .='airlim' or .='awl' or .='awlror' or .='chapsect' or .='consume' or .='d-and-o' or .='frontmatte' or .='howtouse' or .='00howtouse' or .='intro' or .='nut_option' or .='oplimits' or .='sblist' or .='schedchk' or .='spectool' or .='timelim' or .='title-page']) and not(ancestor::ata-page-block/@pb-name[(starts-with(., 'do') and 'do' = translate(., '0123456789', '') and string-length(.) &gt; 2) or (starts-with(., 'in') and 'in' = translate(., '0123456789', '') and string-length(.) &gt; 2) or (starts-with(., 'tl') and 'tl' = translate(., '0123456789', '') and string-length(.) &gt; 2) or .='toolsht' or .='trlist' or .='unschedc' or .='unschedchk']) and not(ancestor::page-block/@pb-name[(starts-with(., 'do') and 'do' = translate(., '0123456789', '') and string-length(.) &gt; 2) or (starts-with(., 'in') and 'in' = translate(., '0123456789', '') and string-length(.) &gt; 2) or (starts-with(., 'tl') and 'tl' = translate(., '0123456789', '') and string-length(.) &gt; 2) or .='toolsht' or .='trlist' or .='unschedc' or .='unschedchk']) and not(ancestor-or-self::ata-page-block[1]/@pb-name and string(ancestor-or-self::ata-page-block[1]/@pb-name)='intro00') and not(ancestor-or-self::page-block[1]/@pb-name and string(ancestor-or-self::page-block[1]/@pb-name)='intro00') and not(ancestor::ata-page-block/@pb-name[starts-with(., 'disassy') or starts-with(., 'fault')]) and not(ancestor::page-block/@pb-name[starts-with(., 'disassy') or starts-with(., 'fault')]) and not(ancestor::book[contains(@doctype,'oh')] and ancestor::ata-page-block/@pb-name[starts-with(., 'clean')]) and not(ancestor::book[contains(@doctype,'oh')] and ancestor::page-block/@pb-name[starts-with(., 'clean')]) and not(ancestor::ata-page-block/@pb-name[starts-with(., 'mainprac')]) and not(ancestor::page-block/@pb-name[starts-with(., 'mainprac')]) and not(ancestor::book[contains(@doctype,'oh')] and ancestor::ata-page-block/@pb-name[starts-with(., 'inspect')]) and not(ancestor::book[contains(@doctype,'oh')] and ancestor::page-block/@pb-name[starts-with(., 'inspect')]) and not(ancestor::ata-page-block/@pb-name[(starts-with(., 'di') and 'di' = translate(., '0123456789', '') and string-length(.) &gt; 2) or starts-with(.,'service')]) and (ancestor::page-block/@pb-name[(starts-with(., 'di') and 'di' = translate(., '0123456789', '') and string-length(.) &gt; 2) or starts-with(.,'service')])">
            <!-- Condition #21-->
            <xsl:if test="not(@_gte:Gentext-Expanded)">
               <_sfe:BeforeOrAfterText>
                  <_ufe:hidden>Table <_gte:styler_numbering>
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
                  </_ufe:hidden>
               </_sfe:BeforeOrAfterText>
            </xsl:if>
         </xsl:when>
         <xsl:when test="not(ancestor::book[contains(@doctype,'cir') or contains(@doctype,'em') or contains(@doctype,'tmm')]) and not(ancestor::book[contains(@doctype,'oh')] and ancestor::ata-page-block/@pb-name[.='service']) and not(ancestor::book[contains(@doctype,'oh')] and ancestor::page-block/@pb-name[.='service']) and not(ancestor::ata-page-block/@pb-name[.='00awl' or .='00intro' or .='airlim' or .='awl' or .='awlror' or .='chapsect' or .='consume' or .='d-and-o' or .='frontmatte' or .='howtouse' or .='00howtouse' or .='intro' or .='nut_option' or .='oplimits' or .='sblist' or .='schedchk' or .='spectool' or .='timelim' or .='title-page']) and not(ancestor::page-block/@pb-name[.='00awl' or .='00intro' or .='airlim' or .='awl' or .='awlror' or .='chapsect' or .='consume' or .='d-and-o' or .='frontmatte' or .='howtouse' or .='00howtouse' or .='intro' or .='nut_option' or .='oplimits' or .='sblist' or .='schedchk' or .='spectool' or .='timelim' or .='title-page']) and not(ancestor::ata-page-block/@pb-name[(starts-with(., 'do') and 'do' = translate(., '0123456789', '') and string-length(.) &gt; 2) or (starts-with(., 'in') and 'in' = translate(., '0123456789', '') and string-length(.) &gt; 2) or (starts-with(., 'tl') and 'tl' = translate(., '0123456789', '') and string-length(.) &gt; 2) or .='toolsht' or .='trlist' or .='unschedc' or .='unschedchk']) and not(ancestor::page-block/@pb-name[(starts-with(., 'do') and 'do' = translate(., '0123456789', '') and string-length(.) &gt; 2) or (starts-with(., 'in') and 'in' = translate(., '0123456789', '') and string-length(.) &gt; 2) or (starts-with(., 'tl') and 'tl' = translate(., '0123456789', '') and string-length(.) &gt; 2) or .='toolsht' or .='trlist' or .='unschedc' or .='unschedchk']) and not(ancestor-or-self::ata-page-block[1]/@pb-name and string(ancestor-or-self::ata-page-block[1]/@pb-name)='intro00') and not(ancestor-or-self::page-block[1]/@pb-name and string(ancestor-or-self::page-block[1]/@pb-name)='intro00') and not(ancestor::ata-page-block/@pb-name[starts-with(., 'disassy') or starts-with(., 'fault')]) and not(ancestor::page-block/@pb-name[starts-with(., 'disassy') or starts-with(., 'fault')]) and not(ancestor::book[contains(@doctype,'oh')] and ancestor::ata-page-block/@pb-name[starts-with(., 'clean')]) and not(ancestor::book[contains(@doctype,'oh')] and ancestor::page-block/@pb-name[starts-with(., 'clean')]) and not(ancestor::ata-page-block/@pb-name[starts-with(., 'mainprac')]) and not(ancestor::page-block/@pb-name[starts-with(., 'mainprac')]) and not(ancestor::book[contains(@doctype,'oh')] and ancestor::ata-page-block/@pb-name[starts-with(., 'inspect')]) and not(ancestor::book[contains(@doctype,'oh')] and ancestor::page-block/@pb-name[starts-with(., 'inspect')]) and (ancestor::ata-page-block/@pb-name[(starts-with(., 'di') and 'di' = translate(., '0123456789', '') and string-length(.) &gt; 2) or starts-with(.,'service')])">
            <!-- Condition #20-->
            <xsl:if test="not(@_gte:Gentext-Expanded)">
               <_sfe:BeforeOrAfterText>
                  <_ufe:hidden>Table <_gte:styler_numbering>
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
                  </_ufe:hidden>
               </_sfe:BeforeOrAfterText>
            </xsl:if>
         </xsl:when>
         <xsl:when test="not(ancestor::book[contains(@doctype,'cir') or contains(@doctype,'em') or contains(@doctype,'tmm')]) and not(ancestor::book[contains(@doctype,'oh')] and ancestor::ata-page-block/@pb-name[.='service']) and not(ancestor::book[contains(@doctype,'oh')] and ancestor::page-block/@pb-name[.='service']) and not(ancestor::ata-page-block/@pb-name[.='00awl' or .='00intro' or .='airlim' or .='awl' or .='awlror' or .='chapsect' or .='consume' or .='d-and-o' or .='frontmatte' or .='howtouse' or .='00howtouse' or .='intro' or .='nut_option' or .='oplimits' or .='sblist' or .='schedchk' or .='spectool' or .='timelim' or .='title-page']) and not(ancestor::page-block/@pb-name[.='00awl' or .='00intro' or .='airlim' or .='awl' or .='awlror' or .='chapsect' or .='consume' or .='d-and-o' or .='frontmatte' or .='howtouse' or .='00howtouse' or .='intro' or .='nut_option' or .='oplimits' or .='sblist' or .='schedchk' or .='spectool' or .='timelim' or .='title-page']) and not(ancestor::ata-page-block/@pb-name[(starts-with(., 'do') and 'do' = translate(., '0123456789', '') and string-length(.) &gt; 2) or (starts-with(., 'in') and 'in' = translate(., '0123456789', '') and string-length(.) &gt; 2) or (starts-with(., 'tl') and 'tl' = translate(., '0123456789', '') and string-length(.) &gt; 2) or .='toolsht' or .='trlist' or .='unschedc' or .='unschedchk']) and not(ancestor::page-block/@pb-name[(starts-with(., 'do') and 'do' = translate(., '0123456789', '') and string-length(.) &gt; 2) or (starts-with(., 'in') and 'in' = translate(., '0123456789', '') and string-length(.) &gt; 2) or (starts-with(., 'tl') and 'tl' = translate(., '0123456789', '') and string-length(.) &gt; 2) or .='toolsht' or .='trlist' or .='unschedc' or .='unschedchk']) and not(ancestor-or-self::ata-page-block[1]/@pb-name and string(ancestor-or-self::ata-page-block[1]/@pb-name)='intro00') and not(ancestor-or-self::page-block[1]/@pb-name and string(ancestor-or-self::page-block[1]/@pb-name)='intro00') and not(ancestor::ata-page-block/@pb-name[starts-with(., 'disassy') or starts-with(., 'fault')]) and not(ancestor::page-block/@pb-name[starts-with(., 'disassy') or starts-with(., 'fault')]) and not(ancestor::book[contains(@doctype,'oh')] and ancestor::ata-page-block/@pb-name[starts-with(., 'clean')]) and not(ancestor::book[contains(@doctype,'oh')] and ancestor::page-block/@pb-name[starts-with(., 'clean')]) and not(ancestor::ata-page-block/@pb-name[starts-with(., 'mainprac')]) and not(ancestor::page-block/@pb-name[starts-with(., 'mainprac')]) and not(ancestor::book[contains(@doctype,'oh')] and ancestor::ata-page-block/@pb-name[starts-with(., 'inspect')]) and (ancestor::book[contains(@doctype,'oh')] and ancestor::page-block/@pb-name[starts-with(., 'inspect')])">
            <!-- Condition #19-->
            <xsl:if test="not(@_gte:Gentext-Expanded)">
               <_sfe:BeforeOrAfterText>
                  <_ufe:hidden>Table <_gte:styler_numbering>
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
                  </_ufe:hidden>
               </_sfe:BeforeOrAfterText>
            </xsl:if>
         </xsl:when>
         <xsl:when test="not(ancestor::book[contains(@doctype,'cir') or contains(@doctype,'em') or contains(@doctype,'tmm')]) and not(ancestor::book[contains(@doctype,'oh')] and ancestor::ata-page-block/@pb-name[.='service']) and not(ancestor::book[contains(@doctype,'oh')] and ancestor::page-block/@pb-name[.='service']) and not(ancestor::ata-page-block/@pb-name[.='00awl' or .='00intro' or .='airlim' or .='awl' or .='awlror' or .='chapsect' or .='consume' or .='d-and-o' or .='frontmatte' or .='howtouse' or .='00howtouse' or .='intro' or .='nut_option' or .='oplimits' or .='sblist' or .='schedchk' or .='spectool' or .='timelim' or .='title-page']) and not(ancestor::page-block/@pb-name[.='00awl' or .='00intro' or .='airlim' or .='awl' or .='awlror' or .='chapsect' or .='consume' or .='d-and-o' or .='frontmatte' or .='howtouse' or .='00howtouse' or .='intro' or .='nut_option' or .='oplimits' or .='sblist' or .='schedchk' or .='spectool' or .='timelim' or .='title-page']) and not(ancestor::ata-page-block/@pb-name[(starts-with(., 'do') and 'do' = translate(., '0123456789', '') and string-length(.) &gt; 2) or (starts-with(., 'in') and 'in' = translate(., '0123456789', '') and string-length(.) &gt; 2) or (starts-with(., 'tl') and 'tl' = translate(., '0123456789', '') and string-length(.) &gt; 2) or .='toolsht' or .='trlist' or .='unschedc' or .='unschedchk']) and not(ancestor::page-block/@pb-name[(starts-with(., 'do') and 'do' = translate(., '0123456789', '') and string-length(.) &gt; 2) or (starts-with(., 'in') and 'in' = translate(., '0123456789', '') and string-length(.) &gt; 2) or (starts-with(., 'tl') and 'tl' = translate(., '0123456789', '') and string-length(.) &gt; 2) or .='toolsht' or .='trlist' or .='unschedc' or .='unschedchk']) and not(ancestor-or-self::ata-page-block[1]/@pb-name and string(ancestor-or-self::ata-page-block[1]/@pb-name)='intro00') and not(ancestor-or-self::page-block[1]/@pb-name and string(ancestor-or-self::page-block[1]/@pb-name)='intro00') and not(ancestor::ata-page-block/@pb-name[starts-with(., 'disassy') or starts-with(., 'fault')]) and not(ancestor::page-block/@pb-name[starts-with(., 'disassy') or starts-with(., 'fault')]) and not(ancestor::book[contains(@doctype,'oh')] and ancestor::ata-page-block/@pb-name[starts-with(., 'clean')]) and not(ancestor::book[contains(@doctype,'oh')] and ancestor::page-block/@pb-name[starts-with(., 'clean')]) and not(ancestor::ata-page-block/@pb-name[starts-with(., 'mainprac')]) and not(ancestor::page-block/@pb-name[starts-with(., 'mainprac')]) and (ancestor::book[contains(@doctype,'oh')] and ancestor::ata-page-block/@pb-name[starts-with(., 'inspect')])">
            <!-- Condition #18-->
            <xsl:if test="not(@_gte:Gentext-Expanded)">
               <_sfe:BeforeOrAfterText>
                  <_ufe:hidden>Table <_gte:styler_numbering>
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
                  </_ufe:hidden>
               </_sfe:BeforeOrAfterText>
            </xsl:if>
         </xsl:when>
         <xsl:when test="not(ancestor::book[contains(@doctype,'cir') or contains(@doctype,'em') or contains(@doctype,'tmm')]) and not(ancestor::book[contains(@doctype,'oh')] and ancestor::ata-page-block/@pb-name[.='service']) and not(ancestor::book[contains(@doctype,'oh')] and ancestor::page-block/@pb-name[.='service']) and not(ancestor::ata-page-block/@pb-name[.='00awl' or .='00intro' or .='airlim' or .='awl' or .='awlror' or .='chapsect' or .='consume' or .='d-and-o' or .='frontmatte' or .='howtouse' or .='00howtouse' or .='intro' or .='nut_option' or .='oplimits' or .='sblist' or .='schedchk' or .='spectool' or .='timelim' or .='title-page']) and not(ancestor::page-block/@pb-name[.='00awl' or .='00intro' or .='airlim' or .='awl' or .='awlror' or .='chapsect' or .='consume' or .='d-and-o' or .='frontmatte' or .='howtouse' or .='00howtouse' or .='intro' or .='nut_option' or .='oplimits' or .='sblist' or .='schedchk' or .='spectool' or .='timelim' or .='title-page']) and not(ancestor::ata-page-block/@pb-name[(starts-with(., 'do') and 'do' = translate(., '0123456789', '') and string-length(.) &gt; 2) or (starts-with(., 'in') and 'in' = translate(., '0123456789', '') and string-length(.) &gt; 2) or (starts-with(., 'tl') and 'tl' = translate(., '0123456789', '') and string-length(.) &gt; 2) or .='toolsht' or .='trlist' or .='unschedc' or .='unschedchk']) and not(ancestor::page-block/@pb-name[(starts-with(., 'do') and 'do' = translate(., '0123456789', '') and string-length(.) &gt; 2) or (starts-with(., 'in') and 'in' = translate(., '0123456789', '') and string-length(.) &gt; 2) or (starts-with(., 'tl') and 'tl' = translate(., '0123456789', '') and string-length(.) &gt; 2) or .='toolsht' or .='trlist' or .='unschedc' or .='unschedchk']) and not(ancestor-or-self::ata-page-block[1]/@pb-name and string(ancestor-or-self::ata-page-block[1]/@pb-name)='intro00') and not(ancestor-or-self::page-block[1]/@pb-name and string(ancestor-or-self::page-block[1]/@pb-name)='intro00') and not(ancestor::ata-page-block/@pb-name[starts-with(., 'disassy') or starts-with(., 'fault')]) and not(ancestor::page-block/@pb-name[starts-with(., 'disassy') or starts-with(., 'fault')]) and not(ancestor::book[contains(@doctype,'oh')] and ancestor::ata-page-block/@pb-name[starts-with(., 'clean')]) and not(ancestor::book[contains(@doctype,'oh')] and ancestor::page-block/@pb-name[starts-with(., 'clean')]) and not(ancestor::ata-page-block/@pb-name[starts-with(., 'mainprac')]) and (ancestor::page-block/@pb-name[starts-with(., 'mainprac')])">
            <!-- Condition #17-->
            <xsl:if test="not(@_gte:Gentext-Expanded)">
               <_sfe:BeforeOrAfterText>
                  <_ufe:hidden>Table <_gte:styler_numbering>
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
                  </_ufe:hidden>
               </_sfe:BeforeOrAfterText>
            </xsl:if>
         </xsl:when>
         <xsl:when test="not(ancestor::book[contains(@doctype,'cir') or contains(@doctype,'em') or contains(@doctype,'tmm')]) and not(ancestor::book[contains(@doctype,'oh')] and ancestor::ata-page-block/@pb-name[.='service']) and not(ancestor::book[contains(@doctype,'oh')] and ancestor::page-block/@pb-name[.='service']) and not(ancestor::ata-page-block/@pb-name[.='00awl' or .='00intro' or .='airlim' or .='awl' or .='awlror' or .='chapsect' or .='consume' or .='d-and-o' or .='frontmatte' or .='howtouse' or .='00howtouse' or .='intro' or .='nut_option' or .='oplimits' or .='sblist' or .='schedchk' or .='spectool' or .='timelim' or .='title-page']) and not(ancestor::page-block/@pb-name[.='00awl' or .='00intro' or .='airlim' or .='awl' or .='awlror' or .='chapsect' or .='consume' or .='d-and-o' or .='frontmatte' or .='howtouse' or .='00howtouse' or .='intro' or .='nut_option' or .='oplimits' or .='sblist' or .='schedchk' or .='spectool' or .='timelim' or .='title-page']) and not(ancestor::ata-page-block/@pb-name[(starts-with(., 'do') and 'do' = translate(., '0123456789', '') and string-length(.) &gt; 2) or (starts-with(., 'in') and 'in' = translate(., '0123456789', '') and string-length(.) &gt; 2) or (starts-with(., 'tl') and 'tl' = translate(., '0123456789', '') and string-length(.) &gt; 2) or .='toolsht' or .='trlist' or .='unschedc' or .='unschedchk']) and not(ancestor::page-block/@pb-name[(starts-with(., 'do') and 'do' = translate(., '0123456789', '') and string-length(.) &gt; 2) or (starts-with(., 'in') and 'in' = translate(., '0123456789', '') and string-length(.) &gt; 2) or (starts-with(., 'tl') and 'tl' = translate(., '0123456789', '') and string-length(.) &gt; 2) or .='toolsht' or .='trlist' or .='unschedc' or .='unschedchk']) and not(ancestor-or-self::ata-page-block[1]/@pb-name and string(ancestor-or-self::ata-page-block[1]/@pb-name)='intro00') and not(ancestor-or-self::page-block[1]/@pb-name and string(ancestor-or-self::page-block[1]/@pb-name)='intro00') and not(ancestor::ata-page-block/@pb-name[starts-with(., 'disassy') or starts-with(., 'fault')]) and not(ancestor::page-block/@pb-name[starts-with(., 'disassy') or starts-with(., 'fault')]) and not(ancestor::book[contains(@doctype,'oh')] and ancestor::ata-page-block/@pb-name[starts-with(., 'clean')]) and not(ancestor::book[contains(@doctype,'oh')] and ancestor::page-block/@pb-name[starts-with(., 'clean')]) and (ancestor::ata-page-block/@pb-name[starts-with(., 'mainprac')])">
            <!-- Condition #16-->
            <xsl:if test="not(@_gte:Gentext-Expanded)">
               <_sfe:BeforeOrAfterText>
                  <_ufe:hidden>Table <_gte:styler_numbering>
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
                  </_ufe:hidden>
               </_sfe:BeforeOrAfterText>
            </xsl:if>
         </xsl:when>
         <xsl:when test="not(ancestor::book[contains(@doctype,'cir') or contains(@doctype,'em') or contains(@doctype,'tmm')]) and not(ancestor::book[contains(@doctype,'oh')] and ancestor::ata-page-block/@pb-name[.='service']) and not(ancestor::book[contains(@doctype,'oh')] and ancestor::page-block/@pb-name[.='service']) and not(ancestor::ata-page-block/@pb-name[.='00awl' or .='00intro' or .='airlim' or .='awl' or .='awlror' or .='chapsect' or .='consume' or .='d-and-o' or .='frontmatte' or .='howtouse' or .='00howtouse' or .='intro' or .='nut_option' or .='oplimits' or .='sblist' or .='schedchk' or .='spectool' or .='timelim' or .='title-page']) and not(ancestor::page-block/@pb-name[.='00awl' or .='00intro' or .='airlim' or .='awl' or .='awlror' or .='chapsect' or .='consume' or .='d-and-o' or .='frontmatte' or .='howtouse' or .='00howtouse' or .='intro' or .='nut_option' or .='oplimits' or .='sblist' or .='schedchk' or .='spectool' or .='timelim' or .='title-page']) and not(ancestor::ata-page-block/@pb-name[(starts-with(., 'do') and 'do' = translate(., '0123456789', '') and string-length(.) &gt; 2) or (starts-with(., 'in') and 'in' = translate(., '0123456789', '') and string-length(.) &gt; 2) or (starts-with(., 'tl') and 'tl' = translate(., '0123456789', '') and string-length(.) &gt; 2) or .='toolsht' or .='trlist' or .='unschedc' or .='unschedchk']) and not(ancestor::page-block/@pb-name[(starts-with(., 'do') and 'do' = translate(., '0123456789', '') and string-length(.) &gt; 2) or (starts-with(., 'in') and 'in' = translate(., '0123456789', '') and string-length(.) &gt; 2) or (starts-with(., 'tl') and 'tl' = translate(., '0123456789', '') and string-length(.) &gt; 2) or .='toolsht' or .='trlist' or .='unschedc' or .='unschedchk']) and not(ancestor-or-self::ata-page-block[1]/@pb-name and string(ancestor-or-self::ata-page-block[1]/@pb-name)='intro00') and not(ancestor-or-self::page-block[1]/@pb-name and string(ancestor-or-self::page-block[1]/@pb-name)='intro00') and not(ancestor::ata-page-block/@pb-name[starts-with(., 'disassy') or starts-with(., 'fault')]) and not(ancestor::page-block/@pb-name[starts-with(., 'disassy') or starts-with(., 'fault')]) and not(ancestor::book[contains(@doctype,'oh')] and ancestor::ata-page-block/@pb-name[starts-with(., 'clean')]) and (ancestor::book[contains(@doctype,'oh')] and ancestor::page-block/@pb-name[starts-with(., 'clean')])">
            <!-- Condition #15-->
            <xsl:if test="not(@_gte:Gentext-Expanded)">
               <_sfe:BeforeOrAfterText>
                  <_ufe:hidden>Table <_gte:styler_numbering>
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
                  </_ufe:hidden>
               </_sfe:BeforeOrAfterText>
            </xsl:if>
         </xsl:when>
         <xsl:when test="not(ancestor::book[contains(@doctype,'cir') or contains(@doctype,'em') or contains(@doctype,'tmm')]) and not(ancestor::book[contains(@doctype,'oh')] and ancestor::ata-page-block/@pb-name[.='service']) and not(ancestor::book[contains(@doctype,'oh')] and ancestor::page-block/@pb-name[.='service']) and not(ancestor::ata-page-block/@pb-name[.='00awl' or .='00intro' or .='airlim' or .='awl' or .='awlror' or .='chapsect' or .='consume' or .='d-and-o' or .='frontmatte' or .='howtouse' or .='00howtouse' or .='intro' or .='nut_option' or .='oplimits' or .='sblist' or .='schedchk' or .='spectool' or .='timelim' or .='title-page']) and not(ancestor::page-block/@pb-name[.='00awl' or .='00intro' or .='airlim' or .='awl' or .='awlror' or .='chapsect' or .='consume' or .='d-and-o' or .='frontmatte' or .='howtouse' or .='00howtouse' or .='intro' or .='nut_option' or .='oplimits' or .='sblist' or .='schedchk' or .='spectool' or .='timelim' or .='title-page']) and not(ancestor::ata-page-block/@pb-name[(starts-with(., 'do') and 'do' = translate(., '0123456789', '') and string-length(.) &gt; 2) or (starts-with(., 'in') and 'in' = translate(., '0123456789', '') and string-length(.) &gt; 2) or (starts-with(., 'tl') and 'tl' = translate(., '0123456789', '') and string-length(.) &gt; 2) or .='toolsht' or .='trlist' or .='unschedc' or .='unschedchk']) and not(ancestor::page-block/@pb-name[(starts-with(., 'do') and 'do' = translate(., '0123456789', '') and string-length(.) &gt; 2) or (starts-with(., 'in') and 'in' = translate(., '0123456789', '') and string-length(.) &gt; 2) or (starts-with(., 'tl') and 'tl' = translate(., '0123456789', '') and string-length(.) &gt; 2) or .='toolsht' or .='trlist' or .='unschedc' or .='unschedchk']) and not(ancestor-or-self::ata-page-block[1]/@pb-name and string(ancestor-or-self::ata-page-block[1]/@pb-name)='intro00') and not(ancestor-or-self::page-block[1]/@pb-name and string(ancestor-or-self::page-block[1]/@pb-name)='intro00') and not(ancestor::ata-page-block/@pb-name[starts-with(., 'disassy') or starts-with(., 'fault')]) and not(ancestor::page-block/@pb-name[starts-with(., 'disassy') or starts-with(., 'fault')]) and (ancestor::book[contains(@doctype,'oh')] and ancestor::ata-page-block/@pb-name[starts-with(., 'clean')])">
            <!-- Condition #14-->
            <xsl:if test="not(@_gte:Gentext-Expanded)">
               <_sfe:BeforeOrAfterText>
                  <_ufe:hidden>Table <_gte:styler_numbering>
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
                  </_ufe:hidden>
               </_sfe:BeforeOrAfterText>
            </xsl:if>
         </xsl:when>
         <xsl:when test="not(ancestor::book[contains(@doctype,'cir') or contains(@doctype,'em') or contains(@doctype,'tmm')]) and not(ancestor::book[contains(@doctype,'oh')] and ancestor::ata-page-block/@pb-name[.='service']) and not(ancestor::book[contains(@doctype,'oh')] and ancestor::page-block/@pb-name[.='service']) and not(ancestor::ata-page-block/@pb-name[.='00awl' or .='00intro' or .='airlim' or .='awl' or .='awlror' or .='chapsect' or .='consume' or .='d-and-o' or .='frontmatte' or .='howtouse' or .='00howtouse' or .='intro' or .='nut_option' or .='oplimits' or .='sblist' or .='schedchk' or .='spectool' or .='timelim' or .='title-page']) and not(ancestor::page-block/@pb-name[.='00awl' or .='00intro' or .='airlim' or .='awl' or .='awlror' or .='chapsect' or .='consume' or .='d-and-o' or .='frontmatte' or .='howtouse' or .='00howtouse' or .='intro' or .='nut_option' or .='oplimits' or .='sblist' or .='schedchk' or .='spectool' or .='timelim' or .='title-page']) and not(ancestor::ata-page-block/@pb-name[(starts-with(., 'do') and 'do' = translate(., '0123456789', '') and string-length(.) &gt; 2) or (starts-with(., 'in') and 'in' = translate(., '0123456789', '') and string-length(.) &gt; 2) or (starts-with(., 'tl') and 'tl' = translate(., '0123456789', '') and string-length(.) &gt; 2) or .='toolsht' or .='trlist' or .='unschedc' or .='unschedchk']) and not(ancestor::page-block/@pb-name[(starts-with(., 'do') and 'do' = translate(., '0123456789', '') and string-length(.) &gt; 2) or (starts-with(., 'in') and 'in' = translate(., '0123456789', '') and string-length(.) &gt; 2) or (starts-with(., 'tl') and 'tl' = translate(., '0123456789', '') and string-length(.) &gt; 2) or .='toolsht' or .='trlist' or .='unschedc' or .='unschedchk']) and not(ancestor-or-self::ata-page-block[1]/@pb-name and string(ancestor-or-self::ata-page-block[1]/@pb-name)='intro00') and not(ancestor-or-self::page-block[1]/@pb-name and string(ancestor-or-self::page-block[1]/@pb-name)='intro00') and not(ancestor::ata-page-block/@pb-name[starts-with(., 'disassy') or starts-with(., 'fault')]) and (ancestor::page-block/@pb-name[starts-with(., 'disassy') or starts-with(., 'fault')])">
            <!-- Condition #13-->
            <xsl:if test="not(@_gte:Gentext-Expanded)">
               <_sfe:BeforeOrAfterText>
                  <_ufe:hidden>Table <_gte:styler_numbering>
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
                  </_ufe:hidden>
               </_sfe:BeforeOrAfterText>
            </xsl:if>
         </xsl:when>
         <xsl:when test="not(ancestor::book[contains(@doctype,'cir') or contains(@doctype,'em') or contains(@doctype,'tmm')]) and not(ancestor::book[contains(@doctype,'oh')] and ancestor::ata-page-block/@pb-name[.='service']) and not(ancestor::book[contains(@doctype,'oh')] and ancestor::page-block/@pb-name[.='service']) and not(ancestor::ata-page-block/@pb-name[.='00awl' or .='00intro' or .='airlim' or .='awl' or .='awlror' or .='chapsect' or .='consume' or .='d-and-o' or .='frontmatte' or .='howtouse' or .='00howtouse' or .='intro' or .='nut_option' or .='oplimits' or .='sblist' or .='schedchk' or .='spectool' or .='timelim' or .='title-page']) and not(ancestor::page-block/@pb-name[.='00awl' or .='00intro' or .='airlim' or .='awl' or .='awlror' or .='chapsect' or .='consume' or .='d-and-o' or .='frontmatte' or .='howtouse' or .='00howtouse' or .='intro' or .='nut_option' or .='oplimits' or .='sblist' or .='schedchk' or .='spectool' or .='timelim' or .='title-page']) and not(ancestor::ata-page-block/@pb-name[(starts-with(., 'do') and 'do' = translate(., '0123456789', '') and string-length(.) &gt; 2) or (starts-with(., 'in') and 'in' = translate(., '0123456789', '') and string-length(.) &gt; 2) or (starts-with(., 'tl') and 'tl' = translate(., '0123456789', '') and string-length(.) &gt; 2) or .='toolsht' or .='trlist' or .='unschedc' or .='unschedchk']) and not(ancestor::page-block/@pb-name[(starts-with(., 'do') and 'do' = translate(., '0123456789', '') and string-length(.) &gt; 2) or (starts-with(., 'in') and 'in' = translate(., '0123456789', '') and string-length(.) &gt; 2) or (starts-with(., 'tl') and 'tl' = translate(., '0123456789', '') and string-length(.) &gt; 2) or .='toolsht' or .='trlist' or .='unschedc' or .='unschedchk']) and not(ancestor-or-self::ata-page-block[1]/@pb-name and string(ancestor-or-self::ata-page-block[1]/@pb-name)='intro00') and not(ancestor-or-self::page-block[1]/@pb-name and string(ancestor-or-self::page-block[1]/@pb-name)='intro00') and (ancestor::ata-page-block/@pb-name[starts-with(., 'disassy') or starts-with(., 'fault')])">
            <!-- Condition #12-->
            <xsl:if test="not(@_gte:Gentext-Expanded)">
               <_sfe:BeforeOrAfterText>
                  <_ufe:hidden>Table <_gte:styler_numbering>
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
                  </_ufe:hidden>
               </_sfe:BeforeOrAfterText>
            </xsl:if>
         </xsl:when>
         <xsl:when test="not(ancestor::book[contains(@doctype,'cir') or contains(@doctype,'em') or contains(@doctype,'tmm')]) and not(ancestor::book[contains(@doctype,'oh')] and ancestor::ata-page-block/@pb-name[.='service']) and not(ancestor::book[contains(@doctype,'oh')] and ancestor::page-block/@pb-name[.='service']) and not(ancestor::ata-page-block/@pb-name[.='00awl' or .='00intro' or .='airlim' or .='awl' or .='awlror' or .='chapsect' or .='consume' or .='d-and-o' or .='frontmatte' or .='howtouse' or .='00howtouse' or .='intro' or .='nut_option' or .='oplimits' or .='sblist' or .='schedchk' or .='spectool' or .='timelim' or .='title-page']) and not(ancestor::page-block/@pb-name[.='00awl' or .='00intro' or .='airlim' or .='awl' or .='awlror' or .='chapsect' or .='consume' or .='d-and-o' or .='frontmatte' or .='howtouse' or .='00howtouse' or .='intro' or .='nut_option' or .='oplimits' or .='sblist' or .='schedchk' or .='spectool' or .='timelim' or .='title-page']) and not(ancestor::ata-page-block/@pb-name[(starts-with(., 'do') and 'do' = translate(., '0123456789', '') and string-length(.) &gt; 2) or (starts-with(., 'in') and 'in' = translate(., '0123456789', '') and string-length(.) &gt; 2) or (starts-with(., 'tl') and 'tl' = translate(., '0123456789', '') and string-length(.) &gt; 2) or .='toolsht' or .='trlist' or .='unschedc' or .='unschedchk']) and not(ancestor::page-block/@pb-name[(starts-with(., 'do') and 'do' = translate(., '0123456789', '') and string-length(.) &gt; 2) or (starts-with(., 'in') and 'in' = translate(., '0123456789', '') and string-length(.) &gt; 2) or (starts-with(., 'tl') and 'tl' = translate(., '0123456789', '') and string-length(.) &gt; 2) or .='toolsht' or .='trlist' or .='unschedc' or .='unschedchk']) and not(ancestor-or-self::ata-page-block[1]/@pb-name and string(ancestor-or-self::ata-page-block[1]/@pb-name)='intro00') and (ancestor-or-self::page-block[1]/@pb-name and string(ancestor-or-self::page-block[1]/@pb-name)='intro00')">
            <!-- Condition #11-->
            <xsl:if test="not(@_gte:Gentext-Expanded)">
               <_sfe:BeforeOrAfterText>
                  <_ufe:hidden>Table <_gte:styler_numbering>
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
                  </_ufe:hidden>
               </_sfe:BeforeOrAfterText>
            </xsl:if>
         </xsl:when>
         <xsl:when test="not(ancestor::book[contains(@doctype,'cir') or contains(@doctype,'em') or contains(@doctype,'tmm')]) and not(ancestor::book[contains(@doctype,'oh')] and ancestor::ata-page-block/@pb-name[.='service']) and not(ancestor::book[contains(@doctype,'oh')] and ancestor::page-block/@pb-name[.='service']) and not(ancestor::ata-page-block/@pb-name[.='00awl' or .='00intro' or .='airlim' or .='awl' or .='awlror' or .='chapsect' or .='consume' or .='d-and-o' or .='frontmatte' or .='howtouse' or .='00howtouse' or .='intro' or .='nut_option' or .='oplimits' or .='sblist' or .='schedchk' or .='spectool' or .='timelim' or .='title-page']) and not(ancestor::page-block/@pb-name[.='00awl' or .='00intro' or .='airlim' or .='awl' or .='awlror' or .='chapsect' or .='consume' or .='d-and-o' or .='frontmatte' or .='howtouse' or .='00howtouse' or .='intro' or .='nut_option' or .='oplimits' or .='sblist' or .='schedchk' or .='spectool' or .='timelim' or .='title-page']) and not(ancestor::ata-page-block/@pb-name[(starts-with(., 'do') and 'do' = translate(., '0123456789', '') and string-length(.) &gt; 2) or (starts-with(., 'in') and 'in' = translate(., '0123456789', '') and string-length(.) &gt; 2) or (starts-with(., 'tl') and 'tl' = translate(., '0123456789', '') and string-length(.) &gt; 2) or .='toolsht' or .='trlist' or .='unschedc' or .='unschedchk']) and not(ancestor::page-block/@pb-name[(starts-with(., 'do') and 'do' = translate(., '0123456789', '') and string-length(.) &gt; 2) or (starts-with(., 'in') and 'in' = translate(., '0123456789', '') and string-length(.) &gt; 2) or (starts-with(., 'tl') and 'tl' = translate(., '0123456789', '') and string-length(.) &gt; 2) or .='toolsht' or .='trlist' or .='unschedc' or .='unschedchk']) and (ancestor-or-self::ata-page-block[1]/@pb-name and string(ancestor-or-self::ata-page-block[1]/@pb-name)='intro00')">
            <!-- Condition #10-->
            <xsl:if test="not(@_gte:Gentext-Expanded)">
               <_sfe:BeforeOrAfterText>
                  <_ufe:hidden>Table <_gte:styler_numbering>
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
                  </_ufe:hidden>
               </_sfe:BeforeOrAfterText>
            </xsl:if>
         </xsl:when>
         <xsl:when test="not(ancestor::book[contains(@doctype,'cir') or contains(@doctype,'em') or contains(@doctype,'tmm')]) and not(ancestor::book[contains(@doctype,'oh')] and ancestor::ata-page-block/@pb-name[.='service']) and not(ancestor::book[contains(@doctype,'oh')] and ancestor::page-block/@pb-name[.='service']) and not(ancestor::ata-page-block/@pb-name[.='00awl' or .='00intro' or .='airlim' or .='awl' or .='awlror' or .='chapsect' or .='consume' or .='d-and-o' or .='frontmatte' or .='howtouse' or .='00howtouse' or .='intro' or .='nut_option' or .='oplimits' or .='sblist' or .='schedchk' or .='spectool' or .='timelim' or .='title-page']) and not(ancestor::page-block/@pb-name[.='00awl' or .='00intro' or .='airlim' or .='awl' or .='awlror' or .='chapsect' or .='consume' or .='d-and-o' or .='frontmatte' or .='howtouse' or .='00howtouse' or .='intro' or .='nut_option' or .='oplimits' or .='sblist' or .='schedchk' or .='spectool' or .='timelim' or .='title-page']) and not(ancestor::ata-page-block/@pb-name[(starts-with(., 'do') and 'do' = translate(., '0123456789', '') and string-length(.) &gt; 2) or (starts-with(., 'in') and 'in' = translate(., '0123456789', '') and string-length(.) &gt; 2) or (starts-with(., 'tl') and 'tl' = translate(., '0123456789', '') and string-length(.) &gt; 2) or .='toolsht' or .='trlist' or .='unschedc' or .='unschedchk']) and (ancestor::page-block/@pb-name[(starts-with(., 'do') and 'do' = translate(., '0123456789', '') and string-length(.) &gt; 2) or (starts-with(., 'in') and 'in' = translate(., '0123456789', '') and string-length(.) &gt; 2) or (starts-with(., 'tl') and 'tl' = translate(., '0123456789', '') and string-length(.) &gt; 2) or .='toolsht' or .='trlist' or .='unschedc' or .='unschedchk'])">
            <!-- Condition #9-->
            <xsl:if test="not(@_gte:Gentext-Expanded)">
               <_sfe:BeforeOrAfterText>
                  <_ufe:hidden>Table <_gte:styler_numbering>
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
                  </_ufe:hidden>
               </_sfe:BeforeOrAfterText>
            </xsl:if>
         </xsl:when>
         <xsl:when test="not(ancestor::book[contains(@doctype,'cir') or contains(@doctype,'em') or contains(@doctype,'tmm')]) and not(ancestor::book[contains(@doctype,'oh')] and ancestor::ata-page-block/@pb-name[.='service']) and not(ancestor::book[contains(@doctype,'oh')] and ancestor::page-block/@pb-name[.='service']) and not(ancestor::ata-page-block/@pb-name[.='00awl' or .='00intro' or .='airlim' or .='awl' or .='awlror' or .='chapsect' or .='consume' or .='d-and-o' or .='frontmatte' or .='howtouse' or .='00howtouse' or .='intro' or .='nut_option' or .='oplimits' or .='sblist' or .='schedchk' or .='spectool' or .='timelim' or .='title-page']) and not(ancestor::page-block/@pb-name[.='00awl' or .='00intro' or .='airlim' or .='awl' or .='awlror' or .='chapsect' or .='consume' or .='d-and-o' or .='frontmatte' or .='howtouse' or .='00howtouse' or .='intro' or .='nut_option' or .='oplimits' or .='sblist' or .='schedchk' or .='spectool' or .='timelim' or .='title-page']) and (ancestor::ata-page-block/@pb-name[(starts-with(., 'do') and 'do' = translate(., '0123456789', '') and string-length(.) &gt; 2) or (starts-with(., 'in') and 'in' = translate(., '0123456789', '') and string-length(.) &gt; 2) or (starts-with(., 'tl') and 'tl' = translate(., '0123456789', '') and string-length(.) &gt; 2) or .='toolsht' or .='trlist' or .='unschedc' or .='unschedchk'])">
            <!-- Condition #8-->
            <xsl:if test="not(@_gte:Gentext-Expanded)">
               <_sfe:BeforeOrAfterText>
                  <_ufe:hidden>Table <_gte:styler_numbering>
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
                  </_ufe:hidden>
               </_sfe:BeforeOrAfterText>
            </xsl:if>
         </xsl:when>
         <xsl:when test="not(ancestor::book[contains(@doctype,'cir') or contains(@doctype,'em') or contains(@doctype,'tmm')]) and not(ancestor::book[contains(@doctype,'oh')] and ancestor::ata-page-block/@pb-name[.='service']) and not(ancestor::book[contains(@doctype,'oh')] and ancestor::page-block/@pb-name[.='service']) and not(ancestor::ata-page-block/@pb-name[.='00awl' or .='00intro' or .='airlim' or .='awl' or .='awlror' or .='chapsect' or .='consume' or .='d-and-o' or .='frontmatte' or .='howtouse' or .='00howtouse' or .='intro' or .='nut_option' or .='oplimits' or .='sblist' or .='schedchk' or .='spectool' or .='timelim' or .='title-page']) and (ancestor::page-block/@pb-name[.='00awl' or .='00intro' or .='airlim' or .='awl' or .='awlror' or .='chapsect' or .='consume' or .='d-and-o' or .='frontmatte' or .='howtouse' or .='00howtouse' or .='intro' or .='nut_option' or .='oplimits' or .='sblist' or .='schedchk' or .='spectool' or .='timelim' or .='title-page'])">
            <!-- Condition #7-->
            <xsl:if test="not(@_gte:Gentext-Expanded)">
               <_sfe:BeforeOrAfterText>
                  <_ufe:hidden>Table <_gte:styler_numbering>
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
                  </_ufe:hidden>
               </_sfe:BeforeOrAfterText>
            </xsl:if>
         </xsl:when>
         <xsl:when test="not(ancestor::book[contains(@doctype,'cir') or contains(@doctype,'em') or contains(@doctype,'tmm')]) and not(ancestor::book[contains(@doctype,'oh')] and ancestor::ata-page-block/@pb-name[.='service']) and not(ancestor::book[contains(@doctype,'oh')] and ancestor::page-block/@pb-name[.='service']) and (ancestor::ata-page-block/@pb-name[.='00awl' or .='00intro' or .='airlim' or .='awl' or .='awlror' or .='chapsect' or .='consume' or .='d-and-o' or .='frontmatte' or .='howtouse' or .='00howtouse' or .='intro' or .='nut_option' or .='oplimits' or .='sblist' or .='schedchk' or .='spectool' or .='timelim' or .='title-page'])">
            <!-- Condition #6-->
            <xsl:if test="not(@_gte:Gentext-Expanded)">
               <_sfe:BeforeOrAfterText>
                  <_ufe:hidden>Table <_gte:styler_numbering>
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
                  </_ufe:hidden>
               </_sfe:BeforeOrAfterText>
            </xsl:if>
         </xsl:when>
         <xsl:when test="not(ancestor::book[contains(@doctype,'cir') or contains(@doctype,'em') or contains(@doctype,'tmm')]) and not(ancestor::book[contains(@doctype,'oh')] and ancestor::ata-page-block/@pb-name[.='service']) and (ancestor::book[contains(@doctype,'oh')] and ancestor::page-block/@pb-name[.='service'])">
            <!-- Condition #5-->
            <xsl:if test="not(@_gte:Gentext-Expanded)">
               <_sfe:BeforeOrAfterText/>
            </xsl:if>
         </xsl:when>
         <xsl:when test="not(ancestor::book[contains(@doctype,'cir') or contains(@doctype,'em') or contains(@doctype,'tmm')]) and (ancestor::book[contains(@doctype,'oh')] and ancestor::ata-page-block/@pb-name[.='service'])">
            <!-- Condition #4-->
            <xsl:if test="not(@_gte:Gentext-Expanded)">
               <_sfe:BeforeOrAfterText/>
            </xsl:if>
         </xsl:when>
         <xsl:when test="(ancestor::book[contains(@doctype,'cir') or contains(@doctype,'em') or contains(@doctype,'tmm')]) and not(number(ancestor::pgblk/@pgblknbr)&gt;0 and number(ancestor::pgblk/@pgblknbr)&lt;=13)">
            <!-- Condition #3-->
            <xsl:if test="not(@_gte:Gentext-Expanded)">
               <_sfe:BeforeOrAfterText>
                  <_ufe:hidden>Table <_gte:styler_numbering>
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
                  </_ufe:hidden>
                  <xsl:text> </xsl:text>
               </_sfe:BeforeOrAfterText>
            </xsl:if>
         </xsl:when>
         <xsl:when test="(ancestor::book[contains(@doctype,'cir') or contains(@doctype,'em') or contains(@doctype,'tmm')]) and (number(ancestor::pgblk/@pgblknbr)&gt;0 and number(ancestor::pgblk/@pgblknbr)&lt;=13)">
            <!-- Condition #2-->
            <xsl:if test="not(@_gte:Gentext-Expanded)">
               <_sfe:BeforeOrAfterText>
                  <_ufe:hidden>Table <_gte:styler_numbering>
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
                  </_ufe:hidden>
                  <xsl:text> </xsl:text>
               </_sfe:BeforeOrAfterText>
            </xsl:if>
         </xsl:when>
      </xsl:choose>
   </xsl:template>

<xsl:template match="ata-page-block/title" mode="styler-LabelAndNumberMarker" priority="2">
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

<xsl:template match="title-page/title" mode="styler-LabelAndNumberMarker" priority="1">
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

<xsl:template match="pgblk/_ufe:tmm-title" mode="styler-LabelAndNumberMarker" priority="2">
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

<xsl:template match="pbfmatr/_ufe:tmm-title" mode="styler-LabelAndNumberMarker" priority="1">
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

<xsl:template match="enumlist//enumlist//enumlist//enumlist/unlitem" mode="styler-LabelAndNumberMarker" priority="12">
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

<xsl:template match="enumlist//enumlist//enumlist/unlitem" mode="styler-LabelAndNumberMarker" priority="11">
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

<xsl:template match="enumlist//enumlist/unlitem" mode="styler-LabelAndNumberMarker" priority="8">
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

<xsl:template match="enumlist/unlitem" mode="styler-LabelAndNumberMarker" priority="5">
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

</xsl:stylesheet>
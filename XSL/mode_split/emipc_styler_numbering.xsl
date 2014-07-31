<?xml version="1.0" encoding="UTF-8"?><xsl:stylesheet xmlns:simg="java:net.sf.docbook.saxon.ImageIntrinsics" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:ximg="xaln://com.nwalsh.xalan.ImageIntrinsics" xmlns="http://www.w3.org/1999/xhtml" xmlns:exslt="http://exslt.org/common" xmlns:_acl="java:com.arbortext.epic.Acl" xmlns:msxsl="urn:schemas-microsoft-com:xslt" xmlns:_="http://www.pwc.ca/namespace/doctypes/emipc" xmlns:_dtd="http://www.arbortext.com/namespace/Styler/UserElements" xmlns:atidlm="http://www.arbortext.com/namespace/atidlm" xmlns:_2="http://www.pwc.ca/namespace/doctypes/jmtosmigrate" xmlns:ch="http://www.arbortext.com/namespace/chunker" xmlns:saxon="http://saxon.sf.net/" xmlns:_5="http://www.pwc.ca/namespace/doctypes/ipc" xmlns:_gte="http://www.arbortext.com/namespace/Styler/GeneratedTextElements" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:_sfe="http://www.arbortext.com/namespace/Styler/StylerFormattingElements" xmlns:_js="java:com.arbortext.epic.internal.js.JavaScript" xmlns:_3="http://www.pwc.ca/namespace/doctypes/migrate" xmlns:_ufe="http://www.arbortext.com/namespace/Styler/UserFormattingElements" version="1.0" exclude-result-prefixes="_ atidlm xml _2 ch saxon _5 xsi _js _3 #default exslt msxsl _dtd _ufe _sfe _gte simg ximg _acl">


<xsl:template match="pwc-title" mode="styler_numbering" priority="0">
      <!--This context has no numbering-->
      <xsl:param name="do-qmark" select="'yes'"/>
      <xsl:if test="$do-qmark='yes'">
         <xsl:value-of select="'?'"/>
      </xsl:if>
   </xsl:template>

<xsl:template match="numlist/step" mode="styler_numbering" priority="3">
      <xsl:text>(</xsl:text>
      <xsl:number count="numlist/step" format="1"/>
      <xsl:text>)</xsl:text>
   </xsl:template>

<xsl:template match="procedure//step" mode="styler_numbering" priority="2">
      <xsl:text>(</xsl:text>
      <xsl:variable name="node-id" select="generate-id(.)"/>
      <xsl:variable name="from-node" select="(ancestor-or-self::procedure[not(ancestor::procedure)])[last()]"/>
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
            <xsl:number format="1" value="$num"/>
         </xsl:when>
         <xsl:otherwise>?</xsl:otherwise>
      </xsl:choose>
      <xsl:text>) </xsl:text>
   </xsl:template>

<xsl:template match="step[table/@tabstyle='frac']" mode="styler_numbering" priority="1">
      <xsl:text>(</xsl:text>
      <xsl:variable name="node-id" select="generate-id(.)"/>
      <xsl:variable name="from-node" select="(ancestor-or-self::step3[not(ancestor::step3)])[last()]"/>
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
            <xsl:number format="1" value="$num"/>
         </xsl:when>
         <xsl:otherwise>?</xsl:otherwise>
      </xsl:choose>
      <xsl:text>)</xsl:text>
   </xsl:template>

<xsl:template match="numlist/step2" mode="styler_numbering" priority="2">
      <xsl:text>(</xsl:text>
      <xsl:number count="numlist/step2" format="a"/>
      <xsl:text>)</xsl:text>
   </xsl:template>

<xsl:template match="step2[table/@tabstyle='frac']" mode="styler_numbering" priority="1">
      <xsl:text>(</xsl:text>
      <xsl:variable name="node-id" select="generate-id(.)"/>
      <xsl:variable name="from-node" select="(ancestor-or-self::step3[not(ancestor::step3)])[last()]"/>
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
            <xsl:number format="a" value="$num"/>
         </xsl:when>
         <xsl:otherwise>?</xsl:otherwise>
      </xsl:choose>
      <xsl:text>)</xsl:text>
   </xsl:template>

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
            <xsl:number format="a" value="$num"/>
         </xsl:when>
         <xsl:otherwise>?</xsl:otherwise>
      </xsl:choose>
      <xsl:text>)</xsl:text>
   </xsl:template>

<xsl:template match="numlist/step3" mode="styler_numbering" priority="2">
      <xsl:number count="numlist/step3" format="1"/>
   </xsl:template>

<xsl:template match="step3[table/@tabstyle='frac']" mode="styler_numbering" priority="1">
      <xsl:variable name="node-id" select="generate-id(.)"/>
      <xsl:variable name="from-node" select="(ancestor-or-self::step3[not(ancestor::step3)])[last()]"/>
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
            <xsl:number format="1" value="$num"/>
         </xsl:when>
         <xsl:otherwise>?</xsl:otherwise>
      </xsl:choose>
   </xsl:template>

<xsl:template match="step3" mode="styler_numbering" priority="0">
      <xsl:variable name="node-id" select="generate-id(.)"/>
      <xsl:variable name="from-node" select="(ancestor-or-self::step2[not(ancestor::step2)])[last()]"/>
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
            <xsl:number format="1" value="$num"/>
         </xsl:when>
         <xsl:otherwise>?</xsl:otherwise>
      </xsl:choose>
   </xsl:template>

<xsl:template match="numlist/step4" mode="styler_numbering" priority="2">
      <xsl:number count="numlist/step4" format="a"/>
   </xsl:template>

<xsl:template match="step4[table/@tabstyle='frac']" mode="styler_numbering" priority="1">
      <xsl:variable name="node-id" select="generate-id(.)"/>
      <xsl:variable name="from-node" select="(ancestor-or-self::step3[not(ancestor::step3)])[last()]"/>
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
            <xsl:number format="a" value="$num"/>
         </xsl:when>
         <xsl:otherwise>?</xsl:otherwise>
      </xsl:choose>
   </xsl:template>

<xsl:template match="step4" mode="styler_numbering" priority="0">
      <xsl:variable name="node-id" select="generate-id(.)"/>
      <xsl:variable name="from-node" select="(ancestor-or-self::step3[not(ancestor::step3)])[last()]"/>
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
            <xsl:number format="a" value="$num"/>
         </xsl:when>
         <xsl:otherwise>?</xsl:otherwise>
      </xsl:choose>
   </xsl:template>

<xsl:template match="*" mode="styler_numbering">
      <xsl:param name="do-qmark" select="'yes'"/>
      <xsl:if test="$do-qmark='yes'">
         <xsl:value-of select="'?'"/>
      </xsl:if>
   </xsl:template>

</xsl:stylesheet>
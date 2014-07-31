<?xml version="1.0" encoding="UTF-8"?><xsl:stylesheet xmlns:simg="java:net.sf.docbook.saxon.ImageIntrinsics" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:ximg="xaln://com.nwalsh.xalan.ImageIntrinsics" xmlns="http://www.w3.org/1999/xhtml" xmlns:exslt="http://exslt.org/common" xmlns:_acl="java:com.arbortext.epic.Acl" xmlns:msxsl="urn:schemas-microsoft-com:xslt" xmlns:_="http://www.pwc.ca/namespace/doctypes/emipc" xmlns:_dtd="http://www.arbortext.com/namespace/Styler/UserElements" xmlns:atidlm="http://www.arbortext.com/namespace/atidlm" xmlns:_2="http://www.pwc.ca/namespace/doctypes/jmtosmigrate" xmlns:ch="http://www.arbortext.com/namespace/chunker" xmlns:saxon="http://saxon.sf.net/" xmlns:_5="http://www.pwc.ca/namespace/doctypes/ipc" xmlns:_gte="http://www.arbortext.com/namespace/Styler/GeneratedTextElements" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:_sfe="http://www.arbortext.com/namespace/Styler/StylerFormattingElements" xmlns:_js="java:com.arbortext.epic.internal.js.JavaScript" xmlns:_3="http://www.pwc.ca/namespace/doctypes/migrate" xmlns:_ufe="http://www.arbortext.com/namespace/Styler/UserFormattingElements" version="1.0" exclude-result-prefixes="_ atidlm xml _2 ch saxon _5 xsi _js _3 #default exslt msxsl _dtd _ufe _sfe _gte simg ximg _acl">


<xsl:template match="limits/annot" mode="expand-gentext" priority="1">
      <xsl:copy>
         <xsl:apply-templates select="@*|node()" mode="expand-gentext"/>
      </xsl:copy>
   </xsl:template>

<xsl:template match="annot" mode="expand-gentext" priority="0">
      <xsl:copy>
         <xsl:apply-templates select="@*|node()" mode="expand-gentext"/>
      </xsl:copy>
   </xsl:template>

<xsl:template match="at-length" mode="expand-gentext" priority="0">
      <xsl:copy>
         <xsl:apply-templates select="@*|node()" mode="expand-gentext"/>
      </xsl:copy>
   </xsl:template>

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
         <!--Unconditional AddBefore-->
         <xsl:if test="not(@_gte:Gentext-Expanded)">
            <_sfe:BeforeOrAfterText>
               <xsl:text>BS</xsl:text>
            </_sfe:BeforeOrAfterText>
         </xsl:if>
         <xsl:apply-templates select="* | text() | processing-instruction()" mode="expand-gentext"/>
      </xsl:copy>
   </xsl:template>

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
            <xsl:when test="@empty and string(@empty)='YES'">
               <!--AddBefore Condition #1-->
               <xsl:if test="not(@_gte:Gentext-Expanded)">
                  <_sfe:BeforeOrAfterText>
                     <_ufe:consumables-title/>
                     <_ufe:not-applicable/>
                  </_sfe:BeforeOrAfterText>
               </xsl:if>
            </xsl:when>
            <xsl:otherwise>
               <xsl:if test="not(@_gte:Gentext-Expanded)">
                  <_sfe:BeforeOrAfterText>
                     <_ufe:consumables-title/>
                  </_sfe:BeforeOrAfterText>
               </xsl:if>
            </xsl:otherwise>
         </xsl:choose>
         <xsl:apply-templates select="* | text() | processing-instruction()" mode="expand-gentext"/>
      </xsl:copy>
   </xsl:template>

<xsl:template match="fandc-proc" mode="expand-gentext" priority="0">
      <xsl:copy>
         <xsl:apply-templates select="@*|node()" mode="expand-gentext"/>
      </xsl:copy>
   </xsl:template>

<xsl:template match="figure[descendant::graphic]" mode="expand-gentext" priority="1">
      <xsl:copy>
         <xsl:apply-templates mode="expand-gentext" select="@*|node()"/>
      </xsl:copy>
   </xsl:template>

<xsl:template match="figure" mode="expand-gentext" priority="0">
      <xsl:copy>
         <xsl:apply-templates select="@*|node()" mode="expand-gentext"/>
      </xsl:copy>
   </xsl:template>

<xsl:template match="fits" mode="expand-gentext" priority="0">
      <xsl:copy>
         <xsl:apply-templates select="@*|node()" mode="expand-gentext"/>
      </xsl:copy>
   </xsl:template>

<xsl:template match="fits-and-clears" mode="expand-gentext" priority="0">
      <xsl:copy>
         <xsl:apply-templates select="@*|node()" mode="expand-gentext"/>
      </xsl:copy>
   </xsl:template>

<xsl:template match="fix-equip-list" mode="expand-gentext" priority="0">
      <xsl:copy>
         <xsl:apply-templates select="@*|node()" mode="expand-gentext"/>
      </xsl:copy>
   </xsl:template>

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
            <xsl:when test="@empty and string(@empty)='YES'">
               <!--AddBefore Condition #1-->
               <xsl:if test="not(@_gte:Gentext-Expanded)">
                  <_sfe:BeforeOrAfterText>
                     <_ufe:fixequ-title/>
                     <_ufe:not-applicable/>
                  </_sfe:BeforeOrAfterText>
               </xsl:if>
            </xsl:when>
            <xsl:otherwise>
               <xsl:if test="not(@_gte:Gentext-Expanded)">
                  <_sfe:BeforeOrAfterText>
                     <_ufe:fixequ-title/>
                  </_sfe:BeforeOrAfterText>
               </xsl:if>
            </xsl:otherwise>
         </xsl:choose>
         <xsl:apply-templates select="* | text() | processing-instruction()" mode="expand-gentext"/>
      </xsl:copy>
   </xsl:template>

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
         <!--Unconditional AddBefore-->
         <xsl:if test="not(@_gte:Gentext-Expanded)">
            <_sfe:BeforeOrAfterText>
               <_ufe:general-title/>
            </_sfe:BeforeOrAfterText>
         </xsl:if>
         <xsl:apply-templates select="* | text() | processing-instruction()" mode="expand-gentext"/>
      </xsl:copy>
   </xsl:template>

<xsl:template match="graphic" mode="expand-gentext" priority="0">
      <xsl:choose>
         <xsl:when test="not(@size) or (@size and string(@size)!='big')">
            <!--AddBefore Condition #2-->
            <xsl:if test="not(@_gte:Gentext-Expanded)">
               <_sfe:BeforeOrAfterText/>
            </xsl:if>
         </xsl:when>
         <xsl:otherwise>
            <xsl:if test="not(@_gte:Gentext-Expanded)">
               <_sfe:BeforeOrAfterText>
                  <_ufe:block-prespace>
                     <xsl:text>(SHEET X OF Y)</xsl:text>
                  </_ufe:block-prespace>
               </_sfe:BeforeOrAfterText>
            </xsl:if>
         </xsl:otherwise>
      </xsl:choose>
      <xsl:copy>
         <xsl:attribute name="_gte:Gentext-Expanded">y</xsl:attribute>
         <xsl:apply-templates mode="expand-gentext" select="@*"/>
         <xsl:if test="not(@_gte:id)">
            <xsl:attribute name="_gte:id">
               <xsl:value-of select="'_g_'"/>
               <xsl:value-of select="generate-id(.)"/>
            </xsl:attribute>
         </xsl:if>
         <xsl:apply-templates mode="expand-gentext" select="* | text() | processing-instruction()"/>
      </xsl:copy>
   </xsl:template>

<xsl:template match="ifr" mode="expand-gentext" priority="0">
      <xsl:copy>
         <xsl:apply-templates select="@*|node()" mode="expand-gentext"/>
      </xsl:copy>
   </xsl:template>

<xsl:template match="imp" mode="expand-gentext" priority="0">
      <xsl:copy>
         <xsl:apply-templates select="@*|node()" mode="expand-gentext"/>
      </xsl:copy>
   </xsl:template>

<xsl:template match="atidlm:inclusion" mode="expand-gentext" priority="0">
      <xsl:copy>
         <xsl:apply-templates select="@*|node()" mode="expand-gentext"/>
      </xsl:copy>
   </xsl:template>

<xsl:template match="limits" mode="expand-gentext" priority="0">
      <xsl:copy>
         <xsl:apply-templates select="@*|node()" mode="expand-gentext"/>
      </xsl:copy>
   </xsl:template>

<xsl:template match="atidlm:linkcontent" mode="expand-gentext" priority="0">
      <xsl:copy>
         <xsl:apply-templates select="@*|node()" mode="expand-gentext"/>
      </xsl:copy>
   </xsl:template>

<xsl:template match="mating-part" mode="expand-gentext" priority="0">
      <xsl:copy>
         <xsl:apply-templates select="@*|node()" mode="expand-gentext"/>
      </xsl:copy>
   </xsl:template>

<xsl:template match="max" mode="expand-gentext" priority="0">
      <xsl:copy>
         <xsl:apply-templates select="@*|node()" mode="expand-gentext"/>
      </xsl:copy>
   </xsl:template>

<xsl:template match="met" mode="expand-gentext" priority="0">
      <xsl:copy>
         <xsl:apply-templates select="@*|node()" mode="expand-gentext"/>
      </xsl:copy>
   </xsl:template>

<xsl:template match="atidlm:metadata" mode="expand-gentext" priority="0">
      <xsl:copy>
         <xsl:apply-templates select="@*|node()" mode="expand-gentext"/>
      </xsl:copy>
   </xsl:template>

<xsl:template match="min" mode="expand-gentext" priority="0">
      <xsl:copy>
         <xsl:apply-templates select="@*|node()" mode="expand-gentext"/>
      </xsl:copy>
   </xsl:template>

<xsl:template match="mm-fits" mode="expand-gentext" priority="0">
      <xsl:copy>
         <xsl:apply-templates select="@*|node()" mode="expand-gentext"/>
      </xsl:copy>
   </xsl:template>

<xsl:template match="name" mode="expand-gentext" priority="0">
      <xsl:copy>
         <xsl:apply-templates select="@*|node()" mode="expand-gentext"/>
      </xsl:copy>
   </xsl:template>

<xsl:template match="nomen" mode="expand-gentext" priority="0">
      <xsl:copy>
         <xsl:apply-templates select="@*|node()" mode="expand-gentext"/>
      </xsl:copy>
   </xsl:template>

<xsl:template match="module/note" mode="expand-gentext" priority="11">
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
               <span style="font-weight: bold; text-decoration: underline; ">
                  <xsl:text>NOTE</xsl:text>
               </span>
               <xsl:text>: </xsl:text>
            </_sfe:BeforeOrAfterText>
         </xsl:if>
         <xsl:apply-templates select="* | text() | processing-instruction()" mode="expand-gentext"/>
      </xsl:copy>
   </xsl:template>

<xsl:template match="subtask/note" mode="expand-gentext" priority="10">
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
               <span style="font-weight: bold; text-decoration: underline; ">
                  <xsl:text>NOTE</xsl:text>
               </span>
               <xsl:text>: </xsl:text>
            </_sfe:BeforeOrAfterText>
         </xsl:if>
         <xsl:apply-templates select="* | text() | processing-instruction()" mode="expand-gentext"/>
      </xsl:copy>
   </xsl:template>

<xsl:template match="task/note" mode="expand-gentext" priority="9">
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
               <span style="font-weight: bold; text-decoration: underline; ">
                  <xsl:text>NOTE</xsl:text>
               </span>
               <xsl:text>: </xsl:text>
            </_sfe:BeforeOrAfterText>
         </xsl:if>
         <xsl:apply-templates select="* | text() | processing-instruction()" mode="expand-gentext"/>
      </xsl:copy>
   </xsl:template>

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
            <xsl:when test="@nbr">
               <!--AddBefore Condition #1-->
               <xsl:if test="not(@_gte:Gentext-Expanded)">
                  <_sfe:BeforeOrAfterText>
                     <span style="font-weight: bold; text-decoration: underline; ">
                        <xsl:text>NOTE</xsl:text>
                     </span>
                     <xsl:text>: </xsl:text>
                     <xsl:value-of select="@nbr"/>
                     <xsl:text>. </xsl:text>
                  </_sfe:BeforeOrAfterText>
               </xsl:if>
            </xsl:when>
            <xsl:otherwise>
               <xsl:if test="not(@_gte:Gentext-Expanded)">
                  <_sfe:BeforeOrAfterText>
                     <span style="font-weight: bold; text-decoration: underline; ">
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
            <xsl:when test="@nbr">
               <!--AddBefore Condition #1-->
               <xsl:if test="not(@_gte:Gentext-Expanded)">
                  <_sfe:BeforeOrAfterText>
                     <span style="font-weight: bold; text-decoration: underline; ">
                        <xsl:text>NOTE</xsl:text>
                     </span>
                     <xsl:text>: </xsl:text>
                     <xsl:value-of select="@nbr"/>
                     <xsl:text>. </xsl:text>
                  </_sfe:BeforeOrAfterText>
               </xsl:if>
            </xsl:when>
            <xsl:otherwise>
               <xsl:if test="not(@_gte:Gentext-Expanded)">
                  <_sfe:BeforeOrAfterText>
                     <span style="font-weight: bold; text-decoration: underline; ">
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

<xsl:template match="fandc/note" mode="expand-gentext" priority="6">
      <xsl:copy>
         <xsl:apply-templates select="@*|node()" mode="expand-gentext"/>
      </xsl:copy>
   </xsl:template>

<xsl:template match="spec-assem/note" mode="expand-gentext" priority="5">
      <xsl:copy>
         <xsl:apply-templates select="@*|node()" mode="expand-gentext"/>
      </xsl:copy>
   </xsl:template>

<xsl:template match="spring-pressure/note" mode="expand-gentext" priority="4">
      <xsl:copy>
         <xsl:apply-templates select="@*|node()" mode="expand-gentext"/>
      </xsl:copy>
   </xsl:template>

<xsl:template match="torque-and-stretch/note" mode="expand-gentext" priority="3">
      <xsl:copy>
         <xsl:apply-templates select="@*|node()" mode="expand-gentext"/>
      </xsl:copy>
   </xsl:template>

<xsl:template match="fits-and-clears/note" mode="expand-gentext" priority="2">
      <xsl:copy>
         <xsl:apply-templates select="@*|node()" mode="expand-gentext"/>
      </xsl:copy>
   </xsl:template>

<xsl:template match="note[ancestor::subpara]" mode="expand-gentext" priority="1">
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
            <xsl:when test="@nbr">
               <!--AddBefore Condition #1-->
               <xsl:if test="not(@_gte:Gentext-Expanded)">
                  <_sfe:BeforeOrAfterText>
                     <span style="font-weight: bold; text-decoration: underline; ">
                        <xsl:text>NOTE</xsl:text>
                     </span>
                     <xsl:text>: </xsl:text>
                     <xsl:value-of select="@nbr"/>
                     <xsl:text>. </xsl:text>
                  </_sfe:BeforeOrAfterText>
               </xsl:if>
            </xsl:when>
            <xsl:otherwise>
               <xsl:if test="not(@_gte:Gentext-Expanded)">
                  <_sfe:BeforeOrAfterText>
                     <span style="font-weight: bold; text-decoration: underline; ">
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
            <xsl:when test="@nbr">
               <!--AddBefore Condition #1-->
               <xsl:if test="not(@_gte:Gentext-Expanded)">
                  <_sfe:BeforeOrAfterText>
                     <span style="font-weight: bold; text-decoration: underline; ">
                        <xsl:text>NOTE</xsl:text>
                     </span>
                     <xsl:text>: </xsl:text>
                     <xsl:value-of select="@nbr"/>
                     <xsl:text>. </xsl:text>
                  </_sfe:BeforeOrAfterText>
               </xsl:if>
            </xsl:when>
            <xsl:otherwise>
               <xsl:if test="not(@_gte:Gentext-Expanded)">
                  <_sfe:BeforeOrAfterText>
                     <span style="font-weight: bold; text-decoration: underline; ">
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

<xsl:template match="pageblock-front" mode="expand-gentext" priority="0">
      <xsl:copy>
         <xsl:apply-templates select="@*|node()" mode="expand-gentext"/>
      </xsl:copy>
   </xsl:template>

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
         <!--Unconditional AddBefore-->
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
            </_sfe:BeforeOrAfterText>
         </xsl:if>
         <xsl:apply-templates select="* | text() | processing-instruction()" mode="expand-gentext"/>
      </xsl:copy>
   </xsl:template>

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
         <!--Unconditional AddBefore-->
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
            </_sfe:BeforeOrAfterText>
         </xsl:if>
         <xsl:apply-templates select="* | text() | processing-instruction()" mode="expand-gentext"/>
      </xsl:copy>
   </xsl:template>

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

<xsl:template match="part" mode="expand-gentext" priority="0">
      <xsl:copy>
         <xsl:apply-templates select="@*|node()" mode="expand-gentext"/>
      </xsl:copy>
   </xsl:template>

<xsl:template match="q-and-st" mode="expand-gentext" priority="0">
      <xsl:copy>
         <xsl:apply-templates select="@*|node()" mode="expand-gentext"/>
      </xsl:copy>
   </xsl:template>

<xsl:template match="ref-nbr" mode="expand-gentext" priority="0">
      <xsl:copy>
         <xsl:apply-templates select="@*|node()" mode="expand-gentext"/>
      </xsl:copy>
   </xsl:template>

<xsl:template match="refint[name(id(@refid))='table' and (id(@refid)/ancestor::figure or id(@refid)/ancestor::graphic)]" mode="expand-gentext" priority="4">
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
            <_sfe:BeforeOrAfterText/>
         </xsl:if>
         <xsl:apply-templates select="* | text() | processing-instruction()" mode="expand-gentext"/>
         <!--Unconditional AddAfter-->
         <xsl:if test="not(@_gte:Gentext-Expanded)">
            <_sfe:BeforeOrAfterText>
               <_sfe:CrossReference>
                  <xsl:variable name="division-name-token-list"> alpha-list ata-page-block book
                     bullist chapsect-list chapter consumables enumlist figure fits-and-clears
                     fixtures-and-equipment frontmatter general highlights intro list lof lof-item
                     lot lot-item mm-fits module n-para num-index num-list page-block procedure
                     sblist section spec-tool-table special-tools subject subpara table title-page
                     torque-and-stretch unlist </xsl:variable>
                  <xsl:variable name="refed-id" select="@refid"/>
                  <xsl:variable name="idrefed-element-name" select="concat(' ',name((//*[@_gte:id=$refed-id])[1]),' ')"/>
                  <_gte:Link linkRef="{@refid}">
                     <xsl:choose>
                        <xsl:when test="contains($division-name-token-list,$idrefed-element-name)">
                           <_gte:deferredCrossReference xrefStyle="Number" refed-id="{@refid}"/>
                        </xsl:when>
                        <xsl:otherwise>
                           <xsl:apply-templates select="(//*[@_gte:id=$refed-id])[1]" mode="styler_xref-Number"/>
                        </xsl:otherwise>
                     </xsl:choose>
                  </_gte:Link>
               </_sfe:CrossReference>
               <xsl:value-of select="@post-auto-text"/>
            </_sfe:BeforeOrAfterText>
         </xsl:if>
      </xsl:copy>
   </xsl:template>

<xsl:template match="refint[id(@refid)/self::table]" mode="expand-gentext" priority="3">
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
         <!--Unconditional AddAfter-->
         <xsl:if test="not(@_gte:Gentext-Expanded)">
            <_sfe:BeforeOrAfterText>
               <_sfe:CrossReference>
                  <xsl:variable name="division-name-token-list"> alpha-list ata-page-block book
                     bullist chapsect-list chapter consumables enumlist figure fits-and-clears
                     fixtures-and-equipment frontmatter general highlights intro list lof lof-item
                     lot lot-item mm-fits module n-para num-index num-list page-block procedure
                     sblist section spec-tool-table special-tools subject subpara table title-page
                     torque-and-stretch unlist </xsl:variable>
                  <xsl:variable name="refed-id" select="@refid"/>
                  <xsl:variable name="idrefed-element-name" select="concat(' ',name((//*[@_gte:id=$refed-id])[1]),' ')"/>
                  <_gte:Link linkRef="{@refid}">
                     <xsl:choose>
                        <xsl:when test="contains($division-name-token-list,$idrefed-element-name)">
                           <_gte:deferredCrossReference xrefStyle="Number" refed-id="{@refid}"/>
                        </xsl:when>
                        <xsl:otherwise>
                           <xsl:apply-templates select="(//*[@_gte:id=$refed-id])[1]" mode="styler_xref-Number"/>
                        </xsl:otherwise>
                     </xsl:choose>
                  </_gte:Link>
               </_sfe:CrossReference>
               <xsl:value-of select="@post-auto-text"/>
            </_sfe:BeforeOrAfterText>
         </xsl:if>
      </xsl:copy>
   </xsl:template>

<xsl:template match="remarks" mode="expand-gentext" priority="0">
      <xsl:copy>
         <xsl:apply-templates select="@*|node()" mode="expand-gentext"/>
      </xsl:copy>
   </xsl:template>

<xsl:template match="repl" mode="expand-gentext" priority="0">
      <xsl:copy>
         <xsl:apply-templates select="@*|node()" mode="expand-gentext"/>
      </xsl:copy>
   </xsl:template>

<xsl:template match="atidlm:resourcepair" mode="expand-gentext" priority="0">
      <xsl:copy>
         <xsl:apply-templates select="@*|node()" mode="expand-gentext"/>
      </xsl:copy>
   </xsl:template>

<xsl:template match="title-page/soa[@size='med']" mode="expand-gentext" priority="2">
      <xsl:copy>
         <xsl:apply-templates select="@*|node()" mode="expand-gentext"/>
      </xsl:copy>
   </xsl:template>

<xsl:template match="soa[@size='med']" mode="expand-gentext" priority="1">
      <xsl:copy>
         <xsl:apply-templates select="@*|node()" mode="expand-gentext"/>
      </xsl:copy>
   </xsl:template>

<xsl:template match="soa" mode="expand-gentext" priority="0">
      <xsl:copy>
         <xsl:apply-templates select="@*|node()" mode="expand-gentext"/>
      </xsl:copy>
   </xsl:template>

<xsl:template match="atidlm:source" mode="expand-gentext" priority="0">
      <xsl:copy>
         <xsl:apply-templates select="@*|node()" mode="expand-gentext"/>
      </xsl:copy>
   </xsl:template>

<xsl:template match="spec-assem" mode="expand-gentext" priority="0">
      <xsl:copy>
         <xsl:apply-templates select="@*|node()" mode="expand-gentext"/>
      </xsl:copy>
   </xsl:template>

<xsl:template match="spec-tool" mode="expand-gentext" priority="0">
      <xsl:copy>
         <xsl:apply-templates select="@*|node()" mode="expand-gentext"/>
      </xsl:copy>
   </xsl:template>

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
            <xsl:when test="@empty and string(@empty)='YES'">
               <!--AddBefore Condition #1-->
               <xsl:if test="not(@_gte:Gentext-Expanded)">
                  <_sfe:BeforeOrAfterText>
                     <_ufe:spectools-title/>
                     <_ufe:not-applicable/>
                  </_sfe:BeforeOrAfterText>
               </xsl:if>
            </xsl:when>
            <xsl:otherwise>
               <xsl:if test="not(@_gte:Gentext-Expanded)">
                  <_sfe:BeforeOrAfterText>
                     <_ufe:spectools-title/>
                  </_sfe:BeforeOrAfterText>
               </xsl:if>
            </xsl:otherwise>
         </xsl:choose>
         <xsl:apply-templates select="* | text() | processing-instruction()" mode="expand-gentext"/>
      </xsl:copy>
   </xsl:template>

<xsl:template match="spring" mode="expand-gentext" priority="0">
      <xsl:copy>
         <xsl:apply-templates select="@*|node()" mode="expand-gentext"/>
      </xsl:copy>
   </xsl:template>

<xsl:template match="spring-pressure" mode="expand-gentext" priority="0">
      <xsl:copy>
         <xsl:apply-templates select="@*|node()" mode="expand-gentext"/>
      </xsl:copy>
   </xsl:template>

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
         <!--Unconditional AddBefore-->
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
            </_sfe:BeforeOrAfterText>
         </xsl:if>
         <xsl:apply-templates select="* | text() | processing-instruction()" mode="expand-gentext"/>
      </xsl:copy>
   </xsl:template>

<xsl:template match="procedure//step" mode="expand-gentext" priority="2">
      <xsl:copy>
         <xsl:attribute name="_gte:Gentext-Expanded">y</xsl:attribute>
         <xsl:apply-templates mode="expand-gentext" select="@*"> </xsl:apply-templates>
         <xsl:if test="not(@_gte:id)">
            <xsl:attribute name="_gte:id">
               <xsl:value-of select="'_g_'"/>
               <xsl:value-of select="generate-id(.)"/>
            </xsl:attribute>
         </xsl:if>
         <!--Unconditional AddBefore-->
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
               <xsl:text> </xsl:text>
            </_sfe:BeforeOrAfterText>
         </xsl:if>
         <xsl:apply-templates mode="expand-gentext" select="* | text() | processing-instruction()"/>
      </xsl:copy>
   </xsl:template>

<xsl:template match="step[table/@tabstyle='frac']" mode="expand-gentext" priority="1">
      <xsl:copy>
         <xsl:attribute name="_gte:Gentext-Expanded">y</xsl:attribute>
         <xsl:apply-templates mode="expand-gentext" select="@*"/>
         <xsl:if test="not(@_gte:id)">
            <xsl:attribute name="_gte:id">
               <xsl:value-of select="'_g_'"/>
               <xsl:value-of select="generate-id(.)"/>
            </xsl:attribute>
         </xsl:if>
         <!--Unconditional AddBefore-->
         <xsl:if test="not(@_gte:Gentext-Expanded)">
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
         <xsl:apply-templates mode="expand-gentext" select="* | text() | processing-instruction()"/>
      </xsl:copy>
   </xsl:template>

<xsl:template match="step" mode="expand-gentext" priority="0">
      <xsl:copy>
         <xsl:apply-templates select="@*|node()" mode="expand-gentext"/>
      </xsl:copy>
   </xsl:template>

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
         <!--Unconditional AddBefore-->
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
            </_sfe:BeforeOrAfterText>
         </xsl:if>
         <xsl:apply-templates select="* | text() | processing-instruction()" mode="expand-gentext"/>
      </xsl:copy>
   </xsl:template>

<xsl:template match="step2[table/@tabstyle='frac']" mode="expand-gentext" priority="1">
      <xsl:copy>
         <xsl:attribute name="_gte:Gentext-Expanded">y</xsl:attribute>
         <xsl:apply-templates mode="expand-gentext" select="@*"/>
         <xsl:if test="not(@_gte:id)">
            <xsl:attribute name="_gte:id">
               <xsl:value-of select="'_g_'"/>
               <xsl:value-of select="generate-id(.)"/>
            </xsl:attribute>
         </xsl:if>
         <!--Unconditional AddBefore-->
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
         <xsl:apply-templates mode="expand-gentext" select="* | text() | processing-instruction()"/>
      </xsl:copy>
   </xsl:template>

<xsl:template match="step2" mode="expand-gentext" priority="0">
      <xsl:copy>
         <xsl:attribute name="_gte:Gentext-Expanded">y</xsl:attribute>
         <xsl:apply-templates mode="expand-gentext" select="@*"/>
         <xsl:if test="not(@_gte:id)">
            <xsl:attribute name="_gte:id">
               <xsl:value-of select="'_g_'"/>
               <xsl:value-of select="generate-id(.)"/>
            </xsl:attribute>
         </xsl:if>
         <!--Unconditional AddBefore-->
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
         <xsl:apply-templates mode="expand-gentext" select="* | text() | processing-instruction()"/>
      </xsl:copy>
   </xsl:template>

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
         <!--Unconditional AddBefore-->
         <xsl:if test="not(@_gte:Gentext-Expanded)">
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
            </_sfe:BeforeOrAfterText>
         </xsl:if>
         <xsl:apply-templates select="* | text() | processing-instruction()" mode="expand-gentext"/>
      </xsl:copy>
   </xsl:template>

<xsl:template match="step3[table/@tabstyle='frac']" mode="expand-gentext" priority="1">
      <xsl:copy>
         <xsl:attribute name="_gte:Gentext-Expanded">y</xsl:attribute>
         <xsl:apply-templates mode="expand-gentext" select="@*"/>
         <xsl:if test="not(@_gte:id)">
            <xsl:attribute name="_gte:id">
               <xsl:value-of select="'_g_'"/>
               <xsl:value-of select="generate-id(.)"/>
            </xsl:attribute>
         </xsl:if>
         <!--Unconditional AddBefore-->
         <xsl:if test="not(@_gte:Gentext-Expanded)">
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
         <xsl:apply-templates mode="expand-gentext" select="* | text() | processing-instruction()"/>
      </xsl:copy>
   </xsl:template>

<xsl:template match="step3" mode="expand-gentext" priority="0">
      <xsl:copy>
         <xsl:attribute name="_gte:Gentext-Expanded">y</xsl:attribute>
         <xsl:apply-templates mode="expand-gentext" select="@*"/>
         <xsl:if test="not(@_gte:id)">
            <xsl:attribute name="_gte:id">
               <xsl:value-of select="'_g_'"/>
               <xsl:value-of select="generate-id(.)"/>
            </xsl:attribute>
         </xsl:if>
         <!--Unconditional AddBefore-->
         <xsl:if test="not(@_gte:Gentext-Expanded)">
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
         <xsl:apply-templates mode="expand-gentext" select="* | text() | processing-instruction()"/>
      </xsl:copy>
   </xsl:template>

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
         <!--Unconditional AddBefore-->
         <xsl:if test="not(@_gte:Gentext-Expanded)">
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
            </_sfe:BeforeOrAfterText>
         </xsl:if>
         <xsl:apply-templates select="* | text() | processing-instruction()" mode="expand-gentext"/>
      </xsl:copy>
   </xsl:template>

<xsl:template match="step4[table/@tabstyle='frac']" mode="expand-gentext" priority="1">
      <xsl:copy>
         <xsl:attribute name="_gte:Gentext-Expanded">y</xsl:attribute>
         <xsl:apply-templates mode="expand-gentext" select="@*"/>
         <xsl:if test="not(@_gte:id)">
            <xsl:attribute name="_gte:id">
               <xsl:value-of select="'_g_'"/>
               <xsl:value-of select="generate-id(.)"/>
            </xsl:attribute>
         </xsl:if>
         <!--Unconditional AddBefore-->
         <xsl:if test="not(@_gte:Gentext-Expanded)">
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
         <xsl:apply-templates mode="expand-gentext" select="* | text() | processing-instruction()"/>
      </xsl:copy>
   </xsl:template>

<xsl:template match="step4" mode="expand-gentext" priority="0">
      <xsl:copy>
         <xsl:attribute name="_gte:Gentext-Expanded">y</xsl:attribute>
         <xsl:apply-templates mode="expand-gentext" select="@*"/>
         <xsl:if test="not(@_gte:id)">
            <xsl:attribute name="_gte:id">
               <xsl:value-of select="'_g_'"/>
               <xsl:value-of select="generate-id(.)"/>
            </xsl:attribute>
         </xsl:if>
         <!--Unconditional AddBefore-->
         <xsl:if test="not(@_gte:Gentext-Expanded)">
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
         <xsl:apply-templates mode="expand-gentext" select="* | text() | processing-instruction()"/>
      </xsl:copy>
   </xsl:template>

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
         <!--Unconditional AddBefore-->
         <xsl:if test="not(@_gte:Gentext-Expanded)">
            <_sfe:BeforeOrAfterText/>
         </xsl:if>
         <xsl:apply-templates select="* | text() | processing-instruction()" mode="expand-gentext"/>
      </xsl:copy>
   </xsl:template>

<xsl:template match="step5[table/@tabstyle='frac']" mode="expand-gentext" priority="1">
      <xsl:copy>
         <xsl:attribute name="_gte:Gentext-Expanded">y</xsl:attribute>
         <xsl:apply-templates mode="expand-gentext" select="@*"/>
         <xsl:if test="not(@_gte:id)">
            <xsl:attribute name="_gte:id">
               <xsl:value-of select="'_g_'"/>
               <xsl:value-of select="generate-id(.)"/>
            </xsl:attribute>
         </xsl:if>
         <!--Unconditional AddBefore-->
         <xsl:if test="not(@_gte:Gentext-Expanded)">
            <_sfe:BeforeOrAfterText/>
         </xsl:if>
         <xsl:apply-templates mode="expand-gentext" select="* | text() | processing-instruction()"/>
      </xsl:copy>
   </xsl:template>

<xsl:template match="step5" mode="expand-gentext" priority="0">
      <xsl:copy>
         <xsl:apply-templates mode="expand-gentext" select="@*|node()"/>
      </xsl:copy>
   </xsl:template>

<xsl:template match="atidlm:target" mode="expand-gentext" priority="0">
      <xsl:copy>
         <xsl:apply-templates select="@*|node()" mode="expand-gentext"/>
      </xsl:copy>
   </xsl:template>

<xsl:template match="module[@module-name='Airworthiness_Limits']/pgblk/title" mode="expand-gentext" priority="65">
      <xsl:copy>
         <xsl:attribute name="_gte:unhidden-title">yes</xsl:attribute>
         <xsl:apply-templates select="@*|node()" mode="expand-gentext"/>
      </xsl:copy>
   </xsl:template>

<xsl:template match="page-block[@pb-name='ni']//mfmatr/title" mode="expand-gentext" priority="56">
      <xsl:copy>
         <xsl:attribute name="_gte:unhidden-title">yes</xsl:attribute>
         <xsl:apply-templates select="@*|node()" mode="expand-gentext"/>
      </xsl:copy>
   </xsl:template>

<xsl:template match="page-block[@pb-name='record-of-revisions']//n-para/title" mode="expand-gentext" priority="55">
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

<xsl:template match="pbfmatr/title" mode="expand-gentext" priority="40">
      <xsl:copy>
         <xsl:attribute name="_gte:Gentext-Expanded">y</xsl:attribute>
         <xsl:apply-templates select="@*" mode="expand-gentext"/>
         <xsl:if test="not(@_gte:id)">
            <xsl:attribute name="_gte:id">
               <xsl:value-of select="'_g_'"/>
               <xsl:value-of select="generate-id(.)"/>
            </xsl:attribute>
         </xsl:if>
         <xsl:variable name="gentext-inserts-current-title">
            <xsl:choose>
               <xsl:when test="((ancestor-or-self::pwcpbfront[1]/title)) and ((ancestor-or-self::pwcpbfront[1]/pbfmatr))">false</xsl:when>
               <xsl:otherwise>true</xsl:otherwise>
            </xsl:choose>
         </xsl:variable>
         <xsl:attribute name="_gte:unhidden-title">
            <xsl:choose>
               <xsl:when test="$gentext-inserts-current-title='true'">yes</xsl:when>
               <xsl:otherwise>no</xsl:otherwise>
            </xsl:choose>
         </xsl:attribute>
         <xsl:choose>
            <xsl:when test="((ancestor-or-self::pwcpbfront[1]/title)) and ((ancestor-or-self::pwcpbfront[1]/pbfmatr))">
               <!--AddBefore Condition #1-->
               <xsl:if test="not(@_gte:Gentext-Expanded)">
                  <_sfe:BeforeOrAfterText/>
               </xsl:if>
            </xsl:when>
            <xsl:otherwise>
               <xsl:if test="not(@_gte:Gentext-Expanded)">
                  <_sfe:BeforeOrAfterText>
                     <_ufe:task-title>
                        <span style="text-decoration: underline; ">
                           <xsl:if test="node()[not(self::_sfe:BeforeOrAfterText)]">
                              <_gte:Gentexted-Content-Wrapper>
                                 <xsl:apply-templates mode="expand-gentext">
                                    <xsl:with-param name="skip-expanded-gentext" select="'yes'"/>
                                 </xsl:apply-templates>
                              </_gte:Gentexted-Content-Wrapper>
                           </xsl:if>
                        </span>
                     </_ufe:task-title>
                  </_sfe:BeforeOrAfterText>
               </xsl:if>
            </xsl:otherwise>
         </xsl:choose>
         <xsl:apply-templates select="* | text() | processing-instruction()" mode="expand-gentext"/>
      </xsl:copy>
   </xsl:template>

<xsl:template match="pwcpbfront/title" mode="expand-gentext" priority="39">
      <xsl:copy>
         <xsl:attribute name="_gte:unhidden-title">yes</xsl:attribute>
         <xsl:apply-templates select="@*|node()" mode="expand-gentext"/>
      </xsl:copy>
   </xsl:template>

<xsl:template match="intro/title" mode="expand-gentext" priority="36">
      <xsl:copy>
         <xsl:attribute name="_gte:unhidden-title">no</xsl:attribute>
         <xsl:apply-templates select="@*|node()" mode="expand-gentext"/>
      </xsl:copy>
   </xsl:template>

<xsl:template match="pwcspblist/title" mode="expand-gentext" priority="35">
      <xsl:copy>
         <xsl:attribute name="_gte:unhidden-title">yes</xsl:attribute>
         <xsl:apply-templates select="@*|node()" mode="expand-gentext"/>
      </xsl:copy>
   </xsl:template>

<xsl:template match="sblist/title" mode="expand-gentext" priority="32">
      <xsl:copy>
         <xsl:attribute name="_gte:unhidden-title">yes</xsl:attribute>
         <xsl:apply-templates select="@*|node()" mode="expand-gentext"/>
      </xsl:copy>
   </xsl:template>

<xsl:template match="pwcni/title" mode="expand-gentext" priority="31">
      <xsl:copy>
         <xsl:attribute name="_gte:unhidden-title">yes</xsl:attribute>
         <xsl:apply-templates select="@*|node()" mode="expand-gentext"/>
      </xsl:copy>
   </xsl:template>

<xsl:template match="vendlist/title" mode="expand-gentext" priority="30">
      <xsl:copy>
         <xsl:attribute name="_gte:unhidden-title">yes</xsl:attribute>
         <xsl:apply-templates select="@*|node()" mode="expand-gentext"/>
      </xsl:copy>
   </xsl:template>

<xsl:template match="lof-item/title" mode="expand-gentext" priority="21">
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

<xsl:template match="lof/title" mode="expand-gentext" priority="18">
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

<xsl:template match="spb-list/title" mode="expand-gentext" priority="14">
      <xsl:copy>
         <xsl:attribute name="_gte:unhidden-title">yes</xsl:attribute>
         <xsl:apply-templates select="@*|node()" mode="expand-gentext"/>
      </xsl:copy>
   </xsl:template>

<xsl:template match="service-bull-list/title" mode="expand-gentext" priority="10">
      <xsl:copy>
         <xsl:attribute name="_gte:unhidden-title">yes</xsl:attribute>
         <xsl:apply-templates select="@*|node()" mode="expand-gentext"/>
      </xsl:copy>
   </xsl:template>

<xsl:template match="module/title" mode="expand-gentext" priority="9">
      <xsl:copy>
         <xsl:attribute name="_gte:unhidden-title">yes</xsl:attribute>
         <xsl:apply-templates select="@*|node()" mode="expand-gentext"/>
      </xsl:copy>
   </xsl:template>

<xsl:template match="num-index/title" mode="expand-gentext" priority="7">
      <xsl:copy>
         <xsl:attribute name="_gte:unhidden-title">yes</xsl:attribute>
         <xsl:apply-templates select="@*|node()" mode="expand-gentext"/>
      </xsl:copy>
   </xsl:template>

<xsl:template match="tool-list" mode="expand-gentext" priority="0">
      <xsl:copy>
         <xsl:apply-templates select="@*|node()" mode="expand-gentext"/>
      </xsl:copy>
   </xsl:template>

<xsl:template match="torque-and-stretch" mode="expand-gentext" priority="0">
      <xsl:copy>
         <xsl:apply-templates select="@*|node()" mode="expand-gentext"/>
      </xsl:copy>
   </xsl:template>

<xsl:template match="trdata" mode="expand-gentext" priority="0">
      <xsl:copy>
         <xsl:apply-templates select="@*|node()" mode="expand-gentext"/>
      </xsl:copy>
   </xsl:template>

<xsl:template match="trlist" mode="expand-gentext" priority="0">
      <xsl:copy>
         <xsl:apply-templates select="@*|node()" mode="expand-gentext"/>
      </xsl:copy>
   </xsl:template>

<xsl:template match="trloc" mode="expand-gentext" priority="0">
      <xsl:copy>
         <xsl:apply-templates select="@*|node()" mode="expand-gentext"/>
      </xsl:copy>
   </xsl:template>

<xsl:template match="trnbr" mode="expand-gentext" priority="0">
      <xsl:copy>
         <xsl:apply-templates select="@*|node()" mode="expand-gentext"/>
      </xsl:copy>
   </xsl:template>

<xsl:template match="trstatus" mode="expand-gentext" priority="0">
      <xsl:copy>
         <xsl:apply-templates select="@*|node()" mode="expand-gentext"/>
      </xsl:copy>
   </xsl:template>

<xsl:template match="table/title/xref[id(@ref)/self::figure]" mode="expand-gentext" priority="7">
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
               <_sfe:CrossReference>
                  <xsl:variable name="division-name-token-list"> alpha-list ata-page-block book
                     bullist chapsect-list chapter consumables enumlist figure fits-and-clears
                     fixtures-and-equipment frontmatter general highlights intro list lof lof-item
                     lot lot-item mm-fits module n-para num-index num-list page-block procedure
                     sblist section spec-tool-table special-tools subject subpara table title-page
                     torque-and-stretch unlist </xsl:variable>
                  <xsl:variable name="refed-id" select="@ref"/>
                  <xsl:variable name="idrefed-element-name" select="concat(' ',name((//*[@_gte:id=$refed-id])[1]),' ')"/>
                  <_gte:Link linkRef="{@ref}">
                     <xsl:choose>
                        <xsl:when test="contains($division-name-token-list,$idrefed-element-name)">
                           <_gte:deferredCrossReference xrefStyle="Number" refed-id="{@ref}"/>
                        </xsl:when>
                        <xsl:otherwise>
                           <xsl:apply-templates select="(//*[@_gte:id=$refed-id])[1]" mode="styler_xref-Number"/>
                        </xsl:otherwise>
                     </xsl:choose>
                  </_gte:Link>
               </_sfe:CrossReference>
            </_sfe:BeforeOrAfterText>
         </xsl:if>
         <xsl:apply-templates select="* | text() | processing-instruction()" mode="expand-gentext"/>
      </xsl:copy>
   </xsl:template>

<xsl:template match="xref[name(id(@ref))='table' and (id(@ref)/ancestor::figure or id(@ref)/ancestor::graphic)]" mode="expand-gentext" priority="3">
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
               <_sfe:CrossReference>
                  <xsl:variable name="division-name-token-list"> alpha-list ata-page-block book
                     bullist chapsect-list chapter consumables enumlist figure fits-and-clears
                     fixtures-and-equipment frontmatter general highlights intro list lof lof-item
                     lot lot-item mm-fits module n-para num-index num-list page-block procedure
                     sblist section spec-tool-table special-tools subject subpara table title-page
                     torque-and-stretch unlist </xsl:variable>
                  <xsl:variable name="refed-id" select="@ref"/>
                  <xsl:variable name="idrefed-element-name" select="concat(' ',name((//*[@_gte:id=$refed-id])[1]),' ')"/>
                  <_gte:Link linkRef="{@ref}">
                     <xsl:choose>
                        <xsl:when test="contains($division-name-token-list,$idrefed-element-name)">
                           <_gte:deferredCrossReference xrefStyle="Number" refed-id="{@ref}"/>
                        </xsl:when>
                        <xsl:otherwise>
                           <xsl:apply-templates select="(//*[@_gte:id=$refed-id])[1]" mode="styler_xref-Number"/>
                        </xsl:otherwise>
                     </xsl:choose>
                  </_gte:Link>
               </_sfe:CrossReference>
               <xsl:text> </xsl:text>
            </_sfe:BeforeOrAfterText>
         </xsl:if>
         <xsl:apply-templates select="* | text() | processing-instruction()" mode="expand-gentext"/>
      </xsl:copy>
   </xsl:template>

<xsl:template match="xref[id(@ref)/self::table]" mode="expand-gentext" priority="2">
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
               <_sfe:CrossReference>
                  <xsl:variable name="division-name-token-list"> alpha-list ata-page-block book
                     bullist chapsect-list chapter consumables enumlist figure fits-and-clears
                     fixtures-and-equipment frontmatter general highlights intro list lof lof-item
                     lot lot-item mm-fits module n-para num-index num-list page-block procedure
                     sblist section spec-tool-table special-tools subject subpara table title-page
                     torque-and-stretch unlist </xsl:variable>
                  <xsl:variable name="refed-id" select="@ref"/>
                  <xsl:variable name="idrefed-element-name" select="concat(' ',name((//*[@_gte:id=$refed-id])[1]),' ')"/>
                  <_gte:Link linkRef="{@ref}">
                     <xsl:choose>
                        <xsl:when test="contains($division-name-token-list,$idrefed-element-name)">
                           <_gte:deferredCrossReference xrefStyle="Number" refed-id="{@ref}"/>
                        </xsl:when>
                        <xsl:otherwise>
                           <xsl:apply-templates select="(//*[@_gte:id=$refed-id])[1]" mode="styler_xref-Number"/>
                        </xsl:otherwise>
                     </xsl:choose>
                  </_gte:Link>
               </_sfe:CrossReference>
               <xsl:text> </xsl:text>
            </_sfe:BeforeOrAfterText>
         </xsl:if>
         <xsl:apply-templates select="* | text() | processing-instruction()" mode="expand-gentext"/>
      </xsl:copy>
   </xsl:template>

<xsl:template match="xref" mode="expand-gentext" priority="0">
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
         <!--Unconditional AddAfter-->
         <xsl:if test="not(@_gte:Gentext-Expanded)">
            <_sfe:BeforeOrAfterText>
               <_sfe:CrossReference>
                  <xsl:variable name="division-name-token-list"> alpha-list ata-page-block book
                     bullist chapsect-list chapter consumables enumlist figure fits-and-clears
                     fixtures-and-equipment frontmatter general highlights intro list lof lof-item
                     lot lot-item mm-fits module n-para num-index num-list page-block procedure
                     sblist section spec-tool-table special-tools subject subpara table title-page
                     torque-and-stretch unlist </xsl:variable>
                  <xsl:variable name="refed-id" select="@ref"/>
                  <xsl:variable name="idrefed-element-name" select="concat(' ',name((//*[@_gte:id=$refed-id])[1]),' ')"/>
                  <_gte:Link linkRef="{@ref}">
                     <xsl:choose>
                        <xsl:when test="contains($division-name-token-list,$idrefed-element-name)">
                           <_gte:deferredCrossReference xrefStyle="Number" refed-id="{@ref}"/>
                        </xsl:when>
                        <xsl:otherwise>
                           <xsl:apply-templates select="(//*[@_gte:id=$refed-id])[1]" mode="styler_xref-Number"/>
                        </xsl:otherwise>
                     </xsl:choose>
                  </_gte:Link>
               </_sfe:CrossReference>
            </_sfe:BeforeOrAfterText>
         </xsl:if>
      </xsl:copy>
   </xsl:template>

</xsl:stylesheet>
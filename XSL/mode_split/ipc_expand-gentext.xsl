<?xml version="1.0" encoding="UTF-8"?><xsl:stylesheet xmlns:simg="java:net.sf.docbook.saxon.ImageIntrinsics" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:ximg="xaln://com.nwalsh.xalan.ImageIntrinsics" xmlns="http://www.w3.org/1999/xhtml" xmlns:exslt="http://exslt.org/common" xmlns:_acl="java:com.arbortext.epic.Acl" xmlns:msxsl="urn:schemas-microsoft-com:xslt" xmlns:_="http://www.pwc.ca/namespace/doctypes/emipc" xmlns:_dtd="http://www.arbortext.com/namespace/Styler/UserElements" xmlns:atidlm="http://www.arbortext.com/namespace/atidlm" xmlns:_2="http://www.pwc.ca/namespace/doctypes/jmtosmigrate" xmlns:ch="http://www.arbortext.com/namespace/chunker" xmlns:saxon="http://saxon.sf.net/" xmlns:_5="http://www.pwc.ca/namespace/doctypes/ipc" xmlns:_gte="http://www.arbortext.com/namespace/Styler/GeneratedTextElements" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:_sfe="http://www.arbortext.com/namespace/Styler/StylerFormattingElements" xmlns:_js="java:com.arbortext.epic.internal.js.JavaScript" xmlns:_3="http://www.pwc.ca/namespace/doctypes/migrate" xmlns:_ufe="http://www.arbortext.com/namespace/Styler/UserFormattingElements" version="1.0" exclude-result-prefixes="_ atidlm xml _2 ch saxon _5 xsi _js _3 #default exslt msxsl _dtd _ufe _sfe _gte simg ximg _acl">


<xsl:template match="attach-parts" mode="expand-gentext" priority="0">
      <xsl:copy>
         <xsl:apply-templates select="@*|node()" mode="expand-gentext"/>
      </xsl:copy>
   </xsl:template>

<xsl:template match="bs-group" mode="expand-gentext" priority="0">
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
               <xsl:text>Build Specification No. </xsl:text>
            </_sfe:BeforeOrAfterText>
         </xsl:if>
         <xsl:apply-templates select="* | text() | processing-instruction()" mode="expand-gentext"/>
      </xsl:copy>
   </xsl:template>

<xsl:template match="chap" mode="expand-gentext" priority="0">
      <xsl:copy>
         <xsl:apply-templates select="@*|node()" mode="expand-gentext"/>
      </xsl:copy>
   </xsl:template>

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
         <!--Unconditional AddBefore-->
         <xsl:if test="not(@_gte:Gentext-Expanded)">
            <_sfe:BeforeOrAfterText>
               <xsl:text> </xsl:text>
            </_sfe:BeforeOrAfterText>
         </xsl:if>
         <xsl:apply-templates select="* | text() | processing-instruction()" mode="expand-gentext"/>
         <!--Unconditional AddAfter-->
         <xsl:if test="not(@_gte:Gentext-Expanded)">
            <_sfe:BeforeOrAfterText>
               <xsl:text> </xsl:text>
            </_sfe:BeforeOrAfterText>
         </xsl:if>
      </xsl:copy>
   </xsl:template>

<xsl:template match="eff-bs" mode="expand-gentext" priority="0">
      <xsl:copy>
         <xsl:apply-templates select="@*|node()" mode="expand-gentext"/>
      </xsl:copy>
   </xsl:template>

<xsl:template match="eff-code" mode="expand-gentext" priority="0">
      <xsl:copy>
         <xsl:apply-templates select="@*|node()" mode="expand-gentext"/>
      </xsl:copy>
   </xsl:template>

<xsl:template match="eff-letter" mode="expand-gentext" priority="0">
      <xsl:copy>
         <xsl:apply-templates select="@*|node()" mode="expand-gentext"/>
      </xsl:copy>
   </xsl:template>

<xsl:template match="eff-model" mode="expand-gentext" priority="0">
      <xsl:copy>
         <xsl:apply-templates select="@*|node()" mode="expand-gentext"/>
      </xsl:copy>
   </xsl:template>

<xsl:template match="fignote" mode="expand-gentext" priority="0">
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
            <xsl:when test="not(@prc=number('1')) and not(@prc=number('2')) and not(@prc=number('3')) and not(@prc=number('6')) and not(@prc=number('7')) and not(@prc and string(@prc)='N') and (@prc and string(@prc)='S')">
               <!--AddBefore Condition #7-->
               <xsl:if test="not(@_gte:Gentext-Expanded)">
                  <_sfe:BeforeOrAfterText>
                     <xsl:text>INTRCHG WITH P/N </xsl:text>
                  </_sfe:BeforeOrAfterText>
               </xsl:if>
            </xsl:when>
            <xsl:when test="not(@prc=number('1')) and not(@prc=number('2')) and not(@prc=number('3')) and not(@prc=number('6')) and not(@prc=number('7')) and (@prc and string(@prc)='N')">
               <!--AddBefore Condition #6-->
               <xsl:if test="not(@_gte:Gentext-Expanded)">
                  <_sfe:BeforeOrAfterText>
                     <xsl:text>NONINTR WITH P/N </xsl:text>
                  </_sfe:BeforeOrAfterText>
               </xsl:if>
            </xsl:when>
            <xsl:when test="not(@prc=number('1')) and not(@prc=number('2')) and not(@prc=number('3')) and not(@prc=number('6')) and (@prc=number('7'))">
               <!--AddBefore Condition #5-->
               <xsl:if test="not(@_gte:Gentext-Expanded)">
                  <_sfe:BeforeOrAfterText>
                     <xsl:text>RESTRICTED INTERCHANGEABILITY WITH P/N </xsl:text>
                  </_sfe:BeforeOrAfterText>
               </xsl:if>
            </xsl:when>
            <xsl:when test="not(@prc=number('1')) and not(@prc=number('2')) and not(@prc=number('3')) and (@prc=number('6'))">
               <!--AddBefore Condition #4-->
               <xsl:if test="not(@_gte:Gentext-Expanded)">
                  <_sfe:BeforeOrAfterText>
                     <xsl:text>INTRCHG AS A SET WITH P/N </xsl:text>
                  </_sfe:BeforeOrAfterText>
               </xsl:if>
            </xsl:when>
            <xsl:when test="not(@prc=number('1')) and not(@prc=number('2')) and (@prc=number('3'))">
               <!--AddBefore Condition #3-->
               <xsl:if test="not(@_gte:Gentext-Expanded)">
                  <_sfe:BeforeOrAfterText>
                     <xsl:text>NOT INTR WITH P/N </xsl:text>
                  </_sfe:BeforeOrAfterText>
               </xsl:if>
            </xsl:when>
            <xsl:when test="not(@prc=number('1')) and (@prc=number('2'))">
               <!--AddBefore Condition #2-->
               <xsl:if test="not(@_gte:Gentext-Expanded)">
                  <_sfe:BeforeOrAfterText>
                     <xsl:text>TWO-WAY INTRCHG WITH P/N </xsl:text>
                  </_sfe:BeforeOrAfterText>
               </xsl:if>
            </xsl:when>
            <xsl:when test="@prc=number('1')">
               <!--AddBefore Condition #1-->
               <xsl:if test="not(@_gte:Gentext-Expanded)">
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
            <xsl:when test="not(@prc=number('1')) and not(@prc=number('2')) and not(@prc=number('3')) and not(@prc=number('6')) and (@prc=number('7'))">
               <!--AddAfter Condition #5-->
               <xsl:if test="not(@_gte:Gentext-Expanded)">
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
         <!--Unconditional AddBefore-->
         <xsl:if test="not(@_gte:Gentext-Expanded)">
            <_sfe:BeforeOrAfterText>
               <_ufe:fig-title>
                  <xsl:text>Figure </xsl:text>
                  <xsl:if test="(ancestor-or-self::ipc-fig[1]//figno)[1]/*|(ancestor-or-self::ipc-fig[1]//figno)[1]/text()|(ancestor-or-self::ipc-fig[1]//figno)[1]/processing-instruction()">
                     <_gte:Gentexted-Content-Wrapper>
                        <xsl:apply-templates mode="expand-gentext" select="(ancestor-or-self::ipc-fig[1]//figno)[1]/*|(ancestor-or-self::ipc-fig[1]//figno)[1]/text()|(ancestor-or-self::ipc-fig[1]//figno)[1]/processing-instruction()">
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

<xsl:template match="ipc-fig-delete" mode="expand-gentext" priority="0">
      <xsl:copy>
         <xsl:apply-templates select="@*|node()" mode="expand-gentext"/>
      </xsl:copy>
   </xsl:template>

<xsl:template match="ipc-fig-reloc" mode="expand-gentext" priority="0">
      <xsl:copy>
         <xsl:apply-templates select="@*|node()" mode="expand-gentext"/>
      </xsl:copy>
   </xsl:template>

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
         <!--Unconditional AddBefore-->
         <xsl:if test="not(@_gte:Gentext-Expanded)">
            <_sfe:BeforeOrAfterText>
               <xsl:text>KITS, REPAIR/SERVICE PARTS</xsl:text>
            </_sfe:BeforeOrAfterText>
         </xsl:if>
         <xsl:apply-templates select="* | text() | processing-instruction()" mode="expand-gentext"/>
      </xsl:copy>
   </xsl:template>

<xsl:template match="atidlm:linkcontent" mode="expand-gentext" priority="0">
      <xsl:copy>
         <xsl:apply-templates select="@*|node()" mode="expand-gentext"/>
      </xsl:copy>
   </xsl:template>

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
         <!--Unconditional AddBefore-->
         <xsl:if test="not(@_gte:Gentext-Expanded)">
            <_sfe:BeforeOrAfterText>
               <xsl:text>LATEST PARTS LIST NO: </xsl:text>
            </_sfe:BeforeOrAfterText>
         </xsl:if>
         <xsl:apply-templates select="* | text() | processing-instruction()" mode="expand-gentext"/>
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

<xsl:template match="misc" mode="expand-gentext" priority="0">
      <xsl:copy>
         <xsl:apply-templates select="@*|node()" mode="expand-gentext"/>
      </xsl:copy>
   </xsl:template>

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
            <xsl:when test="not(ancestor::entry[preceding-sibling::entry[part-nbr[@ic-opt = 'NUT-TABLE']]] and ancestor::entry[preceding-sibling::entry[part-nbr[@indent = '1']]]) and not(ancestor::entry[preceding-sibling::entry[part-nbr[@ic-opt = 'NUT-TABLE']]] and ancestor::entry[preceding-sibling::entry[part-nbr[@indent = '2']]]) and not(ancestor::entry[preceding-sibling::entry[part-nbr[@ic-opt = 'NUT-TABLE']]] and ancestor::entry[preceding-sibling::entry[part-nbr[@indent = '3']]]) and (ancestor::entry[preceding-sibling::entry[part-nbr[@ic-opt = 'NUT-TABLE']]] and ancestor::entry[preceding-sibling::entry[part-nbr[@indent = '4']]])">
               <!--AddBefore Condition #12-->
               <xsl:if test="not(@_gte:Gentext-Expanded)">
                  <_sfe:BeforeOrAfterText>
                     <xsl:text>▪▪▪▪ </xsl:text>
                  </_sfe:BeforeOrAfterText>
               </xsl:if>
            </xsl:when>
            <xsl:when test="not(ancestor::entry[preceding-sibling::entry[part-nbr[@ic-opt = 'NUT-TABLE']]] and ancestor::entry[preceding-sibling::entry[part-nbr[@indent = '1']]]) and not(ancestor::entry[preceding-sibling::entry[part-nbr[@ic-opt = 'NUT-TABLE']]] and ancestor::entry[preceding-sibling::entry[part-nbr[@indent = '2']]]) and (ancestor::entry[preceding-sibling::entry[part-nbr[@ic-opt = 'NUT-TABLE']]] and ancestor::entry[preceding-sibling::entry[part-nbr[@indent = '3']]])">
               <!--AddBefore Condition #11-->
               <xsl:if test="not(@_gte:Gentext-Expanded)">
                  <_sfe:BeforeOrAfterText>
                     <xsl:text>▪▪▪ </xsl:text>
                  </_sfe:BeforeOrAfterText>
               </xsl:if>
            </xsl:when>
            <xsl:when test="not(ancestor::entry[preceding-sibling::entry[part-nbr[@ic-opt = 'NUT-TABLE']]] and ancestor::entry[preceding-sibling::entry[part-nbr[@indent = '1']]]) and (ancestor::entry[preceding-sibling::entry[part-nbr[@ic-opt = 'NUT-TABLE']]] and ancestor::entry[preceding-sibling::entry[part-nbr[@indent = '2']]])">
               <!--AddBefore Condition #10-->
               <xsl:if test="not(@_gte:Gentext-Expanded)">
                  <_sfe:BeforeOrAfterText>
                     <xsl:text>▪▪ </xsl:text>
                  </_sfe:BeforeOrAfterText>
               </xsl:if>
            </xsl:when>
            <xsl:when test="ancestor::entry[preceding-sibling::entry[part-nbr[@ic-opt = 'NUT-TABLE']]] and ancestor::entry[preceding-sibling::entry[part-nbr[@indent = '1']]]">
               <!--AddBefore Condition #9-->
               <xsl:if test="not(@_gte:Gentext-Expanded)">
                  <_sfe:BeforeOrAfterText>
                     <xsl:text>▪ </xsl:text>
                  </_sfe:BeforeOrAfterText>
               </xsl:if>
            </xsl:when>
            <xsl:when test="not(ancestor::entry[preceding-sibling::entry[part-nbr[@indent = '1']]]) and not(ancestor::entry[preceding-sibling::entry[part-nbr[@indent = '2']]]) and not(ancestor::entry[preceding-sibling::entry[part-nbr[@indent = '3']]]) and (ancestor::entry[preceding-sibling::entry[part-nbr[@indent = '4']]]) and (not(ancestor::*[not(self::_sfe:BeforeOrAfterText)][1]/text()[normalize-space(.)!='']|ancestor::*[not(self::_sfe:BeforeOrAfterText)][1]/*[not(self::_sfe:BeforeOrAfterText)]//text()[normalize-space(.)!=''][not(parent::_sfe:BeforeOrAfterText)]))">
               <!--AddBefore Condition #8-->
               <xsl:if test="not(@_gte:Gentext-Expanded)">
                  <_sfe:BeforeOrAfterText/>
               </xsl:if>
            </xsl:when>
            <xsl:when test="not(ancestor::entry[preceding-sibling::entry[part-nbr[@indent = '1']]]) and not(ancestor::entry[preceding-sibling::entry[part-nbr[@indent = '2']]]) and not(ancestor::entry[preceding-sibling::entry[part-nbr[@indent = '3']]]) and (ancestor::entry[preceding-sibling::entry[part-nbr[@indent = '4']]])">
               <!--AddBefore Condition #7-->
               <xsl:if test="not(@_gte:Gentext-Expanded)">
                  <_sfe:BeforeOrAfterText>
                     <xsl:text>▪▪▪▪ </xsl:text>
                  </_sfe:BeforeOrAfterText>
               </xsl:if>
            </xsl:when>
            <xsl:when test="not(ancestor::entry[preceding-sibling::entry[part-nbr[@indent = '1']]]) and not(ancestor::entry[preceding-sibling::entry[part-nbr[@indent = '2']]]) and (ancestor::entry[preceding-sibling::entry[part-nbr[@indent = '3']]]) and (not(ancestor::*[not(self::_sfe:BeforeOrAfterText)][1]/text()[normalize-space(.)!='']|ancestor::*[not(self::_sfe:BeforeOrAfterText)][1]/*[not(self::_sfe:BeforeOrAfterText)]//text()[normalize-space(.)!=''][not(parent::_sfe:BeforeOrAfterText)]))">
               <!--AddBefore Condition #6-->
               <xsl:if test="not(@_gte:Gentext-Expanded)">
                  <_sfe:BeforeOrAfterText/>
               </xsl:if>
            </xsl:when>
            <xsl:when test="not(ancestor::entry[preceding-sibling::entry[part-nbr[@indent = '1']]]) and not(ancestor::entry[preceding-sibling::entry[part-nbr[@indent = '2']]]) and (ancestor::entry[preceding-sibling::entry[part-nbr[@indent = '3']]])">
               <!--AddBefore Condition #5-->
               <xsl:if test="not(@_gte:Gentext-Expanded)">
                  <_sfe:BeforeOrAfterText>
                     <xsl:text>▪▪▪ </xsl:text>
                  </_sfe:BeforeOrAfterText>
               </xsl:if>
            </xsl:when>
            <xsl:when test="not(ancestor::entry[preceding-sibling::entry[part-nbr[@indent = '1']]]) and (ancestor::entry[preceding-sibling::entry[part-nbr[@indent = '2']]]) and (not(ancestor::*[not(self::_sfe:BeforeOrAfterText)][1]/text()[normalize-space(.)!='']|ancestor::*[not(self::_sfe:BeforeOrAfterText)][1]/*[not(self::_sfe:BeforeOrAfterText)]//text()[normalize-space(.)!=''][not(parent::_sfe:BeforeOrAfterText)]))">
               <!--AddBefore Condition #4-->
               <xsl:if test="not(@_gte:Gentext-Expanded)">
                  <_sfe:BeforeOrAfterText/>
               </xsl:if>
            </xsl:when>
            <xsl:when test="not(ancestor::entry[preceding-sibling::entry[part-nbr[@indent = '1']]]) and (ancestor::entry[preceding-sibling::entry[part-nbr[@indent = '2']]])">
               <!--AddBefore Condition #3-->
               <xsl:if test="not(@_gte:Gentext-Expanded)">
                  <_sfe:BeforeOrAfterText>
                     <xsl:text>▪▪ </xsl:text>
                  </_sfe:BeforeOrAfterText>
               </xsl:if>
            </xsl:when>
            <xsl:when test="(ancestor::entry[preceding-sibling::entry[part-nbr[@indent = '1']]]) and (not(ancestor::*[not(self::_sfe:BeforeOrAfterText)][1]/text()[normalize-space(.)!='']|ancestor::*[not(self::_sfe:BeforeOrAfterText)][1]/*[not(self::_sfe:BeforeOrAfterText)]//text()[normalize-space(.)!=''][not(parent::_sfe:BeforeOrAfterText)]))">
               <!--AddBefore Condition #2-->
               <xsl:if test="not(@_gte:Gentext-Expanded)">
                  <_sfe:BeforeOrAfterText/>
               </xsl:if>
            </xsl:when>
            <xsl:when test="ancestor::entry[preceding-sibling::entry[part-nbr[@indent = '1']]]">
               <!--AddBefore Condition #1-->
               <xsl:if test="not(@_gte:Gentext-Expanded)">
                  <_sfe:BeforeOrAfterText>
                     <xsl:text>▪ </xsl:text>
                  </_sfe:BeforeOrAfterText>
               </xsl:if>
            </xsl:when>
         </xsl:choose>
         <xsl:apply-templates select="* | text() | processing-instruction()" mode="expand-gentext"/>
         <xsl:choose>
            <xsl:when test="not(ancestor::entry[preceding-sibling::entry[part-nbr[@ic-opt = 'NUT-TABLE']]] and ancestor::entry[preceding-sibling::entry[part-nbr[@indent = '1']]]) and not(ancestor::entry[preceding-sibling::entry[part-nbr[@ic-opt = 'NUT-TABLE']]] and ancestor::entry[preceding-sibling::entry[part-nbr[@indent = '2']]]) and not(ancestor::entry[preceding-sibling::entry[part-nbr[@ic-opt = 'NUT-TABLE']]] and ancestor::entry[preceding-sibling::entry[part-nbr[@indent = '3']]]) and (ancestor::entry[preceding-sibling::entry[part-nbr[@ic-opt = 'NUT-TABLE']]] and ancestor::entry[preceding-sibling::entry[part-nbr[@indent = '4']]])">
               <!--AddAfter Condition #12-->
               <xsl:if test="not(@_gte:Gentext-Expanded)">
                  <_sfe:BeforeOrAfterText>
                     <_ufe:block-nospace>
                        <xsl:text>SEE TABLE FOR OPTIONAL PART NUMBERS</xsl:text>
                     </_ufe:block-nospace>
                  </_sfe:BeforeOrAfterText>
               </xsl:if>
            </xsl:when>
            <xsl:when test="not(ancestor::entry[preceding-sibling::entry[part-nbr[@ic-opt = 'NUT-TABLE']]] and ancestor::entry[preceding-sibling::entry[part-nbr[@indent = '1']]]) and not(ancestor::entry[preceding-sibling::entry[part-nbr[@ic-opt = 'NUT-TABLE']]] and ancestor::entry[preceding-sibling::entry[part-nbr[@indent = '2']]]) and (ancestor::entry[preceding-sibling::entry[part-nbr[@ic-opt = 'NUT-TABLE']]] and ancestor::entry[preceding-sibling::entry[part-nbr[@indent = '3']]])">
               <!--AddAfter Condition #11-->
               <xsl:if test="not(@_gte:Gentext-Expanded)">
                  <_sfe:BeforeOrAfterText>
                     <_ufe:block-nospace>
                        <xsl:text>SEE TABLE FOR OPTIONAL PART NUMBERS</xsl:text>
                     </_ufe:block-nospace>
                  </_sfe:BeforeOrAfterText>
               </xsl:if>
            </xsl:when>
            <xsl:when test="not(ancestor::entry[preceding-sibling::entry[part-nbr[@ic-opt = 'NUT-TABLE']]] and ancestor::entry[preceding-sibling::entry[part-nbr[@indent = '1']]]) and (ancestor::entry[preceding-sibling::entry[part-nbr[@ic-opt = 'NUT-TABLE']]] and ancestor::entry[preceding-sibling::entry[part-nbr[@indent = '2']]])">
               <!--AddAfter Condition #10-->
               <xsl:if test="not(@_gte:Gentext-Expanded)">
                  <_sfe:BeforeOrAfterText>
                     <_ufe:block-nospace>
                        <xsl:text>SEE TABLE FOR OPTIONAL PART NUMBERS</xsl:text>
                     </_ufe:block-nospace>
                  </_sfe:BeforeOrAfterText>
               </xsl:if>
            </xsl:when>
            <xsl:when test="ancestor::entry[preceding-sibling::entry[part-nbr[@ic-opt = 'NUT-TABLE']]] and ancestor::entry[preceding-sibling::entry[part-nbr[@indent = '1']]]">
               <!--AddAfter Condition #9-->
               <xsl:if test="not(@_gte:Gentext-Expanded)">
                  <_sfe:BeforeOrAfterText>
                     <_ufe:block-nospace>
                        <xsl:text>SEE TABLE FOR OPTIONAL PART NUMBERS</xsl:text>
                     </_ufe:block-nospace>
                  </_sfe:BeforeOrAfterText>
               </xsl:if>
            </xsl:when>
            <xsl:when test="not(ancestor::entry[preceding-sibling::entry[part-nbr[@indent = '1']]]) and not(ancestor::entry[preceding-sibling::entry[part-nbr[@indent = '2']]]) and not(ancestor::entry[preceding-sibling::entry[part-nbr[@indent = '3']]]) and (ancestor::entry[preceding-sibling::entry[part-nbr[@indent = '4']]]) and (not(ancestor::*[not(self::_sfe:BeforeOrAfterText)][1]/text()[normalize-space(.)!='']|ancestor::*[not(self::_sfe:BeforeOrAfterText)][1]/*[not(self::_sfe:BeforeOrAfterText)]//text()[normalize-space(.)!=''][not(parent::_sfe:BeforeOrAfterText)]))">
               <!--AddAfter Condition #8-->
               <xsl:if test="not(@_gte:Gentext-Expanded)">
                  <_sfe:BeforeOrAfterText/>
               </xsl:if>
            </xsl:when>
            <xsl:when test="not(ancestor::entry[preceding-sibling::entry[part-nbr[@indent = '1']]]) and not(ancestor::entry[preceding-sibling::entry[part-nbr[@indent = '2']]]) and not(ancestor::entry[preceding-sibling::entry[part-nbr[@indent = '3']]]) and (ancestor::entry[preceding-sibling::entry[part-nbr[@indent = '4']]])"><!--AddAfter Condition #7--></xsl:when>
            <xsl:when test="not(ancestor::entry[preceding-sibling::entry[part-nbr[@indent = '1']]]) and not(ancestor::entry[preceding-sibling::entry[part-nbr[@indent = '2']]]) and (ancestor::entry[preceding-sibling::entry[part-nbr[@indent = '3']]]) and (not(ancestor::*[not(self::_sfe:BeforeOrAfterText)][1]/text()[normalize-space(.)!='']|ancestor::*[not(self::_sfe:BeforeOrAfterText)][1]/*[not(self::_sfe:BeforeOrAfterText)]//text()[normalize-space(.)!=''][not(parent::_sfe:BeforeOrAfterText)]))">
               <!--AddAfter Condition #6-->
               <xsl:if test="not(@_gte:Gentext-Expanded)">
                  <_sfe:BeforeOrAfterText/>
               </xsl:if>
            </xsl:when>
            <xsl:when test="not(ancestor::entry[preceding-sibling::entry[part-nbr[@indent = '1']]]) and not(ancestor::entry[preceding-sibling::entry[part-nbr[@indent = '2']]]) and (ancestor::entry[preceding-sibling::entry[part-nbr[@indent = '3']]])"><!--AddAfter Condition #5--></xsl:when>
            <xsl:when test="not(ancestor::entry[preceding-sibling::entry[part-nbr[@indent = '1']]]) and (ancestor::entry[preceding-sibling::entry[part-nbr[@indent = '2']]]) and (not(ancestor::*[not(self::_sfe:BeforeOrAfterText)][1]/text()[normalize-space(.)!='']|ancestor::*[not(self::_sfe:BeforeOrAfterText)][1]/*[not(self::_sfe:BeforeOrAfterText)]//text()[normalize-space(.)!=''][not(parent::_sfe:BeforeOrAfterText)]))">
               <!--AddAfter Condition #4-->
               <xsl:if test="not(@_gte:Gentext-Expanded)">
                  <_sfe:BeforeOrAfterText/>
               </xsl:if>
            </xsl:when>
            <xsl:when test="not(ancestor::entry[preceding-sibling::entry[part-nbr[@indent = '1']]]) and (ancestor::entry[preceding-sibling::entry[part-nbr[@indent = '2']]])"><!--AddAfter Condition #3--></xsl:when>
            <xsl:when test="(ancestor::entry[preceding-sibling::entry[part-nbr[@indent = '1']]]) and (not(ancestor::*[not(self::_sfe:BeforeOrAfterText)][1]/text()[normalize-space(.)!='']|ancestor::*[not(self::_sfe:BeforeOrAfterText)][1]/*[not(self::_sfe:BeforeOrAfterText)]//text()[normalize-space(.)!=''][not(parent::_sfe:BeforeOrAfterText)]))">
               <!--AddAfter Condition #2-->
               <xsl:if test="not(@_gte:Gentext-Expanded)">
                  <_sfe:BeforeOrAfterText/>
               </xsl:if>
            </xsl:when>
            <xsl:when test="ancestor::entry[preceding-sibling::entry[part-nbr[@indent = '1']]]">
               <!--AddAfter Condition #1-->
               <xsl:if test="not(@_gte:Gentext-Expanded)">
                  <_sfe:BeforeOrAfterText/>
               </xsl:if>
            </xsl:when>
         </xsl:choose>
      </xsl:copy>
   </xsl:template>

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
            <xsl:when test="not((@select-at and string(@select-at)='ASSEMBLY') and (parent::entry[preceding-sibling::entry[part-nbr[@ic-opt = 'LIST']]])) and not((@select-at and string(@select-at)='BALANCING') and (parent::entry[preceding-sibling::entry[part-nbr[@ic-opt = 'LIST']]])) and not((@select-at and string(@select-at)='DETAIL-BAL') and (parent::entry[preceding-sibling::entry[part-nbr[@ic-opt = 'LIST']]])) and ((@select-at and string(@select-at)='TRIM-BAL') and (parent::entry[preceding-sibling::entry[part-nbr[@ic-opt = 'LIST']]]))">
               <!--AddBefore Condition #8-->
               <xsl:if test="not(@_gte:Gentext-Expanded)">
                  <_sfe:BeforeOrAfterText/>
               </xsl:if>
            </xsl:when>
            <xsl:when test="not((@select-at and string(@select-at)='ASSEMBLY') and (parent::entry[preceding-sibling::entry[part-nbr[@ic-opt = 'LIST']]])) and not((@select-at and string(@select-at)='BALANCING') and (parent::entry[preceding-sibling::entry[part-nbr[@ic-opt = 'LIST']]])) and ((@select-at and string(@select-at)='DETAIL-BAL') and (parent::entry[preceding-sibling::entry[part-nbr[@ic-opt = 'LIST']]]))">
               <!--AddBefore Condition #7-->
               <xsl:if test="not(@_gte:Gentext-Expanded)">
                  <_sfe:BeforeOrAfterText/>
               </xsl:if>
            </xsl:when>
            <xsl:when test="not((@select-at and string(@select-at)='ASSEMBLY') and (parent::entry[preceding-sibling::entry[part-nbr[@ic-opt = 'LIST']]])) and ((@select-at and string(@select-at)='BALANCING') and (parent::entry[preceding-sibling::entry[part-nbr[@ic-opt = 'LIST']]]))">
               <!--AddBefore Condition #6-->
               <xsl:if test="not(@_gte:Gentext-Expanded)">
                  <_sfe:BeforeOrAfterText/>
               </xsl:if>
            </xsl:when>
            <xsl:when test="(@select-at and string(@select-at)='ASSEMBLY') and (parent::entry[preceding-sibling::entry[part-nbr[@ic-opt = 'LIST']]])">
               <!--AddBefore Condition #5-->
               <xsl:if test="not(@_gte:Gentext-Expanded)">
                  <_sfe:BeforeOrAfterText/>
               </xsl:if>
            </xsl:when>
         </xsl:choose>
         <xsl:apply-templates select="* | text() | processing-instruction()" mode="expand-gentext"/>
         <xsl:choose>
            <xsl:when test="not((@select-at and string(@select-at)='ASSEMBLY') and (parent::entry[preceding-sibling::entry[part-nbr[@ic-opt = 'LIST']]])) and not((@select-at and string(@select-at)='BALANCING') and (parent::entry[preceding-sibling::entry[part-nbr[@ic-opt = 'LIST']]])) and not((@select-at and string(@select-at)='DETAIL-BAL') and (parent::entry[preceding-sibling::entry[part-nbr[@ic-opt = 'LIST']]])) and not((@select-at and string(@select-at)='TRIM-BAL') and (parent::entry[preceding-sibling::entry[part-nbr[@ic-opt = 'LIST']]])) and not(parent::entry[preceding-sibling::entry[part-nbr[@ic-opt = 'LIST']]]) and not(@select-at and string(@select-at)='ASSEMBLY') and not(@select-at and string(@select-at)='BALANCING') and not(@select-at and string(@select-at)='DETAIL-BAL') and (@select-at and string(@select-at)='TRIM-BAL')">
               <!--AddAfter Condition #13-->
               <xsl:if test="not(@_gte:Gentext-Expanded)">
                  <_sfe:BeforeOrAfterText>
                     <_ufe:block-nospace>
                        <xsl:text>SELECT AT TRIM-BAL</xsl:text>
                     </_ufe:block-nospace>
                  </_sfe:BeforeOrAfterText>
               </xsl:if>
            </xsl:when>
            <xsl:when test="not((@select-at and string(@select-at)='ASSEMBLY') and (parent::entry[preceding-sibling::entry[part-nbr[@ic-opt = 'LIST']]])) and not((@select-at and string(@select-at)='BALANCING') and (parent::entry[preceding-sibling::entry[part-nbr[@ic-opt = 'LIST']]])) and not((@select-at and string(@select-at)='DETAIL-BAL') and (parent::entry[preceding-sibling::entry[part-nbr[@ic-opt = 'LIST']]])) and not((@select-at and string(@select-at)='TRIM-BAL') and (parent::entry[preceding-sibling::entry[part-nbr[@ic-opt = 'LIST']]])) and not(parent::entry[preceding-sibling::entry[part-nbr[@ic-opt = 'LIST']]]) and not(@select-at and string(@select-at)='ASSEMBLY') and not(@select-at and string(@select-at)='BALANCING') and (@select-at and string(@select-at)='DETAIL-BAL')">
               <!--AddAfter Condition #12-->
               <xsl:if test="not(@_gte:Gentext-Expanded)">
                  <_sfe:BeforeOrAfterText>
                     <_ufe:block-nospace>
                        <xsl:text>SELECT AT DETAIL-BAL</xsl:text>
                     </_ufe:block-nospace>
                  </_sfe:BeforeOrAfterText>
               </xsl:if>
            </xsl:when>
            <xsl:when test="not((@select-at and string(@select-at)='ASSEMBLY') and (parent::entry[preceding-sibling::entry[part-nbr[@ic-opt = 'LIST']]])) and not((@select-at and string(@select-at)='BALANCING') and (parent::entry[preceding-sibling::entry[part-nbr[@ic-opt = 'LIST']]])) and not((@select-at and string(@select-at)='DETAIL-BAL') and (parent::entry[preceding-sibling::entry[part-nbr[@ic-opt = 'LIST']]])) and not((@select-at and string(@select-at)='TRIM-BAL') and (parent::entry[preceding-sibling::entry[part-nbr[@ic-opt = 'LIST']]])) and not(parent::entry[preceding-sibling::entry[part-nbr[@ic-opt = 'LIST']]]) and not(@select-at and string(@select-at)='ASSEMBLY') and (@select-at and string(@select-at)='BALANCING')">
               <!--AddAfter Condition #11-->
               <xsl:if test="not(@_gte:Gentext-Expanded)">
                  <_sfe:BeforeOrAfterText>
                     <_ufe:block-nospace>
                        <xsl:text>SELECT AT BALANCING</xsl:text>
                     </_ufe:block-nospace>
                  </_sfe:BeforeOrAfterText>
               </xsl:if>
            </xsl:when>
            <xsl:when test="not((@select-at and string(@select-at)='ASSEMBLY') and (parent::entry[preceding-sibling::entry[part-nbr[@ic-opt = 'LIST']]])) and not((@select-at and string(@select-at)='BALANCING') and (parent::entry[preceding-sibling::entry[part-nbr[@ic-opt = 'LIST']]])) and not((@select-at and string(@select-at)='DETAIL-BAL') and (parent::entry[preceding-sibling::entry[part-nbr[@ic-opt = 'LIST']]])) and not((@select-at and string(@select-at)='TRIM-BAL') and (parent::entry[preceding-sibling::entry[part-nbr[@ic-opt = 'LIST']]])) and not(parent::entry[preceding-sibling::entry[part-nbr[@ic-opt = 'LIST']]]) and (@select-at and string(@select-at)='ASSEMBLY')">
               <!--AddAfter Condition #10-->
               <xsl:if test="not(@_gte:Gentext-Expanded)">
                  <_sfe:BeforeOrAfterText>
                     <_ufe:block-nospace>
                        <xsl:text>SELECT AT ASSEMBLY</xsl:text>
                     </_ufe:block-nospace>
                  </_sfe:BeforeOrAfterText>
               </xsl:if>
            </xsl:when>
            <xsl:when test="not((@select-at and string(@select-at)='ASSEMBLY') and (parent::entry[preceding-sibling::entry[part-nbr[@ic-opt = 'LIST']]])) and not((@select-at and string(@select-at)='BALANCING') and (parent::entry[preceding-sibling::entry[part-nbr[@ic-opt = 'LIST']]])) and not((@select-at and string(@select-at)='DETAIL-BAL') and (parent::entry[preceding-sibling::entry[part-nbr[@ic-opt = 'LIST']]])) and not((@select-at and string(@select-at)='TRIM-BAL') and (parent::entry[preceding-sibling::entry[part-nbr[@ic-opt = 'LIST']]])) and (parent::entry[preceding-sibling::entry[part-nbr[@ic-opt = 'LIST']]])">
               <!--AddAfter Condition #9-->
               <xsl:if test="not(@_gte:Gentext-Expanded)">
                  <_sfe:BeforeOrAfterText>
                     <_ufe:block-nospace>
                        <xsl:text>(IC) CONSISTS OF:</xsl:text>
                     </_ufe:block-nospace>
                  </_sfe:BeforeOrAfterText>
               </xsl:if>
            </xsl:when>
            <xsl:when test="not((@select-at and string(@select-at)='ASSEMBLY') and (parent::entry[preceding-sibling::entry[part-nbr[@ic-opt = 'LIST']]])) and not((@select-at and string(@select-at)='BALANCING') and (parent::entry[preceding-sibling::entry[part-nbr[@ic-opt = 'LIST']]])) and not((@select-at and string(@select-at)='DETAIL-BAL') and (parent::entry[preceding-sibling::entry[part-nbr[@ic-opt = 'LIST']]])) and ((@select-at and string(@select-at)='TRIM-BAL') and (parent::entry[preceding-sibling::entry[part-nbr[@ic-opt = 'LIST']]]))">
               <!--AddAfter Condition #8-->
               <xsl:if test="not(@_gte:Gentext-Expanded)">
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
            <xsl:when test="not((@select-at and string(@select-at)='ASSEMBLY') and (parent::entry[preceding-sibling::entry[part-nbr[@ic-opt = 'LIST']]])) and not((@select-at and string(@select-at)='BALANCING') and (parent::entry[preceding-sibling::entry[part-nbr[@ic-opt = 'LIST']]])) and ((@select-at and string(@select-at)='DETAIL-BAL') and (parent::entry[preceding-sibling::entry[part-nbr[@ic-opt = 'LIST']]]))">
               <!--AddAfter Condition #7-->
               <xsl:if test="not(@_gte:Gentext-Expanded)">
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
            <xsl:when test="not((@select-at and string(@select-at)='ASSEMBLY') and (parent::entry[preceding-sibling::entry[part-nbr[@ic-opt = 'LIST']]])) and ((@select-at and string(@select-at)='BALANCING') and (parent::entry[preceding-sibling::entry[part-nbr[@ic-opt = 'LIST']]]))">
               <!--AddAfter Condition #6-->
               <xsl:if test="not(@_gte:Gentext-Expanded)">
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
            <xsl:when test="(@select-at and string(@select-at)='ASSEMBLY') and (parent::entry[preceding-sibling::entry[part-nbr[@ic-opt = 'LIST']]])">
               <!--AddAfter Condition #5-->
               <xsl:if test="not(@_gte:Gentext-Expanded)">
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
            <xsl:when test="(following-sibling::note) or (preceding-sibling::note)">
               <!--AddBefore Condition #1-->
               <xsl:if test="not(@_gte:Gentext-Expanded)">
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
            <xsl:when test="(following-sibling::note) or (preceding-sibling::note)">
               <!--AddBefore Condition #1-->
               <xsl:if test="not(@_gte:Gentext-Expanded)">
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
            <xsl:when test="(following-sibling::note) or (preceding-sibling::note)">
               <!--AddBefore Condition #1-->
               <xsl:if test="not(@_gte:Gentext-Expanded)">
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
            <xsl:when test="(following-sibling::note) or (preceding-sibling::note)">
               <!--AddBefore Condition #1-->
               <xsl:if test="not(@_gte:Gentext-Expanded)">
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

<xsl:template match="optitem" mode="expand-gentext" priority="0">
      <xsl:copy>
         <xsl:apply-templates select="@*|node()" mode="expand-gentext"/>
      </xsl:copy>
   </xsl:template>

<xsl:template match="optpn" mode="expand-gentext" priority="0">
      <xsl:copy>
         <xsl:apply-templates select="@*|node()" mode="expand-gentext"/>
      </xsl:copy>
   </xsl:template>

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
            <xsl:when test="(@ref) and (not(@ref) or (@ref and string(@ref)!=''))">
               <!--AddBefore Condition #1-->
               <xsl:if test="not(@_gte:Gentext-Expanded)">
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

<xsl:template match="_ufe:partial-breakdown" mode="expand-gentext" priority="0">
      <xsl:copy>
         <xsl:apply-templates select="@*|node()" mode="expand-gentext"/>
      </xsl:copy>
   </xsl:template>

<xsl:template match="parts-list" mode="expand-gentext" priority="0">
      <xsl:copy>
         <xsl:apply-templates select="@*|node()" mode="expand-gentext"/>
      </xsl:copy>
   </xsl:template>

<xsl:template match="pd-list" mode="expand-gentext" priority="0">
      <xsl:copy>
         <xsl:apply-templates select="@*|node()" mode="expand-gentext"/>
      </xsl:copy>
   </xsl:template>

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
            <xsl:when test="not((@cat and string(@cat)='comp-of') and (preceding-sibling::pntype[1][@cat='comp-of'])) and not((@cat and string(@cat)='NewMay') and (preceding-sibling::pntype[1][@cat='NewMay'])) and not((@cat and string(@cat)='rew') and (preceding-sibling::pntype[1][@cat='rew'])) and not((@cat and string(@cat)='field') and (preceding-sibling::pntype[1][@cat='field'])) and not((@cat and string(@cat)='use-with') and (preceding-sibling::pntype[1][@cat='use-with'])) and not((@cat and string(@cat)='comp-of') and (preceding-sibling::pntype[1][@cat!='comp-of'])) and not((@cat and string(@cat)='NewMay') and (preceding-sibling::pntype[1][@cat!='NewMay'])) and not((@cat and string(@cat)='rew') and (preceding-sibling::pntype[1][@cat!='rew'])) and not((@cat and string(@cat)='field') and (preceding-sibling::pntype[1][@cat!='field'])) and ((@cat and string(@cat)='use-with') and (preceding-sibling::pntype[1][@cat!='use-with']))">
               <!--AddBefore Condition #10-->
               <xsl:if test="not(@_gte:Gentext-Expanded)">
                  <_sfe:BeforeOrAfterText>
                     <xsl:text>use with P/N </xsl:text>
                  </_sfe:BeforeOrAfterText>
               </xsl:if>
            </xsl:when>
            <xsl:when test="not((@cat and string(@cat)='comp-of') and (preceding-sibling::pntype[1][@cat='comp-of'])) and not((@cat and string(@cat)='NewMay') and (preceding-sibling::pntype[1][@cat='NewMay'])) and not((@cat and string(@cat)='rew') and (preceding-sibling::pntype[1][@cat='rew'])) and not((@cat and string(@cat)='field') and (preceding-sibling::pntype[1][@cat='field'])) and not((@cat and string(@cat)='use-with') and (preceding-sibling::pntype[1][@cat='use-with'])) and not((@cat and string(@cat)='comp-of') and (preceding-sibling::pntype[1][@cat!='comp-of'])) and not((@cat and string(@cat)='NewMay') and (preceding-sibling::pntype[1][@cat!='NewMay'])) and not((@cat and string(@cat)='rew') and (preceding-sibling::pntype[1][@cat!='rew'])) and ((@cat and string(@cat)='field') and (preceding-sibling::pntype[1][@cat!='field']))">
               <!--AddBefore Condition #9-->
               <xsl:if test="not(@_gte:Gentext-Expanded)">
                  <_sfe:BeforeOrAfterText>
                     <xsl:text>Field reidentification P/N </xsl:text>
                  </_sfe:BeforeOrAfterText>
               </xsl:if>
            </xsl:when>
            <xsl:when test="not((@cat and string(@cat)='comp-of') and (preceding-sibling::pntype[1][@cat='comp-of'])) and not((@cat and string(@cat)='NewMay') and (preceding-sibling::pntype[1][@cat='NewMay'])) and not((@cat and string(@cat)='rew') and (preceding-sibling::pntype[1][@cat='rew'])) and not((@cat and string(@cat)='field') and (preceding-sibling::pntype[1][@cat='field'])) and not((@cat and string(@cat)='use-with') and (preceding-sibling::pntype[1][@cat='use-with'])) and not((@cat and string(@cat)='comp-of') and (preceding-sibling::pntype[1][@cat!='comp-of'])) and not((@cat and string(@cat)='NewMay') and (preceding-sibling::pntype[1][@cat!='NewMay'])) and ((@cat and string(@cat)='rew') and (preceding-sibling::pntype[1][@cat!='rew']))">
               <!--AddBefore Condition #8-->
               <xsl:if test="not(@_gte:Gentext-Expanded)">
                  <_sfe:BeforeOrAfterText>
                     <xsl:text>Reworked from P/N </xsl:text>
                  </_sfe:BeforeOrAfterText>
               </xsl:if>
            </xsl:when>
            <xsl:when test="not((@cat and string(@cat)='comp-of') and (preceding-sibling::pntype[1][@cat='comp-of'])) and not((@cat and string(@cat)='NewMay') and (preceding-sibling::pntype[1][@cat='NewMay'])) and not((@cat and string(@cat)='rew') and (preceding-sibling::pntype[1][@cat='rew'])) and not((@cat and string(@cat)='field') and (preceding-sibling::pntype[1][@cat='field'])) and not((@cat and string(@cat)='use-with') and (preceding-sibling::pntype[1][@cat='use-with'])) and not((@cat and string(@cat)='comp-of') and (preceding-sibling::pntype[1][@cat!='comp-of'])) and ((@cat and string(@cat)='NewMay') and (preceding-sibling::pntype[1][@cat!='NewMay']))">
               <!--AddBefore Condition #7-->
               <xsl:if test="not(@_gte:Gentext-Expanded)">
                  <_sfe:BeforeOrAfterText>
                     <xsl:text>May be obtained by rework of P/N </xsl:text>
                  </_sfe:BeforeOrAfterText>
               </xsl:if>
            </xsl:when>
            <xsl:when test="not((@cat and string(@cat)='comp-of') and (preceding-sibling::pntype[1][@cat='comp-of'])) and not((@cat and string(@cat)='NewMay') and (preceding-sibling::pntype[1][@cat='NewMay'])) and not((@cat and string(@cat)='rew') and (preceding-sibling::pntype[1][@cat='rew'])) and not((@cat and string(@cat)='field') and (preceding-sibling::pntype[1][@cat='field'])) and not((@cat and string(@cat)='use-with') and (preceding-sibling::pntype[1][@cat='use-with'])) and ((@cat and string(@cat)='comp-of') and (preceding-sibling::pntype[1][@cat!='comp-of']))">
               <!--AddBefore Condition #6-->
               <xsl:if test="not(@_gte:Gentext-Expanded)">
                  <_sfe:BeforeOrAfterText>
                     <xsl:text>component of P/N </xsl:text>
                  </_sfe:BeforeOrAfterText>
               </xsl:if>
            </xsl:when>
            <xsl:when test="not((@cat and string(@cat)='comp-of') and (preceding-sibling::pntype[1][@cat='comp-of'])) and not((@cat and string(@cat)='NewMay') and (preceding-sibling::pntype[1][@cat='NewMay'])) and not((@cat and string(@cat)='rew') and (preceding-sibling::pntype[1][@cat='rew'])) and not((@cat and string(@cat)='field') and (preceding-sibling::pntype[1][@cat='field'])) and ((@cat and string(@cat)='use-with') and (preceding-sibling::pntype[1][@cat='use-with']))">
               <!--AddBefore Condition #5-->
               <xsl:if test="not(@_gte:Gentext-Expanded)">
                  <_sfe:BeforeOrAfterText>
                     <xsl:text> AND </xsl:text>
                  </_sfe:BeforeOrAfterText>
               </xsl:if>
            </xsl:when>
            <xsl:when test="not((@cat and string(@cat)='comp-of') and (preceding-sibling::pntype[1][@cat='comp-of'])) and not((@cat and string(@cat)='NewMay') and (preceding-sibling::pntype[1][@cat='NewMay'])) and not((@cat and string(@cat)='rew') and (preceding-sibling::pntype[1][@cat='rew'])) and ((@cat and string(@cat)='field') and (preceding-sibling::pntype[1][@cat='field']))">
               <!--AddBefore Condition #4-->
               <xsl:if test="not(@_gte:Gentext-Expanded)">
                  <_sfe:BeforeOrAfterText>
                     <xsl:text> AND </xsl:text>
                  </_sfe:BeforeOrAfterText>
               </xsl:if>
            </xsl:when>
            <xsl:when test="not((@cat and string(@cat)='comp-of') and (preceding-sibling::pntype[1][@cat='comp-of'])) and not((@cat and string(@cat)='NewMay') and (preceding-sibling::pntype[1][@cat='NewMay'])) and ((@cat and string(@cat)='rew') and (preceding-sibling::pntype[1][@cat='rew']))">
               <!--AddBefore Condition #3-->
               <xsl:if test="not(@_gte:Gentext-Expanded)">
                  <_sfe:BeforeOrAfterText>
                     <xsl:text> OR </xsl:text>
                  </_sfe:BeforeOrAfterText>
               </xsl:if>
            </xsl:when>
            <xsl:when test="not((@cat and string(@cat)='comp-of') and (preceding-sibling::pntype[1][@cat='comp-of'])) and ((@cat and string(@cat)='NewMay') and (preceding-sibling::pntype[1][@cat='NewMay']))">
               <!--AddBefore Condition #2-->
               <xsl:if test="not(@_gte:Gentext-Expanded)">
                  <_sfe:BeforeOrAfterText>
                     <xsl:text> OR </xsl:text>
                  </_sfe:BeforeOrAfterText>
               </xsl:if>
            </xsl:when>
            <xsl:when test="(@cat and string(@cat)='comp-of') and (preceding-sibling::pntype[1][@cat='comp-of'])">
               <!--AddBefore Condition #1-->
               <xsl:if test="not(@_gte:Gentext-Expanded)">
                  <_sfe:BeforeOrAfterText>
                     <xsl:text> AND </xsl:text>
                  </_sfe:BeforeOrAfterText>
               </xsl:if>
            </xsl:when>
         </xsl:choose>
         <xsl:apply-templates select="* | text() | processing-instruction()" mode="expand-gentext"/>
      </xsl:copy>
   </xsl:template>

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
            <xsl:when test="not(@cat and string(@cat)='comp-of') and not(@cat and string(@cat)='NewMay') and not(@cat and string(@cat)='rew') and not(@cat and string(@cat)='field') and (@cat and string(@cat)='use-with')">
               <!--AddBefore Condition #5-->
               <xsl:if test="not(@_gte:Gentext-Expanded)">
                  <_sfe:BeforeOrAfterText>
                     <xsl:text>use with P/N </xsl:text>
                  </_sfe:BeforeOrAfterText>
               </xsl:if>
            </xsl:when>
            <xsl:when test="not(@cat and string(@cat)='comp-of') and not(@cat and string(@cat)='NewMay') and not(@cat and string(@cat)='rew') and (@cat and string(@cat)='field')">
               <!--AddBefore Condition #4-->
               <xsl:if test="not(@_gte:Gentext-Expanded)">
                  <_sfe:BeforeOrAfterText>
                     <xsl:text>Field reidentification P/N </xsl:text>
                  </_sfe:BeforeOrAfterText>
               </xsl:if>
            </xsl:when>
            <xsl:when test="not(@cat and string(@cat)='comp-of') and not(@cat and string(@cat)='NewMay') and (@cat and string(@cat)='rew')">
               <!--AddBefore Condition #3-->
               <xsl:if test="not(@_gte:Gentext-Expanded)">
                  <_sfe:BeforeOrAfterText>
                     <xsl:text>Reworked from P/N </xsl:text>
                  </_sfe:BeforeOrAfterText>
               </xsl:if>
            </xsl:when>
            <xsl:when test="not(@cat and string(@cat)='comp-of') and (@cat and string(@cat)='NewMay')">
               <!--AddBefore Condition #2-->
               <xsl:if test="not(@_gte:Gentext-Expanded)">
                  <_sfe:BeforeOrAfterText>
                     <xsl:text>May be obtained by rework of P/N </xsl:text>
                  </_sfe:BeforeOrAfterText>
               </xsl:if>
            </xsl:when>
            <xsl:when test="@cat and string(@cat)='comp-of'">
               <!--AddBefore Condition #1-->
               <xsl:if test="not(@_gte:Gentext-Expanded)">
                  <_sfe:BeforeOrAfterText>
                     <xsl:text>component of P/N </xsl:text>
                  </_sfe:BeforeOrAfterText>
               </xsl:if>
            </xsl:when>
         </xsl:choose>
         <xsl:apply-templates select="* | text() | processing-instruction()" mode="expand-gentext"/>
      </xsl:copy>
   </xsl:template>

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
         <!--Unconditional AddBefore-->
         <xsl:if test="not(@_gte:Gentext-Expanded)">
            <_sfe:BeforeOrAfterText>
               <xsl:text>P&amp;WC P/N: </xsl:text>
            </_sfe:BeforeOrAfterText>
         </xsl:if>
         <xsl:apply-templates select="* | text() | processing-instruction()" mode="expand-gentext"/>
      </xsl:copy>
   </xsl:template>

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
            <xsl:when test="substring-before(.,',') != '0'">
               <!--AddBefore Condition #1-->
               <xsl:if test="not(@_gte:Gentext-Expanded)">
                  <_sfe:BeforeOrAfterText>
                     <xsl:text>USE </xsl:text>
                     <xsl:value-of select="string(substring-before(.,','))"/>
                     <xsl:text> MIN
TO </xsl:text>
                     <xsl:value-of select="string(substring-after(.,','))"/>
                     <xsl:text> MAX.</xsl:text>
                  </_sfe:BeforeOrAfterText>
               </xsl:if>
            </xsl:when>
            <xsl:otherwise>
               <xsl:if test="not(@_gte:Gentext-Expanded)">
                  <_sfe:BeforeOrAfterText>
                     <xsl:text>USE </xsl:text>
                     <xsl:value-of select="string(substring-before(.,','))"/>
                     <xsl:text> TO </xsl:text>
                     <xsl:value-of select="string(substring-after(.,','))"/>
                     <xsl:text> MAX.</xsl:text>
                  </_sfe:BeforeOrAfterText>
               </xsl:if>
            </xsl:otherwise>
         </xsl:choose>
         <xsl:apply-templates select="* | text() | processing-instruction()" mode="expand-gentext"/>
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
                     bullist chapsect-list chapter enumlist figure frontmatter highlights intro list
                     lof lof-item lot lot-item module n-para num-index num-list page-block procedure
                     sblist section service-bull-list spb-list spec-tool-table subject subpara table
                     title-page unlist </xsl:variable>
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
                     bullist chapsect-list chapter enumlist figure frontmatter highlights intro list
                     lof lof-item lot lot-item module n-para num-index num-list page-block procedure
                     sblist section service-bull-list spb-list spec-tool-table subject subpara table
                     title-page unlist </xsl:variable>
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

<xsl:template match="atidlm:resourcepair" mode="expand-gentext" priority="0">
      <xsl:copy>
         <xsl:apply-templates select="@*|node()" mode="expand-gentext"/>
      </xsl:copy>
   </xsl:template>

<xsl:template match="nomen-col/sb-stat[@type='SPB']" mode="expand-gentext" priority="3">
      <xsl:copy>
         <xsl:attribute name="_gte:Gentext-Expanded">y</xsl:attribute>
         <xsl:apply-templates mode="expand-gentext" select="@*"/>
         <xsl:if test="not(@_gte:id)">
            <xsl:attribute name="_gte:id">
               <xsl:value-of select="'_g_'"/>
               <xsl:value-of select="generate-id(.)"/>
            </xsl:attribute>
         </xsl:if>
         <xsl:choose>
            <xsl:when test="not(ancestor::entry/preceding-sibling::entry[2]/*[name()='part-nbr']/@indent='0') and not(ancestor::entry/preceding-sibling::entry[2]/*[name()='part-nbr']/@indent='1') and not(ancestor::entry/preceding-sibling::entry[2]/*[name()='part-nbr']/@indent='2') and not(ancestor::entry/preceding-sibling::entry[2]/*[name()='part-nbr']/@indent='3') and (ancestor::entry/preceding-sibling::entry[2]/*[name()='part-nbr']/@indent='4')">
               <!--AddBefore Condition #5-->
               <xsl:if test="not(@_gte:Gentext-Expanded)">
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
            <xsl:when test="not(ancestor::entry/preceding-sibling::entry[2]/*[name()='part-nbr']/@indent='0') and not(ancestor::entry/preceding-sibling::entry[2]/*[name()='part-nbr']/@indent='1') and not(ancestor::entry/preceding-sibling::entry[2]/*[name()='part-nbr']/@indent='2') and (ancestor::entry/preceding-sibling::entry[2]/*[name()='part-nbr']/@indent='3')">
               <!--AddBefore Condition #4-->
               <xsl:if test="not(@_gte:Gentext-Expanded)">
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
            <xsl:when test="not(ancestor::entry/preceding-sibling::entry[2]/*[name()='part-nbr']/@indent='0') and not(ancestor::entry/preceding-sibling::entry[2]/*[name()='part-nbr']/@indent='1') and (ancestor::entry/preceding-sibling::entry[2]/*[name()='part-nbr']/@indent='2')">
               <!--AddBefore Condition #3-->
               <xsl:if test="not(@_gte:Gentext-Expanded)">
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
            <xsl:when test="not(ancestor::entry/preceding-sibling::entry[2]/*[name()='part-nbr']/@indent='0') and (ancestor::entry/preceding-sibling::entry[2]/*[name()='part-nbr']/@indent='1')">
               <!--AddBefore Condition #2-->
               <xsl:if test="not(@_gte:Gentext-Expanded)">
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
            <xsl:when test="ancestor::entry/preceding-sibling::entry[2]/*[name()='part-nbr']/@indent='0'">
               <!--AddBefore Condition #1-->
               <xsl:if test="not(@_gte:Gentext-Expanded)">
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
         <xsl:apply-templates mode="expand-gentext" select="* | text() | processing-instruction()"/>
      </xsl:copy>
   </xsl:template>

<xsl:template match="nomen-col/sb-stat" mode="expand-gentext" priority="2">
      <xsl:copy>
         <xsl:attribute name="_gte:Gentext-Expanded">y</xsl:attribute>
         <xsl:apply-templates mode="expand-gentext" select="@*"/>
         <xsl:if test="not(@_gte:id)">
            <xsl:attribute name="_gte:id">
               <xsl:value-of select="'_g_'"/>
               <xsl:value-of select="generate-id(.)"/>
            </xsl:attribute>
         </xsl:if>
         <xsl:choose>
            <xsl:when test="not(ancestor::entry/preceding-sibling::entry[2]/*[name()='part-nbr']/@indent='0') and not(ancestor::entry/preceding-sibling::entry[2]/*[name()='part-nbr']/@indent='1') and not(ancestor::entry/preceding-sibling::entry[2]/*[name()='part-nbr']/@indent='2') and not(ancestor::entry/preceding-sibling::entry[2]/*[name()='part-nbr']/@indent='3') and (ancestor::entry/preceding-sibling::entry[2]/*[name()='part-nbr']/@indent='4')">
               <!--AddBefore Condition #5-->
               <xsl:if test="not(@_gte:Gentext-Expanded)">
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
            <xsl:when test="not(ancestor::entry/preceding-sibling::entry[2]/*[name()='part-nbr']/@indent='0') and not(ancestor::entry/preceding-sibling::entry[2]/*[name()='part-nbr']/@indent='1') and not(ancestor::entry/preceding-sibling::entry[2]/*[name()='part-nbr']/@indent='2') and (ancestor::entry/preceding-sibling::entry[2]/*[name()='part-nbr']/@indent='3')">
               <!--AddBefore Condition #4-->
               <xsl:if test="not(@_gte:Gentext-Expanded)">
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
            <xsl:when test="not(ancestor::entry/preceding-sibling::entry[2]/*[name()='part-nbr']/@indent='0') and not(ancestor::entry/preceding-sibling::entry[2]/*[name()='part-nbr']/@indent='1') and (ancestor::entry/preceding-sibling::entry[2]/*[name()='part-nbr']/@indent='2')">
               <!--AddBefore Condition #3-->
               <xsl:if test="not(@_gte:Gentext-Expanded)">
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
            <xsl:when test="not(ancestor::entry/preceding-sibling::entry[2]/*[name()='part-nbr']/@indent='0') and (ancestor::entry/preceding-sibling::entry[2]/*[name()='part-nbr']/@indent='1')">
               <!--AddBefore Condition #2-->
               <xsl:if test="not(@_gte:Gentext-Expanded)">
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
            <xsl:when test="ancestor::entry/preceding-sibling::entry[2]/*[name()='part-nbr']/@indent='0'">
               <!--AddBefore Condition #1-->
               <xsl:if test="not(@_gte:Gentext-Expanded)">
                  <_sfe:BeforeOrAfterText>
                     <_ufe:block-nospace/>
                     <xsl:value-of select="@cond"/>
                     <xsl:text>-</xsl:text>
                     <xsl:value-of select="@type"/>
                  </_sfe:BeforeOrAfterText>
               </xsl:if>
            </xsl:when>
         </xsl:choose>
         <xsl:apply-templates mode="expand-gentext" select="* | text() | processing-instruction()"/>
      </xsl:copy>
   </xsl:template>

<xsl:template match="sb-stat[@type='SPB']" mode="expand-gentext" priority="1">
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
         <xsl:apply-templates mode="expand-gentext" select="* | text() | processing-instruction()"> </xsl:apply-templates>
      </xsl:copy>
   </xsl:template>

<xsl:template match="sb-stat" mode="expand-gentext" priority="0">
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
               <_ufe:block-nospace/>
               <xsl:value-of select="@cond"/>
               <xsl:text>-</xsl:text>
               <xsl:value-of select="@type"/>
            </_sfe:BeforeOrAfterText>
         </xsl:if>
         <xsl:apply-templates mode="expand-gentext" select="* | text() | processing-instruction()"/>
      </xsl:copy>
   </xsl:template>

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
            <xsl:when test="not((@ntype and string(@ntype)='FIGNOTE') and (not(@fignote-nbr))) and not(@ntype and string(@ntype)='FIGNOTE') and not(@ntype and string(@ntype)='FIGNHA') and not(@ntype and string(@ntype)='CHAPFIG') and not(@ntype and string(@ntype)='CHAPFIGBDN') and not(@ntype and string(@ntype)='CHAPFIGNHA') and (@ntype and string(@ntype)='FIGBDN')">
               <!--AddBefore Condition #7-->
               <xsl:if test="not(@_gte:Gentext-Expanded)">
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
            <xsl:when test="not((@ntype and string(@ntype)='FIGNOTE') and (not(@fignote-nbr))) and not(@ntype and string(@ntype)='FIGNOTE') and not(@ntype and string(@ntype)='FIGNHA') and not(@ntype and string(@ntype)='CHAPFIG') and not(@ntype and string(@ntype)='CHAPFIGBDN') and (@ntype and string(@ntype)='CHAPFIGNHA')">
               <!--AddBefore Condition #6-->
               <xsl:if test="not(@_gte:Gentext-Expanded)">
                  <_sfe:BeforeOrAfterText>
                     <_sfe:InternalLink>
                        <xsl:if test="string(./@ref)">
                           <xsl:attribute name="targetId">
                              <xsl:value-of select="string(./@ref)"/>
                           </xsl:attribute>
                        </xsl:if>
                        <xsl:text>SEE </xsl:text>
                        <xsl:value-of select="string(substring-before(.,' '))"/>
                        <xsl:text> FIG.</xsl:text>
                        <xsl:value-of select="string(substring-after(.,' '))"/>
                        <xsl:text> FOR NHA</xsl:text>
                     </_sfe:InternalLink>
                  </_sfe:BeforeOrAfterText>
               </xsl:if>
            </xsl:when>
            <xsl:when test="not((@ntype and string(@ntype)='FIGNOTE') and (not(@fignote-nbr))) and not(@ntype and string(@ntype)='FIGNOTE') and not(@ntype and string(@ntype)='FIGNHA') and not(@ntype and string(@ntype)='CHAPFIG') and (@ntype and string(@ntype)='CHAPFIGBDN')">
               <!--AddBefore Condition #5-->
               <xsl:if test="not(@_gte:Gentext-Expanded)">
                  <_sfe:BeforeOrAfterText>
                     <_sfe:InternalLink>
                        <xsl:if test="string(./@ref)">
                           <xsl:attribute name="targetId">
                              <xsl:value-of select="string(./@ref)"/>
                           </xsl:attribute>
                        </xsl:if>
                        <xsl:text>SEE </xsl:text>
                        <xsl:value-of select="string(substring-before(.,' '))"/>
                        <xsl:text> FIG.</xsl:text>
                        <xsl:value-of select="string(substring-after(.,' '))"/>
                        <xsl:text> FOR BREAKDOWN</xsl:text>
                     </_sfe:InternalLink>
                  </_sfe:BeforeOrAfterText>
               </xsl:if>
            </xsl:when>
            <xsl:when test="not((@ntype and string(@ntype)='FIGNOTE') and (not(@fignote-nbr))) and not(@ntype and string(@ntype)='FIGNOTE') and not(@ntype and string(@ntype)='FIGNHA') and (@ntype and string(@ntype)='CHAPFIG')">
               <!--AddBefore Condition #4-->
               <xsl:if test="not(@_gte:Gentext-Expanded)">
                  <_sfe:BeforeOrAfterText>
                     <_sfe:InternalLink>
                        <xsl:if test="string(./@ref)">
                           <xsl:attribute name="targetId">
                              <xsl:value-of select="string(./@ref)"/>
                           </xsl:attribute>
                        </xsl:if>
                        <xsl:text>SEE </xsl:text>
                        <xsl:value-of select="string(substring-before(.,' '))"/>
                        <xsl:text> FIG.</xsl:text>
                        <xsl:value-of select="string(substring-after(.,' '))"/>
                     </_sfe:InternalLink>
                  </_sfe:BeforeOrAfterText>
               </xsl:if>
            </xsl:when>
            <xsl:when test="not((@ntype and string(@ntype)='FIGNOTE') and (not(@fignote-nbr))) and not(@ntype and string(@ntype)='FIGNOTE') and (@ntype and string(@ntype)='FIGNHA')">
               <!--AddBefore Condition #3-->
               <xsl:if test="not(@_gte:Gentext-Expanded)">
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
            <xsl:when test="not((@ntype and string(@ntype)='FIGNOTE') and (not(@fignote-nbr))) and (@ntype and string(@ntype)='FIGNOTE')">
               <!--AddBefore Condition #2-->
               <xsl:if test="not(@_gte:Gentext-Expanded)">
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
            <xsl:when test="(@ntype and string(@ntype)='FIGNOTE') and (not(@fignote-nbr))">
               <!--AddBefore Condition #1-->
               <xsl:if test="not(@_gte:Gentext-Expanded)">
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
            <xsl:when test="not((@ntype and string(@ntype)='FIGNOTE') and (not(@fignote-nbr))) and not(@ntype and string(@ntype)='FIGNOTE') and not(@ntype and string(@ntype)='FIGNHA') and not(@ntype and string(@ntype)='CHAPFIG') and not(@ntype and string(@ntype)='CHAPFIGBDN') and not(@ntype and string(@ntype)='CHAPFIGNHA') and (@ntype and string(@ntype)='FIGBDN')">
               <!--AddAfter Condition #7-->
               <xsl:if test="not(@_gte:Gentext-Expanded)">
                  <_sfe:BeforeOrAfterText/>
               </xsl:if>
            </xsl:when>
            <xsl:when test="not((@ntype and string(@ntype)='FIGNOTE') and (not(@fignote-nbr))) and not(@ntype and string(@ntype)='FIGNOTE') and not(@ntype and string(@ntype)='FIGNHA') and not(@ntype and string(@ntype)='CHAPFIG') and not(@ntype and string(@ntype)='CHAPFIGBDN') and (@ntype and string(@ntype)='CHAPFIGNHA')"><!--AddAfter Condition #6--></xsl:when>
            <xsl:when test="not((@ntype and string(@ntype)='FIGNOTE') and (not(@fignote-nbr))) and not(@ntype and string(@ntype)='FIGNOTE') and not(@ntype and string(@ntype)='FIGNHA') and not(@ntype and string(@ntype)='CHAPFIG') and (@ntype and string(@ntype)='CHAPFIGBDN')"><!--AddAfter Condition #5--></xsl:when>
            <xsl:when test="not((@ntype and string(@ntype)='FIGNOTE') and (not(@fignote-nbr))) and not(@ntype and string(@ntype)='FIGNOTE') and not(@ntype and string(@ntype)='FIGNHA') and (@ntype and string(@ntype)='CHAPFIG')"><!--AddAfter Condition #4--></xsl:when>
            <xsl:when test="not((@ntype and string(@ntype)='FIGNOTE') and (not(@fignote-nbr))) and not(@ntype and string(@ntype)='FIGNOTE') and (@ntype and string(@ntype)='FIGNHA')">
               <!--AddAfter Condition #3-->
               <xsl:if test="not(@_gte:Gentext-Expanded)">
                  <_sfe:BeforeOrAfterText/>
               </xsl:if>
            </xsl:when>
            <xsl:when test="not((@ntype and string(@ntype)='FIGNOTE') and (not(@fignote-nbr))) and (@ntype and string(@ntype)='FIGNOTE')"><!--AddAfter Condition #2--></xsl:when>
            <xsl:when test="(@ntype and string(@ntype)='FIGNOTE') and (not(@fignote-nbr))"><!--AddAfter Condition #1--></xsl:when>
         </xsl:choose>
      </xsl:copy>
   </xsl:template>

<xsl:template match="service-bull-list" mode="expand-gentext" priority="0">
      <xsl:copy>
         <xsl:apply-templates select="@*|node()" mode="expand-gentext"/>
      </xsl:copy>
   </xsl:template>

<xsl:template match="atidlm:source" mode="expand-gentext" priority="0">
      <xsl:copy>
         <xsl:apply-templates select="@*|node()" mode="expand-gentext"/>
      </xsl:copy>
   </xsl:template>

<xsl:template match="spb-item" mode="expand-gentext" priority="0">
      <xsl:copy>
         <xsl:apply-templates select="@*|node()" mode="expand-gentext"/>
      </xsl:copy>
   </xsl:template>

<xsl:template match="spb-list" mode="expand-gentext" priority="0">
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
         <!--Unconditional AddBefore-->
         <xsl:if test="not(@_gte:Gentext-Expanded)">
            <_sfe:BeforeOrAfterText>
               <xsl:text>ATTACHING PARTS</xsl:text>
            </_sfe:BeforeOrAfterText>
         </xsl:if>
         <xsl:apply-templates select="* | text() | processing-instruction()" mode="expand-gentext"/>
         <!--Unconditional AddAfter-->
         <xsl:if test="not(@_gte:Gentext-Expanded)">
            <_sfe:BeforeOrAfterText>
               <xsl:processing-instruction name="Pub">_newline</xsl:processing-instruction>
               <xsl:text>------ * ------</xsl:text>
            </_sfe:BeforeOrAfterText>
         </xsl:if>
      </xsl:copy>
   </xsl:template>

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
         <!--Unconditional AddBefore-->
         <xsl:if test="not(@_gte:Gentext-Expanded)">
            <_sfe:BeforeOrAfterText>
               <xsl:text>SUPPLIER CODE: </xsl:text>
            </_sfe:BeforeOrAfterText>
         </xsl:if>
         <xsl:apply-templates select="* | text() | processing-instruction()" mode="expand-gentext"/>
      </xsl:copy>
   </xsl:template>

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
         <!--Unconditional AddBefore-->
         <xsl:if test="not(@_gte:Gentext-Expanded)">
            <_sfe:BeforeOrAfterText>
               <xsl:text>SUPPLIER P/N </xsl:text>
            </_sfe:BeforeOrAfterText>
         </xsl:if>
         <xsl:apply-templates select="* | text() | processing-instruction()" mode="expand-gentext"/>
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
         <xsl:attribute name="_gte:unhidden-title">yes</xsl:attribute>
         <xsl:apply-templates select="@*|node()" mode="expand-gentext"/>
      </xsl:copy>
   </xsl:template>

<xsl:template match="lof/title" mode="expand-gentext" priority="18">
      <xsl:copy>
         <xsl:attribute name="_gte:unhidden-title">yes</xsl:attribute>
         <xsl:apply-templates select="@*|node()" mode="expand-gentext"/>
      </xsl:copy>
   </xsl:template>

<xsl:template match="spb-list/title" mode="expand-gentext" priority="14">
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

<xsl:template match="service-bull-list/title" mode="expand-gentext" priority="10">
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

<xsl:template match="module/title" mode="expand-gentext" priority="9">
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

<xsl:template match="num-index/title" mode="expand-gentext" priority="7">
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

<xsl:template match="unit-title" mode="expand-gentext" priority="0">
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
                     bullist chapsect-list chapter enumlist figure frontmatter highlights intro list
                     lof lof-item lot lot-item module n-para num-index num-list page-block procedure
                     sblist section service-bull-list spb-list spec-tool-table subject subpara table
                     title-page unlist </xsl:variable>
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
                     bullist chapsect-list chapter enumlist figure frontmatter highlights intro list
                     lof lof-item lot lot-item module n-para num-index num-list page-block procedure
                     sblist section service-bull-list spb-list spec-tool-table subject subpara table
                     title-page unlist </xsl:variable>
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
                     bullist chapsect-list chapter enumlist figure frontmatter highlights intro list
                     lof lof-item lot lot-item module n-para num-index num-list page-block procedure
                     sblist section service-bull-list spb-list spec-tool-table subject subpara table
                     title-page unlist </xsl:variable>
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
                     bullist chapsect-list chapter enumlist figure frontmatter highlights intro list
                     lof lof-item lot lot-item module n-para num-index num-list page-block procedure
                     sblist section service-bull-list spb-list spec-tool-table subject subpara table
                     title-page unlist </xsl:variable>
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
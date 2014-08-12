<?xml version="1.0" encoding="UTF-8"?>

<xsl:stylesheet
  xmlns="http://www.w3.org/1999/xhtml" 
  xmlns:exslt="http://exslt.org/common"
  xmlns:xsl="http://www.w3.org/1999/XSL/Transform" 
  xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
  xmlns:atidlm="http://www.arbortext.com/namespace/atidlm"   
  xmlns:_gte="http://www.arbortext.com/namespace/Styler/GeneratedTextElements"
  xmlns:_ufe="http://www.arbortext.com/namespace/Styler/UserFormattingElements" 
  xmlns:_sfe="http://www.arbortext.com/namespace/Styler/StylerFormattingElements" 
  version="1.0" 
  exclude-result-prefixes="xml xsi exslt _ufe _sfe _gte atidlm">
  
  <xsl:template match="adt" mode="expand-gentext" priority="0">
    <xsl:call-template name="expand-gentext">
      <xsl:with-param name="content">
        <xsl:choose>
          <xsl:when test="not(./text()[normalize-space(.)!=''])"/>
          <xsl:otherwise>
            <xsl:text>, </xsl:text>
          </xsl:otherwise>
        </xsl:choose>
      </xsl:with-param>
    </xsl:call-template>
  </xsl:template>

  <xsl:template match="buildspec" mode="expand-gentext" priority="0">
    <xsl:call-template name="expand-gentext">
      <xsl:with-param name="content">
        <xsl:text>Build Specification No. </xsl:text>
      </xsl:with-param>
    </xsl:call-template>
  </xsl:template>

  <xsl:template match="dd" mode="expand-gentext" priority="0">
    <xsl:call-template name="expand-gentext">
      <xsl:with-param name="content">
        <xsl:if test="not(ancestor::*[not(self::_sfe:BeforeOrAfterText)][1]/adt|ancestor::*[not(self::_sfe:BeforeOrAfterText)][1]/*[not(self::_sfe:BeforeOrAfterText)]//adt)">
          <xsl:text> </xsl:text>
        </xsl:if>
      </xsl:with-param>
    </xsl:call-template>
  </xsl:template>

  <xsl:template match="glossary" mode="expand-gentext" priority="0">
    <xsl:call-template name="expand-gentext">
      <xsl:with-param name="content">
        <_ufe:glossary-title/>
      </xsl:with-param>
    </xsl:call-template>
  </xsl:template>

  <xsl:template match="intro//graphic" mode="expand-gentext" priority="1">
    <xsl:call-template name="expand-gentext-default"/>
  </xsl:template>

  <xsl:template match="graphic" mode="expand-gentext" priority="0">
    <xsl:call-template name="expand-gentext">
      <xsl:with-param name="content">
        <xsl:if test="(ancestor-or-self::figure[1]//title)[1]">
          <_gte:Gentexted-Content-Wrapper>
            <xsl:apply-templates mode="expand-gentext" select="(ancestor-or-self::figure[1]//title)[1]">
              <xsl:with-param name="skip-expanded-gentext" select="'yes'"/>
            </xsl:apply-templates>
          </_gte:Gentexted-Content-Wrapper>
        </xsl:if>
      </xsl:with-param>
    </xsl:call-template>
  </xsl:template>

  <xsl:template match="itemspec" mode="expand-gentext" priority="0">
    <xsl:call-template name="expand-gentext">
      <xsl:with-param name="content">
        <xsl:choose>
          <xsl:when test="@indent=number('4')">
            <xsl:text>▪▪▪▪ </xsl:text>
          </xsl:when>
          <xsl:when test="@indent='3'">
            <xsl:text>▪▪▪ </xsl:text>
          </xsl:when>
          <xsl:when test="@indent='2'">
            <xsl:text>▪▪ </xsl:text>
          </xsl:when>
          <xsl:when test="@indent='1'">
            <xsl:text>▪ </xsl:text>
          </xsl:when>
        </xsl:choose>
      </xsl:with-param>
    </xsl:call-template>
  </xsl:template>

  <xsl:template match="mfr" mode="expand-gentext" priority="0">
    <xsl:call-template name="expand-gentext">
      <xsl:with-param name="content">
        <xsl:text>SUPPLIER CODE: </xsl:text>
      </xsl:with-param>
    </xsl:call-template>
  </xsl:template>

  <xsl:template match="module/note" mode="expand-gentext" priority="11">
    <xsl:call-template name="expand-gentext">
      <xsl:with-param name="content">
        <span style="font-weight: bold; text-decoration: underline; ">
          <xsl:text>NOTE</xsl:text>
        </span>
        <xsl:text>: </xsl:text>
      </xsl:with-param>
    </xsl:call-template>
  </xsl:template>

  <xsl:template match="subtask/note" mode="expand-gentext" priority="10">
    <xsl:call-template name="expand-gentext">
      <xsl:with-param name="content">
        <span style="font-weight: bold; text-decoration: underline; ">
          <xsl:text>NOTE</xsl:text>
        </span>
        <xsl:text>: </xsl:text>
      </xsl:with-param>
    </xsl:call-template>
  </xsl:template>

  <xsl:template match="task/note" mode="expand-gentext" priority="9">
    <xsl:call-template name="expand-gentext">
      <xsl:with-param name="content">
        <span style="font-weight: bold; text-decoration: underline; ">
          <xsl:text>NOTE</xsl:text>
        </span>
        <xsl:text>: </xsl:text>
      </xsl:with-param>
    </xsl:call-template>
  </xsl:template>

  <xsl:template match="n-para/note" mode="expand-gentext" priority="8">
    <xsl:call-template name="expand-gentext">
      <xsl:with-param name="content">
        <xsl:choose>
          <xsl:when test="@nbr">
            <span style="font-weight: bold; text-decoration: underline; ">
              <xsl:text>NOTE</xsl:text>
            </span>
            <xsl:text>: </xsl:text>
            <xsl:value-of select="@nbr"/>
            <xsl:text>. </xsl:text>
          </xsl:when>
          <xsl:otherwise>
            <span style="font-weight: bold; text-decoration: underline; ">
              <xsl:text>NOTE</xsl:text>
            </span>
            <xsl:text>: </xsl:text>
          </xsl:otherwise>
        </xsl:choose>
      </xsl:with-param>
    </xsl:call-template>
  </xsl:template>

  <xsl:template match="procedure/note" mode="expand-gentext" priority="7">
    <xsl:call-template name="expand-gentext">
      <xsl:with-param name="content">
        <xsl:choose>
          <xsl:when test="@nbr">
            <span style="font-weight: bold; text-decoration: underline; ">
              <xsl:text>NOTE</xsl:text>
            </span>
            <xsl:text>: </xsl:text>
            <xsl:value-of select="@nbr"/>
            <xsl:text>. </xsl:text>
          </xsl:when>
          <xsl:otherwise>
            <span style="font-weight: bold; text-decoration: underline; ">
              <xsl:text>NOTE</xsl:text>
            </span>
            <xsl:text>: </xsl:text>
          </xsl:otherwise>
        </xsl:choose>
      </xsl:with-param>
    </xsl:call-template>
  </xsl:template>

  <xsl:template match="fandc/note" mode="expand-gentext" priority="6">
    <xsl:call-template name="expand-gentext-default"/>
  </xsl:template>

  <xsl:template match="spec-assem/note" mode="expand-gentext" priority="5">
    <xsl:call-template name="expand-gentext-default"/>
  </xsl:template>

  <xsl:template match="spring-pressure/note" mode="expand-gentext" priority="4">
    <xsl:call-template name="expand-gentext-default"/>
  </xsl:template>

  <xsl:template match="torque-and-stretch/note" mode="expand-gentext" priority="3">
    <xsl:call-template name="expand-gentext-default"/>
  </xsl:template>

  <xsl:template match="fits-and-clears/note" mode="expand-gentext" priority="2">
    <xsl:call-template name="expand-gentext-default"/>
  </xsl:template>

  <xsl:template match="note[ancestor::subpara]" mode="expand-gentext" priority="1">
    <xsl:call-template name="expand-gentext">
      <xsl:with-param name="content">
        <xsl:choose>
          <xsl:when test="@nbr">
            <span style="font-weight: bold; text-decoration: underline; ">
              <xsl:text>NOTE</xsl:text>
            </span>
            <xsl:text>: </xsl:text>
            <xsl:value-of select="@nbr"/>
            <xsl:text>. </xsl:text>

          </xsl:when>
          <xsl:otherwise>
            <span style="font-weight: bold; text-decoration: underline; ">
              <xsl:text>NOTE</xsl:text>
            </span>
            <xsl:text>: </xsl:text>
          </xsl:otherwise>
        </xsl:choose>
      </xsl:with-param>
    </xsl:call-template>
  </xsl:template>

  <xsl:template match="note" mode="expand-gentext" priority="0">
    <xsl:call-template name="expand-gentext">
      <xsl:with-param name="content">
        <xsl:choose>
          <xsl:when test="@nbr">
            <span style="font-weight: bold; text-decoration: underline; ">
              <xsl:text>NOTE</xsl:text>
            </span>
            <xsl:text>: </xsl:text>
            <xsl:value-of select="@nbr"/>
            <xsl:text>. </xsl:text>
          </xsl:when>
          <xsl:otherwise>
            <span style="font-weight: bold; text-decoration: underline; ">
              <xsl:text>NOTE</xsl:text>
            </span>
            <xsl:text>: </xsl:text>
          </xsl:otherwise>
        </xsl:choose>
      </xsl:with-param>
    </xsl:call-template>
  </xsl:template>

  <xsl:template match="pwc-title" mode="expand-gentext" priority="0">
    <xsl:call-template name="expand-gentext3">
      <xsl:with-param name="content-before">
        <_ufe:engine-type>
          <xsl:if test="string(./@enginetype)">
            <xsl:attribute name="enginetype">
              <xsl:value-of select="string(./@enginetype)"/>
            </xsl:attribute>
          </xsl:if>
        </_ufe:engine-type>
        <xsl:text>Model(s)</xsl:text>
      </xsl:with-param>
      <xsl:with-param name="content-after">
        <span style="color: #666666; ">
          <_ufe:title-block>
            <xsl:text>Manual Part No. </xsl:text>
            <xsl:value-of select="@docnbr"/>
          </_ufe:title-block>
          <_ufe:title-block>
            <xsl:text>Original Issue Date </xsl:text>
            <xsl:call-template name="FormatDate">
              <xsl:with-param name="DateTime" select="@oidate"/>
              <xsl:with-param name="DateFormat">dmy</xsl:with-param>
            </xsl:call-template>
          </_ufe:title-block>
        </span>
        <_ufe:proprietary-notice/>
      </xsl:with-param>
    </xsl:call-template>
  </xsl:template>

  <xsl:template match="pwcatanbr" mode="expand-gentext" priority="0">
    <xsl:call-template name="expand-gentext3">
      <xsl:with-param name="content-before">
        <xsl:text>(</xsl:text>
      </xsl:with-param>
      <xsl:with-param name="content-after">
        <xsl:text>)</xsl:text>
      </xsl:with-param>
    </xsl:call-template>
  </xsl:template>

  <xsl:template match="pwcbrk" mode="expand-gentext" priority="0">
    <xsl:call-template name="expand-gentext">
      <xsl:with-param name="content">
        <xsl:processing-instruction name="Pub">_newline</xsl:processing-instruction>
      </xsl:with-param>
    </xsl:call-template>
  </xsl:template>

  <xsl:template match="pwcchapsect-list" mode="expand-gentext" priority="0">
    <xsl:call-template name="expand-gentext">
      <xsl:with-param name="content">
        <_ufe:chapsect-title/>
      </xsl:with-param>
    </xsl:call-template>
  </xsl:template>

  <xsl:template match="pwcspbnbr" mode="expand-gentext" priority="0">
    <xsl:call-template name="expand-gentext">
      <xsl:with-param name="content">
        <xsl:value-of select="@spbtype"/>
        <xsl:text>-</xsl:text>
      </xsl:with-param>
    </xsl:call-template>
  </xsl:template>

  <xsl:template match="refint[id(@refid)/self::table]" mode="expand-gentext" priority="3">
    <xsl:call-template name="expand-gentext2">
      <xsl:with-param name="content">
        <_sfe:CrossReference>
          <_gte:Link linkRef="{@refid}">
            <_gte:deferredCrossReference xrefStyle="Number" refed-id="{@refid}"/>
          </_gte:Link>
        </_sfe:CrossReference>
        <xsl:value-of select="@post-auto-text"/>
      </xsl:with-param>
    </xsl:call-template>
  </xsl:template>

  <xsl:template match="sbnbr" mode="expand-gentext" priority="1">
    <xsl:call-template name="expand-gentext">
      <xsl:with-param name="content">
        <xsl:value-of select="@sbtype"/>
        <xsl:text>-</xsl:text>
      </xsl:with-param>
    </xsl:call-template>
  </xsl:template>

  <xsl:template match="sheet" mode="expand-gentext" priority="0">
    <xsl:choose>
      <xsl:when test="not(@size) or @size!='big'">
        <xsl:if test="not(@_gte:Gentext-Expanded)">
          <_sfe:BeforeOrAfterText/>
        </xsl:if>
      </xsl:when>
      <xsl:otherwise>
        <xsl:if test="not(@_gte:Gentext-Expanded)">
          <_sfe:BeforeOrAfterText>
            <_ufe:block-prespace>
              <xsl:text>(SHEET </xsl:text>
              <xsl:value-of select="@sheetnbr"/>
              <xsl:text> OF </xsl:text>
              <xsl:value-of select="(ancestor-or-self::graphic[1]//sheet)[position()=last()]/@sheetnbr"/>
              <xsl:text>)</xsl:text>
            </_ufe:block-prespace>
          </_sfe:BeforeOrAfterText>
        </xsl:if>
      </xsl:otherwise>
    </xsl:choose>
    <xsl:copy>
      <xsl:attribute name="_gte:Gentext-Expanded">y</xsl:attribute>
      <xsl:apply-templates mode="expand-gentext" select="@*|node()"/>
    </xsl:copy>
  </xsl:template>

  <xsl:template match="numlist/step" mode="expand-gentext" priority="3">
    <xsl:call-template name="expand-gentext-numbering"/>
  </xsl:template>

  <xsl:template match="procedure//step" mode="expand-gentext" priority="2">
    <xsl:call-template name="expand-gentext-numbering3"/>
  </xsl:template>

  <xsl:template match="step[table/@tabstyle='frac']" mode="expand-gentext" priority="1">
    <xsl:call-template name="expand-gentext-numbering2"/>
  </xsl:template>

  <xsl:template match="numlist/step2" mode="expand-gentext" priority="2">
    <xsl:call-template name="expand-gentext-numbering"/>
  </xsl:template>

  <xsl:template match="step2" mode="expand-gentext" priority="0">
    <xsl:call-template name="expand-gentext-numbering5"/>
  </xsl:template>

  <xsl:template match="numlist/step3" mode="expand-gentext" priority="2">
    <xsl:call-template name="expand-gentext">
      <xsl:with-param name="content">
        <span style="text-decoration: underline; ">
          <xsl:call-template name="t-styler-numbering"/>
        </span>
      </xsl:with-param>
    </xsl:call-template>
  </xsl:template>

  <xsl:template match="step3" mode="expand-gentext" priority="0">
    <xsl:call-template name="expand-gentext-numbering2"/>
  </xsl:template>

  <xsl:template match="numlist/step4" mode="expand-gentext" priority="2">
    <xsl:call-template name="expand-gentext">
      <xsl:with-param name="content">
        <span style="text-decoration: underline; ">
          <xsl:call-template name="t-styler-numbering"/>
        </span>
      </xsl:with-param>
    </xsl:call-template>
  </xsl:template>

  <xsl:template match="step4" mode="expand-gentext" priority="0">
    <xsl:call-template name="expand-gentext-numbering2"/>
  </xsl:template>

  <xsl:template match="numlist/step5" mode="expand-gentext" priority="2">
    <xsl:call-template name="expand-gentext-expanded"/>
  </xsl:template>

  <xsl:template match="step5[table/@tabstyle='frac']" mode="expand-gentext" priority="1">
    <xsl:call-template name="expand-gentext-expanded"/>
  </xsl:template>

  <xsl:template match="module[@module-name='Airworthiness_Limits']/pgblk/title" mode="expand-gentext" priority="65">
    <xsl:call-template name="expand-gentext-default"/>
  </xsl:template>

  <xsl:template match="page-block[@pb-name='ni']//mfmatr/title" mode="expand-gentext" priority="56">
    <xsl:call-template name="expand-gentext-default"/>
  </xsl:template>

  <xsl:template match="page-block[@pb-name='record-of-revisions']//n-para/title" mode="expand-gentext" priority="55">
    <xsl:call-template name="expand-gentext-expanded"/>
  </xsl:template>

  <xsl:template match="pbfmatr/title" mode="expand-gentext" priority="40">
    <xsl:call-template name="expand-gentext">     
      <xsl:with-param name="content">
        <xsl:choose>
          <xsl:when test="((ancestor-or-self::pwcpbfront[1]/title)) and ((ancestor-or-self::pwcpbfront[1]/pbfmatr))"/>
          <xsl:otherwise>
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
          </xsl:otherwise>
        </xsl:choose>
      </xsl:with-param>
    </xsl:call-template>
  </xsl:template>

  <xsl:template match="pwcpbfront/title" mode="expand-gentext" priority="39">
    <xsl:call-template name="expand-gentext-default"/>
  </xsl:template>

  <xsl:template match="intro/title" mode="expand-gentext" priority="36">
    <xsl:call-template name="expand-gentext-expanded"/>
  </xsl:template>

  <xsl:template match="pwcspblist/title" mode="expand-gentext" priority="35">
    <xsl:call-template name="expand-gentext-default"/>
  </xsl:template>

  <xsl:template match="sblist/title" mode="expand-gentext" priority="32">
    <xsl:call-template name="expand-gentext-expanded"/>
  </xsl:template>

  <xsl:template match="pwcni/title" mode="expand-gentext" priority="31">
    <xsl:call-template name="expand-gentext-default"/>
  </xsl:template>

  <xsl:template match="vendlist/title" mode="expand-gentext" priority="30">
    <xsl:call-template name="expand-gentext-expanded"/>
  </xsl:template>

  <xsl:template match="lof-item/title" mode="expand-gentext" priority="21">
    <xsl:call-template name="expand-gentext-expanded"/>
  </xsl:template>

  <xsl:template match="lof/title" mode="expand-gentext" priority="18">
    <xsl:call-template name="expand-gentext-expanded"/>
  </xsl:template>

  <xsl:template match="spb-list/title" mode="expand-gentext" priority="14">
    <xsl:call-template name="expand-gentext-default"/>
  </xsl:template>

  <xsl:template match="service-bull-list/title" mode="expand-gentext" priority="10">
    <xsl:call-template name="expand-gentext-default"/>
  </xsl:template>

  <xsl:template match="module/title" mode="expand-gentext" priority="9">
    <xsl:call-template name="expand-gentext-expanded"/>
  </xsl:template>

  <xsl:template match="num-index/title" mode="expand-gentext" priority="7">
    <xsl:call-template name="expand-gentext-default"/>
  </xsl:template>

  <xsl:template match="upa" mode="expand-gentext" priority="0">
    <xsl:call-template name="expand-gentext">
      <xsl:with-param name="content">
        <xsl:if test="(ancestor-or-self::entry[1]//np)[1]/*|(ancestor-or-self::entry[1]//np)[1]/text()|(ancestor-or-self::entry[1]//np)[1]/processing-instruction()">
          <_gte:Gentexted-Content-Wrapper>
            <xsl:apply-templates mode="expand-gentext" select="(ancestor-or-self::entry[1]//np)[1]/*|(ancestor-or-self::entry[1]//np)[1]/text()|(ancestor-or-self::entry[1]//np)[1]/processing-instruction()">
              <xsl:with-param name="skip-expanded-gentext" select="'yes'"/>
            </xsl:apply-templates>
          </_gte:Gentexted-Content-Wrapper>
        </xsl:if>
      </xsl:with-param>
    </xsl:call-template>
  </xsl:template>

  <xsl:template match="table/title/xref[id(@ref)/self::figure]" mode="expand-gentext" priority="7">    
    <xsl:call-template name="expand-gentext">
      <xsl:with-param name="content">
        <_sfe:CrossReference>
          <_gte:Link linkRef="{@ref}">
<!--             <_gte:deferredCrossReference xrefStyle="Number" refed-id="{@ref}"/> -->
			<xsl:variable name="refed-id" select="@ref"/>
            <xsl:choose>
              <xsl:when test="//*[@_gte:id=$refed-id]/title">
                <xsl:apply-templates select="//*[@_gte:id=$refed-id]/title" mode="styler_xref-Number"/>
              </xsl:when>
              <xsl:otherwise>
                <xsl:apply-templates select="//*[@_gte:id=$refed-id]/_sfe:BeforeOrAfterText//*[contains(name(), 'title')]" mode="styler_xref-Number"/>
              </xsl:otherwise>
            </xsl:choose>
          </_gte:Link>
        </_sfe:CrossReference>
      </xsl:with-param>
    </xsl:call-template>
  </xsl:template>
  
  <xsl:template match="xref[name(id(@ref))='table' and (id(@ref)/ancestor::figure or id(@ref)/ancestor::graphic)]" mode="expand-gentext" priority="3">
    <xsl:call-template name="expand-gentext">
      <xsl:with-param name="content">
        <_sfe:CrossReference>
          <_gte:Link linkRef="{@ref}">
<!--             <_gte:deferredCrossReference xrefStyle="Number" refed-id="{@ref}"/> -->
			<xsl:variable name="refed-id" select="@ref"/>
            <xsl:choose>
              <xsl:when test="//*[@_gte:id=$refed-id]/title">
                <xsl:apply-templates select="//*[@_gte:id=$refed-id]/title" mode="styler_xref-Number"/>
              </xsl:when>
              <xsl:otherwise>
                <xsl:apply-templates select="//*[@_gte:id=$refed-id]/_sfe:BeforeOrAfterText//*[contains(name(), 'title')]" mode="styler_xref-Number"/>
              </xsl:otherwise>
            </xsl:choose>
          </_gte:Link>
        </_sfe:CrossReference>
        <xsl:text> </xsl:text>
      </xsl:with-param>
    </xsl:call-template>
  </xsl:template>
  
  <xsl:template match="xref[id(@ref)/self::table]" mode="expand-gentext" priority="2">
    <xsl:call-template name="expand-gentext">
      <xsl:with-param name="content">
        <_sfe:CrossReference>
          <_gte:Link linkRef="{@ref}">
<!--             <_gte:deferredCrossReference xrefStyle="Number" refed-id="{@ref}"/> -->
			<xsl:variable name="refed-id" select="@ref"/>
            <xsl:choose>
              <xsl:when test="//*[@_gte:id=$refed-id]/title">
                <xsl:apply-templates select="//*[@_gte:id=$refed-id]/title" mode="styler_xref-Number"/>
              </xsl:when>
              <xsl:otherwise>
                <xsl:apply-templates select="//*[@_gte:id=$refed-id]/_sfe:BeforeOrAfterText//*[contains(name(), 'title')]" mode="styler_xref-Number"/>
              </xsl:otherwise>
            </xsl:choose>
          </_gte:Link>
        </_sfe:CrossReference>
        <xsl:text> </xsl:text>
      </xsl:with-param>
    </xsl:call-template>  
  </xsl:template>
  
  <xsl:template match="xref" mode="expand-gentext" priority="0">
    <xsl:call-template name="expand-gentext2">
      <xsl:with-param name="content">
        <_sfe:CrossReference>
          <xsl:variable name="division-name-token-list"> alpha-list ata-page-block book bullist chapsect-list chapter enumlist figure frontmatter glossary graphic highlights intro list lof lof-item lot lot-item module n-para num-index num-list nutopt page-block procedure pwcchapsect-list sbdata sblist section spec-tool-table subject subpara table title-page unlist vendlist </xsl:variable>
          <xsl:variable name="refed-id" select="@ref"/>
          <xsl:variable name="idrefed-element-name" select="concat(' ',name((//*[@_gte:id=$refed-id])[1]),' ')"/>
          <_gte:Link linkRef="{@ref}">
            <xsl:choose>
              <xsl:when test="contains($division-name-token-list,$idrefed-element-name)">
<!--                 <_gte:deferredCrossReference xrefStyle="Number" refed-id="{@ref}"/> -->
	            <xsl:choose>
	              <xsl:when test="//*[@_gte:id=$refed-id]/title">
	                <xsl:apply-templates select="//*[@_gte:id=$refed-id]/title" mode="styler_xref-Number"/>
	              </xsl:when>
	              <xsl:otherwise>
	                <xsl:apply-templates select="//*[@_gte:id=$refed-id]/_sfe:BeforeOrAfterText//*[contains(name(), 'title')]" mode="styler_xref-Number"/>
	              </xsl:otherwise>
	            </xsl:choose>
              </xsl:when>
              <xsl:otherwise>
                <xsl:apply-templates select="(//*[@_gte:id=$refed-id])[1]" mode="styler_xref-Number"/>
              </xsl:otherwise>
            </xsl:choose>
          </_gte:Link>
        </_sfe:CrossReference>
      </xsl:with-param>
    </xsl:call-template>
  </xsl:template>

</xsl:stylesheet>

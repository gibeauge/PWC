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

  <xsl:template match="build-spec" mode="expand-gentext" priority="0">
    <xsl:call-template name="expand-gentext">
      <xsl:with-param name="content">
        <xsl:text>BS</xsl:text>
      </xsl:with-param>
    </xsl:call-template>
  </xsl:template>

  <xsl:template match="consumables" mode="expand-gentext" priority="0">
    <xsl:call-template name="expand-gentext">
      <xsl:with-param name="content">
        <_ufe:consumables-title/>
        <xsl:if test="@empty='YES'">
          <_ufe:not-applicable/>
        </xsl:if>
      </xsl:with-param>
    </xsl:call-template>
  </xsl:template>

  <xsl:template match="fixtures-and-equipment" mode="expand-gentext" priority="0">
    <xsl:call-template name="expand-gentext">
      <xsl:with-param name="content">
        <_ufe:fixequ-title/>
        <xsl:if test="@empty='YES'">
          <_ufe:not-applicable/>
        </xsl:if>
      </xsl:with-param>
    </xsl:call-template>
  </xsl:template>

  <xsl:template match="general" mode="expand-gentext" priority="0">
    <xsl:call-template name="expand-gentext">
      <xsl:with-param name="content">
        <_ufe:general-title/>
      </xsl:with-param>
    </xsl:call-template>
  </xsl:template>

  <xsl:template match="graphic" mode="expand-gentext" priority="0">
    <xsl:if test="not(@_gte:Gentext-Expanded)">
      <_sfe:BeforeOrAfterText>
        <xsl:choose>
          <xsl:when test="not(@size) or (@size and string(@size)!='big')"/>
          <xsl:otherwise>
            <_ufe:block-prespace>
              <xsl:text>(SHEET X OF Y)</xsl:text>
            </_ufe:block-prespace>
          </xsl:otherwise>
        </xsl:choose>
      </_sfe:BeforeOrAfterText>
    </xsl:if>
    <xsl:copy>
      <xsl:attribute name="_gte:Gentext-Expanded">y</xsl:attribute>
      <xsl:apply-templates mode="expand-gentext" select="@*|node()"/>
    </xsl:copy>
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

  <xsl:template match="frontmatter//module/pageblock-title" mode="expand-gentext" priority="2">
    <xsl:call-template name="expand-gentext-numbering3"/>
  </xsl:template>

  <xsl:template match="pgblk/pageblock-title" mode="expand-gentext" priority="1">
    <xsl:call-template name="expand-gentext-numbering3"/>
  </xsl:template>

  <xsl:template match="pageblock-title" mode="expand-gentext" priority="0">
    <xsl:call-template name="expand-gentext-expanded"/>
  </xsl:template>

  <xsl:template match="refint[name(id(@refid))='table' and (id(@refid)/ancestor::figure or id(@refid)/ancestor::graphic)]" mode="expand-gentext" priority="4">
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

  <xsl:template match="special-tools" mode="expand-gentext" priority="0">
    <xsl:call-template name="expand-gentext">
      <xsl:with-param name="content">
        <_ufe:spectools-title/>
        <xsl:if test="@empty='YES'">
          <_ufe:not-applicable/>
        </xsl:if>
      </xsl:with-param>
    </xsl:call-template>
  </xsl:template>

  <xsl:template match="numlist/step" mode="expand-gentext" priority="3">
    <xsl:call-template name="expand-gentext-numbering"/>
  </xsl:template>

  <xsl:template match="procedure//step" mode="expand-gentext" priority="2">
    <xsl:call-template name="expand-gentext">
      <xsl:with-param name="content">
        <xsl:call-template name="t-styler-numbering"/>
        <xsl:text> </xsl:text>
      </xsl:with-param>
    </xsl:call-template>
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
    <xsl:call-template name="expand-gentext"/>
  </xsl:template>

  <xsl:template match="step5[table/@tabstyle='frac']" mode="expand-gentext" priority="1">
    <xsl:call-template name="expand-gentext"/>
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
    <xsl:call-template name="expand-gentext-default"/>
  </xsl:template>

  <xsl:template match="pwcspblist/title" mode="expand-gentext" priority="35">
    <xsl:call-template name="expand-gentext-default"/>
  </xsl:template>

  <xsl:template match="sblist/title" mode="expand-gentext" priority="32">
    <xsl:call-template name="expand-gentext-default"/>
  </xsl:template>

  <xsl:template match="pwcni/title" mode="expand-gentext" priority="31">
    <xsl:call-template name="expand-gentext-default"/>
  </xsl:template>

  <xsl:template match="vendlist/title" mode="expand-gentext" priority="30">
    <xsl:call-template name="expand-gentext-default"/>
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
    <xsl:call-template name="expand-gentext-default"/>
  </xsl:template>

  <xsl:template match="num-index/title" mode="expand-gentext" priority="7">
    <xsl:call-template name="expand-gentext-default"/>
  </xsl:template>

  <xsl:template match="table/title/xref[id(@ref)/self::figure]" mode="expand-gentext" priority="7">
    <xsl:call-template name="expand-gentext">
      <xsl:with-param name="content">
        <_sfe:CrossReference>
          <_gte:Link linkRef="{@ref}">
            <_gte:deferredCrossReference xrefStyle="Number" refed-id="{@ref}"/>
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
            <!--<_gte:deferredCrossReference xrefStyle="Number" refed-id="{@ref}"/>-->
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
            <!--<_gte:deferredCrossReference xrefStyle="Number" refed-id="{@ref}"/>-->
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
          <xsl:variable name="division-name-token-list"> alpha-list ata-page-block book bullist chapsect-list chapter consumables enumlist figure fits-and-clears fixtures-and-equipment frontmatter general highlights intro list lof lof-item lot lot-item mm-fits module n-para num-index num-list page-block procedure sblist section spec-tool-table special-tools subject subpara table title-page torque-and-stretch unlist </xsl:variable>
          <xsl:variable name="refed-id" select="@ref"/>
          <xsl:variable name="idrefed-element-name" select="concat(' ',name((//*[@_gte:id=$refed-id])[1]),' ')"/>
          <_gte:Link linkRef="{@ref}">
            <xsl:choose>
              <xsl:when test="contains($division-name-token-list,$idrefed-element-name)">
                <!--<_gte:deferredCrossReference xrefStyle="Number" refed-id="{@ref}"/>-->
                <xsl:variable name="refed-id" select="@ref"/>
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

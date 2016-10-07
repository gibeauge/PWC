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
  
  <xsl:template match="adt" mode="gentext" priority="0">
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

  <xsl:template match="buildspec" mode="gentext" priority="0">
    <xsl:if test="node()">
      <xsl:call-template name="expand-gentext">
        <xsl:with-param name="content">
          <xsl:value-of select="$gen-texts//text[@name='buildspec']"/><xsl:text> </xsl:text>
        </xsl:with-param>
      </xsl:call-template>
    </xsl:if>
  </xsl:template>

  <xsl:template match="dd" mode="gentext" priority="0">
    <xsl:call-template name="expand-gentext">
      <xsl:with-param name="content">
        <xsl:if test="not(ancestor::*[not(self::_sfe:BeforeOrAfterText)][1]/adt|ancestor::*[not(self::_sfe:BeforeOrAfterText)][1]/*[not(self::_sfe:BeforeOrAfterText)]//adt)">
          <xsl:text> </xsl:text>
        </xsl:if>
      </xsl:with-param>
    </xsl:call-template>
  </xsl:template>

  <xsl:template match="glossary" mode="gentext" priority="0">
    <xsl:call-template name="expand-gentext">
      <xsl:with-param name="content">
        <_ufe:glossary-title/>
      </xsl:with-param>
    </xsl:call-template>
  </xsl:template>

  <xsl:template match="intro//graphic" mode="gentext" priority="1">
    <xsl:call-template name="expand-gentext-default"/>
  </xsl:template>

  <xsl:template match="graphic" mode="gentext" priority="0">
    <xsl:call-template name="expand-gentext">
      <xsl:with-param name="content">
        <xsl:if test="(ancestor-or-self::figure[1]//title)[1]">
          <_gte:Gentexted-Content-Wrapper>
            <xsl:apply-templates mode="gentext" select="(ancestor-or-self::figure[1]//title)[1]">
              <xsl:with-param name="skip-expanded-gentext" select="'yes'"/>
            </xsl:apply-templates>
          </_gte:Gentexted-Content-Wrapper>
        </xsl:if>
      </xsl:with-param>
    </xsl:call-template>
  </xsl:template>

  <xsl:template match="itemspec" mode="gentext" priority="0">
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

  <xsl:template match="mfr" mode="gentext" priority="0">
    <xsl:call-template name="expand-gentext">
      <xsl:with-param name="content">
        <xsl:value-of select="$gen-texts//text[@name='supp-code']"/><xsl:value-of select="$gen-texts//text[@name='sep0']"/>
        <xsl:text> </xsl:text>
      </xsl:with-param>
    </xsl:call-template>
  </xsl:template>

  <xsl:template match="module/note" mode="gentext" priority="11">
    <xsl:call-template name="expand-gentext">
      <xsl:with-param name="content">
        <span class="x-note-label-1-0">
          <xsl:value-of select="$gen-texts//text[@name='note']"/>
        </span>
        <xsl:value-of select="$gen-texts//text[@name='sep0']"/>
        <xsl:text> </xsl:text>
      </xsl:with-param>
    </xsl:call-template>
  </xsl:template>

  <xsl:template match="subtask/note" mode="gentext" priority="10">
    <xsl:call-template name="expand-gentext">
      <xsl:with-param name="content">
        <span class="x-note-label-1-0">
          <xsl:value-of select="$gen-texts//text[@name='note']"/>
        </span>
        <xsl:value-of select="$gen-texts//text[@name='sep0']"/>
        <xsl:text> </xsl:text>
      </xsl:with-param>
    </xsl:call-template>
  </xsl:template>

  <xsl:template match="task/note" mode="gentext" priority="9">
    <xsl:call-template name="expand-gentext">
      <xsl:with-param name="content">
        <span class="x-note-label-1-0">
          <xsl:value-of select="$gen-texts//text[@name='note']"/>
        </span>
        <xsl:value-of select="$gen-texts//text[@name='sep0']"/>
        <xsl:text> </xsl:text>
      </xsl:with-param>
    </xsl:call-template>
  </xsl:template>

  <xsl:template match="n-para/note" mode="gentext" priority="8">
    <xsl:call-template name="expand-gentext">
      <xsl:with-param name="content">
        <xsl:choose>
          <xsl:when test="@nbr">
            <span class="x-note-label-1-0">
              <xsl:value-of select="$gen-texts//text[@name='note']"/>
            </span>
            <xsl:value-of select="$gen-texts//text[@name='sep0']"/>
            <xsl:text> </xsl:text>
            <xsl:value-of select="@nbr"/>
            <xsl:text>. </xsl:text>
          </xsl:when>
          <xsl:otherwise>
            <span class="x-note-label-1-0">
              <xsl:value-of select="$gen-texts//text[@name='note']"/>
            </span>
            <xsl:value-of select="$gen-texts//text[@name='sep0']"/>
            <xsl:text> </xsl:text>
          </xsl:otherwise>
        </xsl:choose>
      </xsl:with-param>
    </xsl:call-template>
  </xsl:template>

  <xsl:template match="procedure/note" mode="gentext" priority="7">
    <xsl:call-template name="expand-gentext">
      <xsl:with-param name="content">
        <xsl:choose>
          <xsl:when test="@nbr">
            <span class="x-note-label-1-0">
              <xsl:value-of select="$gen-texts//text[@name='note']"/>
            </span>
            <xsl:value-of select="$gen-texts//text[@name='sep0']"/>
            <xsl:text> </xsl:text>
            <xsl:value-of select="@nbr"/>
            <xsl:text>. </xsl:text>
          </xsl:when>
          <xsl:otherwise>
            <span class="x-note-label-1-0">
              <xsl:value-of select="$gen-texts//text[@name='note']"/>
            </span>
            <xsl:value-of select="$gen-texts//text[@name='sep0']"/>
            <xsl:text> </xsl:text>
          </xsl:otherwise>
        </xsl:choose>
      </xsl:with-param>
    </xsl:call-template>
  </xsl:template>

  <xsl:template match="fandc/note" mode="gentext" priority="6">
    <xsl:call-template name="expand-gentext-default"/>
  </xsl:template>

  <xsl:template match="spec-assem/note" mode="gentext" priority="5">
    <xsl:call-template name="expand-gentext-default"/>
  </xsl:template>

  <xsl:template match="spring-pressure/note" mode="gentext" priority="4">
    <xsl:call-template name="expand-gentext-default"/>
  </xsl:template>

  <xsl:template match="torque-and-stretch/note" mode="gentext" priority="3">
    <xsl:call-template name="expand-gentext-default"/>
  </xsl:template>

  <xsl:template match="fits-and-clears/note" mode="gentext" priority="2">
    <xsl:call-template name="expand-gentext-default"/>
  </xsl:template>

  <xsl:template match="note[ancestor::subpara]" mode="gentext" priority="1">
    <xsl:call-template name="expand-gentext">
      <xsl:with-param name="content">
        <xsl:choose>
          <xsl:when test="@nbr">
            <span class="x-note-label-1-0">
              <xsl:value-of select="$gen-texts//text[@name='note']"/>
            </span>
            <xsl:value-of select="$gen-texts//text[@name='sep0']"/>
            <xsl:text> </xsl:text>
            <xsl:value-of select="@nbr"/>
            <xsl:text>. </xsl:text>
          </xsl:when>
          <xsl:otherwise>
            <span class="x-note-label-1-0">
              <xsl:value-of select="$gen-texts//text[@name='note']"/>
            </span>
            <xsl:value-of select="$gen-texts//text[@name='sep0']"/>
            <xsl:text> </xsl:text>
          </xsl:otherwise>
        </xsl:choose>
      </xsl:with-param>
    </xsl:call-template>
  </xsl:template>

  <xsl:template match="note" mode="gentext" priority="0">
    <xsl:call-template name="expand-gentext">
      <xsl:with-param name="content">
        <xsl:choose>
          <xsl:when test="@nbr">
            <span class="x-note-label-1-0">
              <xsl:value-of select="$gen-texts//text[@name='note']"/>
            </span>
            <xsl:value-of select="$gen-texts//text[@name='sep0']"/>
            <xsl:text> </xsl:text>
            <xsl:value-of select="@nbr"/>
            <xsl:text>. </xsl:text>
          </xsl:when>
          <xsl:otherwise>
            <span class="x-note-label-1-0">
              <xsl:value-of select="$gen-texts//text[@name='note']"/>
            </span>
            <xsl:value-of select="$gen-texts//text[@name='sep0']"/>
            <xsl:text> </xsl:text>
          </xsl:otherwise>
        </xsl:choose>
      </xsl:with-param>
    </xsl:call-template>
  </xsl:template>

  <xsl:template match="pwc-title|pwcepc-apu-title" mode="gentext" priority="0">
    <xsl:call-template name="expand-gentext3">
      <xsl:with-param name="content-before">
        <_ufe:engine-type>
          <xsl:if test="string(./@enginetype)">
            <xsl:attribute name="enginetype">
              <xsl:value-of select="string(./@enginetype)"/>
            </xsl:attribute>
          </xsl:if>
        </_ufe:engine-type>
        <xsl:value-of select="$gen-texts//text[@name='model']"/>
      </xsl:with-param>
      <xsl:with-param name="content-after">
        <span style="color: #666666; ">
          <_ufe:title-block>
            <xsl:value-of select="$gen-texts//text[@name='manual-pn']"/><xsl:text> </xsl:text>
            <xsl:value-of select="@docnbr"/>
          </_ufe:title-block>
          <_ufe:title-block>
            <xsl:value-of select="$gen-texts//text[@name='orig-date']"/><xsl:text> </xsl:text>
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

  <xsl:template match="pwcatanbr" mode="gentext" priority="0">
    <xsl:call-template name="expand-gentext3">
      <xsl:with-param name="content-before">
        <xsl:text>(</xsl:text>
      </xsl:with-param>
      <xsl:with-param name="content-after">
        <xsl:text>)</xsl:text>
      </xsl:with-param>
    </xsl:call-template>
  </xsl:template>

  <xsl:template match="pwcbrk" mode="gentext" priority="0">
    <xsl:call-template name="expand-gentext-default"/>
  </xsl:template>

  <xsl:template match="pwcchapsect-list" mode="gentext" priority="0">
    <xsl:call-template name="expand-gentext">
      <xsl:with-param name="content">
        <_ufe:chapsect-title/>
      </xsl:with-param>
    </xsl:call-template>
  </xsl:template>

  <xsl:template match="pwcspbnbr" mode="gentext" priority="0">
    <xsl:call-template name="expand-gentext">
      <xsl:with-param name="content">
        <xsl:value-of select="@spbtype"/>
        <xsl:text>-</xsl:text>
      </xsl:with-param>
    </xsl:call-template>
  </xsl:template>

  <xsl:template match="sbnbr" mode="gentext" priority="1">
    <xsl:call-template name="expand-gentext">
      <xsl:with-param name="content">
        <xsl:value-of select="@sbtype"/>
        <xsl:text>-</xsl:text>
      </xsl:with-param>
    </xsl:call-template>
  </xsl:template>

  <xsl:template match="sheet" mode="gentext" priority="0">
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
              <xsl:text>(</xsl:text><xsl:value-of select="$gen-texts//text[@name='sheet']"/><xsl:text> </xsl:text>
              <xsl:value-of select="@sheetnbr"/>
              <xsl:text> </xsl:text><xsl:value-of select="$gen-texts//text[@name='sheet-of']"/><xsl:text> </xsl:text>
              <xsl:value-of select="(ancestor-or-self::graphic[1]//sheet)[position()=last()]/@sheetnbr"/>
              <xsl:text>)</xsl:text>
            </_ufe:block-prespace>
          </_sfe:BeforeOrAfterText>
        </xsl:if>
      </xsl:otherwise>
    </xsl:choose>
    <xsl:copy>
      <xsl:attribute name="_gte:Gentext-Expanded">y</xsl:attribute>
      <xsl:apply-templates mode="gentext" select="@*|node()"/>
    </xsl:copy>
  </xsl:template>

  <xsl:template match="numlist/step" mode="gentext" priority="3">
    <xsl:call-template name="expand-gentext-numbering"/>
  </xsl:template>

  <xsl:template match="procedure//step" mode="gentext" priority="2">
    <xsl:call-template name="expand-gentext-numbering3"/>
  </xsl:template>

  <xsl:template match="step[table/@tabstyle='frac']" mode="gentext" priority="1">
    <xsl:call-template name="expand-gentext-numbering2"/>
  </xsl:template>

  <xsl:template match="numlist/step2" mode="gentext" priority="2">
    <xsl:call-template name="expand-gentext-numbering"/>
  </xsl:template>

  <xsl:template match="step2" mode="gentext" priority="0">
    <xsl:call-template name="expand-gentext-numbering5"/>
  </xsl:template>

  <xsl:template match="numlist/step3" mode="gentext" priority="2">
    <xsl:call-template name="expand-gentext">
      <xsl:with-param name="content">
        <span style="text-decoration: underline; ">
          <xsl:call-template name="t-styler-numbering"/>
        </span>
      </xsl:with-param>
    </xsl:call-template>
  </xsl:template>

  <xsl:template match="step3" mode="gentext" priority="0">
    <xsl:call-template name="expand-gentext-numbering2"/>
  </xsl:template>

  <xsl:template match="numlist/step4" mode="gentext" priority="2">
    <xsl:call-template name="expand-gentext">
      <xsl:with-param name="content">
        <span style="text-decoration: underline; ">
          <xsl:call-template name="t-styler-numbering"/>
        </span>
      </xsl:with-param>
    </xsl:call-template>
  </xsl:template>

  <xsl:template match="step4" mode="gentext" priority="0">
    <xsl:call-template name="expand-gentext-numbering2"/>
  </xsl:template>

  <xsl:template match="numlist/step5" mode="gentext" priority="2">
    <xsl:call-template name="expand-gentext-expanded"/>
  </xsl:template>

  <xsl:template match="step5[table/@tabstyle='frac']" mode="gentext" priority="1">
    <xsl:call-template name="expand-gentext-expanded"/>
  </xsl:template>

  <xsl:template match="module[@module-name='Airworthiness_Limits']/pgblk/title" mode="gentext" priority="65">
    <xsl:call-template name="expand-gentext-default"/>
  </xsl:template>

  <xsl:template match="page-block[@pb-name='ni']//mfmatr/title" mode="gentext" priority="56">
    <xsl:call-template name="expand-gentext-default"/>
  </xsl:template>

  <xsl:template match="page-block[@pb-name='record-of-revisions']//n-para/title" mode="gentext" priority="55">
    <xsl:call-template name="expand-gentext-expanded"/>
  </xsl:template>

  <xsl:template match="pbfmatr/title" mode="gentext" priority="40">
    <xsl:call-template name="expand-gentext">     
      <xsl:with-param name="content">
        <xsl:choose>
          <xsl:when test="((ancestor-or-self::pwcpbfront[1]/title)) and ((ancestor-or-self::pwcpbfront[1]/pbfmatr))"/>
          <xsl:otherwise>
            <_ufe:task-title>
              <span style="text-decoration: underline; ">
                <xsl:if test="node()[not(self::_sfe:BeforeOrAfterText)]">
                  <_gte:Gentexted-Content-Wrapper>
                    <xsl:apply-templates mode="gentext">
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

  <xsl:template match="pwcpbfront/title" mode="gentext" priority="39">
    <xsl:call-template name="expand-gentext-default"/>
  </xsl:template>

  <xsl:template match="intro/title" mode="gentext" priority="36">
    <xsl:call-template name="expand-gentext-expanded"/>
  </xsl:template>

  <xsl:template match="pwcspblist/title" mode="gentext" priority="35">
    <xsl:call-template name="expand-gentext-default"/>
  </xsl:template>

  <xsl:template match="sblist/title" mode="gentext" priority="32">
    <xsl:call-template name="expand-gentext-expanded"/>
  </xsl:template>

  <xsl:template match="pwcni/title" mode="gentext" priority="31">
    <xsl:call-template name="expand-gentext-default"/>
  </xsl:template>

  <xsl:template match="vendlist/title" mode="gentext" priority="30">
    <xsl:call-template name="expand-gentext-expanded"/>
  </xsl:template>

  <xsl:template match="lof-item/title" mode="gentext" priority="21">
    <xsl:call-template name="expand-gentext-expanded"/>
  </xsl:template>

  <xsl:template match="lof/title" mode="gentext" priority="18">
    <xsl:call-template name="expand-gentext-expanded"/>
  </xsl:template>

  <xsl:template match="spb-list/title" mode="gentext" priority="14">
    <xsl:call-template name="expand-gentext-default"/>
  </xsl:template>

  <xsl:template match="service-bull-list/title" mode="gentext" priority="10">
    <xsl:call-template name="expand-gentext-default"/>
  </xsl:template>

  <xsl:template match="module/title" mode="gentext" priority="9">
    <xsl:call-template name="expand-gentext-expanded"/>
  </xsl:template>

  <xsl:template match="num-index/title" mode="gentext" priority="7">
    <xsl:call-template name="expand-gentext-default"/>
  </xsl:template>

  <xsl:template match="upa" mode="gentext" priority="0">
    <xsl:call-template name="expand-gentext">
      <xsl:with-param name="content">
        <xsl:if test="(ancestor-or-self::entry[1]//np)[1]/*|(ancestor-or-self::entry[1]//np)[1]/text()|(ancestor-or-self::entry[1]//np)[1]/processing-instruction()">
          <_gte:Gentexted-Content-Wrapper>
            <xsl:apply-templates mode="gentext" select="(ancestor-or-self::entry[1]//np)[1]/*|(ancestor-or-self::entry[1]//np)[1]/text()|(ancestor-or-self::entry[1]//np)[1]/processing-instruction()">
              <xsl:with-param name="skip-expanded-gentext" select="'yes'"/>
            </xsl:apply-templates>
          </_gte:Gentexted-Content-Wrapper>
        </xsl:if>
      </xsl:with-param>
    </xsl:call-template>
  </xsl:template>

</xsl:stylesheet>

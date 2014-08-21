<?xml version="1.0" encoding="UTF-8"?>

<!DOCTYPE xsl:stylesheet [
    <!ENTITY % entities_commun SYSTEM "xsl_entities_commun.ent">
    %entities_commun;
]>

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
        <xsl:text>Build Specification No. </xsl:text>
      </xsl:with-param>
    </xsl:call-template>
  </xsl:template>

  <xsl:template match="dimen" mode="expand-gentext" priority="0">
    <xsl:call-template name="expand-gentext3">
      <xsl:with-param name="content-before">
        <xsl:text> </xsl:text>
      </xsl:with-param>
      <xsl:with-param name="content-after">
        <xsl:text> </xsl:text>
      </xsl:with-param>
    </xsl:call-template>
  </xsl:template>

  <xsl:template match="figure[descendant::graphic]" mode="expand-gentext" priority="1">
    <xsl:call-template name="expand-gentext-default"/>
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
    <xsl:call-template name="expand-gentext"/>
  </xsl:template>

  <xsl:template match="inter" mode="expand-gentext" priority="0">
    <xsl:call-template name="expand-gentext3">
      <xsl:with-param name="content-before">
        <xsl:choose>
          <xsl:when test="@prc='S'">
            <xsl:text>INTRCHG WITH P/N </xsl:text>
          </xsl:when>
          <xsl:when test="@prc='N'">
            <xsl:text>NONINTR WITH P/N </xsl:text>
          </xsl:when>
          <xsl:when test="@prc=number('7')">
            <xsl:text>RESTRICTED INTERCHANGEABILITY WITH P/N </xsl:text>
          </xsl:when>
          <xsl:when test="@prc=number('6')">
            <xsl:text>INTRCHG AS A SET WITH P/N </xsl:text>
          </xsl:when>
          <xsl:when test="@prc=number('3')">
            <xsl:text>NOT INTR WITH P/N </xsl:text>
          </xsl:when>
          <xsl:when test="@prc=number('2')">
            <xsl:text>TWO-WAY INTRCHG WITH P/N </xsl:text>
          </xsl:when>
          <xsl:when test="@prc=number('1')">
            <xsl:text>ONE-WAY INTRCHG WITH P/N </xsl:text>
          </xsl:when>
        </xsl:choose>
      </xsl:with-param>
      <xsl:with-param name="content-after">
        <xsl:if test="@prc=number('7')">
          <xsl:text>. REFER TO APPLICABLE SERVICE BULLETIN.</xsl:text>
        </xsl:if>
      </xsl:with-param>
    </xsl:call-template>
  </xsl:template>

  <xsl:template match="ipc-fig" mode="expand-gentext" priority="0">
    <xsl:call-template name="expand-gentext">
      <xsl:with-param name="content">
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
      </xsl:with-param>
    </xsl:call-template>
  </xsl:template>

  <xsl:template match="kits" mode="expand-gentext" priority="0">
    <xsl:call-template name="expand-gentext">
      <xsl:with-param name="content">
        <xsl:text>KITS, REPAIR/SERVICE PARTS</xsl:text>
      </xsl:with-param>
    </xsl:call-template>
  </xsl:template>

  <xsl:template match="lpln" mode="expand-gentext" priority="0">
    <xsl:call-template name="expand-gentext">
      <xsl:with-param name="content">
        <xsl:text>LATEST PARTS LIST NO: </xsl:text>
      </xsl:with-param>
    </xsl:call-template>
  </xsl:template>

  <xsl:template match="name" mode="expand-gentext" priority="0">
    <xsl:call-template name="expand-gentext3">
      <xsl:with-param name="content-before">
        <xsl:choose>
          <xsl:when test="&anc-pre-partnbr-nut-table; and ancestor::entry[preceding-sibling::entry[part-nbr[@indent = '4']]]">
            <xsl:text>▪▪▪▪ </xsl:text>
          </xsl:when>
          <xsl:when test="&anc-pre-partnbr-nut-table; and ancestor::entry[preceding-sibling::entry[part-nbr[@indent = '3']]]">
            <xsl:text>▪▪▪ </xsl:text>
          </xsl:when>
          <xsl:when test="&anc-pre-partnbr-nut-table; and ancestor::entry[preceding-sibling::entry[part-nbr[@indent = '2']]]">
            <xsl:text>▪▪ </xsl:text>
          </xsl:when>
          <xsl:when test="&anc-pre-partnbr-nut-table; and ancestor::entry[preceding-sibling::entry[part-nbr[@indent = '1']]]">
            <xsl:text>▪ </xsl:text>
          </xsl:when>
          <xsl:when test="ancestor::entry[preceding-sibling::entry[part-nbr[@indent = '4']]] and &par-not-cont-text;"/>
          <xsl:when test="ancestor::entry[preceding-sibling::entry[part-nbr[@indent = '4']]]">
            <xsl:text>▪▪▪▪ </xsl:text>
          </xsl:when>
          <xsl:when test="ancestor::entry[preceding-sibling::entry[part-nbr[@indent = '3']]] and &par-not-cont-text;"/>
          <xsl:when test="ancestor::entry[preceding-sibling::entry[part-nbr[@indent = '3']]]">
            <xsl:text>▪▪▪ </xsl:text>
          </xsl:when>
          <xsl:when test="ancestor::entry[preceding-sibling::entry[part-nbr[@indent = '2']]] and &par-not-cont-text;"/>
          <xsl:when test="ancestor::entry[preceding-sibling::entry[part-nbr[@indent = '2']]]">
            <xsl:text>▪▪ </xsl:text>
          </xsl:when>
          <xsl:when test="ancestor::entry[preceding-sibling::entry[part-nbr[@indent = '1']]] and &par-not-cont-text;"/>
          <xsl:when test="ancestor::entry[preceding-sibling::entry[part-nbr[@indent = '1']]]">
            <xsl:text>▪ </xsl:text>
          </xsl:when>
        </xsl:choose>
      </xsl:with-param>
      <xsl:with-param name="content-after">
        <xsl:choose>
          <xsl:when test="&anc-pre-partnbr-nut-table; and ancestor::entry[preceding-sibling::entry[part-nbr[@indent = '4']]]">
            <_ufe:block-nospace>
              <xsl:text>SEE TABLE FOR OPTIONAL PART NUMBERS</xsl:text>
            </_ufe:block-nospace>
          </xsl:when>
          <xsl:when test="&anc-pre-partnbr-nut-table; and ancestor::entry[preceding-sibling::entry[part-nbr[@indent = '3']]]">
            <_ufe:block-nospace>
              <xsl:text>SEE TABLE FOR OPTIONAL PART NUMBERS</xsl:text>
            </_ufe:block-nospace>
          </xsl:when>
          <xsl:when test="&anc-pre-partnbr-nut-table; and ancestor::entry[preceding-sibling::entry[part-nbr[@indent = '2']]]">
            <_ufe:block-nospace>
              <xsl:text>SEE TABLE FOR OPTIONAL PART NUMBERS</xsl:text>
            </_ufe:block-nospace>
          </xsl:when>
          <xsl:when test="&anc-pre-partnbr-nut-table; and ancestor::entry[preceding-sibling::entry[part-nbr[@indent = '1']]]">
            <_ufe:block-nospace>
              <xsl:text>SEE TABLE FOR OPTIONAL PART NUMBERS</xsl:text>
            </_ufe:block-nospace>
          </xsl:when>
        </xsl:choose>
      </xsl:with-param>
    </xsl:call-template>
  </xsl:template>

  <xsl:template match="nomen-col" mode="expand-gentext" priority="0">
    <xsl:call-template name="expand-gentext2">
      <xsl:with-param name="content">
        <xsl:choose>
          <xsl:when test="not((@select-at and string(@select-at)='ASSEMBLY') and (parent::entry[preceding-sibling::entry[part-nbr[@ic-opt = 'LIST']]])) and not((@select-at and string(@select-at)='BALANCING') and (parent::entry[preceding-sibling::entry[part-nbr[@ic-opt = 'LIST']]])) and not((@select-at and string(@select-at)='DETAIL-BAL') and (parent::entry[preceding-sibling::entry[part-nbr[@ic-opt = 'LIST']]])) and not((@select-at and string(@select-at)='TRIM-BAL') and (parent::entry[preceding-sibling::entry[part-nbr[@ic-opt = 'LIST']]])) and not(parent::entry[preceding-sibling::entry[part-nbr[@ic-opt = 'LIST']]]) and not(@select-at and string(@select-at)='ASSEMBLY') and not(@select-at and string(@select-at)='BALANCING') and not(@select-at and string(@select-at)='DETAIL-BAL') and (@select-at and string(@select-at)='TRIM-BAL')">
            <_ufe:block-nospace>
              <xsl:text>SELECT AT TRIM-BAL</xsl:text>
            </_ufe:block-nospace>
          </xsl:when>
          <xsl:when test="not((@select-at and string(@select-at)='ASSEMBLY') and (parent::entry[preceding-sibling::entry[part-nbr[@ic-opt = 'LIST']]])) and not((@select-at and string(@select-at)='BALANCING') and (parent::entry[preceding-sibling::entry[part-nbr[@ic-opt = 'LIST']]])) and not((@select-at and string(@select-at)='DETAIL-BAL') and (parent::entry[preceding-sibling::entry[part-nbr[@ic-opt = 'LIST']]])) and not((@select-at and string(@select-at)='TRIM-BAL') and (parent::entry[preceding-sibling::entry[part-nbr[@ic-opt = 'LIST']]])) and not(parent::entry[preceding-sibling::entry[part-nbr[@ic-opt = 'LIST']]]) and not(@select-at and string(@select-at)='ASSEMBLY') and not(@select-at and string(@select-at)='BALANCING') and (@select-at and string(@select-at)='DETAIL-BAL')">
            <_ufe:block-nospace>
              <xsl:text>SELECT AT DETAIL-BAL</xsl:text>
            </_ufe:block-nospace>
          </xsl:when>
          <xsl:when test="not((@select-at and string(@select-at)='ASSEMBLY') and (parent::entry[preceding-sibling::entry[part-nbr[@ic-opt = 'LIST']]])) and not((@select-at and string(@select-at)='BALANCING') and (parent::entry[preceding-sibling::entry[part-nbr[@ic-opt = 'LIST']]])) and not((@select-at and string(@select-at)='DETAIL-BAL') and (parent::entry[preceding-sibling::entry[part-nbr[@ic-opt = 'LIST']]])) and not((@select-at and string(@select-at)='TRIM-BAL') and (parent::entry[preceding-sibling::entry[part-nbr[@ic-opt = 'LIST']]])) and not(parent::entry[preceding-sibling::entry[part-nbr[@ic-opt = 'LIST']]]) and not(@select-at and string(@select-at)='ASSEMBLY') and (@select-at and string(@select-at)='BALANCING')">
            <_ufe:block-nospace>
              <xsl:text>SELECT AT BALANCING</xsl:text>
            </_ufe:block-nospace>
          </xsl:when>
          <xsl:when test="not((@select-at and string(@select-at)='ASSEMBLY') and (parent::entry[preceding-sibling::entry[part-nbr[@ic-opt = 'LIST']]])) and not((@select-at and string(@select-at)='BALANCING') and (parent::entry[preceding-sibling::entry[part-nbr[@ic-opt = 'LIST']]])) and not((@select-at and string(@select-at)='DETAIL-BAL') and (parent::entry[preceding-sibling::entry[part-nbr[@ic-opt = 'LIST']]])) and not((@select-at and string(@select-at)='TRIM-BAL') and (parent::entry[preceding-sibling::entry[part-nbr[@ic-opt = 'LIST']]])) and not(parent::entry[preceding-sibling::entry[part-nbr[@ic-opt = 'LIST']]]) and (@select-at and string(@select-at)='ASSEMBLY')">
            <_ufe:block-nospace>
              <xsl:text>SELECT AT ASSEMBLY</xsl:text>
            </_ufe:block-nospace>
          </xsl:when>
          <xsl:when test="not((@select-at and string(@select-at)='ASSEMBLY') and (parent::entry[preceding-sibling::entry[part-nbr[@ic-opt = 'LIST']]])) and not((@select-at and string(@select-at)='BALANCING') and (parent::entry[preceding-sibling::entry[part-nbr[@ic-opt = 'LIST']]])) and not((@select-at and string(@select-at)='DETAIL-BAL') and (parent::entry[preceding-sibling::entry[part-nbr[@ic-opt = 'LIST']]])) and not((@select-at and string(@select-at)='TRIM-BAL') and (parent::entry[preceding-sibling::entry[part-nbr[@ic-opt = 'LIST']]])) and (parent::entry[preceding-sibling::entry[part-nbr[@ic-opt = 'LIST']]])">
            <_ufe:block-nospace>
              <xsl:text>(IC) CONSISTS OF:</xsl:text>
            </_ufe:block-nospace>
          </xsl:when>
          <xsl:when test="not((@select-at and string(@select-at)='ASSEMBLY') and (parent::entry[preceding-sibling::entry[part-nbr[@ic-opt = 'LIST']]])) and not((@select-at and string(@select-at)='BALANCING') and (parent::entry[preceding-sibling::entry[part-nbr[@ic-opt = 'LIST']]])) and not((@select-at and string(@select-at)='DETAIL-BAL') and (parent::entry[preceding-sibling::entry[part-nbr[@ic-opt = 'LIST']]])) and ((@select-at and string(@select-at)='TRIM-BAL') and (parent::entry[preceding-sibling::entry[part-nbr[@ic-opt = 'LIST']]]))">
            <_ufe:block-nospace>
              <xsl:text>SELECT AT TRIM-BAL</xsl:text>
            </_ufe:block-nospace>
            <_ufe:block-nospace>
              <xsl:text>(IC) CONSISTS OF:</xsl:text>
            </_ufe:block-nospace>
          </xsl:when>
          <xsl:when test="not((@select-at and string(@select-at)='ASSEMBLY') and (parent::entry[preceding-sibling::entry[part-nbr[@ic-opt = 'LIST']]])) and not((@select-at and string(@select-at)='BALANCING') and (parent::entry[preceding-sibling::entry[part-nbr[@ic-opt = 'LIST']]])) and ((@select-at and string(@select-at)='DETAIL-BAL') and (parent::entry[preceding-sibling::entry[part-nbr[@ic-opt = 'LIST']]]))">
            <_ufe:block-nospace>
              <xsl:text>SELECT AT DETAIL-BAL</xsl:text>
            </_ufe:block-nospace>
            <_ufe:block-nospace>
              <xsl:text>(IC) CONSISTS OF:</xsl:text>
            </_ufe:block-nospace>
          </xsl:when>
          <xsl:when test="not((@select-at and string(@select-at)='ASSEMBLY') and (parent::entry[preceding-sibling::entry[part-nbr[@ic-opt = 'LIST']]])) and ((@select-at and string(@select-at)='BALANCING') and (parent::entry[preceding-sibling::entry[part-nbr[@ic-opt = 'LIST']]]))">
            <_ufe:block-nospace>
              <xsl:text>SELECT AT BALANCING</xsl:text>
            </_ufe:block-nospace>
            <_ufe:block-nospace>
              <xsl:text>(IC) CONSISTS OF:</xsl:text>
            </_ufe:block-nospace>
          </xsl:when>
          <xsl:when test="(@select-at and string(@select-at)='ASSEMBLY') and (parent::entry[preceding-sibling::entry[part-nbr[@ic-opt = 'LIST']]])">
            <_ufe:block-nospace>
              <xsl:text>SELECT AT ASSEMBLY</xsl:text>
            </_ufe:block-nospace>
            <_ufe:block-nospace>
              <xsl:text>(IC) CONSISTS OF:</xsl:text>
            </_ufe:block-nospace>
          </xsl:when>
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

  <xsl:template match="note" mode="expand-gentext" priority="0">
    <xsl:call-template name="expand-gentext">
      <xsl:with-param name="content">
        <xsl:choose>
          <xsl:when test="(following-sibling::note) or (preceding-sibling::note)">
            <span class="x-note-label-2-0">
              <xsl:text>NOTE</xsl:text>
            </span>
            <xsl:text>: </xsl:text>
            <xsl:call-template name="t-styler-numbering"/>
            <xsl:text> </xsl:text>
          </xsl:when>
          <xsl:otherwise>
            <span class="x-note-label-2-0">
              <xsl:text>NOTE</xsl:text>
            </span>
            <xsl:text>: </xsl:text>
          </xsl:otherwise>
        </xsl:choose>
      </xsl:with-param>
    </xsl:call-template>
  </xsl:template>

  <xsl:template match="part-nbr" mode="expand-gentext" priority="0">
    <xsl:call-template name="expand-gentext">
      <xsl:with-param name="content">
        <xsl:if test="@ref!=''">
          <_sfe:InternalLink>
              <xsl:attribute name="targetId">
                <xsl:value-of select="@ref"/>
              </xsl:attribute>
              <xsl:if test="node()[not(self::_sfe:BeforeOrAfterText)]">
                <_gte:Gentexted-Content-Wrapper>
                  <xsl:apply-templates mode="expand-gentext">
                    <xsl:with-param name="skip-expanded-gentext" select="'yes'"/>
                  </xsl:apply-templates>
                </_gte:Gentexted-Content-Wrapper>
              </xsl:if>
            
          </_sfe:InternalLink>
        </xsl:if>
      </xsl:with-param>
    </xsl:call-template>
  </xsl:template>

  <xsl:template match="pntype[position()&gt;1]" mode="expand-gentext" priority="1">
    <xsl:call-template name="expand-gentext">
      <xsl:with-param name="content">
        <xsl:choose>
          <xsl:when test="@cat='use-with' and preceding-sibling::pntype[1][@cat!='use-with']"> </xsl:when>
          <xsl:when test="@cat='field' and preceding-sibling::pntype[1][@cat!='field']">
            <xsl:text>Field reidentification P/N </xsl:text>
          </xsl:when>
          <xsl:when test="@cat='rew' and preceding-sibling::pntype[1][@cat!='rew']">
            <xsl:text>Reworked from P/N </xsl:text>
          </xsl:when>
          <xsl:when test="@cat='NewMay' and preceding-sibling::pntype[1][@cat!='NewMay']">
            <xsl:text>May be obtained by rework of P/N </xsl:text>
          </xsl:when>
          <xsl:when test="@cat='comp-of' and preceding-sibling::pntype[1][@cat!='comp-of']">
            <xsl:text>component of P/N </xsl:text>
          </xsl:when>
          <xsl:when test="@cat='use-with' and preceding-sibling::pntype[1][@cat='use-with']">
            <xsl:text> AND </xsl:text>
          </xsl:when>
          <xsl:when test="@cat='field' and preceding-sibling::pntype[1][@cat='field']">
            <xsl:text> AND </xsl:text>
          </xsl:when>
          <xsl:when test="@cat='rew' and preceding-sibling::pntype[1][@cat='rew']">
            <xsl:text> OR </xsl:text>
          </xsl:when>
          <xsl:when test="@cat='NewMay' and preceding-sibling::pntype[1][@cat='NewMay']">
            <xsl:text> OR </xsl:text>
          </xsl:when>
          <xsl:when test="@cat='comp-of' and preceding-sibling::pntype[1][@cat='comp-of']">
            <xsl:text> AND </xsl:text>
          </xsl:when>
        </xsl:choose>
      </xsl:with-param>
    </xsl:call-template>
  </xsl:template>

  <xsl:template match="pntype" mode="expand-gentext" priority="0">
    <xsl:call-template name="expand-gentext">
      <xsl:with-param name="content">
        <xsl:choose>
          <xsl:when test="@cat='use-with'">
            <xsl:text>use with P/N </xsl:text>
          </xsl:when>
          <xsl:when test="@cat='field'">
            <xsl:text>Field reidentification P/N </xsl:text>
          </xsl:when>
          <xsl:when test="@cat='rew'">
            <xsl:text>Reworked from P/N </xsl:text>
          </xsl:when>
          <xsl:when test="@cat='NewMay'">
            <xsl:text>May be obtained by rework of P/N </xsl:text>
          </xsl:when>
          <xsl:when test="@cat='comp-of'">
            <xsl:text>component of P/N </xsl:text>
          </xsl:when>
        </xsl:choose>
      </xsl:with-param>
    </xsl:call-template>
  </xsl:template>

  <xsl:template match="pwc-pn" mode="expand-gentext" priority="0">
    <xsl:call-template name="expand-gentext">
      <xsl:with-param name="content">
        <xsl:text>P&#x26;WC P/N: </xsl:text>
      </xsl:with-param>
    </xsl:call-template>
  </xsl:template>

  <xsl:template match="range" mode="expand-gentext" priority="0">
    <xsl:call-template name="expand-gentext">
      <xsl:with-param name="content">
        <xsl:choose>
          <xsl:when test="substring-before(.,',') != '0'">
            <xsl:text>USE </xsl:text>
            <xsl:value-of select="string(substring-before(.,','))"/>
            <xsl:text> MIN TO </xsl:text>
            <xsl:value-of select="string(substring-after(.,','))"/>
            <xsl:text> MAX.</xsl:text>
          </xsl:when>
          <xsl:otherwise>
            <xsl:text>USE </xsl:text>
            <xsl:value-of select="string(substring-before(.,','))"/>
            <xsl:text> TO </xsl:text>
            <xsl:value-of select="string(substring-after(.,','))"/>
            <xsl:text> MAX.</xsl:text>
          </xsl:otherwise>
        </xsl:choose>
      </xsl:with-param>
    </xsl:call-template>
  </xsl:template>

  <xsl:template match="nomen-col/sb-stat[@type='SPB']" mode="expand-gentext" priority="3">
    <xsl:call-template name="expand-gentext">
      <xsl:with-param name="content">
        <_ufe:block-nospace/>
        <xsl:choose>
          <xsl:when test="ancestor::entry/preceding-sibling::entry[2]/*[name()='part-nbr']/@indent='4'">
            <_ufe:hardspace/><_ufe:hardspace/><_ufe:hardspace/><_ufe:hardspace/><_ufe:hardspace/><_ufe:hardspace/>
          </xsl:when>
          <xsl:when test="ancestor::entry/preceding-sibling::entry[2]/*[name()='part-nbr']/@indent='3'">
            <_ufe:hardspace/><_ufe:hardspace/><_ufe:hardspace/><_ufe:hardspace/><_ufe:hardspace/>
          </xsl:when>
          <xsl:when test="ancestor::entry/preceding-sibling::entry[2]/*[name()='part-nbr']/@indent='2'">
            <_ufe:hardspace/><_ufe:hardspace/><_ufe:hardspace/><_ufe:hardspace/>
          </xsl:when>
          <xsl:when test="ancestor::entry/preceding-sibling::entry[2]/*[name()='part-nbr']/@indent='1'">
            <_ufe:hardspace/><_ufe:hardspace/><_ufe:hardspace/>
          </xsl:when>
        </xsl:choose>
        <xsl:value-of select="@cond"/>
        <xsl:text>-</xsl:text>
        <xsl:value-of select="string(substring-before(., ','))"/>
        <xsl:text> </xsl:text>
        <xsl:value-of select="@type"/>
        <xsl:text> NO. </xsl:text>
        <xsl:value-of select="string(substring-after(., ','))"/>
      </xsl:with-param>
    </xsl:call-template>
  </xsl:template>

  <xsl:template match="nomen-col/sb-stat" mode="expand-gentext" priority="2">
    <xsl:call-template name="expand-gentext">
      <xsl:with-param name="content">
        <xsl:choose>
          <xsl:when test="ancestor::entry/preceding-sibling::entry[2]/*[name()='part-nbr']/@indent='4'">
            <_ufe:block-nospace/>
            <_ufe:hardspace/><_ufe:hardspace/><_ufe:hardspace/><_ufe:hardspace/><_ufe:hardspace/><_ufe:hardspace/>
            <xsl:value-of select="@cond"/>
            <xsl:text>-</xsl:text>
            <xsl:value-of select="@type"/>
          </xsl:when>
          <xsl:when test="ancestor::entry/preceding-sibling::entry[2]/*[name()='part-nbr']/@indent='3'">
            <_ufe:block-nospace/>
            <_ufe:hardspace/><_ufe:hardspace/><_ufe:hardspace/><_ufe:hardspace/><_ufe:hardspace/>
            <xsl:value-of select="@cond"/>
            <xsl:text>-</xsl:text>
            <xsl:value-of select="@type"/>
          </xsl:when>
          <xsl:when test="ancestor::entry/preceding-sibling::entry[2]/*[name()='part-nbr']/@indent='2'">
            <_ufe:block-nospace/>
            <_ufe:hardspace/><_ufe:hardspace/><_ufe:hardspace/><_ufe:hardspace/>
            <xsl:value-of select="@cond"/>
            <xsl:text>-</xsl:text>
            <xsl:value-of select="@type"/>
          </xsl:when>
          <xsl:when test="ancestor::entry/preceding-sibling::entry[2]/*[name()='part-nbr']/@indent='1'">
            <_ufe:block-nospace/>
            <_ufe:hardspace/><_ufe:hardspace/><_ufe:hardspace/>
            <xsl:value-of select="@cond"/>
            <xsl:text>-</xsl:text>
            <xsl:value-of select="@type"/>
          </xsl:when>
          <xsl:when test="ancestor::entry/preceding-sibling::entry[2]/*[name()='part-nbr']/@indent='0'">
            <_ufe:block-nospace/>
            <xsl:value-of select="@cond"/>
            <xsl:text>-</xsl:text>
            <xsl:value-of select="@type"/>
          </xsl:when>
        </xsl:choose>
      </xsl:with-param>
    </xsl:call-template>
  </xsl:template>

  <xsl:template match="sb-stat[@type='SPB']" mode="expand-gentext" priority="1">
    <xsl:call-template name="expand-gentext">
      <xsl:with-param name="content">
        <_ufe:block-nospace/>
        <xsl:value-of select="@cond"/>
        <xsl:text>-</xsl:text>
        <xsl:value-of select="string(substring-before(., ','))"/>
        <xsl:text> </xsl:text>
        <xsl:value-of select="@type"/>
        <xsl:text> NO. </xsl:text>
        <xsl:value-of select="string(substring-after(., ','))"/>
      </xsl:with-param>
    </xsl:call-template>
  </xsl:template>

  <xsl:template match="sb-stat" mode="expand-gentext" priority="0">
    <xsl:call-template name="expand-gentext">
      <xsl:with-param name="content">
        <_ufe:block-nospace/>
        <xsl:value-of select="@cond"/>
        <xsl:text>-</xsl:text>
        <xsl:value-of select="@type"/>
      </xsl:with-param>
    </xsl:call-template>
  </xsl:template>

  <xsl:template match="see" mode="expand-gentext" priority="0">
    <xsl:call-template name="expand-gentext">
      <xsl:with-param name="content">
        <xsl:choose>
          <xsl:when test="@ntype and string(@ntype)='FIGBDN'">
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
          </xsl:when>
          <xsl:when test="@ntype and string(@ntype)='CHAPFIGNHA'">
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
          </xsl:when>
          <xsl:when test="@ntype='CHAPFIGBDN'">
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
          </xsl:when>
          <xsl:when test="@ntype='CHAPFIG'">
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
          </xsl:when>
          <xsl:when test="@ntype='FIGNHA'">
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
          </xsl:when>
          <xsl:when test="@ntype='FIGNOTE' and not(@fignote-nbr)">
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
          </xsl:when>
          <xsl:when test="@ntype='FIGNOTE'">
            <_sfe:InternalLink>
              <xsl:if test="string(./@ref)">
                <xsl:attribute name="targetId">
                  <xsl:value-of select="string(./@ref)"/>
                </xsl:attribute>
              </xsl:if>
              <xsl:text>SEE NOTE </xsl:text>
              <xsl:value-of select="@fignote-nbr"/>
            </_sfe:InternalLink>
          </xsl:when>
        </xsl:choose>
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

  <xsl:template match="step2" mode="expand-gentext" priority="1">
    <xsl:call-template name="expand-gentext">
      <xsl:with-param name="content">
        <xsl:call-template name="t-styler-numbering"/>
        <xsl:text>&#xa0;</xsl:text>
        <xsl:text>&#xa0;</xsl:text>
      </xsl:with-param>
    </xsl:call-template>
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

  <xsl:template match="step3" mode="expand-gentext" priority="1">
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

  <xsl:template match="step4" mode="expand-gentext" priority="1">
    <xsl:call-template name="expand-gentext-numbering2"/>
  </xsl:template>

  <xsl:template match="numlist/step5" mode="expand-gentext" priority="2">
    <xsl:call-template name="expand-gentext"/>
  </xsl:template>

  <xsl:template match="step5[table/@tabstyle='frac']" mode="expand-gentext" priority="1">
    <xsl:call-template name="expand-gentext"/>
  </xsl:template>

  <xsl:template match="subattach" mode="expand-gentext" priority="0">
    <xsl:call-template name="expand-gentext3">
      <xsl:with-param name="content-before">
        <xsl:text>ATTACHING PARTS</xsl:text>
      </xsl:with-param>
      <xsl:with-param name="content-after">
        <xsl:processing-instruction name="Pub">_newline</xsl:processing-instruction>
        <xsl:text>------ * ------</xsl:text>
      </xsl:with-param>
    </xsl:call-template>
  </xsl:template>

  <xsl:template match="supp-code" mode="expand-gentext" priority="0">
    <xsl:call-template name="expand-gentext">
      <xsl:with-param name="content">
        <xsl:text>SUPPLIER CODE: </xsl:text>
      </xsl:with-param>
    </xsl:call-template>
  </xsl:template>

  <xsl:template match="supp-pn" mode="expand-gentext" priority="0">
    <xsl:call-template name="expand-gentext">
      <xsl:with-param name="content">
        <xsl:text>SUPPLIER P/N </xsl:text>
      </xsl:with-param>
    </xsl:call-template>
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
    <xsl:call-template name="expand-gentext-default"/>
  </xsl:template>

  <xsl:template match="lof/title" mode="expand-gentext" priority="18">
    <xsl:call-template name="expand-gentext-default"/>
  </xsl:template>

  <xsl:template match="spb-list/title" mode="expand-gentext" priority="14">
    <xsl:call-template name="expand-gentext-expanded"/>
  </xsl:template>

  <xsl:template match="service-bull-list/title" mode="expand-gentext" priority="10">
    <xsl:call-template name="expand-gentext-expanded"/>
  </xsl:template>

  <xsl:template match="module/title" mode="expand-gentext" priority="9">
    <xsl:call-template name="expand-gentext-expanded"/>
  </xsl:template>

  <xsl:template match="num-index/title" mode="expand-gentext" priority="7">
    <xsl:call-template name="expand-gentext-expanded"/>
  </xsl:template>
    
</xsl:stylesheet>

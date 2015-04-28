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

  <xsl:template match="build-spec" mode="gentext" priority="0">
    <xsl:call-template name="expand-gentext">
      <xsl:with-param name="content">
        <xsl:value-of select="$gen-texts//text[@name='buildspec']"/><xsl:text> </xsl:text>
      </xsl:with-param>
    </xsl:call-template>
  </xsl:template>

  <xsl:template match="dimen" mode="gentext" priority="0">
    <xsl:call-template name="expand-gentext3">
      <xsl:with-param name="content-before">
        <xsl:text> </xsl:text>
      </xsl:with-param>
      <xsl:with-param name="content-after">
        <xsl:text> </xsl:text>
      </xsl:with-param>
    </xsl:call-template>
  </xsl:template>

  <xsl:template match="figure[descendant::graphic]" mode="gentext" priority="1">
    <xsl:call-template name="expand-gentext-default"/>
  </xsl:template>

  <xsl:template match="graphic" mode="gentext" priority="0">
    <xsl:if test="not(@_gte:Gentext-Expanded)">
      <_sfe:BeforeOrAfterText>
        <xsl:choose>
          <xsl:when test="not(@size) or (@size!='big')"/>
          <xsl:otherwise>
            <_ufe:block-prespace>
              <!--xsl:text>(SHEET X OF Y)</xsl:text-->
              <xsl:if test="ancestor::figure and count(ancestor::figure//graphic[@size='big']) > 1">
                <xsl:variable name="l-id" select="@_gte:id"/>
                <xsl:text>(</xsl:text><xsl:value-of select="$gen-texts//text[@name='sheet']"/><xsl:text> </xsl:text><xsl:value-of select="count(ancestor::figure//graphic[@size='big' and following::graphic[@_gte:id=$l-id]])+1"/>
                <xsl:text> </xsl:text><xsl:value-of select="$gen-texts//text[@name='sheet-of']"/><xsl:text> </xsl:text>
                <xsl:value-of select="count(ancestor::figure//graphic[@size='big'])"/>
                <xsl:text>)</xsl:text>
              </xsl:if>
            </_ufe:block-prespace>
          </xsl:otherwise>
        </xsl:choose>
      </_sfe:BeforeOrAfterText>
    </xsl:if>
    <xsl:call-template name="expand-gentext"/>
  </xsl:template>

  <xsl:template match="inter" mode="gentext" priority="0">
    <xsl:call-template name="expand-gentext3">
      <xsl:with-param name="content-before">
        <xsl:choose>
          <xsl:when test="@prc='S'">
            <xsl:value-of select="$gen-texts//text[@name='inter-s']"/><xsl:text> </xsl:text>
          </xsl:when>
          <xsl:when test="@prc='N'">
            <xsl:value-of select="$gen-texts//text[@name='inter-n']"/><xsl:text> </xsl:text>
          </xsl:when>
          <xsl:when test="@prc=number('7')">
            <xsl:value-of select="$gen-texts//text[@name='inter-7']"/><xsl:text> </xsl:text>
          </xsl:when>
          <xsl:when test="@prc=number('6')">
            <xsl:value-of select="$gen-texts//text[@name='inter-6']"/><xsl:text> </xsl:text>
          </xsl:when>
          <xsl:when test="@prc=number('3')">
            <xsl:value-of select="$gen-texts//text[@name='inter-3']"/><xsl:text> </xsl:text>
          </xsl:when>
          <xsl:when test="@prc=number('2')">
            <xsl:value-of select="$gen-texts//text[@name='inter-2']"/><xsl:text> </xsl:text>
          </xsl:when>
          <xsl:when test="@prc=number('1')">
            <xsl:value-of select="$gen-texts//text[@name='inter-1']"/><xsl:text> </xsl:text>
          </xsl:when>
        </xsl:choose>
      </xsl:with-param>
      <xsl:with-param name="content-after">
        <xsl:if test="@prc=number('7')">
          <xsl:text>. </xsl:text><xsl:value-of select="$gen-texts//text[@name='inter-7-sb']"/><xsl:text>.</xsl:text>
        </xsl:if>
      </xsl:with-param>
    </xsl:call-template>
  </xsl:template>

  <xsl:template match="ipc-fig" mode="gentext" priority="0">
    <xsl:call-template name="expand-gentext">
      <xsl:with-param name="content">
        <_ufe:fig-title>
          <xsl:value-of select="$gen-texts//text[@name='figure']"/><xsl:text> </xsl:text>
          <xsl:if test="(ancestor-or-self::ipc-fig[1]//figno)[1]/*|(ancestor-or-self::ipc-fig[1]//figno)[1]/text()|(ancestor-or-self::ipc-fig[1]//figno)[1]/processing-instruction()">
            <_gte:Gentexted-Content-Wrapper>
              <xsl:apply-templates mode="gentext" select="(ancestor-or-self::ipc-fig[1]//figno)[1]/*|(ancestor-or-self::ipc-fig[1]//figno)[1]/text()|(ancestor-or-self::ipc-fig[1]//figno)[1]/processing-instruction()">
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

  <xsl:template match="kits" mode="gentext" priority="0">
    <xsl:call-template name="expand-gentext">
      <xsl:with-param name="content">
        <xsl:value-of select="$gen-texts//text[@name='kits']"/>
      </xsl:with-param>
    </xsl:call-template>
  </xsl:template>

  <xsl:template match="lpln" mode="gentext" priority="0">
    <xsl:call-template name="expand-gentext">
      <xsl:with-param name="content">
        <xsl:value-of select="$gen-texts//text[@name='lpln']"/><xsl:value-of select="$gen-texts//text[@name='sep0']"/>
        <xsl:text> </xsl:text>
      </xsl:with-param>
    </xsl:call-template>
  </xsl:template>

  <xsl:template match="name" mode="gentext" priority="0">
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
              <xsl:value-of select="$gen-texts//text[@name='opt-pn']"/>
            </_ufe:block-nospace>
          </xsl:when>
          <xsl:when test="&anc-pre-partnbr-nut-table; and ancestor::entry[preceding-sibling::entry[part-nbr[@indent = '3']]]">
            <_ufe:block-nospace>
              <xsl:value-of select="$gen-texts//text[@name='opt-pn']"/>
            </_ufe:block-nospace>
          </xsl:when>
          <xsl:when test="&anc-pre-partnbr-nut-table; and ancestor::entry[preceding-sibling::entry[part-nbr[@indent = '2']]]">
            <_ufe:block-nospace>
              <xsl:value-of select="$gen-texts//text[@name='opt-pn']"/>
            </_ufe:block-nospace>
          </xsl:when>
          <xsl:when test="&anc-pre-partnbr-nut-table; and ancestor::entry[preceding-sibling::entry[part-nbr[@indent = '1']]]">
            <_ufe:block-nospace>
              <xsl:value-of select="$gen-texts//text[@name='opt-pn']"/>
            </_ufe:block-nospace>
          </xsl:when>
        </xsl:choose>
      </xsl:with-param>
    </xsl:call-template>
  </xsl:template>

  <xsl:template match="nomen-col" mode="gentext" priority="0">
    <xsl:variable name="sel-at" select="@select-at"/>
    <xsl:call-template name="expand-gentext2">
      <xsl:with-param name="content">
        <xsl:choose>
          <xsl:when test="not(($sel-at='ASSEMBLY') and (parent::entry[preceding-sibling::entry[part-nbr[@ic-opt = 'LIST']]])) and not(($sel-at='BALANCING') and (parent::entry[preceding-sibling::entry[part-nbr[@ic-opt = 'LIST']]])) and not(($sel-at='DETAIL-BAL') and (parent::entry[preceding-sibling::entry[part-nbr[@ic-opt = 'LIST']]])) and not(($sel-at='TRIM-BAL') and (parent::entry[preceding-sibling::entry[part-nbr[@ic-opt = 'LIST']]])) and not(parent::entry[preceding-sibling::entry[part-nbr[@ic-opt = 'LIST']]]) and not($sel-at='ASSEMBLY') and not($sel-at='BALANCING') and not($sel-at='DETAIL-BAL') and ($sel-at='TRIM-BAL')">
            <_ufe:block-nospace>
              <xsl:value-of select="$gen-texts//text[@name='nomen-col-trim']"/>
            </_ufe:block-nospace>
          </xsl:when>
          <xsl:when test="not(($sel-at='ASSEMBLY') and (parent::entry[preceding-sibling::entry[part-nbr[@ic-opt = 'LIST']]])) and not(($sel-at='BALANCING') and (parent::entry[preceding-sibling::entry[part-nbr[@ic-opt = 'LIST']]])) and not(($sel-at='DETAIL-BAL') and (parent::entry[preceding-sibling::entry[part-nbr[@ic-opt = 'LIST']]])) and not(($sel-at='TRIM-BAL') and (parent::entry[preceding-sibling::entry[part-nbr[@ic-opt = 'LIST']]])) and not(parent::entry[preceding-sibling::entry[part-nbr[@ic-opt = 'LIST']]]) and not($sel-at='ASSEMBLY') and not($sel-at='BALANCING') and ($sel-at='DETAIL-BAL')">
            <_ufe:block-nospace>
              <xsl:value-of select="$gen-texts//text[@name='nomen-col-detail']"/>
            </_ufe:block-nospace>
          </xsl:when>
          <xsl:when test="not(($sel-at='ASSEMBLY') and (parent::entry[preceding-sibling::entry[part-nbr[@ic-opt = 'LIST']]])) and not(($sel-at='BALANCING') and (parent::entry[preceding-sibling::entry[part-nbr[@ic-opt = 'LIST']]])) and not(($sel-at='DETAIL-BAL') and (parent::entry[preceding-sibling::entry[part-nbr[@ic-opt = 'LIST']]])) and not(($sel-at='TRIM-BAL') and (parent::entry[preceding-sibling::entry[part-nbr[@ic-opt = 'LIST']]])) and not(parent::entry[preceding-sibling::entry[part-nbr[@ic-opt = 'LIST']]]) and not($sel-at='ASSEMBLY') and ($sel-at='BALANCING')">
            <_ufe:block-nospace>
              <xsl:value-of select="$gen-texts//text[@name='nomen-col-balancing']"/>
            </_ufe:block-nospace>
          </xsl:when>
          <xsl:when test="not(($sel-at='ASSEMBLY') and (parent::entry[preceding-sibling::entry[part-nbr[@ic-opt = 'LIST']]])) and not(($sel-at='BALANCING') and (parent::entry[preceding-sibling::entry[part-nbr[@ic-opt = 'LIST']]])) and not(($sel-at='DETAIL-BAL') and (parent::entry[preceding-sibling::entry[part-nbr[@ic-opt = 'LIST']]])) and not(($sel-at='TRIM-BAL') and (parent::entry[preceding-sibling::entry[part-nbr[@ic-opt = 'LIST']]])) and not(parent::entry[preceding-sibling::entry[part-nbr[@ic-opt = 'LIST']]]) and ($sel-at='ASSEMBLY')">
            <_ufe:block-nospace>
              <xsl:value-of select="$gen-texts//text[@name='nomen-col-assembly']"/>
            </_ufe:block-nospace>
          </xsl:when>
          <xsl:when test="not(($sel-at='ASSEMBLY') and (parent::entry[preceding-sibling::entry[part-nbr[@ic-opt = 'LIST']]])) and not(($sel-at='BALANCING') and (parent::entry[preceding-sibling::entry[part-nbr[@ic-opt = 'LIST']]])) and not(($sel-at='DETAIL-BAL') and (parent::entry[preceding-sibling::entry[part-nbr[@ic-opt = 'LIST']]])) and not(($sel-at='TRIM-BAL') and (parent::entry[preceding-sibling::entry[part-nbr[@ic-opt = 'LIST']]])) and (parent::entry[preceding-sibling::entry[part-nbr[@ic-opt = 'LIST']]])">
            <_ufe:block-nospace>
              <xsl:value-of select="$gen-texts//text[@name='nomen-col-list']"/><xsl:value-of select="$gen-texts//text[@name='sep0']"/>
            </_ufe:block-nospace>
          </xsl:when>
          <xsl:when test="not(($sel-at='ASSEMBLY') and (parent::entry[preceding-sibling::entry[part-nbr[@ic-opt = 'LIST']]])) and not(($sel-at='BALANCING') and (parent::entry[preceding-sibling::entry[part-nbr[@ic-opt = 'LIST']]])) and not(($sel-at='DETAIL-BAL') and (parent::entry[preceding-sibling::entry[part-nbr[@ic-opt = 'LIST']]])) and (($sel-at='TRIM-BAL') and (parent::entry[preceding-sibling::entry[part-nbr[@ic-opt = 'LIST']]]))">
            <_ufe:block-nospace>
              <xsl:value-of select="$gen-texts//text[@name='nomen-col-trim']"/>
            </_ufe:block-nospace>
            <_ufe:block-nospace>
              <xsl:value-of select="$gen-texts//text[@name='nomen-col-list']"/><xsl:value-of select="$gen-texts//text[@name='sep0']"/>
            </_ufe:block-nospace>
          </xsl:when>
          <xsl:when test="not(($sel-at='ASSEMBLY') and (parent::entry[preceding-sibling::entry[part-nbr[@ic-opt = 'LIST']]])) and not(($sel-at='BALANCING') and (parent::entry[preceding-sibling::entry[part-nbr[@ic-opt = 'LIST']]])) and (($sel-at='DETAIL-BAL') and (parent::entry[preceding-sibling::entry[part-nbr[@ic-opt = 'LIST']]]))">
            <_ufe:block-nospace>
              <xsl:value-of select="$gen-texts//text[@name='nomen-col-detail']"/>
            </_ufe:block-nospace>
            <_ufe:block-nospace>
              <xsl:value-of select="$gen-texts//text[@name='nomen-col-list']"/><xsl:value-of select="$gen-texts//text[@name='sep0']"/>
            </_ufe:block-nospace>
          </xsl:when>
          <xsl:when test="not(($sel-at='ASSEMBLY') and (parent::entry[preceding-sibling::entry[part-nbr[@ic-opt = 'LIST']]])) and (($sel-at='BALANCING') and (parent::entry[preceding-sibling::entry[part-nbr[@ic-opt = 'LIST']]]))">
            <_ufe:block-nospace>
              <xsl:value-of select="$gen-texts//text[@name='nomen-col-balancing']"/>
            </_ufe:block-nospace>
            <_ufe:block-nospace>
              <xsl:value-of select="$gen-texts//text[@name='nomen-col-list']"/><xsl:value-of select="$gen-texts//text[@name='sep0']"/>
            </_ufe:block-nospace>
          </xsl:when>
          <xsl:when test="($sel-at='ASSEMBLY') and (parent::entry[preceding-sibling::entry[part-nbr[@ic-opt = 'LIST']]])">
            <_ufe:block-nospace>
              <xsl:value-of select="$gen-texts//text[@name='nomen-col-assembly']"/>
            </_ufe:block-nospace>
            <_ufe:block-nospace>
              <xsl:value-of select="$gen-texts//text[@name='nomen-col-list']"/><xsl:value-of select="$gen-texts//text[@name='sep0']"/>
            </_ufe:block-nospace>
          </xsl:when>
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

  <xsl:template match="note" mode="gentext" priority="0">
    <xsl:call-template name="expand-gentext">
      <xsl:with-param name="content">
        <xsl:choose>
          <xsl:when test="(following-sibling::note) or (preceding-sibling::note)">
            <span class="x-note-label-2-0">
              <xsl:value-of select="$gen-texts//text[@name='note']"/>
            </span>
            <xsl:value-of select="$gen-texts//text[@name='sep0']"/>
            <xsl:text> </xsl:text>
            <xsl:call-template name="t-styler-numbering"/>
            <xsl:text> </xsl:text>
          </xsl:when>
          <xsl:otherwise>
            <span class="x-note-label-2-0">
              <xsl:value-of select="$gen-texts//text[@name='note']"/>
            </span>
            <xsl:value-of select="$gen-texts//text[@name='sep0']"/>
            <xsl:text> </xsl:text>
          </xsl:otherwise>
        </xsl:choose>
      </xsl:with-param>
    </xsl:call-template>
  </xsl:template>

  <xsl:template match="part-nbr" mode="gentext" priority="0">
    <xsl:call-template name="expand-gentext">
      <xsl:with-param name="content">
        <xsl:if test="@ref!=''">
          <_sfe:InternalLink>
              <xsl:attribute name="targetId">
                <xsl:value-of select="@ref"/>
              </xsl:attribute>
              <xsl:if test="node()[not(self::_sfe:BeforeOrAfterText)]">
                <_gte:Gentexted-Content-Wrapper>
                  <xsl:apply-templates mode="gentext">
                    <xsl:with-param name="skip-expanded-gentext" select="'yes'"/>
                  </xsl:apply-templates>
                </_gte:Gentexted-Content-Wrapper>
              </xsl:if>
          </_sfe:InternalLink>
        </xsl:if>
      </xsl:with-param>
    </xsl:call-template>
  </xsl:template>

  <xsl:template match="pntype[position()&gt;1]" mode="gentext" priority="1">
    <xsl:call-template name="expand-gentext">
      <xsl:with-param name="content">
        <xsl:choose>
          <xsl:when test="@cat='use-with' and preceding-sibling::pntype[1][@cat!='use-with']"> </xsl:when>
          <xsl:when test="@cat='field' and preceding-sibling::pntype[1][@cat!='field']">
            <xsl:value-of select="$gen-texts//text[@name='pntype-field']"/><xsl:text> </xsl:text>
          </xsl:when>
          <xsl:when test="@cat='rew' and preceding-sibling::pntype[1][@cat!='rew']">
            <xsl:value-of select="$gen-texts//text[@name='pntype-rew']"/><xsl:text> </xsl:text>
          </xsl:when>
          <xsl:when test="@cat='NewMay' and preceding-sibling::pntype[1][@cat!='NewMay']">
            <xsl:value-of select="$gen-texts//text[@name='pntype-newmay']"/><xsl:text> </xsl:text>
          </xsl:when>
          <xsl:when test="@cat='comp-of' and preceding-sibling::pntype[1][@cat!='comp-of']">
            <xsl:value-of select="$gen-texts//text[@name='pntype-comp-of']"/><xsl:text> </xsl:text>
          </xsl:when>
          <xsl:when test="@cat='use-with' and preceding-sibling::pntype[1][@cat='use-with']">
            <xsl:text> </xsl:text><xsl:value-of select="$gen-texts//text[@name='cond-and-2']"/><xsl:text> </xsl:text>
          </xsl:when>
          <xsl:when test="@cat='field' and preceding-sibling::pntype[1][@cat='field']">
            <xsl:text> </xsl:text><xsl:value-of select="$gen-texts//text[@name='cond-and-2']"/><xsl:text> </xsl:text>
          </xsl:when>
          <xsl:when test="@cat='rew' and preceding-sibling::pntype[1][@cat='rew']">
            <xsl:text> </xsl:text><xsl:value-of select="$gen-texts//text[@name='cond-or']"/><xsl:text> </xsl:text>
          </xsl:when>
          <xsl:when test="@cat='NewMay' and preceding-sibling::pntype[1][@cat='NewMay']">
            <xsl:text> </xsl:text><xsl:value-of select="$gen-texts//text[@name='cond-or']"/><xsl:text> </xsl:text>
          </xsl:when>
          <xsl:when test="@cat='comp-of' and preceding-sibling::pntype[1][@cat='comp-of']">
            <xsl:text> </xsl:text><xsl:value-of select="$gen-texts//text[@name='cond-and-2']"/><xsl:text> </xsl:text>
          </xsl:when>
        </xsl:choose>
      </xsl:with-param>
    </xsl:call-template>
  </xsl:template>

  <xsl:template match="pntype" mode="gentext" priority="0">
    <xsl:call-template name="expand-gentext">
      <xsl:with-param name="content">
        <xsl:choose>
          <xsl:when test="@cat='use-with'">
            <xsl:value-of select="$gen-texts//text[@name='pntype-use-with']"/><xsl:text> </xsl:text>
          </xsl:when>
          <xsl:when test="@cat='field'">
            <xsl:value-of select="$gen-texts//text[@name='pntype-field']"/><xsl:text> </xsl:text>
          </xsl:when>
          <xsl:when test="@cat='rew'">
            <xsl:value-of select="$gen-texts//text[@name='pntype-rew']"/><xsl:text> </xsl:text>
          </xsl:when>
          <xsl:when test="@cat='NewMay'">
            <xsl:value-of select="$gen-texts//text[@name='pntype-newmay']"/><xsl:text> </xsl:text>
          </xsl:when>
          <xsl:when test="@cat='comp-of'">
            <xsl:value-of select="$gen-texts//text[@name='pntype-comp-of']"/><xsl:text> </xsl:text>
          </xsl:when>
        </xsl:choose>
      </xsl:with-param>
    </xsl:call-template>
  </xsl:template>

  <xsl:template match="pwc-pn" mode="gentext" priority="0">
    <xsl:call-template name="expand-gentext">
      <xsl:with-param name="content">
        <xsl:value-of select="$gen-texts//text[@name='pwc-pn']"/><xsl:value-of select="$gen-texts//text[@name='sep0']"/>
        <xsl:text> </xsl:text>
      </xsl:with-param>
    </xsl:call-template>
  </xsl:template>

  <xsl:template match="range" mode="gentext" priority="0">
    <xsl:call-template name="expand-gentext">
      <xsl:with-param name="content">
        <xsl:choose>
          <xsl:when test="substring-before(.,',') != '0'">
            <xsl:value-of select="$gen-texts//text[@name='range-use']"/><xsl:text> </xsl:text>
            <xsl:value-of select="string(substring-before(.,','))"/>
            <xsl:text> </xsl:text><xsl:value-of select="$gen-texts//text[@name='range-min']"/><xsl:text> </xsl:text>
            <xsl:value-of select="string(substring-after(.,','))"/>
            <xsl:text> </xsl:text><xsl:value-of select="$gen-texts//text[@name='range-max']"/>
          </xsl:when>
          <xsl:otherwise>
            <xsl:value-of select="$gen-texts//text[@name='range-use']"/><xsl:text> </xsl:text>
            <xsl:value-of select="string(substring-before(.,','))"/>
            <xsl:text> </xsl:text><xsl:value-of select="$gen-texts//text[@name='range-to']"/><xsl:text> </xsl:text>
            <xsl:value-of select="string(substring-after(.,','))"/>
            <xsl:text> </xsl:text><xsl:value-of select="$gen-texts//text[@name='range-max']"/>
          </xsl:otherwise>
        </xsl:choose>
      </xsl:with-param>
    </xsl:call-template>
  </xsl:template>

  <xsl:template match="nomen-col/sb-stat[@type='SPB']" mode="gentext" priority="3">
    <xsl:call-template name="expand-gentext">
      <xsl:with-param name="content">
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
        <xsl:text> </xsl:text><xsl:value-of select="$gen-texts//text[@name='sb-stat-no']"/><xsl:text> </xsl:text>
        <xsl:value-of select="string(substring-after(., ','))"/>
      </xsl:with-param>
    </xsl:call-template>
  </xsl:template>

  <xsl:template match="nomen-col/sb-stat" mode="gentext" priority="2">
    <xsl:call-template name="expand-gentext">
      <xsl:with-param name="content">
        <xsl:choose>
          <xsl:when test="ancestor::entry/preceding-sibling::entry[2]/*[name()='part-nbr']/@indent='4'">
            <_ufe:hardspace/><_ufe:hardspace/><_ufe:hardspace/><_ufe:hardspace/><_ufe:hardspace/><_ufe:hardspace/>
            <xsl:value-of select="@cond"/>
            <xsl:text>-</xsl:text>
            <xsl:value-of select="@type"/>
          </xsl:when>
          <xsl:when test="ancestor::entry/preceding-sibling::entry[2]/*[name()='part-nbr']/@indent='3'">
            <_ufe:hardspace/><_ufe:hardspace/><_ufe:hardspace/><_ufe:hardspace/><_ufe:hardspace/>
            <xsl:value-of select="@cond"/>
            <xsl:text>-</xsl:text>
            <xsl:value-of select="@type"/>
          </xsl:when>
          <xsl:when test="ancestor::entry/preceding-sibling::entry[2]/*[name()='part-nbr']/@indent='2'">
            <_ufe:hardspace/><_ufe:hardspace/><_ufe:hardspace/><_ufe:hardspace/>
            <xsl:value-of select="@cond"/>
            <xsl:text>-</xsl:text>
            <xsl:value-of select="@type"/>
          </xsl:when>
          <xsl:when test="ancestor::entry/preceding-sibling::entry[2]/*[name()='part-nbr']/@indent='1'">
            <_ufe:hardspace/><_ufe:hardspace/><_ufe:hardspace/>
            <xsl:value-of select="@cond"/>
            <xsl:text>-</xsl:text>
            <xsl:value-of select="@type"/>
          </xsl:when>
          <xsl:when test="ancestor::entry/preceding-sibling::entry[2]/*[name()='part-nbr']/@indent='0'">
            <xsl:value-of select="@cond"/>
            <xsl:text>-</xsl:text>
            <xsl:value-of select="@type"/>
          </xsl:when>
        </xsl:choose>
      </xsl:with-param>
    </xsl:call-template>
  </xsl:template>

  <xsl:template match="sb-stat[@type='SPB']" mode="gentext" priority="1">
    <xsl:call-template name="expand-gentext">
      <xsl:with-param name="content">
        <xsl:value-of select="@cond"/>
        <xsl:text>-</xsl:text>
        <xsl:value-of select="string(substring-before(., ','))"/>
        <xsl:text> </xsl:text>
        <xsl:value-of select="@type"/>
        <xsl:text> </xsl:text><xsl:value-of select="$gen-texts//text[@name='sb-stat-no']"/><xsl:text> </xsl:text>
        <xsl:value-of select="string(substring-after(., ','))"/>
      </xsl:with-param>
    </xsl:call-template>
  </xsl:template>

  <xsl:template match="sb-stat" mode="gentext" priority="0">
    <xsl:call-template name="expand-gentext">
      <xsl:with-param name="content">
        <xsl:value-of select="@cond"/>
        <xsl:text>-</xsl:text>
        <xsl:value-of select="@type"/>
      </xsl:with-param>
    </xsl:call-template>
  </xsl:template>

  <xsl:template match="see" mode="gentext" priority="0">
    <xsl:call-template name="expand-gentext">
      <xsl:with-param name="content">
        <xsl:choose>
          <xsl:when test="@ntype='FIGBDN'">
            <_sfe:InternalLink>
              <xsl:if test="string(./@ref)">
                <xsl:attribute name="targetId">
                  <xsl:value-of select="string(./@ref)"/>
                </xsl:attribute>
              </xsl:if>
              <xsl:value-of select="$gen-texts//text[@name='see-lbl']"/><xsl:text> </xsl:text><xsl:value-of select="$gen-texts//text[@name='see-fig']"/><xsl:text> </xsl:text>
              <xsl:if test="node()[not(self::_sfe:BeforeOrAfterText)]">
                <_gte:Gentexted-Content-Wrapper>
                  <xsl:apply-templates mode="gentext">
                    <xsl:with-param name="skip-expanded-gentext" select="'yes'"/>
                  </xsl:apply-templates>
                </_gte:Gentexted-Content-Wrapper>
              </xsl:if>
              <xsl:text> </xsl:text><xsl:value-of select="$gen-texts//text[@name='see-brk']"/>
            </_sfe:InternalLink>
          </xsl:when>
          <xsl:when test="@ntype='CHAPFIGNHA'">
            <_sfe:InternalLink>
              <xsl:if test="string(./@ref)">
                <xsl:attribute name="targetId">
                  <xsl:value-of select="string(./@ref)"/>
                </xsl:attribute>
              </xsl:if>
              <xsl:value-of select="$gen-texts//text[@name='see-lbl']"/><xsl:text> </xsl:text>
              <xsl:value-of select="string(substring-before(.,' '))"/>
              <xsl:text> </xsl:text><xsl:value-of select="$gen-texts//text[@name='see-fig']"/>
              <xsl:value-of select="string(substring-after(.,' '))"/>
              <xsl:text> </xsl:text><xsl:value-of select="$gen-texts//text[@name='see-nha']"/>
            </_sfe:InternalLink>
          </xsl:when>
          <xsl:when test="@ntype='CHAPFIGBDN'">
            <_sfe:InternalLink>
              <xsl:if test="string(./@ref)">
                <xsl:attribute name="targetId">
                  <xsl:value-of select="string(./@ref)"/>
                </xsl:attribute>
              </xsl:if>
              <xsl:value-of select="$gen-texts//text[@name='see-lbl']"/><xsl:text> </xsl:text>
              <xsl:value-of select="string(substring-before(.,' '))"/>
              <xsl:text> </xsl:text><xsl:value-of select="$gen-texts//text[@name='see-fig']"/>
              <xsl:value-of select="string(substring-after(.,' '))"/>
              <xsl:text> </xsl:text><xsl:value-of select="$gen-texts//text[@name='see-brk']"/>
            </_sfe:InternalLink>
          </xsl:when>
          <xsl:when test="@ntype='CHAPFIG'">
            <_sfe:InternalLink>
              <xsl:if test="string(./@ref)">
                <xsl:attribute name="targetId">
                  <xsl:value-of select="string(./@ref)"/>
                </xsl:attribute>
              </xsl:if>
              <xsl:value-of select="$gen-texts//text[@name='see-lbl']"/><xsl:text> </xsl:text>
              <xsl:value-of select="string(substring-before(.,' '))"/>
              <xsl:text> </xsl:text><xsl:value-of select="$gen-texts//text[@name='see-fig']"/>
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
              <xsl:value-of select="$gen-texts//text[@name='see-lbl']"/><xsl:text> </xsl:text><xsl:value-of select="$gen-texts//text[@name='see-fig']"/><xsl:text> </xsl:text>
              <xsl:if test="node()[not(self::_sfe:BeforeOrAfterText)]">
                <_gte:Gentexted-Content-Wrapper>
                  <xsl:apply-templates mode="gentext">
                    <xsl:with-param name="skip-expanded-gentext" select="'yes'"/>
                  </xsl:apply-templates>
                </_gte:Gentexted-Content-Wrapper>
              </xsl:if>
              <xsl:text> </xsl:text><xsl:value-of select="$gen-texts//text[@name='see-nha']"/>
            </_sfe:InternalLink>
          </xsl:when>
          <xsl:when test="@ntype='FIGNOTE' and not(@fignote-nbr)">
            <_sfe:InternalLink>
              <xsl:if test="string(./@ref)">
                <xsl:attribute name="targetId">
                  <xsl:value-of select="string(./@ref)"/>
                </xsl:attribute>
              </xsl:if>
              <xsl:value-of select="$gen-texts//text[@name='see-lbl']"/><xsl:text> </xsl:text><xsl:value-of select="$gen-texts//text[@name='see-note']"/><xsl:text> </xsl:text>
              <xsl:if test="node()[not(self::_sfe:BeforeOrAfterText)]">
                <_gte:Gentexted-Content-Wrapper>
                  <xsl:apply-templates mode="gentext">
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
              <xsl:value-of select="$gen-texts//text[@name='see-lbl']"/><xsl:text> </xsl:text><xsl:value-of select="$gen-texts//text[@name='see-note']"/><xsl:text> </xsl:text>
              <xsl:value-of select="@fignote-nbr"/>
            </_sfe:InternalLink>
          </xsl:when>
        </xsl:choose>
      </xsl:with-param>
    </xsl:call-template>
  </xsl:template>

  <xsl:template match="numlist/step" mode="gentext" priority="3">
    <xsl:call-template name="expand-gentext-numbering"/>
  </xsl:template>

  <xsl:template match="procedure//step" mode="gentext" priority="2">
    <xsl:call-template name="expand-gentext">
      <xsl:with-param name="content">
        <xsl:call-template name="t-styler-numbering"/>
        <xsl:text> </xsl:text>
      </xsl:with-param>
    </xsl:call-template>
  </xsl:template>

  <xsl:template match="step[table/@tabstyle='frac']" mode="gentext" priority="1">
    <xsl:call-template name="expand-gentext-numbering2"/>
  </xsl:template>

  <xsl:template match="numlist/step2" mode="gentext" priority="2">
    <xsl:call-template name="expand-gentext-numbering"/>
  </xsl:template>

  <xsl:template match="step2" mode="gentext" priority="1">
    <xsl:call-template name="expand-gentext">
      <xsl:with-param name="content">
        <xsl:call-template name="t-styler-numbering"/>
        <xsl:text>&#xa0;</xsl:text>
        <xsl:text>&#xa0;</xsl:text>
      </xsl:with-param>
    </xsl:call-template>
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

  <xsl:template match="step3" mode="gentext" priority="1">
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

  <xsl:template match="step4" mode="gentext" priority="1">
    <xsl:call-template name="expand-gentext-numbering2"/>
  </xsl:template>

  <xsl:template match="numlist/step5" mode="gentext" priority="2">
    <xsl:call-template name="expand-gentext"/>
  </xsl:template>

  <xsl:template match="step5[table/@tabstyle='frac']" mode="gentext" priority="1">
    <xsl:call-template name="expand-gentext"/>
  </xsl:template>

  <xsl:template match="subattach" mode="gentext" priority="0">
    <xsl:call-template name="expand-gentext3">
      <xsl:with-param name="content-before">
        <xsl:value-of select="$gen-texts//text[@name='subattach']"/>
      </xsl:with-param>
      <xsl:with-param name="content-after">
        <xsl:processing-instruction name="Pub">_newline</xsl:processing-instruction>
        <xsl:text>------ * ------</xsl:text>
      </xsl:with-param>
    </xsl:call-template>
  </xsl:template>

  <xsl:template match="supp-code" mode="gentext" priority="0">
    <xsl:call-template name="expand-gentext">
      <xsl:with-param name="content">
        <xsl:value-of select="$gen-texts//text[@name='supp-code']"/><xsl:value-of select="$gen-texts//text[@name='sep0']"/>
        <xsl:text> </xsl:text>
      </xsl:with-param>
    </xsl:call-template>
  </xsl:template>

  <xsl:template match="supp-pn" mode="gentext" priority="0">
    <xsl:call-template name="expand-gentext">
      <xsl:with-param name="content">
        <xsl:value-of select="$gen-texts//text[@name='supp-pn']"/><xsl:text> </xsl:text>
      </xsl:with-param>
    </xsl:call-template>
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
    <xsl:call-template name="expand-gentext-default"/>
  </xsl:template>

  <xsl:template match="pwcspblist/title" mode="gentext" priority="35">
    <xsl:call-template name="expand-gentext-default"/>
  </xsl:template>

  <xsl:template match="sblist/title" mode="gentext" priority="32">
    <xsl:call-template name="expand-gentext-default"/>
  </xsl:template>

  <xsl:template match="pwcni/title" mode="gentext" priority="31">
    <xsl:call-template name="expand-gentext-default"/>
  </xsl:template>

  <xsl:template match="vendlist/title" mode="gentext" priority="30">
    <xsl:call-template name="expand-gentext-default"/>
  </xsl:template>

  <xsl:template match="lof-item/title" mode="gentext" priority="21">
    <xsl:call-template name="expand-gentext-default"/>
  </xsl:template>

  <xsl:template match="lof/title" mode="gentext" priority="18">
    <xsl:call-template name="expand-gentext-default"/>
  </xsl:template>

  <xsl:template match="spb-list/title" mode="gentext" priority="14">
    <xsl:call-template name="expand-gentext-expanded"/>
  </xsl:template>

  <xsl:template match="service-bull-list/title" mode="gentext" priority="10">
    <xsl:call-template name="expand-gentext-expanded"/>
  </xsl:template>

  <xsl:template match="module/title" mode="gentext" priority="9">
    <xsl:call-template name="expand-gentext-expanded"/>
  </xsl:template>

  <xsl:template match="num-index/title" mode="gentext" priority="7">
    <xsl:call-template name="expand-gentext-expanded"/>
  </xsl:template>
    
</xsl:stylesheet>

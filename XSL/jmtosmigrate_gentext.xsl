<?xml version="1.0" encoding="UTF-8"?>

<!DOCTYPE xsl:stylesheet [
    <!ENTITY % entities_commun SYSTEM "xsl_entities_commun.ent">
    %entities_commun;
]>

<xsl:stylesheet xmlns="http://www.w3.org/1999/xhtml" 
  xmlns:exslt="http://exslt.org/common"
  xmlns:xsl="http://www.w3.org/1999/XSL/Transform" 
  xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
  xmlns:atidlm="http://www.arbortext.com/namespace/atidlm"   
  xmlns:_gte="http://www.arbortext.com/namespace/Styler/GeneratedTextElements"
  xmlns:_ufe="http://www.arbortext.com/namespace/Styler/UserFormattingElements" 
  xmlns:_sfe="http://www.arbortext.com/namespace/Styler/StylerFormattingElements" 
  version="1.0" 
  exclude-result-prefixes="xml xsi exslt _ufe _sfe _gte atidlm">

  <xsl:template match="con" mode="gentext" priority="0">
    <xsl:call-template name="expand-gentext">
      <xsl:with-param name="content">
        <xsl:choose>
          <xsl:when test="((./refint|./*[not(self::_sfe:BeforeOrAfterText)]//refint)) and (not(./connbr|./*[not(self::_sfe:BeforeOrAfterText)]//connbr))">
            <_sfe:BeforeOrAfterText>
              <xsl:if test="(ancestor-or-self::con[1]//conname)[1]/*|(ancestor-or-self::con[1]//conname)[1]/text()|(ancestor-or-self::con[1]//conname)[1]/processing-instruction()">
                <_gte:Gentexted-Content-Wrapper>
                  <xsl:apply-templates mode="gentext" select="(ancestor-or-self::con[1]//conname)[1]/*|(ancestor-or-self::con[1]//conname)[1]/text()|(ancestor-or-self::con[1]//conname)[1]/processing-instruction()">
                    <xsl:with-param name="skip-expanded-gentext" select="'yes'"/>
                  </xsl:apply-templates>
                </_gte:Gentexted-Content-Wrapper>
              </xsl:if>
              <xsl:text> (</xsl:text>
              <xsl:if test="(ancestor-or-self::con[1]//refint)[1]/*|(ancestor-or-self::con[1]//refint)[1]/text()|(ancestor-or-self::con[1]//refint)[1]/processing-instruction()">
                <_gte:Gentexted-Content-Wrapper>
                  <xsl:apply-templates mode="gentext" select="(ancestor-or-self::con[1]//refint)[1]/*|(ancestor-or-self::con[1]//refint)[1]/text()|(ancestor-or-self::con[1]//refint)[1]/processing-instruction()">
                    <xsl:with-param name="skip-expanded-gentext" select="'yes'"/>
                  </xsl:apply-templates>
                </_gte:Gentexted-Content-Wrapper>
              </xsl:if>
              <xsl:text>)</xsl:text>
            </_sfe:BeforeOrAfterText>
          </xsl:when>
          <xsl:otherwise>
            <xsl:if test="(ancestor-or-self::con[1]//conname)[1]/*|(ancestor-or-self::con[1]//conname)[1]/text()|(ancestor-or-self::con[1]//conname)[1]/processing-instruction()">
              <_gte:Gentexted-Content-Wrapper>
                <xsl:apply-templates mode="gentext" select="(ancestor-or-self::con[1]//conname)[1]/*|(ancestor-or-self::con[1]//conname)[1]/text()|(ancestor-or-self::con[1]//conname)[1]/processing-instruction()">
                  <xsl:with-param name="skip-expanded-gentext" select="'yes'"/>
                </xsl:apply-templates>
              </_gte:Gentexted-Content-Wrapper>
            </xsl:if>
            <xsl:text> (</xsl:text>
            <xsl:if test="(ancestor-or-self::con[1]//connbr)[1]/*|(ancestor-or-self::con[1]//connbr)[1]/text()|(ancestor-or-self::con[1]//connbr)[1]/processing-instruction()">
              <_gte:Gentexted-Content-Wrapper>
                <xsl:apply-templates mode="gentext" select="(ancestor-or-self::con[1]//connbr)[1]/*|(ancestor-or-self::con[1]//connbr)[1]/text()|(ancestor-or-self::con[1]//connbr)[1]/processing-instruction()">
                  <xsl:with-param name="skip-expanded-gentext" select="'yes'"/>
                </xsl:apply-templates>
              </_gte:Gentexted-Content-Wrapper>
            </xsl:if>
            <xsl:text>)</xsl:text>
          </xsl:otherwise>
        </xsl:choose>
      </xsl:with-param>
    </xsl:call-template>
  </xsl:template>

  <xsl:template match="pgblk/effect" mode="gentext" priority="1">
    <xsl:call-template name="expand-gentext">
      <xsl:with-param name="content">
        <xsl:value-of select="concat($gen-texts//text[@name='effect'], $gen-texts//text[@name='sep0'], ' ', @effrg)"/>
      </xsl:with-param>
    </xsl:call-template>
  </xsl:template>

  <xsl:template match="effect" mode="gentext" priority="0">
    <xsl:call-template name="expand-gentext">
      <xsl:with-param name="content">
        <xsl:value-of select="@effrg"/>
      </xsl:with-param>
    </xsl:call-template>
  </xsl:template>

  <xsl:template match="equ[child::table]" mode="gentext" priority="1">
    <xsl:call-template name="expand-gentext-default"/>
  </xsl:template>

  <xsl:template match="figure[descendant::graphic]" mode="gentext" priority="1">
    <xsl:call-template name="expand-gentext-default"/>
  </xsl:template>

  <xsl:template match="graphic[descendant::sheet]" mode="gentext" priority="1">
    <xsl:call-template name="expand-gentext-default"/>
  </xsl:template>

  <xsl:template match="pbfmatr//list1/l1item[child::*[1] != 'note']" mode="gentext" priority="4">
    <xsl:call-template name="expand-gentext-numbering5"/>
  </xsl:template>

  <xsl:template match="pbfmatr//list1/l1item" mode="gentext" priority="3">
    <xsl:call-template name="expand-gentext-numbering5"/>
  </xsl:template>

  <xsl:template match="list1/l1item[child::*[1] != 'note']" mode="gentext" priority="2">
    <xsl:call-template name="expand-gentext-numbering5"/>
  </xsl:template>

  <xsl:template match="list1/l1item" mode="gentext" priority="1">
    <xsl:call-template name="expand-gentext-numbering5"/>
  </xsl:template>

  <xsl:template match="pbfmatr//list2/l2item[child::*[1] != 'note']" mode="gentext" priority="4">
    <xsl:call-template name="expand-gentext-numbering5"/>
  </xsl:template>

  <xsl:template match="pbfmatr//list2/l2item" mode="gentext" priority="3">
    <xsl:call-template name="expand-gentext-numbering5"/>
  </xsl:template>

  <xsl:template match="list2/l2item[child::*[1] != 'note']" mode="gentext" priority="2">
    <xsl:call-template name="expand-gentext-numbering5"/>
  </xsl:template>

  <xsl:template match="list2/l2item" mode="gentext" priority="1">
    <xsl:call-template name="expand-gentext-numbering5"/>
  </xsl:template>

  <xsl:template match="pbfmatr//list3/l3item[child::*[1] != 'note']" mode="gentext" priority="4">
    <xsl:call-template name="expand-gentext-numbering5"/>
  </xsl:template>

  <xsl:template match="pbfmatr//list3/l3item" mode="gentext" priority="3">
    <xsl:call-template name="expand-gentext-numbering2"/>
  </xsl:template>

  <xsl:template match="list3/l3item" mode="gentext" priority="1">
    <xsl:call-template name="expand-gentext-numbering2"/>
  </xsl:template>

  <xsl:template match="pbfmatr//list4/l4item[child::*[1] != 'note']" mode="gentext" priority="4">
    <xsl:call-template name="expand-gentext-numbering2"/>
  </xsl:template>

  <xsl:template match="pbfmatr//list4/l4item" mode="gentext" priority="3">
    <xsl:call-template name="expand-gentext-numbering2"/>
  </xsl:template>

  <xsl:template match="list4/l4item[child::*[1] != 'note']" mode="gentext" priority="2">
    <xsl:call-template name="expand-gentext-numbering2"/>
  </xsl:template>

  <xsl:template match="list4/l4item" mode="gentext" priority="1">
    <xsl:call-template name="expand-gentext-numbering2"/>
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

  <xsl:template match="numlist/numlitem" mode="gentext" priority="1">
    <xsl:call-template name="expand-gentext-numbering5"/>
  </xsl:template>

  <xsl:template match="frontmatter//module/pageblock-title" mode="gentext" priority="1">
    <xsl:call-template name="expand-gentext-numbering3"/>
  </xsl:template>

  <xsl:template match="pageblock-title" mode="gentext" priority="0">
    <xsl:call-template name="expand-gentext-expanded"/>
  </xsl:template>

  <xsl:template match="prclist1/prcitem1" mode="gentext" priority="1">
    <xsl:call-template name="expand-gentext-default"/>
  </xsl:template>

  <xsl:template match="prclist2/prcitem2" mode="gentext" priority="1">
    <xsl:call-template name="expand-gentext-default"/>
  </xsl:template>

  <xsl:template match="prclist3/prcitem3" mode="gentext" priority="1">
    <xsl:call-template name="expand-gentext-default"/>
  </xsl:template>

  <xsl:template match="prclist4/prcitem4" mode="gentext" priority="2">
    <xsl:call-template name="expand-gentext-default"/>
  </xsl:template>

  <xsl:template match="numlist/prcitem4" mode="gentext" priority="1">
    <xsl:call-template name="expand-gentext-numbering"/>
  </xsl:template>

  <xsl:template match="pwcchapsect-list" mode="gentext" priority="0">
    <xsl:call-template name="expand-gentext">
      <xsl:with-param name="content">
        <_ufe:chapsect-title/>
      </xsl:with-param>
    </xsl:call-template>
  </xsl:template>

  <xsl:template match="pwcem-title" mode="gentext" priority="0">
    <xsl:call-template name="expand-gentext3">
      <xsl:with-param name="content-before">
        <_ufe:engine-type>
          <xsl:if test="string(./@enginetype)">
            <xsl:attribute name="enginetype">
              <xsl:value-of select="string(./@enginetype)"/>
            </xsl:attribute>
          </xsl:if>
        </_ufe:engine-type>
        <_ufe:title-block>
          <xsl:value-of select="$gen-texts//text[@name='pwcem-title-1']"/>
        </_ufe:title-block>
        <_ufe:title-block>
          <xsl:value-of select="@model"/>
          <xsl:text> </xsl:text><xsl:value-of select="$gen-texts//text[@name='pwcem-title-2']"/>
        </_ufe:title-block>
        <_ufe:title-block>
          <xsl:value-of select="$gen-texts//text[@name='pwcem-title-3']"/>
          <xsl:value-of select="@docnbr"/>
        </_ufe:title-block>
        <_ufe:title-block>
          <xsl:value-of select="$gen-texts//text[@name='pwcem-title-4']"/><xsl:text> </xsl:text>
          <xsl:call-template name="FormatDate">
            <xsl:with-param name="DateTime" select="@oidate"/>
            <xsl:with-param name="DateFormat">dmy</xsl:with-param>
          </xsl:call-template>
        </_ufe:title-block>
        <!--
        <span style="font-size: 11pt; font-weight: normal; ">
          <xsl:if test="(ancestor-or-self::pwcem-title[1]//statement)[1]/*|(ancestor-or-self::pwcem-title[1]//statement)[1]/text()|(ancestor-or-self::pwcem-title[1]//statement)[1]/processing-instruction()">
            <_gte:Gentexted-Content-Wrapper>
              <xsl:apply-templates mode="gentext" select="(ancestor-or-self::pwcem-title[1]//statement)[1]/*|(ancestor-or-self::pwcem-title[1]//statement)[1]/text()|(ancestor-or-self::pwcem-title[1]//statement)[1]/processing-instruction()">
                <xsl:with-param name="skip-expanded-gentext" select="'yes'"/>
              </xsl:apply-templates>
            </_gte:Gentexted-Content-Wrapper>
          </xsl:if>
        </span>
        -->
        <xsl:if test="(ancestor-or-self::pwcem-title[1]//statement)[1]/*|(ancestor-or-self::pwcem-title[1]//statement)[1]/text()|(ancestor-or-self::pwcem-title[1]//statement)[1]/processing-instruction()">
          <xsl:copy-of select="ancestor-or-self::pwcem-title[1]/*[self::revst[following-sibling::statement]]"/>
          <_ufe:statement><xsl:apply-templates select="ancestor-or-self::pwcem-title[1]/statement/node()" mode="gentext"/></_ufe:statement>
          <xsl:copy-of select="ancestor-or-self::pwcem-title[1]/*[self::revend[preceding-sibling::*[1][self::statement]]]"/>
        </xsl:if>
      </xsl:with-param>
      <xsl:with-param name="content-after">
        <_ufe:proprietary-notice/>
      </xsl:with-param>
    </xsl:call-template>
  </xsl:template>

  <xsl:template match="revst[following-sibling::statement]" mode="gentext" priority="3"/>
  <xsl:template match="revend[preceding-sibling::*[1][self::statement]]" mode="gentext" priority="3"/>

  <xsl:template match="pwclmm-title" mode="gentext" priority="0">
    <xsl:call-template name="expand-gentext3">
      <xsl:with-param name="content-before">
        <_ufe:engine-type>
          <xsl:if test="string(./@enginetype)">
            <xsl:attribute name="enginetype">
              <xsl:value-of select="string(./@enginetype)"/>
            </xsl:attribute>
          </xsl:if>
        </_ufe:engine-type>
        <_ufe:title-block>
          <xsl:value-of select="$gen-texts//text[@name='pwcem-title-1']"/>
        </_ufe:title-block>
        <_ufe:title-block>
          <xsl:value-of select="@model"/>
          <xsl:text> </xsl:text><xsl:value-of select="$gen-texts//text[@name='pwcem-title-2']"/>
        </_ufe:title-block>
        <_ufe:title-block>
          <xsl:value-of select="$gen-texts//text[@name='pwcem-title-3']"/>
          <xsl:value-of select="@docnbr"/>
        </_ufe:title-block>
        <_ufe:title-block>
          <xsl:value-of select="$gen-texts//text[@name='pwcem-title-4']"/><xsl:text> </xsl:text>
          <xsl:call-template name="FormatDate">
            <xsl:with-param name="DateTime" select="@oidate"/>
            <xsl:with-param name="DateFormat">dmy</xsl:with-param>
          </xsl:call-template>
        </_ufe:title-block>
        <!--
        <span style="font-size: 11pt; font-weight: normal; ">
          <xsl:if test="(ancestor-or-self::pwclmm-title[1]//statement)[1]/*|(ancestor-or-self::pwclmm-title[1]//statement)[1]/text()|(ancestor-or-self::pwclmm-title[1]//statement)[1]/processing-instruction()">
            <_gte:Gentexted-Content-Wrapper>
              <xsl:apply-templates mode="gentext" select="(ancestor-or-self::pwclmm-title[1]//statement)[1]/*|(ancestor-or-self::pwclmm-title[1]//statement)[1]/text()|(ancestor-or-self::pwclmm-title[1]//statement)[1]/processing-instruction()">
                <xsl:with-param name="skip-expanded-gentext" select="'yes'"/>
              </xsl:apply-templates>
            </_gte:Gentexted-Content-Wrapper>
          </xsl:if>
        </span>
        -->
        <xsl:if test="(ancestor-or-self::pwclmm-title[1]//statement)[1]/*|(ancestor-or-self::pwclmm-title[1]//statement)[1]/text()|(ancestor-or-self::pwclmm-title[1]//statement)[1]/processing-instruction()">
          <xsl:copy-of select="ancestor-or-self::pwclmm-title[1]/*[self::revst[following-sibling::statement]]"/>
          <_ufe:statement><xsl:apply-templates select="ancestor-or-self::pwclmm-title[1]/statement/node()" mode="gentext"/></_ufe:statement>
          <xsl:copy-of select="ancestor-or-self::pwclmm-title[1]/*[self::revend[preceding-sibling::*[1][self::statement]]]"/>
        </xsl:if>
      </xsl:with-param>
      <xsl:with-param name="content-after">
        <_ufe:proprietary-notice/>
      </xsl:with-param>
    </xsl:call-template>
  </xsl:template>

  <xsl:template match="sbeff" mode="gentext" priority="0">
    <xsl:call-template name="expand-gentext">
      <xsl:with-param name="content">
        <xsl:choose>
          <xsl:when test="not(@sbcond) or @sbcond='NA' or @sbcond='na' or @sbcond='RWK' or @sbcond='rwk'">
            <_sfe:BeforeOrAfterText>
              <xsl:value-of select="$gen-texts//text[@name='sb']"/>
              <xsl:value-of select="@sbnbr"/>
            </_sfe:BeforeOrAfterText>
          </xsl:when>
          <xsl:otherwise>
            <xsl:value-of select="@sbcond"/>
            <xsl:text>-</xsl:text><xsl:value-of select="$gen-texts//text[@name='sb']"/>
            <xsl:value-of select="@sbnbr"/>
          </xsl:otherwise>
        </xsl:choose>
      </xsl:with-param>
    </xsl:call-template>
  </xsl:template>

  <xsl:template match="sbnbr" mode="gentext" priority="0">
    <xsl:call-template name="expand-gentext2">
      <xsl:with-param name="content">
        <xsl:text> </xsl:text>
        <xsl:value-of select="@pwcrevno"/>
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
              <xsl:if test="(ancestor-or-self::graphic[1]//sheet)[position()=last()]/@sheetnbr &gt; 1">
                <xsl:text>(</xsl:text><xsl:value-of select="$gen-texts//text[@name='sheet']"/><xsl:text> </xsl:text>
                <xsl:value-of select="@sheetnbr"/>
                <xsl:text> </xsl:text><xsl:value-of select="$gen-texts//text[@name='sheet-of']"/><xsl:text> </xsl:text>
                <xsl:value-of select="(ancestor-or-self::graphic[1]//sheet)[position()=last()]/@sheetnbr"/>
                <xsl:text>)</xsl:text>
              </xsl:if>
            </_ufe:block-prespace>
          </_sfe:BeforeOrAfterText>
        </xsl:if>
      </xsl:otherwise>
    </xsl:choose>
    <xsl:copy>
      <xsl:attribute name="_gte:Gentext-Expanded">y</xsl:attribute>
      <xsl:apply-templates mode="gentext" select="@*"/>
      <xsl:apply-templates mode="gentext" select="* | text() | processing-instruction()"/>
    </xsl:copy>
  </xsl:template>

  <xsl:template match="std" mode="gentext" priority="0">
    <xsl:call-template name="expand-gentext">
      <xsl:with-param name="content">
        <xsl:choose>
          <xsl:when test="(self::std/stdnbr[contains(., 'NA')]) and (string-length(self::std/stdnbr) = 2)">
            <xsl:if test="(ancestor-or-self::std[1]//stdname)[1]/*|(ancestor-or-self::std[1]//stdname)[1]/text()|(ancestor-or-self::std[1]//stdname)[1]/processing-instruction()">
              <_gte:Gentexted-Content-Wrapper>
                <xsl:apply-templates mode="gentext" select="(ancestor-or-self::std[1]//stdname)[1]/*|(ancestor-or-self::std[1]//stdname)[1]/text()|(ancestor-or-self::std[1]//stdname)[1]/processing-instruction()">
                  <xsl:with-param name="skip-expanded-gentext" select="'yes'"/>
                </xsl:apply-templates>
              </_gte:Gentexted-Content-Wrapper>
            </xsl:if>
          </xsl:when>
          <xsl:otherwise>
            <xsl:if test="(ancestor-or-self::std[1]//stdname)[1]/*|(ancestor-or-self::std[1]//stdname)[1]/text()|(ancestor-or-self::std[1]//stdname)[1]/processing-instruction()">
              <_gte:Gentexted-Content-Wrapper>
                <xsl:apply-templates mode="gentext" select="(ancestor-or-self::std[1]//stdname)[1]/*|(ancestor-or-self::std[1]//stdname)[1]/text()|(ancestor-or-self::std[1]//stdname)[1]/processing-instruction()">
                  <xsl:with-param name="skip-expanded-gentext" select="'yes'"/>
                </xsl:apply-templates>
              </_gte:Gentexted-Content-Wrapper>
            </xsl:if>
            <xsl:text> (</xsl:text>
            <xsl:if test="(ancestor-or-self::std[1]//stdnbr)[1]/*|(ancestor-or-self::std[1]//stdnbr)[1]/text()|(ancestor-or-self::std[1]//stdnbr)[1]/processing-instruction()">
              <_gte:Gentexted-Content-Wrapper>
                <xsl:apply-templates mode="gentext" select="(ancestor-or-self::std[1]//stdnbr)[1]/*|(ancestor-or-self::std[1]//stdnbr)[1]/text()|(ancestor-or-self::std[1]//stdnbr)[1]/processing-instruction()">
                  <xsl:with-param name="skip-expanded-gentext" select="'yes'"/>
                </xsl:apply-templates>
              </_gte:Gentexted-Content-Wrapper>
            </xsl:if>
            <xsl:text>)</xsl:text>
          </xsl:otherwise>
        </xsl:choose>
      </xsl:with-param>
    </xsl:call-template>
  </xsl:template>

  <xsl:template match="numlist/step" mode="gentext" priority="3">
    <xsl:call-template name="expand-gentext-numbering"/>
  </xsl:template>

  <xsl:template match="procedure//step[child::*[1] != 'note']" mode="gentext" priority="2">
    <xsl:call-template name="expand-gentext-numbering5"/>
  </xsl:template>

  <xsl:template match="procedure//step" mode="gentext" priority="10">
    <xsl:call-template name="expand-gentext-numbering5"/>
  </xsl:template>

  <xsl:template match="numlist/step2" mode="gentext" priority="2">
    <xsl:call-template name="expand-gentext-numbering"/>
  </xsl:template>

  <xsl:template match="step2[child::*[1] != 'note']" mode="gentext" priority="1">
    <xsl:call-template name="expand-gentext-numbering5"/>
  </xsl:template>

  <xsl:template match="step2" mode="gentext" priority="0">
    <xsl:call-template name="expand-gentext-numbering5"/>
  </xsl:template>

  <xsl:template match="numlist/step3" mode="gentext" priority="2">
    <xsl:call-template name="expand-gentext-numbering"/>
  </xsl:template>

  <xsl:template match="step3[child::*[1] != 'note']" mode="gentext" priority="1">
    <xsl:call-template name="expand-gentext-numbering5"/>
  </xsl:template>

  <xsl:template match="step3" mode="gentext" priority="0">
    <xsl:call-template name="expand-gentext-numbering2"/>
  </xsl:template>

  <xsl:template match="numlist/step4" mode="gentext" priority="2">
    <xsl:call-template name="expand-gentext-numbering"/>
  </xsl:template>

  <xsl:template match="step4[child::*[1] != 'note']" mode="gentext" priority="1">
    <xsl:call-template name="expand-gentext-numbering5"/>
  </xsl:template>

  <xsl:template match="step4" mode="gentext" priority="0">
    <xsl:call-template name="expand-gentext-numbering2"/>
  </xsl:template>

  <xsl:template match="numlist/step5" mode="gentext" priority="2">
    <xsl:call-template name="expand-gentext-numbering"/>
  </xsl:template>

  <xsl:template match="step5[child::*[1] != 'note']" mode="gentext" priority="1">
    <xsl:call-template name="expand-gentext-default"/>
  </xsl:template>

  <xsl:template match="subtask" mode="gentext" priority="0">
    <xsl:call-template name="expand-gentext">
      <xsl:with-param name="content">
        <_ufe:task-postspace>
          <xsl:value-of select="$gen-texts//text[@name='subtask']"/><xsl:text> </xsl:text>
          <xsl:value-of select="@chapnbr"/>
          <xsl:text>-</xsl:text>
          <xsl:value-of select="@sectnbr"/>
          <xsl:text>-</xsl:text>
          <xsl:value-of select="@subjnbr"/>
          <xsl:text>-</xsl:text>
          <xsl:value-of select="@func"/>
          <xsl:text>-</xsl:text>
          <xsl:value-of select="@seq"/>   
          <xsl:if test="@confltr!=''">
            <xsl:text>-</xsl:text>
            <xsl:value-of select="@confltr"/>
          </xsl:if>
          <xsl:if test="@varnbr!='' and @varnbr!='0'">
            <xsl:text>-</xsl:text>
            <xsl:value-of select="@varnbr"/>
          </xsl:if>
        </_ufe:task-postspace>
      </xsl:with-param>
    </xsl:call-template>   
  </xsl:template>

  <xsl:template match="task" mode="gentext" priority="0">
    <xsl:call-template name="expand-gentext">
      <xsl:with-param name="content">
        <_ufe:task-postspace>
          <xsl:value-of select="$gen-texts//text[@name='task']"/><xsl:text> </xsl:text>
          <xsl:value-of select="@chapnbr"/>
          <xsl:text>-</xsl:text>
          <xsl:value-of select="@sectnbr"/>
          <xsl:text>-</xsl:text>
          <xsl:value-of select="@subjnbr"/>
          <xsl:text>-</xsl:text>
          <xsl:value-of select="@func"/>
          <xsl:text>-</xsl:text>
          <xsl:value-of select="@seq"/>
        <xsl:choose>
          <xsl:when test="@confltr!=''">
            <xsl:text>-</xsl:text>
            <xsl:value-of select="@confltr"/>
          </xsl:when>
          <xsl:when test="@varnbr!='' and @varnbr!='0'">
            <xsl:text>-</xsl:text>
            <xsl:value-of select="@varnbr"/>
          </xsl:when>
        </xsl:choose>
        </_ufe:task-postspace>
      </xsl:with-param>
    </xsl:call-template>
  </xsl:template>

  <xsl:template match="ted" mode="gentext" priority="0">
    <xsl:call-template name="expand-gentext">
      <xsl:with-param name="content">
        <xsl:if test="(ancestor-or-self::ted[1]//toolname)[1]/*|(ancestor-or-self::ted[1]//toolname)[1]/text()|(ancestor-or-self::ted[1]//toolname)[1]/processing-instruction()">
          <_gte:Gentexted-Content-Wrapper>
            <xsl:apply-templates mode="gentext" select="(ancestor-or-self::ted[1]//toolname)[1]/*|(ancestor-or-self::ted[1]//toolname)[1]/text()|(ancestor-or-self::ted[1]//toolname)[1]/processing-instruction()">
              <xsl:with-param name="skip-expanded-gentext" select="'yes'"/>
            </xsl:apply-templates>
          </_gte:Gentexted-Content-Wrapper>
        </xsl:if>
        <xsl:text> (</xsl:text>
        <xsl:if test="(ancestor-or-self::ted[1]//toolnbr)[1]/*|(ancestor-or-self::ted[1]//toolnbr)[1]/text()|(ancestor-or-self::ted[1]//toolnbr)[1]/processing-instruction()">
          <_gte:Gentexted-Content-Wrapper>
            <xsl:apply-templates mode="gentext" select="(ancestor-or-self::ted[1]//toolnbr)[1]/*|(ancestor-or-self::ted[1]//toolnbr)[1]/text()|(ancestor-or-self::ted[1]//toolnbr)[1]/processing-instruction()">
              <xsl:with-param name="skip-expanded-gentext" select="'yes'"/>
            </xsl:apply-templates>
          </_gte:Gentexted-Content-Wrapper>
        </xsl:if>
        <xsl:text>)</xsl:text>
      </xsl:with-param>
    </xsl:call-template>
  </xsl:template>

  <xsl:template match="teddtl" mode="gentext" priority="0">
    <xsl:call-template name="expand-gentext">
      <xsl:with-param name="content">
        <xsl:if test="(ancestor-or-self::teddtl[1]//dtlname)[1]/*|(ancestor-or-self::teddtl[1]//dtlname)[1]/text()|(ancestor-or-self::teddtl[1]//dtlname)[1]/processing-instruction()">
          <_gte:Gentexted-Content-Wrapper>
            <xsl:apply-templates mode="gentext" select="(ancestor-or-self::teddtl[1]//dtlname)[1]/*|(ancestor-or-self::teddtl[1]//dtlname)[1]/text()|(ancestor-or-self::teddtl[1]//dtlname)[1]/processing-instruction()">
              <xsl:with-param name="skip-expanded-gentext" select="'yes'"/>
            </xsl:apply-templates>
          </_gte:Gentexted-Content-Wrapper>
        </xsl:if>
        <xsl:text> (</xsl:text>
        <xsl:if test="(ancestor-or-self::teddtl[1]//dtlnbr)[1]/*|(ancestor-or-self::teddtl[1]//dtlnbr)[1]/text()|(ancestor-or-self::teddtl[1]//dtlnbr)[1]/processing-instruction()">
          <_gte:Gentexted-Content-Wrapper>
            <xsl:apply-templates mode="gentext" select="(ancestor-or-self::teddtl[1]//dtlnbr)[1]/*|(ancestor-or-self::teddtl[1]//dtlnbr)[1]/text()|(ancestor-or-self::teddtl[1]//dtlnbr)[1]/processing-instruction()">
              <xsl:with-param name="skip-expanded-gentext" select="'yes'"/>
            </xsl:apply-templates>
          </_gte:Gentexted-Content-Wrapper>
        </xsl:if>
        <xsl:text> </xsl:text><xsl:value-of select="$gen-texts//text[@name='sheet-of']"/><xsl:text> </xsl:text>
        <xsl:if test="(ancestor-or-self::teddtl[1]//toolnbr)[1]/*|(ancestor-or-self::teddtl[1]//toolnbr)[1]/text()|(ancestor-or-self::teddtl[1]//toolnbr)[1]/processing-instruction()">
          <_gte:Gentexted-Content-Wrapper>
            <xsl:apply-templates mode="gentext" select="(ancestor-or-self::teddtl[1]//toolnbr)[1]/*|(ancestor-or-self::teddtl[1]//toolnbr)[1]/text()|(ancestor-or-self::teddtl[1]//toolnbr)[1]/processing-instruction()">
              <xsl:with-param name="skip-expanded-gentext" select="'yes'"/>
            </xsl:apply-templates>
          </_gte:Gentexted-Content-Wrapper>
        </xsl:if>
        <xsl:text>)</xsl:text>
      </xsl:with-param>
    </xsl:call-template>
  </xsl:template>

  <xsl:template match="module[@module-name='Airworthiness_Limits']/pgblk/title" mode="gentext" priority="65">
    <xsl:call-template name="expand-gentext-expanded"/>
  </xsl:template>

  <xsl:template match="page-block[@pb-name='ni']//mfmatr/title" mode="gentext" priority="56">
    <xsl:call-template name="expand-gentext-expanded"/>
  </xsl:template>

  <xsl:template match="page-block[@pb-name='record-of-revisions']//n-para/title" mode="gentext" priority="55">
    <xsl:call-template name="expand-gentext-default"/>
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
    <xsl:call-template name="expand-gentext-expanded"/>
  </xsl:template>

  <xsl:template match="intro/title" mode="gentext" priority="36">
    <xsl:call-template name="expand-gentext-default"/>
  </xsl:template>

  <xsl:template match="pwcspblist/title" mode="gentext" priority="35">
    <xsl:call-template name="expand-gentext-expanded"/>
  </xsl:template>

  <xsl:template match="sblist/title" mode="gentext" priority="32">
    <xsl:call-template name="expand-gentext-expanded"/>
  </xsl:template>

  <xsl:template match="pwcni/title" mode="gentext" priority="31">
    <xsl:call-template name="expand-gentext-expanded"/>
  </xsl:template>

  <xsl:template match="vendlist/title" mode="gentext" priority="30">
    <xsl:call-template name="expand-gentext-default"/>
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
    <xsl:call-template name="expand-gentext-default"/>
  </xsl:template>

  <xsl:template match="num-index/title" mode="gentext" priority="7">
    <xsl:call-template name="expand-gentext-default"/>
  </xsl:template>

  <xsl:template match="trlist" mode="gentext" priority="0">
    <xsl:call-template name="expand-gentext">
      <xsl:with-param name="content">
        <_ufe:center>
          <span style="text-decoration: underline; ">
            <xsl:value-of select="$gen-texts//text[@name='trlist']"/>
          </span>
        </_ufe:center>
      </xsl:with-param>
    </xsl:call-template>
  </xsl:template>

  <xsl:template match="trloc" mode="gentext" priority="0">
    <xsl:call-template name="expand-gentext">
      <xsl:with-param name="content">
        <xsl:text> </xsl:text>
      </xsl:with-param>
    </xsl:call-template>
  </xsl:template>

  <xsl:template match="trnbr" mode="gentext" priority="0">
    <xsl:call-template name="expand-gentext">
      <xsl:with-param name="content">
        <xsl:text> </xsl:text>
      </xsl:with-param>
    </xsl:call-template>
  </xsl:template>

  <xsl:template match="trstatus" mode="gentext" priority="0">
    <xsl:call-template name="expand-gentext">
      <xsl:with-param name="content">
        <xsl:text> </xsl:text>
      </xsl:with-param>
    </xsl:call-template>
  </xsl:template>
   
</xsl:stylesheet>

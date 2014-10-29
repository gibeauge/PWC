<?xml version='1.0'?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
                xmlns="http://www.w3.org/1999/xhtml"
                version='1.0'>

<!-- **********************************************************
       pi.xsl - transforms some Epic formatting PIs into HTML
     ********************************************************** -->

<xsl:import href="common.xsl"/>

<xsl:param name="Use-atievent-elements" select="''"/>

<xsl:param name="extra-spans-for-strikethru-and-underline-color"
             select="'yes'"/>

<xsl:template match="processing-instruction('Pub')" name="handle-pub-processing-instruction">
    <xsl:param name="within-gentext" select="false()"/>
  <xsl:variable name="pi" select="."/>
  <xsl:choose>
    <xsl:when test="starts-with($pi, '_font')">
      <xsl:call-template name="PI_Pub_font_start">
        <xsl:with-param name="within-gentext" select="$within-gentext"/>
      </xsl:call-template>
    </xsl:when>
    <xsl:when test="starts-with($pi, '/_font')">
      <xsl:call-template name="PI_Pub_font_end">
        <xsl:with-param name="within-gentext" select="$within-gentext"/>
      </xsl:call-template>
    </xsl:when>
    <xsl:when test="starts-with($pi, '_newline')">
      <br class="empty"/>
    </xsl:when>
    <xsl:when test="starts-with($pi, '_hardspace')">
      <xsl:text>&#160;</xsl:text>
    </xsl:when>
    <xsl:when test="starts-with($pi, '_eos-space')">
      <xsl:text>&#x20;</xsl:text>
    </xsl:when>
    <xsl:when test="starts-with($pi, '_hyphen-point')">
      <!-- do nothing for hyphen-point in HTML -->
    </xsl:when>
    <xsl:when test="starts-with($pi, '_interword-space')">
      <xsl:text>&#x20;</xsl:text>
    </xsl:when>
    <xsl:when test="starts-with($pi, '_newpage')">
      <!-- do nothing for newpage in HTML -->
    </xsl:when>
    <xsl:when test="starts-with($pi, '_newcolumn')">
      <!-- do nothing for newcolumn in HTML -->
    </xsl:when>
    <xsl:when test="starts-with($pi, '_nolinebreak')">
      <xsl:call-template name="atievent-startelement">
        <xsl:with-param name="atievent-element-name" select="'span'"/>
        <xsl:with-param name="atievent-attrname" select="'style'"/>
        <xsl:with-param name="atievent-attrvalue" select="'white-space: nowrap;'"/>
      </xsl:call-template>
    </xsl:when>
    <xsl:when test="starts-with($pi, '/_nolinebreak')">
      <xsl:call-template name="atievent-endelement">
        <xsl:with-param name="atievent-element-name" select="'span'"/>
      </xsl:call-template>
    </xsl:when>
    <xsl:when test="starts-with($pi, '_nopagebreak')">
      <!-- do nothing for nopagebreak in HTML -->
    </xsl:when>
    <xsl:when test="starts-with($pi, '/_nopagebreak')">
      <!-- do nothing for nopagebreak in HTML -->
    </xsl:when>
    <xsl:when test="starts-with($pi, '_nocolumnbreak')">
      <!-- do nothing for nocolbreak in HTML -->
    </xsl:when>
    <xsl:when test="starts-with($pi, '/_nocolumnbreak')">
      <!-- do nothing for nocolbreak in HTML -->
    </xsl:when>
    <xsl:when test="starts-with($pi, '_target')">
      <xsl:call-template name="targetpi">
        <xsl:with-param name="pi" select="$pi"/>
      </xsl:call-template>
    </xsl:when>
    <xsl:when test="starts-with($pi, '_texmac')">
      <xsl:call-template name="texmacpi">
        <xsl:with-param name="pi" select="$pi"/>
      </xsl:call-template>
    </xsl:when>
    <xsl:when test="starts-with($pi, 'Inc')">
       <!-- we don't care -->
    </xsl:when>
    <xsl:when test="starts-with($pi, 'Caret')">
       <!-- we don't care -->
    </xsl:when>
    <xsl:when test="starts-with($pi, '*')">
       <!-- we don't care -->
    </xsl:when>
    <xsl:when test="starts-with($pi, 'UDT')">
       <!-- ignore UDT definitions -->
    </xsl:when>
    <xsl:when test="starts-with($pi, '_putgraphic')">
      <xsl:call-template name="putgraphic">
        <xsl:with-param name="pi" select="$pi"/>
      </xsl:call-template>
    </xsl:when>
    <xsl:when test="starts-with($pi, '_kern')">
      <xsl:call-template name="kernpi">
        <xsl:with-param name="pi" select="$pi"/>
      </xsl:call-template>
    </xsl:when>
    <xsl:when test="starts-with($pi, '_cellfont')">
       <!-- handled in template generating the td|th -->
    </xsl:when>
    <xsl:otherwise>
      <xsl:choose>
        <xsl:when test="$Use-atievent-elements='false'">
          <xsl:message>
            <xsl:text>Unrecognized Pub PI: </xsl:text>
            <xsl:value-of select="$pi"/>
          </xsl:message>
        </xsl:when>
        <xsl:otherwise>
          <!-- We just quietly ignore the unrecognized PI here -->
        </xsl:otherwise>
      </xsl:choose>
    </xsl:otherwise>
  </xsl:choose>
</xsl:template>

<xsl:template name="targetpi">
  <xsl:param name="pi" select="."/>
  <!-- generate an <a> element -->
  <a>
    <xsl:call-template name="add-property">
      <xsl:with-param name="pi" select="$pi"/>
      <xsl:with-param name="piattr">Command</xsl:with-param>
      <xsl:with-param name="property">name</xsl:with-param>
    </xsl:call-template>
  </a>
</xsl:template>

<xsl:template name="kernpi">
  <xsl:param name="pi" select="."/>
  <!-- do nothing for kern in HTML -->
  <!-- if we wanted/could do something, we'd have to generate
       an inline box whose width was the value of this PI's
       Amount pseudo-attribute (presumably, converted to pixels) -->
</xsl:template>

<xsl:template name="putgraphic">
  <xsl:param name="pi" select="."/>
  <img>
    <xsl:call-template name="add-property">
      <xsl:with-param name="pi" select="$pi"/>
      <xsl:with-param name="piattr">pathname</xsl:with-param>
      <xsl:with-param name="property">src</xsl:with-param>
    </xsl:call-template>
    <xsl:call-template name="add-property">
      <xsl:with-param name="pi" select="$pi"/>
      <xsl:with-param name="piattr">width</xsl:with-param>
      <xsl:with-param name="property">width</xsl:with-param>
    </xsl:call-template>
    <xsl:call-template name="add-property">
      <xsl:with-param name="pi" select="$pi"/>
      <xsl:with-param name="piattr">depth</xsl:with-param>
      <xsl:with-param name="property">height</xsl:with-param>
    </xsl:call-template>
  </img>
</xsl:template>

<xsl:template name="PI_Pub_font_start">
    <xsl:param name="pi" select="."/>
    <xsl:param name="within-gentext" select="false()"/>

  <xsl:variable name="suppress-value">
    <xsl:call-template name="get-pi-attr-value">
      <xsl:with-param name="pi" select="$pi"/>
      <xsl:with-param name="piattr" select="'Suppress'"/>
    </xsl:call-template>
  </xsl:variable>

  <!-- If we are within-gentext, we no-op the _font unless @Suppress='no'.
       (Note, we do not support @Suppress='yes' because we can't figure out
       how to capture the content between the _font and /_font to suppress it.)
       The way we no-op the _font is to null out the atievent-attrname so that
       no attributes will be written.  (We still need to write out any start tags
       that would be generated by _font because they will need to match the
       end tags that /_font can't help but generate because it can't determine
       its matching _font's @Suppress value.) -->
  <xsl:variable name="atievent-attrname">
    <xsl:if test="($suppress-value='' and not($within-gentext)) or $suppress-value='no'">
      <xsl:text>style</xsl:text>
    </xsl:if>
  </xsl:variable>

  <xsl:if test="$extra-spans-for-strikethru-and-underline-color='yes'">
    <!-- emit extra spans to handle strikethru and underline color -->
    <xsl:call-template name="emit-strikethru-and-underline-spans">
      <xsl:with-param name="pi" select="$pi"/>
      <xsl:with-param name="atievent-attrname" select="$atievent-attrname"/>
    </xsl:call-template>
  </xsl:if>

  <xsl:variable name="font-start-attrs">
    <xsl:call-template name="PI_Pub_font_attributes">
      <xsl:with-param name="pi" select="$pi"/>
      <xsl:with-param name="styled-strikethru-and-underline-spans">
        <xsl:call-template name="compute-styled-strikethru-and-underline-spans">
          <xsl:with-param name="pi" select="$pi"/>
        </xsl:call-template>
      </xsl:with-param>
      <xsl:with-param name="within-gentext" select="$within-gentext"/>
    </xsl:call-template>
  </xsl:variable>
  <xsl:call-template name="atievent-startelement">
    <xsl:with-param name="atievent-element-name" select="'span'"/>
    <xsl:with-param name="atievent-attrname" select="$atievent-attrname"/>
    <xsl:with-param name="atievent-attrvalue" select="$font-start-attrs"/>
  </xsl:call-template>

</xsl:template>

<xsl:template name="emit-strikethru-and-underline-spans">
  <xsl:param name="pi" select="."/>
  <xsl:param name="atievent-attrname"/>

      <xsl:variable name="FontColor">
        <xsl:variable name="tmp">
          <xsl:call-template name="font-color">
            <xsl:with-param name="pi" select="$pi"/>
            <xsl:with-param name="piattr">FontColor</xsl:with-param>
            <xsl:with-param name="fontattr">color</xsl:with-param>
          </xsl:call-template>
        </xsl:variable>
        <xsl:if test="not(contains($tmp,'inherit'))">
          <xsl:value-of select="$tmp"/>
        </xsl:if>
      </xsl:variable>

      <xsl:variable name="Strikethru">
        <xsl:call-template name="font-strikethru">
          <xsl:with-param name="pi" select="$pi"/>
          <xsl:with-param name="piattr">ScoreCharOn</xsl:with-param>
        </xsl:call-template>
      </xsl:variable>

      <xsl:variable name="XScoreColor">
        <xsl:variable name="tmp">
          <xsl:call-template name="font-color">
            <xsl:with-param name="pi" select="$pi"/>
            <xsl:with-param name="piattr">XScoreColor</xsl:with-param>
            <xsl:with-param name="fontattr">color</xsl:with-param>
          </xsl:call-template>
        </xsl:variable>
        <xsl:if test="not(contains($tmp,'inherit'))">
          <xsl:value-of select="$tmp"/>
        </xsl:if>
      </xsl:variable>

      <xsl:variable name="ScoreColor">
        <xsl:variable name="tmp">
          <xsl:call-template name="font-color">
            <xsl:with-param name="pi" select="$pi"/>
            <xsl:with-param name="piattr">ScoreColor</xsl:with-param>
            <xsl:with-param name="fontattr">color</xsl:with-param>
          </xsl:call-template>
        </xsl:variable>
        <xsl:if test="not(contains($tmp,'inherit'))">
          <xsl:value-of select="$tmp"/>
        </xsl:if>
      </xsl:variable>

      <xsl:variable name="Underline">
        <xsl:call-template name="font-underline">
          <xsl:with-param name="pi" select="$pi"/>
          <xsl:with-param name="piattr">Underline</xsl:with-param>
        </xsl:call-template>
      </xsl:variable>

      <xsl:variable name="need-strikethru-span"
          select="$FontColor!='' and $Strikethru!='' and $XScoreColor!=''"/>
      <xsl:variable name="need-underline-span"
          select="$FontColor!='' and $Underline!='' and $ScoreColor!=''"/>
      <xsl:variable name="need-extra-spans"
          select="$need-strikethru-span or $need-underline-span"/>
      <xsl:variable name="do-strikethru-span"
          select="$need-extra-spans and $Strikethru!=''"/>
      <xsl:variable name="do-underline-span"
          select="$need-extra-spans and $Underline!=''"/>

      <!-- Compute style for strikethru span -->
      <xsl:variable name="strikethru-style">
        <xsl:if test="$do-strikethru-span">
          <!-- Note, any style is treated as 'single' since that's all
               CSS supports.  Also note that @XScoreSpace is ignored
               since CSS only supports scoring everything. -->
          <xsl:text>text-decoration: line-through; </xsl:text>
          <xsl:if test="$XScoreColor!=''">
            <xsl:value-of select="$XScoreColor"/>
          </xsl:if>
        </xsl:if>
      </xsl:variable>
      <!-- Emit strikethru span -->
      <xsl:call-template name="atievent-startelement">
        <xsl:with-param name="atievent-element-name" select="'span'"/>
        <xsl:with-param name="atievent-attrname">
          <xsl:if test="$strikethru-style!=''">
            <xsl:value-of select="$atievent-attrname"/>
          </xsl:if>
        </xsl:with-param>
        <xsl:with-param name="atievent-attrvalue" select="$strikethru-style"/>
      </xsl:call-template>

      <!-- Compute style for underline span -->
      <xsl:variable name="underline-style">
        <xsl:if test="$do-underline-span">
          <!-- Note, any style is treated as 'single' since that's all
               CSS supports.  Also note that @ScoreSpace is ignored
               since CSS only supports scoring everything. -->
          <xsl:text>text-decoration: underline; </xsl:text>
          <xsl:choose>
            <xsl:when test="$ScoreColor!=''">
              <xsl:value-of select="$ScoreColor"/>
            </xsl:when>
            <xsl:when test="$Strikethru!='' and $XScoreColor!=''">
              <xsl:value-of select="$FontColor"/>
            </xsl:when>
          </xsl:choose>
        </xsl:if>
      </xsl:variable>
      <!-- Emit underline span -->
      <xsl:call-template name="atievent-startelement">
        <xsl:with-param name="atievent-element-name" select="'span'"/>
        <xsl:with-param name="atievent-attrname">
          <xsl:if test="$underline-style!=''">
            <xsl:value-of select="$atievent-attrname"/>
          </xsl:if>
        </xsl:with-param>
        <xsl:with-param name="atievent-attrvalue" select="$underline-style"/>
      </xsl:call-template>

</xsl:template>

<xsl:template name="compute-styled-strikethru-and-underline-spans">
  <xsl:param name="pi" select="."/>

      <xsl:variable name="FontColor">
        <xsl:variable name="tmp">
          <xsl:call-template name="font-color">
            <xsl:with-param name="pi" select="$pi"/>
            <xsl:with-param name="piattr">FontColor</xsl:with-param>
            <xsl:with-param name="fontattr">color</xsl:with-param>
          </xsl:call-template>
        </xsl:variable>
        <xsl:if test="not(contains($tmp,'inherit'))">
          <xsl:value-of select="$tmp"/>
        </xsl:if>
      </xsl:variable>

      <xsl:variable name="Strikethru">
        <xsl:call-template name="font-strikethru">
          <xsl:with-param name="pi" select="$pi"/>
          <xsl:with-param name="piattr">ScoreCharOn</xsl:with-param>
        </xsl:call-template>
      </xsl:variable>

      <xsl:variable name="XScoreColor">
        <xsl:variable name="tmp">
          <xsl:call-template name="font-color">
            <xsl:with-param name="pi" select="$pi"/>
            <xsl:with-param name="piattr">XScoreColor</xsl:with-param>
            <xsl:with-param name="fontattr">color</xsl:with-param>
          </xsl:call-template>
        </xsl:variable>
        <xsl:if test="not(contains($tmp,'inherit'))">
          <xsl:value-of select="$tmp"/>
        </xsl:if>
      </xsl:variable>

      <xsl:variable name="ScoreColor">
        <xsl:variable name="tmp">
          <xsl:call-template name="font-color">
            <xsl:with-param name="pi" select="$pi"/>
            <xsl:with-param name="piattr">ScoreColor</xsl:with-param>
            <xsl:with-param name="fontattr">color</xsl:with-param>
          </xsl:call-template>
        </xsl:variable>
        <xsl:if test="not(contains($tmp,'inherit'))">
          <xsl:value-of select="$tmp"/>
        </xsl:if>
      </xsl:variable>

      <xsl:variable name="Underline">
        <xsl:call-template name="font-underline">
          <xsl:with-param name="pi" select="$pi"/>
          <xsl:with-param name="piattr">Underline</xsl:with-param>
        </xsl:call-template>
      </xsl:variable>

      <xsl:variable name="need-strikethru-span"
          select="$FontColor!='' and $Strikethru!='' and $XScoreColor!=''"/>
      <xsl:variable name="need-underline-span"
          select="$FontColor!='' and $Underline!='' and $ScoreColor!=''"/>
      <xsl:variable name="need-extra-spans"
          select="$need-strikethru-span or $need-underline-span"/>

      <xsl:choose>
        <!-- Return 'yes' or 'no' indicating whether we have
             already handled strikethru and underline styling -->
        <xsl:when test="$need-extra-spans">yes</xsl:when>
        <xsl:otherwise>no</xsl:otherwise>
      </xsl:choose>

</xsl:template>

<xsl:template name="PI_Pub_font_attributes">
  <!-- for each font attribute, emit text for attrspec or emit
       xsl:attribute depending on setting of Use-atievent-elements -->
  <xsl:param name="pi" select="."/>
  <xsl:param name="styled-strikethru-and-underline-spans" select="'no'"/>
  <xsl:call-template name="font-color">
    <xsl:with-param name="pi" select="$pi"/>
    <xsl:with-param name="piattr">FontColor</xsl:with-param>
    <xsl:with-param name="fontattr">color</xsl:with-param>
  </xsl:call-template>
  <xsl:call-template name="font-attribute">
    <xsl:with-param name="pi" select="$pi"/>
    <xsl:with-param name="piattr">TypeSize</xsl:with-param>
    <xsl:with-param name="fontattr">font-size</xsl:with-param>
  </xsl:call-template>
  <xsl:call-template name="font-offset">
    <xsl:with-param name="pi" select="$pi"/>
    <xsl:with-param name="piattr">Offset</xsl:with-param>
    <xsl:with-param name="fontattr">baseline-shift</xsl:with-param>
  </xsl:call-template>
  <xsl:call-template name="font-attribute">
    <xsl:with-param name="pi" select="$pi"/>
    <xsl:with-param name="piattr">FamName</xsl:with-param>
    <xsl:with-param name="fontattr">font-family</xsl:with-param>
  </xsl:call-template>
  <xsl:call-template name="font-posture">
    <xsl:with-param name="pi" select="$pi"/>
    <xsl:with-param name="piattr">Posture</xsl:with-param>
    <xsl:with-param name="fontattr">font-style</xsl:with-param>
  </xsl:call-template>
  <xsl:call-template name="font-weight">
    <xsl:with-param name="pi" select="$pi"/>
    <xsl:with-param name="piattr">Weight</xsl:with-param>
    <xsl:with-param name="fontattr">font-weight</xsl:with-param>
  </xsl:call-template>
  <xsl:call-template name="font-backcolor">
    <xsl:with-param name="pi" select="$pi"/>
    <xsl:with-param name="piattr">BackColor</xsl:with-param>
    <xsl:with-param name="fontattr">background-color</xsl:with-param>
  </xsl:call-template>
  <xsl:call-template name="font-style">
    <xsl:with-param name="pi" select="$pi"/>
    <xsl:with-param name="piattr">FontStyle</xsl:with-param>
    <xsl:with-param name="fontattr">font-family</xsl:with-param>
  </xsl:call-template>
  <xsl:call-template name="font-keepline">
    <xsl:with-param name="pi" select="$pi"/>
    <xsl:with-param name="piattr">KeepLine</xsl:with-param>
    <xsl:with-param name="fontattr">white-space</xsl:with-param>
  </xsl:call-template>
  <xsl:call-template name="font-scorespaces">
    <xsl:with-param name="pi" select="$pi"/>
    <xsl:with-param name="piattr">ScoreSpace</xsl:with-param>
    <xsl:with-param name="fontattr">score-spaces</xsl:with-param>
  </xsl:call-template>
  <xsl:call-template name="font-allcaps">
    <xsl:with-param name="pi" select="$pi"/>
    <xsl:with-param name="piattr">AllCap</xsl:with-param>
    <xsl:with-param name="fontattr">text-transform</xsl:with-param>
  </xsl:call-template>
  <xsl:call-template name="font-smallcaps">
    <xsl:with-param name="pi" select="$pi"/>
    <xsl:with-param name="piattr">SmallCap</xsl:with-param>
    <xsl:with-param name="fontattr">font-variant</xsl:with-param>
  </xsl:call-template>
  <xsl:if test="$styled-strikethru-and-underline-spans!='yes'">
    <xsl:call-template name="font-text-decoration">
      <xsl:with-param name="underline">
        <xsl:call-template name="font-underline">
          <xsl:with-param name="pi" select="$pi"/>
          <xsl:with-param name="piattr">Underline</xsl:with-param>
        </xsl:call-template>
      </xsl:with-param>
      <xsl:with-param name="strikethru">
        <xsl:call-template name="font-strikethru">
          <xsl:with-param name="pi" select="$pi"/>
          <xsl:with-param name="piattr">ScoreCharOn</xsl:with-param>
        </xsl:call-template>
      </xsl:with-param>
      <xsl:with-param name="fontattr">text-decoration</xsl:with-param>
    </xsl:call-template>
  </xsl:if>
</xsl:template>

<xsl:template name="PI_Pub_font_end">
  <xsl:if test="$extra-spans-for-strikethru-and-underline-color='yes'">
    <xsl:call-template name="atievent-endelement">
      <xsl:with-param name="atievent-element-name" select="'span'"/>
    </xsl:call-template>
    <xsl:call-template name="atievent-endelement">
      <xsl:with-param name="atievent-element-name" select="'span'"/>
    </xsl:call-template>
  </xsl:if>
  <xsl:call-template name="atievent-endelement">
    <xsl:with-param name="atievent-element-name" select="'span'"/>
  </xsl:call-template>
</xsl:template>

<xsl:template name="font-keepline">
    <xsl:param name="pi" select="."/>
    <xsl:param name="piattr">KeepLine</xsl:param>
    <xsl:param name="fontattr">white-space</xsl:param>
  <xsl:variable name="attrval">
    <xsl:call-template name="get-pi-attr-value">
      <xsl:with-param name="pi" select="$pi"/>
      <xsl:with-param name="piattr" select="$piattr"/>
    </xsl:call-template>
  </xsl:variable>
  <xsl:if test="$attrval='yes'">
    <xsl:call-template name="PI_font_attr_emit">
      <xsl:with-param name="attrname" select="$fontattr"/>
      <xsl:with-param name="attrval" select="'nowrap'"/>
    </xsl:call-template>
  </xsl:if>
</xsl:template>

<xsl:template name="font-offset">
    <xsl:param name="pi" select="."/>
    <xsl:param name="piattr">Offset</xsl:param>
  <xsl:variable name="attrval">
    <xsl:call-template name="get-pi-attr-value">
      <xsl:with-param name="pi" select="$pi"/>
      <xsl:with-param name="piattr" select="$piattr"/>
    </xsl:call-template>
  </xsl:variable>
  <xsl:if test="$attrval!=''">
    <xsl:variable name="fontattr">
     <xsl:choose>
      <xsl:when test="starts-with($attrval,'-')">bottom</xsl:when>
      <xsl:otherwise>top</xsl:otherwise>
     </xsl:choose>
    </xsl:variable>
    <xsl:choose>
      <xsl:when test="$fontattr = 'top'">
        <xsl:value-of select="$fontattr"/>
        <xsl:text>: -</xsl:text>
        <xsl:value-of select="$attrval"/>
        <xsl:text>; </xsl:text>
      </xsl:when>
      <xsl:otherwise>
        <xsl:value-of select="$fontattr"/>
        <xsl:text>: </xsl:text>
        <xsl:value-of select="$attrval"/>
        <xsl:text>; </xsl:text>
      </xsl:otherwise>
    </xsl:choose>
    <xsl:text>position: relative; </xsl:text>
  </xsl:if>
</xsl:template>

<xsl:template name="PI_font_attr_emit">
    <xsl:param name="attrname" select="''"/>
    <xsl:param name="attrval" select="''"/>
  <xsl:value-of select="$attrname"/>
  <xsl:text>: </xsl:text>
  <xsl:value-of select="string($attrval)"/>
  <xsl:text>; </xsl:text>
</xsl:template>

<!-- **********************************************************
       end pi.xsl
     ********************************************************** -->

</xsl:stylesheet>

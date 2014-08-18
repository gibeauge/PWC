<?xml version='1.0'?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
                xmlns="http://www.w3.org/1999/xhtml"
                version='1.0'>

<!-- **********************************************************
       pi.xsl - transforms some Epic formatting PIs into HTML
     ********************************************************** -->

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
      <!-- We just quietly ignore the unrecognized PI here -->
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

<xsl:template name="atievent-startelement">
  <!-- this template only works with at most one attribute -->
  <xsl:param name="atievent-element-name" select="'span'"/>
  <xsl:param name="atievent-attrname" select="''"/>
  <xsl:param name="atievent-attrvalue" select="''"/>

  <xsl:text disable-output-escaping="yes">&lt;</xsl:text>
  <xsl:value-of select="string($atievent-element-name)"/>
  <xsl:if test="$atievent-attrname != ''">
    <xsl:text> </xsl:text>
    <xsl:value-of select="string($atievent-attrname)"/>
    <xsl:text>="</xsl:text>
    <xsl:value-of select="string($atievent-attrvalue)"/>
    <xsl:text>"</xsl:text>
  </xsl:if>
  <xsl:text disable-output-escaping="yes">&gt;</xsl:text>
</xsl:template>

<xsl:template name="atievent-endelement">
  <xsl:param name="atievent-element-name" select="'span'"/>
  
  <xsl:text disable-output-escaping="yes">&lt;/</xsl:text>
  <xsl:value-of select="string($atievent-element-name)"/>
  <xsl:text disable-output-escaping="yes">&gt;</xsl:text>
</xsl:template>

<xsl:template name="texmacpi">
    <xsl:param name="pi" select="."/>
    <xsl:param name="piattr">Tex</xsl:param>
  <xsl:variable name="attrval">
    <xsl:call-template name="get-pi-attr-value">
      <xsl:with-param name="pi" select="$pi"/>
      <xsl:with-param name="piattr" select="$piattr"/>
    </xsl:call-template>
  </xsl:variable>
  <xsl:if test="$attrval!=''">
    <xsl:value-of select="$attrval"/>
  </xsl:if>
</xsl:template>

<xsl:template name="add-property">
    <xsl:param name="pi" select="."/>
    <xsl:param name="piattr">xxx</xsl:param>
    <xsl:param name="property">yyy</xsl:param>
  <xsl:variable name="attrval">
    <xsl:call-template name="get-pi-attr-value">
      <xsl:with-param name="pi" select="$pi"/>
      <xsl:with-param name="piattr" select="$piattr"/>
    </xsl:call-template>
  </xsl:variable>
  <xsl:if test="$attrval!=''">
    <xsl:attribute name="{$property}">
      <xsl:value-of select="$attrval"/>
    </xsl:attribute>
  </xsl:if>
</xsl:template>

<xsl:template name="get-pi-attr-value">
    <xsl:param name="pi" select="."/>
    <xsl:param name="piattr"/>
    <xsl:param name="normalize-space" select="'yes'"/>
  <xsl:variable name="npi">
    <xsl:choose>
      <xsl:when test="$normalize-space='yes'">
        <xsl:value-of select="normalize-space($pi)"/>
      </xsl:when>
      <xsl:otherwise>
        <xsl:value-of select="$pi"/>
      </xsl:otherwise>
    </xsl:choose>
  </xsl:variable>
  <xsl:if test="contains($npi,concat($piattr, '='))">
    <xsl:variable name="restq"
                  select="substring-after($npi,concat($piattr,'='))"/>
    <xsl:variable name="quote" select="substring($restq,1,1)"/>
    <xsl:value-of select="substring-before(substring($restq,2),$quote)"/>
  </xsl:if>
</xsl:template>

<xsl:template name="font-backcolor">
    <xsl:param name="pi" select="."/>
    <xsl:param name="piattr">BackColor</xsl:param>
    <xsl:param name="fontattr">background-color</xsl:param>
  <xsl:variable name="given_bgcolor">
    <xsl:call-template name="get-pi-attr-value">
      <xsl:with-param name="pi" select="$pi"/>
      <xsl:with-param name="piattr" select="$piattr"/>
    </xsl:call-template>
  </xsl:variable>
  <xsl:if test="$given_bgcolor!=''">
    <!-- Now convert given color to associated RGB number -->
    <xsl:variable name="xbgcolor"
                  select="substring-after($fg2bg_colorizer,concat($given_bgcolor,'='))"/>
    <xsl:variable name="bgcolor"
                  select="substring-before($xbgcolor,';')"/>
    <xsl:variable name="final_bgcolor">
      <xsl:choose>
        <xsl:when test="$bgcolor=''"><xsl:value-of select="string($given_bgcolor)"/></xsl:when>
        <xsl:otherwise><xsl:value-of select="string($bgcolor)"/></xsl:otherwise>
      </xsl:choose>
    </xsl:variable>
    <xsl:if test="$final_bgcolor != ''">
      <xsl:call-template name="PI_font_attr_emit">
        <xsl:with-param name="attrname" select="$fontattr"/>
        <xsl:with-param name="attrval" select="$final_bgcolor"/>
      </xsl:call-template>
    </xsl:if>
  </xsl:if>
</xsl:template>

<xsl:template name="font-color">
    <xsl:param name="pi" select="."/>
    <xsl:param name="piattr">FontColor</xsl:param>
    <xsl:param name="fontattr">color</xsl:param>
  <!-- Need to get fancier to avoid seeing XScoreColor as ScoreColor -->
  <xsl:variable name="npi" select="concat(' ',normalize-space($pi))"/>
  <xsl:variable name="given_color">
    <xsl:call-template name="get-pi-attr-value">
      <xsl:with-param name="pi" select="$npi"/>
      <xsl:with-param name="piattr" select="$piattr"/>
      <xsl:with-param name="normalize-space" select="'no'"/>
    </xsl:call-template>
  </xsl:variable>
  <xsl:if test="$given_color!=''">
    <!-- Now convert given color to associated RGB number -->
    <xsl:variable name="xcolor"
                  select="substring-after($fg_colorizer,concat($given_color,'='))"/>
    <xsl:variable name="color"
                  select="substring-before($xcolor,';')"/>
    <xsl:variable name="final_color">
      <xsl:choose>
        <xsl:when test="$color=''"><xsl:value-of select="string($given_color)"/></xsl:when>
        <xsl:otherwise><xsl:value-of select="string($color)"/></xsl:otherwise>
      </xsl:choose>
    </xsl:variable>
    <xsl:choose>
      <xsl:when test="$given_color='transparent'">
        <xsl:call-template name="PI_font_attr_emit">
          <xsl:with-param name="attrname" select="'visibility'"/>
          <xsl:with-param name="attrval" select="'hidden'"/>
        </xsl:call-template>
      </xsl:when>
      <xsl:when test="$final_color != ''">
        <xsl:call-template name="PI_font_attr_emit">
          <xsl:with-param name="attrname" select="$fontattr"/>
          <xsl:with-param name="attrval" select="$final_color"/>
        </xsl:call-template>
      </xsl:when>
    </xsl:choose>
  </xsl:if>
</xsl:template>

<xsl:template name="font-underline">
    <xsl:param name="pi" select="."/>
    <xsl:param name="piattr">Underline</xsl:param>
  <xsl:variable name="attrval">
    <xsl:call-template name="get-pi-attr-value">
      <xsl:with-param name="pi" select="$pi"/>
      <xsl:with-param name="piattr" select="$piattr"/>
    </xsl:call-template>
  </xsl:variable>
  <xsl:if test="$attrval!=''">
    <xsl:if test="$attrval != 'no' and $attrval != 'inherit' and string-length($attrval) &gt; 2">
      <!-- Rather than test for all values, if the value is at least 3 characters
           long, we assume it is a valid value other than 'no' -->
      <xsl:text>underline</xsl:text>
    </xsl:if>
  </xsl:if>
</xsl:template>

<xsl:template name="font-text-decoration">
    <xsl:param name="underline"></xsl:param>
    <xsl:param name="strikethru"></xsl:param>
    <xsl:param name="fontattr">text-decoration</xsl:param>
  <xsl:if test="concat($underline,$strikethru) != ''">
    <xsl:variable name="text-decoration-value">
     <xsl:choose>
      <xsl:when test="$underline = ''">
        <xsl:text>line-through</xsl:text>
      </xsl:when>
      <xsl:when test="$strikethru = ''">
        <xsl:text>underline</xsl:text>
      </xsl:when>
      <xsl:otherwise>
        <xsl:text>underline line-through</xsl:text>
      </xsl:otherwise>
     </xsl:choose>
    </xsl:variable>
    <xsl:call-template name="PI_font_attr_emit">
      <xsl:with-param name="attrname" select="$fontattr"/>
      <xsl:with-param name="attrval" select="$text-decoration-value"/>
    </xsl:call-template>
  </xsl:if>
</xsl:template>

<xsl:template name="font-strikethru">
    <xsl:param name="pi" select="."/>
    <xsl:param name="piattr">ScoreCharOn</xsl:param>
    <xsl:param name="piattr2">Strikethru</xsl:param>
  <xsl:variable name="attrval1">
    <xsl:call-template name="get-pi-attr-value">
      <xsl:with-param name="pi" select="$pi"/>
      <xsl:with-param name="piattr" select="$piattr"/>
    </xsl:call-template>
  </xsl:variable>
  <xsl:variable name="attrval2">
    <xsl:call-template name="get-pi-attr-value">
      <xsl:with-param name="pi" select="$pi"/>
      <xsl:with-param name="piattr" select="$piattr2"/>
    </xsl:call-template>
  </xsl:variable>
  
  <xsl:if test="$attrval1!='' or $attrval2!=''">
    <xsl:if test="$attrval1 = 'yes' or $attrval2 = 'yes' or $attrval2 = 'single' or $attrval2 = 'wordsonly'">
      <xsl:text>line-through</xsl:text>
    </xsl:if>
  </xsl:if>
</xsl:template>

<xsl:template name="font-allcaps">
    <xsl:param name="pi" select="."/>
    <xsl:param name="piattr">AllCap</xsl:param>
    <xsl:param name="fontattr">text-transform</xsl:param>
  <xsl:variable name="attrval">
    <xsl:call-template name="get-pi-attr-value">
      <xsl:with-param name="pi" select="$pi"/>
      <xsl:with-param name="piattr" select="$piattr"/>
    </xsl:call-template>
  </xsl:variable>
  <xsl:if test="$attrval = 'yes'">
    <xsl:call-template name="PI_font_attr_emit">
      <xsl:with-param name="attrname" select="$fontattr"/>
      <xsl:with-param name="attrval" select="'uppercase'"/>
    </xsl:call-template>
  </xsl:if>
</xsl:template>

<xsl:template name="font-smallcaps">
    <xsl:param name="pi" select="."/>
    <xsl:param name="piattr">SmallCap</xsl:param>
    <xsl:param name="fontattr">font-variant</xsl:param>
  <xsl:variable name="attrval">
    <xsl:call-template name="get-pi-attr-value">
      <xsl:with-param name="pi" select="$pi"/>
      <xsl:with-param name="piattr" select="$piattr"/>
    </xsl:call-template>
  </xsl:variable>
  <xsl:if test="$attrval = 'yes'">
    <xsl:call-template name="PI_font_attr_emit">
      <xsl:with-param name="attrname" select="$fontattr"/>
      <xsl:with-param name="attrval" select="'small-caps'"/>
    </xsl:call-template>
  </xsl:if>
  <xsl:if test="$attrval = 'no'">
    <xsl:call-template name="PI_font_attr_emit">
      <xsl:with-param name="attrname" select="$fontattr"/>
      <xsl:with-param name="attrval" select="'normal'"/>
    </xsl:call-template>
  </xsl:if>
</xsl:template>

<xsl:template name="font-scorespaces">
    <xsl:param name="pi" select="."/>
    <xsl:param name="piattr">ScoreSpace</xsl:param>
    <xsl:param name="fontattr">score-spaces</xsl:param>
  <!-- Need to get fancier to avoid seeing XScoreSpace as ScoreSpace -->
  <xsl:variable name="npi" select="concat(' ',normalize-space($pi))"/>
  <xsl:variable name="attrval">
    <xsl:call-template name="get-pi-attr-value">
      <xsl:with-param name="pi" select="$npi"/>
      <xsl:with-param name="piattr" select="$piattr"/>
      <xsl:with-param name="normalize-space" select="'no'"/>
    </xsl:call-template>
  </xsl:variable>
  <xsl:if test="$attrval!=''">
    <xsl:variable name="attrvalue">
      <xsl:choose>
        <xsl:when test="$attrval = 'yes'">true</xsl:when>
        <xsl:when test="$attrval = 'no'">false</xsl:when>
        <xsl:otherwise>true</xsl:otherwise>
      </xsl:choose>
    </xsl:variable>
    <xsl:call-template name="PI_font_attr_emit">
      <xsl:with-param name="attrname" select="$fontattr"/>
      <xsl:with-param name="attrval" select="$attrvalue"/>
    </xsl:call-template>
  </xsl:if>
</xsl:template>

<xsl:template name="font-style">
    <xsl:param name="pi" select="."/>
    <xsl:param name="piattr">FontStyle</xsl:param>
    <xsl:param name="fontattr">font-family</xsl:param>
  <xsl:variable name="attrval">
    <xsl:call-template name="get-pi-attr-value">
      <xsl:with-param name="pi" select="$pi"/>
      <xsl:with-param name="piattr" select="$piattr"/>
    </xsl:call-template>
  </xsl:variable>
  <xsl:if test="$attrval!=''">
    <xsl:variable name="genfontfam">
      <xsl:choose>
        <xsl:when test="$attrval='serifed'">serif</xsl:when>
        <xsl:when test="$attrval='sans-serif'">sans-serif</xsl:when>
        <xsl:when test="$attrval='monospaced-serifed'">monospace</xsl:when>
        <xsl:when test="$attrval='monospaced-sans-serif'">monospace</xsl:when>
        <xsl:otherwise>none</xsl:otherwise>
      </xsl:choose>
    </xsl:variable>
    <xsl:if test="$genfontfam!='none'">
      <xsl:call-template name="PI_font_attr_emit">
        <xsl:with-param name="attrname" select="$fontattr"/>
        <xsl:with-param name="attrval" select="$genfontfam"/>
      </xsl:call-template>
    </xsl:if>
  </xsl:if>
</xsl:template>

<xsl:template name="font-posture">
    <xsl:param name="pi" select="."/>
    <xsl:param name="piattr">Posture</xsl:param>
    <xsl:param name="fontattr">font-style</xsl:param>
  <xsl:variable name="attrval">
    <xsl:call-template name="get-pi-attr-value">
      <xsl:with-param name="pi" select="$pi"/>
      <xsl:with-param name="piattr" select="$piattr"/>
    </xsl:call-template>
  </xsl:variable>
  <xsl:if test="$attrval!=''">
    <xsl:variable name="posture">
      <xsl:choose>
        <xsl:when test="$attrval='upright'">normal</xsl:when>
        <xsl:otherwise><xsl:value-of select="string($attrval)"/></xsl:otherwise>
      </xsl:choose>
    </xsl:variable>
    <xsl:if test="$posture!=''">
      <xsl:call-template name="PI_font_attr_emit">
        <xsl:with-param name="attrname" select="$fontattr"/>
        <xsl:with-param name="attrval" select="$posture"/>
      </xsl:call-template>
    </xsl:if>
  </xsl:if>
</xsl:template>

<xsl:template name="font-weight">
    <xsl:param name="pi" select="."/>
    <xsl:param name="piattr">Weight</xsl:param>
    <xsl:param name="fontattr">font-weight</xsl:param>
  <xsl:variable name="attrval">
    <xsl:call-template name="get-pi-attr-value">
      <xsl:with-param name="pi" select="$pi"/>
      <xsl:with-param name="piattr" select="$piattr"/>
    </xsl:call-template>
  </xsl:variable>
  <xsl:if test="$attrval!=''">
    <xsl:variable name="weight">
      <xsl:choose>
        <xsl:when test="$attrval='medium'">normal</xsl:when>
        <xsl:otherwise><xsl:value-of select="string($attrval)"/></xsl:otherwise>
      </xsl:choose>
    </xsl:variable>
    <xsl:if test="$weight!=''">
      <xsl:call-template name="PI_font_attr_emit">
        <xsl:with-param name="attrname" select="$fontattr"/>
        <xsl:with-param name="attrval" select="$weight"/>
      </xsl:call-template>
    </xsl:if>
  </xsl:if>
</xsl:template>

<xsl:template name="font-attribute">
    <xsl:param name="pi" select="."/>
    <xsl:param name="piattr">xxx</xsl:param>
    <xsl:param name="fontattr">yyy</xsl:param>
  <xsl:variable name="attrval">
    <xsl:call-template name="get-pi-attr-value">
      <xsl:with-param name="pi" select="$pi"/>
      <xsl:with-param name="piattr" select="$piattr"/>
    </xsl:call-template>
  </xsl:variable>
  <xsl:if test="$attrval!=''">
    <xsl:call-template name="PI_font_attr_emit">
      <xsl:with-param name="attrname" select="$fontattr"/>
      <xsl:with-param name="attrval" select="$attrval"/>
    </xsl:call-template>
  </xsl:if>
</xsl:template>

</xsl:stylesheet>

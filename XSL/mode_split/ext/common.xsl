<?xml version='1.0'?>

<!-- **********************************************************
       common.xsl - some common code for table and PI handling
     ********************************************************** -->

<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version='1.0'>

<!-- **********************************************************
       Some global parameters (possibly overridden elsewhere)
     ********************************************************** -->

<!-- html.table.border.thickness is used for the default thickness
     of an inner (non-frame) rule in HTML tables. -->
<xsl:param name="html.table.border.thickness" select="'1px'"/>

<!-- table.border.thickness is used for the default thickness
     of all rules in CALS/OASIS and custom tables as well as 
     for outer (frame) rules in HTML tables.  This parameter may
     be set externally from option('tabledefaultrulethickness'). -->
<xsl:param name="table.border.thickness" select="'1pt'"/>

<xsl:param name="bgcolor-attrname" select="'bgcolor'"/>

<!-- This parameter may be set externally to 'top' if
     compose::cals_thead_default_top_align is set to 1 -->
<xsl:param name="default-thead-valign" select="'bottom'"/>

<!-- **********************************************************
       Some general/misc PI handling
     ********************************************************** -->

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

<xsl:template name="atievent-startelement"
	xmlns:atievent="http://www.arbortext.com/namespace/AtiSaxEvents">
  <!-- this template only works with at most one attribute -->
  <xsl:param name="atievent-element-name" select="'span'"/>
  <xsl:param name="atievent-attrname" select="''"/>
  <xsl:param name="atievent-attrvalue" select="''"/>
      <xsl:choose>
        <xsl:when test="$Use-atievent-elements='' or $Use-atievent-elements='false'">
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
        </xsl:when>
        <xsl:otherwise>
          <!-- use atievent extended elements that avoids problems
               with disable-output-escaping when not reserializing -->
          <atievent:startelement atievent:name="{$atievent-element-name}">
            <xsl:if test="$atievent-attrname != ''">
              <xsl:attribute name="{$atievent-attrname}">
                <xsl:value-of select="string($atievent-attrvalue)"/>
              </xsl:attribute>
            </xsl:if>
          </atievent:startelement>
        </xsl:otherwise>
      </xsl:choose>
</xsl:template>

<xsl:template name="atievent-endelement"
	xmlns:atievent="http://www.arbortext.com/namespace/AtiSaxEvents">
  <xsl:param name="atievent-element-name" select="'span'"/>
      <xsl:choose>
        <xsl:when test="$Use-atievent-elements='' or $Use-atievent-elements='false'">
          <xsl:text disable-output-escaping="yes">&lt;/</xsl:text>
          <xsl:value-of select="string($atievent-element-name)"/>
          <xsl:text disable-output-escaping="yes">&gt;</xsl:text>
        </xsl:when>
        <xsl:otherwise>
          <!-- use atievent extended elements that avoids problems
               with disable-output-escaping when not reserializing -->
          <atievent:endelement atievent:name="{$atievent-element-name}"/>
        </xsl:otherwise>
      </xsl:choose>
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

<xsl:param name="texmac-passthru" select="'yes'"/>

<xsl:template name="texmacpi">
    <xsl:param name="pi" select="."/>
    <xsl:param name="piattr">Tex</xsl:param>
  <xsl:variable name="attrval">
    <xsl:call-template name="get-pi-attr-value">
      <xsl:with-param name="pi" select="$pi"/>
      <xsl:with-param name="piattr" select="$piattr"/>
    </xsl:call-template>
  </xsl:variable>
  <!-- just pass through the value of the Tex pseudo-attribute if non-null -->
  <xsl:if test="$texmac-passthru='yes' and $attrval!=''">
    <xsl:value-of select="$attrval"/>
  </xsl:if>
</xsl:template>

<!-- **********************************************************
       _font PI handling
     ********************************************************** -->

<!-- for BackColor and FontColor, we have to map given names to associated RGB
     values and leave a given RGB value as is.  The mapping of names to RGB values
     for background colors is given by the variable fg2bg_colorizer whose
     value is generated and assigned outside this file.  The mapping of names to
     RGB values for font colors is given by the variable fg_colorizer whose
     value is generated and assigned outside this file.
       If this file is used in another context, the following (commented out)
     assignments are feasible values to use:
        <xsl:variable name="fg2bg_colorizer">
          <xsl:text> bgreen=#c0ffc0; gray3=#d0d0d0; green=#c0ffc0;</xsl:text>
          <xsl:text> lime=#e0ffe0; bviolet=#ffc0ff; gray4=#c0c0c0;</xsl:text>
          <xsl:text> maroon=#c08080; navy=#a0a0c0; bred=#ffc0cb;</xsl:text>
          <xsl:text> borange=#ffc097; gray5=#b0b0b0; olive=#cccc00;</xsl:text>
          <xsl:text> red=#ffc0cb; byellow=#ffffc0; bwhite=#ffffff;</xsl:text>
          <xsl:text> bbrown=#deb887; bblack=#808080; black=#808080;</xsl:text>
          <xsl:text> brown=#deb887; teal=#00e0e0; violet=#ffc0ff;</xsl:text>
          <xsl:text> white=#ffffff; bblue=#c0c0ff; blue=#c0c0ff;</xsl:text>
          <xsl:text> orange=#ffc097; aqua=#d0ffff; gray1=#f0f0f0;</xsl:text>
          <xsl:text> bgray=#d0d0d0; gray2=#e0e0e0; gray=#d0d0d0; yellow=#ffffc0;</xsl:text>
        </xsl:variable>
        <xsl:variable name="fg_colorizer">
          <xsl:text> lime=#00ff00; green=#008000; gray3=#c0c0c0;</xsl:text>
          <xsl:text> navy=#000080; maroon=#800000; gray4=#b0b0b0;</xsl:text>
          <xsl:text> red=#ff0000; olive=#808000; gray5=#808080;</xsl:text>
          <xsl:text> white=#ffffff; violet=#ff00ff; teal=#008080;</xsl:text>
          <xsl:text> brown=#804000; black=#000000; orange=#ff8000;</xsl:text>
          <xsl:text> blue=#0000ff; gray1=#e0e0e0; aqua=#00ffff;</xsl:text>
          <xsl:text> yellow=#ffff00; gray=#c0c0c0; gray2=#d0d0d0;</xsl:text>
        </xsl:variable>
-->
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


<!-- **********************************************************
       The next four templates help handle _cellfont.  The first two
       templates are called from the template that generates the table cell,
       the third is called from the first and the fourth from the third.
     ********************************************************** -->

<xsl:template name="just-after-table-cell-stag">
  <!-- handle cell shading (setting the background color attr on the cell) -->
  <xsl:apply-templates select="processing-instruction('Pub')[1]" mode="cellfontPI-shading"/>
  <!-- Now handle the rest of _cellfont by generating a call to 
	     PI_Pub_font_start -->
  <xsl:variable name="pi" select="processing-instruction('Pub')[1]"/>
  <xsl:if test="contains($pi, '_cellfont')">
    <xsl:call-template name="PI_Pub_font_start">
      <xsl:with-param name="pi" select="$pi"/>
    </xsl:call-template>
  </xsl:if>
</xsl:template>

<xsl:template name="just-before-table-cell-etag">
  <!-- if we have a _cellfont PI, generate a call to PI_Pub_font_end -->
  <xsl:variable name="pi" select="processing-instruction('Pub')[1]"/>
  <xsl:if test="contains($pi, '_cellfont')">
    <xsl:call-template name="PI_Pub_font_end"/>
  </xsl:if>
</xsl:template>

<!-- This template is added to handle _cellfont shading (which has to
     be called from within the template generating the cell since
     this template adds the background color attribute to the cell) -->
<xsl:template match="processing-instruction('Pub')" mode="cellfontPI-shading">
  <xsl:if test="contains(., '_cellfont')">
    <xsl:variable name="shade-color">
        <xsl:call-template name="cellfont-shading">
          <xsl:with-param name="pi" select="."/>
        </xsl:call-template>
    </xsl:variable>
    <xsl:if test="$shade-color!=''">
      <xsl:attribute name="{$bgcolor-attrname}">
        <xsl:value-of select="$shade-color"/>
      </xsl:attribute>
    </xsl:if>
  </xsl:if>
</xsl:template>

<!-- And this template is added to handle the above cellfont-shading call -->
<xsl:template name="cellfont-shading">
    <xsl:param name="pi" select="."/>
    <xsl:param name="piattr">Shading</xsl:param>
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
    <xsl:choose>
      <xsl:when test="$given_bgcolor='default'"></xsl:when>
      <xsl:when test="$bgcolor=''"><xsl:value-of select="string($given_bgcolor)"/></xsl:when>
      <xsl:when test="$bgcolor='default'"></xsl:when>
      <xsl:otherwise><xsl:value-of select="string($bgcolor)"/></xsl:otherwise>
    </xsl:choose>
  </xsl:if>
</xsl:template>

<!-- **********************************************************
       Some general/utility templates for table handling
     ********************************************************** -->

<xsl:template name="inherited.table.attribute">
  <xsl:param name="entry" select="."/>
  <xsl:param name="row" select="$entry/ancestor-or-self::*[local-name(.)='row'][1]"/>
  <xsl:param name="colnum" select="0"/>
  <xsl:param name="attribute" select="'colsep'"/>
  <xsl:param name="lastrow" select="0"/>
  <xsl:param name="lastcol" select="0"/>

  <xsl:variable name="tgroup" select="$row/ancestor::*[local-name(.)='tgroup'][1]"/>

  <xsl:variable name="tsubgroup"
       select="$row/ancestor::*[local-name(.)='thead' or local-name(.)='tfoot' or local-name(.)='tbody'][1]"/>

  <xsl:variable name="entry.value">
    <xsl:call-template name="get-attribute">
      <xsl:with-param name="element" select="$entry"/>
      <xsl:with-param name="attribute" select="$attribute"/>
    </xsl:call-template>
  </xsl:variable>

  <xsl:variable name="row.value">
    <xsl:call-template name="get-attribute">
      <xsl:with-param name="element" select="$row"/>
      <xsl:with-param name="attribute" select="$attribute"/>
    </xsl:call-template>
  </xsl:variable>

  <xsl:variable name="span.value">
    <xsl:if test="$entry/@spanname">
      <xsl:variable name="spanname" select="$entry/@spanname"/>
      <xsl:variable name="spanspec"
                    select="$tgroup/*[local-name(.)='spanspec'][@spanname=$spanname]"/>
      <xsl:variable name="span.colspec"
                    select="$tgroup/*[local-name(.)='colspec'][@colname=$spanspec/@namest]"/>

      <xsl:variable name="spanspec.value">
        <xsl:call-template name="get-attribute">
          <xsl:with-param name="element" select="$spanspec"/>
          <xsl:with-param name="attribute" select="$attribute"/>
        </xsl:call-template>
      </xsl:variable>

      <xsl:variable name="scolspec.value">
        <xsl:call-template name="get-attribute">
          <xsl:with-param name="element" select="$span.colspec"/>
          <xsl:with-param name="attribute" select="$attribute"/>
        </xsl:call-template>
      </xsl:variable>

      <xsl:choose>
        <xsl:when test="$spanspec.value != ''">
          <xsl:value-of select="$spanspec.value"/>
        </xsl:when>
        <xsl:when test="$scolspec.value != ''">
          <xsl:value-of select="$scolspec.value"/>
        </xsl:when>
        <xsl:otherwise></xsl:otherwise>
      </xsl:choose>
    </xsl:if>
  </xsl:variable>

  <xsl:variable name="namest.value">
    <xsl:if test="$entry/@namest">
      <xsl:variable name="namest" select="$entry/@namest"/>
      <xsl:variable name="colspec"
                    select="$tgroup/*[local-name(.)='colspec'][@colname=$namest]"/>

      <xsl:variable name="namest.value">
        <xsl:call-template name="get-attribute">
          <xsl:with-param name="element" select="$colspec"/>
          <xsl:with-param name="attribute" select="$attribute"/>
        </xsl:call-template>
      </xsl:variable>

      <xsl:choose>
        <xsl:when test="$namest.value">
          <xsl:value-of select="$namest.value"/>
        </xsl:when>
        <xsl:otherwise></xsl:otherwise>
      </xsl:choose>
    </xsl:if>
  </xsl:variable>

  <xsl:variable name="tsubgroup.value">
    <!-- Get value from thead, tfoot, or tbody -->
    <xsl:call-template name="get-attribute">
      <xsl:with-param name="element" select="$tsubgroup"/>
      <xsl:with-param name="attribute" select="$attribute"/>
    </xsl:call-template>
  </xsl:variable>

  <xsl:variable name="tgroup.value">
    <xsl:call-template name="get-attribute">
      <xsl:with-param name="element" select="$tgroup"/>
      <xsl:with-param name="attribute" select="$attribute"/>
    </xsl:call-template>
  </xsl:variable>

  <xsl:variable name="default.value">
    <!-- rowsep and colsep can have defaults on the "table" wrapper and 
         ultimately on the frame setting for outside rules.  Non-outside
         rules are unaffected by the frame setting.  Both rowsep and colsep
         default to 1 on the table wrapper if otherwise unspecified.  -->
    <!-- handle those here, for everything else, the default is the tsubgroup
         (thead, tfoot, or tbody) value or else the tgroup value -->
    <xsl:choose>
      <xsl:when test="$tsubgroup.value != ''">
        <xsl:value-of select="$tsubgroup.value"/>
      </xsl:when>
      <xsl:when test="$tgroup.value != ''">
        <xsl:value-of select="$tgroup.value"/>
      </xsl:when>
      <xsl:when test="$attribute = 'rowsep'">
        <xsl:choose>
          <xsl:when test="$tgroup/parent::*/@rowsep">
            <xsl:value-of select="$tgroup/parent::*/@rowsep"/>
          </xsl:when>
          <xsl:otherwise>1</xsl:otherwise>
        </xsl:choose>
      </xsl:when>
      <xsl:when test="$attribute = 'colsep'">
        <xsl:choose>
          <xsl:when test="$tgroup/parent::*/@colsep">
            <xsl:value-of select="$tgroup/parent::*/@colsep"/>
          </xsl:when>
          <xsl:otherwise>1</xsl:otherwise>
        </xsl:choose>
      </xsl:when>
      <xsl:otherwise><!-- empty --></xsl:otherwise>
    </xsl:choose>
  </xsl:variable>

  <xsl:variable name="frame.value">
    <xsl:variable name="frame">
      <xsl:choose>
        <xsl:when test="$tgroup/parent::*/@frame">
          <xsl:value-of select="$tgroup/parent::*/@frame"/>
        </xsl:when>
        <xsl:otherwise>all</xsl:otherwise>
      </xsl:choose>
    </xsl:variable>
    <xsl:choose>
      <xsl:when test="$attribute='rowsep'">
        <xsl:choose>
          <xsl:when test="$frame='all' or $frame='topbot' or $frame='bot'">1</xsl:when>
          <xsl:otherwise>0</xsl:otherwise>
        </xsl:choose>
      </xsl:when>
      <xsl:when test="$attribute='colsep'">
        <xsl:choose>
          <xsl:when test="$frame='all' or $frame='sides'">1</xsl:when>
          <xsl:otherwise>0</xsl:otherwise>
        </xsl:choose>
      </xsl:when>
    </xsl:choose>
  </xsl:variable>

  <xsl:choose>
    <xsl:when test="$lastrow='1' and $attribute='rowsep'">
      <xsl:value-of select="$frame.value"/>
    </xsl:when>
    <xsl:when test="$lastcol='1' and $attribute='colsep'">
      <xsl:value-of select="$frame.value"/>
    </xsl:when>
    <xsl:when test="$entry.value != ''">
      <xsl:value-of select="$entry.value"/>
    </xsl:when>
    <xsl:when test="$row.value != ''">
      <xsl:value-of select="$row.value"/>
    </xsl:when>
    <xsl:when test="$span.value != ''">
      <xsl:value-of select="$span.value"/>
    </xsl:when>
    <xsl:when test="$namest.value != ''">
      <xsl:value-of select="$namest.value"/>
    </xsl:when>
    <xsl:when test="$colnum &gt; 0">
      <xsl:variable name="calc.colvalue">
        <xsl:call-template name="colnum.colspec">
          <xsl:with-param name="colnum" select="$colnum"/>
          <xsl:with-param name="attribute" select="$attribute"/>
        </xsl:call-template>
      </xsl:variable>
      <xsl:choose>
        <xsl:when test="$calc.colvalue != ''">
          <xsl:value-of select="$calc.colvalue"/>
        </xsl:when>
        <xsl:otherwise>
          <xsl:value-of select="$default.value"/>
        </xsl:otherwise>
      </xsl:choose>
    </xsl:when>
    <xsl:otherwise>
      <xsl:value-of select="$default.value"/>
    </xsl:otherwise>
  </xsl:choose>
</xsl:template>

<xsl:template name="colnum.colspec">
  <xsl:param name="colnum" select="0"/>
  <xsl:param name="attribute" select="'colname'"/>
  <xsl:param name="colspecs" select="ancestor::*[local-name(.)='tgroup']/*[local-name(.)='colspec']"/>
  <xsl:param name="count" select="1"/>

  <xsl:choose>
    <xsl:when test="not($colspecs) or number($count) &gt; number($colnum)">
      <!-- nop -->
    </xsl:when>
    <xsl:when test="$colspecs[1]/@colnum">
      <xsl:choose>
        <xsl:when test="$colspecs[1]/@colnum = $colnum">
          <xsl:call-template name="get-attribute">
            <xsl:with-param name="element" select="$colspecs[1]"/>
            <xsl:with-param name="attribute" select="$attribute"/>
          </xsl:call-template>
        </xsl:when>
        <xsl:otherwise>
          <xsl:call-template name="colnum.colspec">
            <xsl:with-param name="colnum" select="$colnum"/>
            <xsl:with-param name="attribute" select="$attribute"/>
            <xsl:with-param name="colspecs"
                            select="$colspecs[position()&gt;1]"/>
            <xsl:with-param name="count"
                            select="$colspecs[1]/@colnum+1"/>
          </xsl:call-template>
        </xsl:otherwise>
      </xsl:choose>
    </xsl:when>
    <xsl:otherwise>
      <xsl:choose>
        <xsl:when test="$count = $colnum">
          <xsl:call-template name="get-attribute">
            <xsl:with-param name="element" select="$colspecs[1]"/>
            <xsl:with-param name="attribute" select="$attribute"/>
          </xsl:call-template>
        </xsl:when>
        <xsl:otherwise>
          <xsl:call-template name="colnum.colspec">
            <xsl:with-param name="colnum" select="$colnum"/>
            <xsl:with-param name="attribute" select="$attribute"/>
            <xsl:with-param name="colspecs"
                            select="$colspecs[position()&gt;1]"/>
            <xsl:with-param name="count" select="$count+1"/>
          </xsl:call-template>
        </xsl:otherwise>
      </xsl:choose>
    </xsl:otherwise>
  </xsl:choose>
</xsl:template>

<xsl:template name="get-attribute">
  <xsl:param name="element" select="."/>
  <xsl:param name="attribute" select="''"/>

  <xsl:for-each select="$element/@*">
    <xsl:if test="local-name(.) = $attribute">
      <xsl:value-of select="."/>
    </xsl:if>
  </xsl:for-each>
</xsl:template>

<xsl:template name="copy-string">
  <!-- returns 'count' copies of 'string' -->
  <xsl:param name="string"/>
  <xsl:param name="count" select="0"/>
  <xsl:param name="result"/>

  <xsl:choose>
    <xsl:when test="$count&gt;0">
      <xsl:call-template name="copy-string">
        <xsl:with-param name="string" select="$string"/>
        <xsl:with-param name="count" select="$count - 1"/>
        <xsl:with-param name="result">
          <xsl:value-of select="$result"/>
          <xsl:value-of select="$string"/>
        </xsl:with-param>
      </xsl:call-template>
    </xsl:when>
    <xsl:otherwise>
      <xsl:value-of select="$result"/>
    </xsl:otherwise>
  </xsl:choose>
</xsl:template>

<xsl:template name="calculate.colspan">
  <xsl:param name="entry" select="."/>
  <xsl:variable name="spanname" select="$entry/@spanname"/>
  <xsl:variable name="spanspec"
                select="$entry/ancestor::*[local-name(.)='tgroup']/*[local-name(.)='colspec'][@spanname=$spanname]"/>

  <xsl:variable name="namest">
    <xsl:choose>
      <xsl:when test="@spanname">
        <xsl:value-of select="$spanspec/@namest"/>
      </xsl:when>
      <xsl:otherwise>
        <xsl:value-of select="$entry/@namest"/>
      </xsl:otherwise>
    </xsl:choose>
  </xsl:variable>

  <xsl:variable name="nameend">
    <xsl:choose>
      <xsl:when test="@spanname">
        <xsl:value-of select="$spanspec/@nameend"/>
      </xsl:when>
      <xsl:otherwise>
        <xsl:value-of select="$entry/@nameend"/>
      </xsl:otherwise>
    </xsl:choose>
  </xsl:variable>

  <xsl:variable name="scol">
    <xsl:call-template name="colspec.colnum">
      <xsl:with-param name="colspec"
                      select="$entry/ancestor::*[local-name(.)='tgroup']/*[local-name(.)='colspec'][@colname=$namest]"/>
    </xsl:call-template>
  </xsl:variable>

  <xsl:variable name="ecol">
    <xsl:call-template name="colspec.colnum">
      <xsl:with-param name="colspec"
                      select="$entry/ancestor::*[local-name(.)='tgroup']/*[local-name(.)='colspec'][@colname=$nameend]"/>
    </xsl:call-template>
  </xsl:variable>

  <xsl:choose>
    <xsl:when test="$namest != '' and $nameend != ''">
      <xsl:choose>
        <xsl:when test="number($ecol) &gt;= number($scol)">
          <xsl:value-of select="$ecol - $scol + 1"/>
        </xsl:when>
        <xsl:otherwise>
          <xsl:value-of select="$scol - $ecol + 1"/>
        </xsl:otherwise>
      </xsl:choose>
    </xsl:when>
    <xsl:otherwise>1</xsl:otherwise>
  </xsl:choose>
</xsl:template>

<xsl:template name="calculate.following.spans">
  <xsl:param name="colspan" select="1"/>
  <xsl:param name="spans" select="''"/>

  <xsl:choose>
    <xsl:when test="$colspan &gt; 0">
      <xsl:call-template name="calculate.following.spans">
        <xsl:with-param name="colspan" select="$colspan - 1"/>
        <xsl:with-param name="spans" select="substring-after($spans,':')"/>
      </xsl:call-template>
    </xsl:when>
    <xsl:otherwise>
      <xsl:value-of select="$spans"/>
    </xsl:otherwise>
  </xsl:choose>
</xsl:template>

<xsl:template name="colspec.colnum">
  <xsl:param name="colspec" select="."/>
  <xsl:choose>
    <xsl:when test="$colspec/@colnum">
      <xsl:value-of select="$colspec/@colnum"/>
    </xsl:when>
    <xsl:when test="$colspec/preceding-sibling::*[local-name(.)='colspec']">
      <xsl:variable name="prec.colspec.colnum">
        <xsl:call-template name="colspec.colnum">
          <xsl:with-param name="colspec"
                          select="$colspec/preceding-sibling::*[local-name(.)='colspec'][1]"/>
        </xsl:call-template>
      </xsl:variable>
      <xsl:value-of select="$prec.colspec.colnum + 1"/>
    </xsl:when>
    <xsl:otherwise>1</xsl:otherwise>
  </xsl:choose>
</xsl:template>

<xsl:template name="set-lastrow">
    <xsl:variable name="rows-spanned">
      <xsl:choose>
        <xsl:when test="@morerows">
          <xsl:value-of select="@morerows+1"/>
        </xsl:when>
        <xsl:when test="@rowspan">
          <xsl:value-of select="@rowspan"/>
        </xsl:when>
        <xsl:otherwise>1</xsl:otherwise>
      </xsl:choose>
    </xsl:variable>
    <xsl:choose>
      <xsl:when test="ancestor::*[local-name(.)='thead']">0</xsl:when>
      <xsl:when test="ancestor::*[local-name(.)='tfoot']
                      and not(ancestor::*[local-name(.)='row' or local-name(.)='tr']/following-sibling::*[local-name(.)='row' or local-name(.)='tr'])">1</xsl:when>
      <xsl:when test="not(ancestor::*[local-name(.)='tfoot'])
                      and ancestor::*[local-name(.)='tgroup' or local-name(.)='table'][1]/*[local-name(.)='tfoot']">0</xsl:when>
      <xsl:when test="not(ancestor::*[local-name(.)='tfoot'])
                      and not(ancestor::*[local-name(.)='tgroup' or local-name(.)='table'][1]/*[local-name(.)='tfoot'])
                      and count(ancestor::*[local-name(.)='row' or local-name(.)='tr']/following-sibling::*[local-name(.)='row' or local-name(.)='tr']) &lt; $rows-spanned">1</xsl:when>
      <xsl:otherwise>0</xsl:otherwise>
    </xsl:choose>
</xsl:template>

<xsl:template name="set-lastcol">
  <xsl:param name="col" select="count(preceding-sibling::*[local-name(.)='td' or local-name(.)='th' or local-name(.)='entry']) + 1"/>
    <xsl:variable name="spanname" select="@spanname"/>
    <xsl:variable name="spanspec"
                select="ancestor::*[local-name(.)='tgroup']/*[local-name(.)='spanspec'][@spanname=$spanname]"/>
    <xsl:variable name="nameend">
      <xsl:choose>
        <xsl:when test="@spanname">
          <xsl:value-of select="$spanspec/@nameend"/>
        </xsl:when>
        <xsl:otherwise>
          <xsl:value-of select="@nameend"/>
        </xsl:otherwise>
      </xsl:choose>
    </xsl:variable>
    <xsl:variable name="xcols-spanned">
      <xsl:choose>
        <xsl:when test="string(number(@colspan)) != 'NaN'">
          <xsl:value-of select="@colspan - 1"/>
        </xsl:when>
        <xsl:otherwise>0</xsl:otherwise>
      </xsl:choose>
    </xsl:variable>
    <xsl:variable name="ecol">
      <xsl:choose>
        <xsl:when test="$nameend!=''">
          <xsl:call-template name="colspec.colnum">
            <xsl:with-param name="colspec"
                    select="ancestor::*[local-name(.)='tgroup']/*[local-name(.)='colspec'][@colname=$nameend]"/>
          </xsl:call-template>
        </xsl:when>
        <xsl:otherwise>
          <xsl:value-of select="$col + $xcols-spanned"/>
        </xsl:otherwise>
      </xsl:choose>
    </xsl:variable>
    <xsl:variable name="numcols">
      <xsl:choose>
        <xsl:when test="string(number(ancestor::*[local-name(.)='tgroup']/@cols))!='NaN'">
          <xsl:value-of select="number(ancestor::*[local-name(.)='tgroup']/@cols)"/>
        </xsl:when>
        <xsl:when test="ancestor::*[local-name(.)='tgroup']/*[local-name(.)='colspec']">
          <xsl:value-of select="count(ancestor::*[local-name(.)='tgroup']/*[local-name(.)='colspec'])"/>
        </xsl:when>
        <xsl:when test="ancestor::*[local-name(.)='table']//*[local-name(.)='col']">
          <xsl:value-of select="count(ancestor::*[local-name(.)='table']/*[local-name(.)='col']|
              ancestor::*[local-name(.)='table']/*[local-name(.)='colgroup']/*[local-name(.)='col'])"/>
        </xsl:when>
        <xsl:otherwise>0</xsl:otherwise>
      </xsl:choose>
    </xsl:variable>
    <xsl:choose>
      <xsl:when test="number($ecol) &lt; $numcols">0</xsl:when>
      <xsl:otherwise>1</xsl:otherwise>
    </xsl:choose>
</xsl:template>

<xsl:template name="set-firstrow">
    <xsl:choose>
      <xsl:when test="ancestor::*[local-name(.)='tfoot']">0</xsl:when>
      <xsl:when test="ancestor::*[local-name(.)='thead']
                      and not(ancestor::*[local-name(.)='row' or local-name(.)='tr']/preceding-sibling::*[local-name(.)='row' or local-name(.)='tr'])">1</xsl:when>
      <xsl:when test="not(ancestor::*[local-name(.)='thead'])
                      and ancestor::*[local-name(.)='tgroup' or local-name(.)='table'][1]/*[local-name(.)='thead']">0</xsl:when>
      <xsl:when test="not(ancestor::*[local-name(.)='thead'])
                      and not(ancestor::*[local-name(.)='tgroup' or local-name(.)='table'][1]/*[local-name(.)='thead'])
                      and not(ancestor::*[local-name(.)='row' or local-name(.)='tr']/preceding-sibling::*[local-name(.)='row' or local-name(.)='tr'])">1</xsl:when>
      <xsl:otherwise>0</xsl:otherwise>
    </xsl:choose>
</xsl:template>

<xsl:template name="set-firstcol">
  <xsl:param name="col" select="count(preceding-sibling::*[local-name(.)='td' or local-name(.)='th' or local-name(.)='entry']) + 1"/>
    <xsl:choose>
      <xsl:when test="$col &gt; 1">0</xsl:when>
      <xsl:otherwise>1</xsl:otherwise>
    </xsl:choose>
</xsl:template>

<xsl:template name="entry.colnum">
  <xsl:param name="entry" select="."/>

  <xsl:choose>
    <xsl:when test="$entry/@spanname">
      <xsl:variable name="spanname" select="$entry/@spanname"/>
      <xsl:variable name="spanspec"
                    select="$entry/ancestor::*[local-name(.)='tgroup']/*[local-name(.)='spanspec'][@spanname=$spanname]"/>
      <xsl:variable name="colspec"
                    select="$entry/ancestor::*[local-name(.)='tgroup']/*[local-name(.)='colspec'][@colname=$spanspec/@namest]"/>
      <xsl:call-template name="colspec.colnum">
        <xsl:with-param name="colspec" select="$colspec"/>
      </xsl:call-template>
    </xsl:when>
    <xsl:when test="$entry/@colname">
      <xsl:variable name="colname" select="$entry/@colname"/>
      <xsl:variable name="colspec"
                    select="$entry/ancestor::*[local-name(.)='tgroup']/*[local-name(.)='colspec'][@colname=$colname]"/>
      <xsl:call-template name="colspec.colnum">
        <xsl:with-param name="colspec" select="$colspec"/>
      </xsl:call-template>
    </xsl:when>
    <xsl:when test="$entry/@namest">
      <xsl:variable name="namest" select="$entry/@namest"/>
      <xsl:variable name="colspec"
                    select="$entry/ancestor::*[local-name(.)='tgroup']/*[local-name(.)='colspec'][@colname=$namest]"/>
      <xsl:call-template name="colspec.colnum">
        <xsl:with-param name="colspec" select="$colspec"/>
      </xsl:call-template>
    </xsl:when>
    <!-- no idea, return 0 -->
    <xsl:otherwise>0</xsl:otherwise>
  </xsl:choose>
</xsl:template>

<!-- Compute a border property -->
<xsl:template name="get-border-prop">
    <xsl:param name="side"/>
    <xsl:param name="prop" select="'style'"/>
    <xsl:param name="entry" select="."/>
    <xsl:param name="row" select="ancestor-or-self::*[local-name(.)='row' or local-name(.)='tr'][1]"/>
    <xsl:param name="colnum" select="1"/>
    <xsl:param name="lastrow" select="0"/>
    <xsl:param name="lastcol" select="0"/>
    <xsl:param name="firstrow" select="0"/>
    <xsl:param name="firstcol" select="0"/>
    <xsl:param name="frame" select="0"/>
    <xsl:param name="table-type" select="'cals'"/><!-- cals, html, or custom -->
    <xsl:param name="custom-table-rules-attr-value" select="''"/>
    <xsl:param name="custom-table-rules-default" select="'all'"/>

  <!--  The precedence is:
        * cell's PI
        * cell's rowsep/colsep (for border-*-style only and only for CALS)
        * row's PI (except for the case of the frame)
        * fallback, which is:
          - for style, @frame or inherited rowsep/colsep/rules/etc as in the past
          - for color, black
          - for width, tgroup rth PI, with default of 1pt for CALS and custom,
            @border (defaulting to 1px) for HTML
  -->
  <xsl:variable name="cell-pi" select="string($entry/processing-instruction('PubTbl')
            [(starts-with(.,'cell') or starts-with(.,'entry')) and contains(.,'border')])"/>

  <xsl:variable name="row-pi" select="string($row/processing-instruction('PubTbl')
            [(starts-with(.,'cell') or starts-with(.,'row')) and contains(.,'border')])"/>

  <!-- the table element node is (1) the parent of tgroup (cals), (2) the
       table element (html), or (3) just the row's parent else the current element (custom). -->
  <xsl:variable name="table-element-node"
        select="(((ancestor-or-self::*[local-name(.)='tgroup'][1]/parent::*|
                   ancestor-or-self::*[local-name(.)='table'][1]
                  )[last()]
                 )|$row/parent::*|.
                )[1]"/>

  <xsl:variable name="table-cell-level-pi"
         select="string($table-element-node/processing-instruction('PubTbl')
                        [starts-with(.,'cell') and contains(.,'border')])"/>

  <xsl:variable name="border-prop" select="concat('border-',$side,'-',$prop)"/>

  <xsl:variable name="frame-rule"
      select="$frame=1 or ($lastrow=1 and $side='bottom') or ($lastcol=1 and $side='right')
                       or ($firstrow=1 and $side='top') or ($firstcol=1 and $side='left')"/>

  <xsl:variable name="cell-pi-value">
    <xsl:call-template name="get-pi-attr-value">
      <xsl:with-param name="pi" select="$cell-pi"/>
      <xsl:with-param name="piattr" select="$border-prop"/>
    </xsl:call-template>
  </xsl:variable>

  <xsl:variable name="row-pi-value">
    <xsl:call-template name="get-pi-attr-value">
      <xsl:with-param name="pi" select="$row-pi"/>
      <xsl:with-param name="piattr" select="$border-prop"/>
    </xsl:call-template>
  </xsl:variable>

  <xsl:variable name="table-cell-level-pi-value">
    <xsl:call-template name="get-pi-attr-value">
      <xsl:with-param name="pi" select="$table-cell-level-pi"/>
      <xsl:with-param name="piattr" select="$border-prop"/>
    </xsl:call-template>
  </xsl:variable>

  <xsl:variable name="frame-pi-value">
    <xsl:if test="$frame-rule">
      <xsl:call-template name="get-pi-attr-value">
        <xsl:with-param name="pi"
            select="string($table-element-node/processing-instruction('PubTbl')
                       [starts-with(.,'table') and contains(.,'border')])"/>
        <xsl:with-param name="piattr" select="$border-prop"/>
      </xsl:call-template>
    </xsl:if>
  </xsl:variable>

  <xsl:variable name="rowsep-style">
    <xsl:if test="$prop='style' and ($side='top' or $side='bottom')">
      <xsl:choose>
        <xsl:when test="@rowsep=1">solid</xsl:when>
        <xsl:when test="@rowsep=0">none</xsl:when>
      </xsl:choose>
    </xsl:if>
  </xsl:variable>

  <xsl:variable name="colsep-style">
    <xsl:if test="$prop='style' and ($side='left' or $side='right')">
      <xsl:choose>
        <xsl:when test="@colsep=1">solid</xsl:when>
        <xsl:when test="@colsep=0">none</xsl:when>
      </xsl:choose>
    </xsl:if>
  </xsl:variable>

  <xsl:variable name="frame-value">
    <xsl:if test="$frame-rule">
      <xsl:choose>
        <xsl:when test="$prop='width'">
          <xsl:choose>
            <xsl:when test="$table-type='html'">
              <xsl:variable name="border-attr" select="string($table-element-node/@border)"/>
              <xsl:choose>
                <xsl:when test="$border-attr!=''">
                  <xsl:value-of select="concat($border-attr,'px')"/>
                </xsl:when>
                <xsl:otherwise>
                  <xsl:value-of select="$table.border.thickness"/>
                </xsl:otherwise>
              </xsl:choose>
            </xsl:when>
            <xsl:otherwise>
              <xsl:value-of select="$table.border.thickness"/>
            </xsl:otherwise>
          </xsl:choose>
        </xsl:when>
        <xsl:when test="$prop='color'">
          <xsl:text>black</xsl:text>
        </xsl:when>
        <xsl:when test="$table-type='cals' or $table-type='html'">
          <xsl:variable name="frame-attr" select="string($table-element-node/@frame)"/>
          <xsl:choose>
            <xsl:when test="$frame-attr='all' or $frame-attr='box' or $frame-attr='border'">
              <xsl:value-of select="'solid'"/>
            </xsl:when>
            <xsl:when test="$side='left' and ($frame-attr='lhs' or $frame-attr='sides' or $frame-attr='vsides')">
              <xsl:value-of select="'solid'"/>
            </xsl:when>
            <xsl:when test="$side='top' and ($frame-attr='top' or $frame-attr='topbot' or $frame-attr='hsides' or $frame-attr='above')">
              <xsl:value-of select="'solid'"/>
            </xsl:when>
            <xsl:when test="$side='right' and ($frame-attr='rhs' or $frame-attr='sides' or $frame-attr='vsides')">
              <xsl:value-of select="'solid'"/>
            </xsl:when>
            <xsl:when test="$side='bottom' and ($frame-attr='bottom' or $frame-attr='topbot' or $frame-attr='hsides' or $frame-attr='below')">
              <xsl:value-of select="'solid'"/>
            </xsl:when>
            <xsl:when test="$frame-attr!='' and $frame=1">
              <xsl:value-of select="$table.border.hidden.style"/>
            </xsl:when>
            <xsl:when test="$frame-attr!=''">
              <xsl:value-of select="'none'"/>
            </xsl:when>
            <xsl:when test="$table-type='html' and $frame=1">
              <!-- for html tables, frame defaults to 'void' if border=0 or unspecified, else to 'border' -->
              <xsl:variable name="border-attr" select="string($table-element-node/@border)"/>
              <xsl:choose>
                <xsl:when test="$border-attr='' or $border-attr='0'">
                  <xsl:value-of select="$table.border.hidden.style"/>
                </xsl:when>
                <xsl:otherwise>
                  <xsl:value-of select="'solid'"/>
                </xsl:otherwise>
              </xsl:choose>
            </xsl:when>
            <xsl:when test="$table-type='html'">
              <!-- for html tables, rules defaults to 'none' if border=0 or unspecified, else to 'all' -->
              <xsl:variable name="border-attr" select="string($table-element-node/@border)"/>
              <xsl:choose>
                <xsl:when test="$border-attr='' or $border-attr='0'">
                  <xsl:value-of select="'none'"/>
                </xsl:when>
                <xsl:otherwise>
                  <xsl:value-of select="'solid'"/>
                </xsl:otherwise>
              </xsl:choose>
            </xsl:when>
            <xsl:otherwise>
              <!-- default cals frame rules to solid -->
              <xsl:value-of select="'solid'"/>
            </xsl:otherwise>
          </xsl:choose>
        </xsl:when>
        <xsl:otherwise>
          <!-- handle default frame for custom tables -->
          <xsl:variable name="rules">
            <xsl:choose>
              <xsl:when test="$custom-table-rules-attr-value!=''">
                <xsl:value-of select="$custom-table-rules-attr-value"/>
              </xsl:when>
              <xsl:otherwise>
                <xsl:value-of select="$custom-table-rules-default"/>
              </xsl:otherwise>
            </xsl:choose>
          </xsl:variable>
          <xsl:choose>
            <xsl:when test="($rules='all') or ($rules='frame-only')">
              <xsl:value-of select="'solid'"/>
            </xsl:when>
            <xsl:when test="$side='left' and ($rules='left' or $rules='sides' or $rules='cols')">
              <xsl:value-of select="'solid'"/>
            </xsl:when>
            <xsl:when test="$side='top' and ($rules='top' or $rules='topbot' or $rules='rows')">
              <xsl:value-of select="'solid'"/>
            </xsl:when>
            <xsl:when test="$side='right' and ($rules='right' or $rules='sides' or $rules='cols')">
              <xsl:value-of select="'solid'"/>
            </xsl:when>
            <xsl:when test="$side='bottom' and ($rules='bottom' or $rules='topbot' or $rules='rows')">
              <xsl:value-of select="'solid'"/>
            </xsl:when>
            <xsl:when test="$rules!='' and $frame=1">
              <xsl:value-of select="$table.border.hidden.style"/>
            </xsl:when>
            <xsl:when test="$rules!=''">
              <xsl:value-of select="'none'"/>
            </xsl:when>
            <xsl:otherwise>
              <!-- default custom table frame rules to solid -->
              <xsl:value-of select="'solid'"/>
            </xsl:otherwise>
          </xsl:choose>
        </xsl:otherwise>
      </xsl:choose>
    </xsl:if>
  </xsl:variable>

  <xsl:variable name="resolved-prop-value">
   <xsl:choose>
    <xsl:when test="$frame-pi-value!=''">
      <!-- Will only be true for a non-inner (frame) rule -->
      <xsl:value-of select="$frame-pi-value"/>
    </xsl:when>
    <xsl:when test="$frame-value!=''">
      <!-- Will only be true for a non-inner (frame) rule -->
      <xsl:value-of select="$frame-value"/>
    </xsl:when>
    <xsl:when test="$cell-pi-value!=''">
      <xsl:value-of select="$cell-pi-value"/>
    </xsl:when>
    <xsl:when test="$rowsep-style!=''">
      <!-- Will only be true for border-{top,bottom}-style -->
      <xsl:value-of select="$rowsep-style"/>
    </xsl:when>
    <xsl:when test="$colsep-style!=''">
      <!-- Will only be true for border-{left,right}-style -->
      <xsl:value-of select="$colsep-style"/>
    </xsl:when>
    <xsl:when test="$row-pi-value!=''">
      <xsl:value-of select="$row-pi-value"/>
    </xsl:when>
    <xsl:when test="$table-cell-level-pi-value!=''">
      <xsl:value-of select="$table-cell-level-pi-value"/>
    </xsl:when>
    <xsl:when test="$prop='style'">
      <!-- fallback for style (for non-frame rule) -->
      <xsl:choose>
        <xsl:when test="$table-type='html'">
          <xsl:variable name="rules-attr" select="string($table-element-node/@rules)"/>
          <!-- for html tables, rules defaults to 'none' if border=0 or unspecified, else to 'all' -->
          <xsl:variable name="border-attr" select="string($table-element-node/@border)"/>
          <xsl:choose>
            <xsl:when test="$rules-attr='all'">
              <xsl:value-of select="'solid'"/>
            </xsl:when>
            <xsl:when test="$rules-attr='rows' and ($side='top' or $side='bottom')">
              <xsl:value-of select="'solid'"/>
            </xsl:when>
            <xsl:when test="$rules-attr='cols' and ($side='left' or $side='right')">
              <xsl:value-of select="'solid'"/>
            </xsl:when>
            <xsl:when test="$rules-attr!=''">
              <xsl:value-of select="'none'"/>
            </xsl:when>
            <xsl:otherwise>
              <!-- default frame rule style for html tables -->
              <xsl:choose>
                <xsl:when test="$border-attr='' or $border-attr='0'">
                  <xsl:value-of select="'none'"/>
                </xsl:when>
                <xsl:otherwise>
                  <xsl:value-of select="'solid'"/>
                </xsl:otherwise>
              </xsl:choose>
            </xsl:otherwise>
          </xsl:choose>
        </xsl:when>
        <xsl:when test="$table-type='cals'">
          <xsl:choose>
            <xsl:when test="$side='top' or $side='bottom'">
              <xsl:variable name="rowsep">
                <xsl:call-template name="inherited.table.attribute">
                  <xsl:with-param name="entry" select="."/>
                  <xsl:with-param name="row" select="$row"/>
                  <xsl:with-param name="colnum" select="$colnum"/>
                  <xsl:with-param name="attribute" select="'rowsep'"/>
                  <xsl:with-param name="lastrow" select="$lastrow"/>
                  <xsl:with-param name="lastcol" select="$lastcol"/>
                </xsl:call-template>
              </xsl:variable>
              <xsl:choose>
                <xsl:when test="$rowsep=1">solid</xsl:when>
                <xsl:otherwise>none</xsl:otherwise>
              </xsl:choose>
            </xsl:when>
            <xsl:otherwise>
              <xsl:variable name="colsep">
                <xsl:call-template name="inherited.table.attribute">
                  <xsl:with-param name="entry" select="."/>
                  <xsl:with-param name="row" select="$row"/>
                  <xsl:with-param name="colnum" select="$colnum"/>
                  <xsl:with-param name="attribute" select="'colsep'"/>
                  <xsl:with-param name="lastrow" select="$lastrow"/>
                  <xsl:with-param name="lastcol" select="$lastcol"/>
                </xsl:call-template>
              </xsl:variable>
              <xsl:choose>
                <xsl:when test="$colsep=1">solid</xsl:when>
                <xsl:otherwise>none</xsl:otherwise>
              </xsl:choose>
            </xsl:otherwise>
          </xsl:choose>
        </xsl:when>
        <xsl:otherwise>
          <xsl:variable name="rules">
            <xsl:choose>
              <xsl:when test="$custom-table-rules-attr-value!=''">
                <xsl:value-of select="$custom-table-rules-attr-value"/>
              </xsl:when>
              <xsl:otherwise>
                <xsl:value-of select="$custom-table-rules-default"/>
              </xsl:otherwise>
            </xsl:choose>
          </xsl:variable>
          <xsl:choose>
            <xsl:when test="$rules='all'">
              <xsl:value-of select="'solid'"/>
            </xsl:when>
            <xsl:when test="$side='left' and $rules='cols'">
              <xsl:value-of select="'solid'"/>
            </xsl:when>
            <xsl:when test="$side='top' and $rules='rows'">
              <xsl:value-of select="'solid'"/>
            </xsl:when>
            <xsl:when test="$side='right' and $rules='cols'">
              <xsl:value-of select="'solid'"/>
            </xsl:when>
            <xsl:when test="$side='bottom' and $rules='rows'">
              <xsl:value-of select="'solid'"/>
            </xsl:when>
            <xsl:when test="$rules!=''">
              <xsl:value-of select="'none'"/>
            </xsl:when>
            <xsl:otherwise>
              <!-- default custom table frame rules to solid -->
              <xsl:value-of select="'solid'"/>
            </xsl:otherwise>
          </xsl:choose>
        </xsl:otherwise>
      </xsl:choose>
    </xsl:when>
    <xsl:when test="$prop='color'">
      <xsl:text>black</xsl:text>
    </xsl:when>
    <xsl:when test="$prop='width'">
      <!-- fallback for width -->
      <xsl:variable name="rth-pi" 
        select="string(ancestor-or-self::*[local-name(.)='tgroup'][1]/
                          processing-instruction('PubTbl')
                             [starts-with(.,'tgroup') and contains(.,' rth=')])"/>
      <!-- Maybe set border thickness from PubTbl PI -->
      <xsl:choose>
        <xsl:when test="$rth-pi!=''">
          <xsl:call-template name="get-pi-attr-value">
            <xsl:with-param name="pi" select="$rth-pi"/>
            <xsl:with-param name="piattr" select="'rth'"/>
          </xsl:call-template>
        </xsl:when>
        <xsl:when test="$table-type='html'">
          <xsl:value-of select="$html.table.border.thickness"/>
        </xsl:when>
        <xsl:otherwise>
          <xsl:value-of select="$table.border.thickness"/>
        </xsl:otherwise>
      </xsl:choose>
    </xsl:when>
   </xsl:choose>
  </xsl:variable>

  <xsl:choose>
    <xsl:when test="$prop='color'">
      <!-- We need to map color names -->
      <xsl:variable name="temp" select="substring-after($fg_colorizer,concat($resolved-prop-value,'='))"/>
      <xsl:variable name="color" select="substring-before($temp,';')"/>
      <xsl:choose>
        <xsl:when test="$color=''"><xsl:value-of select="$resolved-prop-value"/></xsl:when>
        <xsl:otherwise><xsl:value-of select="$color"/></xsl:otherwise>
      </xsl:choose>
    </xsl:when>
    <xsl:otherwise>
      <xsl:value-of select="$resolved-prop-value"/>
    </xsl:otherwise>
  </xsl:choose>
</xsl:template>

<!-- ==================================================================== -->

<xsl:template name="emit-border-atts">
  <!-- This is called from several files to set FO (and CDFO) border properties -->
    <xsl:param name="frame" select="0"/>
    <xsl:param name="lastrow" select="0"/>
    <xsl:param name="lastcol" select="0"/>
    <xsl:param name="firstrow" select="0"/>
    <xsl:param name="firstcol" select="0"/>
    <xsl:param name="doing-cdfo-processing" select="'0'"/>
    <xsl:param name="table-type" select="'cals'"/><!-- cals, html, or custom -->

  <xsl:if test="$frame=1">
    <xsl:variable name="border-left-style">
      <xsl:call-template name="get-border-prop">
        <xsl:with-param name="side" select="'left'"/>
        <xsl:with-param name="prop" select="'style'"/>
        <xsl:with-param name="frame" select="1"/>
        <xsl:with-param name="table-type" select="$table-type"/>
      </xsl:call-template>
    </xsl:variable>

    <xsl:variable name="border-top-style">
      <xsl:call-template name="get-border-prop">
        <xsl:with-param name="side" select="'top'"/>
        <xsl:with-param name="prop" select="'style'"/>
        <xsl:with-param name="frame" select="1"/>
        <xsl:with-param name="table-type" select="$table-type"/>
      </xsl:call-template>
    </xsl:variable>

    <xsl:attribute name="border-left-style">
      <xsl:value-of select="$border-left-style"/>
    </xsl:attribute>
    <xsl:if test="$border-left-style!='none' and $border-left-style!='hidden'">
      <xsl:variable name="width">
        <xsl:call-template name="get-border-prop">
          <xsl:with-param name="side" select="'left'"/>
          <xsl:with-param name="prop" select="'width'"/>
          <xsl:with-param name="frame" select="1"/>
          <xsl:with-param name="table-type" select="$table-type"/>
        </xsl:call-template>
      </xsl:variable>
      <xsl:attribute name="border-left-width">
        <xsl:choose>
          <xsl:when test="$doing-cdfo-processing=1 and $border-left-style='double'">
            <!-- For RTF, for double rules, the width determines the width
                 of one of the rules, not the combination of both rules, so
                 we need to pass in a width that is 25% of the desired width. -->
            <xsl:call-template name="quarter-size">
              <xsl:with-param name="size" select="$width"/>
            </xsl:call-template>
          </xsl:when>
          <xsl:otherwise>
            <xsl:value-of select="$width"/>
          </xsl:otherwise>
        </xsl:choose>
      </xsl:attribute>
      <xsl:variable name="temp">
        <xsl:call-template name="get-border-prop">
          <xsl:with-param name="side" select="'left'"/>
          <xsl:with-param name="prop" select="'color'"/>
          <xsl:with-param name="frame" select="1"/>
          <xsl:with-param name="table-type" select="$table-type"/>
        </xsl:call-template>
      </xsl:variable>
      <xsl:if test="$temp!='#000000' or $emit-black-border-color='yes'">
        <xsl:attribute name="border-left-color">
          <xsl:value-of select="$temp"/>
        </xsl:attribute>
      </xsl:if>
    </xsl:if>

    <xsl:attribute name="border-top-style">
      <xsl:value-of select="$border-top-style"/>
    </xsl:attribute>
    <xsl:if test="$border-top-style!='none' and $border-top-style!='hidden'">
      <xsl:variable name="width">
        <xsl:call-template name="get-border-prop">
          <xsl:with-param name="side" select="'top'"/>
          <xsl:with-param name="prop" select="'width'"/>
          <xsl:with-param name="frame" select="1"/>
          <xsl:with-param name="table-type" select="$table-type"/>
        </xsl:call-template>
      </xsl:variable>
      <xsl:attribute name="border-top-width">
        <xsl:choose>
          <xsl:when test="$doing-cdfo-processing=1 and $border-top-style='double'">
            <!-- For RTF, for double rules, the width determines the width
                 of one of the rules, not the combination of both rules, so
                 we need to pass in a width that is 25% of the desired width. -->
            <xsl:call-template name="quarter-size">
              <xsl:with-param name="size" select="$width"/>
            </xsl:call-template>
          </xsl:when>
          <xsl:otherwise>
            <xsl:value-of select="$width"/>
          </xsl:otherwise>
        </xsl:choose>
      </xsl:attribute>
      <xsl:variable name="temp">
        <xsl:call-template name="get-border-prop">
          <xsl:with-param name="side" select="'top'"/>
          <xsl:with-param name="prop" select="'color'"/>
          <xsl:with-param name="frame" select="1"/>
          <xsl:with-param name="table-type" select="$table-type"/>
        </xsl:call-template>
      </xsl:variable>
      <xsl:if test="$temp!='#000000' or $emit-black-border-color='yes'">
        <xsl:attribute name="border-top-color">
          <xsl:value-of select="$temp"/>
        </xsl:attribute>
      </xsl:if>
    </xsl:if>
  </xsl:if>

  <xsl:if test="$doing-cdfo-processing=1">
    <!-- Because CDOCS only supports borders on for:table-cell, we must
         set top and left values on cells in the first row or column. -->
    <xsl:if test="$firstrow=1">
      <xsl:variable name="border-top-style">
        <xsl:call-template name="get-border-prop">
          <xsl:with-param name="side" select="'top'"/>
          <xsl:with-param name="prop" select="'style'"/>
          <xsl:with-param name="frame" select="$frame"/>
          <xsl:with-param name="firstrow" select="$firstrow"/>
          <xsl:with-param name="firstcol" select="$firstcol"/>
          <xsl:with-param name="table-type" select="$table-type"/>
        </xsl:call-template>
      </xsl:variable>

      <xsl:attribute name="border-top-style">
        <xsl:value-of select="$border-top-style"/>
      </xsl:attribute>
      <xsl:if test="$border-top-style!='none' and $border-top-style!='hidden'">
        <xsl:variable name="width">
          <xsl:call-template name="get-border-prop">
            <xsl:with-param name="side" select="'top'"/>
            <xsl:with-param name="prop" select="'width'"/>
            <xsl:with-param name="frame" select="$frame"/>
            <xsl:with-param name="firstrow" select="$firstrow"/>
            <xsl:with-param name="firstcol" select="$firstcol"/>
            <xsl:with-param name="table-type" select="$table-type"/>
          </xsl:call-template>
        </xsl:variable>
        <xsl:attribute name="border-top-width">
          <xsl:choose>
            <xsl:when test="$doing-cdfo-processing=1 and $border-top-style='double'">
              <!-- For RTF, for double rules, the width determines the width
                   of one of the rules, not the combination of both rules, so
                   we need to pass in a width that is 25% of the desired width. -->
              <xsl:call-template name="quarter-size">
                <xsl:with-param name="size" select="$width"/>
              </xsl:call-template>
            </xsl:when>
            <xsl:otherwise>
              <xsl:value-of select="$width"/>
            </xsl:otherwise>
          </xsl:choose>
        </xsl:attribute>
        <xsl:variable name="temp">
          <xsl:call-template name="get-border-prop">
            <xsl:with-param name="side" select="'top'"/>
            <xsl:with-param name="prop" select="'color'"/>
            <xsl:with-param name="frame" select="$frame"/>
            <xsl:with-param name="firstrow" select="$firstrow"/>
            <xsl:with-param name="firstcol" select="$firstcol"/>
            <xsl:with-param name="table-type" select="$table-type"/>
          </xsl:call-template>
        </xsl:variable>
        <xsl:if test="$temp!='#000000' or $emit-black-border-color='yes'">
          <xsl:attribute name="border-top-color">
            <xsl:value-of select="$temp"/>
          </xsl:attribute>
        </xsl:if>
      </xsl:if>
    </xsl:if>
    <xsl:if test="$firstcol=1">
      <xsl:variable name="border-left-style">
        <xsl:call-template name="get-border-prop">
          <xsl:with-param name="side" select="'left'"/>
          <xsl:with-param name="prop" select="'style'"/>
          <xsl:with-param name="frame" select="$frame"/>
          <xsl:with-param name="firstrow" select="$firstrow"/>
          <xsl:with-param name="firstcol" select="$firstcol"/>
          <xsl:with-param name="table-type" select="$table-type"/>
        </xsl:call-template>
      </xsl:variable>

      <xsl:attribute name="border-left-style">
        <xsl:value-of select="$border-left-style"/>
      </xsl:attribute>
      <xsl:if test="$border-left-style!='none' and $border-left-style!='hidden'">
        <xsl:variable name="width">
          <xsl:call-template name="get-border-prop">
            <xsl:with-param name="side" select="'left'"/>
            <xsl:with-param name="prop" select="'width'"/>
            <xsl:with-param name="frame" select="$frame"/>
            <xsl:with-param name="firstrow" select="$firstrow"/>
            <xsl:with-param name="firstcol" select="$firstcol"/>
            <xsl:with-param name="table-type" select="$table-type"/>
          </xsl:call-template>
        </xsl:variable>
        <xsl:attribute name="border-left-width">
          <xsl:choose>
            <xsl:when test="$doing-cdfo-processing=1 and $border-left-style='double'">
              <!-- For RTF, for double rules, the width determines the width
                   of one of the rules, not the combination of both rules, so
                   we need to pass in a width that is 25% of the desired width. -->
              <xsl:call-template name="quarter-size">
                <xsl:with-param name="size" select="$width"/>
              </xsl:call-template>
            </xsl:when>
            <xsl:otherwise>
              <xsl:value-of select="$width"/>
            </xsl:otherwise>
          </xsl:choose>
        </xsl:attribute>
        <xsl:variable name="temp">
          <xsl:call-template name="get-border-prop">
            <xsl:with-param name="side" select="'left'"/>
            <xsl:with-param name="prop" select="'color'"/>
            <xsl:with-param name="frame" select="$frame"/>
            <xsl:with-param name="firstrow" select="$firstrow"/>
            <xsl:with-param name="firstcol" select="$firstcol"/>
            <xsl:with-param name="table-type" select="$table-type"/>
          </xsl:call-template>
        </xsl:variable>
        <xsl:if test="$temp!='#000000' or $emit-black-border-color='yes'">
          <xsl:attribute name="border-left-color">
            <xsl:value-of select="$temp"/>
          </xsl:attribute>
        </xsl:if>
      </xsl:if>
    </xsl:if>
  </xsl:if>

  <xsl:variable name="border-right-style">
    <xsl:call-template name="get-border-prop">
      <xsl:with-param name="side" select="'right'"/>
      <xsl:with-param name="prop" select="'style'"/>
      <xsl:with-param name="frame" select="$frame"/>
      <xsl:with-param name="lastrow" select="$lastrow"/>
      <xsl:with-param name="lastcol" select="$lastcol"/>
      <xsl:with-param name="table-type" select="$table-type"/>
    </xsl:call-template>
  </xsl:variable>

  <xsl:variable name="border-bottom-style">
    <xsl:call-template name="get-border-prop">
      <xsl:with-param name="side" select="'bottom'"/>
      <xsl:with-param name="prop" select="'style'"/>
      <xsl:with-param name="frame" select="$frame"/>
      <xsl:with-param name="lastrow" select="$lastrow"/>
      <xsl:with-param name="lastcol" select="$lastcol"/>
      <xsl:with-param name="table-type" select="$table-type"/>
    </xsl:call-template>
  </xsl:variable>

  <xsl:attribute name="border-right-style">
    <xsl:value-of select="$border-right-style"/>
  </xsl:attribute>
  <xsl:if test="$border-right-style!='none' and $border-right-style!='hidden'">
    <xsl:variable name="width">
      <xsl:call-template name="get-border-prop">
        <xsl:with-param name="side" select="'right'"/>
        <xsl:with-param name="prop" select="'width'"/>
        <xsl:with-param name="frame" select="$frame"/>
        <xsl:with-param name="lastrow" select="$lastrow"/>
        <xsl:with-param name="lastcol" select="$lastcol"/>
        <xsl:with-param name="table-type" select="$table-type"/>
      </xsl:call-template>
    </xsl:variable>
    <xsl:attribute name="border-right-width">
      <xsl:choose>
        <xsl:when test="$doing-cdfo-processing=1 and $border-right-style='double'">
          <!-- For RTF, for double rules, the width determines the width
               of one of the rules, not the combination of both rules, so
               we need to pass in a width that is 25% of the desired width. -->
          <xsl:call-template name="quarter-size">
            <xsl:with-param name="size" select="$width"/>
          </xsl:call-template>
        </xsl:when>
        <xsl:otherwise>
          <xsl:value-of select="$width"/>
        </xsl:otherwise>
      </xsl:choose>
    </xsl:attribute>
    <xsl:variable name="temp">
      <xsl:call-template name="get-border-prop">
        <xsl:with-param name="side" select="'right'"/>
        <xsl:with-param name="prop" select="'color'"/>
        <xsl:with-param name="frame" select="$frame"/>
        <xsl:with-param name="lastrow" select="$lastrow"/>
        <xsl:with-param name="lastcol" select="$lastcol"/>
        <xsl:with-param name="table-type" select="$table-type"/>
      </xsl:call-template>
    </xsl:variable>
    <xsl:if test="$temp!='#000000' or $emit-black-border-color='yes'">
      <xsl:attribute name="border-right-color">
        <xsl:value-of select="$temp"/>
      </xsl:attribute>
    </xsl:if>
  </xsl:if>

  <xsl:attribute name="border-bottom-style">
    <xsl:value-of select="$border-bottom-style"/>
  </xsl:attribute>
  <xsl:if test="$border-bottom-style!='none' and $border-bottom-style!='hidden'">
    <xsl:variable name="width">
      <xsl:call-template name="get-border-prop">
        <xsl:with-param name="side" select="'bottom'"/>
        <xsl:with-param name="prop" select="'width'"/>
        <xsl:with-param name="frame" select="$frame"/>
        <xsl:with-param name="lastrow" select="$lastrow"/>
        <xsl:with-param name="lastcol" select="$lastcol"/>
        <xsl:with-param name="table-type" select="$table-type"/>
      </xsl:call-template>
    </xsl:variable>
    <xsl:attribute name="border-bottom-width">
      <xsl:choose>
        <xsl:when test="$doing-cdfo-processing=1 and $border-bottom-style='double'">
          <!-- For RTF, for double rules, the width determines the width
               of one of the rules, not the combination of both rules, so
               we need to pass in a width that is 25% of the desired width. -->
          <xsl:call-template name="quarter-size">
            <xsl:with-param name="size" select="$width"/>
          </xsl:call-template>
        </xsl:when>
        <xsl:otherwise>
          <xsl:value-of select="$width"/>
        </xsl:otherwise>
      </xsl:choose>
    </xsl:attribute>
    <xsl:variable name="temp">
     <xsl:call-template name="get-border-prop">
      <xsl:with-param name="side" select="'bottom'"/>
      <xsl:with-param name="prop" select="'color'"/>
      <xsl:with-param name="frame" select="$frame"/>
      <xsl:with-param name="lastrow" select="$lastrow"/>
      <xsl:with-param name="lastcol" select="$lastcol"/>
      <xsl:with-param name="table-type" select="$table-type"/>
     </xsl:call-template>
    </xsl:variable>
    <xsl:if test="$temp!='#000000' or $emit-black-border-color='yes'">
      <xsl:attribute name="border-bottom-color">
        <xsl:value-of select="$temp"/>
      </xsl:attribute>
    </xsl:if>
  </xsl:if>
</xsl:template>

<xsl:param name="rtf-double-rule-thickness-adjustment" select="0.25"/>

<xsl:template name="quarter-size">
    <xsl:param name="size"/>
  <!-- Via a parameter, we allow different adjustments, not necessarily 25% -->
  <xsl:variable name="units" select="substring($size,string-length($size)-1)"/>
  <xsl:variable name="val" select="number(substring($size,1,string-length($size)-2))"/>

  <xsl:value-of select="$val * $rtf-double-rule-thickness-adjustment"/>
  <xsl:value-of select="$units"/>
</xsl:template>

</xsl:stylesheet>




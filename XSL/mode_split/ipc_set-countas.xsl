<?xml version="1.0" encoding="UTF-8"?><xsl:stylesheet xmlns:simg="java:net.sf.docbook.saxon.ImageIntrinsics" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:ximg="xaln://com.nwalsh.xalan.ImageIntrinsics" xmlns="http://www.w3.org/1999/xhtml" xmlns:exslt="http://exslt.org/common" xmlns:_acl="java:com.arbortext.epic.Acl" xmlns:msxsl="urn:schemas-microsoft-com:xslt" xmlns:_="http://www.pwc.ca/namespace/doctypes/emipc" xmlns:_dtd="http://www.arbortext.com/namespace/Styler/UserElements" xmlns:atidlm="http://www.arbortext.com/namespace/atidlm" xmlns:_2="http://www.pwc.ca/namespace/doctypes/jmtosmigrate" xmlns:ch="http://www.arbortext.com/namespace/chunker" xmlns:saxon="http://saxon.sf.net/" xmlns:_5="http://www.pwc.ca/namespace/doctypes/ipc" xmlns:_gte="http://www.arbortext.com/namespace/Styler/GeneratedTextElements" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:_sfe="http://www.arbortext.com/namespace/Styler/StylerFormattingElements" xmlns:_js="java:com.arbortext.epic.internal.js.JavaScript" xmlns:_3="http://www.pwc.ca/namespace/doctypes/migrate" xmlns:_ufe="http://www.arbortext.com/namespace/Styler/UserFormattingElements" version="1.0" exclude-result-prefixes="_ atidlm xml _2 ch saxon _5 xsi _js _3 #default exslt msxsl _dtd _ufe _sfe _gte simg ximg _acl">


<xsl:template match="attach-parts" mode="set-countas" priority="0">
      <xsl:copy>
         <xsl:apply-templates select="@*|node()" mode="set-countas"/>
      </xsl:copy>
   </xsl:template>

<xsl:template match="bs-group" mode="set-countas" priority="0">
      <xsl:copy>
         <xsl:apply-templates select="@*|node()" mode="set-countas"/>
      </xsl:copy>
   </xsl:template>

<xsl:template match="build-spec" mode="set-countas" priority="0">
      <xsl:copy>
         <xsl:apply-templates select="@*|node()" mode="set-countas"/>
      </xsl:copy>
   </xsl:template>

<xsl:template match="chap" mode="set-countas" priority="0">
      <xsl:copy>
         <xsl:apply-templates select="@*|node()" mode="set-countas"/>
      </xsl:copy>
   </xsl:template>

<xsl:template match="dimen" mode="set-countas" priority="0">
      <xsl:copy>
         <xsl:apply-templates select="@*|node()" mode="set-countas"/>
      </xsl:copy>
   </xsl:template>

<xsl:template match="eff-bs" mode="set-countas" priority="0">
      <xsl:copy>
         <xsl:apply-templates select="@*|node()" mode="set-countas"/>
      </xsl:copy>
   </xsl:template>

<xsl:template match="eff-code" mode="set-countas" priority="0">
      <xsl:copy>
         <xsl:apply-templates select="@*|node()" mode="set-countas"/>
      </xsl:copy>
   </xsl:template>

<xsl:template match="eff-letter" mode="set-countas" priority="0">
      <xsl:copy>
         <xsl:apply-templates select="@*|node()" mode="set-countas"/>
      </xsl:copy>
   </xsl:template>

<xsl:template match="eff-model" mode="set-countas" priority="0">
      <xsl:copy>
         <xsl:apply-templates select="@*|node()" mode="set-countas"/>
      </xsl:copy>
   </xsl:template>

<xsl:template match="fignote" mode="set-countas" priority="0">
      <xsl:copy>
         <xsl:apply-templates select="@*|node()" mode="set-countas"/>
      </xsl:copy>
   </xsl:template>

<xsl:template match="figure[descendant::graphic]" mode="set-countas" priority="1">
      <xsl:copy>
         <xsl:apply-templates mode="set-countas" select="@*|node()"/>
      </xsl:copy>
   </xsl:template>

<xsl:template match="figure" mode="set-countas" priority="0">
      <xsl:copy>
         <xsl:apply-templates select="@*|node()" mode="set-countas"/>
      </xsl:copy>
   </xsl:template>

<xsl:template match="graphic" mode="set-countas" priority="0">
      <xsl:copy>
         <xsl:apply-templates mode="set-countas" select="@*|node()"> </xsl:apply-templates>
      </xsl:copy>
   </xsl:template>

<xsl:template match="imp" mode="set-countas" priority="0">
      <xsl:copy>
         <xsl:apply-templates select="@*|node()" mode="set-countas"/>
      </xsl:copy>
   </xsl:template>

<xsl:template match="atidlm:inclusion" mode="set-countas" priority="0">
      <xsl:copy>
         <xsl:apply-templates select="@*|node()" mode="set-countas"/>
      </xsl:copy>
   </xsl:template>

<xsl:template match="inter" mode="set-countas" priority="0">
      <xsl:copy>
         <xsl:apply-templates select="@*|node()" mode="set-countas"/>
      </xsl:copy>
   </xsl:template>

<xsl:template match="ipc-fig" mode="set-countas" priority="0">
      <xsl:copy>
         <xsl:apply-templates select="@*|node()" mode="set-countas"/>
      </xsl:copy>
   </xsl:template>

<xsl:template match="ipc-fig-delete" mode="set-countas" priority="0">
      <xsl:copy>
         <xsl:apply-templates select="@*|node()" mode="set-countas"/>
      </xsl:copy>
   </xsl:template>

<xsl:template match="ipc-fig-reloc" mode="set-countas" priority="0">
      <xsl:copy>
         <xsl:apply-templates select="@*|node()" mode="set-countas"/>
      </xsl:copy>
   </xsl:template>

<xsl:template match="kits" mode="set-countas" priority="0">
      <xsl:copy>
         <xsl:apply-templates select="@*|node()" mode="set-countas"/>
      </xsl:copy>
   </xsl:template>

<xsl:template match="atidlm:linkcontent" mode="set-countas" priority="0">
      <xsl:copy>
         <xsl:apply-templates select="@*|node()" mode="set-countas"/>
      </xsl:copy>
   </xsl:template>

<xsl:template match="lpln" mode="set-countas" priority="0">
      <xsl:copy>
         <xsl:apply-templates select="@*|node()" mode="set-countas"/>
      </xsl:copy>
   </xsl:template>

<xsl:template match="met" mode="set-countas" priority="0">
      <xsl:copy>
         <xsl:apply-templates select="@*|node()" mode="set-countas"/>
      </xsl:copy>
   </xsl:template>

<xsl:template match="atidlm:metadata" mode="set-countas" priority="0">
      <xsl:copy>
         <xsl:apply-templates select="@*|node()" mode="set-countas"/>
      </xsl:copy>
   </xsl:template>

<xsl:template match="misc" mode="set-countas" priority="0">
      <xsl:copy>
         <xsl:apply-templates select="@*|node()" mode="set-countas"/>
      </xsl:copy>
   </xsl:template>

<xsl:template match="name" mode="set-countas" priority="0">
      <xsl:copy>
         <xsl:apply-templates select="@*|node()" mode="set-countas"/>
      </xsl:copy>
   </xsl:template>

<xsl:template match="nomen-col" mode="set-countas" priority="0">
      <xsl:copy>
         <xsl:apply-templates select="@*|node()" mode="set-countas"/>
      </xsl:copy>
   </xsl:template>

<xsl:template match="n-para/note" mode="set-countas" priority="8">
      <xsl:copy>
         <xsl:choose>
            <xsl:when test="(following-sibling::note) or (preceding-sibling::note)">
               <xsl:attribute name="_gte:count-as-id">cnt__note.xcnt</xsl:attribute>
            </xsl:when>
            <xsl:when test="true()"><!--This is the "otherwise" clause, but there may be no when's--><!--We emit this even though we do nothing here to avoid a possible empty xsl:choose--></xsl:when>
         </xsl:choose>
         <xsl:apply-templates select="@*|node()" mode="set-countas"/>
      </xsl:copy>
   </xsl:template>

<xsl:template match="procedure/note" mode="set-countas" priority="7">
      <xsl:copy>
         <xsl:choose>
            <xsl:when test="(following-sibling::note) or (preceding-sibling::note)">
               <xsl:attribute name="_gte:count-as-id">cnt__note.xcnt</xsl:attribute>
            </xsl:when>
            <xsl:when test="true()"><!--This is the "otherwise" clause, but there may be no when's--><!--We emit this even though we do nothing here to avoid a possible empty xsl:choose--></xsl:when>
         </xsl:choose>
         <xsl:apply-templates select="@*|node()" mode="set-countas"/>
      </xsl:copy>
   </xsl:template>

<xsl:template match="fandc/note" mode="set-countas" priority="6">
      <xsl:copy>
         <xsl:apply-templates select="@*|node()" mode="set-countas"/>
      </xsl:copy>
   </xsl:template>

<xsl:template match="spec-assem/note" mode="set-countas" priority="5">
      <xsl:copy>
         <xsl:apply-templates select="@*|node()" mode="set-countas"/>
      </xsl:copy>
   </xsl:template>

<xsl:template match="spring-pressure/note" mode="set-countas" priority="4">
      <xsl:copy>
         <xsl:apply-templates select="@*|node()" mode="set-countas"/>
      </xsl:copy>
   </xsl:template>

<xsl:template match="torque-and-stretch/note" mode="set-countas" priority="3">
      <xsl:copy>
         <xsl:apply-templates select="@*|node()" mode="set-countas"/>
      </xsl:copy>
   </xsl:template>

<xsl:template match="fits-and-clears/note" mode="set-countas" priority="2">
      <xsl:copy>
         <xsl:apply-templates select="@*|node()" mode="set-countas"/>
      </xsl:copy>
   </xsl:template>

<xsl:template match="note[parent::subpara]" mode="set-countas" priority="1">
      <xsl:copy>
         <xsl:choose>
            <xsl:when test="(following-sibling::note) or (preceding-sibling::note)">
               <xsl:attribute name="_gte:count-as-id">cnt__note.xcnt</xsl:attribute>
            </xsl:when>
            <xsl:when test="true()"><!--This is the "otherwise" clause, but there may be no when's--><!--We emit this even though we do nothing here to avoid a possible empty xsl:choose--></xsl:when>
         </xsl:choose>
         <xsl:apply-templates select="@*|node()" mode="set-countas"/>
      </xsl:copy>
   </xsl:template>

<xsl:template match="note" mode="set-countas" priority="0">
      <xsl:copy>
         <xsl:choose>
            <xsl:when test="(following-sibling::note) or (preceding-sibling::note)">
               <xsl:attribute name="_gte:count-as-id">cnt__note.xcnt</xsl:attribute>
            </xsl:when>
            <xsl:when test="true()"><!--This is the "otherwise" clause, but there may be no when's--><!--We emit this even though we do nothing here to avoid a possible empty xsl:choose--></xsl:when>
         </xsl:choose>
         <xsl:apply-templates select="@*|node()" mode="set-countas"/>
      </xsl:copy>
   </xsl:template>

<xsl:template match="optitem" mode="set-countas" priority="0">
      <xsl:copy>
         <xsl:apply-templates select="@*|node()" mode="set-countas"/>
      </xsl:copy>
   </xsl:template>

<xsl:template match="optpn" mode="set-countas" priority="0">
      <xsl:copy>
         <xsl:apply-templates select="@*|node()" mode="set-countas"/>
      </xsl:copy>
   </xsl:template>

<xsl:template match="part-nbr" mode="set-countas" priority="0">
      <xsl:copy>
         <xsl:apply-templates select="@*|node()" mode="set-countas"/>
      </xsl:copy>
   </xsl:template>

<xsl:template match="_ufe:partial-breakdown" mode="set-countas" priority="0">
      <xsl:copy>
         <xsl:apply-templates select="@*|node()" mode="set-countas"/>
      </xsl:copy>
   </xsl:template>

<xsl:template match="parts-list" mode="set-countas" priority="0">
      <xsl:copy>
         <xsl:apply-templates select="@*|node()" mode="set-countas"/>
      </xsl:copy>
   </xsl:template>

<xsl:template match="pd-list" mode="set-countas" priority="0">
      <xsl:copy>
         <xsl:apply-templates select="@*|node()" mode="set-countas"/>
      </xsl:copy>
   </xsl:template>

<xsl:template match="pntype[position()&gt;1]" mode="set-countas" priority="1">
      <xsl:copy>
         <xsl:apply-templates select="@*|node()" mode="set-countas"/>
      </xsl:copy>
   </xsl:template>

<xsl:template match="pntype" mode="set-countas" priority="0">
      <xsl:copy>
         <xsl:apply-templates select="@*|node()" mode="set-countas"/>
      </xsl:copy>
   </xsl:template>

<xsl:template match="pwc-pn" mode="set-countas" priority="0">
      <xsl:copy>
         <xsl:apply-templates select="@*|node()" mode="set-countas"/>
      </xsl:copy>
   </xsl:template>

<xsl:template match="range" mode="set-countas" priority="0">
      <xsl:copy>
         <xsl:apply-templates select="@*|node()" mode="set-countas"/>
      </xsl:copy>
   </xsl:template>

<xsl:template match="atidlm:resourcepair" mode="set-countas" priority="0">
      <xsl:copy>
         <xsl:apply-templates select="@*|node()" mode="set-countas"/>
      </xsl:copy>
   </xsl:template>

<xsl:template match="nomen-col/sb-stat[@type='SPB']" mode="set-countas" priority="3">
      <xsl:copy>
         <xsl:apply-templates mode="set-countas" select="@*|node()"/>
      </xsl:copy>
   </xsl:template>

<xsl:template match="nomen-col/sb-stat" mode="set-countas" priority="2">
      <xsl:copy>
         <xsl:apply-templates mode="set-countas" select="@*|node()"> </xsl:apply-templates>
      </xsl:copy>
   </xsl:template>

<xsl:template match="sb-stat[@type='SPB']" mode="set-countas" priority="1">
      <xsl:copy>
         <xsl:apply-templates mode="set-countas" select="@*|node()"/>
      </xsl:copy>
   </xsl:template>

<xsl:template match="sb-stat" mode="set-countas" priority="0">
      <xsl:copy>
         <xsl:apply-templates mode="set-countas" select="@*|node()"> </xsl:apply-templates>
      </xsl:copy>
   </xsl:template>

<xsl:template match="see" mode="set-countas" priority="0">
      <xsl:copy>
         <xsl:apply-templates select="@*|node()" mode="set-countas"/>
      </xsl:copy>
   </xsl:template>

<xsl:template match="service-bull-list" mode="set-countas" priority="0">
      <xsl:copy>
         <xsl:apply-templates select="@*|node()" mode="set-countas"/>
      </xsl:copy>
   </xsl:template>

<xsl:template match="atidlm:source" mode="set-countas" priority="0">
      <xsl:copy>
         <xsl:apply-templates select="@*|node()" mode="set-countas"/>
      </xsl:copy>
   </xsl:template>

<xsl:template match="spb-item" mode="set-countas" priority="0">
      <xsl:copy>
         <xsl:apply-templates select="@*|node()" mode="set-countas"/>
      </xsl:copy>
   </xsl:template>

<xsl:template match="spb-list" mode="set-countas" priority="0">
      <xsl:copy>
         <xsl:apply-templates select="@*|node()" mode="set-countas"/>
      </xsl:copy>
   </xsl:template>

<xsl:template match="numlist/step" mode="set-countas" priority="3">
      <xsl:copy>
         <xsl:apply-templates select="@*|node()" mode="set-countas"/>
      </xsl:copy>
   </xsl:template>

<xsl:template match="procedure//step" mode="set-countas" priority="2">
      <xsl:copy>
         <xsl:attribute name="_gte:count-as-id">cnt__^procedure.cnt</xsl:attribute>
         <xsl:apply-templates mode="set-countas" select="@*|node()"> </xsl:apply-templates>
      </xsl:copy>
   </xsl:template>

<xsl:template match="step[table/@tabstyle='frac']" mode="set-countas" priority="1">
      <xsl:copy>
         <xsl:attribute name="_gte:count-as-id">cnt__^step3.cnt</xsl:attribute>
         <xsl:apply-templates mode="set-countas" select="@*|node()"/>
      </xsl:copy>
   </xsl:template>

<xsl:template match="step" mode="set-countas" priority="0">
      <xsl:copy>
         <xsl:apply-templates select="@*|node()" mode="set-countas"/>
      </xsl:copy>
   </xsl:template>

<xsl:template match="numlist/step2" mode="set-countas" priority="2">
      <xsl:copy>
         <xsl:apply-templates select="@*|node()" mode="set-countas"/>
      </xsl:copy>
   </xsl:template>

<xsl:template match="step2[table/@tabstyle='frac']" mode="set-countas" priority="1">
      <xsl:copy>
         <xsl:attribute name="_gte:count-as-id">cnt__^step3.cnt</xsl:attribute>
         <xsl:apply-templates mode="set-countas" select="@*|node()"/>
      </xsl:copy>
   </xsl:template>

<xsl:template match="step2" mode="set-countas" priority="0">
      <xsl:copy>
         <xsl:attribute name="_gte:count-as-id">cnt__^step.cnt</xsl:attribute>
         <xsl:apply-templates mode="set-countas" select="@*|node()"> </xsl:apply-templates>
      </xsl:copy>
   </xsl:template>

<xsl:template match="numlist/step3" mode="set-countas" priority="2">
      <xsl:copy>
         <xsl:apply-templates select="@*|node()" mode="set-countas"/>
      </xsl:copy>
   </xsl:template>

<xsl:template match="step3[table/@tabstyle='frac']" mode="set-countas" priority="1">
      <xsl:copy>
         <xsl:attribute name="_gte:count-as-id">cnt__^step3.cnt</xsl:attribute>
         <xsl:apply-templates mode="set-countas" select="@*|node()"/>
      </xsl:copy>
   </xsl:template>

<xsl:template match="step3" mode="set-countas" priority="0">
      <xsl:copy>
         <xsl:attribute name="_gte:count-as-id">cnt__^step2.cnt</xsl:attribute>
         <xsl:apply-templates mode="set-countas" select="@*|node()"> </xsl:apply-templates>
      </xsl:copy>
   </xsl:template>

<xsl:template match="numlist/step4" mode="set-countas" priority="2">
      <xsl:copy>
         <xsl:apply-templates select="@*|node()" mode="set-countas"/>
      </xsl:copy>
   </xsl:template>

<xsl:template match="step4[table/@tabstyle='frac']" mode="set-countas" priority="1">
      <xsl:copy>
         <xsl:attribute name="_gte:count-as-id">cnt__^step3.cnt</xsl:attribute>
         <xsl:apply-templates mode="set-countas" select="@*|node()"/>
      </xsl:copy>
   </xsl:template>

<xsl:template match="step4" mode="set-countas" priority="0">
      <xsl:copy>
         <xsl:attribute name="_gte:count-as-id">cnt__^step3.cnt</xsl:attribute>
         <xsl:apply-templates mode="set-countas" select="@*|node()"> </xsl:apply-templates>
      </xsl:copy>
   </xsl:template>

<xsl:template match="numlist/step5" mode="set-countas" priority="2">
      <xsl:copy>
         <xsl:apply-templates select="@*|node()" mode="set-countas"/>
      </xsl:copy>
   </xsl:template>

<xsl:template match="step5[table/@tabstyle='frac']" mode="set-countas" priority="1">
      <xsl:copy>
         <xsl:apply-templates mode="set-countas" select="@*|node()"/>
      </xsl:copy>
   </xsl:template>

<xsl:template match="step5" mode="set-countas" priority="0">
      <xsl:copy>
         <xsl:apply-templates mode="set-countas" select="@*|node()"> </xsl:apply-templates>
      </xsl:copy>
   </xsl:template>

<xsl:template match="subattach" mode="set-countas" priority="0">
      <xsl:copy>
         <xsl:apply-templates select="@*|node()" mode="set-countas"/>
      </xsl:copy>
   </xsl:template>

<xsl:template match="supp-code" mode="set-countas" priority="0">
      <xsl:copy>
         <xsl:apply-templates select="@*|node()" mode="set-countas"/>
      </xsl:copy>
   </xsl:template>

<xsl:template match="supp-pn" mode="set-countas" priority="0">
      <xsl:copy>
         <xsl:apply-templates select="@*|node()" mode="set-countas"/>
      </xsl:copy>
   </xsl:template>

<xsl:template match="atidlm:target" mode="set-countas" priority="0">
      <xsl:copy>
         <xsl:apply-templates select="@*|node()" mode="set-countas"/>
      </xsl:copy>
   </xsl:template>

<xsl:template match="unit-title" mode="set-countas" priority="0">
      <xsl:copy>
         <xsl:apply-templates select="@*|node()" mode="set-countas"/>
      </xsl:copy>
   </xsl:template>

</xsl:stylesheet>
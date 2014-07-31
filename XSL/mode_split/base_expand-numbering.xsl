<?xml version="1.0" encoding="UTF-8"?><xsl:stylesheet xmlns:simg="java:net.sf.docbook.saxon.ImageIntrinsics" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:ximg="xaln://com.nwalsh.xalan.ImageIntrinsics" xmlns="http://www.w3.org/1999/xhtml" xmlns:exslt="http://exslt.org/common" xmlns:_acl="java:com.arbortext.epic.Acl" xmlns:msxsl="urn:schemas-microsoft-com:xslt" xmlns:_="http://www.pwc.ca/namespace/doctypes/emipc" xmlns:_dtd="http://www.arbortext.com/namespace/Styler/UserElements" xmlns:atidlm="http://www.arbortext.com/namespace/atidlm" xmlns:_2="http://www.pwc.ca/namespace/doctypes/jmtosmigrate" xmlns:ch="http://www.arbortext.com/namespace/chunker" xmlns:saxon="http://saxon.sf.net/" xmlns:_5="http://www.pwc.ca/namespace/doctypes/ipc" xmlns:_gte="http://www.arbortext.com/namespace/Styler/GeneratedTextElements" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:_sfe="http://www.arbortext.com/namespace/Styler/StylerFormattingElements" xmlns:_js="java:com.arbortext.epic.internal.js.JavaScript" xmlns:_3="http://www.pwc.ca/namespace/doctypes/migrate" xmlns:_ufe="http://www.arbortext.com/namespace/Styler/UserFormattingElements" version="1.0" exclude-result-prefixes="_ atidlm xml _2 ch saxon _5 xsi _js _3 #default exslt msxsl _dtd _ufe _sfe _gte simg ximg _acl">


<xsl:template match="_gte:styler_numbering" mode="expand-numbering">
      <xsl:param name="do-qmark">
         <xsl:choose>
            <xsl:when test="@do-qmark">
               <xsl:value-of select="@do-qmark"/>
            </xsl:when>
            <xsl:otherwise>yes</xsl:otherwise>
         </xsl:choose>
      </xsl:param>
      <xsl:variable name="gte_id" select="@gte_id"/>
      <xsl:apply-templates mode="styler_numbering" select="//*[@_gte:id=$gte_id][not(self::_gte:FootnoteBody[not(self::*[not(ancestor::_sfe:BeforeOrAfterText)])])]">
         <xsl:with-param name="do-qmark" select="$do-qmark"/>
      </xsl:apply-templates>
   </xsl:template>

</xsl:stylesheet>
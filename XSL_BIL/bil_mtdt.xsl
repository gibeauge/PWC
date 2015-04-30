<?xml version="1.0" encoding="UTF-8"?>

<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
				xmlns:xs="http://www.w3.org/2001/XMLSchema"
                version="2.0">

	<xsl:output method="xml" indent="yes"/>

	<xsl:param name="output-dir"/>
	
	<xsl:variable name="g-date">
		<xsl:variable name="g-pwc-date" select="/Metadatas/OriginalIssueDate" />
		<xsl:value-of select="concat(substring($g-pwc-date,1,4) , '-' , substring($g-pwc-date,5,2) , '-' , substring($g-pwc-date,7,2))"/>
	</xsl:variable> 

	<xsl:template match="/">
		<xsl:apply-templates/>
	</xsl:template>

	<xsl:template match="Metadatas">
		<div id="banner">
			<img src="images/pwcbanner.jpg" id="banner_img"/>
			<div class="metadata">
				<div class="print_header">
					PRATT &amp; WHITNEY CANADA
				</div>
				<xsl:apply-templates select="Title"/><br />
				MODEL(S) <xsl:value-of select="upper-case(EngineModels)" /><br />
				<div class="manual-pt-no">Manual Part No. <xsl:apply-templates select="PartNo" />, Revision No. <xsl:apply-templates select="RevisionNo"/>, Dated <xsl:value-of select="format-date(xs:date($g-date),'[MN,*-3] [D01]/[Y0001]', 'en', (), ())"/></div>
			</div>
		</div>
	</xsl:template>

	<xsl:template match="*">
		<xsl:copy-of select="text()" />
	</xsl:template>

</xsl:stylesheet>

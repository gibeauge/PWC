<?xml version="1.0" encoding="UTF-8" standalone="yes"?>
<!--Copyright Arbortext, Inc., 1999-2003-->
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns="http://www.w3.org/1999/xhtml"
	version="1.0">
	<xsl:output encoding="UTF-8" method="xhtml"
		omit-xml-declaration="yes" indent="yes"
		doctype-public="-//W3C//DTD XHTML 1.0 Transitional//EN"
		doctype-system="http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd" />
	<xsl:param name="templatePath" select="''" />
	<xsl:param name="homeString" select="'Home'" />
	<xsl:param name="homeHref" select="'index.jspx'" />
	<xsl:param name="errorTitle" select="'Error in Page'" />
	<xsl:param name="errorHeader"
		select="'There is an error in the page you requested.'" />
	<xsl:param name="errorStatus" select="'Error Code: '" />
	<xsl:param name="errorStackTrace" select="'StackTrace: '" />
	<xsl:template match="/XErrorData">
		<html>
			<head>
				<title>
					<xsl:value-of select="$errorTitle" />
				</title>

				<link rel="Stylesheet" type="text/css" media="all"
					href="{$templatePath}css/dmc.css">
				</link>

			</head>
			<body>
				<div id="error">
					<h1>
						<xsl:value-of select="$errorHeader" />
					</h1>
					<div id="errorCode">
						<p>
							<xsl:value-of select="$errorStatus" />
							<xsl:text></xsl:text>
							<xsl:value-of select="@statusCode" />
						</p>
					</div>
					<xsl:apply-templates />
				</div>
			</body>
		</html>
	</xsl:template>

	<xsl:template match="XThrowable">
		<p>
			<xsl:value-of select="@message" />
		</p>
		<div id="throwable">
			<p>
				<xsl:value-of select="$errorStackTrace" />
			</p>
			<ul>
				<xsl:apply-templates select="XStackTraceElement" />
			</ul>
		</div>
	</xsl:template>

	<xsl:template match="XStackTraceElement">
		<li>
			<xsl:value-of select="@fileName" />
		</li>
		<p>
			<xsl:value-of select="@className" />
			<xsl:text>:</xsl:text>
			<xsl:value-of select="@methodName" />
			<xsl:text>:</xsl:text>
			<xsl:value-of select="@lineNumber" />
		</p>

	</xsl:template>

</xsl:stylesheet>
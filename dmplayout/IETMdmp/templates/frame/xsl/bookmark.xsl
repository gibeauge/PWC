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
	<xsl:param name="url" select="''" />
	<xsl:template match="//Bookmarks">
	    <xsl:variable name="mUrl">
	    	<xsl:choose>
	    		<xsl:when test="contains($url, '#')">
	    			<xsl:value-of select="substring-before($url, '#')"/>
	    		</xsl:when>
	    		<xsl:otherwise>
	    			<xsl:value-of select="$url"/>
	    		</xsl:otherwise>
	    	</xsl:choose>
	    </xsl:variable>
		<xsl:variable name="loadPath">
			<xsl:call-template name="do-replace">
						<xsl:with-param name="text"
							select="$mUrl" />
						<xsl:with-param name="replace"
							select='"&apos;"' />
						<xsl:with-param name="by" select='"\&apos;"' />
			</xsl:call-template>
		</xsl:variable>
		<html>
		<head>
				<link rel="Stylesheet" type="text/css" media="all"
					href="{$templatePath}css/dmc.css">
				</link>		
				<script language="JavaScript">
					<![CDATA[
						var loaded = false;						
				]]>
				</script>				
				<script language="JavaScript"
					src="{$templatePath}javascript/utils.js">
					<![CDATA[
					// leave some space, so that the serializer won't collapse element
					// which could cause browser to mis-behave
				]]>
				</script>
				<script language="JavaScript"
					src="{$templatePath}javascript/tree.js">
					<![CDATA[
					// leave some space, so that the serializer won't collapse element
					// which could cause browser to mis-behave
				]]>
				</script>
				<script language="JavaScript"
					src="{$templatePath}javascript/toolbar.js">
					<![CDATA[
					// leave some space, so that the serializer won't collapse element
					// which could cause browser to mis-behave
				]]>
				</script>				
				<script>
					//
					<![CDATA[
						bookmark_img = new Image();
						bookmark_img.src = "images"+"/comment_disabled.gif";
						bookmark_annotation_img = new Image();
						bookmark_annotation_img.src = "images"+"/comment.gif";
					//]]>
				</script>
				<base target="content" />
			</head>
			<body onload="loaded=true;showPath(window, '{$loadPath}', true, false)">
				<div id="bookmark">
					<ul class="expanded">
						<xsl:for-each select="Bookmark">
							<xsl:call-template name="matchBookmark" />
						</xsl:for-each>
					</ul>
				</div>
			</body>
		</html>
	</xsl:template>
	<xsl:template name="matchBookmark">
		<xsl:choose>
			<xsl:when test="Annotation[.!='']">
				<li class="annotation">
					<xsl:call-template name="listBookmark" />
				</li>
			</xsl:when>
			<xsl:otherwise>
				<li class="bookmark">
					<xsl:call-template name="listBookmark" />
				</li>
			</xsl:otherwise>
		</xsl:choose>
	</xsl:template>

	<xsl:template name="listBookmark">
		<a href="{@path}" class="{@path}" onclick="setLastClickedElement(event, 'tabToolbarFrame')">
			<xsl:value-of select="Title/text()" />
		</a>
	</xsl:template>
	<xsl:template name="do-replace">
		<xsl:param name="text" />
		<xsl:param name="replace" />
		<xsl:param name="by" />
		<xsl:choose>
			<xsl:when test="contains($text, $replace)">
				<xsl:value-of
					select="substring-before($text, $replace)" />
				<xsl:value-of select="$by" />
				<xsl:call-template name="do-replace">
					<xsl:with-param name="text"
						select="substring-after($text, $replace)" />
					<xsl:with-param name="replace" select="$replace" />
					<xsl:with-param name="by" select="$by" />
				</xsl:call-template>
			</xsl:when>
			<xsl:otherwise>
				<xsl:value-of select="$text" />
			</xsl:otherwise>
		</xsl:choose>
	</xsl:template>
</xsl:stylesheet>
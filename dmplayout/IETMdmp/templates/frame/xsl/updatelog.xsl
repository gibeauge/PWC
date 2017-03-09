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
	<xsl:param name="logTitle" select="'Update Log'" />
	<xsl:param name="topicStatus" select="'Topics Information'" />
	<xsl:param name="newTopics" select="'New Topics'" />
	<xsl:param name="updatedTopics" select="'Updated Topics'" />
	<xsl:param name="obsoleteTopics" select="'Obsolete Topics'" />
	<xsl:param name="fileStatus" select="'Files Information'" />
	<xsl:param name="newFiles" select="'New Files'" />
	<xsl:param name="updatedFiles" select="'Updated Files'" />
	<xsl:param name="obsoleteFiles" select="'Obsolete Files'" />
	<xsl:param name="showLinks" select="'false'"/>


					
	<xsl:template match="/UpdateLog">
		<html>
			<head>
				<link rel="Stylesheet" type="text/css"
					href="{$templatePath}css/dmc.css">
					<!--  -->
				</link>
				<base target="content" />
				<title>
					<xsl:value-of select="concat($logTitle, ': ', @timestamp)" />
				</title>
			</head>
			<body id="updatelog">
				<xsl:apply-templates />
			</body>
		</html>
	</xsl:template>

	<xsl:template match="Topics">
		<h3><xsl:value-of select="$topicStatus"/></h3>
		<xsl:apply-templates />
	</xsl:template>

	<xsl:template match="Files">
		<h3><xsl:value-of select="$fileStatus"/></h3>
		<xsl:apply-templates />
	</xsl:template>
	
	<xsl:template match="Topics/New">
		<h4><xsl:value-of select="$newTopics"/></h4>
		<ul class="new">
			<xsl:apply-templates />
		</ul>
	</xsl:template>
	
	<xsl:template match="Topics/Updated">
		<h4><xsl:value-of select="$updatedTopics"/></h4>
		<ul class="updated">
			<xsl:apply-templates />
		</ul>
	</xsl:template>
	
	<xsl:template match="Topics/Obsolete">
		<h4><xsl:value-of select="$obsoleteTopics"/></h4>
		<ul class="obsolete">
			<xsl:apply-templates />
		</ul>
	</xsl:template>

	<xsl:template match="Files/New">
		<h4><xsl:value-of select="$newFiles"/></h4>
		<ul class="new">
			<xsl:apply-templates />
		</ul>
	</xsl:template>
	
	<xsl:template match="Files/Updated">
		<h4><xsl:value-of select="$updatedFiles"/></h4>
		<ul class="updated">
			<xsl:apply-templates />
		</ul>
	</xsl:template>
	
	<xsl:template match="Files/Obsolete">
		<h4><xsl:value-of select="$obsoleteFiles"/></h4>
		<ul class="obsolete">
			<xsl:apply-templates />
		</ul>
	</xsl:template>
	
	<xsl:template match="Topic">
		<li class="topic">
			<xsl:choose>			
				<xsl:when test="@hidden='true'">
					<span class="hidden">
						<xsl:value-of select="@label" />
					</span>
				</xsl:when>
				<xsl:otherwise>
					<span>
						<xsl:value-of select="@label" />
					</span>				
				</xsl:otherwise>				
			</xsl:choose>
		</li>
	</xsl:template>

	<xsl:template match="File">
		<li class="topic">
			<span>
				<xsl:value-of select="@path" />
			</span>
			<!-- 
			<span>
				<xsl:value-of select="@path" />
			</span>  
			-->
		</li>
	</xsl:template>

</xsl:stylesheet>
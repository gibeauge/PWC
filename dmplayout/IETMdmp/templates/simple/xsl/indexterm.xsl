<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
	version="1.0">
	<xsl:output encoding="UTF-8" method="xhtml"
		omit-xml-declaration="yes" indent="yes"
		doctype-public="-//W3C//DTD XHTML 1.0 Transitional//EN"
		doctype-system="http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd" />
	<xsl:param name="templatePath" select="''" />
	<xsl:param name="homeString" select="'Home'" />
	<xsl:param name="homeHref" select="'index.jspx'" />
	<xsl:param name="tocString" select="'Table of Contents'" />
	<xsl:param name="tocHref" select="''" />
	<xsl:param name="searchString" select="'Search'" />
	<xsl:param name="searchHref" select="''" />
	<xsl:param name="configString" select="'Configuration'" />
	<xsl:param name="configHref" select="''" />
	<xsl:param name="indextermString" select="'Index Terms'" />
	<xsl:param name="indextermHref" select="''" />
	<xsl:param name="searchTipsString" select="'Search Tips'" />
	<xsl:param name="searchTipsHref" select="''" />	
	<xsl:param name="links" select="'Links'" />




	<xsl:template match="/IndexTerm">
		<html>
			<head>
				<title>
					<xsl:value-of select="$indextermString" />
				</title>
				<link rel="Stylesheet" type="text/css" media="all"
					href="{$templatePath}css/dmc.css">
				</link>

			</head>
			<body>
				<div id="header"></div>
				<div id="tools">
					<h1>
						<xsl:value-of select="$links" />
					</h1>
					<ul>
						<li>
							<a href="{$homeHref}">
								<xsl:value-of select="$homeString" />
							</a>
						</li>
						<li>
							<a href="{$tocHref}">
								<xsl:value-of select="$tocString" />
							</a>
						</li>
						<li>
							<a href="{$searchHref}">
								<xsl:value-of select="$searchString" />
							</a>
						</li>
						<li>
							<a href="{$searchTipsHref}">
								<xsl:value-of
									select="$searchTipsString" />
							</a>
						</li>						
						<li>
							<xsl:value-of select="$indextermString" />
						</li>
						<li>
							<a href="{$configHref}">
								<xsl:value-of select="$configString" />
							</a>
						</li>
					</ul>
				</div>
				<div id="indexterm">
					<h1>
						<xsl:value-of select="$indextermString" />
					</h1>
					<ul class="index_root">
						<xsl:for-each select="Bucket">
							<xsl:call-template name="matchBucket" />
						</xsl:for-each>
					</ul>
				</div>
				<div id="footer"></div>
			</body>
		</html>
	</xsl:template>

	<xsl:template name="matchBucket">
		<xsl:variable name="id" select="@id" />
		<xsl:if test="count(Index) &gt; 0">
			<li class="bucket">
				<xsl:call-template name="listBucket" />
			</li>
		</xsl:if>
	</xsl:template>

	<xsl:template name="matchIndex">
		<xsl:variable name="id" select="@id" />
		<xsl:variable name="filetype">
			<xsl:choose>
				<xsl:when test="count(Index)=0">
					<xsl:value-of select="'FILE'" />
				</xsl:when>
				<xsl:otherwise>
					<xsl:value-of select="'FOLDER'" />
				</xsl:otherwise>
			</xsl:choose>
		</xsl:variable>
		<xsl:choose>
			<xsl:when test="$filetype = 'FOLDER'">
				<li class="folder">
					<xsl:call-template name="listIndex" />
				</li>
			</xsl:when>
			<xsl:otherwise>
				<li class="item">
					<xsl:call-template name="listIndex" />
				</li>
			</xsl:otherwise>
		</xsl:choose>
	</xsl:template>

	<xsl:template name="listBucket">
		<span class="index_bucket">
			<xsl:value-of select="@name" />
		</span>
		<ul class="primary_index">
			<xsl:for-each select="Index">
				<xsl:call-template name="matchIndex" />
			</xsl:for-each>
		</ul>
	</xsl:template>

	<xsl:template name="listIndex">
		<xsl:variable name="path" select="@path" />
		<xsl:variable name="filetype">
			<xsl:choose>
				<xsl:when test="count(Index)=0">
					<xsl:value-of select="'FILE'" />
				</xsl:when>
				<xsl:otherwise>
					<xsl:value-of select="'FOLDER'" />
				</xsl:otherwise>
			</xsl:choose>
		</xsl:variable>
		<xsl:choose>
			<xsl:when test="$filetype='FOLDER'">
				<xsl:value-of select="@value" />
				<ul class="folder">
					<xsl:for-each select="Index">
						<xsl:call-template name="matchIndex" />
					</xsl:for-each>
				</ul>
			</xsl:when>
			<xsl:when test="$filetype='FILE'">
				<xsl:call-template name="showListItem" />
			</xsl:when>
		</xsl:choose>
	</xsl:template>

	<xsl:template name="showListItem">
		<xsl:choose>
			<xsl:when test="count(Topic)=0">
					<span class="idxterm">
						<xsl:choose>
							<xsl:when test="@alias">
								<xsl:value-of select="@alias" />
							</xsl:when>
							<xsl:otherwise>
								<xsl:value-of select="@value" />
							</xsl:otherwise>
						</xsl:choose>
					</span>
			</xsl:when>
			<xsl:when test="count(Topic)=1">
				<a href="{Topic[1]/@path}" class="{Topic[1]/@path}">
					<xsl:choose>
						<xsl:when test="@alias">
							<xsl:value-of select="@alias" />
						</xsl:when>
						<xsl:otherwise>
							<xsl:value-of select="@value" />
						</xsl:otherwise>
					</xsl:choose>
				</a>
			</xsl:when>
			<xsl:otherwise>
					<div>
						<span>
						<xsl:choose>
							<xsl:when test="@alias">
								<xsl:value-of select="@alias" />
							</xsl:when>
							<xsl:otherwise>
								<xsl:value-of select="@value" />
							</xsl:otherwise>
						</xsl:choose>
						</span>
					<ul class="folder">
						<xsl:for-each select="Topic">
							<li class="item" profile="{@permission}">
								<a>
									<xsl:attribute name="href">
						<xsl:value-of select="@path" />
					</xsl:attribute>
									<xsl:attribute name="class">
						<xsl:value-of select="@path" />
					</xsl:attribute>
									<xsl:if
										test="@permission">
										<xsl:attribute name="profile">
							<xsl:value-of select="@permission" />
						</xsl:attribute>
									</xsl:if>
									<i>
										<xsl:value-of select="@title" />
									</i>
								</a>
							</li>
						</xsl:for-each>
					</ul>
				</div>
			</xsl:otherwise>
		</xsl:choose>
	</xsl:template>

</xsl:stylesheet>
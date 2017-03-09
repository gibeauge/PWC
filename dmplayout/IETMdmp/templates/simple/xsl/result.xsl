<?xml version="1.0" encoding="UTF-8" standalone="yes"?>
<!--Copyright Arbortext, Inc., 1999-2003-->
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
	<xsl:param name="indextermString" select="'Index Terms'" />
	<xsl:param name="indextermHref" select="''" />	
	<xsl:param name="configString" select="'Configuration'" />
	<xsl:param name="configHref" select="''" />
	<xsl:param name="searchTipsString" select="'Search Tips'" />
	<xsl:param name="searchTipsHref" select="''" />	
	<xsl:param name="noResultTitle" select="'No Results Found'" />
	<xsl:param name="displayResultTitle" select="'{0}-{1} of total {2} search results'" />	
	<xsl:param name="title" select="'Search Results'" />
	<xsl:param name="displayHits"
		select="number(/SearchResult/@displayHits)" />
	<xsl:param name="totalHits"
		select="number(/SearchResult/@totalHits)" />
	<xsl:param name="startRecord"
		select="number(/SearchResult/@startPage)" />
	<xsl:param name="links" select="'Links'" />
	<xsl:param name="url" select="''" />	
	<xsl:param name="addSessionId" select="'false'" />
	
	<xsl:template match="/SearchResult">
		<xsl:variable name="displayTitle">
			<xsl:call-template name="do-replace">
					<xsl:with-param name="text">
						<xsl:call-template name="do-replace">
					  	    <xsl:with-param name="text">
					  	    	<xsl:call-template name="do-replace">
					  	    		<xsl:with-param name="text" select="$displayResultTitle"/>
									<xsl:with-param name="replace" select="'{2}'" />
									<xsl:with-param name="by" select="$totalHits" />	
								</xsl:call-template>		
							</xsl:with-param>			  	    					  	    
							<xsl:with-param name="replace" select="'{1}'" />
							<xsl:with-param name="by" select="$startRecord + count(Record)" />						
						</xsl:call-template>
					</xsl:with-param>	
					<xsl:with-param name="replace" select="'{0}'" />
					<xsl:with-param name="by" select="$startRecord + 1" />
			</xsl:call-template>		
		</xsl:variable>	
		<html>
			<head>
				<title>
					<xsl:value-of select="$title" />
				</title>
				<link rel="Stylesheet" type="text/css" media="all" href="{$templatePath}css/dmc.css"></link>
			</head>
			<body>
				<div id="header"></div>
				<div id="tools">
					<h1><xsl:value-of select="$links"/></h1>
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
							<a href="{$indextermHref}">
								<xsl:value-of select="$indextermString" />
							</a>
						</li>												
						<li>
							<a href="{$configHref}">
								<xsl:value-of select="$configString" />
							</a>
						</li>
					</ul>
				</div>
				<xsl:choose>
					<xsl:when test="$totalHits > 0">
						<div id="searchResults">
							<h1><xsl:value-of select="$displayTitle" /></h1>
							<ol>
								<xsl:attribute name="start">
									<xsl:value-of
										select="$startRecord + 1" />
								</xsl:attribute>
								<xsl:for-each select="Record">
									<xsl:call-template
										name="matchRecord" />
								</xsl:for-each>
							</ol>
						</div>
						<xsl:call-template name="searchNavigation" />
					</xsl:when>
					<xsl:otherwise>
						<div id="searchResults">
							<h1><xsl:value-of select="$noResultTitle"/></h1>
						</div>
					</xsl:otherwise>
				</xsl:choose>
				<div id="footer"></div>
			</body>
		</html>
	</xsl:template>
	<xsl:template name="matchRecord">
		<xsl:variable name="path" select="@path" />
		<xsl:variable name="title" select="Title" />
		<xsl:variable name="qid" select="//@queryId" />
		<xsl:variable name="sid" select="//@sessionId" />
		<xsl:variable name="qstr">
			<xsl:choose>
				<xsl:when test="$sid and 'true' = $addSessionId">
					<xsl:choose>
						<xsl:when test="@mimetype = 'application/pdf'"> 
							<xsl:value-of select='concat($path, ";jsessionid=", $sid, "#page=", @startPage, "&amp;view=FitH")'/>
						</xsl:when>
						<xsl:otherwise>
							<xsl:value-of select='concat($path, ";jsessionid=", $sid, "?queryId=", $qid)'/>				
						</xsl:otherwise>
					</xsl:choose>											
				</xsl:when>
				<xsl:otherwise>
					<xsl:choose>
						<xsl:when test="@mimetype = 'application/pdf'">
							<xsl:value-of select='concat($path, "#page=", @startPage, "&amp;view=FitH")'/>
						</xsl:when>
						<xsl:otherwise>
							<xsl:value-of select='concat($path, "?queryId=", $qid)'/>				
						</xsl:otherwise>
					</xsl:choose>					
				</xsl:otherwise>			
			</xsl:choose>
		</xsl:variable>		
			
		<li>
			<a href="{$qstr}">
				<xsl:choose>
					<xsl:when test="$title">
						<xsl:apply-templates select="$title" />
					</xsl:when>
					<xsl:otherwise>
						<xsl:apply-templates select="$path" />
					</xsl:otherwise>
				</xsl:choose>
			</a>
			<xsl:if test="Description">
				<p>
					<xsl:apply-templates select="Description" />
				</p>
			</xsl:if>
		</li>
	</xsl:template>
	
	<xsl:template match="term">
		<span><xsl:value-of select="text()" /></span>
	</xsl:template>
	
	<xsl:template name="searchNavigation">
		<xsl:param name="firstPage" select="number('1')" />
		<xsl:param name="lastPage"
			select="ceiling($totalHits div $displayHits)" />
		<xsl:param name="currentPage"
			select="($startRecord div $displayHits) + 1" />
		<div id="searchNavigation">
			<xsl:choose>
				<xsl:when
					test="($firstPage = $currentPage) and ($currentPage = $lastPage)">
					<ul>
						<li>First</li>
						<li>Previous</li>
						<li>Next</li>
						<li>Last</li>
					</ul>
				</xsl:when>
				<xsl:when test="($firstPage = $currentPage)">
					<ul>
						<li>First</li>
						<li>Previous</li>
						<li>
							<a>
								<xsl:attribute name="href">
									<xsl:call-template
										name="computeResultHref">
										<xsl:with-param name="page"
											select="$currentPage + 1" />
									</xsl:call-template>
								</xsl:attribute>
								Next
							</a>
						</li>
						<li>
							<a>
								<xsl:attribute name="href">
									<xsl:call-template
										name="computeResultHref">
										<xsl:with-param name="page"
											select="$lastPage" />
									</xsl:call-template>
								</xsl:attribute>
								Last
							</a>
						</li>
					</ul>
				</xsl:when>
				<xsl:when test="($currentPage = $lastPage)">
					<ul>
						<li>
							<a>
								<xsl:attribute name="href">
									<xsl:call-template
										name="computeResultHref">
										<xsl:with-param name="page"
											select="$firstPage" />
									</xsl:call-template>
								</xsl:attribute>
								First
							</a>
						</li>
						<li>
							<a>
								<xsl:attribute name="href">
									<xsl:call-template
										name="computeResultHref">
										<xsl:with-param name="page"
											select="$currentPage - 1" />
									</xsl:call-template>
								</xsl:attribute>
								Previous
							</a>
						</li>
						<li>Next</li>
						<li>Last</li>
					</ul>
				</xsl:when>
				<xsl:otherwise>
					<ul>
						<li>
							<a>
								<xsl:attribute name="href">
									<xsl:call-template
										name="computeResultHref">
										<xsl:with-param name="page"
											select="$firstPage" />
									</xsl:call-template>
								</xsl:attribute>
								First
							</a>
						</li>
						<li>
							<a>
								<xsl:attribute name="href">
									<xsl:call-template
										name="computeResultHref">
										<xsl:with-param name="page"
											select="$currentPage - 1" />
									</xsl:call-template>
								</xsl:attribute>
								Previous
							</a>
						</li>
						<li>
							<a>
								<xsl:attribute name="href">
									<xsl:call-template
										name="computeResultHref">
										<xsl:with-param name="page"
											select="$currentPage + 1" />
									</xsl:call-template>
								</xsl:attribute>
								Next
							</a>
						</li>
						<li>
							<a>
								<xsl:attribute name="href">
									<xsl:call-template
										name="computeResultHref">
										<xsl:with-param name="page"
											select="$lastPage" />
									</xsl:call-template>
								</xsl:attribute>
								Last
							</a>
						</li>
					</ul>
				</xsl:otherwise>
			</xsl:choose>
		</div>
	</xsl:template>
	<xsl:template name="computeResultHref">
		<xsl:param name="page" select="number('1')" />
		<xsl:value-of select="'index.jspx?task=RESULT'" />
		<xsl:text>&amp;startPage=</xsl:text>
		<xsl:value-of select="($page - 1) * $displayHits" />
		<xsl:text>&amp;length=</xsl:text>
		<xsl:value-of select="$displayHits" />
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
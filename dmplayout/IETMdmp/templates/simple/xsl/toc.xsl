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
	<xsl:param name="searchTipsString" select="'Search Tips'" />
	<xsl:param name="searchTipsHref" select="''" />	
	<xsl:param name="configString" select="'Configuration'" />
	<xsl:param name="configHref" select="''" />
	<xsl:param name="indextermString" select="'Index Terms'" />
	<xsl:param name="indextermHref" select="''" />	
	<xsl:param name="links" select="'Links'" />
	<xsl:param name="excludeFolders" select="''" />
	<xsl:param name="trimFolderName" select="'false'" />
	<xsl:param name="formatLabel" select="'false'"/>
	<xsl:param name="showUpdated" select="'true'"/>
	<xsl:param name="expand" select="'false'"/>
	<xsl:variable name="openImage" select="concat($templatePath, 'images/toc_open.gif')"/>
	<xsl:variable name="closeImage" select="concat($templatePath, 'images/toc_closed.gif')"/>
	<xsl:variable name="topicImage" select="concat($templatePath, 'images/topic.gif')"/>
	<xsl:variable name="pdfImage" select="concat($templatePath, 'images/pdf_doc.gif')"/>
	<xsl:variable name="htmlImage" select="concat($templatePath, 'images/html_doc.gif')"/>
	<xsl:variable name="selected" select="'SELECTED'"/>
	
	<xsl:template match="/Toc">
		<html>
			<head>
				<title><xsl:value-of select="$tocString"/></title>
				<link rel="Stylesheet" type="text/css" 
				href="{$templatePath}css/dmc.css">
					<!--  -->
				</link>	
				<script language="JavaScript">
						var openImage = "<xsl:value-of select="$openImage"/>";
						var closedImage = "<xsl:value-of select="$closeImage"/>";
						var topicImage = "<xsl:value-of select="$topicImage"/>";
						var pdfImage = "<xsl:value-of select="$pdfImage"/>";
						var htmlImage = "<xsl:value-of select="$htmlImage"/>";												
						toc_open_img = new Image();
						toc_open_img.src = openImage;
						toc_closed_img = new Image();
						toc_closed_img.src = closedImage;
						topic_img = new Image();
						topic_img.src = topicImage;
						pdf_img = new Image();
						pdf_img.src = pdfImage;
						html_img = new Image();
						html_img.src = htmlImage;
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
			</head>
			<body onload="openDocById('{$selected}', 'content')">
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
							<xsl:value-of select="$tocString" />
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
				<div id="toc">
					<h1>
						<xsl:value-of select="$tocString" />
					</h1>
					<ul class="expanded">
						<xsl:for-each select="Topic">
							<xsl:call-template name="matchTopic" />
						</xsl:for-each>
					</ul>
				</div>
				<div id="footer"></div>
			</body>
		</html>
	</xsl:template>
	<xsl:template name="matchTopic">
		<xsl:variable name="id" select="@id" />
		<xsl:variable name="filetype" select="@filetype"/>
		<xsl:variable name="openMode">
			<xsl:choose>
				<xsl:when test="$expand='true'">
					<xsl:value-of select="'open'"/>
				</xsl:when>
				<xsl:otherwise>
					<xsl:value-of select="'closed'"/>
				</xsl:otherwise>
			</xsl:choose>
		</xsl:variable>
		<xsl:choose>
			<xsl:when test="$filetype = 'FOLDER'">
				<xsl:choose> 
					<xsl:when test="@hidden='true'">
						<xsl:for-each select="Topic">
							<xsl:call-template name="matchTopic" />
						</xsl:for-each>					
					</xsl:when>
					<!-- no children --> 
					<xsl:when test="not(Topic)"/>
					<!-- all children are hidden or no children at all-->					
					<xsl:when test="not(.//Topic[(not(@hidden) or @hidden='false') and @filetype='FILE'])"/>
					<xsl:when test="not($excludeFolders = '')">
						<xsl:variable name="isExcluded">
							<xsl:call-template name="checkExclusions">
							<xsl:with-param name="string"
								select="@label" />
							<xsl:with-param name="keys"
								select="$excludeFolders" />	
							</xsl:call-template>
						</xsl:variable>
						<xsl:variable name="folderImage">
							<xsl:choose>
								<xsl:when test="$openMode = 'open'">
									<xsl:value-of select="$openImage"/>
								</xsl:when>
								<xsl:otherwise>
									<xsl:value-of select="$closeImage"/>
								</xsl:otherwise>
							</xsl:choose>
						</xsl:variable>
						<xsl:choose>
							<xsl:when test="$isExcluded = 'true'"/>
							<xsl:otherwise>
								<li	class="{$openMode}">
									<img onclick="return toggleOpenClose(event)" src="{$folderImage}"/>
									<xsl:call-template name="listToc" />
								</li>
							</xsl:otherwise>
						</xsl:choose>
						<!--  ignore -->
					</xsl:when>
					<xsl:otherwise>
						<li	class="{$openMode}">
							<img onclick="return toggleOpenClose(event)" src="{$closeImage}"/>
							<xsl:call-template name="listToc" />
						</li>
					</xsl:otherwise>
				</xsl:choose>
			</xsl:when>
			<xsl:otherwise>
				<xsl:if test="not(@hidden='true')">
					<xsl:choose>
						<xsl:when test="@show='true'">
							<li class="item" id="{$selected}">
								<xsl:choose>
									<xsl:when test="@mimetype='application/pdf'">
										<img src="{$pdfImage}"/>
									</xsl:when>
									<xsl:when test="@mimetype='text/html'">
										<img src="{$htmlImage}"/>
									</xsl:when>
									<xsl:when test="@mimetype">
										<img src="{$topicImage}"/>
									</xsl:when>
									<xsl:otherwise/>
								</xsl:choose>
								<xsl:call-template name="listToc" />
							</li>
						</xsl:when>
						<xsl:otherwise>
							<li class="item">
								<xsl:choose>
									<xsl:when test="@mimetype='application/pdf'">
										<img src="{$pdfImage}"/>
									</xsl:when>
									<xsl:when test="@mimetype='text/html'">
										<img src="{$htmlImage}"/>
									</xsl:when>
									<xsl:otherwise>
							   			<img src="{$topicImage}"/>		
									</xsl:otherwise>
								</xsl:choose>
								<xsl:call-template name="listToc" />
							</li>
						</xsl:otherwise>
					</xsl:choose>
				</xsl:if>
			</xsl:otherwise>
		</xsl:choose>
	</xsl:template>
	<xsl:template name="listToc">
		<xsl:variable name="path" select="@path" />
		<xsl:variable name="filetype">
			<xsl:choose>
				<xsl:when test="@filetype='FILE'">
					<xsl:value-of select="'FILE'"/>
				</xsl:when>
				<xsl:when test=".//Topic[not(@hidden) or @hidden='false']">
					<xsl:value-of select="'FOLDER'"/>
				</xsl:when>
				<xsl:otherwise>
					<xsl:value-of select="'FILE'"/>
				</xsl:otherwise>
			</xsl:choose>
		</xsl:variable>
		<xsl:variable name="folderLabel">
			<xsl:if test="$filetype='FOLDER'">


				<xsl:choose>
					<xsl:when test="$formatLabel='true'">
						<xsl:call-template name="formatFolderLabel">
							<xsl:with-param name="string"
								select="@label" />
						</xsl:call-template>
					</xsl:when>
					<xsl:otherwise>
						<xsl:value-of select="@label" />
					</xsl:otherwise>
				</xsl:choose>
			</xsl:if>
		</xsl:variable>

		<xsl:choose>
			<xsl:when test="$filetype='FOLDER'">		
					<xsl:choose>
						<xsl:when test="@updateState='NEW'">
							<xsl:if test="$showUpdated='true'">
								<span class="newFolder">&#160;</span>
							</xsl:if>
						</xsl:when>
						<xsl:when test="@updateState='UPDATED'">
							<xsl:if  test="$showUpdated='true'">
								<span class="updatedFolder">&#160;</span>
							</xsl:if>
						</xsl:when>
					</xsl:choose>	
					<xsl:choose>
						<xsl:when test="@mimetype">
							<a href="{$path}" title="{$folderLabel}" id="{@id}">
								<xsl:value-of select="$folderLabel" />
							</a>
						</xsl:when>
						<xsl:otherwise>
						<span onclick="return toggleOpenClose(event)" title="{$folderLabel}">
							<xsl:value-of select="$folderLabel" />	
						</span>	
						</xsl:otherwise>
					</xsl:choose>				
				<ul>
					<xsl:for-each select="Topic">
						<xsl:call-template name="matchTopic" />
					</xsl:for-each>
				</ul>
			</xsl:when>
			<xsl:when test="$filetype='FILE'">
				<xsl:choose>
					<xsl:when test="@updateState='NEW'">
						<a href="{$path}" title="{@label}" id="{@id}">
							<xsl:if test="$showUpdated = 'true'"><span class="newFile">&#160;</span></xsl:if><xsl:value-of select="@label" />
						</a>
					</xsl:when>
					<xsl:when test="@updateState='UPDATED'">
						<a href="{$path}" title="{@label}" id="{@id}">
							<xsl:if test="$showUpdated = 'true'"><span class="updatedFile">&#160;</span></xsl:if><xsl:value-of select="@label" />
						</a>
					</xsl:when>
					<xsl:when test="@mimetype or @path">
						<a href="{$path}" title="{@label}" id="{@id}">
							<xsl:value-of select="@label" />
						</a>
					</xsl:when>
					<xsl:otherwise>
					  		<xsl:value-of select="@label" />
					</xsl:otherwise>
				</xsl:choose>	
			</xsl:when>
		</xsl:choose>
	</xsl:template>


	<xsl:template name="formatFolderLabel">
		<xsl:param name="string" />
		<xsl:choose>
			<xsl:when test="(substring-after($string, '/') = '') or ($trimFolderName='false')">
				<xsl:variable name="title">
			    	<xsl:choose>
			    		<xsl:when test="substring($string, string-length($string))='/'">
			    			<xsl:value-of select="substring($string, 0, string-length($string))"/>
			    		</xsl:when>
			    		<xsl:otherwise>
			    			<xsl:value-of select="$string"/>
			    		</xsl:otherwise>
			    	</xsl:choose>
			    </xsl:variable>			
				<xsl:variable name="title2">
					<xsl:call-template name="do-replace">
						<xsl:with-param name="text"
							select="$title" />
						<xsl:with-param name="replace"
							select="'%20'" />
						<xsl:with-param name="by" select="' '" />
					</xsl:call-template>
				</xsl:variable>
				<xsl:value-of>
					<xsl:call-template name="do-replace">
						<xsl:with-param name="text"
							select="$title2" />
						<xsl:with-param name="replace"
							select="'%2F'" />
						<xsl:with-param name="by" select="'/'" />
					</xsl:call-template>
				</xsl:value-of>				
			</xsl:when>
			<xsl:otherwise>
				<xsl:call-template name="formatFolderLabel">
					<xsl:with-param name="string"
						select="substring-after($string, '/')" />
				</xsl:call-template>
			</xsl:otherwise>

		</xsl:choose>
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

	<xsl:template name="checkExclusions">
		<xsl:param name="string" />
		<xsl:param name="keys" />
		<xsl:variable name="temp" select="normalize-space(substring-before($keys, '|'))"/>
		<xsl:variable name="key">
			<xsl:choose>
				<xsl:when test="$temp=''">
					<xsl:value-of select="normalize-space($keys)"/>
				</xsl:when>
				<xsl:otherwise>
		 			<xsl:value-of select="$temp"/>
		 		</xsl:otherwise>
		 	</xsl:choose>
		</xsl:variable>
		<xsl:choose>
			<xsl:when test="$key=''">
				<xsl:value-of select="'false'"/>
			</xsl:when>
			<xsl:when test="contains($string, $key)">
				<xsl:value-of select="'true'"/>
			</xsl:when>
			<xsl:otherwise>
				<xsl:call-template name="checkExclusions">
					<xsl:with-param name="string"
						select="$string" />
					<xsl:with-param name="keys" select="substring-after($keys, '|')" />
				</xsl:call-template>
			</xsl:otherwise>
		</xsl:choose>
	</xsl:template>
</xsl:stylesheet>
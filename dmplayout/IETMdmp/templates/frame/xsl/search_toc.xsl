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
	<xsl:param name="excludeFolders" select="''" />
	<xsl:param name="trimFolderName" select="'false'" />
	<xsl:param name="noResultTitle" select="'No Results Found'" />
	<xsl:param name="displayResultTitle" select="'{0}-{1} of total {2} search results'" />	
	<xsl:param name="title" select="'Search Results'" />
	<xsl:param name="totalHits"
		select="count(//Topic[@filetype='FILE' and not(@hidden='true')])" />
	<xsl:param name="links" select="'Links'" />
	<xsl:param name="addSessionId" select="'false'" />
			
	<xsl:variable name="selected" select="'SELECTED'"/>
	<xsl:variable name="plusImage" select="concat($templatePath, 'images/plus.gif')"/>
	<xsl:variable name="minusImage" select="concat($templatePath, 'images/minus.gif')"/>
	<xsl:variable name="topicImage" select="concat($templatePath, 'images/topic.gif')"/>
	
	<xsl:template match="/Toc">

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
							<xsl:with-param name="by" select="$totalHits" />						
						</xsl:call-template>
					</xsl:with-param>	
					<xsl:with-param name="replace" select="'{0}'" />
					<xsl:with-param name="by" select="1" />
			</xsl:call-template>		
		</xsl:variable>
	
		<html>
			<head>
				<link rel="Stylesheet" type="text/css" media="all"
					href="{$templatePath}css/dmc.css">
					<!--  -->
				</link>			
				<script>
						var openImage = "<xsl:value-of select="$plusImage"/>";
						var closedImage = "<xsl:value-of select="$minusImage"/>";
						var openLinkImage = "<xsl:value-of select="$plusImage"/>";
						var closedLinkImage = "<xsl:value-of select="$minusImage"/>";
						var topicImage = "<xsl:value-of select="$topicImage"/>";

						search_toc_open_img = new Image();
						search_toc_open_img.src = openImage;
						search_toc_closed_img = new Image();
						search_toc_closed_img.src = closedImage;
						search_topic_img = new Image();
						search_topic_img.src = topicImage;		

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
				<base target="content" />
			</head>
			<body>	
				<div id="search_toc">
				<xsl:choose>
					<xsl:when test="$totalHits > 0">
					   <h1><xsl:value-of select="$displayTitle" /></h1>
					   	<ul class="expanded">
							<xsl:for-each select="Topic">
								<xsl:call-template name="matchTopic" />
							</xsl:for-each>
						</ul>
					</xsl:when>
					<xsl:otherwise>
						<h1><xsl:value-of select="$noResultTitle"/></h1>
					</xsl:otherwise>
				</xsl:choose>						

				</div>
				<div id="footer"></div>
			</body>
		</html>
	</xsl:template>
	<xsl:template name="matchTopic">
		<xsl:variable name="id" select="@id" />
		<xsl:variable name="filetype" select="@filetype" />
		<xsl:variable name="filesize" select="count(.//Topic[@filetype='FILE' and not(@hidden='true')])" />
		<xsl:variable name="foldersize" select="count(.//Topic[@filetype='FOLDER'])" />
		<xsl:variable name="folderstyle">
			<xsl:choose>
				<xsl:when test="$foldersize &gt; 0">
					<xsl:value-of select="'open'"/>
				</xsl:when>
				<xsl:otherwise>
					<xsl:value-of select="'closed'"/>				
				</xsl:otherwise>
			</xsl:choose>
		</xsl:variable>
		<xsl:variable name="image">
			<xsl:choose>
				<xsl:when test="$foldersize &gt; 0">
					<xsl:value-of select="$minusImage"/>
				</xsl:when>
				<xsl:otherwise>
					<xsl:value-of select="$plusImage"/>				
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
					<xsl:when test="$filesize = 0"/>
					<xsl:when test="not($excludeFolders = '')">
						<xsl:variable name="isExcluded">
							<xsl:call-template name="checkExclusions">
							<xsl:with-param name="string"
								select="@label" />
							<xsl:with-param name="keys"
								select="$excludeFolders" />	
							</xsl:call-template>
						</xsl:variable>
						<xsl:choose>
							<xsl:when test="$isExcluded = 'true'"/>
							<xsl:otherwise>
								<li onclick="toggleOpenClose(event)"
									class="{$folderstyle}"><img src="{$image}"/>[<xsl:value-of select="$filesize"/>]
									<xsl:call-template name="listToc" />
								</li>
								
							</xsl:otherwise>
						</xsl:choose>
						<!--  ignore -->
					</xsl:when>
					<xsl:otherwise>
						<li onclick="toggleOpenClose(event)"
							class="{$folderstyle}"><img src="{$image}"/>[<xsl:value-of select="$filesize"/>]
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
	   						    <img src="{$topicImage}"/>
								<xsl:call-template name="listToc" />
							</li>
						</xsl:when>
						<xsl:otherwise>
							<li class="item">
  							    <img src="{$topicImage}"/>
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
		<xsl:variable name="filetype" select="@filetype" />
		<xsl:variable name="qid" select="/Toc/@queryId" />
		<xsl:variable name="sid" select="/Toc/@sessionId" />
		
		<xsl:variable name="qstr">
			<xsl:choose>
				<xsl:when test="$sid and 'true' = $addSessionId">
					<xsl:choose>
						<xsl:when test="@mimetype = 'application/pdf'"> <!-- the sole query string ?id=@id is to force browser to reload PDF -->
							<xsl:value-of select='concat($path, ";jsessionid=", $sid, "?startPage=", @startPage, "&amp;endPage=", @endPage, "&amp;queryId=", $qid, "&amp;docId=", @id, "&amp;view=FitH")'/>
						</xsl:when>
						<xsl:otherwise>
							<xsl:value-of select='concat($path, ";jsessionid=", $sid, "?queryId=", $qid)'/>				
						</xsl:otherwise>
					</xsl:choose>											
				</xsl:when>
				<xsl:otherwise>
					<xsl:choose>
						<xsl:when test="@mimetype = 'application/pdf'"> <!-- the sole query string ?id=@id is to force browser to reload PDF -->
							<xsl:value-of select='concat($path, "?startPage=", @startPage, "&amp;endPage=", @endPage, "&amp;queryId=", $qid, "&amp;docId=", @id, "&amp;view=FitH")'/>
						</xsl:when>
						<xsl:otherwise>
							<xsl:value-of select='concat($path, "?queryId=", $qid)'/>				
						</xsl:otherwise>
					</xsl:choose>					
				</xsl:otherwise>			
			</xsl:choose>
		</xsl:variable>	
				
		<xsl:choose>
			<xsl:when test="$filetype='FOLDER'">
				<xsl:call-template name="formatFolderLabel">
					<xsl:with-param name="string"
						select="@label" />
				</xsl:call-template>
				<ul class="expanded">
					<xsl:for-each select="Topic">
						<xsl:call-template name="matchTopic" />
					</xsl:for-each>
				</ul>
			</xsl:when>
			<xsl:when test="$filetype='FILE'">
				<a href="{$qstr}">
					<xsl:value-of select="@label" />
				</a>
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
				<xsl:value-of>
					<xsl:call-template name="do-replace">
						<xsl:with-param name="text"
							select="$title" />
						<xsl:with-param name="replace"
							select="'%20'" />
						<xsl:with-param name="by" select="' '" />
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
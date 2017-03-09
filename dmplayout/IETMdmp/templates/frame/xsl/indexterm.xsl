<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
	xmlns="http://www.w3.org/1999/xhtml" version="1.0">
	<xsl:output encoding="UTF-8" method="xhtml"
		omit-xml-declaration="yes" indent="no"
		doctype-public="-//W3C//DTD XHTML 1.0 Transitional//EN"
		doctype-system="http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd" />
	<xsl:param name="templatePath" select="''" />
	<xsl:param name="showPermission" select="'true'" />

	<xsl:template match="/IndexTerm">
		<html>
			<head>
				<link rel="Stylesheet" type="text/css" media="all"
					href="{$templatePath}css/dmc.css">
				</link>
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
					src="{$templatePath}javascript/indexterm.js">
					<![CDATA[
					// leave some space, so that the serializer won't collapse element
					// which could cause browser to mis-behave					
					]]>
				</script>
				<base target="content" />
			</head>
			<body onload="initIndexTerm()">
				<div id="indexterm">
					<ul class="index_root">
						<xsl:for-each select="Bucket">
							<xsl:call-template name="matchBucket" />
						</xsl:for-each>
					</ul>
				</div>
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
		<xsl:variable name="filetype">
			<xsl:call-template name="getFileType" />
		</xsl:variable>
		<xsl:choose>
			<xsl:when
				test="$filetype = 'FOLDER' or $filetype = 'LINKED_FOLDER'">
				<li>
					<xsl:attribute name="class">
						    	<xsl:text>folder</xsl:text>
						    </xsl:attribute>
					<xsl:if test="@id">
						<xsl:attribute name="id">
						    	<xsl:value-of select="@id" />
						    </xsl:attribute>
					</xsl:if>
					<xsl:if test="@idref">
						<xsl:attribute name="idref">
									<xsl:value-of select="@idref" />
								</xsl:attribute>
					</xsl:if>
					<xsl:if test="@permission">
						<xsl:attribute name="profile">
									<xsl:value-of select="@permission" />
								</xsl:attribute>
					</xsl:if>
					<xsl:call-template name="listIndex" />
				</li>
			</xsl:when>
			<xsl:otherwise>
				<li>
					<xsl:attribute name="class">
				    	<xsl:text>item</xsl:text>
				    </xsl:attribute>
					<xsl:if test="@id">
						<xsl:attribute name="id">
						    	<xsl:value-of select="@id" />
						    </xsl:attribute>
					</xsl:if>
					<xsl:if test="@idref">
						<xsl:attribute name="idref">
									<xsl:value-of select="@idref" />
								</xsl:attribute>
					</xsl:if>
					<xsl:if test="@permission">
						<xsl:attribute name="profile">
									<xsl:value-of select="@permission" />
								</xsl:attribute>
					</xsl:if>
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
		<xsl:variable name="filetype">
			<xsl:call-template name="getFileType" />
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
			<xsl:when test="$filetype='LINKED_FOLDER'">
				<xsl:call-template name="showListItem" />
				<ul class="folder">
					<xsl:for-each select="Index">
						<xsl:call-template name="matchIndex" />
					</xsl:for-each>
				</ul>
			</xsl:when>
			<xsl:when test="$filetype='FILE'">
				<xsl:call-template name="showListItem" />
			</xsl:when>
			<xsl:when test="$filetype='SEE_ALSO'">
				<xsl:call-template name="showListItem" />
			</xsl:when>
		</xsl:choose>
	</xsl:template>


	<xsl:template name="showListItem">
		<xsl:choose>
			<xsl:when test="count(Topic)=0">
				<a href="#_see_also_" id="{@id}"
					ondblclick="findReference('{@idref}')">
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
				</a>
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
				<a href="#_multidx_" ondblclick="showIdx('{@id}')">
					<span class="multidx">
						<xsl:choose>
							<xsl:when test="@alias">
								<xsl:value-of select="@alias" />
							</xsl:when>
							<xsl:otherwise>
								<xsl:value-of select="@value" />
							</xsl:otherwise>
						</xsl:choose>
					</span>
				</a>
				<div class="multidx-hidden" id="{@id}">


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
										test="$showPermission = 'true' and @permission">
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

	<xsl:template name="getFileType">
		<xsl:choose>
			<xsl:when test="count(Topic)=0">
				<xsl:choose>
					<xsl:when test="count(Index)=0">
						<xsl:value-of select="'SEE_ALSO'" />
					</xsl:when>
					<xsl:otherwise>
						<xsl:value-of select="'FOLDER'" />
					</xsl:otherwise>
				</xsl:choose>
			</xsl:when>
			<xsl:when test="count(Index)=0">
				<xsl:value-of select="'FILE'" />
			</xsl:when>
			<xsl:otherwise>
				<xsl:value-of select="'LINKED_FOLDER'" />
			</xsl:otherwise>
		</xsl:choose>
	</xsl:template>


</xsl:stylesheet>
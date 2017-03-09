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
	<xsl:param name="indextermString" select="'Index Terms'" />
	<xsl:param name="indextermHref" select="''" />
	<xsl:param name="configString" select="'Configuration'" />
	<xsl:param name="configHref" select="''" />
	<xsl:param name="resultPagePrefix" select="'result.jspx'" />
	<xsl:param name="displayHits"
		select="number(/SearchResult/@displayHits)" />
	<xsl:param name="totalHits"
		select="number(/SearchResult/@totalHits)" />
	<xsl:param name="startRecord"
		select="number(/SearchResult/@startPage)" />
	<xsl:param name="title" select="'Search Form'" />
	<xsl:param name="all" select="'All Items'" />
	<xsl:param name="action" select="''" />
	<xsl:param name="fields" select="''" />
	<xsl:param name="constraints" select="''" />
	<xsl:param name="fieldOnlyLabel" select="'Search Fields Only'" />
	<xsl:param name="searchFieldLabel" select="'Search only in'" />
	<xsl:param name="searchWordsLabel" select="'Search Words'" />
	<xsl:param name="searchLabel" select="'search'" />
	<xsl:param name="links" select="'Links'" />
	<xsl:key name="constraintName" match="Constraint" use="@name" />
	<xsl:key name="unique-name" match="Value" use="@name"/>
	<xsl:template match="/SearchConfig">
		<html>
			<head>
				<title>
					<xsl:value-of select="$title" />
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
							<xsl:value-of select="$searchString" />
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
				<div id="searchForm">
					<form method="post" name="search" id="search"
						accept-charset="utf-8" action="{$action}"
						enctype="application/x-www-form-urlencoded">
						<h1>
							<xsl:value-of select="$searchWordsLabel" />
						</h1>
						<div class="searchInput">
							<input type="text"
								name="{Keywords/Key[@name='searchWords']/text()}" />
							<input type="hidden"
								name="{Keywords/Key[@name='defaultField']/text()}"
								value="{Fields/@defaultFieldName}" />
							<input type="submit" name="search"
								value="{$searchLabel}" />
						</div>
						<xsl:if test="not($fields = '') and Fields/Type">						
							<xsl:call-template name="processFields">
								<xsl:with-param name="fieldNames"
									select="Keywords/Key[@name='fieldNames']/text()" />
								<xsl:with-param name="fieldNamesLabel"
									select="$searchFieldLabel" />
								<xsl:with-param name="fieldOnly"
									select="Keywords/Key[@name='fieldOnly']/text()" />
								<xsl:with-param name="data"
									select="Fields" />
							</xsl:call-template>
						</xsl:if>
						<xsl:if test="not($constraints = '')">
							<xsl:call-template
								name="processConstraints">
								<xsl:with-param name="data"
									select="Constraints" />
							</xsl:call-template>
						</xsl:if>
					</form>
				</div>
				<div id="footer"></div>
			</body>
		</html>
	</xsl:template>

	<xsl:template name="processFields">
		<xsl:param name="fieldNames" />
		<xsl:param name="fieldNamesLabel" />
		<xsl:param name="fieldOnly" />
		<xsl:param name="data" />
		<xsl:variable name="defaultField"
			select="$data/@defaultFieldName" />
		<div class="searchField">
			<input type="hidden" name="{$fieldOnly}" value="true" />
			<span>
				<xsl:value-of select="$fieldNamesLabel" />
			</span>
			<select name="{$fieldNames}">
				<xsl:for-each select="$data/Type/Field">
					<xsl:choose>
						<xsl:when test="$defaultField = @name">
							<option value="{@name}"
								selected="selected">
								<xsl:value-of select="text()" />
							</option>
						</xsl:when>
						<xsl:otherwise>
							<option value="{@name}">
								<xsl:value-of select="text()" />
							</option>
						</xsl:otherwise>
					</xsl:choose>
				</xsl:for-each>
			</select>
		</div>
	</xsl:template>

	<xsl:template name="processConstraints">
		<xsl:param name="data" />
		<xsl:choose>
			<xsl:when test="$constraints='*'">
				<xsl:call-template name="processAllConstraints">
					<xsl:with-param name="data" select="$data" />
				</xsl:call-template>
			</xsl:when>
			<xsl:otherwise>
				<xsl:call-template name="iterateConstraints">
					<xsl:with-param name="data" select="$data" />
					<xsl:with-param name="_constraints"
						select="$constraints" />
				</xsl:call-template>
			</xsl:otherwise>
		</xsl:choose>
	</xsl:template>


	<xsl:template name="findStringBefore">
		<xsl:param name="string" />
		<xsl:param name="delimiter" />
		<xsl:variable name="_string" select="normalize-space($string)" />
		<xsl:choose>
			<xsl:when test="contains($_string, $delimiter)">
				<xsl:value-of
					select="normalize-space(substring-before($_string, $delimiter))" />
			</xsl:when>
			<xsl:otherwise>
				<xsl:value-of select="$_string" />
			</xsl:otherwise>
		</xsl:choose>
	</xsl:template>

	<xsl:template name="createHiddenField">
		<xsl:param name="constraintName" />
		<xsl:param name="constraintValue" />
		<xsl:variable name="hiddenName">
			<xsl:call-template name="findStringBefore">
				<xsl:with-param name="string" select="$constraintName" />
				<xsl:with-param name="delimiter" select="':'" />
			</xsl:call-template>
		</xsl:variable>
		<xsl:variable name="hiddenValue">
			<xsl:call-template name="findStringBefore">
				<xsl:with-param name="string" select="$constraintValue" />
				<xsl:with-param name="delimiter" select="':'" />
			</xsl:call-template>
		</xsl:variable>


		<input type="hidden" name="{$hiddenName}"
			value="{$hiddenValue}" />
	</xsl:template>

	<xsl:template name="createOptions">
		<xsl:param name="options" />
		<xsl:variable name="value-before">
			<xsl:call-template name="findStringBefore">
				<xsl:with-param name="string" select="$options" />
				<xsl:with-param name="delimiter" select="';'" />
			</xsl:call-template>
		</xsl:variable>

		<xsl:variable name="value-after"
			select="normalize-space(substring-after($options, ';'))" />

		<xsl:variable name="optionValue">
			<xsl:call-template name="findStringBefore">
				<xsl:with-param name="string" select="$value-before" />
				<xsl:with-param name="delimiter" select="':'" />
			</xsl:call-template>
		</xsl:variable>

		<xsl:variable name="optionName">
			<xsl:choose>
				<xsl:when
					test="substring-after($value-before, ':')=''">
					<xsl:value-of select="$optionValue" />
				</xsl:when>
				<xsl:otherwise>
					<xsl:value-of
						select="substring-after($value-before, ':')" />
				</xsl:otherwise>
			</xsl:choose>
		</xsl:variable>
		<option value="{$optionValue}">
			<xsl:value-of select="$optionName" />
		</option>


		<xsl:if test="not($value-after='')">
			<xsl:call-template name="createOptions">
				<xsl:with-param name="options" select="$value-after" />
			</xsl:call-template>

		</xsl:if>

	</xsl:template>

	<xsl:template name="createSpecifiedSelect">
		<xsl:param name="constraintName" />
		<xsl:param name="constraintValue" />
		<xsl:variable name="selectValue">
			<xsl:call-template name="findStringBefore">
				<xsl:with-param name="string" select="$constraintName" />
				<xsl:with-param name="delimiter" select="':'" />
			</xsl:call-template>
		</xsl:variable>
		<xsl:variable name="selectName">
			<xsl:choose>
				<xsl:when
					test="substring-after($constraintName, ':')=''">
					<xsl:value-of select="$selectValue" />
				</xsl:when>
				<xsl:otherwise>
					<xsl:value-of
						select="substring-after($constraintName, ':')" />
				</xsl:otherwise>
			</xsl:choose>
		</xsl:variable>
		<xsl:value-of select="$selectName" />
		<select name="{$selectValue}">
			<xsl:call-template name="createOptions">
				<xsl:with-param name="options"
					select="$constraintValue" />
			</xsl:call-template>
		</select>
	</xsl:template>

	<xsl:template name="createSelect">
		<xsl:param name="constraintName" />
		<xsl:variable name="selectValue">
			<xsl:call-template name="findStringBefore">
				<xsl:with-param name="string" select="$constraintName" />
				<xsl:with-param name="delimiter" select="':'" />
			</xsl:call-template>
		</xsl:variable>
		<xsl:variable name="selectName">
			<xsl:choose>
				<xsl:when
					test="substring-after($constraintName, ':')=''">
					<xsl:value-of select="$selectValue" />
				</xsl:when>
				<xsl:otherwise>
					<xsl:value-of
						select="substring-after($constraintName, ':')" />
				</xsl:otherwise>
			</xsl:choose>
		</xsl:variable>
		<xsl:variable name="constraint"
			select="//Constraint[@name = $selectValue]" />
		<xsl:if test="not($constraint='')">
			<xsl:value-of select="$selectName" />
			<select name="{$selectValue}" style="width: 200px">
				<option value="" selected="selected">All</option>
				<xsl:for-each
					select="//Constraint[@name = $selectValue]/Value">
					<!--  <xsl:sort select="." />  -->
					<xsl:variable name="value"
						select="normalize-space(.)" />
					<option value="{$value}">
						<xsl:choose>
							<xsl:when
								test="string-length($value) &gt; 20">
								<xsl:value-of
									select="concat(substring($value, 0, 20), '...')" />
							</xsl:when>
							<xsl:otherwise>
								<xsl:value-of select="." />
							</xsl:otherwise>
						</xsl:choose>
					</option>
				</xsl:for-each>
			</select>
		</xsl:if>
	</xsl:template>

	<xsl:template name="processSingleConstraint">
		<xsl:param name="constraintInfo" />
		<xsl:variable name="str-before">
			<xsl:call-template name="findStringBefore">
				<xsl:with-param name="string" select="$constraintInfo" />
				<xsl:with-param name="delimiter" select="'{'" />
			</xsl:call-template>
		</xsl:variable>

		<xsl:variable name="str-after"
			select="normalize-space(substring-after($constraintInfo, '{'))" />

		<!-- 
			<xsl:message>
			processing constraint:
			<xsl:value-of select="$str-before" />
			</xsl:message>
		-->
		<div class="searchConstraint">
			<xsl:choose>
				<xsl:when test="$str-after=''"><!-- no individual specified, list all -->
					<xsl:call-template name="createSelect">
						<xsl:with-param name="constraintName"
							select="$str-before" />
					</xsl:call-template>
				</xsl:when>
				<xsl:when test="contains($str-after, ';')"><!-- multiple item -->
					<xsl:call-template name="createSpecifiedSelect">
						<xsl:with-param name="constraintName"
							select="$str-before" />
						<xsl:with-param name="constraintValue"
							select="substring-before($str-after, '}')" />
					</xsl:call-template>
				</xsl:when>
				<xsl:otherwise><!--  only one item, create a hidden field -->
					<xsl:call-template name="createHiddenField">
						<xsl:with-param name="constraintName"
							select="$str-before" />
						<xsl:with-param name="constraintValue"
							select="substring-before($str-after, '}')" />
					</xsl:call-template>
				</xsl:otherwise>
			</xsl:choose>
		</div>
	</xsl:template>

	<xsl:template name="iterateConstraints">
		<xsl:param name="_constraints" />

		<xsl:variable name="str-before">
			<xsl:call-template name="findStringBefore">
				<xsl:with-param name="string" select="$_constraints" />
				<xsl:with-param name="delimiter" select="'|'" />
			</xsl:call-template>
		</xsl:variable>
		<xsl:variable name="str-after"
			select="normalize-space(substring-after($_constraints, '|'))" />
		<!-- 
			<xsl:message>
			string before:
			<xsl:value-of select="$str-before" />
			</xsl:message>
			<xsl:message>
			string after:
			<xsl:value-of select="$str-after" />
			</xsl:message>
		-->

		<xsl:if test="not($str-before='')">
			<xsl:call-template name="processSingleConstraint">
				<xsl:with-param name="constraintInfo"
					select="$str-before" />
			</xsl:call-template>
		</xsl:if>

		<xsl:if test="not($str-after='')">
			<xsl:call-template name="iterateConstraints">
				<xsl:with-param name="_constraints" select="$str-after" />
			</xsl:call-template>
		</xsl:if>

	</xsl:template>


	<xsl:template name="processAllConstraints">
		<xsl:param name="data" />
		<!-- select constraints with distinct names -->
		<xsl:for-each
			select="$data/Constraint[not(@name=preceding-sibling::Constraint/@name)]">	
			<xsl:sort select="@name" lang="../@locale"/>		
			<xsl:variable name="name" select="@name" />
			<xsl:variable name="values" select="../Constraint[@name = $name]/Value" />
			<xsl:variable name="lang" select="../@locale"/>		
			<xsl:choose>
				<xsl:when test="$name = 'locale'">
					<input type="hidden" name="{$name}"
						value="{$lang}" />
				</xsl:when>				
				<xsl:when test="count($values) = 1">
				<!-- don't create search field if there is only one value -->
				</xsl:when>
				<xsl:otherwise>
					<div class="searchConstraint">
						<span>
							<xsl:choose>
								<xsl:when test="@label">
									<xsl:value-of select="@label" />
								</xsl:when>
								<xsl:otherwise>
									<xsl:value-of select="@name" />
								</xsl:otherwise>
							</xsl:choose>
						</span>
						<select name="{@name}">			
							<xsl:apply-templates mode="createOption" select="$values[1]"/>											
							<xsl:for-each select="$values[position()>1]">
								<xsl:sort select="." lang="$lang"/>
								<xsl:if test="count(. | key('unique-name', @name)[1]) = 1">
									<xsl:call-template name="createOption"/>
								</xsl:if>	
							</xsl:for-each>
						</select>
					</div>
				</xsl:otherwise>
			</xsl:choose>
		</xsl:for-each>
	</xsl:template>


	<xsl:template name="createOption" mode="createOption" match="node()">
		<xsl:variable name="value">
			<xsl:choose>
				<xsl:when test="'' = normalize-space(.)">
					<xsl:value-of select="@name" />
				</xsl:when>
				<xsl:otherwise>
					<xsl:value-of select="normalize-space(.)" />
				</xsl:otherwise>
			</xsl:choose>
		</xsl:variable>

		<xsl:variable name="displayValue">
			<xsl:choose>
				<xsl:when test="string-length($value) &gt; 20">
					<xsl:value-of
						select="concat(substring($value, 0, 20), '...')" />
				</xsl:when>
				<xsl:otherwise>
					<xsl:value-of select="$value" />
				</xsl:otherwise>
			</xsl:choose>
		</xsl:variable>

		<xsl:choose>
			<xsl:when test="@default='true'">
				<option value="{@name}" selected="true">
					<xsl:value-of select="$displayValue" />
				</option>
			</xsl:when>
			<xsl:otherwise>
				<option value="{@name}">
					<xsl:value-of select="$displayValue" />
				</option>
			</xsl:otherwise>
		</xsl:choose>
	</xsl:template>

</xsl:stylesheet>
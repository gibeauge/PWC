<?xml version="1.0" encoding="UTF-8" standalone="yes"?>
<!--Copyright Arbortext, Inc., 1999-2003-->
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
 	xmlns="http://www.w3.org/1999/xhtml"
	version="1.0">
	<xsl:output encoding="UTF-8" method="html"
		cdata-section-elements="script" omit-xml-declaration="yes"
		indent="yes" doctype-public="-//W3C//DTD HTML 4.01 Transitional//EN"
		doctype-system="http://www.w3.org/TR/html4/loose.dtd" />
	<xsl:param name="templatePath" select="''" />
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
	<xsl:param name="keywords" select="''" />
	<xsl:param name="defaultsize" select="0" />
	<xsl:param name="fieldOnlyLabel" select="'Search Fields Only'" />
	<xsl:param name="searchFieldLabel" select="'Search only in'" />
	<xsl:param name="searchWordsLabel" select="'Search Words'" />
	<xsl:param name="searchLabel" select="'search'" />
	<xsl:param name="altSearchLink" select="'index.jspx'" />
	<xsl:param name="altSearchType" select="'advanced'" />
	<xsl:param name="jsfunction" select="'true'" />
	<xsl:param name="tabsFrame" select="'tabs'" />
	<xsl:param name="viewsFrame" select="'viewsFrame'" />
	<xsl:param name="tabToolbarFrame" select="'tabToolbarFrame'" />
	<xsl:param name="tabId" select="''" />
	<xsl:param name="view" select="''" />
	<xsl:param name="toolbar" select="''" />

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
				<script language="JavaScript">
					<![CDATA[
					function appendKeywords(anchor, textFieldId) {
						var text = document.getElementById(textFieldId);
						if (!text) 
							return true;
						anchor.href = anchor.href + "&keywords=" + encodeURIComponent(text.value);
						return true;
					}
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
					src="{$templatePath}javascript/tab.js">
					<![CDATA[
					// leave some space, so that the serializer won't collapse element
					// which could cause browser to mis-behave
				]]>
				</script>
				<script language="JavaScript"
					src="{$templatePath}javascript/framesize.js">
					<![CDATA[
					// leave some space, so that the serializer won't collapse element
					// which could cause browser to mis-behave
				]]>
				</script>
				<script language="JavaScript"
					src="{$templatePath}javascript/formdata.js">
					<![CDATA[
					// leave some space, so that the serializer won't collapse element
					// which could cause browser to mis-behave
				]]>
				</script>
			</head>
			<body
				onload="adjustFrameSize('navFrameset', 'searchFrame', true, {$defaultsize}, 5, false)">
				<div id="searchForm">
					<form method="post" name="search" action="{$action}" id="search"
						onsubmit="return formQueryData(this, '{$tabId}', '{$tabsFrame}', '{$viewsFrame}', '{$view}', '{$tabToolbarFrame}', '{$toolbar}')">
						<div class="searchInput">
							<input type="text" value="{$keywords}" id="{Keywords/Key[@name='searchWords']/text()}"
								name="{Keywords/Key[@name='searchWords']/text()}" size="15"/>
							<xsl:text>&#160;</xsl:text>
							<input type="hidden"
								name="task"
								value="RESULT" />
							<input type="hidden"
								name="{Keywords/Key[@name='defaultField']/text()}"
								value="{Fields/@defaultFieldName}" />
							<input type="submit" name="search"
								value="{$searchLabel}" />
							<xsl:text>&#160;</xsl:text>
							<a href="{$altSearchLink}" onclick="appendKeywords(this, '{Keywords/Key[@name='searchWords']/text()}');">
								<xsl:value-of select="$altSearchType" />
							</a>
						</div>
						<xsl:choose>
							<xsl:when test="$fields='*'">
								<xsl:if test="Fields/Type">
								<xsl:call-template
									name="processFields">
									<xsl:with-param name="fieldNames"
										select="Keywords/Key[@name='fieldNames']/text()" />
									<xsl:with-param
										name="fieldNamesLabel" select="$searchFieldLabel" />
									<xsl:with-param name="fieldOnly"
										select="Keywords/Key[@name='fieldOnly']/text()" />
									<xsl:with-param name="data"
										select="Fields" />
								</xsl:call-template>
								</xsl:if>
							</xsl:when>
							<xsl:when test="$fields=''">
								<!-- ignore -->
							</xsl:when>
							<xsl:otherwise>
								<xsl:call-template
									name="processSpecifiedFields">
									<xsl:with-param name="fieldNames"
										select="Keywords/Key[@name='fieldNames']/text()" />
									<xsl:with-param
										name="fieldNamesLabel" select="$searchFieldLabel" />
									<xsl:with-param name="fieldOnly"
										select="Keywords/Key[@name='fieldOnly']/text()" />
									<xsl:with-param name="data"
										select="Fields" />
									<xsl:with-param name="fields"
										select="$fields" />
								</xsl:call-template>
							</xsl:otherwise>
						</xsl:choose>
						<xsl:if test="not($constraints = '')">
							<xsl:call-template
								name="processConstraints">
								<xsl:with-param name="data"
									select="Constraints" />
							</xsl:call-template>
						</xsl:if>
					</form>
				</div>
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
					<xsl:variable name="optionContent">
						<xsl:choose>
							<xsl:when test="text()">
								<xsl:value-of select="text()" />
							</xsl:when>
							<xsl:otherwise>
								<xsl:value-of select="@name" />
							</xsl:otherwise>
						</xsl:choose>
					</xsl:variable>
					<xsl:choose>
						<xsl:when test="$defaultField = @name">
							<option value="{@name}"
								selected="selected">
								<xsl:value-of select="$optionContent" />
							</option>
						</xsl:when>
						<xsl:otherwise>
							<option value="{@name}">
								<xsl:value-of select="$optionContent" />
							</option>
						</xsl:otherwise>
					</xsl:choose>
				</xsl:for-each>
			</select>
		</div>
	</xsl:template>

	<xsl:template name="processSpecifiedFields">
		<xsl:param name="fieldNames" />
		<xsl:param name="fieldNamesLabel" />
		<xsl:param name="fieldOnly" />
		<xsl:param name="data" />
		<xsl:param name="fields" />
		<xsl:variable name="defaultField"
			select="$data/@defaultFieldName" />
		<div class="searchField">
			<input type="hidden" name="{$fieldOnly}" value="true" />
			<span>
				<xsl:value-of select="$fieldNamesLabel" />
			</span>
			<select name="{$fieldNames}" multiple="multiple">
				<xsl:call-template name="processFieldsOption">
					<xsl:with-param name="fields" select="$fields" />
					<xsl:with-param name="defaultField"
						select="$defaultField" />
				</xsl:call-template>
			</select>
		</div>
	</xsl:template>

	<xsl:template name="processFieldsOption">
		<xsl:param name="fields" />
		<xsl:param name="defaultField" />
		<xsl:variable name="pair">
			<xsl:call-template name="findStringBefore">
				<xsl:with-param name="string" select="$fields" />
				<xsl:with-param name="delimiter" select="'|'" />
			</xsl:call-template>
		</xsl:variable>
		<xsl:if test="not($pair='')">
			<xsl:variable name="name"
				select="normalize-space(substring-before($pair, ':'))" />
			<xsl:variable name="value"
				select="normalize-space(substring-after($pair, ':'))" />
			<xsl:if test="not($name='') and not($value='')">
				<xsl:choose>
					<xsl:when test="$defaultField = $value">
						<option value="{$value}" selected="selected">
							<xsl:value-of select="$name" />
						</option>
					</xsl:when>
					<xsl:otherwise>
						<option value="{$value}">
							<xsl:value-of select="$name" />
						</option>
					</xsl:otherwise>
				</xsl:choose>
			</xsl:if>
			<xsl:call-template name="processFieldsOption">
				<xsl:with-param name="fields"
					select="substring-after($fields, '|')" />
				<xsl:with-param name="defaultField"
					select="$defaultField" />
			</xsl:call-template>
		</xsl:if>
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
		<span>
			<xsl:value-of select="$selectName" />
		</span>
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
			<span>
				<xsl:value-of select="$selectName" />
			</span>
			<select name="{$selectValue}">
				<option value="" selected="selected">All</option>
				<xsl:for-each
					select="//Constraint[@name = $selectValue]/Value">
					<!-- <xsl:sort select="." /> -->
					<xsl:variable name="value"
						select="normalize-space(.)" />
					<option value="{@name}">
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
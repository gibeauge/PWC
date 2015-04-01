<?xml version="1.0" encoding="UTF-8"?>

<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
                version="2.0">

<xsl:output method="xml" indent="yes"/>

<xsl:param name="output-dir"/>

<xsl:template match="/">
  <html>
    <head>
      <link href="css/content.css" rel="stylesheet" type="text/css" />
      <link href="css/jstree.css" rel="stylesheet" type="text/css" />
      <link href="css/bil_pub.css" rel="stylesheet" type="text/css" />
      <script type="text/javascript" src="js/jquery-1.11.2.min.js"> // JS </script>
      <script type="text/javascript" src="js/jquery.ui-1.10.4.min.js"> // JS </script>
      <script type="text/javascript" src="js/jquery.layout-1.4.3.min.js"> // JS </script>
      <script type="text/javascript" src="js/jstree-3.0.9.min.js"> // JS </script>
      <script type="text/javascript" src="js/jquery.address-1.5.min.js"> // JS </script>
      <script type="text/javascript" src="js/pwcdisplay.js"> // JS </script>
      <script type="text/javascript">
      var main_layout;
      $(document).ready(function () {
      	
      	//Outer-layout options
		main_layout = $('body').layout( {
        	closable: false, 
        	spacing_open: 2, 
        	north__resizable: false, 
        	west__size: 300,
			north__size: 75,
        	
        	//Inner-layout options
        	center__childOptions:{
        		center__paneSelector: ".content",
        		north__paneSelector: ".nav",
        		north__size: 25,
        		closable: false,
        		spacing_open: 0
        	}
       	 });
		 
		 //Add Metadata
		 $("#load_home").ready(function() {
        $("#load_content").load("metadata.html");
    });
		 
	  });
	  
    </script>
	</head>
    <body>
		<xsl:apply-templates/>
    </body>
  </html>
</xsl:template>

<xsl:template match="Structure">
<div class="ui-layout-north banner" id="load_home">
	<div id="topBar">
    <div id="load_content">#</div>
	</div>
</div>

  
 <div class="ui-layout-center">
 
	<div class="ui-layout-north nav">
		<ul class="menu">
			<li class="home"><a href="#" title="Home"><img src="CSS/home.gif" /></a></li>
			<li class="prev"><a href="#" title="Go Back"><img src="CSS/e_back.gif" /></a></li>
			<li class="next"><a href="#" title="Go Forward"><img src="CSS/e_forward.gif" /></a></li>
			<li class="print"><a href="#" title="Print"><img src="CSS/print.gif" /></a></li>
		</ul>
	</div>
	
  	<div class="ui-layout-center content">
  		<div id="pane_content">&#160;</div>
  	</div>
  </div>
  
  <div class="ui-layout-west">
  <div id="toc" class="s-toc"></div>
 
  <script type="text/javascript">
  $('#toc').jstree({
    'core' : {
      'themes' : { "dots" : false },
      'plugins' : [ "json", "themes"],
      'data' : [
        { 
          "text" : "_Root_", 
          "id" : "root",
          "state" : { "opened" : true }, 
          "children" : [
            <xsl:apply-templates/>
          ]
        }
      ]
    }
  });
  
  // Hide first useless level
  $("#toc").bind("loaded.jstree", function (event, data) {
    $("a:contains('_Root_')").css("visibility","hidden")  
    $(".jstree-last .jstree-icon").first().hide()
    
    $("#toc").jstree().select_node("#<xsl:value-of select="//Page[@URL and not(preceding::Page)]/@ID"/>");
  });
  
  // Change icon when selection a node when it is a folder
  $("#toc").bind("select_node.jstree", function (event, data) {
    var icon_path = data.node.icon;
    if (icon_path == "./css/toc_closed_files.gif") {
      data.instance.open_node(data.node);
    }
    else if (icon_path == "./css/toc_closed.gif") {
      data.instance.open_node(data.node);
    }
    else if (icon_path == "./css/toc_open_files.gif") {
      data.instance.close_node(data.node);
    }
    else if (icon_path == "./css/toc_open.gif") {
      data.instance.close_node(data.node);
    }
    var href_url = $('#' + data.node.id).find('a').first().attr("href");
	if (href_url != "") {
      var anchor_idx = href_url.indexOf("#");
      if (anchor_idx != -1) {
        var anchor = href_url.substring(anchor_idx+1);
        href_url = href_url.substring(0,anchor_idx);
        $("#pane_content").load(href_url);
        document.getElementById(anchor).scrollIntoView(true);
      }
     else {
        $("#pane_content").load(href_url);
    }
    }
  });
  
 
  // Change icon when opening a folder
  $("#toc").on("open_node.jstree", function(event, data) {
    var icon_path = data.node.icon;
    if (icon_path == "./css/toc_closed_files.gif") {
      icon_path = "./css/toc_open_files.gif"
    }
    else if (icon_path == "./css/toc_closed.gif") {
      icon_path = "./css/toc_open.gif"
    }
    else {
      icon_path = "./css/toc_open.gif"
    }
    data.instance.set_icon(data.node,icon_path);
  });
  
  // Change icon when closing a folder
  $("#toc").on("close_node.jstree", function(event, data) {
    var icon_path = data.node.icon;
    if (icon_path == "./css/toc_open_files.gif") {
      icon_path = "./css/toc_closed_files.gif"
    }
    else if (icon_path == "./css/toc_open.gif") {
      icon_path = "./css/toc_closed.gif"
    }
    else {
      icon_path = "./css/toc_closed.gif"
    }
    data.instance.set_icon(data.node,icon_path);
  });
  </script>
  </div>
</xsl:template>

<xsl:template match="Pages">
  <xsl:apply-templates/>
</xsl:template>

<xsl:template match="Page[@Title='FRONTMATTER']">
  <xsl:apply-templates/>
  <xsl:if test="following-sibling::Page">,</xsl:if>
</xsl:template>

<xsl:template match="Page">
  <xsl:variable name="icon">
    <xsl:choose>
		<xsl:when test="(@FileType='FOLDER' and @URL) or (@FileType='FILE' and @Title='List of Figures')">./css/toc_closed_files.gif</xsl:when>
		<xsl:when test="@FileType='FILE' or @FileType='IMAGE'">./css/toc_file.gif</xsl:when>
      <xsl:otherwise>./css/toc_closed.gif</xsl:otherwise>
    </xsl:choose>
  </xsl:variable>
  {
    "id" : "<xsl:value-of select="@ID"/>",
    "text" : "<xsl:value-of select="@Title"/>",
    "icon" : "<xsl:value-of select="$icon"/>",
    "li_attr" : { "title" : "<xsl:value-of select="@Title"/>" },
	<xsl:choose>
		<xsl:when test="@FileType='IMAGE'">
		"a_attr" : { "href" : "null" , "onclick" : "<xsl:value-of select="@onclick"/>" },
		</xsl:when>
		<xsl:when test="@FileType='FILE' and @Title='List of Figures'">
		"a_attr" : { "href" : "null"},
				</xsl:when>
		<xsl:otherwise>
		"a_attr" : { "href" : "<xsl:value-of select="@URL"/>" },
		</xsl:otherwise>
    </xsl:choose>
	<xsl:if test="@FileType='FOLDER' or (@FileType='FILE' and @Title='List of Figures')">
      	  "children" : [
        <xsl:apply-templates/>
      ]
    </xsl:if> 
  }
  <xsl:if test="following-sibling::Page">,</xsl:if>
</xsl:template>

</xsl:stylesheet>

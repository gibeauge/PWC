<?xml version="1.0" encoding="UTF-8"?>

<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
				xmlns:xs="http://www.w3.org/2001/XMLSchema"
                version="2.0">

<xsl:output method="xml" indent="yes"/>

<xsl:param name="output-dir"/>

<xsl:variable name="lang-orig"   select="if (/*/@lang) then upper-case(/*/@lang) else 'EN'"/>
<xsl:variable name="texts"       select="document('bil_texts.xml')//texts[@language=$lang-orig]"/>
<xsl:variable name="print_msg" 	 select="$texts//text[@name='print_message']" />

<xsl:template match="/">
  <xsl:text disable-output-escaping="yes">&lt;!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd"&gt;</xsl:text>
  <html>
    <head>
      <link href="css/content.css" rel="stylesheet" type="text/css" />
      <link href="css/jstree.css" rel="stylesheet" type="text/css" />
      <link href="css/bil_pub.css" rel="stylesheet" type="text/css" />
	  <link href="css/printer.css" rel="stylesheet" type="text/css" />
      <script type="text/javascript" src="js/jquery-1.11.2.min.js"> // JS </script>
      <script type="text/javascript" src="js/jquery.ui-1.10.4.min.js"> // JS </script>
      <script type="text/javascript" src="js/jquery.layout-1.4.3.min.js"> // JS </script>
      <script type="text/javascript" src="js/jstree-3.0.9.min.js"> // JS </script>
      <script type="text/javascript" src="js/jquery.ba-bbq.min.js"> // JS </script>
      <script type="text/javascript" src="js/pwcdisplay.js"> // JS </script>
      <script type="text/javascript">
      var main_layout;
      $(document).ready(function () {
      	
      	//Outer-layout options
		main_layout = $('body').layout( {
        	closable: false, 
        	spacing_open: 2, 
        	north__resizable: false,
			south__resizable: false,			
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
			<li><a id="home" href="#" title="Home"><img src="CSS/home.gif" /></a></li>
			<li><a id="prev" href="#" title="Go Back"><img src="CSS/e_back.gif" /></a></li>
			<li><a id="next" href="#" title="Go Forward"><img src="CSS/e_forward.gif" /></a></li>
			<li><a href="#" id="print" title="Print" onclick="print_page()"><img src="CSS/print.gif" /></a></li>
		</ul>
	</div>
	
  	<div class="ui-layout-center content">
  		<div id="pane_content">&#160;</div>
		  	</div>
  </div>
  
  <!-- FOOTER -->
  <div class="ui-layout-south">
	<div id="print_footer">
		<hr class="print_header" size = "1px"/>
		Printed on: <xsl:value-of select="format-date(xs:date(current-date()),'[D01] [MN,*-3]/[Y0001]', 'en', (), ())" /> P<xsl:text disable-output-escaping="yes">&amp;</xsl:text>WC Proprietary - subject to restrictions in Technical Data Agreement
	</div>
  </div>
  
  <div class="ui-layout-west">
  <div id="toc" class="s-toc"></div>
 
  <script type="text/javascript">
  //print function
  function print_page(){
    var l_print_msg = '<xsl:value-of select='$print_msg'/>';
	var print_img = confirm(l_print_msg);
    if (print_img == false) {
		printWithoutImg();
	}
	else{
		window.print();
	}
  }
  
  //Create a new style node in head section to hide images and Print
  function printWithoutImg () {
			//Create style node with attributes id and media
            var style = document.createElement("style");
            style.setAttribute("id","imgHide");
			style.setAttribute("media","print");
			//Create Text Node with css value
			var value = document.createTextNode("img {display: none}");
			//Append nodes to the document header
			style.appendChild(value);
			document.head.appendChild(style);
			
			//Print
			window.print();
			
			//Delete created node
			document.head.removeChild(style);
        }

  
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
  
  //Global variable to scroll to anchor
  var global_anchor="";
  
  // Hide first useless level
  $("#toc").bind("loaded.jstree", function (event, data) {
    $("a:contains('_Root_')").css("visibility","hidden")  
    $(".jstree-last .jstree-icon").first().hide()
    
    $("#toc").jstree().select_node("#<xsl:value-of select="//Page[@URL and not(preceding::Page)]/@ID"/>");
  });
  
  // Change icon when selection a node when it is a folder
  $("#toc").bind("changed.jstree", function (event, data) {
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
    var node_id = data.node.id;
	if (href_url != "") {
      var anchor_idx = href_url.indexOf("#");
      if (anchor_idx != -1) {
        var anchor = href_url.substring(anchor_idx+1);
        href_url = href_url.substring(0,anchor_idx);
        if(global_anchor != ""){
        	anchor = global_anchor;
        }
        console.log("Scroll to anchor : " + anchor)
        $("#pane_content").load(href_url);
        
        $.bbq.pushState({ url : href_url, anchor : anchor, id : data.node.id });

        setTimeout(function() { 
            //If the anchor is a table, we have to diplay it to be able to scroll to
        	if(anchor.indexOf("t") != -1) {
        		//If the anchor is a table in a graphic we have to display the graphic
   				if ($("#" + anchor).parents(".x-graphic-1-0").length <xsl:text disable-output-escaping="yes">&gt;</xsl:text> 0) {
   					console.log("The table is contained into a graphic");
   					var graphic_id = $("#" + anchor).parents(".x-graphic-1-0").attr("id");
   					displayGraphics(graphic_id);
   				}
        		$("#" + anchor).css({"display":"block"});
       		}
       		
			document.getElementById(anchor).scrollIntoView();
		}, 1000);
     } else {
    	$.bbq.pushState({ url : href_url, id : data.node.id });
        $("#pane_content").load(href_url);
     }
     global_anchor="";
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
  
  //Manage navigation
  $(window).bind("hashchange", function(e) {
  	console.log("Hashchange");
  	var url = $.bbq.getState("url");
  	var anchor = $.bbq.getState("anchor");
  	var node_id = $.bbq.getState("id");
  	$("#pane_content").load(url);
 	$("#toc").jstree("select_node", node_id);
  	if (anchor != '') {
  		document.getElementById(anchor).scrollIntoView(true);
  	}
  });
  
  //Previous top menu button
  $('#prev').click(function(){ 
  	history.back(); 
  	return false; 
  });

  //Next top menu button
  $('#next').click(function(){ 
  	history.forward() 
  	return false; 
  });
  
  //Home top menu button
  $('#home').click(function(){
    $("#toc").jstree().select_node("#<xsl:value-of select="//Page[@URL and not(preceding::Page)]/@ID"/>");
  });
  

  
  	//Manage internal links to tasks
	//Since the class for the link is added dynamically
	//We need to use event delegation to register the event handler  
	$(document).on('click', "#pane_content a", function(e, data) {
		e.preventDefault();
		//Element contains "onclick" attribute
		if($(this).attr("onclick") != undefined) {
			//Link to a graphic
			if($(this).attr("onclick").indexOf("displayGraphics") != -1){
				console.log("Link to a graphic");
			//Table link
			} else if ($(this).attr("onclick").indexOf("toggle") != -1) {
				console.log("Table link");
			//Link to a table
			} else if ($(this).attr("onclick").indexOf("showTable") != -1) {
				console.log("Link to a table");
				//The table is contained into a graphic
				if($(this).parents(".x-refint-2-0").length <xsl:text disable-output-escaping="yes">&gt;</xsl:text> 0) {
					console.log("Click on graphic table");
					var parent_div = $(this).parents(".x-taskproc-1-0");
					var onclick = parent_div.find("a[onclick^='displayGraphics']").attr("onclick");
					eval(onclick);
				}
				var href_url = $(this).attr("href");
				linkTo(href_url);
			}
		}
		//Element contains "class" attribute
		if($(this).attr("class") != undefined) {
			//Link to a task
			if ($(this).attr("class").indexOf("x--sfe-InternalLink-1-0") != -1){
				console.log("Link to a task");
				var href_url = $(this).attr("href");
				linkTo(href_url);
			}
		}
	});
	
	//Bind links depending on the element href
	function linkTo(href_url) {
		var anchor_idx = href_url.indexOf("#");
		if (anchor_idx != -1) {
			var anchor = href_url.substring(anchor_idx+1);
			href_url = href_url.substring(0,anchor_idx);
			if(href_url != "") {
				console.log("External link");
				var node_id = getIdFromHref(href_url);
				global_anchor = anchor;
				console.log(node_id);
				$("#toc").jstree().close_all();
				$("#toc").jstree('select_node', node_id);
			} else {
				console.log("Internal link");
				document.getElementById(anchor).scrollIntoView(true);
			}
		}
	}

	//Get node ID depending on the href
  	function getIdFromHref(href_url) {
		console.log(href_url);
		var tree = $("#toc").data().jstree.get_json("#", {"flat": true});
		for(var i=1; i <xsl:text disable-output-escaping="yes">&lt;</xsl:text> tree.length; i++) {
			var href = tree[i].a_attr.href;
			var href_idx = href.indexOf(href_url);
			if (href_idx != -1) {
				var node_id = tree[i].id;
				return node_id;
			}
		}
	}
	
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
  <xsl:variable name="dquot">"</xsl:variable>
  <xsl:variable name="ftype" select="@FileType"/>
  <xsl:variable name="title" select="replace(@Title,$dquot,concat('\\',$dquot))"/>
  <xsl:variable name="icon">
    <xsl:choose>
		<xsl:when test="($ftype='FOLDER' and @URL) or ($ftype='FILE' and $title='List of Figures') or ($ftype='FILE' and .//Page[@FileType='FILE'])">./css/toc_closed_files.gif</xsl:when>
		<xsl:when test="$ftype='FILE' or $ftype='IMAGE'">./css/toc_file.gif</xsl:when>
      <xsl:otherwise>./css/toc_closed.gif</xsl:otherwise>
    </xsl:choose>
  </xsl:variable>
  {
    "id" : "<xsl:value-of select="@ID"/>",
    "text" : "<xsl:value-of select="$title"/>",
    "icon" : "<xsl:value-of select="$icon"/>",
    "li_attr" : { "title" : "<xsl:value-of select="$title"/>" },
	<xsl:choose>
		<xsl:when test="$ftype='IMAGE'">
		"a_attr" : { "href" : "null" , "onclick" : "<xsl:value-of select="@onclick"/>" },
		</xsl:when>
		<xsl:when test="$ftype='FILE' and $title='List of Figures'">
		"a_attr" : { "href" : "null"},
		</xsl:when>
		<xsl:otherwise>
		"a_attr" : { "href" : "<xsl:value-of select="@URL"/>" },
		</xsl:otherwise>
    </xsl:choose>
	<xsl:if test="$ftype='FOLDER' or ($ftype='FILE' and $title='List of Figures') or ($ftype='FILE' and .//Page[@FileType='FILE'])">
      	  "children" : [
        <xsl:apply-templates/>
      ]
    </xsl:if> 
  }
  <xsl:if test="following-sibling::Page">,</xsl:if>
</xsl:template>

</xsl:stylesheet>

/*
	Dependencies: Requires utils.js
*/


function toggleOpenClose(e) { 
	var	myElement=e.srcElement;
				
	if (!myElement) {
		myElement = e.target;					
	} 
	
	if (!myElement)
		return true;

	while (myElement && "LI" != myElement.tagName.toUpperCase()) {
		myElement = myElement.parentNode;
	}
							
	toggleNode(myElement);
						
	if (myElement.className=="open") {
		  	myElement.className="closed"; 
	} else if (myElement.className=="closed") {
	   	myElement.className="open"; 					 
	} else if (myElement.className=="closed-hidden") {
	   	myElement.className="open-hidden"; 					 
	} else if (myElement.className=="open-hidden") {
	   	myElement.className="closed-hidden"; 					 
	} else if (myElement.className=="closed-disabled") {
	   	myElement.className="open-disabled"; 					 
	} else if (myElement.className=="open-disabled") {
	   	myElement.className="closed-disabled"; 					 
	} else if (myElement.className=="item-hidden") {
	   	myElement.className="item"; 					 
	} else if (myElement.className=="item") {
	   	myElement.className="item-hidden"; 					 
	} else if (myElement.className=="folder-hidden") {
	   	myElement.className="folder"; 					 
	} else if (myElement.className=="folder") {
	   	myElement.className="folder-hidden"; 					 
	} 
		
	if (!e.cancelBubble)
		e.cancelBubble = true;
	if (e.stopPropagation) e.stopPropagation();

	return true;
}

function toggleNode(node) {
	if (!node)
		return;
		
	var img = getFirstLevelChildByElementName(node, "img");
	
	if (img) {
		if (img.src.indexOf(openImage) >= 0) {
			img.src = closedImage;
		} else if (img.src.indexOf(openLinkImage) >= 0){
		 	img.src = closedLinkImage;
		} else if (img.src.indexOf(closedImage) >= 0) {
			img.src = openImage;
		} else if (img.src.indexOf(closedLinkImage) >= 0) {
			img.src = openLinkImage;
		}	
	} 

}

function openNode(node) {
	if (!node)
		return;
		
	var img = getFirstLevelChildByElementName(node, "img");
	
	if (img) {
			if (img.src.indexOf(closedImage) >= 0) {
			img.src = openImage;
		}	else if (img.src.indexOf(closedLinkImage) >= 0) {
			img.src = openLinkImage;
		}
	}

}

function closeNode(node) {
	if (!node)
		return;
		
	var img = getFirstLevelChildByElementName(node, "img");
	
	if (img) {
		if (img.src.indexOf(openImage) >= 0) {
			img.src = closedImage;
		} 	else if (img.src.indexOf(openLinkImage) >= 0){
		 	img.src = closedLinkImage;
		}
	}

	var ul = getFirstLevelChildByElementName(node, "ul");
	if (ul) {
		if (ul.style == "display: block")
			ul.style="display: none";
	}

}


function setSelected(doc, elm) {
	if (elm)
		elm.focus();
}

function openDocById(id, frame) {
	//alert("open: " + id);
	var win = window;
	var doc = document;

	if (!id)
		return;

	var elm = document.getElementById(id);

	if (!elm)
		return;
		
	expandToNode(win, elm);			
	scrollIntoView(win, elm);

	elm.removeAttribute("id");
	
	elm = getFirstLevelChildByElementName(elm, "a");	

	if (elm) {
		elm.focus();
	}	
	
}

function showId(win, id) {
	if (!win || !id)
		return;
	
	var doc = getFrameContentDocument(win);
	
	if (!doc)
		return;
	
	var elm = doc.getElementById(id);
	
	if (!elm) {
		return;
	}
	
	expandToNode(win, elm);			
	setSelected(doc, elm);	
	scrollIntoView(win, elm);
}

function showPath(win, path, showquery, showanchor) {
	if (!win || !path)
		return;

    if (!showquery) {
		var idx = path.indexOf("?");
	
		if (idx != -1)
			path = path.substring(0, idx);
	}
	
	if (!showanchor) {
		idx = path.indexOf("#");
	
		if (idx != -1)
			path = path.substring(0, idx);
	}
	
	var doc = getFrameContentDocument(win);
	
	path = unescape(path);
	
	if (doc) {
		var nodes = doc.getElementsByTagName("a");
		
		if (nodes == null) {
			nodes = doc.getElementsByTagName("A");
		}
	
		var node = null;
					
		if (nodes) {
			for (var i = 0; i < nodes.length; i++) {					
				if (unescape(nodes[i].href) == path) {	
					expandToNode(win, nodes[i]);			
					setSelected(doc, nodes[i]);	
					node = nodes[i];
					break;
				}
			}
		}
		if (node)
			scrollIntoView(win, node);
	
		return;		
	}
}

function expandAll (agent, framename) {

	var win = searchFrameWin(framename);

	if ("server" == agent) {
		
		win.location.replace("index.jspx?task=TOC&expand=true");
	
	} else {
	
		var liNodes = win.document.getElementsByTagName("li");

		if (liNodes) {
			for (var i=0; i < liNodes.length; i++) {
				var node = liNodes[i];
				win.openNode(node);
				if (node.className == "closed")
					node.className = "open";
				else if (node.className == "closed-hidden")
					node.className = "open-hidden";	
				else if (node.className == "closed-disabled")
					node.className = "open-disabled";	
			}	
		}
	}
}

function collapseAll (agent, framename) {

	var win = searchFrameWin(framename);
	
	if ("server" == agent) {
		win.location.replace("index.jspx?task=TOC");
	} else {	
		
		var liNodes = win.document.getElementsByTagName("li");
		
		if (liNodes) {
			for (var i=0; i < liNodes.length; i++) {
				var node = liNodes[i];
				win.closeNode(node);
				if (node.className == "open")
					node.className = "closed";	
				else if (node.className == "open-hidden")
					node.className = "closed-hidden";
				else if (node.className == "open-disabled")
					node.className = "closed-disabled";
			}
		}
		
	}
}


function expandToNode(win, node) {
	if (!win || !node)
		return;
	
	var parent = node.parentNode;
	
	while (parent) {
		if (parent.tagName == "li" || parent.tagName == "LI") {
			win.openNode(parent);
			if (parent.className == "closed") {
				parent.className = "open";
			}
		} else if (parent.tagName == "ul" || parent.tagName == "UL") {
			win.closeNode(parent);
			if (parent.className == "collapsed") {
				parent.className = "expanded";
			}		
		}
		parent = parent.parentNode;
	}
}

/**
 * Scrolls the page to show the specified element
 */
function scrollIntoView(win, node)
{
	node.scrollIntoView();
	win.scrollBy(-100, 0);
}

/**
 * Scrolls the page to show the specified element
 */
function getVerticalScroll(win, node)
{
	if (!win || !node)
		return;
	var doc = getFrameContentDocument(win);
	var nodeTop = getNodeTop(node);
	var nodeBottom = nodeTop + node.offsetHeight;
	var pageTop = 0;
	var pageBottom = 0;
		
	if (doc.body.clientHeight)
	{
		pageTop = doc.body.scrollTop; 
		pageBottom = pageTop + doc.body.clientHeight;
	} 
	else if (win.pageYOffset)
	{
		pageTop = win.pageYOffset;
		pageBottom = pageTop + win.innerHeight - node.offsetHeight;
	}
	
	var scroll = 0;
	if (nodeTop >= pageTop )
	{
		if (nodeBottom <= pageBottom)
			scroll = 0; // already in view
		else
			scroll = nodeBottom - pageBottom;
	}
	else
	{
		scroll = nodeTop - pageTop;
	}

	return scroll;
}


function getNodeTop(node) {
	var top = 0;
	while (node) {
		top += Number(node.offsetTop);
		if (node.tagName && node.tagName == "BODY") {
			break;
		}
		node = node.offsetParent;
	}
	
	return top;
}

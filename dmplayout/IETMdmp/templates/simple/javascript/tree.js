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
		} else if (img.src.indexOf(closedImage) >= 0) {
			img.src = openImage;
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
	if (!win || !path)
		return;
	
	var doc = getFrameContentDocument(win);
	var elm = doc.getElementById(id);
	
	if (!elm) {
		return;
	}
	expandToNode(win, elm);			
	scrollIntoView(win, elm);
	setSelected(doc, elm);	
}

function showPath(win, path) {
	if (!win || !path)
		return;

	var idx = path.indexOf("?");
	
	if (idx != -1)
		path = path.substring(0, idx);
	
	idx = path.indexOf("#");
	
	if (idx != -1)
		path = path.substring(0, idx);
	
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

function expandAll (framename) {
	var win = searchFrameWin(framename);
	var liNodes = win.document.getElementsByTagName("li");
	
	if (liNodes) {
		for (var i=0; i < liNodes.length; i++) {
			var node = liNodes[i];
			win.openNode(node);
			if (node.className == "closed")
				node.className = "open";
		}	
	}

}

function collapseAll (framename) {
	var win = searchFrameWin(framename);
	var liNodes = win.document.getElementsByTagName("li");
	
	if (liNodes) {
		for (var i=0; i < liNodes.length; i++) {
			var node = liNodes[i];
			win.closeNode(node);
			if (node.className == "open")
				node.className = "closed";	
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
	win.scrollBy(-50, 0);
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

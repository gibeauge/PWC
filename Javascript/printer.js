
function pwcCurrentDate() {
	return frames[1].frames[1].frames[0].pwcCurrentDate();
}
/* Clear styles of banner */
function clearStyle(nodes) {
  for (var i = 0; i < nodes.length; i++) {
	var styleattribute = nodes[i].getAttribute('style');
	if (styleattribute !=null) {
		nodes[i].style.cssText = '';
	}
  }
}
/* For browser compatibility */
function outerHTML(node){
    return node.outerHTML || new XMLSerializer().serializeToString(node);
}
	
function addStylesheet(frame) {
	var stylesheets = frame.document.getElementsByTagName('head')[0].getElementsByTagName('link');
	for (var i = 0; i < stylesheets.length; i++) {
		stylesheetUrl = frame.document.getElementsByTagName('head')[0].getElementsByTagName('link')[i].getAttribute('href');
		if (document.createStyleSheet) {
			document.createStyleSheet(stylesheetUrl,0);
			var stylesheet = document.getElementsByTagName('head')[0].getElementsByTagName('link')[0];
			stylesheet.setAttribute('id', stylesheetUrl.replace(/.*\/(\w*)\.css/g, "$1"));
		}
	}
}
function getChaptSectSub(frame) {
	var chapter = (frame.document.getElementById('chapter')) ? frame.document.getElementById('chapter').innerHTML : "";
	var section = (frame.document.getElementById('section')) ? frame.document.getElementById('section').innerHTML : "";
	var subject = (frame.document.getElementById('subject')) ? frame.document.getElementById('subject').innerHTML : "";
	
	if(chapter == "frontmatter" || chapter == "") {
		return ""
	}
	return chapter + "-" + section + "-" + subject + " ";
}
function addHeaderFooter(frame) {
	if(!frame.document.getElementById('contentWrapperPrint')) {
		var frameBody = frame.document.getElementsByTagName('body');
		var content = frameBody[0];
		var bannerInfo = outerHTML(frames[0].document.getElementById('bannerInfo'));
		var bodyElem = frame.document.createElement("body");
		contentGraphicDisclaimer = frames[1].frames[1].frames[0].contentGraphicDisclaimer;
		bodyElem.insertAdjacentHTML("afterbegin","<table id='contentWrapperPrint'><thead><tr><th><div id='contentHeader'><div class='header-big'>" + getChaptSectSub(frame) + frame.document.title + "<br><br>PRATT & WHITNEY CANADA</div>" +  bannerInfo + "</div></th></tr></thead><tfoot class='footer'><tr><td><div id='contentFooter'>Printed on: " + pwcCurrentDate() + " " + contentGraphicDisclaimer + "</div></td></tr></tfoot><tbody><tr><td>" + content.innerHTML + "</td></tr></tbody></table>");
		frame.document.documentElement.appendChild(bodyElem);
		frame.document.documentElement.removeChild(frame.document.getElementsByTagName('body')[0]);
		clearStyle(frame.document.getElementById('contentHeader').getElementsByTagName('div'));
	}
}
/*
	Developed by Robert Nyman, http://www.robertnyman.com
	Code/licensing: http://code.google.com/p/getelementsbyclassname/
*/	
var getElementsByClassName = function (className, tag, elm){
	if (document.getElementsByClassName) {
		getElementsByClassName = function (className, tag, elm) {
			elm = elm || document;
			var elements = elm.getElementsByClassName(className),
				nodeName = (tag)? new RegExp("\\b" + tag + "\\b", "i") : null,
				returnElements = [],
				current;
			for(var i=0, il=elements.length; i<il; i+=1){
				current = elements[i];
				if(!nodeName || nodeName.test(current.nodeName)) {
					returnElements.push(current);
				}
			}
			return returnElements;
		};
	}
	else if (document.evaluate) {
		getElementsByClassName = function (className, tag, elm) {
			tag = tag || "*";
			elm = elm || document;
			var classes = className.split(" "),
				classesToCheck = "",
				xhtmlNamespace = "http://www.w3.org/1999/xhtml",
				namespaceResolver = (document.documentElement.namespaceURI === xhtmlNamespace)? xhtmlNamespace : null,
				returnElements = [],
				elements,
				node;
			for(var j=0, jl=classes.length; j<jl; j+=1){
				classesToCheck += "[contains(concat(' ', @class, ' '), ' " + classes[j] + " ')]";
			}
			try	{
				elements = document.evaluate(".//" + tag + classesToCheck, elm, namespaceResolver, 0, null);
			}
			catch (e) {
				elements = document.evaluate(".//" + tag + classesToCheck, elm, null, 0, null);
			}
			while ((node = elements.iterateNext())) {
				returnElements.push(node);
			}
			return returnElements;
		};
	}
	else {
		getElementsByClassName = function (className, tag, elm) {
			tag = tag || "*";
			elm = elm || document;
			var classes = className.split(" "),
				classesToCheck = [],
				elements = (tag === "*" && elm.all)? elm.all : elm.getElementsByTagName(tag),
				current,
				returnElements = [],
				match;
			for(var k=0, kl=classes.length; k<kl; k+=1){
				classesToCheck.push(new RegExp("(^|\\s)" + classes[k] + "(\\s|$)"));
			}
			for(var l=0, ll=elements.length; l<ll; l+=1){
				current = elements[l];
				match = false;
				for(var m=0, ml=classesToCheck.length; m<ml; m+=1){
					match = classesToCheck[m].test(current.className);
					if (!match) {
						break;
					}
				}
				if (match) {
					returnElements.push(current);
				}
			}
			return returnElements;
		};
	}
	return getElementsByClassName(className, tag, elm);
};

function fixPageBreak(loc){
	if(getElementsByClassName('x-module-1-0','div',loc.document).length > 0) {
		getElementsByClassName('x-module-1-0','div',loc.document)[0].className = getElementsByClassName('x-module-1-0','div',loc.document)[0].className + " x-module-1-0-first";
	}	
	if(getElementsByClassName('x-graphic-1-0','div',loc.document).length > 0) {
		if(getElementsByClassName('x-graphic-1-0','div',loc.document)[0].parentNode.className.indexOf("x-ata-page-block-1-0")!=-1 || getElementsByClassName('x-graphic-1-0','div',loc.document)[0].parentNode.className.indexOf("x-ipc-fig-1-0")!=-1) {
			getElementsByClassName('x-graphic-1-0','div',loc.document)[0].className = getElementsByClassName('x-graphic-1-0','div',loc.document)[0].className + " x-graphic-1-0-first";
		}
	}
	if(getElementsByClassName('x-figure-1-0','div',loc.document).length > 0) {
		if(getElementsByClassName('x-figure-1-0','div',loc.document)[0].parentNode.className.indexOf("x-ata-page-block-1-0")!=-1 || getElementsByClassName('x-figure-1-0','div',loc.document)[0].parentNode.className.indexOf("x-ipc-fig-1-0")!=-1) {
			getElementsByClassName('x-figure-1-0','div',loc.document)[0].className = getElementsByClassName('x-figure-1-0','div',loc.document)[0].className + " x-figure-1-0-first";
		}
	}
}
/* Print only function */
function printonly(frame) {
	addHeaderFooter(frame);
	fixPageBreak(frame);
	frame.print();
}
/* Print preview function */
function printpr(frame) {
	addHeaderFooter(frame);
	addStylesheet(frame);
	var frameset = document.body;
	var frameBody = frame.document.getElementsByTagName('body');
	var contentHTML = frameBody[0].innerHTML;
	var content = document.createElement('body');
	content.innerHTML = contentHTML;
	
	document.documentElement.appendChild(content);
	document.documentElement.removeChild(document.getElementsByTagName('frameset')[0]);
	fixPageBreak(document);
	// catch in case ActiveX is not enabled
	try {
		var OLECMDID = 7;
		/* OLECMDID values:
		* 6 - print
		* 7 - print preview
		* 1 - open window
		* 4 - Save As
		*/
		var PROMPT = 1; // 2 DONTPROMPTUSER 
		var WebBrowser = '<OBJECT ID="WebBrowser1" WIDTH=0 HEIGHT=0 CLASSID="CLSID:8856F961-340A-11D0-A96B-00C04FD705A2"></OBJECT>';
		document.body.insertAdjacentHTML('beforeEnd', WebBrowser); 
		var WebBrowser1 = document.getElementById('WebBrowser1');
		WebBrowser1.ExecWB(OLECMDID, PROMPT);
		WebBrowser1.outerHTML = "";
	}
	catch (e) {
		print();
	}
	document.documentElement.removeChild(document.getElementsByTagName('body')[0]);
	document.documentElement.appendChild(frameset);
	
	document.getElementsByTagName('head')[0].removeChild(document.getElementById('styler'));
	document.getElementsByTagName('head')[0].removeChild(document.getElementById('printer'));
}
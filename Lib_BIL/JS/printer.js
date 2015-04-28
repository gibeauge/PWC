/* For browser compatibility */
function outerHTML(node){
    return node.outerHTML || new XMLSerializer().serializeToString(node);
}

/* Custom print function */
function print_butt(window) {
		if(window.chrome) {
			var chromeContinue=confirm('Please be advised that the Chrome web browser you are using is not 100 per cent effective when printing pages from our online manuals.  As a result, some printed materials may be difficult to read.  We strongly advise you to switch to Internet Explorer if you wish to print pages from our Technical Publications.  \n\nPress "OK" to continue with your current print request, or "Cancel" to abort the print request.');
			if (chromeContinue==false) {
				return;
			}
		}
		var r=confirm('Click "OK" to print with the figures. Otherwise, click "Cancel" to only print the text.');
		if (r==true) {
			var style = document.createElement('style');
			document.body.appendChild(style);
			style.setAttribute('id', 'figureCss');
			style.setAttribute('type', 'text/css');
			var printCss = ' @media print {.x-figure-1-0, .x-graphic-1-0, .x-graphic-2-0, .x-key-1-0 { display:block !important;}  .x--ufe-block-prespace-1-0, a[onclick^="displayGraphics"] > img {display:none !important;} }';
			if(style.styleSheet)	// For IE
				style.styleSheet.cssText = printCss;
			else 
				style.innerHTML = printCss;
		}
		fixPageBreak();
		print();
		
		if(window.chrome) {
			setTimeout(function() {afterPrint(window)},2000);
		}
		else {
			afterPrint(window);
		}
}

/* Function to call after the print is called */
function afterPrint(win) {
	var sheetToBeRemoved = win.document.getElementById('figureCss');
	if(sheetToBeRemoved) {
		var sheetParent = sheetToBeRemoved.parentNode;
		sheetParent.removeChild(sheetToBeRemoved);
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

function fixPageBreak(){
	if(getElementsByClassName('x-module-1-0','div',document).length > 0) {
		getElementsByClassName('x-module-1-0','div',document)[0].className = getElementsByClassName('x-module-1-0','div',document)[0].className + " x-module-1-0-first";
	}	
	if(getElementsByClassName('x-graphic-1-0','div',document).length > 0) {
		if(getElementsByClassName('x-graphic-1-0','div',document)[0].parentNode.className.indexOf("x-ata-page-block-1-0")!=-1 || getElementsByClassName('x-graphic-1-0','div',document)[0].parentNode.className.indexOf("x-ipc-fig-1-0")!=-1) {
			getElementsByClassName('x-graphic-1-0','div',document)[0].className = getElementsByClassName('x-graphic-1-0','div',document)[0].className + " x-graphic-1-0-first";
		}
	}
	if(getElementsByClassName('x-figure-1-0','div',document).length > 0) {
		if(getElementsByClassName('x-figure-1-0','div',document)[0].parentNode.className.indexOf("x-ata-page-block-1-0")!=-1 || getElementsByClassName('x-figure-1-0','div',document)[0].parentNode.className.indexOf("x-ipc-fig-1-0")!=-1) {
			getElementsByClassName('x-figure-1-0','div',document)[0].className = getElementsByClassName('x-figure-1-0','div',document)[0].className + " x-figure-1-0-first";
		}
	}
}

/*
*	Dependecies: utils.js tab.js tree.js
*/

var contentGraphicDisclaimer = 'P&WC Proprietary - subject to restrictions in Technical Data Agreement';

var browserHistory = new Array();

var forward = false;

var back = false;

var position=0;

var reloading = false;

var showTitleAtToolbar = false;

var lastSelectedBookmark ="";

function registerContentWindowLoadEvent(content){
	var elm = searchFrameEl(content);
	
	if (!elm)
		return;
	
	var win = searchFrameWin(content);
	
        if (elm.addEventListener) {		
		elm.addEventListener("load", 
		function (event) {updateToolbar(win);},
		true);							
	} else if (elm.attachEvent) {							
		elm.attachEvent("onload", 
					function (event) {updateToolbar(win);});																										
	} else {
		elm.onload = function (event) {updateToolbar(win);};
	}							
}


var _text;

function setDocumentTitle(title) {
	if (title) {
		
		if (showTitleAtToolbar) {
			var frame = searchFrameWin("toolbar");	
			var doc = getFrameContentDocument(frame);	
			var elm = doc.getElementById("titleText");
			if(elm !=null){
				_text = elm.lastChild;
				if (_text)
					_text.nodeValue = " "+title;
			}			
		}
		
		doc=getFrameContentDocument(top);
		doc.title = title;
	}
}

function enableButton(doc, id) {
	if (!doc)
		return;
	var elm = doc.getElementById(id);
	
	if (elm) {
		elm.className="button_" + id + "_on";
	}
}

function disableButton(doc, id) {
	if (!doc)
		return;
		
	var elm = doc.getElementById(id);
	if (elm) {
		elm.className="button_" + id + "_off";
	}
}

function isButtonEnabled(doc, id) {
	if (!doc)
		return;
		
	var elm = doc.getElementById(id);
	if (elm) {
		return elm.className != "button_" + id + "_off";
	}
	return false;
}

function enableBookmark(doc){
	enableButton(doc, "toolbar_bookmark");
}

function disableBookmark(doc){
	disableButton(doc, "toolbar_bookmark");
}

function enableAnnotation(doc){
	enableButton(doc, "toolbar_annoation");
}

function disableAnnotation(doc){
	disableButton(doc, "toolbar_annotation");
}	

function enableForward(doc){
	enableButton(doc, "toolbar_forward");
}

function disableForward(doc){
	disableButton(doc, "toolbar_forward");
}

function enableBack(doc){
	enableButton(doc, "toolbar_back");
}

function disableBack(doc){
	disableButton(doc, "toolbar_back");
}

function enableNext(doc){
	enableButton(doc, "toolbar_nexttopic");
}

function disableNext(doc){
	disableButton(doc, "toolbar_nexttopic");
}

function enablePrevious(doc){
	enableButton(doc, "toolbar_previoustopic");
}

function disablePrevious(doc){
	disableButton(doc, "toolbar_previoustopic");
}

function enableSync(doc) {
	enableButton(doc, "toolbar_synchronize");
}

function disableSync(doc) {
	disableButton(doc, "toolbar_synchronize");
}

function isSyncEnabled(doc) {
	return isButtonEnabled(doc, "toolbar_synchronize");
}

function loadAnnotation(doc, title) {
	var win = searchFrameWin('annotationFrame');
		
	if (doc && win) {
		var str = "index.jspx?task=ANNOTATION" + 
					  "&url=" + encodeURIComponent(doc.URL) +
					  "&title=" + encodeURIComponent(title);

		//alert(str);				
						  
		win.location.replace(str);
	} 
}


var iid = 0;

function updateToolbar (content, id) {
	clearInterval(iid);
	iid = setInterval("checktoolbar('"+content+"', '"+id+"')", 500);
}

var retry =0;

function checktoolbar(content, id) {	
	var tbar = searchFrameWin("toolbar");
	
	if (tbar.loaded) {
		clearInterval(iid);
	} else {
		return;
	}
		
	var win = searchFrameWin(content);
		
	var title = 0;
		
	if (!win) {
		title = _updateToolbar('_getTitle', id);
	} else {		
		__updateToolbar(win, 0);
	}
}

function _updateToolbar (url, id) {    
    
	if (!id) {
		__updateToolbar (0, 0);
		return;
	}

    var xmlHttpReq = false;
    var self = this;
    // Mozilla/Safari
    if (window.XMLHttpRequest) {
        self.xmlHttpReq = new XMLHttpRequest();
    }
    // IE
    else if (window.ActiveXObject) {
        self.xmlHttpReq = new ActiveXObject("Microsoft.XMLHTTP");
    }
    self.xmlHttpReq.open('POST', url, true);
    self.xmlHttpReq.setRequestHeader('Content-Type', 'application/x-www-form-urlencoded');
    self.xmlHttpReq.onreadystatechange = function() {
        if (self.xmlHttpReq.readyState == 4) {
        	if (self.xmlHttpReq.status == 200) {        	
            	__updateToolbar(0, self.xmlHttpReq.responseText);
            } 
        } 
    }
    self.xmlHttpReq.send("id=" + id);
}


function __updateToolbar (win, title) {
    
	var doc = 0;
	try {
		doc = (win)? getFrameContentDocument(win) : 0;
	} catch (ex) {// an exception will be thrown if document is an external link
		doc = 0;
	}	
	
        var tbar = searchFrameWin("toolbar");
	
	var tdoc = getFrameContentDocument(tbar);
	
	var href = 0;
		
	if (doc) {
		enableBookmark(tdoc);
		enableSync(tdoc);
	} else {
		disableBookmark(tdoc);
		disableSync(tdoc);
		disableAnnotation(tdoc);
	}
	
	try {
		href = (win)? win.location.pathname + win.location.search + win.location.hash : 0;
	} catch (e) {
		href = 0;
	}
	
	if (!href) {
		// do nothing
		// alert("1");
	} else if (tbar.reloading) {
		tbar.reloading = false;
		// alert("2");
		// do nothing
	} else if (tbar.forward) {
		// alert("3");
		tbar.forward = false;
		tbar.position++;
	} else if (tbar.back) {
		// alert("4");
		tbar.back = false;
		tbar.position--;
	} else {
		// alert("5");
		// alert(tbar.browserHistory.length + " " + tbar.position + " " + href);
		// consider moving thorugh alt+ lf arrow and alt+ right arrow	
		if (tbar.browserHistory.length > 0 && href == tbar.browserHistory[browserHistory.length - 1]) {	
			// do nothing
			// alert("6");
		} if (tbar.position < tbar.browserHistory.length && href == tbar.browserHistory[position]) {
			// alt + right arrow
			// alert("7");
			tbar.position++;
		} else if (tbar.position > 1 && href == tbar.browserHistory[position-2]) {
			// alt + left arrow
			// alert("8");
			tbar.position--;
		} else if (tbar.position == 1 && href.indexOf("INTRO") >=0 ) { // back to first page
			// alert("9");
			tbar.position--;		
		} else if (tbar.position == 0 && href.indexOf("INTRO") >=0 ) {
			// alert("10");
			// first time load the page
			// do nothing
		} else {
			// alert("11");
			tbar.position++;
			// alert("Push " + href);
			tbar.browserHistory.push(href);
		}
	}
	
	var t = (title)? title : (doc)? doc.title : "";
	if( t == null || t == "" ) {
		t = (doc)? retrieveTitle(doc.URL) : "";
        }
            
        var titlePrefix = "";
        var pwcMetaInfo = doc.getElementById("pwcmetainfo");
        if (pwcMetaInfo != null) {
            var metaInfo = doc.getElementsByTagName("body")[0];
            setGlobalsFromMeta(metaInfo.innerHTML);
            pwcPartNumber = metaManualServiceBulletinNo;
            if (metaChapter == "frontmatter") {
                titlePrefix = metaModelNo;
            }
            else {
                titlePrefix = metaModelNo + " " + metaChapter + '-' + 
                metaSection + '-' + metaSubject + " ";
            }
        }
        else {
            titlePrefix = doc.getElementById("manualTitle").innerHTML + " " + doc.getElementById("manualPn").innerHTML;
        }
        bannerdoc = top.frames[0].document;
        if (doc.getElementById("pwcbannerinfo") != null && bannerdoc.getElementById("manualType") != null) {
            var rev = doc.getElementById("revision").innerHTML;
            var pointRev = doc.getElementById("pointRev").innerHTML;
/*          rev and pointRev now always in banner 
 *          var revStr = rev == "0" ? "" : ", Revision No. " + rev;
 *          revStr += pointRev == "0" ? "" : "." + pointRev;
*/
            var revStr = ", Revision No. " + rev + "." + pointRev;
            bannerdoc.getElementById("manualType").innerHTML = doc.getElementById("manualTitle").innerHTML;
            var partNumOrig = doc.getElementById("engine").innerHTML;
            // remove Build Specification No. (num) from engine
            var buildId = "Build Specification No. ";
            if (partNumOrig.search(buildId) == -1) {
                partNum = partNumOrig;
            }
            else {
                var buildStr = partNumOrig.split(buildId)[1];
                var numStr = buildStr.split(" ",1)[0];
                var replStr = buildId + numStr;
                var partNum = partNumOrig.replace(replStr,"");
            }
            /* mod by GB
            if (pwcMetaInfo != null) {
                var pbn = metaPbn == "title-page" ? "" : metaPbn;
                partNum = partNum + ' ' + pbn;
            }
            */
            
            bannerdoc.getElementById("manPartNum").innerHTML = partNum.toUpperCase();
            var ef = doc.getElementById("manualPn").innerHTML + 
            revStr + ', Dated ' + convertDate(doc.getElementById("revDate").innerHTML);
            bannerdoc.getElementById("engineFamily").innerHTML = ef;
        }
        
        setDocumentTitle(titlePrefix + " " + t);
	top.document.title = t;
        
	if (doc) {
		if (tbar.showbookmark == 'true') {
			loadAnnotation(doc, t);
		} 
		
		if (isShowId(top.location.search)) {
			if (top && top.document) {
			  top.document.title = t;
			}
		}
		toggleAnnotationFrameState('annotationFrame', false);
	} else {
		toggleAnnotationFrameState('annotationFrame', true);
	}
	
	// alert("history size: " + tbar.browserHistory.length + " position: " + tbar.position);
	
	if (tbar.position > 0) {
		enableBack(tdoc);
	} else {
		disableBack(tdoc);
	}
	
	if (tbar.position < tbar.browserHistory.length) {
		enableForward(tdoc);
	} else {
		disableForward(tdoc);
	}
	
	if (win)
		updateNavStatus(win.location.pathname + win.location.hash, tdoc);
}


function updateNavStatus(path, tbardoc) {

	
    var xmlHttpReq = false;
    var self = this;
    // Mozilla/Safari
    if (window.XMLHttpRequest) {
        self.xmlHttpReq = new XMLHttpRequest();
    }
    // IE
    else if (window.ActiveXObject) {
        self.xmlHttpReq = new ActiveXObject("Microsoft.XMLHTTP");
    }
    self.xmlHttpReq.open('POST', '_getNavStatus', true);
    self.xmlHttpReq.setRequestHeader('Content-Type', 'application/x-www-form-urlencoded');
    self.xmlHttpReq.onreadystatechange = function() {
        if (self.xmlHttpReq.readyState == 4) {
        	if (self.xmlHttpReq.status == 200) {        	
            	_updateNavStatus(self.xmlHttpReq.responseText, tbardoc);
            } else {
            	alert("Cannot locate current topic location");
            }
        } 
    }
    self.xmlHttpReq.send("path=" + path);

}

function _updateNavStatus(status, tbardoc) {
	
	if ("11" == status) {
		enablePrevious(tbardoc);
		enableNext(tbardoc);
	} else if ("01" == status) {
		disablePrevious(tbardoc);
		enableNext(tbardoc);
	} else if ("10" == status) {
		enablePrevious(tbardoc);
		disableNext(tbardoc);
	} else {
		disablePrevious(tbardoc);
		disableNext(tbardoc);	
	}

}

function isShowId(query) {
	if (query) {
		//alert(query);
		return true;
	}
	return false;	
}

function retrieveTitle (url) {

	var idx = url.lastIndexOf('/');
	if (idx != -1) {
		url = url.substr(idx+1);
	}
	idx = url.lastIndexOf('?');
	if (idx != -1) 
		url = url.substr(0, idx);
		
	idx = url.lastIndexOf('.');
	
	if (idx != -1) {
		url = url.substr(0, idx);
	}	
	
	return decodeURIComponent(url);	
}

function goBack(framename) {

	if (position == 0)
		return;

	back = true;
	var win = searchFrameWin(framename);
	if (win) {
		if (position == 1)
			win.location.replace(homepage);
		else	
			win.location.replace(browserHistory[position-2]);
	} else {
		window.history.back();
	}
}

function goHome(framename, url) {
	if (position == 0)
		return;

	var win = searchFrameWin(framename);
	if (win) {
		win.location.href = url;
	} else {
		window.location.href = url;
	}
}

function goForward(framename) {	
	if (position == browserHistory.length)
		return;

	forward = true;
	var win = searchFrameWin(framename);
	
	if (win) {
		win.location.replace(browserHistory[position]);
	} else {
		window.history.forward();
	}
}

function reload(framename) {
	reloading = true;
	
	var win = searchFrameWin(framename);
	if (win) {
		win.location.reload();
	} else {
		window.location.reload();
	}
}

function previousTopic(doc, framename, tabid, tocview, toctoolbar){		
    if (isButtonEnabled(doc, "toolbar_previoustopic")) {
		synchronize(framename, tabid, 'tabs', 'viewsFrame', tocview, 'tabToolbarFrame', toctoolbar, 'ajaxid', "prev");
		goTopic(framename, "prev");
		
	}
}

function nextTopic(doc, framename, tabid, tocview, toctoolbar){
	if (isButtonEnabled(doc, "toolbar_nexttopic")) {
		synchronize(framename, tabid, 'tabs', 'viewsFrame', tocview, 'tabToolbarFrame', toctoolbar, 'ajaxid', "next");
		goTopic(framename, "next");		
	}
}

function goTopic(framename, direction){
	var win = searchFrameWin(framename);
	
	if (!win) {
		alert("Cannot locate frame: " + framename);
		return;
	}
	
	var path = win.location.pathname + win.location.hash;
	
	var url = "_getTopic?task=" + direction + "&path=" + encodeURIComponent(path);
	
	if (win) {
		win.location.href = url;
	} else {
		window.location.href = url;
	}
}

function pwcCurrentDate() {
    // This function returns the current Date in PWC's specific format, which is: DD MM/YY
    //
    var today = new Date();
    var enMonths=['JAN','FEB','MAR','APR','MAY','JUN','JUL','AUG','SEP','OCT','NOV','DEC'];
    var fullYear = today.getFullYear().toString();
    
    return today.getDate() + ' ' + enMonths[today.getMonth()] + '/' + fullYear.substring(2);
}

/* Added by F.Allard (pw50104) for print preview */

/* Show or hides (depending on styleTo) the tables that toggle through a link */
function printTables(win,styleTo) {
    var doc = win.document;
    var allLinks = doc.getElementsByTagName('a');
    var re = /toggle\('(.*)','.*'\)/;
    for (var i = 0; i < allLinks.length; i++) {
        if (allLinks[i].onclick != null) {
			results = allLinks[i].outerHTML.match(re);
			if(results !=null) {
				table = win.document.getElementById(results[1]);
				if(table) {
					table.style.display = styleTo;
				}
			}
        }
    }
}

/* Returns the version of Internet Explorer or a -1
  (indicating the use of another browser). */
function getInternetExplorerVersion()
{
  var rv = -1; // Return value assumes failure.
  if (navigator.appName == 'Microsoft Internet Explorer')
  {
    var ua = navigator.userAgent;
    var re  = new RegExp("MSIE ([0-9]{1,}[\.0-9]{0,})");
    if (re.exec(ua) != null)
      rv = parseFloat( RegExp.$1 );
  }
  return rv;
}

/* Load the printer script */
function loadScript(scriptId, scriptUrl) {
	if (top.top.document.getElementById(scriptId) == null) {
		var script = top.top.document.createElement('script');
		top.top.document.getElementsByTagName('head')[0].appendChild(script);
		script.setAttribute('type', 'text/javascript');
		script.setAttribute('id', scriptId);
		script.setAttribute('src', scriptUrl);
	}
}
loadScript('printer-script','_templates/frame/javascript/printer.js');

/* Load the printer CSS */
function loadAdditionalCSS(loc, stylesheetId, stylesheetUrl) {
	if (loc.document.getElementById(stylesheetId) == null) {
		if (document.createStyleSheet) {
			loc.document.createStyleSheet(stylesheetUrl,0);
			var stylesheet = loc.document.getElementsByTagName('head')[0].getElementsByTagName('link')[0];
			stylesheet.setAttribute('id', stylesheetId);
		}
		else {
			var stylesheet = loc.document.createElement('link');
			loc.document.getElementsByTagName('head')[0].appendChild(stylesheet);
			stylesheet.setAttribute('id', stylesheetId);
			stylesheet.setAttribute('rel', 'stylesheet');
			stylesheet.setAttribute('href', stylesheetUrl);
		}
	}
}

/* Resize every table to 90% to avoid text clipping on printing */
function resizeTable(win) {
	try {
		var tables = win.document.getElementsByTagName('table');
		for (var i = 0; i < tables.length; i++) {
			var table = tables[i];
			if (table.width == "100%") {
				table.width = "90%"
			}	
		}
	}
	catch (e) {
		alert("Error resizing tables");
	}	
}
/* Function to call after the print is called */
function afterPrint(win) {
	var sheetToBeRemoved = win.document.getElementById('figureCss');
	if(sheetToBeRemoved) {
		var sheetParent = sheetToBeRemoved.parentNode;
		sheetParent.removeChild(sheetToBeRemoved);
	}
	printTables(win,'none'); // hide all the tables after printing*/
}
/* Custom print function */
function print(framename) {
	var win = searchFrameWin(framename);
	if (win) {
		if(window.chrome) {
			var chromeContinue=confirm('Please be advised that the Chrome web browser you are using is not 100 per cent effective when printing pages from our online manuals.  As a result, some printed materials may be difficult to read.  We strongly advise you to switch to Internet Explorer if you wish to print pages from our Technical Publications.  \n\nPress "OK" to continue with your current print request, or "Cancel" to abort the print request.');
			if (chromeContinue==false) {
				return;
			}
		}
		win.focus();
		resizeTable(win);
		loadAdditionalCSS(win, 'printer-css','_templates/frame/css/printer.css');
		var r=confirm('Click "OK" to print with the figures. Otherwise, click "Cancel" to only print the text.');
		if (r==true) {
			var style = document.createElement('style');
			win.document.body.appendChild(style);
			style.setAttribute('id', 'figureCss');
			style.setAttribute('type', 'text/css');
			var printCss = ' @media print {.x-figure-1-0, .x-graphic-1-0, .x-graphic-2-0, .x-key-1-0 { display:block !important;}  .x--ufe-block-prespace-1-0, a[onclick^="displayGraphics"] > img {display:none !important;} }';
			if(style.styleSheet)	// For IE
				style.styleSheet.cssText = printCss;
			else 
				style.innerHTML = printCss;
		}
		printTables(win,'block'); //show all the tables for printing
		if(getInternetExplorerVersion() >= 7) {	// Print preview for IE7+ only
			top.top.printpr(win);
		}
		else {	// Otherwise, only print
			top.top.printonly(win);
			//win.print();
		}
		// Add a timeout for Google's Chrome to prevent the table and figure to be removed before the print function is fully called
		if(window.chrome) {
			setTimeout(function() {afterPrint(win)},2000);
		}
		else {
			afterPrint(win);
		}
	} else {
		alert("Printing is not supported for this document.");
	}
}
/* End of additional code */

function update(framename) {
	var win = searchFrameWin(framename);
	if (win) {
		win.focus();
		win.location.href = "_update";
	} else {
		alert("Unable to run update process. The process is aborted.");		
	}
}

function help(framename) {
	var win = searchFrameWin(framename);
	if (win) {
		win.focus();
		win.location.href = "index.jspx?task=HELP";
	} else {
		alert("Cannot open help content.");		
	}
}

function about(framename) {
	var win = searchFrameWin(framename);
	if (win) {
		win.focus();
		win.location.href = "index.jspx?task=ABOUT";
	} else {
		alert("Cannot open help content.");		
	}
	
	
}

function populateFormFields(form, contentFrame) {
	if (!form)
		return true;
	
	var win = searchFrameWin(contentFrame);
	
	if (!win)
		return true;
		
	// set url
	var url = win.location.href;
	
	if (form.url)
		form.url.value = url;
		
	var doc = getFrameContentDocument(win);
		
	if (!doc)
		return true;	
	
	// set title
	var title = doc.title;
	
	if (form.title) {
		if (title)
			form.title.value = title;
		else 
			form.title.value = url;
	}
	
	return true;

}

function toggleNavpane(doc, framesetname) {

	if (isButtonEnabled(doc, "toolbar_navpane")) {
		disableButton(doc, "toolbar_navpane");
		var frameset = searchFrameEl(framesetname);
		if (frameset) {
			frameset.setAttribute("cols", "300, *");
		}
		
	} else {
		enableButton(doc, "toolbar_navpane");
		var frameset = searchFrameEl(framesetname);
		if (frameset) {
			frameset.setAttribute("cols", "0, *");
		}
            }
// LB - removed because changes in rev bars to highlights makes reloading unnecessary            
//            reload("content");

}

function toggleShowAnnotation(doc, id, contentFrameset, annotationFrame, animation, minsize, maxsize) {
	
	if (!isButtonEnabled(doc, id))
  		return;
  	
	var contentdoc = 0;
	var contentframe = 0;
	try {
		contentframe = searchFrameWin('content');
	
		if (!contentframe)
			return;
			
		contentdoc = getFrameContentDocument(contentframe);
	} catch (ex) {// an exception will be thrown if document is an external link
		contentdoc = 0;
	}	
	
	if (!contentdoc) {
		alert("Commenting is not supported for this document.");
		return;
	} 
	
	var frame = searchFrameEl(annotationFrame);
	var elm = null;
	
	if (frame) {
		var doc = getFrameContentDocument(frame);
		elm = (doc)? doc.getElementById('annotation') : null;
		if (frame.className == "show") {
			frame.className = "hidden";
			adjustFrameSize(contentFrameset, annotationFrame, animation, minsize, 0, false);
			if (!animation && elm && !elm.disabled)
				elm.blur();
		} else {
			frame.className = "show";
			adjustFrameSize(contentFrameset, annotationFrame, animation, maxsize, 20, false);
			if (!animation && elm && !elm.disabled)
				elm.focus();
		}
	}
}


function showAnnotation(contentFrameset, annotationFrame, minsize, maxsize, hide) {
	var frame = searchFrameEl(annotationFrame);
	var elm = null;
	
	if (frame) {
		var doc = getFrameContentDocument(frame);
		elm = (doc)? doc.getElementById('annotation') : null;
		if (hide) {			
			frame.className = "hidden";
			adjustFrameSize(contentFrameset, annotationFrame, false, minsize, 0, false);
		} else {
			frame.className = "show";
			adjustFrameSize(contentFrameset, annotationFrame, false, maxsize, 20, false);
		}
	}
}

function clearAnnotation(annotationFrame) {
	var frame = searchFrameWin(annotationFrame);
	
	if (frame) {
		var doc = getFrameContentDocument(frame);
		if (!doc)
			return;

		var form = doc.annotationForm;
		if (!form)
			return;
			
		form.annotation.value="";

	}
}

function toggleAnnotationFrameState(annotationFrame, disabled) {
	var frame = searchFrameWin(annotationFrame);
	var elm = null;
	
	if (frame) {
		var doc = getFrameContentDocument(frame);
		if (!doc)
			return;

		var form = doc.annotationForm;
		if (!form)
			return;
			
		//for (var i=0; i < form.elements.length; i++) {
		form.annotation.value="";
		form.annotation.disabled = disabled;
		form.submit.disabled = disabled;
		form.clear.disabled = disabled;
		//}

	}
}

var intervalId = 0;

function registerBookmarkEvents(bookmark) {

	// have to wait the bookmark page full loaded before setting the listener
	intervalId = setInterval("_registerBookmarkEvents('"+bookmark+"')", 500);
}

function _registerBookmarkEvents(bookmark) {

	lastSelectedBookmark="";

	var elm = searchFrameEl(bookmark);

	if (!elm)
		return;
	
	var win = searchFrameWin(bookmark);
	
	if (!win)
		return;	

	if (!win.loaded) {
		return;
	} else {
		clearInterval(intervalId);
	}

	updateBookmarkToolbarSelf(bookmark);
				
	if (elm.addEventListener) {		
		elm.addEventListener("load", 
		function (event) {updateBookmarkToolbar(win);},
		true);		
		elm.addEventListener("focus", 
		function (event) {updateBookmarkToolbar(win);},
		true);									
	} else if (win.document.attachEvent) {							
		elm.attachEvent("onload", 
					function (event) {updateBookmarkToolbar(win);});							
		elm.attachEvent("onfocus", 
					function (event) {updateBookmarkToolbar(win);});																															
	} else {
		elm.onload = function (event) {updateBookmarkToolbar(win);};	
		elm.onfocus = function (event) {updateBookmarkToolbar(win);};		
	}				

}

function updateBookmarkToolbarSelf(bookmark) {

	var win = searchFrameWin(bookmark);
	
	if (!win)
		return;	
		
	updateBookmarkToolbar(win);
}

function updateBookmarkToolbar(win) {
	
	if (!win)
		return;
		
	var nodes = win.document.getElementsByTagName("a");
	if (nodes && nodes.length > 0) {
		enableDeleteBookmarkAll(document);
	} else {
		disableDeleteBookmarkAll(document);
	}	
	
	if (!lastSelectedBookmark)
		disableDeleteBookmark(document);
	
}

function setLastClicked(e, win) {
	e = (e)? e : ((event)? event : null);
	
	if (!e) {
		return;
	}
	
	var elem = (e.srcElement)? e.srcElement : 
							(e.target)? e.target : (e.currentTarget)? e.currentTarget : null;
							
	if (elem) {
		var previous = win.document.getElementById("selected__");
		if (previous)
			previous.id="";		
		elem.id = "selected__";
		
		lastSelectedBookmark = elem.className;
		
		enableDeleteBookmark(document);
	}								
	
}

function setLastClickedElement(e, bookmark_toolbar) {
	e = (e)? e : ((event)? event : null);
	
	if (!e) {
		return;
	}
	
	var elem = (e.srcElement)? e.srcElement : 
							(e.target)? e.target : (e.currentTarget)? e.currentTarget : null;
	
	if (elem) {
		var previous = elem.ownerDocument.getElementById("selected__");
		if (previous)
			previous.id="";		
		elem.id = "selected__";
				
		if (bookmark_toolbar) {
			var win = searchFrameWin(bookmark_toolbar);		
			if (win) {
				var doc = getFrameContentDocument(win);
				win.lastSelectedBookmark = elem.className;
				win.enableDeleteBookmark(doc);
			}
		}
		
	}				
}


function enableDeleteBookmarkAll(doc){
	enableButton(doc, "toolbar_bkmk_delete_all");
}

function disableDeleteBookmarkAll(doc){
	disableButton(doc, "toolbar_bkmk_delete_all");
}

function enableDeleteBookmark(doc){
	enableButton(doc, "toolbar_bkmk_delete");
}

function disableDeleteBookmark(doc){
	disableButton(doc, "toolbar_bkmk_delete");
}

function addBookmark(doc, id, contentframe, tabId, tabsframe, viewsframe, view, tabToolbarFrame, toolbar) {

  if (!isButtonEnabled(doc, id))
  	return;
    
  var contentEl = searchFrameEl(contentframe);
  
  var contentWin = searchFrameWin(contentframe);
  
  var frameWin = searchFrameWin(view);
  
  if (contentEl && frameWin) { 	  
  
	  var doc = getFrameContentDocument(contentEl);
	  	  
	  if (!doc && !contentWin)
	  	return;
	  
	  var url = (doc)? doc.URL : contentWin.location.href;
	  
	  var title = (doc && doc.title)? doc.title : retrieveTitle(url);
	  
      var query = "index.jspx?task=BOOKMARK&operation=add" + 
				"&title=" + encodeURIComponent(title) + 
				"&url=" + encodeURIComponent(url) +
				"&annotationType=bookmark";
	  
	  frameWin.location.replace(query);
	  
	  clickOnTab(tabId, tabsframe, viewsframe, view, tabToolbarFrame, toolbar);	  
	  	
  } else {
  	  alert("Can not locate frame: \"" + view + "\" for bookmark.");
	  return true;
  }
	
}

function deleteBookmark (view, contentFrame, message) {

  if (!isButtonEnabled(document, "toolbar_bkmk_delete"))
  	return;

  var frameWin = searchFrameWin(view);
  if (frameWin) {
  	var doc = getFrameContentDocument(frameWin);
  	if (doc && doc.documentElement) {
  		  var url = lastSelectedBookmark; //doc.documentElement.getAttribute("__bookmark");
  		  if (url) {
	    	  var query = "index.jspx?task=BOOKMARK&operation=remove" + 
			      "&url=" + encodeURIComponent(url);    
			  frameWin.location.replace(query);	
			  lastSelectedBookmark = "";
			  //disableDeleteBookmark();
		  } else {
		  	  alert(message);
		  	  return false;
		  }
	 }
  }

  return true;
}

function reloadToolbar(content) {
						
    var content = searchFrameWin(content);
	
	if (content)
		content.location.reload();	
}


function deleteAllBookmarks (view, contentFrame, message) {

  if (!isButtonEnabled(document, "toolbar_bkmk_delete_all"))
  	return;
  	
  var frameWin = searchFrameWin(view);  
  if (frameWin) { 	  
  	  if (confirm(message)) {
	      var query = "index.jspx?task=BOOKMARK&operation=removeAll";
		  frameWin.location.replace(query);	
		  // make sure that no single bookmark is selected
		  lastSelectedBookmark = "";
	      //disableDeleteBookmarkAll();	  
	  }	else {
	  	return false;
	  }  
  } 

  return true;
}



function synchronize(contentframe, tabId, tabsframe, viewsframe, view, tabToolbarFrame, toolbar, url, task) {

  var tbar = searchFrameWin("toolbar");
  var tdoc = getFrameContentDocument(tbar);

  if (!isSyncEnabled(tdoc))
  	return;

  var contentEl = searchFrameEl(contentframe);
  
  var contentWin = searchFrameWin(contentframe);
  
  var frameWin = searchFrameWin(view);
  
  var pathname = 0;
  
  try {
  	pathname = contentWin.location.pathname + contentWin.location.hash;  
  } catch (e) {
  	pathname = 0;  
  }
  
  if (!pathname) {
  	disableSync(tdoc);
  	return;
  }
  
  if (contentEl && frameWin) { 	  
  	try {
	  var doc = getFrameContentDocument(contentEl);	  	  
	  clickOnTab(tabId, tabsframe, viewsframe, view, tabToolbarFrame, toolbar);	
	  openDocByAJax(frameWin, url, encodeURI(pathname), doc.URL, task);  	   	  	  	  
	} catch (e) {
	  // disableSync();
	}
  } else {
  	  alert("Can not locate frame: \"" + view + "\" for toc.");
	  return true;
  }

  // disableSync();
}


function notifyAnnotationStatus(doc, annotationid, toolbarframe, annotationImgId) {			
		if (doc) {			
			var annotationDoc = doc.getElementById(annotationid);
			var elm = searchFrameEl(toolbarframe);
			if (elm) {
				var elmDoc = getFrameContentDocument(elm);
				if (elmDoc) {
					if (annotationDoc && (annotationDoc.lastChild && annotationDoc.value)) {
						var img = elmDoc.getElementById(annotationImgId);
						if (img) {
							img.className = "button_" + annotationImgId + "_on";				
						}
						showAnnotation("contentFrameset", "annotationFrame", 30, 150, false);
					} else {
						var img = elmDoc.getElementById(annotationImgId);
						if (img) {
							img.className = "button_" + annotationImgId + "_inactive";
						} 
						showAnnotation("contentFrameset", "annotationFrame", 30, 150, true);
					}	
				}
			} 
		}	


	return false;
}


function openDocByAJax (win, url, path, fullpath, task) {
    var xmlHttpReq = false;
    var self = this;
    // Mozilla/Safari
    if (window.XMLHttpRequest) {
        self.xmlHttpReq = new XMLHttpRequest();
    }
    // IE
    else if (window.ActiveXObject) {
        self.xmlHttpReq = new ActiveXObject("Microsoft.XMLHTTP");
    }
    self.xmlHttpReq.open('POST', url, true);
    self.xmlHttpReq.setRequestHeader('Content-Type', 'application/x-www-form-urlencoded');
    self.xmlHttpReq.onreadystatechange = function() {
        if (self.xmlHttpReq.readyState == 4) {
        	if (self.xmlHttpReq.status == 200) {        	
            	openDoc(win, self.xmlHttpReq.responseText, path, fullpath);
            } else {
            	showPath(win, fullpath, false, false);
            }
        } 
    }
    if (task)
	    self.xmlHttpReq.send("path=" + path+"&task=" + task);
	else    
		self.xmlHttpReq.send("path=" + path);
}

function openDoc(win, xml, path, fullpath) {
	var id = xml;	
	if (id == "-1") {
		showPath(win, fullpath);
	} else {
		showId(win, id);
	}
}



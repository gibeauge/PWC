function searchFrameWin(frameid) {
	return _searchFrameWin(top.frames, frameid);
}

function searchFrameEl(frameid) {
	return _searchFrameEl(top.frames, frameid);
}


/**
* Search frame/iframe with the given name in the given frames and their children
* First match will be returned.
*
*/
function _searchFrameWin(frames, frameid) {
	try {
		for (var i = 0; i < frames.length; i++) {
			var frame = frames[i];
			if (frame.name == frameid || frame.document.id == frameid) {
				return frame;
			} else {
				frame = _searchFrameWin(frame.frames, frameid);
				if (frame)
					return frame;
			}			
		}
	}
	catch (e) {
		return null;
	}	
}


/**
* Search frame/iframe element with the given name in the given frames and their children
* First match will be returned.
*
*/
function _searchFrameEl(frames, frameid) {
	
	for (var i = 0; i < frames.length; i++) {
				
		var frame = frames[i];
		
		var doc = frame.document;
		
		var frameEl = (doc)? doc.getElementById(frameid) : null;
		
		if (frameEl)
			return frameEl;
		else	{
			frameEl = _searchFrameEl(frame.frames, frameid);
			if (frameEl)
				return frameEl;
		}
	}
		
	return null;
}


function getWindowHeight(win) {
  var myHeight = 0;
  
  if( typeof( win.innerWidth ) == 'number' ) {
    //Non-IE
    myHeight = win.innerHeight;
  } else if( win.document.documentElement &&
      ( win.document.documentElement.clientWidth || win.document.documentElement.clientHeight ) ) {
    //IE 6+ in 'standards compliant mode'
    myHeight = win.document.documentElement.clientHeight;
  } else if( win.document.body && ( win.document.body.clientWidth || windocument.body.clientHeight ) ) {
    //IE 4 compatible
    myHeight = win.document.body.clientHeight;
  }

  return myHeight;
}


function getWindowWidth(win) {
  var myWidth = 0;
  
  if( typeof( win.innerWidth ) == 'number' ) {
    //Non-IE
    myWidth = win.innerWidth;
  } else if( win.document.documentElement &&
      ( win.document.documentElement.clientWidth || win.document.documentElement.clientHeight ) ) {
    //IE 6+ in 'standards compliant mode'
    myWidth = win.document.documentElement.clientWidth;
  } else if( win.document.body && ( win.document.body.clientWidth || win.document.body.clientHeight ) ) {
    //IE 4 compatible
    myWidth = win.document.body.clientWidth;
  }
  
  return myWidth;
}


function getFrameContentDocument(frame) {
	if (!frame) 
		return null;		
	try {	
		return (frame.contentDocument)? frame.contentDocument : (frame.contentWindow)? frame.contentWindow.document 
	: (frame.document)? frame.document : null;				
	} catch (e) {
		return null;
	}
}


function getFirstLevelChildByElementName(elm, name) {

	name = name.toLowerCase();

	if (elm.tagName) {
		if (name == elm.tagName.toLowerCase())
			return elm;
	}
	elm = elm.firstChild;			

	while (elm) {
		if (elm.tagName) {
			if (name == elm.tagName.toLowerCase())
				return elm;
		}
		elm = elm.nextSibling;					
	}
	
	return null;
}

function getFirstChildByElementName(elm, name) {

	name = name.toLowerCase();

	while (elm) {
		if (elm.tagName) {
			if (name == elm.tagName.toLowerCase())
				return elm;
		}
		elm = elm.firstChild;			
	}
	
	return null;
}

function getFirstTextChild(elm) {
	while(elm) {
		if (elm.nodeType == 3)
			return elm;
		elm = elm.firstChild;	
	}

	return "";	
}
//<!--

   //var ATI_NODE_PREFIX = "__ati:";
   //var ATI_ANCHOR_ARRAY = new Array();




function findATIAnchor (name) {
   for (var i = 0; i < ATI_ANCHOR_ARRAY.length; i++) {
	var a = ATI_ANCHOR_ARRAY[i];
        if (a.name == name) {
	    return a;
         }
   }
   return null;
}

function findFirstATIAnchor () {

   for (var i = 0; i < ATI_ANCHOR_ARRAY.length; i++) {
	var a = ATI_ANCHOR_ARRAY[i];
        if (a != null) {
	    return a;
         }
   }
   return null;
}

function findNextATIAnchorName (name) {

   for (var i = 0; i < ATI_ANCHOR_ARRAY.length; i++) {
	var a = ATI_ANCHOR_ARRAY[i];
 
        if (a.name == name) {
 
	    if (i < (ATI_ANCHOR_ARRAY.length - 1)) {
		return "#"+ATI_ANCHOR_ARRAY[i+1].name;
            }
         }
   }
   return "#"+name;

}

function findNextATIAnchor (name) {
   for (var i = 0; i < ATI_ANCHOR_ARRAY.length; i++) {
	var a = ATI_ANCHOR_ARRAY[i];
 
        if (a.name == name) {
 
	    if (i < (ATI_ANCHOR_ARRAY.length - 1)) {
		return ATI_ANCHOR_ARRAY[i+1];
            }
         }
   }
   return null;

}

function findPreviousATIAnchorName (name) {

   for (var i = 0; i < ATI_ANCHOR_ARRAY.length; i++) {
	var a = ATI_ANCHOR_ARRAY[i];
 
        if (a.name == name) {
 
	    if (i > 0) {
		return "#"+ATI_ANCHOR_ARRAY[i-1].name;
            }
         }
   }
   return "#"+name;

}



function findPreviousATIAnchor (name) {
   for (var i = 0; i < ATI_ANCHOR_ARRAY.length; i++) {
	var a = ATI_ANCHOR_ARRAY[i];
 
        if (a.name == name) {
 
	    if (i > 0) {
		return ATI_ANCHOR_ARRAY[i-1];
            }
         }
   }
   return null;

}


function goToFirstAnchor(){
   var a = findFirstATIAnchor();
   goToAnchor(a);
}

function goToAnchor(a) {
   if (a != null) {
     window.scrollTo(a.offsetLeft, a.offsetTop);
     anchorFocus(a);
   }
}

function goToNextATIAnchor(name){
   var nextAnchor = findNextATIAnchor(name);
   if (nextAnchor != null) {
     goToAnchor(nextAnchor);
   }
}

function goToPreviousATIAnchor(name){
   var prevAnchor = findPreviousATIAnchor(name);
   if (prevAnchor != null) {
     goToAnchor(prevAnchor);
   }
}



function getATIAnchors () {
   var ar = new Array();
   var count = 0;
   for (var i = 0; i < document.anchors.length; i++) {
	var a = document.anchors[i];
        if (a.name.indexOf(this.ATI_NODE_PREFIX) != -1) {
	    ar[count++] = a;
         }
   }
   return ar;
}

function anchorFocus(a) {
   if (a) {
      a.focus();
   } 
}


function onClick2 (name) {
    if (keydown) {
	return findPreviousATIAnchorName(name);
    } else {
        return findNextATIAnchorName(name);
    }
}


function onClick (e) {
   e = (e)? e : ((event)? event : null);

   if (!e) 
   	return;
   
  	var elm = (e.srcElement)? e.srcElement : e.target;  	
  	var name = (elm)? elm.name : null;
  	if (!name)
  		return;
    if (e.altKey) {
       goToPreviousATIAnchor(name);
    } else {
       goToNextATIAnchor(name);
    }
 
}



function onFocus (e) {
   e = (e)? e : ((event)? event : null);

   if (!e) 
   	return;
   
   var elm = (e.srcElement)? e.srcElement : e.target;  
   if (elm) {
      elm.style.border = "outset 2px";
   } 
}

function onBlur (e) {
   e = (e)? e : ((event)? event : null);

   if (!e) 
   	return;
   	
   var elm = (e.srcElement)? e.srcElement : e.target;  
   if (elm) {
      elm.style.border = "none";
   } 
}


// Key press handler designed for cross platform use
function keyDown(e)
   {
      keydown = 1;
   }
   

   
   // Key press handler designed for cross platform use
function keyUp(e)
   {
      keydown = 0;
   }
   

function ATI () {
   this.ATI_NODE_PREFIX = "ATI.";
   this.ATI_ANCHOR_ARRAY = new Array();
   this.keydown = 0;
   var count = 0;
   for (var i = 0; i < document.anchors.length; i++) {
	var a = document.anchors[i];
        if (a.name.indexOf(ATI_NODE_PREFIX) != -1) {
	    ATI_ANCHOR_ARRAY[count++] = a;
         }
   }

   this.goToFirstAnchor();

   // Register event handler for Netscape
   if (document.captureEvents)
   {
      document.captureEvents(Event.KEYDOWN);
      document.captureEvents(Event.KEYUP);
   }

   // Register event handler 
   document.onkeydown = keyDown;
   document.onkeyup = keyUp;
}

ATI.goToFirstAnchor = goToFirstAnchor;
ATI.findATIAnchor = findATIAnchor;
ATI.findFirstATIAnchor = findFirstATIAnchor;
ATI.findNextATIAnchor = findNextATIAnchor;
ATI.findNextATIAnchorName = findNextATIAnchorName;
ATI.findPreviousATIAnchor = findPreviousATIAnchor;
ATI.findPreviousATIAnchorName = findPreviousATIAnchorName; 
ATI.goToFirstAnchor = goToFirstAnchor;
ATI.goToAnchor = goToAnchor;
ATI.goToNextATIAnchor = goToNextATIAnchor;
ATI.goToPreviousATIAnchor = goToPreviousATIAnchor;
ATI.anchorFocus = anchorFocus;
ATI.onClick = onClick;
ATI.onClick2 = onClick2;
ATI.onFocus = onFocus;
ATI.onBlur = onBlur;


function onLoad() {
  ATI();
}


// -->
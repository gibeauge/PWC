
function clobberUnlinkableAnchors() {
    var aElements = document.getElementsByTagName("a");
    var sbPat = new RegExp("s(b|pb)Link");
    for (var aNum = 0; aNum < aElements.length; aNum++) {
        var aEle = aElements[aNum];
        var aEleParent = aEle.parentNode;
        var aEleParentParent = aEleParent.parentNode;
        if (aEleParent.className == "x--sfe-CrossReference-1-0" && 
            (aEleParentParent.className == "x-refint-2-0" || 
             aEleParentParent.className == "x-xref-5-0")) {
            aEle.removeAttribute("href");
        
        }
        // if running in Offline mode, remove the link to any sbLinks or spbLinks
        // also need to clobber the class of the parent element, since it is set to blue underline
        // which implies a link.
        if (document.location.href.search("localhost") >= 0) {
            if (typeof aEle.onclick != "undefined") {
                var evOnClick = String(aEle.onclick);
                if (evOnClick.search(sbPat) >= 0) {
                    aEle.onclick = null;
                    aEleParent.removeAttribute("className");
                    aEle.removeAttribute("href");
               }
            }
        }
    }
}

//Add change bars to table rows 
function addTableChangebarsByDocument(doc){
    var rows = doc.getElementsByTagName("tr");
                
    for(var tr = 0; tr < rows.length; tr++){
        var row = rows[tr];
        var entries = row.getElementsByTagName("td");
        for(var td = 0; td < entries.length; td++)
        {
            var entry = entries[td];
            var divs = entry.getElementsByTagName("div");
            for(var div = 0; div < divs.length; div++)
            {
                var rev = divs[div];
                if(rev.className.indexOf("revst") >= 0)
                {
                    entry.style.backgroundColor = revisionColor;
                }
            }
        }
                                
        if (row.className.indexOf("x-row-1-1") >= 0) {
            var rowHeight = 0;
            rowHeight = row.offsetHeight;
            var cells = row.getElementsByTagName("td");
            
            for (var i=0; i < cells.length; i++) {
                cells[i].style.backgroundColor = revisionColor;
            }
            
        }
    }
    clobberUnlinkableAnchors();
} 

function addTableChangebars() {
    addTableChangebarsByDocument(document);
}

//Add change bars for standard elements
function addChangebarsByDocument(doc){
    
    var divs = doc.getElementsByTagName("div");
    for (var i = 0; i < divs.length; i++) {
        if (divs[i].className == "changebar") {
            return;
        }
    }
    
            for(var i=0; i < divs.length; i++){
        var div = divs[i];
        var revisionID;
        var revbarHeight = 0;
        
        revisionID = div.getAttribute("name");
        if (div.className.indexOf("x-revst") >= 0) {
            var revbarDiv = div;
            var sibling;
            var siblings = new Array();
            //Floating div that will act as the revbar
            var revbarFloat = document.createElement("div");
            //Initial height of the revbar
            var revbarHeight = 10;
            
            revbarFloat.className = "revbarFloat";
            //revbarFloat.style.borderLeft = "3px solid black"; 
            revbarFloat.style.display = "block";
            revbarFloat.style.position = "relative";
            revbarFloat.style.zIndex = "-10"; 
            revbarFloat.style.cssFloat = "left"; 
            revbarFloat.style.styleFloat = "left";
            revbarFloat.style.padding = "0px";
            revbarFloat.style.marginLeft = "-3px";
            revbarFloat.innerHTML = "&nbsp;";
            
            revbarDiv.className = "changebar";
            revbarDiv.style.cssFloat="clear";
            
            sibling = revbarDiv.nextSibling;
            //Get the top margin of the first sibling so that we know where to start the revbar
            var topMargin = 0;
            if (typeof sibling.currentStyle != "undefined") {
                topMargin = sibling.currentStyle.marginTop;
            }
            //var calcHeight = 0;
            var siblingCount = 0;
            //var calcAlert = "";
            while(sibling.nodeType != null){
                
                if(sibling.className != null){
                    if(sibling.className.indexOf("x-revend") >= 0 && sibling.getAttribute("name") == revisionID){
                        //We've reached the end of this changebar
                        break;
                    } 
                    else if(sibling.className.indexOf("x-graphic") >= 0){
                        //We need to get the child img's height to calculate the revbar height
                        /*
                        var cHeight = calcImgHeight(sibling);
                        revbarHeight = revbarHeight + cHeight;
                        calcAlert = calcAlert + " imgHeight = " + cHeight;
                        topMargin = "0px";
                        */
                        siblings[siblingCount] = sibling;
                        siblingCount++;
                    }
                    else{
                        siblings[siblingCount] = sibling;
                        siblingCount++;
                    } 
                }
                
                sibling = sibling.nextSibling;
                
            }
            
            //Move the sibling into the changebar div
            for(var h = 0; h < siblings.length; h++){
                if (siblings[h].nodeType == 1) {
                    siblings[h].style.backgroundColor = revisionColor;
                    if (siblings[h].className.indexOf("x-graphic") >= 0) {
                        siblings[h].style.borderLeft = "10px solid " + revisionColor;
                    }
                    var descendants = siblings[h].getElementsByTagName('*');
                    for (var j=0; j < descendants.length; j++) {
                        if (descendants[j].nodeType == 1) {
                            descendants[j].style.backgroundColor = revisionColor;
                            if (descendants[j].className.indexOf("x-graphic") >= 0) {
                                descendants[j].style.borderLeft = "10px solid " + revisionColor;
                            }
                        }
                    }
                }
                //revbarDiv.appendChild(siblings[h]);
            }
                            
            //alert("sibling change count = " + sibChangeCount);
            //Calculate the revbar height and add the revbar float with the border
            /*
            alert('calc: ' + calcAlert + ' revbarHeight = ' + revbarHeight + 'offsetHeight = ' + revbarDiv.offsetHeight);
            revbarHeight = revbarHeight + revbarDiv.offsetHeight;
            revbarFloat.style.height = revbarHeight + "px"; 
            revbarFloat.style.marginBottom = "-" + (revbarHeight) + "px";
            revbarFloat.style.marginTop = topMargin;
            */
            
            //Add the revbar float to the revbar div
            revbarDiv.insertBefore(revbarFloat, revbarDiv.firstChild);
        }
    }
}

function addChangebars() {
    addChangebarsByDocument(document);
}

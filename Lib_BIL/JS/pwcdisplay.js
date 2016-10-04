//  display support code for the PWC IETM application.
//
//   (c)2011 Parametric Technology Inc.
//
var revisionColor = "#DDDDDD";

//var sbspbPrefix = "http://webtop.pwc.ca/ecmwebtop65/custom/pwcgui/corp/library/getDCTMdoc/getDCTMdoc.jsp?docbase=techpubs&";  // original line
var sbspbPrefix = "/technical-publications/bulletins/show/"; // SR170565: modified line

var graphicDisclaimer = 'P&amp;WC Proprietary - subject to restrictions in Technical Data Agreement';

var enMonths=['JAN','FEB','MAR','APR','MAY','JUN','JUL','AUG','SEP','OCT','NOV','DEC'];

var gFigRef;

// globals retrieved from metadata

var metaChapter = "";
var metaSection = "";
var metaSubject = "";
var metaPbn = "";
var metaModelNo = "";
var metaManualServiceBulletinNo = "";
var metaRevNo = "";
var metaPointRev = "0";
var metaIssueRevisionDate = "";
var metaManualType = "";
var metaEngineFamily = "";
var metaPbTitle = "";

function manType(manCode) {
    var manShortCode = manCode.substring(0,2);
    
    switch (manShortCode) {
        case "mm":
        return "MAINTENANCE MANUAL";
        case "em":
        return "ILLUSTRATED PARTS CATALOG";
        case "oh":
        return "OVERHAUL MANUAL";
        case "ip":
        return "ILLUSTRATED PARTS CATALOG";
        case "ep":
        return "ILLUSTRATED PARTS CATALOG";
        case "ci":
        return "CLEANING INSPECTION REPAIR (CIR) MANUAL";
        case "lm":
        return "LINE MAINTENANCE MANUAL";
        case "tm":
        return "MAINTENANCE MANUAL";
        default:
        return "INTERACTIVE ELECTRONIC TECHNICAL MANUAL";
    }
}

function convertDate(inDate) {
    
    var month = parseInt(inDate.substring(4,6),10);
    month--;
    return enMonths[month] + " " + inDate.substring(6,8) + "/" + 
      inDate.substring(0,4);
}

function pwcCurrentDate() {
    // This function returns the current Date in PWC's specific format, which is: DD MM/YY
    //
    var today = new Date();
    var fullYear = today.getFullYear().toString();
    
    return today.getDate() + ' ' + enMonths[today.getMonth()] + '/' + fullYear.substring(2);
}

function countSheets(htmlString) {
    var cSheet = "(SHEET X OF Y)";
    var idx = 0;
    var num = 0;
    var repStr;
    var newBlock = htmlString;
    while (idx < htmlString.length) {
        
        var foundAt = htmlString.substring(idx).indexOf(cSheet);
        if (foundAt > 0) {
            num++;
            idx += foundAt+cSheet.length;
        }
        else {
            break;
        }
    }
    for (var i = 1; i < num+1; i++) {
        // If there is only one, just replace the sheet string with a blank.
        if (num == 0) {
            repStr = "";
        }
        else {
            repStr = "(SHEET " + i + " OF " + num + ")";
        }
        newBlock = newBlock.replace(cSheet,repStr);
    }
    return newBlock;
    
}
function setGlobalsFromMeta(inHTML) {
    var name;
    var value;
    var metaRef;
    var metaSearch = document.createElement("div");
    metaSearch.innerHTML = inHTML;
    var allDivs = metaSearch.getElementsByTagName("div");
    for (var i=0; i < allDivs.length; i++) {
        if (allDivs[i].getAttribute('id') == "pwcmetainfo") {
            metaRef = allDivs[i];
            break;
        }
    }
    for (var i=0; i < metaRef.childNodes.length; i++) {
        if (metaRef.childNodes[i].nodeType == 1) { // only get attributes from element            
            name = metaRef.childNodes[i].getAttribute("id");
            value = metaRef.childNodes[i].textContent;
            switch (name) {
                case "chapter":
                  metaChapter = value;
                  break;
                case "section":
                  metaSection = value;
                  break;
                case "subject":
                  metaSubject = value;
                  break;
                case "pbn":
                  metaPbn = value;
                  break;
                case "pb-title":
                  metaPbTitle = value;
                  break;
                case "ModelNo":
                  metaModelNo = value;  
                  break;
                case "ManualServiceBulletinNo":
                  metaManualServiceBulletinNo = value;  
                  break;
                case "RevNo":
                  metaRevNo = value;  
                  break;
                case "pointRev":
                  metaPointRev = value;  
                  break;
                case "IssueRevisionDate":
                  metaIssueRevisionDate = value;  
                  break;
                case "manualType":
                  metaManualType = value;
                  break;
                case "engineFamily":
                  metaEngineFamily = value;
                  break;
              }
          }
    }
}

function correctInternalLinks(figRef) {
    
    var figAnchors;
    figAnchors = figRef.getElementsByTagName('a');
    for (var i=0; i < figAnchors.length; i++) {
        if (figAnchors[i].className.indexOf("x--sfe-InternalLink-1-0") >= 0) {
            figAnchors[i].setAttribute('onclick',
              "window.opener.parent.parent.contentFrame.content.location = '" + 
              figAnchors[i].getAttribute('href') + "';");
            figAnchors[i].href = "javascript:void(0)";
        }
    }
}

function loadDoc() {
            
    var startTag = document.getElementsByTagName("body")[0];
    setGlobalsFromMeta(startTag.innerHTML);
    addChangebarsByDocument(document);
    addTableChangebarsByDocument(document);
}

//called from the document content window as an onclick event
function displayGraphics(figureElementId) {
    
    var figRef;
    var docTitle;
    var inFigRef;
    var tagElements;
    var content;
    
    figRef = document.getElementById(figureElementId);
    
    var startTag = document.getElementsByTagName("body")[0];
    setGlobalsFromMeta(startTag.innerHTML);
    addChangebarsByDocument(document);
    addTableChangebarsByDocument(document);
    correctInternalLinks(figRef);
    invokeGraphic(figRef);
}

// display a Graphic from the navigation
function displayGraphicsNav(figureURL, figureElementId) {
    var figDoc; // XML DOM object of the figure's document
    var figRef;  // XML DOM object of the specific figure tag within the document
    var xmlhttp; // xml response object
    
    if (window.XMLHttpRequest) {
        xmlhttp = new XMLHttpRequest();
    }
    else {
        xmlhttp = new ActiveXObject("Microsoft.XMLHTTP");
    }
    
    xmlhttp.open("GET",figureURL,false);
    xmlhttp.send();
    figDoc = document.createElement('div');
    figDoc.innerHTML = xmlhttp.responseText;
    setGlobalsFromMeta(xmlhttp.responseText);
    addChangebarsByDocument(figDoc);
    addTableChangebarsByDocument(figDoc);
    var figElements = figDoc.getElementsByTagName('div');
    for (var i=0; i < figElements.length; i++) {
        if (figElements[i].getAttribute('id') == figureElementId) {
            figRef = figElements[i];
            break;
        }
    }
    if (figRef == null) {
        alert("Figure reference " + figureElementId + " at " +
              figureURL + " not found.");
    }
    else {
        correctInternalLinks(figRef);
        invokeGraphic(figRef);
    }
}

// invokeGraphic creates a displayed graphic window given a figure reference object
function invokeGraphic(figRef) {
    // Check if there is an online disclaimer to load. If there is one available,
    // load it as the official disclaimer, otherwise, just use the default.
    var xmlhttp;
    var inHTML;
   
    inHTML = countSheets(figRef.innerHTML);
    if (metaChapter == "frontmatter") {
        docTitle = "";
    }
    else {
        docTitle = metaChapter + '-' + metaSection + '-' + metaSubject + ' ' + metaPbTitle;
    }
    
    winRef = window.open("","_blank",
                         "scrollbars=yes, status=no, toolbar=no, location=no, resizable=1, menubar=1, width=1100, height=900");
    winRef.document.writeln('<html><head>');
    winRef.document.writeln('<script type="text/javascript">');
    winRef.document.writeln('function toggle(heading, tableId) {');
    winRef.document.writeln('var headingObj = document.getElementById(heading);');
    winRef.document.writeln('var tableObj = document.getElementById(tableId);');
    winRef.document.writeln('if (tableObj) {');
    winRef.document.writeln('if (tableObj.style.display == "block") {');
    winRef.document.writeln('tableObj.style.display="none";');
    winRef.document.writeln('headingObj.style.cursor="s-resize";');
    winRef.document.writeln('} else {');
    winRef.document.writeln('tableObj.style.display="block";');
    winRef.document.writeln('headingObj.style.cursor="n-resize";} } }');
    winRef.document.writeln('function tableStyleDisplay(styleTo) {');
    winRef.document.writeln('var allDivs = document.getElementsByTagName("div");');
    winRef.document.writeln('for (var i = 0; i < allDivs.length; i++) {');
    winRef.document.writeln(' if (allDivs[i].className.indexOf("key") >= 0) {');
    winRef.document.writeln(' allDivs[i].style.display = styleTo;} } }');
    winRef.document.writeln('</script>');
    winRef.document.write('<link href="css/content.css" rel="stylesheet" type="text/css"></link>');
    winRef.document.write('<link href="css/bil_pub.css" rel="stylesheet" type="text/css"></link>');
//    winRef.document.write('<link href="css/styler.css" rel="stylesheet" type="text/css"></link>');
//    winRef.document.write('<script type="text/javascript" src="pwcdisplay.js"></script>');
    winRef.document.writeln('<title>' + docTitle + '</title></head>');
    winRef.document.writeln('<body>');
    winRef.document.writeln('<div style="text-align:center; font-size: 24pt; font-weight: bold;">PRATT &amp; WHITNEY CANADA</div><br/>');
    winRef.document.writeln('<div style="text-align:center; font-size: 18pt; font-weight: bold;">' + manType(metaManualType) + '</div>' );
    winRef.document.write('<div style="text-align:center; font-size: 14pt; font-weight: bold;">MANUAL PART NO. ' + metaManualServiceBulletinNo + 
                          ' REVISION NO. ' + metaRevNo.toString());
    winRef.document.write(metaPointRev.toString() == "0" ? "" : ('.' + metaPointRev.toString()));
    winRef.document.writeln( '</div>');
    winRef.document.writeln('<div style="text-align:center; font-size: 14pt; font-weight: bold;">' + docTitle + '</div>');
    winRef.document.writeln('<div id="innerFigs">' + inHTML + '</div>');
    winRef.document.writeln('<p style="font-size:9px">Printed on: ' + pwcCurrentDate() + 
                          ' ' + graphicDisclaimer + '</p>');
    winRef.document.writeln('<br/><form action="#"><table><tr><td>');
    winRef.document.writeln('<input id="bPrint" type="button" value="Print" onclick="tableStyleDisplay(\'block\');document.getElementById(\'bClose\').style.display=\'none\'; document.getElementById(\'bPrint\').style.display=\'none\';window.print();document.getElementById(\'bClose\').style.display=\'block\';document.getElementById(\'bPrint\').style.display=\'block\';tableStyleDisplay(\'none\');"/></td>');
    winRef.document.writeln('<td><input id="bClose" type="button" value="Close" onclick="window.close();"/></td></tr></table></form>')
    winRef.document.writeln('</body></html>');
    
    winRef.document.close();
}

function clobberUnlinkableAnchors() {
    var aElements = document.getElementsByTagName("a");
    var sbPat = new RegExp("s(b|pb)Link");
    for (var aNum = 0; aNum < aElements.length; aNum++) {
        var aEle = aElements[aNum];
        var aEleParent = aEle.parentNode;
        var aEleParentParent = aEleParent.parentNode;
        if (aEleParent.className == " x--sfe-CrossReference-1-0" && 
            (aEleParentParent.className == " x-refint-2-0" || 
             aEleParentParent.className == " x-xref-5-0")) {
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
//            revbarFloat.style.borderLeft = "3px solid black"; 
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
//            var calcHeight = 0;
            var siblingCount = 0;
//            var calcAlert = "";
            while(sibling != null && sibling.nodeType != null){
                
                if(sibling.className != null){
                    if(sibling.className.indexOf("x-revend") >= 0
                            && sibling.getAttribute("name") == revisionID){
                                        //We've reached the end of this changebar
                        break;
                    } 
                    else if(sibling.className.indexOf("x-graphic") >= 0){
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
            }
                            
            revbarDiv.insertBefore(revbarFloat, revbarDiv.firstChild);
        }
        
    }
}

function addChangebars() {
    addChangebarsByDocument(document);
}

//Expand or collapse tables
function toggle(heading, tableId) {
    var headingObj = document.getElementById(heading);
    var tableObj = document.getElementById(tableId);
    
    if (tableObj) {
        if (tableObj.style.display == "block") {
            tableObj.style.display='none';
            headingObj.style.cursor='s-resize';
        } else {
            tableObj.style.display='block';
            headingObj.style.cursor='n-resize';
        }
    }
    //Change bars won't be displayed until the table is visible
    addTableChangebars();
}

// Test for digits
function isDigit(aChar) {
      myCharCode = aChar.charCodeAt(0);
   
      if((myCharCode > 47) && (myCharCode <  58))
      {
         return true;
      }
   
      return false;
}

function getSPBNumberFromContent(inContent)
{
    var re = /.*-(.*) SPB NO. (\d*)/;
    results = inContent.match(re);
    if(results != null)
        return results[1] + "-" + results[2];
    return "";
}

function getSBNumberFromContent(inContent)
{
    var content = "";
    var numberStr = "";
    var startIdx = -1;
    var endIdx = -1;
    var lastCharDigit = false;
    // if the content contains "No. ", then the number is after the No.
    // instead of the first number encountered
    var inPos = inContent.search("NO. ");
    if (inPos > -1) {
        content = inContent.substr(inPos);
    }
    else {
        content = inContent;
    }
    for (var i=0; i < content.length; i++) {
        if (isDigit(content.charAt(i))) {
            return parseInt(content.substr(i));
        }
    }
    return "";
}

function sbLink(linkValue) {
    var startTag = document.getElementsByTagName("body")[0];
    setGlobalsFromMeta(startTag.innerHTML);
    var sbNum = getSBNumberFromContent(linkValue);
    // var linkUrl = sbspbPrefix + "documenttype=tpub_sb&object_name=" +sbNum; // original line
    var linkUrl = sbspbPrefix + "SERVICE_BULLETIN/" + sbNum; // SR170565: modified line
    winRef = window.open(linkUrl,"_blank",
        "scrollbars=yes, status=no, toolbar=no, location=no, resizable=1, menubar=0, width=800, height=400");
}

function spbLink(linkValue) {
    var startTag = document.getElementsByTagName("body")[0];
    setGlobalsFromMeta(startTag.innerHTML);
    var spbNum = getSPBNumberFromContent(linkValue);
    // var linkUrl = sbspbPrefix + "documenttype=tpub_spb&object_name=" +spbNum; // original line
    var linkUrl = sbspbPrefix + "SPARE_PARTS_BULLETIN/" + spbNum; // SR170565: modified line
    winRef = window.open(linkUrl,"_blank",
        "scrollbars=yes, status=no, toolbar=no, location=no, resizable=1, menubar=1, width=800, height=400");
}

function toggle (headingId, tableId) { 
  var headingObj = document.getElementById(headingId);
  var tableObj = document.getElementById(tableId);
  if (tableObj) {
    if (tableObj.style.display == 'block') {
      tableObj.style.display='none';
    } else {
      tableObj.style.display='block';
    }
  }
}

function go(targetId) {
    var targetObj = document.getElementById(targetId);
    if (targetObj.style.display == 'none') {
        targetObj.style.display='block';
    }
    targetObj.scrollIntoView(true);
}

function showTable(tableId) { 
  var tableObj = document.getElementById(tableId);
  if (tableObj) {
    tableObj.style.display='block';
  }
}

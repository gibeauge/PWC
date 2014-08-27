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
            value = metaRef.childNodes[i].innerHTML;
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
            //figAnchors[i].setAttribute('onclick', "window.opener.parent.parent.contentFrame.content.location = '" + figAnchors[i].getAttribute('href') + "';");
            //figAnchors[i].href = "javascript:void(0)";
            figAnchors[i].setAttribute('onclick', "javascript:window.opener.location.href='" + figAnchors[i].getAttribute('href') + "';window.close();");
            figAnchors[i].href = "#";
        }
    }
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
    
    winRef = window.open("","_blank", "scrollbars=yes, status=no, toolbar=no, location=no, resizable=1, menubar=1, width=1100, height=900");
    winRef.document.writeln('<html>');
    winRef.document.writeln('<link href="css/content.css" rel="stylesheet" type="text/css"></link>');
    winRef.document.writeln('<script type="text/javascript" src="javascript/pwcdisplay_common.js"></script>');
    winRef.document.writeln('<script type="text/javascript" src="javascript/pwcdisplay_figure.js"></script>');
    winRef.document.writeln('<title>' + docTitle + '</title>');
    winRef.document.writeln('<body style="font-family:Verdana;">');
    winRef.document.writeln('<div style="text-align:center">');
    winRef.document.writeln('<div style="font-size: 24pt; font-weight: bold;">PRATT &amp; WHITNEY CANADA</div><br/>');
    winRef.document.writeln('<div style="font-size: 18pt; font-weight: bold;">' + manType(metaManualType) + '</div>' );
    winRef.document.writeln('<div style="font-size: 14pt; font-weight: bold;">MANUAL PART NO. ' + metaManualServiceBulletinNo + ' REVISION NO. ' + metaRevNo.toString());
    winRef.document.write(metaPointRev.toString() == "0" ? "" : ('.' + metaPointRev.toString()));
    winRef.document.writeln('</div>');
    winRef.document.writeln('<div style="font-size: 14pt; font-weight: bold;">' + docTitle + '</div>');
    winRef.document.writeln('</div>');
    winRef.document.writeln('<div id="innerFigs">' + inHTML + '</div>');
    winRef.document.writeln('<p style="font-size:9px">Printed on: ' + pwcCurrentDate() + ' ' + graphicDisclaimer + '</p>');
    winRef.document.writeln('<br/><form action="#">');
    winRef.document.writeln('<table><tr>');
    winRef.document.writeln('<td><input id="bPrint" type="button" value="Print" onclick="printFigure();"/></td>');
    winRef.document.writeln('<td><input id="bClose" type="button" value="Close" onclick="window.close();"/></td>');
    winRef.document.writeln('</tr></table></form>')
    winRef.document.writeln('</body>');
    winRef.document.writeln('</html>');
    
    winRef.document.close();
}


function displayConsumables(consumableElementId) {
    
    var winRef;
    var conRef;
    
    conRef = document.getElementById(consumableElementId);
    
    winRef = window.open("","_blank", "scrollbars=yes, status=no, toolbar=no, location=no, resizable=1, menubar=1, width=600, height=600");
    winRef.document.writeln('<html>');
    winRef.document.writeln('<link href="css/content.css" rel="stylesheet" type="text/css" />');
    winRef.document.writeln('<body style="font-family:Verdana;">');
    winRef.document.writeln('<div style="text-align:center">');
    winRef.document.writeln('<div id="consumables">' + conRef.innerHTML + '</div>');
    winRef.document.writeln('</div>');
    winRef.document.writeln('</body>');
    winRef.document.writeln('</html>');
    
    winRef.document.close();
}

function displayEffCodes(effTableElementId) {
    
    var winRef;
    var effRef;
    
    effRef = document.getElementById(effTableElementId);
    winRef = window.open("","_blank", "scrollbars=yes, status=no, toolbar=no, location=no, resizable=1, menubar=1, width=400, height=400");
    winRef.document.writeln('<html>');
    winRef.document.writeln('<link href="css/content.css" rel="stylesheet" type="text/css" />');
    winRef.document.writeln('<body style="font-family:Verdana;">');
    winRef.document.writeln('<div style="text-align:center">');
    winRef.document.writeln('<div id="eff">' + effRef.innerHTML + '</div>');
    winRef.document.writeln('</div>');
    winRef.document.writeln('</body>');
    winRef.document.writeln('</html>');
    
    winRef.document.close();
}

//Find an image's height
function calcImgHeight(imgDiv){
    var imgHeight = 0;
    var images = new Array();
    images = imgDiv.getElementsByTagName('img');
    for(var i = 0; i < images.length; i++){
        var imgage = images[i];
        
        imgHeight = imgHeight + loadImg(imgage.src);
    }
    return imgHeight;
}

function loadImg(imgPath){
    var myImage = new Image();
    var imgHeight = 0;
    myImage.name = imgPath;
    myImage.src = imgPath;
    
    imgHeight = myImage.height;
    
    return imgHeight;
}



//Expand or collapse tables
function toggle(heading, tableId) {
    var headingObj = document.getElementById(heading);
    var tableObj = document.getElementById(tableId);
    
    if (tableObj) {
        if (tableObj.style.display == "block") {
            tableObj.style.display='none';
        } else {
            tableObj.style.display='block';
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

function getSPBNumberFromContent(inContent) {
    var re = /.*-(.*) SPB NO. (\d*)/;
    results = inContent.match(re);
    if(results != null)
        return results[1] + "-" + results[2];
    return "";
}

function getSBNumberFromContent(inContent) {
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

//Determines if the width of the columns are too big
function isWidthTooBig(colgroup) {
    var col = colgroup.getElementsByTagName('col');
    for(j = 0; j < col.length; j++) {
        if(col[j].getAttribute('width') !=null && parseInt(col[j].getAttribute('width')) > 1000)
            return true;
    }
    return false;
}

// Reduce width by half
function reduceSize(colgroup) {
    var col = colgroup.getElementsByTagName('col');
    for(j = 0; j < col.length; j++) {
        col[j].setAttribute('width', parseInt(col[j].getAttribute('width'))/2);
    }
}

//Fix tables layout for Google's Chrome browser
window.onload = function() {
    if(window.chrome) {
        var colgroup = document.getElementsByTagName('colgroup');
        for(i = 0; i < colgroup.length; i++) {
            while(isWidthTooBig(colgroup[i])) {
                reduceSize(colgroup[i]);
            }
        }
    }

    var hash = window.location.hash;
    if(hash != "") {
        var id = hash.substr(1);
        if (id != "" && id != "none") {
            document.getElementById(id).style.display = 'block';
        }
    }
}

// Functions added

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

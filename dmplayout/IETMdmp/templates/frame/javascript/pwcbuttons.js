// rsvp will find out what the user is and will populate a get request
var authUser = '';
var defaultSpotlightURL = 
 "https://eportal.pwc.ca/technical-publications/spotlight/view?partNumber=";

function getValueFromTag(sourceString, tagString) {
    
    var leftString = "<" + tagString + ">";
    var rightString = "</" + tagString + ">";
    var beginPos = sourceString.indexOf(leftString);
    var endPos = sourceString.indexOf(rightString);
    
    if (beginPos < 0) {
        return "null";
    }
    else if (beginPos+leftString.length == endPos) {
        return "null";
    }
    else {
        beginPos += lef;tString.length;
        var subLength = endPos - beginPos;
        return sourceString.substring(beginPos,subLength);
    }
}

function rsvpDate(fromDate) {
    var month = parseInt(fromDate.substring(4,6),10);
    month--;
    var rMonths=['JAN','FEB','MAR','APR','MAY','JUN','JUL','AUG','SEP','OCT','NOV','DEC'];
    return rMonths[month] + '-' + fromDate.substring(6,8) + '-' + fromDate.substring(0,4);
}

function rsvp() {
    var frame = searchFrameWin("content");	
    var doc = getFrameContentDocument(frame);
    var rsvpUrl;
    
    if (rsvpSpec == "" || rsvpSpec == null) {
        rsvpUrl = "http://www.pwc.ca/en/service-support/rsvp-form?";
    }
    else {
        rsvpUrl = rsvpSpec + "?";
    }
    
    var pwcMetaInfo = doc.getElementById("pwcmetainfo");
    if (pwcMetaInfo != null) {
            var metaInfo = doc.getElementsByTagName("body")[0];
            setGlobalsFromMeta(metaInfo.innerHTML);
            if (metaEngineFamily != "") {
                rsvpUrl += "engineFamily=" + metaEngineFamily.toUpperCase();
            }
            
            if (metaModelNo != "") {
                rsvpUrl += "&ModelNo=" + metaModelNo.toUpperCase();
            }
            
            rsvpUrl += "&from=IETM";
            
            if (metaManualType != "") {
                rsvpUrl += "&engineManual=" + metaManualType.split("_",1)[0];
                // .substring(0,2).toUpperCase(); remove to apply whole family
            }
            
            // 20130509 JS Added a test to avoid filling CSS fields in RSVP page when in fronmatter PB.
            if (metaChapter != "" && metaChapter != "frontmatter") {
                rsvpUrl += "&ManualCHSESU=" + metaChapter + metaSection + metaSubject;
            }
            
            if (metaManualServiceBulletinNo != "") {
                rsvpUrl += "&ManualServiceBulletinNo=" + metaManualServiceBulletinNo;
            }
            
            if (metaRevNo != "") {
                rsvpUrl += "&RevNo=" + metaRevNo;
            }
            
//            if (metaIssueRevisionDate != "") {
                rsvpUrl += "&IssueRevisionDate="; // remove date + rsvpDate(metaIssueRevisionDate);
//            }
    }
    else {
        alert("Please Navigate to a document pageblock in order to RSVP");
        return;
    }
    var firstName = "";
    var lastName = "";
    var company = "";
    var country = "";
    var email = "";
    
    if (smUser != "null" && authResponse != "null") {
        firstName = getValueFromTag(authResponse,"first-name");
        lastName = getValueFromTag(authResponse,"last-name");
        company = getValueFromTag(authResponse,"company");
        country = getValueFromTag(authResponse,"country");
        email = getValueFromTag(authResponse,"email");
    }
    
    rsvpUrl += "&personName=";
    if (firstName != "null" && lastName != "null") {
        rsvpUrl += firstName + "+" + lastName;
    }
    
    rsvpUrl += "&department=";
    
    rsvpUrl += "&company=";
    if (company != "null") {
        rsvpUrl += company;
    }
        
    rsvpUrl += "&address=";
    
    rsvpUrl += "&country=";
    if (country != "null") {
        rsvpUrl += country;
    }
    
    rsvpUrl += "&contact_email=";
    if (email != "null") {
        rsvpUrl += email;
    }
    
    rsvpUrl += "&fax=&telephone=";
    
    var winRef = window.open(rsvpUrl, "_blank");
}


function spotlight() {
    if (spotlightSpec == "" || pwcPartNumber == "") {
//        alert("Spotlight is currently unavailable.");
        var frame = searchFrameWin("content");	
        var doc = getFrameContentDocument(frame);
        var pwcMetaInfo = doc.getElementById("pwcmetainfo");
        if (pwcMetaInfo != null) {
            var metaInfo = doc.getElementsByTagName("body")[0];
            setGlobalsFromMeta(metaInfo.innerHTML);
            var spotlightURL = defaultSpotlightURL + metaManualServiceBulletinNo;
            var winRef = window.open(spotlightURL,"_blank");
        }
        else {
            var pwcManualPnEle = doc.getElementById("manualPn");
            if (pwcManualPnEle != null) {
                var pwcManualPn = getNumberFromContent(pwcManualPnEle.innerHTML);
                var spotlightURL = defaultSpotlightURL + pwcManualPn;
                var winRef = window.open(spotlightURL,"_blank");
            }
            else {
                alert("Manual Part Number not found");
            }
        }
    }
    else {
        var spotlightURL = spotlightSpec.replace("PART_NUMBER",pwcPartNumber);
//        alert("spotlightURL:" + spotlightURL);
        var winRef = window.open(spotlightURL,"_blank");
    }
}

function searchMySubscriptions() {
    if (searchMySubsSpec == "") {
        alert("Search My Subscriptions is currently unavailable.");
    }
    else {
        var winRef = window.open(searchMySubsSpec,"_blank");
    }
}

var updateIntervalId;

var doc;

function updateStatus(id, uri) {
	updateIntervalId = setInterval("openUpdateStatusByAJax('" + id +"', '"+ uri + "')", 1000);
}


function processStatus(id, responseText) {
	
	if (responseText.indexOf("class='stopped'") != -1) {
		clearInterval(updateIntervalId);
		// var elm = document.getElementById("refreshButton");	
		// if (elm)
		// elm.className="refresh";
	} else if (responseText.indexOf("class='finished'") != -1) {
		clearInterval(updateIntervalId);
		// enable refresh button
		var elm = document.getElementById("refreshButton");	
		if (elm)
			elm.className="refresh";
	}
	
	var div = document.getElementById(id);
	
	if (!div)
		return;

	div.innerHTML = responseText;	
	
	//alert(responseText);
}

function showError(id, httpStatus) {

	alert("ie error: " + httpStatus);
	
	clearInterval(updateIntervalId);
	
	var div = document.getElementById(id);

	if (!div)
		return;
	
	var s = div.value;

	div.value = s + "<br/>" + "http connection failed: error code: " + httpStatus+ " - xxx";	
}

function parseResponse(text) {

}

function openUpdateStatusByAJax (id, url) {
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
            	processStatus(id, self.xmlHttpReq.responseText);
            } else {
            	showError(id, self.xmlHttpReq.status);
            }
        } 
    }
    self.xmlHttpReq.send("");
}

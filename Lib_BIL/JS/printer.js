
function resizeTables() {
	var tables = document.getElementsByTagName('table');
	for (var i = 0; i < tables.length; i++) {
		var table = tables[i];
		if (table.className!="merge" && table.width=="100%") {
			table.width = "95%"
		}	
	}
}

function fixPageBreak() {
	var div_xmodule = $(".x-module-1-0");
	if (div_xmodule.length > 0) {
		div_xmodule[0].className = div_xmodule[0].className + " x-module-1-0-first";
	}
	var div_xgraphic = $(".x-graphic-1-0");
	if (div_xgraphic.length > 0) {
		if (div_xgraphic[0].parentNode.className.indexOf("x-ata-page-block-1-0")!=-1 || div_xgraphic[0].parentNode.className.indexOf("x-ipc-fig-1-0")!=-1) {
			div_xgraphic[0].className = div_xgraphic[0].className + " x-graphic-1-0-first";
		}
	}
	var div_xfigure = $(".x-figure-1-0");
	if (div_xfigure.length > 0) {
		if (div_xfigure[0].parentNode.className.indexOf("x-ata-page-block-1-0")!=-1 || div_xfigure[0].parentNode.className.indexOf("x-ipc-fig-1-0")!=-1) {
			div_xfigure[0].className = div_xfigure[0].className + " x-figure-1-0-first";
		}
	}
}

/* Function to call after the print is called */
function afterPrint() {
	$("#pane_print").remove();
	$("#css_figure").remove();
}

/* Custom print function */
function print_butt(window) {
	
	// Build print page
	$("body").append("<div id='pane_print'></div>");
    $("#pane_print").append("<div id='pane_print_header'>" + $("#banner").html() + "</div>");
    $("#pane_print").append("<div id='pane_print_content'>" + $("#pane_content .x-body").wrap('<p/>').parent().html() + "</div>");
    $("#pane_print_content .merge-c2").remove();
    $("#pane_print_content .merge > tbody > tr > td").children().unwrap().unwrap().unwrap().unwrap();
    $("#pane_print").append("<div id='pane_print_footer'>" + $(".footer").wrap('<p/>').parent().html() + "</div>");

	if(window.chrome) {
		var chromeContinue=confirm('Please be advised that the Chrome web browser you are using is not 100 per cent effective when printing pages from our online manuals.  As a result, some printed materials may be difficult to read.  We strongly advise you to switch to Internet Explorer if you wish to print pages from our Technical Publications.  \n\nPress "OK" to continue with your current print request, or "Cancel" to abort the print request.');
		if (chromeContinue==false) {
			return;
		}
	}
	//resizeTables();
	var r=confirm('Click "OK" to print with the figures. Otherwise, click "Cancel" to only print the text.');
	if (r==true) {
		var style = document.createElement('style');
		document.body.appendChild(style);
		style.setAttribute('id', 'css_figure');
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
		setTimeout(function() {afterPrint()},2000);
	}
	else {
		afterPrint();
	}
}

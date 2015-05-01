
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

/* Custom print function */
function bil_print_dialog() {
	$("body").append("<div id='dialog-print'></div>");
	
	var lbl_browser = "";
	var dlg_height = 200;
	if(window.chrome) {
		lbl_browser = 'Please be advised that the Chrome web browser you are using is not 100 per cent effective when printing pages from our online manuals. As a result, some printed materials may be difficult to read.  We strongly advise you to switch to Internet Explorer if you wish to print pages from our Technical Publications. \n\nPress "OK" to continue with your current print request, or "Cancel" to abort the print request.';
		dlg_height = 350;
	}
	
	$("#dialog-print").dialog({
        resizable: false,
        modal: true,
        title: "Print options",
        height: dlg_height,
        width: 500,
        create: function (e, ui) {
        	$("#dialog-print").append("<div>" + lbl_browser + "</div>");
            $("#dialog-print").append("<div><br/><input type='radio' name='opt_lang' id='opt_lang' value='src' checked='1'/>Source language     " + 
                                                "<input type='radio' name='opt_lang' id='opt_lang' value='trans'/>Translated language</div>");
            $("#dialog-print").append("<div><br/><input id='ck_figures' type='checkbox'/> Print images</div>");
        },
        buttons: {
            "OK": function () {
                $(this).dialog('close');
                bil_print_proc(true);
            },
            "Cancel": function () {
                $(this).dialog('close');
                bil_print_proc(false);
            }
        }
    });
}

function bil_print_proc(value) {
	if (value) {
        var src_lang = true;
        var print_images = false;
        if ($('input[name="opt_lang"][value="src"]').prop("checked")==false) {
            src_lang = false;
        }
        if ($("#ck_figures").is(':checked')) {
            print_images = true;
        }
        bil_print(src_lang, print_images);
    }
    $("#dialog-print").remove();
}

function bil_print(src_lang, print_images) {
	
	// Build print page
	$("body").append("<div id='pane_print'></div>");
    $("#pane_print").append("<div id='pane_print_header'>" + $("#banner").html() + "</div>");
    $("#pane_print").append("<div id='pane_print_content'>" + $("#pane_content .x-body").wrap('<p/>').parent().html() + "</div>");
    if (src_lang) {
        $("#pane_print_content .merge-c2").remove();
    }
    else {
        $("#pane_print_content .merge-c1").remove();
    }
    $("#pane_print_content .merge > tbody > tr > td").children().unwrap().unwrap().unwrap().unwrap();
    //$("#pane_print").append("<div id='pane_print_footer'>" + $(".footer").wrap('<p/>').parent().html() + "</div>");

	//resizeTables();
	
	if (print_images) {
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

/* Function to call after the print is called */
function afterPrint() {
	$("#pane_print").remove();
	$("#css_figure").remove();
}

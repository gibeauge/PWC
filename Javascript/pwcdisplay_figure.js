
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
}

function tableStyleDisplay(styleTo) {
    var allDivs = document.getElementsByTagName("div");
    for (var i = 0; i < allDivs.length; i++) {
        if (allDivs[i].className.indexOf("key") >= 0) {
            allDivs[i].style.display = styleTo;
        }
    }
}

function printFigure() {
    tableStyleDisplay('block');
    document.getElementById('bClose').style.display='none';
    document.getElementById('bPrint').style.display='none';
    window.print();
    document.getElementById('bClose').style.display='block';
    document.getElementById('bPrint').style.display='block';
    tableStyleDisplay('none');
}

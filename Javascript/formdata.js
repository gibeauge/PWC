/**
*	Dependencies: Requires utils.js
*
*/

/*
* Send request to (use the given form) server and return result to 
* the frame with the given name.
*/
function formQueryData(form, tabId, tabsFrame, viewsFrame, view, tabToolbarFrame, toolbar) {
  
  var query = querystring(form);

  var frameEl = searchFrameEl(view);
  
  if (frameEl) { 	  
	  frameEl.setAttribute("src", query);
	  clickOnTab(tabId, tabsFrame, viewsFrame, view, tabToolbarFrame, toolbar);
  } else {
  	  alert("Can not locate frame: \"" + view + "\" for search output.");
	  return true;
  }

  return false;
}


/**
 * querystring
 * @param id the id for the form whose content is used for constructing the querystring
 * @return the query string
 *
 **/
function querystring (form) {
      
  var nodes = form.elements;

  var string = "";

  for (var i = 0; i < nodes.length; i++) {

    var type = nodes[i].type;

    var query = "";
    
    switch (type) {

    case 'checkbox':
    case 'radio':
      query += getRadio(nodes[i]);
      break;

    case 'select-one':
    case 'select-multiple':
      query += getSelect(nodes[i]);
      break;

    default:
      query += getText(nodes[i]);
      break;
    }
    
    if (query) {
      if (string)
	string +="&" + query;
      else
	string = query;
    }

  }

  if (string == '')
	  return form.action;
  else
  	  return form.action + "?" + string;
}

/**
 * getText return text field as a query string
 *
 *
 **/
function getText(node) {
  if (!node || !node.value)
    return '';
  return node.name + "=" + encodeURIComponent(node.value);
}

function getFile(node) {
  return '';
}

function getRadio(node) {
  if (!node)
    return '';

  if (node.checked) {
    return node.name + "=" + 
	encodeURIComponent(node.value);
  }

  return '';

}

/**
* getSelect return selected items.
*/
function getSelect(node) {
  if (!node) {
    return '';
  }
  var outvar = '';
  var i = 0;
  var found = 0;

  while (i < node.length) {
    if (node.options[i].selected && node.options[i].value) {
      if (found)
	outvar += "&";

      outvar += node.name + "=" + 
	encodeURIComponent(node.options[i].value);

      found = 1;

    }
    i++;
  }
  return outvar;
}

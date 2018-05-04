// (C) Wolfgang Huber 2010-2011

// Script parameters - these are set up by R in the function 'writeReport' when copying the 
//   template for this script from arrayQualityMetrics/inst/scripts into the report.

var highlightInitial = [ true, true, false, false, true, false, false, true, false, true, false, false, true, true, true, false, false, false, true, true, true, false, true, true, true, true, true, false, false, false, false, false, true, true, false, false, true, false, true, true, true ];
var arrayMetadata    = [ [ "1", "GSM761617.CEL", "1", "01/17/08 12:09:38" ], [ "2", "GSM761618.CEL", "2", "01/17/08 12:28:13" ], [ "3", "GSM761619.CEL", "3", "01/17/08 13:35:11" ], [ "4", "GSM761620.CEL", "4", "03/16/09 18:03:48" ], [ "5", "GSM761621.CEL", "5", "03/16/09 20:13:27" ], [ "6", "GSM761622.CEL", "6", "03/16/09 21:18:06" ], [ "7", "GSM761623.CEL", "7", "03/07/08 15:04:16" ], [ "8", "GSM761624.CEL", "8", "03/07/08 15:20:11" ], [ "9", "GSM761625.CEL", "9", "03/07/08 16:30:57" ], [ "10", "GSM761626.CEL", "10", "03/16/09 18:17:03" ], [ "11", "GSM761627.CEL", "11", "03/16/09 20:33:15" ], [ "12", "GSM761628.CEL", "12", "03/16/09 21:53:07" ], [ "13", "GSM761629.CEL", "13", "09/13/07 12:33:25" ], [ "14", "GSM761630.CEL", "14", "09/13/07 12:47:25" ], [ "15", "GSM761631.CEL", "15", "09/13/07 14:13:58" ], [ "16", "GSM761632.CEL", "16", "03/16/09 18:31:32" ], [ "17", "GSM761633.CEL", "17", "03/16/09 20:57:19" ], [ "18", "GSM761634.CEL", "18", "03/16/09 22:06:21" ], [ "19", "GSM761635.CEL", "19", "04/14/08 15:38:20" ], [ "20", "GSM761637.CEL", "20", "04/14/08 16:43:17" ], [ "21", "GSM761638.CEL", "21", "01/17/08 12:50:16" ], [ "22", "GSM761639.CEL", "22", "01/17/08 13:49:18" ], [ "23", "GSM761640.CEL", "23", "02/07/08 12:37:13" ], [ "24", "GSM761641.CEL", "24", "03/07/08 15:35:41" ], [ "25", "GSM761642.CEL", "25", "03/07/08 16:06:48" ], [ "26", "GSM761643.CEL", "26", "03/07/08 16:46:43" ], [ "27", "GSM761644.CEL", "27", "09/13/07 12:59:06" ], [ "28", "GSM761645.CEL", "28", "09/13/07 13:13:49" ], [ "29", "GSM761646.CEL", "29", "09/13/07 14:25:28" ], [ "30", "GSM761647.CEL", "30", "04/14/08 16:11:56" ], [ "31", "GSM761648.CEL", "31", "04/14/08 16:25:42" ], [ "32", "GSM761649.CEL", "32", "04/14/08 16:58:45" ], [ "33", "GSM761650.CEL", "33", "10/06/08 15:38:13" ], [ "34", "GSM761651.CEL", "34", "10/06/08 17:05:48" ], [ "35", "GSM761652.CEL", "35", "10/06/08 18:50:17" ], [ "36", "GSM761653.CEL", "36", "10/06/08 15:53:06" ], [ "37", "GSM761654.CEL", "37", "10/06/08 17:35:09" ], [ "38", "GSM761655.CEL", "38", "10/06/08 19:05:45" ], [ "39", "GSM761656.CEL", "39", "10/06/08 16:10:27" ], [ "40", "GSM761657.CEL", "40", "10/06/08 17:19:45" ], [ "41", "GSM761658.CEL", "41", "10/06/08 19:23:30" ] ];
var svgObjectNames   = [ "pca", "dens", "dig" ];

var cssText = ["stroke-width:1; stroke-opacity:0.4",
               "stroke-width:3; stroke-opacity:1" ];

// Global variables - these are set up below by 'reportinit'
var tables;             // array of all the associated ('tooltips') tables on the page
var checkboxes;         // the checkboxes
var ssrules;


function reportinit() 
{
 
    var a, i, status;

    /*--------find checkboxes and set them to start values------*/
    checkboxes = document.getElementsByName("ReportObjectCheckBoxes");
    if(checkboxes.length != highlightInitial.length)
	throw new Error("checkboxes.length=" + checkboxes.length + "  !=  "
                        + " highlightInitial.length="+ highlightInitial.length);
    
    /*--------find associated tables and cache their locations------*/
    tables = new Array(svgObjectNames.length);
    for(i=0; i<tables.length; i++) 
    {
        tables[i] = safeGetElementById("Tab:"+svgObjectNames[i]);
    }

    /*------- style sheet rules ---------*/
    var ss = document.styleSheets[0];
    ssrules = ss.cssRules ? ss.cssRules : ss.rules; 

    /*------- checkboxes[a] is (expected to be) of class HTMLInputElement ---*/
    for(a=0; a<checkboxes.length; a++)
    {
	checkboxes[a].checked = highlightInitial[a];
        status = checkboxes[a].checked; 
        setReportObj(a+1, status, false);
    }

}


function safeGetElementById(id)
{
    res = document.getElementById(id);
    if(res == null)
        throw new Error("Id '"+ id + "' not found.");
    return(res)
}

/*------------------------------------------------------------
   Highlighting of Report Objects 
 ---------------------------------------------------------------*/
function setReportObj(reportObjId, status, doTable)
{
    var i, j, plotObjIds, selector;

    if(doTable) {
	for(i=0; i<svgObjectNames.length; i++) {
	    showTipTable(i, reportObjId);
	} 
    }

    /* This works in Chrome 10, ssrules will be null; we use getElementsByClassName and loop over them */
    if(ssrules == null) {
	elements = document.getElementsByClassName("aqm" + reportObjId); 
	for(i=0; i<elements.length; i++) {
	    elements[i].style.cssText = cssText[0+status];
	}
    } else {
    /* This works in Firefox 4 */
    for(i=0; i<ssrules.length; i++) {
        if (ssrules[i].selectorText == (".aqm" + reportObjId)) {
		ssrules[i].style.cssText = cssText[0+status];
		break;
	    }
	}
    }

}

/*------------------------------------------------------------
   Display of the Metadata Table
  ------------------------------------------------------------*/
function showTipTable(tableIndex, reportObjId)
{
    var rows = tables[tableIndex].rows;
    var a = reportObjId - 1;

    if(rows.length != arrayMetadata[a].length)
	throw new Error("rows.length=" + rows.length+"  !=  arrayMetadata[array].length=" + arrayMetadata[a].length);

    for(i=0; i<rows.length; i++) 
 	rows[i].cells[1].innerHTML = arrayMetadata[a][i];
}

function hideTipTable(tableIndex)
{
    var rows = tables[tableIndex].rows;

    for(i=0; i<rows.length; i++) 
 	rows[i].cells[1].innerHTML = "";
}


/*------------------------------------------------------------
  From module 'name' (e.g. 'density'), find numeric index in the 
  'svgObjectNames' array.
  ------------------------------------------------------------*/
function getIndexFromName(name) 
{
    var i;
    for(i=0; i<svgObjectNames.length; i++)
        if(svgObjectNames[i] == name)
	    return i;

    throw new Error("Did not find '" + name + "'.");
}


/*------------------------------------------------------------
  SVG plot object callbacks
  ------------------------------------------------------------*/
function plotObjRespond(what, reportObjId, name)
{

    var a, i, status;

    switch(what) {
    case "show":
	i = getIndexFromName(name);
	showTipTable(i, reportObjId);
	break;
    case "hide":
	i = getIndexFromName(name);
	hideTipTable(i);
	break;
    case "click":
        a = reportObjId - 1;
	status = !checkboxes[a].checked;
	checkboxes[a].checked = status;
	setReportObj(reportObjId, status, true);
	break;
    default:
	throw new Error("Invalid 'what': "+what)
    }
}

/*------------------------------------------------------------
  checkboxes 'onchange' event
------------------------------------------------------------*/
function checkboxEvent(reportObjId)
{
    var a = reportObjId - 1;
    var status = checkboxes[a].checked;
    setReportObj(reportObjId, status, true);
}


/*------------------------------------------------------------
  toggle visibility
------------------------------------------------------------*/
function toggle(id){
  var head = safeGetElementById(id + "-h");
  var body = safeGetElementById(id + "-b");
  var hdtxt = head.innerHTML;
  var dsp;
  switch(body.style.display){
    case 'none':
      dsp = 'block';
      hdtxt = '-' + hdtxt.substr(1);
      break;
    case 'block':
      dsp = 'none';
      hdtxt = '+' + hdtxt.substr(1);
      break;
  }  
  body.style.display = dsp;
  head.innerHTML = hdtxt;
}

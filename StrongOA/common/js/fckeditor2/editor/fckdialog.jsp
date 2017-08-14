<!--
 * FCKeditor - The text editor for internet
 * Copyright (C) 2003-2005 Frederico Caldeira Knabben
 * 
 * Licensed under the terms of the GNU Lesser General Public License:
 * 		http://www.opensource.org/licenses/lgpl-license.php
 * 
 * For further information visit:
 * 		http://www.fckeditor.net/
 * 
 * "Support Open Source software. What about a donation today?"
 * 
 * File Name: fckdialog.html
 * 	This page is used by all dialog box as the container.
 * 
 * File Authors:
 * 		Frederico Caldeira Knabben (fredck@fckeditor.net)
-->
<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@include file="/common/include/rootPath.jsp" %>
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
		<meta name="robots" content="noindex, nofollow" />
		<style type="text/css">
	.Operation_input{
		background:url(<%=frameroot%>/images/ch_h_m.gif) repeat-x;
	font-weight: bold;
	color:white;
	cursor: pointer;
	}
	#contentborder {
	BACKGROUND:url(<%=frameroot%>/images/blueprint.png) repeat #fff;
	OVERFLOW: auto;
	WIDTH: 100%;
	POSITION: absolute;
	HEIGHT: 100%;
	
}
	/*查看或者添加页面上的顶部按钮样式——非强调*/
.Operation_input1{
	background:url(<%=frameroot%>/images/ch_z_m.gif) repeat-x;
	font-weight: bold;
	cursor: pointer;
	color:#454953;
}
.table_headtd_img{
	padding-left : 9px;
	width: 24px;
	padding-top:8px;
}
.table_headtd{
	height: 41px;
	background:url(<%=frameroot%>/images/ck_line.jpg) repeat-x top;
}
	</style>
		<script type="text/javascript">

// On some Gecko browsers (probably over slow connections) the
// "dialogArguments" are not set so we must get it from the opener window.
if ( !window.dialogArguments )
	window.dialogArguments = window.opener.FCKLastDialogInfo ;

// Sets the Skin CSS
document.write( '<link href="' + window.dialogArguments.Editor.FCKConfig.SkinPath + 'fck_dialog.css" type="text/css" rel="stylesheet">' ) ;

// Sets the language direction.
window.document.dir = window.dialogArguments.Editor.FCKLang.Dir ;

var sTitle = window.dialogArguments.Title ;
document.write( '<title>' + sTitle + '<\/title>' ) ;

function LoadInnerDialog()
{
	if ( window.onresize )
		window.onresize() ;

	// First of all, translate the dialog box contents.
	window.dialogArguments.Editor.FCKLanguageManager.TranslatePage( document ) ;
	window.frames["frmMain"].document.location.href = window.dialogArguments.Page ;
}

function getRootPath(){
	return window.dialogArguments.Editor.FCKConfig.BasePath;
}

function InnerDialogLoaded()
{
	var oInnerDoc = document.getElementById('frmMain').contentWindow.document ;

	// Set the language direction.
	oInnerDoc.dir = window.dialogArguments.Editor.FCKLang.Dir ;
	// Sets the Skin CSS.
	oInnerDoc.write( '<link href="' + window.dialogArguments.Editor.FCKConfig.SkinPath + 'fck_dialog.css" type="text/css" rel="stylesheet">' ) ;

	SetOnKeyDown( oInnerDoc ) ;
	DisableContextMenu( oInnerDoc ) ;

	return window.dialogArguments.Editor ;
}

function SetOkButton( showIt )
{
	document.getElementById('btnOk').style.visibility = ( showIt ? '' : 'hidden' ) ;
}

var bAutoSize = false ;

function SetAutoSize( autoSize )
{
	bAutoSize = autoSize ;
	RefreshSize() ;
}

function RefreshSize()
{
	if ( bAutoSize )
	{
		var oInnerDoc = document.getElementById('frmMain').contentWindow.document ;

		var iFrameHeight ;
		if ( document.all )
			iFrameHeight = oInnerDoc.body.offsetHeight ;
		else
			iFrameHeight = document.getElementById('frmMain').contentWindow.innerHeight ;

		var iInnerHeight = oInnerDoc.body.scrollHeight ;

		var iDiff = iInnerHeight - iFrameHeight ;

		if ( iDiff > 0 )
		{
			if ( document.all )
				window.dialogHeight = ( parseInt( window.dialogHeight ) + iDiff ) + 'px' ;
			else
				window.resizeBy( 0, iDiff ) ;
		}
	}
}

function Ok()
{
	if ( window.frames["frmMain"].Ok && window.frames["frmMain"].Ok() )
		Cancel() ;
}

function Cancel()
{
	window.close() ;
}

// Object that holds all available tabs.
var oTabs = new Object() ;

function TabDiv_OnClick()
{
	SetSelectedTab( this.TabCode ) ;
}

function AddTab( tabCode, tabText, startHidden )
{
	if ( typeof( oTabs[ tabCode ] ) != 'undefined' )
		return ;

	var eTabsRow = document.getElementById( 'Tabs' ) ;

	var oCell = eTabsRow.insertCell(  eTabsRow.cells.length - 1 ) ;
	oCell.noWrap = true ;

	var oDiv = document.createElement( 'DIV' ) ;
	oDiv.className = 'PopupTab' ;
	oDiv.innerHTML = tabText ;
	oDiv.TabCode = tabCode ;
	oDiv.onclick = TabDiv_OnClick ;

	if ( startHidden )
		oDiv.style.display = 'none' ;

	eTabsRow = document.getElementById( 'TabsRow' ) ;

	oCell.appendChild( oDiv ) ;

	if ( eTabsRow.style.display == 'none' )
	{
		var eTitleArea = document.getElementById( 'TitleArea' ) ;
		eTitleArea.className = 'PopupTitle' ;

		oDiv.className = 'PopupTabSelected' ;
		eTabsRow.style.display = '' ;

		if ( ! window.dialogArguments.Editor.FCKBrowserInfo.IsIE )
			window.onresize() ;
	}

	oTabs[ tabCode ] = oDiv ;
	oTabs[ tabCode ].Index = oTabs.length - 1 ;
}

function SetSelectedTab( tabCode )
{
	for ( var sCode in oTabs )
	{
		if ( sCode == tabCode )
			oTabs[sCode].className = 'PopupTabSelected' ;
		else
			oTabs[sCode].className = 'PopupTab' ;
	}

	if ( typeof( window.frames["frmMain"].OnDialogTabChange ) == 'function' )
		window.frames["frmMain"].OnDialogTabChange( tabCode ) ;
}

function SetTabVisibility( tabCode, isVisible )
{
	var oTab = oTabs[ tabCode ] ;
	oTab.style.display = isVisible ? '' : 'none' ;

	if ( ! isVisible && oTab.className == 'PopupTabSelected' )
	{
		for ( var sCode in oTabs )
		{
			if ( oTabs[sCode].style.display != 'none' )
			{
				SetSelectedTab( sCode ) ;
				break ;
			}
		}
	}
}

function SetOnKeyDown( targetDocument )
{
	targetDocument.onkeydown = function ( e )
	{
		e = e || event || this.parentWindow.event ;
		switch ( e.keyCode )
		{
			case 13 :		// ENTER
				var oTarget = e.srcElement || e.target ;
				if ( oTarget.tagName == 'TEXTAREA' ) return ;
				Ok() ;
				return false ;
			case 27 :		// ESC
				Cancel() ;
				return false ;
				break ;
		}
		return true ;
	}
}
SetOnKeyDown( document ) ;

function DisableContextMenu( targetDocument )
{
	if ( window.dialogArguments.Editor.FCKBrowserInfo.IsIE ) return ;

	// Disable Right-Click
	var oOnContextMenu = function( e )
	{
		var sTagName = e.target.tagName ;
		if ( ! ( ( sTagName == "INPUT" && e.target.type == "text" ) || sTagName == "TEXTAREA" ) )
			e.preventDefault() ;
	}
	targetDocument.addEventListener( 'contextmenu', oOnContextMenu, true ) ;
}
DisableContextMenu( document ) ;

if ( ! window.dialogArguments.Editor.FCKBrowserInfo.IsIE )
{
	window.onresize = function()
	{
		var oFrame = document.getElementById("frmMain") ;

		if ( ! oFrame )
		return ;

		oFrame.height = 0 ;

		var oCell = document.getElementById("FrameCell") ;
		var iHeight = oCell.offsetHeight ;

		oFrame.height = iHeight - 2 ;
	}
}

window.onfocus = function()
{
	document.getElementById('frmMain').contentWindow.focus() ;
}

if ( window.dialogArguments.Editor.FCKBrowserInfo.IsIE )
{
	function Window_OnBeforeUnload()
	{
		for ( var t in oTabs )
			oTabs[t] = null ;

		window.dialogArguments.Editor = null ;
	}
	window.attachEvent( "onbeforeunload", Window_OnBeforeUnload ) ;
}

		</script>
			
	</head>
	<body onload="LoadInnerDialog();" class="PopupBody">
	<div id="contentborder" align="center">
		<table height="100%" cellspacing="0" cellpadding="0" width="100%" border="0">
			<tr>
			<td colspan="3" class="table_headtd">
					<table width="100%" border="0" cellspacing="0" cellpadding="00">
						<tr>
							<td class="table_headtd_img" >
								<img src="<%=frameroot%>/images/ico/ico.gif" >&nbsp;
							</td>
							<td align="left" style="padding-top: 5px">
								<script type="text/javascript">
								window.document.write("<strong>"+sTitle+"</strong>");
								</script>
							</td>
							<td align="right" style="padding-top: 5px">
								<table border="0" align="right" cellpadding="00" cellspacing="0">
					                <tr>
					                 	<td width="7"><img src="<%=frameroot%>/images/ch_h_l.gif"/></td>
					                 	<td class="Operation_input" onclick="Ok();">&nbsp;保&nbsp;存&nbsp;</td>
					                 	<td width="7"><img src="<%=frameroot%>/images/ch_h_r.gif"/></td>
				                  		<td width="5"></td>
					                 	
					                 	<td width="8"><img src="<%=frameroot%>/images/ch_z_l.gif"/></td>
					                 	<td class="Operation_input1" onclick="Cancel();">&nbsp;关&nbsp;闭&nbsp;</td>
					                 	<td width="7"><img src="<%=frameroot%>/images/ch_z_r.gif"/></td>
				                  		<td width="6"></td>
					                </tr>
					            </table>
							</td>
						</tr>
					</table>
				</td>
			</tr>
			<tr id="TabsRow" style="DISPLAY: none">
				<td class="PopupTabArea">
					<table border="0" cellpadding="0" cellspacing="0" width="100%">
						<tr id="Tabs" onselectstart="return false;">
							<td class="PopupTabEmptyArea">&nbsp;</td>
							<td class="PopupTabEmptyArea" width="100%">&nbsp;</td>
						</tr>
					</table>
				</td>
			</tr>
			<tr valign="top" style="padding-top: 0px">
				<td id="FrameCell"  >
					<iframe id="frmMain" src="fckblank.html" name="frmMain" frameborder="0" height="100%" width="100%" scrolling="auto">
					</iframe>
				</td>
			</tr>
			<tr style="display: none">
				<td class="PopupButtons">
					<table border="0" cellpadding="0" cellspacing="0" style="padding-top:10px;">
						<tr>
							<td width="100%">&nbsp;</td>
							<td nowrap="nowrap">
								<input id="btnOk" style="VISIBILITY: hidden; WIDTH: 100px" type="button" value="Ok" class="Button"
									onclick="Ok();" fckLang="DlgBtnOK" />&nbsp; <input type="button" value="Cancel" class="Button" onclick="Cancel();" fckLang="DlgBtnCancel" />
							</td>
						</tr>
					</table>
				</td>
			</tr>
		</table>
		</div>
	</body>
</html>
<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib uri="/tags/web-flex" prefix="webflex"%>
<%@ taglib uri="/struts-tags" prefix="s"%>
<%@ taglib uri="/tags/security" prefix="security"%>
<%@include file="/common/include/rootPath.jsp"%>
<%@ taglib uri="/tags/web-newdate" prefix="strong"%>
<HTML>
	<HEAD>
		<TITLE>操作内容</TITLE>
		<%@include file="/common/include/meta.jsp"%>
		<LINK href="<%=frameroot%>/css/properties_windows.css" type=text/css
			rel=stylesheet>
		<script src="<%=path%>/common/js/jquery/jquery-1.2.6.js"
			type="text/javascript"></script>
			<style type="text/css">
			#contentborder {
				BORDER-RIGHT: #DBDBDB  1px solid;
				PADDING-RIGHT: 1px;
				PADDING-LEFT: 1px;
				BACKGROUND: white;
				PADDING-BOTTOM: 10px;
				OVERFLOW: auto;
				BORDER-LEFT: #DBDBDB 1px solid;
				WIDTH: 100%;
				BORDER-BOTTOM: #DBDBDB 1px solid;
				POSITION: absolute;
				HEIGHT: 100%;
				margin-left: 1px;
			}
			</style>
	</HEAD>
	<script language="javascript">
	   window.name="targetWindow";
	  
	function onsub(serach,temp,sumer){
		if(serach=="fasong"){
			document.getElementById("myTableForm").action ="<%=root%>/sends/docSend!docsearchs.action";   
		}else{
			document.getElementById("myTableForm").action ="<%=root%>/sends/docSend!getBorrowReports.action";   
		}
		if(temp=="title"){
			document.getElementById("docModel.docTitle").value=sumer;
			document.getElementById("docModel.docCode").value="";
		}else{
			document.getElementById("docModel.docCode").value=sumer;
			document.getElementById("docModel.docTitle").value="";
		}
		document.getElementById("myTableForm").submit();
	}
	</script>
	<body class="contentbodymargin">
	 <DIV id=contentborder align=center>
			<s:form id="myTableForm" action="/sends/docSend!docsearchs.action">
			<input type="hidden" id="docModel.docTitle" name="docModel.docTitle" value=""/>
			<input type="hidden" id="docModel.docCode" name="docModel.docCode" value="" />
			<table>
				<tr>
					<td>
						设置要查询的条件后，点击查询按钮将展现查询结果
					</td>
				</tr>
			</table>
			</s:form>
		</div>
	</body>
</HTML>

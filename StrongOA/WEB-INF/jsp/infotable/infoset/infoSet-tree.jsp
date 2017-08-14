<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib uri="/tags/web-tree" prefix="tree"%>
<%@ taglib uri="/struts-tags" prefix="s"%>
<%@include file="/common/include/rootPath.jsp"%>
<html>
	<head>
		<%@include file="/common/include/meta.jsp"%>
		<link href="<%=frameroot%>/css/properties_windows.css" type=text/css rel=stylesheet>
		<link href="<%=frameroot%>/css/treeview.css" type=text/css rel=stylesheet>
		<script src="<%=root%>/common/js/mztree_check/mztreeview_check.js"></script>
	</head>
	<body>
		<DIV id=contentborder cellpadding="0" style="background-color:#eeeff3;">
			<tree:strongtree title="信息集" check="false" dealclass="com.strongit.oa.infotable.infoset.DealTreeNode" data="${infosetlist}" target="project_work_content" roothref="infotable/infoset/infoSet.action?infoSetParentid=0" />
		</DIV>
	</body>
</html>
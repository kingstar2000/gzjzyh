<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@include file="/common/include/rootPath.jsp"%>
<HTML>
	<HEAD>
		<%@include file="/common/include/meta.jsp"%>
		<TITLE>栏目管理页面内容</TITLE>
	</HEAD>
	<FRAMESET cols="25%,75%" frameborder="no" border="0" framespacing="0">

		<FRAME name="project_work_tree" marginWidth=0 marginHeight=0
			src="<%=root%>/infopub/column/column!tree.action"
			frameBorder=0 scrolling=no>

		<FRAME name="project_work_content" marginWidth=0 marginHeight=0
			src="<%=root%>/fileNameRedirectAction.action?toPage=infopub/column/column_init.jsp"
			frameBorder=1 scrolling=no>
	</FRAMESET>
	<noframes></noframes>
</HTML>

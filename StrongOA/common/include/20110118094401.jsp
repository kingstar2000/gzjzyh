<%@ page language="java" import="java.util.*"%>
<jsp:directive.page import="com.strongit.oa.common.user.util.PrivilHelper"/>
<jsp:directive.page import="com.strongit.uums.bo.TUumsBasePrivil"/>
<%
String path = request.getContextPath();
if(path.endsWith("/")) path="";
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
String httpPath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort();
String root = path;
//String frameroot = path+"/frame/theme_gray";
String jsroot = path+"/common/js";
String frameroot= (String) request.getSession().getAttribute("frameroot"); 
if(frameroot==null||frameroot.equals("")||frameroot.equals("null"))
 	frameroot= "/frame/theme_gray";
frameroot=path+frameroot;

String version= (String) request.getSession().getAttribute("version"); 
String privilName = request.getParameter("privilSyscode");
if(privilName != null && privilName.length() > 0){
	TUumsBasePrivil privil = PrivilHelper.getPrivil("001-" + privilName);
	if(privil != null){
		privilName = privil.getPrivilName();
	} else {
		privilName = "";
	}
} else {
	privilName = "";
}
%>
<script type="text/javascript">
  var scriptroot="<%=root%>";
  var contextPath="<%=root%>";
  var frameroot="<%=frameroot%>";
  var jsroot="<%=jsroot%>";
  var basePath = "<%=basePath%>";
  var httpPath = "<%=httpPath%>";
  try{
	  if(window.top.perspective_content.navigator_container==undefined){
		window.location.reload();
	  }
	  if(window.top.perspective_content.navigator_container.navigator_content==undefined){
		window.location.reload();
	  }
  }catch(err){
  }
  var windowMenu = window.top.perspective_content.navigator_container.navigator_content;
  var windowTop = window.top.perspective_top;
  var windowWork = window.top.perspective_content.actions_container.personal_properties_toolbar;

</script>
<!-- 统一【alert,confirm】风格 add by dengzc -->
<SCRIPT LANGUAGE="JavaScript" src="<%=path%>/common/js/commontab/service.js"></SCRIPT>
<SCRIPT LANGUAGE="JavaScript" src="<%=path%>/common/js/commontab/workservice.js"></SCRIPT>
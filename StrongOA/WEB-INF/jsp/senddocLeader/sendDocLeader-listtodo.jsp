<%@page language="java" contentType="text/html; charset=UTF-8"  pageEncoding="UTF-8"%>
<%@taglib uri="/tags/web-flex" prefix="webflex"%>
<%@taglib uri="/tags/web-newdate" prefix="strong"%>
<%@ taglib uri="/struts-tags" prefix="s"%>
<%@ taglib uri="/tags/c.tld" prefix="c" %>
<%@ taglib uri="/tags/security" prefix="security"%>
<%@include file="/common/include/rootPath.jsp"%>
<html>
  <head>
    <title>待办工作列表</title>
    <%@include file="/common/include/meta.jsp" %>
    <link href="<%=frameroot%>/css/strongitmenu.css" type="text/css" rel="stylesheet">
    <link href="<%=frameroot%>/css/properties_windows.css" type="text/css" rel="stylesheet">
    <link href="<%=frameroot%>/css/search.css" type="text/css" rel="stylesheet">
    <script language='javascript' src='<%=path%>/common/js/grid/ChangeWidthTable.js' type="text/javascript"></script>
    <script src="<%=path%>/common/js/jquery/jquery-1.2.6.js" type="text/javascript"></script>
    <script language="javascript" src="<%=path%>/common/js/menu/menu.js" type="text/javascript"></script>
    <script src="<%=path%>/common/js/validate/checkboxvalidate.js" type="text/javascript"></script>
    <script src="<%=path%>/common/js/common/common.js" type="text/javascript"></script>
    <script src="<%=path%>/common/js/common/search.js" type="text/javascript"></script> 
    <style media="screen" type="text/css">
    .tabletitle {
      FILTER:progid:DXImageTransform.Microsoft.Gradient(
                            gradientType = 0, 
                            startColorStr = #ededed, 
                            endColorStr = #ffffff);
    }
    
    .hand {
      cursor:pointer;
    }
    </style>
    <script type="text/javascript">     
    	$(document).ready(function(){
	       //搜索
	       $("#img_search").click(function(){
	       		$("form").submit();
	       });
    	});
    	
    	function showtype(isback, assignType){
    		if("1"==isback){
    			return "退回";
    		}else if("0"==assignType){
    			return "委托";
    		}else if("1"==assignType){
    			return "指派";
    		}else{
    			return "普通";
    		}
    	}
    	
    	 //重定向到此页面
      function reloadPage() {
      	$("#img_search").click();
      }	
    </script>
  </head>
  <body class="contentbodymargin" oncontextmenu="return false;" onload="initMenuT();">
    <script type="text/javascript" src="<%=path%>/common/js/newdate/WdatePicker.js"></script>
    <div id="contentborder" align="center">
      <table width="100%" border="0" cellspacing="0" cellpadding="0" style="vertical-align: top;">
        <tr>
          <td height="40" class="tabletitle">
            <table width="100%" border="0" align="right" cellpadding="0" cellspacing="0">
              <tr><%----%>
                <td width="20%">
                &nbsp; <img src="<%=frameroot%>/images/ico.gif" width="9" height="9"  alt=""/> 待办提醒
                </td>
                <td>&nbsp;</td>
                <td width="55%">
                  <table border="0" align="right" cellpadding="00" cellspacing="0">
                  	<tr>
                  		<td ><a  class="Operation" href="JavaScript:pendWork();">
                  		<img class="img_s" src="<%=frameroot%>/images/banli.gif" width="15" height="15" alt="">查阅&nbsp;</a></td>
		                <td width="5">&nbsp;</td>
		            <td >
						<a class="Operation" href="javascript:workflowView();"><img
								src="<%=frameroot%>/images/chakan.gif" width="15" height="15"
								class="img_s">办理记录&nbsp;</a> 
					</td>
					<!--  <td width="5"></td>
					 <td >
	                  <a class="Operation" href="javascript:tjst();">&nbsp;统计视图&nbsp;</a> 
	                </td>-->
					<%--
		                <td ><a  class="Operation" href="JavaScript:zp();"><img class="img_s" src="<%=frameroot%>/images/weituo.gif" width="15" height="15" alt="">指派&nbsp;</a></td>
		                <td width="5">&nbsp;</td>
                  	--%></tr>
                  </table>
                </td>
                
              </tr>
            </table>
          </td>
        </tr>
        <tr>
          <td height="100%">
          <s:form name="myTableForm" action="/work/work!listtodo.action">
          <input id="listMode" type="hidden" value="${listMode }"/>
          <s:hidden name="workflowName" id="workflowName"></s:hidden>
          <s:hidden name="workflowType" id="workflowType"></s:hidden>
          <s:hidden name="excludeWorkflowType" id="excludeWorkflowType"></s:hidden>
          <s:hidden name="handleKind" id="handleKind"></s:hidden>
          <s:hidden name="type" id="type"></s:hidden>
          <s:hidden name="formId" id="formId"></s:hidden>
            <webflex:flexTable name="myTable" width="100%" height="200px"
              wholeCss="table1" property="senddocId" isCanDrag="true"
              isCanFixUpCol="true" clickColor="#A9B2CA" footShow="showCheck"
              getValueType="getValueByProperty" collection="${pageWorkflow.result}"
              page="${pageWorkflow}" pagename="pageWorkflow">
              <table width="100%" border="0" cellpadding="0" cellspacing="1"
                class="table1">
                <tr>
                  <td width="3%" align="center" class="biao_bg1">
                    <img id="img_search" style="cursor: hand;" src="<%=frameroot%>/images/sousuo.gif" width="17"
                      height="16">
                  </td>
                  <td width="60%" class="biao_bg1">
                    <s:textfield name="businessName" title="请输入标题" cssClass="search"></s:textfield> 
                  </td>
                  <%--<td width="15%" class="biao_bg1">
                   <s:textfield name="userName" title="请输入主办人" cssClass="search"></s:textfield> 
                  </td>
                  --%>
                  <td width="21%" align="center" class="tabletitle">
                    	<strong:newdate name="startDate" id="startDate" width="98%"
                      skin="whyGreen" isicon="true" dateform="yyyy-MM-dd" dateobj="${startDate}" classtyle="search" title="输入发起开始时间"></strong:newdate>
                    <%--
                  <input type="text" name="startDate" id="startDate" width="100%" class = "search" onfocus="WdatePicker()" title="输入发起开始时间">
                  --%>
                  </td>
                  <td width="21%" align="center" class="biao_bg1">
                  		<strong:newdate name="endDate" id="endDate" width="98%"
                      skin="whyGreen" isicon="true" dateform="yyyy-MM-dd" dateobj="${endDate}"  classtyle="search" title="输入发起结束时间"></strong:newdate>
                  <%--
                  <input type="text" name="endDate" id="endDate" width="100%" class = "search" onfocus="WdatePicker()" title="输入发起结束时间">
                  --%>
                  </td>
                  <%--<td width="10%" align="center" class="biao_bg1">
                  		<s:select name="isBackSpace" list="#{'4':'全部','0':'退回','1':'委托','2':'指派','3':'普通'}" listKey="key" listValue="value" style="width:100%" onchange='$("#img_search").click();'/>
                  </td>
				  --%><td width="1%" align="center" class="biao_bg1">
                    &nbsp;
                  </td>
                </tr>
              </table>
			  <webflex:flexCheckBoxCol caption="选择" property="taskId"
									showValue="taskId" width="4%" isCheckAll="true"
									isCanDrag="false" isCanSort="false"></webflex:flexCheckBoxCol>
              <webflex:flexTextCol caption="标题"
									property="taskId" showValue="businessName" onclick="getinfo(this.value)" showsize="35"
									width="49%" isCanDrag="false" isCanSort="false"></webflex:flexTextCol>
			 <webflex:flexDateCol caption="发起时间"
									property="workflowStartDate" showValue="workflowStartDate"
									width="15%" isCanDrag="false"
									dateFormat="yyyy-MM-dd" isCanSort="false"></webflex:flexDateCol>
              <webflex:flexTextCol caption="上步办理人"
									property="preTaskActor" showValue="preTaskActor"
									width="10%" isCanDrag="false" isCanSort="false" showsize="8"></webflex:flexTextCol>
              <webflex:flexTextCol caption="所在部门"
									property="preTaskActorOrgName" showValue="preTaskActorOrgName"
									width="22%" isCanDrag="false" isCanSort="false" showsize="8"></webflex:flexTextCol>
            </webflex:flexTable>
            </s:form>
          </td>
        </tr>
      </table>
      	<%--<div align="center" height="50%">
			<iframe id="blank" name="frame_query" width="100%" src="<%=path %>/fileNameRedirectAction.action?toPage=/workflow/viewinfo.jsp" height="100%" frameborder="no" border="0" marginwidth="0" marginheight="0"  scrolling="no"></iframe>
		</div>	
    --%></div>
    <script language="javascript">
      var sMenu = new Menu();
      function initMenuT(){
        sMenu.registerToDoc(sMenu);
        var item = null;
	        item = new MenuItem("<%=frameroot%>/images/banli.gif","查阅 ","pendWork",1,"ChangeWidthTable","checkMoreDis");
	        sMenu.addItem(item);
	    item = new MenuItem("<%=frameroot%>/images/chakan.gif","办理记录 ","workflowView",1,"ChangeWidthTable","checkMoreDis");
	    sMenu.addItem(item);      
	        //item = new MenuItem("<%=frameroot%>/images/weituo.gif","指派","zp",1,"ChangeWidthTable","checkMoreDis");
	        //sMenu.addItem(item);
        sMenu.addShowType("ChangeWidthTable");
        registerMenu(sMenu);
      }
      //获取选中的信息
      function getInfo(id){
          var info = new Array();
          <c:forEach items="${pageWorkflow.result}" var="obj" varStatus="status">
         	var bid = '<c:out value="${obj.taskId}"/>';//任务实例ID
         	if(bid == id){
         	   info[0] = '<c:out value="${obj.instanceId}"/>';//流程实例ID
         	   info[1] = '<c:out value="${obj.workflowType}"/>';//流程类型ID
         	   info[2] = '<c:out value="${obj.businessName}"/>';//标题
         	   info[3] = '<c:out value="${obj.workflowName}"/>';//标题
         	 }
          </c:forEach>
          return info;
       }
       //指派
       function zp(){
       	var taskId = getValue();
       	if(taskId == ""){
       		alert("请选择要指派的工作！");
       		return ;
       	}else{
       		if(taskId.split(",").length>1){
       			alert("一次只能指派一份工作！");
       			return;
       		}
       	}
       	$.post("<%=root%>/work/work!checkCanReturn.action",
       			{taskId:taskId},
       			function(data){
       				if(data == "-1"){
       					alert("此任务不存在或已删除，操作失败！");
       				}else if(data == "-2"){
       					alert("操作失败，请与管理员联系！");
       				}else{
       					var flags = data.split("|");
       					var flagzp = flags[2];//指派
       					if(flagzp == "1"){//允许指派
       						var taskActors = "";
							var url = scriptroot+"/workflowRun/action/runUserSelect!input.action?dispatch=reassign&nodeId=0&taskId=" + taskId + "&taskActors=" + taskActors;
							var userstr = OpenWindow(url, 420, 450, window);          
							//用户ID|用户名称,指派是否需要返回（0：否、1：是）
							if(userstr!=null && userstr!=''){
								var info = getInfo(taskId);
             					var instanceId   = info[0];
             					var workflowType = info[1];
             					var bussinessTitle = info[2];
								$.post("<%=root%>/work/work!reAssign.action",{taskId:taskId,suggestion:encodeURI(userstr),businessName:encodeURI(bussinessTitle)},
									   function(retCode){
									   		if(retCode == "0"){
									   			alert("任务指派成功！");
									   			parent.location = "<%=root%>/fileNameRedirectAction.action?toPage=/work/work-todomain.jsp";
									   		}else if(retCode == "-1"){
									   			alert("任务实例不存在或已删除！");
									   		}else if(retCode == "-2"){
									   			alert("指派过程中出现异常！");
									   		}else if(retCode == "-3"){
									   			alert("参数传输错误！");
									   		}
									   }			
								);
							}
       					}else if(flagzp == "0"){//不允许指派
       						alert("对不起，此任务不允许指派！");
       					}else{
       						alert("对不起，出现未知错误！请与管理员联系！");
       					}
       				}
       			});
       }
       //办理状态
 	   function workflowView(){
 	   	var taskId = getValue();
          if(taskId == ""){
          	alert("请选择要查看的工作！");
          	return ;
          }else{
          	var taskIds = taskId.split(",");
          	if(taskIds.length>1){
          		alert("一次只能查看一项工作！");
          		return ;
          	}
          } 
          var info = getInfo(taskId);
          var instanceId   = info[0]; 
          var width=screen.availWidth-10;;
          var height=screen.availHeight-30;
          //var ReturnStr=OpenWindow("<%=root%>/work/work!PDImageView.action?instanceId="+instanceId, 
          //                         width, height, window);
           WindowOpen("<%=root%>/fileNameRedirectAction.action?toPage=/work/work-container.jsp?instanceId="+instanceId+"&taskId="+taskIds,'Cur_workflowView',width, height, "办理记录");
         //  var ReturnStr=OpenWindow("<%=root%>/fileNameRedirectAction.action?toPage=/work/work-container.jsp?instanceId="+instanceId+"&taskId="+taskIds, 
           //                        width, height, window);
 	   }	
       
       //办理
       	/**
		 * 判断目前任务是否可被当前用户处理
		 * @author:邓志城
		 * @date:2009-12-17 下午04:00:25
		 * @return
		 * 	1、f1|该任务正在被其他人处理或被挂起
		 * 	2、f2|该任务已被取消
		 * 	3、f3|该任务已被其他人处理
		 * 	4、f4|可被处理
		 * 	5、任务实例不存在返回-1
		 * 	6、抛出异常返回-2
		 * @throws Exception
		 */		
       function pendWork() {
        var taskId = getValue();
          if(taskId == ""){
          	alert("请选择要查阅的流程！");
          	return ;
          }else{
          	var taskIds = taskId.split(",");
          	if(taskIds.length>1){
          		alert("一次只能查阅一个流程！");
          		return ;
          	}
          }
          var info = getInfo(taskId);
          var instanceId   = info[0]; 
    	  var width=screen.availWidth-10;
		  var height=screen.availHeight-30;
		    //更改为CA认证Action dengzc 2011年4月2日16:05:09 
		  var ret=WindowOpen("<%=root%>/senddocLeader/sendDocLeader!viewProcessed.action?instanceId="+instanceId+"&taskId="+taskId,'processed',width, height, "");
       }
       
        function getInstanceId(taskId){
      	var info = new Array();
      	<s:iterator value="pageWorkflow.result" var="obj">
      		if(taskId == '${obj.taskId}'){
      			info[0] = '${obj.instanceId}';//流程实例id
      			info[1] = taskId;
      		}
      	</s:iterator>
      	return info ;
      }
      function getinfo(workId){
	 	  var taskId = workId;
          if(taskId == ""){
          	alert("请选择要查阅的流程！");
          	return ;
          }else{
          	var taskIds = taskId.split(",");
          	if(taskIds.length>1){
          		alert("一次只能查阅一个流程！");
          		return ;
          	}
          }
          var info = getInfo(taskId);
          var instanceId = info[0]; 
    	  var width=screen.availWidth-10;
		  var height=screen.availHeight-30;
		    //更改为CA认证Action dengzc 2011年4月2日16:05:09 
		  var ret=WindowOpen("<%=root%>/senddocLeader/sendDocLeader!viewProcessed.action?instanceId="+instanceId+"&taskId="+taskId,'processed',width, height, "");
}
function tjst(){
	window.location.href="<%=path%>/senddocLeader/sendDocLeader!todoWorkflow.action?excludeWorkflowType=${excludeWorkflowType}&workflowType=${workflowType}&handleKind=${handleKind}&type=${type}&formId=${formId}";
}
      /*
  //得到相关信息【通过任务ID和流程ID链接】
function getinfo(workId){
	var info = getInstanceId(workId);
	var instanceId = info[0];
	 var fullContextPath = $("form").attr("action");
  	var contextPath = fullContextPath.substring(0,fullContextPath.indexOf("!"));//得到上下文路径
	//alert(instanceId);
	document.getElementById('blank').contentWindow.setWorkId(workId,instanceId,contextPath); 
		//document.getElementById("blank").setWorkId(value);
}
*/
    </script>
  </body>
</html>
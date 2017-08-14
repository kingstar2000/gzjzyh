<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<!--  引用标签处-->
<%@ taglib uri="/struts-tags" prefix="s"%>
<%@ taglib uri="/tags/web-flex" prefix="webflex"%>
<%@ taglib uri="/tags/web-newdate" prefix="strong"%>
<%@ taglib uri="/tags/security" prefix="security"%>
<!--  引用公共文件,以下两个文件是建议包含-->
<%@include file="/common/include/rootPath.jsp" %>

<HTML>
	<HEAD>
	<%@include file="/common/include/meta.jsp" %>
	<!--  引用公共样式文件,建议所有样式都以文件方式定义在jsp文件外部,通常定义在WebRoot目录下的CSS文件夹下-->
	<link href="<%=frameroot%>/css/strongitmenu.css" type="text/css" rel="stylesheet"><!--右键菜单样式 -->
	<LINK href="<%=frameroot%>/css/properties_windows_list.css" type=text/css rel=stylesheet>
	<LINK href="<%=frameroot%>/css/search.css" type=text/css  rel=stylesheet>
	<!--  引用公共及自定义js文件,建议js都以文件方式定义在jsp文件外部,通常定义在WebRoot目录下的js文件夹下-->
	<SCRIPT language="javascript" src="<%=path%>/common/js/menu/menu.js"></SCRIPT><!--右键菜单脚本 -->
	<script language='javascript' src='<%=path%>/common/js/grid/ChangeWidthTable.js'></script>
	<script language='javascript' src='<%=path%>/common/js/jquery/jquery-1.2.6.js'></script>
	<script src="<%=path%>/common/js/common/common.js" type="text/javascript"></script>
		<script language="javascript" src="<%=path%>/common/js/common/windowsadaptive.js"></script>
	<!--<script language='javascript' src='<%=path%>/common/js/common/search.js'></script>
		--><TITLE>通知公告列表</TITLE>
		
		<style type="text/css">
		<!--
		body {
			width:100%;
			margin-left: 0px;
			margin-top: 0px;
			margin-right: 0px;
			margin-bottom: 0px;
			height: 100%
		}
		</style>
		<script type="text/javascript">
			function addNotify(){
				var id = getValue();
				var input = document.getElementById("inputType").value;
				//location = "notify!add.action?inputType="+input;
				var a = OpenWindow("notify!add.action?inputType="+input,700,500);
				if(a=="reload"){
					location.reload();
				}
			}
	
	function delNotify(){
		var id = getValue();
		var url = "notify!delete.action";
		var input = document.getElementById("inputType").value;
		if(id==null|id==""){
			alert("请选择要删除的记录。");
		}else{
			if(confirm("确定要删除吗？")){
				$.ajax({
					type:"post",
					url:url,
					data:{
						afficheId:id
					},
					success:function(data){
							if(data!="" && data!=null){
								alert(data);					
							}else{
								// alert("删除成功");
								location.reload() ;
							}
						},
					error:function(data){
						alert("对不起，操作异常"+data);
					}
			   });
				//url = "notify!delete.action?afficheId="+id+"&inputType="+input;
			}
		}
	}
	
			function editNotify(){
				var id = getValue();
				if(id==null||id==""){
					alert("请选择要编辑的记录。");
				}else{
					if(id.indexOf(",")!=-1){
						alert("只可以编辑一条记录。");
					}else{
						var input = document.getElementById("inputType").value;
						var a = OpenWindow("notify!edit.action?afficheId="+id+"&inputType="+input,700,500);
						if(a=="reload"){
							location.reload();
						}
					}
				}
			}
			
			//发布公告
			function publicNotify(){
				var id = getValue();
				if(id.indexOf(",")>0){
					alert("只可以发布一条记录。")
					return ;
				}
				var flag=true;
				 $("input:checkbox").each(function(){
					   if($(this).attr("checked") &&  $(this).parent().next().next().next().next().text()=="已过期"){
						    flag=false;
					      }
				 });
				var url = "notify!publicNotify.action";
				if(id==null|id==""){
					alert("请选择要发布的记录。");
				}else if(flag==false){
					alert("该公告已过期，如要发布请修改失效日期。");
					return ;
				}else{
					if(confirm("确定要发布吗？")){
						$.ajax({
							type:"post",
							url:url,
							data:{
								afficheId:id
							},
							success:function(data){
									if(data=="reload"){
	 									location.reload() ;
									}else if(data=="sended"){
										alert("该公告已经发布。");
									}else if(data=="notfind"){
										alert("没有找到该公告。");
									}
								},
							error:function(data){
								alert("对不起，操作异常"+data);
							}
					   });
					}
				}
			}
			
			function viewNotify(){
				var id = getValue();
				if(""==id|null==id){
					alert("请选择要查看的记录。");
					return;
				}
				if(id.indexOf(",")>0){
					alert("只可以查看一条记录。");
					return
				}
				location = "notify!view.action?afficheId="+id+"&inputType=mylist";
			}
			
			function searchNotify(){
				var input = document.getElementById("inputType").value;
				location = "notify!search.action?inputType="+input;
			}
			
			
			$(document).ready(function(){
				$("#img_sousuo").click(function(){
					$("#afficheTitle").val(encodeURI($("#searchTitle").val()));
					$("#afficheGov").val(encodeURI($("#SearchAfficheGov").val()));
					$("form").submit();
				});
				
				$("#afficheTitle").val(encodeURI($("#searchTitle").val()));
				$("#afficheGov").val(encodeURI($("#SearchAfficheGov").val()));
				
				function delNotify(){
					//alert();
				}
			}); 
			function toViewAffiche(id){
				if(""==id|null==id){
					return;
				}
			
				location = "notify!view.action?afficheId="+id+"&inputType=mylist";
			}
			
			function showTitle(afficheTitle,afficheTitleColour,afficheTitleBold){
				if(afficheTitleBold == "1"){
				
					return "<font color="+afficheTitleColour+"><B>"+afficheTitle+"</B></font>";
				}else{
		
					return "<font color="+afficheTitleColour+">"+afficheTitle+"</font>";
				}
			}
			function showTitle1(afficheTitle,afficheTitleColour,afficheTitleBold){
				
		
					return afficheTitle;
		
			}
		</script>
	</HEAD>
	<BODY class=contentbodymargin oncontextmenu="return false;"
		onload=initMenuT()>
	<script type="text/javascript" src="<%=path%>/common/js/newdate/WdatePicker.js"></script>
	<input type="hidden" id="inputType" name="inputType" value="${inputType}">
		<DIV id=contentborder align=center>
			<table width="100%" border="0" cellspacing="0" cellpadding="00">
				<tr>
					<td colspan="3" class="table_headtd">
					<table width="100%" border="0" cellspacing="0" cellpadding="00">
						<tr>
							<td class="table_headtd_img" >
								<img src="<%=frameroot%>/images/ico/ico.gif" >&nbsp;
							</td>
							<td align="left">
								<strong>我的公告栏</strong>
							</td>
							<td align="right">
								<table border="0" align="right" cellpadding="00" cellspacing="0">
						            <tr>
						            	<td width="4"><img src="<%=frameroot%>/images/bt_l.jpg"/></td>
					                 	<td class="Operation_list" onclick="addNotify();"><img src="<%=root%>/images/operationbtn/add.png"/>&nbsp;新&nbsp;建&nbsp;</td>
					                 	<td width="4"><img src="<%=frameroot%>/images/bt_r.jpg"/></td>
				                  		<td width="5"></td>
				                  		<td width="4"><img src="<%=frameroot%>/images/bt_l.jpg"/></td>
					                 	<td class="Operation_list" onclick="viewNotify();"><img src="<%=root%>/images/operationbtn/view.png"/>&nbsp;查&nbsp;看&nbsp;</td>
					                 	<td width="4"><img src="<%=frameroot%>/images/bt_r.jpg"/></td>
				                  		<td width="5"></td>
				                  		<td width="4"><img src="<%=frameroot%>/images/bt_l.jpg"/></td>
					                 	<td class="Operation_list" onclick="editNotify();"><img src="<%=root%>/images/operationbtn/edit.png"/>&nbsp;编&nbsp;辑&nbsp;</td>
					                 	<td width="4"><img src="<%=frameroot%>/images/bt_r.jpg"/></td>
				                  		<td width="5"></td>
				                  		<td width="4"><img src="<%=frameroot%>/images/bt_l.jpg"/></td>
					                 	<td class="Operation_list" onclick="publicNotify();"><img src="<%=root%>/images/operationbtn/public.png"/>&nbsp;发&nbsp;布&nbsp;</td>
					                 	<td width="4"><img src="<%=frameroot%>/images/bt_r.jpg"/></td>
				                  		<td width="5"></td>
				                  		<td width="4"><img src="<%=frameroot%>/images/bt_l.jpg"/></td>
					                 	<td class="Operation_list" onclick="delNotify();"><img src="<%=root%>/images/operationbtn/del.png"/>&nbsp;删&nbsp;除&nbsp;</td>
					                 	<td width="4"><img src="<%=frameroot%>/images/bt_r.jpg"/></td>
				                  		<td width="5"></td>
				                  		
				                  		<td width="2%"></td>
					                 	<%--<security:authorize ifAllGranted="001-0003000600020004">
					                 	<td width="50"><a class="Operation" href="javascript:searchNotify();"><img src="<%=root%>/images/ico/sousuo.gif" width="15" height="15" class="img_s">查找</a></td>
					                 	<td width="5"></td>
					                 	</security:authorize>
					                --%></tr>
					            </table>
							</td>
						</tr>
					</table>
				</td>
				<tr>
					<td>
					<s:form id="myTableForm" action="notify!mylist.action" method="get">
					<input type="hidden" name="model.afficheTitle" id="afficheTitle" value="${model.afficheTitle }">
					<input type="hidden" name="model.afficheGov" id="afficheGov" value="${model.afficheGov }">
						<webflex:flexTable name="myTable" width="100%" height="365px" wholeCss="table1" property="afficheId" isCanDrag="true"  isCanFixUpCol="true" clickColor="#A9B2CA" footShow="showCheck" getValueType="getValueByProperty" collection="${page.result}" page="${page}">
					        <table width="100%" border="0" cellpadding="0" cellspacing="0" class="table1_search">
							     <tr>
							       <td>
		       							<div style="float: left;width: 220px;">
							       		&nbsp;&nbsp;标题：&nbsp;<input name="searchTitle" id="searchTitle" style="width: 140px;"  type="text" class="search" title="请您输入标题" value="${model.afficheTitle }">
							       		</div>
		       							<div style="float: left;">
							       		&nbsp;&nbsp;发布部门：&nbsp;<input name="SearchAfficheGov"  style="width: 130px;" id="SearchAfficheGov" type="text" class="search" title="请您输入发布部门" value="${model.afficheGov }">
							       		</div>
		       							<div style="float: left;width: 200px;">
							       		&nbsp;&nbsp;生效日期：&nbsp;<strong:newdate name="model.afficheTime" id="afficheTime" skin="whyGreen" isicon="true"  classtyle="search" title="请输入有效日期" dateform="yyyy-MM-dd" dateobj="${model.afficheTime}"/>
							       		</div>
		       							<div style="float: left;width: 265px;padding-top: 2px">
							       		&nbsp;&nbsp;发布状态：&nbsp;<s:select name="model.afficheState" list="#{'':'全部','0':'未发布','1':'已发布','2':'已过期'}" listKey="key" listValue="value" onchange='$("#img_sousuo").click();'/>
							       		&nbsp;&nbsp;&nbsp;&nbsp;<input id="img_sousuo" type="button" />
							       		</div>
							       	</td>
							     </tr>
							</table> 
							<webflex:flexCheckBoxCol caption="选择" property="afficheId" 
								showValue="afficheTitle" width="4%" isCheckAll="true" isCanDrag="false"
								isCanSort="false"></webflex:flexCheckBoxCol>
							<webflex:flexTextCol caption="标题" property="afficheId" 
								showValue="javascript:showTitle(afficheTitle,afficheTitleColour,afficheTitleBold)" width="50%" isCanDrag="true" isCanSort="true" onclick="toViewAffiche(this.value)"></webflex:flexTextCol>
							<webflex:flexTextCol caption="发布部门" property="afficheGov" align="center" align="center"
								showValue="afficheGov" width="18%" isCanDrag="true" isCanSort="true"></webflex:flexTextCol>
							<webflex:flexDateCol caption="生效日期" property="afficheTime" dateFormat="yyyy-MM-dd" 
								showValue="afficheTime" width="18%" isCanDrag="true" isCanSort="true"></webflex:flexDateCol>
							<webflex:flexEnumCol caption="发布状态" mapobj="${typemap}" property="afficheState" align="center" align="center"
								showValue="afficheState" width="10%" isCanDrag="true" isCanSort="true"></webflex:flexEnumCol>
		
						</webflex:flexTable>
					</s:form>
				</tr>
			</table>
		</DIV>
		<script language="javascript">
			var sMenu = new Menu();
			function initMenuT(){
				sMenu.registerToDoc(sMenu);
				var item = null;
				item = new MenuItem("<%=root%>/images/operationbtn/add.png","新建","addNotify",3,"ChangeWidthTable","checkOneDis");
				sMenu.addItem(item);
				item = new MenuItem("<%=root%>/images/operationbtn/view.png","查看","viewNotify",3,"ChangeWidthTable","checkOneDis");
				sMenu.addItem(item);
				item = new MenuItem("<%=root%>/images/operationbtn/edit.png","编辑","editNotify",3,"ChangeWidthTable","checkOneDis");
				sMenu.addItem(item);
				item = new MenuItem("<%=root%>/images/operationbtn/public.png","发布","publicNotify",3,"ChangeWidthTable","checkOneDis");
				sMenu.addItem(item);
				item = new MenuItem("<%=root%>/images/operationbtn/del.png","删除","delNotify",3,"ChangeWidthTable","checkOneDis");
				sMenu.addItem(item);
				sMenu.addShowType("ChangeWidthTable");
			    registerMenu(sMenu);
			}
		</script>	
	</BODY>
</HTML>
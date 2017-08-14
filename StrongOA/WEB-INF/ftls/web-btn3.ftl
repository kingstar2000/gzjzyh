<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
	<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
	<%@taglib prefix="s" uri="/struts-tags"%>
	<jsp:directive.page import="com.strongit.oa.bo.ToaSysmanageBase" />
	<%@taglib prefix="web-menu" uri="/tags/web-menu"%>
	<%@ taglib uri="/tags/security" prefix="security"%>
	<%@include file="/common/include/rootPath.jsp"%>
		<title>导航区域</title>
		<SCRIPT language="javascript" src="<%=jsroot%>/menu/personMenu.js"></SCRIPT>
		<script src="<%=path%>/common/js/jquery/jquery-1.2.6.js" type="text/javascript" language="javascript"></script>
		<script type="text/javascript" src="<%=root %>/common/js/common/common.js"></script>
		<link type="text/css" rel="stylesheet" href="<%=root %>/frame/theme-web/webFtabforRB/css/dhmain.css" />
		<script language="javascript" src="<%=root %>/frame/theme-web/webFtabforRB/jquery.js"></script>

		<%
			String orgName = (String) request.getSession().getAttribute( "orgName");
	
			String uName = (String) request.getSession().getAttribute(
			"userName");

			ToaSysmanageBase sysTheme = request.getSession().getAttribute( "sysTheme") == null ? null : (ToaSysmanageBase) request
					.getSession().getAttribute("sysTheme");
			int speed = 0;
			String value = "";
			if (sysTheme != null) {
				speed = sysTheme.getBaseStatusbarTime() == null ? 0 : sysTheme
				.getBaseStatusbarTime();
				value = sysTheme.getBaseStatusbar();
			}
			
			 String bangongluntan = (String)request.getAttribute("bangongluntan");
			 String gerenyouxiang = (String)request.getAttribute("gerenyouxiang");
			
			 String userName=(String)request.getAttribute("userName");
			 String password=(String)request.getAttribute("password");
			 
			 
			 String bangongluntanURL = "";
			 if(bangongluntan.equals("")){//办公论坛地址未配置
				 bangongluntanURL = "bangongluntanNOSet";
			 }else{
				 bangongluntanURL = bangongluntan;
			 }
			 
			 String gerenyouxiangURL = "";
			 if(gerenyouxiang.equals("")){//个人邮箱地址未配置
				 gerenyouxiangURL = "gerenyouxiangNOSet";
			 }else{
				 gerenyouxiangURL= gerenyouxiang;
			 }
			
		%>
		
		<script type="text/javascript">
		
		
		$(document).ready(function() {
			var width = screen.availWidth;
			//alert(width);
			if(width > 1024){
				$("#toolbar").css("width","1252px");
				$("#zph").attr("id","kph"); $("#zpc").attr("id","kpc");
			}else{
			    $("#toolbar").css("width","984px");
				$("#kph").attr("id","zph"); $("#kpc").attr("id","zpc"); 
			}

		});
		
		//切换宽窄屏
		$(function(){
		  $(".navrsp01 a").click(function(){
		    var nrspa = $(this).text();
			if( nrspa == "切换到宽屏" ){ 
				$(this).text("切换到窄屏"); 
				$("#zph").attr("id","kph"); $("#zpc").attr("id","kpc");
				//工作区切换宽窄屏
				top.bottomFrame.frames(0).changeWeb(1);
				
			}
			if( nrspa == "切换到窄屏" ){
			 	$(this).text("切换到宽屏"); 
			 	$("#kph").attr("id","zph"); $("#kpc").attr("id","zpc"); 
			 	//工作区切换宽窄屏
			 	top.bottomFrame.frames(0).changeWeb(2);
		 
			 }
		  });		   
		});
		
		//显示隐藏TOP区
		$(function(){
		  $(".top").hover(function(){		  		
		      $(".tplsqh").show();
			},function(){
	
				$(".tplsqh").hide();
				});
		  $(".tplsqh span").click(function(){
		  	hidemenu();
			$(".banner").toggle();
			$(".tplsqh").toggleClass("topqhyc");
			$(".top").toggleClass("tophov");
		  });
		})
		
		$(function(){
		$(".navlinks div").eq(0).show().siblings("div").hide();
		$(".nav li").eq(0).addClass("navlihov").siblings("li").removeClass("navlihov");
		  $(".nav li").mouseover(function(){
			  var i = $(".nav li").index(this);
			  $(this).addClass("navlihov").siblings("li").removeClass("navlihov");
			  $(".navlinks div").eq(i).show().siblings("div").hide();
			});	   
		});
		
		$(function(){
			var Mdate = new Date();
		    var Mnow = "";
		    Mnow = Mdate.getFullYear()+"年"; 
		    Mnow = Mnow + (Mdate.getMonth()+1)+"月"; 
		    Mnow = Mnow + Mdate.getDate()+"日";
		    var Week = ['日','一','二','三','四','五','六'];
		    Mnow = Mnow + " 星期" + Week[Mdate.getDay()];
		    $("#weltime").text(Mnow); 
		});
		
		function changePassword(){
			var rValue= showModalDialog("<%=basePath%>/fileNameRedirectAction.action?toPage=myinfo/myInfo-password.jsp", 
										window,"dialogWidth:350pt;dialogHeight:150pt;status:no;help:no;scroll:no;");	
		}
		function gotoExit(){
			top.location="<%=path%>/j_spring_security_logout";
		}
		
		function alertHelpPage(){
			var sindex = getSysConsole().getSelectedIndex();
			var tabID = getSysConsole().getTabParam("ID",sindex);
			var url = getSysConsole().getTabObj(tabID,sindex);
			url=""+url;
			//alert("url:"+url);
			var arr = url.split("privilSyscode=");
			ihelpTreeId = arr[1];
			//alert("ihelpTreeId:"+ihelpTreeId);
			ihelpTreeId=""+ihelpTreeId;
			if(ihelpTreeId!="undefined"){
				var rValue= showModalDialog("<%=basePath%>/helpedit/helpedit!gethelpTreeId.action?ihelpTreeId="+ihelpTreeId, 
										   window,"dialogWidth:750pt;dialogHeight:450pt;status:no;help:no;scroll:no;");
			}else{
				var rValue= showModalDialog("<%=basePath%>/helpedit/helpedit!gethelpTreeId.action?url="+url, 
						window,"dialogWidth:750pt;dialogHeight:450pt;status:no;help:no;scroll:no;");
			}
		}
		function refreshWorkByTitle(url,title){
			top.bottomFrame.refreshWorkByTitle(url,title)
		}
		//新建流程
		function creatProcess(workflowName,formId,workflowType){
			var width=screen.availWidth-10;
	   		var height=screen.availHeight-30;
	   		var title = encodeURI(encodeURI(workflowName));
	   		//alert(title);
	   		WindowOpen("<%=root%>/senddoc/sendDoc!input.action?workflowName="+title+"&formId="+formId+"&workflowType="+workflowType,"",width, height, "");			
		}
		
		function portal(portalId,title){	
			top.bottomFrame.navigate("<%=basePath%>/desktop/desktopWhole.action?defaultType=2&operate=view&portalId="+portalId,title);
		}
		
		function mydesk(){	
			top.bottomFrame.navigate("<%=basePath%>/desktop/desktopWhole.action","个人桌面");
		}
				
		function showStatus(){	//状态栏
			var value="<%=value%>";
			var yourwords;
			if(value==null||value=="")
				 yourwords ="oa办公系统";
			else 
				yourwords=value;
			window.status=yourwords;
			var speed = 1000;
			var control = 1;
			function flash(){
				if (control == 1){
					window.status=yourwords;
					control=0;
				} else{
					window.status=" ";
					control=1;
				}
				setTimeout("flash();",speed);
			}
			flash();
			return true;
		}
		
		//去掉左边空格
		function ltrim(s){ 
		    return s.replace( /^\s*/,""); 
		} 
		function navigates(url,title) {
			top.bottomFrame.navigate("<%=basePath%>"+url,title);
		}
		
		function gotonavigates(code,title) {
			top.bottomFrame.navigate("<%=basePath%>/fileNameRedirectAction.action?toPage=theme/theme-webMenupage.jsp?privCode="+code,title);
		}
		
		function gotoUrl(url){
			document.getElementById(url).submit();
		}
		
		function gotomail(){
			top.bottomFrame.navigate('<%=gerenyouxiangURL%>?username='+$("#mailUserName").val()+'&password='+$("#mailUserPassword").val(),"个人邮箱");
		}
		//弹出“自办文流程表单”    BY：刘皙
		function gotozbw(){
			var rValue= window.open("<%=basePath%>/senddoc/sendDoc!input.action?workflowName=%25E8%2587%25AA%25E5%258A%259E%25E6%2596%2587%25E5%258A%259E%25E7%2590%2586\&formId=9050\&workflowType=3");
		}
		//弹出厅领导的“文件监控与统计”页面    BY：刘皙
		function gotoOrgwjcx(){
			top.bottomFrame.navigate("<%=basePath%>/fileNameRedirectAction.action?toPage=theme/theme-wenJianChaXun.jsp?mytype=org","文件监控与统计");
		}
		//弹出处长“文件监控与统计”页面    BY：刘皙
		function gotoDeptwjcx(){
			top.bottomFrame.navigate("<%=basePath%>/fileNameRedirectAction.action?toPage=theme/theme-wenJianChaXun.jsp?mytype=dept","文件监控与统计");
		}
		//弹出处长“文件监控与统计”页面    BY：刘皙
		function gotoUserwjcx(){
			top.bottomFrame.navigate("<%=basePath%>/fileNameRedirectAction.action?toPage=theme/theme-wenJianChaXun.jsp?mytype=user","文件查询");
		}
		
	  	var state = 0 ;
		function hidemenu(){
		  if(state == 0){
		  	parent.title.rows='66,*';
			state = 1;
		  }else if(state == 1){
			parent.title.rows='167,*';
			state = 0;
		  }
		}
	</script>
	
	</head>
	
	<body>
		<div id="hd">
		  <div id="hdtopbg">
		    <div id="zph">
		      <div class="top">
		        <div class="tplsqh" style="display:none"><span></span></div>
		        <div class="banner">
		          <div class="welmenu fri">
		            <div class="welmt">
		              <p>欢迎您：<%=uName %></p>
		              <input class="welmtc" type="button" onclick="gotoExit();"/>
		            </div>
		            <div class="welmb">
		              <span class="welmbsp01"><a title="在线帮助" href="#" onclick="alertHelpPage()">在线帮助</a></span>
		              <span class="welmbsp02"><a title="修改密码" href="#" onclick="changePassword()">修改密码</a></span>            </div>
		          </div>
		        </div>
		        <div class="nav">
		          <div class="navga">
		            <ul>	             
					  	<li><a href="#" onclick="refreshWorkByTitle('<%=path%>/desktop/desktopWhole!gotoWebDesktop.action?webType=webFtabforRB','办公门户')">首页</a></li>
					<!--  
					  <security:authorize ifAllGranted="001-00020001">	             
					  	<li>发文处理</li>
					  </security:authorize>
					  <security:authorize ifAllGranted="001-00020002">	 
					  	<li>收文处理</li>
					  </security:authorize>
					  <security:authorize ifAllGranted="001-00010001">	 
		              	<li>我的流程</li>
		              </security:authorize>
		              <security:authorize ifAllGranted="001-00010002">	 
		              	<li>日程管理</li>
		              </security:authorize>
		              <security:authorize ifAllGranted="001-00010003">	
		              	<li><a href="#" onclick="top.bottomFrame.navigate('<%=path%>/fileNameRedirectAction.action?toPage=message/message.jsp','办公门户')">内部邮件</a></li>
		              </security:authorize>
		              <security:authorize ifAllGranted="001-00040002">	 
		             	<li>信息发布</li>
		              </security:authorize>
		              <security:authorize ifAllGranted="001-00010007">	 
		              	<li>文件柜</li>
		              </security:authorize>
		              <security:authorize ifAllGranted="001-00010010">	 
		              	<li>工作日志</li>
		              </security:authorize>
		              <security:authorize ifAllGranted="001-00020008">	 
		              	<li>会议管理</li>
		              </security:authorize>			              
		              <security:authorize ifAllGranted="001-00010001">	 
		              	<li>新建流程</li>
		              </security:authorize>
		             --> 
		             	<li>新建流程</li>
		             	<li>我的工作</li>
		             	<li>个人事务</li>
		             	<li>资料中心</li>
		             	<li>论坛交流</li>
		             								
		            </ul>
		          </div> 
		          <div class="navlinks" id="toolbarcontent">
		          	<!-- 
					 <script type="text/javascript">
						var toolbarcontent = document.getElementById("toolbarcontent");
						function ref_toolbar(){
							$.ajax({ type:"post",
									url:'<%=path%>/theme/theme!showToolBarforSP.action?'+new Date(),
									data:{},
									success:function(response){
										if(response==""){
										}else{
											$("#toolbarcontent").html(response);
	
										}
									},
									error:function(data){
										//alert("对不起，操作异常"+data);
									}
							   });
						}
										
					</script> 
					 -->
					 <!-- 首页 -->
					 <div>欢迎来到江西省人保厅办公系统！今天是<span id="weltime"></span></div>
					 <!-- 新建流程 -->
					 <div>
					 	<a href="#" onclick="creatProcess('发文流程','82','2')">&nbsp发文流程&nbsp</a>|
					 	<a href="#" onclick="creatProcess('收文流程','83','3')">&nbsp收文流程&nbsp</a>|
					 	<a href="#" onclick="creatProcess('意见征询','61','16318')">&nbsp意见征询&nbsp</a>|
					 	<a href="#" onclick="creatProcess('请示与报告流程','107','273952')">&nbsp请示报告&nbsp</a>|
					 	<a href="#" onclick="creatProcess('门户网站信息发布流程','121','10531')">&nbsp信息报送&nbsp</a>|
					 
					 </div>
					 <!-- 我的工作 -->
					 <div>
					 	<security:authorize ifAllGranted="001-000100010013">	 
					 		<a href="#" onclick="refreshWorkByTitle('<%=path%>/senddoc/sendDoc!todoWorkflow.action','办公门户')">&nbsp待办工作&nbsp</a>|
					 	</security:authorize> 	
					 	<security:authorize ifAllGranted="001-000100010012">
							<a href="#" onclick="refreshWorkByTitle('<%=path%>/senddoc/sendDoc!processedWorkflow.action?state=2','办公门户')">&nbsp已办工作&nbsp</a>|
						</security:authorize> 
						<security:authorize ifAllGranted="001-000100010014">	
							<a href="#" onclick="refreshWorkByTitle('<%=path%>/senddoc/sendDoc!processedWorkflow.action?state=1','办公门户')">&nbsp办结工作&nbsp</a>|
						</security:authorize> 
						<security:authorize ifAllGranted="001-000100010010">	
							<a href="#" onclick="refreshWorkByTitle('<%=path%>/senddoc/sendDoc!workflowDraft.action','办公门户')">&nbsp流程草稿&nbsp</a>|
						</security:authorize>
						<security:authorize ifAllGranted="001-000100010016">
							<a href="#" onclick="refreshWorkByTitle('<%=path%>/workflowDesign/action/processMonitor!mainFrameOrg.action?model=person','办公门户')">&nbsp查询跟踪&nbsp</a>|
						</security:authorize>
						<security:authorize ifAllGranted="001-000100010018">
							<a href="#" onclick="refreshWorkByTitle('<%=path%>/traceDoc/traceDoc.action','办公门户')">&nbsp文件跟踪&nbsp</a>|
						</security:authorize>
						<security:authorize ifAllGranted="001-000100010007">
							<a href="#" onclick="refreshWorkByTitle('<%=path%>/senddoc/sendDoc!entrustWorkflow.action?assignType=0','办公门户')">&nbsp已委派流程&nbsp</a>|
					 	</security:authorize>
					 </div>
					 <!-- 个人事务 -->
					 <div>
					 	<security:authorize ifAllGranted="001-000100060001">
					 		<a href="#" onclick="refreshWorkByTitle('<%=path%>/sms/sms.action','办公门户')">&nbsp手机短信&nbsp</a>|
					 	</security:authorize>
					 	<security:authorize ifAllGranted="001-000100050006">
					 		<a href="#" onclick="refreshWorkByTitle('<%=path%>/suggestion/approvalSuggestion.action','办公门户')">&nbsp常用意见&nbsp</a>|
					 	</security:authorize>
					 	<security:authorize ifAllGranted="001-000100040002">
					 		<a href="#" onclick="refreshWorkByTitle('<%=path%>/fileNameRedirectAction.action?toPage=address/addressOrg.jsp','办公门户')">&nbsp通讯录&nbsp</a>|
					 	</security:authorize>
					 	<security:authorize ifAllGranted="001-000400020005">
					 		<a href="#" onclick="refreshWorkByTitle('<%=path%>/fileNameRedirectAction.action?toPage=infopub/articles/columnArticles-content.jsp','办公门户')">&nbsp信息发布&nbsp</a>|
					 	</security:authorize>
					 	<security:authorize ifAllGranted="001-000200050002">
					 		<a href="#" onclick="refreshWorkByTitle('<%=path%>/notify/notify!mylist.action','办公门户')">&nbsp公告发布&nbsp</a>|
					 	</security:authorize>
					 	<security:authorize ifAllGranted="001-000100050001">
					 		<a href="#" onclick="refreshWorkByTitle('<%=path%>/myinfo/myInfo!input.action','办公门户')">&nbsp个人设置&nbsp</a>|
					 	</security:authorize>
					 	<security:authorize ifAllGranted="001-000100020001">
					 		<a href="#" onclick="refreshWorkByTitle('<%=path%>/calendar/calendar.action','办公门户')">&nbsp个人日程&nbsp</a>|
					 	</security:authorize>
					 	<security:authorize ifAllGranted="001-000100100001">
					 		<a href="#" onclick="refreshWorkByTitle('<%=path%>/worklog/workLog.action','办公门户')">&nbsp工作日志&nbsp</a>|
					 	</security:authorize>
					 	<security:authorize ifAllGranted="001-000100050008">
					 		<a href="#" onclick="refreshWorkByTitle('<%=path%>/workflowDelegation/action/processDelegation.action','办公门户')">&nbsp工作委派&nbsp</a>|
					 	</security:authorize>
					 </div>
					 <!-- 资料中心 -->
					 <div>
					 	<security:authorize ifAllGranted="001-000200050001">
							<a href="#" onclick="refreshWorkByTitle('<%=path%>/notify/notify.action','办公门户')">&nbsp通知公告&nbsp</a>|
						</security:authorize>
						<a href="#" onclick="refreshWorkByTitle('<%=path%>/fileNameRedirectAction.action?toPage=infopub/articles/articles-showcolumncontent.jsp?columnId=ff8080813002b86d0130032b82fd0405','领导讲话')" >&nbsp领导讲话&nbsp</a>|
						<a href="#" onclick="refreshWorkByTitle('<%=path%>/fileNameRedirectAction.action?toPage=infopub/articles/articles-showcolumncontent.jsp?columnId=4428e48a34c20f88013575ec3a136d0f','工作简报')" >&nbsp工作简报&nbsp</a>|
						
						<!-- <a href="#" onclick="" >&nbsp厅发公文&nbsp</a>| -->
						<a href="#" onclick="refreshWorkByTitle('<%=path%>/fileNameRedirectAction.action?toPage=infopub/articles/articles-showcolumncontent.jsp?columnId=ff8080813002b86d0130030a7636023e','每周动态')" >&nbsp每周动态&nbsp</a>|
						<a href="http://www.bookan.com.cn/jxlib/index.aspx" target="_blank">&nbsp电子期刊&nbsp</a>|
						<a href="http://pds.sslibrary.com/library.jsp?username=ssgpjxtsg" target="_blank">&nbsp电子图书&nbsp</a>|
					 </div>
					 <!-- 论坛交流 -->
					 <div>
					 
					 </div> 
		          </div>  
		        </div>
		      </div>
		    </div>
		  </div>
		</div>
					
		<SCRIPT type="text/javascript">
		function showCompanyDetail(){
			window.showModalDialog("<%=path%>/about.jsp",window,'help:no;status:no;scroll:no;dialogWidth:420px; dialogHeight:350px');
		}

		function jumpMenu(url){
		  var xx="<%=path%>/theme/theme!jump.action?url="+url;
		  window.parent.location=xx;
		}
			
			
		//状态栏显示
		var control = 1;
		var speed="<%=speed%>"; //状态栏切换时间
		var value="<%=value%>"; //状态栏字体
		var yourwords;
		if(value==null||value==""||value=="0"||value=="null")
				yourwords ="oa办公系统";
			else 
				yourwords=value;
		if(!isNaN(speed)){
			setInterval("flashContent()",speed*1000);
		}else{
			window.status=yourwords+"        机构:<%=orgName%>";
		}
		
		function flashContent(){
			if (control == 1){
				window.status=yourwords+"        机构:<%=orgName%>";
				control=0;
			}else{
				window.status=" "+"        机构:<%=orgName%>";
				control=1;
			}
		}
		
		function reLoadDate() {	
			//刷新导航栏二级菜单
			//ref_toolbar();	
		}
		reLoadDate();
		setInterval("reLoadDate()", 3600 * 1000);
		
	</SCRIPT>
	</body>
</html>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="/struts-tags" prefix="s"%>
<%@include file="/common/include/rootPath.jsp"%>
<%@ taglib uri="/tags/web-newdate" prefix="strong"%>
<%@include file="/common/eformOCX/version.jsp"%>
<html>
	<head>
		<title>公文文件查看</title>
		<%@include file="/common/include/meta.jsp"%>
		<LINK href="<%=frameroot%>/css/properties_windows.css" type=text/css rel=stylesheet>
		<link type="text/css" rel="stylesheet" href="<%=path%>/common/js/tabpane/css/luna/tab.css" />
		<script type="text/javascript" src="<%=path%>/common/js/tabpane/js/tabpane.js"></script>
		<script src="<%=path%>/common/js/jquery/jquery-1.2.6.js" type="text/javascript"></script>
		<script src="<%=path%>/common/js/upload/jquery.blockUI.js" language="javascript"></script>
		<script src="<%=path%>/common/js/common/common.js" type="text/javascript"></script>
		<script type="text/javascript">
		function windowClose(){
			//var data=$("#docTitle").val();
			//top.perspective_content.actions_container.personal_properties_toolbar.closeWorkByNames(data);
			window.close(); 
		}
		//接收\拒收
		function recvD(dType){ 
			var id = $("#senddocId").val();
			var show=$("#showClose").val();
			if("ture"==dType){
				url = "<%=path%>/fileNameRedirectAction.action?toPage=receives/recvDoc-remark.jsp?senddocId="+id+"&showClose="+show;
			}else{
				url = "<%=path%>/fileNameRedirectAction.action?toPage=receives/recvDoc-rejectRmk.jsp?senddocId="+ id+"&showClose="+show;
			}
			//var a = window.showModalDialogOpenWindow(url,window,'help:no;status:no;scroll:auto;dialogWidth:450px; dialogHeight:350px');
			var a = OpenWindow(url,window,'help:no;status:no;scroll:auto;dialogWidth:450px; dialogHeight:295px');
			//alert(a);
			if("reload"==a){					
				window.parent.dialogArguments.submitForm();
				window.close();
				}else if("unreload"==a){
					window.close();
				}
				else if(undefined!=a){
				if(a.indexOf("reload")==0){					
					window.parent.dialogArguments.submitForm();
					window.close();
				}
			}			
				
		} 
	function TANGER_OCX_PrintDoc(booValue)
     　　{ 
<%--     		打印总数--%>
     		var docHavePrintSum;	
<%--     		需要打印数		--%>
     		var needprint;
<%--     			已打印数--%>
     		var docHavePrintNum;
     		
     		var ret=0;
     		var archiveId=$("#senddocId").val();
     		
   			var reValue = OpenWindow("<%=root%>/receives/archive/archiveDoc!gotoPrintConfig2.action?archiveId="+archiveId,"300", "250", window);
       		
       		if(reValue == null || reValue == undefined){
       			return ;
       		}
       		
       		if(reValue=="false"){
       			return;
       		}else{
				var para=reValue.split(",");
				docHavePrintSum=para[0];
				needprint=para[1];
				docHavePrintNum=para[2];
       		}
       		
       		var TANGER_OCX_OBJ =window.frames[0].document.getElementById("TANGER_OCX_OBJ");		//  window.frames(0).document.getElementById("TANGER_OCX_OBJ");
       		if(TANGER_OCX_OBJ == ""){
				document.frames(0).openDoc(); 
			}
		    TANGER_OCX_OBJ.FilePrint=true;
	       		if((parseInt(needprint)+parseInt(docHavePrintNum))<=parseInt(docHavePrintSum)){
	       			var sucprint="0";
	       			for(i=0;i<parseInt(needprint);i++){
		       			try{      				
					      	TANGER_OCX_OBJ.PrintOut(false);  					      
					      	sucprint=i+1;
					      		
		       			}catch(e){
		       				alert("您在打印第"+(i+1)+"份时出现异常！");
		       				break;
		       			}
	       			}
			       $.ajax({
				       type:"post",
				       url:"<%=root%>/receives/archive/archiveDoc!changePrintedNum2.action",
				       data:{
							archiveId:archiveId,
							docHavePrintNum:(parseInt(docHavePrintNum)+parseInt(sucprint))
				       },
				       success:function(info){
				       		if(info=="true"){
							    /*if(confirm("是否提交下一处理人？")){
							      submitNext();
							    }*/
				       		}else{
				       			alert("对不起出现错误");
				       		}
				       }
			      });
	       		}else{
	       			alert("允许打印总份数为"+docHavePrintSum+",已打印份数为"+docHavePrintNum+",您已经不能打印"+needprint+"份了");
	       			return;
	       		}
       		
       		TANGER_OCX_OBJ.FilePrint=false;
     		
     		//document.frames(0).printit(booValue);
     　　} 
	</script>
	</head>
	<base target="_self"/>
	<body class=contentbodymargin oncontextmenu="return false;" scroll="no">
	<script language="javascript" type="text/javascript" src="<%=path%>/common/js/newdate/WdatePicker.js"></script>
			<form id="form" action="<%=root %>/sends/transDoc!save.action" method="post">
				<input type="hidden" id="senddocId" name="senddocId" value="<%=request.getParameter("senddocId")%>">
				<input type="hidden" id="docId" name="docId" value="<%=request.getParameter("docId")%>">
				<input type="hidden" id="showType" name="showType" value="<%=request.getParameter("showType")%>">
				<input type="hidden" id="showClose" name="showClose" value="<%=request.getParameter("showClose")%>">
				<table width="100%" height="2%" border="0" cellspacing="0" cellpadding="00">
					<tr>
						<td height="20"
							style="FILTER:progid:DXImageTransform.Microsoft.Gradient(gradientType=0,startColorStr=#ededed,endColorStr=#ffffff);">
							<table width="100%" border="0" cellspacing="0" cellpadding="00">
								<tr>
									<td width="5%" align="center">
										<img src="<%=frameroot%>/images/ico.gif" width="9" height="9">
									</td>
									<td width="10%">
										<script type="text/javascript">
											 var id = document.getElementById("showType").value;
											 if(id=="todo"){
											 	document.write("签收公文");
											 }else{
											 	document.write("查看公文");
											 }										 
										</script>
									</td>
									<td>
										<table border="0" align="right" cellpadding="00"
											cellspacing="0">
											<tr>										
											<s:if test="showType=='todo'">
												<td width="50">
													<a class="Operation" href="javascript:recvD('ture');">
														<img src="<%=frameroot%>/images/read.gif" width="15"
															height="16" class="img_s">签收</a>
												</td>
												<td width="5"></td>
												<td width="50">
													<a class="Operation" href="javascript:recvD('flase');">
														<img src="<%=frameroot%>/images/quxiao.gif" width="15"
															height="16" class="img_s">拒收</a>
												</td>
											</s:if>
											<s:if test="showType=='view'">
												<td width="86">
													<a class="Operation" href="javascript:TANGER_OCX_PrintDoc(true);">
														<img src="<%=frameroot%>/images/read.gif" width="15"
															height="16" class="img_s">打印公文</a>
												</td>
											</s:if>
											<td width="5"></td>

											<td width="50">
												<a class="Operation" href="javascript:windowClose();"> <img
														src="<%=frameroot%>/images/close.gif" width="15"
														height="15" class="img_s">关闭</a>
											</td>
											<td width="5">
												&nbsp;
											</td>
										</tr>
										</table>
									</td>
								</tr>
							</table>
						</td>
					</tr>
				</table>
				<table width="100%" height="93%">
					<tr>
						<td width="100%">
							<iframe id='view' name='view'  scrolling="no" align="top" width="100%" height="100%"  frameborder="1" 
							src="<%=path%>/receives/recvTDoc!input.action?archiveId=${docId}&forwardStr=${showType}&newDate="+newDate()"">
							</iframe>
						</td>
					</tr>
					<iframe id="annexFrame" style="display:none"></iframe>
				</table>
			</form>
	</body>
</html>

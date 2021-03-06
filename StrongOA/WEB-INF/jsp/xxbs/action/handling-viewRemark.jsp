<%@ page contentType="text/html; charset=utf-8"%>
<%@include file="/common/include/rootPath_cb.jsp"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<%@ taglib prefix="web" uri="/tags-web/component"%>
<html>
	<head>
		<title>批示报送信息</title>

		<%@include file="/common/include/meta.jsp"%>
		<link rel="stylesheet" type="text/css" href="<%=themePath%>/css/global.css" />
		<link rel="stylesheet" type="text/css" href="<%=themePath%>/css/component.css" />
		<script type="text/javascript" src="<%=root%>/uums/js/md5.js"></script>
		<script type="text/javascript" src="<%=scriptPath%>/global1.js"></script>
		<script type="text/javascript" src="<%=scriptPath%>/common.js"></script>
		<script type="text/javascript" src="<%=scriptPath%>/Message_${locale}.js"></script>
		<script type="text/javascript" src="<%=scriptPath%>/component-min.js"></script>
		<style type="text/css">
			html { -webkit-box-sizing:border-box; -moz-box-sizing:border-box; box-sizing:border-box; padding:40px 0px 40px 0px; overflow:hidden;}
			html,body { height:100%;}
		</style>
	</head>
	<base target="_self" />
	<body>
		<script type="text/javascript" src="<%=scriptPath%>/wait.js"></script>

		<div class="windows_title">
			批示信息
		</div>
		<div class="information_out" id="information_out">
			<s:form id="myform" action="/xxbs/action/handling!saveRemark.action?toId=%{toId}" theme="simple">
			<table class="information_list" cellspacing="0" cellpadding="0">
				<tr>
					<td class="labelTd">
						<font color="#FF0000"></font> 信息标题：
					</td>
					<td class="contentTd">${model.pubTitle}</td>
				</tr>
				<s:if test="%{model.TInfoBaseIssue.issIsPublish==\"1\"}">
				<tr>
					<td class="labelTd">
						<font color="#FF0000"></font> 是否批示：
					</td>
					<td class="contentTd">
						<s:radio name="pubIsInstruction" id="pubIsInstruction" list="#{\"1\":'是',\"0\":'否'}" value="%{model.pubIsInstruction}"/>
					</td>
				</tr>
				<!-- <tr class="pishi">
					<td class="labelTd">
						<font color="#FF0000"></font> 批示评分：
					</td>
					<td class="contentTd">
						<input class="information_out_input" type="text" digits="批示评分"
						id="pubRemarkScore" name="pubRemarkScore" value="${model.pubRemarkScore}"/>					
					</td>
				</tr> -->
				<tr class="pishi">
					<td class="labelTd">
						<font color="#FF0000"></font> 批示人：
					</td>
					<td class="contentTd">
						<input class="information_out_input" type="text"
						id="pubInstructor" name="pubInstructor" value="${model.pubInstructor}"/>					
					</td>
				</tr>
				<tr class="pishi">
					<td class="labelTd" valign="top">
						<font color="#FF0000"></font> 批示内容：
					</td>
					<td class="contentTd">
						<textarea class="information_out_input_words"
							id="pubInstructionContent" name="pubInstructionContent">${model.pubInstructionContent}</textarea>		
					</td>
				</tr>
				</s:if>
				<s:else>
				<tr>
					<td class="labelTd" valign="top">
						
					</td>
					<td class="contentTd">未成刊的文章不能批示。
					</td>
				</tr>
				</s:else>
			</table>
			</s:form>
		</div>
		<div class="information_list_choose_pagedown">
			<s:if test="%{model.pubUseStatus==\"1\"}">
			<input type="button" class="information_list_choose_button9"
				value="保存" name="save" id="save" />
			</s:if>
			<input type="button" class="information_list_choose_button9"
				value="关闭" name="cancel" id="cancel" />
		</div>
		<div id="mask"></div>
		<web:validator errorDisplayContainer="information_out"
			errorElement="div" submitTip="true" name="validator" formId="myform"></web:validator>
	</body>
</html>
<script type="text/javascript" src="<%=scriptPath%>/stopwait.js"></script>
<script type="text/javascript">

$(function(){

	//表单提交操作
	$("#save").click(function(){
		var pubInstructor = $("#pubInstructor").val();
		if(pubInstructor.length>50){
			alert("批示人过长！");
			return false;
		}
		var pubInstructionContent = $("#pubInstructionContent").val();
		if(pubInstructionContent.length>500){
			alert("批示内容过长！");
			return false;
		}
		if(validator.form()){
			$("#myform").submit();
		}
	});
	
	$("#cancel").click(function(){
		window.close();
	});
	
	//表单验证
	//$("#myform").validate({
	//	container:$(document.body)
	//});
	
	var isInstruction = function(){
		var ps = $(".pishi");
		var val = $("input[name='pubIsInstruction']:checked").val();
		if(val == "0"){
			ps.hide();
		}
		else if(val == "1"){
			ps.show();
		}
	};
	$("input[name='pubIsInstruction']").bind("click", isInstruction);
	$(window).bind("load", isInstruction);

	
});

</script>

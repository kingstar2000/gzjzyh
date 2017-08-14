<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="/tags/web-newdate" prefix="strong"%>
<%@include file="/common/include/rootPath.jsp"%>
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<title>添加会议室</title>
		<script type="text/javascript"
			src="<%=path%>/common/js/newdate/WdatePicker.js"></script>
		<script language='javascript'
			src='<%=path%>/common/js/jquery/jquery-1.2.6.js'></script>
		<script language='javascript'
			src='<%=path%>/common/js/upload/jquery.MultiFile.js'></script>
		<script language='javascript'
			src='<%=path%>/common/js/upload/jquery.blockUI.js'></script>
		<LINK href="<%=frameroot%>/css/properties_windows.css" type=text/css
			rel=stylesheet>
		<base target="_self">
	</head>
	<body oncontextmenu="return false;">
		<DIV id=contentborder align=center>
			<table width="100%"
				style="FILTER:progid:DXImageTransform.Microsoft.Gradient(gradientType=0,startColorStr=#ededed,endColorStr=#ffffff);">
				<tr>
					<td width="5%" align="center">
						<img src="<%=frameroot%>/images/ico.gif" width="9" height="9">
					</td>
					<td width="20%">
						保存会议室
					</td>
					<td width="*">
						&nbsp;
					</td>
				</tr>
			</table>

			<table align="center" width="100%" border="0" cellpadding="0"
				cellspacing="1" class="table1">
				<tr>
					<td colspan="1" height="21" class="biao_bg1" align="right">
						<span class="wz">会议室名称：</span>
					</td>
					<td colspan="3" class="td1" align="left">
						<input id="meetingroom" name="meetingroom" type="text" size="30">
					</td>
				</tr>
				<tr>
					<td height="21" class="biao_bg1" align="right">
						<span class="wz">会议室状态：</span>
					</td>
					<td class="td1" align="left">
						<input id="status" name="status" type="text" size="30"
							readonly="readonly" value="空">
					</td>
					<td height="21" class="biao_bg1" align="right">
						<span class="wz">会议室类型：</span>
					</td>
					<td class="td1" align="left">
						<select id="type">
							<option value="0">
								礼堂
							</option>
							<option value="1">
								中型会议室
							</option>
							<option value="2">
								中型会议室
							</option>
							<option value="3">
								小型会议室
							</option>
						</select>
					</td>
				</tr>
				<tr>
					<td height="21" class="biao_bg1" align="right">
						<span class="wz">会议室说明：</span>
					</td>
					<td class="td1" colspan="3" align="left">
						<script type="text/javascript"
							src="<%=request.getContextPath()%>/common/js/fckeditor2/fckeditor.js"></script>
						<script type="text/javascript">
													 
													var oFCKeditor = new FCKeditor( 'content' );
													oFCKeditor.BasePath	= '<%=request.getContextPath()%>/common/js/fckeditor2/'
													oFCKeditor.ToolbarSet = "FutureDefaultSet" ;
													oFCKeditor.Width = '100%' ;
													oFCKeditor.align == 'center';
                                                    oFCKeditor.Height = '300' ;								
													oFCKeditor.Value	= '\n          \t\t' ;
													oFCKeditor.Create() ;
													 
                                                    </script>
					</td>
				</tr>
				<tr>
					<td class="td1" colspan="4" align="center">
						<input name="Submit" type="submit" class="input_bg" value="保 存">
						<input name="Submit2" type="submit" class="input_bg" value="关 闭"
							onclick="window.close();">
					</td>
				</tr>
			</table>
		</DIV>
	</body>
</html>
<%@page import="org.sky.sys.utils.EnumUtils"%>
<%@page import="org.sky.sys.utils.CommonUtils"%>
<%@page import="org.sky.sys.utils.DictUtils"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8"%>
<%@include file="/jsp/inc/include.jsp"%> 
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<security:csrfMetaTags/>
<script type="text/javascript" src='${basepath}jsp/ywbl/ajdj/ajxxmain.js'></script>
<script type="text/javascript">
var ajbh='<%=request.getParameter("ajbh") %>';
var djsj = '<%=CommonUtils.getCurrentDate() %>';
var bjfs = <%=DictUtils.getDictItem("BJFS") %>;
var bjlb = <%=DictUtils.getDictItem("BJLB") %>;
var bjlx = <%=DictUtils.getDictItem("BJLX") %>;
var bjxl = <%=DictUtils.getDictItem("BJXL") %>;
var lhlb = <%=DictUtils.getDictItem("LHLB") %>;
var ajzt = <%=EnumUtils.getEnums("AJDJ.STATE") %>;
var ajly = <%=DictUtils.getDictItem("AJLY") %>;
var xb = <%=DictUtils.getDictItem("XB") %>;
var djr  = '<%=BspUtils.getLoginUser().getCode() %>';
var djrName = '<%=BspUtils.getLoginUser().getName() %>';
var djdw = '<%=BspUtils.getLoginUser().getOrganCode() %>';
var djdwName = '<%=BspUtils.getLoginUser().getOrganName() %>';
var AJSHSTATE = <%=EnumUtils.getEnums("AJSH.STATE") %>;
var AJBLSTATE=<%=EnumUtils.getEnums("AJBL.STATE") %>;
var JASHSTATE = <%=EnumUtils.getEnums("JASH.STATE") %>;
var _callbacks = $.Callbacks();
$(function() {
	initDjxxMain();
});
</script> 
</head>
<body>
<div id='mainDetailTab'  class="easyui-tabs" data-options="fit:true">
<div title="案件登记信息" style="height:100%;" data-options="fit:true">
		<form id="detailtbstajdjxxform" class="easyui-form" method="post" 
			data-options="novalidate:true">
				<input type='hidden' name='id' id='id'/>
			<input type='hidden' name='djr' id='djr'/>
			<input type='hidden' name='djdw' id='djdw'/>
			<input type='hidden' name='dqdw' id='dqdw'/>
			<table style="width:100%">
				  <tr>
					<th><label>案件编号:</label></th>
					<td><input class="easyui-textbox" name="ajbh" id="ajbh" style='width:160px'
						data-options="required:true"></input></td>
					<th><label>报警时间:</label></th>
					<td><input class="easyui-datetimebox" name="bjsj" id="bjsj"
						data-options="required:true"></input></td>
				  </tr>
				  <tr>
					<th><label>报警方式:</label></th>
					<td><input class="easyui-combobox" name="bjfs"
						data-options="required:true,
								      valueField:'code',
								      textField:'name',
									  data:bjfs"></input></td>

					<th><label>报警类别:</label></th>
					<td><input class="easyui-combobox" name="bjlb"
						data-options="required:true,
									  valueField:'code',
								      textField:'name',
									  data:bjlb"></input></td>
				  </tr>
				  <tr>
					<th><label>报警类型:</label></th>
					<td><input class="easyui-combobox" name="bjlx"
						data-options="required:true,
									  valueField:'code',
								      textField:'name',
									  data:bjlx"></input></td>

					<th><label>报警细类:</label></th>
					<td><input class="easyui-combobox" name="bjxl"
						data-options="required:true,
									  valueField:'code',
								      textField:'name',
									  data:bjxl"></input></td>
				  </tr>
				  <tr>
					<th><label>来话类别:</label></th>
					<td><input class="easyui-combobox" name="lhlb"
						data-options="required:true,
									  valueField:'code',
								      textField:'name',
									  data:lhlb"></input></td>
				  </tr>
				  <tr>
				  	<th><label>报警人:</label></th>
					<td><input class="easyui-textbox" name="bjr"
						data-options="required:true"></input></td>
					<th><label>报警人性别:</label></th>
					<td><input class="easyui-combobox" name="bjrxb"
						data-options="required:true,
									  valueField:'code',
								      textField:'name',
									  data:xb"></input></td>
				  </tr>
				  <tr>
				  	<th><label>报警人证件号码:</label></th>
					<td><input class="easyui-textbox" name="bjrzjhm"
						data-options="required:true"></input></td>
					<th><label>报警人年龄:</label></th>
					<td><input class="easyui-textbox" name="bjrnl"
						data-options="required:true"></input></td>
				  </tr>
				  <tr>
					<th><label>报警人电话:</label></th>
					<td><input class="easyui-textbox" name="bjrdh"
						data-options="required:true"></input></td>
				  </tr>
				  <tr>
				  	<th><label>失踪人:</label></th>
					<td><input class="easyui-textbox" name="szr"
						data-options="required:true"></input></td>
					<th><label>失踪人性别:</label></th>
					<td><input class="easyui-combobox" name="szrxb"
						data-options="required:true,
									  valueField:'code',
								      textField:'name',
									  data:xb"></input></td>
				  </tr>
				  <tr>
				  	<th><label>失踪人证件号码:</label></th>
					<td><input class="easyui-textbox" name="szrzjhm"
						data-options="required:true"></input></td>
					<th><label>失踪人年龄:</label></th>
					<td><input class="easyui-textbox" name="szrnl"
						data-options="required:true"></input></td>
				  </tr>
				  <tr>
					<th><label>失踪人电话:</label></th>
					<td><input class="easyui-textbox" name="szrdh"
						data-options="required:true"></input></td>
				  </tr>
				  <tr>
					<th><label>事发地行政区划:</label></th>
					<td colspan='3'><input class="easyui-textbox" name="xzqhName"
						data-options="required:true"></input></td>
				  </tr>
				  <tr>
					<th><label>事发地址:</label></th>
					<td colspan='3'><input class="easyui-textbox" name="sfdz" style='width:500;height:50'
						data-options="required:true,multiline:true"></input></td>
				  </tr>
				  <tr>
					<th><label>事件详情:</label></th>
					<td colspan='3'><input class="easyui-textbox" name="sjxq" style='width:500;height:50'
						data-options="required:true,multiline:true"></input></td>
				  </tr>
				  <tr>
					<th><label>出警人:</label></th>
					<td><input class="easyui-textbox" name="cjr"
						data-options="required:true"></input></td>

					<th><label>到场时间:</label></th>
					<td><input class="easyui-datetimebox" name="dcsj"
						data-options="required:true"></input></td>
				  </tr>
				  <tr>
					<th><label>到场情况:</label></th>
					<td colspan='3'><input class="easyui-textbox" name="dcqk" style='width:500;height:50'
						data-options="required:true,multiline:true"></input></td>
				  </tr>
				  <tr>
					<th><label>反馈内容:</label></th>
					<td colspan='3'><input class="easyui-textbox" name="fknr" style='width:500;height:50'
						data-options="required:true,multiline:true"></input></td>
				  </tr>
				  <tr>
					<th><label>处理结果:</label></th>
					<td colspan='3'><input class="easyui-textbox" name="cljg" style='width:500;height:50'
						data-options="required:true,multiline:true"></input></td>
				 </tr>
				 <tr>
					<th><label>案件状态:</label></th>
					<td><input class="easyui-combobox" name="sjzt"
						data-options="required:true,
									  valueField:'code',
								      textField:'name',
									  data:ajzt"></input></td>
				  
					<th><label>警务区:</label></th>
					<td><input class="easyui-textbox" name="jwq"
						data-options="required:true"></input></td>
				 </tr>
				 <tr>
					<th><label>案发地址类别:</label></th>
					<td><input class="easyui-textbox" name="afdzlb"
						data-options="required:true"></input></td>
						
					<th><label>当前单位:</label></th>
					<td><input class="easyui-textbox" name="dqdwName" id="dqdwName"
						data-options="required:true"></input></td>
				  </tr>
				  <tr>
					<th><label>案件来源:</label></th>
					<td><input class="easyui-combobox" name="ajly"
						data-options="required:true,
									  valueField:'code',
									  textField:'name',
									  data:ajly"></input></td>

					<th><label>登记人:</label></th>
					<td><input class="easyui-textbox" name="djrName" id="djrName"
						data-options="required:true"></input></td>
				  </tr>
				  <tr>
					<th><label>登记单位:</label></th>
					<td><input class="easyui-textbox" name="djdwName" id="djdwName"
						data-options="required:true"></input></td>

					<th><label>登记时间:</label></th>
					<td><input class="easyui-datetimebox" name="djsj" id="djsj"
						data-options="required:true"></input></td>
				  </tr>
				  <tr>
					<th><label>线索编号:</label></th>
					<td><input class="easyui-textbox" name="xsbh"
						data-options="required:true"></input></td>

					<th><label>备注:</label></th>
					<td><input class="easyui-textbox" name="bz"
						data-options="required:true"></input></td>
				  </tr>
			</table>
		</form>
		<form  id="picForm" method="post" enctype="multipart/form-data">
		 	<table>
			 	<tr>
			 		<td style="width:33%">
				 		<div style="text-align: center;">
							<img id='picPreView1' style="width:150px;height:150px;" src="${basepath}skin/images/timg.jpg"/>
						</div>
					</td>
					<td  style="width:33%">
						<div style="text-align: center;">
							<img id='picPreView2' style="width:150px;height:150px;" src="${basepath}skin/images/timg.jpg"/>
						</div>
					</td>
					<td  style="width:33%">
						<div style="text-align: center;">
							<img id='picPreView3' style="width:150px;height:150px;" src="${basepath}skin/images/timg.jpg"/>
						</div>
					</td>
				</tr>
			</table>
		</form>
</div>
</div>
</body>
</html>
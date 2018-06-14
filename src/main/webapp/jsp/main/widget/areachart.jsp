<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="/jsp/inc/include.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<html>
<head>
<security:csrfMetaTags />
<style type="text/css">
</style>
<script type="text/javascript" src="${basepath}skin/plugins/echarts/echarts.min.js"></script>
<script type="text/javascript" src="${basepath}skin/plugins/echarts/shine.js"></script>
<script type="text/javascript" src="${basepath}skin/plugins/echarts/map/js/shandong.js"></script>

<script>

	//var orgcode =  '';
	// 地图统计构建图形
	function initMap() {
		mapChart = echarts.init($('#sdMapTj').get(0));
		var option = {
			title : {
				text : '各地区登记数量统计('+(new Date).getFullYear()+')',
				left: 'center'
			},
			tooltip : {
				trigger : 'item'
			},
			visualMap : {
				min : 6000,
				max : 600000,
				left : 'left',
				top : 'bottom',
				text : [ '高', '低' ], // 文本，默认为数值文本
				inRange: {
	                color: ['orangered','yellow','green']
	            }
			},
			toolbox : {
				show : true,
				orient : 'vertical',
				left : 'right',
				top : 'center',
				feature : {
					dataView : {
						readOnly : false
					},
					restore : {},
					saveAsImage : {}
				}
			},
			series : [ {
				name : '登记数量',
				type : 'map',
				mapType : '山东',
				roam : false,
				label : {
					normal : {
						show : true
					},
					emphasis : {
						show : true
					}
				},
				itemStyle : {
					normal : {
						 label : {
		                        formatter : "{b}\n({c})",
		                    }	  
					}
				},
				data : []
			}]
		};
		mapChart.setOption(option);
	}

	//获取统计数据
	function getMapDate(){
		mapChart.showLoading();
		var data=[{name:'济南市',value:18},
				  {name:'青岛市',value:16},
				  {name:'淄博市',value:15},
				  {name:'枣庄市',value:14},
				  {name:'东营市',value:13},
				  {name:'烟台市',value:12},
				  {name:'潍坊市',value:11},
				  {name:'济宁市',value:10},
				  {name:'泰安市',value:9},
				  {name:'威海市',value:8},
				  {name:'日照市',value:7},
				  {name:'莱芜市',value:6},
				  {name:'临沂市',value:5},
				  {name:'德州市',value:4},
				  {name:'聊城市',value:3},
				  {name:'滨州市',value:2},
				  {name:'菏泽市',value:1}
			];
		mapChart.hideLoading();
		mapChart.setOption({
			title : {
				subtext: '共'+data.count+'件',
			},
			visualMap:{
				min:0,
				max:20
			},
			series:[{
				data:data
			}]
		});
		/**
		$.ajax({
			url : urlcsrf(basepath + 'sys/PubMainShow/getMapDate'),
			type : "POST",
			dataType : 'json',
			timeout : 600000,
			success : function(data) {
				mapChart.hideLoading();
				mapChart.setOption({
					title : {
						subtext: '共'+data.count+'件',
					},
					visualMap:{
						min:data.min,
						max:data.max
					},
					series:[{
						data:data.data
					}]
				});
			}
		});
		**/
	}
$(function() {
	initMap();
	getMapDate();
});
</script>
</head>
<body>
	<div id='sdMapTj' style="width:500px;height:300px;">
	</div>
</body>
</html>
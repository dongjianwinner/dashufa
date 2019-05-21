<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="zh-CN">
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<!-- 上述3个meta标签*必须*放在最前面，任何其他内容都*必须*跟随其后！ -->
<meta name="description" content="">
<meta name="author" content="">
<!--<link rel="icon" href="../../favicon.ico">-->
<%@include file="../common/common.jsp"%>
<link href="<%=baseUrl%>/css/jquery.bs_pagination.min.css" rel="stylesheet">
	
<script type="text/javascript" src="<%=baseUrl%>/js/jquery.bs_pagination.js"></script>
<script type="text/javascript" src="<%=baseUrl%>/js/en.min.js"></script>
	<style type="text/css">
	/*  #mypagination  div{
	 float: right;
	 } */
	  .toright{
	    text-align: right;
	  }
	</style>
<title>大书法</title>
<script type="text/javascript">
var pagen = 5;
$(function(){
	$("#seke li").click(function(){
		$("#seke li").removeClass('active');
		$(this).addClass('active');
		 getPagination();
		
	});
	$(".hidepagination").hide();
	
	 $("#sidebar a").click(function(){
		 $("#sidebar a").removeClass('active');
		 $(this).addClass('active');
		 getPagination()
	 });
	 getPagination(); 
});
/**
 * 显示作者的信息
 */
function getPagination()
{
	var flag = $("#seke .active").attr("value");
	var classfiy =  $("#sidebar .active").attr("value");
	   var url = baseUrl+"/getPagination.do";
	  $.ajax({
 			type : "POST",
 			data:{
 				"flag":flag,
 				"classfiy":classfiy
 			},
 			dataType : "json",
 			url : url,
 			success : function(data) {
 				 $("#mypagination").bs_pagination({
 					   currentPage: 1,
 					  rowsPerPage: 6,
 					    totalPages: data,
 					    showGoToPage: false,
 					    showRowsPerPage: false,
 					    showRowsInfo: false,
 					    showRowsDefaultInfo: true,
 					    mainWrapperClass: "row toright",
 					    containerClass: "replaceWell",
 					    navListContainerClass: "col-xs-12 col-sm-12 col-md-12",
 					   onChangePage: function(event, data) {
 						  getUerInfo(data.currentPage);
 						   // returns page_num and rows_per_page after a link has clicked
 						},
 						onLoad: function(event, data) { 
 							 getUerInfo(data.currentPage);
 							// returns page_num and rows_per_page on plugin load
 						}
 					  });
 			}
 		  });  
}
/**
 * 获得用户的信息
 */
function getUerInfo(data)
{
	var flag = $("#seke .active").attr("value");
	var classfiy =  $("#sidebar .active").attr("value");
	   var url = baseUrl+"/getmainUerInfo.do";
	  $.ajax({
			type : "POST",
			data:{
				"flag":flag,
				"classfiy":classfiy,
				"pagenum":data
			},
			dataType : "json",
			url : url,
			success : function(data) {
				var str = "";
				for(var n = 0;n<data.length;n++)
					{
					var imgurl;
					if(data[n].headportrait!=""&&data[n].headportrait!=null)
						{
						imgurl = baseUrl+"/getheadpic_"+encodeURI(encodeURI(data[n].userid))+".do";
						}else
							{
							imgurl = baseUrl+"/img/kbtx.jpg";
							}
					 var MYurl = baseUrl+"/"+encodeURI(encodeURI(data[n].userid))+"/productInit.do";
					str=str+" <div class=\"col-xs-6 col-lg-4 authorpadding\">"+
						"<div class=\"authorbox\">"+
							"<img src=\""+imgurl+"\" class=\"img-responsive img-thumbnail\" alt=\""+data[n].name+"\">"+
							"<p class=\"authorword limitheight\"><img alt=\"hot\" src=\""+baseUrl+"/img/hot.gif\" style=\"height: 25px;width: 35px;\">"+
							data[n].distribe+
							"</p>"+
							"<p>"+
								"<a class=\"btn btn-default\" role=\"button\" href=\""+MYurl+"\">查看他的作品&raquo;</a>"+
							"</p>"+
						"</div>"+
					"</div>";
					}
				$("#userContent").html(str);
			}
	  }); 
}
</script>

</head>

<body>

	<nav class="navbar navbar-fixed-top navbar-inverse">
		<div class="container">
			<div class="navbar-header">
				<button type="button" class="navbar-toggle collapsed"
					data-toggle="collapse" data-target="#navbar" aria-expanded="false"
					aria-controls="navbar">
					<span class="sr-only">选择分类</span> 
					<span class="icon-bar"></span> 
					<span class="icon-bar"></span> 
					<span class="icon-bar"></span>
				</button>
				<a class="navbar-brand" href="<%=baseUrl%>/homeinit.do">
				  <span style="font-family: 'dj'; color: #fff;">大书法</span>
			   </a>
			</div>
			<%@include file="head.jsp"%>
			<!-- <div id="navbar" class="collapse navbar-collapse">
				<ul class="nav navbar-nav">
					<li class="active"><a href="#">Home</a></li>
					<li><a href="#about">About</a></li>
					<li><a href="#contact">Contact</a></li>
				</ul>
			</div> -->
			<!-- /.nav-collapse -->
		</div>
		<!-- /.container -->
	</nav>
	<!-- /.navbar -->

	<div class="container">

		<div class="row row-offcanvas row-offcanvas-right">

			<div class="col-xs-12 col-sm-9">
				<p class="pull-right visible-xs">
					<button type="button" class="btn btn-primary btn-xs" data-toggle="offcanvas">我最擅长</button>
				</p>
				<div class="jumbotron">
					<h1>
						<span style="font-family: 'dj';">书无止境</span>
					</h1>
					<p>诗以化书,书以寓情。</p>
				</div>
				<ul class="nav nav-tabs" id="seke">
				  <li role="presentation" class="active" value="recommend"><a href="#">推荐作者</a></li>
				  <li role="presentation" value="all"><a href="#">所有作者</a></li>
				</ul>
				<div class="row" id="userContent">
				<%-- 	<div class="col-xs-6 col-lg-4 authorpadding">
						<div class="authorbox">
							<img src="../img/tx.jpg" class="img-responsive img-thumbnail">
							<p class="authorword limitheight"><img alt="hot" src="<%=baseUrl%>/img/hot.gif" style="height: 25px;width: 35px;">张大千（Chang
								Dai-Chien），男，四川内江人，祖籍广东省番禺，1899年5月10日出生于四川省内江市中区城郊安良里的一个书香门第的家庭，中国泼墨画家，书法家。
							</p>
							<p>
								<a class="btn btn-default" href="#" role="button">查看他的作品&raquo;</a>
							</p>
						</div>
					</div>
					<div class="col-xs-6 col-lg-4 authorpadding">
						<div class="authorbox">
							<img src="../img/tx.jpg" class="img-responsive img-thumbnail">
							<p class="authorword limitheight">张大千（Chang
								Dai-Chien），男，四川内江人，祖籍广东省番禺，1899年5月10日出生于四川省内江市中区城郊安良里的一个书香门第的家庭，中国泼墨画家，书法家。
							</p>
							<p>
								<a class="btn btn-default" href="#" role="button">查看他的作品&raquo;</a>
							</p>
						</div>
					</div>
					<div class="col-xs-6 col-lg-4 authorpadding">
						<div class="authorbox">
							<img src="../img/tx.jpg" class="img-responsive img-thumbnail">
							<p class="authorword limitheight">张大千（Chang
								Dai-Chien），男，四川内江人，祖籍广东省番禺，1899年5月10日出生于四川省内江市中区城郊安良里的一个书香门第的家庭，中国泼墨画家，书法家。
							</p>
							<p>
								<a class="btn btn-default" href="#" role="button">查看他的作品&raquo;</a>
							</p>
						</div>
					</div>
					<!--/.col-xs-6.col-lg-4-->
					<div class="col-xs-6 col-lg-4 authorpadding">
						<div class="authorbox">
							<img src="../img/tx.jpg" class="img-responsive img-thumbnail">
							<p class="authorword limitheight">张大千（Chang
								Dai-Chien），男，四川内江人，祖籍广东省番禺，1899年5月10日出生于四川省内江市中区城郊安良里的一个书香门第的家庭，中国泼墨画家，书法家。
							</p>
							<p>
								<a class="btn btn-default" href="#" role="button">查看他的作品&raquo;</a>
							</p>
						</div>
					</div>
					<div class="col-xs-6 col-lg-4 authorpadding">
						<div class="authorbox">
							<img src="../img/tx.jpg" class="img-responsive img-thumbnail">
							<p class="authorword limitheight">张大千（Chang
								Dai-Chien），男，四川内江人，祖籍广东省番禺，1899年5月10日出生于四川省内江市中区城郊安良里的一个书香门第的家庭，中国泼墨画家，书法家。
							</p>
							<p>
								<a class="btn btn-default" href="#" role="button">查看他的作品&raquo;</a>
							</p>
						</div>
					</div>
					<!--/.col-xs-6.col-lg-4-->
					<div class="col-xs-6 col-lg-4 authorpadding">
						<div class="authorbox">
							<img src="../img/tx.jpg" class="img-responsive img-thumbnail">
							<!--<h2>Heading</h2>-->
							<p class="authorword limitheight">张大千（Chang
								Dai-Chien），男，四川内江人，祖籍广东省番禺，1899年5月10日出生于四川省内江市中区城郊安良里的一个书香门第的家庭，中国泼墨画家，书法家。
							</p>
							<p>
								<a class="btn btn-default" href="#" role="button">查看他的作品&raquo;</a>
							</p>
						</div>
					</div> --%>
					<!--/.col-xs-6.col-lg-4-->
				</div>
				<!--/row-->


<!-- 
				<nav style="float: right;">
					<ul class="pagination">
						<li>
						<a style="cursor: pointer;" aria-label="Previous"> <span
								aria-hidden="true">&laquo;</span>
						</a>
						</li>
						<li class="active data" value="1"><a href="#">1</a></li>
						<li class="data" value="2"><a href="#">2</a></li>
						<li class="data" value="3"><a href="#">3</a></li>
						<li class="data" value="4"><a href="#">4</a></li>
						<li class="data" value="5"><a href="#">5</a></li>
						<li value="6" class="hidepagination data"><a href="#">6</a></li>
						<li value="7" class="hidepagination data"><a href="#">7</a></li>
						<li value="8" class="hidepagination data"><a href="#">8</a></li>
						<li value="9" class="hidepagination data"><a href="#">9</a></li>
						<li value="10" class="hidepagination data"><a href="#">10</a></li>
						<li>
						<a style="cursor: pointer;" aria-label="Next"> <span
								aria-hidden="true">&raquo;</span>
						</a></li>
					</ul>
				</nav> -->

             <div id="mypagination"></div>

			</div>
			<!--/.col-xs-12.col-sm-9-->

			<div class="col-xs-6 col-sm-3 sidebar-offcanvas" id="sidebar">
				<div class="list-group">
                       <a href="#" class="list-group-item active" value="zheng">正书</a> 
                       <a href="#" class="list-group-item" value="cao">草书</a> 
                       <a href="#" class="list-group-item" value="li">隶书</a> 
                       <a href="#" class="list-group-item" value="zhuan">篆书</a> 
                       <a href="#" class="list-group-item" value="xing">行书</a> 
                       <a href="#" class="list-group-item" value="other">其他</a> 
				</div>
			</div>
			<!--/.sidebar-offcanvas-->
		</div>
		<!--/row-->

		<hr>

		<footer>
			<p>&copy; Company 2015</p>
		</footer>

	</div>
	<!--/.container-->



</body>
</html>


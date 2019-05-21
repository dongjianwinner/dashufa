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
     <%@include file="../common/common.jsp" %>
    <title>大书法</title>
    
    <script type="text/javascript">
    var id = "${id}";
       $(function(){
    	   var url = baseUrl+"/"+id+"/getPicByProductId.do";
    	   $("#productOne").attr("src",url);
    	   getProductById();
    	   getUserByProductId();
       });
/**
 * 获得照片信息
 */
       function getProductById()
       {
    	   var url = baseUrl+"/getProductById.do";
 	      $.ajax({
 	 			type : "POST",
 	 			data:{
 	 				"id":id
 	 			},
 	 			dataType : "json",
 	 			url : url,
 	 			success : function(data) {
 	 				$("#title").html(data.productName);
 	 				$("#discribe").html(data.description);
 	 			}
 	      });
       }
       function getUserByProductId()
       {
    	   var url = baseUrl+"/getUserByProductId.do";
 	      $.ajax({
 	 			type : "POST",
 	 			data:{
 	 				"id":id
 	 			},
 	 			dataType : "json",
 	 			url : url,
 	 			success : function(data) {
 	 				$("#username").html(data.name);
 	 				$("#jianjie").html(data.distribe);
 	 				$("#zhuzhi").html(data.address);
 	 				$("#youxiang").html(data.email);
 	 				$("#dianhua").html(data.tel);
 	 				var imgurl;
 	 				if(data.headportrait!=null)
 	 					{
 	 					imgurl = baseUrl+"/getheadpic_"+encodeURI(encodeURI(data.userid))+".do";
 	 					}else
 	 						{
 	 						imgurl = baseUrl+"/img/kbtx.jpg";
 	 						}
 	 				$("#touxiang").attr("src",imgurl);
 	 			}
 	      });
       }
       
     </script>
  </head>

  <body style="background-color: #fff;">
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
			<!-- /.nav-collapse -->
		</div>
		<!-- /.container -->
	</nav>
	<!-- /.navbar -->

	<div class="container">

		<div class="row row-offcanvas row-offcanvas-right">

			<div class="col-xs-12 col-sm-9">
				<p class="pull-right visible-xs">
					<button type="button" class="btn btn-primary btn-xs" data-toggle="offcanvas">作者信息</button>
				</p>
				<div class="jumbotron">
					<h1>
						<span style="font-family: 'dj';">书无止境</span>
					</h1>
					<p>诗以化书,书以寓情。</p>
				</div>
				<div class="row" id="userContent">
				       <h2>
			        <span class="glyphicon glyphicon-info-sign" aria-hidden="true" >
			        </span>
			         <span style=" font-family:'Microsoft YaHei';" id="title" ></span>          
			        </h2>
			          <img   class="img-responsive" id="productOne">
			          <div class="well" style="padding: 15px;margin-top: 20px;">
			            <p id="discribe"></p>
			          </div>
			          <div style="clear: both;"></div>
			          <hr>
				</div>
				<!--/row-->




             <div id="mypagination"></div>

			</div>
			<!--/.col-xs-12.col-sm-9-->

			<div class="col-xs-6 col-sm-3 sidebar-offcanvas" id="sidebar">
				<img  class="img-thumbnail img-responsive" style="width: 200px;" id="touxiang">
				<dl class="dl-horizontal">
				  <dt>用户名:</dt>
				  <dd id="username"></dd>
				   <dt>简介:</dt>
				  <dd id="jianjie"></dd>
				</dl>
				<address>
				  <strong>地址:</strong><br>
				  <span id="zhuzhi"></span><br>
				  <span id="youxiang"></span><br>
				  <abbr title="Phone"></abbr> <span id="dianhua"></span>
				</address>
			</div>
			<!--/.sidebar-offcanvas-->
		</div>
		<!--/row-->

		<hr>

		<footer>
			<p>&copy; Company 2015</p>
		</footer>

	</div>
  </body>
</html>


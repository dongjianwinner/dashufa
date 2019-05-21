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
<%@include file="../common/common.jsp"%>
<script type="text/javascript">
var userid = "${userid}";
var nowuser = "${nowuser}";
 function toCreat()
 {
	 window.location.href = baseUrl+"/createAlbum.do";
 }
/**
 * 获得list
 */
 function getName(str)
 {
	 var name = "";
	 if(str=="zheng")
		 {
		 name = "正书";
		 }else if(str=="cao")
			 {
			 name = "草书";
			 }else if(str=="li")
			 {
				 name = "隶书";
				 }else if(str=="zhuan")
				 {
					 name = "篆书";
					 }else if(str=="xing")
					 {
						 name = "行书";
						 }else if(str=="other")
						 {
							 name = "其他";
							 }
	 return name;
 }
  $(function(){
	  if(userid == nowuser)
		  {
		 $("#newzpj").show(); 
		  }else
			  {
			  $("#newzpj").hide(); 
			  }
	//获得该用户的分类
	  var url = baseUrl+"/getClassfiy.do";
      $.ajax({
 			type : "POST",
 			data:{
 				"userid":userid
 			},
 			dataType : "json",
 			url : url,
 			success : function(data) {
 				var str = "";
 				for(var n = 0;n<data.length;n++)
 					{
 					var name = getName(data[n]);
 					var real;
 					if(n==0)
 						{
 						 real = "<a href=\"#\" class=\"list-group-item active\" value=\""+data[n]+"\">"+name+"</a>";
 						//获得主要类容
 	 					 showContenet(data[n]);
 						}else{
 							 real = "<a href=\"#\" class=\"list-group-item\" value=\""+data[n]+"\">"+name+"</a>";
 						}
 					str = str+ real;
 					}
 				$("#realgroup").html(str);
 				
 				$("#realgroup .list-group-item").click(function(){
 					//切换效果
 					$("#realgroup .list-group-item").removeClass("active");
 					$(this).addClass("active");
 					//获得相册数据
 					var value = $(this).attr("value");
 					//获得主要类容
 					 showContenet(value);
 					
 				});
 			}
 		  });
  }); 
  
  function showContenet(value)
  {
	  var url = baseUrl+"/getAlbumInfo.do";
	      $.ajax({
	 			type : "POST",
	 			data:{
	 				"classfy":value,
	 				"userid":userid
	 			},
	 			dataType : "json",
	 			url : url,
	 			success : function(data) {
	 				var str="";
	 				if(data!=null&&data.length!=0)
	 					{
	 				     //显示相册
		 				    for(var n = 0;n<data.length;n++)
		 					  {
		 				    	var picurl;
		 				    	if(data[n].picid!=null)
		 				    		{
		 				    		picurl = baseUrl+"/"+data[n].picid+"/getPicByProductId.do";
		 				    		}else
		 				    			{
		 				    			  picurl = baseUrl+"/img/zwtp.jpg";
		 				    			}
		 				    	 str = str+"<div class=\"col-xs-6 col-lg-4 authorpadding pointer\" id=\""+data[n].albumid+"\">"+
								"<div class=\"authorbox\">"+
									"<img src=\""+picurl+"\" class=\"img-responsive img-thumbnail\">"+
									 "<h4>"+data[n].albumname+"</h4>"+
									"<p class=\"text-right productdate\"   style=\"font-size: 12px;\">"+
									   data[n].showDate+
									"</p>"+
									"<p>"+
									"</p>"+
								"</div>"+
							"</div>" 
		 					  }
	 					}else
	 						{
	 						str = "<h1>暂无任何作品集</h1>"
	 						}
	 				$("#maincontent").html(str);
	 				//添加单击事件
	 				$("#maincontent .pointer").click(function(){
	 					var id = $(this).attr("id");
	 					var showflag = true;
	 					 if(userid != nowuser)
	 						 {
	 						showflag = false;
	 						 }
	 					window.location.href = baseUrl+"/"+id+"/realproductInit.do?showflag="+showflag+"#";
	 				});
	 			}
	      });
  }
</script>

<title>大书法</title>
</head>

<body>
	<nav class="navbar navbar-fixed-top navbar-inverse">
		<div class="container">
			<div class="navbar-header">
				<button type="button" class="navbar-toggle collapsed"
					data-toggle="collapse" data-target="#navbar" aria-expanded="false"
					aria-controls="navbar">
					<span class="sr-only">Toggle</span> 
					<span class="icon-bar"></span> 
					<span class="icon-bar"></span> 
					<span class="icon-bar"></span>
				</button>
				<a class="navbar-brand" href="<%=baseUrl%>/homeinit.do">
				  <span style="font-family: 'dj'; color: #fff;">大书法</span>
			   </a>
			</div>
			  <div id="navbar" class="collapse navbar-collapse">
				<ul class="nav navbar-nav">
					<li><a href="<%=baseUrl%>/homeinit.do">首页</a></li>
					<li><a href="<%=baseUrl%>/recommedproduct.do">推荐作品</a></li>
					<li><a href="<%=baseUrl%>/toAuthor.do">书法家</a></li>
					<li><a href="<%=baseUrl%>/undo.do">书法论坛</a></li>
				</ul>
				<button type="button" class="btn btn-primary" style="margin-top: 8px;float: right;" onclick="toCreat()" id="newzpj">新建作品集</button>
			</div>
			<!-- <div id="navbar" class="collapse navbar-collapse">
				<ul class="nav navbar-nav">
					<li class="active"><a href="#">Home</a></li>
					<li><a href="#about">About</a></li>
					<li><a href="#contact">Contact</a></li>
				</ul>
				<button type="button" class="btn btn-primary" style="margin-top: 8px;float: right;" onclick="toCreat()">新建作品集</button>
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
					<button type="button" class="btn btn-primary btn-xs" data-toggle="offcanvas">分类</button>
				</p>
				<div class="jumbotron">
					<h1>
						<span style="font-family: 'dj';">书无止境</span>
					</h1>
					<p>诗以化书,书以寓情。</p>
				</div>
				<div class="row" id="maincontent">
				
				</div>



				<!-- <nav style="float: right;">
					<ul class="pagination">
						<li><a href="#" aria-label="Previous"> <span
								aria-hidden="true">&laquo;</span>
						</a></li>
						<li><a href="#">1</a></li>
						<li><a href="#">2</a></li>
						<li><a href="#">3</a></li>
						<li><a href="#">4</a></li>
						<li><a href="#">5</a></li>
						<li><a href="#" aria-label="Next"> <span
								aria-hidden="true">&raquo;</span>
						</a></li>
					</ul>
				</nav> -->


			</div>
			<!--/.col-xs-12.col-sm-9-->

			<div class="col-xs-6 col-sm-3 sidebar-offcanvas" id="sidebar_font">
				<div class="list-group" id="realgroup">
					     <!-- <a href="#" class="list-group-item active" value="zheng">正书</a>
					     <a href="#" class="list-group-item" value="cao">草书</a>
						 <a href="#" class="list-group-item" value="li">隶书</a>
						 <a href="#" class="list-group-item" value="zhuan">篆书</a>
						 <a href="#" class="list-group-item" value="xing">行书</a>
						 <a href="#" class="list-group-item" value="other">其他</a> -->
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


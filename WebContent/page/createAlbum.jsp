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
<link href="<%=baseUrl%>/webuploader-0.1.5/webuploader.css" rel="stylesheet">
<script type="text/javascript" src="<%=baseUrl%>/webuploader-0.1.5/webuploader.min.js"></script>
 <script type="text/javascript">
    function save()
    {
    	var url = baseUrl+"/saveAlbum.do";
        $.ajax({
   			type : "POST",
   			data:{
   				"albumname":$("#albumName").val(),
   				"classify":$("#classify").val(),
   				"description":$("#description").val()
   			},
   			dataType : "json",
   			url : url,
   			success : function(data) {
      		   alert("success");
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
			<%@include file="head.jsp"%>
			<!-- /.nav-collapse -->
		</div>
		<!-- /.container -->
	</nav>
	<!-- /.navbar -->

<div class="container">
      <div class="page-header">
        <h2>新建相册</h2>
        </div>
         <div class="row" >
            <div class="col-lg-5">
               <div class="tableworddiv">
                 <label for="exampleInputName2"><span class="redword">*</span>相册名</label>
               </div>
                <div class="tableinputdiv">
                   <input type="text" id="albumName"  placeholder="相册名" class="inputcss">
               </div>
            </div>
            <div class="col-lg-7">
               <span class="intoredword" id="albumNameword"></span>
            </div>
          
        </div>
          <div class="row" >
            <div class="col-lg-5">
               <div style="width: 30%;float: left;text-align: right;vertical-align: middle;line-height: 30px;">
                 <label for="exampleInputName2"><span class="redword">*</span>分类</label>
               </div>
                <div style="width: 70%;float: left;padding-left: 15px">
                   <select id="classify" style="width: 100%;height: 34px;">
                       <option value=""></option>
                       <option value="zheng">正书</option>
                       <option value="cao">草书</option>
                       <option value="li">隶书</option>
                       <option value="zhuan">篆书</option>
                       <option value="xing">行书</option>
                       <option value="other">其他</option>
                   </select>
               </div>
            </div>
          <div class="col-lg-7">
               <span class="intoredword" id="newpasswordword"></span>
            </div>
        </div>
        <div class="row" >
            <div class="col-lg-5">
               <div style="width: 30%;float: left;text-align: right;vertical-align: middle;line-height: 30px;">
                 <label for="exampleInputName2"><span class="redword"></span>相册描述</label>
               </div>
                <div style="width: 70%;float: left;padding-left: 15px">
                   <textarea style="width: 100%;" rows="6" id="description"></textarea>
               </div>
            </div>
        <!--   <div class="col-lg-7">
            </div> -->
        </div>
     
      <hr>
      <button class="btn btn-default" type="submit" style="float: right;" onclick="save()">保存</button>
      <footer>
        <p>&copy; Company 2015</p>
      </footer>
    </div><!--/.container-->

</body>
</html>


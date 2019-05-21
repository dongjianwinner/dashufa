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
     <%@include file="../common/common.jsp" %>
     <link href="<%=baseUrl%>/webuploader/imgupload.css" rel="stylesheet">
      <link href="<%=baseUrl%>/webuploader/webuploader.css" rel="stylesheet">
      <script type="text/javascript" src="<%=baseUrl%>/webuploader/webuploader.js"></script>
      <script type="text/javascript" src="<%=baseUrl%>/webuploader/imgupload.js"></script>
      <script type="text/javascript">
         var BASE_URL  = baseUrl;
         var num = "${num}";
         var id = "${id}";
      </script>
    <title>大书法</title>
  </head>

  <body>

     <nav class="navbar navbar-fixed-top navbar-inverse">
      <div class="container">
        <div class="navbar-header">
          <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#navbar" aria-expanded="false" aria-controls="navbar">
            <span class="sr-only">Toggle navigation</span>
            <span class="icon-bar"></span>
            <span class="icon-bar"></span>
            <span class="icon-bar"></span>
          </button>
          <a class="navbar-brand" href="<%=baseUrl%>/homeinit.do"><span style=" font-family:'dj'; color:#fff;">大书法</span></a>
        </div>
         <%@include file="head.jsp"%>
       <!--  <div id="navbar" class="collapse navbar-collapse">
          <ul class="nav navbar-nav">
            <li class="active"><a href="#">Home</a></li>
            <li><a href="#about">About</a></li>
            <li><a href="#contact">Contact</a></li>
          </ul>
        </div> --><!-- /.nav-collapse -->
      </div><!-- /.container -->
    </nav><!-- /.navbar -->
 
    <div class="container">
      <div class="page-header">
        <h2>添加作品</h2>
        </div>
        <div class="row" >
            <div class="col-lg-12">
               
               <div class="page-container">
					<p>您可以尝试文件拖拽，使用QQ截屏工具，然后激活窗口后粘贴，或者点击添加图片按钮，来上传您的作品.</p>
					<div id="uploader" class="wu-example">
						<div class="queueList">
							<div id="dndArea" class="placeholder">
								<div id="filePicker" class="webuploader-container">
									<div class="webuploader-pick">点击选择图片</div>
									<div id="rt_rt_19l5lh9k3ul4pd1k9u1gm0133n1"
										style="position: absolute; top: 0px; left: 448px; width: 168px; height: 44px; overflow: hidden; bottom: auto; right: auto;">
										<input type="file" name="file"
											class="webuploader-element-invisible" multiple="multiple"
											accept="image/*"><label
											style="opacity: 0; width: 100%; height: 100%; display: block; cursor: pointer; background: rgb(255, 255, 255);"></label>
									</div>
								</div>
								<p>或将照片拖到这里，单次最多可选300张</p>
							</div>
							<ul class="filelist"></ul>
						</div>
						<div class="statusBar" style="display: none;">
							<div class="progress" style="display: none;">
								<span class="text">0%</span> <span class="percentage"
									style="width: 0%;"></span>
							</div>
							<div class="info">共0张（0B），已上传0张</div>
							<div class="btns">
								<div id="filePicker2" class="webuploader-container">
									<div class="webuploader-pick">继续添加</div>
									<div id="rt_rt_19l5lh9kf1o221jtm1cut1so7101e6"
										style="position: absolute; top: 0px; left: 0px; width: 1px; height: 1px; overflow: hidden;">
										<input type="file" name="file"
											class="webuploader-element-invisible" multiple="multiple"
											accept="image/*"><label
											style="opacity: 0; width: 100%; height: 100%; display: block; cursor: pointer; background: rgb(255, 255, 255);"></label>
									</div>
								</div>
								<div class="uploadBtn state-pedding">开始上传</div>
							</div>
						</div>
					</div>

				</div>
               
               
            </div>
          
        </div>
     
      
      <hr>
      <footer>
        <p>&copy; Company 2015</p>
      </footer>
    </div><!--/.container-->
  </body>
</html>


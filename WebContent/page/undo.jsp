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
  </head>

  <body style="background-color: #fff;">

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
      </div><!-- /.container -->
    </nav><!-- /.navbar -->
 
    <div class="container">
        <h2>
        <span class="glyphicon glyphicon-info-sign" aria-hidden="true"></span>
                          页面正在维护中，现暂停使用......
        </h2>
          <img  src="<%=baseUrl%>/img/wn.jpg" style="float: right;" class="img-responsive">
          <div style="clear: both;"></div>
      <hr>
      <footer>
        <p>&copy; Company 2015</p>
      </footer>

    </div>
  </body>
</html>


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
    <title>大书法</title>
    <script type="text/javascript">
    var password = "${password}";
    var oldflag = true;
    var newflag = true;
    var newcomfirm = true;
    
    
    
    $(function(){
    	$("#oldpassword").blur(function(){
    		 if($("#oldpassword").val()=="")
    	 	{
    	 	  $("#oldpasswordword").html("*旧密码不能为空*");
    	 	  $("#oldpasswordsure").hide();
    	 	  oldflag = false;
    	 	}else if($("#oldpassword").val()!=password)
    	  	{
    	 	 	  $("#oldpasswordword").html("*密码不正确*");
    	 	 	  $("#oldpasswordsure").hide();
    	 	 	 oldflag = false;
    	 	 	}
    	   else 
    	 		{
    	 		$("#oldpasswordsure").show();
    	 		 $("#oldpasswordword").html("");
    	 		 oldflag = true;
    	 		}
    	 });
    	$("#newpassword").blur(function(){
    		  if($("#newpassword").val()=="")
    	    	{
    	    	  $("#newpasswordword").html("*新密码不能为空*");
    	    	  newflag = false;
    	    	  $("#newpasswordsure").hide();
    	    	}else
    	    		{
    	    		 $("#newpasswordword").html("");
    	    		 $("#newpasswordsure").show();
    	    		 newflag = true;
    	    		}
    	});
    	
    	
    });
/**
 * 修改密码
 */
       function changePassword()
       {
    	   if($("#newpasswordcomfirm").val()=="")
	    	{
	    	  $("#newpasswordcomfirmword").html("*新密码确认不能为空*");
	    	  newcomfirm = false;
	    	  $("#newpasswordcomfirmsure").hide();
	    	}else if($("#newpasswordcomfirm").val()!=$("#newpassword").val())
	    		{
	    		 $("#newpasswordcomfirmword").html("*密码确认与输入新密码不符*");
	    		 newcomfirm = false;
	    		 $("#newpasswordcomfirmsure").hide();
	    		}else
	    			{
	    			 $("#newpasswordcomfirmword").html("");
	    			 $("#newpasswordcomfirmsure").show();
	    			 newcomfirm = true;
	    			}
	    if(newcomfirm&&newflag&&oldflag)
	    	{
	    	var url = baseUrl+"/changePassword.do";
	    	   $.ajax({
	 	 			type : "POST",
	 	 			data:{
	 	 				"password":$("#newpassword").val()
	 	 			},
	 	 			dataType : "json",
	 	 			url : url,
	 	 			success : function(data) {
	 	 				alert(123);
	 	 				window.location.href = baseUrl+"/homeinit.do"
	 	 			}
	 	 		  }); 
	    	}
    	   
       }
    
    </script>
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
      </div><!-- /.container -->
    </nav><!-- /.navbar -->
 
    <div class="container">
      <div class="page-header">
        <h2>修改密码</h2>
        </div>
        <div class="row" >
            <div class="col-lg-5">
               <div class="tableworddiv">
                 <label for="exampleInputName2"><span class="redword">*</span>旧密码</label>
               </div>
                <div class="tableinputdiv">
                   <input type="password" id="oldpassword" class="form-control" placeholder="旧密码" required autofocus>
                    <span class="glyphicon glyphicon-ok form-control-feedback" aria-hidden="true" style="color: green;padding-left: 20px;display: none;"  id="oldpasswordsure"></span>
               </div>
            </div>
            <div class="col-lg-7">
               <span class="intoredword" id="oldpasswordword"></span>
            </div>
          
        </div>
        <div class="row" >
            <div class="col-lg-5">
               <div style="width: 30%;float: left;text-align: right;vertical-align: middle;line-height: 30px;">
                 <label for="exampleInputName2"><span class="redword">*</span>新密码</label>
               </div>
                <div style="width: 70%;float: left;padding-left: 15px">
                   <input type="password" id="newpassword" class="form-control" placeholder="新密码" required autofocus>
                   <span class="glyphicon glyphicon-ok form-control-feedback" aria-hidden="true" style="color: green;padding-left: 20px;display: none;"  id="newpasswordsure"></span>
               </div>
            </div>
          <div class="col-lg-7">
               <span class="intoredword" id="newpasswordword"></span>
            </div>
        </div>
        <div class="row" >
            <div class="col-lg-5">
               <div style="width: 30%;float: left;text-align: right;vertical-align: middle;line-height: 30px;">
                 <label for="exampleInputName2"><span class="redword">*</span>新密码确认</label>
               </div>
                <div style="width: 70%;float: left;padding-left: 15px">
                   <input type="password" id="newpasswordcomfirm" class="form-control" placeholder="新密码确认" required autofocus>
                   <span class="glyphicon glyphicon-ok form-control-feedback" aria-hidden="true" style="color: green;padding-left: 20px;display: none;"  id="newpasswordcomfirmsure"></span>
               </div>
            </div>
          <div class="col-lg-7">
               <span class="intoredword" id="newpasswordcomfirmword"></span>
            </div>
        </div>
      <hr>
      <button class="btn btn-default" type="submit" style="float: right;" onclick="changePassword()">保存</button>
      <footer>
        <p>&copy; Company 2015</p>
      </footer>
    </div><!--/.container-->
  </body>
</html>


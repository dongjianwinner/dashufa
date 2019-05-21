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
     <script type="text/javascript" src="<%=baseUrl%>/js/ajaxfileupload.js"></script>
     <script type="text/javascript">
     $(function(){
    	 $("#headpicinputs").on("change", function(){
    		    var files = !!this.files ? this.files : [];
    		    if (!files.length || !window.FileReader)
    		    	{
    		    	 $("#headpic").attr("src",baseUrl+"/img/kbtx.jpg");
    		    	  return;
    		    	}
    		    if (/^image/.test( files[0].type)){
    		        var reader = new FileReader();
    		        reader.readAsDataURL(files[0]);
    		        reader.onloadend = function(){
    		       $("#headpic").attr("src", this.result);
    		        }
    		    }
    		  
    		});
    	 
    	 	$('.form_date').datetimepicker({
    	 		language:  'zh-CN',
    	        weekStart: 1,
    	        todayBtn:  1,
    			autoclose: 1,
    			todayHighlight: 1,
    			startView: 2,
    			minView: 2,
    			forceParse: 0
    	    }); 
    	 	
    	 	
    	 	$("#userid").blur(function(){
    	 		$("#loading").show();
    	 		var url = baseUrl+"/checkUserName.do"
    	 		 $.ajax({
    	 			type : "POST",
    	 			data:{
    	 				"id":$("#userid").val()
    	 			},
    	 			dataType : "json",
    	 			url : url,
    	 			success : function(data) {
    	 				if(data.success=="success")
    	 					{
    	 					  $("#loading").hide();
    	 					  $("#noonesure").show();
    	 					  $("#infoname").html('');
    	 					}else
    	 						{
    	 						 $("#loading").hide();
       	 					      $("#noonesure").hide();
       	 					      $("#infoname").html('*用户名已被使用*');
    	 						 }
    	 			}
    	 		  });
    	 		});
     });
     
     
     
     function saveUser()
     {   
    	 var flag = true;
    	 
    	 if($("#userid").val()=="")
  		{
      		$("#infoname").html("*用户名不能为空*");
      		flag = false;
  		}else
  			{
  			$("#infoname").html("");
  			}
     
     	if($("#email").val()=="")
 		{
     		$("#mailredword").html("*邮箱不能为空*");
     		flag = false;
 		}else
 			{
 			$("#mailredword").html("");
 			}
     	if($("#password").val()=="")
 		{
     		$("#passwordredword").html("*密码不能为空*");
     		flag = false;
 		}else
 			{
 			$("#passwordredword").html("");
 			}
     	if($("#confirmpassword").val()=="")
 		{
     		$("#confirmpasswordredword").html("*确认密码不能为空*");
     		flag = false;
 		}else
 			{
 			if($("#confirmpassword").val()!=$("#password").val())
     		{
     		$("#confirmpasswordredword").html("*确认密码和密码不一致*");
     		flag = false;
     		}else
     			{
     			$("#confirmpasswordredword").html("");
     			}
 			}
     	
     	
     	
     	if($("#tel").val()=="")
 		{
     		$("#telredword").html("*联系电话不能为空*");
     		flag = false;
 		}else
 			{
 			$("#telredword").html("");
 			}
     	
     	if($("#brontime").val()=="")
 		{
     		$("#brontimeredword").html("*出生日期不能为空*");
     		flag = false;
 		}else
 			{
 			$("#brontimeredword").html("");
 			}
     	if(flag == false)
     		{
     		  return ;
     		}
     	
     	$.ajaxFileUpload({
             url:baseUrl +'/register.do',//处理图片脚本
             secureuri :false,
             data: {
                "userid":$("#userid").val(),
             	"email":$("#email").val(),
             	"password":$("#password").val(),
             	"name":$("#name").val(),
             	"sex":$("#sex").val(),
             	"tel":$("#tel").val(),
             	"showbrontime":$("#brontime").val(),
             	"distribe":$("#distribe").val(),
             	"goodat":$("#distribe").val(),
             	"address":$("#address").val() 
             },
             fileElementId :'headpicinputs',//file控件id
             dataType : 'json',
             success : function (data, status){
            	 alert(data.id);
            	 window.location.href = baseUrl+"/homeinit.do?id="+data.id+"#";;
            	 /* if(data.success!="success")
            		 {
            		 
            		 }else
            			 {
            			   var id = data.id;
            			   
            			 } */
             
             },
             error: function(data, status, e){
                 alert(e);
             },
             onComplete: function(filename,msg) {}
     });
     }
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
      </div><!-- /.container -->
    </nav><!-- /.navbar -->
 
    <div class="container">
      <div class="page-header">
        <h2>用户注册</h2>
        </div>
        <div class="row" >
            <div class="col-lg-9" >
                <div class="row">
                   <div class="col-lg-6">
							<div class="form-group  has-feedback">
								<label for="exampleInputName2"><span class="redword">*</span>用户名</label>
								<img  src="<%=baseUrl%>/img/loading.gif" style="height: 25px;display: none;" id="loading">
								<span id="infoname" class="intoredword">
								</span>
  <input type="text" class="form-control" id="userid" aria-describedby="inputSuccess2Status">
   <span class="glyphicon glyphicon-ok form-control-feedback" aria-hidden="true" style="color: green;display: none;" id="noonesure"></span>
</div>
									  
									
							</div>
					  <div class="col-lg-6">
							<div class="form-group">
							<label for="exampleInputEmail2"><span class="redword">*</span>邮箱</label><span id="mailredword" class="intoredword"></span> <input type="email"
									class="form-control" id="email"
									placeholder="jane.doe@example.com">
								
							</div>
					</div>
					</div>
					<div class="row">
					 <div class="col-lg-6">
							<div class="form-group">
								<label for="exampleInputName2"><span class="redword">*</span>密码</label> <span id="passwordredword" class="intoredword"></span><input type="password"
									class="form-control" maxlength="20" id="password">
							</div>
					</div>
					<div class="col-lg-6">
							<div class="form-group">
								<label ><span class="redword">*</span>确认密码</label><span id="confirmpasswordredword" class="intoredword"></span> <input type="password" id="confirmpassword"
									class="form-control" maxlength="20">
							</div>
					</div>
					</div>
					<div class="row">
					 <div class="col-lg-6">
							<div class="form-group">
								<label for="exampleInputName2">真实姓名</label> <input type="text"
									class="form-control" id="name">
							</div>
					</div>
					<div class="col-lg-6">
							<div class="form-group">
								<label >性别</label> 
								<select class="form-control" id="sex">
								   <option value=""></option>
								   <option value="man">男</option>
								    <option value="woman">女</option>
								</select>
							</div>
					</div>
					</div>
					<div class="row">
					 <div class="col-lg-6">
							<div class="form-group">
								<label for="exampleInputName2"><span class="redword">*</span>联系电话</label>
								<span id="telredword" class="intoredword"></span>
									<div class="input-group">
										<span class="input-group-addon" id="basic-addon1">+86</span> <input
											type="text" class="form-control" placeholder="Tel"
											aria-describedby="basic-addon1" id="tel">
									</div>
					         </div>
					</div>
					<div class="col-lg-6">
								<div class="form-group">
					               <label for="exampleInputName2"><span class="redword">*</span>出生日期</label>
					               <span id="brontimeredword" class="intoredword"></span>
					                <div class="input-group date form_date" data-date="" data-date-format="yyyy-mm-dd" data-link-field="dtp_input2" data-link-format="yyyy-mm-dd">
					                    <input class="form-control" size="16" type="text" value="" readonly id="brontime">
					                    <span class="input-group-addon"><span class="glyphicon glyphicon-remove"></span></span>
										<span class="input-group-addon"><span class="glyphicon glyphicon-calendar"></span></span>
					                </div>
									<input type="hidden" id="dtp_input2" value="" /><br/>
                                 </div>
					  </div>
					</div>
					
					<div class="row">
					<div class="col-lg-6">
								<div class="form-group">
								<label >我最擅长</label> 
								<select class="form-control" id="goodat">
								   <option value="zheng">正书</option>
								   <option value="cao">草书</option>
								   <option value="li">隶书</option>
								    <option value="zhuan">篆书</option>
								    <option value="xing">行书</option>
								    <option value="other">其他</option>
								</select>
							</div>
					  </div>
					</div>
					
					
					<div class="row">
					<div class="col-lg-12">
							<div class="form-group">
								<label for="exampleInputName2">详细地址</label> <input type="text"
									class="form-control" id="address">
							</div>
					</div>
					
					</div>
					<div class="row">
					<div class="col-lg-12">
							<div class="form-group">
								<label for="exampleInputName2">自我介绍</label> <input type="text"
									class="form-control" id="distribe">
							</div>
					</div>
					
					</div>
				</div>
					<!-- <button type="submit" class="btn btn-default">Send
						invitation
						</button> -->
           <div class="col-lg-3" id="tes">
              <a href="#" class="thumbnail" style="width: 173px; height: 188px;">
                  <img src="<%=baseUrl %>/img/kbtx.jpg" id="headpic" style="width: 171px; height: 180px;">
                </a> 
                <label for="exampleInputFile">选择头像</label>
                <div id="file">
                   <input type="file" id="headpicinputs" name="headpicinputs"/>
                 </div>
			</div>
        </div>
      <hr>
      <button class="btn btn-default" type="submit" style="float: right;" onclick="saveUser()">保存</button>
      <footer>
        <p>&copy; Company 2015</p>
      </footer>

    </div><!--/.container-->
  </body>
</html>


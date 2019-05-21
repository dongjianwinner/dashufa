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
    var num = "${num}";
    var albumid = "${albumid}";
    //全局变量  保存照片id
    var datas;
    $(function(){
    	if(num!=null)
    		{
    		var url = baseUrl+"/getRecentPic.do";
       	   $.ajax({
      	 			type : "POST",
      	 			data:{
      	 				"num":num
      	 			},
      	 			dataType : "json",
      	 			url : url,
      	 			success : function(data) {
      	    		     var arr = data;
      	    		     datas = data;
      	    		     var str = "";
      	    		     for(var n =0;n<arr.length;n++)
      	    		    	 {
      	    		    	  var url = baseUrl+"/"+arr[n]+"/getPicByProductId.do";
      	    		    	 str = str+ "<img  src=\""+url+"\" class=\"img-responsive\" id=\""+arr[n]+"\">"+
      	    		          "<div class=\"input-group topT\">"+
      	    		             "<span class=\"input-group-addon\" id=\"basic-addon1\">照片名称</span>"+
      	    		              "<input type=\"text\" class=\"form-control\" placeholder=\"照片名称\" aria-describedby=\"basic-addon1\" id=\""+arr[n]+"_name\">"+
      	    		          "</div>"+
      	    		          "<div class=\"input-group topT\">"+
      	    		            " <span class=\"input-group-addon\" id=\"basic-addon1\">添加评论</span>"+
      	    		             " <input type=\"text\" class=\"form-control\" placeholder=\"添加评论\" aria-describedby=\"basic-addon1\"  id=\""+arr[n]+"_comment\">"+
      	    		          "</div><hr>";
      	    		    	 }
      	    		    $("#content").html(str);
      	 			}
      	 		  });
    		}
    		
    	
    })
/**
 * 保存
 */
    function save()
    {
      var allcomment = $("#allcomment").val();
      var id = "";
      var comment = "";
      var name = "";
      if(datas!=null)
    	  {
    	    for(var n = 0;n<datas.length;n++)
    	    	{
    	    	id = id+datas[n]+",";
    	    	comment = comment+$("#"+datas[n]+"_comment").val()+",";
    	    	name = name+$("#"+datas[n]+"_name").val()+",";
    	    	}
    	    id = id.substring(0, id.length-1);
    	    comment = comment.substring(0, comment.length-1);
    	    name = name.substring(0, name.length-1);
    	  }
      var url = baseUrl+"/saveComment.do";
      $.ajax({
 			type : "POST",
 			data:{
 				"id":id,
 				"allcomment":allcomment,
 				"name":name,
 				"comment":comment
 			},
 			dataType : "json",
 			url : url,
 			success : function(data) {
 				window.location.href = baseUrl+"/"+albumid+"/realproductInit.do?showflag="+true;
 			}
 		  });
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
        <!-- <div id="navbar" class="collapse navbar-collapse">
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
        <h2>添加评论</h2>
        </div>
        <div class="row" >
       <div class="input-group" style="margin-top: 10px;">
             <span class="input-group-addon" id="basic-addon1">添加统一评论</span>
              <input type="text" class="form-control" placeholder="添加统一评论" aria-describedby="basic-addon1" id="allcomment">
          </div>
        </div>
      <hr>
      
      
      
      <div id="content"></div>
      
      
      <button class="btn btn-default" type="submit" style="float: right;" onclick="save()">保存</button>
      <footer>
        <p>&copy; Company 2015</p>
      </footer>
    </div><!--/.container-->
  </body>
</html>


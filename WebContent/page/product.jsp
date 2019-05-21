<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="zh-CN">
  <head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <!-- 上述3个meta标签*必须*放在最前面，任何其他内容都*必须*跟随其后！ -->
    <meta name="product" content="">
    <meta name="author" content="">
     <%@include file="../common/common.jsp" %>
    <title>大书法</title>
    <script type="text/javascript">
       var id = "${id}";
       var showflag = "${showflag}";
       $(function(){
    	   if(showflag=="true")
    		   {
    		     $("#sczp").show();
    		   }else
    			   {
    			   $("#sczp").hide();
    			   }
    	   var url = baseUrl+"/showProduct.do";
    	      $.ajax({
    	 			type : "POST",
    	 			data:{
    	 				"id":id
    	 			},
    	 			dataType : "json",
    	 			url : url,
    	 			success : function(data) {
    	 				var str = "";
    	 				for(var n = 0;n<data.length;n++)
    	 					{
    	 					var name="";
    	 					var disc = "";
    	 					 var url = baseUrl+"/"+data[n].productid+"/getPicByProductId.do";
    	 					 if(data[n].productName!=null)
    	 						 {
    	 						   name = data[n].productName;
    	 						 }
    	 					if(data[n].description!=null)
	 						 {
    	 						disc = data[n].description;
	 						 }
    	 					str = str+ "<div class=\"row\">"+
       	 			     " <a class=\"fancybox-thumbs\"  href=\"#"+data[n].productid+"\" title=\""+data[n].productName+"\">"+
       	 			          "<img  src=\""+url+"\" class=\"img-responsive\">"+
       	 			           "<img  src=\""+url+"\" id=\""+data[n].productid+"\" style=\"display:none\">"+
       	 			       "</a>"+
       	 			          "<div class=\"well\">"+
       	 			          "<dl>"+
       	 						  "<dt>"+name+"</dt>"+
       	 						  "<dd>"+disc+"</dd>"+
       	 						"</dl>"+
       	 				     "</div>"+
       	 			      "</div>";
    	 					}
    	 				$("#content").html(str);
    	 				//初始化弹出图片插件
    	 				  $('.fancybox-thumbs').fancybox({
    	 				 	 prevEffect : 'none',
    	 					nextEffect : 'none',

    	 					closeBtn  : true,
    	 					arrows    : true,
    	 					nextClick : true,
    	 					
    	 					helpers : {
    	 						title : {
    	 							type : 'inside'
    	 						},
    	 						buttons	: {}
    	 					}
    	 				});
    	 				
    	 				
    	 			}
    	 		  });
    	  
    	   
       });
       
       function toAddPic()
       {
    	   window.location.href= baseUrl+ "/"+id+"/addNewPic.do";
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
       <div id="navbar" class="collapse navbar-collapse">
				<ul class="nav navbar-nav">
					<li><a href="<%=baseUrl%>/homeinit.do">首页</a></li>
					<li><a href="<%=baseUrl%>/recommedproduct.do">推荐作品</a></li>
					<li><a href="<%=baseUrl%>/toAuthor.do">书法家</a></li>
					<li><a href="<%=baseUrl%>/undo.do">书法论坛</a></li>
				</ul>
				<button type="button" class="btn btn-primary" style="margin-top: 8px;float: right;" onclick="toAddPic()" id="sczp">上传作品</button>
			</div>
      </div><!-- /.container -->
    </nav><!-- /.navbar -->
 
    <div class="container">
      <div class="page-header">
        <h2>作品展示</h2>
        </div>
        
        
        <!--*************** 主要内容***************** -->
      <div id="content">  
     
        </div>
   
   
   
      <footer>
        <p>&copy; Company 2015</p>
      </footer>
    </div><!--/.container-->
  </body>
</html>


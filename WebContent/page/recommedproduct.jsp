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
     <link href="<%=baseUrl%>/css/jquery.bs_pagination.min.css" rel="stylesheet">
<script type="text/javascript" src="<%=baseUrl%>/js/jquery.bs_pagination.js"></script>
<script type="text/javascript" src="<%=baseUrl%>/js/en.min.js"></script>
    <title>大书法</title>
    <script type="text/javascript">
      $(function(){
    	  //获取分页
    	  getPagination();
      });
      
      /**
	   * 显示作者的信息
	   */
	  function getPagination()
	  {
	  	   var url = baseUrl+"/getPaginationforreproduct.do";
	  	  $.ajax({
	   			type : "POST",
	   			data:{
	   				
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
	   						  getrecProductInfo(data.currentPage);
	   						   // returns page_num and rows_per_page after a link has clicked
	   						},
	   						onLoad: function(event, data) { 
	   							getrecProductInfo(data.currentPage);
	   							// returns page_num and rows_per_page on plugin load
	   						}
	   					  });
	   			}
	   		  });  
	  }
     
      function getrecProductInfo(data)
      {
      	   var url = baseUrl+"/getrecProductInfo.do";
      	  $.ajax({
      			type : "POST",
      			data:{
      				"pagenum":data
      			},
      			dataType : "json",
      			url : url,
      			success : function(data) {
      				var str = "";
      				for(var n = 0;n<data.length;n++)
      					{
      					var imgurl = baseUrl+"/"+data[n].productid+"/getPicByProductId.do";
      					str=str+"<div class=\"col-xs-6 col-lg-4 authorpadding\" style=\"cursor: pointer;\" onclick=\"toShowPic('"+data[n].productid+"')\">"+
						"<img src=\""+imgurl+"\" class=\"img-responsive img-thumbnail\" style=\"height: 300px;width: 100%;\">"+
						"</div>";
      					}
      				$("#recproductContent").html(str);
      			}
      	  }); 
      }
      
      function toShowPic(data)
      {
    	  var url = baseUrl+"/"+data+"/toShowPic.do";
    	  window.location.href=url;
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
        <h2>
                                    推荐作品
        </h2>
         <div class="row" id="recproductContent">
             <div class="col-xs-6 col-lg-4 authorpadding">
							<img src="../img/tx.jpg" class="img-responsive img-thumbnail" style="height: 300px;width: 100%;">
					</div>
					 <div class="col-xs-6 col-lg-4 authorpadding">
							<img src="../img/tdrh.jpg" class="img-responsive img-thumbnail" style="height: 300px;width: 100%;">
					</div>
					 <div class="col-xs-6 col-lg-4 authorpadding">
							<img src="../img/mb.jpg" class="img-responsive img-thumbnail" style="height: 300px;width: 100%;">
					</div>
					 <div class="col-xs-6 col-lg-4 authorpadding">
							<img src="../img/tdrh.jpg" class="img-responsive img-thumbnail" style="height: 300px;width: 100%;">
					</div>
					 <div class="col-xs-6 col-lg-4 authorpadding">
							<img src="../img/zi.jpg" class="img-responsive img-thumbnail" style="height: 300px;width: 100%;">
					</div>
					 <div class="col-xs-6 col-lg-4 authorpadding" style="cursor: pointer;" onclick="toShowPic()">
							<img src="../img/user_logo.gif" class="img-responsive img-thumbnail" style="height: 300px;width: 100%;">
					</div>
         </div>
         <div id="mypagination" style="float: right;"></div>
      <hr>
      <footer>
        <p>&copy; Company 2015</p>
      </footer>

    </div>
  </body>
</html>


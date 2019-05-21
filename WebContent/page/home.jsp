<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page language="java" import="java.util.*,java.net.*,com.dashufa.entity.User"%> 
<!DOCTYPE html>
<html lang="zh-CN">
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <!-- 上述3个meta标签*必须*放在最前面，任何其他内容都*必须*跟随其后！ -->
    <meta name="description" content="">
    <meta name="author" content="">
    <!--<link rel="icon" href="../../favicon.ico">-->
     <%@include file="../common/common.jsp" %>
     <script src="<%=baseUrl %>/smoothwheel/js/jquery-ui-1.10.3.custom.min.js" type="text/javascript"></script>
     <script src="<%=baseUrl %>/smoothwheel/js/jquery.kinetic.min.js" type="text/javascript"></script>
     <script src="<%=baseUrl %>/smoothwheel/js/jquery.mousewheel.min.js" type="text/javascript"></script>
     <script src="<%=baseUrl %>/smoothwheel/js/jquery.smoothdivscroll-1.3-min.js" type="text/javascript"></script>
     <link href="<%=baseUrl%>/smoothwheel/css/smoothDivScroll.css" rel="stylesheet">
     <%
        request.setCharacterEncoding("utf-8");
       User user = (User)request.getSession().getAttribute("user");
       String id = null;
      if(user!=null)
      {
    	  id  = user.getUserid();
      }
     String username="";  
     String password = "";  
     Cookie[] cookies = request.getCookies();  
     if(cookies!=null&&cookies.length>0)  
     {  
          for(Cookie c:cookies)  
          {  
             if(c.getName().equals("username"))  
             {  
                  username =  URLDecoder.decode(c.getValue(),"utf-8");  
             }  
             if(c.getName().equals("password"))  
             {  
                  password =  URLDecoder.decode(c.getValue(),"utf-8");  
             }  
          }  
     } 
     %>
 
     <style type="text/css">
.authorbox1 {
	padding-top: 15px;
	padding-bottom: 15px;
	padding-left: 15px;
	padding-right: 15px;
	border: solid;
	border-width: 1px;
	border-color: #fcfcfc;
	background-color: #fcfcfc;
}

#makeMeScrollable {
	width: 100%;
	/* height: 300px; */
	position: relative;
}
#makeMeScrollable div.scrollableArea div.media {
	position: relative;
	float: left;
	margin: 0;
	-webkit-user-select: none;
	-khtml-user-select: none;
	-moz-user-select: none;
	-o-user-select: none;
	user-select: none;
}
</style>
     <script type="text/javascript">
     var id = "<%=id%>";
      $(function(){
    	  getReommdUser();
    	 if(id!="null")
    		 {
    			var url = baseUrl+"/getUserInfoById.do";
   	 		 $.ajax({
   	 			type : "POST",
   	 			data:{
   	 				"id":id
   	 			},
   	 			dataType : "json",
   	 			url : url,
   	 			success : function(data) {
   	 				var rdata = data.data;
   	 			$("#reuserid").val(rdata.userid);
   	 				var imgurl = baseUrl+"/getheadpic_"+encodeURI(encodeURI(rdata.userid))+".do"
   	 			    $("#headpicinfo").attr("src",imgurl);
   	 			    $("#nameinfo").html(rdata.userid);
   	 			    $("#infobox").show();
   	 			    $("#loginbox").hide();
   	 			}
   	 		  });
    		 }
      });
/**
 * 登陆
 */
      function login()
      {
	      var ind = "";
    	  if($("#password").val()=="")
			{
    		  ind = "*请输入密码*";
			}
			if($("#userid").val()=="")
				{
				ind = "*请输入用户名*";
				}
			if(ind!="")
				{
				$("#tipsinto").html(ind);
				return ;
				}
    	  var cond=document.getElementById("realrememberme");
    	  var url = baseUrl+"/login.do";
    	   $.ajax({
 	 			type : "POST",
 	 			data:{
 	 				"userid":$("#userid").val(),
 	 				"password":$("#password").val(),
 	 				"rememberme":cond.checked
 	 			},
 	 			dataType : "json",
 	 			url : url,
 	 			success : function(data) {
 	 				if(data.info=="success")
 	 					{
 	 					  window.location.reload();
 	 					}else
 	 						{
 	 						$("#tipsinto").html(data.info);
 	 						}
 	 			}
 	 		  }); 
      }
      
      function toUpdataUser()
      {
    	  var manid = $("#reuserid").val();
    	  window.location.href = baseUrl+"/toUpdataUser.do?id="+encodeURI(encodeURI(manid));;
      }
/**
 * 登出
 */
      function logout()
      {
    	  var url = baseUrl+"/logout.do";
    	  $.ajax({
	 			type : "POST",
	 			data:{
	 			},
	 			dataType : "json",
	 			url : url,
	 			success : function(data) {
	 				window.location.reload();
	 			}
	 		  }); 
      }
      
      
      function getReommdUser()
      {
    	  var url = baseUrl+"/getReommdUser.do";
    	  $.ajax({
	 			type : "POST",
	 			data:{
	 			},
	 			dataType : "json",
	 			url : url,
	 			success : function(data) {
	 				var str = "";
	 				for(var n = 0;n<data.length;n++)
	 					{
	 					 var imgurl;
						if(data[n].headportrait!=""&&data[n].headportrait!=null)
							{
							imgurl = baseUrl+"/getheadpic_"+encodeURI(encodeURI(data[n].userid))+".do";
							}else
								{
								imgurl = baseUrl+"/img/kbtx.jpg";
								}
	 					str = str+"<div class=\"media authorbox1\">"+
		 				 " <div class=\"media-left\">"+
		 				    "<a >"+
		 				      "<img src=\""+imgurl+"\" style=\"height: 150px;\">"+
		 				    "</a>"+
		 				  "</div>"+
		 				  "<div class=\"media-body\">"+
		 				   "<p class=\"authorword\">"+
		 				  data[n].distribe+         
		 					"</p>"+
		 					"<p><a class=\"btn btn-default\" href=\""+baseUrl+"/"+encodeURI(encodeURI(data[n].userid))+"/productInit.do\" role=\"button\" style=\"float: right;\">详细信息 &raquo;</a></p>"+
		 				  "</div>"+
		 				"</div>"; 
	 					}
	 				 $("#makeMeScrollable").html(str);
	 				  $(".media").css("max-width",$("#makeMeScrollable").width());
	 			   $("div#makeMeScrollable").smoothDivScroll({
	 						autoScrollingMode: "onStart",
	 						autoScrollInterval:30
	 					});   
	 			}
	 		  }); 
      }
      function toproduct()
      {
    	  var url = baseUrl+"/"+encodeURI(encodeURI(id))+"/productInit.do";
    	  window.location.href = url;
      }
     </script>
    <title>大书法</title>
  </head>

  <body style="margin: 0px;padding: 0px;background-color: #fff;">
<input type="hidden" id="reuserid"> 
    <div class="container">
      <!-- The justified navigation menu is meant for single line per list item.
           Multiple lines will require custom code not provided by Bootstrap. -->
      <div class="masthead">
        <div style="height: 30px;">
        <h3 class="text-muted"><span style=" font-family:'dj';float: left ;">大书法</span></h3>
        <a href="<%=baseUrl%>/regestinit.do" style="float: right;">加入我们成为会员吧</a>
        </div>
        <nav>
          <ul class="nav nav-justified">
            <li class="active">
              <a href="<%=baseUrl%>/homeinit.do">首页</a></li>
            <li><a href="<%=baseUrl%>/recommedproduct.do">推荐作品</a></li>
            <li><a href="<%=baseUrl%>/toAuthor.do">书法家</a></li>
            <li><a href="<%=baseUrl%>/undo.do">书法论坛</a></li>
          </ul>
        </nav>
      </div>

      <!-- Jumbotron -->
      <div class="jumbotron">
       <!-- <h1><span style="font-family:'dj'">天道酬勤</span></h1>-->
	   <img src="img/zi.jpg" class="img-responsive" style="display:inline">
        <p class="lead"></p>
        <p><a class="btn btn-lg btn-success" href="<%=baseUrl%>/recommedproduct.do" role="button" style="background-color:#990000; border-color:#660000">作品推荐</a></p>
      </div>
<div style="clear:both"></div>
      <!-- Example row of columns -->
      <div class="row">
      
      
       <!-- 书法家 -->
        <div class="col-lg-4">
          <h2 class="djtitle">书法家</h2>
         
         <div  id="makeMeScrollable">
          <!-- <div class="media authorbox1">
			  <div class="media-left">
			    <a href="#">
			      <img src="./img/tx.jpg" style="height: 150px;">
			    </a>
			  </div>
			  <div class="media-body">
			   <p class="authorword">
			                    张大千2（Chang
								Dai-Chien），男，四川内江人，祖籍广东省番禺，1899年5月10日出生于四川省内江市中区城郊安良里的一个书香门第的家庭，中国泼墨画家，书法家。
							</p>
				<p><a class="btn btn-default" href="#" role="button" style="float: right;">详细信息 &raquo;</a></p>
			  </div>
			</div>
			
			   <div class="media authorbox1">
			  <div class="media-left">
			    <a href="#">
			      <img src="./img/tx.jpg" style="height: 150px;">
			    </a>
			  </div>
			  <div class="media-body">
			   <p class="authorword">张大千3（Chang
								Dai-Chien），男，四川内江人，祖籍广东省番禺，1899年5月10日出生于四川省内江市中区城郊安良里的一个书香门第的家庭，中国泼墨画家，书法家。
							</p>
				<p><a class="btn btn-default" href="#" role="button" style="float: right;">详细信息 &raquo;</a></p>
			  </div>
			</div>
			
			  <div class="media authorbox1">
			  <div class="media-left">
			    <a href="#">
			      <img src="./img/tx.jpg" style="height: 150px;">
			    </a>
			  </div>
			  <div class="media-body">
			   <p class="authorword">张大千（Chang
								Dai-Chien），男，四川内江人，祖籍广东省番禺，1899年5月10日出生于四川省内江市中区城郊安良里的一个书香门第的家庭，中国泼墨画家，书法家。
							</p>
				<p><a class="btn btn-default" href="#" role="button" style="float: right;">详细信息 &raquo;</a></p>
			  </div>
			</div> -->
			</div> 
		
				
       </div>
       
       
       
       <!-- 书法家 -->
       
       
       <!-- 书法论坛 -->
        <div class="col-lg-4">
          <h2 class="djtitle">书法论坛</h2>
          <div class="media">
			  <div class="media-left">
			    <a href="#">
			      <img class="media-object" src="<%=baseUrl %>/img/tdrh.jpg" alt="论坛">
			    </a>
			  </div>
			  <div class="media-body">
			    <h4 class="media-heading" style="font-weight: bold;">和大家一起分享你的创作经验吧！</h4>
			      <p>
                                                                       书法是指按照文字特点及其涵义，以其书体笔法、结构和章法书写，使之成为富有美感的艺术作品。汉字书法为汉族独创的表现艺术，被誉为：无言的诗，无行的舞；无图的画，无声的乐。
			      </p>
			  </div>
          </div>
          <div style="clear: both;"></div>
         <!--  <p>论坛，全称为Bulletin Board System（电子公告板）或者Bulletin Board Service（公告板服务），是Internet上的一种电子信息服务系统。它提供一块公共电子白板，每个用户都可以在上面书写，可发布信息或提出看法。它是一种交互性强，内容丰富而及时的Internet电子信息服务系统，用户在BBS站点上可以获得各种信息服务、发布信息、进行讨论、聊天等等。</p> -->
          <p><a class="btn btn-default" href="<%=baseUrl%>/undo.do" role="button">进入论坛 &raquo;</a></p>
        </div>
		 <!-- 书法论坛 -->
		 
		 <!-- 用户信息 -->
		 <div class="col-lg-4">
          <h2 class="djtitle">登陆<span class="intoredword" id="tipsinto"></span></h2> 
				<div class="panel panel-default" style="display: none;" id="infobox"><!-- panel-primary -->
					<div class="panel-heading">
					   <span class="glyphicon glyphicon-user" aria-hidden="true"></span>
					   <span style="font-weight: bold;">&nbsp;&nbsp;我的账号</span>
					    <a  style="float: right;cursor: pointer;" onclick="logout()">退出</a>
					   </div>
					<div class="panel-body">
						<div style=" float: left; border: solid; color: white;width: 52%">
						  <p><span class="systemword">欢迎再次光临!&nbsp;&nbsp;</span><span style="color: black; font-weight:bold;" id="nameinfo"></span></p>
                               <p><a href="#">我的消息: <span class="badge">0</span></a></p>
                               <p>
                                 <button class="btn  btn-primary " type="submit" onclick="toproduct()">进入我的作品集</button>
                               </p>
                                 <hr>
                                <a href="<%=baseUrl %>/changePasswordInit.do" style="font-size: 12px;">修改密码</a>|<a  style="font-size: 12px;cursor: pointer;" onclick="toUpdataUser()">修改个人信息</a>
                                
						</div>
						<div style=" float: left;width: 48%">
							<div class="thumbnail" style="margin-bottom: 0px;">
								<img src="" class="img-responsive" style="max-height:160px;max-height: 170px; " id="headpicinfo"> 
							</div>
						</div>
					</div>
				</div>
				<!-- 用户已经登陆 -->
				    <div class="form-signin" id="loginbox">
        <label for="inputEmail" class="sr-only">用户名</label>
        <input type="text" id="userid" class="form-control" placeholder="用户名/邮箱" required autofocus value="<%=username%>">
        <label for="inputPassword" class="sr-only">密码</label>
        <input type="password" id="password" class="form-control" placeholder="密码" required  value="<%=password%>">
      
        <div class="checkbox">
          <label>
            <input type="checkbox"  id="realrememberme" checked="checked"> 记住我
          </label>
        </div>
        <button class="btn btn-lg btn-primary btn-block" type="submit" onclick="login()">登陆</button>
      </div>
				
				
				
			</div>
			<!-- 用户信息 -->
			
      </div>
 <div style="clear: both;"></div>
      <!-- Site footer -->
      <footer class="footer">
        <p>&copy; Company 2015</p>
      </footer>

    </div> <!-- /container -->

  </body>
</html>


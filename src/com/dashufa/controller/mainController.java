package com.dashufa.controller;

import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.net.URLDecoder;
import java.net.URLEncoder;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.dashufa.common.JsonUtil;
import com.dashufa.entity.Album;
import com.dashufa.entity.Product;
import com.dashufa.entity.User;
import com.dashufa.service.mainService;

@Controller
public class mainController {
    @Autowired 
    private HttpServletRequest request;
    @Autowired
    private mainService mainservice;
    @RequestMapping("/register.do")
    public void register(User user,@RequestParam("headpicinputs")MultipartFile headpicinputs,HttpServletResponse response) throws ParseException, IOException
    {
    	
    	String str = user.getShowbrontime();
    	if(str!=null&&!("".equals(str)))
    	{
    		 SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
    		 Date date = sdf.parse(user.getShowbrontime());
    		 user.setBrontime(date);
    	}
    	if(headpicinputs!=null)
    	{
    		byte[] real = headpicinputs.getBytes();
    		user.setHeadportrait(real);
    	}
    	request.getSession().setAttribute("user", user);
    	mainservice.saveUser(user);
    	String id = user.getUserid();
    	JsonUtil.ObjectToJson(response,"id",id);
    	/*ModelAndView mo = new ModelAndView();
    	mo.addObject("id", id);
    	mo.setViewName("home");
    	return mo;*/
    	
    }
    @RequestMapping("/updateUserInfo.do")
    public void updateUserInfo(User user,@RequestParam("headpicinputs")MultipartFile headpicinputs,HttpServletResponse response) throws ParseException, IOException
    {
    	String str = user.getShowbrontime();
    	if(str!=null&&!("".equals(str)))
    	{
    		 SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
    		 Date date = sdf.parse(user.getShowbrontime());
    		 user.setBrontime(date);
    	}
    	if(headpicinputs!=null&&!("".equals(headpicinputs)))
    	{
    		byte[] real = headpicinputs.getBytes();
    		if(real.length!=0)
    		{
    			user.setHeadportrait(real);
    		}
    		
    	}
    	mainservice.updateUser(user);
    	JsonUtil.ObjectToJson(response,"id",user.getUserid());
    }
    @RequestMapping("/logout.do")
    public void logout(HttpServletResponse response) throws IOException
    {
    	request.getSession().invalidate();
    	JsonUtil.ObjectToJson(response, "success");
    }
    @RequestMapping("/getReommdUser.do")
    public void getReommdUser(HttpServletResponse response) throws IOException
    {
    	List<User> list = mainservice.getReommdUser();
    	JsonUtil.ObjectToJson(response, list);
    }
    
    @RequestMapping("/getPagination.do")
    public void getPagination(String flag,String classfiy,HttpServletResponse response) throws IOException
    {
    	int total  = mainservice.getPagination(flag,classfiy);
    	JsonUtil.ObjectToJson(response, total);
    }
    @RequestMapping("/getPaginationforreproduct.do")
    public void getPaginationforreproduct(HttpServletResponse response) throws IOException
    {
    	int total  = mainservice.getPaginationforreproduct();
    	JsonUtil.ObjectToJson(response, total);
    }
    
    @RequestMapping("/checkUserName.do")
    public void checkUserName(HttpServletResponse response,String id) throws IOException
    {
    	Map<String,String> map = new HashMap<String, String>();
    	User olduser = mainservice.getUserById(id);
    	if(olduser!=null)
    	{
    		 map.put("success", "notone");
        	 JsonUtil.ObjectToJson(response, map);
    	}else
    	{ 
    		 
        	 map.put("success", "success");
        	 JsonUtil.ObjectToJson(response,map);
    	}
    }
    @RequestMapping("/homeinit.do")
    public ModelAndView homeinit(HttpServletResponse response)
    {
    	ModelAndView mav = new ModelAndView();
        mav.setViewName("home");
        return mav;
    }
    @RequestMapping("/createAlbumInit.do")
    public ModelAndView createAlbumInit(HttpServletResponse response)
    {
    	ModelAndView mav = new ModelAndView();
        mav.setViewName("createAlbum");
        return mav;
    }
    @RequestMapping("/toAuthor.do")
    public ModelAndView toAuthor(HttpServletResponse response)
    {
    	ModelAndView mav = new ModelAndView();
        mav.setViewName("author");
        return mav;
    }
    @RequestMapping("/toUpdataUser.do")
    public ModelAndView toUpdataUser(@RequestParam("id") String id,HttpServletResponse response) throws UnsupportedEncodingException
    {
    	ModelAndView mav = new ModelAndView();
    	mav.addObject("id", URLDecoder.decode(id,"UTF-8"));
        mav.setViewName("updateUser");
        return mav;
    }
    @RequestMapping("/regestinit.do")
    public ModelAndView regestinit(HttpServletResponse response)
    {
    	ModelAndView mav = new ModelAndView();
        mav.setViewName("signin");
        return mav;
    }
    @RequestMapping("/getUerInfo.do")
    public void getUerInfo(String flag,HttpServletResponse response) throws IOException
    {
    	List<User> list = mainservice.getUerInfoflag(flag);
    	JsonUtil.ObjectToJson(response,list);
    }
   /* @RequestMapping("/pagination.do")
    public void pagination(HttpServletResponse response) throws IOException
    {
    	= mainservice.pagination();
    	JsonUtil.ObjectToJson(response,list);
    }*/
    /*@RequestMapping("/addPic.do")
    public ModelAndView addPic(HttpServletResponse response)
    {
    	ModelAndView mav = new ModelAndView();
        mav.setViewName("addPic");
        request.getSession().setAttribute("num", UUID.randomUUID().toString());
        return mav;
    }*/
    @RequestMapping("/getUserInfoById.do")
    public void getUserInfoById(String id,HttpServletResponse response) throws IOException
    {
    	User user = mainservice.getUserById(id);
    	JsonUtil.ObjectToJson(response, "data", user);
    	
    }
    @RequestMapping("/getheadpic_{userid}.do")
    public void getheadpic(HttpServletResponse response,@PathVariable("userid") String userid) throws IOException
    {
    	String id = URLDecoder.decode(userid, "UTF-8");
    	User user = mainservice.getUserById(id);
    	if(user.getHeadportrait()!=null)
    	{
    		response.getOutputStream().write(user.getHeadportrait());;
    	}
    }
    
    
    @RequestMapping("/{id}/getPicByProductId.do")
    public void getPicByProductId(HttpServletResponse response,@PathVariable String id) throws IOException
    {
    	request.setCharacterEncoding("utf-8");
    	Product product = mainservice.getPicByProductId(id);
    	if(product!=null)
    	{
    		response.getOutputStream().write(product.getProduct());;
    	}
    }
    @RequestMapping("/login.do")
    public void login(HttpServletResponse rep,String userid,String password,String rememberme) throws IOException
    {
    	 request.setCharacterEncoding("utf-8"); 
    	Map<String,String> map = new HashMap<String,String>();
    	String info = "";
    	User user = mainservice.getUserById(userid);
    	
    	if(user==null)
    	{
    		info = "*用户名不存在*";
    	}else if(!(user.getPassword().equals(password)))
    	{
    		info = "*密码输入错误*";
    	}else
    	{
    		info  = "success";
    		map.put("id", user.getUserid());
    		/*设置cookies*/
    		if("true".equals(rememberme))
        	{
                //把用户名和密码保存在Cookie对象里面  
                String rusername = URLEncoder.encode(userid,"utf-8");  
                //使用URLEncoder解决无法在Cookie当中保存中文字符串问题  
                String rpassword = URLEncoder.encode(password,"utf-8");  
                  
                Cookie usernameCookie = new Cookie("username",rusername);  
                Cookie passwordCookie = new Cookie("password",rpassword);  
                usernameCookie.setMaxAge(864000);  
                passwordCookie.setMaxAge(864000);//设置最大生存期限为10天  
                rep.addCookie(usernameCookie);  
                rep.addCookie(passwordCookie);  
        	}else
        	{
                Cookie[] cookies = request.getCookies();  
                if(cookies!=null&&cookies.length>0)  
                {  
                   for(Cookie c:cookies)  
                   {  
                      if(c.getName().equals("username")||c.getName().equals("password"))  
                      {  
                          c.setMaxAge(0); //设置Cookie失效  
                          rep.addCookie(c); //重新保存。  
                      }  
                   }  
                }  
        	}
    	}
    	request.getSession().setAttribute("user", user);
    	map.put("info", info);
    
    	JsonUtil.ObjectToJson(rep, map);
    }
    @RequestMapping("/changePasswordInit.do")
    public ModelAndView changePasswordInit(String password,HttpServletResponse rep)
    {
    	User user = (User) request.getSession().getAttribute("user");
    	ModelAndView mav = new ModelAndView();
    	mav.addObject("password",user.getPassword());
        mav.setViewName("changePassword");
        return mav;
    }
    
    @RequestMapping("/getrecProductInfo.do")
    public void getrecProductInfo(String pagenum,HttpServletResponse rep) throws IOException
    {
    	List<Product> list = mainservice.getrecProductInfo(pagenum);
    	JsonUtil.ObjectToJson(rep, list);
    }
    
    @RequestMapping("/{id}/toShowPic.do")
    public ModelAndView toShowPic(@PathVariable String id,HttpServletResponse rep) throws IOException
    {
    	ModelAndView mav = new ModelAndView();
    	mav.addObject("id",id);
        mav.setViewName("showOneProduct");
        return mav;
    }
    @RequestMapping("/changePassword.do")
    public void changePassword(String password,HttpServletResponse rep) throws IOException
    {
    	User user = (User) request.getSession().getAttribute("user");
    	mainservice.changePassword(user.getUserid(),password);
    	//清除session
    	request.getSession().invalidate();
    	JsonUtil.ObjectToJson(rep, "success");
    }
    @RequestMapping("/{id}/productInit.do")
    public ModelAndView productInit(@PathVariable  String id,HttpServletResponse rep) throws UnsupportedEncodingException
    {
    	User user = (User) request.getSession().getAttribute("user");
    	ModelAndView mav = new ModelAndView();
        mav.setViewName("album");
        mav.addObject("userid", URLDecoder.decode(id, "UTF-8"));
        String userid = null;
        if(user!=null)
        {
        	userid = user.getUserid();
        }
        mav.addObject("nowuser",userid);
        return mav;
    }
    @RequestMapping("/{id}/{num}/imgsupload.do")
    public  void  imgsupload(@RequestParam("file")MultipartFile file,@PathVariable String id,@PathVariable String num,HttpServletResponse rep) throws IOException
    {
    	
    	User user = (User) request.getSession().getAttribute("user");
    	Date date = new Date();
    	Product product = new Product();
    	product.setProduct(file.getBytes());
    	product.setProductid(UUID.randomUUID().toString());
    	product.setUploaddate(date);
    	product.setUserid(user.getUserid());
    	product.setUploadNum(num);
    	product.setAlbumid(id);
    	
    	/*request.getSession().removeAttribute("num");*/
    	mainservice.saveProduct(product);
    	JsonUtil.ObjectToJson(rep, "success");
    }
    @RequestMapping("/getRecentPic.do")
    public void getRecentPic(HttpServletResponse rep,String num) throws IOException
    {
    	User user = (User) request.getSession().getAttribute("user");
    	List<String>list = mainservice.getRecentPic(user.getUserid(),num);
    	JsonUtil.ObjectToJson(rep, list);
    }
    @RequestMapping("/getUserByProductId.do") 
    public void getUserByProductId(HttpServletResponse rep,String id) throws IOException
    {
    	User user = mainservice.getUserByProductId(id);
    	JsonUtil.ObjectToJson(rep, user);
    }
    @RequestMapping("/undo.do")
    public ModelAndView undo(HttpServletResponse rep) throws IOException
    {
    	ModelAndView mav = new ModelAndView();
        mav.setViewName("undo");
        return mav;
    }
    @RequestMapping("/{id}/{num}/addDiscribe.do")
    public ModelAndView addDiscribe(HttpServletResponse rep,@PathVariable String num,@PathVariable String id)
    {
    	ModelAndView mo = new ModelAndView();
    	mo.addObject("num", num);
    	mo.addObject("albumid", id);
    	mo.setViewName("addDiscribe");
    	return mo;
    }
    @RequestMapping("/recommedproduct.do")
    public ModelAndView recommedproduct(HttpServletResponse rep)
    {
    	ModelAndView mo = new ModelAndView();
    	mo.setViewName("recommedproduct");
    	return mo;
    }
    @RequestMapping("/{id}/realproductInit.do")
    public ModelAndView realproductInit(HttpServletResponse rep,@PathVariable String id,@RequestParam("showflag") boolean showflag)
    {
    	ModelAndView mo = new ModelAndView();
    	mo.addObject("id", id);
    	mo.addObject("showflag", showflag);
    	mo.setViewName("product");
    	return mo;
    }
    @RequestMapping("/saveComment.do")
    public void saveComment(String id,String allcomment,String name,String comment,HttpServletResponse rep) throws IOException
    {
    	mainservice.saveComment(id,allcomment,name,comment);
    	JsonUtil.ObjectToJson(rep, "success");
    }
    @RequestMapping("/createAlbum.do")
    public ModelAndView createAlbum(HttpServletResponse rep)
    {
    	ModelAndView mo = new ModelAndView();
    	mo.setViewName("createAlbum");
    	return mo;
    }
    @RequestMapping("/saveAlbum.do")
    public void saveAlbum(Album album,HttpServletResponse rep) throws IOException
    {
    	User user = (User) request.getSession().getAttribute("user");
    	album.setAlbumid(UUID.randomUUID().toString());
    	album.setUserid(user.getUserid());
    	album.setCreateDate(new Date());
    	mainservice.saveAlbum(album);
    	JsonUtil.ObjectToJson(rep, "success");
    	
    }
    @RequestMapping("/getClassfiy.do")
    public void getClassfiy(String userid,HttpServletResponse rep) throws IOException 
    {
    	List<String> list = mainservice.getClassfiy(userid);
    	JsonUtil.ObjectToJson(rep, list);
    }
    @RequestMapping("/getAlbumInfo.do")
    public void getAlbumInfo(String userid,String classfy,HttpServletResponse rep) throws IOException 
    {
    	List<Album> list = mainservice.getAlbumInfo(userid,classfy);
    	
    	JsonUtil.ObjectToJson(rep, list);
    }
    @RequestMapping("/showProduct.do")
    public void showProduct(String id,HttpServletResponse rep) throws IOException 
    {
    	List<Product> list = mainservice.showProduct(id);
    	
    	JsonUtil.ObjectToJson(rep, list);
    }
    
    @RequestMapping("/{id}/addNewPic.do")
    public ModelAndView addNewPic(HttpServletResponse rep,@PathVariable String id)
    {
    	ModelAndView mo = new ModelAndView();
    	mo.addObject("id", id);
    	String num = UUID.randomUUID().toString();
    	mo.addObject("num", num);
    	mo.setViewName("addPic");
    	return mo;
    }
    @RequestMapping("/getProductById.do")
    public void getProductById(HttpServletResponse rep,String id) throws IOException
    {
    	Product pdc = mainservice.getProductById(id);
    	JsonUtil.ObjectToJson(rep, pdc);
    }
    @RequestMapping("/getmainUerInfo.do")
    public void getmainUerInfo(String flag ,String classfiy,String pagenum,HttpServletResponse rep) throws IOException 
    {
    	List<User> list = mainservice.getmainUerInfo(flag,classfiy,pagenum);
    	JsonUtil.ObjectToJson(rep, list);
    }
    
	public HttpServletRequest getRequest() {
		return request;
	}

	public void setRequest(HttpServletRequest request) {
		this.request = request;
	}


	public mainService getMainservice() {
		return mainservice;
	}


	public void setMainservice(mainService mainservice) {
		this.mainservice = mainservice;
	}
    
}

package com.dashufa.serviceImpl;

import java.text.SimpleDateFormat;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.dashufa.dao.mainDao;
import com.dashufa.entity.Album;
import com.dashufa.entity.Product;
import com.dashufa.entity.User;
import com.dashufa.service.mainService;

public class mainServiceImpl implements mainService{
   private mainDao maindao;

public mainDao getMaindao() {
	return maindao;
}

public void setMaindao(mainDao maindao) {
	this.maindao = maindao;
}

@Override
public void saveUser(User user) {
	maindao.saveUser(user);
}

@Override
public User getUserById(String userid) {
	User user = maindao.getUserById(userid);
	return user;
}

@Override
public void changePassword(String userid, String password) {
	maindao.changePassword(userid,password);
}

@Override
public void saveProduct(Product product) {
	/*maindao.updateIsNew(product.getUserid());*/
	maindao.saveProduct(product);
}

@Override
public List<String> getRecentPic(String userid,String num) {
	return maindao.getRecentPic(userid,num);
}

@Override
public Product getPicByProductId(String id) {
	return maindao.getPicByProductId(id);
}

@Override
public void saveComment(String id, String allcomment, String name,String comment) {
   String[] ids =  id.trim().split(",");
   String[] comments = comment.trim().split(",");
   String[] names = name.trim().split(",");
   
   for(int n = 0;n<ids.length;n++)
   {
	   String temp = ids[n];
	   Product product = new Product();
	   product.setProductid(temp);
	   if(names.length!=0)
	   {
		   product.setProductName(names[n]);
	   }
	   if(comments.length!=0)
	   {
		   product.setDescription(comments[n]);
	   }else
	   {
		   product.setDescription(allcomment);
	   }
	   maindao.saveComment(product);
   }
   
}

@Override
public void saveAlbum(Album album) {
	maindao.saveAlbum(album);
}

@Override
public List<String> getClassfiy(String userid) {
	List<String> list  = maindao.getClassfiy(userid);
	return list;
}

@Override
public List<Album> getAlbumInfo(String userid, String classfy) {
	List<Album> list = maindao.getAlbumInfo(userid,classfy);
	for(Album temp:list)
	{
		String id  = maindao.getOnePic(temp.getAlbumid(),userid);
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy年MM月dd日");
		temp.setShowDate(sdf.format(temp.getCreateDate()));
		temp.setPicid(id);
	}
	return list;
}

@Override
public List<Product> showProduct(String id) {
	List<Product>  list = maindao.showProduct(id);
	return list;
}

@Override
public List<User> getUerInfoflag(String flag) {
	List<User>  list = maindao.getUerInfoflag(flag);
	return list;
}

@Override
public int getPagination(String flag, String classfiy) {
	Map<String,String> map = new HashMap<String,String>();
	map.put("flag", flag);
	map.put("classfiy", classfiy);
	Integer n = maindao.getPagination(map);
	int result ;
	int yeshu  = n/6;
	if(n%6 == 0)
	{
		result = yeshu;
	}else
	{
		result = yeshu+1;
	}
	return result;
}

@Override
public List<User> getmainUerInfo(String flag, String classfiy, String pagenum) {
	Map<String,Object> map = new HashMap<String, Object>();
	map.put("flag", flag);
	map.put("classfiy", classfiy);
	Integer from;
	Integer to;
	from = (Integer.parseInt(pagenum)-1)*6;
	to = Integer.parseInt(pagenum)*6;
	map.put("from", from);
	map.put("to", to);
	List<User> list = maindao.getmainUerInfo(map);
	return list;
}

@Override
public int getPaginationforreproduct() {
	Integer n = maindao.getPaginationforreproduct();
	int result ;
	int yeshu  = n/6;
	if(n%6 == 0)
	{
		result = yeshu;
	}else
	{
		result = yeshu+1;
	}
	return result;
}

@Override
public List<Product> getrecProductInfo(String pagenum) {
	Map<String,Object> map = new HashMap<String, Object>();
	Integer from = (Integer.parseInt(pagenum)-1)*6;
	map.put("pagenum", pagenum);
	map.put("from", from);
	List<Product> list = maindao.getrecProductInfo(map);
	return list;
}

@Override
public Product getProductById(String getProductById) {
	Product pdc = maindao.getProductById(getProductById);
	return pdc;
}

@Override
public List<User> getReommdUser() {
	List<User> pdc = maindao.getReommdUser();
	return pdc;
}

@Override
public User getUserByProductId(String id) {
	User user = maindao.getUserByProductId(id);
	return user;
}

@Override
public void updateUser(User user) {
	maindao.updateUser(user);
}



   
}

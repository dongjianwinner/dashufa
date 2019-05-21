package com.dashufa.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;

import com.dashufa.entity.Album;
import com.dashufa.entity.Product;
import com.dashufa.entity.User;

public class mainDao {
   private SqlSession sqlSession;

public SqlSession getSqlSession() {
	return sqlSession;
}

public void setSqlSession(SqlSession sqlSession) {
	this.sqlSession = sqlSession;
}

public void saveUser(User user) {
	sqlSession.insert("com.dashufa.main.saveUser",user);	
}

public User getUserById(String userid) {
	Map<String,String> map = new HashMap<String, String>();
	map.put("id", userid);
	User user = sqlSession.selectOne("com.dashufa.main.getUserById",map);
	return user;
}

public void changePassword(String userid, String password) {
	Map<String,String> map = new HashMap<String, String>();
	map.put("id", userid);
	map.put("password", password);
	sqlSession.update("com.dashufa.main.changePassword",map);
}

public void saveProduct(Product product) {
	sqlSession.insert("com.dashufa.main.saveProduct",product);	
}

public List<String> getRecentPic(String userid,String num) {
	Map<String,String> map = new HashMap<String, String>();
	map.put("id", userid);
	map.put("num", num);
	List<String> list = sqlSession.selectList("com.dashufa.main.getRecentPic",map);
	return list;
}

public Product getPicByProductId(String id) {
	Map<String,String> map = new HashMap<String, String>();
	map.put("id", id);
	Product product = sqlSession.selectOne("com.dashufa.main.getPicByProductId",map);
	return product;
}

public void saveComment(Product product) {
	sqlSession.update("com.dashufa.main.saveComment",product);
}

public void saveAlbum(Album album) {
	sqlSession.insert("com.dashufa.main.saveAlbum",album);
}

public List<String> getClassfiy(String userid) {
	Map<String,String> map = new HashMap<String, String>();
	map.put("userid", userid);
	List<String> list = sqlSession.selectList("com.dashufa.main.getClassfiy",map);
	return  list;
}

public List<Album> getAlbumInfo(String userid, String classfy) {
	Map<String,String> map = new HashMap<String, String>();
	map.put("userid", userid);
	map.put("classfy", classfy);
	List<Album> list = sqlSession.selectList("com.dashufa.main.getAlbumInfo",map);
	return list;
}

public String getOnePic(String albumid, String userid) {
	Map<String,String> map = new HashMap<String, String>();
	map.put("id", albumid);
	map.put("userid", userid);
	String id = sqlSession.selectOne("com.dashufa.main.getOnePic",map);
	return id;
}

public List<Product> showProduct(String id) {
	Map<String,String> map = new HashMap<String, String>();
	map.put("id", id);
	List<Product>  list = sqlSession.selectList("com.dashufa.main.showProduct",map);
	return list;
}

public List<User> getUerInfoflag(String flag) {
	/*Map<String,String> map = new HashMap<String, String>();
	map.put("flag", flag);
	List<User>  list = sqlSession.selectList("com.dashufa.main.getUerInfoflag",map);
	return list;*/
	return null;
}

public Integer getPagination(Map<String, String> map) {
	Integer n = sqlSession.selectOne("com.dashufa.main.getPagination",map);
	return n;
}

public List<User> getmainUerInfo(Map<String,Object> map) {
	List<User> list = sqlSession.selectList("com.dashufa.main.getmainUerInfo",map);
	return list;
}

public Integer getPaginationforreproduct() {
	Integer n = sqlSession.selectOne("com.dashufa.main.getPaginationforreproduct");
	return n;
}

public List<Product> getrecProductInfo(Map<String, Object> map) {
	List<Product>  list = sqlSession.selectList("com.dashufa.main.getrecProductInfo",map);
	return list;
}

public Product getProductById(String getProductById) {
	Map<String,String> map = new HashMap<String, String>();
	map.put("id", getProductById);
	Product pdc = sqlSession.selectOne("com.dashufa.main.getProductById",map);
	return pdc;
}

public List<User> getReommdUser() {
	List<User>  list = sqlSession.selectList("com.dashufa.main.getReommdUser");
	return list;
}

public User getUserByProductId(String id) {
	Map<String,String> map = new HashMap<String, String>();
	map.put("id", id);
	User user = sqlSession.selectOne("com.dashufa.main.getUserByProductId",map);
	return user;
}

public void updateUser(User user) {
	sqlSession.update("com.dashufa.main.updateUser", user);	
}

/*public void updateIsNew(String userid) {
	Map<String,String> map = new HashMap<String, String>();
	map.put("id", userid);
	sqlSession.update("com.dashufa.main.updateIsNew",map);
	
}*/

   
}

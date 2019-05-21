package com.dashufa.service;

import java.util.List;

import com.dashufa.entity.Album;
import com.dashufa.entity.Product;
import com.dashufa.entity.User;

public interface mainService{
/**
 * 保存user
 * @param user
 */
	public void saveUser(User user);
/**
 * 根据id获得user
 * @param userid
 * @return User
 */
public User getUserById(String userid);
/**
 * 修改密码
 * @param userid
 * @param password
 */
public void changePassword(String userid, String password);
/**
 * 保存作品
 * @param product
 */
public void saveProduct(Product product);
/**
 * 获得最新照片
 * @param userid
 * @param num 
 * @return list
 */
public List<String> getRecentPic(String userid, String num);
/**
 * 获得作品
 * @param id
 * @return Product
 */
public Product getPicByProductId(String id);
/**
 * 保存评论
 * @param id
 * @param allcomment
 * @param name
 * @param comment 
 */
public void saveComment(String id, String allcomment, String name, String comment);
/**
 * 保存相册
 * @param album
 */
public void saveAlbum(Album album);
/**
 * 获得分类
 * @param userid
 */
public List<String> getClassfiy(String userid);
/**
 * 获得相册信息
 * @param userid
 * @param classfy
 * @return
 */
public List<Album> getAlbumInfo(String userid, String classfy);
/**
 * 显示作品
 * @param id
 * @return List<Product>
 */
public List<Product> showProduct(String id);
/**
 * 获得用户信息
 * @param flag
 * @return List<User>
 */
public List<User> getUerInfoflag(String flag);
/**
 * 获得分页
 * @param flag
 * @param classfiy
 * @return int
 */
public int getPagination(String flag, String classfiy);
/**
 * 获得用户信息
 * @param flag
 * @param classfiy
 * @param pagenum
 * @return
 */
public List<User> getmainUerInfo(String flag, String classfiy, String pagenum);
/**
 * 获得推荐作品分页
 * @return int
 */
public int getPaginationforreproduct();
/**
 * 获得推荐作品信息
 * @param pagenum
 * @return List
 */
public List<Product> getrecProductInfo(String pagenum);
/**
 * 获得作品
 * @param getProductById
 * @return Product
 */
public Product getProductById(String getProductById);
/**
 * 获得推荐用户
 * @return User
 */
public List<User> getReommdUser();
/**
 * 根据作品id获得作者信息
 * @param id
 * @return User
 */
public User getUserByProductId(String id);
/**
 * 更新user
 * @param user
 */
public void updateUser(User user);


}

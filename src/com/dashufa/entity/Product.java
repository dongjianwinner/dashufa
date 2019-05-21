package com.dashufa.entity;

import java.util.Date;

public class Product {
	private String productid;
   private String userid;
   private Date uploaddate;
   private byte[] product;
   private String description;
   private Integer recommend;
   private Date recommenddate;
   private String uploadNum;
   private String productName;
   
   private String albumid;
public String getProductid() {
	return productid;
}

public String getAlbumid() {
	return albumid;
}

public void setAlbumid(String albumid) {
	this.albumid = albumid;
}

public String getProductName() {
	return productName;
}

public void setProductName(String productName) {
	this.productName = productName;
}

public void setProductid(String productid) {
	this.productid = productid;
}
public String getUserid() {
	return userid;
}
public void setUserid(String userid) {
	this.userid = userid;
}
public Date getUploaddate() {
	return uploaddate;
}
public void setUploaddate(Date uploaddate) {
	this.uploaddate = uploaddate;
}
public byte[] getProduct() {
	return product;
}
public void setProduct(byte[] product) {
	this.product = product;
}
public String getDescription() {
	return description;
}
public void setDescription(String description) {
	this.description = description;
}
public Integer getRecommend() {
	return recommend;
}
public void setRecommend(Integer recommend) {
	this.recommend = recommend;
}
public Date getRecommenddate() {
	return recommenddate;
}
public void setRecommenddate(Date recommenddate) {
	this.recommenddate = recommenddate;
}
public String getUploadNum() {
	return uploadNum;
}
public void setUploadNum(String uploadNum) {
	this.uploadNum = uploadNum;
}

   
   
   
   
}

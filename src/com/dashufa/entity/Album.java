package com.dashufa.entity;

import java.util.Date;

public class Album {
   private String albumid;
   private String albumname;
   private String description;
   private String classify;
   private String userid;
   private Date createDate;
   
   private String showDate;
   private String picid;
public String getAlbumid() {
	return albumid;
}
public void setAlbumid(String albumid) {
	this.albumid = albumid;
}
public String getAlbumname() {
	return albumname;
}
public void setAlbumname(String albumname) {
	this.albumname = albumname;
}
public String getDescription() {
	return description;
}
public void setDescription(String description) {
	this.description = description;
}
public String getClassify() {
	return classify;
}
public void setClassify(String classify) {
	this.classify = classify;
}
public String getUserid() {
	return userid;
}
public void setUserid(String userid) {
	this.userid = userid;
}
public Date getCreateDate() {
	return createDate;
}
public void setCreateDate(Date createDate) {
	this.createDate = createDate;
}
public String getPicid() {
	return picid;
}
public void setPicid(String picid) {
	this.picid = picid;
}
public String getShowDate() {
	return showDate;
}
public void setShowDate(String showDate) {
	this.showDate = showDate;
}
   
   
}

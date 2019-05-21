package com.dashufa.entity;

import java.util.Date;

public class User {
	 private String id;
    private String userid;
    private String name;
    private String address;
    private String email;
    private String tel;
    private String idcardnum;
    private int age;
    private byte[] headportrait;
    private String sex;
    private String password;
    private Date brontime;
    private String showbrontime;
    private String goodat;
    private String recommend;
    
    private String  distribe;
	public String getUserid() {
		return userid;
	}
	public void setUserid(String userid) {
		this.userid = userid;
	}
	
	public String getRecommend() {
		return recommend;
	}
	public void setRecommend(String recommend) {
		this.recommend = recommend;
	}
	public String getName() {
		return name;
	}
	
	public String getGoodat() {
		return goodat;
	}
	public void setGoodat(String goodat) {
		this.goodat = goodat;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getAddress() {
		return address;
	}
	public void setAddress(String address) {
		this.address = address;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getTel() {
		return tel;
	}
	public void setTel(String tel) {
		this.tel = tel;
	}
	public String getIdcardnum() {
		return idcardnum;
	}
	public void setIdcardnum(String idcardnum) {
		this.idcardnum = idcardnum;
	}
	public int getAge() {
		return age;
	}
	public void setAge(int age) {
		this.age = age;
	}

	public byte[] getHeadportrait() {
		return headportrait;
	}
	public void setHeadportrait(byte[] headportrait) {
		this.headportrait = headportrait;
	}
	public String getSex() {
		return sex;
	}
	public void setSex(String sex) {
		this.sex = sex;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public Date getBrontime() {
		return brontime;
	}
	public void setBrontime(Date brontime) {
		this.brontime = brontime;
	}
	public String getShowbrontime() {
		return showbrontime;
	}
	public void setShowbrontime(String showbrontime) {
		this.showbrontime = showbrontime;
	}
	public String getDistribe() {
		return distribe;
	}
	public void setDistribe(String distribe) {
		this.distribe = distribe;
	}
    
}

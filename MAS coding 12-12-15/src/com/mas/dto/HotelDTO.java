package com.mas.dto;

import java.io.Serializable;

public class HotelDTO implements Serializable {
 int hid;
 String hname;
 String city;
 String street;
 Float charge;
 String mobile;
 String country;
public String getCountry() {
	return country;
}
public void setCountry(String country) {
	this.country = country;
}
public String getMobile() {
	return mobile;
}
public void setMobile(String mobile) {
	this.mobile = mobile;
}
public int getHid() {
	return hid;
}
public void setHid(int hid) {
	this.hid = hid;
}
public String getHname() {
	return hname;
}
public void setHname(String hname) {
	this.hname = hname;
}
public String getCity() {
	return city;
}
public void setCity(String city) {
	this.city = city;
}
public String getStreet() {
	return street;
}
public void setStreet(String street) {
	this.street = street;
}
public Float getCharge() {
	return charge;
}
public void setCharge(Float charge) {
	this.charge = charge;
}

}

package com.northeastern.database.project;

public class SearchRecord {
	int petid;
	int ownerid;
	String petname;
	String ownername;
	long phonenumber;
	String email;
	String pettype;
	String breed;
	String kci;
	long catregno;
	String profession;
	long secondary;
	long fax;
	
	public String getProfession() {
		return profession;
	}
	public void setProfession(String profession) {
		this.profession = profession;
	}
	public int getPetid() {
		return petid;
	}
	public void setPetid(int petid) {
		this.petid = petid;
	}
	public int getOwnerid() {
		return ownerid;
	}
	public void setOwnerid(int ownerid) {
		this.ownerid = ownerid;
	}
	public String getPetname() {
		return petname;
	}
	public void setPetname(String petname) {
		this.petname = petname;
	}
	public String getOwnername() {
		return ownername;
	}
	public void setOwnername(String ownername) {
		this.ownername = ownername;
	}
	public long getPhonenumber() {
		return phonenumber;
	}
	public void setPhonenumber(long phonenumber) {
		this.phonenumber = phonenumber;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getPettype() {
		return pettype;
	}
	public void setPettype(String pettype) {
		this.pettype = pettype;
	}
	public String getBreed() {
		return breed;
	}
	public void setBreed(String breed) {
		this.breed = breed;
	}
	public String getKci() {
		return kci;
	}
	public void setKci(String kci) {
		this.kci = kci;
	}
	public long getCatregno() {
		return catregno;
	}
	public void setCatregno(long catregno) {
		this.catregno = catregno;
	}
	public long getSecondary() {
		return secondary;
	}
	public void setSecondary(long secondary) {
		this.secondary = secondary;
	}
	public long getFax() {
		return fax;
	}
	public void setFax(long fax) {
		this.fax = fax;
	}
}

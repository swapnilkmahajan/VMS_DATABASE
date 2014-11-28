package com.northeastern.database.project;

import java.util.Date;


public class Pet {
	private int ownerid;
	private String owner;
	private String breed;
	private String color;
	private Date dob;
	private String gender;
	private String type;
	
	private boolean insertionsuccessful;
	
	public int getOwnerid() {
		return ownerid;
	}
	public void setOwnerid(int ownerid) {
		this.ownerid = ownerid;
	}
	public String getOwner() {
		return owner;
	}
	public void setOwner(String owner) {
		this.owner = owner;
	}
	public String getBreed() {
		return breed;
	}
	public void setBreed(String breed) {
		this.breed = breed;
	}
	public String getColor() {
		return color;
	}
	public void setColor(String color) {
		this.color = color;
	}
	public Date getDob() {
		return dob;
	}
	public void setDob(Date dob) {
		this.dob = dob;
	}
	public String getGender() {
		return gender;
	}
	public void setGender(String gender) {
		this.gender = gender;
	}
	public String getType() {
		return type;
	}
	public void setType(String type) {
		this.type = type;
	}
	public boolean isPetAddedSuccessfully() {
		// TODO Auto-generated method stub
		return insertionsuccessful;
	}
	public void PetAddedSuccessfully(boolean b){
		insertionsuccessful = b;
	}
	
}

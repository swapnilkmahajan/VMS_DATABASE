package com.northeastern.database.project;

public class PetOwner {
	private String name;
	private String email;
	private String profession;
	private long primaryNumber = 0;
	private long secondaryNumber = 0;
	private long fax = 0;
	
	private boolean insertionOwnerDetails;
	
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getProfession() {
		return profession;
	}
	public void setProfession(String profession) {
		this.profession = profession;
	}
	public long getPrimaryNumber() {
		return primaryNumber;
	}
	public void setPrimaryNumber(long primaryNumber) {
		this.primaryNumber = primaryNumber;
	}
	public long getSecondaryNumber() {
		return secondaryNumber;
	}
	public void setSecondaryNumber(long secondaryNumber) {
		this.secondaryNumber = secondaryNumber;
	}
	public long getFax() {
		return fax;
	}
	public void setFax(long fax) {
		this.fax = fax;
	}
	
	public void setInsertionOwnerDetails(boolean b) {
		// TODO Auto-generated method stub
		insertionOwnerDetails  = b;
	}

	public boolean isOwnerDetailsSuccessful() {
		// TODO Auto-generated method stub
		return insertionOwnerDetails;
	}
	
}

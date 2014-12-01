package com.northeastern.database.project;

public class PetOwner {
	private String name;
	private String email;
	private String profession;
	private long primaryNumber = 0;
	private long secondaryNumber = 0;
	private long fax = 0;
	int id;
	private boolean insertionOwnerDetails;
	private boolean duplicate;
	private boolean insertionError;
	
	private boolean updatesuccess;
	private boolean updateerror;
	
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getEmail() {
		return email;
	}
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
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

	public void setDuplicate(boolean b) {
		// TODO Auto-generated method stub
		duplicate  = b;
	}

	public boolean isDuplicate() {
		// TODO Auto-generated method stub
		return duplicate;
	}

	public void setInsertionError(boolean b) {
		// TODO Auto-generated method stub
		insertionError= b;
	}

	public boolean isInsertionError() {
		// TODO Auto-generated method stub
		return insertionError;
	}
	public boolean isUpdatesuccess() {
		return updatesuccess;
	}
	public void setUpdatesuccess(boolean updatesuccess) {
		this.updatesuccess = updatesuccess;
	}
	public boolean isUpdateerror() {
		return updateerror;
	}
	public void setUpdateerror(boolean updateerror) {
		this.updateerror = updateerror;
	}

}

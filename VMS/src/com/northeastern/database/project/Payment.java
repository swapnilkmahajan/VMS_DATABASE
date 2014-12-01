package com.northeastern.database.project;

public class Payment {
	int paymentid;
	
	public int getPaymentid() {
		return paymentid;
	}
	public void setPaymentid(int paymentid) {
		this.paymentid = paymentid;
	}
	double consultation = 0;
	double deworming = 0;
	double medication = 0;
	double vaccination = 0;
	double other = 0;
	double paid = 0;
	double totalamount = 0;
	double totaldues = 0;
	
	public double getPaid() {
		return paid;
	}
	public void setPaid(double paid) {
		this.paid = paid;
	}
	public double getConsultation() {
		return consultation;
	}
	public void setConsultation(double consultation) {
		this.consultation = consultation;
	}
	public double getDeworming() {
		return deworming;
	}
	public void setDeworming(double deworming) {
		this.deworming = deworming;
	}
	public double getMedication() {
		return medication;
	}
	public void setMedication(double medication) {
		this.medication = medication;
	}
	public double getVaccination() {
		return vaccination;
	}
	public void setVaccination(double vaccination) {
		this.vaccination = vaccination;
	}
	public double getOther() {
		return other;
	}
	public void setOther(double other) {
		this.other = other;
	}
	public double getTotalamount() {
		return totalamount;
	}
	public void setTotalamount(double totalamount) {
		this.totalamount = totalamount;
	}
	public double getTotaldues() {
		return totaldues;
	}
	public void setTotaldues(double totaldues) {
		this.totaldues = totaldues;
	}
}

package com.team3.LMS.dto;

import java.io.Serializable;
import java.util.Date;
import java.util.List;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.JoinTable;
import javax.persistence.ManyToMany;
import javax.persistence.OneToMany;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;

import com.fasterxml.jackson.annotation.JsonIgnoreProperties;

@Entity
@Table(name = "user_info")
public class UserInfo implements Serializable {

	private static final long serialVersionUID = 1L;

	@Id
	@Column(name = "user_id")
	@GeneratedValue(strategy = GenerationType.AUTO)
	private int userId;

	private String address;

	private String degree;

	private String email;

	private String job;

	@Column(name = "phone_number")
	private int phoneNumber;

	private String pword;

	@Column(name = "real_name")
	private String realName;

	private String sex;

	private byte valid;

	@Temporal(TemporalType.DATE)
	@Column(name = "dayofbirth")
	private Date dayOfBirth;

	@OneToMany(mappedBy = "userInfo")
	private List<Payment> payments;

	@OneToMany(mappedBy = "userInfo")
	private List<Ticket> tickets;

	@ManyToMany
	@JoinTable(name = "user_role", joinColumns = { @JoinColumn(name = "user_id") }, inverseJoinColumns = {
			@JoinColumn(name = "role_id") })
	private List<Role> roles;

	public UserInfo() {
	}
	public UserInfo(String realname, String address, int phoneNumber, String email, String pword, String sex, String degree, byte valid){
		this.realName = realname;
		this.address = address;
		this.phoneNumber = phoneNumber;
		this.email = email;
		this.pword = pword;
		this.sex = sex;
		this.degree = degree;
		this.valid = valid;
	}
	public int getUserId() {
		return this.userId;
	}

	public void setUserId(int userId) {
		this.userId = userId;
	}

	public String getAddress() {
		return this.address;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	public Date getDayofBirth() {
		return this.dayOfBirth;
	}

	public void setDayofBirth(Date dayofBirth) {
		this.dayOfBirth = dayofBirth;
	}

	public String getDegree() {
		return this.degree;
	}

	public void setDegree(String degree) {
		this.degree = degree;
	}

	public String getEmail() {
		return this.email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getJob() {
		return this.job;
	}

	public void setJob(String job) {
		this.job = job;
	}

	public int getPhoneNumber() {
		return this.phoneNumber;
	}

	public void setPhoneNumber(int phoneNumber) {
		this.phoneNumber = phoneNumber;
	}

	public String getPword() {
		return this.pword;
	}

	public void setPword(String pword) {
		this.pword = pword;
	}

	public String getRealName() {
		return this.realName;
	}

	public void setRealName(String realName) {
		this.realName = realName;
	}

	public String getSex() {
		return this.sex;
	}

	public void setSex(String sex) {
		this.sex = sex;
	}

	public byte getValid() {
		return this.valid;
	}

	public void setValid(byte valid) {
		this.valid = valid;
	}
	
	@JsonIgnoreProperties({ "userInfo" })
	public List<Payment> getPayments() {
		return this.payments;
	}

	public void setPayments(List<Payment> payments) {
		this.payments = payments;
	}

	public Payment addPayment(Payment payment) {
		getPayments().add(payment);
		payment.setUserInfo(this);

		return payment;
	}

	public Payment removePayment(Payment payment) {
		getPayments().remove(payment);
		payment.setUserInfo(null);

		return payment;
	}
	
	@JsonIgnoreProperties({ "userInfo" })
	public List<Ticket> getTickets() {
		return this.tickets;
	}

	public void setTickets(List<Ticket> tickets) {
		this.tickets = tickets;
	}

	public Ticket addTicket(Ticket ticket) {
		getTickets().add(ticket);
		ticket.setUserInfo(this);

		return ticket;
	}

	public Ticket removeTicket(Ticket ticket) {
		getTickets().remove(ticket);
		ticket.setUserInfo(null);

		return ticket;
	}
	
	@JsonIgnoreProperties({ "userInfos" })
	public List<Role> getRoles() {
		return this.roles;
	}

	public void setRoles(List<Role> roles) {
		this.roles = roles;
	}

}
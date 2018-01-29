package com.crm.gym.model;


import java.util.Date;
import java.util.List;

import javax.persistence.*;

import com.fasterxml.jackson.annotation.JsonIgnore;



@Entity
@Table(name="contact")
public class Contact{
	@Id
	@Column(name="id")
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	private int id;
	
	@Column(name="phonenumber", length=30)
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	private String phonenumber;

	@Column(name="email", length=255)
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	private String email;
	
	@Column(name="address", length=300)
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	private String address;
	
	@Column(name="birthdate")
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	private Date birthdate;
	
	@JsonIgnore
	@OneToMany(fetch = FetchType.LAZY,mappedBy="contact",cascade = CascadeType.ALL)
	private List<Userrole> userroles;
	
	@JsonIgnore
	@OneToMany(fetch = FetchType.LAZY,mappedBy="contact",cascade = CascadeType.ALL)
	private List<Program> programs;

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getPhonenumber() {
		return phonenumber;
	}

	public void setPhonenumber(String phonenumber) {
		this.phonenumber = phonenumber;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	public Date getBirthdate() {
		return birthdate;
	}

	public void setBirthdate(Date birthdate) {
		this.birthdate = birthdate;
	}

	public List<Userrole> getUserroles() {
		return userroles;
	}

	public void setUserroles(List<Userrole> userroles) {
		this.userroles = userroles;
	}

	public List<Program> getPrograms() {
		return programs;
	}

	public void setPrograms(List<Program> programs) {
		this.programs = programs;
	}
	
	
	
}

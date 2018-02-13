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

	@Column(name="name", length=255)
	private String name;


	@Column(name="username", length=255)
	private String username;
	

	@Column(name="password", length=255)
	private String password;
	
	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	@Column(name="phonenumber", length=30)
	private String phonenumber;

	@Column(name="email", length=255)
	private String email;
	
	@Column(name="address", length=300)
	private String address;
	
	@Column(name="birthdate")
	private Date birthdate;
	
	@Column(name="registerdate")
	private Date registerdate;
	
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

	public String getUsername() {
		return username;
	}

	public void setUsername(String username) {
		this.username = username;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public Date getRegisterdate() {
		return registerdate;
	}

	public void setRegisterdate(Date registerdate) {
		this.registerdate = registerdate;
	}
	
	
	
}

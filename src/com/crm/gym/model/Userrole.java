package com.crm.gym.model;



import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;
import javax.persistence.UniqueConstraint;

@Entity
@Table(name = "userrole"//, catalog = "test"
,
	uniqueConstraints = @UniqueConstraint(
		columnNames = { "role", "contactid" })
)
public class Userrole{

	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	@Column(name = "id",
		unique = true, nullable = false)
	private Integer id;
	
	
	@Column(name = "role", nullable = false, length = 45)
	private String role;


	@ManyToOne(fetch = FetchType.LAZY)
	@JoinColumn(name = "contactid", nullable = false)
	private Contact contact;

	
	public Userrole() {
	}

	public Userrole(Contact contact, String role) {
		this.contact = contact;
		this.role = role;
	}
	
	

	public String getRole() {
		return role;
	}

	public void setRole(String role) {
		this.role = role;
	}

	public Contact getContact() {
		return contact;
	}

	public void setContact(Contact contact) {
		this.contact = contact;
	}

	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}






}
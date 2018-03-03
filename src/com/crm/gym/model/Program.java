package com.crm.gym.model;


import java.util.Date;
import java.util.List;

import javax.persistence.*;

import com.fasterxml.jackson.annotation.JsonIgnore;



@Entity
@Table(name="program")
public class Program{
	@Id
	@Column(name="id")
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	private int id;
	
	@Column(name="title", length=200)
	private String title;
	
	@Column(name="comment", length=500)
	private String comment;

	@Column(name="datestart")
	private Date datestart;

	@Column(name="dateend")
	private Date dateend;

	@Column(name="duration")
	private Date duration;
	
	@ManyToOne
	@JoinColumn(name = "contactid")
	private Contact contact;

	@JsonIgnore
	@OneToMany(fetch = FetchType.LAZY,mappedBy="program",cascade = CascadeType.ALL)
	private List<Entry> entries;


	@Column(name="history")
	private Boolean history;

	
	@ManyToOne
	@JoinColumn(name = "admincontact")
	private Contact adminContact;
	
	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getComment() {
		return comment;
	}

	public void setComment(String comment) {
		this.comment = comment;
	}

	public Date getDatestart() {
		return datestart;
	}

	public void setDatestart(Date datestart) {
		this.datestart = datestart;
	}

	public Date getDateend() {
		return dateend;
	}

	public void setDateend(Date dateend) {
		this.dateend = dateend;
	}

	public Date getDuration() {
		return duration;
	}

	public void setDuration(Date duration) {
		this.duration = duration;
	}

	public Contact getContact() {
		return contact;
	}

	public void setContact(Contact contact) {
		this.contact = contact;
	}

	public List<Entry> getEntries() {
		return entries;
	}

	public void setEntries(List<Entry> entries) {
		this.entries = entries;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public Boolean getHistory() {
		return history;
	}

	public void setHistory(Boolean history) {
		this.history = history;
	}

	public Contact getAdminContact() {
		return adminContact;
	}

	public void setAdminContact(Contact adminContact) {
		this.adminContact = adminContact;
	}

	@Override
	public String toString() {
		return "Program [id=" + id + ", title=" + title + ", comment=" + comment + ", datestart=" + datestart
				+ ", dateend=" + dateend + ", duration=" + duration + ", contact=" + contact + "]";
	}

}

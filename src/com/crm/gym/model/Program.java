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
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	private String title;
	
	@Column(name="comment", length=500)
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	private String comment;

	@Column(name="datestart")
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	private Date datestart;

	@Column(name="dateend")
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	private Date dateend;

	@Column(name="duration")
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	private Date duration;
	
	@ManyToOne
	@JoinColumn(name = "contactid")
	private Contact contact;

	@JsonIgnore
	@OneToMany(fetch = FetchType.LAZY,mappedBy="program",cascade = CascadeType.ALL)
	private List<Entry> entries;

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

}

package com.crm.gym.model;


import java.util.List;

import javax.persistence.*;

import com.fasterxml.jackson.annotation.JsonIgnore;



@Entity
@Table(name="exercise")
public class Exercise{
	@Id
	@Column(name="id")
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	private int id;
	
	@Column(name="title", length=255)
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	private String title;
	
	@ManyToOne(fetch = FetchType.LAZY)
	@JoinColumn(name = "categoryid")
	private Category category;

	@JsonIgnore
	@OneToMany(fetch = FetchType.LAZY,mappedBy="exercise",cascade = CascadeType.ALL)
	private List<Entry> entries;

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public Category getExercisecat() {
		return category;
	}

	public void setExercisecat(Category category) {
		this.category = category;
	}

	public List<Entry> getProgramentries() {
		return entries;
	}

	public void setProgramentries(List<Entry> entries) {
		this.entries = entries;
	}

	
}

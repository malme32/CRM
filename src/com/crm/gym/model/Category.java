package com.crm.gym.model;

import java.util.List;

import javax.persistence.*;

import com.fasterxml.jackson.annotation.JsonIgnore;


@Entity
@Table(name="category")
public class Category{
	@Id
	@Column(name="id")
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	private int id;
	
	@Column(name="title", length=255, unique=true)
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	private String title;
	
	@JsonIgnore
	@OneToMany(fetch = FetchType.LAZY,mappedBy="category",cascade = CascadeType.ALL)
	private List<Exercise> exercises;

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

	public List<Exercise> getExercises() {
		return exercises;
	}

	public void setExercises(List<Exercise> exercises) {
		this.exercises = exercises;
	}
	
	
	
}

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
	@JoinColumn(name = "exercisecatid", nullable = false)
	private ExerciseCat exercisecat;

	@JsonIgnore
	@OneToMany(fetch = FetchType.LAZY,mappedBy="exercise",cascade = CascadeType.ALL)
	private List<ProgramEntry> programentries;

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

	public ExerciseCat getExercisecat() {
		return exercisecat;
	}

	public void setExercisecat(ExerciseCat exercisecat) {
		this.exercisecat = exercisecat;
	}

	public List<ProgramEntry> getProgramentries() {
		return programentries;
	}

	public void setProgramentries(List<ProgramEntry> programentries) {
		this.programentries = programentries;
	}

	
}

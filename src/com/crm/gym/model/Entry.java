package com.crm.gym.model;



import javax.persistence.*;

import com.fasterxml.jackson.annotation.JsonIgnore;



@Entity
@Table(name="entry")
public class Entry{
	@Id
	@Column(name="id")
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	private int id;
	
	@Column(name="sets")
	private int sets;
	
	
	@Column(name="repeats")
	private int repeats;
	
	@Column(name="day")
	private String day;
	
	@JsonIgnore
	@ManyToOne
	@JoinColumn(name = "programid")
	private Program program;

	@ManyToOne
	@JoinColumn(name = "exerciseid")
	private Exercise exercise;

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}



	public String getDay() {
		return day;
	}

	public void setDay(String day) {
		this.day = day;
	}

	public Program getProgram() {
		return program;
	}

	public void setProgram(Program program) {
		this.program = program;
	}


	public Exercise getExercise() {
		return exercise;
	}

	public void setExercise(Exercise exercise) {
		this.exercise = exercise;
	}

	public int getSets() {
		return sets;
	}

	public void setSets(int sets) {
		this.sets = sets;
	}

	public int getRepeats() {
		return repeats;
	}

	public void setRepeats(int repeats) {
		this.repeats = repeats;
	}
	
	
}

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
	private Integer sets;
	
	
	@Column(name="repeats")
	private Integer repeats;
	
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
		if(day==null)
			return "";
		else return day;
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

	public Integer getSets() {
		if(sets==null)
			return 0;
		else return sets;
	}

	public void setSets(Integer sets) {
		this.sets = sets;
	}

	public Integer getRepeats() {
		if(repeats==null)
			return 0;
		else return repeats;
	}

	public void setRepeats(Integer repeats) {
		this.repeats = repeats;
	}


	
	
}

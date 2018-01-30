package com.crm.gym.model;



import javax.persistence.*;



@Entity
@Table(name="entry")
public class Entry{
	@Id
	@Column(name="id")
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	private int id;
	
	@Column(name="set")
	private int set;
	
	
	@Column(name="repeating")
	private int repeating;
	
	@Column(name="day")
	private String day;
	
	@ManyToOne(fetch = FetchType.LAZY)
	@JoinColumn(name = "programid")
	private Program program;

	@ManyToOne(fetch = FetchType.LAZY)
	@JoinColumn(name = "exerciseid")
	private Exercise exercise;

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public int getSet() {
		return set;
	}

	public void setSet(int set) {
		this.set = set;
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



	public int getRepeating() {
		return repeating;
	}

	public void setRepeating(int repeating) {
		this.repeating = repeating;
	}

	public Exercise getExercise() {
		return exercise;
	}

	public void setExercise(Exercise exercise) {
		this.exercise = exercise;
	}
	
	
}

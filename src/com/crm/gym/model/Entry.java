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
	
	
	@Column(name="repeat")
	private int repeat;
	
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

	public int getRepeat() {
		return repeat;
	}

	public void setRepeat(int repeat) {
		this.repeat = repeat;
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

	public Exercise getExersize() {
		return exercise;
	}

	public void setExersize(Exercise exersize) {
		this.exercise = exersize;
	}
	
	
}

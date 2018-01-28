package com.crm.gym.model;

import java.util.ArrayList;
import java.util.HashSet;
import java.util.List;
import java.util.Set;

//import javax.persistence.Column;
//import javax.persistence.Entity;
//import javax.persistence.GeneratedValue;
//import javax.persistence.GenerationType;
//import javax.persistence.Id;
import javax.persistence.*;

import org.hibernate.annotations.OnDelete;
import org.hibernate.annotations.OnDeleteAction;
import org.hibernate.search.annotations.Analyze;
import org.hibernate.search.annotations.Field;
import org.hibernate.search.annotations.Index;
import org.hibernate.search.annotations.Indexed;
import org.hibernate.search.annotations.Store;
import org.springframework.beans.factory.InitializingBean;
import org.springframework.security.access.annotation.Secured;

import com.fasterxml.jackson.annotation.JsonIgnore;



@Entity
@Table(name="contact")
public class Contact{
	@Id
	@Column(name="id")
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	int id;
	



}

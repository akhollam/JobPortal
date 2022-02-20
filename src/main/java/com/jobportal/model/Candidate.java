package com.jobportal.model;

import java.util.Arrays;
import java.util.HashSet;
import java.util.Set;
import java.util.UUID;

public class Candidate extends User {

	private String firstName;
	private String middleName;
	private String lastName;
	private String gender;
	private String contactNumber;

	private Set<Skills> skills;
	
	public Candidate() {
		this.id = UUID.randomUUID().toString();
		this.skills = new HashSet<>();
		this.skills.addAll(Arrays.asList(Skills.values()));
	}

	public String getFirstName() {
		return firstName;
	}

	public void setFirstName(String firstName) {
		this.firstName = firstName;
	}

	public String getMiddleName() {
		return middleName;
	}

	public void setMiddleName(String middleName) {
		this.middleName = middleName;
	}

	public String getLastName() {
		return lastName;
	}

	public void setLastName(String lastName) {
		this.lastName = lastName;
	}

	public String getGender() {
		return gender;
	}

	public void setGender(String gender) {
		this.gender = gender;
	}

	public Set<Skills> getSkills() {
		return skills;
	}

	public void setSkills(Set<Skills> skills) {
		this.skills = skills;
	}

	public String getContactNumber() {
		return contactNumber;
	}

	public void setContactNumber(String contactNumber) {
		this.contactNumber = contactNumber;
	}
	
	

}

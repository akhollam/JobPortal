package com.jobportal.model;

import java.util.Set;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class Candidate extends User {

	private String firstName;
	private String middleName;
	private String lastName;
	private String gender;
	private String contactNumber;
	private Set<Skills> skills;

}

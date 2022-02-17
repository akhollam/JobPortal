package com.jobportal.service;

import com.jobportal.model.Candidate;

public interface CandidateService {

	void saveCandidate(Candidate candidate);

	Candidate findById(int id);

}

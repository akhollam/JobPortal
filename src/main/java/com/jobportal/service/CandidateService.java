package com.jobportal.service;

import java.util.Optional;

import com.jobportal.model.Candidate;

public interface CandidateService {

	void saveCandidate(Candidate candidate);

	Optional<Candidate> findById(String id);

	void deleteById(String cId);

}

package com.jobportal.service.impl;

import java.util.LinkedList;
import java.util.List;
import java.util.Optional;

import com.jobportal.model.Candidate;
import com.jobportal.service.CandidateService;

public final class CandidateServiceImpl implements CandidateService {

	private final List<Candidate> candidatedb;

	private static CandidateServiceImpl instance;

	public static CandidateServiceImpl getInstance() {

		if (instance == null) {
			instance = new CandidateServiceImpl();
		}
		return instance;
	}

	private CandidateServiceImpl() {
		this.candidatedb = new LinkedList<>();
	}

	public void saveCandidate(Candidate candidate) {
		this.candidatedb.add(candidate);
	}

	public Optional<Candidate> findById(String id) {
		return candidatedb.stream().filter(candidate -> {
			return candidate.getId().equals(id);
		}).findAny();
	}

	public Optional<Candidate> findByUsernameAndPassword(final String username, final String password) {
		
		return candidatedb.stream().filter(candidate -> {
			return candidate.getUsername().equals(username) && candidate.getPassword().equals(password);
		}).findAny();
	}

	@Override
	public void deleteById(String cId) {
		// delete from candidatedb
	}

}

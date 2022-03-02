package com.jobportal.service.impl;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.Optional;

import com.jobportal.model.Candidate;
import com.jobportal.service.CandidateService;
import com.jobportal.util.DBUtil;

import lombok.Getter;
import lombok.extern.slf4j.Slf4j;

@Slf4j
public final class CandidateServiceDBImpl implements CandidateService {

	private static CandidateServiceDBImpl instance;

	public static CandidateServiceDBImpl getInstance() {
		
		if (instance == null) {
			instance = new CandidateServiceDBImpl();
		}
		return instance;
	}

	public void saveCandidate(Candidate candidate) {
		
		String sql = "INSERT INTO user(username, password) VALUES (?, ? );";
		log.trace("save query - {}", sql);

		Connection con = null; 
		try {
			
			con = DBUtil.getConnection();
			con.setAutoCommit(false);
			
			PreparedStatement preparedStatement = con.prepareStatement(sql, Statement.RETURN_GENERATED_KEYS);
			preparedStatement.setString(1, candidate.getUsername());
			preparedStatement.setString(2, candidate.getPassword());
			int rowaAffected = preparedStatement.executeUpdate();
			if (rowaAffected > 0) {

				ResultSet resultSet = preparedStatement.getGeneratedKeys();
				if (resultSet.next()) {

					int userId = resultSet.getInt(1);

					String userProfileSQL = "INSERT INTO user_profile (`middle_name`, `first_name`, `last_name`, `gender`, `user_id`) VALUES (?, ?, ?, ? , ?);";
					preparedStatement = con.prepareStatement(userProfileSQL);
					preparedStatement.setString(1, candidate.getMiddleName());
					preparedStatement.setString(2, candidate.getFirstName());
					preparedStatement.setString(3, candidate.getLastName());
					preparedStatement.setString(4, candidate.getGender());
					preparedStatement.setInt(5, userId);
					
					preparedStatement.executeUpdate();
					con.commit();
				}
			}
			
			// A ATOMIC 
			// C CONSISTANCY 
			// I ISOLATION
			// D Durability 
				
		} catch (SQLException e) {
			
			try {
				
				if(con != null) {
					con.rollback();
				}
				
			} catch (SQLException e1) {
				e1.printStackTrace();
			}
			log.error("SQL Exception occured.", e);
		}

	}

	public Optional<Candidate> findById(String id) {
		return null;
	}

	public Optional<Candidate> findByUsernameAndPassword(final String username, final String password) {

		log.debug("findByUsernameAndPassword method called for username - {} & {}", username, password);
		String sql = "SELECT * FROM user u JOIN user_profile up ON u.id = up.user_id WHERE u.username = ? and u.password = ?";

		try (Connection con = DBUtil.getConnection();) {

			PreparedStatement preparedStatement = con.prepareStatement(sql);
			preparedStatement.setString(1, username);
			preparedStatement.setString(2, password);
			
			ResultSet resultSet = preparedStatement.executeQuery();
			
			while (resultSet.next()) {
				
				Candidate candidate = new Candidate();
				candidate.setUsername(resultSet.getString("username"));
				candidate.setFirstName(resultSet.getString("first_name"));
				candidate.setLastName(resultSet.getString("last_name"));
				
				return Optional.of(candidate);
			}

		} catch (SQLException e) {
			log.error("SQL Exception occured.", e);
		}

		return Optional.empty();
	}

	@Override
	public void deleteById(String cId) {
	}

}

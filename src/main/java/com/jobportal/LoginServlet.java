package com.jobportal;

import java.io.IOException;
import java.util.Optional;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import com.jobportal.model.Candidate;
import com.jobportal.service.impl.CandidateServiceDBImpl;
import com.jobportal.service.impl.CandidateServiceImpl;

import lombok.extern.slf4j.Slf4j;

@Slf4j
public class LoginServlet extends HttpServlet {

	private static final long serialVersionUID = 1L;

	public LoginServlet() {
		super();
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		response.sendRedirect("login.jsp");
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		String username = request.getParameter("username");
		String password = request.getParameter("password");

		log.debug("User is trying to login with {} username ", username);

		Optional<Candidate> candidate = CandidateServiceDBImpl.getInstance().findByUsernameAndPassword(username, password);
		if (candidate.isPresent()) {

			log.debug("DEBUG - User found {} username ", username);

			HttpSession session = request.getSession(true);
			session.setAttribute("user", candidate.get());
			response.sendRedirect("welcome.jsp");

		} else {

			log.debug("INFO - User not found with {} username ", username);
			response.sendRedirect("login.jsp?loginfailed=true");
		}

	}

}

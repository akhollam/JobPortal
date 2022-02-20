package com.jobportal;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.jobportal.model.Candidate;
import com.jobportal.service.CandidateService;
import com.jobportal.service.impl.CandidateServiceImpl;

public class RegisterServlet extends HttpServlet {
	
	private static final long serialVersionUID = 1L;
	
    public RegisterServlet() {
        super();
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.sendRedirect("register.jsp");
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		CandidateService candidateService = CandidateServiceImpl.getInstance();
		Candidate candidate = new Candidate();
		candidate.setFirstName(request.getParameter("firstName"));
		candidate.setMiddleName(request.getParameter("middleName"));
		candidate.setLastName(request.getParameter("lastName"));
		candidate.setGender(request.getParameter("gender"));
		candidate.setUsername(request.getParameter("username"));
		candidate.setContactNumber(request.getParameter("contactNumber"));
		
		String password = request.getParameter("password");
		String confirmPassword = request.getParameter("confirmPassword");
		
		if(!password.equals(confirmPassword)) {
			response.sendRedirect("register.jsp?error=passmismatched");
			return;
		}
		
		candidate.setPassword(password);
		candidateService.saveCandidate(candidate);
		response.sendRedirect("register.jsp?registered=true");
	}

}

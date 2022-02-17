package com.jobportal;

import java.io.IOException;
import java.util.Optional;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.jobportal.model.Candidate;
import com.jobportal.service.impl.CandidateServiceImpl;

public class LoginServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public LoginServlet() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.sendRedirect("login.jsp");
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String username = request.getParameter("username");
		String password = request.getParameter("password");
		
		Optional<Candidate> candidate = CandidateServiceImpl.getInstance().findByUsernameAndPassword(username, password);
		if(candidate.isPresent()) {
			HttpSession session = request.getSession(true);
			session.setAttribute("user", candidate.get());
			response.sendRedirect("welcome.jsp");
		} else {
			response.sendRedirect("login.jsp?loginfailed=true");
		}
	
	}

}

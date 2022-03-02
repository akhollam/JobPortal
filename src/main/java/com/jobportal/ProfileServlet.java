package com.jobportal;

import java.io.IOException;
import java.util.Arrays;
import java.util.HashSet;
import java.util.Optional;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.jobportal.model.Candidate;
import com.jobportal.model.Skills;
import com.jobportal.service.CandidateService;
import com.jobportal.service.impl.CandidateServiceImpl;

/**
 * Servlet implementation class ProfileServlet
 */
public class ProfileServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public ProfileServlet() {
		super();
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		request.setAttribute("skills", Arrays.asList(Skills.values()));
		request.getRequestDispatcher("/profile.jsp").forward(request, response);

	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		String action = request.getParameter("action");

		switch (action) {
		case "UPDATE":
			updateRecord(request, response);
			break;
		case "DELETE":
			deleteRecord(request, response);
			break;

		default:
			break;
		}

	}

	private void deleteRecord(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		Candidate candidate = (Candidate) request.getSession().getAttribute("user");
		String cId = candidate.getId();
		CandidateService candidateService = CandidateServiceImpl.getInstance();
		candidateService.deleteById(cId);
		HttpSession session = request.getSession();
		session.invalidate();
		response.sendRedirect("register.jsp?deleted=true");
	}

	private void updateRecord(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		CandidateService candidateService = CandidateServiceImpl.getInstance();
		Optional<Candidate> candidate = candidateService.findById(request.getParameter("id"));

		if (candidate.isPresent()) {

			String[] skills = {};
			
			String[] skillParam = request.getParameterValues("mySkills");
			if(skillParam != null) {
				skills = skillParam;
			}

			Candidate candidateRec = candidate.get();
			candidateRec.setFirstName(request.getParameter("firstName"));
			candidateRec.setMiddleName(request.getParameter("middleName"));
			candidateRec.setLastName(request.getParameter("lastName"));
			candidateRec.setGender(request.getParameter("gender"));
			candidateRec.setContactNumber(request.getParameter("contactNumber"));
			candidateRec.setSkills(new HashSet(Arrays.asList(skills)));
			
			HttpSession session = request.getSession();
			session.setAttribute("user", candidateRec);

			request.getRequestDispatcher("/profile.jsp?updated=true").forward(request, response);
			return;
		}

		response.sendRedirect("notfound.jsp");

	}

}

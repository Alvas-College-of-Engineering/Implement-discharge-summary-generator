package com.hospital.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.hospital.dao.PatientDAO;

@WebServlet("/DeletePatientServlet")
public class DeletePatientServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int id = Integer.parseInt(request.getParameter("id"));
        PatientDAO patientDAO = new PatientDAO();
        boolean isDeleted = patientDAO.deletePatient(id);
        
        if (isDeleted) {
            response.sendRedirect("ViewPatientServlet");
        } else {
            response.sendRedirect("error.jsp?msg=Failed+to+delete+patient");
        }
    }
}

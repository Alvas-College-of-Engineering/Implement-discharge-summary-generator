package com.hospital.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.hospital.dao.PatientDAO;
import com.hospital.model.Patient;

@WebServlet("/GenerateSummaryServlet")
public class GenerateSummaryServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String idParam = request.getParameter("id");
        if (idParam == null || idParam.isEmpty()) {
            response.sendRedirect("error.jsp?msg=Invalid+Patient+ID");
            return;
        }

        int patientId = Integer.parseInt(idParam);
        PatientDAO patientDAO = new PatientDAO();
        Patient patient = patientDAO.getPatientById(patientId);

        if (patient != null) {
            request.setAttribute("patient", patient);
            request.getRequestDispatcher("dischargeSummary.jsp").forward(request, response);
        } else {
            response.sendRedirect("error.jsp?msg=Patient+Not+Found");
        }
    }
}

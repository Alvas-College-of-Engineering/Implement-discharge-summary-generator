package com.hospital.controller;

import java.io.IOException;
import java.sql.Date;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.hospital.dao.PatientDAO;
import com.hospital.model.Patient;

@WebServlet("/UpdatePatientServlet")
public class UpdatePatientServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int patientId = Integer.parseInt(request.getParameter("patientId"));
        String patientName = request.getParameter("patientName");
        int age = Integer.parseInt(request.getParameter("age"));
        String gender = request.getParameter("gender");
        String address = request.getParameter("address");
        String phone = request.getParameter("phone");
        Date admissionDate = Date.valueOf(request.getParameter("admissionDate"));
        Date dischargeDate = request.getParameter("dischargeDate") != null && !request.getParameter("dischargeDate").isEmpty() ? Date.valueOf(request.getParameter("dischargeDate")) : null;
        String diagnosis = request.getParameter("diagnosis");
        String treatmentDetails = request.getParameter("treatmentDetails");
        String doctorName = request.getParameter("doctorName");
        String prescription = request.getParameter("prescription");
        String roomNumber = request.getParameter("roomNumber");
        double totalAmount = request.getParameter("totalAmount") != null && !request.getParameter("totalAmount").isEmpty() ? Double.parseDouble(request.getParameter("totalAmount")) : 0.0;

        Patient patient = new Patient(patientId, patientName, age, gender, address, phone, admissionDate, dischargeDate, diagnosis, treatmentDetails, doctorName, prescription, roomNumber, totalAmount);
        
        PatientDAO patientDAO = new PatientDAO();
        boolean isUpdated = patientDAO.updatePatient(patient);

        if (isUpdated) {
            response.sendRedirect("ViewPatientServlet");
        } else {
            response.sendRedirect("error.jsp?msg=Failed+to+update+patient");
        }
    }
}

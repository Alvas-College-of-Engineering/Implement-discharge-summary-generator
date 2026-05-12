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

@WebServlet("/AddPatientServlet")
public class AddPatientServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
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

        Patient patient = new Patient();
        patient.setPatientName(patientName);
        patient.setAge(age);
        patient.setGender(gender);
        patient.setAddress(address);
        patient.setPhone(phone);
        patient.setAdmissionDate(admissionDate);
        patient.setDischargeDate(dischargeDate);
        patient.setDiagnosis(diagnosis);
        patient.setTreatmentDetails(treatmentDetails);
        patient.setDoctorName(doctorName);
        patient.setPrescription(prescription);
        patient.setRoomNumber(roomNumber);
        patient.setTotalAmount(totalAmount);

        PatientDAO patientDAO = new PatientDAO();
        boolean isAdded = patientDAO.addPatient(patient);

        if (isAdded) {
            response.sendRedirect("success.jsp?msg=Patient+Added+Successfully");
        } else {
            response.sendRedirect("error.jsp?msg=Failed+to+add+patient");
        }
    }
}

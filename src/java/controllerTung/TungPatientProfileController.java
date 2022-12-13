package controllerTung;

import DAO.TungDoctorDao;
import DAO.TungDoctorDaoImpl;
import DAO.TungPatientDao;
import DAO.TungPatientDaoImpl;
import entity.Doctor;
import entity.Patient;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

@WebServlet(name = "PatientProfile", urlPatterns = {"/patientProfile"})
public class TungPatientProfileController extends HttpServlet {
    private TungPatientDao patientDao = new TungPatientDaoImpl();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) {
        try {
            int patientId = Integer.parseInt(request.getParameter("patientId"));
            Patient patient = patientDao.find(0, 0, patientId).stream().findFirst().get();

            request.setAttribute("patient", patient);
            request.getRequestDispatcher("/manager-role/patient/profile.jsp").forward(request, response);
        } catch (Exception e) {
            System.out.println(e.getMessage());
        }
    }


    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
    }
}

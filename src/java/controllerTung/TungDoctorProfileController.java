package controllerTung;

import DAO.TungDoctorDao;
import DAO.TungDoctorDaoImpl;
import entity.Doctor;
import utils.TungConstant;
import utils.TungUtils;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

@WebServlet(name = "DoctorProfile", urlPatterns = {"/doctorProfile"})
public class TungDoctorProfileController extends HttpServlet {
    private TungDoctorDao tungDoctorDao = new TungDoctorDaoImpl();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) {
        try {
            int doctorId = Integer.parseInt(request.getParameter("doctorId"));
            int doctorProfileId = Integer.parseInt(request.getParameter("doctorProfileId"));
            Doctor doctor = tungDoctorDao.findById(doctorId, doctorProfileId);
            List<Doctor> anotherDoctorList = tungDoctorDao.findAnotherDoctor(doctorId, doctorProfileId);

            request.setAttribute("doctor", doctor);
            request.setAttribute("anotherDoctorList", anotherDoctorList);
            request.getRequestDispatcher("/manager-role/doctor/profile.jsp").forward(request, response);
        } catch (Exception e) {
            System.out.println(e.getMessage());
        }
    }


    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
    }
}

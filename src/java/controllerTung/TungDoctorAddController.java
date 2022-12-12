package controllerTung;

import DAO.TungDoctorDao;
import DAO.TungDoctorDaoImpl;
import DAO.TungSpecialistDao;
import DAO.TungSpecialistDaoImpl;
import entity.Doctor;
import entity.Specialist;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

@WebServlet(name = "DoctorAdd", urlPatterns = {"/doctors/add"})
public class TungDoctorAddController extends HttpServlet {
	private TungDoctorDao tungDoctorDao = new TungDoctorDaoImpl();
	private TungSpecialistDao tungSpecialistDao = new TungSpecialistDaoImpl();

	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response) {
		try {
			List<Doctor> doctorList = tungDoctorDao.find(0 , 0);
			List<Specialist> specialistList = tungSpecialistDao.findAll();
			request.setAttribute("doctorList", doctorList);
			request.setAttribute("specialistList", specialistList);
			request.getRequestDispatcher("/manager-role/doctor/add.jsp").forward(request, response);
		} catch (Exception e) {
			System.out.println(e.getMessage());
		}
	}


	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		//        processRequest(request, response);
	}
}

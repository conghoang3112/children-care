package controllerTung;

import DAO.TungDoctorDao;
import DAO.TungDoctorDaoImpl;
import DAO.TungSpecialistDao;
import DAO.TungSpecialistDaoImpl;
import entity.Doctor;
import entity.DoctorProfile;
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
		try {
			String firstName = request.getParameter("firstName");
			String lastName = request.getParameter("lastName");
			String email = request.getParameter("email");
			String phone = request.getParameter("number");
			int specialist = Integer.parseInt(request.getParameter("specialist"));
			int gender = Integer.parseInt(request.getParameter("gender"));
			String comments = request.getParameter("comments");

			DoctorProfile doctorProfile = new DoctorProfile();
			doctorProfile.setFirstName(firstName);
			doctorProfile.setLastName(lastName);
			doctorProfile.setEmail(email);
			doctorProfile.setPhone(phone);
			doctorProfile.setAvatar("");
			doctorProfile.setSex(gender == 0 ? false : true);
			doctorProfile.setAddressHospital(comments);

			
		} catch (Exception e) {
			System.out.println(e.getMessage());
		}

	}
}

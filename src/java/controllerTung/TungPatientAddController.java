package controllerTung;

import DAO.*;
import entity.*;
import utils.TungUtils;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;
import java.io.File;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

@WebServlet(name = "PatientAdd", urlPatterns = {"/patients/add"})
@MultipartConfig(fileSizeThreshold = 1024 * 1024 * 2, // 2MB
		maxFileSize = 1024 * 1024 * 50, // 50MB
		maxRequestSize = 1024 * 1024 * 50) // 50MB
public class TungPatientAddController extends HttpServlet {
	private TungPatientDao patientDao = new TungPatientDaoImpl();
	private TungDoctorDao tungDoctorDao = new TungDoctorDaoImpl();

	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response) {
		try {
			List<Doctor> doctorList = tungDoctorDao.find(0 , 0);
			request.setAttribute("doctorList", doctorList);
			request.getRequestDispatcher("/manager-role/patient/add.jsp").forward(request, response);
		} catch (Exception e) {
			System.out.println(e.getMessage());
		}
	}


	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		try {
			Part part = request.getParts().stream().findFirst().get();
			String fileName = TungUtils.extractFileName(part);
			// refines the fileName in case it is an absolute path
			fileName = new File(fileName).getName();
			part.write(TungUtils.getFolderUploadPatient().getAbsolutePath() + File.separator + fileName);

			String firstName = request.getParameter("firstName");
			String lastName = request.getParameter("lastName");
			String email = request.getParameter("email");
			String phone = request.getParameter("number");
			SimpleDateFormat simpleDateFormat = new SimpleDateFormat("yyyy-MM-dd");
			Date dob = simpleDateFormat.parse(request.getParameter("dob"));

			User user = new User();
			user.setId(14);

			Patient patient = new Patient();
			patient.setName(firstName + " " + lastName);
			patient.setPhone(phone);
			patient.setEmail(email);
			patient.setUser(user);
			patient.setDob(dob);
			patient.setAvatar(fileName);

			boolean result = patientDao.add(patient);
			if (!result) {
				System.out.println("Add patient fail");
			}
			response.sendRedirect("/patients");
		} catch (Exception e) {
			System.out.println(e.getMessage());
		}

	}
}

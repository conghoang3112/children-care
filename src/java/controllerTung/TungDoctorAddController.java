package controllerTung;

import DAO.TungDoctorDao;
import DAO.TungDoctorDaoImpl;
import DAO.TungSpecialistDao;
import DAO.TungSpecialistDaoImpl;
import entity.Doctor;
import entity.DoctorProfile;
import entity.Specialist;
import utils.TungConstant;
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
import java.util.List;

@WebServlet(name = "DoctorAdd", urlPatterns = {"/doctors/add"})
@MultipartConfig(fileSizeThreshold = 1024 * 1024 * 2, // 2MB
		maxFileSize = 1024 * 1024 * 50, // 50MB
		maxRequestSize = 1024 * 1024 * 50) // 50MB
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
			Part part = request.getParts().stream().findFirst().get();
			String fileName = TungUtils.extractFileName(part);
			// refines the fileName in case it is an absolute path
			fileName = new File(fileName).getName();
                        String path = TungUtils.getFolderUpload().getAbsolutePath() + File.separator;
                        try {
                            part.write(path + fileName);
                        } catch (Exception e) {
                            
                        }

			String firstName = request.getParameter("firstName");
			String lastName = request.getParameter("lastName");
			String email = request.getParameter("email");
			String phone = request.getParameter("number");
			int specialistId = Integer.parseInt(request.getParameter("specialist"));
			int gender = Integer.parseInt(request.getParameter("gender"));
			String comments = request.getParameter("comments");

			DoctorProfile doctorProfile = new DoctorProfile();
			doctorProfile.setFirstName(firstName);
			doctorProfile.setLastName(lastName);
			doctorProfile.setEmail(email);
			doctorProfile.setPhone(phone);
			doctorProfile.setAvatar(fileName);
			doctorProfile.setSex(gender == 0 ? false : true);
			doctorProfile.setAddressHospital(comments);

			Doctor doctor = new Doctor();
			Specialist specialist = new Specialist();
			specialist.setId(specialistId);
			doctor.setSpecialist(specialist);
			doctor.setDoctorProfile(doctorProfile);

			boolean result = tungDoctorDao.add(doctor, doctorProfile);
			if (!result) {
				System.out.println("Add doctor fail");
			}
			response.sendRedirect(request.getContextPath() + "/doctors");
		} catch (Exception e) {
			System.out.println(e.getMessage());
		}

	}
}

package controllerTung;

import DAO.TungDoctorDao;
import DAO.TungDoctorDaoImpl;
import entity.Doctor;
import entity.DoctorProfile;
import entity.Specialist;
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

@WebServlet(name = "DoctorUpdate", urlPatterns = {"/doctors/update"})
@MultipartConfig(fileSizeThreshold = 1024 * 1024 * 2, // 2MB
		maxFileSize = 1024 * 1024 * 50, // 50MB
		maxRequestSize = 1024 * 1024 * 50) // 50MB
public class TungDoctorUpdateController extends HttpServlet {
	private TungDoctorDao tungDoctorDao = new TungDoctorDaoImpl();

	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		try {
			Part part = request.getParts().stream().findFirst().get();
			String fileName = TungUtils.extractFileName(part);
			// refines the fileName in case it is an absolute path
			fileName = new File(fileName).getName();
//			part.write(TungUtils.getFolderUpload().getAbsolutePath() + File.separator + fileName);

			int doctorProfileId = Integer.parseInt(request.getParameter("doctorProfileId"));
			String firstName = request.getParameter("firstName");
			String lastName = request.getParameter("lastName");
			String email = request.getParameter("email");
			String phone = request.getParameter("number");
			String comments = request.getParameter("comments");

			DoctorProfile doctorProfile = new DoctorProfile();
			doctorProfile.setId(doctorProfileId);
			doctorProfile.setFirstName(firstName);
			doctorProfile.setLastName(lastName);
			doctorProfile.setEmail(email);
			doctorProfile.setPhone(phone);
			doctorProfile.setAvatar(fileName);
			doctorProfile.setAddressHospital(comments);

			boolean result = tungDoctorDao.update(doctorProfile);
			if (!result) {
				System.out.println("Update doctor fail");
			}
			response.sendRedirect("/doctors");
		} catch (Exception e) {
			System.out.println(e.getMessage());
		}

	}
}

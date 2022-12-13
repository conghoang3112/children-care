package controllerTung;

import DAO.TungDoctorDao;
import DAO.TungDoctorDaoImpl;
import DAO.TungPatientDao;
import DAO.TungPatientDaoImpl;
import entity.DoctorProfile;
import entity.Patient;
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

@WebServlet(name = "PatientUpdate", urlPatterns = {"/patients/update"})
@MultipartConfig(fileSizeThreshold = 1024 * 1024 * 2, // 2MB
		maxFileSize = 1024 * 1024 * 50, // 50MB
		maxRequestSize = 1024 * 1024 * 50) // 50MB
public class TungPatientUpdateController extends HttpServlet {
	private TungPatientDao patientDao = new TungPatientDaoImpl();

	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		try {
			Part part = request.getParts().stream().findFirst().get();
			String fileName = TungUtils.extractFileName(part);
			// refines the fileName in case it is an absolute path
			fileName = new File(fileName).getName();
//			part.write(TungUtils.getFolderUploadPatient().getAbsolutePath() + File.separator + fileName);

			int patientId = Integer.parseInt(request.getParameter("patientId"));
			String firstName = request.getParameter("firstName");
			String lastName = request.getParameter("lastName");
			String email = request.getParameter("email");
			String phone = request.getParameter("number");
			String comments = request.getParameter("comments");

			Patient patient = new Patient();
			patient.setId(patientId);
			patient.setName(firstName + " " + lastName);
			patient.setPhone(phone);
			patient.setEmail(email);
			patient.setAvatar(fileName);
			patient.setNote(comments);

			boolean result = patientDao.update(patient);
			if (!result) {
				System.out.println("Update patient fail");
			}
			response.sendRedirect("/patients");
		} catch (Exception e) {
			System.out.println(e.getMessage());
		}

	}
}

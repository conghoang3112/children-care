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

@WebServlet(name = "Doctor", urlPatterns = {"/doctors"})
public class TungDoctorController extends HttpServlet {
	private TungDoctorDao tungDoctorDao = new TungDoctorDaoImpl();

	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response) {
		try {
			int totalRecord = tungDoctorDao.getTotalDoctor();
			int totalPage = TungUtils.getTotalPage(totalRecord);

			int pageNumber = 1;
			try {
				pageNumber = Integer.parseInt(request.getParameter("pageNumber"));
			} catch (Exception e) {

			}
			int currentPage = pageNumber;

			int end = currentPage * TungConstant.LIMIT_PAGE;
			int start = end - TungConstant.LIMIT_PAGE + 1;
			List<Doctor> doctorList = tungDoctorDao.find(start, end);
			request.setAttribute("totalPage", totalPage);
			request.setAttribute("currentPage", currentPage);
			request.setAttribute("doctorList", doctorList);
			request.getRequestDispatcher("/manager-role/doctor/list.jsp").forward(request, response);
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

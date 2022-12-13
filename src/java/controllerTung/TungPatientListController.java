package controllerTung;

import DAO.TungPatientDao;
import DAO.TungPatientDaoImpl;
import entity.Doctor;
import entity.Patient;
import utils.TungConstant;
import utils.TungUtils;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


@WebServlet(name = "Patients", urlPatterns = {"/patients"})
public class TungPatientListController extends HttpServlet {
    private TungPatientDao patientDao = new TungPatientDaoImpl();

    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            int totalRecord = patientDao.getTotalPatient();
            int totalPage = TungUtils.getTotalPage(totalRecord);

            int pageNumber = 1;
            try {
                pageNumber = Integer.parseInt(request.getParameter("pageNumber"));
            } catch (Exception e) {

            }
            int currentPage = pageNumber;

            int end = currentPage * TungConstant.LIMIT_PAGE;
            int start = end - TungConstant.LIMIT_PAGE + 1;
            List<Patient> patientList = patientDao.find(start, end, 0);
            request.setAttribute("totalPage", totalPage);
            request.setAttribute("currentPage", currentPage);
            request.setAttribute("patientList", patientList);
            request.getRequestDispatcher("/manager-role/patient/list.jsp").forward(request, response);
        } catch (Exception e) {
            System.out.println(e.getMessage());
        }
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

    }

}

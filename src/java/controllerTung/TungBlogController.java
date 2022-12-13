/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controllerTung;

import DAO.TungBlogDao;
import DAO.TungBlogDaoImpl;
import DAO.TungReservationDao;
import DAO.TungReservationDaoImpl;
import entity.Blog;
import entity.Reservation;
import utils.TungConstant;
import utils.TungUtils;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

@WebServlet(name = "Blog", urlPatterns = {"/blogs"})
public class TungBlogController extends HttpServlet {

    private TungBlogDao tungBlogDao = new TungBlogDaoImpl();

    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) {
        try {
            int totalRecord = tungBlogDao.getTotalBlog();
            int totalPage = TungUtils.getTotalPage(totalRecord);

            int pageNumber = 1;
            try {
                pageNumber = Integer.parseInt(request.getParameter("pageNumber"));
            } catch (Exception e) {

            }
            int currentPage = pageNumber;

            int end = currentPage * TungConstant.LIMIT_PAGE;
            int start = end - TungConstant.LIMIT_PAGE + 1;
            List<Blog> blogList = tungBlogDao.findAll(start, end);
            request.setAttribute("totalPage", totalPage);
            request.setAttribute("currentPage", currentPage);
            request.setAttribute("blogList", blogList);
            request.getRequestDispatcher("/manager-role/blog/list.jsp").forward(request, response);
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
//        processRequest(request, response);
    }

}

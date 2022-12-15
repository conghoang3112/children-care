/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import DAO.UserDAOIplm;
import entity.User;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author duan1
 */
@WebServlet(name = "UpdateUserProfileController", urlPatterns = {"/UpdateUserProfileController"})
public class UpdateUserProfileController extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
//        try (PrintWriter out = response.getWriter()) {
//            /* TODO output your page here. You may use following sample code. */
//            out.println("<!DOCTYPE html>");
//            out.println("<html>");
//            out.println("<head>");
//            out.println("<title>Servlet UpdateUserProfileController</title>");            
//            out.println("</head>");
//            out.println("<body>");
//            out.println("<h1>Servlet UpdateUserProfileController at " + request.getContextPath() + "</h1>");
//            out.println("</body>");
//            out.println("</html>");
//        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
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
        processRequest(request, response);
           UserDAOIplm dao = new UserDAOIplm();
        String s = request.getParameter("id");
        // int id= Integer.parseInt(s);
        User user = new User();
        user = dao.getUserByID(12);
        
        request.setAttribute("update", user);

        //System.out.println(user);
        request.getRequestDispatcher("UpdateUserProfile.jsp").forward(request, response);
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
    protected void doPost(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {
        processRequest(req, resp);
             processRequest(req, resp);
        String fName = req.getParameter("fisrtName");
        String lName = req.getParameter("lastName");
        String phone = req.getParameter("phone");
        String sex = req.getParameter("sex");
        String image = req.getParameter("image");

       // String realpatrh = req.getServletContext().getRealPath("/images");
        
        String fileName = null;



            System.out.println("file1"+image);
             boolean sexdata = true;
        if (sex.equals("Male")) {
            sexdata = true;
        } else if (sex.equals("FeMale")) {
            sexdata = false;
        }
        String address = req.getParameter("address");

        String avate = req.getParameter("avata");
        UserDAOIplm dao = new UserDAOIplm();

        

        
        System.out.println(fileName);
         System.out.println(image);
        User user = new User(12, fName, lName, phone, address, image, sexdata);
        dao.UpdateUserbyId(user);
        resp.sendRedirect(req.getContextPath() + "/ViewProifleUserController");
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}

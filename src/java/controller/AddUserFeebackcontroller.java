/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import DAO.FeedbackDAO;
import DAO.FeedbackDAOIplm;
import entity.Feedback;
import entity.Reservationduan;
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
@WebServlet(name = "AddUserFeebackcontroller", urlPatterns = {"/AddUserFeebackcontroller"})
public class AddUserFeebackcontroller extends HttpServlet {

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
         int uid=12;
        String refid=request.getParameter("refid");
        int reid=0;
        reid=Integer.parseInt(refid);
        request.setAttribute("uidfeb", uid);
        request.setAttribute("refid", refid);
        request.getRequestDispatcher("AddFeebackUser.jsp").forward(request, response);
        
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
        processRequest(request, response);
        String refid=request.getParameter("refeedid");
        int reid=0;
        
        
        String uid=request.getParameter("ufeedid");
        int id = 0;
        id= Integer.parseInt(uid);       
        reid=Integer.parseInt(refid);

        String issue = request.getParameter("IsuesDetail");
        System.out.println("re:"+reid +" uid:"+id);
        FeedbackDAO dao = new FeedbackDAOIplm();
        boolean check = dao.addFeedback(new Feedback(0, issue,null,new Reservationduan(reid), new User(id)));
        if(check==false){
            response.sendRedirect( request.getContextPath()+"/addFeedbackController");
            
        }else{
            
            request.getRequestDispatcher("AddFeebackUser.jsp").forward(request, response);
        }
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

/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import DAO.FeebackRepplydaunDAOIpl;
import DAO.FeebackRepplyduanDAO;
import DAO.FeedbackDAO;
import DAO.FeedbackDAOIplm;
import entity.Feedback;
import entity.FeedbackReply;
import java.io.IOException;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author duan1
 */
@WebServlet(name = "ListFeedbackReply", urlPatterns = {"/ListFeedbackReply"})
public class ListFeedbackReply extends HttpServlet {

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
//        FeebackRepplyDAO dao = new FeebackRepplyDAOIplm();
        FeebackRepplyduanDAO dao = new FeebackRepplydaunDAOIpl();
        FeedbackDAO fdao = new FeedbackDAOIplm();
        List<Feedback> feeb = fdao.getallFeednoReplyy(12);
        
List<FeedbackReply> feed = dao.getafeedllbyid(12);
      
request.setAttribute("feed", feed);
request.setAttribute("feeb", feeb);
        System.out.println(feeb);

request.getRequestDispatcher("ViewFeedback.jsp").forward(request, response);
//        List<FeedbackReply> feed= dao.getafeedllbyid(12);
//        request.setAttribute("feed", feed);
//        request.getRequestDispatcher("viewFeedback.jsp").forward(request, response);
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

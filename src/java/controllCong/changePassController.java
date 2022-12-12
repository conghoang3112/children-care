/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controllCong;

import DAO.AccountDAO;
import entity.Account;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author congh
 */
@WebServlet(name = "changePassController", urlPatterns = {"/changePassController"})
public class changePassController extends HttpServlet {

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
//            out.println("<title>Servlet changePassController</title>");            
//            out.println("</head>");
//            out.println("<body>");
//            out.println("<h1>Servlet changePassController at " + request.getContextPath() + "</h1>");
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
        int idAccount = 1;
        AccountDAO dao = new AccountDAO();
        Account a = dao.findAccById(idAccount);

        request.setAttribute("username", a.getUsername());
        request.getRequestDispatcher("ChangePass.jsp").forward(request, response);
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
        int idAccount = 1;
        AccountDAO dao = new AccountDAO();
        Account a = dao.findAccById(idAccount);
        String oldpass = request.getParameter("oldpass");
        String newpass = request.getParameter("newpass");
        String repass = request.getParameter("repass");

        if (oldpass.equals(a.getPassword())) {
            if (!newpass.equals(repass)) {
                request.setAttribute("mess", "pass and repass dif");
                request.getRequestDispatcher("ChangePass.jsp").
                        forward(request, response);
            } else {
                dao.changePass(idAccount, newpass);
//                if (a == null) {
//                    dao.singup(user, pass);
//                    request.getRequestDispatcher("Login.jsp").
//                            forward(request, response);
//                } else {
//                    request.setAttribute("mess", "The registration name is identical");
//                    request.getRequestDispatcher("SignUp.jsp").
//                            forward(request, response);
//                }
                request.setAttribute("mess", "Password has been changed");
                request.getRequestDispatcher("HomePage.jsp").forward(request, response);
            }
        } else {
            request.setAttribute("mess", "wrong password");
            request.getRequestDispatcher("ChangePass.jsp").
                    forward(request, response);
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

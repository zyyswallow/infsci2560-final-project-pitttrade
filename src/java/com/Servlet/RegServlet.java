/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.Servlet;

import com.Bean.UserinfoHelper;
import com.POJOs.User;
import com.Utils.Constant;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Timestamp;
import java.util.Date;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author linxiaohui
 */
public class RegServlet extends HttpServlet {

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
        HttpSession httpSession = request.getSession();
        Date date = new Date();
        Timestamp timeStamp = new Timestamp(date.getTime());
        
        User userinfo = new User();
        userinfo.setUsername(request.getParameter("username"));
        userinfo.setPassword(request.getParameter("password"));
        userinfo.setEmail(request.getParameter("email"));
        userinfo.setGender(request.getParameter("gender"));
        userinfo.setDetails(request.getParameter("detail"));
        userinfo.setCreationDate(timeStamp);
        
        UserinfoHelper userinfohp = new UserinfoHelper();
        int status = userinfohp.insertOrUpdateUser("register",userinfo);
        
        if (status == Constant.REG_SUCCESS) {
            UserinfoHelper loginRedirect = new UserinfoHelper(); 
            httpSession.setAttribute("userid", loginRedirect.checkUserAuth(userinfo).getUid());
            getServletContext().getRequestDispatcher("/profile.jsp").forward(request, response);
          } else if (status == Constant.USERNAME_DUPLICATE) {
            request.setAttribute("loginstatus", "Username dulplicated");
            getServletContext().getRequestDispatcher("/login.jsp").forward(request, response);
        } else if (status == Constant.USER_INSERT_ERROR) {
            
        } else if (status == Constant.UNKNOWN_ERROR) {
            
        }
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

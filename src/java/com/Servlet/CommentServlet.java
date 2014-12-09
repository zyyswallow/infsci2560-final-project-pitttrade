/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.Servlet;

import com.Bean.CommentinfoHelper;
import com.Bean.PostinfoHelper;
import com.POJOs.Comment;
import com.POJOs.Post;
import com.Utils.Constant;
import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Timestamp;
import java.util.Date;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author huge
 */
public class CommentServlet extends HttpServlet {

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
        
        
        String commentContent = request.getParameter("commentArea").trim();
        String uid = request.getParameter("userId").trim();
        String pid = request.getParameter("postId").trim();
        
        Date date = new Date();
        Timestamp timeStamp = new Timestamp(date.getTime());
        
        
        
        // build the complete object ... need more info!!
        Comment commentInfo = new Comment();
        commentInfo.setUserId(Integer.parseInt(uid));
        commentInfo.setPostId(Integer.parseInt(pid));
        commentInfo.setText(commentContent);
        commentInfo.setCreationTime(timeStamp);
        commentInfo.setReplyCmtId(1);
        

        //insert object into database
        CommentinfoHelper commentinfoHelper = new CommentinfoHelper();
        int insertStatus = commentinfoHelper.insertComment(commentInfo);
        

        //use the status code to redirect to different pages
        if (insertStatus == Constant.POST_INSERT_SUCCESS) {
            System.out.println("Success!"); // change print out to redirect or dispatcher to other page
            request.setAttribute("commentstatus", "Reply Successful");
           // getServletContext().getRequestDispatcher("/mypost.jsp?page=0").forward(request, response);
        } else if (insertStatus == Constant.POST_INSERT_ERROR) {
            System.err.println("Fail!");
            request.setAttribute("commentstatus", "Reply Failed");
            getServletContext().getRequestDispatcher("/error.jsp").forward(request, response);
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

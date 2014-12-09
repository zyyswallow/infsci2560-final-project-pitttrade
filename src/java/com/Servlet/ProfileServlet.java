/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.Servlet;

import com.Bean.FeedTagHelper;
import com.Bean.UserinfoHelper;
import com.POJOs.ContactInfo;
import com.POJOs.FeedTag;
import com.POJOs.FeedTagId;
import com.POJOs.User;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Date;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author linxiaohui
 */
public class ProfileServlet extends HttpServlet {

    HttpSession session = null;
    
    int userid;

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
        session = request.getSession();
        userid = Integer.parseInt(request.getParameter("userId"));

        String method = request.getParameter("method");
        if (method.equals("basic")) {
            basicUpdate(request);
        } else if (method.equals("tags")) {
            tagsUpdate(request);
        } else if (method.equals("contact")) {
            contactInfoUpdate(request);
        }

        session.setAttribute("userid", userid);
        request.getRequestDispatcher("/profile.jsp").forward(request, response);
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

    private void basicUpdate(HttpServletRequest request) {
        User userinfo = new User();
        userinfo.setUsername(request.getParameter("username"));
        userinfo.setUid(userid);
        userinfo.setGender(request.getParameter("gender"));
        userinfo.setDetails(request.getParameter("details"));
        UserinfoHelper userinfohp = new UserinfoHelper();
        int status = userinfohp.insertOrUpdateUser("update", userinfo);
        
    }

    private void tagsUpdate(HttpServletRequest request) {
        List<FeedTag> tagsList = new ArrayList<FeedTag>();
        

        String[] tags = request.getParameterValues("tag");
        
        for (String tag : tags) {
            FeedTagId feedTagInfo = new FeedTagId();
            FeedTag feedTag = new FeedTag();
            feedTagInfo.setUserId(userid);
            feedTagInfo.setTag(tag);
            feedTag.setId(feedTagInfo);
            tagsList.add(feedTag);
        }
        FeedTagHelper fdh = new FeedTagHelper();
        fdh.insertFeedTags(userid, tagsList);
        fdh.close();
    }

    private void contactInfoUpdate(HttpServletRequest request) {
        ContactInfo contactinfo = new ContactInfo();
        contactinfo.setCall1(request.getParameter("call1"));
        contactinfo.setCall2(request.getParameter("call2"));
        contactinfo.setText1(request.getParameter("text1"));
        contactinfo.setText2(request.getParameter("text2"));
        contactinfo.setEmail1(request.getParameter("email1"));
        contactinfo.setEmail2(request.getParameter("email2"));
        contactinfo.setUserId(userid);
        UserinfoHelper userinfohp = new UserinfoHelper();
        userinfohp.insertOrUpdateContactinfo(contactinfo);
        userinfohp.close();

    }

}

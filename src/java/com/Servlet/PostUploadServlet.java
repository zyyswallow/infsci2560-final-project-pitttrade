/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.Servlet;

import com.Bean.PostinfoHelper;
import com.POJOs.Post;
import com.Utils.Constant;

import java.io.File;
import java.io.IOException;
import java.util.logging.Level;
import java.util.logging.Logger;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;
import java.sql.Timestamp;
import java.util.Date;

/**
 *
 * @author linxiaohui
 */
@MultipartConfig
public class PostUploadServlet extends HttpServlet {

    private final String relativeWebPath = "/userImages";
    private String filePath;

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

        // upload file
        fileUpload(request);

        //get parameter from http request
        String title = request.getParameter("title").trim();
        String p = request.getParameter("price").trim();
        float price = Float.parseFloat(p);
        String category = request.getParameter("category");
        int condition = Integer.parseInt(request.getParameter("condition"));
        String description = request.getParameter("description").trim();
        String picUrl = request.getContextPath() + relativeWebPath + File.separator + request.getParameter("pic").trim();
        Date date = new Date();
        Timestamp timeStamp = new Timestamp(date.getTime());
        String uid = request.getParameter("userId").trim();

        // build the complete object ... need more info!!
        Post postInfo = new Post();
        postInfo.setTitle(title);
        postInfo.setPrice(price);
        postInfo.setBody(description);
        postInfo.setCondi(condition);
        postInfo.setImgUrl(picUrl);
        postInfo.setType(category);
        postInfo.setCreationTime(timeStamp);
        postInfo.setUserId(Integer.parseInt(uid));

        //insert object into database
        PostinfoHelper postinfoHelper = new PostinfoHelper();
        int insertStatus = postinfoHelper.insertPost(postInfo);

        //use the status code to redirect to different pages
        if (insertStatus == Constant.POST_INSERT_SUCCESS) {
            System.out.println("Success!"); // change print out to redirect or dispatcher to other page
            request.setAttribute("poststatus", "Post Successful");
            getServletContext().getRequestDispatcher("/mypost.jsp?page=0").forward(request, response);
        } else if (insertStatus == Constant.POST_INSERT_ERROR) {
            System.err.println("Fail!");
            request.setAttribute("poststatus", "Post Failed");
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

    private void fileUpload(HttpServletRequest request) {
        filePath = getServletContext().getRealPath(relativeWebPath);
        File file = new File(filePath);
        if (!file.exists()) {
            file.mkdir();
        }
        try {
            Part filePart = request.getPart("file");
            String filename = getFilename(filePart);
            filePart.write(filePath + File.separator + filename);
        } catch (IllegalStateException ise) {
            System.err.println(ise.getMessage());
        } catch (IOException ex) {
            System.err.println(ex.getMessage());
            Logger.getLogger(PostUploadServlet.class.getName()).log(Level.SEVERE, null, ex);
        } catch (ServletException ex) {
            System.err.println(ex.getMessage());
            Logger.getLogger(PostUploadServlet.class.getName()).log(Level.SEVERE, null, ex);
        }

    }

    private String getFilename(Part part) {
        for (String cd : part.getHeader("content-disposition").split(";")) {
            if (cd.trim().startsWith("filename")) {
                String filename = cd.substring(cd.indexOf('=') + 1).trim().replace("\"", "");
                return filename.substring(filename.lastIndexOf('/') + 1).substring(filename.lastIndexOf('\\') + 1);
            }
        }
        return null;
    }

}

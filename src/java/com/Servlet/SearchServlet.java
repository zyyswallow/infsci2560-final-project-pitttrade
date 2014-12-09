/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.Servlet;

import com.Bean.PostinfoHelper;
import com.POJOs.Post;
import com.POJOs.PostSearcher;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author linxiaohui
 */
public class SearchServlet extends HttpServlet {

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
        String title = request.getParameter("title");
        String page = request.getParameter("page");
        String maxPrice = request.getParameter("maxPrice");
        PostSearcher postSearcher = new PostSearcher();
        postSearcher.setMaxPrice(-1);
        postSearcher.setMinPrice(-1);
        if (maxPrice != null && !maxPrice.equals("")) {
            postSearcher.setMaxPrice(Float.valueOf(maxPrice));
        }
        String minPrice = request.getParameter("minPrice");
        if (minPrice != null && !minPrice.equals("")) {
            postSearcher.setMinPrice(Float.valueOf(minPrice));
        }
        String[] types = request.getParameterValues("category");
        postSearcher.setTypes(types);
        if (title != null && !title.equals("")) {
            postSearcher.setTitle(title);
        }
        PostinfoHelper postinfoHelper = new PostinfoHelper();
        List<Post> postList = new  ArrayList<Post>();
        postList = postinfoHelper.searchByCriteria(postSearcher, Integer.parseInt(page));
        request.setAttribute("postList", postList);
        request.setAttribute("maxPage", postinfoHelper.getMaxPage());
        getServletContext().getRequestDispatcher("/search.jsp?page="+page).forward(request, response);

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

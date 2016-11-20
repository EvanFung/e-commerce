/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package ict.servlet;

import ict.bean.ProductBean;
import ict.db.ProductDB;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.*;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author Chris
 */
@WebServlet(name = "ListHandler", urlPatterns = {"/ListHandler"})
public class ListHandler extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    private ProductDB db;
    
    public void init(){
        String username = this.getServletContext().getInitParameter("dbUser");
        String password = this.getServletContext().getInitParameter("dbPassword");
        String url = this.getServletContext().getInitParameter("dbUrl");
        db = new ProductDB(url, username, password);
    }
    
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
          if (request.getParameter("action").equals("all") || request.getParameter("action").equals("")){
              showProduct(db.getAllProduct(), response);
          }else{
              showProduct(db.getProductBySearchKey(request.getParameter("action")), response);
          }
    }

    public void showProduct(ArrayList <ProductBean> allProducts, HttpServletResponse response) throws IOException{
        String responseData ="";
        response.setContentType("text/html");
        int count = 0;
        ArrayList <ProductBean> allProduct = allProducts; 
        if (allProduct.size()!=0){
            for (ProductBean i : allProduct){
                if (count % 4 == 0){
                    responseData +="<div class='row-fluid'>"
                                               +"<ul class='thumbnails'>"
                                               +"<li class='span3'>"
                                               +"<div class='thumbnail'>"
                                               +"<img alt='300x200' src='img/product/" + i.getImage() + "'>"
                                               +"<div class='caption'>"
                                               +"<h3>" + i.getName() + "</h3>"
                                               +"<p>" + i.getDescription() + "</p>"
                                               +"<p><a href='checkout?id=" + i.getId() + "'class='btn btn-primary'>Add To Cart</a>&nbsp;<a href='view?id=" + i.getId() +"' class='btn'>View</a></p>" 
                                               +"</div>"
                                               +"</div>"
                                               +"</li>";
                }else{
                   responseData +="<li class='span3'>"
                                               +"<div class='thumbnail'>"
                                               +"<img alt='300x200' src='img/product/" + i.getImage() + "'>"
                                               +"<div class='caption'>"
                                               +"<h3>" + i.getName() + "</h3>"
                                               +"<p>" + i.getDescription() + "</p>"
                                               +"<p><a href='checkout?id=" + i.getId() + "'class='btn btn-primary'>Add To Cart</a>&nbsp;<a href='view?id=" + i.getId() +"' class='btn'>View</a></p>" 
                                               +"</div>"
                                               +"</div>"
                                               +"</li>";
                }

                if ((count + 1) % 4 ==0 || allProduct.size() == count){
                    responseData += "</ul>"
                                    +"</div>";
                }
                
                count ++;
            }
            response.getWriter().write(responseData);
        }else{
            response.getWriter().write("<p><b>No result</b></p>");
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

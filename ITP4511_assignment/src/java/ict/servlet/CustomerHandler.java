/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package ict.servlet;

import ict.bean.CustomerBean;
import ict.db.CustomerDB;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author ccwai
 */
@WebServlet(name = "CustomerHandler", urlPatterns = {"/customerHandler"})
public class CustomerHandler extends HttpServlet {
private CustomerDB db; 
public void init() {
//1. obtain the context-param, dbUser, dbPassword and dbUrl which defined in
        String username = this.getServletContext().getInitParameter("dbUser");
        String password = this.getServletContext().getInitParameter("dbPassword");
        String url = this.getServletContext().getInitParameter("dbUrl");
//2. create a new db object with the parameter
        db = new CustomerDB(url,username,password);
        //db.addCustomer("123456", "abc@gmail.com", "Peter", "Walker", "M", "100", "Hong Kong");
} 
    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request,
    HttpServletResponse response) throws ServletException, IOException {
    String action = request.getParameter("action");
    
     if ("list".equalsIgnoreCase(action)) {
     String email = request.getParameter("email");
     // call the query db to get retrieve for all customer
     CustomerBean member = db.queryCustByEmail(email);
    // set the result into the attribute
     request.setAttribute("customer", member);
    // redirect the result to the listCustomers.jsp
     RequestDispatcher rd;
     rd = getServletContext().getRequestDispatcher("/member.jsp");
     rd.forward(request, response);
     } else if("edit".equalsIgnoreCase(action)){
    String pwd = request.getParameter("password");
    String email = request.getParameter("email");
         db.editPassword(email, pwd);
        // call the query db to get retrieve for all customer
        CustomerBean member = db.queryCustByEmail(email);
        // set the result into the attribute
        request.setAttribute("customer", member);
        // redirect the result to the listCustomers.jsp              
     RequestDispatcher rd;
     rd = getServletContext().getRequestDispatcher("/member.jsp");
     rd.forward(request, response);        
     }else if("update".equalsIgnoreCase(action)){
    String country = request.getParameter("country");
    String street = request.getParameter("street");
    String building = request.getParameter("building");
    String address = building+", "+street+", "+country;
    String email = request.getParameter("email");
         db.editAddress(email, address);
        // call the query db to get retrieve for all customer
        CustomerBean member = db.queryCustByEmail(email);
        // set the result into the attribute
        request.setAttribute("customer", member);
        // redirect the result to the listCustomers.jsp              
     RequestDispatcher rd;
     rd = getServletContext().getRequestDispatcher("/member.jsp");
     rd.forward(request, response);        
     }
     //else {
     //PrintWriter out = response.getWriter();
     //out.println("No such action!!!");
     //}
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
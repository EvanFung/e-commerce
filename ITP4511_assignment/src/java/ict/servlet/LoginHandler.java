/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package ict.servlet;

import ict.db.CustomerDB;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author Chris
 */
@WebServlet(name = "LoginHandler", urlPatterns = {"/login"})
public class LoginHandler extends HttpServlet {

    private CustomerDB db;

    public void init() {
        String username = this.getServletContext().getInitParameter("dbUser");
        String password = this.getServletContext().getInitParameter("dbPassword");
        String url = this.getServletContext().getInitParameter("dbUrl");
        db = new CustomerDB(url, username, password);
        try {
            db.createCustTable();
        } catch (SQLException ex) {
            Logger.getLogger(LoginHandler.class.getName()).log(Level.SEVERE, null, ex);
        } catch (IOException ex) {
            Logger.getLogger(LoginHandler.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String username = request.getParameter("username");
        String password = request.getParameter("password");
        String targetURL;
        if (db.login(username, password)) {
            Cookie cookie_username = new Cookie("username", username);
            Cookie cookie_password = new Cookie("password", password);
            response.addCookie(cookie_username);
            response.addCookie(cookie_password);
            response.setContentType("text/html;charset=UTF-8");
            response.getWriter().write("True");
            targetURL = "/logined.jsp";
        } else {
            response.setContentType("text/plain");
            response.getWriter().write("Login Details Incorrect. Please try again.");
            targetURL = "/index.jsp";
        }

        //forward to desire page
        RequestDispatcher rd;
        rd = getServletContext().getRequestDispatcher("/" + targetURL);
        rd.forward(request, response);
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }
}

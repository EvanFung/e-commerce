<%-- 
    Document   : member
    Created on : 2016/11/21, 上午 11:05:04
    Author     : ccwai
--%>

<%@page import="ict.bean.CustomerBean"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <h1>Hello World!</h1>
        <%
        CustomerBean customers = (CustomerBean)request.getAttribute("customers");
        out.println("<h1>Customers</h1>");
        out.println("<table border='1' >");
        out.println("<tr>");
        out.println("<th>Email</th> <th> First </th><th> Last</th><th> Password</th ><th> Address</th ><th> Gender</th >");
        out.println("</tr>");
        // loop through the customer array to display each customer record
        out.println("<tr>");
        out.println("<td>" + customers.getEmail() + "</td>");
        out.println("<td>" + customers.getFirst_name() + "</td>");
        out.println("<td>" + customers.getLast_name() + "</td>");
        out.println("<td>" + customers.getPassword() + "</td>");
        out.println("<td>" + customers.getAddress() + "</td>");
        out.println("<td>" + customers.getGender() + "</td>");
        out.println("</tr>");
        out.println("</table>");
        %>
        <form method="post" action="customerHandler">
                    <input type="hidden" name="action" value="edit"/>
                    email:<input type="hidden" name="email" value="abc@gmail.com" />
                    Password:<input type="text" name="password" />
                    <input type="submit" />
        </form>
        <form method="post" action="customerHandler">
                    <input type="hidden" name="action" value="update"/>
                    email:<input type="hidden" name="email" value="abc@gmail.com" />
                    address<input type="text" name="address" />
                    <input type="submit" />
        </form>
    </body>
</html>

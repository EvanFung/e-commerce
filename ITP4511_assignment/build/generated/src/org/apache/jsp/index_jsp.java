package org.apache.jsp;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;
import ict.servlet.LoginHandler;
import java.io.IOException;
import java.util.logging.Logger;
import java.util.logging.Level;
import java.sql.SQLException;
import ict.db.ProductDB;
import java.util.ArrayList;
import ict.bean.ProductBean;

public final class index_jsp extends org.apache.jasper.runtime.HttpJspBase
    implements org.apache.jasper.runtime.JspSourceDependent {


    private ProductDB db;
    
    public void init(){
        String username = this.getServletContext().getInitParameter("dbUser");
        String password = this.getServletContext().getInitParameter("dbPassword");
        String url = this.getServletContext().getInitParameter("dbUrl");
        db = new ProductDB(url, username, password);
        try {
            db.createCustTable();
            //Test data
/*
            db.addProduct("Product1", "Product1", "123", "Red,Green", "M/L", "Channel", "1.jpg");
            db.addProduct("Product2", "Product2", "123", "Red,Green", "M/L", "Channel", "2.jpg");
            db.addProduct("Product3", "Product3", "123", "Red,Green", "M/L", "Channel", "3.jpg");
            db.addProduct("Product4", "Product2", "123", "Red,Green", "M/L", "Channel", "4.jpg");
            db.addProduct("Product5", "Product3", "123", "Red,Green", "M/L", "Channel", "5.jpg");
            db.addProduct("Product5", "Product3", "123", "Red,Green", "M/L", "Channel", "5.jpg");
*/
        } catch (SQLException ex) {
            Logger.getLogger(LoginHandler.class.getName()).log(Level.SEVERE, null, ex);
        } catch (IOException ex) {
            Logger.getLogger(LoginHandler.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

  private static final JspFactory _jspxFactory = JspFactory.getDefaultFactory();

  private static java.util.List<String> _jspx_dependants;

  private org.glassfish.jsp.api.ResourceInjector _jspx_resourceInjector;

  public java.util.List<String> getDependants() {
    return _jspx_dependants;
  }

  public void _jspService(HttpServletRequest request, HttpServletResponse response)
        throws java.io.IOException, ServletException {

    PageContext pageContext = null;
    HttpSession session = null;
    ServletContext application = null;
    ServletConfig config = null;
    JspWriter out = null;
    Object page = this;
    JspWriter _jspx_out = null;
    PageContext _jspx_page_context = null;

    try {
      response.setContentType("text/html");
      pageContext = _jspxFactory.getPageContext(this, request, response,
      			null, true, 8192, true);
      _jspx_page_context = pageContext;
      application = pageContext.getServletContext();
      config = pageContext.getServletConfig();
      session = pageContext.getSession();
      out = pageContext.getOut();
      _jspx_out = out;
      _jspx_resourceInjector = (org.glassfish.jsp.api.ResourceInjector) application.getAttribute("com.sun.appserv.jsp.resource.injector");

      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("<!DOCTYPE html>\n");
      out.write("\n");
      out.write("<html lang=\"en\">\n");
      out.write("<head>\n");
      out.write("    <meta charset=\"utf-8\">\n");
      out.write("    <title>Electronic commerce</title>\n");
      out.write("    <style>\n");
      out.write("        .carousel-inner > .item > img,\n");
      out.write("        .carousel-inner > .item > a > img {\n");
      out.write("            width: 70%;\n");
      out.write("            margin: auto;\n");
      out.write("        }\n");
      out.write("    </style>\n");
      out.write("    <link href=\"http://netdna.bootstrapcdn.com/twitter-bootstrap/2.3.2/css/bootstrap-combined.min.css\" rel=\"stylesheet\">\n");
      out.write("    <script src=\"http://code.jquery.com/jquery.js\"></script>\n");
      out.write("    <script src=\"http://netdna.bootstrapcdn.com/twitter-bootstrap/2.3.2/js/bootstrap.min.js\"></script>\n");
      out.write("    <script src=\"https://code.jquery.com/ui/1.12.1/jquery-ui.js\"></script>\n");
      out.write("    <script src=\"js/register.js\"></script>\n");
      out.write("\n");
      out.write("    <link href=\"css/bootstrap-responsive.css\" rel=\"stylesheet\">\n");
      out.write("    <link href=\"css/style.css\" rel=\"stylesheet\">\n");
      out.write("    <link href=\"css/custom.css\" rel=\"stylesheet\">\n");
      out.write("    <link href=\"css/registration.css\" rel=\"stylesheet\">\n");
      out.write("    <!-- HTML5 shim, for IE6-8 support of HTML5 elements -->\n");
      out.write("    <!--[if lt IE 9]>\n");
      out.write("    <script src=\"http://cdnjs.cloudflare.com/ajax/libs/html5shiv/3.7.2/html5shiv.js\"></script>\n");
      out.write("    <![endif]-->\n");
      out.write("    <script>\n");
      out.write("        $(document).ready(function(){\n");
      out.write("           $(\".container\").hide();\n");
      out.write("           $(\".container\").fadeIn('slow');\n");
      out.write("        });\n");
      out.write("    </script>\n");
      out.write("</head>\n");
      out.write("\n");
      out.write("<body>\n");
 init(); 
      out.write("\n");
      out.write("\n");
      out.write("<div class=\"container\">\n");
      out.write("    <!--Header -->\n");
      out.write("    ");
      org.apache.jasper.runtime.JspRuntimeLibrary.include(request, response, "header.jsp", out, false);
      out.write("\n");
      out.write("    <!--Finish Header -->\n");
      out.write("    \n");
      out.write("    <!-- Jumbotron -->\n");
      out.write("    <div class=\"jumbotron\">\n");
      out.write("        <h1>Latest News</h1>\n");
      out.write("        <p class=\"lead\">IVE Students - Buy one get one today!</p>\n");
      out.write("        <a class=\"btn btn-large btn-success\" href=\"list.jsp\">Show Products</a>\n");
      out.write("    </div>\n");
      out.write("\n");
      out.write("    <hr>\n");
      out.write("    <!-- Example row of columns -->\n");
      out.write("    ");
 
        int count = 0;
        ArrayList <ProductBean> allProduct = db.getAllProduct(); 
        
        if (allProduct.size()!=0){
            for (ProductBean i : allProduct){
                if (count % 3 == 0){
                    out.print("<div class='row-fluid'>");
                    out.print("<ul class='thumbnails'>");
                    out.print("<li class='span4'>");
                    out.print("<div class='thumbnail'>");
                    out.print("<img alt='300x200' src='img/product/" + i.getImage() + "'>");
                    out.print("<div class='caption'>");
                    out.print("<h3>" + i.getName() + "</h3>");
                    out.print("<p>" + i.getDescription() + "</p>");
                    out.print("<p><a href='checkout?id=" + i.getId() + "'class='btn btn-primary'>Add To Cart</a><a href='view.html' class='btn'>View</a></p>"); 
                    out.print("</div>");
                    out.print("</div>");
                    out.print("</li>");
                }else{
                    out.print("<li class='span4'>");
                    out.print("<div class='thumbnail'>");
                    out.print("<img alt='300x200' src='img/product/" + i.getImage() + "'>");
                    out.print("<div class='caption'>");
                    out.print("<h3>" + i.getName() + "</h3>");
                    out.print("<p>" + i.getDescription() + "</p>");
                    out.print("<p><a href='checkout?id=" + i.getId() + "'class='btn btn-primary'>Add To Cart</a><a href='view.html' class='btn'>View</a></p>"); 
                    out.print("</div>");
                    out.print("</div>");
                    out.print("</li>");
                }

                if ((count + 1) % 3 ==0 || allProduct.size() == count){
                    out.print("</ul>");
                    out.print("</div>");
                }
                
                count ++;
            }
        }
    
      out.write("\n");
      out.write("    <hr/>\n");
      out.write("</div> <!-- /container -->\n");
      out.write("\n");
      out.write("</body>\n");
      out.write("</html>\n");
    } catch (Throwable t) {
      if (!(t instanceof SkipPageException)){
        out = _jspx_out;
        if (out != null && out.getBufferSize() != 0)
          out.clearBuffer();
        if (_jspx_page_context != null) _jspx_page_context.handlePageException(t);
        else throw new ServletException(t);
      }
    } finally {
      _jspxFactory.releasePageContext(_jspx_page_context);
    }
  }
}

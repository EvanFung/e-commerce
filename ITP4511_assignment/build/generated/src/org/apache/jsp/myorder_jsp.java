package org.apache.jsp;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;
import ict.servlet.LoginHandler;
import java.io.IOException;
import java.util.logging.Logger;
import java.util.logging.Level;
import java.sql.SQLException;
import ict.db.*;
import java.util.ArrayList;
import ict.bean.*;

public final class myorder_jsp extends org.apache.jasper.runtime.HttpJspBase
    implements org.apache.jasper.runtime.JspSourceDependent {


    private Order_ProductDB opDB;
    private OrderDB oDB;
    private CustomerDB ddb;

    public void init() {
        String username = this.getServletContext().getInitParameter("dbUser");
        String password = this.getServletContext().getInitParameter("dbPassword");
        String url = this.getServletContext().getInitParameter("dbUrl");
        opDB = new Order_ProductDB(url, username, password);
        oDB = new OrderDB(url, username, password);
        ddb = new CustomerDB(url, username, password);
    }

    String getCookieValue(Cookie[] cookies, String cookieName) {
        String cookieValue = "";
        Cookie cookie;
        if (cookies != null) {
            for (int i = 0; i < cookies.length; i++) {
                cookie = cookies[i];
                if (cookieName.equals(cookie.getName())) {
                    cookieValue = cookie.getValue();
                }
            }
        }
        return cookieValue;
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
      response.setContentType("text/html;charset=UTF-8");
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
      out.write("\n");
      out.write("\n");
      out.write("<!DOCTYPE html>\n");
      out.write("<html>\n");
      out.write("    <head>\n");
      out.write("        <meta charset=\"utf-8\">\n");
      out.write("        <title>Electronic commerce</title>\n");
      out.write("        <link href=\"http://netdna.bootstrapcdn.com/twitter-bootstrap/2.3.2/css/bootstrap-combined.min.css\" rel=\"stylesheet\">\n");
      out.write("        <script src=\"http://code.jquery.com/jquery.js\"></script>\n");
      out.write("        <script src=\"http://netdna.bootstrapcdn.com/twitter-bootstrap/2.3.2/js/bootstrap.min.js\"></script>\n");
      out.write("        <script src=\"https://code.jquery.com/ui/1.12.1/jquery-ui.js\"></script>\n");
      out.write("        <script src=\"js/register.js\"></script>\n");
      out.write("\n");
      out.write("        <link href=\"css/bootstrap-responsive.css\" rel=\"stylesheet\">\n");
      out.write("        <link href=\"css/style.css\" rel=\"stylesheet\">\n");
      out.write("        <link href=\"css/custom.css\" rel=\"stylesheet\">\n");
      out.write("        <link href=\"css/registration.css\" rel=\"stylesheet\">\n");
      out.write("        <!-- HTML5 shim, for IE6-8 support of HTML5 elements -->\n");
      out.write("        <!--[if lt IE 9]>\n");
      out.write("        <script src=\"http://cdnjs.cloudflare.com/ajax/libs/html5shiv/3.7.2/html5shiv.js\"></script>\n");
      out.write("        <![endif]-->\n");
      out.write("        <script>\n");
      out.write("            $(document).ready(function () {\n");
      out.write("                $(\".container\").hide();\n");
      out.write("                $(\".container\").fadeIn('slow');\n");
      out.write("\n");
      out.write("                $(\"#removeProduct\").click(function () {\n");
      out.write("                    $(\".productItem-1\").remove();\n");
      out.write("                });\n");
      out.write("            });\n");
      out.write("        </script>\n");
      out.write("    </head>\n");
      out.write("    <body>\n");
      out.write("        <div class=\"container\">\n");
      out.write("            ");
      org.apache.jasper.runtime.JspRuntimeLibrary.include(request, response, "header.jsp", out, false);
      out.write("\n");
      out.write("\n");
      out.write("            <div style=\"height: 50px\"></div>\n");
      out.write("            <div class=\"row-fluid\">\n");
      out.write("                <div class=\"span12\">\n");
      out.write("                    <h1>Checkout</h1>\n");
      out.write("                </div>\n");
      out.write("            </div>\n");
      out.write("\n");
      out.write("            <div class=\"row-fluid\">\n");
      out.write("                <div class=\"span12\">\n");
      out.write("                    <div class=\"block\">\n");
      out.write("                        <div class=\"navbar navbar-inner block-header\">\n");
      out.write("                            <div class=\"muted pull-left\">My Cart</div>\n");
      out.write("                            <div class=\"pull-right\"><span class=\"muted\">small message</span></div>\n");
      out.write("                        </div>\n");
      out.write("                        <div class=\"block-content collapse in\">\n");
      out.write("                            <div class=\"span12\">\n");
      out.write("                                <div class=\"alert alert-warning\">\n");
      out.write("                                    <h4>Warning!</h4>\n");
      out.write("                                    <p>ABC</p>\n");
      out.write("                                </div>\n");
      out.write("                                <table class=\"table table-striped table-hover\">\n");
      out.write("                                    <tr>\n");
      out.write("                                        <th>Image</th>\n");
      out.write("                                        <th>Title</th>\n");
      out.write("                                        <th>Price</th>\n");
      out.write("                                        <th>Quantity</th>\n");
      out.write("                                        <th>Total</th>\n");
      out.write("                                    </tr>\n");
      out.write("\n");
      out.write("                                    ");
                 //find the custid
                                        int custid = ddb.getCustIdByEmail(getCookieValue(request.getCookies(), "username"));
                                        System.out.println(custid);
                                        //find the order
                                        ArrayList<OrderBean> obs = oDB.queryMyOrdersWithNoCheck(custid);
                                        
                                    
      out.write("\n");
      out.write("                                    <tr class=\"productItem-1\">\n");
      out.write("                                        <td class=\"span1\"><a href='javascript:;'><img src='img/product/' /></a></td>\n");
      out.write("                                        <td class=\"span5\">\n");
      out.write("                                        </td>\n");
      out.write("                                        <td class=\"span2\">$12.99</td>\n");
      out.write("                                        <td class=\"span2\">\n");
      out.write("                                            <div class=\"row-fluid\">\n");
      out.write("                                                <div class=\"span7\">\n");
      out.write("                                                    <input type=\"text\" id=\"name\" value=\"1\" placeholder=\"Qnt.\" class=\"input-mini\">\n");
      out.write("                                                </div>\n");
      out.write("                                                <div class=\"span5\">\n");
      out.write("                                                    <button type=\"submit\" class=\"btn btn-danger btn-mini\" id=\"removeProduct\"><i class=\"icon-remove icon-white\"></i></button>\n");
      out.write("                                                </div>\n");
      out.write("                                            </div>\n");
      out.write("                                        </td>\n");
      out.write("                                        <td class=\"span1\">$12.99</td>\n");
      out.write("                                    </tr>\n");
      out.write("                                    <tr>\n");
      out.write("                                        <th colspan=\"4\"></th>\n");
      out.write("                                        <th>$");
out.print("total price");
      out.write("</th>\n");
      out.write("                                    </tr>\n");
      out.write("                                </table>\n");
      out.write("                                <hr />\n");
      out.write("                                <div class=\"row-fluid\">\n");
      out.write("                                    <div class=\"span6\">\n");
      out.write("                                        <div class=\"row-fluid\">\n");
      out.write("                                            <div class=\"span3\">\n");
      out.write("                                                <label for=\"coupon\">Coupon Code</label>\n");
      out.write("                                            </div>\n");
      out.write("                                            <div class=\"span6\">\n");
      out.write("                                                <input type=\"text\" id=\"coupon\" value=\"\" placeholder=\"Coupon Code\" class=\"input-small\">\n");
      out.write("                                            </div>\n");
      out.write("                                        </div>\n");
      out.write("                                    </div>\n");
      out.write("                                    <div class=\"span6\">\n");
      out.write("                                        <div class=\"pull-right\">\n");
      out.write("                                            <button class=\"btn btn-primary\">Update Cart</button>\n");
      out.write("                                        </div>\n");
      out.write("                                    </div>\n");
      out.write("                                </div>\n");
      out.write("                            </div>\n");
      out.write("                        </div>\n");
      out.write("                    </div>\n");
      out.write("                </div>\n");
      out.write("            </div><!--end of row-->\n");
      out.write("            <div class=\"row-fluid\">\n");
      out.write("                <div class=\"span4\">\n");
      out.write("                    <div class=\"block\">\n");
      out.write("                        <div class=\"navbar navbar-inner block-header\">\n");
      out.write("                            <div class=\"muted pull-left\">Order Status</div>\n");
      out.write("                            <div class=\"pull-right\">Where is my order?</div>\n");
      out.write("                        </div>\n");
      out.write("                        <div class=\"block-content collapse in\">\n");
      out.write("                            <form class=\"form-horizontal\">\n");
      out.write("                                <div class=\"control-group\">\n");
      out.write("                                    <label for=\"date\">Change Deliever date <span class=\"text-error\">*</span></label>\n");
      out.write("                                    <input type=\"date\" id=\"date\"/>\n");
      out.write("                                </div>\n");
      out.write("                                <hr>\n");
      out.write("                                <div class=\"form-group\">\n");
      out.write("                                    <label for=\"doption\">Deliever option</label>\n");
      out.write("                                    <select class=\"form-control\" id=\"doption\">\n");
      out.write("                                        <option>self-pickup</option>\n");
      out.write("                                        <option>deliever</option>\n");
      out.write("                                    </select>\n");
      out.write("                                </div>\n");
      out.write("                                <hr>\n");
      out.write("                                <div class=\"control-group\">\n");
      out.write("                                    <div class=\"controls\">\n");
      out.write("                                        <button type=\"submit\" class=\"btn btn-primary\">Submit</button>\n");
      out.write("                                    </div>\n");
      out.write("                                </div>\n");
      out.write("                            </form>\n");
      out.write("                        </div>\n");
      out.write("                    </div>\n");
      out.write("                </div>\n");
      out.write("                <div class=\"span8\">\n");
      out.write("                    <div class=\"block\">\n");
      out.write("                        <div class=\"navbar navbar-inner block-header\">\n");
      out.write("                            <div class=\"muted pull-left\">Order Status</div>\n");
      out.write("                            <div class=\"pull-right\">Where is my order?</div>\n");
      out.write("                        </div>\n");
      out.write("                        <div class=\"block-content collapse in\">\n");
      out.write("\n");
      out.write("                        </div>\n");
      out.write("                    </div>\n");
      out.write("                </div>\n");
      out.write("            </div>\n");
      out.write("        </div>\n");
      out.write("    </body>\n");
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

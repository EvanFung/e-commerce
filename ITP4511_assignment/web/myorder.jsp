<%@page import="ict.servlet.LoginHandler"%>
<%@page import="java.io.IOException"%>
<%@page import="java.util.logging.Logger"%>
<%@page import="java.util.logging.Level"%>
<%@page import="java.sql.SQLException"%>
<%@page import="ict.db.*"%>
<%@page import="java.util.ArrayList"%>
<%@page import="ict.bean.*"%>
<%!
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

    void deleteCookie(HttpServletRequest request, HttpServletResponse response) {
        for (Cookie cookie : request.getCookies()) {
            cookie.setValue("");
            cookie.setMaxAge(0);
            cookie.setPath("/");

            response.addCookie(cookie);
        }

    }
%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="utf-8">
        <title>Electronic commerce</title>
        <link href="http://netdna.bootstrapcdn.com/twitter-bootstrap/2.3.2/css/bootstrap-combined.min.css" rel="stylesheet">
        <script src="http://code.jquery.com/jquery.js"></script>
        <script src="http://netdna.bootstrapcdn.com/twitter-bootstrap/2.3.2/js/bootstrap.min.js"></script>
        <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
        <script src="js/register.js"></script>

        <!--data table with sorting-->
        <script src="https://cdn.datatables.net/1.10.12/js/dataTables.bootstrap.min.js"></script>
        <script src="https://cdn.datatables.net/1.10.12/js/jquery.dataTables.min.js"></script>
        <link href="https://cdn.datatables.net/1.10.12/css/jquery.dataTables.min.css" rel="stylesheet">

        <link href="css/bootstrap-responsive.css" rel="stylesheet">
        <link href="css/style.css" rel="stylesheet">
        <link href="css/custom.css" rel="stylesheet">
        <link href="css/registration.css" rel="stylesheet">
        <!-- HTML5 shim, for IE6-8 support of HTML5 elements -->
        <!--[if lt IE 9]>
        <script src="http://cdnjs.cloudflare.com/ajax/libs/html5shiv/3.7.2/html5shiv.js"></script>
        <![endif]-->
        <script>
            $(document).ready(function () {
                $('#order').DataTable();
                $('#product').DataTable();
                $(".container").hide();
                $(".container").fadeIn('slow');
            });
        </script>
    </head>
    <body>
        <div class="container">
            <jsp:include page="header.jsp" />
            <div style="height:50px"></div>
            <div class="row-fluid">
                <div class="block">
                    <div class="navbar navbar-inner block-header">
                        <div class="muted pull-left">Order Status</div>
                        <div class="pull-right">Check your order history</div>
                    </div>
                    <div class="block-content collapse in">
                        <div class="span12">
                            <div class="alert alert-info">Welcome to IVE E-COMMERCE</div>


                            <form class="form-horizontal">
                                <div class='root-template'>
                                    <table class="table table-striped table-bordered table-hover" cellspacing="0" width="100%" id="order">
                                        <thead>
                                        <th colspan="8"><h1>Your Order History(only show latest 10)</h1></th>
                                        <tr>
                                            <td>order_id</td>
                                            <td>order_qty</td>
                                            <td>deliever_time</td>
                                            <td>deliever_date</td>
                                            <td>deliever_add</td>
                                            <td>order_state</td>
                                            <td>order_option</td>
                                            <td>Client name</td>
                                        </tr>
                                        </thead>
                                        <tbody>  
                                            <%
                                                ArrayList<OrderBean> obs = (ArrayList) request.getAttribute("orderbean");
                                                int count = 0;
                                                for (OrderBean ob : obs) {
                                                    out.print("<tr>");
                                                    out.print("<td>" + ob.getOrder_id() + "</td>");
                                                    out.print("<td>" + ob.getOrder_qty() + "</td>");
                                                    out.print("<td>" + ob.getDeliever_time() + "</td>");
                                                    out.print("<td>" + ob.getDeliever_date() + "</td>");
                                                    out.print("<td>" + ob.getOrder_state() + "</td>");
                                                    out.print("<td>" + ob.getOrder_option() + "</td>");
                                                    out.print("<td>" + ob.getOrder_state() + "</td>");
                                                    out.print("<td>" + ob.getCustomer().getEmail() + "</td>");
                                                    if (count > 10) {
                                                        break;
                                                    }
                                                    out.print("</tr>");
                                                }
                                            %>
                                        </tbody>
                                    </table>
                                </div>
                                <br />
                            </form>
                        </div>
                    </div>
                </div>
            </div>
            <!--another table -->                          
            <div class="row-fluid">
                <div class="block">
                    <div class="navbar navbar-inner block-header">
                        <div class="muted pull-left">Order Status</div>
                        <div class="pull-right">Check your order history</div>
                    </div>
                    <div class="block-content collapse in">
                        <div class="span12">
                            <div class="alert alert-info">Welcome to IVE E-COMMERCE</div>
                            <form class="form-horizontal">
                                <div class='root-template'>
                                    <table class="table table-striped table-bordered" cellspacing="0" width="100%" id="product">
                                        <thead>
                                        <th colspan="8"><h1>Check what products you have bought</h1></th>
                                        <tr>
                                            <td>product id</td>
                                            <td>product name</td>
                                            <td>descriptions</td>
                                            <td>price</td>
                                            <td>color</td>
                                            <td>size</td>
                                            <td>brand</td>
                                            <td>cat_id</td>
                                            <td>desiner name</td>
                                            <td>p_qty</td>
                                        </tr>
                                        </thead>
                                        <tbody>  
                                            <%
                                                for (OrderBean ob : obs) {
                                                    ArrayList<ProductBean> ps = ob.getProducts();
                                                    for (ProductBean p : ps) {
                                                        out.print("<tr>");
                                                        out.print("<td>" + p.getP_id() + "</td>");
                                                        out.print("<td>" + p.getP_name() + "</td>");
                                                        out.print("<td>" + p.getDescriptions() + "</td>");
                                                        out.print("<td>" + p.getPrice() + "</td>");
                                                        out.print("<td>" + p.getColor() + "</td>");
                                                        out.print("<td>" + p.getSize() + "</td>");
                                                        out.print("<td>" + p.getBrand() + "</td>");
                                                        out.print("<td>" + p.getCat_id() + "</td>");
                                                        out.print("<td>" + p.getDesigner_name() + "</td>");
                                                        out.print("<td>" + p.getP_qty() + "</td>");
                                                        out.print("</tr>");
                                                    }
                                                }
                                            %>
                                        </tbody>
                                    </table>
                                </div>
                                <br />
                            </form>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </body>
</html>

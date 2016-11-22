<%-- 
    Document   : managerorder
    Created on : Nov 22, 2016, 3:42:45 PM
    Author     : 324W7
--%>

<%@page import="ict.bean.OrderBean"%>
<%@page import="java.util.ArrayList"%>
<%@page import="ict.db.OrderDB"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%! //<-- See now I am using Declaration, not Scriptlet

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
<%@page import="ict.bean.CustomerBean"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <title>Electronic commerce</title>
        <!-- HTML5 shim, for IE6-8 support of HTML5 elements -->
        <link href="http://netdna.bootstrapcdn.com/twitter-bootstrap/2.3.2/css/bootstrap-combined.min.css" rel="stylesheet">
        <script src="http://code.jquery.com/jquery.js"></script>
        <script src="http://netdna.bootstrapcdn.com/twitter-bootstrap/2.3.2/js/bootstrap.min.js"></script>
        <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>


        <script src="https://cdn.datatables.net/1.10.12/js/dataTables.bootstrap.min.js"></script>
        <script src="https://cdn.datatables.net/1.10.12/js/jquery.dataTables.min.js"></script>
        <link href="https://cdn.datatables.net/1.10.12/css/jquery.dataTables.min.css" rel="stylesheet">

        <script src="js/register.js"></script>
        <link href="css/bootstrap-responsive.css" rel="stylesheet">
        <link href="css/style.css" rel="stylesheet">
        <link href="css/custom.css" rel="stylesheet">
        <link href="css/registration.css" rel="stylesheet">
        <script>
            $(document).ready(function () {
                $('#example').DataTable();

                $('#remove').change(function () {
                    $.ajax({
                        type: 'POST',
                        url: 'ManagerOrderHandler',
                        data: {
                            "action": "remove"
                        },
                        success: function (responseText) {
                            $("#alert").innerHTML(responseText);
                            $("#alert").show();
                        },
                    });
                });
            });
        </script>
    </head>
    <%
        OrderBean o = (OrderBean) request.getAttribute("orderbean");
    %>
    <body>
        <div class="container">
            <!--import header-->
            <jsp:include page="header.jsp" />
            <!--End-->
            <hr>
            <!--Check cookies-->
            <%
                if (getCookieValue(request.getCookies(), "username") == "") {

            %>
            <script type="text/javascript">
                window.location.href = "./index.jsp"
            </script>
            <% } else { %>

            <%
                if (o != null) {
            %>
            <div class="row-fluid">
                <div class="block">
                    <div class="navbar navbar-inner block-header">
                        <div class="muted pull-left">Order Placement</div>
                        <div class="pull-right">Add Items to your order</div>
                    </div>
                    <div class="block-content collapse in">
                        <div class="span12">
                            <div class="alert alert-info" id="alert">Some message to show during the order placement </div>


                            <form class="form-horizontal">

                                <div class='root-template'>
                                    <table class="table table-bordered">
                                        <tr>
                                            <th>Order ID</th>
                                            <th>Deliever Date</th>
                                            <th>Order Option</th>
                                            <th>Order Status</th>
                                            <th>Cancel Order</th>
                                        </tr>
                                        <tr>
                                            <td style="vertical-align:middle;">
                                                <%out.print(o.getOrder_id());%>
                                            </td>
                                            <td>
                                                <input type="date" style="margin-top:8px" value="<%out.print(o.getDeliever_date());%>"/>
                                            </td>
                                            <td>
                                                <select name="">
                                                    <option value="delivery"
                                                            <%if (o.getOrder_option().equalsIgnoreCase("delivery")) {
                                                                    out.print("selected");
                                                                }%>
                                                            >Delivery</option>
                                                    <option value="self-pickedup" 
                                                            <%if (o.getOrder_option().equalsIgnoreCase("self-pickedup")) {
                                                                    out.print("selected");
                                                                }%>
                                                            >Self-picked-up</option>
                                                </select>
                                            </td>
                                            <td>
                                                <select name="">
                                                    <option value="canceled" name="option"
                                                            <%if (o.getOrder_option().equalsIgnoreCase("Canceled")) {
                                                                    out.print("selected");
                                                                }%>
                                                            >Canceled</option>
                                                    <option value="pickedup" name="option"
                                                            <%if (o.getOrder_option().equalsIgnoreCase("Delivered")) {
                                                                    out.print("selected");
                                                                }%>
                                                            >Delivered</option>
                                                    <option value="pickedup" name="option"
                                                            <%if (o.getOrder_option().equalsIgnoreCase("picked-up")) {
                                                                    out.print("selected");
                                                                }%>
                                                            >Picked-up</option>
                                                    <option value="pickedup"  name="option"
                                                            <%if (o.getOrder_option().equalsIgnoreCase("delay")) {
                                                                    out.print("selected");
                                                                }%>
                                                            >Delay pickup date</option>
                                                </select>
                                            </td>
                                            <td rowspan="3" style="vertical-align:middle;">
                                                <button class="btn btn-danger btn-small remove-template" type="button" id="remove"><i class="icon-trash icon-white"></i> Remove</button>
                                            </td>
                                        </tr>

                                    </table>
                                </div>
                                <div class='additional'></div>

                                <div class="row-fluid">
                                    <div class="span12">
                                        <button class="btn btn-primary add-new-product pull-right" type="button" style="margin-top: 10px">Update</button>
                                    </div>
                                </div>
                                <br />
                            </form>
                        </div>
                    </div>
                </div>
            </div>
            <% } else {%><!--if order oject != null -->
            <div class="row-fluid">
                <div class="block">
                    <div class="navbar navbar-inner block-header">
                        <div class="muted pull-left">Order Placement</div>
                        <div class="pull-right">Add Items to your order</div>
                    </div>
                    <div class="block-content collapse in">
                        <div class="span12">
                            <div class="alert alert-info" id="alert">Some message to show during the order placement </div>


                            <form class="form-horizontal">

                                <div class='root-template'>
                                    <table class="table table-bordered">
                                        <tr>
                                            <th>Order ID</th>
                                            <th>Deliever Date</th>
                                            <th>Order Option</th>
                                            <th>Order Status</th>
                                            <th>Cancel Order</th>
                                        </tr>
                                        <tr>
                                            <td style="vertical-align:middle;">
                                                <%//out.print(o.getOrder_id());%>
                                            </td>
                                            <td>
                                                <input type="date" style="margin-top:8px" value=""/>
                                            </td>
                                            <td>
                                                <select name="">
                                                    <option value="delivery">Delivery</option>
                                                    <option value="self-pickedup">Self-picked-up</option>
                                                </select>
                                            </td>
                                            <td>
                                                <select name="">
                                                    <option value="pickedup" >Canceled</option>
                                                    <option value="pickedup">Delivered</option>
                                                    <option value="pickedup">Picked-up</option>
                                                    <option value="pickedup">Delay pickup date</option>
                                                </select>
                                            </td>
                                            <td rowspan="3" style="vertical-align:middle;">
                                                <button class="btn btn-danger btn-small remove-template" type="button"><i class="icon-trash icon-white"></i> Remove</button>
                                            </td>
                                        </tr>

                                    </table>
                                </div>
                                <div class='additional'></div>

                                <div class="row-fluid">
                                    <div class="span12">
                                        <button class="btn btn-primary add-new-product pull-right" type="button" style="margin-top: 10px">Update</button>
                                    </div>
                                </div>
                                <br />
                            </form>
                        </div>
                    </div>
                </div>
            </div> <% }%><!--if order object == null -->
            <div class="row-fluid">
                <div class="span12">
                    <div class="block">
                        <div class="navbar navbar-inner block-header">
                            <div class="muted pull-left">Customer Order table</div>
                        </div>
                        <div class="block-content collapse in">
                            <div class="span12">
                                <form action="ManageOrderHandler" method="post">
                                    <table class="table table-striped table-bordered table-hover" id="example">
                                        <thead>
                                            <tr>
                                                <td>Order id</td>
                                                <td>Delivery address</td>
                                                <td>Delivery date</td>
                                                <td>Order option</td>
                                                <td>Order state</td>
                                                <td>Order time</td>
                                                <td>Order quantity</td>
                                                <td>Edit</td>
                                            </tr>
                                            <%
                                                String username = this.getServletContext().getInitParameter("dbUser");
                                                String password = this.getServletContext().getInitParameter("dbPassword");
                                                String url = this.getServletContext().getInitParameter("dbUrl");
                                                OrderDB orderdb = new OrderDB(url, username, password);
                                                ArrayList<OrderBean> orders = orderdb.getAllOrder();
                                                for (OrderBean ob : orders) {
                                            %>
                                            <tr>
                                                <td><%out.print(ob.getOrder_id());%></td>
                                                <td><%out.print(ob.getDeliever_add());%></td>
                                                <td><%out.print(ob.getDeliever_date());%></td>
                                                <td><%out.print(ob.getOrder_option());%></td>
                                                <td><%out.print(ob.getOrder_state());%></td>
                                                <td><%out.print(ob.getDeliever_time());%></td>
                                                <td><%out.print(ob.getOrder_qty());%></td>
                                                <td><a href="ManageOrderHandler?action=select&orderid=<%=ob.getOrder_id()%>">Selected</a></td>
                                            </tr>
                                            <% }%>
                                        </thead>
                                        <tbody></tbody>
                                    </table>
                                </form>
                            </div>
                        </div>
                    </div>
                </div>
            </div>                              
            <%}%>
            <!--End check cookies-->                   

            <hr>
        </div> <!-- /container -->
    </body>
</html>


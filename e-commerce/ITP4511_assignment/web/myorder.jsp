<%@page import="ict.servlet.LoginHandler"%>
<%@page import="java.io.IOException"%>
<%@page import="java.util.logging.Logger"%>
<%@page import="java.util.logging.Level"%>
<%@page import="java.sql.SQLException"%>
<%@page import="ict.db.ProductDB"%>
<%@page import="java.util.ArrayList"%>
<%@page import="ict.bean.ProductBean"%>

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
                $(".container").hide();
                $(".container").fadeIn('slow');
            });
        </script>
    </head>
    <body>
        <div class="container">
            <jsp:include page="header.jsp" />
            <div style="height: 50px"></div>
            <div class="row">
                <div class="col-lg-12">
                    <form>
                        <div class="form-group">
                            <label for="orderid">Order ID:</label>
                            <input type="text" class="form-control" id=""/>
                        </div>
                        <div class="form-group">
                            <label for="email">Deliever time</label>
                            <input type="text" class="form-control" id=""/>
                        </div>
                        <div class="form-group">
                            <label for="pwd">Product name</label>
                            <input type="text" class="form-control" id=""/>
                        </div>
                        <div class="form-group">
                            <label for="pwd">Product quantity</label>
                            <input type="text" class="form-control" id=""/>
                        </div>
                        <div class="form-group">
                            <label for="pwd">Product</label>
                            <input type="text" class="form-control" id=""/>
                        </div>
                        <div class="checkbox">
                            <label><input type="checkbox"> Remember me</label>
                        </div>
                        <button type="submit" class="btn btn-default">Submit</button>
                    </form>
                </div>
            </div>
        </div>
    </body>
</html>

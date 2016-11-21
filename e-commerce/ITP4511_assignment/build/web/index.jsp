<%@page import="ict.servlet.LoginHandler"%>
<%@page import="java.io.IOException"%>
<%@page import="java.util.logging.Logger"%>
<%@page import="java.util.logging.Level"%>
<%@page import="java.sql.SQLException"%>
<%@page import="ict.db.ProductDB"%>
<%@page import="java.util.ArrayList"%>
<%@page import="ict.bean.ProductBean"%>
<!DOCTYPE html>
<%!
    private ProductDB db;
    
    public void init(){
        String username = this.getServletContext().getInitParameter("dbUser");
        String password = this.getServletContext().getInitParameter("dbPassword");
        String url = this.getServletContext().getInitParameter("dbUrl");
        db = new ProductDB(url, username, password);
        try {
            db.createCustTable();
            //Test data

            db.addProduct("Product1", "Product1", "123", "1.jpg", "M/L", "Channel", "1.jpg",1,"abc",2);
            db.addProduct("Product2", "Product2", "123", "Red,Green", "M/L", "Channel", "2.jpg",1,"abc",2);
            db.addProduct("Product3", "Product3", "123", "Red,Green", "M/L", "Channel", "3.jpg",1,"abc",2);
            db.addProduct("Product4", "Product2", "123", "Red,Green", "M/L", "Channel", "4.jpg",1,"abc",2);
            db.addProduct("Product5", "Product3", "123", "Red,Green", "M/L", "Channel", "5.jpg",1,"abc",2);
            db.addProduct("Product5", "Product3", "123", "Red,Green", "M/L", "Channel", "5.jpg",1,"abc",2);

        } catch (SQLException ex) {
            Logger.getLogger(LoginHandler.class.getName()).log(Level.SEVERE, null, ex);
        } catch (IOException ex) {
            Logger.getLogger(LoginHandler.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
%>
<html lang="en">
<head>
    <meta charset="utf-8">
    <title>Electronic commerce</title>
    <style>
        .carousel-inner > .item > img,
        .carousel-inner > .item > a > img {
            width: 70%;
            margin: auto;
        }
    </style>
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
        $(document).ready(function(){
           $(".container").hide();
           $(".container").fadeIn('slow');
        });
    </script>
</head>

<body>

<%init();%>
<div class="container">
    <!--Header -->
    <jsp:include page="header.jsp" />
    <!--Finish Header -->
    
    <!-- Jumbotron -->
    <div class="jumbotron">
        <h1>Latest News</h1>
        <p class="lead">IVE Students - Buy one get one today!</p>
        <a class="btn btn-large btn-success" href="list.jsp">Show Products</a>
    </div>

    <hr>
    <!-- Example row of columns -->
    <% 
        int count = 0;
        ArrayList <ProductBean> allProduct = db.getAllProduct(); 
        
        if (allProduct.size()!=0){
            for (ProductBean i : allProduct){
                if (count % 3 == 0){
                    out.print("<div class='row-fluid'>");
                    out.print("<ul class='thumbnails'>");
                    out.print("<li class='span4'>");
                    out.print("<div class='thumbnail'>");
                    out.print("<img alt='300x200' src='img/product/" + i.getPicturePath()+ "'>");
                    out.print("<div class='caption'>");
                    out.print("<h3>" + i.getP_name()+ "</h3>");
                    out.print("<p>" + i.getDescriptions() + "</p>");
                    out.print("<p><a href='checkout?id=" + i.getP_id()+ "'class='btn btn-primary'>Add To Cart</a><a href='view.html' class='btn'>View</a></p>"); 
                    out.print("</div>");
                    out.print("</div>");
                    out.print("</li>");
                }else{
                    out.print("<li class='span4'>");
                    out.print("<div class='thumbnail'>");
                    out.print("<img alt='300x200' src='img/product/" + i.getPicturePath() + "'>");
                    out.print("<div class='caption'>");
                    out.print("<h3>" + i.getP_name() + "</h3>");
                    out.print("<p>" + i.getDescriptions() + "</p>");
                    out.print("<p><a href='checkout?id=" + i.getP_id() + "'class='btn btn-primary'>Add To Cart</a><a href='view.html' class='btn'>View</a></p>"); 
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
    %>
    <hr/>
</div> <!-- /container -->

</body>
</html>

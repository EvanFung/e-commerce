<%@page import="ict.db.CustomerDB"%>
<%@page import="ict.bean.GiftBean"%>
<%@page import="ict.db.GiftDB"%>
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

        } catch (SQLException ex) {
            Logger.getLogger(LoginHandler.class.getName()).log(Level.SEVERE, null, ex);
        } catch (IOException ex) {
            Logger.getLogger(LoginHandler.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
    private GiftDB gdb;
    private CustomerDB cdb;

    public void ginit(){
        String username = this.getServletContext().getInitParameter("dbUser");
        String password = this.getServletContext().getInitParameter("dbPassword");
        String url = this.getServletContext().getInitParameter("dbUrl");
        gdb = new GiftDB(url, username, password);
    }

    public void cinit(){
        String username = this.getServletContext().getInitParameter("dbUser");
        String password = this.getServletContext().getInitParameter("dbPassword");
        String url = this.getServletContext().getInitParameter("dbUrl");
        cdb = new CustomerDB(url, username, password);
    }
    String getCookieValue(Cookie[] cookies, String cookieName)
    {
        String cookieValue = "";
        Cookie cookie;
        if (cookies != null)
        {
            for (int i=0; i<cookies.length; i++)
            {
              cookie = cookies[i];
                if (cookieName.equals(cookie.getName()))
                {
                  cookieValue = cookie.getValue();
                }
            }
        }
        return cookieValue;
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

<%init();ginit();%>
<div class="container">
    <!--Header -->
    <jsp:include page="header.jsp" />
    <!--Finish Header -->
    
    <!-- Jumbotron -->
    <div class="jumbotron">
        <h2>Redeeming Gift</h2>
       
        <h2>Your Bonus Point:<%=getCookieValue(request.getCookies(), "username")%></h2>
    </div>
    <div>
        
    </div>
    
    <hr>
    <!-- Example row of columns -->
    <% 
        int count = 0;
        ArrayList <GiftBean> allProduct = gdb.getAllGift(); 
        
        if (allProduct.size()!=0){
            for (GiftBean i : allProduct){
                if (count % 3 == 0){
                    out.print("<div class='row-fluid'>");
                    out.print("<ul class='thumbnails'>");
                    out.print("<li class='span4'>");
                    out.print("<div class='thumbnail'>");
                    out.print("<img alt='300x200' src='img/gift/" + i.getPicturePath()+ "'>");
                    out.print("<div class='caption'>");
                    out.print("<h3>" + i.getName()+ "</h3>");
                    out.print("<h4>Need Bonus Point : " + i.getBonus()+ "</h4>");
                    out.print("<p><a href='checkout?id=" + i.getG_id()+ "'class='btn btn-primary'>Redeeming</a>"); 
                    out.print("</div>");
                    out.print("</div>");
                    out.print("</li>");
                }else{
                    out.print("<li class='span4'>");
                    out.print("<div class='thumbnail'>");
                    out.print("<img alt='300x200' src='img/gift/" + i.getPicturePath() + "'>");
                    out.print("<div class='caption'>");
                    out.print("<h3>" + i.getName()+ "</h3>");
                    out.print("<h4>Need Bonus Point : " + i.getBonus()+ "</h4>");
                    out.print("<p><a href='checkout?id=" + i.getG_id()+ "'class='btn btn-primary'>Redeeming</a>"); 
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
    
</div> <!-- /container -->
<hr/>
</body>
</html>

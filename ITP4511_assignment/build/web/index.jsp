<%@page import="ict.bean.ProductBean"%>
<%@page import="java.util.ArrayList"%>
<%@page import="ict.servlet.LoginHandler"%>
<%@page import="java.io.IOException"%>
<%@page import="java.util.logging.Logger"%>
<%@page import="java.util.logging.Level"%>
<%@page import="java.sql.SQLException"%>
<%@page import="ict.db.ProductDB"%>
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
            db.addProduct("Product1", "Product1", "123", "Red,Green", "M/L", "Channel", "1.jpg");
            db.addProduct("Product2", "Product2", "123", "Red,Green", "M/L", "Channel", "2.jpg");
            db.addProduct("Product3", "Product3", "123", "Red,Green", "M/L", "Channel", "3.jpg");
            db.addProduct("Product4", "Product2", "123", "Red,Green", "M/L", "Channel", "4.jpg");
            db.addProduct("Product5", "Product3", "123", "Red,Green", "M/L", "Channel", "5.jpg");
            db.addProduct("Product5", "Product3", "123", "Red,Green", "M/L", "Channel", "5.jpg");
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
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta name="description" content="">
    <meta name="author" content="">
    <!-- Le styles -->
    <link href="http://netdna.bootstrapcdn.com/twitter-bootstrap/2.3.2/css/bootstrap-combined.min.css" rel="stylesheet">
    <script src="http://code.jquery.com/jquery.js"></script>
    <script src="http://netdna.bootstrapcdn.com/twitter-bootstrap/2.3.2/js/bootstrap.min.js"></script>
    <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
    
    <script> 
        $(document).ready(function() {
            $('#login_message').hide();
            $('#register_message').hide();
            $('#login').hide();
            $('#btn_login').click(function(event) {
                    var username = $('#username').val();
                    var password = $('#password').val();
                    
                    $.ajax({
                        type: 'POST',
                        url: 'login',
                        data: {
                            "username" : username,
                            "password" : password
                        },
                        success: function(responseText) {
                            if(responseText!='True'){
                                $('#login_message').show();
                                $('#login_message').text(responseText);
                                $('#login_message').effect("shake");
                            }else {
                                $('#login_message').attr('class', 'alert alert-success');
                                $('#login_message').show();
                                $('#login_message').text("Login Successfully.");
                                
                                setTimeout(function(){
                                   $('#login').modal('toggle');
                                   location.reload();
                                }, 500);
                            }
                        }
                    });
            });
            
            $('#btn_register').click(function() {
                    var first_name = $('#first_name').val();
                    var last_name = $('#last_name').val();
                    var gender = $('input[id=gender]:checked').val();
                    var address = $('#address').val();
                    var password = $('#pass').val();
                    var confirmPassword = $('#confirmPassword').val();
                    var email = $('#email').val();
                    
                    $.ajax({
                        type: "POST",
                        url: 'register',
                        data:{
                            "first_name" : first_name,
                            "last_name" : last_name,
                            "password" : password,
                            "email" : email,
                            "gender" : gender,
                            "address" : address,
                            "confirmPassword":confirmPassword
                        },
                        success: function(responseText) {
                            if(responseText==""){
                                $('#register_message').attr('class', 'alert alert-success');
                                $('#register_message').show();
                                $('.sa-innate-form').hide();
                                $('#register_message').html('Register Successfully. <a href="#" id="test">Press here to Login</a>');
                            }else {
                                $('#register_message').show();
                                $('#register_message').html(responseText);
                                
                            }
                        }
                    });
            });
            
             $('body').on('click', '#test', function () {
                 $('li a[href="#sectionA"]').tab('show');
                 $('.sa-innate-form').show();
             }); 
             
             $('body').on('click', '#link_logout', function () {
                 document.cookie = "username=; expires=Thu, 01 Jan 1970 00:00:00 UTC";
                 document.cookie = "password=; expires=Thu, 01 Jan 1970 00:00:00 UTC";
                 location.reload();
             }); 
             
            
        });
    </script>
    <link href="css/bootstrap-responsive.css" rel="stylesheet">
    <link href="css/style.css" rel="stylesheet">
    <link href="css/custom.css" rel="stylesheet">
    <link href="css/registration.css" rel="stylesheet">
    <style>
        .carousel-inner > .item > img,
        .carousel-inner > .item > a > img {
            width: 70%;
            margin: auto;
        }
    </style>

    <!-- HTML5 shim, for IE6-8 support of HTML5 elements -->
    <!--[if lt IE 9]>
    <script src="http://cdnjs.cloudflare.com/ajax/libs/html5shiv/3.7.2/html5shiv.js"></script>
    <![endif]-->
</head>

<body>
<% init(); %>

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
    %>
   

    <div class="modal fade modal-login" id="login" role="dialog" tabindex="-1">
        <div class="modal-dialog modal-lg" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                    </button>
                    <h3 class="modal-title" id="modalLable">Login</h3>
                </div><!--modal-header-->
                <div class="modal-body">
                    <div class="container-fluid">
                        <div class="row">
                            <div class="col-md-4 col-md-offset-4">
                                <div class="form-body">
                                    <ul class="nav nav-tabs final-login">
                                        <li class="active"><a data-toggle="tab" href="#sectionA">Sign In</a></li>
                                        <li><a data-toggle="tab" href="#sectionB">Join us!</a></li>
                                    </ul>
                                    <div class="tab-content">
                                        <div id="sectionA" class="tab-pane fade in active">
                                            <div class="innter-form">
                                                <form class="sa-innate-form" method="post">
                                                    <div class="alert alert-danger" id="login_message"></div>
                                                    <div class="form-group">
                                                        <label for="username">Email Address</label>
                                                        <input  type="text" id="username" name="username" class="form-control" id="username">
                                                    </div>
                                                    <div class="form-group">
                                                        <label for="password">Password</label>
                                                        <input type="password" id="password" name="password" class="form-control">
                                                    </div>
                                                    <button type="button" id="btn_login">Sign In</button>
                                                </form>
                                            </div>
                                            <div class="clearfix"></div>
                                        </div>
                                        <div id="sectionB" class="tab-pane fade">
                                            <div class="innter-form">
                                                 <div class="alert alert-danger" id="register_message"></div>
                                                <form class="sa-innate-form" method="post">
                                                    
                                                    <div class="form-group">
                                                        <label for="name">First Name<font color="red"><b>*</b></font></label>
                                                        <input type="text" id="first_name" class="form-control">
                                                    </div>
                                                    <div class="form-group">
                                                        <label for="name">Last Name<font color="red"><b>*</b></font></label>
                                                        <input type="text" id="last_name" class="form-control">
                                                    </div>
                                                    <div class="form-group">
                                                        <label>Email Address<font color="red"><b>*</b></font></label>
                                                        <input type="text" id="email" class="form-control">
                                                    </div>
                                                    <div class="form-group">
                                                        <label>Address<font color="red"><b>*</b></font></label>
                                                        <input type="text" id="address" class="form-control">
                                                    </div>
                                                    <div class="form-group">
                                                        <label>Gender<font color="red"><b>*</b></font></label>
                                                        <select style="height: 45px;" class="form-control" id="gender">
                                                          <option value="M">Male</option>
                                                          <option value="F">Female</option>
                                                        </select>
                                                    </div>
                                                    <div class="form-group">
                                                        <label>Password<font color="red"><b>*</b></font></label>
                                                        <input type="password" id="pass" class="form-control">
                                                    </div>
                                                    <div class="form-group">
                                                        <label>Confirm password<font color="red"><b>*</b></font></label>
                                                        <input type="password" id="confirmPassword" class="form-control">
                                                    </div>
                                                    <button type="button" id="btn_register">Join now</button>
                                                </form>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div><!--modal-body-->
                
            </div><!--modal-content-->
        </div><!--modal-dialog-->
    </div><!--modal-->

    <hr/>
</div> <!-- /container -->

</body>
</html>

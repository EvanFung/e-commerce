<!DOCTYPE html>
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
    <script>
        $(document).ready(function() {
            $('#login_message').hide();
            $('#register_message').hide();
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
                                
                            }else {
                                $('#login_message').attr('class', 'alert alert-success');
                                $('#login_message').show();
                                $('#login_message').text("Login Successfully.");
                                
                                setTimeout(function(){
                                     window.location.href = "logined.jsp";
                                }, 500);
                                
                            }
                        }
                    });
            });

            $('#btn_register').click(function() {
                    var first_name = $('#first_name').val();
                    var last_name = $('#last_name').val();
                    var gender = $('input[id=gender]:checked').val();
                    var dob = $('#dob').val();
                    var address = $('#address').val();
                    var password = $('#pass').val();
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
                            "dob" : dob,
                            "address" : address
                        },
                        success: function(responseText) {
                            if(responseText=='True'){
                                $('#register_message').attr('class', 'alert alert-success');
                                $('#register_message').show();
                                $('.sa-innate-form').hide();
                                $('#register_message').append('Register Successfully. <a href="#" id="test">Press here to Login</a>');
                            }else {
                                location.reload();
                            }
                        }
                    });
            });

             $('body').on('click', '#test', function () {
                 $('li a[href="#sectionA"]').tab('show');
                 $('.sa-innate-form').show();
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


<div class="container">

    <div class="masthead">
        <div class="navbar  navbar-fixed-top navbar-inverse">
            <div class="navbar-inner">
                <div class="container-fluid">
                    <ul class="nav">
                        <li><a class="brand" href="#">BuyBestProduct Ltd.</a></li>
                        <li class="active"><a href="index.html">Home</a></li>
                        <li><a href="checkout.html">Checkout <span class="badge badge-important">3</span></a></li>
                        <li><a href="new.html">Order Placement</a></li>
                        <li><a href="status.html">Order Status</a></li>
                        <li class="dropdown">
                            <a class="dropdown-toggle" data-toggle="dropdown" href="#">
                                Categories
                                <b class="caret"></b>
                            </a>
                            <ul class="dropdown-menu">
                                <li class="nav-header">Men</li>
                                <li><a href="list.html">Clothes</a></li>
                                <li><a href="list.html">Shoes</a></li>
                                <li><a href="list.html">Watches</a></li>
                                <li><a href="list.html">Jewlery</a></li>
                                <li class="divider"></li>
                                <li class="nav-header">Women</li>
                                <li><a href="list.html">Clothes</a></li>
                                <li><a href="list.html">Shoes</a></li>
                                <li><a href="list.html">Watches</a></li>
                                <li><a href="list.html">Jewlery</a></li>
                            </ul>
                        </li>

                        <li class="dropdown">
                            <a class="dropdown-toggle" data-toggle="dropdown" href="#">
                                Pages
                                <span class="caret"></span>
                            </a>
                            <ul class="dropdown-menu">
                                <li><a href="aboutus.html">About Us</a></li>
                                <li><a href="contactus.html">Contact Us</a></li>
                            </ul>
                        </li>
                        <li class="dropdown">
                            <a role="button" href="#" data-target="#login"  data-toggle="modal">Member</a>
                        </li>
                    </ul>
                </div>
            </div><!--end of navbar-inner-->
        </div><!-- end of nav-->
    </div><!--end of masthead -->
    <!-- Jumbotron -->
    <div class="jumbotron">
        <h1>Latest News</h1>
        <p class="lead">IVE Students - Buy one get one today!</p>
        <a class="btn btn-large btn-success" href="list.html">Show Products</a>
    </div>

    <hr>
    <div name="carouselSlider" class="container">
        <div id="myCarousel" class="carousel slide">
            <ol class="carousel-indicators">
                <li data-target="#myCarousel" data-slide-to="0" class="active"></li>
                <li data-target="#myCarousel" data-slide-to="1"></li>
                <li data-target="#myCarousel" data-slide-to="2"></li>
            </ol>
            <!-- Carousel items -->
            <div class="carousel-inner">
                <div class="active item">
                    <img src="imgs/sliders/sliders_1.jpg" alt="Chania">
                </div>
                <div class="item">
                    <img src="imgs/sliders/sliders_2.jpg" alt="Chania">
                </div>
                <div class="item">
                    <img src="imgs/sliders/sliders_3.jpg" alt="Chania">
                </div>
            </div>
            <!-- Carousel nav -->
            <a class="carousel-control left" href="#myCarousel" data-slide="prev">&lsaquo;</a>
            <a class="carousel-control right" href="#myCarousel" data-slide="next">&rsaquo;</a>
        </div>
    </div>

    <hr/>
    <!-- Example row of columns -->
    <div class="row-fluid">
        <ul class="thumbnails">
            <li class="span4">
                <div class="thumbnail">
                    <img alt="300x200" src="http://placehold.it/300x200">
                    <div class="caption">
                        <h3>Product A</h3>
                        <p>Cras justo odio, dapibus ac facilisis in, egestas eget quam. Donec id elit non mi porta
                            gravida at eget metus. Nullam id dolor id nibh ultricies vehicula ut id elit.</p>
                        <p><a href="checkout.html" class="btn btn-primary">Add To Cart</a> <a href="view.html"
                                                                                              class="btn">View</a></p>
                    </div>
                </div>
            </li>
            <li class="span4">
                <div class="thumbnail">
                    <img alt="300x200" src="http://placehold.it/300x200">
                    <div class="caption">
                        <h3>Product B</h3>
                        <p>Cras justo odio, dapibus ac facilisis in, egestas eget quam. Donec id elit non mi porta
                            gravida at eget metus. Nullam id dolor id nibh ultricies vehicula ut id elit.</p>
                        <p><a href="checkout.html" class="btn btn-primary">Add To Cart</a> <a href="view.html"
                                                                                              class="btn">View</a></p>
                    </div>
                </div>
            </li>
            <li class="span4">
                <div class="thumbnail">
                    <img alt="300x200" src="http://placehold.it/300x200">
                    <div class="caption">
                        <h3>Product C</h3>
                        <p>Cras justo odio, dapibus ac facilisis in, egestas eget quam. Donec id elit non mi porta
                            gravida at eget metus. Nullam id dolor id nibh ultricies vehicula ut id elit.</p>
                        <p><a href="checkout.html" class="btn btn-primary">Add To Cart</a> <a href="view.html"
                                                                                              class="btn">View</a></p>
                    </div>
                </div>
            </li>
        </ul>
    </div>

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
                                                    <a href="">Forgot Password?</a>
                                                </form>
                                            </div>
                                            <div class="clearfix"></div>
                                        </div>
                                        <div id="sectionB" class="tab-pane fade">
                                            <div class="innter-form">
                                                 <div class="alert alert-danger" id="register_message"></div>
                                                <form class="sa-innate-form" method="post">
                                                    
                                                    <div class="form-group">
                                                        <label for="name">First Name</label>
                                                        <input type="text" id="first_name" class="form-control">
                                                    </div>
                                                    <div class="form-group">
                                                        <label for="name">Last Name</label>
                                                        <input type="text" id="last_name" class="form-control">
                                                    </div>
                                                    <div class="form-group">
                                                        <label>Email Address</label>
                                                        <input type="text" id="email" class="form-control">
                                                    </div>
                                                    <div class="form-group">
                                                        <label>Address</label>
                                                        <input type="text" id="address" class="form-control">
                                                    </div>
                                                    <div class="form-group">
                                                        <label>Gender</label>
                                                        <input type="radio" id="gender" class="form-control" value="M">M
                                                        <input type="radio" id="gender" class="form-control" value="F">F
                                                    </div>
                                                    <div class="form-group">
                                                        <label>Date of birth</label>
                                                        <input type="text" id="dob" class="form-control">
                                                    </div>
                                                    <div class="form-group">
                                                        <label>Password</label>
                                                        <input type="password" id="pass" class="form-control">
                                                    </div>
                                                    <div class="form-group">
                                                        <label>Confirm password</label>
                                                        <input type="password" id="confirmPassword" class="form-control">
                                                    </div>
                                                    <button type="button" id="btn_register">Join now</button>
                                                    <a href="#"><p>By clicking Join now, you agree to hifriends's User Agreement, Privacy Policy, and Cookie Policy.</p></a>
                                                </form>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div><!--modal-body-->
                <div class="modal-footer">
                    <button type="button" data-dismiss="modal" class="btn btn-default">Close</button>
                </div>
            </div><!--modal-content-->
        </div><!--modal-dialog-->
    </div><!--modal-->

    <hr/>
</div> <!-- /container -->


<div class="footer">
    <div class="row-fluid">
        <div class="col-lg-12">
            <ul class="mendi-social-networks">
                <li class="facebook" style="height: 100%">
                    <a href="" title="">
                        <i class="fa fa-facebook"> </i>
                        <p>JOIN US ON FACEBOOK</p>
                        <span class="followers">268K Followers</span>
                    </a>
                </li>
                <li class="twitter" style="height: 100%">
                    <a href="" title="">
                        <i class="fa fa-twitter"> </i>
                        <p>FOLLOW US ON TWITTER</p>
                        <span class="followers">268K Followers</span>
                    </a>
                </li>
                <li class="googleplus" style="height: 100%">
                    <a href="" title="">
                        <i class="fa fa-google-plus"> </i>
                        <p>ADD TO OUR CIRCLE</p>
                        <span class="followers">268K Followers</span>
                    </a>
                </li>
                <li class="linkedin" style="height: 100%">
                    <a href="" title="">
                        <i class="fa fa-linkedin"> </i>
                        <p>CONNECT TO OUR NETWORK</p>
                        <span class="followers">268K Followers</span>
                    </a>
                </li>
            </ul>
        </div>
    </div>
</div>
</body>
</html>

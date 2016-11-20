
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
    <link href="css/bootstrap-responsive.css" rel="stylesheet">
    <link href="css/style.css" rel="stylesheet">
    <link href="css/custom.css" rel="stylesheet">

    <!-- HTML5 shim, for IE6-8 support of HTML5 elements -->
    <!--[if lt IE 9]>
    <script src="http://cdnjs.cloudflare.com/ajax/libs/html5shiv/3.7.2/html5shiv.js"></script>
    <![endif]-->
</head>

<body>



<div class="container">

    <jsp:include page="header.jsp" />
    <hr>
    <div class="row-fluid">
        <div class="block">
            <div class="navbar navbar-inner block-header">
                <div class="muted pull-left">Order Status</div>
                <div class="pull-right">Where is my order?</div>
            </div>
            <div class="block-content collapse in">
                <div class="span12">
                    <div class="alert alert-info">Enter your email address and order number</div>

                    <form class="form-horizontal" action='order-complete.html'>
                        <div class="control-group">
                            <label class="control-label" for="name">Email Address</label>
                            <div class="controls">
                                <input type="text" id="name" placeholder="Email Address">
                            </div>
                        </div>
                        <div class="control-group">
                            <label class="control-label" for="phone">Order ID</label>
                            <div class="controls">
                                <input type="text" id="phone" placeholder="Order ID">
                            </div>
                        </div>

                        <div class="control-group">
                            <div class="controls">
                                <button type="submit" class="btn btn-primary">Order</button>
                            </div>
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </div>

    <div class="row-fluid">
        <div class="span5">
            <div class="block">
                <div class="navbar navbar-inner block-header">
                    <div class="muted pull-left">Questions?</div>
                    <div class="pull-right">Help!</div>
                </div>
                <div class="block-content collapse in">
                    <div class="span12">
                        <ul class="unstyled">
                            <li><i class="icon-chevron-right"></i> <a href=''>Order status</a></li>
                            <li><i class="icon-chevron-right"></i> <a href=''>Frequently Asked Questions</a></li>
                            <li><i class="icon-chevron-right"></i> <a href=''>Online Chat</a></li>
                            <li><i class="icon-chevron-right"></i> <a href=''>Contact a real, live dirty person for help</a></li>
                            <li><i class="icon-chevron-right"></i> <a href=''>Contact Us</a></li>
                        </ul>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <hr>
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

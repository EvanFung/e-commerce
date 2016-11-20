
<!DOCTYPE html>
<html lang="en">
  <head>
      
    <title>Bootstrap e-Commerce Theme</title>
    <!-- HTML5 shim, for IE6-8 support of HTML5 elements -->
    <!--[if lt IE 9]>
      <script src="http://cdnjs.cloudflare.com/ajax/libs/html5shiv/3.7.2/html5shiv.js"></script>
    <![endif]-->
    <link href="http://netdna.bootstrapcdn.com/twitter-bootstrap/2.3.2/css/bootstrap-combined.min.css" rel="stylesheet">
    <script src="http://code.jquery.com/jquery.js"></script>
    <script src="http://netdna.bootstrapcdn.com/twitter-bootstrap/2.3.2/js/bootstrap.min.js"></script>
    <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
    <script src="js/register.js"></script>

    <link href="css/bootstrap-responsive.css" rel="stylesheet">
    <link href="css/style.css" rel="stylesheet">
    <link href="css/custom.css" rel="stylesheet">
    <link href="css/registration.css" rel="stylesheet">
  </head>

  <body>

    <div class="container">

      <jsp:include page="header.jsp" />

        <div class="row-fluid">
            <div class="block">
                <div class="navbar navbar-inner block-header">
                    <div class="muted pull-left">Order Complete</div>
                    <div class="pull-right">Where is my order?</div>
                </div>
                <div class="block-content collapse in">
                    <div class="span12">
                        <div class="alert alert-error">Some Error Message!</div>
                        <div class="alert alert-success">Success! Paypal transaction ID: X8l7Wof56xso<br />Thanks for you order!</div>

                        <p>
                            <ul>
                                <li>Your order number: 1002212</li>
                                <li>Made a mistake? update board file on this page until they go to manufacturing</li>
                                <li>Boards usually take 6-8 days to manufacture and ship</li>
                                <li><a href='#'>Check status</a></li>
                                <li>Copy of the receipt has been emailed to you</li>
                                <li>You will receive an email every time the status of your order is updated</li>
                                <li><a href='#'>A printable invoice is available here</a></li>
                            </ul>  
                        </p>

                        <p>
                            <table class="table table-hover table-striped">
                                <tr>
                                    <th>ID</th>
                                    <th>File</th>
                                    <th>Layers</th>
                                    <th>Size</th>
                                    <th>Color</th>
                                    <th>Cost</th>
                                    <th>Status</th>
                                </tr>
                                <tr>
                                    <td>8762</td>
                                    <td>item.zip</td>
                                    <td>3</td>
                                    <td>5x5cm</td>
                                    <td>Red</td>
                                    <td>$14</td>
                                    <td>Pending</td>
                                </tr>
                                <tr>
                                    <td>8763</td>
                                    <td>item2.zip</td>
                                    <td>2</td>
                                    <td>5x6cm</td>
                                    <td>Blue</td>
                                    <td>$24</td>
                                    <td>Sent</td>
                                </tr>
                                <tr>
                                    <th>Shipping</th>
                                    <th colspan='4'></th>
                                    <th>$0</th>
                                    <th>0.1kg</th>
                                </tr>
                                <tr>
                                    <th>Total</th>
                                    <th colspan='4'></th>
                                    <th>$38</th>
                                    <th></th>
                                </tr>
                            </table>
                        </p>

                    </div>
                </div>
            </div>
        </div>

        <div class="row-fluid">
            <div class="block">
                <div class="navbar navbar-inner block-header">
                    <div class="muted pull-left">Order Info</div>
                    <div class="pull-right"></div>
                </div>
                <div class="block-content collapse in">
                    <div class="span12">
                        <p>
                            <ul>
                                <li>Today 4 Aug 2014 10:04: <b>Order Received</b> "New Order"</li>
                                <li>Today 4 Aug 2014 10:14: <b>In Production</b> "item.zip Created"</li>
                            </ul>
                        </p>

                        <div class="alert alert-info text-center">
                            <p class="text-center">
                                <h4>Item (#873)</h4>
                            </p>
                        </div>

                        <div class="row-fluid">
                            <div class="span6">
                                <div class="text-center"><h4>Top View</h4></div>
                                <div class="thumbnail">
                                    <img alt="" src="http://placehold.it/460x400">
                                </div>
                            </div>
                            <div class="span6">
                                <div class="text-center"><h4>Bottom View</h4></div>
                                <div class="thumbnail">
                                    <img alt="" src="http://placehold.it/460x400">
                                </div>
                            </div>
                        </div>

                    </div>
                </div>
            </div>
        </div>

        <div class="row-fluid">
            <div class="block">
                <div class="navbar navbar-inner block-header">
                    <div class="muted pull-left">Reorder Links</div>
                    <div class="pull-right">Where is my order?</div>
                </div>
                <div class="block-content collapse in">
                    <div class="span12">
                        <p>
                            <table class="table table-hover table-striped">
                                <tr>
                                    <th>Board</th>
                                    <th>Share Link</th>
                                    <th>Add To Store</th>
                                    <th>Give Me Money</th>
                                </tr>
                                <tr>
                                    <td>item.zip</td>
                                    <td><a href='#'>Share this board</a></td>
                                    <td><a href='#' class='btn btn-primary'>Add to Store</a></td>
                                    <td><a href='#' class='btn btn-primary'>Get $1/order</a></td>
                                </tr>
                            </table>
                        </p>

                        <p>
                            Use this to link to reorder boards or shar eyour work with others.
                        </p>

                    </div>
                </div>
            </div>
        </div>

        <div class="row-fluid">
            <div class="span7">
                <div class="block">
                    <div class="navbar navbar-inner block-header">
                        <div class="muted pull-left">Shipping Address</div>
                        <div class="pull-right">We send your products here</div>
                    </div>
                    <div class="block-content collapse in">
                        <div class="span12">
                            <address>
                              <strong>Twitter, Inc.</strong><br>
                              795 Folsom Ave, Suite 600<br>
                              San Francisco, CA 94107<br>
                              <abbr title="Phone">P:</abbr> (123) 456-7890
                            </address>
                             
                            <address>
                              <strong>Full Name</strong><br>
                              <a href="mailto:#">first.last@example.com</a>
                            </address>
                        </div>
                    </div>
                </div>
            </div>
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

      <div class="footer">
        <p>&copy; Company 2014</p>
      </div>

    </div> <!-- /container -->

  </body>
</html>

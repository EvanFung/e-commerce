<%! //<-- See now I am using Declaration, not Scriptlet
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
  
    void deleteCookie(HttpServletRequest request, HttpServletResponse response){
       for (Cookie cookie : request.getCookies()) {
            cookie.setValue("");
            cookie.setMaxAge(0);
            cookie.setPath("/");

            response.addCookie(cookie);
        }
      
    }
%>  
<div class="masthead">
        <div class="navbar  navbar-fixed-top navbar-inverse">
            <div class="navbar-inner">
                <div class="container-fluid">
                    <ul class="nav">
                        <li><a class="brand" href="index.jsp">BuyBestProduct Ltd.</a></li>
                        <li class="active"><a href="index.jsp">Home</a></li>
                        <li><a href="checkout.jsp">Checkout <span class="badge badge-important">3</span></a></li>
                        <li><a href="new.jsp">Order Placement</a></li>
                        <li><a href="status.jsp">Order Status</a></li>
                        <li class="dropdown">
                            <a class="dropdown-toggle" data-toggle="dropdown" href="#">
                                Categories
                                <b class="caret"></b>
                            </a>
                            <ul class="dropdown-menu">
                                <li class="nav-header">Men</li>
                                <li><a href="list.jsp">Clothes</a></li>
                                <li><a href="list.jsp">Shoes</a></li>
                                <li><a href="list.jsp">Watches</a></li>
                                <li><a href="list.jsp">Jewlery</a></li>
                                <li class="divider"></li>
                                <li class="nav-header">Women</li>
                                <li><a href="list.jsp">Clothes</a></li>
                                <li><a href="list.jsp">Shoes</a></li>
                                <li><a href="list.jsp">Watches</a></li>
                                <li><a href="list.jsp">Jewlery</a></li>
                            </ul>
                        </li>

                        <li class="dropdown">
                            <a class="dropdown-toggle" data-toggle="dropdown" href="#">
                                Pages
                                <span class="caret"></span>
                            </a>
                          
                            <ul class="dropdown-menu">
                                <li><a href="aboutus.jsp">About Us</a></li>
                                <li><a href="contactus.jsp">Contact Us</a></li>
                            </ul>

                        </li>
                          <%
                               if (getCookieValue(request.getCookies(), "username")==""){
                          %>
                        <li class="dropdown">
                            <a role="button" href="#" data-target="#login"  data-toggle="modal">Member</a>
                        </li>
                        <% }else{ %>
                        <li class="dropdown">
                            <a class="dropdown-toggle" data-toggle="dropdown" href="#">
                                <%=getCookieValue(request.getCookies(), "username")%>
                                <span class="caret"></span>
                            </a>
                            <ul class="dropdown-menu">
                                <li><a href="customerHandler?action=list&email=<%=getCookieValue(request.getCookies(), "username")%>">My Info</a></li>
                                <li><a href="index.jsp" id="link_logout">Logout</a></li>
                            </ul>
                        </li>
                           <%}%>
                    </ul>
                </div>
            </div><!--end of navbar-inner-->
        </div><!-- end of nav-->
</div><!--end of masthead -->

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
                                                        <select  class="form-control" id="gender">
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
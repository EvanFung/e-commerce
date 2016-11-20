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
                        <li><a class="brand" href="#">BuyBestProduct Ltd.</a></li>
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
                                <li><a href="#" id="link_logout">Logout</a></li>
                            </ul>
                        </li>
                           <%}%>
                    </ul>
                </div>
            </div><!--end of navbar-inner-->
        </div><!-- end of nav-->
</div><!--end of masthead -->
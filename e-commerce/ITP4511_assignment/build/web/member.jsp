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
    <script src="js/register.js"></script>
    <link href="css/bootstrap-responsive.css" rel="stylesheet">
    <link href="css/style.css" rel="stylesheet">
    <link href="css/custom.css" rel="stylesheet">
    <link href="css/registration.css" rel="stylesheet">
	<!--[if lt IE 9]>
	<script src="http://cdnjs.cloudflare.com/ajax/libs/html5shiv/3.7.2/html5shiv.js"></script>
	<![endif]-->
</head>

<body>

        <%
        CustomerBean c = (CustomerBean)request.getAttribute("customer");
        %>

<div class="container">
        <!--import header-->
	<jsp:include page="header.jsp" />
        <!--End-->
	<hr>
        <!--Check cookies-->
        <%
        if (getCookieValue(request.getCookies(), "username")==""){
        %>
        <script type="text/javascript">
            window.location.href = "./index.jsp"
        </script>
        <% }else{ %>
        <div class="panel-group" id="accordion">
            <div class="block">
              <div class="navbar navbar-inner block-header">
                <h4 class="muted pull-left">
                  <a data-toggle="collapse" data-parent="#accordion" href="#collapse1">
                  Personal Status</a>
                </h4>
              </div>
              <div id="collapse1" class="block-content collapse in">
                <div>
                    <table class="table table-striped">
                    <tr>
                      <th>E Mail</th>
                      <td><% out.println(c.getEmail()); %></td>
                      <td rowspan="6" width="200"><img src="./img/user.png" height="200" width="200" /></td>
                    </tr>
                    <tr>
                      <th>Password</th>
                      <td>******</td>
                    </tr>
                    <tr>
                      <th>Name</th>
                      <td><% out.println(c.getFirst_name() + " "+c.getLast_name()); %></td>
                    </tr>
                    <tr>
                      <th>Gender</th>
                      <td><% out.println(c.getGender()); %></td>
                    </tr>
                    <tr>
                      <th>Address</th>
                      <td><% out.println(c.getAddress()); %></td>
                    </tr>
                    <tr>
                      <th>Bouns</th>
                      <td><% out.println(c.getBonusPoint()); %></td>
                    </tr>
                </table>
                </div>
              </div>
            </div>
            <div class="block">
              <div class="navbar navbar-inner block-header">
                <h4 class="muted pull-left">
                  <a data-toggle="collapse" data-parent="#accordion" href="#collapse2">
                  Bouns Status</a>
                </h4>
              </div>
              <div id="collapse2" class="panel-collapse collapse">
                  <div class="block-content collapse in">
                      <table class="table table-striped">
                    <thead>
                    <tr>
                      <th>Order Number</th>
                      <th>Descrpiton</th>
                      <th>Bouns</th>
                    </tr>
                  </thead>
                  <tbody>
                    <tr>
                      <td>O123</td>
                      <td>Buy</td>
                      <td>1000</td>
                  </tbody>
                </table>
                  </div>
              </div>
            </div>
            <div class="block">
              <div class="navbar navbar-inner block-header">
                <h4 class="muted pull-left">
                  <a data-toggle="collapse" data-parent="#accordion" href="#collapse3">
                  Password Management</a>
                </h4>
              </div>
              <div id="collapse3" class="panel-collapse collapse">
                  <div class="block-content collapse in">
                      <form method="post" action="customerHandler">
                        <input type="hidden" name="action" value="edit"/>
                        <input type="hidden" name="email" value="<%=getCookieValue(request.getCookies(), "username")%>" />
                        <div class="control-group">
                            <label class="control-label" for="pwd">New Password</label>
                            <div class="controls">
                                <input type="password" id="pwd" name="password" placeholder="New Password" onchange="form.pwd2.pattern = this.value;" required>
                            </div>
                        </div>
                        <div class="control-group">
                            <label class="control-label" for="pwd2">Verify Password</label>
                            <div class="controls">
                                <input type="password" id="pwd2" name="confirm_password" placeholder="Repeat Password" required>
                            </div>
                        </div>
                        <div class="control-group">
                            <div class="controls">
                                <button type="submit" class="btn btn-primary">Submit</button>
                            </div>
                        </div>
                    </form>
                  </div>
              </div>
            </div>
            <div class="block">
              <div class="navbar navbar-inner block-header">
                <h4 class="muted pull-left">
                  <a data-toggle="collapse" data-parent="#accordion" href="#collapse4">
                  Address Management</a>
                </h4>
              </div>
              <div id="collapse4" class="panel-collapse collapse">
                  <div class="block-content collapse in">
                      <form method="post" action="customerHandler">
                        <input type="hidden" name="action" value="update"/>
                        <input type="hidden" name="email" value="<%=getCookieValue(request.getCookies(), "username")%>" />
                        <div class="row-fluid">
                            <div class="span4">
                                <div class="control-group">
                            <label class="control-label" for="country">Country</label>
                            <div class="controls">
                                <input type="text" id="country" name="country" placeholder="Country Name" required>
                            </div>
                        </div>
                            </div>
                            <div class="span4">
                            <div class="control-group">
                            <label class="control-label" for="street">Street Name</label>
                            <div class="controls">
                                <input type="text" id="street" name="street" placeholder="Street Name" required>
                            </div>
                        </div>
                            </div>
                            <div class="span4">
                            <div class="control-group">
                            <label class="control-label" for="building">Building</label>
                            <div class="controls">
                                <input type="text" id="building" name="building" placeholder="Building Name" required>
                            </div>    
                            </div>
                            </div>    
                        </div>
                        <div class="control-group">
                            <div class="controls">
                                <button type="submit" class="btn btn-primary">Submit</button>
                            </div>
                        </div>
                    </form>
                  </div>
              </div>
            </div>                
          </div>  
        <%}%>
        <!--End check cookies-->                   
                                                             
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

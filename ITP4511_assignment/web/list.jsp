
<%@page import="java.io.IOException"%>
<%@page import="ict.db.ProductDB"%>
<%@page import="java.util.ArrayList"%>
<%@page import="ict.bean.ProductBean"%>

<!DOCTYPE html>
<html lang="en">
<head>
  <title>Electronic commerce</title>
  <!--<link href="css/registration.css" rel="stylesheet">
      <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta name="description" content="">
    <meta name="author" content="">
    <!-- Le styles -->
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
  <style>
    ul.pagination {
        display: inline-block;
        padding: 0;
        margin: 0;
    }

    ul.pagination li {display: inline;}

    ul.pagination li a {
        color: black;
        float: left;
        padding: 8px 16px;
        text-decoration: none;
    }

    ul.pagination li a.active {
        background-color: #4CAF50;
        color: white;
    }

    ul.pagination li a:hover:not(.active) {background-color: #ddd;}
  </style>
  <script>
      $(document).ready(function(){
            $.ajax({
                        type: 'POST',
                        url: 'ListHandler',
                        data: {
                            "action" : "all",
                        },
                        success: function(responseText) {
                            $("#products_body").hide();
                            $("#products_body").html(responseText);
                            $("#products_body").fadeIn('slow');
                        },
            });
                    
         
           $('#searchKey').change(function() {
                $.ajax({
                        type: 'POST',
                        url: 'ListHandler',
                        data: {
                            "action" : $(this).val()
                        },
                        success: function(responseText) {  
                            $("#products_body").hide();
                            $("#products_body").html(responseText);
                            $("#products_body").fadeIn('slow');
                        },
                 });
          });
      });
  </script>
</head>

<body>
<% init(); %>
<div class="container">
 <jsp:include page="header.jsp" />
 <hr>
 <div class="row-fluid">
        <div class="span12">
            <h1>Products</h1>
        </div>
     <div style="position: absolute;right: 0px; padding-right: 200px; padding-top: 12px;">Search key: <input type="text" name="name" id="searchKey"></div>
 </div>
 <div id="products_body">
 </div>
<ul class="pagination" style="position: absolute;right: 0px; padding-right: 200px">
  <li><a href="#" class="active">1</a></li>
  <li><a href="#">2</a></li>
  <li><a href="#">3</a></li>
  <li><a href="#">4</a></li>
  <li><a href="#">5</a></li>
</ul>
  <hr>
</body>
</html>

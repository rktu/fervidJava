<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@ page isELIgnored="false" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<!DOCTYPE>
<html lang="en">
<head>
  <title>Fervid</title>
  <meta charset="utf-8">
  <%-- <link rel="stylesheet" type="text/css" href="<c:url value="/resources/css/screen.css" /> --%>
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" />
  <link href="https://maxcdn.bootstrapcdn.com/font-awesome/4.4.0/css/font-awesome.min.css" rel="stylesheet" />
  <script src="//code.jquery.com/jquery-1.11.1.min.js"></script>
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
  <style type="text/css">
    /* Remove the navbar's default margin-bottom and rounded borders */
    .navbar {
        background-color: #Ffffff;
      margin-bottom: 0;
      border-radius: 0;
      border-right:1px solid white;
      border-top:1px solid white;
      border-bottom: 5px solid #cf0006;
      margin-bottom: 5px;
    }


    /* Set height of the grid so .sidenav can be 100% (adjust as needed) */
    .row.content {height: 450px}

    /* Set gray background color and 100% height */
    .sidenav {
      padding-top: 20px;
      background-color: #f1f1f1;
      height: 100%;
    }

    /* Set black background color, white text and some padding */
    footer {
      background-color: #cf0006;
      color: white;
      padding: 15px;
      font-size:small;
    }
    .navbar-inner {
    min-height: 0px;
}

.navbar-brand,
.navbar-nav li a {
    line-height: 150px;
    height: 150px;
    padding-top: 0;
}
#popUpWindow{
//  background: lightblue;

}
    /* On small screens, set height to 'auto' for sidenav and grid */
    @media screen and (max-width: 767px) {
      .sidenav {
        height: auto;
        padding: 15px;
      }
      .row.content {height:auto;}
    }
    #logo {
   float: left;
   display: inline-block;
  }
  footer a {
  color: #ffffff;
  font-size: 20px;
  padding: 5px;
  transition: all .5s ease;
}
.pull-right{
  float:right;
  margin-right:-25px;
}
#usrImg{
  margin-left: auto;
  margin-right: auto;
  margin-top:-75px;
  margin-bottom: auto;
  display: block;
}
.centered-modal.in {
    display: flex !important;

}
.centered-modal .modal-dialog {
    margin: auto;

}
.form-control {
  background-color :#6d637b;
  border-color:#6d637b;
  border-radius:10px;
}
.close {
    color: #cf0006;
    opacity: 1;
}
.modal-header {

  border-bottom: 1px solid #6d637b;
  }

.modal-footer {

  border-top: 1px solid #6d637b;
}
</style>
<script type="text/javascript">
function validateUser(){
	var valid = true;
	$.ajax({
		type: "post",
		url: "validateUser",
		cache: false,		
		async : false,
		data:'userName=' + $("#uname").val() + "&password=" + $("#pwd").val() ,
		success: function(response){
			//alert(response);
			//alert(response.status);
			if(response.status==true){
				 $("#loginForm").submit();
			}
			else{
				alert("Invalid Credentials");
				valid=false;			
			}
						
		},
		error: function(){						
			alert('Error while request..');
		}		
	});
	return valid;
}
</script>
</head>
<body>

<nav class="navbar navbar-inverse">
  <div class="container-fluid">
    <div class="navbar-header">
      <button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#myNavbar">
        <span class="icon-bar"></span>
        <span class="icon-bar"></span>
        <span class="icon-bar"></span>
      </button>
      <img id="logo" src="${pageContext.request.contextPath}/resources/images/ap-24X7.png" width="150" height="150" alt=""/>
    </div>
    <div class="collapse navbar-collapse" id="myNavbar">

      <div class="pull-right">
        <ul class="nav navbar-nav">
            <li><button type="submit" class="btn navbar-btn btn-danger" name="Login" id="Login" data-toggle="modal" data-target="#popUpWindow" value="Login">Login</button></li>
        </ul>
      </div>
       
    </div>
  </div>

</nav>

<div class="container-fluid text-center">
 ${error}
  <div class="row content">
  
    <div class="col-sm-2 sidenav">
      <p><a href="#">Link</a></p>
      <p><a href="#">Link</a></p>
      <p><a href="#">Link</a></p>
    </div>
    <div class="col-sm-8 text-left">
      <h1>Welcome</h1>
      <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.</p>
      <hr>
      <h3>Test</h3>
      <p>Lorem ipsum...</p>
    </div>
    <div class="col-sm-2 sidenav">
      <div class="well">
        <p>ADS</p>
      </div>
      <div class="well">
        <p>ADS</p>
      </div>
    </div>
  </div>
</div>
<!-- Starting popup Window -->
<div class="modal fade centered-modal" id="popUpWindow">
<div class="modal-dialog" style="width:300px;">
    <div class="modal-content" style="border-radius:25px;height:300px;background-color:#312e37">
      <!-- header -->
      <div class="modal-header"s>
        <button type="button" class="close" data-dismiss="modal">&times;</button>
          <img src="${pageContext.request.contextPath}/resources/images/ul.png" id="usrImg" width="100px" height="100px" >
      </div>
      <!-- body -->
      <div class="modal-header">
          <center><h3 style="color:white">Login</h3></center>
        <h2 id="errorMsg"></h2>  
       <form action="departMents" method="post" id="loginForm">
          <div class="form-group" >
          <input type="text" name="userName" id="uname" required="true" placeholder="UserName" style="color:white" class="form-control"><br>
          <input type="password" name="password" id="pwd" required="true" placeholder="password" style="color:white" class="form-control"><br>
         <%--  <form:input path="userName" id="uname" required="true" placeholder="UserName" style="color:white" class="form-control"/><br>
            <form:input path="password" id="pwd" required="true" type="password" placeholder="password" style="color:white" class="form-control"/><br> --%>
          </div>
          <div class="modal-footer">
      		<center>  <button class="btn btn-primary" onclick="return validateUser();">Submit</button></center>
      	 </div>
        </form>
      </div>
      <!-- footer -->      
    </div>
  </div>
</div>
<!-- Ending popup Window -->
<footer class="container-fluid text-center">
  <p>copyright@annapurnabroadcastingprivateltd</p>

    <a href="#"><i class="fa fa-facebook"></i></a>
   <a href="#"><i class="fa fa-twitter"></i></a>
   <a href="#"><i class="fa fa-linkedin"></i></a>
   <a href="#"><i class="fa fa-google-plus"></i></a>
   <a href="#"><i class="fa fa-skype"></i></a>

</footer>

</body>
</html>

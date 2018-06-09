<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page isELIgnored="false" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>

<%@ taglib prefix='c' uri='http://java.sun.com/jsp/jstl/core' %>
<!DOCTYPE html>
<html lang="en">
<head>
  <title>Fervid</title>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
  <link href="https://maxcdn.bootstrapcdn.com/font-awesome/4.4.0/css/font-awesome.min.css" rel="stylesheet"/>
  <script src="//code.jquery.com/jquery-1.11.1.min.js"></script>
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
  <script type="text/javascript" src="http://code.jquery.com/jquery-1.9.1.min.js"></script>
  <script type="text/javascript">
  $(document).ready(function() {
      $("#testLink").click(function() {

      });
  });
  </script>
  <style>
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
      margin-top: -5px;
      margin-left:0px;
      padding-top:0px;
      background-color: #015291;
      height: auto;
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
.sidenav a {
    margin-left: auto;
    text-align: center;
    text-decoration: none;
    font-size: 20px;
    color: #ffffff;
    margin-left:0px;
}
.mylist li {
  border-bottom: 1px solid white;
  list-style: none;
  margin-left:-50px;
  text-align: center;
 }
 #iFrame1{
   margin-left:-15px;
   height:450px;
   width:1010px;
 }
.mylist
{
line-height:450%
}
#dispName {
    margin-top: 121px;
    margin-right: -20px;
}

  </style>
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
      <img id="logo" src="${pageContext.request.contextPath}/resources/images/ap-24X7.png" width="150" height="150" alt="">
    </div>
    <div class="collapse navbar-collapse" id="myNavbar">

      <div class="pull-right">
        <ul class="nav navbar-nav navbar-right">
            <li><form:form action="logOutUser"><input type="submit" class="btn navbar-btn btn-danger" name="Login" id="Login" value="Log Out"></form:form></li>
        </ul>
          <h4 id="dispName">Welcome ${userName}</h4>
      </div>

    </div>

  </div>
</nav>

<div class="container-fluid ">
  <div class="row content">
    <div class="col-sm-2 sidenav">
      <ul class="mylist">
      <c:choose>
       <c:when test="${userName=='admin'}">
       <li><a href="showEmp" id="testLink" target="iframe_a">Add Employee</a></li>       
        <li><a href="showWorkSheet" id="testLink" target="iframe_a">Create Worksheet</a></li>
      </c:when>   
      <c:otherwise>     
        <!-- <li><a href="viewWorksheet.html" id="testLink" target="iframe_a">View Worksheet</a></li>  -->        <li><a href="showGeneratorLog" id="testLink" target="iframe_a">Generator Log</a></li>
         <li><a href="changePassword" id="testLink" target="iframe_a">Change Password</a></li>
        <li><a href="showMainUps" id="testLink" target="iframe_a">Main Ups</a></li>
        <li><a href="showhtMeter" id="testLink" target="iframe_a">HT Meter Readings</a></li>
        <li><a href="showWorkReport" id="testLink" target="iframe_a">Work Report</a></li>
        <!-- <li><a href="userPrivileges" id="testLink" target="iframe_a">View Privileges</a></li> -->
        </c:otherwise>
        </c:choose>
      </ul>
    </div>
    <div class="col-sm-8">
        <iframe id="iFrame1" src="" frameborder="0" name="iframe_a" allowfullscreen></iframe>
    </div>
</div>

</div>

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

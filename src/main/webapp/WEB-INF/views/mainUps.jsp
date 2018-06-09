<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page isELIgnored="false" %>
    <%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
  <meta charset="utf-8">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"></script>
  <style>
  @import url(https://fonts.googleapis.com/css?family=Roboto:400,300,600,400italic);
* {
  margin: 0;
  padding: 0;
  box-sizing: border-box;
  -webkit-box-sizing: border-box;
  -moz-box-sizing: border-box;
  -webkit-font-smoothing: antialiased;
  -moz-font-smoothing: antialiased;
  -o-font-smoothing: antialiased;
  font-smoothing: antialiased;
  text-rendering: optimizeLegibility;
}

body {
  font-weight: 100;
  color: #777;
}

.container {
  height:auto;
  max-width:580px;
  width: 90%;
  margin-left:300px;
  margin-top:15px;
}

#contact input[type="text"],
#contact input[type="email"],
#contact input[type="tel"],
#contact input[type="url"],
#contact textarea,
#contact button[type="submit"] {
  font: 400 12px/16px "Roboto", Helvetica, Arial, sans-serif;
}

#contact {
  background: #ffffff;
  padding: 14px;
  margin: 10px 0;
  box-shadow: 0 0 20px 0 rgba(0, 0, 0, 0.2), 0 5px 5px 0 rgba(0, 0, 0, 0.24);
}

#contact h3 {
  display: block;
  font-size: 30px;
  font-weight: 300;
  margin-bottom: 10px;
}

#contact h4 {
  margin: 5px 0 15px;
  display: block;
  font-size: 13px;
  font-weight: 400;
}



#contact input[type="text"],
#contact input[type="email"],
#contact input[type="tel"],
#contact input[type="url"],
#contact text {
  width: 100%;
  border: 1px solid #ccc;
  background: #FFF;
  margin: 0 0 5px;
  padding: 7px;
}


#contact button[type="submit"] {
  cursor: pointer;
  width: 100%;
  border: none;
  background: #015291;
  color: #FFF;
  margin: 0 0 5px;
  padding: 10px;
  font-size: 15px;
}

#contact button[type="submit"]:hover {
  background: #43A047;
  -webkit-transition: background 0.3s ease-in-out;
  -moz-transition: background 0.3s ease-in-out;
  transition: background-color 0.3s ease-in-out;
}

#contact button[type="submit"]:active {
  box-shadow: inset 0 1px 3px rgba(0, 0, 0, 0.5);
}

.copyright {
  text-align: center;
}

#contact input:focus,
#contact textarea:focus {
  outline: 0;
  border: 1px solid #aaa;
}

::-webkit-input-placeholder {
  color: #888;
}

:-moz-placeholder {
  color: #888;
}

::-moz-placeholder {
  color: #888;
}

:-ms-input-placeholder {
  color: #888;
}
div {
    display: inline-block;
    border: medium none !important;
    width:auto;
}

div label {
    display: block;
    font-size:15px;
    font-weight: bold;
    font-family:sans-serif;
}
  </style>
</head>
<body>
<div class="container">
${success} 
        <form:form action="saveMainUps" modelAttribute="mainUps" id="contact">        
            <h3>Enter Main Ups Log</h3>
            <hr style="background-color:red">
            
            <div>
          <label>Date</label>
           <form:input path="date" required="true" style="width:105px" />
          
        </div>
        <div>
            <label>Time</label>
           <form:input path="time" required="true" />
        </div>
        <div>
            <label>HT KVAH</label>
           <form:input path="htkvah" required="true" />
        </div>
        <div>
            <label>CON</label>
           <form:input path="con" required="true"  style="width:420px"/>
        </div>
        <br>
        <div>
            <label>UPS-1&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</label>
        </div>
        <div>
            <label>R</label>
           <form:input path="ups1R" required="true" style="width:50px" />
        </div>
        <div>
            <label>Y</label>
            <form:input path="ups1Y" required="true" style="width:50px" />
        </div>
        <div>
            <label>B</label>
		<form:input path="ups1G" required="true" style="width:50px" />
        </div>

        <div style="margin-left:35px">
            <label>UPS-2</label>
        </div>
        <div>
            <label>R</label>
            <form:input path="ups2R" required="true" style="width:50px" />
        </div>
        <div>
            <label>Y</label>
            <form:input path="ups2Y" required="true" style="width:50px" />
        </div>
        <div>
            <label>B</label>
            <form:input path="ups2G" required="true" style="width:50px" />
        </div>
        <br>
        <div>
            <label>UPS-OUT</label>
        </div>
        <div>
            <label>R</label>
            <form:input path="upsoutR" required="true" style="width:50px" />
        </div>
        <div>
            <label>Y</label>
            <form:input path="upsoutY" required="true" style="width:50px" />
        </div>
        <div>
            <label>B</label>
            <form:input path="upsoutG" required="true" style="width:50px" />
        </div>
       <br>
        <div>
            <label>EB VOLTAGE</label>
        </div>
        <div>
            <label>R-Y</label>
           <form:input path="ry" required="true" style="width:105px" />
        </div>
        <div>
            <label>Y-B</label>
            <form:input path="yb" required="true" style="width:105px" />
        </div>
        <div>
            <label>B-R</label>
            <form:input path="br" required="true" style="width:105px" />
        </div>
        <br>
         <div>
            <label>AMPS</label>
        </div>
        <div>
            <label>R</label>
            <form:input path="ampsR" required="true" style="width:50px" />
        </div>
        <div>
            <label>Y</label>
            <form:input path="ampsY" required="true" style="width:50px" />
        </div>
        <div>
            <label>B</label>
            <form:input path="ampsG" required="true" style="width:50px" />
        </div>
        
        <br>
        
        <div>
          <label>VERIFIED BY</label>
           <form:input path="verifiedBy" required="true" style="width:420px" />
        </div>
        <br>
  			<button name="submit" type="submit" id="contact-submit" data-submit="...Sending">Submit</button>
        </form:form>
    </div>
</body>
</html>
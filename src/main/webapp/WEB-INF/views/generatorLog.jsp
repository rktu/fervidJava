<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page isELIgnored="false" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<!DOCTYPE>
<html lang="en">
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
  max-width:600px;
  width: 80%;
  margin-left:300px;
  margin-top:10px;
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
  margin: 5px 0;
  box-shadow: 0 0 20px 0 rgba(0, 0, 0, 0.2), 0 5px 5px 0 rgba(0, 0, 0, 0.24);
}

#contact h3 {
  display: block;
  font-size: 28px;
  font-weight: 300;
  margin-bottom: 0px;
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
#contact textarea {
  width: 100%;
  border: 1px solid #ccc;
  background: #FFF;
  margin: 0 0 5px;
  padding: 7px;
}

#contact input[type="text"]:hover,
#contact input[type="email"]:hover,
#contact input[type="tel"]:hover,
#contact input[type="url"]:hover,
#contact textarea:hover {
  -webkit-transition: border-color 0.3s ease-in-out;
  -moz-transition: border-color 0.3s ease-in-out;
  transition: border-color 0.3s ease-in-out;
  border: 1px solid #aaa;
}

#contact textarea {
  height: 100px;
  max-width: 100%;
  resize: none;
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
    font-size:18px;
    font-weight: bold;
    font-family:sans-serif;
}
  </style>
</head>
<body>
<div class="container">
${success} 
        <form:form action="saveGeneratorLog" modelAttribute="generatorLog" id="contact">
            <h3>Enter Generator Log</h3>
            <hr style="background-color:red">
        <div>
            <label>Date</label>
            <form:input path="date" required="true" style="width:470px" />
        </div>
        <div>
            <label>Start Time</label>
            <form:input path="startTime" required="true" style="width:470px"  />
        </div>
         <div>
            <label>Start KWH</label>
            <form:input path="startKWH" required="true" style="width:470px"   />
        </div>
        <div>
            <label>Stop KWH</label>
            <form:input path="stopKWH" required="true" style="width:470px"  />
        </div>
        <div>
            <label>R-PH</label>
            <form:input path="r" style="width:155px" required="true" />
        </div>
        <div>
            <label>Y-PH</label>
            <form:input path="y" style="width:155px" required="true" />
        </div>
        <div>
            <label>B-PH</label>
            <form:input path="b" style="width:155px" required="true" />
        </div>
        
        <div>
            <label>Stop Time</label>
            <form:input path="stopTime" required="true" style="width:470px"  />
        </div>
          <div>
            <label>DG Run TIme</label>
            <form:input path="dgRunTime" required="true" style="width:470px"  />
        </div>
         <div>
            <label>Diesel consumed</label>
            <form:input path="dieselConsumed" required="true" style="width:470px"  />
        </div>
         <div>
            <label>Diesel stock(DG)</label>
            <form:input path="dieselStockDg" required="true" style="width:470px"  />
        </div>
        <div>
            <label>Diesel Stock(can)</label>
            <form:input path="dieselStockCan" required="true" style="width:470px"  />
        </div>
       
        <div>
            <label>Diesel Purchase</label>
            <form:input path="dieselPurchase" required="true" style="width:470px"  />
        </div>
       
          <div>
            <label>DG On Purpose</label>
            <form:input path="dgOnPurpose" required="true" style="width:470px"  />
        </div>
          <div >
            <label>Verified By</label>
            <form:input path="verifiedBy" required="true" style="width:470px"  />
        </div>
        <br>
        <br>
  		<button name="submit" type="submit" id="contact-submit" data-submit="...Sending">Submit</button>

         </form:form>
    </div>
</body>
</html>

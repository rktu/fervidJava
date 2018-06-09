<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page isELIgnored="false" %>
    <%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
  <!-- Importing External js and css files for datatable -->
	<link rel="stylesheet" type="text/css" href="//cdn.datatables.net/1.10.7/css/jquery.dataTables.min.css" />
    <script src="//cdn.datatables.net/1.10.7/js/jquery.dataTables.min.js"></script>
  
  </style>
  <script type="text/javascript">
  $(document).ready(function () {
      $('#datatable').dataTable();

  });
  </script>
</head>
<body>
             <div style="width: 600px;border: 2px solid black; padding: 5px">
            <table id="datatable">
                <thead>
                    <tr>
                        <th>ID
                        </th>
                        <th>City
                        </th>
                        <th>Country
                        </th>
                        <th>Continent
                        </th>
                         <th>Edit
                        </th>                         
                    </tr>
                </thead>
                <tbody>
                    <tr>
                        <td>1</td>
                        <td>Montería</td>
                        <td>Colombia</td>
                        <td>South America</td>
                        <td>Edit</td>
                    </tr>
                    <tr>
                        <td>2</td>
                        <td>Birmingham</td>
                        <td>United Kingdom</td>
                        <td>Europe</td>
                        <td>Edit</td>
                    </tr>
                    <tr>
                        <td>3</td>
                        <td>Bangalore</td>
                        <td>India</td>
                        <td>Asia</td>
                        <td>Edit</td>
                    </tr>
                    <tr>
                        <td>4</td>
                        <td>Tokyo</td>
                        <td>Japan</td>
                        <td>Asia</td>
                    </tr>
                    <tr>
                        <td>5</td>
                        <td>Kuala Lumpur</td>
                        <td>Malaysia</td>
                        <td>Asia</td>
                    </tr>
                    <tr>
                        <td>6</td>
                        <td>Rio de Janeiro</td>
                        <td>Brazil</td>
                        <td>South America</td>
                    </tr>
                    <tr>
                        <td>7</td>
                        <td>Ipoh</td>
                        <td>Malaysia</td>
                        <td>Asia</td>
                    </tr>
                    <tr>
                        <td>8</td>
                        <td>Tawau</td>
                        <td>Malaysia</td>
                        <td>Asia</td>
                    </tr>
                    <tr>
                        <td>9</td>
                        <td>Hiroshima</td>
                        <td>Japan</td>
                        <td>Asia</td>
                    </tr>
                    <tr>
                        <td>10</td>
                        <td>Cannes</td>
                        <td>France</td>
                        <td>Europe</td>
                    </tr>
                    <tr>
                        <td>11</td>
                        <td>London</td>
                        <td>United Kingdom</td>
                        <td>Europe</td>
                    </tr>                
                </tbody>
            </table>
        </div>
</body>
</html>
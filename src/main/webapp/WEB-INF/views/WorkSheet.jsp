<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page isELIgnored="false" %>
    <%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<!DOCTYPE html>

<html lang="en">
<head>
    <!-- The jQuery library is a prerequisite for all jqSuite products -->
    <script
  src="https://code.jquery.com/jquery-1.12.4.min.js"
  integrity="sha256-ZosEbRLbNQzLpnKIkEdrPv7lOy9C27hHQ+Xp8a4MxAQ="
  crossorigin="anonymous"></script>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/jqueryui/1.11.4/themes/redmond/jquery-ui.min.css"/>
<link rel="stylesheet" href="https://ajax.googleapis.com/ajax/libs/jqueryui/1.11.4/themes/smoothness/jquery-ui.css">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/free-jqgrid/4.15.2/css/ui.jqgrid.min.css"/>
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/free-jqgrid/4.15.2/jquery.jqgrid.min.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jqueryui/1.11.4/jquery-ui.min.js"></script> 
</head>

    <script type="text/javascript">

        $(document).ready(function () {
        	
$("#jqGrid").jqGrid({
                url: 'getWorkSheetList',
				// we set the changes to be made at client side using predefined word clientArray				
                datatype: "json",    
               	colModel: [
                	{
						label: 'Id',
                        name: 'wsId',
                        width: 15,
                        key: true,
                        index:'wsId',
                        editable: true
                        
                    }, 
                	{
						label: 'EmpName',
                        name: 'empName',
                        width: 30,
                        editable: true
                    },
                    {
						label: 'Sunday',
                        name: 'sunDay',
                        width: 30,
						editable: true
                    },
                    {
						label: 'Monday',
                        name: 'monDay',
                        width: 30,
                        editable: true // must set editable to true if you want to make the field editable
                    },
                    {
						label: 'Tuesday',
                        name: 'tueDay',
                        width: 30,
                        editable: true                        
                    }
                    ,
                    {
						label: 'Wednesday',
                        name: 'wedDay',
                        width: 30,
                        editable: true                       
                    },
                    {
						label: 'Thursday',
                        name: 'thuDay',
                        width: 30,
                        editable: true                        
                    },
                    {
						label: 'Friday',
                        name: 'friDay',
                        width: 30,
                        editable: true                        
                    },
                    {
						label: 'Saturday',
                        name: 'satDay',
                        width: 30,
                        editable: true                        
                    },
                    {
						label: 'Date',
                        name: 'createdDate',
                        width: 30,
                        editable: true                        
                    }
                ],
               
                sortname: 'wsId',
				sortorder : 'asc',
				loadonce: true,
				viewrecords: true,
				height: 150,
		        width: 800,
		        rowNum: 10,		        		       
		        loadonce: true,
                pager: "#jqGridPager"            
         
        });
           
            $('#jqGrid').navGrid('#jqGridPager', { edit: true, add: true, del: true, search: true, refresh: true, },
            {
            	beforeShowForm: function(form) {
                    $('#wsId', form).attr("disabled", true);
                    $('#createdDate', form).attr("disabled", true);
                },
                //EDIT OPTIONS
                width: 200,
                url: 'editWorkSheet',                
                closeAfterEdit: true,             
                afterComplete: function (response) {
                    $('#jqGrid').setGridParam({ datatype: 'json', page: 1 }).trigger('reloadGrid');
                    //alert(response.responseText)
                    reloadDataExport();
                }
            },
            
                {
            	beforeShowForm: function(form) {
                    $('#wsId', form).attr("disabled", true);    
                    $('#createdDate', form).attr("disabled", true); 
                },
                    //ADD OPTIONS
                    width: 600,
                    url: 'addWorkSheet',
                    closeAfterAdd: true,                   
                    afterComplete: function (response) {
                        $('#jqGrid').setGridParam({ datatype: 'json', page: 1 }).trigger('reloadGrid');
                       // alert(response.responseText)
                        reloadDataExport();
                    },

                },
            
                 {
                	//DELETE OPTIONS
                	width: 600,     
                	url: 'delWorkSheet',
                    closeAfterDelete: true,
                    msg:"Are you sure u want to delete this data?",
                    afterComplete: function (response) {
                        $('#jqGrid').setGridParam({ datatype: 'json', page: 1 }).trigger('reloadGrid');
                        alert("Deleted Successfully")
                        reloadDataExport();
                    },
                 }
            );
          //Jqgrid End
          $("#export").on("click", function(){
				$("#jqGrid").jqGrid("exportToExcel",{
					includeLabels : true,
					includeGroupHeader : true,
					includeFooter: true,
					fileName : "jqGridExport.xlsx",
					maxlength : 40 // maxlength for visible string data 
				})
			})
          });
    </script>
<script>
	$(document).ready(function() {
		$(function() {
			$("#datepicker").datepicker({
				dateFormat : 'yy-mm-dd'
			});
		});
		$("#datepicker").change(function() {
			this.form.submit();
		});
	});
</script>
<script type="text/javascript">
	function generateExcel(){	
	var data = $('#txt').val();
	if (data == '')
		return;
	JSONToCSVConvertor(data, "WorkSheet Report", true);
}
	$(document).ready(function() {
		reloadDataExport();
	});
	
		function reloadDataExport() {
			$.ajax({
				type : "get",
				url : "getWorkSheetList",
				async : false,
				dataType : 'text',
				success : function(response) {
					$('#txt').val(response);
				},
				error : function() {
					alert('Error while request..');
				}
			});
		}		

			function JSONToCSVConvertor(JSONData, ReportTitle, ShowLabel) {
				//If JSONData is not an object then JSON.parse will parse the JSON string in an Object
				var arrData = typeof JSONData != 'object' ? JSON
						.parse(JSONData) : JSONData;

				var CSV = '';
				//Set Report title in first row or line

				CSV += ReportTitle + '\r\n\n';

				//This condition will generate the Label/Header
				if (ShowLabel) {
					var row = "";

					//This loop will extract the label from 1st index of on array
					for ( var index in arrData[0]) {

						//Now convert each value to string and comma-seprated
						row += index + ',';
					}

					row = row.slice(0, -1);

					//append Label row with line break
					CSV += row + '\r\n';
				}

				//1st loop is to extract each row
				for (var i = 0; i < arrData.length; i++) {
					var row = "";

					//2nd loop will extract each column and convert it in string comma-seprated
					for ( var index in arrData[i]) {
						row += '"' + arrData[i][index] + '",';
					}

					row.slice(0, row.length - 1);

					//add a line break after each row
					CSV += row + '\r\n';
				}

				if (CSV == '') {
					alert("Invalid data");
					return;
				}

				//Generate a file name
				var fileName = "MyReport_";
				//this will remove the blank-spaces from the title and replace it with an underscore
				fileName += ReportTitle.replace(/ /g, "_");

				//Initialize file format you want csv or xls
				var uri = 'data:text/csv;charset=utf-8,' + escape(CSV);

				// Now the little tricky part.
				// you can use either>> window.open(uri);
				// but this will not work in some browsers
				// or you will not get the correct file extension    

				//this trick will generate a temp <a /> tag
				var link = document.createElement("a");
				link.href = uri;

				//set the visibility hidden so it will not effect on your web-layout
				link.style = "visibility:hidden";
				link.download = fileName + ".csv";

				//this part will append the anchor tag and remove it after automatic click
				document.body.appendChild(link);
				link.click();
				document.body.removeChild(link);
			}
		
</script>
</head>
<body>
<div>
<form action="showWorkSheet">
               <label>Select Date : </label>        
              <input type="text" name="fromDate" value="${fromDate}" id="datepicker"/>
</form>
        <table id="jqGrid"></table>
    	<div id="jqGridPager"></div>    	    		
</div>
<div class='mydiv'>    
    <textarea id="txt" style="display: none" class='txtarea'></textarea>
    <button onclick="generateExcel();">Export to Excel</button>
</div>
</body>
</html>
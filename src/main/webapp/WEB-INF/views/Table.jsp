<!DOCTYPE html>

<html lang="en">
<head>
    <!-- The jQuery library is a prerequisite for all jqSuite products -->
    <script
  src="https://code.jquery.com/jquery-1.12.4.min.js"
  integrity="sha256-ZosEbRLbNQzLpnKIkEdrPv7lOy9C27hHQ+Xp8a4MxAQ="
  crossorigin="anonymous"></script>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/jqueryui/1.11.4/themes/redmond/jquery-ui.min.css"/>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/free-jqgrid/4.15.2/css/ui.jqgrid.min.css"/>
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/free-jqgrid/4.15.2/jquery.jqgrid.min.js"></script>    
</head>
    <script type="text/javascript">

        $(document).ready(function () {
        	
$("#jqGrid").jqGrid({
                url: 'getEmpList',
				// we set the changes to be made at client side using predefined word clientArray
                datatype: "json",
                colModel: [
                	{
						label: 'ID',
                        name: 'empId',
                        width: 25,
                        key: true,
                        index:'empId',
                        editable: true
                        
                    },
                    {
						label: 'Name',
                        name: 'empName',
                        width: 50,
						editable: true,
						editrules : { required: true}
                    },
                    {
						label: 'Phone',
                        name: 'empPhone',
                        width: 50,
                        editable: true // must set editable to true if you want to make the field editable
                    },
                    {
						label: 'Address',
                        name: 'empAddress',
                        width: 50,
                        editable: true                        
                    }
                    ,
                    {
						label: 'User Name',
                        name: 'empUsername',
                        width: 50,
                        editable: false                       
                    },
                    {
						label: 'Password',
                        name: 'empPassword',
                        width: 50,
                        editable: false                        
                    },
                    {
						label: 'Status',
                        name: 'updateStatus',
                        width: 25,
                        editable: false                        
                    }
                ],
               /*  loadComplete : function(){
                	 var rows = jQuery("#jqGrid").jqGrid('getRowData');
                     var pageSize = $('#jqGrid').getGridParam("rowNum");
                     //alert(pageSize);
                     var currentPage = $('#jqGrid').getGridParam('page');
                     //alert(currentPage);
                     for (var i = 0; i < rows.length; i++) {
                         var row = rows[i];
                         alert(row['updateStatus']);
                         if(row['updateStatus']==2){                        
                        	 $('#jqGrid').hideCol('empPassword');
                        	//alert( $('#empPassword').val()); 
                         }
                         if(row['updateStatus']==1){
                        	 $('#jqGrid').showCol('empPassword');                        	 
                         }
                        }
                    //$(this).jqGrid('hideCol',["Password"]);
               
                }, */
                sortname: 'empId',
				sortorder : 'asc',
				loadonce: true,
				viewrecords: true,
				height: 150,
		        width: 500,
		        rowNum: 10,		        		       
		        loadonce: true,
                pager: "#jqGridPager"            
         
        });
           
            $('#jqGrid').navGrid('#jqGridPager', { edit: true, add: true, del: true, search: true, refresh: true, },
            {
            	beforeShowForm: function(form) {
                    $('#empId', form).attr("disabled", true);
                },
                //EDIT OPTIONS
                width: 200,
                url: 'editEmp',                
                closeAfterEdit: true,             
                afterComplete: function (response) {
                    $('#jqGrid').setGridParam({ datatype: 'json', page: 1 }).trigger('reloadGrid');
                    //alert(response.responseText)
                }
            },
            
                {
            	beforeShowForm: function(form) {
                    $('#empId', form).attr("disabled", true);
                    $('#empPassword', form).attr("disabled", true);
                    $('#empUsername', form).attr("disabled", true);                    
                },
                    //ADD OPTIONS
                    width: 600,
                    url: 'addEmp',
                    closeAfterAdd: true,                   
                    afterComplete: function (response) {
                        $('#jqGrid').setGridParam({ datatype: 'json', page: 1 }).trigger('reloadGrid');
                       // alert(response.responseText)
                    },

                },
            
                 {
                	//DELETE OPTIONS
                	width: 600,     
                	url: 'delEmp',
                    closeAfterDelete: true,
                    msg:"Are you sure u want to delete this data?",
                    afterComplete: function (response) {
                        $('#jqGrid').setGridParam({ datatype: 'json', page: 1 }).trigger('reloadGrid');
                        alert("Deleted Successfully")
                    },
                 }
            );
          });

    </script>
</head>
<body>
<div>
        <table id="jqGrid"></table>
    	<div id="jqGridPager"></div>    	
</div>
</body>
</html>
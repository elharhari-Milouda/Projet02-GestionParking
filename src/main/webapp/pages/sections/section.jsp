<!--  
<div class="table-responsive">

	<fieldset>
		<legend>Informations Section</legend>
		<form action="../SectionController" method="get">
		<table border="0">
			<tr>
				<td>id</td>
				<td><input id="id" type="text" name="id" value="" required="" /></td>
			</tr>
			<tr>
				<td>code</td>
				<td><input id="code" type="date" name="code" value="" required="" /></td>
			</tr>
			<tr>
				<td><input type="hidden" id="id"></td>
				<td><input id="add" type="submit" value="Envoyer" /></td>
			</tr>
		</table>
		</form>
	</fieldset>


	<fieldset>
		<legend>Liste des sections</legend>

		<table border="1" class="tab">
			<thead>
				<tr>
					<th>Id</th>
					<th>Code <br>
				</tr>
			</thead>
			<tbody id="content">

			</tbody>
		</table>

	</fieldset>
</div>
-->
  
 <%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html lang="en">

<head>
  <!-- Required meta tags -->
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
  <title>Skydash Admin</title>
  <!-- plugins:css -->
  <link rel="stylesheet" href="../../vendors/feather/feather.css">
  <link rel="stylesheet" href="../../vendors/ti-icons/css/themify-icons.css">
  <link rel="stylesheet" href="../../vendors/css/vendor.bundle.base.css">
  <!-- endinject -->
  <!-- Plugin css for this page -->
  <link rel="stylesheet" href="../../vendors/datatables.net-bs4/dataTables.bootstrap4.css">
  <link rel="stylesheet" href="../../vendors/ti-icons/css/themify-icons.css">
  <link rel="stylesheet" type="text/css" href="../../js/select.dataTables.min.css">
  <!-- End plugin css for this page -->
  <!-- inject:css -->
  <link rel="stylesheet" href="../../css/vertical-layout-light/style.css">
  <!-- endinject -->
  <link rel="shortcut icon" href="../../images/favicon.png" />
  
  
</head>
<body>
  <div class="container-scroller">
    <!-- header -->
    <%@ include file="../../template/header.jsp" %>
    <!-- header end -->
    
    <div class="container-fluid page-body-wrapper">
    
      <!-- sideBar -->
      <%@ include file="../../template/menu.jsp" %>
      <!-- sideBar end -->
      
      <div class="main-panel">
        <div class="content-wrapper">
          <!-- bodyyyyyy -->
        </div>
        
        <!-- footer -->
        <%@ include file="../../template/footer.jsp" %>
        <!-- footer end -->
        
      </div>
    </div>   
    
    <!-- page-body-wrapper ends -->
  </div>
  <!-- container-scroller -->

  <!-- plugins:js -->
  <script src="../../vendors/js/vendor.bundle.base.js"></script>
  <!-- endinject -->
  <!-- Plugin js for this page -->
  <script src="../../vendors/chart.js/Chart.min.js"></script>
  <script src="../../vendors/datatables.net/jquery.dataTables.js"></script>
  <script src="../../vendors/datatables.net-bs4/dataTables.bootstrap4.js"></script>
  <script src="../../js/dataTables.select.min.js"></script>

  <!-- End plugin js for this page -->
  <!-- inject:js -->
  <script src="../../js/off-canvas.js"></script>
  <script src="../../js/hoverable-collapse.js"></script>
  <script src="../../js/template.js"></script>
  <script src="../../js/settings.js"></script>
  <script src="../../js/todolist.js"></script>
  <!-- endinject -->
  <!-- Custom js for this page-->
  <script src="../../js/dashboard.js"></script>
  <script src="../../js/Chart.roundedBarCharts.js"></script>
  <!-- End custom js for this page-->
</body>

</html>

  
<%@page import="java.sql.ResultSet"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html lang="en">

<head>
<!-- Required meta tags -->
<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<title>Skydash Admin</title>
<!-- plugins:css -->
<link rel="stylesheet" href="vendors/feather/feather.css">
<link rel="stylesheet" href="vendors/ti-icons/css/themify-icons.css">
<link rel="stylesheet" href="vendors/css/vendor.bundle.base.css">
<!-- endinject -->
<!-- Plugin css for this page -->
<link rel="stylesheet"
	href="vendors/datatables.net-bs4/dataTables.bootstrap4.css">
<link rel="stylesheet" href="vendors/ti-icons/css/themify-icons.css">
<link rel="stylesheet" type="text/css"
	href="js/select.dataTables.min.css">
<!-- End plugin css for this page -->
<!-- inject:css -->
<link rel="stylesheet" href="css/vertical-layout-light/style.css">
<!-- endinject -->
<link rel="shortcut icon" href="images/favicon.png" />


</head>
<body>
	<%@page import="java.sql.*"%>
	<%@page import="java.util.List"%>
	<%@page import="connexion.Connexion"%>
	<%@page import="service.*"%>
	<%@page import="entities.*"%>
	<%
	SectionService ss = new SectionService();
	PlaceService ps = new PlaceService();
	%>

	<div class="container-scroller">
		<!-- header -->
		<%@ include file="../template/header.jsp"%>
		<!-- header end -->

		<div class="container-fluid page-body-wrapper">

			<!-- sideBar -->
			<%@ include file="../template/menu.jsp"%>
			<!-- sideBar end -->

			<div class="main-panel">
				<div class="content-wrapper">
					<!-- bodyyyyyy -->
				
					<!-- body end -->

				</div>

				<!-- footer -->
				<%@ include file="../template/footer.jsp"%>
				<!-- footer end -->

			</div>
		</div>

		<!-- page-body-wrapper ends -->
	</div>
	<!-- container-scroller -->

	<!-- plugins:js -->
	<script src="vendors/js/vendor.bundle.base.js"></script>
	<!-- endinject -->
	<!-- Plugin js for this page -->
	<script src="script/Section.js" type="text/javascript"></script>
	<script src="vendors/chart.js/Chart.min.js"></script>
	<script src="vendors/datatables.net/jquery.dataTables.js"></script>
	<script src="vendors/datatables.net-bs4/dataTables.bootstrap4.js"></script>
	<script src="js/dataTables.select.min.js"></script>

	<!-- End plugin js for this page -->
	<!-- inject:js -->
	<script src="js/off-canvas.js"></script>
	<script src="js/hoverable-collapse.js"></script>
	<script src="js/template.js"></script>
	<script src="js/settings.js"></script>
	<script src="js/todolist.js"></script>
	<!-- endinject -->
	<!-- Custom js for this page-->
	<script src="js/dashboard.js"></script>
	<script src="js/Chart.roundedBarCharts.js"></script>
	
	<!-- End custom js for this page-->
</body>

</html>



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
										
					<div class="row">
						<div class="col-lg-6 grid-margin stretch-card">
							<div class="card">
								<div class="card-body">
									<div class="chartjs-size-monitor">
										<div class="chartjs-size-monitor-expand">
											<div class=""></div>
										</div>
										<div class="chartjs-size-monitor-shrink">
											<div class=""></div>
										</div>
									</div>
									<h4 class="card-title">Nombre de places par sections</h4>
									<canvas id="barChart"
										style="display: block; height: 289px; width: 579px;"
										width="694" height="346" class="chartjs-render-monitor"></canvas>
								</div>
							</div>
						</div>
						<div class="col-lg-6 grid-margin stretch-card">
							<div class="card">
								<div class="card-body">
									<h4 class="card-title">Places selon l'etat d'occupation</h4>
									<canvas id="pieChart"></canvas>
								</div>
							</div>
						</div>
					</div>
					
					
					<!-- end body -->
				</div>
				<!-- body end -->

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
	<script>
		function get_data(){
			$.get("http://localhost:8000/meteo.php", funtion(d){
				
			},"json");
		}
	</script>

	<script>
		$(document)
				.ready(
						function() {
							$
									.ajax({
										url : "SectionServlet",
										data : {
											op : "load"
										},
										type : 'POST',
										success : function(data, textStatus,
												jqXHR) {
											remplir(data);
										},
										error : function(jqXHR, textStatus,
												errorThrown) {
											console.log(textStatus);
										}
									});
							function remplir(data) {
								let section = [];
								let place = [];
								let placeOccp = 0;
								var nbrPlaces = 0;
								var PlacesVide = 0;
								var ligne = "";
								var cpt =0;
								data
										.forEach(function(e) {
											ligne += "<tr><td>"
													+ e.id
													+ "</td><td>"
													+ e.numero
													+ "</td></tr>";
											//
											section[cpt] = e.id;
											place[cpt] = e.numero;
											placeOccp += e.section;
											nbrPlaces += e.numero;
											nbrPlaces -= e.section;
											cpt++;
											'use strict';
								var data = {
									labels :  section,
									datasets : [ {
										label : '# of Votes',
										data : place,
										backgroundColor : [ 'rgba(255, 99, 132, 0.2)',
												'rgba(54, 162, 235, 0.2)',
												'rgba(255, 206, 86, 0.2)',
												'rgba(75, 192, 192, 0.2)',
												'rgba(153, 102, 255, 0.2)',
												'rgba(255, 159, 64, 0.2)' ],
										borderColor : [ 'rgba(255,99,132,1)',
												'rgba(54, 162, 235, 1)', 'rgba(255, 206, 86, 1)',
												'rgba(75, 192, 192, 1)', 'rgba(153, 102, 255, 1)',
												'rgba(255, 159, 64, 1)' ],
										borderWidth : 1,
										fill : false
									} ]
								};
								var options = {
									scales : {
										yAxes : [ {
											ticks : {
												beginAtZero : true
											}
										} ]
									},
									legend : {
										display : false
									},
									elements : {
										point : {
											radius : 0
										}
									}
					
								};
								var doughnutPieData = {
									    datasets: [{
									      data: [placeOccp, nbrPlaces],
									      backgroundColor: [
									        'rgba(255, 99, 132, 0.5)',
									        'rgba(54, 162, 235, 0.5)',
									        'rgba(255, 206, 86, 0.5)',
									        'rgba(75, 192, 192, 0.5)',
									        'rgba(153, 102, 255, 0.5)',
									        'rgba(255, 159, 64, 0.5)'
									      ],
									      borderColor: [
									        'rgba(255,99,132,1)',
									        'rgba(54, 162, 235, 1)',
									        'rgba(255, 206, 86, 1)',
									        'rgba(75, 192, 192, 1)',
									        'rgba(153, 102, 255, 1)',
									        'rgba(255, 159, 64, 1)'
									      ],
									    }],

									    // These labels appear in the legend and in the tooltips when hovering different arcs
									    labels: [
									      'Places occuppees',
									      'Places vides',
									    ]
									  };
								var doughnutPieOptions = {
									    responsive: true,
									    animation: {
									      animateScale: true,
									      animateRotate: true
									    }
									  };
								// Get context with jQuery - using jQuery's .get() method.
								if ($("#barChart").length) {
									var barChartCanvas = $("#barChart").get(0).getContext("2d");
									// This will get the first returned node in the jQuery collection.
									var barChart = new Chart(barChartCanvas, {
										type : 'bar',
										data : data,
										options : options
									});
								}
								if ($("#pieChart").length) {
								    var pieChartCanvas = $("#pieChart").get(0).getContext("2d");
								    var pieChart = new Chart(pieChartCanvas, {
								      type: 'pie',
								      data: doughnutPieData,
								      options: doughnutPieOptions
								    });
								  }
											//
										});
								$("#content").html(ligne);
								//
								
								//
							}
						});
	</script>


	<!-- End custom js for this page-->
</body>

</html>




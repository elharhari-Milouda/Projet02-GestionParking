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
					<div class="card">
						<div class="card-body">

							<!-- alerte -->
							<%
							Message m = (Message) session.getAttribute("msg");
							if (m != null) {
							%>
							<div class="alert alert-<%=m.getCssClasse()%>" role="alert">
								<%=m.getContent()%>
							</div>
							<%
							}
							%>
							<%
							session.removeAttribute("msg");
							%>
							<!-- end alerte -->

							<div class="form-group" style="float: right;">
								<div class="input-group">
									<input type="text" class="form-control"
										placeholder="Numero place" aria-label="Numero place"
										name="numPlace" id="numPlace">
									<div class="input-group-append">
										<button class="btn btn-sm btn-primary" type="button" href="PlaceServlet"
											id="search">Search</button>
									</div>
								</div>
							</div>

							<input style="float: right;" type="button"
								class="btn btn-primary mr-2" onclick="showPop();"
								value="Ajouter Place" />
							<div class="table-responsive">
								<br>

								<table class="table table-striped">
									<thead>
										<tr>
											<th>Identifiant</th>
											<th>Numero</th>
											<th>Etat</th>
											<th>Type</th>
											<th>Section</th>
											<th>Changer etat</th>
											<th>Delete</th>
											<th>Update</th>
										</tr>
									</thead>
									<tbody id="content">

									</tbody>
								</table>
							</div>
						</div>
					</div>
					<!-- body end -->

					<!-- Formulaire d'ajout de place -->

					<div class="active" id="popUp"
						style="display: none; position: fixed; top: 50%; left: 50%; transform: translate(-50%, -50%) scale(1); transition: 200ms ease-in-out; border: 1px solid black; border-radius: 10px; z-index: 10; background-color: white; width: 500px; max-width: 80%;">

						<div class="modal-body">
							<div class="card">
								<div class="card-body">
									<h4 class="card-title">Formulaire d'ajout d'une place</h4>									
										<div class="form-group row">
											<label for="exampleInputUsername2"
												class="col-sm-3 col-form-label">Numero</label>
											<div class="col-sm-9">
												<input type="text" class="form-control" id="numero"
													name="numero" value="" required="" placeholder="Numero">
											</div>
										</div>
										<div class="form-group row">
											<label for="exampleInputUsername2"
												class="col-sm-3 col-form-label">Etat</label>
											<div class="col-sm-9">
												<select class="form-control" id="etat" name="etat" value=""
													required="">
													<option>Vide</option>
													<option>Occupee</option>
												</select>
											</div>
										</div>
										<div class="form-group row">
											<label for="exampleInputUsername2"
												class="col-sm-3 col-form-label">Type</label>
											<div class="col-sm-9">
												<select class="form-control" id="type" name="type" value=""
													required="">
													<option>Voiture</option>
													<option>Camion</option>
													<option>Moto</option>
												</select>
											</div>
										</div>
										<div class="form-group row">
											<label for="exampleInputUsername2"
												class="col-sm-3 col-form-label">Section</label>
											<div class="col-sm-9">
												<select class="form-control" id="section" name="section"
													value="" required="">
													<%
													for (Section section : ss.findAll()) {
													%>
													<option><%=section.getId()%></option>
													<%
													}
													%>
												</select>
											</div>
										</div>
										<input id="add" type="submit" value="Valider"
											class="btn btn-primary mr-2" onclick="hidePopUp();" /> <input
											id="hidePop" onclick="hidePopUp();" value="Cancel"
											class="btn btn-light" style="width: 100px;" />								
								</div>
							</div>
						</div>
					</div>

					<!-- end Formulaire d'ajout de place -->

					<!-- Formulaire de modification de place -->

					<div class="active" id="popUpp"
						style="display: none; position: fixed; top: 50%; left: 50%; transform: translate(-50%, -50%) scale(1); transition: 200ms ease-in-out; border: 1px solid black; border-radius: 10px; z-index: 10; background-color: white; width: 500px; max-width: 80%;">

						<div class="modal-body">
							<div class="card">
								<div class="card-body">
									<h4 class="card-title">Formulaire de modification d'une
										place</h4>
									<form method="POST" action="PlaceServlet">
										<div class="form-group row">
											<label for="exampleInputUsername2"
												class="col-sm-3 col-form-label">Identifiant</label>
											<div class="col-sm-9">
												<input type="text" class="form-control" id="id" name="id"
													value="" required="" placeholder="Identifiant">
											</div>
										</div>
										<div class="form-group row">
											<label for="exampleInputUsername2"
												class="col-sm-3 col-form-label">Numero</label>
											<div class="col-sm-9">
												<input type="text" class="form-control" id="numeroo"
													name="numeroo" value="" required="" placeholder="Numero">
											</div>
										</div>
										<div class="form-group row">
											<label for="exampleInputUsername2"
												class="col-sm-3 col-form-label">Etat</label>
											<div class="col-sm-9">
												<select class="form-control" id="etatt" name="etatt"
													value="" required="">
													<option>Vide</option>
													<option>Occupee</option>
												</select>
											</div>
										</div>
										<div class="form-group row">
											<label for="exampleInputUsername2"
												class="col-sm-3 col-form-label">Type</label>
											<div class="col-sm-9">
												<select class="form-control" id="typee" name="typee"
													value="" required="">
													<option>Voiture</option>
													<option>Camion</option>
													<option>Moto</option>
												</select>
											</div>
										</div>
										<div class="form-group row">
											<label for="exampleInputUsername2"
												class="col-sm-3 col-form-label">Section</label>
											<div class="col-sm-9">
												<select class="form-control" id="sectionn" name="sectionn"
													value="" required="">
													<%
													for (Section section : ss.findAll()) {
													%>
													<option><%=section.getId()%></option>
													<%
													}
													%>
												</select>
											</div>
										</div>
										<input id="modifier" type="button" value="Valider"
											class="btn btn-primary mr-2" onclick="hidePopUpp();" /> <input
											id="hidePop" onclick="hidePopUpp();" value="Cancel"
											class="btn btn-light" style="width: 100px;" />
									</form>
								</div>
							</div>
						</div>
					</div>

					<!-- end Formulaire de modification de place -->

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
	<script>
		function showPop() {
			document.getElementById("popUp").style.display = "block";
			document.getElementById("popUpp").style.display = "none";
		}
		function hidePopUp() {
			document.getElementById("popUp").style.display = "none";
		}

		function showPopp() {
			document.getElementById("popUpp").style.display = "block";
			document.getElementById("popUp").style.display = "none";
		}
		function hidePopUpp() {
			document.getElementById("popUpp").style.display = "none";
		}
		
		function vider() {
			document.getElementById("occupper").style.display = "block";
			document.getElementById("vider").style.display = "none";
		}
		function occupper() {
			document.getElementById("occupper").style.display = "none";
			document.getElementById("vider").style.display = "block";
			
		}
	</script>
	<script type="text/javascript">
		$(document)
				.ready(
						function f() {
							$
									.ajax({
										url : "PlaceServlet",
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
							

							$("#content").on(
									"click",
									".delete",
									function() {
										var id = $(this).closest("tr").find(
												"td").eq(0).text();
										$.ajax({
											url : "PlaceServlet",
											data : {
												op : "delete",
												id : id
											},
											type : 'POST',
											success : function(data,
													textStatus, jqXHR) {
												remplir(data);
											},
											error : function(jqXHR, textStatus,
													errorThrown) {
												console.log(textStatus);
											}
										});

									});
							$("#content").on(
									"click",
									".etat",
									function() {
										var id = $(this).closest("tr").find(
												"td").eq(0).text();
										
										$.ajax({
											url : "PlaceServlet",
											data : {
												op : "etat",
												id : id
											},
											type : 'POST',
											success : function(data,
													textStatus, jqXHR) {
												remplir(data);
											},
											error : function(jqXHR, textStatus,
													errorThrown) {
												console.log(textStatus);
											}
										});

									});

							$("#content").on(
									"click",
									".update",
									function() {

										var id = $(this).closest("tr").find(
												"td").eq(0).text();
										var numero = $(this).closest("tr")
												.find("td").eq(1).text();
										var etat = $(this).closest("tr").find(
												"td").eq(2).text();
										var type = $(this).closest("tr").find(
												"td").eq(3).text();
										var section = $(this).closest("tr")
												.find("td").eq(4).text();
										$("#id").val(id);
										$("#numeroo").val(numero);
										$("#etatt").val(etat);
										$("#typee").val(type);
										$("#sectionn").val(section);
										$.ajax({
											url : "PlaceServlet",
											data : {
												op : "update",
												id : id,
												numero : numero,
												etat : etat,
												type : type,
												section : section
											},
											type : 'POST',
											success : function(data,
													textStatus, jqXHR) {
												remplir(data);
											},
											error : function(jqXHR, textStatus,
													errorThrown) {
												console.log(textStatus);
											}
										});

									});
							$("#modifier").on(
									"click",
									function() {
										var id = $("#id").val();
										var numero = $("#numeroo").val();
										var etat = $("#etatt").val();
										var type = $("#typee").val();
										var section = $("#sectionn").val();
										$.ajax({
											url : "PlaceServlet",
											data : {
												op : "update",
												id : id,
												numero : numero,
												etat : etat,
												type : type,
												section : section
											},
											type : 'POST',
											success : function(data,
													textStatus, jqXHR) {
												remplir(data);
											},
											error : function(jqXHR, textStatus,
													errorThrown) {
												console.log(textStatus);
											}
										});
									});

							

						});
		$("#add").click(function() {
					var numero = $("#numero").val();
					var etat = $("#etat").val();
					var type = $("#type").val();
					var section = $("#section").val();
					$.ajax({
						url : "PlaceServlet",
						data : {
							op : "add",
							numero : numero,
							etat : etat,
							type : type,
							section : section,
						},
						type : 'POST',
						success : function(data) {
							remplir(data);
							//alert(data.id);
							//console.log(data);
							//f();
						},
						error : function(jqXHR, textStatus,
								errorThrown) {
							console.log(textStatus);
						}
					});
				});
		$("#search").click(function() {
			var numero = $("#numPlace").val();
			$.ajax({
				url : "PlaceServlet",
				data : {
					op : "search",
					numero : numero
				},
				type : 'POST',
				success : function(data) {
					remplir(data);
					//alert(data.id);
					//console.log(data);
					//f();
				},
				error : function(jqXHR, textStatus,
						errorThrown) {
					console.log(textStatus);
				}
			});
		});
		function remplir(data) {
			var ligne = "";
			data.forEach(function(e) {
						ligne += "<tr><td>"
								+ e.id
								+ "</td><td>"
								+ e.numero
								+ "</td><td>"
								+ e.etat
								+ "</td><td>"
								+ e.type
								+ "</td><td>"
								+ e.section
								+ "</td><td><button class='btn btn-primary etat'>changer etat</button></td><td><button class='btn btn-danger delete'>Supprimer</button></td><td><button class='btn btn-dark btn-icon-text update' onclick='showPopp();'>Modifier<i class='ti-file btn-icon-append'></i></button></td></tr>";
					});
			$("#content").html(ligne);
		}
	</script>
	<!-- End custom js for this page-->
</body>

</html>



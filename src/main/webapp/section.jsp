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
										placeholder="Code section" aria-label="Code section" name="codeSection" id="codeSection">
									<div class="input-group-append">
										<input id="search" type="button" value="Search"
										class="btn btn-sm btn-primary"/>
									</div>
								</div>
							</div>

							<input style="float: right;" type="button"
								class="btn btn-primary mr-2" onclick="showPop();"
								value="Ajouter Section" />
							<div class="table-responsive">
								<br>

								<table class="table table-striped">
									<thead>
										<tr>
											<th>Identifiant</th>
											<th>Code</th>
											<th>places occupees en pourcentage</th>
											<th>nombre total des places</th>
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

					<!-- Formulaire d'ajout de section -->

					<div class="active" id="popUp"
						style="display: none; position: fixed; top: 50%; left: 50%; transform: translate(-50%, -50%) scale(1); transition: 200ms ease-in-out; border: 1px solid black; border-radius: 10px; z-index: 10; background-color: white; width: 500px; max-width: 80%;">

						<div class="modal-body">
							<div class="card">
								<div class="card-body">
									<h4 class="card-title">Formulaire d'ajout d'une section</h4>

									<div class="form-group row">
										<label for="exampleInputUsername2"
											class="col-sm-3 col-form-label">Code</label>
										<div class="col-sm-9">
											<input type="text" class="form-control" id="code" name="code"
												value="" required="" placeholder="Code">
										</div>
									</div>
									<input id="add" type="button" value="Valider"
										class="btn btn-primary mr-2" onclick="hidePopUp();" /> <input
										id="hidePop" onclick="hidePopUp();" value="Cancel"
										class="btn btn-light" style="width: 100px;" />

								</div>
							</div>
						</div>
					</div>

					<!-- end Formulaire d'ajout de section -->

					<!-- Formulaire de modification de section -->

					<div class="active" id="popUpp"
						style="display: none; position: fixed; top: 50%; left: 50%; transform: translate(-50%, -50%) scale(1); transition: 200ms ease-in-out; border: 1px solid black; border-radius: 10px; z-index: 10; background-color: white; width: 500px; max-width: 80%;">

						<div class="modal-body">
							<div class="card">
								<div class="card-body">
									<h4 class="card-title">Formulaire de modification d'une
										section</h4>
										<div class="form-group row">
											<label for="exampleInputUsername2"
												class="col-sm-3 col-form-label">Identifiant</label>
											<div class="col-sm-9">
												<input type="text" class="form-control" id="id" name="id"
													value="" required="" placeholder="Identifiant">
											</div>
										</div>
										<div class="form-group row">
											<label for="Code" class="col-sm-3 col-form-label">Code</label>
											<div class="col-sm-9">
												<input type="text" class="form-control" id="codee"
													name="codee" value="" required="" placeholder="Code">
											</div>
										</div>

										<input id="modifier" type="button" value="Valider"
											class="btn btn-primary mr-2" onclick="hidePopUpp();" /> <input
											id="hidePop" onclick="hidePopUpp();" value="Cancel"
											class="btn btn-light" style="width: 100px;" />
									
								</div>
							</div>
						</div>
					</div>

					<!-- end Formulaire de modification de section -->

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
	</script>
	<script>
	function load ()
	{
		$.ajax({
			url : "SectionServlet",
			data : {
				op : "load",
			},
			type : 'POST',
			success : function(data, textStatus, jqXHR) {
				//alert("salam");
				remplir(data);
			},
			error : function(jqXHR, textStatus, errorThrown) {
				console.log(textStatus);
			}
		});
	}
		$(document).ready(function f() {
			//load();
			$.ajax({
				url : "SectionServlet",
				data : {
					op : "load",
				},
				type : 'POST',
				success : function(data, textStatus, jqXHR) {
					//alert("salam");
					remplir(data);
				},
				error : function(jqXHR, textStatus, errorThrown) {
					console.log(textStatus);
				}
			});

			$("#content").on("click", "#delete", function() {
				var id = $(this).closest("tr").find("td").eq(0).text();
				$.ajax({
					url : "SectionServlet",
					data : {
						op : "delete",
						id : id
					},
					type : 'POST',
					success : function(data, textStatus, jqXHR) {
					//	remplir(data);
					load();
					},
					error : function(jqXHR, textStatus, errorThrown) {
						console.log(textStatus);
					}
				});

			});
			$("#content").on("click", ".update", function() {
				var id = $(this).closest("tr").find("td").eq(0).text();
				var code = $(this).closest("tr").find("td").eq(1).text();
				$("#id").val(id);
				$("#codee").val(code);
				
			});
			$("#modifier").on("click", function() {
				var id = $("#id").val();
				var code = $("#codee").val();
				$.ajax({
					url : "SectionServlet",
					data : {
						op : "update",
						id : id,
						code : code
					},
					type : 'POST',
					success : function(data, textStatus, jqXHR) {
						//remplir(data);
						load();
					},
					error : function(jqXHR, textStatus, errorThrown) {
						console.log(textStatus);
					}
				});
			});

		});
		$("#add").click(function() {
			var code = $("#code").val();
			$.ajax({
				url : "SectionServlet",
				data : {
					op : "add",
					code : code
				},
				type : 'POST',
				success : function(data, textStatus, jqXHR) {
					//remplir(data);
					load();
				},
				
				error : function(jqXHR, textStatus, errorThrown) {
					console.log(textStatus);
				}
			});
		});
		$("#search").click(function() {
			alert("salam");
			var code = $("#codeSection").val();
			$.ajax({
				url : "SectionServlet",
				data : {
					op : "search",
					code : code
				},
				type : 'POST',
				success : function(data, textStatus, jqXHR) {
					//remplir(data);
					load();
				},
				
				error : function(jqXHR, textStatus, errorThrown) {
					console.log(textStatus);
				}
			});
		});
		function remplir(data) {
			var ligne = "";
			data.forEach(function(e) {
				//alert(e.id+"|"+e.etat+"|"+e.section+"|"+e.numero);
						ligne += "<tr><td>"
								+ e.id
								+ "</td><td>"
								+ e.etat
								+ "</td><td><div class='progress'><div class='progress-bar bg-success' role='progressbar' style='width:"
								+ (e.section / e.numero) * 100
								+ "%' aria-valuenow='25' aria-valuemin='0' aria-valuemax='100'></div></div>"
								+ "</td><td>"
								+ e.type
								+ "</td><td><button id='delete' class='btn btn-danger delete'>Supprimer</button></td><td><button class='btn btn-dark btn-icon-text update' onclick='showPopp();'>Modifier<i class='ti-file btn-icon-append'></i></button></td></tr>";
					});
			$("#content").html(ligne);
		}
	</script>
	<!-- End custom js for this page-->
</body>

</html>



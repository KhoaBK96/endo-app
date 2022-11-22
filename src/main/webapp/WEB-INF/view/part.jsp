<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" isELIgnored="false"%>

<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="utf-8" />
<meta name="viewport" content="width=device-width, initial-scale=1" />
<title>ENDO | Home</title>

<!-- link -->
<c:import url="include/link.jsp" />

</head>


<body class="hold-transition sidebar-mini">
	<div class="wrapper">
		<!-- /.navbar -->
		<c:import url="include/nav-bar.jsp" />
		<!-- Main Sidebar Container -->
		<c:import url="include/side-bar.jsp" />

		<!-- Content Wrapper. Contains page content -->
		<div class="content-wrapper">
			<section class="content">
				<div class="container-fluid">

					<div class="card">
						<div class="card-header">
							<h1 class="card-title">Part List</h1>
						</div>
						<div class="card-header">
							<h3 class="card-title">
								<a class="btn btn-block btn-primary btn-sm"
									href="${pageContext.servletContext.contextPath}/api/part/add">Add</a>
							</h3>
						</div>
						<!-- /.card-header -->
						<div class="card-body">
							<table id="data-table" class="table table-bordered">
								<thead>
									<tr>
										<th>Code</th>
										<th>Name</th>
										<th></th>
									</tr>
								</thead>
								<tbody>
									<c:forEach var="part" items="${partList}">
										<tr>
											<td>${part.code}</td>
											<td>${part.name}</td>
											<td><a class="btn btn-warning btn-sm btn-edit"
												title="edit"
												href="${pageContext.servletContext.contextPath}/api/part/edit?id=${part.id}">
													<i class="fas fa-pencil-alt"></i>
											</a> <a class="btn btn-danger btn-sm btn-edit delete-btn"
												title="delete"
												href="${pageContext.servletContext.contextPath}/api/part/delete?id=${part.id}"
												s> <i class="fas fa-trash"></i>
											</a></td>

										</tr>
									</c:forEach>
								</tbody>
							</table>
						</div>
						<!-- /.card-body -->
						<div class="card-footer clearfix"></div>
					</div>
					<!-- /.card -->

					<!-- /.row -->
				</div>
				<!-- /.container-fluid -->
			</section>
		</div>
	</div>

	<c:import url="include/footer.jsp" />
</body>
</html>
<script>
	$(function() {
		$('#data-table').DataTable({
			"paging" : true,
			"lengthChange" : false,
			"searching" : false,
			"ordering" : true,
			"info" : true,
			"autoWidth" : false,
			"responsive" : true,
		});
	});
</script>
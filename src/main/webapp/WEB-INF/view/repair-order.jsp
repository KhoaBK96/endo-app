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
							<h1 class="card-title">Repair List</h1>
						</div>
						<div class="card-header">
							<h3 class="card-title">
								<a class="btn btn-block btn-primary btn-sm"
									href="${pageContext.servletContext.contextPath}/api/repairOrder/add">Add</a>
							</h3>
						</div>
						<!-- /.card-header -->
						<div class="card-body">
							<table class="table table-bordered">
								<thead>
									<tr>
										<th>Repair Order</th>
										<th>Model</th>
										<th>Hospital</th>
										<th>Status</th>
										<th>Rank</th>
										<th></th>
										<th></th>
									</tr>
								</thead>
								<tbody>
									<c:forEach var="repairOrder" items="${repairOrderList}">
										<tr>
											<td>${repairOrder.code}</td>
											<td>${repairOrder.model.name}</td>
											<td>${repairOrder.hospital}</td>
											<td>${repairOrder.status}</td>
											<td>${repairOrder.repairRank.name}</td>
											<td><a class="btn btn-block btn-info btn-sm"
												href="${pageContext.servletContext.contextPath}/api/repairOrder/repairDetail?id=${repairOrder.id}">Repair
													Detail</a></td>
											<td><a class="btn btn-warning btn-sm btn-edit"
												title="edit"
												href="${pageContext.servletContext.contextPath}/api/repairOrder/edit?id=${repairOrder.id}">
													<i class="fas fa-pencil-alt"></i>
											</a> <a class="btn btn-danger btn-sm btn-edit delete-btn"
												title="delete"
												href="${pageContext.servletContext.contextPath}/api/repairOrder/delete?id=${repairOrder.id}">
													<i class="fas fa-trash"></i>
											</a></td>

										</tr>
									</c:forEach>
								</tbody>
							</table>
						</div>
						<!-- /.card-body -->
						<div class="card-footer clearfix">
							<ul class="pagination pagination-sm m-0 float-right">
								<li class="page-item"><a class="page-link" href="#">&laquo;</a></li>
								<li class="page-item"><a class="page-link" href="#">1</a></li>
								<li class="page-item"><a class="page-link" href="#">2</a></li>
								<li class="page-item"><a class="page-link" href="#">3</a></li>
								<li class="page-item"><a class="page-link" href="#">&raquo;</a></li>
							</ul>
						</div>
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
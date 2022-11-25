<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>

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
							<h3 class="card-title">Repair Package for model:
								${repairRankForModelList[0].model.name} , rank :
								${repairRankForModelList[0].repairRank.name}</h3>
						</div>
						<div class="card-header">
							<h3 class="card-title">
								<a class="btn btn-block btn-primary btn-sm"
									href="${pageContext.servletContext.contextPath}/repairRankForModel/editPart?modelId=${modelId}&rankId=${rankId}">Edit
								</a>
							</h3>

						</div>

						<!-- /.card-header -->
						<div class="card-body">
							<table class="table table-bordered">
								<thead>

									<tr>
										<th>Part Code</th>
										<th>Part Name</th>
										<th>Quantity</th>

									</tr>
								</thead>
								<tbody>
									<c:forEach var="repairRankForModel"
										items="${repairRankForModelList}">
										<tr>
											<td>${repairRankForModel.part.code}</td>
											<td>${repairRankForModel.part.name}</td>
											<td>${repairRankForModel.quantity}</td>

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
				<c:choose>
					<c:when test='${repairOrder.status == "WAITING_FOR_QUOTE"}'>
						<a class="btn  btn-success btn-sm"
							href="${pageContext.servletContext.contextPath}/repairDetail/quotationComplete?repairOrderId=${repairOrder.id}">Quotation
							Complete</a>
					</c:when>
				</c:choose>

				<c:choose>
					<c:when test='${repairOrder.status == "WAITING_FOR_REPAIR"}'>
						<a class="btn  btn-success btn-sm"
							href="${pageContext.servletContext.contextPath}/repairDetail/repairComplete?repairOrderId=${repairOrder.id}">Repair
							Complete</a>
					</c:when>
				</c:choose>
				<!-- /.container-fluid -->
			</section>
		</div>
	</div>
</body>
</html>

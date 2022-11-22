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
					<div class="row">
						<div class="col-md-6">

							<!-- /.card-header -->
							<div class="card card-primary">
								<div class="card-header">
									<h3 class="card-title">Repair Package</h3>
								</div>
								<!-- /.card-header -->
								<!-- form start -->
								<form:form action="showPartList"
									modelAttribute="repairRankForModel">
									<div class="card-body">
										<form:hidden class="form-control" path="id" />
										<div class="form-group">
											<label>Rank</label>
											<form:select class="form-control" path="model">
												<c:forEach var="model" items="${modelList}">
													<option value="${model.id}">${model.name}</option>
												</c:forEach>
											</form:select>
										</div>
										<div class="form-group">
											<label>Rank</label>
											<form:select class="form-control" path="repairRank">
												<c:forEach var="repairRank" items="${repairRankList}">
													<option value="${repairRank.id}">${repairRank.name}</option>
												</c:forEach>
											</form:select>
										</div>

									</div>
									<!-- /.card-body -->

									<div class="card-footer">
										<button type="submit" class="btn btn-primary">Submit</button>
									</div>
								</form:form>
							</div>
							<!-- /.card-body -->

						</div>
						<!-- /.card -->
					</div>
				</div>
				<!-- /.row -->

				<!-- /.container-fluid -->
			</section>
		</div>
	</div>
</body>
<c:import url="include/footer.jsp" />
</html>

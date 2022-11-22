<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" isELIgnored="false"%>
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

					<!--<div class="card">-->
					<!-- /.card-header -->
					<div class="row">
						<div class="col-md-6">
							<div class="card card-primary">
								<div class="card-header">
									<h3 class="card-title">Model</h3>
								</div>
								<!-- /.card-header -->
								<!-- form start -->
								<form:form action="save" modelAttribute="part">
									<div class="card-body">
										<form:hidden path="id" />
										<div class="form-group">
											<label for="code">Code </label>
											<form:input class="form-control" path="code" />
										</div>
										<div class="form-group">
											<label for="name">Name </label>
											<form:input class="form-control" path="name" />
										</div>

									</div>
									<!-- /.card-body -->

									<div class="card-footer">
										<button type="submit" class="btn btn-primary">Submit</button>
									</div>
								</form:form>
							</div>
						</div>
					</div>
				</div>
			</section>
		</div>
	</div>
	<c:import url="include/footer.jsp" />
</body>
</html>

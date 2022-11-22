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
									<h3 class="card-title">Role</h3>
								</div>
								<!-- /.card-header -->
								<!-- form start -->
								<form:form action="save" modelAttribute="staff">
									<div class="card-body">
										<form:hidden path="id" />
										<div class="form-group">
											<label for="username">User Name </label>
											<form:input class="form-control" path="username" />
										</div>
										<div class="form-group">
											<label for="password">Password </label>
											<form:input class="form-control" path="password" />
										</div>
										<div class="form-group">
											<label for="fullname">Full Name </label>
											<form:input class="form-control" path="fullname" />
										</div>
										<div class="form-group">
											<label for="phoneNumber">Phone Number </label>
											<form:input class="form-control" path="phoneNumber" />
										</div>
										<div class="form-group">
											<div class="form-group">
												<label>Code</label>
												<form:select class="form-control" path="role">
													<c:forEach var="role" items="${roles}">
														<c:choose>
															<c:when test="${role.id == staff.role.id}">
																<option value="${role.id}" selected="selected">${role.name}</option>
															</c:when>
															<c:otherwise>
																<option value="${role.id}">${role.name}</option>
															</c:otherwise>
														</c:choose>
													</c:forEach>
												</form:select>
											</div>

										</div>
										<!-- /.card-body -->

										<div class="card-footer">
											<button type="submit" class="btn btn-primary">Submit</button>
										</div>
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

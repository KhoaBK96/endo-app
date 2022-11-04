<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Endo | Staff</title>
</head>
<body>
	<h1>STAFF MANAGEMENT</h1>
	<table>
		<tr>
			<th>User name</th>
			<th>Full Name</th>
			<th>Phone Number</th>
			<th>Role</th>
			<th></th>
		</tr>
		<c:forEach var="staff" items="${staffList}">
			<tr>
				<td>${staff.username}</td>
				<td>${staff.fullname}</td>
				<td>${staff.phoneNumber}</td>
				<td>${staff.role.name}</td>
				<td><button>
						<a
							href="${pageContext.servletContext.contextPath}/api/staff/edit?id=${staff.id}">Edit
						</a>
					</button></td>
				<td><button>
						<a
							href="${pageContext.servletContext.contextPath}/api/staff/delete?id=${staff.id}">Delete
						</a>
					</button></td>
			</tr>
		</c:forEach>
	</table>
	<br>
	<button>
		<a href="${pageContext.servletContext.contextPath}/api/staff/add">Add</a>
	</button>

</body>
</html>
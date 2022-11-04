<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Endo | Role</title>
</head>
<body>
	<h1>ROLE MANAGEMENT</h1>
	<table>
		<tr>
			<th>Code</th>
			<th>Role_name</th>
			<th></th>
		</tr>
		<c:forEach var="role" items="${roleList}">
			<tr>
				<td>${role.code}</td>
				<td>${role.name}</td>
				<td><button>
						<a
							href="${pageContext.servletContext.contextPath}/api/role/edit?id=${role.id}">Edit
						</a>
					</button></td>
				<td><button>
						<a
							href="${pageContext.servletContext.contextPath}/api/role/delete?id=${role.id}">Delete
						</a>
					</button></td>
			</tr>
		</c:forEach>
	</table>
	<br>
	<button>
		<a href="${pageContext.servletContext.contextPath}/api/role/add">Add
			Role</a>
	</button>

</body>
</html>
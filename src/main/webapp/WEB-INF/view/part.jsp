<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Endo | Part</title>
</head>
<body>
	<h1>PART MANAGEMENT</h1>
	<table>
		<tr>
			<th>Code</th>
			<th>Name</th>
			<th>Price</th>
			<th></th>
		</tr>
		<c:forEach var="part" items="${partList}">
			<tr>
				<td>${part.code}</td>
				<td>${part.name}</td>
				<td>${part.price}$</td>
				<td><button>
						<a
							href="${pageContext.servletContext.contextPath}/api/part/edit?id=${part.id}">Edit
						</a>
					</button></td>
				<td><button>
						<a
							href="${pageContext.servletContext.contextPath}/api/part/delete?id=${part.id}">Delete
						</a>
					</button></td>
			</tr>
		</c:forEach>
	</table>
	<br>
	<button>
		<a href="${pageContext.servletContext.contextPath}/api/part/add">Add</a>
	</button>

</body>
</html>
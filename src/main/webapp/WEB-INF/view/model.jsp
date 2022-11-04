<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Endo | Model</title>
</head>
<body>
	<h1>MODEL MANAGEMENT</h1>
	<table>
		<tr>
			<th>Name</th>
			<th></th>
		</tr>
		<c:forEach var="model" items="${modelList}">
			<tr>
				<td>${model.name}</td>
				<td><button>
						<a
							href="${pageContext.servletContext.contextPath}/api/model/edit?id=${model.id}">Edit
						</a>
					</button></td>
				<td><button>
						<a
							href="${pageContext.servletContext.contextPath}/api/model/delete?id=${model.id}">Delete
						</a>
					</button></td>
			</tr>
		</c:forEach>
	</table>
	<br>
	<button>
		<a href="${pageContext.servletContext.contextPath}/api/model/add">Add
		</a>
	</button>

</body>
</html>
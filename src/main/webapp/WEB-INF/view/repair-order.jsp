<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Endo | REPAIR ORDER</title>
</head>
<body>
	<h1>REPAIR ORDER MANAGEMENT</h1>
	<table>
		<tr>
			<th>Code</th>
			<th>Model</th>
			<th>Status</th>
			<th>Hospital</th>
			<th>Rank</th>
			<th></th>
		</tr>
		<c:forEach var="repairOrder" items="${repairOrderList}">
			<tr>
				<td>${repairOrder.code}</td>
				<td>${repairOrder.model.name}</td>
				<td>${repairOrder.status}</td>
				<td>${repairOrder.hospital}</td>
				<td>${repairOrder.repairRank.name}</td>
				<td><button>
						<a
							href="${pageContext.servletContext.contextPath}/api/repairOrder/edit?id=${repairOrder.id}">Edit
						</a>
					</button></td>
				<td><button>
						<a
							href="${pageContext.servletContext.contextPath}/api/repairOrder/delete?id=${repairOrder.id}">Delete
						</a>
					</button></td>
					
				<td><a href="${pageContext.servletContext.contextPath}/api/repairOrder/repairDetail?id=${repairOrder.id}">Repair Detail</a></td>
			</tr>
		</c:forEach>
	</table>
	<br>
	<button>
		<a
			href="${pageContext.servletContext.contextPath}/api/repairOrder/add">Add</a>
	</button>

</body>
</html>
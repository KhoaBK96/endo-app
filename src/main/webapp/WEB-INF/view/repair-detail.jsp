<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Endo | REPAIR DETAIL</title>
</head>
<body>
	<h1>REPAIR DETAIL MANAGEMENT</h1>
	<table>
		<tr>
			<th>Repair Order No</th>
			<th>Part Code</th>
			<th>Phone Number</th>
			<th>Quantity</th>
			<th>Price</th>
			<th></th>
		</tr>
		<c:forEach var="repairDetail" items="${repairDetailList}">
			<tr>
				<td>${repairDetail.repairOrder.code}</td>
				<td>${repairDetail.part.code}</td>
				<td>${repairDetail.phoneNumber}</td>
				<td>${repairDetail.quantity}</td>
				<td>${repairDetail.price}</td>
				<td><button>
						<a
							href="${pageContext.servletContext.contextPath}/api/repairDetail/edit?id=${repairDetail.id}">Edit
						</a>
					</button></td>
				<td><button>
						<a
							href="${pageContext.servletContext.contextPath}/api/repairDetail/delete?id=${repairDetail.id}">Delete
						</a>
					</button></td>
			</tr>
		</c:forEach>
	</table>
	<br>
	<button>
		<a href="${pageContext.servletContext.contextPath}/api/repairDetail/add">Add</a>
	</button>

</body>
</html>
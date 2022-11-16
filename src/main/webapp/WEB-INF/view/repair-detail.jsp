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
	<h2>${repairDetailList[0].repairOrder.code}</h2>
		<tr>
			<th>Part</th>
			<th>Quantity</th>

		</tr>
		<c:forEach var="repairDetail" items="${repairDetailList}">
			<tr>
				<td>${repairDetail.part.code}</td>
				<td>${repairDetail.quantity}</td>
				
		</c:forEach>
	</table>
	<br>
	<button>
		<a href="${pageContext.servletContext.contextPath}/api/repairDetail/add?repairOrderId=${repairOrder.id}">Add Repair Package</a>
	</button>
	
	<c:choose>
		<c:when test='${repairOrder.status == "WAITING_FOR_QUOTE"}'>
			<button>
				<a href="${pageContext.servletContext.contextPath}/api/repairDetail/quotationComplete?repairOrderId=${repairOrder.id}">Quotation Complete</a>
			</button>
		</c:when>
	</c:choose>
	
	<c:choose>
		<c:when test='${repairOrder.status == "WAITING_FOR_REPAIR"}'>
			<button>
				<a href="${pageContext.servletContext.contextPath}/api/repairDetail/repairComplete?repairOrderId=${repairOrder.id}">Repair Complete</a>
			</button>
		</c:when>
	</c:choose>
		
	

</body>
</html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Endo | Repair Detail</title>
</head>
<body>
	<h1>Repair Detail Management</h1>
	<br>
	<form:form action="save" modelAttribute="repairDetail">
		<div>
			<form:hidden path="id" />
			<div>
				<label for="repairOrder">Repair Order</label>
				<form:select path="repairOrder">
					<c:forEach var="repairOrder" items="${repairOrderList}">
						<c:choose>
							<c:when test="${repairOrder.id == repairDetail.repairOrder.id}">
								<option value="${repairOrder.id}" selected="selected">${repairOrder.code}</option>
							</c:when>
							<c:otherwise>
								<option value="${repairOrder.id}">${repairOrder.code}</option>
							</c:otherwise>
						</c:choose>
					</c:forEach>
				</form:select>
			</div>
			<br>
			<div>
				<label for="part">Part</label>
				<form:select path="part">
					<c:forEach var="part" items="${partList}">
						<c:choose>
							<c:when test="${part.id == repairDetail.part.id}">
								<option value="${part.id}" selected="selected">${part.code}</option>
							</c:when>
							<c:otherwise>
								<option value="${part.id}">${part.code}</option>
							</c:otherwise>
						</c:choose>
					</c:forEach>
				</form:select>
			</div>
			<br>
			<div>
				<label for="quantity">Quantity</label>
				<form:input path="quantity" />
			</div>
			<br>
			<div>
				<label for="price">Price</label>
				<form:input path="price" />
			</div>
			<br>
		</div>
		<br>
		<div>
			<input type="submit" value="submit">
		</div>
	</form:form>
</body>
</html>
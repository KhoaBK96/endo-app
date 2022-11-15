<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Endo | Repair Order</title>
</head>
<body>
	<h1>Repair Order Management</h1>
	<br>
	<form:form action="save" modelAttribute="repairOrder">
		<div>
			<form:hidden path="id" />
			<div>
				<label for="code">Code</label>
				<form:input path="code" />
			</div>
			<br>
			<div>
				<label for="model">Model</label>
				<form:select path="model">
					<c:forEach var="model" items="${modelList}">
						<c:choose>
							<c:when test="${model.id == repairOrder.model.id}">
								<option value="${model.id}" selected="selected">${model.name}</option>
							</c:when>
							<c:otherwise>
								<option value="${model.id}">${model.name}</option>
							</c:otherwise>
						</c:choose>
					</c:forEach>
				</form:select>
			</div>
			<br>
			<div>
				<label for="status">Status</label>
				<form:select path="status">
					<c:forEach var="status" items='${statusList}'>
						<option value="${status}">${status}</option>
					</c:forEach>
				</form:select>
			</div>
			<br>
			<div>
				<label for="hospital">Hospital</label>
				<form:input path="hospital" />
			</div>
			<br>
			
			<br>
		</div>
		<br>
		<div>
			<input type="submit" value="submit">
		</div>
	</form:form>
</body>
</html>
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
	<h3>Repair Order : ${repairOrder.id}</h3>
	<h3>Model: ${model.name}</h3>
	<br>
	<form:form action="editRepairDetail" modelAttribute="repairOrder">
		<form:input  type="hidden" path="id" value="${repairOrderId}"/>
		<form:input  type="hidden" path="model" value="${model.id}"/>
	<div>
		<label for="repairRank">Repair Rank</label>
		<form:select path="repairRank">
			<c:forEach var="repairRank" items="${repairRankList}">
				<option value="${repairRank.id}">${repairRank.name}</option>
			</c:forEach>
		</form:select>
	</div>
	<br>
	<input type="submit" value="submit">
	</form:form>
	<br>
	<div>
			
    </div>
	
</body>
</html>
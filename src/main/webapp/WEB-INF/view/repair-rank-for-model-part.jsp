<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Endo | Repair Rank For Model</title>
</head>
<body>
	<h1>REPAIR RANK FOR MODEL FORM</h1>
	<br>
	<table>
		<tr>
			<th>Part</th>
			<th>Quantity</th>
		</tr>
		<c:forEach var="repairRankForModel" items="${repairRankForModelList}">
			<tr>
				<td>${repairRankForModel.part.id}</td>
				<td>${repairRankForModel.quantity}</td>
			</tr>
		</c:forEach>
	</table>
	<a href="${pageContext.servletContext.contextPath}/api/repairRankForModel/editPart?modelId=${modelId}&rankId=${rankId}">Edit</a>
</body>
</html>
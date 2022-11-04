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
	<h1>PART FOR MODEL ${modelRepair.name} AND RANK ${rank.name}</h1>
	<table>
		<tr>
			<th>Code</th>
			<th>Name</th>
			<th>Quantity</th>
			<th>Price</th>
		</tr>
		<c:forEach var="part" items="${partList}">
			<div class="">
				<tr>
					<td>${part.code}</td>
					<td>${part.name}</td>
					<td></td>
					<td>${part.price}</td>
				</tr>
			</div>
		</c:forEach>
	</table>
	<br>

</body>
</html>
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
	<form:form action="showPartList" modelAttribute="repairRankForModel">
		<div>
			<form:hidden path="id" />
			<div>
				<label for="model">Model</label>
				<form:select path="model">
					<c:forEach var="model" items="${modelList}">
								<option value="${model.id}">${model.name}</option>
					</c:forEach>
				</form:select>
			</div>
			<br>
			<div>
				<label for="repairRank">Repair Rank</label>
				<form:select path="repairRank">
					<c:forEach var="repairRank" items="${repairRankList}">
								<option value="${repairRank.id}">${repairRank.name}</option>
					</c:forEach>
				</form:select>
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
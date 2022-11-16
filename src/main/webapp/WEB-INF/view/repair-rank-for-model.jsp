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
	<h1>REPAIR RANK FOR MODEL MANAGEMENT</h1>
	<table>
		<tr>
			<th>Model</th>
			<th>Repair Rank</th>
			<th></th>
		</tr>
		<c:forEach var="repairRankForModel" items="${repairRankForModels}">
			<tr>
				<td>${repairRankForModel.model.name}</td>
				<td>${repairRankForModel.repairRank.name}</td>
				<td><button>
						<a
							href="${pageContext.servletContext.contextPath}/api/repairRankForModel/edit?id=${repairRankForModel.id}">Edit
						</a>
					</button></td>
				<td><button>
						<a
							href="${pageContext.servletContext.contextPath}/api/repairRankForModel/delete?id=${repairRankForModel.id}">Delete
						</a>
					</button></td>
			</tr>
		</c:forEach>
	</table>
	<br>
	<button>
		<a href="${pageContext.servletContext.contextPath}/api/repairRankForModel/add">Add</a>
	</button>

</body>
</html>
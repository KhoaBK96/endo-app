<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Endo | Repair Rank</title>
</head>
<body>
	<h1>REPAIR RANK MANAGEMENT</h1>
	<table>
		<tr>
			<th>Name</th>
			<th></th>
		</tr>
		<c:forEach var="repairRank" items="${repairRankList}">
			<tr>
				<td>${repairRank.name}</td>
				<td><button>
						<a
							href="${pageContext.servletContext.contextPath}/api/repairRank/edit?id=${repairRank.id}">Edit
						</a>
					</button></td>
				<td><button>
						<a
							href="${pageContext.servletContext.contextPath}/api/repairRank/delete?id=${repairRank.id}">Delete
						</a>
					</button></td>
			</tr>
		</c:forEach>
	</table>
	<br>
	<button>
		<a href="${pageContext.servletContext.contextPath}/api/repairRank/add">Add
		</a>
	</button>

</body>
</html>
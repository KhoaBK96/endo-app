<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Endo | Staff</title>
</head>
<body>
	<h1>STAFF FORM</h1>
	<br>
	<form:form action="save" modelAttribute="staff">
		<div>
			<form:hidden path="id" />
			<div>
				<label for="username">User name</label>
				<form:input path="username" />
			</div>
			<br>
			<div>
				<label for="password">Password</label>
				<form:input path="password" />
			</div>
			<br>
			<div>
				<label for="fullname">Full name</label>
				<form:input path="fullname" />
			</div>
			<br>
			<div>
				<label for="phoneNumber">Phone number</label>
				<form:input path="phoneNumber" />
			</div>
			<br>
			<div>
				<label for="role">Role</label>
				<form:select path="role">
					<c:forEach var="role" items="${roles}">
						<c:choose>
							<c:when test="${role.id == staff.role.id}">
								<option value="${role.id}" selected="selected">${role.name}</option>
							</c:when>
							<c:otherwise>
								<option value="${role.id}">${role.name}</option>
							</c:otherwise>
						</c:choose>
					</c:forEach>
				</form:select>
			</div>
		</div>
		<br>
		<div>
			<input type="submit" value="submit">
		</div>
	</form:form>
</body>
</html>
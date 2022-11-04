<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Endo | Role</title>
</head>
<body>
	<h1>ROLE FORM</h1>
	<br>
	<form:form action="save" modelAttribute="role">
		<div>
			<form:hidden path="id"/>
			<div>
				<label for="code">Role code</label>
				<form:input path="code"/>
			</div>
			<br>
			<div>
				<label for="name">Role name</label>
				<form:input path="name"/>
			</div>
		</div>
		<br>
		<div>
			<input type="submit" value="submit">
		</div>
	</form:form>
</body>
</html>
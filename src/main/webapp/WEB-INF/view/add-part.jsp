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
	<h1>PART FORM</h1>
	<br>
	<form:form action="save" modelAttribute="part">
		<div>
			<form:hidden path="id" />
			<div>
				<label for="code">Code</label>
				<form:input path="code" />
			</div>
			<br>
			<div>
				<label for="name">Name</label>
				<form:input path="name" />
			</div>
			<br>
			<div>
				<label for="price">Price</label>
				<form:input path="price" />
			</div>

		</div>
		<br>
		<div>
			<input type="submit" value="submit">
		</div>
	</form:form>
</body>
</html>
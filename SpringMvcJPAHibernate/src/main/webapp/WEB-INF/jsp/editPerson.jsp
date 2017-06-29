<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Edit Person</title>
</head>
<body>
	<h1>Edit Existing Record</h1>

	<c:url var="saveUrl" value="/home/edit.html?id=${Person.id}" />
	<form:form modelAttribute="Person" method="POST" commandName="Person"
		action="${saveUrl}">
		<table>
			<tr>
				<td><form:label path="id">Id:</form:label></td>
				<td><form:input path="id" disabled="true" /></td>
			</tr>

			<tr>
				<td><form:label path="firstName">First Name:</form:label></td>
				<td><form:input path="firstName" /> <font color="red"><form:errors
							path="firstName" /> </font></td>
			</tr>

			<tr>
				<td><form:label path="lastName">Last Name</form:label></td>
				<td><form:input path="lastName" /> <font color="red"><form:errors
							path="lastName" /> </font></td>
			</tr>

			<tr>
				<td><form:label path="money">Money</form:label></td>
				<td><form:input path="money" /> <font color="red"><form:errors
							path="money" /> </font></td>
			</tr>
		</table>

		<input type="submit" value="Save" />
	</form:form>

</body>
</html>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Add Person to Database</title>
<style>
.error {
	color: #ff0000;
}

.errorblock {
	color: #000;
	background-color: #ffEEEE;
	border: 3px solid #ff0000;
	padding: 8px;
	margin: 16px;
}
</style>
</head>
<body>
	<h3>Add Person to database</h3>
	<c:url var="saveUrl" value="/home/add.html" />

	<form:form modelAttribute="Person" method="POST" commandName="Person"
		action="${saveUrl}">
		<form:errors path="*" cssClass="errorblock" element="div" />
		<table>
			<tr>
				<td><form:label path="firstName">First Name:</form:label>
				</td>


				<td><form:input path="firstName" /> <font color="red"><form:errors
							path="firstName" /> </font>
				</td>
			</tr>

			<tr>
				<td><form:label path="lastName">Last Name</form:label>
				</td>

				<td><form:input path="lastName" /> <font color="red"><form:errors
							path="lastName" /> </font>
				</td>
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
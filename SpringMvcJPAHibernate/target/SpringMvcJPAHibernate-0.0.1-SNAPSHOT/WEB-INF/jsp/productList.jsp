<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Product List</title>
</head>
<body>
	<h3>Product List</h3>

<%-- 	<c:url var="editImgUrl" value="/images/arrow_refresh.png" /> --%>
<%-- 	<c:url var="deleteImgUrl" value="/images/delete.png" /> --%>
<%-- 	<c:url var="addImgUrl" value="/images/add.png" /> --%>

<%-- 	<c:url var="addUrl" value="add.html" /> --%>

	<table style="border: 1px solid; width: 60%; text-align: center">
		<thead style="background: #d3dce3">
			<tr>
				<th>Id</th>
				<th>Code</th>
				<th>Enter Date</th>
				<th>Name</th>
				<th>Price</th>
<!-- 				<th><strong>Actions</strong> </th> -->
				
			</tr>
		</thead>
		<tbody style="background: #ccc">
			<c:if test="${products != null}">
				<c:forEach items="${products}" var="product">
<%-- 					<c:url var="editUrl" value="/home/edit.html?id=${person.id}" /> --%>
<%-- 					<c:url var="deleteUrl" value="/home/delete.html?id=${person.id}" /> --%>
					<tr>
						<td><c:out value="${product.id}" />
						</td>
						<td><c:out value="${product.code}" />
						</td>
						<td><c:out value="${product.enterDate}" />
						</td>
						<td><c:out value="${product.name}" />
						</td>
						<td><c:out value="${product.price}" />
						</td>
<%-- 						<td><a href="${editUrl}"><img src="${editImgUrl}" --%>
<%-- 								title="Edit Person"> <a href="${deleteUrl}"><img --%>
<%-- 									src="${deleteImgUrl}" title="Delete Person"> </a> --%>
<!-- 						</td> -->
					</tr>
				</c:forEach>
			</c:if>
		</tbody>
	</table>
<%-- 	<a href="${addUrl}">Add Person </a> --%>
<%-- 	<img alt="Add Person" src="${addImgUrl}" title="Add Person"></img> --%>
<a href="index.html">Go Back</a>
</body>
</html>
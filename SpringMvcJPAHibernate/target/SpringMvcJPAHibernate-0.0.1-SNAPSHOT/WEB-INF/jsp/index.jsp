<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
	<c:url var="addUrl" value="/home/add" />
	<c:url var="personlistUrl" value="/home/listPerson" />
	<c:url var="productlistUrl" value="/home/productList" />
	<h1>Ejemplo de Spring MVC + maven + JPA + Hibernate</h1>
	<span>Victor Guerrero</span> <a href="https://github.com/vguerrero/SpringMVC-Jpa-Hibernate">Git Code</a>
	<br/><br/>
	
	<a href="${addUrl}">Add Person</a><br/>	
	<a href="${personlistUrl}">Person List</a><br/>
	<a href="${productlistUrl}"> Product List</a>
</body>
</html>
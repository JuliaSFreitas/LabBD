<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Exemplo Servlets e JSTL</title>
</head>
<body>
	<div>
		<form action="pessoa" method="post">
			<table>
				<tr>
					<td><input type="number" id="id" name="id" placeholder="#ID" required="required">
				</tr>
				<tr>
					<td><input type="text" id="nome" name="nome" placeholder="Nome" required="required"
					value="<c:out value="${pessoa.nome}"/>">
				</tr>
				<tr>
					<td><input type="submit" id="enviar" name="enviar" value="Enviar" ></td>
				</tr>
			</table>
		</form>	
	</div>
	<br />
	<div>
		<!-- <c:if test="${empty pessoa}">
			<p>Existe pessoa</p>
		</c:if> -->
		<c:if test="${not empty pessoa}">
			<c:out value="${pessoa.id}"/> -
			<c:out value="${pessoa.nome}"/>
		</c:if>
	</div>
	<br />
	<div>
		<c:if test="${not empty pessoa}">
			<table border="1">
				<thead>
				
					<tr>
						<th>#ID</th>
						<th>Nome</th>
					</tr>
				</thead>
				<tbody>
					<c:forEach items="${pessoas}" var="p">
						<!-- <c:out value="${p}"/> -->
						<tr>
							<td><c:out value="${pessoa.id}"/>
							<td><c:out value="${pessoa.nome}"/>
						</tr>
					</c:forEach>
				</tbody>
			</table>
		</c:if>
	</div>
</body>

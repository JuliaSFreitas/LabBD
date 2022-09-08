<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<link rel="stylesheet" href="./css/styles.css">
<title>Rodoviaria</title>
</head>
<body>
	<div>
		<form action="motorista" method="post">
			<table>
				<tr><p>Motorista</p></tr>
				<tr>
					<td><input type="number" id="codigo" name="codigo" placeholder="Codigo" required="required">
				</tr>
				<tr>
					<td><input type="text" id="nome" name="nome" placeholder="Nome" required="required">
				</tr>
				<tr>
					<td><input type="text" id="naturalidade" name="naturalidade" placeholder="Naturalidade" required="required">
				</tr>
				<tr>
					<td><input type="submit" id="enviar" name="enviar" value="Enviar" ></td>
				</tr>
			</table>
		</form>	
	</div>
	<br/>
	<div>
		<form action="onibus" method="post">
			<table>
				<tr><p>Onibus</p></tr>
				<tr>
					<td><input type="text" id="placa" name="placa" placeholder="Placa" required="required">
				</tr>
				<tr>
					<td><input type="text" id="marca" name="marca" placeholder="Marca" required="required">
				</tr>
				<tr>
					<td><input type="number" id="ano" name="ano" placeholder="Ano" required="required">
				</tr>
				<tr>
					<td><input type="text" id="descricao" name="descricao" placeholder="Descricao" required="required">
				</tr>
				<tr>
					<td><input type="submit" id="enviar" name="enviar" value="Enviar" ></td>
				</tr>
			</table>
		</form>	
	</div>
	<br/>
	<div>
		<form action="viagem" method="post">
			<table>
				<tr><p>Viagem</p></tr>
				<tr>
					<td><input type="number" id="codigoviagem" name="codigoviagem" placeholder="Codigo" required="required">
				</tr>
				<tr>
					<td><input type="text" id="onibus" name="onibus" placeholder="Onibus" required="required">
				</tr>
				<tr>
					<td><input type="number" id="motorista" name="motorista" placeholder="Motorista" required="required">
				</tr>
				<tr>
					<td><input type="number" id="horasaida" name="horasaida" placeholder="Hora Saida" required="required">
				</tr>
				<tr>
					<td><input type="number" id="horachegada" name="horachegada" placeholder="Hora Chegada" required="required">
				</tr>
				<tr>
					<td><input type="text" id="partida" name="partida" placeholder="Partida" required="required">
				</tr>
				<tr>
					<td><input type="text" id="destino" name="destino" placeholder="Destino" required="required">
				</tr>
				<tr>
					<td><input type="submit" id="enviar" name="enviar" value="Enviar" ></td>
				</tr>
			</table>
		</form>	
	</div>
</body>
</html>
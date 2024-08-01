<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>

		<h1>Clientes</h1>
		
		<form action="add" method="post">
			<input type="hidden" id="idCliente" name="idCliente"  value="${cliente.idCliente}"/>
			Cedula
			<input type="text" id="cedula" name="cedula"  value="${cliente.cedula}"/>
			Nombre 
			<input type="text" id="nombre" name="nombre" value="${cliente.nombre}"/>
			Apellido
			<input type="text" id="apellido" name="apellido" value="${cliente.apellido}"/>
			Direccion
			<input type="text" id="direccion" name="direccion" value="${cliente.direccion}"/>
			Telefono
			<input type="text" id="telefono" name="telefono" value="${cliente.telefon}"/>
			Correo
			<input type="email" id="correo" name="correo" value="${cliente.correo}"/>
			
			<button type="submit">Guarda</button>
		</form>
	

</body>
</html>
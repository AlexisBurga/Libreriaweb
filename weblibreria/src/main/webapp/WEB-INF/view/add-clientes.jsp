<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="ISO-8859-1">
    <title>Agregar o Actualizar Cliente</title>
</head>
<body>

    <h1>Agregar o Actualizar Cliente</h1>

    <form action="/ismac-libreria-web/clientes/add" method="post">
        <input type="hidden" name="idCliente" value="${cliente.idCliente}" />
        <label for="cedula">Cédula:</label>
        <input type="text" id="cedula" name="cedula" value="${cliente.cedula}" />
        <br />
        <label for="nombre">Nombre:</label>
        <input type="text" id="nombre" name="nombre" value="${cliente.nombre}" />
        <br />
        <label for="apellido">Apellido:</label>
        <input type="text" id="apellido" name="apellido" value="${cliente.apellido}" />
        <br />
        <label for="direccion">Dirección:</label>
        <input type="text" id="direccion" name="direccion" value="${cliente.direccion}" />
        <br />
        <label for="telefono">Teléfono:</label>
        <input type="text" id="telefono" name="telefono" value="${cliente.telefono}" />
        <br />
        <label for="correo">Correo:</label>
        <input type="text" id="correo" name="correo" value="${cliente.correo}" />
        <br />
        <button type="submit">Guardar</button>
    </form>

    <a href="/ismac-libreria-web/clientes/findAll">Volver a la lista</a>

</body>
</html>

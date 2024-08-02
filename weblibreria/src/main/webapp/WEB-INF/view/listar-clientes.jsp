<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="ISO-8859-1">
    <title>Clientes</title>
</head>
<body>

    <h1>Clientes</h1>
    
    <!-- Botón para agregar un nuevo cliente -->
    <button onclick="window.location.href='/weblibreria/clientes/findOne?opcion=1'; return false;">
        Agregar
    </button>
    
    <table>
        <thead>
            <tr>
                <th>idCliente</th>
                <th>Cedula</th>
                <th>Nombre</th>
                <th>Apellido</th>
                <th>Direccion</th>
                <th>Telefono</th>
                <th>Correo</th>
                <th>Acciones</th>
            </tr>
        </thead>
        
        <tbody>
            <c:forEach var="item" items="${clientes}">
                <tr>
                    <td>${item.idCliente}</td>
                    <td>${item.cedula}</td>
                    <td>${item.nombre}</td>
                    <td>${item.apellido}</td>
                    <td>${item.direccion}</td>
                    <td>${item.telefono}</td>
                    <td>${item.correo}</td>
                    <td>
                        <!-- Botón para actualizar el cliente -->
                        <button onclick="window.location.href='/weblibreria/clientes/findOne?idCliente=${item.idCliente}&opcion=1'; return false;">
                            Actualizar
                        </button>
                        <!-- Botón para eliminar el cliente -->
                        <button onclick="window.location.href='/weblibreria/clientes/findOne?idCliente=${item.idCliente}&opcion=2'; return false;">
                            Eliminar
                        </button>
                    </td>
                </tr>
            </c:forEach>
        </tbody>
    </table>
    
</body>
</html>


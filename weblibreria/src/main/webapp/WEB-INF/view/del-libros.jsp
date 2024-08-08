<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Eliminar Libro</title>
</head>
<body>
<h1> Eliminar Libro </h1>

<form action="deleteLibro" method="post">

    <input type="hidden" id="idLibro" name="idLibro" value="${libro.idLibro}" />

    <p>¿Estás seguro de que deseas eliminar el siguiente libro?</p>

    <p><strong>Título:</strong> ${libro.titulo}</p>
    <p><strong>Editorial:</strong> ${libro.editorial}</p>
    <p><strong>Autor:</strong> ${libro.autor}</p>
    <p><strong>ISBN:</strong> ${libro.ISBN}</p>

    <button type="submit">Eliminar</button>

    <button onclick="window.location.href='/weblibreria/libros/findAll'; return false;">
        Cancelar
    </button>
</form>

</body>
</html>

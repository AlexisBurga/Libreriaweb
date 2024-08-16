<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Listado de Libros</title>
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/estilos.css">
</head>
<body>
    <h1>Libros</h1>
    <!-- Botón para agregar un nuevo libro -->
    <button onclick="window.location.href='/weblibreria/libros/findOne?opcion=1'; return false;">
        Agregar
    </button>
    
    <table>
        <thead>
            <tr>
                <th>ID Libro</th>
                <th>Título</th>
                <th>Editorial</th>
                <th>Número de Páginas</th>
                <th>Edición</th>
                <th>Idioma</th>
                <th>Fecha de Publicación</th>
                <th>Descripción</th>
                <th>Tipo de Pasta</th>
                <th>ISBN</th>
                <th>Número de Ejemplares</th>
                <th>Portada</th>
                <th>Presentación</th>
                <th>Precio</th>
                <th>Categoría</th>
                <th>Autor</th>
                <th>Acciones</th>
            </tr>
        </thead>
        <tbody>
            <c:forEach var="item" items="${libros}">
                <tr>
                    <td>${item.idLibro}</td>
                    <td>${item.titulo}</td>
                    <td>${item.editorial}</td>
                    <td>${item.numPaginas}</td>
                    <td>${item.edicion}</td>
                    <td>${item.idioma}</td>
                    <td>${fn:substring(item.fechaPublicacion, 0, 10)}</td>
                    <td>${item.descripcion}</td>
                    <td>${item.tipoPasta}</td>
                    <td>${item.ISBN}</td>
                    <td>${item.numEjemplares}</td>
                    <td>
                        <c:if test="${not empty item.portada}">
                            <img alt="Portada de libro" width="200" height="200" src="${pageContext.request.contextPath}/resources/img/${item.portada}">
                        </c:if>
                    </td>
                    <td>${item.presentacion}</td>
                    <td>${item.precio}</td>
                    <td>
                       
                                ${item.categoria.categoria}
                          
                    </td>
                    <td>
                       
                                ${item.autor.nombre} ${item.autor.apellido}
                           
                    </td>
                    <td>
                        <!-- Botón para actualizar el libro -->
                        <button onclick="window.location.href='/weblibreria/libros/findOne?idLibro=${item.idLibro}&opcion=1'; return false;">
                            Actualizar
                        </button>
                        <!-- Botón para eliminar el libro -->
                        <button onclick="window.location.href='/weblibreria/libros/findOne?idLibro=${item.idLibro}&opcion=2'; return false;">
                            Eliminar
                        </button>
                    </td>
                </tr>
            </c:forEach>
        </tbody>
    </table>
</body>
</html>

<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Agregar/Editar Libro</title>
    <!-- Asegúrate de que el archivo CSS esté en la ruta correcta -->
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/style.css">
</head>
<body>
    <h1>
        <c:choose>
            <c:when test="${libro != null && libro.idLibro != null}">
                Editar Libro
            </c:when>
            <c:otherwise>
                Agregar Nuevo Libro
            </c:otherwise>
        </c:choose>
    </h1>

    <form action="${pageContext.request.contextPath}/libros/add" method="post">
        <!-- Campo oculto para el ID del libro (solo se usará en caso de edición) -->
        <input type="hidden" name="idLibro" value="${libro.idLibro}"/>

        <label for="titulo">Título:</label>
        <input type="text" id="titulo" name="titulo" value="${libro.titulo}" required/><br><br>

        <label for="editorial">Editorial:</label>
        <input type="text" id="editorial" name="editorial" value="${libro.editorial}"/><br><br>

        <label for="num_paginas">Número de Páginas:</label>
        <input type="number" id="num_paginas" name="num_paginas" value="${libro.numPaginas}"/><br><br>

        <label for="edicion">Edición:</label>
        <input type="text" id="edicion" name="edicion" value="${libro.edicion}"/><br><br>

        <label for="idioma">Idioma:</label>
        <input type="text" id="idioma" name="idioma" value="${libro.idioma}"/><br><br>

        <label for="fecha_publicacion">Fecha de Publicación:</label>
        <input type="date" id="fecha_publicacion" name="fecha_publicacion" value="${libro.fechaPublicacion != null ? libro.fechaPublicacion.toString().substring(0, 10) : ''}"/><br><br>

        <label for="descripcion">Descripción:</label>
        <textarea id="descripcion" name="descripcion">${libro.descripcion}</textarea><br><br>

        <label for="tipo_pasta">Tipo de Pasta:</label>
        <input type="text" id="tipo_pasta" name="tipo_pasta" value="${libro.tipoPasta}"/><br><br>

        <label for="ISBN">ISBN:</label>
        <input type="text" id="ISBN" name="ISBN" value="${libro.ISBN}"/><br><br>

        <label for="num_ejemplares">Número de Ejemplares:</label>
        <input type="number" id="num_ejemplares" name="num_ejemplares" value="${libro.numEjemplares}"/><br><br>

        <label for="portada">Portada:</label>
        <input type="text" id="portada" name="portada" value="${libro.portada}"/><br><br>

        <label for="presentacion">Presentación:</label>
        <input type="text" id="presentacion" name="presentacion" value="${libro.presentacion}"/><br><br>

        <label for="precio">Precio:</label>
        <input type="number" step="0.01" id="precio" name="precio" value="${libro.precio}"/><br><br>

        <label for="id_categoria">Categoría:</label>
        <select id="id_categoria" name="id_categoria">
            <c:forEach var="categoria" items="${categorias}">
                <option value="${categoria.idCategoria}" <c:if test="${libro != null && categoria.idCategoria == libro.categoria.idCategoria}">selected</c:if>>${categoria.categoria}</option>
            </c:forEach>
        </select><br><br>

        <label for="id_autor">Autor:</label>
        <select id="id_autor" name="id_autor">
            <c:forEach var="autor" items="${autores}">
                <option value="${autor.idAutor}" <c:if test="${libro != null && autor.idAutor == libro.autor.idAutor}">selected</c:if>>${autor.nombre} ${autor.apellido}</option>
            </c:forEach>
        </select><br><br>

        <button type="submit">Guardar</button>
        <a href="${pageContext.request.contextPath}/libros/findAll">Cancelar</a>
    </form>
</body>
</html>

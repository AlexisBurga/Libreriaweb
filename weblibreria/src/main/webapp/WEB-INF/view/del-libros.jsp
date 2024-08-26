<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <title>Eliminar Libro</title>
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/bootstrap.min.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.1/css/all.min.css" integrity="sha512-DTOQO9RWCH3ppGqcWaEA1BIZOC6xxalwEsw9c2QQeAIftl+Vegovlnee1c9QX4TctnWMn13TZye+giMm8e2LwA==" crossorigin="anonymous" referrerpolicy="no-referrer" />
</head>
<body>
    <section class="px-5 py-5">
        <div class="container">
            <h1>Eliminar Libro</h1>
            <form action="${pageContext.request.contextPath}/libros/del" method="post" class="needs-validation" novalidate>
                <input type="hidden" name="idLibro" value="${libro.idLibro}" />

                <p>¿Estás seguro de que deseas eliminar el siguiente libro?</p>
                <div class="mb-3">
                    <p><strong>Título:</strong> ${libro.titulo}</p>
                </div>
                <div class="mb-3">
                    <p><strong>Editorial:</strong> ${libro.editorial}</p>
                </div>
                <div class="mb-3">
                    <p><strong>Autor:</strong> ${libro.autor.nombre} ${libro.autor.apellido}</p>
                </div>
                <div class="mb-3">
                    <p><strong>ISBN:</strong> ${libro.ISBN}</p>
                </div>

                <div class="form-group">
                    <button type="submit" class="btn btn-danger">
                        Eliminar <i class="fa-solid fa-trash-can fa-sm"></i>
                    </button>
                    <button type="button" class="btn btn-secondary" onclick="window.location.href='${pageContext.request.contextPath}/libros/findAll';">
                        Cancelar <i class="fa-solid fa-ban fa-sm" style="color: #ffca57;"></i>
                    </button>
                </div>
            </form>
        </div>
    </section>

    <script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/bootstrap.bundle.min.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/jquery-3.7.1.min.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/bootstrap.min.js"></script>
    
</body>
</html>

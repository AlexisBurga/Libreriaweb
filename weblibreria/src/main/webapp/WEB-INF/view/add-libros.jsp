<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="ISO-8859-1">
    <title>Sistema Librería</title>
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/bootstrap.min.css">
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/bootstrap-table.min.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.1/css/all.min.css" integrity="sha512-DTOQO9RWCH3ppGqcWaEA1BIZOC6xxalwEsw9c2QQeAIftl+Vegovlnee1c9QX4TctnWMn13TZye+giMm8e2LwA==" crossorigin="anonymous" referrerpolicy="no-referrer" />
</head>

<body>
   
    <nav></nav>

    <section class="px-5 py-5">
        <div class="container">
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
            <form action="${pageContext.request.contextPath}/libros/add" method="post" class="needs-validation" novalidate>
                <!-- Campo oculto para el ID del libro (solo se usará en caso de edición) -->
                <input type="hidden" name="idLibro" value="${libro.idLibro}"/>

                <div class="form-group">
                    <label for="titulo" class="form-label">Título</label>
                    <input class="form-control" type="text" id="titulo" name="titulo" value="${libro.titulo}" required>
                </div>

                <div class="form-group">
                    <label for="editorial" class="form-label">Editorial</label>
                    <input class="form-control" type="text" id="editorial" name="editorial" value="${libro.editorial != null ? libro.editorial : ''}" required>
                </div>

                <div class="form-group">
                    <label for="num_paginas" class="form-label">Número de Páginas</label>
                    <input class="form-control" type="number" id="num_paginas" name="num_paginas" value="${libro.numPaginas != null ? libro.numPaginas : ''}">
                </div>

                <div class="form-group">
                    <label for="edicion" class="form-label">Edición</label>
                    <input class="form-control" type="text" id="edicion" name="edicion" value="${libro.edicion != null ? libro.edicion : ''}">
                </div>

                <div class="form-group">
                    <label for="idioma" class="form-label">Idioma</label>
                    <input class="form-control" type="text" id="idioma" name="idioma" value="${libro.idioma != null ? libro.idioma : ''}">
                </div>

                <div class="form-group">
                    <label for="fecha_publicacion" class="form-label">Fecha de Publicación</label>
                    <input class="form-control" type="date" id="fecha_publicacion" name="fecha_publicacion" value="${libro.fechaPublicacion != null ? libro.fechaPublicacion.toString().substring(0, 10) : ''}">
                </div>

                <div class="form-group">
                    <label for="descripcion" class="form-label">Descripción</label>
                    <textarea class="form-control" id="descripcion" name="descripcion">${libro.descripcion != null ? libro.descripcion : ''}</textarea>
                </div>

                <div class="form-group">
                    <label for="tipo_pasta" class="form-label">Tipo de Pasta</label>
                    <input class="form-control" type="text" id="tipo_pasta" name="tipo_pasta" value="${libro.tipoPasta != null ? libro.tipoPasta : ''}">
                </div>

                <div class="form-group">
                    <label for="ISBN" class="form-label">ISBN</label>
                    <input class="form-control" type="text" id="ISBN" name="ISBN" value="${libro.ISBN != null ? libro.ISBN : ''}">
                </div>

                <div class="form-group">
                    <label for="num_ejemplares" class="form-label">Número de Ejemplares</label>
                    <input class="form-control" type="number" id="num_ejemplares" name="num_ejemplares" value="${libro.numEjemplares != null ? libro.numEjemplares : ''}">
                </div>

                <div class="form-group">
                    <label for="portada" class="form-label">Portada</label>
                    <input class="form-control" type="text" id="portada" name="portada" value="${libro.portada != null ? libro.portada : ''}">
                </div>

                <div class="form-group">
                    <label for="presentacion" class="form-label">Presentación</label>
                    <input class="form-control" type="text" id="presentacion" name="presentacion" value="${libro.presentacion != null ? libro.presentacion : ''}">
                </div>

                <div class="form-group">
                    <label for="precio" class="form-label">Precio</label>
                    <input class="form-control" type="number" step="0.01" id="precio" name="precio" value="${libro.precio != null ? libro.precio : ''}" required>
                </div>

                <div class="form-group">
                    <label for="idCategoria" class="form-label">Categoría</label>
                    <select class="form-control" id="idCategoria" name="idCategoria">
                        <c:forEach var="item" items="${categorias}">
                            <option value="${item.idCategoria}" ${item.idCategoria == libro.categoria.idCategoria ? 'selected' : ''}>
                                ${item.categoria}
                            </option>
                        </c:forEach>
                    </select>
                </div>

                <div class="form-group">
                    <label for="idAutor" class="form-label">Autor</label>
                    <select class="form-control" id="idAutor" name="idAutor">
                        <c:forEach var="autor" items="${autores}">
                            <option value="${autor.idAutor}" 
                                <c:if test="${libro.autor != null && autor.idAutor == libro.autor.idAutor}">
                                    selected="selected"
                                </c:if>>
                                ${autor.nombre} ${autor.apellido}
                            </option>
                        </c:forEach>
                    </select>
                </div>

                <button type="submit" class="btn btn-primary">Guardar
                <i class="fa-solid fa-floppy-disk fa-sm" style="color: #3dffb5;"></i>
                </button>
                
                 <button class="btn btn-primary" onclick="window.location.href='/weblibreria/libros/findAll';return false ;">
                 Cancelar
                 <i class="fa-solid fa-ban fa-sm" style="color: #ffca57;"></i>
               
               </button>
            </form>
        </div>
    </section>

    <footer></footer>

    <script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/bootstrap.bundle.min.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/jquery-3.7.1.min.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/bootstrap.min.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/bootstrap-table.min.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/bootstrap-table-es-MX.min.js"></script>
    <script type="text/javascript">
        var $tabla1 = $('#tabla1');

        $(function() {
            $tabla1.bootstrapTable({
                sortReset: true
            });
        });
    </script>
</body>
</html>

<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Sistema Libreria</title>
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/bootstrap.min.css">
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/bootstrap-table.min.css">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.1/css/all.min.css" integrity="sha512-DTOQO9RWCH3ppGqcWaEA1BIZOC6xxalwEsw9c2QQeAIftl+Vegovlnee1c9QX4TctnWMn13TZye+giMm8e2LwA==" crossorigin="anonymous" referrerpolicy="no-referrer" />
</head>

<body>

<nav> </nav>


<section class="px-5 py-5">

<div class="container">
<h1>Libros</h1>
<div class="container" style="text-align: center;">
 <!-- Botón para agregar un nuevo libro -->
    
    <button class="btn btn-primary" onclick="window.location.href='/weblibreria/libros/findOne?opcion=1'; return false;">Agregar
        <i class="fa-solid fa-address-book"></i>
       <!-- agregar -->
    </button>
</div>
<div class="table-responsive">

    <table id="tabla1"
           name="tabla1"
           data-height="600"
           data-search="true"
           data-pagination="true"
           data-toogle="tabla1"
           data-tollbar=".toolbar"
           class="table table-striped table-sm"  
    
    
    
    >
        <thead>
            <tr>
               
               <th>ID Libro</th>
               <th data-field="Título" data-sortable="true">Título</th>
               <th data-field="Editorial" data-sortable="true">Editorial</th>
               <th data-field="Número de páginas" data-sortable="true">Número de Páginas</th>
               <th data-field="Edición" data-sortable="true">Edición</th>
               <th data-field="Idioma" data-sortable="true">Idioma</th>
               <th data-field="Fecha de publicacion" data-sortable="true">Fecha de Publicación</th>
               <th data-field="Descripcion" data-sortable="true">Descripción</th>
               <th data-field="tipo_pasta" data-sortable="true">Tipo de Pasta</th>
               <th data-field="ISBN" data-sortable="true">ISBN</th>
               <th data-field="Número de ejemplares" data-sortable="true">Número de Ejemplares</th>
               <th data-field="Portada" data-sortable="false">Portada</th> <!-- Portada probablemente no sea sortable -->
               <th data-field="Presentacion" data-sortable="true">Presentación</th>
               <th data-field="Precio" data-sortable="true">Precio</th>
               <th data-field="Categoria" data-sortable="true">Categoría</th>
               <th data-field="Autor" data-sortable="true">Autor</th>
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
<button class="btn btn" onclick="window.location.href='/weblibreria/libros/findOne?idLibro=${item.idLibro}&opcion=1'; return false;">
    <i class="fa-solid fa-square-pen" style="color: #74C0FC; font-size: 3.5em;"></i>
</button>
<!-- Botón para eliminar el libro -->
<button class="btn btn" onclick="window.location.href='/weblibreria/libros/findOne?idLibro=${item.idLibro}&opcion=2'; return false;">
    <i class="fa-solid fa-eraser" style="color: #dd4b27; font-size: 3.5em;"></i>
</button>

                    </td>
                </tr>
            </c:forEach>
        </tbody>
    </table>


</div>


</section>


<footer></footer>


  
    
   
    
    <script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/bootstrap.bundle.min.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/jquery-3.7.1.min.js"></script>
     <script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/bootstrap.min.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/bootstrap-table.min.js"></script>
     <script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/bootstrap-table-es-MX.min.js"></script>
     <script type="text/javascript">
     var $tabla1 = $('#tabla1')
     
     $(function(){
    	 
    	 $tabla1.bootstrapTable({
    		 sortReset : true   })
    	 
     }
    		 
     )
     
     
     
     </script>
     
</body>
</html>

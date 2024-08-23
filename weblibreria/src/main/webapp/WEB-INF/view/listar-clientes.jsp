<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="ISO-8859-1">
    <title>Clientes</title>
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/bootstrap.min.css">
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/bootstrap-table.min.css">
</head>
<body>

<nav></nav>

<section class="px-5 py-5">

<div class="container">
    <h1>Clientes</h1>
    <div class="container" style="text-align: center;">
        <!-- Botón para agregar un nuevo cliente -->
        <button class="btn btn-primary" onclick="window.location.href='/weblibreria/clientes/findOne?opcion=1'; return false;">
            Agregar
        </button>
    </div>
    <div class="table-responsive">

        <table id="tablaClientes"
               name="tablaClientes"
               data-height="600"
               data-search="true"
               data-pagination="true"
               data-toggle="tablaClientes"
               data-toolbar=".toolbar"
               class="table table-striped table-sm">
            <thead>
                <tr>
                    <th data-field="idCliente" data-sortable="true">ID Cliente</th>
                    <th data-field="cedula" data-sortable="true">Cédula</th>
                    <th data-field="nombre" data-sortable="true">Nombre</th>
                    <th data-field="apellido" data-sortable="true">Apellido</th>
                    <th data-field="direccion" data-sortable="true">Dirección</th>
                    <th data-field="telefono" data-sortable="true">Teléfono</th>
                    <th data-field="correo" data-sortable="true">Correo</th>
                    <th data-field="acciones" data-sortable="false">Acciones</th>
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
                            <button class="btn btn-success" onclick="window.location.href='/weblibreria/clientes/findOne?idCliente=${item.idCliente}&opcion=1'; return false;">
                                Actualizar
                            </button>
                            <!-- Botón para eliminar el cliente -->
                            <button class="btn btn-danger" onclick="window.location.href='/weblibreria/clientes/findOne?idCliente=${item.idCliente}&opcion=2'; return false;">
                                Eliminar
                            </button>
                        </td>
                    </tr>
                </c:forEach>
            </tbody>
        </table>

    </div>
</div>

</section>

<footer></footer>

<script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/bootstrap.bundle.min.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/jquery-3.7.1.min.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/bootstrap.min.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/bootstrap-table.min.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/bootstrap-table-es-MX.min.js"></script>
<script type="text/javascript">
var $tablaClientes = $('#tablaClientes');

$(function(){
    $tablaClientes.bootstrapTable({
        sortReset: true
    });
});
</script>

</body>
</html>

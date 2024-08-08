<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Agregar Libro</title>
</head>
<body>
<h1> Agregar Libro </h1>

<form action="addLibro" method="post">

    <input type="hidden" id="idLibro" name="idLibro" value="${libro.idLibro}" />

    T�tulo:
    <input type="text" id="titulo" name="titulo" value="${libro.titulo}" />
    <br/>

    Editorial:
    <input type="text" id="editorial" name="editorial" value="${libro.editorial}" />
    <br/>

    N�mero de P�ginas:
    <input type="number" id="numPaginas" name="numPaginas" value="${libro.numPaginas}" />
    <br/>

    Edici�n:
    <input type="text" id="edicion" name="edicion" value="${libro.edicion}" />
    <br/>

    Idioma:
    <input type="text" id="idioma" name="idioma" value="${libro.idioma}" />
    <br/>

    Fecha de Publicaci�n:
    <input type="date" id="fechaPublicacion" name="fechaPublicacion" value="${libro.fechaPublicacion}" />
    <br/>

    Descripci�n:
    <textarea id="descripcion" name="descripcion">${libro.descripcion}</textarea>
    <br/>

    Tipo de Pasta:
    <input type="text" id="tipoPasta" name="tipoPasta" value="${libro.tipoPasta}" />
    <br/>

    ISBN:
    <input type="text" id="ISBN" name="ISBN" value="${libro.ISBN}" />
    <br/>

    N�mero de Ejemplares:
    <input type="number" id="numEjemplares" name="numEjemplares" value="${libro.numEjemplares}" />
    <br/>

    Portada:
    <input type="text" id="portada" name="portada" value="${libro.portada}" />
    <br/>

    Presentaci�n:
    <input type="text" id="presentacion" name="presentacion" value="${libro.presentacion}" />
    <br/>

    Precio:
    <input type="number" id="precio" name="precio" step="0.01" value="${libro.precio}" />
    <br/>

    Categor�a:
    <input type="text" id="categoria" name="categoria" value="${libro.categoria}" />
    <br/>

    Autor:
    <input type="text" id="autor" name="autor" value="${libro.autor}" />
    <br/>

    <button type="submit">Guardar</button>

    <button onclick="window.location.href='/weblibreria/libros/findAll'; return false;">
        Cancelar
    </button>
</form>

</body>
</html>

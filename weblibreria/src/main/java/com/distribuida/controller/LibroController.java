package com.distribuida.controller;

import java.util.Date;
import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.lang.Nullable;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.distribuida.dao.AutorDao;
import com.distribuida.dao.CategoriaDao;
import com.distribuida.dao.LibroDao;
import com.distribuida.entities.Libro;

@Controller
@RequestMapping("/libros")
public class LibroController {

    @Autowired
    private LibroDao libroDao;
    @Autowired
    private CategoriaDao categoriaDao;
    @Autowired
    private AutorDao autorDao;

    @GetMapping("/findAll")
    public String findAll(ModelMap modelMap) {
        List<Libro> libros = libroDao.findAll();
        modelMap.addAttribute("libros", libros);
        return "listar-libros";
    }

    @GetMapping("/findOne")
    public String findOne(@RequestParam("idLibro") Optional<Integer> idLibro,
                          @RequestParam("opcion") Optional<Integer> opcion,
                          ModelMap modelMap) {
        idLibro.ifPresent(id -> {
            Libro libro = libroDao.findOne(id);
            modelMap.addAttribute("libro", libro);
        });

        modelMap.addAttribute("autores", autorDao.findAll());
        modelMap.addAttribute("categorias", categoriaDao.findAll());

        return opcion.map(o -> {
            // Actualización
            if (o == 1) return "add-libros";
            // Eliminación
            else return "del-libros";
        }).orElse("findAll");
    }

    @PostMapping("/add")
    public String add(@RequestParam("idLibro") Optional<Integer> idLibro,
                      @RequestParam("titulo") @Nullable String titulo,
                      @RequestParam("editorial") @Nullable String editorial,
                      @RequestParam("num_paginas") @Nullable Integer numPaginas,
                      @RequestParam("edicion") @Nullable String edicion,
                      @RequestParam("idioma") @Nullable String idioma,
                      @RequestParam("fecha_publicacion") @Nullable Date fechaPublicacion,
                      @RequestParam("descripcion") @Nullable String descripcion,
                      @RequestParam("tipo_pasta") @Nullable String tipoPasta,
                      @RequestParam("ISBN") @Nullable String ISBN,
                      @RequestParam("num_ejemplares") @Nullable Integer numEjemplares,
                      @RequestParam("portada") @Nullable String portada,
                      @RequestParam("presentacion") @Nullable String presentacion,
                      @RequestParam("precio") @Nullable Double precio,
                      @RequestParam("id_categoria") @Nullable Integer idCategoria,
                      @RequestParam("id_autor") @Nullable Integer idAutor,
                      ModelMap modelMap) {

        Libro libro = new Libro();
        libro.setTitulo(titulo);
        libro.setEditorial(editorial);
        libro.setNumPaginas(numPaginas);
        libro.setEdicion(edicion);
        libro.setIdioma(idioma);
        libro.setFechaPublicacion(fechaPublicacion);
        libro.setDescripcion(descripcion);
        libro.setTipoPasta(tipoPasta);
        libro.setISBN(ISBN);
        libro.setNumEjemplares(numEjemplares);
        libro.setPortada(portada);
        libro.setPresentacion(presentacion);
        libro.setPrecio(precio != null ? precio : 0.0);
        
        if (idCategoria != null) {
            libro.setCategoria(categoriaDao.findOne(idCategoria));
        }
        if (idAutor != null) {
            libro.setAutor(autorDao.findOne(idAutor));
        }

        if (idLibro.isPresent()) {
            libro.setIdLibro(idLibro.get());
            libroDao.up(libro);
        } else {
            libroDao.add(libro);
        }
        
        return "redirect:/libros/findAll";
    }

    @GetMapping("/del")
    public String del(@RequestParam("idLibro") Integer idLibro) {
        libroDao.del(idLibro);
        return "redirect:/libros/findAll";
    }
}

package com.distribuida.controller;

import java.util.Date;
import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.format.annotation.DateTimeFormat;
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
import com.distribuida.entities.Categoria;
import com.distribuida.entities.Autor;

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
    public String findOne(@RequestParam(name = "idLibro", required = false) Integer idLibro,
                          @RequestParam(name = "opcion", required = false) Integer opcion,
                          ModelMap modelMap) {
        if (idLibro != null) {
            Libro libro = libroDao.findOne(idLibro);
            modelMap.addAttribute("libro", libro);
        }

        // Cargar todas las categorías y autores
        List<Categoria> categorias = categoriaDao.findAll();
        List<Autor> autores = autorDao.findAll();
        modelMap.addAttribute("categorias", categorias);
        modelMap.addAttribute("autores", autores);

        if (opcion != null && opcion == 1) {
            return "add-libros";
        } else {
            return "del-libros";
        }
    }

    @PostMapping("/add")
    public String add(@RequestParam("idLibro") Optional<Integer> idLibro,
                      @RequestParam("titulo") String titulo,
                      @RequestParam("editorial") String editorial,
                      @RequestParam("num_paginas") Integer numPaginas,
                      @RequestParam("edicion") String edicion,
                      @RequestParam("idioma") String idioma,
                      @RequestParam("fecha_publicacion") @DateTimeFormat(iso = DateTimeFormat.ISO.DATE) Date fechaPublicacion,
                      @RequestParam("descripcion") String descripcion,
                      @RequestParam("tipo_pasta") String tipoPasta,
                      @RequestParam("ISBN") String ISBN,
                      @RequestParam("num_ejemplares") Integer numEjemplares,
                      @RequestParam("portada") String portada,
                      @RequestParam("presentacion") String presentacion,
                      @RequestParam("precio") Double precio,
                      @RequestParam("idCategoria") Integer idCategoria,
                      @RequestParam("idAutor") Integer idAutor) {

        // Encontrar la categoría y el autor por sus IDs
        Categoria categoria = categoriaDao.findOne(idCategoria);
        Autor autor = autorDao.findOne(idAutor);

        Libro libro = new Libro(
            idLibro.orElse(0),
            titulo,
            editorial,
            numPaginas,
            edicion,
            idioma,
            fechaPublicacion,
            descripcion,
            tipoPasta,
            ISBN,
            numEjemplares,
            portada,
            presentacion,
            precio
        );

        // Establecer la categoría y el autor en el libro
        libro.setCategoria(categoria);
        libro.setAutor(autor);

        // Verificar si el libro existe para actualizar o crear uno nuevo
        if (idLibro.isPresent() && idLibro.get() > 0) {
            libroDao.up(libro); // Actualizar libro existente
        } else {
            libroDao.add(libro); // Crear nuevo libro
        }

        return "redirect:/libros/findAll";
    }

    @PostMapping("/del")
    public String del(@RequestParam("idLibro") Integer idLibro) {
        libroDao.del(idLibro);
        return "redirect:/libros/findAll";
    }
}

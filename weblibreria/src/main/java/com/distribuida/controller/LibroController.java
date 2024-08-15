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
        modelMap.addAttribute("autores", autorDao.findAll());
        modelMap.addAttribute("categorias", categoriaDao.findAll());

        if (opcion != null && opcion == 1) {
            return "add-libros";
        } else {
            return "del-libros";
        }
    }

    @PostMapping("/add")
    public String add(@RequestParam("idLibro") Optional<Integer> idLibro,
                      @RequestParam("titulo") Optional<String> titulo,
                      @RequestParam("editorial") Optional<String> editorial,
                      @RequestParam("num_paginas") Optional<Integer> numPaginas,
                      @RequestParam("edicion") Optional<String> edicion,
                      @RequestParam("idioma") Optional<String> idioma,
                      @RequestParam("fecha_publicacion") @DateTimeFormat(iso = DateTimeFormat.ISO.DATE) Optional<Date> fechaPublicacion,
                      @RequestParam("descripcion") Optional<String> descripcion,
                      @RequestParam("tipo_pasta") Optional<String> tipoPasta,
                      @RequestParam("ISBN") Optional<String> ISBN,
                      @RequestParam("num_ejemplares") Optional<Integer> numEjemplares,
                      @RequestParam("portada") Optional<String> portada,
                      @RequestParam("presentacion") Optional<String> presentacion,
                      @RequestParam("precio") Optional<Double> precio,
                      @RequestParam("id_categoria") Optional<Integer> idCategoria,
                      @RequestParam("id_autor") Optional<Integer> idAutor,
                      ModelMap modelMap) {
        
        Libro libro = new Libro(
            idLibro.orElse(0),
            titulo.orElse(""),
            editorial.orElse(""),
            numPaginas.orElse(0),
            edicion.orElse(""),
            idioma.orElse(""),
            fechaPublicacion.orElse(new Date()),
            descripcion.orElse(""),
            tipoPasta.orElse(""),
            ISBN.orElse(""),
            numEjemplares.orElse(0),
            portada.orElse(""),
            presentacion.orElse(""),
            precio.orElse(0.0)
        );

        Libro.setCategoria(categoriaDao.findOne(idCategoria.orElse(0)));
        Libro.setAutor(autorDao.findOne(idAutor.orElse(0)));

        if (idLibro.isPresent()) {
            libroDao.up(libro);
        } else {
            libroDao.add(libro);
        }

        return "redirect:/libros/findAll";
    }

    @PostMapping("/del")
    public String del(@RequestParam("idLibro") Integer idLibro) {
        libroDao.del(idLibro);
        return "redirect:/libros/findAll";
    }
}

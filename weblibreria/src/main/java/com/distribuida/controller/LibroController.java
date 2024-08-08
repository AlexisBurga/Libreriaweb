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
    public String findOne(@RequestParam(name="idLibro", required = false) Integer idLibro,
    		              @RequestParam(name = "opcion", required = false) Integer opcion,
                          ModelMap modelMap) {
       if( idLibro !=null) {
            Libro libro = libroDao.findOne(idLibro);
            modelMap.addAttribute("libro", libro);
           modelMap.addAttribute("autores", autorDao.findAll());
    	modelMap.addAttribute("categorias", categoriaDao.findAll());
       }
            if (opcion != null && opcion == 1) {
            	return "add-libros";
            } else {
    				return "del-libros";
            }
    			
    	}
	
    @PostMapping("/add")
    public String add(@RequestParam("idLibro") @Nullable Integer idLibro,
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
                      ModelMap modelMap )

{
    	if (idLibro == null) {
			Libro libro = new Libro(0,titulo,editorial,numPaginas,edicion,idioma,fechaPublicacion,descripcion,tipoPasta,ISBN,numEjemplares,portada,presentacion,precio);
			libro.setCategoria(categoriaDao.findOne(idCategoria));
			//libro.setAutor(autorDAO.findOne(id_autor));
			
			libroDao.add(libro);	
			
		}else {
			
			Libro libro = new Libro(idLibro,titulo,editorial,numPaginas,edicion,idioma,fechaPublicacion,descripcion,tipoPasta,ISBN,numEjemplares,portada,presentacion,precio);
			libro.setCategoria(categoriaDao.findOne(idCategoria));
			//libro.setAutor(autorDAO.findOne(id_autor));
			
			libroDao.up(libro);
			
		}
		
		return "redirect:/libros/libros-listar";
		
	}

    @GetMapping("/del")
    public String del(@RequestParam("idLibro") Integer idLibro) {
        libroDao.del(idLibro);
        return "redirect:/libros/findAll";
    }
}

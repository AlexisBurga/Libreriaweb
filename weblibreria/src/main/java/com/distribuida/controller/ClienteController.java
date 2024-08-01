package com.distribuida.controller;

import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.lang.Nullable;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import com.distribuida.dao.ClienteDao;
import com.distribuida.entities.Cliente;

@Controller
@RequestMapping("/clientes") // Ruta principal
public class ClienteController {

    @Autowired
    private ClienteDao clienteDao;

    // Listar todos los clientes
    @GetMapping("/findAll")
    public String findAll(Model model) {
        List<Cliente> clientes = clienteDao.findAll();
        model.addAttribute("clientes", clientes);
        return "listar-clientes"; // Nombre del archivo JSP que debe estar en /WEB-INF/views
    }

    // Buscar un cliente por ID y decidir la acción a realizar (Actualizar o Eliminar)
    @GetMapping("/findOne")
    public String findOne(@RequestParam(value = "idCliente", required = false) Integer idCliente,
                          @RequestParam(value = "opcion", required = false) Integer opcion,
                          Model model) {
        if (idCliente != null) {
            Cliente cliente = clienteDao.findOne(idCliente);
            model.addAttribute("cliente", cliente);
        }
        // Determinar la vista a devolver según la opción
        if (opcion != null) {
            if (opcion == 1) return "add-clientes"; // Vista para agregar o actualizar cliente
            if (opcion == 2) return "del-clientes"; // Vista para eliminar cliente
        }
        return "redirect:/clientes/findAll"; // Redirigir a la lista si no hay opción válida
    }

    // Agregar o actualizar un cliente
    @PostMapping("/add")
    public String add(@RequestParam(value = "idCliente", required = false) Integer idCliente,
                      @RequestParam(value = "cedula", required = false) String cedula,
                      @RequestParam(value = "nombre", required = false) String nombre,
                      @RequestParam(value = "apellido", required = false) String apellido,
                      @RequestParam(value = "direccion", required = false) String direccion,
                      @RequestParam(value = "telefono", required = false) String telefono,
                      @RequestParam(value = "correo", required = false) String correo,
                      Model model) {
        // Validar los datos del cliente
        if (idCliente == null) {
            Cliente cliente = new Cliente(0, cedula, nombre, apellido, direccion, telefono, correo);
            clienteDao.add(cliente);
        } else {
            Cliente cliente2 = new Cliente(idCliente, cedula, nombre, apellido, direccion, telefono, correo);
            clienteDao.up(cliente2);
        }
        return "redirect:/clientes/findAll"; // Redirigir a la lista de clientes
    }

    // Eliminar un cliente
    @GetMapping("/del")
    public String del(@RequestParam(value = "idCliente") Integer idCliente) {
        if (idCliente != null) {
            clienteDao.del(idCliente);
        }
        return "redirect:/clientes/findAll"; // Redirigir a la lista de clientes
    }
}

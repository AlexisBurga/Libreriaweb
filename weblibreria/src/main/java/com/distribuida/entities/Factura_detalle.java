package com.distribuida.entities;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

import org.springframework.stereotype.Component;

@Component
@Entity
@Table(name = "factura_detalle")
public class Factura_detalle {

    // Atributos
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "id_factura_detalle")
    private int idFactura_detalle;

    @Column(name = "cantidad")
    private int cantidad;

    @Column(name = "subtotal")
    private double subtotal;

    @ManyToOne(cascade = {CascadeType.DETACH, CascadeType.MERGE, CascadeType.PERSIST, CascadeType.REFRESH})
    @JoinColumn(name = "id_factura")  // Relación con Factura
    private Factura factura;

    @ManyToOne(cascade = {CascadeType.DETACH, CascadeType.MERGE, CascadeType.PERSIST, CascadeType.REFRESH})
    @JoinColumn(name = "id_libro")  // Relación con Libro
    private Libro libro;

    public Factura_detalle() {}

    public Factura_detalle(int idFactura_detalle, int cantidad, double subtotal) {
        this.idFactura_detalle = idFactura_detalle;
        this.cantidad = cantidad;
        this.subtotal = subtotal;
    }

    public int getIdFactura_detalle() {
        return idFactura_detalle;
    }

    public void setIdFactura_detalle(int idFactura_detalle) {
        this.idFactura_detalle = idFactura_detalle;
    }

    public int getCantidad() {
        return cantidad;
    }

    public void setCantidad(int cantidad) {
        this.cantidad = cantidad;
    }

    public double getSubtotal() {
        return subtotal;
    }

    public void setSubtotal(double subtotal) {
        this.subtotal = subtotal;
    }

    public Factura getFactura() {
        return factura;
    }

    public void setFactura(Factura factura) {
        this.factura = factura;
    }

    public Libro getLibro() {
        return libro;
    }

    public void setLibro(Libro libro) {
        this.libro = libro;
    }

    @Override
    public String toString() {
        return "Factura_detalle [idFactura_detalle=" + idFactura_detalle + ", cantidad=" + cantidad + ", subtotal="
                + subtotal + ", factura=" + factura + ", libro=" + libro + "]";
    }
}

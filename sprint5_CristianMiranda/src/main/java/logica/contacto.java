/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package logica;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;
import persistencia.*;

/**
 *
 * @author CRISTIANMIRANDA
 */
public class contacto {
    
    private int id;
    private String nombre;
    private int cantidad;
    private float precio;
    private String categoria;

    //Setter
    public void SetId(int id)
    {
        this.id = id;
    }
    public void setNombre(String nombre)
    {
        this.nombre = nombre;
    }
    public void setCantidad(int cantidad)
    {
        this.cantidad = cantidad;
    }
    public void setPrecio(float precio)
    {
        this.precio = precio;
    }
    public void setCategoria(String categoria)
    {
        this.categoria = categoria;
    }
    
    
    //Getter
    public int getId()
    {
        return this.id;
    }
    public String getNombre()
    {
        return this.nombre;
    }
    public int getCantidad()
    {
        return this.cantidad;
    }
    public float getPrecio()
    {
        return this.precio;
    }
    public String getCategoria()
    {
        return this.categoria;
    }
    
    
    public boolean guardarProducto() {
        conexion conexio = new conexion();
        
        String sentencia = "INSERT INTO productos(nombre, cantidad, precio, categoria) "
                + " VALUES ( '" + this.nombre + "','" + this.cantidad + "',"
                + "'" + this.precio + "','" + this.categoria +  "');  ";
        
        if (conexio.setAutoCommitBD(false)) {
            if (conexio.insertarBD(sentencia)) {
                conexio.commitBD();
                conexio.cerrarConexion();
                return true;
            } else {
                conexio.rollbackBD();
                conexio.cerrarConexion();
                return false;
            }
        } else {
            conexio.cerrarConexion();
            return false;
        }
        
    }

    public boolean borrarProducto(int id) {
        String Sentencia = "DELETE FROM `productos` WHERE `id`='" + id + "'";
        conexion conexio = new conexion();
        if (conexio.setAutoCommitBD(false)) {
            if (conexio.actualizarBD(Sentencia)) {
                conexio.commitBD();
                conexio.cerrarConexion();
                return true;
            } else {
                conexio.rollbackBD();
                conexio.cerrarConexion();
                return false;
            }
        } else {
            conexio.cerrarConexion();
            return false;
        }
    }

    public boolean actualizarContacto(int id) {
        conexion conexio = new conexion();
        String Sentencia = "UPDATE `productos` SET nombre='" + this.nombre + "',cantidad='" + this.cantidad + "',precio='" + this.precio
                +"',categoria='" + this.categoria + "' WHERE id=" + id + ";";
        if (conexio.setAutoCommitBD(false)) {
            if (conexio.actualizarBD(Sentencia)) {
                conexio.commitBD();
                conexio.cerrarConexion();
                return true;
            } else {
                conexio.rollbackBD();
                conexio.cerrarConexion();
                return false;
            }
        } else {
            conexio.cerrarConexion();
            return false;
        }
    }

    public List<contacto> listarProducto() throws SQLException {
        conexion conexio = new conexion();
        List<contacto> listaContactos = new ArrayList<>();
        String sql = "select * from productos order by id asc";
        ResultSet rs = conexio.consultarBD(sql);
        contacto c;
        while (rs.next()) {
            c = new contacto();
            c.SetId(rs.getInt("id"));
            c.setNombre(rs.getString("nombre"));
            c.setCantidad(rs.getInt("cantidad"));
            c.setPrecio(rs.getFloat("precio"));
            c.setCategoria(rs.getString("categoria"));
            
            listaContactos.add(c);

        }
        conexio.cerrarConexion();
        return listaContactos;
    }

    public contacto getContacto(int id) throws SQLException {
        conexion conexio = new conexion();
        String sql = "select * from productos where id='" + id + "'";
        ResultSet rs = conexio.consultarBD(sql);
        if (rs.next()) {
            this.id = rs.getInt("id");
            this.nombre = rs.getString("nombre");
            this.cantidad = rs.getInt("cantidad");
            this.precio = rs.getFloat("precio");
            this.categoria = rs.getString("categoria");
            
            conexio.cerrarConexion();
            return this;

        } else {
            conexio.cerrarConexion();
            return null;
        }

    }

    @Override
    public String toString() {
        return "Contacto{" + "id=" + id + ", nombre=" + nombre + ", cantidad=" + cantidad + ", precio=" + precio + ", categoria=" + categoria + '}';
    }
    
    
    
}

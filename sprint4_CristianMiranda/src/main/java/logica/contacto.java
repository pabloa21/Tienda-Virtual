/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package logica;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import persistencia.*;

/**
 *
 * @author CRISTIANMIRANDA
 */
public class contacto {
    private int identificacion;
    private String nombre;
    private String apellido;
    private String genero;
    private String tipoIdentificacion;
    private String telefono;
    private String direccion;
    private String correo;
    
    //Setter
    public void setIdentificacion(int identificacion)
    {
        this.identificacion = identificacion;
    }
    public void setNombre(String nombre)
    {
        this.nombre = nombre;
    }
    public void setApellido(String apellido)
    {
        this.apellido = apellido;
    }
    public void setGenero(String genero)
    {
        this.genero = genero;
    }
    public void setTipoIdentificacion(String tipoIdentificacion)
    {
        this.tipoIdentificacion = tipoIdentificacion;
    }
    public void setTelefono(String telefono)
    {
        this.telefono = telefono;
    }
    public void setDireccion(String direccion)
    {
        this.direccion = direccion;
    }
    public void setCorreo(String correo)
    {
        this.correo = correo;
    }
    
    //Getter
    
     public int getIdentificacion()
    {
        return identificacion;
    }
    public String getNombre()
    {
        return nombre;
    }
    public String getApellido()
    {
        return apellido;
    }
    public String getGenero()
    {
        return genero;
    }
    public String getTipoIdentificacion()
    {
        return tipoIdentificacion;
    }
    public String getTelefono()
    {
        return telefono;
    }
    public String getDireccion()
    {
        return direccion;
    }
    public String getCorreo()
    {
        return correo;
    }
    
    
    public boolean guardarContacto() {
        conexion conexio = new conexion();
        
        String sentencia = "INSERT INTO contactos(identificacion, nombre, apellido, genero, tipoIdentificacion, telefono, direccion, correo) "
                + " VALUES ( '" + this.identificacion + "','" + this.nombre + "',"
                + "'" + this.apellido + "','" + this.genero + "','" + this.tipoIdentificacion + "',"
                + "'" + this.telefono + "','" + this.direccion + "','" + this.correo +  "');  ";
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

    public boolean borrarContacto(int identificacion) {
        String Sentencia = "DELETE FROM `contactos` WHERE `identificacion`='" + identificacion + "'";
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

    public boolean actualizarContacto() {
        conexion conexio = new conexion();
        String Sentencia = "UPDATE `contactos` SET nombre='" + this.nombre + "',apellido='" + this.apellido + "',genero='" + this.genero
                + "',tipoIdentificacion='" + this.tipoIdentificacion + "',telefono='" + this.telefono + "',direccion='" + this.direccion + "',correo='" + this.correo
                +  "' WHERE identificacion=" + this.identificacion + ";";
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

    public List<contacto> listarContactos() throws SQLException {
        conexion conexio = new conexion();
        List<contacto> listaContactos = new ArrayList<>();
        String sql = "select * from contactos order by identificacion asc";
        ResultSet rs = conexio.consultarBD(sql);
        contacto c;
        while (rs.next()) {
            c = new contacto();
            c.setIdentificacion(rs.getInt("identificacion"));
            c.setNombre(rs.getString("nombre"));
            c.setApellido(rs.getString("apellido"));
            c.setGenero(rs.getString("genero"));
            c.setTipoIdentificacion(rs.getString("tipoIdentificacion"));
            c.setTelefono(rs.getString("telefono"));
            c.setDireccion(rs.getString("direccion"));
            c.setCorreo(rs.getString("correo"));
            listaContactos.add(c);

        }
        conexio.cerrarConexion();
        return listaContactos;
    }

    public contacto getContacto() throws SQLException {
        conexion conexio = new conexion();
        String sql = "select * from contactos where identificacion='" + this.identificacion + "'";
        ResultSet rs = conexio.consultarBD(sql);
        if (rs.next()) {
            this.identificacion = rs.getInt("identificacion");
            this.nombre = rs.getString("nombre");
            this.apellido = rs.getString("apellido");
            this.genero = rs.getString("genero");
            this.tipoIdentificacion = rs.getString("tipoIdentificacion");
            this.telefono = rs.getString("telefono");
            this.direccion = rs.getString("direccion");
            this.correo = rs.getString("correo");
            conexio.cerrarConexion();
            return this;

        } else {
            conexio.cerrarConexion();
            return null;
        }

    }

    @Override
    public String toString() {
        return "Contacto{" + "identificacion=" + identificacion + ", nombre=" + nombre + ", apellido=" + apellido + ", genero=" + genero + ", tipoIdentificacion=" + tipoIdentificacion + ", telefono=" + telefono + ", direccion=" + direccion + ", correo=" + correo + '}';
    }
    
    
}

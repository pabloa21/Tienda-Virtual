<%-- 
    Document   : peticiones
    Created on : 4/10/2021, 6:11:41 p. m.
    Author     : CRISTIANMIRANDA
--%>

<%@page import="java.util.logging.Logger"%>
<%@page import="java.util.logging.Level"%>
<%@page import="java.sql.SQLException"%>
<%@page import="logica.contacto"%>
<%@page import="com.google.gson.Gson"%>
<%@page import="java.util.Arrays"%>
<%@page import="java.util.List"%>
<%@page import="java.util.ArrayList"%>
<%@page contentType="application/json;charset=iso-8859-1" language="java" pageEncoding="iso-8859-1" session="true"%>


<%    // Iniciando respuesta JSON.
    contacto c1 = new contacto();
    String respuesta = "{";

    //Lista de procesos o tareas a realizar 
    List<String> tareas = Arrays.asList(new String[]{
        "actualizarProducto",
        "eliminarProducto",
        "listarProducto",
        "guardarProducto"
    });

    String proceso = "" + request.getParameter("proceso");

    // Validación de parámetros utilizados en todos los procesos.
    if (tareas.contains(proceso)) {
        respuesta += "\"ok\": true,";
        // ------------------------------------------------------------------------------------- //
        // -----------------------------------INICIO PROCESOS----------------------------------- //
        // ------------------------------------------------------------------------------------- //
        if (proceso.equals("guardarProducto")) {
            String nombre = request.getParameter("nombre");
            int cantidad = Integer.parseInt(request.getParameter("cantidad"));
            float precio = Float.parseFloat(request.getParameter("precio"));
            String categoria = request.getParameter("categoria");
            
//
            contacto c = new contacto();
            c.setNombre(nombre);
            c.setCantidad(cantidad);
            c.setPrecio(precio);
            c.setCategoria(categoria);
            
            if (c.guardarProducto()) {
//            if (true) {
                respuesta += "\"" + proceso + "\": true";
            } else {
                respuesta += "\"" + proceso + "\": false";
            }
            
            
        } else if (proceso.equals("eliminarProducto")) {
            contacto c = new contacto();
            int id = Integer.parseInt(request.getParameter("id"));
            
            if (c.borrarProducto(id)) {
//            if (true) {
                respuesta += "\"" + proceso + "\": true";
            } else {
                respuesta += "\"" + proceso + "\": false";
            }
            

        } else if (proceso.equals("listarProducto")) {
            
            contacto c = new contacto();
            try {
                List<contacto> lista = c.listarProducto();
                respuesta += "\"" + proceso + "\": true,\"productos\":" + new Gson().toJson(lista);
            } catch (SQLException ex) {
                respuesta += "\"" + proceso + "\": true,\"productos\":[]";
                Logger.getLogger(contacto.class.getName()).log(Level.SEVERE, null, ex);
            }
            
        } else if (proceso.equals("actualizarProducto")) {
            int ident = Integer.parseInt(request.getParameter("identificacion"));
            String nombre = request.getParameter("nombre");
            String apellido = request.getParameter("apellido");
            String genero = request.getParameter("genero");
            String tipoident = request.getParameter("tipoIdentificacion");
            String telefono = request.getParameter("telefono");
            String direccion = request.getParameter("direccion");
            String correo = request.getParameter("correo");
            boolean favorito = Boolean.parseBoolean(request.getParameter("favorito"));
//
            contacto c = new contacto();
            /*c.setIdentificacion(ident);
            c.setNombre(nombre);
            c.setApellido(apellido);
            c.setGenero(genero);
            c.setTipoIdentificacion(tipoident);
            c.setTelefono(telefono);
            c.setDireccion(direccion);
            c.setCorreo(correo);*/
            
            /*
            if (c.actualizarContacto()) {
//            if (true) {
                respuesta += "\"" + proceso + "\": true";
            } else {
                respuesta += "\"" + proceso + "\": false";
            }*/
            
            respuesta += "\"" + proceso + "\": true";
            System.out.println("actualizarcontacto");
        }

        // ------------------------------------------------------------------------------------- //
        // -----------------------------------FIN PROCESOS-------------------------------------- //
        // ------------------------------------------------------------------------------------- //
        // Proceso desconocido.
    } else {
        respuesta += "\"ok\": false,";
        respuesta += "\"error\": \"INVALID\",";
        respuesta += "\"errorMsg\": \"Lo sentimos, los datos que ha enviado,"
                + " son inválidos. Corrijalos y vuelva a intentar por favor.\"";
    }
    // Usuario sin sesión.
    // Responder como objeto JSON codificación ISO 8859-1.
    respuesta += "}";
    System.out.println(respuesta);
    String userDir = System.getProperty("user.dir");
    System.out.println(userDir);
    response.setContentType("application/json;charset=iso-8859-1");
    out.print(respuesta);
%>
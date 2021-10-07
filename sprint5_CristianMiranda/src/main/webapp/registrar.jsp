<%-- 
    Document   : registrar
    Created on : 7/10/2021, 3:44:39 p. m.
    Author     : CRISTIANMIRANDA
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html ng-app = "demoCiclo3">
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta name="viewport" content="width = device-width, initial-scale=1, maximum-scale=1">
        <title>Tienda Virtual</title>
        <!--//Bootstrap core CSS--> 
        <!--<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.0/dist/css/bootstrap.min.css" integrity="sha384-B0vP5xmATw1+K9KRQjQERJvTumQW0nPEzvF6L/Z6nronJ3oUOFUFpCjEUQouq2+l" crossorigin="anonymous">-->
        <!--Angular--> 
        <script src = "https://ajax.googleapis.com/ajax/libs/angularjs/1.2.15/angular.min.js"></script>
        
        <link rel="icon" type="image/png" href="img/cart.png" />
        
        <!-- archivos mision TICS UIS -->
        <script src = "app.js"></script>
        <link rel="stylesheet" href="css/styles.css">
        <link rel="stylesheet" href="css/bootstrap.min.css">
        
    </head>
    <body>
        <header>
            <nav id="header-nav" class="navbar navbar-default">
                    <div class="container">
                            <a href="index.jsp" class="pull-left visible-md visible-lg visible-sm visible-xs">
                        <div id="logo-img"></div>
                    </a>

                    <div class="navbar-brand">
                        <a href="index.jsp"><h1>Tienda Virtual</h1></a>

                        <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#collapsable-nav" aria-expanded="false">
                                <span class="sr-only">Toggle navigation</span>
                                <span class="icon-bar"></span>
                                <span class="icon-bar"></span>
                                <span class="icon-bar"></span>
                            </button>

                    </div>

                    <div id="collapsable-nav" class="collapse navbar-collapse">
                       <ul id="nav-list" class="nav navbar-nav navbar-right">
                        <li>
                          <a href="index.jsp">
                            <span class="glyphicon glyphicon-home"></span><br class="hidden-xs">Inicio</a>
                        </li>
                        <li>
                          <a href="consultar.jsp">
                            <span class="glyphicon glyphicon-eye-open"></span><br class="hidden-xs">consultar</a>
                        </li>

                      </ul><!-- #nav-list -->
                    </div><!-- .collapse .navbar-collapse -->

                    </div>				

            </nav>
    </header>
    
    <div id="main-title" class="text-center">Registrar</div>

        <div id="main-content" class="container" ng-controller="contactosController as cn">
            <div id="home-content" class="row">

                <div class="row">
                    <div class="col-md-6">
                        <label >Nombre</label>
                        <input class="form-control" type="text" ng-model="cn.nombre">
                    </div>
                    <div class="col-md-6">
                        <label>Cantidad</label>
                        <input class="form-control" type="number" min="0" ng-model="cn.cantidad">
                    </div>
                </div>

                <div class="row">
                    <div class="col-md-6">
                        <label>Precio</label>
                        <input class="form-control" type="number" min="0" ng-model="cn.precio">
                    </div>
                    <div class="col-md-6">
                        <label>Categoria</label>
                        <select class="form-control" ng-model="cn.categoria">
                            <option>Aseo</option>
                            <option>Viveres</option>
                        </select>
                    </div>
                </div>

                <div class="row">
                    <div class="col-12">
                        <button  class="btn btn-primary btn-lg btn-block" ng-click="cn.guardarProducto()">Guardar</button>
                    </div>
                </div>

            </div>
            
        </div>
        

    <!--    
        <div class="container-fluid"  ng-controller = "contactosController as cn">
            <div class="row">
                <div class="col-12">
                    <center><h1>rockola</h1></center> 
                </div>
            </div>
            <div class="row">
                <div class="col-6">
                    <h3>Sección 1</h3>
                    <div class="row">
                        <div class="col-6">
                            <label >Nombre</label>
                            <input class="form-control" type="number" min="0" ng-model="cn.identificacion">
                        </div>
                        <div class="col-6">
                            <label>Nombre</label>
                            <input class="form-control" type="text" ng-model="cn.nombre">
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-6">
                            <label>Apellido</label>
                            <input class="form-control" type="text" ng-model="cn.apellido">
                        </div>
                        <div class="col-6">
                            <label>Genero</label>
                            <select class="form-control" ng-model="cn.genero">
                                <option>Masculino</option>
                                <option>Femenino</option>
                            </select>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-6">
                            <label>Tipo identificacion</label>
                            <select class="form-control" ng-model="cn.tipoIdentificacion">
                                <option>CC</option>
                                <option>TI</option>
                            </select>
                        </div>
                        <div class="col-6">
                            <label>Telefono</label>
                            <input class="form-control" type="text" ng-model="cn.telefono">
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-6">
                            <label>Dirección</label>
                            <input class="form-control" type="text" ng-model="cn.direccion">
                        </div>
                        <div class="col-6">
                            <label>Correo</label>
                            <input class="form-control" type="text" ng-model="cn.correo">
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-3">
                            <button  class="btn btn-success" ng-click="cn.guardarContacto()">Guardar</button>
                        </div>
                        <div class="col-3">
                            <button  class="btn btn-primary" ng-click="cn.listarContactos()">Listar contacto</button>
                        </div>
                        <div class="col-3">
                            <button  class="btn btn-danger" ng-click="cn.eliminarContacto()">Eliminar contacto</button>
                        </div>
                        <div class="col-3">
                            <button  class="btn btn-warning" ng-click="cn.actualizarContacto()">Actualizar contacto</button>
                        </div>
                    </div>
                </div>
                <div class="col-6">
                    <h3>Sección 2</h3>
                    <div class="row">
                        <div class="col-6">
                            <label >Identificacion</label>
                            <input class="form-control" type="text" value="{{cn.identificacion}}" disabled="">
                        </div>
                        <div class="col-6">
                            <label>Nombre</label>
                            <input class="form-control" type="text" value="{{cn.nombre}}" disabled="">
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-6">
                            <label>Apellido</label>
                            <input class="form-control" type="text" value="{{cn.apellido}}" disabled="">
                        </div>
                        <div class="col-6">
                            <label>Genero</label>
                            <input class="form-control" type="text" value="{{cn.genero}}" disabled="">
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-6">
                            <label>Tipo identificacion</label>
                            <input class="form-control" type="text" value="{{cn.tipoIdentificacion}}" disabled="">
                        </div>
                        <div class="col-6">
                            <label>Telefono</label>
                            <input class="form-control" type="text" value="{{cn.telefono}}" disabled="">
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-6">
                            <label>Dirección</label>
                            <input class="form-control" type="text" value="{{cn.direccion}}" disabled="">
                        </div>
                        <div class="col-6">
                            <label>Correo</label>
                            <input class="form-control" type="text" value="{{cn.correo}}" disabled="">
                        </div>
                    </div>
                </div>
            </div>
            <div class="row" >
                <div class="col-12 table-responsive-xl">
                    <h3>Sección 3</h3>
                    <table class="table table-striped table-hover">  
                        <thead class="thead-dark">
                            <tr>  
                                <th>Id</th>  
                                <th>Nombre</th>  
                                <th>Apellido</th>  
                                <th>Genero</th>  
                                <th>Tipo id</th>  
                                <th>Telefono</th>  
                                <th>Direccion</th>  
                                <th>Correo</th>  
                            </tr>  
                        </thead>

                        <tr ng-repeat = "contacto in cn.contactos">  
                            <td>{{ contacto.identificacion}}</td>  
                            <td>{{ contacto.nombre}}</td>  
                            <td>{{ contacto.apellido}}</td>  
                            <td>{{ contacto.genero}}</td>  
                            <td>{{ contacto.tipoIdentificacion}}</td>  
                            <td>{{ contacto.telefono}}</td>  
                            <td>{{ contacto.direccion}}</td>  
                            <td>{{ contacto.correo}}</td>  
                        </tr>  
                    </table> 
                </div>
            </div>
        </div>
    
    -->
        <script src="js/jquery-1.11.3.min.js"></script>
	<script src="js/bootstrap.min.js"></script>
        
    </body>
</html>

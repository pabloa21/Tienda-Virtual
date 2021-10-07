<%-- 
    Document   : consultar
    Created on : 7/10/2021, 3:38:54 p. m.
    Author     : CRISTIANMIRANDA
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="es" ng-app = "demoCiclo3">
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
                        <a href="index.jsp" class="pull-left visible-md visible-lg">
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
                      <a href="registrar.jsp">
                        <span class="glyphicon glyphicon-floppy-save"></span><br class="hidden-xs">Registrar</a>
                    </li>

                  </ul><!-- #nav-list -->
                </div><!-- .collapse .navbar-collapse -->


                </div>				

            </nav>
        </header>

        <div id="main-title" class="text-center">Consultar</div>

        <div id="main-content" class="container" ng-controller="contactosController as cn">
            
            <div id="home-content" class="row">
                <div class="col-12">
                    
                    <table class="table table-striped table-hover">  
                        <thead class="thead-dark">
                            <tr>  
                                <th>Nombre</th>  
                                <th>Cantidad</th>  
                                <th>Precio</th>  
                                <th>Categoria</th>  
                            </tr>  
                        </thead>

                        <tr ng-repeat = "productos in cn.productos">  
                            <td>{{ productos.nombre}}</td>  
                            <td>{{ productos.cantidad}}</td>  
                            <td>{{ productos.precio}}</td>  
                            <td>{{ productos.categoria}}</td>  
                        </tr>  
                    </table> 
                    
                </div>

            </div>
            
            <div class="row">
                    <div class="col-12">
                        <button  class="btn btn-primary btn-lg btn-block" ng-click="cn.listarProducto()">Listar Productos</button>
                    </div>
                </div>
            
            
            
            
        </div>

            <!-- jQuery (Bootstrap JS plugins depend on it) -->
      <script src="js/jquery-1.11.3.min.js"></script>
      <script src="js/bootstrap.min.js"></script>
      
    </body>

</html>
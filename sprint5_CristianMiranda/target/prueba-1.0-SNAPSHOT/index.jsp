<%-- 
    Document   : index
    Created on : 4/10/2021, 6:11:20 p. m.
    Author     : CRISTIANMIRANDA
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="es">
	<head>
		<title>Tienda Virtual</title>
		<meta charset="utf-8" >
		<meta name="viewport" content="width = device-width, initial-scale=1, maximum-scale=1">
		<link rel="icon" type="image/png" href="img/cart.png" />
		<link rel="stylesheet" href="css/bootstrap.min.css">
    	<link rel="stylesheet" href="css/styles.css">
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
			              <a href="registrar.jsp">
			                <span class="glyphicon glyphicon-floppy-save"></span><br class="hidden-xs">Registrar</a>
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

		<div id="main-title" class="text-center">Bienvenidos a tu tienda Virtual</div>

		<div id="main-content" class="container">
			<div id="home-content" class="row">
				
				<div class="col-md-6 col-sm-6 col-xs-12 text-center">

					<a href="registrar.jsp" class="btn btn-primary btn-lg active btn-block" role="button" aria-pressed="true">Registrar</a>

				</div>

				<div class="col-md-6 col-sm-6 col-xs-12 text-center">

					<a href="consultar.jsp" class="btn btn-primary btn-lg active btn-block" role="button" aria-pressed="true">Consultar</a>

				</div>

			</div>
		</div>

		<!-- jQuery (Bootstrap JS plugins depend on it) -->
	  <script src="js/jquery-1.11.3.min.js"></script>
	  <script src="js/bootstrap.min.js"></script>
	  <script src="js/script.js"></script>

	</body>

</html>

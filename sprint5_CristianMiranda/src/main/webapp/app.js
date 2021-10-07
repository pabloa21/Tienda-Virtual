/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

(function(){
'use strict';

var app = angular.module('demoCiclo3', []);
app.controller('contactosController', ['$http', controladorContactos]);
function controladorContactos($http) {
    var cn = this;
    
    cn.nombre="";
    cn.cantidad = "";
    cn.precio="";
    cn.categoria="";
    
    cn.listarProducto = function () {
        var url = "peticiones.jsp";
        var params = {
            proceso: "listarProducto"
        };
        $http({
            method: 'POST',
            url: 'peticiones.jsp',
            params: params
        }).then(function (res) {
            cn.productos = res.data.productos;
        });
    };

    cn.guardarProducto = function () {
        if (validar('todos')) {
            var contacto = {
                proceso: "guardarProducto",
                nombre: cn.nombre,
                cantidad: cn.cantidad,
                precio: cn.precio,
                categoria: cn.categoria
            };
            $http({
                method: 'POST',
                url: 'peticiones.jsp',
                params: contacto
            }).then(function (res) {
                if (res.data.ok === true) {
                    if (res.data[contacto.proceso] === true) {
                        alert("Guardado con éxito");
                        cn.nombre = "";
                        cn.cantidad="";
                        cn.precio="";
                        cn.categoria="";
//                                                            cn.listarContactos();
                    } else {
                        alert("Por favor vefifique sus datos");
                    }
                } else {
                    alert(res.data.errorMsg);
                }
            });
        }
    };
    cn.eliminarProducto = function () {
        if (validar('soloId')) {
            var contacto = {
                proceso: "eliminarProducto",
                identificacion: cn.id
            };
            $http({
                method: 'POST',
                url: 'peticiones.jsp',
                params: contacto
            }).then(function (res) {
                if (res.data.ok === true) {
                    if (res.data[contacto.proceso] === true) {
                        alert("Eliminado con éxito");
                        //                                cn.listarContactos();
                    } else {
                        alert("Por favor vefifique sus datos");
                    }
                } else {
                    alert(res.data.errorMsg);
                }
            });
        }
    };
    cn.actualizarContacto = function () {
        if (validar('todos')) {
            var contacto = {
                proceso: "actualizarProducto",
                id: cn.id,
                nombre: cn.nombre,
                cantidad: cn.cantidad,
                precio: cn.precio,
                categoria: cn.categoria
            };
            $http({
                method: 'POST',
                url: 'peticiones.jsp',
                params: contacto
            }).then(function (res) {
                if (res.data.ok === true) {
                    if (res.data[contacto.proceso] === true) {
                        alert("actualizarcontacto con éxito");
                        //                                cn.listarContactos();
                    } else {
                        alert("Por favor vefifique sus datos");
                    }
                } else {
                    alert(res.data.errorMsg);
                }
            });
        }
    };
    var validar = function (tipoValidacion) {
        var vNombre = cn.nombre ? true : false;
        var vCantidad = cn.cantidad ? true : false;
        var vPrecio = cn.precio ? true : false;
        var vCategoria = cn.categoria ? true : false;

        if (tipoValidacion === 'soloNombre') {
            if (!vNombre) {
                alert('Valide el campo nombre');
                return false;
            } else {
                return true;
            }
        } else if (tipoValidacion === 'todos') {
            if (!vNombre) {
                alert('Valide el campo nombre');
                return false;
            } else if (!vCantidad) {
                alert('Valide el campo Cantidad');
                return false;
            } else if (!vPrecio) {
                alert('Valide el campo Precio');
                return false;
            } else if (!vCategoria) {
                alert('Valide el campo categoria');
                return false;
            } else {
                return true;
            }
        }
    };
}

    
})();



<%@page import="dto.usuarioDTO"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
     <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Almacen</title>
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
        <link href="https://fonts.googleapis.com/css?family=Varela+Round&display=swap" rel="stylesheet">
        <link href="https://fonts.googleapis.com/css?family=Lobster+Two&display=swap" rel="stylesheet">
        <link rel="stylesheet" type="text/css" href="/portafolio/css/configuracion.css"/>
        <script defer src="../js/all.js"></script> <!--load all styles -->
        <link href="https://fonts.googleapis.com/css?family=Poppins&display=swap" rel="stylesheet">
     </head>
        <%@ include file="/masterpage/menuadmin.jsp" %>
     <div class="col" id="main">
           <div class="mt-5 card w-100">
                <div class="card-body p-5">
                      <label class="card-title loginFontTitle text-center">Bienvenido <%= usuario.getNombre()%> !</label>
                        <div class="card-text">
                            <p class="textoExplicativo">
                                Esta es la interfaz de configuracion y gestion del Almacen Yuyita.
                            </p>
                            <hr>
                            <p class="textoExplicativo mt-4">
                               <strong class="text-primary">Productos:</strong>
                            </p>
                             <p class="textoExplicativo mt-2 pl-5">
                                    Categorias:
                             </p>
                             <p class="textoExplicativoSub mt-2 pl-5 ml-5">
                               <i class="fas fa-angle-double-right text-info"></i> CRUD para la categoria del producto.<br>                                 
                             </p>
                              <p class="textoExplicativo mt-2 pl-5">
                                   Productos:
                             </p>
                             <p class="textoExplicativoSub mt-2 pl-5 ml-5">
                               <i class="fas fa-angle-double-right text-info"></i> CRUD para los productos que necesite agregar manualmente. <br>                                 
                             </p>
                             <hr>
                             <p class="textoExplicativo mt-4">
                                 <STRONG class="text-primary">Clientes</STRONG>:
                            </p>
                             <p class="textoExplicativo mt-2 pl-5">
                                    Ficha Clientes:
                             </p>
                             <p class="textoExplicativoSub mt-2 pl-5 ml-5">
                               <i class="fas fa-angle-double-right text-info"></i> Datos del cliente, historial fiados realizados y compras directas.<br>                                 
                             </p>
                              <p class="textoExplicativo mt-2 pl-5">
                                   Registrar Venta:
                             </p>
                             <p class="textoExplicativoSub mt-2 pl-5 ml-5">
                               <i class="fas fa-angle-double-right text-info"></i> Registra una venta para nuevos y antiguos clientes en base a su rut. <br>                                
                             </p>
                              <p class="textoExplicativo mt-2 pl-5">
                                   Admin Fiados:
                             </p>
                             <p class="textoExplicativoSub mt-2 pl-5 ml-5">
                               <i class="fas fa-angle-double-right text-info"></i> Seccion en donde se aceptan, rechazan o se dejan pendientes los fiados de toda la app. <br>                                
                             </p>
                              <hr>
                             <p class="textoExplicativo mt-4">
                                 <STRONG class="text-primary">Proveedores</STRONG>:
                            </p>
                             <p class="textoExplicativo mt-2 pl-5">
                                    Modulo Proveedor:
                             </p>
                             <p class="textoExplicativoSub mt-2 pl-5 ml-5">
                               <i class="fas fa-angle-double-right text-info"></i> CRUD para los proveedores que necesite agregar manualmente.<br>                                 
                             </p>
                              <p class="textoExplicativo mt-2 pl-5">
                                   Ordenar pedido:
                             </p>
                             <p class="textoExplicativoSub mt-2 pl-5 ml-5">
                               <i class="fas fa-angle-double-right text-info"></i> Registra una orden al proveedor, esta es la principal opcion para rellenar stock de productos.<br>                                
                             </p>
                              <p class="textoExplicativo mt-2 pl-5">
                                   Recepcion:
                             </p>
                             <p class="textoExplicativoSub mt-2 pl-5 ml-5">
                               <i class="fas fa-angle-double-right text-info"></i> Seccion en donde se gestionara la orden del pedido. <br>                                
                             </p>
                              <hr>
                             <p class="textoExplicativo mt-4">
                                <STRONG class="text-primary">Informe y Estadisticas</STRONG>:
                            </p>
                             <p class="textoExplicativo mt-2 pl-5">
                                    Informes:
                             </p>
                             <p class="textoExplicativoSub mt-2 pl-5 ml-5">
                               <i class="fas fa-angle-double-right text-info"></i> Descargar toda clase de informacion necesaria en formato PDF y excel.<br>                                 
                             </p>
                              <p class="textoExplicativo mt-2 pl-5">
                                   Estadisticas:
                             </p>
                             <p class="textoExplicativoSub mt-2 pl-5 ml-5">
                               <i class="fas fa-angle-double-right text-info"></i> Toda clase de estadisticas que se han dado durante el uso de la app<br>                                
                             </p>
                             
                        </div>
                        
            </div>
            </div>
    </div>
</div>
       </body>
    
</html>

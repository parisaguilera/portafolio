<%@page contentType="text/html" pageEncoding="UTF-8"%>
<jsp:useBean id="estadisticas" class="daoimp.estadisticasDAOIMP"/> 
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
        <c:if test="${mensaje!=null}">
            <script>
                alert("${mensaje}");
            </script> 
        </c:if>
        <%
            String admin= "Admin";
            String empleado="Empleado";
                 // estado 3 = pago sin fiado
                 // estado 2 = PENDIENTE
                 // estado 1 = aceptado
                 // estado 0 = rechazado
            %>
            <c:set var="admin" value="<%= admin %>" />
            <c:set var="empleado" value="<%= empleado %>" />
        <c:set var="cantProductos" value="${estadisticas.cantidadProductos()}" />
        <c:set var="cantCategorias" value="${estadisticas.cantidadCategorias()}" />
        <c:set var="cantClientes" value="${estadisticas.cantidadClientes()}" />
        <c:set var="cantFiaAceptados" value="${estadisticas.cantidadFiados(1)}" />
        <c:set var="cantFiaRechazados" value="${estadisticas.cantidadFiados(0)}" />
        <c:set var="cantFiaPendientes" value="${estadisticas.cantidadFiados(2)}" />
        <c:set var="cantProveedores" value="${estadisticas.cantidadProveedores()}" />
        <c:set var="cantOrdenes" value="${estadisticas.cantidadOrdenes()}" />
        <c:set var="cantVentas" value="${estadisticas.cantidadFiados(3)}" />
        <c:set var="cantUserAdmin" value="${estadisticas.cantidadUsuarios(admin)}" />
        <c:set var="cantUserEmpleado" value="${estadisticas.cantidadUsuarios(empleado)}" />
        
     <div class="col">
           <div class="mt-5 card w-100">
                <div class="card-body p-5">
                      <label class="card-title loginFontTitle text-center">Estadisticas</label>
                        <div class="card-text">
                            <p class="textoExplicativo">
                               Estadisticas de toda la app.
                            </p>
                              <hr>
                              <div class="row redaccion">
                               
                                  <div class="col-4">     
                                 <p class="textoEstadisticas"><strong class="text-info">Cantidad de Productos:</strong></p>
                                  </div>
                                  <div class="col-8">
                             <p class="textoEstadisticasCantidad">${cantProductos}</p>
                             
                                  </div>
                                  
                                 
                              </div>
                               <hr>
                               
                              <div class="row redaccion">
                               
                                  <div class="col-4">     
                                 <p class="textoEstadisticas"><strong class="text-info">Cantidad de Categorias:</strong></p>
                                  </div>
                                  <div class="col-8">
                             <p class="textoEstadisticasCantidad">${cantCategorias}</p>
                             
                                  </div>
                                  
                                 
                              </div>
                               <hr>
                              
                              <div class="row redaccion">
                               
                                  <div class="col-4">     
                                 <p class="textoEstadisticas"><strong class="text-info">Cantidad de Clientes:</strong></p>
                                  </div>
                                  <div class="col-8">
                             <p class="textoEstadisticasCantidad">${cantClientes}</p>
                             
                                  </div>
                                  
                                 
                              </div>
                               <hr>
                            
                              <div class="row redaccion">
                               
                                  <div class="col-4">     
                                 <p class="textoEstadisticas"><strong class="text-info">Cantidad de Fiados:</strong></p>
                                  </div>
                                  <div class="col-8">
                             <p class="textoEstadisticasCantidad">Aceptados: ${cantFiaAceptados}</p>
                             <p class="textoEstadisticasCantidad">Rechazados: ${cantFiaRechazados}</p>
                             <p class="textoEstadisticasCantidad">Pendientes: ${cantFiaPendientes}</p>
                             
                                  </div>
                                  
                                 
                              </div>
                               <hr>
                           
                              <div class="row redaccion">
                               
                                  <div class="col-4">     
                                 <p class="textoEstadisticas"><strong class="text-info">Cantidad de Proveedores:</strong></p>
                                  </div>
                                  <div class="col-8">
                             <p class="textoEstadisticasCantidad">${cantProveedores}</p>
                             
                                  </div>
                                  
                                 
                              </div>
                               <hr>
                              <div class="row redaccion">
                               
                                  <div class="col-4">     
                                 <p class="textoEstadisticas"><strong class="text-info">Cantidad de Ordenes:</strong></p>
                                  </div>
                                  <div class="col-8">
                             <p class="textoEstadisticasCantidad">${cantOrdenes}</p>
                             
                                  </div>
                                  
                                 
                              </div>
                               <hr>
                              <div class="row redaccion">
                               
                                  <div class="col-4">     
                                 <p class="textoEstadisticas"><strong class="text-info">Cantidad de Ventas Directas:</strong></p>
                                  </div>
                                  <div class="col-8">
                             <p class="textoEstadisticasCantidad">${cantVentas}</p>
                             
                                  </div>
                                  
                                 
                              </div>
                               <hr>
                              <div class="row redaccion">
                               
                                  <div class="col-4">     
                                 <p class="textoEstadisticas"><strong class="text-info">Cantidad de Usuarios:</strong></p>
                                  </div>
                                  <div class="col-8">
                             <p class="textoEstadisticasCantidad">Admin: ${cantUserAdmin}</p>
                             <p class="textoEstadisticasCantidad">Empleado: ${cantUserEmpleado}</p>
                                  </div>
                                  
                                 
                              </div>
                               <hr>
                              
                        </div>
                       
            </div>
            </div>
    </div>
</div>
       </body>
    <script>

            function redireccion(){
    
             $(".loader").fadeIn("slow");
             
            }
            
       </script>

</html>
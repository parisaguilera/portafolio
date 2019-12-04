
<%@page import="dto.productoDTO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="daoimp.productoDAOIMP"%>
<%@page import="daoimp.clienteDAOIMP"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/2.2.4/jquery.min.js"></script>
<jsp:useBean id="nomcat1" class="daoimp.familiaProductoDAOIMP"/>
<jsp:useBean id="productoIMP" class="daoimp.productoDAOIMP"/>  
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
         <link rel="stylesheet" type="text/css" href="/portafolio/css/productos.css"/>


     </head>
         <%     
             HttpSession sesion = request.getSession();
             

              ArrayList<Object[]> lista = (ArrayList<Object[]>) sesion.getAttribute("carrito");
             
             
                 
                 String rut = request.getParameter("rut");
                 
                 clienteDAOIMP cli = new clienteDAOIMP();
                 

          %>
           
          <c:set var="existe" value="<%= cli.existeRut(rut) %>" />
          <c:set var="cliente" value="<%= cli.clienteFicha(rut) %>" />
          <c:set var="productos" value="${productoIMP.listarTodos()}" />
          <c:set var="carrito" value="<%= lista %>" />
          <c:set var="nombreNuevo" scope="request" value="${nombreNuevo}" />
          <c:set var="contactoNuevo" scope="request" value="${contactoNuevo}" />
          <script>
           $(".loader").fadeOut("slow");
           </script>

 <%@ include file="/masterpage/menuadmin.jsp" %>                             
        <c:if test="${mensaje!=null}">
            <script>
                alert("${mensaje}");
            </script> 
        </c:if>
     <div class="col">
           <div class="mt-5 card w-100">
                <div class="card-body p-5">
                      <label class="card-title loginFontTitle text-center">Registar Venta</label>
                        <div class="card-text">
                            <div class="card-text row">
                                <p class="col tooltips">* Clientes nuevos se deberan registrar</p>
                            </div>
                                <div class="card-text row">
                                <p class="col tooltips">* Los productos que no sean legibles deben ser ingresados manualmente</p>
                                </div>
                            <hr>
                              
                        </div>
                         <div class="card-text row text-center">
                             
                                    <div class="col-4 text-right">
                                       <label class="card-title loginFontTitle">Ingresar Rut:</label>
                                    </div>
                                    <div class="col-4">
                                        <input class="form-control" id="rut" type="text" value="<%= rut %>" name="rut" maxlength="8" minlength="8" disabled>
                                        <p class="col tooltips">* Solamente los primeros 8 numeros sin guion</p>
                                    </div>
                                    <div class="col-4 text-left mt-1">
                                           <input type="submit" value="Vender" class="btn-primary rounded-pill font-12" disabled>
                                    </div>
                           
                            </div>
                      <div class="card-text row text-center">
                             <div class="loader" id="loader" style="display:none;"></div>
                                    <div class="container-fluid" id="existeCliente">
                                        
            <!-- PRIMER DIV EN DONDE CONFIRMO SI EXISTE EL RUT -->
                                            <c:choose>
                                            <c:when test="${existe==false}">
                                                <div class="card-text text-center row">
                                <p class="col tooltips text-danger">* El RUT ingresado es NUEVO en la plataforma, rellena los datos</p>
                                                </div>
                                                         <div class="row mt-5">
                                                        <div class="col-sm-0 text-right">
                                                          <label class="card-title loginFontTitle">Nombre:</label>
                                                       </div>
                                                       <div class="col">
                                                           <input class="form-control" id="clienteNombre" value="${nombreNuevo}" type="text" minlength="8" required>
                                                       </div> 
                                                       <div class="col-sm-0 text-right">

                                                          <label class="card-title loginFontTitle">Contacto:</label>
                                                       </div>
                                                       <div class="col">
                                                           <input class="form-control" id="clienteContacto" value="${contactoNuevo}" type="text" minlength="8" maxlength="8" required>
                                                            <p class="col tooltips">* Formato : xxxxxxxx (8 digitos)</p>
                                                       </div>   
                                                        </div>
                                                         <hr>
                                            </c:when>
                                            <c:otherwise>
                                                                          
                                                <div class="row mt-5">
                                                               <div class="col-sm-0 text-right">
                                                                 <label class="card-title loginFontTitle">Nombre:</label>
                                                              </div>
                                                              <div class="col">
                                                                  <input class="form-control" type="text" value="${cliente.getNombre()}" disabled>
                                                              </div> 
                                                              <div class="col-sm-0 text-right">

                                                                 <label class="card-title loginFontTitle">Contacto:</label>
                                                              </div>
                                                              <div class="col">
                                                                  <input class="form-control" type="text" value="${cliente.getContacto()}" disabled>
                                                                   <p class="col tooltips">* Formato : xxxxxxxx (8 digitos)</p>
                                                              </div>   
                                                </div>
                                                 <hr>
                                            </c:otherwise>
                                        </c:choose>
                           
                       <div class="text-center">
                       <label class="loginFontTitle text-info">Registrando Venta</label>
                       </div>
                                                 <form method="POST" action="/portafolio/carro">
                                  <div class="card-text row text-center mt-3">
                                      
                                    <div class="col-4 text-right">
                                        <label class="modalFont text-info">Producto:</label>
                                    </div>
                                      
                                    <div class="col-4">
                                        <input class="form-control" id="productosInput" name="selProducto" list="productos">
                                          <datalist id="productos">
                                        <c:forEach var="productos" items="${productos}">
                                            <c:set var="idfamiliaPRO" value="${productos.getIdproducto()}" />
                                            <c:set var="productosCategoria" value="${productoIMP.idtonombre(idfamiliaPRO)}" />
                                <option id="${idfamiliaPRO}" value="${productos.getNombre()}">${productos.getMarca()} | ${productos.getCodigobarra()} | ${productosCategoria}</option>

                                            </c:forEach>
                                        </datalist>

                                        <p class="col tooltips">* Puedes ingresar manualmente cualquier tipo de producto</p>
                                    </div>
                                   
                                    <div class="col-4 text-left mt-1">
                                        <input type="hidden" value="<%= rut %>" name="rut">
                                        <c:if test="${existe==false}">
                                          <input id="nom" name="nombreCliente" type="hidden" value="" >
                                          <input id="con" name="contactoCliente" type="hidden" value="" >
                                        </c:if>
                                        <input name="idPro" type="hidden" value="" id="idproducto" >
                                        <input type="submit" name="agregarProducto" value="Agregar" class="btn-success rounded-pill font-12" onclick="cliente()">
                                       
                                    </div>
                                     
                            </div>
                                                       </form>    
            <c:if test="${carrito.size()!=0}">
                <form method="POST" action="/portafolio/carro">
                         <div class="row mt-5">
                        <fieldset class="border p-2 col-12 text-center sinLados">
                        <legend  class="w-auto modalFont">Carro</legend>
                           <table class="table table-bordered">
                                
                                <thead>
                                    <tr>
                                        <th class="headTableText">Nombre Producto</th>
                                        <th class="headTableText">Categoria</th>
                                        <th class="headTableText">Stock</th>
                                        <th class="headTableText">Cantidad</th>  
                                        <th class="headTableText">Precio Unitario</th>
                                        <th class="headTableText">Precio Total</th>
                                    </tr>
                                </thead>
                                </thead>
                                <tbody>
                                    
                                   <c:set var="total" value="${0}"/>
                                     <c:forEach var="carro" items="${carrito}">
                                         
                                         <c:set var="idfamiliaPROCarrito" value="${carro.getIdproducto()}" />
                                            <c:set var="productosCategoriaCarrito" value="${productoIMP.idtonombre(idfamiliaPROCarrito)}" />
                                            <tr class="redaccion">
                                            <td class="bodyTableText">${carro.getNombre()} - ${carro.getMarca()} ® - ${carro.getCodigobarra()}</td>
                                            <td class="bodyTableText">${productosCategoriaCarrito}</td>
                                            <td class="bodyTableText">${carro.getStock()}</td>
                                            <td class="bodyTableText"> <input type="number" name="numCan" class="cantidad" value="1" min="1" max="${carro.getStock()}"></td> 
                                            <td class="bodyTableText">$ ${carro.getPrecioventa()}</td>
                                            <td class="bodyTableText">$ ${carro.getPrecioventa()}</td> 
                                           <c:set var="total" value="${total + carro.getPrecioventa()}" />
                                           
                                            
                                        </tr>
                                        
                                         </c:forEach>
                                        <tr class="redaccion">
                                            <td colspan="4"></td>
                                            <td class="headTableText">TOTAL:</td> 
                                            <td class="headTableText">$ ${total}</td>
                                        </tr>
                                       
                                                    </tbody>
                                                </table>
                                            </fieldset>

                                          </div>

                                    <div class="row mt-5">
                                        <div class="col text-right">
                                                    <input type="hidden" value="<%= rut %>" name="rut">
                                                    <input name="totalCarro" type="hidden" value="${total}" >
                                                     <c:if test="${existe==false}">
                                                        <input id="nomVenta" name="nombreCliente" type="hidden" value="" >
                                                        <input id="conVenta" name="contactoCliente" type="hidden" value="" >
                                                      </c:if>
                                                        <div class="label">
                                                    <label class="mr-5 opcionFiado">¿Quiere optar por FIADO?   <input class="ml-3 form-check-input" type="checkbox" name="checkFiado" value="0"></label>
                                                        </div>
                                          </div>
                                         <div class="col-3">
                                                    <input type="submit" name="finalizarVenta" value="Registrar Venta" class="btn-success rounded-pill finalizarVenta" onclick="cliente()">
                                        </div>
                                    </div>
                                 
                                 
                </form>
                </c:if>            
                                        
                                    

       
            </div>
        
    </div>
</div>
</div>
       </body>
       <script>
           
           $(function() {
                $('#productosInput').on('input',function() {
                  var opt = $('option[value="'+$(this).val()+'"]');
                   
                   var final = opt.length ? opt.attr('id') : '0';
                   $("#idproducto").val(final);
                  console.log(opt.length ? opt.attr('id') : '0');
                 
                });
              });
              
            function cliente(){
               var nombre = document.getElementById("clienteNombre").value;
               var contacto = document.getElementById("clienteContacto").value;
               $("#nom").val(nombre);
               $("#con").val(contacto);
               $("#nomVenta").val(nombre);
               $("#conVenta").val(contacto);
             
           }
       </script>

</html>
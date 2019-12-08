<%@page import="daoimp.proveedorDAOIMP"%>
<%@page import="java.util.ArrayList"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<jsp:useBean id="prod" class="daoimp.productosPedidoDAOIMP"/>


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
 <%@ include file="/masterpage/menuadmin.jsp" %>  
  <%     
      HttpSession sesion = request.getSession();
      
      ArrayList<Object[]> listaOrden = (ArrayList<Object[]>) sesion.getAttribute("listaOrden");

                              String nombreProveedor = request.getParameter("selOrden");
                              int idProveedor = Integer.parseInt(request.getParameter("idProv"));
              
                 proveedorDAOIMP proveedor = new proveedorDAOIMP();
                 
                 String rubro = proveedor.idtorubro(idProveedor);
                 
                int i =0;

          %>
        <c:if test="${mensaje!=null}">
            <script>
                alert("${mensaje}");
            </script> 
        </c:if>
             <c:set var="nombreProv" value="<%= nombreProveedor %>" />
            <c:set var="rubro" value="<%= rubro %>" />
            <c:set var="familia" value="${prod.sacarFamilia(rubro)}" />
            <c:set var="productos" value="${prod.listarCategoria(familia)}" />
            <c:set var="listaOrden" value="<%= listaOrden %>" />
     <div class="col">
           <div class="mt-5 card w-100">
                <div class="card-body p-5">
                      <label class="card-title loginFontTitle text-center">Ordenar Pedido</label>
                        <div class="card-text">
                            <div class="card-text row">
                                <p class="col tooltips">* Ordenes por proveedor, esto quiere decir que solo podras ordenar los productos que ofrezca el proveedor.</p>
                            </div>
                            <hr>
                              
                        </div>
                      <form action="/portafolio/paginas/admin/orden.jsp" method="GET">
                         <div class="card-text row text-center">
                                    <div class="col-4 text-right">
                                       <label class="card-title loginFontTitle">Elegir Proveedor:</label>
                                    </div>
                                    <div class="col-4">
                                        
                                        <input class="form-control" id="ordenInput" value="<%=nombreProveedor %>" name="<%=nombreProveedor %>" list="orden" disabled>

                                        <p class="col tooltips text-info">* Codigo barra se genera automaticamente al agregar producto</p>
                                        
                                    </div>
                                    <div class="col-4 text-left mt-1">
                                           <input type="submit" value="Seleccionar" class="btn-primary rounded-pill font-12 mt-2" disabled>
                                    </div>
                           
                            </div>
                        </form>
                 
                             <div class="loader" id="loader" style="display:none;"></div>
                             
                             <div class="row mt-5">
                                
                                 <div class="col-6">
                                      <fieldset class="border p-0 col-12 text-center sinLados">
                                        <legend  class="w-auto modalFont">${rubro}</legend>
                                <c:choose>
                                     <c:when test="${productos.size()==0}">
                                         <h1  class="modalFont mt-5 mb-5"> Proveedor Sin productos</h1>
                                      </c:when>
                               <c:otherwise>                                
                                 <table class="table table-bordered mb-5">
                                
                                <thead>
                                    <tr>
                                        <th class="headTableText">Nombre</th>
                                        <th class="headTableText">Marca</th>
                                        <th class="headTableText">Descripcion</th>
                                        <th class="headTableText">Cantidad</th>
                                        <th class="headTableText">Total</th>
                                         <th class="headTableText">Accion</th>
                                    </tr>
                                </thead>
                                </thead>
                                <tbody>
                                    <c:forEach var="pro" items="${productos}">

                                         <tr class="redaccion">
                                            <td class="bodyTableText">${pro.getNombre()}</td>
                                            <td class="bodyTableText">${pro.getMarca()}</td> 
                                            <td class="bodyTableText">${pro.getDescripcion()}</td> 
                                            <td class="bodyTableText">${pro.getCantidad()} ${prod.sacarMedida(pro.getIdfamilia())}</td>
                                            <td class="bodyTableText">$${pro.getTotalcompra()}</td>
                                            <td>
                                                <form method="POST" action="/portafolio/ordenPedido">
                                                    
                                                    <input type="hidden" name="selOrden" value="${nombreProv}">
                                                    <input type="hidden" name="rubro" value="${rubro}">
                                                    <input type="hidden" name="idproducto" value="${pro.getIdproductospedido()}">
                                                    <input type="hidden" name="idProv" value="<%= idProveedor %>">
                                                    
                                                    <c:set var="agregado" value="${false}" />
                                                    <c:forEach var="proOrden" items="${listaOrden}">
                                                                            <c:if test="${pro.getIdproductospedido()==proOrden.getIdproductospedido()}">
                                                                                 <c:set var="agregado" value="${true}" />
                                                                            </c:if>
                                                    </c:forEach>
                                                      <c:choose>
                                                                <c:when test="${agregado==true}">
                                                                    <input type="submit" value="En Canasta" class="btn-info rounded-pill fontBotonOrden" disabled>  
                                                                </c:when>
                                                                <c:otherwise>
                                                                    <input type="submit" name="agregarProducto" value="Agregar" class="btn-success rounded-pill fontBotonOrden">
                                                                </c:otherwise>
                                                     </c:choose>
                                                </form>
                                            </td>
                                        </tr>
                                                

                                    </c:forEach>
                                </tbody>
                            </table>
                               </c:otherwise>
                       </c:choose>
                                      </fieldset>
                                 </div>
                                 <div class="col-6">
                                      <fieldset class="border p-0 col-12 text-center sinLados">
                                        <legend  class="w-auto modalFont">Canasta a Ordenar:</legend>
                                          <c:choose>
                                            <c:when test="${listaOrden.size()==0}">
                                                 <h1  class="modalFont mt-5 mb-5"> Canasta Vacia</h1>
                                            </c:when>
                                            <c:otherwise>
                                        
                                       <table class="table table-bordered mb-5">
                                
                                <thead>
                                    <tr>
                                        <th class="headTableText">Nombre</th>
                                        <th class="headTableText">Marca</th>
                                        <th class="headTableText">Descripcion</th>
                                        <th class="headTableText">Cantidad</th>
                                        <th class="headTableText">Total</th>
                                        <th class="headTableText">Accion</th>
                                    </tr>
                                </thead>
                                </thead>
                                <tbody>
                                       <c:set var="total" value="${0}"/>
                                    <c:forEach var="pro" items="${listaOrden}">
                                        <tr class="redaccion">
                                            <td class="bodyTableText">${pro.getNombre()}</td>
                                            <td class="bodyTableText">${pro.getMarca()}</td> 
                                            <td class="bodyTableText">${pro.getDescripcion()}</td> 
                                            <td class="bodyTableText">${pro.getCantidad()} ${prod.sacarMedida(pro.getIdfamilia())}</td>
                                            <td class="bodyTableText">$${pro.getTotalcompra()}</td>
                                            <% 
                                                i+=1;
                                                %>
                                            <c:set var="total" value="${total + pro.getTotalcompra()}" />
                                            <td>
                                                <form method="POST" action="/portafolio/ordenPedido">
                                                    <input type="hidden" name="idproducto" value="${pro.getIdproductospedido()}">
                                                    <input type="hidden" name="indexLista" value="<%= i %>">
                                                    <input type="hidden" name="selOrden" value="${nombreProv}">
                                                    <input type="hidden" name="rubro" value="${rubro}">
                                                    <input type="hidden" name="idProv" value="<%= idProveedor %>">
                                                 <input type="submit" name="eliminarProducto" value="Eliminar" class="btn-danger rounded-pill fontBotonOrden"> 
                                                </form>
                                            </td>
                                        </tr>
                                    </c:forEach>
                                        <tr class="redaccion">
                                            <td colspan="3"></td>
                                            <td class="headTableText">TOTAL:</td> 
                                            <td class="headTableText">$${total}</td>
                                            <td></td>
                                        </tr>
                                </tbody>
                            </table>
                                                </c:otherwise>
                                        </c:choose>
                                      </fieldset>
                                     
                                 </div>
                                            
                             </div>
                                        <div class="row mt-5">
                                         
                                          <c:if test="${listaOrden.size()!=0}">
                                            <div class="col text-right">
                                               <form method="POST" action="/portafolio/ordenPedido">
                                                     <input type="hidden" name="total" value=" ${total}">
                                                     <input type="hidden" name="idProv" value="<%= idProveedor %>">
                                                    <input type="submit" name="finalizarOrden" value="Ordenar Pedido" class="btn-success rounded-pill finalizarVenta"">
                                               </form>
                                               </div>
                                            </c:if>
                                       </div>  
            </div>
        
    </div>
</div>
</div>
       </body>
       <script>

            function redireccion(){
    
             $(".loader").fadeOut("slow");
             
            }
            
       </script>


</html>


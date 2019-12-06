<%@page contentType="text/html" pageEncoding="UTF-8"%>
<jsp:useBean id="orden" class="daoimp.ordenPedidoDAOIMP"/>
<jsp:useBean id="prov" class="daoimp.proveedorDAOIMP"/>
<jsp:useBean id="producto" class="daoimp.productosPedidoDAOIMP"/>
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
         <c:set var="idorden" scope="request" value="${idorden}" />
          <c:set var="nombre" scope="request" value="${nombre}" />
           <c:set var="rubro" scope="request" value="${rubro}" />
     <div class="col">
           <div class="mt-5 card w-100">
                <div class="card-body p-5">
                      <label class="card-title loginFontTitle text-center">Recepcion de Ordenes</label>
                        <div class="card-text">
                            <p class="textoExplicativo">
                               Aqui podras Aceptar las recepciones que se generan cuando Ordenas un pedido
                            </p>
                            <div class="card-text row">
                                <p class="col-10 tooltips">* Historial, en el cual podras ver el pedido.</p>
                            </div>
                              <hr>
                            <div class="row mb-5">
                                <div class="col text-center">
                                    <label class="card-title loginFontTitle finalizado">${nombre} - <strong class="text-info">${rubro}</strong></label>
                                </div>
                            </div>
                                
                                   <table class="table table-bordered fixTablefinalizadas">
                                
                                <thead>
                                    <tr>
                                        <th class="headTableText">Folio</th>                                    
                                        <th class="headTableText">Producto Solicitado</th>
                                        <th class="headTableText">Cantidad</th>
                                        <th class="headTableText">Total</th>

                                    </tr>
                                </thead>
                                </thead>
                                <tbody>
                                    <c:set var="total" value="${0}"/>
                                    <c:forEach var="orden" items="${orden.listarTodosporOrden(idorden)}">
                                        <tr class="redaccion">
                                            
                                             <td class="bodyTableText">0000${orden.getIdordenpedido()}</td>
                                             <c:set var="pro" value="${producto.obtenerPorID(orden.getIdproductospedido())}" />
                                             <td class="bodyTableText">${pro.getNombre()}</td>
                                              <td class="bodyTableText">${pro.getCantidad()}</td>
                                              <td class="bodyTableText">$ ${pro.getTotalcompra()}</td>
                                             <c:set var="total" value="${total + pro.getTotalcompra()}" />
                                        </tr>
                                    </c:forEach>
                                        <tr class="redaccion">
                                            <td colspan="2"></td>
                                            <td class="headTableText">TOTAL ORDEN:</td> 
                                            <td class="headTableText">$ ${total}</td>
                                        </tr>
                                </tbody>
                            </table>
                     
                             
                                      <div class="card-text p-5 text-center">
                                          <li><a href="/portafolio/paginas/admin/recepcion.jsp"> <label class="card-title loginFontTitle finalizado"><i class="fas fa-arrow-left"></i> Volver a Recepcion</label></a></li>
                     
                                      </div>
                              <hr>
                         
                        </div>
                        
            </div>
            </div>
    </div>
</div>
       </body>
    
</html>

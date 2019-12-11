<%@page import="dto.ordenpedidoDTO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="daoimp.ordenPedidoDAOIMP"%>
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
            <c:set var="orL" value="${orden.listarTodosAgrupados()}" />
     <div class="col">
           <div class="mt-5 card w-100">
                <div class="card-body p-5">
                      <label class="card-title loginFontTitle text-center">Recepcion de Ordenes</label>
                        <div class="card-text">
                            <p class="textoExplicativo">
                               Aqui podras Aceptar las recepciones que se generan cuando Ordenas un pedido
                            </p>
                            <div class="card-text row">
                                <p class="col-10 tooltips">* Si aceptas una orden, los productos se agregaran automaticamente a los productos.</p>
                            </div>
                         
                                  <hr>
                                   <c:choose>
                                   <c:when test="${orL.size()==0}">
                                       <div class="text-center">
                                                <p class="loginFontTitle">Sin Recepcion de Ordenes</p>
                                       </div>
                                    </c:when>
                                            <c:otherwise>
                                   <table class="table table-bordered">
                                
                                <thead>
                                    <tr>
                                        <th class="headTableText">Folio</th>                                    
                                        <th class="headTableText">Nombre Proveedor</th>
                                        <th class="headTableText">Rubro</th>
                                        <th class="headTableText">Fecha</th>
                                        <th class="headTableText">Recepcion</th>
                                        <th class="headTableText">Acciones</th>

                                    </tr>
                                </thead>
                                
                                <tbody>
                                   
                                    <c:forEach var="ord" items="${orL}">
                                         <c:set var="nombreProveedor" value="${prov.idtonombre(ord.getIdproveedor())}" />
                                         <c:set var="rubroProveedor" value="${prov.idtorubro(ord.getIdproveedor())}" />
                                        <tr class="redaccion">
                                        
                                            
                                             <td class="bodyTableText">0000${ord.getIdordenpedido()}</td>
                                             <td class="bodyTableText">${nombreProveedor}</td>
                                             <td class="bodyTableText">${rubroProveedor}</td>
                                             <td class="bodyTableText">${ord.getFecha()}</td>
                                             <c:if test="${ord.getRecepcion()==0}">
                                              <td class="bodyTableText text-info">En Espera</td>   
                                             </c:if>
                                              <c:if test="${ord.getRecepcion()==1}">
                                              <td class="bodyTableText text-success">Aceptado</td>   
                                             </c:if>
                                              <td class="bodyTableText">
                                                     <form method="POST" action="/portafolio/recepcion">
                                                       <input type="hidden" name="idorden" value="${ord.getIdordenpedido()}" >
                                                       <input type="hidden" name="nombre" value="${nombreProveedor}" >
                                                       <input type="hidden" name="rubro" value="${rubroProveedor}" >
                                              <c:choose>
                                                                <c:when test="${ord.getRecepcion()==0}">
                                                                    <input type="hidden" name="idUsuario" value="<%= usuario.getIdusuario()%>" >
                                                                    <input type="hidden" name="idProv" value="${ord.getIdproveedor()}" >
                                                                    <input type="submit" name="aceptarOrden" value="Aceptar Orden" class="btn-success rounded-pill fontBotonRecepcion">
                                                                    <input type="submit" name="verOrden" value="Ver Orden" class="btn-info rounded-pill fontBotonRecepcion" onclick="redireccion()">   
                                                                </c:when>
                                                                <c:otherwise>
                                                                    <input type="submit" name="verOrden" value="Ver Orden" class="btn-info rounded-pill fontBotonRecepcion" onclick="redireccion()"> 
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
                              <hr>
                         
                        </div>
                   <div class="loader" id="loader" style="display:none;"></div>       
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
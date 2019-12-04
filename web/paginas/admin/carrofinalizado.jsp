<%@page contentType="text/html" pageEncoding="UTF-8"%>
<jsp:useBean id="boleta" class="daoimp.boletaDAOIMP"/>
<jsp:useBean id="producto" class="daoimp.productoDAOIMP"/>  
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
        <c:if test="${mensaje!=null}">
            <script>
                alert("${mensaje}");
            </script> 
        </c:if>
        <c:set var="idboleta" scope="request" value="${idboleta}" />   
        <c:set var="nombre" scope="request" value="${nombre}" />    
        <c:set var="rut" scope="request" value="${rut}" />
        <c:set var="tipoBoleta" scope="request" value="${tipoBoleta}" /> 
     <div class="col">
           <div class="mt-5 card w-100">
                <div class="card-body p-5 text-center">
                      <label class="card-title loginFontTitle">Venta Finalizada</label>

                         <div class="card-text row text-center">
                             
                                    <div class="col-4">
                                       <label class="card-title loginFontTitle">Nombre:  ${nombre}</label>
                                    </div>
                                    <div class="col-4">
                                        <label class="card-title loginFontTitle">Rut:  ${rut}</label>
                                    </div>
                                      <div class="col-4">
                                     <c:choose>
                                            <c:when test="${tipoBoleta==2}">
                                             
                                                   <label class="card-title loginFontTitle">Boleta: <strong>Pendiente de Fiado</strong></label>
                                               
                                            </c:when>
                                            <c:otherwise>
                                                <label class="loginFont text-success">Boleta: <strong>Pagada</strong> </label>
                                            </c:otherwise>
                                        </c:choose>
                                     </div>
                                    
                           
                            </div>
                     
             </div>  
                                    
                                        
                            
                                  <table class="table table-bordered">
                                
                                <thead>
                                    <tr>
                                        <th class="headTableText">ID BOLETA</th>
                                        <th class="headTableText">Nombre Producto</th>
                                        <th class="headTableText">Cantidad</th>
                                        <th class="headTableText">Total</th>

                                    </tr>
                                </thead>
                                </thead>
                                <tbody>
                                     <c:set var="total" value="${0}"/>
                                    <c:forEach var="bol" items="${boleta.listarTodosporIDBOLETA(idboleta)}">
                                        <tr class="redaccion">
                                            
                                             <td class="bodyTableText">${bol.getIdboleta()}</td>
                                             <td class="bodyTableText">${producto.idproductotonombre(bol.getIdproducto())}</td>                                              
                                             <td class="bodyTableText">${bol.getCantidad()}</td> 
                                             <td class="bodyTableText">$ ${bol.getTotal()}</td>
                                              <c:set var="total" value="${total + bol.getTotal()}" />
                                        </tr>
                                    </c:forEach>
                                        <tr class="redaccion">
                                            <td colspan="2"></td>
                                            <td class="headTableText">TOTAL:</td> 
                                            <td class="headTableText">$ ${total}</td>
                                        </tr>
                                </tbody>
                            </table>
                     
                             
                                      <div class="card-text p-5 text-center">
                      <label class="card-title loginFontTitle">¡ Gracias por preferir Almacen Yuyita`s !</label>
                                      </div>
                                  
    </div>
</div>
</div>
       </body>
      
</html>

<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<jsp:useBean id="pagofiado" class="daoimp.pagoFiadoDAOIMP" />

<!DOCTYPE html>
<html>
     <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Almacen</title>
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
        <link href="https://fonts.googleapis.com/css?family=Varela+Round&display=swap" rel="stylesheet">
        <link href="https://fonts.googleapis.com/css?family=Lobster+Two&display=swap" rel="stylesheet">
        <script defer src="../js/all.js"></script> <!--load all styles -->
        <link href="https://fonts.googleapis.com/css?family=Poppins&display=swap" rel="stylesheet">


     </head>
    <header>
        <%@ include file="/masterpage/menu.jsp" %>
    </header>
    <body>
           <c:if test="${mensaje!=null}">
            <script>
                alert("${mensaje}");
            </script> 
            </c:if>
        <c:set var="rut" scope="request" value="${rut}" />
        <c:set var="idDeuda" scope="request" value="${idDeuda}" />
        <c:set var="total" scope="request" value="${total}" />
        <c:set var="idCliente" scope="request" value="${idCliente}" />
        <div class="container-fluid midColor">
            <div class="row justify-content-center">
                <div class="card cardRegistro">
                    <div class="left">
                        <label class="loginFontTitle text-center">Historial:</label><br>
                    <label class="loginFont">Rut: ${rut} | Folio nº 0000${idDeuda}</label>
                    </div>
                    <div class="mt-5">
                    <table class="table table-bordered"> 
                                <thead>
                                    <tr>
                                        <th>NOMBRE</th>
                                        <th>ABONO</th>
                                        <th>FECHA ABONO</th>  
                                    </tr>
                                </thead>
                                <tbody>
                                    <c:forEach var="fia" items="${fiados}">
                                        <tr class="table-info">                          
                                            <td>${pagofiado.idToNombre(fia.getIdcliente())}</td>
                                            <td>$ ${fia.getAbono()}</td>
                                            <td>${fia.getFechaabono()}</td>
                                        </tr>
                                        <c:set var="numIdpago" value="${fia.getIdpagofiado()}" />
                                        <c:set var="numIdCliente" value="${fia.getIdcliente()}" />
                                    </c:forEach>
                                </tbody>
                            </table>
                    </div>
                                    
                                     <div class="text-right mt-2 mr-4">
                                          <label class="loginFont">Total Deuda: $ ${total}</label>
                                          <label class="loginFont">Total Abonado: $ ${pagofiado.deudaFiado(idDeuda)}</label>
                                          <hr class="hrHistorial">
                                         <c:set var="diferencia" value="${total - pagofiado.deudaFiado(idDeuda)}" />
                                         <c:choose>
                                            <c:when test="${diferencia>0}">
                                                <label class="loginFont">Te faltan: $ ${diferencia}</label>
                                            </c:when>
                                            <c:otherwise>
                                                <label class="loginFont text-success">Deuda Pagada</label>
                                            </c:otherwise>
                                        </c:choose>
                                       
                                          
                                     </div>
                                      
                                    <div class="d-flex mt-5 mr-4">
                                         <input  class="btn-secondary rounded-pill font-12 ml-2 atras" value="Atras" onClick="history.go(-1);"/>
                                          <form class="d-content pull-right" method="POST" action="/portafolio/verHistorial">
                                              <input value="${diferencia}" type="hidden" name="numDiferencia"/> 
                                              <input value="${numIdpago}" type="hidden" name="numIdpago"/> 
                                             <input value="${numIdCliente}" type="hidden" name="numIdCliente"/>
                                             <input value="${rut}" type="hidden" name="txtRut"/> 
                                             <input value="${total}" type="hidden" name="numTotal"/>
                                             <c:if test="${diferencia>0}">
                                                 <input class="loginFontMID mr-2 margin-auto" min="0" max="${diferencia}" type="number" name="numAbono" required/>
                                                 <input  class="btn-primary rounded-pill font-12" type="submit" name="abonar" value="Abonar"/>
                                             </c:if>
                                         </form>
                                    </div>  
             </div>
            </div>
        </div>       
        </body>
</html>
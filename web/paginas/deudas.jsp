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
        <script defer src="../js/all.js"></script> <!--load all styles -->
        <link href="https://fonts.googleapis.com/css?family=Poppins&display=swap" rel="stylesheet">


     </head>
    <header>
        <%@ include file="/masterpage/menu.jsp" %>
    </header>
    <body>
        <c:set var="rut" scope="request" value="${rut}" />
        <div class="container-fluid midColor">
            <div class="row justify-content-center">
                <div class="card cardRegistro">
                    <div class="left">
                   <label class="loginFontTitle text-center">Ver Deuda:</label>
                   <form method="POST" action="/portafolio/deudas">
                    <div class="m-5 row">
                        <div class="col-sm-0">
                                <label class="loginFont" >*RUT: </label>
                         </div>
                        <div class="col-sm-9">
                                <input class="loginFont" value="${rut}" maxlength="8" type="number" name="txtRut"/>
                        </div>
                        <div class="col-sm-0">
                        <input type="submit" name="buscar" value="Buscar" class="btn-primary rounded-pill mt-2 font-12">
                        </div>
                     </div>
                       </form>
                    </div>
                     <c:choose>
              <c:when test="${deudasAceptadas.size()== 0 && deudasRechazadas.size()== 0}">
                  <div class="text-center">
                  <label class="loginFontTitle pt-5">RUT SIN HISTORIAL DE DEUDAS</label>
                  </div> 
              </c:when>
           <c:otherwise>
                     <c:if test="${deudasAceptadas!=null}">
                         <label class="loginFont text-center mb-5">Abonar al total de tus Fiados</label>
                            <table class="table table-bordered">
                                
                                <thead>
                                    <tr>
                                        <th>RUT</th>
                                        <th>NOMBRE</th>
                                        <th>CONTACTO</th>
                                        <th>DEUDA</th>
                                        <th>ESTADO</th>
                                        <th>ACCIONES</th>
                                    </tr>
                                </thead>
                                </thead>
                                <tbody>
                                    <c:forEach var="deu" items="${deudasAceptadas}">
                                     
                                        <tr>
   
                                            <td>${deu.getRut()}</td>
                                            <td>${deu.getNombre()}</td>
                                            <td>${deu.getContacto()}</td>
                                            <td>$ ${deu.getDeuda()}</td>
                                            <td class="text-success">ACEPTADO</td>                                        
                                            <form method="POST" action="/portafolio/verHistorial">
                                            <input class="loginFont" value="${rut}" maxlength="8" type="hidden" name="txtRut"/>
                                            <input class="loginFont" value="" type="hidden" name="numDeuda"/>
                                            <input class="loginFont" value="${deu.getDeuda()}" type="hidden" name="numTotal"/>
                                            <td>
                                                <input type="submit" name="verInforme" value="Abonar" class="btn-primary rounded-pill font-12">
                                                <input type="submit" name="descargarBoleta" value="Boleta" class="btn-primary rounded-pill font-12">
                                            </td>  
                                              
                                            </form>
                                        </tr>

                                    </c:forEach>
                                </tbody>
                            </table>
                     </c:if>
                         <%--AQUI LA TABLA RECHAZADAS--%>
                         <c:if test="${deudasRechazadas!=null}">  
                              <label class="loginFont text-center mt-5 mb-5">Fiados NO Aceptados</label>
                         <table class="table table-bordered">
                                
                                <thead>
                                    <tr>
                                        <th>RUT</th>
                                        <th>NOMBRE</th>
                                        <th>CONTACTO</th>
                                        <th>DEUDA</th>
                                        <th>ESTADO</th>
                                        <th>ACCIONES</th>
                                    </tr>
                                </thead>
                                </thead>
                                <tbody>
                                    <c:forEach var="deuR" items="${deudasRechazadas}">
                                     
                                        <tr class="table-danger">
   
                                            <td>${deuR.getRut()}</td>
                                            <td>${deuR.getNombre()}</td>
                                            <td>${deuR.getContacto()}</td>
                                            <td>$ ${deuR.getDeuda()}</td>
                                            <td class="text-danger">RECHAZADO</td>                                        
                                            <form method="POST" action="/portafolio/verHistorial">
                                            <input class="loginFont" value="${rut}" maxlength="8" type="hidden" name="txtRut"/>
                                            <input class="loginFont" value="" type="hidden" name="numDeuda"/>
                                            <input class="loginFont" value="${deuR.getDeuda()}" type="hidden" name="numTotal"/>
                                            <td>
                                                <input type="submit" name="verInforme" value="Abonar" class="btn-secondary rounded-pill font-12" disabled>
                                                <input type="submit" name="descargarBoleta" value="Boleta" class="btn-primary rounded-pill font-12">
                                            </td>  
                                              
                                            </form>
                                        </tr>

                                    </c:forEach>
                                </tbody>
                            </table>

                        </c:if>
                       </c:otherwise>
                </c:choose> 
                </div>
                    
             </div>
            </div>
                     
        </body>
</html>

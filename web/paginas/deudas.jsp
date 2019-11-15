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
                   <label class="loginFontTitle text-center">Ver Deudas:</label>
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
              <c:when test="${deudas.size()==0}">
                  <div class="text-center">
                  <label class="loginFontTitle pt-5">RUT SIN DEUDAS</label>
                  </div>
              </c:when>
           <c:otherwise>
                     <c:if test="${deudas!=null}">
                         <label class="loginFont text-center mb-5">Al ver tu Informe podras abonar tu Deuda</label>
                            <table class="table table-bordered">
                                
                                <thead>
                                    <tr>
                                        <th>NºDeuda</th>
                                        <th>RUT</th>
                                        <th>NOMBRE</th>
                                        <th>DEUDA</th>
                                        <th>ABONO</th>
                                        <th>ESTADO</th>
                                        <th>ACCIONES</th>
                                    </tr>
                                </thead>
                                </thead>
                                <tbody>
                                    <c:forEach var="deu" items="${deudas}">
                                        <c:choose>
                                            <c:when test="${deu.getEstado()==0}">
                                                <tr class="table-success">
                                            </c:when>
                                            <c:otherwise>
                                                <tr class="table-danger">
                                            </c:otherwise>
                                        </c:choose>
                                            <td>${deu.getIdpagofiado()}</td>
                                            <td>${deu.getRut()}</td>
                                            <td>${deu.getNombre()}</td>
                                            <td>$ ${deu.getDeuda()}</td>
                                            <td>$ ${deu.getAbono()}</td>
                                            <c:choose>
                                                <c:when test="${deu.getEstado()==0}">
                                                     <td class="text-success">PAGADO</td>
                                                </c:when>
                                                <c:otherwise>
                                                    <td class="text-danger">SIN PAGAR</td>
                                                </c:otherwise>
                                            </c:choose>                                            
                                            <form method="POST" action="/portafolio/verHistorial">
                                            <input class="loginFont" value="${rut}" maxlength="8" type="hidden" name="txtRut"/>
                                            <input class="loginFont" value="${deu.getIdpagofiado()}" type="hidden" name="numDeuda"/>
                                            <input class="loginFont" value="${deu.getDeuda()}" type="hidden" name="numTotal"/>
                                            <td>
                                                <input type="submit" name="verInforme" value="Informe" class="btn-primary rounded-pill font-12">
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

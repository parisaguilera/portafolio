
<%@page import="dto.clienteDTO"%>
<%@page import="daoimp.clienteDAOIMP"%>
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
        <c:if test="${mensaje!=null}">
            <script>
                alert("${mensaje}");
            </script> 
        </c:if>
            
             <%     
                  
                clienteDAOIMP cli = new clienteDAOIMP();
                         
                          String rut= request.getParameter("rut");
                          
                clienteDTO cliente = cli.clienteFicha(rut);
                int i =0;
             %>
     <div class="col">
           <div class="mt-5 card w-100">
                <div class="card-body p-5">
                    <div class="text-center">
                     <label class="card-title loginFontTitle">Ficha de <%= cliente.getNombre() %></label>
                    </div>
                    <div class="form-row mt-5">
                        <div class="col-md-1">
                            <h2 class="textoExplicativo">Nombre</h2>                
                        </div>
                        <div class="col-md-3">
                              <input type="text" placeholder="<%= cliente.getNombre() %>" class="form-control">
                        </div>
                        
                        
                        <div class="col-md-0">
                            <h2 class="textoExplicativo">Rut</h2>
                        </div>
                        <div class="col-md-3">
                              <input type="text" placeholder="<%= cliente.getRut()%>"  class="form-control">
                        </div>
                        
                        <div class="col-md-1">
                            <h2 class="textoExplicativo">Contacto</h2>
                        </div>
                        <div class="col-md-3">
                              <input type="text" placeholder="<%= cliente.getContacto() %>" class="form-control">
                        </div>
                    </div>
                        <!-- set arreglos -->
                            <c:set var="listaPen" value="<%= cli.listarTodosFicha(rut,2) %>" />
                            <c:set var="listaRe" value="<%= cli.listarTodosFicha(rut,0) %>" />
                            <c:set var="listaAce" value="<%= cli.listarTodosFicha(rut,1) %>" />
                    <!-- Seccion de sus boletas-->
                    <div class="form-row mt-5">
                        <div class="col-md-4">
                            <div class="card text-center">
                                <div class="card-header">
                                    <h5 class="text-info">Fiados Pendientes</h5>
                                </div>
                                <div class="card-body p-0">
                                    <c:choose>
                                            <c:when test="${listaPen.size()==0}">
                                                <label class="loginFontTitle">Sin fiados Aceptados</label>
                                            </c:when>
                                            <c:otherwise>
                                                <table class="table table-bordered">
                                
                                            <thead>
                                                <tr>
                                                    <th class="headTableText">Nº Fiado</th>
                                                    <th class="headTableText">N º Boleta</th>
                                                    <th class="headTableText">Deuda</th>  

                                                </tr>
                                            </thead>
                                            
                                                    <tbody>
                                                        
                                                         <c:forEach var="fiadosPen" items="${listaPen}">
                                                            <tr class="redaccion">
                                                                
                                                                <td class="bodyTableText"><%= i+=1 %></td>
                                                                <td class="bodyTableText">${fiadosPen.getIdboleta()}</td>
                                                                <td class="bodyTableText">${fiadosPen.getDeuda()}</td>
                                                            </tr>
                                                         </c:forEach>
                                                    </tbody>
                                            </table>
                                            </c:otherwise>
                                        </c:choose>
                                </div>
                                <div class="card-footer text-muted">
                                  <p class="text-info"><%= i %> Fiados Pendientes</p>
                                </div>
                              </div>                
                        </div>
                        <% 
                        i=0;
                            %>
                        <div class="col-md-4">
                            <div class="card text-center">
                                <div class="card-header table-success">
                                   <h5 class="text-success">Fiados Aceptados</h5>
                                </div>
                                <div class="card-body p-0">
                                    <c:choose>
                                            <c:when test="${listaAce.size()==0}">
                                                <label class="loginFontTitle">Sin fiados Aceptados</label>
                                            </c:when>
                                            <c:otherwise>
                                                <table class="table table-bordered">
                                
                                            <thead>
                                                <tr>
                                                    <th class="headTableText">Nº Fiado</th>
                                                    <th class="headTableText">N º Boleta</th>
                                                    <th class="headTableText">Deuda</th>  

                                                </tr>
                                            </thead>
                                            
                                                    <tbody>
                                                         <c:forEach var="fiadosAce" items="${listaAce}">
                                                            <tr class="redaccion">
                                                                <td class="bodyTableText"><%= i+=1 %></td>
                                                                <td class="bodyTableText">${fiadosAce.getIdboleta()}</td>
                                                                <td class="bodyTableText">${fiadosAce.getDeuda()}</td>                      
                                                            </tr>
                                                         </c:forEach>
                                                    </tbody>
                                            </table>
                                            </c:otherwise>
                                        </c:choose>
                                </div>
                                <div class="card-footer text-muted">
                                 <p class="text-success"><%= i %> Fiados Aceptados<p>
                                </div>
                              </div>     
                        </div>
                        <% 
                        i=0;
                            %>
                        <div class="col-md-4">
                            <div class="card text-center">
                                <div class="card-header">
                                  <h5 class="text-danger">Fiados Rechazados</h5>
                                </div>
                                <div class="card-body p-0">
                                           <c:choose>
                                            <c:when test="${listaRe.size()==0}">
                                                <label class="loginFontTitle">Sin fiados Rechazados</label>
                                            </c:when>
                                            <c:otherwise>
                                                <table class="table table-bordered">
                                
                                            <thead>
                                                <tr>
                                                    <th class="headTableText">Nº Fiado</th>
                                                    <th class="headTableText">N º Boleta</th>
                                                    <th class="headTableText">Deuda</th>  

                                                </tr>
                                            </thead>
                                            
                                                    <tbody>
                                                         <c:forEach var="fiadosRe" items="${listaRe}">
                                                            <tr class="redaccion">
                                                                <td class="bodyTableText"><%= i+=1 %></td>
                                                                <td class="bodyTableText">${fiadosRe.getIdboleta()}</td>
                                                                <td class="bodyTableText">${fiadosRe.getDeuda()}</td>                             
                                                            </tr>
                                                         </c:forEach>
                                                    </tbody>
                                            </table>
                                            </c:otherwise>
                                        </c:choose>
                                </div>
                                <div class="card-footer text-muted">
                                    <p class="text-danger"><%= i %> Fiados Rechazados</p>
                                </div>
                              </div>     
                        </div>

                    </div>
                    
            </div>
            </div>
    </div>
</div>
       </body>
    
</html>
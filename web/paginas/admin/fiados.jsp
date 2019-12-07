<%@page contentType="text/html" pageEncoding="UTF-8"%>
<jsp:useBean id="listaFiados" class="daoimp.clienteDAOIMP"/>
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
 <%@ include file="modalCategorias.jsp" %>                               
        <c:if test="${mensaje!=null}">
            <script>
                alert("${mensaje}");
            </script> 
        </c:if>
     <div class="col">
           <div class="mt-5 card w-100">
                <div class="card-body p-5">
                      <label class="card-title loginFontTitle text-center">Admin de fiados</label>
                        <div class="card-text">
                            <p class="textoExplicativo">
                               Aqui podras Aceptar/Rechazar Fiados pendientes o rechazados.
                            </p>
                         
                            <div class="card-text row">
                                <p class="col-10 tooltips">* Recuerda que los Aceptados no se pueden Modificar!</p>
                            </div>

                            <hr>
                            <c:set var="listaPen" value="${listaFiados.listarTodosEstado(2)}" />
                            <c:set var="listaRe" value="${listaFiados.listarTodosEstado(0)}" />
                            <c:set var="listaAce" value="${listaFiados.listarTodosEstado(1)}" />
                         <c:choose>
                            <c:when test="${listaPen.size()== 0 && listaRe.size()==0}">
                            <p class="loginFontTitle">
                               Sin Solicitudes de fiado.
                            </p>
                               </c:when>
                             <c:otherwise>
                             <p class="loginFontTitle">
                               Solicitudes de Fiado
                            </p>
                                  <table class="table table-bordered">
                                
                                <thead>
                                    <tr>
                                        <th class="headTableText">Boleta</th>
                                        <th class="headTableText">Rut</th>
                                        <th class="headTableText">Nombre</th>  
                                        <th class="headTableText">Contacto</th>
                                        <th class="headTableText">Deuda</th>
                                        <th class="headTableText">Estado</th>
                                        <th class="headTableText">Acciones</th>
                                    </tr>
                                </thead>
                                </thead>
                                <tbody>
                                    <c:forEach var="fiadosPen" items="${listaPen}">
                                        <tr class="table-info redaccion">
                                            <td class="bodyTableText">0000${fiadosPen.getIdboleta()}</td>
                                            <td class="bodyTableText">${fiadosPen.getRut()}</td>
                                            <td class="bodyTableText">${fiadosPen.getNombre()}</td>
                                            <td class="bodyTableText">${fiadosPen.getContacto()}</td>
                                            <td class="bodyTableText">$ ${fiadosPen.getDeuda()}</td>
                                            <td class="bodyTableText text-info">PENDIENTE</td>
                                            <td>
                                                 <form method="POST" action="/portafolio/fiadosControlador">
                                                 <input value="${fiadosPen.getIdboleta()}" type="hidden" name="idBoleta"/> 
                                                <input type="submit" name="aceptarFiadoPen" value="Aceptar" class="btn-success rounded-pill font-12">
                                                <input type="submit" name="rechazarFiadoPen" value="Rechazar" class="btn-danger rounded-pill font-12">  
                                                 </form>
                                               </td>                                 
                                        </tr>
                                    </c:forEach>
                                     <c:forEach var="fiadosRe" items="${listaRe}">
                                        <tr class="table-danger redaccion">
                                            <td class="bodyTableText">0000${fiadosRe.getIdboleta()}</td>
                                            <td class="bodyTableText">${fiadosRe.getRut()}</td>
                                            <td class="bodyTableText">${fiadosRe.getNombre()}</td>
                                            <td class="bodyTableText">${fiadosRe.getContacto()}</td>
                                            <td class="bodyTableText">$ ${fiadosRe.getDeuda()}</td>
                                            <td class="bodyTableText text-danger">RECHAZADO</td>
                                            <td>
                                                 <form method="POST" action="/portafolio/fiadosControlador">
                                                 <input value="${fiadosRe.getIdboleta()}" type="hidden" name="idBoleta"/> 
                                                <input type="submit" name="aceptarFiadoRe" value="Aceptar" class="btn-success rounded-pill font-12">  
                                                 </form>
                                               </td>                                 
                                        </tr>
                                    </c:forEach>
                                </tbody>
                            </table>
                             </c:otherwise>
                            </c:choose>
                            <hr>
                                 <c:choose>
                            <c:when test="${listaAce.size()== 0}">
                                
                            </c:when>
                            <c:otherwise>
                            <p class="loginFontTitle">
                               Fiados Aceptados
                            </p>
                            <table class="table table-bordered">
                                
                                <thead>
                                    <tr>
                                        <th class="headTableText">Boleta</th>
                                        <th class="headTableText">Rut</th>
                                        <th class="headTableText">Nombre</th>  
                                        <th class="headTableText">Contacto</th>
                                        <th class="headTableText">Deuda</th>
                                        <th class="headTableText">Estado</th>
                                    </tr>
                                </thead>
                                </thead>
                                <tbody>
                                    <c:forEach var="fiadosAcep" items="${listaAce}">
                                        <tr class="table-success redaccion">
                                            <td class="bodyTableText">0000${fiadosAcep.getIdboleta()}</td>
                                            <td class="bodyTableText">${fiadosAcep.getRut()}</td>
                                            <td class="bodyTableText">${fiadosAcep.getNombre()}</td>
                                            <td class="bodyTableText">${fiadosAcep.getContacto()}</td>
                                            <td class="bodyTableText">$ ${fiadosAcep.getDeuda()}</td>
                                            <td class="bodyTableText text-success">ACEPTADO</td>                                
                                        </tr>
                                    </c:forEach>
                                </tbody>
                            </table>
                             <hr>
                             </c:otherwise>
                             </c:choose>
                        </div>
                        
            </div>
            </div>
    </div>
</div>
<script>
    function eliminar(idc,nombre){
    
        document.getElementById("contenido").innerHTML="";
        $('#modalEliminar').modal('show');
        $("#contenido").load("/portafolio/paginas/admin/eliminarCategoria.jsp",{idc,nombre});
        
    }
     function eliminarAlert(){

        alert("No puedes eliminar una categoria con productos asociados");
    }
     function agregar(){

        $('#modalAgregar').modal('show');
    }
    
    function editar(idc,nombre){
        document.getElementById("titulo").innerHTML="";
        $('#modalEditar').modal('show');
        $("#titulo").load("/portafolio/paginas/admin/editarCategoria.jsp",{idc,nombre});
    }
    
</script>

       </body>
    
</html>


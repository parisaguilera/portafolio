<%@page contentType="text/html" pageEncoding="UTF-8"%>
<jsp:useBean id="listaClientes" class="daoimp.clienteDAOIMP"/>
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
            <c:set var="cli" value="${listaClientes.listarFicha()}" />
     <div class="col">
           <div class="mt-5 card w-100">
                <div class="card-body p-5">
                      <label class="card-title loginFontTitle text-center">Ficha de Clientes</label>
                        <div class="card-text">
                            <p class="textoExplicativo">
                               Aqui podras ver y descargar todos las fichas de clientes que pidieron Fiados.
                            </p>
                              <hr>
                              <c:choose>
                                   <c:when test="${cli.size()==0}">
                                       <div class="text-center">
                                                <p class="loginFontTitle">Sin Clientes</p>
                                       </div>
                                    </c:when>
                                            <c:otherwise>

                          
                                  <table class="table table-bordered">
                                
                                <thead>
                                    <tr>
                                        <th class="headTableText">Nombre</th>
                                        <th class="headTableText">Rut</th>  
                                        <th class="headTableText">Contacto</th>
                                        <th class="headTableText">Acciones</th>
                                    </tr>
                                </thead>
                                </thead>
                                <tbody>
                                    <c:forEach var="clientes" items="${cli}">
                                        <tr class="redaccion">
                                             <c:set var="idCliente" value="${clientes.getIdcliente()}"/>
                                            <td class="bodyTableText">${clientes.getNombre()}</td>
                                            <td class="bodyTableText">${clientes.getRut()}</td>
                                            <td class="bodyTableText">+569 ${clientes.getContacto()}</td> 
                                            <td>
                                              <form action="ficha.jsp" method="GET">
                                                    <input type="hidden" name="rut" value="${clientes.getRut()}"> 
                                                    <input type="submit" value="Ver Ficha" class="btn-success rounded-pill font-12" onclick="redireccion()"> 
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
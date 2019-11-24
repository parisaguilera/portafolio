<%@page contentType="text/html" pageEncoding="UTF-8"%>
<jsp:useBean id="listaProveedor" class="daoimp.proveedorDAOIMP"/>

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
 <%@ include file="modalProveedor.jsp" %>      
        <c:if test="${mensaje!=null}">
            <script>
                alert("${mensaje}");
            </script> 
        </c:if>
     <div class="col">
           <div class="mt-5 card w-100">
                <div class="card-body p-5">
                      <label class="card-title loginFontTitle text-center">Modulo de Proveedor</label>
                        <div class="card-text">
                            <p class="textoExplicativo">
                               Aqui podras Agregar,Leer,Editar y borrar Proveedor
                            </p>
                         
                            <div class="card-text row">
                                <p class="col-10 tooltips"></p>
                                <div class="col-2 text-right" >                         
                                <input type="submit" name="agregarModal" value="Agregar" class="btn-success rounded-pill font-12" onclick="agregar()">
                                </div>
                            </div>

                            <hr>
                                  <table class="table table-bordered">
                                
                                <thead>
                                    <tr>
                                        <th class="headTableText">Id Proveedor</th>
                                        <th class="headTableText">Nombre</th>
                                        <th class="headTableText">Datos Contacto</th>
                                        <th class="headTableText">Rubro</th>
                                         <th class="headTableText">Acciones</th>  
                                    </tr>
                                </thead>
                                </thead>
                                <tbody>
                                    <c:forEach var="proovedores" items="${listaProveedor.listarTodos()}">
                                        <tr class="redaccion">
                                             <td class="bodyTableText">${proovedores.getIdproveedor()}</td> 
                                             <td class="bodyTableText">${proovedores.getNombre()}</td>
                                             <td class="bodyTableText">${proovedores.getDatoscontacto()}</td>                                              
                                             <td class="bodyTableText">${proovedores.getRubro()}</td> 
                                             <td>
                                                <c:set var="nombre" value="${proovedores.getNombre()}"/>
                                                 <c:set var="idc" value="${proovedores.getIdproveedor()}"/>
                                             <input type="submit" name="editarProveedor" value="Editar" class="btn-info rounded-pill font-12" onclick="editar(${idc},'${nombre}')">
                                             <input type="submit" name="eliminarProveedor" value="Eliminar" class="btn-danger rounded-pill font-12" onclick="eliminar(${idc},'${nombre}')">  

                                                 
                                             </td>  
                                        </tr>
                                    </c:forEach>
                                </tbody>
                            </table>
                     
                             <hr>
                        </div>
                        
            </div>
            </div>
    </div>
</div>
<script>
    function eliminar(idc,nombre){
    
        document.getElementById("contenido").innerHTML="";
        $('#modalEliminar').modal('show');
        $("#contenido").load("/portafolio/paginas/admin/eliminarProveedor.jsp",{idc,nombre});
        
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
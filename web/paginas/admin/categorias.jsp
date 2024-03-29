<%@page contentType="text/html" pageEncoding="UTF-8"%>
<jsp:useBean id="listaCategorias" class="daoimp.familiaProductoDAOIMP"/> 
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
                      <label class="card-title loginFontTitle text-center">Modulo de Categorias</label>
                        <div class="card-text">
                            <p class="textoExplicativo">
                               Aqui podras Agregar,Leer,Editar y borrar Categorias
                            </p>
                         
                            <div class="card-text row">
                                <p class="col-10 tooltips">* Recuerda que no puedes eliminar categorias con productos asociados</p>
                                <div class="col-2 text-right" >                         
                                <input type="submit" name="agregarModal" value="Agregar" class="btn-success rounded-pill font-12" onclick="agregar()">
                                </div>
                            </div>

                            <hr>
                                  <table class="table table-bordered">
                                
                                <thead>
                                    <tr>
                                        <th class="headTableText">Nombre</th>
                                        <th class="headTableText">Medida</th>  
                                        <th class="headTableText">Productos Asociados</th>
                                        <th class="headTableText">Acciones</th>
                                    </tr>
                                </thead>
                                </thead>
                                <tbody>
                                    <c:forEach var="categorias" items="${listaCategorias.listarTodos()}">
                                        <tr class="redaccion">
                                            <td class="bodyTableText">${categorias.getNombre()}</td>
                                            <td class="bodyTableText">${categorias.getMedida()}</td> 
                                            <c:set var="cantProductos" value="${listaCategorias.cantProductosPorCategoria(categorias.getIdfamilia())}" />
                                            <td class="bodyTableText">${cantProductos}</td>
                                            <td>
                                                 <c:set var="nombre" value="${categorias.getNombre()}"/>
                                                 <c:set var="idc" value="${categorias.getIdfamilia()}"/>
                                                <input type="submit" name="editarCategoria" value="Editar" class="btn-info rounded-pill font-12" onclick="editar(${idc},'${nombre}')">
                                                <c:choose>
                                                     <c:when test="${cantProductos==0}">
                                                    <input type="submit" name="eliminarCategoria" value="Eliminar" class="btn-danger rounded-pill font-12" onclick="eliminar(${idc},'${nombre}')">  
                                                    </c:when>
                                                <c:otherwise>
                                                    <input type="submit" name="eliminarCategoria" value="Eliminar" class="btn-light rounded-pill font-12 disabled" onclick="eliminarAlert()"> 
                                                </c:otherwise>
                                                </c:choose>                                                                                   
                                               </td>                                 
                                        </tr>
                                    </c:forEach>
                                </tbody>
                            </table>
                             <hr>
                        </div>
                         <div class="loader" id="loader" style="display:none;"></div>
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
        $(".loader").fadeIn("slow");
        $('#modalEditar').modal('show');
        $("#titulo").load("/portafolio/paginas/admin/editarCategoria.jsp",{idc,nombre});
    }
    
    
</script>

       </body>
    
</html>


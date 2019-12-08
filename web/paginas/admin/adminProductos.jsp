<%@page contentType="text/html" pageEncoding="UTF-8"%>
<jsp:useBean id="listaProductos" class="daoimp.productoDAOIMP"/>

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
 <%@ include file="modalProductos.jsp" %>      
        <c:if test="${mensaje!=null}">
            <script>
                alert("${mensaje}");
            </script> 
        </c:if>
     <div class="col">
           <div class="mt-5 card w-100">
                <div class="card-body p-5">
                      <label class="card-title loginFontTitle text-center">Modulo de Productos</label>
                        <div class="card-text">
                            <p class="textoExplicativo">
                               Aqui podras Agregar,Leer,Editar y borrar Productos
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
                                        <th class="headTableText">Categoria</th>
                                        <th class="headTableText">Nombre</th>
                                        <th class="headTableText">Marca</th>
                                        <th class="headTableText">Descripcion</th>
                                        <th class="headTableText">P.Compra</th>  
                                        <th class="headTableText">P.Venta</th>
                                        <th class="headTableText">Fecha Vencimiento</th>
                                        <th class="headTableText">Codigo Barra</th>
                                        <th class="headTableText">Stock</th>
                                        <th class="headTableText">Stock Critico</th>
                                        <th class="headTableText">Acciones</th>
                                    </tr>
                                </thead>
                                </thead>
                                <tbody>
                                    <c:forEach var="productos" items="${listaProductos.listarTodos()}">
                                        <tr class="redaccion">
                                            <c:set var="categoria" value="${listaProductos.idtonombre(productos.getIdfamilia())}" />
                                             <td class="bodyTableTextImportante fondoImportante">${categoria}</td> 
                                             <td class="bodyTableTextImportante fondoImportante">${productos.getNombre()}</td>
                                             <td class="bodyTableText">${productos.getMarca()}</td>                                              
                                             <td class="bodyTableText">${productos.getDescripcion()}</td> 
                                             <td class="bodyTableText">$ ${productos.getPreciocompra()}</td>
                                             <td class="bodyTableText">$ ${productos.getPrecioventa()}</td> 
                                             <td class="bodyTableText">${productos.getFechavencimiento()}</td> 
                                             <td class="bodyTableText">${productos.getCodigobarra()}</td>  
                                             <td class="bodyTableText">${productos.getStock()}</td>   
                                             <td class="bodyTableText">${productos.getStockcritico()}</td>   
                                             <td>
                                                 <c:set var="idfam" value="${productos.getIdfamilia()}"/>
                                                 <c:set var="nombre" value="${productos.getNombre()}"/>
                                                 <c:set var="idc" value="${productos.getIdproducto()}"/>
                                             <input type="submit" name="editarProducto" value="Editar" class="btn-info rounded-pill font-12" onclick="editar(${idc},'${nombre}',${idfam})">
                                             <input type="submit" name="eliminarProducto" value="Eliminar" class="btn-danger rounded-pill font-12" onclick="eliminar(${idc},'${nombre}')">  

                                                 
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
        $("#contenido").load("/portafolio/paginas/admin/eliminarProducto.jsp",{idc,nombre});
        
    }
     function agregar(){

        $('#modalAgregar').modal('show');
    }
    
    function editar(idc,nombre,idfam){
        document.getElementById("cuerpo").innerHTML="";
        $('#modalEditar').modal('show');
        $("#cuerpo").load("/portafolio/paginas/admin/editarProducto.jsp",{idc,nombre,idfam});
    }
    
</script>

       </body>
    
</html>



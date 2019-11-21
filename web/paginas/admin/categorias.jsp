
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
                                <!-- Modal code goes here-->
<div class="modal fade" tabindex="-1" role="dialog" id="modalAgregar">
  <div class="modal-dialog modal-lg">
    <div class="modal-content">
      <div class="modal-header">
        <h4 class="modal-title loginFontTitle">Agregar Categoria</h4>
      </div>
         <form method="POST" action="/portafolio/agregar">
            <div class="modal-body">
          <div class="row">
              <div class="col-sm-1">
                  <h3 class="modalFont">Nombre:</h3>
              </div>    
              <div class="col-sm-5 pl-4">    
                  <input type="text" name="txtNombre" required/>
              </div>
              <div class="col-sm-1">
                  <h3 class="modalFont">Medida:</h3>
              </div>
              <div class="col-sm-5 pl-4">
                  <select class="custom-select" name="selMedida">
                        <option value="Unidad">Unidad</option>
                        <option value="Kilo">Kilo</option>
                    </select>
              </div>
          </div>
        </div>
      <div class="modal-footer">
            <button type="button" class="btn btn-default" data-dismiss="modal">Cerrar</button>
             <input type="submit" name="agregarCategoria" value="Agregar" class="btn btn-success">
        
      </div>
          </form>
    </div>
  </div>
</div>
<!-- /.modal -->	
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
                                <input type="submit" name="agregarModal" value="Agregar" class="btn-success rounded-pill font-12">
                                </div>
                            </div>

                            <hr>
                                  <table class="table table-bordered">
                                
                                <thead>
                                    <tr>
                                        <th>NOMBRE</th>
                                        <th>MEDIDA</th>  
                                        <th>Productos Asociados</th>
                                        <th>Acciones</th>
                                    </tr>
                                </thead>
                                </thead>
                                <tbody>
                                    <c:forEach var="categorias" items="${listaCategorias.listarTodos()}">
                                        <tr>
                                            <td>${categorias.getNombre()}</td>
                                            <td>${categorias.getMedida()}</td> 
                                            <td>${listaCategorias.cantProductosPorCategoria(categorias.getIdfamilia())}</td>
                                            <td>
                                                    <form method="POST" action="/portafolio/eliminar">
                                                        <input type="submit" name="editarCategoria" value="Editar" class="btn-info rounded-pill font-12">
                                                        <input type="submit" name="eliminarCategoria" value="Eliminar" class="btn-danger rounded-pill font-12">
                                                    </form>
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
	<script type="text/javascript">

$(document).ready(function(){
		$('input[name="agregarModal"]').click(function (e) {
				e.preventDefault();
				
				 var bError=false

				$('#modalAgregar').modal('show');
				return true  
		

		});
	});
	
	</script>
       </body>
    
</html>


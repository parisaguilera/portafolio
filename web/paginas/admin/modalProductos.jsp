<jsp:useBean id="nomcat" class="daoimp.familiaProductoDAOIMP"/>


<!-- Modal AGREGAR-->
<div class="modal fade" tabindex="-1" role="dialog" id="modalAgregar">
  <div class="modal-dialog modal-lg">
    <div class="modal-content">
      <div class="modal-header">
        <h4 class="modal-title loginFontTitle">Agregar Producto</h4>
      </div>
         <form method="POST" action="/portafolio/productosControlador">
            <div class="modal-body">
    <div class="form-row">
    <div class="col-md-4 mb-3">
      <h3 class="modalFont">Nombre</h3>
      <input type="text" name="txtNombre" class="form-control" required>

    </div>
    <div class="col-md-4 mb-3">
       <h3 class="modalFont">Marca</h3>
      <input type="text" name="txtMarca" class="form-control" required>

    </div>
    <div class="col-md-4 mb-3">
       <h3 class="modalFont">Categoria</h3>
       
      <select class="custom-select form-control" name="selCat">
            <c:forEach var="nomcat" items="${nomcat.listarTodos()}">
                <option value="${nomcat.getIdfamilia()}">${nomcat.getNombre()}</option>
             </c:forEach>            
       </select>
    </div>
  </div>
  <div class="form-row">
    <div class="col-md-4 mb-3">
       <h3 class="modalFont">Precio Compra</h3>
      <input type="number" name="numCompra" class="form-control" required>
    </div>
    <div class="col-md-4 mb-3">
       <h3 class="modalFont">Precio Venta</h3>
      <input type="number" name="numVenta" class="form-control" required>
    </div>
    <div class="col-md-4 mb-3">
      <h3 class="modalFont">Fecha Vencimiento</h3>
      <input class="form-control" type="date" name="fechaVen" required>
    </div>
  </div>
<div class="form-row">
    <div class="col-md-4 mb-3">
       <h3 class="modalFont">Stock Inicial</h3>
      <input type="number" name="numStock" class="form-control" required>
    </div>
    <div class="col-md-4 mb-3">
       <h3 class="modalFont">Stock Critico</h3>
      <input type="number" name="numStockCri" class="form-control" required>
    </div>
    <div class="col-md-4 mb-3">
       <h3 class="modalFont">Descripcion</h3>
      <input type="text" name="txtDescripcion" class="form-control" required>
    </div>
  </div>                
        </div>
      <div class="modal-footer">
            <button type="button" class="btn btn-default" data-dismiss="modal">Cerrar</button>
             <input type="submit" name="agregarProducto" value="Agregar" class="btn btn-success">
        
      </div>
          </form>
    </div>
  </div>
</div>
<!-- /.modal -->	
                                <!-- Modal ELIMINAR-->
<div class="modal fade" tabindex="-1" role="dialog" id="modalEliminar">
  <div class="modal-dialog modal-sm">
    <div class="modal-content">
      <div class="modal-header">
        <h4 class="modal-title loginFontTitle">Eliminar Producto</h4>
      </div>
        <form method="POST" action="/portafolio/productosControlador"> 
            <div class="modal-body">
          <div class="row">
                  <!-- El cotenido esta en eliminarCategoria.jsp -->
                  <h3 class="modalEliminar ml-4">¿ Eliminar el producto</h3><h3 class="modalEliminar ml-2" id="contenido"></h3>
          </div>
        </div>
      <div class="modal-footer">
            <button type="button" class="btn btn-default" data-dismiss="modal">Cerrar</button>
             <input type="submit" name="eliminarProducto" value="Eliminar" class="btn btn-danger">
      </div>
      </form>

    </div>
  </div>
</div>
<!-- /.modal -->	
                               <!-- Modal Editar-->
<div class="modal fade" tabindex="-1" role="dialog" id="modalEditar">
  <div class="modal-dialog modal-lg">
      <form method="POST" action="/portafolio/productosControlador">
    <div class="modal-content">
      <div class="modal-header">
             <div class="row">
                  <!-- El cotenido esta en eliminarCategoria.jsp -->
                  <h3 class="loginFontTitle ml-4">Editar el Producto </h3><h3 class="loginFontTitle ml-2" id="titulo"></h3>
          </div>
      </div>
               <div class="modal-body" id="cuerpo">
             
        </div>
      <div class="modal-footer">
            <button type="button" class="btn btn-default" data-dismiss="modal">Cerrar</button>
             <input type="submit" name="editarCategoria" value="Editar" class="btn btn-info">
        
      </div>
         
    </div>
       </form>
  </div>
</div>
<!-- /.modal -->	

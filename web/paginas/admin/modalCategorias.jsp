<!-- Modal AGREGAR-->
<div class="modal fade" tabindex="-1" role="dialog" id="modalAgregar">
  <div class="modal-dialog modal-lg">
    <div class="modal-content">
      <div class="modal-header">
        <h4 class="modal-title loginFontTitle">Agregar Categoria</h4>
      </div>
         <form method="POST" action="/portafolio/categoriasControlador">
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
                        <option value="Unidad">UNIDAD</option>
                        <option value="Kilo">KILO</option>
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
                                <!-- Modal ELIMINAR-->
<div class="modal fade" tabindex="-1" role="dialog" id="modalEliminar">
  <div class="modal-dialog modal-sm">
    <div class="modal-content">
      <div class="modal-header">
        <h4 class="modal-title loginFontTitle">Eliminar Categoria</h4>
      </div>
        <form method="POST" action="/portafolio/categoriasControlador"> 
            <div class="modal-body">
          <div class="row">
                  <!-- El cotenido esta en eliminarCategoria.jsp -->
                  <h3 class="modalEliminar ml-4">¿ Eliminar la categoria</h3><h3 class="modalEliminar ml-2" id="contenido"></h3>
          </div>
        </div>
      <div class="modal-footer">
            <button type="button" class="btn btn-default" data-dismiss="modal">Cerrar</button>
             <input type="submit" name="eliminarCategoria" value="Eliminar" class="btn btn-danger">
      </div>
      </form>

    </div>
  </div>
</div>
<!-- /.modal -->	
                               <!-- Modal Editar-->
<div class="modal fade" tabindex="-1" role="dialog" id="modalEditar">
  <div class="modal-dialog modal-lg">
      <form method="POST" action="/portafolio/categoriasControlador">
    <div class="modal-content">
      <div class="modal-header">
             <div class="row">
                  <!-- El cotenido esta en eliminarCategoria.jsp -->
                  <h3 class="loginFontTitle ml-4">Editar la categoria </h3><h3 class="loginFontTitle ml-2" id="titulo"></h3>
          </div>
      </div>
         
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
                        <option value="Unidad">UNIDAD</option>
                        <option value="Kilo">KILO</option>
                    </select>
              </div>
          </div>
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

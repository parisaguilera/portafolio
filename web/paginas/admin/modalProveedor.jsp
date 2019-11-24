<!-- Modal AGREGAR-->
<div class="modal fade" tabindex="-1" role="dialog" id="modalAgregar">
  <div class="modal-dialog modal-lg">
    <div class="modal-content">
      <div class="modal-header">
        <h4 class="modal-title loginFontTitle">Agregar Proveedor</h4>
      </div>
         <form method="POST" action="/portafolio/proveedorControlador">
            <div class="modal-body">
          <div class="row">
              <div class="col-sm-4">
                  <h3 class="modalFont">Nombre:</h3>
                  <input class="form-control" type="text" name="txtNombre" required/>
              </div>
              <div class="col-sm-4">
                  <h3 class="modalFont">Datos Contacto:</h3>
                  <input  class="form-control" type="text" name="txtContacto" placeholder="+56 ..." required/>
              </div>
              <div class="col-sm-4">
                  <h3 class="modalFont">Rubro:</h3>
                  <input  class="form-control" type="text" name="txtRubro" placeholder="Produccion de ..." required/>
              </div>
          </div>
        </div>
      <div class="modal-footer">
            <button type="button" class="btn btn-default" data-dismiss="modal">Cerrar</button>
             <input type="submit" name="agregarProveedor" value="Agregar" class="btn btn-success">
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
        <h4 class="modal-title loginFontTitle">Eliminar Proveedor</h4>
      </div>
        <form method="POST" action="/portafolio/proveedorControlador"> 
            <div class="modal-body">
          <div class="row">
                  <!-- El cotenido esta en eliminarCategoria.jsp -->
                  <h3 class="modalEliminar ml-4">¿ Eliminar el Proveedor</h3><h3 class="modalEliminar ml-2" id="contenido"></h3>
          </div>
        </div>
      <div class="modal-footer">
            <button type="button" class="btn btn-default" data-dismiss="modal">Cerrar</button>
             <input type="submit" name="eliminarProveedor" value="Eliminar" class="btn btn-danger">
      </div>
      </form>

    </div>
  </div>
</div>
<!-- /.modal -->	
                               <!-- Modal Editar-->
<div class="modal fade" tabindex="-1" role="dialog" id="modalEditar">
  <div class="modal-dialog modal-lg">
      <form method="POST" action="/portafolio/proveedorControlador">
    <div class="modal-content">
      <div class="modal-header">
             <div class="row">
                  <h3 class="loginFontTitle ml-4">Editar el Proveedor </h3><h3 class="loginFontTitle ml-2" id="titulo"></h3>
          </div>
      </div>
            <div class="modal-body">
          <div class="row">
              <div class="col-sm-4">
                  <h3 class="modalFont">Nombre:</h3>
                  <input class="form-control" type="text" name="txtNombre" required/>
              </div>
              <div class="col-sm-4">
                  <h3 class="modalFont">Datos Contacto:</h3>
                  <input  class="form-control" type="text" name="txtContacto" placeholder="+56 ..." required/>
              </div>
              <div class="col-sm-4">
                  <h3 class="modalFont">Rubro:</h3>
                  <input  class="form-control" type="text" name="txtRubro" placeholder="Produccion de ..." required/>
              </div>
          </div>
        </div>
      <div class="modal-footer">
            <button type="button" class="btn btn-default" data-dismiss="modal">Cerrar</button>
             <input type="submit" name="editarProveedor" value="Editar" class="btn btn-info">
        
      </div>
         
    </div>
       </form>
  </div>
</div>
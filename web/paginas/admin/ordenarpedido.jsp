<%@page contentType="text/html" pageEncoding="UTF-8"%>
<jsp:useBean id="proveedor" class="daoimp.proveedorDAOIMP"/>  
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
         <link rel="stylesheet" type="text/css" href="/portafolio/css/productos.css"/>


     </head>
 <%@ include file="/masterpage/menuadmin.jsp" %>                             
        <c:if test="${mensaje!=null}">
            <script>
                alert("${mensaje}");
            </script> 
        </c:if>
     <div class="col">
           <div class="mt-5 card w-100">
                <div class="card-body p-5">
                      <label class="card-title loginFontTitle text-center">Ordenar Pedido</label>
                        <div class="card-text">
                            <div class="card-text row">
                                <p class="col tooltips">* Ordenes por proveedor, esto quiere decir que solo podras ordenar los productos que ofrezca el proveedor.</p>
                            </div>
                            <hr>
                              
                        </div>
                      <form action="/portafolio/paginas/admin/orden.jsp" method="GET">
                         <div class="card-text row text-center">
                                    <div class="col-4 text-right">
                                       <label class="card-title loginFontTitle">Elegir Proveedor:</label>
                                    </div>
                                    <div class="col-4">
                                        
                                       <input class="form-control" id="ordenInput" name="selOrden" list="orden">
                                          <datalist id="orden">
                                              <c:forEach var="prov" items="${proveedor.listarTodos()}">
                                                  
                                                    
                                <option id="${prov.getIdproveedor()}" value="${prov.getNombre()}">${prov.getDatoscontacto()} | ${prov.getRubro()}</option>
                               
                                                     
                                            </c:forEach>
                                        </datalist>
                                        <p class="col tooltips">* Busca tu proveedor por Nombre, contacto o rubro</p>
                                        
                                    </div>
                                    <div class="col-4 text-left mt-1">
                                            <input name="idProv" type="hidden" value="" id="idProveedor" >
                                           <input type="submit" value="Seleccionar" class="btn-primary rounded-pill font-12 mt-2" onclick="redireccion()">
                                    </div>
                           
                            </div>
                        </form>
                 
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
            
           $(function() {
                $('#ordenInput').on('input',function() {
                  var opt = $('option[value="'+$(this).val()+'"]');
                   
                   var final = opt.length ? opt.attr('id') : '0';
                   $("#idProveedor").val(final);
                  console.log(opt.length ? opt.attr('id') : '0');
                 
                });
              });

       </script>


</html>


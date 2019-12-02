
<%@page import="daoimp.productoDAOIMP"%>
<%@page import="daoimp.clienteDAOIMP"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/2.2.4/jquery.min.js"></script>
<jsp:useBean id="nomcat1" class="daoimp.familiaProductoDAOIMP"/>
<jsp:useBean id="productoIMP" class="daoimp.productoDAOIMP"/>  


         <%     
                 
                 String rut = request.getParameter("txtRut");
                 
                 clienteDAOIMP cli = new clienteDAOIMP();
                 
          %>
           
          <c:set var="existe" value="<%= cli.existeRut(rut) %>" />
          <c:set var="cliente" value="<%= cli.clienteFicha(rut) %>" />
          <c:set var="productos" value="${productoIMP.listarTodos()}" />
           
          
          <script>
           $(".loader").fadeOut("slow");
           </script>
         
           
              
            <!-- PRIMER DIV EN DONDE CONFIRMO SI EXISTE EL RUT -->
                                            <c:choose>
                                            <c:when test="${existe==false}">
                                                <div class="card-text text-center row">
                                <p class="col tooltips text-danger">* El RUT ingresado es NUEVO en la plataforma, rellena los datos</p>
                                                </div>
                                                         <div class="row mt-5">
                                                        <div class="col-sm-0 text-right">
                                                          <label class="card-title loginFontTitle">Nombre:</label>
                                                       </div>
                                                       <div class="col">
                                                           <input class="form-control" type="text" name="txtNombre" minlength="8" required>
                                                       </div> 
                                                       <div class="col-sm-0 text-right">

                                                          <label class="card-title loginFontTitle">Contacto:</label>
                                                       </div>
                                                       <div class="col">
                                                           <input class="form-control" type="text" name="txtContacto" minlength="8" maxlength="8" required>
                                                            <p class="col tooltips">* Formato : xxxxxxxx (8 digitos)</p>
                                                       </div>   
                                                        </div>
                                                         <hr>
                                            </c:when>
                                            <c:otherwise>
                                                                          
                                                <div class="row mt-5">
                                                               <div class="col-sm-0 text-right">
                                                                 <label class="card-title loginFontTitle">Nombre:</label>
                                                              </div>
                                                              <div class="col">
                                                                  <input class="form-control" type="text" value="${cliente.getNombre()}" disabled>
                                                              </div> 
                                                              <div class="col-sm-0 text-right">

                                                                 <label class="card-title loginFontTitle">Contacto:</label>
                                                              </div>
                                                              <div class="col">
                                                                  <input class="form-control" type="text" value="${cliente.getContacto()}" disabled>
                                                                   <p class="col tooltips">* Formato : xxxxxxxx (8 digitos)</p>
                                                              </div>   
                                                </div>
                                                 <hr>
                                            </c:otherwise>
                                        </c:choose>
                           
                       <div class="text-center">
                       <label class="loginFontTitle text-info">Registando Venta</label>
                       </div>
                                  <div class="card-text row text-center mt-3">
                                    <div class="col-4 text-right">
                                        <label class="modalFont text-info">Producto:</label>
                                    </div>
                                      
                                    <div class="col-4">
                                        <input class="form-control" name="selProducto" list="productos">
                                          <datalist id="productos">
                                        <c:forEach var="productos" items="${productos}">
                                            <c:set var="idfamiliaPRO" value="${productos.getIdproducto()}" />
                                            <c:set var="productosCategoria" value="${productoIMP.idtonombre(idfamiliaPRO)}" />
                                <option value="${productos.getNombre()}">${productos.getMarca()} | ${productos.getCodigobarra()} | ${productosCategoria}</option>
                                <input id="idfamilia${idfamiliaPRO}" type="hidden" value="${idfamiliaPRO}">
                                            </c:forEach>
                                        </datalist>

                                        <p class="col tooltips">* Puedes ingresar manualmente cualquier tipo de producto</p>
                                    </div>
                                   
                                    <div class="col-4 text-left mt-1">

                                        <input type="submit" name="agregarProducto" value="Agregar" class="btn-success rounded-pill font-12" onclick="agregar()">
                                       
                                    </div>

                            </div>
                                                 <div id="carrito"></div>
                       
                                                 
 <script>

            function agregar(){
            var id =document.getElementById("idfamilia").value;
            document.getElementById("carrito").innerHTML="";
            $("carrito").show();
            $("#carrito").load("/portafolio/paginas/admin/carro.jsp",{id});
            }
       </script>


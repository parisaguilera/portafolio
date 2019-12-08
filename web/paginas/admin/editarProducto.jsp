<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<jsp:useBean id="nomcat1" class="daoimp.familiaProductoDAOIMP"/>
 <script>

             $(function() {
    
             $(".loader").fadeOut("slow");
             
             });
            
            </script>

         <%     
                  int id = Integer.parseInt(request.getParameter("idc"));
                 String nombre = request.getParameter("nombre");
                 int idfam = Integer.parseInt(request.getParameter("idfam"));
          %>
<c:set var="idf" value="<%= idfam %>" />

<div class="form-row">
    <div class="col-md-4 mb-3">
      <h3 class="modalFont">Nombre</h3>
      <input type="text" name="txtNombre" class="form-control" placeholder="<%= nombre %>"required>

    </div>
    <div class="col-md-4 mb-3">
       <h3 class="modalFont">Marca</h3>
      <input type="text" name="txtMarca" class="form-control" required>

    </div>
    <div class="col-md-4 mb-3">
       <h3 class="modalFont">Categoria</h3>
      <select class="custom-select form-control" name="selCat">
            <c:forEach var="nomcat1" items="${nomcat1.listarTodos()}">
         <c:choose>
          <c:when test="${idf==nomcat1.getIdfamilia()}">
               <option selected value="${nomcat1.getIdfamilia()}">${nomcat1.getNombre()}</option>
          </c:when>
          <c:otherwise>
           <option value="${nomcat1.getIdfamilia()}">${nomcat1.getNombre()}</option>
              </c:otherwise>
          </c:choose>    
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

          <input value="<%= id %>" type="hidden" name="numId"/> 

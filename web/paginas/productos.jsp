<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
     <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Almacen</title>
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
        <link href="https://fonts.googleapis.com/css?family=Varela+Round&display=swap" rel="stylesheet">
        <link href="https://fonts.googleapis.com/css?family=Lobster+Two&display=swap" rel="stylesheet">
        <link rel="stylesheet" type="text/css" href="/portafolio/css/productos.css"/>
        <link href="https://fonts.googleapis.com/css?family=Poppins&display=swap" rel="stylesheet">
        <script defer src="/portafolio/js/all.js"></script> <!--load all styles -->

     </head>
    <header>
        <%@ include file="/masterpage/menu.jsp" %>
    </header>
    <body>
        <div class="midContainer midColor ">
            <div class="text-center">
                <hr>
         <label class="loginFontTitle"><%= request.getAttribute("nombre") %></label>
                 <hr>
            </div>
        <c:choose>
              <c:when test="${productos.size()== 0}">
                  <div class="text-center">
                  <label class="loginFontTitle pt-5">CATEGORIA SIN PRODUCTOS</label>
                  </div>
              </c:when>
           <c:otherwise>
                <div class="wrapper fixmid">
            <c:forEach var="pro" items="${productos}">
                 <div class="productos">
                     <form method="post" action="productos">
                     <div class="row">
                         <div class="col">
                <img src="/portafolio/img/nodisponible.jpg">
                         </div>
                         <div class="col toLeft">
                <p class="productoCod">Codigo de Barra: ${pro.getCodigobarra()}</p>
                <p class="productoPre">$ ${pro.getPrecioventa()}</p>
                <p class="productoCod">Stock: ${pro.getStock()}</p>
                         </div>
                     </div>
                   <div class="row">      
                <div class="col-8">
                <div class="rightInfo">
                    <div class="displayFlex">
                    <p class="productoName">${pro.getNombre()}</p>
                    <p class="productoMar">${pro.getMarca()} ®</p>
                    </div>
                    <p class="productoDes">${pro.getDescripcion()}</p><br>
                </div>
                </div>

                   </div>
                     </form>
                 </div>
               </c:forEach>
                 </div>
        </div> 
         </c:otherwise>
    </c:choose> 
    </body>
</html>
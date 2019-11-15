<%-- 
    Document   : menu
    Created on : 05-11-2019, 1:37:10
    Author     : parisbastian
--%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<jsp:useBean id="lista" class="daoimp.familiaProductoDAOIMP"/>  
<!DOCTYPE html>
<link rel="stylesheet" type="text/css" href="/portafolio/css/estilos.css"/>
<link rel="stylesheet" type="text/css" href="/portafolio/css/bootstrap.css"/>
<script defer src="/portafolio/js/all.js"></script> <!--load all styles -->
    <div class="navegador">
        <nav class="navbar bg-secondary">    
            <li class="col-sm dropdownx"><a class="fontstyle" href="#" id="navbarDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">Categorias <i class="fas fa-caret-down"></i></a>
                <div class="dropdown-contentx  bg-secondary">
                    <c:forEach var="categorias" items="${lista.listarTodos()}">
                        <a href="/portafolio/productos?categoria=${categorias.getIdfamilia()}&nombre=${categorias.getNombre()}"><p class="dropstyle">${categorias.getNombre()}</p></a>
                    </c:forEach>             
                </div></li>
            <li class="col-sm fixpos"><a class="middle"><i class="fab fa-slideshare"></i> Almacen Yuyita</a></li>
            <li class="col-sm-2 text-right"><a class="fontstyle" href="/portafolio/paginas/deudas.jsp">Ver Deudas <i class="far fa-address-book"></i></a></li>
            <li class="col-sm-0 text-left"><a class="fontstyle" href="/portafolio/paginas/login.jsp">Login <i class="fas fa-sign-in-alt"></i></a></li>
            <%-- <li class="text-left"><a class="fontstyle" href="/portafolio/paginas/carrito.jsp">Mi Carro<span class="label label-info">0</span> <i class="fas fa-shopping-cart"></i></a></li>--%>
        </nav>            
  </div>

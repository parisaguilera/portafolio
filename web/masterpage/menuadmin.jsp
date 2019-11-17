<%@page import="dto.usuarioDTO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<jsp:useBean id="lista" class="daoimp.familiaProductoDAOIMP"/>  
<!DOCTYPE html>
<link rel="stylesheet" type="text/css" href="/portafolio/css/estilos.css"/>
<link rel="stylesheet" type="text/css" href="/portafolio/css/bootstrap.css"/>
<script defer src="/portafolio/js/all.js"></script> <!--load all styles -->
        <%
      usuarioDTO usuario = (usuarioDTO) session.getAttribute("usuario");
        %>
    <div class="navegador">
        <nav class="navbar bg-secondary">    
           <%-- <li class="col-sm dropdownx"><a class="fontstyle" href="#" id="navbarDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">Categorias <i class="fas fa-caret-down"></i></a>
                <div class="dropdown-contentx  bg-secondary">
                    <c:forEach var="categorias" items="${lista.listarTodos()}">
                        <a href="/portafolio/productos?categoria=${categorias.getIdfamilia()}&nombre=${categorias.getNombre()}"><p class="dropstyle">${categorias.getNombre()}</p></a>
                    </c:forEach>             
                </div></li> --%>
           <li class="col-sm fixli"><a class="fontstyle" href="/portafolio/paginas/administracion.jsp"><i class="fas fa-cog"></i> Configuracion</a></li>
            <li class="col-sm fixpos"><a class="middle"><i class="fab fa-slideshare"></i> Almacen Yuyita</a></li>
              <li class="col-sm-2 text-right dropdownx"><a class="fontstyle" href="#" id="navbarDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
               <p class="sesionstyle">Bienvenida/o: <%= usuario.getNombre()%></p>
              <p class="sesionstyle"><i class="fas fa-users-cog"></i> <%= usuario.getCargo()%></p>
               </a>
                <div class="dropdown-sesion ">
                        <a href="#"><p class="sesionstyle">Cerrar Sesion</p></a>         
                </div></li>
            <%-- <li class="text-left"><a class="fontstyle" href="/portafolio/paginas/carrito.jsp">Mi Carro<span class="label label-info">0</span> <i class="fas fa-shopping-cart"></i></a></li>--%>
        </nav>
  </div>
       <body>
<div class="container-fluid">
    <div class="row">
        <div class="col-sm-2 px-1 bg-light min-vh-100">
            <div class="py-2 sticky-top flex-grow-1">
                <div class="pl-3 nav flex-sm-column">
                    <%-- primera seccion--%>
                    <p class="pt-5 sidebarFont"><i class="fas fa-store-alt"></i> Productos</p>
                    <a href="" class="pl-5 mt-2 sidebarFont-item"><i class="fas fa-arrow-circle-right"></i> Categorias</a>
                    <a href="" class="pl-5 sidebarFont-item"><i class="fas fa-arrow-circle-right"></i> Productos</a>
                    <%-- siguiente seccion del sidebar--%>
                    <p class="pt-5 sidebarFont"><i class="fas fa-user-friends"></i> Cliente</p>
                    <a href="" class="pl-5 mt-2 sidebarFont-item"><i class="fas fa-arrow-circle-right"></i> Registrar Cliente</a>
                    <a href="" class="pl-5 sidebarFont-item"><i class="fas fa-arrow-circle-right"></i> Registrar Venta</a>
                    <a href="" class="pl-5 sidebarFont-item"><i class="fas fa-arrow-circle-right"></i> Fiados</a>
                    <%-- siguiente seccion del sidebar--%>
                    <p class="pt-5 sidebarFont"><i class="fas fa-boxes"></i> Proveedores</p>
                    <a href="" class="pl-5 mt-2 sidebarFont-item"><i class="fas fa-arrow-circle-right"></i> Registrar Proovedor</a>
                    <a href="" class="pl-5 sidebarFont-item"><i class="fas fa-arrow-circle-right"></i> Ordenar Pedido</a>
                    <a href="" class="pl-5 sidebarFont-item"><i class="fas fa-arrow-circle-right"></i> Recepcion</a>
                    <%-- siguiente seccion del sidebar--%>
                    <p class="pt-5 sidebarFont"><i class="fas fa-clipboard"></i> Informe y Estadisticas</p>
                    <a href="" class="pl-5 mt-2 sidebarFont-item"><i class="fas fa-arrow-circle-right"></i> Informes</a>
                    <a href="" class="pl-5 sidebarFont-item"><i class="fas fa-arrow-circle-right"></i> Estadisticas</a>
                    <a href="" class="pl-5 sidebarFont-item"><i class="fas fa-arrow-circle-right"></i> Visitas Recibidas</a>
                </div>
            </div>
        </div>
       
                
            

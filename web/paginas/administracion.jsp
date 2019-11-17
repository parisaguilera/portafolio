<%@page import="dto.usuarioDTO"%>
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
        <link rel="stylesheet" type="text/css" href="/portafolio/css/configuracion.css"/>
        <script defer src="../js/all.js"></script> <!--load all styles -->
        <link href="https://fonts.googleapis.com/css?family=Poppins&display=swap" rel="stylesheet">
     </head>
        <%@ include file="/masterpage/menuadmin.jsp" %>
     <div class="col" id="main">
           <div class="mt-5 card w-100">
                <div class="card-body p-5">
                      <label class="card-title loginFontTitle text-center">Bienvenido <%= usuario.getNombre()%> !</label>
                        <div class="card-text">
                            <p class="textoExplicativo">
                                Esta es la interfaz de configuracion y gestion del Almacen Yuyita.
                            </p>
                            <p class="textoExplicativo mt-5">
                                 En el Sidebar de la izquierda podras :
                            </p>
                            <hr>
                            <p class="textoExplicativo mt-4">
                                Administracion de PRODUCTOS:
                            </p>
                             <p class="textoExplicativo mt-2 pl-5">
                                    Categorias:
                             </p>
                             <p class="textoExplicativoSub mt-2 pl-5 ml-5">
                               <i class="fas fa-angle-double-right"></i> CRUD Categorias <br>                                 
                             </p>
                              <p class="textoExplicativo mt-2 pl-5">
                                   Productos:
                             </p>
                             <p class="textoExplicativoSub mt-2 pl-5 ml-5">
                               <i class="fas fa-angle-double-right"></i> CRUD Productos <br>                                 
                             </p>
                             <hr>
                        </div>
                        
            </div>
            </div>
    </div>
</div>
       </body>
    
</html>

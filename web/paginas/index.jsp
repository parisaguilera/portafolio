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
        <script defer src="../js/all.js"></script> <!--load all styles -->
        <link href="https://fonts.googleapis.com/css?family=Poppins&display=swap" rel="stylesheet">
        <link rel="stylesheet" type="text/css" href="/portafolio/css/slider.css"/>
          <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>


     </head>
    <header>
        <%@ include file="/masterpage/menu.jsp" %>
    </header>         
    <body>
            <div class="container midColor">
        <div class="container-fluid mt-5">
            <div class="largoAncho border">
  <div id="myCarousel" class="carousel slide border" data-ride="carousel">

    <!-- Wrapper for slides -->
    <div class="carousel-inner border text-center">
        
      <div class="item active largoAncho border ">
          
           <img src="../img/frutas.jpg">
        <h1>hola</h1>
      </div>

      <div class="item largoAncho border">
        <img src="../img/frutas.jpg">
      </div>
    
      <div class="item largoAncho border">
         <img src="../img/frutas.jpg">
      </div>
  
    </div>

    <!-- Left and right controls -->
    <a class="fixborder left carousel-control" href="#myCarousel" data-slide="prev">
      <span class="glyphicon glyphicon-chevron-left"></span>
     
    </a>
    <a class="fixborder right carousel-control" href="#myCarousel" data-slide="next">
      <span class="glyphicon glyphicon-chevron-right"></span>
      <span class="sr-only">Next</span>
    </a>
  </div>
        </div>
            <div class="text-center mt-5 mb-5">
                <hr>
                <label class="menuProveedorTitle ">Proveedores</label>
                <hr class="mb-5">
                <div class="row">
                   <div class="col-4">
                    <img  class="img-fluid imgProveedor border" src="../img/proveedor.jpg">
                    <p class="menuProveedor">Limpia Todo</p>
                </div>
                
                <div class="col-4">
                    <img  class="img-fluid imgProveedor border" src="../img/proveedor.jpg">
                    <p class="menuProveedor">CCU</p>
                </div>
                     <div class="col-4">
                     <img class="img-fluid imgProveedor border" src="../img/proveedor.jpg" >
                    <p class="menuProveedor">Dis. El Cielo</p>
                </div>
                </div>
            </div>
            
</div>
              
        </div>
          <div class="row footer pl-5 mt-5 bg-secondary ">
                <div class="col-9 mt-5">
                     <p class="footerP">Portafolio de Titulo, Duoc UC 2019. Una experiencia en la cual aprendi mucho! espero que nos saquemos un 7.</p>
                     <p class="footerP">Proyecto codeado por <strong><u>Paris Aguilera.</u></strong></p>
                </div>
                
                <div class="col-3 mt-5">
                    <label class="middle"><i class="fab fa-slideshare"></i> Almacen Yuyita</label>
                    
                </div>
                
                
            </div>
    </div>
    </body>
</html>
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

     </head>
    <header>
        <%@ include file="/masterpage/menu.jsp" %>
    </header>         
    <body>
        <c:if test="${mensaje!=null}">
            <script>
                alert("${mensaje}");
            </script> 
        </c:if>
        <div class="container-fluid midColor">
            <div class="row justify-content-center">
            <div class="card cardLogin">
                <div class="card-body">
                 <form class="d-content pull-right" method="POST" action="/portafolio/login">  
                    <div class="mid">
                   <label class="loginFontTitle text-center">¡Bienvenido al Almacen!</label>
                   <div>
                       <i class="fab fa-slideshare logo "></i></div>
                    </div>
                    <div class="m-50">
                      
                    <table>
                        <tbody>
                            <tr>
                                
                                <td><input class="loginFont" placeholder=" Usuario" type="text" name="txtUsuario" value="" size="30" required/></td>
                            </tr>
                            <tr>
                               
                                <td><input class="loginFont" placeholder=" Contraseña" type="password" name="txtContrasena" value="" size="30" required/></td>
                            </tr>
                        </tbody>
                    </table>
                    </div>
                    <div class="mid">
                        <input  class="btn-primary rounded-pill font-12 mt-5 loginFontButton" type="submit" name="btnLogin" value="Iniciar Sesion"/>
                    </div>
                 </form>
                    </div>
            </div>
        </div>
        </div>
    </body>
</html>
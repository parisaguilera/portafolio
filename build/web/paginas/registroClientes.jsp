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
        <div class="container-fluid midColor">
            <div class="row justify-content-center">
                <div class="card cardRegistro">
                    <div class="left">
                   <label class="loginFontTitle text-center">Tus Datos:</label>
                   <div>
                    <div class="m-50 row">
                        <div class="col-4">
                                <label class="loginFont">*Usuario</label>
                         </div>
                        <div class="col">
                                <input class="loginFont" placeholder="" type="text" name="txtUsuario" value="" size="30"/>
                        </div>
                        <div class="w-100 mt-1"></div>
                        <div class="col-4">
                                <label class="loginFont">Direccion</label>
                        </div>
                        <div class="col">
                                <input class="loginFont" placeholder=" " type="text" name="txtDireccion" value="" size="30"/>
                        </div>
                         <div class="w-100 mt-1"></div>
                        <div class="col-4">
                                <label class="loginFont">Telefono</label>
                        </div>
                        <div class="col">
                                <input class="loginFont" placeholder="" type="text" name="txtTelefono" value="" size="30"/>
                        </div>
                        <div class="w-100 mt-5"></div>
                        <div class="col-4">
                                <label class="loginFont">*Contraseña</label>
                        </div>
                        <div class="col">
                                <input class="loginFont" placeholder="" type="password" name="txtContrasena" value="" size="30"/>
                        </div>
                        <div class="w-100"></div>
                        <div class="col-4">
                                <label class="loginFont">*Reingresar Contraseña</label>
                        </div>
                        <div class="col">
                                <input class="loginFont" placeholder=" " type="password" name="txtContrasena" value="" size="30"/>
                        </div>
                         <div class="w-100 m-50"></div>
                        <div class="col pt-5">
                                <p class="camposObli text-muted">* Campos Obligatorios</label>
                        </div>
                        <div class="col mb-2">
             <button class="buttonRegistro btn btn-primary mt-5" type="submit" name="btnRegistro"><h1 class="loginFontButton">Registrarme!</h1></button>
                        </div>
                    </div>
                    </div>
                </div>
        </div>
    </body>
</html>

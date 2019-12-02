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
                      <label class="card-title loginFontTitle text-center">Registar Venta</label>
                        <div class="card-text">
                            <div class="card-text row">
                                <p class="col tooltips">* Clientes nuevos se deberan registrar</p>
                            </div>
                                <div class="card-text row">
                                <p class="col tooltips">* Los productos que no sean legibles deben ser ingresados manualmente</p>
                                </div>
                            <hr>
                              
                        </div>
                         <div class="card-text row text-center">
                                    <div class="col-4 text-right">
                                       <label class="card-title loginFontTitle">Ingresar Rut:</label>
                                    </div>
                                    <div class="col-4">
                                        <input class="form-control" id="rut" type="text" name="txtRut" maxlength="8" minlength="8">
                                        <p class="col tooltips">* Solamente los primeros 8 numeros sin guion</p>
                                    </div>
                                    <div class="col-4 text-left mt-1">
                                           <input type="submit" name="ingresarVenta" value="Vender" class="btn-primary rounded-pill font-12" onclick="test()">
                                    </div>
                            </div>
                      
                      <div class="card-text row text-center">
                             <div class="loader" id="loader" style="display:none;"></div>
                                    <div class="container-fluid" id="existeCliente">
                                   
                                   
                                    </div>
                            </div>

       
            </div>
        
    </div>
</div>
</div>
       </body>
       <script>

            function test(){
    
            document.getElementById("existeCliente").innerHTML="";
            var txtRut =document.getElementById("rut").value;
            $("existeCliente").show();
             $(".loader").fadeIn("slow");
            $("#existeCliente").load("/portafolio/paginas/admin/ventarut.jsp",{txtRut});
            }
       </script>


</html>



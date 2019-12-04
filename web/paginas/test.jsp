
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<jsp:useBean id="cliente" class="daoimp.clienteDAOIMP" />
<jsp:useBean id="boleta" class="daoimp.boletaDAOIMP" />
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <h1>${cliente.nuevoIDcliente()}</h1>
        <h1>${cliente.rutAID("12312131")}</h1>
        <h1>${boleta.nuevoIDboleta()}</h1>
        <form method="POST" action="/portafolio/test">
            
             <label>¿Quiere optar por FIADO? <input type="checkbox" name="checkFiado" value="0"></label>
             <input type="submit" name="finalizarVenta" value="Registrar Venta" class="btn-success rounded-pill">
        </form>
    </body>
</html>

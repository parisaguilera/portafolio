
<%@page import="daoimp.ordenPedidoDAOIMP"%>
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
         <% 
                              ordenPedidoDAOIMP ord = new ordenPedidoDAOIMP();
                              
                            int iterator = ord.totalOrdenes();
                            System.out.println(iterator);
                            %>
                            
                        <%= iterator %>
    <c:forEach varbegin = "1" end = "8">
        NUMERO -
                                                <c:forEach var = "j" begin = "1" end = "3">
                                                    Dentro numero -
                                                </c:forEach>
    </c:forEach>
        <form method="POST" action="/portafolio/test">
            
             <label>¿Quiere optar por FIADO? <input type="checkbox" name="checkFiado" value="0"></label>
             <input type="submit" name="finalizarVenta" value="Registrar Venta" class="btn-success rounded-pill">
        </form>
    </body>
</html>

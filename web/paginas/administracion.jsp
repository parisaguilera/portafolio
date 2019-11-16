<%@page import="dto.usuarioDTO"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
       <%
           
      usuarioDTO usuario = (usuarioDTO) session.getAttribute("usuario");
        %>
         <h1><%= usuario.getIdusuario()%></h1>
         <h1><%= usuario.getNombre()%></h1>
         <h1><%= usuario.getCargo()%></h1>
        <h1><%= usuario.getContrasena()%></h1>
    </body>
    
</html>

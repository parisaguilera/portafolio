
<%@page import="daoimp.clienteDAOIMP"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/2.2.4/jquery.min.js"></script>

         <%     
                 
                 String rut = request.getParameter("txtRut");
                 
                 clienteDAOIMP cli = new clienteDAOIMP();
          %>
           
          <c:set var="existe" value="<%= cli.existeRut(rut) %>" />
          ${existe}
          
          <script>
           $(".loader").fadeOut("slow");
           </script>
<%@page import="daoimp.familiaProductoDAOIMP"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

         <%     
                  familiaProductoDAOIMP familia = new familiaProductoDAOIMP();
                  int id = Integer.parseInt(request.getParameter("id"));
                  String nombre = familia.idtonombre(id);
                  
                  
                  
          %>
      
          <h3 class="modalFont ml-4">Eliminar la categoria <%= nombre %> ?</h3>
          <input value="<%= id %>" type="hidden" name="numId"/> 
  
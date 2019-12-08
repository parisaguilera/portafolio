<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

         <%     
                  int id = Integer.parseInt(request.getParameter("idc"));
                 String nombre = request.getParameter("nombre");
          %>
          <%=nombre %> ?
          <input value="<%= id %>" type="hidden" name="numId"/> 
  